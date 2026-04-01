#include "../include/td2_ppu.h"

#include <string.h>

typedef struct {
    uint8_t layer_index;
    uint8_t priority_bit;
} Td2BgRenderPass;

static const uint8_t TD2_BG_BPP_TABLE[8][TD2_PPU_LAYER_COUNT] = {
    {2, 2, 2, 2},
    {4, 4, 2, 0},
    {4, 4, 0, 0},
    {8, 4, 0, 0},
    {8, 2, 0, 0},
    {4, 2, 0, 0},
    {4, 0, 0, 0},
    {8, 0, 0, 0},
};

static const uint8_t TD2_OAM_SIZE_TABLE[8][2][2] = {
    {{1, 1}, {2, 2}},
    {{1, 1}, {4, 4}},
    {{1, 1}, {8, 8}},
    {{2, 2}, {4, 4}},
    {{2, 2}, {8, 8}},
    {{4, 4}, {8, 8}},
    {{2, 4}, {4, 8}},
    {{2, 4}, {4, 4}}
};

static const uint8_t TD2_MODE7_SPRITE_PRIORITIES[4] = {2, 4, 6, 7};

static const Td2BgRenderPass TD2_BG_RENDER_PASSES_DEFAULT[] = {
    {3, 0}, {2, 0}, {1, 0}, {0, 0},
    {3, 1}, {2, 1}, {1, 1}, {0, 1},
};

static const Td2BgRenderPass TD2_BG_RENDER_PASSES_BG3_ABOVE_BG2[] = {
    {3, 0}, {1, 0}, {2, 0}, {0, 0},
    {3, 1}, {1, 1}, {2, 1}, {0, 1},
};

static uint8_t td2_scale_component(uint8_t component, uint8_t brightness) {
    return (uint8_t)((component * brightness) / 15U);
}

static uint32_t td2_cgram_word_to_argb(uint16_t word, uint8_t brightness) {
    uint8_t red = (uint8_t)((word & 0x1fu) << 3);
    uint8_t green = (uint8_t)(((word >> 5) & 0x1fu) << 3);
    uint8_t blue = (uint8_t)(((word >> 10) & 0x1fu) << 3);

    red |= (uint8_t)(red >> 5);
    green |= (uint8_t)(green >> 5);
    blue |= (uint8_t)(blue >> 5);

    red = td2_scale_component(red, brightness);
    green = td2_scale_component(green, brightness);
    blue = td2_scale_component(blue, brightness);

    return 0xff000000U |
           ((uint32_t)red << 16) |
           ((uint32_t)green << 8) |
           (uint32_t)blue;
}

static int td2_bg_bpp(int bg_mode, int layer_index) {
    if (bg_mode < 0 ||
        bg_mode >= (int)(sizeof(TD2_BG_BPP_TABLE) / sizeof(TD2_BG_BPP_TABLE[0])) ||
        layer_index < 0 ||
        layer_index >= TD2_PPU_LAYER_COUNT) {
        return 0;
    }
    return TD2_BG_BPP_TABLE[bg_mode][layer_index];
}

static bool td2_layer_enabled(int layer_mask, int layer_index) {
    return (layer_mask & (1 << layer_index)) != 0;
}

static int td2_normalize_scroll(int value) {
    value &= 0x03ff;
    return value == 0x03ff ? 0 : value;
}

static int td2_sign_extend(int value, int bits) {
    int sign_bit = 1 << (bits - 1);
    int full_range = 1 << bits;
    int masked = value & (full_range - 1);

    return (masked & sign_bit) ? (masked - full_range) : masked;
}

static int td2_ppu_scanline_main_layers(const Td2PpuState* ppu, int scanline) {
    int layers;

    if (!ppu->scanline_profile.enabled ||
        scanline < 0 ||
        scanline >= TD2_FRAME_HEIGHT ||
        scanline >= (int)ppu->scanline_profile.line_count) {
        layers = ppu->main_screen_layers;
    } else {
        layers = ppu->scanline_profile.main_screen_layers[scanline];
    }

    if (ppu->composition_profile.enabled &&
        scanline >= 0 &&
        scanline < (int)ppu->composition_profile.bg3_enable_top_scanlines) {
        layers |= (1 << 2);
    }

    return layers;
}

static int td2_ppu_scanline_layer_hscroll(
    const Td2PpuState* ppu,
    int layer_index,
    int scanline
) {
    if (!ppu->scanline_profile.enabled ||
        layer_index < 0 ||
        layer_index >= TD2_PPU_LAYER_COUNT ||
        scanline < 0 ||
        scanline >= TD2_FRAME_HEIGHT ||
        scanline >= (int)ppu->scanline_profile.line_count) {
        return ppu->layers[layer_index].hscroll;
    }
    return ppu->scanline_profile.layer_hscroll[layer_index][scanline];
}

