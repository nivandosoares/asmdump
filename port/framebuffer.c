#include "framebuffer.h"
#include <string.h>

uint8_t framebuffer_pixels[256*224*3];

void render_framebuffer_placeholder(int frame) {
    // simple moving color pattern for visual feedback
    for (int y=0;y<224;y++) {
        for (int x=0;x<256;x++) {
            int i = (y*256 + x) * 3;
            framebuffer_pixels[i+0] = (x + frame) & 0xFF;
            framebuffer_pixels[i+1] = (y + frame*2) & 0xFF;
            framebuffer_pixels[i+2] = (x + y + frame*3) & 0xFF;
        }
    }
}
