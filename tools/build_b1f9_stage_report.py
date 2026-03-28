#!/usr/bin/env python3
"""Summarize forced B1F9 stage-trace matrix outputs into one report."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a compact JSON/Markdown report from one "
            "l001210_probe_matrix_v14_b1f9_stagetrace-style directory."
        )
    )
    parser.add_argument("input_dir", type=Path, help="Matrix output directory")
    parser.add_argument("json_out", type=Path, help="Output JSON report")
    parser.add_argument(
        "--markdown-out",
        type=Path,
        help="Optional Markdown summary output",
    )
    return parser.parse_args()


def load_json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def format_callback(bank: int | None, addr: int | None) -> str | None:
    if bank is None or addr is None:
        return None
    return f"{bank:02X}:{addr:04X}"


def snapshot_fields(frame_row: dict[str, object]) -> dict[str, object]:
    return {
        "frame": frame_row.get("frame"),
        "active_main": format_callback(
            frame_row.get("active_main_callback_bank"),
            frame_row.get("active_main_callback_addr"),
        ),
        "active_nmi": format_callback(
            frame_row.get("active_nmi_callback_bank"),
            frame_row.get("active_nmi_callback_addr"),
        ),
        "active_irq": format_callback(
            frame_row.get("active_irq_callback_bank"),
            frame_row.get("active_irq_callback_addr"),
        ),
        "selector_1c78": frame_row.get("selector_1c78"),
        "selector_1c80": frame_row.get("selector_1c80"),
        "selector_1ca8": frame_row.get("selector_1ca8"),
        "selector_1cac": frame_row.get("selector_1cac"),
        "selector_1cae": frame_row.get("selector_1cae"),
        "state_1d10": frame_row.get("state_1d10"),
        "state_1d10_hex": (
            f"0x{frame_row['state_1d10']:04X}"
            if isinstance(frame_row.get("state_1d10"), int)
            else None
        ),
        "state_0960": frame_row.get("state_0960"),
        "state_09a8": frame_row.get("state_09a8"),
        "state_1c86": frame_row.get("state_1c86"),
    }


def find_frame_snapshot(
    frames: list[dict[str, object]], target_frame: int | None
) -> dict[str, object] | None:
    if target_frame is None:
        return None
    for row in frames:
        if row.get("frame") == target_frame:
            return snapshot_fields(row)
    return None


def scenario_from_summary(summary_path: Path) -> dict[str, object]:
    summary = load_json(summary_path)
    if not isinstance(summary, dict):
        raise ValueError(f"Expected dict summary in {summary_path}")

    probe_path = Path(summary["probe_json"])
    trace_path = Path(summary["trace_json"])
    probe = load_json(probe_path)
    trace = load_json(trace_path)

    if not isinstance(probe, dict) or not isinstance(trace, dict):
        raise ValueError(f"Unexpected payload shapes for {summary_path}")

    frames = probe.get("frames", [])
    hits = trace.get("hits", [])
    if not isinstance(frames, list) or not isinstance(hits, list):
        raise ValueError(f"Unexpected frames/hits payloads for {summary_path}")

    exec_frames = probe.get("b1f9_exec_frames", [])
    entry_frame = exec_frames[0] if exec_frames else None
    post_entry_hits = []
    post_entry_bank30_hits = []
    bank30_sources = []
    for hit in hits:
        if not isinstance(hit, dict):
            continue
        frame = hit.get("frame")
        source_snes = hit.get("source_snes")
        source_bank = str(source_snes).split(":")[0] if source_snes else None
        if source_bank == "1E":
            bank30_sources.append(source_snes)
        if entry_frame is not None and isinstance(frame, int) and frame >= entry_frame:
            post_entry_hits.append(hit)
            if source_bank == "1E":
                post_entry_bank30_hits.append(hit)

    tail_snapshot = snapshot_fields(frames[-1]) if frames else None
    entry_snapshot = find_frame_snapshot(frames, entry_frame)
    bank30_sources = sorted(set(bank30_sources))

    return {
        "name": summary.get("name"),
        "total_hits": summary.get("total_hits"),
        "bank30_hits": summary.get("bank30_hits"),
        "bank30_sources": bank30_sources,
        "b1f9_exec_count": probe.get("b1f9_exec_count"),
        "b1f9_exec_frames": exec_frames,
        "b1f9_stage_counts": probe.get("b1f9_stage_counts"),
        "b1f9_stage_frames": probe.get("b1f9_stage_frames"),
        "post_b1f9_hit_count": len(post_entry_hits),
        "post_b1f9_bank30_hit_count": len(post_entry_bank30_hits),
        "entry_snapshot": entry_snapshot,
        "tail_snapshot": tail_snapshot,
        "summary_json": str(summary_path),
        "probe_json": str(probe_path),
        "trace_json": str(trace_path),
    }


def build_report(input_dir: Path) -> dict[str, object]:
    scenario_summaries = sorted(
        path
        for path in input_dir.glob("*_summary.json")
        if path.name != "matrix_summary.json"
    )
    scenarios = [scenario_from_summary(path) for path in scenario_summaries]
    forced = [
        item
        for item in scenarios
        if str(item.get("name", "")).startswith("force_main_")
    ]
    forced_stall = all(
        item.get("b1f9_exec_count") == 1
        and item.get("post_b1f9_hit_count") == 0
        and all(
            (item.get("b1f9_stage_counts") or {}).get(stage, 0) == 0
            for stage in ("b226", "b256", "b273", "b59b")
        )
        for item in forced
    )

    return {
        "input_dir": str(input_dir),
        "scenario_count": len(scenarios),
        "forced_scenario_count": len(forced),
        "forced_b1f9_stall_read": forced_stall,
        "scenarios": scenarios,
    }


def render_markdown(report: dict[str, object]) -> str:
    lines: list[str] = [
        "# B1F9 Stage Report",
        "",
        f"- input dir: `{report['input_dir']}`",
        f"- scenarios: `{report['scenario_count']}`",
        f"- forced scenarios: `{report['forced_scenario_count']}`",
        (
            "- forced-lane read: "
            f"`{'stall-after-entry' if report['forced_b1f9_stall_read'] else 'mixed'}`"
        ),
        "",
        "## Scenario Summary",
        "",
        "| Scenario | `B1F9` exec | Post-entry `L001210` hits | Bank30 hits | Stage counts | Tail main | Tail `1D10` | Tail `09A8` | Tail `0960` |",
        "|---|---:|---:|---:|---|---|---|---:|---:|",
    ]
    for scenario in report["scenarios"]:
        tail = scenario.get("tail_snapshot") or {}
        stages = scenario.get("b1f9_stage_counts") or {}
        stage_text = "/".join(
            f"{label}:{stages.get(label, 0)}"
            for label in ("b226", "b256", "b273", "b59b")
        )
        lines.append(
            "| `{name}` | `{exec_count}` | `{post_hits}` | `{bank30}` | `{stages}` | `{tail_main}` | `{tail_1d10}` | `{tail_09a8}` | `{tail_0960}` |".format(
                name=scenario.get("name"),
                exec_count=scenario.get("b1f9_exec_count"),
                post_hits=scenario.get("post_b1f9_hit_count"),
                bank30=scenario.get("bank30_hits"),
                stages=stage_text,
                tail_main=tail.get("active_main"),
                tail_1d10=tail.get("state_1d10_hex"),
                tail_09a8=tail.get("state_09a8"),
                tail_0960=tail.get("state_0960"),
            )
        )

    lines.extend(["", "## Forced Lane Detail", ""])
    for scenario in report["scenarios"]:
        name = str(scenario.get("name", ""))
        if not name.startswith("force_main_"):
            continue
        entry = scenario.get("entry_snapshot") or {}
        tail = scenario.get("tail_snapshot") or {}
        bank30_sources = scenario.get("bank30_sources") or []
        lines.extend(
            [
                f"### `{name}`",
                "",
                f"- `B1F9` exec frames: `{scenario.get('b1f9_exec_frames')}`",
                f"- post-entry `L001210` hits: `{scenario.get('post_b1f9_hit_count')}`",
                f"- post-entry bank30 hits: `{scenario.get('post_b1f9_bank30_hit_count')}`",
                f"- all bank30 sources seen in scenario: `{', '.join(bank30_sources) if bank30_sources else 'none'}`",
                (
                    "- entry snapshot: "
                    f"`main={entry.get('active_main')}` "
                    f"`1C78/1C80/1CA8={entry.get('selector_1c78')}/{entry.get('selector_1c80')}/{entry.get('selector_1ca8')}` "
                    f"`1D10={entry.get('state_1d10_hex')}` "
                    f"`09A8={entry.get('state_09a8')}` "
                    f"`0960={entry.get('state_0960')}`"
                ),
                (
                    "- tail snapshot: "
                    f"`main={tail.get('active_main')}` "
                    f"`1D10={tail.get('state_1d10_hex')}` "
                    f"`09A8={tail.get('state_09a8')}` "
                    f"`0960={tail.get('state_0960')}` "
                    f"`1C86={tail.get('state_1c86')}`"
                ),
                "",
            ]
        )
    return "\n".join(lines).rstrip() + "\n"


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def main() -> None:
    args = parse_args()
    report = build_report(args.input_dir)
    write_text(args.json_out, json.dumps(report, indent=2, sort_keys=True) + "\n")
    if args.markdown_out:
        write_text(args.markdown_out, render_markdown(report))


if __name__ == "__main__":
    main()
