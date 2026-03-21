#!/usr/bin/env python3
"""Build visual contracts for a directory of Mesen design packs."""

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
            "Run build_mesen_visual_contract.py across frame_* design-pack folders "
            "and emit a compact range index."
        )
    )
    parser.add_argument("design_pack_range_dir", type=Path, help="Directory containing frame_* design-pack folders.")
    parser.add_argument("out_dir", type=Path, help="Output directory for per-frame visual contracts.")
    parser.add_argument(
        "--frame-glob",
        default="frame_*",
        help="Glob pattern used to discover design-pack frame directories (default: frame_*).",
    )
    parser.add_argument(
        "--builder-script",
        type=Path,
        default=Path(__file__).with_name("build_mesen_visual_contract.py"),
        help="Path to the single-frame visual-contract builder script.",
    )
    parser.add_argument(
        "--provenance-json",
        type=Path,
        help="Optional shared provenance artifact applied to every frame in the range.",
    )
    parser.add_argument(
        "--clean-out",
        action="store_true",
        help="Delete out_dir before building.",
    )
    return parser.parse_args()


def parse_frame_number(path: Path) -> int | None:
    match = re.search(r"(\d+)", path.name)
    if not match:
        return None
    return int(match.group(1))


def main() -> int:
    args = parse_args()
    design_pack_range_dir = args.design_pack_range_dir.resolve()
    out_dir = args.out_dir.resolve()
    builder_script = args.builder_script.resolve()

    if not design_pack_range_dir.is_dir():
        raise SystemExit(f"error: design-pack range directory not found: {design_pack_range_dir}")
    if not builder_script.is_file():
        raise SystemExit(f"error: builder script not found: {builder_script}")

    if args.clean_out and out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    frame_dirs = [path for path in design_pack_range_dir.glob(args.frame_glob) if path.is_dir()]
    frame_dirs.sort(key=lambda path: (parse_frame_number(path) is None, parse_frame_number(path) or 0, path.name))
    if not frame_dirs:
        raise SystemExit(
            f"error: no design-pack frame directories matched {args.frame_glob!r} under {design_pack_range_dir}"
        )

    entries: list[dict] = []
    for frame_dir in frame_dirs:
        out_path = out_dir / f"{frame_dir.name}_visual_contract.json"
        cmd = [sys.executable, str(builder_script), str(frame_dir), str(out_path)]
        if args.provenance_json:
            cmd.extend(["--provenance-json", str(args.provenance_json.resolve())])
        subprocess.run(cmd, check=True)

        contract = json.loads(out_path.read_text(encoding="utf-8"))
        entries.append(
            {
                "frameDir": frame_dir.name,
                "frameNumber": contract.get("frame", {}).get("frameNumber"),
                "contract": out_path.relative_to(out_dir).as_posix(),
                "bgLayerCount": contract.get("bg", {}).get("layerCount"),
                "visibleSpriteCount": contract.get("obj", {}).get("visibleCount"),
                "provenanceEnabled": contract.get("provenance", {}).get("enabled"),
            }
        )

    range_index = {
        "schema": "td2.visual_contract_range.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "sourceDesignPackRangeDir": str(design_pack_range_dir),
        "outDir": str(out_dir),
        "frameCount": len(entries),
        "provenancePath": str(args.provenance_json.resolve()) if args.provenance_json else None,
        "entries": entries,
    }

    index_path = out_dir / "visual_contract_range.json"
    index_path.write_text(json.dumps(range_index, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {len(entries)} visual contracts to {out_dir}")
    print(f"index: {index_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
