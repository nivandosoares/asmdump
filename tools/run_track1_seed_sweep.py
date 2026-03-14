#!/usr/bin/env python3

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from compare_frames import load_image


@dataclass(frozen=True)
class Scenario:
    name: str
    input_windows: str


DEFAULT_SCENARIOS = (
    Scenario("b_hold", "60-359:b"),
    Scenario("start_then_b_hold", "60:start;61-359:b"),
    Scenario("start_then_a_hold", "60:start;61-359:a"),
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run a bounded deterministic button sweep against a gameplay savestate "
            "and classify whether each scenario stays static or begins moving."
        )
    )
    parser.add_argument(
        "--rom",
        type=Path,
        default=Path("game.smc"),
        help="ROM path passed to run_mesen_capture.sh (default: %(default)s)",
    )
    parser.add_argument(
        "--savestate",
        type=Path,
        default=Path(".mesen-config/Mesen2/SaveStates/game_11.mss"),
        help="savestate used to seed the capture (default: %(default)s)",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        required=True,
        help="directory for sweep outputs",
    )
    parser.add_argument(
        "--timeout-seconds",
        type=int,
        default=60,
        help="MESEN_TIMEOUT_SECONDS for each scenario (default: %(default)s)",
    )
    parser.add_argument(
        "--warmup-frames",
        type=int,
        default=60,
        help="TD2_CAPTURE_WARMUP_FRAMES for each scenario (default: %(default)s)",
    )
    parser.add_argument(
        "--capture-frames",
        type=int,
        default=300,
        help="TD2_CAPTURE_FRAMES for each scenario (default: %(default)s)",
    )
    parser.add_argument(
        "--screenshot-every",
        type=int,
        default=1,
        help="TD2_CAPTURE_SCREENSHOT_EVERY for each scenario (default: %(default)s)",
    )
    parser.add_argument(
        "--scenario",
        action="append",
        default=[],
        metavar="NAME=WINDOWS",
        help=(
            "override default sweep scenarios with explicit NAME=WINDOWS pairs "
            "(repeatable). WINDOWS use the same semicolon-separated syntax as "
            "TD2_CAPTURE_INPUT_WINDOWS."
        ),
    )
    return parser.parse_args()


def parse_scenarios(raw_scenarios: Iterable[str]) -> list[Scenario]:
    raw_list = list(raw_scenarios)
    if not raw_list:
        return list(DEFAULT_SCENARIOS)

    scenarios: list[Scenario] = []
    for raw in raw_list:
        name, separator, windows = raw.partition("=")
        name = name.strip()
        if separator == "" or name == "":
            raise SystemExit(f"error: invalid scenario {raw!r}; expected NAME=WINDOWS")
        scenarios.append(Scenario(name=name, input_windows=windows.strip()))
    return scenarios


def load_capture_log(path: Path) -> dict[str, object]:
    if not path.is_file():
        raise SystemExit(f"error: capture log missing: {path}")
    return json.loads(path.read_text(encoding="utf-8"))


def pixel_hash(path: Path) -> str:
    _, _, rgb = load_image(path)
    return hashlib.sha256(rgb).hexdigest()


def find_capture_index(entries: list[dict[str, object]], capture_index: int) -> dict[str, object] | None:
    for entry in entries:
        if int(entry.get("capture_index", -1)) == capture_index:
            return entry
    return None


def clean_prefix_outputs(prefix: Path) -> None:
    parent = prefix.parent
    stem = prefix.name
    if not parent.exists():
        parent.mkdir(parents=True, exist_ok=True)
        return

    for path in parent.glob(f"{stem}_frame_*.png"):
        path.unlink()

    for suffix in ("_input_log.json",):
        candidate = parent / f"{stem}{suffix}"
        if candidate.exists():
            candidate.unlink()


