#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_bank1_helper_scene import cgram_to_rgb
from build_boot_vram import load_rom_window, parse_u16le
from decompress_td2_chunk import decode_26fb, decode_42fb
from render_mesen_snes_bg import (
    MODE7_SPRITE_PRIORITIES,
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    render_mode7_layer,
    render_objects,
    write_ppm,
)


VRAM_SIZE_BYTES = 0x10000
CGRAM_SIZE_BYTES = 0x0200
OAM_SIZE_BYTES = 0x0220

L00A00C_PAGE_SOURCE_ADDR = 0x9AED
L00A00C_PAGE_SOURCE_BANK = 0x04
L00A00C_BULK_SOURCE_ADDR = 0x9BF5
L00A00C_BULK_SOURCE_BANK = 0x04
L00A00C_PALETTE_HELPER_INDEX = 0x0001
L00A9F2_ADDR_TABLE = 0xA8F1
L00A9F2_BANK_TABLE = 0xA937
L00A9F2_CGRAM_DEST_TABLE = 0xA95A
L00A9F2_COUNT_TABLE = 0xA97D


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build an experimental bank1 L00A00C Mode 7 bootstrap scene by applying the "
            "ROM-side setup uploads onto optional VRAM/CGRAM/OAM seed dumps."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument(
        "output_prefix",
        type=Path,
        help="output prefix; writes _vram.bin, _cgram.bin, _ppu_state.json, optional _oam.bin, .ppm, and .json",
    )
    parser.add_argument(
        "--ppu-state-template",
        type=Path,
        required=True,
        help="flat PPU-state JSON used as the visible presentation template",
    )
    parser.add_argument("--seed-vram", type=Path, default=None, help="optional 64 KiB VRAM seed")
    parser.add_argument("--seed-cgram", type=Path, default=None, help="optional 512-byte CGRAM seed")
    parser.add_argument("--seed-oam", type=Path, default=None, help="optional 544-byte OAM seed")
    parser.add_argument(
        "--render-objects",
        action="store_true",
        help="render OBJ on top of the Mode 7 BG when --seed-oam is supplied",
    )
    return parser.parse_args()


def load_u16(rom_bytes: bytes, bank: int, addr: int) -> int:
    window, _ = load_rom_window(rom_bytes, bank, addr)
    return parse_u16le(window, 0)


def load_u8(rom_bytes: bytes, bank: int, addr: int) -> int:
    window, _ = load_rom_window(rom_bytes, bank, addr)
    return window[0]


def load_seed(path: Path | None, expected_size: int) -> bytearray:
    if path is None:
        return bytearray(expected_size)
    data = path.read_bytes()
    if len(data) != expected_size:
        raise ValueError(f"expected {expected_size} bytes in {path}, got {len(data)}")
    return bytearray(data)


def apply_l00065f_low(
    vram: bytearray,
    blob: bytes,
    *,
    x_word: int = 0,
    y_row: int = 0,
    vram_base_word: int = 0,
) -> dict:
    row_length_bytes = parse_u16le(blob, 0)
    row_count = parse_u16le(blob, 2)
    aux_header = parse_u16le(blob, 4)
    payload = memoryview(blob[6:])
    expected_payload_size = row_length_bytes * row_count
    if len(payload) < expected_payload_size:
        raise ValueError(
            f"L00065F blob truncated: expected {expected_payload_size} payload bytes, got {len(payload)}"
        )

    word_addr = ((y_row << 7) + vram_base_word + x_word) & 0xFFFF
    src_offset = 0
    for _ in range(row_count):
        for column in range(row_length_bytes):
            dest = ((word_addr + column) * 2) & 0xFFFF
            if dest < len(vram):
                vram[dest] = payload[src_offset + column]
        src_offset += row_length_bytes
        word_addr = (word_addr + 0x0080) & 0xFFFF

    return {
        "helper": "L00065F",
        "vram_word_addr": f"0x{vram_base_word + x_word:04X}",
        "row_length_bytes": row_length_bytes,
        "row_count": row_count,
        "aux_header": f"0x{aux_header:04X}",
        "payload_size": expected_payload_size,
    }


def apply_l00073e_high(vram: bytearray, source: bytes, *, vram_word_addr: int = 0) -> dict:
    for index, value in enumerate(source):
        dest = ((vram_word_addr + index) * 2) + 1
        if dest >= len(vram):
            break
        vram[dest] = value
    return {
        "helper": "L00073E",
        "vram_word_addr": f"0x{vram_word_addr:04X}",
        "length_bytes": len(source),
    }


def apply_palette(cgram: bytearray, source: bytes, cgram_dest: int, color_count: int) -> dict:
    byte_offset = (cgram_dest & 0xFF) * 2
    payload_size = color_count * 2
    cgram[byte_offset:byte_offset + payload_size] = source[:payload_size]
    return {
        "helper": "L000583",
        "cgram_dest": f"0x{cgram_dest & 0xFF:02X}",
        "color_count": color_count,
        "payload_size": payload_size,
    }


