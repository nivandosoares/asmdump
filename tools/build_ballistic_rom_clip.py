#!/usr/bin/env python3
"""Build a ROM-derived Ballistic indexed animation clip from the A39C palette callback."""

from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path


BALLISTIC_RAMP_BANK = 0x04
BALLISTIC_RAMP_ADDR = 0x99ED
BALLISTIC_DYNAMIC_START = 2
BALLISTIC_DYNAMIC_COUNT = 14
BALLISTIC_COUNTER_WRAP = 13


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a ROM-derived Ballistic indexed animation clip from helper-scene CGRAM and the A39C ramp."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("helper_cgram", type=Path, help="initial helper-scene CGRAM dump")
    parser.add_argument(
        "measured_clip_json",
        type=Path,
        help="measured indexed animation JSON used only to infer class-to-CGRAM mapping",
    )
    parser.add_argument("out_manifest", type=Path, help="output indexed animation manifest path")
    parser.add_argument("--json-out", type=Path, help="optional JSON summary path")
    parser.add_argument("--preview-out", type=Path, help="optional first-frame preview PPM path")
    parser.add_argument("--sequence-manifest", type=Path, help="optional one-entry runtime sequence manifest path")
    return parser.parse_args()


def lorom_offset(bank: int, addr: int) -> int:
    if addr < 0x8000:
        raise ValueError(f"invalid LoROM address {bank:02X}:{addr:04X}")
    return (bank * 0x8000) + (addr - 0x8000)


def snes_word_to_rgb(word: int) -> list[int]:
    red = word & 0x1F
    green = (word >> 5) & 0x1F
    blue = (word >> 10) & 0x1F
    return [
        (red << 3) | (red >> 2),
        (green << 3) | (green >> 2),
        (blue << 3) | (blue >> 2),
    ]


def cgram_entry_rgb(cgram: bytes, index: int) -> tuple[int, int, int]:
    offset = index * 2
    word = cgram[offset] | (cgram[offset + 1] << 8)
    rgb = snes_word_to_rgb(word)
    return (rgb[0], rgb[1], rgb[2])


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


def build_dynamic_cgrams(rom_bytes: bytes, initial_cgram: bytes, timeline_length: int) -> list[bytes]:
    if len(initial_cgram) != 0x200:
        raise ValueError(f"expected 512-byte CGRAM dump, got {len(initial_cgram)} bytes")

    ramp_offset = lorom_offset(BALLISTIC_RAMP_BANK, BALLISTIC_RAMP_ADDR)
    ramp_words = [
        struct.unpack_from("<H", rom_bytes, ramp_offset + (i * 2))[0]
        for i in range(0x100)
    ]

    cgrams = [bytes(initial_cgram)]
    current = bytearray(initial_cgram)
    counter_value = 0

    for _ in range(1, timeline_length):
        start_word = counter_value + 2
        for color_index in range(BALLISTIC_DYNAMIC_COUNT):
            word = ramp_words[start_word + color_index]
            cgram_offset = (BALLISTIC_DYNAMIC_START + color_index) * 2
            current[cgram_offset] = word & 0xFF
            current[cgram_offset + 1] = (word >> 8) & 0xFF
        cgrams.append(bytes(current))

        counter_value -= 1
        if counter_value < 0:
            counter_value = BALLISTIC_COUNTER_WRAP

    return cgrams


def candidate_timelines(cgrams: list[bytes]) -> dict[int, tuple[tuple[int, int, int], ...]]:
    timelines: dict[int, tuple[tuple[int, int, int], ...]] = {}
    for cgram_index in range(256):
        timelines[cgram_index] = tuple(
            cgram_entry_rgb(cgram, cgram_index)
            for cgram in cgrams
        )
    return timelines


def infer_class_mapping(measured_entries: list[dict], cgram_timelines: dict[int, tuple[tuple[int, int, int], ...]]) -> dict[int, int]:
    measured_class_count = len(measured_entries[0]["palette"])
    measured_timelines = {
        class_index: tuple(tuple(entry["palette"][class_index]) for entry in measured_entries)
        for class_index in range(measured_class_count)
    }
    black = (0, 0, 0)
    mapping = {0: 0}

    for class_index in range(1, measured_class_count):
        measured = measured_timelines[class_index]
        if measured[0] != black:
            raise ValueError(f"class {class_index} does not start black in the measured clip")

        exact_suffix_matches = [
            cgram_index
            for cgram_index, timeline in cgram_timelines.items()
            if tuple(timeline[1:]) == tuple(measured[1:])
        ]
        if not exact_suffix_matches:
            raise ValueError(f"could not infer a ROM CGRAM mapping for class {class_index}")

        changes_after_first = any(color != measured[1] for color in measured[2:])
        if changes_after_first:
            preferred = [index for index in exact_suffix_matches if 2 <= index <= 15]
            if preferred:
                mapping[class_index] = min(preferred)
                continue

        preferred = [index for index in exact_suffix_matches if index >= 32]
        if preferred:
            mapping[class_index] = min(preferred)
            continue

        mapping[class_index] = min(exact_suffix_matches)

    return mapping


