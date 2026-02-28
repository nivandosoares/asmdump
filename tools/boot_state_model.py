#!/usr/bin/env python3

from __future__ import annotations

from decompress_td2_chunk import LOROM_BANK_SIZE, detect_header_size


BOOT_TABLE_BANK = 0x01
BOOT_STATE_COUNT = 26
DEFAULT_SELECTOR_1C78 = 1
DEFAULT_SELECTOR_1C7A = 0

STATE_TABLE_ADDRS = {
    "1cac": 0x8016,
    "1cca": 0x807E,
    "1cfa": 0x80B2,
    "1caa": 0x804A,
    "1ce2": 0x80E8,
    "1ce4": 0x811C,
    "1ce6": 0x8150,
    "1ccc": 0x82C8,
    "1cce": 0x82FC,
    "1cd0": 0x8330,
}


def cpu_to_rom_offset(header_size: int, bank: int, addr: int) -> int:
    if addr < 0x8000 or addr > 0xFFFF:
        raise ValueError(f"invalid CPU address {bank:02X}:{addr:04X}")
    return header_size + (bank * LOROM_BANK_SIZE) + (addr - 0x8000)


def read_u16(rom_bytes: bytes, offset: int) -> int:
    return rom_bytes[offset] | (rom_bytes[offset + 1] << 8)


def read_word(rom_bytes: bytes, bank: int, addr: int) -> int:
    header_size = detect_header_size(len(rom_bytes))
    return read_u16(rom_bytes, cpu_to_rom_offset(header_size, bank, addr))


def clamp_index(index: int, count: int) -> int:
    return min(max(index, 0), count - 1)


def compute_boot_state(
    rom_bytes: bytes,
    state_index: int,
    selector_1c78: int | None = None,
    selector_1c7a: int | None = None,
) -> dict:
    state_index = clamp_index(state_index, BOOT_STATE_COUNT)
    resolved_1c78 = DEFAULT_SELECTOR_1C78 if selector_1c78 is None else selector_1c78
    resolved_1c7a = DEFAULT_SELECTOR_1C7A if selector_1c7a is None else selector_1c7a

    state = {
        "state_index": state_index,
        "selector_1c78": resolved_1c78,
        "selector_1c7a": resolved_1c7a,
    }

    for key, table_addr in STATE_TABLE_ADDRS.items():
        state[key] = read_word(rom_bytes, BOOT_TABLE_BANK, table_addr + (state_index * 2))

    state["1cea"] = read_word(
        rom_bytes,
        BOOT_TABLE_BANK,
        0x8010 + (state["1cca"] * 2),
    )

    transition_variant = 0
    if state["1ce6"] != 0:
        transition_variant = 1
    elif state["1ce2"] != 0:
        transition_variant = 2
        if state["1ce4"] != 0:
            transition_variant = 3

    state["1cae"] = transition_variant << 3
    if state["1cae"] != 0:
        state["1cae"] += 1

    negative_layout = (state["1cea"] & 0x8000) != 0
    compressed_index = 8 if negative_layout else state["1cac"]

    state["negative_layout"] = negative_layout
    state["job_indices"] = {
        "bank9_boot_vram_pages": state["1cca"],
        "bank8_bulk_vram_block": state["1cca"],
        "mixed_page_uploads_to_vram_0000": resolved_1c78,
        "mixed_bulk_uploads_to_vram_3000": resolved_1c78,
        "compressed_bank7_group_a": compressed_index,
        "compressed_bank7_group_b": compressed_index,
    }
    state["job_vram_words"] = {
        "bank9_boot_vram_pages": 0x1000 if negative_layout else 0x0800,
        "bank8_bulk_vram_block": 0x2000,
        "mixed_page_uploads_to_vram_0000": 0x0000,
        "mixed_bulk_uploads_to_vram_3000": 0x3000,
        "compressed_bank7_group_a": 0x1800,
        "compressed_bank7_group_b": 0x5000,
        "optional_overlay_to_vram_4d00": 0x4D00,
        "local_patch_1c78": 0x60B0,
        "local_patch_1c7a": 0x60C0,
        "local_patch_static": 0x60D0,
    }
    state["palette_indices"] = {
        "boot_cgram_00_1f": compressed_index + state["1cae"],
        "boot_cgram_90": 0,
        "boot_cgram_a0": resolved_1c7a,
        "boot_shared_subpalette_b0": state["1ccc"],
        "boot_shared_subpalette_c0": state["1cce"],
        "boot_shared_subpalette_d0": state["1cd0"],
        "boot_cgram_e0": compressed_index,
    }
    state["ppu_setup"] = {
        "BGMODE": 0x21,
        "BG1SC": 0x03 if negative_layout else 0x01,
        "BG2SC": 0x11 if negative_layout else 0x0B,
        "BG3SC": 0x19,
        "BG12NBA": 0x23,
        "BG34NBA": 0x35,
        "TMAIN": 0x17,
        "OBJSEL": 0x03,
    }
    return state
