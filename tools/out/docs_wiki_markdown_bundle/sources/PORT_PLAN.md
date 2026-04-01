# The Duel: Test Drive II PC Port Plan

## Goal

Deliver a faithful PC reimplementation in C with SDL by rebuilding the game
runtime around extracted ROM assets, verified game behavior, and SNES-mimetic
runtime state.

This should be treated as a reimplementation, not a direct assembly-to-C translation.

## Strategy Reset

Reviewed on `2026-04-01`.

The dev team changed the port target. The runtime must now mimic SNES-visible
behavior directly while using SDL only as the native host/presentation layer.
The attached local `zelda3/` repo is the reference architecture pattern for
this approach, but it is not a vendored dependency and must stay outside our
Git history.

Reset rules:

- stop carrying forward bespoke PC-side gameplay or physics substitutions
  unless they are explicitly demoted to temporary debug viewers
- keep archaeology, extraction, and validation lanes; they now feed a
  side-by-side runtime/compare spine instead of a translated “new engine”
- build the runtime around SNES-like `WRAM`, `VRAM`, `OAM`, `CGRAM`, `PPU`,
  and later `APU/DMA/IRQ/NMI` state ownership
- treat extracted `design_pack` / `main_visible.ppm` surfaces as bootstrap
  fixtures and regression goldens, not the final rendering model
- use the attached local `sentrysearch/` repo and `the_duel_longplay.mp4`
  only as ignored investigation aids

## Why This Strategy

The current repo is a usable reverse-engineering base, but it is not yet a decompilation:

- `bank0.asm` contains recognizable startup, NMI, IRQ, and scheduler logic.
- `bank10.asm` and `bank11.asm` contain mixed code/data and large undecoded regions.
- `bank30.asm` looks like tables mixed with control data rather than a clean jump table listing.
- `game.sym` provides address coverage, but not meaningful names.
- `Makefile` only rebuilds the ROM; there is no extraction or validation pipeline yet.

That means the fastest path to a shippable port is:

1. Build a reference harness around the original ROM.
2. Extract and type the content into stable PC-side formats.
3. Reimplement systems in C/SDL against those verified assets and behaviors.

## Target Architecture

### Runtime

- Language: C99 or C11
- Host platform: SDL2 window, timing, input, audio
- Internal framebuffer: 256x224 at 60 Hz
- Core state: SNES-like `WRAM`, `VRAM`, `OAM`, `CGRAM`, visible PPU register
  shadow, and later DMA / IRQ / NMI / APU ownership
- Frame execution: deterministic callback/state stepping driven by validated
  bank ownership
- Renderer bootstrap: exact extracted visible layers for smoke and regression
- Renderer target: synthetic PPU-style rasterization from raw state
- Validation: optional side-by-side frame/state compare against ROM traces in
  the Zelda3 pattern
- Asset source: extracted ROM data converted to stable neutral files or
  compiled blobs

### Code Modules

- `platform/`: SDL host shell, window, timing, input, audio
- `runtime/`: frame step, scheduler, callback families, system state shadow
- `ppu/`: BG/OBJ/Mode7/color math/HDMA-visible behavior
- `apu/`: SPC-facing command/mixer path once promoted
- `content/`: design-pack loaders, raw-state bundles, typed extracted assets
- `contracts/`: frame/state compare, checkpoints, replay and diff helpers
- `tools/`: ROM extraction, validation, diff, replay helpers

## Current Milestone Update

Reviewed on `2026-04-01`.

The archaeology evidence below still matters, but the old sampled/front-end
runtime path is now demoted to a bootstrap/reference lane. It should feed the
new SNES-mimetic runtime, not define the final port architecture.

New useful state beyond the original plan:

- the new `port/` bootstrap now renders promoted design-pack fixtures
  synthetically from raw `VRAM/CGRAM/OAM/PPU` state, with exact parity on
  frame `300` and frame `1086`
- the runtime now also has a first Zelda3-style compare lane for promoted
  design-pack fixtures:
  - native runtime frame
  - trusted `main_visible` golden
  - absolute RGB diff map
  - side-by-side strip plus JSON drift metrics
  - seeded PPU-state contract report over visible registers, layer metadata,
    and raw `VRAM/CGRAM/OAM` parity
  - seeded callback/state contract report for frames covered by validated
    intro checkpoints, with the first promoted callback-backed fixture at
    frame `1093`
