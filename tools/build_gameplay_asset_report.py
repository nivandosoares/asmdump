#!/usr/bin/env python3
"""Build a compact gameplay-facing asset inventory from existing lane-3 artifacts."""

from __future__ import annotations

import argparse
import json
from datetime import date
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize one gameplay seed into an asset-first report that maps "
            "visible surfaces to memory, PPU, and callback tracing targets."
        )
    )
    parser.add_argument("--label", required=True, help="Short scene/report label.")
    parser.add_argument(
        "--source-seed",
        type=Path,
        required=True,
        help="Savestate or seed path used as the primary scene anchor.",
    )
    parser.add_argument("--frame-image", type=Path, required=True, help="Visible frame PNG.")
    parser.add_argument("--bg1-image", type=Path, required=True, help="Isolated BG1 render.")
    parser.add_argument("--bg2-image", type=Path, required=True, help="Isolated BG2 render.")
    parser.add_argument("--obj-image", type=Path, required=True, help="Isolated OBJ render.")
    parser.add_argument(
        "--design-pack",
        type=Path,
        required=True,
        help="Design-pack manifest used to source tilemap stats.",
    )
    parser.add_argument(
        "--layer-summary",
        type=Path,
        required=True,
        help="Lane-3 layer-stack summary JSON.",
    )
    parser.add_argument(
        "--producer-summary",
        type=Path,
        required=True,
        help="Lane-3 BG2 producer summary JSON.",
    )
    parser.add_argument("--bg1-render", type=Path, required=True, help="BG1 render JSON.")
    parser.add_argument("--bg2-render", type=Path, required=True, help="BG2 render JSON.")
    parser.add_argument("--obj-render", type=Path, required=True, help="OBJ render JSON.")
    parser.add_argument(
        "--ppu-state",
        type=Path,
        required=True,
        help="Flat PPU-state JSON exported from the same seed.",
    )
    parser.add_argument("--out-json", type=Path, required=True, help="Output report JSON.")
    parser.add_argument(
        "--markdown-out",
        type=Path,
        required=True,
        help="Output report Markdown path.",
    )
    return parser.parse_args()


def resolve_repo_path(path_text: Path) -> Path:
    path = path_text if path_text.is_absolute() else (Path.cwd() / path_text)
    return path.resolve()


def repo_rel(path: Path) -> str:
    path = path.resolve()
    try:
        return path.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return path.as_posix()


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def format_hex(value: object) -> str:
    if not isinstance(value, int):
        return "n/a"
    width = 4 if value <= 0xFFFF else 6
    return f"0x{value:0{width}X}"


def build_palette_summary(palette_usage: dict[str, int]) -> list[dict]:
    rows = []
    for key, count in sorted(
        ((int(raw_key), count) for raw_key, count in palette_usage.items() if count),
        key=lambda item: (-item[1], item[0]),
    ):
        rows.append({"palette": key, "count": count})
    return rows


def tilemap_profile(tilemap_json: dict) -> dict:
    stats = tilemap_json.get("stats", {})
    palette_usage = build_palette_summary(stats.get("paletteUsage", {}))
    top_tiles = [
        {"tile_index": item.get("tileIndex", 0), "count": item.get("count", 0)}
        for item in stats.get("topTiles", [])[:5]
    ]
    return {
        "entry_count": stats.get("entryCount", 0),
        "unique_tiles": stats.get("uniqueTiles", 0),
        "non_zero_tiles": stats.get("nonZeroTiles", 0),
        "palette_usage": palette_usage,
        "top_tiles": top_tiles,
    }


