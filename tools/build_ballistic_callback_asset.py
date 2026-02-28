#!/usr/bin/env python3
"""Build a compact runtime Ballistic A39C callback asset."""

from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path


BALLISTIC_RAMP_BANK = 0x04
BALLISTIC_RAMP_ADDR = 0x99ED
RAMP_WORD_COUNT = 64


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a compact Ballistic A39C runtime asset from the ROM-derived clip metadata."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("helper_cgram", type=Path, help="helper-scene CGRAM dump used by L00A35A")
    parser.add_argument("ballistic_rom_json", type=Path, help="ROM-derived Ballistic JSON with class mapping")
    parser.add_argument("out_manifest", type=Path, help="output callback asset manifest path")
    parser.add_argument("--json-out", type=Path, help="optional JSON summary output")
    parser.add_argument("--sequence-manifest", type=Path, help="optional one-entry runtime sequence manifest")
    return parser.parse_args()


def lorom_offset(bank: int, addr: int) -> int:
    if addr < 0x8000:
        raise ValueError(f"invalid LoROM address {bank:02X}:{addr:04X}")
    return (bank * 0x8000) + (addr - 0x8000)


def relpath(path: Path, base: Path) -> str:
    base_dir = base.resolve().parent
    try:
        return path.resolve().relative_to(base_dir).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def main() -> int:
    args = parse_args()
    meta = json.loads(args.ballistic_rom_json.read_text(encoding="utf-8"))
    helper_cgram_bytes = args.helper_cgram.read_bytes()
    if len(helper_cgram_bytes) != 0x200:
        raise SystemExit(f"error: expected 512-byte helper CGRAM, got {len(helper_cgram_bytes)} bytes")

    meta_dir = args.ballistic_rom_json.resolve().parent
    indices_source = meta_dir / meta["indices"]
    indices_bytes = indices_source.read_bytes()
    if len(indices_bytes) != (256 * 224):
        raise SystemExit(f"error: expected 57344-byte indexed image, got {len(indices_bytes)} bytes")

    timeline_entry_count = int(meta["timeline_entry_count"])
    total_duration_frames = int(meta["total_duration_frames"])
    if timeline_entry_count <= 0 or total_duration_frames <= 0:
        raise SystemExit("error: invalid timeline metadata in ROM-derived clip JSON")
    if total_duration_frames % timeline_entry_count != 0:
        raise SystemExit("error: expected a constant step duration for Ballistic callback asset")
    step_frames = total_duration_frames // timeline_entry_count

    mapping = {int(entry["class_index"]): int(entry["cgram_index"]) for entry in meta["mapping"]}
    class_count = max(mapping) + 1

    rom_bytes = args.rom.read_bytes()
    ramp_offset = lorom_offset(BALLISTIC_RAMP_BANK, BALLISTIC_RAMP_ADDR)
    ramp_bytes = rom_bytes[ramp_offset:ramp_offset + (RAMP_WORD_COUNT * 2)]
    if len(ramp_bytes) != (RAMP_WORD_COUNT * 2):
        raise SystemExit("error: ROM is too short for Ballistic ramp extraction")

    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    indices_path = args.out_manifest.with_name(args.out_manifest.stem + "_indices.bin")
    helper_cgram_path = args.out_manifest.with_name(args.out_manifest.stem + "_helper_cgram.bin")
    ramp_path = args.out_manifest.with_name(args.out_manifest.stem + "_ramp.bin")

    indices_path.write_bytes(indices_bytes)
    helper_cgram_path.write_bytes(helper_cgram_bytes)
    ramp_path.write_bytes(ramp_bytes)

    lines = [
        "# ballistic A39C runtime asset",
        "size 256 224",
        f"indices {relpath(indices_path, args.out_manifest)}",
        f"helper_cgram {relpath(helper_cgram_path, args.out_manifest)}",
        f"ramp {relpath(ramp_path, args.out_manifest)}",
        f"class_count {class_count}",
        f"timeline_count {timeline_entry_count}",
        f"step_frames {step_frames}",
        "dynamic_start 2",
        "dynamic_count 14",
        "counter_wrap 13",
    ]
    for class_index in range(class_count):
        lines.append(f"mapping {class_index} {mapping[class_index]}")

    args.out_manifest.write_text("\n".join(lines) + "\n", encoding="utf-8")

    if args.sequence_manifest:
        args.sequence_manifest.parent.mkdir(parents=True, exist_ok=True)
        args.sequence_manifest.write_text(
            "# type duration_frames path_a [path_b path_c]\n"
            f"ballistic_a39c {total_duration_frames} {relpath(args.out_manifest, args.sequence_manifest)}\n",
            encoding="utf-8",
        )

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(
            json.dumps(
                {
                    "source": {
                        "rom": str(args.rom.resolve()),
                        "helper_cgram": str(args.helper_cgram.resolve()),
                        "ballistic_rom_json": str(args.ballistic_rom_json.resolve()),
                    },
                    "outputs": {
                        "indices": relpath(indices_path, args.json_out),
                        "helper_cgram": relpath(helper_cgram_path, args.json_out),
                        "ramp": relpath(ramp_path, args.json_out),
                        "manifest": str(args.out_manifest.resolve()),
                    },
                    "class_count": class_count,
                    "timeline_count": timeline_entry_count,
                    "step_frames": step_frames,
                    "total_duration_frames": total_duration_frames,
                    "mapping": [
                        {"class_index": class_index, "cgram_index": mapping[class_index]}
                        for class_index in range(class_count)
                    ],
                    "ramp_words_preview": [
                        struct.unpack_from("<H", ramp_bytes, offset)[0]
                        for offset in range(0, min(len(ramp_bytes), 32), 2)
                    ],
                },
                indent=2,
            ) + "\n",
            encoding="utf-8",
        )

    print(f"wrote Ballistic A39C runtime asset {args.out_manifest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
