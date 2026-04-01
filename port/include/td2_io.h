#ifndef TD2_IO_H
#define TD2_IO_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define TD2_FRAME_WIDTH 256
#define TD2_FRAME_HEIGHT 224
#define TD2_FRAME_PIXELS (TD2_FRAME_WIDTH * TD2_FRAME_HEIGHT)
#define TD2_VRAM_BYTES 0x10000
#define TD2_CGRAM_BYTES 0x0200
#define TD2_OAM_BYTES 0x0220
#define TD2_PPU_LAYER_COUNT 4

typedef struct {
    int tilemap_address;
    int chr_address;
    bool double_width;
    bool double_height;
    bool large_tiles;
    int hscroll;
    int vscroll;
} Td2PpuLayerState;

typedef struct {
    bool fill_with_tile0;
    bool horizontal_mirroring;
    bool vertical_mirroring;
    bool large_map;
    int center_x;
    int center_y;
    int hscroll;
    int vscroll;
    int matrix[4];
} Td2Mode7State;

typedef struct {
    int width;
    int height;
    uint8_t* pixels;
} Td2RgbImage;

typedef struct {
    char root_dir[1024];
    char raw_dir[1024];
    unsigned frame_number;
    bool has_frame_number;
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
    Td2RgbImage main_visible;
    uint8_t* vram;
    size_t vram_size;
    uint8_t* cgram;
    size_t cgram_size;
    uint8_t* oam;
    size_t oam_size;
} Td2DesignPack;

bool td2_design_pack_load(
    Td2DesignPack* pack,
    const char* scene_dir,
    char* error,
    size_t error_size
);
void td2_design_pack_free(Td2DesignPack* pack);

#endif
