#include <SDL2/SDL.h>

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "platform_sdl.h"
#include "td2_runtime.h"

typedef struct {
    const char* label;
    const char* scene_dir;
    Td2SchedulerProfile profile;
    const char* input_script;
} Td2LiveRuntimeCase;

static bool expect_mask(
    const char* label,
    const char* key,
    uint16_t actual_mask,
    uint16_t expected_mask,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual_mask != expected_mask) {
        fprintf(stderr,
                "FAIL %s %s expected 0x%04X got 0x%04X\n",
                label,
                key,
                (unsigned)expected_mask,
                (unsigned)actual_mask);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_u16(
    const char* label,
    const char* key,
    bool actual_has_value,
    uint16_t actual_value,
    bool expected_has_value,
    uint16_t expected_value,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual_has_value != expected_has_value ||
        (expected_has_value && actual_value != expected_value)) {
        fprintf(stderr,
                "FAIL %s %s expected %s%u got %s%u\n",
                label,
                key,
                expected_has_value ? "" : "missing/",
                (unsigned)expected_value,
                actual_has_value ? "" : "missing/",
                (unsigned)actual_value);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_unsigned(
    const char* label,
    const char* key,
    unsigned actual_value,
    unsigned expected_value,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual_value != expected_value) {
        fprintf(stderr,
                "FAIL %s %s expected %u got %u\n",
                label,
                key,
                expected_value,
                actual_value);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool init_runtime_case(
    const Td2LiveRuntimeCase* test_case,
    Td2Runtime* runtime,
    char* error,
    size_t error_size
) {
    Td2RuntimeConfig config;

    memset(&config, 0, sizeof(config));
    config.scene_dir = test_case->scene_dir;
    config.headless = true;
    config.scheduler_profile = test_case->profile;
    config.input_script = test_case->input_script;
    return td2_runtime_init(runtime, &config, error, error_size);
}

static bool record_live_mask(
    Td2Runtime* runtime,
    unsigned absolute_frame,
    uint16_t mask,
    char* error,
    size_t error_size
) {
    if (runtime->design_pack.has_frame_number &&
        absolute_frame < runtime->design_pack.frame_number) {
        snprintf(error,
                 error_size,
                 "frame %u precedes bundle base %u",
                 absolute_frame,
                 runtime->design_pack.frame_number);
        return false;
    }

    runtime->frame_counter = runtime->design_pack.has_frame_number
        ? absolute_frame - runtime->design_pack.frame_number
        : absolute_frame;
    return td2_runtime_set_live_input_mask(runtime, mask, error, error_size);
}

static bool record_live_range(
    Td2Runtime* runtime,
    unsigned start_frame,
    unsigned end_frame,
    uint16_t mask,
    char* error,
    size_t error_size
) {
    unsigned frame = 0U;

    if (end_frame < start_frame) {
        snprintf(error, error_size, "invalid live input range");
        return false;
    }

    for (frame = start_frame; frame <= end_frame; frame++) {
        if (!record_live_mask(runtime, frame, mask, error, error_size)) {
            return false;
        }
    }
    return true;
}

static bool sync_absolute_frame(
    Td2Runtime* runtime,
    unsigned absolute_frame,
    char* error,
    size_t error_size
) {
    if (runtime->design_pack.has_frame_number &&
        absolute_frame < runtime->design_pack.frame_number) {
        snprintf(error,
                 error_size,
                 "frame %u precedes bundle base %u",
                 absolute_frame,
                 runtime->design_pack.frame_number);
        return false;
    }

    runtime->frame_counter = runtime->design_pack.has_frame_number
        ? absolute_frame - runtime->design_pack.frame_number
        : absolute_frame;
    return td2_runtime_sync_frame_state(runtime, error, error_size);
}

static void run_keyboard_mapping_case(unsigned* total_checks, unsigned* failed_checks) {
    uint8_t keyboard_state[SDL_NUM_SCANCODES];
    uint16_t mask = TD2_INPUT_MASK_NONE;

    memset(keyboard_state, 0, sizeof(keyboard_state));
    keyboard_state[SDL_SCANCODE_Z] = 1U;
    keyboard_state[SDL_SCANCODE_X] = 1U;
    keyboard_state[SDL_SCANCODE_A] = 1U;
    keyboard_state[SDL_SCANCODE_S] = 1U;
    keyboard_state[SDL_SCANCODE_Q] = 1U;
    keyboard_state[SDL_SCANCODE_W] = 1U;
    keyboard_state[SDL_SCANCODE_RETURN] = 1U;
    keyboard_state[SDL_SCANCODE_TAB] = 1U;
    keyboard_state[SDL_SCANCODE_UP] = 1U;
    keyboard_state[SDL_SCANCODE_LEFT] = 1U;
    mask = platform_sdl_keyboard_mask_from_state(keyboard_state, sizeof(keyboard_state));
    expect_mask("keyboard_mapping_full",
                "mask",
                mask,
                (uint16_t)(TD2_INPUT_MASK_B |
                           TD2_INPUT_MASK_A |
                           TD2_INPUT_MASK_Y |
                           TD2_INPUT_MASK_X |
                           TD2_INPUT_MASK_L |
                           TD2_INPUT_MASK_R |
                           TD2_INPUT_MASK_START |
                           TD2_INPUT_MASK_SELECT |
                           TD2_INPUT_MASK_UP |
                           TD2_INPUT_MASK_LEFT),
                total_checks,
                failed_checks);
}

static void run_controller_mapping_case(unsigned* total_checks, unsigned* failed_checks) {
    PlatformSdlControllerSample sample;
    uint16_t mask = TD2_INPUT_MASK_NONE;

    memset(&sample, 0, sizeof(sample));
    sample.a = true;
    sample.b = true;
    sample.x = true;
    sample.y = true;
    sample.back = true;
    sample.start = true;
    sample.left_shoulder = true;
    sample.right_shoulder = true;
    sample.left_x = 20000;
    sample.left_y = -22000;
    mask = platform_sdl_controller_mask_from_sample(&sample);
    expect_mask("controller_mapping_full",
                "mask",
                mask,
                (uint16_t)(TD2_INPUT_MASK_B |
                           TD2_INPUT_MASK_A |
                           TD2_INPUT_MASK_Y |
                           TD2_INPUT_MASK_X |
                           TD2_INPUT_MASK_SELECT |
                           TD2_INPUT_MASK_START |
                           TD2_INPUT_MASK_L |
                           TD2_INPUT_MASK_R |
                           TD2_INPUT_MASK_RIGHT |
                           TD2_INPUT_MASK_UP),
                total_checks,
                failed_checks);

    memset(&sample, 0, sizeof(sample));
    sample.left_x = 8000;
    sample.left_y = -12000;
    mask = platform_sdl_controller_mask_from_sample(&sample);
    expect_mask("controller_mapping_deadzone",
                "mask",
                mask,
                TD2_INPUT_MASK_NONE,
                total_checks,
                failed_checks);
}

static bool run_menu_no_opponent_live_case(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    static const Td2LiveRuntimeCase test_case = {
        "menu_no_opponent_live_route",
        "../tools/out/design_frame1500_car_select",
        TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY,
        NULL,
    };
    Td2Runtime runtime;
    char error[256];

    if (!init_runtime_case(&test_case, &runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s runtime init: %s\n", test_case.label, error);
        return false;
    }

    if (!record_live_range(&runtime,
                           1584U,
                           1589U,
                           (uint16_t)(TD2_INPUT_MASK_RIGHT | TD2_INPUT_MASK_DOWN),
                           error,
                           sizeof(error)) ||
        !record_live_range(&runtime,
                           1730U,
                           1735U,
                           TD2_INPUT_MASK_START,
                           error,
                           sizeof(error))) {
        fprintf(stderr, "FAIL %s record live input: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }

    if (!sync_absolute_frame(&runtime, 2044U, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s sync: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }

    expect_unsigned(test_case.label,
                    "live_window_count",
                    runtime.scheduler.live_input_history.window_count,
                    2U,
                    total_checks,
                    failed_checks);
    expect_u16(test_case.label,
               "state_0960",
               runtime.state.has_state_0960,
               runtime.state.state_0960,
               false,
               0U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_1c70",
               runtime.state.has_state_1c70,
               runtime.state.state_1c70,
               true,
               3U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_1c76",
               runtime.state.has_state_1c76,
               runtime.state.state_1c76,
               true,
               0U,
               total_checks,
               failed_checks);

    td2_runtime_free(&runtime);
    return true;
}

static bool run_gameplay_live_a_case(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    static const Td2LiveRuntimeCase test_case = {
        "gameplay_live_a_press",
        "../tools/out/design_lane3_live_race_mid_frame0_native",
        TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
        NULL,
    };
    Td2Runtime runtime;
    char error[256];

    if (!init_runtime_case(&test_case, &runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s runtime init: %s\n", test_case.label, error);
        return false;
    }

    if (!record_live_mask(&runtime, 3U, TD2_INPUT_MASK_A, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s record live input: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }
    if (!sync_absolute_frame(&runtime, 3U, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s sync: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }

    expect_unsigned(test_case.label,
                    "live_window_count",
                    runtime.scheduler.live_input_history.window_count,
                    1U,
                    total_checks,
                    failed_checks);
    expect_u16(test_case.label,
               "state_0960",
               runtime.state.has_state_0960,
               runtime.state.state_0960,
               true,
               TD2_INPUT_MASK_A,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0053",
               runtime.state.has_dp_0053,
               runtime.state.dp_0053,
               true,
               136U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0054",
               runtime.state.has_dp_0054,
               runtime.state.dp_0054,
               true,
               152U,
               total_checks,
               failed_checks);

    td2_runtime_free(&runtime);
    return true;
}

static bool run_menu_default_rival_merge_case(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    static const Td2LiveRuntimeCase test_case = {
        "menu_default_rival_merge_live_a",
        "../tools/out/design_frame1500_car_select",
        TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY,
        "1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start",
    };
    Td2Runtime runtime;
    char error[256];

    if (!init_runtime_case(&test_case, &runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s runtime init: %s\n", test_case.label, error);
        return false;
    }

    if (!record_live_range(&runtime,
                           2050U,
                           2088U,
                           TD2_INPUT_MASK_A,
                           error,
                           sizeof(error))) {
        fprintf(stderr, "FAIL %s record live input: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }
    if (!sync_absolute_frame(&runtime, 2088U, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s sync: %s\n", test_case.label, error);
        td2_runtime_free(&runtime);
        return false;
    }

    expect_unsigned(test_case.label,
                    "live_window_count",
                    runtime.scheduler.live_input_history.window_count,
                    1U,
                    total_checks,
                    failed_checks);
    expect_u16(test_case.label,
               "state_0960",
               runtime.state.has_state_0960,
               runtime.state.state_0960,
               true,
               TD2_INPUT_MASK_A,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_1c70",
               runtime.state.has_state_1c70,
               runtime.state.state_1c70,
               true,
               0U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_1c76",
               runtime.state.has_state_1c76,
               runtime.state.state_1c76,
               true,
               1U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_09a2",
               runtime.state.has_state_09a2,
               runtime.state.state_09a2,
               true,
               40U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "state_09a8",
               runtime.state.has_state_09a8,
               runtime.state.state_09a8,
               true,
               2U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0020",
               runtime.state.has_dp_0020,
               runtime.state.dp_0020,
               true,
               87U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0022",
               runtime.state.has_dp_0022,
               runtime.state.dp_0022,
               true,
               9U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0053",
               runtime.state.has_dp_0053,
               runtime.state.dp_0053,
               true,
               144U,
               total_checks,
               failed_checks);
    expect_u16(test_case.label,
               "dp_0054",
               runtime.state.has_dp_0054,
               runtime.state.dp_0054,
               true,
               152U,
               total_checks,
               failed_checks);

    td2_runtime_free(&runtime);
    return true;
}

int main(void) {
    unsigned total_checks = 0U;
    unsigned failed_checks = 0U;

    run_keyboard_mapping_case(&total_checks, &failed_checks);
    run_controller_mapping_case(&total_checks, &failed_checks);

    if (!run_menu_no_opponent_live_case(&total_checks, &failed_checks) ||
        !run_gameplay_live_a_case(&total_checks, &failed_checks) ||
        !run_menu_default_rival_merge_case(&total_checks, &failed_checks)) {
        return 1;
    }

    if (failed_checks != 0U) {
        fprintf(stderr,
                "FAIL: live input smoke mismatched %u checks\n",
                failed_checks);
        return 1;
    }

    printf("PASS: live input smoke matched %u checks\n", total_checks);
    return 0;
}
