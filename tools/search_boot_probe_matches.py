#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


DEFAULT_EXCLUDE_FIELDS = {"frame"}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Search a longer td2_boot_probe.json for the window that most closely "
            "matches a target probe window by exact field equality."
        )
    )
    parser.add_argument("target_probe", type=Path, help="reference td2_boot_probe.json path")
    parser.add_argument("search_probe", type=Path, help="longer td2_boot_probe.json path to scan")
    parser.add_argument("out_json", type=Path, help="output JSON path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown summary path")
    parser.add_argument("--label-target", default="target", help="human label for the target probe")
    parser.add_argument("--label-search", default="search", help="human label for the searched probe")
    parser.add_argument("--target-start-frame", type=int, required=True, help="first target frame to compare")
    parser.add_argument("--target-end-frame", type=int, required=True, help="last target frame to compare")
    parser.add_argument("--search-start-frame", type=int, required=True, help="first searched frame to consider")
    parser.add_argument("--search-end-frame", type=int, required=True, help="last searched frame to consider")
    parser.add_argument(
        "--fields",
        default="",
        help="optional comma-separated subset of frame keys to compare",
    )
    parser.add_argument("--top-k", type=int, default=5, help="number of best matches to keep")
    return parser.parse_args()


def load_probe(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"{path} is not a JSON object")
    frames = payload.get("frames")
    if not isinstance(frames, list):
        raise ValueError(f"{path} has no frames array")
    return payload


def build_frame_lookup(payload: dict[str, Any]) -> dict[int, dict[str, Any]]:
    out: dict[int, dict[str, Any]] = {}
    for row in payload.get("frames", []):
        if not isinstance(row, dict):
            continue
        frame = row.get("frame")
        if isinstance(frame, int):
            out[frame] = row
    return out


def pick_fields(
    target_rows: dict[int, dict[str, Any]],
    search_rows: dict[int, dict[str, Any]],
    target_frames: list[int],
    raw_fields: str,
) -> list[str]:
    if raw_fields.strip():
        return [field.strip() for field in raw_fields.split(",") if field.strip()]

    first_target = target_rows[target_frames[0]]
    any_search = next(iter(search_rows.values()))
    common = set(first_target.keys()) & set(any_search.keys())
    return sorted(field for field in common if field not in DEFAULT_EXCLUDE_FIELDS)


def build_match_summary(
    *,
    target_frames: list[int],
    target_rows: dict[int, dict[str, Any]],
    search_rows: dict[int, dict[str, Any]],
    search_start: int,
    fields: list[str],
) -> dict[str, Any]:
    total_slots = len(target_frames) * len(fields)
    per_field_match_counts: dict[str, int] = {field: 0 for field in fields}
    exact_frame_matches = 0
    exact_field_frames: list[int] = []
    mismatched_fields: set[str] = set()

    for offset, target_frame in enumerate(target_frames):
        search_frame = search_start + offset
        target_row = target_rows[target_frame]
        search_row = search_rows[search_frame]
        frame_exact = True
        for field in fields:
            if target_row.get(field) == search_row.get(field):
                per_field_match_counts[field] += 1
            else:
                frame_exact = False
                mismatched_fields.add(field)
        if frame_exact:
            exact_frame_matches += 1
            exact_field_frames.append(search_frame)

    matched_slots = sum(per_field_match_counts.values())
    full_match_fields = sorted(
        field
        for field, count in per_field_match_counts.items()
        if count == len(target_frames)
    )
    partial_match_fields = sorted(
        field
        for field, count in per_field_match_counts.items()
        if 0 < count < len(target_frames)
    )

    return {
        "search_start_frame": search_start,
        "search_end_frame": search_start + len(target_frames) - 1,
        "window_length": len(target_frames),
        "matched_slots": matched_slots,
        "total_slots": total_slots,
        "match_ratio": (matched_slots / total_slots) if total_slots else 0.0,
        "exact_frame_matches": exact_frame_matches,
        "exact_field_frames": exact_field_frames,
        "full_match_field_count": len(full_match_fields),
        "full_match_fields": full_match_fields,
        "partial_match_fields": partial_match_fields,
        "mismatched_fields": sorted(mismatched_fields),
        "per_field_match_counts": per_field_match_counts,
    }


