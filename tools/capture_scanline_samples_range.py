#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import os
import subprocess
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Capture full per-scanline samples for each frame in a range by "
            "reusing validation/mesen_scanline_step_test.lua."
        )
    )
    parser.add_argument("start_frame", type=int, help="first frame to sample")
    parser.add_argument("end_frame", type=int, help="last frame to sample (inclusive)")
    parser.add_argument(
        "--rom",
        type=Path,
        default=Path("game.smc"),
        help="ROM path passed to run_mesen_capture.sh (default: %(default)s)",
    )
    parser.add_argument(
        "--savestate",
        type=Path,
        default=None,
        help="optional savestate path passed to run_mesen_capture.sh",
    )
    parser.add_argument(
        "--input",
        default=None,
        help="optional TD2_SCANLINE_TEST_INPUT pattern",
    )
    parser.add_argument(
        "--input-start-frame",
        type=int,
        default=None,
        help="optional TD2_SCANLINE_TEST_INPUT_START_FRAME value",
    )
    parser.add_argument(
        "--input-end-frame",
        type=int,
        default=None,
        help="optional TD2_SCANLINE_TEST_INPUT_END_FRAME value",
    )
    parser.add_argument(
        "--input-windows",
        default=None,
        help="optional TD2_SCANLINE_TEST_INPUT_WINDOWS value",
    )
    parser.add_argument(
        "--timeout-seconds",
        type=int,
        default=60,
        help="MESEN_TIMEOUT_SECONDS value for each sampled frame (default: %(default)s)",
    )
    parser.add_argument(
        "--script-output",
        type=Path,
        default=Path(".mesen-config/Mesen2/LuaScriptData/mesen_scanline_step_test/td2_scanline_step_test.json"),
        help="expected JSON output path from mesen_scanline_step_test.lua",
    )
    parser.add_argument(
        "--max-samples",
        type=int,
        default=224,
        help="TD2_SCANLINE_TEST_MAX_SAMPLES value for each sampled frame (default: %(default)s)",
    )
    parser.add_argument(
        "--trace-exec-points",
        default=None,
        help="optional TD2_SCANLINE_TEST_TRACE_EXEC_POINTS value",
    )
    parser.add_argument(
        "--exec-point-max-hits",
        type=int,
        default=None,
        help="optional TD2_SCANLINE_TEST_EXEC_POINT_MAX_HITS value",
    )
    parser.add_argument(
        "--trace-write-points",
        default=None,
        help="optional TD2_SCANLINE_TEST_TRACE_WRITE_POINTS value",
    )
    parser.add_argument(
        "--write-point-max-hits",
        type=int,
        default=None,
        help="optional TD2_SCANLINE_TEST_WRITE_POINT_MAX_HITS value",
    )
    parser.add_argument(
        "--output",
        type=Path,
        required=True,
        help="output JSON path for the aggregated samples",
    )
    return parser.parse_args()


def run_frame_sample(
    root: Path,
    rom: Path,
    savestate: Path | None,
    frame: int,
    timeout_seconds: int,
    max_samples: int,
    input_pattern: str | None,
    input_start_frame: int | None,
    input_end_frame: int | None,
    input_windows: str | None,
    trace_exec_points: str | None,
    exec_point_max_hits: int | None,
    trace_write_points: str | None,
    write_point_max_hits: int | None,
) -> None:
    env = os.environ.copy()
    env["MESEN_TIMEOUT_SECONDS"] = str(timeout_seconds)
    env["TD2_SCANLINE_TEST_TARGET_FRAME"] = str(frame)
    env["TD2_SCANLINE_TEST_MAX_SAMPLES"] = str(max_samples)

    if input_pattern is not None:
        env["TD2_SCANLINE_TEST_INPUT"] = input_pattern
    if input_start_frame is not None:
        env["TD2_SCANLINE_TEST_INPUT_START_FRAME"] = str(input_start_frame)
    if input_end_frame is not None:
        env["TD2_SCANLINE_TEST_INPUT_END_FRAME"] = str(input_end_frame)
    if input_windows is not None:
        env["TD2_SCANLINE_TEST_INPUT_WINDOWS"] = input_windows
    if trace_exec_points is not None:
        env["TD2_SCANLINE_TEST_TRACE_EXEC_POINTS"] = trace_exec_points
    if exec_point_max_hits is not None:
        env["TD2_SCANLINE_TEST_EXEC_POINT_MAX_HITS"] = str(exec_point_max_hits)
    if trace_write_points is not None:
        env["TD2_SCANLINE_TEST_TRACE_WRITE_POINTS"] = trace_write_points
    if write_point_max_hits is not None:
        env["TD2_SCANLINE_TEST_WRITE_POINT_MAX_HITS"] = str(write_point_max_hits)

    cmd = [
        "./validation/run_mesen_capture.sh",
        str(rom),
        "./validation/mesen_scanline_step_test.lua",
    ]
    if savestate is not None:
        cmd.append(str(savestate))

    subprocess.run(
        cmd,
        cwd=root,
        env=env,
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )


