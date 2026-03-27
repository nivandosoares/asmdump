#!/usr/bin/env python3
"""Build a runtime image-sequence manifest from mesen_capture.lua screenshots."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

from compare_frames import load_png


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a sequence.txt manifest from validation/mesen_capture.lua "
            "capture_input_log.json output plus its sibling capture_frame_XXXXX.png files."
        )
    )
    parser.add_argument("capture_log_json", type=Path, help="capture_input_log.json path")
    parser.add_argument("out_manifest", type=Path, help="output sequence manifest path")
    parser.add_argument("--json-out", type=Path, help="optional JSON summary output path")
    parser.add_argument(
        "--start-frame",
        type=int,
        help="first script frame to include (default: earliest screenshot-backed frame)",
    )
    parser.add_argument(
        "--end-frame-exclusive",
        type=int,
        help="exclusive end frame to include (default: last screenshot-backed frame + screenshot_every)",
    )
    parser.add_argument(
        "--no-collapse-identical",
        action="store_true",
        help="keep adjacent identical screenshots as separate manifest entries",
    )
    parser.add_argument(
        "--image-dir",
        type=Path,
        help="directory for converted PPM screenshots (default: beside the manifest)",
    )
    parser.add_argument(
        "--screenshot-prefix",
        default=None,
        help=(
            "override screenshot file prefix stem if it differs from the log prefix "
            "(default: derive from *_input_log.json)"
        ),
    )
    return parser.parse_args()


def relpath(path: Path, base: Path) -> str:
    try:
        return path.resolve().relative_to(base.resolve().parent).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def derive_screenshot_stem(log_path: Path, explicit_prefix: str | None) -> str:
    if explicit_prefix:
        return explicit_prefix
    suffix = "_input_log"
    if log_path.stem.endswith(suffix):
        return log_path.stem[: -len(suffix)]
    return log_path.stem


def load_capture_entries(
    capture_log_json: Path,
    screenshot_stem: str,
    start_frame: int | None,
    end_frame_exclusive: int | None,
) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    payload = json.loads(capture_log_json.read_text(encoding="utf-8"))
    screenshot_every = int(payload.get("screenshot_every", 1))
    raw_frames = payload.get("frames", [])
    if not isinstance(raw_frames, list):
        raise SystemExit(f"error: invalid capture log payload: {capture_log_json}")

    entries: list[dict[str, Any]] = []
    for item in raw_frames:
        if not isinstance(item, dict):
            continue
        frame = int(item.get("frame", -1))
        if start_frame is not None and frame < start_frame:
            continue
        if end_frame_exclusive is not None and frame >= end_frame_exclusive:
            continue

        capture_index = int(item.get("capture_index", -1))
        screenshot = capture_log_json.parent / f"{screenshot_stem}_frame_{capture_index:05d}.png"
        if not screenshot.is_file():
            continue

        entries.append(
            {
                "frame": frame,
                "capture_index": capture_index,
                "buttons": list(item.get("buttons", [])),
                "screenshot": screenshot,
            }
        )

    if not entries:
        raise SystemExit(
            "error: no screenshot-backed frames matched the requested range"
        )

    entries.sort(key=lambda item: item["frame"])
    if end_frame_exclusive is None:
        end_frame_exclusive = entries[-1]["frame"] + screenshot_every

    payload["_resolved_end_frame_exclusive"] = end_frame_exclusive
    return payload, entries


def build_playback_entries(
    capture_entries: list[dict[str, Any]],
    end_frame_exclusive: int,
    collapse_identical: bool,
) -> list[dict[str, Any]]:
    playback_entries: list[dict[str, Any]] = []
    for index, entry in enumerate(capture_entries):
        next_frame = end_frame_exclusive if index == (len(capture_entries) - 1) else capture_entries[index + 1]["frame"]
        duration = next_frame - entry["frame"]
        if duration <= 0:
            raise SystemExit(f"error: non-positive duration around frame {entry['frame']}")

        width, height, rgb = load_png(entry["screenshot"])
        digest = hashlib.sha256(rgb).hexdigest()
        playback_entry = {
            "type": "image",
            "frame": entry["frame"],
            "capture_index": entry["capture_index"],
            "duration_frames": duration,
            "hash": digest,
            "width": width,
            "height": height,
            "source_frames": [entry["frame"]],
            "source_capture_indices": [entry["capture_index"]],
            "source_screenshots": [str(entry["screenshot"].resolve())],
            "rgb": rgb,
        }

        if (
            collapse_identical
            and playback_entries
            and playback_entries[-1]["hash"] == digest
        ):
            previous = playback_entries[-1]
            previous["duration_frames"] += duration
            previous["source_frames"].append(entry["frame"])
            previous["source_capture_indices"].append(entry["capture_index"])
            previous["source_screenshots"].append(str(entry["screenshot"].resolve()))
            continue

        playback_entries.append(playback_entry)

    return playback_entries


def write_outputs(
    out_manifest: Path,
    json_out: Path | None,
    image_dir: Path,
    capture_log_json: Path,
    capture_payload: dict[str, Any],
    playback_entries: list[dict[str, Any]],
    collapse_identical: bool,
) -> None:
    manifest_dir = out_manifest.resolve().parent
    image_dir.mkdir(parents=True, exist_ok=True)

    hash_to_image: dict[str, Path] = {}
    manifest_lines = ["# type duration_frames path_a"]
    json_entries: list[dict[str, Any]] = []

    for entry in playback_entries:
        image_path = hash_to_image.get(entry["hash"])
        if image_path is None:
            image_path = image_dir / f"frame_{entry['frame']:05d}.ppm"
            write_ppm(image_path, entry["width"], entry["height"], entry["rgb"])
            hash_to_image[entry["hash"]] = image_path

        manifest_lines.append(
            f"image {entry['duration_frames']} {relpath(image_path, out_manifest)}"
        )
        json_entries.append(
            {
                "type": "image",
                "frame": entry["frame"],
                "capture_index": entry["capture_index"],
                "duration_frames": entry["duration_frames"],
                "hash": entry["hash"],
                "image": relpath(image_path, out_manifest),
                "source_frames": entry["source_frames"],
                "source_capture_indices": entry["source_capture_indices"],
                "source_screenshots": entry["source_screenshots"],
            }
        )

    out_manifest.parent.mkdir(parents=True, exist_ok=True)
    out_manifest.write_text("\n".join(manifest_lines) + "\n", encoding="utf-8")

    if json_out is not None:
        json_out.parent.mkdir(parents=True, exist_ok=True)
        json_out.write_text(
            json.dumps(
                {
                    "capture_log_json": str(capture_log_json.resolve()),
                    "first_frame": json_entries[0]["source_frames"][0],
                    "last_frame_inclusive": json_entries[-1]["source_frames"][-1],
                    "end_frame_exclusive": capture_payload["_resolved_end_frame_exclusive"],
                    "collapse_identical": collapse_identical,
                    "screenshot_every": int(capture_payload.get("screenshot_every", 1)),
                    "input_windows": capture_payload.get("input_windows", []),
                    "selected_screenshot_count": sum(len(entry["source_frames"]) for entry in json_entries),
                    "entry_count": len(json_entries),
                    "distinct_hash_count": len({entry["hash"] for entry in json_entries}),
                    "total_duration_frames": sum(entry["duration_frames"] for entry in json_entries),
                    "entries": json_entries,
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )


def main() -> int:
    args = parse_args()
    capture_log_json = args.capture_log_json.resolve()
    if not capture_log_json.is_file():
        raise SystemExit(f"error: capture log not found: {capture_log_json}")

    screenshot_stem = derive_screenshot_stem(capture_log_json, args.screenshot_prefix)
    capture_payload, capture_entries = load_capture_entries(
        capture_log_json=capture_log_json,
        screenshot_stem=screenshot_stem,
        start_frame=args.start_frame,
        end_frame_exclusive=args.end_frame_exclusive,
    )

    playback_entries = build_playback_entries(
        capture_entries=capture_entries,
        end_frame_exclusive=int(capture_payload["_resolved_end_frame_exclusive"]),
        collapse_identical=not args.no_collapse_identical,
    )

    image_dir = (
        args.image_dir.resolve()
        if args.image_dir is not None
        else args.out_manifest.resolve().parent / (args.out_manifest.stem + "_images")
    )

    write_outputs(
        out_manifest=args.out_manifest.resolve(),
        json_out=args.json_out.resolve() if args.json_out is not None else None,
        image_dir=image_dir,
        capture_log_json=capture_log_json,
        capture_payload=capture_payload,
        playback_entries=playback_entries,
        collapse_identical=not args.no_collapse_identical,
    )

    print(
        f"wrote {len(playback_entries)} capture-sequence entries to {args.out_manifest} "
        f"(total {sum(entry['duration_frames'] for entry in playback_entries)} frames)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
