#!/usr/bin/env python3
"""Build a decoder-facing packed probe contract for DOS TD2 *ST assets."""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from pathlib import Path


PAGE_SIZE = 4096
TAIL_BOUNDARY = PAGE_SIZE * 3


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def find_host_entry(host_io: dict[str, object], filename: str) -> dict[str, object] | None:
    for entry in host_io.get("files", []):
        if entry.get("file") == filename:
            return entry
    return None


def bytes_entropy(block: bytes) -> float:
    if not block:
        return 0.0
    counts = [0] * 256
    for value in block:
        counts[value] += 1
    total = len(block)
    return -sum((count / total) * math.log2(count / total) for count in counts if count)


def page_class(size: int) -> str:
    if size <= PAGE_SIZE:
        return "single_page_stream"
    if size <= TAIL_BOUNDARY:
        return "three_page_stream"
    return "four_page_tail_stream"


def evidence_grade(filename: str, size: int, host_entry: dict[str, object] | None) -> tuple[str, str]:
    if host_entry:
        return "VERIFIED", host_entry.get("summary", "Measured host probe captured.")
    if size > TAIL_BOUNDARY:
        return (
            "PROBABLE",
            "Same size class as measured ROSSST.PES; treat the 12 KB boundary as the first promoted tail cut.",
        )
    if size > PAGE_SIZE:
        return (
            "PROBABLE",
            "Multi-page packed asset with no measured per-file trace yet; front probe plus full reread is the current safe model.",
        )
    return (
        "PROBABLE",
        "Single-page packed asset with no measured per-file trace yet; treat it as a one-shot front segment until a direct trace exists.",
    )


def infer_probe_plan(size: int, host_entry: dict[str, object] | None) -> dict[str, object]:
    if host_entry:
        return {
            "classification": "VERIFIED",
            "summary": host_entry.get("summary"),
            "events": host_entry.get("events", []),
        }

    plan = {
        "classification": "PROBABLE",
        "events": [
            {"event": "open", "flags": "O_RDONLY"},
            {"event": "read", "offset": 0, "requested": min(PAGE_SIZE, size), "expected_result": min(PAGE_SIZE, size)},
            {"event": "close"},
            {"event": "open", "flags": "O_RDONLY"},
            {"event": "read", "offset": 0, "requested": 16384, "expected_result": size},
            {"event": "close"},
        ],
    }
    if size > TAIL_BOUNDARY:
        tail = size - TAIL_BOUNDARY
        plan["events"].insert(
            4,
            {"event": "read", "offset": TAIL_BOUNDARY, "requested": tail, "expected_result": tail},
        )
        plan["summary"] = "Promote the measured ROSSST-style front probe, 12 KB tail read, then full reread."
    elif size > PAGE_SIZE:
        plan["summary"] = "Promote a front 4 KB probe followed by a full reread."
    else:
        plan["summary"] = "Promote a single exact-length front segment until a direct trace is captured."
    return plan


def segment_descriptor(data: bytes, offset: int, length: int, label: str) -> dict[str, object]:
    block = data[offset : offset + length]
    return {
        "label": label,
        "offset": offset,
        "length": len(block),
        "sha1_prefix": hashlib.sha1(block).hexdigest()[:12],
        "entropy": round(bytes_entropy(block), 4),
        "sample_hex": " ".join(f"{value:02x}" for value in block[:16]),
    }


def build_entry(preview: dict[str, object], data_dir: Path, host_io: dict[str, object]) -> dict[str, object]:
    pes_name = preview["preview_asset_pes"]
    pcs_name = preview["preview_asset_pcs"]
    pes_path = data_dir / pes_name
    pcs_path = data_dir / pcs_name
    pes_data = pes_path.read_bytes()
    pcs_data = pcs_path.read_bytes()
    pes_size = len(pes_data)
    host_entry = find_host_entry(host_io, pes_name)
    classification = page_class(pes_size)
    evidence, evidence_note = evidence_grade(pes_name, pes_size, host_entry)

    segments = [
        segment_descriptor(pes_data, 0, min(PAGE_SIZE, pes_size), "front_probe_segment"),
    ]
    if pes_size > TAIL_BOUNDARY:
        segments.append(segment_descriptor(pes_data, TAIL_BOUNDARY, pes_size - TAIL_BOUNDARY, "tail_segment"))
    if pes_size > PAGE_SIZE:
        segments.append(segment_descriptor(pes_data, PAGE_SIZE, min(PAGE_SIZE, pes_size - PAGE_SIZE), "middle_segment_1"))
    if pes_size > PAGE_SIZE * 2:
        segments.append(segment_descriptor(pes_data, PAGE_SIZE * 2, min(PAGE_SIZE, pes_size - PAGE_SIZE * 2), "middle_segment_2"))

    return {
        "car_id": preview["car_id"],
        "display_name": preview["display_name"],
        "preview_asset_pes": pes_name,
        "preview_asset_pcs": pcs_name,
        "layout_pattern": preview["layout_pattern"],
        "classification": classification,
        "evidence": evidence,
        "evidence_note": evidence_note,
        "pes_size": pes_size,
        "pcs_size": len(pcs_data),
        "page_count": math.ceil(pes_size / PAGE_SIZE),
        "last_page_bytes": pes_size - ((math.ceil(pes_size / PAGE_SIZE) - 1) * PAGE_SIZE),
        "tail_boundary": TAIL_BOUNDARY if pes_size > TAIL_BOUNDARY else None,
        "tail_bytes": max(0, pes_size - TAIL_BOUNDARY),
        "segments": segments,
        "probe_plan": infer_probe_plan(pes_size, host_entry),
        "pair_geometry": {
            "pcs_page_count": math.ceil(len(pcs_data) / PAGE_SIZE),
            "pcs_last_page_bytes": len(pcs_data) - ((math.ceil(len(pcs_data) / PAGE_SIZE) - 1) * PAGE_SIZE),
            "size_delta": pes_size - len(pcs_data),
        },
    }


def build_payload(preview_manifest: dict[str, object], host_io: dict[str, object], data_dir: Path) -> dict[str, object]:
    entries = [build_entry(preview, data_dir, host_io) for preview in preview_manifest["preview_entries"]]
    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Decoder-facing page and probe contract for DOS TD2 *ST packed preview assets.",
        "page_size": PAGE_SIZE,
        "tail_boundary": TAIL_BOUNDARY,
        "promoted_rule": {
            "classification": "VERIFIED",
            "measured_anchor": "ROSSST.PES",
            "rule": "Treat *ST.PES as page-oriented packed assets: front probe first, optional 12 KB tail segment for four-page files, then full reread before decode.",
        },
        "entries": entries,
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Packed Probe Contract",
        "",
        f"- page size: `{payload['page_size']}`",
        f"- promoted tail boundary: `{payload['tail_boundary']}`",
        f"- measured anchor: `{payload['promoted_rule']['measured_anchor']}`",
        "",
        "## Entries",
        "",
    ]
    for entry in payload["entries"]:
        lines.append(
            f"- `{entry['car_id']}` `{entry['classification']}` size `{entry['pes_size']}` pages `{entry['page_count']}` evidence `{entry['evidence']}`"
        )
        lines.append(f"  - probe: {entry['probe_plan']['summary']}")
        if entry["tail_boundary"] is not None:
            lines.append(f"  - tail segment: offset `{entry['tail_boundary']}` bytes `{entry['tail_bytes']}`")
        lines.append(f"  - pcs delta: `{entry['pair_geometry']['size_delta']}`")
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
