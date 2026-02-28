#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_boot_vram import (
    BOOT_PAGE_STRIDE_WORDS,
    apply_l0005ac_blob,
    apply_l0006c9_bytes,
    load_rom_window,
    parse_u16le,
    read_l0005ac_blob,
    read_l0006c9_blob,
)
from render_boot_screen import (
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    bg_chr_base_word,
    bg_screen_base_word,
    bg_screen_size,
    render_layer,
    write_ppm,
)


VRAM_SIZE_BYTES = 0x10000
CGRAM_SIZE_BYTES = 0x0200
L009D1C_HELPER_INDEX = 0

L00A9A0_ADDR_TABLE = 0xA789
L00A9A0_BANK_TABLE = 0xA7D3
L00A9A0_VRAM_BASE_TABLE = 0xA7F8
L00A9CB_ADDR_TABLE = 0xA842
L00A9CB_BANK_TABLE = 0xA888
L00A9CB_VRAM_DEST_TABLE = 0xA8AB
L00A9F2_ADDR_TABLE = 0xA8F1
L00A9F2_BANK_TABLE = 0xA937
L00A9F2_CGRAM_DEST_TABLE = 0xA95A
L00A9F2_COUNT_TABLE = 0xA97D

BGMODE = 0x01
BG1SC = 0x01
BG2SC = 0x09
BG3SC = 0x11
BG12NBA = 0x42
BG34NBA = 0x06
TMAIN = 0x04
DEFAULT_SCROLL = 0x03FF


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build the bank1 L009D1C copyright/credits scene from ROM assets."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument(
        "output_prefix",
        type=Path,
        help="output prefix; writes _vram.bin, _cgram.bin, _ppu_state.json, .ppm, and .json",
    )
    parser.add_argument(
        "--helper-index",
        type=int,
        default=L009D1C_HELPER_INDEX,
        help="helper-table index passed to L00A9A0/L00A9CB/L00A9F2 (default: 0)",
    )
    return parser.parse_args()


def load_u16(rom_bytes: bytes, bank: int, addr: int) -> int:
    window, _ = load_rom_window(rom_bytes, bank, addr)
    return parse_u16le(window, 0)


def load_u8(rom_bytes: bytes, bank: int, addr: int) -> int:
    window, _ = load_rom_window(rom_bytes, bank, addr)
    return window[0]


def detect_compression(rom_bytes: bytes, bank: int, addr: int) -> dict | None:
    window, _ = load_rom_window(rom_bytes, bank, addr)
    if len(window) < 2:
        return None
    marker = f"{window[0]:02X}{window[1]:02X}"
    if marker in ("42FB", "26FB"):
        return {"header": marker}
    return None


