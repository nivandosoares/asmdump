#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Any


DEFAULT_EXCLUDE_FIELDS = {
    "frame",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare two td2_boot_probe.json frame windows and summarize "
            "stable versus intermittent state differences."
        )
    )
    parser.add_argument("probe_a", type=Path, help="first td2_boot_probe.json path")
    parser.add_argument("probe_b", type=Path, help="second td2_boot_probe.json path")
    parser.add_argument("out_json", type=Path, help="output JSON path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown summary output path")
    parser.add_argument("--label-a", default="probe_a", help="human label for probe A")
    parser.add_argument("--label-b", default="probe_b", help="human label for probe B")
    parser.add_argument(
        "--frame-offset-a",
        type=int,
        default=0,
        help=(
            "optional signed offset applied to probe A frame numbers before "
            "window matching"
        ),
    )
    parser.add_argument(
        "--frame-offset-b",
        type=int,
        default=0,
        help=(
            "optional signed offset applied to probe B frame numbers before "
            "window matching"
        ),
    )
    parser.add_argument("--start-frame", type=int, required=True, help="first frame to compare (inclusive)")
    parser.add_argument("--end-frame", type=int, required=True, help="last frame to compare (inclusive)")
    parser.add_argument(
        "--fields",
        default="",
        help="optional comma-separated subset of frame keys to compare",
    )
    return parser.parse_args()


def load_probe(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"{path} is not a JSON object")
    frames = payload.get("frames")
    if not isinstance(frames, list):
        raise ValueError(f"{path} has no frames array")
    return payload


def build_frame_lookup(payload: dict[str, Any], frame_offset: int) -> dict[int, dict[str, Any]]:
    out: dict[int, dict[str, Any]] = {}
    for row in payload.get("frames", []):
        if not isinstance(row, dict):
            continue
        frame = row.get("frame")
        if not isinstance(frame, int):
            continue
        out[frame + frame_offset] = row
    return out


def format_callback(bank: Any, addr: Any) -> str | None:
    if not isinstance(bank, int) or not isinstance(addr, int):
        return None
    return f"{bank & 0xFF:02X}:{addr & 0xFFFF:04X}"


def collect_callback_summary(rows: dict[int, dict[str, Any]], frames: list[int]) -> dict[str, list[str]]:
    summary: dict[str, list[str]] = {}
    for name, bank_key, addr_key in (
        ("main", "active_main_callback_bank", "active_main_callback_addr"),
        ("irq", "active_irq_callback_bank", "active_irq_callback_addr"),
        ("nmi", "active_nmi_callback_bank", "active_nmi_callback_addr"),
    ):
        seen = []
        known = set()
        for frame in frames:
            row = rows[frame]
            value = format_callback(row.get(bank_key), row.get(addr_key))
            if value is None or value in known:
                continue
            known.add(value)
            seen.append(value)
        summary[name] = seen
    return summary


def collect_field_summary(
    frames: list[int],
    rows_a: dict[int, dict[str, Any]],
    rows_b: dict[int, dict[str, Any]],
    field: str,
) -> dict[str, Any]:
    values_a = [rows_a[frame].get(field) for frame in frames]
    values_b = [rows_b[frame].get(field) for frame in frames]
    diff_frames = [frame for frame in frames if rows_a[frame].get(field) != rows_b[frame].get(field)]

    pair_counter = Counter(
        (rows_a[frame].get(field), rows_b[frame].get(field))
        for frame in diff_frames
    )

    unique_a = sorted({value for value in values_a}, key=repr)
    unique_b = sorted({value for value in values_b}, key=repr)

    return {
        "field": field,
        "diff_count": len(diff_frames),
        "total_frames": len(frames),
        "all_frames_differ": len(diff_frames) == len(frames),
        "first_diff_frame": diff_frames[0] if diff_frames else None,
        "last_diff_frame": diff_frames[-1] if diff_frames else None,
        "unique_values_a": unique_a,
        "unique_values_b": unique_b,
        "constant_a_over_window": len(unique_a) == 1,
        "constant_b_over_window": len(unique_b) == 1,
        "pair_counts": [
            {
                "value_a": value_a,
                "value_b": value_b,
                "count": count,
            }
            for (value_a, value_b), count in pair_counter.most_common()
        ],
    }


def summarize_categories(differing_fields: list[dict[str, Any]]) -> dict[str, list[str]]:
    stable_constant = []
    stable_all_frames = []
    intermittent_constant_pairs = []
    intermittent_mixed = []

    for item in differing_fields:
        field = item["field"]
        if item["all_frames_differ"] and item["constant_a_over_window"] and item["constant_b_over_window"]:
            stable_constant.append(field)
        elif item["all_frames_differ"]:
            stable_all_frames.append(field)
        elif item["pair_counts"] and len(item["pair_counts"]) == 1:
            intermittent_constant_pairs.append(field)
        else:
            intermittent_mixed.append(field)

    return {
        "stable_constant_window_differences": stable_constant,
        "stable_all_frame_differences": stable_all_frames,
        "intermittent_constant_pair_differences": intermittent_constant_pairs,
        "intermittent_mixed_differences": intermittent_mixed,
    }


