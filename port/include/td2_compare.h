#ifndef TD2_COMPARE_H
#define TD2_COMPARE_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "td2_io.h"

#define TD2_COMPARE_COLUMNS 3
#define TD2_COMPARE_WIDTH (TD2_FRAME_WIDTH * TD2_COMPARE_COLUMNS)

typedef struct {
    unsigned pixel_count;
    unsigned mismatch_pixels;
    unsigned max_channel_diff;
    double mismatch_ratio;
    double mean_abs_channel_diff;
    double rmse;
} Td2CompareMetrics;

typedef struct {
    bool enabled;
    uint32_t* reference_framebuffer;
    uint32_t* diff_framebuffer;
    uint32_t* strip_framebuffer;
    Td2CompareMetrics metrics;
} Td2CompareLane;

bool td2_compare_init(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    bool enabled,
    char* error,
    size_t error_size
);
void td2_compare_free(Td2CompareLane* compare);
void td2_compare_run(Td2CompareLane* compare, const uint32_t* actual_framebuffer);
bool td2_compare_dump_bundle(
    const Td2CompareLane* compare,
    const uint32_t* actual_framebuffer,
    const char* prefix,
    unsigned frame_index,
    const char* scene_dir,
    unsigned frame_number,
    bool has_frame_number,
    char* error,
    size_t error_size
);

#endif
