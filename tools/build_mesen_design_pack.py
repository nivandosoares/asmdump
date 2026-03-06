#!/usr/bin/env python3
"""Package a mesen_ppu_extract frame dump into a design-friendly asset pack."""

from __future__ import annotations

import argparse
import csv
import datetime as dt
import json
import re
import shutil
from collections import Counter
from pathlib import Path


LAYER_NAMES = ("bg1", "bg2", "bg3", "bg4", "main", "sub")
BG_LAYER_NAMES = ("bg1", "bg2", "bg3", "bg4")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Copy a mesen_ppu_extract frame directory into a stable design pack layout "
            "with a JSON manifest for tile/sprite/tilemap inspection workflows."
        )
    )
    parser.add_argument("frame_dir", type=Path, help="Input mesen_ppu_extract frame directory.")
    parser.add_argument("out_dir", type=Path, help="Output design pack directory.")
    parser.add_argument(
        "--clean-out",
        action="store_true",
        help="Delete out_dir before packaging.",
    )
    return parser.parse_args()


def copy_if_exists(src: Path, dst: Path) -> bool:
    if not src.exists():
        return False
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
    return True


def infer_frame_number(frame_dir: Path) -> int | None:
    match = re.search(r"(\d+)", frame_dir.name)
    if not match:
        return None
    return int(match.group(1))


def load_json_if_exists(path: Path) -> dict | None:
    if not path.is_file():
        return None
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return None


def collect_layers(frame_dir: Path, out_dir: Path) -> list[dict]:
    rows: list[dict] = []
    for name in LAYER_NAMES:
        layer_entry = {"name": name}
        base = out_dir / "layers"
        files = {
            "full": f"{name}.ppm",
            "visible": f"{name}_visible.ppm",
            "meta": f"{name}.json",
        }
        for key, rel in files.items():
            src = frame_dir / rel
            dst = base / rel
            if copy_if_exists(src, dst):
                layer_entry[key] = dst.relative_to(out_dir).as_posix()
        rows.append(layer_entry)
    return rows


def collect_tilesets(frame_dir: Path, out_dir: Path) -> list[dict]:
    rows: list[dict] = []
    for index in range(1, 5):
        stem = f"tiles_bg{index}"
        entry = {"name": f"bg{index}"}
        ppm = out_dir / "tilesets" / f"{stem}.ppm"
        meta = out_dir / "tilesets" / f"{stem}.json"
        if copy_if_exists(frame_dir / f"{stem}.ppm", ppm):
            entry["ppm"] = ppm.relative_to(out_dir).as_posix()
        if copy_if_exists(frame_dir / f"{stem}.json", meta):
            entry["meta"] = meta.relative_to(out_dir).as_posix()
        rows.append(entry)
    return rows


def collect_sprites(frame_dir: Path, out_dir: Path) -> dict:
    sprite_root = out_dir / "sprites"
    sprite_previews = sprite_root / "sprite_previews"
    src_preview_dir = frame_dir / "sprite_previews"
    preview_files: list[str] = []

    if src_preview_dir.is_dir():
        sprite_previews.mkdir(parents=True, exist_ok=True)
        for src in sorted(src_preview_dir.glob("sprite_*.ppm")):
            dst = sprite_previews / src.name
            shutil.copy2(src, dst)
            preview_files.append(dst.relative_to(out_dir).as_posix())

    result = {"preview_files": preview_files}
    if copy_if_exists(frame_dir / "sprites_screen.ppm", sprite_root / "sprites_screen.ppm"):
        result["screen_preview"] = "sprites/sprites_screen.ppm"
    if copy_if_exists(frame_dir / "sprites.json", sprite_root / "sprites.json"):
        result["meta"] = "sprites/sprites.json"
    return result


def collect_palette(frame_dir: Path, out_dir: Path) -> dict:
    palette_root = out_dir / "palette"
    result: dict[str, str] = {}
    if copy_if_exists(frame_dir / "palette.ppm", palette_root / "palette.ppm"):
        result["preview"] = "palette/palette.ppm"
    if copy_if_exists(frame_dir / "palette.json", palette_root / "palette.json"):
        result["meta"] = "palette/palette.json"
    return result


