"""SNES-specific formats and decoders."""

from __future__ import annotations

from typing import Iterable


def decode_bgr555(byte1: int, byte2: int) -> tuple[int, int, int]:
    """Decode SNES BGR555 pair into 24-bit RGB tuple."""
    word = byte1 | (byte2 << 8)
    r = (word & 0x1F) << 3
    g = ((word >> 5) & 0x1F) << 3
    b = ((word >> 10) & 0x1F) << 3
    return (r, g, b)


def decode_4bpp_tile(tile_data: bytes) -> list[list[int]]:
    """Decode one 8x8 SNES 4bpp planar tile into palette indices."""
    if len(tile_data) != 32:
        raise ValueError("4bpp tile must be 32 bytes")

    pixels = [[0 for _ in range(8)] for _ in range(8)]
    for y in range(8):
        p0 = tile_data[y * 2]
        p1 = tile_data[y * 2 + 1]
        p2 = tile_data[16 + y * 2]
        p3 = tile_data[16 + y * 2 + 1]
        for x in range(8):
            shift = 7 - x
            idx = (
                ((p0 >> shift) & 1)
                | (((p1 >> shift) & 1) << 1)
                | (((p2 >> shift) & 1) << 2)
                | (((p3 >> shift) & 1) << 3)
            )
            pixels[y][x] = idx
    return pixels


def decode_2bpp_tile(tile_data: bytes) -> list[list[int]]:
    """Decode one 8x8 SNES 2bpp planar tile into palette indices."""
    if len(tile_data) != 16:
        raise ValueError("2bpp tile must be 16 bytes")

    pixels = [[0 for _ in range(8)] for _ in range(8)]
    for y in range(8):
        p0 = tile_data[y * 2]
        p1 = tile_data[y * 2 + 1]
        for x in range(8):
            shift = 7 - x
            idx = ((p0 >> shift) & 1) | (((p1 >> shift) & 1) << 1)
            pixels[y][x] = idx
    return pixels


def encode_rgb_rows(rows: Iterable[Iterable[tuple[int, int, int]]]) -> bytes:
    """Encode a RGB matrix to binary PPM payload for quick previews."""
    flat = []
    for row in rows:
        for r, g, b in row:
            flat.extend((r, g, b))
    return bytes(flat)
