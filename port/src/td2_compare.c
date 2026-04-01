#include "../include/td2_compare.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0U) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

static uint32_t rgb_to_argb(uint8_t red, uint8_t green, uint8_t blue) {
    return 0xff000000U |
           ((uint32_t)red << 16) |
           ((uint32_t)green << 8) |
           (uint32_t)blue;
}

static void unpack_argb(uint32_t pixel, uint8_t* red, uint8_t* green, uint8_t* blue) {
    *red = (uint8_t)((pixel >> 16) & 0xffU);
    *green = (uint8_t)((pixel >> 8) & 0xffU);
    *blue = (uint8_t)(pixel & 0xffU);
}

static void write_be32(FILE* file, uint32_t value) {
    fputc((int)((value >> 24) & 0xffU), file);
    fputc((int)((value >> 16) & 0xffU), file);
    fputc((int)((value >> 8) & 0xffU), file);
    fputc((int)(value & 0xffU), file);
}

static uint32_t td2_crc32_accumulate(uint32_t crc, const uint8_t* data, size_t size) {
    size_t i;

    for (i = 0U; i < size; i++) {
        unsigned bit_index;
        crc ^= data[i];
        for (bit_index = 0U; bit_index < 8U; bit_index++) {
            crc = (crc & 1U) != 0U
                ? (crc >> 1) ^ 0xedb88320U
                : (crc >> 1);
        }
    }
    return crc;
}

static uint32_t td2_adler32(const uint8_t* data, size_t size) {
    uint32_t a = 1U;
    uint32_t b = 0U;
    size_t i;

    for (i = 0U; i < size; i++) {
        a = (a + data[i]) % 65521U;
        b = (b + a) % 65521U;
    }
    return (b << 16) | a;
}

static bool write_png_chunk(
    FILE* file,
    const char chunk_type[4],
    const uint8_t* data,
    size_t data_size
) {
    uint32_t crc;

    write_be32(file, (uint32_t)data_size);
    if (fwrite(chunk_type, 1U, 4U, file) != 4U) {
        return false;
    }
    if (data_size != 0U && fwrite(data, 1U, data_size, file) != data_size) {
        return false;
    }

    crc = td2_crc32_accumulate(0xffffffffU, (const uint8_t*)chunk_type, 4U);
    if (data_size != 0U) {
        crc = td2_crc32_accumulate(crc, data, data_size);
    }
    write_be32(file, crc ^ 0xffffffffU);
    return true;
}

