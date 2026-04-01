#include "../include/td2_io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

static char* read_text_file(const char* path, size_t* size_out) {
    FILE* file = fopen(path, "rb");
    char* data;
    long size;

    if (file == NULL) {
        return NULL;
    }
    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        return NULL;
    }
    size = ftell(file);
    if (size < 0) {
        fclose(file);
        return NULL;
    }
    if (fseek(file, 0, SEEK_SET) != 0) {
        fclose(file);
        return NULL;
    }
    data = (char*)malloc((size_t)size + 1U);
    if (data == NULL) {
        fclose(file);
        return NULL;
    }
    if (fread(data, 1, (size_t)size, file) != (size_t)size) {
        free(data);
        fclose(file);
        return NULL;
    }
    data[size] = '\0';
    fclose(file);
    if (size_out != NULL) {
        *size_out = (size_t)size;
    }
    return data;
}

static uint8_t* read_binary_file(const char* path, size_t* size_out) {
    FILE* file = fopen(path, "rb");
    uint8_t* data;
    long size;

    if (file == NULL) {
        return NULL;
    }
    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        return NULL;
    }
    size = ftell(file);
    if (size < 0) {
        fclose(file);
        return NULL;
    }
    if (fseek(file, 0, SEEK_SET) != 0) {
        fclose(file);
        return NULL;
    }
    data = (uint8_t*)malloc((size_t)size);
    if (data == NULL) {
        fclose(file);
        return NULL;
    }
    if (fread(data, 1, (size_t)size, file) != (size_t)size) {
        free(data);
        fclose(file);
        return NULL;
    }
    fclose(file);
    if (size_out != NULL) {
        *size_out = (size_t)size;
    }
    return data;
}

static bool parse_json_int(const char* json, const char* key, int* value) {
    const char* pos = strstr(json, key);
    if (pos == NULL) {
        return false;
    }
    pos += strlen(key);
    while (*pos == ' ' || *pos == '\t') {
        pos++;
    }
    if (strncmp(pos, "null", 4) == 0) {
        return false;
    }
    *value = atoi(pos);
    return true;
}

static bool parse_json_bool(const char* json, const char* key, bool* value) {
    const char* pos = strstr(json, key);
    if (pos == NULL) {
        return false;
    }
    pos += strlen(key);
    while (*pos == ' ' || *pos == '\t') {
        pos++;
    }
    if (strncmp(pos, "true", 4) == 0) {
        *value = true;
        return true;
    }
    if (strncmp(pos, "false", 5) == 0) {
        *value = false;
        return true;
    }
    return false;
}

static bool parse_json_string(const char* json, const char* key, char* out, size_t out_size) {
    const char* pos = strstr(json, key);
    const char* end;
    size_t len;

    if (pos == NULL || out_size == 0) {
        return false;
    }
    pos += strlen(key);
    end = strchr(pos, '"');
    if (end == NULL) {
        return false;
    }
    len = (size_t)(end - pos);
    if (len >= out_size) {
        len = out_size - 1U;
    }
    memcpy(out, pos, len);
    out[len] = '\0';
    return true;
}

static bool load_ppm(const char* path, Td2RgbImage* image) {
    FILE* file = fopen(path, "rb");
    char header[32];
    int width;
    int height;
    int max_value;
    size_t pixel_count;

    if (file == NULL) {
        return false;
    }
    if (fgets(header, sizeof(header), file) == NULL || strncmp(header, "P6", 2) != 0) {
        fclose(file);
        return false;
    }
    do {
        if (fgets(header, sizeof(header), file) == NULL) {
            fclose(file);
            return false;
        }
    } while (header[0] == '#');

    if (sscanf(header, "%d %d", &width, &height) != 2) {
        fclose(file);
        return false;
    }
    if (fscanf(file, "%d", &max_value) != 1 || max_value != 255) {
        fclose(file);
        return false;
    }
    fgetc(file);

    pixel_count = (size_t)width * (size_t)height * 3U;
    image->pixels = (uint8_t*)malloc(pixel_count);
    if (image->pixels == NULL) {
        fclose(file);
        return false;
    }
    if (fread(image->pixels, 1, pixel_count, file) != pixel_count) {
        free(image->pixels);
        memset(image, 0, sizeof(*image));
        fclose(file);
        return false;
    }

    image->width = width;
    image->height = height;
    fclose(file);
    return true;
}

static void join_path(char* out, size_t out_size, const char* a, const char* b) {
    snprintf(out, out_size, "%s/%s", a, b);
}

