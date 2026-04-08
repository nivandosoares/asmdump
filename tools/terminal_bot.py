#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import pty
import re
import select
import shlex
import shutil
import socket
import subprocess
import sys
import termios
import time
import uuid
from dataclasses import dataclass
from pathlib import Path
from typing import Any


SCRIPT_PATH = Path(__file__).resolve()
TOOLS_DIR = SCRIPT_PATH.parent
DEFAULT_SESSION_ROOT = TOOLS_DIR / "out" / "terminal_bot_sessions"
DEFAULT_SOCKET_ROOT = Path("/tmp/td2_terminal_bot")
DEFAULT_SHELL = os.environ.get("SHELL") or "/bin/bash"
META_VERSION = 1
WAIT_POLL_SECONDS = 0.1
ANSI_ESCAPE_RE = re.compile(r"\x1b\[[0-?]*[ -/]*[@-~]")
CURRENT_SESSION_FILENAME = "current_session.json"
CURRENT_SESSION_ALIASES = {"@current", "current"}


def now_epoch() -> float:
    return time.time()


def generate_session_id() -> str:
    stamp = time.strftime("%Y%m%d_%H%M%S")
    return f"session_{stamp}_{uuid.uuid4().hex[:8]}"


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )


def read_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def current_session_path(session_root: Path) -> Path:
    return session_root / CURRENT_SESSION_FILENAME


def save_current_session(session_root: Path, session_id: str) -> None:
    write_json(
        current_session_path(session_root),
        {
            "session_id": session_id,
            "updated_at": now_epoch(),
        },
    )


def load_current_session_id(session_root: Path) -> str:
    path = current_session_path(session_root)
    if not path.exists():
        raise FileNotFoundError("no shared current session pointer exists yet")
    payload = read_json(path)
    session_id = str(payload.get("session_id") or "").strip()
    if not session_id:
        raise RuntimeError(f"shared current session pointer {path} is invalid")
    return session_id


def resolve_session_id(session_root: Path, session_id: str) -> str:
    if session_id in CURRENT_SESSION_ALIASES:
        return load_current_session_id(session_root)
    return session_id


def decode_bytes(data: bytes) -> str:
    return data.decode("utf-8", errors="replace")


def encode_text(text: str) -> bytes:
    return text.encode("utf-8")


def parse_env_assignment(raw: str) -> tuple[str, str]:
    if "=" not in raw:
        raise ValueError(f"invalid env override {raw!r}; expected NAME=value")
    name, value = raw.split("=", 1)
    if not name:
        raise ValueError(f"invalid env override {raw!r}; empty variable name")
    return name, value


def load_meta(session_root: Path, session_id: str) -> dict[str, Any]:
    session_id = resolve_session_id(session_root, session_id)
    meta_path = session_root / session_id / "meta.json"
    if not meta_path.exists():
        raise FileNotFoundError(f"session {session_id!r} does not exist")
    return read_json(meta_path)


def resolve_timeout(raw: float | None) -> float | None:
    if raw is None or raw <= 0:
        return None
    return raw


def sanitize_terminal_text(text: str) -> str:
    return ANSI_ESCAPE_RE.sub("", text).replace("\r", "")


def read_log_text(
    log_path: Path,
    start_offset: int,
    end_offset: int | None = None,
    max_bytes: int | None = None,
    *,
    raw: bool = False,
) -> tuple[str, int]:
    if not log_path.exists():
        return "", start_offset
    with log_path.open("rb") as handle:
        handle.seek(start_offset)
        remaining = None
        if end_offset is not None:
            remaining = max(end_offset - start_offset, 0)
        if max_bytes is not None:
            remaining = max_bytes if remaining is None else min(remaining, max_bytes)
        data = handle.read() if remaining is None else handle.read(remaining)
        next_offset = handle.tell()
    text = decode_bytes(data)
    return (text if raw else sanitize_terminal_text(text)), next_offset


def shell_argv(shell: str, login: bool) -> list[str]:
    shell_name = Path(shell).name
    if shell_name == "bash":
        return [shell, "-l", "-s"] if login else [shell, "--noprofile", "--norc", "-s"]
    if shell_name == "zsh":
        return [shell, "-l", "-s"] if login else [shell, "-f", "-s"]
    return [shell, "-l", "-s"] if login else [shell, "-s"]


def request(session_meta: dict[str, Any], payload: dict[str, Any]) -> dict[str, Any]:
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        sock.connect(session_meta["socket_path"])
        sock.sendall(encode_text(json.dumps(payload) + "\n"))
        sock.shutdown(socket.SHUT_WR)
        chunks: list[bytes] = []
        while True:
            data = sock.recv(65536)
            if not data:
                break
            chunks.append(data)
    finally:
        sock.close()
    if not chunks:
        raise RuntimeError("empty response from session server")
    response = json.loads(decode_bytes(b"".join(chunks)))
    if not response.get("ok", False):
        raise RuntimeError(response.get("error", "session server error"))
    return response


