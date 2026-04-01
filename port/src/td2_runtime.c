#include "../include/td2_runtime.h"

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

static const char* find_in_range(
    const char* start,
    const char* end,
    const char* needle
) {
    size_t needle_length = strlen(needle);
    const char* pos = start;

    while (pos != NULL && pos < end) {
        pos = strstr(pos, needle);
        if (pos == NULL) {
            return NULL;
        }
        if ((size_t)(end - pos) >= needle_length) {
            return pos;
        }
        return NULL;
    }
    return NULL;
}

static bool parse_int_in_range(
    const char* start,
    const char* end,
    const char* key,
    int* value
) {
    const char* pos = find_in_range(start, end, key);
    char* parse_end = NULL;
    long parsed;

    if (pos == NULL) {
        return false;
    }
    pos += strlen(key);
    while (pos < end && (*pos == ' ' || *pos == '\t')) {
        pos++;
    }

    parsed = strtol(pos, &parse_end, 10);
    if (parse_end == pos || parse_end > end) {
        return false;
    }

    *value = (int)parsed;
    return true;
}

static const char* find_matching_delimiter(
    const char* start,
    char open_delimiter,
    char close_delimiter
) {
    int depth = 0;
    const char* cursor = start;

    while (cursor != NULL && *cursor != '\0') {
        if (*cursor == open_delimiter) {
            depth++;
        } else if (*cursor == close_delimiter) {
            depth--;
            if (depth == 0) {
                return cursor;
            }
        }
        cursor++;
    }

    return NULL;
}

static bool td2_build_lane3_scanline_profile_path(
    const char* scene_dir,
    char* path,
    size_t path_size
) {
    const char* slash;
    size_t parent_length;

    if (scene_dir == NULL || path == NULL || path_size == 0U) {
        return false;
    }

    slash = strrchr(scene_dir, '/');
    if (slash == NULL) {
        return false;
    }
    parent_length = (size_t)(slash - scene_dir);
    if (parent_length + strlen("/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json") + 1U > path_size) {
        return false;
    }

    snprintf(
        path,
        path_size,
        "%.*s/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json",
        (int)parent_length,
        scene_dir);
    return true;
}

static bool td2_runtime_should_load_lane3_scanline_profile(
    const Td2RuntimeConfig* config,
    Td2SchedulerProfile active_profile
) {
    return active_profile == TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID &&
           config->scene_dir != NULL &&
           strstr(config->scene_dir, "design_lane3_live_race_mid_frame0_native") != NULL;
}

