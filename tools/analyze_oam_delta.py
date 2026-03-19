#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from render_mesen_snes_bg import OAM_SIZE_TABLE


OAM_SIZE_BYTES = 0x0220
LOW_TABLE_FIELD_NAMES = ("x_low", "y", "tile_index_base", "flags")
DIFF_FIELDS = (
    "draw_order",
    "x",
    "y",
    "tile_index_base",
    "flags",
    "high_x_bit",
    "large_sprite",
    "width",
    "height",
    "visible",
    "use_second_table",
    "raw_priority",
    "palette_index",
    "horizontal_mirror",
    "vertical_mirror",
    "tile_row",
    "tile_column",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare two SNES OAM dumps and summarize raw-byte plus sprite-level "
            "differences using the same visibility assumptions as the Python renderer."
        )
    )
    parser.add_argument("oam_a", type=Path, help="first 544-byte OAM dump")
    parser.add_argument("oam_b", type=Path, help="second 544-byte OAM dump")
    parser.add_argument("--state-a", type=Path, required=True, help="PPU-state JSON for the first OAM dump")
    parser.add_argument("--state-b", type=Path, default=None, help="optional PPU-state JSON for the second OAM dump")
    parser.add_argument("--label-a", default="a", help="label for the first OAM dump")
    parser.add_argument("--label-b", default="b", help="label for the second OAM dump")
    parser.add_argument("--json-out", type=Path, required=True, help="output JSON path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown summary path")
    return parser.parse_args()


def load_binary(path: Path, expected_size: int) -> bytes:
    data = path.read_bytes()
    if len(data) != expected_size:
        raise ValueError(f"expected {expected_size} bytes in {path}, got {len(data)}")
    return data


def load_state(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def sprite_draw_order(state: dict[str, Any]) -> dict[int, int]:
    enable_oam_priority = bool(state.get("ppu.enableOamPriority", False))
    internal_oam_address = int(state.get("ppu.internalOamAddress", 0))
    start_index = ((internal_oam_address & 0x1FC) >> 2) if enable_oam_priority else 0
    order: dict[int, int] = {}
    for draw_order in range(128):
        sprite_index = start_index - draw_order - 1
        if sprite_index < 0:
            sprite_index += 128
        order[sprite_index] = draw_order
    return order


def sprite_x_from_oam(oam: bytes, addr: int, high_table_value: int) -> int:
    raw = (((high_table_value & 0x01) << 8) | oam[addr]) & 0x1FF
    return raw - 0x200 if (raw & 0x100) else raw


def sprite_visible(
    sprite_x: int,
    sprite_y: int,
    width: int,
    height: int,
    obj_interlace: bool,
    overscan_mode: bool,
) -> bool:
    if sprite_x + width <= 0 or sprite_x > 255:
        return False

    scanline_count = 239 if overscan_mode else 224
    end_y = sprite_y + ((height >> 1) if obj_interlace else height)
    if (end_y >= scanline_count or end_y == 256) and sprite_y >= scanline_count:
        return False
    return True


def parse_sprites(oam: bytes, state: dict[str, Any]) -> list[dict[str, Any]]:
    oam_mode = int(state.get("ppu.oamMode", 0)) & 0x07
    obj_interlace = bool(state.get("ppu.objInterlace", False))
    overscan_mode = bool(state.get("ppu.overscanMode", False))
    order_map = sprite_draw_order(state)

    sprites: list[dict[str, Any]] = []
    for sprite_index in range(128):
        addr = (sprite_index * 4) & 0x1FF
        high_table_offset = addr >> 4
        high_table_shift = ((addr >> 2) & 0x03) << 1
        high_table_value = (oam[0x200 | high_table_offset] >> high_table_shift) & 0x03
        large_sprite = (high_table_value & 0x02) >> 1
        width_tiles, height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite]
        width = width_tiles << 3
        height = height_tiles << 3
        flags = oam[addr + 3]

        sprite = {
            "sprite_index": sprite_index,
            "addr": addr,
            "high_table_offset": 0x200 | high_table_offset,
            "high_table_shift": high_table_shift,
            "draw_order": order_map[sprite_index],
            "x": sprite_x_from_oam(oam, addr, high_table_value),
            "y": oam[addr + 1],
            "tile_index_base": oam[addr + 2],
            "flags": flags,
            "high_x_bit": high_table_value & 0x01,
            "large_sprite": large_sprite,
            "width": width,
            "height": height,
            "use_second_table": (flags & 0x01) != 0,
            "raw_priority": (flags >> 4) & 0x03,
            "palette_index": ((flags >> 1) & 0x07) + 8,
            "horizontal_mirror": (flags & 0x40) != 0,
            "vertical_mirror": (flags & 0x80) != 0,
        }
        sprite["tile_row"] = (sprite["tile_index_base"] & 0xF0) >> 4
        sprite["tile_column"] = sprite["tile_index_base"] & 0x0F
        sprite["visible"] = sprite_visible(
            sprite["x"],
            sprite["y"],
            width,
            height,
            obj_interlace,
            overscan_mode,
        )
        sprites.append(sprite)
    return sprites


