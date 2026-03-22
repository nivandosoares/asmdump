# Mode 7 `bg1_visible` Export Semantics After the Composed-Screen Fix

This note records the next narrowing after `line + 1` closed the composed
late-attract `Mode 7` window.

Primary artifacts:

- `tools/build_mode7_bg1_export_audit.py`
- `tools/out/mode7_bg1_export_audit_1105/audit.json`
- `tools/out/mode7_bg1_export_audit_1105/audit.md`
- `tools/out/mode7_bg1_export_audit_1117/audit.json`
- `tools/out/mode7_bg1_export_audit_1117/audit.md`

Builder path:

- `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1105_default/analysis.json tools/out/mode7_bg1_export_audit_1105/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1105/audit.md`
- `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_bg1_export_audit_1117/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1117/audit.md`

## Question

Once the composed scene is already solved by the official `line + 1` rule,
does a small local `Mode 7` tweak still explain the remaining
`bg1_visible.ppm` mismatch?

The bounded grid stayed intentionally small and implementation-adjacent:

- state source: `base` (visible-state deltas are absent on the plateau)
- `yLineBias`: `0`, `1`
- `xOriginBias`: `-1`, `0`, `1`
- `hscrollBias`: `-1`, `0`, `1`
- sample order:
  - sample-before-increment
  - increment-before-sample

That is `36` models per plateau endpoint.

## Hard Results

The two plateau endpoints agree exactly.

At both `1105` and `1117`:

- best BG-only overall:
  - `base_y+1_x+0_h+0_pre`
  - BG-only: `2271`
  - main: `0`
- best BG-only with `main = 0`:
  - the same model
  - BG-only: `2271`
  - main: `0`
- `5 / 36` models keep the composed scene at `0`
- none of those `5` models improve the BG-only mismatch below `2271`

The tied `main = 0` family is informative:

- `base_y+1_x+0_h+0_pre`
- `base_y+1_x-1_h+0_post`
- `base_y+1_x+0_h-1_post`
- `base_y+1_x-1_h+1_pre`
- `base_y+1_x+1_h-1_pre`

All of them land at:

- BG-only: `2271`
- main: `0`

Everything else is worse in one of two ways:

- it reopens the composed scene (`2509` or worse)
- or it worsens the BG-only export while still not improving the composed scene

## What This Proves

### 1. The remaining `bg1_visible` mismatch is stable against small local renderer tweaks

The candidate family now covers the obvious local explanations that were still
plausible after the composed-screen closure:

- scanline `Y`
- `pixel 0` / `X-origin`
- increment order
- one-step `hscroll` perturbation

Across both plateau endpoints, none of those beats the current `2271` floor
without reopening the already-solved composed screen.

### 2. The composed-scene rule and the layer-export rule have now separated more strongly

Before this audit, the best reading was:

- composed scene solved
- isolated layer still open

After this audit, the stronger reading is:

- the composed-scene `Mode 7` rule is already good enough
- the remaining isolated-layer mismatch is no longer a good candidate for
  another small renderer-side sampling tweak

### 3. The current frontier is better described as export semantics than `Mode 7` math

This does not prove the renderer is perfect in an absolute sense.

It does prove something narrower and more useful for the next step:

- if the target remains `layers/bg1_visible.ppm`
- and the candidate space is “small local `Mode 7` sampling tweaks”
- then the bounded grid is already exhausted enough to demote that path

So the next defensible read is:

- treat `bg1_visible.ppm` as a separate export-surface question
- stop expecting another near-neighbor `Mode 7` tweak to close it

## Next Best Step

Do not spend the next iteration on more local `Mode 7` perturbations of the
same family.

Instead, compare export semantics directly:

- how `mesen_ppu_extract` produces `layers/bg1_visible.ppm`
- whether it is a viewer-style surface rather than the exact on-screen `BG1`
  contribution
- whether its crop/origin rules differ from the real composed screen even when
  `main_visible.ppm` is exact
