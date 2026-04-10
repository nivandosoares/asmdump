#!/usr/bin/env python3
"""Build a packed preview-asset manifest for DOS TD2 *ST resources."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def header_bytes(path: Path, count: int = 32) -> list[int]:
    return list(path.read_bytes()[:count])


def header_u16_le(data: list[int], count: int = 8) -> list[int]:
    out = []
    for index in range(count):
        base = index * 2
        if base + 1 >= len(data):
            break
        out.append(data[base] | (data[base + 1] << 8))
    return out


def classify_signature(data: list[int]) -> str:
    return "packed_0x82" if data and data[0] == 0x82 else "unknown"


def measured_probe_template(filename: str, host_io: dict[str, object]) -> dict[str, object]:
    for entry in host_io.get("files", []):
        if entry.get("file") == filename:
            return {
                "classification": entry.get("classification", "VERIFIED"),
                "summary": entry.get("summary"),
                "events": entry.get("events", []),
            }
    return {
        "classification": "PROBABLE",
        "summary": "No direct host probe captured yet; use the promoted ROSSST template as the first fallback.",
        "events": [],
    }


def build_entries(data_dir: Path, preview_manifest: dict[str, object], host_io: dict[str, object]) -> list[dict[str, object]]:
    out = []
    for preview in preview_manifest["preview_entries"]:
        pes_name = preview["preview_asset_pes"]
        pcs_name = preview["preview_asset_pcs"]
        pes_path = data_dir / pes_name
        pcs_path = data_dir / pcs_name
        pes_head = header_bytes(pes_path)
        pcs_head = header_bytes(pcs_path)
        out.append(
            {
                "car_id": preview["car_id"],
                "display_name": preview["display_name"],
                "layout_pattern": preview["layout_pattern"],
                "pes": {
                    "path": pes_name,
                    "size": pes_path.stat().st_size,
                    "signature": classify_signature(pes_head),
                    "header_bytes_hex": " ".join(f"{b:02x}" for b in pes_head[:16]),
                    "header_u16_le": header_u16_le(pes_head),
                    "measured_probe": measured_probe_template(pes_name, host_io),
                },
                "pcs": {
                    "path": pcs_name,
                    "size": pcs_path.stat().st_size,
                    "signature": classify_signature(pcs_head),
                    "header_bytes_hex": " ".join(f"{b:02x}" for b in pcs_head[:16]),
                    "header_u16_le": header_u16_le(pcs_head),
                    "measured_probe": measured_probe_template(pcs_name, host_io),
                },
                "pair_delta": {
                    "size_delta": pes_path.stat().st_size - pcs_path.stat().st_size,
                    "header_word_delta": [
                        a - b for a, b in zip(header_u16_le(pes_head), header_u16_le(pcs_head))
                    ],
                },
            }
        )
    return out


def build_payload(preview_manifest: dict[str, object], host_io: dict[str, object], data_dir: Path) -> dict[str, object]:
    entries = build_entries(data_dir, preview_manifest, host_io)
    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Packed preview-asset manifest for DOS TD2 *ST resources.",
        "data_dir": str(data_dir),
        "shared_contract": {
            "signature_byte": "0x82",
            "bundle_rule": "same-stem *ST.PES/*ST.PCS pairs sit beside same-stem .SS layout descriptors",
            "decoder_start_rule": "Implement the measured front-read / tail-seek / bulk-reread grammar before attempting full decode.",
        },
        "entries": entries,
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Packed Preview Assets",
        "",
        f"- data dir: `{payload['data_dir']}`",
        f"- shared signature: `{payload['shared_contract']['signature_byte']}`",
        "",
        "## Entries",
        "",
    ]
    for entry in payload["entries"]:
        lines.append(f"- `{entry['car_id']}` `{entry['display_name']}` `{entry['layout_pattern']}`")
        lines.append(
            f"  - pes: `{entry['pes']['path']}` size `{entry['pes']['size']}` header `{entry['pes']['header_bytes_hex']}`"
        )
        lines.append(
            f"  - pcs: `{entry['pcs']['path']}` size `{entry['pcs']['size']}` header `{entry['pcs']['header_bytes_hex']}`"
        )
        lines.append(
            f"  - size delta: `{entry['pair_delta']['size_delta']}`"
        )
        if entry["pes"]["measured_probe"]["events"]:
            lines.append(f"  - measured pes probe: `{entry['pes']['measured_probe']['summary']}`")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preview-manifest", type=Path, required=True)
    parser.add_argument("--host-io", type=Path, required=True)
    parser.add_argument("--data-dir", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = build_payload(load_json(args.preview_manifest), load_json(args.host_io), args.data_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
