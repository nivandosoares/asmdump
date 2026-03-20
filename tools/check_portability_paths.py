#!/usr/bin/env python3
"""Fail if promoted tooling surfaces contain machine-specific personal paths."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


DEFAULT_PATHS = (
    "tools/Makefile",
    "validation/run_mesen_capture.sh",
    "validation/run_mesen_probe_boot.sh",
    "validation/run_mesen_dump_bg_range.sh",
    "tools/run_mesen_ppu_extract.sh",
    "tools/README.md",
    "validation/README.md",
)

PATTERNS = (
    re.compile(r"/home/nivando-soares(?:/|\\b)"),
    re.compile(r"/Users/nivando-soares(?:/|\\b)"),
    re.compile(r"Mesen2/bin/linux-x64/Release"),
    re.compile(r"Downloads/Mesen_2\\.[0-9.]+_Linux_x64"),
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Check promoted tooling surfaces for hard-coded personal-machine "
            "paths that should be replaced by env vars or repo-relative examples."
        )
    )
    parser.add_argument(
        "paths",
        nargs="*",
        default=list(DEFAULT_PATHS),
        help="Files to scan. Defaults to the promoted tooling surface.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    repo_dir = Path(__file__).resolve().parent.parent
    findings: list[tuple[Path, int, str]] = []

    for relative in args.paths:
        file_path = repo_dir / relative
        if not file_path.is_file():
            continue
        for line_number, line in enumerate(file_path.read_text(encoding="utf8").splitlines(), start=1):
            if any(pattern.search(line) for pattern in PATTERNS):
                findings.append((file_path.relative_to(repo_dir), line_number, line.rstrip()))

    if not findings:
        print("ok: no hard-coded personal paths found")
        return 0

    print("error: found hard-coded personal paths:", file=sys.stderr)
    for relative_path, line_number, line in findings:
        print(f"  {relative_path}:{line_number}: {line}", file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
