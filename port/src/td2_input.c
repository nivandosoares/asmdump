#include "../include/td2_input.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0U) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

static bool parse_uint(const char* text, unsigned* value) {
    char* end = NULL;
    unsigned long parsed = strtoul(text, &end, 10);

    if (text == NULL || text[0] == '\0' || end == NULL || *end != '\0') {
        return false;
    }
    *value = (unsigned)parsed;
    return true;
}

static bool append_mask_token(uint16_t* mask, const char* token) {
    if (strcmp(token, "a") == 0) {
        *mask |= TD2_INPUT_MASK_A;
        return true;
    }
    if (strcmp(token, "b") == 0) {
        *mask |= TD2_INPUT_MASK_B;
        return true;
    }
    if (strcmp(token, "x") == 0) {
        *mask |= TD2_INPUT_MASK_X;
        return true;
    }
    if (strcmp(token, "y") == 0) {
        *mask |= TD2_INPUT_MASK_Y;
        return true;
    }
    if (strcmp(token, "l") == 0) {
        *mask |= TD2_INPUT_MASK_L;
        return true;
    }
    if (strcmp(token, "r") == 0) {
        *mask |= TD2_INPUT_MASK_R;
        return true;
    }
    if (strcmp(token, "select") == 0) {
        *mask |= TD2_INPUT_MASK_SELECT;
        return true;
    }
    if (strcmp(token, "start") == 0) {
        *mask |= TD2_INPUT_MASK_START;
        return true;
    }
    if (strcmp(token, "up") == 0) {
        *mask |= TD2_INPUT_MASK_UP;
        return true;
    }
    if (strcmp(token, "down") == 0) {
        *mask |= TD2_INPUT_MASK_DOWN;
        return true;
    }
    if (strcmp(token, "left") == 0) {
        *mask |= TD2_INPUT_MASK_LEFT;
        return true;
    }
    if (strcmp(token, "right") == 0) {
        *mask |= TD2_INPUT_MASK_RIGHT;
        return true;
    }
    return false;
}

static bool parse_buttons(const char* text, uint16_t* mask, char* error, size_t error_size) {
    char buffer[256];
    char* token = NULL;
    char* save = NULL;

    *mask = TD2_INPUT_MASK_NONE;
    snprintf(buffer, sizeof(buffer), "%s", text);
    token = strtok_r(buffer, ",", &save);
    while (token != NULL) {
        if (!append_mask_token(mask, token)) {
            set_error(error, error_size, "invalid input token");
            return false;
        }
        token = strtok_r(NULL, ",", &save);
    }

    if (*mask == TD2_INPUT_MASK_NONE) {
        set_error(error, error_size, "empty input mask");
        return false;
    }
    return true;
}

void td2_input_script_reset(Td2InputScript* script) {
    if (script != NULL) {
        memset(script, 0, sizeof(*script));
    }
}

bool td2_input_script_parse(
    Td2InputScript* script,
    const char* text,
    char* error,
    size_t error_size
) {
    char buffer[1024];
    char* item = NULL;
    char* save = NULL;

    td2_input_script_reset(script);
    if (text == NULL || text[0] == '\0') {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    snprintf(buffer, sizeof(buffer), "%s", text);
    item = strtok_r(buffer, ";", &save);
    while (item != NULL) {
        Td2InputWindow* window;
        char* colon = strchr(item, ':');
        char* dash = NULL;
        unsigned start_frame = 0U;
        unsigned end_frame = 0U;
        uint16_t mask = TD2_INPUT_MASK_NONE;

        if (script->window_count >= TD2_INPUT_WINDOWS_MAX) {
            set_error(error, error_size, "input script exceeds TD2_INPUT_WINDOWS_MAX");
            return false;
        }
        if (colon == NULL) {
            set_error(error, error_size, "input script is missing ':'");
            return false;
        }
        *colon = '\0';
        dash = strchr(item, '-');
        if (dash != NULL) {
            *dash = '\0';
            if (!parse_uint(item, &start_frame) ||
                !parse_uint(dash + 1, &end_frame) ||
                end_frame < start_frame) {
                set_error(error, error_size, "invalid input frame range");
                return false;
            }
        } else {
            if (!parse_uint(item, &start_frame)) {
                set_error(error, error_size, "invalid input frame");
                return false;
            }
            end_frame = start_frame;
        }
        if (!parse_buttons(colon + 1, &mask, error, error_size)) {
            return false;
        }

        window = &script->windows[script->window_count++];
        memset(window, 0, sizeof(*window));
        window->available = true;
        window->start_frame = start_frame;
        window->end_frame = end_frame;
        window->mask = mask;
        script->available = true;

        item = strtok_r(NULL, ";", &save);
    }

    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_input_script_record_mask(
    Td2InputScript* script,
    unsigned frame_number,
    uint16_t mask,
    char* error,
    size_t error_size
) {
    Td2InputWindow* window = NULL;

    if (script == NULL) {
        set_error(error, error_size, "missing input history");
        return false;
    }
    if (mask == TD2_INPUT_MASK_NONE) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (script->window_count > 0U) {
        Td2InputWindow* last = &script->windows[script->window_count - 1U];

        if (last->available &&
            frame_number >= last->start_frame &&
            frame_number <= last->end_frame) {
            if (last->start_frame == frame_number &&
                last->end_frame == frame_number) {
                last->mask = mask;
                if (error_size > 0U) {
                    error[0] = '\0';
                }
                return true;
            }
            if (last->mask == mask && last->end_frame == frame_number) {
                if (error_size > 0U) {
                    error[0] = '\0';
                }
                return true;
            }
            set_error(error, error_size, "cannot overwrite recorded multi-frame input window");
            return false;
        }

        if (last->available &&
            last->mask == mask &&
            last->end_frame + 1U == frame_number) {
            last->end_frame = frame_number;
            if (error_size > 0U) {
                error[0] = '\0';
            }
            return true;
        }
    }

    if (script->window_count >= TD2_INPUT_WINDOWS_MAX) {
        set_error(error, error_size, "input history exceeds TD2_INPUT_WINDOWS_MAX");
        return false;
    }

    window = &script->windows[script->window_count++];
    memset(window, 0, sizeof(*window));
    window->available = true;
    window->start_frame = frame_number;
    window->end_frame = frame_number;
    window->mask = mask;
    script->available = true;
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

uint16_t td2_input_script_mask_for_frame(
    const Td2InputScript* script,
    unsigned frame_number
) {
    uint16_t mask = TD2_INPUT_MASK_NONE;
    unsigned i;

    if (script == NULL || !script->available) {
        return TD2_INPUT_MASK_NONE;
    }

    for (i = 0U; i < script->window_count; i++) {
        const Td2InputWindow* window = &script->windows[i];
        if (window->available &&
            frame_number >= window->start_frame &&
            frame_number <= window->end_frame) {
            mask |= window->mask;
        }
    }
    return mask;
}

bool td2_input_script_has_mask_in_range(
    const Td2InputScript* script,
    uint16_t required_mask,
    unsigned start_frame,
    unsigned end_frame
) {
    unsigned i;

    if (script == NULL || !script->available || end_frame < start_frame) {
        return false;
    }

    for (i = 0U; i < script->window_count; i++) {
        const Td2InputWindow* window = &script->windows[i];
        if (!window->available ||
            window->end_frame < start_frame ||
            window->start_frame > end_frame) {
            continue;
        }
        if ((window->mask & required_mask) == required_mask) {
            return true;
        }
    }
    return false;
}
