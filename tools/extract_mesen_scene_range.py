#!/usr/bin/env python3
"""Extract a range of Mesen scene frames and emit a playback manifest."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
from typing import Iterable


ROOT = Path(__file__).resolve().parent
DEFAULT_EXTRACTOR = ROOT / "mesen_ppu_extract" / "bin" / "Debug" / "net8.0" / "mesen_ppu_extract.dll"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Extract a range of SNES BG scenes through the Mesen bridge and emit a playback manifest."
    )
    parser.add_argument("--rom", required=True, type=Path, help="Path to the ROM file.")
    parser.add_argument("--start-frame", required=True, type=int, help="First frame to extract.")
    parser.add_argument("--end-frame", required=True, type=int, help="Last frame to extract, inclusive.")
    parser.add_argument("--step", type=int, default=4, help="Frame step. Default: 4.")
    parser.add_argument("--out-dir", required=True, type=Path, help="Output directory for extracted frames.")
    parser.add_argument(
        "--extractor",
        type=Path,
        default=DEFAULT_EXTRACTOR,
        help="Path to mesen_ppu_extract.dll. Default: tools/mesen_ppu_extract/bin/Debug/net8.0/mesen_ppu_extract.dll",
    )
    parser.add_argument(
        "--frame-timeout-seconds",
        type=float,
        default=30.0,
        help="Per-frame extractor timeout in seconds. Default: 30.",
    )
    parser.add_argument(
        "--ld-library-path",
        default=os.environ.get("LD_LIBRARY_PATH", ""),
        help="LD_LIBRARY_PATH used to launch the Mesen bridge. Defaults to the current environment.",
    )
    parser.add_argument(
        "--no-collapse-identical",
        action="store_true",
        help="Keep every extracted frame as a separate playback entry.",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Re-extract frames even if their directory already exists.",
    )
    return parser.parse_args()


def iter_frames(start_frame: int, end_frame: int, step: int) -> Iterable[int]:
    if step <= 0:
        raise ValueError("--step must be greater than zero")
    if end_frame < start_frame:
        raise ValueError("--end-frame must be greater than or equal to --start-frame")
    return range(start_frame, end_frame + 1, step)


def scene_hash(frame_dir: Path) -> str:
    digest = hashlib.sha256()
    for name in ("vram.bin", "cgram.bin", "ppu_state.json"):
        digest.update((frame_dir / name).read_bytes())
    oam_path = frame_dir / "oam.bin"
    if oam_path.exists():
        digest.update(oam_path.read_bytes())
    return digest.hexdigest()


def extract_frame(args: argparse.Namespace, frame: int, frame_dir: Path) -> None:
    expected = [frame_dir / "vram.bin", frame_dir / "cgram.bin", frame_dir / "ppu_state.json"]
    if not args.force and all(path.exists() for path in expected):
        return

    frame_dir.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    if args.ld_library_path:
        env["LD_LIBRARY_PATH"] = args.ld_library_path

    cmd = [
        "dotnet",
        str(args.extractor),
        "--rom",
        str(args.rom),
        "--frame",
        str(frame),
        "--out-dir",
        str(frame_dir),
        "--frame-timeout-seconds",
        str(args.frame_timeout_seconds),
    ]
    subprocess.run(cmd, check=True, env=env)


def build_manifest_entries(args: argparse.Namespace, frames: list[int]) -> tuple[list[dict], list[dict]]:
    playback_entries: list[dict] = []
    extracted_entries: list[dict] = []
    previous_hash: str | None = None

    for frame in frames:
        frame_dir = args.out_dir / f"frame_{frame:05d}"
        digest = scene_hash(frame_dir)
        relative_dir = frame_dir.relative_to(args.out_dir)
        extracted_entry = {
            "frame": frame,
            "dir": relative_dir.as_posix(),
            "hash": digest,
        }
        if (frame_dir / "oam.bin").exists():
            extracted_entry["oam"] = (relative_dir / "oam.bin").as_posix()
        extracted_entries.append(extracted_entry)

        if (
            not args.no_collapse_identical
            and playback_entries
            and digest == previous_hash
        ):
            playback_entries[-1]["duration_frames"] += args.step
            playback_entries[-1]["source_frames"].append(frame)
            continue

        playback_entries.append(
            {
                "type": "snes_bg",
                "duration_frames": args.step,
                "frame": frame,
                "dir": relative_dir.as_posix(),
                "source_frames": [frame],
            }
        )
        if (frame_dir / "oam.bin").exists():
            playback_entries[-1]["oam"] = (relative_dir / "oam.bin").as_posix()
        previous_hash = digest

    return playback_entries, extracted_entries


def write_manifest(out_dir: Path, playback_entries: list[dict]) -> Path:
    manifest_path = out_dir / "sequence.txt"
    lines = [
        "# type duration_frames vram_path cgram_path ppu_state_path [oam_path]",
    ]

    for entry in playback_entries:
        relative_dir = Path(entry["dir"])
        line = "snes_bg {duration} {vram} {cgram} {state}".format(
            duration=entry["duration_frames"],
            vram=(relative_dir / "vram.bin").as_posix(),
            cgram=(relative_dir / "cgram.bin").as_posix(),
            state=(relative_dir / "ppu_state.json").as_posix(),
        )
        if entry.get("oam"):
            line += f" {entry['oam']}"
        lines.append(line)

    manifest_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return manifest_path


def write_summary(
    args: argparse.Namespace,
    frames: list[int],
    playback_entries: list[dict],
    extracted_entries: list[dict],
    manifest_path: Path,
) -> Path:
    summary_path = args.out_dir / "sequence.json"
    summary = {
        "rom": str(args.rom.resolve()),
        "start_frame": args.start_frame,
        "end_frame": args.end_frame,
        "step": args.step,
        "collapse_identical": not args.no_collapse_identical,
        "manifest": manifest_path.name,
        "frames_requested": frames,
        "playback_entries": playback_entries,
        "extracted_entries": extracted_entries,
        "total_duration_frames": sum(entry["duration_frames"] for entry in playback_entries),
    }
    summary_path.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    return summary_path


def main() -> int:
    args = parse_args()
    args.rom = args.rom.resolve()
    args.extractor = args.extractor.resolve()
    args.out_dir = args.out_dir.resolve()
    args.out_dir.mkdir(parents=True, exist_ok=True)

    if not args.rom.is_file():
        print(f"error: ROM not found: {args.rom}", file=sys.stderr)
        return 1
    if not args.extractor.is_file():
        print(f"error: extractor not found: {args.extractor}", file=sys.stderr)
        return 1

    frames = list(iter_frames(args.start_frame, args.end_frame, args.step))

    for frame in frames:
        extract_frame(args, frame, args.out_dir / f"frame_{frame:05d}")

    playback_entries, extracted_entries = build_manifest_entries(args, frames)
    manifest_path = write_manifest(args.out_dir, playback_entries)
    summary_path = write_summary(args, frames, playback_entries, extracted_entries, manifest_path)

    print(
        f"extracted {len(frames)} frames into {args.out_dir} "
        f"-> {len(playback_entries)} playback entries, manifest {manifest_path.name}, summary {summary_path.name}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