def best_effort_status(session_root: Path, session_id: str) -> dict[str, Any]:
    meta = load_meta(session_root, session_id)
    if meta.get("alive") and Path(meta["socket_path"]).exists():
        try:
            return request(meta, {"action": "status"})
        except OSError:
            pass
        except RuntimeError:
            pass
    return {
        "ok": True,
        "session_id": meta["session_id"],
        "alive": bool(meta.get("alive")),
        "ready": bool(meta.get("ready")),
        "cwd": meta.get("cwd"),
        "shell_pid": meta.get("shell_pid"),
        "server_pid": meta.get("server_pid"),
        "shell_exit_code": meta.get("shell_exit_code"),
        "pending_command": None,
        "log_path": meta["log_path"],
        "socket_path": meta["socket_path"],
    }


@dataclass
class CommandState:
    command_id: str
    command_text: str
    script_path: str
    marker_prefix: bytes
    start_offset: int
    started_at: float
    scan_tail: bytes
    completed: bool = False
    exit_code: int | None = None
    end_offset: int | None = None
    shell_exited: bool = False

    def payload(self) -> dict[str, Any]:
        return {
            "command_id": self.command_id,
            "command_text": self.command_text,
            "start_offset": self.start_offset,
            "started_at": self.started_at,
            "completed": self.completed,
            "exit_code": self.exit_code,
            "end_offset": self.end_offset,
            "shell_exited": self.shell_exited,
        }


