#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path


def read_u16(data: bytes, offset: int) -> int:
    return data[offset] | (data[offset + 1] << 8)


def parse_dma_queue(data: bytes) -> list[dict[str, object]]:
    entries: list[dict[str, object]] = []
    for slot, offset in enumerate(range(0x0600, 0x0700, 8)):
        raw = data[offset : offset + 8]
        if any(raw):
            entries.append(
                {
                    "slot": slot,
                    "offset": offset,
                    "command": raw[0],
                    "source_addr": raw[1] | (raw[2] << 8) | (raw[3] << 16),
                    "transfer_size": read_u16(raw, 4),
                    "vram_dest": read_u16(raw, 6),
                    "words": [read_u16(raw, 0), read_u16(raw, 2), read_u16(raw, 4), read_u16(raw, 6)],
                    "bytes_hex": raw.hex(),
                }
            )
    return entries


def parse_tile_queue(data: bytes) -> list[dict[str, object]]:
    entries: list[dict[str, object]] = []
    for slot, offset in enumerate(range(0x0700, 0x0900, 4)):
        raw = data[offset : offset + 4]
        if any(raw):
            head_word = read_u16(raw, 0)
            tail_word = read_u16(raw, 2)
            entry: dict[str, object] = {
                "slot": slot,
                "offset": offset,
                "head_word": head_word,
                "tail_word": tail_word,
                "bytes_hex": raw.hex(),
            }
            if head_word == 0xE100:
                entry["kind"] = "sentinel"
                entry["tail_low"] = raw[2]
                entry["tail_high"] = raw[3]
            else:
                entry["kind"] = "tile"
                entry["x"] = raw[0]
                entry["y"] = raw[1]
                entry["tile_index_low"] = raw[2]
                entry["tile_attr_high"] = raw[3]
            entries.append(entry)
    return entries


def parse_attr_map(data: bytes) -> dict[str, object]:
    raw = data[0x0900:0x0980]
    changed = [{"index": index, "value": value} for index, value in enumerate(raw) if value != 0]
    histogram = Counter(value for value in raw if value != 0)
    return {
        "nonzero_count": len(changed),
        "nonzero_entries": changed,
        "value_histogram": {str(key): value for key, value in sorted(histogram.items())},
    }


def parse_word_array(data: bytes, start: int, count: int) -> list[int]:
    return [read_u16(data, start + (index * 2)) for index in range(count)]


def summarize_word_array(values: list[int]) -> dict[str, object]:
    nonzero = [{"index": index, "value": value} for index, value in enumerate(values) if value != 0]
    return {
        "nonzero_count": len(nonzero),
        "nonzero_entries": nonzero,
    }


def summarize_region_diff(data_a: bytes, data_b: bytes, start: int, end: int) -> dict[str, object]:
    changes = []
    for offset in range(start, end):
        before = data_a[offset]
        after = data_b[offset]
        if before != after:
            changes.append({"offset": offset, "before": before, "after": after})
    return {
        "diff_bytes": len(changes),
        "first_changes": changes[:128],
    }


def load_probe_frame(path: Path | None) -> dict[str, object] | None:
    if path is None:
        return None
    data = json.loads(path.read_text())
    frames = data.get("frames", [])
    if not frames:
        return None
    return frames[-1]


def build_summary(
    before: bytes,
    after: bytes,
    probe_before: dict[str, object] | None,
    probe_after: dict[str, object] | None,
) -> dict[str, object]:
    before_dma = parse_dma_queue(before)
    after_dma = parse_dma_queue(after)
    before_tiles = parse_tile_queue(before)
    after_tiles = parse_tile_queue(after)
    before_attr = parse_attr_map(before)
    after_attr = parse_attr_map(after)
    before_09aa = parse_word_array(before, 0x09AA, 0x40)
    after_09aa = parse_word_array(after, 0x09AA, 0x40)
    before_0a2a = parse_word_array(before, 0x0A2A, 0x40)
    after_0a2a = parse_word_array(after, 0x0A2A, 0x40)
    before_0aaa = parse_word_array(before, 0x0AAA, 0x40)
    after_0aaa = parse_word_array(after, 0x0AAA, 0x40)

    tile_attr_histogram = Counter()
    sentinel_tail_histogram = Counter()
    for entry in after_tiles:
        if entry["kind"] == "tile":
            tile_attr_histogram[entry["tile_attr_high"]] += 1
        else:
            sentinel_tail_histogram[entry["tail_word"]] += 1

    active_dma_count_before = None
    active_dma_count_after = None
    if probe_before is not None:
        active_dma_count_before = int(probe_before.get("dp_0054", 0)) // 8
    if probe_after is not None:
        active_dma_count_after = int(probe_after.get("dp_0054", 0)) // 8

    return {
        "wram_size": len(after),
        "probe_before": probe_before,
        "probe_after": probe_after,
        "regions": {
            "0600_dma_queue": {
                "before_nonzero_entries": len(before_dma),
                "after_nonzero_entries": len(after_dma),
                "active_dma_descriptor_count_before": active_dma_count_before,
                "active_dma_descriptor_count_after": active_dma_count_after,
                "active_after_entries": after_dma[:active_dma_count_after] if active_dma_count_after is not None else [],
                "after_entries": after_dma,
                "diff": summarize_region_diff(before, after, 0x0600, 0x0700),
            },
            "0700_oam_buffer": {
                "before_nonzero_entries": len(before_tiles),
                "after_nonzero_entries": len(after_tiles),
                "after_entries": after_tiles,
                "after_tile_attr_histogram": {str(key): value for key, value in sorted(tile_attr_histogram.items())},
                "after_sentinel_tail_histogram": {str(key): value for key, value in sorted(sentinel_tail_histogram.items())},
                "diff": summarize_region_diff(before, after, 0x0700, 0x0900),
            },
            "0900_oam_high_table": {
                "before": before_attr,
                "after": after_attr,
                "diff": summarize_region_diff(before, after, 0x0900, 0x0980),
            },
            "09aa_alloc_map": {
                "before": summarize_word_array(before_09aa),
                "after": summarize_word_array(after_09aa),
                "diff": summarize_region_diff(before, after, 0x09AA, 0x0A2A),
            },
            "0a2a_node_map": {
                "before": summarize_word_array(before_0a2a),
                "after": summarize_word_array(after_0a2a),
                "diff": summarize_region_diff(before, after, 0x0A2A, 0x0AAA),
            },
            "0aaa_ttl_map": {
                "before": summarize_word_array(before_0aaa),
                "after": summarize_word_array(after_0aaa),
                "diff": summarize_region_diff(before, after, 0x0AAA, 0x0B2A),
            },
        },
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Analyze TD2 bootstrap WRAM queue state.")
    parser.add_argument("before_wram", type=Path)
    parser.add_argument("after_wram", type=Path)
    parser.add_argument("output_json", type=Path)
    parser.add_argument("--probe-json-a", type=Path, default=None)
    parser.add_argument("--probe-json-b", type=Path, default=None)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    before = args.before_wram.read_bytes()
    after = args.after_wram.read_bytes()
    probe_before = load_probe_frame(args.probe_json_a)
    probe_after = load_probe_frame(args.probe_json_b)

    summary = build_summary(before, after, probe_before, probe_after)
    args.output_json.write_text(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
