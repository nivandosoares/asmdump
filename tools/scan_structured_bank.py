#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
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


def parse_patterns(pattern_args: list[str]) -> list[bytes]:
    patterns = []
    for raw in pattern_args:
        normalized = raw.replace(" ", "").replace("0x", "")
        if len(normalized) % 2 != 0:
            raise ValueError(f"pattern must contain an even number of hex digits: {raw}")
        patterns.append(bytes.fromhex(normalized))
    return patterns


def scan_bank(data: bytes, patterns: list[bytes]) -> list[dict[str, int | str]]:
    chunks: list[dict[str, int | str]] = []
    for pattern in patterns:
        start = 0
        while True:
            offset = data.find(pattern, start)
            if offset < 0:
                break
            chunks.append({
                "offset": offset,
                "pattern": pattern.hex(),
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
    parser = argparse.ArgumentParser(description="Scan a LoROM bank for recurring header patterns.")
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("--bank", type=int, required=True, help="LoROM bank index")
    parser.add_argument(
        "--pattern",
        action="append",
        dest="patterns",
        default=[],
        help="hex byte pattern to scan for (can be used multiple times, default: 42fb and 26fb)",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON report output path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    pattern_args = args.patterns or ["42fb", "26fb"]
    patterns = parse_patterns(pattern_args)
    rom_bytes = args.rom.read_bytes()
    bank_bytes = read_bank(rom_bytes, args.bank)
    chunks = scan_bank(bank_bytes, patterns)

    for chunk in chunks:
        print(
            f"index={chunk['index']:02d} "
            f"offset=0x{chunk['offset']:04X} "
            f"pattern={chunk['pattern']} "
            f"span={chunk['span']}"
        )

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(chunks, indent=2), encoding="utf-8")
        print(f"json={args.json_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
