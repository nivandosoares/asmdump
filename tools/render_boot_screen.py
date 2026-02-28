#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from boot_state_model import compute_boot_state
from extract_snes_tiles import decode_tile


SCREEN_WIDTH = 256
SCREEN_HEIGHT = 224


def parse_hex(value: str) -> int:
    return int(value, 0)


def load_palette_manifest(path: Path) -> dict:
    manifest = json.loads(path.read_text(encoding="utf-8"))
    return {
        table["name"]: table
        for table in manifest.get("tables", [])
    }


def choose_entry(entries: list[dict], index: int) -> dict:
    index = min(max(index, 0), len(entries) - 1)
    return entries[index]


def apply_colors(cgram: list[tuple[int, int, int]], start: int, colors: list[list[int]]) -> None:
    for offset, color in enumerate(colors):
        cgram[start + offset] = tuple(int(channel) for channel in color)


def build_bg_cgram(palette_tables: dict, state: dict) -> tuple[list[tuple[int, int, int]], dict]:
    cgram = [(0, 0, 0)] * 256
    selected = {}

    index_00 = state["palette_indices"]["boot_cgram_00_1f"]
    entry_00 = choose_entry(palette_tables["boot_cgram_00_1f"]["entries"], index_00)
    apply_colors(cgram, 0x00, entry_00["colors_rgb888"])
    selected["boot_cgram_00_1f"] = entry_00["index"]

    # CGRAM 0x90+ is OBJ palette space. Keep the selection metadata for later,
    # but a BG-only preview only consumes colors 0x00-0x7F.
    for key, table_name in (
        ("boot_cgram_90", "boot_cgram_90"),
        ("boot_cgram_a0", "boot_cgram_a0"),
        ("boot_shared_subpalette_b0", "boot_shared_subpalette_sources"),
        ("boot_shared_subpalette_c0", "boot_shared_subpalette_sources"),
        ("boot_shared_subpalette_d0", "boot_shared_subpalette_sources"),
        ("boot_cgram_e0", "boot_cgram_e0"),
    ):
        selected[key] = choose_entry(
            palette_tables[table_name]["entries"],
            state["palette_indices"][key],
        )["index"]

    return cgram, selected


def bg_screen_base_word(sc_value: int) -> int:
    return (sc_value & 0xFC) << 8


def bg_screen_size(sc_value: int) -> tuple[int, int]:
    size = sc_value & 0x03
    return {
        0: (32, 32),
        1: (64, 32),
        2: (32, 64),
        3: (64, 64),
    }[size]


def bg_chr_base_word(nba_value: int, layer_name: str) -> int:
    if layer_name == "bg1":
        return (nba_value & 0x0F) << 12
    if layer_name == "bg2":
        return ((nba_value >> 4) & 0x0F) << 12
    if layer_name == "bg3":
        return (nba_value & 0x0F) << 12
    raise ValueError(f"unsupported layer name {layer_name}")


def read_tilemap_entry(vram: bytes, base_word: int, width_tiles: int, tile_x: int, tile_y: int) -> int:
    tile_x %= width_tiles
    block_x = tile_x // 32
    block_y = tile_y // 32
    local_x = tile_x % 32
    local_y = tile_y % 32
    block_word = base_word + (block_x * 0x0400) + (block_y * 0x0800)
    entry_word = block_word + (local_y * 32) + local_x
    offset = entry_word * 2
    if offset + 1 >= len(vram):
        return 0
    return vram[offset] | (vram[offset + 1] << 8)


def fetch_tile_pixels(vram: bytes, chr_base_word: int, tile_index: int, bpp: int) -> list[int]:
    tile_size = 16 if bpp == 2 else 32
    start = (chr_base_word * 2) + (tile_index * tile_size)
    end = start + tile_size
    if end > len(vram):
        return [0] * 64
    return decode_tile(vram[start:end], bpp)


