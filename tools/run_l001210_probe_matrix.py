#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
from pathlib import Path
from typing import Any


INPUT_ENV_KEYS = (
    "TD2_BOOT_PROBE_INPUT",
    "TD2_BOOT_PROBE_INPUT_START_FRAME",
    "TD2_BOOT_PROBE_INPUT_END_FRAME",
    "TD2_BOOT_PROBE_INPUT_WINDOWS",
)

EXPERIMENT_ENV_KEYS = (
    "TD2_BOOT_PROBE_TRACE_EXEC_POINTS",
    "TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS",
    "TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT",
    "TD2_BOOT_PROBE_TRACE_WRITE_POINTS",
    "TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS",
    "TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME",
    "TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME",
    "TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR",
    "TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK",
    "TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME",
    "TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME",
    "TD2_BOOT_PROBE_FORCE_1C78",
    "TD2_BOOT_PROBE_FORCE_1C80",
    "TD2_BOOT_PROBE_FORCE_1CA8",
    "TD2_BOOT_PROBE_FORCE_1C86",
    "TD2_BOOT_PROBE_FORCE_1CAC",
    "TD2_BOOT_PROBE_FORCE_1CAE",
    "TD2_BOOT_PROBE_FORCE_1D10",
    "TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run multiple deterministic L001210 probe scenarios and aggregate bank30 candidate hits."
        )
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="project root (default: repo root inferred from this script)",
    )
    parser.add_argument(
        "--rom",
        type=Path,
        default=Path("game.smc"),
        help="ROM path relative to --root unless absolute (default: game.smc)",
    )
    parser.add_argument(
        "--runner",
        type=Path,
        default=Path("validation/run_mesen_probe_boot.sh"),
        help="probe runner script relative to --root unless absolute",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        required=True,
        help="output directory for per-scenario traces and aggregate summary",
    )
    parser.add_argument(
        "--total-frames",
        type=int,
        default=2200,
        help="default total frames per scenario unless scenario overrides it",
    )
    parser.add_argument(
        "--timeout-seconds",
        type=int,
        default=90,
        help="default MESEN timeout seconds unless scenario overrides it",
    )
    parser.add_argument(
        "--max-hits",
        type=int,
        default=0,
        help="TD2_BOOT_PROBE_L001210_MAX_HITS value (0 = unlimited)",
    )
    parser.add_argument(
        "--scenarios-json",
        type=Path,
        default=None,
        help="optional JSON file with scenario definitions (list[object])",
    )
    parser.add_argument(
        "--savestate",
        type=Path,
        default=None,
        help="optional savestate path passed to the probe runner",
    )
    return parser.parse_args()


def sanitize_name(value: str) -> str:
    sanitized = re.sub(r"[^a-z0-9]+", "_", value.lower()).strip("_")
    return sanitized or "scenario"


def to_int(value: Any, fallback: int) -> int:
    try:
        return int(value)
    except (TypeError, ValueError):
        return fallback


def default_periodic_windows(total_frames: int) -> str:
    start = 240
    stop = max(start, min(total_frames - 1, 1800))
    step = 120
    parts = [f"{frame}:start" for frame in range(start, stop + 1, step)]
    return ";".join(parts)


def default_scenarios(total_frames: int) -> list[dict[str, Any]]:
    return [
        {"name": "poweron_no_input"},
        {"name": "hold_start_b_240_359", "input_windows": "240-359:start,b"},
        {"name": "pulse_start_240", "input_windows": "240:start"},
        {
            "name": "periodic_start_pulses_240_1800",
            "input_windows": default_periodic_windows(total_frames),
        },
    ]


def load_scenarios(path: Path | None, total_frames: int) -> list[dict[str, Any]]:
    if path is None:
        scenarios = default_scenarios(total_frames)
    else:
        payload = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(payload, list):
            raise ValueError("--scenarios-json must contain a JSON list")
        scenarios = []
        for index, item in enumerate(payload):
            if not isinstance(item, dict):
                raise ValueError(f"scenario at index {index} must be a JSON object")
            scenarios.append(dict(item))

    seen: set[str] = set()
    normalized: list[dict[str, Any]] = []
    for index, scenario in enumerate(scenarios):
        raw_name = str(scenario.get("name", f"scenario_{index + 1}"))
        file_name = sanitize_name(raw_name)
        if file_name in seen:
            raise ValueError(f"duplicate scenario name after sanitization: {raw_name!r}")
        seen.add(file_name)

        item = dict(scenario)
        item["name"] = raw_name
        item["_file_name"] = file_name
        normalized.append(item)

    return normalized