def build_ppu_state() -> dict[str, int | bool]:
    layer_states = [
        {
            "tilemapAddress": bg_screen_base_word(BG1SC),
            "chrAddress": bg_chr_base_word(BG12NBA, "bg1"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
        {
            "tilemapAddress": bg_screen_base_word(BG2SC),
            "chrAddress": bg_chr_base_word(BG12NBA, "bg2"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
        {
            "tilemapAddress": bg_screen_base_word(BG3SC),
            "chrAddress": bg_chr_base_word(BG34NBA, "bg3"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
    ]

    state: dict[str, int | bool] = {
        "ppu.bgMode": BGMODE,
        "ppu.mainScreenLayers": TMAIN,
    }
    for layer_index, layer in enumerate(layer_states):
        for key, value in layer.items():
            state[f"ppu.layers[{layer_index}].{key}"] = value
    return state


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


def cgram_to_rgb(cgram: bytes) -> list[tuple[int, int, int]]:
    colors: list[tuple[int, int, int]] = []
    for offset in range(0, len(cgram), 2):
        value = cgram[offset] | (cgram[offset + 1] << 8)
        red = value & 0x1F
        green = (value >> 5) & 0x1F
        blue = (value >> 10) & 0x1F
        colors.append((
            (red << 3) | (red >> 2),
            (green << 3) | (green >> 2),
            (blue << 3) | (blue >> 2),
        ))
    return colors


def render_credits_scene(vram: bytes, cgram: bytes) -> bytes:
    cgram_rgb = cgram_to_rgb(cgram)
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram_rgb[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    render_layer(
        rgb,
        vram,
        cgram_rgb,
        layer_name="bg3",
        tilemap_base_word=bg_screen_base_word(BG3SC),
        chr_base_word=bg_chr_base_word(BG34NBA, "bg3"),
        screen_size=bg_screen_size(BG3SC),
        bpp=2,
        transparent_zero=True,
    )
    return bytes(rgb)


def build_scene(rom_bytes: bytes, helper_index: int) -> tuple[bytes, bytes, dict, bytes]:
    entry_word_index = helper_index * 2

    page_source_addr = load_u16(rom_bytes, 0x01, L00A9A0_ADDR_TABLE + entry_word_index)
    page_source_bank = load_u8(rom_bytes, 0x01, L00A9A0_BANK_TABLE + helper_index)
    page_vram_base = load_u16(rom_bytes, 0x01, L00A9A0_VRAM_BASE_TABLE + entry_word_index)

    bulk_source_addr = load_u16(rom_bytes, 0x01, L00A9CB_ADDR_TABLE + entry_word_index)
    bulk_source_bank = load_u8(rom_bytes, 0x01, L00A9CB_BANK_TABLE + helper_index)
    bulk_vram_dest = load_u16(rom_bytes, 0x01, L00A9CB_VRAM_DEST_TABLE + entry_word_index)

    palette_source_addr = load_u16(rom_bytes, 0x01, L00A9F2_ADDR_TABLE + entry_word_index)
    palette_source_bank = load_u8(rom_bytes, 0x01, L00A9F2_BANK_TABLE + helper_index)
    palette_cgram_dest = load_u16(rom_bytes, 0x01, L00A9F2_CGRAM_DEST_TABLE + entry_word_index)
    palette_count_raw = load_u16(rom_bytes, 0x01, L00A9F2_COUNT_TABLE + entry_word_index)
    palette_color_count = palette_count_raw & 0x00FF

    page_compression = detect_compression(rom_bytes, page_source_bank, page_source_addr)
    bulk_compression = detect_compression(rom_bytes, bulk_source_bank, bulk_source_addr)

    vram = bytearray(VRAM_SIZE_BYTES)
    cgram = bytearray(CGRAM_SIZE_BYTES)

    page_blob, page_source_meta = read_l0005ac_blob(
        rom_bytes,
        page_source_bank,
        page_source_addr,
        page_compression,
    )
    page_apply_meta = apply_l0005ac_blob(vram, page_blob, page_vram_base, BOOT_PAGE_STRIDE_WORDS)

    bulk_blob, bulk_source_meta = read_l0006c9_blob(
        rom_bytes,
        bulk_source_bank,
        bulk_source_addr,
        bulk_compression,
    )
    bulk_apply_meta = apply_l0006c9_bytes(vram, bulk_blob, bulk_vram_dest, len(bulk_blob))

    palette_window, palette_rom_offset = load_rom_window(rom_bytes, palette_source_bank, palette_source_addr)
    palette_payload_size = palette_color_count * 2
    palette_source = palette_window[:palette_payload_size]
    palette_apply_meta = apply_palette(cgram, palette_source, palette_cgram_dest, palette_color_count)

    ppu_state = build_ppu_state()
    rgb = render_credits_scene(bytes(vram), bytes(cgram))

    summary = {
        "scene": "bank1_L009D1C_credits",
        "helper_index": helper_index,
        "source_routine": "01:9D1C",
        "ppu_setup": {
            "BGMODE": f"0x{BGMODE:02X}",
            "BG1SC": f"0x{BG1SC:02X}",
            "BG2SC": f"0x{BG2SC:02X}",
            "BG3SC": f"0x{BG3SC:02X}",
            "BG12NBA": f"0x{BG12NBA:02X}",
            "BG34NBA": f"0x{BG34NBA:02X}",
            "TMAIN": f"0x{TMAIN:02X}",
        },
        "jobs": [
            {
                "helper": "L00A9A0",
                "source_bank": page_source_bank,
                "source_addr": f"0x{page_source_addr:04X}",
                "compression": page_compression["header"] if page_compression else "raw",
                "source": page_source_meta,
                "apply": page_apply_meta,
            },
            {
                "helper": "L00A9CB",
                "source_bank": bulk_source_bank,
                "source_addr": f"0x{bulk_source_addr:04X}",
                "compression": bulk_compression["header"] if bulk_compression else "raw",
                "source": bulk_source_meta,
                "apply": bulk_apply_meta,
            },
            {
                "helper": "L00A9F2",
                "source_bank": palette_source_bank,
                "source_addr": f"0x{palette_source_addr:04X}",
                "raw_rom_offset": f"0x{palette_rom_offset:06X}",
                "apply": palette_apply_meta,
            },
        ],
        "ppu_state": ppu_state,
        "notes": [
            "This scene corresponds to the colored copyright/credits screen shown about 5 seconds after power-on.",
            "The VRAM/CGRAM build here is ROM-driven from the L009D1C helper trio, not copied from a live emulator dump.",
            "L00A9CB entry 0 is a 42FB-compressed blob consumed through L0006C9.",
        ],
    }
    return bytes(vram), bytes(cgram), summary, rgb


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    output_prefix = args.output_prefix
    output_prefix.parent.mkdir(parents=True, exist_ok=True)

    vram, cgram, summary, rgb = build_scene(rom_bytes, args.helper_index)
    ppu_state = summary["ppu_state"]

    vram_path = output_prefix.with_name(f"{output_prefix.name}_vram.bin")
    cgram_path = output_prefix.with_name(f"{output_prefix.name}_cgram.bin")
    ppu_state_path = output_prefix.with_name(f"{output_prefix.name}_ppu_state.json")
    ppm_path = output_prefix.with_suffix(".ppm")
    json_path = output_prefix.with_suffix(".json")

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    ppu_state_path.write_text(json.dumps(ppu_state, indent=2), encoding="utf-8")

    summary["output_files"] = {
        "vram": str(vram_path),
        "cgram": str(cgram_path),
        "ppu_state": str(ppu_state_path),
        "preview_ppm": str(ppm_path),
    }
    json_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_ppm(ppm_path, SCREEN_WIDTH, SCREEN_HEIGHT, rgb)

    print(
        f"built bank1 credits scene -> {ppm_path} "
        f"(helper index {args.helper_index}, {len(summary['jobs'])} jobs)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
