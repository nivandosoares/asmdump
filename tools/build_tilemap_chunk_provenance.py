#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from bisect import bisect_left, bisect_right
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build frame/layer tile-index provenance rows by correlating design-pack tilemaps "
            "with L001210 runtime chunk hits and optional chunk-validation manifests."
        )
    )
    parser.add_argument(
        "design_pack_range",
        type=Path,
        help="design pack range directory or design_pack_range.json path",
    )
    parser.add_argument(
        "l001210_exec_json",
        type=Path,
        help="L001210 trace JSON path (td2_boot_probe_l001210_exec.json)",
    )
    parser.add_argument(
        "output_json",
        type=Path,
        help="output provenance JSON path",
    )
    parser.add_argument(
        "--chunk-validation",
        type=Path,
        action="append",
        default=[],
        help="optional chunk-validation JSON (repeatable, e.g. bank13_chunk_validation.json)",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=None,
        help="optional markdown summary output path",
    )
    parser.add_argument(
        "--carry-frames",
        type=int,
        default=16,
        help="map a frame to the last runtime hit if delta <= carry-frames (default: 16)",
    )
    parser.add_argument(
        "--forward-frames",
        type=int,
        default=2,
        help="if no carry hit exists, map to nearest forward hit if delta <= forward-frames (default: 2)",
    )
    parser.add_argument(
        "--include-inactive-layers",
        action="store_true",
        help="include non-visible/non-active BG layers in row output",
    )
    return parser.parse_args()


def as_int(value: Any, fallback: int = 0) -> int:
    if isinstance(value, bool):
        return int(value)
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        text = value.strip()
        if text.lower().startswith("0x"):
            try:
                return int(text, 16)
            except ValueError:
                return fallback
        try:
            return int(text)
        except ValueError:
            return fallback
    try:
        return int(value)  # type: ignore[arg-type]
    except (TypeError, ValueError):
        return fallback


def resolve_range_json(path: Path) -> Path:
    if path.is_dir():
        return path / "design_pack_range.json"
    return path


def parse_snes(snes: str) -> tuple[int, int] | None:
    text = snes.strip().upper()
    if len(text) != 7 or text[2] != ":":
        return None
    try:
        return int(text[:2], 16), int(text[3:], 16)
    except ValueError:
        return None


def format_snes(bank: int, addr: int) -> str:
    return f"{bank & 0xFF:02X}:{addr & 0xFFFF:04X}"


def load_chunk_validation_index(paths: list[Path]) -> dict[tuple[int, int], dict[str, Any]]:
    index: dict[tuple[int, int], dict[str, Any]] = {}
    for path in paths:
        payload = json.loads(path.read_text(encoding="utf-8"))
        bank = as_int(payload.get("bank"), -1)
        if bank < 0:
            continue
        for entry in payload.get("entries", []):
            if not isinstance(entry, dict):
                continue
            addr = as_int(entry.get("addr"), -1)
            if addr < 0:
                continue
            key = (bank, addr)
            candidate = {
                "bank": bank,
                "addr": addr,
                "snes": format_snes(bank, addr),
                "marker": str(entry.get("marker", "")),
                "status": str(entry.get("status", "unknown")),
                "output_size": entry.get("output_size"),
                "consumed_bytes": entry.get("consumed_bytes"),
                "window_start": entry.get("window_start"),
                "window_end_exclusive": entry.get("window_end_exclusive"),
                "source_validation": str(path),
            }
            existing = index.get(key)
            if existing is None:
                index[key] = candidate
            elif existing.get("status") != "ok" and candidate.get("status") == "ok":
                index[key] = candidate
    return index


def iter_tile_indices(tile_index_rows: Any) -> list[int]:
    unique: set[int] = set()
    if not isinstance(tile_index_rows, list):
        return []
    for row in tile_index_rows:
        if not isinstance(row, list):
            continue
        for value in row:
            unique.add(as_int(value))
    return sorted(unique)


def build_ranges(sorted_values: list[int]) -> list[dict[str, int]]:
    if not sorted_values:
        return []
    ranges: list[dict[str, int]] = []
    start = sorted_values[0]
    last = sorted_values[0]
    for value in sorted_values[1:]:
        if value == last + 1:
            last = value
            continue
        ranges.append({"start": start, "end": last, "count": (last - start + 1)})
        start = value
        last = value
    ranges.append({"start": start, "end": last, "count": (last - start + 1)})
    return ranges


