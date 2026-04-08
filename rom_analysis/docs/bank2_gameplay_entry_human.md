# Bank 2 Gameplay Entry In Human Terms

Date: `2026-04-08`

This note translates the currently promoted gameplay-entry corridor into
plain language for the dev team. It is intentionally scoped to what is
already visible from the disassembly and promoted callback evidence.

## Proven Entry Spine

The strongest currently promoted gameplay-entry chain is:

```text
bank1 01:902D
  -> install active_irq = 01:96A0
  -> install active_main = 02:9016
  -> install active_nmi = 02:8F3C
  -> fall into 01:9111
```

The callback install is explicit in [bank1.asm](/home/nivando/asmdump/bank1.asm)
at the `01:902D` corridor:

- `ldx #$96A0 ; jsl L000341`
- `ldx #$9016 ; jsl L000385`
- `ldx #$8F3C ; jsl L0003A0`

That means the current gameplay family is not inferred only from probes. The
front-end bank really does stage those exact downstream targets.

## What Bank 1 Does Before Falling Into Gameplay

The immediate bank-1 setup around `01:924B..01:9395` is not yet fully named,
but its role is already readable:

- wait for DMA/OAM quiet points (`$096A == 0`)
- call into bank 2 bootstrap helpers
- seed gameplay-facing WRAM state:
  - `11DF`
  - `1C9C`
  - `1E2A`
  - `137C`
  - `1C9E/1CA0/1CA2/1CA4/1CA6`
  - `1CC2`
- clear/reset slot/list state around:
  - `117D..`
  - `129D`
  - `125D/125F`
  - `129B/129F/126F/1271`
- then jump into `01:9111`

Current human read:

```c
void bank1_stage_gameplay_family(void) {
    install_irq_callback(0x0196A0);
    install_main_callback(0x029016);
    install_nmi_callback(0x028F3C);

    wait_for_dma_idle();
    bank2_bootstrap_gameplay_state();
    seed_gameplay_wram_fields();
    clear_runtime_lists_and_counters();
    enter_bank1_gameplay_bridge();
}
```

## First Proven Bank-2 Bootstrap Helper: `L0110BE`

The clearest early bank-2 helper in this corridor is
[bank2.asm](/home/nivando/asmdump/bank2.asm) `L0110BE`.

Its current human role is:

- choose one or more HUD/label/object rows based on gameplay state
- stage them through `L00179B`
- wait for `$096A == 0`
- refresh several gameplay-visible helper surfaces
- call `L0015BD` to arm the NMI-side OAM upload

The strongest visible reads:

- it branches on `$1C86`
- it consults `$118F`
- it stages rows using:
  - `L00179B`
  - source base `0x3000`
  - row ids around `0x47`, `0x4A`, `0x4B + nibble`
- after staging, it calls:
  - `L012F48`
  - `L01318D`
  - `L01070A`
  - `L0108EF`
  - `L0015BD`

Current human pseudocode:

```c
void bank2_bootstrap_gameplay_state(void) {
    reset_local_scroll_and_state_pairs();

    if (state_1C86 == 0) {
        stage_label_row(0x47, 0x0080, 0x0032, 0x3000);
    } else if (state_118F != 7) {
        stage_optional_row_from_lookup();
        stage_label_row(low_nibble_lookup + 0x4B, 0x00AB, 0x0032, 0x3000);
        stage_label_row(0x4A, 0x0080, 0x0035, 0x3000);
    }

    wait_for_dma_idle();
    rebuild_gameplay_buffers();
    rebuild_actor_or_world_lists();
    rebuild_hud_surface();
    update_radar_markers();   // L0108EF
    arm_oam_dma_for_nmi();    // L0015BD
}
```

This is already enough to say that bank 2 is doing real gameplay-visible
bootstrap work, not only receiving control from bank 1 and immediately
tail-calling elsewhere.

## Proven HUD Refresh Helper: `L010930`

`L010930` is not the whole gameplay loop either. It is a narrower HUD/state
update helper.

The strongest current read:

- it gates on frame bit `($0964 & 0x20)`
- it reacts to gameplay-relative state:
  - `$12AB`
  - `$11F1/$11F5`
  - `$11CD`
  - `$11CE`
- it updates digit-like fields:
  - `$12B9`
  - `$12BA`
  - `$12BB`
