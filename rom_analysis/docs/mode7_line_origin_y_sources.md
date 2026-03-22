# Mode 7 Line-Origin `Y` Sources for the Static Plateau Gate

This note narrows the current `Mode 7/BG1` gate to one question only:

- what is the correct scanline-start `Y` term for the late-attract plateau?

Only sources that directly touch:

- `startY` / line-origin semantics
- vertical mirroring interaction
- first-line / first-pixel scanline `Y`

are included here.

## Direct Evidence

### `fullsnes`

Source:

- https://problemkaputt.de/fullsnes.htm

Relevant behavior:

- `SCREEN.Y = Display (Target) Y-Coordinate: (1..224 or 1..239) XOR (yflip*FFh)`
- `IF yflip THEN SCREEN.Y=((1..224/239) XOR FFh), ELSE SCREEN.Y=(1..224/239)`
- `VRAM.X = VRAM.X + ((M7B*SCREEN.Y) AND NOT 3Fh) + (M7A*SCREEN.X)`
- `VRAM.Y = VRAM.Y + ((M7D*SCREEN.Y) AND NOT 3Fh) + (M7C*SCREEN.X)`
- `After calculating the left-most pixel of a scanline, the following pixels on that scanline can be also calculated by increasing VRAM coordinates`

Reading:

- direct documentation for `line + 1` style `SCREEN.Y`
- direct documentation that vertical mirroring applies to the screen-space `Y`
  term before the transform contribution
- direct documentation that the `Y` term is shared for the whole scanline,
  while only the `X` term advances per pixel

Classification:

- direct

### `Snes9x`

Sources:

- https://github.com/snes9xgit/snes9x/blob/master/gfx.cpp
- https://github.com/snes9xgit/snes9x/blob/master/tileimpl.h

Relevant behavior:

- `RenderLine`: `p->M7HOFS = PPU.M7HOFS`, `p->M7VOFS = PPU.M7VOFS`
- `tileimpl.h`:
  - `if (PPU.Mode7VFlip) starty = 255 - (int) (Line + 1); else starty = Line + 1;`
  - `BB = ((l->MatrixB * starty) & ~63) + ((l->MatrixB * yy) & ~63) + (CentreX << 8);`
  - `DD = ((l->MatrixD * starty) & ~63) + ((l->MatrixD * yy) & ~63) + (CentreY << 8);`

Reading:

- direct implementation of `line + 1`
- direct implementation of vertical mirroring before the transform term
- direct per-scanline snapshotting of `Mode 7` state before draw

Classification:

- direct

### `Mesen-S`

Source:

- https://github.com/SourMesen/Mesen-S/blob/master/Core/Ppu.cpp

Relevant behavior:

- `if(_drawStartX == 0) { _state.Mode7.HScrollLatch = _state.Mode7.HScroll; _state.Mode7.VScrollLatch = _state.Mode7.VScroll; }`
- `uint16_t realY = _state.Mode7.VerticalMirroring ? (255 - _scanline) : _scanline;`
- `if(applyMosaic) { realY -= _state.MosaicSize - _mosaicScanlineCounter; }`
- `((_state.Mode7.Matrix[1] * realY) & ~63)`
- `((_state.Mode7.Matrix[3] * realY) & ~63)`

Reading:

- direct implementation of current-scanline `Y`, not `line + 1`
- direct implementation of vertical mirroring before the transform term
- direct statement that scroll offsets are latched per scanline

Classification:

- direct

### `bsnes`

Source:

- https://github.com/bsnes-emu/bsnes/blob/master/bsnes/sfc/ppu-fast/mode7.cpp

Relevant behavior:

- `int Y = this->y;`
- `if(self.mosaicEnable) Y -= io.mosaic.size - io.mosaic.counter;`
- `int y = !io.mode7.vflip ? Y : 255 - Y;`
- `int originX = ... + (b * y & ~63) + ...`
- `int originY = ... + (d * y & ~63) + ...`

Reading:

- direct implementation that mirroring applies before the transform term
- direct implementation that one `y` value seeds the whole scanline origin
- whether `this->y` is semantically the current scanline index is strong from
  the surrounding scanline-based renderer structure, but not stated in the
  snippet itself

Classification:

- inferred for exact `current line` semantics

### `ares`

Source:

- https://github.com/ares-emulator/ares/blob/master/ares/sfc/ppu/mode7.cpp

Relevant behavior:

- `u32 y = self.vcounter();`
- `if(self.bg1.mosaic.enable) y -= self.mosaic.voffset();`
- `if(self.io.vflipMode7) y = 255 - y;`
- `s32 originX = ... + (b * y & ~63) + ...`
- `s32 originY = ... + (d * y & ~63) + ...`

Reading:

- direct implementation that mirroring applies before the transform term
- direct implementation that one `y` value seeds the scanline origin
- `vcounter()` strongly suggests current scanline origin rather than `line + 1`,
  but that exact semantic is not explained in the snippet itself

Classification:

- inferred for exact `current line` semantics

### `SNESdev PPU registers`

Source:

- https://snes.nesdev.org/wiki/PPU_registers

Relevant behavior:

- `M7SEL ... flip vertical (Y), flip horizontal (X)`
- `M7Y ... Mode 7 center Y`

Reading:

- direct register-level confirmation that vertical mirroring is a first-class
  `Mode 7` control and that `M7Y` is the center term
- does not specify whether the line-origin `Y` is `line` or `line + 1`

Classification:

- direct for vertical-mirroring control

## Current Conflict Surface

The direct sources split into two camps.

`line + 1` camp:

- `fullsnes`
- `Snes9x`

current-line camp:

- `Mesen-S`
- `bsnes`
- `ares`

What they still agree on:

- one vertical term is chosen once per scanline
- vertical mirroring is applied before the transform contribution
- that mirrored/unmirrored `Y` contributes through the `B/D` terms

What they disagree on:

- whether the scanline-start `Y` is:
  - current line
  - or `line + 1`

## Practical Reading for the Plateau

The plateau audit already proved:

- `screenY + 1` collapses the composed-screen compare to `0`
- at both tested plateau ends (`1105`, `1117`)

This new source read does not settle hardware truth by itself, but it does
explain why that happened:

- the `screenY + 1` result is not an arbitrary tweak
- it matches both:
  - `fullsnes`
  - `Snes9x`

The next renderer step should therefore treat `line + 1` as a serious candidate
for the composed-screen path, while explicitly preserving the source conflict in
the docs until another proof surface breaks the tie.

Documentation ask for the next iteration:

- hardware-oriented notes or test ROMs that say whether the first visible Mode 7
  scanline uses current-line `Y` or `line + 1`
- any implementation note that explains the disagreement as:
  - naming convention only
  - prefetch/pipeline delay
  - or an actual emulator accuracy choice
