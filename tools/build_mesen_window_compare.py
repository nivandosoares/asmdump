#!/usr/bin/env python3
"""Build a compare summary for a range of extracted Mesen frame folders."""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from compare_frames import compare_images, load_ppm


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare extracted Mesen frame folders against their visible export "
            "and local renderer output."
        )
    )
    parser.add_argument("out_json", type=Path, help="output JSON summary path")
    parser.add_argument(
        "frame_roots",
        nargs="+",
        type=Path,
        help="one or more directories that contain frame_XXXXX folders",
    )
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown summary path")
    parser.add_argument(
        "--activity-trace-json",
        type=Path,
        default=None,
        help="optional normalized activity-trace JSON used to enrich per-frame rows",
    )
    parser.add_argument(
        "--obj-renderer",
        default="mode7-ppu",
        choices=("simple", "mode7-ppu"),
        help="object compositor to use for renderer-side compares (default: %(default)s)",
    )
    parser.add_argument(
        "--frame-glob",
        default="frame_*",
        help="frame directory glob used under each root (default: %(default)s)",
    )
    parser.add_argument(
        "--mode7-line-bias",
        type=int,
        default=1,
        help="optional per-scanline Y bias passed through to the Mode 7 renderer",
    )
    return parser.parse_args()


def parse_frame_number(path: Path) -> int | None:
    match = re.search(r"(\d+)", path.name)
    if not match:
        return None
    return int(match.group(1))


def load_json(path: Path) -> dict:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def load_activity_lookup(path: Path | None) -> dict[int, dict]:
    if path is None:
        return {}
    payload = load_json(path)
    rows = payload.get("frameActivity")
    if not isinstance(rows, list):
        return {}
    lookup: dict[int, dict] = {}
    for row in rows:
        if not isinstance(row, dict):
            continue
        frame = row.get("frame")
        if isinstance(frame, int):
            lookup[frame] = row
    return lookup


def mismatch_from_buffers(expected: bytes, actual: bytes) -> tuple[int, float]:
    result = compare_images(expected, actual)
    pixels = int(result["pixel_count"])
    mismatches = int(result["mismatch_pixels"])
    ratio = (mismatches / pixels) if pixels else 0.0
    return mismatches, ratio


def analyze_mismatch(expected: bytes, actual: bytes, width: int) -> dict:
    result = compare_images(expected, actual)
    pixels = int(result["pixel_count"])
    mismatches = int(result["mismatch_pixels"])
    ratio = (mismatches / pixels) if pixels else 0.0
    diff_rgb = result["diff_rgb"]
    xs: list[int] = []
    ys: list[int] = []
    mask = bytearray()
    for offset in range(0, len(diff_rgb), 3):
        pixel_index = offset // 3
        x = pixel_index % width
        y = pixel_index // width
        mismatch = 1 if (diff_rgb[offset] or diff_rgb[offset + 1] or diff_rgb[offset + 2]) else 0
        mask.append(mismatch)
        if mismatch:
            xs.append(x)
            ys.append(y)
    bbox = None
    if xs and ys:
        bbox = {
            "x0": min(xs),
            "y0": min(ys),
            "x1": max(xs),
            "y1": max(ys),
        }
    return {
        "mismatchPixels": mismatches,
        "mismatchRatio": ratio,
        "bbox": bbox,
        "maskSha1": hashlib.sha1(bytes(mask)).hexdigest(),
        "diffSha1": hashlib.sha1(diff_rgb).hexdigest(),
    }


def sha1_file(path: Path | None) -> str | None:
    if path is None or not path.is_file():
        return None
    return hashlib.sha1(path.read_bytes()).hexdigest()


def crop_ppm_rows(path: Path, row_start: int, height: int) -> tuple[int, int, bytes]:
    width, full_height, pixels = load_ppm(path)
    if row_start < 0 or height < 0 or (row_start + height) > full_height:
        raise ValueError(f"crop {row_start}:{row_start + height} is out of bounds for {path} ({full_height} rows)")
    row_bytes = width * 3
    start = row_start * row_bytes
    end = start + (height * row_bytes)
    return width, height, pixels[start:end]


def render_frame(
    render_script: Path,
    frame_dir: Path,
    state_path: Path,
    out_path: Path,
    obj_renderer: str,
    mode7_line_bias: int = 1,
) -> None:
    cmd = [
        sys.executable,
        str(render_script),
        str(frame_dir / "vram.bin"),
        str(frame_dir / "cgram.bin"),
        str(state_path),
        str(out_path),
        "--obj-renderer",
        obj_renderer,
        "--mode7-line-bias",
        str(mode7_line_bias),
    ]
    oam_path = frame_dir / "oam.bin"
    if oam_path.is_file():
        cmd.extend(["--oam", str(oam_path)])
    subprocess.run(cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)


