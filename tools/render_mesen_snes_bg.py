#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from extract_snes_tiles import decode_tile


SCREEN_WIDTH = 256
SCREEN_HEIGHT = 224
OAM_SIZE_TABLE = (
    ((1, 1), (2, 2)),
    ((1, 1), (4, 4)),
    ((1, 1), (8, 8)),
    ((2, 2), (4, 4)),
    ((2, 2), (8, 8)),
    ((4, 4), (8, 8)),
    ((2, 4), (4, 8)),
    ((2, 4), (4, 4)),
)
MODE7_SPRITE_PRIORITIES = (2, 4, 6, 7)
MODE7_OBJECT_PRIORITY_GROUPS = (1, 2, 3)


def normalize_scroll(value: int) -> int:
    value &= 0x3FF
    # The frame-300 credits scene reports raw VScroll 1023 in Mesen's state
    # while the visible output matches an effective scroll of 0.
    return 0 if value == 0x3FF else value


def sign_extend(value: int, bits: int) -> int:
    sign_bit = 1 << (bits - 1)
    full_range = 1 << bits
    masked = value & (full_range - 1)
    return masked - full_range if (masked & sign_bit) else masked


def read_vram_word(vram: bytes, word_index: int) -> int:
    byte_offset = word_index * 2
    if byte_offset < 0 or (byte_offset + 1) >= len(vram):
        return 0
    return vram[byte_offset] | (vram[byte_offset + 1] << 8)


def load_cgram_rgb(path: Path) -> list[tuple[int, int, int]]:
    data = path.read_bytes()
    if len(data) != 512:
        raise ValueError(f"expected 512-byte CGRAM dump, got {len(data)} bytes")

    colors: list[tuple[int, int, int]] = []
    for offset in range(0, len(data), 2):
        value = data[offset] | (data[offset + 1] << 8)
        red = value & 0x1F
        green = (value >> 5) & 0x1F
        blue = (value >> 10) & 0x1F
        colors.append((
            (red << 3) | (red >> 2),
            (green << 3) | (green >> 2),
            (blue << 3) | (blue >> 2),
        ))
    return colors


def bg_bpp(bg_mode: int, layer_index: int) -> int:
    if bg_mode == 0:
        return 2
    if bg_mode == 1:
        return 2 if layer_index == 2 else 4
    if bg_mode == 2:
        return 4
    if bg_mode == 3:
        return 8 if layer_index == 0 else 4
    if bg_mode == 4:
        return 8 if layer_index == 0 else 2
    if bg_mode == 5:
        return 4 if layer_index == 0 else 2
    if bg_mode == 6:
        return 4 if layer_index == 0 else 0
    raise ValueError(f"unsupported bg mode {bg_mode}")


def layer_enabled(mask: int, layer_index: int) -> bool:
    return (mask & (1 << layer_index)) != 0


def tilemap_size(layer_state: dict) -> tuple[int, int]:
    return (
        64 if layer_state.get("doubleWidth", False) else 32,
        64 if layer_state.get("doubleHeight", False) else 32,
    )


def read_tilemap_entry(vram: bytes, base: int, width_tiles: int, tile_x: int, tile_y: int) -> int:
    tile_x %= width_tiles
    block_x = tile_x // 32
    block_y = tile_y // 32
    local_x = tile_x % 32
    local_y = tile_y % 32
    entry_addr = base + (block_x * 0x0800) + (block_y * 0x1000) + ((local_y * 32 + local_x) * 2)
    if entry_addr + 1 >= len(vram):
        return 0
    return vram[entry_addr] | (vram[entry_addr + 1] << 8)


def fetch_tile_pixels(vram: bytes, chr_base: int, tile_index: int, bpp: int) -> list[int]:
    tile_size = 16 if bpp == 2 else 32
    start = chr_base + (tile_index * tile_size)
    end = start + tile_size
    if end > len(vram):
        return [0] * 64
    return decode_tile(vram[start:end], bpp)


