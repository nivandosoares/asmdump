#include "platform_sdl.h"

#include <SDL2/SDL.h>
#include <stdio.h>
#include <string.h>

#include "td2_io.h"

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

bool platform_sdl_init(
    PlatformSdl* platform,
    const char* title,
    int window_scale,
    bool headless,
    char* error,
    size_t error_size
) {
    memset(platform, 0, sizeof(*platform));
    platform->headless = headless;
    platform->window_scale = window_scale > 0 ? window_scale : 3;

    if (headless) {
        return true;
    }

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS) != 0) {
        snprintf(error, error_size, "SDL_Init failed: %s", SDL_GetError());
        return false;
    }

    platform->window = SDL_CreateWindow(
        title,
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        TD2_FRAME_WIDTH * platform->window_scale,
        TD2_FRAME_HEIGHT * platform->window_scale,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE
    );
    if (platform->window == NULL) {
        snprintf(error, error_size, "SDL_CreateWindow failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    platform->renderer = SDL_CreateRenderer(
        platform->window,
        -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC
    );
    if (platform->renderer == NULL) {
        snprintf(error, error_size, "SDL_CreateRenderer failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    SDL_RenderSetLogicalSize(platform->renderer, TD2_FRAME_WIDTH, TD2_FRAME_HEIGHT);
    platform->texture = SDL_CreateTexture(
        platform->renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        TD2_FRAME_WIDTH,
        TD2_FRAME_HEIGHT
    );
    if (platform->texture == NULL) {
        snprintf(error, error_size, "SDL_CreateTexture failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    set_error(error, error_size, "");
    return true;
}

void platform_sdl_shutdown(PlatformSdl* platform) {
    if (platform->texture != NULL) {
        SDL_DestroyTexture(platform->texture);
    }
    if (platform->renderer != NULL) {
        SDL_DestroyRenderer(platform->renderer);
    }
    if (platform->window != NULL) {
        SDL_DestroyWindow(platform->window);
    }
    if (!platform->headless) {
        SDL_Quit();
    }
    memset(platform, 0, sizeof(*platform));
}

void platform_sdl_poll_events(PlatformSdl* platform) {
    SDL_Event event;

    if (platform->headless) {
        return;
    }

    while (SDL_PollEvent(&event) != 0) {
        if (event.type == SDL_QUIT) {
            platform->quit_requested = true;
        }
        if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE) {
            platform->quit_requested = true;
        }
    }
}

bool platform_sdl_present(
    PlatformSdl* platform,
    const uint32_t* framebuffer_argb,
    int width,
    int height,
    char* error,
    size_t error_size
) {
    if (platform->headless) {
        return true;
    }

    if (width != TD2_FRAME_WIDTH || height != TD2_FRAME_HEIGHT) {
        snprintf(error, error_size, "unexpected framebuffer size %dx%d", width, height);
        return false;
    }

    if (SDL_UpdateTexture(platform->texture, NULL, framebuffer_argb, width * (int)sizeof(uint32_t)) != 0) {
        snprintf(error, error_size, "SDL_UpdateTexture failed: %s", SDL_GetError());
        return false;
    }

    SDL_RenderClear(platform->renderer);
    if (SDL_RenderCopy(platform->renderer, platform->texture, NULL, NULL) != 0) {
        snprintf(error, error_size, "SDL_RenderCopy failed: %s", SDL_GetError());
        return false;
    }
    SDL_RenderPresent(platform->renderer);

    if (error_size > 0) {
        error[0] = '\0';
    }
    return true;
}

void platform_sdl_sleep_for_frame(PlatformSdl* platform, uint32_t frame_start_ticks) {
    uint32_t elapsed;

    if (platform->headless) {
        return;
    }

    elapsed = SDL_GetTicks() - frame_start_ticks;
    if (elapsed < 16U) {
        SDL_Delay(16U - elapsed);
    }
}