def build_raw_change(offset: int, before: int, after: int) -> dict[str, Any]:
    change: dict[str, Any] = {
        "offset": offset,
        "before": before,
        "after": after,
    }
    if offset < 0x200:
        sprite_index = offset // 4
        change["region"] = "low_table"
        change["sprite_index"] = sprite_index
        change["field"] = LOW_TABLE_FIELD_NAMES[offset % 4]
    else:
        high_slot = offset - 0x200
        sprite_base = high_slot * 4
        change["region"] = "high_table"
        change["sprite_indices"] = list(range(sprite_base, sprite_base + 4))
        change["field"] = "high_x_bit_and_size"
    return change


def diff_sprites(sprites_a: list[dict[str, Any]], sprites_b: list[dict[str, Any]]) -> list[dict[str, Any]]:
    changes: list[dict[str, Any]] = []
    for sprite_a, sprite_b in zip(sprites_a, sprites_b):
        sprite_changes: dict[str, list[Any]] = {}
        for field_name in DIFF_FIELDS:
            if sprite_a[field_name] != sprite_b[field_name]:
                sprite_changes[field_name] = [sprite_a[field_name], sprite_b[field_name]]
        if not sprite_changes:
            continue

        changes.append(
            {
                "sprite_index": sprite_a["sprite_index"],
                "draw_order": [sprite_a["draw_order"], sprite_b["draw_order"]],
                "visible": [sprite_a["visible"], sprite_b["visible"]],
                "changes": sprite_changes,
            }
        )
    return changes


def build_summary(
    label_a: str,
    label_b: str,
    path_a: Path,
    path_b: Path,
    state_path_a: Path,
    state_path_b: Path,
    oam_a: bytes,
    oam_b: bytes,
    state_a: dict[str, Any],
    state_b: dict[str, Any],
) -> dict[str, Any]:
    raw_changes = [
        build_raw_change(offset, before, after)
        for offset, (before, after) in enumerate(zip(oam_a, oam_b))
        if before != after
    ]
    low_table_changes = [entry for entry in raw_changes if entry["region"] == "low_table"]
    high_table_changes = [entry for entry in raw_changes if entry["region"] == "high_table"]

    sprites_a = parse_sprites(oam_a, state_a)
    sprites_b = parse_sprites(oam_b, state_b)
    sprite_changes = diff_sprites(sprites_a, sprites_b)
    changed_visible_sprites = [
        entry for entry in sprite_changes if entry["visible"][0] or entry["visible"][1]
    ]

    return {
        "labels": {"a": label_a, "b": label_b},
        "paths": {
            "oam_a": str(path_a),
            "oam_b": str(path_b),
            "state_a": str(state_path_a),
            "state_b": str(state_path_b),
        },
        "state": {
            "a": {
                "oam_mode": int(state_a.get("ppu.oamMode", 0)) & 0x07,
                "oam_base_address": int(state_a.get("ppu.oamBaseAddress", 0)),
                "oam_address_offset": int(state_a.get("ppu.oamAddressOffset", 0)),
                "enable_oam_priority": bool(state_a.get("ppu.enableOamPriority", False)),
                "internal_oam_address": int(state_a.get("ppu.internalOamAddress", 0)),
                "obj_interlace": bool(state_a.get("ppu.objInterlace", False)),
                "overscan_mode": bool(state_a.get("ppu.overscanMode", False)),
            },
            "b": {
                "oam_mode": int(state_b.get("ppu.oamMode", 0)) & 0x07,
                "oam_base_address": int(state_b.get("ppu.oamBaseAddress", 0)),
                "oam_address_offset": int(state_b.get("ppu.oamAddressOffset", 0)),
                "enable_oam_priority": bool(state_b.get("ppu.enableOamPriority", False)),
                "internal_oam_address": int(state_b.get("ppu.internalOamAddress", 0)),
                "obj_interlace": bool(state_b.get("ppu.objInterlace", False)),
                "overscan_mode": bool(state_b.get("ppu.overscanMode", False)),
            },
        },
        "raw_oam": {
            "diff_byte_count": len(raw_changes),
            "low_table_diff_byte_count": len(low_table_changes),
            "high_table_diff_byte_count": len(high_table_changes),
            "changes": raw_changes,
        },
        "sprites": {
            "visible_count_a": sum(1 for sprite in sprites_a if sprite["visible"]),
            "visible_count_b": sum(1 for sprite in sprites_b if sprite["visible"]),
            "changed_sprite_count": len(sprite_changes),
            "changed_visible_sprite_count": len(changed_visible_sprites),
            "changed_sprites": sprite_changes,
        },
    }


