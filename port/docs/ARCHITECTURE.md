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
  Loads a design pack plus the raw `vram.bin`, `cgram.bin`, and `oam.bin`
  state that belongs to it.
- `td2_ppu.*`
  Holds the SNES PPU shadow state and renders the exact extracted
  `main_visible.ppm` reference frame.
- `td2_runtime.*`
  Fixed-frame orchestration plus PPM dumping for smoke tests.

The renderer is therefore exact for promoted design-pack fixtures while the
synthetic PPU compositor is still pending. This is deliberate: the repo now has
the right host/runtime shape without carrying fake gameplay code forward.

## Next replacement steps

1. Replace `main_visible.ppm` blitting with rasterization from raw
   `VRAM/CGRAM/OAM/PPU` state.
2. Add a callback/state execution spine driven by validated bank ownership,
   starting with front-end callback families.
3. Add a side-by-side compare lane, Zelda3-style, so frame/state drift is
   reported automatically against trusted traces.
4. Feed gameplay windows from the archaeology docs and SentrySearch chunk
   workflow into the same runtime/validation loop.
