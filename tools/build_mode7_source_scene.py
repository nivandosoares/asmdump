#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_bank1_helper_scene import cgram_to_rgb
from build_boot_vram import load_rom_window
from render_mesen_snes_bg import (
    MODE7_OBJECT_PRIORITY_GROUPS,
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    render_mode7_layer,
    render_objects,
    write_ppm,
)


VRAM_SIZE_BYTES = 0x10000
CGRAM_SIZE_BYTES = 0x0200
OAM_SIZE_BYTES = 0x0220


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a Mode 7 scene by seeding VRAM and patching one or more VRAM word regions "
            "from ROM source blobs before rendering."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("output_prefix", type=Path, help="output prefix for scene assets")
    parser.add_argument("--seed-vram", type=Path, required=True, help="seed VRAM image")
    parser.add_argument("--cgram", type=Path, required=True, help="CGRAM image used for rendering")
    parser.add_argument("--ppu-state", type=Path, required=True, help="PPU-state JSON used for rendering")
    parser.add_argument(
        "--patch",
        action="append",
        default=[],
        metavar="DEST_WORD:SOURCE_ADDR[:SIZE]",
        help=(
            "Patch specification using VRAM word destination, ROM source address, and optional byte size. "
            "Example: 0x4920:0x1AACA0:0x100"
        ),
    )
    parser.add_argument(
        "--oam",
        type=Path,
        help="optional OAM binary used for OBJ rendering",
    )
    parser.add_argument(
        "--render-objects",
        action="store_true",
        help="render OBJ on top of the Mode 7 background when OAM is supplied",
    )
    return parser.parse_args()


def parse_int(value: str) -> int:
    return int(value, 0)


def load_binary(path: Path, expected_size: int | None = None) -> bytes:
    data = path.read_bytes()
    if expected_size is not None and len(data) != expected_size:
        raise ValueError(f"expected {expected_size} bytes in {path}, got {len(data)}")
    return data


def parse_patch_spec(spec: str) -> dict[str, int]:
    parts = spec.split(":")
    if len(parts) not in (2, 3):
        raise ValueError(f"invalid patch spec {spec!r}")
    dest_word = parse_int(parts[0])
    source_addr = parse_int(parts[1])
    size = parse_int(parts[2]) if len(parts) == 3 else 0x100
    return {
        "dest_word": dest_word,
        "source_addr": source_addr,
        "size": size,
    }


def apply_patch_region(vram: bytearray, rom_bytes: bytes, patch: dict[str, int]) -> dict[str, object]:
    dest_word = patch["dest_word"]
    source_addr = patch["source_addr"]
    size = patch["size"]
    source_bank = (source_addr >> 16) & 0xFF
    source_cpu_addr = source_addr & 0xFFFF

    window, rom_offset = load_rom_window(rom_bytes, source_bank, source_cpu_addr)
    blob = window[:size]
    if len(blob) != size:
        raise ValueError(
            f"patch source {source_bank:02X}:{source_cpu_addr:04X} truncated: "
            f"expected {size} bytes, got {len(blob)}"
        )

    dest_byte_offset = dest_word * 2
    end = min(dest_byte_offset + size, len(vram))
    vram[dest_byte_offset:end] = blob[: end - dest_byte_offset]

    return {
        "dest_word": f"0x{dest_word:04X}",
        "dest_byte_offset": f"0x{dest_byte_offset:04X}",
        "source_addr": f"0x{source_addr:06X}",
        "source_bank": source_bank,
        "source_cpu_addr": f"0x{source_cpu_addr:04X}",
        "rom_offset": f"0x{rom_offset:06X}",
        "size": size,
    }


def main() -> int:
    args = parse_args()
    if not args.patch:
        raise SystemExit("error: at least one --patch spec is required")

    rom_bytes = args.rom.read_bytes()
    vram = bytearray(load_binary(args.seed_vram, expected_size=VRAM_SIZE_BYTES))
    cgram = load_binary(args.cgram, expected_size=CGRAM_SIZE_BYTES)
    ppu_state = json.loads(args.ppu_state.read_text(encoding="utf-8"))
    oam = load_binary(args.oam, expected_size=OAM_SIZE_BYTES) if args.oam is not None else None

    patches = [parse_patch_spec(spec) for spec in args.patch]
    applied = [apply_patch_region(vram, rom_bytes, patch) for patch in patches]

    cgram_rgb = cgram_to_rgb(cgram)
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram_rgb[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    if int(ppu_state.get("ppu.bgMode", 0)) != 0x07:
        raise SystemExit("error: build_mode7_source_scene.py currently expects Mode 7 PPU state")

    mode7_summary = render_mode7_layer(rgb, bytes(vram), cgram_rgb, ppu_state)
    obj_summary = None
    if args.render_objects and oam is not None and (int(ppu_state.get("ppu.mainScreenLayers", 0)) & 0x10) != 0:
        obj_summary = render_objects(
            rgb,
            bytes(vram),
            oam,
            cgram_rgb,
            ppu_state,
            priority_groups=set(MODE7_OBJECT_PRIORITY_GROUPS),
        )

    prefix = args.output_prefix
    prefix.parent.mkdir(parents=True, exist_ok=True)

    vram_path = prefix.with_name(prefix.name + "_vram.bin")
    cgram_path = prefix.with_name(prefix.name + "_cgram.bin")
    ppu_path = prefix.with_name(prefix.name + "_ppu_state.json")
    oam_path = prefix.with_name(prefix.name + "_oam.bin")
    ppm_path = prefix.with_suffix(".ppm")
    json_path = prefix.with_suffix(".json")

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    ppu_path.write_text(json.dumps(ppu_state, indent=2), encoding="utf-8")
    if oam is not None:
        oam_path.write_bytes(oam)
    write_ppm(ppm_path, SCREEN_WIDTH, SCREEN_HEIGHT, rgb)

    summary = {
        "scene": "mode7_source_scene",
        "seed_vram": str(args.seed_vram.resolve()),
        "cgram": str(args.cgram.resolve()),
        "ppu_state": str(args.ppu_state.resolve()),
        "oam": str(args.oam.resolve()) if args.oam is not None else None,
        "patches": applied,
        "render": {
            "mode7": mode7_summary,
            "objects": obj_summary,
        },
    }
    json_path.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    print(f"wrote Mode 7 source scene -> {ppm_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
