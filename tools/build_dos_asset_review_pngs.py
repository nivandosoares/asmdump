#!/usr/bin/env python3
"""Build visible PNG review boards from DOS preview and probe contracts."""

from __future__ import annotations

import argparse
import html
import json
import math
import struct
import zlib
from pathlib import Path


FONT_5X7 = {
    " ": [0, 0, 0, 0, 0, 0, 0],
    "-": [0, 0, 0, 31, 0, 0, 0],
    ".": [0, 0, 0, 0, 0, 12, 12],
    ":": [0, 12, 12, 0, 12, 12, 0],
    "/": [1, 2, 4, 8, 16, 0, 0],
    "_": [0, 0, 0, 0, 0, 0, 31],
    "0": [14, 17, 19, 21, 25, 17, 14],
    "1": [4, 12, 4, 4, 4, 4, 14],
    "2": [14, 17, 1, 2, 4, 8, 31],
    "3": [30, 1, 1, 14, 1, 1, 30],
    "4": [2, 6, 10, 18, 31, 2, 2],
    "5": [31, 16, 16, 30, 1, 1, 30],
    "6": [14, 16, 16, 30, 17, 17, 14],
    "7": [31, 1, 2, 4, 8, 8, 8],
    "8": [14, 17, 17, 14, 17, 17, 14],
    "9": [14, 17, 17, 15, 1, 1, 14],
    "A": [14, 17, 17, 31, 17, 17, 17],
    "B": [30, 17, 17, 30, 17, 17, 30],
    "C": [14, 17, 16, 16, 16, 17, 14],
    "D": [30, 17, 17, 17, 17, 17, 30],
    "E": [31, 16, 16, 30, 16, 16, 31],
    "F": [31, 16, 16, 30, 16, 16, 16],
    "G": [14, 17, 16, 23, 17, 17, 15],
    "H": [17, 17, 17, 31, 17, 17, 17],
    "I": [14, 4, 4, 4, 4, 4, 14],
    "J": [1, 1, 1, 1, 17, 17, 14],
    "K": [17, 18, 20, 24, 20, 18, 17],
    "L": [16, 16, 16, 16, 16, 16, 31],
    "M": [17, 27, 21, 17, 17, 17, 17],
    "N": [17, 25, 21, 19, 17, 17, 17],
    "O": [14, 17, 17, 17, 17, 17, 14],
    "P": [30, 17, 17, 30, 16, 16, 16],
    "Q": [14, 17, 17, 17, 21, 18, 13],
    "R": [30, 17, 17, 30, 20, 18, 17],
    "S": [15, 16, 16, 14, 1, 1, 30],
    "T": [31, 4, 4, 4, 4, 4, 4],
    "U": [17, 17, 17, 17, 17, 17, 14],
    "V": [17, 17, 17, 17, 17, 10, 4],
    "W": [17, 17, 17, 17, 21, 27, 17],
    "X": [17, 17, 10, 4, 10, 17, 17],
    "Y": [17, 17, 10, 4, 4, 4, 4],
    "Z": [31, 1, 2, 4, 8, 16, 31],
}

PALETTE = {
    "bg": (245, 239, 228),
    "panel": (255, 250, 242),
    "ink": (28, 24, 20),
    "muted": (111, 101, 86),
    "accent": (180, 83, 9),
    "accent_2": (14, 116, 144),
    "accent_3": (127, 29, 29),
    "line": (214, 198, 180),
    "window": (234, 88, 12),
    "face": (14, 165, 233),
    "mixed": (120, 113, 108),
    "verified": (22, 163, 74),
    "probable": (217, 119, 6),
    "single": (8, 145, 178),
    "three": (202, 138, 4),
    "four": (185, 28, 28),
}


def png_chunk(tag: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload)) + tag + payload + struct.pack(">I", zlib.crc32(tag + payload) & 0xFFFFFFFF)


