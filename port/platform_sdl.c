#include "platform_sdl.h"

#include <SDL2/SDL.h>
#include <stdio.h>
#include <string.h>

#include "td2_io.h"

#define TD2_SDL_AXIS_DEADZONE 16000

static void set_error(char* error, size_t error_size, const char* message) {
    if (error_size == 0) {
        return;
    }
    snprintf(error, error_size, "%s", message);
}

static bool keyboard_state_has(const uint8_t* keyboard_state, size_t state_size, SDL_Scancode scancode) {
    size_t index = (size_t)scancode;

    return keyboard_state != NULL &&
           index < state_size &&
           keyboard_state[index] != 0;
}

uint16_t platform_sdl_keyboard_mask_from_state(const uint8_t* keyboard_state, size_t state_size) {
    uint16_t mask = TD2_INPUT_MASK_NONE;

    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_Z)) {
        mask |= TD2_INPUT_MASK_B;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_X)) {
        mask |= TD2_INPUT_MASK_A;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_A)) {
        mask |= TD2_INPUT_MASK_Y;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_S)) {
        mask |= TD2_INPUT_MASK_X;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_Q)) {
        mask |= TD2_INPUT_MASK_L;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_W)) {
        mask |= TD2_INPUT_MASK_R;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_RETURN)) {
        mask |= TD2_INPUT_MASK_START;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_BACKSPACE) ||
        keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_TAB)) {
        mask |= TD2_INPUT_MASK_SELECT;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_UP)) {
        mask |= TD2_INPUT_MASK_UP;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_DOWN)) {
        mask |= TD2_INPUT_MASK_DOWN;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_LEFT)) {
        mask |= TD2_INPUT_MASK_LEFT;
    }
    if (keyboard_state_has(keyboard_state, state_size, SDL_SCANCODE_RIGHT)) {
        mask |= TD2_INPUT_MASK_RIGHT;
    }

    return mask;
}

uint16_t platform_sdl_controller_mask_from_sample(const PlatformSdlControllerSample* sample) {
    uint16_t mask = TD2_INPUT_MASK_NONE;

    if (sample == NULL) {
        return TD2_INPUT_MASK_NONE;
    }

    if (sample->a) {
        mask |= TD2_INPUT_MASK_B;
    }
    if (sample->b) {
        mask |= TD2_INPUT_MASK_A;
    }
    if (sample->x) {
        mask |= TD2_INPUT_MASK_Y;
    }
    if (sample->y) {
        mask |= TD2_INPUT_MASK_X;
    }
    if (sample->back) {
        mask |= TD2_INPUT_MASK_SELECT;
    }
    if (sample->start) {
        mask |= TD2_INPUT_MASK_START;
    }
    if (sample->left_shoulder) {
        mask |= TD2_INPUT_MASK_L;
    }
    if (sample->right_shoulder) {
        mask |= TD2_INPUT_MASK_R;
    }
    if (sample->dpad_up || sample->left_y <= -TD2_SDL_AXIS_DEADZONE) {
        mask |= TD2_INPUT_MASK_UP;
    }
    if (sample->dpad_down || sample->left_y >= TD2_SDL_AXIS_DEADZONE) {
        mask |= TD2_INPUT_MASK_DOWN;
    }
    if (sample->dpad_left || sample->left_x <= -TD2_SDL_AXIS_DEADZONE) {
        mask |= TD2_INPUT_MASK_LEFT;
    }
    if (sample->dpad_right || sample->left_x >= TD2_SDL_AXIS_DEADZONE) {
        mask |= TD2_INPUT_MASK_RIGHT;
    }

    return mask;
}

static void platform_sdl_close_controller(PlatformSdl* platform) {
    if (platform->controller != NULL) {
        SDL_GameControllerClose(platform->controller);
        platform->controller = NULL;
    }
    platform->controller_instance_id = -1;
}

static void platform_sdl_try_open_controller(PlatformSdl* platform, int device_index) {
    SDL_GameController* controller = NULL;
    SDL_Joystick* joystick = NULL;

    if (platform == NULL || platform->controller != NULL || !SDL_IsGameController(device_index)) {
        return;
    }

    controller = SDL_GameControllerOpen(device_index);
    if (controller == NULL) {
        return;
    }

    joystick = SDL_GameControllerGetJoystick(controller);
    if (joystick == NULL) {
        SDL_GameControllerClose(controller);
        return;
    }

    platform->controller = controller;
    platform->controller_instance_id = (int32_t)SDL_JoystickInstanceID(joystick);
}

static void platform_sdl_open_first_controller(PlatformSdl* platform) {
    int index = 0;
    int count = SDL_NumJoysticks();

    for (index = 0; index < count; index++) {
        platform_sdl_try_open_controller(platform, index);
        if (platform->controller != NULL) {
            return;
        }
    }
}

