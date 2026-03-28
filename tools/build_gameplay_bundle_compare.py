#!/usr/bin/env python3
"""Compare two gameplay frame bundles produced by build_gameplay_frame_bundle.py."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a compact compare report for two gameplay frame bundles so "
            "lane-3 work can review which visual bucket changed first."
        )
    )
    parser.add_argument("bundle_a", type=Path, help="First bundle directory.")
    parser.add_argument("bundle_b", type=Path, help="Second bundle directory.")
    parser.add_argument("out_json", type=Path, help="Output compare JSON.")
    parser.add_argument("--markdown-out", type=Path, required=True, help="Output compare Markdown.")
    parser.add_argument("--label-a", default="frame_a", help="Label for bundle A.")
    parser.add_argument("--label-b", default="frame_b", help="Label for bundle B.")
    return parser.parse_args()


def resolve(path: Path) -> Path:
    return path if path.is_absolute() else (Path.cwd() / path)


def repo_rel(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return resolved.as_posix()


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def load_tilemap_stats(bundle_dir: Path, layer_name: str) -> dict:
    path = bundle_dir / "design_pack" / "tilemaps" / f"{layer_name}_tilemap.json"
    data = load_json(path)
    stats = data.get("stats", {})
    return {
        "entry_count": stats.get("entryCount"),
        "unique_tiles": stats.get("uniqueTiles"),
        "non_zero_tiles": stats.get("nonZeroTiles"),
        "top_tiles": stats.get("topTiles", [])[:5],
    }


def load_bundle_summary(bundle_dir: Path) -> dict:
    manifest = load_json(bundle_dir / "bundle_manifest.json")
    outputs = manifest.get("outputs", {})
    main_render = load_json(bundle_dir / "main_render.json")
    obj_render = load_json(bundle_dir / "obj_render.json")
    return {
        "bundle_dir": repo_rel(bundle_dir),
        "frame": manifest.get("frame"),
        "frame_png": outputs.get("frame_png"),
        "main_png": outputs.get("main_png"),
        "bg1_png": outputs.get("bg1_png"),
        "bg2_png": outputs.get("bg2_png"),
        "obj_png": outputs.get("obj_png"),
        "bg1_ppm": outputs.get("bg1_ppm"),
        "bg2_ppm": outputs.get("bg2_ppm"),
        "obj_ppm": outputs.get("obj_ppm"),
        "bg_mode": main_render.get("bg_mode"),
        "main_screen_layers": main_render.get("main_screen_layers"),
        "layer_states": main_render.get("layer_states", [])[:3],
        "obj": {
            "visible_sprites": obj_render.get("obj", {}).get("visible_sprites"),
            "drawn_pixels": obj_render.get("obj", {}).get("drawn_pixels"),
        },
        "tilemaps": {
            "bg1": load_tilemap_stats(bundle_dir, "bg1"),
            "bg2": load_tilemap_stats(bundle_dir, "bg2"),
            "bg3": load_tilemap_stats(bundle_dir, "bg3"),
        },
    }


def compare_field(a: object, b: object) -> dict:
    return {"a": a, "b": b, "same": a == b}


def build_report(bundle_a: Path, bundle_b: Path, label_a: str, label_b: str) -> dict:
    summary_a = load_bundle_summary(bundle_a)
    summary_b = load_bundle_summary(bundle_b)
    layer_state_a = {entry["layer_index"]: entry for entry in summary_a["layer_states"]}
    layer_state_b = {entry["layer_index"]: entry for entry in summary_b["layer_states"]}

    bg2_same_tilemap_stats = summary_a["tilemaps"]["bg2"] == summary_b["tilemaps"]["bg2"]
    bg1_same_tilemap_stats = summary_a["tilemaps"]["bg1"] == summary_b["tilemaps"]["bg1"]
    bg3_same_tilemap_stats = summary_a["tilemaps"]["bg3"] == summary_b["tilemaps"]["bg3"]
    obj_changed = summary_a["obj"] != summary_b["obj"]

    reading: list[str] = []
    if bg1_same_tilemap_stats and bg2_same_tilemap_stats and bg3_same_tilemap_stats and obj_changed:
        reading.append(
            "BG1/BG2/BG3 tilemap stats stay unchanged while OBJ alone changes, so the strongest current fit is a pure actor/event update over a stable road/cockpit background stack."
        )
    if bg2_same_tilemap_stats and not bg1_same_tilemap_stats:
        reading.append(
            "BG2 tilemap stats stay unchanged while BG1 changes, so the strongest current fit is that the road/world plane persists and the later overlay loads onto the cockpit/HUD side."
        )
    if obj_changed:
        reading.append(
            "OBJ workload changes across the pair, so dynamic actor/overlay work contributes materially to the visible transition."
        )
    if layer_state_a.get(1, {}).get("hscroll") != layer_state_b.get(1, {}).get("hscroll") or layer_state_a.get(1, {}).get("vscroll") != layer_state_b.get(1, {}).get("vscroll"):
        reading.append(
            "BG2 scroll operands continue moving across the pair, which keeps the world/road layer live even though the later frame is visually dominated by the crash overlay."
        )

    return {
        "schema": "td2.gameplay_bundle_compare.v1",
        "labels": {"a": label_a, "b": label_b},
        "bundle_a": summary_a,
        "bundle_b": summary_b,
        "comparisons": {
            "bg1_tilemap": compare_field(summary_a["tilemaps"]["bg1"], summary_b["tilemaps"]["bg1"]),
            "bg2_tilemap": compare_field(summary_a["tilemaps"]["bg2"], summary_b["tilemaps"]["bg2"]),
            "bg3_tilemap": compare_field(summary_a["tilemaps"]["bg3"], summary_b["tilemaps"]["bg3"]),
            "obj": compare_field(summary_a["obj"], summary_b["obj"]),
            "bg1_scroll": compare_field(layer_state_a.get(0), layer_state_b.get(0)),
            "bg2_scroll": compare_field(layer_state_a.get(1), layer_state_b.get(1)),
            "bg3_scroll": compare_field(layer_state_a.get(2), layer_state_b.get(2)),
        },
        "current_reading": reading,
    }


def build_markdown(report: dict) -> str:
    label_a = report["labels"]["a"]
    label_b = report["labels"]["b"]
    a = report["bundle_a"]
    b = report["bundle_b"]
    comparisons = report["comparisons"]

    lines = [
        f"# Gameplay Bundle Compare: `{label_a}` vs `{label_b}`",
        "",
        f"- `{label_a}` frame: `{a['frame']}`",
        f"- `{label_b}` frame: `{b['frame']}`",
        f"- `{label_a}` screenshot: `{a['frame_png']}`",
        f"- `{label_b}` screenshot: `{b['frame_png']}`",
        "",
        "## Visual Anchors",
        "",
        f"- `{label_a}` `BG1`: `{a['bg1_png'] or a['bg1_ppm']}`",
        f"- `{label_a}` `BG2`: `{a['bg2_png'] or a['bg2_ppm']}`",
        f"- `{label_a}` `OBJ`: `{a['obj_png'] or a['obj_ppm']}`",
        f"- `{label_b}` `BG1`: `{b['bg1_png'] or b['bg1_ppm']}`",
        f"- `{label_b}` `BG2`: `{b['bg2_png'] or b['bg2_ppm']}`",
        f"- `{label_b}` `OBJ`: `{b['obj_png'] or b['obj_ppm']}`",
        "",
        "## Current Reading",
        "",
    ]
    for item in report["current_reading"]:
        lines.append(f"- {item}")
    lines.extend(
        [
            "",
            "## Key Deltas",
            "",
            "| Surface | "
            + label_a
            + " | "
            + label_b
            + " | Same? |",
            "|---|---|---|---|",
            f"| BG1 tilemap stats | `{a['tilemaps']['bg1']}` | `{b['tilemaps']['bg1']}` | `{comparisons['bg1_tilemap']['same']}` |",
            f"| BG2 tilemap stats | `{a['tilemaps']['bg2']}` | `{b['tilemaps']['bg2']}` | `{comparisons['bg2_tilemap']['same']}` |",
            f"| BG3 tilemap stats | `{a['tilemaps']['bg3']}` | `{b['tilemaps']['bg3']}` | `{comparisons['bg3_tilemap']['same']}` |",
            f"| OBJ workload | `{a['obj']}` | `{b['obj']}` | `{comparisons['obj']['same']}` |",
            f"| BG2 layer state | `{a['layer_states'][1]}` | `{b['layer_states'][1]}` | `{comparisons['bg2_scroll']['same']}` |",
            "",
            "## Practical Fit",
            "",
            "- If `BG2` stats hold while `BG1` and `OBJ` change, the right next memory targets are overlay/collision-side fields before widening the road emitter search again.",
            "- If a future pair flips `BG2` too, that will be the better moment to reopen pure road/world provenance inside `L01318D`.",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> None:
    args = parse_args()
    bundle_a = resolve(args.bundle_a)
    bundle_b = resolve(args.bundle_b)
    out_json = resolve(args.out_json)
    markdown_out = resolve(args.markdown_out)

    report = build_report(bundle_a, bundle_b, args.label_a, args.label_b)
    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    markdown_out.parent.mkdir(parents=True, exist_ok=True)
    markdown_out.write_text(build_markdown(report), encoding="utf-8")


if __name__ == "__main__":
    main()
