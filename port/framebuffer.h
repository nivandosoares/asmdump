#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include <stdint.h>

extern uint8_t framebuffer_pixels[256*224*3];
void render_framebuffer_placeholder(int frame);

#endif // FRAMEBUFFER_H
