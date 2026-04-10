#!/usr/bin/env python3
"""Build a bounded tail-continuity contract for DOS TD2 *ST.PES assets."""

from __future__ import annotations

import argparse
import json
import math
from collections import Counter
from itertools import combinations
from pathlib import Path


HEADER_BYTES = 64
PAGE_SIZE = 4096
TAIL_BOUNDARY = PAGE_SIZE * 3
RECOMMENDED_PAIR = ("P959", "ROSS")


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def bytes_entropy(block: bytes) -> float:
    if not block:
        return 0.0
    counts = Counter(block)
    total = len(block)
    return -sum((count / total) * math.log2(count / total) for count in counts.values())


def histogram_cosine(a: bytes, b: bytes) -> float:
    if not a or not b:
        return 0.0
    left = Counter(a)
    right = Counter(b)
    keys = set(left) | set(right)
    dot = sum(left[key] * right[key] for key in keys)
    left_norm = math.sqrt(sum(value * value for value in left.values()))
    right_norm = math.sqrt(sum(value * value for value in right.values()))
    if not left_norm or not right_norm:
        return 0.0
    return dot / (left_norm * right_norm)


def common_prefix_bytes(a: bytes, b: bytes) -> int:
    count = 0
    for left, right in zip(a, b):
        if left != right:
            break
        count += 1
    return count


def equal_bytes(a: bytes, b: bytes) -> int:
    return sum(1 for left, right in zip(a, b) if left == right)


def read_preview_data(preview_entry: dict[str, object], data_dir: Path) -> dict[str, object]:
    pes_path = data_dir / str(preview_entry["preview_asset_pes"])
    data = pes_path.read_bytes()
    return {
        "car_id": preview_entry["car_id"],
        "display_name": preview_entry["display_name"],
        "layout_pattern": preview_entry["layout_pattern"],
        "layout_params": preview_entry["layout_params"],
        "preview_asset_pes": preview_entry["preview_asset_pes"],
        "data": data,
    }


def build_recommended_pair(preview_entries: list[dict[str, object]]) -> dict[str, object]:
    by_car = {entry["car_id"]: entry for entry in preview_entries}
    left = by_car[RECOMMENDED_PAIR[0]]
    right = by_car[RECOMMENDED_PAIR[1]]
    left_header = left["data"][:HEADER_BYTES]
    right_header = right["data"][:HEADER_BYTES]
    return {
        "left_car_id": left["car_id"],
        "right_car_id": right["car_id"],
        "left_asset": left["preview_asset_pes"],
        "right_asset": right["preview_asset_pes"],
        "shared_layout_pattern": left["layout_pattern"] == right["layout_pattern"],
        "shared_layout_params": left["layout_params"] == right["layout_params"],
        "left_page_class": "three_page_stream" if len(left["data"]) <= TAIL_BOUNDARY else "four_page_tail_stream",
        "right_page_class": "three_page_stream" if len(right["data"]) <= TAIL_BOUNDARY else "four_page_tail_stream",
        "front_equal_bytes_64": equal_bytes(left_header, right_header),
        "front_common_prefix_bytes": common_prefix_bytes(left_header, right_header),
        "left_field_window": {
            "offset_8": left["data"][8],
            "offset_11": left["data"][11],
            "offset_12": left["data"][12],
            "offset_13": left["data"][13],
        },
        "right_field_window": {
            "offset_8": right["data"][8],
            "offset_11": right["data"][11],
            "offset_12": right["data"][12],
            "offset_13": right["data"][13],
        },
    }


def build_four_page_entries(preview_entries: list[dict[str, object]]) -> list[dict[str, object]]:
    entries = []
    for preview in preview_entries:
        data = preview["data"]
        if len(data) <= TAIL_BOUNDARY:
            continue
        preceding = data[TAIL_BOUNDARY - PAGE_SIZE : TAIL_BOUNDARY]
        tail = data[TAIL_BOUNDARY:]
        entries.append(
            {
                "car_id": preview["car_id"],
                "display_name": preview["display_name"],
                "preview_asset_pes": preview["preview_asset_pes"],
                "tail_bytes": len(tail),
                "preceding_page_entropy": round(bytes_entropy(preceding), 4),
                "tail_entropy": round(bytes_entropy(tail), 4),
                "tail_histogram_cosine_to_preceding_page": round(histogram_cosine(tail, preceding), 4),
                "boundary_common_prefix_bytes": common_prefix_bytes(data[TAIL_BOUNDARY - 32 : TAIL_BOUNDARY], tail),
                "tail_start_hex": " ".join(f"{byte:02x}" for byte in tail[:16]),
                "tail_end_hex": " ".join(f"{byte:02x}" for byte in tail[-16:]),
                "_tail_data": tail,
            }
        )
    return entries


def build_cross_tail_pairs(entries: list[dict[str, object]]) -> list[dict[str, object]]:
    out = []
    for left, right in combinations(entries, 2):
        left_tail = left["_tail_data"]
        right_tail = right["_tail_data"]
        window = min(len(left_tail), len(right_tail))
        out.append(
            {
                "left_car_id": left["car_id"],
                "right_car_id": right["car_id"],
                "shared_window_bytes": window,
                "common_prefix_bytes": common_prefix_bytes(left_tail, right_tail),
                "equal_bytes_in_shared_window": equal_bytes(left_tail[:window], right_tail[:window]),
                "tail_histogram_cosine": round(histogram_cosine(left_tail, right_tail), 4),
            }
        )
    return out


