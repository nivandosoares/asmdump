#include "engine.h"
#include <string.h>

/**
 * Port of Physics Integrator (Bank 10 / $0A:5322)
 * Running as a native C task within the SNES Kernel.
 */
void physics_update(GameState *state) {
    uint16_t accel = 0;
    if (state->world.gear > 0) {
        accel = 0x10 * state->world.gear;
    }
    
    state->world.speed += accel;
    if (state->world.speed > 0xBE00) {
        state->world.speed = 0xBE00;
    }

    state->world.track_pos += state->world.speed;
    
    // Write speed to the simulated WRAM ($11CE)
    // This mimetizes how the original ASM writes to memory
    state->kernel->hw.wram[0x11CE] = (uint8_t)(state->world.speed & 0xFF);
    state->kernel->hw.wram[0x11CF] = (uint8_t)(state->world.speed >> 8);
}
