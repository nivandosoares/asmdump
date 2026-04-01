#include "../include/td2_scheduler.h"
#include "../include/td2_callback_model.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0U) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

static bool file_exists(const char* path) {
    FILE* file = fopen(path, "rb");

    if (file == NULL) {
        return false;
    }
    fclose(file);
    return true;
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

static bool td2_parse_json_int(const char* json, const char* key, int* value) {
    const char* pos = strstr(json, key);

    if (pos == NULL) {
        return false;
    }
    pos += strlen(key);
    while (*pos == ' ' || *pos == '\t') {
        pos++;
    }
    if (strncmp(pos, "null", 4) == 0) {
        return false;
    }
    *value = atoi(pos);
    return true;
}

static bool td2_path_contains(const char* path, const char* needle) {
    return path != NULL && needle != NULL && strstr(path, needle) != NULL;
}

static const char* td2_profile_id_text(Td2SchedulerProfile profile) {
    switch (profile) {
        case TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY:
            return "menu_gameplay_entry";
        case TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID:
            return "gameplay_live_race_mid";
        default:
            return NULL;
    }
}

static void td2_scheduler_set_u16(bool* has_value, uint16_t* value, uint16_t next_value) {
    *has_value = true;
    *value = next_value;
}

typedef struct {
    unsigned frame_number;
    bool has_state_09a2;
    uint16_t state_09a2;
    bool has_state_09a8;
    uint16_t state_09a8;
    bool has_state_137c;
    uint16_t state_137c;
    bool has_dp_0020;
    uint16_t dp_0020;
    bool has_dp_0022;
    uint16_t dp_0022;
    bool has_dp_0053;
    uint16_t dp_0053;
    bool has_dp_0054;
    uint16_t dp_0054;
} Td2MeasuredMenuFrame;

static const Td2MeasuredMenuFrame k_menu_default_rival_a_frames[] = {
    {
        2052U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 248U,
        true, 0U,
    },
    {
        2053U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 0U,
        true, 0U,
    },
    {
        2054U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 0U,
        true, 8U,
    },
    {
        2055U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 8U,
        true, 8U,
    },
    {
        2056U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 8U,
        true, 16U,
    },
    {
        2057U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 16U,
        true, 16U,
    },
    {
        2058U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 16U,
        true, 24U,
    },
    {
        2059U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 24U,
        true, 24U,
    },
    {
        2060U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 24U,
        true, 32U,
    },
    {
        2061U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 32U,
        true, 32U,
    },
    {
        2062U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 82U,
        true, 9U,
        true, 32U,
        true, 40U,
    },
    {
        2063U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 40U,
        true, 40U,
    },
    {
        2064U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 82U,
        true, 9U,
        true, 40U,
        true, 48U,
    },
    {
        2065U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 48U,
        true, 48U,
    },
    {
        2066U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 192U,
        true, 9U,
        true, 48U,
        true, 48U,
    },
    {
        2067U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 48U,
        true, 48U,
    },
    {
        2068U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 83U,
        true, 9U,
        true, 48U,
        true, 56U,
    },
    {
        2069U,
        true, 27U,
        true, 10U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 56U,
        true, 56U,
    },
    {
        2070U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 84U,
        true, 9U,
        true, 56U,
        true, 64U,
    },
    {
        2071U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 64U,
        true, 64U,
    },
    {
        2072U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 84U,
        true, 9U,
        true, 64U,
        true, 72U,
    },
    {
        2073U,
        true, 27U,
        true, 10U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 72U,
        true, 72U,
    },
    {
        2074U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 72U,
        true, 80U,
    },
    {
        2075U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 80U,
        true, 80U,
    },
    {
        2076U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 88U,
        true, 9U,
        true, 80U,
        true, 88U,
    },
    {
        2077U,
        true, 27U,
        true, 10U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 88U,
        true, 88U,
    },
    {
        2078U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 88U,
        true, 96U,
    },
    {
        2079U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 96U,
        true, 96U,
    },
    {
        2080U,
        true, 38U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 96U,
        true, 104U,
    },
    {
        2081U,
        true, 27U,
        true, 10U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 104U,
        true, 104U,
    },
    {
        2082U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 104U,
        true, 128U,
    },
    {
        2083U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 170U,
        true, 289U,
        true, 128U,
        true, 128U,
    },
    {
        2084U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 128U,
        true, 136U,
    },
    {
        2085U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 136U,
        true, 136U,
    },
    {
        2086U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 89U,
        true, 9U,
        true, 136U,
        true, 144U,
    },
    {
        2087U,
        true, 27U,
        true, 2U,
        true, 0U,
        true, 18U,
        true, 4U,
        true, 144U,
        true, 144U,
    },
    {
        2088U,
        true, 40U,
        true, 2U,
        true, 0U,
        true, 87U,
        true, 9U,
        true, 144U,
        true, 152U,
    },
};

static void td2_scheduler_apply_measured_menu_frame(
    const Td2MeasuredMenuFrame* frame,
    Td2RuntimeState* state
) {
    if (frame == NULL || state == NULL) {
        return;
    }

    if (frame->has_state_09a2) {
        td2_scheduler_set_u16(&state->has_state_09a2, &state->state_09a2, frame->state_09a2);
    }
    if (frame->has_state_09a8) {
        td2_scheduler_set_u16(&state->has_state_09a8, &state->state_09a8, frame->state_09a8);
    }
    if (frame->has_state_137c) {
        td2_scheduler_set_u16(&state->has_state_137c, &state->state_137c, frame->state_137c);
    }
    if (frame->has_dp_0020) {
        td2_scheduler_set_u16(&state->has_dp_0020, &state->dp_0020, frame->dp_0020);
    }
    if (frame->has_dp_0022) {
        td2_scheduler_set_u16(&state->has_dp_0022, &state->dp_0022, frame->dp_0022);
    }
    if (frame->has_dp_0053) {
        td2_scheduler_set_u16(&state->has_dp_0053, &state->dp_0053, frame->dp_0053);
    }
    if (frame->has_dp_0054) {
        td2_scheduler_set_u16(&state->has_dp_0054, &state->dp_0054, frame->dp_0054);
    }
}

static uint16_t td2_scheduler_mask_for_frame(
    const Td2Scheduler* scheduler,
    unsigned frame_number
) {
    uint16_t mask = TD2_INPUT_MASK_NONE;

    if (scheduler == NULL) {
        return TD2_INPUT_MASK_NONE;
    }

    mask |= td2_input_script_mask_for_frame(&scheduler->input_script, frame_number);
    mask |= td2_input_script_mask_for_frame(&scheduler->live_input_history, frame_number);
    return mask;
}

static bool td2_scheduler_has_mask_in_range(
    const Td2Scheduler* scheduler,
    uint16_t required_mask,
    unsigned start_frame,
    unsigned end_frame
) {
    if (scheduler == NULL) {
        return false;
    }

    return td2_input_script_has_mask_in_range(
               &scheduler->input_script,
               required_mask,
               start_frame,
               end_frame) ||
           td2_input_script_has_mask_in_range(
               &scheduler->live_input_history,
               required_mask,
               start_frame,
               end_frame);
}

static void td2_scheduler_apply_current_input(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
) {
    uint16_t input_mask;

    if (scheduler == NULL || state == NULL) {
        return;
    }

    input_mask = td2_scheduler_mask_for_frame(scheduler, frame_number);
    if (input_mask == TD2_INPUT_MASK_NONE) {
        return;
    }
    state->has_state_0960 = true;
    state->state_0960 = input_mask;
}

static bool td2_scheduler_has_menu_no_opponent_route(
    const Td2Scheduler* scheduler
) {
    bool has_diagonal = td2_scheduler_has_mask_in_range(
        scheduler,
        (uint16_t)(TD2_INPUT_MASK_RIGHT | TD2_INPUT_MASK_DOWN),
        1584U,
        1589U);
    bool has_confirm = td2_scheduler_has_mask_in_range(
        scheduler,
        TD2_INPUT_MASK_START,
        1730U,
        1735U) ||
        td2_scheduler_has_mask_in_range(
            scheduler,
            TD2_INPUT_MASK_A,
            1730U,
            1735U);

    return has_diagonal && has_confirm;
}

static bool td2_scheduler_has_menu_default_rival_route(
    const Td2Scheduler* scheduler
) {
    return td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_START,
               1200U,
               1200U) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_START,
               1280U,
               1280U) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_START,
               1505U,
               1510U) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               (uint16_t)(TD2_INPUT_MASK_RIGHT | TD2_INPUT_MASK_DOWN),
               1584U,
               1589U) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_START,
               1640U,
               1645U) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_START,
               1730U,
               1735U);
}

