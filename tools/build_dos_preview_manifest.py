#!/usr/bin/env python3
"""Build a preview/materializer manifest from the DOS engine manifest."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


PREVIEW_CODEPATH = {
    "car_selection_handler": "0x57fb",
    "scene_selection_handler": "0x5cf8",
    "shared_render_helpers": ["0x4c15", "0x4d4e", "0x4e86"],
    "play_session_gate": "0x6064",
}


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def classify_layout(tokens: list[str]) -> str:
    if any(token.startswith("fac") for token in tokens):
        return "window_plus_face_tokens"
    if tokens and all(token.startswith("wnd") for token in tokens):
        return "window_only_tokens"
    return "mixed_tokens"


def build_preview_entries(engine_manifest: dict[str, object], contracts: dict[str, object]) -> list[dict[str, object]]:
    contract_keys = set(contracts["summary"]["common_key_strings"])
    selection_ids = engine_manifest["selection_bootstrap"]["id_slots"]
    preview_entries = []
    for bundle in engine_manifest["car_bundles"]:
        layout = bundle["bundle_roles"]["layout_descriptor"]
        preview_asset = bundle["preview_contract"]["measured_packed_asset"]
        preview_entries.append(
            {
                "car_id": bundle["id"],
                "display_name": bundle["display_name"],
                "is_bootstrap_primary": bundle["id"] == selection_ids[0],
                "is_bootstrap_secondary": bundle["id"] == selection_ids[1],
                "layout_descriptor": bundle["preview_contract"]["layout_descriptor"],
                "layout_pattern": classify_layout(layout["tokens"]),
                "layout_count": layout["count"],
                "layout_params": [layout["param_1"], layout["param_2"]],
                "layout_tokens": layout["tokens"],
                "preview_asset_pes": preview_asset,
                "preview_asset_pcs": preview_asset.replace(".PES", ".PCS"),
                "visual_st_sizes": bundle["bundle_roles"]["visual_st"],
                "codepath": PREVIEW_CODEPATH,
                "measured_runtime_surface": {
                    "startup_trace_uses_pes": True,
                    "pcs_open_observed_in_measured_startup": False,
                    "preview_contract_string_present": "Play Disk needs both cars and scenery!" in contract_keys,
                },
            }
        )
    return preview_entries


def build_payload(engine_manifest: dict[str, object], contracts: dict[str, object]) -> dict[str, object]:
    selection_ids = engine_manifest["selection_bootstrap"]["id_slots"]
    scenes = {scene["id"]: scene for scene in engine_manifest["scene_catalog"]}
    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Preview/materializer surface for DOS TD2 future-engine work.",
        "bootstrap_selection": {
            "selector_values": engine_manifest["selection_bootstrap"]["selector_values"],
            "primary_car_id": selection_ids[0],
            "secondary_car_id": selection_ids[1],
            "scene_id": selection_ids[2],
            "scene_display_name": scenes[selection_ids[2]]["display_name_runtime"],
        },
        "codepath_contract": PREVIEW_CODEPATH,
        "preview_entries": build_preview_entries(engine_manifest, contracts),
        "design_review_questions": [
            "Are the window-only and window-plus-face token families enough to define the first preview materializer API?",
            "Should the first preview renderer accept same-stem .SS + *ST assets as one atomic bundle input?",
            "Is the bootstrap P959/ROSS/CCC combination the right first review seed for preview work?",
        ],
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Preview Manifest",
        "",
        "## Bootstrap",
        "",
        f"- primary car: `{payload['bootstrap_selection']['primary_car_id']}`",
        f"- secondary car: `{payload['bootstrap_selection']['secondary_car_id']}`",
        f"- scene: `{payload['bootstrap_selection']['scene_id']}` `{payload['bootstrap_selection']['scene_display_name']}`",
        "",
        "## Preview Entries",
        "",
    ]
    for entry in payload["preview_entries"]:
        flags = []
        if entry["is_bootstrap_primary"]:
            flags.append("bootstrap-primary")
        if entry["is_bootstrap_secondary"]:
            flags.append("bootstrap-secondary")
        flag_text = f" ({', '.join(flags)})" if flags else ""
        lines.append(f"- `{entry['car_id']}` `{entry['display_name']}`{flag_text}")
        lines.append(
            f"  - layout: `{entry['layout_descriptor']}` pattern `{entry['layout_pattern']}` params `{entry['layout_params']}`"
        )
        lines.append(
            f"  - packed preview: `{entry['preview_asset_pes']}` / `{entry['preview_asset_pcs']}`"
        )
        lines.append(
            f"  - tokens: `{', '.join(entry['layout_tokens'])}`"
        )
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--engine-manifest", type=Path, required=True)
    parser.add_argument("--contracts-json", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    engine_manifest = load_json(args.engine_manifest)
    contracts = load_json(args.contracts_json)
    payload = build_payload(engine_manifest, contracts)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
