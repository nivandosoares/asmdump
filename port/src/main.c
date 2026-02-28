#include <SDL.h>

#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum {
    SCREEN_WIDTH = 256,
    SCREEN_HEIGHT = 224,
    TARGET_HZ = 60,
    COLORS_PER_PALETTE = 16,
    DEFAULT_WINDOW_SCALE = 3
};

static const uint8_t OAM_SIZE_TABLE[8][2][2] = {
    {{1, 1}, {2, 2}},
    {{1, 1}, {4, 4}},
    {{1, 1}, {8, 8}},
    {{2, 2}, {4, 4}},
    {{2, 2}, {8, 8}},
    {{4, 4}, {8, 8}},
    {{2, 4}, {4, 8}},
    {{2, 4}, {4, 4}}
};

typedef struct {
    uint32_t *colors;
    size_t palette_count;
} PaletteBank;

typedef struct {
    uint8_t *pixels;
    int width;
    int height;
} ImageData;

typedef enum {
    INDEXED_ANIM_MODE_PALETTE_FRAMES = 0,
    INDEXED_ANIM_MODE_BALLISTIC_A39C = 1
} IndexedAnimMode;

typedef struct {
    bool loaded;
    IndexedAnimMode mode;
    uint8_t *indices;
    int width;
    int height;
    int palette_count;
    uint32_t *palette_frames;
    int *durations;
    size_t frame_count;
    size_t current_frame;
    int frames_remaining;
    uint8_t *helper_cgram;
    size_t helper_cgram_size;
    uint16_t *ramp_words;
    size_t ramp_word_count;
    int *class_cgram_indices;
    int dynamic_start;
    int dynamic_count;
    int counter_wrap;
    int step_frames;
    uint32_t *runtime_palette;
} IndexedPaletteAnimation;

typedef struct {
    int tilemap_address;
    int chr_address;
    bool double_width;
    bool double_height;
    bool large_tiles;
    int hscroll;
    int vscroll;
} SnesBgLayerState;

typedef struct {
    bool loaded;
    int bg_mode;
    int main_screen_layers;
    bool mode7_fill_with_tile0;
    bool mode7_horizontal_mirroring;
    bool mode7_vertical_mirroring;
    bool mode7_large_map;
    int mode7_center_x;
    int mode7_center_y;
    int mode7_hscroll;
    int mode7_vscroll;
    int mode7_matrix[4];
    int oam_mode;
    int oam_base_address;
    int oam_address_offset;
    int internal_oam_address;
    bool enable_oam_priority;
    bool obj_interlace;
    bool overscan_mode;
    uint8_t *vram;
    size_t vram_size;
    uint8_t *cgram;
    size_t cgram_size;
    uint8_t *oam;
    size_t oam_size;
    uint32_t cgram_colors[256];
    SnesBgLayerState layers[3];
    uint8_t tile_cache[3][1024][64];
    uint8_t tile_cache_valid[3][1024];
} SnesBgScene;

typedef enum {
    SEQUENCE_ENTRY_SNES_BG = 1,
    SEQUENCE_ENTRY_IMAGE = 2,
    SEQUENCE_ENTRY_INDEXED_ANIM = 3,
    SEQUENCE_ENTRY_BALLISTIC_A39C = 4
} SequenceEntryType;

typedef struct {
    SequenceEntryType type;
    int duration_frames;
    char *primary_path;
    char *secondary_path;
    char *tertiary_path;
    char *quaternary_path;
} SceneSequenceEntry;

typedef struct {
    bool loaded;
    bool loop;
    SceneSequenceEntry *entries;
    size_t count;
    size_t current_index;
    int frames_remaining;
} SceneSequence;

typedef struct {
    bool running;
    bool auto_cycle;
    int auto_quit_frames;
    size_t current_palette;
    uint64_t tick_count;
    uint64_t rendered_frames;
    const char *dump_prefix;
    PaletteBank palette_bank;
    ImageData image;
    IndexedPaletteAnimation indexed_anim;
    SnesBgScene snes_bg_scene;
    SceneSequence sequence;
    int image_offset_x;
    int image_offset_y;
    uint32_t framebuffer[SCREEN_WIDTH * SCREEN_HEIGHT];
} AppState;

static bool read_entire_file(const char *path, char **out_data, size_t *out_size);

static void palette_bank_free(PaletteBank *bank) {
    free(bank->colors);
    bank->colors = NULL;
    bank->palette_count = 0;
}

static void image_data_free(ImageData *image) {
    free(image->pixels);
    image->pixels = NULL;
    image->width = 0;
    image->height = 0;
}

static void indexed_palette_animation_free(IndexedPaletteAnimation *animation) {
    free(animation->indices);
    free(animation->palette_frames);
    free(animation->durations);
    free(animation->helper_cgram);
    free(animation->ramp_words);
    free(animation->class_cgram_indices);
    free(animation->runtime_palette);
    animation->indices = NULL;
    animation->palette_frames = NULL;
    animation->durations = NULL;
    animation->helper_cgram = NULL;
    animation->ramp_words = NULL;
    animation->class_cgram_indices = NULL;
    animation->runtime_palette = NULL;
    animation->loaded = false;
    animation->mode = INDEXED_ANIM_MODE_PALETTE_FRAMES;
    animation->width = 0;
    animation->height = 0;
    animation->palette_count = 0;
    animation->frame_count = 0;
    animation->current_frame = 0;
    animation->frames_remaining = 0;
    animation->helper_cgram_size = 0;
    animation->ramp_word_count = 0;
    animation->dynamic_start = 0;
    animation->dynamic_count = 0;
    animation->counter_wrap = 0;
    animation->step_frames = 0;
}

static void scene_sequence_free(SceneSequence *sequence) {
    if (!sequence->entries) {
        sequence->loaded = false;
        sequence->count = 0;
        sequence->current_index = 0;
        sequence->frames_remaining = 0;
        return;
    }

    for (size_t i = 0; i < sequence->count; i++) {
        free(sequence->entries[i].primary_path);
        free(sequence->entries[i].secondary_path);
        free(sequence->entries[i].tertiary_path);
        free(sequence->entries[i].quaternary_path);
    }

    free(sequence->entries);
    sequence->entries = NULL;
    sequence->loaded = false;
    sequence->loop = false;
    sequence->count = 0;
    sequence->current_index = 0;
    sequence->frames_remaining = 0;
}

static void snes_bg_scene_free(SnesBgScene *scene) {
    free(scene->vram);
    free(scene->cgram);
    free(scene->oam);
    scene->vram = NULL;
    scene->cgram = NULL;
    scene->oam = NULL;
    scene->vram_size = 0;
    scene->cgram_size = 0;
    scene->oam_size = 0;
    scene->loaded = false;
    memset(scene->cgram_colors, 0, sizeof(scene->cgram_colors));
    memset(scene->layers, 0, sizeof(scene->layers));
    memset(scene->mode7_matrix, 0, sizeof(scene->mode7_matrix));
    scene->mode7_fill_with_tile0 = false;
    scene->mode7_horizontal_mirroring = false;
    scene->mode7_vertical_mirroring = false;
    scene->mode7_large_map = false;
    scene->mode7_center_x = 0;
    scene->mode7_center_y = 0;
    scene->mode7_hscroll = 0;
    scene->mode7_vscroll = 0;
    scene->oam_mode = 0;
    scene->oam_base_address = 0;
    scene->oam_address_offset = 0;
    scene->internal_oam_address = 0;
    scene->enable_oam_priority = false;
    scene->obj_interlace = false;
    scene->overscan_mode = false;
    memset(scene->tile_cache_valid, 0, sizeof(scene->tile_cache_valid));
}

static bool write_frame_ppm(const char *path, const uint32_t *framebuffer) {
    FILE *file = fopen(path, "wb");
    if (!file) {
        fprintf(stderr, "error: failed to open %s for writing: %s\n", path, strerror(errno));
        return false;
    }

    if (fprintf(file, "P6\n%d %d\n255\n", SCREEN_WIDTH, SCREEN_HEIGHT) < 0) {
        fprintf(stderr, "error: failed to write PPM header to %s\n", path);
        fclose(file);
        return false;
    }

    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            uint32_t color = framebuffer[(y * SCREEN_WIDTH) + x];
            uint8_t rgb[3] = {
                (uint8_t)((color >> 16) & 0xffu),
                (uint8_t)((color >> 8) & 0xffu),
                (uint8_t)(color & 0xffu)
            };

            if (fwrite(rgb, sizeof(rgb), 1, file) != 1) {
                fprintf(stderr, "error: failed to write pixel data to %s\n", path);
                fclose(file);
                return false;
            }
        }
    }

    fclose(file);
    return true;
}

static bool dump_frame_if_requested(const AppState *app) {
    if (!app->dump_prefix) {
        return true;
    }

    char path[1024];
    snprintf(path, sizeof(path), "%s_%05llu.ppm", app->dump_prefix, (unsigned long long)app->rendered_frames);
    return write_frame_ppm(path, app->framebuffer);
}

static char *dup_string(const char *value) {
    size_t length = 0;
    char *copy = NULL;

    if (!value) {
        return NULL;
    }

    length = strlen(value);
    copy = malloc(length + 1u);
    if (!copy) {
        return NULL;
    }

    memcpy(copy, value, length + 1u);
    return copy;
}

static bool path_is_absolute(const char *path) {
    return path && path[0] == '/';
}

static char *resolve_manifest_path(const char *manifest_path, const char *relative_path) {
    const char *slash = NULL;
    size_t directory_length = 0;
    char *resolved = NULL;

    if (!relative_path) {
        return NULL;
    }
    if (path_is_absolute(relative_path)) {
        return dup_string(relative_path);
    }

    slash = strrchr(manifest_path, '/');
    if (!slash) {
        return dup_string(relative_path);
    }

    directory_length = (size_t)(slash - manifest_path);
    resolved = malloc(directory_length + 1u + strlen(relative_path) + 1u);
    if (!resolved) {
        return NULL;
    }

    memcpy(resolved, manifest_path, directory_length);
    resolved[directory_length] = '/';
    strcpy(resolved + directory_length + 1u, relative_path);
    return resolved;
}

static bool path_exists(const char *path) {
    FILE *file = NULL;

    if (!path) {
        return false;
    }

    file = fopen(path, "rb");
    if (!file) {
        return false;
    }

    fclose(file);
    return true;
}

static char *resolve_sibling_path(const char *path, const char *filename) {
    const char *slash = NULL;
    size_t directory_length = 0;
    char *resolved = NULL;

    if (!path || !filename) {
        return NULL;
    }

    slash = strrchr(path, '/');
    if (!slash) {
        return dup_string(filename);
    }

    directory_length = (size_t)(slash - path);
    resolved = malloc(directory_length + 1u + strlen(filename) + 1u);
    if (!resolved) {
        return NULL;
    }

    memcpy(resolved, path, directory_length);
    resolved[directory_length] = '/';
    strcpy(resolved + directory_length + 1u, filename);
    return resolved;
}

static bool read_ppm_token(FILE *file, char *buffer, size_t buffer_size) {
    int ch = fgetc(file);
    while (ch != EOF) {
        if (isspace(ch)) {
            ch = fgetc(file);
            continue;
        }
        if (ch == '#') {
            while (ch != EOF && ch != '\n') {
                ch = fgetc(file);
            }
            ch = fgetc(file);
            continue;
        }
        break;
    }

    if (ch == EOF) {
        return false;
    }

    size_t index = 0;
    while (ch != EOF && !isspace(ch) && ch != '#') {
        if ((index + 1u) >= buffer_size) {
            fprintf(stderr, "error: PPM token too long\n");
            return false;
        }
        buffer[index++] = (char)ch;
        ch = fgetc(file);
    }

    if (ch == '#') {
        ungetc(ch, file);
    }

    buffer[index] = '\0';
    return index > 0u;
}

