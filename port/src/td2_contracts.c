#include "../include/td2_contracts.h"

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

static void join_path(char* out, size_t out_size, const char* a, const char* b) {
    if (a[0] == '\0') {
        snprintf(out, out_size, "%s", b);
        return;
    }
    snprintf(out, out_size, "%s/%s", a, b);
}

static bool parse_json_int(const char* json, const char* key, int* value) {
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

static bool parse_json_string(const char* json, const char* key, char* out, size_t out_size) {
    const char* pos = strstr(json, key);
    const char* end;
    size_t len;

    if (pos == NULL || out_size == 0U) {
        return false;
    }

    pos += strlen(key);
    end = strchr(pos, '"');
    if (end == NULL) {
        return false;
    }

    len = (size_t)(end - pos);
    if (len >= out_size) {
        len = out_size - 1U;
    }
    memcpy(out, pos, len);
    out[len] = '\0';
    return true;
}

static bool parse_snes_pointer(
    const char* json,
    const char* key,
    uint8_t* bank,
    uint16_t* addr
) {
    const char* pos = strstr(json, key);
    unsigned parsed_bank;
    unsigned parsed_addr;

    if (pos == NULL) {
        return false;
    }

    pos += strlen(key);
    if (sscanf(pos, "%2x:%4x", &parsed_bank, &parsed_addr) != 2) {
        return false;
    }

    *bank = (uint8_t)parsed_bank;
    *addr = (uint16_t)parsed_addr;
    return true;
}

static void strip_last_path_component(char* path) {
    char* slash = strrchr(path, '/');
    if (slash != NULL) {
        *slash = '\0';
    } else {
        path[0] = '\0';
    }
}

static bool find_repo_root(const char* scene_dir, char* out, size_t out_size) {
    char candidate[1200];
    char probe[1400];

    snprintf(candidate, sizeof(candidate), "%s", scene_dir);

    while (1) {
        if (candidate[0] == '\0') {
            snprintf(probe, sizeof(probe), "PORT_PLAN.md");
        } else {
            join_path(probe, sizeof(probe), candidate, "PORT_PLAN.md");
        }
        if (file_exists(probe)) {
            snprintf(out, out_size, "%s", candidate);
            return true;
        }
        if (candidate[0] == '\0') {
            break;
        }
        strip_last_path_component(candidate);
    }

    return false;
}

static bool resolve_contracts_path(
    const char* scene_dir,
    char* out,
    size_t out_size
) {
    char repo_root[1200];

    if (!find_repo_root(scene_dir, repo_root, sizeof(repo_root))) {
        return false;
    }

    if (repo_root[0] == '\0') {
        snprintf(out, out_size, "rom_analysis/docs/callback_state_contracts.jsonc");
    } else {
        join_path(out, out_size, repo_root, "rom_analysis/docs/callback_state_contracts.jsonc");
    }
    return true;
}

static bool extract_object_block(
    const char* json,
    const char* anchor,
    char* out,
    size_t out_size
) {
    const char* start = anchor;
    const char* end = NULL;
    int depth = 0;

    while (start > json && *start != '{') {
        start--;
    }
    if (*start != '{') {
        return false;
    }

    end = start;
    while (*end != '\0') {
        if (*end == '{') {
            depth++;
        } else if (*end == '}') {
            depth--;
            if (depth == 0) {
                size_t len = (size_t)(end - start + 1);
                if (len >= out_size) {
                    len = out_size - 1U;
                }
                memcpy(out, start, len);
                out[len] = '\0';
                return true;
            }
        }
        end++;
    }

    return false;
}

static const char* find_frame_anchor(const char* json, unsigned frame_number) {
    const char* cursor = json;
    int parsed_frame;

    while ((cursor = strstr(cursor, "\"frame\":")) != NULL) {
        if (parse_json_int(cursor, "\"frame\":", &parsed_frame) &&
            parsed_frame == (int)frame_number) {
            return cursor;
        }
        cursor += strlen("\"frame\":");
    }

    return NULL;
}

static const char* find_last_before(
    const char* json,
    const char* limit,
    const char* pattern
) {
    const char* cursor = json;
    const char* last = NULL;

    while ((cursor = strstr(cursor, pattern)) != NULL && cursor < limit) {
        last = cursor;
        cursor += 1;
    }

    return last;
}

static void parse_optional_u16(
    const char* block,
    const char* key,
    bool* has_value,
    uint16_t* value
) {
    int parsed_int = 0;

    if (parse_json_int(block, key, &parsed_int)) {
        *has_value = true;
        *value = (uint16_t)parsed_int;
    }
}

void td2_runtime_state_reset(Td2RuntimeState* state) {
    memset(state, 0, sizeof(*state));
}

void td2_runtime_state_seed_from_contract(
    Td2RuntimeState* state,
    const Td2CallbackTraceContract* contract
) {
    td2_runtime_state_reset(state);
    if (contract == NULL || !contract->available) {
        return;
    }
    *state = contract->expected_state;
    state->source = TD2_RUNTIME_STATE_SOURCE_CONTRACT_SEED;
}

bool td2_callback_contract_load_for_frame(
    Td2CallbackTraceContract* contract,
    const char* scene_dir,
    unsigned frame_number,
    bool has_frame_number,
    char* error,
    size_t error_size
) {
    char contracts_path[1400];
    char check_block[2048];
    char* json = NULL;
    size_t json_size = 0;
    const char* frame_anchor = NULL;
    const char* contract_id_anchor = NULL;
    const char* phase_anchor = NULL;

    memset(contract, 0, sizeof(*contract));
    if (!has_frame_number) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (!resolve_contracts_path(scene_dir, contracts_path, sizeof(contracts_path)) ||
        !file_exists(contracts_path)) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    json = read_text_file(contracts_path, &json_size);
    if (json == NULL || json_size == 0U) {
        free(json);
        set_error(error, error_size, "failed to read callback_state_contracts.jsonc");
        return false;
    }

    frame_anchor = find_frame_anchor(json, frame_number);
    if (frame_anchor == NULL) {
        free(json);
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (!extract_object_block(json, frame_anchor, check_block, sizeof(check_block))) {
        free(json);
        set_error(error, error_size, "failed to extract callback contract check");
        return false;
    }

    contract->available = true;
    contract->frame = frame_number;
    contract_id_anchor = find_last_before(json, frame_anchor, "\"id\": \"");
    phase_anchor = find_last_before(json, frame_anchor, "\"phase\": \"");
    if (contract_id_anchor != NULL) {
        parse_json_string(contract_id_anchor, "\"id\": \"", contract->contract_id, sizeof(contract->contract_id));
    }
    if (phase_anchor != NULL) {
        parse_json_string(phase_anchor, "\"phase\": \"", contract->phase, sizeof(contract->phase));
    }
    parse_json_string(check_block, "\"note\": \"", contract->note, sizeof(contract->note));

    contract->expected_state.has_active_main_callback = parse_snes_pointer(
        check_block,
        "\"active_main_callback\": \"",
        &contract->expected_state.active_main_callback_bank,
        &contract->expected_state.active_main_callback_addr);
    contract->expected_state.has_active_irq_callback = parse_snes_pointer(
        check_block,
        "\"active_irq_callback\": \"",
        &contract->expected_state.active_irq_callback_bank,
        &contract->expected_state.active_irq_callback_addr);
    contract->expected_state.has_active_nmi_callback = parse_snes_pointer(
        check_block,
        "\"active_nmi_callback\": \"",
        &contract->expected_state.active_nmi_callback_bank,
        &contract->expected_state.active_nmi_callback_addr);

    parse_optional_u16(check_block, "\"state_0202\":", &contract->expected_state.has_state_0202, &contract->expected_state.state_0202);
    parse_optional_u16(check_block, "\"state_0204\":", &contract->expected_state.has_state_0204, &contract->expected_state.state_0204);
    parse_optional_u16(check_block, "\"state_0206\":", &contract->expected_state.has_state_0206, &contract->expected_state.state_0206);
    parse_optional_u16(check_block, "\"state_0208\":", &contract->expected_state.has_state_0208, &contract->expected_state.state_0208);
    parse_optional_u16(check_block, "\"state_020a\":", &contract->expected_state.has_state_020a, &contract->expected_state.state_020a);
    parse_optional_u16(check_block, "\"state_040a\":", &contract->expected_state.has_state_040a, &contract->expected_state.state_040a);
    parse_optional_u16(check_block, "\"state_1c6a\":", &contract->expected_state.has_state_1c6a, &contract->expected_state.state_1c6a);
    parse_optional_u16(check_block, "\"state_1c70\":", &contract->expected_state.has_state_1c70, &contract->expected_state.state_1c70);
    parse_optional_u16(check_block, "\"state_1c76\":", &contract->expected_state.has_state_1c76, &contract->expected_state.state_1c76);
    parse_optional_u16(check_block, "\"state_11f3\":", &contract->expected_state.has_state_11f3, &contract->expected_state.state_11f3);
    parse_optional_u16(check_block, "\"dp_0053\":", &contract->expected_state.has_dp_0053, &contract->expected_state.dp_0053);
    parse_optional_u16(check_block, "\"dp_0054\":", &contract->expected_state.has_dp_0054, &contract->expected_state.dp_0054);

    free(json);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}
