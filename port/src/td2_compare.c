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

static bool write_argb_ppm(
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

void td2_compare_run(Td2CompareLane* compare, const uint32_t* actual_framebuffer) {
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
}

bool td2_compare_dump_bundle(
    const Td2CompareLane* compare,
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
    char reference_path[1200];
    char diff_path[1200];
    char strip_path[1200];
    char summary_path[1200];
    FILE* file;

    if (!compare->enabled) {
        if (error_size > 0U) {
            error[0] = '\0';
        }
        return true;
    }

    snprintf(actual_path, sizeof(actual_path), "%s_%05u.ppm", prefix, frame_index);
    snprintf(reference_path, sizeof(reference_path), "%s_%05u_reference.ppm", prefix, frame_index);
    snprintf(diff_path, sizeof(diff_path), "%s_%05u_diff.ppm", prefix, frame_index);
    snprintf(strip_path, sizeof(strip_path), "%s_%05u_compare.ppm", prefix, frame_index);
    snprintf(summary_path, sizeof(summary_path), "%s_%05u_compare.json", prefix, frame_index);

    if (!write_argb_ppm(reference_path, compare->reference_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !write_argb_ppm(diff_path, compare->diff_framebuffer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT, error, error_size) ||
        !write_argb_ppm(strip_path, compare->strip_framebuffer, TD2_COMPARE_WIDTH, TD2_FRAME_HEIGHT, error, error_size)) {
        return false;
    }

    (void)actual_framebuffer;
    file = fopen(summary_path, "wb");
    if (file == NULL) {
        set_error(error, error_size, "failed to open compare summary json");
        return false;
    }

    fputs("{\n", file);
    fputs("  \"scene_dir\": ", file);
    write_json_string(file, scene_dir);
    fputs(",\n", file);
    fprintf(file, "  \"frame_index\": %u,\n", frame_index);
    if (has_frame_number) {
        fprintf(file, "  \"scene_frame_number\": %u,\n", frame_number);
    } else {
        fputs("  \"scene_frame_number\": null,\n", file);
    }
    fputs("  \"outputs\": {\n", file);
    fputs("    \"actual\": ", file);
    write_json_string(file, actual_path);
    fputs(",\n    \"reference\": ", file);
    write_json_string(file, reference_path);
    fputs(",\n    \"diff\": ", file);
    write_json_string(file, diff_path);
    fputs(",\n    \"compare\": ", file);
    write_json_string(file, strip_path);
    fputs("\n  },\n", file);
    fprintf(file,
            "  \"metrics\": {\n"
            "    \"pixel_count\": %u,\n"
            "    \"mismatch_pixels\": %u,\n"
            "    \"mismatch_ratio\": %.9f,\n"
            "    \"max_channel_diff\": %u,\n"
            "    \"mean_abs_channel_diff\": %.9f,\n"
            "    \"rmse\": %.9f\n"
            "  }\n"
            "}\n",
            compare->metrics.pixel_count,
            compare->metrics.mismatch_pixels,
            compare->metrics.mismatch_ratio,
            compare->metrics.max_channel_diff,
            compare->metrics.mean_abs_channel_diff,
            compare->metrics.rmse);
    fclose(file);

    if (error_size > 0U) {
        error[0] = '\0';
    }
    return true;
}
