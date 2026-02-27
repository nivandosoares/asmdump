"""Base extractor with common ROM reading utilities."""

from __future__ import annotations

import tomllib
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from tools.utils.logger import setup_logger

BANK_SIZE = 0x8000


@dataclass(slots=True)
class ROMConfig:
    path: Path
    size: int
    mapping: str
    banks: list[dict[str, Any]]


class SNESExtractor:
    def __init__(self, rom_path: str | Path, bank_config: dict[str, Any] | None = None):
        self.rom_path = Path(rom_path)
        self.rom = self.rom_path.open("rb")
        self.config = bank_config or {}
        self.logger = setup_logger(self.__class__.__name__)

    @classmethod
    def from_toml(cls, config_path: str | Path) -> tuple["SNESExtractor", ROMConfig]:
        config_file = Path(config_path)
        data = tomllib.loads(config_file.read_text(encoding="utf-8"))
        rom_data = data["rom"]
        rom_path = (config_file.parent / rom_data["path"]).resolve()
        cfg = ROMConfig(
            path=rom_path,
            size=rom_data["size"],
            mapping=rom_data.get("mapping", "LoROM"),
            banks=data.get("banks", []),
        )
        return cls(cfg.path, data), cfg

    def close(self) -> None:
        self.rom.close()

    def read_bank(self, bank_num: int) -> bytes:
        """Read one 32 KiB LoROM bank."""
        offset = bank_num * BANK_SIZE
        self.rom.seek(offset)
        return self.rom.read(BANK_SIZE)

    def read_range(self, bank_num: int, start: int, size: int) -> bytes:
        """Read a specific range inside a LoROM bank."""
        offset = bank_num * BANK_SIZE + start
        self.rom.seek(offset)
        return self.rom.read(size)

    def read_offset(self, rom_offset: int, size: int) -> bytes:
        self.rom.seek(rom_offset)
        return self.rom.read(size)