def decode_4bpp_tile_pixel(vram: bytes, tile_start: int, pixel_x: int, pixel_y: int) -> int:
    row_start = tile_start + (pixel_y * 2)
    if row_start + 17 >= len(vram):
        return 0

    bit = 7 - pixel_x
    plane0 = (vram[row_start] >> bit) & 1
    plane1 = (vram[row_start + 1] >> bit) & 1
    plane2 = (vram[row_start + 16] >> bit) & 1
    plane3 = (vram[row_start + 17] >> bit) & 1
    return plane0 | (plane1 << 1) | (plane2 << 2) | (plane3 << 3)


def decode_sprite_row_pixel(chr_low: int, chr_high: int, shift: int) -> int:
    color = (chr_low >> shift) & 0x01
    color |= (chr_low >> (7 + shift)) & 0x02
    color |= ((chr_high >> shift) & 0x01) << 2
    color |= ((chr_high >> (7 + shift)) & 0x02) << 2
    return color


def render_mode7_layer(
    rgb: bytearray,
    vram: bytes,
    cgram: list[tuple[int, int, int]],
    state: dict,
) -> dict:
    hscroll = sign_extend(int(state.get("ppu.mode7.hscroll", 0)), 13)
    vscroll = sign_extend(int(state.get("ppu.mode7.vscroll", 0)), 13)
    center_x = sign_extend(int(state.get("ppu.mode7.centerX", 0)), 13)
    center_y = sign_extend(int(state.get("ppu.mode7.centerY", 0)), 13)
    matrix_a = sign_extend(int(state.get("ppu.mode7.matrix[0]", 0)), 16)
    matrix_b = sign_extend(int(state.get("ppu.mode7.matrix[1]", 0)), 16)
    matrix_c = sign_extend(int(state.get("ppu.mode7.matrix[2]", 0)), 16)
    matrix_d = sign_extend(int(state.get("ppu.mode7.matrix[3]", 0)), 16)
    large_map = bool(state.get("ppu.mode7.largeMap", False))
    fill_with_tile0 = bool(state.get("ppu.mode7.fillWithTile0", False))
    horizontal_mirroring = bool(state.get("ppu.mode7.horizontalMirroring", False))
    vertical_mirroring = bool(state.get("ppu.mode7.verticalMirroring", False))
    debug_start: tuple[int, int] | None = None
    debug_end: tuple[int, int] | None = None

    def clip(value: int) -> int:
        return (value | ~0x03FF) if (value & 0x2000) else (value & 0x03FF)

    for screen_y in range(SCREEN_HEIGHT):
        real_y = (255 - screen_y) if vertical_mirroring else screen_y
        x_value = (
            ((matrix_a * clip(hscroll - center_x)) & ~63) +
            ((matrix_b * real_y) & ~63) +
            ((matrix_b * clip(vscroll - center_y)) & ~63) +
            (center_x << 8)
        )
        y_value = (
            ((matrix_c * clip(hscroll - center_x)) & ~63) +
            ((matrix_d * real_y) & ~63) +
            ((matrix_d * clip(vscroll - center_y)) & ~63) +
            (center_y << 8)
        )
        x_step = matrix_a
        y_step = matrix_c

        if horizontal_mirroring:
            x_value += x_step * (SCREEN_WIDTH - 1)
            y_value += y_step * (SCREEN_WIDTH - 1)
            x_step = -x_step
            y_step = -y_step

        if screen_y == 0:
            debug_start = (x_value, y_value)
            debug_end = (
                x_value + (x_step * SCREEN_WIDTH),
                y_value + (y_step * SCREEN_WIDTH),
            )

        for screen_x in range(SCREEN_WIDTH):
            x_offset = x_value >> 8
            y_offset = y_value >> 8
            x_value += x_step
            y_value += y_step

            if not large_map:
                y_offset &= 0x03FF
                x_offset &= 0x03FF
            elif y_offset < 0 or y_offset > 0x03FF or x_offset < 0 or x_offset > 0x03FF:
                if fill_with_tile0:
                    tile_index = 0
                else:
                    continue
            if not (large_map and (y_offset < 0 or y_offset > 0x03FF or x_offset < 0 or x_offset > 0x03FF)):
                tile_word_index = ((y_offset & ~0x07) << 4) | (x_offset >> 3)
                tile_index = read_vram_word(vram, tile_word_index) & 0x00FF

            pixel_word_index = (tile_index << 6) + ((y_offset & 0x07) << 3) + (x_offset & 0x07)
            color_index = (read_vram_word(vram, pixel_word_index) >> 8) & 0x00FF
            if color_index == 0 or color_index >= len(cgram):
                continue

            dst = ((screen_y * SCREEN_WIDTH) + screen_x) * 3
            rgb[dst:dst + 3] = bytes(cgram[color_index])

    summary = {
        "hscroll": hscroll,
        "vscroll": vscroll,
        "center_x": center_x,
        "center_y": center_y,
        "matrix": [matrix_a, matrix_b, matrix_c, matrix_d],
        "large_map": large_map,
        "fill_with_tile0": fill_with_tile0,
        "horizontal_mirroring": horizontal_mirroring,
        "vertical_mirroring": vertical_mirroring,
        "debug_start": list(debug_start) if debug_start else [0, 0],
        "debug_end": list(debug_end) if debug_end else [0, 0],
    }
    return summary


