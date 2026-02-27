"""Tilemap extraction utilities."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir


def decode_tilemap_entry(high_byte: int, low_byte: int) -> dict[str, int]:
    tile_number = ((high_byte & 0x03) << 8) | low_byte
    palette = (high_byte >> 2) & 0x07
    priority = (high_byte >> 5) & 0x01
    h_flip = (high_byte >> 6) & 0x01
    v_flip = (high_byte >> 7) & 0x01
    return {
        "tile": tile_number,
        "palette": palette,
        "priority": priority,
        "h_flip": h_flip,
        "v_flip": v_flip,
    }


class TilemapExtractor(SNESExtractor):
    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)

    def extract_all(self) -> dict[str, int]:
        bank12 = self.read_bank(12)
        layout_data = bank12[0x0200:0x0400]
        entries = []
        for i in range(0, len(layout_data), 2):
            entries.append(decode_tilemap_entry(layout_data[i + 1], layout_data[i]))
        grid = [entries[i : i + 32] for i in range(0, len(entries), 32)]

        out = ensure_dir(self.out_dir / "tilemaps")
        (out / "cockpit.json").write_text(json.dumps(grid, indent=2), encoding="utf-8")
        return {"tilemap_entries": len(entries)}