static int td2_ppu_scanline_layer_vscroll(
    const Td2PpuState* ppu,
    int layer_index,
    int scanline
) {
    if (!ppu->scanline_profile.enabled ||
        layer_index < 0 ||
        layer_index >= TD2_PPU_LAYER_COUNT ||
        scanline < 0 ||
        scanline >= TD2_FRAME_HEIGHT ||
        scanline >= (int)ppu->scanline_profile.line_count) {
        return ppu->layers[layer_index].vscroll;
    }
    return ppu->scanline_profile.layer_vscroll[layer_index][scanline];
}

static bool td2_ppu_any_scanline_layer_enabled(
    const Td2PpuState* ppu,
    int layer_index
) {
    int scanline;

    if (!ppu->scanline_profile.enabled) {
        return td2_layer_enabled(ppu->main_screen_layers, layer_index);
    }

    for (scanline = 0; scanline < TD2_FRAME_HEIGHT; scanline++) {
        if (td2_layer_enabled(td2_ppu_scanline_main_layers(ppu, scanline), layer_index)) {
            return true;
        }
    }
    return false;
}

static void td2_bg_tilemap_size(
    const Td2PpuLayerState* layer,
    int* out_width_tiles,
    int* out_height_tiles
) {
    *out_width_tiles = layer->double_width ? 64 : 32;
    *out_height_tiles = layer->double_height ? 64 : 32;
}

static void td2_decode_tile(const uint8_t* tile_data, int bpp, uint8_t* out_pixels) {
    int y;

    for (y = 0; y < 8; y++) {
        int x;
        for (x = 0; x < 8; x++) {
            int bit = 7 - x;
            int plane_pair;
            uint8_t color = 0;

            for (plane_pair = 0; plane_pair < bpp; plane_pair += 2) {
                int pair_offset = (plane_pair / 2) * 16;
                uint8_t plane0 = tile_data[pair_offset + (y * 2)];
                uint8_t plane1 = tile_data[pair_offset + (y * 2) + 1];

                color |= (uint8_t)(((plane0 >> bit) & 1u) << plane_pair);
                color |= (uint8_t)(((plane1 >> bit) & 1u) << (plane_pair + 1));
            }

            out_pixels[(y * 8) + x] = color;
        }
    }
}

static uint16_t td2_bg_read_tilemap_entry(
    const Td2PpuState* ppu,
    int base_word,
    int width_tiles,
    int tile_x,
    int tile_y
) {
    int block_x;
    int block_y;
    int local_x;
    int local_y;
    size_t entry_offset;

    if (width_tiles <= 0) {
        return 0;
    }

    tile_x %= width_tiles;
    if (tile_x < 0) {
        tile_x += width_tiles;
    }

    block_x = tile_x / 32;
    block_y = tile_y / 32;
    local_x = tile_x % 32;
    local_y = tile_y % 32;
    entry_offset = (size_t)(base_word + (block_x * 0x0400) + (block_y * 0x0800) + (local_y * 32) + local_x) * 2U;

    if ((entry_offset + 1U) >= TD2_VRAM_BYTES) {
        return 0;
    }

    return (uint16_t)ppu->vram[entry_offset] | (uint16_t)(ppu->vram[entry_offset + 1U] << 8);
}

static uint16_t td2_vram_read_word(const Td2PpuState* ppu, int word_index) {
    size_t byte_offset = (size_t)word_index * 2U;

    if (word_index < 0 || (byte_offset + 1U) >= TD2_VRAM_BYTES) {
        return 0;
    }

    return (uint16_t)ppu->vram[byte_offset] | (uint16_t)(ppu->vram[byte_offset + 1U] << 8);
}

static const uint8_t* td2_bg_get_tile_pixels(
    Td2PpuState* ppu,
    int layer_index,
    int tile_index,
    int bpp
) {
    const Td2PpuLayerState* layer = &ppu->layers[layer_index];
    size_t tile_size = (size_t)bpp * 8U;
    size_t start = ((size_t)layer->chr_address * 2U) + ((size_t)tile_index * tile_size);

    if (tile_index < 0 || tile_index >= TD2_PPU_TILE_CACHE_TILES) {
        return NULL;
    }

    if (!ppu->tile_cache_valid[layer_index][tile_index]) {
        if ((start + tile_size) > TD2_VRAM_BYTES) {
            memset(ppu->tile_cache[layer_index][tile_index], 0, 64U);
        } else {
            td2_decode_tile(&ppu->vram[start], bpp, ppu->tile_cache[layer_index][tile_index]);
        }
        ppu->tile_cache_valid[layer_index][tile_index] = 1U;
    }

    return ppu->tile_cache[layer_index][tile_index];
}

