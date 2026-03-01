#include "td2_ppu.h"
#include "td2_io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

/* Forward declarations for internal helpers. */
static uint16_t snes_bg_read_tilemap_entry(const SnesBgScene *scene, int base_word, int width_tiles, int tile_x, int tile_y);
static uint16_t snes_vram_read_word(const SnesBgScene *scene, int word_index);
static const uint8_t *snes_bg_get_tile_pixels(SnesBgScene *scene, int layer_index, int tile_index, int bpp);
static int snes_mode7_clip(int value);
static void render_snes_mode7_scene(AppState *app);
static uint8_t snes_decode_4bpp_tile_pixel(const SnesBgScene *scene, size_t tile_start, int pixel_x, int pixel_y);
static uint8_t snes_decode_sprite_row_pixel(uint16_t chr_low, uint16_t chr_high, int shift);
static void render_snes_mode7_objects_ppu_accurate(AppState *app);

uint32_t snes_cgram_word_to_argb(uint16_t word) {
    int red = word & 0x1fu;
    int green = (word >> 5) & 0x1fu;
    int blue = (word >> 10) & 0x1fu;
    uint8_t red8 = (uint8_t)((red << 3) | (red >> 2));
    uint8_t green8 = (uint8_t)((green << 3) | (green >> 2));
    uint8_t blue8 = (uint8_t)((blue << 3) | (blue >> 2));

    return 0xff000000u |
           ((uint32_t)red8 << 16) |
           ((uint32_t)green8 << 8) |
           (uint32_t)blue8;
}

void snes_bg_scene_free(SnesBgScene *scene) {
    free(scene->vram);
    free(scene->cgram);
    free(scene->oam);
    scene->vram = NULL;
    scene->cgram = NULL;
    scene->oam = NULL;
    scene->vram_size = 0;
    scene->cgram_size = 0;
    scene->oam_size = 0;
    scene->loaded = false;
    memset(scene->cgram_colors, 0, sizeof(scene->cgram_colors));
    memset(scene->layers, 0, sizeof(scene->layers));
    memset(scene->mode7_matrix, 0, sizeof(scene->mode7_matrix));
    scene->mode7_fill_with_tile0 = false;
    scene->mode7_horizontal_mirroring = false;
    scene->mode7_vertical_mirroring = false;
    scene->mode7_large_map = false;
    scene->mode7_center_x = 0;
    scene->mode7_center_y = 0;
    scene->mode7_hscroll = 0;
    scene->mode7_vscroll = 0;
    scene->oam_mode = 0;
    scene->oam_base_address = 0;
    scene->oam_address_offset = 0;
    scene->internal_oam_address = 0;
    scene->frame_count = 0;
    scene->enable_oam_priority = false;
    scene->obj_interlace = false;
    scene->overscan_mode = false;
    memset(scene->tile_cache_valid, 0, sizeof(scene->tile_cache_valid));
    free(scene->scanline_params);
    scene->scanline_params = NULL;
    scene->scanline_param_count = 0;
}

