# Track 1 Live-Race Visible Layer Stack

- Note date: `2026-03-27`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Guide hypothesis used for this pass:
  - the user-observed layer debugger read suggested a cockpit base plus a
    world/road layer and OAM-driven dynamic objects
  - this note treats that as a guide, not as prior truth

## What Was Run

- raw dump from the working manual live-race seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_bg0_silent.log 2>&1`
- scanline/PPU sample from the same seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_scanline0.log 2>&1`
- local derived analysis from that raw dump:
  - a temporary design pack built from the dumped `vram/cgram/oam/ppu_state`
  - temporary isolated renders for `BG1`, `BG2`, and `OBJ`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_layer_stack_summary.json`
- `tools/out/lane3_live_race_mid_layer_stack_summary.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`

## Current Reading

- the visible gameplay stack on the confirmed live-race `mid` sample is now
  materially narrower than the older heuristic:
  - `bgMode = 1`
  - `mainLayers = 0x13`
  - visible main-screen stack = `BG1 + BG2 + OBJ`
  - `subLayers = 0`
- `BG3` still exists in the raw `PPU/VRAM` state, but it is not enabled on the
  main or sub screen in this sample
- the scanline read gives the strongest current split between the two visible
  BG layers:
  - `BG1` stays scroll-stable across the sampled visible scanlines
  - `BG2` changes per scanline, including the wrapped `945/946` horizontal edge
    and the descending/wrapped vertical sequence
- practical fit to the user's observation:
  - `BG1` is now the strongest cockpit/HUD-base candidate
  - `BG2` is now the strongest road/world raster layer candidate
  - `OBJ` remains the strongest bucket for dynamic world/HUD actors
- code-side fit is now also stronger:
  - `bank1.asm` `L009075..L009111` arms the
    `02:9016 / 01:96A0 / 02:8F3C` family
  - `bank1.asm` `L009185` then enters `bank2.asm` `L011165`, which runs
    `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`, and `L0108EF`
    before the OAM flush
  - `bank2.asm` `2628..2644` arms HDMA channel `7` against destination
    register base `0x0F`, i.e. the `BG2` scroll register block, while
    `bank1.asm` `5846..5851` also writes `BG2VOFS` from `$22/$23`
  - practical read:
    the confirmed live-race sample already fits a rasterized road/world layer
    on `BG2` much better than a cockpit layer
- caveat:
  - the static single-state `BG2` render collapses to backdrop color on this
    sample; that does not disprove `BG2` visibility, because the scanline data
    shows `BG2` depends on per-line state that a single end-frame render does
    not reconstruct

## Negative Follow-Up Kept

- the same raw-dump helper wrappers were retried against
  `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- both returned exit code `255` under the headless helper path and produced no
  raw dump artifacts
- that failure is informative and should stay documented rather than silently
  dropped

## Boundary Recheck On Slot `#2`

- the preserved extra slot is now no longer just "unclassified backup":
  - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
- bounded recheck:
  - raw dump:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
  - scanline sample:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
  - short probe + compare:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
    `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- observed result:
  - slot `#2` does **not** reproduce the `live_race_mid` surface
  - its frame-`0` raw dump reads:
    - `bgMode = 1`
    - `mainLayers = 0x04`
    - visible stack = `BG3` only
  - its sampled scanlines stay flat on:
    - `BG1 h/v = 0 / 1023`
    - `BG2 h/v = 0 / 1023`
    - `BG3 h/v = 0 / 1023`
  - its short probe also stays on the older front-end/boundary callback
    family:
    - `main = 00:8029`
    - `irq = 00:835F`
    - `nmi = 00:8029`
  - the compare against `live_race_mid` differs on all `8/8` frames in the
    callback surface, selector surface, and live-race workload fields such as
    `state_09a2`, `state_11f3`, `dp_0053`, `dp_0054`, and `oam_0730`
- practical read:
  - slot `#2` is an adjacent boundary seed, not a second gameplay replicate
  - this strengthens the rule of using the user's layer observation as a guide
    only: it helps on the confirmed live-race sample, but not every nearby
    preserved savestate is gameplay

## Next Best Step

- do not use `slot2_extra` as the second-seed replication target; it is now a
  closed boundary seed
- if second-seed replication still matters, recover it from `live_race_plus30f`
  through a different export path such as the lab backend
- keep tracing which runtime path drives the per-scanline `BG2` scroll changes,
  since that path is now the strongest candidate for the visible road/world
  layer
