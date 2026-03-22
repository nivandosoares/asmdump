#!/usr/bin/env python3
"""Audit first-pixel / X-origin Mode 7 model variants on the canonical plateau frame."""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
from pathlib import Path

from build_mesen_window_compare import analyze_mismatch
from compare_frames import load_ppm
from render_mesen_snes_bg import (
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    layer_enabled,
    load_cgram_rgb,
    read_vram_word,
    render_mode7_objects_ppu_accurate,
    sign_extend,
    write_ppm,
)


MODEL_SPECS = (
    {
        "id": "base_current",
        "label": "Base current renderer",
        "stateSource": "base",
        "xOriginBias": 0,
        "yLineBias": 0,
        "sampleBeforeIncrement": True,
    },
    {
        "id": "visible_state_current",
        "label": "Visible-state current renderer",
        "stateSource": "visible",
        "xOriginBias": 0,
        "yLineBias": 0,
        "sampleBeforeIncrement": True,
    },
    {
        "id": "sample_after_increment",
        "label": "Increment before sample",
        "stateSource": "base",
        "xOriginBias": 0,
        "yLineBias": 0,
        "sampleBeforeIncrement": False,
    },
    {
        "id": "x_origin_plus1",
        "label": "Pixel-0 origin +1",
        "stateSource": "base",
        "xOriginBias": 1,
        "yLineBias": 0,
        "sampleBeforeIncrement": True,
    },
    {
        "id": "line_plus1",
        "label": "Scanline Y +1",
        "stateSource": "base",
        "xOriginBias": 0,
        "yLineBias": 1,
        "sampleBeforeIncrement": True,
    },
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Audit exact-hit Mode 7 first-pixel / X-origin variants against the "
            "canonical plateau frame picked by a previous plateau analysis."
        )
    )
    parser.add_argument(
        "plateau_analysis_json",
        type=Path,
        help="mode7 plateau analysis JSON path",
    )
    parser.add_argument("out_json", type=Path, help="output JSON report path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown report path")
    parser.add_argument(
        "--target-scanlines",
        default="auto",
        help=(
            "comma-separated scanlines to log source coords for, or 'auto' to "
            "use the plateau bbox top/middle/bottom scanlines"
        ),
    )
    return parser.parse_args()


