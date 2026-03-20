#!/usr/bin/env python3
"""Remove generated clutter that does not belong in the repository."""

from __future__ import annotations

import argparse
import shutil
import subprocess
from pathlib import Path


STATIC_PATHS = (
    "port/build",
    "tools/mesen_ppu_extract/bin",
    "tools/mesen_ppu_extract/obj",
    ".mesen-config/Mesen2/LuaScriptData",
    ".mesen-runs",
    "tools/out/bg_layer_priority_check",
    "tools/out/obj_vertical_flip_check",
    "validation/README.pdf",
)

GLOB_PATTERNS = (
    "tools/out/*smoke*",
    "tools/out/*makecheck*",
    "tools/out/*designtest*",
    "tools/out/tmp*",
    "tools/out/test_*",
    "tools/out/**/.mesen-home/Debugger/*.cdl",
    ".mesen-config/Mesen2/Debugger/*.cdl",
    "port/assets/**/.mesen-home/Debugger/*.cdl",
    "tools/**/__pycache__",
    "validation/**/__pycache__",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Delete reproducible build products, scratch outputs, and debugger "
            "coverage artifacts that pollute the repo."
        )
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="List cleanup targets without deleting them.",
    )
    return parser.parse_args()


def is_relative_to(path: Path, other: Path) -> bool:
    try:
        path.relative_to(other)
        return True
    except ValueError:
        return False


def path_size(path: Path) -> int:
    if not path.exists():
        return 0
    if path.is_file() or path.is_symlink():
        return path.stat().st_size

    total = 0
    for child in path.rglob("*"):
        if child.is_file() and not child.is_symlink():
            total += child.stat().st_size
    return total


def format_size(size_bytes: int) -> str:
    units = ("B", "K", "M", "G", "T")
    value = float(size_bytes)
    unit_index = 0
    while value >= 1024.0 and unit_index < (len(units) - 1):
        value /= 1024.0
        unit_index += 1
    if unit_index == 0:
        return f"{int(value)}{units[unit_index]}"
    return f"{value:.1f}{units[unit_index]}"


def contains_tracked_content(repo_dir: Path, path: Path) -> bool:
    try:
        relative_path = path.relative_to(repo_dir)
    except ValueError:
        return False

    result = subprocess.run(
        ["git", "-C", str(repo_dir), "ls-files", "--full-name", "--", str(relative_path)],
        check=False,
        capture_output=True,
        text=True,
    )
    return bool(result.stdout.strip())


def collect_targets(repo_dir: Path) -> list[Path]:
    found: list[Path] = []

    for relative_path in STATIC_PATHS:
        path = repo_dir / relative_path
        if path.exists():
            found.append(path)

    for pattern in GLOB_PATTERNS:
        for path in repo_dir.glob(pattern):
            if path.exists():
                found.append(path)

    unique = sorted({path.resolve() for path in found}, key=lambda path: (len(path.parts), str(path)))
    collapsed: list[Path] = []
    for path in unique:
        if any(path == kept or is_relative_to(path, kept) for kept in collapsed):
            continue
        if contains_tracked_content(repo_dir, path):
            continue
        collapsed.append(path)
    return collapsed


def remove_path(path: Path) -> None:
    if path.is_dir() and not path.is_symlink():
        shutil.rmtree(path)
    else:
        path.unlink()


def main() -> int:
    args = parse_args()
    repo_dir = Path(__file__).resolve().parent.parent
    targets = collect_targets(repo_dir)

    if not targets:
        print("nothing to clean")
        return 0

    total_bytes = sum(path_size(path) for path in targets)
    prefix = "would remove" if args.dry_run else "removing"
    for path in targets:
        print(f"{prefix}: {path.relative_to(repo_dir)} ({format_size(path_size(path))})")

    if args.dry_run:
        print(f"dry-run total: {len(targets)} paths, {format_size(total_bytes)}")
        return 0

    for path in targets:
        remove_path(path)

    print(f"removed: {len(targets)} paths, {format_size(total_bytes)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
