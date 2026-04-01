#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "td2_runtime.h"
#include "td2_scheduler.h"

typedef struct {
    const char* label;
    const char* scene_dir;
    Td2SchedulerProfile profile;
    Td2RuntimeStateSource expected_source;
    bool expected_contract_loaded;
    unsigned expected_segment_count;
    unsigned checkpoints[20];
    unsigned checkpoint_count;
} Td2RailCase;

static const Td2RailCase k_rails[] = {
    {
        "intro_noinput",
        "../tools/out/design_frame986",
        TD2_SCHEDULER_PROFILE_INTRO_NOINPUT,
        TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL,
        false,
        0U,
        {986U, 1093U, 1102U, 1117U},
        4U,
    },
    {
        "menu_gameplay_entry",
        "../tools/out/design_frame1500_car_select",
        TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY,
        TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT,
        true,
        46U,
        {1500U, 1640U, 1677U, 1857U, 2014U, 2044U, 2050U, 2052U, 2053U, 2054U, 2055U, 2066U, 2067U, 2082U, 2083U, 2084U, 2088U, 2104U, 2125U},
        19U,
    },
    {
        "gameplay_live_race_mid",
        "../tools/out/design_lane3_live_race_mid_frame0_native",
        TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
        TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT,
        true,
        12U,
        {3U, 11U},
        2U,
    },
};

