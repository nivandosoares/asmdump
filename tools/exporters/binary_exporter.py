"""Binary export helpers."""

from __future__ import annotations

from pathlib import Path


def export_binary(data: bytes | bytearray, output_path: str | Path) -> None:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(bytes(data))
