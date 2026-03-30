#include "platform_sdl.h"
#include <SDL.h>
#include <stdio.h>

static SDL_Window *window = NULL;
static SDL_Renderer *renderer = NULL;
static SDL_Texture *texture = NULL;
static int win_w = 640, win_h = 560;

bool platform_init(int width, int height) {
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_TIMER) != 0) {
        fprintf(stderr, "SDL_Init error: %s\n", SDL_GetError());
        return false;
    }

    window = SDL_CreateWindow("TD2 Port", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                              width, height, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (!window) {
        fprintf(stderr, "SDL_CreateWindow error: %s\n", SDL_GetError());
        return false;
    }

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        fprintf(stderr, "SDL_CreateRenderer error: %s\n", SDL_GetError());
        return false;
    }

    // internal framebuffer 256x224
    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGB24, SDL_TEXTUREACCESS_STREAMING, 256, 224);
    if (!texture) {
        fprintf(stderr, "SDL_CreateTexture error: %s\n", SDL_GetError());
        return false;
    }

    win_w = width; win_h = height;
    return true;
}

void platform_shutdown(void) {
    if (texture) SDL_DestroyTexture(texture);
    if (renderer) SDL_DestroyRenderer(renderer);
    if (window) SDL_DestroyWindow(window);
    SDL_Quit();
}

static bool translate_sdl(SDL_Event *e, PlatformEvent *out) {
    switch (e->type) {
    case SDL_QUIT:
        out->type = PLATFORM_EVENT_QUIT;
        return true;
    case SDL_KEYDOWN:
        if (e->key.keysym.scancode == SDL_SCANCODE_ESCAPE) {
            out->type = PLATFORM_EVENT_QUIT;
            return true;
        }
        break;
    }
    return false;
}

bool platform_poll_event(PlatformEvent *ev) {
    SDL_Event e;
    while (SDL_PollEvent(&e)) {
        if (translate_sdl(&e, ev)) return true;
    }
    return false;
}

void platform_present_framebuffer(void) {
    extern uint8_t framebuffer_pixels[256*224*3];
    SDL_UpdateTexture(texture, NULL, framebuffer_pixels, 256*3);
    SDL_RenderClear(renderer);
    SDL_Rect dst = {0,0, win_w, win_h};
    SDL_RenderCopy(renderer, texture, NULL, &dst);
    SDL_RenderPresent(renderer);
}

double platform_time_seconds(void) {
    return SDL_GetTicks() / 1000.0;
}
