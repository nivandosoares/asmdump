#!/usr/bin/env python3
"""Decode the front-end long-pointer table used by bank-1 menu helpers.

The recovered bank-1 helpers build a long pointer by overlapping:

  lda #$1E80 ; sta $11
  lda #$8000 ; sta $10

which yields the long base pointer 1E:8000 for `[$10]` lookups in L00179B and
L001662. This tool decodes selected rows from that table, splits each
descriptor into its object list plus descriptor-local 4bpp OBJ blob, and can
render simple monochrome previews of the staged rows.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import asdict, dataclass
from datetime import date
from pathlib import Path
from typing import Iterable

from extract_snes_tiles import decode_tile


DEFAULT_BASE_BANK = 0x1E
DEFAULT_BASE_ADDR = 0x8000
DEFAULT_INDICES = "8-14"
DEFAULT_RENDER_SCALE = 4
DEFAULT_TILE_SHEET_COLUMNS = 16
SCREEN_WIDTH = 256
SCREEN_HEIGHT = 224
TILE_BYTES_4BPP = 32


@dataclass
class DecodedEntry:
    index: int
    entry_bytes: str
    table_file_offset: str
    selector_surface: str
    target_bank: str
    target_addr: str
    target_file_offset: str
    header_words: list[str]
    object_count: int
    header_flags: dict[str, bool]
    first_payload_words: list[str]
    descriptor_blob_tile_count: int
    descriptor_blob_bytes: int
    descriptor_blob_file_offset: str
    descriptor_layout: dict[str, int | str | None]
    objects: list[dict[str, str | int | bool]]
    preview_ppm: str | None
    tile_sheet_ppm: str | None


def parse_indices(spec: str) -> list[int]:
    indices: list[int] = []
    for part in spec.split(","):
        token = part.strip()
        if not token:
            continue
        if "-" in token:
            start_s, end_s = token.split("-", 1)
            start = int(start_s, 0)
            end = int(end_s, 0)
            step = 1 if end >= start else -1
            indices.extend(range(start, end + step, step))
        else:
            indices.append(int(token, 0))
    return indices


def lorom_offset(bank: int, addr: int) -> int:
    if not 0 <= bank <= 0x7F:
        raise ValueError(f"bank out of LoROM range: {bank:#x}")
    if not 0x8000 <= addr <= 0xFFFF:
        raise ValueError(f"addr out of LoROM upper-half range: {addr:#x}")
    return bank * 0x8000 + (addr - 0x8000)


def read_word_le(blob: bytes, offset: int) -> int:
    return blob[offset] | (blob[offset + 1] << 8)


def signed_word(value: int) -> int:
    return value - 0x10000 if value & 0x8000 else value


def selector_surface_for_index(index: int) -> str:
    if 8 <= index <= 10:
        return "front-end rolling-tire helper ($0202 + 0x0008)"
    if 11 <= index <= 14:
        return "track-facing adjacent helper ($1C7C + 0x000B)"
    if 15 <= index <= 17:
        return "top-level signboard labels ($1C6A + 0x000F)"
    if 0x15 <= index <= 0x1B:
        return "front-end control/sound labels"
    return "unclassified current lane"


def decode_descriptor_object(rom: bytes, offset: int, slot: int) -> dict[str, str | int | bool]:
    x = read_word_le(rom, offset)
    y = read_word_le(rom, offset + 2)
    tile_word = read_word_le(rom, offset + 4)
    aux_word = read_word_le(rom, offset + 6)
    return {
        "slot": slot,
        "x": x,
        "y": y,
        "x_signed": signed_word(x),
        "y_signed": signed_word(y),
        "x_word": f"0x{x:04X}",
        "y_word": f"0x{y:04X}",
        "tile_word": f"0x{tile_word:04X}",
        "tile_index": tile_word & 0x00FF,
        "tile_attr_high": f"0x{(tile_word >> 8) & 0x00FF:02X}",
        "horizontal_flip": bool(tile_word & 0x4000),
        "vertical_flip": bool(tile_word & 0x8000),
        "aux_word": f"0x{aux_word:04X}",
    }


def build_descriptor_layout(
    blob_tile_count: int,
    *,
    negative_layout: bool,
) -> dict[str, int | str | None]:
    if not negative_layout or (blob_tile_count & 0x1F) == 0:
        return {
            "kind": "contiguous",
            "blob_tile_count": blob_tile_count,
            "first_segment_tiles": blob_tile_count,
            "second_segment_tiles": 0,
            "second_segment_start_tile": None,
            "staged_tile_count": blob_tile_count,
        }

    first_segment_tiles = (blob_tile_count & ~0x1F) + ((blob_tile_count & 0x1F) >> 1)
    second_segment_tiles = blob_tile_count - first_segment_tiles
    second_segment_start_tile = (first_segment_tiles + 0x0F) & ~0x0F
    return {
        "kind": "split_row_padded",
        "blob_tile_count": blob_tile_count,
        "first_segment_tiles": first_segment_tiles,
        "second_segment_tiles": second_segment_tiles,
        "second_segment_start_tile": second_segment_start_tile,
        "staged_tile_count": second_segment_start_tile + second_segment_tiles,
    }


def stage_descriptor_blob(blob: bytes, layout: dict[str, int | str | None]) -> bytes:
    staged = bytearray(int(layout["staged_tile_count"]) * TILE_BYTES_4BPP)
    first_segment_tiles = int(layout["first_segment_tiles"])
    first_segment_bytes = first_segment_tiles * TILE_BYTES_4BPP
    staged[:first_segment_bytes] = blob[:first_segment_bytes]

    second_segment_tiles = int(layout["second_segment_tiles"])
    if second_segment_tiles:
        second_segment_start_tile = int(layout["second_segment_start_tile"] or 0)
        second_segment_start = second_segment_start_tile * TILE_BYTES_4BPP
        second_segment_bytes = second_segment_tiles * TILE_BYTES_4BPP
        staged[second_segment_start:second_segment_start + second_segment_bytes] = (
            blob[first_segment_bytes:first_segment_bytes + second_segment_bytes]
        )
    return bytes(staged)


def fetch_4bpp_tile(staged_blob: bytes, tile_index: int) -> list[int]:
    start = tile_index * TILE_BYTES_4BPP
    end = start + TILE_BYTES_4BPP
    if end > len(staged_blob):
        return [0] * 64
    return decode_tile(staged_blob[start:end], 4)


def render_descriptor_preview(
    objects: list[dict[str, str | int | bool]],
    staged_blob: bytes,
    *,
    large_sprites: bool,
) -> dict[str, int | bytes]:
    width = 16 if large_sprites else 8
    height = 16 if large_sprites else 8
    padding = 4
    min_x = min(int(row["x_signed"]) for row in objects)
    min_y = min(int(row["y_signed"]) for row in objects)
    max_x = max(int(row["x_signed"]) + width - 1 for row in objects)
    max_y = max(int(row["y_signed"]) + height - 1 for row in objects)
    canvas_width = (max_x - min_x + 1) + (padding * 2)
    canvas_height = (max_y - min_y + 1) + (padding * 2)
    origin_x = padding - min_x
    origin_y = padding - min_y
    rgb = bytearray(canvas_width * canvas_height * 3)
    tile_cache: dict[int, list[int]] = {}

    for row in objects:
        x_pos = int(row["x_signed"]) + origin_x
        y_pos = int(row["y_signed"]) + origin_y
        tile_word = int(str(row["tile_word"]), 16)
        tile_index_base = tile_word & 0x00FF
        horizontal_flip = bool(row["horizontal_flip"])
        vertical_flip = bool(row["vertical_flip"])

        for y_offset in range(height):
            source_y = (height - 1 - y_offset) if vertical_flip else y_offset
            row_offset = source_y >> 3
            pixel_y = source_y & 0x07
            dst_y = y_pos + y_offset
            if dst_y < 0 or dst_y >= canvas_height:
                continue

            for x_offset in range(width):
                source_x = (width - 1 - x_offset) if horizontal_flip else x_offset
                column_offset = source_x >> 3
                pixel_x = source_x & 0x07
                tile_index = (
                    ((((tile_index_base >> 4) + row_offset) & 0x0F) << 4)
                    | (((tile_index_base & 0x0F) + column_offset) & 0x0F)
                )
                tile_pixels = tile_cache.get(tile_index)
                if tile_pixels is None:
                    tile_pixels = fetch_4bpp_tile(staged_blob, tile_index)
                    tile_cache[tile_index] = tile_pixels

                color_index = tile_pixels[(pixel_y * 8) + pixel_x]
                if color_index == 0:
                    continue

                dst_x = x_pos + x_offset
                if dst_x < 0 or dst_x >= canvas_width:
                    continue

                value = min(255, 40 + (color_index * 14))
                dst = ((dst_y * canvas_width) + dst_x) * 3
                rgb[dst:dst + 3] = bytes((value, value, value))
    return {"width": canvas_width, "height": canvas_height, "rgb": bytes(rgb)}


def scale_rgb(rgb: bytes, width: int, height: int, scale: int) -> bytes:
    if scale <= 1:
        return rgb

    scaled_width = width * scale
    scaled_height = height * scale
    scaled = bytearray(scaled_width * scaled_height * 3)
    for y in range(height):
        for x in range(width):
            src = ((y * width) + x) * 3
            pixel = rgb[src:src + 3]
            for y_scale in range(scale):
                for x_scale in range(scale):
                    dst_x = (x * scale) + x_scale
                    dst_y = (y * scale) + y_scale
                    dst = ((dst_y * scaled_width) + dst_x) * 3
                    scaled[dst:dst + 3] = pixel
    return bytes(scaled)


def render_tile_sheet(staged_blob: bytes) -> dict[str, int | bytes]:
    tile_count = len(staged_blob) // TILE_BYTES_4BPP
    columns = DEFAULT_TILE_SHEET_COLUMNS
    rows = max(1, (tile_count + columns - 1) // columns)
    width = columns * 8
    height = rows * 8
    rgb = bytearray(width * height * 3)

    for tile_index in range(tile_count):
        tile_pixels = fetch_4bpp_tile(staged_blob, tile_index)
        tile_x = (tile_index % columns) * 8
        tile_y = (tile_index // columns) * 8
        for pixel_y in range(8):
            for pixel_x in range(8):
                color_index = tile_pixels[(pixel_y * 8) + pixel_x]
                if color_index == 0:
                    continue
                value = min(255, 40 + (color_index * 14))
                dst = (((tile_y + pixel_y) * width) + tile_x + pixel_x) * 3
                rgb[dst:dst + 3] = bytes((value, value, value))

    return {"width": width, "height": height, "rgb": bytes(rgb)}


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as handle:
        handle.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        handle.write(rgb)


def decode_entry(
    rom: bytes,
    *,
    base_bank: int,
    base_addr: int,
    index: int,
    render_dir: Path | None = None,
    render_scale: int = DEFAULT_RENDER_SCALE,
) -> DecodedEntry:
    table_off = lorom_offset(base_bank, base_addr) + index * 4
    entry = rom[table_off:table_off + 4]
    if len(entry) != 4:
        raise ValueError(f"entry {index} truncated at file offset {table_off:#x}")

    low_delta = read_word_le(entry, 0)
    bank_delta_word = read_word_le(entry, 2)

    target_addr_full = base_addr + low_delta
    target_addr = target_addr_full & 0xFFFF
    carry = 1 if target_addr_full > 0xFFFF else 0
    bank_word = (base_bank + bank_delta_word + carry) & 0xFFFF
    target_bank = bank_word & 0xFF

    target_off = lorom_offset(target_bank, target_addr)
    header = [read_word_le(rom, target_off + i) for i in range(0, 8, 2)]
    payload_words = [
        read_word_le(rom, target_off + i)
        for i in range(8, min(24, len(rom) - target_off), 2)
    ]
    object_count = header[0] & 0x0FFF
    object_records_off = target_off + 8
    descriptor_blob_tile_count = header[1]
    descriptor_blob_bytes = descriptor_blob_tile_count * TILE_BYTES_4BPP
    descriptor_blob_off = object_records_off + (object_count * 8)
    descriptor_blob = rom[descriptor_blob_off:descriptor_blob_off + descriptor_blob_bytes]
    if len(descriptor_blob) != descriptor_blob_bytes:
        raise ValueError(
            "descriptor blob truncated for "
            f"{target_bank:02X}:{target_addr:04X}: expected {descriptor_blob_bytes} bytes, "
            f"got {len(descriptor_blob)}"
        )

    objects = [
        decode_descriptor_object(rom, object_records_off + (slot * 8), slot)
        for slot in range(object_count)
    ]
    descriptor_layout = build_descriptor_layout(
        descriptor_blob_tile_count,
        negative_layout=bool(header[0] & 0x8000),
    )

    preview_ppm = None
    tile_sheet_ppm = None
    if render_dir is not None:
        render_dir.mkdir(parents=True, exist_ok=True)
        staged_blob = stage_descriptor_blob(descriptor_blob, descriptor_layout)

        preview_ppm_path = render_dir / f"frontend_row_{index:02d}_preview.ppm"
        preview_ppm = str(preview_ppm_path)
        preview = render_descriptor_preview(
            objects,
            staged_blob,
            large_sprites=bool(header[0] & 0x8000),
        )
        preview_scaled = scale_rgb(
            preview["rgb"],
            int(preview["width"]),
            int(preview["height"]),
            render_scale,
        )
        write_ppm(
            preview_ppm_path,
            int(preview["width"]) * render_scale,
            int(preview["height"]) * render_scale,
            preview_scaled,
        )

        tile_sheet_ppm_path = render_dir / f"frontend_row_{index:02d}_tiles.ppm"
        tile_sheet_ppm = str(tile_sheet_ppm_path)
        tile_sheet = render_tile_sheet(staged_blob)
        write_ppm(
            tile_sheet_ppm_path,
            int(tile_sheet["width"]),
            int(tile_sheet["height"]),
            tile_sheet["rgb"],
        )

    return DecodedEntry(
        index=index,
        entry_bytes=entry.hex(),
        table_file_offset=f"0x{table_off:06X}",
        selector_surface=selector_surface_for_index(index),
        target_bank=f"{target_bank:02X}",
        target_addr=f"0x{target_addr:04X}",
        target_file_offset=f"0x{target_off:06X}",
        header_words=[f"0x{word:04X}" for word in header],
        object_count=object_count,
        header_flags={
            "bit_15_set": bool(header[0] & 0x8000),
            "bit_14_set": bool(header[0] & 0x4000),
            "bit_13_set": bool(header[0] & 0x2000),
            "bit_12_set": bool(header[0] & 0x1000),
        },
        first_payload_words=[f"0x{word:04X}" for word in payload_words],
        descriptor_blob_tile_count=descriptor_blob_tile_count,
        descriptor_blob_bytes=descriptor_blob_bytes,
        descriptor_blob_file_offset=f"0x{descriptor_blob_off:06X}",
        descriptor_layout=descriptor_layout,
        objects=objects,
        preview_ppm=preview_ppm,
        tile_sheet_ppm=tile_sheet_ppm,
    )


def build_report(
    rom_path: Path,
    *,
    base_bank: int,
    base_addr: int,
    indices: Iterable[int],
    render_dir: Path | None = None,
    render_scale: int = DEFAULT_RENDER_SCALE,
) -> dict:
    rom = rom_path.read_bytes()
    entries = [
        asdict(
            decode_entry(
                rom,
                base_bank=base_bank,
                base_addr=base_addr,
                index=index,
                render_dir=render_dir,
                render_scale=render_scale,
            )
        )
        for index in indices
    ]
    return {
        "version": 3,
        "created": date.today().isoformat(),
        "rom": str(rom_path),
        "table_base": {
            "bank": f"{base_bank:02X}",
            "addr": f"0x{base_addr:04X}",
            "file_offset": f"0x{lorom_offset(base_bank, base_addr):06X}",
        },
        "claim": (
            "The bank-1 front-end helpers do not materialize a WRAM table at "
            "$1E80. The overlapping stores to $10/$11/$12 construct the long "
            "ROM pointer 1E:8000, and L00179B/L001662 then dereference rows "
            "from that table directly."
        ),
        "rendering": {
            "render_dir": str(render_dir) if render_dir is not None else None,
            "render_scale": render_scale if render_dir is not None else None,
            "preview_note": (
                "Rendered previews treat nonzero 4bpp pixels as grayscale, "
                "reinterpret descriptor x/y words as signed local offsets, "
                "and normalize the preview origin to the descriptor bounds "
                "before replaying the staged 4bpp OBJ blob."
            ),
        },
        "code_sites": [
            {
                "site": "01:BDF4",
                "selector_expr": "$0202 + 0x0008",
                "helper": "L001662",
                "expected_index_range": [8, 10],
            },
            {
                "site": "01:BE53",
                "selector_expr": "$1C7C + 0x000B",
                "helper": "L00179B",
                "expected_index_range": [11, 14],
            },
            {
                "site": "01:BAC3",
                "selector_expr": "$1C6A + 0x000F",
                "helper": "L00179B",
                "expected_index_range": [15, 17],
            },
        ],
        "entries": entries,
    }


def write_markdown(report: dict, path: Path) -> None:
    lines = [
        "# Front-End Pointer Table Decode",
        "",
        f"- Table base: `{report['table_base']['bank']}:{report['table_base']['addr'][2:]}`",
        f"- File offset: `{report['table_base']['file_offset']}`",
        "",
        "## Claim",
        "",
        f"- {report['claim']}",
        "",
        "## Decoded Entries",
        "",
        "| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |",
        "| --- | --- | --- | ---: | ---: | --- | --- | --- |",
    ]
    for entry in report["entries"]:
        flags = ",".join(
            key
            for key, enabled in entry["header_flags"].items()
            if enabled
        ) or "none"
        preview = Path(entry["preview_ppm"]).name if entry.get("preview_ppm") else "n/a"
        lines.append(
            "| "
            f"{entry['index']} | "
            f"{entry['selector_surface']} | "
            f"{entry['target_bank']}:{entry['target_addr'][2:]} | "
            f"{entry['object_count']} | "
            f"{entry['descriptor_blob_tile_count']} | "
            f"{entry['descriptor_layout']['kind']} | "
            f"{flags} | "
            f"{preview} |"
        )

    lines.extend(
        [
            "",
            "## Entry Notes",
            "",
        ]
    )
    for entry in report["entries"]:
        lines.extend(
            [
                f"### Row `{entry['index']}`",
                "",
                f"- Target: `{entry['target_bank']}:{entry['target_addr'][2:]}`",
                f"- Header: `{' '.join(entry['header_words'])}`",
                (
                    f"- Descriptor blob: `{entry['descriptor_blob_tile_count']}` tiles / "
                    f"`{entry['descriptor_blob_bytes']}` bytes at `{entry['descriptor_blob_file_offset']}`"
                ),
                f"- Layout: `{entry['descriptor_layout']['kind']}`",
            ]
        )
        if entry["descriptor_layout"]["second_segment_start_tile"] is not None:
            lines.append(
                "- Split staging: "
                f"`{entry['descriptor_layout']['first_segment_tiles']}` tiles first, "
                f"`{entry['descriptor_layout']['second_segment_tiles']}` overflow tiles at tile "
                f"`0x{int(entry['descriptor_layout']['second_segment_start_tile']):02X}`"
            )
        if entry.get("preview_ppm"):
            lines.append(f"- Preview: `{Path(entry['preview_ppm']).name}`")
        if entry.get("tile_sheet_ppm"):
            lines.append(f"- Tile sheet: `{Path(entry['tile_sheet_ppm']).name}`")
        lines.extend(
            [
                "- Object records:",
                "| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |",
                "| ---: | --- | --- | --- | --- |",
            ]
        )
        for row in entry["objects"]:
            lines.append(
                "| "
                f"{row['slot']} | "
                f"{row['x_word']} / {row['x_signed']} | "
                f"{row['y_word']} / {row['y_signed']} | "
                f"{row['tile_word']} | "
                f"{row['aux_word']} |"
            )
        lines.append("")

    lines.extend(
        [
            "## Notes",
            "",
            "- Indices `8..10` are the current front-end rolling-tire helper rows.",
            "- Indices `11..14` are the current track-facing adjacent helper rows.",
            "- Indices `15..17` are the current top-level signboard labels.",
            "- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.",
            "- The descriptor payload format is now closed enough to split "
            "each row into an object list plus a descriptor-local 4bpp OBJ blob.",
            "- Negative-layout rows (`bit_15_set`) use a split staged-tile "
            "layout that pads overflow glyph bottoms onto the next 16-tile row.",
        ]
    )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("rom", type=Path, help="Path to the ROM image")
    parser.add_argument(
        "--base-bank",
        type=lambda value: int(value, 0),
        default=DEFAULT_BASE_BANK,
        help=f"LoROM bank for the table base (default: {DEFAULT_BASE_BANK:#x})",
    )
    parser.add_argument(
        "--base-addr",
        type=lambda value: int(value, 0),
        default=DEFAULT_BASE_ADDR,
        help=f"CPU address for the table base (default: {DEFAULT_BASE_ADDR:#x})",
    )
    parser.add_argument(
        "--indices",
        default=DEFAULT_INDICES,
        help=f"Comma/range list of table indices (default: {DEFAULT_INDICES})",
    )
    parser.add_argument(
        "--render-dir",
        type=Path,
        default=None,
        help="optional directory for descriptor previews and tile sheets",
    )
    parser.add_argument(
        "--render-scale",
        type=int,
        default=DEFAULT_RENDER_SCALE,
        help=f"nearest-neighbor scale for preview renders (default: {DEFAULT_RENDER_SCALE})",
    )
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--md-out", type=Path)
    args = parser.parse_args()

    report = build_report(
        args.rom,
        base_bank=args.base_bank,
        base_addr=args.base_addr,
        indices=parse_indices(args.indices),
        render_dir=args.render_dir,
        render_scale=args.render_scale,
    )
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    if args.md_out:
        args.md_out.parent.mkdir(parents=True, exist_ok=True)
        write_markdown(report, args.md_out)


if __name__ == "__main__":
    main()
