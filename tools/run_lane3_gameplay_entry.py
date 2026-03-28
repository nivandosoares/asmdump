#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import subprocess


DEFAULT_MENU_WINDOWS = "1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a"
DEFAULT_GAMEPLAY_START_FRAME = 2050


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Launch the traced Lane 3 power-on route back into gameplay using the "
            "current menu-A corridor, then optionally append gameplay-relative "
            "input windows shifted from the first known gameplay frame."
        )
    )
    parser.add_argument("out_dir", type=Path, help="output directory for the run manifest and probe/capture outputs")
    parser.add_argument(
        "--mode",
        choices=("probe", "capture"),
        default="probe",
        help="runner to launch (default: %(default)s)",
    )
    parser.add_argument(
        "--rom",
        type=Path,
        default=Path("game.smc"),
        help="ROM path relative to the repo root (default: %(default)s)",
    )
    parser.add_argument(
        "--menu-windows",
        default=DEFAULT_MENU_WINDOWS,
        help="absolute menu-entry input windows (default: %(default)s)",
    )
    parser.add_argument(
        "--gameplay-start-frame",
        type=int,
        default=DEFAULT_GAMEPLAY_START_FRAME,
        help="absolute frame used as gameplay-relative zero (default: %(default)s)",
    )
    parser.add_argument(
        "--gameplay-input-windows",
        default="",
        help=(
            "gameplay-relative input windows using the same syntax as the probe/capture "
            "wrappers, for example `0-600:a;601-720:right`"
        ),
    )
    parser.add_argument(
        "--timeout-seconds",
        type=int,
        default=120,
        help="MESEN_TIMEOUT_SECONDS (default: %(default)s)",
    )
    parser.add_argument(
        "--mesen-bin",
        default="",
        help="optional MESEN_BIN override passed through to the wrapper",
    )
    parser.add_argument(
        "--mesen-release-dir",
        default="",
        help="optional MESEN_RELEASE_DIR override passed through to the wrapper",
    )
    parser.add_argument(
        "--probe-total-frames",
        type=int,
        default=2600,
        help="TD2_BOOT_PROBE_TOTAL_FRAMES when --mode probe (default: %(default)s)",
    )
    parser.add_argument(
        "--capture-warmup-frames",
        type=int,
        default=2032,
        help="TD2_CAPTURE_WARMUP_FRAMES when --mode capture (default: %(default)s)",
    )
    parser.add_argument(
        "--capture-frames",
        type=int,
        default=300,
        help="TD2_CAPTURE_FRAMES when --mode capture (default: %(default)s)",
    )
    parser.add_argument(
        "--capture-screenshot-every",
        type=int,
        default=1,
        help="TD2_CAPTURE_SCREENSHOT_EVERY when --mode capture (default: %(default)s)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="print the resolved command and manifest without running Mesen",
    )
    return parser.parse_args()


def shift_windows(raw: str, base_frame: int) -> str:
    segments: list[str] = []
    for item in raw.split(";"):
        piece = item.strip()
        if not piece:
            continue
        range_part, sep, buttons = piece.partition(":")
        if not sep:
            raise SystemExit(f"error: invalid gameplay input window {piece!r}")
        if "-" in range_part:
            start_raw, end_raw = range_part.split("-", 1)
            start = int(start_raw) + base_frame
            end = int(end_raw) + base_frame
            range_text = f"{start}-{end}"
        else:
            point = int(range_part) + base_frame
            range_text = str(point)
        segments.append(f"{range_text}:{buttons.strip()}")
    return ";".join(segments)


def combine_windows(*parts: str) -> str:
    out: list[str] = []
    for part in parts:
        if not part:
            continue
        for item in part.split(";"):
            piece = item.strip()
            if piece:
                out.append(piece)
    return ";".join(out)


def build_manifest(args: argparse.Namespace, combined_windows: str, command: list[str], env: dict[str, str]) -> dict[str, object]:
    return {
        "mode": args.mode,
        "rom": str(args.rom),
        "menu_windows": args.menu_windows,
        "gameplay_start_frame": args.gameplay_start_frame,
        "gameplay_input_windows_relative": args.gameplay_input_windows,
        "combined_input_windows_absolute": combined_windows,
        "timeout_seconds": args.timeout_seconds,
        "command": command,
        "env_overrides": env,
    }


def main() -> None:
    args = parse_args()
    root = Path(__file__).resolve().parents[1]
    out_dir = args.out_dir if args.out_dir.is_absolute() else (root / args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    gameplay_windows = shift_windows(args.gameplay_input_windows, args.gameplay_start_frame) if args.gameplay_input_windows else ""
    combined_windows = combine_windows(args.menu_windows, gameplay_windows)

    env = os.environ.copy()
    env["MESEN_TIMEOUT_SECONDS"] = str(args.timeout_seconds)
    if args.mesen_bin:
        env["MESEN_BIN"] = args.mesen_bin
    if args.mesen_release_dir:
        env["MESEN_RELEASE_DIR"] = args.mesen_release_dir

    if args.mode == "probe":
        output_prefix = out_dir / "td2_boot_probe"
        env_overrides = {
            "TD2_BOOT_PROBE_TOTAL_FRAMES": str(args.probe_total_frames),
            "TD2_BOOT_PROBE_OUTPUT_PREFIX": str(output_prefix.resolve()),
            "TD2_BOOT_PROBE_INPUT_WINDOWS": combined_windows,
        }
        command = ["./validation/run_mesen_probe_boot.sh", str(args.rom)]
    else:
        output_prefix = out_dir / "capture"
        env_overrides = {
            "TD2_CAPTURE_WARMUP_FRAMES": str(args.capture_warmup_frames),
            "TD2_CAPTURE_FRAMES": str(args.capture_frames),
            "TD2_CAPTURE_SCREENSHOT_EVERY": str(args.capture_screenshot_every),
            "TD2_CAPTURE_OUTPUT_PREFIX": str(output_prefix.resolve()),
            "TD2_CAPTURE_INPUT_WINDOWS": combined_windows,
        }
        command = ["./validation/run_mesen_capture.sh", str(args.rom), "./validation/mesen_capture.lua"]

    env.update(env_overrides)
    manifest = build_manifest(args, combined_windows, command, env_overrides)
    manifest_path = out_dir / "lane3_gameplay_entry_manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2), encoding="utf-8")

    if args.dry_run:
        print(json.dumps(manifest, indent=2))
        return

    subprocess.run(command, cwd=root, env=env, check=True)
    print(json.dumps({"manifest": str(manifest_path), "output_prefix": str(output_prefix)}, indent=2))


if __name__ == "__main__":
    main()
