#include "engine.h"

/**
 * Port of Physics Integrator (Bank 10 / $0A:5322)
 * Handles acceleration, braking, and steering.
 */
void physics_update(GameState *state) {
    // 1. Acceleration logic (Simplified)
    // In original ASM, this depends on Gear ($12B9) and RPM.
    uint16_t accel = 0;
    if (state->world.gear > 0) {
        accel = 0x10 * state->world.gear; // Placeholder
    }
    
    // 2. Velocity Integration
    state->world.speed += accel;
    if (state->world.speed > 0xBE00) { // Max speed from savestate trace
        state->world.speed = 0xBE00;
    }

    // 3. Track Position Update
    // track_pos += speed
    state->world.track_pos += state->world.speed;

    // 4. Steering (Player X)
    // Modified by Joypad input (not yet in state)
    // state->world.player_x += ...
}

/**
 * Port of Actor Logic (Bank 10 / $0A:8759)
 * Updates AI positions relative to player.
 */
void actors_update(GameState *state) {
    for (int i = 0; i < 3; i++) {
        if (state->actors[i].active) {
            // Simple AI movement: move towards center or follow track
            // state->actors[i].x += ...
            // state->actors[i].z -= state->world.speed; // Relative speed
        }
    }
}
