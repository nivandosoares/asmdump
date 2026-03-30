#include <SDL.h>
#include <stdio.h>
#include <stdbool.h>
#include "platform_sdl.h"
#include "framebuffer.h"

int main(int argc, char **argv) {
    if (!platform_init(640, 560)) {
        fprintf(stderr, "Failed to init platform\n");
        return 1;
    }

    const double target_dt = 1.0 / 60.0;
    double accumulator = 0.0;
    double last = platform_time_seconds();
    bool running = true;

    // simple state for debug
    int frame_count = 0;

    while (running) {
        double now = platform_time_seconds();
        double dt = now - last;
        last = now;
        accumulator += dt;

        // poll input/events
        PlatformEvent ev;
        while (platform_poll_event(&ev)) {
            if (ev.type == PLATFORM_EVENT_QUIT) running = false;
        }

        // fixed-timestep loop
        while (accumulator >= target_dt) {
            // update game logic here (empty for now)
            accumulator -= target_dt;
        }

        // render placeholder content
        render_framebuffer_placeholder(frame_count);
        platform_present_framebuffer();

        frame_count++;
    }

    platform_shutdown();
    return 0;
}
