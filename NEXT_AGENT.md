# Next Agent Handoff

## Read First

Use this order before trusting any older note:

1. `PORT_PLAN.md`
2. `rom_analysis/docs/next_steps_roadmap.md`
3. `rom_analysis/docs/progress_checkpoints.md`
4. local runtime/tests

## Current Checkpoint

This turn narrowed the remaining late-entry `3250` counterexample:
`3400/3550` still stand as the positive scanline-backed proof set, and the
strongest current split is no longer windows or sub-screen masks but visible
queue/DMA state on `3250`.

Primary files:

- `tools/summarize_scanline_dma_queue.py`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json`
- `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- `tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json`
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`

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
- current `3250` counterexample boundary:
  - `sub_layers`, sampled window coordinates, and sampled
    `window_mask_main_*` fields stay flat across `3250/3400/3550`
  - `3250` alone keeps `1` active visible queue descriptor on scanlines
    `46..223`
  - promoted descriptor payload:
    - slot `14`
    - offset `112`
    - words `[0xB801, 0x15B4, 0x0020, 0x6180]`
    - source `0x15B4B8`
    - transfer size `0x20`
    - VRAM destination `0x6180`
  - ownership is now tied further:
    - `VRAM 0x6180` resolves to `BG1` tile `396`
    - that tile is referenced at cell `(4, 24)` and lands near screen
      `(32, 193)` under the promoted `BG1` scroll
    - end-frame raw `VRAM 0x6180..0x61FF` bytes are still identical on
      `3250/3400/3550`
  - `3400` and `3550` keep the visible queue empty on all `224` sampled
    scanlines

## Validation State

Validated in this turn:

- `python3 -m py_compile tools/summarize_scanline_dma_queue.py`
- `python3 tools/summarize_scanline_dma_queue.py tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json --output tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json --markdown-out tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`

Current relevant pass state:

- queue summary tool compiles and emits reusable JSON + Markdown on the
  current root-level scanline-capture schema

## Design Artifacts

Fresh queue-boundary artifacts for review:

- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`

## Next Gate

Resume from lane 3 late gameplay.

Best next target:

1. Treat `3400` and `3550` together as the new late-entry proof set that the
   current measured scanline family can beat composition-only rendering.
2. Treat `3250` as a queue-backed counterexample, not a window/sub-screen
   counterexample.
3. Resume from the new ownership proof and chase the producer path behind the
   transient visible `BG1` tile `396` upload (`slot 14 -> VRAM 0x6180`).
4. Only after that producer proof, decide whether `3250` needs a queue-backed
   runtime surface, a broader visible-phase VRAM upload model, or a different
   late-entry contract split from `3400/3550`.

## Git Hygiene

- Do not sweep unrelated dirty files into the checkpoint commit.
- `tools/out` is ignored; force-add only if a generated artifact truly belongs
  in Git.
- After a substantive push, run `./tools/push_checkpoint.sh`.
- Article automation lives in `/home/nivando-soares/scripts`.
