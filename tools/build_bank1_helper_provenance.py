#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from build_bank1_helper_scene import (
    L00A9A0_ADDR_TABLE,
    L00A9A0_BANK_TABLE,
    L00A9A0_VRAM_BASE_TABLE,
    L00A9CB_ADDR_TABLE,
    L00A9CB_BANK_TABLE,
    L00A9CB_VRAM_DEST_TABLE,
    L00A9F2_ADDR_TABLE,
    L00A9F2_BANK_TABLE,
    L00A9F2_CGRAM_DEST_TABLE,
    L00A9F2_COUNT_TABLE,
    detect_compression,
    load_u16,
    load_u8,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Correlate a design-pack frame with bank1 helper-bundle provenance "
            "using boot-probe state plus L001210 caller traces."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("design_pack_dir", type=Path, help="design-pack frame directory")
    parser.add_argument("probe_json", type=Path, help="td2_boot_probe.json path")
    parser.add_argument("l001210_exec_json", type=Path, help="td2_boot_probe_l001210_exec.json path")
    parser.add_argument("output_json", type=Path, help="output JSON path")
    parser.add_argument(
        "--layer",
        default="bg2",
        choices=("bg1", "bg2", "bg3", "bg4"),
        help="target layer from the design pack (default: %(default)s)",
    )
    parser.add_argument(
        "--frame",
        type=int,
        default=None,
        help="override target frame number (default: design_pack.json frame_number)",
    )
    parser.add_argument(
        "--max-gap",
        type=int,
        default=256,
        help="maximum distance from the target frame for helper hits (default: %(default)s)",
    )
    parser.add_argument(
        "--chunk-validation",
        type=Path,
        action="append",
        default=[],
        help="optional chunk-validation JSON (repeatable)",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=None,
        help="optional Markdown summary output path",
    )
    return parser.parse_args()


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def as_int(value: Any, default: int = 0) -> int:
    if isinstance(value, str):
        text = value.strip()
        if text.lower().startswith("0x"):
            try:
                return int(text, 16)
            except ValueError:
                return default
    try:
        return int(value)
    except (TypeError, ValueError):
        return default


def format_snes(bank: int, addr: int) -> str:
    return f"{bank & 0xFF:02X}:{addr & 0xFFFF:04X}"


def build_chunk_validation_lookup(paths: list[Path]) -> dict[tuple[int, int], dict[str, Any]]:
    lookup: dict[tuple[int, int], dict[str, Any]] = {}
    for path in paths:
        payload = load_json(path)
        bank = as_int(payload.get("bank"), -1)
        if bank < 0:
            continue
        for entry in payload.get("entries", []):
            if not isinstance(entry, dict):
                continue
            addr = as_int(entry.get("addr"), -1)
            if addr < 0:
                continue
            lookup[(bank, addr)] = {
                "source_validation": str(path),
                "status": entry.get("status"),
                "marker": entry.get("marker"),
                "output_size": entry.get("output_size"),
                "consumed_bytes": entry.get("consumed_bytes"),
                "error": entry.get("error"),
            }
    return lookup


