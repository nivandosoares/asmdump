# Strict `Mode 7` Line-Origin `Y` Sources

This note is the strict follow-up for the current `Mode 7/BG1` plateau gate.

Allowed source classes only:

- hardware-oriented docs
- test ROMs
- `Mesen-S` implementation, for comparison only

Rejected on purpose:

- `Snes9x`
- `bsnes`
- `ares`
- generic `Mode 7` math notes that do not touch scanline-start behavior

Target question:

- does the composed-screen plateau point to a real `line + 1` hardware rule, a
  pipeline/prefetch effect, or only a coordinate-convention mismatch?

## Explicit Evidence

### `fullsnes`

Source:

- https://problemkaputt.de/fullsnes.htm

Exact statements / behavior:

- `SCREEN.Y = Display (Target) Y-Coordinate: (1..224 or 1..239) XOR (yflip*FFh)`
- `IF yflip THEN SCREEN.Y=((1..224/239) XOR FFh), ELSE SCREEN.Y=(1..224/239)`
- `VRAM.X = VRAM.X + ((M7B*SCREEN.Y) AND NOT 3Fh) + (M7A*SCREEN.X)`
- `VRAM.Y = VRAM.Y + ((M7D*SCREEN.Y) AND NOT 3Fh) + (M7C*SCREEN.X)`
- `After calculating the left-most pixel of a scanline, the following pixels on that scanline can be also calculated by increasing VRAM coordinates`
- `The result is same as on hardware, although the real hardware doesn't seem to use that method`

What this gives:

- explicit `line + 1` style screen-space `Y`
- explicit vertical mirroring on that same `Y`
- explicit statement that one scanline `Y` is chosen before pixel stepping
- no explicit claim that `line + 1` is a pipeline delay; it is presented as the
  coordinate definition used by the formula

Classification:

- DIRECT

### `SNESdev PPU registers`

Source:

- https://snes.nesdev.org/wiki/PPU_registers

Exact statements / behavior:

- `M7SEL ... Mode 7 tilemap repeat (R), fill (F), flip vertical (Y), flip horizontal (X).`
- `M7Y ... Mode 7 center Y`

What this gives:

- explicit register-level confirmation that vertical mirroring is a real
  hardware control in `M7SEL`
- explicit confirmation that `M7Y` is the center term
- no explicit statement about first visible scanline or whether `Y` is
  `line` or `line + 1`

Classification:

- DIRECT

### `setini-early-read-mode7ex.asm`

Source:

- https://github.com/undisbeliever/snes-test-roms/blob/master/src/hardware-glitch-tests/setini-early-read-mode7ex.asm

Exact statements / behavior:

- `Tests if the SETINI ($2133) register reads the data-bus too early.`
- `The glitch appears ~20% of the time`
- test purpose is to detect whether enabling `Mode 7 EXTBG` sees the wrong bus
  value at render time

What this gives:

- explicit real-hardware evidence that at least some `Mode 7`-adjacent visible
  behavior can observe an early-read timing hazard
- no explicit statement about first visible scanline `Y`
- useful only as proof that "prefetch / early-read affecting visible output" is
  a real hardware category, not a fantasy

Classification:

- DIRECT for existence of early-read behavior
- INFERRED for relevance to scanline-start `Y`

### `snes-test-roms` repo scan

Source:

- https://github.com/undisbeliever/snes-test-roms

Exact relevant result:

- within the current repo tree, the only direct `Mode 7` hardware-glitch test
  that surfaced for this gate is `setini-early-read-mode7ex.asm`
- other `Mode 7` files found in the repo tree are address-remapping or effect
  tests, not explicit first-visible-line / line-origin tests

What this gives:

- negative evidence: there is no obvious dedicated public test ROM in this set
  that directly states first visible scanline `Y = line` or `line + 1`

Classification:

- DIRECT for test coverage gap

### `Mesen-S`

Source:

- https://github.com/SourMesen/Mesen-S/blob/master/Core/Ppu.cpp

Exact observed behavior:

- `if(_drawStartX == 0) { _state.Mode7.HScrollLatch = _state.Mode7.HScroll; _state.Mode7.VScrollLatch = _state.Mode7.VScroll; }`
- `uint16_t realY = _state.Mode7.VerticalMirroring ? (255 - _scanline) : _scanline;`
- `if(applyMosaic) { realY -= _state.MosaicSize - _mosaicScanlineCounter; }`
- `((_state.Mode7.Matrix[1] * realY) & ~63)`
- `((_state.Mode7.Matrix[3] * realY) & ~63)`
- no nearby comment mentions:
  - `line + 1`
  - prefetch
  - pipeline delay
  - first visible line quirk

