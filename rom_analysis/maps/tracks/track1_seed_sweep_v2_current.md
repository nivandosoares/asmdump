# Track 1 Seed Sweep `v2_current`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v2_current`
- Sweep artifacts:
  - `tools/out/track1_seed_sweep_v2_current/summary.json`
  - `tools/out/track1_seed_sweep_v2_current/summary.md`

## Current Sweep Reading

- `b_hold`
  - input windows: `60-359:b`
  - classification: `dynamic`
  - first nontrivial frame: `76`
  - first later motion: `92`
  - distinct screenshot hashes: `4`
- `start_then_b_hold`
  - input windows: `60:start;61-359:b`
  - classification: `static_after_first_nontrivial`
  - first nontrivial frame: `64`
- `start_then_a_hold`
  - input windows: `60:start;61-359:a`
  - classification: `static_after_first_nontrivial`
  - first nontrivial frame: `64`

## Current Moving Window

- The current screenshot-backed gameplay cycle is documented in:
  - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
- Runtime-ready cycle artifacts:
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`

## Raw/Probe Blocker

- Raw dump lane for the same seed/input schedule:
  - `tools/out/track1_b_hold_0086_0108_v1.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_86_92.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_92_108.json`
- Seeded probe archive for the same frame window:
  - `tools/out/track1_b_hold_probe_0086_0108_v1/td2_boot_probe.json`
- Visible-phase debugger follow-up for the same frame window:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v4.json`
  - `tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes_summary.json`
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe_trace_summary.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0091_trace_v1.json`
- Current blocker reading:
  - screenshot lane still cycles on the expected `76/92/108/124/140` cadence
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `86 -> 92` and `92 -> 108`
  - seeded probe fields also stay flat at `86`, `92`, and `108`:
    - `active_main = active_nmi = 00:8029`
    - tracked `$0200/$0202/$0204/$0206/$0208/$020A/$040A/$0440/$0442/$0444/$1E2C/$0054 = 0`
  - visible-scanline sampling now proves the screenshot lane is using a
    different phase on the same seed:
    - visible phase runs under `active_main = 02:9016`
    - `active_irq` alternates between `01:96A0` and `01:960D`
    - `ppu.mainScreenLayers` toggles between `0x13` and `0x17`
    - the late-scanline `M7HOFS/M7VOFS/$210F-$2114` write pattern repeats on
      every frame `86..108`
  - the remaining unexplained edge is narrower:
    - frames `86`, `92`, and `108` still share the same sampled visible-phase
      `PPU` pattern except for the visible-phase queue cursor pair
      `7E:0053/0054`
    - the added bank-1 producer-side WRAM/window/OAM fields also stay flat
      across those three frames
    - `cpu.d = 0` rules out a hidden direct-page base change
    - explicit visible-phase queue samples now bind `00:0053/0054` to the same
      `7E:0053/0054` WRAM values, with frame `86` at `0x38/0x38` and frames
      `92/108` at `0x48/0x48`
    - those same samples show `queue_dma_active_descriptor_count = 0` on all
      visible scanlines even though the stale `0600` region still has
      `32` nonzero slots
    - mirrored bank exec tracing still records `0` queue-helper hits, so the
      old negative exec result was not just a `00:` vs `80:` mirror mistake
    - widened scanline-local tracing on frame `86` now reaches scanline `259`
      and catches an intermediate late write trio at frame `87`, scanline
      `228`: `00:0053/0055/0056 = 0x38/0x90/0x15` while `00:0054` stays `0x38`
      under `active_main = 02:9016`
    - frame-boundary follow-up now proves that same state survives across frame
      `86 end`, frame `87 start`, the frame-`87` scanline wrap
      (`261 -> 0`), and at least through frame `87`, scanline `97`
    - wider multi-frame follow-ups now prove the same state also survives frame
      `87 end`, frame `88 start`, frame `88 end`, frame `89 start`, and at
      least through frame `89`, scanline `96`
    - the same late write trio repeats on frames `88` and `89`, so this is a
      recurring post-visible `02:9016` stage rather than a one-frame quirk
    - shifted `88` follow-up now records the first direct visible-path
      `00:0054` producer:
      - frame `90`, scanline `30`: `00:0054 = 0x40`
      - frame `90`, scanline `54`: `00:0054 = 0x48`
      - `00:0053` remains `0x38` in that window
    - shifted `90` follow-up now records the equalized gameplay state directly:
      - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
      - frame `91 start/end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
      - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
      - frame `91`, scanline `229`: `00:0053 = 0x48`,
        `00:0055/0056 = 0xB8/0x14`
      - frame `92`, scanline `227`: `00:0055/0056` resets to `0x90/0x15`
    - resumed isolated `frame 91` rerun now reproduces the same reset window
      without the earlier `target_frame = 90` lead-in:
      - frame `91 start/end`: still `0x48/0x48/0xB8/0x14`
      - frame `92 start`: still `0x48/0x48/0x90/0x15`
      - the only traced writes remain the reset-side writes at
        frame `92`, scanline `227`
      - current candidate exec points
        (`02:9016`, `01:960D`, `01:96A0`, `01:9825`, `01:9868`, `00:8029`)
        still record `0` hits in that isolated rerun
    - helper-side write tracing at `7E:1E24/1E26/070C/0718` stays negative
      across that same `90..92` window
    - the older end-of-frame write trace still collapses later to
      `00:0053/0055/0056 = 0x00/0x84/0x17` under `active_main = 00:8029`

## Practical Reading

- The current gameplay seed still yields one defensible moving screenshot lane:
  `b_hold`.
- The blocker is now narrower than before:
  - the problem is not “find movement”
  - it is “explain which visible-phase gameplay fields distinguish the
    screenshot states at `86/92/108`”
  - the next best specific target is now “trace the producer/reset path behind
    the frame-`91` `00:0053/0055/0056` burst and the frame-`92` reset back to
    `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`,” not “keep widening
    bank-1 producer-state sampling”
- A one-off attempt to dump raw state directly from `mesen_capture.lua` was not
  kept, because enabling that path collapsed the `b_hold` lane to a static
  post-`86` capture and therefore changed the observed boundary.