def collect_raw(frame_dir: Path, out_dir: Path) -> dict:
    raw_root = out_dir / "raw"
    mapping = {
        "vram": "vram.bin",
        "cgram": "cgram.bin",
        "oam": "oam.bin",
        "ppu_state": "ppu_state.json",
        "state": "state.json",
    }
    result: dict[str, str] = {}
    for key, filename in mapping.items():
        if copy_if_exists(frame_dir / filename, raw_root / filename):
            result[key] = f"raw/{filename}"
    return result


def bg_bpp(bg_mode: int, layer_index: int) -> int:
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
    layers = mode_bpp.get(bg_mode)
    if layers is None or layer_index < 0 or layer_index >= len(layers):
        return 0
    return layers[layer_index]


def parse_priority_value(value: object) -> int:
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        match = re.search(r"(\d+)", value)
        if match:
            return int(match.group(1))
    return 0


def to_int(value: object, default: int = 0) -> int:
    try:
        return int(value)  # type: ignore[arg-type]
    except (TypeError, ValueError):
        return default


def to_bool(value: object, default: bool = False) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return bool(value)
    if isinstance(value, str):
        return value.strip().lower() in ("1", "true", "yes", "on")
    return default


def read_tilemap_entry(vram: bytes, base_bytes: int, tile_x: int, tile_y: int) -> int:
    block_x = tile_x // 32
    block_y = tile_y // 32
    local_x = tile_x % 32
    local_y = tile_y % 32
    entry_addr = base_bytes + (block_x * 0x0800) + (block_y * 0x1000) + ((local_y * 32 + local_x) * 2)
    if entry_addr < 0 or entry_addr + 1 >= len(vram):
        return 0
    return vram[entry_addr] | (vram[entry_addr + 1] << 8)


