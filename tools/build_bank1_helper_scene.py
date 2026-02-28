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
DEFAULT_SCROLL = 0x03FF

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


def parse_int(value: str) -> int:
    return int(value, 0)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build a simple bank1 helper-driven front-end scene from ROM assets."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument(
        "output_prefix",
        type=Path,
        help="output prefix; writes _vram.bin, _cgram.bin, _ppu_state.json, .ppm, and .json",
    )
    parser.add_argument("--helper-index", type=int, required=True, help="index used by L00A9A0/L00A9CB/L00A9F2")
    parser.add_argument(
        "--visible-layer",
        choices=("bg1", "bg2", "bg3"),
        required=True,
        help="BG layer that is expected to be visible on the main screen",
    )
    parser.add_argument("--scene-name", default="bank1_helper_scene", help="label stored in the JSON summary")
    parser.add_argument("--source-routine", default="", help="optional bank1 routine label/address")
    parser.add_argument("--bg-mode", type=parse_int, default=0x01, help="PPU BGMODE value")
    parser.add_argument("--bg1sc", type=parse_int, default=0x01, help="PPU BG1SC value")
    parser.add_argument("--bg2sc", type=parse_int, default=0x09, help="PPU BG2SC value")
    parser.add_argument("--bg3sc", type=parse_int, default=0x11, help="PPU BG3SC value")
    parser.add_argument("--bg12nba", type=parse_int, default=0x42, help="PPU BG12NBA value")
    parser.add_argument("--bg34nba", type=parse_int, default=0x06, help="PPU BG34NBA value")
    parser.add_argument(
        "--tmain",
        type=parse_int,
        default=None,
        help="PPU TMAIN value; defaults to the chosen visible layer bit",
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


def visible_layer_tmain_bit(visible_layer: str) -> int:
    return {
        "bg1": 0x01,
        "bg2": 0x02,
        "bg3": 0x04,
    }[visible_layer]


def visible_layer_bpp(bg_mode: int, visible_layer: str) -> int:
    layer_index = {"bg1": 0, "bg2": 1, "bg3": 2}[visible_layer]
    if bg_mode == 1:
        return 2 if layer_index == 2 else 4
    raise ValueError(f"unsupported helper-scene bg mode {bg_mode}")


def render_helper_scene(
    vram: bytes,
    cgram: bytes,
    visible_layer: str,
    bg_mode: int,
    bg1sc: int,
    bg2sc: int,
    bg3sc: int,
    bg12nba: int,
    bg34nba: int,
) -> bytes:
    cgram_rgb = cgram_to_rgb(cgram)
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram_rgb[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    layer_config = {
        "bg1": {
            "tilemap_base_word": bg_screen_base_word(bg1sc),
            "chr_base_word": bg_chr_base_word(bg12nba, "bg1"),
            "screen_size": bg_screen_size(bg1sc),
        },
        "bg2": {
            "tilemap_base_word": bg_screen_base_word(bg2sc),
            "chr_base_word": bg_chr_base_word(bg12nba, "bg2"),
            "screen_size": bg_screen_size(bg2sc),
        },
        "bg3": {
            "tilemap_base_word": bg_screen_base_word(bg3sc),
            "chr_base_word": bg_chr_base_word(bg34nba, "bg3"),
            "screen_size": bg_screen_size(bg3sc),
        },
    }[visible_layer]

    render_layer(
        rgb,
        vram,
        cgram_rgb,
        layer_name=visible_layer,
        tilemap_base_word=layer_config["tilemap_base_word"],
        chr_base_word=layer_config["chr_base_word"],
        screen_size=layer_config["screen_size"],
        bpp=visible_layer_bpp(bg_mode, visible_layer),
        transparent_zero=True,
    )
    return bytes(rgb)


def build_ppu_state(
    bg_mode: int,
    bg1sc: int,
    bg2sc: int,
    bg3sc: int,
    bg12nba: int,
    bg34nba: int,
    tmain: int,
) -> dict[str, int | bool]:
    layer_states = [
        {
            "tilemapAddress": bg_screen_base_word(bg1sc),
            "chrAddress": bg_chr_base_word(bg12nba, "bg1"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
        {
            "tilemapAddress": bg_screen_base_word(bg2sc),
            "chrAddress": bg_chr_base_word(bg12nba, "bg2"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
        {
            "tilemapAddress": bg_screen_base_word(bg3sc),
            "chrAddress": bg_chr_base_word(bg34nba, "bg3"),
            "doubleWidth": True,
            "doubleHeight": False,
            "largeTiles": False,
            "hscroll": 0,
            "vscroll": DEFAULT_SCROLL,
        },
    ]

    state: dict[str, int | bool] = {
        "ppu.bgMode": bg_mode,
        "ppu.mainScreenLayers": tmain,
    }
    for layer_index, layer in enumerate(layer_states):
        for key, value in layer.items():
            state[f"ppu.layers[{layer_index}].{key}"] = value
    return state


def build_scene(
    rom_bytes: bytes,
    helper_index: int,
    visible_layer: str,
    scene_name: str,
    source_routine: str,
    bg_mode: int,
    bg1sc: int,
    bg2sc: int,
    bg3sc: int,
    bg12nba: int,
    bg34nba: int,
    tmain: int,
) -> tuple[bytes, bytes, dict, bytes]:
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

    ppu_state = build_ppu_state(bg_mode, bg1sc, bg2sc, bg3sc, bg12nba, bg34nba, tmain)
    rgb = render_helper_scene(
        bytes(vram),
        bytes(cgram),
        visible_layer=visible_layer,
        bg_mode=bg_mode,
        bg1sc=bg1sc,
        bg2sc=bg2sc,
        bg3sc=bg3sc,
        bg12nba=bg12nba,
        bg34nba=bg34nba,
    )

    summary = {
        "scene": scene_name,
        "helper_index": helper_index,
        "source_routine": source_routine,
        "visible_layer": visible_layer,
        "ppu_setup": {
            "BGMODE": f"0x{bg_mode:02X}",
            "BG1SC": f"0x{bg1sc:02X}",
            "BG2SC": f"0x{bg2sc:02X}",
            "BG3SC": f"0x{bg3sc:02X}",
            "BG12NBA": f"0x{bg12nba:02X}",
            "BG34NBA": f"0x{bg34nba:02X}",
            "TMAIN": f"0x{tmain:02X}",
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
            "This builder models the one-shot helper trio only.",
            "Animated follow-up callbacks can diverge from the static setup frame after the scene is built.",
        ],
    }
    return bytes(vram), bytes(cgram), summary, rgb


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    output_prefix = args.output_prefix
    tmain = args.tmain if args.tmain is not None else visible_layer_tmain_bit(args.visible_layer)

    vram, cgram, summary, rgb = build_scene(
        rom_bytes,
        helper_index=args.helper_index,
        visible_layer=args.visible_layer,
        scene_name=args.scene_name,
        source_routine=args.source_routine,
        bg_mode=args.bg_mode,
        bg1sc=args.bg1sc,
        bg2sc=args.bg2sc,
        bg3sc=args.bg3sc,
        bg12nba=args.bg12nba,
        bg34nba=args.bg34nba,
        tmain=tmain,
    )

    output_prefix.parent.mkdir(parents=True, exist_ok=True)
    vram_path = output_prefix.with_name(f"{output_prefix.name}_vram.bin")
    cgram_path = output_prefix.with_name(f"{output_prefix.name}_cgram.bin")
    ppu_state_path = output_prefix.with_name(f"{output_prefix.name}_ppu_state.json")
    ppm_path = output_prefix.with_suffix(".ppm")
    json_path = output_prefix.with_suffix(".json")

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    ppu_state_path.write_text(json.dumps(summary["ppu_state"], indent=2), encoding="utf-8")
    summary["output_files"] = {
        "vram": str(vram_path),
        "cgram": str(cgram_path),
        "ppu_state": str(ppu_state_path),
        "preview_ppm": str(ppm_path),
    }
    json_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_ppm(ppm_path, SCREEN_WIDTH, SCREEN_HEIGHT, rgb)

    print(
        f"built bank1 helper scene -> {ppm_path} "
        f"(helper index {args.helper_index}, layer {args.visible_layer})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