def load_palette_block(rom_bytes: bytes, helper_index: int) -> tuple[bytes, dict]:
    entry_word_index = helper_index * 2
    palette_source_addr = load_u16(rom_bytes, 0x01, L00A9F2_ADDR_TABLE + entry_word_index)
    palette_source_bank = load_u8(rom_bytes, 0x01, L00A9F2_BANK_TABLE + helper_index)
    palette_cgram_dest = load_u16(rom_bytes, 0x01, L00A9F2_CGRAM_DEST_TABLE + entry_word_index)
    palette_count_raw = load_u16(rom_bytes, 0x01, L00A9F2_COUNT_TABLE + entry_word_index)
    palette_color_count = palette_count_raw & 0x00FF
    palette_window, palette_rom_offset = load_rom_window(rom_bytes, palette_source_bank, palette_source_addr)
    payload_size = palette_color_count * 2
    return palette_window[:payload_size], {
        "helper": "L00A9F2",
        "helper_index": helper_index,
        "source_bank": palette_source_bank,
        "source_addr": f"0x{palette_source_addr:04X}",
        "rom_offset": f"0x{palette_rom_offset:06X}",
        "cgram_dest": f"0x{palette_cgram_dest & 0xFF:02X}",
        "color_count": palette_color_count,
    }


def build_scene(
    rom_bytes: bytes,
    ppu_state_template: dict[str, int | bool],
    seed_vram: bytearray,
    seed_cgram: bytearray,
    seed_oam: bytearray | None,
    render_objects_enabled: bool,
) -> tuple[bytes, bytes, bytes | None, dict[str, int | bool], bytes, dict]:
    vram = bytearray(seed_vram)
    cgram = bytearray(seed_cgram)
    oam = bytearray(seed_oam) if seed_oam is not None else None

    page_window, page_rom_offset = load_rom_window(rom_bytes, L00A00C_PAGE_SOURCE_BANK, L00A00C_PAGE_SOURCE_ADDR)
    page_blob, page_decode_summary = decode_42fb(page_window)
    page_apply_summary = apply_l00065f_low(vram, page_blob)

    bulk_window, bulk_rom_offset = load_rom_window(rom_bytes, L00A00C_BULK_SOURCE_BANK, L00A00C_BULK_SOURCE_ADDR)
    bulk_blob, bulk_decode_summary = decode_26fb(bulk_window)
    bulk_apply_summary = apply_l00073e_high(vram, bulk_blob)

    palette_source, palette_source_summary = load_palette_block(rom_bytes, L00A00C_PALETTE_HELPER_INDEX)
    palette_apply_summary = apply_palette(
        cgram,
        palette_source,
        int(palette_source_summary["cgram_dest"], 16),
        int(palette_source_summary["color_count"]),
    )

    state = dict(ppu_state_template)
    state["ppu.bgMode"] = 0x07
    state["ppu.mainScreenLayers"] = 0x11
    state["ppu.forcedBlank"] = False

    cgram_rgb = cgram_to_rgb(bytes(cgram))
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram_rgb[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    mode7_summary = render_mode7_layer(rgb, bytes(vram), cgram_rgb, state)
    obj_summary = None
    if render_objects_enabled and oam is not None and (int(state.get("ppu.mainScreenLayers", 0)) & 0x10) != 0:
        obj_summary = render_objects(
            rgb,
            bytes(vram),
            bytes(oam),
            cgram_rgb,
            state,
            priority_groups=set(MODE7_SPRITE_PRIORITIES),
        )

    summary = {
        "scene": "bank1_L00A00C_mode7_bootstrap_experimental",
        "source_routine": "01:A00C",
        "notes": [
            "Experimental ROM-side bootstrap builder for the static 958..977 post-Ballistic window.",
            "This applies the direct L00A00C uploads onto optional VRAM/CGRAM/OAM seeds and uses a PPU-state template for visible presentation.",
        ],
        "seeds": {
            "vram_seeded": any(seed_vram),
            "cgram_seeded": any(seed_cgram),
            "oam_seeded": oam is not None,
        },
        "jobs": [
            {
                "helper": "L001210 -> 42FB -> L00065F",
                "source_bank": L00A00C_PAGE_SOURCE_BANK,
                "source_addr": f"0x{L00A00C_PAGE_SOURCE_ADDR:04X}",
                "compressed_rom_offset": f"0x{page_rom_offset:06X}",
                "decode": page_decode_summary,
                "apply": page_apply_summary,
            },
            {
                "helper": "L001210 -> 26FB -> L00073E",
                "source_bank": L00A00C_BULK_SOURCE_BANK,
                "source_addr": f"0x{L00A00C_BULK_SOURCE_ADDR:04X}",
                "compressed_rom_offset": f"0x{bulk_rom_offset:06X}",
                "decode": bulk_decode_summary,
                "apply": bulk_apply_summary,
            },
            {
                "helper": palette_source_summary["helper"],
                "helper_index": palette_source_summary["helper_index"],
                "source_bank": palette_source_summary["source_bank"],
                "source_addr": palette_source_summary["source_addr"],
                "rom_offset": palette_source_summary["rom_offset"],
                "apply": palette_apply_summary,
            },
        ],
        "ppu_template_overrides": {
            "ppu.bgMode": 0x07,
            "ppu.mainScreenLayers": 0x11,
            "ppu.forcedBlank": False,
        },
        "render": {
            "mode7": mode7_summary,
            "objects": obj_summary,
        },
    }
    return bytes(vram), bytes(cgram), (bytes(oam) if oam is not None else None), state, bytes(rgb), summary


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    ppu_state_template = json.loads(args.ppu_state_template.read_text(encoding="utf-8"))
    seed_vram = load_seed(args.seed_vram, VRAM_SIZE_BYTES)
    seed_cgram = load_seed(args.seed_cgram, CGRAM_SIZE_BYTES)
    seed_oam = load_seed(args.seed_oam, OAM_SIZE_BYTES) if args.seed_oam is not None else None

    vram, cgram, oam, ppu_state, rgb, summary = build_scene(
        rom_bytes,
        ppu_state_template,
        seed_vram,
        seed_cgram,
        seed_oam,
        args.render_objects,
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
    json_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(f"wrote experimental L00A00C scene -> {ppm_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
