#ifndef TD2_PPU_H
#define TD2_PPU_H

#include <stdbool.h>
#include <stdint.h>

#include "td2_io.h"

#define TD2_WRAM_BYTES 0x20000
#define TD2_PPU_TILE_CACHE_TILES 1024

typedef struct {
    bool enabled;
    unsigned line_count;
    uint8_t main_screen_layers[TD2_FRAME_HEIGHT];
    int layer_hscroll[TD2_PPU_LAYER_COUNT][TD2_FRAME_HEIGHT];
    int layer_vscroll[TD2_PPU_LAYER_COUNT][TD2_FRAME_HEIGHT];
} Td2PpuScanlineProfile;

typedef struct {
    uint8_t vram[TD2_VRAM_BYTES];
    uint8_t cgram[TD2_CGRAM_BYTES];
    uint8_t oam[TD2_OAM_BYTES];
    uint8_t bg_mode;
    uint8_t main_screen_layers;
    uint8_t sub_screen_layers;
    uint8_t brightness;
    bool forced_blank;
    bool mode1_bg3_priority;
    Td2Mode7State mode7;
    uint8_t oam_mode;
    uint16_t oam_base_address;
    uint16_t oam_address_offset;
    uint16_t internal_oam_address;
    unsigned ppu_frame_count;
    bool enable_oam_priority;
    bool obj_interlace;
    bool overscan_mode;
    Td2PpuLayerState layers[TD2_PPU_LAYER_COUNT];
    Td2PpuScanlineProfile scanline_profile;
    uint32_t cgram_colors[256];
    uint8_t tile_cache[TD2_PPU_LAYER_COUNT][TD2_PPU_TILE_CACHE_TILES][64];
    uint8_t tile_cache_valid[TD2_PPU_LAYER_COUNT][TD2_PPU_TILE_CACHE_TILES];
    unsigned frame_number;
    bool has_reference_frame;
} Td2PpuState;

void td2_ppu_reset(Td2PpuState* ppu);
void td2_ppu_seed_from_design_pack(Td2PpuState* ppu, const Td2DesignPack* pack);
void td2_ppu_render_frame(Td2PpuState* ppu, uint32_t* framebuffer_argb);

#endif
