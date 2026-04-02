# Track 1 `b_hold` Cycle `0076..0156`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Capture source:
  - `tools/out/track1_seed_sweep_v2_current/b_hold/capture_input_log.json`
- Sequence builder:
  - `tools/build_capture_sequence_manifest.py`
  - `make -C tools track1-b-hold-cycle`
- Screenshot-backed runtime artifacts:
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`

## Window Reading

- Input schedule:
  - hold `b` from script frames `60..359`
- Selected window:
  - script frames `76..155` (`end_frame_exclusive = 156`)
- Collapsed sequence:
  - `5` image entries
  - `4` distinct screenshot states
  - state changes every `16` frames at `76`, `92`, `108`, `124`, and `140`
- Practical cadence read:
  - the frame `140` entry reuses the same image as frame `76`
  - this gives a first screenshot-backed `64`-frame visual cycle for the track
    start state

## Callback And Context Notes

- The exact raw/probe binding is still strongest on the overlapping static raw
  window documented in `track1_seed_0086_0093.md`:
  - frame `86` matches the raw render at `0` mismatched pixels
  - raw frames `86..93` stay static in the flat dump
  - `active_main = 00:8029`
  - `active_nmi = 00:8029`
  - tracked `$0202/$0204/$0206/$0208/$020A/$040A/$0054` stay `0`
- This new screenshot-backed cycle overlaps that exact window on its first
  state and covers the known screenshot-validated frame `86`, but the
  screenshot-side transition at frame `92` is still the next unbound
  `VRAM/CGRAM/OAM/PPU` / probe edge.

## Current Blocker

- Current raw/probe follow-up artifacts for the same seed lane:
  - `tools/out/track1_b_hold_0086_0108_v1.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_86_92.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_92_108.json`
  - `tools/out/track1_b_hold_probe_0086_0108_v1/td2_boot_probe.json`
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`
- Current blocker reading:
  - screenshot states still change at `92` and `108`
  - end-of-frame raw `VRAM/CGRAM/OAM/PPU` stays unchanged at both transitions
  - end-of-frame probe fields remain flat at `86`, `92`, and `108`
  - visible-scanline sampling now shows the gameplay screenshot lane really
    lives on a different phase:
    - visible frame state runs under `02:9016` with alternating
      `01:96A0/01:960D` IRQ behavior
    - `ppu.mainScreenLayers` toggles between `0x13` and `0x17`
    - `bg2`/`bg3` scroll fields vary across visible scanlines
  - practical result: the blocker is no longer “raw vs screenshot exist on
    different phases”; that part is now explained
  - the remaining blocker is that frames `86`, `92`, and `108` still share the
    same sampled visible-phase `PPU` pattern except for the visible-phase queue
    cursor pair `7E:0053/0054`
  - the added bank-1 producer-side WRAM/window/OAM fields also stay flat
    across those three frames
  - `cpu.d = 0` rules out a hidden direct-page base change
  - explicit visible-phase queue samples now show
    `00:0053/0054 == 7E:0053/0054` during the visible phase, with
    `0x38/0x38` at frame `86` and `0x48/0x48` at `92/108`
  - those same samples show `queue_dma_active_descriptor_count = 0` on every
    visible scanline, so the cursor move is not an active backlog increase
  - widened late-phase tracing now splits the reset into two stages:
    - scanline-local frame `86` tracing catches only
      `00:0053/0055/0056 = 0x38/0x90/0x15` at frame `87`, scanline `228`
      while `00:0054` stays `0x38` under `02:9016`
    - frame-boundary follow-up now shows that same `02:9016` /
      `0x38/0x38/0x90/0x15` state still holds at frame `86 end`, frame `87`
      start, and through at least frame `87`, scanline `97`
    - wider follow-ups now keep the same state through frame `87 end`, frame
      `88 start`, frame `88 end`, frame `89 start`, and at least frame `89`,
      scanline `96`, with the same late write trio repeating on frames `88`
      and `89`
    - shifted `88` tracing now records the first direct visible-path
      `00:0054` advance on frame `90`:
      - `0x38 -> 0x40` at scanline `30`
      - `0x40 -> 0x48` at scanline `54`
      - `00:0053` still stays at `0x38`
    - shifted `90` tracing now records the equalized gameplay state directly:
      - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
      - frame `91 start/end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
      - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
      - frame `91`, scanline `229`: `00:0053 = 0x48`,
        `00:0055/0056 = 0xB8/0x14`
      - frame `92`, scanline `227`: `00:0055/0056` resets to `0x90/0x15`
    - helper-side write tracing at `7E:1E24/1E26/070C/0718` stays negative in
      that same `90..92` window
    - the older boot-probe lane still collapses later to
      `00:0053/0055/0056 = 0x00/0x84/0x17` under `00:8029`

## Initial Bank10/Bank11 Pointers

- Bank 10 follow-up anchors from `rom_analysis/code/physics.asm`:
  - external entry candidates: `$0A:0000`, `$0A:5322`, `$0A:8759`,
    `$0A:9FB5`, `$0A:B634`
- Bank 11 follow-up anchors from `rom_analysis/code/render.asm`:
  - gameplay split/IRQ helpers in bank 0: `L000341`, `L000361`
  - render-state targets: `$0F32-$0F41` scroll cache and HDMA-related writes

## Practical Reading

- The first moving gameplay artifact now exists without reopening the blocked
  early `start_then_a_hold` raw-bridge lane.
- The next best gameplay step is to extend the visible-phase debugger path from
  `track1_b_hold_visible_scanline_0086_0108.md`, preferably around
  the visible-phase queue cursor pair `7E:0053/0054`, until one of the later
  cycle states (`92` or `108`) binds cleanly to the real late-phase handoff
  that drops the cursor from `02:9016` / `0x38|0x48` to `00:8029` / `0x00`.
  The immediate next proving lane is now narrower: bind the producer/reset path
  behind the frame-`91` `00:0053/0055/0056` burst and the frame-`92` reset
  back to `0x48/0x48/0x90/0x15`.
