# SNES Select Opponent BG1 Clock Summary

- Helper bundle: `8`
- Source routine fit: `L00C20B`
- Visible layer: `BG1`
- Sources:
  - `L00A9A0` -> `05:E950`
  - `L00A9CB` -> `05:EC0A`
  - `L00A9F2` -> `05:FAD2`

## Visual Result

- Banner: `Select Opponent`
- Grid: `2x2`
- Non-car fourth slot: bottom-right stopwatch/clock icon

## Supporting Read

- `L00C20B` already draws the three rear-car cells separately through OAM-like
  row `6` descriptors from `16:8000`, `18:8000`, and `1B:8000`.
- The isolated helper-8 `BG1` render carries the remaining out-of-band
  surface, which is why the fourth slot appears outside the car-row list in
  debugging.

## Artifacts

- Full layer render: `tools/out/snes_frontend_select_opponent_bg1.png`
- Enlarged layer render: `tools/out/snes_frontend_select_opponent_bg1_x4.png`
- Machine summary: `tools/out/snes_frontend_select_opponent_clock_summary.json`