- when the selected HUD state changes, it writes a special `FFFE` descriptor
  into the `$0600` queue from tables at:
  - `$145A,Y`
  - `$145C,Y`

Current human pseudocode:

```c
void bank2_update_gameplay_hud_state(void) {
    uint16_t hud_state = select_hud_variant_from_frame_and_race_state();

    if (special_transition_condition()) {
        trigger_audio_and_list_updates();
        decode_speed_into_display_digits();   // 12B9/12BA/12BB
        rebuild_hud_digits_and_panels();
    }

    if (hud_state != cached_hud_state) {
        cached_hud_state = hud_state;
        queue_special_hud_upload_from_145A_145C_tables(hud_state);
    }
}
```

This is useful for the port because it identifies a bank-2 helper that is
already queue-writing and HUD-oriented before we fully decode the larger
`02:9016` body.

## Proven Cleanup Helper: `L011BD0`

`L011BD0` is a small but readable list-maintenance helper:

- it only activates when `$12AB >= 2`
- it scans the slot list at `$1281`
- it removes the first entry equal to `4`
- it compacts the list and updates associated counters
- it resets `$12A9/$12AB`

Current human read:

```c
void bank2_remove_type4_entry_and_compact_list(void) {
    if (state_12AB < 2) {
        reset_type4_flags();
        return;
    }

    int slot = find_entry(list_1281, 4);
    if (slot >= 0) {
        remove_and_compact(slot);
        update_126F_1271_counters();
    }
    reset_type4_flags();
}
```

The semantic meaning of “type 4” is still open, but the control behavior is
already clear enough for pseudocode and eventual runtime struct design.

## Proven Runtime Builder: `L0110B2 -> L011551`

The next heavy readable block after the anonymous `02:9016` gate is
`L0110B2`, which is just a wrapper around `L011551`.

Current best human role:

- consume the bank-1-collapsed selector fields
- build one generated runtime profile from `$1C7A`
- optionally post-process its span map through a small local transform table
- rebuild the active profile from `$1C78`
- seed the runtime fields for one-lane or two-lane gameplay depending on
  `$1C76`

The strongest current inputs are:

- `$1C78`
  - player-facing/front-end car selector
- `$1C7A`
  - rival/no-opponent-derived selector
- `$1C76`
  - rival-present flag
- `$1CCA`
  - derived bundle flag that changes spacing/range defaults
- `$1C6C`
  - mode/profile selector used for a later post-process transform

The strongest current outputs are:

- generated table families in `$14DC` and `$13FC`
- generated span/curve map in `$1A28`
- convergence checkpoints in `$1CF0/$1CF2`
- seeded runtime fields like:
  - `$1C9C`
  - `$11DF`
  - `$11F1/$11F3`
  - `$125D/$125F`
  - `$126F/$1271`

Current human pseudocode:

```c
void bank2_build_gameplay_profiles(void) {
    build_secondary_profile_from_1c7a();
    postprocess_secondary_span_map();
    build_primary_profile_from_1c78();
    seed_runtime_for_primary_and_optional_rival();
}
```

The exact semantic names are still open, but the function is already
classifiable as a generated gameplay-runtime builder rather than a menu or HUD
helper.

## What Is Still Open

These are the main unresolved edges for this bank lane:

- the full body and phase structure of `02:9016`
- the exact gameplay-side conditions that arm the bank-1 IRQ escalation
  `01:960D -> 01:96A0`
- the exact semantic ownership of the generated `$1A28 / $14DC / $13FC`
  surfaces coming out of `L011551`
- the selector logic inside the still-untyped `02:9016 .. 02:90B2` region
- the exact point where the SNES-bank-`$15` object family is chosen for the
  `3250` queue-backed BG1 upload

## Current Team Summary

The strongest current human read is:

1. bank 1 explicitly stages the gameplay callback family
2. bank 1 seeds gameplay WRAM and lists before falling through
3. bank 2 immediately performs real HUD/OAM/bootstrap work
4. bank 1 also owns the gameplay-visible IRQ split choreography through the
   staged `01:960D / 01:96A0` pair
5. bank 2 already has queue-writing helper paths that matter to visible
   gameplay state
6. the still-open heavy work is the selector/control block inside the main
   `02:9016` corridor, not whether this family is “real gameplay”