static bool td2_scheduler_has_menu_default_rival_a_hold(
    const Td2Scheduler* scheduler
) {
    return td2_scheduler_has_menu_default_rival_route(scheduler) &&
           td2_scheduler_has_mask_in_range(
               scheduler,
               TD2_INPUT_MASK_A,
               2050U,
               2208U);
}

static void td2_scheduler_apply_menu_default_rival_a_anchor(
    unsigned frame_number,
    Td2RuntimeState* state
) {
    size_t i;

    for (i = 0U; i < sizeof(k_menu_default_rival_a_frames) / sizeof(k_menu_default_rival_a_frames[0]); i++) {
        if (k_menu_default_rival_a_frames[i].frame_number != frame_number) {
            continue;
        }
        td2_scheduler_apply_measured_menu_frame(&k_menu_default_rival_a_frames[i], state);
        return;
    }

    switch (frame_number) {
        case 2104U:
            td2_scheduler_set_u16(&state->has_state_09a2, &state->state_09a2, 38U);
            td2_scheduler_set_u16(&state->has_state_09a8, &state->state_09a8, 2U);
            td2_scheduler_set_u16(&state->has_state_137c, &state->state_137c, 1U);
            td2_scheduler_set_u16(&state->has_dp_0020, &state->dp_0020, 105U);
            td2_scheduler_set_u16(&state->has_dp_0022, &state->dp_0022, 9U);
            td2_scheduler_set_u16(&state->has_dp_0053, &state->dp_0053, 200U);
            td2_scheduler_set_u16(&state->has_dp_0054, &state->dp_0054, 208U);
            return;
        case 2125U:
            td2_scheduler_set_u16(&state->has_state_09a2, &state->state_09a2, 26U);
            td2_scheduler_set_u16(&state->has_state_09a8, &state->state_09a8, 10U);
            td2_scheduler_set_u16(&state->has_state_137c, &state->state_137c, 1U);
            td2_scheduler_set_u16(&state->has_dp_0020, &state->dp_0020, 19U);
            td2_scheduler_set_u16(&state->has_dp_0022, &state->dp_0022, 289U);
            td2_scheduler_set_u16(&state->has_dp_0053, &state->dp_0053, 8U);
            td2_scheduler_set_u16(&state->has_dp_0054, &state->dp_0054, 8U);
            return;
        default:
            return;
    }
}