def candidate_notes(
    recommended_pair: dict[str, object],
    four_page_entries: list[dict[str, object]],
    cross_tail_pairs: list[dict[str, object]],
) -> list[dict[str, object]]:
    notes = [
        {
            "classification": "VERIFIED",
            "claim": "P959ST.PES and ROSSST.PES keep the same visible layout family while changing page class, so they remain the best bounded comparison pair.",
            "evidence": recommended_pair,
        }
    ]

    if cross_tail_pairs and all(pair["common_prefix_bytes"] == 0 for pair in cross_tail_pairs):
        notes.append(
            {
                "classification": "VERIFIED",
                "claim": "Current four-page tail fragments do not share a common opening prefix across assets.",
                "evidence": cross_tail_pairs,
            }
        )

    best_cross = {}
    for entry in four_page_entries:
        car_id = entry["car_id"]
        matches = []
        for pair in cross_tail_pairs:
            if pair["left_car_id"] == car_id or pair["right_car_id"] == car_id:
                matches.append(pair["tail_histogram_cosine"])
        best_cross[car_id] = max(matches) if matches else 0.0

    continuity = {
        entry["car_id"]: {
            "same_file_tail_to_preceding": entry["tail_histogram_cosine_to_preceding_page"],
            "best_cross_tail_match": best_cross[entry["car_id"]],
        }
        for entry in four_page_entries
    }
    if continuity and all(
        item["same_file_tail_to_preceding"] > item["best_cross_tail_match"] for item in continuity.values()
    ):
        notes.append(
            {
                "classification": "PROBABLE",
                "claim": "The current tail fragments behave more like continued asset-specific packed data than a shared footer family.",
                "evidence": continuity,
            }
        )

    return notes


def build_payload(preview_manifest: dict[str, object], data_dir: Path) -> dict[str, object]:
    preview_entries = [read_preview_data(entry, data_dir) for entry in preview_manifest["preview_entries"]]
    recommended_pair = build_recommended_pair(preview_entries)
    four_page_entries = build_four_page_entries(preview_entries)
    cross_tail_pairs = build_cross_tail_pairs(four_page_entries)
    notes = candidate_notes(recommended_pair, four_page_entries, cross_tail_pairs)
    for entry in four_page_entries:
        entry.pop("_tail_data", None)
    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Bounded tail continuity contract for DOS TD2 *ST.PES assets.",
        "header_bytes": HEADER_BYTES,
        "page_size": PAGE_SIZE,
        "tail_boundary": TAIL_BOUNDARY,
        "recommended_pair": recommended_pair,
        "four_page_tail_entries": four_page_entries,
        "cross_tail_pairs": cross_tail_pairs,
        "candidate_notes": notes,
    }


def render_markdown(payload: dict[str, object]) -> str:
    pair = payload["recommended_pair"]
    lines = [
        "# DOS Tail Probe Contract",
        "",
        f"- header bytes compared: `{payload['header_bytes']}`",
        f"- tail boundary: `{payload['tail_boundary']}`",
        "",
        "## Recommended Pair",
        "",
        f"- `{pair['left_asset']}` vs `{pair['right_asset']}`",
        f"  - shared layout pattern: `{pair['shared_layout_pattern']}`",
        f"  - shared layout params: `{pair['shared_layout_params']}`",
        f"  - page classes: `{pair['left_page_class']}` vs `{pair['right_page_class']}`",
        f"  - equal bytes in first 64: `{pair['front_equal_bytes_64']}`",
        "",
        "## Four-Page Tail Entries",
        "",
    ]
    for entry in payload["four_page_tail_entries"]:
        lines.append(f"- `{entry['preview_asset_pes']}` tail `{entry['tail_bytes']}` bytes")
        lines.append(f"  - tail entropy: `{entry['tail_entropy']}`")
        lines.append(f"  - preceding-page entropy: `{entry['preceding_page_entropy']}`")
        lines.append(
            f"  - tail vs preceding-page histogram cosine: `{entry['tail_histogram_cosine_to_preceding_page']}`"
        )
        lines.append(f"  - boundary common prefix bytes: `{entry['boundary_common_prefix_bytes']}`")
    lines.extend(["", "## Cross-Tail Pairs", ""])
    for pair_entry in payload["cross_tail_pairs"]:
        lines.append(
            f"- `{pair_entry['left_car_id']}/{pair_entry['right_car_id']}` cosine `{pair_entry['tail_histogram_cosine']}` equal-bytes `{pair_entry['equal_bytes_in_shared_window']}` prefix `{pair_entry['common_prefix_bytes']}`"
        )
    lines.extend(["", "## Candidate Notes", ""])
    for note in payload["candidate_notes"]:
        lines.append(f"- `{note['classification']}` {note['claim']}")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preview-manifest", type=Path, required=True)
    parser.add_argument("--data-dir", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = build_payload(load_json(args.preview_manifest), args.data_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