static uint8_t td2_decode_4bpp_tile_pixel(
    const Td2PpuState* ppu,
    size_t tile_start,
    int pixel_x,
    int pixel_y
) {
    size_t row_start = tile_start + (size_t)(pixel_y * 2);
    int bit = 7 - pixel_x;
    uint8_t plane0;
    uint8_t plane1;
    uint8_t plane2;
    uint8_t plane3;

    if ((row_start + 17U) >= TD2_VRAM_BYTES) {
        return 0;
    }

    plane0 = (uint8_t)((ppu->vram[row_start] >> bit) & 1U);
    plane1 = (uint8_t)((ppu->vram[row_start + 1U] >> bit) & 1U);
    plane2 = (uint8_t)((ppu->vram[row_start + 16U] >> bit) & 1U);
    plane3 = (uint8_t)((ppu->vram[row_start + 17U] >> bit) & 1U);
    return (uint8_t)(plane0 | (plane1 << 1) | (plane2 << 2) | (plane3 << 3));
}

static uint8_t td2_decode_sprite_row_pixel(uint16_t chr_low, uint16_t chr_high, int shift) {
    uint8_t color = (uint8_t)((chr_low >> shift) & 0x01U);
    color |= (uint8_t)((chr_low >> (7 + shift)) & 0x02U);
    color |= (uint8_t)(((chr_high >> shift) & 0x01U) << 2);
    color |= (uint8_t)(((chr_high >> (7 + shift)) & 0x02U) << 2);
    return color;
}

static int td2_sprite_x_from_oam(const Td2PpuState* ppu, int addr, int high_table_value) {
    int raw = ((((high_table_value & 0x01) << 8) | ppu->oam[addr]) & 0x01ff);
    return (raw & 0x0100) ? (raw - 0x0200) : raw;
}

static void td2_sprite_vertical_sample(
    int y_offset,
    int height,
    bool vertical_mirror,
    int* out_pixel_y,
    int* out_row_offset
) {
    int sample_y = vertical_mirror ? (height - 1 - y_offset) : y_offset;

    *out_pixel_y = sample_y & 0x07;
    *out_row_offset = sample_y >> 3;
}

static bool td2_sprite_scanline_visible(
    int scanline,
    int sprite_x,
    int sprite_y,
    int width,
    int height,
    bool interlace
) {
    int end_y;

    if (sprite_x != -256 && ((sprite_x + width) <= 0 || sprite_x > 255)) {
        return false;
    }

    end_y = sprite_y + (interlace ? (height >> 1) : height);
    return ((scanline >= sprite_y && scanline < end_y) ||
            (((end_y & 0x00ff) < sprite_y) && (scanline < (end_y & 0x00ff))));
}