def build_markdown(payload: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("# Boot Probe Match Search")
    lines.append("")
    lines.append(f"- `{payload['label_target']}`: `{payload['target_probe']}`")
    lines.append(f"- `{payload['label_search']}`: `{payload['search_probe']}`")
    lines.append(
        f"- target frames: `{payload['target_start_frame']}..{payload['target_end_frame']}` "
        f"(`{payload['window_length']}` frames)"
    )
    lines.append(
        f"- searched frames: `{payload['search_start_frame']}..{payload['search_end_frame']}`"
    )
    lines.append(f"- compared fields: `{', '.join(payload['fields'])}`")
    lines.append("")
    lines.append("## Best Matches")
    lines.append("")
    for item in payload["matches"]:
        lines.append(
            f"- `{item['search_start_frame']}..{item['search_end_frame']}`: "
            f"`{item['matched_slots']}/{item['total_slots']}` slot matches "
            f"(`{item['match_ratio']:.4f}`), exact frames `{item['exact_frame_matches']}`, "
            f"full-match fields `{item['full_match_field_count']}`"
        )
        if item["full_match_fields"]:
            lines.append(f"  full fields: `{', '.join(item['full_match_fields'])}`")
        if item["partial_match_fields"]:
            lines.append(f"  partial fields: `{', '.join(item['partial_match_fields'][:12])}`")
        if item["mismatched_fields"]:
            lines.append(f"  mismatched fields: `{', '.join(item['mismatched_fields'][:12])}`")
    return "\n".join(lines) + "\n"


def main() -> None:
    args = parse_args()

    if args.target_end_frame < args.target_start_frame:
        raise SystemExit("error: target end frame must be >= target start frame")
    if args.search_end_frame < args.search_start_frame:
        raise SystemExit("error: search end frame must be >= search start frame")
    if args.top_k <= 0:
        raise SystemExit("error: --top-k must be positive")

    target_payload = load_probe(args.target_probe)
    search_payload = load_probe(args.search_probe)
    target_rows = build_frame_lookup(target_payload)
    search_rows = build_frame_lookup(search_payload)

    target_frames = [
        frame
        for frame in range(args.target_start_frame, args.target_end_frame + 1)
        if frame in target_rows
    ]
    if len(target_frames) != (args.target_end_frame - args.target_start_frame + 1):
        raise SystemExit("error: missing target frames inside requested window")

    fields = pick_fields(target_rows, search_rows, target_frames, args.fields)
    if not fields:
        raise SystemExit("error: no comparable fields")

    window_length = len(target_frames)
    candidate_starts: list[int] = []
    for start in range(args.search_start_frame, args.search_end_frame - window_length + 2):
        end = start + window_length - 1
        if all(frame in search_rows for frame in range(start, end + 1)):
            candidate_starts.append(start)

    if not candidate_starts:
        raise SystemExit("error: no complete search windows inside requested range")

    matches = [
        build_match_summary(
            target_frames=target_frames,
            target_rows=target_rows,
            search_rows=search_rows,
            search_start=start,
            fields=fields,
        )
        for start in candidate_starts
    ]
    matches.sort(
        key=lambda item: (
            -item["matched_slots"],
            -item["exact_frame_matches"],
            -item["full_match_field_count"],
            item["search_start_frame"],
        )
    )
    matches = matches[: args.top_k]

    out_payload = {
        "target_probe": str(args.target_probe),
        "search_probe": str(args.search_probe),
        "label_target": args.label_target,
        "label_search": args.label_search,
        "target_start_frame": args.target_start_frame,
        "target_end_frame": args.target_end_frame,
        "search_start_frame": args.search_start_frame,
        "search_end_frame": args.search_end_frame,
        "window_length": window_length,
        "fields": fields,
        "match_count_considered": len(candidate_starts),
        "matches": matches,
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(out_payload, indent=2), encoding="utf-8")

    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(build_markdown(out_payload), encoding="utf-8")


if __name__ == "__main__":
    main()
