#!/usr/bin/env python3
"""Build a runtime scene-sequence manifest from flat Mesen BG range dumps."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from compare_frames import load_png


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build a sequence.txt manifest from flat *_frame_XXXXX_{vram,cgram,ppu_state}. dumps."
    )
    parser.add_argument("summary_json", type=Path, help="Summary JSON produced by validation/mesen_dump_bg_range.lua.")
    parser.add_argument("out_manifest", type=Path, help="Output sequence manifest path.")
    parser.add_argument("--json-out", type=Path, help="Optional JSON summary path.")
    parser.add_argument(
        "--end-frame-exclusive",
        type=int,
        help="Exclusive end frame for the sequence. Defaults to last captured frame plus the summary step.",
    )
    parser.add_argument(
        "--no-collapse-identical",
        action="store_true",
        help="Keep adjacent identical scenes as separate entries.",
    )
    parser.add_argument(
        "--prefer-screenshot",
        action="store_true",
        help="Build `image` entries from PNG screenshots instead of `snes_bg` entries from VRAM/CGRAM/state.",
    )
    parser.add_argument(
        "--image-dir",
        type=Path,
        help="Directory for converted PPM screenshots when --prefer-screenshot is enabled. Defaults beside the manifest.",
    )
    return parser.parse_args()


def file_hash(*paths: Path) -> str:
    digest = hashlib.sha256()
    for path in paths:
        digest.update(path.read_bytes())
    return digest.hexdigest()


def relpath(path: Path, base: Path) -> str:
    return path.resolve().relative_to(base.resolve()).as_posix() if path.resolve().is_relative_to(base.resolve()) else path.resolve().as_posix()


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def main() -> int:
    args = parse_args()
    summary = json.loads(args.summary_json.read_text(encoding="utf-8"))
    captured = summary.get("captured", [])
    step = int(summary.get("step", 1))

    if not captured:
        raise SystemExit("error: summary has no captured frames")

    entries = []
    for item in captured:
        entry = {"frame": int(item["frame"])}
        if args.prefer_screenshot:
            screenshot = item.get("screenshot")
            if not screenshot:
                raise SystemExit("error: summary does not contain screenshot paths but --prefer-screenshot was requested")
            entry["screenshot"] = Path(screenshot)
        else:
            entry["vram"] = Path(item["vram"])
            entry["cgram"] = Path(item["cgram"])
            entry["ppu_state"] = Path(item["ppu_state"])
            if item.get("oam"):
                entry["oam"] = Path(item["oam"])
        entries.append(entry)

    entries.sort(key=lambda item: item["frame"])
    end_frame_exclusive = args.end_frame_exclusive
    if end_frame_exclusive is None:
        end_frame_exclusive = entries[-1]["frame"] + step

    manifest_dir = args.out_manifest.resolve().parent
    image_dir = args.image_dir.resolve() if args.image_dir else (manifest_dir / (args.out_manifest.stem + "_images"))
    playback_entries = []

    for index, entry in enumerate(entries):
        next_frame = end_frame_exclusive if index == (len(entries) - 1) else entries[index + 1]["frame"]
        duration = next_frame - entry["frame"]
        if duration <= 0:
            raise SystemExit(f"error: non-positive duration around frame {entry['frame']}")

        if args.prefer_screenshot:
            width, height, rgb = load_png(entry["screenshot"])
            ppm_path = image_dir / f"frame_{entry['frame']:05d}.ppm"
            write_ppm(ppm_path, width, height, rgb)
            digest = hashlib.sha256(rgb).hexdigest()
            playback_entry = {
                "type": "image",
                "frame": entry["frame"],
                "duration_frames": duration,
                "hash": digest,
                "source_frames": [entry["frame"]],
                "image": relpath(ppm_path, manifest_dir),
                "screenshot": str(entry["screenshot"]),
            }
        else:
            digest_paths = [entry["vram"], entry["cgram"], entry["ppu_state"]]
            if entry.get("oam") is not None:
                digest_paths.append(entry["oam"])
            digest = file_hash(*digest_paths)
            playback_entry = {
                "type": "snes_bg",
                "frame": entry["frame"],
                "duration_frames": duration,
                "hash": digest,
                "source_frames": [entry["frame"]],
                "vram": relpath(entry["vram"], manifest_dir),
                "cgram": relpath(entry["cgram"], manifest_dir),
                "ppu_state": relpath(entry["ppu_state"], manifest_dir),
            }
            if entry.get("oam") is not None:
                playback_entry["oam"] = relpath(entry["oam"], manifest_dir)

        if (
            not args.no_collapse_identical
            and playback_entries
            and playback_entries[-1]["hash"] == digest
        ):
            playback_entries[-1]["duration_frames"] += duration
            playback_entries[-1]["source_frames"].append(entry["frame"])
            continue

        playback_entries.append(playback_entry)

    lines = ["# type duration_frames path_a [path_b path_c path_d]"]
    for entry in playback_entries:
        if entry["type"] == "image":
            lines.append(
                "image {duration} {image}".format(
                    duration=entry["duration_frames"],
                    image=entry["image"],
                )
            )
        else:
            line = "snes_bg {duration} {vram} {cgram} {state}".format(
                duration=entry["duration_frames"],
                vram=entry["vram"],
                cgram=entry["cgram"],
                state=entry["ppu_state"],
            )
            if entry.get("oam") is not None:
                line += f" {entry['oam']}"
            lines.append(line)
        

    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    args.out_manifest.write_text("\n".join(lines) + "\n", encoding="utf-8")

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(
            json.dumps(
                {
                    "summary_json": str(args.summary_json.resolve()),
                    "end_frame_exclusive": end_frame_exclusive,
                    "collapse_identical": not args.no_collapse_identical,
                    "entries": playback_entries,
                    "total_duration_frames": sum(entry["duration_frames"] for entry in playback_entries),
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )

    print(
        f"wrote {len(playback_entries)} sequence entries to {args.out_manifest} "
        f"(total {sum(entry['duration_frames'] for entry in playback_entries)} frames)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
