#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


LOROM_BANK_SIZE = 0x8000
DEFAULT_PATTERNS = ("42fb", "26fb", "67fb", "27fb")


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def read_bank(rom_bytes: bytes, bank_index: int) -> bytes:
    header_size = detect_header_size(len(rom_bytes))
    start = header_size + (bank_index * LOROM_BANK_SIZE)
    end = start + LOROM_BANK_SIZE
    if end > len(rom_bytes):
        raise ValueError(f"bank {bank_index} exceeds ROM bounds")
    return rom_bytes[start:end]


def parse_patterns(pattern_args: list[str]) -> list[bytes]:
    patterns = []
    for raw in pattern_args:
        normalized = raw.replace(" ", "").replace("0x", "")
        if len(normalized) % 2 != 0:
            raise ValueError(f"pattern must contain an even number of hex digits: {raw}")
        patterns.append(bytes.fromhex(normalized))
    return patterns


def read_be16(data: bytes, offset: int) -> int | None:
    if offset < 0 or (offset + 1) >= len(data):
        return None
    return (data[offset] << 8) | data[offset + 1]


def read_le16(data: bytes, offset: int) -> int | None:
    if offset < 0 or (offset + 1) >= len(data):
        return None
    return data[offset] | (data[offset + 1] << 8)


def parse_header_fields(header: bytes) -> dict[str, int | str]:
    marker = header[:2].hex().upper()
    fields: dict[str, int | str] = {
        "marker": marker,
        "header_bytes": header.hex(),
    }

    if marker == "42FB":
        fields["field_be_02"] = read_be16(header, 2) or 0
        fields["field_be_04"] = read_be16(header, 4) or 0
        fields["declared_output_span"] = read_be16(header, 7) or 0
    elif marker in {"26FB", "27FB"}:
        fields["field_be_03"] = read_be16(header, 3) or 0
        fields["field_be_06"] = read_be16(header, 6) or 0
    elif marker == "67FB":
        fields["declared_output_span"] = read_be16(header, 3) or 0
        fields["word_le_10"] = read_le16(header, 10) or 0

    return fields


def scan_bank(data: bytes, patterns: list[bytes]) -> list[dict[str, int | str | dict]]:
    chunks: list[dict[str, int | str | dict]] = []
    for pattern in patterns:
        start = 0
        while True:
            offset = data.find(pattern, start)
            if offset < 0:
                break
            header = data[offset:offset + 16]
            chunks.append({
                "offset": offset,
                "pattern": pattern.hex(),
                "header": parse_header_fields(header),
            })
            start = offset + 1

    chunks.sort(key=lambda chunk: int(chunk["offset"]))
    for index, chunk in enumerate(chunks):
        start = int(chunk["offset"])
        end = int(chunks[index + 1]["offset"]) if index + 1 < len(chunks) else len(data)
        chunk["index"] = index
        chunk["next_offset"] = end
        chunk["span"] = end - start

    return chunks


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Scan a LoROM bank for compression-style headers and decode their leading fields."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("--bank", type=int, required=True, help="LoROM bank index")
    parser.add_argument(
        "--pattern",
        action="append",
        dest="patterns",
        default=[],
        help="hex byte pattern to scan for (default: 42fb, 26fb, 67fb, 27fb)",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON report output path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    pattern_args = args.patterns or list(DEFAULT_PATTERNS)
    patterns = parse_patterns(pattern_args)
    rom_bytes = args.rom.read_bytes()
    bank_bytes = read_bank(rom_bytes, args.bank)
    chunks = scan_bank(bank_bytes, patterns)

    for chunk in chunks:
        header = chunk["header"]
        marker = header["marker"]
        span = chunk["span"]
        offset = chunk["offset"]
        summary = f"index={chunk['index']:02d} offset=0x{offset:04X} marker={marker} span={span}"
        if "declared_output_span" in header:
            summary += f" out=0x{int(header['declared_output_span']):04X}"
        print(summary)

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(chunks, indent=2), encoding="utf-8")
        print(f"json={args.json_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