- the runtime now also has a minimal callback scheduler with three promoted
  rails instead of only seeded state:
  - `intro_noinput`
  - `menu_gameplay_entry`
  - `gameplay_live_race_mid`
- the non-intro scheduler rails now load from
  `rom_analysis/docs/scheduler_rail_contracts.jsonc` instead of hardcoded C
  anchors, so menu/gameplay playback is driven by versioned contract data
- the runtime now also accepts scripted input windows and applies the first
  real input-driven mutations on top of those rails:
  - `state_0960` now reflects the current `JOY1` sample from active
    `--input-script` buttons
  - the menu rail now recognizes the traced no-opponent route
    (`right+down`, then confirm) and carries the downstream
    `$1C70 = 3 / $1C76 = 0` handoff instead of the default rival baseline
  - the same menu rail now also carries promoted post-`2050`
    default-rival `A` measurements across the exact `2052..2088` window plus
    later anchors `2104` and `2125`, over tracked fields
    `state_09a2/state_09a8/state_137c` and
    `dp_0020/dp_0022/dp_0053/dp_0054`
- the SDL host now also feeds live keyboard/controller state into that same
  runtime mutator surface instead of keeping live input separate from replay:
  - `platform_sdl` maps keyboard and SDL game-controller samples into SNES
    `JOY1` bits
  - `td2_scheduler` merges recorded live input history with scripted windows
    for route tests and downstream mutators
  - the current promoted live proofs are:
    - frame-local gameplay `JOY1` sampling on `gameplay_live_race_mid`
    - traced no-opponent handoff on `menu_gameplay_entry`
    - scripted-history plus live-`A` merge for the measured
      default-rival `2050..2088` corridor
  - practical boundary: branches whose required history starts before the
    bundle base frame still need earlier seeds or scripted prehistory; live
    SDL input now uses the same surface, but it does not invent missing
    pre-bundle route history
- gameplay scanline overlays are now selected from the versioned contract:
  - `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
  - current tracked source traces:
    - `tools/out/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json`
    - `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
  - current attached fields:
    - `main_layers`
    - `bg1/bg2/bg3` `HOFS/VOFS`
  - current promoted consumers:
    - `gameplay_live_race_mid`
    - `lane3_live_entry_frame03250_bundle/design_pack`
  - current practical read:
    - the live-race seed is the first solved consumer of that surface and now
      restores the horizon/roadside boundary natively
    - the `3250` late-entry bundle now loads through the same contract path,
      but current compare against a no-contract clone is still `0` pixels
      different, which is strong evidence that this later phase needs more
      than `main_layers/bg1/bg2/bg3` scrolls to recover the visible stack
- runtime frame dumps now emit PNG siblings next to the existing PPM artifacts
  so design review can follow each checkpoint without manual conversion
- that scheduler now executes validated callback-family handoffs across:
  - intro `986 -> 1117`
  - menu/input corridor `1500 -> 2050`
  - live gameplay seed `3 -> 11`
- the design-pack loader now tolerates tracked bundles that only carry local
  `raw/` memory dumps and no `layers/main_visible.ppm`; this makes promoted
  menu/gameplay investigation packs directly runnable in the SDL runtime when
  compare is not requested

- the frame-`300` copyright/credits scene is an exact solved target from both live Mesen dumps and a ROM-side builder
- the `Ballistic presents` splash now has a deterministic entry anchor at frame `654`
- the `L00A35A -> 01:A39C` path is identified as a palette-driven BG attract state, not a sprite-heavy scene
- the SDL runtime can now play sampled intro/front-end scene manifests built from extracted `VRAM + CGRAM + PPU state`
- the SDL runtime can now also auto-load optional `oam.bin` data for extracted SNES scenes and composite OBJ sprites
- the first native front-end clip now exists in two forms:
  - a measured reference clip derived from deterministic screenshots
  - a ROM-derived clip generated from the helper-scene CGRAM plus the `A39C` `04:99ED` ramp
- the SDL runtime now also has a direct `ballistic_a39c` sequence path:
  - it keeps the indexed Ballistic image compact
  - it rebuilds the visible palette from helper-scene CGRAM plus the live `A39C` ramp logic at runtime
