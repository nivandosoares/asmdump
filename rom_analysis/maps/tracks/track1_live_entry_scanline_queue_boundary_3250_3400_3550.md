# Track 1 Live-Entry Scanline Queue Boundary `3250 / 3400 / 3550`

- Note date: `2026-04-02`
- Goal:
  narrow the remaining late-entry counterexample at frame `3250` after the
  scanline-backed runtime had already produced positive wins on `3400` and
  `3550`

## What Was Run

- queue-summary tool refresh validation:
  - `python3 -m py_compile tools/summarize_scanline_dma_queue.py`
- reusable queue comparison across the promoted late-entry traces:
  - `python3 tools/summarize_scanline_dma_queue.py tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json --output tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json --markdown-out tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- direct field compare over the same three traces:
  - current fields checked explicitly:
    - `sub_layers`
    - `window0_left/right`
    - `window1_left/right`
    - `window_mask_main_bg1/bg2/bg3/obj`
    - `queue_dma_active_descriptor_count`
    - `queue_dma_active_entries`
    - `dp_0053/0054/0055/0056`
    - `wram_0053/0054/0055/0056`

## Promoted Artifacts

- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json`
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`

## Current Reading

- the distinguishing surface is no longer “maybe another window or sub-screen
  field”
  - on all three promoted late-entry traces, the current sampled
    `sub_layers`, window coordinates, and main-window masks stay flat:
    `sub_layers = 0`, all window coordinates `0`, and all sampled
    `window_mask_main_* = false`
- the strongest outlier is queue-backed visible state on `3250`
  - frame `3250` keeps `1` active visible queue descriptor across scanlines
    `46..223` (`178` sampled scanlines)
  - the active descriptor is stable across that whole span:
    - slot `14`
    - offset `112`
    - words `[0xB801, 0x15B4, 0x0020, 0x6180]`
    - source `0x15B4B8`
    - transfer size `0x20`
    - VRAM destination `0x6180`
  - frames `3400` and `3550` both keep
    `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines
- the DP/WRAM queue-cursor family splits the same way
  - `3250` start-of-frame representative:
    - `dp_0053/0054 = 0x70/0x70`
    - `wram_0055/0056 = 0x18/0x12`
  - within the active visible queue corridor on `3250`, `dp_0054` advances
    to `0x78`
  - `3400` representative:
    - `dp_0053/0054 = 0xE0/0xE0`
    - `wram_0055/0056 = 0x90/0x15`
  - `3550` representative:
    - `dp_0053/0054 = 0xF8/0xF8`
    - `wram_0055/0056 = 0x90/0x15`
- practical late-gameplay fit:
  - `3400` and `3550` are now the true “scroll-only positive proof set” for
    the current `main_layers/bg1/bg2/bg3` scanline family
  - `3250` is no longer best read as “needs one more obvious window/layer
    field”
  - the stronger current fit is that `3250` still depends on a visible
    queue/VRAM surface that the runtime does not yet model

## Strongest Ownership Proof

- the `3250` queue descriptor targets VRAM `0x6180`
- in the promoted bundle, that address resolves to `BG1` CHR tile `396`
  (`(0x6180 - 0x3000) / 0x20 = 396`)
- the `BG1` tilemap references tile `396` at cell `(x=4, y=24)` on all three
  promoted late-entry bundles
- under the current `BG1` scroll (`hscroll = 0`, `vscroll = 255`), that cell
  lands around screen position `(32, 193)`, which keeps it inside the visible
  lower HUD/cockpit region
- direct raw-memory compare closes the transient-state boundary:
  - `raw/vram.bin[0x6180:0x61A0]` is byte-identical on `3250/3400/3550`
  - the wider neighboring window `raw/vram.bin[0x6180:0x6200]` is also
    byte-identical on `3250/3400/3550`
- practical read:
  the visible queue work on `3250` is not preserved in the end-frame bundle
  dumps, even though the target tile is real and visible in the promoted
  `BG1` surface

## Why This Matters

- this closes the immediate “what should we try next on `3250`?” question
- the next bounded lane-3 step should target queue/VRAM ownership, not widen
  the scanline contract blindly with another window/sub-screen guess
- it also gives a concrete bridge between the late-gameplay port lane and the
  older queue-oriented archaeology surfaces: the unresolved counterexample now
  has a named visible queue signature instead of only a flat-vs-contract
  negative result
- it also now explains why the current seeded-state runtime cannot close
  `3250` by loading only end-frame `VRAM/CGRAM/OAM + ppu_state` plus the
  current scroll/composition contracts:
  the critical upload appears to be visible-phase and transient

## Next Best Step

- bind the `3250` visible queue descriptor (`slot 14 -> VRAM 0x6180`) to the
  specific producer path that populates the visible `BG1` tile `396`
- only after that, decide whether the next runtime checkpoint should be:
  - a queue-backed `BG1`/CHR contract
  - a broader VRAM upload surface
  - or a different late-entry contract split for `3250` versus `3400/3550`
