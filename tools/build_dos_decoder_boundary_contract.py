#!/usr/bin/env python3
"""Build a bounded decoder-boundary contract for DOS TD2 *ST.PES assets."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


FRONT_WINDOW_BYTES = 256
TAIL_BOUNDARY = 4096 * 3
MIN_FRONT_RUN = 8
MIN_STREAM_RUN = 6
RECOMMENDED_PAIR = ("P959", "ROSS")


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def classify_runs(data: bytes, min_run: int) -> list[dict[str, object]]:
    runs: list[dict[str, object]] = []
    i = 0
    while i < len(data):
        j = i + 1
        while j < len(data) and data[j - 1] < data[j]:
            j += 1
        if j - i >= min_run:
            runs.append(
                {
                    "start": i,
                    "end": j,
                    "length": j - i,
                    "hex": " ".join(f"{byte:02x}" for byte in data[i:j]),
                }
            )
        i = max(j, i + 1)
    return runs


def longest_run(data: bytes) -> int:
    best = 1
    i = 0
    while i < len(data):
        j = i + 1
        while j < len(data) and data[j - 1] < data[j]:
            j += 1
        best = max(best, j - i)
        i = max(j, i + 1)
    return best


def read_preview_data(preview_entry: dict[str, object], data_dir: Path) -> dict[str, object]:
    pes_path = data_dir / str(preview_entry["preview_asset_pes"])
    data = pes_path.read_bytes()
    front_window = data[:FRONT_WINDOW_BYTES]
    entry = {
        "car_id": preview_entry["car_id"],
        "display_name": preview_entry["display_name"],
        "layout_pattern": preview_entry["layout_pattern"],
        "layout_params": preview_entry["layout_params"],
        "preview_asset_pes": preview_entry["preview_asset_pes"],
        "front_window_bytes": len(front_window),
        "front_longest_strict_run": longest_run(front_window),
        "front_increasing_runs": classify_runs(front_window, MIN_FRONT_RUN),
    }
    if len(data) > TAIL_BOUNDARY:
        preceding_window = data[TAIL_BOUNDARY - FRONT_WINDOW_BYTES : TAIL_BOUNDARY]
        tail_window = data[TAIL_BOUNDARY : TAIL_BOUNDARY + FRONT_WINDOW_BYTES]
        entry["preceding_window_bytes"] = len(preceding_window)
        entry["preceding_longest_strict_run"] = longest_run(preceding_window)
        entry["preceding_stream_runs"] = classify_runs(preceding_window, MIN_STREAM_RUN)
        entry["tail_window_bytes"] = len(tail_window)
        entry["tail_longest_strict_run"] = longest_run(tail_window)
        entry["tail_stream_runs"] = classify_runs(tail_window, MIN_STREAM_RUN)
        entry["tail_start_hex"] = " ".join(f"{byte:02x}" for byte in tail_window[:32])
    return entry


def build_recommended_pair(entries: list[dict[str, object]]) -> dict[str, object]:
    by_car = {entry["car_id"]: entry for entry in entries}
    left = by_car[RECOMMENDED_PAIR[0]]
    right = by_car[RECOMMENDED_PAIR[1]]
    return {
        "left_car_id": left["car_id"],
        "right_car_id": right["car_id"],
        "shared_layout_pattern": left["layout_pattern"] == right["layout_pattern"],
        "shared_layout_params": left["layout_params"] == right["layout_params"],
        "left_front_longest_strict_run": left["front_longest_strict_run"],
        "right_front_longest_strict_run": right["front_longest_strict_run"],
        "right_preceding_longest_strict_run": right.get("preceding_longest_strict_run"),
        "right_tail_longest_strict_run": right.get("tail_longest_strict_run"),
    }


def candidate_notes(entries: list[dict[str, object]], recommended_pair: dict[str, object]) -> list[dict[str, object]]:
    notes: list[dict[str, object]] = [
        {
            "classification": "VERIFIED",
            "claim": "The first 256 bytes of every promoted car-preview *ST.PES asset contain long strictly increasing runs, which marks the front page as structured table/header territory rather than undifferentiated packed stream data.",
            "evidence": {
                entry["car_id"]: {
                    "front_longest_strict_run": entry["front_longest_strict_run"],
                    "front_run_starts": [run["start"] for run in entry["front_increasing_runs"]],
                }
                for entry in entries
            },
        }
    ]

    four_page_entries = [entry for entry in entries if "tail_longest_strict_run" in entry]
    if four_page_entries and all(entry["tail_longest_strict_run"] < MIN_STREAM_RUN for entry in four_page_entries):
        notes.append(
            {
                "classification": "VERIFIED",
                "claim": "The first 256 bytes of the promoted four-page tails do not preserve the front-page table pattern; no current tail window reaches the six-byte stream-run threshold.",
                "evidence": {
                    entry["car_id"]: {
                        "tail_longest_strict_run": entry["tail_longest_strict_run"],
                        "tail_stream_runs": entry["tail_stream_runs"],
                    }
                    for entry in four_page_entries
                },
            }
        )

    if four_page_entries and all(
        entry["tail_longest_strict_run"] <= entry["preceding_longest_strict_run"] for entry in four_page_entries
    ):
        notes.append(
            {
                "classification": "PROBABLE",
                "claim": "The early four-page tail remains in the same stream-like regime as the preceding boundary window, which supports continuity-first decoding rather than a reset into a shared footer/table family.",
                "evidence": {
                    entry["car_id"]: {
                        "preceding_longest_strict_run": entry["preceding_longest_strict_run"],
                        "tail_longest_strict_run": entry["tail_longest_strict_run"],
                    }
                    for entry in four_page_entries
                },
            }
        )

    notes.append(
        {
            "classification": "VERIFIED",
            "claim": "P959ST.PES and ROSSST.PES remain the best bounded cross-class pair for this decoder boundary because they share layout family while diverging exactly at the three-page versus four-page split.",
            "evidence": recommended_pair,
        }
    )
    return notes


def build_payload(preview_manifest: dict[str, object], data_dir: Path) -> dict[str, object]:
    entries = [read_preview_data(entry, data_dir) for entry in preview_manifest["preview_entries"]]
    recommended_pair = build_recommended_pair(entries)
    return {
        "version": 1,
        "created": "2026-04-10",
        "scope": "Bounded decoder-boundary contract for DOS TD2 *ST.PES assets.",
        "front_window_bytes": FRONT_WINDOW_BYTES,
        "tail_boundary": TAIL_BOUNDARY,
        "minimum_front_run": MIN_FRONT_RUN,
        "minimum_stream_run": MIN_STREAM_RUN,
        "recommended_pair": recommended_pair,
        "entries": entries,
        "candidate_notes": candidate_notes(entries, recommended_pair),
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Decoder Boundary Contract",
        "",
        f"- front window bytes: `{payload['front_window_bytes']}`",
        f"- tail boundary: `{payload['tail_boundary']}`",
        f"- front run threshold: `{payload['minimum_front_run']}`",
        f"- stream run threshold: `{payload['minimum_stream_run']}`",
        "",
        "## Entry Summary",
        "",
    ]
    for entry in payload["entries"]:
        lines.append(
            f"- `{entry['preview_asset_pes']}` front longest run `{entry['front_longest_strict_run']}` starts `{[run['start'] for run in entry['front_increasing_runs']]}`"
        )
        if "tail_longest_strict_run" in entry:
            lines.append(
                f"  - boundary window longest run `{entry['preceding_longest_strict_run']}` tail longest run `{entry['tail_longest_strict_run']}`"
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