bool td2_compare_write_argb_ppm(
    const char* path,
    const uint32_t* framebuffer,
    int width,
    int height,
    char* error,
    size_t error_size
) {
    FILE* file = fopen(path, "wb");
    int y;

    if (file == NULL) {
        set_error(error, error_size, "failed to open compare dump file");
        return false;
    }

    fprintf(file, "P6\n%d %d\n255\n", width, height);
    for (y = 0; y < height; y++) {
        int x;
        for (x = 0; x < width; x++) {
            uint32_t pixel = framebuffer[(y * width) + x];
            uint8_t rgb[3];
            rgb[0] = (uint8_t)((pixel >> 16) & 0xffU);
            rgb[1] = (uint8_t)((pixel >> 8) & 0xffU);
            rgb[2] = (uint8_t)(pixel & 0xffU);
            fwrite(rgb, sizeof(rgb), 1U, file);
        }
    }

    fclose(file);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_compare_write_argb_png(
    const char* path,
    const uint32_t* framebuffer,
    int width,
    int height,
    char* error,
    size_t error_size
) {
    static const uint8_t k_png_signature[8] = {
        0x89U, 0x50U, 0x4eU, 0x47U, 0x0dU, 0x0aU, 0x1aU, 0x0aU
    };
    FILE* file = NULL;
    uint8_t ihdr[13];
    uint8_t* raw = NULL;
    uint8_t* zlib = NULL;
    size_t row_bytes;
    size_t raw_size;
    size_t block_count;
    size_t zlib_capacity;
    size_t raw_offset = 0U;
    size_t zlib_offset = 0U;
    int y;

    if (width <= 0 || height <= 0) {
        set_error(error, error_size, "invalid PNG dimensions");
        return false;
    }

    row_bytes = 1U + ((size_t)width * 3U);
    raw_size = row_bytes * (size_t)height;
    block_count = (raw_size + 65534U) / 65535U;
    zlib_capacity = 2U + raw_size + (block_count * 5U) + 4U;

    raw = (uint8_t*)malloc(raw_size);
    zlib = (uint8_t*)malloc(zlib_capacity);
    if (raw == NULL || zlib == NULL) {
        free(raw);
        free(zlib);
        set_error(error, error_size, "failed to allocate PNG buffers");
        return false;
    }

    for (y = 0; y < height; y++) {
        int x;

        raw[raw_offset++] = 0U;
        for (x = 0; x < width; x++) {
            uint8_t red;
            uint8_t green;
            uint8_t blue;
            unpack_argb(framebuffer[(y * width) + x], &red, &green, &blue);
            raw[raw_offset++] = red;
            raw[raw_offset++] = green;
            raw[raw_offset++] = blue;
        }
    }

    zlib[zlib_offset++] = 0x78U;
    zlib[zlib_offset++] = 0x01U;
    raw_offset = 0U;
    while (raw_offset < raw_size) {
        size_t block_size = raw_size - raw_offset;
        uint16_t len;
        uint16_t nlen;

        if (block_size > 65535U) {
            block_size = 65535U;
        }
        len = (uint16_t)block_size;
        nlen = (uint16_t)~len;
        zlib[zlib_offset++] = (raw_offset + block_size) >= raw_size ? 0x01U : 0x00U;
        zlib[zlib_offset++] = (uint8_t)(len & 0xffU);
        zlib[zlib_offset++] = (uint8_t)((len >> 8) & 0xffU);
        zlib[zlib_offset++] = (uint8_t)(nlen & 0xffU);
        zlib[zlib_offset++] = (uint8_t)((nlen >> 8) & 0xffU);
        memcpy(zlib + zlib_offset, raw + raw_offset, block_size);
        zlib_offset += block_size;
        raw_offset += block_size;
    }

    {
        uint32_t adler = td2_adler32(raw, raw_size);
        zlib[zlib_offset++] = (uint8_t)((adler >> 24) & 0xffU);
        zlib[zlib_offset++] = (uint8_t)((adler >> 16) & 0xffU);
        zlib[zlib_offset++] = (uint8_t)((adler >> 8) & 0xffU);
        zlib[zlib_offset++] = (uint8_t)(adler & 0xffU);
    }

    file = fopen(path, "wb");
    if (file == NULL) {
        free(raw);
        free(zlib);
        set_error(error, error_size, "failed to open PNG dump file");
        return false;
    }

    if (fwrite(k_png_signature, 1U, sizeof(k_png_signature), file) != sizeof(k_png_signature)) {
        fclose(file);
        free(raw);
        free(zlib);
        set_error(error, error_size, "failed to write PNG signature");
        return false;
    }
    ihdr[0] = (uint8_t)(((uint32_t)width >> 24) & 0xffU);
    ihdr[1] = (uint8_t)(((uint32_t)width >> 16) & 0xffU);
    ihdr[2] = (uint8_t)(((uint32_t)width >> 8) & 0xffU);
    ihdr[3] = (uint8_t)((uint32_t)width & 0xffU);
    ihdr[4] = (uint8_t)(((uint32_t)height >> 24) & 0xffU);
    ihdr[5] = (uint8_t)(((uint32_t)height >> 16) & 0xffU);
    ihdr[6] = (uint8_t)(((uint32_t)height >> 8) & 0xffU);
    ihdr[7] = (uint8_t)((uint32_t)height & 0xffU);
    ihdr[8] = 8U;
    ihdr[9] = 2U;
    ihdr[10] = 0U;
    ihdr[11] = 0U;
    ihdr[12] = 0U;

    if (!write_png_chunk(file, "IHDR", ihdr, sizeof(ihdr)) ||
        !write_png_chunk(file, "IDAT", zlib, zlib_offset) ||
        !write_png_chunk(file, "IEND", NULL, 0U)) {
        fclose(file);
        free(raw);
        free(zlib);
        set_error(error, error_size, "failed to write PNG dump file");
        return false;
    }

    fclose(file);
    free(raw);
    free(zlib);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

static void write_json_string(FILE* file, const char* text) {
    const unsigned char* it = (const unsigned char*)text;

    fputc('"', file);
    while (*it != '\0') {
        if (*it == '\\' || *it == '"') {
            fputc('\\', file);
            fputc((int)*it, file);
        } else if (*it == '\n') {
            fputs("\\n", file);
        } else if (*it == '\r') {
            fputs("\\r", file);
        } else if (*it == '\t') {
            fputs("\\t", file);
        } else {
            fputc((int)*it, file);
        }
        it++;
    }
    fputc('"', file);
}

static void write_json_value(FILE* file, Td2CompareValueKind value_kind, int value) {
    if (value_kind == TD2_COMPARE_VALUE_BOOL) {
        fputs(value != 0 ? "true" : "false", file);
        return;
    }
    if (value_kind == TD2_COMPARE_VALUE_POINTER) {
        char text[16];
        unsigned bank = (unsigned)((value >> 16) & 0xffU);
        unsigned addr = (unsigned)(value & 0xffffU);
        snprintf(text, sizeof(text), "%02X:%04X", bank, addr);
        write_json_string(file, text);
        return;
    }
    fprintf(file, "%d", value);
}

static void td2_compare_state_reset(Td2CompareStateContract* contract) {
    memset(contract, 0, sizeof(*contract));
}

static void td2_compare_callback_reset(Td2CompareCallbackContract* contract) {
    memset(contract, 0, sizeof(*contract));
}

static const char* td2_runtime_state_source_name(Td2RuntimeStateSource source) {
    switch (source) {
        case TD2_RUNTIME_STATE_SOURCE_CONTRACT_SEED:
            return "contract_seed";
        case TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL:
            return "callback_model";
        case TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT:
            return "scheduler_contract";
        case TD2_RUNTIME_STATE_SOURCE_NONE:
        default:
            return "none";
    }
}

static void td2_compare_state_record(
    Td2CompareStateContract* contract,
    const char* key,
    Td2CompareValueKind value_kind,
    int expected,
    int actual
) {
    bool matched = expected == actual;

    contract->total_checks++;
    if (matched) {
        contract->passed_checks++;
    } else {
        contract->failed_checks++;
    }

    if (contract->check_count < TD2_COMPARE_STATE_CHECKS_MAX) {
        Td2CompareStateCheck* check = &contract->checks[contract->check_count++];
        snprintf(check->key, sizeof(check->key), "%s", key);
        check->value_kind = value_kind;
        check->expected = expected;
        check->actual = actual;
        check->matched = matched;
    }
}

static void td2_compare_callback_record(
    Td2CompareCallbackContract* contract,
    const char* key,
    Td2CompareValueKind value_kind,
    int expected,
    int actual
) {
    bool matched = expected == actual;

    contract->total_checks++;
    if (matched) {
        contract->passed_checks++;
    } else {
        contract->failed_checks++;
    }

    if (contract->check_count < TD2_COMPARE_STATE_CHECKS_MAX) {
        Td2CompareStateCheck* check = &contract->checks[contract->check_count++];
        snprintf(check->key, sizeof(check->key), "%s", key);
        check->value_kind = value_kind;
        check->expected = expected;
        check->actual = actual;
        check->matched = matched;
    }
}

static unsigned td2_compare_count_mismatched_bytes(
    const uint8_t* expected,
    size_t expected_size,
    const uint8_t* actual,
    size_t actual_size,
    size_t compare_size
) {
    size_t i;
    unsigned mismatches = 0U;

    for (i = 0; i < compare_size; i++) {
        uint8_t expected_byte = 0U;
        uint8_t actual_byte = 0U;

        if (expected != NULL && i < expected_size) {
            expected_byte = expected[i];
        }
        if (actual != NULL && i < actual_size) {
            actual_byte = actual[i];
        }
        if (expected_byte != actual_byte) {
            mismatches++;
        }
    }

    return mismatches;
}

static void td2_compare_capture_layer_contract(
    Td2CompareStateContract* contract,
    unsigned layer_index,
    const Td2PpuLayerState* expected,
    const Td2PpuLayerState* actual
) {
    char key[TD2_COMPARE_STATE_KEY_BYTES];

    snprintf(key, sizeof(key), "ppu.layers[%u].tilemapAddress", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_INT, expected->tilemap_address, actual->tilemap_address);
    snprintf(key, sizeof(key), "ppu.layers[%u].chrAddress", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_INT, expected->chr_address, actual->chr_address);
    snprintf(key, sizeof(key), "ppu.layers[%u].doubleWidth", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_BOOL, expected->double_width ? 1 : 0, actual->double_width ? 1 : 0);
    snprintf(key, sizeof(key), "ppu.layers[%u].doubleHeight", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_BOOL, expected->double_height ? 1 : 0, actual->double_height ? 1 : 0);
    snprintf(key, sizeof(key), "ppu.layers[%u].largeTiles", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_BOOL, expected->large_tiles ? 1 : 0, actual->large_tiles ? 1 : 0);
    snprintf(key, sizeof(key), "ppu.layers[%u].hscroll", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_INT, expected->hscroll, actual->hscroll);
    snprintf(key, sizeof(key), "ppu.layers[%u].vscroll", layer_index);
    td2_compare_state_record(contract, key, TD2_COMPARE_VALUE_INT, expected->vscroll, actual->vscroll);
}

static void td2_compare_capture_state_contract(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    const Td2PpuState* ppu
) {
    Td2CompareStateContract* contract = &compare->state_contract;
    unsigned layer_index;

    td2_compare_state_reset(contract);
    if (pack == NULL || ppu == NULL) {
        return;
    }

    td2_compare_state_record(contract, "ppu.bgMode", TD2_COMPARE_VALUE_INT, pack->bg_mode, ppu->bg_mode);
    td2_compare_state_record(contract, "ppu.mainScreenLayers", TD2_COMPARE_VALUE_INT, pack->main_screen_layers, ppu->main_screen_layers);
    td2_compare_state_record(contract, "ppu.subScreenLayers", TD2_COMPARE_VALUE_INT, pack->sub_screen_layers, ppu->sub_screen_layers);
    td2_compare_state_record(contract, "ppu.brightness", TD2_COMPARE_VALUE_INT, pack->brightness, ppu->brightness);
    td2_compare_state_record(contract, "ppu.forcedBlank", TD2_COMPARE_VALUE_BOOL, pack->forced_blank ? 1 : 0, ppu->forced_blank ? 1 : 0);
    td2_compare_state_record(contract, "ppu.mode1Bg3Priority", TD2_COMPARE_VALUE_BOOL, pack->mode1_bg3_priority ? 1 : 0, ppu->mode1_bg3_priority ? 1 : 0);
    td2_compare_state_record(contract, "ppu.oamMode", TD2_COMPARE_VALUE_INT, pack->oam_mode, ppu->oam_mode);
    td2_compare_state_record(contract, "ppu.oamBaseAddress", TD2_COMPARE_VALUE_INT, pack->oam_base_address, ppu->oam_base_address);
    td2_compare_state_record(contract, "ppu.oamAddressOffset", TD2_COMPARE_VALUE_INT, pack->oam_address_offset, ppu->oam_address_offset);
    td2_compare_state_record(contract, "ppu.internalOamAddress", TD2_COMPARE_VALUE_INT, pack->internal_oam_address, ppu->internal_oam_address);
    td2_compare_state_record(contract, "ppu.frameCount", TD2_COMPARE_VALUE_INT, (int)pack->ppu_frame_count, (int)ppu->ppu_frame_count);
    td2_compare_state_record(contract, "ppu.enableOamPriority", TD2_COMPARE_VALUE_BOOL, pack->enable_oam_priority ? 1 : 0, ppu->enable_oam_priority ? 1 : 0);
    td2_compare_state_record(contract, "ppu.objInterlace", TD2_COMPARE_VALUE_BOOL, pack->obj_interlace ? 1 : 0, ppu->obj_interlace ? 1 : 0);
    td2_compare_state_record(contract, "ppu.overscanMode", TD2_COMPARE_VALUE_BOOL, pack->overscan_mode ? 1 : 0, ppu->overscan_mode ? 1 : 0);
    td2_compare_state_record(contract, "scene.hasGoldenFrame", TD2_COMPARE_VALUE_BOOL, pack->main_visible.pixels != NULL ? 1 : 0, ppu->has_reference_frame ? 1 : 0);
    if (pack->has_frame_number) {
        td2_compare_state_record(contract, "scene.frameNumber", TD2_COMPARE_VALUE_INT, (int)pack->frame_number, (int)ppu->frame_number);
    }

    td2_compare_state_record(contract, "ppu.mode7.fillWithTile0", TD2_COMPARE_VALUE_BOOL, pack->mode7.fill_with_tile0 ? 1 : 0, ppu->mode7.fill_with_tile0 ? 1 : 0);
    td2_compare_state_record(contract, "ppu.mode7.horizontalMirroring", TD2_COMPARE_VALUE_BOOL, pack->mode7.horizontal_mirroring ? 1 : 0, ppu->mode7.horizontal_mirroring ? 1 : 0);
    td2_compare_state_record(contract, "ppu.mode7.verticalMirroring", TD2_COMPARE_VALUE_BOOL, pack->mode7.vertical_mirroring ? 1 : 0, ppu->mode7.vertical_mirroring ? 1 : 0);
    td2_compare_state_record(contract, "ppu.mode7.largeMap", TD2_COMPARE_VALUE_BOOL, pack->mode7.large_map ? 1 : 0, ppu->mode7.large_map ? 1 : 0);
    td2_compare_state_record(contract, "ppu.mode7.centerX", TD2_COMPARE_VALUE_INT, pack->mode7.center_x, ppu->mode7.center_x);
    td2_compare_state_record(contract, "ppu.mode7.centerY", TD2_COMPARE_VALUE_INT, pack->mode7.center_y, ppu->mode7.center_y);
    td2_compare_state_record(contract, "ppu.mode7.hscroll", TD2_COMPARE_VALUE_INT, pack->mode7.hscroll, ppu->mode7.hscroll);
    td2_compare_state_record(contract, "ppu.mode7.vscroll", TD2_COMPARE_VALUE_INT, pack->mode7.vscroll, ppu->mode7.vscroll);
    td2_compare_state_record(contract, "ppu.mode7.matrix[0]", TD2_COMPARE_VALUE_INT, pack->mode7.matrix[0], ppu->mode7.matrix[0]);
    td2_compare_state_record(contract, "ppu.mode7.matrix[1]", TD2_COMPARE_VALUE_INT, pack->mode7.matrix[1], ppu->mode7.matrix[1]);
    td2_compare_state_record(contract, "ppu.mode7.matrix[2]", TD2_COMPARE_VALUE_INT, pack->mode7.matrix[2], ppu->mode7.matrix[2]);
    td2_compare_state_record(contract, "ppu.mode7.matrix[3]", TD2_COMPARE_VALUE_INT, pack->mode7.matrix[3], ppu->mode7.matrix[3]);

    for (layer_index = 0U; layer_index < TD2_PPU_LAYER_COUNT; layer_index++) {
        td2_compare_capture_layer_contract(contract, layer_index, &pack->layers[layer_index], &ppu->layers[layer_index]);
    }

    contract->vram_mismatch_bytes = td2_compare_count_mismatched_bytes(
        pack->vram,
        pack->vram_size,
        ppu->vram,
        TD2_VRAM_BYTES,
        TD2_VRAM_BYTES);
    contract->cgram_mismatch_bytes = td2_compare_count_mismatched_bytes(
        pack->cgram,
        pack->cgram_size,
        ppu->cgram,
        TD2_CGRAM_BYTES,
        TD2_CGRAM_BYTES);
    contract->oam_mismatch_bytes = td2_compare_count_mismatched_bytes(
        pack->oam,
        pack->oam_size,
        ppu->oam,
        TD2_OAM_BYTES,
        TD2_OAM_BYTES);

    td2_compare_state_record(contract, "raw.vram.mismatchBytes", TD2_COMPARE_VALUE_INT, 0, (int)contract->vram_mismatch_bytes);
    td2_compare_state_record(contract, "raw.cgram.mismatchBytes", TD2_COMPARE_VALUE_INT, 0, (int)contract->cgram_mismatch_bytes);
    td2_compare_state_record(contract, "raw.oam.mismatchBytes", TD2_COMPARE_VALUE_INT, 0, (int)contract->oam_mismatch_bytes);
}

static int td2_pack_pointer(uint8_t bank, uint16_t addr) {
    return ((int)bank << 16) | (int)addr;
}

static void td2_compare_capture_callback_contract(
    Td2CompareLane* compare,
    const Td2RuntimeState* runtime_state,
    const Td2CallbackTraceContract* callback_contract
) {
    Td2CompareCallbackContract* report = &compare->callback_contract;

    td2_compare_callback_reset(report);
    if (runtime_state == NULL || callback_contract == NULL || !callback_contract->available) {
        return;
    }

    report->available = true;
    report->frame = callback_contract->frame;
    snprintf(report->contract_id, sizeof(report->contract_id), "%s", callback_contract->contract_id);
    snprintf(report->phase, sizeof(report->phase), "%s", callback_contract->phase);
    snprintf(report->note, sizeof(report->note), "%s", callback_contract->note);
    report->actual_source = runtime_state->source;

    if (callback_contract->expected_state.has_active_main_callback) {
        td2_compare_callback_record(
            report,
            "active_main_callback",
            TD2_COMPARE_VALUE_POINTER,
            td2_pack_pointer(
                callback_contract->expected_state.active_main_callback_bank,
                callback_contract->expected_state.active_main_callback_addr),
            td2_pack_pointer(
                runtime_state->active_main_callback_bank,
                runtime_state->active_main_callback_addr));
    }
    if (callback_contract->expected_state.has_active_irq_callback) {
        td2_compare_callback_record(
            report,
            "active_irq_callback",
            TD2_COMPARE_VALUE_POINTER,
            td2_pack_pointer(
                callback_contract->expected_state.active_irq_callback_bank,
                callback_contract->expected_state.active_irq_callback_addr),
            td2_pack_pointer(
                runtime_state->active_irq_callback_bank,
                runtime_state->active_irq_callback_addr));
    }
    if (callback_contract->expected_state.has_active_nmi_callback) {
        td2_compare_callback_record(
            report,
            "active_nmi_callback",
            TD2_COMPARE_VALUE_POINTER,
            td2_pack_pointer(
                callback_contract->expected_state.active_nmi_callback_bank,
                callback_contract->expected_state.active_nmi_callback_addr),
            td2_pack_pointer(
                runtime_state->active_nmi_callback_bank,
                runtime_state->active_nmi_callback_addr));
    }
    if (callback_contract->expected_state.has_state_0202) {
        td2_compare_callback_record(report, "state_0202", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_0202, runtime_state->state_0202);
    }
    if (callback_contract->expected_state.has_state_0204) {
        td2_compare_callback_record(report, "state_0204", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_0204, runtime_state->state_0204);
    }
    if (callback_contract->expected_state.has_state_0206) {
        td2_compare_callback_record(report, "state_0206", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_0206, runtime_state->state_0206);
    }
    if (callback_contract->expected_state.has_state_0208) {
        td2_compare_callback_record(report, "state_0208", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_0208, runtime_state->state_0208);
    }
    if (callback_contract->expected_state.has_state_020a) {
        td2_compare_callback_record(report, "state_020a", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_020a, runtime_state->state_020a);
    }
    if (callback_contract->expected_state.has_state_040a) {
        td2_compare_callback_record(report, "state_040a", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_040a, runtime_state->state_040a);
    }
    if (callback_contract->expected_state.has_state_0960) {
        td2_compare_callback_record(report, "state_0960", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_0960, runtime_state->state_0960);
    }
    if (callback_contract->expected_state.has_state_09a2) {
        td2_compare_callback_record(report, "state_09a2", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_09a2, runtime_state->state_09a2);
    }
    if (callback_contract->expected_state.has_state_09a8) {
        td2_compare_callback_record(report, "state_09a8", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_09a8, runtime_state->state_09a8);
    }
    if (callback_contract->expected_state.has_state_1c6a) {
        td2_compare_callback_record(report, "state_1c6a", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_1c6a, runtime_state->state_1c6a);
    }
    if (callback_contract->expected_state.has_state_1c70) {
        td2_compare_callback_record(report, "state_1c70", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_1c70, runtime_state->state_1c70);
    }
    if (callback_contract->expected_state.has_state_1c76) {
        td2_compare_callback_record(report, "state_1c76", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_1c76, runtime_state->state_1c76);
    }
    if (callback_contract->expected_state.has_state_137c) {
        td2_compare_callback_record(report, "state_137c", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_137c, runtime_state->state_137c);
    }
    if (callback_contract->expected_state.has_state_11f3) {
        td2_compare_callback_record(report, "state_11f3", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.state_11f3, runtime_state->state_11f3);
    }
    if (callback_contract->expected_state.has_dp_0020) {
        td2_compare_callback_record(report, "dp_0020", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.dp_0020, runtime_state->dp_0020);
    }
    if (callback_contract->expected_state.has_dp_0022) {
        td2_compare_callback_record(report, "dp_0022", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.dp_0022, runtime_state->dp_0022);
    }
    if (callback_contract->expected_state.has_dp_0053) {
        td2_compare_callback_record(report, "dp_0053", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.dp_0053, runtime_state->dp_0053);
    }
    if (callback_contract->expected_state.has_dp_0054) {
        td2_compare_callback_record(report, "dp_0054", TD2_COMPARE_VALUE_INT, callback_contract->expected_state.dp_0054, runtime_state->dp_0054);
    }
}

bool td2_compare_init(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    bool enabled,
    char* error,
    size_t error_size
) {
    size_t pixel_index;

    memset(compare, 0, sizeof(*compare));
    if (!enabled) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    if (pack->main_visible.pixels == NULL ||
        pack->main_visible.width != TD2_FRAME_WIDTH ||
        pack->main_visible.height != TD2_FRAME_HEIGHT) {
        set_error(error, error_size, "compare lane requires a 256x224 main_visible.ppm golden");
        return false;
    }

    compare->reference_framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    compare->diff_framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    compare->strip_framebuffer = (uint32_t*)calloc(TD2_COMPARE_WIDTH * TD2_FRAME_HEIGHT, sizeof(uint32_t));
    if (compare->reference_framebuffer == NULL ||
        compare->diff_framebuffer == NULL ||
        compare->strip_framebuffer == NULL) {
        td2_compare_free(compare);
        set_error(error, error_size, "failed to allocate compare buffers");
        return false;
    }

    for (pixel_index = 0; pixel_index < TD2_FRAME_PIXELS; pixel_index++) {
        size_t rgb_index = pixel_index * 3U;
        compare->reference_framebuffer[pixel_index] = rgb_to_argb(
            pack->main_visible.pixels[rgb_index + 0U],
            pack->main_visible.pixels[rgb_index + 1U],
            pack->main_visible.pixels[rgb_index + 2U]
        );
    }

    compare->enabled = true;
    compare->metrics.pixel_count = TD2_FRAME_PIXELS;
    td2_compare_state_reset(&compare->state_contract);
    td2_compare_callback_reset(&compare->callback_contract);
    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

void td2_compare_free(Td2CompareLane* compare) {
    free(compare->reference_framebuffer);
    free(compare->diff_framebuffer);
    free(compare->strip_framebuffer);
    memset(compare, 0, sizeof(*compare));
}

void td2_compare_run(
    Td2CompareLane* compare,
    const Td2DesignPack* pack,
    const Td2PpuState* ppu,
    const Td2RuntimeState* runtime_state,
    const Td2CallbackTraceContract* callback_contract,
    const uint32_t* actual_framebuffer
) {
    uint64_t total_abs_diff = 0;
    uint64_t total_sq_diff = 0;
    size_t pixel_index;

    if (!compare->enabled) {
        return;
    }

    compare->metrics.pixel_count = TD2_FRAME_PIXELS;
    compare->metrics.mismatch_pixels = 0U;
    compare->metrics.max_channel_diff = 0U;
    compare->metrics.mismatch_ratio = 0.0;
    compare->metrics.mean_abs_channel_diff = 0.0;
    compare->metrics.rmse = 0.0;

    for (pixel_index = 0; pixel_index < TD2_FRAME_PIXELS; pixel_index++) {
        uint8_t actual_red;
        uint8_t actual_green;
        uint8_t actual_blue;
        uint8_t reference_red;
        uint8_t reference_green;
        uint8_t reference_blue;
        unsigned diff_red;
        unsigned diff_green;
        unsigned diff_blue;
        unsigned pixel_diff;
        uint32_t diff_pixel;

        unpack_argb(actual_framebuffer[pixel_index], &actual_red, &actual_green, &actual_blue);
        unpack_argb(compare->reference_framebuffer[pixel_index], &reference_red, &reference_green, &reference_blue);

        diff_red = actual_red > reference_red ? (unsigned)(actual_red - reference_red) : (unsigned)(reference_red - actual_red);
        diff_green = actual_green > reference_green ? (unsigned)(actual_green - reference_green) : (unsigned)(reference_green - actual_green);
        diff_blue = actual_blue > reference_blue ? (unsigned)(actual_blue - reference_blue) : (unsigned)(reference_blue - actual_blue);
        pixel_diff = diff_red + diff_green + diff_blue;

        diff_pixel = rgb_to_argb((uint8_t)diff_red, (uint8_t)diff_green, (uint8_t)diff_blue);
        compare->diff_framebuffer[pixel_index] = diff_pixel;

        total_abs_diff += (uint64_t)pixel_diff;
        total_sq_diff += (uint64_t)(diff_red * diff_red);
        total_sq_diff += (uint64_t)(diff_green * diff_green);
        total_sq_diff += (uint64_t)(diff_blue * diff_blue);

        if (pixel_diff != 0U) {
            compare->metrics.mismatch_pixels++;
        }
        if (diff_red > compare->metrics.max_channel_diff) {
            compare->metrics.max_channel_diff = diff_red;
        }
        if (diff_green > compare->metrics.max_channel_diff) {
            compare->metrics.max_channel_diff = diff_green;
        }
        if (diff_blue > compare->metrics.max_channel_diff) {
            compare->metrics.max_channel_diff = diff_blue;
        }
    }

    for (pixel_index = 0; pixel_index < TD2_FRAME_PIXELS; pixel_index++) {
        unsigned y = (unsigned)(pixel_index / TD2_FRAME_WIDTH);
        unsigned x = (unsigned)(pixel_index % TD2_FRAME_WIDTH);
        size_t row_offset = (size_t)y * TD2_COMPARE_WIDTH;

        compare->strip_framebuffer[row_offset + x] = actual_framebuffer[pixel_index];
        compare->strip_framebuffer[row_offset + TD2_FRAME_WIDTH + x] = compare->reference_framebuffer[pixel_index];
        compare->strip_framebuffer[row_offset + (TD2_FRAME_WIDTH * 2) + x] = compare->diff_framebuffer[pixel_index];
    }

    compare->metrics.mismatch_ratio =
        compare->metrics.pixel_count == 0U
            ? 0.0
            : (double)compare->metrics.mismatch_pixels / (double)compare->metrics.pixel_count;
    compare->metrics.mean_abs_channel_diff =
        compare->metrics.pixel_count == 0U
            ? 0.0
            : (double)total_abs_diff / (double)(compare->metrics.pixel_count * 3U);
    compare->metrics.rmse =
        compare->metrics.pixel_count == 0U
            ? 0.0
            : sqrt((double)total_sq_diff / (double)(compare->metrics.pixel_count * 3U));

    td2_compare_capture_state_contract(compare, pack, ppu);
    td2_compare_capture_callback_contract(compare, runtime_state, callback_contract);
}

bool td2_compare_dump_bundle(
    const Td2CompareLane* compare,
    const Td2DesignPack* pack,
    const Td2PpuState* ppu,
    const Td2RuntimeState* runtime_state,
    const Td2CallbackTraceContract* callback_contract,
    const uint32_t* actual_framebuffer,
    const char* prefix,
    unsigned frame_index,
    const char* scene_dir,
    unsigned frame_number,
    bool has_frame_number,
    char* error,
    size_t error_size
) {
    char actual_path[1200];
    char actual_png_path[1200];
    char reference_path[1200];
    char reference_png_path[1200];
    char diff_path[1200];
    char diff_png_path[1200];
    char strip_path[1200];
    char strip_png_path[1200];
    char summary_path[1200];
    FILE* file;
    unsigned check_index;

    if (!compare->enabled) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    snprintf(actual_path, sizeof(actual_path), "%s_%05u.ppm", prefix, frame_index);
    snprintf(actual_png_path, sizeof(actual_png_path), "%s_%05u.png", prefix, frame_index);
    snprintf(reference_path, sizeof(reference_path), "%s_%05u_reference.ppm", prefix, frame_index);
    snprintf(reference_png_path, sizeof(reference_png_path), "%s_%05u_reference.png", prefix, frame_index);
    snprintf(diff_path, sizeof(diff_path), "%s_%05u_diff.ppm", prefix, frame_index);
    snprintf(diff_png_path, sizeof(diff_png_path), "%s_%05u_diff.png", prefix, frame_index);
    snprintf(strip_path, sizeof(strip_path), "%s_%05u_compare.ppm", prefix, frame_index);
    snprintf(strip_png_path, sizeof(strip_png_path), "%s_%05u_compare.png", prefix, frame_index);
    snprintf(summary_path, sizeof(summary_path), "%s_%05u_compare.json", prefix, frame_index);

    if (!td2_compare_write_argb_ppm(actual_path, actual_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_png(actual_png_path, actual_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_ppm(reference_path, compare->reference_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_png(reference_png_path, compare->reference_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_ppm(diff_path, compare->diff_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_png(diff_png_path, compare->diff_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_ppm(strip_path, compare->strip_framebuffer, TD2_COMPARE_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !td2_compare_write_argb_png(strip_png_path, compare->strip_framebuffer, TD2_COMPARE_WIDTH, TD2_FRAME_HEIGHT, error, error_size)) {
        return false;
    }

    file = fopen(summary_path, "wb");
    if (file == NULL) {
        set_error(error, error_size, "failed to open compare summary json");
        return false;
    }

    fputs("{\n", file);
    fputs("  \"scene_dir\": ", file);
    write_json_string(file, scene_dir);
    fputs(",\n", file);
    if (pack != NULL) {
        fputs("  \"raw_dir\": ", file);
        write_json_string(file, pack->raw_dir);
        fputs(",\n", file);
    } else {
        fputs("  \"raw_dir\": null,\n", file);
    }
    fprintf(file, "  \"frame_index\": %u,\n", frame_index);
    if (has_frame_number) {
        fprintf(file, "  \"scene_frame_number\": %u,\n", frame_number);
    } else {
        fputs("  \"scene_frame_number\": null,\n", file);
    }
    if (ppu != NULL) {
        fprintf(file, "  \"runtime_frame_number\": %u,\n", ppu->frame_number);
        fputs("  \"runtime_has_reference_frame\": ", file);
        fputs(ppu->has_reference_frame ? "true,\n" : "false,\n", file);
    } else {
        fputs("  \"runtime_frame_number\": null,\n", file);
        fputs("  \"runtime_has_reference_frame\": null,\n", file);
    }
    fputs("  \"outputs\": {\n", file);
    fputs("    \"actual\": ", file);
    write_json_string(file, actual_path);
    fputs(",\n    \"actual_png\": ", file);
    write_json_string(file, actual_png_path);
    fputs(",\n    \"reference\": ", file);
    write_json_string(file, reference_path);
    fputs(",\n    \"reference_png\": ", file);
    write_json_string(file, reference_png_path);
    fputs(",\n    \"diff\": ", file);
    write_json_string(file, diff_path);
    fputs(",\n    \"diff_png\": ", file);
    write_json_string(file, diff_png_path);
    fputs(",\n    \"compare\": ", file);
    write_json_string(file, strip_path);
    fputs(",\n    \"compare_png\": ", file);
    write_json_string(file, strip_png_path);
    fputs("\n  },\n", file);
    fprintf(file,
            "  \"metrics\": {\n"
            "    \"pixel_count\": %u,\n"
            "    \"mismatch_pixels\": %u,\n"
            "    \"mismatch_ratio\": %.9f,\n"
            "    \"max_channel_diff\": %u,\n"
            "    \"mean_abs_channel_diff\": %.9f,\n"
            "    \"rmse\": %.9f\n"
            "  },\n",
            compare->metrics.pixel_count,
            compare->metrics.mismatch_pixels,
            compare->metrics.mismatch_ratio,
            compare->metrics.max_channel_diff,
            compare->metrics.mean_abs_channel_diff,
            compare->metrics.rmse);
    (void)runtime_state;
    (void)callback_contract;
    fprintf(file,
            "  \"state_contract\": {\n"
            "    \"total_checks\": %u,\n"
            "    \"passed_checks\": %u,\n"
            "    \"failed_checks\": %u,\n"
            "    \"buffers\": {\n"
            "      \"vram_mismatch_bytes\": %u,\n"
            "      \"cgram_mismatch_bytes\": %u,\n"
            "      \"oam_mismatch_bytes\": %u\n"
            "    },\n"
            "    \"checks\": [\n",
            compare->state_contract.total_checks,
            compare->state_contract.passed_checks,
            compare->state_contract.failed_checks,
            compare->state_contract.vram_mismatch_bytes,
            compare->state_contract.cgram_mismatch_bytes,
            compare->state_contract.oam_mismatch_bytes);

    for (check_index = 0U; check_index < compare->state_contract.check_count; check_index++) {
        const Td2CompareStateCheck* check = &compare->state_contract.checks[check_index];
        fputs("      {\n", file);
        fputs("        \"key\": ", file);
        write_json_string(file, check->key);
        fputs(",\n        \"type\": ", file);
        write_json_string(
            file,
            check->value_kind == TD2_COMPARE_VALUE_BOOL
                ? "bool"
                : (check->value_kind == TD2_COMPARE_VALUE_POINTER ? "pointer" : "int"));
        fputs(",\n        \"expected\": ", file);
        write_json_value(file, check->value_kind, check->expected);
        fputs(",\n        \"actual\": ", file);
        write_json_value(file, check->value_kind, check->actual);
        fputs(",\n        \"matched\": ", file);
        fputs(check->matched ? "true" : "false", file);
        fputs(check_index + 1U == compare->state_contract.check_count ? "\n      }\n" : "\n      },\n", file);
    }

    fputs("    ]\n", file);
    fputs("  },\n", file);
    fputs("  \"callback_contract\": {\n", file);
    fputs("    \"available\": ", file);
    fputs(compare->callback_contract.available ? "true,\n" : "false,\n", file);
    if (compare->callback_contract.available) {
        fprintf(file, "    \"frame\": %u,\n", compare->callback_contract.frame);
        fputs("    \"contract_id\": ", file);
        write_json_string(file, compare->callback_contract.contract_id);
        fputs(",\n    \"phase\": ", file);
        write_json_string(file, compare->callback_contract.phase);
        fputs(",\n    \"note\": ", file);
        write_json_string(file, compare->callback_contract.note);
        fputs(",\n    \"actual_source\": ", file);
        write_json_string(file, td2_runtime_state_source_name(compare->callback_contract.actual_source));
        fprintf(file,
                ",\n    \"total_checks\": %u,\n"
                "    \"passed_checks\": %u,\n"
                "    \"failed_checks\": %u,\n"
                "    \"checks\": [\n",
                compare->callback_contract.total_checks,
                compare->callback_contract.passed_checks,
                compare->callback_contract.failed_checks);

        for (check_index = 0U; check_index < compare->callback_contract.check_count; check_index++) {
            const Td2CompareStateCheck* check = &compare->callback_contract.checks[check_index];
            fputs("      {\n", file);
            fputs("        \"key\": ", file);
            write_json_string(file, check->key);
            fputs(",\n        \"type\": ", file);
            write_json_string(
                file,
                check->value_kind == TD2_COMPARE_VALUE_BOOL
                    ? "bool"
                    : (check->value_kind == TD2_COMPARE_VALUE_POINTER ? "pointer" : "int"));
            fputs(",\n        \"expected\": ", file);
            write_json_value(file, check->value_kind, check->expected);
            fputs(",\n        \"actual\": ", file);
            write_json_value(file, check->value_kind, check->actual);
            fputs(",\n        \"matched\": ", file);
            fputs(check->matched ? "true" : "false", file);
            fputs(check_index + 1U == compare->callback_contract.check_count ? "\n      }\n" : "\n      },\n", file);
        }
        fputs("    ]\n", file);
    } else {
        fputs("    \"frame\": null,\n", file);
        fputs("    \"contract_id\": null,\n", file);
        fputs("    \"phase\": null,\n", file);
        fputs("    \"note\": null,\n", file);
        fputs("    \"actual_source\": null,\n", file);
        fputs("    \"total_checks\": 0,\n", file);
        fputs("    \"passed_checks\": 0,\n", file);
        fputs("    \"failed_checks\": 0,\n", file);
        fputs("    \"checks\": []\n", file);
    }
    fputs("  }\n", file);
    fputs("}\n", file);
    fclose(file);

    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

bool td2_compare_has_drift(const Td2CompareLane* compare) {
    if (!compare->enabled) {
        return false;
    }
    return compare->metrics.mismatch_pixels > 0U ||
           compare->state_contract.failed_checks > 0U ||
           compare->callback_contract.failed_checks > 0U;
}
