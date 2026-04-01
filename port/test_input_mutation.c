#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "td2_runtime.h"

typedef struct {
    const char* label;
    const char* scene_dir;
    Td2SchedulerProfile profile;
    const char* input_script;
    unsigned frame;
    bool expect_state_0960;
    uint16_t expected_state_0960;
    bool expect_state_1c70;
    uint16_t expected_state_1c70;
    bool expect_state_1c76;
    uint16_t expected_state_1c76;
} Td2InputMutationCase;

static const Td2InputMutationCase k_cases[] = {
    {
        "menu_no_opponent_handoff",
        "../tools/out/design_frame1500_car_select",
        TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY,
        "1584-1589:right,down;1730-1735:start",
        2044U,
        false,
        0U,
        true,
        3U,
        true,
        0U,
    },
    {
        "gameplay_a_press",
        "../tools/out/design_lane3_live_race_mid_frame0_native",
        TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
        "3:a",
        3U,
        true,
        0x0080U,
        true,
        0U,
        true,
        1U,
    },
    {
        "gameplay_b_press",
        "../tools/out/design_lane3_live_race_mid_frame0_native",
        TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
        "5:b",
        5U,
        true,
        0x8000U,
        true,
        0U,
        true,
        1U,
    },
    {
        "gameplay_diagonal_press",
        "../tools/out/design_lane3_live_race_mid_frame0_native",
        TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
        "7:right,down",
        7U,
        true,
        0x0500U,
        true,
        0U,
        true,
        1U,
    },
};

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

int main(void) {
    unsigned total_checks = 0U;
    unsigned failed_checks = 0U;
    unsigned passed_cases = 0U;
    unsigned i;

    for (i = 0U; i < (unsigned)(sizeof(k_cases) / sizeof(k_cases[0])); i++) {
        const Td2InputMutationCase* test_case = &k_cases[i];
        Td2Runtime runtime;
        Td2RuntimeConfig config;
        char error[256];
        unsigned case_failed_checks = failed_checks;

        memset(&config, 0, sizeof(config));
        config.scene_dir = test_case->scene_dir;
        config.headless = true;
        config.scheduler_profile = test_case->profile;
        config.input_script = test_case->input_script;

        if (!td2_runtime_init(&runtime, &config, error, sizeof(error))) {
            fprintf(stderr, "FAIL %s runtime init: %s\n", test_case->label, error);
            return 1;
        }

        runtime.frame_counter = test_case->frame - runtime.design_pack.frame_number;
        if (!td2_runtime_sync_frame_state(&runtime, error, sizeof(error))) {
            fprintf(stderr, "FAIL %s sync error: %s\n", test_case->label, error);
            td2_runtime_free(&runtime);
            return 1;
        }

        expect_u16(test_case->label,
                   "state_0960",
                   runtime.state.has_state_0960,
                   runtime.state.state_0960,
                   test_case->expect_state_0960,
                   test_case->expected_state_0960,
                   &total_checks,
                   &failed_checks);
        expect_u16(test_case->label,
                   "state_1c70",
                   runtime.state.has_state_1c70,
                   runtime.state.state_1c70,
                   test_case->expect_state_1c70,
                   test_case->expected_state_1c70,
                   &total_checks,
                   &failed_checks);
        expect_u16(test_case->label,
                   "state_1c76",
                   runtime.state.has_state_1c76,
                   runtime.state.state_1c76,
                   test_case->expect_state_1c76,
                   test_case->expected_state_1c76,
                   &total_checks,
                   &failed_checks);

        td2_runtime_free(&runtime);
        if (failed_checks == case_failed_checks) {
            passed_cases++;
        }
    }

    if (failed_checks != 0U) {
        fprintf(stderr,
                "FAIL: input mutation smoke mismatched %u checks across %u/%zu cases\n",
                failed_checks,
                passed_cases,
                sizeof(k_cases) / sizeof(k_cases[0]));
        return 1;
    }

    printf("PASS: input mutation smoke matched %u checks across %u cases\n",
           total_checks,
           passed_cases);
    return 0;
}
