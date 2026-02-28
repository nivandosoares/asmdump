#!/usr/bin/env python3
"""Emit a JSON summary for a runtime sequence manifest."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Parse a runtime manifest and write a JSON summary with typed entries."
    )
    parser.add_argument("manifest", type=Path, help="Input runtime manifest path.")
    parser.add_argument("json_out", type=Path, help="Output JSON summary path.")
    return parser.parse_args()


def parse_manifest(path: Path) -> list[dict]:
    entries: list[dict] = []
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue

        parts = line.split()
        if len(parts) < 3:
            raise SystemExit(f"error: malformed manifest line in {path}: {raw_line}")

        entry_type = parts[0]
        try:
            duration_frames = int(parts[1])
        except ValueError as exc:
            raise SystemExit(f"error: invalid duration in {path}: {raw_line}") from exc

        if duration_frames <= 0:
            raise SystemExit(f"error: non-positive duration in {path}: {raw_line}")

        payload = parts[2:]
        entry: dict[str, object] = {
            "type": entry_type,
            "duration_frames": duration_frames,
        }

        if entry_type == "image":
            if len(payload) != 1:
                raise SystemExit(f"error: expected one payload path for image in {path}")
            entry["image"] = payload[0]
        elif entry_type == "indexed_anim":
            if len(payload) != 1:
                raise SystemExit(f"error: expected one payload path for indexed_anim in {path}")
            entry["clip"] = payload[0]
        elif entry_type == "ballistic_a39c":
            if len(payload) != 1:
                raise SystemExit(f"error: expected one payload path for ballistic_a39c in {path}")
            entry["asset"] = payload[0]
        elif entry_type == "snes_bg":
            if len(payload) not in (3, 4):
                raise SystemExit(f"error: expected 3 or 4 payload paths for snes_bg in {path}")
            entry["vram"] = payload[0]
            entry["cgram"] = payload[1]
            entry["ppu_state"] = payload[2]
            if len(payload) == 4:
                entry["oam"] = payload[3]
        else:
            raise SystemExit(f"error: unsupported manifest entry type {entry_type} in {path}")

        entries.append(entry)

    if not entries:
        raise SystemExit(f"error: manifest {path} contains no entries")

    return entries


def main() -> int:
    args = parse_args()
    entries = parse_manifest(args.manifest)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(
        json.dumps(
            {
                "manifest": args.manifest.as_posix(),
                "entries": entries,
                "total_duration_frames": sum(int(entry["duration_frames"]) for entry in entries),
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )
    print(f"wrote runtime manifest summary {args.json_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