class SessionServer:
    def __init__(
        self,
        *,
        session_id: str,
        session_dir: Path,
        socket_path: Path,
        shell: str,
        cwd: Path,
        env_overrides: dict[str, str],
        login: bool,
    ) -> None:
        self.session_id = session_id
        self.session_dir = session_dir
        self.socket_path = socket_path
        self.shell = shell
        self.cwd = cwd
        self.env_overrides = env_overrides
        self.login = login
        self.created_at = now_epoch()
        self.meta_path = self.session_dir / "meta.json"
        self.log_path = self.session_dir / "output.log"
        self.server_log_path = self.session_dir / "server.log"
        self.server_socket: socket.socket | None = None
        self.shell_proc: subprocess.Popen[bytes] | None = None
        self.master_fd: int | None = None
        self.log_file: Any = None
        self.log_size = 0
        self.current_command: CommandState | None = None

    def write_meta(self, *, ready: bool, alive: bool, shell_exit_code: int | None) -> None:
        shell_pid = self.shell_proc.pid if self.shell_proc is not None else None
        payload = {
            "version": META_VERSION,
            "session_id": self.session_id,
            "session_dir": str(self.session_dir),
            "socket_path": str(self.socket_path),
            "log_path": str(self.log_path),
            "server_log_path": str(self.server_log_path),
            "shell": self.shell,
            "shell_argv": shell_argv(self.shell, self.login),
            "cwd": str(self.cwd),
            "created_at": self.created_at,
            "ready": ready,
            "alive": alive,
            "server_pid": os.getpid(),
            "shell_pid": shell_pid,
            "shell_exit_code": shell_exit_code,
        }
        write_json(self.meta_path, payload)

    def start_shell(self) -> None:
        env = os.environ.copy()
        env.setdefault("TERM", "xterm-256color")
        env["PS1"] = ""
        env["PROMPT_COMMAND"] = ""
        env.update(self.env_overrides)
        master_fd, slave_fd = pty.openpty()
        tty_attrs = termios.tcgetattr(slave_fd)
        tty_attrs[3] &= ~termios.ECHO
        termios.tcsetattr(slave_fd, termios.TCSANOW, tty_attrs)
        os.set_blocking(master_fd, False)
        try:
            self.shell_proc = subprocess.Popen(
                shell_argv(self.shell, self.login),
                cwd=self.cwd,
                env=env,
                stdin=slave_fd,
                stdout=slave_fd,
                stderr=slave_fd,
                close_fds=True,
                start_new_session=True,
            )
        finally:
            os.close(slave_fd)
        self.master_fd = master_fd
        self.log_file = self.log_path.open("ab", buffering=0)
        time.sleep(0.05)
        self.drain_pty_now()

    def write_to_pty(self, text: str) -> None:
        if self.master_fd is None:
            raise RuntimeError("pty is not ready")
        os.write(self.master_fd, encode_text(text))

    def scan_command_output(self, data: bytes, offset_before: int) -> None:
        command = self.current_command
        if command is None or command.completed:
            return
        combined = command.scan_tail + data
        combined_start = offset_before - len(command.scan_tail)
        marker_index = combined.find(command.marker_prefix)
        if marker_index == -1:
            keep = len(command.marker_prefix) + 32
            command.scan_tail = combined[-keep:]
            return
        after_marker = combined[marker_index + len(command.marker_prefix) :]
        newline_index = after_marker.find(b"\n")
        if newline_index == -1:
            command.scan_tail = combined[marker_index:]
            return
        exit_text = after_marker[:newline_index].strip()
        try:
            command.exit_code = int(exit_text.decode("ascii"))
        except ValueError:
            command.exit_code = None
        command.completed = True
        command.end_offset = combined_start + marker_index
        command.scan_tail = b""
        script_path = Path(command.script_path)
        if script_path.exists():
            script_path.unlink()

    def read_pty_once(self) -> bool:
        if self.master_fd is None:
            return False
        try:
            data = os.read(self.master_fd, 65536)
        except BlockingIOError:
            return False
        except OSError:
            return False
        if not data:
            return False
        offset_before = self.log_size
        self.log_file.write(data)
        self.log_size += len(data)
        self.scan_command_output(data, offset_before)
        return True

    def drain_pty_now(self) -> None:
        if self.master_fd is None:
            return
        while True:
            readable, _, _ = select.select([self.master_fd], [], [], 0)
            if not readable:
                return
            if not self.read_pty_once():
                return

    def pump_once(self, timeout: float) -> None:
        if self.master_fd is None:
            return
        if self.shell_proc is not None and self.shell_proc.poll() is not None:
            self.mark_shell_exit(self.shell_proc.returncode)
            return
        readable, _, _ = select.select([self.master_fd], [], [], timeout)
        if readable:
            self.read_pty_once()
        if self.shell_proc is not None and self.shell_proc.poll() is not None:
            self.drain_pty_now()
            self.mark_shell_exit(self.shell_proc.returncode)

    def mark_shell_exit(self, exit_code: int | None) -> None:
        if self.current_command is not None and not self.current_command.completed:
            self.current_command.completed = True
            self.current_command.shell_exited = True
            self.current_command.end_offset = self.log_size
        self.write_meta(ready=False, alive=False, shell_exit_code=exit_code)

    def begin_exec(self, command_text: str) -> dict[str, Any]:
        if self.current_command is not None and not self.current_command.completed:
            raise RuntimeError(
                f"command {self.current_command.command_id} is still running; "
                "wait for it or interrupt the session first"
            )
        self.drain_pty_now()
        command_id = uuid.uuid4().hex[:12]
        script_path = self.session_dir / f"cmd_{command_id}.sh"
        payload = command_text if command_text.endswith("\n") else command_text + "\n"
        script_path.write_text(payload, encoding="utf-8")
        os.chmod(script_path, 0o600)
        marker_prefix = f"\n__TD2_TERMINAL_BOT_END_{command_id}__:".encode("ascii")
        self.current_command = CommandState(
            command_id=command_id,
            command_text=command_text,
            script_path=str(script_path),
            marker_prefix=marker_prefix,
            start_offset=self.log_size,
            started_at=now_epoch(),
            scan_tail=b"",
        )
        shell_text = (
            f". {shlex.quote(str(script_path))}\n"
            "__td2_terminal_bot_ec=$?\n"
            f"printf '\\n__TD2_TERMINAL_BOT_END_{command_id}__:%s\\n' "
            '"$__td2_terminal_bot_ec"\n'
            "unset __td2_terminal_bot_ec\n"
            f"rm -f {shlex.quote(str(script_path))}\n"
        )
        self.write_to_pty(shell_text)
        return {
            "ok": True,
            "session_id": self.session_id,
            **self.current_command.payload(),
            "log_path": str(self.log_path),
        }

    def wait_for_command(self, command_id: str, timeout: float | None) -> dict[str, Any]:
        if self.current_command is None or self.current_command.command_id != command_id:
            raise RuntimeError(f"unknown command {command_id!r}")
        deadline = None if timeout is None else time.monotonic() + timeout
        while not self.current_command.completed:
            if deadline is not None and time.monotonic() >= deadline:
                break
            remaining = WAIT_POLL_SECONDS
            if deadline is not None:
                remaining = min(remaining, max(deadline - time.monotonic(), 0))
            self.pump_once(remaining)
        return {
            "ok": True,
            "session_id": self.session_id,
            **self.current_command.payload(),
            "done": self.current_command.completed,
        }

    def current_status(self) -> dict[str, Any]:
        shell_pid = self.shell_proc.pid if self.shell_proc is not None else None
        cwd = None
        if shell_pid is not None:
            cwd_link = Path(f"/proc/{shell_pid}/cwd")
            try:
                cwd = os.readlink(cwd_link)
            except OSError:
                cwd = str(self.cwd)
        return {
            "ok": True,
            "session_id": self.session_id,
            "alive": self.shell_proc is not None and self.shell_proc.poll() is None,
            "ready": True,
            "cwd": cwd,
            "shell_pid": shell_pid,
            "server_pid": os.getpid(),
            "shell_exit_code": (
                None if self.shell_proc is None else self.shell_proc.poll()
            ),
            "pending_command": (
                None
                if self.current_command is None
                else self.current_command.payload()
            ),
            "log_path": str(self.log_path),
            "socket_path": str(self.socket_path),
        }

    def close_session(self, force: bool) -> dict[str, Any]:
        if self.shell_proc is None:
            return {"ok": True, "session_id": self.session_id, "alive": False}
        if self.shell_proc.poll() is None:
            try:
                self.write_to_pty("exit\n")
            except OSError:
                pass
            deadline = time.monotonic() + 1.0
            while self.shell_proc.poll() is None and time.monotonic() < deadline:
                self.pump_once(WAIT_POLL_SECONDS)
        if force and self.shell_proc.poll() is None:
            self.shell_proc.terminate()
            deadline = time.monotonic() + 1.0
            while self.shell_proc.poll() is None and time.monotonic() < deadline:
                self.pump_once(WAIT_POLL_SECONDS)
        if self.shell_proc.poll() is not None:
            self.mark_shell_exit(self.shell_proc.returncode)
        return {
            "ok": True,
            "session_id": self.session_id,
            "alive": self.shell_proc.poll() is None,
            "shell_exit_code": self.shell_proc.poll(),
        }

    def handle(self, payload: dict[str, Any]) -> dict[str, Any]:
        action = payload.get("action")
        if action == "status":
            return self.current_status()
        if action == "begin_exec":
            return self.begin_exec(str(payload["command"]))
        if action == "wait":
            return self.wait_for_command(
                str(payload["command_id"]),
                resolve_timeout(payload.get("timeout")),
            )
        if action == "write":
            chars = str(payload.get("chars", ""))
            if payload.get("append_newline"):
                chars += "\n"
            self.write_to_pty(chars)
            self.drain_pty_now()
            return {"ok": True, "session_id": self.session_id}
        if action == "interrupt":
            if self.master_fd is not None:
                os.write(self.master_fd, b"\x03")
            self.drain_pty_now()
            return {"ok": True, "session_id": self.session_id}
        if action == "close":
            return self.close_session(bool(payload.get("force")))
        raise RuntimeError(f"unsupported action {action!r}")

    def serve(self) -> int:
        self.session_dir.mkdir(parents=True, exist_ok=True)
        self.socket_path.parent.mkdir(parents=True, exist_ok=True)
        if self.socket_path.exists():
            self.socket_path.unlink()
        self.server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.server_socket.bind(str(self.socket_path))
        self.server_socket.listen(8)
        try:
            self.start_shell()
            self.write_meta(ready=True, alive=True, shell_exit_code=None)
            while True:
                self.drain_pty_now()
                if self.shell_proc is not None and self.shell_proc.poll() is not None:
                    self.mark_shell_exit(self.shell_proc.returncode)
                    break
                readable, _, _ = select.select(
                    [self.server_socket, self.master_fd],
                    [],
                    [],
                    WAIT_POLL_SECONDS,
                )
                for item in readable:
                    if item == self.master_fd:
                        self.read_pty_once()
                        continue
                    connection, _ = self.server_socket.accept()
                    with connection:
                        raw_request = connection.recv(1 << 20)
                        if not raw_request:
                            continue
                        try:
                            request_payload = json.loads(decode_bytes(raw_request))
                            response = self.handle(request_payload)
                        except Exception as exc:  # noqa: BLE001
                            response = {"ok": False, "error": str(exc)}
                        connection.sendall(encode_text(json.dumps(response)))
        finally:
            if self.server_socket is not None:
                self.server_socket.close()
            if self.master_fd is not None:
                try:
                    os.close(self.master_fd)
                except OSError:
                    pass
            if self.log_file is not None:
                self.log_file.close()
            if self.socket_path.exists():
                self.socket_path.unlink()
        return 0


