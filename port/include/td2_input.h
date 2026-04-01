#ifndef TD2_INPUT_H
#define TD2_INPUT_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define TD2_INPUT_WINDOWS_MAX 64

typedef enum {
    TD2_INPUT_MASK_NONE = 0x0000U,
    TD2_INPUT_MASK_B = 0x8000U,
    TD2_INPUT_MASK_Y = 0x4000U,
    TD2_INPUT_MASK_SELECT = 0x2000U,
    TD2_INPUT_MASK_START = 0x1000U,
    TD2_INPUT_MASK_UP = 0x0800U,
    TD2_INPUT_MASK_DOWN = 0x0400U,
    TD2_INPUT_MASK_LEFT = 0x0200U,
    TD2_INPUT_MASK_RIGHT = 0x0100U,
    TD2_INPUT_MASK_A = 0x0080U,
    TD2_INPUT_MASK_X = 0x0040U,
    TD2_INPUT_MASK_L = 0x0020U,
    TD2_INPUT_MASK_R = 0x0010U,
} Td2InputMask;

typedef struct {
    bool available;
    unsigned start_frame;
    unsigned end_frame;
    uint16_t mask;
} Td2InputWindow;

typedef struct {
    bool available;
    unsigned window_count;
    Td2InputWindow windows[TD2_INPUT_WINDOWS_MAX];
} Td2InputScript;

void td2_input_script_reset(Td2InputScript* script);
bool td2_input_script_parse(
    Td2InputScript* script,
    const char* text,
    char* error,
    size_t error_size
);
uint16_t td2_input_script_mask_for_frame(
    const Td2InputScript* script,
    unsigned frame_number
);
bool td2_input_script_has_mask_in_range(
    const Td2InputScript* script,
    uint16_t required_mask,
    unsigned start_frame,
    unsigned end_frame
);

#endif