def resolve_path(root: Path, value: Path) -> Path:
    if value.is_absolute():
        return value
    return root / value


def build_env(
    scenario: dict[str, Any],
    base_env: dict[str, str],
    total_frames: int,
    timeout_seconds: int,
    max_hits: int,
) -> tuple[dict[str, str], int]:
    env = dict(base_env)

    for key in INPUT_ENV_KEYS:
        env.pop(key, None)
    for key in EXPERIMENT_ENV_KEYS:
        env.pop(key, None)

    frames = to_int(scenario.get("total_frames"), total_frames)
    timeout = to_int(scenario.get("timeout_seconds"), timeout_seconds)

    env["TD2_BOOT_PROBE_TOTAL_FRAMES"] = str(frames)
    env["TD2_BOOT_PROBE_TRACE_L001210"] = "1"
    env["TD2_BOOT_PROBE_L001210_MAX_HITS"] = str(max_hits)
    env["MESEN_TIMEOUT_SECONDS"] = str(timeout)

    input_windows = scenario.get("input_windows")
    if input_windows not in (None, ""):
        env["TD2_BOOT_PROBE_INPUT_WINDOWS"] = str(input_windows)
    else:
        input_pattern = scenario.get("input_pattern")
        if input_pattern not in (None, ""):
            if isinstance(input_pattern, list):
                env["TD2_BOOT_PROBE_INPUT"] = ",".join(str(part) for part in input_pattern)
            else:
                env["TD2_BOOT_PROBE_INPUT"] = str(input_pattern)
            env["TD2_BOOT_PROBE_INPUT_START_FRAME"] = str(
                to_int(scenario.get("input_start_frame"), -1)
            )
            input_end_frame = to_int(scenario.get("input_end_frame"), -1)
            if input_end_frame >= 0:
                env["TD2_BOOT_PROBE_INPUT_END_FRAME"] = str(input_end_frame)

    extra_env = scenario.get("extra_env")
    if isinstance(extra_env, dict):
        for key, value in extra_env.items():
            env[str(key)] = str(value)

    return env, frames


def summarize_bank30_candidates(payload: dict[str, Any]) -> list[dict[str, Any]]:
    known_sources = payload.get("known_sources", [])
    hits = payload.get("hits", [])

    by_source: dict[int, dict[str, Any]] = {}
    for hit in hits:
        source_linear = to_int(hit.get("source_linear"), 0)
        if source_linear <= 0:
            continue
        source = by_source.setdefault(
            source_linear,
            {"hit_count": 0, "first_frame": None, "last_frame": None},
        )
        source["hit_count"] += 1
        frame = to_int(hit.get("frame"), -1)
        if source["first_frame"] is None or frame < source["first_frame"]:
            source["first_frame"] = frame
        if source["last_frame"] is None or frame > source["last_frame"]:
            source["last_frame"] = frame

    rows: list[dict[str, Any]] = []
    for item in known_sources:
        source_linear = to_int(item.get("source_linear"), 0)
        bank = (source_linear >> 16) & 0xFF
        if bank != 0x1E:
            continue
        observed = by_source.get(source_linear, {})
        rows.append(
            {
                "id": item.get("id"),
                "source_linear": source_linear,
                "source_snes": item.get("source_snes", ""),
                "marker": item.get("marker"),
                "provenance": item.get("provenance"),
                "hit_count": to_int(observed.get("hit_count"), 0),
                "first_frame": observed.get("first_frame"),
                "last_frame": observed.get("last_frame"),
            }
        )

    rows.sort(key=lambda row: row["source_linear"])
    return rows


