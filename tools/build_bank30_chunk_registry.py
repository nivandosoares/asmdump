#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


TABLE_CONFIRMED_SNELS = {
    "1E:DF6C",
    "1E:E039",
    "1E:E73F",
    "1E:E800",
    "1E:EE7F",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a consolidated bank30 chunk registry from header scan, decode validation, "
            "and L001210 runtime trace summaries."
        )
    )
    parser.add_argument("headers_json", type=Path, help="bank30_headers.json path")
    parser.add_argument("validation_json", type=Path, help="bank30_chunk_validation.json path")
    parser.add_argument("runtime_summary_json", type=Path, help="td2_boot_probe_l001210_summary.json path")
    parser.add_argument("output_json", type=Path, help="output consolidated registry json")
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=None,
        help="optional markdown summary output path",
    )
    return parser.parse_args()


def as_int(value: Any, fallback: int = 0) -> int:
    try:
        return int(value)
    except (TypeError, ValueError):
        return fallback


def fmt_snes(bank: int, addr: int) -> str:
    return f"{bank & 0xFF:02X}:{addr & 0xFFFF:04X}"


def classify(entry: dict[str, Any]) -> str:
    if entry["decode_status"] != "ok":
        return "decode-fail"
    if entry["runtime_hit_count"] > 0:
        return "runtime-confirmed"
    if entry["table_confirmed"]:
        return "table-confirmed-unseen"
    if entry["marker"] == "67FB":
        return "67fb-unseen"
    return "candidate-unseen"


def priority(entry: dict[str, Any]) -> str:
    status = entry["status"]
    if status == "decode-fail":
        return "P0"
    if status == "table-confirmed-unseen":
        return "P0"
    if status == "67fb-unseen":
        return "P1"
    if status == "candidate-unseen":
        return "P2"
    return "done"


def write_markdown(output: Path, registry: dict[str, Any]) -> None:
    active = [e for e in registry["entries"] if e["runtime_hit_count"] > 0]
    unresolved = [e for e in registry["entries"] if e["runtime_hit_count"] == 0]
    lines: list[str] = []
    lines.append("# Bank30 Chunk Registry Summary")
    lines.append("")
    lines.append(f"- total entries: `{registry['total_entries']}`")
    lines.append(f"- runtime-confirmed entries: `{len(active)}`")
    lines.append(f"- unresolved entries: `{len(unresolved)}`")
    lines.append("")
    lines.append("## Runtime Confirmed")
    lines.append("")
    lines.append("| SNES | Marker | Hits | First frame | Last frame |")
    lines.append("|---|---|---:|---:|---:|")
    for entry in active:
        lines.append(
            f"| `{entry['snes']}` | `{entry['marker']}` | `{entry['runtime_hit_count']}` | "
            f"`{entry['runtime_first_frame']}` | `{entry['runtime_last_frame']}` |"
        )
    lines.append("")
    lines.append("## Unresolved Queue")
    lines.append("")
    lines.append("| Priority | SNES | Marker | Decode status | Table confirmed | Notes |")
    lines.append("|---|---|---|---|---|---|")
    unresolved_sorted = sorted(
        unresolved,
        key=lambda e: (e["priority"], as_int(e["offset"])),
    )
    for entry in unresolved_sorted:
        note = entry.get("notes") or ""
        lines.append(
            f"| `{entry['priority']}` | `{entry['snes']}` | `{entry['marker']}` | "
            f"`{entry['decode_status']}` | `{entry['table_confirmed']}` | {note} |"
        )
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    headers = json.loads(args.headers_json.read_text(encoding="utf-8"))
    validation = json.loads(args.validation_json.read_text(encoding="utf-8"))
    runtime = json.loads(args.runtime_summary_json.read_text(encoding="utf-8"))

    validation_by_offset: dict[int, dict[str, Any]] = {
        as_int(e.get("offset")): e for e in validation.get("entries", [])
    }

    runtime_bank30_candidates: dict[str, dict[str, Any]] = {
        str(e.get("source_snes")): e
        for e in runtime.get("bank30", {}).get("known_candidates", [])
        if e.get("source_snes")
    }
    runtime_sources_by_snes: dict[str, dict[str, Any]] = {
        str(e.get("source_snes")): e for e in runtime.get("sources", []) if e.get("source_snes")
    }

    entries: list[dict[str, Any]] = []
    for header in headers:
        offset = as_int(header.get("offset"))
        marker = str(header.get("header", {}).get("marker", str(header.get("pattern", "")).upper()))
        addr = 0x8000 + offset
        snes = fmt_snes(0x1E, addr)
        v = validation_by_offset.get(offset, {})
        runtime_hit = runtime_bank30_candidates.get(snes) or runtime_sources_by_snes.get(snes) or {}
        hit_count = as_int(runtime_hit.get("hit_count") or runtime_hit.get("count"), 0)
        decode_status = str(v.get("status", "unknown"))
        table_confirmed = snes in TABLE_CONFIRMED_SNELS
        overlap_indices = [as_int(o.get("index"), -1) for o in v.get("overlaps", [])]
        overlap_with = [as_int(o.get("offset"), -1) for o in v.get("overlaps", [])]
        notes: list[str] = []
        if table_confirmed:
            notes.append("bank1-pointer-table-confirmed")
        if overlap_with:
            notes.append("overlaps-larger-window")
        if decode_status != "ok":
            notes.append(str(v.get("error", "decode-not-ok")))

        entry = {
            "index": as_int(header.get("index"), -1),
            "offset": offset,
            "addr": addr,
            "snes": snes,
            "marker": marker,
            "pattern": header.get("pattern"),
            "decode_status": decode_status,
            "output_size": v.get("output_size"),
            "consumed_bytes": v.get("consumed_bytes"),
            "window_start": v.get("window_start"),
            "window_end_exclusive": v.get("window_end_exclusive"),
            "overlap_indices": overlap_indices,
            "overlap_offsets": overlap_with,
            "table_confirmed": table_confirmed,
            "runtime_hit_count": hit_count,
            "runtime_first_frame": runtime_hit.get("first_frame"),
            "runtime_last_frame": runtime_hit.get("last_frame"),
            "notes": ", ".join(notes) if notes else "",
        }
        entry["status"] = classify(entry)
        entry["priority"] = priority(entry)
        entries.append(entry)

    entries.sort(key=lambda e: as_int(e["offset"]))
    status_counts: dict[str, int] = {}
    for entry in entries:
        status = str(entry["status"])
        status_counts[status] = status_counts.get(status, 0) + 1

    registry = {
        "bank": 30,
        "bank_snes": "1E",
        "inputs": {
            "headers_json": str(args.headers_json),
            "validation_json": str(args.validation_json),
            "runtime_summary_json": str(args.runtime_summary_json),
        },
        "total_entries": len(entries),
        "status_counts": status_counts,
        "entries": entries,
    }

    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(registry, indent=2) + "\n", encoding="utf-8")
    print(f"wrote bank30 registry -> {args.output_json}")
    print(f"status counts: {status_counts}")

    if args.markdown_out is not None:
        write_markdown(args.markdown_out, registry)
        print(f"wrote markdown summary -> {args.markdown_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
