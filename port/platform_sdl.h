#ifndef PLATFORM_SDL_H
#define PLATFORM_SDL_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "td2_input.h"

typedef struct SDL_Renderer SDL_Renderer;
typedef struct SDL_Texture SDL_Texture;
typedef struct SDL_Window SDL_Window;
typedef struct _SDL_GameController SDL_GameController;

typedef struct {
    bool a;
    bool b;
    bool x;
    bool y;
    bool back;
    bool start;
    bool left_shoulder;
    bool right_shoulder;
    bool dpad_up;
    bool dpad_down;
    bool dpad_left;
    bool dpad_right;
    int16_t left_x;
    int16_t left_y;
} PlatformSdlControllerSample;

typedef struct {
    bool headless;
    bool quit_requested;
    int window_scale;
    int framebuffer_width;
    int framebuffer_height;
    uint16_t input_mask;
    int32_t controller_instance_id;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Texture* texture;
    SDL_GameController* controller;
} PlatformSdl;

bool platform_sdl_init(
    PlatformSdl* platform,
    const char* title,
    int framebuffer_width,
    int framebuffer_height,
    int window_scale,
    bool headless,
    char* error,
    size_t error_size
);
void platform_sdl_shutdown(PlatformSdl* platform);
void platform_sdl_poll_events(PlatformSdl* platform);
uint16_t platform_sdl_keyboard_mask_from_state(const uint8_t* keyboard_state, size_t state_size);
uint16_t platform_sdl_controller_mask_from_sample(const PlatformSdlControllerSample* sample);
uint16_t platform_sdl_current_input_mask(const PlatformSdl* platform);
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