- the first full no-input attract loop is now playable in the SDL runtime as an exact sampled image sequence (`1418` frames, repeating from `654 -> 2072`)
- the current best intro-loop runtime artifact is a hybrid manifest:
  - direct runtime `ballistic_a39c` Ballistic (`654..958`)
  - sampled bootstrap image playback for `958..978`
  - queue-driven `snes_bg` replacements for frames `978` and `982`
  - sampled image playback for the remaining later attract states, starting again at frame `986`
- there is now also a repeatable experimental ROM-side `L00A00C` builder:
  - it applies the direct setup uploads onto seeded `VRAM/CGRAM`
  - it is useful for iterating on the `958..977` bootstrap
  - it is not exact yet, which narrows the missing behavior to more than the obvious direct uploads
- the bootstrap side now also has a decoded WRAM queue artifact:
  - `tools/out/intro_bootstrap_958_974_queue.json`
  - frame `974` arms exactly two `0600` DMA descriptors (`1A:9948 -> VRAM 0x4000`, `1A:A988 -> VRAM 0x4900`)
  - `0700..091F` is confirmed as staged OAM data for the following NMI upload
- that queue data is now exercised by a derived scene artifact:
  - `tools/out/bank1_bootstrap_queue_978.*`
  - current compare vs the real frame `978` screenshot: `2` mismatched pixels
- the next queue window is also closed enough to use:
  - `tools/out/intro_bootstrap_978_982_queue.json`
  - `tools/out/bank1_bootstrap_queue_982.*`
  - current compare vs the real frame `982` target: `2` mismatched pixels
- the following queue window is not yet closed:
  - `tools/out/intro_bootstrap_982_986_queue.json`
  - `tools/out/bank1_bootstrap_queue_986.*`
  - current compare vs the real frame `986` target: `958` mismatched pixels (`1.670619%`)
  - disabling OBJ on the same derived scene drops that to `21` mismatched pixels (`0.036621%`) via `tools/out/bank1_bootstrap_queue_986_noobj.*`
  - using the clean bridge OAM reaches the same `21`-pixel baseline via `tools/out/bank1_bootstrap_queue_986_bridgeoverride.*`
  - dedicated OAM delta artifact:
    - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.json`
    - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.md`
  - the full `544`-byte OAM dumps diverge by `37` bytes at `986` (`35` low-table, `2` high-table)
  - sprite-level reading at `986`: the probe dump carries `9` changed visible sprites while the bridge dump carries `0`; the whole late overlay is already cleared in the bridge-visible path
  - practical reading: the next blocker is Mode 7 OBJ composition, not the queued BG/state path
- the next queue window is now also reproducible against bridge output:
  - `tools/out/intro_bootstrap_986_990_queue.json`
  - `tools/out/bank1_bootstrap_queue_990_bridgeobj.*`
  - current compare vs the real frame `990` screenshot: `1518` mismatched pixels (`2.647182%`)
  - current compare vs Mesen `main_visible.ppm`: `2` mismatched pixels (`0.003488%`)
  - dedicated OAM delta artifact:
    - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.json`
    - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.md`
  - the full `544`-byte OAM dumps diverge by `92` bytes at `990` (`86` low-table, `6` high-table)
  - sprite-level reading at `990`: the probe dump carries `23` changed visible sprites while the bridge dump carries `5`; the first `5` sprites are repositioned/resized into a compact bridge-visible cluster and the remaining `18` probe sprites disappear entirely
  - practical reading: native intro coverage can now move forward through frame `990` when measured against extracted Mesen scene output, but not yet against the final captured screen
- the next unresolved bridge-native edge is frame `994`:
  - `tools/out/intro_bootstrap_990_994_queue.json`
  - `tools/out/bank1_bootstrap_queue_994_bridgeobj.*`
  - current compare vs the real frame `994` screenshot: `2143` mismatched pixels (`3.737095%`)
  - current compare vs Mesen `main_visible.ppm`: `96` mismatched pixels (`0.167411%`)
  - current OAM variant compare:
    - `tools/out/intro_oam_deltas/frame_994_variant_compare.json`
    - `tools/out/intro_oam_deltas/frame_994_variant_compare.md`
  - the current committed `994` scene variants (`fromraw990` vs `bridgeobj`) now share identical OAM (`0` raw diff bytes, `0` sprite deltas)
  - practical reading: by `994`, the remaining screenshot gap in the committed artifacts is no longer explained by a probe-vs-bridge OAM fork