def format_change_value(value: Any) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    return str(value)


def write_markdown(path: Path, summary: dict[str, Any]) -> None:
    lines: list[str] = []
    labels = summary["labels"]
    paths = summary["paths"]
    raw = summary["raw_oam"]
    sprites = summary["sprites"]

    lines.append("# OAM Delta Summary")
    lines.append("")
    lines.append(f"- {labels['a']}: `{paths['oam_a']}`")
    lines.append(f"- {labels['b']}: `{paths['oam_b']}`")
    lines.append(f"- state A: `{paths['state_a']}`")
    lines.append(f"- state B: `{paths['state_b']}`")
    lines.append(f"- raw OAM diff bytes: `{raw['diff_byte_count']}`")
    lines.append(f"- low-table diff bytes: `{raw['low_table_diff_byte_count']}`")
    lines.append(f"- high-table diff bytes: `{raw['high_table_diff_byte_count']}`")
    lines.append(f"- visible sprites: `{sprites['visible_count_a']} -> {sprites['visible_count_b']}`")
    lines.append(f"- changed sprites: `{sprites['changed_sprite_count']}` total, `{sprites['changed_visible_sprite_count']}` visible")
    lines.append("")

    if raw["changes"]:
        lines.append("## Raw Byte Changes")
        lines.append("")
        for change in raw["changes"]:
            if change["region"] == "low_table":
                lines.append(
                    f"- `0x{change['offset']:03X}` sprite `{change['sprite_index']}` `{change['field']}`: "
                    f"`0x{change['before']:02X}` -> `0x{change['after']:02X}`"
                )
            else:
                sprite_list = ",".join(str(index) for index in change["sprite_indices"])
                lines.append(
                    f"- `0x{change['offset']:03X}` high-table sprites `{sprite_list}`: "
                    f"`0x{change['before']:02X}` -> `0x{change['after']:02X}`"
                )
        lines.append("")

    if sprites["changed_sprites"]:
        lines.append("## Changed Sprites")
        lines.append("")
        for entry in sprites["changed_sprites"]:
            change_bits = ", ".join(
                f"{field} {format_change_value(values[0])}->{format_change_value(values[1])}"
                for field, values in entry["changes"].items()
            )
            lines.append(
                f"- sprite `{entry['sprite_index']}` visible `{entry['visible'][0]}` -> `{entry['visible'][1]}`: {change_bits}"
            )
        lines.append("")

    path.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    args = parse_args()
    state_path_b = args.state_b if args.state_b is not None else args.state_a
    oam_a = load_binary(args.oam_a, OAM_SIZE_BYTES)
    oam_b = load_binary(args.oam_b, OAM_SIZE_BYTES)
    state_a = load_state(args.state_a)
    state_b = load_state(state_path_b)

    summary = build_summary(
        args.label_a,
        args.label_b,
        args.oam_a,
        args.oam_b,
        args.state_a,
        state_path_b,
        oam_a,
        oam_b,
        state_a,
        state_b,
    )
    args.json_out.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, summary)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
