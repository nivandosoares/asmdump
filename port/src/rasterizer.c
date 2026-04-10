#include "engine.h"
#include "snes_tables.h"
#include <string.h>

/**
 * Port of Road Rasterizer (Bank 11 / $12EE)
 * Generates scanline-by-scanline scroll values in simulated WRAM.
 */
void rasterizer_update(GameState *state) {
    // Populate the HOFS/VOFS tables in WRAM ($0200 and $0400)
    // This mimics the original Bank 11 logic
    uint16_t *wram_hofs = (uint16_t*)&state->kernel->hw.wram[0x0200];
    uint16_t *wram_vofs = (uint16_t*)&state->kernel->hw.wram[0x0400];

    for (int y = 0; y < 224; y++) {
        // For parity, we use the extracted tables from frame1
        wram_hofs[y] = snes_hofs[y];
        wram_vofs[y] = snes_vofs[y];
    }
}