- the bridge-visible late attract window now has a second, stronger model:
  - `tools/build_mode7_source_scene.py`
  - `tools/out/bank1_mode7_visible_991.*` through `tools/out/bank1_mode7_visible_997.*`
  - the model seeds from bridge frame `990` VRAM and patches the visible `0x4920/0x49A0` Mode 7 buffers directly from three rotating ROM chunks:
    - `1A:AA10`
    - `1A:AB58`
    - `1A:ACA0`
  - current compare vs Mesen `main_visible.ppm`:
    - frames `991..997`: `4` mismatched pixels each
  - practical reading: the derived bridge-visible attract path is now reproducible through frame `997` even though the final screenshot path is still not closed there
- the same `01:9FE5` callback family now also has direct bridge-extracted native coverage for the next aligned sampled block:
  - `tools/out/mesen_range_998_1005_v1/sequence.txt`
  - `tools/out/mesen_range_1006_1013_v1/sequence.txt`
  - `tools/out/mesen_range_1014_1021_v1/sequence.txt`
  - `tools/out/mesen_range_1022_1029_v1/sequence.txt`
  - `tools/out/mesen_range_1030_1037_v1/sequence.txt`
  - `tools/out/mesen_range_1038_1045_v1/sequence.txt`
  - `tools/out/mesen_range_1046_1053_v1/sequence.txt`
  - `tools/out/mesen_range_1054_1061_v1/sequence.txt`
  - `tools/out/mesen_range_1062_1069_v1/sequence.txt`
  - `tools/out/mesen_range_1070_1077_v1/sequence.txt`
  - `tools/out/mesen_range_1078_1085_v1/sequence.txt`
  - `tools/out/mesen_range_1086_1093_v1/sequence.txt`
  - frame `998` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 152`
  - frame `1005` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 3`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 208`
  - frame `1013` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 8`
  - frame `1014` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 16`
  - frame `1021` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
  - frame `1022` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
  - frame `1029` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 40`
  - frame `1037` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 56`
  - frame `1045` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 72`
  - frame `1053` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 88`
  - frame `1061` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 9`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 14`, `$0054 = 104`
  - frame `1069` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 11`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 16`, `$0054 = 120`
  - frame `1077` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
  - frame `1085` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
  - frame `1093` probe state: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
  - the SDL runtime now uses the `mode7-ppu`-style per-scanline OBJ compositor for Mode 7 `snes_bg` scenes, which collapses the `1022/1023/1025` outlier frames from multi-thousand-pixel mismatch down into the same `8..11` range as the rest of this block
  - SDL playback from `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt` now matches Mesen `main_visible` within `2..144` mismatched pixels for frames `998..1093`
  - subsequent direct bridge-extracted frames `1030..1037` all matcher at `0,0,0,0,4,3,0,0` mismatched pixels
  - promoted direct bridge-extracted frames `1038..1045` land at `6,6,9,12,13,11,16,15` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1046..1053` land at `13,13,16,18,18,18,17,14` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1054..1061` land at `14,14,15,16,19,20,21,22` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1062..1069` land at `25,26,26,21,26,23,23,25` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1070..1077` land at `29,27,26,28,34,33,39,32` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1078..1085` land at `41,41,47,47,58,63,60,69` mismatched pixels against Mesen `main_visible.ppm`
  - newly promoted direct bridge-extracted frames `1086..1093` land at `89,92,89,90,102,115,144,129` mismatched pixels against Mesen `main_visible.ppm`
- the repo now carries two intro-loop manifests on purpose:
  - `tools/out/intro_loop_hybrid_sequence.txt`: screenshot-exact current best
  - `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt`: bridge-accurate native-coverage current best through frame `1093`

Immediate next focus:

1. Promote compare-backed fixtures for the new menu/gameplay rails wherever a
   trusted `main_visible` golden exists.
2. Extend the measured menu window beyond `2088` only when fresh probes close
   another bounded post-`2050` block.
