"""Audio sample extraction skeleton for BRR blocks."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir


class AudioExtractor(SNESExtractor):
    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)

    @staticmethod
    def decode_brr_block(block: bytes) -> dict[str, int]:
        header = block[0]
        return {
            "range_shift": (header >> 4) & 0x0F,
            "filter_type": (header >> 2) & 0x03,
            "loop": (header >> 1) & 0x01,
            "end": header & 0x01,
        }

    def extract_all(self) -> dict[str, float]:
        bank18 = self.read_bank(18)
        raw_samples = bank18[0x0020:0x0100]

        decoded_headers = []
        for i in range(0, len(raw_samples), 9):
            block = raw_samples[i : i + 9]
            if len(block) == 9:
                decoded_headers.append(self.decode_brr_block(block))

        out = ensure_dir(self.out_dir / "audio")
        (out / "samples.json").write_text(json.dumps(decoded_headers, indent=2), encoding="utf-8")
        return {"samples_extracted": len(decoded_headers), "duration_seconds": 0.0}