static bool snes_bg_scene_load_state_json(const char *path, SnesBgScene *scene) {
    char *json = NULL;
    size_t json_size = 0;
    bool ok = false;

    if (!read_entire_file(path, &json, &json_size)) {
        return false;
    }

    if (!json_parse_int(json, "ppu.bgMode", &scene->bg_mode) ||
        !json_parse_int(json, "ppu.mainScreenLayers", &scene->main_screen_layers)) {
        goto cleanup;
    }

    (void)json_try_parse_bool(json, "ppu.mode7.fillWithTile0", &scene->mode7_fill_with_tile0);
    (void)json_try_parse_bool(json, "ppu.mode7.horizontalMirroring", &scene->mode7_horizontal_mirroring);
    (void)json_try_parse_bool(json, "ppu.mode7.verticalMirroring", &scene->mode7_vertical_mirroring);
    (void)json_try_parse_bool(json, "ppu.mode7.largeMap", &scene->mode7_large_map);
    (void)json_try_parse_int(json, "ppu.mode7.centerX", &scene->mode7_center_x);
    (void)json_try_parse_int(json, "ppu.mode7.centerY", &scene->mode7_center_y);
    (void)json_try_parse_int(json, "ppu.mode7.hscroll", &scene->mode7_hscroll);
    (void)json_try_parse_int(json, "ppu.mode7.vscroll", &scene->mode7_vscroll);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[0]", &scene->mode7_matrix[0]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[1]", &scene->mode7_matrix[1]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[2]", &scene->mode7_matrix[2]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[3]", &scene->mode7_matrix[3]);
    (void)json_try_parse_int(json, "ppu.oamMode", &scene->oam_mode);
    (void)json_try_parse_int(json, "ppu.oamBaseAddress", &scene->oam_base_address);
    (void)json_try_parse_int(json, "ppu.oamAddressOffset", &scene->oam_address_offset);
    (void)json_try_parse_int(json, "ppu.internalOamAddress", &scene->internal_oam_address);
    (void)json_try_parse_int(json, "ppu.frameCount", &scene->frame_count);
    (void)json_try_parse_bool(json, "ppu.enableOamPriority", &scene->enable_oam_priority);
    (void)json_try_parse_bool(json, "ppu.objInterlace", &scene->obj_interlace);
    (void)json_try_parse_bool(json, "ppu.overscanMode", &scene->overscan_mode);

    for (int layer_index = 0; layer_index < 3; layer_index++) {
        char key[64];
        SnesBgLayerState *layer = &scene->layers[layer_index];

        snprintf(key, sizeof(key), "ppu.layers[%d].tilemapAddress", layer_index);
        if (!json_parse_int(json, key, &layer->tilemap_address)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].chrAddress", layer_index);
        if (!json_parse_int(json, key, &layer->chr_address)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].doubleWidth", layer_index);
        if (!json_parse_bool(json, key, &layer->double_width)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].doubleHeight", layer_index);
        if (!json_parse_bool(json, key, &layer->double_height)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].largeTiles", layer_index);
        if (!json_parse_bool(json, key, &layer->large_tiles)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].hscroll", layer_index);
        if (!json_parse_int(json, key, &layer->hscroll)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].vscroll", layer_index);
        if (!json_parse_int(json, key, &layer->vscroll)) {
            goto cleanup;
        }
    }

    ok = true;

cleanup:
    free(json);
    (void)json_size;
    return ok;
}