static void td2_render_objects(
    const Td2PpuState* ppu,
    uint32_t* framebuffer_argb,
    int priority_mask
) {
    int oam_mode = ppu->oam_mode & 0x07;
    int scanline_count = ppu->overscan_mode ? 239 : 224;
    int start_index = ppu->enable_oam_priority ? ((ppu->internal_oam_address & 0x01fcu) >> 2) : 0;
    int i;

    if (!td2_ppu_any_scanline_layer_enabled(ppu, 4)) {
        return;
    }

    for (i = 0; i < 128; i++) {
        int sprite_index = start_index - i - 1;
        int addr;
        int high_table_offset;
        int shift;
        int high_table_value;
        int large_sprite;
        int width_tiles;
        int height_tiles;
        int width;
        int height;
        int sprite_x;
        int sprite_y;
        int tile_index_base;
        int flags;
        int raw_priority;
        bool use_second_table;
        int palette_index;
        bool horizontal_mirror;
        bool vertical_mirror;
        int tile_row;
        int tile_column;
        int y;

        if (sprite_index < 0) {
            sprite_index += 128;
        }

        addr = (sprite_index * 4) & 0x1ff;
        high_table_offset = addr >> 4;
        shift = ((addr >> 2) & 0x03) << 1;
        high_table_value = (ppu->oam[0x200 + high_table_offset] >> shift) & 0x03;
        large_sprite = (high_table_value & 0x02) >> 1;
        width_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][0];
        height_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][1];
        width = width_tiles << 3;
        height = height_tiles << 3;
        sprite_x = (((((high_table_value & 0x01) << 8) | ppu->oam[addr]) << 7) & 0xffff);
        if (sprite_x & 0x8000) {
            sprite_x -= 0x10000;
        }
        sprite_x >>= 7;
        sprite_y = ppu->oam[addr + 1];
        tile_index_base = ppu->oam[addr + 2];
        flags = ppu->oam[addr + 3];

        if ((sprite_x + width) <= 0 || sprite_x > 255) {
            continue;
        }

        {
            int end_y = sprite_y + (ppu->obj_interlace ? (height >> 1) : height);
            if ((end_y >= scanline_count || end_y == 256) && sprite_y >= scanline_count) {
                continue;
            }
        }

        raw_priority = (flags >> 4) & 0x03;
        if (priority_mask >= 0 && ((priority_mask & (1 << raw_priority)) == 0)) {
            continue;
        }

        use_second_table = (flags & 0x01) != 0;
        palette_index = ((flags >> 1) & 0x07) + 8;
        horizontal_mirror = (flags & 0x40) != 0;
        vertical_mirror = (flags & 0x80) != 0;
        tile_row = (tile_index_base & 0xf0) >> 4;
        tile_column = tile_index_base & 0x0f;

        for (y = 0; y < height; y++) {
            int pixel_y;
            int row_offset;
            int y_pos;
            int row;
            int x;

            td2_sprite_vertical_sample(y, height, vertical_mirror, &pixel_y, &row_offset);

            row = (tile_row + row_offset) & 0x0f;
            y_pos = sprite_y + y;
            if (y_pos >= scanline_count) {
                y_pos -= scanline_count;
            }
            if (y_pos < 0 || y_pos >= TD2_FRAME_HEIGHT) {
                continue;
            }
            if (!td2_layer_enabled(td2_ppu_scanline_main_layers(ppu, y_pos), 4)) {
                continue;
            }

            for (x = 0; x < width; x++) {
                int pixel_x;
                int column_offset;
                int x_pos = sprite_x + x;
                int column;
                int tile_index;
                size_t tile_start;
                uint8_t color_index;
                int cgram_index;

                if (horizontal_mirror) {
                    pixel_x = (width - x - 1) & 0x07;
                    column_offset = (width - x - 1) >> 3;
                } else {
                    pixel_x = x & 0x07;
                    column_offset = x >> 3;
                }

                if (x_pos < 0 || x_pos >= TD2_FRAME_WIDTH) {
                    continue;
                }

                column = (tile_column + column_offset) & 0x0f;
                tile_index = (row << 4) | column;
                tile_start = (size_t)(((ppu->oam_base_address +
                                        (tile_index << 4) +
                                        (use_second_table ? ppu->oam_address_offset : 0)) & 0x7fff) << 1);
                color_index = td2_decode_4bpp_tile_pixel(ppu, tile_start, pixel_x, pixel_y);
                if (color_index == 0) {
                    continue;
                }

                cgram_index = (palette_index * 16) + color_index;
                if (cgram_index >= 256) {
                    continue;
                }

                framebuffer_argb[(y_pos * TD2_FRAME_WIDTH) + x_pos] = ppu->cgram_colors[cgram_index];
            }
        }
    }
}