def render_layer(
    rgb: bytearray,
    vram: bytes,
    cgram: list[tuple[int, int, int]],
    layer_name: str,
    tilemap_base_word: int,
    chr_base_word: int,
    screen_size: tuple[int, int],
    bpp: int,
    transparent_zero: bool,
) -> None:
    width_tiles, _ = screen_size
    tile_cache: dict[tuple[int, int], list[int]] = {}
    palette_stride = 4 if bpp == 2 else 16

    for screen_y in range(SCREEN_HEIGHT):
        tile_y = screen_y // 8
        pixel_y = screen_y & 7
        for screen_x in range(SCREEN_WIDTH):
            tile_x = screen_x // 8
            pixel_x = screen_x & 7
            entry = read_tilemap_entry(vram, tilemap_base_word, width_tiles, tile_x, tile_y)
            tile_index = entry & 0x03FF
            palette_index = (entry >> 10) & 0x07
            hflip = (entry & 0x4000) != 0
            vflip = (entry & 0x8000) != 0

            cache_key = (tile_index, bpp)
            pixels = tile_cache.get(cache_key)
            if pixels is None:
                pixels = fetch_tile_pixels(vram, chr_base_word, tile_index, bpp)
                tile_cache[cache_key] = pixels

            sample_x = 7 - pixel_x if hflip else pixel_x
            sample_y = 7 - pixel_y if vflip else pixel_y
            color_index = pixels[(sample_y * 8) + sample_x]
            if transparent_zero and color_index == 0:
                continue

            cgram_index = (palette_index * palette_stride) + color_index
            if cgram_index >= len(cgram):
                continue

            dst = ((screen_y * SCREEN_WIDTH) + screen_x) * 3
            rgb[dst:dst + 3] = bytes(cgram[cgram_index])


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Render a BG-only 256x224 boot/title preview from the TD2 boot VRAM snapshot."
    )
    parser.add_argument("vram", type=Path, help="raw VRAM snapshot built by build_boot_vram.py")
    parser.add_argument("palette_manifest", type=Path, help="structured boot palette manifest JSON")
    parser.add_argument("output", type=Path, help="output PPM path")
    parser.add_argument("--rom", type=Path, default=Path("game.smc"), help="ROM path used for state-table selection")
    parser.add_argument(
        "--variant",
        "--state-index",
        dest="variant",
        type=int,
        default=0,
        help="bank1 boot-state table index to model",
    )
    parser.add_argument("--selector-1c78", type=int, default=None, help="override $1C78")
    parser.add_argument("--selector-1c7a", type=int, default=None, help="override $1C7A")
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON summary path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    vram = args.vram.read_bytes()
    palette_tables = load_palette_manifest(args.palette_manifest)
    state = compute_boot_state(
        rom_bytes,
        state_index=args.variant,
        selector_1c78=args.selector_1c78,
        selector_1c7a=args.selector_1c7a,
    )
    cgram, selected_palette_entries = build_bg_cgram(palette_tables, state)

    ppu = state["ppu_setup"]
    layers = [
        {
            "name": "bg2",
            "tilemap_base_word": bg_screen_base_word(ppu["BG2SC"]),
            "chr_base_word": bg_chr_base_word(ppu["BG12NBA"], "bg2"),
            "screen_size": bg_screen_size(ppu["BG2SC"]),
            "bpp": 4,
        },
        {
            "name": "bg1",
            "tilemap_base_word": bg_screen_base_word(ppu["BG1SC"]),
            "chr_base_word": bg_chr_base_word(ppu["BG12NBA"], "bg1"),
            "screen_size": bg_screen_size(ppu["BG1SC"]),
            "bpp": 4,
        },
        {
            "name": "bg3",
            "tilemap_base_word": bg_screen_base_word(ppu["BG3SC"]),
            "chr_base_word": bg_chr_base_word(ppu["BG34NBA"], "bg3"),
            "screen_size": bg_screen_size(ppu["BG3SC"]),
            "bpp": 2,
        },
    ]

    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    for layer in layers:
        render_layer(
            rgb,
            vram,
            cgram,
            layer_name=layer["name"],
            tilemap_base_word=layer["tilemap_base_word"],
            chr_base_word=layer["chr_base_word"],
            screen_size=layer["screen_size"],
            bpp=layer["bpp"],
            transparent_zero=True,
        )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    write_ppm(args.output, SCREEN_WIDTH, SCREEN_HEIGHT, bytes(rgb))

    if args.json_out is not None:
        summary = {
            "variant": args.variant,
            "state_model": state,
            "selected_palette_entries": selected_palette_entries,
            "layers": layers,
            "notes": [
                "This renderer composes BG layers only.",
                "OBJ palettes and OAM-driven sprite composition are not implemented here.",
                "Only the boot-path BG palette upload at CGRAM 0x00-0x1F is consumed for pixels.",
            ],
        }
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(
        f"rendered boot/title BG preview for state {args.variant} -> {args.output} "
        f"({SCREEN_WIDTH}x{SCREEN_HEIGHT})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
