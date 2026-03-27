#!/usr/bin/env python3

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

from compare_frames import compare_images, load_image


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare two screenshot capture directories frame-by-frame and "
            "summarize first divergence plus adjacent motion."
        )
    )
    parser.add_argument("base_dir", type=Path, help="base capture directory")
    parser.add_argument("candidate_dir", type=Path, help="candidate capture directory")
    parser.add_argument("out_json", type=Path, help="output JSON path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown summary path")
    parser.add_argument("--base-label", default="base", help="label for base capture")
    parser.add_argument("--candidate-label", default="candidate", help="label for candidate capture")
    parser.add_argument("--script-start-frame", type=int, default=0, help="script frame mapped to capture index 0")
    parser.add_argument("--max-listed-frames", type=int, default=16, help="max differing frames to list in Markdown")
    return parser.parse_args()


def load_capture_frames(capture_dir: Path) -> list[dict[str, Any]]:
    frames: list[dict[str, Any]] = []
    for path in sorted(capture_dir.glob("capture_frame_*.png")):
        width, height, rgb = load_image(path)
        frames.append(
            {
                "name": path.name,
                "path": str(path.resolve()),
                "width": width,
                "height": height,
                "rgb": rgb,
                "hash": hashlib.sha256(rgb).hexdigest(),
            }
        )
    if not frames:
        raise ValueError(f"no capture frames found in {capture_dir}")
    return frames


def build_bbox(rgb_a: bytes, rgb_b: bytes, width: int, height: int) -> list[int] | None:
    xmin = ymin = xmax = ymax = None
    for y in range(height):
        for x in range(width):
            pixel = (y * width + x) * 3
            if rgb_a[pixel:pixel + 3] == rgb_b[pixel:pixel + 3]:
                continue
            if xmin is None:
                xmin = xmax = x
                ymin = ymax = y
            else:
                xmin = min(xmin, x)
                ymin = min(ymin, y)
                xmax = max(xmax, x)
                ymax = max(ymax, y)
    if xmin is None:
        return None
    return [xmin, ymin, xmax, ymax]


def first_adjacent_motion(frames: list[dict[str, Any]], script_start_frame: int) -> dict[str, Any] | None:
    for index in range(1, len(frames)):
        prev_frame = frames[index - 1]
        cur_frame = frames[index]
        metrics = compare_images(prev_frame["rgb"], cur_frame["rgb"])
        if metrics["mismatch_pixels"] == 0:
            continue
        return {
            "from_capture_index": index - 1,
            "to_capture_index": index,
            "from_script_frame": script_start_frame + index - 1,
            "to_script_frame": script_start_frame + index,
            "mismatch_pixels": metrics["mismatch_pixels"],
            "bbox": build_bbox(prev_frame["rgb"], cur_frame["rgb"], prev_frame["width"], prev_frame["height"]),
        }
    return None


def compare_sequences(
    base_frames: list[dict[str, Any]],
    candidate_frames: list[dict[str, Any]],
    script_start_frame: int,
) -> dict[str, Any]:
    if len(base_frames) != len(candidate_frames):
        raise ValueError(
            f"capture count mismatch: {len(base_frames)} vs {len(candidate_frames)}"
        )

    first_divergence = None
    differing_frames: list[dict[str, Any]] = []

    for index, (base_frame, candidate_frame) in enumerate(zip(base_frames, candidate_frames)):
        if (base_frame["width"], base_frame["height"]) != (
            candidate_frame["width"],
            candidate_frame["height"],
        ):
            raise ValueError(
                f"frame size mismatch at capture {index}: "
                f"{base_frame['width']}x{base_frame['height']} vs "
                f"{candidate_frame['width']}x{candidate_frame['height']}"
            )

        metrics = compare_images(base_frame["rgb"], candidate_frame["rgb"])
        entry = {
            "capture_index": index,
            "script_frame": script_start_frame + index,
            "same": base_frame["hash"] == candidate_frame["hash"],
            "mismatch_pixels": metrics["mismatch_pixels"],
            "bbox": build_bbox(
                base_frame["rgb"],
                candidate_frame["rgb"],
                base_frame["width"],
                base_frame["height"],
            ),
        }
        if not entry["same"]:
            differing_frames.append(entry)
            if first_divergence is None:
                first_divergence = entry

    return {
        "capture_count": len(base_frames),
        "first_divergence": first_divergence,
        "differing_frames": differing_frames,
        "base_first_adjacent_motion": first_adjacent_motion(base_frames, script_start_frame),
        "candidate_first_adjacent_motion": first_adjacent_motion(candidate_frames, script_start_frame),
    }


def build_markdown(summary: dict[str, Any], max_listed_frames: int) -> str:
    lines: list[str] = []
    lines.append("# Capture Sequence Compare")
    lines.append("")
    lines.append(f"- `{summary['base_label']}`: `{summary['base_dir']}`")
    lines.append(f"- `{summary['candidate_label']}`: `{summary['candidate_dir']}`")
    lines.append(f"- capture count: `{summary['capture_count']}`")
    lines.append(f"- script start frame: `{summary['script_start_frame']}`")
    lines.append("")
    lines.append("## First Divergence")
    lines.append("")
    first_divergence = summary["first_divergence"]
    if first_divergence is None:
        lines.append("- none")
    else:
        lines.append(f"- capture index: `{first_divergence['capture_index']}`")
        lines.append(f"- script frame: `{first_divergence['script_frame']}`")
        lines.append(f"- mismatch pixels: `{first_divergence['mismatch_pixels']}`")
        lines.append(f"- bbox: `{first_divergence['bbox']}`")
    lines.append("")

    for title, key in (
        (summary["base_label"], "base_first_adjacent_motion"),
        (summary["candidate_label"], "candidate_first_adjacent_motion"),
    ):
        lines.append(f"## First Adjacent Motion: {title}")
        lines.append("")
        entry = summary[key]
        if entry is None:
            lines.append("- none")
        else:
            lines.append(
                f"- step: `{entry['from_script_frame']} -> {entry['to_script_frame']}`"
            )
            lines.append(f"- mismatch pixels: `{entry['mismatch_pixels']}`")
            lines.append(f"- bbox: `{entry['bbox']}`")
        lines.append("")

    lines.append("## Differing Frames")
    lines.append("")
    listed = summary["differing_frames"][:max_listed_frames]
    if not listed:
        lines.append("- none")
    else:
        for row in listed:
            lines.append(
                f"- `{row['script_frame']}`: mismatch `{row['mismatch_pixels']}`, "
                f"bbox `{row['bbox']}`"
            )
    return "\n".join(lines) + "\n"


def main() -> None:
    args = parse_args()
    base_frames = load_capture_frames(args.base_dir)
    candidate_frames = load_capture_frames(args.candidate_dir)
    summary = compare_sequences(base_frames, candidate_frames, args.script_start_frame)
    summary.update(
        {
            "base_label": args.base_label,
            "candidate_label": args.candidate_label,
            "base_dir": str(args.base_dir.resolve()),
            "candidate_dir": str(args.candidate_dir.resolve()),
            "script_start_frame": args.script_start_frame,
        }
    )
    args.out_json.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    if args.markdown_out is not None:
        args.markdown_out.write_text(
            build_markdown(summary, args.max_listed_frames),
            encoding="utf-8",
        )


if __name__ == "__main__":
    main()
