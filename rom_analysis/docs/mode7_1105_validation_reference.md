# Mode 7 Validation Reference for Canonical Plateau `1105`

This note consolidates the external `Mode 7` documentation that is directly
useful for the current Lane 2 plateau gate.

Target question:

- which `Mode 7/BG1` rule still explains the static `1105..1117` plateau after
  ownership, export shape, and per-frame `OAM DMA` have already been ruled out?

Primary sources used:

- SNESdev: `Mode 7 transform`
  - https://snes.nesdev.org/wiki/Mode_7_transform
- SNESdev: `PPU registers`
  - https://snes.nesdev.org/wiki/PPU_registers
- SNESdev: `Backgrounds`
  - https://snes.nesdev.org/wiki/Backgrounds
- SNESdev: `VBlank routine`
  - https://snes.nesdev.org/wiki/VBlank_routine
- SNESdev: `HDMA examples`
  - https://snes.nesdev.org/wiki/HDMA_examples
- fullsnes / nocash
  - https://problemkaputt.de/fullsnes.htm
- `Mesen-S` `Core/Ppu.cpp`
  - https://github.com/SourMesen/Mesen-S/blob/master/Core/Ppu.cpp
- undisbeliever `setini-early-read-mode7ex`
  - https://github.com/undisbeliever/snes-test-roms/blob/master/src/hardware-glitch-tests/setini-early-read-mode7ex.asm
- bbbradsmith `extbgtest`
  - https://github.com/bbbradsmith/SNES_stuff/tree/main/extbgtest

## Source Triaging

| Source | Immediate value | What it proves for this gate |
|---|---|---|
| `Mode 7 transform` | medium | conceptual `ABCD * (S + H - C) + C` model |
| `PPU registers` | high | signedness, write-twice semantics, `M7SEL`, `SETINI.EXTBG` |
| `Backgrounds` | medium | outside-map rules and direct-color notes |
| `fullsnes` | high | operational `clip(hscroll-center)` form and `M7_old` details |
| `VBlank routine` | medium | shadow/latch-safe update model for write-twice registers |
| `HDMA examples` | high | latch corruption risks and scanline timing constraints |
| `Mesen-S Ppu.cpp` | very high | exact renderer behavior used as implementation reference |
| `setini-early-read-mode7ex` | medium | real timing/glitch proof for `SETINI/EXTBG` |
| `extbgtest` | medium | expected `EXTBG/BG1/BG2/OBJ` layering outcomes |

## Consolidated Operational Model

Confirmed by doc:

- `M7HOFS`, `M7VOFS`, `M7X`, and `M7Y` are signed `13`-bit values written
  through a shared `mode7_latch`.
- `M7A..M7D` are signed `16`-bit matrix terms, effectively used as `8.8`
  fixed-point deltas during rasterization.
- `M7SEL` controls:
  - large-map outside-map handling
  - fill-with-tile-0 versus transparency
  - horizontal/vertical mirroring
- `SETINI.6` enables `EXTBG`, which reuses the same `Mode 7` pixel stream on
  BG2 with `bit7` reinterpreted as priority and only `7` color bits.

Confirmed by `fullsnes` and `Mesen-S` source:

- the implementation-friendly form is:
  - `orgX = clip(M7HOFS - M7X)`
  - `orgY = clip(M7VOFS - M7Y)`
  - `xValue = (A*orgX & ~63) + (B*screenY & ~63) + (B*orgY & ~63) + (M7X << 8)`
  - `yValue = (C*orgX & ~63) + (D*screenY & ~63) + (D*orgY & ~63) + (M7Y << 8)`
  - per-pixel steps are `A` and `C`
- `Mesen-S` latches `Mode7.HScroll` and `Mode7.VScroll` at scanline start.
- `Mesen-S` applies `EXTBG` as a separate `RenderTilemapMode7<1,...>()` pass
  only when `ExtBgEnabled` is true.

Useful conflict to record explicitly:

- SNESdev presents the transform conceptually as "scroll after transform".
- `fullsnes` and `Mesen-S` use the operationally equivalent
  `(screen + scroll - center)` form before matrix multiplication.
- For implementation and validation, the operational form is the one that
  matters.

## Current Repo Cross-Check