def render_layer(
    rgb: bytearray,
    vram: bytes,
    cgram: list[tuple[int, int, int]],
    layer_index: int,
    bg_mode: int,
    layer_state: dict,
) -> None:
    bpp = bg_bpp(bg_mode, layer_index)
    if bpp == 0:
        return

    palette_stride = 4 if bpp == 2 else 16
    width_tiles, height_tiles = tilemap_size(layer_state)
    base = int(layer_state["tilemapAddress"]) << 1
    chr_base = int(layer_state["chrAddress"]) << 1
    hscroll = normalize_scroll(int(layer_state.get("hscroll", 0)))
    vscroll = normalize_scroll(int(layer_state.get("vscroll", 0)))
    tile_cache: dict[int, list[int]] = {}

    for screen_y in range(SCREEN_HEIGHT):
        world_y = (screen_y + vscroll) % (height_tiles * 8)
        tile_y = world_y // 8
        pixel_y = world_y & 7

        for screen_x in range(SCREEN_WIDTH):
            world_x = (screen_x + hscroll) % (width_tiles * 8)
            tile_x = world_x // 8
            pixel_x = world_x & 7

            entry = read_tilemap_entry(vram, base, width_tiles, tile_x, tile_y)
            tile_index = entry & 0x03FF
            palette_index = (entry >> 10) & 0x07
            hflip = (entry & 0x4000) != 0
            vflip = (entry & 0x8000) != 0

            pixels = tile_cache.get(tile_index)
            if pixels is None:
                pixels = fetch_tile_pixels(vram, chr_base, tile_index, bpp)
                tile_cache[tile_index] = pixels

            sample_x = 7 - pixel_x if hflip else pixel_x
            sample_y = 7 - pixel_y if vflip else pixel_y
            color_index = pixels[(sample_y * 8) + sample_x]
            if color_index == 0:
                continue

            cgram_index = (palette_index * palette_stride) + color_index
            if cgram_index >= len(cgram):
                continue

            dst = ((screen_y * SCREEN_WIDTH) + screen_x) * 3
            rgb[dst:dst + 3] = bytes(cgram[cgram_index])