static bool expect_pointer(
    const char* rail,
    unsigned frame,
    const char* key,
    bool actual_has_value,
    uint8_t actual_bank,
    uint16_t actual_addr,
    uint8_t expected_bank,
    uint16_t expected_addr,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (!actual_has_value ||
        actual_bank != expected_bank ||
        actual_addr != expected_addr) {
        fprintf(stderr,
                "FAIL %s frame %u %s expected %02X:%04X got %s%02X:%04X\n",
                rail,
                frame,
                key,
                expected_bank,
                expected_addr,
                actual_has_value ? "" : "missing/",
                actual_bank,
                actual_addr);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_u16(
    const char* rail,
    unsigned frame,
    const char* key,
    bool actual_has_value,
    uint16_t actual_value,
    uint16_t expected_value,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (!actual_has_value || actual_value != expected_value) {
        fprintf(stderr,
                "FAIL %s frame %u %s expected %u got %s%u\n",
                rail,
                frame,
                key,
                (unsigned)expected_value,
                actual_has_value ? "" : "missing/",
                (unsigned)actual_value);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_source(
    const char* rail,
    unsigned frame,
    Td2RuntimeStateSource actual_source,
    Td2RuntimeStateSource expected_source,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual_source != expected_source) {
        fprintf(stderr,
                "FAIL %s frame %u source expected %d got %d\n",
                rail,
                frame,
                (int)expected_source,
                (int)actual_source);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_bool(
    const char* rail,
    const char* key,
    bool actual_value,
    bool expected_value,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual_value != expected_value) {
        fprintf(stderr,
                "FAIL %s %s expected %s got %s\n",
                rail,
                key,
                expected_value ? "true" : "false",
                actual_value ? "true" : "false");
        (*failed_checks)++;
        return false;
    }
    return true;
}

static void verify_intro_frame(
    const Td2Runtime* runtime,
    unsigned frame,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    const Td2RuntimeState* state = &runtime->state;

    expect_source("intro_noinput", frame, state->source, TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL, total_checks, failed_checks);
    expect_pointer("intro_noinput", frame, "active_main_callback",
                   state->has_active_main_callback,
                   state->active_main_callback_bank,
                   state->active_main_callback_addr,
                   frame >= 1102U ? 0x00U : 0x01U,
                   frame >= 1102U ? 0x8029U : 0x9FE5U,
                   total_checks,
                   failed_checks);
    expect_pointer("intro_noinput", frame, "active_irq_callback",
                   state->has_active_irq_callback,
                   state->active_irq_callback_bank,
                   state->active_irq_callback_addr,
                   0x00U,
                   0x835FU,
                   total_checks,
                   failed_checks);
    expect_pointer("intro_noinput", frame, "active_nmi_callback",
                   state->has_active_nmi_callback,
                   state->active_nmi_callback_bank,
                   state->active_nmi_callback_addr,
                   0x00U,
                   0x8029U,
                   total_checks,
                   failed_checks);
    expect_u16("intro_noinput", frame, "state_0202", state->has_state_0202, state->state_0202, 1U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_0208", state->has_state_0208, state->state_0208, 13U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_020a", state->has_state_020a, state->state_020a, 0x9CC3U, total_checks, failed_checks);
    if (frame == 986U) {
        expect_u16("intro_noinput", frame, "state_0204", state->has_state_0204, state->state_0204, 3U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "state_0206", state->has_state_0206, state->state_0206, 0U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "state_040a", state->has_state_040a, state->state_040a, 5U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 56U, total_checks, failed_checks);
        return;
    }
    if (frame == 1093U) {
        expect_u16("intro_noinput", frame, "state_0204", state->has_state_0204, state->state_0204, 1U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "state_0206", state->has_state_0206, state->state_0206, 13U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "state_040a", state->has_state_040a, state->state_040a, 17U, total_checks, failed_checks);
        expect_u16("intro_noinput", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 128U, total_checks, failed_checks);
        return;
    }
    expect_u16("intro_noinput", frame, "state_0204", state->has_state_0204, state->state_0204, 1U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_0206", state->has_state_0206, state->state_0206, 13U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_040a", state->has_state_040a, state->state_040a, 17U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_1c6a", state->has_state_1c6a, state->state_1c6a, 0U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_1c70", state->has_state_1c70, state->state_1c70, 0U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 0U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 128U, total_checks, failed_checks);
    expect_u16("intro_noinput", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 128U, total_checks, failed_checks);
}

static void verify_menu_frame(
    const Td2Runtime* runtime,
    unsigned frame,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    const Td2RuntimeState* state = &runtime->state;

    expect_source("menu_gameplay_entry", frame, state->source, TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT, total_checks, failed_checks);
    if (frame >= 2044U) {
        expect_pointer("menu_gameplay_entry", frame, "active_main_callback",
                       state->has_active_main_callback,
                       state->active_main_callback_bank,
                       state->active_main_callback_addr,
                       0x02U,
                       0x9016U,
                       total_checks,
                       failed_checks);
        expect_pointer("menu_gameplay_entry", frame, "active_irq_callback",
                       state->has_active_irq_callback,
                       state->active_irq_callback_bank,
                       state->active_irq_callback_addr,
                       0x01U,
                       0x96A0U,
                       total_checks,
                       failed_checks);
        expect_pointer("menu_gameplay_entry", frame, "active_nmi_callback",
                       state->has_active_nmi_callback,
                       state->active_nmi_callback_bank,
                       state->active_nmi_callback_addr,
                       0x02U,
                       0x8F3CU,
                       total_checks,
                       failed_checks);
    } else {
        uint8_t main_bank = 0x00U;
        uint16_t main_addr = 0x8029U;

        if (frame == 1640U) {
            main_bank = 0x01U;
            main_addr = 0xC1D2U;
        } else if (frame == 1857U) {
            main_bank = 0x01U;
            main_addr = 0xBE43U;
        }
        expect_pointer("menu_gameplay_entry", frame, "active_main_callback",
                       state->has_active_main_callback,
                       state->active_main_callback_bank,
                       state->active_main_callback_addr,
                       main_bank,
                       main_addr,
                       total_checks,
                       failed_checks);
        expect_pointer("menu_gameplay_entry", frame, "active_irq_callback",
                       state->has_active_irq_callback,
                       state->active_irq_callback_bank,
                       state->active_irq_callback_addr,
                       0x00U,
                       0x835FU,
                       total_checks,
                       failed_checks);
        expect_pointer("menu_gameplay_entry", frame, "active_nmi_callback",
                       state->has_active_nmi_callback,
                       state->active_nmi_callback_bank,
                       state->active_nmi_callback_addr,
                       0x00U,
                       0x8029U,
                       total_checks,
                       failed_checks);
    }

    switch (frame) {
        case 1500U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 3U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 136U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 136U, total_checks, failed_checks);
            break;
        case 1640U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 192U, total_checks, failed_checks);
            break;
        case 1677U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 192U, total_checks, failed_checks);
            break;
        case 1857U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 208U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 208U, total_checks, failed_checks);
            break;
        case 2014U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 7035U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 228U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0206", state->has_state_0206, state->state_0206, 205U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0208", state->has_state_0208, state->state_0208, 228U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_020a", state->has_state_020a, state->state_020a, 205U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 1U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 208U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 208U, total_checks, failed_checks);
            break;
        case 2044U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 0xFFFFU, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0204", state->has_state_0204, state->state_0204, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0206", state->has_state_0206, state->state_0206, 0xFFFEU, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_0208", state->has_state_0208, state->state_0208, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_020a", state->has_state_020a, state->state_020a, 0xFFFDU, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_040a", state->has_state_040a, state->state_040a, 0xFFFDU, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_11f3", state->has_state_11f3, state->state_11f3, 44U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 232U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 88U, total_checks, failed_checks);
            break;
        case 2050U:
            expect_u16("menu_gameplay_entry", frame, "state_0202", state->has_state_0202, state->state_0202, 0xFFFFU, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_11f3", state->has_state_11f3, state->state_11f3, 44U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 96U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 112U, total_checks, failed_checks);
            break;
        case 2052U:
        case 2054U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 40U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 9U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 248U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 248U, total_checks, failed_checks);
            break;
        case 2053U:
        case 2055U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 27U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 10U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 18U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 4U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 248U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 248U, total_checks, failed_checks);
            break;
        case 2066U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 38U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 9U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 248U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 248U, total_checks, failed_checks);
            break;
        case 2067U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 27U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 18U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 4U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 248U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 248U, total_checks, failed_checks);
            break;
        case 2082U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 40U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 9U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 248U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 8U, total_checks, failed_checks);
            break;
        case 2083U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 27U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 18U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 4U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 8U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 8U, total_checks, failed_checks);
            break;
        case 2084U:
        case 2088U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 40U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 2U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 9U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 8U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 8U, total_checks, failed_checks);
            break;
        case 2104U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 38U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_137c", state->has_state_137c, state->state_137c, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 192U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 9U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 8U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 8U, total_checks, failed_checks);
            break;
        case 2125U:
            expect_u16("menu_gameplay_entry", frame, "state_09a2", state->has_state_09a2, state->state_09a2, 27U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_09a8", state->has_state_09a8, state->state_09a8, 10U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "state_137c", state->has_state_137c, state->state_137c, 0U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0020", state->has_dp_0020, state->dp_0020, 18U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0022", state->has_dp_0022, state->dp_0022, 4U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 24U, total_checks, failed_checks);
            expect_u16("menu_gameplay_entry", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 24U, total_checks, failed_checks);
            break;
        default:
            break;
    }
}