def main() -> int:
    args = parse_args()
    root = Path(__file__).resolve().parents[1]
    rom_path = args.rom if args.rom.is_absolute() else (root / args.rom)
    output_path = args.output if args.output.is_absolute() else (root / args.output)
    script_output = args.script_output if args.script_output.is_absolute() else (root / args.script_output)
    savestate_path = None
    if args.savestate is not None:
        savestate_path = args.savestate if args.savestate.is_absolute() else (root / args.savestate)
    frames: list[dict[str, object]] = []

    if args.end_frame < args.start_frame:
        raise SystemExit("error: end_frame must be >= start_frame")

    for frame in range(args.start_frame, args.end_frame + 1):
        run_frame_sample(
            root=root,
            rom=rom_path,
            savestate=savestate_path,
            frame=frame,
            timeout_seconds=args.timeout_seconds,
            max_samples=args.max_samples,
            input_pattern=args.input,
            input_start_frame=args.input_start_frame,
            input_end_frame=args.input_end_frame,
            input_windows=args.input_windows,
            trace_exec_points=args.trace_exec_points,
            exec_point_max_hits=args.exec_point_max_hits,
            trace_write_points=args.trace_write_points,
            write_point_max_hits=args.write_point_max_hits,
        )
        payload = json.loads(script_output.read_text(encoding="utf-8"))
        samples = payload.get("samples", [])
        if not samples:
            raise SystemExit(f"error: no scanline samples captured for frame {frame}")
        frame_entry = {
            "target_frame": payload.get("target_frame", frame),
            "sample_count": len(samples),
            "samples": samples,
        }
        for key in (
            "frame_events",
            "trace_exec_points",
            "exec_point_max_hits",
            "exec_point_hits",
            "exec_point_dropped_hits",
            "trace_write_points",
            "write_point_max_hits",
            "write_point_hits",
            "write_point_dropped_hits",
        ):
            if key in payload:
                frame_entry[key] = payload.get(key)
        frames.append(frame_entry)
        first = samples[0]
        last = samples[-1]
        print(
            f"frame {frame}: samples={len(samples)} "
            f"first_scanline={first.get('scanline')} last_scanline={last.get('scanline')} "
            f"bg1_vscroll={first.get('bg1_vscroll')}->{last.get('bg1_vscroll')}"
        )

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(
        json.dumps(
            {
                "start_frame": args.start_frame,
                "end_frame": args.end_frame,
                "max_samples": args.max_samples,
                "savestate": str(savestate_path) if savestate_path is not None else None,
                "input": args.input,
                "input_start_frame": args.input_start_frame,
                "input_end_frame": args.input_end_frame,
                "input_windows": args.input_windows,
                "trace_exec_points": args.trace_exec_points,
                "exec_point_max_hits": args.exec_point_max_hits,
                "trace_write_points": args.trace_write_points,
                "write_point_max_hits": args.write_point_max_hits,
                "frames": frames,
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )
    print(f"wrote scanline samples -> {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
