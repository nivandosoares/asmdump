#!/usr/bin/env python3
"""Extrator completo para The Duel: Test Drive II (SNES)."""

from __future__ import annotations

import argparse
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.extractors import (
    AudioExtractor,
    GraphicsExtractor,
    PaletteExtractor,
    SpriteExtractor,
    TextExtractor,
    TilemapExtractor,
    TrackDataExtractor,
)
from tools.utils.crc_checks import crc32_file, validate_size
from tools.utils.logger import ensure_dir


def generate_report(output_dir: Path, report: dict) -> None:
    (output_dir / "extraction_report.json").write_text(__import__("json").dumps(report, indent=2), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--rom", required=True, help="Caminho para a ROM")
    parser.add_argument("--output", default="./output", help="Diretório de saída")
    parser.add_argument("--expected-size", type=int, default=1048576)
    args = parser.parse_args()

    rom_path = Path(args.rom)
    output_dir = ensure_dir(args.output)

    warnings = []
    if not validate_size(rom_path, args.expected_size):
        warnings.append("ROM size differs from expected value")

    palette_extractor = PaletteExtractor(rom_path, output_dir)
    palettes = palette_extractor.extract_all()
    palette_extractor.close()

    graphics_extractor = GraphicsExtractor(rom_path, output_dir, palettes.get("gameplay", palettes["main"]))
    graphics_stats = graphics_extractor.extract_all()
    graphics_extractor.close()

    tilemap_extractor = TilemapExtractor(rom_path, output_dir)
    tilemap_extractor.extract_all()
    tilemap_extractor.close()

    sprite_extractor = SpriteExtractor(rom_path, output_dir)
    sprite_stats = sprite_extractor.extract_all()
    sprite_extractor.close()

    track_extractor = TrackDataExtractor(rom_path, output_dir)
    track_stats = track_extractor.extract_all()
    track_extractor.close()

    audio_extractor = AudioExtractor(rom_path, output_dir)
    audio_stats = audio_extractor.extract_all()
    audio_extractor.close()

    text_extractor = TextExtractor(rom_path, output_dir)
    text_extractor.extract_all()
    text_extractor.close()

    report = {
        "rom": rom_path.name,
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "crc32": f"{crc32_file(rom_path):08X}",
        "banks_processed": list(range(32)),
        "graphics": {
            "tiles_extracted": graphics_stats["tiles_extracted"],
            "palettes_extracted": sum(len(v) for v in palettes.values()),
            "sprites_rendered": sprite_stats["sprites_rendered"],
        },
        "tracks": track_stats,
        "audio": audio_stats,
        "warnings": warnings,
    }
    generate_report(output_dir, report)
    print("✅ Extração completa!")


if __name__ == "__main__":
    main()
