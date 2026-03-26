#!/usr/bin/env python3
"""Decode the front-end long-pointer table used by bank-1 menu helpers.

The recovered bank-1 helpers build a long pointer by overlapping:

  lda #$1E80 ; sta $11
  lda #$8000 ; sta $10

which yields the long base pointer 1E:8000 for `[$10]` lookups in L00179B and
L001662. This tool decodes selected rows from that table and summarizes the
descriptor headers they target.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import asdict, dataclass
from datetime import date
from pathlib import Path
from typing import Iterable


DEFAULT_BASE_BANK = 0x1E
DEFAULT_BASE_ADDR = 0x8000
DEFAULT_INDICES = "8-14"


@dataclass
class DecodedEntry:
    index: int
    entry_bytes: str
    table_file_offset: str
    selector_surface: str
    target_bank: str
    target_addr: str
    target_file_offset: str
    header_words: list[str]
    object_count: int
    header_flags: dict[str, bool]
    first_payload_words: list[str]


def parse_indices(spec: str) -> list[int]:
    indices: list[int] = []
    for part in spec.split(","):
        token = part.strip()
        if not token:
            continue
        if "-" in token:
            start_s, end_s = token.split("-", 1)
            start = int(start_s, 0)
            end = int(end_s, 0)
            step = 1 if end >= start else -1
            indices.extend(range(start, end + step, step))
        else:
            indices.append(int(token, 0))
    return indices


def lorom_offset(bank: int, addr: int) -> int:
    if not 0 <= bank <= 0x7F:
        raise ValueError(f"bank out of LoROM range: {bank:#x}")
    if not 0x8000 <= addr <= 0xFFFF:
        raise ValueError(f"addr out of LoROM upper-half range: {addr:#x}")
    return bank * 0x8000 + (addr - 0x8000)


def read_word_le(blob: bytes, offset: int) -> int:
    return blob[offset] | (blob[offset + 1] << 8)


def selector_surface_for_index(index: int) -> str:
    if 8 <= index <= 10:
        return "car-facing adjacent helper ($0202 + 0x0008)"
    if 11 <= index <= 14:
        return "track-facing adjacent helper ($1C7C + 0x000B)"
    return "unclassified current lane"


def decode_entry(
    rom: bytes,
    *,
    base_bank: int,
    base_addr: int,
    index: int,
) -> DecodedEntry:
    table_off = lorom_offset(base_bank, base_addr) + index * 4
    entry = rom[table_off : table_off + 4]
    if len(entry) != 4:
        raise ValueError(f"entry {index} truncated at file offset {table_off:#x}")

    low_delta = read_word_le(entry, 0)
    bank_delta_word = read_word_le(entry, 2)

    target_addr_full = base_addr + low_delta
    target_addr = target_addr_full & 0xFFFF
    carry = 1 if target_addr_full > 0xFFFF else 0
    bank_word = (base_bank + bank_delta_word + carry) & 0xFFFF
    target_bank = bank_word & 0xFF

    target_off = lorom_offset(target_bank, target_addr)
    header = [read_word_le(rom, target_off + i) for i in range(0, 8, 2)]
    payload_words = [
        read_word_le(rom, target_off + i)
        for i in range(8, min(24, len(rom) - target_off), 2)
    ]

    return DecodedEntry(
        index=index,
        entry_bytes=entry.hex(),
        table_file_offset=f"0x{table_off:06X}",
        selector_surface=selector_surface_for_index(index),
        target_bank=f"{target_bank:02X}",
        target_addr=f"0x{target_addr:04X}",
        target_file_offset=f"0x{target_off:06X}",
        header_words=[f"0x{word:04X}" for word in header],
        object_count=header[0] & 0x0FFF,
        header_flags={
            "bit_15_set": bool(header[0] & 0x8000),
            "bit_14_set": bool(header[0] & 0x4000),
            "bit_13_set": bool(header[0] & 0x2000),
            "bit_12_set": bool(header[0] & 0x1000),
        },
        first_payload_words=[f"0x{word:04X}" for word in payload_words],
    )


def build_report(
    rom_path: Path,
    *,
    base_bank: int,
    base_addr: int,
    indices: Iterable[int],
) -> dict:
    rom = rom_path.read_bytes()
    entries = [
        asdict(
            decode_entry(
                rom,
                base_bank=base_bank,
                base_addr=base_addr,
                index=index,
            )
        )
        for index in indices
    ]
    return {
        "version": 1,
        "created": date.today().isoformat(),
        "rom": str(rom_path),
        "table_base": {
            "bank": f"{base_bank:02X}",
            "addr": f"0x{base_addr:04X}",
            "file_offset": f"0x{lorom_offset(base_bank, base_addr):06X}",
        },
        "claim": (
            "The bank-1 front-end helpers do not materialize a WRAM table at "
            "$1E80. The overlapping stores to $10/$11/$12 construct the long "
            "ROM pointer 1E:8000, and L00179B/L001662 then dereference rows "
            "from that table directly."
        ),
        "code_sites": [
            {
                "site": "01:BDF4",
                "selector_expr": "$0202 + 0x0008",
                "helper": "L001662",
                "expected_index_range": [8, 10],
            },
            {
                "site": "01:BE53",
                "selector_expr": "$1C7C + 0x000B",
                "helper": "L00179B",
                "expected_index_range": [11, 14],
            },
            {
                "site": "01:BAC3",
                "selector_expr": "$1C6A + 0x000F",
                "helper": "L00179B",
                "expected_index_range": [15, 17],
            },
        ],
        "entries": entries,
    }


def write_markdown(report: dict, path: Path) -> None:
    lines = [
        "# Front-End Pointer Table Decode",
        "",
        f"- Table base: `{report['table_base']['bank']}:{report['table_base']['addr'][2:]}`",
        f"- File offset: `{report['table_base']['file_offset']}`",
        "",
        "## Claim",
        "",
        f"- {report['claim']}",
        "",
        "## Decoded Entries",
        "",
        "| Index | Surface | Target | Count | Flags | Header |",
        "| --- | --- | --- | ---: | --- | --- |",
    ]
    for entry in report["entries"]:
        flags = ",".join(
            key
            for key, enabled in entry["header_flags"].items()
            if enabled
        ) or "none"
        header = " ".join(entry["header_words"])
        lines.append(
            "| "
            f"{entry['index']} | "
            f"{entry['selector_surface']} | "
            f"{entry['target_bank']}:{entry['target_addr'][2:]} | "
            f"{entry['object_count']} | "
            f"{flags} | "
            f"{header} |"
        )
    lines.extend(
        [
            "",
            "## Notes",
            "",
            "- Indices `8..10` are the current car-facing adjacent helper rows.",
            "- Indices `11..14` are the current track-facing adjacent helper rows.",
            "- The remaining gap is decoding the descriptor payloads into "
            "human-readable labels, not finding a WRAM materializer for `$1E80`.",
        ]
    )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("rom", type=Path, help="Path to the ROM image")
    parser.add_argument(
        "--base-bank",
        type=lambda value: int(value, 0),
        default=DEFAULT_BASE_BANK,
        help=f"LoROM bank for the table base (default: {DEFAULT_BASE_BANK:#x})",
    )
    parser.add_argument(
        "--base-addr",
        type=lambda value: int(value, 0),
        default=DEFAULT_BASE_ADDR,
        help=f"CPU address for the table base (default: {DEFAULT_BASE_ADDR:#x})",
    )
    parser.add_argument(
        "--indices",
        default=DEFAULT_INDICES,
        help=f"Comma/range list of table indices (default: {DEFAULT_INDICES})",
    )
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--md-out", type=Path)
    args = parser.parse_args()

    report = build_report(
        args.rom,
        base_bank=args.base_bank,
        base_addr=args.base_addr,
        indices=parse_indices(args.indices),
    )
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    if args.md_out:
        args.md_out.parent.mkdir(parents=True, exist_ok=True)
        write_markdown(report, args.md_out)


if __name__ == "__main__":
    main()