static bool image_data_load_ppm(const char *path, ImageData *out_image) {
    FILE *file = fopen(path, "rb");
    char token[64];
    int width = 0;
    int height = 0;
    int max_value = 0;

    if (!file) {
        fprintf(stderr, "error: failed to open image %s: %s\n", path, strerror(errno));
        return false;
    }

    if (!read_ppm_token(file, token, sizeof(token)) || strcmp(token, "P6") != 0) {
        fprintf(stderr, "error: %s is not a binary PPM (P6)\n", path);
        fclose(file);
        return false;
    }

    if (!read_ppm_token(file, token, sizeof(token))) {
        fprintf(stderr, "error: missing width in %s\n", path);
        fclose(file);
        return false;
    }
    width = atoi(token);

    if (!read_ppm_token(file, token, sizeof(token))) {
        fprintf(stderr, "error: missing height in %s\n", path);
        fclose(file);
        return false;
    }
    height = atoi(token);

    if (!read_ppm_token(file, token, sizeof(token))) {
        fprintf(stderr, "error: missing max value in %s\n", path);
        fclose(file);
        return false;
    }
    max_value = atoi(token);

    if (width <= 0 || height <= 0 || max_value != 255) {
        fprintf(stderr, "error: unsupported PPM parameters in %s\n", path);
        fclose(file);
        return false;
    }

    int ch = fgetc(file);
    while (ch != EOF && isspace(ch)) {
        ch = fgetc(file);
    }
    if (ch != EOF) {
        ungetc(ch, file);
    }

    size_t pixel_bytes = (size_t)width * (size_t)height * 3u;
    uint8_t *pixels = malloc(pixel_bytes);
    if (!pixels) {
        fprintf(stderr, "error: out of memory loading image %s\n", path);
        fclose(file);
        return false;
    }

    if (fread(pixels, 1, pixel_bytes, file) != pixel_bytes) {
        fprintf(stderr, "error: incomplete pixel data in %s\n", path);
        free(pixels);
        fclose(file);
        return false;
    }

    image_data_free(out_image);
    out_image->pixels = pixels;
    out_image->width = width;
    out_image->height = height;
    fclose(file);
    return true;
}

static uint32_t snes_cgram_word_to_argb(uint16_t word) {
    int red = word & 0x1fu;
    int green = (word >> 5) & 0x1fu;
    int blue = (word >> 10) & 0x1fu;
    uint8_t red8 = (uint8_t)((red << 3) | (red >> 2));
    uint8_t green8 = (uint8_t)((green << 3) | (green >> 2));
    uint8_t blue8 = (uint8_t)((blue << 3) | (blue >> 2));

    return 0xff000000u |
           ((uint32_t)red8 << 16) |
           ((uint32_t)green8 << 8) |
           (uint32_t)blue8;
}

static bool indexed_palette_animation_update_runtime_palette(IndexedPaletteAnimation *animation) {
    uint8_t cgram[0x200];

    if (!animation->loaded ||
        animation->mode != INDEXED_ANIM_MODE_BALLISTIC_A39C ||
        !animation->helper_cgram ||
        animation->helper_cgram_size != sizeof(cgram) ||
        !animation->ramp_words ||
        !animation->class_cgram_indices ||
        !animation->runtime_palette) {
        return false;
    }

    memcpy(cgram, animation->helper_cgram, sizeof(cgram));
    if (animation->current_frame > 0u) {
        int counter_value = 0;

        for (size_t frame_index = 1u; frame_index <= animation->current_frame; frame_index++) {
            int start_word = counter_value + 2;
            if ((start_word + animation->dynamic_count) > (int)animation->ramp_word_count) {
                fprintf(stderr, "error: Ballistic ramp is too short for frame %zu\n", frame_index);
                return false;
            }

            for (int color_index = 0; color_index < animation->dynamic_count; color_index++) {
                uint16_t word = animation->ramp_words[start_word + color_index];
                int cgram_offset = (animation->dynamic_start + color_index) * 2;
                if ((cgram_offset + 1) >= (int)sizeof(cgram)) {
                    fprintf(stderr, "error: Ballistic CGRAM write exceeds 512-byte CGRAM buffer\n");
                    return false;
                }
                cgram[cgram_offset] = (uint8_t)(word & 0xffu);
                cgram[cgram_offset + 1] = (uint8_t)(word >> 8);
            }

            counter_value--;
            if (counter_value < 0) {
                counter_value = animation->counter_wrap;
            }
        }
    }

    for (int class_index = 0; class_index < animation->palette_count; class_index++) {
        int cgram_index = animation->class_cgram_indices[class_index];
        size_t cgram_offset = (size_t)cgram_index * 2u;

        if (class_index == 0 || animation->current_frame == 0u) {
            animation->runtime_palette[class_index] = 0xff000000u;
            continue;
        }
        if (cgram_index < 0 || (cgram_offset + 1u) >= sizeof(cgram)) {
            animation->runtime_palette[class_index] = 0xff000000u;
            continue;
        }

        animation->runtime_palette[class_index] =
            snes_cgram_word_to_argb((uint16_t)cgram[cgram_offset] | (uint16_t)(cgram[cgram_offset + 1u] << 8));
    }

    return true;
}

