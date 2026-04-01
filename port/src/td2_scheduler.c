#include "../include/td2_scheduler.h"
#include "../include/td2_callback_model.h"

#include <string.h>

static bool td2_path_contains(const char* path, const char* needle) {
    return path != NULL && needle != NULL && strstr(path, needle) != NULL;
}

static void td2_set_pointer(
    bool* has_value,
    uint8_t* bank_out,
    uint16_t* addr_out,
    uint8_t bank,
    uint16_t addr
) {
    *has_value = true;
    *bank_out = bank;
    *addr_out = addr;
}

static void td2_set_u16(
    bool* has_value,
    uint16_t* value_out,
    uint16_t value
) {
    *has_value = true;
    *value_out = value;
}

static Td2SchedulerProfile td2_scheduler_resolve_auto_profile(
    const char* scene_dir,
    const Td2DesignPack* pack
) {
    if (td2_path_contains(scene_dir, "live_race_mid")) {
        return TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID;
    }

    if (pack != NULL && pack->has_frame_number) {
        if (pack->frame_number >= 1500U && pack->frame_number <= 2050U) {
            return TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY;
        }
        if (pack->frame_number >= 654U && pack->frame_number <= 1117U) {
            return TD2_SCHEDULER_PROFILE_INTRO_NOINPUT;
        }
    }

    return TD2_SCHEDULER_PROFILE_NONE;
}