def write_markdown_summary(
    path: Path,
    scenarios: list[dict[str, Any]],
    candidate_order: list[str],
    candidate_matrix: dict[str, dict[str, int]],
) -> None:
    lines: list[str] = []
    lines.append("# L001210 Probe Matrix")
    lines.append("")
    lines.append(f"- scenarios: `{len(scenarios)}`")
    lines.append("")
    lines.append("## Scenario Summary")
    lines.append("")
    lines.append("| Scenario | Frames | Total hits | Bank30 hits |")
    lines.append("|---|---:|---:|---:|")
    for row in scenarios:
        lines.append(
            f"| `{row['name']}` | `{row['total_frames']}` | `{row['total_hits']}` | `{row['bank30_hits']}` |"
        )

    lines.append("")
    lines.append("## Bank30 Candidate Hit Matrix")
    lines.append("")
    header = "| Candidate | " + " | ".join(f"`{row['name']}`" for row in scenarios) + " |"
    separator = "|" + "---|" * (len(scenarios) + 1)
    lines.append(header)
    lines.append(separator)
    for snes in candidate_order:
        counts = [str(candidate_matrix.get(snes, {}).get(row["name"], 0)) for row in scenarios]
        lines.append(f"| `{snes}` | " + " | ".join(counts) + " |")

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    root = args.root.resolve()
    rom_path = resolve_path(root, args.rom)
    runner_path = resolve_path(root, args.runner)
    out_dir = resolve_path(root, args.out_dir)
    trace_path = root / ".mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json"
    probe_path = root / ".mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.json"

    if not rom_path.is_file():
        raise FileNotFoundError(f"ROM not found: {rom_path}")
    if not runner_path.is_file():
        raise FileNotFoundError(f"runner script not found: {runner_path}")
    if args.savestate is not None:
        savestate_path = resolve_path(root, args.savestate)
        if not savestate_path.is_file():
            raise FileNotFoundError(f"savestate not found: {savestate_path}")
    else:
        savestate_path = None

    scenarios = load_scenarios(args.scenarios_json, args.total_frames)
    out_dir.mkdir(parents=True, exist_ok=True)

    scenario_rows: list[dict[str, Any]] = []
    all_candidates: dict[str, dict[str, int]] = {}

    for scenario in scenarios:
        env, scenario_frames = build_env(
            scenario,
            os.environ,
            args.total_frames,
            args.timeout_seconds,
            args.max_hits,
        )

        cmd = [str(runner_path), str(rom_path)]
        if savestate_path is not None:
            cmd.append(str(savestate_path))

        print(
            f"[{scenario['name']}] frames={scenario_frames} "
            f"timeout={env['MESEN_TIMEOUT_SECONDS']} input_windows={env.get('TD2_BOOT_PROBE_INPUT_WINDOWS', '')}"
        )
        subprocess.run(cmd, cwd=root, env=env, check=True)

        if not trace_path.is_file():
            raise FileNotFoundError(f"expected probe trace not found: {trace_path}")
        payload = json.loads(trace_path.read_text(encoding="utf-8"))

        scenario_trace_path = out_dir / f"{scenario['_file_name']}_l001210_exec.json"
        scenario_trace_path.write_text(
            json.dumps(payload, indent=2) + "\n", encoding="utf-8"
        )
        scenario_probe_path_rel: str | None = None
        if probe_path.is_file():
            scenario_probe_path = out_dir / f"{scenario['_file_name']}_probe.json"
            scenario_probe_path.write_text(probe_path.read_text(encoding="utf-8"), encoding="utf-8")
            scenario_probe_path_rel = str(scenario_probe_path.relative_to(root))

        candidates = summarize_bank30_candidates(payload)
        bank30_hits = sum(to_int(item.get("hit_count"), 0) for item in candidates)

        scenario_summary = {
            "name": scenario["name"],
            "file_name": scenario["_file_name"],
            "total_frames": scenario_frames,
            "total_hits": len(payload.get("hits", [])),
            "bank30_hits": bank30_hits,
            "bank30_candidates": candidates,
            "trace_json": str(scenario_trace_path.relative_to(root)),
            "probe_json": scenario_probe_path_rel,
        }
        scenario_rows.append(scenario_summary)

        scenario_summary_path = out_dir / f"{scenario['_file_name']}_summary.json"
        scenario_summary_path.write_text(
            json.dumps(scenario_summary, indent=2) + "\n", encoding="utf-8"
        )

        for candidate in candidates:
            snes = str(candidate.get("source_snes", ""))
            if snes == "":
                continue
            all_candidates.setdefault(snes, {})[scenario["name"]] = to_int(
                candidate.get("hit_count"), 0
            )

    candidate_order = sorted(all_candidates.keys())
    matrix_summary = {
        "total_scenarios": len(scenario_rows),
        "scenarios": scenario_rows,
        "candidate_order": candidate_order,
        "candidate_hit_matrix": all_candidates,
    }

    matrix_json_path = out_dir / "matrix_summary.json"
    matrix_json_path.write_text(json.dumps(matrix_summary, indent=2) + "\n", encoding="utf-8")
    matrix_md_path = out_dir / "matrix_summary.md"
    write_markdown_summary(matrix_md_path, scenario_rows, candidate_order, all_candidates)

    print(f"wrote: {matrix_json_path}")
    print(f"wrote: {matrix_md_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
