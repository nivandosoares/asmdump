# Exact-Hit Sources for Canonical `Mode 7/BG1` Plateau `1105`

This note records only sources that directly hit the current narrowed gate:

- scanline-visible timing / latch behavior for `M7HOFS` / `M7VOFS`
- first-pixel / X-origin / preincrement semantics
- emulator implementation details about first sample or increment order

This is intentionally narrower than the broader `Mode 7` reference note.

## Gate-Specific Reading

Canonical frame `1105` from
`tools/out/mesen_range_1102_1109_v1/frame_01105/ppu_state.json` keeps:

- `M7A = 256`
- `M7B = 0`
- `M7C = 0`
- `M7D = 257`
- `M7HOFS = 0`
- `M7VOFS = -1`

Immediate consequence:

- the horizontal `BG` mismatch is not being driven by the `B` or `C` terms on
  this plateau
- for this exact gate, the highest-value suspects are:
  - `M7HOFS` visibility/latching
  - X-origin / first-sample placement
  - pixel-0 sample-vs-increment order

## Exact-Hit Sources

| Source | Type | Exact hit | Why it matters here | Confidence |
|---|---|---|---|---|
| `https://github.com/SourMesen/Mesen-S/blob/master/Core/Ppu.cpp` | emulator source | `RenderTilemapMode7()` explicitly says "Keep the same scroll offsets for the entire scanline" and latches `Mode7.HScroll/VScroll` when `_drawStartX == 0`; the loop samples `xOffset/yOffset` before `xValue += xStep` and `yValue += yStep` | direct evidence for scanline-visible `H/VScroll` state and for sample-before-increment semantics | direct |
| `https://github.com/snes9xgit/snes9x/blob/master/gfx.cpp` | emulator source | per-scanline prep copies `PPU.M7HOFS/M7VOFS/Matrix/CentreX/CentreY` into `LineMatrixData[C]` before drawing | direct evidence that visible line state is snapshotted separately from later frame state | direct |
| `https://github.com/snes9xgit/snes9x/blob/master/tileimpl.h` | emulator source | `starty = Line + 1`; `AA = MatrixA * startx + ((MatrixA * xx) & ~63)`; inner loop computes `X = ((AA + BB) >> 8)` before `AA += aa` / `CC += cc` | direct evidence for first-sample derivation and post-sample increment order | direct |
| `https://github.com/bsnes-emu/bsnes/blob/master/bsnes/sfc/ppu-fast/mode7.cpp` | emulator source | computes `originX/originY` once per scanline, then for each `X` uses `pixelX = originX + a * x >> 8` and `pixelY = originY + c * x >> 8` | direct evidence that pixel-0 comes from an explicit origin plus `a*x/c*x`, not from an already-incremented accumulator | direct |
| `https://github.com/ares-emulator/ares/blob/master/ares/sfc/ppu/mode7.cpp` | emulator source | takes `x = mosaic.hoffset`, computes `pixelX = originX + a * x >> 8`, then increments `mosaic.hoffset` separately before later pixels | direct evidence that first sample is tied to line-local `mosaic.hoffset` / X-origin state | direct |
| `https://github.com/ares-emulator/ares/blob/master/ares/sfc/ppu/io.cpp` | emulator source | `io.hoffsetMode7 = data << 8 | latch.mode7`; `io.voffsetMode7 = data << 8 | latch.mode7` | direct evidence that `Mode 7` offsets are assembled through a shared write-twice latch | direct |
| `https://snes.nesdev.org/wiki/HDMA_examples` | timing doc / test-oriented wiki | explicit note: an HDMA write to `BG1HOFS` can corrupt `M7A` if it lands between the two `M7A` writes; also says `HDMAEN` must be set during VBlank before scanline `0` | direct evidence that scanline-visible state can diverge from a naive final-state read because of shared write-twice timing | direct |
| `https://github.com/undisbeliever/snes-test-roms/blob/master/src/hardware-glitch-tests/setini-early-read-mode7ex.asm` | hardware glitch test ROM | header comment says it tests whether `SETINI` reads the data bus too early while enabling `Mode 7 EXTBG` | direct hardware-oriented proof that PPU visible behavior can observe early-read / bus-timing quirks inside `Mode 7` paths | direct |

## What These Sources Actually Narrow

### 1. Scanline-visible state is a live suspect

This is no longer just theoretical.

- `Mesen-S` latches `HScroll` / `VScroll` per scanline.
- `Snes9x` snapshots `M7HOFS` / `M7VOFS` into `LineMatrixData` before draw.
- SNESdev `HDMA examples` explicitly warns that shared write-twice state can be
  corrupted by mid-sequence writes.

For this gate, that makes "visible scanline state differs from end-of-frame
state" a real implementation path, not a hand-wavy hypothesis.

### 2. Sample-before-increment is the dominant emulator pattern

All exact implementation hits converged on the same broad pattern:

- compute an origin for the scanline
- derive pixel `0` from that origin and current X
- only then advance to later pixels

That means a naive "increment before sample" variant is currently the
lower-confidence model unless the hardware differs from the common emulator
pattern here.

### 3. Pixel-0 / X-origin remains the best narrowing

Because the plateau keeps:

- `B = 0`
- `C = 0`

the most valuable unresolved horizontal terms are:

- `clip(M7HOFS - M7X)` origin handling
- the exact X used for the first sample
- the point where pixel `0` is taken relative to accumulator update

`M7VOFS` timing still matters in general, but it is less likely to explain the
horizontal bias on this exact plateau than `M7HOFS` / X-origin.

## Minimal Audit Items Forced by the Sources

- Compare the repo renderer against the common emulator pattern, not against a
  generic affine formula.
- Audit whether pixel `0` is sampled before any per-pixel increment.
- Audit whether the first X is effectively `0`, `Left`, or another line-local
  origin.
- Audit whether `M7HOFS` visibility is taken from end-of-frame state or from a
  visible-line snapshot.
- Leave `M7SEL` outside-map behavior parked for this plateau unless a new
  artifact shows non-zero outside-map samples.

## Immediate Experiments

1. Log canonical scanline source coordinates for pixel `0` and pixel `1`.
   - record `xValue`, `yValue`, `xOffset`, `yOffset`
   - target scanlines inside the plateau bbox

2. Force sample-order variants on canonical `1105`.
   - sample-before-increment
   - increment-before-sample
   - compare both `BG-only` and full-scene deltas

3. Force X-origin variants on canonical `1105`.
   - `x = 0`
   - `x = -1`
   - `x = +1`
   - `x = drawStartX`-style seeded origin if applicable

4. Freeze visible-line `M7HOFS` separately from end-of-frame state.
   - treat `M7VOFS` as secondary for the horizontal plateau because `B = 0`

5. After any `BG-only` gain, immediately re-check full-scene regressions.
   - the current `hscroll +1` clue already proved that a `BG` win alone is not
     enough