def render_objects(
    rgb: bytearray,
    vram: bytes,
    oam: bytes,
    cgram: list[tuple[int, int, int]],
    state: dict,
    priority_groups: set[int] | None = None,
) -> dict:
    oam_mode = int(state.get("ppu.oamMode", 0)) & 0x07
    oam_base_address = int(state.get("ppu.oamBaseAddress", 0))
    oam_address_offset = int(state.get("ppu.oamAddressOffset", 0))
    enable_oam_priority = bool(state.get("ppu.enableOamPriority", False))
    internal_oam_address = int(state.get("ppu.internalOamAddress", 0))
    obj_interlace = bool(state.get("ppu.objInterlace", False))
    overscan_mode = bool(state.get("ppu.overscanMode", False))
    scanline_count = 239 if overscan_mode else 224
    start_index = ((internal_oam_address & 0x1FC) >> 2) if enable_oam_priority else 0

    visible_sprites = 0
    drawn_pixels = 0

    for i in range(128):
        sprite_index = start_index - i - 1
        if sprite_index < 0:
            sprite_index += 128

        addr = (sprite_index * 4) & 0x1FF
        high_table_offset = addr >> 4
        shift = ((addr >> 2) & 0x03) << 1
        high_table_value = (oam[0x200 | high_table_offset] >> shift) & 0x03
        large_sprite = (high_table_value & 0x02) >> 1
        width_tiles, height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite]
        width = width_tiles << 3
        height = height_tiles << 3
        sprite_x = (((((high_table_value & 0x01) << 8) | oam[addr]) << 7) & 0xFFFF)
        if sprite_x & 0x8000:
            sprite_x -= 0x10000
        sprite_x >>= 7
        sprite_y = oam[addr + 1]
        tile_index_base = oam[addr + 2]
        flags = oam[addr + 3]

        visible = True
        if sprite_x + width <= 0 or sprite_x > 255:
            visible = False
        else:
            end_y = sprite_y + ((height >> 1) if obj_interlace else height)
            if (end_y >= scanline_count or end_y == 256) and sprite_y >= scanline_count:
                visible = False

        if not visible:
            continue

        visible_sprites += 1
        use_second_table = (flags & 0x01) != 0
        raw_priority = (flags >> 4) & 0x03
        if priority_groups is not None and raw_priority not in priority_groups:
            continue
        palette_index = ((flags >> 1) & 0x07) + 8
        horizontal_mirror = (flags & 0x40) != 0
        vertical_mirror = (flags & 0x80) != 0
        tile_row = (tile_index_base & 0xF0) >> 4
        tile_column = tile_index_base & 0x0F

        for y in range(height):
            if vertical_mirror:
                if y < width:
                    pos = width - 1 - y
                else:
                    pos = width * 3 - 1 - y
                pixel_y = pos & 0x07
                row_offset = pos >> 3
            else:
                pixel_y = y & 0x07
                row_offset = y >> 3

            row = (tile_row + row_offset) & 0x0F
            y_pos = sprite_y + y
            if y_pos >= scanline_count:
                y_pos -= scanline_count
            if y_pos < 0 or y_pos >= SCREEN_HEIGHT:
                continue

            for x in range(width):
                if horizontal_mirror:
                    pixel_x = (width - x - 1) & 0x07
                    column_offset = (width - x - 1) >> 3
                else:
                    pixel_x = x & 0x07
                    column_offset = x >> 3

                x_pos = sprite_x + x
                if x_pos < 0 or x_pos >= SCREEN_WIDTH:
                    continue

                column = (tile_column + column_offset) & 0x0F
                tile_index = (row << 4) | column
                tile_start = ((oam_base_address + (tile_index << 4) + (oam_address_offset if use_second_table else 0)) & 0x7FFF) << 1
                color_index = decode_4bpp_tile_pixel(vram, tile_start, pixel_x, pixel_y)
                if color_index == 0:
                    continue

                cgram_index = (palette_index * 16) + color_index
                if cgram_index >= len(cgram):
                    continue

                dst = ((y_pos * SCREEN_WIDTH) + x_pos) * 3
                rgb[dst:dst + 3] = bytes(cgram[cgram_index])
                drawn_pixels += 1

    return {
        "oam_mode": oam_mode,
        "oam_base_address": oam_base_address,
        "oam_address_offset": oam_address_offset,
        "enable_oam_priority": enable_oam_priority,
        "internal_oam_address": internal_oam_address,
        "priority_groups": sorted(priority_groups) if priority_groups is not None else None,
        "visible_sprites": visible_sprites,
        "drawn_pixels": drawn_pixels,
    }


