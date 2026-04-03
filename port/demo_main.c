#include <SDL2/SDL.h>

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform_sdl.h"
#include "td2_runtime.h"
#include "td2_scheduler.h"

#define TD2_DEMO_TEXT_GLYPH_WIDTH 5
#define TD2_DEMO_TEXT_GLYPH_HEIGHT 7
#define TD2_DEMO_TEXT_ADVANCE 6
#define TD2_DEMO_DEFAULT_WINDOW_WIDTH 1280
#define TD2_DEMO_DEFAULT_WINDOW_HEIGHT 896

typedef struct {
    char key;
    uint8_t rows[TD2_DEMO_TEXT_GLYPH_HEIGHT];
} Td2DemoGlyph;

typedef struct {
    bool f1;
    bool digit1;
    bool digit2;
    bool digit3;
} Td2DemoKeyLatch;

static const Td2DemoGlyph k_demo_glyphs[] = {
    {' ', {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
    {':', {0x00, 0x04, 0x04, 0x00, 0x04, 0x04, 0x00}},
    {'0', {0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E}},
    {'1', {0x04, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E}},
    {'2', {0x0E, 0x11, 0x01, 0x02, 0x04, 0x08, 0x1F}},
    {'3', {0x1F, 0x02, 0x04, 0x02, 0x01, 0x11, 0x0E}},
    {'4', {0x02, 0x06, 0x0A, 0x12, 0x1F, 0x02, 0x02}},
    {'5', {0x1F, 0x10, 0x1E, 0x01, 0x01, 0x11, 0x0E}},
    {'6', {0x06, 0x08, 0x10, 0x1E, 0x11, 0x11, 0x0E}},
    {'7', {0x1F, 0x11, 0x01, 0x02, 0x04, 0x04, 0x04}},
    {'8', {0x0E, 0x11, 0x11, 0x0E, 0x11, 0x11, 0x0E}},
    {'9', {0x0E, 0x11, 0x11, 0x0F, 0x01, 0x02, 0x0C}},
    {'A', {0x0E, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11}},
    {'B', {0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E}},
    {'C', {0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E}},
    {'D', {0x1C, 0x12, 0x11, 0x11, 0x11, 0x12, 0x1C}},
    {'E', {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F}},
    {'F', {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x10}},
    {'G', {0x0E, 0x11, 0x10, 0x17, 0x11, 0x11, 0x0F}},
    {'H', {0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11}},
    {'I', {0x0E, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E}},
    {'J', {0x07, 0x02, 0x02, 0x02, 0x12, 0x12, 0x0C}},
    {'K', {0x11, 0x12, 0x14, 0x18, 0x14, 0x12, 0x11}},
    {'L', {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x1F}},
    {'M', {0x11, 0x1B, 0x15, 0x15, 0x11, 0x11, 0x11}},
    {'N', {0x11, 0x19, 0x19, 0x15, 0x13, 0x13, 0x11}},
    {'O', {0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E}},
    {'P', {0x1E, 0x11, 0x11, 0x1E, 0x10, 0x10, 0x10}},
    {'Q', {0x0E, 0x11, 0x11, 0x11, 0x15, 0x12, 0x0D}},
    {'R', {0x1E, 0x11, 0x11, 0x1E, 0x14, 0x12, 0x11}},
    {'S', {0x0F, 0x10, 0x10, 0x0E, 0x01, 0x01, 0x1E}},
    {'T', {0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04}},
    {'U', {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E}},
    {'V', {0x11, 0x11, 0x11, 0x11, 0x11, 0x0A, 0x04}},
    {'W', {0x11, 0x11, 0x11, 0x15, 0x15, 0x15, 0x0A}},
    {'X', {0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11}},
    {'Y', {0x11, 0x11, 0x0A, 0x04, 0x04, 0x04, 0x04}},
    {'Z', {0x1F, 0x01, 0x02, 0x04, 0x08, 0x10, 0x1F}},
};

static void print_usage(const char* argv0) {
    fprintf(stderr,
            "Usage: %s [options]\n"
            "\n"
            "Options:\n"
            "  --scene-dir PATH          Design-pack directory to load\n"
            "  --scheduler-profile NAME  auto | none | intro_noinput | menu_gameplay_entry | gameplay_live_race_mid\n"
            "  --input-script WINDOWS    frame:buttons or start-end:buttons\n"
            "  --frames N                Run a bounded frame count\n"
            "  --window-width N          Initial SDL window width (default 1280)\n"
            "  --window-height N         Initial SDL window height (default 896)\n"
            "  --scale N                 Fallback startup scale before window resize\n"
            "  --no-overlay              Disable debug overlay text\n"
            "  --help                    Show this help\n",
            argv0);
}

static bool parse_uint(const char* text, unsigned* value) {
    char* end = NULL;
    unsigned long parsed = strtoul(text, &end, 10);

    if (text[0] == '\0' || end == NULL || *end != '\0') {
        return false;
    }
    *value = (unsigned)parsed;
    return true;
}

static const uint8_t* td2_demo_find_glyph(char c) {
    unsigned index;

    if (c >= 'a' && c <= 'z') {
        c = (char)(c - ('a' - 'A'));
    }

    for (index = 0; index < (sizeof(k_demo_glyphs) / sizeof(k_demo_glyphs[0])); index++) {
        if (k_demo_glyphs[index].key == c) {
            return k_demo_glyphs[index].rows;
        }
    }

    return k_demo_glyphs[0].rows;
}

static void td2_demo_fill_rect(
    uint32_t* framebuffer,
    int width,
    int height,
    int x,
    int y,
    int rect_width,
    int rect_height,
    uint32_t argb
) {
    int row;

    if (framebuffer == NULL || rect_width <= 0 || rect_height <= 0) {
        return;
    }

    if (x < 0) {
        rect_width += x;
        x = 0;
    }
    if (y < 0) {
        rect_height += y;
        y = 0;
    }
    if ((x + rect_width) > width) {
        rect_width = width - x;
    }
    if ((y + rect_height) > height) {
        rect_height = height - y;
    }
    if (rect_width <= 0 || rect_height <= 0) {
        return;
    }

    for (row = 0; row < rect_height; row++) {
        int column;
        uint32_t* dst = framebuffer + ((y + row) * width) + x;
        for (column = 0; column < rect_width; column++) {
            dst[column] = argb;
        }
    }
}

static uint32_t td2_demo_blend_pixel(uint32_t dst, uint32_t src, uint8_t alpha) {
    uint8_t dst_red = (uint8_t)((dst >> 16) & 0xFFU);
    uint8_t dst_green = (uint8_t)((dst >> 8) & 0xFFU);
    uint8_t dst_blue = (uint8_t)(dst & 0xFFU);
    uint8_t src_red = (uint8_t)((src >> 16) & 0xFFU);
    uint8_t src_green = (uint8_t)((src >> 8) & 0xFFU);
    uint8_t src_blue = (uint8_t)(src & 0xFFU);
    uint8_t out_red = (uint8_t)(((src_red * alpha) + (dst_red * (255U - alpha))) / 255U);
    uint8_t out_green = (uint8_t)(((src_green * alpha) + (dst_green * (255U - alpha))) / 255U);
    uint8_t out_blue = (uint8_t)(((src_blue * alpha) + (dst_blue * (255U - alpha))) / 255U);

    return 0xFF000000U |
           ((uint32_t)out_red << 16) |
           ((uint32_t)out_green << 8) |
           (uint32_t)out_blue;
}

static void td2_demo_fill_rect_blend(
    uint32_t* framebuffer,
    int width,
    int height,
    int x,
    int y,
    int rect_width,
    int rect_height,
    uint32_t argb,
    uint8_t alpha
) {
    int row;

    if (framebuffer == NULL || rect_width <= 0 || rect_height <= 0) {
        return;
    }

    if (x < 0) {
        rect_width += x;
        x = 0;
    }
    if (y < 0) {
        rect_height += y;
        y = 0;
    }
    if ((x + rect_width) > width) {
        rect_width = width - x;
    }
    if ((y + rect_height) > height) {
        rect_height = height - y;
    }
    if (rect_width <= 0 || rect_height <= 0) {
        return;
    }

    for (row = 0; row < rect_height; row++) {
        int column;
        uint32_t* dst = framebuffer + ((y + row) * width) + x;
        for (column = 0; column < rect_width; column++) {
            dst[column] = td2_demo_blend_pixel(dst[column], argb, alpha);
        }
    }
}

static void td2_demo_draw_char(
    uint32_t* framebuffer,
    int width,
    int height,
    int x,
    int y,
    char c,
    uint32_t argb
) {
    const uint8_t* rows = td2_demo_find_glyph(c);
    int row;

    for (row = 0; row < TD2_DEMO_TEXT_GLYPH_HEIGHT; row++) {
        int column;
        for (column = 0; column < TD2_DEMO_TEXT_GLYPH_WIDTH; column++) {
            if ((rows[row] & (1U << (TD2_DEMO_TEXT_GLYPH_WIDTH - 1 - column))) == 0U) {
                continue;
            }
            td2_demo_fill_rect(framebuffer, width, height, x + column, y + row, 1, 1, argb);
        }
    }
}

static void td2_demo_draw_text(
    uint32_t* framebuffer,
    int width,
    int height,
    int x,
    int y,
    const char* text,
    uint32_t argb
) {
    int cursor_x = x;

    while (text != NULL && *text != '\0') {
        td2_demo_draw_char(framebuffer, width, height, cursor_x, y, *text, argb);
        cursor_x += TD2_DEMO_TEXT_ADVANCE;
        text++;
    }
}

static const char* td2_demo_state_source_name(Td2RuntimeStateSource source) {
    switch (source) {
        case TD2_RUNTIME_STATE_SOURCE_CONTRACT_SEED:
            return "CONTRACT SEED";
        case TD2_RUNTIME_STATE_SOURCE_CALLBACK_MODEL:
            return "CALLBACK MODEL";
        case TD2_RUNTIME_STATE_SOURCE_SCHEDULER_CONTRACT:
            return "SCHED CONTRACT";
        case TD2_RUNTIME_STATE_SOURCE_NONE:
        default:
            return "NONE";
    }
}

static const char* td2_demo_profile_name(Td2SchedulerProfile profile) {
    switch (profile) {
        case TD2_SCHEDULER_PROFILE_INTRO_NOINPUT:
            return "INTRO NOINPUT";
        case TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY:
            return "MENU ENTRY";
        case TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID:
            return "LIVE RACE";
        case TD2_SCHEDULER_PROFILE_NONE:
            return "NONE";
        case TD2_SCHEDULER_PROFILE_AUTO:
        default:
            return "AUTO";
    }
}

static void td2_demo_format_callback(
    char* out,
    size_t out_size,
    bool has_value,
    uint8_t bank,
    uint16_t addr
) {
    if (out == NULL || out_size == 0U) {
        return;
    }
    if (!has_value) {
        snprintf(out, out_size, "NONE");
        return;
    }
    snprintf(out, out_size, "%02X:%04X", (unsigned)bank, (unsigned)addr);
}

static bool td2_demo_scancode_down(
    const uint8_t* keyboard_state,
    size_t state_size,
    SDL_Scancode scancode
) {
    size_t index = (size_t)scancode;

    return keyboard_state != NULL &&
           index < state_size &&
           keyboard_state[index] != 0;
}

static bool td2_demo_pressed_edge(
    const uint8_t* keyboard_state,
    size_t state_size,
    SDL_Scancode scancode,
    bool* was_down
) {
    bool is_down = td2_demo_scancode_down(keyboard_state, state_size, scancode);
    bool pressed = is_down && !(*was_down);

    *was_down = is_down;
    return pressed;
}

static void td2_demo_apply_window_size(PlatformSdl* platform, int width, int height) {
    if (platform == NULL ||
        platform->headless ||
        platform->window == NULL ||
        width <= 0 ||
        height <= 0) {
        return;
    }

    SDL_SetWindowSize(platform->window, width, height);
}

static void td2_demo_draw_overlay(
    uint32_t* framebuffer,
    const Td2Runtime* runtime,
    const Td2RuntimeConfig* config,
    int window_width,
    int window_height
) {
    char line0[64];
    char line1[64];
    char line2[64];
    char line3[64];
    char line4[64];
    char line5[64];
    char line6[64];
    char line7[64];
    char main_callback[16];
    char irq_callback[16];
    char nmi_callback[16];
    unsigned absolute_frame = runtime->frame_counter;

    if (runtime->design_pack.has_frame_number) {
        absolute_frame += runtime->design_pack.frame_number;
    }

    td2_demo_format_callback(
        main_callback,
        sizeof(main_callback),
        runtime->state.has_active_main_callback,
        runtime->state.active_main_callback_bank,
        runtime->state.active_main_callback_addr);
    td2_demo_format_callback(
        irq_callback,
        sizeof(irq_callback),
        runtime->state.has_active_irq_callback,
        runtime->state.active_irq_callback_bank,
        runtime->state.active_irq_callback_addr);
    td2_demo_format_callback(
        nmi_callback,
        sizeof(nmi_callback),
        runtime->state.has_active_nmi_callback,
        runtime->state.active_nmi_callback_bank,
        runtime->state.active_nmi_callback_addr);

    snprintf(line0, sizeof(line0), "TD2 DEMO SDL NATIVE");
    snprintf(line1, sizeof(line1), "MESEN OFF ROM CPU EMU OFF");
    snprintf(line2, sizeof(line2), "PPM PNG DUMP %s", config->dump_prefix == NULL ? "OFF" : "ON");
    snprintf(line3, sizeof(line3), "COMPARE %s PROFILE %s", runtime->compare.enabled ? "ON" : "OFF", td2_demo_profile_name(runtime->scheduler.active_profile));
    snprintf(line4, sizeof(line4), "SRC %s", td2_demo_state_source_name(runtime->state.source));
    snprintf(line5, sizeof(line5), "FRAME %05u OUT %dX%d", absolute_frame, window_width, window_height);
    snprintf(line6, sizeof(line6), "MAIN %s IRQ %s", main_callback, irq_callback);
    snprintf(line7, sizeof(line7), "NMI %s F1 OVR 1 2 3 RES", nmi_callback);

    td2_demo_fill_rect_blend(
        framebuffer,
        TD2_FRAME_WIDTH,
        TD2_FRAME_HEIGHT,
        0,
        0,
        TD2_FRAME_WIDTH,
        76,
        0xFF000000U,
        176U);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 6, line0, 0xFFF8E45CU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 15, line1, 0xFFFFFFFFU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 24, line2, 0xFF9EE37DU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 33, line3, 0xFF9EE37DU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 42, line4, 0xFF8BD7FFU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 51, line5, 0xFFFFFFFFU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 60, line6, 0xFFFFFFFFU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 69, line7, 0xFFFFFFFFU);
}

int main(int argc, char** argv) {
    Td2RuntimeConfig config;
    Td2Runtime* runtime = NULL;
    PlatformSdl platform;
    uint32_t* present_framebuffer = NULL;
    char error[256];
    unsigned i;
    unsigned frame_limit = 0U;
    unsigned scale = 5U;
    unsigned requested_window_width = TD2_DEMO_DEFAULT_WINDOW_WIDTH;
    unsigned requested_window_height = TD2_DEMO_DEFAULT_WINDOW_HEIGHT;
    bool overlay_enabled = true;
    Td2DemoKeyLatch key_latch;

    memset(&config, 0, sizeof(config));
    memset(&platform, 0, sizeof(platform));
    memset(&key_latch, 0, sizeof(key_latch));

    config.scene_dir = "tools/out/design_lane3_live_race_mid_frame0_native";
    config.scheduler_profile = TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID;
    config.window_scale = 5;

    for (i = 1; i < (unsigned)argc; i++) {
        if (strcmp(argv[i], "--scene-dir") == 0 && i + 1 < (unsigned)argc) {
            config.scene_dir = argv[++i];
        } else if (strcmp(argv[i], "--scheduler-profile") == 0 && i + 1 < (unsigned)argc) {
            if (!td2_scheduler_parse_profile(argv[++i], &config.scheduler_profile)) {
                fprintf(stderr, "invalid scheduler profile: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--input-script") == 0 && i + 1 < (unsigned)argc) {
            config.input_script = argv[++i];
        } else if (strcmp(argv[i], "--frames") == 0 && i + 1 < (unsigned)argc) {
            if (!parse_uint(argv[++i], &frame_limit)) {
                fprintf(stderr, "invalid frame count: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--window-width") == 0 && i + 1 < (unsigned)argc) {
            if (!parse_uint(argv[++i], &requested_window_width) || requested_window_width == 0U) {
                fprintf(stderr, "invalid window width: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--window-height") == 0 && i + 1 < (unsigned)argc) {
            if (!parse_uint(argv[++i], &requested_window_height) || requested_window_height == 0U) {
                fprintf(stderr, "invalid window height: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--scale") == 0 && i + 1 < (unsigned)argc) {
            if (!parse_uint(argv[++i], &scale) || scale == 0U) {
                fprintf(stderr, "invalid scale: %s\n", argv[i]);
                return 1;
            }
            config.window_scale = (int)scale;
        } else if (strcmp(argv[i], "--no-overlay") == 0) {
            overlay_enabled = false;
        } else if (strcmp(argv[i], "--help") == 0) {
            print_usage(argv[0]);
            return 0;
        } else {
            fprintf(stderr, "unknown argument: %s\n", argv[i]);
            print_usage(argv[0]);
            return 1;
        }
    }

    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "nearest");

    runtime = (Td2Runtime*)calloc(1U, sizeof(*runtime));
    present_framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    if (runtime == NULL || present_framebuffer == NULL) {
        fprintf(stderr, "demo init failed: out of memory\n");
        free(present_framebuffer);
        free(runtime);
        return 1;
    }

    if (!td2_runtime_init(runtime, &config, error, sizeof(error))) {
        fprintf(stderr, "runtime init failed: %s\n", error);
        free(present_framebuffer);
        free(runtime);
        return 1;
    }

    if (!platform_sdl_init(
            &platform,
            "The Duel: Test Drive II - Native Demo Launcher",
            TD2_FRAME_WIDTH,
            TD2_FRAME_HEIGHT,
            config.window_scale,
            false,
            error,
            sizeof(error))) {
        fprintf(stderr, "platform init failed: %s\n", error);
        td2_runtime_free(runtime);
        free(present_framebuffer);
        free(runtime);
        return 1;
    }

    td2_demo_apply_window_size(
        &platform,
        (int)requested_window_width,
        (int)requested_window_height);

    fprintf(stdout,
            "Demo launcher ready: native_sdl=on mesen=off rom_cpu_emu=off compare=off dump=off overlay=%s scene=%s profile=%s window=%ux%u\n",
            overlay_enabled ? "on" : "off",
            config.scene_dir,
            td2_scheduler_profile_name(runtime->scheduler.active_profile),
            requested_window_width,
            requested_window_height);

    runtime->frame_counter = 0U;
    while (!platform.quit_requested) {
        const uint8_t* keyboard_state = NULL;
        int keyboard_size = 0;
        int window_width = 0;
        int window_height = 0;
        uint32_t frame_start = SDL_GetTicks();

        platform_sdl_poll_events(&platform);
        if (platform.quit_requested) {
            break;
        }

        if (frame_limit != 0U && runtime->frame_counter >= frame_limit) {
            break;
        }

        keyboard_state = SDL_GetKeyboardState(&keyboard_size);
        if (td2_demo_pressed_edge(
                keyboard_state,
                keyboard_size > 0 ? (size_t)keyboard_size : 0U,
                SDL_SCANCODE_F1,
                &key_latch.f1)) {
            overlay_enabled = !overlay_enabled;
        }
        if (td2_demo_pressed_edge(
                keyboard_state,
                keyboard_size > 0 ? (size_t)keyboard_size : 0U,
                SDL_SCANCODE_1,
                &key_latch.digit1)) {
            td2_demo_apply_window_size(&platform, 1280, 896);
        }
        if (td2_demo_pressed_edge(
                keyboard_state,
                keyboard_size > 0 ? (size_t)keyboard_size : 0U,
                SDL_SCANCODE_2,
                &key_latch.digit2)) {
            td2_demo_apply_window_size(&platform, 1600, 900);
        }
        if (td2_demo_pressed_edge(
                keyboard_state,
                keyboard_size > 0 ? (size_t)keyboard_size : 0U,
                SDL_SCANCODE_3,
                &key_latch.digit3)) {
            td2_demo_apply_window_size(&platform, 1920, 1080);
        }

        if (!td2_runtime_set_live_input_mask(
                runtime,
                platform_sdl_current_input_mask(&platform),
                error,
                sizeof(error))) {
            fprintf(stderr, "live input failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(present_framebuffer);
            free(runtime);
            return 1;
        }

        if (!td2_runtime_render_frame(runtime, error, sizeof(error))) {
            fprintf(stderr, "render failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(present_framebuffer);
            free(runtime);
            return 1;
        }

        memcpy(present_framebuffer, runtime->framebuffer, TD2_FRAME_PIXELS * sizeof(uint32_t));
        SDL_GetWindowSize(platform.window, &window_width, &window_height);
        if (overlay_enabled) {
            td2_demo_draw_overlay(present_framebuffer, runtime, &config, window_width, window_height);
        }

        if (!platform_sdl_present(
                &platform,
                present_framebuffer,
                TD2_FRAME_WIDTH,
                TD2_FRAME_HEIGHT,
                error,
                sizeof(error))) {
            fprintf(stderr, "present failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(present_framebuffer);
            free(runtime);
            return 1;
        }

        runtime->frame_counter++;
        platform_sdl_sleep_for_frame(&platform, frame_start);
    }

    platform_sdl_shutdown(&platform);
    td2_runtime_free(runtime);
    free(present_framebuffer);
    free(runtime);
    return 0;
}