What this gives:

- explicit comparison behavior for the current implementation family:
  - scanline index is used directly
  - vertical mirroring is applied before the transform term
  - the `Y` term is chosen once per scanline
- it does **not** claim to model a hardware quirk here

Classification:

- DIRECT for observed implementation behavior
- not hardware truth

## What The Allowed Sources Actually Settle

Settled:

- vertical mirroring is a real `Mode 7` hardware control via `M7SEL`
- `M7Y` is the center `Y` term
- one scanline `Y` is chosen before the scanline is stepped across pixels
- at least one real hardware early-read class exists in `Mode 7`-adjacent
  rendering (`SETINI` / `EXTBG`)

Not settled:

- whether the first visible scanline uses:
  - `line`
  - `line + 1`
  - a latched previous-line value
  - or a prefetched pipeline value
- whether `fullsnes` `line + 1` is:
  - literal hardware timing
  - a coordinate convention
  - or a shorthand for an internal pipeline effect

## Indirect Adjunct Evidence

These sources do not explicitly answer `Mode 7` line-origin `Y`, but they do
constrain what kinds of explanations remain plausible.

### NESdev thread (`93143`)

Source:

- https://forums.nesdev.org/viewtopic.php?t=15878

Relevant statements:

- `line 0 is used to read OAM for the first actual active display line`
- `Mode 7 is the same - the PPU just takes the current scroll position, origin and transform matrix ... and uses them to look up tiles and pixels in VRAM`
- developers `used HDMA to automatically change the Mode 7 parameters after every scanline`

Reading:

- this is indirect support for real per-scanline preparation on the SNES PPU
- it also suggests a "current state for the line" mental model for `Mode 7`
- but it does **not** explicitly say whether the first visible `Mode 7`
  scanline uses:
  - `line`
  - `line + 1`
  - stale previous-line state
  - prefetched next-line state

Classification:

- INDIRECT

### SNESdev `HDMA_examples`

Source:

- https://snes.nesdev.org/wiki/HDMA_examples

Relevant statements:

- `If HDMA and the Main-Loop are both writing to a write-twice register, the internal latch can be overridden by the HDMA write and corrupt the PPU register write.`
- `For example, a HDMA write to BG1HOFS can corrupt M7A if the HDMA write occurs in-between two 65816 CPU M7A writes.`
- `This HDMAEN write must occur during VBlank`

Reading:

- this is indirect proof that scanline-level timing differences and write-twice
  latch hazards are real on SNES PPU state
- it keeps `pipeline / early-read / line-start timing hazard` in play as a
  category
- but it does **not** explicitly state first-visible-line `Mode 7` `Y`
  semantics

Classification:

- INDIRECT

## No-Hit Summary

Under the current strict source filter, there is still no explicit source that
states:

- whether the first visible `Mode 7` scanline uses `line` or `line + 1`
- whether any observed `line + 1` behavior is:
  - real hardware pipeline delay
  - prefetch artifact
  - or coordinate convention
- whether `M7SEL` vertical mirroring creates a top-of-screen asymmetry by
  shifting the effective origin by exactly one line

## Strict Reading For The Current Gate

From allowed sources only:

- `fullsnes` is the only explicit source here that states a `line + 1` style
  `SCREEN.Y`
- `Mesen-S` is the only allowed implementation source here, and it uses the
  current scanline directly
- the public hardware/test surface currently proves early-read glitches and
  scanline-timing hazards exist, but does not yet prove that the first visible
  `Mode 7` scanline uses stale or prefetched `Y`

So the current strict read is:

- `line + 1` is explicitly documented in `fullsnes`
- current-line `Y` is explicitly implemented in `Mesen-S`
- the allowed hardware/test sources do **not** yet break the tie

That means the renderer step can promote the `line + 1` candidate because it
matches the plateau artifacts, but it must still be documented as:

- hardware-consistent candidate
- not settled hardware fact

## Documentation Ask

To break the remaining tie, the most valuable complementary material would be:

- hardware notes or test ROMs that explicitly mention the first visible
  `Mode 7` scanline
- anything that distinguishes:
  - coordinate convention
  - from prefetch/pipeline delay
- any hardware-oriented note that ties `M7SEL` vertical mirroring to
  first-line or top-of-screen off-by-one behavior