def run_scenario(
    root: Path,
    rom_path: Path,
    savestate_path: Path,
    out_dir: Path,
    scenario: Scenario,
    timeout_seconds: int,
    warmup_frames: int,
    capture_frames: int,
    screenshot_every: int,
) -> dict[str, object]:
    scenario_dir = out_dir / scenario.name
    output_prefix = scenario_dir / "capture"
    clean_prefix_outputs(output_prefix)

    env = os.environ.copy()
    env["MESEN_TIMEOUT_SECONDS"] = str(timeout_seconds)
    env["TD2_CAPTURE_WARMUP_FRAMES"] = str(warmup_frames)
    env["TD2_CAPTURE_FRAMES"] = str(capture_frames)
    env["TD2_CAPTURE_SCREENSHOT_EVERY"] = str(screenshot_every)
    env["TD2_CAPTURE_OUTPUT_PREFIX"] = str(output_prefix.resolve())
    env["TD2_CAPTURE_INPUT_WINDOWS"] = scenario.input_windows

    subprocess.run(
        [
            "./validation/run_mesen_capture.sh",
            str(rom_path),
            "./validation/mesen_capture.lua",
            str(savestate_path),
        ],
        cwd=root,
        env=env,
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    log_path = scenario_dir / "capture_input_log.json"
    capture_log = load_capture_log(log_path)
    entries = capture_log.get("frames", [])
    if not isinstance(entries, list):
        raise SystemExit(f"error: invalid capture log payload: {log_path}")

    screenshots = sorted(scenario_dir.glob("capture_frame_*.png"))
    if not screenshots:
        raise SystemExit(f"error: no screenshots produced for scenario {scenario.name}")

    hashes: list[str] = []
    capture_indices: list[int] = []
    frame_numbers: list[int | None] = []
    for path in screenshots:
        capture_index = int(path.stem.rsplit("_", 1)[-1])
        entry = find_capture_index(entries, capture_index)
        hashes.append(pixel_hash(path))
        capture_indices.append(capture_index)
        frame_numbers.append(int(entry["frame"]) if isinstance(entry, dict) and "frame" in entry else None)

    baseline_hash = hashes[0]
    first_nontrivial_pos = next((i for i, value in enumerate(hashes) if value != baseline_hash), None)
    first_motion_pos = None
    if first_nontrivial_pos is not None:
        seed_hash = hashes[first_nontrivial_pos]
        first_motion_pos = next(
            (i for i in range(first_nontrivial_pos + 1, len(hashes)) if hashes[i] != seed_hash),
            None,
        )

    first_adjacent_change_pos = next((i for i in range(1, len(hashes)) if hashes[i] != hashes[i - 1]), None)
    transition_count = sum(1 for i in range(1, len(hashes)) if hashes[i] != hashes[i - 1])
    distinct_hash_count = len(set(hashes))

    if distinct_hash_count == 1:
        classification = "fully_static"
    elif first_nontrivial_pos is not None and first_motion_pos is None:
        classification = "static_after_first_nontrivial"
    else:
        classification = "dynamic"

    return {
        "name": scenario.name,
        "input_windows": scenario.input_windows,
        "output_prefix": str(output_prefix.resolve()),
        "log_path": str(log_path.resolve()),
        "screenshot_count": len(screenshots),
        "distinct_hash_count": distinct_hash_count,
        "transition_count": transition_count,
        "classification": classification,
        "first_capture_index": capture_indices[0],
        "last_capture_index": capture_indices[-1],
        "first_script_frame": frame_numbers[0],
        "last_script_frame": frame_numbers[-1],
        "first_adjacent_change_capture_index": (
            capture_indices[first_adjacent_change_pos] if first_adjacent_change_pos is not None else None
        ),
        "first_adjacent_change_script_frame": (
            frame_numbers[first_adjacent_change_pos] if first_adjacent_change_pos is not None else None
        ),
        "first_nontrivial_capture_index": (
            capture_indices[first_nontrivial_pos] if first_nontrivial_pos is not None else None
        ),
        "first_nontrivial_script_frame": (
            frame_numbers[first_nontrivial_pos] if first_nontrivial_pos is not None else None
        ),
        "first_motion_capture_index": capture_indices[first_motion_pos] if first_motion_pos is not None else None,
        "first_motion_script_frame": frame_numbers[first_motion_pos] if first_motion_pos is not None else None,
    }


def build_summary(results: list[dict[str, object]]) -> dict[str, object]:
    dynamic_results = [result for result in results if result["classification"] == "dynamic"]
    static_seed_results = [
        result for result in results if result["classification"] == "static_after_first_nontrivial"
    ]

    if dynamic_results:
        recommended_next = (
            f"use scenario {dynamic_results[0]['name']} as the first moving gameplay window"
        )
    elif static_seed_results:
        recommended_next = (
            "all bounded scenarios still stop at a static track-start scene; "
            "replace the savestate with a later gameplay state"
        )
    else:
        recommended_next = (
            "the current savestate stayed fully static; replace it before spending more extractor time here"
        )

    return {
        "scenario_count": len(results),
        "dynamic_scenarios": [result["name"] for result in dynamic_results],
        "static_seed_scenarios": [result["name"] for result in static_seed_results],
        "recommended_next": recommended_next,
        "scenarios": results,
    }


def write_markdown(path: Path, summary: dict[str, object]) -> None:
    lines = [
        "# Track 1 Seed Sweep",
        "",
        "| Scenario | Windows | Distinct hashes | Classification | First nontrivial | First motion |",
        "|---|---|---:|---|---:|---:|",
    ]

    for result in summary["scenarios"]:
        lines.append(
            "| {name} | `{windows}` | {distinct_hash_count} | {classification} | {first_nontrivial} | {first_motion} |".format(
                name=result["name"],
                windows=result["input_windows"],
                distinct_hash_count=result["distinct_hash_count"],
                classification=result["classification"],
                first_nontrivial=(
                    result["first_nontrivial_script_frame"]
                    if result["first_nontrivial_script_frame"] is not None
                    else "-"
                ),
                first_motion=(
                    result["first_motion_script_frame"]
                    if result["first_motion_script_frame"] is not None
                    else "-"
                ),
            )
        )

    lines.extend(
        [
            "",
            f"- Scenario count: {summary['scenario_count']}",
            f"- Dynamic scenarios: {', '.join(summary['dynamic_scenarios']) if summary['dynamic_scenarios'] else 'none'}",
            f"- Static-seed scenarios: {', '.join(summary['static_seed_scenarios']) if summary['static_seed_scenarios'] else 'none'}",
            f"- Recommended next step: {summary['recommended_next']}",
        ]
    )

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    root = Path(__file__).resolve().parents[1]
    rom_path = args.rom if args.rom.is_absolute() else (root / args.rom)
    savestate_path = args.savestate if args.savestate.is_absolute() else (root / args.savestate)
    out_dir = args.out_dir if args.out_dir.is_absolute() else (root / args.out_dir)
    scenarios = parse_scenarios(args.scenario)

    if not rom_path.is_file():
        raise SystemExit(f"error: ROM not found: {rom_path}")
    if not savestate_path.is_file():
        raise SystemExit(f"error: savestate not found: {savestate_path}")
    if args.capture_frames <= 0:
        raise SystemExit("error: --capture-frames must be > 0")
    if args.screenshot_every <= 0:
        raise SystemExit("error: --screenshot-every must be > 0")

    out_dir.mkdir(parents=True, exist_ok=True)

    results = []
    for scenario in scenarios:
        result = run_scenario(
            root=root,
            rom_path=rom_path,
            savestate_path=savestate_path,
            out_dir=out_dir,
            scenario=scenario,
            timeout_seconds=args.timeout_seconds,
            warmup_frames=args.warmup_frames,
            capture_frames=args.capture_frames,
            screenshot_every=args.screenshot_every,
        )
        results.append(result)
        print(
            f"{scenario.name}: {result['classification']} "
            f"(distinct={result['distinct_hash_count']}, "
            f"first_nontrivial={result['first_nontrivial_script_frame']}, "
            f"first_motion={result['first_motion_script_frame']})"
        )

    summary = build_summary(results)
    summary_path = out_dir / "summary.json"
    markdown_path = out_dir / "summary.md"
    summary_path.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    write_markdown(markdown_path, summary)
    print(f"wrote {summary_path}")
    print(f"wrote {markdown_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
