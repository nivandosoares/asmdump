#ifndef TD2_CALLBACK_MODEL_H
#define TD2_CALLBACK_MODEL_H

#include <stdbool.h>

#include "td2_contracts.h"

bool td2_callback_model_build_state_for_frame(
    Td2RuntimeState* state,
    unsigned frame_number
);

#endif
