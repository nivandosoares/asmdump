#!/usr/bin/env python3
"""Regression check for BG4 support and tile-priority ordering."""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

from compare_frames import compare_images, load_image, write_diff_ppm


SCREEN_WIDTH = 256
SCREEN_HEIGHT = 224
CHR_BASE_BYTES = 0x2000
TEST_TILE_INDEX = 1
LAYER_TILEMAP_BASE_BYTES = (0x0000, 0x0800, 0x1000, 0x1800)
TEST_CELLS = {
    "bg4_only": (2, 2),
    "low_priority_order": (5, 2),
    "priority_over_layer": (2, 5),
    "high_priority_order": (5, 5),
}
PALETTE_RGB = {
    "backdrop": (12, 16, 24),
    "bg4_low": (64, 96, 255),
    "bg2_low": (255, 160, 32),
    "bg1_low": (255, 48, 48),
    "bg4_high": (48, 224, 224),
    "bg3_high": (64, 224, 64),
    "bg1_high": (255, 255, 255),
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Generate a minimal BG-mode-0 scene and verify BG4 support plus "
            "tile-priority ordering in the Python and SDL renderers."
        )
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=None,
        help="Directory for generated fixture and render outputs. Defaults to a temporary directory.",
    )
    parser.add_argument(
        "--port-binary",
        type=Path,
        default=Path("port/build/td2_port"),
        help="Path to the built SDL runtime binary.",
    )
    parser.add_argument(
        "--keep-dir",
        action="store_true",
        help="Keep the temporary output directory when --out-dir is not supplied.",
    )
    return parser.parse_args()


def rgb_to_snes_word(color: tuple[int, int, int]) -> int:
    red5 = round(color[0] * 31 / 255)
    green5 = round(color[1] * 31 / 255)
    blue5 = round(color[2] * 31 / 255)
    return red5 | (green5 << 5) | (blue5 << 10)


def snes_word_to_rgb(word: int) -> tuple[int, int, int]:
    red5 = word & 0x1F
    green5 = (word >> 5) & 0x1F
    blue5 = (word >> 10) & 0x1F
    return (
        (red5 << 3) | (red5 >> 2),
        (green5 << 3) | (green5 >> 2),
        (blue5 << 3) | (blue5 >> 2),
    )


def quantized_rgb(color: tuple[int, int, int]) -> tuple[int, int, int]:
    return snes_word_to_rgb(rgb_to_snes_word(color))


def encode_solid_2bpp_tile(color_index: int) -> bytes:
    tile = bytearray(16)
    plane0 = 0xFF if (color_index & 0x01) else 0x00
    plane1 = 0xFF if (color_index & 0x02) else 0x00

    for row in range(8):
        tile[row * 2] = plane0
        tile[row * 2 + 1] = plane1

    return bytes(tile)


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def build_state() -> dict[str, object]:
    state: dict[str, object] = {
        "ppu.bgMode": 0,
        "ppu.mainScreenLayers": 0x0F,
        "ppu.oamMode": 0,
        "ppu.oamBaseAddress": 0,
        "ppu.oamAddressOffset": 0,
        "ppu.internalOamAddress": 0,
        "ppu.frameCount": 0,
        "ppu.enableOamPriority": False,
        "ppu.objInterlace": False,
        "ppu.overscanMode": False,
        "ppu.mode7.fillWithTile0": False,
        "ppu.mode7.horizontalMirroring": False,
        "ppu.mode7.verticalMirroring": False,
        "ppu.mode7.largeMap": False,
        "ppu.mode7.centerX": 0,
        "ppu.mode7.centerY": 0,
        "ppu.mode7.hscroll": 0,
        "ppu.mode7.vscroll": 0,
        "ppu.mode7.matrix[0]": 0,
        "ppu.mode7.matrix[1]": 0,
        "ppu.mode7.matrix[2]": 0,
        "ppu.mode7.matrix[3]": 0,
    }

    for layer_index, tilemap_base in enumerate(LAYER_TILEMAP_BASE_BYTES):
        state[f"ppu.layers[{layer_index}].tilemapAddress"] = tilemap_base >> 1
        state[f"ppu.layers[{layer_index}].chrAddress"] = CHR_BASE_BYTES >> 1
        state[f"ppu.layers[{layer_index}].doubleWidth"] = False
        state[f"ppu.layers[{layer_index}].doubleHeight"] = False
        state[f"ppu.layers[{layer_index}].largeTiles"] = False
        state[f"ppu.layers[{layer_index}].hscroll"] = 0
        state[f"ppu.layers[{layer_index}].vscroll"] = 0

    return state


