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
#define TD2_DEMO_MAX_PATH 1400
#define TD2_DEMO_MAX_LABEL 128
#define TD2_DEMO_OVERLAY_LINE_COUNT 10

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

typedef enum {
    TD2_DEMO_MODE_SINGLE_SCENE = 0,
    TD2_DEMO_MODE_TIMELINE = 1
} Td2DemoMode;

typedef enum {
    TD2_DEMO_CLIP_SOURCE_EXACT = 0,
    TD2_DEMO_CLIP_SOURCE_EXACT_HOLD = 1,
    TD2_DEMO_CLIP_SOURCE_RUNTIME = 2,
    TD2_DEMO_CLIP_SOURCE_SYNTHETIC = 3
} Td2DemoClipSource;

typedef struct {
    char scene_dir[TD2_DEMO_MAX_PATH];
    char label[TD2_DEMO_MAX_LABEL];
    unsigned display_frames;
    Td2DemoClipSource source;
    Td2RuntimeConfig config;
    Td2Runtime runtime;
    bool runtime_ready;
} Td2DemoTimelineClip;

typedef struct {
    Td2DemoTimelineClip* clips;
    size_t clip_count;
    size_t clip_capacity;
    unsigned total_display_frames;
    char source_path[TD2_DEMO_MAX_PATH];
} Td2DemoTimeline;

typedef struct {
    size_t clip_index;
    unsigned clip_frame_index;
} Td2DemoTimelineCursor;

typedef struct {
    Td2DemoMode mode;
    size_t segment_index;
    size_t segment_count;
    unsigned segment_frame_index;
    unsigned segment_display_frames;
    Td2DemoClipSource clip_source;
    const char* label;
    const char* scene_dir;
} Td2DemoOverlayInfo;

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
            "  --timeline PATH           Native archaeology timeline manifest\n"
            "  --scene-dir PATH          Design-pack directory to load in single-scene mode\n"
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

