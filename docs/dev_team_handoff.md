# Dev Team Handoff: Current SNES Bank Read

This handoff is the current human-readable bridge between the SNES
disassembly and the C/SDL port effort. It intentionally favors promoted bank
ownership and pseudocode over raw assembly detail.

## 1. Promoted Bank Roles

### Validated

- **Bank 0** is the kernel: callback staging, `RESET/NMI/IRQ`, queue helpers,
  and the final NMI-side upload path.
- **Bank 1** is the front-end bridge bank: selector helpers, content
  materialization, gameplay handoff at `01:902D`, and the validated gameplay
  IRQ family `01:960D -> 01:96A0 -> 01:97B1/97E1/9809` that owns the visible
  split/window/color-math lane.
- **Bank 2** is the promoted gameplay family: `02:9016` main,
  `02:8F3C` NMI, plus visible HUD/OAM work such as `L0108EF` and the
  heavier selector-to-runtime builder `L0110B2 -> L011551`.
- **Bank 11** is a gameplay-support render bank, not a top-level scheduler:
  the current promoted read is “prepare road/scanline-visible operands for the
  gameplay callback family and its IRQ-visible split.”

### Active / still being typed

- **Bank 10** is the gameplay-support physics/AI bank. It is downstream of
  gameplay callbacks, not the scheduler root.
- **SNES bank $15** is now narrowed from “unknown” to an object-payload
  catalog bank; in this repo that maps to [bank21.asm](/home/nivando/asmdump/bank21.asm), not
  [bank15.asm](/home/nivando/asmdump/bank15.asm). The strongest closed example is the late frame-`3250`
  object `15:B4A8 -> 15:B4B8 -> VRAM 0x6180`.
- **Bank 30** is the compressed dispatch/data bank. Consumers and several
  table-confirmed payload families are known, but `DA96` and `EE7F` remain
  active unresolved provenance targets.

## 2. Human Pseudocode

### Front-end to gameplay handoff

```c
void frontend_step(void) {
    mutate_live_selector_block_in_wram();
    if (!bank1_selector_helpers_accept_current_state()) {
        return;
    }

    DerivedBundle bundle = bank1_collapse_selector_state();
    bank1_materialize_bundle_assets(bundle);  // VRAM/CGRAM/OAM staging

    if (bundle_closes_gameplay_entry()) {
        active_main = 0x029016;
        active_nmi = 0x028F3C;
        active_irq = 0x0196A0;
    }
}
```

### Gameplay-family frame read

```c
void gameplay_family_029016(void) {
    bank2_build_runtime_profiles_from_selectors();
    bank10_step_physics_ai_collision();
    bank11_prepare_road_and_visible_split_operands();
    bank2_stage_hud_oam_queue_state();

    if (late_gameplay_needs_small_streamed_object()) {
        ObjectDesc obj = bank21_select_object_payload();
        bank0_queue_dma_upload(obj);
    }
}

void gameplay_irq_family_01960d_0196a0(void) {
    apply_bg1_mode_from_11ab();

    if (late_visible_phase_is_armed()) {
        arm_window_and_color_math();
        apply_multi_scanline_bg3_bg1_split();
    }
}

void bank0_nmi(void) {
    upload_staged_oam();
    process_dma_queue();
    present_the_frame();
}
```

### Asset materialization read

```c
void bank1_materialize_bundle_assets(DerivedBundle bundle) {
    RawOrPacked src = resolve_bundle_source(bundle);
    DecodedAsset asset = bank30_dispatch_or_decompress(src);
    copy_asset_into_vram_cgram_oam_working_sets(asset);
}
```

## 3. What The Port Team Should Build Around

- Treat **callback ownership** as the main architectural spine:
  `bank0 -> bank1/bank2`, not “one monolithic gameplay loop.”
- Treat the bank-1 IRQ family as a real runtime surface:
  it reprograms visible PPU state mid-frame and is not just bookkeeping.
- Treat bank-2 `L011551` as the first strong selector-to-runtime builder:
  it turns `$1C78/$1C7A/$1C76` into generated gameplay working tables rather
  than only copying presentation assets.
- Treat **bank10** and **bank11** as service banks consumed by the gameplay
  callback family.
- Treat **bank21/$15** and **bank30/$1E** as typed support banks whose
  selector paths still need archaeology, but whose role in the pipeline is
  already clear enough for pseudocode and interface planning.
- Keep the port centered on **SNES-like runtime state**:
  `WRAM`, `VRAM`, `OAM`, `CGRAM`, callback slots, and queue/NMI ownership.

## 4. Immediate Disassembly Priorities

1. Close more of the gameplay-side selector path that reaches the SNES-bank-`$15`
   object family behind the frame-`3250` queue descriptor.
2. Keep narrowing the two remaining unresolved bank-30 provenance targets:
   `DA96` and `EE7F`.
3. Continue turning bank10/bank11 service behavior into bank-scoped pseudocode
   and interface contracts instead of only line-by-line assembly notes.

## 5. Team Reading Order

- `BANK_INVESTIGATION_DATAGRAM.md`
- `rom_analysis/docs/bank2_gameplay_entry_human.md`
- `rom_analysis/docs/bank1_irq_callback_96a0_human.md`
- `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/snes_bank15_object_catalog_human.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `docs/engine_pseudocode.md`
- `docs/bank_disassembly_status.md`