static void td2_render_bg_layer_pass(
    Td2PpuState* ppu,
    uint32_t* framebuffer_argb,
    int layer_index,
    int priority_bit,
    int start_y,
    int end_y
) {
    const Td2PpuLayerState* layer = &ppu->layers[layer_index];
    int bpp = td2_bg_bpp(ppu->bg_mode, layer_index);
    int width_tiles;
    int height_tiles;
    int tile_pixel_size;
    int palette_stride;
    int screen_y;

    if (bpp == 0) {
        return;
    }

    td2_bg_tilemap_size(layer, &width_tiles, &height_tiles);
    tile_pixel_size = layer->large_tiles ? 16 : 8;
    palette_stride = bpp == 2 ? 4 : (bpp == 4 ? 16 : 256);

    if (start_y < 0) {
        start_y = 0;
    }
    if (end_y > TD2_FRAME_HEIGHT) {
        end_y = TD2_FRAME_HEIGHT;
    }
    if (end_y <= start_y) {
        return;
    }

    for (screen_y = start_y; screen_y < end_y; screen_y++) {
        int hscroll;
        int vscroll;
        int world_y;
        int tile_y;
        int pixel_y;
        int screen_x;

        if (!td2_layer_enabled(td2_ppu_scanline_main_layers(ppu, screen_y), layer_index)) {
            continue;
        }

        hscroll = td2_normalize_scroll(td2_ppu_scanline_layer_hscroll(ppu, layer_index, screen_y));
        vscroll = td2_normalize_scroll(td2_ppu_scanline_layer_vscroll(ppu, layer_index, screen_y));
        world_y = (screen_y + vscroll) % (height_tiles * tile_pixel_size);
        tile_y = world_y / tile_pixel_size;
        pixel_y = world_y & (tile_pixel_size - 1);

        for (screen_x = 0; screen_x < TD2_FRAME_WIDTH; screen_x++) {
            int world_x = (screen_x + hscroll) % (width_tiles * tile_pixel_size);
            int tile_x = world_x / tile_pixel_size;
            int pixel_x = world_x & (tile_pixel_size - 1);
            uint16_t entry = td2_bg_read_tilemap_entry(ppu, layer->tilemap_address, width_tiles, tile_x, tile_y);
            int tile_index = entry & 0x03ff;
            int palette_index = (entry >> 10) & 0x07;
            bool tile_priority = (entry & 0x2000U) != 0;
            bool hflip = (entry & 0x4000U) != 0;
            bool vflip = (entry & 0x8000U) != 0;
            const uint8_t* pixels;
            int sample_x;
            int sample_y;
            uint8_t color_index;
            int cgram_index;

            if ((tile_priority ? 1 : 0) != priority_bit) {
                continue;
            }

            if (layer->large_tiles) {
                int full_x = hflip ? (15 - pixel_x) : pixel_x;
                int full_y = vflip ? (15 - pixel_y) : pixel_y;
                tile_index += (full_y >> 3) << 4;
                tile_index += full_x >> 3;
                sample_x = full_x & 0x07;
                sample_y = full_y & 0x07;
            } else {
                sample_x = hflip ? (7 - pixel_x) : pixel_x;
                sample_y = vflip ? (7 - pixel_y) : pixel_y;
            }

            pixels = td2_bg_get_tile_pixels(ppu, layer_index, tile_index, bpp);
            if (pixels == NULL) {
                continue;
            }

            color_index = pixels[(sample_y * 8) + sample_x];
            if (color_index == 0) {
                continue;
            }

            cgram_index = bpp == 8 ? color_index : ((palette_index * palette_stride) + color_index);
            if (cgram_index < 0 || cgram_index >= 256) {
                continue;
            }

            framebuffer_argb[(screen_y * TD2_FRAME_WIDTH) + screen_x] = ppu->cgram_colors[cgram_index];
        }
    }
}

static void td2_render_bg_pass_sequence(
    Td2PpuState* ppu,
    uint32_t* framebuffer_argb,
    const Td2BgRenderPass* passes,
    size_t pass_count,
    int start_y,
    int end_y
) {
    size_t pass_index;

    for (pass_index = 0; pass_index < pass_count; pass_index++) {
        td2_render_bg_layer_pass(
            ppu,
            framebuffer_argb,
            passes[pass_index].layer_index,
            passes[pass_index].priority_bit,
            start_y,
            end_y);
    }
}

static int td2_mode7_clip(int value) {
    return (value & 0x2000) ? (value | ~0x03ff) : (value & 0x03ff);
}

