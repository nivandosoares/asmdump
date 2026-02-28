#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


LOROM_BANK_SIZE = 0x8000


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def cpu_to_rom_offset(header_size: int, bank: int, addr: int) -> int | None:
    if addr < 0x8000 or addr > 0xFFFF:
        return None
    return header_size + (bank * LOROM_BANK_SIZE) + (addr - 0x8000)


def read_u16(rom_bytes: bytes, offset: int) -> int:
    return rom_bytes[offset] | (rom_bytes[offset + 1] << 8)


def read_word_table(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    count: int,
) -> list[int]:
    table_offset = cpu_to_rom_offset(header_size, table_bank, table_addr)
    if table_offset is None:
        raise ValueError(f"invalid table address {table_bank:02X}:{table_addr:04X}")
    return [
        read_u16(rom_bytes, table_offset + (index * 2))
        for index in range(count)
    ]


def classify_compression(
    rom_bytes: bytes,
    header_size: int,
    source_bank: int,
    source_addr: int,
) -> dict:
    rom_offset = cpu_to_rom_offset(header_size, source_bank, source_addr)
    if rom_offset is None:
        return {"mapped": False}

    if rom_offset + 1 >= len(rom_bytes):
        return {"mapped": False}

    marker = f"{rom_bytes[rom_offset]:02X}{rom_bytes[rom_offset + 1]:02X}"
    label = {
        "42FB": "42FB",
        "26FB": "26FB",
        "67FB": "67FB",
        "27FB": "27FB",
    }.get(marker, f"0x{marker}")

    return {
        "mapped": True,
        "rom_offset": f"0x{rom_offset:06X}",
        "header": label,
    }


def make_source_entry(
    rom_bytes: bytes,
    header_size: int,
    source_bank: int,
    source_addr: int,
) -> dict:
    entry = {
        "source_bank": source_bank,
        "source_addr": f"0x{source_addr:04X}",
    }
    rom_offset = cpu_to_rom_offset(header_size, source_bank, source_addr)
    if rom_offset is not None:
        entry["rom_offset"] = f"0x{rom_offset:06X}"
    return entry


def pair_entries(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    count: int,
) -> list[dict]:
    words = read_word_table(rom_bytes, header_size, table_bank, table_addr, count * 2)
    entries = []
    for index in range(count):
        source_addr = words[index * 2]
        bank_word = words[(index * 2) + 1]
        source_bank = bank_word & 0x00FF
        entry = {"index": index}
        entry.update(make_source_entry(rom_bytes, header_size, source_bank, source_addr))
        entries.append(entry)
    return entries


def addr_entries(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    count: int,
    source_bank: int,
) -> list[dict]:
    words = read_word_table(rom_bytes, header_size, table_bank, table_addr, count)
    entries = []
    for index, source_addr in enumerate(words):
        entry = {"index": index}
        entry.update(make_source_entry(rom_bytes, header_size, source_bank, source_addr))
        entries.append(entry)
    return entries


