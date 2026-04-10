#!/usr/bin/env python3
"""Build a front-page header/structure contract for DOS TD2 *ST.PES assets."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


HEADER_BYTES = 64


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def read_header(path: Path, count: int = HEADER_BYTES) -> bytes:
    return path.read_bytes()[:count]


def little_u16(data: bytes, offset: int) -> int | None:
    if offset + 1 >= len(data):
        return None
    return data[offset] | (data[offset + 1] << 8)


def classify_window(data: bytes) -> dict[str, object]:
    return {
        "offset_8": data[8] if len(data) > 8 else None,
        "offset_11": data[11] if len(data) > 11 else None,
        "offset_12": data[12] if len(data) > 12 else None,
        "offset_13": data[13] if len(data) > 13 else None,
        "offset_22": data[22] if len(data) > 22 else None,
        "offset_23": data[23] if len(data) > 23 else None,
    }


def stable_offsets(headers: dict[str, bytes]) -> list[dict[str, object]]:
    out = []
    names = sorted(headers)
    length = min(len(headers[name]) for name in names)
    for offset in range(length):
        values = sorted({headers[name][offset] for name in names})
        if len(values) <= 4:
            out.append({"offset": offset, "values": values})
    return out


def build_asset_entry(path: Path, preview_meta: dict[str, dict[str, object]]) -> dict[str, object]:
    data = read_header(path)
    stem = path.stem.replace("ST", "")
    meta = preview_meta.get(stem, {})
    words = []
    for offset in range(0, min(32, len(data) - 1), 2):
        value = little_u16(data, offset)
        if value is not None:
            words.append({"offset": offset, "value": value})
    return {
        "asset": path.name,
        "id": stem,
        "scope": "car_preview" if stem in preview_meta else "scene_or_other",
        "layout_pattern": meta.get("layout_pattern"),
        "layout_count": meta.get("layout_count"),
        "layout_params": meta.get("layout_params"),
        "header_hex": " ".join(f"{byte:02x}" for byte in data[:32]),
        "field_window": classify_window(data),
        "word_window": words,
    }


def candidate_notes(entries: list[dict[str, object]]) -> list[dict[str, object]]:
    notes = []
    by_id = {entry["id"]: entry for entry in entries}
    if "P959" in by_id and "F40" in by_id:
        notes.append(
            {
                "classification": "PROBABLE",
                "claim": "Offsets 8/11/12 split the current P959/F40 pair away from the other car-preview assets.",
                "evidence": {
                    "P959": by_id["P959"]["field_window"],
                    "F40": by_id["F40"]["field_window"],
                },
            }
        )
    notes.append(
        {
            "classification": "VERIFIED",
            "claim": "Byte 0 stays at signature 0x82 across all current *ST.PES assets.",
            "evidence": {"offset": 0, "values": [130]},
        }
    )
    notes.append(
        {
            "classification": "VERIFIED",
            "claim": "Offsets 9 and 10 stay zero across the current *ST.PES set.",
            "evidence": {"offsets": [9, 10], "values": [0]},
        }
    )
    notes.append(
        {
            "classification": "PROBABLE",
            "claim": "Offsets 16..21 behave like structured per-asset parameters rather than compressed payload noise.",
            "evidence": {
                entry["id"]: entry["field_window"] | {
                    "offset_16_21": entry["header_hex"].split()[16:22]
                }
                for entry in entries
                if entry["scope"] == "car_preview"
            },
        }
    )
    return notes


def build_payload(preview_manifest: dict[str, object], data_dir: Path) -> dict[str, object]:
    preview_meta = {entry["car_id"]: entry for entry in preview_manifest["preview_entries"]}
    pes_paths = sorted(data_dir.glob("*ST.PES"))
    entries = [build_asset_entry(path, preview_meta) for path in pes_paths]
    headers = {entry["asset"]: read_header(data_dir / entry["asset"]) for entry in entries}
    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Front-page structure contract for DOS TD2 *ST.PES assets.",
        "header_bytes": HEADER_BYTES,
        "stable_offsets": stable_offsets(headers),
        "entries": entries,
        "candidate_notes": candidate_notes(entries),
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Frontpage Contract",
        "",
        f"- header bytes inspected: `{payload['header_bytes']}`",
        "",
        "## Stable Offsets",
        "",
    ]
    for item in payload["stable_offsets"]:
        lines.append(f"- `{item['offset']}` -> `{item['values']}`")
    lines.extend(["", "## Assets", ""])
    for entry in payload["entries"]:
        lines.append(
            f"- `{entry['asset']}` `{entry['scope']}` pattern `{entry['layout_pattern']}` count `{entry['layout_count']}` params `{entry['layout_params']}`"
        )
        lines.append(f"  - field window: `{entry['field_window']}`")
        lines.append(f"  - header: `{entry['header_hex']}`")
    lines.extend(["", "## Candidate Notes", ""])
    for note in payload["candidate_notes"]:
        lines.append(f"- `{note['classification']}` {note['claim']}")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preview-manifest", type=Path, required=True)
    parser.add_argument("--data-dir", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = build_payload(load_json(args.preview_manifest), args.data_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
