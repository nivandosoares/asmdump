#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


LOROM_BANK_SIZE = 0x8000
DEFAULT_PALETTE_SIZE = 16


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def bgr555_to_rgb888(value: int) -> list[int]:
    blue = (value >> 10) & 0x1F
    green = (value >> 5) & 0x1F
    red = value & 0x1F
    return [
        (red << 3) | (red >> 2),
        (green << 3) | (green >> 2),
        (blue << 3) | (blue >> 2),
    ]


def extract_bank_words(rom_bytes: bytes, bank_index: int) -> list[int]:
    header_size = detect_header_size(len(rom_bytes))
    bank_offset = header_size + (bank_index * LOROM_BANK_SIZE)
    bank_end = bank_offset + LOROM_BANK_SIZE

    if bank_end > len(rom_bytes):
        raise ValueError(
            f"bank {bank_index} is outside ROM bounds "
            f"(offset 0x{bank_offset:06X}, size {len(rom_bytes)})"
        )

    bank_bytes = rom_bytes[bank_offset:bank_end]
    return [
        bank_bytes[i] | (bank_bytes[i + 1] << 8)
        for i in range(0, len(bank_bytes), 2)
    ]


def group_colors(words: list[int], palette_size: int) -> list[list[list[int]]]:
    if len(words) % palette_size != 0:
        raise ValueError(
            f"word count {len(words)} is not divisible by palette size {palette_size}"
        )

    colors = [bgr555_to_rgb888(word) for word in words]
    return [
        colors[i:i + palette_size]
        for i in range(0, len(colors), palette_size)
    ]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Extract bank 3 palette-like data from a LoROM image into JSON."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("output", type=Path, help="output JSON path")
    parser.add_argument(
        "--bank",
        type=int,
        default=3,
        help="LoROM bank index to extract (default: 3)",
    )
    parser.add_argument(
        "--palette-size",
        type=int,
        default=DEFAULT_PALETTE_SIZE,
        help="colors per palette chunk (default: 16)",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    words = extract_bank_words(rom_bytes, args.bank)
    palettes = group_colors(words, args.palette_size)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(palettes, indent=2), encoding="utf-8")

    header_size = detect_header_size(len(rom_bytes))
    bank_offset = header_size + (args.bank * LOROM_BANK_SIZE)
    print(
        f"extracted {len(palettes)} palettes "
        f"({len(words)} words) from bank {args.bank} "
        f"at ROM offset 0x{bank_offset:06X} -> {args.output}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
