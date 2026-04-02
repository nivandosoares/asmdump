#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "td2_runtime.h"

static bool expect_bool(
    const char* label,
    const char* key,
    bool actual,
    bool expected,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual != expected) {
        fprintf(stderr,
                "FAIL %s %s expected %s got %s\n",
                label,
                key,
                expected ? "true" : "false",
                actual ? "true" : "false");
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_u16(
    const char* label,
    const char* key,
    uint16_t actual,
    uint16_t expected,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual != expected) {
        fprintf(stderr,
                "FAIL %s %s expected %u got %u\n",
                label,
                key,
                (unsigned)expected,
                (unsigned)actual);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool expect_pixel(
    const char* label,
    int x,
    int y,
    uint32_t actual,
    uint32_t expected,
    unsigned* total_checks,
    unsigned* failed_checks
) {
    (*total_checks)++;
    if (actual != expected) {
        fprintf(stderr,
                "FAIL %s pixel(%d,%d) expected 0x%08X got 0x%08X\n",
                label,
                x,
                y,
                expected,
                actual);
        (*failed_checks)++;
        return false;
    }
    return true;
}

static bool init_runtime(
    Td2Runtime* runtime,
    const char* scene_dir,
    Td2SchedulerProfile profile,
    char* error,
    size_t error_size
) {
    Td2RuntimeConfig config;

    memset(&config, 0, sizeof(config));
    config.scene_dir = scene_dir;
    config.headless = true;
    config.scheduler_profile = profile;
    return td2_runtime_init(runtime, &config, error, error_size);
}

static void verify_no_contract(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    char error[256];

    if (!init_runtime(
            &runtime,
            "assets/test_dump_frame300/design_pack",
            TD2_SCHEDULER_PROFILE_NONE,
            error,
            sizeof(error))) {
        fprintf(stderr, "FAIL frame300 init: %s\n", error);
        (*failed_checks)++;
        return;
    }

    expect_bool("frame300", "scanline_profile.enabled", runtime.ppu.scanline_profile.enabled, false, total_checks, failed_checks);
    td2_runtime_free(&runtime);
}

static void verify_live_race_mid(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    const Td2PpuScanlineProfile* profile;
    char error[256];

    if (!init_runtime(
            &runtime,
            "../tools/out/design_lane3_live_race_mid_frame0_native",
            TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID,
            error,
            sizeof(error))) {
        fprintf(stderr, "FAIL live_race_mid init: %s\n", error);
        (*failed_checks)++;
        return;
    }
    if (!td2_runtime_render_frame(&runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL live_race_mid render: %s\n", error);
        (*failed_checks)++;
        td2_runtime_free(&runtime);
        return;
    }

    profile = &runtime.ppu.scanline_profile;
    expect_bool("live_race_mid", "scanline_profile.enabled", profile->enabled, true, total_checks, failed_checks);
    expect_u16("live_race_mid", "scanline_profile.line_count", (uint16_t)profile->line_count, (uint16_t)TD2_FRAME_HEIGHT, total_checks, failed_checks);
    expect_u16("live_race_mid", "scanline[23].main_layers", profile->main_screen_layers[23], 23U, total_checks, failed_checks);
    expect_u16("live_race_mid", "scanline[24].bg3_vscroll", (uint16_t)profile->layer_vscroll[2][24], 20U, total_checks, failed_checks);
    expect_u16("live_race_mid", "scanline[121].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][121], 8U, total_checks, failed_checks);
    expect_u16("live_race_mid", "scanline[223].bg2_vscroll", (uint16_t)profile->layer_vscroll[1][223], 283U, total_checks, failed_checks);
    expect_pixel("live_race_mid", 40, 40, runtime.framebuffer[(40 * TD2_FRAME_WIDTH) + 40], 0xFF529CF7U, total_checks, failed_checks);
    expect_pixel("live_race_mid", 80, 40, runtime.framebuffer[(40 * TD2_FRAME_WIDTH) + 80], 0xFF396363U, total_checks, failed_checks);
    expect_pixel("live_race_mid", 30, 80, runtime.framebuffer[(80 * TD2_FRAME_WIDTH) + 30], 0xFF005200U, total_checks, failed_checks);
    expect_pixel("live_race_mid", 235, 80, runtime.framebuffer[(80 * TD2_FRAME_WIDTH) + 235], 0xFF005200U, total_checks, failed_checks);

    td2_runtime_free(&runtime);
}

static void verify_live_entry_3250(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    const Td2PpuScanlineProfile* profile;
    char error[256];

    if (!init_runtime(
            &runtime,
            "../tools/out/lane3_live_entry_frame03250_bundle/design_pack",
            TD2_SCHEDULER_PROFILE_NONE,
            error,
            sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3250 init: %s\n", error);
        (*failed_checks)++;
        return;
    }
    if (!td2_runtime_render_frame(&runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3250 render: %s\n", error);
        (*failed_checks)++;
        td2_runtime_free(&runtime);
        return;
    }

    profile = &runtime.ppu.scanline_profile;
    expect_bool("live_entry_3250", "scanline_profile.enabled", profile->enabled, true, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline_profile.line_count", (uint16_t)profile->line_count, (uint16_t)TD2_FRAME_HEIGHT, total_checks, failed_checks);
    expect_bool("live_entry_3250", "composition_profile.enabled", runtime.ppu.composition_profile.enabled, true, total_checks, failed_checks);
    expect_u16(
        "live_entry_3250",
        "composition_profile.bg3_enable_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_enable_top_scanlines,
        79U,
        total_checks,
        failed_checks);
    expect_u16(
        "live_entry_3250",
        "composition_profile.bg3_above_bg2_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_above_bg2_top_scanlines,
        79U,
        total_checks,
        failed_checks);
    expect_u16("live_entry_3250", "scanline[23].main_layers", profile->main_screen_layers[23], 23U, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline[23].bg3_hscroll", (uint16_t)profile->layer_hscroll[2][23], 510U, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline[24].bg3_vscroll", (uint16_t)profile->layer_vscroll[2][24], 12U, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline[121].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][121], 193U, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline[122].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][122], 197U, total_checks, failed_checks);
    expect_u16("live_entry_3250", "scanline[223].bg2_vscroll", (uint16_t)profile->layer_vscroll[1][223], 27U, total_checks, failed_checks);
    expect_pixel("live_entry_3250", 148, 45, runtime.framebuffer[(45 * TD2_FRAME_WIDTH) + 148], 0xFF396363U, total_checks, failed_checks);
    expect_pixel("live_entry_3250", 149, 45, runtime.framebuffer[(45 * TD2_FRAME_WIDTH) + 149], 0xFF103942U, total_checks, failed_checks);
    expect_pixel("live_entry_3250", 217, 44, runtime.framebuffer[(44 * TD2_FRAME_WIDTH) + 217], 0xFF103942U, total_checks, failed_checks);

    td2_runtime_free(&runtime);
}

static void verify_live_entry_3400(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    const Td2PpuScanlineProfile* profile;
    char error[256];

    if (!init_runtime(
            &runtime,
            "../tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack",
            TD2_SCHEDULER_PROFILE_NONE,
            error,
            sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3400 init: %s\n", error);
        (*failed_checks)++;
        return;
    }
    if (!td2_runtime_render_frame(&runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3400 render: %s\n", error);
        (*failed_checks)++;
        td2_runtime_free(&runtime);
        return;
    }

    profile = &runtime.ppu.scanline_profile;
    expect_bool("live_entry_3400", "scanline_profile.enabled", profile->enabled, true, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline_profile.line_count", (uint16_t)profile->line_count, (uint16_t)TD2_FRAME_HEIGHT, total_checks, failed_checks);
    expect_bool("live_entry_3400", "composition_profile.enabled", runtime.ppu.composition_profile.enabled, true, total_checks, failed_checks);
    expect_u16(
        "live_entry_3400",
        "composition_profile.bg3_enable_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_enable_top_scanlines,
        79U,
        total_checks,
        failed_checks);
    expect_u16(
        "live_entry_3400",
        "composition_profile.bg3_above_bg2_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_above_bg2_top_scanlines,
        79U,
        total_checks,
        failed_checks);
    expect_u16("live_entry_3400", "scanline[23].main_layers", profile->main_screen_layers[23], 23U, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline[23].bg3_hscroll", (uint16_t)profile->layer_hscroll[2][23], 500U, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline[24].bg3_vscroll", (uint16_t)profile->layer_vscroll[2][24], 20U, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline[120].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][120], 235U, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline[121].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][121], 239U, total_checks, failed_checks);
    expect_u16("live_entry_3400", "scanline[223].bg2_vscroll", (uint16_t)profile->layer_vscroll[1][223], 283U, total_checks, failed_checks);
    expect_pixel("live_entry_3400", 180, 5, runtime.framebuffer[(5 * TD2_FRAME_WIDTH) + 180], 0xFF529CF7U, total_checks, failed_checks);
    expect_pixel("live_entry_3400", 40, 40, runtime.framebuffer[(40 * TD2_FRAME_WIDTH) + 40], 0xFF529CF7U, total_checks, failed_checks);
    expect_pixel("live_entry_3400", 80, 40, runtime.framebuffer[(40 * TD2_FRAME_WIDTH) + 80], 0xFF529CF7U, total_checks, failed_checks);

    td2_runtime_free(&runtime);
}

static void verify_live_entry_3550(
    unsigned* total_checks,
    unsigned* failed_checks
) {
    Td2Runtime runtime;
    const Td2PpuScanlineProfile* profile;
    char error[256];

    if (!init_runtime(
            &runtime,
            "../tools/out/lane3_live_entry_frame03550_bundle/design_pack",
            TD2_SCHEDULER_PROFILE_NONE,
            error,
            sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3550 init: %s\n", error);
        (*failed_checks)++;
        return;
    }
    if (!td2_runtime_render_frame(&runtime, error, sizeof(error))) {
        fprintf(stderr, "FAIL live_entry_3550 render: %s\n", error);
        (*failed_checks)++;
        td2_runtime_free(&runtime);
        return;
    }

    profile = &runtime.ppu.scanline_profile;
    expect_bool("live_entry_3550", "scanline_profile.enabled", profile->enabled, true, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline_profile.line_count", (uint16_t)profile->line_count, (uint16_t)TD2_FRAME_HEIGHT, total_checks, failed_checks);
    expect_bool("live_entry_3550", "composition_profile.enabled", runtime.ppu.composition_profile.enabled, true, total_checks, failed_checks);
    expect_u16(
        "live_entry_3550",
        "composition_profile.bg3_enable_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_enable_top_scanlines,
        95U,
        total_checks,
        failed_checks);
    expect_u16(
        "live_entry_3550",
        "composition_profile.bg3_above_bg2_top_scanlines",
        (uint16_t)runtime.ppu.composition_profile.bg3_above_bg2_top_scanlines,
        95U,
        total_checks,
        failed_checks);
    expect_u16("live_entry_3550", "scanline[23].main_layers", profile->main_screen_layers[23], 23U, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline[23].bg3_hscroll", (uint16_t)profile->layer_hscroll[2][23], 192U, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline[24].bg3_vscroll", (uint16_t)profile->layer_vscroll[2][24], 12U, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline[120].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][120], 254U, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline[121].bg2_hscroll", (uint16_t)profile->layer_hscroll[1][121], 256U, total_checks, failed_checks);
    expect_u16("live_entry_3550", "scanline[223].bg2_vscroll", (uint16_t)profile->layer_vscroll[1][223], 283U, total_checks, failed_checks);
    expect_pixel("live_entry_3550", 180, 5, runtime.framebuffer[(5 * TD2_FRAME_WIDTH) + 180], 0xFF529CF7U, total_checks, failed_checks);
    expect_pixel("live_entry_3550", 180, 10, runtime.framebuffer[(10 * TD2_FRAME_WIDTH) + 180], 0xFF529CF7U, total_checks, failed_checks);
    expect_pixel("live_entry_3550", 186, 10, runtime.framebuffer[(10 * TD2_FRAME_WIDTH) + 186], 0xFF529CF7U, total_checks, failed_checks);

    td2_runtime_free(&runtime);
}

int main(void) {
    unsigned total_checks = 0U;
    unsigned failed_checks = 0U;

    verify_no_contract(&total_checks, &failed_checks);
    verify_live_race_mid(&total_checks, &failed_checks);
    verify_live_entry_3250(&total_checks, &failed_checks);
    verify_live_entry_3400(&total_checks, &failed_checks);
    verify_live_entry_3550(&total_checks, &failed_checks);

    if (failed_checks != 0U) {
        fprintf(stderr,
                "FAIL: scanline contract smoke mismatched %u checks\n",
                failed_checks);
        return 1;
    }

    printf("PASS: scanline contract smoke matched %u checks\n", total_checks);
    return 0;
}
