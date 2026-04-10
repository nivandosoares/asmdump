#!/usr/bin/env python3
"""Build a concrete preview/materializer codepath contract from DOS artifacts."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def host_file_entry(host_io: dict[str, object], filename: str) -> dict[str, object] | None:
    for entry in host_io.get("files", []):
        if entry.get("file") == filename:
            return entry
    return None


def trace_sequence(runtime_trace: dict[str, object], names: list[str]) -> list[dict[str, object]]:
    out = []
    for item in runtime_trace.get("sequence", []):
        filename = item.get("file", "")
        if filename in names:
            out.append(item)
    return out


def preview_probe_pattern(host_entry: dict[str, object] | None) -> dict[str, object]:
    if host_entry is None:
        return {
            "classification": "PROBABLE",
            "summary": "No host-side file probe found in the supplied measurements.",
            "events": [],
        }
    return {
        "classification": host_entry.get("classification", "VERIFIED"),
        "summary": host_entry.get("summary"),
        "events": host_entry.get("events", []),
    }


def build_payload(
    engine_manifest: dict[str, object],
    preview_manifest: dict[str, object],
    runtime_trace: dict[str, object],
    host_io: dict[str, object],
) -> dict[str, object]:
    bootstrap_primary = preview_manifest["bootstrap_selection"]["primary_car_id"]
    bootstrap_secondary = preview_manifest["bootstrap_selection"]["secondary_car_id"]
    measured_asset = f"{bootstrap_secondary}ST.PES"
    measured_ss = f"{bootstrap_secondary}.SS"
    secondary_alt_ss = f"{bootstrap_primary}.SS"
    secondary_alt_asset = f"{bootstrap_primary}ST.PES"

    measured_trace_names = [measured_asset, measured_ss, secondary_alt_ss, secondary_alt_asset]

    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Concrete DOS preview/materializer codepath contract.",
        "bootstrap_selection": preview_manifest["bootstrap_selection"],
        "handler_chain": {
            "classification": "VERIFIED",
            "car_selection_handler": {
                "entry": "0x57fb",
                "loader": "0x43c9",
                "post_loader_helpers": ["0x4c15", "0x4e86"],
            },
            "scene_selection_handler": {
                "entry": "0x5cf8",
                "loader": "0x44d2",
                "post_loader_helpers": ["0x4d4e", "0x4e86"],
            },
            "play_session_gate": {
                "entry": "0x6064",
                "boundary": "Play Disk needs both cars and scenery!",
            },
        },
        "measured_preview_files": {
            "classification": "VERIFIED",
            "startup_trace_examples": measured_trace_names,
            "runtime_trace_hits": trace_sequence(runtime_trace, measured_trace_names),
            "host_probe_patterns": {
                measured_asset: preview_probe_pattern(host_file_entry(host_io, measured_asset)),
                secondary_alt_asset: preview_probe_pattern(host_file_entry(host_io, secondary_alt_asset)),
            },
        },
        "preview_bundle_contract": {
            "classification": "VERIFIED",
            "bundle_rule": "same-stem .SS layout descriptor plus *ST packed visual asset",
            "bootstrap_primary": next(
                item for item in preview_manifest["preview_entries"] if item["car_id"] == bootstrap_primary
            ),
            "bootstrap_secondary": next(
                item for item in preview_manifest["preview_entries"] if item["car_id"] == bootstrap_secondary
            ),
        },
        "decoder_targets": [
            {
                "id": "packed_asset_probe_grammar",
                "goal": "match the measured front-read / tail-seek / bulk-reread grammar on *ST.PES files before decoding pixels",
            },
            {
                "id": "layout_token_api",
                "goal": "treat .SS tokens as preview composition instructions, not as image data",
            },
            {
                "id": "handler_to_asset_binding",
                "goal": "keep 0x57fb/0x4c15/0x4e86 as the owning car-preview path until a stronger code split is recovered",
            },
        ],
        "engine_alignment": {
            "catalog_count": len(engine_manifest["car_catalog"]),
            "scene_count": len(engine_manifest["scene_catalog"]),
            "platform_specific_rosters": engine_manifest["porting_notes"]["catalogs_are_platform_specific"],
        },
    }


def render_markdown(payload: dict[str, object]) -> str:
    primary = payload["preview_bundle_contract"]["bootstrap_primary"]
    secondary = payload["preview_bundle_contract"]["bootstrap_secondary"]
    lines = [
        "# DOS Preview Codepath",
        "",
        "## Handler Chain",
        "",
        f"- car selection: `0x57fb -> 0x43c9 -> 0x4c15 -> 0x4e86`",
        f"- scene selection: `0x5cf8 -> 0x44d2 -> 0x4d4e -> 0x4e86`",
        f"- play gate: `0x6064`",
        "",
        "## Bootstrap Preview Bundles",
        "",
        f"- primary: `{primary['car_id']}` `{primary['layout_descriptor']}` + `{primary['preview_asset_pes']}`",
        f"- secondary: `{secondary['car_id']}` `{secondary['layout_descriptor']}` + `{secondary['preview_asset_pes']}`",
        "",
        "## Measured Probe Pattern",
        "",
    ]
    for name, pattern in payload["measured_preview_files"]["host_probe_patterns"].items():
        lines.append(f"- `{name}`: {pattern['summary']}")
        for event in pattern["events"]:
            lines.append(f"  - `{event}`")
    lines.extend(
        [
            "",
            "## Decoder Targets",
            "",
        ]
    )
    for item in payload["decoder_targets"]:
        lines.append(f"- `{item['id']}`: {item['goal']}")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--engine-manifest", type=Path, required=True)
    parser.add_argument("--preview-manifest", type=Path, required=True)
    parser.add_argument("--runtime-trace", type=Path, required=True)
    parser.add_argument("--host-io", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = build_payload(
        load_json(args.engine_manifest),
        load_json(args.preview_manifest),
        load_json(args.runtime_trace),
        load_json(args.host_io),
    )
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
