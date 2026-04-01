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
- scripted input windows via `--input-script`
- shared scripted/live input mutator surface on top of scheduler rails
- measured visible-scanline gameplay overlay for
  promoted gameplay bundles, selected from
  `../rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- first input-driven mutations on top of that shared surface:
  current `JOY1` sample mirrored into runtime state as `state_0960`, plus the
  traced no-opponent menu handoff on `menu_gameplay_entry`
- promoted post-`2050` default-rival `A` anchors on `menu_gameplay_entry`
  across `2052`, `2053`, `2083`, `2104`, and `2125`
- headless frame dumping for regression smoke and design review in both PPM
  and PNG

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

Direct scheduler playback with scripted input:

```sh
./port/build/td2_port \
  --scene-dir tools/out/design_lane3_live_race_mid_frame0_native \
  --scheduler-profile gameplay_live_race_mid \
  --input-script '3:a' \
  --headless \
  --frames 1
```

Interactive SDL playback:

```sh
./port/build/td2_port \
  --scene-dir tools/out/design_frame1500_car_select \
  --scheduler-profile menu_gameplay_entry
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
  the shared JSONC contract, not hardcoded C anchors. The gameplay rail also
  proves that its scanline profile is loaded and that key framebuffer pixels
  preserve the restored sky/mountain/roadside split.
- `make -C port test` now also runs `test_input_mutation.sh`, which proves:
  - gameplay `--input-script` buttons mirror into `state_0960`
  - the traced menu no-opponent route mutates the downstream
    `$1C70 / $1C76` handoff
  - the default-rival `A` lane mutates promoted post-`2050` anchors over
    `state_09a2/state_09a8/state_137c` and
    `dp_0020/dp_0022/dp_0053/dp_0054`
- `make -C port test` now also runs `test_live_input.sh`, which proves:
  - SDL keyboard mapping into SNES `JOY1` bits
  - SDL game-controller mapping into the same `JOY1` bits
  - live-input history can drive the traced no-opponent menu handoff
  - live current input and scripted prehistory merge on the same mutator
    surface for the default-rival `A` corridor
- `make -C port test` now also runs `test_scanline_contract.sh`, which proves:
  - bundles without a matching gameplay scanline contract stay flat
  - `gameplay_live_race_mid` loads its versioned scanline overlay and keeps
    the restored sky/mountain/grass split
  - `lane3_live_entry_frame03250_bundle/design_pack` now also loads through
    the same contract surface even without a scheduler rail
- `--dump-prefix` now emits `PATH_00000.ppm` and `PATH_00000.png`; compare
  dumps also emit PNG siblings for `_reference`, `_diff`, and `_compare`.
- interactive keyboard mapping:
  - `Z/X/A/S` -> `B/A/Y/X`
  - `Q/W` -> `L/R`
  - `Enter` -> `Start`
  - `Tab` or `Backspace` -> `Select`
  - arrow keys -> d-pad
- interactive controller mapping:
  - south/east/west/north face buttons -> `B/A/Y/X`
  - shoulders -> `L/R`
  - start/back -> `Start/Select`
  - d-pad or left stick -> directions
- current practical boundary: if a menu/gameplay branch depends on decisions
  that happen before the design-pack base frame, fully live reproduction on
  that bundle still needs earlier seeds or scripted prehistory. Live SDL input
  now shares the same mutator surface, but it does not fabricate missing
  history before the loaded bundle.
- current gameplay-specific boundary: only the promoted
  `gameplay_live_race_mid` seed is visually closed by the current scanline
  contract fields. The promoted `lane3_live_entry_frame03250` bundle now also
  loads a scanline contract, but its current render is still `0` pixels
  different from a no-contract clone, which means later gameplay phases still
  need more fields than `main_layers/bg1/bg2/bg3` scrolls alone.
- `tools/push_checkpoint.sh` is the repo-local wrapper for the post-push step:
  it pushes the current checkpoint, refreshes the curated wiki in an isolated
  temporary `git worktree`, and issues a follow-up wiki refresh commit/push
  without sweeping unrelated local dirty files into that commit. It also
  cleans the local generated wiki outputs back to the pushed state.
