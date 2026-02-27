"""Track segment extraction for banks 13/14/26."""

from __future__ import annotations

import json
from pathlib import Path

from tools.extractors.base_extractor import SNESExtractor
from tools.utils.logger import ensure_dir, setup_logger


class TrackDataExtractor(SNESExtractor):
    TRACK_BANKS = [13, 14, 26]

    def __init__(self, rom_path: str | Path, out_dir: str | Path):
        super().__init__(rom_path)
        self.out_dir = Path(out_dir)
        self.logger = setup_logger("TrackDataExtractor")

    def find_segments(self, bank_data: bytes) -> list[dict[str, int]]:
        segments = []
        i = 0
        while i + 8 <= len(bank_data):
            if bank_data[i] == 0xFB and bank_data[i + 1] == 0x26:
                segment = self.parse_segment(bank_data[i : i + 8])
                segment["offset"] = i
                segments.append(segment)
                i += 8
            else:
                i += 1
        return segments

    def parse_segment(self, data: bytes) -> dict[str, int]:
        return {
            "marker": data[0] | (data[1] << 8),
            "curvature": data[2],
            "elevation": data[3],
            "scenery_id": data[4] & 0x0F,
            "shoulder_left": (data[4] >> 4) & 0x0F,
            "shoulder_right": data[5] & 0x0F,
            "length": data[6],
            "checkpoint": 1 if data[7] & 0x80 else 0,
            "next_segment": data[7] & 0x7F,
            "size": 8,
        }

    def extract_all(self) -> dict[str, int]:
        all_segments: dict[str, list[dict[str, int]]] = {}
        unknown_patterns = 0
        for bank in self.TRACK_BANKS:
            data = self.read_bank(bank)
            segments = self.find_segments(data)
            if not segments:
                unknown_patterns += 1
            all_segments[f"bank{bank:02d}"] = segments
            self.logger.info("bank%02d: %d candidate segments", bank, len(segments))

        out = ensure_dir(self.out_dir / "tracks")
        (out / "segments.json").write_text(json.dumps(all_segments, indent=2), encoding="utf-8")
        return {
            "segments_found": sum(len(v) for v in all_segments.values()),
            "tracks_reconstructed": len([v for v in all_segments.values() if v]),
            "unknown_patterns": unknown_patterns,
        }
