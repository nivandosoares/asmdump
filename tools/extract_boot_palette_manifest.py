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


def bgr555_to_rgb888(value: int) -> list[int]:
    blue = (value >> 10) & 0x1F
    green = (value >> 5) & 0x1F
    red = value & 0x1F
    return [
        (red << 3) | (red >> 2),
        (green << 3) | (green >> 2),
        (blue << 3) | (blue >> 2),
    ]


def read_palette(
    rom_bytes: bytes,
    header_size: int,
    source_bank: int,
    source_addr: int,
    color_count: int,
) -> dict:
    rom_offset = cpu_to_rom_offset(header_size, source_bank, source_addr)
    if rom_offset is None:
        return {
            "mapped": False,
            "source_bank": source_bank,
            "source_addr": f"0x{source_addr:04X}",
            "color_count": color_count,
            "colors_bgr555": [],
            "colors_rgb888": [],
        }

    byte_length = color_count * 2
    end = rom_offset + byte_length
    if end > len(rom_bytes):
        raise ValueError(
            f"palette source {source_bank:02X}:{source_addr:04X} exceeds ROM bounds"
        )

    words = [
        read_u16(rom_bytes, rom_offset + i)
        for i in range(0, byte_length, 2)
    ]
    return {
        "mapped": True,
        "source_bank": source_bank,
        "source_addr": f"0x{source_addr:04X}",
        "rom_offset": f"0x{rom_offset:06X}",
        "color_count": color_count,
        "colors_bgr555": [f"0x{word:04X}" for word in words],
        "colors_rgb888": [bgr555_to_rgb888(word) for word in words],
    }


def extract_bundle_table(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    entry_count: int,
    cgram_start: int,
    color_count: int,
    name: str,
) -> dict:
    table_offset = cpu_to_rom_offset(header_size, table_bank, table_addr)
    if table_offset is None:
        raise ValueError(f"invalid bundle table {table_bank:02X}:{table_addr:04X}")

    entries = []
    for index in range(entry_count):
        entry_offset = table_offset + (index * 8)
        source_addr = read_u16(rom_bytes, entry_offset)
        source_bank = read_u16(rom_bytes, entry_offset + 2) & 0xFF
        meta_addr = read_u16(rom_bytes, entry_offset + 4)
        meta_bank = read_u16(rom_bytes, entry_offset + 6) & 0xFF
        entry = {
            "index": index,
            "cgram_start": f"0x{cgram_start:02X}",
            "metadata_source": {
                "bank": source_bank,
                "pair_addr": f"0x{table_addr + (index * 8):04X}",
                "meta_addr": f"0x{meta_addr:04X}",
                "meta_bank": meta_bank,
            },
        }
        entry.update(read_palette(rom_bytes, header_size, source_bank, source_addr, color_count))
        entries.append(entry)

    return {
        "name": name,
        "table_bank": table_bank,
        "table_addr": f"0x{table_addr:04X}",
        "entry_stride": 8,
        "cgram_start": f"0x{cgram_start:02X}",
        "color_count": color_count,
        "entries": entries,
    }


def extract_direct_table(
    rom_bytes: bytes,
    header_size: int,
    table_bank: int,
    table_addr: int,
    entry_count: int,
    cgram_start: int,
    color_count: int,
    source_bank: int | None,
    name: str,
) -> dict:
    table_offset = cpu_to_rom_offset(header_size, table_bank, table_addr)
    if table_offset is None:
        raise ValueError(f"invalid direct table {table_bank:02X}:{table_addr:04X}")

    entries = []
    for index in range(entry_count):
        entry_offset = table_offset + (index * 2 if source_bank is not None else index * 4)
        if source_bank is None:
            source_addr = read_u16(rom_bytes, entry_offset)
            source_bank_value = read_u16(rom_bytes, entry_offset + 2) & 0xFF
            stride = 4
        else:
            source_addr = read_u16(rom_bytes, entry_offset)
            source_bank_value = source_bank
            stride = 2

        entry = {
            "index": index,
            "cgram_start": f"0x{cgram_start:02X}",
            "table_entry_addr": f"0x{table_addr + (index * stride):04X}",
        }
        entry.update(
            read_palette(
                rom_bytes,
                header_size,
                source_bank_value,
                source_addr,
                color_count,
            )
        )
        entries.append(entry)

    return {
        "name": name,
        "table_bank": table_bank,
        "table_addr": f"0x{table_addr:04X}",
        "entry_stride": 2 if source_bank is not None else 4,
        "cgram_start": f"0x{cgram_start:02X}",
        "color_count": color_count,
        "entries": entries,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Extract known boot-time palette sources used by bank 1 into JSON."
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
            "Known palette sources used by the bank 1 boot/setup flow near "
            "L008CA2. Entries come from tables referenced by L000583."
        ),
        "notes": [
            "CGRAM 0x00 uploads 32 colors from bank 6 via the pointer table at bank1:0x8588.",
            "CGRAM 0x90 and 0xA0 use 16-color bundles sourced from bank1:0x8364 and bank1:0x8384.",
            "CGRAM 0xE0 uses 32-color uploads sourced from bank1:0x839C.",
            "CGRAM 0xB0/0xC0/0xD0 pull 16-color palettes from the shared direct source table at bank1:0x836C.",
            "This boot path shows palette data distributed across banks 6, 11, and 31 rather than centralized in bank 3.",
        ],
        "tables": [
            extract_direct_table(
                rom_bytes,
                header_size,
                table_bank=1,
                table_addr=0x8588,
                entry_count=16,
                cgram_start=0x00,
                color_count=0x20,
                source_bank=0x06,
                name="boot_cgram_00_1f",
            ),
            extract_bundle_table(
                rom_bytes,
                header_size,
                table_bank=1,
                table_addr=0x8364,
                entry_count=8,
                cgram_start=0x90,
                color_count=0x10,
                name="boot_cgram_90",
            ),
            extract_bundle_table(
                rom_bytes,
                header_size,
                table_bank=1,
                table_addr=0x8384,
                entry_count=8,
                cgram_start=0xA0,
                color_count=0x10,
                name="boot_cgram_a0",
            ),
            extract_direct_table(
                rom_bytes,
                header_size,
                table_bank=1,
                table_addr=0x839C,
                entry_count=9,
                cgram_start=0xE0,
                color_count=0x20,
                source_bank=None,
                name="boot_cgram_e0",
            ),
            extract_direct_table(
                rom_bytes,
                header_size,
                table_bank=1,
                table_addr=0x836C,
                entry_count=16,
                cgram_start=0xB0,
                color_count=0x10,
                source_bank=None,
                name="boot_shared_subpalette_sources",
            ),
        ],
    }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(manifest, indent=2), encoding="utf-8")

    total_entries = sum(len(table["entries"]) for table in manifest["tables"])
    print(
        f"extracted {len(manifest['tables'])} known boot palette tables "
        f"({total_entries} entries) -> {args.output}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
