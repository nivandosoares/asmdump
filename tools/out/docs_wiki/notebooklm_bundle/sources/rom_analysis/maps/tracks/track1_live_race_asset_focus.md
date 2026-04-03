# Track 1 Live-Race Asset Focus

- Note date: `2026-03-28`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Goal:
  - promote the same asset-first workflow that accelerated lane 2, but now
    against confirmed gameplay so later lane-3 probes can target the right
    visible owner before widening memory/VRAM tracing

## What Was Added

- gameplay asset report builder:
  - `tools/build_gameplay_asset_report.py`
- repeatable target:
  - `make -C tools lane3-live-race-asset-focus`

## What Was Run

- asset-focus report build from the existing confirmed gameplay artifact set:
  - `make -C tools lane3-live-race-asset-focus`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_asset_focus.json`
- `tools/out/lane3_live_race_mid_asset_focus.md`

## Current Reading

- the lane now has a gameplay-facing asset inventory instead of only separate
  layer, producer, and seed notes
- the confirmed `live_race_mid` split is now practical to work from:
  - `BG1` = cockpit / dashboard / HUD base
  - `BG2` = road / horizon / world raster
  - `OBJ` = traffic, radar markers, and other dynamic actors
  - `BG3` = transient top-strip / split-phase auxiliary layer, not the main
    world plane on this sample
- that asset-first split immediately sharpens what to trace:
  - steering / curvature / road motion:
    `$22/$23`, `dp_0020/0022`, `BG2HOFS/BG2VOFS`, `next_irq_ptr`,
    `01:9185 -> 02:9165 -> 02:B18D`, and the narrowed emitter split
    `02:B134 (L012BE2)` vs `02:B101 -> L012D5A`
  - traffic / police / radar:
    `state_11f3`, `oam_0730`, `state_09a2`, `state_09a8`, `dp_0053/0054`,
    and the later OAM DMA path
  - cockpit / wheel / dashboard stability:
    `BG1HOFS/BG1VOFS` plus frame-to-frame capture compare on the live-entry
    steering lane
- practical implication:
  the next gameplay probes no longer need to ask "what might this field be
  drawing?" in the abstract; they can ask which already-named visible bucket
  changed first

## Separation Rule

- keep this report tied to confirmed gameplay artifacts only
- do **not** reuse front-end car-presentation helpers or attract screenshots
  when classifying gameplay surfaces
- this is the same discipline the wiki now enforces structurally:
  gameplay stays in the gameplay section, front-end/menu material stays in the
  front-end section, and attract material stays separate from both

## Next Best Step

- reuse the same report shape on one later gameplay moment from the preserved
  video or the live-entry lane, especially the checkpoint and police windows
- once the second gameplay moment exists, diff the two reports by asset bucket
  instead of diffing the whole frame blindly