def build_markdown(payload: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("# Boot Probe Window Compare")
    lines.append("")
    lines.append(f"- `{payload['label_a']}`: `{payload['probe_a']}`")
    lines.append(f"- `{payload['label_b']}`: `{payload['probe_b']}`")
    if payload["frame_offset_a"] != 0 or payload["frame_offset_b"] != 0:
        lines.append(
            f"- frame offsets: `{payload['label_a']}={payload['frame_offset_a']}`, "
            f"`{payload['label_b']}={payload['frame_offset_b']}`"
        )
    lines.append(
        f"- compared frames: `{payload['start_frame']}..{payload['end_frame']}` "
        f"(`{payload['compared_frame_count']}` shared frames)"
    )
    lines.append("")
    lines.append("## Shared Callback Surface")
    lines.append("")

    callbacks = payload["callback_summary"]
    for name in ("main", "irq", "nmi"):
        info = callbacks[name]
        match = "same" if info["same"] else "different"
        lines.append(
            f"- `{name}`: `{match}` | `{payload['label_a']}` = "
            f"`{', '.join(info['a']) or 'none'}` | `{payload['label_b']}` = "
            f"`{', '.join(info['b']) or 'none'}`"
        )

    lines.append("")
    lines.append("## Difference Categories")
    lines.append("")
    categories = payload["categories"]
    for key in (
        "stable_constant_window_differences",
        "stable_all_frame_differences",
        "intermittent_constant_pair_differences",
        "intermittent_mixed_differences",
    ):
        fields = categories[key]
        lines.append(f"- `{key}`: `{', '.join(fields) if fields else 'none'}`")

    lines.append("")
    lines.append("## Differing Fields")
    lines.append("")
    for item in payload["differing_fields"]:
        pairs = ", ".join(
            f"`{entry['value_a']} -> {entry['value_b']}` x{entry['count']}"
            for entry in item["pair_counts"][:4]
        )
        lines.append(
            f"- `{item['field']}`: diff `{item['diff_count']}/{item['total_frames']}` "
            f"frames, first `{item['first_diff_frame']}`, last `{item['last_diff_frame']}`, "
            f"pairs {pairs or '`none`'}"
        )
    return "\n".join(lines) + "\n"


def main() -> None:
    args = parse_args()

    payload_a = load_probe(args.probe_a)
    payload_b = load_probe(args.probe_b)
    rows_a = build_frame_lookup(payload_a, args.frame_offset_a)
    rows_b = build_frame_lookup(payload_b, args.frame_offset_b)

    frames = [
        frame
        for frame in range(args.start_frame, args.end_frame + 1)
        if frame in rows_a and frame in rows_b
    ]
    if not frames:
        raise ValueError("no shared frames in requested window")

    if args.fields.strip():
        fields = [field.strip() for field in args.fields.split(",") if field.strip()]
    else:
        common = set(rows_a[frames[0]].keys()) & set(rows_b[frames[0]].keys())
        fields = sorted(field for field in common if field not in DEFAULT_EXCLUDE_FIELDS)

    differing_fields = []
    same_fields = []
    for field in fields:
        item = collect_field_summary(frames, rows_a, rows_b, field)
        if item["diff_count"] > 0:
            differing_fields.append(item)
        else:
            same_fields.append(field)

    differing_fields.sort(
        key=lambda item: (-item["diff_count"], item["field"])
    )

    callbacks_a = collect_callback_summary(rows_a, frames)
    callbacks_b = collect_callback_summary(rows_b, frames)

    out_payload = {
        "probe_a": str(args.probe_a),
        "probe_b": str(args.probe_b),
        "label_a": args.label_a,
        "label_b": args.label_b,
        "frame_offset_a": args.frame_offset_a,
        "frame_offset_b": args.frame_offset_b,
        "start_frame": args.start_frame,
        "end_frame": args.end_frame,
        "compared_frame_count": len(frames),
        "shared_frames": [frames[0], frames[-1]],
        "callback_summary": {
            name: {
                "a": callbacks_a[name],
                "b": callbacks_b[name],
                "same": callbacks_a[name] == callbacks_b[name],
            }
            for name in ("main", "irq", "nmi")
        },
        "same_field_count": len(same_fields),
        "same_fields": same_fields,
        "differing_field_count": len(differing_fields),
        "differing_fields": differing_fields,
        "categories": summarize_categories(differing_fields),
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(out_payload, indent=2) + "\n", encoding="utf-8")

    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(build_markdown(out_payload), encoding="utf-8")


if __name__ == "__main__":
    main()
