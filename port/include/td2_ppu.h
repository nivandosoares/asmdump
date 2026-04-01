#ifndef TD2_PPU_H
#define TD2_PPU_H

#include <stdbool.h>
#include <stdint.h>

#include "td2_io.h"

#define TD2_WRAM_BYTES 0x20000

typedef struct {
    uint8_t vram[TD2_VRAM_BYTES];
    uint8_t cgram[TD2_CGRAM_BYTES];
    uint8_t oam[TD2_OAM_BYTES];
    uint8_t bg_mode;
    uint8_t main_screen_layers;
    uint8_t sub_screen_layers;
    uint8_t brightness;
    bool forced_blank;
    unsigned frame_number;
    bool has_reference_frame;
} Td2PpuState;

void td2_ppu_reset(Td2PpuState* ppu);
void td2_ppu_seed_from_design_pack(Td2PpuState* ppu, const Td2DesignPack* pack);
void td2_ppu_render_reference(
    const Td2PpuState* ppu,
    const Td2DesignPack* pack,
    uint32_t* framebuffer_argb
);

#endif
