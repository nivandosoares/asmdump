#ifndef TD2_TYPES_H
#define TD2_TYPES_H

#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>

enum {
    SCREEN_WIDTH = 256,
    SCREEN_HEIGHT = 224,
    TARGET_HZ = 60,
    COLORS_PER_PALETTE = 16,
    DEFAULT_WINDOW_SCALE = 3,
    MODE7_SCANLINE_MAX = 224
};

static const uint8_t OAM_SIZE_TABLE[8][2][2] = {
    {{1, 1}, {2, 2}},
    {{1, 1}, {4, 4}},
    {{1, 1}, {8, 8}},
    {{2, 2}, {4, 4}},
    {{2, 2}, {8, 8}},
    {{4, 4}, {8, 8}},
    {{2, 4}, {4, 8}},
    {{2, 4}, {4, 4}}
};

static const uint8_t MODE7_SPRITE_PRIORITIES[4] = {2, 4, 6, 7};

typedef struct {
    uint32_t *colors;
    size_t palette_count;
} PaletteBank;

typedef struct {
    uint8_t *pixels;
    int width;
    int height;
} ImageData;

typedef enum {
    INDEXED_ANIM_MODE_PALETTE_FRAMES = 0,
    INDEXED_ANIM_MODE_BALLISTIC_A39C = 1
} IndexedAnimMode;

typedef struct {
    bool loaded;
    IndexedAnimMode mode;
    uint8_t *indices;
    int width;
    int height;
    int palette_count;
    uint32_t *palette_frames;
    int *durations;
    size_t frame_count;
    size_t current_frame;
    int frames_remaining;
    uint8_t *helper_cgram;
    size_t helper_cgram_size;
    uint16_t *ramp_words;
    size_t ramp_word_count;
    int *class_cgram_indices;
    int dynamic_start;
    int dynamic_count;
    int counter_wrap;
    int step_frames;
    uint32_t *runtime_palette;
} IndexedPaletteAnimation;

typedef struct {
    int tilemap_address;
    int chr_address;
    bool double_width;
    bool double_height;
    bool large_tiles;
    int hscroll;
    int vscroll;
} SnesBgLayerState;

/* Per-scanline Mode 7 parameters for HDMA-driven rendering. */
typedef struct {
    int matrix[4];
    int hscroll;
    int vscroll;
    int center_x;
    int center_y;
} Mode7ScanlineParams;

typedef struct {
    bool loaded;
    int bg_mode;
    int main_screen_layers;
    bool mode7_fill_with_tile0;
    bool mode7_horizontal_mirroring;
    bool mode7_vertical_mirroring;
    bool mode7_large_map;
    int mode7_center_x;
    int mode7_center_y;
    int mode7_hscroll;
    int mode7_vscroll;
    int mode7_matrix[4];
    int oam_mode;
    int oam_base_address;
    int oam_address_offset;
    int internal_oam_address;
    int frame_count;
    bool enable_oam_priority;
    bool obj_interlace;
    bool overscan_mode;
    uint8_t *vram;
    size_t vram_size;
    uint8_t *cgram;
    size_t cgram_size;
    uint8_t *oam;
    size_t oam_size;
    uint32_t cgram_colors[256];
    SnesBgLayerState layers[3];
    uint8_t tile_cache[3][1024][64];
    uint8_t tile_cache_valid[3][1024];
    /* Per-scanline Mode 7 overrides (NULL = use single-frame params). */
    Mode7ScanlineParams *scanline_params;
    int scanline_param_count;
} SnesBgScene;

typedef enum {
    SEQUENCE_ENTRY_SNES_BG = 1,
    SEQUENCE_ENTRY_IMAGE = 2,
    SEQUENCE_ENTRY_INDEXED_ANIM = 3,
    SEQUENCE_ENTRY_BALLISTIC_A39C = 4
} SequenceEntryType;

typedef struct {
    SequenceEntryType type;
    int duration_frames;
    char *primary_path;
    char *secondary_path;
    char *tertiary_path;
    char *quaternary_path;
} SceneSequenceEntry;

typedef struct {
    bool loaded;
    bool loop;
    SceneSequenceEntry *entries;
    size_t count;
    size_t current_index;
    int frames_remaining;
} SceneSequence;

typedef struct {
    bool running;
    bool auto_cycle;
    int auto_quit_frames;
    size_t current_palette;
    uint64_t tick_count;
    uint64_t rendered_frames;
    const char *dump_prefix;
    PaletteBank palette_bank;
    ImageData image;
    IndexedPaletteAnimation indexed_anim;
    SnesBgScene snes_bg_scene;
    SceneSequence sequence;
    int image_offset_x;
    int image_offset_y;
    uint32_t framebuffer[SCREEN_WIDTH * SCREEN_HEIGHT];
} AppState;

#endif /* TD2_TYPES_H */