def write_png_from_rgb(dest_path: Path, width: int, height: int, rgb: bytes) -> None:
    rows = []
    stride = width * 3
    for row in range(height):
        start = row * stride
        rows.append(b"\x00" + rgb[start : start + stride])
    payload = zlib.compress(b"".join(rows), level=9)
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    dest_path.write_bytes(b"\x89PNG\r\n\x1a\n" + png_chunk(b"IHDR", ihdr) + png_chunk(b"IDAT", payload) + png_chunk(b"IEND", b""))


class Canvas:
    def __init__(self, width: int, height: int, bg: tuple[int, int, int]) -> None:
        self.width = width
        self.height = height
        self.rgb = bytearray(width * height * 3)
        self.fill_rect(0, 0, width, height, bg)

    def fill_rect(self, x: int, y: int, w: int, h: int, color: tuple[int, int, int]) -> None:
        x0 = max(0, x)
        y0 = max(0, y)
        x1 = min(self.width, x + w)
        y1 = min(self.height, y + h)
        for yy in range(y0, y1):
            row = yy * self.width * 3
            for xx in range(x0, x1):
                offset = row + xx * 3
                self.rgb[offset : offset + 3] = bytes(color)

    def stroke_rect(self, x: int, y: int, w: int, h: int, color: tuple[int, int, int]) -> None:
        self.fill_rect(x, y, w, 1, color)
        self.fill_rect(x, y + h - 1, w, 1, color)
        self.fill_rect(x, y, 1, h, color)
        self.fill_rect(x + w - 1, y, 1, h, color)

    def draw_text(self, x: int, y: int, text: str, color: tuple[int, int, int], scale: int = 1) -> None:
        cursor_x = x
        for ch in text.upper():
            glyph = FONT_5X7.get(ch, FONT_5X7[" "])
            for row, bits in enumerate(glyph):
                for col in range(5):
                    if bits & (1 << (4 - col)):
                        self.fill_rect(cursor_x + col * scale, y + row * scale, scale, scale, color)
            cursor_x += 6 * scale

    def save(self, path: Path) -> None:
        write_png_from_rgb(path, self.width, self.height, bytes(self.rgb))


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def layout_color(token: str) -> tuple[int, int, int]:
    if token.startswith("FAC"):
        return PALETTE["face"]
    if token.startswith("WND"):
        return PALETTE["window"]
    return PALETTE["mixed"]


def probe_class_color(classification: str) -> tuple[int, int, int]:
    return {
        "single_page_stream": PALETTE["single"],
        "three_page_stream": PALETTE["three"],
        "four_page_tail_stream": PALETTE["four"],
    }.get(classification, PALETTE["muted"])


def evidence_color(evidence: str) -> tuple[int, int, int]:
    return PALETTE["verified"] if evidence == "VERIFIED" else PALETTE["probable"]


