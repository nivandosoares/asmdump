"""Palette extraction from bank 3 BGR555 data."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir, setup_logger
from tools.utils.snes_formats import decode_bgr555


class PaletteExtractor(SNESExtractor):
    DEFAULT_RANGES = {
        "main": (0x0008, 0x0060),
        "ballistic": (0x0060, 0x0100),
        "credits": (0x0100, 0x0180),
        "gameplay": (0x0180, 0x0300),
    }

    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)
        self.logger = setup_logger("PaletteExtractor")

    def extract_all(self) -> dict[str, list[tuple[int, int, int]]]:
        bank3 = self.read_bank(3)
        palettes: dict[str, list[tuple[int, int, int]]] = {}

        for name, (start, end) in self.DEFAULT_RANGES.items():
            colors = []
            for i in range(start, end, 2):
                colors.append(decode_bgr555(bank3[i], bank3[i + 1]))
            palettes[name] = colors

        self._save_outputs(palettes)
        self.logger.info("Extracted %d palette groups", len(palettes))
        return palettes

    def _save_outputs(self, palettes: dict[str, list[tuple[int, int, int]]]) -> None:
        palette_dir = ensure_dir(self.out_dir / "palettes")
        raw_dir = ensure_dir(palette_dir / "raw")

        (palette_dir / "bank3_palettes.json").write_text(
            json.dumps(palettes, indent=2), encoding="utf-8"
        )

        for name, colors in palettes.items():
            gpl_path = palette_dir / f"{name}.gpl"
            with gpl_path.open("w", encoding="utf-8") as fp:
                fp.write("GIMP Palette\n")
                fp.write(f"Name: {name}\n")
                fp.write("#\n")
                for idx, (r, g, b) in enumerate(colors):
                    fp.write(f"{r:3d} {g:3d} {b:3d} color_{idx:02d}\n")

            raw = bytearray()
            for r, g, b in colors:
                rgb555 = ((r >> 3) & 0x1F) | (((g >> 3) & 0x1F) << 5) | (((b >> 3) & 0x1F) << 10)
                raw.extend((rgb555 & 0xFF, (rgb555 >> 8) & 0xFF))
            (raw_dir / f"{name}.bin").write_bytes(bytes(raw))
