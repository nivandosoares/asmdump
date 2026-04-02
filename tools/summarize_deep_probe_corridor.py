#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


DEFAULT_STATE_KEYS = [
    "main_callback_snes",
    "irq_callback_snes",
    "state_0202",
    "state_0440",
    "state_09a2",
    "state_09a8",
    "state_11f3",
    "state_129e",
    "state_18ee",
    "dp_0020",
    "dp_0022",
    "dp_0053",
    "dp_0054",
    "dp_0055",
    "dp_0056",
    "state_1c70",
    "state_1c76",
    "selector_1c80",
    "selector_1c86",
    "selector_1cac",
    "selector_1cae",
]

DEFAULT_HIT_KEYS = [
    "point_snes",
    "stack_return_rts",
    "selector_1c80",
    "selector_1c86",
    "selector_1cac",
    "selector_1cae",
    "dp_0054",
    "state_0202",
    "state_0960",
    "state_0964",
]

IMPORTANT_REGIONS = [
    "wram_0200_020f",
    "wram_0400_044f",
    "wram_0600_06ff",
    "wram_0700_07ff",
    "wram_0960_0973",
    "wram_11e0_11ff",
    "wram_1290_12af",
    "wram_18e0_18ff",
    "wram_1c60_1cef",
    "wram_1d00_1d3f",
    "wram_1e00_1e5f",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize a frame corridor from a mesen deep-probe JSON, including "
            "capture anchors, compare pairs, exec/write traces, and transition fields."
        )
    )
    parser.add_argument("probe_json", type=Path, help="input td2_boot_probe JSON path")
    parser.add_argument("--frame-start", required=True, type=int, help="inclusive corridor start frame")
    parser.add_argument("--frame-end", required=True, type=int, help="inclusive corridor end frame")
    parser.add_argument("--output", required=True, type=Path, help="output JSON summary path")
    parser.add_argument("--markdown-out", type=Path, help="optional Markdown summary path")
    parser.add_argument(
        "--state-keys",
        default=",".join(DEFAULT_STATE_KEYS),
        help="comma-separated frame/capture state keys to retain",
    )
    parser.add_argument(
        "--hit-keys",
        default=",".join(DEFAULT_HIT_KEYS),
        help="comma-separated exec/write hit keys to retain",
    )
    parser.add_argument(
        "--max-transition-events",
        type=int,
        default=16,
        help="how many transition-event head/tail rows to keep in the summary",
    )
    return parser.parse_args()


def parse_key_list(raw: str) -> list[str]:
    return [item.strip() for item in raw.split(",") if item.strip()]


