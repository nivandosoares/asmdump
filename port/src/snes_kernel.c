#include "snes_kernel.h"
#include "rom_data.h"
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>

// --- PPU Decoding Helpers ---

static void decode_tile_4bpp(uint8_t *vram, uint16_t tile_idx, uint8_t *out_8x8) {
    uint8_t *tile_data = &vram[tile_idx * 32];
    for (int y = 0; y < 8; y++) {
        uint8_t b0 = tile_data[y * 2 + 0];
        uint8_t b1 = tile_data[y * 2 + 1];
        uint8_t b2 = tile_data[y * 2 + 16];
        uint8_t b3 = tile_data[y * 2 + 17];
        for (int x = 0; x < 8; x++) {
            uint8_t shift = 7 - x;
            uint8_t color = ((b0 >> shift) & 1) |
                            (((b1 >> shift) & 1) << 1) |
                            (((b2 >> shift) & 1) << 2) |
                            (((b3 >> shift) & 1) << 3);
            out_8x8[y * 8 + x] = color;
        }
    }
}

static void render_bg_mode1_dynamic(SNES_Kernel *k, int bg_idx, uint8_t *output_rgb) {
    uint16_t map_base = (k->hw.ppu_regs[0x07 + bg_idx] & 0xFC) << 8;
    uint16_t tile_base;
    if (bg_idx < 2) {
        tile_base = (bg_idx == 0) ? (k->hw.ppu_regs[0x0B] & 0x0F) << 13 : (k->hw.ppu_regs[0x0B] & 0xF0) << 9;
    } else {
        tile_base = (k->hw.ppu_regs[0x0C] & 0x0F) << 13;
    }
    
    uint16_t *map_ptr = (uint16_t*)&k->hw.vram[map_base];
    for (int ty = 0; ty < 28; ty++) {
        for (int tx = 0; tx < 32; tx++) {
            uint16_t entry = map_ptr[ty * 32 + tx];
            uint16_t tile_idx = entry & 0x3FF;
            uint8_t palette = (entry >> 10) & 0x07;
            bool h_flip = (entry >> 14) & 1;
            bool v_flip = (entry >> 15) & 1;
            
            uint8_t tile_pixels[64];
            decode_tile_4bpp(&k->hw.vram[tile_base], tile_idx, tile_pixels);
            
            for (int py = 0; py < 8; py++) {
                int sy = ty * 8 + py;
                if (sy >= SCREEN_HEIGHT) continue;
                for (int px = 0; px < 8; px++) {
                    int sx = tx * 8 + px;
                    if (sx >= SCREEN_WIDTH) continue;
                    
                    int ty_off = v_flip ? (7 - py) : py;
                    int tx_off = h_flip ? (7 - px) : px;
                    uint8_t color_idx = tile_pixels[ty_off * 8 + tx_off];
                    
                    if (color_idx == 0) continue; // Transparent
                    
                    uint16_t rgb555 = *(uint16_t*)&k->hw.cgram[(bg_idx * 32 + palette * 16 + color_idx) * 2];
                    output_rgb[(sy * SCREEN_WIDTH + sx) * 3 + 0] = (rgb555 & 0x1F) << 3;
                    output_rgb[(sy * SCREEN_WIDTH + sx) * 3 + 1] = ((rgb555 >> 5) & 0x1F) << 3;
                    output_rgb[(sy * SCREEN_WIDTH + sx) * 3 + 2] = ((rgb555 >> 10) & 0x1F) << 3;
                }
            }
        }
    }
}

// --- Kernel Implementation ---

