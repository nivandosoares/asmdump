"""Text extraction helpers for Distinctive-compressed blocks."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir


def decode_distinctive_text(compressed_data: bytes) -> str | None:
    if len(compressed_data) < 4:
        return None
    if compressed_data[0] != 0x42 or compressed_data[1] != 0xFB:
        return None

    size = (compressed_data[3] << 8) | compressed_data[2]
    data = compressed_data[4 : 4 + size]

    decoded = []
    i = 0
    while i < len(data):
        if data[i] & 0x80 and i + 1 < len(data):
            run_length = data[i] & 0x7F
            char = data[i + 1]
            decoded.extend([char] * run_length)
            i += 2
        else:
            decoded.append(data[i])
            i += 1

    return bytes(decoded).decode("ascii", errors="ignore")


class TextExtractor(SNESExtractor):
    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)

    def extract_all(self) -> dict[str, int]:
        bank4 = self.read_bank(4)
        texts = {
            "credits": decode_distinctive_text(bank4[0x0100:0x0200]),
            "menu": decode_distinctive_text(bank4[0x0200:0x0600]),
        }
        out = ensure_dir(self.out_dir / "texts")
        (out / "menu_strings.json").write_text(
            json.dumps(texts, indent=2, ensure_ascii=False), encoding="utf-8"
        )
        return {"text_blocks": len([v for v in texts.values() if v])}
