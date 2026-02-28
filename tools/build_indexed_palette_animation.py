#!/usr/bin/env python3
"""Build an indexed-image + palette-timeline animation from captured screenshots."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from compare_frames import load_png


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Collapse a screenshot range into one indexed image plus a palette timeline."
    )
    parser.add_argument("summary_json", type=Path, help="Summary JSON produced by mesen_dump_bg_range.lua.")
    parser.add_argument("out_manifest", type=Path, help="Output indexed animation manifest path.")
    parser.add_argument("--start-frame", type=int, required=True, help="First source frame to include.")
    parser.add_argument(
        "--end-frame-exclusive",
        type=int,
        required=True,
        help="Exclusive end frame for the animation window.",
    )
    parser.add_argument("--json-out", type=Path, help="Optional JSON summary output path.")
    parser.add_argument(
        "--preview-out",
        type=Path,
        help="Optional preview PPM path for the first reconstructed frame.",
    )
    parser.add_argument(
        "--sequence-manifest",
        type=Path,
        help="Optional one-entry runtime sequence manifest output path.",
    )
    return parser.parse_args()


def relpath(path: Path, base: Path) -> str:
    base_dir = base.resolve().parent
    try:
        return path.resolve().relative_to(base_dir).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def main() -> int:
    args = parse_args()
    summary = json.loads(args.summary_json.read_text(encoding="utf-8"))
    captured = summary.get("captured", [])

    if not captured:
        raise SystemExit("error: summary has no captured frames")

    selected = [
        item for item in captured
        if args.start_frame <= int(item["frame"]) < args.end_frame_exclusive
    ]
    selected.sort(key=lambda item: int(item["frame"]))

    if not selected:
        raise SystemExit("error: no captured frames matched the requested range")

    frames: list[dict] = []
    width = height = None
    for index, item in enumerate(selected):
        frame = int(item["frame"])
        screenshot = item.get("screenshot")
        if not screenshot:
            raise SystemExit("error: selected capture range is missing screenshot paths")

        next_frame = (
            args.end_frame_exclusive
            if index == (len(selected) - 1)
            else int(selected[index + 1]["frame"])
        )
        duration_frames = next_frame - frame
        if duration_frames <= 0:
            raise SystemExit(f"error: non-positive duration near frame {frame}")

        image_width, image_height, rgb = load_png(Path(screenshot))
        if width is None:
            width = image_width
            height = image_height
        elif (image_width, image_height) != (width, height):
            raise SystemExit(
                f"error: image size mismatch at frame {frame}: "
                f"expected {width}x{height}, got {image_width}x{image_height}"
            )

        frames.append({
            "frame": frame,
            "duration_frames": duration_frames,
            "screenshot": Path(screenshot),
            "rgb": rgb,
        })

    assert width is not None
    assert height is not None

    black_timeline = tuple((0, 0, 0) for _ in frames)
    timeline_to_index: dict[tuple[tuple[int, int, int], ...], int] = {black_timeline: 0}
    index_counts: dict[int, int] = {0: 0}
    indexed_pixels = bytearray(width * height)

    for pixel_index in range(width * height):
        offset = pixel_index * 3
        timeline = tuple(
            (
                frame["rgb"][offset + 0],
                frame["rgb"][offset + 1],
                frame["rgb"][offset + 2],
            )
            for frame in frames
        )

        class_index = timeline_to_index.get(timeline)
        if class_index is None:
            class_index = len(timeline_to_index)
            if class_index > 255:
                raise SystemExit(
                    f"error: animation needs {class_index + 1} palette classes, which exceeds 256"
                )
            timeline_to_index[timeline] = class_index
            index_counts[class_index] = 0

        indexed_pixels[pixel_index] = class_index
        index_counts[class_index] += 1

    palette_count = len(timeline_to_index)
    index_to_timeline = [None] * palette_count
    for timeline, class_index in timeline_to_index.items():
        index_to_timeline[class_index] = timeline

    palette_entries = []
    for frame_index, frame in enumerate(frames):
        palette = []
        for class_index in range(palette_count):
            timeline = index_to_timeline[class_index]
            assert timeline is not None
            palette.append(list(timeline[frame_index]))

        palette_entries.append({
            "frame": frame["frame"],
            "duration_frames": frame["duration_frames"],
            "palette": palette,
        })

    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    indices_path = args.out_manifest.with_name(args.out_manifest.stem + "_indices.bin")
    indices_path.write_bytes(indexed_pixels)

    manifest_lines = [
        "# indexed palette animation",
        f"size {width} {height}",
        f"indices {relpath(indices_path, args.out_manifest)}",
        f"palette_count {palette_count}",
    ]
    for entry in palette_entries:
        flat_palette = " ".join(
            str(channel)
            for color in entry["palette"]
            for channel in color
        )
        manifest_lines.append(f"frame {entry['duration_frames']} {flat_palette}")

    args.out_manifest.write_text("\n".join(manifest_lines) + "\n", encoding="utf-8")

    if args.preview_out:
        preview_rgb = bytearray(width * height * 3)
        first_palette = palette_entries[0]["palette"]
        for pixel_index, class_index in enumerate(indexed_pixels):
            color = first_palette[class_index]
            dst = pixel_index * 3
            preview_rgb[dst:dst + 3] = bytes(color)
        write_ppm(args.preview_out, width, height, bytes(preview_rgb))

    if args.sequence_manifest:
        args.sequence_manifest.parent.mkdir(parents=True, exist_ok=True)
        total_duration = sum(entry["duration_frames"] for entry in palette_entries)
        args.sequence_manifest.write_text(
            "# type duration_frames path_a [path_b path_c]\n"
            f"indexed_anim {total_duration} {relpath(args.out_manifest, args.sequence_manifest)}\n",
            encoding="utf-8",
        )

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(
            json.dumps(
                {
                    "summary_json": str(args.summary_json.resolve()),
                    "start_frame": args.start_frame,
                    "end_frame_exclusive": args.end_frame_exclusive,
                    "width": width,
                    "height": height,
                    "palette_count": palette_count,
                    "timeline_entry_count": len(palette_entries),
                    "total_duration_frames": sum(entry["duration_frames"] for entry in palette_entries),
                    "indices": relpath(indices_path, args.json_out),
                    "pixel_class_counts": [
                        {"index": class_index, "pixels": index_counts[class_index]}
                        for class_index in range(palette_count)
                    ],
                    "entries": palette_entries,
                },
                indent=2,
            ) + "\n",
            encoding="utf-8",
        )

    print(
        f"wrote indexed animation {args.out_manifest} "
        f"({palette_count} classes, {len(palette_entries)} palette frames)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