static void verify_gameplay_frame(
    const Td2Runtime* runtime,
    unsigned frame,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    const Td2RuntimeState* state = &runtime->state;

    expect_source("gameplay_live_race_mid", frame, state->source, TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT, total_checks, failed_checks);
    expect_pointer("gameplay_live_race_mid", frame, "active_main_callback",
                   state->has_active_main_callback,
                   state->active_main_callback_bank,
                   state->active_main_callback_addr,
                   0x02U,
                   0x9016U,
                   total_checks,
                   failed_checks);
    expect_pointer("gameplay_live_race_mid", frame, "active_irq_callback",
                   state->has_active_irq_callback,
                   state->active_irq_callback_bank,
                   state->active_irq_callback_addr,
                   0x01U,
                   0x96A0U,
                   total_checks,
                   failed_checks);
    expect_pointer("gameplay_live_race_mid", frame, "active_nmi_callback",
                   state->has_active_nmi_callback,
                   state->active_nmi_callback_bank,
                   state->active_nmi_callback_addr,
                   0x02U,
                   0x8F3CU,
                   total_checks,
                   failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "state_0202", state->has_state_0202, state->state_0202, 0xFFFFU, total_checks, failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "state_1c6a", state->has_state_1c6a, state->state_1c6a, 1U, total_checks, failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "state_1c70", state->has_state_1c70, state->state_1c70, 0U, total_checks, failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "state_1c76", state->has_state_1c76, state->state_1c76, 1U, total_checks, failed_checks);
    if (frame == 3U) {
        expect_u16("gameplay_live_race_mid", frame, "state_11f3", state->has_state_11f3, state->state_11f3, 477U, total_checks, failed_checks);
        expect_u16("gameplay_live_race_mid", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 136U, total_checks, failed_checks);
        expect_u16("gameplay_live_race_mid", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 152U, total_checks, failed_checks);
        return;
    }
    expect_u16("gameplay_live_race_mid", frame, "state_11f3", state->has_state_11f3, state->state_11f3, 479U, total_checks, failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "dp_0053", state->has_dp_0053, state->dp_0053, 200U, total_checks, failed_checks);
    expect_u16("gameplay_live_race_mid", frame, "dp_0054", state->has_dp_0054, state->dp_0054, 200U, total_checks, failed_checks);
}

