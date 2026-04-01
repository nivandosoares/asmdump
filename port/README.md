TD2 SNES-mimetic runtime bootstrap.

This directory now tracks the new port direction: a faithful reimplementation
that owns SNES-like runtime state and uses SDL only as the host/presentation
layer. The immediate model is the local `../zelda3/` port:

- extracted asset packs are separate from the runtime
- the runtime keeps WRAM/VRAM/OAM/CGRAM shadow state
- SDL presents a native window and audio/input host
- frame/state comparison stays a first-class validation path

Current checkpoint:

- fixed 60 Hz SDL host loop
- `Td2PpuState` shadow seeded from extracted design packs plus `ppu_state.json`
- synthetic SNES BG/OBJ/Mode7 rasterization from raw `VRAM/CGRAM/OAM/PPU`
  state
- Zelda3-style compare lane:
  runtime | golden | diff bundle plus JSON drift summary
  plus seeded PPU-state and callback-state contract checks
- minimal callback scheduler profiles for:
  - `intro_noinput`
  - `menu_gameplay_entry`
  - `gameplay_live_race_mid`
- contract-fed scheduler rails for menu/gameplay playback in
  `../rom_analysis/docs/scheduler_rail_contracts.jsonc`
- headless frame dumping for regression smoke

This is deliberately not the final renderer. It is the clean replacement for
the old “invented gameplay” scaffolds and the base for real callback/state
execution.

Build:

```sh
make -C port
```

Run:

```sh
./port/build/td2_port --scene-dir port/assets/test_dump_frame300/design_pack
```

Headless smoke:

```sh
make -C port test
```

Direct compare lane:

```sh
./port/build/td2_port \
  --scene-dir port/assets/test_dump_frame300/design_pack \
  --headless \
  --frames 1 \
  --compare \
  --dump-prefix port/build/frame300_compare
```

Direct scheduler playback on a tracked bundle without a golden:

```sh
./port/build/td2_port \
  --scene-dir tools/out/design_frame1500_car_select \
  --scheduler-profile menu_gameplay_entry \
  --headless \
  --frames 1 \
  --dump-prefix port/build/menu1500
```

Notes:

- `../zelda3/` and `../sentrysearch/` are local investigation aids only and
  are intentionally ignored by the repo git.
- The promoted smoke fixtures now render exactly from raw state in the native
  runtime; `layers/main_visible.ppm` remains a regression golden, not the
  render source.
- Design packs that only carry `raw/` dumps and no `layers/main_visible.ppm`
  now load correctly when compare is not requested. This is what makes the
  promoted menu/gameplay investigation bundles runnable in the SDL runtime.
- The compare JSON now carries `state_contract`, so `--fail-on-compare-diff`
  fails on both pixel drift and semantic drift in the seeded scene state.
- For frames that exist in `rom_analysis/docs/callback_state_contracts.jsonc`,
  the runtime also seeds a callback/state shadow and emits `callback_contract`
  in the compare JSON. The first promoted callback-backed fixture is
  `frame_01093`.
- `make -C port test` now also runs `test_scheduler.sh`, which validates the
  three promoted scheduler rails:
  intro no-input, menu with input, and the reproducible live-race gameplay
  seed. Menu and gameplay now prove `scheduler_contract` state coming from
  the shared JSONC contract, not hardcoded C anchors.
- `tools/push_checkpoint.sh` is the repo-local wrapper for the post-push step:
  it pushes the current checkpoint, refreshes the curated wiki in an isolated
  temporary `git worktree`, and issues a follow-up wiki refresh commit/push
  without sweeping unrelated local dirty files into that commit. It also
  cleans the local generated wiki outputs back to the pushed state.
