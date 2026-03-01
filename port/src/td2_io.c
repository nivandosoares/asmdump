#include "td2_io.h"

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void palette_bank_free(PaletteBank *bank) {
    free(bank->colors);
    bank->colors = NULL;
    bank->palette_count = 0;
}

void image_data_free(ImageData *image) {
    free(image->pixels);
    image->pixels = NULL;
    image->width = 0;
    image->height = 0;
}

bool read_entire_file(const char *path, char **out_data, size_t *out_size) {
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

bool path_exists(const char *path) {
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

bool path_is_absolute(const char *path) {
    return path && path[0] == '/';
}

char *dup_string(const char *value) {
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

char *resolve_manifest_path(const char *manifest_path, const char *relative_path) {
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

char *resolve_sibling_path(const char *path, const char *filename) {
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

bool write_frame_ppm(const char *path, const uint32_t *framebuffer) {
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

bool image_data_load_ppm(const char *path, ImageData *out_image) {
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

const char *json_find_value_internal(const char *json, const char *key, bool log_errors) {
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

const char *json_find_value(const char *json, const char *key) {
    return json_find_value_internal(json, key, true);
}

bool json_parse_int(const char *json, const char *key, int *out_value) {
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

bool json_parse_bool(const char *json, const char *key, bool *out_value) {
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

bool json_try_parse_int(const char *json, const char *key, int *out_value) {
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

bool json_try_parse_bool(const char *json, const char *key, bool *out_value) {
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

bool palette_bank_load_json(const char *path, PaletteBank *out_bank) {
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

    {
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
    }

cleanup:
    free(values);
    free(buffer);
    return ok;
}
