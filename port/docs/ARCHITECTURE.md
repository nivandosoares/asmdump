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
  Fixed-frame orchestration, scheduler-backed runtime-state shadow,
  compare-lane metrics, and PPM dumping for smoke tests.
- `td2_compare.*`
  Trusted-frame compare bundle generation (`runtime | golden | diff`) plus
  machine-readable drift metrics plus seeded PPU-state and callback-state
  contracts.
- `td2_contracts.*`
  Loads validated intro callback/state checkpoints by frame and seeds the
  bootstrap runtime-state shadow for covered fixtures.
- `td2_scheduler.*`
  Minimal callback-family playback for the three promoted rails:
  intro no-input, menu gameplay-entry, and reproducible live-race gameplay.

The promoted smoke fixtures are now exact through the native compositor itself.
`main_visible.ppm` stays in the loop only as the regression golden surface,
and the compare lane now makes that relationship explicit in the runtime while
also asserting that the seeded scene state matches the live `Td2PpuState`.
For frames covered by validated intro checkpoints, the same bootstrap path now
also seeds a runtime callback/state shadow and reports it as
`callback_contract`. The scheduler now replaces the older "seed once at init"
path for covered rails, while design-pack loading also tolerates tracked
bundles that only carry local `raw/` dumps and no golden frame.

## Next replacement steps

1. Move the new scheduler profiles from hardcoded anchor playback into
   contract-driven callback/state rails.
2. Start applying real input-driven state mutation on top of the
   `menu_gameplay_entry` and `gameplay_live_race_mid` families.
3. Promote compare-backed menu/gameplay fixtures so the same
   runtime-or-golden workflow used on intro can gate later rails too.
