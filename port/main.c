#include <SDL2/SDL.h>

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform_sdl.h"
#include "td2_runtime.h"
#include "td2_scheduler.h"

static void print_usage(const char* argv0) {
    fprintf(stderr,
        "Usage: %s [options]\n"
        "\n"
        "Options:\n"
        "  --scene-dir PATH    Design-pack directory to load\n"
        "  --dump-prefix PATH  Write PPM+PNG frames to PATH_00000.{ppm,png}...\n"
        "                      With --compare also writes _reference/_diff/_compare artifacts in both formats\n"
        "  --frames N          Run a bounded frame count\n"
        "  --compare           Present and dump runtime|golden|diff side-by-side\n"
        "  --fail-on-compare-diff\n"
        "                      Exit non-zero when compare finds pixel or state drift\n"
        "  --scheduler-profile NAME\n"
        "                      auto | none | intro_noinput | menu_gameplay_entry | gameplay_live_race_mid\n"
        "  --input-script WINDOWS\n"
        "                      frame:buttons or start-end:buttons using a,b,start,up,down,left,right...\n"
        "  --scale N           Window scale for interactive mode\n"
        "  --headless          Skip SDL window creation\n"
        "  --help              Show this help\n",
        argv0
    );
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

int main(int argc, char** argv) {
    Td2RuntimeConfig config;
    Td2Runtime* runtime = NULL;
    PlatformSdl platform;
    char error[256];
    char frame_label[32];
    int present_width = TD2_FRAME_WIDTH;
    int present_height = TD2_FRAME_HEIGHT;
    unsigned i;

    memset(&config, 0, sizeof(config));
    config.scene_dir = "assets/test_dump_frame300/design_pack";
    config.window_scale = 3;
    config.scheduler_profile = TD2_SCHEDULER_PROFILE_AUTO;

    for (i = 1; i < (unsigned)argc; i++) {
        if (strcmp(argv[i], "--scene-dir") == 0 && i + 1 < (unsigned)argc) {
            config.scene_dir = argv[++i];
        } else if (strcmp(argv[i], "--dump-prefix") == 0 && i + 1 < (unsigned)argc) {
            config.dump_prefix = argv[++i];
        } else if (strcmp(argv[i], "--frames") == 0 && i + 1 < (unsigned)argc) {
            if (!parse_uint(argv[++i], &config.frame_limit)) {
                fprintf(stderr, "invalid frame count: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--compare") == 0) {
            config.compare_reference = true;
        } else if (strcmp(argv[i], "--fail-on-compare-diff") == 0) {
            config.compare_reference = true;
            config.fail_on_compare_diff = true;
        } else if (strcmp(argv[i], "--scheduler-profile") == 0 && i + 1 < (unsigned)argc) {
            if (!td2_scheduler_parse_profile(argv[++i], &config.scheduler_profile)) {
                fprintf(stderr, "invalid scheduler profile: %s\n", argv[i]);
                return 1;
            }
        } else if (strcmp(argv[i], "--input-script") == 0 && i + 1 < (unsigned)argc) {
            config.input_script = argv[++i];
        } else if (strcmp(argv[i], "--scale") == 0 && i + 1 < (unsigned)argc) {
            unsigned scale = 0;
            if (!parse_uint(argv[++i], &scale) || scale == 0U) {
                fprintf(stderr, "invalid scale: %s\n", argv[i]);
                return 1;
            }
            config.window_scale = (int)scale;
        } else if (strcmp(argv[i], "--headless") == 0) {
            config.headless = true;
        } else if (strcmp(argv[i], "--help") == 0) {
            print_usage(argv[0]);
            return 0;
        } else {
            fprintf(stderr, "unknown argument: %s\n", argv[i]);
            print_usage(argv[0]);
            return 1;
        }
    }

    if (config.headless && config.frame_limit == 0U) {
        config.frame_limit = 1U;
    }
    if (config.compare_reference) {
        present_width = TD2_COMPARE_WIDTH;
    }

    runtime = (Td2Runtime*)calloc(1U, sizeof(*runtime));
    if (runtime == NULL) {
        fprintf(stderr, "runtime init failed: out of memory\n");
        return 1;
    }

    if (!td2_runtime_init(runtime, &config, error, sizeof(error))) {
        fprintf(stderr, "runtime init failed: %s\n", error);
        free(runtime);
        return 1;
    }

    if (!platform_sdl_init(
            &platform,
            "The Duel: Test Drive II - SNES Bootstrap",
            present_width,
            present_height,
            config.window_scale,
            config.headless,
            error,
            sizeof(error))) {
        fprintf(stderr, "platform init failed: %s\n", error);
        td2_runtime_free(runtime);
        free(runtime);
        return 1;
    }

    if (runtime->design_pack.has_frame_number) {
        snprintf(frame_label, sizeof(frame_label), "%u", runtime->design_pack.frame_number);
    } else {
        snprintf(frame_label, sizeof(frame_label), "n/a");
    }

    fprintf(stdout,
        "Loaded scene %s (frame=%s, bgMode=%u, main=%u, sub=%u, scheduler=%s)\n",
        config.scene_dir,
        frame_label,
        runtime->design_pack.bg_mode,
        runtime->design_pack.main_screen_layers,
        runtime->design_pack.sub_screen_layers,
        td2_scheduler_profile_name(runtime->scheduler.active_profile)
    );
    if (runtime->compare.enabled) {
        fprintf(stdout, "Compare lane enabled: runtime | golden | diff\n");
    }

    runtime->frame_counter = 0U;
    while (!platform.quit_requested) {
        uint32_t frame_start = 0;

        if (!config.headless) {
            frame_start = SDL_GetTicks();
            platform_sdl_poll_events(&platform);
            if (platform.quit_requested) {
                break;
            }
        }

        if (config.frame_limit != 0U && runtime->frame_counter >= config.frame_limit) {
            break;
        }

        if (!td2_runtime_render_frame(runtime, error, sizeof(error))) {
            fprintf(stderr, "render failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(runtime);
            return 1;
        }

        if (runtime->compare.enabled &&
            (config.headless || td2_compare_has_drift(&runtime->compare))) {
            fprintf(stdout,
                "Compare frame %u: pixel_mismatch=%u (%.6f%%) ppu_state_failures=%u/%u callback_failures=%u/%u max=%u mean_abs=%.6f rmse=%.6f\n",
                runtime->frame_counter,
                runtime->compare.metrics.mismatch_pixels,
                runtime->compare.metrics.mismatch_ratio * 100.0,
                runtime->compare.state_contract.failed_checks,
                runtime->compare.state_contract.total_checks,
                runtime->compare.callback_contract.failed_checks,
                runtime->compare.callback_contract.total_checks,
                runtime->compare.metrics.max_channel_diff,
                runtime->compare.metrics.mean_abs_channel_diff,
                runtime->compare.metrics.rmse
            );
        }

        if (config.dump_prefix != NULL) {
            if (!td2_runtime_dump_frame(runtime, config.dump_prefix, runtime->frame_counter, error, sizeof(error))) {
                fprintf(stderr, "dump failed: %s\n", error);
                platform_sdl_shutdown(&platform);
                td2_runtime_free(runtime);
                free(runtime);
                return 1;
            }
        }

        if (!platform_sdl_present(
                &platform,
                runtime->compare.enabled ? runtime->compare.strip_framebuffer : runtime->framebuffer,
                present_width,
                present_height,
                error,
                sizeof(error))) {
            fprintf(stderr, "present failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(runtime);
            return 1;
        }

        if (config.fail_on_compare_diff &&
            runtime->compare.enabled &&
            td2_compare_has_drift(&runtime->compare)) {
            fprintf(stderr,
                "compare failed: pixel_mismatch=%u ppu_state_failures=%u callback_failures=%u\n",
                runtime->compare.metrics.mismatch_pixels,
                runtime->compare.state_contract.failed_checks,
                runtime->compare.callback_contract.failed_checks
            );
            platform_sdl_shutdown(&platform);
            td2_runtime_free(runtime);
            free(runtime);
            return 1;
        }

        runtime->frame_counter++;
        platform_sdl_sleep_for_frame(&platform, frame_start);
    }

    platform_sdl_shutdown(&platform);
    td2_runtime_free(runtime);
    free(runtime);
    return 0;
}