3. Move pre-bundle route history out of ad hoc scripts by promoting earlier
   scene bases or trace-compiled route seeds for menu/gameplay branches whose
   first required decisions happen before the current bundle start.
4. Keep intro archaeology moving only where it tightens callback ownership or
   renderer behavior, not as a polishing lane by itself.
5. Use the local SentrySearch chunk workflow plus the longplay anchor packs to
   keep gameplay investigation keyed to named windows and reusable query terms.

## Execution Reset

Reviewed on `2026-03-19`.

The repo is now operating against a `90`-step cleanup-and-refocus plan instead
of treating maintainability work as a side quest.

This does **not** replace the current port strategy or archaeology lane order.
It adds a cross-cutting execution track that is meant to unblock the current
intro push and make the repo maintainable enough to carry into the actual port.

Immediate refocus rules:

1. Stop the bleeding first:
   - fix ignore policy
   - untrack generated bridge/emulator output
   - remove hard-coded personal machine paths from promoted scripts and
     Makefiles
2. Treat renderer correctness gaps as real product work:
   - mirrored OBJ bugs
   - BG4 support
   - tile-priority handling
   - explicit unsupported-feature boundaries for scenes that still exceed the
     current renderer
3. Promote shared contracts:
   - versioned cross-tool schemas
   - machine-readable address registry
   - explicit checkpoint IDs instead of substring matching
   - pinned Mesen / `MesenCore` compatibility for the bridge path
4. Isolate validation runs:
   - stop depending on mutable shared `LuaScriptData` output as the default
     working surface
   - move toward per-run outputs and repo-owned templates
5. Keep intro progress moving in parallel:
   - close the `958..977` bootstrap gap
   - fix the `986+` final-screen composition gap
   - keep replacing sampled attract segments with native callback/state playback

Refocus success criteria:

- no personal paths in promoted scripts or Makefiles
- no committed bridge build output or mutable `LuaScriptData` output
- versioned shared formats and explicit checkpoint IDs for validation
- clearer renderer feature boundaries, with BG4/tile-priority/OBJ correctness
  tracked as active work
- intro native coverage pushed beyond `1093` with tighter screenshot parity

## Delivery Phases

### Phase 0: Build a Golden Reference

Objective: make the original ROM measurable.

Deliverables:

- Repeatable ROM build from the current disassembly.
- Emulator-based capture workflow for:
  - frame dumps
  - input logs
  - RAM snapshots
  - audio captures
- Reference test scenarios:
  - boot to splash
  - credits attract mode
  - start a race
  - 30 seconds of driving on one track
  - collision and checkpoint cases

Exit criteria:

- Team can replay the same input and regenerate matching reference captures.

### Phase 1: Typed Asset Extraction

Objective: stop treating banks as anonymous bytes.

Deliverables:

- Palette extractor for bank 3.
- Tile and sprite extractors for banks 6-9 and 20-28.
- Tilemap extractor for bank 12.
- Text/string block extractor for bank 4.
- Track and scenario extractors for banks 2, 13, 14, and 26.
- Audio extractor for banks 18-19:
  - SPC program blob
  - BRR sample catalog
  - music/sequence command streams if identifiable
- JSON or binary specs for each extracted format.
- Deferred but planned once formats stabilize:
  - standalone visual-asset tools for designers and modders
  - BG/layer compositors that can export isolated layers and flattened previews
  - asset image export/import helpers suitable for upscale workflows and modded replacements

Exit criteria:

- Port can load extracted content without depending on SNES memory layout.

### Phase 2: Engine Archaeology

Objective: replace vague bank labels with executable design specs.

Priority reverse-engineering targets:

- Bank 0:
  - boot flow
  - main callback scheduler
  - NMI DMA queue processing
  - IRQ split timing
- Bank 10:
  - acceleration/braking
  - gear logic
  - steering and lane position
  - collisions
  - opponent/traffic AI
- Bank 11:
  - road scanline generation
  - background composition
  - HUD/cockpit split
  - sprite ordering rules
- Bank 30:
  - dispatch tables and state entry points

Required outputs:

- Named routines and variables.
- Per-system behavior docs.
- Input/output notes for each major routine.
- Memory map for core runtime state.

Exit criteria:

- Another engineer can implement one subsystem in C using docs alone.

