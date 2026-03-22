#!/usr/bin/env python3
"""Build a frame-level visual contract from a Mesen design pack."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
from collections import Counter
from pathlib import Path


BG_LAYER_NAMES = ("bg1", "bg2", "bg3", "bg4")
BYTES_PER_TILE_BY_BPP = {
    2: 16,
    4: 32,
    8: 64,
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize a design-pack frame into a translation-oriented visual "
            "contract that separates BG tilemap/CHR state from OBJ/OAM state."
        )
    )
    parser.add_argument("design_pack_dir", type=Path, help="Directory containing design_pack.json.")
    parser.add_argument("out_json", type=Path, help="Output visual-contract JSON path.")
    parser.add_argument(
        "--provenance-json",
        type=Path,
        help=(
            "Optional tilemap provenance artifact (.json or .jsonc) used to attach "
            "runtime chunk evidence to matching BG layers."
        ),
    )
    parser.add_argument(
        "--probe-json",
        type=Path,
        help=(
            "Optional mesen_probe_boot output JSON used to attach producer-side "
            "write-breakpoint ownership to the visual contract."
        ),
    )
    return parser.parse_args()


def strip_jsonc_comments(text: str) -> str:
    result: list[str] = []
    in_string = False
    escape = False
    line_comment = False
    block_comment = False
    index = 0
    while index < len(text):
        char = text[index]
        next_char = text[index + 1] if index + 1 < len(text) else ""

        if line_comment:
            if char == "\n":
                line_comment = False
                result.append(char)
            index += 1
            continue

        if block_comment:
            if char == "*" and next_char == "/":
                block_comment = False
                index += 2
            else:
                index += 1
            continue

        if in_string:
            result.append(char)
            if escape:
                escape = False
            elif char == "\\":
                escape = True
            elif char == '"':
                in_string = False
            index += 1
            continue

        if char == "/" and next_char == "/":
            line_comment = True
            index += 2
            continue

        if char == "/" and next_char == "*":
            block_comment = True
            index += 2
            continue

        result.append(char)
        if char == '"':
            in_string = True
        index += 1

    return "".join(result)


def load_json_like(path: Path) -> object:
    text = path.read_text(encoding="utf-8")
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        return json.loads(strip_jsonc_comments(text))


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
        lowered = value.strip().lower()
        if lowered in ("1", "true", "yes", "on"):
            return True
        if lowered in ("0", "false", "no", "off"):
            return False
    return default


def parse_priority_number(value: object) -> int:
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        match = re.search(r"(\d+)", value)
        if match:
            return int(match.group(1))
    return 0


def flatten_number_rows(rows: object) -> list[int]:
    if not isinstance(rows, list):
        return []
    flattened: list[int] = []
    for row in rows:
        if isinstance(row, list):
            flattened.extend(to_int(value) for value in row)
    return flattened


def collapse_consecutive_values(values: list[int]) -> list[dict[str, int]]:
    if not values:
        return []

    ranges: list[dict[str, int]] = []
    start = values[0]
    end = values[0]
    count = 1
    for value in values[1:]:
        if value == end + 1:
            end = value
            count += 1
            continue
        ranges.append({"start": start, "end": end, "count": count})
        start = value
        end = value
        count = 1
    ranges.append({"start": start, "end": end, "count": count})
    return ranges


def collapse_step_values(values: list[int], step: int) -> list[dict[str, int]]:
    if not values:
        return []

    ranges: list[dict[str, int]] = []
    start = values[0]
    end = values[0]
    count = 1
    for value in values[1:]:
        if value == end + step:
            end = value
            count += 1
            continue
        ranges.append(
            {
                "start": start,
                "end": end,
                "count": count,
                "endExclusive": end + step,
            }
        )
        start = value
        end = value
        count = 1
    ranges.append(
        {
            "start": start,
            "end": end,
            "count": count,
            "endExclusive": end + step,
        }
    )
    return ranges


def layer_names_from_mask(mask: int) -> list[str]:
    return [name for index, name in enumerate(BG_LAYER_NAMES) if (mask & (1 << index)) != 0]


def normalize_layer_provenance(row: dict) -> dict:
    candidate_chunks = row.get("candidate_chunks")
    if isinstance(candidate_chunks, list):
        normalized_candidates = candidate_chunks
    else:
        candidate_chunk = row.get("candidate_chunk")
        normalized_candidates = [candidate_chunk] if isinstance(candidate_chunk, dict) else []

    result = {
        "candidateStatus": row.get("candidate_status"),
        "candidateChunks": normalized_candidates,
    }
    if "tilemap_json_matches" in row:
        result["tilemapJsonMatches"] = row["tilemap_json_matches"]
    if "raw_dump_matches" in row:
        result["rawDumpMatches"] = row["raw_dump_matches"]
    return result


def build_provenance_lookup(provenance_json: object, frame_number: int | None) -> dict:
    if not isinstance(provenance_json, dict) or frame_number is None:
        return {
            "enabled": False,
            "reason": "missing provenance or frame number",
            "layers": {},
            "frameComparison": None,
        }

    layer_rows: dict[str, dict] = {}
    for row in provenance_json.get("rows", []):
        if not isinstance(row, dict) or row.get("frame") != frame_number:
            continue
        layer_name = row.get("layer_name")
        if isinstance(layer_name, str):
            layer_rows[layer_name] = normalize_layer_provenance(row)

    frame_comparison = None
    for row in provenance_json.get("frame_comparisons", []):
        if isinstance(row, dict) and row.get("frame") == frame_number:
            frame_comparison = row
            break

    runtime_reference = None
    if "runtime_reference" in provenance_json and isinstance(provenance_json["runtime_reference"], dict):
        runtime_reference = provenance_json["runtime_reference"]
    elif "l001210_exec_json" in provenance_json:
        runtime_reference = {
            "sourceExecJson": provenance_json.get("l001210_exec_json"),
            "method": "direct-exec-trace",
        }

    return {
        "enabled": True,
        "sourcePath": provenance_json.get("design_pack_range"),
        "runtimeReference": runtime_reference,
        "chunkValidationInputs": provenance_json.get("chunk_validation_inputs", []),
        "summary": provenance_json.get("summary"),
        "layers": layer_rows,
        "frameComparison": frame_comparison,
    }


def build_bg_layer_contract(tilemap_json: dict, provenance_row: dict | None) -> dict:
    active = to_bool(tilemap_json.get("active"))
    tile_indices = flatten_number_rows(tilemap_json.get("maps", {}).get("tileIndex"))
    palette_indices = flatten_number_rows(tilemap_json.get("maps", {}).get("palette"))
    priority_values = flatten_number_rows(tilemap_json.get("maps", {}).get("priority"))
    hflip_values = flatten_number_rows(tilemap_json.get("maps", {}).get("hflip"))
    vflip_values = flatten_number_rows(tilemap_json.get("maps", {}).get("vflip"))

    unique_tiles = sorted(set(tile_indices))
    non_zero_tiles = [value for value in unique_tiles if value != 0]
    unique_palettes = sorted(set(palette_indices))
    bytes_per_tile = BYTES_PER_TILE_BY_BPP.get(to_int(tilemap_json.get("bpp")), 0)
    chr_base_words = to_int(tilemap_json.get("grid", {}).get("chrBaseWords"))
    chr_base_bytes = chr_base_words * 2

    chr_byte_ranges: list[dict[str, int]] = []
    for value_range in collapse_consecutive_values(unique_tiles):
        if bytes_per_tile <= 0:
            continue
        chr_byte_ranges.append(
            {
                "tileStart": value_range["start"],
                "tileEnd": value_range["end"],
                "count": value_range["count"],
                "byteStart": chr_base_bytes + (value_range["start"] * bytes_per_tile),
                "byteEndExclusive": chr_base_bytes + ((value_range["end"] + 1) * bytes_per_tile),
            }
        )

    priority_counts = Counter(priority_values)
    top_tiles = tilemap_json.get("stats", {}).get("topTiles")

    if active:
        tile_usage = {
            "uniqueTileCount": len(unique_tiles),
            "nonZeroTileCount": len(non_zero_tiles),
            "tileIndexRanges": collapse_consecutive_values(unique_tiles),
            "nonZeroTileIndexRanges": collapse_consecutive_values(non_zero_tiles),
            "paletteIndices": unique_palettes,
            "priorityCounts": {str(key): count for key, count in sorted(priority_counts.items())},
            "hflipCount": sum(1 for value in hflip_values if value != 0),
            "vflipCount": sum(1 for value in vflip_values if value != 0),
            "topTiles": top_tiles if isinstance(top_tiles, list) else [],
        }
    else:
        tile_usage = {
            "uniqueTileCount": 0,
            "nonZeroTileCount": 0,
            "tileIndexRanges": [],
            "nonZeroTileIndexRanges": [],
            "paletteIndices": [],
            "priorityCounts": {},
            "hflipCount": 0,
            "vflipCount": 0,
            "topTiles": [],
            "note": "Layer is inactive in this frame; raw tilemap memory is not promoted as active visual usage.",
        }
        chr_byte_ranges = []

    layer_contract = {
        "name": tilemap_json.get("name"),
        "layer": tilemap_json.get("layer"),
        "bgMode": tilemap_json.get("bgMode"),
        "bpp": tilemap_json.get("bpp"),
        "active": active,
        "enabledOnMain": to_bool(tilemap_json.get("enabledOnMain")),
        "enabledOnSub": to_bool(tilemap_json.get("enabledOnSub")),
        "state": {
            "tilemapBaseWords": to_int(tilemap_json.get("grid", {}).get("tilemapBaseWords")),
            "chrBaseWords": chr_base_words,
            "doubleWidth": to_bool(tilemap_json.get("state", {}).get("doubleWidth")),
            "doubleHeight": to_bool(tilemap_json.get("state", {}).get("doubleHeight")),
            "largeTiles": to_bool(tilemap_json.get("state", {}).get("largeTiles")),
            "hscroll": to_int(tilemap_json.get("state", {}).get("hscroll")),
            "vscroll": to_int(tilemap_json.get("state", {}).get("vscroll")),
        },
        "grid": tilemap_json.get("grid"),
        "tileUsage": tile_usage,
        "chrUsage": {
            "bytesPerTile": bytes_per_tile,
            "chrBaseBytes": chr_base_bytes,
            "byteRanges": chr_byte_ranges,
        },
    }

    if provenance_row:
        layer_contract["provenance"] = provenance_row

    return layer_contract


def sprite_signature(sprite: dict) -> tuple:
    return (
        sprite["priorityNumber"],
        sprite["priorityName"],
        sprite["palette"],
        sprite["bpp"],
        sprite["height"],
        sprite["y"],
        sprite["horizontalMirror"],
        sprite["verticalMirror"],
    )


def build_sprite_strip_candidates(sprites: list[dict]) -> list[dict]:
    if not sprites:
        return []

    sorted_sprites = sorted(
        sprites,
        key=lambda row: (
            row["priorityNumber"],
            row["y"],
            row["x"],
            row["spriteIndex"],
        ),
    )

    groups: list[list[dict]] = []
    current_group = [sorted_sprites[0]]
    for sprite in sorted_sprites[1:]:
        previous = current_group[-1]
        gap = sprite["x"] - (previous["x"] + previous["width"])
        same_signature = sprite_signature(sprite) == sprite_signature(previous)
        if same_signature and -8 <= gap <= 16:
            current_group.append(sprite)
            continue
        groups.append(current_group)
        current_group = [sprite]
    groups.append(current_group)

    candidates: list[dict] = []
    for group in groups:
        if len(group) < 2:
            continue
        tile_indices = sorted(sprite["tileIndex"] for sprite in group)
        sprite_indices = [sprite["spriteIndex"] for sprite in group]
        x_start = min(sprite["x"] for sprite in group)
        x_end = max(sprite["x"] + sprite["width"] for sprite in group)
        candidates.append(
            {
                "kind": "horizontal_strip_candidate",
                "memberCount": len(group),
                "spriteIndices": sprite_indices,
                "tileIndexRanges": collapse_consecutive_values(tile_indices),
                "bounds": {
                    "x": x_start,
                    "y": group[0]["y"],
                    "width": x_end - x_start,
                    "height": max(sprite["height"] for sprite in group),
                },
                "sharedFields": {
                    "priorityName": group[0]["priorityName"],
                    "priorityNumber": group[0]["priorityNumber"],
                    "palette": group[0]["palette"],
                    "bpp": group[0]["bpp"],
                    "horizontalMirror": group[0]["horizontalMirror"],
                    "verticalMirror": group[0]["verticalMirror"],
                },
            }
        )
    return candidates


def build_obj_contract(sprites_visible_json: dict | None, ppu_summary: dict, frame_comparison: dict | None) -> dict:
    if not isinstance(sprites_visible_json, dict):
        return {
            "enabled": False,
            "reason": "sprites_visible.json missing or invalid",
        }

    raw_sprites = sprites_visible_json.get("sprites")
    if not isinstance(raw_sprites, list):
        return {
            "enabled": False,
            "reason": "sprites_visible.json has no sprites array",
        }

    normalized_sprites: list[dict] = []
    for row in raw_sprites:
        if not isinstance(row, dict):
            continue
        normalized_sprites.append(
            {
                "spriteIndex": to_int(row.get("spriteIndex")),
                "x": to_int(row.get("x")),
                "y": to_int(row.get("y")),
                "rawX": to_int(row.get("rawX")),
                "rawY": to_int(row.get("rawY")),
                "width": to_int(row.get("width")),
                "height": to_int(row.get("height")),
                "tileIndex": to_int(row.get("tileIndex")),
                "tileAddress": to_int(row.get("tileAddress")),
                "palette": to_int(row.get("palette")),
                "paletteAddress": to_int(row.get("paletteAddress")),
                "bpp": to_int(row.get("bpp")),
                "priorityName": str(row.get("priority", "Unknown")),
                "priorityNumber": parse_priority_number(row.get("priority")),
                "mode": row.get("mode"),
                "horizontalMirror": to_bool(row.get("horizontalMirror")),
                "verticalMirror": to_bool(row.get("verticalMirror")),
                "previewFile": row.get("previewFile"),
            }
        )

    palette_counts = Counter(sprite["palette"] for sprite in normalized_sprites)
    size_counts = Counter(f"{sprite['width']}x{sprite['height']}" for sprite in normalized_sprites)
    priority_counts = Counter(sprite["priorityName"] for sprite in normalized_sprites)
    base_tile_indices = sorted(set(sprite["tileIndex"] for sprite in normalized_sprites))
    base_tile_addresses = sorted(set(sprite["tileAddress"] for sprite in normalized_sprites))

    address_ranges_by_bpp: dict[str, list[dict[str, int]]] = {}
    for bpp in sorted(set(sprite["bpp"] for sprite in normalized_sprites)):
        step = BYTES_PER_TILE_BY_BPP.get(bpp)
        if not step:
            continue
        addresses = sorted(set(sprite["tileAddress"] for sprite in normalized_sprites if sprite["bpp"] == bpp))
        address_ranges_by_bpp[str(bpp)] = collapse_step_values(addresses, step)

    result = {
        "enabled": True,
        "state": {
            "oamBaseAddress": ppu_summary.get("ppu.oamBaseAddress"),
            "oamAddressOffset": ppu_summary.get("ppu.oamAddressOffset"),
            "oamMode": ppu_summary.get("ppu.oamMode"),
        },
        "visibleCount": len(normalized_sprites),
        "baseTileUsage": {
            "tileIndexRanges": collapse_consecutive_values(base_tile_indices),
            "tileAddressRangesByBpp": address_ranges_by_bpp,
        },
        "paletteCounts": {str(key): count for key, count in sorted(palette_counts.items())},
        "priorityCounts": dict(priority_counts),
        "sizeCounts": dict(size_counts),
        "stripCandidates": build_sprite_strip_candidates(normalized_sprites),
        "sprites": normalized_sprites,
        "translationHints": {
            "sourceOfTruth": "OBJ is OAM-driven. Use sprites_visible.json plus raw/oam.bin, raw/cgram.bin, and raw/ppu_state.json.",
            "tilemapNote": "Visible OBJ state is not derivable from BG tilemaps alone.",
        },
    }

    if isinstance(frame_comparison, dict):
        result["frameComparison"] = frame_comparison

    return result


def format_snes_pc(bank: int, pc: int) -> str:
    return f"{bank & 0xFF:02X}:{pc & 0xFFFF:04X}"


def trace_domain_for_point_snes(point_snes: object) -> str:
    if not isinstance(point_snes, str):
        return "unclassified"
    if point_snes in ("00:2102", "00:2103", "00:2104"):
        return "oam"
    if point_snes in ("00:2115", "00:2116", "00:2117", "00:2118", "00:2119"):
        return "vram"
    if point_snes in ("00:2121", "00:2122"):
        return "cgram"
    if point_snes in ("00:2101",):
        return "obj_state"
    return "unclassified"


def top_counter_rows(counter: Counter[str], limit: int = 12) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for key, count in counter.most_common(limit):
        rows.append({"id": key, "count": count})
    return rows


def summarize_probe_trace(probe_json: object) -> dict:
    if not isinstance(probe_json, dict):
        return {
            "enabled": False,
            "reason": "probe json missing or invalid",
        }

    write_point_trace = probe_json.get("write_point_trace")
    if not isinstance(write_point_trace, dict):
        return {
            "enabled": False,
            "reason": "probe json has no write_point_trace",
        }

    raw_hits = write_point_trace.get("hits")
    if not isinstance(raw_hits, list):
        return {
            "enabled": False,
            "reason": "probe write_point_trace has no hits array",
        }

    domains: dict[str, dict[str, object]] = {}
    total_hits = 0
    for row in raw_hits:
        if not isinstance(row, dict):
            continue

        total_hits += 1
        point_snes = row.get("point_snes")
        domain = trace_domain_for_point_snes(point_snes)
        domain_entry = domains.setdefault(
            domain,
            {
                "domain": domain,
                "writeCount": 0,
                "pointCounts": Counter(),
                "callsiteCounts": Counter(),
                "activeMainCallbackCounts": Counter(),
                "activeIrqCallbackCounts": Counter(),
                "frames": set(),
                "sampleHits": [],
            },
        )

        point_id = str(row.get("point_id", point_snes or "unknown"))
        cpu_pc_snes = format_snes_pc(to_int(row.get("cpu_k")), to_int(row.get("cpu_pc")))
        active_main_callback_snes = format_snes_pc(
            to_int(row.get("active_main_callback_bank")),
            to_int(row.get("active_main_callback_addr")),
        )
        active_irq_callback_snes = format_snes_pc(
            to_int(row.get("active_irq_callback_bank")),
            to_int(row.get("active_irq_callback_addr")),
        )

        domain_entry["writeCount"] = to_int(domain_entry["writeCount"]) + 1
        domain_entry["pointCounts"][point_id] += 1  # type: ignore[index]
        domain_entry["callsiteCounts"][cpu_pc_snes] += 1  # type: ignore[index]
        domain_entry["activeMainCallbackCounts"][active_main_callback_snes] += 1  # type: ignore[index]
        domain_entry["activeIrqCallbackCounts"][active_irq_callback_snes] += 1  # type: ignore[index]
        domain_entry["frames"].add(to_int(row.get("frame")))  # type: ignore[union-attr]

        sample_hits = domain_entry["sampleHits"]
        if isinstance(sample_hits, list) and len(sample_hits) < 16:
            sample_hits.append(
                {
                    "frame": to_int(row.get("frame")),
                    "scanline": to_int(row.get("scanline")),
                    "pointId": point_id,
                    "pointSnes": point_snes,
                    "value": to_int(row.get("value")),
                    "cpuPcSnes": cpu_pc_snes,
                    "cpuA": to_int(row.get("cpu_a")),
                    "cpuX": to_int(row.get("cpu_x")),
                    "cpuY": to_int(row.get("cpu_y")),
                    "activeMainCallbackSnes": active_main_callback_snes,
                    "activeIrqCallbackSnes": active_irq_callback_snes,
                    "bgMode": to_int(row.get("bg_mode")),
                    "mainScreenLayers": to_int(row.get("main_screen_layers")),
                    "subScreenLayers": to_int(row.get("sub_screen_layers")),
                }
            )

    summarized_domains: list[dict] = []
    for domain_name in sorted(domains):
        entry = domains[domain_name]
        frames = sorted(entry["frames"])  # type: ignore[arg-type]
        summarized_domains.append(
            {
                "domain": domain_name,
                "writeCount": entry["writeCount"],
                "frameRange": {
                    "start": frames[0] if frames else None,
                    "end": frames[-1] if frames else None,
                    "frames": frames,
                },
                "pointCounts": top_counter_rows(entry["pointCounts"]),  # type: ignore[arg-type]
                "callsiteCounts": top_counter_rows(entry["callsiteCounts"]),  # type: ignore[arg-type]
                "activeMainCallbackCounts": top_counter_rows(entry["activeMainCallbackCounts"]),  # type: ignore[arg-type]
                "activeIrqCallbackCounts": top_counter_rows(entry["activeIrqCallbackCounts"]),  # type: ignore[arg-type]
                "sampleHits": entry["sampleHits"],
            }
        )

    return {
        "enabled": True,
        "traceWindow": {
            "startFrame": probe_json.get("trace_start_frame"),
            "endFrame": probe_json.get("trace_end_frame"),
        },
        "writePointHitCount": total_hits,
        "droppedHits": write_point_trace.get("dropped_hits"),
        "domains": summarized_domains,
    }


def resolve_optional_json(base_dir: Path, relative_path: str | None) -> dict | None:
    if not relative_path:
        return None
    path = base_dir / relative_path
    if not path.is_file():
        return None
    data = load_json_like(path)
    return data if isinstance(data, dict) else None


def main() -> int:
    args = parse_args()
    design_pack_dir = args.design_pack_dir.resolve()
    out_json = args.out_json.resolve()

    manifest_path = design_pack_dir / "design_pack.json"
    if not manifest_path.is_file():
        raise SystemExit(f"error: design pack manifest not found: {manifest_path}")

    manifest = load_json_like(manifest_path)
    if not isinstance(manifest, dict):
        raise SystemExit(f"error: invalid design pack manifest: {manifest_path}")

    frame_number = manifest.get("frame_number")
    frame_number = to_int(frame_number) if frame_number is not None else None

    provenance_lookup = {
        "enabled": False,
        "layers": {},
        "frameComparison": None,
    }
    if args.provenance_json:
        provenance_json = load_json_like(args.provenance_json.resolve())
        provenance_lookup = build_provenance_lookup(provenance_json, frame_number)

    producer_trace = {
        "enabled": False,
        "reason": "probe json not provided",
    }
    if args.probe_json:
        probe_json = load_json_like(args.probe_json.resolve())
        producer_trace = summarize_probe_trace(probe_json)
        producer_trace["sourceProbeJson"] = str(args.probe_json.resolve())

    ppu_summary = manifest.get("ppu_summary")
    if not isinstance(ppu_summary, dict):
        ppu_summary = {}

    bg_layers: list[dict] = []
    active_main_layers: list[str] = []
    active_sub_layers: list[str] = []
    tilemaps = manifest.get("tilemaps")
    if isinstance(tilemaps, dict):
        for row in tilemaps.get("layers", []):
            if not isinstance(row, dict):
                continue
            json_rel = row.get("json")
            layer_name = row.get("name")
            if not isinstance(json_rel, str) or not isinstance(layer_name, str):
                continue
            tilemap_path = design_pack_dir / json_rel
            tilemap_json = load_json_like(tilemap_path)
            if not isinstance(tilemap_json, dict):
                continue
            layer_contract = build_bg_layer_contract(
                tilemap_json,
                provenance_lookup.get("layers", {}).get(layer_name),
            )
            bg_layers.append(layer_contract)
            if layer_contract.get("enabledOnMain"):
                active_main_layers.append(layer_name)
            if layer_contract.get("enabledOnSub"):
                active_sub_layers.append(layer_name)

    sprites_visible_json = resolve_optional_json(
        design_pack_dir,
        manifest.get("sprite_analysis", {}).get("visibleList")
        if isinstance(manifest.get("sprite_analysis"), dict)
        else None,
    )
    obj_contract = build_obj_contract(
        sprites_visible_json,
        ppu_summary,
        provenance_lookup.get("frameComparison"),
    )

    contract = {
        "schema": "td2.visual_contract.v1",
        "createdUtc": dt.datetime.now(dt.UTC).isoformat(),
        "source": {
            "designPackDir": str(design_pack_dir),
            "designPackManifest": str(manifest_path),
            "frameNumber": frame_number,
            "provenancePath": str(args.provenance_json.resolve()) if args.provenance_json else None,
        },
        "frame": {
            "frameNumber": frame_number,
            "bgMode": ppu_summary.get("bgMode"),
            "brightness": ppu_summary.get("brightness"),
            "forcedBlank": ppu_summary.get("forcedBlank"),
            "mainScreenLayers": ppu_summary.get("mainScreenLayers"),
            "subScreenLayers": ppu_summary.get("subScreenLayers"),
            "mainLayerNames": active_main_layers
            or layer_names_from_mask(to_int(ppu_summary.get("mainScreenLayers"))),
            "subLayerNames": active_sub_layers
            or layer_names_from_mask(to_int(ppu_summary.get("subScreenLayers"))),
            "mode7": ppu_summary.get("mode7"),
        },
        "translationSurface": {
            "bgSourceOfTruth": "Use tilemaps/bg*_tilemap.json plus tilesets/tiles_bg*.json and raw/vram.bin.",
            "objSourceOfTruth": "Use sprites/sprites_visible.json plus raw/oam.bin, raw/cgram.bin, and raw/ppu_state.json.",
            "assemblyBridge": "Bind BG rows to runtime chunk provenance first; bind OBJ producers through breakpoint/write traces next.",
        },
        "bg": {
            "layerCount": len(bg_layers),
            "activeLayerCount": sum(1 for row in bg_layers if row.get("active")),
            "layers": bg_layers,
        },
        "obj": obj_contract,
        "provenance": {
            "enabled": provenance_lookup.get("enabled", False),
            "runtimeReference": provenance_lookup.get("runtimeReference"),
            "chunkValidationInputs": provenance_lookup.get("chunkValidationInputs", []),
            "summary": provenance_lookup.get("summary"),
        },
        "producerTrace": producer_trace,
    }

    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(contract, indent=2) + "\n", encoding="utf-8")
    print(f"wrote visual contract {out_json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
