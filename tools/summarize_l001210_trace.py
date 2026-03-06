#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Summarize L001210 exec traces captured by validation/mesen_probe_boot.lua."
    )
    parser.add_argument("trace_json", type=Path, help="input td2_boot_probe_l001210_exec.json path")
    parser.add_argument("--json-out", type=Path, default=None, help="optional summary JSON output path")
    return parser.parse_args()


def as_int(value: Any, fallback: int = 0) -> int:
    try:
        return int(value)
    except (TypeError, ValueError):
        return fallback


def format_snes(source_linear: int) -> str:
    bank = (source_linear >> 16) & 0xFF
    addr = source_linear & 0xFFFF
    return f"{bank:02X}:{addr:04X}"


def summarize(payload: dict[str, Any]) -> dict[str, Any]:
    hits = payload.get("hits", [])
    known_sources = payload.get("known_sources", [])

    by_bank: Counter[int] = Counter()
    by_marker: Counter[str] = Counter()
    by_source: dict[int, dict[str, Any]] = {}

    known_by_linear: dict[int, dict[str, Any]] = {}
    for item in known_sources:
        source_linear = as_int(item.get("source_linear"))
        if source_linear <= 0:
            continue
        known_by_linear[source_linear] = dict(item)

    for entry in hits:
        source_linear = as_int(entry.get("source_linear"))
        source_bank = as_int(entry.get("source_bank"), (source_linear >> 16) & 0xFF)
        source_addr = as_int(entry.get("source_addr"), source_linear & 0xFFFF)
        frame = as_int(entry.get("frame"), -1)
        marker = str(entry.get("source_marker", "unknown"))
        dest_addr = as_int(entry.get("destination_addr"), -1)
        callback_bank = as_int(entry.get("active_main_callback_bank"), -1)
        callback_addr = as_int(entry.get("active_main_callback_addr"), -1)
        provenance = str(entry.get("source_provenance", "unclassified"))

        by_bank[source_bank] += 1
        by_marker[marker] += 1

        source_record = by_source.setdefault(
            source_linear,
            {
                "source_linear": source_linear,
                "source_snes": entry.get("source_snes", format_snes(source_linear)),
                "source_bank": source_bank,
                "source_addr": source_addr,
                "source_marker": marker,
                "source_marker_word": as_int(entry.get("source_marker_word"), -1),
                "source_provenance": provenance,
                "source_known_id": entry.get("source_known_id"),
                "count": 0,
                "first_frame": None,
                "last_frame": None,
                "destinations": Counter(),
                "main_callbacks": Counter(),
            },
        )

        source_record["count"] += 1
        if source_record["first_frame"] is None or frame < source_record["first_frame"]:
            source_record["first_frame"] = frame
        if source_record["last_frame"] is None or frame > source_record["last_frame"]:
            source_record["last_frame"] = frame

        source_record["destinations"][f"7E:{dest_addr:04X}"] += 1
        source_record["main_callbacks"][f"{callback_bank:02X}:{callback_addr:04X}"] += 1

    source_rows: list[dict[str, Any]] = []
    for source_linear, row in by_source.items():
        top_destinations = [
            {"destination": key, "count": count}
            for key, count in row["destinations"].most_common(8)
        ]
        top_callbacks = [
            {"callback": key, "count": count}
            for key, count in row["main_callbacks"].most_common(8)
        ]
        entry = {
            "source_linear": source_linear,
            "source_snes": row["source_snes"],
            "source_bank": row["source_bank"],
            "source_addr": row["source_addr"],
            "source_marker": row["source_marker"],
            "source_marker_word": row["source_marker_word"],
            "source_provenance": row["source_provenance"],
            "source_known_id": row["source_known_id"],
            "count": row["count"],
            "first_frame": row["first_frame"],
            "last_frame": row["last_frame"],
            "top_destinations": top_destinations,
            "top_main_callbacks": top_callbacks,
        }
        known = known_by_linear.get(source_linear)
        if known is not None:
            entry["known_note"] = known.get("note")
        source_rows.append(entry)

    source_rows.sort(key=lambda item: (-as_int(item["count"]), as_int(item["source_linear"])))

    known_candidate_rows: list[dict[str, Any]] = []
    for known in known_sources:
        source_linear = as_int(known.get("source_linear"))
        observed = by_source.get(source_linear)
        known_candidate_rows.append(
            {
                "id": known.get("id"),
                "source_linear": source_linear,
                "source_snes": known.get("source_snes", format_snes(source_linear)),
                "marker": known.get("marker"),
                "provenance": known.get("provenance"),
                "note": known.get("note"),
                "hit_count": as_int(observed["count"]) if observed else 0,
                "first_frame": observed["first_frame"] if observed else None,
                "last_frame": observed["last_frame"] if observed else None,
            }
        )

    unknown_bank30_rows = [
        row
        for row in source_rows
        if as_int(row["source_bank"]) == 0x1E and row.get("source_known_id") in (None, "")
    ]

    summary = {
        "total_hits": len(hits),
        "dropped_hits": as_int(payload.get("dropped_hits"), 0),
        "unique_sources": len(source_rows),
        "bank_counts": {f"{bank:02X}": count for bank, count in sorted(by_bank.items())},
        "marker_counts": dict(sorted(by_marker.items())),
        "sources": source_rows,
        "bank30": {
            "known_candidates": known_candidate_rows,
            "unknown_sources": unknown_bank30_rows,
        },
    }
    return summary


def main() -> int:
    args = parse_args()
    payload = json.loads(args.trace_json.read_text(encoding="utf-8"))
    summary = summarize(payload)

    if args.json_out is not None:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    print(
        f"hits={summary['total_hits']} dropped={summary['dropped_hits']} "
        f"unique_sources={summary['unique_sources']}"
    )
    if summary["bank_counts"]:
        print("bank counts:")
        for bank, count in summary["bank_counts"].items():
            print(f"  {bank}: {count}")

    print("top sources:")
    for row in summary["sources"][:12]:
        print(
            f"  {row['source_snes']} marker={row['source_marker']} "
            f"count={row['count']} frames={row['first_frame']}..{row['last_frame']} "
            f"provenance={row['source_provenance']}"
        )

    print("bank30 known candidates:")
    for row in summary["bank30"]["known_candidates"]:
        print(
            f"  {row['source_snes']} ({row['id']}): hits={row['hit_count']} "
            f"frames={row['first_frame']}..{row['last_frame']}"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
