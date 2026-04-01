#ifndef TD2_COMPARE_H
#define TD2_COMPARE_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "td2_contracts.h"
#include "td2_io.h"
#include "td2_ppu.h"

#define TD2_COMPARE_COLUMNS 3
#define TD2_COMPARE_WIDTH (TD2_FRAME_WIDTH * TD2_COMPARE_COLUMNS)
#define TD2_COMPARE_STATE_CHECKS_MAX 96
#define TD2_COMPARE_STATE_KEY_BYTES 96

typedef struct {
    unsigned pixel_count;
    unsigned mismatch_pixels;
    unsigned max_channel_diff;
    double mismatch_ratio;
    double mean_abs_channel_diff;
    double rmse;
} Td2CompareMetrics;

typedef enum {
    TD2_COMPARE_VALUE_INT = 0,
    TD2_COMPARE_VALUE_BOOL = 1,
    TD2_COMPARE_VALUE_POINTER = 2,
} Td2CompareValueKind;

typedef struct {
    char key[TD2_COMPARE_STATE_KEY_BYTES];
    Td2CompareValueKind value_kind;
    int expected;
    int actual;
    bool matched;
} Td2CompareStateCheck;

typedef struct {
    unsigned total_checks;
    unsigned passed_checks;
    unsigned failed_checks;
    unsigned check_count;
    unsigned vram_mismatch_bytes;
    unsigned cgram_mismatch_bytes;
    unsigned oam_mismatch_bytes;
    Td2CompareStateCheck checks[TD2_COMPARE_STATE_CHECKS_MAX];
} Td2CompareStateContract;

typedef struct {
    bool available;
    unsigned frame;
    char contract_id[TD2_CONTRACT_ID_BYTES];
    char phase[TD2_CONTRACT_PHASE_BYTES];
    char note[TD2_CONTRACT_NOTE_BYTES];
    Td2RuntimeStateSource actual_source;
    unsigned total_checks;
    unsigned passed_checks;
    unsigned failed_checks;
    unsigned check_count;
    Td2CompareStateCheck checks[TD2_COMPARE_STATE_CHECKS_MAX];
} Td2CompareCallbackContract;

typedef struct {
    bool enabled;
    uint32_t* reference_framebuffer;
    uint32_t* diff_framebuffer;
    uint32_t* strip_framebuffer;
    Td2CompareMetrics metrics;
    Td2CompareStateContract state_contract;
    Td2CompareCallbackContract callback_contract;
} Td2CompareLane;

bool td2_compare_write_argb_ppm(
    const char* path,
    const uint32_t* framebuffer,
    int width,
    int height,
    char* error,
    size_t error_size
);
bool td2_compare_write_argb_png(
    const char* path,
    const uint32_t* framebuffer,
    int width,
    int height,
    char* error,
    size_t error_size
);
bool td2_compare_init(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    bool enabled,
    char* error,
    size_t error_size
);
void td2_compare_free(Td2CompareLane* compare);
void td2_compare_run(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    const Td2PpuState* ppu,
    const Td2RuntimeState* runtime_state,
    const Td2CallbackTraceContract* callback_contract,
    const uint32_t* actual_framebuffer
);
bool td2_compare_dump_bundle(
    const Td2CompareLane* compare,
    const Td2DesignPack* pack,
    const Td2PpuState* ppu,
    const Td2RuntimeState* runtime_state,
    const Td2CallbackTraceContract* callback_contract,
    const uint32_t* actual_framebuffer,
    const char* prefix,
    unsigned frame_index,
    const char* scene_dir,
    unsigned frame_number,
    bool has_frame_number,
    char* error,
    size_t error_size
);
bool td2_compare_has_drift(const Td2CompareLane* compare);

#endif
