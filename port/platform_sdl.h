#ifndef PLATFORM_SDL_H
#define PLATFORM_SDL_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef struct SDL_Renderer SDL_Renderer;
typedef struct SDL_Texture SDL_Texture;
typedef struct SDL_Window SDL_Window;

typedef struct {
    bool headless;
    bool quit_requested;
    int window_scale;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Texture* texture;
} PlatformSdl;

bool platform_sdl_init(
    PlatformSdl* platform,
    const char* title,
    int window_scale,
    bool headless,
    char* error,
    size_t error_size
);
void platform_sdl_shutdown(PlatformSdl* platform);
void platform_sdl_poll_events(PlatformSdl* platform);
bool platform_sdl_present(
    PlatformSdl* platform,
    const uint32_t* framebuffer_argb,
    int width,
    int height,
    char* error,
    size_t error_size
);
void platform_sdl_sleep_for_frame(PlatformSdl* platform, uint32_t frame_start_ticks);

#endif
