#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_boot_vram import load_rom_window


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize TD2 bootstrap VMDATA write traces by grouping writes per frame and "
            "matching the streamed bytes back to active queue descriptors."
        )
    )
    parser.add_argument("trace_json", type=Path, help="td2_boot_probe_vram_writes.json from mesen_probe_boot.lua")
    parser.add_argument("queue_json", type=Path, help="queue summary JSON from analyze_bootstrap_queue.py")
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("output_json", type=Path, help="output summary JSON path")
    return parser.parse_args()


def group_writes_by_frame(writes: list[dict[str, object]]) -> dict[int, list[dict[str, object]]]:
    grouped: dict[int, list[dict[str, object]]] = {}
    for write in writes:
        frame = int(write["frame"])
        grouped.setdefault(frame, []).append(write)
    return grouped


def unique_queue_candidates(entries: list[dict[str, object]]) -> list[dict[str, object]]:
    candidates: list[dict[str, object]] = []
    seen: set[tuple[int, int, int]] = set()
    for entry in entries:
        key = (int(entry["source_addr"]), int(entry["transfer_size"]), int(entry["vram_dest"]))
        if key in seen:
            continue
        seen.add(key)
        candidates.append(entry)
    return candidates


def main() -> int:
    args = parse_args()

    trace = json.loads(args.trace_json.read_text(encoding="utf-8"))
    queue = json.loads(args.queue_json.read_text(encoding="utf-8"))
    rom_bytes = args.rom.read_bytes()

    writes = trace.get("writes", [])
    grouped = group_writes_by_frame(writes)
    active_entries = queue["regions"]["0600_dma_queue"].get("active_after_entries", [])
    candidates = unique_queue_candidates(active_entries)

    frames_summary: list[dict[str, object]] = []

    for frame in sorted(grouped):
        frame_writes = grouped[frame]
        vmadd_low = next((int(write["value"]) for write in frame_writes if write["register"] == "VMADDL"), None)
        vmadd_high = next((int(write["value"]) for write in frame_writes if write["register"] == "VMADDH"), None)
        streamed = bytes(
            int(write["value"])
            for write in frame_writes
            if write["register"] in ("VMDATAL", "VMDATAH")
        )
        if vmadd_low is None or vmadd_high is None:
            raise SystemExit(f"error: frame {frame} is missing VMADD setup writes")
        vmadd = vmadd_low | (vmadd_high << 8)

        matches: list[dict[str, object]] = []
        for entry in candidates:
            transfer_size = int(entry["transfer_size"])
            vram_dest = int(entry["vram_dest"])
            if transfer_size != len(streamed) or vram_dest != vmadd:
                continue

            source_addr = int(entry["source_addr"])
            source_bank = (source_addr >> 16) & 0xFF
            source_cpu_addr = source_addr & 0xFFFF
            source_window, rom_offset = load_rom_window(rom_bytes, source_bank, source_cpu_addr)
            blob = bytes(source_window[:transfer_size])
            match_bytes = sum(1 for actual, candidate in zip(streamed, blob) if actual == candidate)
            matches.append(
                {
                    "source_addr": f"0x{source_addr:06X}",
                    "source_bank": source_bank,
                    "source_cpu_addr": f"0x{source_cpu_addr:04X}",
                    "rom_offset": f"0x{rom_offset:06X}",
                    "transfer_size": transfer_size,
                    "vram_dest": f"0x{vram_dest:04X}",
                    "match_bytes": match_bytes,
                }
            )

        matches.sort(key=lambda item: (-int(item["match_bytes"]), item["source_addr"]))
        best_match = matches[0] if matches else None
        frames_summary.append(
            {
                "frame": frame,
                "vmadd": f"0x{vmadd:04X}",
                "byte_count": len(streamed),
                "vmdatal_writes": sum(1 for write in frame_writes if write["register"] == "VMDATAL"),
                "vmdatah_writes": sum(1 for write in frame_writes if write["register"] == "VMDATAH"),
                "dp_0054_first": next((int(write["dp_0054"]) for write in frame_writes if "dp_0054" in write), None),
                "best_match": best_match,
                "candidates": matches,
            }
        )

    summary = {
        "trace_json": str(args.trace_json.resolve()),
        "queue_json": str(args.queue_json.resolve()),
        "frame_count": len(frames_summary),
        "frames": frames_summary,
    }
    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(f"wrote bootstrap VMDATA trace summary -> {args.output_json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
