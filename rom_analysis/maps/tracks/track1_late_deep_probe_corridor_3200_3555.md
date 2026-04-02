# Track 1 Late Deep-Probe Corridor `3200..3555`

Date: 2026-04-02

## Scope

This note turns the late light-profile deep probe into a lane-3 corridor read.
The target is the late gameplay span that already contains the three promoted
anchors:

- `3250`
- `3400`
- `3550`

Primary artifacts:

- `tools/out/deep_probe_late_light/td2_boot_probe.json`
- `tools/out/deep_probe_late_light/td2_boot_probe_summary.md`
- `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.json`
- `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`

## What Was Run

- light late probe:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_TOTAL_FRAMES=3600 TD2_BOOT_PROBE_SAMPLE_EVERY=16 TD2_BOOT_PROBE_CAPTURE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_COMPARE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_CAPTURE_SCREENSHOTS=0 TD2_BOOT_PROBE_CAPTURE_PPU_MEMORY=0 TD2_BOOT_PROBE_CAPTURE_WRAM_MEMORY=0 TD2_BOOT_PROBE_TRACE_MODE7=0 TD2_BOOT_PROBE_TRACE_DMA=0 TD2_BOOT_PROBE_TRACE_VRAM=0 TD2_BOOT_PROBE_TRACE_L001210=0 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/deep_probe_late_light/td2_boot_probe ./validation/run_mesen_deep_probe.sh ./game.smc`
- corridor post-process:
  - `python3 tools/summarize_deep_probe_corridor.py tools/out/deep_probe_late_light/td2_boot_probe.json --frame-start 3200 --frame-end 3555 --output tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.json --markdown-out tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`

## Strongest Findings

- The late corridor still stays inside the same top-level family:
  - main callback: `02:9016`
  - IRQ callback: `01:96A0`
  - NMI callback on captures: `02:8F3C`
- The new narrowing is inside `L01318D`, not above it.
  - In `3200..3555`, the late-only emitter hits are:
    - `02:B0B1`
    - `02:B0BD`
  - Both appear only on odd frames `3201..3327`, `64` hits each, `step=2`.
  - In that same window there are `0` hits on:
    - `02:B042`
    - `02:B05D`
    - `02:B101`
    - `02:B134`
- Static read now lines up cleanly with the probe:
  - `02:B0B1` and `02:B0BD` are the high-index/default `L012BE2` setup path
    inside `L01318D`
  - `02:B101 -> L012D5A` is **not** the late path in this corridor
  - practical read:
    the probe is no longer saying only “same callback, different state”; it is
    saying “late gameplay enters the high-index default emitter branch”

## State/Queue Shape

- The late corridor is queue/builder-heavy and callback-stable.
- Strongest moving fields:
  - `state_11f3`: `169 -> 237`
  - `dp_0022`: `26 -> 0`
  - `dp_0053/0054`: `E8/E8 -> F0/F0 -> F8/F8 -> 10/10 -> ... -> E0/E0 -> D8/D8`
  - `state_09a2/state_09a8`: sustained workload oscillation, not family swap
- `state_129E` first turns on in the same late family:
  - `0` at `3250`
  - `0x0100` by `3360`, still set at `3400` and `3550`
- Stable fields across the late captures:
  - `state_0202 = FFFF`
  - `state_18EE = 0x09A4`
  - `state_1C70 = 0`
  - `state_1C76 = 1`
  - `selector_1C80 = 5`
  - `selector_1CAC = 7`

## Compare-Pair Read

- `2088 -> 3250`
  - same callback family
  - queue changes from `active=1` to `active=0`
  - strongest changed surfaces:
    - `VRAM`: `5970` bytes
    - `wram_0600_06ff`: `149` bytes
    - `wram_0700_07ff`: `110` bytes
- `3250 -> 3400`
  - still same callback family
  - `CGRAM` changes `0`
  - `wram_0200_020f`, `wram_1c60_1cef`, and `wram_1d00_1d3f` all stay flat
  - practical read:
    the `3250` counterexample is still not explained by front-end selector
    carry
- `3400 -> 3550`
  - still same callback family
  - `CGRAM` changes `0`
  - `VRAM` changes shrink to `951` bytes
  - practical read:
    `3400` and `3550` remain the positive late pair, with `3250` as the
    earlier queue/builder counterexample

## Useful Negative Result

- The heavy late profile with screenshots plus memory dumps did not justify a
  full rerun in this lane.
- It stalled after only:
  - `tools/out/deep_probe_late/td2_boot_probe_frame_00300.png`
- The light profile preserved the useful corridor evidence with a bounded run,
  so it is the current source of truth for this step.

## Practical Consequence

The next proving target should move one level deeper than “assign emitter
semantics in the cluster”.

Current best next question:

- what data path feeds the late high-index default branch
  `02:B0B1 / 02:B0BD -> L012BE2`
  starting at frame `3201`?

That means the next narrow pass should chase the values feeding:

- `$22`
- `$24`
- `$26`
- the `12F2/12F4`-indexed selector family

and it should *not* spend the next bounded trace on:

- callback-family handoffs
- the alternate `02:B101 -> L012D5A` branch
