# Next Agent Handoff

## Read First

Use this order before trusting any older note:

1. `PORT_PLAN.md`
2. `rom_analysis/docs/next_steps_roadmap.md`
3. `rom_analysis/docs/progress_checkpoints.md`
4. local runtime/tests

## Current Checkpoint

This turn narrowed the remaining late-entry `3250` counterexample one step
past the earlier queue-boundary note:
`3400/3550` still stand as the positive scanline-backed proof set, and the
current `3250` split is now not just “visible queue/DMA exists”, but
“a one-tile bank-15 object is being queued into visible BG1”.

Primary files:

- `tools/summarize_scanline_dma_queue.py`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_bg1_queue_object_3250.md`
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
  - new object-side provenance:
    - the descriptor matches the bank-0 table-driven queue-builder family
      rooted at `L001895 / L001A70`
    - the queued payload closes to a one-tile bank-15 object:
      `15:B4A8 -> 15:B4B8`
    - direct literal search did not find raw `B4A8/B4B8` words in bank `1`,
      bank `2`, or elsewhere in bank `15`
    - current read:
      table-resolved gameplay object selection, not a simple hardcoded
      pointer pair
  - current trace-state boundary:
    - two targeted Mesen variants kept `0` exec hits on the first guessed
      builder sites and `0` write hits on traced `7E:0600..0607`
    - both still pinned the frame-start callback family to
      `active_main = 02:9016`, `active_irq = 01:96A0`
  - `3400` and `3550` keep the visible queue empty on all `224` sampled
    scanlines

## Validation State

Validated in this turn:

- `python3 -m py_compile tools/summarize_scanline_dma_queue.py`
- `python3 tools/summarize_scanline_dma_queue.py tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json --output tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json --markdown-out tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- ad hoc ROM-side decode over `game.smc` around `15:B4A8..15:B4C6`
- targeted Mesen trace variant 1:
  - `tools/out/lane3_live_entry_frame03250_producer_trace/td2_scanline_step_test.json`
- targeted Mesen trace variant 2:
  - `tools/out/lane3_live_entry_frame03250_producer_trace_mirror/td2_scanline_step_test.json`

Current relevant pass state:

- queue summary tool compiles and emits reusable JSON + Markdown on the
  current root-level scanline-capture schema

## Design Artifacts

Fresh queue-boundary artifacts for review:

- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_bg1_queue_object_3250.md`

## Next Gate

Resume from lane 3 late gameplay.

Best next target:

1. Treat `3400` and `3550` together as the new late-entry proof set that the
   current measured scanline family can beat composition-only rendering.
2. Treat `3250` as a queue-backed counterexample, not a window/sub-screen
   counterexample.
3. Resume from the new ownership proof and chase the selector path behind the
   one-tile bank-15 object `15:B4A8 -> 15:B4B8`, anchored on the active
   `02:9016` main / `01:96A0` IRQ family.
4. Only after that producer proof, decide whether `3250` needs a queue-backed
   runtime surface, a broader visible-phase VRAM upload model, or a different
   late-entry contract split from `3400/3550`.

## Git Hygiene

- Do not sweep unrelated dirty files into the checkpoint commit.
- `tools/out` is ignored; force-add only if a generated artifact truly belongs
  in Git.
- After a substantive push, run `./tools/push_checkpoint.sh`.
- Article automation lives in `/home/nivando-soares/scripts`.