def build_component_rows(
    layer_summary: dict,
    producer_summary: dict,
    bg_layer_states: dict[str, dict],
    obj_render: dict,
    tilemaps: dict[str, dict],
) -> list[dict]:
    ppu = layer_summary.get("ppu", {})
    isolated = layer_summary.get("isolated_render_stats", {})
    scanline = layer_summary.get("scanline_scrolls", {})
    exec_trace = producer_summary.get("exec_trace", {})
    ppu_trace = producer_summary.get("ppu_reg_trace", {})
    obj = obj_render.get("obj", {})
    main_layers = set(ppu.get("main_layers_enabled", []))

    bg2_unique_scanlines = ppu_trace.get("bg2_vofs_unique_scanlines", [])
    bg2_scanline_span = (
        f"{min(bg2_unique_scanlines)}..{max(bg2_unique_scanlines)}"
        if bg2_unique_scanlines
        else "n/a"
    )

    return [
        {
            "surface": "BG1",
            "role": "cockpit / dashboard / HUD base",
            "visibility": "main-screen visible" if "bg1" in main_layers else "not visible",
            "vram": {
                "tilemap_base": bg_layer_states["bg1"].get("tilemapAddress"),
                "chr_base": bg_layer_states["bg1"].get("chrAddress"),
            },
            "evidence": [
                "Stable scroll across sampled visible scanlines.",
                f"Static render keeps {isolated.get('bg1', {}).get('non_backdrop_pixels', 0)} non-backdrop pixels.",
                f"Tilemap uses {tilemaps['bg1']['unique_tiles']} unique tiles across {tilemaps['bg1']['entry_count']} entries.",
            ],
            "trace_targets": ["BG1HOFS", "BG1VOFS", "TMAIN @ scanline 120"],
            "confidence": "high",
        },
        {
            "surface": "BG2",
            "role": "road / horizon / world raster",
            "visibility": "main-screen visible" if "bg2" in main_layers else "not visible",
            "vram": {
                "tilemap_base": bg_layer_states["bg2"].get("tilemapAddress"),
                "chr_base": bg_layer_states["bg2"].get("chrAddress"),
            },
            "evidence": [
                "Per-scanline scroll changes while staying enabled on the main screen.",
                f"BG2VOFS/BG2HOFS receive {ppu_trace.get('write_counts', {}).get('bg2vofs', 0)}/{ppu_trace.get('write_counts', {}).get('bg2hofs', 0)} writes.",
                f"BG2VOFS touches {len(bg2_unique_scanlines)} sampled scanlines across {bg2_scanline_span}.",
                f"Tilemap is low-variety ({tilemaps['bg2']['unique_tiles']} unique tiles / {tilemaps['bg2']['entry_count']} entries), which fits a repeating road surface.",
            ],
            "trace_targets": [
                "$22/$23",
                "BG2HOFS",
                "BG2VOFS",
                "next_irq_ptr",
                "VTIMEL",
                "dp_0020/0022",
                "01:9185 -> 02:9165",
                "02:B18D",
                "02:B134 (L012BE2)",
                "02:B101 -> L012D5A",
            ],
            "confidence": "high",
        },
        {
            "surface": "OBJ",
            "role": "traffic / radar markers / dynamic actors / HUD details",
            "visibility": "main-screen visible" if "obj" in main_layers else "not visible",
            "vram": {
                "tilemap_base": obj.get("oam_base_address"),
                "chr_base": obj.get("oam_address_offset"),
            },
            "evidence": [
                f"OBJ render reports {obj.get('visible_sprites', 0)} visible sprites and {obj.get('drawn_pixels', 0)} drawn pixels.",
                f"Static OBJ bbox is {isolated.get('obj', {}).get('bbox')}.",
                "Existing lane-3 ownership notes already close rival/radar state into OAM output.",
            ],
            "trace_targets": [
                "state_11f3",
                "oam_0730",
                "state_09a2",
                "state_09a8",
                "dp_0053/0054",
                "00:95BD",
                "OAM DMA / OAMDATA",
            ],
            "confidence": "high",
        },
        {
            "surface": "BG3",
            "role": "top-strip / split-phase auxiliary layer",
            "visibility": "transient only" if "bg3" not in main_layers else "main-screen visible",
            "vram": {
                "tilemap_base": bg_layer_states["bg3"].get("tilemapAddress"),
                "chr_base": bg_layer_states["bg3"].get("chrAddress"),
            },
            "evidence": [
                "Not enabled on the visible main screen in the base gameplay sample.",
                "Temporarily enabled by TMAIN at scanline 23 before the later split returns to BG1+BG2+OBJ.",
                f"Tilemap keeps {tilemaps['bg3']['unique_tiles']} unique tiles across {tilemaps['bg3']['entry_count']} entries, which fits a lighter helper surface than the road plane.",
            ],
            "trace_targets": ["TMAIN", "BG3HOFS", "BG3VOFS", "VTIMEL @ scanline 23/24"],
            "confidence": "medium",
        },
    ]