def collect_tilemaps(frame_dir: Path, out_dir: Path, ppu_state_json: dict | None) -> dict:
    if ppu_state_json is None:
        return {
            "enabled": False,
            "reason": "ppu_state.json missing or invalid",
            "layers": [],
        }

    vram_path = frame_dir / "vram.bin"
    if not vram_path.is_file():
        return {
            "enabled": False,
            "reason": "vram.bin missing",
            "layers": [],
        }
    vram = vram_path.read_bytes()

    tilemaps_root = out_dir / "tilemaps"
    tilemaps_root.mkdir(parents=True, exist_ok=True)

    bg_mode = to_int(ppu_state_json.get("ppu.bgMode"), 0)
    main_screen_layers = to_int(ppu_state_json.get("ppu.mainScreenLayers"), 0)
    sub_screen_layers = to_int(ppu_state_json.get("ppu.subScreenLayers"), 0)
    rows: list[dict] = []
    for layer_index, layer_name in enumerate(BG_LAYER_NAMES):
        bpp = bg_bpp(bg_mode, layer_index)
        enabled_on_main = (main_screen_layers & (1 << layer_index)) != 0
        enabled_on_sub = (sub_screen_layers & (1 << layer_index)) != 0
        layer_state = {
            "tilemapAddress": to_int(ppu_state_json.get(f"ppu.layers[{layer_index}].tilemapAddress")),
            "chrAddress": to_int(ppu_state_json.get(f"ppu.layers[{layer_index}].chrAddress")),
            "doubleWidth": to_bool(ppu_state_json.get(f"ppu.layers[{layer_index}].doubleWidth")),
            "doubleHeight": to_bool(ppu_state_json.get(f"ppu.layers[{layer_index}].doubleHeight")),
            "largeTiles": to_bool(ppu_state_json.get(f"ppu.layers[{layer_index}].largeTiles")),
            "hscroll": to_int(ppu_state_json.get(f"ppu.layers[{layer_index}].hscroll")),
            "vscroll": to_int(ppu_state_json.get(f"ppu.layers[{layer_index}].vscroll")),
        }
        width_tiles = 64 if layer_state["doubleWidth"] else 32
        height_tiles = 64 if layer_state["doubleHeight"] else 32
        tilemap_base_bytes = int(layer_state["tilemapAddress"]) << 1
        tile_usage: Counter[int] = Counter()
        palette_usage: Counter[int] = Counter()

        entry_words: list[list[int]] = []
        tile_index_rows: list[list[int]] = []
        palette_rows: list[list[int]] = []
        priority_rows: list[list[int]] = []
        hflip_rows: list[list[int]] = []
        vflip_rows: list[list[int]] = []

        for tile_y in range(height_tiles):
            entry_row: list[int] = []
            tile_index_row: list[int] = []
            palette_row: list[int] = []
            priority_row: list[int] = []
            hflip_row: list[int] = []
            vflip_row: list[int] = []

            for tile_x in range(width_tiles):
                entry = read_tilemap_entry(vram, tilemap_base_bytes, tile_x, tile_y)
                tile_index = entry & 0x03FF
                palette = (entry >> 10) & 0x07
                priority = 1 if (entry & 0x2000) else 0
                hflip = 1 if (entry & 0x4000) else 0
                vflip = 1 if (entry & 0x8000) else 0

                entry_row.append(entry)
                tile_index_row.append(tile_index)
                palette_row.append(palette)
                priority_row.append(priority)
                hflip_row.append(hflip)
                vflip_row.append(vflip)
                tile_usage[tile_index] += 1
                palette_usage[palette] += 1

            entry_words.append(entry_row)
            tile_index_rows.append(tile_index_row)
            palette_rows.append(palette_row)
            priority_rows.append(priority_row)
            hflip_rows.append(hflip_row)
            vflip_rows.append(vflip_row)

        json_rel = f"tilemaps/{layer_name}_tilemap.json"
        csv_rel = f"tilemaps/{layer_name}_tilemap.csv"
        json_path = out_dir / json_rel
        csv_path = out_dir / csv_rel

        layer_payload = {
            "layer": layer_index,
            "name": layer_name,
            "bgMode": bg_mode,
            "bpp": bpp,
            "active": bpp > 0,
            "enabledOnMain": enabled_on_main,
            "enabledOnSub": enabled_on_sub,
            "state": layer_state,
            "grid": {
                "widthTiles": width_tiles,
                "heightTiles": height_tiles,
                "tilemapBaseBytes": tilemap_base_bytes,
                "tilemapBaseWords": int(layer_state["tilemapAddress"]),
                "chrBaseWords": int(layer_state["chrAddress"]),
            },
            "stats": {
                "entryCount": width_tiles * height_tiles,
                "uniqueTiles": len(tile_usage),
                "nonZeroTiles": sum(count for tile, count in tile_usage.items() if tile != 0),
                "paletteUsage": {str(index): palette_usage.get(index, 0) for index in range(8)},
                "topTiles": [
                    {"tileIndex": tile_index, "count": count}
                    for tile_index, count in tile_usage.most_common(16)
                ],
            },
            "maps": {
                "entryWords": entry_words,
                "tileIndex": tile_index_rows,
                "palette": palette_rows,
                "priority": priority_rows,
                "hflip": hflip_rows,
                "vflip": vflip_rows,
            },
        }

        json_path.write_text(json.dumps(layer_payload, indent=2) + "\n", encoding="utf-8")
        with csv_path.open("w", encoding="utf-8", newline="") as csv_file:
            writer = csv.writer(csv_file)
            writer.writerow(("row", "col", "entryHex", "tileIndex", "palette", "priority", "hflip", "vflip"))
            for tile_y in range(height_tiles):
                for tile_x in range(width_tiles):
                    entry = entry_words[tile_y][tile_x]
                    writer.writerow((
                        tile_y,
                        tile_x,
                        f"0x{entry:04X}",
                        tile_index_rows[tile_y][tile_x],
                        palette_rows[tile_y][tile_x],
                        priority_rows[tile_y][tile_x],
                        hflip_rows[tile_y][tile_x],
                        vflip_rows[tile_y][tile_x],
                    ))

        rows.append({
            "name": layer_name,
            "layer": layer_index,
            "active": bpp > 0,
            "enabledOnMain": enabled_on_main,
            "enabledOnSub": enabled_on_sub,
            "bpp": bpp,
            "json": json_rel,
            "csv": csv_rel,
        })

    return {
        "enabled": True,
        "bgMode": bg_mode,
        "layers": rows,
    }