static bool td2_scheduler_build_menu_gameplay_entry(
    Td2RuntimeState* state,
    unsigned frame_number
) {
    if (frame_number < 1500U || frame_number > 2050U) {
        return false;
    }

    td2_runtime_state_reset(state);
    state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;

    td2_set_pointer(
        &state->has_active_irq_callback,
        &state->active_irq_callback_bank,
        &state->active_irq_callback_addr,
        0x00U,
        0x835FU);
    td2_set_pointer(
        &state->has_active_nmi_callback,
        &state->active_nmi_callback_bank,
        &state->active_nmi_callback_addr,
        0x00U,
        0x8029U);
    td2_set_u16(&state->has_state_1c6a, &state->state_1c6a, 1U);
    td2_set_u16(&state->has_state_1c70, &state->state_1c70, 0U);
    td2_set_u16(&state->has_state_11f3, &state->state_11f3, 0U);

    if (frame_number < 1640U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x00U,
            0x8029U);
        td2_set_u16(&state->has_state_0202, &state->state_0202, 1U);
        td2_set_u16(&state->has_state_0204, &state->state_0204, 3U);
        td2_set_u16(&state->has_state_0206, &state->state_0206, 0U);
        td2_set_u16(&state->has_state_0208, &state->state_0208, 13U);
        td2_set_u16(&state->has_state_020a, &state->state_020a, 0x9CC3U);
        td2_set_u16(&state->has_state_040a, &state->state_040a, 5U);
        td2_set_u16(&state->has_state_1c76, &state->state_1c76, 0U);
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 136U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 136U);
        return true;
    }

    if (frame_number < 1677U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0xC1D2U);
        td2_set_u16(&state->has_state_0202, &state->state_0202, 1U);
        td2_set_u16(&state->has_state_0204, &state->state_0204, 2U);
        td2_set_u16(&state->has_state_0206, &state->state_0206, 0U);
        td2_set_u16(&state->has_state_0208, &state->state_0208, 13U);
        td2_set_u16(&state->has_state_020a, &state->state_020a, 0x9CC3U);
        td2_set_u16(&state->has_state_040a, &state->state_040a, 5U);
        td2_set_u16(&state->has_state_1c76, &state->state_1c76, 0U);
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 192U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 192U);
        return true;
    }

    if (frame_number < 1857U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x00U,
            0x8029U);
        td2_set_u16(&state->has_state_0202, &state->state_0202, 1U);
        td2_set_u16(&state->has_state_0204, &state->state_0204, 2U);
        td2_set_u16(&state->has_state_0206, &state->state_0206, 0U);
        td2_set_u16(&state->has_state_0208, &state->state_0208, 13U);
        td2_set_u16(&state->has_state_020a, &state->state_020a, 0x9CC3U);
        td2_set_u16(&state->has_state_040a, &state->state_040a, 5U);
        td2_set_u16(&state->has_state_1c76, &state->state_1c76, 0U);
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 192U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 192U);
        return true;
    }

    if (frame_number < 2014U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0xBE43U);
        td2_set_u16(&state->has_state_0202, &state->state_0202, 1U);
        td2_set_u16(&state->has_state_0204, &state->state_0204, 2U);
        td2_set_u16(&state->has_state_0206, &state->state_0206, 0U);
        td2_set_u16(&state->has_state_0208, &state->state_0208, 13U);
        td2_set_u16(&state->has_state_020a, &state->state_020a, 0x9CC3U);
        td2_set_u16(&state->has_state_040a, &state->state_040a, 5U);
        td2_set_u16(&state->has_state_1c76, &state->state_1c76, 1U);
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 208U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 208U);
        return true;
    }

    if (frame_number < 2044U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x00U,
            0x8029U);
        td2_set_u16(&state->has_state_0202, &state->state_0202, 7035U);
        td2_set_u16(&state->has_state_0204, &state->state_0204, 228U);
        td2_set_u16(&state->has_state_0206, &state->state_0206, 205U);
        td2_set_u16(&state->has_state_0208, &state->state_0208, 228U);
        td2_set_u16(&state->has_state_020a, &state->state_020a, 205U);
        td2_set_u16(&state->has_state_040a, &state->state_040a, 5U);
        td2_set_u16(&state->has_state_1c76, &state->state_1c76, 1U);
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 208U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 208U);
        return true;
    }

    td2_set_pointer(
        &state->has_active_main_callback,
        &state->active_main_callback_bank,
        &state->active_main_callback_addr,
        0x02U,
        0x9016U);
    td2_set_pointer(
        &state->has_active_irq_callback,
        &state->active_irq_callback_bank,
        &state->active_irq_callback_addr,
        0x01U,
        0x96A0U);
    td2_set_pointer(
        &state->has_active_nmi_callback,
        &state->active_nmi_callback_bank,
        &state->active_nmi_callback_addr,
        0x02U,
        0x8F3CU);
    td2_set_u16(&state->has_state_0202, &state->state_0202, 0xFFFFU);
    td2_set_u16(&state->has_state_0204, &state->state_0204, 0U);
    td2_set_u16(&state->has_state_0206, &state->state_0206, 0xFFFEU);
    td2_set_u16(&state->has_state_0208, &state->state_0208, 0U);
    td2_set_u16(&state->has_state_020a, &state->state_020a, 0xFFFDU);
    td2_set_u16(&state->has_state_040a, &state->state_040a, 0xFFFDU);
    td2_set_u16(&state->has_state_1c76, &state->state_1c76, 1U);
    td2_set_u16(&state->has_state_11f3, &state->state_11f3, 44U);
    if (frame_number < 2050U) {
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 232U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 88U);
    } else {
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 96U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 112U);
    }
    return true;
}