def build_palette_entries(
    measured_entries: list[dict],
    mapping: dict[int, int],
    cgram_timelines: dict[int, tuple[tuple[int, int, int], ...]],
) -> list[dict]:
    palette_entries = []
    class_count = len(measured_entries[0]["palette"])

    for frame_index, measured_entry in enumerate(measured_entries):
        palette = []
        for class_index in range(class_count):
            if class_index == 0 or frame_index == 0:
                palette.append([0, 0, 0])
            else:
                cgram_index = mapping[class_index]
                color = cgram_timelines[cgram_index][frame_index]
                palette.append([color[0], color[1], color[2]])

        palette_entries.append({
            "frame": int(measured_entry["frame"]),
            "duration_frames": int(measured_entry["duration_frames"]),
            "palette": palette,
        })

    return palette_entries


def write_manifest(
    out_manifest: Path,
    indices_path: Path,
    palette_entries: list[dict],
) -> None:
    palette_count = len(palette_entries[0]["palette"])
    lines = [
        "# indexed palette animation",
        "size 256 224",
        f"indices {relpath(indices_path, out_manifest)}",
        f"palette_count {palette_count}",
    ]

    for entry in palette_entries:
        flat_palette = " ".join(
            str(channel)
            for color in entry["palette"]
            for channel in color
        )
        lines.append(f"frame {entry['duration_frames']} {flat_palette}")

    out_manifest.parent.mkdir(parents=True, exist_ok=True)
    out_manifest.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    initial_cgram = args.helper_cgram.read_bytes()
    measured = json.loads(args.measured_clip_json.read_text(encoding="utf-8"))
    measured_entries = measured["entries"]

    measured_dir = args.measured_clip_json.resolve().parent
    measured_indices = measured_dir / measured["indices"]
    indices_data = measured_indices.read_bytes()
    if len(indices_data) != (256 * 224):
        raise SystemExit(
            f"error: expected 57344 bytes of indexed image data, got {len(indices_data)}"
        )

    cgrams = build_dynamic_cgrams(rom_bytes, initial_cgram, len(measured_entries))
    cgram_timelines = candidate_timelines(cgrams)
    mapping = infer_class_mapping(measured_entries, cgram_timelines)
    palette_entries = build_palette_entries(measured_entries, mapping, cgram_timelines)

    indices_path = args.out_manifest.with_name(args.out_manifest.stem + "_indices.bin")
    indices_path.parent.mkdir(parents=True, exist_ok=True)
    indices_path.write_bytes(indices_data)
    write_manifest(args.out_manifest, indices_path, palette_entries)

    if args.preview_out:
        preview_rgb = bytearray(256 * 224 * 3)
        first_visible_palette = palette_entries[1]["palette"] if len(palette_entries) > 1 else palette_entries[0]["palette"]
        for pixel_index, class_index in enumerate(indices_data):
            color = first_visible_palette[class_index]
            dst = pixel_index * 3
            preview_rgb[dst:dst + 3] = bytes(color)
        write_ppm(args.preview_out, 256, 224, bytes(preview_rgb))

    if args.sequence_manifest:
        total_duration = sum(entry["duration_frames"] for entry in palette_entries)
        args.sequence_manifest.parent.mkdir(parents=True, exist_ok=True)
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
                    "source": {
                        "rom": str(args.rom.resolve()),
                        "helper_cgram": str(args.helper_cgram.resolve()),
                        "measured_clip_json": str(args.measured_clip_json.resolve()),
                    },
                    "mapping": [
                        {"class_index": class_index, "cgram_index": mapping[class_index]}
                        for class_index in sorted(mapping)
                    ],
                    "timeline_entry_count": len(palette_entries),
                    "total_duration_frames": sum(entry["duration_frames"] for entry in palette_entries),
                    "indices": relpath(indices_path, args.json_out),
                    "entries": palette_entries,
                },
                indent=2,
            ) + "\n",
            encoding="utf-8",
        )

    print(
        f"wrote ROM-derived Ballistic clip {args.out_manifest} "
        f"({len(palette_entries)} palette frames)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