### Phase 3: PC Runtime Skeleton

Objective: stand up a playable but mostly empty SDL application.

Deliverables:

- SDL app bootstrapping.
- Fixed 60 Hz main loop.
- Input abstraction for keyboard and gamepad.
- 256x224 framebuffer presentation with scaling.
- Basic content packaging/loading.
- Debug HUD:
  - FPS
  - current state
  - player speed/gear
  - track segment index

Exit criteria:

- Empty runtime can boot, switch states, and render placeholder content deterministically.

### Phase 4: Vertical Slice

Objective: prove the core game loop on PC.

Scope:

- splash/title flow
  - sampled intro playback is an acceptable intermediate milestone
  - native front-end recreation replaces sampled playback once the callback/state logic is stable
- one playable track
- cockpit HUD
- player car physics
- traffic/opponent vehicles
- collisions
- timer/checkpoints
- basic sound effects

Validation:

- Side-by-side emulator comparison for:
  - camera behavior
  - road curvature
  - acceleration curve
  - HUD timing
  - object spawn timing

Exit criteria:

- One race is fully playable end-to-end and matches the original closely enough to tune from captures.

### Phase 5: Full Game Content

Objective: scale the slice into the complete product.

Deliverables:

- all tracks and scenarios
- menus and credits
- all vehicles, sprites, and UI states
- full audio coverage
- save/high score handling if retained
- options for modern controls and display scaling

Exit criteria:

- Full content parity with the SNES version.

### Phase 6: Ship Readiness

Objective: stabilize the port.

Deliverables:

- regression test scenes
- asset validation checks
- replay-based gameplay tests
- performance pass
- bug triage and compatibility pass
- packaging for target desktop platforms

## First 2 Weeks

These are the next concrete steps.

1. Create a `port/` directory with a minimal SDL executable and fixed-timestep loop.
2. Add a `tools/` workflow for golden-reference capture and asset extraction.
3. Document bank 0 control flow in detail from reset through race start.
4. Decode bank 3 palettes and display them in a small viewer.
5. Decode one graphics bank and render the tiles correctly on PC.
6. Decode one track/scenario bank and print a human-readable segment list.
7. Build a side-by-side comparison harness for one deterministic driving sequence.

If the team cannot complete step 4 through step 7 quickly, do not start full gameplay code yet.

## Team Split

### Track A: Runtime

- SDL platform layer
- render surface
- audio device
- input and timing
- debug overlays

### Track B: Content

- asset extraction
- format specs
- ROM tooling
- content packaging
- later standalone art/mod tools once the extraction specs stop moving

### Track C: Gameplay Reverse Engineering

- bank 0 scheduler/state flow
- bank 10 physics/AI
- bank 11 rasterizer
- bank 30 dispatch tables

### Track D: Validation

- emulator capture scripts
- replay inputs
- frame/audio diffing
- scenario test cases

## Technical Rules

- Keep simulation deterministic.
- Preserve original fixed-point behavior where practical.
- Validate against the ROM constantly; do not tune by feel alone.
- Avoid premature engine abstraction until one track is working.
- Separate extracted content from handwritten C code.
- Prefer small, typed specs over giant raw bank dumps.

## Main Risks

### 1. False confidence from bank summaries

The report is directionally useful, but banks 10, 11, and 30 still need hard verification.

### 2. Renderer mismatch

The road effect is scanline-based, so a generic tile renderer will not reproduce gameplay visuals.

### 3. Asset format ambiguity

Compression, pointer tables, and mixed banks can burn time if formats are not typed early.

### 4. Audio scope creep

SPC fidelity can be deferred. For the first playable build, prioritize sound effects and timing over perfect SPC emulation.

## Definition of Done

The port is done when:

- all core game states are playable on PC
- the main race loop matches the SNES version closely in behavior
- content is loaded from extracted assets, not hardcoded placeholders
- test replays stay stable across builds
- the codebase is maintainable by engineers who do not read 65816 assembly

## Recommended Immediate Decision

Commit to one of these two product definitions before coding deep systems:

1. Faithful port:
   prioritize behavior matching, original resolution, original timing
2. Enhanced port:
   keep gameplay logic faithful, but allow rendering/audio/UI upgrades after parity

The work above assumes option 1 first, then selective enhancement after parity.
