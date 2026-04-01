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

    runtime->framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    if (runtime->framebuffer == NULL) {
        set_error(error, error_size, "failed to allocate framebuffer");
        td2_runtime_free(runtime);
        return false;
    }

    td2_ppu_seed_from_design_pack(&runtime->ppu, &runtime->design_pack);

    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

void td2_runtime_free(Td2Runtime* runtime) {
    free(runtime->framebuffer);
    runtime->framebuffer = NULL;
    td2_design_pack_free(&runtime->design_pack);
}

bool td2_runtime_render_frame(
    Td2Runtime* runtime,
    char* error,
    size_t error_size
) {
    td2_ppu_render_frame(&runtime->ppu, runtime->framebuffer);
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
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}