The current renderer core in `port/src/td2_ppu.c` (see the `Mode 7` path around
`snes_mode7_clip()` / `render_snes_mode7_scene()`) already matches the main
`fullsnes` / `Mesen-S` shape closely:

- same `clip(hscroll - center)` rule
- same `real_y` mirroring placement
- same `A/C` per-pixel stepping
- same large-map outside-map handling

That matters because it narrows the likely remaining bug.

The current gate is probably not:

- a gross matrix-order mistake
- a generic `M7SEL` interpretation bug
- a missing `EXTBG` feature in the canonical plateau

Canonical `1105` state from
`tools/out/mesen_range_1102_1109_v1/frame_01105/ppu_state.json`:

- `ppu.mode7.hscroll = 0`
- `ppu.mode7.vscroll = 8191` (`-1` signed)
- `ppu.mode7.centerX = 128`
- `ppu.mode7.centerY = 112`
- `ppu.mode7.matrix = [256, 0, 0, 257]`
- `ppu.mode7.largeMap = true`
- `ppu.mode7.fillWithTile0 = false`
- `ppu.extBgEnabled = false`
- `ppu.directColorMode = false`
- `ppu.colorMathEnabled = 0`
- `ppu.subScreenLayers = 0`

So the features that remain inactive in the canonical plateau are exactly the
ones that would otherwise complicate the read:

- `EXTBG`
- direct color
- color math
- subscreen layering

## New Narrowing from the Plateau Builder

The updated plateau artifact
`tools/out/mode7_plateau_1105/analysis.json`
now carries explicit `Mode 7` sampling stats in addition to the old mismatch
metrics.

For the plateau bbox itself:

- main diff bbox `24,68 -> 232,138`
- BG-only diff bbox `24,67 -> 232,138`

The builder now proves:

- base `hscroll = 0`:
  - `0` outside-map pixels in either bbox
  - BG bbox sample range stays entirely inside the tilemap:
    - `x = 24..232`
    - `y = 65..137`
- best BG-only tested delta `hscroll = +1`:
  - still `0` outside-map pixels
  - BG bbox sample range only shifts to:
    - `x = 25..233`
    - `y = 65..137`

Practical reading:

- the plateau does **not** touch the large-map outside-map path at all
- therefore `M7SEL` edge fill / transparent-outside behavior is not the active
  explanation for the canonical plateau
- the current frontier should move away from "edge semantics" and toward:
  - X-origin / first-pixel placement
  - scanline-visible `H/VScroll` latching
  - residual composition interaction outside the BG-only box

## What the Docs Still Leave Open

The documentation still leaves three useful live hypotheses.

### 1. X-origin / first-pixel placement

Why it survives:

- the formula matches at a high level
- `hscroll +1` helps BG-only but hurts the full scene
- that reads more like a small coordinate-origin issue than a large matrix bug

Smallest useful test:

- compare `screenX` origin and pre/post-increment variants on canonical
  `1105`

### 2. Visible scanline latch timing

Why it survives:

- `Mesen-S` explicitly latches `HScroll/VScroll` per scanline
- SNES docs and HDMA docs keep warning about shared write-twice latches
- the extracted `ppu_state_visible.json` may still be too coarse if the
  visible state needed here is line-local rather than frame-local

Smallest useful test:

- capture or reconstruct visible-scanline `M7HOFS/M7VOFS` for the bbox scanlines

### 3. Residual composition effect outside the plateau core

Why it survives:

- BG-only improves while full-scene worsens
- sprite coverage inside the plateau box is tiny, but full-scene includes
  pixels outside that box

Smallest useful test:

- split the `hscroll +1` delta map into pixels touched by sprites and pixels
  untouched by sprites

## Lowest-Value Hypotheses Right Now

These dropped in priority after the doc cross-check plus the new sampling stats:

- `M7SEL` outside-map fill/transparency
- `EXTBG` / BG2 second-layer behavior
- direct color behavior
- a second hidden ownership/upload fork in `1105..1117`

## Immediate Validation Order

1. Test X-origin / preincrement variants before touching global matrix math.
2. Test visible-scanline `H/VScroll` state before revisiting `M7SEL`.
3. Use composition-only follow-ups if BG-only keeps improving while the full
   scene regresses.
4. Leave border-rule work parked unless a later artifact shows non-zero
   outside-map pixels.