static void td2_render_mode7(Td2PpuState* ppu, uint32_t* framebuffer_argb) {
    int hscroll = td2_sign_extend(ppu->mode7.hscroll, 13);
    int vscroll = td2_sign_extend(ppu->mode7.vscroll, 13);
    int center_x = td2_sign_extend(ppu->mode7.center_x, 13);
    int center_y = td2_sign_extend(ppu->mode7.center_y, 13);
    int matrix_a = td2_sign_extend(ppu->mode7.matrix[0], 16);
    int matrix_b = td2_sign_extend(ppu->mode7.matrix[1], 16);
    int matrix_c = td2_sign_extend(ppu->mode7.matrix[2], 16);
    int matrix_d = td2_sign_extend(ppu->mode7.matrix[3], 16);
    int screen_y;

    for (screen_y = 0; screen_y < TD2_FRAME_HEIGHT; screen_y++) {
        int line_y = screen_y + 1;
        int real_y = ppu->mode7.vertical_mirroring ? (255 - line_y) : line_y;
        int x_value = (((matrix_a * td2_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_b * real_y) & ~63) +
                       ((matrix_b * td2_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_x << 8));
        int y_value = (((matrix_c * td2_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_d * real_y) & ~63) +
                       ((matrix_d * td2_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_y << 8));
        int x_step = matrix_a;
        int y_step = matrix_c;
        int screen_x;

        if (!td2_layer_enabled(td2_ppu_scanline_main_layers(ppu, screen_y), 0)) {
            continue;
        }

        if (ppu->mode7.horizontal_mirroring) {
            x_value += x_step * (TD2_FRAME_WIDTH - 1);
            y_value += y_step * (TD2_FRAME_WIDTH - 1);
            x_step = -x_step;
            y_step = -y_step;
        }

        for (screen_x = 0; screen_x < TD2_FRAME_WIDTH; screen_x++) {
            int x_offset = x_value >> 8;
            int y_offset = y_value >> 8;
            uint8_t tile_index = 0;
            int pixel_word_index;
            int color_index;

            x_value += x_step;
            y_value += y_step;

            if (!ppu->mode7.large_map) {
                x_offset &= 0x03ff;
                y_offset &= 0x03ff;
            } else if (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff) {
                if (!ppu->mode7.fill_with_tile0) {
                    continue;
                }
            }

            if (!(ppu->mode7.large_map && (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff))) {
                int tile_word_index = ((y_offset & ~0x07) << 4) | (x_offset >> 3);
                tile_index = (uint8_t)(td2_vram_read_word(ppu, tile_word_index) & 0x00ffU);
            }

            pixel_word_index = (tile_index << 6) + ((y_offset & 0x07) << 3) + (x_offset & 0x07);
            color_index = (int)((td2_vram_read_word(ppu, pixel_word_index) >> 8) & 0x00ffU);
            if (color_index == 0 || color_index >= 256) {
                continue;
            }

            framebuffer_argb[(screen_y * TD2_FRAME_WIDTH) + screen_x] = ppu->cgram_colors[color_index];
        }
    }
}

static void td2_render_mode7_objects_ppu_accurate(
    const Td2PpuState* ppu,
    uint32_t* framebuffer_argb
) {
    int oam_mode = ppu->oam_mode & 0x07;
    int start_index = ppu->enable_oam_priority ? ((ppu->internal_oam_address & 0x01fcu) >> 2) : 0;
    int odd_frame = ppu->ppu_frame_count & 0x01;
    int scanline;

    if (!td2_ppu_any_scanline_layer_enabled(ppu, 4)) {
        return;
    }

    for (scanline = 0; scanline < TD2_FRAME_HEIGHT; scanline++) {
        int visible_indices[32];
        int visible_count = 0;
        int oam_eval_index = start_index;
        uint8_t sprite_priority[TD2_FRAME_WIDTH];
        uint8_t sprite_palette[TD2_FRAME_WIDTH];
        uint8_t sprite_color[TD2_FRAME_WIDTH];
        int sprite_tile_count = 0;
        bool stop_fetch = false;
        int i;

        memset(sprite_priority, 0xff, sizeof(sprite_priority));
        memset(sprite_palette, 0, sizeof(sprite_palette));
        memset(sprite_color, 0, sizeof(sprite_color));

        if (!td2_layer_enabled(td2_ppu_scanline_main_layers(ppu, scanline), 4)) {
            continue;
        }

        for (i = 0; i < 128; i++) {
            int addr = (oam_eval_index << 2) & 0x01ff;
            int high_table_value = ppu->oam[0x200 + (oam_eval_index >> 2)] >> ((oam_eval_index << 1) & 0x06);
            int large_sprite = (high_table_value & 0x02) >> 1;
            int width_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][0];
            int height_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][1];
            int width = width_tiles << 3;
            int height = height_tiles << 3;
            int sprite_x = td2_sprite_x_from_oam(ppu, addr, high_table_value);
            int sprite_y = ppu->oam[addr + 1];

            if (td2_sprite_scanline_visible(scanline, sprite_x, sprite_y, width, height, ppu->obj_interlace)) {
                if (visible_count < 32) {
                    visible_indices[visible_count++] = oam_eval_index;
                } else {
                    break;
                }
            }

            oam_eval_index = (oam_eval_index + 1) & 0x7f;
        }

        for (i = visible_count - 1; i >= 0; i--) {
            int sprite_index = visible_indices[i];
            int addr = (sprite_index << 2) & 0x01ff;
            int high_table_value = ppu->oam[0x200 + (sprite_index >> 2)] >> ((sprite_index << 1) & 0x06);
            int large_sprite = (high_table_value & 0x02) >> 1;
            int width_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][0];
            int height_tiles = TD2_OAM_SIZE_TABLE[oam_mode][large_sprite][1];
            int width = width_tiles << 3;
            int height = height_tiles << 3;
            int sprite_x = td2_sprite_x_from_oam(ppu, addr, high_table_value);
            int sprite_y = ppu->oam[addr + 1];
            int tile_index_base = ppu->oam[addr + 2];
            int flags = ppu->oam[addr + 3];
            bool use_second_table = (flags & 0x01) != 0;
            int palette_index = (flags >> 1) & 0x07;
            int raw_priority = (flags >> 4) & 0x03;
            bool horizontal_mirror = (flags & 0x40) != 0;
            bool vertical_mirror = (flags & 0x80) != 0;
            int column_count = width / 8;
            int column_offset = column_count;
            int y_gap = scanline - sprite_y;

            if (sprite_x <= -8 && sprite_x != -256) {
                column_offset += sprite_x / 8;
            }
            if (column_offset <= 0) {
                continue;
            }

            if (ppu->obj_interlace) {
                y_gap = (y_gap << 1) | odd_frame;
            }

            while (column_offset > 0) {
                int y_offset;
                int row_offset;
                int tile_row;
                int tile_column;
                int row;
                int tile_column_offset;
                int tile_index;
                int fetch_address;
                int x_base;
                int end_tile_x;
                int draw_x;
                uint16_t chr_low;
                uint16_t chr_high;
                int pixel;

                sprite_tile_count++;
                if (sprite_tile_count > 34) {
                    stop_fetch = true;
                    break;
                }

                column_offset--;
                td2_sprite_vertical_sample(y_gap, height, vertical_mirror, &y_offset, &row_offset);

                tile_row = (tile_index_base & 0xf0) >> 4;
                tile_column = tile_index_base & 0x0f;
                row = (tile_row + row_offset) & 0x0f;
                tile_column_offset = horizontal_mirror ? column_offset : (column_count - column_offset - 1);
                tile_index = (row << 4) | ((tile_column + tile_column_offset) & 0x0f);
                fetch_address = (ppu->oam_base_address +
                                 (tile_index << 4) +
                                 (use_second_table ? ppu->oam_address_offset : 0) +
                                 y_offset) & 0x7fff;

                x_base = sprite_x == -256 ? 0 : sprite_x;
                end_tile_x = x_base + ((column_count - column_offset - 1) << 3) + 8;
                draw_x = sprite_x + ((column_count - column_offset - 1) << 3);

                chr_low = td2_vram_read_word(ppu, fetch_address);
                chr_high = td2_vram_read_word(ppu, fetch_address + 8);
                for (pixel = 0; pixel < 8; pixel++) {
                    int x_pos = draw_x + pixel;
                    int x_offset = horizontal_mirror ? ((7 - pixel) & 0x07) : pixel;
                    uint8_t color;

                    if (x_pos < 0 || x_pos >= TD2_FRAME_WIDTH) {
                        continue;
                    }

                    color = td2_decode_sprite_row_pixel(chr_low, chr_high, 7 - x_offset);
                    if (color != 0) {
                        sprite_color[x_pos] = color;
                        sprite_palette[x_pos] = (uint8_t)palette_index;
                        sprite_priority[x_pos] = (uint8_t)raw_priority;
                    }
                }

                if (column_offset == 0 || end_tile_x >= 256) {
                    break;
                }
            }

            if (stop_fetch) {
                break;
            }
        }

        for (i = 0; i < TD2_FRAME_WIDTH; i++) {
            int raw_priority = sprite_priority[i];
            int sprite_priority_value;
            int cgram_index;

            if (raw_priority < 1 || raw_priority > 3) {
                continue;
            }

            sprite_priority_value = TD2_MODE7_SPRITE_PRIORITIES[raw_priority];
            if (sprite_priority_value <= 3) {
                continue;
            }

            cgram_index = 128 + ((int)sprite_palette[i] << 4) + (int)sprite_color[i];
            if (cgram_index < 0 || cgram_index >= 256) {
                continue;
            }

            framebuffer_argb[(scanline * TD2_FRAME_WIDTH) + i] = ppu->cgram_colors[cgram_index];
        }
    }
}

