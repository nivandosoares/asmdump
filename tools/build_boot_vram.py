#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from decompress_td2_chunk import (
    LOROM_BANK_SIZE,
    bank_offset,
    decode_26fb,
    decode_42fb,
    detect_header_size,
)


VRAM_SIZE_BYTES = 0x10000
BOOT_PAGE_STRIDE_WORDS = 0x0400


def parse_hex(value: str) -> int:
    return int(value, 0)


def load_rom_window(rom_bytes: bytes, bank: int, addr: int) -> tuple[bytes, int]:
    header_size = detect_header_size(len(rom_bytes))
    start = bank_offset(header_size, bank) + (addr - 0x8000)
    end = bank_offset(header_size, bank) + LOROM_BANK_SIZE
    return rom_bytes[start:end], start


def parse_u16le(data: bytes, offset: int) -> int:
    return data[offset] | (data[offset + 1] << 8)


def read_l0005ac_blob(rom_bytes: bytes, source_bank: int, source_addr: int, compression: dict | None) -> tuple[bytes, dict]:
    window, rom_offset = load_rom_window(rom_bytes, source_bank, source_addr)
    compression_header = compression.get("header") if compression else None

    if compression_header == "42FB":
        blob, decode_summary = decode_42fb(window)
        source_meta = {
            "kind": "42FB",
            "compressed_rom_offset": f"0x{rom_offset:06X}",
            "compressed_bytes_consumed": decode_summary["compressed_bytes_consumed"],
        }
    elif compression_header is None:
        width_words = parse_u16le(window, 0)
        row_count = parse_u16le(window, 2)
        total_size = 6 + (width_words * 2 * row_count)
        blob = window[:total_size]
        source_meta = {
            "kind": "raw",
            "raw_rom_offset": f"0x{rom_offset:06X}",
        }
    else:
        raise ValueError(f"unsupported L0005AC source compression: {compression_header}")

    width_words = parse_u16le(blob, 0)
    row_count = parse_u16le(blob, 2)
    payload_size = width_words * 2 * row_count
    expected_size = 6 + payload_size
    if len(blob) < expected_size:
        raise ValueError(
            f"L0005AC blob {source_bank:02X}:{source_addr:04X} truncated: "
            f"expected {expected_size} bytes, got {len(blob)}"
        )

    source_meta.update({
        "source_bank": source_bank,
        "source_addr": f"0x{source_addr:04X}",
        "width_words": width_words,
        "row_count": row_count,
        "aux_header": f"0x{parse_u16le(blob, 4):04X}",
        "payload_size": payload_size,
    })
    return blob[:expected_size], source_meta


def read_l0006c9_blob(rom_bytes: bytes, source_bank: int, source_addr: int, compression: dict | None) -> tuple[bytes, dict]:
    window, rom_offset = load_rom_window(rom_bytes, source_bank, source_addr)
    compression_header = compression.get("header") if compression else None

    if compression_header == "26FB":
        blob, decode_summary = decode_26fb(window)
        source_meta = {
            "kind": "26FB",
            "compressed_rom_offset": f"0x{rom_offset:06X}",
            "compressed_bytes_consumed": decode_summary["compressed_bytes_consumed"],
        }
    elif compression_header is None:
        blob = window
        source_meta = {
            "kind": "raw",
            "raw_rom_offset": f"0x{rom_offset:06X}",
        }
    else:
        raise ValueError(f"unsupported L0006C9 source compression: {compression_header}")

    source_meta.update({
        "source_bank": source_bank,
        "source_addr": f"0x{source_addr:04X}",
        "payload_size": len(blob),
    })
    return blob, source_meta


def apply_l0005ac_blob(vram: bytearray, blob: bytes, vram_word_addr: int, page_stride_words: int) -> dict:
    width_words = parse_u16le(blob, 0)
    row_count = parse_u16le(blob, 2)
    row_bytes = width_words * 2
    src = memoryview(blob[6:])
    src_offset = 0
    current_word = vram_word_addr
    rows_in_page = 0

    for _ in range(row_count):
        column_words = current_word & 0x1F
        first_part_words = min(width_words, 0x20 - column_words)
        first_part_bytes = first_part_words * 2
        first_dest = current_word * 2
        vram[first_dest:first_dest + first_part_bytes] = src[src_offset:src_offset + first_part_bytes]
        src_offset += first_part_bytes

        remaining_words = width_words - first_part_words
        if remaining_words > 0:
            second_dest_word = (current_word + page_stride_words) & 0xFFE0
            second_dest = second_dest_word * 2
            second_part_bytes = remaining_words * 2
            vram[second_dest:second_dest + second_part_bytes] = src[src_offset:src_offset + second_part_bytes]
            src_offset += second_part_bytes

        current_word += 0x20
        rows_in_page += 1
        if rows_in_page == 0x20:
            current_word += page_stride_words
            rows_in_page = 0

    return {
        "helper": "L0005AC",
        "vram_word_addr": f"0x{vram_word_addr:04X}",
        "width_words": width_words,
        "row_count": row_count,
        "row_bytes": row_bytes,
        "page_stride_words": f"0x{page_stride_words:04X}",
        "payload_size": row_count * row_bytes,
    }