def normalize_hit(hit: dict[str, Any]) -> dict[str, Any]:
    frame = as_int(hit.get("frame"), -1)
    source_bank = as_int(hit.get("source_bank"), -1)
    source_addr = as_int(hit.get("source_addr"), -1)
    source_snes = str(hit.get("source_snes") or "").strip().upper()
    if not source_snes and source_bank >= 0 and source_addr >= 0:
        source_snes = format_snes(source_bank, source_addr)

    if (source_bank < 0 or source_addr < 0) and source_snes:
        parsed = parse_snes(source_snes)
        if parsed is not None:
            source_bank, source_addr = parsed

    return {
        "frame": frame,
        "source_bank": source_bank,
        "source_addr": source_addr,
        "source_snes": source_snes,
        "source_marker": str(hit.get("source_marker", "")),
        "source_provenance": str(hit.get("source_provenance", "")),
        "destination_snes": str(hit.get("destination_snes", "")),
        "state_0202": hit.get("state_0202"),
        "state_0208": hit.get("state_0208"),
        "dp_0054": hit.get("dp_0054"),
    }


def select_candidates(
    frame: int,
    hits: list[dict[str, Any]],
    carry_frames: int,
    forward_frames: int,
) -> list[dict[str, Any]]:
    if not hits:
        return []

    hit_frames = [as_int(hit.get("frame"), -1) for hit in hits]
    left = bisect_left(hit_frames, frame)
    right = bisect_right(hit_frames, frame)
    if left != right:
        rows: list[dict[str, Any]] = []
        for hit in hits[left:right]:
            row = dict(hit)
            row["relationship"] = "runtime-hit"
            row["frame_delta"] = 0
            rows.append(row)
        return rows

    previous_idx = left - 1
    if previous_idx >= 0:
        previous_hit = hits[previous_idx]
        previous_delta = frame - as_int(previous_hit.get("frame"), frame)
        if previous_delta <= carry_frames:
            row = dict(previous_hit)
            row["relationship"] = "carryover-from-last-hit"
            row["frame_delta"] = previous_delta
            return [row]

    if left < len(hits):
        next_hit = hits[left]
        forward_delta = as_int(next_hit.get("frame"), frame) - frame
        if forward_delta <= forward_frames:
            row = dict(next_hit)
            row["relationship"] = "nearest-forward-hit"
            row["frame_delta"] = forward_delta
            return [row]

    return []


