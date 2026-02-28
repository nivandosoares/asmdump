#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


COLORS_PER_PALETTE = 16


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Flatten a structured palette manifest into the SDL viewer's simple palette JSON format."
    )
    parser.add_argument("input", type=Path, help="input structured palette manifest JSON")
    parser.add_argument("output", type=Path, help="output flat palette JSON")
    parser.add_argument(
        "--table",
        action="append",
        default=[],
        help="only include entries from the named table (repeatable)",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    manifest = json.loads(args.input.read_text(encoding="utf-8"))
    requested_tables = set(args.table)
    flat_palettes: list[list[list[int]]] = []

    for table in manifest.get("tables", []):
        name = table.get("name", "")
        if requested_tables and name not in requested_tables:
            continue

        for entry in table.get("entries", []):
            if not entry.get("mapped", False):
                continue

            colors = entry.get("colors_rgb888", [])
            if not colors:
                continue

            if len(colors) % COLORS_PER_PALETTE != 0:
                raise ValueError(
                    f"entry {name}[{entry.get('index')}] has {len(colors)} colors; "
                    f"expected a multiple of {COLORS_PER_PALETTE}"
                )

            for offset in range(0, len(colors), COLORS_PER_PALETTE):
                flat_palettes.append(colors[offset:offset + COLORS_PER_PALETTE])

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(flat_palettes, indent=2), encoding="utf-8")
    print(f"flattened {len(flat_palettes)} palettes -> {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
