#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Summarize tracked register-write traces captured by mesen_probe_boot.lua."
    )
    parser.add_argument("trace_json", type=Path, help="input td2_boot_probe_*_writes.json path")
    parser.add_argument("--json-out", type=Path, default=None, help="optional summary JSON output path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    payload = json.loads(args.trace_json.read_text())
    writes = payload.get("writes", [])

    by_register: Counter[str] = Counter()
    by_scanline: Counter[int] = Counter()
    register_scanlines: dict[str, set[int]] = defaultdict(set)
    register_values: dict[str, list[int]] = defaultdict(list)

    for entry in writes:
        register = str(entry.get("register", "unknown"))
        scanline = int(entry.get("scanline", -1))
        value = int(entry.get("value", 0))
        by_register[register] += 1
        by_scanline[scanline] += 1
        register_scanlines[register].add(scanline)
        register_values[register].append(value)

    summary = {
        "screenshot_frame": payload.get("screenshot_frame"),
        "total_writes": len(writes),
        "register_counts": dict(sorted(by_register.items())),
        "scanline_counts_top": [
            {"scanline": scanline, "count": count}
            for scanline, count in sorted(by_scanline.items(), key=lambda item: (-item[1], item[0]))[:20]
        ],
        "register_details": {
            register: {
                "count": by_register[register],
                "unique_scanlines": len(register_scanlines[register]),
                "scanline_min": min(register_scanlines[register]) if register_scanlines[register] else None,
                "scanline_max": max(register_scanlines[register]) if register_scanlines[register] else None,
                "unique_values": sorted(set(register_values[register])),
            }
            for register in sorted(by_register)
        },
    }

    if args.json_out is not None:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(f"frame {summary['screenshot_frame']}: {summary['total_writes']} tracked writes")
    for register in sorted(by_register):
        detail = summary["register_details"][register]
        print(
            f"{register}: count={detail['count']} "
            f"scanlines={detail['unique_scanlines']} "
            f"range={detail['scanline_min']}..{detail['scanline_max']} "
            f"values={detail['unique_values'][:8]}"
        )

    if summary["scanline_counts_top"]:
        print("top scanlines:")
        for item in summary["scanline_counts_top"][:10]:
            print(f"  {item['scanline']}: {item['count']}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