void td2_ppu_reset(Td2PpuState* ppu) {
    memset(ppu, 0, sizeof(*ppu));
    ppu->brightness = 15U;
}

void td2_ppu_seed_from_design_pack(Td2PpuState* ppu, const Td2DesignPack* pack) {
    size_t i;

    td2_ppu_reset(ppu);

    ppu->bg_mode = pack->bg_mode;
    ppu->main_screen_layers = pack->main_screen_layers;
    ppu->sub_screen_layers = pack->sub_screen_layers;
    ppu->brightness = pack->brightness;
    ppu->forced_blank = pack->forced_blank;
    ppu->mode1_bg3_priority = pack->mode1_bg3_priority;
    ppu->mode7 = pack->mode7;
    ppu->oam_mode = pack->oam_mode;
    ppu->oam_base_address = pack->oam_base_address;
    ppu->oam_address_offset = pack->oam_address_offset;
    ppu->internal_oam_address = pack->internal_oam_address;
    ppu->ppu_frame_count = pack->ppu_frame_count;
    ppu->enable_oam_priority = pack->enable_oam_priority;
    ppu->obj_interlace = pack->obj_interlace;
    ppu->overscan_mode = pack->overscan_mode;
    ppu->frame_number = pack->frame_number;
    ppu->has_reference_frame = pack->main_visible.pixels != NULL;
    memcpy(ppu->layers, pack->layers, sizeof(ppu->layers));

    if (pack->vram != NULL && pack->vram_size > 0U) {
        memcpy(ppu->vram, pack->vram, pack->vram_size < TD2_VRAM_BYTES ? pack->vram_size : TD2_VRAM_BYTES);
    }
    if (pack->cgram != NULL && pack->cgram_size > 0U) {
        memcpy(ppu->cgram, pack->cgram, pack->cgram_size < TD2_CGRAM_BYTES ? pack->cgram_size : TD2_CGRAM_BYTES);
    }
    if (pack->oam != NULL && pack->oam_size > 0U) {
        memcpy(ppu->oam, pack->oam, pack->oam_size < TD2_OAM_BYTES ? pack->oam_size : TD2_OAM_BYTES);
    }

    for (i = 0; i < 256; i++) {
        size_t offset = i * 2U;
        uint16_t value = (uint16_t)ppu->cgram[offset] | (uint16_t)(ppu->cgram[offset + 1U] << 8);
        ppu->cgram_colors[i] = td2_cgram_word_to_argb(value, ppu->brightness);
    }

    memset(ppu->tile_cache_valid, 0, sizeof(ppu->tile_cache_valid));
}