def build_behavior_rows() -> list[dict]:
    return [
        {
            "behavior": "steering / curvature / lane motion",
            "visual_owner": "BG2 first, then mixed with OBJ only if traffic overlaps",
            "watchlist": [
                "$22/$23",
                "dp_0020/0022",
                "BG2HOFS/BG2VOFS",
                "next_irq_ptr",
                "01:9185 -> 02:9165 -> 02:B18D",
                "02:B134 / 02:B101",
            ],
            "why": "These are the already-proven producer-side operands and emitters behind the raster road surface.",
        },
        {
            "behavior": "traffic / green car / police arrival",
            "visual_owner": "OBJ",
            "watchlist": [
                "state_09a2",
                "state_09a8",
                "dp_0053/0054",
                "oam_0730",
                "OAM DMA / OAMDATA",
            ],
            "why": "Dynamic actors and late radar/police markers already land in the OAM-side workload.",
        },
        {
            "behavior": "rival radar / top-strip alerts",
            "visual_owner": "OBJ with transient BG3/TMAIN support",
            "watchlist": [
                "state_11f3",
                "oam_0730",
                "TMAIN",
                "BG3HOFS/BG3VOFS",
            ],
            "why": "The rival marker path is already closed as state_11f3 -> oam_0730, while BG3 only joins briefly at the top split.",
        },
        {
            "behavior": "cockpit / wheel pose / dashboard stability",
            "visual_owner": "BG1 base, possibly with small OBJ overlays",
            "watchlist": ["BG1HOFS", "BG1VOFS", "frame-to-frame capture compare"],
            "why": "BG1 is the stable full-screen layer in the gameplay sample and is the best current cockpit anchor.",
        },
        {
            "behavior": "checkpoint / STOP sign / post-stop fade",
            "visual_owner": "mixed BG2 + OBJ + transient strip control",
            "watchlist": [
                "$22/$23",
                "BG2HOFS/BG2VOFS",
                "state_09a2",
                "state_09a8",
                "dp_0053/0054",
                "TMAIN",
            ],
            "why": "The preserved video suggests a mixed surface rather than one pure layer, so the next good move is a later-frame asset report on the same scheme.",
        },
    ]


