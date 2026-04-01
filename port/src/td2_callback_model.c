#include "../include/td2_callback_model.h"

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

static uint16_t td2_mode7_9fe5_state_0204(unsigned frame_number) {
    if (frame_number <= 989U) {
        return 3U;
    }
    if (frame_number <= 993U) {
        return 2U;
    }
    if (frame_number <= 997U) {
        return 1U;
    }
    if (frame_number <= 1004U) {
        return 2U;
    }
    if (frame_number <= 1012U) {
        return 3U;
    }
    if (frame_number == 1013U) {
        return 1U;
    }
    if (frame_number <= 1020U) {
        return 2U;
    }
    return 1U;
}

static uint16_t td2_mode7_9fe5_state_0206(unsigned frame_number) {
    if (frame_number <= 1028U) {
        return 0U;
    }
    if (frame_number <= 1036U) {
        return 1U;
    }
    if (frame_number <= 1044U) {
        return 3U;
    }
    if (frame_number <= 1052U) {
        return 5U;
    }
    if (frame_number <= 1060U) {
        return 7U;
    }
    if (frame_number <= 1068U) {
        return 9U;
    }
    if (frame_number <= 1076U) {
        return 11U;
    }
    return 13U;
}

static uint16_t td2_mode7_9fe5_state_040a(unsigned frame_number) {
    if (frame_number <= 1028U) {
        return 5U;
    }
    if (frame_number <= 1036U) {
        return 6U;
    }
    if (frame_number <= 1044U) {
        return 8U;
    }
    if (frame_number <= 1052U) {
        return 10U;
    }
    if (frame_number <= 1060U) {
        return 12U;
    }
    if (frame_number <= 1068U) {
        return 14U;
    }
    if (frame_number <= 1076U) {
        return 16U;
    }
    return 17U;
}

static uint16_t td2_mode7_9fe5_dp0054(unsigned frame_number) {
    if (frame_number <= 1005U) {
        return (uint16_t)(56U + ((frame_number - 986U) * 8U));
    }
    if (frame_number <= 1012U) {
        return (uint16_t)((216U + ((frame_number - 1006U) * 8U)) & 0xffU);
    }
    if (frame_number == 1013U) {
        return 8U;
    }
    if (frame_number == 1014U) {
        return 16U;
    }
    if (frame_number <= 1028U) {
        return 32U;
    }
    if (frame_number >= 1077U) {
        return 128U;
    }
    return (uint16_t)(40U + ((frame_number - 1029U) * 2U));
}

static bool td2_build_mode7_9fe5_family(
    Td2RuntimeState* state,
    unsigned frame_number
) {
    if (frame_number < 986U || frame_number > 1117U) {
        return false;
    }

    td2_runtime_state_reset(state);
    state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;

    td2_set_pointer(&state->has_active_irq_callback,
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

    if (frame_number <= 1101U) {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0x9FE5U);
    } else {
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x00U,
            0x8029U);
    }

    td2_set_u16(&state->has_state_0202, &state->state_0202, 1U);
    td2_set_u16(&state->has_state_0208, &state->state_0208, 13U);
    td2_set_u16(&state->has_state_020a, &state->state_020a, 0x9CC3U);
    if (frame_number <= 1093U) {
        td2_set_u16(&state->has_state_0204, &state->state_0204, td2_mode7_9fe5_state_0204(frame_number));
        td2_set_u16(&state->has_state_0206, &state->state_0206, td2_mode7_9fe5_state_0206(frame_number));
        td2_set_u16(&state->has_state_040a, &state->state_040a, td2_mode7_9fe5_state_040a(frame_number));
        td2_set_u16(&state->has_dp_0054, &state->dp_0054, td2_mode7_9fe5_dp0054(frame_number));
        return true;
    }

    td2_set_u16(&state->has_state_0204, &state->state_0204, 1U);
    td2_set_u16(&state->has_state_0206, &state->state_0206, 13U);
    td2_set_u16(&state->has_state_040a, &state->state_040a, 17U);
    td2_set_u16(&state->has_state_1c6a, &state->state_1c6a, 0U);
    td2_set_u16(&state->has_state_1c70, &state->state_1c70, 0U);
    td2_set_u16(&state->has_state_1c76, &state->state_1c76, 0U);
    td2_set_u16(&state->has_dp_0053, &state->dp_0053, 128U);
    td2_set_u16(&state->has_dp_0054, &state->dp_0054, 128U);
    return true;
}

bool td2_callback_model_build_state_for_frame(
    Td2RuntimeState* state,
    unsigned frame_number
) {
    td2_runtime_state_reset(state);

    if (frame_number == 654U) {
        state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0xA39CU);
        return true;
    }

    if (frame_number == 974U) {
        state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0x9D69U);
        return true;
    }

    if (frame_number == 976U) {
        state->source = TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL;
        td2_set_pointer(
            &state->has_active_main_callback,
            &state->active_main_callback_bank,
            &state->active_main_callback_addr,
            0x01U,
            0x9FE5U);
        return true;
    }

    return td2_build_mode7_9fe5_family(state, frame_number);
}