static bool td2_runtime_load_lane3_scanline_profile(
    Td2PpuState* ppu,
    const char* scene_dir,
    char* error,
    size_t error_size
) {
    static const char* k_scanline_key = "\"scanline\":";
    static const char* k_main_layers_key = "\"main_layers\":";
    static const char* k_bg1_hscroll_key = "\"bg1_hscroll\":";
    static const char* k_bg1_vscroll_key = "\"bg1_vscroll\":";
    static const char* k_bg2_hscroll_key = "\"bg2_hscroll\":";
    static const char* k_bg2_vscroll_key = "\"bg2_vscroll\":";
    static const char* k_bg3_hscroll_key = "\"bg3_hscroll\":";
    static const char* k_bg3_vscroll_key = "\"bg3_vscroll\":";
    char path[1200];
    char* json = NULL;
    const char* samples = NULL;
    const char* cursor;
    const char* samples_end;
    bool seen[TD2_FRAME_HEIGHT];
    unsigned sample_count = 0U;
    unsigned scanline;

    if (!td2_build_lane3_scanline_profile_path(scene_dir, path, sizeof(path))) {
        set_error(error, error_size, "failed to resolve lane3 scanline profile path");
        return false;
    }

    json = read_text_file(path, NULL);
    if (json == NULL) {
        snprintf(error, error_size, "failed to read scanline profile: %s", path);
        return false;
    }

    samples = strstr(json, "\"samples\"");
    if (samples == NULL) {
        free(json);
        set_error(error, error_size, "scanline profile missing samples array");
        return false;
    }
    samples = strchr(samples, '[');
    if (samples == NULL) {
        free(json);
        set_error(error, error_size, "scanline profile missing samples bracket");
        return false;
    }
    samples_end = find_matching_delimiter(samples, '[', ']');
    if (samples_end == NULL) {
        free(json);
        set_error(error, error_size, "scanline profile samples array is unterminated");
        return false;
    }

    memset(&ppu->scanline_profile, 0, sizeof(ppu->scanline_profile));
    memset(seen, 0, sizeof(seen));
    ppu->scanline_profile.line_count = TD2_FRAME_HEIGHT;
    for (scanline = 0; scanline < TD2_FRAME_HEIGHT; scanline++) {
        int layer_index;

        ppu->scanline_profile.main_screen_layers[scanline] = ppu->main_screen_layers;
        for (layer_index = 0; layer_index < TD2_PPU_LAYER_COUNT; layer_index++) {
            ppu->scanline_profile.layer_hscroll[layer_index][scanline] = ppu->layers[layer_index].hscroll;
            ppu->scanline_profile.layer_vscroll[layer_index][scanline] = ppu->layers[layer_index].vscroll;
        }
    }

    cursor = samples;
    while ((cursor = strchr(cursor, '{')) != NULL && cursor < samples_end) {
        const char* object_end = strchr(cursor, '}');
        int parsed_scanline;
        int value;

        if (object_end == NULL || object_end > samples_end) {
            free(json);
            set_error(error, error_size, "scanline sample object is unterminated");
            return false;
        }

        if (!parse_int_in_range(cursor, object_end, k_scanline_key, &parsed_scanline) ||
            parsed_scanline < 0 ||
            parsed_scanline >= TD2_FRAME_HEIGHT) {
            free(json);
            set_error(error, error_size, "scanline profile has invalid scanline index");
            return false;
        }
        if (seen[parsed_scanline]) {
            free(json);
            set_error(error, error_size, "scanline profile has duplicate scanline sample");
            return false;
        }
        seen[parsed_scanline] = true;
        sample_count++;

        if (!parse_int_in_range(cursor, object_end, k_main_layers_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing main_layers");
            return false;
        }
        ppu->scanline_profile.main_screen_layers[parsed_scanline] = (uint8_t)value;

        if (!parse_int_in_range(cursor, object_end, k_bg1_hscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg1_hscroll");
            return false;
        }
        ppu->scanline_profile.layer_hscroll[0][parsed_scanline] = value;

        if (!parse_int_in_range(cursor, object_end, k_bg1_vscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg1_vscroll");
            return false;
        }
        ppu->scanline_profile.layer_vscroll[0][parsed_scanline] = value;

        if (!parse_int_in_range(cursor, object_end, k_bg2_hscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg2_hscroll");
            return false;
        }
        ppu->scanline_profile.layer_hscroll[1][parsed_scanline] = value;

        if (!parse_int_in_range(cursor, object_end, k_bg2_vscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg2_vscroll");
            return false;
        }
        ppu->scanline_profile.layer_vscroll[1][parsed_scanline] = value;

        if (!parse_int_in_range(cursor, object_end, k_bg3_hscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg3_hscroll");
            return false;
        }
        ppu->scanline_profile.layer_hscroll[2][parsed_scanline] = value;

        if (!parse_int_in_range(cursor, object_end, k_bg3_vscroll_key, &value)) {
            free(json);
            set_error(error, error_size, "scanline profile missing bg3_vscroll");
            return false;
        }
        ppu->scanline_profile.layer_vscroll[2][parsed_scanline] = value;

        cursor = object_end + 1;
    }

    free(json);

    if (sample_count != TD2_FRAME_HEIGHT) {
        snprintf(
            error,
            error_size,
            "scanline profile expected %u samples but loaded %u",
            (unsigned)TD2_FRAME_HEIGHT,
            sample_count);
        return false;
    }

    ppu->scanline_profile.enabled = true;
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_runtime_init(
    Td2Runtime* runtime,
    const Td2RuntimeConfig* config,
    char* error,
    size_t error_size
) {
    memset(runtime, 0, sizeof(*runtime));
    runtime->config = *config;

    if (!td2_design_pack_load(&runtime->design_pack, config->scene_dir, error, error_size)) {
        return false;
    }

    if (!td2_scheduler_init(
            &runtime->scheduler,
            config->scheduler_profile,
            config->scene_dir,
            config->input_script,
            &runtime->design_pack,
            error,
            error_size)) {
        td2_runtime_free(runtime);
        return false;
    }
    td2_runtime_state_reset(&runtime->state);

    runtime->framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    if (runtime->framebuffer == NULL) {
        set_error(error, error_size, "failed to allocate framebuffer");
        td2_runtime_free(runtime);
        return false;
    }

    td2_ppu_seed_from_design_pack(&runtime->ppu, &runtime->design_pack);
    if (td2_runtime_should_load_lane3_scanline_profile(config, runtime->scheduler.active_profile) &&
        !td2_runtime_load_lane3_scanline_profile(
            &runtime->ppu,
            config->scene_dir,
            error,
            error_size)) {
        td2_runtime_free(runtime);
        return false;
    }
    if (!td2_compare_init(
            &runtime->compare,
            &runtime->design_pack,
            config->compare_reference || config->fail_on_compare_diff,
            error,
            error_size)) {
        td2_runtime_free(runtime);
        return false;
    }

    runtime->frame_counter = 0U;
    if (!td2_runtime_sync_frame_state(runtime, error, error_size)) {
        td2_runtime_free(runtime);
        return false;
    }
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

void td2_runtime_free(Td2Runtime* runtime) {
    free(runtime->framebuffer);
    runtime->framebuffer = NULL;
    td2_compare_free(&runtime->compare);
    td2_design_pack_free(&runtime->design_pack);
}

bool td2_runtime_sync_frame_state(
    Td2Runtime* runtime,
    char* error,
    size_t error_size
) {
    unsigned frame_number = runtime->frame_counter;
    bool built_state = false;

    if (runtime->design_pack.has_frame_number) {
        frame_number += runtime->design_pack.frame_number;
    }

    if (!td2_callback_contract_load_for_frame(
            &runtime->callback_contract,
            runtime->config.scene_dir,
            frame_number,
            runtime->design_pack.has_frame_number,
            error,
            error_size)) {
        return false;
    }

    built_state = td2_scheduler_build_state(
        &runtime->scheduler,
        frame_number,
        &runtime->state);
    if (!built_state) {
        td2_runtime_state_seed_from_contract(&runtime->state, &runtime->callback_contract);
    }

    runtime->ppu.frame_number = frame_number;
    runtime->ppu.ppu_frame_count = runtime->design_pack.ppu_frame_count + runtime->frame_counter;
    runtime->ppu.has_reference_frame = runtime->design_pack.main_visible.pixels != NULL;
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_runtime_render_frame(
    Td2Runtime* runtime,
    char* error,
    size_t error_size
) {
    if (!td2_runtime_sync_frame_state(runtime, error, error_size)) {
        return false;
    }
    td2_ppu_render_frame(&runtime->ppu, runtime->framebuffer);
    td2_compare_run(
        &runtime->compare,
        &runtime->design_pack,
        &runtime->ppu,
        &runtime->state,
        &runtime->callback_contract,
        runtime->framebuffer);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_runtime_dump_frame(
    const Td2Runtime* runtime,
    const char* prefix,
    unsigned frame_index,
    char* error,
    size_t error_size
) {
    char path[1200];
    char png_path[1200];

    snprintf(path, sizeof(path), "%s_%05u.ppm", prefix, frame_index);
    snprintf(png_path, sizeof(png_path), "%s_%05u.png", prefix, frame_index);
    if (!td2_compare_write_argb_ppm(
            path,
            runtime->framebuffer,
            TD2_FRAME_WIDTH,
            TD2_FRAME_HEIGHT,
            error,
            error_size) ||
        !td2_compare_write_argb_png(
            png_path,
            runtime->framebuffer,
            TD2_FRAME_WIDTH,
            TD2_FRAME_HEIGHT,
            error,
            error_size)) {
        return false;
    }
    if (!td2_compare_dump_bundle(
            &runtime->compare,
            &runtime->design_pack,
            &runtime->ppu,
            &runtime->state,
            &runtime->callback_contract,
            runtime->framebuffer,
            prefix,
            frame_index,
            runtime->config.scene_dir,
            runtime->design_pack.frame_number,
            runtime->design_pack.has_frame_number,
            error,
            error_size)) {
        return false;
    }
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_runtime_set_live_input_mask(
    Td2Runtime* runtime,
    uint16_t mask,
    char* error,
    size_t error_size
) {
    unsigned frame_number;

    if (runtime == NULL) {
        set_error(error, error_size, "missing runtime");
        return false;
    }

    frame_number = runtime->frame_counter;
    if (runtime->design_pack.has_frame_number) {
        frame_number += runtime->design_pack.frame_number;
    }

    return td2_scheduler_record_live_input(
        &runtime->scheduler,
        frame_number,
        mask,
        error,
        error_size);
}
