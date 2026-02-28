#!/usr/bin/env python3
"""Splice a replacement sub-sequence into an existing runtime manifest."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Replace a frame window inside an existing runtime sequence manifest with another manifest."
    )
    parser.add_argument("base_manifest", type=Path, help="Existing runtime sequence manifest to edit.")
    parser.add_argument("replacement_manifest", type=Path, help="Replacement runtime sequence manifest.")
    parser.add_argument("out_manifest", type=Path, help="Output manifest path.")
    parser.add_argument("--base-frame", type=int, default=0, help="Absolute frame number corresponding to manifest offset 0.")
    parser.add_argument("--replace-start-frame", type=int, required=True, help="Inclusive absolute frame to replace.")
    parser.add_argument(
        "--replace-end-frame-exclusive",
        type=int,
        required=True,
        help="Exclusive absolute frame to replace.",
    )
    parser.add_argument("--json-out", type=Path, help="Optional JSON summary output path.")
    return parser.parse_args()


def relpath(path: Path, base: Path) -> str:
    base_dir = base.resolve().parent
    try:
        return path.resolve().relative_to(base_dir).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def resolve_from_manifest(manifest_path: Path, relative_or_absolute: str) -> Path:
    candidate = Path(relative_or_absolute)
    if candidate.is_absolute():
        return candidate
    return (manifest_path.resolve().parent / candidate).resolve()


def parse_manifest(manifest_path: Path) -> list[dict]:
    entries: list[dict] = []
    for raw_line in manifest_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue

        parts = line.split()
        if len(parts) < 3:
            raise SystemExit(f"error: malformed manifest line in {manifest_path}: {raw_line}")

        entry_type = parts[0]
        try:
            duration = int(parts[1])
        except ValueError as exc:
            raise SystemExit(f"error: invalid duration in {manifest_path}: {raw_line}") from exc

        if duration <= 0:
            raise SystemExit(f"error: non-positive duration in {manifest_path}: {raw_line}")

        payload = parts[2:]
        entries.append(
            {
                "type": entry_type,
                "duration_frames": duration,
                "payload": payload,
                "raw": raw_line,
            }
        )

    if not entries:
        raise SystemExit(f"error: manifest {manifest_path} contains no entries")
    return entries


def rebase_entry(entry: dict, source_manifest: Path, out_manifest: Path) -> str:
    entry_type = entry["type"]
    payload = entry["payload"]

    if entry_type in ("image", "indexed_anim", "ballistic_a39c"):
        if len(payload) != 1:
            raise SystemExit(f"error: expected one payload path for {entry_type} in {source_manifest}")
        path = relpath(resolve_from_manifest(source_manifest, payload[0]), out_manifest)
        return f"{entry_type} {entry['duration_frames']} {path}"

    if entry_type == "snes_bg":
        if len(payload) not in (3, 4):
            raise SystemExit(f"error: expected 3 or 4 payload paths for snes_bg in {source_manifest}")
        rebased = [relpath(resolve_from_manifest(source_manifest, value), out_manifest) for value in payload]
        return " ".join(["snes_bg", str(entry["duration_frames"]), *rebased])

    raise SystemExit(f"error: unsupported entry type {entry_type} in {source_manifest}")


def main() -> int:
    args = parse_args()
    base_entries = parse_manifest(args.base_manifest)
    replacement_entries = parse_manifest(args.replacement_manifest)

    start_offset = args.replace_start_frame - args.base_frame
    end_offset = args.replace_end_frame_exclusive - args.base_frame
    if start_offset < 0 or end_offset <= start_offset:
        raise SystemExit("error: invalid replacement frame window")

    emitted_lines = ["# type duration_frames path_a [path_b path_c path_d]"]
    current_offset = 0
    inserted = False
    kept_entries = 0

    for entry in base_entries:
        entry_start = current_offset
        entry_end = current_offset + entry["duration_frames"]
        current_offset = entry_end

        if entry_end <= start_offset or entry_start >= end_offset:
            emitted_lines.append(rebase_entry(entry, args.base_manifest, args.out_manifest))
            kept_entries += 1
            continue

        if entry_start < start_offset or entry_end > end_offset:
            raise SystemExit(
                "error: replacement range does not align with base manifest entry boundaries "
                f"({entry_start}..{entry_end} overlaps {start_offset}..{end_offset})"
            )

        if not inserted:
            replacement_total = 0
            for replacement_entry in replacement_entries:
                emitted_lines.append(rebase_entry(replacement_entry, args.replacement_manifest, args.out_manifest))
                replacement_total += replacement_entry["duration_frames"]
            if replacement_total != (end_offset - start_offset):
                raise SystemExit(
                    "error: replacement manifest duration "
                    f"{replacement_total} does not match replaced window {end_offset - start_offset}"
                )
            inserted = True

    if not inserted:
        raise SystemExit("error: replacement range did not overlap the base manifest")

    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    args.out_manifest.write_text("\n".join(emitted_lines) + "\n", encoding="utf-8")

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(
            json.dumps(
                {
                    "base_manifest": str(args.base_manifest.resolve()),
                    "replacement_manifest": str(args.replacement_manifest.resolve()),
                    "base_frame": args.base_frame,
                    "replace_start_frame": args.replace_start_frame,
                    "replace_end_frame_exclusive": args.replace_end_frame_exclusive,
                    "kept_entry_count": kept_entries,
                    "replacement_entry_count": len(replacement_entries),
                    "total_duration_frames": sum(int(line.split()[1]) for line in emitted_lines[1:]),
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )

    print(f"wrote spliced runtime manifest {args.out_manifest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
