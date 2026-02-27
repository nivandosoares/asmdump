"""ROM integrity helpers."""

from __future__ import annotations

import zlib
from pathlib import Path


def crc32_file(path: str | Path) -> int:
    crc = 0
    with Path(path).open("rb") as f:
        for chunk in iter(lambda: f.read(65536), b""):
            crc = zlib.crc32(chunk, crc)
    return crc & 0xFFFFFFFF


def validate_size(path: str | Path, expected_size: int) -> bool:
    return Path(path).stat().st_size == expected_size
