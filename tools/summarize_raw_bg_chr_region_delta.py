#!/usr/bin/env python3
"""Summarize full CHR region deltas for one BG layer across two raw frame dumps."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


VRAM_BYTES = 0x10000


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize the full CHR-region byte delta for one BG layer using "
            "raw vram.bin + ppu_state.json dumps."
        )
    )
    parser.add_argument("reference_vram", type=Path, help="reference vram.bin path")
    parser.add_argument("reference_ppu_state", type=Path, help="reference ppu_state.json path")
    parser.add_argument("comparison_vram", type=Path, help="comparison vram.bin path")
    parser.add_argument("comparison_ppu_state", type=Path, help="comparison ppu_state.json path")
    parser.add_argument("output_json", type=Path, help="output JSON path")
    parser.add_argument(
        "--layer",
        default="bg2",
        choices=("bg1", "bg2", "bg3", "bg4"),
        help="layer to compare (default: %(default)s)",
    )
    parser.add_argument(
        "--region-size",
        type=lambda value: int(value, 0),
        default=None,
        help="override region size in bytes (default: infer from next chrAddress or VRAM end)",
    )
    parser.add_argument(
        "--sample-limit",
        type=int,
        default=32,
        help="maximum number of changed ranges kept in the sample list (default: %(default)s)",
    )
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown summary output path")
    return parser.parse_args()


def load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def layer_index(layer_name: str) -> int:
    return int(layer_name.removeprefix("bg")) - 1


def load_raw_frame(vram_path: Path, ppu_state_path: Path, layer_name: str) -> dict[str, Any]:
    if not vram_path.is_file():
        raise SystemExit(f"error: vram dump not found: {vram_path}")
    if not ppu_state_path.is_file():
        raise SystemExit(f"error: ppu state JSON not found: {ppu_state_path}")

    ppu_state = load_json(ppu_state_path)
    layer_idx = layer_index(layer_name)
    layer_chr = int(ppu_state.get(f"ppu.layers[{layer_idx}].chrAddress", 0))
    chr_addresses = sorted(
        {
            int(ppu_state.get(f"ppu.layers[{idx}].chrAddress", 0))
            for idx in range(4)
            if int(ppu_state.get(f"ppu.layers[{idx}].chrAddress", 0)) > 0
        }
    )
    next_chr = next((addr for addr in chr_addresses if addr > layer_chr), VRAM_BYTES)
    inferred_size = max(0, min(VRAM_BYTES, next_chr) - layer_chr)

    return {
        "vram_path": vram_path.resolve(),
        "ppu_state_path": ppu_state_path.resolve(),
        "vram": vram_path.read_bytes(),
        "frame_number": int(ppu_state.get("frame", -1)),
        "layer_index": layer_idx,
        "layer_name": layer_name,
        "chr_address": layer_chr,
        "inferred_region_size": inferred_size,
        "chr_addresses": chr_addresses,
        "ppu_state": ppu_state,
    }


def changed_ranges(reference: bytes, comparison: bytes) -> list[dict[str, int]]:
    ranges: list[dict[str, int]] = []
    start = None

    max_len = min(len(reference), len(comparison))
    for idx in range(max_len):
        if reference[idx] != comparison[idx]:
            if start is None:
                start = idx
        elif start is not None:
            ranges.append({"start": start, "end": idx - 1, "length": idx - start})
            start = None

    if start is not None:
        ranges.append({"start": start, "end": max_len - 1, "length": max_len - start})

    if len(reference) != len(comparison):
        longer_len = max(len(reference), len(comparison))
        if max_len < longer_len:
            ranges.append({"start": max_len, "end": longer_len - 1, "length": longer_len - max_len})

    return ranges


def summarize_region_delta(
    reference_frame: dict[str, Any],
    comparison_frame: dict[str, Any],
    region_size_override: int | None,
    sample_limit: int,
) -> dict[str, Any]:
    ref_start = int(reference_frame["chr_address"])
    cmp_start = int(comparison_frame["chr_address"])
    if ref_start != cmp_start:
        raise SystemExit(
            "error: CHR base mismatch between frames: "
            f"0x{ref_start:04X} vs 0x{cmp_start:04X}"
        )

    region_size = region_size_override
    if region_size is None:
        region_size = min(reference_frame["inferred_region_size"], comparison_frame["inferred_region_size"])
    region_size = max(0, min(region_size, VRAM_BYTES - ref_start))

    ref_region = reference_frame["vram"][ref_start : ref_start + region_size]
    cmp_region = comparison_frame["vram"][cmp_start : cmp_start + region_size]

    byte_diff_count = sum(1 for a, b in zip(ref_region, cmp_region) if a != b)
    ranges = changed_ranges(ref_region, cmp_region)

    return {
        "schema": "td2.raw_bg_chr_region_delta.v1",
        "reference": {
            "vramPath": str(reference_frame["vram_path"]),
            "ppuStatePath": str(reference_frame["ppu_state_path"]),
            "frameNumber": reference_frame["frame_number"],
        },
        "comparison": {
            "vramPath": str(comparison_frame["vram_path"]),
            "ppuStatePath": str(comparison_frame["ppu_state_path"]),
            "frameNumber": comparison_frame["frame_number"],
        },
        "layer": {
            "name": reference_frame["layer_name"],
            "chrAddress": ref_start,
            "referenceInferredRegionSize": reference_frame["inferred_region_size"],
            "comparisonInferredRegionSize": comparison_frame["inferred_region_size"],
            "regionSize": region_size,
            "regionOverrideApplied": region_size_override is not None,
            "chrAddresses": reference_frame["chr_addresses"],
        },
        "summary": {
            "changedByteCount": byte_diff_count,
            "unchangedByteCount": region_size - byte_diff_count,
            "changedRangeCount": len(ranges),
            "changedByteFraction": (byte_diff_count / region_size) if region_size else 0.0,
            "firstChangedOffset": ranges[0]["start"] if ranges else None,
            "lastChangedOffset": ranges[-1]["end"] if ranges else None,
        },
        "sampleChangedRanges": ranges[:sample_limit],
    }


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    layer = payload["layer"]
    summary = payload["summary"]
    lines = [
        "# Raw BG CHR Region Delta",
        "",
        f"- Reference frame: `{payload['reference']['frameNumber']}`",
        f"- Comparison frame: `{payload['comparison']['frameNumber']}`",
        f"- Layer: `{layer['name']}`",
        f"- CHR base: `0x{layer['chrAddress']:04X}`",
        f"- Inferred sizes: `{layer['referenceInferredRegionSize']}` / `{layer['comparisonInferredRegionSize']}`",
        f"- Region size used: `{layer['regionSize']}`",
        f"- Changed bytes: `{summary['changedByteCount']}`",
        f"- Changed ranges: `{summary['changedRangeCount']}`",
        f"- First changed offset: `{summary['firstChangedOffset']}`",
        f"- Last changed offset: `{summary['lastChangedOffset']}`",
        "",
        "## Sample Changed Ranges",
        "",
    ]
    if not payload["sampleChangedRanges"]:
        lines.append("- none")
    else:
        for row in payload["sampleChangedRanges"]:
            lines.append(
                "- "
                f"offsets `0x{row['start']:04X}..0x{row['end']:04X}` "
                f"(length `{row['length']}`)"
            )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    reference_frame = load_raw_frame(args.reference_vram, args.reference_ppu_state, args.layer)
    comparison_frame = load_raw_frame(args.comparison_vram, args.comparison_ppu_state, args.layer)
    payload = summarize_region_delta(reference_frame, comparison_frame, args.region_size, args.sample_limit)
    write_json(args.output_json, payload)
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, payload)


if __name__ == "__main__":
    main()