static void derive_raw_dir(char* raw_dir, size_t raw_dir_size, const char* scene_dir) {
    const char* range = strstr(scene_dir, "/design_pack_range/");
    const char* single = strstr(scene_dir, "/design_pack");
    size_t prefix_len;

    if (range != NULL) {
        prefix_len = (size_t)(range - scene_dir);
        snprintf(raw_dir, raw_dir_size, "%.*s/raw_range/%s", (int)prefix_len, scene_dir, range + strlen("/design_pack_range/"));
        return;
    }
    if (single != NULL) {
        prefix_len = (size_t)(single - scene_dir);
        snprintf(raw_dir, raw_dir_size, "%.*s/raw", (int)prefix_len, scene_dir);
        return;
    }
    snprintf(raw_dir, raw_dir_size, "%s", scene_dir);
}

static bool load_ppu_state(const char* raw_dir, Td2DesignPack* pack) {
    char path[1200];
    char key[64];
    char* json = NULL;
    size_t json_size = 0;
    int value = 0;
    unsigned layer_index;

    join_path(path, sizeof(path), raw_dir, "ppu_state.json");
    json = read_text_file(path, &json_size);
    if (json == NULL || json_size == 0U) {
        free(json);
        return false;
    }

    if (!parse_json_int(json, "\"ppu.bgMode\":", &value)) {
        free(json);
        return false;
    }
    pack->bg_mode = (uint8_t)value;

    if (!parse_json_int(json, "\"ppu.mainScreenLayers\":", &value)) {
        free(json);
        return false;
    }
    pack->main_screen_layers = (uint8_t)value;

    if (!parse_json_int(json, "\"ppu.subScreenLayers\":", &value)) {
        free(json);
        return false;
    }
    pack->sub_screen_layers = (uint8_t)value;

    if (parse_json_int(json, "\"ppu.brightness\":", &value)) {
        pack->brightness = (uint8_t)value;
    }
    if (!parse_json_bool(json, "\"ppu.forcedBlank\":", &pack->forced_blank)) {
        free(json);
        return false;
    }
    if (!parse_json_bool(json, "\"ppu.mode1Bg3Priority\":", &pack->mode1_bg3_priority)) {
        pack->mode1_bg3_priority = false;
    }

    if (!parse_json_bool(json, "\"ppu.mode7.fillWithTile0\":", &pack->mode7.fill_with_tile0) ||
        !parse_json_bool(json, "\"ppu.mode7.horizontalMirroring\":", &pack->mode7.horizontal_mirroring) ||
        !parse_json_bool(json, "\"ppu.mode7.verticalMirroring\":", &pack->mode7.vertical_mirroring) ||
        !parse_json_bool(json, "\"ppu.mode7.largeMap\":", &pack->mode7.large_map) ||
        !parse_json_int(json, "\"ppu.mode7.centerX\":", &pack->mode7.center_x) ||
        !parse_json_int(json, "\"ppu.mode7.centerY\":", &pack->mode7.center_y) ||
        !parse_json_int(json, "\"ppu.mode7.hscroll\":", &pack->mode7.hscroll) ||
        !parse_json_int(json, "\"ppu.mode7.vscroll\":", &pack->mode7.vscroll) ||
        !parse_json_int(json, "\"ppu.mode7.matrix[0]\":", &pack->mode7.matrix[0]) ||
        !parse_json_int(json, "\"ppu.mode7.matrix[1]\":", &pack->mode7.matrix[1]) ||
        !parse_json_int(json, "\"ppu.mode7.matrix[2]\":", &pack->mode7.matrix[2]) ||
        !parse_json_int(json, "\"ppu.mode7.matrix[3]\":", &pack->mode7.matrix[3])) {
        free(json);
        return false;
    }

    if (!parse_json_int(json, "\"ppu.oamMode\":", &value)) {
        free(json);
        return false;
    }
    pack->oam_mode = (uint8_t)value;

    if (!parse_json_int(json, "\"ppu.oamBaseAddress\":", &value)) {
        free(json);
        return false;
    }
    pack->oam_base_address = (uint16_t)value;
    if (!parse_json_int(json, "\"ppu.oamAddressOffset\":", &value)) {
        free(json);
        return false;
    }
    pack->oam_address_offset = (uint16_t)value;
    if (!parse_json_int(json, "\"ppu.internalOamAddress\":", &value)) {
        free(json);
        return false;
    }
    pack->internal_oam_address = (uint16_t)value;
    if (parse_json_int(json, "\"ppu.frameCount\":", &value)) {
        pack->ppu_frame_count = (unsigned)value;
    }

    if (!parse_json_bool(json, "\"ppu.enableOamPriority\":", &pack->enable_oam_priority) ||
        !parse_json_bool(json, "\"ppu.objInterlace\":", &pack->obj_interlace) ||
        !parse_json_bool(json, "\"ppu.overscanMode\":", &pack->overscan_mode)) {
        free(json);
        return false;
    }

    for (layer_index = 0; layer_index < TD2_PPU_LAYER_COUNT; layer_index++) {
        Td2PpuLayerState* layer = &pack->layers[layer_index];

        snprintf(key, sizeof(key), "\"ppu.layers[%u].tilemapAddress\":", layer_index);
        if (!parse_json_int(json, key, &layer->tilemap_address)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].chrAddress\":", layer_index);
        if (!parse_json_int(json, key, &layer->chr_address)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].doubleWidth\":", layer_index);
        if (!parse_json_bool(json, key, &layer->double_width)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].doubleHeight\":", layer_index);
        if (!parse_json_bool(json, key, &layer->double_height)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].largeTiles\":", layer_index);
        if (!parse_json_bool(json, key, &layer->large_tiles)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].hscroll\":", layer_index);
        if (!parse_json_int(json, key, &layer->hscroll)) {
            free(json);
            return false;
        }

        snprintf(key, sizeof(key), "\"ppu.layers[%u].vscroll\":", layer_index);
        if (!parse_json_int(json, key, &layer->vscroll)) {
            free(json);
            return false;
        }
    }

    free(json);
    return true;
}

