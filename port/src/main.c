#include "engine.h"
#include "vram_1646.h"
#include "cgram_1646.h"
#include "vram_1662.h"
#include "cgram_1662.h"
#include "vram_1678.h"
#include "cgram_1678.h"
#include "vram_1694.h"
#include "cgram_1694.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Static Game State for callbacks
static GameState g_state;

typedef enum {
    STATE_BOOT,
    STATE_INTRO,
} GameMode;

static GameMode g_mode = STATE_BOOT;
static int g_intro_step = 0;

void td2_main_callback(void) {
    if (g_mode == STATE_BOOT) {
        g_mode = STATE_INTRO;
        printf("[MAIN] Boot complete. Playing INTRO sequence.\n");
    } else {
        // Play intro sequence by switching VRAM/CGRAM in simulated hardware
        if (g_state.kernel->frame_count % 16 == 0) {
            g_intro_step = (g_intro_step + 1) % 4;
            const uint8_t *vram_src;
            const uint8_t *cgram_src;
            
            switch(g_intro_step) {
                case 0: vram_src = intro_loop_frame_01646_vram_bin; cgram_src = intro_loop_frame_01646_cgram_bin; break;
                case 1: vram_src = intro_loop_frame_01662_vram_bin; cgram_src = intro_loop_frame_01662_cgram_bin; break;
                case 2: vram_src = intro_loop_frame_01678_vram_bin; cgram_src = intro_loop_frame_01678_cgram_bin; break;
                case 3: vram_src = intro_loop_frame_01694_vram_bin; cgram_src = intro_loop_frame_01694_cgram_bin; break;
                default: vram_src = intro_loop_frame_01646_vram_bin; cgram_src = intro_loop_frame_01646_cgram_bin;
            }
            
            memcpy(g_state.kernel->hw.vram, vram_src, VRAM_SIZE);
            memcpy(g_state.kernel->hw.cgram, cgram_src, CGRAM_SIZE);
            printf("[MAIN] Intro sequence step %d\n", g_intro_step);
        }
    }
}

void td2_nmi_handler(void) {
}

// Helper to save visual output
static void save_ppm(const char *filename, uint8_t *buffer) {
    FILE *f = fopen(filename, "wb");
    if (!f) return;
    fprintf(f, "P6\n256 224\n255\n");
    fwrite(buffer, 1, 256 * 224 * 3, f);
    fclose(f);
}

// Updated PPU renderer to handle dynamic ROM state
void snes_ppu_render_frame_native(SNES_Kernel *k, uint8_t *output_rgb) {
    // This will eventually render from k->hw.vram
    snes_ppu_render_frame(k, output_rgb);
}

int main() {
    SNES_Kernel kernel;
    uint8_t *frame_buffer = malloc(SCREEN_WIDTH * SCREEN_HEIGHT * 3);

    // 1. Initialize Kernel with embedded ROM and Frame 1646 as the "Beginning"
    if (!snes_kernel_init(&kernel, intro_loop_frame_01646_vram_bin, intro_loop_frame_01646_cgram_bin)) {
        return 1;
    }
    
    kernel.main_callback = td2_main_callback;
    kernel.nmi_handler = td2_nmi_handler;

    // 2. Initialize Game State
    memset(&g_state, 0, sizeof(GameState));
    g_state.kernel = &kernel;
    g_state.world.gear = 1;
    g_state.world.player_x = 0x8000;

    // 3. Start SNES OS Loop
    printf("[MAIN] Starting SNES Mini OS (Self-Contained)...\n");
    
    // Run for a few frames then save a screenshot
    int capture_frame = 10;
    
    while (kernel.running) {
        SDL_Event e;
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT) kernel.running = false;
        }

        if (kernel.main_callback) kernel.main_callback();
        if (kernel.nmi_handler) kernel.nmi_handler();

        snes_ppu_render_frame_native(&kernel, frame_buffer);
        SDL_UpdateTexture(kernel.texture, NULL, frame_buffer, SCREEN_WIDTH * 3);
        
        if (kernel.frame_count == capture_frame) {
            save_ppm("unsalad_parity.ppm", frame_buffer);
            printf("[MAIN] Parity frame saved to unsalad_parity.ppm at frame %d\n", capture_frame);
        }

        SDL_RenderClear(kernel.renderer);
        SDL_RenderCopy(kernel.renderer, kernel.texture, NULL, NULL);
        SDL_RenderPresent(kernel.renderer);

        kernel.frame_count++;
        if (kernel.frame_count > 60) kernel.running = false;
    }

    printf("[MAIN] Simulation complete. Frame count: %d\n", kernel.frame_count);

    free(frame_buffer);
    snes_kernel_stop(&kernel);
    return 0;
}