static bool verify_rail(
    const Td2RailCase* rail,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    Td2RuntimeConfig config;
    char error[256];
    unsigned i;
    bool rendered = false;

    memset(&config, 0, sizeof(config));
    config.scene_dir = rail->scene_dir;
    config.headless = true;
    config.scheduler_profile = rail->profile;

    if (!td2_runtime_init(&runtime, &config, error, sizeof(error))) {
        fprintf(stderr, "FAIL %s runtime init: %s\n", rail->label, error);
        (*failed_checks)++;
        return false;
    }

    expect_bool(rail->label,
                "scheduler.contract_loaded",
                runtime.scheduler.contract_loaded,
                rail->expected_contract_loaded,
                total_checks,
                failed_checks);
    expect_u16(rail->label,
               0U,
               "scheduler.segment_count",
               true,
               (uint16_t)runtime.scheduler.segment_count,
               (uint16_t)rail->expected_segment_count,
               total_checks,
               failed_checks);

    for (i = 0U; i < rail->checkpoint_count; i++) {
        unsigned target_frame = rail->checkpoints[i];

        if (!runtime.design_pack.has_frame_number ||
            target_frame < runtime.design_pack.frame_number) {
            fprintf(stderr, "FAIL %s invalid checkpoint %u for base frame %u\n",
                    rail->label,
                    target_frame,
                    runtime.design_pack.frame_number);
            (*failed_checks)++;
            td2_runtime_free(&runtime);
            return false;
        }

        runtime.frame_counter = target_frame - runtime.design_pack.frame_number;
        if (!td2_runtime_sync_frame_state(&runtime, error, sizeof(error))) {
            fprintf(stderr, "FAIL %s frame %u sync error: %s\n", rail->label, target_frame, error);
            (*failed_checks)++;
            td2_runtime_free(&runtime);
            return false;
        }
        if (!rendered) {
            if (!td2_runtime_render_frame(&runtime, error, sizeof(error))) {
                fprintf(stderr, "FAIL %s frame %u render error: %s\n", rail->label, target_frame, error);
                (*failed_checks)++;
                td2_runtime_free(&runtime);
                return false;
            }
            rendered = true;
        }

        if (rail->profile == TD2_SCHEDULER_PROFILE_INTRO_NOINPUT) {
            verify_intro_frame(&runtime, target_frame, total_checks, failed_checks);
        } else if (rail->profile == TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY) {
            verify_menu_frame(&runtime, target_frame, total_checks, failed_checks);
        } else if (rail->profile == TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID) {
            verify_gameplay_frame(&runtime, target_frame, total_checks, failed_checks);
        }
        expect_source(rail->label,
                      target_frame,
                      runtime.state.source,
                      rail->expected_source,
                      total_checks,
                      failed_checks);
        expect_u16(rail->label,
                   target_frame,
                   "ppu.frame_number",
                   true,
                   (uint16_t)runtime.ppu.frame_number,
                   (uint16_t)target_frame,
                   total_checks,
                   failed_checks);
    }

    td2_runtime_free(&runtime);
    return true;
}

int main(void) {
    unsigned total_checks = 0U;
    unsigned failed_checks = 0U;
    unsigned rail_count = 0U;
    unsigned i;

    for (i = 0U; i < (unsigned)(sizeof(k_rails) / sizeof(k_rails[0])); i++) {
        if (verify_rail(&k_rails[i], &total_checks, &failed_checks)) {
            rail_count++;
        }
    }

    if (failed_checks != 0U) {
        fprintf(stderr,
                "FAIL: scheduler smoke mismatched %u checks across %u/%zu rails\n",
                failed_checks,
                rail_count,
                sizeof(k_rails) / sizeof(k_rails[0]));
        return 1;
    }

    printf("PASS: scheduler smoke matched %u checks across %u rails\n",
           total_checks,
           rail_count);
    return 0;
}
