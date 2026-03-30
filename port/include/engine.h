#ifndef TD2_ENGINE_H
#define TD2_ENGINE_H

#include <stdint.h>

// --- SNES WRAM Mappings ---
#define ADDR_SPEED          0x11CE
#define ADDR_GEAR           0x12B9
#define ADDR_PLAYER_X       0x11CD
#define ADDR_CAR1_X         0x11F1
#define ADDR_CAR2_X         0x11F3
#define ADDR_CAR3_X         0x11F5
#define ADDR_RADAR1_OAM     0x072C
#define ADDR_RADAR2_OAM     0x0730

// --- Core Data Structures ---

typedef struct {
    uint16_t frame_counter;
    uint16_t speed;
    uint8_t  gear;
    uint16_t player_x;
    uint32_t track_pos;
    int16_t  curvature;
} WorldState;

typedef struct {
    uint16_t x;
    uint16_t z;
    uint8_t  type;
    uint8_t  active;
} Actor;

typedef struct {
    WorldState world;
    Actor actors[3];
} GameState;

// --- Module Prototypes ---

// Physics & Logic
void physics_update(GameState *state);
void actors_update(GameState *state);

// Rendering
void rasterizer_update(GameState *state, uint16_t *h_table, uint16_t *v_table);
void sprites_update(GameState *state);
void render_to_buffer(uint16_t *h_table, uint16_t *v_table, uint8_t *buffer);
void render_sprites(GameState *state, uint8_t *buffer);

#endif // TD2_ENGINE_H
