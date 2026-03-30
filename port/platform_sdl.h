#ifndef PLATFORM_SDL_H
#define PLATFORM_SDL_H

#include <stdint.h>
#include <stdbool.h>

typedef enum {
    PLATFORM_EVENT_NONE = 0,
    PLATFORM_EVENT_QUIT,
} PlatformEventType;

typedef struct {
    PlatformEventType type;
} PlatformEvent;

bool platform_init(int width, int height);
void platform_shutdown(void);
bool platform_poll_event(PlatformEvent *ev);
void platform_present_framebuffer(void);
double platform_time_seconds(void);

#endif // PLATFORM_SDL_H
