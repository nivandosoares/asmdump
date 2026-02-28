#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


MODE7_KEY_MAP = {
    "m7a": "ppu.mode7.matrix[0]",
    "m7b": "ppu.mode7.matrix[1]",
    "m7c": "ppu.mode7.matrix[2]",
    "m7d": "ppu.mode7.matrix[3]",
    "hscroll": "ppu.mode7.hscroll",
    "vscroll": "ppu.mode7.vscroll",
    "center_x": "ppu.mode7.centerX",
    "center_y": "ppu.mode7.centerY",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Apply visible-scanline Mode 7 samples onto extracted frame ppu_state JSON files. "
            "By default this writes sibling ppu_state_visible.json files."
        )
    )
    parser.add_argument("samples_json", type=Path, help="td2_visible_mode7_range.json output")
    parser.add_argument("frames_root", type=Path, help="root directory that contains frame_XXXXX folders")
    parser.add_argument(
        "--state-name",
        default="ppu_state.json",
        help="input state file name inside each frame directory (default: %(default)s)",
    )
    parser.add_argument(
        "--output-name",
        default="ppu_state_visible.json",
        help="output state file name inside each frame directory (default: %(default)s)",
    )
    parser.add_argument(
        "--in-place",
        action="store_true",
        help="overwrite the input state file instead of writing a sidecar output",
    )
    return parser.parse_args()


def apply_sample_to_state(state: dict[str, object], sample: dict[str, object]) -> dict[str, object]:
    updated = dict(state)
    for sample_key, state_key in MODE7_KEY_MAP.items():
        if sample_key in sample and sample[sample_key] is not None:
            updated[state_key] = int(sample[sample_key])
    if "bg_mode" in sample and sample["bg_mode"] is not None:
        updated["ppu.bgMode"] = int(sample["bg_mode"])
    if "main_layers" in sample and sample["main_layers"] is not None:
        updated["ppu.mainScreenLayers"] = int(sample["main_layers"])
    return updated


def main() -> int:
    args = parse_args()
    payload = json.loads(args.samples_json.read_text(encoding="utf-8"))
    samples = payload.get("samples", [])
    applied = 0

    for sample in samples:
        frame = int(sample["frame"])
        frame_dir = args.frames_root / f"frame_{frame:05d}"
        input_path = frame_dir / args.state_name
        output_path = input_path if args.in_place else (frame_dir / args.output_name)
        state = json.loads(input_path.read_text(encoding="utf-8"))
        updated = apply_sample_to_state(state, sample)
        output_path.write_text(json.dumps(updated, indent=2) + "\n", encoding="utf-8")
        applied += 1
        print(
            f"frame {frame}: wrote {output_path} "
            f"(m7a={updated.get('ppu.mode7.matrix[0]')}, m7d={updated.get('ppu.mode7.matrix[3]')})"
        )

    print(f"applied {applied} visible Mode 7 samples")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
