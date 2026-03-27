#!/usr/bin/env python3
"""Summarize visible-tile CHR byte deltas across two raw frame dumps."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


VISIBLE_WIDTH_TILES = 32
VISIBLE_HEIGHT_TILES = 28


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize CHR byte deltas for the visible tile union of one BG layer "
            "using raw vram.bin + ppu_state.json dumps."
        )
    )
    parser.add_argument("reference_vram", type=Path, help="reference vram.bin path")
    parser.add_argument("reference_ppu_state", type=Path, help="reference ppu_state.json path")
    parser.add_argument("comparison_vram", type=Path, help="comparison vram.bin path")
    parser.add_argument("comparison_ppu_state", type=Path, help="comparison ppu_state.json path")
    parser.add_argument("output_json", type=Path, help="output JSON path")
    parser.add_argument(
        "--layer",
        default="bg2",
        choices=("bg1", "bg2", "bg3", "bg4"),
        help="layer to compare (default: %(default)s)",
    )
    parser.add_argument(
        "--sample-limit",
        type=int,
        default=32,
        help="maximum number of changed tiles kept in the sample list (default: %(default)s)",
    )
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown summary output path")
    return parser.parse_args()


def load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def layer_index(layer_name: str) -> int:
    return int(layer_name.removeprefix("bg")) - 1


def bg_bpp(bg_mode: int, layer_idx: int) -> int:
    mode_bpp = {
        0: (2, 2, 2, 2),
        1: (4, 4, 2, 0),
        2: (4, 4, 0, 0),
        3: (8, 4, 0, 0),
        4: (8, 2, 0, 0),
        5: (4, 2, 0, 0),
        6: (4, 0, 0, 0),
        7: (8, 0, 0, 0),
    }
    return mode_bpp.get(bg_mode, (0, 0, 0, 0))[layer_idx]


def bytes_per_tile(bpp: int) -> int:
    if bpp == 2:
        return 16
    if bpp == 4:
        return 32
    if bpp == 8:
        return 64
    return 0


def load_raw_frame(vram_path: Path, ppu_state_path: Path, layer_name: str) -> dict[str, Any]:
    if not vram_path.is_file():
        raise SystemExit(f"error: vram dump not found: {vram_path}")
    if not ppu_state_path.is_file():
        raise SystemExit(f"error: ppu state JSON not found: {ppu_state_path}")

    ppu_state = load_json(ppu_state_path)
    idx = layer_index(layer_name)
    bg_mode = int(ppu_state.get("ppu.bgMode", 0))
    bpp = bg_bpp(bg_mode, idx)
    tile_size = bytes_per_tile(bpp)
    if tile_size == 0:
        raise SystemExit(f"error: unsupported bytes-per-tile for bgMode={bg_mode} layer={layer_name}")

    state = {
        "tilemapAddress": int(ppu_state.get(f"ppu.layers[{idx}].tilemapAddress", 0)),
        "chrAddress": int(ppu_state.get(f"ppu.layers[{idx}].chrAddress", 0)),
        "doubleWidth": bool(ppu_state.get(f"ppu.layers[{idx}].doubleWidth", False)),
        "doubleHeight": bool(ppu_state.get(f"ppu.layers[{idx}].doubleHeight", False)),
        "largeTiles": bool(ppu_state.get(f"ppu.layers[{idx}].largeTiles", False)),
        "hscroll": int(ppu_state.get(f"ppu.layers[{idx}].hscroll", 0)),
        "vscroll": int(ppu_state.get(f"ppu.layers[{idx}].vscroll", 0)),
    }
    grid = {
        "widthTiles": 64 if state["doubleWidth"] else 32,
        "heightTiles": 64 if state["doubleHeight"] else 32,
        "tilemapBaseBytes": state["tilemapAddress"],
        "chrBaseBytes": state["chrAddress"],
    }
    return {
        "vram_path": vram_path.resolve(),
        "ppu_state_path": ppu_state_path.resolve(),
        "vram": vram_path.read_bytes(),
        "frame_number": int(ppu_state.get("frame", -1)),
        "bg_mode": bg_mode,
        "bpp": bpp,
        "bytes_per_tile": tile_size,
        "state": state,
        "grid": grid,
    }


def visible_window(frame: dict[str, Any]) -> dict[str, int]:
    grid = frame["grid"]
    return {
        "screenStartTileX": (int(frame["state"]["hscroll"]) // 8) % int(grid["widthTiles"]),
        "screenStartTileY": (int(frame["state"]["vscroll"]) // 8) % int(grid["heightTiles"]),
        "screenWidthTiles": VISIBLE_WIDTH_TILES,
        "screenHeightTiles": VISIBLE_HEIGHT_TILES,
    }


def read_tilemap_entry(vram: bytes, base_bytes: int, tile_x: int, tile_y: int) -> int:
    block_x = tile_x // 32
    block_y = tile_y // 32
    local_x = tile_x % 32
    local_y = tile_y % 32
    entry_addr = base_bytes + (block_x * 0x0800) + (block_y * 0x1000) + ((local_y * 32 + local_x) * 2)
    if entry_addr < 0 or entry_addr + 1 >= len(vram):
        return 0
    return vram[entry_addr] | (vram[entry_addr + 1] << 8)


def visible_tile_indices(frame: dict[str, Any]) -> set[int]:
    grid = frame["grid"]
    width_tiles = int(grid["widthTiles"])
    height_tiles = int(grid["heightTiles"])
    window = visible_window(frame)
    result: set[int] = set()
    for screen_y in range(VISIBLE_HEIGHT_TILES):
        for screen_x in range(VISIBLE_WIDTH_TILES):
            tile_x = (window["screenStartTileX"] + screen_x) % width_tiles
            tile_y = (window["screenStartTileY"] + screen_y) % height_tiles
            entry = read_tilemap_entry(frame["vram"], int(grid["tilemapBaseBytes"]), tile_x, tile_y)
            result.add(entry & 0x03FF)
    return result


def summarize_chr_delta(reference_frame: dict[str, Any], comparison_frame: dict[str, Any], layer_name: str, sample_limit: int) -> dict[str, Any]:
    if reference_frame["state"] != comparison_frame["state"]:
        # Still allow the comparison, but surface the mismatch explicitly.
        state_matches = False
    else:
        state_matches = True

    ref_tiles = visible_tile_indices(reference_frame)
    cmp_tiles = visible_tile_indices(comparison_frame)
    union_tiles = sorted(ref_tiles | cmp_tiles)

    tile_size = int(reference_frame["bytes_per_tile"])
    ref_chr_base = int(reference_frame["grid"]["chrBaseBytes"])
    cmp_chr_base = int(comparison_frame["grid"]["chrBaseBytes"])

    changed_tiles: list[dict[str, Any]] = []
    changed_byte_total = 0
    for tile_index in union_tiles:
        ref_start = ref_chr_base + (tile_index * tile_size)
        cmp_start = cmp_chr_base + (tile_index * tile_size)
        ref_chunk = reference_frame["vram"][ref_start : ref_start + tile_size]
        cmp_chunk = comparison_frame["vram"][cmp_start : cmp_start + tile_size]
        byte_diffs = [idx for idx, (a, b) in enumerate(zip(ref_chunk, cmp_chunk)) if a != b]
        if len(ref_chunk) != tile_size or len(cmp_chunk) != tile_size:
            byte_diffs = list(range(min(len(ref_chunk), len(cmp_chunk)), tile_size))
        if not byte_diffs:
            continue
        changed_byte_total += len(byte_diffs)
        changed_tiles.append(
            {
                "tileIndex": tile_index,
                "changedByteCount": len(byte_diffs),
                "firstChangedByte": byte_diffs[0],
                "lastChangedByte": byte_diffs[-1],
                "referenceChrByteStart": ref_start,
                "comparisonChrByteStart": cmp_start,
            }
        )

    return {
        "schema": "td2.raw_bg_chr_delta.v1",
        "reference": {
            "vramPath": str(reference_frame["vram_path"]),
            "ppuStatePath": str(reference_frame["ppu_state_path"]),
            "frameNumber": reference_frame["frame_number"],
        },
        "comparison": {
            "vramPath": str(comparison_frame["vram_path"]),
            "ppuStatePath": str(comparison_frame["ppu_state_path"]),
            "frameNumber": comparison_frame["frame_number"],
        },
        "layer": {
            "name": layer_name,
            "bgMode": reference_frame["bg_mode"],
            "bpp": reference_frame["bpp"],
            "bytesPerTile": reference_frame["bytes_per_tile"],
            "referenceState": reference_frame["state"],
            "comparisonState": comparison_frame["state"],
            "stateMatches": state_matches,
        },
        "summary": {
            "referenceVisibleTileCount": len(ref_tiles),
            "comparisonVisibleTileCount": len(cmp_tiles),
            "visibleTileUnionCount": len(union_tiles),
            "changedChrTileCount": len(changed_tiles),
            "changedChrByteCount": changed_byte_total,
            "referenceVisibleTileIndices": sorted(ref_tiles),
            "comparisonVisibleTileIndices": sorted(cmp_tiles),
        },
        "sampleChangedTiles": changed_tiles[:sample_limit],
    }


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    summary = payload["summary"]
    layer = payload["layer"]
    lines = [
        "# Raw Visible BG CHR Delta",
        "",
        f"- Reference frame: `{payload['reference']['frameNumber']}`",
        f"- Comparison frame: `{payload['comparison']['frameNumber']}`",
        f"- Layer: `{layer['name']}`",
        f"- State matches: `{layer['stateMatches']}`",
        f"- Bytes per tile: `{layer['bytesPerTile']}`",
        f"- Visible tile union count: `{summary['visibleTileUnionCount']}`",
        f"- Changed CHR tile count: `{summary['changedChrTileCount']}`",
        f"- Changed CHR byte count: `{summary['changedChrByteCount']}`",
        "",
        "## Sample Changed Tiles",
        "",
    ]
    if not payload["sampleChangedTiles"]:
        lines.append("- none")
    else:
        for row in payload["sampleChangedTiles"]:
            lines.append(
                "- "
                f"tile={row['tileIndex']} "
                f"bytes={row['changedByteCount']} "
                f"ref_start=0x{row['referenceChrByteStart']:04X} "
                f"cmp_start=0x{row['comparisonChrByteStart']:04X}"
            )

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    reference_frame = load_raw_frame(args.reference_vram, args.reference_ppu_state, args.layer)
    comparison_frame = load_raw_frame(args.comparison_vram, args.comparison_ppu_state, args.layer)
    payload = summarize_chr_delta(reference_frame, comparison_frame, args.layer, args.sample_limit)
    write_json(args.output_json, payload)
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, payload)


if __name__ == "__main__":
    main()
