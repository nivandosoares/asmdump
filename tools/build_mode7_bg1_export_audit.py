#!/usr/bin/env python3
"""Search a bounded Mode 7 model grid against bg1_visible export semantics."""

from __future__ import annotations

import argparse
import datetime as dt
import json
from pathlib import Path

from build_mesen_window_compare import analyze_mismatch
from build_mode7_first_pixel_audit import (
    load_json,
    parse_scanlines,
    pixel_columns_for_bbox,
    render_model_variant,
    state_differences,
    state_focus,
)
from render_mesen_snes_bg import load_cgram_rgb, sign_extend
from compare_frames import load_ppm


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Sweep a bounded Mode 7 model grid against bg1_visible/main_visible "
            "for the canonical plateau frame picked by a previous plateau analysis."
        )
    )
    parser.add_argument("plateau_analysis_json", type=Path, help="mode7 plateau analysis JSON path")
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


def encode_signed_13bit(value: int) -> int:
    return value & 0x1FFF


def model_grid(has_visible_delta: bool) -> list[dict]:
    rows: list[dict] = []
    state_sources = ["base", "visible"] if has_visible_delta else ["base"]
    for state_source in state_sources:
        for y_line_bias in (0, 1):
            for x_origin_bias in (-1, 0, 1):
                for hscroll_bias in (-1, 0, 1):
                    for sample_before_increment in (True, False):
                        model_id = (
                            f"{state_source}_y{y_line_bias:+d}_x{x_origin_bias:+d}_"
                            f"h{hscroll_bias:+d}_{'pre' if sample_before_increment else 'post'}"
                        )
                        rows.append(
                            {
                                "id": model_id,
                                "stateSource": state_source,
                                "xOriginBias": x_origin_bias,
                                "yLineBias": y_line_bias,
                                "hscrollBias": hscroll_bias,
                                "sampleBeforeIncrement": sample_before_increment,
                            }
                        )
    return rows


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
        "## Best Models",
        "",
        f"- best BG-only overall: `{report['bestBgOnlyModel']['id']}` -> BG `{report['bestBgOnlyModel']['bg1VisibleMismatchPixels']}`, main `{report['bestBgOnlyModel']['mainVisibleMismatchPixels']}`",
        f"- best BG-only with main `0`: `{report['bestBgOnlyZeroMainModel']['id']}` -> BG `{report['bestBgOnlyZeroMainModel']['bg1VisibleMismatchPixels']}`, main `{report['bestBgOnlyZeroMainModel']['mainVisibleMismatchPixels']}`",
        f"- best main overall: `{report['bestMainSceneModel']['id']}` -> BG `{report['bestMainSceneModel']['bg1VisibleMismatchPixels']}`, main `{report['bestMainSceneModel']['mainVisibleMismatchPixels']}`",
        f"- zero-main models scanned: `{report['zeroMainModelCount']}` / `{report['modelCount']}`",
        "",
        "## Top BG-only Candidates",
        "",
        "| id | state | y | x | hscroll | sample | BG-only | main |",
        "|---|---|---:|---:|---:|---|---:|---:|",
    ]
    for row in report["topBgOnlyModels"]:
        lines.append(
            f"| `{row['id']}` | `{row['stateSource']}` | `{row['yLineBias']}` | "
            f"`{row['xOriginBias']}` | `{row['hscrollBias']}` | "
            f"`{'pre' if row['sampleBeforeIncrement'] else 'post'}` | "
            f"`{row['bg1VisibleMismatchPixels']}` | `{row['mainVisibleMismatchPixels']}` |"
        )

    lines.extend(
        [
            "",
            "## Reading",
            "",
            "- This audit keeps the composed-scene closure constraint explicit instead of optimizing `bg1_visible` in isolation.",
            "- If no zero-main candidate improves meaningfully over `line + 1`, the remaining gap is better treated as export semantics than another small renderer tweak.",
        ]
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
    visible_diffs = state_differences(base_state, visible_state)
    cgram = load_cgram_rgb(frame_dir / "cgram.bin")

    _, _, main_visible_pixels = load_ppm(frame_dir / "main_visible.ppm")
    _, _, bg1_visible_pixels = load_ppm(design_dir / "layers" / "bg1_visible.ppm")

    models: list[dict] = []
    for spec in model_grid(bool(visible_diffs)):
        base = visible_state if spec["stateSource"] == "visible" else base_state
        state = dict(base)
        hscroll = sign_extend(int(state.get("ppu.mode7.hscroll", 0)), 13)
        state["ppu.mode7.hscroll"] = encode_signed_13bit(hscroll + int(spec["hscrollBias"]))

        bg_only_pixels, _ = render_model_variant(
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
        full_scene_pixels, _ = render_model_variant(
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
        bg_compare = analyze_mismatch(bg1_visible_pixels, bg_only_pixels, 256)
        main_compare = analyze_mismatch(main_visible_pixels, full_scene_pixels, 256)
        models.append(
            {
                **spec,
                "effectiveHscroll": hscroll + int(spec["hscrollBias"]),
                "bg1VisibleMismatchPixels": bg_compare["mismatchPixels"],
                "bg1VisibleDiffBBox": bg_compare["bbox"],
                "mainVisibleMismatchPixels": main_compare["mismatchPixels"],
                "mainVisibleDiffBBox": main_compare["bbox"],
            }
        )

    top_bg = sorted(
        models,
        key=lambda row: (
            int(row["bg1VisibleMismatchPixels"]),
            int(row["mainVisibleMismatchPixels"]),
            abs(int(row["hscrollBias"])),
            abs(int(row["xOriginBias"])),
            abs(int(row["yLineBias"])),
            0 if bool(row["sampleBeforeIncrement"]) else 1,
        ),
    )
    zero_main = [row for row in top_bg if int(row["mainVisibleMismatchPixels"]) == 0]
    best_bg = top_bg[0]
    best_bg_zero = zero_main[0] if zero_main else best_bg
    best_main = min(
        models,
        key=lambda row: (
            int(row["mainVisibleMismatchPixels"]),
            int(row["bg1VisibleMismatchPixels"]),
        ),
    )

    report = {
        "schema": "td2.mode7_bg1_export_audit.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "title": "Mode 7 BG1 export audit",
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
        "visibleStateDifferences": visible_diffs,
        "modelCount": len(models),
        "zeroMainModelCount": len(zero_main),
        "bestBgOnlyModel": {
            "id": best_bg["id"],
            "bg1VisibleMismatchPixels": best_bg["bg1VisibleMismatchPixels"],
            "mainVisibleMismatchPixels": best_bg["mainVisibleMismatchPixels"],
        },
        "bestBgOnlyZeroMainModel": {
            "id": best_bg_zero["id"],
            "bg1VisibleMismatchPixels": best_bg_zero["bg1VisibleMismatchPixels"],
            "mainVisibleMismatchPixels": best_bg_zero["mainVisibleMismatchPixels"],
        },
        "bestMainSceneModel": {
            "id": best_main["id"],
            "bg1VisibleMismatchPixels": best_main["bg1VisibleMismatchPixels"],
            "mainVisibleMismatchPixels": best_main["mainVisibleMismatchPixels"],
        },
        "topBgOnlyModels": top_bg[:12],
        "models": models,
    }

    out_json = args.out_json.resolve()
    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        markdown_path = args.markdown_out.resolve()
        markdown_path.parent.mkdir(parents=True, exist_ok=True)
        markdown_path.write_text(render_markdown(report) + "\n", encoding="utf-8")

    print(f"wrote mode7 bg1 export audit -> {out_json} (frame {frame}, {len(models)} models)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
