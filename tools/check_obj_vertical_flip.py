#!/usr/bin/env python3
"""Regression check for vertically mirrored non-square OBJ sprites."""

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
SPRITE_X = 48
SPRITE_Y = 32
SPRITE_WIDTH = 16
SPRITE_HEIGHT = 32
SPRITE_TILE_INDICES = (
    (0x00, 0x01),
    (0x10, 0x11),
    (0x20, 0x21),
    (0x30, 0x31),
)
SPRITE_TILE_COLORS = (
    (1, 2),
    (3, 4),
    (5, 6),
    (7, 8),
)
PALETTE_RGB = {
    0: (16, 16, 24),
    1: (255, 32, 32),
    2: (255, 144, 32),
    3: (255, 224, 32),
    4: (64, 224, 64),
    5: (48, 200, 255),
    6: (64, 96, 255),
    7: (224, 64, 224),
    8: (255, 255, 255),
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Generate a minimal 16x32 vertically mirrored OBJ scene and verify "
            "the Python and SDL renderers against a golden PPM."
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
        "--skip-port",
        action="store_true",
        help="Only validate the Python renderer paths.",
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


def encode_solid_4bpp_tile(color_index: int) -> bytes:
    tile = bytearray(32)
    plane_bits = [0xFF if ((color_index >> bit) & 0x01) else 0x00 for bit in range(4)]

    for row in range(8):
        tile[row * 2] = plane_bits[0]
        tile[row * 2 + 1] = plane_bits[1]
        tile[16 + row * 2] = plane_bits[2]
        tile[16 + row * 2 + 1] = plane_bits[3]

    return bytes(tile)


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def build_state(bg_mode: int) -> dict[str, object]:
    state: dict[str, object] = {
        "ppu.bgMode": bg_mode,
        "ppu.mainScreenLayers": 0x10,
        "ppu.oamMode": 6,
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

    for layer_index in range(4):
        state[f"ppu.layers[{layer_index}].tilemapAddress"] = 0
        state[f"ppu.layers[{layer_index}].chrAddress"] = 0
        state[f"ppu.layers[{layer_index}].doubleWidth"] = False
        state[f"ppu.layers[{layer_index}].doubleHeight"] = False
        state[f"ppu.layers[{layer_index}].largeTiles"] = False
        state[f"ppu.layers[{layer_index}].hscroll"] = 0
        state[f"ppu.layers[{layer_index}].vscroll"] = 0

    return state


def build_expected_rgb() -> bytes:
    palette_rgb = {index: quantized_rgb(color) for index, color in PALETTE_RGB.items()}
    backdrop = palette_rgb[0]
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)

    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    for local_y in range(SPRITE_HEIGHT):
        sample_y = (SPRITE_HEIGHT - 1) - local_y
        tile_row = sample_y // 8
        y_pos = SPRITE_Y + local_y

        for local_x in range(SPRITE_WIDTH):
            tile_col = local_x // 8
            x_pos = SPRITE_X + local_x
            color_index = SPRITE_TILE_COLORS[tile_row][tile_col]
            dst = ((y_pos * SCREEN_WIDTH) + x_pos) * 3
            rgb[dst:dst + 3] = bytes(palette_rgb[color_index])

    return bytes(rgb)


def write_fixture(out_dir: Path) -> dict[str, Path]:
    fixture_dir = out_dir / "fixture"
    fixture_dir.mkdir(parents=True, exist_ok=True)

    vram = bytearray(0x10000)
    cgram = bytearray(0x0200)
    oam = bytearray(0x0220)

    for sprite_index in range(128):
        oam[(sprite_index * 4) + 1] = 0xF0

    for tile_row, tile_indices in enumerate(SPRITE_TILE_INDICES):
        for tile_col, tile_index in enumerate(tile_indices):
            tile_bytes = encode_solid_4bpp_tile(SPRITE_TILE_COLORS[tile_row][tile_col])
            start = tile_index * 32
            vram[start:start + len(tile_bytes)] = tile_bytes

    for palette_index, color in PALETTE_RGB.items():
        cgram_index = 128 + palette_index if palette_index else 0
        word = rgb_to_snes_word(color)
        offset = cgram_index * 2
        cgram[offset] = word & 0xFF
        cgram[offset + 1] = (word >> 8) & 0xFF

    oam[0] = SPRITE_X & 0xFF
    oam[1] = SPRITE_Y & 0xFF
    oam[2] = 0x00
    oam[3] = 0xB0

    vram_path = fixture_dir / "vertical_flip_vram.bin"
    cgram_path = fixture_dir / "vertical_flip_cgram.bin"
    oam_path = fixture_dir / "vertical_flip_oam.bin"
    simple_state_path = fixture_dir / "vertical_flip_state_simple.json"
    mode7_state_path = fixture_dir / "vertical_flip_state_mode7.json"
    golden_path = fixture_dir / "vertical_flip_expected.ppm"
    simple_sequence_path = fixture_dir / "vertical_flip_simple_sequence.txt"
    mode7_sequence_path = fixture_dir / "vertical_flip_mode7_sequence.txt"

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    oam_path.write_bytes(oam)
    simple_state_path.write_text(json.dumps(build_state(0), indent=2) + "\n", encoding="utf-8")
    mode7_state_path.write_text(json.dumps(build_state(7), indent=2) + "\n", encoding="utf-8")
    write_ppm(golden_path, SCREEN_WIDTH, SCREEN_HEIGHT, build_expected_rgb())
    simple_sequence_path.write_text(
        "snes_bg 1 vertical_flip_vram.bin vertical_flip_cgram.bin vertical_flip_state_simple.json vertical_flip_oam.bin\n",
        encoding="utf-8",
    )
    mode7_sequence_path.write_text(
        "snes_bg 1 vertical_flip_vram.bin vertical_flip_cgram.bin vertical_flip_state_mode7.json vertical_flip_oam.bin\n",
        encoding="utf-8",
    )

    return {
        "fixture_dir": fixture_dir,
        "vram": vram_path,
        "cgram": cgram_path,
        "oam": oam_path,
        "simple_state": simple_state_path,
        "mode7_state": mode7_state_path,
        "simple_sequence": simple_sequence_path,
        "mode7_sequence": mode7_sequence_path,
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
        raise RuntimeError(
            f"command failed ({result.returncode}): {' '.join(command)}\n{result.stdout}"
        )
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


def run_python_case(
    repo_dir: Path,
    fixture: dict[str, Path],
    renders_dir: Path,
    label: str,
    state_path: Path,
    obj_renderer: str | None = None,
) -> Path:
    output_path = renders_dir / f"{label}.ppm"
    command = [
        sys.executable,
        str(repo_dir / "tools" / "render_mesen_snes_bg.py"),
        str(fixture["vram"]),
        str(fixture["cgram"]),
        str(state_path),
        str(output_path),
        "--oam",
        str(fixture["oam"]),
    ]
    if obj_renderer is not None:
        command.extend(["--obj-renderer", obj_renderer])
    run_command(command, repo_dir)
    return output_path


def run_port_case(
    repo_dir: Path,
    port_binary: Path,
    fixture: dict[str, Path],
    renders_dir: Path,
    label: str,
    sequence_path: Path,
) -> Path:
    dump_prefix = renders_dir / label
    output_path = renders_dir / f"{label}_00000.ppm"
    command = [
        str(port_binary),
        "--sequence",
        str(sequence_path),
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
        out_dir = Path(tempfile.mkdtemp(prefix="td2_obj_vertical_flip_"))
        created_temp_dir = True
    else:
        out_dir = args.out_dir.resolve()
        out_dir.mkdir(parents=True, exist_ok=True)

    try:
        fixture = write_fixture(out_dir)
        renders_dir = out_dir / "renders"
        renders_dir.mkdir(parents=True, exist_ok=True)
        cases: list[tuple[str, Path]] = [
            ("python_simple", run_python_case(repo_dir, fixture, renders_dir, "python_simple", fixture["simple_state"])),
            (
                "python_mode7_ppu",
                run_python_case(
                    repo_dir,
                    fixture,
                    renders_dir,
                    "python_mode7_ppu",
                    fixture["mode7_state"],
                    obj_renderer="mode7-ppu",
                ),
            ),
        ]

        if not args.skip_port:
            port_binary = args.port_binary.resolve()
            if not port_binary.is_file():
                raise FileNotFoundError(f"port binary not found: {port_binary}")
            cases.extend(
                [
                    (
                        "port_simple",
                        run_port_case(repo_dir, port_binary, fixture, renders_dir, "port_simple", fixture["simple_sequence"]),
                    ),
                    (
                        "port_mode7_ppu",
                        run_port_case(repo_dir, port_binary, fixture, renders_dir, "port_mode7_ppu", fixture["mode7_sequence"]),
                    ),
                ]
            )

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

        print(f"PASS obj vertical flip regression: {len(cases)} paths matched {fixture['golden']}")
        print(f"fixture: {fixture['fixture_dir']}")
        return 0
    finally:
        if created_temp_dir and not args.keep_dir:
            shutil.rmtree(out_dir, ignore_errors=True)


if __name__ == "__main__":
    raise SystemExit(main())
