#!/usr/bin/env python3
"""Compare the visible screen window of one BG layer across two design packs."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


VISIBLE_WIDTH_TILES = 32
VISIBLE_HEIGHT_TILES = 28
MAP_KEYS = ("entryWords", "tileIndex", "palette", "priority", "hflip", "vflip")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare the visible tile window of one BG layer across two "
            "Mesen design packs and summarize the changed screen cells."
        )
    )
    parser.add_argument("reference_design_pack", type=Path, help="reference design-pack directory")
    parser.add_argument("comparison_design_pack", type=Path, help="comparison design-pack directory")
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


def load_design_pack(pack_dir: Path) -> dict[str, Any]:
    manifest_path = pack_dir / "design_pack.json"
    if not manifest_path.is_file():
        raise SystemExit(f"error: design-pack manifest not found: {manifest_path}")
    manifest = load_json(manifest_path)
    return {
        "dir": pack_dir.resolve(),
        "manifest_path": manifest_path.resolve(),
        "manifest": manifest,
    }


def load_layer_tilemap(pack_dir: Path, layer: str) -> dict[str, Any]:
    tilemap_path = pack_dir / "tilemaps" / f"{layer}_tilemap.json"
    if not tilemap_path.is_file():
        raise SystemExit(f"error: tilemap JSON not found: {tilemap_path}")
    return load_json(tilemap_path)


def visible_window(tilemap: dict[str, Any]) -> dict[str, int]:
    width_tiles = int(tilemap["grid"]["widthTiles"])
    height_tiles = int(tilemap["grid"]["heightTiles"])
    start_x = (int(tilemap["state"]["hscroll"]) // 8) % width_tiles
    start_y = (int(tilemap["state"]["vscroll"]) // 8) % height_tiles
    return {
        "screenStartTileX": start_x,
        "screenStartTileY": start_y,
        "screenWidthTiles": VISIBLE_WIDTH_TILES,
        "screenHeightTiles": VISIBLE_HEIGHT_TILES,
    }


def screen_cell(tilemap: dict[str, Any], screen_x: int, screen_y: int) -> dict[str, int]:
    grid = tilemap["grid"]
    width_tiles = int(grid["widthTiles"])
    height_tiles = int(grid["heightTiles"])
    window = visible_window(tilemap)
    tile_x = (window["screenStartTileX"] + screen_x) % width_tiles
    tile_y = (window["screenStartTileY"] + screen_y) % height_tiles
    return {
        "mapTileX": tile_x,
        "mapTileY": tile_y,
        **{key: int(tilemap["maps"][key][tile_y][tile_x]) for key in MAP_KEYS},
    }


def cell_nonzero(cell: dict[str, int]) -> bool:
    return cell["tileIndex"] != 0


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


def compare_layer(
    reference_pack: dict[str, Any],
    comparison_pack: dict[str, Any],
    layer: str,
    sample_limit: int,
) -> dict[str, Any]:
    reference_tilemap = load_layer_tilemap(reference_pack["dir"], layer)
    comparison_tilemap = load_layer_tilemap(comparison_pack["dir"], layer)
    reference_window = visible_window(reference_tilemap)
    comparison_window = visible_window(comparison_tilemap)

    changed_cells: list[dict[str, Any]] = []
    for screen_y in range(VISIBLE_HEIGHT_TILES):
        for screen_x in range(VISIBLE_WIDTH_TILES):
            reference_cell = screen_cell(reference_tilemap, screen_x, screen_y)
            comparison_cell = screen_cell(comparison_tilemap, screen_x, screen_y)
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
        key: reference_tilemap["state"][key] == comparison_tilemap["state"][key]
        for key in state_keys
    }

    return {
        "schema": "td2.design_pack_bg_visible_diff.v1",
        "reference": {
            "designPackDir": str(reference_pack["dir"]),
            "designPackManifest": str(reference_pack["manifest_path"]),
            "frameNumber": reference_pack["manifest"].get("frame_number"),
        },
        "comparison": {
            "designPackDir": str(comparison_pack["dir"]),
            "designPackManifest": str(comparison_pack["manifest_path"]),
            "frameNumber": comparison_pack["manifest"].get("frame_number"),
        },
        "layer": {
            "name": layer,
            "referenceState": reference_tilemap["state"],
            "comparisonState": comparison_tilemap["state"],
            "grid": reference_tilemap["grid"],
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
        "# Design-Pack Visible BG Diff",
        "",
        f"- Reference frame: `{payload['reference']['frameNumber']}`",
        f"- Comparison frame: `{payload['comparison']['frameNumber']}`",
        f"- Layer: `{layer['name']}`",
        f"- Reference pack: `{payload['reference']['designPackDir']}`",
        f"- Comparison pack: `{payload['comparison']['designPackDir']}`",
        "",
        "## Summary",
        "",
        f"- Visible window: screen tiles `{layer['referenceVisibleWindow']['screenStartTileX']},{layer['referenceVisibleWindow']['screenStartTileY']}` -> `{layer['referenceVisibleWindow']['screenWidthTiles']}x{layer['referenceVisibleWindow']['screenHeightTiles']}`",
        f"- State fields match: `{layer['allStateFieldsMatch']}`",
        f"- Changed visible cells: `{summary['changedCellCount']}`",
        f"- Unchanged visible cells: `{summary['unchangedCellCount']}`",
        f"- Zero->nonzero: `{summary['zeroToNonZeroCount']}`",
        f"- Nonzero->zero: `{summary['nonZeroToZeroCount']}`",
        f"- Nonzero->nonzero: `{summary['nonZeroToNonZeroCount']}`",
    ]
    if summary["changedBoundingBox"] is not None:
        bbox = summary["changedBoundingBox"]
        pixel_bbox = summary["changedPixelBoundingBox"]
        lines.extend(
            [
                f"- Changed tile bbox: `{bbox['screenTileLeft']}..{bbox['screenTileRight']} x {bbox['screenTileTop']}..{bbox['screenTileBottom']}`",
                f"- Changed pixel bbox: `{pixel_bbox['screenPixelLeft']}..{pixel_bbox['screenPixelRight']} x {pixel_bbox['screenPixelTop']}..{pixel_bbox['screenPixelBottom']}`",
                f"- Changed rows: `{summary['changedScreenRows']}`",
                f"- Changed columns: `{summary['changedScreenColumns']}`",
                f"- Reference changed tile indices: `{summary['referenceChangedTileIndices']}`",
                f"- Comparison changed tile indices: `{summary['comparisonChangedTileIndices']}`",
            ]
        )

    sample_changes = payload["sampleChanges"]
    if sample_changes:
        lines.extend(
            [
                "",
                "## Sample Changes",
                "",
                "| Screen | Map | Reference | Comparison |",
                "| --- | --- | --- | --- |",
            ]
        )
        for row in sample_changes:
            screen = f"({row['screenTileX']}, {row['screenTileY']})"
            map_pos = f"({row['mapTileX']}, {row['mapTileY']})"
            reference = ", ".join(f"{key}={row['reference'][key]}" for key in MAP_KEYS)
            comparison = ", ".join(f"{key}={row['comparison'][key]}" for key in MAP_KEYS)
            lines.append(f"| `{screen}` | `{map_pos}` | `{reference}` | `{comparison}` |")

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    reference_pack = load_design_pack(args.reference_design_pack)
    comparison_pack = load_design_pack(args.comparison_design_pack)
    payload = compare_layer(reference_pack, comparison_pack, args.layer, args.sample_limit)
    write_json(args.output_json, payload)
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, payload)


if __name__ == "__main__":
    main()