def sprite_x_from_oam(oam: bytes, addr: int, high_table_value: int) -> int:
    raw = (((high_table_value & 0x01) << 8) | oam[addr]) & 0x1FF
    return raw - 0x200 if (raw & 0x100) else raw


def sprite_scanline_visible(scanline: int, sprite_x: int, sprite_y: int, width: int, height: int, interlace: bool) -> bool:
    if sprite_x != -256 and (sprite_x + width <= 0 or sprite_x > 255):
        return False

    end_y = sprite_y + ((height >> 1) if interlace else height)
    return (
        (scanline >= sprite_y and scanline < end_y) or
        ((end_y & 0xFF) < sprite_y and scanline < (end_y & 0xFF))
    )


def render_mode7_objects_ppu_accurate(
    rgb: bytearray,
    vram: bytes,
    oam: bytes,
    cgram: list[tuple[int, int, int]],
    state: dict,
) -> dict:
    oam_mode = int(state.get("ppu.oamMode", 0)) & 0x07
    oam_base_address = int(state.get("ppu.oamBaseAddress", 0))
    oam_address_offset = int(state.get("ppu.oamAddressOffset", 0))
    enable_oam_priority = bool(state.get("ppu.enableOamPriority", False))
    internal_oam_address = int(state.get("ppu.internalOamAddress", 0))
    obj_interlace = bool(state.get("ppu.objInterlace", False))
    frame_count = int(state.get("ppu.frameCount", 0))
    odd_frame = frame_count & 0x01
    start_index = ((internal_oam_address & 0x1FC) >> 2) if enable_oam_priority else 0

    visible_sprites_total = 0
    lines_with_sprites = 0
    drawn_pixels = 0
    dropped_tiles = 0

    for scanline in range(SCREEN_HEIGHT):
        visible_indices: list[int] = []
        oam_eval_index = start_index

        for _ in range(128):
            addr = (oam_eval_index << 2) & 0x1FF
            high_table_value = oam[0x200 | (oam_eval_index >> 2)] >> ((oam_eval_index << 1) & 0x06)
            large_sprite = (high_table_value & 0x02) >> 1
            width_tiles, height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite]
            width = width_tiles << 3
            height = height_tiles << 3
            sprite_x = sprite_x_from_oam(oam, addr, high_table_value)
            sprite_y = oam[addr + 1]

            if sprite_scanline_visible(scanline, sprite_x, sprite_y, width, height, obj_interlace):
                if len(visible_indices) < 32:
                    visible_indices.append(oam_eval_index)
                else:
                    break

            oam_eval_index = (oam_eval_index + 1) & 0x7F

        if not visible_indices:
            continue

        visible_sprites_total += len(visible_indices)
        lines_with_sprites += 1
        sprite_tile_count = 0

        sprite_priority = [0xFF] * SCREEN_WIDTH
        sprite_palette = [0] * SCREEN_WIDTH
        sprite_color = [0] * SCREEN_WIDTH

        stop_fetch = False
        for sprite_index in reversed(visible_indices):
            addr = (sprite_index << 2) & 0x1FF
            high_table_value = oam[0x200 | (sprite_index >> 2)] >> ((sprite_index << 1) & 0x06)
            large_sprite = (high_table_value & 0x02) >> 1
            width_tiles, height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite]
            width = width_tiles << 3
            height = height_tiles << 3
            sprite_x = sprite_x_from_oam(oam, addr, high_table_value)
            sprite_y = oam[addr + 1]
            tile_index_base = oam[addr + 2]
            flags = oam[addr + 3]

            use_second_table = (flags & 0x01) != 0
            palette_index = (flags >> 1) & 0x07
            raw_priority = (flags >> 4) & 0x03
            horizontal_mirror = (flags & 0x40) != 0
            vertical_mirror = (flags & 0x80) != 0

            column_count = width // 8
            column_offset = column_count
            if sprite_x <= -8 and sprite_x != -256:
                column_offset += sprite_x // 8
            if column_offset <= 0:
                continue

            y_gap = scanline - sprite_y
            if obj_interlace:
                y_gap = (y_gap << 1) | odd_frame

            while column_offset > 0:
                sprite_tile_count += 1
                if sprite_tile_count > 34:
                    dropped_tiles += 1
                    stop_fetch = True
                    break

                column_offset -= 1
                if vertical_mirror:
                    if y_gap < width:
                        pos = width - 1 - y_gap
                    else:
                        pos = width * 3 - 1 - y_gap
                    y_offset = pos & 0x07
                    row_offset = pos >> 3
                else:
                    y_offset = y_gap & 0x07
                    row_offset = y_gap >> 3

                tile_row = (tile_index_base & 0xF0) >> 4
                tile_column = tile_index_base & 0x0F
                row = (tile_row + row_offset) & 0x0F
                tile_column_offset = column_offset if horizontal_mirror else (column_count - column_offset - 1)
                tile_index = (row << 4) | ((tile_column + tile_column_offset) & 0x0F)
                fetch_address = (oam_base_address + (tile_index << 4) + (oam_address_offset if use_second_table else 0) + y_offset) & 0x7FFF

                x_base = 0 if sprite_x == -256 else sprite_x
                end_tile_x = x_base + ((column_count - column_offset - 1) << 3) + 8
                draw_x = sprite_x + ((column_count - column_offset - 1) << 3)

                chr_low = read_vram_word(vram, fetch_address)
                chr_high = read_vram_word(vram, fetch_address + 8)
                for pixel in range(8):
                    x_pos = draw_x + pixel
                    if x_pos < 0 or x_pos >= SCREEN_WIDTH:
                        continue

                    x_offset = (7 - pixel) & 0x07 if horizontal_mirror else pixel
                    color = decode_sprite_row_pixel(chr_low, chr_high, 7 - x_offset)
                    if color != 0:
                        sprite_color[x_pos] = color
                        sprite_palette[x_pos] = palette_index
                        sprite_priority[x_pos] = raw_priority

                if column_offset == 0 or end_tile_x >= 256:
                    break

            if stop_fetch:
                break

        for x_pos in range(SCREEN_WIDTH):
            raw_priority = sprite_priority[x_pos]
            if raw_priority not in (1, 2, 3):
                continue

            sprite_priority_value = MODE7_SPRITE_PRIORITIES[raw_priority]
            if sprite_priority_value <= 3:
                continue

            cgram_index = 128 + (sprite_palette[x_pos] << 4) + sprite_color[x_pos]
            if cgram_index >= len(cgram):
                continue

            dst = ((scanline * SCREEN_WIDTH) + x_pos) * 3
            rgb[dst:dst + 3] = bytes(cgram[cgram_index])
            drawn_pixels += 1

    return {
        "oam_mode": oam_mode,
        "oam_base_address": oam_base_address,
        "oam_address_offset": oam_address_offset,
        "enable_oam_priority": enable_oam_priority,
        "internal_oam_address": internal_oam_address,
        "lines_with_sprites": lines_with_sprites,
        "visible_sprites_total": visible_sprites_total,
        "drawn_pixels": drawn_pixels,
        "dropped_tiles": dropped_tiles,
        "method": "mode7_scanline_ppu",
    }


