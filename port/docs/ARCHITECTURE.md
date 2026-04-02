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
  SDL host shell with optional headless mode, plus live keyboard/controller
  sampling mapped into SNES-style `JOY1` bits.
- `td2_io.*`
  Loads a design pack plus the raw `vram.bin`, `cgram.bin`, `oam.bin`, and
  `ppu_state.json` state that belongs to it.
- `td2_ppu.*`
  Holds the SNES PPU shadow state and rasterizes BG/OBJ/Mode7 directly from
  raw state. For the promoted `gameplay_live_race_mid` rail, it now also
  accepts a measured visible-scanline overlay so gameplay is not forced
  through one flat frame-end `ppu_state`. That overlay is now selected from a
  versioned contract file instead of one ad hoc sibling-path lookup. The same
  PPU path now also accepts a versioned late-gameplay composition profile
  that can enable `BG3` on a top band and keep `BG3 > BG2` there.
- `td2_runtime.*`
  Fixed-frame orchestration, scheduler-backed runtime-state shadow,
  compare-lane metrics, and PPM+PNG dumping for smoke tests and design review.
  It also resolves the current optional gameplay scanline profile
  attachment from `../rom_analysis/docs/gameplay_scanline_contracts.jsonc`.
  The current tracked sources behind that contract feed per-scanline
  `main_layers` and `bg1/bg2/bg3` scroll values into:
  - `../tools/out/design_lane3_live_race_mid_frame0_native`
  - `../tools/out/lane3_live_entry_frame03250_bundle/design_pack`
  - `../tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack`
  - `../tools/out/lane3_live_entry_frame03550_bundle/design_pack`
  The same runtime layer now also resolves optional gameplay composition
  profiles from `../rom_analysis/docs/gameplay_composition_contracts.jsonc`
  for:
  - `../tools/out/lane3_live_entry_frame03250_bundle/design_pack`
  - `../tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack`
  - `../tools/out/lane3_live_entry_frame03550_bundle/design_pack`
- `td2_input.*`
  Shared parser/query layer for scripted input windows and recorded live input
  history, using the same `frame:buttons` / `start-end:buttons` syntax used by
  the Mesen-side tools.
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
  The menu/gameplay rails are now loaded from
  `rom_analysis/docs/scheduler_rail_contracts.jsonc`, while intro remains on
  the callback model path. The input overlay now also lives here, with live
  SDL history and `--input-script` windows merged into the same route/mutator
  surface: current `JOY1` sample into `state_0960`, the traced no-opponent
  route mutator for the menu corridor, and a measured post-`2050`
  default-rival `A` overlay over the exact
  `2052..2088` window plus later anchors `2104` and `2125`, covering
  `state_09a2/state_09a8/state_137c` and
  `dp_0020/dp_0022/dp_0053/dp_0054`.

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

1. Keep promoting stronger measured late-gameplay scanline consumers where the
   current `main_layers/bg1/bg2/bg3` field family already pays off:
   `3400` and now `3550` both materially improve over composition-only
   rendering, while `3250` remains the useful counterexample where the same
   fields are still a no-op.
2. Promote compare-backed menu/gameplay fixtures so the same
   runtime-or-golden workflow used on intro can gate later rails too.
3. Replace pre-bundle scripted route history with earlier scene bases or
   compiled route seeds where the current bundle starts too late for fully
   interactive live input to reproduce the branch on its own.