static bool indexed_palette_animation_load(const char *manifest_path, IndexedPaletteAnimation *out_animation) {
    FILE *file = NULL;
    char line[8192];
    char *resolved_indices_path = NULL;
    uint8_t *indices = NULL;
    uint32_t *palette_frames = NULL;
    int *durations = NULL;
    size_t palette_capacity = 0;
    size_t frame_count = 0;
    int width = 0;
    int height = 0;
    int palette_count = 0;
    bool ok = false;

    file = fopen(manifest_path, "r");
    if (!file) {
        fprintf(stderr, "error: failed to open indexed animation manifest %s: %s\n", manifest_path, strerror(errno));
        return false;
    }

    while (fgets(line, sizeof(line), file)) {
        char *token = line;

        while (*token && isspace((unsigned char)*token)) {
            token++;
        }
        if (*token == '\0' || *token == '#' || *token == '\n' || *token == '\r') {
            continue;
        }

        if (strncmp(token, "size ", 5) == 0) {
            int parsed_width = 0;
            int parsed_height = 0;
            if (sscanf(token, "size %d %d", &parsed_width, &parsed_height) != 2 ||
                parsed_width <= 0 || parsed_height <= 0) {
                fprintf(stderr, "error: invalid size line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            width = parsed_width;
            height = parsed_height;
        } else if (strncmp(token, "indices ", 8) == 0) {
            char relative_path[4096];
            if (sscanf(token, "indices %4095s", relative_path) != 1) {
                fprintf(stderr, "error: invalid indices line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            free(resolved_indices_path);
            resolved_indices_path = resolve_manifest_path(manifest_path, relative_path);
            if (!resolved_indices_path) {
                fprintf(stderr, "error: out of memory resolving indexed animation path in %s\n", manifest_path);
                goto cleanup;
            }
        } else if (strncmp(token, "palette_count ", 14) == 0) {
            int parsed_palette_count = 0;
            if (sscanf(token, "palette_count %d", &parsed_palette_count) != 1 ||
                parsed_palette_count <= 0 || parsed_palette_count > 256) {
                fprintf(stderr, "error: invalid palette_count line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            palette_count = parsed_palette_count;
        } else if (strncmp(token, "frame ", 6) == 0) {
            char *cursor = token + 6;
            char *end = NULL;
            long duration = strtol(cursor, &end, 10);

            if (cursor == end || duration <= 0) {
                fprintf(stderr, "error: invalid frame duration in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            if (palette_count <= 0) {
                fprintf(stderr, "error: frame entries require palette_count first in %s\n", manifest_path);
                goto cleanup;
            }
            if (frame_count == palette_capacity) {
                size_t next_capacity = palette_capacity == 0 ? 8u : palette_capacity * 2u;
                uint32_t *next_palette_frames = realloc(palette_frames, next_capacity * (size_t)palette_count * sizeof(*palette_frames));
                int *next_durations = realloc(durations, next_capacity * sizeof(*durations));
                if (!next_palette_frames || !next_durations) {
                    free(next_palette_frames);
                    free(next_durations);
                    fprintf(stderr, "error: out of memory growing indexed animation %s\n", manifest_path);
                    goto cleanup;
                }
                palette_frames = next_palette_frames;
                durations = next_durations;
                palette_capacity = next_capacity;
            }

            durations[frame_count] = (int)duration;
            cursor = end;
            for (int color_index = 0; color_index < palette_count; color_index++) {
                long channels[3] = {0};
                for (int channel = 0; channel < 3; channel++) {
                    while (*cursor && isspace((unsigned char)*cursor)) {
                        cursor++;
                    }
                    channels[channel] = strtol(cursor, &end, 10);
                    if (cursor == end || channels[channel] < 0 || channels[channel] > 255) {
                        fprintf(stderr, "error: invalid RGB channel in %s: %s\n", manifest_path, line);
                        goto cleanup;
                    }
                    cursor = end;
                }

                palette_frames[(frame_count * (size_t)palette_count) + (size_t)color_index] =
                    0xff000000u |
                    ((uint32_t)channels[0] << 16) |
                    ((uint32_t)channels[1] << 8) |
                    (uint32_t)channels[2];
            }

            frame_count++;
        } else {
            fprintf(stderr, "error: unknown indexed animation directive in %s: %s\n", manifest_path, line);
            goto cleanup;
        }
    }

    if (width <= 0 || height <= 0 || palette_count <= 0 || frame_count == 0 || !resolved_indices_path) {
        fprintf(stderr, "error: incomplete indexed animation manifest %s\n", manifest_path);
        goto cleanup;
    }

    {
        char *indices_data = NULL;
        size_t indices_size = 0;
        if (!read_entire_file(resolved_indices_path, &indices_data, &indices_size)) {
            goto cleanup;
        }
        if (indices_size != ((size_t)width * (size_t)height)) {
            fprintf(
                stderr,
                "error: indexed animation image %s has %zu bytes, expected %zu\n",
                resolved_indices_path,
                indices_size,
                (size_t)width * (size_t)height
            );
            free(indices_data);
            goto cleanup;
        }
        indices = (uint8_t *)indices_data;
    }

    for (size_t pixel_index = 0; pixel_index < ((size_t)width * (size_t)height); pixel_index++) {
        if ((int)indices[pixel_index] >= palette_count) {
            fprintf(stderr, "error: indexed animation pixel %zu exceeds palette_count in %s\n", pixel_index, manifest_path);
            goto cleanup;
        }
    }

    indexed_palette_animation_free(out_animation);
    out_animation->indices = indices;
    out_animation->width = width;
    out_animation->height = height;
    out_animation->palette_count = palette_count;
    out_animation->palette_frames = palette_frames;
    out_animation->durations = durations;
    out_animation->frame_count = frame_count;
    out_animation->current_frame = 0u;
    out_animation->frames_remaining = durations[0];
    out_animation->loaded = true;
    indices = NULL;
    palette_frames = NULL;
    durations = NULL;
    ok = true;

cleanup:
    if (!ok) {
        indexed_palette_animation_free(out_animation);
    }
    fclose(file);
    free(resolved_indices_path);
    free(indices);
    free(palette_frames);
    free(durations);
    return ok;
}

static bool indexed_palette_animation_load_ballistic_a39c(const char *manifest_path, IndexedPaletteAnimation *out_animation) {
    FILE *file = NULL;
    char line[4096];
    char *resolved_indices_path = NULL;
    char *resolved_helper_cgram_path = NULL;
    char *resolved_ramp_path = NULL;
    uint8_t *indices = NULL;
    uint8_t *helper_cgram = NULL;
    uint16_t *ramp_words = NULL;
    uint32_t *runtime_palette = NULL;
    int *durations = NULL;
    int *class_cgram_indices = NULL;
    size_t ramp_word_count = 0;
    int width = 0;
    int height = 0;
    int class_count = 0;
    int timeline_count = 0;
    int step_frames = 0;
    int dynamic_start = 0;
    int dynamic_count = 0;
    int counter_wrap = 0;
    bool ok = false;

    file = fopen(manifest_path, "r");
    if (!file) {
        fprintf(stderr, "error: failed to open Ballistic callback asset %s: %s\n", manifest_path, strerror(errno));
        return false;
    }

    class_cgram_indices = malloc(256u * sizeof(*class_cgram_indices));
    if (!class_cgram_indices) {
        fprintf(stderr, "error: out of memory preparing Ballistic mapping for %s\n", manifest_path);
        goto cleanup;
    }
    for (int i = 0; i < 256; i++) {
        class_cgram_indices[i] = -1;
    }

    while (fgets(line, sizeof(line), file)) {
        char *token = line;

        while (*token && isspace((unsigned char)*token)) {
            token++;
        }
        if (*token == '\0' || *token == '#' || *token == '\n' || *token == '\r') {
            continue;
        }

        if (strncmp(token, "size ", 5) == 0) {
            int parsed_width = 0;
            int parsed_height = 0;
            if (sscanf(token, "size %d %d", &parsed_width, &parsed_height) != 2 ||
                parsed_width <= 0 || parsed_height <= 0) {
                fprintf(stderr, "error: invalid size line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            width = parsed_width;
            height = parsed_height;
        } else if (strncmp(token, "indices ", 8) == 0) {
            char relative_path[4096];
            if (sscanf(token, "indices %4095s", relative_path) != 1) {
                fprintf(stderr, "error: invalid indices line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            free(resolved_indices_path);
            resolved_indices_path = resolve_manifest_path(manifest_path, relative_path);
            if (!resolved_indices_path) {
                fprintf(stderr, "error: out of memory resolving Ballistic indices path in %s\n", manifest_path);
                goto cleanup;
            }
        } else if (strncmp(token, "helper_cgram ", 13) == 0) {
            char relative_path[4096];
            if (sscanf(token, "helper_cgram %4095s", relative_path) != 1) {
                fprintf(stderr, "error: invalid helper_cgram line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            free(resolved_helper_cgram_path);
            resolved_helper_cgram_path = resolve_manifest_path(manifest_path, relative_path);
            if (!resolved_helper_cgram_path) {
                fprintf(stderr, "error: out of memory resolving Ballistic helper_cgram path in %s\n", manifest_path);
                goto cleanup;
            }
        } else if (strncmp(token, "ramp ", 5) == 0) {
            char relative_path[4096];
            if (sscanf(token, "ramp %4095s", relative_path) != 1) {
                fprintf(stderr, "error: invalid ramp line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            free(resolved_ramp_path);
            resolved_ramp_path = resolve_manifest_path(manifest_path, relative_path);
            if (!resolved_ramp_path) {
                fprintf(stderr, "error: out of memory resolving Ballistic ramp path in %s\n", manifest_path);
                goto cleanup;
            }
        } else if (strncmp(token, "class_count ", 12) == 0) {
            if (sscanf(token, "class_count %d", &class_count) != 1 ||
                class_count <= 0 || class_count > 256) {
                fprintf(stderr, "error: invalid class_count line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "timeline_count ", 15) == 0) {
            if (sscanf(token, "timeline_count %d", &timeline_count) != 1 || timeline_count <= 0) {
                fprintf(stderr, "error: invalid timeline_count line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "step_frames ", 12) == 0) {
            if (sscanf(token, "step_frames %d", &step_frames) != 1 || step_frames <= 0) {
                fprintf(stderr, "error: invalid step_frames line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "dynamic_start ", 14) == 0) {
            if (sscanf(token, "dynamic_start %d", &dynamic_start) != 1 || dynamic_start < 0) {
                fprintf(stderr, "error: invalid dynamic_start line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "dynamic_count ", 14) == 0) {
            if (sscanf(token, "dynamic_count %d", &dynamic_count) != 1 || dynamic_count <= 0) {
                fprintf(stderr, "error: invalid dynamic_count line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "counter_wrap ", 13) == 0) {
            if (sscanf(token, "counter_wrap %d", &counter_wrap) != 1 || counter_wrap < 0) {
                fprintf(stderr, "error: invalid counter_wrap line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
        } else if (strncmp(token, "mapping ", 8) == 0) {
            int class_index = 0;
            int cgram_index = 0;
            if (sscanf(token, "mapping %d %d", &class_index, &cgram_index) != 2 ||
                class_index < 0 || class_index >= 256 || cgram_index < 0 || cgram_index >= 256) {
                fprintf(stderr, "error: invalid mapping line in %s: %s\n", manifest_path, line);
                goto cleanup;
            }
            class_cgram_indices[class_index] = cgram_index;
        } else {
            fprintf(stderr, "error: unknown Ballistic callback directive in %s: %s\n", manifest_path, line);
            goto cleanup;
        }
    }

    if (width <= 0 || height <= 0 || class_count <= 0 || timeline_count <= 0 || step_frames <= 0 ||
        !resolved_indices_path || !resolved_helper_cgram_path || !resolved_ramp_path) {
        fprintf(stderr, "error: incomplete Ballistic callback asset %s\n", manifest_path);
        goto cleanup;
    }

    for (int class_index = 0; class_index < class_count; class_index++) {
        if (class_cgram_indices[class_index] < 0) {
            fprintf(stderr, "error: missing Ballistic mapping for class %d in %s\n", class_index, manifest_path);
            goto cleanup;
        }
    }

    {
        char *indices_data = NULL;
        size_t indices_size = 0;
        if (!read_entire_file(resolved_indices_path, &indices_data, &indices_size)) {
            goto cleanup;
        }
        if (indices_size != ((size_t)width * (size_t)height)) {
            fprintf(
                stderr,
                "error: Ballistic indexed image %s has %zu bytes, expected %zu\n",
                resolved_indices_path,
                indices_size,
                (size_t)width * (size_t)height
            );
            free(indices_data);
            goto cleanup;
        }
        indices = (uint8_t *)indices_data;
    }

    for (size_t pixel_index = 0; pixel_index < ((size_t)width * (size_t)height); pixel_index++) {
        if ((int)indices[pixel_index] >= class_count) {
            fprintf(stderr, "error: Ballistic pixel %zu exceeds class_count in %s\n", pixel_index, manifest_path);
            goto cleanup;
        }
    }

    {
        char *helper_cgram_data = NULL;
        size_t helper_cgram_size = 0;
        if (!read_entire_file(resolved_helper_cgram_path, &helper_cgram_data, &helper_cgram_size)) {
            goto cleanup;
        }
        if (helper_cgram_size != 0x200u) {
            fprintf(stderr, "error: Ballistic helper CGRAM %s has %zu bytes, expected 512\n", resolved_helper_cgram_path, helper_cgram_size);
            free(helper_cgram_data);
            goto cleanup;
        }
        helper_cgram = (uint8_t *)helper_cgram_data;
    }

    {
        char *ramp_data = NULL;
        size_t ramp_size = 0;
        if (!read_entire_file(resolved_ramp_path, &ramp_data, &ramp_size)) {
            goto cleanup;
        }
        if ((ramp_size % 2u) != 0u) {
            fprintf(stderr, "error: Ballistic ramp %s has an odd byte length\n", resolved_ramp_path);
            free(ramp_data);
            goto cleanup;
        }
        ramp_word_count = ramp_size / 2u;
        ramp_words = malloc(ramp_word_count * sizeof(*ramp_words));
        if (!ramp_words) {
            free(ramp_data);
            fprintf(stderr, "error: out of memory loading Ballistic ramp %s\n", resolved_ramp_path);
            goto cleanup;
        }
        for (size_t word_index = 0; word_index < ramp_word_count; word_index++) {
            ramp_words[word_index] = (uint16_t)(uint8_t)ramp_data[word_index * 2u] |
                                     (uint16_t)((uint8_t)ramp_data[(word_index * 2u) + 1u] << 8);
        }
        free(ramp_data);
    }

    if ((counter_wrap + 2 + dynamic_count) > (int)ramp_word_count) {
        fprintf(stderr, "error: Ballistic ramp %s is too short for counter_wrap=%d dynamic_count=%d\n",
                resolved_ramp_path, counter_wrap, dynamic_count);
        goto cleanup;
    }

    durations = malloc((size_t)timeline_count * sizeof(*durations));
    runtime_palette = malloc((size_t)class_count * sizeof(*runtime_palette));
    if (!durations || !runtime_palette) {
        fprintf(stderr, "error: out of memory building Ballistic runtime buffers for %s\n", manifest_path);
        goto cleanup;
    }
    for (int frame_index = 0; frame_index < timeline_count; frame_index++) {
        durations[frame_index] = step_frames;
    }

    indexed_palette_animation_free(out_animation);
    out_animation->loaded = true;
    out_animation->mode = INDEXED_ANIM_MODE_BALLISTIC_A39C;
    out_animation->indices = indices;
    out_animation->width = width;
    out_animation->height = height;
    out_animation->palette_count = class_count;
    out_animation->durations = durations;
    out_animation->frame_count = (size_t)timeline_count;
    out_animation->current_frame = 0u;
    out_animation->frames_remaining = step_frames;
    out_animation->helper_cgram = helper_cgram;
    out_animation->helper_cgram_size = 0x200u;
    out_animation->ramp_words = ramp_words;
    out_animation->ramp_word_count = ramp_word_count;
    out_animation->class_cgram_indices = class_cgram_indices;
    out_animation->dynamic_start = dynamic_start;
    out_animation->dynamic_count = dynamic_count;
    out_animation->counter_wrap = counter_wrap;
    out_animation->step_frames = step_frames;
    out_animation->runtime_palette = runtime_palette;
    if (!indexed_palette_animation_update_runtime_palette(out_animation)) {
        indexed_palette_animation_free(out_animation);
        goto cleanup;
    }

    indices = NULL;
    helper_cgram = NULL;
    ramp_words = NULL;
    class_cgram_indices = NULL;
    durations = NULL;
    runtime_palette = NULL;
    ok = true;

cleanup:
    if (!ok) {
        indexed_palette_animation_free(out_animation);
    }
    if (file) {
        fclose(file);
    }
    free(resolved_indices_path);
    free(resolved_helper_cgram_path);
    free(resolved_ramp_path);
    free(indices);
    free(helper_cgram);
    free(ramp_words);
    free(class_cgram_indices);
    free(durations);
    free(runtime_palette);
    return ok;
}

static bool read_entire_file(const char *path, char **out_data, size_t *out_size) {
    FILE *file = fopen(path, "rb");
    char *data = NULL;
    size_t size = 0;

    if (!file) {
        fprintf(stderr, "error: failed to open %s: %s\n", path, strerror(errno));
        return false;
    }

    if (fseek(file, 0, SEEK_END) != 0) {
        fprintf(stderr, "error: failed to seek %s\n", path);
        fclose(file);
        return false;
    }

    long file_size = ftell(file);
    if (file_size < 0) {
        fprintf(stderr, "error: failed to tell %s\n", path);
        fclose(file);
        return false;
    }

    if (fseek(file, 0, SEEK_SET) != 0) {
        fprintf(stderr, "error: failed to rewind %s\n", path);
        fclose(file);
        return false;
    }

    size = (size_t)file_size;
    data = malloc(size + 1);
    if (!data) {
        fprintf(stderr, "error: out of memory reading %s\n", path);
        fclose(file);
        return false;
    }

    if (size > 0 && fread(data, 1, size, file) != size) {
        fprintf(stderr, "error: failed to read %s\n", path);
        free(data);
        fclose(file);
        return false;
    }

    data[size] = '\0';
    fclose(file);

    *out_data = data;
    *out_size = size;
    return true;
}

static const char *json_find_value_internal(const char *json, const char *key, bool log_errors) {
    char pattern[128];
    const char *cursor = NULL;

    if (snprintf(pattern, sizeof(pattern), "\"%s\"", key) >= (int)sizeof(pattern)) {
        if (log_errors) {
            fprintf(stderr, "error: JSON key too long: %s\n", key);
        }
        return NULL;
    }

    cursor = strstr(json, pattern);
    if (!cursor) {
        if (log_errors) {
            fprintf(stderr, "error: missing JSON key: %s\n", key);
        }
        return NULL;
    }

    cursor += strlen(pattern);
    while (*cursor != '\0' && isspace((unsigned char)*cursor)) {
        cursor++;
    }
    if (*cursor != ':') {
        if (log_errors) {
            fprintf(stderr, "error: malformed JSON entry for key: %s\n", key);
        }
        return NULL;
    }
    cursor++;
    while (*cursor != '\0' && isspace((unsigned char)*cursor)) {
        cursor++;
    }

    return cursor;
}

static const char *json_find_value(const char *json, const char *key) {
    return json_find_value_internal(json, key, true);
}

static bool json_parse_int(const char *json, const char *key, int *out_value) {
    const char *cursor = json_find_value(json, key);
    char *end = NULL;
    long value = 0;

    if (!cursor) {
        return false;
    }

    value = strtol(cursor, &end, 10);
    if (cursor == end) {
        fprintf(stderr, "error: expected integer value for JSON key: %s\n", key);
        return false;
    }

    *out_value = (int)value;
    return true;
}

static bool json_parse_bool(const char *json, const char *key, bool *out_value) {
    const char *cursor = json_find_value(json, key);

    if (!cursor) {
        return false;
    }

    if (strncmp(cursor, "true", 4) == 0) {
        *out_value = true;
        return true;
    }
    if (strncmp(cursor, "false", 5) == 0) {
        *out_value = false;
        return true;
    }

    fprintf(stderr, "error: expected boolean value for JSON key: %s\n", key);
    return false;
}

static bool json_try_parse_int(const char *json, const char *key, int *out_value) {
    const char *cursor = json_find_value_internal(json, key, false);
    char *end = NULL;
    long value = 0;

    if (!cursor) {
        return false;
    }

    value = strtol(cursor, &end, 10);
    if (cursor == end) {
        return false;
    }

    *out_value = (int)value;
    return true;
}

static bool json_try_parse_bool(const char *json, const char *key, bool *out_value) {
    const char *cursor = json_find_value_internal(json, key, false);

    if (!cursor) {
        return false;
    }

    if (strncmp(cursor, "true", 4) == 0) {
        *out_value = true;
        return true;
    }
    if (strncmp(cursor, "false", 5) == 0) {
        *out_value = false;
        return true;
    }

    return false;
}

static bool snes_bg_scene_load_state_json(const char *path, SnesBgScene *scene) {
    char *json = NULL;
    size_t json_size = 0;
    bool ok = false;

    if (!read_entire_file(path, &json, &json_size)) {
        return false;
    }

    if (!json_parse_int(json, "ppu.bgMode", &scene->bg_mode) ||
        !json_parse_int(json, "ppu.mainScreenLayers", &scene->main_screen_layers)) {
        goto cleanup;
    }

    (void)json_try_parse_bool(json, "ppu.mode7.fillWithTile0", &scene->mode7_fill_with_tile0);
    (void)json_try_parse_bool(json, "ppu.mode7.horizontalMirroring", &scene->mode7_horizontal_mirroring);
    (void)json_try_parse_bool(json, "ppu.mode7.verticalMirroring", &scene->mode7_vertical_mirroring);
    (void)json_try_parse_bool(json, "ppu.mode7.largeMap", &scene->mode7_large_map);
    (void)json_try_parse_int(json, "ppu.mode7.centerX", &scene->mode7_center_x);
    (void)json_try_parse_int(json, "ppu.mode7.centerY", &scene->mode7_center_y);
    (void)json_try_parse_int(json, "ppu.mode7.hscroll", &scene->mode7_hscroll);
    (void)json_try_parse_int(json, "ppu.mode7.vscroll", &scene->mode7_vscroll);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[0]", &scene->mode7_matrix[0]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[1]", &scene->mode7_matrix[1]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[2]", &scene->mode7_matrix[2]);
    (void)json_try_parse_int(json, "ppu.mode7.matrix[3]", &scene->mode7_matrix[3]);
    (void)json_try_parse_int(json, "ppu.oamMode", &scene->oam_mode);
    (void)json_try_parse_int(json, "ppu.oamBaseAddress", &scene->oam_base_address);
    (void)json_try_parse_int(json, "ppu.oamAddressOffset", &scene->oam_address_offset);
    (void)json_try_parse_int(json, "ppu.internalOamAddress", &scene->internal_oam_address);
    (void)json_try_parse_bool(json, "ppu.enableOamPriority", &scene->enable_oam_priority);
    (void)json_try_parse_bool(json, "ppu.objInterlace", &scene->obj_interlace);
    (void)json_try_parse_bool(json, "ppu.overscanMode", &scene->overscan_mode);

    for (int layer_index = 0; layer_index < 3; layer_index++) {
        char key[64];
        SnesBgLayerState *layer = &scene->layers[layer_index];

        snprintf(key, sizeof(key), "ppu.layers[%d].tilemapAddress", layer_index);
        if (!json_parse_int(json, key, &layer->tilemap_address)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].chrAddress", layer_index);
        if (!json_parse_int(json, key, &layer->chr_address)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].doubleWidth", layer_index);
        if (!json_parse_bool(json, key, &layer->double_width)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].doubleHeight", layer_index);
        if (!json_parse_bool(json, key, &layer->double_height)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].largeTiles", layer_index);
        if (!json_parse_bool(json, key, &layer->large_tiles)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].hscroll", layer_index);
        if (!json_parse_int(json, key, &layer->hscroll)) {
            goto cleanup;
        }

        snprintf(key, sizeof(key), "ppu.layers[%d].vscroll", layer_index);
        if (!json_parse_int(json, key, &layer->vscroll)) {
            goto cleanup;
        }
    }

    ok = true;

cleanup:
    free(json);
    (void)json_size;
    return ok;
}

static bool snes_bg_scene_load(
    const char *vram_path,
    const char *cgram_path,
    const char *state_path,
    const char *oam_path,
    SnesBgScene *scene
) {
    char *vram_data = NULL;
    size_t vram_size = 0;
    char *cgram_data = NULL;
    size_t cgram_size = 0;
    char *oam_data = NULL;
    size_t oam_size = 0;
    char *derived_oam_path = NULL;
    const char *load_oam_path = oam_path;
    bool ok = false;

    if (!read_entire_file(vram_path, &vram_data, &vram_size)) {
        return false;
    }
    if (!read_entire_file(cgram_path, &cgram_data, &cgram_size)) {
        free(vram_data);
        return false;
    }
    if (vram_size != 0x10000u) {
        fprintf(stderr, "error: expected 65536-byte VRAM dump in %s, got %zu bytes\n", vram_path, vram_size);
        goto cleanup;
    }
    if (cgram_size != 0x0200u) {
        fprintf(stderr, "error: expected 512-byte CGRAM dump in %s, got %zu bytes\n", cgram_path, cgram_size);
        goto cleanup;
    }

    snes_bg_scene_free(scene);
    scene->vram = (uint8_t *)vram_data;
    scene->cgram = (uint8_t *)cgram_data;
    scene->vram_size = vram_size;
    scene->cgram_size = cgram_size;
    vram_data = NULL;
    cgram_data = NULL;

    if (!load_oam_path) {
        derived_oam_path = resolve_sibling_path(vram_path, "oam.bin");
        if (derived_oam_path && path_exists(derived_oam_path)) {
            load_oam_path = derived_oam_path;
        }
    }

    if (load_oam_path) {
        if (!read_entire_file(load_oam_path, &oam_data, &oam_size)) {
            if (oam_path) {
                goto cleanup;
            }
            oam_data = NULL;
            oam_size = 0;
        } else if (oam_size != 0x0220u) {
            fprintf(stderr, "error: expected 544-byte OAM dump in %s, got %zu bytes\n", load_oam_path, oam_size);
            goto cleanup;
        } else {
            scene->oam = (uint8_t *)oam_data;
            scene->oam_size = oam_size;
            oam_data = NULL;
        }
    }

    if (!snes_bg_scene_load_state_json(state_path, scene)) {
        goto cleanup;
    }

    for (size_t i = 0; i < 256; i++) {
        size_t offset = i * 2u;
        uint16_t value = (uint16_t)scene->cgram[offset] | (uint16_t)(scene->cgram[offset + 1u] << 8);
        uint8_t red = (uint8_t)(value & 0x1fu);
        uint8_t green = (uint8_t)((value >> 5) & 0x1fu);
        uint8_t blue = (uint8_t)((value >> 10) & 0x1fu);
        uint8_t rgb_red = (uint8_t)((red << 3) | (red >> 2));
        uint8_t rgb_green = (uint8_t)((green << 3) | (green >> 2));
        uint8_t rgb_blue = (uint8_t)((blue << 3) | (blue >> 2));

        scene->cgram_colors[i] = 0xff000000u |
                                 ((uint32_t)rgb_red << 16) |
                                 ((uint32_t)rgb_green << 8) |
                                 (uint32_t)rgb_blue;
    }

    memset(scene->tile_cache_valid, 0, sizeof(scene->tile_cache_valid));
    scene->loaded = true;
    ok = true;

cleanup:
    if (!ok) {
        snes_bg_scene_free(scene);
    }
    free(vram_data);
    free(cgram_data);
    free(oam_data);
    free(derived_oam_path);
    return ok;
}

static void app_clear_content(AppState *app) {
    snes_bg_scene_free(&app->snes_bg_scene);
    indexed_palette_animation_free(&app->indexed_anim);
    image_data_free(&app->image);
    app->image_offset_x = 0;
    app->image_offset_y = 0;
}

static bool app_load_snes_bg_scene(
    AppState *app,
    const char *vram_path,
    const char *cgram_path,
    const char *state_path,
    const char *oam_path
) {
    app_clear_content(app);
    return snes_bg_scene_load(vram_path, cgram_path, state_path, oam_path, &app->snes_bg_scene);
}

static bool app_load_image_view(AppState *app, const char *image_path) {
    app_clear_content(app);
    return image_data_load_ppm(image_path, &app->image);
}

static bool app_load_indexed_animation(AppState *app, const char *manifest_path) {
    app_clear_content(app);
    return indexed_palette_animation_load(manifest_path, &app->indexed_anim);
}

static bool app_load_ballistic_a39c(AppState *app, const char *manifest_path) {
    app_clear_content(app);
    return indexed_palette_animation_load_ballistic_a39c(manifest_path, &app->indexed_anim);
}

static bool scene_sequence_load_manifest(const char *path, SceneSequence *sequence) {
    FILE *file = NULL;
    char line[4096];
    SceneSequenceEntry *entries = NULL;
    size_t count = 0;
    size_t capacity = 0;
    bool ok = false;

    file = fopen(path, "r");
    if (!file) {
        fprintf(stderr, "error: failed to open sequence manifest %s: %s\n", path, strerror(errno));
        return false;
    }

    while (fgets(line, sizeof(line), file)) {
        char kind[32];
        char first[2048];
        char second[2048];
        char third[2048];
        char fourth[2048];
        long duration = 0;
        int fields = 0;

        if (line[0] == '#' || line[0] == '\n' || line[0] == '\r') {
            continue;
        }

        memset(kind, 0, sizeof(kind));
        memset(first, 0, sizeof(first));
        memset(second, 0, sizeof(second));
        memset(third, 0, sizeof(third));
        memset(fourth, 0, sizeof(fourth));
        fields = sscanf(line, "%31s %ld %2047s %2047s %2047s %2047s", kind, &duration, first, second, third, fourth);
        if (fields < 3) {
            fprintf(stderr, "error: malformed sequence line in %s: %s\n", path, line);
            goto cleanup;
        }
        if (duration <= 0) {
            fprintf(stderr, "error: invalid sequence duration in %s: %s\n", path, line);
            goto cleanup;
        }

        if (count == capacity) {
            size_t next_capacity = capacity == 0 ? 8u : capacity * 2u;
            SceneSequenceEntry *next_entries = realloc(entries, next_capacity * sizeof(*entries));
            if (!next_entries) {
                fprintf(stderr, "error: out of memory growing sequence entries for %s\n", path);
                goto cleanup;
            }
            entries = next_entries;
            capacity = next_capacity;
        }

        memset(&entries[count], 0, sizeof(entries[count]));
        entries[count].duration_frames = (int)duration;

        if (strcmp(kind, "snes_bg") == 0) {
            if (fields != 5 && fields != 6) {
                fprintf(stderr, "error: snes_bg entries require duration, vram, cgram, state, and optional oam in %s\n", path);
                goto cleanup;
            }
            entries[count].type = SEQUENCE_ENTRY_SNES_BG;
            entries[count].primary_path = resolve_manifest_path(path, first);
            entries[count].secondary_path = resolve_manifest_path(path, second);
            entries[count].tertiary_path = resolve_manifest_path(path, third);
            if (fields == 6) {
                entries[count].quaternary_path = resolve_manifest_path(path, fourth);
            }
        } else if (strcmp(kind, "indexed_anim") == 0) {
            if (fields != 3) {
                fprintf(stderr, "error: indexed_anim entries require duration and clip path in %s\n", path);
                goto cleanup;
            }
            entries[count].type = SEQUENCE_ENTRY_INDEXED_ANIM;
            entries[count].primary_path = resolve_manifest_path(path, first);
        } else if (strcmp(kind, "ballistic_a39c") == 0) {
            if (fields != 3) {
                fprintf(stderr, "error: ballistic_a39c entries require duration and asset path in %s\n", path);
                goto cleanup;
            }
            entries[count].type = SEQUENCE_ENTRY_BALLISTIC_A39C;
            entries[count].primary_path = resolve_manifest_path(path, first);
        } else if (strcmp(kind, "image") == 0) {
            entries[count].type = SEQUENCE_ENTRY_IMAGE;
            entries[count].primary_path = resolve_manifest_path(path, first);
        } else {
            fprintf(stderr, "error: unknown sequence entry type '%s' in %s\n", kind, path);
            goto cleanup;
        }

        if (!entries[count].primary_path ||
            (entries[count].type == SEQUENCE_ENTRY_SNES_BG &&
             (!entries[count].secondary_path || !entries[count].tertiary_path ||
              (fields == 6 && !entries[count].quaternary_path)))) {
            fprintf(stderr, "error: out of memory resolving sequence paths in %s\n", path);
            goto cleanup;
        }

        count++;
    }

    scene_sequence_free(sequence);
    sequence->entries = entries;
    sequence->count = count;
    sequence->loaded = count > 0u;
    sequence->loop = true;
    sequence->current_index = 0u;
    sequence->frames_remaining = 0;
    entries = NULL;
    ok = true;

cleanup:
    free(entries);
    if (file) {
        fclose(file);
    }
    return ok;
}

static int scene_sequence_total_frames(const SceneSequence *sequence) {
    int total = 0;

    for (size_t i = 0; i < sequence->count; i++) {
        total += sequence->entries[i].duration_frames;
    }

    return total;
}

static bool app_sequence_apply_entry(AppState *app, size_t index) {
    const SceneSequenceEntry *entry = NULL;

    if (!app->sequence.loaded || index >= app->sequence.count) {
        return false;
    }

    entry = &app->sequence.entries[index];
    if (entry->type == SEQUENCE_ENTRY_SNES_BG) {
        if (!app_load_snes_bg_scene(
                app,
                entry->primary_path,
                entry->secondary_path,
                entry->tertiary_path,
                entry->quaternary_path)) {
            return false;
        }
    } else if (entry->type == SEQUENCE_ENTRY_INDEXED_ANIM) {
        if (!app_load_indexed_animation(app, entry->primary_path)) {
            return false;
        }
    } else if (entry->type == SEQUENCE_ENTRY_BALLISTIC_A39C) {
        if (!app_load_ballistic_a39c(app, entry->primary_path)) {
            return false;
        }
    } else if (entry->type == SEQUENCE_ENTRY_IMAGE) {
        if (!app_load_image_view(app, entry->primary_path)) {
            return false;
        }
    } else {
        fprintf(stderr, "error: unsupported sequence entry type %d\n", (int)entry->type);
        return false;
    }

    app->sequence.current_index = index;
    app->sequence.frames_remaining = entry->duration_frames;
    return true;
}

static uint8_t lerp_channel(uint8_t left, uint8_t right, float t) {
    float value = ((float)left * (1.0f - t)) + ((float)right * t);
    if (value < 0.0f) {
        value = 0.0f;
    } else if (value > 255.0f) {
        value = 255.0f;
    }

    return (uint8_t)(value + 0.5f);
}

static uint32_t mix_argb(uint32_t left, uint32_t right, float t) {
    uint8_t lr = (uint8_t)((left >> 16) & 0xffu);
    uint8_t lg = (uint8_t)((left >> 8) & 0xffu);
    uint8_t lb = (uint8_t)(left & 0xffu);
    uint8_t rr = (uint8_t)((right >> 16) & 0xffu);
    uint8_t rg = (uint8_t)((right >> 8) & 0xffu);
    uint8_t rb = (uint8_t)(right & 0xffu);

    return 0xff000000u |
           ((uint32_t)lerp_channel(lr, rr, t) << 16) |
           ((uint32_t)lerp_channel(lg, rg, t) << 8) |
           (uint32_t)lerp_channel(lb, rb, t);
}

static uint32_t scale_argb(uint32_t color, float factor) {
    uint8_t r = (uint8_t)((color >> 16) & 0xffu);
    uint8_t g = (uint8_t)((color >> 8) & 0xffu);
    uint8_t b = (uint8_t)(color & 0xffu);
    uint8_t scaled_r = (uint8_t)(((float)r * factor) > 255.0f ? 255.0f : ((float)r * factor));
    uint8_t scaled_g = (uint8_t)(((float)g * factor) > 255.0f ? 255.0f : ((float)g * factor));
    uint8_t scaled_b = (uint8_t)(((float)b * factor) > 255.0f ? 255.0f : ((float)b * factor));

    return 0xff000000u | ((uint32_t)scaled_r << 16) | ((uint32_t)scaled_g << 8) | (uint32_t)scaled_b;
}

static bool palette_bank_load_json(const char *path, PaletteBank *out_bank) {
    char *buffer = NULL;
    size_t buffer_size = 0;
    long *values = NULL;
    size_t value_count = 0;
    size_t value_capacity = 0;
    bool ok = false;

    if (!read_entire_file(path, &buffer, &buffer_size)) {
        return false;
    }

    value_capacity = (buffer_size / 2u) + 1u;
    values = malloc(value_capacity * sizeof(*values));
    if (!values) {
        fprintf(stderr, "error: out of memory parsing %s\n", path);
        goto cleanup;
    }

    for (char *cursor = buffer; *cursor != '\0';) {
        if (!isdigit((unsigned char)*cursor)) {
            cursor++;
            continue;
        }

        char *end = NULL;
        long value = strtol(cursor, &end, 10);
        if (cursor == end) {
            cursor++;
            continue;
        }

        if (value_count == value_capacity) {
            size_t next_capacity = value_capacity * 2u;
            long *next_values = realloc(values, next_capacity * sizeof(*values));
            if (!next_values) {
                fprintf(stderr, "error: out of memory growing parse buffer for %s\n", path);
                goto cleanup;
            }

            values = next_values;
            value_capacity = next_capacity;
        }

        values[value_count++] = value;
        cursor = end;
    }

    if (value_count == 0 || (value_count % (COLORS_PER_PALETTE * 3u)) != 0u) {
        fprintf(stderr, "error: %s does not look like a palette JSON array\n", path);
        goto cleanup;
    }

    size_t color_count = value_count / 3u;
    uint32_t *colors = malloc(color_count * sizeof(*colors));
    if (!colors) {
        fprintf(stderr, "error: out of memory creating palette bank for %s\n", path);
        goto cleanup;
    }

    for (size_t i = 0; i < color_count; i++) {
        long r = values[(i * 3u) + 0u];
        long g = values[(i * 3u) + 1u];
        long b = values[(i * 3u) + 2u];

        if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
            fprintf(stderr, "error: invalid RGB triple in %s at color %zu\n", path, i);
            free(colors);
            goto cleanup;
        }

        colors[i] = 0xff000000u |
                    ((uint32_t)r << 16) |
                    ((uint32_t)g << 8) |
                    (uint32_t)b;
    }

    palette_bank_free(out_bank);
    out_bank->colors = colors;
    out_bank->palette_count = color_count / COLORS_PER_PALETTE;
    ok = true;

cleanup:
    free(values);
    free(buffer);
    return ok;
}

static int snes_bg_bpp(int bg_mode, int layer_index) {
    switch (bg_mode) {
        case 0:
            return 2;
        case 1:
            return layer_index == 2 ? 2 : 4;
        case 2:
            return 4;
        case 3:
            return layer_index == 0 ? 8 : 4;
        case 4:
            return layer_index == 0 ? 8 : 2;
        case 5:
            return layer_index == 0 ? 4 : 2;
        case 6:
            return layer_index == 0 ? 4 : 0;
        default:
            return 0;
    }
}

static bool snes_layer_enabled(int layer_mask, int layer_index) {
    return (layer_mask & (1 << layer_index)) != 0;
}

static int snes_normalize_scroll(int value) {
    value &= 0x03ff;
    return value == 0x03ff ? 0 : value;
}

static int snes_sign_extend(int value, int bits) {
    int sign_bit = 1 << (bits - 1);
    int full_range = 1 << bits;
    int masked = value & (full_range - 1);

    return (masked & sign_bit) ? (masked - full_range) : masked;
}

static void snes_bg_tilemap_size(const SnesBgLayerState *layer, int *out_width_tiles, int *out_height_tiles) {
    *out_width_tiles = layer->double_width ? 64 : 32;
    *out_height_tiles = layer->double_height ? 64 : 32;
}

static uint16_t snes_bg_read_tilemap_entry(const SnesBgScene *scene, int base_word, int width_tiles, int tile_x, int tile_y) {
    int block_x = 0;
    int block_y = 0;
    int local_x = 0;
    int local_y = 0;
    size_t entry_offset = 0;

    if (width_tiles <= 0) {
        return 0;
    }

    tile_x %= width_tiles;
    if (tile_x < 0) {
        tile_x += width_tiles;
    }

    block_x = tile_x / 32;
    block_y = tile_y / 32;
    local_x = tile_x % 32;
    local_y = tile_y % 32;
    entry_offset = (size_t)(base_word + (block_x * 0x0400) + (block_y * 0x0800) + (local_y * 32) + local_x) * 2u;

    if ((entry_offset + 1u) >= scene->vram_size) {
        return 0;
    }

    return (uint16_t)scene->vram[entry_offset] | (uint16_t)(scene->vram[entry_offset + 1u] << 8);
}

static uint16_t snes_vram_read_word(const SnesBgScene *scene, int word_index) {
    size_t byte_offset = (size_t)word_index * 2u;

    if (word_index < 0 || (byte_offset + 1u) >= scene->vram_size) {
        return 0;
    }

    return (uint16_t)scene->vram[byte_offset] | (uint16_t)(scene->vram[byte_offset + 1u] << 8);
}

static void snes_decode_tile(const uint8_t *tile_data, int bpp, uint8_t *out_pixels) {
    for (int y = 0; y < 8; y++) {
        for (int x = 0; x < 8; x++) {
            int bit = 7 - x;
            uint8_t color = 0;

            for (int plane_pair = 0; plane_pair < bpp; plane_pair += 2) {
                int pair_offset = (plane_pair / 2) * 16;
                uint8_t plane0 = tile_data[pair_offset + (y * 2)];
                uint8_t plane1 = tile_data[pair_offset + (y * 2) + 1];

                color |= (uint8_t)(((plane0 >> bit) & 1u) << plane_pair);
                color |= (uint8_t)(((plane1 >> bit) & 1u) << (plane_pair + 1));
            }

            out_pixels[(y * 8) + x] = color;
        }
    }
}

static const uint8_t *snes_bg_get_tile_pixels(SnesBgScene *scene, int layer_index, int tile_index, int bpp) {
    SnesBgLayerState *layer = &scene->layers[layer_index];
    size_t tile_size = (size_t)bpp * 8u;
    size_t start = ((size_t)layer->chr_address * 2u) + ((size_t)tile_index * tile_size);

    if (tile_index < 0 || tile_index >= 1024) {
        return NULL;
    }

    if (!scene->tile_cache_valid[layer_index][tile_index]) {
        if ((start + tile_size) > scene->vram_size) {
            memset(scene->tile_cache[layer_index][tile_index], 0, 64u);
        } else {
            snes_decode_tile(&scene->vram[start], bpp, scene->tile_cache[layer_index][tile_index]);
        }
        scene->tile_cache_valid[layer_index][tile_index] = 1u;
    }

    return scene->tile_cache[layer_index][tile_index];
}

static int snes_mode7_clip(int value) {
    return (value & 0x2000) ? (value | ~0x03ff) : (value & 0x03ff);
}

static void render_snes_mode7_scene(AppState *app) {
    const SnesBgScene *scene = &app->snes_bg_scene;
    int hscroll = snes_sign_extend(scene->mode7_hscroll, 13);
    int vscroll = snes_sign_extend(scene->mode7_vscroll, 13);
    int center_x = snes_sign_extend(scene->mode7_center_x, 13);
    int center_y = snes_sign_extend(scene->mode7_center_y, 13);
    int matrix_a = snes_sign_extend(scene->mode7_matrix[0], 16);
    int matrix_b = snes_sign_extend(scene->mode7_matrix[1], 16);
    int matrix_c = snes_sign_extend(scene->mode7_matrix[2], 16);
    int matrix_d = snes_sign_extend(scene->mode7_matrix[3], 16);

    for (int screen_y = 0; screen_y < SCREEN_HEIGHT; screen_y++) {
        int real_y = scene->mode7_vertical_mirroring ? (255 - screen_y) : screen_y;
        int x_value = (((matrix_a * snes_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_b * real_y) & ~63) +
                       ((matrix_b * snes_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_x << 8));
        int y_value = (((matrix_c * snes_mode7_clip(hscroll - center_x)) & ~63) +
                       ((matrix_d * real_y) & ~63) +
                       ((matrix_d * snes_mode7_clip(vscroll - center_y)) & ~63) +
                       (center_y << 8));
        int x_step = matrix_a;
        int y_step = matrix_c;

        if (scene->mode7_horizontal_mirroring) {
            x_value += x_step * (SCREEN_WIDTH - 1);
            y_value += y_step * (SCREEN_WIDTH - 1);
            x_step = -x_step;
            y_step = -y_step;
        }

        for (int screen_x = 0; screen_x < SCREEN_WIDTH; screen_x++) {
            int x_offset = x_value >> 8;
            int y_offset = y_value >> 8;
            uint8_t tile_index = 0;
            int pixel_word_index = 0;
            int color_index = 0;

            x_value += x_step;
            y_value += y_step;

            if (!scene->mode7_large_map) {
                x_offset &= 0x03ff;
                y_offset &= 0x03ff;
            } else if (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff) {
                if (!scene->mode7_fill_with_tile0) {
                    continue;
                }
            }

            if (!(scene->mode7_large_map && (x_offset < 0 || x_offset > 0x03ff || y_offset < 0 || y_offset > 0x03ff))) {
                int tile_word_index = ((y_offset & ~0x07) << 4) | (x_offset >> 3);
                tile_index = (uint8_t)(snes_vram_read_word(scene, tile_word_index) & 0x00ffu);
            }

            pixel_word_index = (tile_index << 6) + ((y_offset & 0x07) << 3) + (x_offset & 0x07);
            color_index = (int)((snes_vram_read_word(scene, pixel_word_index) >> 8) & 0x00ffu);
            if (color_index == 0 || color_index >= 256) {
                continue;
            }

            app->framebuffer[(screen_y * SCREEN_WIDTH) + screen_x] = scene->cgram_colors[color_index];
        }
    }
}

static uint8_t snes_decode_4bpp_tile_pixel(const SnesBgScene *scene, size_t tile_start, int pixel_x, int pixel_y) {
    size_t row_start = tile_start + (size_t)(pixel_y * 2);
    int bit = 7 - pixel_x;
    uint8_t plane0 = 0;
    uint8_t plane1 = 0;
    uint8_t plane2 = 0;
    uint8_t plane3 = 0;

    if ((row_start + 17u) >= scene->vram_size) {
        return 0;
    }

    plane0 = (uint8_t)((scene->vram[row_start] >> bit) & 1u);
    plane1 = (uint8_t)((scene->vram[row_start + 1u] >> bit) & 1u);
    plane2 = (uint8_t)((scene->vram[row_start + 16u] >> bit) & 1u);
    plane3 = (uint8_t)((scene->vram[row_start + 17u] >> bit) & 1u);
    return (uint8_t)(plane0 | (plane1 << 1) | (plane2 << 2) | (plane3 << 3));
}

static void render_snes_objects(AppState *app, int priority_mask) {
    const SnesBgScene *scene = &app->snes_bg_scene;
    int oam_mode = scene->oam_mode & 0x07;
    int scanline_count = scene->overscan_mode ? 239 : 224;
    int start_index = scene->enable_oam_priority ? ((scene->internal_oam_address & 0x01fcu) >> 2) : 0;

    if (!scene->oam || scene->oam_size < 0x220u) {
        return;
    }

    for (int i = 0; i < 128; i++) {
        int sprite_index = start_index - i - 1;
        int addr = 0;
        int high_table_offset = 0;
        int shift = 0;
        int high_table_value = 0;
        int large_sprite = 0;
        int width_tiles = 0;
        int height_tiles = 0;
        int width = 0;
        int height = 0;
        int sprite_x = 0;
        int sprite_y = 0;
        int tile_index_base = 0;
        int flags = 0;
        int raw_priority = 0;
        int palette_index = 0;
        bool horizontal_mirror = false;
        bool vertical_mirror = false;
        bool use_second_table = false;
        int tile_row = 0;
        int tile_column = 0;

        if (sprite_index < 0) {
            sprite_index += 128;
        }

        addr = (sprite_index * 4) & 0x1ff;
        high_table_offset = addr >> 4;
        shift = ((addr >> 2) & 0x03) << 1;
        high_table_value = (scene->oam[0x200 + high_table_offset] >> shift) & 0x03;
        large_sprite = (high_table_value & 0x02) >> 1;
        width_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][0];
        height_tiles = OAM_SIZE_TABLE[oam_mode][large_sprite][1];
        width = width_tiles << 3;
        height = height_tiles << 3;
        sprite_x = (((((high_table_value & 0x01) << 8) | scene->oam[addr]) << 7) & 0xffff);
        if (sprite_x & 0x8000) {
            sprite_x -= 0x10000;
        }
        sprite_x >>= 7;
        sprite_y = scene->oam[addr + 1];
        tile_index_base = scene->oam[addr + 2];
        flags = scene->oam[addr + 3];

        if ((sprite_x + width) <= 0 || sprite_x > 255) {
            continue;
        }

        {
            int end_y = sprite_y + (scene->obj_interlace ? (height >> 1) : height);
            if ((end_y >= scanline_count || end_y == 256) && sprite_y >= scanline_count) {
                continue;
            }
        }

        raw_priority = (flags >> 4) & 0x03;
        if (priority_mask >= 0 && ((priority_mask & (1 << raw_priority)) == 0)) {
            continue;
        }

        use_second_table = (flags & 0x01) != 0;
        palette_index = ((flags >> 1) & 0x07) + 8;
        horizontal_mirror = (flags & 0x40) != 0;
        vertical_mirror = (flags & 0x80) != 0;
        tile_row = (tile_index_base & 0xf0) >> 4;
        tile_column = tile_index_base & 0x0f;

        for (int y = 0; y < height; y++) {
            int pixel_y = 0;
            int row_offset = 0;
            int y_pos = 0;

            if (vertical_mirror) {
                int pos = y < width ? (width - 1 - y) : (width * 3 - 1 - y);
                pixel_y = pos & 0x07;
                row_offset = pos >> 3;
            } else {
                pixel_y = y & 0x07;
                row_offset = y >> 3;
            }

            y_pos = sprite_y + y;
            if (y_pos >= scanline_count) {
                y_pos -= scanline_count;
            }
            if (y_pos < 0 || y_pos >= SCREEN_HEIGHT) {
                continue;
            }

            for (int x = 0; x < width; x++) {
                int pixel_x = 0;
                int column_offset = 0;
                int x_pos = sprite_x + x;
                int column = 0;
                int row = 0;
                int tile_index = 0;
                size_t tile_start = 0;
                uint8_t color_index = 0;
                int cgram_index = 0;

                if (horizontal_mirror) {
                    pixel_x = (width - x - 1) & 0x07;
                    column_offset = (width - x - 1) >> 3;
                } else {
                    pixel_x = x & 0x07;
                    column_offset = x >> 3;
                }

                if (x_pos < 0 || x_pos >= SCREEN_WIDTH) {
                    continue;
                }

                row = (tile_row + row_offset) & 0x0f;
                column = (tile_column + column_offset) & 0x0f;
                tile_index = (row << 4) | column;
                tile_start = (size_t)(((scene->oam_base_address +
                                        (tile_index << 4) +
                                        (use_second_table ? scene->oam_address_offset : 0)) & 0x7fff) << 1);
                color_index = snes_decode_4bpp_tile_pixel(scene, tile_start, pixel_x, pixel_y);
                if (color_index == 0) {
                    continue;
                }

                cgram_index = (palette_index * 16) + color_index;
                if (cgram_index >= 256) {
                    continue;
                }

                app->framebuffer[(y_pos * SCREEN_WIDTH) + x_pos] = scene->cgram_colors[cgram_index];
            }
        }
    }
}

static void render_snes_bg_scene(AppState *app) {
    SnesBgScene *scene = &app->snes_bg_scene;
    uint32_t backdrop = scene->cgram_colors[0];

    for (int i = 0; i < (SCREEN_WIDTH * SCREEN_HEIGHT); i++) {
        app->framebuffer[i] = backdrop;
    }

    if (scene->bg_mode == 7) {
        if (snes_layer_enabled(scene->main_screen_layers, 0)) {
            render_snes_mode7_scene(app);
        }
        if (snes_layer_enabled(scene->main_screen_layers, 4)) {
            render_snes_objects(app, (1 << 1) | (1 << 2) | (1 << 3));
        }
        return;
    }

    for (int layer_index = 2; layer_index >= 0; layer_index--) {
        SnesBgLayerState *layer = &scene->layers[layer_index];
        int bpp = snes_bg_bpp(scene->bg_mode, layer_index);
        int width_tiles = 0;
        int height_tiles = 0;
        int palette_stride = 0;
        int hscroll = 0;
        int vscroll = 0;

        if (!snes_layer_enabled(scene->main_screen_layers, layer_index) || bpp == 0) {
            continue;
        }

        snes_bg_tilemap_size(layer, &width_tiles, &height_tiles);
        palette_stride = bpp == 2 ? 4 : (bpp == 4 ? 16 : 256);
        hscroll = snes_normalize_scroll(layer->hscroll);
        vscroll = snes_normalize_scroll(layer->vscroll);

        for (int screen_y = 0; screen_y < SCREEN_HEIGHT; screen_y++) {
            int world_y = (screen_y + vscroll) % (height_tiles * 8);
            int tile_y = world_y / 8;
            int pixel_y = world_y & 7;

            for (int screen_x = 0; screen_x < SCREEN_WIDTH; screen_x++) {
                int world_x = (screen_x + hscroll) % (width_tiles * 8);
                int tile_x = world_x / 8;
                int pixel_x = world_x & 7;
                uint16_t entry = snes_bg_read_tilemap_entry(scene, layer->tilemap_address, width_tiles, tile_x, tile_y);
                int tile_index = entry & 0x03ff;
                int palette_index = (entry >> 10) & 0x07;
                bool hflip = (entry & 0x4000u) != 0;
                bool vflip = (entry & 0x8000u) != 0;
                const uint8_t *pixels = snes_bg_get_tile_pixels(scene, layer_index, tile_index, bpp);
                int sample_x = hflip ? (7 - pixel_x) : pixel_x;
                int sample_y = vflip ? (7 - pixel_y) : pixel_y;
                uint8_t color_index = 0;
                int cgram_index = 0;

                if (!pixels) {
                    continue;
                }

                color_index = pixels[(sample_y * 8) + sample_x];
                if (color_index == 0) {
                    continue;
                }

                cgram_index = bpp == 8 ? color_index : ((palette_index * palette_stride) + color_index);
                if (cgram_index < 0 || cgram_index >= 256) {
                    continue;
                }

                app->framebuffer[(screen_y * SCREEN_WIDTH) + screen_x] = scene->cgram_colors[cgram_index];
            }
        }
    }

    if (snes_layer_enabled(scene->main_screen_layers, 4)) {
        render_snes_objects(app, -1);
    }
}

static void indexed_palette_animation_step(IndexedPaletteAnimation *animation) {
    bool advanced = false;

    if (!animation->loaded || animation->frame_count == 0) {
        return;
    }

    if (animation->frames_remaining <= 0) {
        size_t next_frame = animation->current_frame + 1u;
        if (next_frame >= animation->frame_count) {
            return;
        }
        animation->current_frame = next_frame;
        animation->frames_remaining = animation->durations[next_frame];
        advanced = true;
    }

    if (animation->frames_remaining > 0) {
        animation->frames_remaining--;
    }

    if (advanced && animation->mode == INDEXED_ANIM_MODE_BALLISTIC_A39C) {
        indexed_palette_animation_update_runtime_palette(animation);
    }
}

static void render_indexed_palette_animation(AppState *app) {
    const IndexedPaletteAnimation *animation = &app->indexed_anim;
    const uint32_t *palette = NULL;
    int src_x = 0;
    int src_y = 0;
    int dest_x = 0;
    int dest_y = 0;
    int visible_width = 0;
    int visible_height = 0;

    for (int i = 0; i < (SCREEN_WIDTH * SCREEN_HEIGHT); i++) {
        app->framebuffer[i] = 0xff000000u;
    }

    if (!animation->loaded || !animation->indices || animation->frame_count == 0) {
        return;
    }

    if (animation->mode == INDEXED_ANIM_MODE_BALLISTIC_A39C) {
        if (!animation->runtime_palette) {
            return;
        }
        palette = animation->runtime_palette;
    } else {
        if (!animation->palette_frames) {
            return;
        }
        palette = &animation->palette_frames[animation->current_frame * (size_t)animation->palette_count];
    }
    src_x = animation->width > SCREEN_WIDTH ? (animation->width - SCREEN_WIDTH) / 2 : 0;
    src_y = animation->height > SCREEN_HEIGHT ? (animation->height - SCREEN_HEIGHT) / 2 : 0;
    dest_x = animation->width < SCREEN_WIDTH ? (SCREEN_WIDTH - animation->width) / 2 : 0;
    dest_y = animation->height < SCREEN_HEIGHT ? (SCREEN_HEIGHT - animation->height) / 2 : 0;
    visible_width = animation->width < SCREEN_WIDTH ? animation->width : SCREEN_WIDTH;
    visible_height = animation->height < SCREEN_HEIGHT ? animation->height : SCREEN_HEIGHT;

    for (int y = 0; y < visible_height; y++) {
        for (int x = 0; x < visible_width; x++) {
            uint8_t class_index = animation->indices[(size_t)(src_y + y) * (size_t)animation->width + (size_t)(src_x + x)];
            if ((int)class_index >= animation->palette_count) {
                continue;
            }
            app->framebuffer[(size_t)(dest_y + y) * SCREEN_WIDTH + (size_t)(dest_x + x)] = palette[class_index];
        }
    }
}

static const uint32_t *app_current_palette(const AppState *app) {
    static const uint32_t fallback[COLORS_PER_PALETTE] = {
        0xff0b1320u, 0xff102542u, 0xff1b3b6fu, 0xff26508cu,
        0xff3b679eu, 0xff4f7cacu, 0xff6797bbu, 0xff89b0d0u,
        0xffa8c8d8u, 0xffcedebcu, 0xffe0d7a8u, 0xffd8b36au,
        0xffbf7c52u, 0xff8d4f42u, 0xff5b2f33u, 0xff24191fu
    };

    if (app->palette_bank.palette_count == 0) {
        return fallback;
    }

    size_t index = app->current_palette % app->palette_bank.palette_count;
    return &app->palette_bank.colors[index * COLORS_PER_PALETTE];
}

static void update_window_title(SDL_Window *window, const AppState *app) {
    char title[160];

    if (app->sequence.loaded) {
        snprintf(
            title,
            sizeof(title),
            "TD2 Port Skeleton | sequence %zu/%zu | remaining %d",
            app->sequence.current_index + 1u,
            app->sequence.count,
            app->sequence.frames_remaining
        );
    } else if (app->snes_bg_scene.loaded) {
        snprintf(
            title,
            sizeof(title),
            "TD2 Port Skeleton | SNES BG mode %d | layers 0x%02X",
            app->snes_bg_scene.bg_mode,
            app->snes_bg_scene.main_screen_layers
        );
    } else if (app->indexed_anim.loaded) {
        snprintf(
            title,
            sizeof(title),
            "TD2 Port Skeleton | indexed anim %zu/%zu | remaining %d",
            app->indexed_anim.current_frame + 1u,
            app->indexed_anim.frame_count,
            app->indexed_anim.frames_remaining
        );
    } else if (app->image.pixels) {
        snprintf(
            title,
            sizeof(title),
            "TD2 Port Skeleton | image %dx%d | offset %d,%d",
            app->image.width,
            app->image.height,
            app->image_offset_x,
            app->image_offset_y
        );
    } else if (app->palette_bank.palette_count == 0) {
        snprintf(title, sizeof(title), "TD2 Port Skeleton | 256x224 @ 60 Hz | fallback palette");
    } else {
        snprintf(
            title,
            sizeof(title),
            "TD2 Port Skeleton | 256x224 @ 60 Hz | palette %zu/%zu",
            (app->current_palette % app->palette_bank.palette_count) + 1u,
            app->palette_bank.palette_count
        );
    }

    SDL_SetWindowTitle(window, title);
}

static void render_image_view(AppState *app) {
    for (int i = 0; i < (SCREEN_WIDTH * SCREEN_HEIGHT); i++) {
        app->framebuffer[i] = 0xff101010u;
    }

    if (!app->image.pixels) {
        return;
    }

    int src_x = app->image.width > SCREEN_WIDTH ? app->image_offset_x : 0;
    int src_y = app->image.height > SCREEN_HEIGHT ? app->image_offset_y : 0;
    int dest_x = app->image.width < SCREEN_WIDTH ? (SCREEN_WIDTH - app->image.width) / 2 : 0;
    int dest_y = app->image.height < SCREEN_HEIGHT ? (SCREEN_HEIGHT - app->image.height) / 2 : 0;
    int visible_width = app->image.width < SCREEN_WIDTH ? app->image.width : SCREEN_WIDTH;
    int visible_height = app->image.height < SCREEN_HEIGHT ? app->image.height : SCREEN_HEIGHT;

    if (src_x < 0) {
        src_x = 0;
    }
    if (src_y < 0) {
        src_y = 0;
    }
    if ((src_x + visible_width) > app->image.width) {
        visible_width = app->image.width - src_x;
    }
    if ((src_y + visible_height) > app->image.height) {
        visible_height = app->image.height - src_y;
    }

    for (int y = 0; y < visible_height; y++) {
        for (int x = 0; x < visible_width; x++) {
            size_t src_index = (size_t)((src_y + y) * app->image.width + (src_x + x)) * 3u;
            uint32_t color = 0xff000000u |
                             ((uint32_t)app->image.pixels[src_index + 0u] << 16) |
                             ((uint32_t)app->image.pixels[src_index + 1u] << 8) |
                             (uint32_t)app->image.pixels[src_index + 2u];
            app->framebuffer[(size_t)(dest_y + y) * SCREEN_WIDTH + (size_t)(dest_x + x)] = color;
        }
    }
}

static void render_gradient(AppState *app) {
    const uint32_t *palette = app_current_palette(app);
    const int gradient_height = 160;
    const int swatch_height = 32;

    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            uint32_t color = 0xff000000u;

            if (y < gradient_height) {
                float normalized_x = (float)x / (float)(SCREEN_WIDTH - 1);
                float palette_pos = normalized_x * (float)(COLORS_PER_PALETTE - 1);
                int left_index = (int)palette_pos;
                int right_index = left_index < (COLORS_PER_PALETTE - 1) ? left_index + 1 : left_index;
                float t = palette_pos - (float)left_index;
                float shade = 1.20f - (0.50f * ((float)y / (float)(gradient_height - 1)));

                color = mix_argb(palette[left_index], palette[right_index], t);
                color = scale_argb(color, shade);
            } else if (y < (gradient_height + swatch_height)) {
                int swatch = x / (SCREEN_WIDTH / COLORS_PER_PALETTE);
                if (swatch >= COLORS_PER_PALETTE) {
                    swatch = COLORS_PER_PALETTE - 1;
                }
                color = palette[swatch];
            } else {
                int swatch_x = x / (SCREEN_WIDTH / 4);
                int swatch_y = (y - gradient_height - swatch_height) / ((SCREEN_HEIGHT - gradient_height - swatch_height) / 4);
                int swatch = (swatch_y * 4) + swatch_x;
                if (swatch < 0) {
                    swatch = 0;
                } else if (swatch >= COLORS_PER_PALETTE) {
                    swatch = COLORS_PER_PALETTE - 1;
                }

                color = palette[swatch];
                if (((x / 8) + (y / 8)) & 1) {
                    color = scale_argb(color, 0.82f);
                }
            }

            app->framebuffer[(y * SCREEN_WIDTH) + x] = color;
        }
    }
}

static void render_current_view(AppState *app) {
    if (app->snes_bg_scene.loaded) {
        render_snes_bg_scene(app);
    } else if (app->indexed_anim.loaded) {
        render_indexed_palette_animation(app);
    } else if (app->image.pixels) {
        render_image_view(app);
    } else {
        render_gradient(app);
    }
}

static void app_step(AppState *app) {
    app->tick_count++;

    if (app->sequence.loaded) {
        if (app->sequence.frames_remaining <= 0) {
            size_t next_index = app->sequence.current_index + 1u;

            if (next_index >= app->sequence.count) {
                if (!app->sequence.loop) {
                    app->running = false;
                    return;
                }
                next_index = 0u;
            }

            if (!app_sequence_apply_entry(app, next_index)) {
                app->running = false;
                return;
            }
        }

        if (app->sequence.frames_remaining > 0) {
            app->sequence.frames_remaining--;
        }
    }

    indexed_palette_animation_step(&app->indexed_anim);

    if (app->auto_cycle && app->palette_bank.palette_count > 0 && (app->tick_count % TARGET_HZ) == 0) {
        app->current_palette = (app->current_palette + 1u) % app->palette_bank.palette_count;
    }

    if (app->auto_quit_frames > 0 && (int)app->tick_count >= app->auto_quit_frames) {
        app->running = false;
    }
}

static void print_usage(const char *argv0) {
    fprintf(
        stderr,
        "usage: %s [--palette path] [--palette-index n] [--image path] [--sequence path] [--sequence-no-loop] [--snes-bg-prefix path] [--snes-bg-vram path --snes-bg-cgram path --snes-bg-state path [--snes-bg-oam path]] [--frames n] [--headless] [--dump-prefix path]\n",
        argv0
    );
}

int main(int argc, char **argv) {
    const char *palette_path = "../tools/out/bank3_palettes.json";
    const char *image_path = NULL;
    const char *sequence_path = NULL;
    const char *snes_bg_prefix = NULL;
    const char *snes_bg_vram_path = NULL;
    const char *snes_bg_cgram_path = NULL;
    const char *snes_bg_state_path = NULL;
    const char *snes_bg_oam_path = NULL;
    bool palette_path_explicit = false;
    bool headless = false;
    bool sequence_loop = true;
    AppState app = {0};
    SDL_Window *window = NULL;
    SDL_Renderer *renderer = NULL;
    SDL_Texture *texture = NULL;
    uint64_t previous_counter = 0;
    uint64_t performance_frequency = 0;
    double accumulator = 0.0;
    const double step_seconds = 1.0 / (double)TARGET_HZ;

    app.running = true;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--palette") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            palette_path = argv[++i];
            palette_path_explicit = true;
        } else if (strcmp(argv[i], "--palette-index") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            app.current_palette = (size_t)strtoul(argv[++i], NULL, 10);
        } else if (strcmp(argv[i], "--image") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            image_path = argv[++i];
        } else if (strcmp(argv[i], "--sequence") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            sequence_path = argv[++i];
        } else if (strcmp(argv[i], "--sequence-no-loop") == 0) {
            sequence_loop = false;
        } else if (strcmp(argv[i], "--snes-bg-prefix") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            snes_bg_prefix = argv[++i];
        } else if (strcmp(argv[i], "--snes-bg-vram") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            snes_bg_vram_path = argv[++i];
        } else if (strcmp(argv[i], "--snes-bg-cgram") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            snes_bg_cgram_path = argv[++i];
        } else if (strcmp(argv[i], "--snes-bg-state") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            snes_bg_state_path = argv[++i];
        } else if (strcmp(argv[i], "--snes-bg-oam") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            snes_bg_oam_path = argv[++i];
        } else if (strcmp(argv[i], "--frames") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            app.auto_quit_frames = (int)strtol(argv[++i], NULL, 10);
        } else if (strcmp(argv[i], "--dump-prefix") == 0) {
            if ((i + 1) >= argc) {
                print_usage(argv[0]);
                return 1;
            }
            app.dump_prefix = argv[++i];
        } else if (strcmp(argv[i], "--headless") == 0) {
            headless = true;
        } else if (strcmp(argv[i], "--help") == 0) {
            print_usage(argv[0]);
            return 0;
        } else {
            fprintf(stderr, "error: unknown argument: %s\n", argv[i]);
            print_usage(argv[0]);
            return 1;
        }
    }

    if (snes_bg_prefix) {
        static char derived_vram_path[1024];
        static char derived_cgram_path[1024];
        static char derived_state_path[1024];
        static char derived_oam_path[1024];

        if (!snes_bg_vram_path) {
            snprintf(derived_vram_path, sizeof(derived_vram_path), "%s_vram.bin", snes_bg_prefix);
            snes_bg_vram_path = derived_vram_path;
        }
        if (!snes_bg_cgram_path) {
            snprintf(derived_cgram_path, sizeof(derived_cgram_path), "%s_cgram.bin", snes_bg_prefix);
            snes_bg_cgram_path = derived_cgram_path;
        }
        if (!snes_bg_state_path) {
            snprintf(derived_state_path, sizeof(derived_state_path), "%s_ppu_state.json", snes_bg_prefix);
            snes_bg_state_path = derived_state_path;
        }
        if (!snes_bg_oam_path) {
            snprintf(derived_oam_path, sizeof(derived_oam_path), "%s_oam.bin", snes_bg_prefix);
            if (path_exists(derived_oam_path)) {
                snes_bg_oam_path = derived_oam_path;
            }
        }
    }

    if ((snes_bg_vram_path || snes_bg_cgram_path || snes_bg_state_path) &&
        !(snes_bg_vram_path && snes_bg_cgram_path && snes_bg_state_path)) {
        fprintf(stderr, "error: SNES BG scene loading requires VRAM, CGRAM, and state paths\n");
        return 1;
    }

    if (sequence_path && !scene_sequence_load_manifest(sequence_path, &app.sequence)) {
        palette_bank_free(&app.palette_bank);
        return 1;
    }
    if (app.sequence.loaded) {
        app.sequence.loop = sequence_loop;
    }

    if ((snes_bg_vram_path && snes_bg_cgram_path && snes_bg_state_path) &&
        !snes_bg_scene_load(
            snes_bg_vram_path,
            snes_bg_cgram_path,
            snes_bg_state_path,
            snes_bg_oam_path,
            &app.snes_bg_scene)) {
        scene_sequence_free(&app.sequence);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (app.sequence.loaded && !app_sequence_apply_entry(&app, 0u)) {
        scene_sequence_free(&app.sequence);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (palette_path && (palette_path_explicit || (!image_path && !app.snes_bg_scene.loaded && !app.sequence.loaded)) &&
        palette_bank_load_json(palette_path, &app.palette_bank)) {
        if (app.palette_bank.palette_count > 0) {
            app.current_palette %= app.palette_bank.palette_count;
        }
        fprintf(stderr, "loaded %zu palettes from %s\n", app.palette_bank.palette_count, palette_path);
    } else if (palette_path_explicit) {
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (image_path && !app.sequence.loaded && !image_data_load_ppm(image_path, &app.image)) {
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (headless) {
        if (app.auto_quit_frames <= 0) {
            app.auto_quit_frames = app.sequence.loaded ? scene_sequence_total_frames(&app.sequence) : TARGET_HZ;
        }

        while (app.running) {
            app_step(&app);
            render_current_view(&app);
            if (!dump_frame_if_requested(&app)) {
                scene_sequence_free(&app.sequence);
                snes_bg_scene_free(&app.snes_bg_scene);
                indexed_palette_animation_free(&app.indexed_anim);
                image_data_free(&app.image);
                palette_bank_free(&app.palette_bank);
                return 1;
            }
            app.rendered_frames++;
        }

        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        image_data_free(&app.image);
        palette_bank_free(&app.palette_bank);
        return 0;
    }

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER | SDL_INIT_TIMER) != 0) {
        fprintf(stderr, "error: SDL_Init failed: %s\n", SDL_GetError());
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "nearest");

    window = SDL_CreateWindow(
        "TD2 Port Skeleton",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        SCREEN_WIDTH * DEFAULT_WINDOW_SCALE,
        SCREEN_HEIGHT * DEFAULT_WINDOW_SCALE,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE
    );
    if (!window) {
        fprintf(stderr, "error: SDL_CreateWindow failed: %s\n", SDL_GetError());
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        SDL_Quit();
        return 1;
    }

    Uint32 renderer_flags = SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC;
    const char *video_driver = SDL_GetCurrentVideoDriver();
    if (video_driver && strcmp(video_driver, "dummy") == 0) {
        renderer_flags = SDL_RENDERER_SOFTWARE;
    }

    renderer = SDL_CreateRenderer(window, -1, renderer_flags);
    if (!renderer) {
        renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_SOFTWARE);
    }
    if (!renderer) {
        fprintf(stderr, "error: SDL_CreateRenderer failed: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        SDL_Quit();
        return 1;
    }

    SDL_RenderSetLogicalSize(renderer, SCREEN_WIDTH, SCREEN_HEIGHT);
    SDL_RenderSetIntegerScale(renderer, SDL_TRUE);

    texture = SDL_CreateTexture(
        renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        SCREEN_WIDTH,
        SCREEN_HEIGHT
    );
    if (!texture) {
        fprintf(stderr, "error: SDL_CreateTexture failed: %s\n", SDL_GetError());
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        scene_sequence_free(&app.sequence);
        snes_bg_scene_free(&app.snes_bg_scene);
        indexed_palette_animation_free(&app.indexed_anim);
        palette_bank_free(&app.palette_bank);
        SDL_Quit();
        return 1;
    }

    update_window_title(window, &app);

    performance_frequency = SDL_GetPerformanceFrequency();
    previous_counter = SDL_GetPerformanceCounter();

    while (app.running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                app.running = false;
            } else if (event.type == SDL_KEYDOWN && !event.key.repeat) {
                switch (event.key.keysym.sym) {
                    case SDLK_ESCAPE:
                        app.running = false;
                        break;
                    case SDLK_LEFT:
                        if (app.image.pixels) {
                            if (app.image_offset_x >= 8) {
                                app.image_offset_x -= 8;
                            } else {
                                app.image_offset_x = 0;
                            }
                            update_window_title(window, &app);
                        } else if (app.palette_bank.palette_count > 0) {
                            if (app.current_palette == 0) {
                                app.current_palette = app.palette_bank.palette_count - 1u;
                            } else {
                                app.current_palette--;
                            }
                            update_window_title(window, &app);
                        }
                        break;
                    case SDLK_RIGHT:
                        if (app.image.pixels) {
                            int max_x = app.image.width > SCREEN_WIDTH ? app.image.width - SCREEN_WIDTH : 0;
                            if (app.image_offset_x < max_x) {
                                app.image_offset_x += 8;
                                if (app.image_offset_x > max_x) {
                                    app.image_offset_x = max_x;
                                }
                            }
                            update_window_title(window, &app);
                        } else if (app.palette_bank.palette_count > 0) {
                            app.current_palette = (app.current_palette + 1u) % app.palette_bank.palette_count;
                            update_window_title(window, &app);
                        }
                        break;
                    case SDLK_UP:
                        if (app.image.pixels) {
                            if (app.image_offset_y >= 8) {
                                app.image_offset_y -= 8;
                            } else {
                                app.image_offset_y = 0;
                            }
                            update_window_title(window, &app);
                        }
                        break;
                    case SDLK_DOWN:
                        if (app.image.pixels) {
                            int max_y = app.image.height > SCREEN_HEIGHT ? app.image.height - SCREEN_HEIGHT : 0;
                            if (app.image_offset_y < max_y) {
                                app.image_offset_y += 8;
                                if (app.image_offset_y > max_y) {
                                    app.image_offset_y = max_y;
                                }
                            }
                            update_window_title(window, &app);
                        }
                        break;
                    case SDLK_HOME:
                        if (app.image.pixels) {
                            app.image_offset_x = 0;
                            app.image_offset_y = 0;
                        } else {
                            app.current_palette = 0;
                        }
                        update_window_title(window, &app);
                        break;
                    case SDLK_END:
                        if (app.image.pixels) {
                            app.image_offset_x = app.image.width > SCREEN_WIDTH ? app.image.width - SCREEN_WIDTH : 0;
                            app.image_offset_y = app.image.height > SCREEN_HEIGHT ? app.image.height - SCREEN_HEIGHT : 0;
                            update_window_title(window, &app);
                        } else if (app.palette_bank.palette_count > 0) {
                            app.current_palette = app.palette_bank.palette_count - 1u;
                            update_window_title(window, &app);
                        }
                        break;
                    case SDLK_SPACE:
                        app.auto_cycle = !app.auto_cycle;
                        break;
                    default:
                        break;
                }
            }
        }

        uint64_t current_counter = SDL_GetPerformanceCounter();
        double frame_seconds = (double)(current_counter - previous_counter) / (double)performance_frequency;
        previous_counter = current_counter;

        if (frame_seconds > 0.25) {
            frame_seconds = 0.25;
        }

        accumulator += frame_seconds;
        while (accumulator >= step_seconds) {
            size_t previous_palette = app.current_palette;
            app_step(&app);
            if (app.sequence.loaded || app.current_palette != previous_palette) {
                update_window_title(window, &app);
            }
            accumulator -= step_seconds;
        }

        render_current_view(&app);
        if (app.dump_prefix) {
            if (!dump_frame_if_requested(&app)) {
                app.running = false;
            }
            app.rendered_frames++;
        }
        SDL_UpdateTexture(texture, NULL, app.framebuffer, SCREEN_WIDTH * (int)sizeof(uint32_t));
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, texture, NULL, NULL);
        SDL_RenderPresent(renderer);
        SDL_Delay(1);
    }

    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    scene_sequence_free(&app.sequence);
    snes_bg_scene_free(&app.snes_bg_scene);
    indexed_palette_animation_free(&app.indexed_anim);
    image_data_free(&app.image);
    palette_bank_free(&app.palette_bank);
    SDL_Quit();
    return 0;
}
