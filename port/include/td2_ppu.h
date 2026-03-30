#ifndef TD2_PPU_H
#define TD2_PPU_H

#include "td2_types.h"

uint32_t snes_cgram_word_to_argb(uint16_t word);

void snes_bg_scene_free(SnesBgScene *scene);
bool snes_bg_scene_load(
    const char *vram_path,
    const char *cgram_path,
    const char *state_path,
    const char *oam_path,
    SnesBgScene *scene
);

/* Load per-scanline Mode 7 parameters from a JSON sidecar.
 * The sidecar is expected next to the ppu_state.json as
 * ppu_state_visible.json, containing an array of per-scanline
 * matrix/scroll overrides. Returns true if loaded, false if
 * the file doesn't exist or parsing fails (non-fatal). */
bool snes_bg_scene_load_scanline_params(const char *state_path, SnesBgScene *scene);

void render_snes_bg_scene(AppState *app);

#endif /* TD2_PPU_H */