def write_tilemap_entry(
    vram: bytearray,
    base_bytes: int,
    tile_x: int,
    tile_y: int,
    tile_index: int,
    palette_index: int,
    priority: int,
) -> None:
    offset = base_bytes + ((tile_y * 32 + tile_x) * 2)
    entry = (tile_index & 0x03FF) | (palette_index << 10) | (priority << 13)
    vram[offset] = entry & 0xFF
    vram[offset + 1] = (entry >> 8) & 0xFF


def build_expected_rgb() -> bytes:
    palette_rgb = {name: quantized_rgb(color) for name, color in PALETTE_RGB.items()}
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)

    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(palette_rgb["backdrop"])

    expected_cells = {
        TEST_CELLS["bg4_only"]: palette_rgb["bg4_low"],
        TEST_CELLS["low_priority_order"]: palette_rgb["bg2_low"],
        TEST_CELLS["priority_over_layer"]: palette_rgb["bg4_high"],
        TEST_CELLS["high_priority_order"]: palette_rgb["bg1_high"],
    }

    for (tile_x, tile_y), color in expected_cells.items():
        for pixel_y in range(8):
            for pixel_x in range(8):
                x_pos = (tile_x * 8) + pixel_x
                y_pos = (tile_y * 8) + pixel_y
                dst = ((y_pos * SCREEN_WIDTH) + x_pos) * 3
                rgb[dst:dst + 3] = bytes(color)

    return bytes(rgb)


def write_fixture(out_dir: Path) -> dict[str, Path]:
    fixture_dir = out_dir / "fixture"
    fixture_dir.mkdir(parents=True, exist_ok=True)

    vram = bytearray(0x10000)
    cgram = bytearray(0x0200)
    tile_bytes = encode_solid_2bpp_tile(1)
    tile_offset = CHR_BASE_BYTES + (TEST_TILE_INDEX * len(tile_bytes))
    vram[tile_offset:tile_offset + len(tile_bytes)] = tile_bytes

    palette_names = (
        "bg4_low",
        "bg2_low",
        "bg1_low",
        "bg4_high",
        "bg3_high",
        "bg1_high",
    )
    backdrop_word = rgb_to_snes_word(PALETTE_RGB["backdrop"])
    cgram[0] = backdrop_word & 0xFF
    cgram[1] = (backdrop_word >> 8) & 0xFF
    for palette_index, palette_name in enumerate(palette_names):
        word = rgb_to_snes_word(PALETTE_RGB[palette_name])
        cgram_index = (palette_index * 4) + 1
        offset = cgram_index * 2
        cgram[offset] = word & 0xFF
        cgram[offset + 1] = (word >> 8) & 0xFF

    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[3], *TEST_CELLS["bg4_only"], tile_index=TEST_TILE_INDEX, palette_index=0, priority=0)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[3], *TEST_CELLS["low_priority_order"], tile_index=TEST_TILE_INDEX, palette_index=0, priority=0)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[1], *TEST_CELLS["low_priority_order"], tile_index=TEST_TILE_INDEX, palette_index=1, priority=0)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[0], *TEST_CELLS["priority_over_layer"], tile_index=TEST_TILE_INDEX, palette_index=2, priority=0)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[3], *TEST_CELLS["priority_over_layer"], tile_index=TEST_TILE_INDEX, palette_index=3, priority=1)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[2], *TEST_CELLS["high_priority_order"], tile_index=TEST_TILE_INDEX, palette_index=4, priority=1)
    write_tilemap_entry(vram, LAYER_TILEMAP_BASE_BYTES[0], *TEST_CELLS["high_priority_order"], tile_index=TEST_TILE_INDEX, palette_index=5, priority=1)

    vram_path = fixture_dir / "bg_priority_vram.bin"
    cgram_path = fixture_dir / "bg_priority_cgram.bin"
    state_path = fixture_dir / "bg_priority_state.json"
    golden_path = fixture_dir / "bg_priority_expected.ppm"
    sequence_path = fixture_dir / "bg_priority_sequence.txt"

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    state_path.write_text(json.dumps(build_state(), indent=2) + "\n", encoding="utf-8")
    write_ppm(golden_path, SCREEN_WIDTH, SCREEN_HEIGHT, build_expected_rgb())
    sequence_path.write_text(
        "snes_bg 1 bg_priority_vram.bin bg_priority_cgram.bin bg_priority_state.json\n",
        encoding="utf-8",
    )

    return {
        "fixture_dir": fixture_dir,
        "vram": vram_path,
        "cgram": cgram_path,
        "state": state_path,
        "sequence": sequence_path,
        "golden": golden_path,
    }


