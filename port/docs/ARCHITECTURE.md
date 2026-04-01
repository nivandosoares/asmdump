# TD2 Runtime Architecture

## Goal

The port is now a SNES-mimetic reimplementation:

- gameplay logic should stay organized around SNES callback/state ownership
- SDL is only the host for windowing, timing, input, and audio
- extracted design packs and raw `VRAM/CGRAM/OAM/PPU` dumps remain the
  bootstrap/reference surface, not the final renderer

This mirrors the working pattern from the local `../zelda3/` reference:

1. extracted assets live outside the runtime code
2. the runtime owns SNES-like state directly
3. frame/state comparison is part of normal development, not a side tool

## Current bootstrap

The current code intentionally does only the minimum clean work:

- `platform_sdl.*`
  SDL host shell with optional headless mode.
- `td2_io.*`
  Loads a design pack plus the raw `vram.bin`, `cgram.bin`, `oam.bin`, and
  `ppu_state.json` state that belongs to it.
- `td2_ppu.*`
  Holds the SNES PPU shadow state and rasterizes BG/OBJ/Mode7 directly from
  raw state.
- `td2_runtime.*`
  Fixed-frame orchestration plus PPM dumping for smoke tests.

The promoted smoke fixtures are now exact through the native compositor itself.
`main_visible.ppm` stays in the loop only as the regression golden surface.

## Next replacement steps

1. Add a callback/state execution spine driven by validated bank ownership,
   starting with front-end callback families.
2. Add a side-by-side compare lane, Zelda3-style, so frame/state drift is
   reported automatically against trusted traces.
3. Feed gameplay windows from the archaeology docs and SentrySearch chunk
   workflow into the same runtime/validation loop.