bool snes_bg_scene_load(
    const char *vram_path,
    const char *cgram_path,
    const char *state_path,
    const char *oam_path,
    SnesBgScene *scene
) {
    char *vram_data = NULL;
    size_t vram_size = 0;
    char *cgram_data = NULL;
    size_t cgram_size = 0;
    char *oam_data = NULL;
    size_t oam_size = 0;
    char *derived_oam_path = NULL;
    const char *load_oam_path = oam_path;
    bool ok = false;

    if (!read_entire_file(vram_path, &vram_data, &vram_size)) {
        return false;
    }
    if (!read_entire_file(cgram_path, &cgram_data, &cgram_size)) {
        free(vram_data);
        return false;
    }
    if (vram_size != 0x10000u) {
        fprintf(stderr, "error: expected 65536-byte VRAM dump in %s, got %zu bytes\n", vram_path, vram_size);
        goto cleanup;
    }
    if (cgram_size != 0x0200u) {
        fprintf(stderr, "error: expected 512-byte CGRAM dump in %s, got %zu bytes\n", cgram_path, cgram_size);
        goto cleanup;
    }

    snes_bg_scene_free(scene);
    scene->vram = (uint8_t *)vram_data;
    scene->cgram = (uint8_t *)cgram_data;
    scene->vram_size = vram_size;
    scene->cgram_size = cgram_size;
    vram_data = NULL;
    cgram_data = NULL;

    if (!load_oam_path) {
        derived_oam_path = resolve_sibling_path(vram_path, "oam.bin");
        if (derived_oam_path && path_exists(derived_oam_path)) {
            load_oam_path = derived_oam_path;
        }
    }

    if (load_oam_path) {
        if (!read_entire_file(load_oam_path, &oam_data, &oam_size)) {
            if (oam_path) {
                goto cleanup;
            }
            oam_data = NULL;
            oam_size = 0;
        } else if (oam_size != 0x0220u) {
            fprintf(stderr, "error: expected 544-byte OAM dump in %s, got %zu bytes\n", load_oam_path, oam_size);
            goto cleanup;
        } else {
            scene->oam = (uint8_t *)oam_data;
            scene->oam_size = oam_size;
            oam_data = NULL;
        }
    }

    if (!snes_bg_scene_load_state_json(state_path, scene)) {
        goto cleanup;
    }

    for (size_t i = 0; i < 256; i++) {
        size_t offset = i * 2u;
        uint16_t value = (uint16_t)scene->cgram[offset] | (uint16_t)(scene->cgram[offset + 1u] << 8);
        uint8_t red = (uint8_t)(value & 0x1fu);
        uint8_t green = (uint8_t)((value >> 5) & 0x1fu);
        uint8_t blue = (uint8_t)((value >> 10) & 0x1fu);
        uint8_t rgb_red = (uint8_t)((red << 3) | (red >> 2));
        uint8_t rgb_green = (uint8_t)((green << 3) | (green >> 2));
        uint8_t rgb_blue = (uint8_t)((blue << 3) | (blue >> 2));

        scene->cgram_colors[i] = 0xff000000u |
                                 ((uint32_t)rgb_red << 16) |
                                 ((uint32_t)rgb_green << 8) |
                                 (uint32_t)rgb_blue;
    }

    memset(scene->tile_cache_valid, 0, sizeof(scene->tile_cache_valid));
    scene->loaded = true;
    ok = true;

cleanup:
    if (!ok) {
        snes_bg_scene_free(scene);
    }
    free(vram_data);
    free(cgram_data);
    free(oam_data);
    free(derived_oam_path);
    return ok;
}

static int snes_bg_bpp(int bg_mode, int layer_index) {
    switch (bg_mode) {
        case 0:
            return 2;
        case 1:
            return layer_index == 2 ? 2 : 4;
        case 2:
            return 4;
        case 3:
            return layer_index == 0 ? 8 : 4;
        case 4:
            return layer_index == 0 ? 8 : 2;
        case 5:
            return layer_index == 0 ? 4 : 2;
        case 6:
            return layer_index == 0 ? 4 : 0;
        default:
            return 0;
    }
}

static bool snes_layer_enabled(int layer_mask, int layer_index) {
    return (layer_mask & (1 << layer_index)) != 0;
}

static int snes_normalize_scroll(int value) {
    value &= 0x03ff;
    return value == 0x03ff ? 0 : value;
}

static int snes_sign_extend(int value, int bits) {
    int sign_bit = 1 << (bits - 1);
    int full_range = 1 << bits;
    int masked = value & (full_range - 1);

    return (masked & sign_bit) ? (masked - full_range) : masked;
}

static void snes_bg_tilemap_size(const SnesBgLayerState *layer, int *out_width_tiles, int *out_height_tiles) {
    *out_width_tiles = layer->double_width ? 64 : 32;
    *out_height_tiles = layer->double_height ? 64 : 32;
}

