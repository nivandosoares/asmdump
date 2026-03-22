# Mode 7 `bg1_visible` Export Semantics After the Composed-Screen Fix

This note records the next narrowing after `line + 1` closed the composed
late-attract `Mode 7` window.

Primary artifacts:

- `tools/build_mode7_bg1_export_audit.py`
- `tools/out/mode7_bg1_export_audit_1105/audit.json`
- `tools/out/mode7_bg1_export_audit_1105/audit.md`
- `tools/out/mode7_bg1_export_audit_1117/audit.json`
- `tools/out/mode7_bg1_export_audit_1117/audit.md`
- `tools/build_mesen_visible_crop_audit.py`
- `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json`
- `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`

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

## Extractor Path Proof

The export-side question is now closed by both source and artifact evidence.

In `tools/mesen_ppu_extract/Program.cs`, the bridge path is:

- `GetTilemap(...)` -> save full layer render as `bg1.ppm`
- `NormalizeScroll(info.ScrollX, size.Width)`
- `NormalizeScroll(info.ScrollY, size.Height)`
- `CropVisibleRegion(...)`
- save the result as `bg1_visible.ppm`

The new visible-crop audit reproduces that exact `NormalizeScroll +
CropVisibleRegion` path against promoted design-pack assets:

- `python3 -m py_compile tools/build_mesen_visible_crop_audit.py`
- `python3 tools/build_mesen_visible_crop_audit.py tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json tools/out/design_mesen_range_1102_1109_v1/frame_01102 tools/out/design_mesen_range_1102_1109_v1/frame_01105 tools/out/design_mesen_range_1110_1117_v1/frame_01117 --markdown-out tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`

That audit lands at `0` mismatched pixels for all three tested frames:

- `1102`
- `1105`
- `1117`

and preserves the extractor metadata exactly:

- full size: `1024x1024`
- visible size: `256x224`
- raw scroll: `0,8191`
- normalized scroll: `0,0`

So the remaining `bg1_visible` gap is no longer just “probably export-side”.
It is now explained concretely: `bg1_visible.ppm` is a viewer-style viewport
crop of the full `GetTilemap` layer render, not a promise of exact on-screen
`BG1` contribution semantics.

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

### 4. The late-attract `bg1_visible` ambiguity is now closed enough to demote as a frontier

Between the bounded `36`-model audit and the extractor-path crop audit, the
remaining late-attract `bg1_visible` mismatch no longer blocks the composed
scene or the active `Mode 7` renderer rule.

The strong practical rule is now:

- use `main_visible.ppm` for renderer parity on this slice
- treat `layers/bg1_visible.ppm` as a viewer/export surface unless the task is
  specifically about bridge/extractor semantics

## Next Best Step

Do not spend the next iteration on more local `Mode 7` perturbations of the
same family or on trying to force `layers/bg1_visible.ppm` into an on-screen
parity target it was never meant to be.

Resume Lane 2 on the next real continuity target instead:

- continue later-window callback/provenance/native replacement work beyond
  `1117`
- keep `main_visible.ppm` as the composed-scene parity surface for renderer
  checks
