# The Duel: Core Engine Pseudocode

## 1. Global Game State Structure

```c
typedef struct {
    uint16_t frame_counter; // $0964
    uint16_t speed;         // $11CE
    uint8_t  gear;          // $12B9
    uint16_t player_x;      // $11CD?
    uint16_t track_pos;     // Internal track distance
} WorldState;

typedef struct {
    uint16_t x;             // $11F1, $11F3, $11F5
    uint16_t y;             // Z-depth / Screen Y
    uint8_t  type;          // Car, Motorcycle, Police, Truck
    uint8_t  active;        // Is car within render range?
    uint16_t radar_oam_ptr; // $072C, $0730
} Actor;

typedef struct {
    WorldState world;
    Actor actors[3];
    uint8_t collision_flag;
} GameState;
```

## 2. Rendering & OAM Structures

```c
typedef struct {
    uint8_t x;
    uint8_t y;
    uint8_t tile_index;
    uint8_t attributes; // Palette, Priority, Flip
} SNES_OAM_Entry;

typedef struct {
    SNES_OAM_Entry entries[128]; // $0700 buffer
    uint8_t high_table[32];      // Size and X-bit
} RenderBuffer;
```

## 3. Logic Flow Pseudocode

### Gameplay Entry Builder
```c
void gameplay_entry_builder() {
    build_secondary_profile_from_1c7a();
    postprocess_secondary_span_map();
    build_primary_profile_from_1c78();
    seed_runtime_for_primary_and_optional_rival();
}
```

### Main Gameplay Loop (`callback_9016`)
```c
void gameplay_main_loop() {
    // 1. Process Input
    Joypad input = read_snes_joypad();
    
    // 2. Update Physics (Bank 10 / Bank 2)
    update_player_physics(input, &state.world);
    
    // 3. Update AI & Actors (Bank 10)
    for(int i=0; i<3; i++) {
        update_actor_ai(&state.actors[i], state.world.speed);
    }
    
    // 4. Collision Detection
    check_collisions(&state.world, state.actors);
    
    // 5. Prepare Render Data
    build_road_raster(&state.world); // Bank 11
    update_radar_markers(state.actors); // Bank 2 L0108EF
    apply_irq_visible_split(); // Bank 1 IRQ family 01:960D -> 01:96A0

    // 6. Stage DMA Queue
    queue_dma_uploads(); // $0600

    // 6a. Late gameplay can still stream small BG1 objects instead of relying
    // only on final VRAM. The current proven 3250 counterexample is a one-tile
    // object from SNES bank $15 (repo file bank21.asm) staged through the
    // queue-builder family.
    if (needs_late_bg1_tile_stream()) {
        QueueDescriptor desc = build_table_object_descriptor(
            /* table */ 0x15B4A8,
            /* payload */ 0x15B4B8,
            /* size */ 0x20,
            /* vram_dest */ 0x6180
        );
        queue_descriptor(desc);
    }
}
```

### IRQ Visible-Split Partner
```c
void apply_irq_visible_split() {
    apply_bg1_mode_from_11ab();

    if (late_visible_phase_is_armed()) {
        configure_window_color_math_and_bg3_scroll();
        schedule_followup_irq_slices();
        apply_bg1_scroll_from_dp_c2_c4_c5();
    }
}
```

### V-Blank / NMI Handler
```c
void snes_nmi_handler() {
    // 1. Copy staged OAM to hardware
    copy_to_snes_oam(render_buffer.entries);
    
    // 2. Process DMA Queue
    process_dma_queue(0x0600);
    
    // 3. Update Palette/VRAM if signaled
    if(state.world.frame_counter % 2 == 0) {
        update_animations();
    }
}
```

## Current Proven Constraint

```c
// Frame 3250 is the useful counterexample for the port:
// the visible BG1 state is not fully explained by final VRAM alone.
//
// Proven current read:
// - active main callback family: 02:9016
// - paired IRQ callback: 01:96A0
// - one visible queue descriptor appears on scanlines 46..223
// - descriptor bytes: 01 B8 B4 15 20 00 80 61
// - payload object: SNES $15:B4A8 -> $15:B4B8
// - destination: VRAM 0x6180 -> BG1 tile 396
//
// Port comparison target:
// emulate the selector -> IRQ-visible-split -> queue -> NMI handoff,
// not only seeded end-frame VRAM.
```
