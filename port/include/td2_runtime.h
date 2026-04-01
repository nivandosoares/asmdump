#ifndef TD2_RUNTIME_H
#define TD2_RUNTIME_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "td2_compare.h"
#include "td2_io.h"
#include "td2_ppu.h"

typedef struct {
    const char* scene_dir;
    const char* dump_prefix;
    unsigned frame_limit;
    int window_scale;
    bool headless;
    bool compare_reference;
    bool fail_on_compare_diff;
} Td2RuntimeConfig;

typedef struct {
    Td2RuntimeConfig config;
    Td2DesignPack design_pack;
    Td2PpuState ppu;
    Td2CompareLane compare;
    uint8_t wram[TD2_WRAM_BYTES];
    uint32_t* framebuffer;
    unsigned frame_counter;
} Td2Runtime;

bool td2_runtime_init(
    Td2Runtime* runtime,
    const Td2RuntimeConfig* config,
    char* error,
    size_t error_size
);
void td2_runtime_free(Td2Runtime* runtime);
bool td2_runtime_render_frame(
    Td2Runtime* runtime,
    char* error,
    size_t error_size
);
bool td2_runtime_dump_frame(
    const Td2Runtime* runtime,
    const char* prefix,
    unsigned frame_index,
    char* error,
    size_t error_size
);

#endif
