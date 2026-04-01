#ifndef TD2_CONTRACTS_H
#define TD2_CONTRACTS_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define TD2_CONTRACT_ID_BYTES 64
#define TD2_CONTRACT_PHASE_BYTES 64
#define TD2_CONTRACT_NOTE_BYTES 160

typedef enum {
    TD2_RUNTIME_STATE_SOURCE_NONE = 0,
    TD2_RUNTIME_STATE_SOURCE_CONTRACT_SEED = 1,
    TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL = 2,
} Td2RuntimeStateSource;

typedef struct {
    Td2RuntimeStateSource source;
    bool has_active_main_callback;
    uint8_t active_main_callback_bank;
    uint16_t active_main_callback_addr;
    bool has_active_irq_callback;
    uint8_t active_irq_callback_bank;
    uint16_t active_irq_callback_addr;
    bool has_active_nmi_callback;
    uint8_t active_nmi_callback_bank;
    uint16_t active_nmi_callback_addr;
    bool has_state_0202;
    uint16_t state_0202;
    bool has_state_0204;
    uint16_t state_0204;
    bool has_state_0206;
    uint16_t state_0206;
    bool has_state_0208;
    uint16_t state_0208;
    bool has_state_020a;
    uint16_t state_020a;
    bool has_state_040a;
    uint16_t state_040a;
    bool has_state_1c6a;
    uint16_t state_1c6a;
    bool has_state_1c70;
    uint16_t state_1c70;
    bool has_state_1c76;
    uint16_t state_1c76;
    bool has_state_11f3;
    uint16_t state_11f3;
    bool has_dp_0053;
    uint16_t dp_0053;
    bool has_dp_0054;
    uint16_t dp_0054;
} Td2RuntimeState;

typedef struct {
    bool available;
    unsigned frame;
    char contract_id[TD2_CONTRACT_ID_BYTES];
    char phase[TD2_CONTRACT_PHASE_BYTES];
    char note[TD2_CONTRACT_NOTE_BYTES];
    Td2RuntimeState expected_state;
} Td2CallbackTraceContract;

void td2_runtime_state_reset(Td2RuntimeState* state);
void td2_runtime_state_seed_from_contract(
    Td2RuntimeState* state,
    const Td2CallbackTraceContract* contract
);
bool td2_callback_contract_load_for_frame(
    Td2CallbackTraceContract* contract,
    const char* scene_dir,
    unsigned frame_number,
    bool has_frame_number,
    char* error,
    size_t error_size
);

#endif
