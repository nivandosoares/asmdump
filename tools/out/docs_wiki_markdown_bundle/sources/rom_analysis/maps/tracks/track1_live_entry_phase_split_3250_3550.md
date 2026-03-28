# Track 1 Live-Entry Phase Split `3250 -> 3550`

- Note date: `2026-03-28`
- Route anchor:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- Goal:
  - promote the first late gameplay pair from the reproducible power-on route
    so lane 3 can compare a still-moving driving frame against a later
    overlay-dominated frame without depending on the preserved manual
    savestate/video alone

## What Was Added

- frame bundle builder:
  - `tools/build_gameplay_frame_bundle.py`
- bundle compare builder:
  - `tools/build_gameplay_bundle_compare.py`

## What Was Run

- late live-entry probe with gameplay-only `A` hold:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_late_probe_v1 --mode probe --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 240 --probe-total-frames 4800 --gameplay-input-windows '0-2750:a'`
- one-frame raw dumps from the same route:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3250 TD2_BG_RANGE_END_FRAME=3250 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3550 TD2_BG_RANGE_END_FRAME=3550 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03550 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
- bundle materialization with screenshot-derived support surfaces for human
  review:
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_frame03250_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03550 --frame 3550 --vram tools/out/lane3_live_entry_frame03550_frame_03550_vram.bin --cgram tools/out/lane3_live_entry_frame03550_frame_03550_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03550_frame_03550_ppu_state.json --oam tools/out/lane3_live_entry_frame03550_frame_03550_oam.bin --screenshot tools/out/lane3_live_entry_frame03550_frame_03550_frame.png --out-dir tools/out/lane3_live_entry_frame03550_bundle`
- bundle compare:
  - `python3 tools/build_gameplay_bundle_compare.py tools/out/lane3_live_entry_frame03250_bundle tools/out/lane3_live_entry_frame03550_bundle tools/out/lane3_live_entry_frame03250_vs_03550_compare.json --markdown-out tools/out/lane3_live_entry_frame03250_vs_03550_compare.md --label-a live_entry_3250 --label-b live_entry_3550`

## Promoted Artifacts

- `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_frame03250_frame_03250_frame.png`
- `tools/out/lane3_live_entry_frame03550_frame_03550_frame.png`
- `tools/out/lane3_live_entry_frame03250_bundle/`
- `tools/out/lane3_live_entry_frame03550_bundle/`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`

## Artifact Layout

- self-contained review bundle for the still-moving driving phase:
  - `tools/out/lane3_live_entry_frame03250_bundle/`
- self-contained review bundle for the later collision/overlay phase:
  - `tools/out/lane3_live_entry_frame03550_bundle/`
- compact pairwise compare:
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- live-entry probe anchor for the same late run:
  - `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`

Each bundle keeps the same top-level review surface:

- `frame.png`
- `main.png`
- `bg1.png`
- `bg2.png`
- `obj.png`
- `bg_stack_visible_support.png`
- `world_visible_support.png`
- `bg1.ppm`
- `bg2.ppm`
- `obj.ppm`
- `main_render.json`
- `bg1_render.json`
- `bg2_render.json`
- `obj_render.json`
- `raw/`
- `design_pack/`

## Visual Support

Primary wiki/gallery image refs for this pair:

- `tools/out/lane3_live_entry_frame03250_bundle/frame.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_frame03250_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg1.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg2.png`
- `tools/out/lane3_live_entry_frame03250_bundle/obj.png`
- `tools/out/lane3_live_entry_frame03550_bundle/frame.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_frame03550_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg1.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg2.png`
- `tools/out/lane3_live_entry_frame03550_bundle/obj.png`

## Raster Boundary

- the promoted `BG2` render is now better than the original blank/sky-only
  output because the bundle renderer finally respects `largeTiles = true`
  (`16x16` tile geometry)
- that fix is still not enough to make gameplay `BG2` a faithful human-facing
  extraction on its own:
  the visible road/world plane depends on per-scanline gameplay presentation,
  while the raw bundle still starts from one flat end-frame `ppu_state.json`
- practical rule:
  - use `world_visible_support.png` for human road/background labeling
  - use `bg2.png` for VRAM/PPU-state correlation only

## Current Reading

- the late live-entry route stays inside the same gameplay callback family at
  both frame anchors:
  - `3250`: `main/irq/nmi = 02:9016 / 01:96A0 / 02:8F3C`
  - `3550`: `main/irq/nmi = 02:9016 / 01:96A0 / 02:8F3C`
- the visual surface changes materially even though the top-level callback
  family does not:
  - frame `3250` is still open-road driving
  - frame `3550` shows a shattered-windshield collision overlay with
    `Cars Left: 4`
- the strongest bucket split is now explicit in machine artifacts:
  - `BG2` tilemap stats are identical across the pair:
    `66` unique tiles, `1536` non-zero entries, same top-tile distribution
  - `BG1` changes sharply:
    `458 -> 566` unique tiles and `1350 -> 1732` non-zero entries
  - `OBJ` also changes sharply:
    `31 -> 25` visible sprites while drawn pixels jump `916 -> 1961`
- practical fit:
  - the road/world plane stays live through the transition
  - the later collision/overlay phase loads primarily onto the
    cockpit/HUD/overlay side (`BG1`) plus `OBJ`
  - the screenshot-derived support surfaces are now the correct human-facing
    answer for the road/world side of this pair; the raw `BG2` render remains
    a state-only approximation
  - this means the right next memory targets for this specific transition are
    not the core road emitter fields first, but the overlay/collision-side
    workload that sits on top of the still-live road plane

## Why This Matters

- this is the first promoted late gameplay pair from the reproducible
  power-on route, not from the preserved manual seed
- it proves lane 3 can now do asset-first comparison on live gameplay entry
  itself
- it also gives a better boundary for future archaeology:
  - open-road / steering-heavy moments:
    prefer `BG2` and the `L01318D` road emitter split
  - collision / overlay / life-counter moments:
    prefer `BG1`, `OBJ`, and later OAM-side fields before reopening the road
    path

## Next Best Step

- repeat the same bundle/compare workflow on a checkpoint-oriented or
  police/radar-oriented pair, not only on this collision transition
- compare those future pairs against the preserved manual video stills so the
  route-live lane and the manual-seed lane share one bucket vocabulary
