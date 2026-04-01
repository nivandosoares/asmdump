#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "td2_callback_model.h"
#include "td2_contracts.h"

typedef struct {
    unsigned frame;
} Td2CallbackModelCase;

static const Td2CallbackModelCase k_cases[] = {
    {654U},
    {974U},
    {976U},
    {986U},
    {990U},
    {994U},
    {998U},
    {1005U},
    {1013U},
    {1014U},
    {1021U},
    {1022U},
    {1029U},
    {1037U},
    {1045U},
    {1053U},
    {1061U},
    {1069U},
    {1077U},
    {1085U},
    {1093U},
};

static bool expect_pointer(
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
                "FAIL frame %u %s expected %02X:%04X got %s%02X:%04X\n",
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
                "FAIL frame %u %s expected %u got %s%u\n",
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

int main(int argc, char** argv) {
    const char* scene_dir = argc > 1 ? argv[1] : "assets/test_dump_frame300/design_pack";
    unsigned total_checks = 0U;
    unsigned failed_checks = 0U;
    unsigned passed_frames = 0U;
    unsigned i;

    for (i = 0U; i < (unsigned)(sizeof(k_cases) / sizeof(k_cases[0])); i++) {
        Td2CallbackTraceContract contract;
        Td2RuntimeState state;
        char error[256];
        bool frame_failed = false;
        unsigned frame = k_cases[i].frame;

        if (!td2_callback_contract_load_for_frame(
                &contract,
                scene_dir,
                frame,
                true,
                error,
                sizeof(error))) {
            fprintf(stderr, "FAIL frame %u loader error: %s\n", frame, error);
            return 1;
        }
        if (!contract.available) {
            fprintf(stderr, "FAIL frame %u missing contract row\n", frame);
            return 1;
        }
        if (!td2_callback_model_build_state_for_frame(&state, frame)) {
            fprintf(stderr, "FAIL frame %u missing callback model coverage\n", frame);
            return 1;
        }
        if (state.source != TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL) {
            fprintf(stderr, "FAIL frame %u expected callback model source\n", frame);
            return 1;
        }

        if (contract.expected_state.has_active_main_callback) {
            frame_failed |= !expect_pointer(
                frame,
                "active_main_callback",
                state.has_active_main_callback,
                state.active_main_callback_bank,
                state.active_main_callback_addr,
                contract.expected_state.active_main_callback_bank,
                contract.expected_state.active_main_callback_addr,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_active_irq_callback) {
            frame_failed |= !expect_pointer(
                frame,
                "active_irq_callback",
                state.has_active_irq_callback,
                state.active_irq_callback_bank,
                state.active_irq_callback_addr,
                contract.expected_state.active_irq_callback_bank,
                contract.expected_state.active_irq_callback_addr,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_active_nmi_callback) {
            frame_failed |= !expect_pointer(
                frame,
                "active_nmi_callback",
                state.has_active_nmi_callback,
                state.active_nmi_callback_bank,
                state.active_nmi_callback_addr,
                contract.expected_state.active_nmi_callback_bank,
                contract.expected_state.active_nmi_callback_addr,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_0202) {
            frame_failed |= !expect_u16(
                frame,
                "state_0202",
                state.has_state_0202,
                state.state_0202,
                contract.expected_state.state_0202,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_0204) {
            frame_failed |= !expect_u16(
                frame,
                "state_0204",
                state.has_state_0204,
                state.state_0204,
                contract.expected_state.state_0204,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_0206) {
            frame_failed |= !expect_u16(
                frame,
                "state_0206",
                state.has_state_0206,
                state.state_0206,
                contract.expected_state.state_0206,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_0208) {
            frame_failed |= !expect_u16(
                frame,
                "state_0208",
                state.has_state_0208,
                state.state_0208,
                contract.expected_state.state_0208,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_020a) {
            frame_failed |= !expect_u16(
                frame,
                "state_020a",
                state.has_state_020a,
                state.state_020a,
                contract.expected_state.state_020a,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_040a) {
            frame_failed |= !expect_u16(
                frame,
                "state_040a",
                state.has_state_040a,
                state.state_040a,
                contract.expected_state.state_040a,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_0960) {
            frame_failed |= !expect_u16(
                frame,
                "state_0960",
                state.has_state_0960,
                state.state_0960,
                contract.expected_state.state_0960,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_1c6a) {
            frame_failed |= !expect_u16(
                frame,
                "state_1c6a",
                state.has_state_1c6a,
                state.state_1c6a,
                contract.expected_state.state_1c6a,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_1c70) {
            frame_failed |= !expect_u16(
                frame,
                "state_1c70",
                state.has_state_1c70,
                state.state_1c70,
                contract.expected_state.state_1c70,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_1c76) {
            frame_failed |= !expect_u16(
                frame,
                "state_1c76",
                state.has_state_1c76,
                state.state_1c76,
                contract.expected_state.state_1c76,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_state_11f3) {
            frame_failed |= !expect_u16(
                frame,
                "state_11f3",
                state.has_state_11f3,
                state.state_11f3,
                contract.expected_state.state_11f3,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_dp_0053) {
            frame_failed |= !expect_u16(
                frame,
                "dp_0053",
                state.has_dp_0053,
                state.dp_0053,
                contract.expected_state.dp_0053,
                &total_checks,
                &failed_checks);
        }
        if (contract.expected_state.has_dp_0054) {
            frame_failed |= !expect_u16(
                frame,
                "dp_0054",
                state.has_dp_0054,
                state.dp_0054,
                contract.expected_state.dp_0054,
                &total_checks,
                &failed_checks);
        }

        if (!frame_failed) {
            passed_frames++;
        }
    }

    if (failed_checks != 0U) {
        fprintf(stderr,
                "FAIL: callback model mismatched %u checks across %u/%zu frames\n",
                failed_checks,
                passed_frames,
                sizeof(k_cases) / sizeof(k_cases[0]));
        return 1;
    }

    printf("PASS: callback model matched %u checks across %u frames\n",
           total_checks,
           passed_frames);
    return 0;
}
