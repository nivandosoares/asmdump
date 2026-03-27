#!/usr/bin/env python3
"""Compare the visible tile window of one BG layer across two raw frame dumps."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


VISIBLE_WIDTH_TILES = 32
VISIBLE_HEIGHT_TILES = 28
MAP_KEYS = ("entryWord", "tileIndex", "palette", "priority", "hflip", "vflip")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare the visible tile window of one BG layer using raw "
            "vram.bin + ppu_state.json dumps."
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
        help="maximum number of changed cells kept in the sample list (default: %(default)s)",
    )
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown summary output path")
    return parser.parse_args()


def load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def layer_index(layer_name: str) -> int:
    return int(layer_name.removeprefix("bg")) - 1


def load_raw_frame(vram_path: Path, ppu_state_path: Path, layer_name: str) -> dict[str, Any]:
    if not vram_path.is_file():
        raise SystemExit(f"error: vram dump not found: {vram_path}")
    if not ppu_state_path.is_file():
        raise SystemExit(f"error: ppu state JSON not found: {ppu_state_path}")

    ppu_state = load_json(ppu_state_path)
    index = layer_index(layer_name)
    state = {
        "tilemapAddress": int(ppu_state.get(f"ppu.layers[{index}].tilemapAddress", 0)),
        "chrAddress": int(ppu_state.get(f"ppu.layers[{index}].chrAddress", 0)),
        "doubleWidth": bool(ppu_state.get(f"ppu.layers[{index}].doubleWidth", False)),
        "doubleHeight": bool(ppu_state.get(f"ppu.layers[{index}].doubleHeight", False)),
        "largeTiles": bool(ppu_state.get(f"ppu.layers[{index}].largeTiles", False)),
        "hscroll": int(ppu_state.get(f"ppu.layers[{index}].hscroll", 0)),
        "vscroll": int(ppu_state.get(f"ppu.layers[{index}].vscroll", 0)),
    }
    grid = {
        "widthTiles": 64 if state["doubleWidth"] else 32,
        "heightTiles": 64 if state["doubleHeight"] else 32,
        "tilemapBaseBytes": state["tilemapAddress"],
        "tilemapBaseWords": state["tilemapAddress"] // 2,
        "chrBaseWords": state["chrAddress"],
    }
    frame_number = int(ppu_state.get("frame", -1))
    return {
        "vram_path": vram_path.resolve(),
        "ppu_state_path": ppu_state_path.resolve(),
        "vram": vram_path.read_bytes(),
        "ppu_state": ppu_state,
        "state": state,
        "grid": grid,
        "frame_number": frame_number if frame_number >= 0 else None,
    }


def visible_window(frame: dict[str, Any]) -> dict[str, int]:
    grid = frame["grid"]
    start_x = (int(frame["state"]["hscroll"]) // 8) % int(grid["widthTiles"])
    start_y = (int(frame["state"]["vscroll"]) // 8) % int(grid["heightTiles"])
    return {
        "screenStartTileX": start_x,
        "screenStartTileY": start_y,
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


def screen_cell(frame: dict[str, Any], screen_x: int, screen_y: int) -> dict[str, int]:
    grid = frame["grid"]
    width_tiles = int(grid["widthTiles"])
    height_tiles = int(grid["heightTiles"])
    window = visible_window(frame)
    tile_x = (window["screenStartTileX"] + screen_x) % width_tiles
    tile_y = (window["screenStartTileY"] + screen_y) % height_tiles
    entry_word = read_tilemap_entry(frame["vram"], int(grid["tilemapBaseBytes"]), tile_x, tile_y)
    return {
        "mapTileX": tile_x,
        "mapTileY": tile_y,
        "entryWord": entry_word,
        "tileIndex": entry_word & 0x03FF,
        "palette": (entry_word >> 10) & 0x07,
        "priority": (entry_word >> 13) & 0x01,
        "hflip": (entry_word >> 14) & 0x01,
        "vflip": (entry_word >> 15) & 0x01,
    }


def summarize_changed_cells(changed_cells: list[dict[str, Any]]) -> dict[str, Any]:
    if not changed_cells:
        return {
            "changedCellCount": 0,
            "unchangedCellCount": VISIBLE_WIDTH_TILES * VISIBLE_HEIGHT_TILES,
            "zeroToNonZeroCount": 0,
            "nonZeroToZeroCount": 0,
            "nonZeroToNonZeroCount": 0,
            "changedBoundingBox": None,
            "changedPixelBoundingBox": None,
            "changedScreenRows": [],
            "changedRowCounts": [],
            "changedScreenColumns": [],
            "changedColumnCounts": [],
            "referenceChangedTileIndices": [],
            "comparisonChangedTileIndices": [],
        }

    xs = [row["screenTileX"] for row in changed_cells]
    ys = [row["screenTileY"] for row in changed_cells]
    row_counts: dict[int, int] = {}
    column_counts: dict[int, int] = {}
    ref_tiles: set[int] = set()
    cmp_tiles: set[int] = set()
    zero_to_nonzero = 0
    nonzero_to_zero = 0
    nonzero_to_nonzero = 0

    for row in changed_cells:
        screen_y = row["screenTileY"]
        screen_x = row["screenTileX"]
        row_counts[screen_y] = row_counts.get(screen_y, 0) + 1
        column_counts[screen_x] = column_counts.get(screen_x, 0) + 1
        ref_tile = int(row["reference"]["tileIndex"])
        cmp_tile = int(row["comparison"]["tileIndex"])
        if ref_tile:
            ref_tiles.add(ref_tile)
        if cmp_tile:
            cmp_tiles.add(cmp_tile)
        ref_nonzero = ref_tile != 0
        cmp_nonzero = cmp_tile != 0
        if not ref_nonzero and cmp_nonzero:
            zero_to_nonzero += 1
        elif ref_nonzero and not cmp_nonzero:
            nonzero_to_zero += 1
        else:
            nonzero_to_nonzero += 1

    bbox = {
        "screenTileLeft": min(xs),
        "screenTileTop": min(ys),
        "screenTileRight": max(xs),
        "screenTileBottom": max(ys),
    }
    pixel_bbox = {
        "screenPixelLeft": bbox["screenTileLeft"] * 8,
        "screenPixelTop": bbox["screenTileTop"] * 8,
        "screenPixelRight": (bbox["screenTileRight"] * 8) + 7,
        "screenPixelBottom": (bbox["screenTileBottom"] * 8) + 7,
    }

    return {
        "changedCellCount": len(changed_cells),
        "unchangedCellCount": (VISIBLE_WIDTH_TILES * VISIBLE_HEIGHT_TILES) - len(changed_cells),
        "zeroToNonZeroCount": zero_to_nonzero,
        "nonZeroToZeroCount": nonzero_to_zero,
        "nonZeroToNonZeroCount": nonzero_to_nonzero,
        "changedBoundingBox": bbox,
        "changedPixelBoundingBox": pixel_bbox,
        "changedScreenRows": sorted(row_counts),
        "changedRowCounts": [{"screenTileY": key, "count": row_counts[key]} for key in sorted(row_counts)],
        "changedScreenColumns": sorted(column_counts),
        "changedColumnCounts": [{"screenTileX": key, "count": column_counts[key]} for key in sorted(column_counts)],
        "referenceChangedTileIndices": sorted(ref_tiles),
        "comparisonChangedTileIndices": sorted(cmp_tiles),
    }


def compare_frames(reference_frame: dict[str, Any], comparison_frame: dict[str, Any], layer: str, sample_limit: int) -> dict[str, Any]:
    reference_window = visible_window(reference_frame)
    comparison_window = visible_window(comparison_frame)

    changed_cells: list[dict[str, Any]] = []
    for screen_y in range(VISIBLE_HEIGHT_TILES):
        for screen_x in range(VISIBLE_WIDTH_TILES):
            reference_cell = screen_cell(reference_frame, screen_x, screen_y)
            comparison_cell = screen_cell(comparison_frame, screen_x, screen_y)
            if all(reference_cell[key] == comparison_cell[key] for key in MAP_KEYS):
                continue
            changed_cells.append(
                {
                    "screenTileX": screen_x,
                    "screenTileY": screen_y,
                    "screenPixelX": screen_x * 8,
                    "screenPixelY": screen_y * 8,
                    "mapTileX": reference_cell["mapTileX"],
                    "mapTileY": reference_cell["mapTileY"],
                    "reference": {key: reference_cell[key] for key in MAP_KEYS},
                    "comparison": {key: comparison_cell[key] for key in MAP_KEYS},
                }
            )

    state_keys = ("tilemapAddress", "chrAddress", "doubleWidth", "doubleHeight", "largeTiles", "hscroll", "vscroll")
    state_matches = {
        key: reference_frame["state"][key] == comparison_frame["state"][key]
        for key in state_keys
    }

    return {
        "schema": "td2.raw_bg_visible_diff.v1",
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
            "name": layer,
            "referenceState": reference_frame["state"],
            "comparisonState": comparison_frame["state"],
            "grid": reference_frame["grid"],
            "referenceVisibleWindow": reference_window,
            "comparisonVisibleWindow": comparison_window,
            "stateMatches": state_matches,
            "allStateFieldsMatch": all(state_matches.values()),
        },
        "summary": summarize_changed_cells(changed_cells),
        "sampleChanges": changed_cells[:sample_limit],
    }


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    summary = payload["summary"]
    layer = payload["layer"]
    lines = [
        "# Raw Visible BG Diff",
        "",
        f"- Reference frame: `{payload['reference']['frameNumber']}`",
        f"- Comparison frame: `{payload['comparison']['frameNumber']}`",
        f"- Layer: `{layer['name']}`",
        f"- Reference PPU state: `{payload['reference']['ppuStatePath']}`",
        f"- Comparison PPU state: `{payload['comparison']['ppuStatePath']}`",
        "",
        "## Summary",
        "",
        f"- State fields match: `{layer['allStateFieldsMatch']}`",
        f"- Changed visible cells: `{summary['changedCellCount']}`",
        f"- Unchanged visible cells: `{summary['unchangedCellCount']}`",
        f"- Zero -> nonzero: `{summary['zeroToNonZeroCount']}`",
        f"- Nonzero -> zero: `{summary['nonZeroToZeroCount']}`",
        f"- Nonzero -> nonzero: `{summary['nonZeroToNonZeroCount']}`",
        f"- Changed pixel bbox: `{summary['changedPixelBoundingBox']}`",
        "",
        "## State",
        "",
        f"- Reference state: `{layer['referenceState']}`",
        f"- Comparison state: `{layer['comparisonState']}`",
        "",
        "## Sample Changes",
        "",
    ]

    if not payload["sampleChanges"]:
        lines.append("- none")
    else:
        for row in payload["sampleChanges"]:
            lines.append(
                "- "
                f"screen=({row['screenTileX']},{row['screenTileY']}) "
                f"ref={row['reference']} "
                f"cmp={row['comparison']}"
            )

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    reference_frame = load_raw_frame(args.reference_vram, args.reference_ppu_state, args.layer)
    comparison_frame = load_raw_frame(args.comparison_vram, args.comparison_ppu_state, args.layer)
    payload = compare_frames(reference_frame, comparison_frame, args.layer, args.sample_limit)
    write_json(args.output_json, payload)
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, payload)


if __name__ == "__main__":
    main()