def infer_visible_window(layer_payload: dict[str, Any]) -> dict[str, Any]:
    state = layer_payload["state"]
    grid = layer_payload["grid"]
    maps = layer_payload["maps"]
    width_tiles = as_int(grid["widthTiles"])
    height_tiles = as_int(grid["heightTiles"])
    start_x = (as_int(state["hscroll"]) // 8) % width_tiles
    start_y = (as_int(state["vscroll"]) // 8) % height_tiles
    screen_width_tiles = 32
    screen_height_tiles = 28

    nonzero: list[tuple[int, int, int, int]] = []
    unique_tiles: set[int] = set()
    unique_palettes: set[int] = set()
    tile_rows = maps["tileIndex"]
    palette_rows = maps["palette"]

    for screen_y in range(screen_height_tiles):
        tile_y = (start_y + screen_y) % height_tiles
        for screen_x in range(screen_width_tiles):
            tile_x = (start_x + screen_x) % width_tiles
            tile_index = as_int(tile_rows[tile_y][tile_x])
            palette_index = as_int(palette_rows[tile_y][tile_x])
            if tile_index != 0:
                nonzero.append((screen_x, screen_y, tile_index, palette_index))
                unique_tiles.add(tile_index)
                unique_palettes.add(palette_index)

    bbox = None
    if nonzero:
        xs = [row[0] for row in nonzero]
        ys = [row[1] for row in nonzero]
        bbox = {
            "screenTileLeft": min(xs),
            "screenTileTop": min(ys),
            "screenTileRight": max(xs),
            "screenTileBottom": max(ys),
            "screenPixelLeft": min(xs) * 8,
            "screenPixelTop": min(ys) * 8,
            "screenPixelRight": (max(xs) * 8) + 7,
            "screenPixelBottom": (max(ys) * 8) + 7,
        }

    return {
        "screenStartTileX": start_x,
        "screenStartTileY": start_y,
        "screenWidthTiles": screen_width_tiles,
        "screenHeightTiles": screen_height_tiles,
        "nonZeroScreenTileCount": len(nonzero),
        "nonZeroTileIndexMin": min(unique_tiles) if unique_tiles else None,
        "nonZeroTileIndexMax": max(unique_tiles) if unique_tiles else None,
        "nonZeroPaletteIndices": sorted(unique_palettes),
        "nonZeroBoundingBox": bbox,
    }


def load_probe_frame(probe_json: dict[str, Any], frame_number: int) -> dict[str, Any]:
    frames = probe_json.get("frames")
    if not isinstance(frames, list) or frame_number < 0 or frame_number >= len(frames):
        raise SystemExit(f"error: probe frame {frame_number} missing from {len(frames) if isinstance(frames, list) else 0}-frame payload")
    row = frames[frame_number]
    if not isinstance(row, dict):
        raise SystemExit(f"error: probe frame {frame_number} is not an object")
    return row


def choose_last_hit(
    hits: list[dict[str, Any]],
    frame_number: int,
    table_name: str,
    target_state_0202: int,
    target_state_0208: int,
    max_gap: int,
) -> dict[str, Any] | None:
    chosen = None
    for hit in hits:
        frame = as_int(hit.get("frame"), -1)
        if frame < 0 or frame > frame_number:
            continue
        if hit.get("caller_l00a9_table") != table_name:
            continue
        if as_int(hit.get("state_0202"), -1) != target_state_0202:
            continue
        if as_int(hit.get("state_0208"), -1) != target_state_0208:
            continue
        if (frame_number - frame) > max_gap:
            continue
        chosen = hit
    return chosen


def helper_bundle_for_index(rom_bytes: bytes, helper_index: int, chunk_lookup: dict[tuple[int, int], dict[str, Any]]) -> dict[str, Any]:
    entry_word_index = helper_index * 2

    a9a0_source_addr = load_u16(rom_bytes, 0x01, L00A9A0_ADDR_TABLE + entry_word_index)
    a9a0_source_bank = load_u8(rom_bytes, 0x01, L00A9A0_BANK_TABLE + helper_index)
    a9a0_vram_base = load_u16(rom_bytes, 0x01, L00A9A0_VRAM_BASE_TABLE + entry_word_index)

    a9cb_source_addr = load_u16(rom_bytes, 0x01, L00A9CB_ADDR_TABLE + entry_word_index)
    a9cb_source_bank = load_u8(rom_bytes, 0x01, L00A9CB_BANK_TABLE + helper_index)
    a9cb_vram_dest = load_u16(rom_bytes, 0x01, L00A9CB_VRAM_DEST_TABLE + entry_word_index)

    a9f2_source_addr = load_u16(rom_bytes, 0x01, L00A9F2_ADDR_TABLE + entry_word_index)
    a9f2_source_bank = load_u8(rom_bytes, 0x01, L00A9F2_BANK_TABLE + helper_index)
    a9f2_cgram_dest = load_u16(rom_bytes, 0x01, L00A9F2_CGRAM_DEST_TABLE + entry_word_index)
    a9f2_color_count = load_u16(rom_bytes, 0x01, L00A9F2_COUNT_TABLE + entry_word_index) & 0x00FF

    def row(table_name: str, source_bank: int, source_addr: int, apply_kind: str, apply_value: int) -> dict[str, Any]:
        compression = detect_compression(rom_bytes, source_bank, source_addr)
        validation = chunk_lookup.get((source_bank, source_addr))
        payload = {
            "table": table_name,
            "source_bank": source_bank,
            "source_addr": source_addr,
            "source_snes": format_snes(source_bank, source_addr),
            "compression": compression["header"] if compression else "raw",
            "validation": validation,
        }
        if apply_kind == "vram":
            payload["apply_vram_word_addr"] = apply_value
        elif apply_kind == "cgram":
            payload["apply_cgram_dest"] = apply_value
        return payload

    return {
        "helper_index": helper_index,
        "a9a0": row("L00A9A0", a9a0_source_bank, a9a0_source_addr, "vram", a9a0_vram_base),
        "a9cb": row("L00A9CB", a9cb_source_bank, a9cb_source_addr, "vram", a9cb_vram_dest),
        "a9f2": {
            **row("L00A9F2", a9f2_source_bank, a9f2_source_addr, "cgram", a9f2_cgram_dest),
            "palette_color_count": a9f2_color_count,
        },
    }


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    layer = payload["layer"]
    probe = payload["probe_frame"]
    helper = payload["helper_bundle"]
    a9a0 = helper["a9a0"]
    a9cb = helper["a9cb"]
    visible = payload["visible_window"]
    bbox = visible.get("nonZeroBoundingBox")
    lines = [
        "# Bank1 Helper Provenance",
        "",
        f"- Frame: `{payload['frame_number']}`",
        f"- Layer: `{layer['name']}`",
        f"- Target probe state: `$0202={probe['state_0202']}`, `$0204={probe['state_0204']}`, `$0208={probe['state_0208']}`, `$020A={probe['state_020a']}`, `$0054={probe['dp_0054']}`",
        f"- Helper bundle: index `{helper['helper_index']}`",
        "",
        "## Layer Read",
        "",
        f"- `tilemapBaseWords = 0x{layer['tilemapBaseWords']:04X}`",
        f"- `chrBaseWords = 0x{layer['chrBaseWords']:04X}`",
        f"- visible nonzero bbox: `{bbox}`" if bbox else "- visible nonzero bbox: none",
        f"- visible tile index span: `{visible['nonZeroTileIndexMin']}..{visible['nonZeroTileIndexMax']}`",
        f"- visible palette indices: `{visible['nonZeroPaletteIndices']}`",
        "",
        "## Runtime Anchor",
        "",
        f"- last `L00A9A0` hit at/before frame `{payload['frame_number']}` with matching `$0202/$0208`: frame `{payload['recent_hits']['a9a0']['frame']}` -> `{payload['recent_hits']['a9a0']['source_snes']}`",
        f"- last `L00A9CB` hit at/before frame `{payload['frame_number']}` with matching `$0202/$0208`: frame `{payload['recent_hits']['a9cb']['frame']}` -> `{payload['recent_hits']['a9cb']['source_snes']}`",
        "",
        "## Bundle Match",
        "",
        f"- `L00A9A0` helper `{helper['helper_index']}` stages paged VRAM from `{a9a0['source_snes']}` to `0x{a9a0['apply_vram_word_addr']:04X}`",
        f"- `L00A9CB` helper `{helper['helper_index']}` stages bulk VRAM from `{a9cb['source_snes']}` to `0x{a9cb['apply_vram_word_addr']:04X}`",
        f"- tilemap base match: `{payload['matches']['tilemapBaseMatchesA9A0']}`",
        f"- CHR base match: `{payload['matches']['chrBaseMatchesA9CB']}`",
        "",
        "## Reading",
        "",
        "- The frame-level BG surface is anchored to the same bank1 helper bundle seen earlier in runtime trace.",
        "- `L00A9A0` explains the live BG tilemap base and `L00A9CB` explains the live BG CHR base.",
        "- If the `26FB` validation on the bulk source fails with an early-end mismatch, treat that as the existing partial-bulk frontier, not as evidence against the helper match.",
    ]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    manifest = load_json(args.design_pack_dir / "design_pack.json")
    frame_number = args.frame if args.frame is not None else manifest.get("frame_number")
    if not isinstance(frame_number, int):
        raise SystemExit("error: frame number missing from design pack and not provided via --frame")

    layer_entry = None
    for item in manifest.get("tilemaps", {}).get("layers", []):
        if item.get("name") == args.layer:
            layer_entry = item
            break
    if not isinstance(layer_entry, dict):
        raise SystemExit(f"error: layer {args.layer!r} not present in design pack")

    layer_payload = load_json(args.design_pack_dir / layer_entry["json"])
    visible_window = infer_visible_window(layer_payload)

    probe_json = load_json(args.probe_json)
    probe_row = load_probe_frame(probe_json, frame_number)
    target_state_0202 = as_int(probe_row.get("state_0202"), -1)
    target_state_0208 = as_int(probe_row.get("state_0208"), -1)
    if target_state_0202 < 0 or target_state_0208 < 0:
        raise SystemExit("error: probe frame is missing required state_0202/state_0208 fields")

    exec_json = load_json(args.l001210_exec_json)
    hits = exec_json.get("hits", [])
    if not isinstance(hits, list):
        raise SystemExit("error: l001210 exec JSON has no hits list")

    a9a0_hit = choose_last_hit(hits, frame_number, "L00A9A0", target_state_0202, target_state_0208, args.max_gap)
    a9cb_hit = choose_last_hit(hits, frame_number, "L00A9CB", target_state_0202, target_state_0208, args.max_gap)
    if a9a0_hit is None or a9cb_hit is None:
        raise SystemExit(
            f"error: could not find matching L00A9A0/L00A9CB hits within {args.max_gap} frames of frame {frame_number}"
        )

    helper_index = as_int(a9a0_hit.get("caller_l00a9_table_index"), -1)
    a9cb_index = as_int(a9cb_hit.get("caller_l00a9_table_index"), -1)
    if helper_index < 0 or a9cb_index < 0 or helper_index != a9cb_index:
        raise SystemExit(
            f"error: mismatched helper indices from A9A0/A9CB hits ({helper_index} vs {a9cb_index})"
        )

    chunk_lookup = build_chunk_validation_lookup(args.chunk_validation)
    helper_bundle = helper_bundle_for_index(rom_bytes, helper_index, chunk_lookup)

    layer_state = {
        "name": layer_payload["name"],
        "bgMode": layer_payload["bgMode"],
        "tilemapBaseWords": as_int(layer_payload["grid"]["tilemapBaseWords"]),
        "chrBaseWords": as_int(layer_payload["grid"]["chrBaseWords"]),
        "enabledOnMain": bool(layer_payload["enabledOnMain"]),
        "enabledOnSub": bool(layer_payload["enabledOnSub"]),
        "bpp": as_int(layer_payload["bpp"]),
    }

    payload = {
        "schema": "td2.bank1_helper_provenance.v1",
        "frame_number": frame_number,
        "layer": layer_state,
        "visible_window": visible_window,
        "probe_frame": {
            "state_0202": as_int(probe_row.get("state_0202")),
            "state_0204": as_int(probe_row.get("state_0204")),
            "state_0208": as_int(probe_row.get("state_0208")),
            "state_020a": as_int(probe_row.get("state_020a")),
            "dp_0054": as_int(probe_row.get("dp_0054")),
        },
        "recent_hits": {
            "a9a0": {
                "frame": as_int(a9a0_hit.get("frame")),
                "source_snes": a9a0_hit.get("source_snes"),
                "table_index": helper_index,
                "frame_delta": frame_number - as_int(a9a0_hit.get("frame")),
            },
            "a9cb": {
                "frame": as_int(a9cb_hit.get("frame")),
                "source_snes": a9cb_hit.get("source_snes"),
                "table_index": helper_index,
                "frame_delta": frame_number - as_int(a9cb_hit.get("frame")),
            },
        },
        "helper_bundle": helper_bundle,
        "matches": {
            "tilemapBaseMatchesA9A0": layer_state["tilemapBaseWords"] == helper_bundle["a9a0"]["apply_vram_word_addr"],
            "chrBaseMatchesA9CB": layer_state["chrBaseWords"] == helper_bundle["a9cb"]["apply_vram_word_addr"],
        },
    }

    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        write_markdown(args.markdown_out, payload)
    print(f"wrote helper provenance {args.output_json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