def compact_ranges(ranges: list[dict[str, int]], limit: int = 8) -> str:
    if not ranges:
        return "-"
    parts: list[str] = []
    for item in ranges[:limit]:
        start = item["start"]
        end = item["end"]
        if start == end:
            parts.append(f"0x{start:03X}")
        else:
            parts.append(f"0x{start:03X}-0x{end:03X}")
    if len(ranges) > limit:
        parts.append(f"+{len(ranges) - limit} more")
    return ", ".join(parts)


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    lines: list[str] = []
    lines.append("# Tilemap-to-ROM Provenance")
    lines.append("")
    lines.append(f"- frame range: `{payload['frame_range']['start']}..{payload['frame_range']['end']}`")
    lines.append(f"- row count: `{payload['row_count']}`")
    lines.append(f"- unmapped rows: `{payload['summary']['unmapped_rows']}`")
    lines.append("")
    lines.append("| Frame | Layer | Tile index ranges | CHR base | Candidate ROM chunk | Evidence |")
    lines.append("|---:|---|---|---:|---|---|")

    for row in payload.get("rows", []):
        ranges = compact_ranges(row.get("tile_index_ranges", []))
        candidates = row.get("candidate_chunks", [])
        if candidates:
            chunks_text = ", ".join(
                f"`{candidate.get('source_snes','?')}` ({candidate.get('source_marker','?')})"
                for candidate in candidates
            )
            evidence_text = ", ".join(
                f"{candidate.get('relationship','?')}@{candidate.get('hit_frame','?')}"
                for candidate in candidates
            )
        else:
            chunks_text = "none"
            evidence_text = "no nearby runtime hit"

        lines.append(
            "| "
            f"`{row.get('frame')}` | "
            f"`{row.get('layer_name')}` | "
            f"{ranges} | "
            f"`0x{as_int(row.get('chr_base_words')):04X}` | "
            f"{chunks_text} | "
            f"{evidence_text} |"
        )

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()

    range_json_path = resolve_range_json(args.design_pack_range).resolve()
    range_dir = range_json_path.parent

    range_payload = json.loads(range_json_path.read_text(encoding="utf-8"))
    entries = range_payload.get("entries", [])
    if not isinstance(entries, list) or not entries:
        raise SystemExit("error: design pack range has no entries")

    exec_payload = json.loads(args.l001210_exec_json.read_text(encoding="utf-8"))
    raw_hits = exec_payload.get("hits", [])
    hits = sorted(
        (
            normalize_hit(hit)
            for hit in raw_hits
            if isinstance(hit, dict) and as_int(hit.get("frame"), -1) >= 0
        ),
        key=lambda hit: as_int(hit.get("frame"), -1),
    )

    chunk_index = load_chunk_validation_index([path.resolve() for path in args.chunk_validation])

    rows: list[dict[str, Any]] = []
    frame_numbers: list[int] = []
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        frame = as_int(entry.get("frameNumber"), -1)
        if frame < 0:
            continue
        frame_numbers.append(frame)

        manifest_rel = str(entry.get("manifest", ""))
        if not manifest_rel:
            continue
        manifest_path = (range_dir / manifest_rel).resolve()
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))

        tilemaps = manifest.get("tilemaps", {})
        tilemap_layers = tilemaps.get("layers", []) if isinstance(tilemaps, dict) else []

        candidates = select_candidates(frame, hits, args.carry_frames, args.forward_frames)
        candidate_chunks: list[dict[str, Any]] = []
        for candidate in candidates:
            source_bank = as_int(candidate.get("source_bank"), -1)
            source_addr = as_int(candidate.get("source_addr"), -1)
            source_snes = str(candidate.get("source_snes", ""))
            chunk_key = (source_bank, source_addr)
            chunk_meta = chunk_index.get(chunk_key)

            candidate_chunks.append(
                {
                    "source_snes": source_snes,
                    "source_marker": candidate.get("source_marker"),
                    "source_provenance": candidate.get("source_provenance"),
                    "hit_frame": candidate.get("frame"),
                    "relationship": candidate.get("relationship"),
                    "frame_delta": candidate.get("frame_delta"),
                    "destination_snes": candidate.get("destination_snes"),
                    "state_0202": candidate.get("state_0202"),
                    "state_0208": candidate.get("state_0208"),
                    "dp_0054": candidate.get("dp_0054"),
                    "chunk_validation": chunk_meta,
                }
            )

        for layer_meta in tilemap_layers:
            if not isinstance(layer_meta, dict):
                continue

            is_enabled = bool(layer_meta.get("enabledOnMain")) or bool(layer_meta.get("enabledOnSub"))
            is_active = bool(layer_meta.get("active"))
            if not args.include_inactive_layers and not (is_enabled or is_active):
                continue

            layer_json_rel = str(layer_meta.get("json", ""))
            if not layer_json_rel:
                continue
            layer_json_path = (manifest_path.parent / layer_json_rel).resolve()
            layer_payload = json.loads(layer_json_path.read_text(encoding="utf-8"))

            tile_indices = iter_tile_indices(layer_payload.get("maps", {}).get("tileIndex"))
            ranges = build_ranges(tile_indices)

            row = {
                "frame": frame,
                "layer_name": layer_payload.get("name"),
                "layer_index": layer_payload.get("layer"),
                "bg_mode": layer_payload.get("bgMode"),
                "bpp": layer_payload.get("bpp"),
                "active": layer_payload.get("active"),
                "enabled_on_main": layer_payload.get("enabledOnMain"),
                "enabled_on_sub": layer_payload.get("enabledOnSub"),
                "chr_base_words": layer_payload.get("grid", {}).get("chrBaseWords"),
                "tilemap_base_words": layer_payload.get("grid", {}).get("tilemapBaseWords"),
                "tile_index_count": len(tile_indices),
                "tile_index_ranges": ranges,
                "tile_index_examples": tile_indices[:16],
                "candidate_chunks": candidate_chunks,
                "candidate_status": "mapped" if candidate_chunks else "unmapped",
                "design_pack_manifest": str(manifest_path),
                "tilemap_json": str(layer_json_path),
            }
            rows.append(row)

    rows.sort(key=lambda row: (as_int(row.get("frame")), as_int(row.get("layer_index"))))

    frame_start = min(frame_numbers) if frame_numbers else None
    frame_end = max(frame_numbers) if frame_numbers else None
    mapped_rows = sum(1 for row in rows if row.get("candidate_status") == "mapped")
    unmapped_rows = len(rows) - mapped_rows

    payload = {
        "design_pack_range": str(range_json_path),
        "l001210_exec_json": str(args.l001210_exec_json.resolve()),
        "chunk_validation_inputs": [str(path.resolve()) for path in args.chunk_validation],
        "settings": {
            "carry_frames": args.carry_frames,
            "forward_frames": args.forward_frames,
            "include_inactive_layers": args.include_inactive_layers,
        },
        "frame_range": {
            "start": frame_start,
            "end": frame_end,
        },
        "row_count": len(rows),
        "summary": {
            "mapped_rows": mapped_rows,
            "unmapped_rows": unmapped_rows,
        },
        "rows": rows,
    }

    args.output_json.parent.mkdir(parents=True, exist_ok=True)
    args.output_json.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(f"wrote provenance json -> {args.output_json}")
    print(f"rows={len(rows)} mapped={mapped_rows} unmapped={unmapped_rows}")

    if args.markdown_out is not None:
        write_markdown(args.markdown_out, payload)
        print(f"wrote provenance markdown -> {args.markdown_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
