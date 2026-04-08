# Bank Disassembly Status Report

This report tracks the analysis and disassembly status of all 32 ROM banks ($00-$1F).

| Bank | Address | Primary Function | Status | Notes |
|------|---------|------------------|--------|-------|
| $00 | $00:8000 | Kernel / RESET / NMI / IRQ / callback staging | **Advanced** | Owns callback slots/staging, DMA helpers, and the NMI-side upload spine that consumes queue/OAM work prepared by gameplay banks. |
| $01 | $01:8000 | Front-end corridor / gameplay handoff / gameplay IRQ | **Advanced** | `01:902D` stages `02:9016` + `02:8F3C`; validated gameplay IRQ family `01:960D -> 01:96A0 -> 01:97B1/97E1/9809` now reads as the visible BG split/window/color-math lane, while bank-1 helpers still own much of menu materialization. |
| $02 | $02:8000 | Gameplay main family / HUD / runtime-table staging | **Active** | Current promoted gameplay callbacks are `02:9016` (main) and `02:8F3C` (NMI); bank also owns visible HUD/OAM work such as `L0108EF` plus the heavier gameplay-entry builder `L0110B2 -> L011551` keyed by `$1C78/$1C7A`, which is separately invoked from bank 1 rather than called by `02:9016`. |
| $03 | $03:8000 | Palettes | **Asset Done** | Bank 3 palette extractor is operational. |
| $04 | $04:8000 | Text / Strings | **Asset Done** | String blocks for menus identified. |
| $05 | $05:8000 | TBD | Queued | |
| $06 | $06:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $07 | $07:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $08 | $08:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $09 | $09:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $0A | $0A:8000 | Physics / AI support core | **Active** | Gameplay-facing service bank under the `02:9016` family. Best current human read: step car/traffic state, collisions, and AI inputs, then hand back render-visible state instead of owning the top-level scheduler. |
| $0B | $0B:8000 | Road raster / scanline-visible prep | **Advanced** | Proven gameplay-support bank, not a top-level scheduler. Current promoted read: build road/scanline operands and feed the `01:96A0` visible split/IRQ family. |
| $0C | $0C:8000 | Unmapped / Empty | **Advanced** | 0x6000 bytes of empty space ($00). Ends with Bank 13 start. |
| $0D | $0D:8000 | Track / Scenario | **Advanced** | Bit-stream compressed data (26 FB). Decompressed via L000E2B. |
| $0E | $0E:8000 | Track / Scenario | **Advanced** | Bit-stream compressed data (26 FB). Extension of Bank 13. |
| $0F | $0F:8000 | TBD | Queued | No promoted object-catalog proof is currently attached to this bank. |
| $10 | $10:8000 | TBD | Queued | |
| $11 | $11:8000 | TBD | Queued | |
| $12 | $12:8000 | Track / Scenario | **High Priority** | Road segment data. Empty space at start. |
| $13 | $13:8000 | Track / Scenario | **High Priority** | Road segment data. Contains RTLs. |
| $14 | $14:8000 | Track / Scenario | **High Priority** | Road segment data. Contains RTLs. |
| $15 | $15:8000 | Object payload catalogs | **Active** | Late gameplay can still stream small objects from this SNES bank; the current best closed example is the `15:B4A8 -> 15:B4B8 -> VRAM 0x6180` one-tile upload in the frame-`3250` counterexample. In this repo that SNES bank maps to [bank21.asm](/home/nivando/asmdump/bank21.asm), not [bank15.asm](/home/nivando/asmdump/bank15.asm). |
| $16 | $16:8000 | TBD | Queued | |
| $17 | $17:8000 | TBD | Queued | |
| $18 | $18:8000 | Audio (SPC700 / BRR) | **Queued** | Music and samples. |
| $19 | $19:8000 | Audio (SPC700 / BRR) | **Queued** | Music and samples. |
| $1A | $1A:8000 | TBD | Queued | |
| $1B | $1B:8000 | TBD | Queued | |
| $1C | $1C:8000 | TBD | Queued | |
| $1D | $1D:8000 | TBD | Queued | |
| $1E | $1E:8000 | Compressed dispatch / data services | **Active** | Consumers are known and table-confirmed entries exist, but the active unresolved queue still includes `DA96` and `EE7F`; keep this bank in active archaeology instead of treating it as closed. |
| $1F | $1F:8000 | TBD | Queued | |

## Legend
- **Advanced:** High confidence in logic and data structures.
- **Active:** Under active reverse-engineering.
- **Asset Done:** Data formats identified and extractors built.
- **High Priority:** Critical for core gameplay parity.
- **Queued:** Not yet analyzed.

## Current Team Pseudocode Read

```c
void snes_frame_tick(void) {
    bank0_promote_pending_callbacks();
    bank0_dispatch_active_main_irq_nmi();

    if (active_main == 0x029016) {
        bank10_step_physics_and_ai();
        bank11_prepare_road_and_visible_scanline_state();
        bank2_stage_hud_oam_and_queue_state();

        if (late_gameplay_needs_small_object_stream()) {
            bank21_select_object_payload();
            bank0_queue_dma_descriptor_for_nmi();
        }
    }
}

void frontend_materialize_selection(void) {
    bank1_validate_selector_helpers();
    bank1_collapse_live_wram_selectors_into_bundle();
    bank30_dispatch_compressed_or_raw_assets();
    bank1_stage_vram_cgram_oam_working_set();
}
```

This is the current “human” read for the dev team:

- `bank0` is the kernel and upload owner
- `bank1` is the strongest validated bridge from front-end into gameplay and
  owns the promoted gameplay-visible IRQ split lane
- `bank2` is the promoted gameplay callback family
- `bank10` and `bank11` are gameplay-support service banks
- `bank21/$15` and `bank30/$1E` are support/content banks whose consumers are known, while some selector/provenance edges remain open