void td2_ppu_render_frame(Td2PpuState* ppu, uint32_t* framebuffer_argb) {
    uint32_t backdrop = ppu->cgram_colors[0];
    size_t i;

    if (ppu->forced_blank) {
        memset(framebuffer_argb, 0, TD2_FRAME_PIXELS * sizeof(*framebuffer_argb));
        return;
    }

    for (i = 0; i < TD2_FRAME_PIXELS; i++) {
        framebuffer_argb[i] = backdrop;
    }

    if (ppu->bg_mode == 7) {
        if (td2_ppu_any_scanline_layer_enabled(ppu, 0)) {
            td2_render_mode7(ppu, framebuffer_argb);
        }
        if (td2_ppu_any_scanline_layer_enabled(ppu, 4)) {
            td2_render_mode7_objects_ppu_accurate(ppu, framebuffer_argb);
        }
        return;
    }

    if (ppu->composition_profile.enabled &&
        ppu->composition_profile.bg3_above_bg2_top_scanlines > 0U) {
        int top_scanlines = (int)ppu->composition_profile.bg3_above_bg2_top_scanlines;
        size_t pass_count = sizeof(TD2_BG_RENDER_PASSES_DEFAULT) / sizeof(TD2_BG_RENDER_PASSES_DEFAULT[0]);

        if (top_scanlines > TD2_FRAME_HEIGHT) {
            top_scanlines = TD2_FRAME_HEIGHT;
        }

        td2_render_bg_pass_sequence(
            ppu,
            framebuffer_argb,
            TD2_BG_RENDER_PASSES_BG3_ABOVE_BG2,
            pass_count,
            0,
            top_scanlines);
        td2_render_bg_pass_sequence(
            ppu,
            framebuffer_argb,
            TD2_BG_RENDER_PASSES_DEFAULT,
            pass_count,
            top_scanlines,
            TD2_FRAME_HEIGHT);
    } else {
        td2_render_bg_pass_sequence(
            ppu,
            framebuffer_argb,
            TD2_BG_RENDER_PASSES_DEFAULT,
            sizeof(TD2_BG_RENDER_PASSES_DEFAULT) / sizeof(TD2_BG_RENDER_PASSES_DEFAULT[0]),
            0,
            TD2_FRAME_HEIGHT);
    }

    if (td2_ppu_any_scanline_layer_enabled(ppu, 4)) {
        td2_render_objects(ppu, framebuffer_argb, -1);
    }
}