def collect_sprite_analysis(frame_dir: Path, out_dir: Path) -> dict:
    sprites_json = load_json_if_exists(frame_dir / "sprites.json")
    if not isinstance(sprites_json, dict):
        return {
            "enabled": False,
            "reason": "sprites.json missing or invalid",
        }

    sprites = sprites_json.get("sprites")
    if not isinstance(sprites, list):
        return {
            "enabled": False,
            "reason": "sprites.json has no sprites array",
        }

    visible = [row for row in sprites if isinstance(row, dict) and row.get("visibility") == "Visible"]
    sorted_visible = sorted(
        visible,
        key=lambda row: (
            parse_priority_value(row.get("priority")),
            to_int(row.get("y")),
            to_int(row.get("x")),
            to_int(row.get("spriteIndex")),
        ),
    )
    priority_counts: Counter[str] = Counter(str(row.get("priority", "Unknown")) for row in visible)

    out_path = out_dir / "sprites" / "sprites_visible.json"
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps(
            {
                "visibleCount": len(visible),
                "priorityCounts": dict(priority_counts),
                "sprites": sorted_visible,
            },
            indent=2,
        ) + "\n",
        encoding="utf-8",
    )

    return {
        "enabled": True,
        "totalCount": len(sprites),
        "visibleCount": len(visible),
        "priorityCounts": dict(priority_counts),
        "visibleList": "sprites/sprites_visible.json",
    }


def extract_ppu_summary(state_json: dict | None, ppu_state_json: dict | None) -> dict:
    summary: dict[str, object] = {}
    if state_json and isinstance(state_json.get("ppu"), dict):
        ppu = state_json["ppu"]
        for key in ("bgMode", "mainScreenLayers", "subScreenLayers", "brightness", "forcedBlank", "directColorMode"):
            if key in ppu:
                summary[key] = ppu[key]
        if isinstance(ppu.get("mode7"), dict):
            mode7 = ppu["mode7"]
            summary["mode7"] = {
                "matrix": mode7.get("matrix"),
                "centerX": mode7.get("centerX"),
                "centerY": mode7.get("centerY"),
                "hScroll": mode7.get("hScroll"),
                "vScroll": mode7.get("vScroll"),
            }
    if ppu_state_json:
        for key in (
            "ppu.oamBaseAddress",
            "ppu.oamAddressOffset",
            "ppu.oamMode",
            "ppu.mode7.matrix[0]",
            "ppu.mode7.matrix[3]",
        ):
            if key in ppu_state_json:
                summary[key] = ppu_state_json[key]
    return summary


def main() -> int:
    args = parse_args()
    frame_dir = args.frame_dir.resolve()
    out_dir = args.out_dir.resolve()

    if not frame_dir.is_dir():
        raise SystemExit(f"error: frame directory not found: {frame_dir}")

    if args.clean_out and out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    layers = collect_layers(frame_dir, out_dir)
    tilesets = collect_tilesets(frame_dir, out_dir)
    sprites = collect_sprites(frame_dir, out_dir)
    palette = collect_palette(frame_dir, out_dir)
    raw = collect_raw(frame_dir, out_dir)

    state_json = load_json_if_exists(frame_dir / "state.json")
    ppu_state_json = load_json_if_exists(frame_dir / "ppu_state.json")
    tilemaps = collect_tilemaps(frame_dir, out_dir, ppu_state_json)
    sprite_analysis = collect_sprite_analysis(frame_dir, out_dir)
    manifest = {
        "source_frame_dir": str(frame_dir),
        "pack_dir": str(out_dir),
        "frame_number": infer_frame_number(frame_dir),
        "created_utc": dt.datetime.now(dt.UTC).isoformat(),
        "ppu_summary": extract_ppu_summary(state_json, ppu_state_json),
        "layers": layers,
        "tilesets": tilesets,
        "sprites": sprites,
        "sprite_analysis": sprite_analysis,
        "tilemaps": tilemaps,
        "palette": palette,
        "raw": raw,
        "inspector_hints": {
            "tilemaps": "Use layers/*.ppm and layers/*_visible.ppm to inspect composed BG/map output.",
            "tilemap_entries": "Use tilemaps/bg*_tilemap.json (or csv) for raw tile index/palette/flip/priority per cell.",
            "tilesets": "Use tilesets/tiles_bg*.ppm + json for CHR decode and layer CHR base context.",
            "sprites": "Use sprites/sprites_screen.ppm + sprite_previews/*.ppm + sprites.json metadata.",
            "sprite_draw_order": "Use sprites/sprites_visible.json to inspect visible sprites grouped by priority.",
            "raw_memory": "Use raw/vram.bin, raw/cgram.bin, raw/oam.bin for custom tooling and round-trip edits.",
        },
    }
    manifest_path = out_dir / "design_pack.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")

    print(f"wrote design pack {out_dir}")
    print(f"manifest: {manifest_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
