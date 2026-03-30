#include "engine.h"
#include <stdio.h>
#include <stdlib.h>

void save_ppm(const char *filename, uint8_t *buffer) {
    FILE *f = fopen(filename, "wb");
    fprintf(f, "P6\n256 224\n255\n");
    fwrite(buffer, 1, 256 * 224 * 3, f);
    fclose(f);
}

int main() {
    GameState state = {0};
    uint16_t h_table[224];
    uint16_t v_table[224];
    uint8_t *frame_buffer = malloc(256 * 224 * 3);

    state.world.gear = 1;
    state.world.player_x = 0x8000;
    state.world.curvature = 30;

    printf("Generating Accurate Demo Frame (Road + Sprite)...\n");

    for (int frame = 0; frame < 60; frame++) {
        physics_update(&state);
        rasterizer_update(&state, h_table, v_table);
    }

    render_to_buffer(h_table, v_table, frame_buffer);
    render_sprites(&state, frame_buffer);
    save_ppm("accurate_scene.ppm", frame_buffer);

    printf("Demo complete. Saved to accurate_scene.ppm\n");
    free(frame_buffer);
    return 0;
}
