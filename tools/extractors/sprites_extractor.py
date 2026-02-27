"""Metasprite extraction from bank 5 definitions."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir


class SpriteExtractor(SNESExtractor):
    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)

    @staticmethod
    def parse_metasprite(data: bytes) -> list[dict[str, int]]:
        sprites = []
        for i in range(0, len(data), 4):
            if i >= len(data) or data[i] == 0xFF:
                break
            if i + 3 >= len(data):
                break
            sprites.append({"x": data[i], "y": data[i + 1], "tile": data[i + 2], "attr": data[i + 3]})
        return sprites

    def extract_all(self) -> dict[str, int]:
        bank5 = self.read_bank(5)
        metasprite_data = bank5[0x0010:0x0100]

        all_defs = {}
        for car_model in range(4):
            chunk = metasprite_data[car_model * 64 : (car_model + 1) * 64]
            all_defs[f"car_model_{car_model}"] = self.parse_metasprite(chunk)

        out = ensure_dir(self.out_dir / "sprites")
        (out / "metasprites.json").write_text(json.dumps(all_defs, indent=2), encoding="utf-8")
        return {"sprites_rendered": len(all_defs)}
