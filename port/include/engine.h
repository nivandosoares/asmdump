#ifndef TD2_ENGINE_H
#define TD2_ENGINE_H

#include "snes_kernel.h"

// --- The Duel: Game State ---
typedef struct {
    uint16_t speed;
    uint8_t  gear;
    uint16_t player_x;
    uint32_t track_pos;
    int16_t  curvature;
} WorldState;

typedef struct {
    WorldState world;
    SNES_Kernel *kernel; // Link to the SNES "OS"
} GameState;

// --- SNES Callback Implementations ---
void td2_nmi_handler(void);
void td2_main_callback(void);

// --- Module Prototypes ---
void physics_update(GameState *state);
void rasterizer_update(GameState *state);

#endif // TD2_ENGINE_H
