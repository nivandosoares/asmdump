#ifndef SNES_KERNEL_H
#define SNES_KERNEL_H

#include <stdint.h>
#include <stdbool.h>
#include <SDL2/SDL.h>

// --- Hardware Limits ---
#define WRAM_SIZE       (128 * 1024)
#define VRAM_SIZE       (64 * 1024)
#define CGRAM_SIZE      (512)
#define OAM_SIZE        (544)
#define ROM_SIZE        (1024 * 1024) // 1MB for The Duel
#define SCREEN_WIDTH    256
#define SCREEN_HEIGHT   224

// --- Memory Map ---
typedef struct {
    uint8_t wram[WRAM_SIZE];
    uint8_t vram[VRAM_SIZE];
    uint8_t cgram[CGRAM_SIZE];
    uint8_t oam[OAM_SIZE];
    uint8_t rom[ROM_SIZE]; // Full ROM mapping
    
    // Register Maps
    uint8_t ppu_regs[0x100];
    uint8_t cpu_regs[0x100];
} SNES_Hardware;

// --- Kernel Control Structure ---
typedef struct {
    SNES_Hardware hw;
    uint32_t frame_count;
    bool running;
    
    // Interrupt Vectors
    void (*nmi_handler)(void);
    void (*main_callback)(void);

    // SDL Native State
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
} SNES_Kernel;

// --- Kernel API ---
bool snes_kernel_init(SNES_Kernel *k, const uint8_t *initial_vram, const uint8_t *initial_cgram);
void snes_kernel_run(SNES_Kernel *k);
void snes_kernel_stop(SNES_Kernel *k);

// Hardware Accessors
uint8_t* snes_get_rom_ptr(SNES_Kernel *k, uint32_t addr);
void snes_dma_transfer(SNES_Kernel *k, uint8_t channel, uint32_t src_addr, uint16_t dest_reg, uint16_t size);
uint8_t snes_read_reg(SNES_Kernel *k, uint16_t addr);
void snes_write_reg(SNES_Kernel *k, uint16_t addr, uint8_t val);

// Internal PPU Simulation (For visual output)
void snes_ppu_render_frame(SNES_Kernel *k, uint8_t *output_rgb);

#endif // SNES_KERNEL_H
