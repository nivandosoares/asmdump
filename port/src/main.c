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

typedef struct {
    uint32_t *colors;
    size_t palette_count;
} PaletteBank;

typedef struct {
    uint8_t *pixels;
    int width;
    int height;
} ImageData;

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
    int image_offset_x;
    int image_offset_y;
    uint32_t framebuffer[SCREEN_WIDTH * SCREEN_HEIGHT];
} AppState;

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

    if (app->image.pixels) {
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
    if (app->image.pixels) {
        render_image_view(app);
    } else {
        render_gradient(app);
    }
}

static void app_step(AppState *app) {
    app->tick_count++;

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
        "usage: %s [--palette path] [--palette-index n] [--image path] [--frames n] [--headless] [--dump-prefix path]\n",
        argv0
    );
}

int main(int argc, char **argv) {
    const char *palette_path = "../tools/out/bank3_palettes.json";
    const char *image_path = NULL;
    bool palette_path_explicit = false;
    bool headless = false;
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

    if (palette_path && palette_bank_load_json(palette_path, &app.palette_bank)) {
        if (app.palette_bank.palette_count > 0) {
            app.current_palette %= app.palette_bank.palette_count;
        }
        fprintf(stderr, "loaded %zu palettes from %s\n", app.palette_bank.palette_count, palette_path);
    } else if (palette_path_explicit) {
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (image_path && !image_data_load_ppm(image_path, &app.image)) {
        palette_bank_free(&app.palette_bank);
        return 1;
    }

    if (headless) {
        if (app.auto_quit_frames <= 0) {
            app.auto_quit_frames = TARGET_HZ;
        }

        while (app.running) {
            app_step(&app);
            render_current_view(&app);
            if (!dump_frame_if_requested(&app)) {
                image_data_free(&app.image);
                palette_bank_free(&app.palette_bank);
                return 1;
            }
            app.rendered_frames++;
        }

        image_data_free(&app.image);
        palette_bank_free(&app.palette_bank);
        return 0;
    }

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER | SDL_INIT_TIMER) != 0) {
        fprintf(stderr, "error: SDL_Init failed: %s\n", SDL_GetError());
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
            if (app.current_palette != previous_palette) {
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
    image_data_free(&app.image);
    palette_bank_free(&app.palette_bank);
    SDL_Quit();
    return 0;
}
