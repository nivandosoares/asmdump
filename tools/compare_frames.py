#!/usr/bin/env python3

from __future__ import annotations

import argparse
import math
import struct
import sys
import zlib
from pathlib import Path


def paeth_predictor(a: int, b: int, c: int) -> int:
    p = a + b - c
    pa = abs(p - a)
    pb = abs(p - b)
    pc = abs(p - c)
    if pa <= pb and pa <= pc:
        return a
    if pb <= pc:
        return b
    return c


def undo_png_filter(filter_type: int, row: bytes, prev_row: bytes, bpp: int) -> bytes:
    out = bytearray(len(row))

    if filter_type == 0:
        out[:] = row
    elif filter_type == 1:
        for i, value in enumerate(row):
            left = out[i - bpp] if i >= bpp else 0
            out[i] = (value + left) & 0xFF
    elif filter_type == 2:
        for i, value in enumerate(row):
            up = prev_row[i] if prev_row else 0
            out[i] = (value + up) & 0xFF
    elif filter_type == 3:
        for i, value in enumerate(row):
            left = out[i - bpp] if i >= bpp else 0
            up = prev_row[i] if prev_row else 0
            out[i] = (value + ((left + up) // 2)) & 0xFF
    elif filter_type == 4:
        for i, value in enumerate(row):
            left = out[i - bpp] if i >= bpp else 0
            up = prev_row[i] if prev_row else 0
            up_left = prev_row[i - bpp] if prev_row and i >= bpp else 0
            out[i] = (value + paeth_predictor(left, up, up_left)) & 0xFF
    else:
        raise ValueError(f"unsupported PNG filter type: {filter_type}")

    return bytes(out)


def load_png(path: Path) -> tuple[int, int, bytes]:
    data = path.read_bytes()
    signature = b"\x89PNG\r\n\x1a\n"
    if not data.startswith(signature):
        raise ValueError(f"{path} is not a PNG file")

    offset = len(signature)
    width = height = 0
    bit_depth = color_type = interlace = None
    idat_chunks: list[bytes] = []

    while offset < len(data):
        length = struct.unpack(">I", data[offset:offset + 4])[0]
        chunk_type = data[offset + 4:offset + 8]
        chunk_data = data[offset + 8:offset + 8 + length]
        offset += 12 + length

        if chunk_type == b"IHDR":
            width, height, bit_depth, color_type, compression, filter_method, interlace = struct.unpack(
                ">IIBBBBB", chunk_data
            )
            if compression != 0 or filter_method != 0:
                raise ValueError(f"{path} uses unsupported PNG compression/filter settings")
            if bit_depth != 8:
                raise ValueError(f"{path} uses unsupported bit depth {bit_depth}")
            if interlace != 0:
                raise ValueError(f"{path} uses unsupported interlacing")
            if color_type not in (2, 6):
                raise ValueError(f"{path} uses unsupported color type {color_type}")
        elif chunk_type == b"IDAT":
            idat_chunks.append(chunk_data)
        elif chunk_type == b"IEND":
            break

    if width <= 0 or height <= 0:
        raise ValueError(f"{path} is missing IHDR data")

    raw = zlib.decompress(b"".join(idat_chunks))
    bytes_per_pixel = 3 if color_type == 2 else 4
    stride = width * bytes_per_pixel
    expected_size = (stride + 1) * height
    if len(raw) != expected_size:
        raise ValueError(f"{path} has unexpected decompressed size {len(raw)} (expected {expected_size})")

    rgb = bytearray(width * height * 3)
    prev_row = b""

    for y in range(height):
        row_start = y * (stride + 1)
        filter_type = raw[row_start]
        filtered_row = raw[row_start + 1:row_start + 1 + stride]
        row = undo_png_filter(filter_type, filtered_row, prev_row, bytes_per_pixel)
        prev_row = row

        for x in range(width):
            src = x * bytes_per_pixel
            dst = (y * width + x) * 3
            rgb[dst:dst + 3] = row[src:src + 3]

    return width, height, bytes(rgb)


def load_ppm(path: Path) -> tuple[int, int, bytes]:
    data = path.read_bytes()
    if not data.startswith(b"P6"):
        raise ValueError(f"{path} is not a binary PPM (P6)")

    tokens: list[bytes] = []
    i = 0
    while len(tokens) < 4:
        while i < len(data) and chr(data[i]).isspace():
            i += 1
        if i >= len(data):
            break
        if data[i:i + 1] == b"#":
            while i < len(data) and data[i:i + 1] != b"\n":
                i += 1
            continue
        start = i
        while i < len(data) and not chr(data[i]).isspace():
            i += 1
        tokens.append(data[start:i])

    if len(tokens) != 4:
        raise ValueError(f"{path} has an invalid PPM header")

    magic, width_raw, height_raw, max_value_raw = tokens
    width = int(width_raw)
    height = int(height_raw)
    max_value = int(max_value_raw)
    if magic != b"P6" or max_value != 255:
        raise ValueError(f"{path} has unsupported PPM parameters")

    pixel_data_start = i
    while pixel_data_start < len(data) and chr(data[pixel_data_start]).isspace():
        pixel_data_start += 1

    pixels = data[pixel_data_start:]
    expected = width * height * 3
    if len(pixels) != expected:
        raise ValueError(f"{path} has {len(pixels)} bytes of pixel data, expected {expected}")

    return width, height, pixels


def load_image(path: Path) -> tuple[int, int, bytes]:
    suffix = path.suffix.lower()
    if suffix == ".png":
        return load_png(path)
    if suffix == ".ppm":
        return load_ppm(path)
    raise ValueError(f"unsupported image format: {path}")


def write_diff_ppm(path: Path, width: int, height: int, diff_rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(diff_rgb)


def compare_images(expected: bytes, actual: bytes) -> dict[str, float | int | bytes]:
    if len(expected) != len(actual):
        raise ValueError("image buffers differ in size")

    total_abs_diff = 0
    total_sq_diff = 0
    mismatch_pixels = 0
    max_channel_diff = 0
    diff_rgb = bytearray(len(expected))

    for i in range(0, len(expected), 3):
        dr = abs(expected[i + 0] - actual[i + 0])
        dg = abs(expected[i + 1] - actual[i + 1])
        db = abs(expected[i + 2] - actual[i + 2])
        pixel_diff = dr + dg + db

        diff_rgb[i + 0] = dr
        diff_rgb[i + 1] = dg
        diff_rgb[i + 2] = db

        total_abs_diff += pixel_diff
        total_sq_diff += dr * dr + dg * dg + db * db
        max_channel_diff = max(max_channel_diff, dr, dg, db)

        if pixel_diff != 0:
            mismatch_pixels += 1

    channel_count = len(expected)
    pixel_count = len(expected) // 3
    mse = total_sq_diff / channel_count if channel_count else 0.0
    rmse = math.sqrt(mse)
    mean_abs_channel_diff = total_abs_diff / channel_count if channel_count else 0.0

    return {
        "pixel_count": pixel_count,
        "mismatch_pixels": mismatch_pixels,
        "max_channel_diff": max_channel_diff,
        "mean_abs_channel_diff": mean_abs_channel_diff,
        "rmse": rmse,
        "diff_rgb": bytes(diff_rgb),
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Compare two frames and report pixel error metrics.")
    parser.add_argument("expected", type=Path, help="expected image path (.png or .ppm)")
    parser.add_argument("actual", type=Path, help="actual image path (.png or .ppm)")
    parser.add_argument("--diff-out", type=Path, help="optional output PPM diff image path")
    parser.add_argument("--fail-on-diff", action="store_true", help="return exit code 1 if any pixel differs")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    expected_width, expected_height, expected_pixels = load_image(args.expected)
    actual_width, actual_height, actual_pixels = load_image(args.actual)

    if (expected_width, expected_height) != (actual_width, actual_height):
        raise ValueError(
            f"image size mismatch: expected {expected_width}x{expected_height}, "
            f"actual {actual_width}x{actual_height}"
        )

    result = compare_images(expected_pixels, actual_pixels)
    mismatch_ratio = result["mismatch_pixels"] / result["pixel_count"] if result["pixel_count"] else 0.0

    print(f"expected: {args.expected}")
    print(f"actual:   {args.actual}")
    print(f"size:     {expected_width}x{expected_height}")
    print(f"pixels:   {result['pixel_count']}")
    print(f"mismatch: {result['mismatch_pixels']} ({mismatch_ratio:.6%})")
    print(f"max diff: {result['max_channel_diff']}")
    print(f"mean abs: {result['mean_abs_channel_diff']:.6f}")
    print(f"rmse:     {result['rmse']:.6f}")

    if args.diff_out:
        write_diff_ppm(args.diff_out, expected_width, expected_height, result["diff_rgb"])
        print(f"diff:     {args.diff_out}")

    if args.fail_on_diff and result["mismatch_pixels"] > 0:
        return 1
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