def load_json(path: Path) -> dict:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def parse_scanlines(raw: str, bbox: dict) -> list[int]:
    if raw.strip().lower() == "auto":
        y0 = int(bbox["y0"])
        y1 = int(bbox["y1"])
        mid = y0 + ((y1 - y0) // 2)
        return sorted({y0, mid, y1})

    scanlines: list[int] = []
    for token in raw.split(","):
        token = token.strip()
        if not token:
            continue
        scanlines.append(int(token))
    if not scanlines:
        raise ValueError("expected at least one target scanline")
    return sorted(set(scanlines))


def pixel_columns_for_bbox(bbox: dict) -> list[int]:
    x0 = int(bbox["x0"])
    x1 = int(bbox["x1"])
    mid = x0 + ((x1 - x0) // 2)
    return [0, 1, x0, min(x0 + 1, x1), mid]


def mode7_clip(value: int) -> int:
    return (value | ~0x03FF) if (value & 0x2000) else (value & 0x03FF)


def sha1_bytes(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()


def color_fill(cgram: list[tuple[int, int, int]]) -> bytearray:
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = bytes(cgram[0])
    for offset in range(0, len(rgb), 3):
        rgb[offset : offset + 3] = backdrop
    return rgb


def render_mode7_variant_layer(
    rgb: bytearray,
    vram: bytes,
    cgram: list[tuple[int, int, int]],
    state: dict,
    *,
    x_origin_bias: int,
    y_line_bias: int,
    sample_before_increment: bool,
    target_scanlines: set[int],
    target_columns: set[int],
) -> dict:
    hscroll = sign_extend(int(state.get("ppu.mode7.hscroll", 0)), 13)
    vscroll = sign_extend(int(state.get("ppu.mode7.vscroll", 0)), 13)
    center_x = sign_extend(int(state.get("ppu.mode7.centerX", 0)), 13)
    center_y = sign_extend(int(state.get("ppu.mode7.centerY", 0)), 13)
    matrix_a = sign_extend(int(state.get("ppu.mode7.matrix[0]", 0)), 16)
    matrix_b = sign_extend(int(state.get("ppu.mode7.matrix[1]", 0)), 16)
    matrix_c = sign_extend(int(state.get("ppu.mode7.matrix[2]", 0)), 16)
    matrix_d = sign_extend(int(state.get("ppu.mode7.matrix[3]", 0)), 16)
    large_map = bool(state.get("ppu.mode7.largeMap", False))
    fill_with_tile0 = bool(state.get("ppu.mode7.fillWithTile0", False))
    horizontal_mirroring = bool(state.get("ppu.mode7.horizontalMirroring", False))
    vertical_mirroring = bool(state.get("ppu.mode7.verticalMirroring", False))

    scanline_samples: list[dict] = []
    sampled_rows: dict[int, dict] = {}

    for screen_y in range(SCREEN_HEIGHT):
        real_y = (255 - screen_y) if vertical_mirroring else screen_y
        real_y += y_line_bias
        x_value = (
            ((matrix_a * mode7_clip(hscroll - center_x)) & ~63)
            + ((matrix_b * real_y) & ~63)
            + ((matrix_b * mode7_clip(vscroll - center_y)) & ~63)
            + (center_x << 8)
        )
        y_value = (
            ((matrix_c * mode7_clip(hscroll - center_x)) & ~63)
            + ((matrix_d * real_y) & ~63)
            + ((matrix_d * mode7_clip(vscroll - center_y)) & ~63)
            + (center_y << 8)
        )
        x_step = matrix_a
        y_step = matrix_c

        if horizontal_mirroring:
            x_value += x_step * (SCREEN_WIDTH - 1)
            y_value += y_step * (SCREEN_WIDTH - 1)
            x_step = -x_step
            y_step = -y_step

        if x_origin_bias:
            x_value += x_step * x_origin_bias
            y_value += y_step * x_origin_bias

        sample_row = None
        if screen_y in target_scanlines:
            sample_row = {
                "screenY": screen_y,
                "realY": real_y,
                "initialXValue": x_value,
                "initialYValue": y_value,
                "xStep": x_step,
                "yStep": y_step,
                "samples": [],
            }
            sampled_rows[screen_y] = sample_row
            scanline_samples.append(sample_row)

        for screen_x in range(SCREEN_WIDTH):
            current_x_value = x_value
            current_y_value = y_value
            if sample_before_increment:
                sample_x_value = current_x_value
                sample_y_value = current_y_value
                x_value += x_step
                y_value += y_step
            else:
                x_value += x_step
                y_value += y_step
                sample_x_value = x_value
                sample_y_value = y_value

            x_offset = sample_x_value >> 8
            y_offset = sample_y_value >> 8
            outside_map = large_map and (
                x_offset < 0 or x_offset > 0x03FF or y_offset < 0 or y_offset > 0x03FF
            )

            if sample_row is not None and screen_x in target_columns:
                sample_row["samples"].append(
                    {
                        "screenX": screen_x,
                        "sourceX": x_offset,
                        "sourceY": y_offset,
                        "sampleXValue": sample_x_value,
                        "sampleYValue": sample_y_value,
                        "outsideMap": outside_map,
                    }
                )

            if outside_map:
                if not fill_with_tile0:
                    continue
                tile_index = 0
            else:
                if not large_map:
                    x_offset &= 0x03FF
                    y_offset &= 0x03FF
                tile_word_index = ((y_offset & ~0x07) << 4) | (x_offset >> 3)
                tile_index = read_vram_word(vram, tile_word_index) & 0x00FF

            pixel_word_index = (tile_index << 6) + ((y_offset & 0x07) << 3) + (x_offset & 0x07)
            color_index = (read_vram_word(vram, pixel_word_index) >> 8) & 0x00FF
            if color_index == 0 or color_index >= len(cgram):
                continue

            dst = ((screen_y * SCREEN_WIDTH) + screen_x) * 3
            rgb[dst : dst + 3] = bytes(cgram[color_index])

    return {
        "hscroll": hscroll,
        "vscroll": vscroll,
        "centerX": center_x,
        "centerY": center_y,
        "matrix": [matrix_a, matrix_b, matrix_c, matrix_d],
        "xOriginBias": x_origin_bias,
        "yLineBias": y_line_bias,
        "sampleBeforeIncrement": sample_before_increment,
        "scanlineSamples": scanline_samples,
    }


def render_model_variant(
    frame_dir: Path,
    state: dict,
    cgram: list[tuple[int, int, int]],
    *,
    x_origin_bias: int,
    y_line_bias: int,
    sample_before_increment: bool,
    target_scanlines: set[int],
    target_columns: set[int],
    include_oam: bool,
) -> tuple[bytes, dict]:
    vram = (frame_dir / "vram.bin").read_bytes()
    oam_path = frame_dir / "oam.bin"
    oam = oam_path.read_bytes() if include_oam and oam_path.is_file() else None

    rgb = color_fill(cgram)
    mode7_summary = render_mode7_variant_layer(
        rgb,
        vram,
        cgram,
        state,
        x_origin_bias=x_origin_bias,
        y_line_bias=y_line_bias,
        sample_before_increment=sample_before_increment,
        target_scanlines=target_scanlines,
        target_columns=target_columns,
    )

    obj_summary = None
    if oam is not None and layer_enabled(int(state.get("ppu.mainScreenLayers", 0)), 4):
        obj_summary = render_mode7_objects_ppu_accurate(rgb, vram, oam, cgram, state)

    return bytes(rgb), {"mode7": mode7_summary, "obj": obj_summary}


def state_focus(state: dict) -> dict:
    keys = (
        "ppu.mode7.hscroll",
        "ppu.mode7.vscroll",
        "ppu.mode7.centerX",
        "ppu.mode7.centerY",
        "ppu.mode7.matrix[0]",
        "ppu.mode7.matrix[1]",
        "ppu.mode7.matrix[2]",
        "ppu.mode7.matrix[3]",
        "ppu.extBgEnabled",
        "ppu.directColorMode",
        "ppu.colorMathEnabled",
        "ppu.subScreenLayers",
    )
    return {key: state.get(key) for key in keys}


def state_differences(base_state: dict, visible_state: dict) -> list[dict]:
    diffs: list[dict] = []
    for key, base_value in state_focus(base_state).items():
        visible_value = visible_state.get(key)
        if base_value != visible_value:
            diffs.append({"key": key, "base": base_value, "visible": visible_value})
    return diffs


def render_markdown(report: dict) -> str:
    lines = [
        f"# {report['title']}",
        "",
        "## Canonical Frame",
        "",
        f"- frame: `{report['canonical']['frame']}`",
        f"- plateau analysis: `{report['plateauAnalysisPath']}`",
        f"- frame dir: `{report['canonical']['frameDir']}`",
        f"- design dir: `{report['canonical']['designDir']}`",
        f"- BG diff bbox: `{report['canonical']['bg1VisibleBBox']['x0']},{report['canonical']['bg1VisibleBBox']['y0']} -> {report['canonical']['bg1VisibleBBox']['x1']},{report['canonical']['bg1VisibleBBox']['y1']}`",
        f"- target scanlines: `{', '.join(str(v) for v in report['targetScanlines'])}`",
        f"- target columns: `{', '.join(str(v) for v in report['targetColumns'])}`",
        "",
        "## Visible-State Delta",
        "",
    ]
    if report["visibleStateDifferences"]:
        lines.append("| key | base | visible |")
        lines.append("|---|---:|---:|")
        for row in report["visibleStateDifferences"]:
            lines.append(f"| `{row['key']}` | `{row['base']}` | `{row['visible']}` |")
    else:
        lines.append("- no focused `Mode 7` state deltas between `ppu_state.json` and `ppu_state_visible.json`")

    lines.extend(
        [
            "",
            "## Model Compare",
            "",
            "| model | state | sample order | x bias | y bias | full scene | bg-only |",
            "|---|---|---|---:|---:|---:|---:|",
        ]
    )
    for row in report["models"]:
        lines.append(
            f"| `{row['id']}` | `{row['stateSource']}` | "
            f"`{'sample-then-increment' if row['sampleBeforeIncrement'] else 'increment-then-sample'}` | "
            f"`{row['xOriginBias']}` | `{row['yLineBias']}` | "
            f"`{row['mainVisibleMismatchPixels']}` | `{row['bg1VisibleMismatchPixels']}` |"
        )

    lines.extend(["", "## Coordinate Samples", ""])
    for row in report["models"]:
        lines.append(f"### `{row['id']}`")
        lines.append("")
        lines.append("| scanline | screen x | source x | source y | outside map |")
        lines.append("|---:|---:|---:|---:|---|")
        for scanline in row["mode7"]["scanlineSamples"]:
            for sample in scanline["samples"]:
                lines.append(
                    f"| `{scanline['screenY']}` | `{sample['screenX']}` | "
                    f"`{sample['sourceX']}` | `{sample['sourceY']}` | "
                    f"`{sample['outsideMap']}` |"
                )
        lines.append("")

    best_bg = report["bestBgOnlyModel"]
    best_main = report["bestMainSceneModel"]
    lines.extend(
        [
            "## Reading",
            "",
            f"- best BG-only model: `{best_bg['id']}` -> `{best_bg['bg1VisibleMismatchPixels']}` mismatched pixels",
            f"- best full-scene model: `{best_main['id']}` -> `{best_main['mainVisibleMismatchPixels']}` mismatched pixels",
        ]
    )
    if report["equivalentModelPairs"]:
        lines.append("- equivalent render outputs:")
        for pair in report["equivalentModelPairs"]:
            lines.append(
                f"  - `{pair['left']}` == `{pair['right']}` "
                f"(`{pair['bg1VisibleMismatchPixels']}` BG-only / `{pair['mainVisibleMismatchPixels']}` full-scene)"
            )
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    plateau_analysis_path = args.plateau_analysis_json.resolve()
    plateau = load_json(plateau_analysis_path)
    canonical = plateau.get("canonicalFrame")
    if not isinstance(canonical, dict):
        raise SystemExit(f"error: canonicalFrame missing in {plateau_analysis_path}")

    frame = int(canonical["frame"])
    frame_dir = Path(canonical["frameDir"]).resolve()
    design_dir = Path(canonical["designFrameDir"]).resolve()
    bg_bbox = canonical.get("bg1VisibleCompare", {}).get("bbox")
    if not isinstance(bg_bbox, dict):
        raise SystemExit(f"error: bg1VisibleCompare.bbox missing in {plateau_analysis_path}")

    target_scanlines = parse_scanlines(args.target_scanlines, bg_bbox)
    target_columns = pixel_columns_for_bbox(bg_bbox)

    base_state = load_json(frame_dir / "ppu_state.json")
    visible_state = load_json(frame_dir / "ppu_state_visible.json")
    cgram = load_cgram_rgb(frame_dir / "cgram.bin")

    _, _, main_visible_pixels = load_ppm(frame_dir / "main_visible.ppm")
    _, _, bg1_visible_pixels = load_ppm(design_dir / "layers" / "bg1_visible.ppm")

    models: list[dict] = []
    for spec in MODEL_SPECS:
        state = visible_state if spec["stateSource"] == "visible" else base_state
        bg_only_pixels, bg_summary = render_model_variant(
            frame_dir,
            state,
            cgram,
            x_origin_bias=int(spec["xOriginBias"]),
            y_line_bias=int(spec["yLineBias"]),
            sample_before_increment=bool(spec["sampleBeforeIncrement"]),
            target_scanlines=set(target_scanlines),
            target_columns=set(target_columns),
            include_oam=False,
        )
        full_scene_pixels, full_summary = render_model_variant(
            frame_dir,
            state,
            cgram,
            x_origin_bias=int(spec["xOriginBias"]),
            y_line_bias=int(spec["yLineBias"]),
            sample_before_increment=bool(spec["sampleBeforeIncrement"]),
            target_scanlines=set(target_scanlines),
            target_columns=set(target_columns),
            include_oam=True,
        )
        bg_compare = analyze_mismatch(bg1_visible_pixels, bg_only_pixels, SCREEN_WIDTH)
        main_compare = analyze_mismatch(main_visible_pixels, full_scene_pixels, SCREEN_WIDTH)
        models.append(
            {
                "id": spec["id"],
                "label": spec["label"],
                "stateSource": spec["stateSource"],
                "xOriginBias": int(spec["xOriginBias"]),
                "yLineBias": int(spec["yLineBias"]),
                "sampleBeforeIncrement": bool(spec["sampleBeforeIncrement"]),
                "bg1VisibleMismatchPixels": bg_compare["mismatchPixels"],
                "bg1VisibleDiffBBox": bg_compare["bbox"],
                "mainVisibleMismatchPixels": main_compare["mismatchPixels"],
                "mainVisibleDiffBBox": main_compare["bbox"],
                "bg1VisibleSha1": sha1_bytes(bg_only_pixels),
                "mainVisibleSha1": sha1_bytes(full_scene_pixels),
                "mode7": bg_summary["mode7"],
                "obj": full_summary["obj"],
            }
        )

    best_bg = min(models, key=lambda row: int(row["bg1VisibleMismatchPixels"]))
    best_main = min(models, key=lambda row: int(row["mainVisibleMismatchPixels"]))

    equivalent_pairs: list[dict] = []
    for index, left in enumerate(models):
        for right in models[index + 1 :]:
            if (
                left["bg1VisibleSha1"] == right["bg1VisibleSha1"]
                and left["mainVisibleSha1"] == right["mainVisibleSha1"]
            ):
                equivalent_pairs.append(
                    {
                        "left": left["id"],
                        "right": right["id"],
                        "bg1VisibleMismatchPixels": left["bg1VisibleMismatchPixels"],
                        "mainVisibleMismatchPixels": left["mainVisibleMismatchPixels"],
                    }
                )

    report = {
        "schema": "td2.mode7_first_pixel_audit.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "title": "Mode 7 first-pixel audit",
        "plateauAnalysisPath": str(plateau_analysis_path),
        "canonical": {
            "frame": frame,
            "frameDir": str(frame_dir),
            "designDir": str(design_dir),
            "bg1VisibleBBox": bg_bbox,
            "baseState": state_focus(base_state),
            "visibleState": state_focus(visible_state),
        },
        "targetScanlines": target_scanlines,
        "targetColumns": target_columns,
        "visibleStateDifferences": state_differences(base_state, visible_state),
        "models": models,
        "bestBgOnlyModel": {
            "id": best_bg["id"],
            "bg1VisibleMismatchPixels": best_bg["bg1VisibleMismatchPixels"],
            "mainVisibleMismatchPixels": best_bg["mainVisibleMismatchPixels"],
        },
        "bestMainSceneModel": {
            "id": best_main["id"],
            "bg1VisibleMismatchPixels": best_main["bg1VisibleMismatchPixels"],
            "mainVisibleMismatchPixels": best_main["mainVisibleMismatchPixels"],
        },
        "equivalentModelPairs": equivalent_pairs,
    }

    out_json = args.out_json.resolve()
    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        markdown_path = args.markdown_out.resolve()
        markdown_path.parent.mkdir(parents=True, exist_ok=True)
        markdown_path.write_text(render_markdown(report) + "\n", encoding="utf-8")

    print(f"wrote mode7 first-pixel audit -> {out_json} (frame {frame})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