static void snes_decode_tile(const uint8_t *tile_data, int bpp, uint8_t *out_pixels) {
    for (int y = 0; y < 8; y++) {
        for (int x = 0; x < 8; x++) {
            int bit = 7 - x;
            uint8_t color = 0;

            for (int plane_pair = 0; plane_pair < bpp; plane_pair += 2) {
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

static int snes_sprite_x_from_oam(const SnesBgScene *scene, int addr, int high_table_value) {
    int raw = ((((high_table_value & 0x01) << 8) | scene->oam[addr]) & 0x01ff);
    return (raw & 0x0100) ? (raw - 0x0200) : raw;
}

static bool snes_sprite_scanline_visible(int scanline, int sprite_x, int sprite_y, int width, int height, bool interlace) {
    int end_y = 0;

    if (sprite_x != -256 && ((sprite_x + width) <= 0 || sprite_x > 255)) {
        return false;
    }

    end_y = sprite_y + (interlace ? (height >> 1) : height);
    return ((scanline >= sprite_y && scanline < end_y) ||
            (((end_y & 0x00ff) < sprite_y) && (scanline < (end_y & 0x00ff))));
}

static void render_snes_objects(AppState *app, int priority_mask) {
    const SnesBgScene *scene = &app->snes_bg_scene;
    int oam_mode = scene->oam_mode & 0x07;
    int scanline_count = scene->overscan_mode ? 239 : 224;
    int start_index = scene->enable_oam_priority ? ((scene->internal_oam_address & 0x01fcu) >> 2) : 0;

    if (!scene->oam || scene->oam_size < 0x220u) {
        return;
    }

    for (int i = 0; i < 128; i++) {
        int sprite_index = start_index - i - 1;
        int addr = 0;
        int high_table_offset = 0;
        int shift = 0;
        int high_table_value = 0;
        int large_sprite = 0;
        int width_tiles = 0;
        int height_tiles = 0;
        int width = 0;
        int height = 0;
        int sprite_x = 0;
        int sprite_y = 0;
        int tile_index_base = 0;
        int flags = 0;
        int raw_priority = 0;
        int palette_index = 0;
        bool horizontal_mirror = false;
        bool vertical_mirror = false;
        bool use_second_table = false;
        int tile_row = 0;
        int tile_column = 0;

        if (sprite_index < 0) {
            sprite_index += 128;
        }

        addr = (sprite_index * 4) & 0x1ff;
        high_table_offset = addr >> 4;
        shift = ((addr >> 2) & 0x03) << 1;
        high_table_value = (scene->oam[0x200 + high_table_offset] >> shift) & 0x03;
        large_sprite = (high_table_value & 0x02) >> 1;
        width_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][0];
        height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][1];
        width = width_tiles << 3;
        height = height_tiles << 3;
        sprite_x = (((((high_table_value & 0x01) << 8) | scene->oam[addr]) << 7) & 0xffff);
        if (sprite_x & 0x8000) {
            sprite_x -= 0x10000;
        }
        sprite_x >>= 7;
        sprite_y = scene->oam[addr + 1];
        tile_index_base = scene->oam[addr + 2];
        flags = scene->oam[addr + 3];

        if ((sprite_x + width) <= 0 || sprite_x > 255) {
            continue;
        }

        {
            int end_y = sprite_y + (scene->obj_interlace ? (height >> 1) : height);
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

        for (int y = 0; y < height; y++) {
            int pixel_y = 0;
            int row_offset = 0;
            int y_pos = 0;

            if (vertical_mirror) {
                int pos = y < width ? (width - 1 - y) : (width * 3 - 1 - y);
                pixel_y = pos & 0x07;
                row_offset = pos >> 3;
            } else {
                pixel_y = y & 0x07;
                row_offset = y >> 3;
            }

            y_pos = sprite_y + y;
            if (y_pos >= scanline_count) {
                y_pos -= scanline_count;
            }
            if (y_pos < 0 || y_pos >= SCREEN_HEIGHT) {
                continue;
            }

            for (int x = 0; x < width; x++) {
                int pixel_x = 0;
                int column_offset = 0;
                int x_pos = sprite_x + x;
                int column = 0;
                int row = 0;
                int tile_index = 0;
                size_t tile_start = 0;
                uint8_t color_index = 0;
                int cgram_index = 0;

                if (horizontal_mirror) {
                    pixel_x = (width - x - 1) & 0x07;
                    column_offset = (width - x - 1) >> 3;
                } else {
                    pixel_x = x & 0x07;
                    column_offset = x >> 3;
                }

                if (x_pos < 0 || x_pos >= SCREEN_WIDTH) {
                    continue;
                }

                row = (tile_row + row_offset) & 0x0f;
                column = (tile_column + column_offset) & 0x0f;
                tile_index = (row << 4) | column;
                tile_start = (size_t)(((scene->oam_base_address +
                                        (tile_index << 4) +
                                        (use_second_table ? scene->oam_address_offset : 0)) & 0x7fff) << 1);
                color_index = snes_decode_4bpp_tile_pixel(scene, tile_start, pixel_x, pixel_y);
                if (color_index == 0) {
                    continue;
                }

                cgram_index = (palette_index * 16) + color_index;
                if (cgram_index >= 256) {
                    continue;
                }

                app->framebuffer[(y_pos * SCREEN_WIDTH) + x_pos] = scene->cgram_colors[cgram_index];
            }
        }
    }
}

void render_snes_bg_scene(AppState *app) {
    SnesBgScene *scene = &app->snes_bg_scene;
    uint32_t backdrop = scene->cgram_colors[0];

    for (int i = 0; i < (SCREEN_WIDTH * SCREEN_HEIGHT); i++) {
        app->framebuffer[i] = backdrop;
    }

    if (scene->bg_mode == 7) {
        if (snes_layer_enabled(scene->main_screen_layers, 0)) {
            render_snes_mode7_scene(app);
        }
        if (snes_layer_enabled(scene->main_screen_layers, 4)) {
            render_snes_mode7_objects_ppu_accurate(app);
        }
        return;
    }

    for (int layer_index = 2; layer_index >= 0; layer_index--) {
        SnesBgLayerState *layer = &scene->layers[layer_index];
        int bpp = snes_bg_bpp(scene->bg_mode, layer_index);
        int width_tiles = 0;
        int height_tiles = 0;
        int palette_stride = 0;
        int hscroll = 0;
        int vscroll = 0;

        if (!snes_layer_enabled(scene->main_screen_layers, layer_index) || bpp == 0) {
            continue;
        }

        snes_bg_tilemap_size(layer, &width_tiles, &height_tiles);
        palette_stride = bpp == 2 ? 4 : (bpp == 4 ? 16 : 256);
        hscroll = snes_normalize_scroll(layer->hscroll);
        vscroll = snes_normalize_scroll(layer->vscroll);

        for (int screen_y = 0; screen_y < SCREEN_HEIGHT; screen_y++) {
            int world_y = (screen_y + vscroll) % (height_tiles * 8);
            int tile_y = world_y / 8;
            int pixel_y = world_y & 7;

            for (int screen_x = 0; screen_x < SCREEN_WIDTH; screen_x++) {
                int world_x = (screen_x + hscroll) % (width_tiles * 8);
                int tile_x = world_x / 8;
                int pixel_x = world_x & 7;
                uint16_t entry = snes_bg_read_tilemap_entry(scene, layer->tilemap_address, width_tiles, tile_x, tile_y);
                int tile_index = entry & 0x03ff;
                int palette_index = (entry >> 10) & 0x07;
                bool hflip = (entry & 0x4000u) != 0;
                bool vflip = (entry & 0x8000u) != 0;
                const uint8_t *pixels = snes_bg_get_tile_pixels(scene, layer_index, tile_index, bpp);
                int sample_x = hflip ? (7 - pixel_x) : pixel_x;
                int sample_y = vflip ? (7 - pixel_y) : pixel_y;
                uint8_t color_index = 0;
                int cgram_index = 0;

                if (!pixels) {
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

                app->framebuffer[(screen_y * SCREEN_WIDTH) + screen_x] = scene->cgram_colors[cgram_index];
            }
        }
    }

    if (snes_layer_enabled(scene->main_screen_layers, 4)) {
        render_snes_objects(app, -1);
    }
}

static uint16_t snes_bg_read_tilemap_entry(const SnesBgScene *scene, int base_word, int width_tiles, int tile_x, int tile_y) {
    int block_x = 0;
    int block_y = 0;
    int local_x = 0;
    int local_y = 0;
    size_t entry_offset = 0;

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
    entry_offset = (size_t)(base_word + (block_x * 0x0400) + (block_y * 0x0800) + (local_y * 32) + local_x) * 2u;

    if ((entry_offset + 1u) >= scene->vram_size) {
        return 0;
    }

    return (uint16_t)scene->vram[entry_offset] | (uint16_t)(scene->vram[entry_offset + 1u] << 8);
}

static uint16_t snes_vram_read_word(const SnesBgScene *scene, int word_index) {
    size_t byte_offset = (size_t)word_index * 2u;

    if (word_index < 0 || (byte_offset + 1u) >= scene->vram_size) {
        return 0;
    }

    return (uint16_t)scene->vram[byte_offset] | (uint16_t)(scene->vram[byte_offset + 1u] << 8);
}

static const uint8_t *snes_bg_get_tile_pixels(SnesBgScene *scene, int layer_index, int tile_index, int bpp) {
    SnesBgLayerState *layer = &scene->layers[layer_index];
    size_t tile_size = (size_t)bpp * 8u;
    size_t start = ((size_t)layer->chr_address * 2u) + ((size_t)tile_index * tile_size);

    if (tile_index < 0 || tile_index >= 1024) {
        return NULL;
    }

    if (!scene->tile_cache_valid[layer_index][tile_index]) {
        if ((start + tile_size) > scene->vram_size) {
            memset(scene->tile_cache[layer_index][tile_index], 0, 64u);
        } else {
            snes_decode_tile(&scene->vram[start], bpp, scene->tile_cache[layer_index][tile_index]);
        }
        scene->tile_cache_valid[layer_index][tile_index] = 1u;
    }

    return scene->tile_cache[layer_index][tile_index];
}

static int snes_mode7_clip(int value) {
    return (value & 0x2000) ? (value | ~0x03ff) : (value & 0x03ff);
}

static void render_snes_mode7_scene(AppState *app) {
    const SnesBgScene *scene = &app->snes_bg_scene;
    int hscroll = snes_sign_extend(scene->mode7_hscroll, 13);
    int vscroll = snes_sign_extend(scene->mode7_vscroll, 13);
    int center_x = snes_sign_extend(scene->mode7_center_x, 13);
    int center_y = snes_sign_extend(scene->mode7_center_y, 13);
    int matrix_a = snes_sign_extend(scene->mode7_matrix[0], 16);
    int matrix_b = snes_sign_extend(scene->mode7_matrix[1], 16);
    int matrix_c = snes_sign_extend(scene->mode7_matrix[2], 16);
    int matrix_d = snes_sign_extend(scene->mode7_matrix[3], 16);

    for (int screen_y = 0; screen_y < SCREEN_HEIGHT; screen_y++) {
        int real_y = scene->mode7_vertical_mirroring ? (255 - screen_y) : screen_y;
        int x_value = (((matrix_a * snes_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_b * real_y) & ~63) +
                       ((matrix_b * snes_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_x << 8));
        int y_value = (((matrix_c * snes_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_d * real_y) & ~63) +
                       ((matrix_d * snes_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_y << 8));
        int x_step = matrix_a;
        int y_step = matrix_c;

        if (scene->mode7_horizontal_mirroring) {
            x_value += x_step * (SCREEN_WIDTH - 1);
            y_value += y_step * (SCREEN_WIDTH - 1);
            x_step = -x_step;
            y_step = -y_step;
        }

        for (int screen_x = 0; screen_x < SCREEN_WIDTH; screen_x++) {
            int x_offset = x_value >> 8;
            int y_offset = y_value >> 8;
            uint8_t tile_index = 0;
            int pixel_word_index = 0;
            int color_index = 0;

            x_value += x_step;
            y_value += y_step;

            if (!scene->mode7_large_map) {
                x_offset &= 0x03ff;
                y_offset &= 0x03ff;
            } else if (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff) {
                if (!scene->mode7_fill_with_tile0) {
                    continue;
                }
            }

            if (!(scene->mode7_large_map && (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff))) {
                int tile_word_index = ((y_offset & ~0x07) << 4) | (x_offset >> 3);
                tile_index = (uint8_t)(snes_vram_read_word(scene, tile_word_index) & 0x00ffu);
            }

            pixel_word_index = (tile_index << 6) + ((y_offset & 0x07) << 3) + (x_offset & 0x07);
            color_index = (int)((snes_vram_read_word(scene, pixel_word_index) >> 8) & 0x00ffu);
            if (color_index == 0 || color_index >= 256) {
                continue;
            }

            app->framebuffer[(screen_y * SCREEN_WIDTH) + screen_x] = scene->cgram_colors[color_index];
        }
    }
}

static uint8_t snes_decode_4bpp_tile_pixel(const SnesBgScene *scene, size_t tile_start, int pixel_x, int pixel_y) {
    size_t row_start = tile_start + (size_t)(pixel_y * 2);
    int bit = 7 - pixel_x;
    uint8_t plane0 = 0;
    uint8_t plane1 = 0;
    uint8_t plane2 = 0;
    uint8_t plane3 = 0;

    if ((row_start + 17u) >= scene->vram_size) {
        return 0;
    }

    plane0 = (uint8_t)((scene->vram[row_start] >> bit) & 1u);
    plane1 = (uint8_t)((scene->vram[row_start + 1u] >> bit) & 1u);
    plane2 = (uint8_t)((scene->vram[row_start + 16u] >> bit) & 1u);
    plane3 = (uint8_t)((scene->vram[row_start + 17u] >> bit) & 1u);
    return (uint8_t)(plane0 | (plane1 << 1) | (plane2 << 2) | (plane3 << 3));
}

static uint8_t snes_decode_sprite_row_pixel(uint16_t chr_low, uint16_t chr_high, int shift) {
    uint8_t color = (uint8_t)((chr_low >> shift) & 0x01u);
    color |= (uint8_t)((chr_low >> (7 + shift)) & 0x02u);
    color |= (uint8_t)(((chr_high >> shift) & 0x01u) << 2);
    color |= (uint8_t)(((chr_high >> (7 + shift)) & 0x02u) << 2);
    return color;
}

static void render_snes_mode7_objects_ppu_accurate(AppState *app) {
    const SnesBgScene *scene = &app->snes_bg_scene;
    int oam_mode = scene->oam_mode & 0x07;
    int start_index = scene->enable_oam_priority ? ((scene->internal_oam_address & 0x01fcu) >> 2) : 0;
    int odd_frame = scene->frame_count & 0x01;

    if (!scene->oam || scene->oam_size < 0x220u) {
        return;
    }

    for (int scanline = 0; scanline < SCREEN_HEIGHT; scanline++) {
        int visible_indices[32];
        int visible_count = 0;
        int oam_eval_index = start_index;
        uint8_t sprite_priority[SCREEN_WIDTH];
        uint8_t sprite_palette[SCREEN_WIDTH];
        uint8_t sprite_color[SCREEN_WIDTH];
        int sprite_tile_count = 0;
        bool stop_fetch = false;

        memset(sprite_priority, 0xff, sizeof(sprite_priority));
        memset(sprite_palette, 0, sizeof(sprite_palette));
        memset(sprite_color, 0, sizeof(sprite_color));

        for (int i = 0; i < 128; i++) {
            int addr = (oam_eval_index << 2) & 0x01ff;
            int high_table_value = scene->oam[0x200 + (oam_eval_index >> 2)] >> ((oam_eval_index << 1) & 0x06);
            int large_sprite = (high_table_value & 0x02) >> 1;
            int width_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][0];
            int height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][1];
            int width = width_tiles << 3;
            int height = height_tiles << 3;
            int sprite_x = snes_sprite_x_from_oam(scene, addr, high_table_value);
            int sprite_y = scene->oam[addr + 1];

            if (snes_sprite_scanline_visible(scanline, sprite_x, sprite_y, width, height, scene->obj_interlace)) {
                if (visible_count < 32) {
                    visible_indices[visible_count++] = oam_eval_index;
                } else {
                    break;
                }
            }

            oam_eval_index = (oam_eval_index + 1) & 0x7f;
        }

        for (int visible_index = visible_count - 1; visible_index >= 0; visible_index--) {
            int sprite_index = visible_indices[visible_index];
            int addr = (sprite_index << 2) & 0x01ff;
            int high_table_value = scene->oam[0x200 + (sprite_index >> 2)] >> ((sprite_index << 1) & 0x06);
            int large_sprite = (high_table_value & 0x02) >> 1;
            int width_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][0];
            int width = width_tiles << 3;
            int sprite_x = snes_sprite_x_from_oam(scene, addr, high_table_value);
            int sprite_y = scene->oam[addr + 1];
            int tile_index_base = scene->oam[addr + 2];
            int flags = scene->oam[addr + 3];
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

            if (scene->obj_interlace) {
                y_gap = (y_gap << 1) | odd_frame;
            }

            while (column_offset > 0) {
                int y_offset = 0;
                int row_offset = 0;
                int tile_row = 0;
                int tile_column = 0;
                int row = 0;
                int tile_column_offset = 0;
                int tile_index = 0;
                int fetch_address = 0;
                int x_base = 0;
                int end_tile_x = 0;
                int draw_x = 0;
                uint16_t chr_low = 0;
                uint16_t chr_high = 0;

                sprite_tile_count++;
                if (sprite_tile_count > 34) {
                    stop_fetch = true;
                    break;
                }

                column_offset--;
                if (vertical_mirror) {
                    int pos = y_gap < width ? (width - 1 - y_gap) : (width * 3 - 1 - y_gap);
                    y_offset = pos & 0x07;
                    row_offset = pos >> 3;
                } else {
                    y_offset = y_gap & 0x07;
                    row_offset = y_gap >> 3;
                }

                tile_row = (tile_index_base & 0xf0) >> 4;
                tile_column = tile_index_base & 0x0f;
                row = (tile_row + row_offset) & 0x0f;
                tile_column_offset = horizontal_mirror ? column_offset : (column_count - column_offset - 1);
                tile_index = (row << 4) | ((tile_column + tile_column_offset) & 0x0f);
                fetch_address = (scene->oam_base_address +
                                 (tile_index << 4) +
                                 (use_second_table ? scene->oam_address_offset : 0) +
                                 y_offset) & 0x7fff;

                x_base = sprite_x == -256 ? 0 : sprite_x;
                end_tile_x = x_base + ((column_count - column_offset - 1) << 3) + 8;
                draw_x = sprite_x + ((column_count - column_offset - 1) << 3);

                chr_low = snes_vram_read_word(scene, fetch_address);
                chr_high = snes_vram_read_word(scene, fetch_address + 8);
                for (int pixel = 0; pixel < 8; pixel++) {
                    int x_pos = draw_x + pixel;
                    int x_offset = horizontal_mirror ? ((7 - pixel) & 0x07) : pixel;
                    uint8_t color = 0;

                    if (x_pos < 0 || x_pos >= SCREEN_WIDTH) {
                        continue;
                    }

                    color = snes_decode_sprite_row_pixel(chr_low, chr_high, 7 - x_offset);
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

        for (int x_pos = 0; x_pos < SCREEN_WIDTH; x_pos++) {
            int raw_priority = sprite_priority[x_pos];
            int sprite_priority_value = 0;
            int cgram_index = 0;

            if (raw_priority < 1 || raw_priority > 3) {
                continue;
            }

            sprite_priority_value = MODE7_SPRITE_PRIORITIES[raw_priority];
            if (sprite_priority_value <= 3) {
                continue;
            }

            cgram_index = 128 + ((int)sprite_palette[x_pos] << 4) + (int)sprite_color[x_pos];
            if (cgram_index < 0 || cgram_index >= 256) {
                continue;
            }

            app->framebuffer[(scanline * SCREEN_WIDTH) + x_pos] = scene->cgram_colors[cgram_index];
        }
    }
}

bool snes_bg_scene_load_scanline_params(const char *state_path, SnesBgScene *scene) {
    (void)state_path;
    (void)scene;
    return false;
}
