# Next Agent Handoff

## Read First

Use this order before trusting any older note:

1. `PORT_PLAN.md`
2. `rom_analysis/docs/next_steps_roadmap.md`
3. `rom_analysis/docs/progress_checkpoints.md`
4. local runtime/tests

## Current Checkpoint

This turn promoted the late-gameplay `BG3` top-band rule from an analysis
artifact into a versioned runtime contract.

Primary files:

- `rom_analysis/docs/gameplay_composition_contracts.jsonc`
- `port/src/td2_runtime.c`
- `port/src/td2_ppu.c`
- `port/test_scanline_contract.c`

Current promoted late-gameplay consumers:

- `tools/out/lane3_live_entry_frame03250_bundle/design_pack`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack`
- `tools/out/lane3_live_entry_frame03550_bundle/design_pack`

Current measured composition rule:

- enable `BG3` only in a top band
- keep `BG3 > BG2` only in that same band
- current cutoffs:
  - `3250`: `79`
  - `3400`: `79`
  - `3550`: `95`

## Validation State

Validated in this turn:

- `make -C port test`
- `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Current relevant pass state:

- regression smoke: `2/2`
- compare lane: `3/3`
- callback model: `183` checks
- scheduler smoke: `335` checks
- input mutation smoke: `200` checks
- live input smoke: `21` checks
- scanline / composition contract smoke: `39` checks

## Design Artifacts

Fresh runtime PNGs for review:

- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3250_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png`

Earlier supporting sweep pack:

- `tools/out/gameplay_bg3_cutoff_sweep_20260401/summary.md`

## Next Gate

Resume from lane 3 late gameplay.

Best next target:

1. Decide whether to keep extending the static composition contract or to
   promote stronger measured scanline/state fields on the same late-entry
   family.
2. Prefer proving that on `3250/3400/3550` before opening a wider gameplay
   rewrite.
3. Keep the design-review PNGs current whenever the promoted rule changes.

## Git Hygiene

- Do not sweep unrelated dirty files into the checkpoint commit.
- `tools/out` is ignored; force-add only if a generated artifact truly belongs
  in Git.
- After a substantive push, run `./tools/push_checkpoint.sh`.
- Article automation lives in `/home/nivando-soares/scripts`.