bool snes_kernel_init(SNES_Kernel *k, const uint8_t *initial_vram, const uint8_t *initial_cgram) {
    memset(k, 0, sizeof(SNES_Kernel));
    k->running = true;
    
    // 1. Load embedded ROM
    uint32_t offset = (game_smc_len % 0x8000 == 512) ? 512 : 0;
    memcpy(k->hw.rom, &game_smc[offset], ROM_SIZE);

    // 2. Load Initial Hardware State
    if (initial_vram) memcpy(k->hw.vram, initial_vram, VRAM_SIZE);
    if (initial_cgram) memcpy(k->hw.cgram, initial_cgram, CGRAM_SIZE);

    // 3. Initialize PPU Registers for Intro Mode 1
    k->hw.ppu_regs[0x07] = 0x00; // BG1SC
    k->hw.ppu_regs[0x08] = 0x08; // BG2SC
    k->hw.ppu_regs[0x09] = 0x10; // BG3SC
    k->hw.ppu_regs[0x0B] = 0x42; // BG1 NBA=$4000, BG2 NBA=$8000
    k->hw.ppu_regs[0x0C] = 0x06; // BG3 NBA=$C000

    if (SDL_Init(SDL_INIT_VIDEO) < 0) return false;
    k->window = SDL_CreateWindow("The Duel - SNES Mini OS (Beginning)", 
                               SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
                               SCREEN_WIDTH * 2, SCREEN_HEIGHT * 2, 0);
    k->renderer = SDL_CreateRenderer(k->window, -1, SDL_RENDERER_ACCELERATED);
    k->texture = SDL_CreateTexture(k->renderer, SDL_PIXELFORMAT_RGB24, SDL_TEXTUREACCESS_STREAMING, SCREEN_WIDTH, SCREEN_HEIGHT);

    printf("[SNES KERNEL] Initialized at the Beginning. ROM=%d KB\n", ROM_SIZE/1024);
    return true;
}

void snes_ppu_render_frame(SNES_Kernel *k, uint8_t *output_rgb) {
    memset(output_rgb, 0, SCREEN_WIDTH * SCREEN_HEIGHT * 3);
    
    // Intro uses BG1, BG2, BG3
    render_bg_mode1_dynamic(k, 2, output_rgb); // BG3
    render_bg_mode1_dynamic(k, 1, output_rgb); // BG2
    render_bg_mode1_dynamic(k, 0, output_rgb); // BG1
}

void snes_kernel_run(SNES_Kernel *k) {
    uint8_t *pixel_buffer = malloc(SCREEN_WIDTH * SCREEN_HEIGHT * 3);
    SDL_Event e;

    printf("[SNES KERNEL] Entering execution loop...\n");

    while (k->running) {
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT) k->running = false;
        }

        if (k->main_callback) k->main_callback();
        if (k->nmi_handler) k->nmi_handler();

        snes_ppu_render_frame(k, pixel_buffer);
        SDL_UpdateTexture(k->texture, NULL, pixel_buffer, SCREEN_WIDTH * 3);
        
        SDL_RenderClear(k->renderer);
        SDL_RenderCopy(k->renderer, k->texture, NULL, NULL);
        SDL_RenderPresent(k->renderer);

        k->frame_count++;
    }

    free(pixel_buffer);
}

void snes_kernel_stop(SNES_Kernel *k) {
    k->running = false;
    SDL_DestroyTexture(k->texture);
    SDL_DestroyRenderer(k->renderer);
    SDL_DestroyWindow(k->window);
    SDL_Quit();
}

uint8_t* snes_get_rom_ptr(SNES_Kernel *k, uint32_t addr) {
    uint32_t bank = (addr >> 16) & 0x7F;
    uint32_t offset = addr & 0x7FFF;
    return &k->hw.rom[bank * 0x8000 + offset];
}

void snes_dma_transfer(SNES_Kernel *k, uint8_t channel, uint32_t src_addr, uint16_t dest_reg, uint16_t size) {
    uint8_t *src_ptr = (src_addr < ROM_SIZE) ? &k->hw.rom[src_addr] : &k->hw.wram[src_addr - ROM_SIZE];
    if (dest_reg == 0x2122) {
        memcpy(k->hw.cgram, src_ptr, size > CGRAM_SIZE ? CGRAM_SIZE : size);
    } else if (dest_reg == 0x2118) {
        static uint16_t vram_ptr = 0;
        memcpy(&k->hw.vram[vram_ptr], src_ptr, size > (VRAM_SIZE - vram_ptr) ? (VRAM_SIZE - vram_ptr) : size);
        vram_ptr += size;
    }
}

void snes_write_reg(SNES_Kernel *k, uint16_t addr, uint8_t val) {
    if (addr >= 0x2100 && addr < 0x2200) k->hw.ppu_regs[addr & 0xFF] = val;
    else if (addr >= 0x4200 && addr < 0x4300) k->hw.cpu_regs[addr & 0xFF] = val;
}

uint8_t snes_read_reg(SNES_Kernel *k, uint16_t addr) {
    if (addr >= 0x2100 && addr < 0x2200) return k->hw.ppu_regs[addr & 0xFF];
    else if (addr >= 0x4200 && addr < 0x4300) return k->hw.cpu_regs[addr & 0xFF];
    return 0;
}