def collect_frame_dirs(frame_roots: list[Path], frame_glob: str) -> list[Path]:
    frame_dirs: dict[int, Path] = {}
    for root in frame_roots:
        resolved_root = root.resolve()
        for path in resolved_root.glob(frame_glob):
            if not path.is_dir():
                continue
            frame = parse_frame_number(path)
            if frame is None:
                continue
            frame_dirs[frame] = path
    return [frame_dirs[frame] for frame in sorted(frame_dirs)]


def collapse_value_ranges(rows: list[dict], key: str) -> list[dict]:
    values = [row for row in rows if row.get(key) is not None]
    if not values:
        return []

    ranges: list[dict] = []
    current = values[0][key]
    start = values[0]["frame"]
    end = values[0]["frame"]
    for row in values[1:]:
        frame = row["frame"]
        value = row[key]
        if value == current and frame == end + 1:
            end = frame
            continue
        ranges.append({"value": current, "startFrame": start, "endFrame": end})
        current = value
        start = frame
        end = frame
    ranges.append({"value": current, "startFrame": start, "endFrame": end})
    return ranges


def normalize_bbox_key(value: object) -> str | None:
    if not isinstance(value, dict):
        return None
    x0 = value.get("x0")
    y0 = value.get("y0")
    x1 = value.get("x1")
    y1 = value.get("y1")
    if not all(isinstance(item, int) for item in (x0, y0, x1, y1)):
        return None
    return f"{x0},{y0},{x1},{y1}"


def format_ratio(value: float | None) -> str:
    if value is None:
        return "n/a"
    return f"{value:.6%}"


def summarize_metric(rows: list[dict], key: str) -> dict:
    values = [row[key] for row in rows]
    return {
        "min": min(values),
        "max": max(values),
        "ranges": collapse_value_ranges(rows, key),
    }


def summarize_optional_metric(rows: list[dict], key: str) -> dict:
    filtered_rows = [row for row in rows if row.get(key) is not None]
    if not filtered_rows:
        return {
            "min": None,
            "max": None,
            "ranges": [],
        }
    values = [row[key] for row in filtered_rows]
    return {
        "min": min(values),
        "max": max(values),
        "ranges": collapse_value_ranges(filtered_rows, key),
    }


