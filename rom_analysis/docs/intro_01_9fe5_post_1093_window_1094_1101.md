# Post-`1093` `01:9FE5` Window (`1094..1101`)

This note closes the first post-`1093` read for the late `01:9FE5` attract
family.

Primary artifacts:

- `tools/out/visual_contract_range_1094_1101/visual_contract_range.json`
- `tools/out/post_1093_compare/summary.json`
- `tools/out/post_1093_compare/summary.md`

Builder path:

- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1094_1101_v1 tools/out/visual_contract_range_1094_1101 --provenance-json rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc --clean-out`
- per frame `1094..1101`:
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state.json ...`
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state_visible.json ...`
  - `python3 tools/compare_frames.py ...`

## Window Shape

- sampled frames:
  - `1094`, `1095`, `1096`, `1097`, `1098`, `1099`, `1100`, `1101`
- the visual-contract range keeps the same presentation surface across the
  whole block:
  - `bgMode = 7`
  - main-screen layers: `bg1`
  - visible OBJ count: `61`
- contiguous tilemap provenance still holds:
  - `1094..1095` -> `0D:C4DC`
  - `1096..1100` -> `07:BF49`
  - `1101` -> `07:C112`

Reading:

- the post-`1093` failure is not a gross layer or OBJ handoff
- it happens while the same late visible surface is still in place

## Export Surface

- for every frame in this block:
  - `main.ppm` is `256x239`
  - `main_visible.ppm` is `256x224`
- exact compare result:
  - top `224` lines of `main.ppm` vs `main_visible.ppm` -> `0` mismatched
    pixels for all `8` frames
  - bottom `224` lines of `main.ppm` vs `main_visible.ppm` ->
    `13155..14143` mismatched pixels

Reading:

- `main_visible.ppm` is not a different scene export
- it is the visible `224`-line top crop of the taller `main.ppm` surface in
  this block

## Mode 7 State Swap

- only two sampled Mode 7 fields differ between `ppu_state.json` and
  `ppu_state_visible.json` across the whole block:
  - `ppu.mode7.matrix[0]`
  - `ppu.mode7.matrix[3]`
- the direct extracted end-of-frame state remains the better render source:
  - base render vs `main_visible.ppm` -> `177, 197, 227, 266, 330, 380, 498,
    574` mismatched pixels
  - visible-state render vs `main_visible.ppm` ->
    `362, 414, 606, 700, 1244, 1515, 3962, 5930` mismatched pixels

Per-frame sampled matrix deltas:

- `1094`: `matrix[0] 1664 -> 1152`, `matrix[3] 1542 -> 1028`
- `1095`: `matrix[0] 1536 -> 1024`, `matrix[3] 1542 -> 1028`
- `1096`: `matrix[0] 1408 -> 896`, `matrix[3] 1285 -> 771`
- `1097`: `matrix[0] 1280 -> 768`, `matrix[3] 1285 -> 771`
- `1098`: `matrix[0] 1152 -> 640`, `matrix[3] 1028 -> 514`
- `1099`: `matrix[0] 1024 -> 512`, `matrix[3] 1028 -> 514`
- `1100`: `matrix[0] 896 -> 384`, `matrix[3] 771 -> 257`
- `1101`: `matrix[0] 768 -> 256`, `matrix[3] 771 -> 257`

Reading:

- the post-`1093` gap is not solved by a bare visible-scanline `ppu_state`
  substitution
- using the visible-scanline Mode 7 coefficients directly makes the compare
  substantially worse
- the remaining open problem is therefore narrower:
  - export surface selection is now explained
  - callback/layer/OBJ continuity is already explained
  - the unresolved gap is the remaining render/composition semantics after the
    `1093 -> 1094` boundary

## Next Reading

- keep the timed-input `7051` ownership lane parked
- use the base-state `177..574` mismatch band as the new Lane 2 frontier
- apply the same compare rubric to `1102..1117` before changing renderer
  behavior, so the next boundary change is measured rather than guessed
