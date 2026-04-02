#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

from build_bank1_helper_scene import (
    L00A9A0_ADDR_TABLE,
    L00A9A0_BANK_TABLE,
    L00A9A0_VRAM_BASE_TABLE,
    L00A9CB_ADDR_TABLE,
    L00A9CB_BANK_TABLE,
    L00A9CB_VRAM_DEST_TABLE,
    detect_compression,
    load_u8,
    load_u16,
)
from build_boot_vram import load_rom_window, read_l0005ac_blob, read_l0006c9_blob


DEFAULT_INDICES = "9,10,11"
DEFAULT_NEEDLES = "CARBMP,CARBMP.sol,Porsche,Lamborghini,Diablo,Ferrari,F40,959,P959_8K"
DEFAULT_STRIDES = (1, 2, 3)


def parse_indices(raw: str) -> list[int]:
    return [int(token, 0) for token in raw.split(",") if token.strip()]


def parse_needles(raw: str) -> list[str]:
    seen: set[str] = set()
    needles: list[str] = []
    for token in raw.split(","):
        needle = token.strip()
        if not needle:
            continue
        lowered = needle.lower()
        if lowered in seen:
            continue
        seen.add(lowered)
        needles.append(needle)
    return needles


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Audit the front-end car helper sources for embedded ASCII or fixed-stride text."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument(
        "--indices",
        default=DEFAULT_INDICES,
        help=f"comma-separated helper indices (default: {DEFAULT_INDICES})",
    )
    parser.add_argument(
        "--needles",
        default=DEFAULT_NEEDLES,
        help=f"comma-separated ASCII needles to search (default: {DEFAULT_NEEDLES})",
    )
    parser.add_argument(
        "--min-run-length",
        type=int,
        default=5,
        help="minimum length for contiguous ASCII runs (default: 5)",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=None,
        help="optional JSON output path",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=None,
        help="optional Markdown output path",
    )
    return parser.parse_args()


def snes_addr(bank: int, addr: int) -> str:
    return f"{bank:02X}:{addr:04X}"


def ascii_runs(data: bytes, min_run_length: int) -> list[dict[str, object]]:
    runs: list[dict[str, object]] = []
    pattern = re.compile(rb"[ -~]{" + str(min_run_length).encode("ascii") + rb",}")
    for match in pattern.finditer(data):
        runs.append(
            {
                "offset": match.start(),
                "length": len(match.group()),
                "text": match.group().decode("ascii"),
            }
        )
    return runs


def find_needle_hits(data: bytes, needles: list[str], strides: tuple[int, ...]) -> list[dict[str, object]]:
    hits: list[dict[str, object]] = []
    for stride in strides:
        for phase in range(stride):
            lane = data[phase::stride]
            lowered_lane = bytes(byte | 0x20 if 0x41 <= byte <= 0x5A else byte for byte in lane)
            for needle in needles:
                lowered = needle.lower().encode("ascii")
                start = 0
                while True:
                    index = lowered_lane.find(lowered, start)
                    if index < 0:
                        break
                    hits.append(
                        {
                            "needle": needle,
                            "stride": stride,
                            "phase": phase,
                            "lane_offset": index,
                            "data_offset": phase + (index * stride),
                            "context": lane[index : index + len(lowered) + 24].decode("ascii", errors="replace"),
                        }
                    )
                    start = index + 1
    return hits


def trim_runs(runs: list[dict[str, object]], limit: int = 8) -> list[dict[str, object]]:
    return runs[:limit]


def source_window_slice(window: bytes, blob: bytes, compression: dict | None, source_meta: dict[str, object]) -> bytes:
    if compression is None:
        return window[: len(blob)]
    consumed = int(source_meta["compressed_bytes_consumed"])
    return window[:consumed]


def audit_surface(
    rom_bytes: bytes,
    bank: int,
    addr: int,
    compression: dict | None,
    blob_reader,
    *,
    min_run_length: int,
    needles: list[str],
) -> dict[str, object]:
    window, file_offset = load_rom_window(rom_bytes, bank, addr)
    blob, source_meta = blob_reader(rom_bytes, bank, addr, compression)
    source_slice = source_window_slice(window, blob, compression, source_meta)
    source_runs = ascii_runs(source_slice, min_run_length)
    decoded_runs = ascii_runs(blob, min_run_length)
    return {
        "source_bank": bank,
        "source_addr": f"0x{addr:04X}",
        "source_snes": snes_addr(bank, addr),
        "source_file_offset": f"0x{file_offset:06X}",
        "compression": compression["header"] if compression else "raw",
        "source_meta": source_meta,
        "source_ascii_runs": trim_runs(source_runs),
        "decoded_ascii_runs": trim_runs(decoded_runs),
        "source_needle_hits": find_needle_hits(source_slice, needles, DEFAULT_STRIDES),
        "decoded_needle_hits": find_needle_hits(blob, needles, DEFAULT_STRIDES),
    }