def build_markdown(report: dict) -> str:
    sources = report["sources"]
    component_rows = report["components"]
    behavior_rows = report["behavior_watchlist"]
    strongest_fit = report["supporting_readings"]["layer_strongest_fit"]
    producer_reading = report["supporting_readings"]["producer_current_reading"]
    caveat = report["supporting_readings"]["layer_caveat"]

    lines: list[str] = [
        f"# Gameplay Asset Focus Report: `{report['label']}`",
        "",
        f"- Note date: `{report['note_date']}`",
        f"- Source seed: `{report['source_seed']}`",
        f"- Frame anchor: `{report['frame_anchor']}`",
        "- Goal:",
        "  promote a gameplay-first asset inventory so later lane-3 work can trace steering, traffic, checkpoint, radar, and police behavior against the right visible owner instead of mixing menu/front-end evidence into gameplay",
        "",
        "## Supporting Visual Artifacts",
        "",
        f"- visible frame: `{sources['frame_image']}`",
        f"- isolated `BG1`: `{sources['bg1_image']}`",
        f"- isolated `BG2`: `{sources['bg2_image']}`",
        f"- isolated `OBJ`: `{sources['obj_image']}`",
        "",
        "## Current Reading",
        "",
    ]
    for item in strongest_fit:
        lines.append(f"- {item}")
    for item in producer_reading:
        lines.append(f"- {item}")
    lines.extend(
        [
            f"- Caveat kept: {caveat}",
            "",
            "## Layer Inventory",
            "",
            "| Surface | Role | Visibility | VRAM anchor | Why this matters | First trace targets |",
            "|---|---|---|---|---|---|",
        ]
    )
    for row in component_rows:
        vram = f"{format_hex(row['vram']['tilemap_base'])} / {format_hex(row['vram']['chr_base'])}"
        evidence = "; ".join(row["evidence"])
        targets = ", ".join(row["trace_targets"])
        lines.append(
            f"| {row['surface']} | {row['role']} | {row['visibility']} | {vram} | {evidence} | {targets} |"
        )

    lines.extend(
        [
            "",
            "## Behavior Watchlist",
            "",
            "| Behavior | Expected visual owner | Watch first | Why |",
            "|---|---|---|---|",
        ]
    )
    for row in behavior_rows:
        lines.append(
            f"| {row['behavior']} | {row['visual_owner']} | {', '.join(row['watchlist'])} | {row['why']} |"
        )

    lines.extend(
        [
            "",
            "## Separation Rule",
            "",
            "- Keep this report tied only to the confirmed live-race seed and its direct gameplay artifacts.",
            "- Do not reuse front-end car-presentation helpers or attract-mode screenshots to classify gameplay surfaces.",
            "- The point of this report is the same one that helped lane 2 move faster: emit concrete visual buckets first, then trace memory/VRAM against those buckets instead of tracing blind.",
            "",
            "## Next Best Step",
            "",
            "- Re-run this same report shape on at least one later gameplay moment from the preserved video or a live-entry capture, especially checkpoint/police windows.",
            "- Pair the behavior watchlist above with the live-entry route so steering, traffic, and opponent/no-opponent variants can be compared on the same taxonomy.",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> None:
    args = parse_args()
    source_seed = resolve_repo_path(args.source_seed)
    frame_image = resolve_repo_path(args.frame_image)
    bg1_image = resolve_repo_path(args.bg1_image)
    bg2_image = resolve_repo_path(args.bg2_image)
    obj_image = resolve_repo_path(args.obj_image)
    design_pack_path = resolve_repo_path(args.design_pack)
    layer_summary_path = resolve_repo_path(args.layer_summary)
    producer_summary_path = resolve_repo_path(args.producer_summary)
    bg1_render_path = resolve_repo_path(args.bg1_render)
    bg2_render_path = resolve_repo_path(args.bg2_render)
    obj_render_path = resolve_repo_path(args.obj_render)
    ppu_state_path = resolve_repo_path(args.ppu_state)
    out_json = resolve_repo_path(args.out_json)
    markdown_out = resolve_repo_path(args.markdown_out)

    design_pack = load_json(design_pack_path)
    layer_summary = load_json(layer_summary_path)
    producer_summary = load_json(producer_summary_path)
    bg1_render = load_json(bg1_render_path)
    bg2_render = load_json(bg2_render_path)
    obj_render = load_json(obj_render_path)
    ppu_state = load_json(ppu_state_path)

    tilemap_dir = design_pack_path.parent / "tilemaps"
    tilemaps = {
        "bg1": tilemap_profile(load_json(tilemap_dir / "bg1_tilemap.json")),
        "bg2": tilemap_profile(load_json(tilemap_dir / "bg2_tilemap.json")),
        "bg3": tilemap_profile(load_json(tilemap_dir / "bg3_tilemap.json")),
    }

    layer_states = {
        f"bg{index + 1}": entry
        for index, entry in enumerate(bg1_render.get("layer_states", [])[:3])
    }
    components = build_component_rows(
        layer_summary=layer_summary,
        producer_summary=producer_summary,
        bg_layer_states=layer_states,
        obj_render=obj_render,
        tilemaps=tilemaps,
    )
    behavior_watchlist = build_behavior_rows()

    report = {
        "schema": "td2.gameplay_asset_focus.v1",
        "note_date": date.today().isoformat(),
        "label": args.label,
        "source_seed": repo_rel(source_seed),
        "frame_anchor": design_pack.get("frame_number"),
        "sources": {
            "frame_image": repo_rel(frame_image),
            "bg1_image": repo_rel(bg1_image),
            "bg2_image": repo_rel(bg2_image),
            "obj_image": repo_rel(obj_image),
            "design_pack": repo_rel(design_pack_path),
            "layer_summary": repo_rel(layer_summary_path),
            "producer_summary": repo_rel(producer_summary_path),
            "bg1_render": repo_rel(bg1_render_path),
            "bg2_render": repo_rel(bg2_render_path),
            "obj_render": repo_rel(obj_render_path),
            "ppu_state": repo_rel(ppu_state_path),
        },
        "ppu_surface": {
            "bg_mode": layer_summary.get("ppu", {}).get("bg_mode"),
            "main_layers_enabled": layer_summary.get("ppu", {}).get("main_layers_enabled", []),
            "sub_layers_enabled": layer_summary.get("ppu", {}).get("sub_layers_enabled", []),
            "main_layers_mask": layer_summary.get("ppu", {}).get("main_layers_mask"),
            "sub_layers_mask": layer_summary.get("ppu", {}).get("sub_layers_mask"),
            "flat_main_layers": ppu_state.get("ppu.mainScreenLayers"),
            "flat_sub_layers": ppu_state.get("ppu.subScreenLayers"),
        },
        "tilemap_profiles": tilemaps,
        "components": components,
        "behavior_watchlist": behavior_watchlist,
        "supporting_readings": {
            "layer_strongest_fit": layer_summary.get("reading", {}).get("strongest_fit", []),
            "layer_caveat": layer_summary.get("reading", {}).get("caveat"),
            "producer_current_reading": producer_summary.get("current_reading", []),
        },
    }

    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    markdown_out.parent.mkdir(parents=True, exist_ok=True)
    markdown_out.write_text(build_markdown(report), encoding="utf-8")


if __name__ == "__main__":
    main()