def apply_l0006c9_bytes(vram: bytearray, source: bytes, vram_word_addr: int, length_bytes: int) -> dict:
    dest = vram_word_addr * 2
    vram[dest:dest + length_bytes] = source[:length_bytes]
    return {
        "helper": "L0006C9",
        "vram_word_addr": f"0x{vram_word_addr:04X}",
        "length_bytes": length_bytes,
    }


def select_entry(entries: list[dict], variant: int) -> tuple[int, dict]:
    index = min(max(variant, 0), len(entries) - 1)
    return index, entries[index]


def build_boot_vram(
    rom_bytes: bytes,
    manifest: dict,
    variant: int,
    apply_optional_overlay: bool,
    selector_1c78: int | None,
    selector_1c7a: int | None,
) -> tuple[bytes, dict]:
    vram = bytearray(VRAM_SIZE_BYTES)
    summary = {
        "variant": variant,
        "apply_optional_overlay": apply_optional_overlay,
        "selector_1c78": selector_1c78,
        "selector_1c7a": selector_1c7a,
        "page_stride_words": f"0x{BOOT_PAGE_STRIDE_WORDS:04X}",
        "applied_jobs": [],
        "skipped_jobs": [],
    }

    for job in manifest["jobs"]:
        name = job["name"]
        if name == "bank9_boot_vram_pages":
            entry_index, entry = select_entry(job["entries"], variant)
            vram_base_variants = job["vram_base_variants"]
            vram_base = parse_hex(vram_base_variants[0])
            blob, source_meta = read_l0005ac_blob(
                rom_bytes,
                entry["source_bank"],
                parse_hex(entry["source_addr"]),
                entry.get("compression"),
            )
            apply_meta = apply_l0005ac_blob(vram, blob, vram_base, BOOT_PAGE_STRIDE_WORDS)
            summary["applied_jobs"].append({
                "job": name,
                "selected_entry_index": entry_index,
                "selected_vram_base_variant": vram_base_variants[0],
                "source": source_meta,
                "apply": apply_meta,
            })
        elif name == "mixed_page_uploads_to_vram_0000":
            entry_index, entry = select_entry(job["entries"], variant)
            blob, source_meta = read_l0005ac_blob(
                rom_bytes,
                entry["source_bank"],
                parse_hex(entry["source_addr"]),
                entry.get("compression"),
            )
            apply_meta = apply_l0005ac_blob(vram, blob, parse_hex(job["vram_base"]), BOOT_PAGE_STRIDE_WORDS)
            summary["applied_jobs"].append({
                "job": name,
                "selected_entry_index": entry_index,
                "source": source_meta,
                "apply": apply_meta,
            })
        elif name == "compressed_bank7_group_a":
            entry_index, entry = select_entry(job["entries"], variant)
            blob, source_meta = read_l0005ac_blob(
                rom_bytes,
                entry["source_bank"],
                parse_hex(entry["source_addr"]),
                entry.get("compression"),
            )
            apply_meta = apply_l0005ac_blob(vram, blob, parse_hex(job["vram_base"]), BOOT_PAGE_STRIDE_WORDS)
            summary["applied_jobs"].append({
                "job": name,
                "selected_entry_index": entry_index,
                "source": source_meta,
                "apply": apply_meta,
            })
        elif name in ("bank8_bulk_vram_block", "mixed_bulk_uploads_to_vram_3000"):
            entry_index, entry = select_entry(job["entries"], variant)
            source_window, rom_offset = load_rom_window(
                rom_bytes,
                entry["source_bank"],
                parse_hex(entry["source_addr"]),
            )
            length_bytes = parse_hex(job["length_bytes"])
            apply_meta = apply_l0006c9_bytes(
                vram,
                source_window,
                parse_hex(job["vram_dest"]),
                length_bytes,
            )
            summary["applied_jobs"].append({
                "job": name,
                "selected_entry_index": entry_index,
                "source": {
                    "kind": "raw",
                    "source_bank": entry["source_bank"],
                    "source_addr": entry["source_addr"],
                    "raw_rom_offset": f"0x{rom_offset:06X}",
                },
                "apply": apply_meta,
            })
        elif name == "compressed_bank7_group_b":
            entry_index, entry = select_entry(job["entries"], variant)
            source_blob, source_meta = read_l0006c9_blob(
                rom_bytes,
                entry["source_bank"],
                parse_hex(entry["source_addr"]),
                entry.get("compression"),
            )
            apply_meta = apply_l0006c9_bytes(
                vram,
                source_blob,
                parse_hex(job["vram_dest"]),
                len(source_blob),
            )
            summary["applied_jobs"].append({
                "job": name,
                "selected_entry_index": entry_index,
                "source": source_meta,
                "apply": apply_meta,
            })
        elif name == "optional_overlay_to_vram_4d00":
            if not apply_optional_overlay:
                summary["skipped_jobs"].append({
                    "job": name,
                    "reason": "conditioned on $1CE6 and not enabled for this snapshot",
                })
                continue

            source = job["source"]
            source_blob, source_meta = read_l0006c9_blob(
                rom_bytes,
                source["bank"],
                parse_hex(source["addr"]),
                source.get("compression"),
            )
            apply_meta = apply_l0006c9_bytes(
                vram,
                source_blob,
                parse_hex(job["vram_dest"]),
                len(source_blob),
            )
            summary["applied_jobs"].append({
                "job": name,
                "source": source_meta,
                "apply": apply_meta,
            })
        elif name == "local_bank1_tilemap_patches":
            applied_patches = []
            for patch in job["patches"]:
                source_bank = patch["source"]["source_bank"]
                source_addr = parse_hex(patch["source"]["source_addr"])
                source_window, rom_offset = load_rom_window(rom_bytes, source_bank, source_addr)
                source_offset = 0
                applied_selector = None

                selector_name = patch.get("selector")
                if selector_name == "$1C78":
                    applied_selector = selector_1c78
                elif selector_name == "$1C7A":
                    applied_selector = selector_1c7a

                if applied_selector is None:
                    applied_selector = patch.get("default_value")

                if applied_selector is not None:
                    source_offset = applied_selector * parse_hex(patch["source_stride"])

                source_slice = source_window[source_offset:]
                apply_meta = apply_l0006c9_bytes(
                    vram,
                    source_slice,
                    parse_hex(patch["vram_dest"]),
                    parse_hex(patch["length_bytes"]),
                )
                applied_patches.append({
                    "selector": selector_name,
                    "applied_selector_value": applied_selector,
                    "source": {
                        "kind": "raw",
                        "source_bank": source_bank,
                        "source_addr": patch["source"]["source_addr"],
                        "raw_rom_offset": f"0x{rom_offset + source_offset:06X}",
                        "source_offset": f"0x{source_offset:04X}",
                    },
                    "apply": apply_meta,
                })

            summary["applied_jobs"].append({
                "job": name,
                "patches": applied_patches,
            })
        else:
            summary["skipped_jobs"].append({
                "job": name,
                "reason": "unsupported manifest job",
            })

    return bytes(vram), summary


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build a partial boot/title VRAM snapshot from the bank1 boot-screen manifest."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("manifest", type=Path, help="boot screen manifest JSON")
    parser.add_argument("output", type=Path, help="output VRAM binary path")
    parser.add_argument("--variant", type=int, default=0, help="entry index to select from manifest tables")
    parser.add_argument(
        "--apply-optional-overlay",
        action="store_true",
        help="apply the manifest's optional overlay job as if $1CE6 != 0",
    )
    parser.add_argument(
        "--selector-1c78",
        type=int,
        default=None,
        help="override selector value for the local bank1 patch that keys off $1C78",
    )
    parser.add_argument(
        "--selector-1c7a",
        type=int,
        default=None,
        help="override selector value for the local bank1 patch that keys off $1C7A",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON summary path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    manifest = json.loads(args.manifest.read_text(encoding="utf-8"))
    vram_bytes, summary = build_boot_vram(
        rom_bytes,
        manifest,
        args.variant,
        apply_optional_overlay=args.apply_optional_overlay,
        selector_1c78=args.selector_1c78,
        selector_1c7a=args.selector_1c7a,
    )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(vram_bytes)

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(
        f"built partial boot VRAM variant {args.variant} -> {args.output} "
        f"({len(summary['applied_jobs'])} jobs applied, {len(summary['skipped_jobs'])} skipped)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
