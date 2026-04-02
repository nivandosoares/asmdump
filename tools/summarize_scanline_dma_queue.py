#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


INTERESTING_KEYS = [
    "dp_0053",
    "dp_0054",
    "wram_0053",
    "wram_0054",
    "wram_0055",
    "wram_0056",
    "queue_dma_nonzero_entry_count",
    "queue_dma_active_descriptor_count",
    "queue_dma_active_entries",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize visible-phase DMA queue state from one or more "
            "mesen_scanline_step_test capture JSON files."
        )
    )
    parser.add_argument("captures", nargs="+", type=Path, help="scanline capture JSON files")
    parser.add_argument("--output", required=True, type=Path, help="output JSON summary path")
    parser.add_argument(
        "--markdown-out",
        type=Path,
        help="optional Markdown summary path",
    )
    return parser.parse_args()


def stable_unique_values(samples: list[dict[str, object]], key: str) -> list[object]:
    seen: dict[str, object] = {}
    for sample in samples:
        value = sample.get(key)
        seen.setdefault(json.dumps(value, sort_keys=True), value)
    return list(seen.values())


def load_capture_payload(path: Path) -> tuple[int | None, list[dict[str, object]]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if "frames" in payload:
        frames = payload.get("frames", [])
        if len(frames) != 1:
            raise SystemExit(f"error: expected exactly one frame in {path}")
        frame_payload = frames[0]
        samples = frame_payload.get("samples", [])
        return frame_payload.get("target_frame"), samples

    samples = payload.get("samples", [])
    return payload.get("target_frame"), samples


def build_active_scanline_spans(samples: list[dict[str, object]]) -> list[dict[str, object]]:
    spans: list[dict[str, object]] = []
    current_span: dict[str, object] | None = None

    for sample in samples:
        scanline = int(sample.get("scanline", 0))
        active_descriptor_count = int(sample.get("queue_dma_active_descriptor_count", 0) or 0)
        active_entries = sample.get("queue_dma_active_entries", [])
        active_entries_key = json.dumps(active_entries, sort_keys=True)

        if active_descriptor_count <= 0:
            if current_span is not None:
                spans.append(current_span)
                current_span = None
            continue

        if current_span is None:
            current_span = {
                "start_scanline": scanline,
                "end_scanline": scanline,
                "scanline_count": 1,
                "active_descriptor_count": active_descriptor_count,
                "active_entries": active_entries,
                "descriptor_key": active_entries_key,
            }
            continue

        same_descriptor = current_span["descriptor_key"] == active_entries_key
        contiguous = scanline == int(current_span["end_scanline"]) + 1
        same_count = active_descriptor_count == int(current_span["active_descriptor_count"])
        if same_descriptor and contiguous and same_count:
            current_span["end_scanline"] = scanline
            current_span["scanline_count"] = int(current_span["scanline_count"]) + 1
            continue

        spans.append(current_span)
        current_span = {
            "start_scanline": scanline,
            "end_scanline": scanline,
            "scanline_count": 1,
            "active_descriptor_count": active_descriptor_count,
            "active_entries": active_entries,
            "descriptor_key": active_entries_key,
        }

    if current_span is not None:
        spans.append(current_span)

    for span in spans:
        span.pop("descriptor_key", None)
    return spans


def summarize_capture(path: Path) -> dict[str, object]:
    target_frame, samples = load_capture_payload(path)
    if not samples:
        raise SystemExit(f"error: no samples in {path}")

    representative = samples[0]
    unique_values = {key: stable_unique_values(samples, key) for key in INTERESTING_KEYS}
    active_spans = build_active_scanline_spans(samples)
    return {
        "capture": str(path),
        "target_frame": target_frame,
        "sample_count": len(samples),
        "scanline_min": min(sample.get("scanline", 0) for sample in samples),
        "scanline_max": max(sample.get("scanline", 0) for sample in samples),
        "stable_across_samples": {key: len(values) == 1 for key, values in unique_values.items()},
        "unique_values": unique_values,
        "representative": {key: representative.get(key) for key in INTERESTING_KEYS},
        "activity": {
            "active_scanline_count": sum(
                1
                for sample in samples
                if int(sample.get("queue_dma_active_descriptor_count", 0) or 0) > 0
            ),
            "active_descriptor_count_max": max(
                int(sample.get("queue_dma_active_descriptor_count", 0) or 0)
                for sample in samples
            ),
            "active_scanline_spans": active_spans,
        },
    }


def build_comparisons(summaries: list[dict[str, object]]) -> dict[str, object]:
    if not summaries:
        return {}

    baseline = summaries[0]["representative"]
    baseline_frame = summaries[0]["target_frame"]
    comparisons: dict[str, object] = {}
    for summary in summaries[1:]:
        current = summary["representative"]
        frame = summary["target_frame"]
        diffs: dict[str, object] = {}
        for key in INTERESTING_KEYS:
            if baseline.get(key) != current.get(key):
                diffs[key] = {
                    f"frame_{baseline_frame}": baseline.get(key),
                    f"frame_{frame}": current.get(key),
                }
        if summaries[0]["activity"] != summary["activity"]:
            diffs["activity"] = {
                f"frame_{baseline_frame}": summaries[0]["activity"],
                f"frame_{frame}": summary["activity"],
            }
        comparisons[str(frame)] = diffs
    return comparisons


def format_scalar(value: object) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return f"{value} (0x{value:X})"
    return json.dumps(value, sort_keys=True)


def build_markdown(output: dict[str, object]) -> str:
    lines = [
        "# Scanline DMA Queue Summary",
        "",
        "This report compares visible-phase queue/DMA state across scanline captures.",
        "",
    ]

    frames = output.get("frames", {})
    ordered_keys = sorted(frames.keys(), key=lambda key: int(key))
    for frame_key in ordered_keys:
        summary = frames[frame_key]
        activity = summary.get("activity", {})
        lines.extend(
            [
                f"## Frame `{frame_key}`",
                "",
                f"- capture: `{summary['capture']}`",
                f"- sampled scanlines: `{summary['scanline_min']}..{summary['scanline_max']}` (`{summary['sample_count']}` samples)",
                f"- active queue scanlines: `{activity.get('active_scanline_count', 0)}`",
                f"- max active descriptors: `{activity.get('active_descriptor_count_max', 0)}`",
            ]
        )

        spans = activity.get("active_scanline_spans", [])
        if spans:
            lines.append("- active spans:")
            for span in spans:
                lines.append(
                    "  - "
                    + f"`{span['start_scanline']}..{span['end_scanline']}` "
                    + f"(`{span['scanline_count']}` scanlines, "
                    + f"{span['active_descriptor_count']} descriptor(s))"
                )
                lines.append(
                    "  - "
                    + f"entries: `{json.dumps(span['active_entries'], sort_keys=True)}`"
                )
        else:
            lines.append("- active spans: none")

        lines.append("- representative queue fields:")
        representative = summary.get("representative", {})
        for key in INTERESTING_KEYS:
            lines.append(f"  - `{key}`: `{format_scalar(representative.get(key))}`")
        lines.append("")

    comparisons = output.get("comparisons_vs_first", {})
    if comparisons:
        lines.extend(
            [
                "## Differences vs First Frame",
                "",
            ]
        )
        for frame_key in sorted(comparisons.keys(), key=lambda key: int(key)):
            diffs = comparisons[frame_key]
            lines.append(f"### Frame `{frame_key}`")
            if not diffs:
                lines.append("")
                lines.append("- no differences vs the first frame")
                lines.append("")
                continue
            lines.append("")
            for key, values in diffs.items():
                lines.append(f"- `{key}`:")
                lines.append(f"  - baseline: `{json.dumps(values[next(iter(values))], sort_keys=True)}`")
                lines.append(f"  - current: `{json.dumps(values[list(values.keys())[1]], sort_keys=True)}`")
            lines.append("")

    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    summaries = [summarize_capture(path) for path in args.captures]
    summaries.sort(key=lambda item: int(item["target_frame"]))
    output = {
        "frames": {str(summary["target_frame"]): summary for summary in summaries},
        "comparisons_vs_first": build_comparisons(summaries),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(build_markdown(output) + "\n", encoding="utf-8")
    print(args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
