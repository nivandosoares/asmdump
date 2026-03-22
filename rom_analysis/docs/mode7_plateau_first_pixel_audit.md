# First-Pixel Audit for Static `Mode 7` Plateau `1105..1117`

This note records the exact-hit follow-up after the broader `Mode 7`
validation/reference pass.

Target question:

- does the canonical late-attract plateau still point at X-origin /
  `M7HOFS`-visible timing, or is the missing rule actually the scanline start
  term used for `Mode 7/BG1` sampling?

Primary artifacts:

- `rom_analysis/docs/mode7_1105_exact_hit_sources.md`
- `rom_analysis/docs/mode7_line_origin_y_sources.md`
- `tools/build_mode7_first_pixel_audit.py`
- `tools/out/mode7_first_pixel_1105/audit.json`
- `tools/out/mode7_first_pixel_1105/audit.md`
- `tools/out/mode7_plateau_1117/analysis.json`
- `tools/out/mode7_plateau_1117/analysis.md`
- `tools/out/mode7_first_pixel_1117/audit.json`
- `tools/out/mode7_first_pixel_1117/audit.md`

Builder path:

- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1105/analysis.json tools/out/mode7_first_pixel_1105/audit.json --markdown-out tools/out/mode7_first_pixel_1105/audit.md`
- `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1117/analysis.json --canonical-frame 1117 --markdown-out tools/out/mode7_plateau_1117/analysis.md`
- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_first_pixel_1117/audit.json --markdown-out tools/out/mode7_first_pixel_1117/audit.md`

## Canonical Models Tested

The audit intentionally stayed narrow.

For both plateau endpoints (`1105` and `1117`) it compared:

- `base_current`
  - current repo renderer behavior
- `visible_state_current`
  - same renderer path, but fed with `ppu_state_visible.json`
- `sample_after_increment`
  - increment before taking the pixel sample
- `x_origin_plus1`
  - `pixel 0` starts from one extra `A/C` step on the same scanline
- `line_plus1`
  - the scanline term uses `screenY + 1`

## Hard Results

The two plateau endpoints agree exactly.

At both `1105` and `1117`:

- `base_current`
  - full scene: `2698`
  - BG-only: `3982`
- `visible_state_current`
  - full scene: `2698`
  - BG-only: `3982`
- `sample_after_increment`
  - full scene: `2780`
  - BG-only: `3613`
- `x_origin_plus1`
  - full scene: `2780`
  - BG-only: `3613`
- `line_plus1`
  - full scene: `0`
  - BG-only: `2271`

## What This Proves

### 1. Focused visible-state `Mode 7` deltas are absent on the static plateau

For the keys that still matter here:

- `ppu.mode7.hscroll`
- `ppu.mode7.vscroll`
- `ppu.mode7.centerX`
- `ppu.mode7.centerY`
- `ppu.mode7.matrix[0..3]`
- `ppu.extBgEnabled`
- `ppu.directColorMode`
- `ppu.colorMathEnabled`
- `ppu.subScreenLayers`

the audit finds no difference at all between:

- `ppu_state.json`
- `ppu_state_visible.json`

Practical reading:

- the static plateau is no longer explained by a focused end-of-frame vs
  visible-frame `Mode 7` state fork
- visible-latched `M7HOFS/M7VOFS` timing drops behind the scanline-start rule
  for this exact plateau

### 2. `sample-after-increment` collapses to `X-origin +1`

On the canonical plateau state:

- `M7A = 256`
- `M7C = 0`

That means:

- increment-before-sample
- or pre-seeding the scanline origin by `+1`

produce the same source coordinates and the same rendered outputs.

Practical reading:

- the earlier `hscroll +1` clue was real
- but it was not enough to close the scene
- for this plateau, the `pixel 0` and `X-origin` hypotheses collapse into one
  equivalence class

### 3. `screenY + 1` is the first model that closes the composed scene

The decisive result is not horizontal.

Using `screenY + 1` for the scanline term:

- collapses the full-scene compare to `0` mismatched pixels
- at both ends of the static plateau (`1105` and `1117`)

Practical reading:

- the composed-screen frontier is now a scanline-start rule, not an
  `M7SEL`/outside-map rule and not a visible-state fork
- the current renderer is missing a `startY` / scanline-origin term that the
  plateau expects

## Why BG-Only Still Differs

`line_plus1` does **not** collapse the extracted isolated layer:

- BG-only still lands at `2271` mismatched pixels

This is an important split:

- the composed scene is solved for the plateau endpoints
- the isolated `bg1_visible` export is still not explained by the same rule

Current best reading:

- the composed-screen gate and the isolated-layer export gate are no longer the
  same problem
- for the actual late-attract screen, `startY = screenY + 1` is the useful
  next implementation candidate
- the remaining `bg1_visible` mismatch should be treated as a separate export /
  layer-surface question unless a later artifact ties it back together

## Next Defensible Step

Promote the `screenY + 1` scanline-start hypothesis carefully:

- apply it to the main renderer paths
- re-run the late `1102..1117` compare summary
- then check whether `1102..1104` still need their old visible-state handling
  on top of the new start-line rule

Documentation ask for the next iteration:

- emulator or test-ROM material that is explicit about `Mode 7` scanline
  `startY` / line-origin semantics under vertical mirroring
- implementation notes that explain whether the hardware behavior is better
  described as `line + 1`, a prefetch artifact, or another named scanline
  origin rule

The new focused source note now makes the current conflict explicit:

- `fullsnes` and `Snes9x` use `line + 1`
- `Mesen-S`, `bsnes`, and `ares` use current-line `Y`

So the next renderer step should preserve that split as an explicit open
accuracy question rather than pretending the scanline-start rule is already
settled by documentation alone.