def render_markdown(report: dict[str, object]) -> str:
    lines: list[str] = []
    lines.append("# Front-End Car Helper ASCII Audit")
    lines.append("")
    lines.append(f"- ROM: `{report['rom']}`")
    lines.append(f"- Helper indices: `{', '.join(str(index) for index in report['indices'])}`")
    lines.append(f"- Needles: `{', '.join(report['needles'])}`")
    lines.append(f"- Minimum ASCII run length: `{report['min_run_length']}`")
    lines.append("")
    lines.append("## Summary")
    lines.append("")
    for helper in report["helpers"]:
        lines.append(f"### Helper `{helper['index']}` (`$0202 = {helper['selector_value']}`)")
        lines.append("")
        for label in ("l00a9a0", "l00a9cb"):
            surface = helper[label]
            lines.append(f"- `{label.upper()}` source: `{surface['source_snes']}` file `{surface['source_file_offset']}` compression `{surface['compression']}`")
            lines.append(f"- Source meta: `{json.dumps(surface['source_meta'], sort_keys=True)}`")
            lines.append(f"- Source ASCII runs: `{len(surface['source_ascii_runs'])}`")
            lines.append(f"- Decoded ASCII runs: `{len(surface['decoded_ascii_runs'])}`")
            lines.append(f"- Source needle hits: `{len(surface['source_needle_hits'])}`")
            lines.append(f"- Decoded needle hits: `{len(surface['decoded_needle_hits'])}`")
            if surface["source_ascii_runs"]:
                lines.append("- Sample source runs:")
                for run in surface["source_ascii_runs"]:
                    lines.append(
                        f"  - offset `0x{run['offset']:X}` len `{run['length']}` -> `{run['text']}`"
                    )
            if surface["decoded_ascii_runs"]:
                lines.append("- Sample decoded runs:")
                for run in surface["decoded_ascii_runs"]:
                    lines.append(
                        f"  - offset `0x{run['offset']:X}` len `{run['length']}` -> `{run['text']}`"
                    )
            if surface["source_needle_hits"]:
                lines.append("- Source needle hits:")
                for hit in surface["source_needle_hits"]:
                    lines.append(
                        f"  - `{hit['needle']}` stride `{hit['stride']}` phase `{hit['phase']}` data `0x{hit['data_offset']:X}` context `{hit['context']}`"
                    )
            if surface["decoded_needle_hits"]:
                lines.append("- Decoded needle hits:")
                for hit in surface["decoded_needle_hits"]:
                    lines.append(
                        f"  - `{hit['needle']}` stride `{hit['stride']}` phase `{hit['phase']}` data `0x{hit['data_offset']:X}` context `{hit['context']}`"
                    )
            lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def main() -> int:
    args = parse_args()
    indices = parse_indices(args.indices)
    needles = parse_needles(args.needles)
    rom_bytes = args.rom.read_bytes()

    helpers: list[dict[str, object]] = []
    for index in indices:
        a0_addr = load_u16(rom_bytes, 0x01, L00A9A0_ADDR_TABLE + (index * 2))
        a0_bank = load_u8(rom_bytes, 0x01, L00A9A0_BANK_TABLE + index)
        a0_vram = load_u16(rom_bytes, 0x01, L00A9A0_VRAM_BASE_TABLE + (index * 2))
        a0_comp = detect_compression(rom_bytes, a0_bank, a0_addr)

        cb_addr = load_u16(rom_bytes, 0x01, L00A9CB_ADDR_TABLE + (index * 2))
        cb_bank = load_u8(rom_bytes, 0x01, L00A9CB_BANK_TABLE + index)
        cb_vram = load_u16(rom_bytes, 0x01, L00A9CB_VRAM_DEST_TABLE + (index * 2))
        cb_comp = detect_compression(rom_bytes, cb_bank, cb_addr)

        helper = {
            "index": index,
            "selector_value": index - 9,
            "l00a9a0_vram_base": f"0x{a0_vram:04X}",
            "l00a9cb_vram_dest": f"0x{cb_vram:04X}",
            "l00a9a0": audit_surface(
                rom_bytes,
                a0_bank,
                a0_addr,
                a0_comp,
                read_l0005ac_blob,
                min_run_length=args.min_run_length,
                needles=needles,
            ),
            "l00a9cb": audit_surface(
                rom_bytes,
                cb_bank,
                cb_addr,
                cb_comp,
                lambda rom, bank, addr, comp: read_l0006c9_blob(
                    rom,
                    bank,
                    addr,
                    comp,
                    allow_partial_26fb=True,
                ),
                min_run_length=args.min_run_length,
                needles=needles,
            ),
        }
        helpers.append(helper)

    report = {
        "rom": str(args.rom),
        "indices": indices,
        "needles": needles,
        "min_run_length": args.min_run_length,
        "helpers": helpers,
    }

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(report, indent=2), encoding="utf-8")

    markdown = render_markdown(report)
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(markdown, encoding="utf-8")

    print(markdown, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