def load_probe(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def frame_in_window(frame: int, start: int, end: int) -> bool:
    return start <= frame <= end


def interval_intersects(start_a: int, end_a: int, start_b: int, end_b: int) -> bool:
    return not (end_a < start_b or end_b < start_a)


def pick_keys(mapping: dict[str, Any], keys: list[str]) -> dict[str, Any]:
    return {key: mapping.get(key) for key in keys}


def summarize_timeline(frames: list[dict[str, Any]], state_keys: list[str]) -> list[dict[str, Any]]:
    return [{"frame": frame["frame"], **pick_keys(frame, state_keys)} for frame in frames]


def summarize_hits(hits: list[dict[str, Any]], hit_keys: list[str]) -> dict[str, Any]:
    grouped: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for hit in hits:
        grouped[str(hit["point_id"])].append(hit)

    summary: dict[str, Any] = {}
    for point_id, point_hits in sorted(grouped.items(), key=lambda item: (item[1][0]["frame"], item[0])):
        point_hits.sort(key=lambda hit: int(hit["frame"]))
        frames = [int(hit["frame"]) for hit in point_hits]
        unique_frames = sorted(set(frames))
        deltas = [right - left for left, right in zip(unique_frames, unique_frames[1:])]
        parity = sorted({"odd" if (frame & 1) else "even" for frame in unique_frames})
        stack_returns = sorted({int(hit["stack_return_rts"]) for hit in point_hits if hit.get("stack_return_rts") is not None})
        summary[point_id] = {
            "hit_count": len(point_hits),
            "unique_frame_count": len(unique_frames),
            "first_frame": unique_frames[0],
            "last_frame": unique_frames[-1],
            "frame_parity": parity,
            "frame_step_set": sorted(set(deltas)),
            "first_frames_head": unique_frames[:12],
            "last_frames_tail": unique_frames[-12:],
            "stack_return_rts_values": stack_returns[:8],
            "first_hit": pick_keys(point_hits[0], hit_keys),
            "last_hit": pick_keys(point_hits[-1], hit_keys),
        }
    return summary


def summarize_frames_with_multiple_points(hits: list[dict[str, Any]]) -> list[dict[str, Any]]:
    frame_points: dict[int, set[str]] = defaultdict(set)
    for hit in hits:
        frame_points[int(hit["frame"])].add(str(hit["point_id"]))

    grouped: dict[tuple[str, ...], list[int]] = defaultdict(list)
    for frame, point_ids in frame_points.items():
        if len(point_ids) < 2:
            continue
        grouped[tuple(sorted(point_ids))].append(frame)

    rows: list[dict[str, Any]] = []
    for point_ids, frames in sorted(grouped.items(), key=lambda item: (item[1][0], item[0])):
        frames.sort()
        rows.append(
            {
                "point_ids": list(point_ids),
                "frame_count": len(frames),
                "first_frame": frames[0],
                "last_frame": frames[-1],
                "frames_head": frames[:12],
                "frames_tail": frames[-12:],
            }
        )
    return rows


def compact_transition(event: dict[str, Any]) -> dict[str, Any]:
    return {
        "frame": event.get("frame"),
        "type": event.get("type"),
        "callback_changed": bool(event.get("callback_changed")),
        "fields": [change.get("field") for change in event.get("changes", [])],
    }


def summarize_transition_fields(events: list[dict[str, Any]], max_transition_events: int) -> dict[str, Any]:
    callback_change_count = sum(1 for event in events if event.get("callback_changed"))
    field_stats: dict[str, dict[str, Any]] = {}

    for event in events:
        frame = int(event.get("frame", 0))
        for change in event.get("changes", []):
            field = str(change.get("field"))
            current = field_stats.setdefault(
                field,
                {
                    "field": field,
                    "count": 0,
                    "first_frame": frame,
                    "last_frame": frame,
                    "first_before": change.get("before"),
                    "first_after": change.get("after"),
                    "last_before": change.get("before"),
                    "last_after": change.get("after"),
                },
            )
            current["count"] += 1
            if frame < int(current["first_frame"]):
                current["first_frame"] = frame
                current["first_before"] = change.get("before")
                current["first_after"] = change.get("after")
            if frame >= int(current["last_frame"]):
                current["last_frame"] = frame
                current["last_before"] = change.get("before")
                current["last_after"] = change.get("after")

    ordered_stats = sorted(field_stats.values(), key=lambda item: (-int(item["count"]), int(item["first_frame"]), item["field"]))
    return {
        "event_count": len(events),
        "callback_change_count": callback_change_count,
        "field_stats": ordered_stats,
        "events_head": [compact_transition(event) for event in events[:max_transition_events]],
        "events_tail": [compact_transition(event) for event in events[-max_transition_events:]],
    }


def build_first_hit_context(
    hit_summary: dict[str, Any],
    transitions: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for point_id, summary in sorted(hit_summary.items(), key=lambda item: (item[1]["first_frame"], item[0])):
        first_frame = int(summary["first_frame"])
        context = [
            compact_transition(event)
            for event in transitions
            if first_frame - 1 <= int(event.get("frame", -1)) <= first_frame + 2
        ]
        rows.append(
            {
                "point_id": point_id,
                "first_frame": first_frame,
                "context_events": context,
            }
        )
    return rows


def summarize_capture_artifact(artifact: dict[str, Any], state_keys: list[str]) -> dict[str, Any]:
    queue = artifact.get("queue", {})
    active_entries = queue.get("active_entries", [])
    simplified_active_entries = []
    for entry in active_entries[:4]:
        simplified_active_entries.append(
            {
                "slot": entry.get("slot"),
                "offset": entry.get("offset"),
                "bytes_hex": entry.get("bytes_hex"),
                "source_addr": entry.get("source_addr"),
                "transfer_size": entry.get("transfer_size"),
                "vram_dest": entry.get("vram_dest"),
            }
        )

    return {
        "frame": artifact.get("frame"),
        "state": pick_keys(artifact.get("state", {}), state_keys),
        "queue": {
            "active_descriptor_count": queue.get("active_descriptor_count"),
            "nonzero_entry_count": queue.get("nonzero_entry_count"),
            "active_entries": simplified_active_entries,
        },
    }


def summarize_compare_pair(pair: dict[str, Any]) -> dict[str, Any]:
    ppu_memory_diffs = pair.get("ppu_memory_diffs", {})
    region_diffs = pair.get("region_diffs", {})
    simplified_regions: dict[str, Any] = {}
    for region_key in IMPORTANT_REGIONS:
        region = region_diffs.get(region_key)
        if not isinstance(region, dict):
            continue
        simplified_regions[region_key] = {
            "label": region.get("label"),
            "changed_bytes": region.get("changed_bytes"),
            "first_changed_offset": region.get("first_changed_offset"),
        }

    return {
        "before_frame": pair.get("before_frame"),
        "after_frame": pair.get("after_frame"),
        "queue_transition": pair.get("queue_transition"),
        "state_changes": pair.get("state_changes"),
        "ppu_memory_diffs": {
            key: {
                "changed_bytes": value.get("changed_bytes"),
                "first_changed_offset": value.get("first_changed_offset"),
            }
            for key, value in ppu_memory_diffs.items()
        },
        "region_diffs": simplified_regions,
    }


def format_value(value: Any) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        if value < 0:
            return str(value)
        return f"{value} (0x{value:X})"
    if isinstance(value, list):
        return json.dumps(value, sort_keys=True)
    if value is None:
        return "null"
    return str(value)


def build_markdown(report: dict[str, Any]) -> str:
    lines = [
        "# Deep Probe Corridor Summary",
        "",
        f"- probe: `{report['probe_json']}`",
        f"- frame window: `{report['window']['start']}..{report['window']['end']}`",
        f"- sampled frame entries: `{report['counts']['sampled_timeline_entries']}`",
        f"- transition events: `{report['counts']['transition_events']}`",
        f"- exec hits: `{report['counts']['exec_hits']}`",
        f"- write hits: `{report['counts']['write_hits']}`",
        f"- capture artifacts in window: `{report['counts']['capture_artifacts']}`",
        f"- intersecting compare pairs: `{report['counts']['capture_compare_pairs']}`",
        "",
        "## Sampled Timeline",
        "",
    ]

    for row in report["sampled_timeline"]:
        fields = [
            f"{key}={format_value(value)}"
            for key, value in row.items()
            if key != "frame"
        ]
        lines.append(f"- `{row['frame']}`: " + ", ".join(fields))

    lines.extend(["", "## Capture Artifacts", ""])
    if report["capture_artifacts"]:
        for artifact in report["capture_artifacts"]:
            lines.append(f"### Frame `{artifact['frame']}`")
            lines.append("")
            lines.append(
                "- queue: "
                + f"`active={artifact['queue']['active_descriptor_count']}` "
                + f"`nonzero={artifact['queue']['nonzero_entry_count']}`"
            )
            for entry in artifact["queue"]["active_entries"]:
                lines.append(
                    "- active entry: "
                    + f"`slot={entry['slot']}` `offset={entry['offset']}` "
                    + f"`src={entry['source_addr']}` `size={entry['transfer_size']}` "
                    + f"`vram={entry['vram_dest']}` `bytes={entry['bytes_hex']}`"
                )
            lines.append("- state:")
            for key, value in artifact["state"].items():
                lines.append(f"  - `{key}`: `{format_value(value)}`")
            lines.append("")
    else:
        lines.append("- none")
        lines.append("")

    lines.extend(["## Compare Pairs", ""])
    if report["capture_compare_pairs"]:
        for pair in report["capture_compare_pairs"]:
            lines.append(f"### `{pair['before_frame']} -> {pair['after_frame']}`")
            lines.append("")
            queue = pair["queue_transition"]
            lines.append(
                "- queue: "
                + f"`active {queue['before_active_descriptors']} -> {queue['after_active_descriptors']}` "
                + f"`read {queue['before_read']} -> {queue['after_read']}` "
                + f"`write {queue['before_write']} -> {queue['after_write']}`"
            )
            ppu = pair["ppu_memory_diffs"]
            lines.append(
                "- ppu bytes changed: "
                + ", ".join(f"`{key}={format_value(value['changed_bytes'])}`" for key, value in ppu.items())
            )
            lines.append("- state changes:")
            for change in pair["state_changes"]:
                lines.append(
                    "  - "
                    + f"`{change['field']}`: `{format_value(change['before'])}` -> `{format_value(change['after'])}`"
                )
            lines.append("- region bytes changed:")
            for region_key, region in pair["region_diffs"].items():
                lines.append(
                    "  - "
                    + f"`{region_key}` ({region['label']}): `{format_value(region['changed_bytes'])}`"
                )
            lines.append("")
    else:
        lines.append("- none")
        lines.append("")

    lines.extend(["## Exec Hits", ""])
    if report["exec_points"]:
        for point_id, summary in report["exec_points"].items():
            lines.append(f"### `{point_id}`")
            lines.append("")
            lines.append(
                "- summary: "
                + f"`hits={summary['hit_count']}` "
                + f"`frames={summary['first_frame']}..{summary['last_frame']}` "
                + f"`parity={','.join(summary['frame_parity'])}` "
                + f"`step_set={summary['frame_step_set']}`"
            )
            lines.append(f"- first frames: `{summary['first_frames_head']}`")
            lines.append(f"- last frames: `{summary['last_frames_tail']}`")
            lines.append(f"- first hit: `{json.dumps(summary['first_hit'], sort_keys=True)}`")
            lines.append(f"- last hit: `{json.dumps(summary['last_hit'], sort_keys=True)}`")
            lines.append("")
    else:
        lines.append("- none")
        lines.append("")

    if report["exec_frames_with_multiple_points"]:
        lines.extend(["## Coincident Exec Frames", ""])
        for row in report["exec_frames_with_multiple_points"]:
            lines.append(
                "- "
                + f"`{row['point_ids']}` on `{row['frame_count']}` frames "
                + f"from `{row['first_frame']}` to `{row['last_frame']}`"
            )
        lines.append("")

    lines.extend(["## Write Hits", ""])
    if report["write_points"]:
        for point_id, summary in report["write_points"].items():
            lines.append(
                "- "
                + f"`{point_id}`: `hits={summary['hit_count']}` "
                + f"`frames={summary['first_frame']}..{summary['last_frame']}`"
            )
        lines.append("")
    else:
        lines.append("- none")
        lines.append("")

    transition_summary = report["transition_summary"]
    lines.extend(
        [
            "## Transition Fields",
            "",
            f"- callback-changing events: `{transition_summary['callback_change_count']}`",
            "",
        ]
    )
    for row in transition_summary["field_stats"][:16]:
        lines.append(
            "- "
            + f"`{row['field']}`: `{row['count']}` hits, "
            + f"`{row['first_frame']}` `{format_value(row['first_before'])}` -> `{format_value(row['first_after'])}`, "
            + f"`{row['last_frame']}` `{format_value(row['last_before'])}` -> `{format_value(row['last_after'])}`"
        )

    lines.extend(["", "## First-Hit Context", ""])
    if report["first_hit_context"]:
        for row in report["first_hit_context"]:
            lines.append(f"### `{row['point_id']}` first hit at `{row['first_frame']}`")
            lines.append("")
            if row["context_events"]:
                for event in row["context_events"]:
                    lines.append(
                        "- "
                        + f"`frame={event['frame']}` `type={event['type']}` "
                        + f"`callback_changed={event['callback_changed']}` "
                        + f"`fields={event['fields']}`"
                    )
            else:
                lines.append("- no transition events in `frame-1 .. frame+2`")
            lines.append("")
    else:
        lines.append("- none")
        lines.append("")

    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    state_keys = parse_key_list(args.state_keys)
    hit_keys = parse_key_list(args.hit_keys)

    payload = load_probe(args.probe_json)
    start = int(args.frame_start)
    end = int(args.frame_end)

    frame_rows = [
        frame
        for frame in payload.get("frames", [])
        if frame_in_window(int(frame.get("frame", -1)), start, end)
    ]
    transition_rows = [
        event
        for event in payload.get("transition_events", [])
        if frame_in_window(int(event.get("frame", -1)), start, end)
    ]
    exec_hits = [
        hit
        for hit in payload.get("exec_point_trace", {}).get("hits", [])
        if frame_in_window(int(hit.get("frame", -1)), start, end)
    ]
    write_hits = [
        hit
        for hit in payload.get("write_point_trace", {}).get("hits", [])
        if frame_in_window(int(hit.get("frame", -1)), start, end)
    ]
    capture_artifacts = [
        summarize_capture_artifact(artifact, state_keys)
        for artifact in payload.get("capture_artifacts", [])
        if frame_in_window(int(artifact.get("frame", -1)), start, end)
    ]
    compare_pairs = [
        summarize_compare_pair(pair)
        for pair in payload.get("capture_compare_pairs", [])
        if interval_intersects(int(pair.get("before_frame", -1)), int(pair.get("after_frame", -1)), start, end)
    ]

    exec_summary = summarize_hits(exec_hits, hit_keys)
    write_summary = summarize_hits(write_hits, hit_keys)
    transition_summary = summarize_transition_fields(transition_rows, args.max_transition_events)

    report = {
        "probe_json": str(args.probe_json),
        "window": {"start": start, "end": end},
        "counts": {
            "sampled_timeline_entries": len(frame_rows),
            "transition_events": len(transition_rows),
            "exec_hits": len(exec_hits),
            "write_hits": len(write_hits),
            "capture_artifacts": len(capture_artifacts),
            "capture_compare_pairs": len(compare_pairs),
        },
        "sampled_timeline": summarize_timeline(frame_rows, state_keys),
        "capture_artifacts": capture_artifacts,
        "capture_compare_pairs": compare_pairs,
        "exec_points": exec_summary,
        "exec_frames_with_multiple_points": summarize_frames_with_multiple_points(exec_hits),
        "write_points": write_summary,
        "transition_summary": transition_summary,
        "first_hit_context": build_first_hit_context(exec_summary, transition_rows),
    }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(f"wrote corridor summary -> {args.output}")

    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(build_markdown(report) + "\n", encoding="utf-8")
        print(f"wrote corridor summary markdown -> {args.markdown_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