def render_json(payload: dict[str, Any]) -> None:
    print(json.dumps(payload, indent=2, sort_keys=True))


def command_start(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    socket_root = Path(args.socket_root).resolve()
    session_root.mkdir(parents=True, exist_ok=True)
    socket_root.mkdir(parents=True, exist_ok=True)
    if args.resume_current:
        try:
            current_id = load_current_session_id(session_root)
            status = best_effort_status(session_root, current_id)
        except Exception:  # noqa: BLE001
            status = None
        else:
            if status.get("alive"):
                result = {
                    "ok": True,
                    "session_id": current_id,
                    "session_dir": str(session_root / current_id),
                    "log_path": status.get("log_path"),
                    "socket_path": status.get("socket_path"),
                    "shell_pid": status.get("shell_pid"),
                    "server_pid": status.get("server_pid"),
                    "cwd": status.get("cwd"),
                    "resumed": True,
                }
                save_current_session(session_root, current_id)
                if args.json:
                    render_json(result)
                else:
                    print(current_id)
                return 0
    cwd = Path(args.cwd or os.getcwd()).resolve()
    if not cwd.exists():
        raise FileNotFoundError(f"cwd {cwd} does not exist")
    session_id = args.session_id or generate_session_id()
    session_dir = session_root / session_id
    if session_dir.exists():
        raise FileExistsError(f"session directory {session_dir} already exists")
    session_dir.mkdir(parents=True)
    server_log_path = session_dir / "server.log"
    command = [
        sys.executable,
        str(SCRIPT_PATH),
        "_serve",
        "--session-id",
        session_id,
        "--session-dir",
        str(session_dir),
        "--socket-path",
        str(socket_root / f"{session_id}.sock"),
        "--shell",
        args.shell,
        "--cwd",
        str(cwd),
    ]
    if args.login:
        command.append("--login")
    for entry in args.env:
        command.extend(["--env", entry])
    with server_log_path.open("ab") as server_log:
        proc = subprocess.Popen(
            command,
            stdin=subprocess.DEVNULL,
            stdout=server_log,
            stderr=subprocess.STDOUT,
            close_fds=True,
            start_new_session=True,
        )
    deadline = time.monotonic() + args.start_timeout
    last_error: str | None = None
    while time.monotonic() < deadline:
        meta_path = session_dir / "meta.json"
        if meta_path.exists():
            meta = read_json(meta_path)
            if meta.get("ready"):
                try:
                    status = request(meta, {"action": "status"})
                except Exception as exc:  # noqa: BLE001
                    last_error = str(exc)
                else:
                    result = {
                        "ok": True,
                        "session_id": session_id,
                        "session_dir": str(session_dir),
                        "log_path": meta["log_path"],
                        "socket_path": meta["socket_path"],
                        "shell_pid": status.get("shell_pid"),
                        "server_pid": status.get("server_pid"),
                        "cwd": status.get("cwd"),
                    }
                    save_current_session(session_root, session_id)
                    if args.json:
                        render_json(result)
                    else:
                        print(session_id)
                    return 0
        if proc.poll() is not None:
            break
        time.sleep(0.05)
    server_output = ""
    if server_log_path.exists():
        server_output = server_log_path.read_text(encoding="utf-8", errors="replace")
    raise RuntimeError(
        "failed to start terminal bot session"
        + (f": {last_error}" if last_error else "")
        + (f"\n{server_output.strip()}" if server_output.strip() else "")
    )


def begin_exec(
    session_root: Path,
    session_id: str,
    command_text: str,
) -> tuple[dict[str, Any], dict[str, Any]]:
    meta = load_meta(session_root, session_id)
    response = request(meta, {"action": "begin_exec", "command": command_text})
    return meta, response


def wait_for_exec(
    meta: dict[str, Any],
    command_id: str,
    timeout: float | None,
) -> dict[str, Any]:
    return request(
        meta,
        {"action": "wait", "command_id": command_id, "timeout": timeout},
    )


def command_exec(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    command_parts = list(args.command)
    if command_parts and command_parts[0] == "--":
        command_parts = command_parts[1:]
    command_text = " ".join(command_parts).strip()
    if not command_text:
        raise ValueError("exec requires a command after the session id")
    meta, started = begin_exec(session_root, args.session_id, command_text)
    log_path = Path(started["log_path"])
    timeout = resolve_timeout(args.timeout)
    if args.stream:
        deadline = None if timeout is None else time.monotonic() + timeout
        next_offset = started["start_offset"]
        final_response: dict[str, Any] | None = None
        while True:
            slice_timeout = WAIT_POLL_SECONDS
            if deadline is not None:
                slice_timeout = min(slice_timeout, max(deadline - time.monotonic(), 0))
            response = wait_for_exec(meta, started["command_id"], slice_timeout)
            end_offset = response.get("end_offset") if response.get("done") else None
            text, next_offset = read_log_text(log_path, next_offset, end_offset=end_offset)
            if text:
                sys.stdout.write(text)
                sys.stdout.flush()
            if response.get("done"):
                final_response = response
                break
            if deadline is not None and time.monotonic() >= deadline:
                final_response = response
                break
        if final_response is None:
            final_response = response
        if args.json:
            render_json(final_response)
        if not final_response.get("done"):
            return 124
        exit_code = final_response.get("exit_code")
        return 0 if exit_code is None else int(exit_code)
    response = wait_for_exec(meta, started["command_id"], timeout)
    end_offset = response.get("end_offset") if response.get("done") else None
    text, _ = read_log_text(log_path, started["start_offset"], end_offset=end_offset)
    if args.json:
        payload = dict(response)
        payload["output"] = text
        render_json(payload)
    elif text:
        sys.stdout.write(text)
        sys.stdout.flush()
    if not response.get("done"):
        return 124
    exit_code = response.get("exit_code")
    return 0 if exit_code is None else int(exit_code)


def command_status(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    status = best_effort_status(session_root, args.session_id)
    if args.json:
        render_json(status)
    else:
        pending = status.get("pending_command")
        pending_id = "none" if pending is None else pending["command_id"]
        print(
            " ".join(
                [
                    f"session_id={status['session_id']}",
                    f"alive={str(status.get('alive')).lower()}",
                    f"cwd={status.get('cwd')}",
                    f"shell_pid={status.get('shell_pid')}",
                    f"pending={pending_id}",
                ]
            )
        )
    return 0


def command_list(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    if not session_root.exists():
        return 0
    try:
        current_id = load_current_session_id(session_root)
    except Exception:  # noqa: BLE001
        current_id = None
    sessions: list[dict[str, Any]] = []
    for session_dir in sorted(session_root.iterdir()):
        if not session_dir.is_dir():
            continue
        meta_path = session_dir / "meta.json"
        if not meta_path.exists():
            continue
        session_id = session_dir.name
        sessions.append(best_effort_status(session_root, session_id))
    if args.json:
        render_json({"sessions": sessions})
        return 0
    for session in sessions:
        label = session["session_id"]
        if current_id is not None and session["session_id"] == current_id:
            label += " *current"
        print(
            "\t".join(
                [
                    label,
                    "alive" if session.get("alive") else "dead",
                    str(session.get("cwd")),
                ]
            )
        )
    return 0


def command_read(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    meta = load_meta(session_root, args.session_id)
    text, next_offset = read_log_text(
        Path(meta["log_path"]),
        args.from_offset,
        max_bytes=args.max_bytes,
    )
    if args.json:
        render_json({"session_id": args.session_id, "text": text, "next_offset": next_offset})
    elif text:
        sys.stdout.write(text)
        sys.stdout.flush()
    return 0


def command_stream(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    meta = load_meta(session_root, args.session_id)
    log_path = Path(meta["log_path"])
    next_offset = args.from_offset
    if args.from_end and log_path.exists():
        next_offset = log_path.stat().st_size
    deadline = None if args.max_seconds is None else time.monotonic() + args.max_seconds
    idle_deadline = None if args.idle_seconds is None else time.monotonic() + args.idle_seconds
    while True:
        end_status = best_effort_status(session_root, args.session_id)
        text, next_offset = read_log_text(log_path, next_offset)
        if text:
            sys.stdout.write(text)
            sys.stdout.flush()
            if idle_deadline is not None:
                idle_deadline = time.monotonic() + args.idle_seconds
        if deadline is not None and time.monotonic() >= deadline:
            break
        if idle_deadline is not None and time.monotonic() >= idle_deadline:
            break
        if not end_status.get("alive") and not text:
            break
        time.sleep(args.poll_interval)
    return 0


def command_write(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    meta = load_meta(session_root, args.session_id)
    request(
        meta,
        {
            "action": "write",
            "chars": args.chars,
            "append_newline": args.append_newline,
        },
    )
    return 0


def command_interrupt(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    meta = load_meta(session_root, args.session_id)
    request(meta, {"action": "interrupt"})
    return 0


def command_close(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    meta = load_meta(session_root, args.session_id)
    response = request(meta, {"action": "close", "force": args.force})
    if args.json:
        render_json(response)
    return 0


def command_cd(args: argparse.Namespace) -> int:
    quoted_path = shlex.quote(str(Path(args.path).expanduser()))
    args.command = ["cd", quoted_path]
    args.stream = False
    return command_exec(args)


def command_setenv(args: argparse.Namespace) -> int:
    export_text = f"export {args.name}={shlex.quote(args.value)}"
    args.command = [export_text]
    args.stream = False
    return command_exec(args)


def run_self_test(args: argparse.Namespace) -> int:
    session_root = Path(args.session_root).resolve()
    session_root.mkdir(parents=True, exist_ok=True)
    socket_root = Path(args.socket_root).resolve()
    socket_root.mkdir(parents=True, exist_ok=True)
    cwd = Path(args.cwd or TOOLS_DIR.parent).resolve()
    start_args = argparse.Namespace(
        session_root=str(session_root),
        socket_root=str(socket_root),
        cwd=str(cwd),
        shell=args.shell,
        login=False,
        env=[],
        json=False,
        session_id=None,
        resume_current=False,
        start_timeout=5.0,
    )
    session_id = None
    try:
        saved_stdout = sys.stdout
        from io import StringIO

        capture = StringIO()
        sys.stdout = capture
        command_start(start_args)
        session_id = capture.getvalue().strip()
    finally:
        sys.stdout = saved_stdout
    if not session_id:
        raise RuntimeError("self-test could not create a session id")
    meta = load_meta(session_root, session_id)

    def run_exec(command_text: str, timeout: float | None = 10.0) -> tuple[int, str]:
        start_response = request(meta, {"action": "begin_exec", "command": command_text})
        finish = wait_for_exec(meta, start_response["command_id"], timeout)
        text, _ = read_log_text(
            Path(start_response["log_path"]),
            start_response["start_offset"],
            end_offset=finish.get("end_offset"),
        )
        if not finish.get("done"):
            raise RuntimeError(f"self-test timed out on {command_text!r}")
        return int(finish.get("exit_code") or 0), text

    try:
        exit_code, output = run_exec("pwd")
        if exit_code != 0 or str(cwd) not in output:
            raise RuntimeError("pwd did not report the expected starting directory")

        exit_code, _ = run_exec("cd tools")
        if exit_code != 0:
            raise RuntimeError("cd tools failed")

        exit_code, output = run_exec("pwd")
        if exit_code != 0 or not output.strip().endswith("/tools"):
            raise RuntimeError("cd state did not persist across commands")

        exit_code, _ = run_exec("export TD2_TERMINAL_BOT_TEST=sticky")
        if exit_code != 0:
            raise RuntimeError("export failed")

        exit_code, output = run_exec('printf "%s" "$TD2_TERMINAL_BOT_TEST"')
        if exit_code != 0 or output.strip() != "sticky":
            raise RuntimeError("environment state did not persist across commands")

        current_id = load_current_session_id(session_root)
        if current_id != session_id:
            raise RuntimeError("shared current session pointer did not track the live session")

        resume_args = argparse.Namespace(
            session_root=str(session_root),
            socket_root=str(socket_root),
            cwd=str(cwd),
            shell=args.shell,
            login=False,
            env=[],
            json=False,
            session_id=None,
            start_timeout=5.0,
            resume_current=True,
        )
        try:
            saved_stdout = sys.stdout
            from io import StringIO

            capture = StringIO()
            sys.stdout = capture
            command_start(resume_args)
            resumed_id = capture.getvalue().strip()
        finally:
            sys.stdout = saved_stdout
        if resumed_id != session_id:
            raise RuntimeError("start --resume-current did not return the existing live session")

        exit_code, output = run_exec(
            'python3 -c "import os; print(int(os.isatty(0)), int(os.isatty(1)))"'
        )
        if exit_code != 0 or output.strip() != "1 1":
            raise RuntimeError("PTY-backed shell did not expose tty file descriptors")

        start_response = request(
            meta,
            {
                "action": "begin_exec",
                "command": (
                    "python3 -c \"import time; "
                    "print('alpha', flush=True); "
                    "time.sleep(0.2); "
                    "print('beta', flush=True)\""
                ),
            },
        )
        next_offset = start_response["start_offset"]
        saw_alpha_while_running = False
        while True:
            status = wait_for_exec(meta, start_response["command_id"], 0.05)
            end_offset = status.get("end_offset") if status.get("done") else None
            text, next_offset = read_log_text(
                Path(start_response["log_path"]),
                next_offset,
                end_offset=end_offset,
            )
            if "alpha" in text and not status.get("done"):
                saw_alpha_while_running = True
            if status.get("done"):
                if "beta" not in text:
                    tail, next_offset = read_log_text(
                        Path(start_response["log_path"]),
                        next_offset,
                        end_offset=status.get("end_offset"),
                    )
                    text += tail
                break
        if not saw_alpha_while_running:
            raise RuntimeError("streaming path did not surface partial output before completion")
    finally:
        try:
            request(meta, {"action": "close", "force": True})
        except Exception:  # noqa: BLE001
            pass
        if args.cleanup and session_id is not None:
            shutil.rmtree(session_root / session_id, ignore_errors=True)
            socket_path = socket_root / f"{session_id}.sock"
            if socket_path.exists():
                socket_path.unlink()
    print("terminal bot self-test passed")
    return 0


def command_serve(args: argparse.Namespace) -> int:
    env_overrides = dict(parse_env_assignment(item) for item in args.env)
    server = SessionServer(
        session_id=args.session_id,
        session_dir=Path(args.session_dir).resolve(),
        socket_path=Path(args.socket_path).resolve(),
        shell=args.shell,
        cwd=Path(args.cwd).resolve(),
        env_overrides=env_overrides,
        login=args.login,
    )
    return server.serve()


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Persistent PTY-backed terminal session helper.",
    )
    parser.add_argument(
        "--session-root",
        default=str(DEFAULT_SESSION_ROOT),
        help="directory used for session metadata and logs",
    )
    parser.add_argument(
        "--socket-root",
        default=str(DEFAULT_SOCKET_ROOT),
        help="directory used for Unix domain sockets",
    )
    parser.set_defaults(func=None)
    subparsers = parser.add_subparsers(dest="subcommand")

    start_parser = subparsers.add_parser("start", help="create a new session")
    start_parser.add_argument("--session-id")
    start_parser.add_argument("--cwd", default=os.getcwd())
    start_parser.add_argument("--shell", default=DEFAULT_SHELL)
    start_parser.add_argument("--env", action="append", default=[])
    start_parser.add_argument("--login", action="store_true")
    start_parser.add_argument("--json", action="store_true")
    start_parser.add_argument(
        "--resume-current",
        action="store_true",
        help="reuse the shared current live session if it exists instead of starting a new one",
    )
    start_parser.add_argument("--start-timeout", type=float, default=5.0)
    start_parser.set_defaults(func=command_start)

    exec_parser = subparsers.add_parser("exec", help="run a command in a session")
    exec_parser.add_argument("session_id")
    exec_parser.add_argument("command", nargs=argparse.REMAINDER)
    exec_parser.add_argument("--timeout", type=float, default=30.0)
    exec_parser.add_argument("--stream", action="store_true")
    exec_parser.add_argument("--json", action="store_true")
    exec_parser.set_defaults(func=command_exec)

    read_parser = subparsers.add_parser("read", help="read raw session log output")
    read_parser.add_argument("session_id")
    read_parser.add_argument("--from-offset", type=int, default=0)
    read_parser.add_argument("--max-bytes", type=int)
    read_parser.add_argument("--json", action="store_true")
    read_parser.set_defaults(func=command_read)

    stream_parser = subparsers.add_parser("stream", help="tail session output")
    stream_parser.add_argument("session_id")
    stream_parser.add_argument("--from-offset", type=int, default=0)
    stream_parser.add_argument("--from-end", action="store_true")
    stream_parser.add_argument("--idle-seconds", type=float)
    stream_parser.add_argument("--max-seconds", type=float)
    stream_parser.add_argument("--poll-interval", type=float, default=0.1)
    stream_parser.set_defaults(func=command_stream)

    write_parser = subparsers.add_parser("write", help="send raw input to a session")
    write_parser.add_argument("session_id")
    write_parser.add_argument("--chars", required=True)
    write_parser.add_argument("--append-newline", action="store_true")
    write_parser.set_defaults(func=command_write)

    interrupt_parser = subparsers.add_parser("interrupt", help="send Ctrl-C")
    interrupt_parser.add_argument("session_id")
    interrupt_parser.set_defaults(func=command_interrupt)

    close_parser = subparsers.add_parser("close", help="close a session")
    close_parser.add_argument("session_id")
    close_parser.add_argument("--force", action="store_true")
    close_parser.add_argument("--json", action="store_true")
    close_parser.set_defaults(func=command_close)

    status_parser = subparsers.add_parser("status", help="show session status")
    status_parser.add_argument("session_id")
    status_parser.add_argument("--json", action="store_true")
    status_parser.set_defaults(func=command_status)

    list_parser = subparsers.add_parser("list", help="list known sessions")
    list_parser.add_argument("--json", action="store_true")
    list_parser.set_defaults(func=command_list)

    cd_parser = subparsers.add_parser("cd", help="change the session working directory")
    cd_parser.add_argument("session_id")
    cd_parser.add_argument("path")
    cd_parser.add_argument("--timeout", type=float, default=30.0)
    cd_parser.add_argument("--json", action="store_true")
    cd_parser.set_defaults(func=command_cd)

    setenv_parser = subparsers.add_parser("setenv", help="export one environment variable")
    setenv_parser.add_argument("session_id")
    setenv_parser.add_argument("name")
    setenv_parser.add_argument("value")
    setenv_parser.add_argument("--timeout", type=float, default=30.0)
    setenv_parser.add_argument("--json", action="store_true")
    setenv_parser.set_defaults(func=command_setenv)

    self_test_parser = subparsers.add_parser("self-test", help="run a local smoke test")
    self_test_parser.add_argument("--cwd")
    self_test_parser.add_argument("--shell", default=DEFAULT_SHELL)
    self_test_parser.add_argument("--cleanup", action="store_true", default=True)
    self_test_parser.set_defaults(func=run_self_test)

    serve_parser = subparsers.add_parser("_serve", help=argparse.SUPPRESS)
    serve_parser.add_argument("--session-id", required=True)
    serve_parser.add_argument("--session-dir", required=True)
    serve_parser.add_argument("--socket-path", required=True)
    serve_parser.add_argument("--shell", default=DEFAULT_SHELL)
    serve_parser.add_argument("--cwd", required=True)
    serve_parser.add_argument("--env", action="append", default=[])
    serve_parser.add_argument("--login", action="store_true")
    serve_parser.set_defaults(func=command_serve)

    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    if args.func is None:
        parser.print_help()
        return 1
    try:
        return int(args.func(args))
    except BrokenPipeError:
        return 0
    except Exception as exc:  # noqa: BLE001
        print(f"error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
