#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from compare_frames import compare_images, load_image


DEFAULT_PPU_KEYS = (
    "ppu.forcedBlank",
    "ppu.bgMode",
    "ppu.mainScreenLayers",
    "ppu.oamBaseAddress",
    "ppu.oamMode",
    "ppu.mode7.centerX",
    "ppu.mode7.centerY",
    "ppu.mode7.matrix[0]",
    "ppu.mode7.matrix[1]",
    "ppu.mode7.matrix[2]",
    "ppu.mode7.matrix[3]",
    "ppu.mode7.largeMap",
)


DEFAULT_PROBE_KEYS = (
    "active_main_callback_addr",
    "active_main_callback_bank",
    "active_nmi_callback_addr",
    "active_nmi_callback_bank",
    "active_irq_callback_addr",
    "active_irq_callback_bank",
    "state_0990",
    "state_09a8",
    "state_0200",
    "state_0202",
    "state_0204",
    "state_0206",
    "state_0208",
    "state_020a",
    "state_0400",
    "state_0402",
    "state_0404",
    "state_0405",
    "state_0406",
    "state_0408",
    "state_040a",
    "state_0440",
    "state_0442",
    "state_0444",
    "state_1e2c",
    "dp_0020",
    "dp_0000",
    "dp_0004",
    "dp_0008",
    "dp_000c",
    "dp_0010",
    "dp_0011",
    "dp_0012",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Analyze binary/PPU/probe deltas between two extracted frame prefixes.")
    parser.add_argument("prefix_a", type=Path, help="frame A prefix, without suffixes")
    parser.add_argument("prefix_b", type=Path, help="frame B prefix, without suffixes")
    parser.add_argument("output_json", type=Path, help="output JSON path")
    parser.add_argument("--probe-json-a", type=Path, default=None, help="optional probe JSON containing frame A")
    parser.add_argument("--probe-json-b", type=Path, default=None, help="optional probe JSON containing frame B")
    parser.add_argument("--probe-frame-a", type=int, default=None, help="explicit probe frame number for A")
    parser.add_argument("--probe-frame-b", type=int, default=None, help="explicit probe frame number for B")
    return parser.parse_args()


def infer_frame_number(prefix: Path) -> int | None:
    digits = ""
    for char in reversed(prefix.name):
        if char.isdigit():
            digits = char + digits
        elif digits:
            break
    return int(digits) if digits else None


def load_binary(path: Path) -> bytes | None:
    return path.read_bytes() if path.exists() else None


def summarize_binary_delta(a: bytes, b: bytes) -> dict:
    if len(a) != len(b):
        raise ValueError(f"binary size mismatch: {len(a)} vs {len(b)}")

    diff_indices = [index for index, (left, right) in enumerate(zip(a, b)) if left != right]
    runs: list[dict[str, int]] = []
    if diff_indices:
        start = prev = diff_indices[0]
        for index in diff_indices[1:]:
            if index == prev + 1:
                prev = index
                continue
            runs.append({"start": start, "end": prev, "length": prev - start + 1})
            start = prev = index
        runs.append({"start": start, "end": prev, "length": prev - start + 1})

    even_count = sum(1 for index in diff_indices if (index & 1) == 0)
    odd_count = len(diff_indices) - even_count
    return {
        "size_bytes": len(a),
        "diff_bytes": len(diff_indices),
        "diff_ratio": (len(diff_indices) / len(a)) if a else 0.0,
        "even_byte_diffs": even_count,
        "odd_byte_diffs": odd_count,
        "first_runs": runs[:32],
    }


def summarize_image_delta(path_a: Path, path_b: Path) -> dict:
    width_a, height_a, pixels_a = load_image(path_a)
    width_b, height_b, pixels_b = load_image(path_b)
    if (width_a, height_a) != (width_b, height_b):
        raise ValueError(f"image size mismatch: {width_a}x{height_a} vs {width_b}x{height_b}")
    result = compare_images(pixels_a, pixels_b)
    return {
        "width": width_a,
        "height": height_a,
        "pixel_count": result["pixel_count"],
        "mismatch_pixels": result["mismatch_pixels"],
        "mismatch_ratio": (result["mismatch_pixels"] / result["pixel_count"]) if result["pixel_count"] else 0.0,
        "max_channel_diff": result["max_channel_diff"],
        "mean_abs_channel_diff": result["mean_abs_channel_diff"],
        "rmse": result["rmse"],
    }


def summarize_state_delta(state_a: dict, state_b: dict, keys: tuple[str, ...]) -> dict[str, dict[str, object]]:
    changes: dict[str, dict[str, object]] = {}
    for key in keys:
        left = state_a.get(key)
        right = state_b.get(key)
        if left != right:
            changes[key] = {"a": left, "b": right}
    return changes


def load_probe_entry(path: Path | None, frame: int | None) -> dict | None:
    if path is None or frame is None or not path.exists():
        return None
    data = json.loads(path.read_text(encoding="utf-8"))
    for entry in data.get("frames", []):
        if entry.get("frame") == frame:
            return entry
    raise ValueError(f"frame {frame} not found in probe log {path}")


def load_json(path: Path) -> dict | None:
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else None


def main() -> int:
    args = parse_args()

    frame_a = args.probe_frame_a if args.probe_frame_a is not None else infer_frame_number(args.prefix_a)
    frame_b = args.probe_frame_b if args.probe_frame_b is not None else infer_frame_number(args.prefix_b)

    summary = {
        "prefix_a": str(args.prefix_a),
        "prefix_b": str(args.prefix_b),
        "frame_a": frame_a,
        "frame_b": frame_b,
    }

    vram_a = load_binary(args.prefix_a.with_name(args.prefix_a.name + "_vram.bin"))
    vram_b = load_binary(args.prefix_b.with_name(args.prefix_b.name + "_vram.bin"))
    cgram_a = load_binary(args.prefix_a.with_name(args.prefix_a.name + "_cgram.bin"))
    cgram_b = load_binary(args.prefix_b.with_name(args.prefix_b.name + "_cgram.bin"))
    oam_a = load_binary(args.prefix_a.with_name(args.prefix_a.name + "_oam.bin"))
    oam_b = load_binary(args.prefix_b.with_name(args.prefix_b.name + "_oam.bin"))
    ppu_a = load_json(args.prefix_a.with_name(args.prefix_a.name + "_ppu_state.json"))
    ppu_b = load_json(args.prefix_b.with_name(args.prefix_b.name + "_ppu_state.json"))
    image_a = args.prefix_a.with_name(args.prefix_a.name + "_frame.png")
    image_b = args.prefix_b.with_name(args.prefix_b.name + "_frame.png")
    probe_a = load_probe_entry(args.probe_json_a, frame_a)
    probe_b = load_probe_entry(args.probe_json_b, frame_b)

    if vram_a is not None and vram_b is not None:
        summary["vram"] = summarize_binary_delta(vram_a, vram_b)
    if cgram_a is not None and cgram_b is not None:
        summary["cgram"] = summarize_binary_delta(cgram_a, cgram_b)
    if oam_a is not None and oam_b is not None:
        summary["oam"] = summarize_binary_delta(oam_a, oam_b)
    if image_a.exists() and image_b.exists():
        summary["frame_image"] = summarize_image_delta(image_a, image_b)
    if ppu_a is not None and ppu_b is not None:
        summary["ppu_state_changes"] = summarize_state_delta(ppu_a, ppu_b, DEFAULT_PPU_KEYS)
    if probe_a is not None and probe_b is not None:
        summary["probe_entry_a"] = {key: probe_a.get(key) for key in DEFAULT_PROBE_KEYS}
        summary["probe_entry_b"] = {key: probe_b.get(key) for key in DEFAULT_PROBE_KEYS}
        summary["probe_changes"] = summarize_state_delta(probe_a, probe_b, DEFAULT_PROBE_KEYS)

    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(f"wrote frame-delta summary -> {args.output_json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
