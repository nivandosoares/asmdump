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
    FILE* file;
    unsigned y;

    snprintf(path, sizeof(path), "%s_%05u.ppm", prefix, frame_index);
    file = fopen(path, "wb");
    if (file == NULL) {
        set_error(error, error_size, "failed to open dump file");
        return false;
    }

    fprintf(file, "P6\n%d %d\n255\n", TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT);
    for (y = 0; y < TD2_FRAME_HEIGHT; y++) {
        unsigned x;
        for (x = 0; x < TD2_FRAME_WIDTH; x++) {
            uint32_t pixel = runtime->framebuffer[y * TD2_FRAME_WIDTH + x];
            uint8_t rgb[3];
            rgb[0] = (uint8_t)((pixel >> 16) & 0xffU);
            rgb[1] = (uint8_t)((pixel >> 8) & 0xffU);
            rgb[2] = (uint8_t)(pixel & 0xffU);
            fwrite(rgb, sizeof(rgb), 1, file);
        }
    }

    fclose(file);
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
