#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path


LOROM_BANK_SIZE = 0x8000


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def read_bank(rom_bytes: bytes, bank_index: int) -> bytes:
    header_size = detect_header_size(len(rom_bytes))
    start = header_size + (bank_index * LOROM_BANK_SIZE)
    end = start + LOROM_BANK_SIZE
    if end > len(rom_bytes):
        raise ValueError(f"bank {bank_index} exceeds ROM bounds")
    return rom_bytes[start:end]


def decode_tile(tile: bytes, bpp: int) -> list[int]:
    if bpp == 2:
        expected = 16
    elif bpp == 4:
        expected = 32
    else:
        raise ValueError(f"unsupported bpp: {bpp}")

    if len(tile) != expected:
        raise ValueError(f"expected tile size {expected}, got {len(tile)}")

    pixels: list[int] = []
    for y in range(8):
        p0 = tile[y * 2 + 0]
        p1 = tile[y * 2 + 1]
        p2 = tile[16 + y * 2 + 0] if bpp >= 4 else 0
        p3 = tile[16 + y * 2 + 1] if bpp >= 4 else 0

        for x in range(8):
            bit = 7 - x
            color = ((p0 >> bit) & 1)
            color |= ((p1 >> bit) & 1) << 1
            if bpp >= 4:
                color |= ((p2 >> bit) & 1) << 2
                color |= ((p3 >> bit) & 1) << 3
            pixels.append(color)

    return pixels


def default_palette(color_count: int) -> list[tuple[int, int, int]]:
    if color_count <= 1:
        return [(0, 0, 0)]
    return [
        tuple([round((255 * i) / (color_count - 1))] * 3)
        for i in range(color_count)
    ]


def load_palette(path: Path, palette_index: int, color_count: int) -> list[tuple[int, int, int]]:
    if path is None:
        return default_palette(color_count)

    palettes = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(palettes, list) or not palettes:
        raise ValueError(f"{path} does not contain a palette list")
    if palette_index < 0 or palette_index >= len(palettes):
        raise ValueError(f"palette index {palette_index} out of range for {path}")

    palette = palettes[palette_index]
    if len(palette) < color_count:
        raise ValueError(f"palette {palette_index} in {path} has only {len(palette)} colors")

    return [tuple(int(channel) for channel in color) for color in palette[:color_count]]


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Extract and decode SNES planar tiles from a LoROM bank or raw planar dump."
    )
    parser.add_argument("input_path", type=Path, help="input ROM path or raw planar binary")
    parser.add_argument("output", type=Path, help="output PPM path")
    parser.add_argument("--bank", type=int, default=None, help="LoROM bank index")
    parser.add_argument(
        "--raw-binary",
        action="store_true",
        help="treat the input as a raw planar blob instead of a LoROM image",
    )
    parser.add_argument("--bpp", type=int, choices=(2, 4), required=True, help="tile bit depth")
    parser.add_argument(
        "--offset",
        type=lambda value: int(value, 0),
        default=0,
        help="bank-relative or raw-file byte offset",
    )
    parser.add_argument(
        "--byte-length",
        type=lambda value: int(value, 0),
        default=None,
        help="number of source bytes to decode from the offset",
    )
    parser.add_argument("--tile-count", type=int, default=None, help="number of tiles to decode")
    parser.add_argument("--columns", type=int, default=32, help="tile columns per sheet")
    parser.add_argument("--palette-json", type=Path, default=None, help="optional palette JSON path")
    parser.add_argument("--palette-index", type=int, default=0, help="palette index inside palette JSON")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    input_bytes = args.input_path.read_bytes()
    if args.raw_binary:
        if args.bank is not None:
            raise ValueError("--bank cannot be used together with --raw-binary")
        source_bytes = input_bytes
        source_desc = f"raw blob {args.input_path}"
        source_offset_desc = f"offset 0x{args.offset:06X}"
    else:
        if args.bank is None:
            raise ValueError("--bank is required unless --raw-binary is set")
        source_bytes = read_bank(input_bytes, args.bank)
        header_size = detect_header_size(len(input_bytes))
        rom_offset = header_size + (args.bank * LOROM_BANK_SIZE) + args.offset
        source_desc = f"bank {args.bank}"
        source_offset_desc = f"ROM offset 0x{rom_offset:06X}"
    tile_size = 16 if args.bpp == 2 else 32
    color_count = 1 << args.bpp

    if args.offset < 0 or args.offset >= len(source_bytes):
        raise ValueError(f"offset 0x{args.offset:X} is out of range for {source_desc}")

    source_bytes = source_bytes[args.offset:]
    if args.byte_length is not None:
        if args.byte_length <= 0:
            raise ValueError("--byte-length must be positive")
        source_bytes = source_bytes[:args.byte_length]
    available_tiles = len(source_bytes) // tile_size
    tile_count = available_tiles if args.tile_count is None else min(args.tile_count, available_tiles)
    if tile_count <= 0:
        raise ValueError("no tiles available to decode")

    palette = load_palette(args.palette_json, args.palette_index, color_count)
    columns = max(1, args.columns)
    rows = math.ceil(tile_count / columns)
    width = columns * 8
    height = rows * 8
    rgb = bytearray(width * height * 3)

    for tile_index in range(tile_count):
        tile = source_bytes[tile_index * tile_size:(tile_index + 1) * tile_size]
        pixels = decode_tile(tile, args.bpp)
        tile_x = (tile_index % columns) * 8
        tile_y = (tile_index // columns) * 8

        for py in range(8):
            for px in range(8):
                color = palette[pixels[py * 8 + px]]
                dst = ((tile_y + py) * width + (tile_x + px)) * 3
                rgb[dst:dst + 3] = bytes(color)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    write_ppm(args.output, width, height, bytes(rgb))

    palette_desc = f"palette {args.palette_index} from {args.palette_json}" if args.palette_json else "default grayscale"
    print(
        f"decoded {tile_count} tiles from {source_desc} "
        f"({source_offset_desc}, {args.bpp}bpp, {palette_desc}) -> {args.output} "
        f"as {width}x{height}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