bool td2_design_pack_load(
    Td2DesignPack* pack,
    const char* scene_dir,
    char* error,
    size_t error_size
) {
    char manifest_path[1200];
    char main_visible_path[1200];
    char raw_path[1200];
    char source_frame_dir[1024];
    char* manifest_text = NULL;
    size_t manifest_size = 0;
    int parsed_int = 0;

    memset(pack, 0, sizeof(*pack));
    snprintf(pack->root_dir, sizeof(pack->root_dir), "%s", scene_dir);

    join_path(manifest_path, sizeof(manifest_path), scene_dir, "design_pack.json");
    manifest_text = read_text_file(manifest_path, &manifest_size);
    if (manifest_text == NULL || manifest_size == 0U) {
        set_error(error, error_size, "failed to read design_pack.json");
        free(manifest_text);
        return false;
    }

    if (parse_json_int(manifest_text, "\"frame_number\":", &parsed_int)) {
        pack->frame_number = (unsigned)parsed_int;
        pack->has_frame_number = true;
    }
    if (parse_json_int(manifest_text, "\"bgMode\":", &parsed_int)) {
        pack->bg_mode = (uint8_t)parsed_int;
    }
    if (parse_json_int(manifest_text, "\"mainScreenLayers\":", &parsed_int)) {
        pack->main_screen_layers = (uint8_t)parsed_int;
    }
    if (parse_json_int(manifest_text, "\"subScreenLayers\":", &parsed_int)) {
        pack->sub_screen_layers = (uint8_t)parsed_int;
    }
    if (parse_json_int(manifest_text, "\"brightness\":", &parsed_int)) {
        pack->brightness = (uint8_t)parsed_int;
    } else {
        pack->brightness = 15U;
    }
    parse_json_bool(manifest_text, "\"forcedBlank\":", &pack->forced_blank);

    if (parse_json_string(manifest_text, "\"source_frame_dir\": \"", source_frame_dir, sizeof(source_frame_dir))) {
        snprintf(pack->raw_dir, sizeof(pack->raw_dir), "%s", source_frame_dir);
    } else {
        derive_raw_dir(pack->raw_dir, sizeof(pack->raw_dir), scene_dir);
    }

    join_path(main_visible_path, sizeof(main_visible_path), scene_dir, "layers/main_visible.ppm");
    if (!load_ppm(main_visible_path, &pack->main_visible)) {
        set_error(error, error_size, "failed to load layers/main_visible.ppm");
        free(manifest_text);
        td2_design_pack_free(pack);
        return false;
    }

    join_path(raw_path, sizeof(raw_path), pack->raw_dir, "vram.bin");
    pack->vram = read_binary_file(raw_path, &pack->vram_size);
    join_path(raw_path, sizeof(raw_path), pack->raw_dir, "cgram.bin");
    pack->cgram = read_binary_file(raw_path, &pack->cgram_size);
    join_path(raw_path, sizeof(raw_path), pack->raw_dir, "oam.bin");
    pack->oam = read_binary_file(raw_path, &pack->oam_size);

    if (!load_ppu_state(pack->raw_dir, pack)) {
        set_error(error, error_size, "failed to load raw/ppu_state.json");
        free(manifest_text);
        td2_design_pack_free(pack);
        return false;
    }

    free(manifest_text);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

void td2_design_pack_free(Td2DesignPack* pack) {
    free(pack->main_visible.pixels);
    free(pack->vram);
    free(pack->cgram);
    free(pack->oam);
    memset(pack, 0, sizeof(*pack));
}