static SDL_Renderer* platform_sdl_create_renderer(SDL_Window* window) {
    SDL_Renderer* renderer = SDL_CreateRenderer(
        window,
        -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC
    );

    if (renderer != NULL) {
        return renderer;
    }

    return SDL_CreateRenderer(
        window,
        -1,
        SDL_RENDERER_SOFTWARE
    );
}

static uint16_t platform_sdl_read_input_mask(PlatformSdl* platform) {
    const uint8_t* keyboard_state = NULL;
    int keyboard_size = 0;
    uint16_t mask = TD2_INPUT_MASK_NONE;

    if (platform == NULL || platform->headless) {
        return TD2_INPUT_MASK_NONE;
    }

    SDL_PumpEvents();
    keyboard_state = SDL_GetKeyboardState(&keyboard_size);
    mask |= platform_sdl_keyboard_mask_from_state(
        keyboard_state,
        keyboard_size > 0 ? (size_t)keyboard_size : 0U);

    if (platform->controller != NULL && SDL_GameControllerGetAttached(platform->controller)) {
        PlatformSdlControllerSample sample;

        memset(&sample, 0, sizeof(sample));
        sample.a = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_A) != 0;
        sample.b = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_B) != 0;
        sample.x = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_X) != 0;
        sample.y = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_Y) != 0;
        sample.back = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_BACK) != 0;
        sample.start = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_START) != 0;
        sample.left_shoulder = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_LEFTSHOULDER) != 0;
        sample.right_shoulder = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_RIGHTSHOULDER) != 0;
        sample.dpad_up = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_DPAD_UP) != 0;
        sample.dpad_down = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_DPAD_DOWN) != 0;
        sample.dpad_left = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_DPAD_LEFT) != 0;
        sample.dpad_right = SDL_GameControllerGetButton(platform->controller, SDL_CONTROLLER_BUTTON_DPAD_RIGHT) != 0;
        sample.left_x = SDL_GameControllerGetAxis(platform->controller, SDL_CONTROLLER_AXIS_LEFTX);
        sample.left_y = SDL_GameControllerGetAxis(platform->controller, SDL_CONTROLLER_AXIS_LEFTY);
        mask |= platform_sdl_controller_mask_from_sample(&sample);
    }

    return mask;
}

bool platform_sdl_init(
    PlatformSdl* platform,
    const char* title,
    int framebuffer_width,
    int framebuffer_height,
    int window_scale,
    bool headless,
    char* error,
    size_t error_size
) {
    memset(platform, 0, sizeof(*platform));
    platform->headless = headless;
    platform->window_scale = window_scale > 0 ? window_scale : 3;
    platform->framebuffer_width = framebuffer_width > 0 ? framebuffer_width : TD2_FRAME_WIDTH;
    platform->framebuffer_height = framebuffer_height > 0 ? framebuffer_height : TD2_FRAME_HEIGHT;

    if (headless) {
        return true;
    }

    platform->controller_instance_id = -1;

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_GAMECONTROLLER) != 0) {
        snprintf(error, error_size, "SDL_Init failed: %s", SDL_GetError());
        return false;
    }

    platform->window = SDL_CreateWindow(
        title,
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        platform->framebuffer_width * platform->window_scale,
        platform->framebuffer_height * platform->window_scale,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE
    );
    if (platform->window == NULL) {
        snprintf(error, error_size, "SDL_CreateWindow failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    platform->renderer = platform_sdl_create_renderer(platform->window);
    if (platform->renderer == NULL) {
        snprintf(error, error_size, "SDL_CreateRenderer failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    SDL_RenderSetLogicalSize(platform->renderer, platform->framebuffer_width, platform->framebuffer_height);
    platform->texture = SDL_CreateTexture(
        platform->renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        platform->framebuffer_width,
        platform->framebuffer_height
    );
    if (platform->texture == NULL) {
        snprintf(error, error_size, "SDL_CreateTexture failed: %s", SDL_GetError());
        platform_sdl_shutdown(platform);
        return false;
    }

    platform_sdl_open_first_controller(platform);
    platform->input_mask = platform_sdl_read_input_mask(platform);
    set_error(error, error_size, "");
    return true;
}

void platform_sdl_shutdown(PlatformSdl* platform) {
    platform_sdl_close_controller(platform);
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
        if (event.type == SDL_CONTROLLERDEVICEADDED) {
            platform_sdl_try_open_controller(platform, event.cdevice.which);
        }
        if (event.type == SDL_CONTROLLERDEVICEREMOVED &&
            platform->controller != NULL &&
            platform->controller_instance_id == (int32_t)event.cdevice.which) {
            platform_sdl_close_controller(platform);
            platform_sdl_open_first_controller(platform);
        }
    }

    platform->input_mask = platform_sdl_read_input_mask(platform);
}

uint16_t platform_sdl_current_input_mask(const PlatformSdl* platform) {
    if (platform == NULL) {
        return TD2_INPUT_MASK_NONE;
    }
    return platform->input_mask;
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

    if (width != platform->framebuffer_width || height != platform->framebuffer_height) {
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