def render_markdown(summary: dict) -> str:
    frame_rows = summary.get("frames", [])
    visible_render_summary = summary.get("visibleRenderMismatch", {})
    visible_render_min = visible_render_summary.get("min")
    visible_render_max = visible_render_summary.get("max")
    if visible_render_min is None or visible_render_max is None:
        visible_render_text = "`n/a`"
    else:
        visible_render_text = f"`{visible_render_min}..{visible_render_max}`"
    lines = [
        f"# {summary.get('title', 'Mesen window compare summary')}",
        "",
        "## Window",
        "",
        f"- frame range: `{summary['frameRange']['start']}..{summary['frameRange']['end']}`",
        f"- frame count: `{summary['frameRange']['count']}`",
        f"- roots: {', '.join(f'`{root}`' for root in summary.get('sourceFrameRoots', []))}",
        "",
        "## Summary",
        "",
        f"- top-crop mismatches: `{summary['topCropMismatch']['min']}..{summary['topCropMismatch']['max']}`",
        f"- bottom-crop mismatches: `{summary['bottomCropMismatch']['min']}..{summary['bottomCropMismatch']['max']}`",
        f"- base-render mismatches vs `main_visible.ppm`: `{summary['baseRenderMismatch']['min']}..{summary['baseRenderMismatch']['max']}`",
        f"- visible-state render mismatches vs `main_visible.ppm`: {visible_render_text}",
    ]

    activity = summary.get("activitySummary", {})
    if activity:
        lines.extend(
            [
                f"- activity main callbacks: {', '.join(f'`{value}`' for value in activity.get('distinctMainCallbacks', [])) or '`none`'}",
                f"- frames with DMA: {', '.join(str(frame) for frame in activity.get('framesWithDma', [])) or 'none'}",
                f"- frames without DMA: {', '.join(str(frame) for frame in activity.get('framesWithoutDma', [])) or 'none'}",
            ]
        )

    lines.extend(
        [
            "",
            "## Per-frame rows",
            "",
            "| frame | main callback | top crop | bottom crop | base render | visible render | dma | mode7 events | mode7 writes |",
            "|---|---|---:|---:|---:|---:|---:|---:|---:|",
        ]
    )
    for row in frame_rows:
        lines.append(
            "| "
            + " | ".join(
                [
                    str(row.get("frame")),
                    str(row.get("activityMainCallbackSnes") or "n/a"),
                    str(row.get("topCropMismatch")),
                    str(row.get("bottomCropMismatch")),
                    str(row.get("baseRenderMismatch")),
                    str(row.get("visibleRenderMismatch")),
                    str(row.get("activityDmaEventCount")),
                    str(row.get("activityMode7EventCount")),
                    str(row.get("activityMode7WriteCount")),
                ]
            )
            + " |"
        )
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    out_json = args.out_json.resolve()
    frame_dirs = collect_frame_dirs(args.frame_roots, args.frame_glob)
    if not frame_dirs:
        raise SystemExit("error: no frame directories matched")

    render_script = Path(__file__).with_name("render_mesen_snes_bg.py").resolve()
    activity_lookup = load_activity_lookup(args.activity_trace_json.resolve() if args.activity_trace_json else None)

    rows: list[dict] = []
    with tempfile.TemporaryDirectory(prefix="mesen-window-compare-") as temp_root_raw:
        temp_root = Path(temp_root_raw)
        for frame_dir in frame_dirs:
            frame = parse_frame_number(frame_dir)
            if frame is None:
                continue

            main_path = frame_dir / "main.ppm"
            visible_path = frame_dir / "main_visible.ppm"
            state_path = frame_dir / "ppu_state.json"
            visible_state_path = frame_dir / "ppu_state_visible.json"
            vram_path = frame_dir / "vram.bin"
            cgram_path = frame_dir / "cgram.bin"
            oam_path = frame_dir / "oam.bin"

            main_width, main_height, _ = load_ppm(main_path)
            visible_width, visible_height, visible_pixels = load_ppm(visible_path)
            _, _, main_top_pixels = crop_ppm_rows(main_path, 0, visible_height)
            _, _, main_bottom_pixels = crop_ppm_rows(main_path, main_height - visible_height, visible_height)

            top_crop_mismatch, top_crop_ratio = mismatch_from_buffers(main_top_pixels, visible_pixels)
            bottom_crop_mismatch, bottom_crop_ratio = mismatch_from_buffers(main_bottom_pixels, visible_pixels)

            base_render_path = temp_root / f"frame_{frame:05d}_base.ppm"
            render_frame(
                render_script,
                frame_dir,
                state_path,
                base_render_path,
                args.obj_renderer,
                args.mode7_line_bias,
            )
            _, _, base_render_pixels = load_ppm(base_render_path)
            base_render_analysis = analyze_mismatch(visible_pixels, base_render_pixels, visible_width)
            base_render_mismatch = base_render_analysis["mismatchPixels"]
            base_render_ratio = base_render_analysis["mismatchRatio"]

            visible_render_mismatch = None
            visible_render_ratio = None
            visible_state_matrix0 = None
            visible_state_matrix3 = None
            if visible_state_path.is_file():
                visible_render_path = temp_root / f"frame_{frame:05d}_visible.ppm"
                render_frame(
                    render_script,
                    frame_dir,
                    visible_state_path,
                    visible_render_path,
                    args.obj_renderer,
                    args.mode7_line_bias,
                )
                _, _, visible_render_pixels = load_ppm(visible_render_path)
                visible_render_mismatch, visible_render_ratio = mismatch_from_buffers(visible_pixels, visible_render_pixels)
                visible_state_json = load_json(visible_state_path)
                visible_state_matrix0 = visible_state_json.get("ppu.mode7.matrix[0]")
                visible_state_matrix3 = visible_state_json.get("ppu.mode7.matrix[3]")

            state_json = load_json(state_path)
            activity = activity_lookup.get(frame, {})

            rows.append(
                {
                    "frame": frame,
                    "frameDir": str(frame_dir),
                    "mainVisibleSha1": sha1_file(visible_path),
                    "vramSha1": sha1_file(vram_path),
                    "cgramSha1": sha1_file(cgram_path),
                    "oamSha1": sha1_file(oam_path),
                    "ppuStateSha1": sha1_file(state_path),
                    "mainSize": {"width": main_width, "height": main_height},
                    "visibleSize": {"width": visible_width, "height": visible_height},
                    "topCropMismatch": top_crop_mismatch,
                    "topCropRatio": top_crop_ratio,
                    "bottomCropMismatch": bottom_crop_mismatch,
                    "bottomCropRatio": bottom_crop_ratio,
                    "baseRenderMismatch": base_render_mismatch,
                    "baseRenderRatio": base_render_ratio,
                    "baseRenderDiffBBox": base_render_analysis["bbox"],
                    "baseRenderDiffMaskSha1": base_render_analysis["maskSha1"],
                    "baseRenderDiffSha1": base_render_analysis["diffSha1"],
                    "visibleRenderMismatch": visible_render_mismatch,
                    "visibleRenderRatio": visible_render_ratio,
                    "baseStateMatrix0": state_json.get("ppu.mode7.matrix[0]"),
                    "baseStateMatrix3": state_json.get("ppu.mode7.matrix[3]"),
                    "visibleStateMatrix0": visible_state_matrix0,
                    "visibleStateMatrix3": visible_state_matrix3,
                    "activityMainCallbackSnes": activity.get("activeMainCallbackSnes"),
                    "activityIrqCallbackSnes": activity.get("activeIrqCallbackSnes"),
                    "activityDmaEventCount": activity.get("dmaEventCount", 0),
                    "activityDmaDomains": activity.get("dmaDomains", {}),
                    "activityDirectEventCount": activity.get("directEventCount", 0),
                    "activityMode7EventCount": activity.get("mode7EventCount", 0),
                    "activityMode7WriteCount": activity.get("mode7WriteCount", 0),
                }
            )

    summary = {
        "schema": "td2.mesen_window_compare.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "title": "Post-1093 continuation compare summary",
        "sourceFrameRoots": [str(path.resolve()) for path in args.frame_roots],
        "activityTracePath": str(args.activity_trace_json.resolve()) if args.activity_trace_json else None,
        "frameRange": {
            "start": rows[0]["frame"],
            "end": rows[-1]["frame"],
            "count": len(rows),
        },
        "topCropMismatch": summarize_metric(rows, "topCropMismatch"),
        "bottomCropMismatch": summarize_metric(rows, "bottomCropMismatch"),
        "baseRenderMismatch": summarize_metric(rows, "baseRenderMismatch"),
        "visibleRenderMismatch": summarize_optional_metric(rows, "visibleRenderMismatch"),
        "activitySummary": {
            "distinctMainCallbacks": sorted(
                {
                    row["activityMainCallbackSnes"]
                    for row in rows
                    if isinstance(row.get("activityMainCallbackSnes"), str)
                }
            ),
            "framesWithDma": [row["frame"] for row in rows if row.get("activityDmaEventCount", 0) > 0],
            "framesWithoutDma": [row["frame"] for row in rows if row.get("activityDmaEventCount", 0) == 0],
            "dmaEventCountRanges": collapse_value_ranges(rows, "activityDmaEventCount"),
            "mode7EventCountRanges": collapse_value_ranges(rows, "activityMode7EventCount"),
            "mode7WriteCountRanges": collapse_value_ranges(rows, "activityMode7WriteCount"),
        },
        "baseRenderDiffIdentity": {
            "distinctMaskSha1": sorted({row["baseRenderDiffMaskSha1"] for row in rows}),
            "distinctDiffSha1": sorted({row["baseRenderDiffSha1"] for row in rows}),
            "maskSha1Ranges": collapse_value_ranges(rows, "baseRenderDiffMaskSha1"),
            "diffSha1Ranges": collapse_value_ranges(rows, "baseRenderDiffSha1"),
            "bboxRanges": collapse_value_ranges(
                [
                    {
                        **row,
                        "baseRenderDiffBBoxKey": normalize_bbox_key(row.get("baseRenderDiffBBox")),
                    }
                    for row in rows
                ],
                "baseRenderDiffBBoxKey",
            ),
        },
        "sourceIdentity": {
            "mainVisibleSha1Ranges": collapse_value_ranges(rows, "mainVisibleSha1"),
            "vramSha1Ranges": collapse_value_ranges(rows, "vramSha1"),
            "cgramSha1Ranges": collapse_value_ranges(rows, "cgramSha1"),
            "oamSha1Ranges": collapse_value_ranges(rows, "oamSha1"),
            "ppuStateSha1Ranges": collapse_value_ranges(rows, "ppuStateSha1"),
        },
        "frames": rows,
    }

    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.resolve().write_text(render_markdown(summary) + "\n", encoding="utf-8")
    print(
        f"wrote compare summary -> {out_json} "
        f"({summary['frameRange']['start']}..{summary['frameRange']['end']})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