def run_command(command: list[str], cwd: Path) -> str:
    result = subprocess.run(
        command,
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(f"command failed ({result.returncode}): {' '.join(command)}\n{result.stdout}")
    return result.stdout


def compare_paths(expected_path: Path, actual_path: Path, diff_path: Path) -> tuple[int, float]:
    expected_width, expected_height, expected_pixels = load_image(expected_path)
    actual_width, actual_height, actual_pixels = load_image(actual_path)
    if (expected_width, expected_height) != (actual_width, actual_height):
        raise ValueError(
            f"image size mismatch: expected {expected_width}x{expected_height}, "
            f"got {actual_width}x{actual_height}"
        )

    result = compare_images(expected_pixels, actual_pixels)
    mismatch_pixels = int(result["mismatch_pixels"])
    mismatch_ratio = mismatch_pixels / int(result["pixel_count"]) if int(result["pixel_count"]) else 0.0
    if mismatch_pixels != 0:
        write_diff_ppm(diff_path, expected_width, expected_height, result["diff_rgb"])
    return mismatch_pixels, mismatch_ratio


def run_python_case(repo_dir: Path, fixture: dict[str, Path], renders_dir: Path) -> Path:
    output_path = renders_dir / "python_bg_priority.ppm"
    command = [
        sys.executable,
        str(repo_dir / "tools" / "render_mesen_snes_bg.py"),
        str(fixture["vram"]),
        str(fixture["cgram"]),
        str(fixture["state"]),
        str(output_path),
    ]
    run_command(command, repo_dir)
    return output_path


def run_port_case(repo_dir: Path, port_binary: Path, fixture: dict[str, Path], renders_dir: Path) -> Path:
    dump_prefix = renders_dir / "port_bg_priority"
    output_path = renders_dir / "port_bg_priority_00000.ppm"
    command = [
        str(port_binary),
        "--sequence",
        str(fixture["sequence"]),
        "--sequence-no-loop",
        "--headless",
        "--frames",
        "1",
        "--dump-prefix",
        str(dump_prefix),
    ]
    run_command(command, repo_dir)
    return output_path


def main() -> int:
    args = parse_args()
    repo_dir = Path(__file__).resolve().parent.parent
    created_temp_dir = False

    if args.out_dir is None:
        out_dir = Path(tempfile.mkdtemp(prefix="td2_bg_priority_"))
        created_temp_dir = True
    else:
        out_dir = args.out_dir.resolve()
        out_dir.mkdir(parents=True, exist_ok=True)

    try:
        fixture = write_fixture(out_dir)
        renders_dir = out_dir / "renders"
        renders_dir.mkdir(parents=True, exist_ok=True)
        port_binary = args.port_binary.resolve()
        if not port_binary.is_file():
            raise FileNotFoundError(f"port binary not found: {port_binary}")

        cases = [
            ("python_bg_priority", run_python_case(repo_dir, fixture, renders_dir)),
            ("port_bg_priority", run_port_case(repo_dir, port_binary, fixture, renders_dir)),
        ]

        failures = 0
        for label, actual_path in cases:
            diff_path = renders_dir / f"{label}_diff.ppm"
            mismatch_pixels, mismatch_ratio = compare_paths(fixture["golden"], actual_path, diff_path)
            if mismatch_pixels == 0:
                print(f"PASS {label}: pixel-perfect ({actual_path})")
            else:
                failures += 1
                print(
                    f"FAIL {label}: {mismatch_pixels} mismatched pixels "
                    f"({mismatch_ratio:.6%}) diff={diff_path}"
                )

        if failures != 0:
            print(f"fixture: {fixture['fixture_dir']}")
            return 1

        print(f"PASS bg layer priority regression: {len(cases)} paths matched {fixture['golden']}")
        print(f"fixture: {fixture['fixture_dir']}")
        return 0
    finally:
        if created_temp_dir and not args.keep_dir:
            shutil.rmtree(out_dir, ignore_errors=True)


if __name__ == "__main__":
    raise SystemExit(main())