static char* td2_demo_read_text_file(const char* path, size_t* size_out) {
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

static char* td2_demo_trim(char* text) {
    char* end;

    while (text != NULL &&
           (*text == ' ' || *text == '\t' || *text == '\r' || *text == '\n')) {
        text++;
    }
    if (text == NULL || *text == '\0') {
        return text;
    }

    end = text + strlen(text) - 1;
    while (end >= text &&
           (*end == ' ' || *end == '\t' || *end == '\r' || *end == '\n')) {
        *end = '\0';
        end--;
    }
    return text;
}

static bool td2_demo_copy_string(char* dst, size_t dst_size, const char* src) {
    size_t src_length;

    if (dst == NULL || dst_size == 0U || src == NULL) {
        return false;
    }

    src_length = strlen(src);
    if (src_length + 1U > dst_size) {
        return false;
    }

    memcpy(dst, src, src_length + 1U);
    return true;
}

static void td2_demo_dirname(const char* path, char* out, size_t out_size) {
    const char* slash = strrchr(path, '/');

    if (out == NULL || out_size == 0U) {
        return;
    }
    if (slash == NULL) {
        snprintf(out, out_size, ".");
        return;
    }
    snprintf(out, out_size, "%.*s", (int)(slash - path), path);
}

static const char* td2_demo_basename(const char* path) {
    const char* slash = strrchr(path, '/');

    return slash == NULL ? path : slash + 1;
}

static bool td2_demo_resolve_path(
    const char* anchor_path,
    const char* raw_path,
    char* out,
    size_t out_size
) {
    if (raw_path == NULL || out == NULL || out_size == 0U) {
        return false;
    }
    if (raw_path[0] == '/') {
        return td2_demo_copy_string(out, out_size, raw_path);
    }
    if (td2_contracts_resolve_repo_relative_path(anchor_path, raw_path, out, out_size)) {
        return true;
    }
    return td2_demo_copy_string(out, out_size, raw_path);
}

static bool td2_demo_parse_clip_source(
    const char* text,
    Td2DemoClipSource* source
) {
    if (strcmp(text, "exact") == 0) {
        *source = TD2_DEMO_CLIP_SOURCE_EXACT;
        return true;
    }
    if (strcmp(text, "exact_hold") == 0) {
        *source = TD2_DEMO_CLIP_SOURCE_EXACT_HOLD;
        return true;
    }
    if (strcmp(text, "runtime") == 0) {
        *source = TD2_DEMO_CLIP_SOURCE_RUNTIME;
        return true;
    }
    if (strcmp(text, "synthetic") == 0) {
        *source = TD2_DEMO_CLIP_SOURCE_SYNTHETIC;
        return true;
    }
    return false;
}

static const char* td2_demo_mode_name(Td2DemoMode mode) {
    switch (mode) {
        case TD2_DEMO_MODE_TIMELINE:
            return "TIMELINE";
        case TD2_DEMO_MODE_SINGLE_SCENE:
        default:
            return "SINGLE";
    }
}

static const char* td2_demo_clip_source_name(
    Td2DemoClipSource source,
    unsigned local_frame_index
) {
    switch (source) {
        case TD2_DEMO_CLIP_SOURCE_EXACT:
            return "EXACT PACK";
        case TD2_DEMO_CLIP_SOURCE_EXACT_HOLD:
            return local_frame_index == 0U ? "EXACT PACK" : "INFER HOLD";
        case TD2_DEMO_CLIP_SOURCE_RUNTIME:
            return "RUNTIME STEP";
        case TD2_DEMO_CLIP_SOURCE_SYNTHETIC:
        default:
            return "SYNTHETIC";
    }
}

static void td2_demo_format_overlay_text(
    char* out,
    size_t out_size,
    const char* text
) {
    size_t index = 0U;

    if (out == NULL || out_size == 0U) {
        return;
    }
    if (text == NULL) {
        out[0] = '\0';
        return;
    }

    while (*text != '\0' && index + 1U < out_size) {
        char c = *text++;

        if (c >= 'a' && c <= 'z') {
            c = (char)(c - ('a' - 'A'));
        }
        if ((c >= 'A' && c <= 'Z') ||
            (c >= '0' && c <= '9') ||
            c == ' ' ||
            c == ':') {
            out[index++] = c;
        } else {
            out[index++] = ' ';
        }
    }
    out[index] = '\0';
}

static bool td2_demo_timeline_reserve(
    Td2DemoTimeline* timeline,
    size_t capacity,
    char* error,
    size_t error_size
) {
    Td2DemoTimelineClip* resized;

    if (timeline->clip_capacity >= capacity) {
        return true;
    }

    resized = (Td2DemoTimelineClip*)realloc(
        timeline->clips,
        capacity * sizeof(*timeline->clips));
    if (resized == NULL) {
        snprintf(error, error_size, "failed to grow timeline clip storage");
        return false;
    }

    timeline->clips = resized;
    timeline->clip_capacity = capacity;
    return true;
}

static bool td2_demo_timeline_append_scene(
    Td2DemoTimeline* timeline,
    const char* scene_dir,
    unsigned display_frames,
    Td2SchedulerProfile profile,
    Td2DemoClipSource source,
    const char* label,
    char* error,
    size_t error_size
) {
    Td2DemoTimelineClip* clip;
    size_t next_index;

    if (display_frames == 0U) {
        snprintf(error, error_size, "timeline scene display_frames must be > 0");
        return false;
    }

    next_index = timeline->clip_count;
    if (next_index >= timeline->clip_capacity) {
        if (!td2_demo_timeline_reserve(
                timeline,
                timeline->clip_capacity == 0U ? 16U : timeline->clip_capacity * 2U,
                error,
                error_size)) {
            return false;
        }
    }

    clip = &timeline->clips[next_index];
    memset(clip, 0, sizeof(*clip));
    if (!td2_demo_copy_string(clip->scene_dir, sizeof(clip->scene_dir), scene_dir) ||
        !td2_demo_copy_string(clip->label, sizeof(clip->label), label)) {
        snprintf(error, error_size, "timeline clip path or label is too long");
        return false;
    }

    clip->display_frames = display_frames;
    clip->source = source;
    clip->config.scene_dir = clip->scene_dir;
    clip->config.window_scale = 5;
    clip->config.scheduler_profile = profile;
    clip->config.skip_reference_surface = true;

    timeline->clip_count++;
    timeline->total_display_frames += display_frames;
    return true;
}

static bool td2_demo_timeline_append_range(
    Td2DemoTimeline* timeline,
    const char* manifest_path,
    Td2SchedulerProfile profile,
    Td2DemoClipSource source,
    const char* label,
    char* error,
    size_t error_size
) {
    char manifest_dir[TD2_DEMO_MAX_PATH];
    char* json = NULL;
    const char* cursor;
    unsigned appended = 0U;

    td2_demo_dirname(manifest_path, manifest_dir, sizeof(manifest_dir));
    json = td2_demo_read_text_file(manifest_path, NULL);
    if (json == NULL) {
        snprintf(
            error,
            error_size,
            "failed to read timeline range manifest: %.96s",
            td2_demo_basename(manifest_path));
        return false;
    }

    cursor = json;
    while ((cursor = strstr(cursor, "\"packDir\"")) != NULL) {
        const char* colon = strchr(cursor, ':');
        const char* quote0;
        const char* quote1;
        char pack_dir[256];
        char scene_dir[TD2_DEMO_MAX_PATH];
        size_t pack_dir_length;

        if (colon == NULL) {
            break;
        }
        quote0 = strchr(colon, '"');
        if (quote0 == NULL) {
            break;
        }
        quote1 = strchr(quote0 + 1, '"');
        if (quote1 == NULL) {
            break;
        }

        pack_dir_length = (size_t)(quote1 - (quote0 + 1));
        if (pack_dir_length == 0U || pack_dir_length + 1U > sizeof(pack_dir)) {
            cursor = quote1 + 1;
            continue;
        }

        memcpy(pack_dir, quote0 + 1, pack_dir_length);
        pack_dir[pack_dir_length] = '\0';
        cursor = quote1 + 1;

        if (pack_dir[0] == '/') {
            continue;
        }

        {
            size_t manifest_dir_length = strlen(manifest_dir);
            size_t pack_dir_size = strlen(pack_dir) + 1U;

            if (manifest_dir_length + 1U + pack_dir_size > sizeof(scene_dir)) {
                snprintf(error, error_size, "timeline range scene path is too long");
                free(json);
                return false;
            }

            memcpy(scene_dir, manifest_dir, manifest_dir_length);
            scene_dir[manifest_dir_length] = '/';
            memcpy(scene_dir + manifest_dir_length + 1U, pack_dir, pack_dir_size);
        }
        if (!td2_demo_timeline_append_scene(
                timeline,
                scene_dir,
                1U,
                profile,
                source,
                label,
                error,
                error_size)) {
            free(json);
            return false;
        }
        appended++;
    }

    free(json);

    if (appended == 0U) {
        snprintf(
            error,
            error_size,
            "timeline range manifest had no entry packDir values: %.96s",
            td2_demo_basename(manifest_path));
        return false;
    }

    return true;
}

static bool td2_demo_timeline_load(
    Td2DemoTimeline* timeline,
    const char* timeline_path,
    char* error,
    size_t error_size
) {
    char* text = NULL;
    char* saveptr = NULL;
    char* line;

    memset(timeline, 0, sizeof(*timeline));
    if (!td2_demo_copy_string(timeline->source_path, sizeof(timeline->source_path), timeline_path)) {
        snprintf(error, error_size, "timeline path is too long");
        return false;
    }

    text = td2_demo_read_text_file(timeline_path, NULL);
    if (text == NULL) {
        snprintf(error, error_size, "failed to read timeline manifest: %s", timeline_path);
        return false;
    }

    line = strtok_r(text, "\n", &saveptr);
    while (line != NULL) {
        char* trimmed = td2_demo_trim(line);

        if (trimmed[0] != '\0' && trimmed[0] != '#') {
            char* fields[6];
            char* field_saveptr = NULL;
            unsigned field_count = 0U;
            char* token = strtok_r(trimmed, "|", &field_saveptr);

            while (token != NULL && field_count < 6U) {
                fields[field_count++] = td2_demo_trim(token);
                token = strtok_r(NULL, "|", &field_saveptr);
            }

            if (field_count == 0U) {
                line = strtok_r(NULL, "\n", &saveptr);
                continue;
            }

            if (strcmp(fields[0], "scene") == 0) {
                char resolved_path[TD2_DEMO_MAX_PATH];
                unsigned display_frames;
                Td2SchedulerProfile profile;
                Td2DemoClipSource source;

                if (field_count != 6U) {
                    snprintf(error, error_size, "timeline scene line requires 6 fields");
                    free(text);
                    return false;
                }
                if (!td2_demo_resolve_path(timeline_path, fields[1], resolved_path, sizeof(resolved_path)) ||
                    !parse_uint(fields[2], &display_frames) ||
                    !td2_scheduler_parse_profile(fields[3], &profile) ||
                    !td2_demo_parse_clip_source(fields[4], &source)) {
                    snprintf(error, error_size, "invalid timeline scene line: %s", trimmed);
                    free(text);
                    return false;
                }
                if (!td2_demo_timeline_append_scene(
                        timeline,
                        resolved_path,
                        display_frames,
                        profile,
                        source,
                        fields[5],
                        error,
                        error_size)) {
                    free(text);
                    return false;
                }
            } else if (strcmp(fields[0], "range") == 0) {
                char resolved_path[TD2_DEMO_MAX_PATH];
                Td2SchedulerProfile profile;
                Td2DemoClipSource source;

                if (field_count != 5U) {
                    snprintf(error, error_size, "timeline range line requires 5 fields");
                    free(text);
                    return false;
                }
                if (!td2_demo_resolve_path(timeline_path, fields[1], resolved_path, sizeof(resolved_path)) ||
                    !td2_scheduler_parse_profile(fields[2], &profile) ||
                    !td2_demo_parse_clip_source(fields[3], &source)) {
                    snprintf(error, error_size, "invalid timeline range line: %s", trimmed);
                    free(text);
                    return false;
                }
                if (!td2_demo_timeline_append_range(
                        timeline,
                        resolved_path,
                        profile,
                        source,
                        fields[4],
                        error,
                        error_size)) {
                    free(text);
                    return false;
                }
            } else {
                snprintf(error, error_size, "unknown timeline directive: %s", fields[0]);
                free(text);
                return false;
            }
        }

        line = strtok_r(NULL, "\n", &saveptr);
    }

    free(text);

    if (timeline->clip_count == 0U) {
        snprintf(error, error_size, "timeline manifest has no clips");
        return false;
    }

    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}

static bool td2_demo_timeline_preload(
    Td2DemoTimeline* timeline,
    char* error,
    size_t error_size
) {
    size_t index;

    for (index = 0; index < timeline->clip_count; index++) {
        Td2DemoTimelineClip* clip = &timeline->clips[index];

        clip->config.scene_dir = clip->scene_dir;

        if (!td2_runtime_init(&clip->runtime, &clip->config, error, error_size)) {
            snprintf(
                error,
                error_size,
                "timeline preload failed on clip %u scene %.96s: %.96s",
                (unsigned)(index + 1U),
                td2_demo_basename(clip->scene_dir),
                error[0] != '\0' ? error : "runtime init failed");
            return false;
        }
        clip->runtime_ready = true;
    }

    return true;
}

static void td2_demo_timeline_free(Td2DemoTimeline* timeline) {
    size_t index;

    if (timeline == NULL) {
        return;
    }

    for (index = 0; index < timeline->clip_count; index++) {
        if (timeline->clips[index].runtime_ready) {
            td2_runtime_free(&timeline->clips[index].runtime);
            timeline->clips[index].runtime_ready = false;
        }
    }

    free(timeline->clips);
    memset(timeline, 0, sizeof(*timeline));
}

static Td2DemoTimelineClip* td2_demo_timeline_current_clip(
    Td2DemoTimeline* timeline,
    const Td2DemoTimelineCursor* cursor
) {
    if (timeline == NULL ||
        cursor == NULL ||
        cursor->clip_index >= timeline->clip_count) {
        return NULL;
    }
    return &timeline->clips[cursor->clip_index];
}

static void td2_demo_timeline_advance(
    const Td2DemoTimeline* timeline,
    Td2DemoTimelineCursor* cursor
) {
    const Td2DemoTimelineClip* clip;

    if (timeline == NULL || cursor == NULL || timeline->clip_count == 0U) {
        return;
    }

    clip = &timeline->clips[cursor->clip_index];
    cursor->clip_frame_index++;
    if (cursor->clip_frame_index < clip->display_frames) {
        return;
    }

    cursor->clip_frame_index = 0U;
    cursor->clip_index++;
    if (cursor->clip_index >= timeline->clip_count) {
        cursor->clip_index = 0U;
    }
}

static void td2_demo_log_timeline_clip(
    const Td2DemoTimeline* timeline,
    const Td2DemoTimelineCursor* cursor
) {
    const Td2DemoTimelineClip* clip = td2_demo_timeline_current_clip((Td2DemoTimeline*)timeline, cursor);

    if (clip == NULL) {
        return;
    }

    fprintf(stdout,
            "Timeline clip %u/%u: source=%s frames=%u scene=%s label=%s\n",
            (unsigned)(cursor->clip_index + 1U),
            (unsigned)timeline->clip_count,
            td2_demo_clip_source_name(clip->source, cursor->clip_frame_index),
            clip->display_frames,
            clip->scene_dir,
            clip->label);
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
    const Td2DemoOverlayInfo* overlay,
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
    char line8[64];
    char line9[64];
    char main_callback[16];
    char irq_callback[16];
    char nmi_callback[16];
    char label[TD2_DEMO_MAX_LABEL];
    char scene_name[TD2_DEMO_MAX_LABEL];
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

    td2_demo_format_overlay_text(label, sizeof(label), overlay->label);
    td2_demo_format_overlay_text(scene_name, sizeof(scene_name), td2_demo_basename(overlay->scene_dir));

    snprintf(line0, sizeof(line0), "TD2 DEMO SDL NATIVE");
    snprintf(line1, sizeof(line1), "MESEN OFF ROM CPU EMU OFF");
    snprintf(
        line2,
        sizeof(line2),
        "REF PPM %s DUMP %s",
        config->skip_reference_surface ? "OFF" : "ON",
        config->dump_prefix == NULL ? "OFF" : "ON");
    snprintf(
        line3,
        sizeof(line3),
        "MODE %s PROFILE %s",
        td2_demo_mode_name(overlay->mode),
        td2_demo_profile_name(runtime->scheduler.active_profile));
    snprintf(
        line4,
        sizeof(line4),
        "SRC %s STATE %s",
        td2_demo_clip_source_name(overlay->clip_source, overlay->segment_frame_index),
        td2_demo_state_source_name(runtime->state.source));
    snprintf(
        line5,
        sizeof(line5),
        "SEG %02u OF %02u %.28s",
        (unsigned)(overlay->segment_index + 1U),
        (unsigned)overlay->segment_count,
        label);
    snprintf(line6, sizeof(line6), "FRAME %05u OUT %dX%d", absolute_frame, window_width, window_height);
    snprintf(
        line7,
        sizeof(line7),
        "SCENE %.18s STEP %u OF %u",
        scene_name,
        overlay->segment_frame_index + 1U,
        overlay->segment_display_frames);
    snprintf(line8, sizeof(line8), "MAIN %s IRQ %s", main_callback, irq_callback);
    snprintf(line9, sizeof(line9), "NMI %s F1 OVR 1 2 3 RES", nmi_callback);

    td2_demo_fill_rect_blend(
        framebuffer,
        TD2_FRAME_WIDTH,
        TD2_FRAME_HEIGHT,
        0,
        0,
        TD2_FRAME_WIDTH,
        94,
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
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 78, line8, 0xFFFFFFFFU);
    td2_demo_draw_text(framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, 6, 87, line9, 0xFFFFFFFFU);
}

int main(int argc, char** argv) {
    Td2DemoMode mode = TD2_DEMO_MODE_SINGLE_SCENE;
    Td2RuntimeConfig config;
    Td2Runtime* runtime = NULL;
    Td2DemoTimeline timeline;
    Td2DemoTimelineCursor timeline_cursor;
    PlatformSdl platform;
    uint32_t* present_framebuffer = NULL;
    char error[256];
    const char* timeline_path = NULL;
    unsigned i;
    unsigned frame_limit = 0U;
    unsigned displayed_frames = 0U;
    unsigned scale = 5U;
    unsigned requested_window_width = TD2_DEMO_DEFAULT_WINDOW_WIDTH;
    unsigned requested_window_height = TD2_DEMO_DEFAULT_WINDOW_HEIGHT;
    bool overlay_enabled = true;
    Td2DemoKeyLatch key_latch;

    memset(&config, 0, sizeof(config));
    memset(&timeline, 0, sizeof(timeline));
    memset(&timeline_cursor, 0, sizeof(timeline_cursor));
    memset(&platform, 0, sizeof(platform));
    memset(&key_latch, 0, sizeof(key_latch));

    config.scene_dir = "tools/out/design_lane3_live_race_mid_frame0_native";
    config.scheduler_profile = TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID;
    config.window_scale = 5;
    config.skip_reference_surface = true;

    for (i = 1; i < (unsigned)argc; i++) {
        if (strcmp(argv[i], "--timeline") == 0 && i + 1 < (unsigned)argc) {
            timeline_path = argv[++i];
            mode = TD2_DEMO_MODE_TIMELINE;
        } else if (strcmp(argv[i], "--scene-dir") == 0 && i + 1 < (unsigned)argc) {
            config.scene_dir = argv[++i];
            mode = TD2_DEMO_MODE_SINGLE_SCENE;
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

    if (mode == TD2_DEMO_MODE_TIMELINE && timeline_path == NULL) {
        fprintf(stderr, "timeline mode requires --timeline PATH\n");
        return 1;
    }

    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "nearest");

    if (mode == TD2_DEMO_MODE_TIMELINE) {
        if (!td2_demo_timeline_load(&timeline, timeline_path, error, sizeof(error)) ||
            !td2_demo_timeline_preload(&timeline, error, sizeof(error))) {
            fprintf(stderr, "timeline init failed: %s\n", error);
            td2_demo_timeline_free(&timeline);
            return 1;
        }
    } else {
        runtime = (Td2Runtime*)calloc(1U, sizeof(*runtime));
        if (runtime == NULL) {
            fprintf(stderr, "demo init failed: out of memory\n");
            return 1;
        }
        if (!td2_runtime_init(runtime, &config, error, sizeof(error))) {
            fprintf(stderr, "runtime init failed: %s\n", error);
            free(runtime);
            return 1;
        }
    }

    present_framebuffer = (uint32_t*)calloc(TD2_FRAME_PIXELS, sizeof(uint32_t));
    if (present_framebuffer == NULL) {
        fprintf(stderr, "demo init failed: out of memory\n");
        td2_demo_timeline_free(&timeline);
        if (runtime != NULL) {
            td2_runtime_free(runtime);
        }
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
        td2_demo_timeline_free(&timeline);
        free(present_framebuffer);
        if (runtime != NULL) {
            td2_runtime_free(runtime);
        }
        free(runtime);
        return 1;
    }

    td2_demo_apply_window_size(
        &platform,
        (int)requested_window_width,
        (int)requested_window_height);

    if (mode == TD2_DEMO_MODE_TIMELINE) {
        fprintf(stdout,
                "Demo launcher ready: native_sdl=on mesen=off rom_cpu_emu=off compare=off dump=off reference_ppm=off overlay=%s mode=timeline timeline=%s clips=%u frames=%u window=%ux%u\n",
                overlay_enabled ? "on" : "off",
                timeline.source_path,
                (unsigned)timeline.clip_count,
                timeline.total_display_frames,
                requested_window_width,
                requested_window_height);
        td2_demo_log_timeline_clip(&timeline, &timeline_cursor);
    } else {
        fprintf(stdout,
                "Demo launcher ready: native_sdl=on mesen=off rom_cpu_emu=off compare=off dump=off reference_ppm=off overlay=%s mode=single scene=%s profile=%s window=%ux%u\n",
                overlay_enabled ? "on" : "off",
                config.scene_dir,
                td2_scheduler_profile_name(runtime->scheduler.active_profile),
                requested_window_width,
                requested_window_height);
        runtime->frame_counter = 0U;
    }

    while (!platform.quit_requested) {
        const uint8_t* keyboard_state = NULL;
        int keyboard_size = 0;
        int window_width = 0;
        int window_height = 0;
        uint32_t frame_start = SDL_GetTicks();
        Td2Runtime* active_runtime = runtime;
        Td2RuntimeConfig* active_config = &config;
        Td2DemoOverlayInfo overlay;

        memset(&overlay, 0, sizeof(overlay));

        platform_sdl_poll_events(&platform);
        if (platform.quit_requested) {
            break;
        }

        if (frame_limit != 0U && displayed_frames >= frame_limit) {
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

        if (mode == TD2_DEMO_MODE_TIMELINE) {
            Td2DemoTimelineClip* clip = td2_demo_timeline_current_clip(&timeline, &timeline_cursor);

            if (clip == NULL) {
                fprintf(stderr, "timeline playback failed: no active clip\n");
                platform_sdl_shutdown(&platform);
                td2_demo_timeline_free(&timeline);
                free(present_framebuffer);
                return 1;
            }

            active_runtime = &clip->runtime;
            active_config = &clip->config;
            active_runtime->frame_counter = 0U;

            overlay.mode = TD2_DEMO_MODE_TIMELINE;
            overlay.segment_index = timeline_cursor.clip_index;
            overlay.segment_count = timeline.clip_count;
            overlay.segment_frame_index = timeline_cursor.clip_frame_index;
            overlay.segment_display_frames = clip->display_frames;
            overlay.clip_source = clip->source;
            overlay.label = clip->label;
            overlay.scene_dir = clip->scene_dir;
        } else {
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

            overlay.mode = TD2_DEMO_MODE_SINGLE_SCENE;
            overlay.segment_index = 0U;
            overlay.segment_count = 1U;
            overlay.segment_frame_index = runtime->frame_counter;
            overlay.segment_display_frames = frame_limit != 0U ? frame_limit : 1U;
            overlay.clip_source = TD2_DEMO_CLIP_SOURCE_RUNTIME;
            overlay.label = td2_demo_basename(config.scene_dir);
            overlay.scene_dir = config.scene_dir;
        }

        if (!td2_runtime_render_frame(active_runtime, error, sizeof(error))) {
            fprintf(stderr, "render failed: %s\n", error);
            platform_sdl_shutdown(&platform);
            td2_demo_timeline_free(&timeline);
            if (runtime != NULL) {
                td2_runtime_free(runtime);
            }
            free(present_framebuffer);
            free(runtime);
            return 1;
        }

        memcpy(present_framebuffer, active_runtime->framebuffer, TD2_FRAME_PIXELS * sizeof(uint32_t));
        SDL_GetWindowSize(platform.window, &window_width, &window_height);
        if (overlay_enabled) {
            td2_demo_draw_overlay(
                present_framebuffer,
                active_runtime,
                active_config,
                &overlay,
                window_width,
                window_height);
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
            td2_demo_timeline_free(&timeline);
            if (runtime != NULL) {
                td2_runtime_free(runtime);
            }
            free(present_framebuffer);
            free(runtime);
            return 1;
        }

        displayed_frames++;
        if (mode == TD2_DEMO_MODE_TIMELINE) {
            size_t previous_clip_index = timeline_cursor.clip_index;

            td2_demo_timeline_advance(&timeline, &timeline_cursor);
            if (timeline_cursor.clip_index != previous_clip_index) {
                td2_demo_log_timeline_clip(&timeline, &timeline_cursor);
            }
        } else {
            runtime->frame_counter++;
        }

        platform_sdl_sleep_for_frame(&platform, frame_start);
    }

    platform_sdl_shutdown(&platform);
    td2_demo_timeline_free(&timeline);
    if (runtime != NULL) {
        td2_runtime_free(runtime);
    }
    free(present_framebuffer);
    free(runtime);
    return 0;
}
