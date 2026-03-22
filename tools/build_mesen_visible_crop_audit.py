#!/usr/bin/env python3
"""Audit whether Mesen `*_visible.ppm` exports are scroll crops of `*.ppm`."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
from pathlib import Path

from build_mesen_window_compare import analyze_mismatch
from compare_frames import load_ppm


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Verify that a Mesen bridge `*_visible.ppm` export is exactly the "
            "wrap-cropped viewport of the full layer `*.ppm` using the layer "
            "metadata scroll state."
        )
    )
    parser.add_argument("out_json", type=Path, help="output JSON report path")
    parser.add_argument(
        "design_frame_dirs",
        nargs="+",
        type=Path,
        help="one or more design-pack frame directories",
    )
    parser.add_argument(
        "--layer",
        default="bg1",
        help="layer stem to audit (default: %(default)s)",
    )
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown report path")
    return parser.parse_args()


def load_json(path: Path) -> dict:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def parse_frame_number(path: Path) -> int | None:
    match = re.search(r"(\d+)", path.name)
    if match is None:
        return None
    return int(match.group(1))


def normalize_scroll(scroll: int, size: int) -> int:
    if size == 0:
        return 0
    normalized = scroll & 0x03FF
    if normalized == 0x03FF:
        normalized = 0
    return normalized % size


def crop_visible_region(
    pixels: bytes,
    source_width: int,
    source_height: int,
    scroll_x: int,
    scroll_y: int,
    output_width: int,
    output_height: int,
) -> bytes:
    output = bytearray(output_width * output_height * 3)
    for y in range(output_height):
        src_y = (scroll_y + y) % source_height
        for x in range(output_width):
            src_x = (scroll_x + x) % source_width
            src_offset = (src_y * source_width + src_x) * 3
            dst_offset = (y * output_width + x) * 3
            output[dst_offset:dst_offset + 3] = pixels[src_offset:src_offset + 3]
    return bytes(output)


def render_markdown(report: dict) -> str:
    lines = [
        f"# {report['title']}",
        "",
        f"- layer: `{report['layer']}`",
        f"- frames audited: `{len(report['rows'])}`",
        f"- exact matches: `{report['exactMatchCount']}` / `{len(report['rows'])}`",
        "",
        "| frame | full size | visible size | scroll raw | scroll normalized | mismatch | bbox |",
        "|---:|---|---|---|---|---:|---|",
    ]
    for row in report["rows"]:
        bbox = row["compare"]["bbox"]
        bbox_label = (
            f"{bbox['x0']},{bbox['y0']} -> {bbox['x1']},{bbox['y1']}"
            if isinstance(bbox, dict)
            else "-"
        )
        lines.append(
            f"| `{row['frame']}` | `{row['fullSize']['width']}x{row['fullSize']['height']}` | "
            f"`{row['visibleSize']['width']}x{row['visibleSize']['height']}` | "
            f"`{row['scrollRaw']['x']},{row['scrollRaw']['y']}` | "
            f"`{row['scrollNormalized']['x']},{row['scrollNormalized']['y']}` | "
            f"`{row['compare']['mismatchPixels']}` | `{bbox_label}` |"
        )
    lines.extend(
        [
            "",
            "## Reading",
            "",
            "- `0` mismatched pixels means the bridge `*_visible.ppm` is exactly the wrap-cropped viewport of the full `*.ppm` layer render.",
            "- This validates the extractor-side semantics independently of the renderer and supports treating `layers/bg1_visible.ppm` as a viewer/export surface rather than an on-screen contribution target.",
        ]
    )
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    rows: list[dict] = []

    for frame_dir_arg in args.design_frame_dirs:
        frame_dir = frame_dir_arg.resolve()
        layer_dir = frame_dir / "layers"
        layer_json_path = layer_dir / f"{args.layer}.json"
        full_ppm_path = layer_dir / f"{args.layer}.ppm"
        visible_ppm_path = layer_dir / f"{args.layer}_visible.ppm"

        metadata = load_json(layer_json_path)
        tilemap = metadata.get("tilemap")
        visible_size = metadata.get("visibleSize")
        if not isinstance(tilemap, dict) or not isinstance(visible_size, dict):
            raise SystemExit(f"error: incomplete layer metadata in {layer_json_path}")

        full_width, full_height, full_pixels = load_ppm(full_ppm_path)
        visible_width, visible_height, visible_pixels = load_ppm(visible_ppm_path)

        if visible_width != int(visible_size["width"]) or visible_height != int(visible_size["height"]):
            raise SystemExit(
                f"error: visible size mismatch for {frame_dir}: "
                f"ppm={visible_width}x{visible_height} metadata={visible_size}"
            )

        scroll_raw_x = int(tilemap.get("scrollX", 0))
        scroll_raw_y = int(tilemap.get("scrollY", 0))
        scroll_x = normalize_scroll(scroll_raw_x, full_width)
        scroll_y = normalize_scroll(scroll_raw_y, full_height)

        cropped_pixels = crop_visible_region(
            full_pixels,
            full_width,
            full_height,
            scroll_x,
            scroll_y,
            visible_width,
            visible_height,
        )
        compare = analyze_mismatch(visible_pixels, cropped_pixels, visible_width)

        rows.append(
            {
                "frame": parse_frame_number(frame_dir),
                "frameDir": str(frame_dir),
                "layer": args.layer,
                "fullSize": {"width": full_width, "height": full_height},
                "visibleSize": {"width": visible_width, "height": visible_height},
                "scrollRaw": {"x": scroll_raw_x, "y": scroll_raw_y},
                "scrollNormalized": {"x": scroll_x, "y": scroll_y},
                "compare": compare,
                "exactMatch": int(compare["mismatchPixels"]) == 0,
            }
        )

    rows.sort(key=lambda row: (-1 if row["frame"] is None else int(row["frame"])))
    report = {
        "schema": "td2.mesen_visible_crop_audit.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "title": "Mesen visible crop audit",
        "layer": args.layer,
        "rows": rows,
        "exactMatchCount": sum(1 for row in rows if bool(row["exactMatch"])),
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(report, indent=2), encoding="utf-8")
    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(report) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
