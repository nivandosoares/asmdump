#!/usr/bin/env python3
"""Validate candidate TD2 chunk markers by running real decoders."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from decompress_td2_chunk import (
    LOROM_BANK_SIZE,
    decode_26fb,
    decode_42fb,
    decode_67fb,
    detect_header_size,
)


SUPPORTED = {
    "26FB": decode_26fb,
    "42FB": decode_42fb,
    "67FB": decode_67fb,
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run TD2 decoders against marker candidates from a header-manifest JSON "
            "and report decode success/failure plus consumed source windows."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("--bank", type=int, required=True, help="LoROM bank index")
    parser.add_argument(
        "--headers-json",
        type=Path,
        required=True,
        help="JSON produced by extract_compression_header_manifest.py",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON report output path")
    return parser.parse_args()


def load_bank(rom_path: Path, bank: int) -> bytes:
    rom_bytes = rom_path.read_bytes()
    header_size = detect_header_size(len(rom_bytes))
    start = header_size + (bank * LOROM_BANK_SIZE)
    end = start + LOROM_BANK_SIZE
    if end > len(rom_bytes):
        raise ValueError(f"bank {bank:02X} exceeds ROM bounds")
    return rom_bytes[start:end]


def main() -> int:
    args = parse_args()
    bank_bytes = load_bank(args.rom, args.bank)
    headers = json.loads(args.headers_json.read_text(encoding="utf-8"))

    entries: list[dict[str, object]] = []
    for chunk in headers:
        marker = str(chunk.get("header", {}).get("marker", "")).upper()
        offset = int(chunk.get("offset", 0))
        addr = 0x8000 + offset
        row: dict[str, object] = {
            "index": int(chunk.get("index", -1)),
            "marker": marker,
            "offset": offset,
            "addr": f"0x{addr:04X}",
            "span_to_next_marker": int(chunk.get("span", 0)),
            "supported": marker in SUPPORTED,
        }

        decoder = SUPPORTED.get(marker)
        if decoder is None:
            row["status"] = "unsupported"
            entries.append(row)
            continue

        try:
            output, summary = decoder(bank_bytes[offset:])
            consumed = int(summary.get("compressed_bytes_consumed", 0))
            row.update(
                {
                    "status": "ok",
                    "output_size": len(output),
                    "consumed_bytes": consumed,
                    "window_start": offset,
                    "window_end_exclusive": offset + consumed,
                    "summary": summary,
                }
            )
        except Exception as exc:
            row.update({"status": "fail", "error": str(exc)})

        entries.append(row)

    ok_entries = [row for row in entries if row.get("status") == "ok"]
    for row in ok_entries:
        start = int(row["window_start"])
        end = int(row["window_end_exclusive"])
        overlaps = []
        for other in entries:
            if other is row:
                continue
            other_offset = int(other.get("offset", -1))
            if start <= other_offset < end:
                overlaps.append({
                    "index": other.get("index"),
                    "offset": other_offset,
                    "marker": other.get("marker"),
                })
        row["overlaps"] = overlaps

    report = {
        "rom": str(args.rom),
        "bank": args.bank,
        "headers_json": str(args.headers_json),
        "total_candidates": len(entries),
        "decoded_ok": sum(1 for row in entries if row.get("status") == "ok"),
        "decoded_fail": sum(1 for row in entries if row.get("status") == "fail"),
        "unsupported": sum(1 for row in entries if row.get("status") == "unsupported"),
        "entries": entries,
    }

    for row in entries:
        status = row["status"]
        marker = row["marker"]
        addr = row["addr"]
        if status == "ok":
            print(
                f"index={row['index']:02d} marker={marker} addr={addr} "
                f"status=ok out={row['output_size']} consumed={row['consumed_bytes']}"
            )
        elif status == "fail":
            print(f"index={row['index']:02d} marker={marker} addr={addr} status=fail error={row['error']}")
        else:
            print(f"index={row['index']:02d} marker={marker} addr={addr} status=unsupported")

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(f"json={args.json_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
