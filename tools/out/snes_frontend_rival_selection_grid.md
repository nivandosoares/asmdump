# SNES Front-End Rival Selection Grid

- Claim: `L00C20B` owns a verified downstream `4`-state `2x2` front-end
  surface on `$1C70`.
- Scope: promote the structural read of the post-car, pre-track selector
  surface without over-promoting the unresolved fourth cell.

## Structure

- Hidden callback: `01:C1D2`
- Selection-box row: `1E:8000` row `0x1D`
- Selector field: `$1C70`
- Domain: `0..3`
- Static call-chain fit: `L008B3E -> L00C20B -> L00BE76`

## Grid Cells

| `$1C70` | Grid role | Highlight XY | Static render | Classification | Preview |
| ---: | --- | --- | --- | --- | --- |
| `0` | top-left | `(85, 109)` | `16:8000` row `6` -> `VRAM 0x3400` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_top_left_bank16_row6.png` |
| `1` | top-right | `(173, 109)` | `18:8000` row `6` -> `VRAM 0x3600` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_top_right_bank18_row6.png` |
| `2` | bottom-left | `(85, 173)` | `1B:8000` row `6` -> `VRAM 0x3000` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_bottom_left_bank1b_row6.png` |
| `3` | bottom-right | `(173, 173)` | no explicit rear-car row in verified setup | `PROBABLE` | unresolved |

## Selection Box

- Row preview: `tools/out/snes_frontend_rival_grid_selection_box_row1d.png`
- Code path:
  - `L00C20B` installs callback `01:C1D2`
  - `01:C1D2` uses `$1C70 * 4` against `01:C1C2..01:C1D0`
  - the callback redraws row `0x1D` from `1E:8000` through `L00179B`

## Notes

- This closes the structure of the downstream surface, not the final meaning of
  every slot.
- The strongest current user-guided fit is still:
  - `3` rival-car cells plus one time-only/clock slot
- That last semantic step remains `PROBABLE` until a live named frame or a
  direct text/descriptor tie closes the fourth cell.