def draw_token_row(canvas: Canvas, x: int, y: int, width: int, tokens: list[str]) -> None:
    if not tokens:
        return
    gap = 6
    cell_w = max(22, (width - gap * (len(tokens) - 1)) // len(tokens))
    for index, token in enumerate(tokens):
        tx = x + index * (cell_w + gap)
        canvas.fill_rect(tx, y, cell_w, 28, layout_color(token))
        canvas.stroke_rect(tx, y, cell_w, 28, PALETTE["line"])
        canvas.draw_text(tx + 5, y + 10, token, (255, 255, 255), scale=1)


def draw_page_bar(canvas: Canvas, x: int, y: int, width: int, entry: dict[str, object]) -> None:
    page_count = entry["page_count"]
    last_page_bytes = entry["last_page_bytes"]
    total = entry["pes_size"]
    gap = 4
    page_w = (width - gap * max(0, page_count - 1)) // page_count
    color = probe_class_color(entry["classification"])
    for index in range(page_count):
        px = x + index * (page_w + gap)
        segment_h = 26
        if index == page_count - 1:
            full_ratio = last_page_bytes / 4096
            segment_h = max(8, int(26 * full_ratio))
        canvas.fill_rect(px, y + (26 - segment_h), page_w, segment_h, color)
        canvas.stroke_rect(px, y, page_w, 26, PALETTE["line"])
    if entry["tail_boundary"] is not None:
        canvas.draw_text(x, y + 34, f"TAIL {entry['tail_bytes']}B", PALETTE["accent_3"], scale=1)
    else:
        canvas.draw_text(x, y + 34, "NO TAIL", PALETTE["muted"], scale=1)
    canvas.draw_text(x, y + 46, f"PES {total} PCS {entry['pcs_size']}", PALETTE["ink"], scale=1)


def render_car_board(preview: dict[str, object], probe: dict[str, object], out_path: Path) -> None:
    canvas = Canvas(1100, 360, PALETTE["bg"])
    canvas.fill_rect(24, 24, 1052, 312, PALETTE["panel"])
    canvas.stroke_rect(24, 24, 1052, 312, PALETTE["line"])

    title = f"{preview['car_id']} {preview['display_name']}"
    canvas.draw_text(48, 44, title, PALETTE["ink"], scale=2)
    flags = []
    if preview["is_bootstrap_primary"]:
        flags.append("BOOT PRIMARY")
    if preview["is_bootstrap_secondary"]:
        flags.append("BOOT SECONDARY")
    if flags:
        canvas.fill_rect(820, 42, 210, 30, PALETTE["accent"])
        canvas.draw_text(834, 52, " / ".join(flags), (255, 255, 255), scale=1)

    canvas.draw_text(48, 92, f"{probe['classification']} / {probe['evidence']}", evidence_color(probe["evidence"]), scale=2)
    canvas.draw_text(48, 122, f"LAYOUT {preview['layout_pattern']}", PALETTE["accent_2"], scale=1)
    canvas.draw_text(48, 138, f"SS {preview['layout_descriptor']}", PALETTE["muted"], scale=1)
    canvas.draw_text(48, 154, f"PARAMS {preview['layout_params'][0]} {preview['layout_params'][1]}", PALETTE["muted"], scale=1)

    draw_token_row(canvas, 48, 186, 1000, preview["layout_tokens"])

    canvas.draw_text(48, 238, "PACKED GEOMETRY", PALETTE["ink"], scale=1)
    draw_page_bar(canvas, 48, 256, 360, probe)

    canvas.draw_text(470, 238, "SEGMENTS", PALETTE["ink"], scale=1)
    seg_x = 470
    seg_y = 256
    max_len = max(segment["length"] for segment in probe["segments"])
    for segment in probe["segments"]:
        bar_w = max(36, int(220 * (segment["length"] / max_len)))
        canvas.fill_rect(seg_x, seg_y, bar_w, 16, PALETTE["accent_2"])
        canvas.stroke_rect(seg_x, seg_y, bar_w, 16, PALETTE["line"])
        canvas.draw_text(seg_x + 232, seg_y + 4, f"{segment['label']} {segment['length']}B", PALETTE["ink"], scale=1)
        seg_y += 24

    canvas.draw_text(470, 338, "EVIDENCE BACKED BOARD / NOT A DECODED IMAGE", PALETTE["accent_3"], scale=1)
    canvas.save(out_path)


def render_overview(previews: list[dict[str, object]], probes: dict[str, dict[str, object]], out_path: Path) -> None:
    row_h = 72
    canvas = Canvas(1200, 120 + len(previews) * row_h, PALETTE["bg"])
    canvas.fill_rect(24, 24, 1152, 72 + len(previews) * row_h, PALETTE["panel"])
    canvas.stroke_rect(24, 24, 1152, 72 + len(previews) * row_h, PALETTE["line"])
    canvas.draw_text(44, 44, "DOS ASSET REVIEW BOARDS", PALETTE["ink"], scale=2)
    canvas.draw_text(44, 74, "VISIBLE PNG ARTIFACTS FROM CURRENT CONTRACTS", PALETTE["muted"], scale=1)

    y = 118
    for preview in previews:
        probe = probes[preview["car_id"]]
        canvas.draw_text(44, y, preview["car_id"], PALETTE["ink"], scale=2)
        canvas.draw_text(130, y + 8, preview["layout_pattern"], PALETTE["accent_2"], scale=1)
        canvas.draw_text(130, y + 24, probe["classification"], probe_class_color(probe["classification"]), scale=1)
        canvas.draw_text(130, y + 40, f"PES {probe['pes_size']} PCS {probe['pcs_size']}", PALETTE["muted"], scale=1)
        draw_page_bar(canvas, 420, y + 8, 280, probe)
        draw_token_row(canvas, 760, y + 8, 380, preview["layout_tokens"][: min(6, len(preview["layout_tokens"]))])
        y += row_h

    canvas.save(out_path)


def render_html(entries: list[dict[str, object]], overview_png: Path, out_dir: Path) -> str:
    cards = []
    for entry in entries:
        cards.append(
            "<section class='card'>"
            f"<img src='{html.escape(entry['png_name'])}' alt='{html.escape(entry['car_id'])} review board'>"
            f"<h3>{html.escape(entry['car_id'])} {html.escape(entry['display_name'])}</h3>"
            f"<p>{html.escape(entry['layout_pattern'])} / {html.escape(entry['classification'])} / {html.escape(entry['evidence'])}</p>"
            f"<p>PES {entry['pes_size']} / PCS {entry['pcs_size']}</p>"
            "</section>"
        )
    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>DOS Asset Review PNGs</title>
  <style>
    body {{ margin: 0; font-family: Georgia, serif; background: #f5efe4; color: #1c1814; }}
    main {{ max-width: 1280px; margin: 0 auto; padding: 28px; }}
    img {{ max-width: 100%; border: 1px solid #d6c6b4; background: white; }}
    .cards {{ display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 18px; margin-top: 24px; }}
    .card {{ background: #fffaf2; padding: 16px; border: 1px solid #d6c6b4; }}
  </style>
</head>
<body>
  <main>
    <h1>DOS Asset Review PNGs</h1>
    <p>These are evidence-backed design review boards from the current DOS contracts. They show layout tokens, packed-asset geometry, and probe classes. They are not decoded car renders.</p>
    <p><img src="{html.escape(overview_png.name)}" alt="DOS asset overview board"></p>
    <section class="cards">
      {''.join(cards)}
    </section>
  </main>
</body>
</html>
"""


def build_payload(preview_manifest: dict[str, object], probe_contract: dict[str, object], out_dir: Path) -> dict[str, object]:
    previews = preview_manifest["preview_entries"]
    probes = {entry["car_id"]: entry for entry in probe_contract["entries"]}
    board_entries = []
    for preview in previews:
        probe = probes[preview["car_id"]]
        png_name = f"{preview['car_id'].lower()}_review_board.png"
        render_car_board(preview, probe, out_dir / png_name)
        board_entries.append(
            {
                "car_id": preview["car_id"],
                "display_name": preview["display_name"],
                "layout_pattern": preview["layout_pattern"],
                "classification": probe["classification"],
                "evidence": probe["evidence"],
                "pes_size": probe["pes_size"],
                "pcs_size": probe["pcs_size"],
                "png_name": png_name,
            }
        )

    overview_name = "dos_asset_review_overview.png"
    render_overview(previews, probes, out_dir / overview_name)
    html_name = "dos_asset_review_gallery.html"
    (out_dir / html_name).write_text(render_html(board_entries, out_dir / overview_name, out_dir), encoding="utf-8")

    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Visible PNG review boards for DOS preview/materializer assets.",
        "out_dir": str(out_dir),
        "overview_png": overview_name,
        "gallery_html": html_name,
        "boards": board_entries,
        "note": "These PNGs are evidence-backed review boards from current contracts, not decoded DOS preview renders.",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preview-manifest", type=Path, required=True)
    parser.add_argument("--probe-contract", type=Path, required=True)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    args = parser.parse_args()

    payload = build_payload(load_json(args.preview_manifest), load_json(args.probe_contract), args.out_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
