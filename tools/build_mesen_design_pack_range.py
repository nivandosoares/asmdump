#!/usr/bin/env python3
"""Build design packs for a directory of mesen frame dumps."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run build_mesen_design_pack.py across frame_* folders and emit a range index "
            "manifest for design review workflows."
        )
    )
    parser.add_argument("frames_dir", type=Path, help="Directory containing frame_* folders.")
    parser.add_argument("out_dir", type=Path, help="Output directory for per-frame design packs.")
    parser.add_argument(
        "--frame-glob",
        default="frame_*",
        help="Glob pattern used to discover frame directories (default: frame_*).",
    )
    parser.add_argument(
        "--builder-script",
        type=Path,
        default=Path(__file__).with_name("build_mesen_design_pack.py"),
        help="Path to the single-frame pack builder script.",
    )
    parser.add_argument(
        "--clean-out",
        action="store_true",
        help="Delete out_dir before packaging.",
    )
    return parser.parse_args()


def parse_frame_number(path: Path) -> int | None:
    match = re.search(r"(\d+)", path.name)
    if not match:
        return None
    return int(match.group(1))


def main() -> int:
    args = parse_args()
    frames_dir = args.frames_dir.resolve()
    out_dir = args.out_dir.resolve()
    builder_script = args.builder_script.resolve()

    if not frames_dir.is_dir():
        raise SystemExit(f"error: frames directory not found: {frames_dir}")
    if not builder_script.is_file():
        raise SystemExit(f"error: builder script not found: {builder_script}")

    if args.clean_out and out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    frame_dirs = [path for path in frames_dir.glob(args.frame_glob) if path.is_dir()]
    frame_dirs.sort(key=lambda path: (parse_frame_number(path) is None, parse_frame_number(path) or 0, path.name))
    if not frame_dirs:
        raise SystemExit(f"error: no frame directories matched {args.frame_glob!r} under {frames_dir}")

    entries: list[dict] = []
    for frame_dir in frame_dirs:
        pack_dir = out_dir / frame_dir.name
        cmd = [sys.executable, str(builder_script), str(frame_dir), str(pack_dir), "--clean-out"]
        subprocess.run(cmd, check=True)

        manifest_path = pack_dir / "design_pack.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        ppu_summary = manifest.get("ppu_summary", {})
        entries.append(
            {
                "frameDir": frame_dir.name,
                "frameNumber": manifest.get("frame_number"),
                "packDir": pack_dir.relative_to(out_dir).as_posix(),
                "manifest": f"{pack_dir.relative_to(out_dir).as_posix()}/design_pack.json",
                "bgMode": ppu_summary.get("bgMode"),
                "mainScreenLayers": ppu_summary.get("mainScreenLayers"),
                "forcedBlank": ppu_summary.get("forcedBlank"),
            }
        )

    index = {
        "sourceFramesDir": str(frames_dir),
        "packDir": str(out_dir),
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "frameCount": len(entries),
        "entries": entries,
    }
    index_path = out_dir / "design_pack_range.json"
    index_path.write_text(json.dumps(index, indent=2) + "\n", encoding="utf-8")

    print(f"wrote {len(entries)} design packs to {out_dir}")
    print(f"index: {index_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
