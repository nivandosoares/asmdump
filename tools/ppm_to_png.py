#!/usr/bin/env python3
"""Converte imagens PPM (P6/P3) para PNG sem dependências externas."""

from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path


PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"


def _read_token(data: bytes, start: int) -> tuple[bytes, int]:
    i = start
    n = len(data)
    while i < n and data[i] in b" \t\r\n":
        i += 1
    if i < n and data[i] == ord("#"):
        while i < n and data[i] != ord("\n"):
            i += 1
        return _read_token(data, i)

    j = i
    while j < n and data[j] not in b" \t\r\n#":
        j += 1
    return data[i:j], j


def read_ppm(path: Path) -> tuple[int, int, bytes]:
    data = path.read_bytes()
    magic, i = _read_token(data, 0)
    if magic not in (b"P6", b"P3"):
        raise ValueError(f"Formato PPM não suportado: {magic!r}")

    w_token, i = _read_token(data, i)
    h_token, i = _read_token(data, i)
    m_token, i = _read_token(data, i)
    width = int(w_token)
    height = int(h_token)
    maxval = int(m_token)

    if maxval != 255:
        raise ValueError("Apenas PPM com maxval=255 é suportado")

    if magic == b"P6":
        # P6 exige exatamente um separador após maxval;
        # não podemos consumir "todos" whitespaces porque 0x20/0x0A podem ser pixels válidos.
        if i >= len(data):
            raise ValueError("Header P6 incompleto")
        if data[i] not in b" \t\r\n":
            raise ValueError("Separador inválido após maxval no P6")
        i += 1
        rgb = data[i : i + width * height * 3]
        if len(rgb) != width * height * 3:
            raise ValueError("Dados P6 incompletos")
        return width, height, rgb

    values: list[int] = []
    while len(values) < width * height * 3:
        token, i = _read_token(data, i)
        if not token:
            break
        values.append(int(token))
    if len(values) != width * height * 3:
        raise ValueError("Dados P3 incompletos")
    return width, height, bytes(values)


def _png_chunk(chunk_type: bytes, payload: bytes) -> bytes:
    body = chunk_type + payload
    crc = zlib.crc32(body) & 0xFFFFFFFF
    return struct.pack(">I", len(payload)) + body + struct.pack(">I", crc)


def write_png(path: Path, width: int, height: int, rgb: bytes) -> None:
    rows = bytearray()
    stride = width * 3
    for y in range(height):
        rows.append(0)
        start = y * stride
        rows.extend(rgb[start : start + stride])

    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    idat = zlib.compress(bytes(rows), level=9)

    png = bytearray(PNG_SIGNATURE)
    png.extend(_png_chunk(b"IHDR", ihdr))
    png.extend(_png_chunk(b"IDAT", idat))
    png.extend(_png_chunk(b"IEND", b""))
    path.write_bytes(bytes(png))


def convert_file(ppm_path: Path, output: Path | None = None) -> Path:
    target = output or ppm_path.with_suffix(".png")
    width, height, rgb = read_ppm(ppm_path)
    target.parent.mkdir(parents=True, exist_ok=True)
    write_png(target, width, height, rgb)
    return target


def main() -> None:
    parser = argparse.ArgumentParser(description="Converte PPM para PNG")
    parser.add_argument("input", help="Arquivo .ppm de entrada")
    parser.add_argument("--output", help="Arquivo .png de saída (opcional)")
    args = parser.parse_args()

    ppm_path = Path(args.input)
    output = Path(args.output) if args.output else None
    png_path = convert_file(ppm_path, output)
    print(f"✅ PNG gerado: {png_path}")


if __name__ == "__main__":
    main()
