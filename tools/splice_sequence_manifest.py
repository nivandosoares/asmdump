#!/usr/bin/env python3
"""Replace a frame range inside a sequence JSON summary with a new manifest entry."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Splice a replacement entry into a sequence JSON summary and emit sequence.txt."
    )
    parser.add_argument("sequence_json", type=Path, help="Sequence JSON produced by build_scene_sequence_manifest.py.")
    parser.add_argument("out_manifest", type=Path, help="Output sequence manifest path.")
    parser.add_argument("--replace-start-frame", type=int, required=True, help="Inclusive replacement start frame.")
    parser.add_argument(
        "--replace-end-frame-exclusive",
        type=int,
        required=True,
        help="Exclusive replacement end frame.",
    )
    parser.add_argument(
        "--replacement-type",
        choices=("image", "snes_bg", "indexed_anim", "ballistic_a39c"),
        required=True,
        help="Replacement entry type.",
    )
    parser.add_argument("--replacement-path", type=Path, required=True, help="Replacement entry path.")
    parser.add_argument("--replacement-duration", type=int, required=True, help="Replacement duration in frames.")
    parser.add_argument("--json-out", type=Path, help="Optional splice summary output path.")
    return parser.parse_args()


def relpath(path: Path, base: Path) -> str:
    base_dir = base.resolve().parent
    try:
        return path.resolve().relative_to(base_dir).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def resolve_from_json(json_path: Path, relative_or_absolute: str) -> Path:
    candidate = Path(relative_or_absolute)
    if candidate.is_absolute():
        return candidate
    return (json_path.resolve().parent / candidate).resolve()


def main() -> int:
    args = parse_args()
    data = json.loads(args.sequence_json.read_text(encoding="utf-8"))
    entries = data.get("entries", [])

    if not entries:
        raise SystemExit("error: sequence JSON has no entries")

    lines = ["# type duration_frames path_a [path_b path_c]"]
    inserted = False
    kept_entries = []

    for entry in entries:
        frame = int(entry["frame"])
        if args.replace_start_frame <= frame < args.replace_end_frame_exclusive:
            if not inserted:
                replacement_path = relpath(args.replacement_path, args.out_manifest)
                lines.append(
                    f"{args.replacement_type} {args.replacement_duration} {replacement_path}"
                )
                inserted = True
            continue

        if entry["type"] == "image":
            image_path = relpath(resolve_from_json(args.sequence_json, entry["image"]), args.out_manifest)
            lines.append(f"image {entry['duration_frames']} {image_path}")
        elif entry["type"] == "snes_bg":
            vram_path = relpath(resolve_from_json(args.sequence_json, entry["vram"]), args.out_manifest)
            cgram_path = relpath(resolve_from_json(args.sequence_json, entry["cgram"]), args.out_manifest)
            state_path = relpath(resolve_from_json(args.sequence_json, entry["ppu_state"]), args.out_manifest)
            lines.append(
                f"snes_bg {entry['duration_frames']} {vram_path} {cgram_path} {state_path}"
            )
        elif entry["type"] == "indexed_anim":
            clip_path = relpath(resolve_from_json(args.sequence_json, entry["clip"]), args.out_manifest)
            lines.append(f"indexed_anim {entry['duration_frames']} {clip_path}")
        elif entry["type"] == "ballistic_a39c":
            asset_path = relpath(resolve_from_json(args.sequence_json, entry["asset"]), args.out_manifest)
            lines.append(f"ballistic_a39c {entry['duration_frames']} {asset_path}")
        else:
            raise SystemExit(f"error: unsupported sequence entry type {entry['type']}")

        kept_entries.append(entry)

    if not inserted:
        raise SystemExit("error: replacement range did not overlap any source entries")

    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    args.out_manifest.write_text("\n".join(lines) + "\n", encoding="utf-8")

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(
            json.dumps(
                {
                    "sequence_json": str(args.sequence_json.resolve()),
                    "replace_start_frame": args.replace_start_frame,
                    "replace_end_frame_exclusive": args.replace_end_frame_exclusive,
                    "replacement_type": args.replacement_type,
                    "replacement_path": str(args.replacement_path.resolve()),
                    "replacement_duration": args.replacement_duration,
                    "kept_entry_count": len(kept_entries),
                    "total_duration_frames": sum(
                        int(line.split()[1])
                        for line in lines[1:]
                    ),
                },
                indent=2,
            ) + "\n",
            encoding="utf-8",
        )

    print(f"wrote spliced sequence manifest {args.out_manifest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