static void td2_scheduler_apply_profile_input_mutations(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
) {
    if (scheduler == NULL || state == NULL) {
        return;
    }

    td2_scheduler_apply_current_input(scheduler, frame_number, state);

    if (scheduler->active_profile == TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY &&
        frame_number >= 2044U &&
        td2_scheduler_has_menu_no_opponent_route(scheduler) &&
        !td2_scheduler_has_menu_default_rival_route(scheduler)) {
        td2_scheduler_set_u16(&state->has_state_1c70, &state->state_1c70, 3U);
        td2_scheduler_set_u16(&state->has_state_1c76, &state->state_1c76, 0U);
    }

    if (scheduler->active_profile == TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY &&
        td2_scheduler_has_menu_default_rival_a_hold(scheduler)) {
        td2_scheduler_apply_menu_default_rival_a_anchor(frame_number, state);
    }
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

static bool td2_scheduler_load_contract_segments(
    Td2Scheduler* scheduler,
    Td2SchedulerProfile profile,
    const char* scene_dir,
    char* error,
    size_t error_size
) {
    char contracts_path[1400];
    char profile_pattern[128];
    const char* profile_id = td2_profile_id_text(profile);
    char profile_block[65536];
    char segment_block[4096];
    char* json = NULL;
    size_t json_size = 0U;
    const char* profile_anchor = NULL;
    const char* cursor = NULL;
    unsigned segment_count = 0U;

    if (profile_id == NULL) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (!td2_contracts_resolve_repo_relative_path(
            scene_dir,
            "rom_analysis/docs/scheduler_rail_contracts.jsonc",
            contracts_path,
            sizeof(contracts_path)) ||
        !file_exists(contracts_path)) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    json = read_text_file(contracts_path, &json_size);
    if (json == NULL || json_size == 0U) {
        free(json);
        set_error(error, error_size, "failed to read scheduler_rail_contracts.jsonc");
        return false;
    }

    snprintf(profile_pattern, sizeof(profile_pattern), "\"id\": \"%s\"", profile_id);
    profile_anchor = strstr(json, profile_pattern);
    if (profile_anchor == NULL) {
        free(json);
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (!td2_contracts_extract_object_block(json, profile_anchor, profile_block, sizeof(profile_block))) {
        free(json);
        set_error(error, error_size, "failed to extract scheduler profile block");
        return false;
    }

    cursor = profile_block;
    while ((cursor = strstr(cursor, "\"start_frame\":")) != NULL) {
        Td2SchedulerSegment* segment;
        int start_frame = 0;
        int end_frame = 0;

        if (segment_count >= TD2_SCHEDULER_SEGMENTS_MAX) {
            free(json);
            set_error(error, error_size, "scheduler contract exceeds TD2_SCHEDULER_SEGMENTS_MAX");
            return false;
        }
        if (!td2_contracts_extract_object_block(profile_block, cursor, segment_block, sizeof(segment_block))) {
            free(json);
            set_error(error, error_size, "failed to extract scheduler segment block");
            return false;
        }
        if (!td2_parse_json_int(segment_block, "\"start_frame\":", &start_frame) ||
            !td2_parse_json_int(segment_block, "\"end_frame\":", &end_frame)) {
            free(json);
            set_error(error, error_size, "scheduler segment missing start/end frame");
            return false;
        }

        segment = &scheduler->segments[segment_count++];
        memset(segment, 0, sizeof(*segment));
        segment->available = true;
        segment->start_frame = (unsigned)start_frame;
        segment->end_frame = (unsigned)end_frame;
        td2_runtime_state_parse_json_fields(&segment->state, segment_block);
        segment->state.source = TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT;
        cursor += strlen("\"start_frame\":");
    }

    scheduler->contract_loaded = segment_count > 0U;
    scheduler->segment_count = segment_count;
    free(json);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

static bool td2_scheduler_build_contract_state(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
) {
    unsigned i;

    if (scheduler == NULL || !scheduler->contract_loaded) {
        return false;
    }

    for (i = 0U; i < scheduler->segment_count; i++) {
        const Td2SchedulerSegment* segment = &scheduler->segments[i];

        if (!segment->available ||
            frame_number < segment->start_frame ||
            frame_number > segment->end_frame) {
            continue;
        }
        *state = segment->state;
        return true;
    }

    return false;
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
    const char* input_script,
    const Td2DesignPack* pack,
    char* error,
    size_t error_size
) {
    memset(scheduler, 0, sizeof(*scheduler));
    if (!td2_input_script_parse(&scheduler->input_script, input_script, error, error_size)) {
        return false;
    }
    td2_input_script_reset(&scheduler->live_input_history);
    scheduler->requested_profile = requested_profile;
    scheduler->active_profile = requested_profile == TD2_SCHEDULER_PROFILE_AUTO
        ? td2_scheduler_resolve_auto_profile(scene_dir, pack)
        : requested_profile;

    if (!td2_scheduler_load_contract_segments(
            scheduler,
            scheduler->active_profile,
            scene_dir,
            error,
            error_size)) {
        return false;
    }

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
            if (!td2_callback_model_build_state_for_frame(state, frame_number)) {
                return false;
            }
            td2_scheduler_apply_profile_input_mutations(scheduler, frame_number, state);
            return true;
        case TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY:
        case TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID:
            if (!td2_scheduler_build_contract_state(scheduler, frame_number, state)) {
                return false;
            }
            td2_scheduler_apply_profile_input_mutations(scheduler, frame_number, state);
            return true;
        case TD2_SCHEDULER_PROFILE_NONE:
        case TD2_SCHEDULER_PROFILE_AUTO:
        default:
            return false;
    }
}

bool td2_scheduler_record_live_input(
    Td2Scheduler* scheduler,
    unsigned frame_number,
    uint16_t mask,
    char* error,
    size_t error_size
) {
    if (scheduler == NULL) {
        set_error(error, error_size, "missing scheduler");
        return false;
    }
    return td2_input_script_record_mask(
        &scheduler->live_input_history,
        frame_number,
        mask,
        error,
        error_size);
}