def write_ppm(path: Path, width: int, height: int, rgb: bytes) -> None:
    with path.open("wb") as file:
        file.write(f"P6\n{width} {height}\n255\n".encode("ascii"))
        file.write(rgb)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Render SNES BG layers, with optional OBJ composition, from Mesen VRAM/CGRAM/state dumps."
    )
    parser.add_argument("vram", type=Path, help="Mesen snesVideoRam dump")
    parser.add_argument("cgram", type=Path, help="Mesen snesCgRam dump")
    parser.add_argument("ppu_state", type=Path, help="Mesen getState JSON dump")
    parser.add_argument("output", type=Path, help="output PPM path")
    parser.add_argument("--oam", type=Path, default=None, help="optional Mesen snesSpriteRam dump")
    parser.add_argument(
        "--obj-renderer",
        choices=("simple", "mode7-ppu"),
        default="simple",
        help="object compositor to use when --oam is provided",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional render summary path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    vram = args.vram.read_bytes()
    cgram = load_cgram_rgb(args.cgram)
    state = json.loads(args.ppu_state.read_text())
    oam = args.oam.read_bytes() if args.oam is not None else None

    bg_mode = int(state["ppu.bgMode"])
    main_screen_layers = int(state["ppu.mainScreenLayers"])
    layer_states = []
    for layer_index in range(3):
        layer_states.append({
            "layer_index": layer_index,
            "tilemapAddress": state[f"ppu.layers[{layer_index}].tilemapAddress"],
            "chrAddress": state[f"ppu.layers[{layer_index}].chrAddress"],
            "doubleWidth": state[f"ppu.layers[{layer_index}].doubleWidth"],
            "doubleHeight": state[f"ppu.layers[{layer_index}].doubleHeight"],
            "largeTiles": state[f"ppu.layers[{layer_index}].largeTiles"],
            "hscroll": state[f"ppu.layers[{layer_index}].hscroll"],
            "vscroll": state[f"ppu.layers[{layer_index}].vscroll"],
        })

    rgb = bytearray(SCREEN_WIDTH * SCREEN_HEIGHT * 3)
    backdrop = cgram[0]
    for offset in range(0, len(rgb), 3):
        rgb[offset:offset + 3] = bytes(backdrop)

    mode7_summary = None
    obj_summary = None
    if bg_mode == 7:
        if layer_enabled(main_screen_layers, 0):
            mode7_summary = render_mode7_layer(rgb, vram, cgram, state)
        if oam is not None and layer_enabled(main_screen_layers, 4):
            if args.obj_renderer == "mode7-ppu":
                obj_summary = render_mode7_objects_ppu_accurate(rgb, vram, oam, cgram, state)
            else:
                obj_summary = render_objects(
                    rgb,
                    vram,
                    oam,
                    cgram,
                    state,
                    priority_groups=set(MODE7_OBJECT_PRIORITY_GROUPS),
                )
    else:
        for layer_index in range(2, -1, -1):
            if layer_enabled(main_screen_layers, layer_index):
                render_layer(rgb, vram, cgram, layer_index, bg_mode, layer_states[layer_index])

    if bg_mode != 7 and oam is not None and layer_enabled(main_screen_layers, 4):
        obj_summary = render_objects(rgb, vram, oam, cgram, state)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    write_ppm(args.output, SCREEN_WIDTH, SCREEN_HEIGHT, bytes(rgb))

    if args.json_out is not None:
        summary = {
            "bg_mode": bg_mode,
            "main_screen_layers": main_screen_layers,
            "layer_states": layer_states,
        }
        if mode7_summary is not None:
            summary["mode7"] = mode7_summary
        if obj_summary is not None:
            summary["obj"] = obj_summary
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(
        f"rendered scene from Mesen dump -> {args.output} "
        f"(bgMode={bg_mode}, mainScreenLayers=0x{main_screen_layers:02X}, "
        f"obj={'yes' if obj_summary is not None else 'no'})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
