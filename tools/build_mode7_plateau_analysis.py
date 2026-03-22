#!/usr/bin/env python3
"""Build a focused analysis report for a static late-attract Mode 7 plateau."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import tempfile
from collections import Counter
from pathlib import Path

from build_mesen_window_compare import (
    analyze_mismatch,
    collapse_value_ranges,
    collect_frame_dirs,
    parse_frame_number,
    render_frame,
    sha1_file,
)
from compare_frames import load_ppm


PLATEAU_IDENTITY_KEYS = (
    "mainVisibleSha1",
    "vramSha1",
    "oamSha1",
    "ppuStateSha1",
    "baseRenderDiffMaskSha1",
    "baseRenderDiffSha1",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a canonical Mode 7 plateau analysis from a window-compare "
            "summary and the matching design-pack frames."
        )
    )
    parser.add_argument(
        "compare_summary_json",
        type=Path,
        help="window-compare summary JSON path",
    )
    parser.add_argument(
        "design_frame_roots",
        nargs="+",
        type=Path,
        help="one or more roots that contain design-pack frame_XXXXX folders",
    )
    parser.add_argument("out_json", type=Path, help="output JSON report path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown report path")
    parser.add_argument(
        "--canonical-frame",
        type=int,
        default=None,
        help=(
            "optional canonical frame override; by default the tool auto-picks "
            "the first frame of the trailing static plateau"
        ),
    )
    parser.add_argument(
        "--shift-limit",
        type=int,
        default=8,
        help="max horizontal shift (pixels) to test in each direction (default: %(default)s)",
    )
    parser.add_argument(
        "--hscroll-deltas",
        default="-2,-1,0,1,2",
        help=(
            "comma-separated Mode 7 hscroll deltas to test against the "
            "canonical state (default: %(default)s)"
        ),
    )
    parser.add_argument(
        "--frame-glob",
        default="frame_*",
        help="frame directory glob used under each design root (default: %(default)s)",
    )
    parser.add_argument(
        "--mode7-line-bias",
        type=int,
        default=1,
        help="optional per-scanline Y bias passed through to the Mode 7 renderer",
    )
    return parser.parse_args()


def load_json(path: Path) -> dict:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def locate_design_frames(frame_roots: list[Path], frame_glob: str) -> dict[int, Path]:
    frame_dirs = collect_frame_dirs(frame_roots, frame_glob)
    lookup: dict[int, Path] = {}
    for frame_dir in frame_dirs:
        frame = parse_frame_number(frame_dir)
        if frame is None:
            continue
        lookup[frame] = frame_dir
    return lookup


def parse_int_list(raw: str) -> list[int]:
    values: list[int] = []
    for part in raw.split(","):
        token = part.strip()
        if not token:
            continue
        values.append(int(token))
    if not values:
        raise ValueError("expected at least one integer value")
    return values


def trailing_plateau_rows(rows: list[dict]) -> list[dict]:
    if not rows:
        raise ValueError("compare summary has no frame rows")
    tail = rows[-1]
    plateau: list[dict] = []
    for row in reversed(rows):
        if all(row.get(key) == tail.get(key) for key in PLATEAU_IDENTITY_KEYS):
            plateau.append(row)
            continue
        break
    plateau.reverse()
    return plateau


def plateau_from_canonical(rows: list[dict], canonical_frame: int) -> list[dict]:
    canonical_row = next((row for row in rows if row.get("frame") == canonical_frame), None)
    if canonical_row is None:
        raise ValueError(f"canonical frame {canonical_frame} not present in compare summary")

    canonical_index = rows.index(canonical_row)
    plateau = [canonical_row]
    for row in rows[canonical_index + 1 :]:
        if all(row.get(key) == canonical_row.get(key) for key in PLATEAU_IDENTITY_KEYS):
            plateau.append(row)
            continue
        break
    return plateau


def render_variant(
    frame_dir: Path,
    state_path: Path,
    out_path: Path,
    *,
    obj_renderer: str,
    include_oam: bool,
    mode7_line_bias: int,
) -> bytes:
    render_script = Path(__file__).with_name("render_mesen_snes_bg.py").resolve()
    if include_oam:
        render_frame(
            render_script,
            frame_dir,
            state_path,
            out_path,
            obj_renderer,
            mode7_line_bias,
        )
    else:
        # Match render_frame without attaching OAM.
        import subprocess
        import sys

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
        subprocess.run(cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    _, _, pixels = load_ppm(out_path)
    return pixels


def shifted_bbox_mismatch(expected: bytes, actual: bytes, width: int, bbox: dict, shift: int) -> int:
    mismatch = 0
    x0 = bbox["x0"]
    y0 = bbox["y0"]
    x1 = bbox["x1"]
    y1 = bbox["y1"]
    for y in range(y0, y1 + 1):
        row_base = y * width
        for x in range(x0, x1 + 1):
            actual_x = x - shift
            if actual_x < 0 or actual_x >= width:
                mismatch += 1
                continue
            expected_index = (row_base + x) * 3
            actual_index = (row_base + actual_x) * 3
            if expected[expected_index : expected_index + 3] != actual[actual_index : actual_index + 3]:
                mismatch += 1
    return mismatch


def per_row_best_shifts(expected: bytes, actual: bytes, width: int, bbox: dict, shift_limit: int) -> list[dict]:
    rows: list[dict] = []
    x0 = bbox["x0"]
    y0 = bbox["y0"]
    x1 = bbox["x1"]
    y1 = bbox["y1"]
    for y in range(y0, y1 + 1):
        best_shift = 0
        best_mismatch = None
        for shift in range(-shift_limit, shift_limit + 1):
            mismatch = 0
            row_base = y * width
            for x in range(x0, x1 + 1):
                actual_x = x - shift
                if actual_x < 0 or actual_x >= width:
                    mismatch += 1
                    continue
                expected_index = (row_base + x) * 3
                actual_index = (row_base + actual_x) * 3
                if expected[expected_index : expected_index + 3] != actual[actual_index : actual_index + 3]:
                    mismatch += 1
            if best_mismatch is None or mismatch < best_mismatch:
                best_shift = shift
                best_mismatch = mismatch
        rows.append(
            {
                "y": y,
                "bestShift": best_shift,
                "bestMismatchPixels": best_mismatch,
            }
        )
    return rows


def summarize_shift_counts(rows: list[dict]) -> list[dict]:
    counts = Counter(int(row["bestShift"]) for row in rows)
    return [
        {"shift": shift, "rowCount": count}
        for shift, count in sorted(counts.items(), key=lambda item: (-item[1], item[0]))
    ]


def compute_sprite_overlap(sprites_visible_json: Path, bbox: dict) -> dict:
    payload = load_json(sprites_visible_json)
    sprites = payload.get("sprites")
    if not isinstance(sprites, list):
        raise ValueError(f"expected sprites[] in {sprites_visible_json}")

    x0 = bbox["x0"]
    y0 = bbox["y0"]
    x1 = bbox["x1"]
    y1 = bbox["y1"]
    width = x1 - x0 + 1
    height = y1 - y0 + 1
    grid = bytearray(width * height)
    overlap_rows: list[dict] = []

    for sprite in sprites:
        if not isinstance(sprite, dict):
            continue
        sx0 = int(sprite.get("x", 0))
        sy0 = int(sprite.get("y", 0))
        sw = int(sprite.get("width", 0))
        sh = int(sprite.get("height", 0))
        sx1 = sx0 + sw - 1
        sy1 = sy0 + sh - 1
        ix0 = max(x0, sx0)
        iy0 = max(y0, sy0)
        ix1 = min(x1, sx1)
        iy1 = min(y1, sy1)
        if ix0 > ix1 or iy0 > iy1:
            continue
        overlap_rows.append(
            {
                "spriteIndex": int(sprite.get("spriteIndex", -1)),
                "priority": sprite.get("priority"),
                "x0": ix0,
                "y0": iy0,
                "x1": ix1,
                "y1": iy1,
                "width": ix1 - ix0 + 1,
                "height": iy1 - iy0 + 1,
            }
        )
        for y in range(iy0, iy1 + 1):
            row_base = (y - y0) * width
            for x in range(ix0, ix1 + 1):
                grid[row_base + (x - x0)] = 1

    union_pixels = int(sum(grid))
    area = width * height
    return {
        "bbox": bbox,
        "bboxAreaPixels": area,
        "overlappingSpriteCount": len(overlap_rows),
        "unionPixels": union_pixels,
        "unionRatio": (union_pixels / area) if area else 0.0,
        "sprites": overlap_rows,
    }


def sign_extend(value: int, bits: int) -> int:
    sign = 1 << (bits - 1)
    mask = (1 << bits) - 1
    value &= mask
    return (value ^ sign) - sign


def mode7_clip(value: int) -> int:
    return (value | ~0x03FF) if (value & 0x2000) else (value & 0x03FF)


def compute_mode7_window_sampling_stats(state: dict, bbox: dict, *, hscroll_override: int | None = None) -> dict:
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

    if hscroll_override is not None:
        hscroll = int(hscroll_override)

    x0 = int(bbox["x0"])
    y0 = int(bbox["y0"])
    x1 = int(bbox["x1"])
    y1 = int(bbox["y1"])
    area = (x1 - x0 + 1) * (y1 - y0 + 1)

    inside_pixels = 0
    outside_pixels = 0
    tile0_fill_pixels = 0
    min_x_offset = None
    max_x_offset = None
    min_y_offset = None
    max_y_offset = None

    for screen_y in range(y0, y1 + 1):
        real_y = (255 - screen_y) if vertical_mirroring else screen_y
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
            x_value += x_step * 255
            y_value += y_step * 255
            x_step = -x_step
            y_step = -y_step

        for screen_x in range(256):
            x_offset = x_value >> 8
            y_offset = y_value >> 8
            x_value += x_step
            y_value += y_step

            if screen_x < x0 or screen_x > x1:
                continue

            if min_x_offset is None or x_offset < min_x_offset:
                min_x_offset = x_offset
            if max_x_offset is None or x_offset > max_x_offset:
                max_x_offset = x_offset
            if min_y_offset is None or y_offset < min_y_offset:
                min_y_offset = y_offset
            if max_y_offset is None or y_offset > max_y_offset:
                max_y_offset = y_offset

            if large_map and (x_offset < 0 or x_offset > 0x03FF or y_offset < 0 or y_offset > 0x03FF):
                outside_pixels += 1
                if fill_with_tile0:
                    tile0_fill_pixels += 1
            else:
                inside_pixels += 1

    return {
        "bbox": bbox,
        "hscroll": hscroll,
        "largeMap": large_map,
        "fillWithTile0": fill_with_tile0,
        "insidePixels": inside_pixels,
        "outsideMapPixels": outside_pixels,
        "outsideMapRatio": (outside_pixels / area) if area else 0.0,
        "tile0FillPixels": tile0_fill_pixels,
        "xOffsetRange": {"min": min_x_offset, "max": max_x_offset},
        "yOffsetRange": {"min": min_y_offset, "max": max_y_offset},
    }


def render_markdown(report: dict) -> str:
    plateau = report["plateau"]
    canonical = report["canonicalFrame"]
    shift_scan = report["bgOnlyShiftScan"]
    hscroll_scan = report["mode7HscrollDeltaScan"]
    sampling = report["mode7WindowSampling"]
    lines = [
        f"# {report['title']}",
        "",
        "## Plateau",
        "",
        f"- canonical frame: `{canonical['frame']}`",
        f"- plateau frames: `{plateau['startFrame']}..{plateau['endFrame']}` (`{plateau['count']}` frames)",
        f"- compare summary: `{report['compareSummaryPath']}`",
        f"- canonical extracted frame: `{canonical['frameDir']}`",
        f"- canonical design pack: `{canonical['designFrameDir']}`",
        "",
        "## Plateau identity",
        "",
        f"- `bg1_visible.ppm` sha1 ranges: `{plateau['bg1VisibleIdentity']['distinctCount']}` distinct",
        (
            f"- base diff bbox: `{canonical['mainDiffBBox']['x0']},{canonical['mainDiffBBox']['y0']} -> "
            f"{canonical['mainDiffBBox']['x1']},{canonical['mainDiffBBox']['y1']}`"
            if isinstance(canonical.get("mainDiffBBox"), dict)
            else "- base diff bbox: `none` (composed-screen compare is exact)"
        ),
        "",
        "## Canonical compares",
        "",
        f"- `mode7-ppu` with OAM vs `main_visible`: `{canonical['mainVisibleCompare']['mode7PpuMismatchPixels']}` mismatched pixels",
        f"- `simple` with OAM vs `main_visible`: `{canonical['mainVisibleCompare']['simpleMismatchPixels']}` mismatched pixels",
        f"- no-OAM vs `main_visible`: `{canonical['mainVisibleCompare']['noOamMismatchPixels']}` mismatched pixels",
        f"- no-OAM vs `bg1_visible`: `{canonical['bg1VisibleCompare']['mismatchPixels']}` mismatched pixels",
        f"- `bg1_visible` diff bbox: `{canonical['bg1VisibleCompare']['bbox']['x0']},{canonical['bg1VisibleCompare']['bbox']['y0']} -> {canonical['bg1VisibleCompare']['bbox']['x1']},{canonical['bg1VisibleCompare']['bbox']['y1']}`",
        "",
        "## Sprite overlap",
        "",
        (
            f"- sprites touching plateau diff box: `{canonical['spriteOverlap']['overlappingSpriteCount']}`"
            if canonical.get("spriteOverlap") is not None
            else "- sprites touching plateau diff box: `n/a` (composed-screen diff box is absent)"
        ),
        (
            f"- sprite union inside plateau diff box: `{canonical['spriteOverlap']['unionPixels']}` / "
            f"`{canonical['spriteOverlap']['bboxAreaPixels']}` (`{canonical['spriteOverlap']['unionRatio']:.6%}`)"
            if canonical.get("spriteOverlap") is not None
            else "- sprite union inside plateau diff box: `n/a`"
        ),
        "",
        "## Mode 7 Window Sampling",
        "",
        f"- BG bbox at base hscroll stays inside the map: `{sampling['bg1Base']['outsideMapPixels']}` outside-map pixels",
        f"- BG bbox at best BG-only delta stays inside the map: `{sampling['bg1BestBgDelta']['outsideMapPixels']}` outside-map pixels",
        f"- BG bbox base offset range: `x={sampling['bg1Base']['xOffsetRange']['min']}..{sampling['bg1Base']['xOffsetRange']['max']}`, `y={sampling['bg1Base']['yOffsetRange']['min']}..{sampling['bg1Base']['yOffsetRange']['max']}`",
        "",
        "## BG shift scan",
        "",
        f"- best whole-box horizontal shift: `{shift_scan['bestShift']}`",
        f"- zero-shift mismatch: `{shift_scan['zeroShiftMismatchPixels']}`",
        f"- best-shift mismatch: `{shift_scan['bestShiftMismatchPixels']}`",
        "",
        "## Mode 7 HScroll Scan",
        "",
        f"- base `ppu.mode7.hscroll`: `{hscroll_scan['baseHscroll']}`",
        f"- best BG-only delta: `{hscroll_scan['bestBg1Delta']}` -> `{hscroll_scan['bestBg1MismatchPixels']}` mismatched pixels",
        f"- best full-scene delta: `{hscroll_scan['bestMainDelta']}` -> `{hscroll_scan['bestMainMismatchPixels']}` mismatched pixels",
        "",
        "| hscroll delta | full scene | bg1 only |",
        "|---:|---:|---:|",
    ]
    for row in hscroll_scan["rows"]:
        lines.append(
            f"| `{row['delta']}` | `{row['mainVisibleMismatchPixels']}` | `{row['bg1VisibleMismatchPixels']}` |"
        )
    lines.extend(
        [
            "",
        "### Row best shifts",
        "",
        "| shift | rows |",
        "|---:|---:|",
        ]
    )
    for row in report["bgOnlyPerRowBestShiftCounts"]:
        lines.append(f"| `{row['shift']}` | `{row['rowCount']}` |")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    compare_summary_path = args.compare_summary_json.resolve()
    summary = load_json(compare_summary_path)
    rows = summary.get("frames")
    if not isinstance(rows, list) or not rows:
        raise SystemExit(f"error: compare summary has no frames: {compare_summary_path}")

    if args.canonical_frame is None:
        plateau_rows = trailing_plateau_rows(rows)
    else:
        plateau_rows = plateau_from_canonical(rows, args.canonical_frame)

    canonical_row = plateau_rows[0]
    canonical_frame = int(canonical_row["frame"])
    design_lookup = locate_design_frames([path.resolve() for path in args.design_frame_roots], args.frame_glob)
    missing_frames = [int(row["frame"]) for row in plateau_rows if int(row["frame"]) not in design_lookup]
    if missing_frames:
        raise SystemExit(f"error: missing design-pack frames for plateau rows: {missing_frames}")

    canonical_frame_dir = Path(canonical_row["frameDir"]).resolve()
    canonical_design_dir = design_lookup[canonical_frame].resolve()
    canonical_state = load_json(canonical_frame_dir / "ppu_state.json")
    hscroll_deltas = parse_int_list(args.hscroll_deltas)
    bg1_rows: list[dict] = []
    for row in plateau_rows:
        frame = int(row["frame"])
        design_dir = design_lookup[frame]
        bg1_rows.append(
            {
                "frame": frame,
                "bg1VisibleSha1": sha1_file(design_dir / "layers" / "bg1_visible.ppm"),
            }
        )

    main_visible_path = canonical_frame_dir / "main_visible.ppm"
    bg1_visible_path = canonical_design_dir / "layers" / "bg1_visible.ppm"
    ppu_state_path = canonical_frame_dir / "ppu_state.json"
    sprites_visible_json = canonical_design_dir / "sprites" / "sprites_visible.json"

    visible_width, _, main_visible_pixels = load_ppm(main_visible_path)
    bg1_width, _, bg1_visible_pixels = load_ppm(bg1_visible_path)
    if visible_width != bg1_width:
        raise SystemExit("error: main_visible and bg1_visible widths differ")

    hscroll_scan_rows: list[dict] = []
    best_bg1_delta = None
    best_bg1_mismatch = None
    best_main_delta = None
    best_main_mismatch = None

    with tempfile.TemporaryDirectory(prefix="mode7-plateau-") as temp_root_raw:
        temp_root = Path(temp_root_raw)
        mode7_with_oam = render_variant(
            canonical_frame_dir,
            ppu_state_path,
            temp_root / "mode7_with_oam.ppm",
            obj_renderer="mode7-ppu",
            include_oam=True,
            mode7_line_bias=args.mode7_line_bias,
        )
        simple_with_oam = render_variant(
            canonical_frame_dir,
            ppu_state_path,
            temp_root / "simple_with_oam.ppm",
            obj_renderer="simple",
            include_oam=True,
            mode7_line_bias=args.mode7_line_bias,
        )
        no_oam = render_variant(
            canonical_frame_dir,
            ppu_state_path,
            temp_root / "mode7_no_oam.ppm",
            obj_renderer="mode7-ppu",
            include_oam=False,
            mode7_line_bias=args.mode7_line_bias,
        )
        base_hscroll = int(canonical_state.get("ppu.mode7.hscroll", 0))
        for delta in hscroll_deltas:
            state_payload = dict(canonical_state)
            state_payload["ppu.mode7.hscroll"] = base_hscroll + delta
            state_path = temp_root / f"hscroll_{delta:+d}.json"
            state_path.write_text(json.dumps(state_payload), encoding="utf-8")
            delta_main_pixels = render_variant(
                canonical_frame_dir,
                state_path,
                temp_root / f"hscroll_{delta:+d}_main.ppm",
                obj_renderer="mode7-ppu",
                include_oam=True,
                mode7_line_bias=args.mode7_line_bias,
            )
            delta_bg1_pixels = render_variant(
                canonical_frame_dir,
                state_path,
                temp_root / f"hscroll_{delta:+d}_bg1.ppm",
                obj_renderer="mode7-ppu",
                include_oam=False,
                mode7_line_bias=args.mode7_line_bias,
            )
            delta_main_mismatch = analyze_mismatch(main_visible_pixels, delta_main_pixels, visible_width)["mismatchPixels"]
            delta_bg1_mismatch = analyze_mismatch(bg1_visible_pixels, delta_bg1_pixels, bg1_width)["mismatchPixels"]
            hscroll_scan_rows.append(
                {
                    "delta": delta,
                    "mode7Hscroll": int(state_payload["ppu.mode7.hscroll"]),
                    "mainVisibleMismatchPixels": delta_main_mismatch,
                    "bg1VisibleMismatchPixels": delta_bg1_mismatch,
                }
            )
            if best_bg1_mismatch is None or delta_bg1_mismatch < best_bg1_mismatch:
                best_bg1_delta = delta
                best_bg1_mismatch = delta_bg1_mismatch
            if best_main_mismatch is None or delta_main_mismatch < best_main_mismatch:
                best_main_delta = delta
                best_main_mismatch = delta_main_mismatch

    simple_main_compare = analyze_mismatch(main_visible_pixels, simple_with_oam, visible_width)
    no_oam_main_compare = analyze_mismatch(main_visible_pixels, no_oam, visible_width)
    bg1_compare = analyze_mismatch(bg1_visible_pixels, no_oam, bg1_width)
    bg1_bbox = bg1_compare["bbox"]
    if not isinstance(bg1_bbox, dict):
        raise SystemExit("error: no bg1 mismatch bbox found for canonical frame")
    main_diff_bbox = canonical_row.get("baseRenderDiffBBox")
    if not isinstance(main_diff_bbox, dict):
        main_diff_bbox = None
    main_sampling_bbox = main_diff_bbox if main_diff_bbox is not None else bg1_bbox

    shift_rows = per_row_best_shifts(bg1_visible_pixels, no_oam, bg1_width, bg1_bbox, args.shift_limit)
    shift_scan_rows = []
    best_shift = 0
    best_shift_mismatch = None
    for shift in range(-args.shift_limit, args.shift_limit + 1):
        mismatch = shifted_bbox_mismatch(bg1_visible_pixels, no_oam, bg1_width, bg1_bbox, shift)
        shift_scan_rows.append({"shift": shift, "mismatchPixels": mismatch})
        if best_shift_mismatch is None or mismatch < best_shift_mismatch:
            best_shift = shift
            best_shift_mismatch = mismatch

    report = {
        "schema": "td2.mode7_plateau_analysis.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "title": "Canonical Mode 7 plateau analysis",
        "compareSummaryPath": str(compare_summary_path),
        "designFrameRoots": [str(path.resolve()) for path in args.design_frame_roots],
        "mode7LineBias": int(args.mode7_line_bias),
        "plateau": {
            "startFrame": int(plateau_rows[0]["frame"]),
            "endFrame": int(plateau_rows[-1]["frame"]),
            "count": len(plateau_rows),
            "identityKeys": list(PLATEAU_IDENTITY_KEYS),
            "bg1VisibleIdentity": {
                "distinctCount": len({row["bg1VisibleSha1"] for row in bg1_rows}),
                "sha1Ranges": collapse_value_ranges(bg1_rows, "bg1VisibleSha1"),
            },
        },
        "canonicalFrame": {
            "frame": canonical_frame,
            "frameDir": str(canonical_frame_dir),
            "designFrameDir": str(canonical_design_dir),
            "mainDiffBBox": main_diff_bbox,
            "mainSamplingBBox": main_sampling_bbox,
            "mainVisibleCompare": {
                "mode7PpuMismatchPixels": int(canonical_row["baseRenderMismatch"]),
                "simpleMismatchPixels": simple_main_compare["mismatchPixels"],
                "noOamMismatchPixels": no_oam_main_compare["mismatchPixels"],
            },
            "bg1VisibleCompare": bg1_compare,
            "spriteOverlap": (
                compute_sprite_overlap(sprites_visible_json, main_diff_bbox)
                if main_diff_bbox is not None
                else None
            ),
        },
        "bgOnlyShiftScan": {
            "bbox": bg1_bbox,
            "shiftLimit": args.shift_limit,
            "zeroShiftMismatchPixels": next(
                row["mismatchPixels"] for row in shift_scan_rows if row["shift"] == 0
            ),
            "bestShift": best_shift,
            "bestShiftMismatchPixels": best_shift_mismatch,
            "rows": shift_scan_rows,
        },
        "mode7HscrollDeltaScan": {
            "baseHscroll": int(canonical_state.get("ppu.mode7.hscroll", 0)),
            "bestBg1Delta": best_bg1_delta,
            "bestBg1MismatchPixels": best_bg1_mismatch,
            "bestMainDelta": best_main_delta,
            "bestMainMismatchPixels": best_main_mismatch,
            "rows": hscroll_scan_rows,
        },
        "mode7WindowSampling": {
            "mainBase": compute_mode7_window_sampling_stats(canonical_state, main_sampling_bbox),
            "bg1Base": compute_mode7_window_sampling_stats(canonical_state, bg1_bbox),
            "bg1BestBgDelta": compute_mode7_window_sampling_stats(
                canonical_state,
                bg1_bbox,
                hscroll_override=int(canonical_state.get("ppu.mode7.hscroll", 0)) + int(best_bg1_delta),
            ),
            "mainBestMainDelta": compute_mode7_window_sampling_stats(
                canonical_state,
                main_sampling_bbox,
                hscroll_override=int(canonical_state.get("ppu.mode7.hscroll", 0)) + int(best_main_delta),
            ),
        },
        "bgOnlyPerRowBestShiftCounts": summarize_shift_counts(shift_rows),
        "bgOnlyPerRowBestShifts": shift_rows,
    }

    out_json = args.out_json.resolve()
    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        args.markdown_out.resolve().write_text(render_markdown(report) + "\n", encoding="utf-8")
    print(
        f"wrote mode7 plateau analysis -> {out_json} "
        f"(canonical {canonical_frame}, plateau {plateau_rows[0]['frame']}..{plateau_rows[-1]['frame']})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
