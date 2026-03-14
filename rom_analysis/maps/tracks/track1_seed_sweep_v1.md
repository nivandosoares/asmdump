# Track 1 Seed Sweep `v1`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `make -C tools track1-seed-sweep`
- Sweep summary artifacts:
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`

## Bounded Scenario Set

- `b_hold`
  - input windows: `60-359:b`
- `start_then_b_hold`
  - input windows: `60:start;61-359:b`
- `start_then_a_hold`
  - input windows: `60:start;61-359:a`

## Sweep Result

- Dynamic scenarios:
  - `b_hold`
    - first nontrivial frame: `76`
    - first later motion: `92`
    - distinct screenshot hashes: `4`
  - `start_then_a_hold`
    - first nontrivial frame: `61`
    - first later motion: `65`
    - distinct screenshot hashes: `3`
- Static-seed scenario:
  - `start_then_b_hold`
    - first nontrivial frame: `64`
    - no later motion seen in the bounded `300`-frame capture

## Targeted Raw Follow-Up

- Captured a first moving-window raw dump for the earliest dynamic path:
  - `tools/out/track1_start_then_a_0061_0068_v1.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.txt`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_delta_61_65.json`
- Captured one exact-frame screenshot probe from the same dumper:
  - `tools/out/track1_start_then_a_frame61_probe_v1_frame_00061_frame.png`

## Current Blocker

- The early `start_then_a_hold` raw bridge does not currently align with the
  screenshot sweep:
  - raw frame `61` renders back as `bgMode = 0`, `mainScreenLayers = 0x00`
  - the dumper screenshot for frame `61` differs from the sweep screenshot
    (`capture_frame_00001.png`) by `51503` pixels
  - that mismatch stays flat across nearby sweep frames `60..70`
  - raw `VRAM`, `CGRAM`, `OAM`, and filtered `PPU` state stay unchanged
    between frames `61` and `65`

## Practical Reading

- `game_11.mss` does leave the static seed under at least two bounded scripted
  input paths, so gameplay-frame expansion is now unblocked at the screenshot
  level.
- The current blocker is no longer "find movement"; it is "bind that movement
  back to the raw `VRAM/CGRAM/OAM/PPU` surface without a capture mismatch."
- Per the blocker policy, the early `start_then_a_hold` raw bridge is now
  documented and parked after three narrowing attempts.
- The next defensible follow-up is either:
  - a screenshot-backed moving gameplay manifest from the sweep outputs, or
  - a later gameplay savestate whose raw dump aligns cleanly with the capture
    harness.