def compressed_entries(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    count: int,
    source_bank: int,
) -> list[dict]:
    entries = addr_entries(rom_bytes, header_size, table_bank, table_addr, count, source_bank)
    for entry in entries:
        entry["compression"] = classify_compression(
            rom_bytes,
            header_size,
            entry["source_bank"],
            int(entry["source_addr"], 16),
        )
    return entries


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Extract a structured manifest for the bank 1 boot screen build near L008CA2."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("output", type=Path, help="output JSON path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    header_size = detect_header_size(len(rom_bytes))

    manifest = {
        "description": (
            "Structured summary of the bank 1 boot/title screen build path near L008CA2. "
            "This focuses on concrete VRAM/CGRAM uploads and callback installation."
        ),
        "entry_point": "01:8CA2",
        "ppu_setup": {
            "BGMODE": "0x21",
            "BG1SC": "0x01",
            "BG2SC": "0x0B",
            "BG3SC": "0x19",
            "BG12NBA": "0x23",
            "BG34NBA": "0x35",
            "TMAIN": "0x17",
            "OBJSEL": "0x03",
        },
        "palette_manifest": "tools/out/bank1_boot_palettes.json",
        "jobs": [
            {
                "name": "bank9_boot_vram_pages",
                "helper": "L0005AC",
                "source_table": "01:85DE",
                "source_bank": 0x09,
                "entry_count": 9,
                "vram_base_variants": ["0x0800", "0x1000"],
                "note": (
                    "Immediate paged VRAM uploads selected by the sign of $1CEA. "
                    "This appears to seed one of the front-end screen layouts."
                ),
                "entries": addr_entries(rom_bytes, header_size, 0x01, 0x85DE, 9, 0x09),
            },
            {
                "name": "bank8_bulk_vram_block",
                "helper": "L0006C9",
                "source_table": "01:85E4",
                "source_bank": 0x08,
                "entry_count": 8,
                "length_bytes": "0x1F80",
                "vram_dest": "0x2000",
                "entries": addr_entries(rom_bytes, header_size, 0x01, 0x85E4, 8, 0x08),
            },
            {
                "name": "mixed_page_uploads_to_vram_0000",
                "helper": "L0005AC",
                "source_table": "01:85C6",
                "entry_count": 4,
                "vram_base": "0x0000",
                "entries": pair_entries(rom_bytes, header_size, 0x01, 0x85C6, 4),
            },
            {
                "name": "mixed_bulk_uploads_to_vram_3000",
                "helper": "L0006C9",
                "source_table": "01:85D2",
                "entry_count": 4,
                "length_bytes": "0x3920",
                "vram_dest": "0x3000",
                "entries": pair_entries(rom_bytes, header_size, 0x01, 0x85D2, 4),
            },
            {
                "name": "compressed_bank7_group_a",
                "helper": "L001210 -> L0005AC",
                "source_table": "01:8564",
                "source_bank": 0x07,
                "entry_count": 9,
                "wram_decompress_dest": "0x7E:2000",
                "vram_base": "0x1800",
                "entries": compressed_entries(rom_bytes, header_size, 0x01, 0x8564, 9, 0x07),
            },
            {
                "name": "compressed_bank7_group_b",
                "helper": "L001210 -> L0006C9",
                "source_table": "01:8576",
                "source_bank": 0x07,
                "entry_count": 9,
                "wram_decompress_dest": "0x7E:2000",
                "vram_dest": "0x5000",
                "entries": compressed_entries(rom_bytes, header_size, 0x01, 0x8576, 9, 0x07),
            },
            {
                "name": "optional_overlay_to_vram_4d00",
                "helper": "L001210 -> L0006C9",
                "condition": "$1CE6 != 0",
                "source": {
                    "bank": 0x0D,
                    "addr": "0xEFDE",
                    "rom_offset": f"0x{cpu_to_rom_offset(header_size, 0x0D, 0xEFDE):06X}",
                    "compression": classify_compression(rom_bytes, header_size, 0x0D, 0xEFDE),
                },
                "wram_decompress_dest": "0x7E:2000",
                "vram_dest": "0x4D00",
            },
            {
                "name": "local_bank1_tilemap_patches",
                "helper": "L0006C9",
                "note": (
                    "Three small local uploads patch boot-path VRAM near 0x60B0. "
                    "Their exact semantic role is still open; they are not yet assumed "
                    "to be pure BG tilemap data."
                ),
                "patches": [
                    {
                        "source": make_source_entry(rom_bytes, header_size, 0x01, 0x8614),
                        "source_stride": "0x20",
                        "selector": "$1C78",
                        "default_value": 1,
                        "length_bytes": "0x20",
                        "vram_dest": "0x60B0",
                    },
                    {
                        "source": make_source_entry(rom_bytes, header_size, 0x01, 0x8614),
                        "source_stride": "0x20",
                        "selector": "$1C7A",
                        "default_value": 0,
                        "length_bytes": "0x20",
                        "vram_dest": "0x60C0",
                    },
                    {
                        "source": make_source_entry(rom_bytes, header_size, 0x01, 0x8674),
                        "length_bytes": "0x40",
                        "vram_dest": "0x60D0",
                    },
                ],
            },
        ],
        "callbacks_installed": {
            "irq": {
                "helper": "L000341",
                "bank": 0x01,
                "addr": "0x96A0",
                "v_timer": "0x0017",
                "h_timer_shadow": "0x0056",
            },
            "main": {
                "helper": "L000385",
                "bank": 0x02,
                "addr": "0x9016",
            },
            "nmi": {
                "helper": "L0003A0",
                "bank": 0x02,
                "addr": "0x8F3C",
            },
        },
    }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(manifest, indent=2), encoding="utf-8")
    print(f"extracted boot screen manifest with {len(manifest['jobs'])} jobs -> {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
