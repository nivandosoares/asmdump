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
            "Capture a visible-scanline Mode 7 sample for each frame in a range by "
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
        "--output",
        type=Path,
        required=True,
        help="output JSON path for the aggregated samples",
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
        default=1,
        help="TD2_SCANLINE_TEST_MAX_SAMPLES value for each sampled frame (default: %(default)s)",
    )
    return parser.parse_args()


def run_frame_sample(root: Path, rom: Path, frame: int, timeout_seconds: int, max_samples: int) -> dict[str, object]:
    env = os.environ.copy()
    env["MESEN_TIMEOUT_SECONDS"] = str(timeout_seconds)
    env["TD2_SCANLINE_TEST_TARGET_FRAME"] = str(frame)
    env["TD2_SCANLINE_TEST_MAX_SAMPLES"] = str(max_samples)
    subprocess.run(
        [
            "./validation/run_mesen_capture.sh",
            str(rom),
            "./validation/mesen_scanline_step_test.lua",
        ],
        cwd=root,
        env=env,
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    return env


def main() -> int:
    args = parse_args()
    root = Path(__file__).resolve().parents[1]
    rom_path = args.rom if args.rom.is_absolute() else (root / args.rom)
    output_path = args.output if args.output.is_absolute() else (root / args.output)
    script_output = args.script_output if args.script_output.is_absolute() else (root / args.script_output)
    samples: list[dict[str, object]] = []

    if args.end_frame < args.start_frame:
        raise SystemExit("error: end_frame must be >= start_frame")

    for frame in range(args.start_frame, args.end_frame + 1):
        run_frame_sample(root, rom_path, frame, args.timeout_seconds, args.max_samples)
        payload = json.loads(script_output.read_text(encoding="utf-8"))
        frame_samples = payload.get("samples", [])
        if not frame_samples:
            raise SystemExit(f"error: no scanline samples captured for frame {frame}")
        sample = dict(frame_samples[0])
        samples.append(sample)
        print(
            f"frame {frame}: scanline={sample.get('scanline')} "
            f"m7a={sample.get('m7a')} m7d={sample.get('m7d')}"
        )

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(
        json.dumps(
            {
                "start_frame": args.start_frame,
                "end_frame": args.end_frame,
                "samples": samples,
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )
    print(f"wrote visible Mode 7 samples -> {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
