#include "../include/td2_ppu.h"

#include <string.h>

static uint8_t scale_component(uint8_t component, uint8_t brightness) {
    return (uint8_t)((component * brightness) / 15U);
}

void td2_ppu_reset(Td2PpuState* ppu) {
    memset(ppu, 0, sizeof(*ppu));
    ppu->brightness = 15U;
}

void td2_ppu_seed_from_design_pack(Td2PpuState* ppu, const Td2DesignPack* pack) {
    td2_ppu_reset(ppu);

    ppu->bg_mode = pack->bg_mode;
    ppu->main_screen_layers = pack->main_screen_layers;
    ppu->sub_screen_layers = pack->sub_screen_layers;
    ppu->brightness = pack->brightness;
    ppu->forced_blank = pack->forced_blank;
    ppu->frame_number = pack->frame_number;
    ppu->has_reference_frame = pack->main_visible.pixels != NULL;

    if (pack->vram != NULL && pack->vram_size > 0U) {
        memcpy(ppu->vram, pack->vram, pack->vram_size < TD2_VRAM_BYTES ? pack->vram_size : TD2_VRAM_BYTES);
    }
    if (pack->cgram != NULL && pack->cgram_size > 0U) {
        memcpy(ppu->cgram, pack->cgram, pack->cgram_size < TD2_CGRAM_BYTES ? pack->cgram_size : TD2_CGRAM_BYTES);
    }
    if (pack->oam != NULL && pack->oam_size > 0U) {
        memcpy(ppu->oam, pack->oam, pack->oam_size < TD2_OAM_BYTES ? pack->oam_size : TD2_OAM_BYTES);
    }
}

void td2_ppu_render_reference(
    const Td2PpuState* ppu,
    const Td2DesignPack* pack,
    uint32_t* framebuffer_argb
) {
    unsigned y;

    if (ppu->forced_blank || pack->main_visible.pixels == NULL) {
        memset(framebuffer_argb, 0, TD2_FRAME_PIXELS * sizeof(*framebuffer_argb));
        return;
    }

    for (y = 0; y < TD2_FRAME_HEIGHT; y++) {
        unsigned x;
        for (x = 0; x < TD2_FRAME_WIDTH; x++) {
            unsigned pixel_index = (y * TD2_FRAME_WIDTH + x) * 3U;
            uint8_t r = scale_component(pack->main_visible.pixels[pixel_index + 0U], ppu->brightness);
            uint8_t g = scale_component(pack->main_visible.pixels[pixel_index + 1U], ppu->brightness);
            uint8_t b = scale_component(pack->main_visible.pixels[pixel_index + 2U], ppu->brightness);
            framebuffer_argb[y * TD2_FRAME_WIDTH + x] =
                0xff000000U |
                ((uint32_t)r << 16) |
                ((uint32_t)g << 8) |
                (uint32_t)b;
        }
    }
}