static bool td2_scheduler_build_gameplay_live_race_mid(
    Td2RuntimeState* state,
    unsigned frame_number
) {
    uint16_t state_11f3 = 477U;

    if (frame_number > 11U) {
        return false;
    }

    if (frame_number >= 8U) {
        state_11f3++;
    }
    if (frame_number >= 11U) {
        state_11f3++;
    }

    td2_runtime_state_reset(state);
    state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;

    td2_set_pointer(
        &state->has_active_main_callback,
        &state->active_main_callback_bank,
        &state->active_main_callback_addr,
        0x02U,
        0x9016U);
    td2_set_pointer(
        &state->has_active_irq_callback,
        &state->active_irq_callback_bank,
        &state->active_irq_callback_addr,
        0x01U,
        0x96A0U);
    td2_set_pointer(
        &state->has_active_nmi_callback,
        &state->active_nmi_callback_bank,
        &state->active_nmi_callback_addr,
        0x02U,
        0x8F3CU);
    td2_set_u16(&state->has_state_0202, &state->state_0202, 0xFFFFU);
    td2_set_u16(&state->has_state_0204, &state->state_0204, 0U);
    td2_set_u16(&state->has_state_0206, &state->state_0206, 0xFFFEU);
    td2_set_u16(&state->has_state_0208, &state->state_0208, 0U);
    td2_set_u16(&state->has_state_020a, &state->state_020a, 0xFFFDU);
    td2_set_u16(&state->has_state_040a, &state->state_040a, 0xFFFDU);
    td2_set_u16(&state->has_state_1c6a, &state->state_1c6a, 1U);
    td2_set_u16(&state->has_state_1c70, &state->state_1c70, 0U);
    td2_set_u16(&state->has_state_1c76, &state->state_1c76, 1U);
    td2_set_u16(&state->has_state_11f3, &state->state_11f3, state_11f3);
    if (frame_number < 3U) {
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 120U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 120U);
    } else if (frame_number >= 11U) {
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, 200U);
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, 200U);
    } else {
        td2_set_u16(&state->has_dp_0053, &state->dp_0053, (uint16_t)(136U + ((frame_number - 3U) * 8U)));
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, (uint16_t)(152U + ((frame_number - 3U) * 6U)));
    }
    return true;
}

bool td2_scheduler_parse_profile(
    const char* text,
    Td2SchedulerProfile* profile
) {
    if (text == NULL || profile == NULL) {
        return false;
    }
    if (strcmp(text, "none") == 0) {
        *profile = TD2_SCHEDULER_PROFILE_NONE;
        return true;
    }
    if (strcmp(text, "auto") == 0) {
        *profile = TD2_SCHEDULER_PROFILE_AUTO;
        return true;
    }
    if (strcmp(text, "intro_noinput") == 0) {
        *profile = TD2_SCHEDULER_PROFILE_INTRO_NOINPUT;
        return true;
    }
    if (strcmp(text, "menu_gameplay_entry") == 0) {
        *profile = TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY;
        return true;
    }
    if (strcmp(text, "gameplay_live_race_mid") == 0) {
        *profile = TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID;
        return true;
    }
    return false;
}

const char* td2_scheduler_profile_name(Td2SchedulerProfile profile) {
    switch (profile) {
        case TD2_SCHEDULER_PROFILE_NONE:
            return "none";
        case TD2_SCHEDULER_PROFILE_AUTO:
            return "auto";
        case TD2_SCHEDULER_PROFILE_INTRO_NOINPUT:
            return "intro_noinput";
        case TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY:
            return "menu_gameplay_entry";
        case TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID:
            return "gameplay_live_race_mid";
        default:
            return "unknown";
    }
}

bool td2_scheduler_init(
    Td2Scheduler* scheduler,
    Td2SchedulerProfile requested_profile,
    const char* scene_dir,
    const Td2DesignPack* pack,
    char* error,
    size_t error_size
) {
    memset(scheduler, 0, sizeof(*scheduler));
    scheduler->requested_profile = requested_profile;
    scheduler->active_profile = requested_profile == TD2_SCHEDULER_PROFILE_AUTO
        ? td2_scheduler_resolve_auto_profile(scene_dir, pack)
        : requested_profile;

    (void)error;
    (void)error_size;
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_scheduler_build_state(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
) {
    td2_runtime_state_reset(state);
    if (scheduler == NULL || state == NULL) {
        return false;
    }

    switch (scheduler->active_profile) {
        case TD2_SCHEDULER_PROFILE_INTRO_NOINPUT:
            return td2_callback_model_build_state_for_frame(state, frame_number);
        case TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY:
            return td2_scheduler_build_menu_gameplay_entry(state, frame_number);
        case TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID:
            return td2_scheduler_build_gameplay_live_race_mid(state, frame_number);
        case TD2_SCHEDULER_PROFILE_NONE:
        case TD2_SCHEDULER_PROFILE_AUTO:
        default:
            return false;
    }
}
