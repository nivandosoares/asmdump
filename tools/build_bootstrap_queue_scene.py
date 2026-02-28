#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_bank1_helper_scene import cgram_to_rgb
from build_boot_vram import load_rom_window
from render_mesen_snes_bg import (
    MODE7_SPRITE_PRIORITIES,
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    render_mode7_layer,
    render_objects,
    write_ppm,
)


VRAM_SIZE_BYTES = 0x10000
CGRAM_SIZE_BYTES = 0x0200
WRAM_MIN_BYTES = 0x0920
OAM_WRAM_OFFSET = 0x0700
OAM_SIZE_BYTES = 0x0220


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a queue-driven bootstrap scene by applying the active 0600 DMA descriptors "
            "from a bootstrap queue summary JSON onto a seed VRAM image."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("queue_json", type=Path, help="queue analysis JSON from analyze_bootstrap_queue.py")
    parser.add_argument("output_prefix", type=Path, help="output prefix for scene assets")
    parser.add_argument("--seed-vram", type=Path, required=True, help="seed VRAM image (typically frame 958)")
    parser.add_argument("--cgram", type=Path, required=True, help="CGRAM image to pair with the queue-driven VRAM")
    parser.add_argument("--ppu-state", type=Path, required=True, help="PPU-state template used for rendering/runtime")
    parser.add_argument(
        "--wram",
        type=Path,
        help="optional WRAM dump; if supplied, 0700..091F is copied out as OAM staging data",
    )
    parser.add_argument(
        "--render-objects",
        action="store_true",
        help="render OBJ on top of the queue-driven Mode 7 background when WRAM is supplied",
    )
    return parser.parse_args()


def load_binary(path: Path, expected_size: int | None = None, minimum_size: int | None = None) -> bytes:
    data = path.read_bytes()
    if expected_size is not None and len(data) != expected_size:
        raise ValueError(f"expected {expected_size} bytes in {path}, got {len(data)}")
    if minimum_size is not None and len(data) < minimum_size:
        raise ValueError(f"expected at least {minimum_size} bytes in {path}, got {len(data)}")
    return data


def apply_dma_descriptor(vram: bytearray, rom_bytes: bytes, entry: dict[str, object]) -> dict[str, object]:
    command = int(entry["command"])
    if command != 0x01:
        raise ValueError(f"unsupported bootstrap DMA command 0x{command:02X}; expected mode-1 VMDATA DMA")

    source_addr = int(entry["source_addr"])
    source_bank = (source_addr >> 16) & 0xFF
    source_cpu_addr = source_addr & 0xFFFF
    transfer_size = int(entry["transfer_size"])
    vram_dest_word = int(entry["vram_dest"])

    window, rom_offset = load_rom_window(rom_bytes, source_bank, source_cpu_addr)
    blob = window[:transfer_size]
    if len(blob) != transfer_size:
        raise ValueError(
            f"descriptor source {source_bank:02X}:{source_cpu_addr:04X} truncated: "
            f"expected {transfer_size} bytes, got {len(blob)}"
        )

    # The queue stores VMDATA destinations as VRAM word addresses.
    dest_byte_offset = vram_dest_word * 2
    end = min(dest_byte_offset + transfer_size, len(vram))
    vram[dest_byte_offset:end] = blob[: end - dest_byte_offset]

    return {
        "command": f"0x{command:02X}",
        "source_bank": source_bank,
        "source_addr": f"0x{source_cpu_addr:04X}",
        "rom_offset": f"0x{rom_offset:06X}",
        "transfer_size": transfer_size,
        "vram_dest_word": f"0x{vram_dest_word:04X}",
        "vram_dest_byte_offset": f"0x{dest_byte_offset:04X}",
    }


def build_scene(
    rom_bytes: bytes,
    queue_summary: dict[str, object],
    seed_vram: bytes,
    cgram: bytes,
    ppu_state: dict[str, object],
    wram: bytes | None,
    render_objects_enabled: bool,
) -> tuple[bytes, bytes | None, bytes, dict[str, object]]:
    vram = bytearray(seed_vram)
    queue_region = queue_summary["regions"]["0600_dma_queue"]
    active_entries = queue_region.get("active_after_entries") or queue_region.get("after_entries") or []
    if not active_entries:
        raise ValueError("queue summary does not contain any active bootstrap DMA entries")

    jobs = [apply_dma_descriptor(vram, rom_bytes, entry) for entry in active_entries]

    oam = None
    if wram is not None:
        oam = bytes(wram[OAM_WRAM_OFFSET:OAM_WRAM_OFFSET + OAM_SIZE_BYTES])

    cgram_rgb = cgram_to_rgb(cgram)
    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram_rgb[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    if int(ppu_state.get("ppu.bgMode", 0)) != 0x07:
        raise ValueError("queue bootstrap renderer currently expects a Mode 7 PPU state template")

    mode7_summary = render_mode7_layer(rgb, bytes(vram), cgram_rgb, ppu_state)
    obj_summary = None
    if render_objects_enabled and oam is not None and (int(ppu_state.get("ppu.mainScreenLayers", 0)) & 0x10) != 0:
        obj_summary = render_objects(
            rgb,
            bytes(vram),
            oam,
            cgram_rgb,
            ppu_state,
            priority_groups=set(MODE7_SPRITE_PRIORITIES),
        )

    summary = {
        "scene": "bank1_bootstrap_queue_scene",
        "notes": [
            "Queue-driven bootstrap scene reconstructed from a seed VRAM image plus active 0600 DMA descriptors.",
            "0700..091F is optionally copied from WRAM as staged OAM data.",
        ],
        "probe_before": queue_summary.get("probe_before"),
        "probe_after": queue_summary.get("probe_after"),
        "active_dma_descriptor_count": queue_region.get("active_dma_descriptor_count_after"),
        "jobs": jobs,
        "oam_from_wram": wram is not None,
        "render": {
            "mode7": mode7_summary,
            "objects": obj_summary,
        },
    }
    return bytes(vram), oam, bytes(rgb), summary


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    queue_summary = json.loads(args.queue_json.read_text(encoding="utf-8"))
    seed_vram = load_binary(args.seed_vram, expected_size=VRAM_SIZE_BYTES)
    cgram = load_binary(args.cgram, expected_size=CGRAM_SIZE_BYTES)
    ppu_state = json.loads(args.ppu_state.read_text(encoding="utf-8"))
    wram = load_binary(args.wram, minimum_size=WRAM_MIN_BYTES) if args.wram is not None else None

    vram, oam, rgb, summary = build_scene(
        rom_bytes,
        queue_summary,
        seed_vram,
        cgram,
        ppu_state,
        wram,
        args.render_objects,
    )

    prefix = args.output_prefix
    prefix.parent.mkdir(parents=True, exist_ok=True)

    vram_path = prefix.with_name(prefix.name + "_vram.bin")
    cgram_path = prefix.with_name(prefix.name + "_cgram.bin")
    ppu_path = prefix.with_name(prefix.name + "_ppu_state.json")
    oam_path = prefix.with_name(prefix.name + "_oam.bin")
    ppm_path = prefix.with_suffix(".ppm")
    json_path = prefix.with_suffix(".json")

    vram_path.write_bytes(vram)
    cgram_path.write_bytes(cgram)
    ppu_path.write_text(json.dumps(ppu_state, indent=2), encoding="utf-8")
    if oam is not None:
        oam_path.write_bytes(oam)
    write_ppm(ppm_path, SCREEN_WIDTH, SCREEN_HEIGHT, rgb)
    json_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(f"wrote queue-driven bootstrap scene -> {ppm_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
