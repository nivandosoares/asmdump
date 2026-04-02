# Next Agent Handoff

## Read First

Use this order before trusting any older note:

1. `PORT_PLAN.md`
2. `rom_analysis/docs/next_steps_roadmap.md`
3. `rom_analysis/docs/progress_checkpoints.md`
4. local runtime/tests

## Current Checkpoint

This turn extended the late-entry scanline-contract promotion one step
further: `3550` now joins `3400` as a positive late-gameplay consumer of the
current measured scanline field family, while `3250` remains the explicit
counterexample.

Primary files:

- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json`
- `tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json`
- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
- `port/test_scanline_contract.c`
- `rom_analysis/docs/gameplay_composition_contracts.jsonc`

Current promoted late-gameplay consumers:

- `tools/out/lane3_live_entry_frame03250_bundle/design_pack`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack`
- `tools/out/lane3_live_entry_frame03550_bundle/design_pack`

Current measured late-gameplay rules:

- enable `BG3` only in a top band
- keep `BG3 > BG2` only in that same band
- current cutoffs:
  - `3250`: `79`
  - `3400`: `79`
  - `3550`: `95`
- current scanline-backed late-entry consumer:
  - `3400`
    - `9309` changed pixels versus the earlier composition-only runtime PNG
    - `bg_stack_visible_support.png` mismatch `15497 -> 7649`
  - `3550`
    - `9367` changed pixels versus the earlier composition-only runtime PNG
    - `bg_stack_visible_support.png` mismatch `17848 -> 9741`

## Validation State

Validated in this turn:

- `make -C port`
- `./port/test_scanline_contract.sh`
- `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400`
- `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_frame03550_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550`
- `python3 tools/compare_frames.py tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
- `python3 tools/compare_frames.py tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
- `python3 tools/compare_frames.py tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
- `python3 tools/compare_frames.py tools/out/lane3_live_entry_frame03550_bundle/bg_stack_visible_support.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`

Current relevant pass state:

- scanline / composition contract smoke: `53` checks

## Design Artifacts

Fresh runtime PNGs for review:

- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3250_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png`

Earlier supporting sweep pack:

- `tools/out/gameplay_bg3_cutoff_sweep_20260401/summary.md`

## Next Gate

Resume from lane 3 late gameplay.

Best next target:

1. Treat `3400` and `3550` together as the new late-entry proof set that the
   current measured scanline family can beat composition-only rendering.
2. Use `3250` as the explicit remaining counterexample and narrow what extra
   fields or state ownership distinguish it from the two positive consumers.
3. Only after that `3250` narrowing, decide whether this late-entry family
   needs more scanline fields, another state surface, or a different contract
   split.
4. Keep the design-review PNGs current whenever the promoted rule changes.

## Git Hygiene

- Do not sweep unrelated dirty files into the checkpoint commit.
- `tools/out` is ignored; force-add only if a generated artifact truly belongs
  in Git.
- After a substantive push, run `./tools/push_checkpoint.sh`.
- Article automation lives in `/home/nivando-soares/scripts`.
