#!/usr/bin/env python3
"""Build visual contracts for a directory of Mesen design packs."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run build_mesen_visual_contract.py across frame_* design-pack folders "
            "and emit a compact range index."
        )
    )
    parser.add_argument("design_pack_range_dir", type=Path, help="Directory containing frame_* design-pack folders.")
    parser.add_argument("out_dir", type=Path, help="Output directory for per-frame visual contracts.")
    parser.add_argument(
        "--frame-glob",
        default="frame_*",
        help="Glob pattern used to discover design-pack frame directories (default: frame_*).",
    )
    parser.add_argument(
        "--builder-script",
        type=Path,
        default=Path(__file__).with_name("build_mesen_visual_contract.py"),
        help="Path to the single-frame visual-contract builder script.",
    )
    parser.add_argument(
        "--provenance-json",
        type=Path,
        help="Optional shared provenance artifact applied to every frame in the range.",
    )
    parser.add_argument(
        "--probe-json",
        type=Path,
        help="Optional shared mesen_probe_boot JSON applied to every frame in the range.",
    )
    parser.add_argument(
        "--probe-pattern",
        help=(
            "Optional per-frame mesen_probe_boot path pattern. Supports {frame} and "
            "{frame_padded}; overrides --probe-json when a matching file exists."
        ),
    )
    parser.add_argument(
        "--activity-trace-json",
        type=Path,
        help="Optional shared normalized activity-trace JSON applied to every frame in the range.",
    )
    parser.add_argument(
        "--clean-out",
        action="store_true",
        help="Delete out_dir before building.",
    )
    return parser.parse_args()


def parse_frame_number(path: Path) -> int | None:
    match = re.search(r"(\d+)", path.name)
    if not match:
        return None
    return int(match.group(1))


def collapse_sampled_value_ranges(entries: list[dict], key: str) -> list[dict]:
    rows = [
        row for row in entries
        if row.get("frameNumber") is not None and row.get(key) is not None
    ]
    if not rows:
        return []

    ranges: list[dict] = []
    current_value = rows[0][key]
    current_frames = [rows[0]["frameNumber"]]
    for row in rows[1:]:
        value = row[key]
        frame_number = row["frameNumber"]
        if value == current_value:
            current_frames.append(frame_number)
            continue
        ranges.append(
            {
                "value": current_value,
                "startFrame": current_frames[0],
                "endFrame": current_frames[-1],
                "frameCount": len(current_frames),
                "frames": current_frames,
            }
        )
        current_value = value
        current_frames = [frame_number]

    ranges.append(
        {
            "value": current_value,
            "startFrame": current_frames[0],
            "endFrame": current_frames[-1],
            "frameCount": len(current_frames),
            "frames": current_frames,
        }
    )
    return ranges


def sorted_unique(values: list[object]) -> list[object]:
    return sorted({value for value in values if value is not None})


def build_range_summary(entries: list[dict]) -> dict:
    frame_numbers = [row["frameNumber"] for row in entries if row.get("frameNumber") is not None]
    callback_entries = [row for row in entries if row.get("callbackStateEnabled")]
    activity_entries = [row for row in entries if row.get("activityTraceEnabled")]
    main_layer_sets = sorted_unique(tuple(row.get("mainLayerNames", [])) for row in entries)
    producer_trace_domains = sorted_unique(
        domain
        for row in entries
        for domain in row.get("producerTraceDomains", [])
    )

    summary = {
        "frameRange": {
            "start": min(frame_numbers) if frame_numbers else None,
            "end": max(frame_numbers) if frame_numbers else None,
            "frames": frame_numbers,
        },
        "bgModes": sorted_unique([row.get("bgMode") for row in entries]),
        "mainLayerSets": [list(names) for names in main_layer_sets],
        "visibleSpriteCount": {
            "min": min((row.get("visibleSpriteCount") for row in entries), default=None),
            "max": max((row.get("visibleSpriteCount") for row in entries), default=None),
            "ranges": collapse_sampled_value_ranges(entries, "visibleSpriteCount"),
        },
        "producerTrace": {
            "distinctDomains": producer_trace_domains,
            "framesWithoutVramDomain": [
                row["frameNumber"]
                for row in entries
                if row.get("frameNumber") is not None and "vram" not in row.get("producerTraceDomains", [])
            ],
        },
        "callbackState": {
            "enabledEntryCount": len(callback_entries),
            "distinctMainCallbacks": sorted_unique([row.get("mainCallbackSnes") for row in callback_entries]),
            "distinctIrqCallbacks": sorted_unique([row.get("irqCallbackSnes") for row in callback_entries]),
            "distinctNmiCallbacks": sorted_unique([row.get("nmiCallbackSnes") for row in callback_entries]),
            "state0204Ranges": collapse_sampled_value_ranges(callback_entries, "state0204"),
            "state0206Ranges": collapse_sampled_value_ranges(callback_entries, "state0206"),
            "state040aRanges": collapse_sampled_value_ranges(callback_entries, "state040a"),
            "dp0054Ranges": collapse_sampled_value_ranges(callback_entries, "dp0054"),
            "timeline": [
                {
                    "frameNumber": row.get("frameNumber"),
                    "visibleSpriteCount": row.get("visibleSpriteCount"),
                    "mainCallbackSnes": row.get("mainCallbackSnes"),
                    "irqCallbackSnes": row.get("irqCallbackSnes"),
                    "state0202": row.get("state0202"),
                    "state0204": row.get("state0204"),
                    "state0206": row.get("state0206"),
                    "state0208": row.get("state0208"),
                    "state020a": row.get("state020a"),
                    "state040a": row.get("state040a"),
                    "dp0054": row.get("dp0054"),
                    "producerTraceDomains": row.get("producerTraceDomains", []),
                }
                for row in callback_entries
            ],
        },
        "activityTrace": {
            "enabledEntryCount": len(activity_entries),
            "distinctMainCallbacks": sorted_unique([row.get("activityMainCallbackSnes") for row in activity_entries]),
            "distinctIrqCallbacks": sorted_unique([row.get("activityIrqCallbackSnes") for row in activity_entries]),
            "dmaEventCountRanges": collapse_sampled_value_ranges(activity_entries, "activityDmaEventCount"),
            "directEventCountRanges": collapse_sampled_value_ranges(activity_entries, "activityDirectEventCount"),
            "mode7EventCountRanges": collapse_sampled_value_ranges(activity_entries, "activityMode7EventCount"),
            "mode7WriteCountRanges": collapse_sampled_value_ranges(activity_entries, "activityMode7WriteCount"),
            "framesWithDma": [
                row["frameNumber"]
                for row in activity_entries
                if row.get("frameNumber") is not None and (row.get("activityDmaEventCount") or 0) > 0
            ],
            "framesWithoutDma": [
                row["frameNumber"]
                for row in activity_entries
                if row.get("frameNumber") is not None and (row.get("activityDmaEventCount") or 0) == 0
            ],
            "timeline": [
                {
                    "frameNumber": row.get("frameNumber"),
                    "activityMainCallbackSnes": row.get("activityMainCallbackSnes"),
                    "activityIrqCallbackSnes": row.get("activityIrqCallbackSnes"),
                    "activityDmaEventCount": row.get("activityDmaEventCount"),
                    "activityDmaDomains": row.get("activityDmaDomains", {}),
                    "activityDirectEventCount": row.get("activityDirectEventCount"),
                    "activityMode7EventCount": row.get("activityMode7EventCount"),
                    "activityMode7WriteCount": row.get("activityMode7WriteCount"),
                }
                for row in activity_entries
            ],
        },
    }
    return summary


def main() -> int:
    args = parse_args()
    design_pack_range_dir = args.design_pack_range_dir.resolve()
    out_dir = args.out_dir.resolve()
    builder_script = args.builder_script.resolve()

    if not design_pack_range_dir.is_dir():
        raise SystemExit(f"error: design-pack range directory not found: {design_pack_range_dir}")
    if not builder_script.is_file():
        raise SystemExit(f"error: builder script not found: {builder_script}")

    if args.clean_out and out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    frame_dirs = [path for path in design_pack_range_dir.glob(args.frame_glob) if path.is_dir()]
    frame_dirs.sort(key=lambda path: (parse_frame_number(path) is None, parse_frame_number(path) or 0, path.name))
    if not frame_dirs:
        raise SystemExit(
            f"error: no design-pack frame directories matched {args.frame_glob!r} under {design_pack_range_dir}"
        )

    entries: list[dict] = []
    for frame_dir in frame_dirs:
        frame_number = parse_frame_number(frame_dir)
        out_path = out_dir / f"{frame_dir.name}_visual_contract.json"
        cmd = [sys.executable, str(builder_script), str(frame_dir), str(out_path)]
        if args.provenance_json:
            cmd.extend(["--provenance-json", str(args.provenance_json.resolve())])
        probe_path = args.probe_json.resolve() if args.probe_json else None
        if args.probe_pattern and frame_number is not None:
            formatted_probe = args.probe_pattern.format(
                frame=frame_number,
                frame_padded=f"{frame_number:05d}",
            )
            candidate_probe = Path(formatted_probe).resolve()
            if not candidate_probe.is_file():
                raise SystemExit(f"error: probe pattern did not resolve to a file for frame {frame_number}: {candidate_probe}")
            probe_path = candidate_probe
        if probe_path:
            cmd.extend(["--probe-json", str(probe_path)])
        if args.activity_trace_json:
            cmd.extend(["--activity-trace-json", str(args.activity_trace_json.resolve())])
        subprocess.run(cmd, check=True)

        contract = json.loads(out_path.read_text(encoding="utf-8"))
        callback_state = contract.get("callbackState", {})
        callback_state_callbacks = callback_state.get("callbacks", {}) if isinstance(callback_state, dict) else {}
        callback_state_values = callback_state.get("state", {}) if isinstance(callback_state, dict) else {}
        callback_state_dp = callback_state.get("directPage", {}) if isinstance(callback_state, dict) else {}
        activity_trace = contract.get("activityTrace", {})
        activity_trace_callbacks = activity_trace.get("callbacks", {}) if isinstance(activity_trace, dict) else {}
        activity_trace_dma = activity_trace.get("dma", {}) if isinstance(activity_trace, dict) else {}
        activity_trace_direct = activity_trace.get("directWrites", {}) if isinstance(activity_trace, dict) else {}
        activity_trace_mode7 = activity_trace.get("mode7", {}) if isinstance(activity_trace, dict) else {}
        producer_trace = contract.get("producerTrace", {})
        producer_trace_domains = []
        if isinstance(producer_trace, dict):
            for row in producer_trace.get("domains", []):
                if isinstance(row, dict) and isinstance(row.get("domain"), str):
                    producer_trace_domains.append(row["domain"])

        entries.append(
            {
                "frameDir": frame_dir.name,
                "frameNumber": contract.get("frame", {}).get("frameNumber"),
                "contract": out_path.relative_to(out_dir).as_posix(),
                "bgMode": contract.get("frame", {}).get("bgMode"),
                "mainLayerNames": contract.get("frame", {}).get("mainLayerNames", []),
                "bgLayerCount": contract.get("bg", {}).get("layerCount"),
                "visibleSpriteCount": contract.get("obj", {}).get("visibleCount"),
                "provenanceEnabled": contract.get("provenance", {}).get("enabled"),
                "producerTraceEnabled": contract.get("producerTrace", {}).get("enabled"),
                "producerTraceDomains": producer_trace_domains,
                "callbackStateEnabled": callback_state.get("enabled") if isinstance(callback_state, dict) else False,
                "mainCallbackSnes": callback_state_callbacks.get("mainSnes") if isinstance(callback_state_callbacks, dict) else None,
                "irqCallbackSnes": callback_state_callbacks.get("irqSnes") if isinstance(callback_state_callbacks, dict) else None,
                "nmiCallbackSnes": callback_state_callbacks.get("nmiSnes") if isinstance(callback_state_callbacks, dict) else None,
                "state0202": callback_state_values.get("0202") if isinstance(callback_state_values, dict) else None,
                "state0204": callback_state_values.get("0204") if isinstance(callback_state_values, dict) else None,
                "state0206": callback_state_values.get("0206") if isinstance(callback_state_values, dict) else None,
                "state0208": callback_state_values.get("0208") if isinstance(callback_state_values, dict) else None,
                "state020a": callback_state_values.get("020a") if isinstance(callback_state_values, dict) else None,
                "state040a": callback_state_values.get("040a") if isinstance(callback_state_values, dict) else None,
                "dp0054": callback_state_dp.get("0054") if isinstance(callback_state_dp, dict) else None,
                "activityTraceEnabled": activity_trace.get("enabled") if isinstance(activity_trace, dict) else False,
                "activityMainCallbackSnes": activity_trace_callbacks.get("mainSnes") if isinstance(activity_trace_callbacks, dict) else None,
                "activityIrqCallbackSnes": activity_trace_callbacks.get("irqSnes") if isinstance(activity_trace_callbacks, dict) else None,
                "activityDmaEventCount": activity_trace_dma.get("eventCount") if isinstance(activity_trace_dma, dict) else None,
                "activityDmaDomains": activity_trace_dma.get("domains") if isinstance(activity_trace_dma, dict) else {},
                "activityDirectEventCount": activity_trace_direct.get("eventCount") if isinstance(activity_trace_direct, dict) else None,
                "activityMode7EventCount": activity_trace_mode7.get("eventCount") if isinstance(activity_trace_mode7, dict) else None,
                "activityMode7WriteCount": activity_trace_mode7.get("writeCount") if isinstance(activity_trace_mode7, dict) else None,
            }
        )

    range_index = {
        "schema": "td2.visual_contract_range.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "sourceDesignPackRangeDir": str(design_pack_range_dir),
        "outDir": str(out_dir),
        "frameCount": len(entries),
        "provenancePath": str(args.provenance_json.resolve()) if args.provenance_json else None,
        "probePath": str(args.probe_json.resolve()) if args.probe_json else None,
        "probePathPattern": args.probe_pattern,
        "summary": build_range_summary(entries),
        "entries": entries,
    }

    index_path = out_dir / "visual_contract_range.json"
    index_path.write_text(json.dumps(range_index, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {len(entries)} visual contracts to {out_dir}")
    print(f"index: {index_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
