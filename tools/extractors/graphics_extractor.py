"""Graphics extraction for 2bpp/4bpp SNES tiles."""

from __future__ import annotations

from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir, setup_logger
from tools.utils.snes_formats import decode_2bpp_tile, decode_4bpp_tile, encode_rgb_rows


class GraphicsExtractor(SNESExtractor):
    BANKS_4BPP = [6, 7, 8, 20, 21, 22, 23, 24, 25]
    BANKS_2BPP = [9]

    def __init__(self, rom_path: str | Path, out_dir: str | Path, palette: list[tuple[int, int, int]]):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)
        self.palette = palette
        self.logger = setup_logger("GraphicsExtractor")

    def extract_all(self) -> dict[str, int]:
        count = 0
        for bank in self.BANKS_4BPP:
            count += self._extract_bank(bank, is_4bpp=True)
        for bank in self.BANKS_2BPP:
            count += self._extract_bank(bank, is_4bpp=False)
        return {"tiles_extracted": count}

    def _extract_bank(self, bank: int, is_4bpp: bool) -> int:
        bank_data = self.read_bank(bank)
        tile_size = 32 if is_4bpp else 16
        tiles = [bank_data[i : i + tile_size] for i in range(0, len(bank_data), tile_size)]
        out = ensure_dir(self.out_dir / "graphics" / f"bank{bank:02d}")

        raw_tiles = bytearray()
        for i, tile in enumerate(tiles):
            if len(tile) < tile_size:
                continue
            indexes = decode_4bpp_tile(tile) if is_4bpp else decode_2bpp_tile(tile)
            rgb_rows = [[self.palette[p % len(self.palette)] for p in row] for row in indexes]
            self._write_ppm(out / f"tile_{i:04d}.ppm", rgb_rows)
            raw_tiles.extend(tile)

        (out / "raw_tiles.bin").write_bytes(bytes(raw_tiles))
        self.logger.info("bank%02d extracted: %d tiles", bank, len(tiles))
        return len(tiles)

    def _write_ppm(self, path: Path, rgb_rows: list[list[tuple[int, int, int]]]) -> None:
        width = len(rgb_rows[0]) if rgb_rows else 0
        height = len(rgb_rows)
        payload = encode_rgb_rows(rgb_rows)
        header = f"P6\n{width} {height}\n255\n".encode("ascii")
        path.write_bytes(header + payload)
