# TD2 Wiki Markdown Bundle

- Generated: `2026-03-28 15:51:59`
- Manifest: `rom_analysis/docs/wiki_doc_index.json`
- Total docs: `45`

Use `wiki_bundle_index.md` for the curated file list or `wiki_combined.md` for a single-file ingest path.

## Source Of Truth :: Port Plan

- Source: `PORT_PLAN.md`
- Bundle copy: `sources/PORT_PLAN.md`
- Last updated: `2026-03-19 18:01`
- Note: Primary execution contract and long-range port target.

---

# The Duel: Test Drive II PC Port Plan

## Goal

Deliver a faithful PC port in C with SDL by rebuilding the game runtime around extracted ROM assets and verified game behavior.

This should be treated as a reimplementation, not a direct assembly-to-C translation.

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
- Platform layer: SDL2
- Internal framebuffer: 256x224 at 60 Hz
- Renderer: software rasterizer into an SDL texture
- Audio: SDL audio callback / queued audio with a mixer layer
- Simulation: fixed timestep, deterministic updates
- Asset source: extracted ROM data converted to neutral files or compiled blobs

### Code Modules

- `platform/`: window, timing, input, audio, file I/O
- `core/`: main loop, state machine, memory-like game state
- `render/`: road rasterizer, sprite composition, HUD, palettes
- `game/`: physics, AI, track progression, collisions, rules
- `content/`: loaders for tracks, palettes, sprites, tilemaps, text, audio
- `tools/`: ROM extraction, validation, diff, replay helpers

## Current Milestone Update

Reviewed on 2026-02-28.

New useful state beyond the original plan:

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

1. Replace the later sampled attract segments with native front-end state machines one callback family at a time.
2. Push backward into the unstable `958..977` bootstrap using the repeatable `L00A00C` scene builder, the carry-over state model from the end of Ballistic, and the decoded `0600` DMA queue manifest from frame `974`.
3. Explain the `991..1093` `01:9FE5` presentation path in callback terms, especially the `991..997` visible-buffer rotation and the direct bridge-extracted `998..1093` continuation.
4. Fix the final-screen composition gap after `982`, because the bridge-visible path is now native through frame `1093` but still not screenshot-accurate there.
5. Keep building standalone extraction formats so later artist/mod tooling can sit on stable data instead of volatile reverse-engineering experiments.

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


## Source Of Truth :: Next Steps Roadmap

- Source: `rom_analysis/docs/next_steps_roadmap.md`
- Bundle copy: `sources/rom_analysis/docs/next_steps_roadmap.md`
- Last updated: `2026-03-28 15:51`
- Note: Current lane status, open gates, and practical follow-up targets.

---

# ROM Archaeology Next Steps

This roadmap is the direct follow-up after enabling Mesen design packs with
decoded tilemaps and sprite visibility metadata.

## Current Status Snapshot (2026-03-27)

Checkpoint log: `rom_analysis/docs/progress_checkpoints.md`.

| Roadmap lane | Status | Current reading |
|---|---|---|
| 1. Consolidate `67FB` coverage | in progress | Decoder + runtime tracing + consolidated registry + matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps are done; registry tightening now demotes `9681` to `sentinel-control` and `E91F` to `nested-invalid-marker`, leaving active unresolved queue (`EE7F`, `DA96`). |
| 2. Tilemap-to-ROM provenance | in progress | Resume from `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`; contiguous provenance still covers `1086..1117`; the later direct-hit cluster `7051/7059/7064` now also has interior tilemap carry confirmation at `7055/7061` via the reopened timed-input bridge, `7055` still diverges from `7051` in visible-sprite/OAM composition so the gain is tilemap-only, not full-scene carry, the visual-contract builders now separate BG/CHR state from OBJ/OAM state with optional provenance binding, producer-side write-breakpoint summaries now also have real later-window proofs at `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` under the same `01:9FE5` callback family, the new consolidated `986..1093` range summary now makes that callback/state progression explicit in one artifact, the post-`1093` compare summary now shows `1094..1101` `main_visible.ppm` is exactly the top `224` lines of `main.ppm` while swapping only visible-scanline `ppu.mode7.matrix[0]/[3]` values worsens the render mismatch from `177..574` to `362..5930`, a new active-trace builder now turns `DMA/VRAM/Mode7` probe outputs into frame/callback events, the visual-contract range builders now also merge that activity layer directly, the exact `00:8029` continuation is now also closed through `1133` with the same `bg1`/`61`-sprite / no-DMA / `3`-event `16`-write surface, the late `1165+` reactivation is now tied to a concrete ownership path `01:B6E3 -> 01:9DC6 -> 00:95BD -> bank-0 NMI OAM DMA`, and the DOS-driven SNES correlation lane has now narrowed materially: the recovered front-end car loop already exposes `3` slots through `$0202/$1C78` with no recovered third-slot lock branch, static flow closes a separate top-level three-option gate at `L00BAE8/$1C6A` before the downstream `$0202` corridor begins at `L008B31 -> L008B3E`, and the next surface `L00C20B/$1C70` is now fully closed as a downstream `4`-state `2x2` Select Opponent grid with a `1E:8000` row `0x1D` selection box, three explicit rear-car cells from `16:8000/18:8000/1B:8000`, and a separate helper-`8` BG1 stopwatch/clock slot. `L008B87` now also closes the first handoff semantics of that surface: `$1C70 = 0..2` preserves rival-car state through `$1C76 = 1` and `$1C7A = $1C70`, while `$1C70 = 3` forces the no-opponent branch `$1C76 = 0`, `$1C7A = 0`. No-force timed-input probes now also recover the default rival corridor organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`. Callback-relative `v5/v6` follow-ups now also drive the fourth slot organically by keying `right+down` and `start` to first live `01:C1D2`, and a later `be43+17-22:start` confirm now closes the no-opponent path through `L008B87 -> 01:902D -> 01:9111 -> active_main = 02:9016` while preserving `$1C70 = 3` / `$1C76 = 0` at the same downstream timestamps where the rival baseline keeps `0 / 1`. A direct `2044..2199` compare now shows that both paths already share `02:9016/01:96A0/02:8F3C`, keep `54` sampled fields identical, and narrow the remaining split to `14` fields, with `state_09a2/state_09a8` and the paired DP scratch fields `0020/0022/0053/0054` the strongest post-handoff targets; the corrected screenshot-review packs now also establish that `2044` is a dead transition frame, the first shared non-black review window is `2048..2088`, and the earliest stable rival-vs-clock visual delta is confined to the top radar strip (`125..137` differing pixels inside `(11, 11, 194, 21)`), where the rival lane carries an extra red marker absent from the no-opponent lane. `$1C7C` is now better read as the verified `4`-slot top-level phase selector with bases/counts `[0, 5, 11, 18] / [5, 6, 7, 8]`, `$0202/$1C78` has explicit helper-bundle coverage for indices `9/10/11`, the preview extractor now rebuilds helpers `9/10/11` by tolerating early-ending `26FB` bulks, clean isolated-layer validation shows `BG1` blank for all three and `BG2` nontrivial only for helper `9`, static decode now closes the old `$1E80` WRAM-table assumption because the adjacent UI helpers actually construct the long ROM pointer `1E:8000`, current car-facing rows are `8..10`, current track-facing rows are `11..14`, those rendered rows now close the exact `$1C7C` label set as `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, and `West Coast - Hardest`, top-menu rows `15..17` now close the separate `$1C6A` signboard surface as `Game Options`, `Play TDII`, and `High Score`, and the `$1C6A` branches are now semantically closed as `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`, and `High Score -> L00A3CC`; normalized previews now also show rows `8..10` are a front-end rolling-tire cycle rather than name-bearing text, the `01:9C77` per-car bases now calibrate to Porsche 959 / Lamborghini Diablo / Ferrari F40 OBJ catalogs, a stable frame-`1500` front-end car-presentation render keeps the `Porsche 959` title/info box intact without OAM, the frame-`1500` helper provenance artifact anchors that visible lower-screen `BG2` surface to helper bundle `10`, a new right-navigation calibration reaches a stable `Lamborghini Diablo` panel at frame `1640`, a second-right probe closes the third live selector anchor by changing `$0202` `2 -> 0` at frame `1677`, static `L00BC0F` proves the per-car `BG2` reload uses `$0202 + 0x0009` through `L00A9A0/L00A9CB` without a paired per-car `L00A9F2`, earlier design-pack diffs overestimated the exact-frame tilemap change, the exact-frame raw-dump comparer now keeps `BG1` unchanged across frames `1500/1640/1780` while limiting the visible `BG2` tilemap delta to the top row (`27/11/27` changed cells across the three pairings), the visible-union `BG2` CHR delta is `0`, and the full inferred `BG2` CHR region `0x3000..0x5FFF` is also `0` across those same pairings; this frame trio is now best described conservatively as one downstream front-end car-presentation corridor rather than either the top menu signboard or a proven interactive car-select menu. `mesen_ppu_extract` currently diverges from the exact-frame raw dump at `1780`, so raw runner dumps are now the source of truth for front-end exact-frame comparison. The refreshed `1134..1200` blob-cycle report now honors the trace window, emits transition rows, and proves `state0204` alone is not a sufficient selector because each sampled `1/2/3` state reaches all three blob labels and both `0x4920/0x49A0` destinations; the stronger next static target is therefore the deeper `$0440/$0442` phase loop inside `01:B6E3`. |
| 3. Gameplay-frame expansion | in progress | Resume from `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`. The older promoted `v2_current` lane still explains the screenshot-vs-end-frame split and the historical queue-cursor equalization path through frames `90..92`, but a fresh current-seed recheck now proves today's `game_11.mss` no longer reproduces that window: the savestate has drifted again since the earlier `v3_ab_compare` fingerprint, `target_frame=90/91` scanline reruns stay flat on `00:8029/00:835F` with `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12`, and `0` write hits land on `00:0053..0056`. The seed audit still proves the current `game_11.mss` is a `front_end_menu_seed`, not verified gameplay. The repo now also has a preserved manual live-race seed pair from the user's Mesen slots `#1/#3`, copied into `manual_artifacts/lane3/`; user context identifies them as Porsche-cockpit Desert Blast gameplay approaching a green NPC car. A new aligned control compare against the old post-`2050` default-rival no-input corridor now proves the split is immediate inside the same callback family: both manual seeds keep `02:9016/01:96A0/02:8F3C` plus the inherited selector block, but all `12` aligned frames differ in `oam_0730`, `state_11f3`, `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and `state_09a2`. A new boundary note also sharpens the historical read: older no-input and early-input lanes likely crossed short attract/demo gameplay slices, and scripted input could cut those slices before they looked like a stable gameplay session. A new ownership note now closes a first semantic pass inside `02:9016`: `state_11f3` is the rival-gated source for `oam_0730`, `state_09a2` is an OAM sprite cursor, `state_09a8` is OAM allocator/build control, `dp_0053/0054` behave as DMA-ring cursors, and `dp_0020/0022` remain transient builder operands. A new visible-layer-stack note now also narrows the sample-backed gameplay composition on `lane3_live_race_mid.mss`: visible main-screen layers are `BG1 + BG2 + OBJ`, `BG2` varies per scanline and is the strongest road/world candidate, and the code side now already fits that read because the active `01:9111 -> 01:9185 -> 02:9165` path drives `BG2` scroll through the `HDMA7` / `BG2VOFS` corridor. A new producer-path note now pushes the same seed further: `live_race_mid` repeatedly rewrites `$22/$23`, `bank1.asm` `5846..5851` feeds `BG2VOFS` from that pair, `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`, `TMAIN` briefly enables `BG3` at scanline `23`, and the strongest current producer cluster is now narrowed inside `L01318D` around `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`. The new static role split now sharpens that target further: `02:B042` is a variant-word load, `02:B05D / 02:B0B1 / 02:B0BD` are setup/math, `02:B134` is the strongest generic `L012BE2` submit point, and a nearby alternate submit path exists at `02:B101 -> L012D5A`. A new gameplay-asset report now turns that same confirmed seed into an asset-first inventory: `BG1` as cockpit/HUD base, `BG2` as road/world raster, `OBJ` as the dynamic actor bucket, and `BG3` as a transient strip/auxiliary layer. That report also closes the first behavior-facing watchlist for lane 3: steering/curvature should be chased on `$22/$23`, `dp_0020/0022`, `BG2HOFS/BG2VOFS`, `next_irq_ptr`, and the `L01318D` emitter split, while traffic/police/radar should be chased on `state_11f3`, `oam_0730`, `state_09a2`, `state_09a8`, and `dp_0053/0054`. A direct boundary recheck now also closes the preserved `slot2_extra` seed as a non-gameplay neighbor: it stays on `00:8029/00:835F/00:8029` and shows visible `BG3` only at frame `0`, so it must not be used as a second gameplay replicate. A new lab-backend boundary note now closes two more points on `live_race_plus30f`: its absolute start frame is `17495`, not an assumed near-`+30` offset from `live_race_mid` (`16655`), and current `labRunner` export attempts still fail during frame-boundary correction on that seed. A new human-support note now also makes the practical re-entry path explicit (`A` / first-option through menus, `B` backs out; in gameplay `A` accelerates, `B` decelerates, d-pad steers), confirms `slot2_extra` still looks like intro/credits, and extends `live_race_mid` visually through the checkpoint/post-stop sequence plus the late police/third-radar-marker event. The next gate is therefore no longer “find any producer path” but assign exact emitter semantics inside that narrowed cluster and apply the new asset taxonomy to later gameplay moments while the backend export path remains unstable. |
| 4. Bank API contracts | not started | Baseline docs exist; callback/API contracts for bank 30/10/11 are not yet mapped to completion. |

Validation contract baseline:

- `validation/regression_gates_intro.jsonc`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `rom_analysis/docs/validation_gates.md`
- Latest run status: callback contracts `18/18` pass; regression gates `6/6` pass.

## Lane 3 Live Entry Update (`2026-03-28`)

- A new practical gameplay-entry route is now promoted in:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- The new launcher:
  - `tools/run_lane3_gameplay_entry.py`
  encodes the current user-guided route as:
  - menu pulses:
    `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
  - gameplay-relative zero:
    frame `2050`
- Practical read:
  - this route is now good enough to use as a live-debug / live-capture entry
    lane for gameplay archaeology
  - exact `live_race_mid` savestate cloning is no longer the primary success
    criterion
- Closed negative result:
  - the first long power-on run with that route plus gameplay-only `A` hold
    does **not** recreate the preserved manual `live_race_mid` substate
  - at absolute frame `16655`, it still keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
  - the preserved manual seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
  - a sliding exact-field search over `15000..16999` does not produce a
    stronger exact-state match than a broad `129/228`-slot plateau
- Next gate:
  - use the new live-entry lane as the default base for gameplay-relative
    probing
  - parameterize it upward into alternate cars / tracks / opponent branches
    instead of continuing to optimize for one exact saved frame

## Lane 3 Live Entry Phase Split (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- New tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New generated artifacts:
  - `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- Practical read:
  - the first late gameplay pair from the reproducible live-entry route is now
    promoted as a self-contained review surface
  - frame `3250` stays on open-road driving while frame `3550` is already a
    collision/overlay-heavy phase with `Cars Left: 4`
  - both still keep `02:9016 / 01:96A0 / 02:8F3C`, so the change is not a
    top-level callback swap
  - `BG2` tilemap stats stay unchanged while `BG1` and `OBJ` shift
    materially; `BG2` scroll still moves across the pair
- Next gate:
  - repeat the same bundle/compare workflow on a checkpoint/post-stop or
    police/radar pair so lane 3 can compare multiple gameplay phases through
    named `BG1/BG2/OBJ` buckets instead of whole-frame screenshots alone

## Lane 3 Traffic Emergence Pair (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- Updated tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New generated artifacts:
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- Practical read:
  - a bounded steering-heavy follow-up still crashes too early to close the
    checkpoint/post-stop or police/radar target
  - a bounded braking variant still does not reach checkpoint/post-stop, but
    it does promote a cleaner actor/event pair:
    - frame `3250` without the red traffic car
    - frame `3400` with the red traffic car introduced
  - this pair keeps `BG1/BG2/BG3` and sampled `BG2` state unchanged while
    changing only `OBJ` workload
  - the bundle builder now also emits `PNG` previews next to the `PPM`
    renders, so designers can review the same promoted artifacts directly
- Next gate:
  - tie the `3250 -> 3400` traffic-emergence pair to OAM-side ownership first
  - only then spend another bounded attempt trying to push the live-entry lane
    past the `2400`-relative crash boundary toward checkpoint/post-stop or
    police/radar

## Lane 3 World-Support Follow-Up (`2026-03-28`)

- Updated tooling:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
  - `port/src/td2_ppu.c`
- Updated generated artifacts:
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- Practical read:
  - designer review closed an important presentation gap:
    the first gameplay bundles were already good for cockpit `BG1` and `OBJ`,
    but still failed to expose the road/background side clearly
  - the promoted renderer now respects `largeTiles = true`, so the technical
    `BG2` output is no longer the old sky-only false surface
  - that still does **not** make raw `BG2` a fully faithful visible-world
    extraction for gameplay:
    one flat frame-end `ppu_state.json` still misses the per-scanline
    presentation that shapes the road/background stack
  - gameplay bundles therefore now carry screenshot-derived support anchors:
    - `bg_stack_visible_support.png`
    - `world_visible_support.png`
  - practical rule:
    use those support PNGs for human road/background labeling, while keeping
    `bg2.png` as the state/VRAM-facing artifact
- Next gate:
  - use the corrected traffic pair plus the new support surfaces to assign the
    `3250 -> 3400` event more exactly on the OAM side
  - if exact road/world ownership becomes the next blocker, pivot to a
    scanline-aware gameplay export instead of treating one flat `BG2` render
    as sufficient

## Lane 3 Native Visible Layers (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- Updated tooling:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/build_gameplay_frame_bundle.py`
- New generated artifacts:
  - `tools/out/mesen_lane3_live_race_mid_native/`
  - `tools/out/lane3_live_race_mid_native_bundle/`
  - `tools/out/mesen_lane3_live_race_plus30f_native/`
  - `tools/out/lane3_live_race_plus30f_native_bundle/`
- Practical read:
  - gameplay-native layer extraction is now promoted from a preserved
    savestate instead of only from long live-entry reproduction
  - `mesen_ppu_extract` now accepts `--load-state` and `--frame-is-offset`,
    which makes the real gameplay seeds usable directly
  - on both `lane3_live_race_mid.mss` and `lane3_live_race_plus30f.mss`, the
    native extractor now closes:
    - `BG2 visible` as the road/pista layer
    - `BG3 visible` as the scenery/horizon layer
    - `sprites_screen` as the dynamic `OBJ` surface
  - the older question “where are `BG2/BG3`?” is now closed on the native
    path across both preserved gameplay seeds
  - the remaining boundary is narrower and now fenced:
    `main_visible` and `sub_visible` are still fully black on both seeds, and
    gameplay bundles now record that condition explicitly in
    `native_visible_checks.json` / `bundle_manifest.json`
- Next gate:
  - either explain/fix the gameplay-native composed `main/sub` export path
  - or keep advancing gameplay archaeology on the trusted `BG2/BG3/OBJ`
    native surfaces while treating composed native output as a fenced boundary

## Docs Wiki And SDL Smoke (`2026-03-28`)

- New tooling:
  - `tools/build_docs_wiki_report.py`
- New curation manifest:
  - `rom_analysis/docs/wiki_doc_index.json`
- New generated HTML surface:
  - `tools/out/docs_wiki/index.html`
  - `tools/out/docs_wiki_markdown_bundle/`
- Practical read:
  - the repo now has a simple wiki-style HTML index for the current markdown
    corpus
  - the site keeps `Front-End And Menu` separate from `Gameplay And Lane 3`,
    and also keeps `Attract And Intro` separate from both
  - the generated HTML is now tuned for mobile reading, with a collapsible
    navigation drawer instead of forcing the full sidebar ahead of the content
  - the same build now also mirrors the curated markdown corpus into a
    separate NotebookLM-friendly bundle, so the wiki curation can be reused
    outside the browser surface
  - this is now the preferred human-facing review surface when the goal is
    quick orientation rather than raw file browsing
  - from this checkpoint forward, relevant doc/artifact updates should refresh
    the wiki as part of the routine tooling pipeline via
    `make -C tools docs-wiki`
- SDL smoke:
  - `rom_analysis/docs/port_sdl_runtime_mimetization_smoke.md`
  - `make -C port` reports the runtime already current
  - `./port/test_regression.sh` renders `1000` frames and keeps exact golden
    parity at `978/982/986/990`
  - the first remaining measured gap in that smoke is `mode7_visible_991`
    with `4` mismatched pixels (`0.006975%`)
- Boundary:
  - this smoke is strong evidence for intro/front-end runtime parity
  - it is **not** yet a gameplay-parity claim

## Lane 3 Video Phase Packs (`2026-03-28`)

- New tooling:
  - `tools/build_video_phase_pack.py`
- New phase-pack spec:
  - `tools/gameplay_video_phase_packs.json`
- New notes:
  - `rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
  - `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
- New generated artifacts:
  - `tools/out/lane3_service_status_phase_pack/`
  - `tools/out/longplay_hard_phase_anchor_pack/`
  - `tools/out/longplay_snow_phase_pack/`
  - `tools/out/longplay_prison_finale_phase_pack/`
- Practical read:
  - the previously unseen checkpoint `service/post`, `partial-results`, and
    `next checkpoint restart` corridor from the preserved local AVI is now
    promoted as a named still pack instead of only a prose note
  - the difficult longplay phases now also have promoted visual anchors for:
    - night
    - bridge
    - mountain-wall/no-shoulder corridor
    - tunnel
    - rain
    - snow
  - the player-arrest / prison ending is also now preserved explicitly as its
    own named pack instead of a vague end-of-longplay expectation
- Boundary:
  - these packs are visual targeting surfaces only
  - they do **not** replace the trusted `BG1/BG2/BG3/OBJ` extraction path
- Next gate:
  - use these anchors to decide which later gameplay phases deserve the next
    emulator-side `BG/OBJ` capture
  - prefer later hard-phase or service/post routes over more whole-frame-only
    live-entry diffs

## Gameplay Capture Heuristics (User-supplied, Unverified)

Use these as guided-capture targets for lane 3, not as promoted ROM claims:

- Longplay anchor:
  - gameplay begins at `1:13`
  - opening route is `Desert Blast`
  - opening matchup is `Ferrari F40` cockpit vs `Lamborghini`
  - first checkpoint lands at `4:17`
- Longplay progression anchor:
  - after finishing phases, the game goes to the player-arrest animation,
    then credits, then returns to rival/track re-selection
- Phase-behavior anchor:
  - later stages move from simpler two-lane roads toward harder road layouts
  - night driving begins at `24:11`
  - East Coast / West Coast may introduce new sprites such as animals on the
    road and snow
  - watch specifically for trucks as separate gameplay-facing OAM targets
  - river crossing via bridge appears at `30:32`
  - mountain section appears at `33:40` with no right shoulder and a stone
    wall on the left
  - tunnel appears at `34:18`
  - rain appears at `45:18`
- Gameplay composition heuristic:
  - cockpit car uses three visual states/layers: straight wheel plus two
    diagonal steering variants
  - gameplay layer `2` should be the road/pista surface
  - gameplay layer `3` should be the scrolling scenery/background surface
  - mutable OAM should be a strong candidate for speedometer needle, gear
    changes, traffic, motorcycles, trees, police events, and other outside
    car happenings
- Probe-backed narrowing from a real live-race seed:
  - `lane3_live_race_mid.mss`, frame `0`, currently samples as
    `BG1 + BG2 + OBJ` on the visible main screen
  - `BG1` stays scroll-stable across the sampled visible scanlines and is now
    the strongest cockpit/HUD-base candidate
  - `BG2` changes per scanline and is now the strongest road/world candidate
  - the active `01:9111 -> 01:9185 -> 02:9165` path already matches that read:
    `bank2.asm` arms `HDMA7` against the `BG2` scroll register block while
    `bank1.asm` also writes `BG2VOFS` from `$22/$23`
  - `BG3` is not enabled on the visible screen in that sample, so “layer 3 =
    live background” is not currently supported there
  - the preserved `slot2_extra` nearby state is a useful warning boundary:
    it falls back to `00:8029/00:835F/00:8029` and `BG3` only, so not every
    nearby savestate is gameplay
- Human follow-up note from the preserved manual seed folder:
  - `manual_artifacts/lane3/responses.txt`
  - practical route back to `live_race_mid`:
    keep taking the first menu option / keep pressing `A` until gameplay
  - menu semantics:
    `A` advances, `B` backs out one screen
  - gameplay essentials:
    `A` accelerates, `B` reduces speed, d-pad steers
  - the first filled still-frame read for `live_race_mid` keeps:
    a straight road, centered yellow divider, straight wheel, green NPC car
    near on the player's right, and an active radar marker
  - the same note also extends the seed through a checkpoint/post-stop dialog
    sequence and a late police arrival with a third radar marker
  - the preserved local video is now also ingested through
    `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`:
    extracted stills now preserve the opening live-race frame, curved/open
    road continuity, the checkpoint `STOP` sign and gas-station/post exterior,
    the black transition/fade around that stop, and a late resumed-driving
    frame with an extra colored radar marker that matches the earlier
    police/third-marker note

## Front-End Menu Split

Use these to avoid collapsing distinct front-end surfaces into one:

- Code-backed split:
  - `L00BAE8` is a separate top-level `3`-option gate on `$1C6A`
  - the downstream `$0202` three-slot corridor is only reached later from
    `L008B31 -> L008B3E`
- ROM-side signboard closure:
  - `01:BAC3` uses `$1C6A + 0x000F` against `1E:8000`
  - rendered rows `15..17` now close the visible top-menu labels as:
    `Game Options`, `Play TDII`, `High Score`
- Closed semantic mapping:
  - `Game Options` branches into `L00C0C7` and the settings-menu loop
  - `Play TDII` is the only top-level branch that advances into the separate
    downstream `$0202` corridor
  - `High Score` branches into `L00A3CC` before returning to the top menu
- Remaining user-guided heuristic:
  - the road/background composition of the initial menu is still a live
    runtime-capture target
  - the configuration-menu string surface remains a useful anchor if an exact
    path back to the initial menu needs to be re-established
  - guided front-end flow now reads as:
    `Ballistic -> initial menu -> Play TDII -> cars -> adversary/clock -> phase -> gameplay`
  - current code-backed fit for that user-guided flow is:
    `L00BAE8 -> L008B3E -> L00C20B -> L00BE76`
  - `L00C20B` itself is now structurally and visually closed:
    - selector field `$1C70`
    - domain `0..3`
    - hidden selection-box callback `01:C1D2` using `1E:8000` row `0x1D`
    - three explicit rear-car cells from `16:8000/18:8000/1B:8000` row `6`
    - helper `8` on `BG1` renders `Select Opponent` plus the fourth-slot
      stopwatch/clock icon
  - `L008B87` now closes the first downstream semantics of that same choice:
    - `$1C70 = 0..2 -> $1C76 = 1`, `$1C7A = $1C70`
    - `$1C70 = 3 -> $1C76 = 0`, `$1C7A = 0`
  - no-force timed-input probes now already recover the default top-left rival
    path organically:
    `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by
    `active_main = 02:9016`
  - callback-relative `v5/v6` probes now also move the fourth slot organically
    inside live `01:C1D2`, and a later `be43+17-22:start` confirm now closes
    the no-opponent path too:
    `L00C20B -> 01:C1D2 -> L00BE76 -> 01:BE43 -> L008B87 -> 01:902D ->
    01:9111 -> active_main = 02:9016`
  - the remaining proving target is now post-handoff divergence:
    corrected screenshot review packs start at `2048` because the earlier
    `2044` frame was a dead transition surface, objective image compare
    localizes the earliest stable rival-vs-clock delta to the top strip
    (`125..137` differing pixels inside `(11, 11, 194, 21)`), and an extended
    probe compare now closes that first live split as
    `$1C76 -> state_11f3 -> oam_0730` in `bank2.asm` `L0108EF`; the next step
    is therefore no longer “find any visible delta” but tie the remaining
    intermittent OAM-side differences to later rival-only behavior. A new
    full-rate compare over `2048..2088` now also shows that the suspected
    `09A2/09A8` pulses at `2051/2083` do not create any extra whole-frame
    visible pulse in this same window: frame `2048` alone carries a smaller
    transition bbox `(11, 20, 14, 21)`, frames `2049..2088` keep the same
    full top-strip bbox `(11, 11, 194, 21)`, and adjacent-frame compares for
    `2050->2051`, `2051->2052`, `2082->2083`, and `2083->2084` are all
    pixel-identical in both lanes. That pushes the reported rearview blinking
    lights search later than those `09A2/09A8` pulse frames. A tighter first-
    frame compare now narrows the user-reported blink cue further:
    rival `2048->2049` changes only in bbox `(180, 11, 194, 19)`, while the
    no-opponent lane is pixel-identical across the same step. The next best
    move is therefore a rival-only state/OAM trace around `2048->2049`,
    targeted at that top-right subregion rather than the whole strip.

## Execution Reset (2026-03-19)

The repo is now following a `90`-step cleanup/refocus plan alongside the
existing archaeology lanes.

Lane order stays the same. The difference is that the next concrete steps are
now constrained by a cross-cutting cleanup track:

1. Repo hygiene and portability baseline:
   - fix ignore policy
   - untrack generated bridge/emulator outputs
   - remove hard-coded personal Mesen paths from promoted scripts/Makefiles
   - keep a repo-owned cleanup target for disposable build/scratch output and
     debugger coverage junk instead of letting those surfaces accumulate
2. Renderer correctness fixes with targeted tests:
   - mirrored OBJ regression is now covered by the generated
     `check_obj_vertical_flip.py` fixture across Python simple, Python
     `mode7-ppu`, and SDL runtime paths
   - BG4 and tile-priority are now covered by the generated
     `check_bg_layer_priority.py` fixture across the Python renderer and SDL
     runtime
3. Contract and validation hardening:
   - schemas
   - address registry
   - checkpoint IDs
   - per-run validation output isolation
4. Continue intro archaeology in parallel:
   - `958..977` bootstrap
   - `986+` final-screen composition gap
   - callback-family replacement beyond `1093`
   - the new `intro-oam-deltas` target now proves the late probe-vs-bridge OAM fork at `986/990` and the absence of a distinct committed OAM fork at `994`

Immediate concrete step after the cleanup kickoff:

- repo hygiene now suppresses default `tools/out` status noise and the cleanup
  target also removes obvious untracked `tmp*` / `test_*` scratch output
  without touching tracked evidence-bearing archaeology families
- promoted scripts/Makefiles and the main tooling READMEs now avoid hard-coded
  personal Mesen paths, and `make -C tools portability-path-check` guards that
  surface against regression
- the promoted boot-probe path now defaults to repo-owned outputs:
  - `validation/mesen_probe_boot.lua` accepts `TD2_BOOT_PROBE_OUTPUT_PREFIX`
  - `make -C tools l001210-probe` and `l001210-save-savestate` now default to
    `tools/out/td2_boot_probe*` instead of shared `LuaScriptData`
  - `tools/run_l001210_probe_matrix.py` now writes per-scenario probe outputs
    directly under its run directory instead of copying them out of shared
    emulator state
- the committed scanline validation path now follows the same policy:
  - `validation/run_mesen_capture.sh` now prepares
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX`
  - `tools/capture_visible_mode7_range.py` now defaults its raw probe JSON to
    a repo-owned per-run prefix derived from `--output` instead of shared
    `LuaScriptData`
- finish the remaining cleanup hardening next:
  - keep moving validation toward per-run output isolation beyond the boot
    probe path instead of mutable shared `LuaScriptData`
- keep the renderer correctness track moving after the mirrored-OBJ fix:
  - preserve the new BG4/tile-priority pass ordering while the next renderer
    slice moves on to remaining composition gaps
- keep intro-side work moving in parallel through the cleaned workflow:
  - `958..977` bootstrap
  - `986+` final-screen composition gap
  - use the new `tools/out/intro_oam_deltas/` reports as the current OAM source of truth before changing late-frame renderer/compositor behavior

## 1. Consolidate `67FB` Coverage (Now Unblocked)

Goal: move from raw marker scans to validated chunk boundaries now that `67FB`
decode support exists.

- Keep `tools/decompress_td2_chunk.py` as the source of truth for `42FB/26FB/67FB`.
- Re-run:
  - `python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json`
  - `python3 tools/scan_structured_bank.py game.smc --bank 30 --json-out tools/out/bank30_chunks.json`
- Validate marker candidates:
  - `python3 tools/validate_td2_chunks.py game.smc --bank 30 --headers-json tools/out/bank30_headers.json --json-out tools/out/bank30_chunk_validation.json`
- Validate each candidate marker with real decode spans and tag overlaps.
- Keep a provenance tag per candidate (`table-confirmed`, `runtime-confirmed`, `unreferenced`).
- Runtime proof step (now available):
  - `make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90`
  - `make -C tools l001210-probe-matrix L001210_MATRIX_TOTAL_FRAMES=1500`
  - `make -C tools l001210-trace-summary`
  - Current no-input attract coverage confirms `DF6C/E039/E73F/E800` and leaves `DA96/E91F/EE7F` unresolved.
  - `start,b` scripted-input probe (`4000` frames, input from frame `240`) currently yields only early `42FB` hits and no bank30 coverage.
  - matrix v1 (`4` scenarios, `1500` frames each) also leaves `DA96/E91F/EE7F` unresolved and shows one strong suppression path with `0` bank30 hits (`periodic_start_pulses_240_1800`).
  - matrix v2 (`13` scenarios, `3200` frames each) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`) and only increases hit density on already-confirmed `DF6C/E039/E73F/E800` (peak `pulse_b_every120`: `20` bank30 hits).
  - matrix v3 (`7` scenarios, `45000` frames aggregate) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`); strongest positive run remains no-input (`8000` frames, `12` bank30 hits).
  - matrix v5 (`12` scenarios, `48000` frames aggregate; timed `start`/`start,b` pulses) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`) and shows no new caller coverage (`01:B256/B273/B59B` still unseen).
  - matrix v6 (`3` scenarios, `12000` frames aggregate) adds callsite-index telemetry: observed `L00A9*` indices are `0/4/5/6/15/28/29/34`; unresolved `EE7F` index `32` is still unseen.
  - matrix v7 forced-branch tests (`5` scenarios, `20000` frames aggregate) force `$1C78/$1C80/$1CA8 = 1/0/2` (including `B1F9` exec-point forcing), but still do not produce index `32` or `EE7F`.
  - matrix v10a/v10b caller-family sweeps (`16` scenarios, `117000` frames aggregate) add non-`L00A9*` callsite coverage (`01:8E3C/01:8E59`) and expand observed `L00A9*` indices (`7/8/9/10/11/22/25`), but still do not reach `01:B256/B273/B59B` or unresolved sources.
  - matrix v11/v11b `01:9016` sequence follow-ups (`16` scenarios, `200000` frames aggregate) keep a fixed bank30 profile (`12` hits per scenario, only `DF6C/E039/E73F/E800`) and still do not reach `01:B256/B273/B59B`.
  - matrix v12/v12b precondition forcing (`8` scenarios, `72000` frames aggregate) confirms selector/state forcing applies but still yields `b1f9_exec_count = 0` in that lane.
  - matrix v13 callback activation (`5` scenarios, `16000` frames aggregate) forces active callback to `01:9568/01:95AD`; callback+state variants reach `B1F9` once (`frame 1201`) but still do not produce `01:B256/B273/B59B` `L001210` hits.
  - matrix v14 stage trace (`3` scenarios, `6600` frames aggregate) confirms forced lanes still report `b1f9_exec_count = 1` but show no `B1F9` internal stage progress (`B226/B256/B273/B59B` all `0`).
  - consolidated `B1F9` stage report now also closes the strongest remaining ambiguity in that same lane:
    - both forced `01:9568/01:95AD` scenarios still hit `01:B1F9` once at frame `1201`
    - all `L001210` hits in those scenarios occur before that entry; post-entry `L001210` hit count is `0`
    - both lanes stay pinned through frame `2199` with `state_1D10 = 0x4100`, `state_09A8 = 2`, `state_0960 = 0`, and lane-specific `active_main = 01:9568/01:95AD`
    - static `bank1.asm` read now makes the implication explicit: the unresolved `EE7F`-relevant dynamic index select is only in the `L00B1F9` prologue (`$1C80 < $1CA8 ? $1C78 + 0x001F : 0x0002`) before the first `L00A9A0` call, while the later `L00B6A3/L00B6E3` surface is a separate worker loop rather than another table-select/decompress stage
  - targeted prologue exec traces (`2200` frames each, forced `01:9568` and `01:95AD`) record only the `01:B1F9` entry at frame `1201`; no exec hits are yet observed at `00:050F`, `00:083F`, return sites `01:B202/01:B206`, or inner stages `01:B226/B256/B273/B59B`.
  - targeted side-effect traces over the same forced lanes and frame window (`1200..1202`) also record no writes at the expected helper/setup sites (`HDMAEN`, `$0966/$0968`, `$0974`, `BGMODE/BGxSC/BG12NBA`, `$0F42`, `TMAIN`, `OBJSEL`, or the `L00052E` window/color-math resets).
  - stack-return tracing now proves the forced entries are real in-bank calls:
    - forced `01:9568` reaches `L00B1F9` with `stack_return_rts = 0x9575` (`L009575`)
    - forced `01:95AD` reaches `L00B1F9` with `stack_return_rts = 0x95B7`
    - both lanes also carry the same deeper stack anchor `0x82A0`, matching the
      bank-0 callback-dispatch wrapper before `jmp [$0038]`
  - corrected exec-point tracing now honors the configured trace-frame window.
  - corrected late-window `01:9568` trace (`1200..1202`) records:
    - `00:82A1` at frame `1200`
    - `01:B1F9` at frame `1201`
    - no `01:9575` hit in that immediate window
  - caller/frame-state reconciliation is now tighter:
    - frame snapshots still hold the forced pre-call tuple
      `$1C78/$1C80/$1CA8 = 1/0/2`
    - but the corrected `01:B1F9` exec snapshot sees `$1CA8 = 3`
    - static bank-1 caller reads explain that delta because both `L009568` and
      `L0095AD` do `inc $1CA8` before `jsr L00B1F9`
  - lane-specific difference:
    - forced `01:9568` enters with `$0F77 = 1`
    - forced `01:95AD` enters with `$0F77 = 0`
  - static `L00B1F9` reading now shows the missing immediate return is not the
    right bottleneck:
    - after setup, the routine can enter longer wait/worker loops at
      `L00B638` / `L00B6E3` before it reaches `L00B755` and returns
  - widened per-point-capped wait/exit tracing (`1200..1800`) still records only:
    - `01:B1F9` once at frame `1201`
    - no `01:B226`, `01:B638`, `01:B6E3`, `01:B755`, or `01:9575`
    - `exec_point_trace.dropped_hits = 0`
  - widened WRAM write tracing around the expected wait-path state (`1200..1800`) also stays flat:
    - no writes at `7E:0960`, `7E:0964`, `7E:0200`, `7E:0202`, `7E:1E2C`,
      `7E:0440`, `7E:0442`, `7E:0444`, or `7E:040A`
    - nearby frame snapshots remain stable at `$0960 = 0`, `$0200 = 0`,
      `$0202 = 1`, `$1E2C = 0`, `$0440/$0442/$0444 = 0/0/0`
  - combined v10/v11/v12/v13/v14 telemetry still shows bank30 producers only from `01:A9BD/01:A9E1` with `L00A9` indices `28/29`; unresolved index `32` remains unseen.
  - immediate follow-up should now pivot away from more headless `B1F9`
    probing:
    - use manual debugger confirmation if you want to keep pressing this lane
    - otherwise move to the next unblocked roadmap lane in headless mode
  - trace payload now includes selector fields (`$1C78/$1C80/$1CA8/$1CAC/$1CAE`) per hit, which confirms the `L00B1F9` dynamic-index branch condition for `EE7F` (`$1C80 < $1CA8` with `$1C78 = 1`) is not active during the observed no-input bank30 hit windows.
  - trace payload now also includes `selector_1c86` and `state_1d10`, plus probe-level `b1f9_exec_count/b1f9_exec_frames`, `b1f9_stage_counts/b1f9_stage_frames`, and main-callback forcing controls for targeted control-flow tests.
  - trace payload now also includes caller CPU regs and derived `L00A9A0/L00A9CB` index/source fields (`caller_l00a9_*`), with no mismatches seen across v10/v11 sweeps (`1645/1645` matches where present).
  - savestate-targeted matrix lane is currently blocked in this environment: `--testRunner` exposes savestate load but no callable save API on `emu`.
- Consolidated chunk registry:
  - `make -C tools bank30-registry`
  - Current status counts:
    - `runtime-confirmed`: `4`
    - `table-confirmed-unseen`: `1` (`1E:EE7F`)
    - `67fb-unseen`: `1` (`1E:DA96`)
    - `nested-invalid-marker`: `1` (`1E:E91F`)
    - `sentinel-control`: `1` (`1E:9681`)
  - active unresolved queue is now only:
    - `P0`: `1E:EE7F`
    - `P1`: `1E:DA96`
- Export outputs under:
  - `rom_analysis/graphics/tilesets/`
  - `rom_analysis/maps/tilemaps/`
- Update `rom_analysis/docs/bank30_decompression_report.md` with signatures and inferred payload types.

## 2. Build Tilemap-to-ROM Provenance

Goal: tie frame-visible tilemap entries back to ROM/chunk origin.

- Closed first window deliverable:
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
  - generated via `tools/build_tilemap_chunk_provenance.py` with runtime trace + bank13 validation binding
- Closed second contiguous window deliverable:
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
  - generated from `tools/out/design_mesen_range_1094_1101_v1` with preserved
    `L001210` runtime hits at `1088/1096/1101` plus bank13/bank7 validation binding
- Closed carry-covered continuation deliverables:
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.md`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`
  - generated from `tools/out/design_mesen_range_1102_1109_v1` and
    `tools/out/design_mesen_range_1110_1117_v1` with preserved bank-7 carryover
    from the direct `1101` `07:C112` hit
- Current window reading:
  - `bg1` remains the visible main-screen layer through `1117`
  - the tile-index set stays fixed at `144` indices / `22` ranges with
    `chrBaseWords = 0x2000`
  - runtime chunk provenance steps across that same visible block:
    - `1094..1095` -> `0D:C4DC`
    - `1096..1100` -> `07:BF49`
    - `1101..1117` -> `07:C112`
  - confidence boundary:
    - `1117` is the current headless edge because it is `frame_delta = 16` from
      the direct `1101` hit and the preserved `periodic_start_pulses_240_1800`
      trace has no later direct hit after `1101`
- For target windows (start with `1086..1093`):
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/mesen_range_1086_1093_v1`
- For each frame pack:
  - use `tilemaps/bg*_tilemap.json` and `tilesets/tiles_bg*.json` to map live tile indices to CHR bases.
- Produce a provenance table:
  - `frame -> layer -> tile index range -> chr base -> candidate ROM chunk`
- Save outputs in:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`
- Immediate follow-up:
  - do not extend blindly past `1117` on carryover alone
  - recovered later-scene deliverables:
    - `tools/out/l001210_probe_7051_inputfix_summary.json`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.md`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.md`
    - `tools/out/mesen_range_7055_7061_inputfix_v2`
    - `tools/out/design_mesen_range_7055_7061_inputfix_v2/design_pack_range.json`
    - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.md`
  - the promoted bridge extractor now uses chunked debugger `PpuFrame`
    stepping for timed-input windows, which reopens the current local
    `Mesen`/`MesenCore.so` pair on scenario
    `6800:start;6900-6920:start,a`
  - the matching targeted probe restores the later direct-hit cluster, and the
    extracted design packs keep the same visible layer/tile-index block across
    those exact hits:
    - `7051` -> `0D:C4DC`
    - `7059` -> `07:BF49`
    - `7064` -> `07:C112`
  - interior carry-check reading:
    - `7055` keeps the same `bg1/bg2/bg3` tilemaps and `vram.bin` as `7051`,
      so tilemap carry from `0D:C4DC` now holds at `frame_delta = 4`
    - `7055` is not a full-scene carry frame:
      `cgram.bin`, `ppu_state.json`, and `oam.bin` differ and visible sprites
      drop `10 -> 0`
    - `7061` keeps the same `bg1/bg2/bg3` tilemaps as `7059`; `vram.bin` and
      `oam.bin` also match there, so the tilemap carry from `07:BF49` now
      holds at `frame_delta = 2`
  - current decision:
    - later-scene tilemap provenance is now stronger inside the window, but do
      not promote `7051..7064` as a full-scene contiguous carry block
  - the new translation-facing IR layer now exists:
    - `tools/build_mesen_visual_contract.py`
    - `tools/build_mesen_visual_contract_range.py`
    - it promotes each design-pack frame into explicit `bg` vs `obj`
      contracts, keeps OBJ/OAM separate from tilemaps, and can attach current
      tilemap provenance rows per frame/layer
    - it can now also attach summarized producer-side write-breakpoint domains
      from `mesen_probe_boot.lua` via optional `--probe-json`
  - headless producer-trace capture is live again:
    - `validation/run_mesen_capture.sh` now rewrites repo-relative output
      prefixes like `tools/out/...` to absolute repo paths before invoking
      `Mesen --testRunner`
    - the local root cause was not the probe schema; it was that `Mesen`
      resolves relative Lua I/O under `.mesen-config/Mesen2`, so nested
      repo-relative prefixes were timing out after silent write failures
    - promoted live proof artifact:
      - `tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
      - `tools/out/visual_contract_frame300_live_probe_cap2048.json`
    - current proof reading:
      - the frame-`300` full-range trace records `2048` retained write hits with
        `133427` dropped by cap
      - the merged visual contract now carries live `vram`, `cgram`, `oam`,
        and `obj_state` producer domains
  - next best step:
    - retarget the now-working producer-trace path at later translation-facing
      windows (`986`, `7051`, `7055`, `7059`, `7061`) instead of the early
      frame-`300` proof window
    - promoted cheaper later-window proof:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=986`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=987 TD2_BOOT_PROBE_TRACE_START_FRAME=982 TD2_BOOT_PROBE_TRACE_END_FRAME=986 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame986 tools/out/visual_contract_frame986_live_probe.json --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/design_frame986/design_pack.json`
        - `tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame986_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00986_frame.png tools/out/mesen_frame986/main_visible.ppm --diff-out tools/out/mesen_frame986_vs_intro986_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame986/main_visible.ppm tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm --diff-out tools/out/mesen_frame986_vs_bridgeoverride986_diff.ppm`
      - current reading:
        - the extracted `mesen_frame986/main_visible.ppm` is `267` pixels from
          the local frame-`986` screenshot and only `2` pixels from the
          committed `bank1_bootstrap_queue_986_bridgeoverride.ppm`
        - the frame-`986` design pack reports `bgMode = 7`,
          `mainScreenLayers = 0x11`, active `bg1`, and `0` visible sprites
        - the live producer trace records `3246` write hits with no drops:
          `2730` OAM writes across frames `982..986` plus `516` VRAM writes at
          frames `984` and `986`
        - dominant write callsites are IRQ/NMI-side helpers, not mainline game
          logic:
          - OAM: `00:824F/00:8257`
          - VRAM: `00:81E5/00:81F2`
        - all sampled write hits in this window still run under active main
          callback `01:9FE5`
        - no `CGRAM` or `OBJSEL` writes were observed inside `982..986`
        - practical reading: by `986`, the visible late overlay is already
          gone (`0` visible sprites) even though OAM upload traffic is still
          active in the same callback family
        - contract hardening side effect: `td2_boot_probe.json` now preserves
          `trace_start_frame` and `trace_end_frame`, so the merged visual
          contract can carry an exact `producerTrace.traceWindow`
    - keep trace windows producer-active; the narrow frame-`296..300` proof
      attempt emitted `0` write hits even though the full `0..300` window
      works, so empty traces are now a window-selection problem rather than a
      runner problem
    - if you want a machine-generated combined provenance artifact, preserve or
      regenerate the per-hit `td2_boot_probe_l001210_exec.json` for this
      scenario instead of only the summarized singleton source list
    - if you want full-scene continuity, isolate the `7051 -> 7055`
      sprite/OAM disappearance before claiming composition carry
    - bounded 2026-03-21 follow-up in this environment:
      - `MESEN_TIMEOUT_SECONDS=120`, `TD2_BOOT_PROBE_TOTAL_FRAMES=7062`,
        `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`,
        `TD2_BOOT_PROBE_TRACE_END_FRAME=7061`,
        `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'` ->
        `exit 255`, no
        `tools/out/visual_contract_probe_7051_7061_live/td2_boot_probe.json`
      - `MESEN_TIMEOUT_SECONDS=120`, `TD2_BOOT_PROBE_TOTAL_FRAMES=7052`,
        `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`,
        `TD2_BOOT_PROBE_TRACE_END_FRAME=7051`,
        `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'` ->
        `exit 255`, no
        `tools/out/visual_contract_probe_7051_live/td2_boot_probe.json`
    - practical reading:
        - the frame-`300` live producer-trace proof remains valid
        - bounded 2026-03-22 regolden checks also keep the screenshot/build
          target intact:
          - `build_bank1_credits_scene.py` -> `0` mismatched pixels vs
            `tools/out/td2_boot_probe_frame_300.png`
          - `render_mesen_snes_bg.py` on the rebuilt
            `bank1_credits_scene_regolden_20260322_*` files -> `0`
            mismatched pixels vs the same screenshot
          - `td2_port --headless --snes-bg-prefix` still lands at `7244`
            mismatched pixels (`12.632533%`), identical to the historical
            `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`
        - practical routing:
          - keep frame `300` as a solved capture/ROM/Python golden point
          - do not treat it as a zero-diff SDL runtime milestone yet
          - do not pivot Lane 2 away from the current `Mode 7` scanline-start
            gate just because the old credits-scene runtime gap still exists
        - later power-on timed-input ownership traces are still blocked locally
          before artifact emission
      - next best step after this negative result:
        - do not spend more headless retries on the same power-on `7051` path
          without a new starting surface
        - keep using the now-proved `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` window as the current
          later-window ownership anchor while the post-`1093`
          composition/export nuance is explained, before coming back to the
          blocked timed-input `7051` path
        - recover a reusable later-intro savestate/seed for the `7051..7061`
          window only when you need timed-input ownership, not generic late
          attract ownership
    - promoted forward extensions at `990` and `994`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=990`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=991 TD2_BOOT_PROBE_TRACE_START_FRAME=986 TD2_BOOT_PROBE_TRACE_END_FRAME=990 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame990 tools/out/visual_contract_frame990_live_probe.json --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom ./game.smc --frame 994 --frame-timeout-seconds 120 --out-dir ./tools/out/mesen_frame994`
      - `python3 tools/build_mesen_design_pack.py tools/out/mesen_frame994 tools/out/design_frame994 --clean-out`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=995 TD2_BOOT_PROBE_TRACE_START_FRAME=990 TD2_BOOT_PROBE_TRACE_END_FRAME=994 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame994 tools/out/visual_contract_frame994_live_probe.json --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame990_live_probe.json`
        - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame994_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00990_frame.png tools/out/mesen_frame990/main_visible.ppm --diff-out tools/out/mesen_frame990_vs_intro990_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame990/main_visible.ppm tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm --diff-out tools/out/mesen_frame990_vs_bridgeobj990_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00994_frame.png tools/out/mesen_frame994/main_visible.ppm --diff-out tools/out/mesen_frame994_vs_intro994_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame994/main_visible.ppm tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm --diff-out tools/out/mesen_frame994_vs_bridgeobj994_diff.ppm`
      - current reading:
        - frame `990`:
          - `3762` write hits, `0` drops, exact
            `producerTrace.traceWindow = 986..990`
          - `2730` OAM writes across `986..990`
          - `1032` VRAM writes across `986/988/989/990`
          - `5` visible sprites in the fresh design pack
          - `1516` pixels vs the local screenshot and `2` pixels vs the
            committed bridge-object scene
        - frame `994`:
          - `4020` write hits, `0` drops, exact
            `producerTrace.traceWindow = 990..994`
          - `2730` OAM writes across `990..994`
          - `1290` VRAM writes across `990..994`
          - `19` visible sprites in the fresh design pack
          - `2622` pixels vs the local screenshot and `96` pixels vs the
            committed bridge-object scene
        - both windows stay on the same late callback family:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - live producer-side ownership now spans the late bridge-object edge
            from `986` through `994`
          - OAM traffic stays flat while VRAM traffic grows and the visible
            overlay expands between `990` and `994`
          - the remaining frame-`994` screenshot gap is now downstream of
            source ownership, not a missing producer-trace surface
    - promoted forward extension at `998`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=998`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=999 TD2_BOOT_PROBE_TRACE_START_FRAME=994 TD2_BOOT_PROBE_TRACE_END_FRAME=998 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame998 tools/out/visual_contract_frame998_live_probe.json --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame998_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00998_frame.png tools/out/mesen_frame998/main_visible.ppm --diff-out tools/out/mesen_frame998_vs_intro998_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame998/vram.bin tools/out/mesen_frame998/cgram.bin tools/out/mesen_frame998/ppu_state.json tools/out/mesen_frame998_mode7ppu.ppm --oam tools/out/mesen_frame998/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame998_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame998/main_visible.ppm tools/out/mesen_frame998_mode7ppu.ppm --diff-out tools/out/mesen_frame998_mode7ppu_vs_mesen998_diff.ppm`
      - current reading:
        - `4020` write hits, `0` drops, exact
          `producerTrace.traceWindow = 994..998`
        - `2730` OAM writes across `994..998`
        - `1290` VRAM writes across `994..998`
        - `32` visible sprites in the fresh design pack
        - `3119` pixels vs the local screenshot
        - `4` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - `998` now anchors live ownership at the start of the direct
            bridge-extracted block instead of relying only on earlier callback
            continuity notes
          - producer traffic stays flat from `994` into `998` while the
            visible overlay expands again
    - promoted forward extension at `1005`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1005`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1006 TD2_BOOT_PROBE_TRACE_START_FRAME=998 TD2_BOOT_PROBE_TRACE_END_FRAME=1005 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1005 tools/out/visual_contract_frame1005_live_probe.json --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BG_RANGE_START_FRAME=1005 TD2_BG_RANGE_END_FRAME=1005 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop ./validation/run_mesen_dump_bg_range.sh`
      - evidence:
        - `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1005_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01005_frame.png tools/out/mesen_frame1005/main_visible.ppm --diff-out tools/out/mesen_frame1005_vs_intro1005_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1005/vram.bin tools/out/mesen_frame1005/cgram.bin tools/out/mesen_frame1005/ppu_state.json tools/out/mesen_frame1005_mode7ppu.ppm --oam tools/out/mesen_frame1005/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1005_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1005/main_visible.ppm tools/out/mesen_frame1005_mode7ppu.ppm --diff-out tools/out/mesen_frame1005_mode7ppu_vs_mesen1005_diff.ppm`
      - current reading:
        - `6432` write hits, `0` drops, exact
          `producerTrace.traceWindow = 998..1005`
        - `4368` OAM writes across `998..1005`
        - `2064` VRAM writes across `998..1005`
        - `53` visible sprites in the fresh design pack
        - `4466` pixels vs the fresh local screenshot
        - `4` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the first direct bridge-extracted `998..1005` block is now closed
            by live ownership evidence at both ends
          - producer traffic remains inside the same callback family while the
            visible overlay keeps expanding into frame `1005`
    - promoted forward extension at `1013`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1013`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1014 TD2_BOOT_PROBE_TRACE_START_FRAME=1006 TD2_BOOT_PROBE_TRACE_END_FRAME=1013 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1013 tools/out/visual_contract_frame1013_live_probe.json --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1013_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01013_frame.png tools/out/mesen_frame1013/main_visible.ppm --diff-out tools/out/mesen_frame1013_vs_intro1013_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1013/vram.bin tools/out/mesen_frame1013/cgram.bin tools/out/mesen_frame1013/ppu_state.json tools/out/mesen_frame1013_mode7ppu.ppm --oam tools/out/mesen_frame1013/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1013_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1013/main_visible.ppm tools/out/mesen_frame1013_mode7ppu.ppm --diff-out tools/out/mesen_frame1013_mode7ppu_vs_mesen1013_diff.ppm`
      - current reading:
        - `6174` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1006..1013`
        - `4368` OAM writes across `1006..1013`
        - `1806` VRAM writes across `1006..1012`
        - `61` visible sprites in the fresh design pack
        - `4638` pixels vs the fresh local screenshot
        - `10` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the second direct bridge-extracted `1006..1013` block is now
            closed by live ownership evidence at its end
          - OAM stays flat while the visible overlay keeps expanding, and the
            bounded VRAM domain stops one frame earlier than the block end
    - promoted forward extension at `1021`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1021`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1022 TD2_BOOT_PROBE_TRACE_START_FRAME=1014 TD2_BOOT_PROBE_TRACE_END_FRAME=1021 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1021 tools/out/visual_contract_frame1021_live_probe.json --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1021_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01021_frame.png tools/out/mesen_frame1021/main_visible.ppm --diff-out tools/out/mesen_frame1021_vs_intro1021_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1021/vram.bin tools/out/mesen_frame1021/cgram.bin tools/out/mesen_frame1021/ppu_state.json tools/out/mesen_frame1021_mode7ppu.ppm --oam tools/out/mesen_frame1021/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1021_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1021/main_visible.ppm tools/out/mesen_frame1021_mode7ppu.ppm --diff-out tools/out/mesen_frame1021_mode7ppu_vs_mesen1021_diff.ppm`
      - current reading:
        - `5400` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1014..1021`
        - `4368` OAM writes across `1014..1021`
        - `1032` VRAM writes at `1014/1015/1017/1019`
        - `61` visible sprites in the fresh design pack
        - `3557` pixels vs the fresh local screenshot
        - `10` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the third direct bridge-extracted `1014..1021` block is now
            closed by live ownership evidence at its end
          - OAM stays flat, visible sprites stop growing, and bounded VRAM
            activity becomes sparse inside the block
    - promoted forward extension at `1029`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1029`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1030 TD2_BOOT_PROBE_TRACE_START_FRAME=1022 TD2_BOOT_PROBE_TRACE_END_FRAME=1029 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1029 tools/out/visual_contract_frame1029_live_probe.json --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1029_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01029_frame.png tools/out/mesen_frame1029/main_visible.ppm --diff-out tools/out/mesen_frame1029_vs_intro1029_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1029/vram.bin tools/out/mesen_frame1029/cgram.bin tools/out/mesen_frame1029/ppu_state.json tools/out/mesen_frame1029_mode7ppu.ppm --oam tools/out/mesen_frame1029/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1029_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1029/main_visible.ppm tools/out/mesen_frame1029_mode7ppu.ppm --diff-out tools/out/mesen_frame1029_mode7ppu_vs_mesen1029_diff.ppm`
      - current reading:
        - `3822` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1022..1029`
        - only the `oam` producer domain appears in this bounded block:
          - `3822` OAM writes across `1022/1023/1024/1025/1027/1028/1029`
          - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
        - `61` visible sprites in the fresh design pack
        - `1` pixel vs the fresh local screenshot
        - `11` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the fourth direct bridge-extracted `1022..1029` block is now
            closed by live ownership evidence at its end
          - the bounded producer surface has now collapsed to OAM-only inside
            the block while visible sprites stay flat at `61`
          - frame `1029` also lands on a near-solved screenshot surface, so
            this block is no longer merely bridge-visible
    - promoted forward extension at `1037`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1037`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1038 TD2_BOOT_PROBE_TRACE_START_FRAME=1030 TD2_BOOT_PROBE_TRACE_END_FRAME=1037 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1037 tools/out/visual_contract_frame1037_live_probe.json --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1037_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01037_frame.png tools/out/mesen_frame1037/main_visible.ppm --diff-out tools/out/mesen_frame1037_vs_intro1037_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1037/vram.bin tools/out/mesen_frame1037/cgram.bin tools/out/mesen_frame1037/ppu_state.json tools/out/mesen_frame1037_mode7ppu.ppm --oam tools/out/mesen_frame1037/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1037_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1037/main_visible.ppm tools/out/mesen_frame1037_mode7ppu.ppm --diff-out tools/out/mesen_frame1037_mode7ppu_vs_mesen1037_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1030..1037`
        - `4368` OAM writes across `1030..1037`
        - `580` VRAM writes at `1030` and `1034`
        - `61` visible sprites in the fresh design pack
        - `29` pixels vs the fresh local screenshot
        - `8` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the fifth direct bridge-extracted `1030..1037` block is now
            closed by live ownership evidence at its end
          - the bounded producer surface is no longer OAM-only: a narrow VRAM
            pulse returns at `1030` and `1034` while visible sprites stay flat
          - frame `1037` stays close to the screenshot-backed surface without
            needing a callback-family fork
    - promoted forward extension at `1045`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1045`
      - invalid bounded attempt while probe + screenshot shared the same isolated config:
        - parallel `run_mesen_probe_boot.sh` and `run_mesen_dump_bg_range.sh`
          both overran the useful window and ended with `exit 255` before
          emitting artifacts
        - retry policy used:
          - reran the same commands serially, which produced the committed
            artifacts below
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1046 TD2_BOOT_PROBE_TRACE_START_FRAME=1038 TD2_BOOT_PROBE_TRACE_END_FRAME=1045 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1045 tools/out/visual_contract_frame1045_live_probe.json --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1045_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01045_frame.png tools/out/mesen_frame1045/main_visible.ppm --diff-out tools/out/mesen_frame1045_vs_intro1045_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1045/vram.bin tools/out/mesen_frame1045/cgram.bin tools/out/mesen_frame1045/ppu_state.json tools/out/mesen_frame1045_mode7ppu.ppm --oam tools/out/mesen_frame1045/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1045_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1045/main_visible.ppm tools/out/mesen_frame1045_mode7ppu.ppm --diff-out tools/out/mesen_frame1045_mode7ppu_vs_mesen1045_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1038..1045`
        - `4368` OAM writes across `1038..1045`
        - `580` VRAM writes at `1038` and `1042`
        - `61` visible sprites in the fresh design pack
        - `34` pixels vs the fresh local screenshot
        - `15` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the sixth direct bridge-extracted `1038..1045` block is now
            closed by live ownership evidence at its end
          - the narrow VRAM pulse pattern remains, but it shifts later to
            `1038` and `1042` while visible sprites stay flat
          - parallel reuse of the same isolated Mesen config is not reliable
            for this lane; serialize probe and screenshot capture when needed
    - promoted forward extension at `1053`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1053`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1054 TD2_BOOT_PROBE_TRACE_START_FRAME=1046 TD2_BOOT_PROBE_TRACE_END_FRAME=1053 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1053 tools/out/visual_contract_frame1053_live_probe.json --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1053_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01053_frame.png tools/out/mesen_frame1053/main_visible.ppm --diff-out tools/out/mesen_frame1053_vs_intro1053_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1053/vram.bin tools/out/mesen_frame1053/cgram.bin tools/out/mesen_frame1053/ppu_state.json tools/out/mesen_frame1053_mode7ppu.ppm --oam tools/out/mesen_frame1053/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1053_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1053/main_visible.ppm tools/out/mesen_frame1053_mode7ppu.ppm --diff-out tools/out/mesen_frame1053_mode7ppu_vs_mesen1053_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1046..1053`
        - `4368` OAM writes across `1046..1053`
        - `580` VRAM writes at `1046` and `1050`
        - `61` visible sprites in the fresh design pack
        - `31` pixels vs the fresh local screenshot
        - `14` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the seventh direct bridge-extracted `1046..1053` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists one block later and
            shifts again, now landing at `1046` and `1050`
          - the lane still prefers serialized Mesen capture when both a probe
            artifact and a local screenshot are needed
    - promoted forward extension at `1061`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1061`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1062 TD2_BOOT_PROBE_TRACE_START_FRAME=1054 TD2_BOOT_PROBE_TRACE_END_FRAME=1061 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1061 tools/out/visual_contract_frame1061_live_probe.json --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1061_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01061_frame.png tools/out/mesen_frame1061/main_visible.ppm --diff-out tools/out/mesen_frame1061_vs_intro1061_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1061/vram.bin tools/out/mesen_frame1061/cgram.bin tools/out/mesen_frame1061/ppu_state.json tools/out/mesen_frame1061_mode7ppu.ppm --oam tools/out/mesen_frame1061/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1061_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1061/main_visible.ppm tools/out/mesen_frame1061_mode7ppu.ppm --diff-out tools/out/mesen_frame1061_mode7ppu_vs_mesen1061_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1054..1061`
        - `4368` OAM writes across `1054..1061`
        - `580` VRAM writes at `1054` and `1058`
        - `61` visible sprites in the fresh design pack
        - `36` pixels vs the fresh local screenshot
        - `22` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the eighth direct bridge-extracted `1054..1061` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists yet again and shifts to
            `1054` and `1058`, while visible sprites stay flat
          - serialized Mesen capture remains the preferred path when both a
            probe artifact and a local screenshot are required
    - promoted forward extension at `1069`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1069`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1070 TD2_BOOT_PROBE_TRACE_START_FRAME=1062 TD2_BOOT_PROBE_TRACE_END_FRAME=1069 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1069 tools/out/visual_contract_frame1069_live_probe.json --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1069_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01069_frame.png tools/out/mesen_frame1069/main_visible.ppm --diff-out tools/out/mesen_frame1069_vs_intro1069_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1069/vram.bin tools/out/mesen_frame1069/cgram.bin tools/out/mesen_frame1069/ppu_state.json tools/out/mesen_frame1069_mode7ppu.ppm --oam tools/out/mesen_frame1069/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1069_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1069/main_visible.ppm tools/out/mesen_frame1069_mode7ppu.ppm --diff-out tools/out/mesen_frame1069_mode7ppu_vs_mesen1069_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1062..1069`
        - `4368` OAM writes across `1062..1069`
        - `580` VRAM writes at `1062` and `1066`
        - `61` visible sprites in the fresh design pack
        - `48` pixels vs the fresh local screenshot
        - `25` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the ninth direct bridge-extracted `1062..1069` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists again and shifts to
            `1062` and `1066`, while visible sprites stay flat
          - screenshot-backed mismatch is rising slowly, but still without any
            callback-family fork
    - promoted forward extension at `1077`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1077`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1078 TD2_BOOT_PROBE_TRACE_START_FRAME=1070 TD2_BOOT_PROBE_TRACE_END_FRAME=1077 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1077 tools/out/visual_contract_frame1077_live_probe.json --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1077_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01077_frame.png tools/out/mesen_frame1077/main_visible.ppm --diff-out tools/out/mesen_frame1077_vs_intro1077_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1077/vram.bin tools/out/mesen_frame1077/cgram.bin tools/out/mesen_frame1077/ppu_state.json tools/out/mesen_frame1077_mode7ppu.ppm --oam tools/out/mesen_frame1077/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1077_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1077/main_visible.ppm tools/out/mesen_frame1077_mode7ppu.ppm --diff-out tools/out/mesen_frame1077_mode7ppu_vs_mesen1077_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1070..1077`
        - `4368` OAM writes across `1070..1077`
        - `580` VRAM writes at `1070` and `1074`
        - `61` visible sprites in the fresh design pack
        - `36` pixels vs the fresh local screenshot
        - `52` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the tenth direct bridge-extracted `1070..1077` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists again and shifts to
            `1070` and `1074`, while visible sprites stay flat
          - the screenshot-backed surface stays tight, but the Python
            `mode7-ppu` gap now rises materially inside the same callback
            family, which makes `1085` the next useful boundary
    - promoted forward extension at `1085`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1085`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1086 TD2_BOOT_PROBE_TRACE_START_FRAME=1078 TD2_BOOT_PROBE_TRACE_END_FRAME=1085 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1085 tools/out/visual_contract_frame1085_live_probe.json --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1085_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01085_frame.png tools/out/mesen_frame1085/main_visible.ppm --diff-out tools/out/mesen_frame1085_vs_intro1085_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1085/vram.bin tools/out/mesen_frame1085/cgram.bin tools/out/mesen_frame1085/ppu_state.json tools/out/mesen_frame1085_mode7ppu.ppm --oam tools/out/mesen_frame1085/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1085_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1085/main_visible.ppm tools/out/mesen_frame1085_mode7ppu.ppm --diff-out tools/out/mesen_frame1085_mode7ppu_vs_mesen1085_diff.ppm`
      - current reading:
        - `4368` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1078..1085`
        - producer domains collapse to OAM only across `1078..1085`
        - no sampled VRAM writes fire in the bounded `1078..1085` window
        - `61` visible sprites in the fresh design pack
        - `74` pixels vs the fresh local screenshot
        - `69` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the eleventh direct bridge-extracted `1078..1085` block is now
            closed by live ownership evidence at its end
          - compared with `1077`, the narrow VRAM pulse disappears entirely,
            leaving a pure-OAM ownership block under the same callback family
          - the screenshot-backed and Python-render gaps now rise together,
            which makes `1093` the next useful boundary
    - promoted forward extension at `1093`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1093`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1094 TD2_BOOT_PROBE_TRACE_START_FRAME=1086 TD2_BOOT_PROBE_TRACE_END_FRAME=1093 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1093 tools/out/visual_contract_frame1093_live_probe.json --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1093_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01093_frame.png tools/out/mesen_frame1093/main_visible.ppm --diff-out tools/out/mesen_frame1093_vs_intro1093_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1093/vram.bin tools/out/mesen_frame1093/cgram.bin tools/out/mesen_frame1093/ppu_state.json tools/out/mesen_frame1093_mode7ppu.ppm --oam tools/out/mesen_frame1093/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1093_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1093/main_visible.ppm tools/out/mesen_frame1093_mode7ppu.ppm --diff-out tools/out/mesen_frame1093_mode7ppu_vs_mesen1093_diff.ppm`
      - current reading:
        - `4368` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1086..1093`
        - producer domains stay OAM-only across `1086..1093`
        - no sampled VRAM writes fire in the bounded `1086..1093` window
        - `61` visible sprites in the fresh design pack
        - `207` pixels vs the fresh local screenshot
        - `129` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the twelfth direct bridge-extracted `1086..1093` block is now
            closed by live ownership evidence at its end
          - the pure-OAM ownership shape survives again, but the
            screenshot-backed gap now jumps sharply while the callback family
            still stays flat
          - `1093` is now the promoted bridge-visible frontier for this
            callback family, so the next step is to explain the post-`1093`
            composition/export nuance rather than extend the same proof loop
    - consolidated callback/state range checkpoint for the same late window:
      - `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
      - `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`
      - evidence:
        - `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`
        - `rom_analysis/docs/intro_01_9fe5_window_986_1093.md`
      - current reading:
        - sampled frames `986..1093` stay on one callback family:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - `bgMode = 7` and main-screen `bg1` stay fixed across the whole
          sampled window
        - visible sprite progression is now explicit in one artifact:
          - `0` at `986`
          - `5` at `990`
          - `19` at `994`
          - `32` at `998`
          - `53` at `1005`
          - `61` from `1013` through `1093`
        - the late state ramp is now also explicit in one timeline:
          - `$0206` stays `0` through `1021`
          - then rises `1,3,5,7,9,11,13` from `1029` through `1077`
          - `$040A` rises `6,8,10,12,14,16,17` across that same later block
          - `$0054` plateaus at `128` from `1077` through `1093`
        - producer domains across the whole range stay inside `oam`/`vram`,
          with sampled OAM-only windows at `1029`, `1085`, and `1093`
      - next best step:
        - treat the new `986..1093` range summary as the current late
          callback-family source of truth
        - use it to explain the post-`1093` composition/export nuance before
          reopening the blocked timed-input `7051` ownership lane
    - post-`1093` compare checkpoint for the first failing continuation block:
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1094_1101_v1 tools/out/visual_contract_range_1094_1101 --provenance-json rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc --clean-out`
      - evidence:
        - `tools/out/visual_contract_range_1094_1101/visual_contract_range.json`
        - `tools/out/post_1093_compare/summary.json`
        - `tools/out/post_1093_compare/summary.md`
        - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`
      - current reading:
        - `1094..1101` keeps the same visible surface shape:
          - `bgMode = 7`
          - main-screen `bg1`
          - `61` visible sprites
        - the export surface change is now explicit:
          - `main.ppm` is `256x239`
          - `main_visible.ppm` is exactly the top `224` lines of `main.ppm`
          - the bottom `224` lines are not the right comparison surface
        - only two sampled Mode 7 fields differ between end-of-frame and
          visible-state dumps:
          - `ppu.mode7.matrix[0]`
          - `ppu.mode7.matrix[3]`
        - bare visible-state substitution is now falsified:
          - base render vs `main_visible.ppm`: `177..574` mismatched pixels
          - visible-state render vs `main_visible.ppm`: `362..5930`
            mismatched pixels
      - next best step:
        - keep `7051` parked
        - use the active-trace boundaries to split the continuation into:
          - `1102..1113`
          - `1114..1117`
        - do not spend more time searching for hidden direct `VRAM/CGRAM`
          uploads in this window unless a new targeted trace contradicts the
          current proof
    - post-`1102` continuation checkpoint for the `00:8029` tail:
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1102_1109_v1 tools/out/visual_contract_range_1102_1109_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1110_1117_v1 tools/out/visual_contract_range_1110_1117_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
      - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117/summary.md`
      - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`
        - evidence:
        - `tools/out/visual_contract_range_1102_1109_activity/visual_contract_range.json`
        - `tools/out/visual_contract_range_1110_1117_activity/visual_contract_range.json`
        - `tools/out/post_1093_compare_1102_1117/summary.json`
        - `tools/out/post_1093_compare_1102_1117/summary.md`
        - `tools/out/mode7_plateau_1105/analysis.json`
        - `tools/out/mode7_plateau_1105/analysis.md`
        - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`
        - `rom_analysis/docs/mode7_1105_validation_reference.md`
      - current reading:
        - the entire `1102..1117` window keeps the same presentation surface:
          - `bgMode = 7`
          - main-screen `bg1`
          - `61` visible sprites
          - main callback `00:8029`
        - `main_visible.ppm` remains the top `224`-line crop of `main.ppm`
          across the whole window
        - the later internal boundaries are now narrower:
          - `1102..1113`: one per-frame `OAM` DMA, no direct `VRAM/CGRAM`
            writes, `3` `Mode 7` events / `16` writes
          - `1114..1117`: no DMA, still no direct `VRAM/CGRAM` writes, same
            `Mode 7` event shape
        - bare visible-state substitution is only still wrong for `1102..1104`
          and then converges by `1105`
        - the remaining renderer gap stabilizes at `2698` mismatched pixels for
          every frame `1105..1117`
        - the updated compare artifact now proves that plateau is spatially and
          byte-wise identical from `1105..1117`:
          - same diff-mask hash
          - same diff payload hash
          - same bounding box `24,68 -> 232,138`
        - the same compare artifact now also proves the plateau is driven by
          one canonical extracted scene state from `1105..1117`:
          - `main_visible.ppm`, `vram.bin`, `oam.bin`, and `ppu_state.json`
            are byte-identical from `1105..1117`
          - only `cgram.bin` continues to change frame to frame
        - canonical frame-`1105` object sanity checks now show:
          - current `mode7-ppu` render: `2698` mismatched pixels
          - `simple` OBJ render: `2698`
          - no-`OAM` render: `9717`
        - the new canonical plateau analyzer now also proves:
          - `bg1_visible.ppm` is byte-identical from `1105..1117`
          - no-`OAM` vs `bg1_visible.ppm` still mismatches `3982` pixels
          - the BG-only diff box is `24,67 -> 232,138`
          - only `4` visible sprites intersect the main plateau diff box
          - their combined coverage there is only `128 / 14839` pixels
            (`0.862592%`)
          - a whole-box horizontal shift of `-1` improves the BG-only compare
            from `3982 -> 3611`
          - a direct `ppu.mode7.hscroll +1` perturbation reproduces most of
            that BG-only gain (`3982 -> 3613`)
          - but the same perturbation worsens the full-scene compare
            (`2698 -> 2780`)
          - per-row best-shift counts still favor `-1` on `38` rows, so the
            plateau now reads as mostly BG sampling/rounding rather than sprite
            ownership
          - the new `Mode 7` sampling stats now also prove:
            - the main and BG-only plateau bboxes stay entirely inside the map
              (`outsideMapPixels = 0`)
            - base BG bbox sample range is `x = 24..232`, `y = 65..137`
            - best tested BG-only delta (`hscroll +1`) still stays inside the
              map with sample range `x = 25..233`, `y = 65..137`
          - the doc/source cross-check now agrees with that narrowing:
            - the repo renderer already matches the main `fullsnes` /
              `Mesen-S` operational formula shape
            - canonical `1105` keeps `EXTBG`, direct color, windows, and color
              math inactive
            - so the leading frontier is no longer `M7SEL` edge handling
      - next best step:
        - keep `7051` parked
        - treat `line + 1` as the official Python/tooling `Mode 7` rule for
          the late `00:8029` window and for the broader compare path
        - stop treating the old `2698` composed-screen plateau as the active
          frontier; it is now closed on the Python compare path
        - do not treat the surviving `1102..1104` visible-state mismatch as a
          reason to reopen the composed-screen rule; end-of-frame state plus
          `line + 1` already lands at `0`
        - treat the isolated `bg1_visible` mismatch as the new immediate
          frontier:
          - `1102`: `6032`
          - `1103`: `5966`
          - `1104`: `6176`
          - `1105..1117`: `2271`
        - keep `--mode7-line-bias 0` only as an explicit counterfactual /
          escape hatch for validation and source-comparison runs
        - stop spending iterations on more local `Mode 7` near-neighbor tweaks
          of the same family for the plateau:
          - bounded `36`-model grids at `1105` and `1117`
          - no zero-main candidate beats the current `2271` BG-only floor
        - current sampled evidence outside `1102..1117` now leans toward
          promotion rather than rollback:
          - frame `978`: `4 -> 0`
          - frame `982`: `4 -> 1`
          - frame `986`: `270 -> 266`
          - frame `990`: `1641 -> 1638`
          - frame `994`: `3232 -> 3228`
          - frame `1200`: `5249 -> 2551`
          - frame `1080`: `14813 -> 14816`
        - practical reading:
          - `line + 1` is no longer just a late-`00:8029` patch candidate
          - it is now the official default for the Python renderer/builders
            that drive Lane 2 evidence and compare artifacts
          - the only sampled regression so far is the tiny `+3` change on the
            already-unsolved frame `1080`
          - the shared `td2_ppu.c` file is no longer a presumed blocker for
            this rule:
            - the other-process diff does not overlap the `Mode 7` line-origin
              block
            - a surgical runtime patch closes isolated scene renders at
              `1102/1105/1117` to `0`
          - the remaining caution is operational, not semantic:
            - use `--sequence /dev/null` for isolated `--snes-bg-*` runtime
              validation so the default intro-loop manifest does not overwrite
              the requested scene
          - the export-side ambiguity is now closed:
            - `tools/mesen_ppu_extract/Program.cs` writes `layers/bg1.ppm`
              from `GetTilemap(...)` and derives `layers/bg1_visible.ppm`
              through `NormalizeScroll(...) + CropVisibleRegion(...)`
            - the dedicated crop audit closes that exact path at
              `1102/1105/1117` with `0` mismatched pixels
            - `layers/bg1_visible.ppm` should therefore be treated as a
              viewer/export surface, not as the exact on-screen `BG1`
              contribution target for this slice
          - the next concrete step returns to Lane 2 continuity:
            - resume later-window callback/provenance/native replacement work
              beyond `1117`
            - keep `main_visible.ppm` as the composed-scene parity surface for
              renderer validation

## 3. Expand Into Gameplay Frames

Goal: move from intro archaeology to gameplay-era assets.

- Closed first deterministic seed-window deliverable:
  - `rom_analysis/maps/tracks/track1_seed_0086_0093.md`
  - `tools/out/track1_seed_0086_0093_v2.json`
  - `tools/out/track1_seed_0086_0093_v2_sequence.txt`
  - `tools/out/track1_seed_0086_0093_v2_sequence.json`
- Closed seeded sweep deliverable:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v1.md`
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`
- Current lane-3 reading:
  - `.mesen-config/Mesen2/SaveStates/game_11.mss` is no longer admissible as a
    verified gameplay seed
  - the new no-input seed-surface audit now classifies it as
    `front_end_menu_seed`:
    - `active_main = 02:9016`
    - `$1C6A = [1]`
    - `$1C70 = [0]`
    - `$0202 = [65535]`
  - the same seed can still traverse gameplay-like cockpit presentation
    surfaces before returning to the top-level signboard menu; the stronger
    current fit is that this family can cross short attract/demo gameplay
    slices on the way, so current sweep output from this family must be treated
    as mixed front-end/presentation/demo evidence rather than direct gameplay
    proof
  - the repo now also has preserved user-verified live-race manual seeds, and
    the current leading sample is `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - that sample now has a closed visible-stack and producer-side read:
    - frame `0` visible main-screen layers are `BG1 + BG2 + OBJ`
    - `BG2` is the only visible BG layer with heavy per-scanline motion
    - the confirmed frame repeatedly rewrites `$22/$23`
    - `bank1.asm` `5846..5851` then writes `BG2VOFS` from `$22/$23`
    - `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`
    - `TMAIN` briefly rises to `0x17` at scanline `23`, then returns to
      `0x13` at scanline `121`
  - practical current fit on that seed:
    - `BG1` is the strongest cockpit-base candidate
    - `BG2` is the strongest road/world raster candidate
    - `BG3` behaves like a split-controlled strip/auxiliary layer rather than
      the full gameplay world plane
  - the strongest open producer cluster is now narrowed inside `L01318D`:
    - `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
  - the preserved `slot2_extra` seed is now explicitly boundary/control
    evidence:
    - it stays on `00:8029 / 00:835F / 00:8029`
    - frame `0` shows visible `BG3` only
  - the current best non-savestate candidate now comes from the deterministic
    power-on default-rival route:
    - base path:
      `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start`
    - the late-input follow-up now proves this corridor is not just a passive
      repeated frame:
      - `A` and `B` both change `state_0960` from frame `2050`
      - `A` changes it as `0 -> 128`; `B` changes it as `0 -> 32768`
      - the shared callback surface stays the same in all three lanes:
        `02:9016` main, `01:96A0` IRQ, `02:8F3C` NMI
    - `A` also opens broader downstream state and visual change:
      - `dp_0054` first diverges at `2052`
      - `dp_0053` and `state_09a8` first diverge at `2053`
      - `state_137c` first diverges at `2104`
      - the first post-input visible divergence against the no-input lane is
        now frame `2052` over bbox `[17, 13, 193, 17]`
      - from `2054` onward the same `A` lane also diverges over a lower
        dashboard bbox around `[72..88, 155..174]`
    - `B` currently looks like the lower-yield control lane:
      - it still changes `state_0960` from `2050`
      - but the visible divergence against no-input is sparse (`2052`, `2068`,
        `2084`) and the state delta set stays almost entirely at `state_0960`
  - bounded scripted-input sweep result:
    - `b_hold` first becomes nontrivial at frame `76` and moves again at `92`
    - `start_then_b_hold` stays a static seed after frame `64`
    - current refreshed sweep (`v2_current`) now also keeps `start_then_a_hold`
      static after its first nontrivial frame `64`
  - the newer fingerprinted sweep changes the current-seed read materially:
    - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
    - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
    - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.json`
    - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.json`
    - on savestate SHA-256
      `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`,
      both `a_hold` and `b_hold` are dynamic and pixel-identical across the
      first `300` captured frames
    - `a+b` stays aligned with that same lane through frame `218` and first
      diverges at frame `219` with bbox `[99, 75, 153, 113]`, but still inside
      the same inherited selector family
    - this is now best read conservatively as a lane that can be clipping or
      truncating short attract/demo material, not as a reliable long-form
      gameplay corridor
    - the current `b_hold` output no longer matches the older promoted
      `v2_current` `b_hold` from capture `0`, so the old `76/92/108` cadence
      cannot be assumed to describe the mutable current seed or current
      gameplay
  - the old raw `86..93` `b`-hold dump is still exact against the screenshot
    harness, but that specific window remains static
  - the first early moving raw follow-up (`start_then_a_hold`, `61..68`) is now
    a documented blocker:
    - input scheduling is present in the dump summary
    - but the raw surface renders back as `bgMode = 0`,
      `mainScreenLayers = 0x00`
    - the dumper screenshot for frame `61` differs from the sweep screenshot by
      `51503` pixels and does not match nearby sweep frames either
  - the first screenshot-backed moving follow-up is now committed:
    - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
    - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
    - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
    - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`
    - it collapses frames `76..155` into `5` image entries / `4` distinct
      states
    - state changes land on a `16`-frame cadence at `76/92/108/124/140`
    - frame `140` repeats the frame-`76` image, giving a screenshot-backed
      `64`-frame cycle
  - the current blocker is now sharper:
    - raw dump artifacts `track1_b_hold_0086_0108_v1*` stay byte-identical
      across `86 -> 92` and `92 -> 108`
    - archived probe fields also stay flat at `86`, `92`, and `108`
    - deeper debugger follow-up now explains why:
      - visible-scanline sampling on frames `86`, `92`, and `108` runs under
        `active_main = 02:9016`
      - visible IRQ state alternates between `01:96A0` and `01:960D`
      - visible `ppu.mainScreenLayers` toggles between `0x13` and `0x17`
      - targeted late-scanline register tracing records the same
        `M7HOFS/M7VOFS/$210F-$2114` write set on every frame `86..108`
      - end-of-frame raw/probe still collapses back to `00:8029/00:835F` and
        `ppu.mainScreenLayers = 0x04`
    - practical read:
      - the screenshot-vs-raw split is now a phase split, not a missing
        gameplay lane
      - the remaining blocker is that the sampled visible-phase `PPU` state for
        `86`, `92`, and `108` still matches except for the visible-phase queue
        cursor pair `7E:0053/0054`
      - the added bank-1 producer-side WRAM/window/OAM fields also stay flat
        across those three frames
      - `cpu.d = 0` rules out a hidden direct-page base change
      - explicit visible-phase `v5` samples bind `00:0053/0054` to the same
        `7E:0053/0054` WRAM values, with frame `86` at `0x38/0x38` and frames
        `92/108` at `0x48/0x48`
      - the same `v5` queue summary shows `queue_dma_active_descriptor_count = 0`
        across all sampled visible scanlines even though `0600` still has
        `32` nonzero slots
      - mirrored-bank boot-probe exec tracing still reports `0` hits on the
        bank-0 queue helpers and bank-1/bank-2 queue producers
      - widened scanline-local tracing on frame `86` now reaches scanline `259`
        and catches an intermediate late write trio at frame `87`, scanline
        `228`: `00:0053/0055/0056 = 0x38/0x90/0x15` while `00:0054` stays
        `0x38` under `active_main = 02:9016`
      - frame-boundary follow-up now proves that same state survives frame
        `86 end`, frame `87 start`, the frame-`87` scanline wrap
        (`261 -> 0`), and at least through frame `87`, scanline `97`
      - wider multi-frame follow-ups now prove the same state also survives
        frame `87 end`, frame `88 start`, frame `88 end`, frame `89` start,
        and at least through frame `89`, scanline `96`
      - the same late write trio repeats on frames `88` and `89`, which makes
        this a recurring post-visible `02:9016` stage rather than a one-frame
        anomaly
      - shifted `88` follow-up now records the first direct visible-path
        `00:0054` producer:
        - frame `90`, scanline `30`: `00:0054 = 0x40`
        - frame `90`, scanline `54`: `00:0054 = 0x48`
        - `00:0053` still remains `0x38`
      - shifted `90` follow-up now records the next equalized gameplay state:
        - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
        - frame `91 start/end`:
          `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
        - frame `92 start`:
          `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
        - frame `91`, scanline `229`: `00:0053 = 0x48`,
          `00:0055/0056 = 0xB8/0x14`
        - frame `92`, scanline `227`: `00:0055/0056` resets to `0x90/0x15`
      - helper-side follow-up against nearby bank-1 sinks
        `7E:1E24/1E26/070C/0718` stays negative across that same `90..92`
        window
      - the older end-of-frame write trace still collapses later to
        `00:0053/0055/0056 = 0x00/0x84/0x17` under `active_main = 00:8029`
- Capture deterministic gameplay frame windows via Mesen extractor.
- Build design packs for those windows:
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/<gameplay_range_dir>`
- Classify extracted assets:
  - road surfaces and horizon tiles -> `rom_analysis/graphics/tilesets/`
  - HUD/UI elements -> `rom_analysis/graphics/ui/`
  - dynamic objects/sprites -> `rom_analysis/graphics/sprites/`
- Immediate follow-up:
  - do not spend more retries on the early `start_then_a_hold` raw mismatch;
    that blocker has already been narrowed three times without a changed
    boundary
  - do not promote any more `game_11.mss` sweep output as gameplay while the
    seed still audits as `front_end_menu_seed`
  - use the new `A`-responsive power-on corridor as the active proving lane:
    - extend it past `2052` far enough to prove world motion / object spawn or
      some other unmistakable gameplay-side behavior
    - in parallel, keep checking whether the corridor ever exits the inherited
      top-menu selector family
  - keep `B` as a control lane because it changes `state_0960` cleanly while
    producing much sparser visible fallout than `A`
  - only after that, decide whether the best next target is the older
    `76/92/108` visible-phase debugger lane or the newer post-`2050` A-lane

## 4. Bank API Contracts (Code-Side Archaeology)

Goal: connect extracted assets with execution ownership.

- Bank 30:
  - classify callback and service entry points that prepare render/map state.
- Bank 10:
  - tie physics state writes to tile/sprite behavior deltas in captured frames.
- Bank 11:
  - map rasterizer/road table consumers and outputs.

Update findings in:

- `rom_analysis/code/main_loop.asm`
- `rom_analysis/code/physics.asm`
- `rom_analysis/code/render.asm`
- `rom_analysis/docs/engine_notes.md`


## Source Of Truth :: Progress Checkpoints

- Source: `rom_analysis/docs/progress_checkpoints.md`
- Bundle copy: `sources/rom_analysis/docs/progress_checkpoints.md`
- Last updated: `2026-03-28 15:51`
- Note: Checkpoint log with evidence-bearing milestones.

---

# ROM Archaeology Progress Checkpoints

Snapshot date: `2026-03-27`

This file tracks plan progress as checkpoints with objective evidence and the
next gate needed to advance.

## Plan Position (Across All Lanes)

| Lane | Status | Completion read |
|---|---|---|
| Lane 1: Bank30 compression provenance | active | core pipeline is in place; registry tightening now closes `9681` as `sentinel-control` and `E91F` as `nested-invalid-marker`; active unresolved queue remains `EE7F` and `DA96` |
| Lane 2: Mesen tile/sprite/tilemap design handoff | active | resume from `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`; extraction + design packs are operational; contiguous provenance windows still cover `1086..1117`, the later direct-hit cluster `7051/7059/7064` now also has interior tilemap carry confirmation at `7055/7061`, the reopened result is tilemap-only rather than full-scene carry because `7055` still diverges in visible-sprite/OAM composition, a new visual-contract IR now separates BG/CHR state from OBJ/OAM state with optional provenance binding, the frame-`300` live producer-trace proof is still good after the launcher fix, frames `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` now have live producer-trace-backed visual contracts under the same `01:9FE5` callback family, the new consolidated `986..1093` range summary now makes that callback/state progression explicit in one artifact, the post-`1093` compare summary now closes the first `1094..1101` read by proving `main_visible.ppm` is the top `224` lines of `main.ppm` and that swapping only visible-scanline `matrix[0]/[3]` values makes the render mismatch worse, a new Mesen activity-trace builder now normalizes `DMA/VRAM/Mode7` probe outputs into frame/callback events, the visual-contract builders now also merge that activity layer directly, the follow-up `1102..1117` compare summary proves the whole `00:8029` continuation keeps the same `bg1`/`61`-sprite surface, the new `1118..1125` continuation note extends that exact no-DMA surface past the old headless edge, the next sampled compare block now closes the same exact surface through `1133`, the wider `1164..1172` boundary window already proved the next later change is a producer-side reactivation rather than a callback switch, a refreshed blob-cycle report now ties that reactivation to a concrete ownership path `01:B6E3 -> 01:9DC6 -> 00:95BD -> $096A/$0700 -> OAMDATA`, filters strictly to `1134..1200`, and emits transition rows that prove `state0204` alone cannot explain blob/`VMADD` selection because each sampled `1/2/3` state reaches all three `AA10/AB58/ACA0` blobs and both `0x4920/0x49A0` targets. That moves the strongest next static target down into the deeper `$0440/$0442` phase loop inside `L00B6E3`. The previously open `$1C7C` naming frontier is now closed by rendered descriptor rows `11..14`: `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, `West Coast - Hardest`; the separate `$1C6A` top-menu surface is now also closed by rendered descriptor rows `15..17`: `Game Options`, `Play TDII`, `High Score`; those same `$1C6A` branches are now semantically closed as `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`, and `High Score -> L00A3CC`; the next downstream `$1C70` surface is now fully closed as a `4`-state `2x2` Select Opponent grid with a `1E:8000` row `0x1D` selection box, three explicit rear-car cells from `16:8000/18:8000/1B:8000`, and a separate helper-`8` BG1 stopwatch/clock slot, and `L008B87` now also closes the first handoff semantics of that same choice by turning `$1C70 = 0..2` into `$1C76 = 1`, `$1C7A = $1C70` while `$1C70 = 3` forces the no-opponent branch `$1C76 = 0`, `$1C7A = 0`; no-force timed-input probes now also recover the default rival corridor organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`. Callback-relative `v5/v6` follow-ups now also drive the fourth slot organically by keying `right+down` and `start` to first live `01:C1D2`, and a later `be43+17-22:start` confirm now closes the no-opponent path through `L008B87 -> 01:902D -> 01:9111 -> active_main = 02:9016` while preserving `$1C70 = 3` / `$1C76 = 0` at the same downstream timestamps where the rival baseline keeps `0 / 1`. A direct `2044..2199` compare now shows that both paths already share `02:9016/01:96A0/02:8F3C`, keep `54` sampled fields identical, and narrow the remaining split to `14` fields, with `state_09a2/state_09a8` and the paired DP scratch fields `0020/0022/0053/0054` the strongest post-handoff targets; the corrected screenshot-review packs now establish that `2044` is a dead transition frame and the first shared non-black review window is `2048..2088`, while the extended probe compare now closes the first stable rival-vs-clock live split itself as `$1C76 -> state_11f3 -> oam_0730` in `bank2.asm` `L0108EF`, matching the rival-only top-strip OAM marker seen in the corrected screenshots. A full-rate `2048..2088` compare now pushes the lane further: frame `2048` alone carries a smaller transition bbox `(11, 20, 14, 21)`, frames `2049..2088` keep the same full top-strip bbox `(11, 11, 194, 21)`, and the suspected `09A2/09A8` pulse points `2051/2083` show no extra whole-frame or adjacent-frame-visible change in either lane. Normalized front-end row previews now also sharpen the remaining car-facing read: rows `8..10` decode to a three-phase rolling-tire helper rather than a name-bearing label set, rows `0x15..0x1B` decode to control/sound menu text (`Brake`, `Throttle`, `Horn`, `Upshift`, `Downshift`, `Steering`, `Pause`, `stereo`), the `01:9C77` per-car bases now calibrate to Porsche 959 / Lamborghini Diablo / Ferrari F40 OBJ catalogs, a stable frame-`1500` front-end car-presentation render keeps the `Porsche 959` title/info box intact without OAM, the helper-provenance artifact anchors that visible lower-screen BG2 surface to helper bundle `10`, static `L00BC0F` proves the per-car `BG2` reload uses `$0202 + 0x0009` through `L00A9A0/L00A9CB` without a paired per-car `L00A9F2`, and the new exact-frame raw-dump compare lane now keeps `BG1` unchanged across frames `1500/1640/1780`, limits visible `BG2` tilemap deltas to the top row (`27/11/27` changed cells), and shows `0` changed visible-union `BG2` CHR bytes across those same pairings; this frame trio is currently best described as one front-end car-presentation corridor rather than a proven interactive car-select menu. Short-force callback probes still show the next headless limit clearly: after one real `01:B1F9` entry at frame `1201`, `01:9568/01:95AD` stay pinned as `active_main` through frame `2199` with no `7E:096C..0971` writes and no exec hit at `01:B226/B638/B6A3/B6E3/B755/01:9D69/02:9016/02:8F3C`, so direct-force callback promotion remains low-yield unless a richer selector/savestate capture appears. |
| Lane 3: Gameplay-era frame archaeology | active | the older promoted `v2_current` lane still explains the historical screenshot-vs-end-frame split and the pre-drift queue-cursor equalization path through frames `90..92`, but a fresh current-seed recheck now closes an important confusion point: today's `game_11.mss` fingerprint no longer reproduces that window and instead stays flat on `00:8029/00:835F` with `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12` and `0` write hits in `target_frame=90/91` scanline reruns. The seed-surface audit still proves the current `game_11.mss` savestate is a `front_end_menu_seed`, not verified gameplay. The repo now also carries a preserved manual live-race seed pair from user Mesen slots `#1/#3`, plus slot `#2` as an explicit nearby boundary seed. The primary pair still loads onto `02:9016/01:96A0/02:8F3C` with the inherited selector family, and a new aligned control compare now proves the old post-`2050` default-rival no-input corridor is already separated inside that same callback family: both manual seeds differ on all `12/12` aligned frames in `oam_0730`, `state_11f3`, `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and `state_09a2`. A new attract/demo boundary note now demotes a key historical assumption: older no-input and early-input corridors can clip short gameplay-like demo slices, so the absence of a long uninterrupted gameplay segment there is no longer strong negative evidence by itself. A new ownership note now closes the first semantic pass on those split fields: `state_11f3 -> oam_0730` is rival-gated HUD/OAM, `state_09a2` is an OAM cursor, `state_09a8` is allocator/build control, `dp_0053/0054` behave as DMA-ring cursors, and `dp_0020/0022` are still best read as transient builder scratch. A new live-race layer-stack note now narrows the visible composition on a real manual seed: `lane3_live_race_mid.mss` frame `0` samples as `BG1 + BG2 + OBJ`, `BG1` stays scroll-stable, `BG2` changes per scanline, and the active `01:9111 -> 01:9185 -> 02:9165` path already matches that read via the `HDMA7` / `BG2VOFS` corridor. A new producer-path note now pushes that same seed into the visible split itself: `live_race_mid` repeatedly rewrites `$22/$23`, `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`, `TMAIN` briefly enables `BG3` at scanline `23`, and the strongest current producer cluster is now narrowed inside `L01318D` around `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`. The new static role split now sharpens that cluster: `02:B042` is a variant-word load, `02:B05D / 02:B0B1 / 02:B0BD` are setup/math, `02:B134` is the strongest generic `L012BE2` submit point, and a nearby alternate submit path exists at `02:B101 -> L012D5A`. A direct slot-`#2` recheck now closes the preserved extra seed as `00:8029/00:835F/00:8029` with visible `BG3` only at frame `0`, so it is a boundary/control seed rather than a second gameplay replicate. A new lab-backend boundary note now further closes `live_race_plus30f`: its absolute start frame is `17495`, which demotes the `plus30f` timing label to a historical name only, and current `labRunner` export attempts still fail during frame-boundary correction on that seed. A new human-support note now also makes the practical re-entry path explicit (`A` / first-option through menus, `B` backs out; in gameplay `A` accelerates, `B` decelerates, d-pad steers), confirms `slot2_extra` still looks like intro/credits, and extends `live_race_mid` visually through the checkpoint/post-stop sequence plus the late police/third-radar-marker event. That continuity is now backed by a preserved `43.86s` local video plus extracted stills for the opening live-race frame, curved/open-road continuity, checkpoint `STOP` sign, gas-station/post exterior, the black transition/fade, and a late resumed-driving frame with the extra colored radar marker. Lane 3 is therefore no longer blocked on “find any producer path”; it is blocked on exact emitter semantics inside that narrowed cluster plus a practical human-visual/export workflow while the backend replicate path remains unstable. |
| Lane 4: Bank API contracts (30/10/11) | queued | baseline hypotheses documented, contracts not yet proven |

## Lane 3 Live Entry Update (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- New tooling:
  - `tools/run_lane3_gameplay_entry.py`
  - `tools/search_boot_probe_matches.py`
- Closed practical read:
  - the user-guided `A`-through-menus route is now promoted as a real
    gameplay-entry lane from power-on
  - the launcher fixes the route as:
    - menu pulses:
      `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
    - gameplay-relative zero:
      frame `2050`
- Closed negative result:
  - a `17000`-frame run using that route plus gameplay-only `A` hold stays in
    the live gameplay family but does not recreate the preserved
    `live_race_mid` substate exactly
  - absolute frame `16655` keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
  - the preserved manual seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
  - the exact-field search over `15000..16999` never improves beyond a tied
    `129/228` slot match, so exact savestate recreation is not the right
    success gate for this route
- Practical implication:
  - this route is now the best current base for live gameplay probing,
    gameplay-relative input programs, and later live capture/debug loops
- next leverage should go into selector parameterization
    (cars / tracks / opponent branch), not into forcing one exact match to
    `live_race_mid`

## Lane 3 Gameplay Asset Focus (`2026-03-28`)

- New tooling:
  - `tools/build_gameplay_asset_report.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_race_asset_focus.md`
- New generated artifacts:
  - `tools/out/lane3_live_race_mid_asset_focus.json`
  - `tools/out/lane3_live_race_mid_asset_focus.md`
- Closed practical read:
  - lane 3 now has a gameplay-first asset inventory built from the confirmed
    `live_race_mid` seed instead of only separate layer and producer notes
  - the promoted split is now explicit and traceable:
    - `BG1` = cockpit / dashboard / HUD base
    - `BG2` = road / horizon / world raster
    - `OBJ` = traffic, radar markers, police, and other dynamic actors
    - `BG3` = transient top-strip / split-phase auxiliary layer
  - the report also closes the first behavior-facing watchlist:
    - steering / curvature:
      `$22/$23`, `dp_0020/0022`, `BG2HOFS/BG2VOFS`, `next_irq_ptr`,
      `01:9185 -> 02:9165 -> 02:B18D`, `02:B134`, `02:B101 -> L012D5A`
    - traffic / police / radar:
      `state_11f3`, `oam_0730`, `state_09a2`, `state_09a8`, `dp_0053/0054`,
      later OAM DMA
- Practical implication:
  - gameplay probes can now be widened against named visible buckets instead
    of tracing whole-frame deltas blindly
  - this is the gameplay-side equivalent of the earlier lane-2 asset-first
    gain that helped disambiguate car extraction

## Lane 3 Live Entry Phase Split (`2026-03-28`)

- New tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- New generated artifacts:
  - `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- Closed practical read:
  - the promoted power-on live-entry route now has its first late gameplay
    phase split packaged as self-contained artifacts, not only as raw frame
    dumps
  - both anchors keep the same top-level gameplay callback family:
    `02:9016 / 01:96A0 / 02:8F3C`
  - frame `3250` is still open-road driving, while frame `3550` is already a
    shattered-windshield collision overlay with `Cars Left: 4`
  - the strongest machine read now matches that visual split:
    - `BG2` tilemap stats stay identical across the pair
    - `BG1` tilemap stats change sharply
    - `OBJ` workload also changes sharply
    - `BG2` scroll operands still move, so the road/world layer stays live
      under the later overlay
- Practical implication:
  - lane 3 can now do asset-first phase comparisons from the reproducible
    live-entry route itself, not only from preserved manual seeds
  - the next best gameplay pair is now a checkpoint/post-stop or
    police/radar-oriented phase, not another blind whole-frame diff

## Lane 3 Traffic Emergence Pair (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- Updated tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New generated artifacts:
  - `tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
  - `tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
  - `tools/out/lane3_live_entry_brake_probe_v1/td2_boot_probe.json`
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json`
  - `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- Closed practical read:
  - the first bounded post-collision follow-up does **not** yet recover the
    manual checkpoint/post-stop or police/radar flow from the live-entry lane
  - the steering-heavy `wiggle` attempt still crashes early
  - a bounded braking variant delays that failure and promotes a better event
    pair first:
    - frame `3250` keeps the road/signage surface without the red traffic car
    - frame `3400` introduces the red traffic car while preserving the same
      background stack
  - the promoted split is now cleaner than the earlier collision pair:
    - `BG1`, `BG2`, `BG3`, and the sampled `BG2` layer state all stay
      identical
    - only `OBJ` workload changes materially (`37 -> 41` visible sprites,
      `1138 -> 2117` drawn pixels)
  - matching probe rows now also narrow the dynamic side of that event:
    - `state_11f3`: `179 -> 208`
    - `oam_0730`: `4627 -> 4628`
    - `state_09a2`: `43 -> 47`
    - `dp_0053/0054`: `16 -> 224`
    - `dp_0022`: `22 -> 6`
- Practical implication:
  - the best current live-entry target is now traffic emergence as an
    `OBJ`-side event, not more whole-frame collision review
  - bundle builders now also emit designer-facing `PNG` previews beside the
    original `PPM` files, so labeling can happen directly on the promoted
    artifacts

## Lane 3 World-Support Follow-Up (`2026-03-28`)

- Updated tooling:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
  - `port/src/td2_ppu.c`
- Updated generated artifacts:
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- Closed practical read:
  - designer review confirmed the earlier gameplay bundles were already good
    for `BG1` cockpit content and `OBJ` sprites, but still poor for visible
    road/background review
  - the raw renderer bug was real:
    gameplay `BG2` uses `largeTiles = true`, and the older layer renderer was
    still stepping that tilemap as if it were `8x8`
  - the renderer now respects `16x16` tile geometry in both the Python tool
    path and the SDL runtime path
  - even with that fix, gameplay `BG2` remains a static-state approximation
    because one end-frame `ppu_state.json` still does not capture the
    per-scanline presentation shaping the visible world/road plane
  - the promoted answer for human review is now explicit inside each gameplay
    bundle:
    - `world_visible_support.png` for exact screenshot-derived road/background
    - `bg_stack_visible_support.png` for exact screenshot-derived background
      stack without `OBJ`
    - `bg2.png` retained as the corrected state/VRAM-facing render
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_gameplay_frame_bundle.py tools/build_gameplay_bundle_compare.py`
  - `make -C port`
  - rebuild of the promoted `3250/3550` and `3250/3400` gameplay bundles
  - rebuild of the associated compare reports
- Practical implication:
  - the designer-facing gameplay packs are now useful for road/background
    labeling without hiding the remaining raster limitation
  - lane 3 can now continue with `OBJ` ownership on the traffic pair while
    deferring scanline-aware world reconstruction until it is actually needed

## Lane 3 Native Visible-Layer Extraction (`2026-03-28`)

- Updated tooling:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/build_gameplay_frame_bundle.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- New generated artifacts:
  - `tools/out/mesen_lane3_live_race_mid_native/`
  - `tools/out/lane3_live_race_mid_native_bundle/`
- Closed practical read:
  - the gameplay-native blocker is now narrowed materially
  - `mesen_ppu_extract` can load a preserved savestate directly via
    `--load-state` and treat `--frame` as a relative offset via
    `--frame-is-offset`
  - on the promoted `lane3_live_race_mid.mss` seed, the native extractor now
    provides exact separable gameplay surfaces that were previously missing
    from the bundle pipeline:
    - `bg2_visible` closes the road/pista layer
    - `bg3_visible` closes the scenery/horizon layer
    - `sprites_screen` closes the dynamic actor/traffic/police side
  - the remaining boundary is no longer “BG2/BG3 are absent”; it is the final
    composed export:
    `main_visible` and `sub_visible` are still black on this gameplay seed
- Practical implication:
  - gameplay review can now prefer savestate-backed native visible layers
    instead of leaning on screenshot-derived world-support surfaces whenever a
    preserved seed exists
  - `build_gameplay_frame_bundle.py --native-frame-dir ...` now promotes those
    native visible layers into the same gameplay bundle as the older
    state-facing renders

## Docs Wiki And SDL Smoke (`2026-03-28`)

- New tooling:
  - `tools/build_docs_wiki_report.py`
- New curation manifest:
  - `rom_analysis/docs/wiki_doc_index.json`
- New note:
  - `rom_analysis/docs/port_sdl_runtime_mimetization_smoke.md`
- New generated HTML artifact:
  - `tools/out/docs_wiki/index.html`
- Closed practical read:
  - the repo now has a simple wiki-style HTML surface that indexes the current
    markdown corpus by scene family instead of one flat list
  - the top-level split is now explicit:
    - `Source Of Truth`
    - `Attract And Intro`
    - `Front-End And Menu`
    - `Gameplay And Lane 3`
    - `Runtime And Port Validation`
  - this is the promoted answer to the current “do not pollute gameplay with
    menu/front-end material” requirement
  - from this checkpoint forward, relevant doc/artifact changes are expected
    to refresh the wiki through the promoted tooling path:
    `make -C tools docs-wiki`
- Validation:
  - `python3 -m py_compile tools/build_docs_wiki_report.py`
  - `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki`
  - local HTML link check over the generated site: `0` missing links
  - `make -C port`
  - `./port/test_regression.sh`
- Follow-up fix:
  - the wiki renderer now parses pipe-table separator rows correctly, so docs
    with Markdown tables no longer fall back to raw `| ... |` paragraph text
  - the wiki theme now also keeps code blocks and inline code on a white,
    high-contrast surface instead of the earlier dark code panel, which was
    making some generated pages hard to read
  - the wiki now also surfaces a per-document `Last updated` label on both
    index cards and rendered pages, sourced from the underlying Markdown
    file timestamp so recent updates are visible in the HTML surface itself
  - the `Attract And Intro` section on the index page now also exposes a
    `Latest` block and sorts its cards by most recent update first, so the
    current intro-facing read is visible without scanning the older notes
  - the index page now also exposes a global `Latest Articles` block with
    explicit `Rendered` and `Raw` links, so the newest docs stay visible at
    the top without hiding the section-level cards underneath
- SDL smoke read:
  - the current runtime renders the bridge-visible intro sequence through
    frame `1000`
  - exact golden parity holds at checkpoints `978`, `982`, `986`, and `990`
  - the first measured gap in that smoke is `mode7_visible_991` with only
    `4` mismatched pixels (`0.006975%`)
  - `mode7_hold_transition` passes seamlessly
- Practical implication:
  - current SDL/runtime parity is already strong enough to use as a real
    intro/front-end mimic and regression surface
  - gameplay parity is still not claimed by this smoke; the gameplay lane
    remains probe/capture-driven

## Lane 1 `B1F9` Stall Update (`2026-03-28`)

- New tooling:
  - `tools/build_b1f9_stage_report.py`
- New note:
  - `rom_analysis/docs/bank30_b1f9_forced_lane_stall.md`
- New generated artifacts:
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md`
- Closed practical read:
  - the forced `01:9568` / `01:95AD` lanes still reach `01:B1F9` once at
    frame `1201`, but all `L001210` hits in those same scenarios occur before
    that entry
  - post-entry `L001210` hit count is `0` in both forced lanes
  - `B1F9` stage counters also stay flat in both forced lanes:
    - `B226 = 0`
    - `B256 = 0`
    - `B273 = 0`
    - `B59B = 0`
  - both lanes stay pinned through frame `2199` with:
    - `state_1D10 = 0x4100`
    - `state_09A8 = 2`
    - `state_0960 = 0`
    - lane-specific `active_main = 01:9568 / 01:95AD`
  - static `bank1.asm` cross-check now closes why this matters:
    - the unresolved `EE7F`-relevant dynamic index select lives only in the
      `L00B1F9` prologue before the first `L00A9A0` call
    - the later `L00B6A3/L00B6E3` surface is a separate worker loop, not a
      second table-select/decompress phase
- Practical implication:
  - direct headless `B1F9` forcing is now a low-yield lane for `EE7F`
  - the active unresolved queue remains `EE7F` / `DA96`, but the next useful
    proving move should come from a real menu/live path or a different caller
    family, not more widening of the same forced lane

## Execution Reset (2026-03-19)

- The port plan now treats maintainability cleanup as a first-class execution
  track alongside the active archaeology lanes.
- The first cleanup slice is repo hygiene and portability:
  - fix ignore policy
  - untrack generated `mesen_ppu_extract` build output
  - untrack mutable `.mesen-config/Mesen2/LuaScriptData` output
  - remove hard-coded personal Mesen paths from promoted scripts and Makefiles
- The autonomous checkpoint loop is now stricter:
  - only ask the user for next-action guidance on urgent or extreme problems
  - otherwise close substantive work through validation, docs, commit/push,
    and a published dev.to update
- The first renderer-correctness cleanup checkpoint now exists:
  - the mirrored non-square OBJ regression is covered by a generated 16x32
    vertical-flip fixture that validates Python simple, Python `mode7-ppu`,
    and SDL runtime paths against one golden PPM
- Repo garbage cleanup is now an explicit maintained tool target instead of an
  ad hoc manual sweep.
- This refocus does not replace the lane order; it is intended to unblock the
  current intro/bootstrap push and make later port work less fragile.

## Completed Checkpoints

### CP-12: Experimental Mesen lab backend MVP pass

- Added an off-plan backend runner in the local `Mesen2` tree:
  - `UI/Utilities/LabRunner.cs`
- Added repo-side launcher:
  - `validation/run_mesen_lab_backend.sh`
- Added architecture note:
  - `rom_analysis/docs/mesen_instrumented_backend_architecture.md`

Current state:

- source-mapped architecture and CLI plan are documented
- the first SNES-only vertical slice exists in code
- savestate probing verifies `.mesen-config/Mesen2/SaveStates/game_11.mss`
  starts at frame `18030`
- the first exact-range runtime test exposed a real frame-boundary mismatch in
  the debugger-stepping contract (`expected 18031, got 18030`)
- the follow-up stepping correction is implemented in source but not yet
  revalidated end-to-end in this repo turn due local build instability/noise in
  the `Mesen2` incremental compile path

### CP-01: Bank30 decode support baseline

- Added `67FB` decode support in `tools/decompress_td2_chunk.py`.
- Added candidate validation tool:
  - `tools/validate_td2_chunks.py`
- Evidence:
  - `tools/out/bank30_chunk_validation.json`
  - `rom_analysis/docs/bank30_decompression_report.md`

### CP-02: Runtime dispatcher trace for `L001210`

- Added trace path in `validation/mesen_probe_boot.lua` for entry-time
  `$0C/$0E/$10` capture.
- Added summarizer:
  - `tools/summarize_l001210_trace.py`
- Evidence:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/td2_boot_probe_l001210_summary.json`

### CP-03: Consolidated unresolved queue registry

- Added registry builder:
  - `tools/build_bank30_chunk_registry.py`
- Added make targets in `tools/Makefile`:
  - `bank30-headers`, `bank30-validate`, `l001210-probe`,
    `l001210-probe-matrix`, `l001210-trace-summary`, `bank30-registry`
- Evidence:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`

Current active unresolved queue (from registry):

- `P0`: `1E:EE7F` (`26FB`, table-confirmed unseen at runtime)
- `P1`: `1E:DA96` (`67FB`, overlap-window unseen at runtime)

Closed non-runtime candidates (from the tightened registry):

- `done`: `1E:E91F` (`67FB`, nested-invalid-marker inside successful `1E:DA96/1E:E800` windows)
- `done`: `1E:9681` (`42FB`, sentinel-control zero-output record)

### CP-04: Design-team asset handoff proof

- Added design-pack tools:
  - `tools/build_mesen_design_pack.py`
  - `tools/build_mesen_design_pack_range.py`
- Proof bundles created:
  - `port/assets/test_dump_frame300`
  - `port/assets/test_dump_range_1086_1093`
- Workbench doc:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

### CP-06: Validation gates and state contracts

- Added pixel-gate runner:
  - `tools/check_regression_gates.py`
- Added callback contract runner:
  - `tools/validate_callback_contracts.py`
- Added contracts:
  - `validation/regression_gates_intro.jsonc`
  - `rom_analysis/docs/callback_state_contracts.jsonc`
- Added gate usage doc:
  - `rom_analysis/docs/validation_gates.md`

### CP-05: Deterministic `L001210` probe matrix harness

- Extended boot probe input controls:
  - `TD2_BOOT_PROBE_INPUT_END_FRAME`
  - `TD2_BOOT_PROBE_INPUT_WINDOWS` (`start-end:buttons;frame:buttons`)
- Added scenario runner:
  - `tools/run_l001210_probe_matrix.py`
- Added make target:
  - `make -C tools l001210-probe-matrix`
- Evidence:
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.md`

Matrix v1 outcome (`1500` frames, `4` scenarios):

- no `1E:E91F` hits
- no `1E:EE7F` hits
- no `1E:DA96` hits
- no `1E:9681` hits
- `1E:DF6C/E039/E73F/E800` still appear in the expected attract-window runs
- periodic `start` pulses can suppress bank30 usage entirely for that window (`0` bank30 hits)

### CP-07: First tilemap-to-ROM provenance window (`1086..1093`)

- Added provenance builder:
  - `tools/build_tilemap_chunk_provenance.py`
- Added bank-13 validation lane for runtime source enrichment:
  - `tools/out/bank13_headers.json`
  - `tools/out/bank13_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` is the active main-screen tile layer for all frames `1086..1093`.
- `chrBaseWords = 0x2000`.
- Runtime chunk anchor: `0D:C4DC` (`26FB`, decoded size `4000` bytes).
- Evidence confidence by frame:
  - `1088`: direct runtime hit
  - `1089..1093`: carry-over from the same hit
  - `1086..1087`: nearest-forward assignment to frame `1088` (lower confidence)

### CP-08: Extended `L001210` unresolved-candidate sweep (`matrix v3`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - added per-hit selectors: `$1C78`, `$1C80`, `$1CA8`, `$1CAC`, `$1CAE`
- Ran custom matrix v3:
  - `tools/out/l001210_probe_matrix_v3_scenarios.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.md`

Matrix v3 outcome (`7` scenarios, `45000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- confirmed bank30 sources only:
  - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800` (`7` hits each aggregate)
- strongest positive scenario:
  - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
- strongest suppression scenario:
  - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits

### CP-09: Timed pulse sweep for attract-transition windows (`matrix v5`)

- Ran timed pulse matrix:
  - `tools/out/l001210_probe_matrix_v5_scenarios.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.md`
- Scenario set (`12` runs, `4000` frames each):
  - `start` pulse at frames `240/600/900/1200/1500/1800/2100/2400`
  - `start,b` pulse at frames `1200/1500/1800/2100`

Matrix v5 outcome (`48000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- strongest positive scenarios:
  - `pulse_start_240` and `pulse_start_600`: `36` total hits, `8` bank30 hits
- strongest suppression scenarios:
  - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
- `start,b` single-frame pulses mirrored `start`-only outcomes at matching frames.
- caller coverage remained limited to:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - no hits observed from `01:B256`, `01:B273`, `01:B59B`

### CP-10: `L00A9*` index telemetry on `L001210` caller sites (`matrix v6`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - per-hit caller CPU regs (`A/X/Y/PC/SP/PS/D/DBR/K`)
  - derived `L00A9A0/L00A9CB` table index + expected source pointer
  - per-hit `caller_l00a9_source_matches`
- Ran compact verification matrix:
  - `tools/out/l001210_probe_matrix_v6_scenarios.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.md`

Matrix v6 outcome (`3` scenarios, `12000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- `L00A9` source derivation consistency:
  - `58/58` `L00A9A0/L00A9CB` hits had `caller_l00a9_source_matches = true`
- observed `L00A9*` indices:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- observed bank30-producing indices:
  - `28` and `29` only (both `L00A9A0` and `L00A9CB`)
- no observed index `32` (`0x20`, `1E:EE7F`)

### CP-11: Forced `L00B1F9` selector branch tests (`matrix v7`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - frame-window selector forcing:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_1C78`
    - `TD2_BOOT_PROBE_FORCE_1C80`
    - `TD2_BOOT_PROBE_FORCE_1CA8`
    - `TD2_BOOT_PROBE_FORCE_1CAC`
    - `TD2_BOOT_PROBE_FORCE_1CAE`
  - optional exec-point re-apply at dynamic index path:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1`
- Extended matrix runner scenario env support:
  - `tools/run_l001210_probe_matrix.py` now accepts `extra_env` per scenario
- Ran forced matrix:
  - `tools/out/l001210_probe_matrix_v7_force_index32_scenarios.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.md`

Matrix v7 outcome (`5` scenarios, `20000` total frames):

- forced selector state confirmed on bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- observed `L00A9*` indices unchanged:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- no observed index `32` (`0x20`, `EE7F`) despite forced branch condition
- caller coverage still excludes:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-12: Caller-family activation around the `01:BE43` window (`matrix v10a/v10b`)

- Ran directional-hold matrix:
  - `tools/out/l001210_probe_matrix_v10a_be43_directional_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.md`
- Ran button-map pulse matrix:
  - `tools/out/l001210_probe_matrix_v10b_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.md`

Matrix v10 outcome (`16` scenarios, `117000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- caller-family expansion reached non-`L00A9*` callsites:
  - `01:8E3C`, `01:8E59`
- observed `L00A9*` index set expanded to include:
  - `7`, `8`, `9`, `10`, `11`, `22`, `25`
- bank30-producing indices remained:
  - `28` and `29` only
- target caller set remained unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-13: Extended `01:9016` sequence stress (`matrix v11/v11b`)

- Ran pulse-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.md`
- Ran hold-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11b_9016_holds_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.md`

Matrix v11 outcome (`16` scenarios, `200000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- per-scenario bank30 profile remained fixed:
  - `12` bank30 hits per scenario (`DF6C/E039/E73F/E800`, `3` each)
- bank30 selector tuple remained stable across all bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` hits)
- target caller set still unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-14: `L00B1F9` precondition forcing audit (`matrix v12/v12b`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - additional forced-state knobs:
    - `TD2_BOOT_PROBE_FORCE_1C86`
    - `TD2_BOOT_PROBE_FORCE_1D10`
  - explicit `01:B1F9` exec telemetry:
    - `b1f9_exec_count`
    - `b1f9_exec_frames`
  - per-hit trace additions:
    - `selector_1c86`
    - `state_1d10`
- Ran precondition matrix:
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.md`
- Ran explicit `B1F9` exec-check matrix:
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.md`

Matrix v12/v12b outcome (`8` scenarios, `72000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- no caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`
- `B1F9` execution remained absent in this lane:
  - `b1f9_exec_count = 0` in all `v12b` scenarios
- forcing selector/precondition state changed captured state as intended but did not
  alter runtime caller-family coverage.

### CP-15: Forced callback activation into `01:9568/01:95AD` (`matrix v13`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - main-callback forcing window:
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK`
- Extended matrix runner env cleanup support:
  - `tools/run_l001210_probe_matrix.py` now clears the callback-forcing env keys
    between scenarios.
- Ran callback activation matrix:
  - `tools/out/l001210_probe_matrix_v13_callback_activation_scenarios.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.md`

Matrix v13 outcome (`5` scenarios, `16000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback-only scenarios (`01:9568`/`01:95AD`) reduced total trace activity:
  - `6` total hits each, `0` bank30 hits each
- callback + state-forced scenarios reached `B1F9` once:
  - `b1f9_exec_count = 1` at frame `1201` (`01:9568` and `01:95AD` variants)
- despite a `B1F9` entry, no `L001210` calls were observed from:
  - `01:B256`, `01:B273`, `01:B59B`
- combined `v13` caller coverage remained:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`

### CP-16: `B1F9` internal stage telemetry (`matrix v14`)

- Extended probe telemetry in `validation/mesen_probe_boot.lua`:
  - top-level `B1F9` stage counters:
    - `b1f9_stage_counts` (`b226`, `b256`, `b273`, `b59b`)
    - `b1f9_stage_frames`
  - stage exec callbacks:
    - `01:B226`
    - `01:B256`
    - `01:B273`
    - `01:B59B`
- Ran stage-trace matrix:
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_scenarios.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.md`

Matrix v14 outcome (`3` scenarios, `6600` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback+state scenarios still showed:
  - `b1f9_exec_count = 1`
- but `B1F9` internal stage counters remained zero:
  - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
- no `L001210` caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-17: `B1F9` prologue exec-point trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_EXEC_POINTS`
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS`
  - top-level `exec_point_trace` bundle in `td2_boot_probe.json`
- Ran targeted forced-callback probes with explicit watchpoints:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`
- Watch list:
  - `00:050F`
  - `00:083F`
  - `01:B1F9`
  - `01:B202`
  - `01:B206`
  - `01:B226`
  - `01:B256`
  - `01:B273`
  - `01:B59B`

Exec-trace outcome (`2` scenarios, `2200` frames each):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- headless exec-point trace recorded only the entry point:
  - `01:B1F9`
- no exec hits were observed at:
  - `00:050F`, `00:083F`
  - `01:B202`, `01:B206`
  - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
- shared `B1F9` entry snapshot across both lanes:
  - `$1C80/$1CA8 = 0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
  - `$0960 = 0`
- lane-specific difference at entry:
  - forced `01:9568` shows `$0F77 = 1`
  - forced `01:95AD` shows `$0F77 = 0`
- note:
  - this first prologue bundle was captured before exec-point traces honored
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`; the
    corrected late-window read is recorded in `CP-20`
- practical reading:
  - the headless runner now proves the `B1F9` entry context, but still does not
    expose post-entry helper/return flow through pure exec watchpoints.

### CP-18: `B1F9` prologue side-effect trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_WRITE_POINTS`
  - `TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS`
  - top-level `write_point_trace` bundle in `td2_boot_probe.json`
- Ran bounded forced-callback write-trace probes:
  - `tools/out/b1f9_sideeffect_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_sideeffect_trace_95ad/td2_boot_probe.json`
- Traced write points:
  - `00:420C` (`HDMAEN`)
  - `00:2106` (`MOSAIC`)
  - `00:2105` (`BGMODE`)
  - `00:2107/2108/2109` (`BG1SC/BG2SC/BG3SC`)
  - `00:210B` (`BG12NBA`)
  - `00:2101` (`OBJSEL`)
  - `00:212C` (`TMAIN`)
  - `00:2131/2130` (`CGADSUB/CGWSEL`)
  - `00:212E/212D/212F` (`TMW/TSUB/TSW`)
  - `00:2123/2124/2125` (`W12SEL/W34SEL/WOBJSEL`)
  - `7E:0966`
  - `7E:0968`
  - `7E:0974`
  - `00:0F42`

Write-trace outcome (`2` scenarios, `2200` frames each, trace window `1200..1202`):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- both lanes recorded:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- no traced writes were observed for:
  - `L0004DF`-style side effects (`HDMAEN`, `$0966/$0968`)
  - `L00050F/L00052E` reset writes (`$0974`, `CGADSUB/CGWSEL/TMW/TSUB/TSW`, window registers, `MOSAIC`, `SETINI`)
  - `L00083F` setup writes (`BGMODE`, `BG1SC/BG2SC/BG3SC`, `BG12NBA`, `$0F42`)
  - immediate `B1F9` setup writes (`TMAIN`, `OBJSEL`)
- practical reading:
  - in the headless forced lane, the observed `01:B1F9` entry still does not
    produce any of the expected helper/setup side effects in the surrounding
    frame window.

### CP-19: `B1F9` caller stack proof

- Extended exec-point payload in `validation/mesen_probe_boot.lua`:
  - `stack_addr`
  - `stack_bytes`
  - `stack_return_minus_one`
  - `stack_return_rts`
- Re-ran narrow forced-callback entry probes for `01:B1F9`.
- Evidence:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`

Stack outcome:

- forced `01:9568` lane:
  - `stack_return_rts = 0x9575`
  - this matches the post-`jsr L00B1F9` site at `L009575`
- forced `01:95AD` lane:
  - `stack_return_rts = 0x95B7`
  - this matches the post-`jsr L00B1F9` site immediately after the `L0095AD`
    call sequence
- deeper stack word on both lanes:
  - `0x82A0` (`+1 -> 0x82A1`)
  - this matches the bank-0 main-callback dispatcher wrapper that pushes a
    synthetic return before `jmp [$0038]`
- practical reading:
  - the forced entry is a real bank-1 `jsr` into `L00B1F9`, not an artifact of
    the callback pointer override alone
  - the call chain shape is now also consistent with normal NMI callback
    dispatch:
    - bank 0 dispatcher -> `01:9568/01:95AD` -> `01:B1F9`
- the unresolved problem is now narrower:
  - why the real `jsr` path in the headless forced lane still shows no
    downstream helper/setup exec hits or writes

### CP-20: `B1F9` return-window correction and caller-side `1CA8` increment

- Fixed probe behavior in `validation/mesen_probe_boot.lua`:
  - exec-point callbacks now honor
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`
- Updated validation note in `validation/README.md`.
- Ran a corrected late-window forced-callback probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_return_trace_9568/td2_boot_probe.json`

Corrected late-window outcome (`2200` frames, trace window `1200..1202`):

- observed exec points:
  - `00:82A1` at frame `1200`
  - `01:B1F9` at frame `1201`
- no exec hit was observed at:
  - `01:9575`
- frame snapshots for `1200..1201` still show the forced pre-call state:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
- but the corrected `01:B1F9` exec snapshot records:
  - `$1CA8 = 3`
  - `stack_return_rts = 0x9575`
- static caller read now explains that delta:
  - `L009568` does `inc $1CA8` before `jsr L00B1F9`
  - `L0095AD` does the same
- static `L00B1F9` read also explains why an immediate `01:9575` hit is not the
  best next proving surface:
  - after entry/setup, the routine can run long internal wait loops at
    `L00B638` / `L00B6E3` before it reaches `L00B755` and returns to the caller
- practical reading:
  - the old “entry sees `$1CA8 = 2`” interpretation was too literal; the forced
    frame state is `2`, but both known callers increment it before the `jsr`
  - the missing immediate `01:9575` hit no longer points to a broken call chain;
    it is consistent with `L00B1F9` doing longer in-routine work before return
  - the next low-thrash lane should target the `L00B638` / `L00B6E3` wait/exit
    conditions or use manual debugger confirmation, not more immediate-return
    watchpoints

### CP-21: Per-point-capped `B1F9` wait/exit surface check

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT`
- Added the same env cleanup to `tools/run_l001210_probe_matrix.py`.
- Updated validation note in `validation/README.md`.
- Ran a widened forced-callback wait/exit probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_surface_9568/td2_boot_probe.json`

Wait/exit outcome (`2200` frames, trace window `1200..1800`):

- watch list:
  - `01:B1F9`
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- trace budget:
  - `exec_point_max_hits = 16`
  - `exec_point_max_hits_per_point = 1`
- observed exec hits:
  - `01:B1F9` once at frame `1201`
- no exec hits were observed at:
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- the per-point cap did not hide later hits:
  - `exec_point_trace.dropped_hits = 0`
- practical reading:
  - removing repeat-budget pressure still does not expose any downstream
    `L00B1F9` progress in the headless exec surface
  - this is a stronger negative than the earlier immediate-return probe because
    the window is wide and the trace no longer risks being flooded by loop hits
  - the next useful proving lane should move away from headless exec
    watchpoints and toward manual debugger confirmation or a different state/write
    instrumentation surface around the `L00B638` / `L00B6E3` wait conditions

### CP-22: `B1F9` wait-path WRAM write surface check

- Ran a widened forced-callback WRAM write trace for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_wram_9568/td2_boot_probe.json`

Write-surface outcome (`2200` frames, trace window `1200..1800`):

- watched state writes:
  - `7E:0960`
  - `7E:0964`
  - `7E:0200`
  - `7E:0202`
  - `7E:1E2C`
  - `7E:0440`
  - `7E:0442`
  - `7E:0444`
  - `7E:040A`
- observed write hits:
  - none
- trace result:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- nearby frame snapshots (`1200..1210`) remain flat at:
  - `$0960 = 0`
  - `$0200 = 0`
  - `$0202 = 1`
  - `$1E2C = 0`
  - `$0440/$0442/$0444 = 0/0/0`
  - `$040A = 0x0011`
- practical reading:
  - even a different headless state/write surface around the expected
    `L00B638` / `L00B6E3` wait-path state does not reveal progress beyond the
    known `01:B1F9` entry
  - this is enough evidence to treat the current headless `B1F9` lane as
    low-yield; the remaining useful follow-up is manual debugger work or a shift
    to the next unblocked roadmap lane

### CP-23: Second contiguous tilemap provenance window (`1094..1101`)

- Built a second design-pack range:
  - `tools/out/design_mesen_range_1094_1101_v1/design_pack_range.json`
- Added bank-7 chunk validation metadata:
  - `tools/out/bank7_compression_headers.json`
  - `tools/out/bank7_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1094..1101`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance advances across the same visible tilemap block:
  - `1094..1095`: carry-over from `0D:C4DC` (`26FB`, bank 13) hit at frame `1088`
  - `1096`: direct runtime hit at `07:BF49` (`42FB`, bank 7)
  - `1097..1100`: carry-over from `07:BF49`
  - `1101`: direct runtime hit at `07:C112` (`26FB`, bank 7)
- Validation metadata now exists for all three anchors:
  - `0D:C4DC`: `output_size = 4000`
  - `07:BF49`: `output_size = 4102`
  - `07:C112`: `output_size = 2832`
- runtime-binding note:
  - this window uses the preserved
    `tools/out/l001210_probe_matrix_v1/periodic_start_pulses_240_1800_l001210_exec.json`
    trace because the original ad hoc `.mesen` runtime trace was overwritten
    later; the preserved trace matches the contiguous `1088/1096/1101` hit
    sequence used for this late-attract block
- practical reading:
  - the visible `bg1` tilemap stays constant while the backing runtime chunk
    source changes underneath it
  - the next useful Lane 2 step is to capture and bind the next contiguous block
    after `1101`, not to keep reworking `1086..1101`

### CP-24: Carry-covered continuation of the late-attract tilemap window (`1102..1117`)

- Built two follow-on design-pack ranges:
  - `tools/out/design_mesen_range_1102_1109_v1/design_pack_range.json`
  - `tools/out/design_mesen_range_1110_1117_v1/design_pack_range.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.md`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`
- Extended the memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1102..1117`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance stays on the same validated bank-7 source for the full carry-covered block:
  - `1102..1109`: `07:C112` (`26FB`, bank 7), `frame_delta = 1..8`
  - `1110..1117`: `07:C112` (`26FB`, bank 7), `frame_delta = 9..16`
- Validation metadata remains stable for the carry source:
  - `07:C112`: `output_size = 2832`, `consumed_bytes = 2333`
- practical reading:
  - contiguous late-attract tilemap provenance now covers `1086..1117`
  - `1117` is the current headless confidence edge because it exactly exhausts
    the current carry window from the direct `1101` hit, and the preserved
    `periodic_start_pulses_240_1800` trace has no later direct hit after `1101`
  - a scripted-input attempt to open the later direct-hit cluster
    (`6800:start;6900-6920:start,a` -> `7051/7059/7064`) was tried three ways in
    the extractor bridge and failed on the same boundary: once
    `InitializeDebugger` + input overrides were enabled, the Mesen bridge did
    not advance frames
  - per the blocker policy, that extractor lane is now documented and parked;
    the next useful move is either a different bridge surface for a later direct
    runtime hit or a pivot to the next roadmap lane

### CP-25: First deterministic gameplay-seed window (`track1`, frames `86..93`)

- Verified an existing deterministic seed savestate:
  - `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Revalidated the screenshot harness against that seed:
  - `validation/mesen_capture.lua` captures `300` frames after `60` warm-up
    frames with `b` held
  - the first nontrivial screenshot appears at capture index `26`
    (script frame `86`)
- Added a seeded gameplay-range dump lane in `validation/mesen_dump_bg_range.lua`:
  - the dumper now accepts the same simple fixed input window controls used by
    the other validation harnesses
- Captured the first raw gameplay-seed window:
  - `tools/out/track1_seed_0086_0093_v2.json`
  - `tools/out/track1_seed_0086_0093_v2_sequence.txt`
  - `tools/out/track1_seed_0086_0093_v2_sequence.json`
- Added a committed window note:
  - `rom_analysis/maps/tracks/track1_seed_0086_0093.md`

Window reading:

- The flat dump covers frames `86..93` from the seeded run with `b` held during
  script frames `60..359`.
- Frame `86` renders back from `VRAM + CGRAM + PPU state + OAM` with `0`
  mismatched pixels against the screenshot harness image
  `td2_track1_accel_frame_00026.png`.
- Render-side reading for the captured seed window:
  - `bgMode = 1`
  - `mainScreenLayers = 0x04`
- The captured scene is static across the full `86..93` window:
  - `VRAM` diff `0`
  - `CGRAM` diff `0`
  - `OAM` diff `0`
  - rendered BG output unchanged between frames `86` and `93`
- Probe-side callback/state context over the same seeded input window remains
  trivial:
  - `active_main = 00:8029`
  - `active_nmi = 00:8029`
  - tracked `$0202/$0204/$0206/$0208/$020A/$040A/$0054` all stay `0`
- practical reading:
  - `game_11.mss` is a valid deterministic seed for track-start visuals
  - this specific raw `86..93` window is still static under the original
    `b`-hold path
  - the next gameplay follow-up should be a seeded button sweep or a different
    savestate nearer active driving

### CP-26: Seeded gameplay sweep and early raw-bridge blocker (`track1`)

- Extended the gameplay capture path for automation:
  - `validation/mesen_capture.lua` now accepts env-driven capture controls and
    multi-window inputs
  - `validation/mesen_dump_bg_range.lua` now accepts
    `TD2_BG_RANGE_INPUT_WINDOWS`
  - `validation/run_mesen_capture.sh` now creates parent directories for
    capture/bg-range output prefixes
- Added a bounded gameplay sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `make -C tools track1-seed-sweep`
- Added the sweep note:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v1.md`
- Sweep artifacts:
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`

Sweep reading:

- `b_hold` (`60-359:b`) is dynamic:
  - first nontrivial frame `76`
  - first later motion `92`
  - `4` distinct screenshot hashes
- `start_then_b_hold` (`60:start;61-359:b`) remains a static seed:
  - first nontrivial frame `64`
  - no later motion in the bounded `300`-frame run
- `start_then_a_hold` (`60:start;61-359:a`) is also dynamic:
  - first nontrivial frame `61`
  - first later motion `65`
  - `3` distinct screenshot hashes

Targeted raw follow-up:

- Captured the earliest dynamic raw window for `start_then_a_hold`:
  - `tools/out/track1_start_then_a_0061_0068_v1.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.txt`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_delta_61_65.json`
- Added a screenshot probe of the exact same dumper lane:
  - `tools/out/track1_start_then_a_frame61_probe_v1_frame_00061_frame.png`

Blocker reading:

- the moving-window blocker has changed:
  - movement is now proven at the screenshot level from `game_11.mss`
  - but the early `start_then_a_hold` raw bridge does not align with that
    screenshot sweep
- three narrowing attempts all held the same boundary:
  - raw frame `61` renders as `bgMode = 0`, `mainScreenLayers = 0x00`
  - the dumper screenshot differs from the sweep screenshot for frame `61` by
    `51503` pixels
  - that mismatch stays flat across nearby sweep frames `60..70`
  - raw `VRAM/CGRAM/OAM/PPU` state stays unchanged from frames `61` to `65`
- per the blocker policy, that exact early raw-bridge lane is now documented and
  parked
- next useful gameplay follow-up:
  - use the new screenshot-backed `b_hold` cycle as the next binding target, or
  - replace `game_11.mss` with a later gameplay savestate whose raw dump aligns
    cleanly

### CP-27: Screenshot-backed `b_hold` gameplay cycle (`track1`, frames `76..156`)

- Added a capture-log sequence builder:
  - `tools/build_capture_sequence_manifest.py`
  - `make -C tools track1-b-hold-cycle`
- Added the committed gameplay-cycle note:
  - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
- Refreshed the sweep source behind that cycle:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
- Built screenshot-backed runtime artifacts:
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`

Cycle reading:

- the selected `b_hold` window covers script frames `76..155`
- collapsed runtime artifact:
  - `5` image entries
  - `4` distinct screenshot states
  - `16` frames per state
- transition frames:
  - `76`, `92`, `108`, `124`, `140`
- cadence read:
  - frame `140` reuses the frame-`76` image
  - the visible track-start motion therefore closes one screenshot-backed
    `64`-frame cycle
- context binding note:
  - the first state still covers the known screenshot-validated frame `86` from
    `track1_seed_0086_0093.md`
  - the screenshot transition at frame `92` is now the next unbound
    `VRAM/CGRAM/OAM/PPU` / probe edge
- initial gameplay contract pointers now referenced in the cycle note:
  - bank 10 external entries from `rom_analysis/code/physics.asm`
  - bank 11 render/IRQ anchors from `rom_analysis/code/render.asm`
- practical reading:
  - gameplay archaeology now has a reusable moving reference artifact even
    while the early raw-bridge mismatch remains parked
  - the next best Lane 3 step is to bind one later cycle state (`92` or `108`)
    back to raw/probe context, or switch to a later gameplay savestate if the
    current seed keeps diverging there

### CP-28: `game_11.mss` screenshot-vs-raw blocker narrowed at `92/108`

- Refreshed the gameplay sweep on the current harness:
  - `tools/out/track1_seed_sweep_v2_current/summary.json`
  - `tools/out/track1_seed_sweep_v2_current/summary.md`
- Archived the seeded probe follow-up:
  - `tools/out/track1_b_hold_probe_0086_0108_v1/td2_boot_probe.json`
- Kept the targeted raw dump artifacts:
  - `tools/out/track1_b_hold_0086_0108_v1.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_86_92.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_92_108.json`

Current reading:

- refreshed sweep status:
  - `b_hold`: dynamic (`first_nontrivial = 76`, `first_motion = 92`)
  - `start_then_b_hold`: `static_after_first_nontrivial` (`64`)
  - `start_then_a_hold`: `static_after_first_nontrivial` (`64`)
- raw/probe follow-up on the same `b_hold` seed lane:
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `86 -> 92`
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `92 -> 108`
  - probe-side callback/state remains flat at `86`, `92`, and `108`:
    - `active_main = active_nmi = 00:8029`
    - tracked `$0200/$0202/$0204/$0206/$0208/$020A/$040A/$0440/$0442/$0444/$1E2C/$0054 = 0`
- failed but informative experiment:
  - a one-off attempt to dump raw state directly from `mesen_capture.lua`
    perturbed the `b_hold` lane into a static post-`86` capture
  - that code path was reverted in the same turn and should not be reused as
    evidence
- practical reading:
  - the blocker is no longer “find a moving gameplay lane”
  - the blocker is now “explain why the screenshot lane moves while raw/probe
    remain static on `game_11.mss`”
  - the next best step is either a later gameplay savestate or deeper debugger
    inspection on this seed

### CP-29: Visible-phase gameplay path bound on `game_11.mss`

- Extended the scanline-step probe so it can load a savestate and replay the
  same seeded input windows used by the gameplay capture harness:
  - `validation/mesen_scanline_step_test.lua`
- Added a repeatable full-sample range runner:
  - `tools/capture_scanline_samples_range.py`
- Captured seeded visible-phase samples for the first `b_hold` cycle states:
  - `tools/out/track1_b_hold_scanline_frame_0086_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v1.json`
- Archived the targeted late-scanline register trace:
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes_summary.json`
- Added the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`

Current reading:

- the screenshot-vs-raw split on `game_11.mss` is now explained as a phase
  split:
  - end-of-frame raw/probe still lands on `00:8029/00:835F` with
    `ppu.mainScreenLayers = 0x04`
  - visible-scanline sampling on frames `86`, `92`, and `108` runs under
    `02:9016` with alternating `01:96A0/01:960D` IRQ behavior and
    `ppu.mainScreenLayers = 0x13/0x17`
- the visible frame also carries real split-style motion that the end-of-frame
  dump misses:
  - `bg2_hscroll` spans `66` values
  - `bg2_vscroll` spans `101` values
  - `bg3_vscroll` toggles between `0x03FF` and `0x0014`
- late-scanline register tracing over frames `86..108` records a stable
  `16`-write pattern every frame:
  - `M7HOFS`, `M7VOFS`, `$210F-$2114`
  - all at scanlines `225..227`
  - no DMA writes, no VRAM writes
- the remaining blocker is now narrower:
  - the sampled visible-phase `PPU`/callback pattern matches across frames
    `86`, `92`, and `108`
  - only `dp_0054` differs (`0x38` at `86`, `0x48` at `92/108`)
  - screenshot transitions at `92` and `108` therefore still need a deeper
    producer-side or sprite/color-math explanation

### CP-30: Bank-1 producer-state follow-up stays flat on the visible gameplay lane

- Extended the scanline-step probe with additional producer-side fields used by
  the bank-1 IRQ path:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v2` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v2.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v2.json`
- Added the bank-1 producer and low-WRAM follow-up to the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`
- Archived start-of-frame WRAM follow-up:
  - `tools/out/track1_b_hold_wram_frame_0086_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0092_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0108_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json`
- Archived negative exec/write trace:
  - `tools/out/track1_b_hold_execwrite_trace_0086_0108_v1/td2_boot_probe.json`

Current reading:

- the added bank-1 producer-side WRAM fields stay identical across frames
  `86`, `92`, and `108`:
  - `$1396`
  - `$13A4/$13A6/$13A8/$13AA/$13AC/$13AE`
  - `$13B4/$13B6/$13BA`
  - `$1CE6/$1CEB/$1CEC`
  - `$1E1C/$1E1E`
  - `$0F3A`
- visible window and OAM summary fields also stay identical across those same
  three frames
- targeted end-of-frame write/exec tracing against `02:9016`, `01:960D`,
  `01:96A0`, and the corresponding bank-1 producer-side WRAM addresses records
  no hits in the traced `86..108` window
- the low-WRAM queue follow-up is also negative:
  - the archived `td2_boot_probe_startframe_wram.bin` dumps keep the sampled
    `0600` region flat across `86`, `92`, and `108`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json` therefore has
    `0` active parsed queue entries for all three frames
- practical reading:
  - even after widening the visible-phase probe to bank-1 producer-side state,
    sampled `dp_0054` remains the only known field that separates frame `86`
    from frames `92/108`
  - the next best Lane 3 target is to bind that sampled `dp_0054` field to its
    real producer/base before spending more time on bank-1 WRAM mirrors

### CP-31: Visible-phase `dp_0054` is a real `7E:0054` WRAM field

- Extended the scanline-step probe with direct-page-base and explicit WRAM
  mirror samples:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v3/v4` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v4.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v4.json`
- Archived the low-page/WRAM write-trace follow-up:
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`

Current reading:

- `v3` rules out a hidden direct-page-base explanation:
  - `cpu.d = 0` on all sampled scanlines for frames `86`, `92`, and `108`
  - the effective direct-page address therefore stays fixed at `0x0054`
- `v4` binds the sampled value to real WRAM during the visible phase:
  - visible `00:0054..0056` matches `7E:0054..0056` exactly
  - frame `86` carries `7E:0054..0056 = 0x38/0x90/0x15`
  - frames `92` and `108` carry `7E:0054..0056 = 0x48/0x90/0x15`
  - only `7E:0054` changes across those three frames
- the end-of-frame write-trace lane remains a negative-but-useful result:
  - tracked writes hit only late `00:0055 = 0x84` and `00:0056 = 0x17`
    once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0054..0056`
  - end-of-frame frame snapshots at `86/92/108` still read `dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the remaining gameplay discriminator is now bound to visible-phase
    `7E:0054`, not an ambiguous low-page alias
  - the next best Lane 3 target is to trace the producer/reset path that takes
    visible-phase `7E:0054` from `0x38 -> 0x48 -> 0x00`

### CP-32: Visible-phase `7E:0053/0054` is a drained queue cursor pair

- Extended the scanline-step probe with explicit queue-cursor and parsed
  `0600` descriptor summary samples:
  - `validation/mesen_scanline_step_test.lua`
- Added a queue-summary helper:
  - `tools/summarize_scanline_dma_queue.py`
- Captured refreshed `v5` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v5.json`
  - `tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json`
- Archived the queue-cursor follow-up trace:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe_trace_summary.json`

Current reading:

- visible-phase `v5` samples now bind the queue cursor pair directly:
  - frame `86`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x38`
  - frames `92` and `108`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x48`
  - all three frames keep `7E:0055/0056 = 0x90/0x15`
- the sampled visible queue window is drained, not growing:
  - `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines for
    frames `86`, `92`, and `108`
  - `queue_dma_nonzero_entry_count = 32`, so the `0600` ring still contains
    stale descriptor content outside the active read/write window
- the end-of-frame cursor trace remains negative-but-useful:
  - tracked writes still hit only late `00:0053 = 0`, `00:0055 = 0x84`, and
    `00:0056 = 0x17` once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0053/0054`
  - end-of-frame snapshots at `86/92/108` still read `dp_0053 = dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the old “mystery `7E:0054`” read is now too vague; the sampled gameplay
    discriminator is the visible-phase queue cursor pair `7E:0053/0054`
  - the next best Lane 3 target is to trace the bank-0 cursor advance/reset
    path that takes visible `0x38/0x38` or `0x48/0x48` back to `0x00/0x00`

### CP-33: Late gameplay cursor reset splits into two sampled phases

- Extended the scanline-step range wrapper with optional exec/write trace-point
  pass-through:
  - `validation/mesen_scanline_step_test.lua`
  - `tools/capture_scanline_samples_range.py`
- Archived the mirrored-bank boot-probe rerun:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
- Captured the widened scanline-local late-phase trace:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`

Current reading:

- the mirrored-bank boot-probe rerun closes one simple ambiguity:
  - tracing `80:01AB/021E/04DF/06ED/0715/0798/1A70`, `81:8A7F`, and
    `82:08B2/09CD` still records `exec_hit_count = 0`
  - the old negative exec result was therefore not just a `00:` vs `80:`
    bank-mirror mistake
- the scanline-local trace adds a new late boundary on frame `86`:
  - `224`-sample trace (`v1`) records no exec or write hits through the visible
    phase
  - `260`-sample trace (`v2`) still records no exec-point hits, but it does
    catch a write trio at frame `87`, scanline `228`:
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
    - `00:0053 = 0x38`
  - at that same late point, `00:0054` still reads `0x38` and
    `active_main = 02:9016`
  - sampled scanlines `223`, `224`, `227`, and `259` all still carry
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- practical reading:
  - the late gameplay reset is now split into at least two sampled phases:
    - an intermediate post-visible stage still under `02:9016` that preserves
      the visible cursor/budget tuple
    - a later end-of-frame stage under `00:8029` that collapses to
      `00:0053/0055/0056 = 0x00/0x84/0x17`
  - the next best Lane 3 target is to extend the scanline-local trace farther
    until that `02:9016 -> 00:8029` handoff is observed directly

### CP-34: Frame-boundary sampling keeps frame `87` on the visible gameplay path

- Extended the scanline-step probe with explicit frame-boundary snapshots:
  - `validation/mesen_scanline_step_test.lua`
- Passed the new `frame_events` payload through the range wrapper:
  - `tools/capture_scanline_samples_range.py`
- Captured the boundary-aware late-phase reruns:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`

Current reading:

- `v3` (`260` samples) now records explicit frame-boundary snapshots:
  - frame `86 start` at scanline `0`
  - frame `86 end` at scanline `225`
  - both still read `active_main = 02:9016` and
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- `v4` (`360` samples) extends past the scanline wrap:
  - frame `87 start` at scanline `0` still reads the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the sampled scanline stream wraps at sample `262`
    (`scanline 261 -> 0`) and still does not leave `02:9016`
  - the last sampled point is frame `87`, scanline `97`, still with
    `02:9016` and `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the only traced late writes in that widened window remain:
  - frame `87`, scanline `228`
  - `00:0053 = 0x38`
  - `00:0055 = 0x90`
  - `00:0056 = 0x15`
- practical reading:
  - the visible gameplay path now survives across frame `86 end`, frame `87`
    start, and at least through frame `87`, scanline `97`
  - the remaining `02:9016 -> 00:8029` handoff is therefore later than that
    boundary
  - the next best Lane 3 target is to extend the same bounded trace through the
    rest of frame `87` and into frame `88`

### CP-35: The same late `02:9016` stage survives into frame `89`

- Captured wider boundary-aware late-phase traces:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`

Current reading:

- `v5` (`target_frame = 86`, `620` samples) now records:
  - frame `86 end`
  - frame `87 start`
  - frame `87 end`
  - frame `88 start`
  - all four frame events still read:
    - `active_main = 02:9016`
    - `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
  - the same late write trio repeats on frame `88`, scanline `227`
- shifted `v1` (`target_frame = 87`, `620` samples) extends that same result:
  - frame `87 end`
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - all four frame events still read the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the late write trio repeats again on frame `89`, scanline `228`
  - the last sampled point is frame `89`, scanline `96`, still on `02:9016`
    with the same cursor/budget tuple
- practical reading:
  - the recurring late gameplay stage under `02:9016` is now proven to survive
    through frame `89 start` and at least frame `89`, scanline `96`
  - the `02:9016 -> 00:8029` handoff is therefore later than frame `89`,
    scanline `96`
  - the next best Lane 3 target is to advance the same trace one more
    target-frame window so it covers the rest of frame `89` and enters frame
    `90`

### CP-36: First direct visible-path `00:0054` producer observed on frame `90`

- Captured the next shifted boundary-aware trace:
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`

Current reading:

- the recurring late `02:9016` stage still survives:
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - frame `89 end`
  - frame `90 start`
  - all of those frame events still read
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the new result is the first direct producer for `00:0054` on that path:
  - frame `90`, scanline `30`: `00:0054 = 0x40`
  - frame `90`, scanline `54`: `00:0054 = 0x48`
  - those writes happen under `active_main = 02:9016`
  - `00:0053` still remains `0x38`
- practical reading:
  - the visible gameplay lane itself advances the queue write pointer from
    `0x38 -> 0x40 -> 0x48` before the later sampled `0x48/0x48` state
  - the next best Lane 3 target is now to trace when and where `00:0053`
    catches up from `0x38` to `0x48`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is no longer the closest unexplained edge

### CP-37: `00:0053` catches up on frame `91`, with a transient `0x14B8` budget

- Captured the next shifted boundary-aware trace and helper-side follow-up:
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`

Current reading:

- the visible gameplay lane now has a directly observed equalization path:
  - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
  - frame `91 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `91 end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
- the frame-`91` burst is now explicit:
  - frame `91`, scanline `228`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    then `00:0055 = 0x08`, `00:0056 = 0x15`
  - frame `91`, scanline `229`: `00:0055 = 0xB8`, `00:0056 = 0x14`,
    `00:0053 = 0x48`
  - frame `92`, scanline `227`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    `00:0053 = 0x48`
- helper-side write tracing against nearby bank-1 sinks stays negative:
  - added write points at `7E:1E24/1E26/070C/0718`
  - no writes were recorded at those sinks in the same `90..92` window
- practical reading:
  - the old “find the `00:0053` catch-up” question is now closed
  - the next best Lane 3 target is now the producer/reset path behind the
    transient frame-`91` `00:0055/0056 = 0xB8/0x14` state and the frame-`92`
    reset back to `0x90/0x15`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is again the second boundary, not the first

### CP-38: Later timed-input direct-hit bridge reopened at `7051`

- Extended the Mesen extractor bridge so timed input windows work through the
  headless frame extractor:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/extract_mesen_scene_range.py`
- Added the successful later-scene extraction artifacts:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
- Re-ran the matching targeted `L001210` probe:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.md`
- Extended the supporting docs:
  - `rom_analysis/docs/memory_map.md`
  - `tools/README.md`

Current reading:

- the extractor bridge no longer stalls when timed input windows are combined
  with the headless Mesen asset path:
  - smoke validation `0-3:start` now extracts frame `8`
  - the previously blocked later-scene path
    `6800:start;6900-6920:start,a` now extracts frame `7051`
- the matching targeted probe recovers the later direct-hit cluster on that
  same scenario:
  - frame `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - frame `7059` -> `07:BF49` (`42FB`, bank 7)
  - frame `7064` -> `07:C112` (`26FB`, bank 7)
- the new one-frame provenance artifact binds the visible tilemap layers at
  frame `7051` directly to the bank-13 source:
  - `bg1` tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` tile index `0x000` at `CHR 0x3000`
  - `bg3` tile index `0x000` at `CHR 0x6000`
  - all backed by exact `runtime-hit@7051`
- practical reading:
  - Lane 2 is no longer blocked on the timed-input extractor bridge
  - headless proof now extends beyond the old `1117` carry boundary with a
    later direct runtime anchor
  - the next best Lane 2 step is to extract/design-pack `7059` and `7064` on
    the same scenario and decide whether they close a later contiguous
    provenance window around the recovered `0D:C4DC -> 07:BF49 -> 07:C112`
    sequence

### CP-39: Later direct-hit cluster packaged, but not yet promoted to a full window

- Extended the recovered later-scene extraction lane to include the remaining
  direct-hit frames:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added a combined exact-hit provenance artifact:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.md`
- Updated the supporting docs:
  - `rom_analysis/docs/next_steps_roadmap.md`
  - `rom_analysis/docs/memory_map.md`
  - `validation/README.md`

Current reading:

- the recovered later direct-hit cluster is now packaged end-to-end on the same
  timed-input scenario `6800:start;6900-6920:start,a`:
  - `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - `7059` -> `07:BF49` (`42FB`, bank 7)
  - `7064` -> `07:C112` (`26FB`, bank 7)
- the extracted design-pack range is stable across those exact-hit frames:
  - `bgMode = 1`
  - `mainScreenLayers = 0x11`
  - `forcedBlank = false`
  - `bg1` keeps tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` and `bg3` each stay on tile index `0x000`
- practical reading:
  - this closes the exact later-hit anchors, not the full `7051..7064` window
  - the source chunk changes at each recovered hit, so promoting a contiguous
    window still needs at least one interior confirmation per segment rather
    than a blind carry assumption
  - the next best Lane 2 step is a minimal interior follow-up:
    - extract/design-pack `7055` and `7061`
    - if those mid-segment samples keep the same tile-index block and map
      cleanly by carry (`7055 <- 7051`, `7061 <- 7059`), promote the later
      scene into a documented contiguous provenance window

### CP-40: Mirrored non-square OBJ regression closed and covered

- Fixed the vertical-mirror row sampling bug in both renderer implementations:
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Applied the same height-based fix to both OBJ code paths in each renderer:
  - the normal OBJ compositor
  - the Mode 7 scanline/PPU-accurate compositor
- Added a generated regression fixture and runner:
  - `tools/check_obj_vertical_flip.py`
  - `make -C tools obj-vertical-flip-check`
- Updated the validation docs:
  - `validation/README.md`
  - `tools/README.md`

Current reading:

- the old bug only showed up on vertically mirrored non-square sprites because
  the row-sampling logic incorrectly used `width` where it needed full sprite
  `height`
- the new generated fixture is intentionally minimal:
  - one 16x32 OBJ sprite
  - four unique tile rows
  - one shared golden PPM
- that single fixture now checks four paths:
  - Python simple OBJ renderer
  - Python `mode7-ppu` OBJ renderer
  - SDL non-Mode-7 OBJ renderer
  - SDL Mode 7 OBJ renderer
- practical reading:
  - the mirrored-OBJ correctness gap is now closed and guarded
  - the next cleanup-side renderer target should move to BG4 support and
    tile-priority ordering instead of revisiting this bug class ad hoc

### CP-41: Generated-clutter cleanup is now automated

- Added a repo-owned cleanup tool:
  - `tools/clean_generated_artifacts.py`
  - `make -C tools clean-generated`
  - `make -C tools clean-generated-dry-run`
- The cleanup scope is explicit and conservative:
  - build output (`port/build`, `tools/mesen_ppu_extract/bin`, `tools/mesen_ppu_extract/obj`)
  - mutable emulator output (`.mesen-config/Mesen2/LuaScriptData`, `.mesen-runs`)
  - scratch `tools/out` surfaces (`*smoke*`, `*makecheck*`, `*designtest*`,
    the vertical-flip fixture output)
  - debugger coverage junk (`game.cdl`) under `.mesen-config`, `tools/out`,
    and committed proof bundles
- Updated tooling/docs:
  - `tools/Makefile`
  - `tools/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Current reading:

- `tools/out` is the dominant local clutter surface (`2.4G` in this snapshot),
  but most of that tree is still evidence-bearing archaeology output, so the
  new cleanup target intentionally does **not** blanket-delete it
- the always-safe/scratch slice already identified here is enough to reclaim
  build products, smoke outputs, stale design-test packs, and debugger junk
  without touching referenced proof artifacts
- practical reading:
  - repo hygiene now has a repeatable cleanup path instead of one-off manual
    deletions
  - the next cleanup-side work can move back to renderer/port progress without
    letting disposable surfaces keep accumulating

### CP-42: BG4 and tile-priority rendering are now covered

- Expanded the shared renderer model from `3` BG layers to `4`:
  - `port/src/td2_types.h`
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Replaced the old implicit non-Mode-7 layer paint order with explicit ordered
  BG passes:
  - low priority `BG4 -> BG3 -> BG2 -> BG1`
  - then high priority `BG4 -> BG3 -> BG2 -> BG1`
- Fixed the per-mode BPP table so BG4 is only active in modes that actually
  expose it.
- Added a generated regression fixture and runner:
  - `tools/check_bg_layer_priority.py`
  - `make -C tools bg-layer-priority-check`
- Updated docs/cleanup wiring:
  - `validation/README.md`
  - `tools/README.md`
  - `tools/clean_generated_artifacts.py`

Current reading:

- the old non-Mode-7 path had two coupled correctness gaps:
  - hard-coded `3`-layer scene state
  - no tile-priority ordering at all
- the new fixture is intentionally tiny but targeted:
  - BG4-only cell
  - low-priority overlap cell
  - high-priority-over-low cell
  - high-priority ordering cell
- practical reading:
  - BG4 visibility and basic tile-priority ordering are now guarded in both
    renderers
  - the next renderer-side work should move to the remaining composition gaps
    rather than this older background-order failure class

### CP-43: Late intro probe-vs-bridge OAM divergence is now machine-readable

- Added a dedicated OAM delta analyzer:
  - `tools/analyze_oam_delta.py`
- Added a reproducible late-intro target:
  - `make -C tools intro-oam-deltas`
- Evidence:
  - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.json`
  - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.md`
  - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.json`
  - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.md`
  - `tools/out/intro_oam_deltas/frame_994_variant_compare.json`
  - `tools/out/intro_oam_deltas/frame_994_variant_compare.md`

Current reading:

- frame `986`:
  - full `544`-byte OAM delta is `37` bytes (`35` low-table, `2` high-table)
  - `9` sprites change, and all `9` are visible in the probe dump while the
    bridge dump carries `0` visible sprites
  - practical reading: the bridge-visible path has already cleared the whole
    late overlay by `986`
- frame `990`:
  - full `544`-byte OAM delta is `92` bytes (`86` low-table, `6` high-table)
  - `23` sprites change; visible sprite count drops from `23` in the probe dump
    to `5` in the bridge dump
  - practical reading: the first `5` sprites are repositioned/resized into a
    compact bridge-visible cluster and the remaining `18` probe sprites vanish
- frame `994`:
  - the current committed `fromraw990` and `bridgeobj` variants compare at `0`
    OAM bytes / `0` sprite deltas
  - practical reading: the remaining screenshot gap at `994` is already
    downstream of a raw OAM fork in the committed artifact set

### CP-44: `tools/out` repo hygiene is now quiet by default

- Updated the ignore policy:
  - `.gitignore`
- Tightened the conservative cleanup target:
  - `tools/clean_generated_artifacts.py`
  - `make -C tools clean-generated`
  - `make -C tools clean-generated-dry-run`
- Updated the workflow docs:
  - `tools/README.md`
  - `validation/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `make -C tools clean-generated-dry-run`
- `make -C tools clean-generated`
- `git status --short`

Current reading:

- `tools/out/` is now git-ignored by default, which removes the normal
  worktree noise from new local extractor/probe runs without affecting already
  tracked proof artifacts under that tree
- promoting a new `tools/out` artifact is now explicit (`git add -f`) instead
  of accidental
- the cleanup target now also removes obvious untracked `tmp*` / `test_*`
  scratch surfaces while skipping any tracked path and staying conservative
  around evidence-bearing archaeology runs
- practical reading:
  - the ignore-policy slice of repo hygiene is now closed enough to move to the
    remaining portability cleanup
  - the next cleanup-side step should remove hard-coded personal Mesen paths
    from promoted scripts and Makefiles
  - intro-side evidence families like `intro_oam_deltas` remain intentionally
    out of the cleaner's delete set

### CP-45: Promoted tooling surfaces are portable by default

- Added a repo-owned portability guard:
  - `tools/check_portability_paths.py`
  - `make -C tools portability-path-check`
- Wired the new check into the promoted tooling surface:
  - `tools/Makefile`
- Removed hard-coded personal-path examples from the main tooling docs:
  - `tools/README.md`
  - `validation/README.md`

Evidence:

- `make -C tools portability-path-check`
- `python3 -m py_compile tools/check_portability_paths.py`

Current reading:

- the actual runtime wrappers were already portable:
  - `validation/run_mesen_capture.sh` resolves via `MESEN_BIN`,
    `MESEN_RELEASE_DIR`, then `PATH`
  - `tools/run_mesen_ppu_extract.sh` derives `MESEN_RELEASE_DIR` from
    `MESEN_BIN` or `PATH`
- the remaining portability leak was in promoted usage examples and notes that
  still embedded one personal Linux source-build path
- the new guard keeps that same issue from re-entering the promoted tooling
  surface silently
- scope note:
  - this closes the roadmap gate for promoted scripts/Makefiles and main
    tooling docs
  - historical generated artifacts and long-form docs may still carry absolute
    paths and should be treated as separate cleanup work rather than current
    wrapper/Makefile blockers
- practical reading:
  - the personal-path portability slice is now closed enough to move on
  - the next cleanup-side target should be validation-output isolation instead
    of mutable shared `LuaScriptData`

### CP-46: Boot-probe validation output defaults are now repo-owned

- Added a repo-owned boot-probe output prefix:
  - `validation/mesen_probe_boot.lua` now accepts
    `TD2_BOOT_PROBE_OUTPUT_PREFIX`
  - `validation/run_mesen_capture.sh` now creates the parent directory for that
    prefix before launching Mesen
- Promoted boot-probe targets now default to repo-owned outputs:
  - `tools/Makefile` now routes `l001210-probe` and `l001210-save-savestate`
    through `tools/out/td2_boot_probe*`
  - `tools/run_l001210_probe_matrix.py` now assigns each scenario its own
    repo-owned output prefix inside the matrix output directory
- Updated promoted docs and contract examples:
  - `tools/README.md`
  - `validation/README.md`
  - `rom_analysis/docs/validation_gates.md`

Evidence:

- `bash -n validation/run_mesen_capture.sh validation/run_mesen_probe_boot.sh validation/run_mesen_dump_bg_range.sh`
- `python3 -m py_compile tools/run_l001210_probe_matrix.py`
- `make -C tools -n l001210-probe L001210_PROBE_TOTAL_FRAMES=2 MESEN_TIMEOUT_SECONDS=15`
- `make -C tools -n l001210-save-savestate L001210_SAVE_TOTAL_FRAMES=2 MESEN_TIMEOUT_SECONDS=15`
- bounded negative runtime check:
  - both local Linux Mesen binaries abort in `--testRunner` mode with
    `std::bad_cast` before the probe completes, so live proof of the redirected
    files remains environment-blocked rather than code-blocked

Current reading:

- the promoted boot-probe lane no longer defaults to shared
  `.mesen-config/Mesen2/LuaScriptData` for its trace/screenshot/contract paths
- the matrix harness now keeps per-scenario probe JSON and trace JSON under the
  scenario output family instead of reading from mutable shared emulator state
- the remaining gap on this slice is live runtime confirmation once the local
  Mesen `--testRunner` crash is resolved
- practical reading:
  - the cleanup-side output-isolation slice is now closed enough to move on
  - the next cleanup-side target should push the same repo-owned/per-run policy
    into the remaining validation surfaces and contract examples that still
    assume shared emulator output

### CP-47: Visible scanline helper output is now repo-owned by default

- Extended the generic Mesen launcher for the scanline probe family:
  - `validation/run_mesen_capture.sh` now prepares the parent directory for
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX`
- Moved the committed visible-range scanline helper off shared emulator output:
  - `tools/capture_visible_mode7_range.py` now derives a repo-owned per-run
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX` from `--output`
  - the helper records that raw probe path in its aggregate JSON payload
- Updated promoted docs for the scanline path:
  - `validation/README.md`
  - `tools/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `bash -n validation/run_mesen_capture.sh`
- `python3 -m py_compile tools/capture_visible_mode7_range.py`
- `python3 tools/capture_visible_mode7_range.py --help`

Current reading:

- the committed visible-scanline capture helper no longer depends on shared
  `.mesen-config/Mesen2/LuaScriptData` as its default raw JSON surface
- direct one-off `mesen_scanline_step_test.lua` runs can now also stay
  repo-owned when `TD2_SCANLINE_TEST_OUTPUT_PREFIX` is set explicitly
- scope note:
  - this checkpoint does not yet change the newer gameplay-specific
    `capture_scanline_samples_range.py` helper that is currently in the dirty
    worktree
  - it closes the committed visible-range scanline helper path only
- practical reading:
  - the cleanup-side output-isolation slice is moving, but not finished
  - the next cleanup-side target should isolate the remaining scanline/gameplay
    wrappers and the lingering doc examples that still assume shared emulator
    output

### CP-48: Later-scene interior carry check is blocked again by bridge timeout regression

- Rebuilt the committed Mesen bridge extractor to retry the later-scene lane:
  - `dotnet build tools/mesen_ppu_extract/mesen_ppu_extract.csproj --configfile tools/mesen_ppu_extract/NuGet.Config`
- Retried the planned Lane 2 interior carry extraction on the documented timed-
  input scenario `6800:start;6900-6920:start,a`:
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 7055 --end-frame 7061 --step 6 --out-dir tools/out/mesen_range_7055_7061_inputfix_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --input-windows '6800:start;6900-6920:start,a' --frame-timeout-seconds 180`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 --out-dir tools/out/mesen_frame_7055_inputfix_retry_v1 --frame-timeout-seconds 300 --input-windows '6800:start;6900-6920:start,a'`
- Updated the source-of-truth roadmap with the live blocker:
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- first retry failed with `System.TimeoutException` waiting for frame `1762`
  while targeting frame `7055`
- final bounded retry failed with the same exception earlier, at frame `411`,
  on the single-frame wrapper path
- both retries produced only scratch `.mesen-home` output directories and no
  frame assets under:
  - `tools/out/mesen_range_7055_7061_inputfix_v1`
  - `tools/out/mesen_frame_7055_inputfix_retry_v1`

Current reading:

- this is a real regression relative to CP-38/CP-39, which had already
  recovered the same later-scene timed-input path
- the current local bridge environment is not healthy enough to promote the
  `7051..7064` window with the planned `7055/7061` interior confirmation
- practical reading:
  - do not claim the later scene as a contiguous provenance window yet
  - the next defensible move is to pin or recover a known-good
    `Mesen`/`MesenCore.so` pair for timed-input bridge extraction, then rerun
    `7055` and `7061`

### CP-49: Bank30 unresolved queue is tighter after registry reclassification

- Extended `tools/build_bank30_chunk_registry.py` so the consolidated registry
  now records whether a candidate sits inside another successful decode window
  and can classify non-runtime cases more honestly.
- Regenerated the bank30 registry outputs:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`
- Updated the source-of-truth lane docs:
  - `rom_analysis/docs/bank30_decompression_report.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `python3 -m py_compile tools/build_bank30_chunk_registry.py`
- `python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md`

Current reading:

- `1E:9681` is no longer best treated as a live unresolved content target:
  - `42FB`
  - declared output `0`
  - registry status: `sentinel-control`
- `1E:E91F` is no longer best treated as a top-level unresolved chunk:
  - `67FB`
  - standalone decode still fails with source exhaustion
  - the marker sits inside the successful `1E:DA96` decode window and also
    inside the successful `1E:E800` nested window
  - registry status: `nested-invalid-marker`
- the active unresolved queue is now tighter and smaller:
  - `P0`: `1E:EE7F` (`26FB`, table-confirmed unseen)
  - `P1`: `1E:DA96` (`67FB`, valid top-level decode still unseen at runtime)
- practical reading:
  - this does not solve runtime reachability for `EE7F` or `DA96`
  - it does remove two low-signal pseudo-targets from the active queue so the
    next lane-1 work can stay focused on real remaining ambiguity

### CP-50: Later-scene interior tilemap carry check reopened at `7055/7061`

- Patched `tools/mesen_ppu_extract/Program.cs` so timed-input bridge extraction
  no longer depends on fragile per-frame `Resume/WaitForFrame/Pause` stepping:
  - switch timed-input advance to debugger `PpuFrame` stepping
  - wait on the expected frame count directly so fast steps do not false-timeout
  - chunk long same-input spans into `256`-frame steps to keep the current
    local `Mesen` / `MesenCore.so` pair stable
- Rebuilt the committed bridge extractor and reran the previously blocked
  later-scene lane on scenario `6800:start;6900-6920:start,a`:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07055 --frame-timeout-seconds 180 --input-windows '6800:start;6900-6920:start,a'`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7061 --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07061 --frame-timeout-seconds 180 --input-windows '6800:start;6900-6920:start,a'`
- Packed the reopened interior frames and promoted tilemap-side evidence:
  - `tools/out/design_mesen_range_7055_7061_inputfix_v2/design_pack_range.json`
  - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.md`
- Updated the source-of-truth lane docs:
  - `rom_analysis/docs/memory_map.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `dotnet build tools/mesen_ppu_extract/mesen_ppu_extract.csproj --configfile tools/mesen_ppu_extract/NuGet.Config`
- `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_7055_7061_inputfix_v2 tools/out/design_mesen_range_7055_7061_inputfix_v2 --clean-out`
- raw/design-pack comparison reading:
  - `7055` vs `7051`:
    - `bg1/bg2/bg3` tilemaps: exact match
    - `vram.bin`: exact match
    - `cgram.bin`, `ppu_state.json`, `oam.bin`: different
    - visible sprites: `10 -> 0`
  - `7061` vs `7059`:
    - `bg1/bg2/bg3` tilemaps: exact match
    - `vram.bin`, `oam.bin`: exact match
    - `cgram.bin`, `ppu_state.json`: different
    - visible sprites: `0 -> 0`

Current reading:

- the current local timed-input bridge is usable again for the planned later-
  scene extraction path; the previous compatibility blocker is no longer the
  active reason Lane 2 was stalled
- `7055` now closes the intended interior tilemap carry check for
  `0D:C4DC`, but it does **not** close whole-scene carry because the
  visible-sprite/OAM composition changes between `7051` and `7055`
- `7061` now closes the intended interior tilemap carry check for `07:BF49`,
  and that pair already agrees on visible-sprite emptiness plus raw OAM
- practical reading:
  - Lane 2 is no longer blocked on bridge compatibility for this check
  - the new evidence is enough to promote tilemap-side interior carry
  - it is still not enough to promote `7051..7064` as full-scene contiguous
    carry evidence

### CP-51: Translation-facing visual contracts now bridge design packs into BG/OBJ IR

- Added new frame-level IR builders:
  - `tools/build_mesen_visual_contract.py`
  - `tools/build_mesen_visual_contract_range.py`
- The new contract layer is intentionally split along the real rendering
  boundary:
  - BG stays tilemap/CHR-driven from decoded `tilemaps/bg*_tilemap.json`
  - OBJ stays OAM-driven from `sprites/sprites_visible.json` plus raw
    `oam.bin/cgram.bin/ppu_state.json`
- The builder can also attach current lane-2 tilemap provenance rows so the
  translation surface already carries frame/layer -> chunk evidence when that
  data exists.
- Updated the design-workbench doc to promote the new contract surface:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 tools/out/visual_contract_7051.json --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_7055_7061_inputfix_v2 tools/out/visual_contract_range_7055_7061 --provenance-json rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc --clean-out`

Current reading:

- the repo now has a machine-readable visual IR that is more useful for later
  assembly translation than raw design packs alone
- the IR makes the key architectural split explicit:
  - BG provenance can already bind to tilemap/chunk evidence
  - OBJ state still needs producer-side breakpoint/write ownership to become a
    reliable assembly contract
- practical reading:
  - this is the right staging layer for automated CHR/sprite archaeology
  - it does not replace runtime tracing; it gives tracing a stable target

### CP-52: Visual contracts now accept producer-side write-breakpoint ownership

- Extended `validation/mesen_probe_boot.lua` generic write-point trace payload:
  - CPU regs/PC now ride along with each write hit
  - active IRQ callback bank/addr now ride along with each write hit
- Extended the visual-contract builders:
  - `tools/build_mesen_visual_contract.py` now accepts `--probe-json`
  - `tools/build_mesen_visual_contract_range.py` now forwards `--probe-json`
    and exposes `producerTraceEnabled` in the range index
- The merged contract now emits `producerTrace` by write domain:
  - `vram`
  - `cgram`
  - `oam`
  - `obj_state`
  - each domain carries top write callsites and active callbacks, plus sample
    hits
- Updated the design-workbench doc so the contract workflow now includes
  producer-side ownership as a first-class input:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- synthetic merge validation:
  - `tools/out/visual_contract_probe_fixture.json`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 tools/out/visual_contract_7051_with_probe.json --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc --probe-json tools/out/visual_contract_probe_fixture.json`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_7051_inputfix_v1 tools/out/visual_contract_range_7051_with_probe --frame-glob frame_07051 --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc --probe-json tools/out/visual_contract_probe_fixture.json --clean-out`
- negative live validation in the current local environment:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BOOT_PROBE_TOTAL_FRAMES=2 ./validation/run_mesen_probe_boot.sh`
  - the same baseline with write points enabled and longer attempts at `986`
    and `7051`
  - all three headless runs exited without emitting the expected probe JSON,
    and the short baseline surfaced exit code `255`

Current reading:

- the IR surface is now ready to carry producer-side ownership once a probe
  capture exists
- the merge path itself is validated
- the current blocker is not the contract schema anymore; it is the local
  headless boot-probe runner

### CP-53: Headless producer-trace capture reopened by absolute path normalization

- Updated the shared headless launcher:
  - `validation/run_mesen_capture.sh`
  - ROM path, Lua script path, optional savestate path, and repo-facing output
    prefixes are now normalized to absolute paths before invoking
    `Mesen --testRunner`
- Root cause of the earlier `exit 255` / no-output reports:
  - `Mesen --testRunner` resolves relative Lua file I/O under the isolated
    config root (`.mesen-config/Mesen2`), not the repo working directory
  - repo-relative nested prefixes like `tools/out/...` therefore targeted
    missing directories inside the config tree and the Lua callbacks timed out
    before they could reach `emu.stop(0)`
- Revalidated the previously failing relative-prefix smoke paths:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=10 TD2_CAPTURE_WARMUP_FRAMES=0 TD2_CAPTURE_FRAMES=1 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/capture_smoke/cap ./validation/run_mesen_capture.sh`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/dump_bg_smoke/intro ./validation/run_mesen_dump_bg_range.sh`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_baseline/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2 ./validation/run_mesen_probe_boot.sh`
- Promoted a real live producer-trace proof instead of relying only on the
  synthetic merge fixture:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=30 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/frame300_live_probe_cap2048/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=301 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=300 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=2048 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_visual_contract.py port/assets/test_dump_frame300/design_pack tools/out/visual_contract_frame300_live_probe_cap2048.json --probe-json tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
- Produced evidence:
  - `tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
  - `tools/out/visual_contract_frame300_live_probe_cap2048.json`

Current reading:

- the old blocker is closed; the headless runner can now emit repo-owned probe
  and capture outputs reliably with the documented relative `tools/out/...`
  prefixes
- the promoted frame-`300` proof records `2048` retained write hits with
  `133427` dropped by cap and yields live producer domains for:
  - `vram`
  - `cgram`
  - `oam`
  - `obj_state`
- the current limitation has narrowed:
  - a narrow `296..300` write window on the same frame emits `0` hits
  - that means the next problem is choosing producer-active windows for later
    scene ownership (`986`, `7051`, `7055`, `7059`, `7061`), not reviving the
    runner itself
- bounded 2026-03-21 follow-up on the later timed-input `7051` path:
  - attempted longer live ownership trace:
    - `MESEN_TIMEOUT_SECONDS=120`
    - `TD2_BOOT_PROBE_TOTAL_FRAMES=7062`
    - `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`
    - `TD2_BOOT_PROBE_TRACE_END_FRAME=7061`
    - `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'`
    - result: `exit 255`, no
      `tools/out/visual_contract_probe_7051_7061_live/td2_boot_probe.json`
  - attempted narrowed live ownership trace:
    - `MESEN_TIMEOUT_SECONDS=120`
    - `TD2_BOOT_PROBE_TOTAL_FRAMES=7052`
    - `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`
    - `TD2_BOOT_PROBE_TRACE_END_FRAME=7051`
    - `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'`
    - result: `exit 255`, no
      `tools/out/visual_contract_probe_7051_live/td2_boot_probe.json`
  - practical reading:
    - later power-on timed-input producer traces are still not reproducible
      headlessly in this environment even though the early frame-`300` proof is
      reproducible
    - this is an informative negative result, not evidence against the visual
      contract merge path itself
  - next best step:
    - do not spend more retries on the same power-on `7051` path without a new
      starting surface
    - recover a reusable later-intro savestate/seed for the `7051..7061`
      window, or promote a cheaper later design-pack target such as `986`
      before retrying live producer-trace ownership

### CP-54: Frame `986` now has a live producer-trace-backed visual contract

- Promoted a cheaper later-window ownership proof before retrying the blocked
  timed-input `7051` path:
  - extracted a fresh raw frame dump and design pack for `986`
  - ran a bounded live write-point trace for frames `982..986`
  - merged that probe into a translation-facing visual contract
- Hardened the probe/contract schema at the same time:
  - `validation/mesen_probe_boot.lua` now writes
    `trace_start_frame` / `trace_end_frame` into the main
    `td2_boot_probe.json` payload, which lets merged visual contracts preserve
    an exact `producerTrace.traceWindow`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=986`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=987 TD2_BOOT_PROBE_TRACE_START_FRAME=982 TD2_BOOT_PROBE_TRACE_END_FRAME=986 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame986 tools/out/visual_contract_frame986_live_probe.json --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/design_frame986/design_pack.json`
  - `tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame986_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00986_frame.png tools/out/mesen_frame986/main_visible.ppm --diff-out tools/out/mesen_frame986_vs_intro986_diff.ppm`
  - `267` mismatched pixels (`0.465611%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame986/main_visible.ppm tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm --diff-out tools/out/mesen_frame986_vs_bridgeoverride986_diff.ppm`
  - `2` mismatched pixels (`0.003488%`)

Current reading:

- the cheap `986` frame target is reproducible in the promoted extractor path
  and lands on the same practical surface as the committed bridgeoverride scene
- the fresh design pack reports:
  - `frame_number = 986`
  - `bgMode = 7`
  - `mainScreenLayers = 0x11`
  - active visible BG layer: `bg1`
  - visible sprite count: `0`
- the live write-point trace records `3246` writes with `0` drops:
  - OAM domain: `2730` writes across frames `982..986`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `516` writes at frames `984` and `986`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits in this late window still run under active main
  callback `01:9FE5`
- no `CGRAM` or `OBJSEL` writes were observed inside `982..986`
- practical reading:
  - by `986`, the visible late overlay is already gone (`0` visible sprites),
    but OAM upload traffic is still active in the same callback family
  - the live ownership proof now exists for a real later intro window without
    needing the blocked timed-input `7051` path
  - the contract hardening change is immediately useful because
    `producerTrace.traceWindow` now carries the exact `982..986` span

Next best step:

- extend the same live ownership path forward into `990` and then `994`, where
  the late OAM/visible-composition boundaries are already documented
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-55: Frames `990` and `994` now extend live ownership through the late bridge-object edge

- Extended the same bounded ownership workflow used at `986` into the next late
  attract edges:
  - extracted a fresh raw frame dump and design pack for `990`
  - ran a bounded live write-point trace for frames `986..990`
  - merged that probe into a translation-facing visual contract
  - extracted raw frame `994`, built a design pack from it, ran a bounded live
    write-point trace for frames `990..994`, and merged that probe too
- The first `994` extractor attempt timed out when launched in parallel with
  the live probe, so the promoted path now records the standalone extractor
  invocation that closed the frame cleanly:
  - `./tools/run_mesen_ppu_extract.sh --frame 994 --frame-timeout-seconds 120`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=990`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=991 TD2_BOOT_PROBE_TRACE_START_FRAME=986 TD2_BOOT_PROBE_TRACE_END_FRAME=990 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame990 tools/out/visual_contract_frame990_live_probe.json --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom ./game.smc --frame 994 --frame-timeout-seconds 120 --out-dir ./tools/out/mesen_frame994`
- `python3 tools/build_mesen_design_pack.py tools/out/mesen_frame994 tools/out/design_frame994 --clean-out`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=995 TD2_BOOT_PROBE_TRACE_START_FRAME=990 TD2_BOOT_PROBE_TRACE_END_FRAME=994 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame994 tools/out/visual_contract_frame994_live_probe.json --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame990_live_probe.json`
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame994_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00990_frame.png tools/out/mesen_frame990/main_visible.ppm --diff-out tools/out/mesen_frame990_vs_intro990_diff.ppm`
  - `1516` mismatched pixels (`2.643694%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame990/main_visible.ppm tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm --diff-out tools/out/mesen_frame990_vs_bridgeobj990_diff.ppm`
  - `2` mismatched pixels (`0.003488%`)
- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00994_frame.png tools/out/mesen_frame994/main_visible.ppm --diff-out tools/out/mesen_frame994_vs_intro994_diff.ppm`
  - `2622` mismatched pixels (`4.572405%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame994/main_visible.ppm tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm --diff-out tools/out/mesen_frame994_vs_bridgeobj994_diff.ppm`
  - `96` mismatched pixels (`0.167411%`)

Current reading:

- frame `990`:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json` records
    `3762` write hits with `0` drops over `986..990`
  - the merged contract preserves exact
    `producerTrace.traceWindow = 986..990`
  - OAM domain: `2730` writes across frames `986..990`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1032` writes across frames `986/988/989/990`
    - dominant callsites: `00:81E5` / `00:81F2`
  - `tools/out/design_frame990/sprites/sprites_visible.json` reports `5`
    visible sprites
- frame `994`:
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json` records
    `4020` write hits with `0` drops over `990..994`
  - the merged contract preserves exact
    `producerTrace.traceWindow = 990..994`
  - OAM domain: `2730` writes across frames `990..994`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1290` writes across frames `990..994`
    - dominant callsites: `00:81E5` / `00:81F2`
  - `tools/out/design_frame994/sprites/sprites_visible.json` reports `19`
    visible sprites
- all sampled write hits in both windows still run under active main callback
  `01:9FE5` with the same active IRQ callback `00:835F`
- practical reading:
  - the late bridge-object edge now has live ownership coverage from `986`
    through `994`
  - OAM upload volume stays flat from `990` to `994`, while VRAM traffic grows
    (`1032 -> 1290`) and the visible overlay expands (`5 -> 19` sprites)
  - the remaining frame-`994` screenshot gap is no longer blocked on missing
    producer-side ownership evidence or a separate committed OAM fork

Next best step:

- extend the same live ownership surface to frame `998`, where the direct
  bridge-extracted `01:9FE5` continuation already begins
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-56: Frame `998` now anchors live ownership at the start of the direct bridge-extracted block

- Extended the same bounded ownership workflow one step further into the
  direct bridge-extracted `01:9FE5` continuation:
  - extracted a fresh raw frame dump and design pack for `998`
  - ran a bounded live write-point trace for frames `994..998`
  - merged that probe into a translation-facing visual contract
- Kept validation bounded and translation-facing:
  - compared the fresh Mesen frame dump against the local screenshot
  - compared the extracted frame dump against the repo's Python
    `mode7-ppu` renderer instead of the SDL runtime because the local runtime
    worktree currently contains unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=998`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=999 TD2_BOOT_PROBE_TRACE_START_FRAME=994 TD2_BOOT_PROBE_TRACE_END_FRAME=998 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame998 tools/out/visual_contract_frame998_live_probe.json --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame998_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00998_frame.png tools/out/mesen_frame998/main_visible.ppm --diff-out tools/out/mesen_frame998_vs_intro998_diff.ppm`
  - `3119` mismatched pixels (`5.439104%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame998/vram.bin tools/out/mesen_frame998/cgram.bin tools/out/mesen_frame998/ppu_state.json tools/out/mesen_frame998_mode7ppu.ppm --oam tools/out/mesen_frame998/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame998_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame998/main_visible.ppm tools/out/mesen_frame998_mode7ppu.ppm --diff-out tools/out/mesen_frame998_mode7ppu_vs_mesen998_diff.ppm`
  - `4` mismatched pixels (`0.006975%`)

Current reading:

- `tools/out/visual_contract_probe_998_live/td2_boot_probe.json` records
  `4020` write hits with `0` drops over `994..998`
- the merged contract preserves exact `producerTrace.traceWindow = 994..998`
- producer domains remain the same as the late `994` window:
  - OAM domain: `2730` writes across frames `994..998`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1290` writes across frames `994..998`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame998/sprites/sprites_visible.json` reports `32`
  visible sprites
- practical reading:
  - `998` is now a live ownership anchor at the start of the direct
    bridge-extracted continuation, not just a callback-state claim from older
    probe logs
  - compared with `994`, producer traffic stays flat while the visible overlay
    expands again (`19 -> 32` sprites)
  - the Python `mode7-ppu` renderer still lands on the same practical
    surface (`4` pixels from `main_visible.ppm`) that the docs already report
    for the `998..1005` bridge-visible block

Next best step:

- extend the same live ownership surface to frame `1005`, which closes the
  first direct bridge-extracted `998..1005` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-57: Frame `1005` now closes the first direct bridge-extracted `998..1005` ownership block

- Extended the live ownership surface from the `998` anchor to the end of the
  first direct bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1005`
  - ran a bounded live write-point trace for the whole `998..1005` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1005` through the
    headless range dumper so the screenshot compare now exists in the same
    `intro_loop_frame_*` family as the earlier late-window checkpoints
- Kept the renderer-side validation on the stable repo surface:
  - used the Python `mode7-ppu` renderer instead of the SDL runtime because
    the local runtime worktree still contains unrelated user edits under
    `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1005`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1006 TD2_BOOT_PROBE_TRACE_START_FRAME=998 TD2_BOOT_PROBE_TRACE_END_FRAME=1005 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1005 tools/out/visual_contract_frame1005_live_probe.json --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BG_RANGE_START_FRAME=1005 TD2_BG_RANGE_END_FRAME=1005 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop ./validation/run_mesen_dump_bg_range.sh`
- produced artifacts:
  - `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1005_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01005_frame.png tools/out/mesen_frame1005/main_visible.ppm --diff-out tools/out/mesen_frame1005_vs_intro1005_diff.ppm`
  - `4466` mismatched pixels (`7.788086%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1005/vram.bin tools/out/mesen_frame1005/cgram.bin tools/out/mesen_frame1005/ppu_state.json tools/out/mesen_frame1005_mode7ppu.ppm --oam tools/out/mesen_frame1005/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1005_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1005/main_visible.ppm tools/out/mesen_frame1005_mode7ppu.ppm --diff-out tools/out/mesen_frame1005_mode7ppu_vs_mesen1005_diff.ppm`
  - `4` mismatched pixels (`0.006975%`)

Current reading:

- `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json` records
  `6432` write hits with `0` drops over `998..1005`
- the merged contract preserves exact
  `producerTrace.traceWindow = 998..1005`
- producer domains stay inside the same late `01:9FE5` surface for the whole
  block:
  - OAM domain: `4368` writes across frames `998..1005`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `2064` writes across frames `998..1005`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1005/sprites/sprites_visible.json` reports `53`
  visible sprites
- practical reading:
  - the first direct bridge-extracted `998..1005` block is now closed by live
    ownership evidence at both ends (`998` and `1005`)
  - compared with `998`, producer traffic scales with the longer block window
    while the visible overlay keeps expanding (`32 -> 53` sprites) without a
    callback-family change
  - the Python `mode7-ppu` renderer still lands on the same practical surface
    (`4` pixels from `main_visible.ppm`) that earlier bridge-visible docs
    already report for frame `1005`

Next best step:

- extend the same live ownership surface to frame `1013`, which closes the
  next direct bridge-extracted `1006..1013` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-58: Frame `1013` now closes the next direct bridge-extracted `1006..1013` ownership block

- Extended the live ownership surface through the second direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1013`
  - ran a bounded live write-point trace for the whole `1006..1013` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1013` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1013`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1014 TD2_BOOT_PROBE_TRACE_START_FRAME=1006 TD2_BOOT_PROBE_TRACE_END_FRAME=1013 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1013 tools/out/visual_contract_frame1013_live_probe.json --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1013_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01013_frame.png tools/out/mesen_frame1013/main_visible.ppm --diff-out tools/out/mesen_frame1013_vs_intro1013_diff.ppm`
  - `4638` mismatched pixels (`8.088030%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1013/vram.bin tools/out/mesen_frame1013/cgram.bin tools/out/mesen_frame1013/ppu_state.json tools/out/mesen_frame1013_mode7ppu.ppm --oam tools/out/mesen_frame1013/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1013_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1013/main_visible.ppm tools/out/mesen_frame1013_mode7ppu.ppm --diff-out tools/out/mesen_frame1013_mode7ppu_vs_mesen1013_diff.ppm`
  - `10` mismatched pixels (`0.017439%`)

Current reading:

- `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json` records
  `6174` write hits with `0` drops over `1006..1013`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1006..1013`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1006..1013`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1806` writes across frames `1006..1012`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1013/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the second direct bridge-extracted `1006..1013` block is now closed by
    live ownership evidence at its end
  - compared with `1005`, OAM activity stays flat, visible sprites keep
    growing (`53 -> 61`), and the notable contract change is that bounded VRAM
    writes stop one frame earlier (`1006..1012`, not `1006..1013`)
  - the Python `mode7-ppu` renderer rises to the same `10`-pixel practical
    surface that earlier bridge-visible docs already report for frame `1013`

Next best step:

- extend the same live ownership surface to frame `1021`, which closes the
  next direct bridge-extracted `1014..1021` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-59: Frame `1021` now closes the direct bridge-extracted `1014..1021` ownership block

- Extended the live ownership surface through the third direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1021`
  - ran a bounded live write-point trace for the whole `1014..1021` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1021` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1021`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1022 TD2_BOOT_PROBE_TRACE_START_FRAME=1014 TD2_BOOT_PROBE_TRACE_END_FRAME=1021 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1021 tools/out/visual_contract_frame1021_live_probe.json --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1021_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01021_frame.png tools/out/mesen_frame1021/main_visible.ppm --diff-out tools/out/mesen_frame1021_vs_intro1021_diff.ppm`
  - `3557` mismatched pixels (`6.202916%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1021/vram.bin tools/out/mesen_frame1021/cgram.bin tools/out/mesen_frame1021/ppu_state.json tools/out/mesen_frame1021_mode7ppu.ppm --oam tools/out/mesen_frame1021/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1021_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1021/main_visible.ppm tools/out/mesen_frame1021_mode7ppu.ppm --diff-out tools/out/mesen_frame1021_mode7ppu_vs_mesen1021_diff.ppm`
  - `10` mismatched pixels (`0.017439%`)

Current reading:

- `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json` records
  `5400` write hits with `0` drops over `1014..1021`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1014..1021`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1014..1021`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1032` writes at frames `1014/1015/1017/1019`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1021/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the third direct bridge-extracted `1014..1021` block is now closed by
    live ownership evidence at its end
  - compared with `1013`, visible sprites stay flat at `61` while bounded
    VRAM activity becomes sparse instead of contiguous inside the block
  - the Python `mode7-ppu` renderer stays on the same `10`-pixel practical
    surface already documented for frame `1021`

Next best step:

- extend the same live ownership surface to frame `1029`, which closes the
  next direct bridge-extracted `1022..1029` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-60: Frame `1029` now closes the direct bridge-extracted `1022..1029` ownership block

- Extended the live ownership surface through the fourth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1029`
  - ran a bounded live write-point trace for the whole `1022..1029` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1029` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1029`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1030 TD2_BOOT_PROBE_TRACE_START_FRAME=1022 TD2_BOOT_PROBE_TRACE_END_FRAME=1029 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1029 tools/out/visual_contract_frame1029_live_probe.json --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1029_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01029_frame.png tools/out/mesen_frame1029/main_visible.ppm --diff-out tools/out/mesen_frame1029_vs_intro1029_diff.ppm`
  - `1` mismatched pixel (`0.001744%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1029/vram.bin tools/out/mesen_frame1029/cgram.bin tools/out/mesen_frame1029/ppu_state.json tools/out/mesen_frame1029_mode7ppu.ppm --oam tools/out/mesen_frame1029/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1029_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1029/main_visible.ppm tools/out/mesen_frame1029_mode7ppu.ppm --diff-out tools/out/mesen_frame1029_mode7ppu_vs_mesen1029_diff.ppm`
  - `11` mismatched pixels (`0.019182%`)

Current reading:

- `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json` records
  `3822` write hits with `0` drops over `1022..1029`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1022..1029`
- producer domains stay inside the same late `01:9FE5` family, but now only
  one bounded write domain is still active:
  - OAM domain: `3822` writes across frames
    `1022/1023/1024/1025/1027/1028/1029`
    - dominant callsites: `00:824F` / `00:8257`
  - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1029/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the fourth direct bridge-extracted `1022..1029` block is now closed by
    live ownership evidence at its end
  - compared with `1021`, visible sprites stay flat at `61` while bounded
    producer traffic collapses from `OAM + sparse VRAM` down to `OAM` only
  - frame `1029` also lands at a near-solved local screenshot surface (`1`
    mismatched pixel), so this block is no longer merely bridge-visible

Next best step:

- extend the same live ownership surface to frame `1037`, which closes the
  next direct bridge-extracted `1030..1037` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-61: Frame `1037` now closes the direct bridge-extracted `1030..1037` ownership block

- Extended the live ownership surface through the fifth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1037`
  - ran a bounded live write-point trace for the whole `1030..1037` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1037` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1037`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1038 TD2_BOOT_PROBE_TRACE_START_FRAME=1030 TD2_BOOT_PROBE_TRACE_END_FRAME=1037 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1037 tools/out/visual_contract_frame1037_live_probe.json --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1037_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01037_frame.png tools/out/mesen_frame1037/main_visible.ppm --diff-out tools/out/mesen_frame1037_vs_intro1037_diff.ppm`
  - `29` mismatched pixels (`0.050572%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1037/vram.bin tools/out/mesen_frame1037/cgram.bin tools/out/mesen_frame1037/ppu_state.json tools/out/mesen_frame1037_mode7ppu.ppm --oam tools/out/mesen_frame1037/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1037_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1037/main_visible.ppm tools/out/mesen_frame1037_mode7ppu.ppm --diff-out tools/out/mesen_frame1037_mode7ppu_vs_mesen1037_diff.ppm`
  - `8` mismatched pixels (`0.013951%`)

Current reading:

- `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1030..1037`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1030..1037`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1030..1037`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1030` and `1034`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1037/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the fifth direct bridge-extracted `1030..1037` block is now closed by
    live ownership evidence at its end
  - compared with `1029`, visible sprites stay flat at `61`, but the bounded
    producer surface is no longer OAM-only because a narrow VRAM pulse returns
    at `1030` and `1034`
  - frame `1037` stays close to the screenshot-backed surface without any
    callback-family fork

Next best step:

- extend the same live ownership surface to frame `1045`, which closes the
  next direct bridge-extracted `1038..1045` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-62: Frame `1045` now closes the direct bridge-extracted `1038..1045` ownership block

- Extended the live ownership surface through the sixth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1045`
  - ran a bounded live write-point trace for the whole `1038..1045` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1045` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Recorded one invalid concurrency attempt before the valid rerun:
  - parallel probe + screenshot runs against the same isolated Mesen config
    both ended with `exit 255` before emitting artifacts
  - rerunning those same steps serially produced the committed outputs
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1045`
- invalid bounded attempt:
  - parallel `run_mesen_probe_boot.sh` and `run_mesen_dump_bg_range.sh`
    over the same isolated config; both ended `exit 255` without artifacts
- valid rerun:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1046 TD2_BOOT_PROBE_TRACE_START_FRAME=1038 TD2_BOOT_PROBE_TRACE_END_FRAME=1045 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1045 tools/out/visual_contract_frame1045_live_probe.json --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1045_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01045_frame.png tools/out/mesen_frame1045/main_visible.ppm --diff-out tools/out/mesen_frame1045_vs_intro1045_diff.ppm`
  - `34` mismatched pixels (`0.059291%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1045/vram.bin tools/out/mesen_frame1045/cgram.bin tools/out/mesen_frame1045/ppu_state.json tools/out/mesen_frame1045_mode7ppu.ppm --oam tools/out/mesen_frame1045/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1045_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1045/main_visible.ppm tools/out/mesen_frame1045_mode7ppu.ppm --diff-out tools/out/mesen_frame1045_mode7ppu_vs_mesen1045_diff.ppm`
  - `15` mismatched pixels (`0.026158%`)

Current reading:

- `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1038..1045`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1038..1045`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1038..1045`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1038` and `1042`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1045/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the sixth direct bridge-extracted `1038..1045` block is now closed by
    live ownership evidence at its end
  - compared with `1037`, the narrow VRAM pulse pattern remains but shifts
    later to `1038` and `1042` while visible sprites stay flat
  - parallel reuse of the same isolated Mesen config is not reliable for this
    lane; serialize probe and screenshot capture when needed

Next best step:

- extend the same live ownership surface to frame `1053`, which closes the
  next direct bridge-extracted `1046..1053` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-63: Frame `1053` now closes the direct bridge-extracted `1046..1053` ownership block

- Extended the live ownership surface through the seventh direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1053`
  - ran a bounded live write-point trace for the whole `1046..1053` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1053` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again after the `1045` concurrency
  failure:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1053`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1054 TD2_BOOT_PROBE_TRACE_START_FRAME=1046 TD2_BOOT_PROBE_TRACE_END_FRAME=1053 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1053 tools/out/visual_contract_frame1053_live_probe.json --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1053_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01053_frame.png tools/out/mesen_frame1053/main_visible.ppm --diff-out tools/out/mesen_frame1053_vs_intro1053_diff.ppm`
  - `31` mismatched pixels (`0.054060%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1053/vram.bin tools/out/mesen_frame1053/cgram.bin tools/out/mesen_frame1053/ppu_state.json tools/out/mesen_frame1053_mode7ppu.ppm --oam tools/out/mesen_frame1053/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1053_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1053/main_visible.ppm tools/out/mesen_frame1053_mode7ppu.ppm --diff-out tools/out/mesen_frame1053_mode7ppu_vs_mesen1053_diff.ppm`
  - `14` mismatched pixels (`0.024414%`)

Current reading:

- `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1046..1053`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1046..1053`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1046..1053`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1046` and `1050`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1053/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the seventh direct bridge-extracted `1046..1053` block is now closed by
    live ownership evidence at its end
  - compared with `1045`, the same narrow VRAM pulse pattern persists one
    block later and shifts again, now landing at `1046` and `1050`
  - the lane still prefers serialized Mesen capture whenever both a probe
    artifact and a local screenshot are needed

Next best step:

- extend the same live ownership surface to frame `1061`, which closes the
  next direct bridge-extracted `1054..1061` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-64: Frame `1061` now closes the direct bridge-extracted `1054..1061` ownership block

- Extended the live ownership surface through the eighth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1061`
  - ran a bounded live write-point trace for the whole `1054..1061` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1061` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1061`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1062 TD2_BOOT_PROBE_TRACE_START_FRAME=1054 TD2_BOOT_PROBE_TRACE_END_FRAME=1061 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1061 tools/out/visual_contract_frame1061_live_probe.json --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1061_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01061_frame.png tools/out/mesen_frame1061/main_visible.ppm --diff-out tools/out/mesen_frame1061_vs_intro1061_diff.ppm`
  - `36` mismatched pixels (`0.062779%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1061/vram.bin tools/out/mesen_frame1061/cgram.bin tools/out/mesen_frame1061/ppu_state.json tools/out/mesen_frame1061_mode7ppu.ppm --oam tools/out/mesen_frame1061/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1061_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1061/main_visible.ppm tools/out/mesen_frame1061_mode7ppu.ppm --diff-out tools/out/mesen_frame1061_mode7ppu_vs_mesen1061_diff.ppm`
  - `22` mismatched pixels (`0.038365%`)

Current reading:

- `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1054..1061`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1054..1061`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1054..1061`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1054` and `1058`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1061/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the eighth direct bridge-extracted `1054..1061` block is now closed by
    live ownership evidence at its end
  - compared with `1053`, the same narrow VRAM pulse pattern persists yet
    again and shifts to `1054` and `1058`, while visible sprites stay flat
  - serialized Mesen capture remains the preferred path whenever both a probe
    artifact and a local screenshot are needed

Next best step:

- extend the same live ownership surface to frame `1069`, which closes the
  next direct bridge-extracted `1062..1069` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-65: Frame `1069` now closes the direct bridge-extracted `1062..1069` ownership block

- Extended the live ownership surface through the ninth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1069`
  - ran a bounded live write-point trace for the whole `1062..1069` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1069` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1069`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1070 TD2_BOOT_PROBE_TRACE_START_FRAME=1062 TD2_BOOT_PROBE_TRACE_END_FRAME=1069 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1069 tools/out/visual_contract_frame1069_live_probe.json --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1069_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01069_frame.png tools/out/mesen_frame1069/main_visible.ppm --diff-out tools/out/mesen_frame1069_vs_intro1069_diff.ppm`
  - `48` mismatched pixels (`0.083705%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1069/vram.bin tools/out/mesen_frame1069/cgram.bin tools/out/mesen_frame1069/ppu_state.json tools/out/mesen_frame1069_mode7ppu.ppm --oam tools/out/mesen_frame1069/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1069_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1069/main_visible.ppm tools/out/mesen_frame1069_mode7ppu.ppm --diff-out tools/out/mesen_frame1069_mode7ppu_vs_mesen1069_diff.ppm`
  - `25` mismatched pixels (`0.043597%`)

Current reading:

- `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1062..1069`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1062..1069`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1062..1069`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1062` and `1066`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1069/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the ninth direct bridge-extracted `1062..1069` block is now closed by
    live ownership evidence at its end
  - compared with `1061`, the same narrow VRAM pulse pattern persists again
    and shifts to `1062` and `1066`, while visible sprites stay flat
  - screenshot-backed mismatch is rising slowly, but still without any
    callback-family fork

Next best step:

- extend the same live ownership surface to frame `1077`, which closes the
  next direct bridge-extracted `1070..1077` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-66: Frame `1077` now closes the direct bridge-extracted `1070..1077` ownership block

- Extended the live ownership surface through the tenth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1077`
  - ran a bounded live write-point trace for the whole `1070..1077` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1077` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1077`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1078 TD2_BOOT_PROBE_TRACE_START_FRAME=1070 TD2_BOOT_PROBE_TRACE_END_FRAME=1077 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1077 tools/out/visual_contract_frame1077_live_probe.json --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1077_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01077_frame.png tools/out/mesen_frame1077/main_visible.ppm --diff-out tools/out/mesen_frame1077_vs_intro1077_diff.ppm`
  - `36` mismatched pixels (`0.062779%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1077/vram.bin tools/out/mesen_frame1077/cgram.bin tools/out/mesen_frame1077/ppu_state.json tools/out/mesen_frame1077_mode7ppu.ppm --oam tools/out/mesen_frame1077/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1077_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1077/main_visible.ppm tools/out/mesen_frame1077_mode7ppu.ppm --diff-out tools/out/mesen_frame1077_mode7ppu_vs_mesen1077_diff.ppm`
  - `52` mismatched pixels (`0.090681%`)

Current reading:

- `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1070..1077`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1070..1077`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1070..1077`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1070` and `1074`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1077/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the tenth direct bridge-extracted `1070..1077` block is now closed by
    live ownership evidence at its end
  - compared with `1069`, the same narrow VRAM pulse pattern persists again
    and shifts to `1070` and `1074`, while visible sprites stay flat
  - the screenshot-backed surface stays tight, but the Python `mode7-ppu` gap
    now rises materially inside the same callback family

Next best step:

- extend the same live ownership surface to frame `1093`, which closes the
  next direct bridge-extracted `1086..1093` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-67: Frame `1085` now closes the direct bridge-extracted `1078..1085` ownership block

- Extended the live ownership surface through the eleventh direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1085`
  - ran a bounded live write-point trace for the whole `1078..1085` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1085` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1085`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1086 TD2_BOOT_PROBE_TRACE_START_FRAME=1078 TD2_BOOT_PROBE_TRACE_END_FRAME=1085 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1085 tools/out/visual_contract_frame1085_live_probe.json --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1085_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01085_frame.png tools/out/mesen_frame1085/main_visible.ppm --diff-out tools/out/mesen_frame1085_vs_intro1085_diff.ppm`
  - `74` mismatched pixels (`0.129046%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1085/vram.bin tools/out/mesen_frame1085/cgram.bin tools/out/mesen_frame1085/ppu_state.json tools/out/mesen_frame1085_mode7ppu.ppm --oam tools/out/mesen_frame1085/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1085_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1085/main_visible.ppm tools/out/mesen_frame1085_mode7ppu.ppm --diff-out tools/out/mesen_frame1085_mode7ppu_vs_mesen1085_diff.ppm`
  - `69` mismatched pixels (`0.120326%`)

Current reading:

- `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops over `1078..1085`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1078..1085`
- producer domains now collapse to a single late `01:9FE5` OAM family:
  - OAM domain: `4368` writes across frames `1078..1085`
    - dominant callsites: `00:824F` / `00:8257`
  - no sampled VRAM writes fire in the bounded `1078..1085` trace window
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1085/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the eleventh direct bridge-extracted `1078..1085` block is now closed by
    live ownership evidence at its end
  - compared with `1077`, the narrow VRAM pulse disappears entirely, leaving a
    pure-OAM ownership block under the same callback family
  - the screenshot-backed and Python `mode7-ppu` gaps now both land in the
    high double digits inside the same callback family

Next best step:

- extend the same live ownership surface to frame `1093`, which closes the
  next direct bridge-extracted `1086..1093` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-68: Frame `1093` now closes the direct bridge-extracted `1086..1093` ownership block

- Extended the live ownership surface through the twelfth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1093`
  - ran a bounded live write-point trace for the whole `1086..1093` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1093` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1093`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1094 TD2_BOOT_PROBE_TRACE_START_FRAME=1086 TD2_BOOT_PROBE_TRACE_END_FRAME=1093 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1093 tools/out/visual_contract_frame1093_live_probe.json --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1093_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01093_frame.png tools/out/mesen_frame1093/main_visible.ppm --diff-out tools/out/mesen_frame1093_vs_intro1093_diff.ppm`
  - `207` mismatched pixels (`0.360979%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1093/vram.bin tools/out/mesen_frame1093/cgram.bin tools/out/mesen_frame1093/ppu_state.json tools/out/mesen_frame1093_mode7ppu.ppm --oam tools/out/mesen_frame1093/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1093_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1093/main_visible.ppm tools/out/mesen_frame1093_mode7ppu.ppm --diff-out tools/out/mesen_frame1093_mode7ppu_vs_mesen1093_diff.ppm`
  - `129` mismatched pixels (`0.224958%`)

Current reading:

- `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops over `1086..1093`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1086..1093`
- producer domains remain inside a single late `01:9FE5` OAM family:
  - OAM domain: `4368` writes across frames `1086..1093`
    - dominant callsites: `00:824F` / `00:8257`
  - no sampled VRAM writes fire in the bounded `1086..1093` trace window
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1093/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the twelfth direct bridge-extracted `1086..1093` block is now closed by
    live ownership evidence at its end
  - the pure-OAM ownership shape survives again, but the screenshot-backed gap
    now jumps sharply while the callback family still stays flat
  - `1093` is now the promoted bridge-visible frontier for this callback
    family

Next best step:

- pivot from ownership extension to the post-`1093` composition/export nuance:
  explain why the already-documented `1094..1101` visible-state pass still
  explodes the `main_visible` compare instead of closing it
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-69: The late `01:9FE5` window now has a consolidated callback/state range summary (`986..1093`)

- Promoted the existing per-frame live ownership proofs into one reproducible
  range artifact instead of leaving the window split across `16` isolated frame
  contracts.
- Extended the visual-contract builders so the per-frame contract can now carry
  the matching probe frame's callback/state snapshot, and the range builder can
  now map per-frame probes with `--probe-pattern`.
- Built a consolidated range index over the already-promoted late intro frames:
  - `986`, `990`, `994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`,
    `1045`, `1053`, `1061`, `1069`, `1077`, `1085`, `1093`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`
- produced artifacts:
  - `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`
  - `rom_analysis/docs/intro_01_9fe5_window_986_1093.md`

Current reading:

- the sampled late window stays on one callback family for every promoted frame:
  - main callback: `01:9FE5`
  - IRQ callback: `00:835F`
- the visible presentation surface also stays fixed:
  - `bgMode = 7`
  - main-screen layers: `bg1` only
- visible OBJ growth is now explicit as one progression instead of separate
  frame notes:
  - `0` sprites at `986`
  - `5` at `990`
  - `19` at `994`
  - `32` at `998`
  - `53` at `1005`
  - `61` from `1013` through `1093`
- the later state ramp is now explicit in one timeline:
  - `$0206` stays `0` through `1021`
  - then rises `1,3,5,7,9,11,13` from `1029` through `1077`
  - `$040A` rises `6,8,10,12,14,16,17` over the same sampled frames
  - `$0054` plateaus at `128` from `1077` through `1093`
- producer ownership remains late-window-local:
  - distinct producer domains across the whole range: `oam`, `vram`
  - sampled frames with no `vram` domain: `1029`, `1085`, `1093`
- practical reading:
  - the `986..1093` surface is now strong enough to serve as the current
    callback-family anchor for the late attract path
  - the next unresolved question is no longer "what family is this?"
  - it is "what changes after `1093` that breaks the already-closed ownership
    story into a worse final-screen compare?"

Next best step:

- keep the timed-input `7051` path parked
- use the consolidated `986..1093` range summary as the source of truth while
  explaining the post-`1093` composition/export nuance and the `1094..1101`
  mismatch jump

### CP-70: The first post-`1093` continuation block is now reduced to an export/composition problem (`1094..1101`)

- Built a matching visual-contract range for the first failing continuation
  block after the promoted `1093` frontier.
- Measured the actual exported surface against the visible surface and the two
  current render candidates instead of treating `ppu_state_visible.json` as an
  assumed fix.

Evidence:

- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1094_1101_v1 tools/out/visual_contract_range_1094_1101 --provenance-json rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc --clean-out`
- per frame `1094..1101`:
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state.json ...`
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state_visible.json ...`
  - `python3 tools/compare_frames.py ...`
- produced artifacts:
  - `tools/out/visual_contract_range_1094_1101/visual_contract_range.json`
  - `tools/out/post_1093_compare/summary.json`
  - `tools/out/post_1093_compare/summary.md`
  - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`

Current reading:

- `1094..1101` keeps the same late visible surface shape:
  - `bgMode = 7`
  - main-screen layers: `bg1`
  - visible OBJ count: `61`
- the visible export boundary is now explicit:
  - `main.ppm` is `256x239`
  - `main_visible.ppm` is exactly the top `224` lines of `main.ppm` for all
    `8` frames
  - the bottom `224`-line crop diverges by `13155..14143` pixels, so it is
    not the right comparison surface
- only two sampled Mode 7 fields differ between `ppu_state.json` and
  `ppu_state_visible.json`:
  - `ppu.mode7.matrix[0]`
  - `ppu.mode7.matrix[3]`
- visible-state substitution is now directly falsified:
  - base render vs `main_visible.ppm` lands at `177..574` mismatched pixels
  - visible-state render vs `main_visible.ppm` lands at `362..5930`
    mismatched pixels
- practical reading:
  - callback/layer/OBJ continuity is not the blocker after `1093`
  - export surface selection is now explained
  - the remaining open issue is the narrower render/composition behavior after
    the `1093 -> 1094` boundary

Next best step:

- keep the timed-input `7051` path parked
- use the active-trace follow-up to split the continuation into:
  - `1102..1113`
  - `1114..1117`
- test whether the residual mismatch tracks:
  - the `01:9FE5 -> 00:8029` callback switch at `1102`
  - the disappearance of the per-frame `00:0700 -> OAMDATA` DMA at `1114`
- do not keep searching for hidden direct `VRAM/CGRAM` uploads in this window
  unless a new targeted trace contradicts the current proof

### CP-71: `DOOM-FX` now has a local architecture reference note

- Cloned `https://github.com/RandalLinden/DOOM-FX` into the ignored local
  workspace `.external/DOOM-FX` and kept it out of repo status noise via
  `.git/info/exclude`.
- Read the external repo as a comparative SNES production reference instead of
  treating it as a direct porting source for `Test Drive II`.
- Added a local note:
  - `rom_analysis/docs/doom_fx_reference.md`

Evidence:

- file makeup from `.external/DOOM-FX/source`:
  - `.i`: `189`
  - `.a`: `167`
  - `.rev`: `161`
  - `.asm`: `59`
  - `.c`: `8`
- key architectural sources:
  - `.external/DOOM-FX/source/xfer.i`
  - `.external/DOOM-FX/source/xfer.a`
  - `.external/DOOM-FX/source/rlgsu.a`
  - `.external/DOOM-FX/source/rlirq.a`
  - `.external/DOOM-FX/source/rlram1.a`
  - `.external/DOOM-FX/source/rlram7.a`
  - `.external/DOOM-FX/source/title.a`
  - `.external/DOOM-FX/source/rlstatus.a`
  - `.external/DOOM-FX/source/rldraw.a`
  - `.external/DOOM-FX/source/mkray.c`

Current reading:

- `DOOM-FX` is not primarily a portable-C SNES codebase.
- The reusable value for this repo is architectural:
  - explicit transfer descriptors for `RAM/VRAM/CGRAM` style uploads
  - explicit mirrored shared-state blocks across execution domains
  - explicit phase tables with requirement/post hooks
  - aggressive offline preprocessing instead of runtime table building
- This reinforces the current `PORT_PLAN.md` direction:
  - verified behavior + stable artifacts + native runtime
  - not literal source translation

Next best step:

- keep Lane 2 on the already-open post-`1093` composition/export boundary
- use the `DOOM-FX` note as a design reference when the project is ready to
  promote a first-class transfer schema or stronger callback/phase contracts

### CP-72: `SNESdev Wiki` now has a lane-oriented knowledge bank

- Surveyed `https://snes.nesdev.org/wiki/SNESdev_Wiki` recursively through the
  first-layer hardware/reference pages most relevant to this project and one
  second-layer Mode 7 transform page.
- Added a local knowledge bank:
  - `rom_analysis/docs/snesdev_wiki_knowledge_bank.md`

Evidence:

- core pages reviewed:
  - `Memory map`
  - `ROM header`
  - `CPU vectors`
  - `MMIO registers`
  - `PPU registers`
  - `DMA registers`
  - `Backgrounds`
  - `Tilemaps`
  - `Tiles`
  - `Sprites`
  - `Palettes`
  - `Color math`
  - `Init code`
  - `VBlank interrupts`
  - `DMA examples`
  - `VBlank routine`
  - `HDMA examples`
  - `Reading and writing PPU memory`
  - `Controller reading`
  - `Standard controller`
  - second-layer follow-up: `Mode 7 transform`

Current reading:

- the wiki strongly validates the current repo direction:
  - extraction + validation + native runtime
  - not direct source translation
- the most useful pages for active work are not general tutorials:
  - `VBlank routine`
  - `Reading and writing PPU memory`
  - `PPU registers`
  - `Tilemaps`
  - `Sprites`
- the strongest conceptual fit is the producer/consumer model:
  - main-loop state preparation
  - shadow variables / buffers / queues
  - bounded NMI/VBlank upload windows
- the survey also sharpens several renderer/archeology warnings:
  - `CGRAM/OAM` write-twice semantics matter
  - OAM correctness is affected by `OBJSEL`, rotation, and per-line limits, not
    just by raw `544`-byte dumps
  - Mode 7 should be treated as base transform plus optional scanline-time
    modulation and color-math interaction

Next best step:

- keep the current lane order unchanged
- use the new knowledge bank as a hardware-reference companion while Lane 2
  continues through the post-`1093` composition/export boundary and while Lane
  4 later formalizes producer/consumer contracts around NMI-visible surfaces

### CP-73: The post-`1093` late-attract window now has an active Mesen behavior trace (`1094..1117`)

- Added a new builder:
  - `tools/build_mesen_activity_trace.py`
- Captured a bounded live probe window with `DMA`, direct `VRAM/CGRAM`, and
  `Mode 7` tracing enabled.
- Added the current reading note:
  - `rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`

Evidence:

- capture command:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1094_1117/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1118 TD2_BOOT_PROBE_TRACE_START_FRAME=1094 TD2_BOOT_PROBE_TRACE_END_FRAME=1117 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
- normalization command:
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1094_1117/td2_boot_probe.json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md`
- produced artifacts:
  - `tools/out/activity_trace_1094_1117/activity_trace.json`
  - `tools/out/activity_trace_1094_1117/activity_trace.md`
  - `rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`

Current reading:

- there are no direct `VRAM/CGRAM` data writes in `1094..1117`
  - `td2_boot_probe_vram_writes.json` records `0` writes
  - normalized direct-write events: `0`
- there is exactly one repeated `OAM` DMA per frame through `1113`
  - channel `1`
  - `DMAEN = 0x02`
  - target `00:2104` (`OAMDATA`)
  - source `00:0700`
  - size `544` bytes
  - scanline `227`
- that DMA disappears entirely at `1114..1117`
- the callback-family switch is now explicit:
  - `1094..1101`: `01:9FE5`
  - `1102..1117`: `00:8029`
- the sampled state tuple stays stable across that switch:
  - `$0204 = 1`
  - `$0206 = 13`
  - `$040A = 17`
  - `$0054 = 128`
- the `Mode 7` program narrows after `1101`
  - `1094..1101`: scanlines `225`, `226`, `227`, and `231`, including `M7A/M7D`
  - `1102..1117`: scanlines `225`, `226`, `227` only, with no `M7A/M7D`

Practical reading:

- the continuation after `1093` is not one homogeneous block
- the next useful boundaries are now:
  - `1102`
  - `1114`
- the next compare/composition pass should stop treating `1102..1117` as one
  unit and should stop searching for hidden direct `VRAM/CGRAM` uploads in
  this window unless a new targeted trace contradicts the current proof

### CP-74: The `00:8029` continuation is now closed as one stable surface with one remaining compare plateau (`1102..1117`)

- Extended the visual-contract builders:
  - `tools/build_mesen_visual_contract.py`
  - `tools/build_mesen_visual_contract_range.py`
  - both now accept `--activity-trace-json`
- Added a reusable compare-summary builder:
  - `tools/build_mesen_window_compare.py`
- Added the current reading note:
  - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`

Evidence:

- activity-merged range contracts:
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1102_1109_v1 tools/out/visual_contract_range_1102_1109_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1110_1117_v1 tools/out/visual_contract_range_1110_1117_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
- compare summary:
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117/summary.md`
- canonical plateau analysis:
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`
- produced artifacts:
  - `tools/out/visual_contract_range_1102_1109_activity/visual_contract_range.json`
  - `tools/out/visual_contract_range_1110_1117_activity/visual_contract_range.json`
  - `tools/out/post_1093_compare_1102_1117/summary.json`
  - `tools/out/post_1093_compare_1102_1117/summary.md`
  - `tools/out/mode7_plateau_1105/analysis.json`
  - `tools/out/mode7_plateau_1105/analysis.md`
  - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`

Current reading:

- `1102..1117` keeps the same visible surface:
  - `bgMode = 7`
  - main-screen layer `bg1`
  - `61` visible sprites
  - main callback `00:8029`
- the export surface explanation now survives through the whole tail:
  - `main_visible.ppm` is the top `224` lines of `main.ppm` on every frame
  - bottom-crop compare stays bad (`14901..21300` mismatched pixels)
- the internal activity split is narrower than the visible surface split:
  - `1102..1113`: `1` per-frame `OAM` DMA, no direct `VRAM/CGRAM` writes,
    `3` `Mode 7` events / `16` writes
  - `1114..1117`: no DMA, still no direct `VRAM/CGRAM` writes, same `Mode 7`
    event shape
- visible-state `Mode 7` substitution is only still wrong at:
  - `1102..1104`
- by `1105`, the base and visible-state matrices already agree
  (`matrix[0]/matrix[3] = 256/257`)
- the remaining renderer gap is now one stable plateau:
  - `1105..1117` -> `2698` mismatched pixels against `main_visible.ppm`
- the updated compare summary now proves that plateau is exactly the same
  spatial/content diff on every frame `1105..1117`:
  - same diff-mask hash
  - same diff payload hash
  - same bounding box `24,68 -> 232,138`
- the same compare artifact now also proves that from `1105..1117`:
  - `main_visible.ppm` is byte-identical
  - `vram.bin` is byte-identical
  - `oam.bin` is byte-identical
  - `ppu_state.json` is byte-identical
  - only `cgram.bin` keeps changing frame to frame
- canonical frame-`1105` object checks now read:
  - `mode7-ppu`: `2698` mismatched pixels
  - `simple`: `2698`
  - no-`OAM`: `9717`
- the new canonical plateau analyzer now adds:
  - `bg1_visible.ppm` is also byte-identical from `1105..1117`
  - no-`OAM` vs `bg1_visible.ppm`: `3982` mismatched pixels
  - BG-only diff box: `24,67 -> 232,138`
  - only `4` sprites touch the main plateau diff box
  - their combined coverage there is just `128 / 14839` pixels
    (`0.862592%`)
  - a whole-box horizontal shift of `-1` improves the BG-only compare
    `3982 -> 3611`
  - a direct `ppu.mode7.hscroll +1` perturbation also improves the BG-only
    compare `3982 -> 3613`
  - but the same perturbation worsens the full-scene compare
    `2698 -> 2780`
  - per-row best-shift counts still favor `-1` on `38` rows

Practical reading:

- the late `00:8029` continuation no longer looks like an ownership or upload
  mystery
- the best current Lane 2 frontier is the static `1105..1117` `Mode 7/BG1`
  plateau, not sprite ownership
- the `1114` `OAM DMA` shutdown is now proven not to be the cause of that
  plateau
- the remaining narrowing now points away from an OBJ-renderer fork and toward
  fixed `Mode 7/BG1` horizontal sampling, rounding, or edge semantics inside
  one canonical static scene
- the `hscroll +1` result is now a useful clue about the coordinate path, but
  not a drop-in fix

### CP-75: Doc-driven `Mode 7` narrowing demotes `M7SEL` edge handling on canonical `1105`

- Added doc/reference checkpoint:
  - `rom_analysis/docs/mode7_1105_validation_reference.md`
- Extended plateau builder:
  - `tools/build_mode7_plateau_analysis.py`
  - now reports explicit `Mode 7` sampling stats for the plateau bboxes
- Rebuilt canonical plateau artifact:
  - `tools/out/mode7_plateau_1105/analysis.json`
  - `tools/out/mode7_plateau_1105/analysis.md`

Validation:

- `python3 -m py_compile tools/build_mode7_plateau_analysis.py`
- `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`

Current reading:

- the external doc/source cross-check now agrees on the important core point:
  - the repo renderer already follows the same operational `Mode 7` shape used
    by `fullsnes` and `Mesen-S`
- the canonical plateau state keeps these features inactive:
  - `EXTBG`
  - direct color
  - color math
  - subscreen layering
- the new sampling stats now prove the plateau bbox never touches the outside-map
  path at all:
  - main bbox `24,68 -> 232,138`: `outsideMapPixels = 0`
  - BG bbox `24,67 -> 232,138`: `outsideMapPixels = 0`
  - best tested BG-only `hscroll +1` variant: still `outsideMapPixels = 0`
- concrete sample ranges on the BG bbox:
  - base `hscroll = 0`: `x = 24..232`, `y = 65..137`
  - best tested BG-only `hscroll = +1`: `x = 25..233`, `y = 65..137`

Practical reading:

- `M7SEL` outside-map fill/transparent behavior is no longer a leading suspect
  for the canonical plateau
- the next highest-value renderer checks are now:
  - X-origin / first-pixel placement
  - visible-latched `M7HOFS/M7VOFS` timing
  - only then residual full-scene composition outside the BG-only box

### CP-76: Exact-hit first-pixel audit promotes `screenY + 1` to the leading plateau fix

- Added exact-hit source note:
  - `rom_analysis/docs/mode7_1105_exact_hit_sources.md`
- Added first-pixel audit tool:
  - `tools/build_mode7_first_pixel_audit.py`
- Added plateau audit note:
  - `rom_analysis/docs/mode7_plateau_first_pixel_audit.md`
- Added canonical audit artifacts:
  - `tools/out/mode7_first_pixel_1105/audit.json`
  - `tools/out/mode7_first_pixel_1105/audit.md`
- Added plateau-tail confirmation artifacts:
  - `tools/out/mode7_plateau_1117/analysis.json`
  - `tools/out/mode7_plateau_1117/analysis.md`
  - `tools/out/mode7_first_pixel_1117/audit.json`
  - `tools/out/mode7_first_pixel_1117/audit.md`

Validation:

- `python3 -m py_compile tools/build_mode7_first_pixel_audit.py`
- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1105/analysis.json tools/out/mode7_first_pixel_1105/audit.json --markdown-out tools/out/mode7_first_pixel_1105/audit.md`
- `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1117/analysis.json --canonical-frame 1117 --markdown-out tools/out/mode7_plateau_1117/analysis.md`
- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_first_pixel_1117/audit.json --markdown-out tools/out/mode7_first_pixel_1117/audit.md`

Current reading:

- focused visible-state `Mode 7` deltas are absent on both tested plateau ends:
  - `ppu_state.json`
  - `ppu_state_visible.json`
  - no focused `Mode 7` key differs in either audit
- `increment-before-sample` and `X-origin +1` collapse to the same result on
  this plateau state:
  - full scene `2780`
  - BG-only `3613`
  - equivalence is expected here because the canonical plateau keeps
    `M7A = 256` and `M7C = 0`
- the first tested rule that actually closes the composed scene is
  `screenY + 1`:
  - frame `1105`: full-scene compare `2698 -> 0`
  - frame `1117`: full-scene compare `2698 -> 0`
- the same rule does **not** close the isolated layer export:
  - `bg1_visible` compare improves `3982 -> 2271`
  - so the composed-screen fix and the isolated-layer export mismatch are now
    separate questions

Practical reading:

- the static plateau is no longer best read as an `M7HOFS/M7VOFS`
  visible-latch problem
- the strongest renderer candidate is now the scanline-start term used by the
  composed-screen `Mode 7` path
- the next defensible step is to promote the `screenY + 1` candidate into the
  renderer/compare path and then re-check `1102..1104` plus the isolated
  `bg1_visible` export semantics

### CP-77: Vertical line-origin source pass isolates the remaining `Y` conflict

- Added focused source note:
  - `rom_analysis/docs/mode7_line_origin_y_sources.md`
- Updated plateau audit note:
  - `rom_analysis/docs/mode7_plateau_first_pixel_audit.md`

Validation:

- source-only checkpoint; no local runtime/tool behavior changed

Current reading:

- under the stricter allowed-source filter:
  - `fullsnes` is the only explicit `line + 1` hardware-oriented source
  - `Mesen-S` is the only allowed implementation comparison and uses
    current-line `Y`
  - `SNESdev` confirms only that `M7SEL` owns vertical flip and `M7Y` is the
    center term
  - the public `snes-test-roms` surface still has no dedicated first-visible-
    line `Mode 7` test for this question
  - indirect timing surfaces now also exist but stay below proof level:
    - the NESdev `93143` discussion suggests per-line preprocessing and a
      "current state for the line" mental model for `Mode 7`
    - `SNESdev` `HDMA_examples` proves scanline-level timing/latch hazards are
      real for write-twice PPU state, including `M7A`
- the allowed sources still agree on the ordering around `Y`:
  - choose one scanline `Y`
  - apply vertical mirroring before the transform contribution
  - keep that `Y` shared across the scanline while `X` advances per pixel

Practical reading:

- the plateau result `screenY + 1 -> 0 mismatched pixels` is still not a blind
  tweak; it matches the only explicit `line + 1` hardware-oriented source we
  have under the strict filter
- but the stricter pass also proves the renderer frontier is still an explicit
  unresolved conflict, not a settled hardware fact
- the next step should therefore promote the `line + 1` candidate carefully,
  while preserving the tie in the docs until a hardware-oriented proof surface
  breaks it

### CP-78: Frame-`300` regolden keeps the builder exact and the old SDL runtime gap unchanged

- Re-tested the promoted frame-`300` credits scene against the current local
  worktree without touching the existing committed builder artifacts:
  - `python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene_regolden_20260322`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_vs_mesen_diff.ppm`
  - `python3 tools/render_mesen_snes_bg.py tools/out/bank1_credits_scene_regolden_20260322_vram.bin tools/out/bank1_credits_scene_regolden_20260322_cgram.bin tools/out/bank1_credits_scene_regolden_20260322_ppu_state.json tools/out/bank1_credits_scene_regolden_20260322_python.ppm`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322_python.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_python_vs_mesen_diff.ppm`
  - `make -C port`
  - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --headless --snes-bg-prefix ./tools/out/bank1_credits_scene_regolden_20260322 --frames 1 --dump-prefix ./port/build/credits_regolden_20260322`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_mesen_diff.ppm`
  - `python3 tools/compare_frames.py tools/out/bank1_credits_scene_regolden_20260322.ppm port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_builder_diff.ppm`
- New evidence:
  - all canonical frame-`300` screenshot PNGs still hash to the same payload:
    - `tools/out/td2_boot_probe_frame_300.png`
    - `tools/out/frame300_live_probe/td2_boot_probe_frame.png`
    - `tools/out/frame300_live_probe_cap2048/td2_boot_probe_frame.png`
    - `tools/out/frame300_live_probe_fulltrace/td2_boot_probe_frame.png`
  - rebuilt ROM-side credits scene stays exact:
    - screenshot vs `bank1_credits_scene_regolden_20260322.ppm`: `0`
      mismatched pixels
  - Python renderer stays exact on the rebuilt artifacts:
    - screenshot vs `bank1_credits_scene_regolden_20260322_python.ppm`: `0`
      mismatched pixels
    - rebuilt builder PPM vs Python renderer PPM: `0` mismatched pixels
  - SDL runtime output is unchanged from the old local gap:
    - screenshot vs `port/build/credits_regolden_20260322_00000.ppm`:
      `7244` mismatched pixels (`12.632533%`)
    - builder PPM vs the same runtime dump: `7244` mismatched pixels
    - mismatch bbox: `16,56 -> 222,167`
    - the newly generated diff files are byte-identical to the pre-existing
      `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`
    - the runtime output hash matches the older local `credits_native*` dumps
- Practical reading:
  - the frame-`300` golden point itself has not regressed
  - the exact solved surface still covers:
    - captured screenshot
    - ROM-side builder
    - Python SNES BG renderer
  - the SDL runtime still carries the same historical credits-scene gap, so
    frame `300` should not be described as a zero-diff runtime parity milestone
  - no roadmap pivot is justified from this retest; the active Lane 2 gate
    remains the late `Mode 7/BG1` scanline-start semantics around `1102..1117`

### CP-79: Controlled `line + 1` promotion closes the whole composed-screen window and leaves BG1 isolated

- Promoted the `screenY + 1` hypothesis into the Python renderer-side compare
  path without touching the dirty SDL runtime worktree:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_mesen_window_compare.py`
  - `tools/build_mode7_plateau_analysis.py`
- New promoted artifacts:
  - `tools/out/post_1093_compare_1102_1117_linebias1/summary.json`
  - `tools/out/post_1093_compare_1102_1117_linebias1/summary.md`
  - `tools/out/mode7_plateau_1105_linebias1/analysis.json`
  - `tools/out/mode7_plateau_1105_linebias1/analysis.md`
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_mesen_window_compare.py tools/build_mode7_plateau_analysis.py`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117_linebias1/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --mode7-line-bias 1 --markdown-out tools/out/post_1093_compare_1102_1117_linebias1/summary.md`
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117_linebias1/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105_linebias1/analysis.json --canonical-frame 1105 --mode7-line-bias 1 --markdown-out tools/out/mode7_plateau_1105_linebias1/analysis.md`
  - direct BG-only spot checks:
    - frame `1102`: `6031 -> 6032` (`line_bias 0 -> 1`)
    - frame `1103`: `6003 -> 5966`
    - frame `1104`: `6353 -> 6176`
    - frame `1105`: `3982 -> 2271`
    - frame `1117`: `3982 -> 2271`
- New evidence:
  - base render vs `main_visible.ppm` with `--mode7-line-bias 1`:
    - `1102`: `838 -> 0`
    - `1103`: `1061 -> 0`
    - `1104`: `1798 -> 0`
    - `1105..1117`: `2698 -> 0`
  - visible-state render vs `main_visible.ppm` with the same bias:
    - `1102`: `6082 -> 6045`
    - `1103`: `5958 -> 5951`
    - `1104`: `6292 -> 6066`
    - `1105..1117`: `2698 -> 0`
  - updated canonical `1105` plateau analysis now survives the zero-diff
    composed-screen case:
    - `mainDiffBBox = none`
    - fallback sampling bbox: `24,67 -> 231,120`
    - `mode7-ppu` with OAM vs `main_visible.ppm`: `0`
    - `simple` with OAM vs `main_visible.ppm`: `0`
    - no-`OAM` vs `main_visible.ppm`: `7019`
    - no-`OAM` vs `bg1_visible.ppm`: `2271`
    - best tested hscroll delta is now `0` for both full-scene and BG-only
- Practical reading:
  - the composed-screen `Mode 7` rule is no longer hypothetical; the regular
    Python compare path now closes the whole `1102..1117` window under
    `line + 1`
  - the surviving `1102..1104` visible-state mismatch is now a narrower
    state-selection issue, not evidence against the promoted composed-screen
    rule
  - the active Lane 2 frontier has moved again:
    - no longer "which scanline-start term closes the scene?"
    - now "should `line + 1` become default renderer behavior, and what still
      explains the isolated `bg1_visible`/layer-export mismatch that remains
      after the scene is closed?"

### CP-80: Sampled regression sweep makes `line + 1` look broader than the late `00:8029` slice

- Ran a bounded direct render/compare sweep with `render_mesen_snes_bg.py` plus
  `compare_frames.py` over known `Mode 7` anchors, testing both
  `--mode7-line-bias 0` and `--mode7-line-bias 1`:
  - `978`
  - `982`
  - `986`
  - `990`
  - `994`
  - `1080`
  - `1200`
- New evidence:
  - frame `978`: `4 -> 0`
  - frame `982`: `4 -> 1`
  - frame `986`: `270 -> 266`
  - frame `990`: `1641 -> 1638`
  - frame `994`: `3232 -> 3228`
  - frame `1200`: `5249 -> 2551`
  - frame `1080`: `14813 -> 14816`
- Practical reading:
  - the `line + 1` rule is no longer only a plausible fix for the late
    `1102..1117` continuation
  - sampled anchors now show it is either beneficial or effectively neutral on
    every tested `Mode 7` frame except one tiny `+3` regression on the still-
    unsolved frame `1080`
  - that makes the next renderer decision much more concrete:
    - promotion to the default Python `Mode 7` path is now a defensible
      engineering move
    - but the strict hardware-proof tie (`fullsnes` vs `Mesen-S`) is still
      unresolved, so keeping `--mode7-line-bias 0` as an explicit escape hatch
      would still be prudent if that promotion happens

### CP-81: `line + 1` is now the official Python `Mode 7` rule, with SDL deferred behind a dirty-runtime boundary

- Compared the two active methods in the clean tooling path:
  - legacy current-line default (`--mode7-line-bias 0`)
  - promoted `line + 1` default (`--mode7-line-bias 1`)
- Promoted `line + 1` into the default Python renderer/builders without
  touching the dirty SDL runtime file:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_mesen_window_compare.py`
  - `tools/build_mode7_plateau_analysis.py`
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_mesen_window_compare.py tools/build_mode7_plateau_analysis.py`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117_default/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117_default/summary.md`
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117_default/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105_default/analysis.json --canonical-frame 1105 --markdown-out tools/out/mode7_plateau_1105_default/analysis.md`
  - metadata-scrubbed compare against the earlier explicit `--mode7-line-bias 1`
    artifacts:
    - compare summary: identical after dropping path/timestamp-only fields
    - plateau analysis: identical except for the expected `compareSummaryPath`
      rebinding to the new default summary
- New evidence:
  - the no-flag default compare summary now reports the same operational
    closure as the earlier explicit `line + 1` run:
    - base render vs `main_visible.ppm`: `0` across `1102..1117`
    - visible-state render vs `main_visible.ppm`: `6045/5951/6066/0`
      at `1102/1103/1104/1105..1117`
  - the no-flag canonical plateau analysis now reports the same solved
    composed-screen read:
    - `mode7LineBias = 1`
    - `mainVisibleCompare.mode7PpuMismatchPixels = 0`
    - `bg1VisibleCompare.mismatchPixels = 2271`
    - sampling bbox unchanged: `24,67 -> 231,120`
  - practical comparison with the older current-line method remains the same as
    the prior sweep:
    - `978`: `4 -> 0`
    - `982`: `4 -> 1`
    - `986`: `270 -> 266`
    - `990`: `1641 -> 1638`
    - `994`: `3232 -> 3228`
    - `1200`: `5249 -> 2551`
    - `1080`: `14813 -> 14816`
- Practical reading:
  - the project now has one official `Mode 7` rule for the active evidence path:
    - Python renderer/builders default to `line + 1`
    - `--mode7-line-bias 0` remains available only for counterfactual runs
  - that choice is strong enough for the rest of Lane 2 because it reproduces
    the earlier explicit solved artifacts and keeps the only known downside to
    a tiny `+3` change on still-unsolved frame `1080`
  - the same rule is **not** yet promoted into the SDL runtime:
    - `port/src/td2_ppu.c` is already dirty from another process
    - changing it here would mix a policy decision with unrelated runtime work
  - the active frontier therefore stays narrow:
    - keep using the new default Python rule
    - isolate the remaining `bg1_visible` mismatch
    - revisit SDL promotion only after the runtime file is clean

### CP-82: Shared `td2_ppu.c` was patchable after all; the real validation trap was the default sequence manifest

- Re-audited the active worktree conflict around `port/src/td2_ppu.c`.
- File-level reading:
  - the other-process delta in `td2_ppu.c` touches:
    - layer-state JSON loading
    - ad hoc BG debug logging
  - it does **not** overlap the `render_snes_mode7_scene()` line-origin block
    at `screen_y -> real_y`
- Promoted the same `line + 1` rule into the shared SDL runtime with a
  surgical patch in `render_snes_mode7_scene()`:
  - `line_y = screen_y + 1`
  - `real_y = vertical_mirroring ? (255 - line_y) : line_y`
- Validation:
  - `make -C port`
  - isolated runtime renders, explicitly suppressing the default intro-loop
    manifest with `--sequence /dev/null`:
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1102 --snes-bg-vram ./tools/out/mesen_range_1102_1109_v1/frame_01102/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1102_1109_v1/frame_01102/cgram.bin --snes-bg-state ./tools/out/mesen_range_1102_1109_v1/frame_01102/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1102_1109_v1/frame_01102/oam.bin`
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1105 --snes-bg-vram ./tools/out/mesen_range_1102_1109_v1/frame_01105/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1102_1109_v1/frame_01105/cgram.bin --snes-bg-state ./tools/out/mesen_range_1102_1109_v1/frame_01105/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1102_1109_v1/frame_01105/oam.bin`
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1117 --snes-bg-vram ./tools/out/mesen_range_1110_1117_v1/frame_01117/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1110_1117_v1/frame_01117/cgram.bin --snes-bg-state ./tools/out/mesen_range_1110_1117_v1/frame_01117/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1110_1117_v1/frame_01117/oam.bin`
  - compares against extracted `main_visible.ppm`:
    - `1102`: `0`
    - `1105`: `0`
    - `1117`: `0`
  - temporary `HEAD` rebuild for control:
    - built `/tmp/td2_port_head` from `HEAD:port/src/td2_ppu.c`
    - same isolated scene path remains at:
      - `1102`: `838`
      - `1105`: `2698`
- Practical reading:
  - the shared-file conflict was weaker than it looked:
    - the other process was active in the same file, but not in the same
      semantic block
    - the runtime patch could be merged isonomically without reverting or
      trampling those edits
  - the earlier near-full-screen mismatch was a validation trap, not a runtime
    regression:
    - `td2_port` auto-loads the default intro sequence unless told otherwise
    - isolated `--snes-bg-*` validation must therefore neutralize that path
      with `--sequence /dev/null` (or another empty manifest)
  - the remaining Lane 2 frontier is again the BG-only/export side, not a
    worktree blocker in the runtime file

### CP-83: Bounded export audit demotes more local `Mode 7` tweaks as the explanation for `bg1_visible`

- Added a dedicated bounded export-side audit:
  - `tools/build_mode7_bg1_export_audit.py`
- Promoted artifacts:
  - `tools/out/mode7_bg1_export_audit_1105/audit.json`
  - `tools/out/mode7_bg1_export_audit_1105/audit.md`
  - `tools/out/mode7_bg1_export_audit_1117/audit.json`
  - `tools/out/mode7_bg1_export_audit_1117/audit.md`
  - `rom_analysis/docs/mode7_bg1_export_semantics.md`
- Validation:
  - `python3 -m py_compile tools/build_mode7_bg1_export_audit.py`
  - `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1105_default/analysis.json tools/out/mode7_bg1_export_audit_1105/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1105/audit.md`
  - `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_bg1_export_audit_1117/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1117/audit.md`
- Audit grid:
  - plateau endpoints `1105` and `1117`
  - `36` models per endpoint
  - swept dimensions:
    - `yLineBias = 0/1`
    - `xOriginBias = -1/0/1`
    - `hscrollBias = -1/0/1`
    - sample order `pre/post`
- New evidence:
  - both endpoints agree exactly
  - best BG-only overall:
    - `base_y+1_x+0_h+0_pre`
    - BG-only `2271`
    - main `0`
  - best BG-only with `main = 0` is the same model
  - `5 / 36` models keep the composed scene at `0`
  - none of those `5` models improves the BG-only export below `2271`
  - tied `main = 0` family:
    - `base_y+1_x+0_h+0_pre`
    - `base_y+1_x-1_h+0_post`
    - `base_y+1_x+0_h-1_post`
    - `base_y+1_x-1_h+1_pre`
    - `base_y+1_x+1_h-1_pre`
    - all still land at BG-only `2271`
- Practical reading:
  - once the composed scene is already solved, the remaining `bg1_visible`
    gap is stable against the obvious next local `Mode 7` perturbations
  - that makes the frontier sharper:
    - stop expecting one more small renderer-side `Mode 7` tweak to close the
      layer export
    - treat `layers/bg1_visible.ppm` as a separate export-surface semantics
      problem instead

### CP-84: Visible-crop audit closes the late-attract `bg1_visible` extractor question

- Added extractor-semantic audit tool:
  - `tools/build_mesen_visible_crop_audit.py`
- Promoted artifacts:
  - `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json`
  - `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`
  - `rom_analysis/docs/mode7_bg1_export_semantics.md`
- Validation:
  - `python3 -m py_compile tools/build_mesen_visible_crop_audit.py`
  - `python3 tools/build_mesen_visible_crop_audit.py tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json tools/out/design_mesen_range_1102_1109_v1/frame_01102 tools/out/design_mesen_range_1102_1109_v1/frame_01105 tools/out/design_mesen_range_1110_1117_v1/frame_01117 --markdown-out tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`
- Source cross-check:
  - `tools/mesen_ppu_extract/Program.cs` writes the full `GetTilemap(...)`
    layer render first and then derives `*_visible.ppm` via:
    - `NormalizeScroll(info.ScrollX, size.Width)`
    - `NormalizeScroll(info.ScrollY, size.Height)`
    - `CropVisibleRegion(...)`
- New evidence:
  - frames `1102`, `1105`, and `1117` all land at `0` mismatched pixels
    between:
    - committed `layers/bg1_visible.ppm`
    - a local recomputed crop of `layers/bg1.ppm`
  - the audited metadata is stable across those frames:
    - full size `1024x1024`
    - visible size `256x224`
    - raw scroll `0,8191`
    - normalized scroll `0,0`
- Practical reading:
  - the late-attract `bg1_visible` mismatch is now explained concretely as
    bridge/extractor semantics
  - `layers/bg1_visible.ppm` is a viewer-style viewport crop of the full layer
    render, not the exact on-screen `BG1` contribution target
  - for this slice, renderer parity should stay pinned to `main_visible.ppm`
    while `layers/*_visible.ppm` should only be used for viewer/export
    questions
  - the next Lane 2 step should return to later-window continuity beyond
    `1117`, not more local `Mode 7` tweaking against `bg1_visible`

### CP-85: The stable `00:8029` late-attract continuation now extends through `1125`

- Promoted artifacts:
  - `tools/out/design_mesen_range_1118_1125_v1/design_pack_range.json`
  - `tools/out/activity_trace_1118_1125/activity_trace.json`
  - `tools/out/activity_trace_1118_1125/activity_trace.md`
  - `tools/out/visual_contract_range_1118_1125_activity/visual_contract_range.json`
  - `tools/out/post_1117_compare_1118_1125/summary.json`
  - `tools/out/post_1117_compare_1118_1125/summary.md`
  - `rom_analysis/docs/intro_00_8029_post_1117_window_1118_1125.md`
- Validation:
  - `python3 -m py_compile tools/build_mesen_design_pack.py tools/build_mesen_design_pack_range.py tools/build_mesen_visual_contract_range.py tools/build_mesen_window_compare.py`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1121 --end-frame 1125 --step 1 --out-dir tools/out/mesen_range_1118_1125_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1118_1125_v1 tools/out/design_mesen_range_1118_1125_v1 --clean-out`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1118_1125/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1126 TD2_BOOT_PROBE_TRACE_START_FRAME=1118 TD2_BOOT_PROBE_TRACE_END_FRAME=1125 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1118_1125/td2_boot_probe.json tools/out/activity_trace_1118_1125/activity_trace.json --markdown-out tools/out/activity_trace_1118_1125/activity_trace.md`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1118_1125_v1 tools/out/visual_contract_range_1118_1125_activity --probe-json tools/out/activity_trace_1118_1125/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1118_1125/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1118_1125/summary.json tools/out/mesen_range_1118_1125_v1 --activity-trace-json tools/out/activity_trace_1118_1125/activity_trace.json --markdown-out tools/out/post_1117_compare_1118_1125/summary.md`
- Tooling follow-up included in the same turn:
  - `tools/build_mesen_window_compare.py` now tolerates windows that do not
    export `ppu_state_visible.json`; the summary reports visible-state mismatch
    as unavailable instead of throwing on an empty set
- New evidence:
  - sampled frames `1118..1125` all keep the same late-attract behavior:
    - main callback `00:8029`
    - IRQ callback `00:835F`
    - visible surface `bg1` with `61` visible sprites
    - `$0204 = 1`, `$0206 = 13`, `$040A = 17`, `$0054 = 128`
  - producer-side activity also stays flat:
    - DMA events: `0`
    - direct `VRAM/CGRAM` events: `0`
    - `Mode 7` events: `3` per frame
    - `Mode 7` writes: `16` per frame
  - export/composed-scene compare stays solved:
    - top `224` rows of `main.ppm` vs `main_visible.ppm`: `0` mismatched pixels
    - default base render vs `main_visible.ppm`: `0` mismatched pixels
    - bottom-crop compare remains the same non-visible counterexample at
      `21300` mismatched pixels
- Practical reading:
  - the measured `00:8029` continuation is no longer capped at `1117`; it now
    extends at least through `1125`
  - there is still no basis to extend tilemap-to-ROM provenance beyond `1117`
    on carry alone, because this checkpoint closes continuity and renderer
    behavior, not a new runtime chunk anchor
  - the next Lane 2 step should therefore move later than `1125`, not back to
    the resolved `1118..1125` steady block or the demoted `bg1_visible`
    export question

### CP-86: The late `00:8029` tail now has an internal producer boundary at `1164/1165`

- Promoted artifacts:
  - `tools/out/activity_trace_1126_1133/activity_trace.json`
  - `tools/out/activity_trace_1126_1133/activity_trace.md`
  - `tools/out/post_1117_compare_1126_1133/summary.json`
  - `tools/out/post_1117_compare_1126_1133/summary.md`
  - `tools/out/visual_contract_range_1126_1133_activity/visual_contract_range.json`
  - `tools/out/activity_trace_1134_1200/activity_trace.json`
  - `tools/out/activity_trace_1134_1200/activity_trace.md`
  - `tools/out/activity_trace_1164_1172/activity_trace.json`
  - `tools/out/activity_trace_1164_1172/activity_trace.md`
  - `tools/out/post_1117_compare_1164_1172/summary.json`
  - `tools/out/post_1117_compare_1164_1172/summary.md`
  - `tools/out/visual_contract_range_1164_1172_activity/visual_contract_range.json`
  - `rom_analysis/docs/intro_00_8029_post_1125_reactivation_1164_1172.md`
- Validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1126_1133/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1134 TD2_BOOT_PROBE_TRACE_START_FRAME=1126 TD2_BOOT_PROBE_TRACE_END_FRAME=1133 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1126_1133/td2_boot_probe.json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/activity_trace_1126_1133/activity_trace.md`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1126 --end-frame 1133 --step 1 --out-dir tools/out/mesen_range_1126_1133_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1126_1133_v1 tools/out/design_mesen_range_1126_1133_v1 --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1126_1133_v1 tools/out/visual_contract_range_1126_1133_activity --probe-json tools/out/activity_trace_1126_1133/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1126_1133/summary.json tools/out/mesen_range_1126_1133_v1 --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/post_1117_compare_1126_1133/summary.md`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1134_1200/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1201 TD2_BOOT_PROBE_TRACE_START_FRAME=1134 TD2_BOOT_PROBE_TRACE_END_FRAME=1200 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/activity_trace.json --markdown-out tools/out/activity_trace_1134_1200/activity_trace.md`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1164_1172/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1173 TD2_BOOT_PROBE_TRACE_START_FRAME=1164 TD2_BOOT_PROBE_TRACE_END_FRAME=1172 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1164_1172/td2_boot_probe.json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/activity_trace_1164_1172/activity_trace.md`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1164 --end-frame 1172 --step 1 --out-dir tools/out/mesen_range_1164_1172_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1164_1172_v1 tools/out/design_mesen_range_1164_1172_v1 --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1164_1172_v1 tools/out/visual_contract_range_1164_1172_activity --probe-json tools/out/activity_trace_1164_1172/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1164_1172/summary.json tools/out/mesen_range_1164_1172_v1 --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/post_1117_compare_1164_1172/summary.md`
- New evidence:
  - the exact `00:8029` continuation now also closes the next sampled block:
    - `1126..1133` keep `0` top-crop mismatch and `0` base-render mismatch
    - `bg1` stays the only main-screen layer and visible OBJ count stays `61`
    - DMA/direct activity stays flat at `0`, with `Mode 7` activity fixed at
      `3` events and `16` writes per frame
  - the wider frontier probe then narrows the next real change:
    - `1134..1163` remain on the same no-DMA surface under
      `00:8029/00:835F`
    - `1164` steps `state0204: 1 -> 2` and `dp0054: 128 -> 136`
    - `1165` is the first producer-reactivation frame
  - the narrowed `1164..1172` window makes that change concrete:
    - callback family still stays `00:8029/00:835F`
    - exact composed-scene compare still holds at `0` mismatched pixels
    - `1165..1172` renew `00:0700` OAM DMA
    - the first sampled VRAM DMA producers rotate across:
      - `1165` -> `1A:AB58`
      - `1170` -> `1A:ACA0`
      - `1172` -> `1A:AA10`
    - burst frames raise `Mode 7` writes from `16` to `274`
- Practical reading:
  - the next later-window Lane 2 boundary is no longer "where does `00:8029`
    continue?" but "what owns the reactivated `00:8029` producer cycle?"
  - the new boundary at `1164/1165` is a producer-side state/upload change,
    not a callback-family handoff or a composed-scene regression
  - tilemap-to-ROM provenance still stays capped at `1117`, because this
    checkpoint closes continuity and the next upload boundary, not a new direct
    runtime chunk anchor

### CP-87: The late `00:8029` producer cycle now has explicit blob and ownership proof

- Promoted artifacts:
  - `tools/build_mode7_blob_cycle_report.py`
  - `tools/out/mode7_blob_cycle_1134_1200/report.json`
  - `tools/out/mode7_blob_cycle_1134_1200/report.md`
  - `rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- Validation:
  - `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
  - `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`
- New evidence:
  - the new report matches every sampled direct `VMDATA` burst frame in
    `1134..1200` against the same ROM blob label seen on the paired `DMA0`
    source:
    - `AA10`
    - `AB58`
    - `ACA0`
  - the direct burst side alternates only between the two earlier late-attract
    Mode 7 destinations:
    - `VMADD = 0x4920`
    - `VMADD = 0x49A0`
  - `OAM` DMA remains the normal staged path:
    - source `00:0700`
    - size `0x0220`
    - target `OAMDATA`
  - static ownership is now tied to concrete routines:
    - `01:B6E3` advances the late state loop and re-enters `01:9DC6`
    - `01:9DC6` rebuilds the scene/OAM work with repeated `00:9662` calls and
      always ends in `00:95BD`
    - `00:95BD` arms `$096A`
    - the bank-0 NMI path consumes `$096A` and DMAs `$0700 -> OAMDATA`
  - this also links the late `1165+` cycle back to the already-promoted native
    bridge-visible model family:
    - the same `AA10/AB58/ACA0` blobs
    - the same `0x4920/0x49A0` destinations used by
      `build_mode7_source_scene.py`
- Practical reading:
  - the lane no longer has an open "who owns the late `00:8029` producer
    cycle?" question
  - the remaining open question is the later-frame selection/schedule rule that
    chooses which blob lands on which target for native replacement purposes
  - tilemap-to-ROM provenance still stays capped at `1117`, because this turn
    closes producer ownership and blob identity, not a new direct tilemap chunk
    anchor

### CP-88: Lane 2 now has an explicit next-agent handoff after `00:8029` ownership closure

- Promoted artifacts:
  - `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`
- Validation:
  - `git diff --check -- rom_analysis/docs/intro_00_8029_next_agent_handoff.md rom_analysis/docs/next_steps_roadmap.md rom_analysis/docs/progress_checkpoints.md`
- New evidence:
  - the lane now has one direct resume note that pins:
    - what is already closed
    - what should not be reopened
    - which artifacts to read first
    - which experiment should come next
  - the handoff fixes the current frontier explicitly at the later-frame
    selection/schedule rule for `AA10/AB58/ACA0` over `0x4920/0x49A0`, not at
    basic ownership, callback continuity, or `bg1_visible` semantics
  - the handoff also records the exact checkpoint trail to resume from:
    - `6cccf8e`
    - `e4eaada`
    - `87e3167`
- Practical reading:
  - the next agent can resume Lane 2 from one note instead of reconstructing
    the late `00:8029` state from multiple prior turns
  - this turn is documentation-only; it does not change the technical frontier
    beyond making the current boundary and next gate explicit

## Current Checkpoint Metrics

- `L001210` no-input attract probe (`3600` frames):
  - total hits: `34`
  - runtime-confirmed bank30 starts:
    - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800`
  - repeat spacing: `1418` frames
- Alternate scripted input (`start,b`, `4000` frames):
  - total hits: `2` (`02:F51F`, `04:8000`)
  - no bank30 candidates reached
- Matrix v1 (`1500` frames each, `4` scenarios):
  - `poweron_no_input`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `hold_start_b_240_359`: `17` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `pulse_start_240`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `periodic_start_pulses_240_1800`: `17` total hits, `0` bank30 hits
- Matrix v2 (`3200` frames each, `13` scenarios):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenario:
    - `pulse_b_every120`: `81` total hits, `20` bank30 hits (still only `DF6C/E039/E73F/E800`)
- Matrix v3 (`7` scenarios, `45000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - aggregate bank30 hits:
    - `1E:DF6C/E039/E73F/E800`: `7` hits each
  - strongest positive bank30 scenario:
    - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
  - strongest suppression scenario:
    - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits
- Matrix v5 (`12` scenarios, `48000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenarios:
    - `pulse_start_240`, `pulse_start_600`: `8` bank30 hits each
  - strongest suppression scenarios:
    - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
  - aggregate bank30 caller coverage:
    - `01:A9BD`: `22`, `01:A9E1`: `22`
  - no caller hits from `01:B256`, `01:B273`, `01:B59B`
- Matrix v6 (`3` scenarios, `12000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - `L00A9*` index telemetry:
    - observed indices: `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
    - observed bank30-producing indices: `28`, `29`
    - unobserved critical index: `32` (`EE7F`)
    - derivation check: `58/58` matches
- Matrix v7 forced-branch tests (`5` scenarios, `20000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced selector values on bank30 hits:
    - `$1C78/$1C80/$1CA8 = 1/0/2`
  - observed `L00A9*` indices remained:
    - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
  - critical index still absent:
    - `32` (`EE7F`)
  - caller coverage still excludes:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v10a/v10b (`16` scenarios, `117000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - expanded caller coverage reached:
    - `01:8E3C`, `01:8E59`
  - expanded `L00A9*` index set:
    - added `7`, `8`, `9`, `10`, `11`, `22`, `25`
  - bank30-producing indices remained:
    - `28`, `29` only
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v11/v11b (`16` scenarios, `200000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - each scenario remained fixed at:
    - `66` total hits, `12` bank30 hits
  - bank30 selector tuple was constant:
    - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` bank30 hits)
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v12/v12b (`8` scenarios, `72000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
  - `B1F9` execution telemetry:
    - `b1f9_exec_count = 0` across all `v12b` scenarios
- Matrix v13 callback forcing (`5` scenarios, `16000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - callback-only forced scenarios (`01:9568`/`01:95AD`) each produced:
    - `6` total hits, `0` bank30 hits
  - callback+state forced scenarios reached:
    - `b1f9_exec_count = 1` at frame `1201`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v14 `B1F9` stage trace (`3` scenarios, `6600` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced callback+state scenarios still reached:
    - `b1f9_exec_count = 1`
  - `B1F9` stage counters stayed at:
    - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Targeted `B1F9` prologue exec traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - exec trace hits observed only at:
    - `01:B1F9`
  - no hits at:
    - `00:050F`, `00:083F`
    - `01:B202`, `01:B206`
    - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
  - shared entry tuple:
    - `$1C80/$1CA8 = 0/2`, `$1C86 = 1`, `$1D10 = 0x4100`, `$0960 = 0`
  - lane difference:
    - `$0F77 = 1` on forced `01:9568`
    - `$0F77 = 0` on forced `01:95AD`
- Corrected `B1F9` return-window trace (`01:9568`, `2200` frames, window `1200..1202`):
  - observed:
    - `00:82A1` at frame `1200`
    - `01:B1F9` at frame `1201`
  - no hit at:
    - `01:9575`
  - corrected entry read:
    - frame-level forced state still holds `$1C78/$1C80/$1CA8 = 1/0/2`
    - but the `01:B1F9` exec snapshot itself sees `$1CA8 = 3`
  - static caller explanation:
    - `L009568` and `L0095AD` both `inc $1CA8` before `jsr L00B1F9`
- Per-point-capped `B1F9` wait/exit surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed:
    - `01:B1F9` once at frame `1201`
  - no hits at:
    - `01:B226`, `01:B638`, `01:B6E3`, `01:B755`, `01:9575`
  - trace budget note:
    - `exec_point_max_hits_per_point = 1`
    - `exec_point_trace.dropped_hits = 0`
- `B1F9` wait-path WRAM write surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed writes:
    - none
  - trace result:
    - `write_point_trace.hit_count = 0`
    - `write_point_trace.dropped_hits = 0`
  - stable nearby state snapshots:
    - `$0960 = 0`, `$0200 = 0`, `$0202 = 1`, `$1E2C = 0`
    - `$0440/$0442/$0444 = 0/0/0`, `$040A = 0x0011`
- Targeted `B1F9` side-effect traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - both runs reported:
    - `write_point_trace.hit_count = 0`
  - no writes observed at:
    - `00:420C`, `00:2106`, `00:2105`, `00:2107`, `00:2108`, `00:2109`, `00:210B`
    - `00:2101`, `00:212C`, `00:2131`, `00:2130`, `00:212E`, `00:212D`, `00:212F`
    - `00:2123`, `00:2124`, `00:2125`, `7E:0966`, `7E:0968`, `7E:0974`, `00:0F42`
- Targeted `B1F9` stack-return traces:
  - forced `01:9568` lane:
    - `stack_return_rts = 0x9575` (`L009575`)
  - forced `01:95AD` lane:
    - `stack_return_rts = 0x95B7`
  - shared deeper stack word:
    - `0x82A0` (`dispatcher wrapper anchor`, `RTS -> 0x82A1`)
  - practical reading:
    - both forced lanes reach `L00B1F9` through the expected in-bank `jsr`
      call sites under the normal bank-0 callback dispatcher
- Combined caller/index telemetry (`v10a/v10b/v11/v11b`, `32` traces):
  - observed caller PCs:
    - `01:8E3C`, `01:8E59`, `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - bank30 caller PCs:
    - `01:A9BD`: `192`, `01:A9E1`: `192`
  - `L00A9` source derivation consistency:
    - `1645/1645` matches (`0` mismatches)
- Callback/state contracts:
  - `make -C tools callback-contracts-check` -> `18/18` checks passed
  - capture profile used: no-input probe, `1120` frames
- Pixel regression gates:
  - `make -C tools regression-gates REGRESSION_GATES_RENDER_DIR=../port/build/regression_frames_v2`
  - result: `6/6` checks passed (`0` mismatched pixels each)

### CP-89: DOS-driven SNES front-end correlation baseline

- Added required machine-readable outputs:
  - `snes_selection_state_contract.json`
  - `snes_catalog_contracts.json`
  - `snes_play_session_gate.json`
- Added correlation docs:
  - `docs/snes_dos_correlation.md`
  - `docs/snes_unknowns.md`

Current read:

- selection state is now formalized as a verified SNES WRAM block centered on
  `$1C6A..$1C90`, with flattened named fields instead of a proven DOS-style
  slot-indexed selector vector
- the front-end bundle materializer is now explicit in one place:
  - `L008C10/L008CA2` builds one derived descriptor from selector fields
    instead of a recovered split between separate car and scenery builders
- the strongest current domain-specific menu surfaces are now separated:
  - verified car-customize screen at `01:880D` (`CUSTOMIZE CAR`)
  - verified `3`-choice preview rebuilder through `$0202`
  - probable `4`-state track/scenery selector through `$1C7C`
- persistence reading tightened materially:
  - the ROM header reports `sram_size = 0x00`, so no battery-backed
    DOS-style selector persistence is evidenced on cartridge
- gameplay-gate reading is now explicit:
  - verified front-end success gate at `L008B26`
  - probable play-session boundary candidate at `L009568/L0095AD`
  - no verified SNES equivalent of the DOS `0x6064` dual-catalog refusal gate
    has been recovered yet

Next best step:

- prove the `$0202/$1C78` preview domain and the `$1C7C` four-state domain with
  name-bearing assets or debugger-backed menu traces, then follow
  `L009568/L0095AD` into the first confirmed gameplay callback chain

### CP-90: selector-domain decode and forced `B1F9` callback narrowing

- tightened the selector-domain read with new static decode:
  - `01:8000/01:8008` now explicitly decodes to `$1C7C` group
    bases/counts `[0, 5, 11, 18] / [5, 6, 7, 8]`
  - unlabeled front-end UI helpers now also show the slot split directly:
    - `$0202 + 0x0008`
    - `$1C7C + 0x000B`
    - both feed the shared `$1E80` text/UI buffer through `L00179B`
- tightened the `$0202/$1C78` preview read:
  - helper indices `9/10/11` now resolve to distinct bundle triples
    (`L00A9A0`, `L00A9CB`, `L00A9F2`)
  - current negative result:
    - the simple `tools/build_bank1_helper_scene.py` path does not yet rebuild
      that preview cleanly because helper indices `9..11` fail on an
      `L00A9CB` `26FB` length mismatch (`11348` vs expected `16640`)
- bounded forced callback probes are now recorded under:
  - `tools/out/tmp_b1f9_9568/td2_boot_probe.json`
  - `tools/out/tmp_b1f9_95ad/td2_boot_probe.json`
- current forced-lane reading:
  - both `01:9568` and `01:95AD` reach `01:B1F9` exactly once at frame `1201`
  - return sites now re-confirm the sibling split:
    - `0x9575`
    - `0x95B7`
  - state split also persists:
    - `state_0f77 = 1` on the `01:9568` lane
    - `state_0f77 = 0` on the `01:95AD` lane
  - immediate callback promotion is still not observed in the narrow window:
    - no writes to `7E:096C..0971`
    - no exec hit at `02:9016`
    - trace window: `1200..1300`
- practical reading:
  - `$0202/$1C78` is now a stronger car-facing selector candidate, but still
    needs a name-bearing asset or debugger-backed menu proof
  - `$1C7C` is now a verified four-group descriptor selector, while the
    track/scenery label remains probable
  - the missing handoff proof is now narrowed to callback-promotion timing
    around the real `B1F9` branch entry, not branch reachability itself

Next best step:

- widen around the `01:9568/01:95AD` callback-promotion window or get a richer
  deterministic menu savestate, and extend the preview extractor for helper
  indices `9..11`

### CP-91: partial `26FB` preview-helper extraction

- patched the ROM-side helper extractor so the `L0006C9` path can keep partial
  `26FB` payloads instead of aborting the whole scene build on early end
  markers:
  - `tools/decompress_td2_chunk.py`
  - `tools/build_boot_vram.py`
  - `tools/build_bank1_helper_scene.py`
- added compact validation artifacts:
  - `tools/out/bank1_preview_helper_9_11_summary.json`
  - `tools/out/bank1_preview_helper_9_11_summary.md`
- bounded validation:
  - strict `26FB` decode still fails on `0E:8000` as expected:
    - `got 11348 bytes, expected 16640`
  - non-strict decode now returns the partial payload instead of aborting:
    - `11348 / 16640` bytes for `0E:8000`
  - clean helper-scene rebuilds now succeed for helpers `9/10/11` on both
    isolated `BG1` and isolated `BG2` surfaces
- current clean-model reading from the committed summary artifact:
  - helper `9`:
    - `BG1` blank
    - `BG2` non-backdrop `14336`
  - helper `10`:
    - `BG1` blank
    - `BG2` blank
  - helper `11`:
    - `BG1` blank
    - `BG2` blank
- practical reading:
  - the previous blind spot is now closed at the extractor level
  - the remaining unknown moved from raw bulk decode failure to runtime
    composition/state:
    - why helper `9` already lights `BG2` in the clean model
    - why helpers `10/11` still need follow-up explanation

Next best step:

- capture the live preview-menu layer mix and follow-up callback activity so
  helper `10/11` can be explained as either deferred composition or genuinely
  blank one-shot states

### CP-92: front-end selector cardinality tightening

- tightened the recovered SNES front-end cardinality with direct code evidence:
  - car surface:
    - `L008B3E` sets `$1C84 = 3`
    - `L00BBCB` wraps `$0202` across `0..2`
    - helper indices `9/10/11` are the three reachable bundle triples
    - no separate front-end restriction branch on the third slot is recovered
      in this loop
  - top-level track surface:
    - `L008B6F` sets `$1C84 = 4`
    - `L00BE76` wraps `$1C7C` across `0..3`
    - `L008B87` then resolves descriptor groups
      `[0, 5, 11, 18] / [5, 6, 7, 8]`
- added compact evidence artifact:
  - `tools/out/snes_frontend_selector_cardinality.json`
  - `tools/out/snes_frontend_selector_cardinality.md`
- bounded validation and narrowing:
  - bank-1 ASCII scan confirms the customization block at `01:880D..01:889B`
    is plain text and shows no plain ASCII track names in that scanned bank-1
    surface
  - simple start-pulse WRAM probes at frames `1200` and `1400` still leave
    `$1E80..$1FFF` zero, even when frame `1200` transiently reaches active main
    callback `01:BAB3`
- practical reading:
  - the current recovered front-end loop already supports all `3` car slots;
    the unresolved gap is the human-readable naming path, not a hidden
    front-end restriction on the third slot
  - `$1C7C` is now better read as the verified `4`-slot top-level track
    surface, while the specific track names still need the descriptor/text
    materializer path

Next best step:

- trace the exact path that populates or bypasses `$1E80` for the menu-label
  descriptors, then tie the `4` `$1C7C` slots to concrete track names

### CP-93: front-end descriptor table base closure

- closed the old `$1E80` WRAM-table assumption with direct static decode:
  - the helper sites at `01:BDF4`, `01:BE53`, and `01:BAC3` all use the
    overlapping sequence:
    - `lda #$1E80 ; sta $11`
    - `lda #$8000 ; sta $10`
  - that sequence constructs the long ROM pointer `1E:8000`, not a WRAM
    buffer at `7E:1E80`
  - `L00179B/L001662` then dereference four-byte rows from that table directly
- promoted a reusable extractor and compact artifact:
  - `tools/decode_frontend_pointer_table.py`
  - `tools/out/snes_frontend_pointer_table_1e8000.json`
  - `tools/out/snes_frontend_pointer_table_1e8000.md`
- decoded current adjacent menu rows:
  - car-facing helper surface:
    - `$0202 + 0x0008` -> rows `8..10`
    - targets `1E:9ACC`, `1E:9C14`, `1E:9D5C`
    - header counts `8/8/8`
  - track-facing helper surface:
    - `$1C7C + 0x000B` -> rows `11..14`
    - targets `1E:9EA4`, `1E:A374`, `1E:A8CC`, `1E:AD14`
    - header counts `9/10/8/10`
- practical reading:
  - the previous WRAM probe result remains true as a negative observation, but
    it no longer defines the gate because `L00179B` was never waiting for a
    writer to `7E:1E80`
  - the active naming frontier is now the ROM descriptor payloads themselves
    and any live overlay/composition layered on top of them

Next best step:

- decode or render the `1E:8000` row payloads `11..14` far enough to tie the
  four `$1C7C` slots to concrete track names, then widen callback promotion
  only if a live overlay still obscures that mapping

### CP-94: `$1C7C` top-level phase-name rows closed through rendered descriptors

- extended the reusable decoder so it now closes the descriptor payload format
  instead of stopping at the row headers:
  - `tools/decode_frontend_pointer_table.py`
  - parses each row into:
    - object list
    - descriptor-local `4bpp` OBJ blob
    - staged-tile layout (`contiguous` vs `split_row_padded`)
  - emits monochrome preview strips plus tile sheets for selected rows
- promoted concrete evidence artifacts for the active four-slot surface:
  - `tools/out/snes_frontend_pointer_table_tracks.json`
  - `tools/out/snes_frontend_pointer_table_tracks.md`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_11_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_12_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_13_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_14_preview.ppm`
- bounded validation:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 11-14 --render-dir tools/out/snes_frontend_pointer_table_tracks --json-out tools/out/snes_frontend_pointer_table_tracks.json --md-out tools/out/snes_frontend_pointer_table_tracks.md`
- recovered exact `$1C7C -> row -> rendered label` mapping:
  - `$1C7C = 0` -> row `11` -> `Desert Blast - Easy`
  - `$1C7C = 1` -> row `12` -> `City Bound - Medium`
  - `$1C7C = 2` -> row `13` -> `East Coast - Hard`
  - `$1C7C = 3` -> row `14` -> `West Coast - Hardest`
- descriptor-format reading tightened materially:
  - all four top-level rows are now proven to be OBJ label strips, not hidden
    WRAM text or a separate live string materializer
  - rows `11/12/14` use the negative-layout `split_row_padded` staging rule
    inferred from `L0015E1/L001945`
  - row `13` is the aligned `32`-tile `contiguous` case
- practical reading:
  - the old “probable track/scenery selector” read is now concrete phase-name
    evidence with explicit difficulty suffixes baked into the descriptor rows
  - the active Lane 2 naming frontier has moved away from `$1C7C`; the next
    open naming surface is the car-facing row family `8..10`
  - callback-promotion archaeology can now resume without the old top-level
    phase-name blocker

Next best step:

- return to the bank-1 callback-promotion corridor with the top-level phase
  surface now closed:
  - widen the real promotion window around `01:9568/01:95AD`
  - keep watching for the first concrete `02:9016/02:8F3C` handoff
  - only reopen front-end naming if the still-open car-facing rows `8..10`
    become the stronger blocker

Savestate lane blocker (current environment):

- `mesen_probe_boot.lua` can load savestates, but headless `--testRunner` does not expose
  a callable save API (`saveSavestate/saveState/serializeState` absent on `emu` table).
- probe JSON currently reports:
  - `saved_savestate_error = "no supported savestate API found on emu table"`

### CP-95: Short-force `01:9568/01:95AD` probes stay pinned after `B1F9`

- Added edge-release artifacts:
  - `tools/out/b1f9_edge_release_9568/td2_boot_probe.json`
  - `tools/out/b1f9_edge_release_9568/td2_boot_probe_l001210_exec.json`
  - `tools/out/b1f9_edge_release_95ad/td2_boot_probe.json`
  - `tools/out/b1f9_edge_release_95ad/td2_boot_probe_l001210_exec.json`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ... TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/b1f9_edge_release_9568/td2_boot_probe ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ... TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/b1f9_edge_release_95ad/td2_boot_probe ./validation/run_mesen_probe_boot.sh ./game.smc`
- probe shape:
  - force `active_main` only on frames `1200..1201`
  - re-apply selectors at the `01:B1F9` exec point
  - trace frames `1200..2200`
  - watch exec at `01:B1F9/B226/B638/B6A3/B6E3/B755`, return sites
    `01:9575/01:95B7`, and candidate follow-up callbacks `01:9D69`,
    `02:9016`, `02:8F3C`
  - watch writes to `7E:096C..0971`, `7E:0200/0202`, `7E:1E2C`,
    `7E:0440/0442/0444`, and `7E:040A`
- observed result on both lanes:
  - `01:9568` and `01:95AD` still reach `01:B1F9` exactly once at frame
    `1201`
  - stack returns remain concrete and lane-specific:
    - `01:9568` -> `0x9575`
    - `01:95AD` -> `0x95B7`
  - no traced writes hit `7E:096C..0971`
  - no traced writes hit the expected `L00B608/L00B6A3` state surface
    (`7E:0200/0202`, `7E:1E2C`, `7E:0440/0442/0444`, `7E:040A`)
  - no exec hits are seen at `01:B226`, `01:B638`, `01:B6A3`, `01:B6E3`,
    `01:B755`, `01:9D69`, `02:9016`, or `02:8F3C`
  - after the forced-entry edge, `active_main` stays pinned on the injected
    callback through the end of the run:
    - `01:9568` through frame `2199`
    - `01:95AD` through frame `2199`
- static cross-check:
  - the only explicit `02:9016/02:8F3C` staging site currently recovered in
    bank 1 is still `01:902D..01:9034`
  - the later explicit callback stage inside `L00B1F9` is `01:9D69` at
    `01:B6A3`, not `02:9016`
- practical reading:
  - the old “just widen the window” reading is no longer sufficient
  - direct active-main forcing itself produces a sticky bank-1 surface and is
    not enough to observe an organic callback promotion
  - the headless proof gap has narrowed from “find a wider trace window” to
    “obtain richer preconditions than raw callback injection”

Next best step:

- treat direct-force callback promotion as low-yield in headless mode:
  - if a richer selector-bearing savestate or live debugger session becomes
    available, return to organic `01:9568/01:95AD -> 02:9016/02:8F3C`
    promotion capture
  - otherwise keep Lane 2 moving on the still-unlocated car-name text surface,
    because rows `8..10` now read as rolling-tire phases rather than names

### CP-96: longplay-calibrated front-end rows split into tire phases and settings labels

- improved the reusable front-end row decoder:
  - `tools/decode_frontend_pointer_table.py`
  - descriptor previews now normalize signed local offsets instead of clipping
    fully negative rows to black
- refreshed the committed base artifact:
  - `tools/out/snes_frontend_pointer_table_1e8000.json`
  - `tools/out/snes_frontend_pointer_table_1e8000.md`
- added a second focused artifact for the next nearby row family:
  - `tools/out/snes_frontend_pointer_table_controls_15_1b.json`
  - `tools/out/snes_frontend_pointer_table_controls_15_1b.md`
- bounded validation:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 8-14 ...`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 0x15-0x1b ...`
  - one local Mesen capture with `start` pulse at frame `1200` to anchor the
    same front-end corridor against live screenshots
- observed result:
  - rows `8..10` now render as three near-identical `24x24` wheel phases,
    not text
  - rows `0x15..0x1B` decode directly to front-end settings/help labels:
    - `Brake`
    - `Throttle`
    - `Horn`
    - `Upshift`
    - `Downshift`
    - `Steering`, `Pause`
    - `stereo`
- practical reading:
  - the longplay plus live Mesen front-end corridor were useful because they
    falsified the old “car-facing names live in rows 8..10” read
  - the current headless naming frontier has moved:
    - `8..10` is a rolling-tire helper cycle
    - `0x15..0x1B` is control/sound menu text
    - the actual car-name surface must be elsewhere

Next best step:

- stop treating rows `8..10` as a naming gate
- trace the neighboring front-end row families and callsites to locate the
  actual car-name text surface

### CP-97: frame-1500 car-select split proves BG name box vs per-car OBJ catalogs

- bounded validation/artifact run:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=1500 TD2_BG_RANGE_END_FRAME=1500 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1500 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 tools/render_mesen_snes_bg.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_cgram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json /tmp/.../car_select_frame_1500_bg_only.ppm`
  - `python3 tools/render_mesen_snes_bg.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_cgram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json /tmp/.../car_select_frame_1500_with_oam.ppm --oam tools/out/car_select_frame_1500_frame_01500_oam.bin --obj-renderer mode7-ppu`
- observed result:
  - the stable frame-`1500` render lands on the first car-select panel with
    `Porsche 959`
  - the BG-only render keeps the patterned backdrop, prompt, title box, and
    whole stats/info panel intact
  - the car art disappears without OAM and returns exactly when OAM is
    composed back in
  - longplay-calibrated static previews now line up the three `01:9C77`
    bases as:
    - `1A:97D8` -> Porsche 959 body + wheel/canopy pieces
    - `11:A578` -> Lamborghini Diablo body + wheel/canopy pieces
    - `1A:8000` -> Ferrari F40 body + wheel/canopy pieces
- practical reading:
  - the per-car bases are visual OBJ catalogs for the selectable car sprite,
    not the source of the visible car-name text
  - the car-name and info surface is now better read as BG/tilemap text

Next best step:

- use the repeatable frame-`1500` schedule as the new calibration anchor
- trace the BG/tilemap/CHR provenance for the `Porsche 959` box and info panel
- stop mining `1A:8000/1A:97D8/11:A578` as if they were name-label tables

### CP-98: frame-1500 BG2 provenance lands on helper bundle `10`

- added a small bank-1 helper provenance builder:
  - `tools/build_bank1_helper_provenance.py`
- promoted the frame-`1500` design-facing artifacts needed for the read:
  - `tools/out/design_frame1500_car_select/design_pack.json`
  - `tools/out/visual_contract_frame1500_car_select.json`
  - `tools/out/car_select_frame1500_probe_repo/td2_boot_probe.json`
  - `tools/out/car_select_frame1500_probe_repo/td2_boot_probe_l001210_exec.json`
- added frame-local provenance outputs:
  - `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json`
  - `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- bounded validation:
  - `python3 tools/build_mesen_design_pack.py /tmp/car_select_frame_01500 tools/out/design_frame1500_car_select --clean-out`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1500_car_select tools/out/visual_contract_frame1500_car_select.json`
  - `MESEN_BIN=<repo-compatible Mesen build> MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_frame1500_probe_repo/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1501 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start' TD2_BOOT_PROBE_TRACE_L001210=1 TD2_BOOT_PROBE_L001210_MAX_HITS=4096 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/extract_compression_header_manifest.py game.smc --bank 0 --json-out tools/out/bank0_headers.json`
  - `python3 tools/extract_compression_header_manifest.py game.smc --bank 14 --json-out tools/out/bank14_headers.json`
  - `python3 tools/validate_td2_chunks.py game.smc --bank 0 --headers-json tools/out/bank0_headers.json --json-out tools/out/bank0_chunk_validation.json`
  - `python3 tools/validate_td2_chunks.py game.smc --bank 14 --headers-json tools/out/bank14_headers.json --json-out tools/out/bank14_chunk_validation.json`
  - `python3 -m py_compile tools/build_bank1_helper_provenance.py`
  - `python3 tools/build_bank1_helper_provenance.py game.smc tools/out/design_frame1500_car_select tools/out/car_select_frame1500_probe_repo/td2_boot_probe.json tools/out/car_select_frame1500_probe_repo/td2_boot_probe_l001210_exec.json rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json --chunk-validation tools/out/bank0_chunk_validation.json --chunk-validation tools/out/bank14_chunk_validation.json --markdown-out rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- observed result:
  - isolating the live frame proves `BG1` is only the wallpaper strip while `BG2` owns the entire lower-screen title/info surface
  - the visible nonzero `BG2` window spans screen pixels `0..255 x 120..223`
  - the matching frame-`1500` probe state is `$0202/$0204/$0208/$020A/$0054 = 1/3/13/$9CC3/136`
  - the last matching helper-trace hits before frame `1500` are:
    - frame `1304`: `L00A9A0`, helper index `10`, source `00:B6B2`
    - frame `1310`: `L00A9CB`, helper index `10`, source `0E:91FE`
  - helper bundle `10` stages:
    - `L00A9A0 00:B6B2 -> VRAM 0x1000`
    - `L00A9CB 0E:91FE -> VRAM 0x3000`
    - `L00A9F2 02:FBF3 -> CGRAM 0xC0`
  - those VRAM destinations match the live frame exactly:
    - `BG2 tilemapBaseWords = 0x1000`
    - `BG2 chrBaseWords = 0x3000`
  - validation status now closes the coarse source read:
    - `00:B6B2` validates as an `ok` `42FB` chunk (`4102` bytes out, `1543` bytes consumed)
    - `0E:91FE` reproduces the known helper-bundle partial `26FB` frontier (`13111` bytes actual vs `16640` declared), so the CHR anchor is real even though strict validation still reports `fail`
- practical reading:
  - the frame-`1500` car-name/info panel is no longer just “some BG surface”
  - its live tilemap/CHR base pair now lands on the same helper bundle `10`
    used by the selector-state runtime path
  - the remaining gap is narrower:
    - identify which part of helper bundle `10` owns the actual title/info
      strings and panel glyphs
    - explain how the runtime composition uses that bundle after the last
      observed `1304/1310` decompressions

Next best step:

- trace the visible `Porsche 959` title/info glyphs inside helper bundle `10`,
  not in the `01:9C77` OBJ catalogs
- split the remaining ownership question across:
  - `00:B6B2` paged tilemap/layout payload
  - `0E:91FE` partial bulk CHR payload
  - `02:FBF3` palette payload

### CP-99: right-nav car-select diff closes BG2 mutability and promotes local car catalogs

- added a visible-window design-pack comparer:
  - `tools/compare_design_pack_bg_visible.py`
- promoted local car catalog reports:
  - `tools/out/car_table_1a8000_report.json`
  - `tools/out/car_table_1a8000_report.md`
  - `tools/out/car_table_1a97d8_report.json`
  - `tools/out/car_table_1a97d8_report.md`
  - `tools/out/car_table_11a578_report.json`
  - `tools/out/car_table_11a578_report.md`
  - `tools/out/snes_car_obj_catalog_manifest.json`
  - `tools/out/snes_car_obj_catalog_manifest.md`
- promoted second-state car-select artifacts:
  - `tools/out/car_select_frame_1500_frame_01500_frame.png`
  - `tools/out/car_select_right_capture/capture_frame_01640.png`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_cgram.bin`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_oam.bin`
  - `tools/out/design_frame1640_car_select_right/design_pack.json`
  - `tools/out/visual_contract_frame1640_car_select_right.json`
  - `tools/out/car_select_bg1_1500_vs_1640_right.json`
  - `tools/out/car_select_bg1_1500_vs_1640_right.md`
  - `tools/out/car_select_bg2_1500_vs_1640_right.json`
  - `tools/out/car_select_bg2_1500_vs_1640_right.md`
- bounded validation/artifact run:
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x1a --base-addr 0x8000 --indices 0-5 --render-dir tools/out/car_table_1a8000_renders --json-out tools/out/car_table_1a8000_report.json --md-out tools/out/car_table_1a8000_report.md`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x1a --base-addr 0x97d8 --indices 0-12 --render-dir tools/out/car_table_1a97d8_renders --json-out tools/out/car_table_1a97d8_report.json --md-out tools/out/car_table_1a97d8_report.md`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x11 --base-addr 0xa578 --indices 0-5 --render-dir tools/out/car_table_11a578_renders --json-out tools/out/car_table_11a578_report.json --md-out tools/out/car_table_11a578_report.md`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_nav_right_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1565 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' ./validation/run_mesen_probe_boot.sh`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_CAPTURE_WARMUP_FRAMES=0 TD2_CAPTURE_FRAMES=1700 TD2_CAPTURE_SCREENSHOT_EVERY=20 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/car_select_right_capture/capture TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BG_RANGE_START_FRAME=1640 TD2_BG_RANGE_END_FRAME=1640 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1640_rightnav ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 tools/build_mesen_design_pack.py /tmp/car_select_frame_01640_right tools/out/design_frame1640_car_select_right --clean-out`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1640_car_select_right tools/out/visual_contract_frame1640_car_select_right.json`
  - `python3 -m py_compile tools/compare_design_pack_bg_visible.py`
  - `python3 tools/compare_design_pack_bg_visible.py tools/out/design_frame1500_car_select tools/out/design_frame1640_car_select_right tools/out/car_select_bg1_1500_vs_1640_right.json --layer bg1 --markdown-out tools/out/car_select_bg1_1500_vs_1640_right.md`
  - `python3 tools/compare_design_pack_bg_visible.py tools/out/design_frame1500_car_select tools/out/design_frame1640_car_select_right tools/out/car_select_bg2_1500_vs_1640_right.json --layer bg2 --markdown-out tools/out/car_select_bg2_1500_vs_1640_right.md`
- observed result:
  - the right-navigation probe changes `state_0202` from `1` to `2` at frame
    `1537`
  - the visible car-select capture at frame `1640` shows `Lamborghini Diablo`
  - the frame-`1500` `Porsche 959` PNG is now promoted as a stable in-repo
    screenshot artifact, so both live anchors can be cited directly in
    article/documentation outputs
  - `L00BC0F` statically closes the per-car helper math:
    - `lda $0202`
    - `adc #$0009`
    - `jsr L00A9A0`
    - `jsr L00A9CB`
    - no paired per-car `L00A9F2`
  - the promoted manifest now gives stable in-repo names for the three
    `01:9C77` OBJ catalogs
  - the visible-layer diff now localizes the mutable car-select panel:
    - `BG1`: `0` changed visible cells
    - `BG2`: `256` changed visible cells
    - changed screen bbox: `x=0..247`, `y=128..223`
    - all changed `BG2` cells are nonzero->nonzero, so this is not a blanking
      or layer-enable event
- practical reading:
  - the mutable per-car title/stats panel is now closed as a `BG2`
    tilemap/CHR rewrite, not an OAM rewrite and not a wallpaper-layer change
  - the frame-`1500` `Porsche 959` panel and the frame-`1640`
    `Lamborghini Diablo` panel sit on the same `BG2` state shape, so the next
    byte-ownership target is the per-car helper payload delta, not a coarse
    PPU-mode fork
  - the active naming gap is now the third live `Ferrari F40` anchor plus the
    exact split between helper `10/11` tilemap bytes and CHR bytes

Next best step:

- land the third live `Ferrari F40` car-select frame and run the same visible
  `BG2` diff against the existing `Porsche 959` and `Lamborghini Diablo`
  frames
- map the `BG2` delta against helper `10/11` payload ownership:
  - `00:B6B2` vs `00:BCBA`
  - `0E:91FE` vs `0E:A428`

### CP-100: raw exact-frame front-end car-presentation triangle narrows the panel delta to top-row tilemap changes

- added a raw-frame visible-window comparer:
  - `tools/compare_raw_bg_visible.py`
- added a raw-frame visible-CHR delta summarizer:
  - `tools/summarize_raw_bg_chr_delta.py`
- promoted third-slot selector and front-end car-presentation frame artifacts:
  - `tools/out/car_select_nav_right2_probe/td2_boot_probe.json`
  - `tools/out/car_select_frame_1780_right2.json`
  - `tools/out/car_select_frame_1780_right2_frame_01780_vram.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_cgram.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json`
  - `tools/out/car_select_frame_1780_right2_frame_01780_oam.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_frame.png`
- promoted raw exact-frame compare artifacts:
  - `tools/out/car_select_raw_bg1_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg1_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg1_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg1_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg1_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg1_1640_vs_1780.md`
  - `tools/out/car_select_raw_bg2_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_1640_vs_1780.md`
- promoted raw visible-CHR delta artifacts:
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_chr_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_1640_vs_1780.md`
- bounded validation/artifact run:
  - `MESEN_TIMEOUT_SECONDS=60 MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_nav_right2_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1825 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right' ./validation/run_mesen_probe_boot.sh`
  - `MESEN_TIMEOUT_SECONDS=60 MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BG_RANGE_START_FRAME=1780 TD2_BG_RANGE_END_FRAME=1780 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1780_right2 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 -m py_compile tools/compare_raw_bg_visible.py`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg1_1500_vs_1640.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1500_vs_1640.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1500_vs_1640.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg1_1500_vs_1780.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1500_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1500_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg1_1640_vs_1780.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1640_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1640_vs_1780.md`
  - `python3 -m py_compile tools/summarize_raw_bg_chr_delta.py`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_chr_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1500_vs_1640.md`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1500_vs_1780.md`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1640_vs_1780.md`
- observed result:
  - the second-right probe changes `state_0202` from `2` to `0` at frame
    `1677`, closing the third live anchor in the same front-end
    presentation/preview corridor.
  - the exact-frame raw dump at `1780` keeps the same `BG1/BG2` state fields
    as the earlier `1500` and `1640` front-end presentation anchors.
  - the new raw comparer reproduces the strong structural boundary while
    correcting the earlier tilemap-overreach:
    - `BG1` changed visible cells remain `0` across `1500->1640`,
      `1500->1780`, and `1640->1780`
    - `BG2` tilemap changes shrink to the top row only:
      - `1500->1640`: `27` changed cells
      - `1500->1780`: `11` changed cells
      - `1640->1780`: `27` changed cells
  - the visible-union `BG2` CHR delta is now explicitly negative:
    - `1500->1640`: `0` changed CHR tiles, `0` changed CHR bytes
    - `1500->1780`: `0` changed CHR tiles, `0` changed CHR bytes
    - `1640->1780`: `0` changed CHR tiles, `0` changed CHR bytes
  - the earlier design-pack compare stays useful as a looser pack-level signal,
    but it is no longer the source of truth for exact-frame tilemap deltas.
  - `mesen_ppu_extract` diverges from the exact-frame raw dump at `1780`, so
    front-end exact-frame comparison should currently trust the raw runner
    dump until extractor timing semantics are reconciled.
- practical reading:
  - the `1500/1640/1780` trio should now be described conservatively as one
    front-end car-presentation/preview corridor, not yet a proven interactive
    car-select menu.
  - the per-car visible mutation is still on `BG2`, but the exact-frame
    tilemap ownership is now much narrower than the old `256`-cell read.
  - the strongest current split is:
    - `BG1`: stable wallpaper
    - `BG2` tilemap: small top-row name/title delta
    - visible `BG2` CHR: currently unchanged across the exact-frame visible
      tile union, so the live panel-name change is best explained by tilemap
      selection over shared glyph/panel CHR
  - `L00A9CB` is still a real per-car reload path, but this checkpoint does
    not yet tie it to the visible exact-frame delta; it may be staging
    non-visible tiles or reloading CHR that is identical over the visible
    union.
  - the raw third selector anchor is the remaining front-end slot in the
    verified `3`-choice loop and is therefore the strongest current
    `Ferrari F40` candidate by elimination, but the direct name-bearing proof
    is still pending.

Next best step:

- measure the full `0x3000` `BG2` CHR-region deltas across frames
  `1500/1640/1780`, not just the visible tile union, so `L00A9CB` can be tied
  either to non-visible staging or to identical visible glyph reloads.
- reconcile the `1780` timing mismatch between `mesen_dump_bg_range` and
  `mesen_ppu_extract` before using the extractor as an exact-frame source in
  this front-end lane again.

### CP-101: full `BG2` CHR region stays flat and the `$0202` corridor is confirmed downstream of the top menu

- added a full-region CHR delta summarizer:
  - `tools/summarize_raw_bg_chr_region_delta.py`
- promoted full-region delta artifacts:
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.md`
- bounded validation/artifact run:
  - `python3 -m py_compile tools/summarize_raw_bg_chr_region_delta.py`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.md`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.md`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.md`
  - static flow read:
    - `L008B31 -> L00BAE8`
    - `L00BAE8` owns the separate top-level `$1C6A` three-option gate
    - only later does `L008B31 -> L008B3E` enter the downstream `$0202` loop
- observed result:
  - the full inferred `BG2` CHR region `0x3000..0x5FFF` (`12288` bytes) is
    identical across all three exact-frame pairings:
    - `1500->1640`: `0` changed bytes
    - `1500->1780`: `0` changed bytes
    - `1640->1780`: `0` changed bytes
  - this extends the earlier visible-union `CHR = 0` result to the whole
    inferred region, not just the currently visible tiles.
  - static flow now closes one front-end ownership boundary:
    - `L00BAE8` is the separate top-level `3`-option menu gate on `$1C6A`
    - the `$0202` three-slot corridor is downstream of that gate, not the
      first title/menu signboard surface itself
- practical reading:
  - the exact-frame difference across `1500/1640/1780` is now tilemap-only in
    the currently inferred `BG2` region.
  - `L00A9CB` remains a real reload path in code, but this frame trio no
    longer supports using visible or full-region `BG2` CHR deltas to explain
    the observed front-end difference.
  - the next front-end narrowing should stop assuming `CHR` ownership first
    and instead explain why the static reload path can be present while the
    exact-frame region remains identical.

Next best step:

- reconcile the `1780` timing mismatch between `mesen_dump_bg_range` and
  `mesen_ppu_extract` so extractor output can be trusted again for exact-frame
  front-end work.
- use the now-closed `L00BAE8` split to document the top-level three-option
  menu surface separately from the downstream `$0202` corridor.

### CP-102: top-level `1E:8000` signboard rows close the initial three-option menu labels

- decoder/tooling promotion:
  - `tools/decode_frontend_pointer_table.py` now classifies rows `15..17` as
    `top-level signboard labels ($1C6A + 0x000F)`
- promoted artifacts:
  - `tools/out/snes_frontend_pointer_table_top_menu_0f_11.json`
  - `tools/out/snes_frontend_pointer_table_top_menu_0f_11.md`
  - `tools/out/snes_frontend_top_menu_labels.json`
  - `tools/out/snes_frontend_top_menu_labels.md`
  - `tools/out/snes_frontend_top_menu_signboards.png`
- bounded validation/artifact run:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 0x0f-0x11 --render-dir tools/out/frontend_top_menu_rows_0f_11 --json-out tools/out/snes_frontend_pointer_table_top_menu_0f_11.json --md-out tools/out/snes_frontend_pointer_table_top_menu_0f_11.md`
  - image review of:
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_15_preview.png`
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_16_preview.png`
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_17_preview.png`
- observed result:
  - the separate top-level callsite `01:BAC3` now has direct row-label closure:
    - `$1C6A = 0` -> row `15` -> `Game Options`
    - `$1C6A = 1` -> row `16` -> `Play TDII`
    - `$1C6A = 2` -> row `17` -> `High Score`
  - this turns the old user-guided menu reading into direct ROM-side evidence
    for the initial signboard surface.
  - the exact ROM-side label is `Play TDII`, so the previous informal
    expansions `Play Test Drive` / `High Scores` should no longer be treated
    as the promoted wording for this descriptor family.
- practical reading:
  - the first top-level front-end menu already lives in the same `1E:8000`
    descriptor-table family as the later track labels and settings labels.
  - this reinforces the ownership split:
    - `$1C6A + 0x000F` -> top-level signboards
    - `$1C7C + 0x000B` -> track labels
    - `$0202 + 0x0008` -> rolling-tire helper cycle
    - `0x15..0x1B` -> control/sound settings labels

Next best step:

- use the newly closed top-menu signboard labels plus the previously recovered
  config-menu strings to capture or statically narrow the exact initial-menu
  runtime path without conflating it with the downstream `$0202` corridor.
- keep the `1780` raw-dump versus `mesen_ppu_extract` timing mismatch open,
  but no longer block front-end menu ownership claims on that exact-frame
  extractor issue.

### CP-103: top-level signboard semantics close the menu branches behind `$1C6A`

- promoted artifacts:
  - `tools/out/snes_frontend_top_menu_transitions.json`
  - `tools/out/snes_frontend_top_menu_transitions.md`
- bounded static read:
  - `L00BAE8` decision site at `01:BB7F`
  - upstream caller `L008B31`
  - config branch target `L00C0C7`
  - high-score branch target `L00A3CC`
- observed result:
  - the three top-level signboards are no longer just labels; their branch
    behavior is now closed:
    - `$1C6A = 0` / `Game Options` -> `jsr L00C0C7 ; jmp L00BAE8`
    - `$1C6A = 1` / `Play TDII` -> returns success to `L008B31`, which falls
      through to `L008B3E` and enters the separate `$0202/$1C78` corridor
    - `$1C6A = 2` / `High Score` -> `lda #$FFFF ; jsr L00A3CC ; jmp L00BAE8`
  - this proves `Play TDII` is the only top-level branch that advances into
    the later front-end setup chain.
  - it also proves `Game Options` is the exact static entry into the
    configuration loop rather than just a user-supplied longplay label.
- practical reading:
  - the top menu is now closed at two levels:
    - visible text through rows `15..17`
    - semantic branch behavior through `L00BAE8`
  - this reduces the remaining uncertainty around the initial menu to runtime
    composition/capture details, not branch meaning.

Next best step:

- use the now-closed `Game Options -> L00C0C7 -> settings-label surface`
  mapping to narrow the exact initial-menu runtime/callback path and recover a
  clean capture boundary for the signboard menu itself.
- keep the `High Score -> L00A3CC` path as the next adjacent front-end branch
  to decode if the initial-menu capture path stalls.

### CP-104: downstream `$1C70` rival-grid structure closes as a 4-state 2x2 surface

- promoted artifacts:
  - `tools/out/snes_frontend_rival_selection_grid.json`
  - `tools/out/snes_frontend_rival_selection_grid.md`
  - `tools/out/snes_frontend_rival_grid_selection_box_row1d.png`
  - `tools/out/snes_frontend_rival_grid_top_left_bank16_row6.png`
  - `tools/out/snes_frontend_rival_grid_top_right_bank18_row6.png`
  - `tools/out/snes_frontend_rival_grid_bottom_left_bank1b_row6.png`
  - `tools/out/snes_car_obj_catalog_p959_sheet.png`
  - `tools/out/snes_car_obj_catalog_diablo_sheet.png`
  - `tools/out/snes_car_obj_catalog_f40_sheet.png`
- bounded static/artifact read:
  - `L00C20B` at `01:C20B`
  - hidden callback `01:C1D2`
  - coordinate table `01:C1C2..01:C1D0`
  - rendered row-`6` previews from `16:8000`, `18:8000`, `1B:8000`
  - rendered row-`0x1D` preview from `1E:8000`
- observed result:
  - the old loose read of `$1C70` as only a `2`-bit field is now stronger:
    it is a concrete `2x2` downstream selection surface.
  - `L00C20B` draws three explicit rear-car cells at:
    - top-left -> `16:8000` row `6`
    - top-right -> `18:8000` row `6`
    - bottom-left -> `1B:8000` row `6`
  - the callback `01:C1D2` redraws `1E:8000` row `0x1D` as a selection box at
    all four grid coordinates, including the unresolved bottom-right slot.
  - this closes the geometry and OAM ownership of the post-car, pre-track
    surface without over-promoting the missing fourth cell.
  - the car OBJ catalog manifest now also carries canonical committed PNG
    sheets for `p959`, `diablo`, and `f40`, so later articles/docs no longer
    need to point back into `/home/nivando-soares/tmp/...`.
- practical reading:
  - the guided flow fit `cars -> adversary/clock -> phase` is now narrowed to
    one remaining semantic question:
    what the bottom-right `$1C70 = 3` slot actually is.
  - the next profitable work is no longer geometry recovery; it is a runtime
    or descriptor/text tie for that fourth slot.

Next best step:

- use the now-closed `Select Opponent` `BG1` clock slot to narrow the later
  gameplay-handoff semantics instead of spending more time reopening grid
  geometry.

### CP-105: helper-8 BG1 closes the fourth `Select Opponent` slot as a clock surface

- promoted artifacts:
  - `tools/out/snes_frontend_select_opponent_bg1.png`
  - `tools/out/snes_frontend_select_opponent_bg1_x4.png`
  - `tools/out/snes_frontend_select_opponent_clock_summary.json`
  - `tools/out/snes_frontend_select_opponent_clock_summary.md`
- bounded artifact run:
  - `python3 tools/build_bank1_helper_scene.py game.smc tools/out/l00c20b_helper8_bg1 --helper-index 8 --visible-layer bg1 --scene-name l00c20b_helper8_bg1 --source-routine L00C20B`
  - `python3 tools/build_bank1_helper_scene.py game.smc tools/out/l00c20b_helper8_bg2 --helper-index 8 --visible-layer bg2 --scene-name l00c20b_helper8_bg2 --source-routine L00C20B`
  - image review of helper-8 `BG1` plus enlarged export
- observed result:
  - helper `8` is the missing non-OAM surface for `L00C20B`.
  - isolated on `BG1`, it renders:
    - banner: `Select Opponent`
    - the `2x2` panel scaffold
    - a distinct stopwatch/clock icon in the bottom-right quadrant
  - isolated on `BG2`, the same helper contributes nothing useful.
  - this closes the user-guided observation that the fourth slot sits outside
    the car-row list: it belongs to `BG1`, not the rear-car descriptor family.
- practical reading:
  - the `L00C20B` screen is no longer “3 car rows plus one unresolved slot”.
  - it is now directly evidenced as:
    - `3` rear-car opponent cells
    - `1` clock/time slot on `BG1`

Next best step:

- trace or capture the downstream behavior after choosing the clock slot so the
  remaining uncertainty moves from menu archaeology into the gameplay handoff.

### CP-106: `L008B87` closes the first no-opponent-vs-rival handoff split

- promoted artifacts:
  - `tools/out/snes_frontend_select_opponent_mode_split.json`
  - `tools/out/snes_frontend_select_opponent_mode_split.md`
- bounded static read:
  - `bank1.asm:1472-1488` for the `$1C70 -> $1C76/$1C7A` collapse
  - `bank1.asm:1820-1837`, `bank1.asm:1965-1975`, `bank2.asm:2675-2702` for
    `$1C7A` consumers
  - `bank1.asm:2403-2405`, `bank2.asm:2943-2958`,
    `bank2.asm:4118-4129`, `bank2.asm:4671-4682` for `$1C76` branch consumers
- observed result:
  - selector values `0..2` preserve a rival-car handoff:
    - `$1C76 = 1`
    - `$1C7A = $1C70`
  - selector value `3` forces the separate no-opponent branch:
    - `$1C76 = 0`
    - `$1C7A = 0`
  - the fourth clock slot is therefore not only a helper-`8` `BG1` icon; it
    already changes downstream bank-1/bank-2 state and branch behavior.
- practical reading:
  - the remaining gap is narrower than before:
    what is still open is not whether the fourth slot changes handoff, but how
    far the `$1C76 = 0` branch diverges organically once live gameplay/HUD
    logic is running.

Next best step:

- capture or derive a richer post-selection state where the `$1C76 = 0` and
  `$1C76 = 1` paths can diverge without forced `active_main` pinning, then
  compare that organic split against the already-known `02:9016/02:8F3C`
  gameplay corridor.

### CP-107: no-force probes close the default-rival handoff corridor into `02:9016`

- promoted artifacts:
  - `tools/out/snes_select_opponent_organic_default_path.json`
  - `tools/out/snes_select_opponent_organic_default_path.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v1b/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1560-1565:right,down;1610-1615:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v2/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v1b` reaches:
    - `L00C20B` at frame `1562`
    - first `01:C1D2` at `1577`
    - `L00BE76` at `1616`
    - `L008B87` at `1706`
    - `01:902D` at `1857`
    - first `active_main = 02:9016` at `2014`
  - `v2` reaches:
    - `L00C20B` at frame `1584`
    - first `01:C1D2` at `1599`
    - `L00BE76` at `1646`
    - `L008B87` at `1736`
    - `01:902D` at `1887`
    - first `active_main = 02:9016` at `2044`
  - in both runs:
    - `$1C70` stays `0`
    - `$1C76` flips `0 -> 1` only after `L008B87`
    - the early `right+down` attempt does not move the selector off the
      default top-left rival slot
- practical reading:
  - the default-rival path is now recovered organically from power-on into the
    known bank-2 gameplay callback family.
  - the remaining `Select Opponent` blocker is no longer reachability.
  - the remaining blocker is timing the fourth-slot move inside the live
    `01:C1D2` window so the `$1C76 = 0` branch can be compared against this
    baseline.

Next best step:

- inject `right+down` only after `01:C1D2` is already live, then compare the
  resulting `$1C76 = 0` branch against the recovered default-rival corridor.

### CP-108: absolute-frame clock-slot probes still drift ahead of live `01:C1D2`

- promoted artifacts:
  - `tools/out/snes_select_opponent_clock_timing_narrowing.json`
  - `tools/out/snes_select_opponent_clock_timing_narrowing.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v3/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1600-1605:right,down;1610-1615:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v4/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1620-1625:right,down;1630-1635:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v3` reaches `L00C20B` at `1600` and first `01:C1D2` only at
    `1615..1617`, so `right+down` at `1600..1605` is still early and the run
    falls through the already known default-rival path:
    `L00BE76` at `1616`, `L008B87` at `1706`, `01:902D` at `1857`, first
    `active_main = 02:9016` at `2014`.
  - `v4` delays confirmation enough to shift `L00C20B` to `1613` and first
    `01:C1D2` to `1628..1637`; the delayed `right+down` at `1620..1625` is
    still early, and the run only reaches `L00BE76` at `1636` before sampled
    later frames stay on `active_main = 01:BE43` with no `L008B87` or
    `01:902D` hit in the trace window.
- practical reading:
  - the remaining clock-slot problem is now callback-relative timing drift,
    not uncertain button semantics.
  - sliding absolute-frame windows later is still changing the corridor
    itself, so that tactic is low-yield beyond this point.

Next best step:

- overlap `right+down` with the live `01:C1D2` window itself, or trigger the
  move relative to first `01:C1D2`, before spending more runs on guessed
  absolute-frame offsets.

### CP-109: callback-relative probes close organic fourth-slot selection

- promoted artifacts:
  - `tools/out/snes_select_opponent_callback_relative_selection.json`
  - `tools/out/snes_select_opponent_callback_relative_selection.md`
- tooling surface:
  - `validation/mesen_probe_boot.lua`
  - `validation/README.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=210 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2800 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=2400 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be43=01:BE43,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=512 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `validation/mesen_probe_boot.lua` now supports callback-relative input
    windows keyed to the first traced exec-point hit and records both
    `trigger_input_windows` and `exec_point_trace.first_frames`.
  - `v5` records first `01:C1D2` at `1628`; the callback-relative windows then
    move `$1C70 -> 3`, keep `$1C76 = 0`, and reach `L00BE76` at `1642`.
    Later sampled frames `1713/1736/1857/1887/2014/2044` all show
    `active_main = 01:BE43`, while no traced `L008B87`, `01:902D`, or
    `01:9111` hit appears.
  - `v6` reproduces the same early corridor and extends the later callback
    proof: `01:BE43` first appears at `1713` and remains traced through
    `2206`; sampled frames `2200/2400/2600` still hold `$1C70 = 3`,
    `$1C76 = 0`, and `active_main = 01:BE43`.
- practical reading:
  - callback-relative input closes organic fourth-slot selection itself.
  - the absence of `L008B87/01:902D/02:9016` is scoped to this specific input
    program, because `v5/v6` omit the later phase-confirm `start` window used
    in the default-rival baseline.

Next best step:

- pair the callback-relative fourth-slot move with a later `start` confirm
  after `01:BE43` is live so the no-opponent lane can be compared directly
  against the recovered default-rival baseline.

### CP-110: be43-relative confirm closes the organic no-opponent handoff path

- promoted artifacts:
  - `tools/out/snes_select_opponent_no_opponent_organic_path.json`
  - `tools/out/snes_select_opponent_no_opponent_organic_path.md`
- bounded probe run:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=3200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=2600 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be43=01:BE43,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111,9016=02:9016' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=768 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v7` keeps the callback-relative fourth-slot move from `v5/v6`, then adds
    a later `be43+17-22:start` confirm.
  - That single later confirm closes the previously open path:
    `L008B87` at `1736`, `01:902D` at `1887`, `01:9111` at `2043`, and first
    `active_main = 02:9016` at `2044`.
  - The critical state is preserved through the whole downstream handoff:
    `$1C70 = 3`, `$1C76 = 0`, `$1C7A = 0`.
  - The timing now matches the default-rival `v2` corridor exactly at
    `1736 / 1887 / 2044`, but with the no-opponent state tuple `3 / 0 / 0`
    instead of the rival tuple `0 / 1 / 0`.
- practical reading:
  - the remaining gap is no longer front-end confirmation.
  - the next proving lane is the gameplay/HUD divergence after both paths have
    already converged to the shared `02:9016` corridor.

Next best step:

- capture and compare the first no-opponent `02:9016` window against the
  default-rival baseline so downstream bank1/bank2 branches gated by
  `$1C76 = 0` can be tied to visible gameplay differences.

### CP-111: first shared `02:9016` window narrows the post-handoff split

- promoted artifacts:
  - `tools/compare_boot_probe_windows.py`
  - `tools/out/snes_select_opponent_post_9016_state_compare.json`
  - `tools/out/snes_select_opponent_post_9016_state_compare.md`
- bounded compare run:
  - `python3 tools/compare_boot_probe_windows.py tools/out/select_opponent_clock_path_v2/td2_boot_probe.json tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json tools/out/snes_select_opponent_post_9016_state_compare.json --markdown-out tools/out/snes_select_opponent_post_9016_state_compare.md --label-a default_rival --label-b no_opponent_clock --start-frame 2044 --end-frame 2199`
- observed result:
  - the first shared gameplay-facing window already keeps the same callback
    surface in both lanes for all `156` frames:
    `main = 02:9016`, `irq = 01:96A0`, `nmi = 02:8F3C`.
  - across the same window, `54` sampled fields stay identical.
  - only `14` fields differ at all.
  - stable whole-window differences are limited to selector state
    `$1C70 = 0 -> 3`, `$1C76 = 1 -> 0`, and the paired DP cadence fields
    `$0053/$0054`.
  - the strongest remaining non-selector downstream deltas are:
    - `state_09a2`: `77` differing frames, `38/40 -> 34`
    - `state_09a8`: `11` differing frames, `2 -> 10`
    - paired DP scratch fields `$0020/$0022`: `77` differing frames,
      `192/9 -> 149/294`
- practical reading:
  - the remaining gap is no longer callback reachability or a broad
    post-handoff mystery.
  - the next proving target is a small set of state fields inside the already
    shared `02:9016` corridor.

Next best step:

- rerun the rival/no-opponent pair with a guided export or targeted write trace
  around the first shared `02:9016` window so `state_09a2/state_09a8` and the
  paired DP scratch fields can be tied to visible HUD/opponent-side behavior.

### CP-112: screenshot review pack for the first shared `02:9016` window

- promoted artifacts:
  - `tools/out/post9016_default_rival_capture/`
  - `tools/out/post9016_no_opponent_clock_capture/`
  - `tools/out/post9016_compare_questions.md`
- bounded capture runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2044 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2044 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
- supporting normalization:
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_default_rival_capture/capture_input_log.json tools/out/post9016_default_rival_capture/sequence.txt --json-out tools/out/post9016_default_rival_capture/sequence.json --start-frame 2044 --end-frame-exclusive 2085`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_no_opponent_clock_capture/capture_input_log.json tools/out/post9016_no_opponent_clock_capture/sequence.txt --json-out tools/out/post9016_no_opponent_clock_capture/sequence.json --start-frame 2044 --end-frame-exclusive 2085`
- negative result kept:
  - the first attempt to use the bridge-side guided export for the same window
    failed in `extract_mesen_scene_range.py` because `mesen_ppu_extract`
    timed out waiting to reach frame `1280` on the long warmup path.
- observed result:
  - the screenshot capture path succeeds for both lanes over frames
    `2044..2084`, sampled every `4` frames.
  - both capture logs confirm the expected review window shape:
    `41` captured frames each, from `2044` through `2084`.
  - the compare note now points the reviewer directly at matched PNG pairs and
    asks for numbered answers about the earliest visible rival/no-opponent
    difference, BG-vs-OAM ownership, radar/HUD deltas, and whether a later
    window is needed.
- practical reading:
  - this creates a human-review surface that is better matched to the current
    open question than the bridge path.
  - the next narrowing step can now use direct reviewer answers instead of
    guessing which of `09A2/09A8/0020/0022/0053/0054` first becomes visible.

Superseded by `CP-113`: the original `2044` packs were later found to be
misaligned for review because `mesen_capture.lua` was not applying input-window
buttons during warmup, and the chosen default-rival input recipe also stopped
too early.

### CP-113: corrected post-`02:9016` review packs isolate the first visible delta

- code/tool fix:
  - `validation/mesen_capture.lua`
- corrected promoted artifacts:
  - `tools/out/post9016_default_rival_capture/`
  - `tools/out/post9016_no_opponent_clock_capture/`
  - `tools/out/post9016_compare_questions.md`
  - `tools/out/post9016_compare_summary.json`
  - `tools/out/post9016_compare_summary.md`
  - `tools/out/post9016_compare_first_delta_diff.png`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_probe_clock_sanity_v1/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2045 TD2_BOOT_PROBE_SCREENSHOT_FRAME=2044 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_probe_clock_sanity_v2/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2045 TD2_BOOT_PROBE_SCREENSHOT_FRAME=2044 TD2_BOOT_PROBE_TRACE_START_FRAME=1600 TD2_BOOT_PROBE_TRACE_END_FRAME=2044 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_default_rival_capture/capture_input_log.json tools/out/post9016_default_rival_capture/sequence.txt --json-out tools/out/post9016_default_rival_capture/sequence.json --start-frame 2048 --end-frame-exclusive 2089`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_no_opponent_clock_capture/capture_input_log.json tools/out/post9016_no_opponent_clock_capture/sequence.txt --json-out tools/out/post9016_no_opponent_clock_capture/sequence.json --start-frame 2048 --end-frame-exclusive 2089`
- observed result:
  - the first boot-probe sanity run kept `TD2_BOOT_PROBE_TRACE_START_FRAME` at
    its default, so `exec_point_trace.first_frames.c1d2` was only learned at
    `2044`; that negative result confirmed callback-relative probe input cannot
    work unless the trace window opens before the trigger point.
  - the corrected probe run with `TRACE_START_FRAME=1600` restores the
    documented no-opponent timing: `c1d2 = 1628`, `be43 = 1713`, `b87 = 1736`,
    and `active_main = 02:9016` at `2044` while preserving `$1C70 = 3`,
    `$1C76 = 0`; the `2044` screenshot itself is still fully black, so that
    frame is not a useful human-review surface.
  - after fixing `mesen_capture.lua` to apply `TD2_CAPTURE_INPUT_WINDOWS`
    during warmup and using the real default-rival `v2` input recipe, the
    corrected capture packs now cover the first shared non-black window
    `2048..2088`.
  - `tools/out/post9016_compare_summary.json` localizes every sampled
    rival-vs-clock delta in that window to the same top-strip bounding box
    `(11, 11, 194, 21)` with `125..137` differing pixels.
  - the first-delta diff image and the corrected PNG pairs show the practical
    semantic read: the default-rival lane carries an extra red radar/opponent
    marker that is absent from the no-opponent lane, while the lower cockpit
    surface stays visually matched in this window.
- practical reading:
  - the open question is no longer “is there any visible divergence after
    `02:9016`?”; the answer is yes, and it appears immediately in the top
    radar/HUD strip once the first non-black shared window begins at `2048`.
  - the next narrowing step is to tie that top-strip delta back to the already
    narrowed WRAM split (`09A2/09A8/0020/0022/0053/0054`) and, optionally, use
    the corrected question sheet for semantic confirmation from a human read.

Next best step:

- tie the corrected top-strip/radar delta back to the already-narrowed state
  split in the shared `02:9016` corridor, using the corrected review pack for
  optional semantic confirmation rather than as the only discovery surface.

### CP-114: extended probe fields close the first live rival-only HUD marker

- tool change:
  - `validation/mesen_probe_boot.lua` now snapshots gameplay-facing fields
    `state_11a7/state_11cd/state_11df/state_11f1/state_11f3/state_11f5`,
    `state_137c`, and OAM staging words `072C/072E/0730/0732/0734/0736/0738/073A`
    inside the normal per-frame probe payload.
- promoted artifacts:
  - `tools/out/post9016_rival_v2_fields/td2_boot_probe.json`
  - `tools/out/post9016_clock_v7_fields/td2_boot_probe.json`
  - `tools/out/post9016_extended_state_compare.json`
  - `tools/out/post9016_extended_state_compare.md`
  - `tools/out/post9016_visual_semantics.json`
  - `tools/out/post9016_visual_semantics.md`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=260 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_rival_v2_fields/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2089 TD2_BOOT_PROBE_TRACE_START_FRAME=2044 TD2_BOOT_PROBE_TRACE_END_FRAME=2088 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_clock_v7_fields/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2089 TD2_BOOT_PROBE_TRACE_START_FRAME=1600 TD2_BOOT_PROBE_TRACE_END_FRAME=2088 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `python3 tools/compare_boot_probe_windows.py tools/out/post9016_rival_v2_fields/td2_boot_probe.json tools/out/post9016_clock_v7_fields/td2_boot_probe.json tools/out/post9016_extended_state_compare.json --markdown-out tools/out/post9016_extended_state_compare.md --label-a default_rival_v2_fields --label-b no_opponent_v7_fields --start-frame 2048 --end-frame 2088`
- observed result:
  - the extended compare over `2048..2088` demotes `09A2/09A8` from “first
    visible delta candidates” to secondary intermittent differences.
  - the stable whole-window split is now explicit:
    - `state_1c76 = 1 -> 0`
    - `state_11f3 = 44 -> 0`
    - `oam_0730 = 4618 -> 57600`
    - `state_1c70 = 0 -> 3`
  - the adjacent staged OAM words remain identical:
    - `oam_072c = 4106` in both lanes
    - `oam_0734 = 57600` in both lanes
  - static bank-2 reading at `L0108EF` (`bank2.asm:1145-1165`) matches that
    exact split:
    - `oam_072c <- state_11f1`
    - `oam_0730 <- state_11f3` only when `$1C76 != 0`
    - `oam_0734 <- state_11f5`
  - the corrected human review now fits the code:
    the rival-only red top-strip marker is OAM-owned and disappears in the
    no-opponent lane, while the lower cockpit stays unchanged in this window.
- practical reading:
  - the first live post-`02:9016` divergence is no longer a generic “HUD
    difference”; it is a closed rival-only OAM marker under
    `$1C76 -> state_11f3 -> oam_0730`.
  - the remaining unknowns narrowed again:
    the reported rearview blinking lights and the intermittent
    `state_09a2/state_09a8`-side differences are now later or secondary
    OAM-facing targets, not the first visible split.

### CP-115: full-rate compare demotes `09A2/09A8` as visible pulse candidates

- promoted artifacts:
  - `tools/out/post9016_fullrate_compare.json`
  - `tools/out/post9016_fullrate_compare.md`
  - `tools/out/post9016_intralane_focus_compare.json`
  - `tools/out/post9016_intralane_focus_compare.md`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture_full/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture_full/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - full-rate compare artifact built from those `41`-frame PNG sets
  - adjacent-frame focus compare built for frames `2050->2051`, `2051->2052`,
    `2082->2083`, and `2083->2084` in both lanes
- observed result:
  - the first frame `2048` still behaves like a transition surface:
    rival-vs-clock diff bbox is only `(11, 20, 14, 21)` with `8` pixels.
  - frames `2049..2088` keep the same full top-strip bbox
    `(11, 11, 194, 21)` with no new breakout region at the suspected
    `09A2/09A8` pulse points `2051` and `2083`.
  - the intra-lane focus compare reports `0` mismatched pixels for both rival
    and no-opponent adjacent-frame pairs around `2051` and `2083`.
- practical reading:
  - `09A2/09A8` are now further demoted as explanations for a visible pulse in
    this exact `2048..2088` window.
  - the reported rearview blinking lights likely belong to a later gameplay
    window or a different surface than the first shared post-`02:9016`
    marker split.

### CP-116: first rival-only blink cue narrows to `2048 -> 2049`

- promoted artifacts:
  - `tools/out/post9016_firstframe_blink_compare.json`
  - `tools/out/post9016_firstframe_blink_compare.md`
- bounded validation:
  - direct frame compare for rival `2048 -> 2049`
  - direct frame compare for no-opponent `2048 -> 2049`
- observed result:
  - rival `2048 -> 2049` changes `117` pixels over bbox `(180, 11, 194, 19)`
  - no-opponent `2048 -> 2049` changes `0` pixels
  - the subregion is inside the already-closed top HUD strip but concentrated
    at the right edge, matching the user report that the first cue is the
    rival lights in the rearview turning on rather than the center strip
    marker itself
- practical reading:
  - the first user-reported rival-only blink cue is now narrowed to a single
    lane-local frame step and a small top-right bbox
  - this is strong enough to redirect the next trace away from
    `09A2/09A8` pulse frames and toward rival-only OAM/state changes that can
    explain `2048 -> 2049`

### CP-117: fingerprinted seeded sweep reopens `A/B` equivalence

- promoted tooling/data:
  - `tools/run_track1_seed_sweep.py`
  - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.md`
- bounded validation:
  - `python3 -m py_compile tools/run_track1_seed_sweep.py`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v3_ab_compare --scenario a_hold=60-359:a --scenario b_hold=60-359:b --scenario a_and_b_hold=60-359:a,b`
  - pairwise PNG hash compare across `a_hold`, `b_hold`, and `a_and_b_hold`
  - cross-generation compare against `tools/out/track1_seed_sweep_v2_current/b_hold`
- observed result:
  - the sweep summary now records ROM/savestate SHA-256 and capture config,
    making seed drift explicit in the artifact instead of relying on implicit
    local state
  - on savestate SHA-256
    `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`,
    `a_hold` and `b_hold` are both dynamic and pixel-identical across all
    `300` captured frames
  - `a+b` stays aligned with that same lane through capture `158`
    (`script frame 218`) and first diverges at capture `159`
    (`script frame 219`)
  - that first `a_hold` vs `a+b` divergence is already large and localized:
    `2085` mismatched pixels in bbox `[99, 75, 153, 113]`
  - the current fingerprinted `b_hold` output no longer matches the older
    promoted `v2_current` `b_hold` from capture `0`, so the mutable current
    `game_11.mss` seed must be treated as changed evidence rather than the old
    `76/92/108` baseline
- practical reading:
  - stop treating `b = true` as the only defensible early-gameplay
    accelerator proxy on the current seed
  - CP-118 now supersedes the gameplay reading for this same sweep family:
    the current `game_11.mss` seed audits as menu-bound, so this checkpoint is
    only admissible as deterministic input equivalence inside that seed family

### CP-118: `game_11.mss` seed audit demotes current lane-3 sweep to menu-bound evidence

- promoted artifacts:
  - `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.json`
  - `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
  - `tools/out/game11_seed_surface_audit/game11_a_hold_frame_060.png`
  - `tools/out/game11_seed_surface_audit/game11_a_hold_frame_219.png`
  - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.md`
  - `tools/run_track1_seed_sweep.py`
- bounded validation:
  - `python3 -m py_compile tools/run_track1_seed_sweep.py`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v3_ab_compare --scenario a_hold=60-359:a --scenario b_hold=60-359:b --scenario a_and_b_hold=60-359:a,b`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/game11_menu_audit/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss`
  - matched-input boot probes for `a_hold` and `a+b` through frame `229`
- observed result:
  - the no-input audit stays on `active_main = 02:9016`, `irq = 01:96A0`,
    `$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF` for frames `0..7`
  - the same seed presents gameplay-like cockpit imagery at frame `060` but is
    back on the top-level signboard menu by frame `219`
  - sampled `a_hold` and `a+b` probes keep the same top-menu selector family
    through frames `0/60/62/159/219/229`
  - the first sampled cross-scenario state delta is only `state_0960` from
    frame `60` onward
- practical reading:
  - `game_11.mss` must not be treated as a verified gameplay seed
  - the current `v3_ab_compare` divergence at frame `219` is deterministic, but
    still front-end/menu-bound rather than gameplay-backed
  - the next defensible Lane 3 target is now to recover a true gameplay seed
    before promoting more gameplay claims from this sweep family

### CP-119: power-on default-rival post-`02:9016` corridor is input-sensitive

- promoted tooling/data:
  - `tools/compare_capture_sequences.py`
  - `tools/out/post9016_default_rival_probe_none_vs_a_compare.json`
  - `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
  - `tools/out/post9016_default_rival_probe_none_vs_b_compare.json`
  - `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
  - `tools/out/post9016_default_rival_a2050_sequence_compare.json`
  - `tools/out/post9016_default_rival_a2050_sequence_compare.md`
  - `tools/out/post9016_default_rival_b2050_sequence_compare.json`
  - `tools/out/post9016_default_rival_b2050_sequence_compare.md`
  - `tools/out/post9016_default_rival_noinput_frame_02052.png`
  - `tools/out/post9016_default_rival_a_frame_02052.png`
  - `tools/out/post9016_default_rival_noinput_frame_02056.png`
  - `tools/out/post9016_default_rival_a_frame_02056.png`
- bounded validation:
  - three power-on boot probes over frames `2048..2208`:
    - no-input baseline
    - late `A` from `2050..2208`
    - late `B` from `2050..2208`
  - two short power-on capture reruns over frames `2048..2088`:
    - late `A` from `2050..2088`
    - late `B` from `2050..2088`
  - `python3 -m py_compile tools/compare_capture_sequences.py`
  - `python3 tools/compare_capture_sequences.py ...post9016_default_rival_capture_full ...post9016_default_rival_capture_a2050 ...`
  - `python3 tools/compare_capture_sequences.py ...post9016_default_rival_capture_full ...post9016_default_rival_capture_b2050 ...`
- observed result:
  - all three probe lanes keep the same callback surface through `2048..2208`:
    `02:9016` main, `01:96A0` IRQ, `02:8F3C` NMI
  - both late-input lanes first diverge in `state_0960` at frame `2050`:
    - `A`: `0 -> 128`
    - `B`: `0 -> 32768`
  - `A` is the richer lane:
    - `dp_0054` first diverges at `2052`
    - `dp_0053` and `state_09a8` first diverge at `2053`
    - `state_137c` first diverges at `2104`
    - the first post-input visible divergence against no-input is frame `2052`
      with bbox `[17, 13, 193, 17]`
    - from `2054` onward the same lane also diverges over a lower dashboard
      bbox around `[72..88, 155..174]`
  - `B` currently behaves like a control lane:
    - outside `state_0960`, the probe delta set is almost empty
    - visible divergence against no-input is sparse (`2052`, `2068`, `2084`)
- practical reading:
  - the power-on default-rival post-`02:9016` corridor is not just an
    infinitely repeated passive frame
  - but the run still carries the inherited selector family
    (`$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF`), so this does
  not yet close the “verified gameplay seed” gate
  - the best active Lane 3 target is now to extend the `A`-responsive lane
    until it either produces unmistakable world/gameplay motion or cleanly
    exits the inherited top-menu selector family

### CP-120: explicit Lane 3 next-agent handoff added

- promoted docs:
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- bounded validation:
  - `git diff --check -- rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md rom_analysis/docs/next_steps_roadmap.md rom_analysis/docs/progress_checkpoints.md`
- observed result:
  - the current Lane 3 resume point is now explicit instead of being spread
    across the last two checkpoints and multiple compare artifacts
  - the handoff fixes:
    - the invalid `game_11.mss` gameplay-seed assumption
    - the exact trusted artifacts for the late `A/B` narrowing
    - the concrete next experiment (`2050-2400:a` with `B` as control)
- practical reading:
  - the next agent should start from the handoff doc, not from older
    `game_11.mss` sweep notes or the old `v2_current` baseline

### CP-121: preserved manual live-race seed pair now anchors Lane 3

- promoted artifacts:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
  - `manual_artifacts/lane3/lane3_live_race_notes.txt`
  - `manual_artifacts/lane3/responses.txt`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
  - `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
  - `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
  - `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
  - `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- bounded validation:
  - copied the user-created Mesen slot files from `~/.config/Mesen2/SaveStates/`
    into `manual_artifacts/lane3/`
  - `sha256sum` on the preserved copies
  - two short seeded boot probes (`12` frames each) on the preserved primary
    pair
  - `python3 tools/compare_boot_probe_windows.py ...lane3_live_race_mid... ...lane3_live_race_plus30f...`
  - short `mesen_capture.lua` reruns (`8` frames each, no input) as a bounded
    screenshot-path check
- observed result:
  - preserved hashes:
    - `lane3_live_race_mid.mss`:
      `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
    - `lane3_live_race_plus30f.mss`:
      `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
    - `lane3_live_race_slot2_extra.mss`:
      `f2ce9ae98cf0a4563e51adcb9ddcaf0a971c3d55a0e904970483e166c754aec8`
  - user-supplied read for the primary pair:
    - `Porsche` cockpit in motion
    - first `Desert Blast` segment
    - approaching a green NPC traffic car
  - follow-up human-support read now also records:
    - practical route back to `live_race_mid`:
      keep taking the first menu option / keep pressing `A` until gameplay
    - menu semantics:
      `A` advances, `B` backs out one screen
    - gameplay essentials:
      `A` accelerates, `B` reduces speed, d-pad steers
    - `slot2_extra` still looks like intro/credits, matching the technical
      boundary/control read
    - the first filled `live_race_mid` still-frame note keeps:
      straight road, centered yellow divider, straight wheel, green NPC car
      near on the player's right, and an active radar marker
    - the same response extends `live_race_mid` through checkpoint/post-stop
      dialog plus a late police arrival with a third radar marker
  - both primary seeds still load onto the same callback family:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
  - both still inherit the same selector block at frame `0`:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - the pair is not a duplicate:
    - stable all-frame differences over frames `0..11`:
      `dp_0053`, `dp_0054`, `state_09a2`, `state_11f3`
    - strongest split:
      - `live_race_mid`: `state_11f3 = 477..479`,
        `dp_0053/0054 = 120..200`
      - `live_race_plus30f`: `state_11f3 = 627..629`,
        `dp_0053/0054 = 40..64`
  - negative validation result:
    - the current headless screenshot path emitted zero-byte PNGs for both
      `td2_boot_probe_frame.png` and `mesen_capture.lua` outputs on these
      seeds
- practical reading:
  - the next agent should start from the preserved manual seed pair, not from
    `game_11.mss`
  - the new active Lane 3 question is now:
    why do user-verified live-race seeds still present as the old
    `02:9016/01:96A0/02:8F3C` family with inherited selector values?

### CP-122: manual live-race seeds now separate cleanly from the old post-`2050` control corridor

- promoted tooling/docs:
  - `tools/compare_boot_probe_windows.py`
  - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md`
- bounded validation:
  - `python3 -m py_compile tools/compare_boot_probe_windows.py`
  - aligned compare reruns with `--frame-offset-b -2048` over relative
    frames `0..11` against
    `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- observed result:
  - both manual seeds still share the exact callback surface with the control:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
  - both also keep the inherited selector family over the aligned window:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - nevertheless, both manual seeds differ from the aligned control on all
    `12/12` frames in:
    - `oam_0730`
    - `state_11f3`
    - `dp_0053`
    - `dp_0054`
    - `dp_0020`
    - `dp_0022`
    - `state_09a2`
  - strongest stable split:
    - control: `state_11f3 = 44`, `oam_0730 = 4618`
    - `live_race_mid`: `state_11f3 = 477..479`, `oam_0730 = 4645`
    - `live_race_plus30f`: `state_11f3 = 627..629`, `oam_0730 = 4655`
- practical reading:
  - the manual seeds no longer need a new callback-family transition to be
    distinguished from the old post-`2050` corridor
  - the open Lane 3 frontier is now semantic ownership of HUD/OAM/substate
    fields inside the broader `02:9016` family, not discovery of a first
    separating callback

### CP-123: older Lane 3 power-on corridors are now treated as mixed attract/demo evidence

- promoted docs:
  - `rom_analysis/docs/lane3_attract_demo_boundary.md`
- bounded validation:
  - documentation-only consolidation against already-promoted Lane 3 artifacts:
    - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
    - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
    - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
    - `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
    - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- observed result:
  - the old no-input and early-input corridors are no longer modeled as a
    clean menu-vs-gameplay boundary
  - the stronger current fit is:
    - short gameplay-like attract/demo slices can appear inside those runs
    - scripted input can cut those slices before they resemble a stable
      player-controlled gameplay session
  - this explains why some archived `02:9016` evidence looked menu-like in one
    pass and gameplay-like in another without requiring a brand-new callback
    family
- practical reading:
  - lack of a long gameplay segment in those older power-on lanes is no longer
    strong disproof of gameplay-adjacent behavior
  - those lanes should now be treated as mixed front-end/presentation/demo
    evidence unless corroborated by stronger code-facing or manual-seed proof

### CP-124: first semantic ownership pass closes the main `02:9016` split fields

- promoted docs:
  - `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- bounded validation:
  - documentation + code-reading consolidation against already-promoted Lane 3
    artifacts and current source:
    - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
    - `bank2.asm` `L0108EF`, `L0117BA`, `L012501`
    - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
    - `bank1.asm` `L009185`, `6250..6272`
  - probe spot-checks from the existing promoted JSONs over:
    - control aligned window `2048..2053`
    - manual live-race windows `0..5`
- observed result:
  - `state_11f3` is now materially explained:
    - `L0117BA` seeds it as `$11F1 - 1` only when `$1C76 != 0`
    - `L0108EF` converts it directly into `oam_0730`
    - `L012501` also compares it against `$1CE8`
  - `state_09a2/state_09a8` now fit the bank-0 OAM builder model:
    - `09A2` is the sprite cursor used while populating `0700/0900`
    - `09A8` is copied into the allocator-side `0AAA` map and is repeatedly
      raised above its default `2` value only around sprite-submission calls
  - `dp_0053/dp_0054` now fit DMA-ring cursor behavior instead of generic
    gameplay state:
    - control spot-check: `E8/E8 -> E8/E8 -> E8/F8 -> F8/F8`
    - `live_race_mid`: `78/78 -> 78/88 -> 88/88 -> 88/98 -> 98/98 -> 98/A8`
    - `live_race_plus30f`: `28/28 -> 28/28 -> 28/28 -> 28/28 -> 28/30 -> 30/40`
    - the step size stays consistent with the `8`-byte descriptor model used
      by the scanline queue summarizer over `7E:0600`
  - `dp_0020/dp_0022` remain discriminative but still look like transient
    builder operands, because bank-2 rewrites `$20.b/$22.b` throughout the
    sprite/HUD submission paths immediately before math and `L001662/L00179B`
    calls
- practical reading:
  - the main `02:9016` split bytes are no longer anonymous
  - the surviving open problem is now producer attribution:
    which exact bank-2 paths are responsible for the extra live-race OAM and
    DMA queue work inside the shared driver

### CP-125: first live-race layer-stack pass narrows gameplay to `BG1 + BG2 + OBJ`

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_layer_stack_summary.json`
  - `tools/out/lane3_live_race_mid_layer_stack_summary.md`
- bounded validation:
  - real-seed raw dump from the working manual live-race seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_bg0_silent.log 2>&1`
  - scanline/PPU sample from the same seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_scanline0.log 2>&1`
  - derived design-pack/tilemap read from the dumped raw files
  - local isolated renders for `BG1`, `BG2`, and `OBJ`
- observed result:
  - the confirmed `live_race_mid` sample now has a direct visible-layer read:
    - `bgMode = 1`
    - `mainLayers = 0x13`
    - visible stack = `BG1 + BG2 + OBJ`
    - `subLayers = 0`
  - `BG1` is stable across the sampled visible scanlines:
    - `hscroll = 0`
    - `vscroll = 1023`
  - `BG2` is the only visible BG layer with meaningful per-scanline movement:
    - `hscroll = 0 -> 945 -> 946`
    - `vscroll = 1023 -> 1013`, then wraps to `0 -> 2`
  - the derived design-pack read matches that mask:
    - `bg1`: `enabledOnMain = true`
    - `bg2`: `enabledOnMain = true`
    - `bg3`: `enabledOnMain = false`
    - `bg4`: inactive
  - the isolated static renderer fits that read conservatively:
    - `BG1` alone still draws a full-scene non-backdrop surface
    - `OBJ` alone draws a smaller actor/HUD region
    - `BG2` alone falls back to backdrop under a single static `ppu_state`,
      which is consistent with a per-scanline/rasterized producer rather than
      strong evidence that `BG2` is absent
  - explicit negative follow-up kept:
    - the same raw helper wrappers returned `255` on
      `lane3_live_race_plus30f.mss` and produced no raw dump artifacts
- practical reading:
  - the older “`BG1 + BG2 + BG3 + OBJ` gameplay stack” heuristic is now too
    strong for the confirmed `live_race_mid` sample
  - current strongest fit is:
    - `BG1` = cockpit/HUD base candidate
    - `BG2` = road/world raster layer candidate
    - `OBJ` = dynamic world/HUD actors
    - `BG3` = present in raw state but not visible on main/sub in this sample
  - the next open edge is not “which visible layer exists” but who drives the
    per-scanline `BG2` motion and whether the same mask holds on the second
    manual seed

### CP-126: runtime path and slot-`#2` boundary sharpen the live-race layer read

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_slot2_boundary_summary.json`
  - `tools/out/lane3_live_race_slot2_boundary_summary.md`
  - `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
  - `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- bounded validation:
  - code-side follow-up on the active live-race family:
    - `nl -ba bank1.asm | sed -n '2008,2098p'`
    - `nl -ba bank1.asm | sed -n '2558,2835p'`
    - `nl -ba bank1.asm | sed -n '5760,5910p'`
    - `nl -ba bank2.asm | sed -n '2148,2255p'`
    - `nl -ba bank2.asm | sed -n '2628,2662p'`
    - `nl -ba bank2.asm | sed -n '6538,6615p'`
    - `nl -ba bank2.asm | sed -n '7204,7278p'`
  - boundary recheck on the preserved extra slot:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
    - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- observed result:
  - the active live-race callback family is now tied more tightly to the
    visible `BG2` road/world read:
    - `bank1.asm` `L009075..L009111` arms the
      `02:9016 / 01:96A0 / 02:8F3C` family
    - `bank1.asm` `L009185` enters `bank2.asm` `L011165`
    - `L011165` runs `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`,
      and `L0108EF` before the OAM flush
    - `bank2.asm` `2628..2644` arms `HDMA7` against destination base `0x0F`,
      i.e. the `BG2` scroll register block
    - `bank1.asm` `5846..5851` also writes `BG2VOFS` from `$22/$23`
  - the preserved extra slot is now explicitly closed as a non-gameplay
    boundary seed:
    - boot probe surface stays `00:8029 / 00:835F / 00:8029`
    - frame-`0` raw dump reads `bgMode = 1`, `mainLayers = 0x04`,
      visible `BG3` only
    - scanline sample stays flat on `BG1/BG2/BG3 = 0 / 1023`
    - compare vs `live_race_mid` differs on all `8/8` frames in the callback
      surface plus live-race workload fields like `state_09a2`, `state_11f3`,
      `dp_0053`, `dp_0054`, and `oam_0730`
- practical reading:
  - the user's layer observation is now useful as a guide on confirmed
    gameplay, but the repo also has a direct nearby counterexample
  - `slot2_extra` is boundary/control evidence, not a second gameplay sample
  - the remaining open problem is specifically producer attribution inside the
    confirmed `02:9016` live-race family, not proving that every nearby seed is
    gameplay

### CP-127: bounded producer trace ties live-race `BG2` motion to `$22/$23` and the IRQ split

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
  - `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- bounded validation:
  - exec/write trace on the confirmed manual live-race seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=16 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_exec_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='main_9111=01:9111,cb_9185=01:9185,cb_9165=02:9165,road_12f48=02:AF48,road_1318d=02:B18D,road_1340e=02:B40E,road_13927=02:B927,road_108ef=02:88EF,road_1070a=02:870A,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='dp22=00:0022,dp23=00:0023,hdma_1e14=7E:1E14,hdma_1e15=7E:1E15,hdma_1e16=7E:1E16,hdma_1e2a=7E:1E2A,split_1e1c=7E:1E1C,split_1e1d=7E:1E1D,split_1e1e=7E:1E1E,split_1e1f=7E:1E1F,next_irq_ptr=00:003E,next_irq_bank=00:0040' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_exec_trace.log 2>&1`
  - PPU register trace on the same seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=32 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_ppu_reg_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='cb_9185=01:9185,cb_9165=02:9165,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='bg1hofs=00:210D,bg1vofs=00:210E,bg2hofs=00:210F,bg2vofs=00:2110,bg3hofs=00:2111,bg3vofs=00:2112,tmain=00:212C,tsub=00:212D,hdmaen=00:420C,vtime=00:4209' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_ppu_reg_trace.log 2>&1`
  - static PC follow-up:
    - `nl -ba bank1.asm | sed -n '2688,2820p'`
    - `nl -ba bank1.asm | sed -n '5838,5860p'`
    - `nl -ba bank2.asm | sed -n '6026,6150p'`
- observed result:
  - the bounded exec trace now closes the immediate gameplay-side producer path:
    - exec hits include `01:9185`, `02:9165`, `02:B18D`, `02:870A`,
      `02:88EF`, `01:960D`, and `01:96A0`
    - `02:9165` returns to `01:9189`, confirming the active
      `01:9185 -> 02:9165` call path on the confirmed gameplay seed
  - the same trace now ties live visible `BG2` motion to concrete operands:
    - `dp22` writes: `26`
    - `dp23` writes: `26`
    - `next_irq_ptr` writes: `2`
    - unique retarget points:
      - scanline `24`: `01:9808` -> next IRQ `01:960D`
      - scanline `121`: `01:969F` -> next IRQ `01:96A0`
    - `bank1.asm` `5846..5851` writes `BG2VOFS` directly from `$22/$23`
  - the bounded PPU-register trace now closes the visible split shape:
    - `BG2HOFS/BG2VOFS` hits under cap: `246 / 246`
    - `BG1HOFS/BG1VOFS` hits: `4 / 4`
    - `BG3HOFS/BG3VOFS` hits: `4 / 4`
    - `TMAIN` writes:
      - scanline `23`: `0x17` (`BG1 + BG2 + BG3 + OBJ`)
      - scanline `121`: `0x13` (`BG1 + BG2 + OBJ`)
    - `BG3` writes cluster around scanlines `23/24`
    - `BG1` writes cluster around scanline `120`
    - `BG2VOFS` still receives unique writes across `123` scanlines under the
      configured cap
  - static fit now narrows the strongest current road/world producer cluster:
    - inside `L01318D`, especially `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD /
      02:B134`
- practical reading:
  - the current live-race sample no longer just "looks like" cockpit plus road
    in the debugger; it now has a matching runtime split:
    - `BG1` remains the strongest cockpit-base candidate
    - `BG2` is the strongest road/world raster candidate
    - `BG3` behaves like a split-controlled strip/auxiliary layer on this
      sample rather than the full gameplay world plane
  - the lane is no longer blocked on finding any `BG2` producer path; it is
    blocked on semantic attribution inside the narrowed `L01318D` cluster and
    on recovering the second manual seed through a usable export path

## Next Advancement Gates

### Gate G1 (Immediate): close active bank30 unresolved queue

Goal:
- observe `1E:EE7F` on a real runtime path and resolve reachability for the
  top-level `1E:DA96` `67FB` stream.

Definition of done:
- `tools/out/bank30_chunk_registry.json` no longer lists unresolved `P0/P1`
  entries for bank30.

Current status:
- registry tightening has closed two non-runtime queue entries:
  - `1E:E91F` -> `nested-invalid-marker`
  - `1E:9681` -> `sentinel-control`
- the active unresolved queue is now:
  - `P0`: `1E:EE7F`
  - `P1`: `1E:DA96`
- still open after matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps; no runtime hits observed for `EE7F` or `DA96`.
- caller-family expansion partially succeeded (new callsites `01:8E3C/01:8E59`), but target callsites are still absent:
  - `01:B256`, `01:B273`, `01:B59B`
- newest telemetry still shows no runtime use of `L00A9*` index `0x20` (`32`) and no bank30 producer beyond indices `28/29`.
- callback/state forcing can now trigger a single `B1F9` entry, but still does not reach
  `B1F9`'s internal `L001210` callsites (`01:B256/01:B273/01:B59B`).
- stage telemetry now shows no progress beyond entry (`B226/B256/B273/B59B` all `0`)
  in the forced lane.
- targeted exec-point tracing now also confirms the forced entry-time state on both
  `01:9568`/`01:95AD` lanes, but the headless runner still reports only `01:B1F9`
  itself and no downstream helper/return sites.
- widened per-point-capped exec tracing keeps the same boundary:
  - only `01:B1F9` is seen; no `B226/B638/B6E3/B755/9575`
- widened WRAM write tracing around the expected wait-path state also stays flat:
  - no writes at `$0960/$0964/$0200/$0202/$1E2C/$0440/$0442/$0444/$040A`
- targeted side-effect tracing is now also negative: no helper/setup writes were
  observed around the forced `01:B1F9` entry.
- caller-stack proof now closes one ambiguity: the forced lane really is entering
  from `01:9568/01:95AD`.
- the new consolidated stall report closes the remaining headless ambiguity in
  that same lane:
  - both forced lanes hit `01:B1F9` once at frame `1201`
  - post-entry `L001210` hit count is `0`
  - both lanes stay pinned through frame `2199` with `state_1D10 = 0x4100`,
    `state_09A8 = 2`, `state_0960 = 0`
  - static `L00B1F9` read now isolates the `EE7F`-relevant selector to the
    prologue before the first `L00A9A0` call, so the later `L00B6A3/L00B6E3`
    worker surface is no longer a plausible hidden fallback for index `32`
- corrected late-window tracing plus static caller/routine reads now show a more
  specific next proving lane:
  - use manual debugger confirmation for the remaining `B1F9` question, or move
    to the next unblocked roadmap lane in headless mode, because further
    headless exec/state/write widening has stopped changing the observed
    boundary.

### Gate G2: tilemap provenance binding for first frame window (closed)

Goal:
- produce `frame/layer/tile-index -> ROM chunk` mapping for `1086..1093`.

Definition of done:
- provenance table added to:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`

Current status:
- closed via `mesen_range_1086_1093_provenance.{jsonc,md}` and memory-map binding.

### Gate G3: gameplay-era archaeology start

Goal:
- capture first deterministic gameplay window with design pack + runtime context.

Definition of done:
- one committed gameplay window with:
  - frame range assets
  - callback/context notes
  - initial bank10/bank11 contract pointers

Current status:
- the older promoted `v2_current` sweep is now historical evidence from an
  earlier mutable seed state, not the admissible baseline for the current
  `game_11.mss`
- a committed screenshot-backed `b_hold` cycle now exists for frames `76..156`
- the new seed-surface audit reclassifies the current `game_11.mss` as
  `front_end_menu_seed`:
  - no-input frames `0..7` stay on `02:9016` with `$1C6A = 1`,
    `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF`
  - `a_hold` and `b_hold` are still pixel-identical dynamic lanes from frame
    `62`, and `a+b` still first diverges at frame `219`, but all of that is
    now treated as mixed front-end/attract-demo evidence rather than direct
    gameplay proof
- the repo now does have preserved user-verified live-race seeds, but the
  current blocker has moved:
  - it is no longer "find any code-facing separator from the old corridor"
  - it is now "explain the stable HUD/OAM/substate split that already exists
    inside `02:9016`"
- the confirmed `live_race_mid` seed now also has a first bounded producer
  trace:
  - `$22/$23` are repeatedly rewritten in-frame and directly feed `BG2VOFS`
  - `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`
  - `TMAIN` briefly enables `BG3` at scanline `23`
  - the strongest current producer cluster is narrowed inside `L01318D` around
    `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
- the old post-`2050` no-input default-rival window is now a control surface,
  not the leading gameplay candidate:
  - aligned `0..11` compares show that both manual live-race seeds already
    differ immediately from that control in `oam_0730`, `state_11f3`,
    `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and `state_09a2`
  - the control window remains useful because it keeps the same callback and
    selector family while stripping away the live-race values
- visible-phase scanline work now explains the split itself and narrows the
  remaining edge to the queue cursor lifecycle:
  - visible-phase `7E:0053/0054` now has a directly observed equalization path:
    `00:0054` moves `0x38 -> 0x40 -> 0x48` on frame `90`, and `00:0053`
    catches up to `0x48` on frame `91`
  - the active visible `0600` queue window is empty (`read == write`)
  - late tracing now shows a transient frame-`91` `02:9016` state with
    `00:0055/0056 = 0xB8/0x14` before the older `00:8029` end-of-frame collapse
- next defensible target:
  - keep the old post-`2050` no-input window as the control surface
  - assign exact semantic roles inside the narrowed `L01318D` cluster while
    keeping the already-closed split-field ownership (`state_11f3`, `09A2`,
    `09A8`, `0053/0054`, `0020/0022`) in mind
  - keep the lab backend as the follow-up only for full composed-screen export;
    the second visual replicate itself is now already closed on the native
    savestate path for `BG2/BG3/OBJ`
  - only after that decide whether the best next gameplay-facing target is the
    old frame-`91` burst / frame-`92` reset path or a later `A`-lane follow-up

### CP-126: `live_race_plus30f` lab backend now has a closed frame anchor and a narrower export blocker

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
  - `rom_analysis/docs/lane3_today_work_brief.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_plus30f_lab_17495/manifest.json`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 0:0 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_smoke`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17495:17495 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17495`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17496:17496 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17496`
- observed result:
  - the smoke failure already closes the absolute start frame of the seed:
    `17495`
  - paired with the earlier `live_race_mid` raw-dump anchor (`16655`), that
    demotes the `plus30f` timing name to a historical label; the measured
    absolute delta between the two preserved seeds is `840` frames
  - the `17495` attempt emits a partial manifest with:
    - `captureCompleted = false`
    - `alignedStartBoundary.ppu.frameCount = 17495`
  - both `17495` and `17496` export attempts fail on the same narrowed bug:
    `failed to advance beyond frame 17495 after PpuFrame + 2048 PPU correction steps`
- practical reading:
  - `live_race_plus30f` is no longer blocked on unknown timing
  - it is blocked on a specific lab-backend boundary-correction failure
  - the next dev should treat human visual exports as the practical fallback
    for today's second-seed work while the backend path remains unstable

### CP-127: gameplay-native visible layers now replicate across both preserved live-race seeds

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `rom_analysis/docs/next_steps_roadmap.md`
- updated tooling:
  - `tools/build_gameplay_frame_bundle.py`
- promoted artifacts:
  - `tools/out/mesen_lane3_live_race_plus30f_native/state.json`
  - `tools/out/lane3_live_race_mid_native_bundle/bundle_manifest.json`
  - `tools/out/lane3_live_race_plus30f_native_bundle/bundle_manifest.json`
  - `tools/out/lane3_live_race_mid_native_bundle/native_visible_checks.json`
  - `tools/out/lane3_live_race_plus30f_native_bundle/native_visible_checks.json`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --frame 0 --frame-is-offset --out-dir tools/out/mesen_lane3_live_race_plus30f_native --frame-timeout-seconds 60`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_race_mid_native --frame 16655 --vram tools/out/mesen_lane3_live_race_mid_native/vram.bin --cgram tools/out/mesen_lane3_live_race_mid_native/cgram.bin --ppu-state tools/out/mesen_lane3_live_race_mid_native/ppu_state.json --oam tools/out/mesen_lane3_live_race_mid_native/oam.bin --native-frame-dir tools/out/mesen_lane3_live_race_mid_native --out-dir tools/out/lane3_live_race_mid_native_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_race_plus30f_native --frame 17495 --vram tools/out/mesen_lane3_live_race_plus30f_native/vram.bin --cgram tools/out/mesen_lane3_live_race_plus30f_native/cgram.bin --ppu-state tools/out/mesen_lane3_live_race_plus30f_native/ppu_state.json --oam tools/out/mesen_lane3_live_race_plus30f_native/oam.bin --native-frame-dir tools/out/mesen_lane3_live_race_plus30f_native --out-dir tools/out/lane3_live_race_plus30f_native_bundle`
- observed result:
  - the second preserved gameplay seed now reproduces the same useful native
    layer family as `live_race_mid`:
    `BG2 visible`, `BG3 visible`, and `sprites_screen` all materialize with
    non-black image payloads
  - the remaining composed-screen issue is now clearly not seed-specific:
    `main_visible.ppm` and `sub_visible.ppm` are byte-identical all-black
    outputs on both gameplay seeds
  - the new bundle-side fence makes that explicit instead of leaving it as an
    implicit visual gotcha:
    `native_visible_checks.json` records per-artifact byte statistics and
    `bundle_manifest.json` now carries warning rows for fully black native
    surfaces
- practical reading:
  - gameplay-native archaeology can now trust the savestate-backed `BG2/BG3`
    world layers plus `OBJ` separation on both preserved gameplay seeds
  - the open native question is only the composed `main/sub` export path; use
    the state-facing `main.png` or other full-scene review surfaces until that
    boundary is explained or replaced

### CP-128: wiki output is now mobile-friendly and mirrored as a NotebookLM markdown bundle

- promoted docs:
  - `rom_analysis/docs/next_steps_roadmap.md`
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `tools/README.md`
- updated tooling:
  - `tools/build_docs_wiki_report.py`
  - `tools/Makefile`
- promoted artifacts:
  - `tools/out/docs_wiki/index.html`
  - `tools/out/docs_wiki/site_index.json`
  - `tools/out/docs_wiki_markdown_bundle/README.md`
  - `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.md`
  - `tools/out/docs_wiki_markdown_bundle/wiki_combined.md`
  - `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.json`
- bounded validation:
  - `python3 -m py_compile tools/build_docs_wiki_report.py`
  - `make -C tools docs-wiki`
  - local spot-check of the generated HTML/CSS and the mirrored markdown bundle
  - `git diff --check`
- observed result:
  - the generated wiki now has a mobile navigation drawer instead of forcing
    the whole sidebar ahead of the content on narrow screens
  - tables, code blocks, cards, and artifact grids now collapse more safely on
    mobile without sacrificing the desktop layout
  - the same build now mirrors every markdown source from the curated wiki
    manifest into `tools/out/docs_wiki_markdown_bundle/`, preserving the
    original repo-relative paths under `sources/`
  - the bundle also exposes three NotebookLM-oriented entry points:
    `README.md`, `wiki_bundle_index.md`, and `wiki_combined.md`
- practical reading:
  - `make -C tools docs-wiki` is now the promoted sync point for both the HTML
    wiki and the NotebookLM markdown export
  - lane-3 handoff guidance is now explicit too:
    treat `BG` and `OBJ` surfaces as trusted gameplay review surfaces, and
    keep the next-agent handoff current whenever a checkpoint lands

### CP-129: gameplay video phase packs now close service/post, hard-phase, and prison lookup surfaces

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
  - `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `rom_analysis/docs/next_steps_roadmap.md`
- updated tooling:
  - `tools/build_video_phase_pack.py`
  - `tools/gameplay_video_phase_packs.json`
- promoted artifacts:
  - `tools/out/lane3_service_status_phase_pack/`
  - `tools/out/longplay_hard_phase_anchor_pack/`
  - `tools/out/longplay_prison_finale_phase_pack/`
- bounded validation:
  - `python3 -m py_compile tools/build_video_phase_pack.py`
  - `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`
- observed result:
  - the preserved `live_race_mid` AVI now has promoted named stills for the
    previously unseen checkpoint corridor:
    service/post exterior, attendant dialog, partial-results screen, and next
    checkpoint restart
  - the local longplay now also carries promoted anchor stills for later
    difficult phases:
    night, bridge, mountain-wall/no-shoulder, tunnel, and rain
  - the same longplay now closes the user-requested prison finale explicitly:
    arrest prelude -> license revoked / prison still -> high-score follow-up
- practical reading:
  - lane 3 no longer lacks human-facing lookup surfaces for those missing
    gameplay moments
  - those packs are intentionally fenced as video anchors, not as substitutes
    for the trusted savestate-backed `BG/OBJ` gameplay surfaces
  - the next good use of effort is to target one of these named moments with a
    real emulator-side `BG/OBJ` capture path instead of searching videos again

### CP-130: longplay snow anchors now close the last missing designer-confirmed visual gap

- promoted docs:
  - `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `rom_analysis/docs/next_steps_roadmap.md`
- updated tooling/spec:
  - `tools/gameplay_video_phase_packs.json`
- promoted artifacts:
  - `tools/out/longplay_snow_phase_pack/`
- bounded validation:
  - `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`
- observed result:
  - the user-guided one-hour search was correct:
    the local longplay enters a snow-driving corridor at `01:00:00`
  - promoted snow anchors now cover:
    - onset at `3600s`
    - snowy mountain curve at `3740s`
    - snowy log-truck corridor at `3800s`
- practical reading:
  - the last missing designer-confirmed visual gap from the earlier hard-phase
    pack is now closed
  - the next move is no longer “find any snow frame”; it is “decide whether
    snow or service/post is the better next emulator-side `BG/OBJ` capture
    target”


## Source Of Truth :: Validation Gates

- Source: `rom_analysis/docs/validation_gates.md`
- Bundle copy: `sources/rom_analysis/docs/validation_gates.md`
- Last updated: `2026-03-19 23:14`
- Note: Bounded pass/fail policy for regression and callback checks.

---

# Validation Gates

This note formalizes automated pass/fail gates for the intro vertical slice.

## 1) Pixel Regression Gates

Contract:

- `validation/regression_gates_intro.jsonc`

Runner:

```sh
python3 tools/check_regression_gates.py \
  validation/regression_gates_intro.jsonc \
  --render-dir port/build/regression_frames \
  --json-out tools/out/regression_gates_intro_report.json
```

Current policy buckets:

- `solved_strict`: exact parity required (`0` mismatched pixels)
- `bootstrap_tolerated`: temporary bootstrap tolerance (`<=24` mismatched pixels)
- `mode7_tolerated`: temporary Mode 7 tolerance (`<=8` mismatched pixels)

This enforces explicit error budgets per checkpoint instead of ad hoc checks.

## 2) Callback/State Contracts

Contract:

- `rom_analysis/docs/callback_state_contracts.jsonc`

Runner:

```sh
python3 tools/validate_callback_contracts.py \
  rom_analysis/docs/callback_state_contracts.jsonc \
  tools/out/td2_boot_probe.json \
  --json-out tools/out/callback_state_contracts_report.json
```

This validates callback continuity and selected state fields at known frames
(`01:A39C`, `01:9D69`, `01:9FE5` windows) as first-class machine checks.
Use a probe capture that matches the contract's expected profile in
`expected_probe_profile`, for example a run with
`TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe`.

## 3) Practical Gate Policy

For each archaeology lane:

1. Add or update checkpoint rows in the JSON contracts.
2. Keep temporary tolerances only for known unstable windows.
3. Reduce tolerances as renderer/state fidelity improves.
4. Promote checkpoint to strict (`0`) once solved.


## Source Of Truth :: Validation README

- Source: `validation/README.md`
- Bundle copy: `sources/validation/README.md`
- Last updated: `2026-03-28 14:05`
- Note: Current Mesen capture, probe, and export workflow.

---

# Validation

This directory contains the first validation harness artifact for Sprint 0.

Current asset:

- `mesen_capture.lua`: a Mesen-S/Mesen 2 Lua script that can override input for a fixed window, emit per-frame screenshots, and write a JSON input log
- `run_mesen_capture.sh`: a launcher that creates an isolated Mesen config inside the repo, enables Lua file I/O, and runs the script in `--testRunner` mode
- `mesen_probe_boot.lua`: a lightweight state probe that records boot/title selectors like `$1C78/$1C7A/$1CCA/...` once per frame
- `run_mesen_probe_boot.sh`: convenience wrapper around the generic launcher for the boot probe
- `mesen_dump_bg_range.lua`: single-run range dumper for `VRAM + CGRAM + PPU state` and optional screenshots on selected frames
- `run_mesen_dump_bg_range.sh`: convenience wrapper around the generic launcher for that range dumper
- `mesen_scanline_step_test.lua`: an experimental scanline-step probe that uses `emu.step(..., ppuScanline)` plus `codeBreak` to sample `emu.getState()` once per visible scanline on a target frame; it now also accepts the same seeded savestate/input-window pattern used by the gameplay harnesses, records gameplay-facing layer scroll/callback fields alongside the old `ppu.mode7.*` values, and emits `frame_events` snapshots for traced `start`/`end` frame boundaries

Expected workflow:

1. Boot the ROM in Mesen-S.
2. Navigate manually to a deterministic starting point, or load a known savestate at the start of track 1.
3. Load `validation/mesen_capture.lua`.
4. Let the script wait through its configured warm-up frames.
5. The script will hold the configured input pattern for 300 frames and dump PNGs plus a JSON log.

For automated headless runs with Mesen2's test runner:

```sh
./validation/run_mesen_capture.sh
```

For short review windows where you want a reproducible bundle of visual
artifacts instead of a one-off capture, use:

```sh
python3 tools/run_mesen_guided_export.py \
  intro_mode7_rotation \
  1094 \
  1101 \
  --input-windows '6800:start;6900-6920:start,a' \
  --question 'Is this window rotating the same Mode 7 source blob or switching producers?'
```

That wrapper assembles the repo's current high-signal review surfaces in one
place:

- bridge-extracted frame folders under `tools/out/<slug>_<start>_<end>_frames/`
- design packs under `tools/out/<slug>_<start>_<end>_design/`
- a boot probe with `DMA/VRAM/Mode7` traces plus producer-side
  `write_point_trace`
- normalized activity trace JSON/Markdown
- visual contracts for the whole range
- a Markdown note skeleton under `rom_analysis/docs/`

Useful options:

- `--savestate <path>`: seed the probe from a deterministic state
- `--with-provenance --chunk-validation tools/out/bank13_chunk_validation.json`:
  also build a tilemap provenance artifact from the generated
  `td2_boot_probe_l001210_exec.json`
- `--dry-run`: print the exact commands and paths without executing Mesen
- `--skip-*`: reuse existing extracted frames or probes while rebuilding later
  stages

The default probe configuration is intentionally review-oriented rather than
minimal: it enables `DMA`, direct `VRAM`, `Mode 7`, and
`OAM/VRAM/CGRAM` register write tracing so the resulting visual-contract bundle
is useful for later callback/state attribution instead of only pixel review.

For the experimental instrumented-Mesen backend path, use:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=90 \
./validation/run_mesen_lab_backend.sh \
  ./game.smc \
  --load-state ./.mesen-config/Mesen2/SaveStates/game_11.mss \
  --run-range 18030:18032 \
  --probe-set frame_core_probe,dma_vram_probe,mode7_probe \
  --export-dir tools/out/mesen_lab_mvp_18030_18032
```

That launcher:

- prepares the same isolated `XDG_CONFIG_HOME=.mesen-config` setup used by the
  Lua-based runners
- calls the local `Mesen --labRunner` backend mode directly instead of the Lua
  test runner
- normalizes `--load-state`, `--export-dir`, and `--manifest-out` paths
- enforces an outer shell timeout via `MESEN_TIMEOUT_SECONDS`

Current MVP capture semantics for `--labRunner` are explicit on purpose:

- the runner aligns to a frame boundary first
- each exported frame stores both `startBoundary` and `endBoundary`
- the event snapshot is taken at the end boundary with
  `ShowPreviousFrameEvents = true`
- `frame.json` therefore preserves both state surfaces instead of pretending
  the step landed on a single canonical instant

Current bundle layout:

- `manifest.json`
- `summary.json`
- `frame_XXXXXX/frame.json`
- `frame_XXXXXX/events.json`
- optional `frame_XXXXXX/vram.bin`, `cgram.bin`, `oam.bin` for
  `dma_vram_probe`

See also:

- `rom_analysis/docs/mesen_instrumented_backend_architecture.md`

For the targeted non-square OBJ vertical-mirror regression, build the runtime
and run:

```sh
make -C tools obj-vertical-flip-check
```

That check generates a tiny 16x32 vertically mirrored sprite fixture under
`tools/out/obj_vertical_flip_check/` and verifies four paths against the same
golden PPM:

- Python `render_mesen_snes_bg.py` simple OBJ renderer
- Python `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
- SDL runtime direct `--snes-bg-*` render in non-Mode-7
- SDL runtime direct `--snes-bg-*` render in Mode 7

For the BG4 plus tile-priority regression, run:

```sh
make -C tools bg-layer-priority-check
```

That check generates a tiny four-layer mode-0 scene under
`tools/out/bg_layer_priority_check/` and verifies:

- BG4-only visibility
- low-priority layer ordering
- high-priority tile ordering over lower-priority foreground tiles
- the same result in both `render_mesen_snes_bg.py` and the SDL runtime

For routine repo hygiene before switching lanes, run:

```sh
make -C tools clean-generated-dry-run
make -C tools clean-generated
```

`tools/out/` is now git-ignored by default. Existing tracked proof artifacts in
that tree still behave normally, but newly promoted evidence from `tools/out/`
should be added explicitly with `git add -f`.

`run_mesen_capture.sh` now resolves the emulator in this order:

- `MESEN_BIN`
- `MESEN_RELEASE_DIR/Mesen`
- `Mesen` or `mesen` on `PATH`

The shared launcher now also normalizes these paths before invoking
`Mesen --testRunner`:

- ROM path and Lua script path: relative to the caller's current directory
- optional savestate path: relative to the caller's current directory
- repo-facing output prefixes like `tools/out/...`: relative to the repo root

This matters because the Mesen test runner resolves Lua relative file I/O under
the isolated config tree (`.mesen-config/Mesen2`), not the repo cwd. Without
that normalization, nested repo-relative prefixes can time out after silent
write failures inside the config directory.

For the bridge extractor path, `tools/run_mesen_ppu_extract.sh` uses
`MESEN_RELEASE_DIR` to locate `MesenCore.so` and can also derive that directory
from `MESEN_BIN` or `PATH`.

`mesen_ppu_extract` now also accepts preserved savestates directly:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_mid.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_mid_native \
  --frame-timeout-seconds 60
```

Use this path for gameplay-native layer extraction when a preserved seed exists.
It avoids the long replay route back into gameplay and is now the preferred
way to recover native `bg2_visible.ppm`, `bg3_visible.ppm`, `sprites.json`,
and related design-pack material from lane-3 savestates.

`mesen_capture.lua` now accepts the same lightweight env-style overrides used by
the other probes:

- `TD2_CAPTURE_WARMUP_FRAMES`
- `TD2_CAPTURE_FRAMES`
- `TD2_CAPTURE_SCREENSHOT_EVERY`
- `TD2_CAPTURE_PLAYER`
- `TD2_CAPTURE_OUTPUT_PREFIX`
- `TD2_CAPTURE_INPUT`
- `TD2_CAPTURE_INPUT_START_FRAME`
- `TD2_CAPTURE_INPUT_END_FRAME`
- `TD2_CAPTURE_INPUT_WINDOWS`

`TD2_CAPTURE_INPUT_WINDOWS` uses the same semicolon-separated `start-end:buttons`
or `frame:buttons` format as the boot probe, for example:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_CAPTURE_OUTPUT_PREFIX=tools/out/track1_seed_sweep_v1/start_then_b_hold/capture \
TD2_CAPTURE_INPUT_WINDOWS='60:start;61-359:b' \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

To seed the run from a deterministic savestate instead of power-on:

```sh
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua /absolute/path/to/start_state.mss
```

For short human-review packs where the goal is direct screenshot comparison
rather than bridge-extracted layer packs, use `mesen_capture.lua` plus
`tools/build_capture_sequence_manifest.py`. This is useful when a long warmup
path is stable in the test runner but awkward in the bridge extractor.

Example: compare the first shared post-`02:9016` window of the default-rival
and no-opponent paths:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=400 \
TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture/capture \
TD2_CAPTURE_WARMUP_FRAMES=2048 \
TD2_CAPTURE_FRAMES=41 \
TD2_CAPTURE_SCREENSHOT_EVERY=4 \
TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=400 \
TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture/capture \
TD2_CAPTURE_WARMUP_FRAMES=2048 \
TD2_CAPTURE_FRAMES=41 \
TD2_CAPTURE_SCREENSHOT_EVERY=4 \
TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua

python3 tools/build_capture_sequence_manifest.py \
  tools/out/post9016_default_rival_capture/capture_input_log.json \
  tools/out/post9016_default_rival_capture/sequence.txt \
  --json-out tools/out/post9016_default_rival_capture/sequence.json \
  --start-frame 2048 \
  --end-frame-exclusive 2089

python3 tools/build_capture_sequence_manifest.py \
  tools/out/post9016_no_opponent_clock_capture/capture_input_log.json \
  tools/out/post9016_no_opponent_clock_capture/sequence.txt \
  --json-out tools/out/post9016_no_opponent_clock_capture/sequence.json \
  --start-frame 2048 \
  --end-frame-exclusive 2089
```

The resulting PNG pairs can then be reviewed directly, with an external
question sheet such as `tools/out/post9016_compare_questions.md`. The capture
runner now applies `TD2_CAPTURE_INPUT_WINDOWS` during warmup as well as during
the explicit screenshot phase; without that, long power-on paths silently miss
their early `start/right/down` confirms.

To inspect the boot/title selectors directly:

```sh
./validation/run_mesen_probe_boot.sh
```

`mesen_probe_boot.lua` now also accepts callback-relative input windows through
`TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS`.

That format is:

- `point_id+offset:buttons`
- `point_id+start-end:buttons`

where `point_id` matches a labeled entry from `TD2_BOOT_PROBE_TRACE_EXEC_POINTS`.

Example:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2' \
TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' \
TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' \
./validation/run_mesen_probe_boot.sh ./game.smc
```

The probe JSON now records both `trigger_input_windows` and the first traced
frame for each exec-point id under `exec_point_trace.first_frames`.

When using `TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS`, make the trace window start
before the trigger point can first execute. If `TD2_BOOT_PROBE_TRACE_START_FRAME`
defaults to the screenshot frame, the probe will only learn `first_frames` too
late for callback-relative input to fire.

For direct state-window comparison between two recovered boot probes, use
`tools/compare_boot_probe_windows.py`:

```sh
python3 tools/compare_boot_probe_windows.py \
  tools/out/select_opponent_clock_path_v2/td2_boot_probe.json \
  tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json \
  tools/out/snes_select_opponent_post_9016_state_compare.json \
  --markdown-out tools/out/snes_select_opponent_post_9016_state_compare.md \
  --label-a default_rival \
  --label-b no_opponent_clock \
  --start-frame 2044 \
  --end-frame 2199
```

That compare is useful when both lanes already share the same callback family
and you want to narrow the remaining WRAM split instead of rerunning Mesen
blindly.

For producer-side visual ownership tracing, the same probe can now carry
write-breakpoint hits for `VRAM/CGRAM/OAM`-related registers. The resulting
`td2_boot_probe.json` can be fed into
`tools/build_mesen_visual_contract.py --probe-json ...`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=75 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=987 \
TD2_BOOT_PROBE_TRACE_START_FRAME=982 \
TD2_BOOT_PROBE_TRACE_END_FRAME=986 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh
```

Then merge that probe payload into a visual contract:

```sh
python3 tools/build_mesen_visual_contract.py \
  tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 \
  tools/out/visual_contract_7051_with_probe.json \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc \
  --probe-json tools/out/visual_contract_probe_7051/td2_boot_probe.json
```

`td2_boot_probe.json` now also preserves `trace_start_frame` and
`trace_end_frame` in the main payload, so merged visual contracts can retain an
exact `producerTrace.traceWindow` instead of only the per-domain frame spans.

For active behavior mapping beyond coarse `write_point_trace` counts, the same
probe can also emit:

- `*_dma_writes.json`
- `*_vram_writes.json`
- `*_mode7_writes.json`

Those traces can be normalized into one frame/callback-oriented activity report
with `tools/build_mesen_activity_trace.py`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=180 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1094_1117/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1118 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1094 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1117 \
TD2_BOOT_PROBE_TRACE_DMA=1 \
TD2_BOOT_PROBE_TRACE_VRAM=1 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_activity_trace.py \
  tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md
```

This path is useful when the question is no longer just "which domain wrote
something?" but:

- which callback family owned the writes
- which scanline they landed on
- whether the window is doing `DMA`, direct `VRAM/CGRAM` writes, or only
  repeated register programming
- whether a later mismatch boundary aligns with a real behavior change
  (`callback` switch, `OAM` DMA shutdown, `Mode 7` register-set reduction, and
  so on)

The visual-contract builders can now also merge that normalized activity layer
directly with `--activity-trace-json`, so a range summary can carry
`callback/state + BG/OBJ surface + DMA/direct/Mode7 activity` in the same
artifact:

```sh
python3 tools/build_mesen_visual_contract_range.py \
  tools/out/design_mesen_range_1102_1109_v1 \
  tools/out/visual_contract_range_1102_1109_activity \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc \
  --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json \
  --clean-out
```

For the post-`1093` compare rubric itself, use:

```sh
python3 tools/build_mesen_window_compare.py \
  tools/out/post_1093_compare_1102_1117/summary.json \
  tools/out/mesen_range_1102_1109_v1 \
  tools/out/mesen_range_1110_1117_v1 \
  --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/post_1093_compare_1102_1117/summary.md
```

The Python `Mode 7` compare path now defaults to the promoted scanline-start
rule `line + 1`:

- `tools/render_mesen_snes_bg.py`
- `tools/build_mesen_window_compare.py`
- `tools/build_mode7_plateau_analysis.py`

Use the default for normal Lane 2 evidence generation. Only pass
`--mode7-line-bias 0` when you want the old current-line counterfactual for a
targeted validation or source-comparison run.

That promotion is intentionally scoped to the Python/tooling path for now. The
same rule is not yet committed into the SDL runtime because
`port/src/td2_ppu.c` currently carries unrelated dirty work and should not be
mixed with this checkpoint.

That builder automates the same questions that were previously being answered
by hand:

- whether `main_visible.ppm` is still the top crop of `main.ppm`
- whether a visible-state `ppu_state_visible.json` render helps or hurts
- whether the compare boundary lines up with a real activity boundary like
  `callback` change or `OAM DMA` shutdown

For the narrower static-plateau follow-up after the compare summary already
exists, use:

```sh
python3 tools/build_mode7_plateau_analysis.py \
  tools/out/post_1093_compare_1102_1117/summary.json \
  tools/out/design_mesen_range_1102_1109_v1 \
  tools/out/design_mesen_range_1110_1117_v1 \
  tools/out/mode7_plateau_1105/analysis.json \
  --markdown-out tools/out/mode7_plateau_1105/analysis.md
```

For the exact-hit `pixel 0 / X-origin / scanline-start` follow-up on the same
canonical plateau, use:

```sh
python3 tools/build_mode7_first_pixel_audit.py \
  tools/out/mode7_plateau_1105/analysis.json \
  tools/out/mode7_first_pixel_1105/audit.json \
  --markdown-out tools/out/mode7_first_pixel_1105/audit.md
```

That builder compares a small set of direct model candidates against both:

- `main_visible.ppm`
- `layers/bg1_visible.ppm`

The current exact-hit set is:

- base current renderer
- visible-state current renderer
- increment-before-sample
- `pixel 0` origin `+1`
- scanline `Y + 1`

For the bounded "is there still another small local tweak hiding in the
`bg1_visible` export?" follow-up after the composed screen is already exact,
use:

```sh
python3 tools/build_mode7_bg1_export_audit.py \
  tools/out/mode7_plateau_1105_default/analysis.json \
  tools/out/mode7_bg1_export_audit_1105/audit.json \
  --markdown-out tools/out/mode7_bg1_export_audit_1105/audit.md
```

That audit scans a small implementation-adjacent grid over:

- `yLineBias`
- `xOriginBias`
- `hscrollBias`
- sample-before vs sample-after increment

and keeps the composed-screen constraint explicit by comparing each candidate
against both:

- `main_visible.ppm`
- `layers/bg1_visible.ppm`

Current reading from the promoted `1105` / `1117` audit pair:

- `36` models scanned per endpoint
- `5` models keep the composed scene at `0`
- none of those `5` improves the `bg1_visible` mismatch below `2271`

That is strong evidence that the remaining late-attract layer gap is better
read as export-surface semantics than another small `Mode 7` renderer tweak.

That export-side ambiguity is now closed more directly too:

- `tools/mesen_ppu_extract/Program.cs` writes `layers/bg1.ppm` from
  `GetTilemap(...)` and then derives `layers/bg1_visible.ppm` via
  `NormalizeScroll(...) + CropVisibleRegion(...)`
- `tools/build_mesen_visible_crop_audit.py` proves that path against promoted
  late-attract design packs:

```sh
python3 tools/build_mesen_visible_crop_audit.py \
  tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json \
  tools/out/design_mesen_range_1102_1109_v1/frame_01102 \
  tools/out/design_mesen_range_1102_1109_v1/frame_01105 \
  tools/out/design_mesen_range_1110_1117_v1/frame_01117 \
  --markdown-out tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md
```

Current result from that audit:

- `1102/1105/1117` all land at `0` mismatched pixels
- raw layer scroll `0,8191` normalizes to `0,0`

Use that reading operationally:

- `main_visible.ppm` stays the renderer-parity surface
- `layers/*_visible.ppm` should be treated as viewer/export surfaces unless a
  task is explicitly about the bridge extractor itself

This path is useful when the remaining question is no longer "is there another
hidden upload?" and has narrowed to:

- whether `ppu_state_visible.json` actually differs on the canonical frame
- whether `sample-after-increment` collapses to the same output as `X-origin +1`
- whether the missing composed-screen rule is horizontal or actually a
  scanline-start term

This path is useful once a late-attract window has already collapsed to one
static scene and the remaining question is more specific:

- whether the fixed diff box is mostly `BG` or mostly sprite coverage
- whether the extracted visible `bg1` surface is also static across the plateau
- whether a small horizontal shift improves the BG-only compare enough to
  justify investigating `Mode 7` sampling next
- whether the plateau bbox ever touches the `Mode 7` outside-map path at all,
  which is the quickest way to keep or demote `M7SEL` edge/fill behavior as a
  live suspect

A current headless proof that uses only repo-relative prefixes is:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=30 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/frame300_live_probe_cap2048/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_TRACE_START_FRAME=0 \
TD2_BOOT_PROBE_TRACE_END_FRAME=300 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=2048 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  port/assets/test_dump_frame300/design_pack \
  tools/out/visual_contract_frame300_live_probe_cap2048.json \
  --probe-json tools/out/frame300_live_probe_cap2048/td2_boot_probe.json
```

That proof currently yields live `vram`, `cgram`, `oam`, and `obj_state`
producer domains. Narrower late windows can still return `write_point_trace`
`0` hits if no writes occur there, so an empty trace is now a window-selection
signal rather than a launcher failure.

A promoted later-window proof chain now also exists at frames `986`, `990`,
`994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`, `1045`, `1053`,
`1061`, `1069`, `1077`, `1085`, and `1093`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=986

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=987 \
TD2_BOOT_PROBE_TRACE_START_FRAME=982 \
TD2_BOOT_PROBE_TRACE_END_FRAME=986 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame986 \
  tools/out/visual_contract_frame986_live_probe.json \
  --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json
```

Current reading for that `986` proof:

- `tools/out/visual_contract_probe_986_live/td2_boot_probe.json` records
  `3246` write hits with `0` drops
- the merged contract shows:
  - exact `producerTrace.traceWindow = 982..986`
  - OAM writes across frames `982..986`
  - VRAM writes at frames `984` and `986`
  - no `CGRAM` or `OBJSEL` writes in that bounded late window
- `tools/out/design_frame986/sprites/sprites_visible.json` reports `0`
  visible sprites, which matches the late-overlay-cleared reading for frame
  `986`

The same proof path now also reaches `990` and `994`. If `994` times out while
another Mesen job is running, extract the raw frame standalone first with
`--frame-timeout-seconds 120` and then build the design pack:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=990

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=991 \
TD2_BOOT_PROBE_TRACE_START_FRAME=986 \
TD2_BOOT_PROBE_TRACE_END_FRAME=990 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame990 \
  tools/out/visual_contract_frame990_live_probe.json \
  --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --frame 994 \
  --frame-timeout-seconds 120 \
  --out-dir ./tools/out/mesen_frame994

python3 tools/build_mesen_design_pack.py \
  tools/out/mesen_frame994 \
  tools/out/design_frame994 \
  --clean-out

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=995 \
TD2_BOOT_PROBE_TRACE_START_FRAME=990 \
TD2_BOOT_PROBE_TRACE_END_FRAME=994 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame994 \
  tools/out/visual_contract_frame994_live_probe.json \
  --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json
```

Current reading for those `990/994` proofs:

- frame `990`:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json` records
    `3762` write hits with `0` drops
  - the merged contract keeps exact
    `producerTrace.traceWindow = 986..990`
  - producer domains:
    - OAM writes across frames `986..990`
    - VRAM writes across frames `986/988/989/990`
  - `tools/out/design_frame990/sprites/sprites_visible.json` reports `5`
    visible sprites
  - `tools/out/mesen_frame990/main_visible.ppm` is `1516` pixels from the
    local frame-`990` screenshot and `2` pixels from
    `tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm`
- frame `994`:
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json` records
    `4020` write hits with `0` drops
  - the merged contract keeps exact
    `producerTrace.traceWindow = 990..994`
  - producer domains:
    - OAM writes across frames `990..994`
    - VRAM writes across frames `990..994`
  - `tools/out/design_frame994/sprites/sprites_visible.json` reports `19`
    visible sprites
  - `tools/out/mesen_frame994/main_visible.ppm` is `2622` pixels from the
    local frame-`994` screenshot and `96` pixels from
    `tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm`
- both windows stay on the same late callback family:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also reaches the start of the direct
bridge-extracted block at `998`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=998

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=999 \
TD2_BOOT_PROBE_TRACE_START_FRAME=994 \
TD2_BOOT_PROBE_TRACE_END_FRAME=998 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame998 \
  tools/out/visual_contract_frame998_live_probe.json \
  --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame998/vram.bin \
  tools/out/mesen_frame998/cgram.bin \
  tools/out/mesen_frame998/ppu_state.json \
  tools/out/mesen_frame998_mode7ppu.ppm \
  --oam tools/out/mesen_frame998/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame998_mode7ppu.json
```

Current reading for that `998` proof:

- `tools/out/visual_contract_probe_998_live/td2_boot_probe.json` records
  `4020` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 994..998`
- producer domains:
  - OAM writes across frames `994..998`
  - VRAM writes across frames `994..998`
- `tools/out/design_frame998/sprites/sprites_visible.json` reports `32`
  visible sprites
- `tools/out/mesen_frame998/main_visible.ppm` is `3119` pixels from the local
  frame-`998` screenshot
- `tools/out/mesen_frame998_mode7ppu.ppm` is `4` pixels from
  `tools/out/mesen_frame998/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the first direct bridge-extracted
`998..1005` block at frame `1005`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1005

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1006 \
TD2_BOOT_PROBE_TRACE_START_FRAME=998 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1005 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1005 \
  tools/out/visual_contract_frame1005_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BG_RANGE_START_FRAME=1005 \
TD2_BG_RANGE_END_FRAME=1005 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop \
./validation/run_mesen_dump_bg_range.sh

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1005/vram.bin \
  tools/out/mesen_frame1005/cgram.bin \
  tools/out/mesen_frame1005/ppu_state.json \
  tools/out/mesen_frame1005_mode7ppu.ppm \
  --oam tools/out/mesen_frame1005/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1005_mode7ppu.json
```

Current reading for that `1005` proof:

- `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json` records
  `6432` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 998..1005`
- producer domains:
  - OAM writes across frames `998..1005`
  - VRAM writes across frames `998..1005`
- `tools/out/design_frame1005/sprites/sprites_visible.json` reports `53`
  visible sprites
- `tools/out/intro_loop_frame_01005_frame.png` is `4466` pixels from
  `tools/out/mesen_frame1005/main_visible.ppm`
- `tools/out/mesen_frame1005_mode7ppu.ppm` is `4` pixels from
  `tools/out/mesen_frame1005/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the next direct bridge-extracted
`1006..1013` block at frame `1013`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1013

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1014 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1006 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1013 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1013 \
  tools/out/visual_contract_frame1013_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1013/vram.bin \
  tools/out/mesen_frame1013/cgram.bin \
  tools/out/mesen_frame1013/ppu_state.json \
  tools/out/mesen_frame1013_mode7ppu.ppm \
  --oam tools/out/mesen_frame1013/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1013_mode7ppu.json
```

Current reading for that `1013` proof:

- `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json` records
  `6174` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1006..1013`
- producer domains:
  - OAM writes across frames `1006..1013`
  - VRAM writes across frames `1006..1012`
- `tools/out/design_frame1013/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01013_frame.png` is `4638` pixels from
  `tools/out/mesen_frame1013/main_visible.ppm`
- `tools/out/mesen_frame1013_mode7ppu.ppm` is `10` pixels from
  `tools/out/mesen_frame1013/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1014..1021` block at frame `1021`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1021

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1022 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1014 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1021 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1021 \
  tools/out/visual_contract_frame1021_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1021/vram.bin \
  tools/out/mesen_frame1021/cgram.bin \
  tools/out/mesen_frame1021/ppu_state.json \
  tools/out/mesen_frame1021_mode7ppu.ppm \
  --oam tools/out/mesen_frame1021/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1021_mode7ppu.json
```

Current reading for that `1021` proof:

- `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json` records
  `5400` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1014..1021`
- producer domains:
  - OAM writes across frames `1014..1021`
  - VRAM writes at frames `1014/1015/1017/1019`
- `tools/out/design_frame1021/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01021_frame.png` is `3557` pixels from
  `tools/out/mesen_frame1021/main_visible.ppm`
- `tools/out/mesen_frame1021_mode7ppu.ppm` is `10` pixels from
  `tools/out/mesen_frame1021/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1022..1029` block at frame `1029`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1029

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1030 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1022 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1029 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1029 \
  tools/out/visual_contract_frame1029_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1029/vram.bin \
  tools/out/mesen_frame1029/cgram.bin \
  tools/out/mesen_frame1029/ppu_state.json \
  tools/out/mesen_frame1029_mode7ppu.ppm \
  --oam tools/out/mesen_frame1029/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1029_mode7ppu.json
```

Current reading for that `1029` proof:

- `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json` records
  `3822` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1022..1029`
- producer domains:
  - OAM writes across `1022/1023/1024/1025/1027/1028/1029`
  - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
- `tools/out/design_frame1029/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01029_frame.png` is `1` pixel from
  `tools/out/mesen_frame1029/main_visible.ppm`
- `tools/out/mesen_frame1029_mode7ppu.ppm` is `11` pixels from
  `tools/out/mesen_frame1029/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1030..1037` block at frame `1037`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1037

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1038 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1030 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1037 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1037 \
  tools/out/visual_contract_frame1037_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1037/vram.bin \
  tools/out/mesen_frame1037/cgram.bin \
  tools/out/mesen_frame1037/ppu_state.json \
  tools/out/mesen_frame1037_mode7ppu.ppm \
  --oam tools/out/mesen_frame1037/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1037_mode7ppu.json
```

Current reading for that `1037` proof:

- `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1030..1037`
- producer domains:
  - OAM writes across `1030..1037`
  - VRAM writes at `1030` and `1034`
- `tools/out/design_frame1037/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01037_frame.png` is `29` pixels from
  `tools/out/mesen_frame1037/main_visible.ppm`
- `tools/out/mesen_frame1037_mode7ppu.ppm` is `8` pixels from
  `tools/out/mesen_frame1037/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1038..1045` block at frame `1045`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1045

# Do not run this probe and the screenshot dumper in parallel against the same
# isolated config; that bounded attempt ended with exit 255 locally.
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1046 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1038 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1045 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1045 \
  tools/out/visual_contract_frame1045_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1045/vram.bin \
  tools/out/mesen_frame1045/cgram.bin \
  tools/out/mesen_frame1045/ppu_state.json \
  tools/out/mesen_frame1045_mode7ppu.ppm \
  --oam tools/out/mesen_frame1045/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1045_mode7ppu.json
```

Current reading for that `1045` proof:

- `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1038..1045`
- producer domains:
  - OAM writes across `1038..1045`
  - VRAM writes at `1038` and `1042`
- `tools/out/design_frame1045/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01045_frame.png` is `34` pixels from
  `tools/out/mesen_frame1045/main_visible.ppm`
- `tools/out/mesen_frame1045_mode7ppu.ppm` is `15` pixels from
  `tools/out/mesen_frame1045/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1046..1053` block at frame `1053`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1053

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1054 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1046 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1053 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1053 \
  tools/out/visual_contract_frame1053_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1053/vram.bin \
  tools/out/mesen_frame1053/cgram.bin \
  tools/out/mesen_frame1053/ppu_state.json \
  tools/out/mesen_frame1053_mode7ppu.ppm \
  --oam tools/out/mesen_frame1053/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1053_mode7ppu.json
```

Current reading for that `1053` proof:

- `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1046..1053`
- producer domains:
  - OAM writes across `1046..1053`
  - VRAM writes at `1046` and `1050`
- `tools/out/design_frame1053/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01053_frame.png` is `31` pixels from
  `tools/out/mesen_frame1053/main_visible.ppm`
- `tools/out/mesen_frame1053_mode7ppu.ppm` is `14` pixels from
  `tools/out/mesen_frame1053/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1054..1061` block at frame `1061`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1061

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1062 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1054 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1061 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1061 \
  tools/out/visual_contract_frame1061_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1061/vram.bin \
  tools/out/mesen_frame1061/cgram.bin \
  tools/out/mesen_frame1061/ppu_state.json \
  tools/out/mesen_frame1061_mode7ppu.ppm \
  --oam tools/out/mesen_frame1061/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1061_mode7ppu.json
```

Current reading for that `1061` proof:

- `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1054..1061`
- producer domains:
  - OAM writes across `1054..1061`
  - VRAM writes at `1054` and `1058`
- `tools/out/design_frame1061/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01061_frame.png` is `36` pixels from
  `tools/out/mesen_frame1061/main_visible.ppm`
- `tools/out/mesen_frame1061_mode7ppu.ppm` is `22` pixels from
  `tools/out/mesen_frame1061/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1062..1069` block at frame `1069`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1069

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1070 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1062 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1069 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1069 \
  tools/out/visual_contract_frame1069_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1069/vram.bin \
  tools/out/mesen_frame1069/cgram.bin \
  tools/out/mesen_frame1069/ppu_state.json \
  tools/out/mesen_frame1069_mode7ppu.ppm \
  --oam tools/out/mesen_frame1069/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1069_mode7ppu.json
```

Current reading for that `1069` proof:

- `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1062..1069`
- producer domains:
  - OAM writes across `1062..1069`
  - VRAM writes at `1062` and `1066`
- `tools/out/design_frame1069/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01069_frame.png` is `48` pixels from
  `tools/out/mesen_frame1069/main_visible.ppm`
- `tools/out/mesen_frame1069_mode7ppu.ppm` is `25` pixels from
  `tools/out/mesen_frame1069/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1070..1077` block at frame `1077`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1077

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1078 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1070 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1077 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1077 \
  tools/out/visual_contract_frame1077_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1077/vram.bin \
  tools/out/mesen_frame1077/cgram.bin \
  tools/out/mesen_frame1077/ppu_state.json \
  tools/out/mesen_frame1077_mode7ppu.ppm \
  --oam tools/out/mesen_frame1077/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1077_mode7ppu.json
```

Current reading for that `1077` proof:

- `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1070..1077`
- producer domains:
  - OAM writes across `1070..1077`
  - VRAM writes at `1070` and `1074`
- `tools/out/design_frame1077/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01077_frame.png` is `36` pixels from
  `tools/out/mesen_frame1077/main_visible.ppm`
- `tools/out/mesen_frame1077_mode7ppu.ppm` is `52` pixels from
  `tools/out/mesen_frame1077/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1078..1085` block at frame `1085`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1085

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1086 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1078 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1085 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1085 \
  tools/out/visual_contract_frame1085_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1085/vram.bin \
  tools/out/mesen_frame1085/cgram.bin \
  tools/out/mesen_frame1085/ppu_state.json \
  tools/out/mesen_frame1085_mode7ppu.ppm \
  --oam tools/out/mesen_frame1085/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1085_mode7ppu.json
```

Current reading for that `1085` proof:

- `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1078..1085`
- producer domains:
  - OAM writes across `1078..1085`
  - no sampled VRAM writes fired in that bounded window
- `tools/out/design_frame1085/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01085_frame.png` is `74` pixels from
  `tools/out/mesen_frame1085/main_visible.ppm`
- `tools/out/mesen_frame1085_mode7ppu.ppm` is `69` pixels from
  `tools/out/mesen_frame1085/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1086..1093` block at frame `1093`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1093

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1094 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1086 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1093 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1093 \
  tools/out/visual_contract_frame1093_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1093/vram.bin \
  tools/out/mesen_frame1093/cgram.bin \
  tools/out/mesen_frame1093/ppu_state.json \
  tools/out/mesen_frame1093_mode7ppu.ppm \
  --oam tools/out/mesen_frame1093/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1093_mode7ppu.json
```

Current reading for that `1093` proof:

- `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1086..1093`
- producer domains:
  - OAM writes across `1086..1093`
  - no sampled VRAM writes fired in that bounded window
- `tools/out/design_frame1093/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01093_frame.png` is `207` pixels from
  `tools/out/mesen_frame1093/main_visible.ppm`
- `tools/out/mesen_frame1093_mode7ppu.ppm` is `129` pixels from
  `tools/out/mesen_frame1093/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

To dump a whole intro range in one emulator run:

```sh
MESEN_TIMEOUT_SECONDS=75 \
TD2_BG_RANGE_START_FRAME=654 \
TD2_BG_RANGE_END_FRAME=2070 \
TD2_BG_RANGE_STEP=4 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop \
./validation/run_mesen_dump_bg_range.sh
```

The same dumper can now replay a simple fixed input window while it captures a
seeded gameplay range:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BG_RANGE_START_FRAME=86 \
TD2_BG_RANGE_END_FRAME=93 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_OAM=1 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_INPUT_START_FRAME=60 \
TD2_BG_RANGE_INPUT_END_FRAME=359 \
TD2_BG_RANGE_INPUT=b \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/track1_seed_0086_0093 \
./validation/run_mesen_dump_bg_range.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

For multi-stage seeded gameplay schedules, `mesen_dump_bg_range.lua` also
accepts `TD2_BG_RANGE_INPUT_WINDOWS` in the same `start-end:buttons` or
`frame:buttons` format:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BG_RANGE_START_FRAME=61 \
TD2_BG_RANGE_END_FRAME=68 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_OAM=1 \
TD2_BG_RANGE_INPUT_WINDOWS='60:start;61-359:a' \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/track1_start_then_a_0061_0068_v1 \
./validation/run_mesen_dump_bg_range.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

That produces flat files like:

- `tools/out/intro_loop_frame_00654_vram.bin`
- `tools/out/intro_loop_frame_00654_cgram.bin`
- `tools/out/intro_loop_frame_00654_ppu_state.json`
- `tools/out/intro_loop_frame_00654_frame.png`
- `tools/out/intro_loop.json`

The boot probe writes a JSON timeline and a final screenshot under the script data folder, using the prefix `td2_boot_probe`.
Set `TD2_BOOT_PROBE_OUTPUT_PREFIX` to move that output into a repo-owned or
per-run location instead of the shared `LuaScriptData` directory.
You can also drive it with simple scripted input via environment variables, for example:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/bootprobe_run/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT=start,b \
./validation/run_mesen_probe_boot.sh
```

To limit that legacy pattern to a frame window, set `TD2_BOOT_PROBE_INPUT_END_FRAME`:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1800 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT_END_FRAME=359 \
TD2_BOOT_PROBE_INPUT=start,b \
./validation/run_mesen_probe_boot.sh
```

For richer deterministic sequences, use `TD2_BOOT_PROBE_INPUT_WINDOWS` with
semicolon-separated windows in `start-end:buttons` or `frame:buttons` form:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1800 \
TD2_BOOT_PROBE_INPUT_WINDOWS="240:start;241-360:b;654:start" \
./validation/run_mesen_probe_boot.sh
```

To capture the deterministic power-on copyright/credits scene around the `5` second mark:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
./validation/run_mesen_probe_boot.sh
```

To also dump the raw PPU memory and filtered `emu.getState()` snapshot for that same scene:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
./validation/run_mesen_probe_boot.sh
```

That writes:

- `tools/out/bootprobe_run/td2_boot_probe.json` when
  `TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/bootprobe_run/td2_boot_probe`
- `tools/out/bootprobe_run/td2_boot_probe_frame.png`
- `tools/out/bootprobe_run/td2_boot_probe_vram.bin`
- `tools/out/bootprobe_run/td2_boot_probe_cgram.bin`
- `tools/out/bootprobe_run/td2_boot_probe_oam.bin`
- `tools/out/bootprobe_run/td2_boot_probe_ppu_state.json`

If `TD2_BOOT_PROBE_OUTPUT_PREFIX` is unset, the legacy fallback still writes to
`.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.*`.

To trace chunk-dispatch usage at `00:9210` (`L001210`) with entry-time `$0C/$0E/$10`:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/summarize_l001210_trace.py \
  tools/out/td2_boot_probe_l001210_exec.json \
  --json-out tools/out/td2_boot_probe_l001210_summary.json

python3 tools/run_l001210_probe_matrix.py \
  --out-dir tools/out/l001210_probe_matrix \
  --total-frames 2200 \
  --timeout-seconds 90
```

To recover the later direct-hit cluster on the restored timed-input scenario:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=7065 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_L001210_MAX_HITS=256 \
TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a' \
MESEN_TIMEOUT_SECONDS=180 \
./validation/run_mesen_probe_boot.sh ./game.smc

python3 tools/summarize_l001210_trace.py \
  tools/out/td2_boot_probe_l001210_exec.json \
  --json-out tools/out/l001210_probe_7051_inputfix_summary.json
```

This is the current headless proof lane for the later direct-hit cluster:

- frame `7051` -> `0D:C4DC`
- frame `7059` -> `07:BF49`
- frame `7064` -> `07:C112`

The bridge extractor now also reopens the planned interior carry check on the
same timed-input scenario:

```sh
MESEN_RELEASE_DIR=/path/to/mesen/release \
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 \
  --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07055 \
  --frame-timeout-seconds 180 \
  --input-windows '6800:start;6900-6920:start,a'

MESEN_RELEASE_DIR=/path/to/mesen/release \
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7061 \
  --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07061 \
  --frame-timeout-seconds 180 \
  --input-windows '6800:start;6900-6920:start,a'
```

- `7055` shares the same BG tilemaps and `vram.bin` as `7051`, but it does not
  share the same sprite/OAM composition (`10` visible sprites -> `0`)
- `7061` shares the same BG tilemaps as `7059`, and its visible sprite set
  remains empty at both frames

To save a deterministic savestate snapshot at a specific probe frame:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1120 \
TD2_BOOT_PROBE_SAVE_SAVESTATE_FRAME=1093 \
TD2_BOOT_PROBE_SAVE_SAVESTATE=tools/out/l001210_state_1093.bin \
./validation/run_mesen_probe_boot.sh ./game.smc
```

Then use that state as a matrix start point:

```sh
python3 tools/run_l001210_probe_matrix.py \
  --out-dir tools/out/l001210_probe_matrix_from_1093 \
  --total-frames 2000 \
  --timeout-seconds 120 \
  --savestate tools/out/l001210_state_1093.bin
```

Current environment note:

- the headless `--testRunner` build can load a savestate when provided,
  but probe-side save attempts currently report:
  - `saved_savestate_error = "no supported savestate API found on emu table"`
- so the save-from-probe flow is documented but currently blocked until
  that API surface is available.

To force selector values for targeted branch testing windows:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=4000 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=0 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=3999 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1` re-applies the same forced values at
the `01:B1F9` exec point so the dynamic-index branch sees the requested values.
`TD2_BOOT_PROBE_FORCE_1C86` and `TD2_BOOT_PROBE_FORCE_1D10` are useful for
testing the `01:9568/01:95AD -> 01:B1F9` branch gates.

To force the active main callback pointer for a frame window:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=3200 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=2399 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`38248` is `0x9568` in decimal. Use `38317` (`0x95AD`) to target the sibling
callback branch.

To trace exact exec points in a targeted branch experiment:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=2200 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_TRACE_EXEC_POINTS='b1f9=01:B1F9,after_050f=01:B202,after_083f=01:B206,b226=01:B226,b256=01:B256,b273=01:B273,b59b=01:B59B,050f=00:050F,083f=00:083F' \
TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=32 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_TRACE_EXEC_POINTS` accepts a comma- or semicolon-separated list
of `label=BB:AAAA` or bare `BB:AAAA` SNES addresses. Matching exec hits are
captured into `td2_boot_probe.json` under `exec_point_trace`, and the capture
window is bounded by `TD2_BOOT_PROBE_TRACE_START_FRAME` /
`TD2_BOOT_PROBE_TRACE_END_FRAME`.
Use `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT` to cap repeated loop hits
per watched address when you only need the first `N` sightings of each point.

To trace exact write points in the same forced branch window:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=2200 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1202 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='hdmaen=00:420C,mosaic=00:2106,bgmode=00:2105,bg1sc=00:2107,bg2sc=00:2108,bg3sc=00:2109,bg12nba=00:210B,objsel=00:2101,tmain=00:212C,cgadsub=00:2131,cgwsel=00:2130,tmw=00:212E,setini=00:2133,tsub=00:212D,tsw=00:212F,w12sel=00:2123,w34sel=00:2124,wobjsel=00:2125,mem0966=7E:0966,mem0968=7E:0968,mem0974=7E:0974,mem0f42=00:0F42' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=128 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_TRACE_WRITE_POINTS` uses the same address syntax as
`TD2_BOOT_PROBE_TRACE_EXEC_POINTS` and records matching writes in
`td2_boot_probe.json` under `write_point_trace`.

When that trace is enabled, the probe also writes:

- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`

Recent payload additions in each `hits[]` entry:

- selector snapshot fields: `selector_1c78`, `selector_1c80`, `selector_1ca8`,
  `selector_1c86`, `selector_1cac`, `selector_1cae`
- additional state field: `state_1d10`
- caller site tagging: `caller_id`, `caller_pc_snes`, `caller_pc_linear`
- caller CPU regs: `caller_reg_a/x/y/pc/sp/ps/d/dbr/k`
- derived helper-table provenance for `01:A9BD`/`01:A9E1`:
  - `caller_l00a9_table`
  - `caller_l00a9_table_index`
  - `caller_l00a9_source_snes`
  - `caller_l00a9_source_linear`
  - `caller_l00a9_source_matches`

Recent top-level additions in `td2_boot_probe.json`:

- callback forcing config echo:
  - `force_main_callback_start_frame`
  - `force_main_callback_end_frame`
  - `force_main_callback_addr`
  - `force_main_callback_bank`
- `B1F9` execution counters:
  - `b1f9_exec_count`
  - `b1f9_exec_frames`
  - `b1f9_stage_counts` (`b226`, `b256`, `b273`, `b59b`)
  - `b1f9_stage_frames`
- exec-point trace bundle:
  - `trace_exec_points`
  - `exec_point_max_hits`
  - `exec_point_max_hits_per_point`
  - `exec_point_trace.hit_count`
  - `exec_point_trace.dropped_hits`
  - `exec_point_trace.hits[]` with CPU regs, stack bytes/return decode, plus selector/state snapshots
- write-point trace bundle:
  - `trace_write_points`
  - `write_point_max_hits`
  - `write_point_trace.hit_count`
  - `write_point_trace.dropped_hits`
  - `write_point_trace.hits[]` with value, scanline, and selector/state snapshots

To enforce CI-style pixel gates on a rendered intro sequence:

```sh
python3 tools/check_regression_gates.py \
  validation/regression_gates_intro.jsonc \
  --render-dir port/build/regression_frames \
  --json-out tools/out/regression_gates_intro_report.json
```

To validate callback/state checkpoints as machine-readable contracts:

```sh
python3 tools/validate_callback_contracts.py \
  rom_analysis/docs/callback_state_contracts.jsonc \
  tools/out/td2_boot_probe.json \
  --json-out tools/out/callback_state_contracts_report.json
```

In the current environment, the frame-`300` screenshot is the colored copyright/credits scene with blue/red text on black.
The interesting RE result is that the tracked bank 1 selectors are still at the trivial early values on that frame:

- `$1C78 = 1`
- `$1C7A = 0`
- `$1CAC/$1CCA/$1CCC/$1CCE/$1CD0/$1CE2/$1CE4/$1CE6/$1CEA = 0`

That means this scene exists later than raw power-on but still before the richer bank 1 front-end selector state the current boot-state tooling is trying to model.

The PPU dump for the same scene is now a solved validation target:

- `tools/render_mesen_snes_bg.py` can reconstruct the frame exactly from `vram.bin + cgram.bin + ppu_state.json`
- `tools/compare_frames.py` against `td2_boot_probe_frame.png` currently reports `0` mismatched pixels
- the dumped live state shows `ppu.bgMode = 1` and `ppu.mainScreenLayers = 0x04`

This makes the frame-`300` credits scene the best current “golden” screen for validating a PC-side BG text compositor.

That target is no longer dump-only. `tools/build_bank1_credits_scene.py` now rebuilds the same screen directly from ROM by following the `L009D1C` helper trio (`L00A9A0(0)`, `L00A9CB(0)`, `L00A9F2(0)`) and currently compares against the captured frame with `0` mismatched pixels.

A bounded 2026-03-22 re-test in the current worktree keeps that reading intact for the
capture/build side, but not for the SDL runtime:

- `python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene_regolden_20260322`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_vs_mesen_diff.ppm`
  - `0` mismatched pixels
- `python3 tools/render_mesen_snes_bg.py tools/out/bank1_credits_scene_regolden_20260322_vram.bin tools/out/bank1_credits_scene_regolden_20260322_cgram.bin tools/out/bank1_credits_scene_regolden_20260322_ppu_state.json tools/out/bank1_credits_scene_regolden_20260322_python.ppm`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322_python.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_python_vs_mesen_diff.ppm`
  - `0` mismatched pixels
- `SDL_VIDEODRIVER=dummy ./port/build/td2_port --headless --snes-bg-prefix ./tools/out/bank1_credits_scene_regolden_20260322 --frames 1 --dump-prefix ./port/build/credits_regolden_20260322`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_mesen_diff.ppm`
  - `7244` mismatched pixels (`12.632533%`)
  - mismatch bbox: `16,56 -> 222,167`
  - the generated diff is byte-identical to the pre-existing `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`

Practical reading:

- frame `300` remains the promoted golden target for live capture, ROM-side scene rebuild, and the Python SNES BG renderer
- frame `300` is **not** yet a zero-diff SDL runtime parity gate; the current runtime output still lands on the same historical credits-scene diff surface

Later no-input power-on probing now shows the next attract/front-end signatures as well:

- frame `654`: this is now the first clean `Ballistic presents` anchor on the no-input path
  - the active main callback has just switched to `01:A39C`
  - `bg1_visible.ppm` from the Mesen bridge compares against the captured screenshot with `0` mismatched pixels
  - visible sprites are still `0`, so this state is a pure BG scene
- frame `900`: `ppu.bgMode = 1`, `ppu.mainScreenLayers = 0x01`, which matches `L00A35A`
  - the active main callback on the sampled frame is `01:A39C`
  - `$20 = 8`, so the scene is already inside the callback-driven animation path
- frame `1200`: `ppu.bgMode = 7`, `ppu.mainScreenLayers = 0x11`, which matches `L00A00C`
  - by that sampled frame, the active main callback has already fallen back to bank 0 idle `00:8029`

These are useful map points, but they are not yet golden targets in the same sense as frame `300`:

- frame `654` is now good enough to seed sampled intro playback in the PC port
- frame `900` is already animated enough that the current end-of-frame PPU dump mismatches its screenshot by `9.163993%`
- frame `1080` and frame `1200` now render through the shared Mode 7 BG path in `tools/render_mesen_snes_bg.py`
  - frame `1080` mismatches the captured screenshot by `12.341309%`
  - frame `1200` mismatches the captured screenshot by `9.125628%`
  - the remaining delta is consistent with missing OBJ or other non-BG overlay composition rather than a broken Mode 7 transform

The script writes an isolated config to `.mesen-config/Mesen2/settings.json` and capture output under the script data folder inside that config root.
By default it resolves the emulator in this order:

- `MESEN_BIN`
- `MESEN_RELEASE_DIR/Mesen`
- `Mesen` or `mesen` on `PATH`

One useful probe result for the `Ballistic presents` splash is the callback handoff:

- the active main callback first becomes `01:A39C` at frame `654`
- the probe timeline then shows `$20` changing every `4` frames from frame `656` onward:
  - `656 -> 13`
  - `660 -> 12`
  - `664 -> 11`
  - ...
  - `708 -> 0`

That makes frames `654..710` the first clean validation window for the Ballistic splash.

Longer no-input probing now also pins down the repeat period of the first attract loop:

- the callback cycle beginning with `01:A39C` at frame `654` repeats at frame `2072`
- it repeats again at frame `3490`
- the loop period is therefore `1418` frames

That repeat period is what the current exact sampled intro manifest uses:

- dump range: frames `654..2070`, sampled every `4` frames
- runtime end-exclusive frame: `2072`
- this yields the first full exact no-input loop manifest under `tools/out/intro_loop_sequence.txt`

The current runtime milestone goes one step further than that sampled manifest:

- `tools/out/ballistic_native_sequence.txt` is the measured Ballistic reference clip
- `tools/out/ballistic_rom_sequence.txt` is the ROM-derived Ballistic runtime clip
- `tools/out/ballistic_callback_sequence.txt` is the direct runtime Ballistic callback clip
- `tools/out/intro_loop_hybrid_sequence.txt` now splices:
  - the direct callback clip for `654..958`
  - the queue-driven `snes_bg` window for `978..985`
  - sampled `image` playback for the remaining attract states
- the ROM-derived clip currently compares exactly at:
  - frame offset `0` vs source frame `654`
  - frame offset `60` vs source frame `714`
  - frame offset `300` vs source frame `954`
- the direct callback clip also compares exactly at:
  - frame offset `0`
  - frame offset `60`
  - frame offset `300`
- current exact validation checks for the hybrid path are:
  - frame offset `0` vs source frame `654`
  - frame offset `320` vs source frame `974`
  - frame offset `676` vs source frame `1330`
- current promoted-hybrid validation around the native post-Ballistic splice is:
  - frame offset `324` vs source frame `978`: `2` mismatched pixels (`0.003488%`)
  - frame offset `328` vs source frame `982`: `2` mismatched pixels (`0.003488%`)
  - frame offset `332` vs source frame `986`: exact sampled fallback

Current boundary for the next native intro replacement:

- `958..974` is still the unstable bootstrap zone for the `L00A00C -> 01:9D69 -> 01:9FE5` handoff
- frame `978` is the first clean extracted-state target after that handoff:
  - direct runtime reconstruction from `VRAM + CGRAM + PPU state` currently lands at `4` mismatched pixels (`0.006975%`)
- the SDL runtime now also accepts optional `OAM` for extracted SNES scenes:
  - against a full Mesen frame dump, frame `978` with auto-loaded sibling `oam.bin` lands at `2` mismatched pixels (`0.003488%`) versus `main_visible.ppm`
  - frame `990` still lands at `623` mismatched pixels (`1.086426%`) versus `main_visible.ppm`
  - practical reading: OAM support is now in the runtime, but it is not the whole explanation for the later Mode 7 attract drift
- the same extracted-state path then starts drifting again:
  - frame `986`: `23` mismatched pixels (`0.040109%`)
  - frame `990`: `1295` mismatched pixels (`2.258301%`)
  - frame `994`: `2781` mismatched pixels (`4.849679%`)
- practical next step:
  - treat `958..977` as a deeper bootstrap-builder problem rather than a simple scene dump
  - keep queue-driven `978` and `982` as the first promoted post-Ballistic replacements inside the hybrid loop
  - frame `986` is still the first unresolved edge after those replacements
  - `tools/out/intro_native_978_derived_sequence.txt` is now the splice source for the promoted replacement window

That bootstrap reading is now backed by two extra checks:

- rerunning the probe at frames `958` and `974` with `TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1` shows that start-of-frame dumps do not rescue the scene:
  - `tools/out/bootprobe_958/startframe.ppm` vs `tools/out/bootprobe_958/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_958/endframe.ppm` vs `tools/out/bootprobe_958/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_974/startframe.ppm` vs `tools/out/bootprobe_974/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_974/endframe.ppm` vs `tools/out/bootprobe_974/td2_boot_probe_frame.png`: `100.000000%`
- frame `958` and frame `974` screenshots are still identical, so the visible bootstrap window is static even though the extracted PPU state is not usable
- the experimental ROM-side builder at `tools/build_bank1_l00a00c_scene.py` currently applies:
  - `04:9AED` via `L001210 -> 42FB -> L00065F`
  - `04:9BF5` via `L001210 -> 26FB -> L00073E`
  - optional `L00A9F2(1)` onto a seeded `954` CGRAM base
- the current seeded prototype output is `tools/out/bank1_l00a00c_scene.ppm`, and it is still `100.000000%` mismatched against both frame `958` and frame `974`
- practical reading:
  - the remaining gap is not just "wrong capture boundary"
  - the bootstrap likely depends on additional carried-over or mutated state beyond the obvious direct uploads

The new bootstrap delta summaries make that sharper:

- `tools/out/intro_bootstrap_954_958_delta.json`
  - screenshot mismatch: `13.741629%`
  - `VRAM` delta: `6808` bytes
  - `CGRAM` delta: `0` bytes
  - reading: the first visible bootstrap step carries Ballistic CGRAM forward unchanged
- `tools/out/intro_bootstrap_958_974_delta.json`
  - screenshot mismatch: `0.000000%`
  - `VRAM` delta: `5875` bytes, all odd-byte changes
  - `CGRAM` delta: `278` bytes
  - active main callback changes from `00:8029` to `01:9D69`
  - key state variables first become nonzero:
    - `$0202 = 1`
    - `$0208 = 13`
    - `$020A = 0x9CC3`
    - `$040A = 0xFFFF`
  - reading: `01:9D69` is the first live bootstrap callback that populates the state feeding `L009DC6`

The probe can now also dump low WRAM around those staging queues with `TD2_BOOT_PROBE_DUMP_WRAM_MEMORY=1`:

- `td2_boot_probe_wram.bin`
- `td2_boot_probe_startframe_wram.bin`

That extra dump tightened the bootstrap reading:

- frame `958`
  - `dp_0054 = 0x00`
  - `state_09A2 = 0`
  - `state_09A4 = 0x0200`
- frame `974`
  - `dp_0054 = 0x10`
  - `state_09A2 = 0`
  - `state_09A4 = 0x0200`
  - practical reading: exactly `2` `0600` DMA descriptors are armed for the next NMI pass
- `tools/out/intro_bootstrap_958_974_queue.json`
  - decodes that WRAM window into queue structures
  - carries both raw probe context and a ready-to-consume active slice:
    - `probe_after.dp_0054 = 16`
    - `regions.0600_dma_queue.active_dma_descriptor_count_after = 2`
    - `regions.0600_dma_queue.active_after_entries`
  - the two active `0600` descriptors at frame `974` are:
    - command `0x01`, source `1A:9948`, size `0x1040`, VRAM destination `0x4000`
    - command `0x01`, source `1A:A988`, size `0x0040`, VRAM destination `0x4900`
  - `0700..091F` is confirmed as the staged OAM buffer copied by the NMI `DMA1 -> $2104` upload
  - the repeated `0xE100` head word in that region is the OAM fill/sentinel pattern, not a tile queue entry
- `tools/out/intro_bootstrap_978_982_queue.json`
  - frame `978` still runs `01:9FE5` with `4` active descriptors
  - frame `982` still runs `01:9FE5` with `5` active descriptors
  - the new active descriptor is:
    - `1A:AB58 -> VRAM 0x49A0`, size `0x0100`
  - applying that queue onto the derived frame-`978` seed yields `tools/out/bank1_bootstrap_queue_982.ppm`
  - current compare vs the real frame `982` target: `2` mismatched pixels (`0.003488%`)
- `tools/out/intro_bootstrap_982_986_queue.json`
  - frame `986` still runs `01:9FE5` but grows the active queue to `7` descriptors
  - the two new active descriptors are:
    - `1A:AA10 -> VRAM 0x4920`, size `0x0100`
    - `1A:ACA0 -> VRAM 0x49A0`, size `0x0100`
  - applying that queue onto the derived frame-`982` seed yields `tools/out/bank1_bootstrap_queue_986.ppm`
  - current compare vs the real frame `986` target: `958` mismatched pixels (`1.670619%`)
  - disabling OBJ on the same derived scene yields `tools/out/bank1_bootstrap_queue_986_noobj.ppm`
  - current compare with OBJ disabled: `21` mismatched pixels (`0.036621%`)
  - overriding OBJ with the clean Mesen bridge OAM yields `tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm`
  - current compare with bridge OAM override: `21` mismatched pixels (`0.036621%`)
  - practical reading: queued VRAM plus staged OAM is enough for the frame-`986` BG path too; the remaining regression is concentrated in Mode 7 OBJ composition
  - the concrete late-frame OAM finding is:
    - `make -C tools intro-oam-deltas` now writes machine-readable reports under `tools/out/intro_oam_deltas/`
    - probe OAM and bridge OAM still match exactly at frames `978` and `982`
    - at frame `986`, the full `544`-byte OAM dumps diverge by `37` bytes (`35` low-table, `2` high-table)
    - the `986` sprite-level delta is `9` changed visible sprites in the probe dump versus `0` visible sprites in the bridge dump
    - at frame `990`, the full `544`-byte OAM dumps diverge by `92` bytes (`86` low-table, `6` high-table)
    - the `990` sprite-level delta is `23` changed visible sprites in the probe dump versus `5` visible sprites in the bridge dump
    - the bad Mode 7 OBJ overlay tracks the probe OAM dump, not the bridge OAM dump
- `tools/out/intro_bootstrap_986_990_queue.json`
  - frame `990` still runs `01:9FE5` and carries the next WRAM queue delta forward from the bridge-accurate `986` seed
  - applying that queue onto `tools/out/bank1_bootstrap_queue_986_bridgeoverride_vram.bin` with clean bridge OAM yields `tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm`
  - current compare vs the real frame `990` screenshot: `1518` mismatched pixels (`2.647182%`)
  - current compare vs Mesen `main_visible.ppm`: `2` mismatched pixels (`0.003488%`)
  - practical reading: the queue-driven attract path can now advance natively through frame `990` when measured against extracted Mesen scene output, but the final-screen gap after frame `982` is still open
  - the current committed `994` scene variants (`fromraw990` vs `bridgeobj`) now compare at `0` OAM bytes / `0` sprite deltas, so the remaining `994` screenshot gap is already downstream of raw OAM in the committed artifact set
- bridge-visible late attract modeling now goes further than the queue replay path:
  - bridge frame extracts for `991..997` show that the visible Mode 7 buffers at `0x4920` and `0x49A0` rotate among three ROM chunks (`1A:AA10`, `1A:AB58`, `1A:ACA0`) instead of exposing the last traced DMA stream directly
  - `tools/build_mode7_source_scene.py` captures that model by seeding from bridge frame `990` VRAM and patching those two visible regions from ROM
  - resulting validation against Mesen `main_visible.ppm`:
    - `tools/out/bank1_mode7_visible_991.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_992.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_993.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_994.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_995.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_996.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_997.ppm`: `4` mismatched pixels
  - practical reading: the derived bridge-visible model now closes `991..997`, but the callback-level explanation for that visible-buffer rotation is still open
- the next aligned sampled block is now carried directly from extracted SNES state:
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
  - probe-confirmed callback continuity:
    - frame `998`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 152`
    - frame `1005`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 3`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 208`
    - frame `1013`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 8`
    - frame `1014`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 16`
    - frame `1021`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
    - frame `1022`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
    - frame `1029`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 40`
    - frame `1037`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 56`
    - frame `1045`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 72`
    - frame `1053`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 88`
    - frame `1061`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 9`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 14`, `$0054 = 104`
    - frame `1069`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 11`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 16`, `$0054 = 120`
    - frame `1077`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
    - frame `1085`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
    - frame `1093`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
  - SDL playback from `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt` compares against Mesen `main_visible.ppm` at:
    - frame `998`: `4` mismatched pixels
    - frame `999`: `4` mismatched pixels
    - frame `1000`: `2` mismatched pixels
    - frame `1001`: `4` mismatched pixels
    - frame `1002`: `4` mismatched pixels
    - frame `1003`: `4` mismatched pixels
    - frame `1004`: `4` mismatched pixels
    - frame `1005`: `4` mismatched pixels
    - frame `1006`: `6` mismatched pixels
    - frame `1007`: `6` mismatched pixels
    - frame `1008`: `6` mismatched pixels
    - frame `1009`: `6` mismatched pixels
    - frame `1010`: `6` mismatched pixels
    - frame `1011`: `8` mismatched pixels
    - frame `1012`: `8` mismatched pixels
    - frame `1013`: `10` mismatched pixels
    - frames `1014..1021`: `10` mismatched pixels each
    - frames `1022..1023`: `10` mismatched pixels each
    - frames `1024..1025`: `8` mismatched pixels each
    - frames `1026..1029`: `11` mismatched pixels each
    - frames `1030..1037`: `0, 0, 0, 0, 4, 3, 0, 0` mismatched pixels each
    - frames `1038..1045`: `6, 6, 9, 12, 13, 11, 16, 15` mismatched pixels each
    - frames `1046..1053`: `13, 13, 16, 18, 18, 18, 17, 14` mismatched pixels each
    - frames `1054..1061`: `14, 14, 15, 16, 19, 20, 21, 22` mismatched pixels each
    - frames `1062..1069`: `25, 26, 26, 21, 26, 23, 23, 25` mismatched pixels each
    - frames `1070..1077`: `29, 27, 26, 28, 34, 33, 39, 32` mismatched pixels each
    - frames `1078..1085`: `41, 41, 47, 47, 58, 63, 60, 69` mismatched pixels each
    - frames `1086..1093`: `89, 92, 89, 90, 102, 115, 144, 129` mismatched pixels each
  - the SDL runtime now uses the scanline-accurate `mode7-ppu` object compositor for Mode 7 `snes_bg` playback, which is what closed the `1022/1023/1025` regression window
  - practical reading: bridge-visible native coverage now extends through frame `1093`, and `998..1093` are still inside the same `01:9FE5` family as the derived `991..997` window, but the mismatch ramp from `1078..1093` suggests a later composition detail is becoming more important

The probe now also writes a second PPU-memory snapshot at the start of the sampled frame when `TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1` is enabled:

- `td2_boot_probe_startframe_vram.bin`
- `td2_boot_probe_startframe_cgram.bin`
- `td2_boot_probe_startframe_oam.bin`
- `td2_boot_probe_startframe_ppu_state.json`

That snapshot is useful when a front-end state rewrites VRAM or Mode 7 registers during late vblank and contaminates the simpler end-of-frame dump.

There is also an optional register trace for Mode 7 and `TMAIN` writes:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1201 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh
```

This emits `td2_boot_probe_mode7_writes.json`, which can be summarized with:

```sh
python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_mode7_writes.json
```

Both traces also support a frame window instead of a single sampled frame:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1201 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_START_FRAME=900 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_DMA=1 \
./validation/run_mesen_probe_boot.sh
```

That emits `td2_boot_probe_dma_writes.json`, which can be summarized with the same helper:

```sh
python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_dma_writes.json
```

Current reading from those traces:

- frame `1080`: only `20` tracked CPU writes, all clustered at scanlines `225-231`
- frame `1200`: `274` tracked writes, with heavy VRAM traffic through `$2118/$2119` at scanlines `227-229`
- this means the naive end-of-frame VRAM/PPU snapshot can include next-frame preparation data
- however, switching to the new `startFrame` snapshot does not materially reduce the BG-only mismatch for these frames, so the remaining gap is not explained by a simple “captured the wrong frame state” issue alone
- a wider DMA trace over frames `900-1200` shows no CPU writes to `HDMAEN` or channel `7` setup registers in that window
- the same DMA trace shows the attract Mode 7 path becoming active around frame `974`:
  - frame `974`: channel `1` MDMA to `BBAD1 = $04`, i.e. OAM upload
  - frame `975` onward: repeated channel `0` MDMA to `BBAD0 = $18`, i.e. VRAM upload, alongside channel `1` OAM DMA
- a narrow Mode 7 trace over frames `974-977` pins the scene handoff more tightly:
  - frame `975`: callback `01:9D69` is already performing VRAM writes through `$2116-$2119`
  - frame `976`: callback `01:9FE5` performs the first observed `M7A/M7D` writes
  - by frame `977`, the Mode 7 attract loop is established under `01:9FE5`
- practical reading from that combined evidence:
  - the Mode 7 scene is not being born from a fresh HDMA setup on frames `974-1200`
  - the remaining mismatch is more likely either hardware-side HDMA activity armed before the traced window, or a remaining Mode 7 presentation nuance in the renderer, than a missing CPU-visible setup step in that interval

The scanline-step probe narrows that further for frame `1200`:

```sh
TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/scanline_frame_1200/td2_scanline_step_test \
TD2_SCANLINE_TEST_TARGET_FRAME=1200 \
TD2_SCANLINE_TEST_MAX_SAMPLES=224 \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua
```

That writes `tools/out/scanline_frame_1200/td2_scanline_step_test.json`.
If `TD2_SCANLINE_TEST_OUTPUT_PREFIX` is unset, the legacy fallback still writes
to `.mesen-config/Mesen2/LuaScriptData/mesen_scanline_step_test/td2_scanline_step_test.json`.
Current reading from that probe:

- all `224` visible scanlines on frame `1200` report the same sampled `ppu.mode7.*` values
- `ppu.bgMode = 7` and `ppu.mainScreenLayers = 0x11` remain stable across the sampled frame
- `ppu.mode7.matrix[0] = 256`, `ppu.mode7.matrix[3] = 257`, `ppu.mode7.hscroll = 0`, `ppu.mode7.vscroll = 8191` remain stable across the sampled frame
- this makes a scanline-varying Mode 7 register state much less likely as the primary explanation for the remaining frame-`1200` mismatch

The same scanline-step path now also has a repeatable range wrapper for the next bridge-visible frontier:

```sh
python3 tools/capture_visible_mode7_range.py \
  1094 1101 \
  --output tools/out/visible_mode7_1094_1101.json
python3 tools/apply_visible_mode7_samples.py \
  tools/out/visible_mode7_1094_1101.json \
  tools/out/mesen_range_1094_1101_v1
```

That wrapper now keeps its raw scanline probe JSON in a repo-owned per-run
scratch prefix beside the aggregate output, by default:
`tools/out/visible_mode7_1094_1101_scanline_probe/td2_scanline_step_test.json`.

For seeded gameplay visible-phase sampling, the same Lua probe can now be
driven through a fuller wrapper that preserves every sampled scanline and the
probe's boundary snapshots:

```sh
python3 tools/capture_scanline_samples_range.py \
  86 86 \
  --savestate .mesen-config/Mesen2/SaveStates/game_11.mss \
  --input-windows '60-359:b' \
  --output tools/out/track1_b_hold_scanline_frame_0086_v1.json \
  --max-samples 224
```

That path is the current debugger-oriented follow-up for gameplay-era lanes
where `emu.takeScreenshot()` and end-of-frame raw `PPU` dumps disagree.

Current reading from that `1094..1101` visible-state pass:

- the captured visible `M7A/M7D` pairs are:
  - `1094`: `1152 / 1028`
  - `1095`: `1024 / 1028`
  - `1096`: `896 / 771`
  - `1097`: `768 / 771`
  - `1098`: `640 / 514`
  - `1099`: `512 / 514`
  - `1100`: `384 / 257`
  - `1101`: `256 / 257`
- those visible values do not match the direct bridge-extracted `ppu_state.json` files for the same frames
- however, applying those visible values onto the extracted `1094..1101` frame states yields much worse `main_visible` compares:
  - frames `1094..1101`: `362, 414, 606, 700, 1244, 1515, 3962, 5930` mismatched pixels
- a focused boot probe at frame `1094` confirms that the probe `startframe` snapshot already carries the same visible `M7A/M7D = 1152 / 1028` pair and still renders at `362` mismatched pixels against the extracted `main_visible`
- practical reading:
  - the late-attract frontier after `1093` is not blocked by a simple stale end-of-frame `ppu_state` alone
  - native bridge-visible coverage should therefore stay promoted only through `1093` until the wider composition/export nuance is explained

The current OBJ experiments line up with that reading:

- `tools/render_mesen_snes_bg.py` now accepts `--oam` and can compose OBJ over the reconstructed BG frame
- on frame `1200`, the default `--obj-renderer simple` path reduces mismatch from `9.125628%` to `7.934570%`
- on frame `1080`, the same simple OBJ overlay is still wrong enough to worsen the result to `26.457868%`
- an experimental `--obj-renderer mode7-ppu` path tries to follow the SNES per-scanline sprite fetch flow more closely, but on frame `1200` it still lands at `8.032227%`
- practical reading:
  - OBJ is definitely part of the remaining delta on the later attract frame
  - OBJ alone does not explain the full mismatch, and the current 1080 OBJ decode/composition path is still incomplete or incorrect

Notes:

- `tools/run_track1_seed_sweep.py` summaries now record the ROM and savestate
  SHA-256 fingerprints alongside the capture config, because the current
  `game_11.mss` seed has already drifted from older promoted sweep
  results.
- The sweep summary now also runs a short no-input boot-probe audit of the
  seed surface before classifying the screenshot lanes.
- On the current fingerprinted `game_11.mss` seed, that audit classifies the
  savestate as `front_end_menu_seed` (`02:9016`, `$1C6A = [1]`,
  `$0202 = [65535]`), so current sweep output must not be promoted as gameplay
  evidence.
- Within that same menu-bound seed family, `a_hold` and `b_hold` are
  pixel-identical across the first `300` captured frames, while `a+b` stays
  aligned early and first diverges at script frame `219`.
- `mesen_capture.lua` now calls `emu.stop(0)` when capture finishes so the `--testRunner` process exits cleanly.
- In this environment, one downloaded Linux release binary crashed with `std::bad_cast` under `--testRunner`, while a local source-build binary resolved through `MESEN_BIN` completed the same capture successfully.
- Mesen2's `--testRunner` path does not expose a clean CLI hook for loading a `.mss` savestate before the script runs. The current workaround is a one-shot `emu.addMemoryCallback(..., emu.callbackType.exec, ...)` that calls `emu.loadSavestate(...)` on the first executed instruction.
- When `run_mesen_capture.sh` is called without a third argument, it exports an empty `TD2_CAPTURE_SAVESTATE` and the script stays on the original power-on plus warm-up flow.
- The no-savestate path was revalidated after this change. The savestate-loading branch was implemented against Mesen's shipped Lua API documentation, but it was not exercised here because there was no sample savestate file in the workspace.


## Source Of Truth :: Tools README

- Source: `tools/README.md`
- Bundle copy: `sources/tools/README.md`
- Last updated: `2026-03-28 15:29`
- Note: Promoted extraction and analysis tooling surface.

---

# Tools

Current Sprint 0 tooling:

- `extract_bank3_palettes.py`: dumps bank 3 as sequential 16-color palettes in JSON form
- `extract_boot_palette_manifest.py`: resolves known bank 1 boot-time palette tables into named JSON entries
- `flatten_palette_manifest.py`: converts a structured palette manifest into the flat array format that the SDL viewer already loads
- `extract_boot_screen_manifest.py`: resolves the bank 1 `L008CA2` screen-build path into concrete VRAM/CGRAM upload jobs
- `build_boot_vram.py`: rebuilds a partial boot/title VRAM snapshot from the current manifest, applying supported jobs into a raw VRAM image using the bank 1 state-table selectors instead of a raw entry index
- `render_boot_screen.py`: composes a BG-only 256x224 boot/title preview from the rebuilt VRAM snapshot plus the boot palette manifest
- `build_bank1_credits_scene.py`: builds the bank 1 `L009D1C` copyright/credits scene directly from ROM helper-table assets and writes VRAM/CGRAM/PPU-state outputs plus a preview PPM
- `build_bank1_helper_scene.py`: builds other simple bank 1 helper-driven BG scenes from `L00A9A0/L00A9CB/L00A9F2` table entries and explicit PPU setup
- `build_bank1_l00a00c_scene.py`: experimental bank 1 `L00A00C` bootstrap builder that applies the direct Mode 7 setup uploads onto optional seeded `VRAM/CGRAM/OAM` dumps and renders the result with a supplied PPU-state template
- `analyze_frame_delta.py`: summarizes binary, screenshot, PPU-state, and optional probe-log deltas between two extracted frame prefixes
- `analyze_bootstrap_queue.py`: decodes the low-WRAM `0600` DMA queue, `0700` staged OAM buffer, `0900` OAM high table, and related allocator maps between two bootstrap captures
- `analyze_oam_delta.py`: compares two full 544-byte OAM dumps at both raw-byte and parsed-sprite level, including which visible sprites differ under the current PPU-state visibility rules
- `build_bootstrap_queue_scene.py`: applies the active `0600` DMA descriptors from a queue summary onto a seed VRAM image, optionally lifts staged OAM from WRAM, and emits a normal `snes_bg` scene prefix plus preview
- `build_mode7_source_scene.py`: seeds a Mode 7 scene from VRAM and patches selected VRAM word regions directly from ROM source blobs before rendering; this is the current bridge-visible builder for the late attract window
- `mesen_ppu_extract`: headless C# bridge into `MesenCore.so` that dumps the current frame's SNES BG layer views, BG tilesets/CHR sheets, palette, per-sprite previews, sprite screen preview, and raw VRAM/CGRAM/OAM without going through the GUI; it now also accepts `--load-state` plus `--frame-is-offset` so gameplay-native extraction can start from preserved savestates instead of replaying from power-on
- `build_mesen_design_pack.py`: repack a raw `mesen_ppu_extract` frame folder into a stable design-team bundle (`layers/`, `tilemaps/`, `tilesets/`, `sprites/`, `palette/`, `raw/`) plus a `design_pack.json` manifest
- `build_mesen_design_pack_range.py`: batch `build_mesen_design_pack.py` over `frame_*` directories and emit `design_pack_range.json` for timeline review
- `build_tilemap_chunk_provenance.py`: correlates design-pack tile-index ranges with `L001210` runtime chunk hits and chunk-validation metadata into `frame/layer/tile-index-range -> candidate ROM chunk` tables
- `build_bank1_helper_provenance.py`: correlates one design-pack frame with bank1 `L00A9A0/L00A9CB/L00A9F2` helper-bundle sources using a matching boot probe plus `L001210` trace
- `build_mesen_visual_contract.py`: promotes one design-pack frame into a translation-facing visual contract that separates BG vs OBJ usage, summarizes producer-side write traces, and now also captures the matching probe frame's callback/state snapshot when `--probe-json` is supplied
- `build_mesen_visual_contract_range.py`: batches those visual contracts across `frame_*` or `design_frame*` directories, emits a compact range index, and can now map per-frame probes via `--probe-pattern` so the range summary includes callback-family/state progression rather than only per-frame files
- `build_b1f9_stage_report.py`: consolidates one `l001210_probe_matrix_v14_b1f9_stagetrace` directory into a compact JSON/Markdown report so the current `B1F9` forced-lane stall can be reviewed without hand-reading multiple probe files
- `build_docs_wiki_report.py`: builds a simple wiki-style HTML index for a curated set of repo markdown docs, with explicit section splits such as attract vs front-end/menu vs gameplay so human review does not mix surfaces accidentally; it now also emits a synced markdown bundle for NotebookLM/offline LLM review
- `extract_mesen_scene_range.py`: batches `mesen_ppu_extract` across a frame range, writes per-frame scene folders, and emits a collapsed `sequence.txt` manifest for the SDL runtime
- `build_scene_sequence_manifest.py`: converts flat Mesen range dumps into runtime-ready `sequence.txt` manifests, either as `snes_bg` entries or exact sampled `image` entries from screenshots; when `oam.bin` exists, it now carries it through as an optional fourth `snes_bg` path
- `build_indexed_palette_animation.py`: collapses a screenshot-backed frame range into one indexed image plus a palette timeline and can emit a one-entry `indexed_anim` sequence manifest
- `build_ballistic_rom_clip.py`: generates a ROM-derived Ballistic `indexed_anim` clip from the helper-scene CGRAM, the `A39C` `04:99ED` palette ramp, and the measured class mapping
- `build_ballistic_callback_asset.py`: generates a compact Ballistic callback asset for direct runtime `ballistic_a39c` playback from helper-scene CGRAM, the ROM ramp, and the inferred class mapping
- `splice_sequence_manifest.py`: replaces a frame range inside a sequence JSON summary with a new manifest entry, used for hybrid native-plus-sampled intro loops
- `render_mesen_snes_bg.py`: composes a 256x224 preview directly from Mesen VRAM/CGRAM/state dumps, including Mode 7 and optional OBJ composition from OAM dumps
- `check_obj_vertical_flip.py`: builds a minimal 16x32 vertically mirrored OBJ fixture and checks the Python renderer plus SDL runtime against one golden PPM for the width-vs-height mirror regression
- `check_bg_layer_priority.py`: builds a minimal mode-0 four-layer scene and checks BG4 support plus tile-priority ordering against one golden PPM in both the Python renderer and SDL runtime
- `terminal_bot.py`: provides a persistent PTY-backed shell session helper for bot-style automation, including session start/list/status, stateful `cd`/`export`, raw input writes, `Ctrl-C`, and log streaming from a shared session log
- `clean_generated_artifacts.py`: removes always-safe build output, scratch untracked `tools/out` runs (`*smoke*`, `*makecheck*`, `*designtest*`, `tmp*`, `test_*`), debugger `game.cdl` junk, and other disposable generated clutter; it skips any tracked path, and `tools/out/` itself is git-ignored by default, so promoting a new artifact from that tree is now an explicit `git add -f` decision
- `summarize_mode7_trace.py`: summarizes the tracked register-write traces emitted by `mesen_probe_boot.lua` for Mode 7/TMAIN or DMA/HDMA windows
- `summarize_l001210_trace.py`: summarizes `L001210` dispatcher execution hits (`$0C/$0E/$10`) captured by `mesen_probe_boot.lua` for chunk provenance, including caller-site coverage and `L00A9*` table-index usage when present
- `run_l001210_probe_matrix.py`: runs multiple deterministic `mesen_probe_boot.lua` scenarios and aggregates bank30 candidate hit coverage into one matrix report; scenarios may include `extra_env` to inject probe env overrides per run
- `run_track1_seed_sweep.py`: runs a bounded deterministic input sweep against a seeded savestate, hashes screenshot pixels, classifies each scenario as fully static, static-after-first-nontrivial, or dynamic, and now also records a short no-input seed-surface audit so menu/front-end seeds are not silently mislabeled as gameplay
- `run_lane3_gameplay_entry.py`: wraps the current Lane 3 menu-`A` route back into gameplay, then appends gameplay-relative input windows from the first known gameplay frame so later probe/capture runs can be scripted from a traced live-entry lane instead of one long absolute boot-time string
- `build_gameplay_asset_report.py`: consolidates one gameplay seed's frame capture, isolated layer renders, tilemap stats, and producer notes into an asset-first JSON/Markdown report so lane-3 tracing can target the right visual owner (`BG1`, `BG2`, `OBJ`, `BG3`) instead of mixing gameplay with front-end material
- `build_gameplay_frame_bundle.py`: packages one raw gameplay frame dump into a self-contained review bundle with screenshot, isolated `BG1/BG2/OBJ` renders, designer-facing `PNG` previews, screenshot-derived `world/background-stack` support PNGs for raster-heavy gameplay frames, raw memory, and a lightweight design pack; it now also accepts `--native-frame-dir` to promote Mesen-native gameplay visible layers (`bg*_visible`, sprite screen, native design pack) into the same bundle when a savestate-backed extraction exists
- `build_gameplay_bundle_compare.py`: compares two gameplay frame bundles and emits a compact JSON/Markdown delta report so lane 3 can separate road/world persistence from overlay/HUD/OBJ changes while also pointing human review at the screenshot-derived support surfaces when raw `BG2` is only a static-state approximation
- `build_video_phase_pack.py`: builds named still/contact-sheet packs from local gameplay videos using a small JSON spec, useful for promoting unseen manual-video or longplay moments into stable review anchors without pretending they are already `BG/OBJ`-resolved
- `compare_capture_sequences.py`: compares two `mesen_capture.lua` screenshot directories frame-by-frame, reports the first cross-sequence divergence, and also summarizes the first adjacent-motion step inside each lane
- `search_boot_probe_matches.py`: scans a longer `td2_boot_probe.json` for the window that best matches a target probe window by exact field equality, useful when a live gameplay route is valuable even without one exact absolute frame match
- `build_capture_sequence_manifest.py`: converts `mesen_capture.lua` screenshot runs (`*_input_log.json` + `*_frame_XXXXX.png`) into collapsed runtime `image` sequence manifests
- `capture_visible_mode7_range.py`: reuses `mesen_scanline_step_test.lua` to capture one visible-scanline `ppu.mode7.*` sample per frame across a requested range, and now defaults its raw probe JSON to a repo-owned per-run prefix derived from the requested aggregate output path
- `capture_scanline_samples_range.py`: reuses `mesen_scanline_step_test.lua` to capture the full per-scanline sample list for each requested frame, supports seeded savestate/input-window gameplay runs, can pass optional exec/write trace points through to the Lua probe, and now preserves the probe's `frame_events` boundary snapshots
- `summarize_scanline_dma_queue.py`: summarizes visible-phase `$53/$54` queue-cursor state and parsed active `0600` descriptors from one or more `mesen_scanline_step_test.lua` capture JSON files
- `apply_visible_mode7_samples.py`: applies those captured visible Mode 7 samples onto extracted frame states, writing sidecar `ppu_state_visible.json` files by default
- `extract_compression_header_manifest.py`: scans a bank for `42FB`/`26FB`/`67FB`/`27FB` blocks and decodes their leading header fields
- `validate_td2_chunks.py`: validates candidate chunk starts by running supported decoders and reporting consumed source windows/overlaps
- `build_bank30_chunk_registry.py`: consolidates bank30 header scan + decode validation + runtime `L001210` hits into one registry with unresolved-priority tags
- `decompress_td2_chunk.py`: decompresses an individual TD2 chunk from the ROM; `42FB`, `26FB`, and `67FB` are implemented
- `extract_snes_tiles.py`: decodes SNES 2bpp/4bpp tile banks or raw planar blobs into PPM sheets
- `scan_structured_bank.py`: scans a bank for recurring header markers like `42fb` / `26fb`
- `compare_frames.py`: compares `.png` and `.ppm` frames and optionally writes a diff image
- `check_regression_gates.py`: enforces policy-driven golden-scene and transition gates from JSON contracts
- `validate_callback_contracts.py`: validates machine-readable callback/state checkpoints against probe frame snapshots
- `Makefile`: repeatable targets for the current preview extraction set

Usage:

```sh
make -C tools previews
python3 tools/extract_bank3_palettes.py game.smc tools/out/bank3_palettes.json
python3 tools/extract_boot_palette_manifest.py game.smc tools/out/bank1_boot_palettes.json
python3 tools/flatten_palette_manifest.py tools/out/bank1_boot_palettes.json tools/out/bank1_boot_palettes_flat.json
python3 tools/extract_boot_screen_manifest.py game.smc tools/out/bank1_boot_screen.json
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0.bin --json-out tools/out/bank1_boot_vram_variant0.json
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0.bin --json-out tools/out/bank1_boot_vram_variant0.json --selector-1c78 1 --selector-1c7a 0
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0_overlay.bin --json-out tools/out/bank1_boot_vram_variant0_overlay.json --apply-optional-overlay
python3 tools/render_boot_screen.py tools/out/bank1_boot_vram_variant0.bin tools/out/bank1_boot_palettes.json tools/out/bank1_boot_screen_variant0.ppm --rom game.smc --json-out tools/out/bank1_boot_screen_variant0.json
python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene
python3 tools/build_bank1_helper_scene.py game.smc tools/out/bank1_l00a35a_scene --helper-index 4 --visible-layer bg1 --scene-name bank1_L00A35A_frontend --source-routine 01:A35A
python3 tools/build_bank1_l00a00c_scene.py game.smc tools/out/bank1_l00a00c_scene --seed-vram tools/out/intro_loop_frame_00954_vram.bin --seed-cgram tools/out/intro_loop_frame_00954_cgram.bin --ppu-state-template tools/out/intro_loop_frame_00974_ppu_state.json --skip-palette
python3 tools/analyze_frame_delta.py tools/out/intro_loop_frame_00954 tools/out/intro_loop_frame_00958 tools/out/intro_bootstrap_954_958_delta.json --probe-json-b tools/out/bootprobe_958_detail/td2_boot_probe.json
python3 tools/analyze_bootstrap_queue.py tools/out/bootprobe_958_detail/td2_boot_probe_wram.bin tools/out/bootprobe_974_detail/td2_boot_probe_wram.bin tools/out/intro_bootstrap_958_974_queue.json
python3 tools/build_bootstrap_queue_scene.py game.smc tools/out/intro_bootstrap_958_974_queue.json tools/out/bank1_bootstrap_queue_978 --seed-vram tools/out/bootprobe_958_detail/td2_boot_probe_vram.bin --cgram tools/out/bootprobe_974_detail/td2_boot_probe_cgram.bin --ppu-state tools/out/intro_loop_frame_00978_ppu_state.json --wram tools/out/bootprobe_974_detail/td2_boot_probe_wram.bin --render-objects
python3 tools/build_mode7_source_scene.py game.smc tools/out/bank1_mode7_visible_994 --seed-vram tools/out/mesen_frame990_assets_v2/vram.bin --cgram tools/out/mesen_frame994_assets_v1/cgram.bin --ppu-state tools/out/mesen_frame994_assets_v1/ppu_state.json --oam tools/out/mesen_frame994_assets_v1/oam.bin --patch 0x4920:0x1AACA0:0x100 --patch 0x49A0:0x1AAA10:0x100 --render-objects
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 300 --out-dir tools/out/mesen_frame300
python3 tools/build_mesen_design_pack.py tools/out/mesen_frame300 tools/out/design_frame300 --clean-out
python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1086_1093_v1 tools/out/design_mesen_range_1086_1093_v1 --clean-out
python3 tools/build_tilemap_chunk_provenance.py tools/out/design_mesen_range_1086_1093_v1 tools/out/td2_boot_probe_l001210_exec.json rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc --chunk-validation tools/out/bank13_chunk_validation.json --markdown-out rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md
python3 tools/build_bank1_helper_provenance.py game.smc tools/out/design_frame1500_car_select tools/out/car_select_frame1500_probe_repo/td2_boot_probe.json tools/out/car_select_frame1500_probe_repo/td2_boot_probe_l001210_exec.json rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json --chunk-validation tools/out/bank0_chunk_validation.json --chunk-validation tools/out/bank14_chunk_validation.json --markdown-out rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md
python3 tools/build_mesen_visual_contract.py tools/out/design_frame998 tools/out/visual_contract_frame998_live_probe.json --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json
python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out
python3 tools/build_b1f9_stage_report.py tools/out/l001210_probe_matrix_v14_b1f9_stagetrace tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json --markdown-out tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md
python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki
python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 654 --end-frame 710 --step 4 --out-dir tools/out/ballistic_sequence --ld-library-path /path/to/mesen/release
python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 978 --end-frame 982 --step 4 --out-dir tools/out/intro_native_978 --ld-library-path /path/to/mesen/release
python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 7051 --end-frame 7051 --step 1 --out-dir tools/out/mesen_range_7051_inputfix_v1 --ld-library-path /path/to/mesen/release --input-windows '6800:start;6900-6920:start,a' --frame-timeout-seconds 180
python3 tools/build_scene_sequence_manifest.py tools/out/intro_loop.json tools/out/intro_loop_sequence.txt --json-out tools/out/intro_loop_sequence.json --end-frame-exclusive 2072 --prefer-screenshot
python3 tools/build_indexed_palette_animation.py tools/out/intro_loop.json tools/out/ballistic_native/ballistic_splash.txt --start-frame 654 --end-frame-exclusive 958 --json-out tools/out/ballistic_native/ballistic_splash.json --preview-out tools/out/ballistic_native/ballistic_splash_preview.ppm --sequence-manifest tools/out/ballistic_native_sequence.txt
python3 tools/build_ballistic_rom_clip.py game.smc tools/out/bank1_l00a35a_scene_cgram.bin tools/out/ballistic_native/ballistic_splash.json tools/out/ballistic_rom/ballistic_splash.txt --json-out tools/out/ballistic_rom/ballistic_splash.json --preview-out tools/out/ballistic_rom/ballistic_splash_preview.ppm --sequence-manifest tools/out/ballistic_rom_sequence.txt
python3 tools/build_ballistic_callback_asset.py game.smc tools/out/bank1_l00a35a_scene_cgram.bin tools/out/ballistic_rom/ballistic_splash.json tools/out/ballistic_callback/ballistic_a39c.txt --json-out tools/out/ballistic_callback/ballistic_a39c.json --sequence-manifest tools/out/ballistic_callback_sequence.txt
python3 tools/splice_sequence_manifest.py tools/out/intro_loop_sequence.json tools/out/intro_loop_hybrid_sequence.txt --replace-start-frame 654 --replace-end-frame-exclusive 958 --replacement-type ballistic_a39c --replacement-path tools/out/ballistic_callback/ballistic_a39c.txt --replacement-duration 304 --json-out tools/out/intro_loop_hybrid_sequence.json
python3 tools/render_mesen_snes_bg.py tools/out/td2_boot_probe_vram.bin tools/out/td2_boot_probe_cgram.bin tools/out/td2_boot_probe_ppu_state.json tools/out/mesen_poweron_5s_bg_only.ppm --json-out tools/out/mesen_poweron_5s_bg_only.json
python3 tools/render_mesen_snes_bg.py tools/out/td2_boot_probe_startframe_vram_1200.bin tools/out/td2_boot_probe_startframe_cgram_1200.bin tools/out/td2_boot_probe_startframe_ppu_state_1200.json tools/out/td2_boot_probe_bg_obj_1200.ppm --oam tools/out/td2_boot_probe_startframe_oam_1200.bin --json-out tools/out/td2_boot_probe_bg_obj_1200.json
python3 tools/render_mesen_snes_bg.py tools/out/td2_boot_probe_startframe_vram_1200.bin tools/out/td2_boot_probe_startframe_cgram_1200.bin tools/out/td2_boot_probe_startframe_ppu_state_1200.json tools/out/td2_boot_probe_bg_obj_1200_ppu.ppm --oam tools/out/td2_boot_probe_startframe_oam_1200.bin --obj-renderer mode7-ppu --json-out tools/out/td2_boot_probe_bg_obj_1200_ppu.json
python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v1
python3 tools/build_gameplay_asset_report.py --label lane3_live_race_mid --source-seed manual_artifacts/lane3/lane3_live_race_mid.mss --frame-image manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png --bg1-image tools/out/lane3_live_race_mid_bg1.ppm --bg2-image tools/out/lane3_live_race_mid_bg2.ppm --obj-image tools/out/lane3_live_race_mid_obj.ppm --design-pack tools/out/design_lane3_live_race_mid_frame0/design_pack.json --layer-summary tools/out/lane3_live_race_mid_layer_stack_summary.json --producer-summary tools/out/lane3_live_race_mid_bg2_producer_summary.json --bg1-render tools/out/lane3_live_race_mid_bg1_render.json --bg2-render tools/out/lane3_live_race_mid_bg2_render.json --obj-render tools/out/lane3_live_race_mid_obj_render.json --ppu-state tools/out/lane3_live_race_mid_bg1_bg2_ppu_state.json --out-json tools/out/lane3_live_race_mid_asset_focus.json --markdown-out tools/out/lane3_live_race_mid_asset_focus.md
python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_frame03250_bundle
python3 tools/build_gameplay_bundle_compare.py tools/out/lane3_live_entry_frame03250_bundle tools/out/lane3_live_entry_frame03550_bundle tools/out/lane3_live_entry_frame03250_vs_03550_compare.json --markdown-out tools/out/lane3_live_entry_frame03250_vs_03550_compare.md --label-a live_entry_3250 --label-b live_entry_3550
python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json
python3 tools/build_capture_sequence_manifest.py tools/out/track1_seed_sweep_v1/b_hold/capture_input_log.json tools/out/track1_b_hold_cycle_0076_0156_sequence.txt --json-out tools/out/track1_b_hold_cycle_0076_0156_sequence.json --start-frame 76 --end-frame-exclusive 156
python3 tools/capture_visible_mode7_range.py 1094 1101 --output tools/out/visible_mode7_1094_1101.json
python3 tools/apply_visible_mode7_samples.py tools/out/visible_mode7_1094_1101.json tools/out/mesen_range_1094_1101_v1
python3 tools/capture_scanline_samples_range.py 86 86 --savestate .mesen-config/Mesen2/SaveStates/game_11.mss --input-windows '60-359:b' --output tools/out/track1_b_hold_scanline_frame_0086_v1.json --max-samples 224
python3 tools/capture_scanline_samples_range.py 86 86 --savestate .mesen-config/Mesen2/SaveStates/game_11.mss --input-windows '60-359:b' --trace-exec-points 'main_visible=02:9016,main_end=00:8029,qreset_80=80:04DF' --trace-write-points 'dp_0053=00:0053,dp_0054=00:0054,dp_0055=00:0055,dp_0056=00:0056' --output tools/out/track1_b_hold_scanline_frame_0086_trace_v2.json --max-samples 260
python3 tools/capture_scanline_samples_range.py 86 86 --savestate .mesen-config/Mesen2/SaveStates/game_11.mss --input-windows '60-359:b' --trace-exec-points 'main_visible=02:9016,main_end=00:8029,qreset_80=80:04DF' --trace-write-points 'dp_0053=00:0053,dp_0054=00:0054,dp_0055=00:0055,dp_0056=00:0056' --output tools/out/track1_b_hold_scanline_frame_0086_trace_v4.json --max-samples 360
python3 tools/summarize_scanline_dma_queue.py tools/out/track1_b_hold_scanline_frame_0086_v5.json tools/out/track1_b_hold_scanline_frame_0092_v5.json tools/out/track1_b_hold_scanline_frame_0108_v5.json --output tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 7 --json-out tools/out/bank7_compression_headers.json
python3 tools/validate_td2_chunks.py game.smc --bank 30 --headers-json tools/out/bank30_headers.json --json-out tools/out/bank30_chunk_validation.json
python3 tools/summarize_l001210_trace.py tools/out/td2_boot_probe_l001210_exec.json --json-out tools/out/td2_boot_probe_l001210_summary.json
TD2_BOOT_PROBE_TOTAL_FRAMES=1120 TD2_BOOT_PROBE_SAVE_SAVESTATE_FRAME=1093 TD2_BOOT_PROBE_SAVE_SAVESTATE=tools/out/l001210_state_1093.bin ./validation/run_mesen_probe_boot.sh ./game.smc
python3 tools/run_l001210_probe_matrix.py --out-dir tools/out/l001210_probe_matrix --total-frames 2200 --timeout-seconds 90
python3 tools/run_l001210_probe_matrix.py --out-dir tools/out/l001210_probe_matrix_from_1093 --total-frames 2000 --timeout-seconds 120 --savestate tools/out/l001210_state_1093.bin
# scenario JSON may include `extra_env`, e.g. {"name":"force","extra_env":{"TD2_BOOT_PROBE_FORCE_1C78":"1"}}
python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md
python3 tools/check_regression_gates.py validation/regression_gates_intro.jsonc --render-dir port/build/regression_frames --json-out tools/out/regression_gates_intro_report.json
python3 tools/validate_callback_contracts.py rom_analysis/docs/callback_state_contracts.jsonc tools/out/td2_boot_probe.json --json-out tools/out/callback_state_contracts_report.json
python3 tools/terminal_bot.py start --cwd .
python3 tools/terminal_bot.py exec SESSION_ID -- pwd
python3 tools/terminal_bot.py cd SESSION_ID tools
python3 tools/terminal_bot.py setenv SESSION_ID DEMO value
python3 tools/terminal_bot.py exec SESSION_ID -- 'printf "%s\n" "$DEMO"'
python3 tools/terminal_bot.py exec SESSION_ID --stream -- 'python3 -c "import time; print(\"alpha\", flush=True); time.sleep(0.5); print(\"beta\", flush=True)"'
python3 tools/terminal_bot.py interrupt SESSION_ID
python3 tools/terminal_bot.py close SESSION_ID --force
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank7_42fb_8000.bin --bank 7 --addr 0x8000 --json-out tools/out/bank7_42fb_8000.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank7_26fb_817a.bin --bank 7 --addr 0x817A --json-out tools/out/bank7_26fb_817a.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_da96.bin --bank 30 --addr 0xDA96 --json-out tools/out/bank30_67fb_da96.json
python3 tools/extract_snes_tiles.py game.smc tools/out/bank6_tiles_gray.ppm --bank 6 --bpp 4
python3 tools/extract_snes_tiles.py game.smc tools/out/bank6_tiles_palette0.ppm --bank 6 --bpp 4 --palette-json tools/out/bank3_palettes.json --palette-index 0
python3 tools/extract_snes_tiles.py tools/out/bank7_42fb_8000.bin tools/out/bank7_42fb_8000_gray.ppm --raw-binary --offset 0x6 --byte-length 0x1000 --bpp 4 --columns 16
python3 tools/extract_snes_tiles.py tools/out/bank7_26fb_817a.bin tools/out/bank7_26fb_817a_gray.ppm --raw-binary --bpp 4 --columns 16
python3 tools/extract_snes_tiles.py tools/out/bank1_boot_vram_variant0.bin tools/out/bank1_boot_vram_variant0_4bpp.ppm --raw-binary --bpp 4 --byte-length 0xC000 --columns 32
python3 tools/scan_structured_bank.py game.smc --bank 7 --json-out tools/out/bank7_chunks.json
python3 tools/extract_snes_tiles.py game.smc tools/out/bank7_chunk1_gray.ppm --bank 7 --bpp 4 --offset 0x017e --byte-length 0x64c
python3 tools/extract_snes_tiles.py game.smc tools/out/bank9_tiles_2bpp.ppm --bank 9 --bpp 2
```

Useful make targets:

- `make -C tools bank3-palettes`
- `make -C tools boot-palettes`
- `make -C tools boot-palettes-flat`
- `make -C tools boot-screen-manifest`
- `make -C tools boot-vram-preview`
- `make -C tools boot-vram-overlay-preview`
- `make -C tools boot-screen-preview`
- `make -C tools boot-screen-overlay-preview`
- `make -C tools bank6-preview`
- `make -C tools bank7-scan`
- `make -C tools bank7-headers`
- `make -C tools bank13-headers`
- `make -C tools bank13-validate`
- `make -C tools bank30-headers`
- `make -C tools bank30-validate`
- `make -C tools bank30-registry`
- `make -C tools tilemap-provenance-1086-1093`
- `make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600`
- `make -C tools l001210-save-savestate L001210_SAVE_STATE_FRAME=1093 L001210_SAVE_TOTAL_FRAMES=1120`
- `make -C tools l001210-probe-matrix L001210_MATRIX_TOTAL_FRAMES=2200`
- `make -C tools l001210-trace-summary`

Current environment note:

- probe-side savestate save is currently best-effort only; the headless
  `--testRunner` build reports no callable save API on `emu`.
- `tools/run_mesen_ppu_extract.sh` now resolves `MesenCore.so` from
  `MESEN_RELEASE_DIR`, or derives that directory from `MESEN_BIN` / `PATH`
  when possible.
- `make -C tools regression-gates REGRESSION_GATES_RENDER_DIR=../port/build/regression_frames`
- `make -C tools callback-contracts-check`
- `make -C tools docs-wiki`
  - regenerates `tools/out/docs_wiki/` and the paired markdown bundle under `tools/out/docs_wiki_markdown_bundle/`
- `make -C tools terminal-bot-smoke`
- `make -C tools track1-b-hold-cycle`
- `make -C tools bank7-42fb0`
- `make -C tools bank7-42fb0-preview`
- `make -C tools bank7-26fb0`
- `make -C tools bank7-26fb0-preview`
- `make -C tools bank7-chunk1-preview`
- `make -C tools bank9-preview`
- `make -C tools bank1-credits-scene-preview`
- `make -C tools bank1-credits-scene-compare`
- `make -C tools bank1-a35a-scene-preview`
- `make -C tools bank1-a00c-scene-preview`
- `make -C tools bank1-bootstrap-queue-978-preview`
- `make -C tools bank1-bootstrap-queue-982-preview`
- `make -C tools bank1-bootstrap-queue-986-preview`
- `make -C tools bank1-bootstrap-queue-986-noobj-preview`
- `make -C tools bank1-bootstrap-queue-986-bridgeoam-preview`
- `make -C tools bank1-bootstrap-queue-990-bridgeoam-preview`
- `make -C tools bank1-bootstrap-queue-994-bridgeoam-preview`
- `make -C tools bank1-visible-mode7-window-preview`
- `make -C tools intro-bootstrap-deltas`
- `make -C tools intro-bootstrap-queue`
- `make -C tools mesen-ppu-frame MESEN_FRAME=300`
- `make -C tools mesen-design-pack MESEN_FRAME=300`
- `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/mesen_range_1086_1093_v1`
- `make -C tools track1-seed-sweep TRACK1_SEED_SWEEP_SAVESTATE=../.mesen-config/Mesen2/SaveStates/game_11.mss`
- `make -C tools lane3-live-race-asset-focus`
- `make -C tools intro-loop-dump`
- `make -C tools intro-loop-sequence`
- `make -C tools intro-native-978`
- `make -C tools intro-native-978-bridge`
- `make -C tools intro-native-978-bridge-visible`
- `make -C tools intro-loop-hybrid-bridge-sequence`
- `make -C tools intro-loop-hybrid-bridge-visible-sequence`
- `make -C tools ballistic-native-clip`
- `make -C tools ballistic-rom-clip`
- `make -C tools ballistic-callback-asset`
- `make -C tools intro-loop-hybrid-sequence`

`mesen_ppu_extract` is the current bridge for the idea of using Mesen itself as an asset/layer extractor. It writes:

- `bg1.ppm` ... `bg4.ppm`, `main.ppm`, `sub.ppm`: full tilemap-viewer style outputs from Mesen's own `GetTilemap`
- `bg1_visible.ppm` ... `sub_visible.ppm`: 256-pixel viewport crops using the current scroll state
- `tiles_bg1.ppm` ... `tiles_bg4.ppm`: CHR/tile sheets exported through Mesen's own `GetTileView` using the active SNES BG format and current `CHR` base address
- `palette.json` and `palette.ppm`: RGB palette dump and swatch preview
- `sprites_screen.ppm`, `sprites.json`, and `sprite_previews/sprite_###.ppm`: Mesen's sprite preview screen, metadata list, and per-sprite preview sheets
- `vram.bin`, `cgram.bin`, `oam.bin`: raw memory dumps for the same frame
- `state.json`: PPU summary used for the extraction
- `ppu_state.json`: flat PPU-state export in the same key format consumed by `render_mesen_snes_bg.py` and the SDL runtime, now including OAM-related fields (`ppu.oamBaseAddress`, `ppu.oamAddressOffset`, `ppu.internalOamAddress`, `ppu.oamMode`, `ppu.enableOamPriority`, `ppu.objInterlace`, `ppu.overscanMode`)

Current practical reading for this tool:

- it is good for standalone layer/palette/sprite extraction
- it is now also good for standalone BG tileset extraction through Mesen's own tile-view renderer
- its `GetTilemap` outputs are viewer-oriented layer renders, not a final composed screenshot
- for frame `300`, the extracted PPU state lands on the expected credits scene state (`bgMode = 1`, `mainScreenLayers = 0x04`, `chrAddress = 0x2000/0x4000/0x6000`)
- the frame-`300` `*_visible.ppm` outputs do not match the final screenshot pixel-for-pixel, so they should be treated as standalone layer assets, not as golden-frame replacements

`build_mesen_design_pack.py` now adds inspect-and-draw outputs on top of those raw dumps:

- `tilemaps/bg*_tilemap.json`: decoded tilemap entries per cell (tile index, palette, priority, hflip, vflip), plus usage stats
- `tilemaps/bg*_tilemap.csv`: spreadsheet-friendly per-cell export
- `sprites/sprites_visible.json`: visible-sprite subset with priority grouping for draw-order inspection
- `design_pack.json`: references all of the above through `tilemaps` and `sprite_analysis` sections

For the `Ballistic presents` splash, the frame-`654` extraction is a clean exact anchor:

- `tools/out/mesen_frame654_assets/bg1_visible.ppm` compares against `tools/out/td2_boot_probe_frame_654.png` with `0` mismatched pixels
- the scene is still `bgMode = 1`, `mainScreenLayers = 0x01`, and has `0` visible sprites
- this makes it suitable as the first frame of a sampled SDL intro sequence

`extract_mesen_scene_range.py` is the current bridge from deterministic Mesen intro captures into runtime playback:

- it extracts one folder per requested frame: `frame_00654/`, `frame_00658/`, ...
- each frame folder contains `vram.bin`, `cgram.bin`, `ppu_state.json`, and the rest of the usual Mesen bridge outputs
- `--input-windows` reuses the same `start-end:buttons;...` syntax as the Lua
  capture/probe tools and now works through guarded per-frame resume/pause
  advances when the extractor needs scripted input
- it writes `sequence.txt`, a simple line-oriented manifest that `port/build/td2_port --sequence ...` can play directly
- when `oam.bin` exists in the frame folder, it is now emitted as the optional fourth `snes_bg` path
- it also writes `sequence.json`, which records the extracted frame list, adjacent-collapse decisions, and total playback duration

The first sampled Ballistic playback set still lives in `tools/out/ballistic_sequence/`:

- `sequence.txt`: `15` `snes_bg` entries covering frames `654..710` in `4`-frame steps
- `sequence.json`: summary of those entries, with `60` frames of total playback

The current native measured Ballistic artifact lives in `tools/out/ballistic_native/`:

- `ballistic_splash.txt`: indexed palette-animation clip manifest
- `ballistic_splash_indices.bin`: `256x224` indexed image with `15` classes total
- `ballistic_splash.json`: structured summary with palette timeline and pixel-class counts
- `ballistic_splash_preview.ppm`: first-frame reconstruction preview
- `../ballistic_native_sequence.txt`: one-entry runtime sequence manifest for the clip

The current ROM-derived Ballistic artifact lives in `tools/out/ballistic_rom/`:

- `ballistic_splash.txt`: ROM-derived indexed palette-animation clip manifest
- `ballistic_splash_indices.bin`: copied indexed image shared with the measured reference clip
- `ballistic_splash.json`: structured summary with inferred class-to-CGRAM mapping
- `ballistic_splash_preview.ppm`: ROM-derived first visible frame preview
- `../ballistic_rom_sequence.txt`: one-entry runtime sequence manifest for the current Ballistic runtime clip

The current direct runtime Ballistic callback artifact lives in `tools/out/ballistic_callback/`:

- `ballistic_a39c.txt`: compact callback asset manifest
- `ballistic_a39c_indices.bin`: copied indexed image shared with the measured reference clip
- `ballistic_a39c_helper_cgram.bin`: helper-scene CGRAM seed for the callback
- `ballistic_a39c_ramp.bin`: extracted `04:99ED` ramp words used by `01:A39C`
- `ballistic_a39c.json`: structured summary with class mapping and runtime parameters
- `../ballistic_callback_sequence.txt`: one-entry runtime sequence manifest for the direct callback path

The current queue-driven bootstrap artifacts live in `tools/out/`:

- `intro_bootstrap_958_974_queue.json`: frame `958 -> 974` queue/OAM summary
- `intro_bootstrap_978_982_queue.json`: frame `978 -> 982` queue/OAM summary
- `intro_bootstrap_982_986_queue.json`: frame `982 -> 986` queue/OAM summary
- `intro_bootstrap_986_990_queue.json`: frame `986 -> 990` queue/OAM summary
- `bank1_bootstrap_queue_978.*`: queue-driven frame `978` scene from seed `958` VRAM plus frame `974` queue/OAM state
- `bank1_bootstrap_queue_982.*`: queue-driven frame `982` scene from derived frame `978` VRAM plus frame `982` queue/OAM state
- `bank1_bootstrap_queue_986.*`: experimental queue-driven frame `986` scene from derived frame `982` VRAM plus frame `986` queue/OAM state
- `bank1_bootstrap_queue_986_noobj.*`: the same derived frame `986` scene with OBJ composition disabled
- `bank1_bootstrap_queue_986_bridgeoverride.*`: the same derived frame `986` scene rendered with a clean bridge OAM override instead of the probe OAM snapshot
- `bank1_bootstrap_queue_990_bridgeobj.*`: queue-driven frame `990` scene from derived frame `986` VRAM plus frame `990` queue state and clean bridge OAM

Current practical reading for those queue scenes:

- `bank1_bootstrap_queue_978.ppm` compares against the real frame `978` target with `2` mismatched pixels (`0.003488%`)
- `bank1_bootstrap_queue_982.ppm` compares against the real frame `982` target with `2` mismatched pixels (`0.003488%`)
- `bank1_bootstrap_queue_986.ppm` is not yet promotable; it still lands at `958` mismatched pixels (`1.670619%`) against the real frame `986` screenshot
- `bank1_bootstrap_queue_986_noobj.ppm` lands much closer at `21` mismatched pixels (`0.036621%`)
- `bank1_bootstrap_queue_986_bridgeoverride.ppm` also lands at `21` mismatched pixels (`0.036621%`)
- `bank1_bootstrap_queue_990_bridgeobj.ppm` is the next reproducible bridge-accurate step:
  - compare vs real frame `990` screenshot: `1518` mismatched pixels (`2.647182%`)
  - compare vs Mesen `main_visible.ppm`: `2` mismatched pixels (`0.003488%`)
- practical reading: the queue-driven BG path for frame `986` is nearly solved; the remaining regression is concentrated in Mode 7 OBJ composition
- late-frame OAM capture is the concrete reason for that regression:
  - probe and bridge OAM dumps match exactly at frames `978` and `982`
  - they diverge starting at frame `986` (`21` differing bytes) and drift further by frame `990` (`75` differing bytes)
  - the bridge OAM path collapses the bad OBJ overlay back to the no-OBJ baseline, so the bad late-frame object overlay is tied to the probe OAM snapshot, not the queued BG path

The current best no-input intro-loop runtime manifest is `tools/out/intro_loop_hybrid_sequence.txt`:

- it replaces frames `654..958` with the direct runtime Ballistic `ballistic_a39c` clip
- it keeps the sampled bootstrap image for `958..978`
- it replaces frames `978..985` with the queue-driven `snes_bg` splice from `tools/out/intro_native_978_derived_sequence.txt`
- it keeps the remaining later attract states as sampled `image` playback
- it currently compares exactly in the SDL runtime at offsets `0`, `320`, and `676`
- the promoted native splice currently compares at:
  - offset `324` / source frame `978`: `2` mismatched pixels (`0.003488%`)
  - offset `328` / source frame `982`: `2` mismatched pixels (`0.003488%`)
  - offset `332` / source frame `986`: exact sampled fallback

The current bridge-accurate native-coverage manifests are:

- `tools/out/intro_loop_hybrid_bridge_sequence.txt`
  - keeps the direct runtime Ballistic callback for `654..958`
  - keeps the sampled bootstrap image for `958..978`
  - replaces frames `978..993` with the queue-oriented bridge splice from `tools/out/intro_native_978_bridge_sequence.txt`
  - falls back to sampled `image` playback from frame `994` onward
- `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt`
  - keeps the same direct runtime Ballistic callback for `654..958`
  - keeps the sampled bootstrap image for `958..978`
  - replaces frames `978..1093` with native `snes_bg` scenes from `tools/out/intro_native_978_bridge_visible_sequence.txt`
- current promoted bridge-visible validation is:
  - frame `990` derived scene vs Mesen `main_visible.ppm`: `2` mismatched pixels
  - frames `991..997` derived scenes vs Mesen `main_visible.ppm`: `4` mismatched pixels each
  - SDL playback from `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt` matches the new `990..997` scene artifacts exactly at offsets `336..343`
  - the direct bridge-extracted continuation at offsets `344..351` compares against Mesen `main_visible.ppm` with:
    - frame `1000`: `2` mismatched pixels
    - all other frames in `998..1005`: `4` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `352..359` compares against Mesen `main_visible.ppm` with:
    - frames `1006..1010`: `6` mismatched pixels each
    - frames `1011..1012`: `8` mismatched pixels each
    - frame `1013`: `10` mismatched pixels
  - the next aligned direct bridge-extracted block at offsets `360..367` compares against Mesen `main_visible.ppm` with:
    - frames `1014..1021`: `10` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `368..375` compares against Mesen `main_visible.ppm` with:
    - frames `1022..1023`: `10` mismatched pixels each
    - frames `1024..1025`: `8` mismatched pixels each
    - frames `1026..1029`: `11` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `376..383` compares against Mesen `main_visible.ppm` with:
    - frames `1030..1037`: `0, 0, 0, 0, 4, 3, 0, 0` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `384..391` compares against Mesen `main_visible.ppm` with:
    - frames `1038..1045`: `6, 6, 9, 12, 13, 11, 16, 15` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `392..399` compares against Mesen `main_visible.ppm` with:
    - frames `1046..1053`: `13, 13, 16, 18, 18, 18, 17, 14` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `400..407` compares against Mesen `main_visible.ppm` with:
    - frames `1054..1061`: `14, 14, 15, 16, 19, 20, 21, 22` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `408..415` compares against Mesen `main_visible.ppm` with:
    - frames `1062..1069`: `25, 26, 26, 21, 26, 23, 23, 25` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `416..423` compares against Mesen `main_visible.ppm` with:
    - frames `1070..1077`: `29, 27, 26, 28, 34, 33, 39, 32` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `424..431` compares against Mesen `main_visible.ppm` with:
    - frames `1078..1085`: `41, 41, 47, 47, 58, 63, 60, 69` mismatched pixels each
  - the next aligned direct bridge-extracted block at offsets `432..439` compares against Mesen `main_visible.ppm` with:
    - frames `1086..1093`: `89, 92, 89, 90, 102, 115, 144, 129` mismatched pixels each

The late attract bridge-visible builder artifacts now live in:

- `tools/out/bank1_mode7_visible_991.*` through `tools/out/bank1_mode7_visible_997.*`
- they seed from `tools/out/mesen_frame990_assets_v2/vram.bin`
- they patch the visible Mode 7 data regions at `0x4920` and `0x49A0` from three rotating ROM chunks:
  - `1A:AA10`
  - `1A:AB58`
  - `1A:ACA0`
- practical reading:
  - the queue-driven model is still the right explanation for the staged bootstrap uploads
  - the bridge-visible model is the current best explanation of what the late attract window actually displays on frames `991..997`
  - `tools/out/mesen_range_998_1005_v1/sequence.txt` is the current direct bridge-extracted continuation of that same `01:9FE5` family through frame `1005`
  - `tools/out/mesen_range_1006_1013_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1013`
  - `tools/out/mesen_range_1014_1021_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1021`
  - `tools/out/mesen_range_1022_1029_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1029`
  - `tools/out/mesen_range_1030_1037_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1037`
  - `tools/out/mesen_range_1038_1045_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1045`
  - `tools/out/mesen_range_1046_1053_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1053`
  - `tools/out/mesen_range_1054_1061_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1061`
  - `tools/out/mesen_range_1062_1069_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1069`
  - `tools/out/mesen_range_1070_1077_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1077`
  - `tools/out/mesen_range_1078_1085_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1085`
  - `tools/out/mesen_range_1086_1093_v1/sequence.txt` extends that same direct bridge-extracted continuation through frame `1093`
  - `tools/out/visible_mode7_1094_1101.json` captures the first visible-scanline `ppu.mode7.*` values for the next failing block
  - `tools/out/mesen_range_1094_1101_v1/frame_XXXXX/ppu_state_visible.json` are diagnostic sidecars patched from those visible samples
  - `tools/out/post_1093_compare/summary.md` now measures the direct extracted
    end-of-frame state against the visible surface across `1094..1101`
  - `tools/runtime_manifest_to_json.py` now turns the assembled runtime manifest into the JSON summary used by the intro bridge-visible pipeline, so extending these windows no longer needs embedded JSON blobs in `Makefile`
  - practical reading:
    - the visible-scanline Mode 7 values for `1094..1101` are now measurable and repeatable
    - `main_visible.ppm` is exactly the top `224` lines of `main.ppm` across the whole block
    - simply swapping those visible values onto the direct extracted frame states makes the mismatch much worse:
      - base render vs `main_visible.ppm`: `177..574` mismatched pixels
      - visible-state render vs `main_visible.ppm`: `362..5930`
    - so the blocker beyond `1093` is not solved by a bare `ppu_state` substitution

The next milestone, the full first no-input attract loop, now lives in `tools/out/intro_loop*`:

- `tools/out/intro_loop.json`: raw single-run Mesen range dump summary for frames `654..2070`, sampled every `4` frames
- `tools/out/intro_loop_sequence.txt`: exact sampled `image` manifest for SDL playback
- `tools/out/intro_loop_sequence.json`: collapsed playback summary
- `tools/out/intro_loop_sequence_images/`: `355` converted `PPM` frames sourced from Mesen screenshots

Current validated reading for that loop:

- the attract callback cycle repeats every `1418` frames
- the cycle begins at frame `654`, where the active main callback first becomes `01:A39C`
- it repeats at frames `2072` and `3490`
- the exact sampled manifest currently collapses `355` captured frames down to `226` playback entries while preserving `1418` frames of total runtime duration

The first native post-Ballistic replacement window now lives in `tools/out/intro_native_978/`:

- `sequence.txt`: `snes_bg` playback manifest for frames `978` and `982`, carrying `oam.bin`
- `sequence.json`: summary of those two extracted frames
- `frame_00978/` and `frame_00982/`: full Mesen bridge frame folders with `vram.bin`, `cgram.bin`, `ppu_state.json`, `oam.bin`, `main_visible.ppm`, and related layer assets
- current validation against `main_visible.ppm` is:
  - frame `978`: `2` mismatched pixels (`0.003488%`)
  - frame `982`: `4` mismatched pixels (`0.006975%`)
- this window is now promoted into `tools/out/intro_loop_hybrid_sequence.txt`

The promoted queue-driven replacement window now lives in:

- `tools/out/intro_native_978_derived_sequence.txt`
- `tools/out/intro_native_978_derived_sequence.json`

It contains exactly two derived `snes_bg` entries:

- frame `978` from `bank1_bootstrap_queue_978.*`
- frame `982` from `bank1_bootstrap_queue_982.*`

The wider bridge-accurate replacement window now also lives in:

- `tools/out/intro_native_978_bridge_sequence.txt`
- `tools/out/intro_native_978_bridge_sequence.json`

It contains four derived `snes_bg` entries:

- frame `978` from `bank1_bootstrap_queue_978.*`
- frame `982` from `bank1_bootstrap_queue_982.*`
- frame `986` from `bank1_bootstrap_queue_986_bridgeoverride.*`
- frame `990` from `bank1_bootstrap_queue_990_bridgeobj.*`

The current bootstrap-side experiment for `L00A00C` now lives at `tools/out/bank1_l00a00c_scene*`:

- it seeds `VRAM/CGRAM` from frame `954`
- it applies the direct ROM-side setup uploads from `01:A00C`
- it reuses the stable frame-`974` PPU presentation as a rendering template
- the generated preview is `tools/out/bank1_l00a00c_scene.ppm`
- current reading:
  - it is useful as a repeatable experiment harness for `958..977`
  - it is not exact yet; the preview is still `99.991281%` mismatched against frames `958` and `974` with `--skip-palette`
  - the missing behavior is therefore beyond the obvious direct uploads or a simple start-frame vs end-frame capture issue

The current bootstrap delta summaries now live in:

- `tools/out/intro_bootstrap_954_958_delta.json`
- `tools/out/intro_bootstrap_958_974_delta.json`
- `tools/out/intro_bootstrap_958_974_queue.json`

Current useful readings from those summaries:

- `954 -> 958`:
  - screenshot mismatch: `13.741629%`
  - `VRAM` changes: `6808` bytes
  - `CGRAM` changes: `0` bytes
  - `PPU` switches to `bgMode = 7`, `mainScreenLayers = 0x11`, `forcedBlank = true`
- `958 -> 974`:
  - screenshot mismatch: `0.000000%`
  - `VRAM` changes: `5875` bytes, all on odd bytes
  - `CGRAM` changes: `278` bytes
  - active main callback changes from bank 0 idle `00:8029` to `01:9D69`
  - key bootstrap state becomes populated: `$0202 = 1`, `$0208 = 13`, `$020A = 0x9CC3`, `$040A = 0xFFFF`

The WRAM-side queue decode now makes the landing frame more concrete:

- `dp_0054 = 0x10` at frame `974`, so exactly `2` `0600` DMA descriptors are live
- those descriptors decode as:
  - command `0x01`, source `1A:9948`, size `0x1040`, VRAM destination `0x4000`
  - command `0x01`, source `1A:A988`, size `0x0040`, VRAM destination `0x4900`
- the JSON also carries the probe-side cursor and the pre-sliced active descriptor list:
  - `probe_after.dp_0054 = 16`
  - `regions.0600_dma_queue.active_dma_descriptor_count_after = 2`
  - `regions.0600_dma_queue.active_after_entries = [...]`
- `0700..091F` is confirmed as the staged OAM upload buffer copied by the NMI `DMA1 -> $2104` path
- repeated `0xE100` head words in that region are the OAM fill/sentinel pattern, not a tile queue

That queue summary now also feeds a derived scene artifact:

- `tools/out/bank1_bootstrap_queue_978.*`
  - seed VRAM: frame `958`
  - active queue/OAM stage: frame `974`
  - presentation template: frame `978`
  - current validation against the real frame `978` screenshot: `2` mismatched pixels (`0.003488%`)
  - the SDL runtime matches that derived preview exactly when loaded via `--snes-bg-prefix`

The wrapper derives the Mesen release directory from `MESEN_BIN`, `MESEN_RELEASE_DIR`, or `PATH`. Set `MESEN_RELEASE_DIR=/path/to/release` when auto-detection is not enough.

To keep the promoted tooling surface portable, run:

```sh
make -C tools portability-path-check
```

The JSON output is a nested array:

- outer array: palette index
- inner array: 16 colors
- color entry: `[r, g, b]`

This format is intentionally simple so the SDL runtime can parse it without a third-party JSON library.

Frame comparison:

```sh
python3 tools/compare_frames.py expected.png actual.ppm --diff-out diff.ppm
```

Current practical reading for the attract-mode validation targets:

- frame `1200`: `--oam` with the default `--obj-renderer simple` improves the compare from `9.125628%` to `7.934570%`
- frame `1200`: `--obj-renderer mode7-ppu` is available as an experimental path, but currently lands at `8.032227%`
- frame `1080`: the current OBJ decode/composition path is still not reliable and remains worse than BG-only

The flattened manifest is useful when you want to point the current SDL runtime at a named extraction result without changing its minimal JSON parser:

```sh
./port/build/td2_port --palette tools/out/bank1_boot_palettes_flat.json
```

The new raw-binary mode is useful once a chunk has already been decompressed or a synthetic VRAM image has been assembled:

```sh
./port/build/td2_port --image tools/out/bank7_42fb_8000_gray.ppm
./port/build/td2_port --image tools/out/bank7_26fb_817a_gray.ppm
./port/build/td2_port --image tools/out/bank1_boot_vram_variant0_4bpp.ppm
./port/build/td2_port --image tools/out/bank1_boot_screen_variant0.ppm
```

`build_boot_vram.py` still accepts `--selector-1c78` and `--selector-1c7a`, but the rest of the job selection now follows the actual bank 1 state tables:

- `bank9_boot_vram_pages` and `bank8_bulk_vram_block` select by `$1CCA`
- `compressed_bank7_group_a` and `compressed_bank7_group_b` select by `$1CAC`, or force entry `8` on the negative-layout path
- the `CGRAM 0x00` palette selection follows the same `compressed_index + $1CAE` rule as `L008CA2`

`render_boot_screen.py` currently renders BG layers only. OBJ palette loads at `CGRAM 0x90+` are tracked in its JSON summary, but OAM/sprite composition is not implemented yet.

`build_boot_vram.py` now accepts `42FB` as well as `26FB` on the `L0006C9` path. That matters because bank 1 helper `L00A9CB(0)` uses a `42FB` chunk for the copyright/credits scene instead of a raw block or `26FB` stream.

`render_mesen_snes_bg.py` is useful for validating a live Mesen capture against a raw VRAM/CGRAM/state dump. The current known-good scene is the power-on copyright/credits screen at frame `300`:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/render_mesen_snes_bg.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_vram.bin \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_cgram.bin \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_ppu_state.json \
  tools/out/mesen_poweron_5s_bg_only.ppm \
  --json-out tools/out/mesen_poweron_5s_bg_only.json

python3 tools/compare_frames.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png \
  tools/out/mesen_poweron_5s_bg_only.ppm \
  --diff-out tools/out/mesen_poweron_5s_bg_only_diff.ppm
```

That comparison currently produces an exact match. The live dump shows:

- `ppu.bgMode = 1`
- `ppu.mainScreenLayers = 0x04`
- raw layer state values:
  - `ppu.layers[0].tilemapAddress = 0`
  - `ppu.layers[1].tilemapAddress = 2048`
  - `ppu.layers[2].tilemapAddress = 4096`
  - `ppu.layers[0].chrAddress = 8192`
  - `ppu.layers[1].chrAddress = 16384`
  - `ppu.layers[2].chrAddress = 24576`

One quirk is important: for this scene, Mesen reports raw `vscroll = 1023` for the visible layer, but the visible output matches an effective scroll of `0`. `render_mesen_snes_bg.py` normalizes that value accordingly.

The same renderer now covers the later Mode 7 attract frames as BG-only validation targets:

```sh
python3 tools/render_mesen_snes_bg.py \
  tools/out/td2_boot_probe_vram_1080.bin \
  tools/out/td2_boot_probe_cgram_1080.bin \
  tools/out/td2_boot_probe_ppu_state_1080.json \
  tools/out/td2_boot_probe_bg_1080.ppm \
  --json-out tools/out/td2_boot_probe_bg_1080.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/td2_boot_probe_vram_1200.bin \
  tools/out/td2_boot_probe_cgram_1200.bin \
  tools/out/td2_boot_probe_ppu_state_1200.json \
  tools/out/td2_boot_probe_bg_1200.ppm \
  --json-out tools/out/td2_boot_probe_bg_1200.json
```

Current validation status:

- frame `300`: exact match against the captured screenshot
- frame `1080`: `12.341309%` mismatch against the captured screenshot
- frame `1200`: `9.125628%` mismatch against the captured screenshot

The remaining mismatch on the Mode 7 frames is currently treated as missing OBJ or other overlay composition, because the shared Python and SDL Mode 7 BG renderers match each other exactly.

For deeper frame-state analysis, the Mesen probe can now emit a register trace and a second `startFrame` snapshot:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1081 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1080 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_mode7_writes.json \
  --json-out tools/out/td2_boot_probe_mode7_writes_summary.json
```

The `startFrame` dump uses the same naming pattern with a `td2_boot_probe_startframe_*` prefix and is useful when late-vblank writes would otherwise blur the frame boundary.

The same frame-`300` scene is now also reconstructible directly from ROM without using live VRAM/CGRAM dumps:

```sh
make -C tools bank1-credits-scene-preview

python3 tools/compare_frames.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png \
  tools/out/bank1_credits_scene.ppm \
  --diff-out tools/out/bank1_credits_scene_vs_mesen_diff.ppm
```

That comparison currently also produces an exact match. The ROM-driven scene builder writes:

- `tools/out/bank1_credits_scene_vram.bin`
- `tools/out/bank1_credits_scene_cgram.bin`
- `tools/out/bank1_credits_scene_ppu_state.json`
- `tools/out/bank1_credits_scene.ppm`
- `tools/out/bank1_credits_scene.json`

The next identified front-end builder after the credits scene is `L00A35A`, which sets `TMAIN = 0x01` and uses helper index `4`. The generic helper-scene builder can materialize its static setup:

```sh
make -C tools bank1-a35a-scene-preview
```

That currently writes:

- `tools/out/bank1_l00a35a_scene_vram.bin`
- `tools/out/bank1_l00a35a_scene_cgram.bin`
- `tools/out/bank1_l00a35a_scene_ppu_state.json`
- `tools/out/bank1_l00a35a_scene.ppm`
- `tools/out/bank1_l00a35a_scene.json`

This should be treated as the scene's static setup, not a guarantee of exact frame parity. The follow-up callback under `L00A35A` animates the front-end after the one-shot helper build.


## Source Of Truth :: Port README

- Source: `port/README.md`
- Bundle copy: `sources/port/README.md`
- Last updated: `2026-03-22 16:26`
- Note: SDL runtime scope, usage, and current sequence playback path.

---

# TD2 Port Runtime Skeleton

This directory contains the first PC runtime skeleton for the SNES-to-PC port.

Current scope:

- SDL2 window and renderer
- fixed-timestep 60 Hz main loop
- 256x224 framebuffer presentation
- palette JSON loader for bank 3 experiments
- palette swatch and gradient viewer
- PPM image viewer for extracted assets
- direct SNES BG renderer from extracted `VRAM + CGRAM + PPU state`
- optional OBJ/OAM composition for extracted SNES scenes
- sequence playback for extracted intro/front-end scenes
- indexed palette-animation playback for native intro clips

Build:

```sh
make -C port
```

Run:

```sh
./port/build/td2_port
./port/build/td2_port --palette ./tools/out/bank3_palettes.json
./port/build/td2_port --palette ./tools/out/bank3_palettes.json --palette-index 12
./port/build/td2_port --image ./tools/out/bank6_tiles_gray.ppm
./port/build/td2_port --snes-bg-prefix ./tools/out/bank1_credits_scene
./port/build/td2_port --sequence ./tools/out/ballistic_sequence/sequence.txt
./port/build/td2_port --sequence ./tools/out/ballistic_native_sequence.txt
./port/build/td2_port --sequence ./tools/out/ballistic_rom_sequence.txt
./port/build/td2_port --sequence ./tools/out/ballistic_callback_sequence.txt
./port/build/td2_port --sequence ./tools/out/intro_loop_sequence.txt
./port/build/td2_port --sequence ./tools/out/intro_loop_hybrid_sequence.txt
./port/build/td2_port --sequence ./tools/out/intro_loop_hybrid_bridge_sequence.txt
./port/build/td2_port --sequence ./tools/out/intro_loop_hybrid_bridge_visible_sequence.txt
./port/build/td2_port --headless --palette ./tools/out/bank3_palettes.json --frames 1 --dump-prefix /tmp/td2_frame
```

Controls:

- `Esc`: quit
- `Left` / `Right`: previous or next 16-color palette, or pan image horizontally
- `Up` / `Down`: pan image vertically
- `Home` / `End`: jump to first or last palette, or move image view to top-left / bottom-right
- `Space`: toggle automatic palette cycling

For headless smoke tests, run with SDL's dummy video driver:

```sh
./port/build/td2_port --headless --palette ./tools/out/bank3_palettes.json --frames 5
```

For validation-oriented frame dumps:

```sh
./port/build/td2_port --headless --palette ./tools/out/bank3_palettes.json --frames 1 --dump-prefix ./port/build/frame
./port/build/td2_port --headless --snes-bg-prefix ./tools/out/bank1_credits_scene --frames 1 --dump-prefix ./port/build/credits
./port/build/td2_port --headless --sequence ./tools/out/ballistic_sequence/sequence.txt --sequence-no-loop --frames 60 --dump-prefix ./port/build/ballistic
./port/build/td2_port --headless --sequence ./tools/out/ballistic_native_sequence.txt --sequence-no-loop --frames 304 --dump-prefix ./port/build/ballistic_native
./port/build/td2_port --headless --sequence ./tools/out/ballistic_rom_sequence.txt --sequence-no-loop --frames 304 --dump-prefix ./port/build/ballistic_rom
./port/build/td2_port --headless --sequence ./tools/out/ballistic_callback_sequence.txt --sequence-no-loop --frames 304 --dump-prefix ./port/build/ballistic_callback
./port/build/td2_port --headless --sequence ./tools/out/intro_loop_sequence.txt --sequence-no-loop --frames 1418 --dump-prefix ./port/build/intro_loop
./port/build/td2_port --headless --sequence ./tools/out/intro_loop_hybrid_sequence.txt --sequence-no-loop --frames 1418 --dump-prefix ./port/build/intro_loop_hybrid
./port/build/td2_port --headless --sequence ./tools/out/intro_loop_hybrid_bridge_sequence.txt --sequence-no-loop --frames 1418 --dump-prefix ./port/build/intro_loop_hybrid_bridge
./port/build/td2_port --headless --sequence ./tools/out/intro_loop_hybrid_bridge_visible_sequence.txt --sequence-no-loop --frames 1418 --dump-prefix ./port/build/intro_loop_hybrid_bridge_visible
```

This writes `./port/build/frame_00000.ppm` or `./port/build/credits_00000.ppm`.

The SNES BG path accepts either a shared prefix or explicit files:

```sh
./port/build/td2_port --snes-bg-prefix ./tools/out/bank1_credits_scene

./port/build/td2_port \
  --snes-bg-vram ./tools/out/bank1_credits_scene_vram.bin \
  --snes-bg-cgram ./tools/out/bank1_credits_scene_cgram.bin \
  --snes-bg-state ./tools/out/bank1_credits_scene_ppu_state.json

./port/build/td2_port \
  --snes-bg-vram ./tools/out/mesen_frame978_assets/vram.bin \
  --snes-bg-cgram ./tools/out/mesen_frame978_assets/cgram.bin \
  --snes-bg-state ./tools/out/mesen_frame978_assets/ppu_state.json \
  --snes-bg-oam ./tools/out/mesen_frame978_assets/oam.bin
```

This uses the extracted VRAM/CGRAM/state directly and renders the BG layers inside the SDL runtime, without going through a prebuilt PPM. When an OAM dump is provided, or when a sibling `oam.bin` is present next to the VRAM dump, the runtime also composites OBJ sprites.

For isolated `--snes-bg-*` validation, also pass an explicit empty sequence so
the default intro-loop manifest does not overwrite the requested scene:

```sh
./port/build/td2_port \
  --sequence /dev/null \
  --headless \
  --frames 1 \
  --dump-prefix ./port/build/frame \
  --snes-bg-vram ./tools/out/mesen_frame978_assets/vram.bin \
  --snes-bg-cgram ./tools/out/mesen_frame978_assets/cgram.bin \
  --snes-bg-state ./tools/out/mesen_frame978_assets/ppu_state.json \
  --snes-bg-oam ./tools/out/mesen_frame978_assets/oam.bin
```

That same path now supports Mode 7 BG scenes from live Mesen dumps:

```sh
./port/build/td2_port \
  --snes-bg-vram ./tools/out/td2_boot_probe_vram_1080.bin \
  --snes-bg-cgram ./tools/out/td2_boot_probe_cgram_1080.bin \
  --snes-bg-state ./tools/out/td2_boot_probe_ppu_state_1080.json
```

Sequence manifests are simple text files. Each line is one playback entry:

```txt
# type duration_frames path_a [path_b path_c path_d]
snes_bg 4 frame_00654/vram.bin frame_00654/cgram.bin frame_00654/ppu_state.json
snes_bg 4 frame_00978/vram.bin frame_00978/cgram.bin frame_00978/ppu_state.json frame_00978/oam.bin
indexed_anim 304 ballistic_rom/ballistic_splash.txt
ballistic_a39c 304 ballistic_callback/ballistic_a39c.txt
```

Paths can be relative to the manifest itself. This is the current path for sampled intro playback such as the `Ballistic presents` splash.

The current exact no-input intro-loop milestone uses an `image` sequence built from Mesen screenshots:

```txt
image 4 intro_loop_sequence_images/frame_00654.ppm
```

The current screenshot-exact intro-loop runtime artifact is `tools/out/intro_loop_hybrid_sequence.txt`: direct runtime Ballistic via `ballistic_a39c`, then a native OAM-aware `snes_bg` splice for `978..985`, then sampled `image` playback for the remaining later attract states.

The current bridge-accurate native-coverage artifacts are:

- `tools/out/intro_loop_hybrid_bridge_sequence.txt`: the same Ballistic and bootstrap path, then a longer queue-driven `snes_bg` splice covering `978..993`, then sampled `image` playback from `994` onward.
- `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt`: the same Ballistic and bootstrap path, then native `snes_bg` playback through frame `1093`.


## Source Of Truth :: ROM Analysis README

- Source: `rom_analysis/README.md`
- Bundle copy: `sources/rom_analysis/README.md`
- Last updated: `2026-03-06 20:05`
- Note: Top-level archaeology tree orientation.

---

# ROM Archaeology Workspace

This directory is the focused workspace for gameplay-era ROM archaeology.
It is organized around the next blocked milestone in the project:
mapping the callback chain from front-end code into gameplay logic.

## Scope

- Confirm the control-flow handoff from bank 0 scheduler callbacks into gameplay.
- Document bank 30 dispatch entry points and contracts.
- Trace bank 10 physics/AI state inputs and outputs.
- Trace bank 11 road/rasterizer data dependencies.
- Build extractable assets for maps, graphics, and audio in reusable formats.

## Layout

- `code/`: reverse-engineered assembly notes by subsystem (`main_loop`, `render`, `physics`).
- `graphics/`: extracted graphics candidates (tilesets, sprites, UI).
- `maps/`: extracted track and tilemap candidates.
- `audio/`: SPC traces and decoded sample assets.
- `docs/`: high-level memory map, engine sequencing notes, and execution roadmap.

## Immediate Next Steps

Detailed execution checklist: `rom_analysis/docs/next_steps_roadmap.md`.
Progress checkpoints: `rom_analysis/docs/progress_checkpoints.md`.
Validation gates: `rom_analysis/docs/validation_gates.md`.

1. Main-loop handoff map (bank 0 -> bank 30):
   - find first writes to `$096C-$0971` that target bank 30 addresses.
   - record state predicates for each callback transition.
2. Bank 30 API map:
   - catalog RTL entry points and caller banks.
   - classify each entry as dispatch/service/render/audio/input.
3. Bank 10 physics contract:
   - map RAM addresses read/written by external bank 10 entry points.
   - derive a C-struct draft for core physics state.
4. Bank 11 render contract:
   - map road/rasterizer table formats and frame outputs.
   - confirm dependencies on bank 10 and bank 30.
5. Content extraction lane:
   - track/text extraction from bank 4.
   - track/scenario extraction for gameplay maps.
   - audio path from SPC traces to runtime playback metadata.
6. Design tooling lane:
   - keep Mesen debugger extraction as the source of truth for tilemap/tiles/sprite inspection.
   - package per-frame design bundles with `tools/build_mesen_design_pack.py`.
   - package frame windows with `tools/build_mesen_design_pack_range.py` for design timeline review.
   - use `tilemaps/bg*_tilemap.json` and `sprites/sprites_visible.json` for draw-ready inspection metadata.

## Useful Commands

```sh
# Compression/data-structure scan by bank
python3 tools/scan_structured_bank.py game.smc --bank 10 --json-out tools/out/bank10_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 11 --json-out tools/out/bank11_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 30 --json-out tools/out/bank30_chunks.json

# Header manifest scan for compressed blocks
python3 tools/extract_compression_header_manifest.py game.smc --bank 10 --json-out tools/out/bank10_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 11 --json-out tools/out/bank11_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json

# Fast call-site hunting in disassembly
rg -n "jsl|jsr|jmp \\[" bank0.asm bank10.asm bank11.asm bank30.asm

# Runtime provenance for L001210 chunk dispatch (no-input attract loop)
make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90
make -C tools l001210-trace-summary
make -C tools bank30-registry
```


## Compression And Bank30 :: Bank30 Decompression

- Source: `rom_analysis/docs/bank30_decompression_report.md`
- Bundle copy: `sources/rom_analysis/docs/bank30_decompression_report.md`
- Last updated: `2026-03-21 11:59`
- Note: Current registry-backed read of bank30 markers and the active unresolved queue.

---

# Bank 30 Decompression Report

This report records the decompression/classification pass over marker hits
discovered in bank `30` (`0x1E`), including the new `67FB` decoder pass.

## Inputs

- `tools/out/bank30_chunks.json`
- `tools/out/bank30_headers.json`
- `tools/out/bank30_chunk_validation.json`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
- `tools/out/td2_boot_probe_l001210_summary.json`
- `tools/out/bank30_chunk_registry.json`

Detected markers:

- `42FB` at `1E:9681` (`offset 0x1681`)
- `67FB` at `1E:DA96` (`offset 0x5A96`)
- `26FB` at:
  - `1E:DF6C`
  - `1E:E039`
  - `1E:E73F`
  - `1E:E800`
  - `1E:EE7F`
- `67FB` at `1E:E91F` (`offset 0x691F`)

## Decompression Run

Commands executed:

```sh
make -C tools bank30-validate
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_42fb_9681.bin --bank 30 --addr 0x9681 --json-out tools/out/bank30_42fb_9681.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_da96.bin --bank 30 --addr 0xDA96 --json-out tools/out/bank30_67fb_da96.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_df6c.bin --bank 30 --addr 0xDF6C --json-out tools/out/bank30_26fb_df6c.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e039.bin --bank 30 --addr 0xE039 --json-out tools/out/bank30_26fb_e039.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e73f.bin --bank 30 --addr 0xE73F --json-out tools/out/bank30_26fb_e73f.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e800.bin --bank 30 --addr 0xE800 --json-out tools/out/bank30_26fb_e800.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_ee7f.bin --bank 30 --addr 0xEE7F --json-out tools/out/bank30_26fb_ee7f.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_e91f.bin --bank 30 --addr 0xE91F --json-out tools/out/bank30_67fb_e91f.json
```

## Decoder Results

| Marker start | Status | Output size | Input consumed | Notes |
|---|---|---:|---:|---|
| `1E:9681` (`42FB`) | ok | `0` | `11` | Declared output is zero; likely control/sentinel record. |
| `1E:DA96` (`67FB`) | ok | `28620` | `6429` | Mode word `0x59E7` (word mode path). |
| `1E:DF6C` (`26FB`) | ok | `1798` | `205` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E039` (`26FB`) | ok | `3264` | `1395` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E73F` (`26FB`) | ok | `1798` | `193` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E800` (`26FB`) | ok | `3168` | `1407` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E91F` (`67FB`) | fail | - | - | Stream ended early before reaching declared output size. |
| `1E:EE7F` (`26FB`) | ok | `1798` | `887` | Decodes from this offset, but offset is inside `1E:DA96` input window. |

## Overlap Validation

The successful `67FB` decode at `1E:DA96` consumes `6429` source bytes:

- source window: `[0x5A96, 0x73B3)` in bank-30 offsets
- this window includes every later marker hit (`26FB` at `DF6C/E039/E73F/E800/EE7F`
  and `67FB` at `E91F`)

Practical reading: marker scan output in this region must be treated as
candidates, not confirmed top-level chunk boundaries.

## Bank 1 Pointer-Table Provenance

Bank-1 helper tables that feed `L001210` confirm direct references to five
bank-30 `26FB` starts:

Reference note: `rom_analysis/docs/bank1_l001210_pointer_tables.md`.

- `01:A789` + bank table `01:A7D3`:
  - index `28` -> `1E:DF6C`
  - index `29` -> `1E:E73F`
  - index `32` -> `1E:EE7F`
- `01:A842` + bank table `01:A888`:
  - index `28` -> `1E:E039`
  - index `29` -> `1E:E800`

This confirms those `26FB` starts are intentional entries even though they lie
inside the larger `67FB` decode window from `1E:DA96`.

## Runtime `L001210` Exec Probe

Runtime probe commands:

```sh
make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90
make -C tools l001210-trace-summary
```

Observed (`tools/out/td2_boot_probe_l001210_summary.json`):

- total `L001210` hits in the `3600`-frame no-input run: `34`
- unique source pointers: `16`
- bank-30 sources hit in this window: `8` hits total
  - `1E:DF6C` (`26FB`): frames `1280` and `2698`
  - `1E:E039` (`26FB`): frames `1282` and `2700`
  - `1E:E73F` (`26FB`): frames `1292` and `2709`
  - `1E:E800` (`26FB`): frames `1294` and `2712`
- no hits in this no-input window for:
  - `1E:9681` (`42FB`)
  - `1E:DA96` (`67FB`)
  - `1E:E91F` (`67FB`)
  - `1E:EE7F` (`26FB`)

Loop note:

- Each of the four active bank-30 entries above repeats exactly `1418` frames
  later, matching the measured no-input attract loop period.

Alternate scripted-input probe:

- command:
  - `TD2_BOOT_PROBE_TOTAL_FRAMES=4000 TD2_BOOT_PROBE_TRACE_L001210=1 TD2_BOOT_PROBE_INPUT_START_FRAME=240 TD2_BOOT_PROBE_INPUT=start,b MESEN_TIMEOUT_SECONDS=110 ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `python3 tools/summarize_l001210_trace.py .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json --json-out tools/out/td2_boot_probe_l001210_summary_startb.json`
- result:
  - only `2` total hits (`02:F51F`, `04:8000`, both `42FB`)
  - no bank-30 `L001210` sources observed in this path

## Tile Preview Probes

Generated grayscale probes (`4bpp`, plus `offset 0x6` variants):

- `tools/out/bank30_26fb_*_4bpp.ppm`
- `tools/out/bank30_26fb_*_4bpp_off6.ppm`
- `tools/out/bank30_26fb_*_2bpp_off6.ppm`
- `tools/out/bank30_67fb_da96_4bpp.ppm`
- `tools/out/bank30_67fb_da96_2bpp.ppm`

Observed decode geometry:

- `1798`-byte outputs decode as `56` tiles at `4bpp` (`128x32`) when probing both offset `0` and `0x6`.
- `3264` and `3168` outputs decode as `102` and `99` tiles respectively at `4bpp`.
- `67FB` output (`28620` bytes, word mode) looks table/map-like rather than planar tile data.

## Interpretation

1. `67FB` is now decoded and confirmed active at `1E:DA96`.
2. The `1E:DA96` output is a strong map/table candidate (high use of tilemap-style
   word flags, not clean planar-tile alignment).
3. The five `26FB` starts (`DF6C/E039/E73F/E800/EE7F`) are confirmed runtime
   table entries from bank-1 pointer maps.
4. Overlapping starts are therefore a real pattern in this content region.
5. Runtime now confirms active usage for `DF6C/E039/E73F/E800` on the no-input
   attract path.
6. `1E:E91F` is now best treated as a nested invalid marker, not as a still-open
   top-level chunk target:
   - standalone `67FB` decode fails with source exhaustion
   - the marker lies inside the successful `1E:DA96` decode window
   - it also lies inside the successful nested `1E:E800` decode window
7. `1E:9681` is now best treated as a zero-output control/sentinel record, not
   as a content-bearing unresolved chunk.
8. `1E:DA96` and `1E:EE7F` remain unobserved in this no-input runtime window and
   are now the active unresolved queue.
9. Consolidated registry (`make -C tools bank30-registry`) now classifies all
   candidates into:
   - `runtime-confirmed`: `4`
   - `table-confirmed-unseen`: `1` (`P0`: `EE7F`)
   - `67fb-unseen`: `1` (`P1`: `DA96`)
   - `nested-invalid-marker`: `1` (`E91F`)
   - `sentinel-control`: `1` (`9681`)

## Next Actions

1. Probe deterministic savestate-targeted paths to confirm reachability for
   `1E:DA96` and `1E:EE7F`.
   - current `start,b` scripted-input probe does not reach bank30 candidates.
2. Build a validated chunk map for bank `30` using:
   - decode success + consumed spans
   - pointer-table provenance
   - runtime `L001210` hit evidence
3. Tie bank-30 chunk outputs to Mesen design-pack tilemap entries for provenance
   (`frame/layer/tile index` -> `ROM chunk/offset`).


## Compression And Bank30 :: B1F9 Forced-Lane Stall

- Source: `rom_analysis/docs/bank30_b1f9_forced_lane_stall.md`
- Bundle copy: `sources/rom_analysis/docs/bank30_b1f9_forced_lane_stall.md`
- Last updated: `2026-03-28 11:18`
- Note: Why the current headless `B1F9` forcing lane is low-yield for `EE7F`.

---

# Bank30 `B1F9` Forced-Lane Stall

This note closes the current headless `B1F9` forcing lane as a low-yield path
for the active bank30 unresolved queue.

## Inputs

- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/`
- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json`
- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md`
- `bank1.asm`

Generated with:

```sh
python3 tools/build_b1f9_stage_report.py \
  tools/out/l001210_probe_matrix_v14_b1f9_stagetrace \
  tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json \
  --markdown-out tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md
```

## Dynamic Read

- Both forced lanes still enter `01:B1F9` exactly once at frame `1201`:
  - `force_main_9568_with_state_stagetrace`
  - `force_main_95ad_with_state_stagetrace`
- In both lanes, all `L001210` hits still occur before the forced `B1F9`
  entry. Post-entry `L001210` hit count is `0`.
- Internal stage counters also stay flat in both forced lanes:
  - `B226 = 0`
  - `B256 = 0`
  - `B273 = 0`
  - `B59B = 0`
- The forced lanes end on a stable pinned surface through frame `2199`:
  - `active_main = 01:9568` or `01:95AD` depending on lane
  - `state_1D10 = 0x4100`
  - `state_09A8 = 2`
  - `state_0960 = 0`
  - `state_1C86 = 1`

Practical reading: the current headless forcing setup can prove a real
`B1F9` entry, but it does not drive the routine far enough to produce new
decompression evidence after that entry.

## Static Cross-Check

The unresolved `1E:EE7F` path is only reachable in the prologue-side dynamic
index select at `L00B1F9`:

- `L009568` and `L0095AD` both `inc $1CA8` before `jsr L00B1F9`
- `L00B1F9` begins with default helper index `0x0002`
- if `$1C80 < $1CA8`, the routine overrides that with `($1C78 + 0x001F)`
- `L00B226` then feeds that selected value into `L00A9A0`, which is the
  relevant table path for `1E:EE7F` when `$1C78 = 1`

Code anchors in [bank1.asm](/home/nivando-soares/asmdump/bank1.asm):

- caller-side `inc $1CA8` before `jsr L00B1F9`: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L2490), [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L2513)
- dynamic index select and first `L00A9A0/L00A9CB` calls: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L5892)
- later worker/loop surface: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L6248), [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L6286)

The later `L00B6A3 -> L00B6E3` surface is therefore not a second chance to
observe the `EE7F` selector. It is a later worker loop centered on
`$0440/$0442/$0444`, `state_0202`, `01:9D69`, and a wait exit through
`L00B755`.

## Conclusion

- The current forced `01:9568/01:95AD -> 01:B1F9` lane is no longer the best
  headless proving path for `1E:EE7F`.
- It demonstrates entry reachability, but not post-entry decompression
  progress.
- The open unresolved queue remains:
  - `P0`: `1E:EE7F`
  - `P1`: `1E:DA96`

## Next Best Step

- Stop widening the same headless `B1F9` forcing lane unless a new trace
  surface changes the observed boundary.
- Prefer one of these instead:
  - a real menu/live debugger capture that reaches the `EE7F`-relevant prologue
    path organically
  - a different caller family that can touch `DA96` or index `32` without the
    current callback-injection stall


## Attract And Intro :: 00:8029 Handoff

- Source: `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`
- Bundle copy: `sources/rom_analysis/docs/intro_00_8029_next_agent_handoff.md`
- Last updated: `2026-03-28 08:52`
- Note: Active handoff for the later attract continuation lane.

---

# Lane 2 Handoff After Late `00:8029` Ownership Closure

This note is the explicit resume point for the next agent on Lane 2.

## Read First

- `rom_analysis/docs/intro_00_8029_post_1117_window_1118_1125.md`
- `rom_analysis/docs/intro_00_8029_post_1125_reactivation_1164_1172.md`
- `rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- `tools/out/post_1117_compare_1164_1172/summary.md`
- `tools/out/activity_trace_1134_1200/activity_trace.md`
- `tools/out/mode7_blob_cycle_1134_1200/report.md`

## Closed State

- exact late-attract continuity is now closed through `1133`
  - `00:8029/00:835F`
  - `bg1`
  - `61` visible sprites
  - `0` top-crop mismatch
  - `0` base-render mismatch
  - no `DMA` or direct `VRAM/CGRAM` writes in the steady block
- the first later boundary is now fixed at `1164/1165`
  - `1164` changes `state0204` and `dp0054`
  - `1165` begins the producer-side reactivation
  - this is not a callback-family handoff and not a composed-screen regression
- late-cycle ownership is now closed:
  - `01:B6E3 -> 01:9DC6 -> 00:95BD -> $096A/$0700 -> OAMDATA`
- late-cycle blob identity is now closed:
  - direct `VMDATA` bursts and paired `DMA0` bursts match the same ROM blob on
    every sampled burst frame
  - blob family: `AA10`, `AB58`, `ACA0`
  - visible Mode 7 destinations: `0x4920`, `0x49A0`
- the blob-cycle report is now stronger as a schedule surface:
  - it filters strictly to the traced `1134..1200` window
  - it emits transition rows, not only burst rows
  - it now proves `state0204` is not a sufficient blob/`VMADD` selector:
    each sampled `state0204` value (`1/2/3`) reaches all three blob labels and
    both visible `VMADD` targets
- tilemap-to-ROM provenance remains intentionally capped at `1117`
  - no new direct tilemap chunk anchor exists beyond that point

## Do Not Repeat

- do not reopen the `bg1_visible` export/viewer semantics question
- do not spend more time re-proving who owns the late `00:8029` producer cycle
- do not promote provenance beyond `1117` on continuity/carry alone
- do not infer late burst ownership from extracted end-of-frame `vram.bin`
  alone when write traces already exist

## Next Gate

Derive the later-frame selection/schedule rule strongly enough to express the
late `00:8029` producer cycle as a native replacement path.

The open question is no longer "which producer owns this?" It is:

- which later frames pick `AA10`, `AB58`, or `ACA0`
- which later frames target `0x4920` vs `0x49A0`
- how that schedule relates to `dp0054` plus the deeper `01:B6E3`
  phase loop (`$0440/$0442`)
- `state0204` is still useful telemetry, but the refreshed report now rules out
  a simple `state0204 -> blob/VMADD` lookup

## Recommended Next Experiment

1. Start from the existing `1134..1200` report instead of launching a new wide
   Mesen capture immediately.
2. Use the transition rows from the refreshed
   `tools/build_mode7_blob_cycle_report.py` output as the schedule surface:
   - `frame`
   - `state0204`
   - `dp0054`
   - burst/no-burst
   - blob label
   - `VMADD`
3. Push the static read one layer deeper around `01:B6E3`:
   - `$0440/$0442` phase advance
   - the `01:AAB2/01:AAD2` threshold/data tables
   - any downstream read that can explain why the same `state0204` value still
     reaches different blob/`VMADD` pairs
4. Only after a concrete schedule hypothesis, run one bounded verification
   probe on a narrowed burst window.

## Minimal Validation If Tooling Changes

- `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
- `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`

## Checkpoint Trail

- `6cccf8e`: exact continuity extended through `1125`
- `e4eaada`: `1164/1165` producer boundary mapped
- `87e3167`: late `00:8029` blob-cycle ownership closed


## Attract And Intro :: 01:9FE5 Window 986..1093

- Source: `rom_analysis/docs/intro_01_9fe5_window_986_1093.md`
- Bundle copy: `sources/rom_analysis/docs/intro_01_9fe5_window_986_1093.md`
- Last updated: `2026-03-22 10:25`
- Note: Consolidated visual-contract note for the bridge-visible intro block.

---

# Late `01:9FE5` Window Summary (`986..1093`)

This note consolidates the late bridge-visible intro window that previously
lived only as per-frame visual contracts.

Primary artifact:

- `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`

Builder path:

- `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`

## Window Shape

- sampled frames:
  - `986`, `990`, `994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`,
    `1045`, `1053`, `1061`, `1069`, `1077`, `1085`, `1093`
- callback family is flat across the whole sampled window:
  - main callback: `01:9FE5`
  - IRQ callback: `00:835F`
- presentation surface is also flat:
  - `bgMode = 7`
  - main-screen layers: `bg1`

## OBJ Growth

- visible sprite count:
  - `986` -> `0`
  - `990` -> `5`
  - `994` -> `19`
  - `998` -> `32`
  - `1005` -> `53`
  - `1013..1093` -> `61`

Reading:

- the late overlay grows quickly between `986` and `1005`
- by `1013`, the visible OBJ set has reached its stable sampled size

## State Progression

- `$0204` settles back to `1` from `1013` onward after the early `3 -> 2 -> 1 -> 2 -> 3` prelude
- `$0206` stays `0` through `1021`, then rises:
  - `1029` -> `1`
  - `1037` -> `3`
  - `1045` -> `5`
  - `1053` -> `7`
  - `1061` -> `9`
  - `1069` -> `11`
  - `1077..1093` -> `13`
- `$040A` follows the same later stair-step:
  - `1029` -> `6`
  - `1037` -> `8`
  - `1045` -> `10`
  - `1053` -> `12`
  - `1061` -> `14`
  - `1069` -> `16`
  - `1077..1093` -> `17`
- `$0054` wraps and then plateaus:
  - `986` -> `56`
  - `990` -> `88`
  - `994` -> `120`
  - `998` -> `152`
  - `1005` -> `208`
  - `1013` -> `8`
  - `1021` -> `32`
  - `1029` -> `40`
  - `1037` -> `56`
  - `1045` -> `72`
  - `1053` -> `88`
  - `1061` -> `104`
  - `1069` -> `120`
  - `1077..1093` -> `128`

## Producer Domains

- distinct sampled producer domains across the whole window:
  - `oam`
  - `vram`
- sampled OAM-only windows:
  - `1029`
  - `1085`
  - `1093`

Reading:

- late ownership stays inside the same callback family even when the sampled
  `vram` domain disappears
- this means the next open problem after `1093` is not callback-family
  identification
- it is the post-`1093` composition/export change that makes the visible-state
  continuation diverge more sharply

## Next Reading

- use this range summary as the current source of truth for the late
  `01:9FE5` callback family
- continue with:
  - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`
  - that note closes the first post-`1093` read:
    - `main_visible.ppm` is exactly the top `224` lines of `main.ppm`
    - swapping only the visible-scanline `ppu.mode7.matrix[0]/[3]` values
      makes the render mismatch worse, not better


## Attract And Intro :: 01:9FE5 Activity Trace

- Source: `rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`
- Bundle copy: `sources/rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`
- Last updated: `2026-03-22 11:47`
- Note: Producer-side activity narrowing for the post-1093 window.

---

# Active Mesen Behavior Trace: `1094..1117`

This note captures the first lane-oriented "active behavior" read built from
`mesen_probe_boot.lua` trace outputs rather than only from frame dumps and
compare images.

## Goal

Map what the game is actively programming during the post-`1093` late-attract
window:

- `DMA/HDMA`
- direct `VRAM/CGRAM` writes
- `Mode 7` / related PPU register programming
- callback-family ownership at the same frames

This is meant to answer "what is the game doing?" before deciding whether the
next mismatch is:

- renderer behavior
- export/composition choice
- hidden upload activity
- callback-family transition

## Commands

Capture the active trace:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=180 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1094_1117/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1118 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1094 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1117 \
TD2_BOOT_PROBE_TRACE_DMA=1 \
TD2_BOOT_PROBE_TRACE_VRAM=1 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh
```

Build the normalized activity trace:

```sh
python3 tools/build_mesen_activity_trace.py \
  tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md
```

## Artifacts

- `tools/out/activity_trace_1094_1117/td2_boot_probe.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_dma_writes.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_vram_writes.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_mode7_writes.json`
- `tools/out/activity_trace_1094_1117/activity_trace.json`
- `tools/out/activity_trace_1094_1117/activity_trace.md`

## Current Reading

### 1. There are no direct `VRAM/CGRAM` data writes in `1094..1117`

- `td2_boot_probe_vram_writes.json` records `0` writes.
- The normalized activity trace reports:
  - direct write events: `0`
  - direct write kinds: `{}`.

Practical reading:

- this window is not hiding a direct `VMDATAL/VMDATAH` or `CGDATA` upload path
- the next mismatch work should not assume a missed direct `VRAM/CGRAM`
  transfer in this block

### 2. `OAM` DMA remains active through `1113`, then stops

- The activity trace records exactly `20` DMA events across frames
  `1094..1113`.
- Every DMA event is the same:
  - `DMAEN = 0x02`
  - channel `1`
  - target `OAMDATA` (`00:2104`)
  - source `00:0700`
  - size `544` bytes
  - scanline `227`
- Frames `1114..1117` record no DMA event at all.

Practical reading:

- there is a clean late-window boundary at `1114`
- if visual behavior changes after `1113`, it is now reasonable to test that
  boundary against the disappearance of the per-frame OAM upload rather than
  treating `1102..1117` as one uniform block

### 3. The callback-family switch happens at `1102`

- Frame snapshots in `td2_boot_probe.json` show:
  - `1094..1101`: `active_main = 01:9FE5`
  - `1102..1117`: `active_main = 00:8029`
- `active_irq` stays `00:835F` across the whole traced window.

Practical reading:

- the late continuation is not a pure "same callback family keeps going"
- the next follow-up should split the post-`1093` lane at `1102`, not only at
  `1094`

### 4. The main state tuple stays stable across that callback switch

Across `1094..1117`, frame snapshots keep:

- `$0204 = 1`
- `$0206 = 13`
- `$040A = 17`
- `$0054 = 128`

Practical reading:

- the `1101 -> 1102` transition is not explained by the currently sampled
  state tuple alone
- this points back to callback ownership and active upload/programming behavior
  rather than an obvious coarse state change

### 5. `Mode 7` programming narrows after `1101`

The normalized activity trace shows:

- `1094..1101`
  - `4` Mode 7 events per frame
  - scanlines `225`, `226`, `227`, and `231`
  - includes a late `M7A/M7D` pair at scanline `231`
- `1102..1117`
  - `3` Mode 7 events per frame
  - scanlines `225`, `226`, `227` only
  - no `M7A/M7D` event remains
- the remaining repeated register set after `1101` is:
  - `M7HOFS`
  - `M7VOFS`
  - `$210F..$2114`

Practical reading:

- there is a second concrete boundary at `1102`
- the late window after the callback switch is not only "same writes under a
  different callback"; it is a smaller repeated register program

## Summary

The active-trace read narrows the late attract problem substantially:

- `1094..1101`
  - still under `01:9FE5`
  - per-frame `OAM` DMA continues
  - per-frame `M7A/M7D` scanline-`231` update still exists
- `1102..1113`
  - now under `00:8029`
  - per-frame `OAM` DMA still exists
  - the `M7A/M7D` update is gone
- `1114..1117`
  - still under `00:8029`
  - no per-frame `OAM` DMA remains
  - only the smaller repeated `Mode 7` register program continues

This is stronger than the earlier compare-only reading because it shows the
window is not one monolithic "post-`1093` continuation." It has at least two
real active-behavior boundaries:

- `1102`
- `1114`

## Next Best Step

Use those boundaries explicitly in the Lane 2 follow-up:

1. treat `1094..1101`, `1102..1113`, and `1114..1117` as separate compare and
   ownership subwindows
2. test whether the residual mismatch pattern tracks:
   - the `01:9FE5 -> 00:8029` callback switch at `1102`
   - the disappearance of the `00:0700 -> OAMDATA` DMA at `1114`
3. do not spend time searching for hidden direct `VRAM/CGRAM` uploads in this
   window unless a later targeted trace contradicts the current proof


## Attract And Intro :: Mode 7 Blob Cycle 1134..1200

- Source: `rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- Bundle copy: `sources/rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- Last updated: `2026-03-28 08:52`
- Note: Late 00:8029 blob rotation report and selector narrowing.

---

# Late `00:8029` Mode 7 Blob Cycle (`1134..1200`)

This note closes the next ownership question for the late `00:8029` tail:
what exactly owns the producer-side reactivation after the flat `1114..1133`
steady block?

The answer is now stronger than "DMA came back at `1165`":

- the resumed late cycle is still under `00:8029`
- the `VRAM` burst path is the same `1A:AA10 / 1A:AB58 / 1A:ACA0` blob family
  already used by the earlier `build_mode7_source_scene.py` bridge-visible
  model
- the direct `VMDATA` burst and the `DMA0 -> VMDATAL` burst match the same ROM
  blob on every sampled burst frame
- the resumed `OAM` DMA is the normal `$096A -> $0700 -> OAMDATA` path, not a
  separate late special-case uploader

Primary artifacts:

- `tools/out/activity_trace_1134_1200/activity_trace.json`
- `tools/out/activity_trace_1134_1200/activity_trace.md`
- `tools/out/mode7_blob_cycle_1134_1200/report.json`
- `tools/out/mode7_blob_cycle_1134_1200/report.md`

Builder path:

- `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
- `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`

## Runtime Read

The wide `1134..1200` trace now splits into three layers:

- `1134..1163`
  - still the solved flat `00:8029` surface
  - no DMA/direct writes
  - `Mode 7` register loop only
- `1164`
  - still no producer burst
  - but `state0204` and `dp0054` step to `2` / `0x88`
- `1165..1200`
  - `OAM` DMA resumes every frame sampled by the probe
  - `VRAM` burst frames recur under the same callback family

The new blob-cycle report proves the producer-side burst identity precisely:

- the refreshed report now also filters strictly to the traced `1134..1200`
  window and emits per-transition schedule rows instead of only burst rows
- burst frames sampled in this report:
  - `1165, 1170, 1172, 1174, 1175, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1198, 1199, 1200`
- transition rows now make the cadence explicit:
  - isolated early burst probes:
    `1165`, `1170`, `1172`
  - first double-burst pair:
    `1174..1175`
  - first near-continuous burst run:
    `1177..1196`
  - late tail after one idle break:
    `1198..1200`
- on every burst frame:
  - the direct `VMDATAL/VMDATAH` byte stream is a full `0x100`-byte exact
    match for one known ROM blob
  - the `DMA0` source points at the same blob label
  - the direct target alternates between `VMADD = 0x4920` and
    `VMADD = 0x49A0`
- distinct matched blob labels:
  - `AA10`
  - `AB58`
  - `ACA0`

Concrete examples from the report:

- `1165`
  - `state0204 = 2`
  - `dp0054 = 0x88`
  - `VMADD = 0x49A0`
  - direct burst = `AB58`
  - `DMA0` source = `1A:AB58`
- `1170`
  - `state0204 = 3`
  - `dp0054 = 0x90`
  - `VMADD = 0x4920`
  - direct burst = `ACA0`
  - `DMA0` source = `1A:ACA0`
- `1172`
  - `state0204 = 1`
  - `dp0054 = 0x98`
  - `VMADD = 0x49A0`
  - direct burst = `AA10`
  - `DMA0` source = `1A:AA10`

Reading:

- the late `00:8029` reactivation is not just "some VRAM work came back"
- it is the same three-blob Mode 7 producer family already seen earlier in the
  attract path
- the direct-write and DMA views are now reconciled: they are two programming
  paths carrying the same blob identity on the same burst frame
- the schedule read is now also sharper:
  - `state0204` alone is not the blob selector
  - in the sampled burst window, each observed `state0204` value (`1/2/3`)
    reaches all three blob labels (`AA10/AB58/ACA0`) and both `VMADD`
    targets (`0x4920/0x49A0`)
  - the two same-`dp0054` double-burst pairs (`1174/1175`, `1195/1196`) flip
    blob + `VMADD` without advancing `dp0054`, which argues for a deeper
    phase/stage owner than a simple `state0204 -> blob` lookup

## Native-Replacement Link

This blob family is not new to the repo.

The earlier bridge-visible late-attract model already uses
`tools/build_mode7_source_scene.py` plus exact ROM patches from:

- `1A:AA10`
- `1A:AB58`
- `1A:ACA0`

and it applies them directly onto the same visible Mode 7 destinations:

- `0x4920`
- `0x49A0`

Reading:

- the late `1165+` `00:8029` cycle is now tied back to an existing native
  replacement model family, not a newly discovered data source
- the remaining gap is schedule/selection ownership inside this later tail,
  not blob provenance

## Static Ownership Path

The static bank read now explains how the resumed late uploads fit into the
normal producer pipeline.

### 1. `L00B6E3` is the late state machine that re-enters the producer path

At `01:B6E3`, the code:

- advances internal counters via `$0440/$0442`
- checks stage thresholds
- updates `$0444`
- calls `jsl L009DC6` with the current `$0204/$0206` pair

That is the same pair the probe records changing across the late cycle.

### 2. `L009DC6` rebuilds scene/OAM work and finishes by arming OAM DMA

At `01:9DC6`, the routine:

- stores the incoming `X/Y` into `$0204/$0206`
- runs several `jsl L001662` builder calls
- conditionally runs more `L001662` work from `$0444`
- always ends with `jsl L0015BD`

Practical reading:

- the late `state0204` changes are not passive metadata
- they are inputs to the same builder path that repopulates the late scene
  work and then hands control to the standard OAM-DMA arming helper

### 3. `L0015BD` and the bank-0 NMI path explain the resumed `00:0700` DMA

`L0015BD` in bank 0:

- pads the remaining `$0700` OAM staging entries with `0xE100`
- stores `#$01` into `$096A`

The bank-0 NMI path then:

- checks `$096A`
- clears it
- runs `DMA1`
- source `0x0700`
- size `0x0220`
- target `OAMDATA` (`$2104`)

Reading:

- the resumed late `00:0700 -> OAMDATA` transfer is the normal staged OAM DMA
  path already documented earlier
- the `1165+` behavior is therefore owned by the standard builder/NMI handoff,
  not by a separate hidden late uploader

## Practical Reading

- Lane 2 now has a concrete ownership read for the late `00:8029` producer
  cycle:
  - stage loop `01:B6E3`
  - scene builder `01:9DC6`
  - builder helpers `00:9662` / `00:979B`
  - OAM arm helper `00:95BD`
  - NMI consume path via `$096A` and `$0700`
- the `VRAM` burst side is now tied to the same `AA10/AB58/ACA0` family and
  the same `0x4920/0x49A0` Mode 7 destinations already used by the existing
  native bridge-visible model
- the next Lane 2 step is no longer "which producer owns the late cycle?"
- the next step is:
  - derive the later-frame selection/schedule rule strongly enough to express
    the full `00:8029` late producer cycle as a native replacement path, not
    just as individual matched burst frames
  - the stronger immediate static target is now the `$0440/$0442` phase loop
    in `L00B6E3`, because the refreshed transition report now rules out
    `state0204` as a sufficient selector by itself


## Attract And Intro :: Tilemap Provenance 1086..1093

- Source: `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
- Bundle copy: `sources/rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
- Last updated: `2026-03-07 13:14`
- Note: First promoted tilemap-to-ROM provenance window.

---

# Tilemap-to-ROM Provenance

- frame range: `1086..1093`
- row count: `8`
- unmapped rows: `0`

| Frame | Layer | Tile index ranges | CHR base | Candidate ROM chunk | Evidence |
|---:|---|---|---:|---|---|
| `1086` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | nearest-forward-hit@1088 |
| `1087` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | nearest-forward-hit@1088 |
| `1088` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | runtime-hit@1088 |
| `1089` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@1088 |
| `1090` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@1088 |
| `1091` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@1088 |
| `1092` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@1088 |
| `1093` | `bg1` | 0x000-0x003, 0x006, 0x00A-0x012, 0x014-0x017, 0x029, 0x02C-0x030, 0x035-0x037, 0x03D-0x03F, +14 more | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@1088 |


## Attract And Intro :: Mesen Design Workbench

- Source: `rom_analysis/docs/mesen_debugger_design_workbench.md`
- Bundle copy: `sources/rom_analysis/docs/mesen_debugger_design_workbench.md`
- Last updated: `2026-03-21 21:22`
- Note: Design-pack workflow and extraction surface.

---

# Mesen Debugger Design Workbench

This document maps current project tooling to Mesen debugger capabilities
for full visual inspection workflows (tilemaps, tilesets, sprites, palette,
raw VRAM/CGRAM/OAM) and design-team asset handoff.

## What Mesen Already Gives Us

The `tools/mesen_ppu_extract/Program.cs` bridge calls these debugger APIs:

- `GetTilemap` + `GetTilemapSize`
  - Produces layer-composed tilemap renders (`bg1..bg4`, `main`, `sub`)
  - Also emits viewport crops (`*_visible.ppm`) using live scroll state
- `GetTileView`
  - Produces per-layer CHR/tile sheets (`tiles_bg1..tiles_bg4.ppm`)
- `GetSpritePreviewInfo` + `GetSpriteList`
  - Produces sprite screen preview, metadata, and per-sprite preview images
- `GetPaletteInfo`
  - Produces palette metadata + swatch image
- `GetMemoryState`
  - Dumps `vram.bin`, `cgram.bin`, `oam.bin` for custom tools/round-trip
- `GetPpuState` / `GetPpuToolsState`
  - Dumps `state.json` and port-compatible flat `ppu_state.json`

## Current Output Coverage

For each extracted frame folder, the bridge can output:

- Tilemaps/layers:
  - `bg1.ppm`..`bg4.ppm`, `main.ppm`, `sub.ppm`
  - `bg1_visible.ppm`..`sub_visible.ppm`
- Tilesets:
  - `tiles_bg1.ppm`..`tiles_bg4.ppm` plus matching json metadata
- Sprites:
  - `sprites_screen.ppm`, `sprites.json`
  - `sprite_previews/sprite_###.ppm`
- Palette:
  - `palette.ppm`, `palette.json`
- Raw memories and state:
  - `vram.bin`, `cgram.bin`, `oam.bin`
  - `state.json`, `ppu_state.json`

This is enough to support full design-time inspection and redraw workflows.

## New Design Pack Tool

To make extracted frames easier for artists/designers, use:

- `tools/build_mesen_design_pack.py`
- `tools/build_mesen_design_pack_range.py` (batch frame folders)
- `tools/build_mesen_visual_contract.py`
- `tools/build_mesen_visual_contract_range.py`

It repacks a raw frame dump into:

- `layers/`
- `tilemaps/` (decoded per-cell tile index/palette/flip/priority JSON+CSV)
- `tilesets/`
- `sprites/`
- `palette/`
- `raw/`
- `design_pack.json` (single manifest + quick `ppu_summary` + tilemap/sprite analysis refs)

The visual-contract builders sit one layer above that pack and emit a
translation-oriented IR:

- BG stays tilemap-driven:
  - active layer state
  - unique tile ranges
  - CHR byte ranges per layer
  - optional chunk provenance binding from `mesen_range_*_provenance.jsonc`
- OBJ stays OAM-driven:
  - visible sprite list
  - base tile/address ranges
  - palette/priority/size counts
  - heuristic horizontal strip candidates for later metasprite archaeology
- optional producer-side ownership:
  - summarized `VRAM/CGRAM/OAM` write-breakpoint domains from `mesen_probe_boot.lua`
  - top write callsites and active callbacks per domain

The shared headless launcher now normalizes repo-relative output prefixes like
`tools/out/...` to absolute repo paths before invoking `Mesen --testRunner`,
so the probe/contract commands below land in the repo again instead of the
isolated config tree.

## Design Workflow

1. Extract one frame from Mesen:

```sh
make -C tools mesen-ppu-frame MESEN_FRAME=300
```

2. Build a design pack:

```sh
make -C tools mesen-design-pack MESEN_FRAME=300
```

For timeline review packs from a range dump:

```sh
make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/mesen_range_1086_1093_v1
```

3. Inspect from `tools/out/design_frame300/`:

- tilemap composition: `layers/*.ppm`
- viewport composition: `layers/*_visible.ppm`
- raw tilemap entries: `tilemaps/bg*_tilemap.json` or `tilemaps/bg*_tilemap.csv`
- tileset source art: `tilesets/tiles_bg*.ppm`
- sprites and metadata: `sprites/`
  - draw-order aid: `sprites/sprites_visible.json`
- palette: `palette/`
- editable raw memory basis: `raw/vram.bin`, `raw/cgram.bin`, `raw/oam.bin`

4. Build a visual contract when you want a code-translation surface instead of
   raw art inspection:

```sh
python3 tools/build_mesen_visual_contract.py \
  tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 \
  tools/out/visual_contract_7051.json \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc \
  --probe-json tools/out/visual_contract_probe_7051/td2_boot_probe.json
```

For a whole reviewed range:

```sh
python3 tools/build_mesen_visual_contract_range.py \
  tools/out/design_mesen_range_7055_7061_inputfix_v2 \
  tools/out/visual_contract_range_7055_7061 \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc \
  --probe-json tools/out/visual_contract_probe_7055_7061/td2_boot_probe.json \
  --clean-out
```

That emits:

- `*_visual_contract.json` per frame
- `visual_contract_range.json` as a compact index

The important contract boundary is explicit:

- BG/CHR reconstruction comes from tilemaps + tilesets + `VRAM`
- OBJ reconstruction comes from visible sprites + `OAM/CGRAM/PPU`
- producer ownership comes from write-breakpoint traces, not from end-frame
  pixels alone
- translating assembly against visuals should bind BG layers to chunk
  provenance first, then bind OBJ producers through breakpoint/write traces

A current live headless proof artifact for that producer side exists at:

- `tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
- `tools/out/visual_contract_frame300_live_probe_cap2048.json`

That frame-`300` proof is intentionally early and broad: it closes the headless
path itself and proves live `vram/cgram/oam/obj_state` domains. It does not yet
answer the later-scene ownership questions around `986` or `7051`.

## Gap to Close Next

1. Reapply the now-working producer-side `VRAM/CGRAM/OAM` trace path to later
   translation-facing windows (`986`, `7051`, `7055`, `7059`, `7061`) so OBJ
   ownership is tied to the right callsites instead of only early proof frames
   or end-frame state.
2. Add optional round-trip patch manifests (edited tiles/palette back to ROM-space references).
3. Add design-side layer toggles and diff manifests for frame-range review packs.

## Runtime Provenance Bridge

To connect Mesen design-pack frames back to compressed chunk sources:

1. Run dispatcher trace on deterministic no-input playback:

```sh
make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90
```

2. Summarize chunk-source usage:

```sh
make -C tools l001210-trace-summary
```

3. Correlate `tools/out/td2_boot_probe_l001210_summary.json` with design-pack
   tilemaps (`tilemaps/bg*_tilemap.json`) to build:
   - frame/layer/tile-index -> chunk-source provenance
   - runtime-confirmed vs table-confirmed chunk coverage


## Front-End And Menu :: SNES Runtime Algorithm

- Source: `rom_analysis/docs/snes_runtime_algorithm_human.md`
- Bundle copy: `sources/rom_analysis/docs/snes_runtime_algorithm_human.md`
- Last updated: `2026-03-27 22:02`
- Note: Human-readable interpretation of the front-end and handoff corridor.

---

# SNES Runtime Algorithm In Human Terms

This note rewrites the currently proven SNES runtime behavior into plain
language. It is intentionally high-level and only promotes steps that are
already grounded in code reads, probes, or generated artifacts.

## Scope

- focus: front-end selection/materialization path plus the known handoff
  corridor toward gameplay-facing callbacks
- evidence base:
  - `docs/snes_dos_correlation.md`
  - `rom_analysis/docs/progress_checkpoints.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

## Human Algorithm

1. The game keeps a live selector/state block in WRAM around `$1C6A..$1C90`
   instead of one compact DOS-style selector vector.
2. Front-end input mutates that block through small bank-1 helper loops:
   - `$1C6A` drives a separate `3`-option top-level signboard gate
   - `$0202/$1C78` drives the `3`-slot car-facing preview domain
   - `$1C7C` drives the `4`-slot top-level phase domain
   - semantically, the top-level `$1C6A` branches are now closed as:
     `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`,
     `High Score -> L00A3CC`
3. The top-level bank-1 success corridor does not fall straight into a build.
   It first requires the helper chain rooted at `L008B26` to return success.
   If any helper returns `0xFFFF`, bank 1 loops back to an earlier menu point
   instead of building the final working set.
4. Once the selectors are accepted, `L008B87` collapses the live selector
   fields into a smaller derived descriptor:
   - `$1C7E/$1C80` come from the top-level `$1C7C` group tables at `01:8000`
   - `$1C82 = $1CA8 + $1C7E`
   - `L008C10` then expands that into the active bundle fields
     `$1CAC/$1CCA/$1CFA/$1CAA/$1CE2/$1CE4/$1CE6/...`
5. `L008CA2` uses that derived bundle to materialize the actual visual working
   set:
   - `L00A9A0` resolves paged VRAM uploads
   - `L00A9CB` resolves bulk VRAM uploads
   - `L00A9F2` resolves CGRAM/palette uploads
   - `L001210` is the common decompression dispatcher when a source is packed
   - `L0005AC` and `L0006C9` perform the concrete VRAM copy shapes after the
     source is resolved or decompressed
6. The adjacent menu labels do not come from a WRAM text buffer at `$1E80`.
   The helpers build the long ROM pointer `1E:8000` directly and index rows
   from that ROM table.
7. Each `1E:8000` row is a small self-contained descriptor:
   - header
   - object list
   - descriptor-local `4bpp` OBJ blob
   - the object list defines where each glyph sprite is drawn
   - the local blob provides the sprite graphics for that row
8. `L00179B/L001662` interpret those rows and stage the result into the low
   WRAM OAM buffers:
   - `$0700` low table
   - `$0900` high table
   - for negative-layout rows, the blob is staged with a split padded layout
     so the glyph bottoms land on the correct next 16-tile row
9. `L0015BD` finishes the current OAM staging span and arms the usual NMI-side
   upload path. In human terms: bank 1 prepares the next visible sprite list in
   WRAM, and bank 0/NMI is what actually pushes it into PPU OAM.
10. The currently closed `$1C7C` top-level rows now read as:
    - `$1C7C = 0` -> `Desert Blast - Easy`
    - `$1C7C = 1` -> `City Bound - Medium`
    - `$1C7C = 2` -> `East Coast - Hard`
    - `$1C7C = 3` -> `West Coast - Hardest`
11. The nearby front-end row families now split more cleanly than before:
    - rows `8..10` are a rolling-tire helper cycle, not names
    - rows `15..17` are the top-level signboard labels:
      `Game Options`, `Play TDII`, `High Score`
    - rows `0x15..0x1B` are control/sound settings labels
    - the next downstream `$1C70` surface is now structurally closed as a
      `2x2` grid:
      - selector box = `1E:8000` row `0x1D`
      - explicit rear-car cells = `16:8000` row `6`, `18:8000` row `6`,
        `1B:8000` row `6`
      - the bottom-right cell is carried separately by helper `8` on `BG1` as
        a `Select Opponent` stopwatch/clock slot
      - `L008B87` then collapses that same choice into a derived handoff:
        `0..2 -> $1C76 = 1`, `$1C7A = rival index`
        `3 -> $1C76 = 0`, `$1C7A = 0`
    - the per-car bases at `01:9C77` are now better read as OBJ catalogs for
      Porsche 959, Lamborghini Diablo, and Ferrari F40 body/wheel/canopy
      animation pieces
    - a stable car-select frame at `1500` keeps the `Porsche 959` name box and
      info panel even with OAM removed, and the current helper-provenance read
      now lands that lower-screen `BG2` surface on helper bundle `10`
      (`00:B6B2 -> VRAM 0x1000`, `0E:91FE -> VRAM 0x3000`), so the remaining
      gap is the exact text/payload ownership inside that bundle
12. After the front-end bundle is accepted and built, the strongest currently
    proven gameplay-facing corridor is still the bank-1 path that stages
    `02:9016` (main) and `02:8F3C` (NMI) at `01:902D..01:9034`. That corridor
    is real, and no-force timed-input probes now recover the default top-left
    rival path into it organically:
    `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by
    `active_main = 02:9016`. Callback-relative input keyed first to live
    `01:C1D2` and then to `be43+17-22:start` now also recovers the fourth-slot
    no-opponent path into that same downstream corridor:
    `L00C20B -> 01:C1D2 -> L00BE76 -> 01:BE43 -> L008B87 -> 01:902D ->
    01:9111 -> active_main = 02:9016`. The important difference is preserved
    in state, not in this handoff timing: the rival baseline keeps
    `$1C70 = 0`, `$1C76 = 1`, while the no-opponent lane keeps
    `$1C70 = 3`, `$1C76 = 0` at the same downstream timestamps. A direct
    compare over frames `2044..2199` now shows that both paths also keep the
    same callback surface (`02:9016` main, `01:96A0` IRQ, `02:8F3C` NMI) while
    narrowing the remaining post-handoff split to `14` sampled fields. The
    first stable visible split inside the corrected non-black window
    `2048..2088` is now also closed: `bank2.asm` `L0108EF` stages the
    top-strip OAM slot `oam_0730` from `state_11f3` only when `$1C76 != 0`,
    which matches the rival-only red marker seen in the corrected screenshot
    review pack. That means `state_09a2/state_09a8` are no longer the first
    visible split; they are now secondary post-handoff OAM candidates after
    the already-closed top-strip marker.
    A newer Lane 3 constraint now sharpens the interpretation of this whole
    family: the old no-input and early-input power-on corridors were probably
    crossing short attract/demo gameplay slices, not a clean long-form
    player-controlled gameplay state. That is why the same broad
    `02:9016/01:96A0/02:8F3C` family can appear "menu-like" in some archived
    passes and still hold user-verified live Desert Blast gameplay imagery in
    the preserved manual seeds. The callback family is therefore broader than a
    menu-only label; the real separation sits in internal HUD/OAM/substate
    fields.
    Direct headless forcing of `01:9568/01:95AD` still does not promote into
    that same corridor: short-force probes keep `active_main` pinned on
    `01:9568/01:95AD` through frame `2199` with no staged callback writes.

## Short Version

If you strip away the assembly details, the proven logic is:

1. Read and mutate menu selectors in WRAM.
2. Refuse to advance until the helper chain says the current selection state is
   valid.
3. Collapse the accepted selectors into one derived content bundle.
4. Split the downstream opponent/time choice into opponent-enabled vs
   no-opponent derived fields before deeper setup.
5. Build VRAM, CGRAM, and OBJ label content from ROM tables and compressed
   sources.
6. Stage OAM in WRAM and let NMI upload it to the PPU.
7. Continue running the current callback family until the later callback
   promotion rules take over.

## Open Edges

- the actual front-end car-name text surface is still not located
- the exact organic runtime/HUD divergence between the recovered default-rival
  path (`$1C76 = 1`) and the fourth-slot no-opponent path (`$1C76 = 0`) is
  no longer fully opaque: the first stable visible split is the rival-only
  top-strip OAM marker under `state_11f3 -> oam_0730`, but the reported
  rearview blinking lights and the intermittent `09A2/09A8`-side differences
  are still not fully semantically decoded; a full-rate compare now also shows
  that `2051/2083` do not create any extra whole-frame or adjacent-frame
  visible pulse inside `2048..2088`, while a tighter first-frame compare shows
  the first rival-only blink cue is concentrated in top-right bbox
  `(180, 11, 194, 19)` on rival `2048->2049` with no matching change in the
  no-opponent lane; that gives the next trace a much smaller target even
  though the exact state/OAM binding is still open
- the remaining front-end/gameplay bridge problem is no longer late confirm;
  it is assigning meaning and visible ownership to the narrowed post-handoff
  deltas, especially `state_09a2/state_09a8` and the paired DP scratch fields,
  after both paths have already converged to the shared `02:9016/02:8F3C`
  corridor
- late attract producer scheduling after `1133` is materially narrowed, but the
  native replacement schedule is still a live archaeology target


## Front-End And Menu :: Frame 1500 BG2 Provenance

- Source: `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- Bundle copy: `sources/rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- Last updated: `2026-03-26 22:04`
- Note: Car-presentation BG2 ownership without treating it as gameplay.

---

# Bank1 Helper Provenance

- Frame: `1500`
- Layer: `bg2`
- Target probe state: `$0202=1`, `$0204=3`, `$0208=13`, `$020A=40131`, `$0054=136`
- Helper bundle: index `10`

## Layer Read

- `tilemapBaseWords = 0x1000`
- `chrBaseWords = 0x3000`
- visible nonzero bbox: `{'screenTileLeft': 0, 'screenTileTop': 15, 'screenTileRight': 31, 'screenTileBottom': 27, 'screenPixelLeft': 0, 'screenPixelTop': 120, 'screenPixelRight': 255, 'screenPixelBottom': 223}`
- visible tile index span: `1..217`
- visible palette indices: `[0]`

## Runtime Anchor

- last `L00A9A0` hit at/before frame `1500` with matching `$0202/$0208`: frame `1304` -> `00:B6B2`
- last `L00A9CB` hit at/before frame `1500` with matching `$0202/$0208`: frame `1310` -> `0E:91FE`

## Bundle Match

- `L00A9A0` helper `10` stages paged VRAM from `00:B6B2` to `0x1000`
- `L00A9CB` helper `10` stages bulk VRAM from `0E:91FE` to `0x3000`
- tilemap base match: `True`
- CHR base match: `True`

## Reading

- The frame-level BG surface is anchored to the same bank1 helper bundle seen earlier in runtime trace.
- `L00A9A0` explains the live BG tilemap base and `L00A9CB` explains the live BG CHR base.
- If the `26FB` validation on the bulk source fails with an early-end mismatch, treat that as the existing partial-bulk frontier, not as evidence against the helper match.


## Front-End And Menu :: Top Menu Labels

- Source: `tools/out/snes_frontend_top_menu_labels.md`
- Bundle copy: `sources/tools/out/snes_frontend_top_menu_labels.md`
- Last updated: `2026-03-27 10:07`
- Note: Closed rendered label set for the top signboard menu.

---

# SNES Front-End Top Menu Labels

- Claim: the separate top-level `3`-option gate on `$1C6A` uses `1E:8000` rows
  `15..17` as the visible signboard labels.
- Code anchor: `01:BAC3`
- Selector expression: `$1C6A + 0x000F`
- Table base: `1E:8000`

| `$1C6A` | Row | Label | Target | Preview |
| ---: | ---: | --- | --- | --- |
| `0` | `15` | `Game Options` | `1E:B26C` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_15_preview.png` |
| `1` | `16` | `Play TDII` | `1E:B7D4` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_16_preview.png` |
| `2` | `17` | `High Score` | `1E:BC3C` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_17_preview.png` |

## Notes

- This closes the earlier heuristic read of the initial signboard menu with
  direct ROM-side label renders.
- The second label is promoted as `Play TDII` because that is the exact text
  visible in the rendered row preview.
- Composite preview: `tools/out/snes_frontend_top_menu_signboards.png`


## Front-End And Menu :: Rival Selection Grid

- Source: `tools/out/snes_frontend_rival_selection_grid.md`
- Bundle copy: `sources/tools/out/snes_frontend_rival_selection_grid.md`
- Last updated: `2026-03-27 11:57`
- Note: Rendered and structural read of the 2x2 opponent grid.

---

# SNES Front-End Rival Selection Grid

- Claim: `L00C20B` owns a verified downstream `4`-state `2x2` front-end
  surface on `$1C70`, with three OAM car cells plus a separate `BG1`
  stopwatch/clock slot.
- Scope: promote the structural read of the post-car, pre-track selector
  surface without over-promoting the unresolved fourth cell.

## Structure

- Hidden callback: `01:C1D2`
- Selection-box row: `1E:8000` row `0x1D`
- Selector field: `$1C70`
- Domain: `0..3`
- Static call-chain fit: `L008B3E -> L00C20B -> L00BE76`

## Grid Cells

| `$1C70` | Grid role | Highlight XY | Static render | Classification | Preview |
| ---: | --- | --- | --- | --- | --- |
| `0` | top-left | `(85, 109)` | `16:8000` row `6` -> `VRAM 0x3400` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_top_left_bank16_row6.png` |
| `1` | top-right | `(173, 109)` | `18:8000` row `6` -> `VRAM 0x3600` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_top_right_bank18_row6.png` |
| `2` | bottom-left | `(85, 173)` | `1B:8000` row `6` -> `VRAM 0x3000` | `VERIFIED` | `tools/out/snes_frontend_rival_grid_bottom_left_bank1b_row6.png` |
| `3` | bottom-right | `(173, 173)` | helper `8` on `BG1` under `Select Opponent` | `VERIFIED` | `tools/out/snes_frontend_select_opponent_bg1.png` |

## Selection Box

- Row preview: `tools/out/snes_frontend_rival_grid_selection_box_row1d.png`
- Code path:
  - `L00C20B` installs callback `01:C1D2`
  - `01:C1D2` uses `$1C70 * 4` against `01:C1C2..01:C1D0`
  - the callback redraws row `0x1D` from `1E:8000` through `L00179B`

## BG1 Fourth Slot

- Isolated scene: `tools/out/snes_frontend_select_opponent_bg1.png`
- Helper bundle: `8`
- Sources:
  - `L00A9A0` -> `05:E950`
  - `L00A9CB` -> `05:EC0A`
  - `L00A9F2` -> `05:FAD2`
- Visual read:
  - banner text: `Select Opponent`
  - bottom-right quadrant: stopwatch/clock icon
- Summary:
  - `tools/out/snes_frontend_select_opponent_clock_summary.json`

## Notes

- This closes the geometry and visible ownership of all four slots.
- The extra semantic step from “clock icon” to “time-only gameplay branch”
  remains a downstream reading, but the fourth slot itself is no longer open.
- The later handoff split is now explicit in code:
  `L008B87` turns `$1C70 = 3` into `$1C76 = 0` / `$1C7A = 0`, while
  `$1C70 = 0..2` keeps opponent mode enabled and preserves the rival index.


## Front-End And Menu :: Organic Default Path

- Source: `tools/out/snes_select_opponent_organic_default_path.md`
- Bundle copy: `sources/tools/out/snes_select_opponent_organic_default_path.md`
- Last updated: `2026-03-27 12:21`
- Note: Recovered no-force path into the default rival corridor.

---

# SNES Select Opponent Organic Default Path

## Claim Audit

- Claim: No-force timed-input probes now recover the default top-left `Select Opponent` path organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`.
- Classification: VERIFIED
- Evidence:
  - `tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json` reaches:
    - `L00C20B` at frame `1562`
    - first `01:C1D2` at frame `1577`
    - `L00BE76` at frame `1616`
    - `L008B87` at frame `1706`
    - `01:902D` at frame `1857`
    - first `active_main = 02:9016` at frame `2014`
  - `tools/out/select_opponent_clock_path_v2/td2_boot_probe.json` reaches:
    - `L00C20B` at frame `1584`
    - first `01:C1D2` at frame `1599`
    - `L00BE76` at frame `1646`
    - `L008B87` at frame `1736`
    - `01:902D` at frame `1887`
    - first `active_main = 02:9016` at frame `2044`
  - In both runs, `$1C70` stays `0` and `$1C76` flips `0 -> 1` only after `L008B87`.
  - The attempted `right+down` windows still land before the first live `01:C1D2` frame in both runs.
- Notes:
  - This closes organic reachability for the default rival path without active-main forcing.
  - The remaining proving target is not reachability anymore; it is selecting the fourth clock slot inside the live `01:C1D2` window so the `$1C76 = 0` branch can be compared against this baseline.

## Scenario Summary

| Scenario | Input windows | Key frames |
| --- | --- | --- |
| `v1b` | `1200:start;1280:start;1505-1510:start;1560-1565:right,down;1610-1615:start;1700-1705:start` | `1562 c20b`, `1577 c1d2`, `1616 be76`, `1706 b87`, `1857 902d`, `2014 02:9016` |
| `v2` | `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start` | `1584 c20b`, `1599 c1d2`, `1646 be76`, `1736 b87`, `1887 902d`, `2044 02:9016` |

## Next Gate

Inject `right+down` only after `01:C1D2` is already live so `$1C70` can leave
`0` before the same organic corridor falls through `L008B87` and `01:902D`.


## Front-End And Menu :: Select Opponent Mode Split

- Source: `tools/out/snes_frontend_select_opponent_mode_split.md`
- Bundle copy: `sources/tools/out/snes_frontend_select_opponent_mode_split.md`
- Last updated: `2026-03-27 11:57`
- Note: Separates rival slots from the no-opponent stopwatch branch.

---

# SNES Select Opponent Mode Split

### CLAIM AUDIT

- Claim: The fourth `Select Opponent` slot is already a downstream no-opponent
  handoff at `L008B87`, not just a visual clock icon.
- Classification: VERIFIED
- Evidence:
  - `L008B87` loads `X = 1` and `A = $1C70`; only on `$1C70 == 3` it executes
    `dex` and `lda #$0000` before storing `X -> $1C76` and `A -> $1C7A`.
  - For selector values `0..2`, the same path stores `$1C76 = 1` and preserves
    `$1C7A = $1C70`.
  - `$1C7A` later selects rival-facing tables in `bank1.asm:1820-1837`,
    `bank1.asm:1965-1975`, and `bank2.asm:2675-2702`.
  - `$1C76` later gates opponent-side branches in `bank1.asm:2403-2405` and
    `bank2.asm:2943-2958`, `bank2.asm:4118-4129`, `bank2.asm:4671-4682`.
  - The fourth slot is already visually closed as a helper-`8` `BG1`
    stopwatch/clock surface in
    `tools/out/snes_frontend_select_opponent_clock_summary.json`.
- Notes:
  - This closes the immediate semantic split between the three rival-car cells
    and the fourth clock slot at the bank-1 handoff boundary.
  - The stronger runtime reading is now:
    `clock slot -> no-opponent branch verified`.
  - The remaining open edge is narrower:
    exact live gameplay/HUD behavior for that no-opponent branch is still not
    directly captured, so full "time-only" semantics remain `PROBABLE`.

## Downstream Consumers

| Field | Site | Observed effect | Classification |
| --- | --- | --- | --- |
| `$1C7A` | `bank1.asm:1820-1837` | selects `01:8384..01:838A` before CGRAM upload at `0x00A0` | `VERIFIED` |
| `$1C7A` | `bank1.asm:1965-1975` | selects `01:8614 + ($1C7A << 5)` for `VRAM 0x60C0` | `VERIFIED` |
| `$1C7A` | `bank2.asm:2675-2702` | selects `02:8306 / 02:830C` tables into `14DC` and `13FC` | `VERIFIED` |
| `$1C76` | `bank1.asm:2403-2405` | branches to `L00948A` vs `L009568` | `VERIFIED` |
| `$1C76` | `bank2.asm:2943-2958` | gates extra opponent-side init | `VERIFIED` |
| `$1C76` | `bank2.asm:4118-4129` | gates the second actor/path update | `VERIFIED` |
| `$1C76` | `bank2.asm:4671-4682` | gates later opponent-side runtime work | `VERIFIED` |


## Gameplay And Lane 3 :: Lane 3 Work Brief

- Source: `rom_analysis/docs/lane3_today_work_brief.md`
- Bundle copy: `sources/rom_analysis/docs/lane3_today_work_brief.md`
- Last updated: `2026-03-28 08:41`
- Note: Current gameplay archaeology state and human-support queue.

---

# Lane 3 Today Brief

- Date: `2026-03-28`
- Audience: next dev picking up Lane 3 today
- Current source of truth:
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `rom_analysis/docs/lane3_visual_annotation_template.md`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
  - `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`

## Situation

The repo already has preserved manual live-race seeds, and that changed the
Lane 3 problem materially.

What is closed:

- `game_11.mss` is no longer admissible as a gameplay seed
- `lane3_live_race_mid.mss` and `lane3_live_race_plus30f.mss` are preserved
  and user-identified as real Desert Blast gameplay imagery
- a first human support note is now recorded in
  `manual_artifacts/lane3/responses.txt`
- the practical route back to `live_race_mid` is now explicit:
  keep taking the first menu option / keep pressing `A` until gameplay;
  `B` backs out one screen; in gameplay `A` accelerates, `B` reduces speed,
  and the d-pad steers
- the old post-`2050` power-on corridor is now a control surface, not the best
  gameplay anchor
- the first ownership pass is closed on:
  - `state_11f3 -> oam_0730`
  - `state_09a2`
  - `state_09a8`
  - `dp_0053 / dp_0054`
  - `dp_0020 / dp_0022`
- `lane3_live_race_mid` already narrows the visible gameplay stack to
  `BG1 + BG2 + OBJ`
- `slot2_extra` is now explicitly a boundary/control seed, not gameplay;
  the new human response also still describes it as intro/credits

What is still open:

- exact semantics of the narrowed `L01318D` cluster
- a second strong technical replicate for `live_race_plus30f`
- a robust image/export path for the manual seeds
- an equally detailed still-frame note for `live_race_plus30f`; the new human
  response is richest on `live_race_mid`

## Hard Facts To Keep Fixed

- `lane3_live_race_mid.mss`
  - preserved path:
    `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - current absolute frame anchor:
    `ppu.frameCount = 16655`
- `lane3_live_race_plus30f.mss`
  - preserved path:
    `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - current absolute frame anchor:
    `ppu.frameCount = 17495`
- measured absolute delta:
  - `17495 - 16655 = 840`
  - so `plus30f` is now only a historical filename, not a validated `+30f`
    timing claim
- current gameplay-family callback surface for both primary seeds:
  - `main = 02:9016`
  - `irq = 01:96A0`
  - `nmi = 02:8F3C`
- inherited selector block that still survives in those seeds:
  - `$1C6A = 1`
  - `$1C70 = 0`
  - `$1C76 = 1`
  - `$0202 = 0xFFFF`
- current strongest producer cluster:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`

## Priority Order For Today

1. Keep `live_race_mid` as the primary technical seed.
2. Use `live_race_plus30f` as the second visual reference, but do not assume
   it is machine-exportable today.
3. Spend effort on exact producer attribution inside `L01318D` before doing
   broad new sweeps.
4. Use human-visual exports and annotations deliberately; they have been the
   main catalyst on this lane and are still high leverage.
5. Do not reopen `game_11.mss` or `slot2_extra` as gameplay candidates.

## Important Open Questions

1. Which exact member of `L01318D`
   (`02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`) is the real road-line
   builder, and which are support/cursor math?
2. Which owner advances the extra live-race movement in `state_09A2`,
   `state_09A8`, `dp_0053`, and `dp_0054` alongside the `BG2` producer path?
3. Why do visually real gameplay seeds still surface under `02:9016` with the
   inherited selector block?
4. Is the current lab-backend failure on `live_race_plus30f` specific to that
   seed, or is it a general savestate-boundary bug in the backend path?
5. Which visibly distinct gameplay cues are the best anchors for mapping
   `BG1`, `BG2`, `OBJ`, and rival/HUD ownership without relying on broken
   headless screenshots?

## Documentation Requests

If another dev or human collaborator touches Lane 3 today, ask for these docs
back with the artifacts.

Preferred quick-fill template:

- `rom_analysis/docs/lane3_visual_annotation_template.md`

### Technical docs to request

- a short note when any new trace/export is promoted:
  - what exact command ran
  - which seed was used
  - whether frame numbering is absolute or savestate-relative
  - what changed in the reading
- a narrow ownership note whenever one PC in `L01318D` is promoted:
  - what it writes
  - what upstream operands feed it
  - what visible claim it supports
- an explicit failure note for any backend/export failure:
  - exact command
  - exact error text
  - whether artifacts were partially emitted

### Human visual docs to request

- a short Markdown note per export window with:
  - road shape:
    straight / left curve / right curve / crest / tunnel / bridge / rain
  - traffic:
    none / distant / approaching / side-by-side / passing
  - cockpit state:
    wheel straight / left / right
  - HUD state:
    speed/needle movement, radar marker, police/rival cues, blinking lights
  - scenery:
    horizon, desert props, barriers, roadside objects
  - confidence:
    what is certain vs what is guesswork

## Export Queue Worth Doing Today

### E1. Manual screenshot pair for the preserved live-race seeds

Goal:

- give the next dev a real visual sidecar for the preserved technical seeds

Current status:

- `manual_artifacts/lane3/responses.txt` now records a first filled screenshot
  note for `ESTADO 1` / `live_race_mid`
- strongest current read from that note:
  - green NPC car near on the player's right
  - wheel straight
  - straight road with centered yellow divider
  - `Porsche 959` cockpit base
  - active radar marker
- the same response also says `slot2_extra` still looks like intro/credits
- remaining gap:
  - no equally detailed still-frame note is recorded there yet for
    `live_race_plus30f`

Requested output:

- one screenshot for `lane3_live_race_mid.mss`
- one screenshot for `lane3_live_race_plus30f.mss`
- optional third screenshot for `lane3_live_race_slot2_extra.mss` as a
  boundary/control visual contrast

Human annotation prompts:

- where is the green NPC car?
- is the wheel straight or turned?
- is the road straight or curving?
- which parts of the screen feel like cockpit base vs moving road vs dynamic
  objects?
- is there any top-strip/radar/rival cue obviously active?

### E2. Short manual video clip around `live_race_mid`

Goal:

- give motion context the static technical traces do not provide

Current status:

- the new human response already summarizes a short local clip from
  `live_race_mid`
- strongest current motion/scene hooks from that summary:
  - road curves plus elevations/depressions
  - insects hitting the windshield
  - checkpoint/post stop, gas-station dialog, and partial-results screen
  - late police arrival with siren and a third radar marker
- remaining gap:
  - if the clip itself needs to become a promoted artifact later, pair this
    summary with a time-stamped note rather than re-asking for the same human
    read

Requested output:

- `5..10` seconds of footage starting from `lane3_live_race_mid.mss`

Human annotation prompts:

- what visibly moves first:
  road, horizon, traffic, HUD needle, rival marker, wheel?
- does the green car approach in depth, lateral motion, or both?
- is any layer visibly split near the top strip?

### E3. `live_race_mid` producer-side export pack

Goal:

- help the next dev correlate `L01318D` work with visible gameplay claims

Use existing promoted artifacts first:

- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `tools/out/lane3_live_race_mid_layer_stack_summary.json`
- `tools/out/lane3_live_race_mid_layer_stack_summary.md`

If more export work is needed:

- bounded exec/write trace centered on:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`
- keep `01:960D`, `01:96A0`, and `01:9809` in the same run

Human annotation prompts:

- if a trace line is promoted as “road builder”, what concrete visible cue is
  it meant to explain?
- is the cue road pitch, road curvature, horizon split, NPC placement, or HUD?

### E4. `live_race_plus30f` lab-backend retry only if doing tooling work

Goal:

- recover a second technical replicate without relying on broken PNG exports

Current state:

- seed starts at absolute frame `17495`
- current backend fails at boundary correction on both `17495` and `17496`

Only do this if you are explicitly touching backend/tooling today.

### E5. Boundary/control contrast pack

Goal:

- stop future confusion between gameplay seeds and nearby non-gameplay seeds

Use:

- `lane3_live_race_mid.mss`
- `lane3_live_race_slot2_extra.mss`
- old `post9016` control compare artifacts

Human annotation prompts:

- what is visibly missing from `slot2_extra` that is present in `live_race_mid`?
- does `slot2_extra` look like menu, transition, split strip, or attract?
- which visual cue most clearly separates “true live-race feel” from the
  older `00:8029` boundary family?

## Minimal Human Annotation Template

Use this exact structure if someone sends back a note quickly:

```md
# Lane 3 Visual Note

- artifact:
- seed:
- frame/time:
- road shape:
- traffic state:
- cockpit wheel state:
- HUD/radar/rival cue:
- scenery cue:
- strongest moving element:
- strongest static element:
- confidence:
- open doubt:
```

## Recommended Work Split

If two people are working today, split like this:

- Dev A:
  producer attribution inside `L01318D` and related IRQ scheduler ownership
- Dev B:
  export/annotation pipeline and visual sidecars for `live_race_mid` and
  `live_race_plus30f`

That keeps the code-facing and human-facing catalyst lanes moving in parallel
without redoing the same work.


## Gameplay And Lane 3 :: Gameplay Handoff

- Source: `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- Bundle copy: `sources/rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- Last updated: `2026-03-28 15:51`
- Note: Primary gameplay-oriented handoff note.

---

# Lane 3 Handoff After Default-Rival Late `A/B` Narrowing

This note is the explicit resume point for the next agent on Lane 3.

## Read First

- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `rom_analysis/docs/lane3_attract_demo_boundary.md`
- `rom_analysis/docs/lane3_visual_annotation_template.md`
- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
- `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
- `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
- `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- `rom_analysis/maps/tracks/track1_live_race_asset_focus.md`
- `rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
- `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
- `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
- `rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
- `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
- `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- `rom_analysis/docs/lane3_today_work_brief.md`
- `rom_analysis/docs/lane3_visual_annotation_template.md`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `tools/out/lane3_live_race_mid_asset_focus.md`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
- `tools/out/post9016_default_rival_a2050_sequence_compare.md`
- `tools/out/post9016_default_rival_b2050_sequence_compare.md`

## Closed State

- do **not** treat `.mesen-config/Mesen2/SaveStates/game_11.mss` as a verified
  gameplay seed
  - the audit in `tools/out/game11_seed_surface_audit/` closes it as
    `front_end_menu_seed`
  - no-input frames `0..7` stay on:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - the same seed can pass through cockpit-like presentation imagery and still
    fall back into the top-level signboard family
  - a fresh current-seed recheck now also closes the old `90..92` confusion:
    - `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
    - the current savestate fingerprint is now
      `516b217fe396e68d3c7149f13a6b156cd514ca2929172518a0d27654555f853e`,
      not the older `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`
      recorded in `track1_seed_sweep_v3_ab_compare`
    - fresh `target_frame=90/91` scanline reruns no longer reproduce the old
      `v2_current` queue-cursor equalization
    - those reruns stay flat on `00:8029 / 00:835F` with
      `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12` and `0` write hits
- the repo now has a preserved manual live-race seed pair:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
    - source slot: `~/.config/Mesen2/SaveStates/game_1.mss`
    - SHA-256:
      `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
    - source slot: `~/.config/Mesen2/SaveStates/game_3.mss`
    - SHA-256:
      `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
  - preserved extra slot:
    - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
  - slot `#2` is no longer an open backup:
    - bounded follow-up now closes it as an adjacent boundary seed
    - short probe surface:
      `main/irq/nmi = 00:8029 / 00:835F / 00:8029`
    - frame-`0` visible stack:
      `bgMode = 1`, `mainLayers = 0x04`, visible `BG3` only
    - do not use it as a replacement for `live_race_plus30f`
  - user-supplied visual context:
    - `Porsche` cockpit in motion
    - first `Desert Blast` segment
    - approaching a green NPC traffic car
  - follow-up human support note:
    - `manual_artifacts/lane3/responses.txt`
    - practical route back to `live_race_mid`:
      keep taking the first menu option / keep pressing `A` until gameplay
    - menu semantics:
      - `A` advances
      - `B` returns to the previous option screen
    - gameplay essentials:
      - `A` accelerates
      - `B` reduces speed
      - d-pad steers
    - `slot2_extra` is also described there as still intro/credits
  - preserved manual video follow-up:
    - `manual_artifacts/lane3/lane3_live_race_video.avi`
    - `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
    - derived stills under `manual_artifacts/lane3/Screenshots/`
    - current measured metadata:
      - `43.861101s`
      - `256x224`
      - about `60.10 fps`
      - `2636` reported video frames
    - stronger continuity read now preserved in stills:
      - opening `live_race_mid` road / cockpit / radar / green-car surface
      - stop-sign and gas-station/post continuity before the checkpoint pause
      - a late resumed-driving frame with an extra colored radar marker,
        matching the earlier police/third-marker human note
  - gameplay frame bundles now carry two different image families on purpose:
    - raw-state renders:
      `bg1.png`, `bg2.png`, `obj.png`
    - screenshot-derived review surfaces:
      `bg_stack_visible_support.png`, `world_visible_support.png`
  - a new savestate-backed native extraction path is now promoted for exact
    gameplay layer review:
    - command surface:
      `tools/run_mesen_ppu_extract.sh --load-state ... --frame 0 --frame-is-offset`
    - first promoted artifact:
      `tools/out/mesen_lane3_live_race_mid_native/`
    - second promoted artifact:
      `tools/out/mesen_lane3_live_race_plus30f_native/`
    - promoted bundle:
      `tools/out/lane3_live_race_mid_native_bundle/`
    - promoted bundle:
      `tools/out/lane3_live_race_plus30f_native_bundle/`
    - closed read:
      `bg2_visible_native.png` closes the road layer,
      `bg3_visible_native.png` closes the scenery layer,
      `sprites_screen_native.png` closes the dynamic `OBJ` side on both seeds
    - remaining native boundary:
      `main_visible_native.png` and `sub_visible_native` are still fully black
      on both gameplay seeds, so final composed main-screen export is still
      open even though the separable gameplay layers are now available
    - bundle fence:
      `bundle_manifest.json` now carries `nativeVisibleChecks` plus warning
      rows when a promoted native artifact is all black
  - practical rule for later lane-3 review:
    - prefer the savestate-backed native extractor when the target question is
      “what does `BG2` or `BG3` really look like in gameplay?”
    - treat `BG1/BG2/BG3` plus `OBJ` outputs as trusted gameplay review
      surfaces from here forward; this is now ratified by the designer read
      even though composed native `main/sub` export remains fenced
    - treat the new video phase packs as human-facing targeting surfaces only:
      use them to locate `service/post`, `partial-results`, `hard-phase`, and
      `prison-finale` moments, then return to `BG/OBJ` extraction whenever an
      emulator-side path exists
    - use `world_visible_support.png` for human road/background labeling
    - use `bg2.png` for VRAM/PPU-state correlation only
  - reason:
    gameplay `BG2` still depends on per-scanline presentation; even after the
    `16x16` `largeTiles` fix, one flat frame-end `ppu_state.json` is not yet a
    fully faithful visible-world extractor on its own
  - both manual seeds still load onto:
    - `main = 02:9016`
    - `irq = 01:96A0`
    - `nmi = 02:8F3C`
  - both still inherit:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - but the pair is not a duplicate:
    - `state_11f3` stays around `477..479` on `live_race_mid`
    - `state_11f3` stays around `627..629` on `live_race_plus30f`
    - `dp_0053/0054` stay around `120..200` on `live_race_mid`
    - `dp_0053/0054` stay around `40..64` on `live_race_plus30f`
  - current tooling caveat:
    - headless `td2_boot_probe_frame.png` and `mesen_capture.lua` PNG output
      from these seeds is currently zero-byte; trust the JSON/state side first
  - new backend-boundary caveat on `live_race_plus30f`:
    - current absolute start frame is now anchored as `17495`
    - current measured delta from `live_race_mid` (`16655`) is `840`, so the
      filename `plus30f` is historical only
    - current `labRunner` export attempts fail during frame-boundary
      correction on that seed
- the older deterministic power-on candidate is still relevant as the fallback
  comparison corridor:
  - base route:
    `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start`
  - this still lands on the same callback surface through `2048..2208`:
    - `main = 02:9016`
    - `irq = 01:96A0`
    - `nmi = 02:8F3C`
  - inherited selector family also still stays latched:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
- late `A/B` injection into that corridor is now proven to matter:
  - `A` lane:
    - input windows:
      `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:a`
    - first probe divergence:
      - `state_0960`: frame `2050`, `0 -> 128`
    - later probe divergence:
      - `dp_0054`: frame `2052`
      - `dp_0053`: frame `2053`
      - `state_09a8`: frame `2053`
      - `state_137c`: frame `2104`
      - `state_09a2`: frame `2125`
    - first post-input visible divergence against no-input:
      - frame `2052`
      - bbox `[17, 13, 193, 17]`
    - later visible divergence:
      - starts at frame `2054`
      - lower dashboard bbox around `[72..88, 155..174]`
  - `B` lane:
    - input windows:
      `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:b`
    - first probe divergence:
      - `state_0960`: frame `2050`, `0 -> 32768`
    - otherwise almost empty as a state lane
    - visible divergence is sparse:
      - `2052`
      - `2068`
      - `2084`
- practical read:
  - this corridor is no longer “the same frame repeated forever”
  - but it is also not yet a closed gameplay seed by itself
  - the better current read is that older power-on/no-input-style lanes can
    cross short attract/demo gameplay slices while still preserving the same
    inherited selector block
  - that means a missing long gameplay segment after injected input is not
    strong evidence that the lane was "never gameplay"; the input may simply
    have cut a short demo slice before it developed further
- the repo now also has named video phase packs for the still-missing gameplay
  moments the user called out:
  - `rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
  - `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
  - practical read:
    these close the human-facing lookup surface for checkpoint service/post,
    partial-results, later hard phases, snow, and the arrest/prison finale,
    without pretending those longplay/video anchors are already
    `BG/OBJ`-resolved

## Do Not Repeat

- do not reopen `game_11.mss` as if it were a gameplay seed
- do not re-run wide `A/B` sweeps on `game_11.mss` and call the result gameplay
- do not ask for the same manual live-race saves again
  - slots `#1/#3` are already preserved inside `manual_artifacts/lane3/`
- do not ask for or spend more local effort on the archived `90..92`
  queue-cursor equalization against the current `game_11.mss`
  - the fresh current-seed reruns are static and no longer hit the old write
    burst
- do not spend more CPU on full-length parallel `mesen_capture.lua` runs from
  power-on when a `mesen_probe_boot.lua` compare can falsify the same question
  more cheaply
- do not keep assuming that more passive power-on runtime will reveal a long
  uninterrupted gameplay session
  - the stronger current fit is that these corridors can include short
    attract/demo slices that are easy to clip with scripted input
- do not treat frame `2048` as the first useful late-input delta in this lane
  - it is still contaminated by the already-closed top-right rival blink
  - the first useful post-input frame is `2052`
- do not collapse `A` and `B` back into one lane
  - `A` is the rich proving lane
  - `B` is the clean control lane
- do not trust the zero-byte PNG outputs from the first manual-seed audit as
  visual evidence
  - if image export is needed, pivot to the lab backend or fix the screenshot
    path first
- do not keep repeating blind `labRunner` frame guesses on `live_race_plus30f`
  without using the now-known absolute start frame `17495`

## Exact Artifacts To Trust

- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.json`
- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
- `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_a/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_b/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.json`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.json`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
- `tools/out/post9016_default_rival_a2050_sequence_compare.json`
- `tools/out/post9016_default_rival_a2050_sequence_compare.md`
- `tools/out/post9016_default_rival_b2050_sequence_compare.json`
- `tools/out/post9016_default_rival_b2050_sequence_compare.md`
- `tools/out/post9016_default_rival_noinput_frame_02052.png`
- `tools/out/post9016_default_rival_a_frame_02052.png`
- `tools/out/post9016_default_rival_noinput_frame_02056.png`
- `tools/out/post9016_default_rival_a_frame_02056.png`
- `manual_artifacts/lane3/lane3_live_race_mid.mss`
- `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `manual_artifacts/lane3/responses.txt`
- `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- `tools/out/mesen_lane3_live_race_mid_native/state.json`
- `tools/out/mesen_lane3_live_race_plus30f_native/state.json`
- `tools/out/lane3_live_race_mid_native_bundle/bundle_manifest.json`
- `tools/out/lane3_live_race_plus30f_native_bundle/bundle_manifest.json`
- `tools/out/lane3_live_race_mid_native_bundle/native_visible_checks.json`
- `tools/out/lane3_live_race_plus30f_native_bundle/native_visible_checks.json`
- `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_frame03250_bundle/bundle_manifest.json`
- `tools/out/lane3_live_entry_frame03550_bundle/bundle_manifest.json`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- `tools/out/lane3_live_entry_brake_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bundle_manifest.json`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bundle_manifest.json`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
- `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- `rom_analysis/docs/lane3_today_work_brief.md`
- `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`

## Repo Caveat

- the worktree may still be dirty from unrelated work on another host
- do not revert or fold unrelated modified files into the next Lane 3
  checkpoint
- stage only the lane-3 handoff target and its direct artifacts
- keep this handoff current whenever a Lane 3 checkpoint lands; the next agent
  should be able to work immediately from this file plus the linked artifacts

## Next Gate

Use the preserved manual live-race seed pair plus the aligned control compare
to explain which substate fields separate live-race imagery from the older
power-on `02:9016` corridor.

The first separator is no longer open:

- both manual seeds already differ immediately from the aligned control on
  `oam_0730`, `state_11f3`, `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and
  `state_09a2`

The first semantic ownership pass is now also closed:

- `state_11f3 -> oam_0730` is a rival-only HUD/OAM path
- `state_09a2` is an OAM staging cursor / sprite count
- `state_09a8` is a builder-side OAM allocator control value
- `dp_0053/dp_0054` behave as DMA-ring read/write cursors
- `dp_0020/dp_0022` remain useful, but currently look like transient
  builder scratch rather than durable gameplay state

The first visible layer-stack pass is now also narrowed on a real manual seed:

- confirmed `live_race_mid` frame `0` samples as `bgMode = 1`
- visible main-screen stack on that sample is `BG1 + BG2 + OBJ`
- `BG1` stays scroll-stable across sampled visible scanlines
- `BG2` changes per scanline and is now the strongest road/world raster-layer
  candidate
- `BG3` exists in raw state but is not enabled on the visible screen in that
  sample
- code-side fit is now stronger:
  - `01:9111 -> 01:9185 -> 02:9165` is the active gameplay family path
  - `02:9165` runs `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`,
    and `L0108EF` before the OAM flush
  - `bank2.asm` `2628..2644` arms HDMA channel `7` against the `BG2` scroll
    register block, and `bank1.asm` `5846..5851` writes `BG2VOFS` from `$22/$23`
- the same raw helper wrappers still fail on `live_race_plus30f`, but the
  second-seed native visible-layer replicate is now closed through the
  savestate-backed extractor
- the preserved `slot2_extra` is now explicitly **not** that second replicate:
  - it stays on `00:8029 / 00:835F / 00:8029`
  - it is a useful boundary/control seed, not gameplay evidence

The question is now narrower:

- the first producer-side answer is now closed on `live_race_mid`:
  - the confirmed frame repeatedly rewrites `$22/$23`
  - `bank1.asm` `5846..5851` then writes `BG2VOFS` directly from that pair
  - `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24` and `121`
  - `TMAIN` temporarily rises to `0x17` at scanline `23` and returns to
    `0x13` at scanline `121`
  - `BG2HOFS/BG2VOFS` are the only heavily rewritten visible layer registers
    in the bounded PPU trace; `BG1` and `BG3` only move at the split edges
- the strongest current producer cluster is now narrowed:
  - inside `L01318D`, especially `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD /
    02:B134`
- the first static role split inside that cluster is now also closed:
  - `02:B042` loads a per-entry variant word into `$26`
  - `02:B05D`, `02:B0B1`, and `02:B0BD` are setup/math, not the final submit
    points
  - `02:B134` is the strongest current generic submit candidate because it
    lands on `jsr L012BE2.w`
  - a nearby alternate submit path also exists at `02:B101` via
    `jsr L012D5A.w`
- the remaining open questions are now semantic rather than structural:
  - which exact member of that cluster is the road-line builder versus support
    cursor math?
  - which owner advances the extra live-race `09A2/09A8/0053/0054` movement
    alongside that `BG2` producer work?
  - can `live_race_plus30f` be recovered through the lab backend as the second
    visual replicate?

## Live Entry Route

- a new practical gameplay-entry note now exists:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- a new launcher now codifies the current user-guided route:
  - `tools/run_lane3_gameplay_entry.py`
  - fixed menu pulses:
    `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
  - gameplay-relative zero:
    frame `2050`
- use that launcher when the goal is live gameplay probing rather than exact
  still-frame anchoring
- current closed limitation:
  - the first `17000`-frame `menu_a_then_hold_a` run stays in
    `02:9016/01:96A0/02:8F3C` but does **not** recreate the preserved
    `live_race_mid` substate exactly
  - at absolute frame `16655`, it still keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
  - the preserved manual seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
  - the new match-search helper:
    `tools/search_boot_probe_matches.py`
    also confirms that `15000..16999` is only a broad tied plateau rather than
    one special exact window
- practical read:
  - exact `live_race_mid` recreation is now secondary
  - the main gain is that Lane 3 finally has a reusable power-on entry lane
    for gameplay-relative debug/capture work
  - first live-entry follow-up already shows a useful split:
    - current strong probe fields stay identical across
      `a-only`, `a+right`, and `a+left` steering-burst lanes
    - repeated `straight` capture is deterministic
    - after compensating a one-frame phase lead on the `right` capture, the
      first real visual divergence lands around script frame `2402`, about
      `32` frames after the injected `right` window begins at `2370`
    - practical fit:
      steering already matters visually on this lane, but the present probe
      field set is too coarse to expose its owner cleanly
  - first late live-entry phase split is now also promoted:
    - `3250` stays on open-road driving
    - `3550` shows a shattered-windshield collision overlay with
      `Cars Left: 4`
    - both still keep the same top-level callback family:
      `02:9016 / 01:96A0 / 02:8F3C`
    - `BG2` tilemap stats stay identical across the pair while `BG1` and
      `OBJ` shift materially
    - `BG2` scroll operands still move, so the road/world plane stays live
      underneath the later overlay
  - practical next move after this split:
    repeat the same bundle/compare workflow on a checkpoint or police/radar
    pair, not only on the collision transition
  - the first bounded follow-up after that collision pair is now also closed:
    - a steering-heavy `wiggle` attempt still crashes too early to recover a
      checkpoint/post-stop or police/radar phase
    - a bounded braking variant still does not reach checkpoint/post-stop, but
      it does promote a stronger traffic-emergence pair at `3250 -> 3400`
    - on that pair, `BG1/BG2/BG3` and the sampled `BG2` layer state stay
      identical while `OBJ` workload alone rises
    - practical fit:
      this is currently the best live-entry target for traffic-actor labeling
      and OAM-side tracing

## Recommended Next Experiment

1. Start from the preserved manual seeds and the new aligned-control compare,
   not from `game_11.mss`.
2. Keep the known ownership anchors fixed:
   - `bank2.asm` `L0117BA`, `L0108EF`, `L012501`
   - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
3. Treat the remaining open problem as producer attribution, not field naming:
   - `dp_0053/dp_0054` already fit DMA-ring cursor behavior
   - `state_09a2/state_09a8` already fit OAM staging / allocator control
   - `dp_0020/dp_0022` still need path-level attribution
4. Keep the new visible-layer stack result in scope:
   - current confirmed gameplay sample is `BG1 + BG2 + OBJ`
   - `BG2` is the strongest current road/world candidate because its scroll
     changes per scanline
   - `BG3` is not currently proven as a visible gameplay layer
   - `slot2_extra` is now a closed `00:8029` boundary/control seed and should
     not be used as a gameplay replicate
5. Focus on the narrowed `L01318D` cluster first:
   - use the static role split note:
     `rom_analysis/maps/tracks/track1_live_race_l01318d_static_role_split.md`
   - prefer `L012BE2` and the alternate `L012D5A` branch over treating the old
     five-PC list as if every member were an emitter
   - keep the `01:960D / 01:96A0 / 01:9809` split scheduler in scope while
     reading those producers
6. If a second visible replicate becomes necessary, use the lab backend on
   `live_race_plus30f` instead of reusing `slot2_extra`, but treat the current
   boundary-correction failure as an active tooling bug rather than as a
   ready-to-run export path.
7. Treat the new gameplay-entry launcher as the default power-on base when the
   goal is live gameplay probing:
   - use manual seeds for exact still-frame anchoring
   - use `tools/run_lane3_gameplay_entry.py` for gameplay-relative experiments
8. Prefer bounded producer/OAM/HUD tracing over more screenshot volume:
   - the current screenshot path is still broken on the manual seeds
9. Parameterize the live-entry lane upward next instead of pushing harder on
   one exact saved frame:
   - alternate cars
   - alternate tracks
   - opponent vs no-opponent branch
10. Before asking for more human screenshots on the live-entry lane, expand the
   machine-only steering read first:
   - align or compensate the one-frame capture lead automatically
   - widen the probe field set around steering-sensitive windows instead of
     only reusing `state_11f3/oam_0730/09A2/0053/0054`
11. Use the newly promoted late live-entry pair as the event-bucket template:
   - `3250` = road/world still dominant
   - `3550` = collision overlay dominant
   - the next equivalent pair should target checkpoint/post-stop or the later
     police/radar event so lane 3 can compare more than one gameplay phase
12. Use the newly promoted braking-variant pair as the current `OBJ`-side
    template:
   - `3250` = road/signage phase without the red traffic car
   - `3400` = same background stack with the red traffic car introduced
   - because only `OBJ` changes cleanly there, prefer this pair over the
     collision pair when the goal is actor labeling or OAM tracing
13. If another dev is available today, use
   `rom_analysis/docs/lane3_today_work_brief.md` as the working brief rather
   than reconstructing the queue from multiple archaeology notes.
14. If a human needs to re-enter the same gameplay corridor manually, use the
    new route/control note in `manual_artifacts/lane3/responses.txt` instead
    of rediscovering the menu flow from scratch.

## Minimal Validation If Tooling Changes

- `python3 -m py_compile tools/compare_capture_sequences.py`
- `python3 -m py_compile tools/run_lane3_gameplay_entry.py`
- `python3 -m py_compile tools/search_boot_probe_matches.py`
- `python3 -m py_compile tools/build_gameplay_frame_bundle.py`
- `python3 -m py_compile tools/build_gameplay_bundle_compare.py`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_a/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_a_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_a_compare.md --label-a no_input --label-b a_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_b/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_b_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_b_compare.md --label-a no_input --label-b b_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_a2050 tools/out/post9016_default_rival_a2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_a2050_sequence_compare.md --base-label no_input --candidate-label a_hold --script-start-frame 2048`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_b2050 tools/out/post9016_default_rival_b2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_b2050_sequence_compare.md --base-label no_input --candidate-label b_hold --script-start-frame 2048`
- `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json --markdown-out tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md --label-a live_race_mid --label-b live_race_plus30f --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr`
- `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_gameplay_entry_probe_smoke --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --probe-total-frames 2600 --gameplay-input-windows '0-549:a'`

## Checkpoint Trail

- `d13d5d5`: fingerprinted seeded sweep on mutable `game_11.mss`
- `677e863`: audit demotes `game_11.mss` to `front_end_menu_seed`
- `6530de8`: late `A/B` response narrowed on the power-on default-rival corridor


## Gameplay And Lane 3 :: Attract Demo Boundary

- Source: `rom_analysis/docs/lane3_attract_demo_boundary.md`
- Bundle copy: `sources/rom_analysis/docs/lane3_attract_demo_boundary.md`
- Last updated: `2026-03-27 22:02`
- Note: Boundary note explaining why some old seeds were misleading.

---

# Lane 3 Attract/Demo Boundary

This note records the current best explanation for why some older Lane 3
evidence looked like "menu" in one pass and "gameplay" in another.

## Working Read

- the old no-input and early-input Lane 3 corridors should not be treated as a
  clean binary split between front-end and gameplay
- the stronger current fit is that the attract loop can pass through short
  gameplay-like demo slices
- those slices are easy to truncate or skip with scripted input, especially in
  the same power-on runs that were previously used as gameplay-hunting lanes

## Why This Fits Better Now

- `game_11.mss` is still correctly demoted to `front_end_menu_seed`
  - it is not a trustworthy gameplay baseline
  - but that does **not** imply every `02:9016`-based corridor is menu-only
- the preserved manual live-race seeds are user-verified Desert Blast gameplay
  imagery
  - they still load onto `02:9016 / 01:96A0 / 02:8F3C`
  - they already diverge from the old post-`2050` control corridor in stable
    HUD/OAM/substate fields
- the older `b_hold` and related power-on corridors can still show cockpit or
  motion-like surfaces without proving a stable player-controlled gameplay
  session
  - the simplest explanation is that these runs can cross attract/demo
    material, not that they cleanly enter the same long-form state as the
    preserved live-race seeds

## Practical Rule

- do not demand a long uninterrupted gameplay segment from the old no-input or
  early-input power-on corridors
- do not interpret "input prevented the expected gameplay from appearing" as a
  failure by default; it may simply mean the input cut off a short attract/demo
  slice before it matured
- treat those older corridors as mixed front-end/demo evidence unless they are
  corroborated by:
  - preserved manual gameplay seeds
  - a clear code-facing substate separation
  - or a stronger producer-side trace than the old screenshot-hunting passes

## Immediate Implication

- `02:9016` should currently be read as a broader session-family label, not a
  menu-exclusive label
- the live frontier is the meaning of the internal HUD/OAM/substate fields
  within that family, not the existence of a separate gameplay callback family


## Gameplay And Lane 3 :: Live Gameplay Entry Route

- Source: `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- Last updated: `2026-03-28 09:50`
- Note: Promoted power-on route for reproducible gameplay entry.

---

# Track 1 Live Gameplay Entry Route

- Note date: `2026-03-28`
- Goal:
  promote a practical power-on route back into live gameplay so later lane-3
  work can use gameplay-relative inputs instead of depending on one preserved
  manual savestate or one exact absolute frame match

## What Was Added

- entry launcher:
  - `tools/run_lane3_gameplay_entry.py`
- probe-window search helper:
  - `tools/search_boot_probe_matches.py`

## What Was Run

- short menu-route recheck with `A` on menus only:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2600 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_boot_repro_menu_a_short/td2_boot_probe TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=00:C20B,c1d2=01:C1D2,be76=00:BE76,b87=00:8B87,p902d=01:902D,p9111=01:9111,p9016=02:9016' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=64 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=8 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a' ./validation/run_mesen_probe_boot.sh ./game.smc`
- long power-on route with menu `A` pulses plus gameplay-only `A` hold:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=360 TD2_BOOT_PROBE_TOTAL_FRAMES=17000 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe TD2_BOOT_PROBE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-16999:a' ./validation/run_mesen_probe_boot.sh ./game.smc`
- exact aligned compare against the preserved manual gameplay seed:
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.json --markdown-out tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.md --label-a live_race_mid --label-b menu_a_then_hold_a --frame-offset-b -16655 --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- sliding exact-field search over the later live-gameplay corridor:
  - `python3 tools/search_boot_probe_matches.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.json --markdown-out tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.md --label-target live_race_mid --label-search menu_a_then_hold_a --target-start-frame 0 --target-end-frame 11 --search-start-frame 15000 --search-end-frame 16999 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730 --top-k 5`
- launcher smoke validation:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_gameplay_entry_probe_smoke --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --probe-total-frames 2600 --gameplay-input-windows '0-549:a'`

## Promoted Artifacts

- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.json`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.md`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.json`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.md`

## Current Reading

- the user-guided route is now strong enough to promote as a practical
  gameplay-entry surface:
  - `A` pulses on the menu corridor still reopen the shared gameplay family
    from power-on
  - by frame `2044`, the short route is already on:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
- the new launcher makes that route operational instead of implicit:
  - fixed menu-entry windows:
    `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
  - gameplay-relative zero:
    frame `2050`
  - later gameplay input windows can now be expressed relative to that point
    instead of repeating a full absolute boot-time string every run
- the long `menu_a_then_hold_a` run is therefore useful as a reproducible
  live-gameplay lane even though it does **not** clone `live_race_mid`
  exactly:
  - at absolute frame `16655`, it still keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
    - `dp_0053 = 248`
    - `dp_0054 = 248`
    - `dp_0020 = 11`
    - `dp_0022 = 284`
  - the preserved manual `live_race_mid` seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
    - a different moving `dp_0053/0054` / `dp_0020/0022` corridor
- the exact-state mismatch is now best read as a **secondary** problem:
  - the sliding exact-field search over `15000..16999` never improves beyond
    `129/228` exact field slots
  - the strongest matches are broad ties rather than a single special window
  - practical fit:
    this route reaches a real gameplay-family corridor that is stable enough
    for live probing, but it is still shallower than the preserved manual
    `live_race_mid` sample

## Practical Use

- when the goal is live debug or live capture:
  - start from `tools/run_lane3_gameplay_entry.py`
  - treat frame `2050` as gameplay-relative zero
  - express later driving/braking/steering experiments as relative gameplay
    windows
- when the goal is exact visual anchoring against the preserved manual stills:
  - keep using `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - do **not** assume the new power-on route will land on the same absolute
    substate by itself

## First Live Input Follow-Up

- a first live-entry probe matrix now exists locally:
  - `tools/out/lane3_live_entry_matrix_summary.json`
- tested scenarios from the same live-entry route:
  - `0-2149:a`
  - `0-2149:a;320-620:right`
  - `0-2149:a;320-620:left`
- bounded read from that matrix:
  - the current strong probe fields do **not** separate those three runs
  - all three keep the same maxima and first-hit frames for:
    - `state_11f3` (`44 -> 198`, first max at `3348`)
    - `oam_0730` (`4618 -> 4628`, first max at `3320`)
    - `state_09a2` (`18 -> 45`, first max at `3110`)
    - `dp_0053` / `dp_0054` (`0 -> 248`, first max at `2083/2082`)
  - practical fit:
    the currently favored probe fields are still too coarse to register this
    early steering burst as a separate gameplay lane
- a visual follow-up now sharpens that same point:
  - straight-vs-right capture compare:
    `tools/out/lane3_entry_capture_straight_vs_right.md`
  - straight-vs-straight repeat compare:
    `tools/out/lane3_entry_capture_straight_repeat_compare.md`
  - the repeated `straight` lane is screenshot-deterministic
  - the naive `straight` vs `right` compare shows a one-frame phase lead on the
    `right` run
  - after compensating that one-frame lead, the first real visual divergence
    lands around capture index `82`, i.e. script frame `2402`
  - the injected `right` window begins at absolute frame `2370`, so the first
    visible consequence appears about `32` frames later
- current implication:
  - steering already has real visible effect on the live-entry lane
  - but the present Lane 3 probe field set does not yet expose the owner of
    that effect cleanly
  - the next stronger machine-only step is therefore not “ask for a screenshot”
    but widen the live probe/capture field set around steering-sensitive
    windows

## Next Best Step

- treat the new launcher as the default live-debug entry lane for gameplay
  archaeology
- parameterize that lane upward instead of chasing one exact seed:
  - alternate car selection
  - alternate track selection
  - opponent/no-opponent branch
- once those selectors are encoded, use short gameplay-relative probe/capture
  loops to map:
  - live road/world emitters
  - traffic / police / checkpoint behavior
  - track-specific layer and OAM differences
- before asking for more human visual support, expand the machine-visible
  steering lane first:
  - align the one-frame capture lead automatically in tooling or comparison
  - add steering-sensitive probe fields instead of only reusing
    `state_11f3/oam_0730/09A2/0053/0054`


## Gameplay And Lane 3 :: Live Entry Phase Split 3250..3550

- Source: `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- Last updated: `2026-03-28 13:42`
- Note: First promoted late gameplay pair from the live-entry route, with stable artifact bundles for both phases.

---

# Track 1 Live-Entry Phase Split `3250 -> 3550`

- Note date: `2026-03-28`
- Route anchor:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- Goal:
  - promote the first late gameplay pair from the reproducible power-on route
    so lane 3 can compare a still-moving driving frame against a later
    overlay-dominated frame without depending on the preserved manual
    savestate/video alone

## What Was Added

- frame bundle builder:
  - `tools/build_gameplay_frame_bundle.py`
- bundle compare builder:
  - `tools/build_gameplay_bundle_compare.py`

## What Was Run

- late live-entry probe with gameplay-only `A` hold:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_late_probe_v1 --mode probe --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 240 --probe-total-frames 4800 --gameplay-input-windows '0-2750:a'`
- one-frame raw dumps from the same route:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3250 TD2_BG_RANGE_END_FRAME=3250 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3550 TD2_BG_RANGE_END_FRAME=3550 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03550 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
- bundle materialization with screenshot-derived support surfaces for human
  review:
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_frame03250_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03550 --frame 3550 --vram tools/out/lane3_live_entry_frame03550_frame_03550_vram.bin --cgram tools/out/lane3_live_entry_frame03550_frame_03550_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03550_frame_03550_ppu_state.json --oam tools/out/lane3_live_entry_frame03550_frame_03550_oam.bin --screenshot tools/out/lane3_live_entry_frame03550_frame_03550_frame.png --out-dir tools/out/lane3_live_entry_frame03550_bundle`
- bundle compare:
  - `python3 tools/build_gameplay_bundle_compare.py tools/out/lane3_live_entry_frame03250_bundle tools/out/lane3_live_entry_frame03550_bundle tools/out/lane3_live_entry_frame03250_vs_03550_compare.json --markdown-out tools/out/lane3_live_entry_frame03250_vs_03550_compare.md --label-a live_entry_3250 --label-b live_entry_3550`

## Promoted Artifacts

- `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_frame03250_frame_03250_frame.png`
- `tools/out/lane3_live_entry_frame03550_frame_03550_frame.png`
- `tools/out/lane3_live_entry_frame03250_bundle/`
- `tools/out/lane3_live_entry_frame03550_bundle/`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
- `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`

## Artifact Layout

- self-contained review bundle for the still-moving driving phase:
  - `tools/out/lane3_live_entry_frame03250_bundle/`
- self-contained review bundle for the later collision/overlay phase:
  - `tools/out/lane3_live_entry_frame03550_bundle/`
- compact pairwise compare:
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- live-entry probe anchor for the same late run:
  - `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`

Each bundle keeps the same top-level review surface:

- `frame.png`
- `main.png`
- `bg1.png`
- `bg2.png`
- `obj.png`
- `bg_stack_visible_support.png`
- `world_visible_support.png`
- `bg1.ppm`
- `bg2.ppm`
- `obj.ppm`
- `main_render.json`
- `bg1_render.json`
- `bg2_render.json`
- `obj_render.json`
- `raw/`
- `design_pack/`

## Visual Support

Primary wiki/gallery image refs for this pair:

- `tools/out/lane3_live_entry_frame03250_bundle/frame.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_frame03250_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg1.png`
- `tools/out/lane3_live_entry_frame03250_bundle/bg2.png`
- `tools/out/lane3_live_entry_frame03250_bundle/obj.png`
- `tools/out/lane3_live_entry_frame03550_bundle/frame.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_frame03550_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg1.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg2.png`
- `tools/out/lane3_live_entry_frame03550_bundle/obj.png`

## Raster Boundary

- the promoted `BG2` render is now better than the original blank/sky-only
  output because the bundle renderer finally respects `largeTiles = true`
  (`16x16` tile geometry)
- that fix is still not enough to make gameplay `BG2` a faithful human-facing
  extraction on its own:
  the visible road/world plane depends on per-scanline gameplay presentation,
  while the raw bundle still starts from one flat end-frame `ppu_state.json`
- practical rule:
  - use `world_visible_support.png` for human road/background labeling
  - use `bg2.png` for VRAM/PPU-state correlation only

## Current Reading

- the late live-entry route stays inside the same gameplay callback family at
  both frame anchors:
  - `3250`: `main/irq/nmi = 02:9016 / 01:96A0 / 02:8F3C`
  - `3550`: `main/irq/nmi = 02:9016 / 01:96A0 / 02:8F3C`
- the visual surface changes materially even though the top-level callback
  family does not:
  - frame `3250` is still open-road driving
  - frame `3550` shows a shattered-windshield collision overlay with
    `Cars Left: 4`
- the strongest bucket split is now explicit in machine artifacts:
  - `BG2` tilemap stats are identical across the pair:
    `66` unique tiles, `1536` non-zero entries, same top-tile distribution
  - `BG1` changes sharply:
    `458 -> 566` unique tiles and `1350 -> 1732` non-zero entries
  - `OBJ` also changes sharply:
    `31 -> 25` visible sprites while drawn pixels jump `916 -> 1961`
- practical fit:
  - the road/world plane stays live through the transition
  - the later collision/overlay phase loads primarily onto the
    cockpit/HUD/overlay side (`BG1`) plus `OBJ`
  - the screenshot-derived support surfaces are now the correct human-facing
    answer for the road/world side of this pair; the raw `BG2` render remains
    a state-only approximation
  - this means the right next memory targets for this specific transition are
    not the core road emitter fields first, but the overlay/collision-side
    workload that sits on top of the still-live road plane

## Why This Matters

- this is the first promoted late gameplay pair from the reproducible
  power-on route, not from the preserved manual seed
- it proves lane 3 can now do asset-first comparison on live gameplay entry
  itself
- it also gives a better boundary for future archaeology:
  - open-road / steering-heavy moments:
    prefer `BG2` and the `L01318D` road emitter split
  - collision / overlay / life-counter moments:
    prefer `BG1`, `OBJ`, and later OAM-side fields before reopening the road
    path

## Next Best Step

- repeat the same bundle/compare workflow on a checkpoint-oriented or
  police/radar-oriented pair, not only on this collision transition
- compare those future pairs against the preserved manual video stills so the
  route-live lane and the manual-seed lane share one bucket vocabulary


## Gameplay And Lane 3 :: Brake Traffic Pair 3250..3400

- Source: `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- Last updated: `2026-03-28 13:42`
- Note: Bounded live-entry follow-up that isolates traffic emergence as a cleaner OBJ-side event.

---

# Track 1 Live-Entry Brake Traffic Pair `3250 -> 3400`

- Note date: `2026-03-28`
- Goal:
  use one bounded live-entry control variant to push past the earlier
  collision-heavy corridor and promote the first traffic-emergence pair that
  stays useful for both machine tracing and designer labeling

## What Was Run

- bounded live-entry review capture with alternating steering:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_review_wiggle_3600 --mode capture --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 300 --capture-warmup-frames 2050 --capture-frames 3600 --capture-screenshot-every 150 --gameplay-input-windows '0-3599:a;320-520:right;770-970:left;1220-1420:right;1670-1870:left;2120-2320:right;2570-2770:left;3020-3220:right'`
- bounded live-entry review capture with a braking window around the earlier
  crash point:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_review_brake_3600 --mode capture --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 300 --capture-warmup-frames 2050 --capture-frames 3600 --capture-screenshot-every 150 --gameplay-input-windows '0-899:a;900-1350:b;1351-3599:a'`
- review contact sheets:
  - `ffmpeg -y -pattern_type glob -i 'tools/out/lane3_live_entry_review_wiggle_3600/capture_frame_*.png' -vf 'scale=128:112,tile=5x5:padding=4:margin=4:color=white' -frames:v 1 tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
  - `ffmpeg -y -pattern_type glob -i 'tools/out/lane3_live_entry_review_brake_3600/capture_frame_*.png' -vf 'scale=128:112,tile=5x4:padding=4:margin=4:color=white' -frames:v 1 tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
- probe surface for the braking variant:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_brake_probe_v1 --mode probe --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 240 --probe-total-frames 4800 --gameplay-input-windows '0-899:a;900-1350:b;1351-3599:a'`
- exact raw dumps for the promoted pair:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3250 TD2_BG_RANGE_END_FRAME=3250 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-2949:a;2950-3400:b;3401-5649:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_brake_frame03250 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3400 TD2_BG_RANGE_END_FRAME=3400 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-2949:a;2950-3400:b;3401-5649:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_brake_frame03400 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
- bundle materialization with designer-facing `PNG` previews plus
  screenshot-derived world/background support surfaces:
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_brake_traffic_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_brake_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_brake_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_brake_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_brake_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_brake_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_brake_traffic_frame03250_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_brake_traffic_frame03400 --frame 3400 --vram tools/out/lane3_live_entry_brake_frame03400_frame_03400_vram.bin --cgram tools/out/lane3_live_entry_brake_frame03400_frame_03400_cgram.bin --ppu-state tools/out/lane3_live_entry_brake_frame03400_frame_03400_ppu_state.json --oam tools/out/lane3_live_entry_brake_frame03400_frame_03400_oam.bin --screenshot tools/out/lane3_live_entry_brake_frame03400_frame_03400_frame.png --out-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle`
- pairwise compare:
  - `python3 tools/build_gameplay_bundle_compare.py tools/out/lane3_live_entry_brake_traffic_frame03250_bundle tools/out/lane3_live_entry_brake_traffic_frame03400_bundle tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json --markdown-out tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md --label-a brake_3250 --label-b brake_3400`

## Bounded Negative Result

- the bounded `wiggle` attempt still crashes too early to reach a useful
  checkpoint/post-stop or police/radar phase
- the braking variant delays that failure, but it still does **not** recover
  the manual-seed checkpoint/post-stop flow
- practical implication:
  the current live-entry lane still does not have a closed checkpoint/police
  replicate, so the strongest new promoted surface is traffic emergence before
  the later crash

## Promoted Artifacts

- `tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
- `tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
- `tools/out/lane3_live_entry_brake_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`

## Visual Support

Designer-facing anchors for the promoted pair:

- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/frame.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/main.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg1.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg2.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/obj.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/frame.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/main.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg1.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg2.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/obj.png`

## Designer Review Follow-Up

- first designer read:
  - `BG1` cockpit extraction is correct
  - `OBJ` sprites are visually correct
  - the initial packs still did **not** make the road/background readable
- root cause:
  - gameplay `BG2` in this lane uses both `largeTiles = true` and a
    per-scanline presentation surface
  - fixing `16x16` tile geometry improves the raw `BG2` render materially, but
    one flat frame-end `ppu_state.json` still cannot reconstruct the full
    visible road/background stack by itself
- new practical split inside the bundle:
  - `bg2.png` is the corrected static-state `BG2` render for memory/VRAM
    correlation
  - `world_visible_support.png` is the exact screenshot-derived road/world
    surface for human labeling
  - `bg_stack_visible_support.png` is the exact screenshot-derived background
    stack without `OBJ`, useful when designers want the cockpit plus world but
    not the traffic/event layer

## Current Reading

- the braking window creates the first bounded live-entry follow-up that stays
  useful past the earlier collision-heavy corridor:
  - frame `3250` keeps a road/curve/signage surface with no red traffic car
  - frame `3400` introduces a clear red traffic car while preserving the same
    road and cockpit context
- the top-level gameplay family stays unchanged across that pair:
  - `3250`: `02:9016 / 01:96A0 / 02:8F3C`
  - `3400`: `02:9016 / 01:96A0 / 02:8F3C`
- the machine split is sharper than the earlier collision pair:
  - `BG1` tilemap stats are identical
  - `BG2` tilemap stats are identical
  - `BG3` tilemap stats are identical
  - `BG2` layer state is identical
  - only `OBJ` workload shifts materially:
    `37 -> 41` visible sprites and `1138 -> 2117` drawn pixels
- the matched probe rows fit that same read:
  - `state_11f3`: `179 -> 208`
  - `oam_0730`: `4627 -> 4628`
  - `state_09a2`: `43 -> 47`
  - `dp_0053/0054`: `16 -> 224`
  - `dp_0022`: `22 -> 6`
- practical fit:
  - this is currently the cleanest live-entry proof that a visible gameplay
    event can land primarily on the `OBJ` bucket while the road/cockpit
    backgrounds remain stable
  - for designer review, the new screenshot-derived support surfaces now close
    the earlier road/background visibility gap without pretending the raw
    `BG2` render is fully scanline-accurate
  - it is therefore a better designer-labeling and memory-trace target than
    another whole-frame collision compare

## Why This Matters

- lane 3 now has two complementary live-entry event buckets:
  - `3250 -> 3550`: collision/overlay-heavy transition with `BG1 + OBJ` shift
  - `3250 -> 3400` under the braking variant: traffic-emergence transition
    with an `OBJ`-only visible split
- this is the gameplay-side equivalent of the earlier lane-2 asset-first gain:
  designers can now label a concrete actor/event bucket instead of one entire
  screenshot, and tracing can follow that same narrowed bucket in memory/OAM

## Next Best Step

- use the new traffic-emergence pair as the best current target for `OBJ`-side
  gameplay labeling and OAM tracing
- if another bounded live-entry attempt is made, optimize it specifically for
  getting past the `2400`-relative crash boundary toward checkpoint/post-stop,
  not for rediscovering the already-promoted traffic pair again


## Gameplay And Lane 3 :: Gameplay Asset Focus

- Source: `rom_analysis/maps/tracks/track1_live_race_asset_focus.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_asset_focus.md`
- Last updated: `2026-03-28 11:36`
- Note: Asset-first gameplay taxonomy that maps BG/OBJ buckets to tracing targets.

---

# Track 1 Live-Race Asset Focus

- Note date: `2026-03-28`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Goal:
  - promote the same asset-first workflow that accelerated lane 2, but now
    against confirmed gameplay so later lane-3 probes can target the right
    visible owner before widening memory/VRAM tracing

## What Was Added

- gameplay asset report builder:
  - `tools/build_gameplay_asset_report.py`
- repeatable target:
  - `make -C tools lane3-live-race-asset-focus`

## What Was Run

- asset-focus report build from the existing confirmed gameplay artifact set:
  - `make -C tools lane3-live-race-asset-focus`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_asset_focus.json`
- `tools/out/lane3_live_race_mid_asset_focus.md`

## Current Reading

- the lane now has a gameplay-facing asset inventory instead of only separate
  layer, producer, and seed notes
- the confirmed `live_race_mid` split is now practical to work from:
  - `BG1` = cockpit / dashboard / HUD base
  - `BG2` = road / horizon / world raster
  - `OBJ` = traffic, radar markers, and other dynamic actors
  - `BG3` = transient top-strip / split-phase auxiliary layer, not the main
    world plane on this sample
- that asset-first split immediately sharpens what to trace:
  - steering / curvature / road motion:
    `$22/$23`, `dp_0020/0022`, `BG2HOFS/BG2VOFS`, `next_irq_ptr`,
    `01:9185 -> 02:9165 -> 02:B18D`, and the narrowed emitter split
    `02:B134 (L012BE2)` vs `02:B101 -> L012D5A`
  - traffic / police / radar:
    `state_11f3`, `oam_0730`, `state_09a2`, `state_09a8`, `dp_0053/0054`,
    and the later OAM DMA path
  - cockpit / wheel / dashboard stability:
    `BG1HOFS/BG1VOFS` plus frame-to-frame capture compare on the live-entry
    steering lane
- practical implication:
  the next gameplay probes no longer need to ask "what might this field be
  drawing?" in the abstract; they can ask which already-named visible bucket
  changed first

## Separation Rule

- keep this report tied to confirmed gameplay artifacts only
- do **not** reuse front-end car-presentation helpers or attract screenshots
  when classifying gameplay surfaces
- this is the same discipline the wiki now enforces structurally:
  gameplay stays in the gameplay section, front-end/menu material stays in the
  front-end section, and attract material stays separate from both

## Next Best Step

- reuse the same report shape on one later gameplay moment from the preserved
  video or the live-entry lane, especially the checkpoint and police windows
- once the second gameplay moment exists, diff the two reports by asset bucket
  instead of diffing the whole frame blindly


## Gameplay And Lane 3 :: Native Visible Layers

- Source: `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- Last updated: `2026-03-28 14:45`
- Note: Savestate-backed gameplay extraction that now closes native `BG2` road and `BG3` scenery surfaces.

---

# Track 1 Live-Race Native Visible Layers

This note records the promoted gameplay-native layer extraction path from real
live-race savestates instead of a long power-on replay.

## Command Path

Native extraction from the preserved gameplay seeds:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_mid.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_mid_native \
  --frame-timeout-seconds 60

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_plus30f_native \
  --frame-timeout-seconds 60
```

Bundle promotion with both the old state-facing render path and the new native
visible-layer path:

```sh
python3 tools/build_gameplay_frame_bundle.py \
  --label lane3_live_race_mid_native \
  --frame 16655 \
  --vram tools/out/mesen_lane3_live_race_mid_native/vram.bin \
  --cgram tools/out/mesen_lane3_live_race_mid_native/cgram.bin \
  --ppu-state tools/out/mesen_lane3_live_race_mid_native/ppu_state.json \
  --oam tools/out/mesen_lane3_live_race_mid_native/oam.bin \
  --native-frame-dir tools/out/mesen_lane3_live_race_mid_native \
  --out-dir tools/out/lane3_live_race_mid_native_bundle

python3 tools/build_gameplay_frame_bundle.py \
  --label lane3_live_race_plus30f_native \
  --frame 17495 \
  --vram tools/out/mesen_lane3_live_race_plus30f_native/vram.bin \
  --cgram tools/out/mesen_lane3_live_race_plus30f_native/cgram.bin \
  --ppu-state tools/out/mesen_lane3_live_race_plus30f_native/ppu_state.json \
  --oam tools/out/mesen_lane3_live_race_plus30f_native/oam.bin \
  --native-frame-dir tools/out/mesen_lane3_live_race_plus30f_native \
  --out-dir tools/out/lane3_live_race_plus30f_native_bundle
```

## Promoted Artifacts

- Native raw frame dir:
  `tools/out/mesen_lane3_live_race_mid_native/`
- Native raw frame dir:
  `tools/out/mesen_lane3_live_race_plus30f_native/`
- Gameplay bundle with native visible surfaces:
  `tools/out/lane3_live_race_mid_native_bundle/`
- Gameplay bundle with native visible surfaces:
  `tools/out/lane3_live_race_plus30f_native_bundle/`

Key promoted PNGs for review:

- `tools/out/lane3_live_race_mid_native_bundle/bg1_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg1_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/main_visible_native.png`

## Closed Read

- Both preserved gameplay seeds now close the same native layer family:
  `BG2 visible` yields the road/pista surface, `BG3 visible` yields the
  scenery/horizon layer, and `sprites_screen` yields the dynamic `OBJ`
  surface.
- The second-seed replicate is no longer open on the native path:
  `lane3_live_race_plus30f.mss` produces valid `BG1/BG2/BG3/OBJ` outputs just
  like `lane3_live_race_mid.mss`.
- The remaining gameplay-native blocker is now better fenced:
  `main_visible.ppm` and `sub_visible.ppm` are byte-identical all-black
  outputs on both seeds, while the other visible-layer outputs differ
  normally between the two captures.
- Practical reading:
  the open issue is the composed gameplay `main/sub` export on this native
  path, not the existence of separable gameplay layers.

## Practical Rule

- When exact gameplay layer review is needed, prefer the native
  `mesen_ppu_extract` path from a preserved savestate.
- Use `build_gameplay_frame_bundle.py --native-frame-dir ...` to keep those
  native visible layers inside the same review bundle as the old state-facing
  render outputs.
- The bundle now writes `native_visible_checks.json` and mirrors the same
  summary under `bundle_manifest.json`, so fully black native artifacts are
  flagged explicitly instead of being mistaken for valid layer renders.
- Keep the older bundle outputs (`bg1.png`, `bg2.png`, `obj.png`) as technical
  correlation surfaces for `VRAM/CGRAM/PPU state`.
- Keep `main.png` as the current whole-scene renderer-facing fallback when a
  composed review surface is needed.
- Keep `world_visible_support.png` only as a fallback when no native gameplay
  extraction exists for the frame under review.
- Treat `main_visible_native.png` as a known boundary artifact until the
  gameplay-native composed-screen export is explained or replaced.

## Visual Check

Use the artifact panel in the wiki entry for direct image review of these
native PNGs:

- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/main_visible_native.png`

## Next Gate

- Either explain/fix the gameplay-native composed `main/sub` export path, or
  continue gameplay mapping while treating `BG2/BG3/OBJ` as the trusted native
  surfaces and `main_visible_native` as fenced.


## Gameplay And Lane 3 :: Live Entry Bundle Compare

- Source: `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- Bundle copy: `sources/tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- Last updated: `2026-03-28 13:40`
- Note: Generated BG1/BG2/OBJ compare for the first late live-entry gameplay pair.

---

# Gameplay Bundle Compare: `frame_3250` vs `frame_3550`

- `frame_3250` frame: `3250`
- `frame_3550` frame: `3550`
- `frame_3250` screenshot: `tools/out/lane3_live_entry_frame03250_bundle/frame.png`
- `frame_3550` screenshot: `tools/out/lane3_live_entry_frame03550_bundle/frame.png`

## Visual Anchors

- `frame_3250` screenshot-derived background stack support: `tools/out/lane3_live_entry_frame03250_bundle/bg_stack_visible_support.png`
- `frame_3250` screenshot-derived world support: `tools/out/lane3_live_entry_frame03250_bundle/world_visible_support.png`
- `frame_3250` `BG1`: `tools/out/lane3_live_entry_frame03250_bundle/bg1.png`
- `frame_3250` `BG2`: `tools/out/lane3_live_entry_frame03250_bundle/bg2.png`
- `frame_3250` `OBJ`: `tools/out/lane3_live_entry_frame03250_bundle/obj.png`
- `frame_3550` screenshot-derived background stack support: `tools/out/lane3_live_entry_frame03550_bundle/bg_stack_visible_support.png`
- `frame_3550` screenshot-derived world support: `tools/out/lane3_live_entry_frame03550_bundle/world_visible_support.png`
- `frame_3550` `BG1`: `tools/out/lane3_live_entry_frame03550_bundle/bg1.png`
- `frame_3550` `BG2`: `tools/out/lane3_live_entry_frame03550_bundle/bg2.png`
- `frame_3550` `OBJ`: `tools/out/lane3_live_entry_frame03550_bundle/obj.png`

## Current Reading

- BG2 tilemap stats stay unchanged while BG1 changes, so the strongest current fit is that the road/world plane persists and the later overlay loads onto the cockpit/HUD side.
- OBJ workload changes across the pair, so dynamic actor/overlay work contributes materially to the visible transition.
- BG2 scroll operands continue moving across the pair, which keeps the world/road layer live even though the later frame is visually dominated by the crash overlay.

## Key Deltas

| Surface | frame_3250 | frame_3550 | Same? |
|---|---|---|---|
| BG1 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `{'entry_count': 2048, 'unique_tiles': 566, 'non_zero_tiles': 1732, 'top_tiles': [{'tileIndex': 0, 'count': 316}, {'tileIndex': 640, 'count': 242}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}]}` | `False` |
| BG2 tilemap stats | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `True` |
| BG3 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `True` |
| OBJ workload | `{'visible_sprites': 31, 'drawn_pixels': 916}` | `{'visible_sprites': 25, 'drawn_pixels': 1961}` | `False` |
| BG2 layer state | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 213, 'vscroll': 27}` | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 263, 'vscroll': 283}` | `False` |

## Practical Fit

- For gameplay packs, prefer `world_visible_support.png` when the goal is human labeling of road/background content. It is screenshot-derived and preserves the exact visible world even when the raw `BG2` render is only a static-state approximation.
- If `BG2` stats hold while `BG1` and `OBJ` change, the right next memory targets are overlay/collision-side fields before widening the road emitter search again.
- If a future pair flips `BG2` too, that will be the better moment to reopen pure road/world provenance inside `L01318D`.


## Gameplay And Lane 3 :: Traffic Emergence Compare

- Source: `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- Bundle copy: `sources/tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- Last updated: `2026-03-28 13:40`
- Note: Generated compare showing the red traffic car as the current best OBJ-side live-entry event.

---

# Gameplay Bundle Compare: `brake_3250` vs `brake_3400`

- `brake_3250` frame: `3250`
- `brake_3400` frame: `3400`
- `brake_3250` screenshot: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/frame.png`
- `brake_3400` screenshot: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/frame.png`

## Visual Anchors

- `brake_3250` screenshot-derived background stack support: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg_stack_visible_support.png`
- `brake_3250` screenshot-derived world support: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/world_visible_support.png`
- `brake_3250` `BG1`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg1.png`
- `brake_3250` `BG2`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg2.png`
- `brake_3250` `OBJ`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/obj.png`
- `brake_3400` screenshot-derived background stack support: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png`
- `brake_3400` screenshot-derived world support: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/world_visible_support.png`
- `brake_3400` `BG1`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg1.png`
- `brake_3400` `BG2`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg2.png`
- `brake_3400` `OBJ`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/obj.png`

## Current Reading

- BG1/BG2/BG3 tilemap stats stay unchanged while OBJ alone changes, so the strongest current fit is a pure actor/event update over a stable road/cockpit background stack.
- OBJ workload changes across the pair, so dynamic actor/overlay work contributes materially to the visible transition.

## Key Deltas

| Surface | brake_3250 | brake_3400 | Same? |
|---|---|---|---|
| BG1 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `True` |
| BG2 tilemap stats | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `True` |
| BG3 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `True` |
| OBJ workload | `{'visible_sprites': 37, 'drawn_pixels': 1138}` | `{'visible_sprites': 41, 'drawn_pixels': 2117}` | `False` |
| BG2 layer state | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 261, 'vscroll': 283}` | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 261, 'vscroll': 283}` | `True` |

## Practical Fit

- For gameplay packs, prefer `world_visible_support.png` when the goal is human labeling of road/background content. It is screenshot-derived and preserves the exact visible world even when the raw `BG2` render is only a static-state approximation.
- If `BG2` stats hold while `BG1` and `OBJ` change, the right next memory targets are overlay/collision-side fields before widening the road emitter search again.
- If a future pair flips `BG2` too, that will be the better moment to reopen pure road/world provenance inside `L01318D`.


## Gameplay And Lane 3 :: Live-Race Asset Report

- Source: `tools/out/lane3_live_race_mid_asset_focus.md`
- Bundle copy: `sources/tools/out/lane3_live_race_mid_asset_focus.md`
- Last updated: `2026-03-28 11:42`
- Note: Generated gameplay inventory with supporting frame/layer artifact references.

---

# Gameplay Asset Focus Report: `lane3_live_race_mid`

- Note date: `2026-03-28`
- Source seed: `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Frame anchor: `3`
- Goal:
  promote a gameplay-first asset inventory so later lane-3 work can trace steering, traffic, checkpoint, radar, and police behavior against the right visible owner instead of mixing menu/front-end evidence into gameplay

## Supporting Visual Artifacts

- visible frame: `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png`
- isolated `BG1`: `tools/out/lane3_live_race_mid_bg1.ppm`
- isolated `BG2`: `tools/out/lane3_live_race_mid_bg2.ppm`
- isolated `OBJ`: `tools/out/lane3_live_race_mid_obj.ppm`

## Current Reading

- Visible gameplay stack on this sample is BG1 + BG2 + OBJ, not BG1 + BG2 + BG3 + OBJ.
- BG1 stays scroll-stable across sampled visible scanlines and is the current best cockpit/HUD-base candidate.
- BG2 varies per scanline and is the current best road/world raster layer candidate.
- BG3 exists in VRAM state but is not enabled on main or sub screens in this sample.
- The active live-race frame stays inside 02:9016 / 01:96A0 while repeatedly rewriting $22/$23 and then writing BG2VOFS from those operands.
- The next-IRQ pointer flips between 01:960D and 01:96A0 inside the frame, so gameplay uses a two-phase IRQ split rather than a single static visible pass.
- BG2 registers are written across most visible scanlines, while BG1 writes only land at the deeper split and frame edge and BG3 writes cluster around the early top-strip split.
- This supports using the user debugger observation as a guide: BG1 is a strong cockpit-base candidate, BG2 is the strongest road/world raster candidate, and BG3 looks more like a temporary strip/auxiliary layer in this confirmed sample than the full gameplay world layer.
- Caveat kept: Static single-state BG2 rendering falls back to backdrop, which fits a per-scanline/rasterized layer rather than disproving BG2 visibility.

## Layer Inventory

| Surface | Role | Visibility | VRAM anchor | Why this matters | First trace targets |
|---|---|---|---|---|---|
| BG1 | cockpit / dashboard / HUD base | main-screen visible | 0x0000 / 0x3000 | Stable scroll across sampled visible scanlines.; Static render keeps 48026 non-backdrop pixels.; Tilemap uses 458 unique tiles across 2048 entries. | BG1HOFS, BG1VOFS, TMAIN @ scanline 120 |
| BG2 | road / horizon / world raster | main-screen visible | 0x0800 / 0x2000 | Per-scanline scroll changes while staying enabled on the main screen.; BG2VOFS/BG2HOFS receive 246/246 writes.; BG2VOFS touches 123 sampled scanlines across 0..226.; Tilemap is low-variety (66 unique tiles / 4096 entries), which fits a repeating road surface. | $22/$23, BG2HOFS, BG2VOFS, next_irq_ptr, VTIMEL, dp_0020/0022, 01:9185 -> 02:9165, 02:B18D, 02:B134 (L012BE2), 02:B101 -> L012D5A |
| OBJ | traffic / radar markers / dynamic actors / HUD details | main-screen visible | 0x6000 / 0x1000 | OBJ render reports 37 visible sprites and 1665 drawn pixels.; Static OBJ bbox is [38, 18, 234, 175].; Existing lane-3 ownership notes already close rival/radar state into OAM output. | state_11f3, oam_0730, state_09a2, state_09a8, dp_0053/0054, 00:95BD, OAM DMA / OAMDATA |
| BG3 | top-strip / split-phase auxiliary layer | transient only | 0x1800 / 0x5000 | Not enabled on the visible main screen in the base gameplay sample.; Temporarily enabled by TMAIN at scanline 23 before the later split returns to BG1+BG2+OBJ.; Tilemap keeps 177 unique tiles across 2048 entries, which fits a lighter helper surface than the road plane. | TMAIN, BG3HOFS, BG3VOFS, VTIMEL @ scanline 23/24 |

## Behavior Watchlist

| Behavior | Expected visual owner | Watch first | Why |
|---|---|---|---|
| steering / curvature / lane motion | BG2 first, then mixed with OBJ only if traffic overlaps | $22/$23, dp_0020/0022, BG2HOFS/BG2VOFS, next_irq_ptr, 01:9185 -> 02:9165 -> 02:B18D, 02:B134 / 02:B101 | These are the already-proven producer-side operands and emitters behind the raster road surface. |
| traffic / green car / police arrival | OBJ | state_09a2, state_09a8, dp_0053/0054, oam_0730, OAM DMA / OAMDATA | Dynamic actors and late radar/police markers already land in the OAM-side workload. |
| rival radar / top-strip alerts | OBJ with transient BG3/TMAIN support | state_11f3, oam_0730, TMAIN, BG3HOFS/BG3VOFS | The rival marker path is already closed as state_11f3 -> oam_0730, while BG3 only joins briefly at the top split. |
| cockpit / wheel pose / dashboard stability | BG1 base, possibly with small OBJ overlays | BG1HOFS, BG1VOFS, frame-to-frame capture compare | BG1 is the stable full-screen layer in the gameplay sample and is the best current cockpit anchor. |
| checkpoint / STOP sign / post-stop fade | mixed BG2 + OBJ + transient strip control | $22/$23, BG2HOFS/BG2VOFS, state_09a2, state_09a8, dp_0053/0054, TMAIN | The preserved video suggests a mixed surface rather than one pure layer, so the next good move is a later-frame asset report on the same scheme. |

## Separation Rule

- Keep this report tied only to the confirmed live-race seed and its direct gameplay artifacts.
- Do not reuse front-end car-presentation helpers or attract-mode screenshots to classify gameplay surfaces.
- The point of this report is the same one that helped lane 2 move faster: emit concrete visual buckets first, then trace memory/VRAM against those buckets instead of tracing blind.

## Next Best Step

- Re-run this same report shape on at least one later gameplay moment from the preserved video or a live-entry capture, especially checkpoint/police windows.
- Pair the behavior watchlist above with the live-entry route so steering, traffic, and opponent/no-opponent variants can be compared on the same taxonomy.


## Gameplay And Lane 3 :: Manual Seed Intake

- Source: `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- Last updated: `2026-03-28 09:05`
- Note: Human note for preserved live-race savestates and controls.

---

# Track 1 Live-Race Manual Seed Intake

- Intake date: `2026-03-27`
- Source Mesen slots:
  - `~/.config/Mesen2/SaveStates/game_1.mss`
  - `~/.config/Mesen2/SaveStates/game_3.mss`
- Preserved repo copies:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - extra preserved slot:
    `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`

## User-Supplied Visual Context

- both states show the `Porsche` cockpit in motion
- the course is the first `Desert Blast` segment
- the car is approaching a green NPC traffic car
- slot `#1` is the first requested state
- slot `#3` is the second requested state from the same visible sequence

## User-Supplied Navigation And Control Note

- raw follow-up note:
  - `manual_artifacts/lane3/responses.txt`
- practical route back to `live_race_mid`:
  - keep choosing the first option in each menu until gameplay, or keep
    pressing `A`
  - menu semantics:
    - `A` advances
    - `B` returns to the previous option screen
- gameplay essentials:
  - `A` accelerates
  - `B` reduces speed
  - d-pad steers

## Preserved Hashes

- `lane3_live_race_mid.mss`
  - `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
- `lane3_live_race_plus30f.mss`
  - `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
- `lane3_live_race_slot2_extra.mss`
  - `f2ce9ae98cf0a4563e51adcb9ddcaf0a971c3d55a0e904970483e166c754aec8`

## What Was Run

- preservation:
  - copied `game_1.mss`, `game_2.mss`, `game_3.mss` into
    `manual_artifacts/lane3/`
- short seeded probes:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=12 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_plus30f_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=12 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- bounded compare:
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json --markdown-out tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md --label-a live_race_mid --label-b live_race_plus30f --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr`
- slot-`#2` boundary recheck:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- negative screenshot-path check:
  - short `mesen_capture.lua` reruns from both seeds (`8` frames, no input)
  - both capture directories were created, but all emitted PNG files were
    zero-byte files

## Artifacts

- `manual_artifacts/lane3/lane3_live_race_mid.mss`
- `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `manual_artifacts/lane3/responses.txt`
- `manual_artifacts/lane3/lane3_live_race_video.avi`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_contact_sheet.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0600_curve.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1200_open_road.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1500_stop_sign.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame2500_late_radar.png`
- `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
- `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`

## Current Reading

- both primary manual states still load onto the same callback surface used by
  the already-known post-`02:9016` corridor:
  - `active_main = 02:9016`
  - `active_irq = 01:96A0`
  - `active_nmi = 02:8F3C`
- both also still inherit the old selector family at frame `0`:
  - `$1C6A = 1`
  - `$1C70 = 0`
  - `$1C76 = 1`
  - `$0202 = 0xFFFF`
- despite sharing that callback/selector surface, the pair is not a duplicate:
  - stable all-frame differences over frames `0..11`:
    - `dp_0053`
    - `dp_0054`
    - `state_09a2`
    - `state_11f3`
  - strongest stable split:
    - `live_race_mid`: `state_11f3 = 477..479`,
      `dp_0053/0054 = 120..200`
    - `live_race_plus30f`: `state_11f3 = 627..629`,
      `dp_0053/0054 = 40..64`
  - intermittent split:
    - `state_09a8` differs on `4/12` frames
    - `state_0960` differs only on frame `0` (`128 -> 0`)
- both seeds are internally dynamic even without new input:
  - `live_race_mid` cycles through multiple `dp_0053/0054`, `state_09a2`,
    `state_09a8`, and `state_11f3` values inside the `12`-frame window
  - `live_race_plus30f` also advances `dp_0053/0054`, `dp_0020/0022`,
    `state_09a2`, `state_09a8`, and `state_11f3`
- practical implication:
  - the repo now has preserved manual seeds that the user identifies as live
    Desert Blast gameplay imagery
  - but the code-facing state still resembles the same `02:9016` family that
    earlier looked menu-derived or front-end-bound in older no-input corridors
  - the newer fit is that those older corridors likely crossed short
    attract/demo gameplay slices and were over-interpreted as a clean
    menu-vs-gameplay boundary
  - the real lane-3 question is now sharper: why can visually live-race seeds
    still present as `02:9016` with the inherited selector block?
- the preserved slot `#2` is no longer usefully "unclassified":
  - its direct recheck now keeps `main/irq/nmi = 00:8029 / 00:835F / 00:8029`
  - its frame-`0` visible stack is `BG3`-only, not `BG1 + BG2 + OBJ`
  - practical read:
    `lane3_live_race_slot2_extra.mss` is an adjacent boundary seed, not a
    substitute for the primary live-race pair

## Human Follow-Up Read (`2026-03-28`)

- the raw response note now gives a first filled visual read for
  `ESTADO 1` / `live_race_mid`:
  - the green NPC traffic car is near, with its rear visible on the player's
    right
  - the wheel still reads as straight
  - the road is straight with the yellow divider centered
  - the cockpit base still reads as `Porsche 959`
  - the human layer guess keeps the road/world surface on `layer2`
  - dynamic objects called out explicitly:
    roadside vegetation, the green traffic car, and the speed / RPM / gear
    indicators
  - a radar/rival marker is visibly active
  - the first motion is easiest to notice in the white lane stripes plus the
    lateral roadside/dynamic objects
- the same response note also confirms that `slot2_extra` still looks like
  intro/credits, which matches the current boundary/control reading
- the short local clip summarized in that same response extends
  `live_race_mid` from the preserved start state to the checkpoint/post stop:
  - gas-station dialog appears there, followed by the player's partial-results
    screen and then the next checkpoint start
  - the clip also highlights curves, elevations/depressions in the road,
    insects hitting the windshield, and a late police arrival with siren plus
    a third radar marker

## Video Intake Follow-Up (`2026-03-28`)

- the preserved local clip is now ingested as a first-class artifact in:
  - `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
- measured video metadata:
  - `43.861101s`
  - `256x224`
  - about `60.10 fps`
  - `2636` reported video frames
- extracted stills now preserve the key visual milestones directly:
  - opening live-race frame with the green traffic car on the player's right
  - a later curved-road frame
  - a later open-road frame
  - the checkpoint `STOP` sign
  - a late resumed-driving frame with an extra colored radar marker
- practical gain over the raw response note:
  - the checkpoint/post sequence is no longer text-only
  - the black transition frames around the stop/post sequence are now
    documented as part of the clip continuity rather than a missing-capture
    ambiguity
  - the late extra radar marker is now a preserved still target for later
    HUD/OAM correlation

## Negative Result

- the current headless screenshot path is not reliable on these manual seeds:
  - `td2_boot_probe_frame.png` was emitted as a zero-byte file on both runs
  - `mesen_capture.lua` also emitted zero-byte `capture_frame_*.png` files
- do not spend time interpreting those PNGs; use the JSON/state side first or
  pivot to the lab backend if actual image export becomes necessary

## Next Best Step

- treat `lane3_live_race_mid.mss` and `lane3_live_race_plus30f.mss` as the new
  active Lane 3 seed pair
- do not substitute `lane3_live_race_slot2_extra.mss` for the missing second
  visual replicate; it is now a closed boundary/control seed
- compare their producer-side/OAM/HUD state against the older power-on
  `02:9016` corridor
- specifically trace what `state_11f3`, `dp_0053`, `dp_0054`, `state_09a2`,
  and `state_09a8` mean in these visually live-race seeds


## Gameplay And Lane 3 :: Manual Video Intake

- Source: `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
- Last updated: `2026-03-28 09:05`
- Note: Video-backed still capture summary for the live-race lane.

---

# Track 1 Live-Race Manual Video Intake

- Intake date: `2026-03-28`
- Source artifact:
  - `manual_artifacts/lane3/lane3_live_race_video.avi`
- Supporting note:
  - `manual_artifacts/lane3/responses.txt`

## Video Metadata

- container: `AVI`
- duration: `43.861101s`
- raster: `256x224`
- video stream: `cscd`
- audio stream: `pcm_s16le`, stereo, `48000 Hz`
- nominal frame rate: about `60.10 fps`
- reported video frame count: `2636`

## Derived Review Frames

- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_contact_sheet.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0600_curve.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1200_open_road.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1500_stop_sign.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame2500_late_radar.png`

These stills were extracted from the preserved AVI because no separate manual
PNG screenshots were present in `manual_artifacts/lane3/Screenshots/` at
intake time.

## What Was Run

- metadata probe:
  - `ffprobe -v error -show_entries format=duration,size:stream=codec_name,width,height,r_frame_rate,nb_frames -of default=noprint_wrappers=1 manual_artifacts/lane3/lane3_live_race_video.avi`
- sparse still extraction:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "select='eq(n,0)+eq(n,600)+eq(n,1200)+eq(n,1800)+eq(n,2400)',setpts=N/FRAME_RATE/TB" -fps_mode vfr manual_artifacts/lane3/Screenshots/lane3_live_race_video_%03d.png`
- tail still extraction:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "select='eq(n,1500)+eq(n,2100)+eq(n,2500)+eq(n,2620)',setpts=N/FRAME_RATE/TB" -fps_mode vfr manual_artifacts/lane3/Screenshots/lane3_live_race_video_tail_%03d.png`
- contact sheet:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "fps=1/5,scale=256:224,tile=3x2" -frames:v 1 manual_artifacts/lane3/Screenshots/lane3_live_race_video_contact_sheet.png`

## Video Read

- the clip is a real continuity proof from `live_race_mid`, not only a single
  still-frame annotation
- the early run matches the prior human note:
  - `Porsche 959` cockpit base
  - active radar strip at the top
  - straight opening road with centered yellow divider
  - green traffic car near the player's right on the opening frame
- the open-road stills and contact sheet add stronger world-shape evidence:
  - left/right bends are visible
  - the road surface shows crest/depression style changes
  - roadside vegetation and mountain silhouettes stay on the moving world side,
    not the stable cockpit/HUD base
- the checkpoint/post sequence is now visually preserved, not text-only:
  - a visible `STOP` sign appears before the service area
  - the contact sheet shows the gas-station/post exterior from the same run
  - black intermediate frames between that stop and the later driving segment
    fit a transition/fade and should not be read as failed extraction
- the late resumed driving segment preserves a stronger radar event:
  - the opening frame already has the normal active marker
  - the later frame now shows an extra colored top-strip marker compared with
    the opening stills
  - that fits the user's note that police arrive late with a third radar
    marker and siren

## Practical Reading

- Lane 3 now has a preserved human-visual continuity artifact, not only manual
  prose, for this seed family
- the strongest direct gain is for later HUD/radar archaeology:
  - stop-sign/checkpoint progression is now a stable visual milestone
  - the late extra radar marker is preserved in a local still, so future work
    can compare it against `state_11f3`, `oam_0730`, and the narrowed
    `L01318D` producer cluster without depending on memory alone


## Gameplay And Lane 3 :: Service / Partial Screens

- Source: `rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_service_status_screens.md`
- Last updated: `2026-03-28 15:29`
- Note: Named still pack for the checkpoint service/post corridor, partial-results screen, and restart back into driving.

---

# Track 1 Live-Race Service / Partial-Results Screens

- Intake date: `2026-03-28`
- Source video:
  - `manual_artifacts/lane3/lane3_live_race_video.avi`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/lane3_service_status_phase_pack/`

## Key Artifacts

- `tools/out/lane3_service_status_phase_pack/anchor_sheet.png`
- `tools/out/lane3_service_status_phase_pack/02_gas_station_exterior_anchor.png`
- `tools/out/lane3_service_status_phase_pack/03_attendant_dialog_anchor.png`
- `tools/out/lane3_service_status_phase_pack/04_partial_results_anchor.png`
- `tools/out/lane3_service_status_phase_pack/05_next_checkpoint_restart_anchor.png`
- `tools/out/lane3_service_status_phase_pack/manifest.json`

## What Was Run

- `python3 -m py_compile tools/build_video_phase_pack.py`
- `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the previously unseen checkpoint/post corridor from the preserved local
  `live_race_mid` continuity clip is now promoted as stable named stills
- the live gameplay-to-service boundary is no longer only implied by the older
  `STOP` sign still:
  - `24.960s`: checkpoint `STOP` sign
  - `31.500s`: gas-station exterior without the car fully in frame
  - `31.750s`: attendant/dialog still with the car and station worker in view
  - `34.000s`: player's partial-results screen
  - `41.000s`: next checkpoint restart back in cockpit driving
- the local AVI keeps the service/post corridor compact:
  - the station exterior and the attendant/dialog still are only a short
    fraction of a second apart
  - the results screen then persists much longer than either service still
- practical reading:
  - lane 3 now has preserved visual anchors for the user's human note about
    frentista dialog plus parciais
  - these are human-facing phase anchors, not replacements for the trusted
    `BG1/BG2/BG3/OBJ` gameplay surfaces

## Why This Matters

- later gameplay capture can now target the service/post corridor by name
  instead of searching the manual clip again
- the next agent can aim emulator-side `BG/OBJ` extraction at these same named
  moments rather than treating the checkpoint sequence as one vague block

## Next Best Step

- treat this pack as the visual boundary for the service/post sequence
- when a reproducible live capture reaches this corridor, bind:
  - service/post presentation to the trusted `BG` surfaces
  - any dynamic actor or message-strip changes to `OBJ` and the existing
    gameplay-side watchlist


## Gameplay And Lane 3 :: Hard-Phase Anchors

- Source: `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
- Last updated: `2026-03-28 15:29`
- Note: Longplay-backed visual anchors for night, bridge, mountain-wall, tunnel, and rain.

---

# Track 1 Longplay Hard-Phase Anchors

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_hard_phase_anchor_pack/`

## Key Artifacts

- `tools/out/longplay_hard_phase_anchor_pack/anchor_sheet.png`
- `tools/out/longplay_hard_phase_anchor_pack/01_night_start_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/02_bridge_crossing_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/03_mountain_wall_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/04_tunnel_run_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/05_rain_segment_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/manifest.json`

## What Was Run

- `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the later hard-phase corridor now has preserved local visual anchors instead
  of only roadmap timestamps
- promoted anchors from the local longplay:
  - `24:13` (`1453s`): first clean night-driving still after the earlier
    transition/result boundary around the roadmap's `24:11`
  - `30:32` (`1832s`): bridge crossing with purple water, mountain horizon,
    and traffic on the right lane
  - `33:24` (`2004s`): mountain-wall / no-right-shoulder corridor chosen as a
    clearer representative still than the roadmap's rougher `33:40` anchor,
    which falls very close to tunnel entry in this recording
  - `34:18` (`2058s`): tunnel driving
  - `45:18` (`2718s`): rain segment with windshield droplets and traffic ahead
- the difficult later phases now expose concrete visual targets that were
  missing from the gameplay pack family:
  - dark/night palette shift
  - bridge/water/mountain horizon stack
  - mountain-wall/no-shoulder road geometry
  - tunnel enclosure
  - rain-on-windshield presentation

## Boundary

- these anchors come from a local longplay recording, not from the trusted
  savestate-backed `BG1/BG2/BG3/OBJ` extraction path
- use them as visual targeting surfaces for later emulator/native capture, not
  as proof of exact runtime ownership by themselves

## Next Best Step

- use these anchors to drive later hard-phase-specific capture requests or live
  reproduction attempts
- once any of these phases is reachable in a reproducible emulator path, keep
  the later analysis on the ratified `BG` plus `OBJ` surfaces instead of
  collapsing back to whole-frame-only review


## Gameplay And Lane 3 :: Snow Anchors

- Source: `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
- Last updated: `2026-03-28 15:51`
- Note: Longplay-backed snow-driving anchors starting at the one-hour mark.

---

# Track 1 Longplay Snow Anchors

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_snow_phase_pack/`

## Key Artifacts

- `tools/out/longplay_snow_phase_pack/anchor_sheet.png`
- `tools/out/longplay_snow_phase_pack/01_snow_onset_anchor.png`
- `tools/out/longplay_snow_phase_pack/02_snow_mountain_curve_anchor.png`
- `tools/out/longplay_snow_phase_pack/03_snow_log_truck_anchor.png`
- `tools/out/longplay_snow_phase_pack/manifest.json`

## What Was Run

- targeted user-guided scan:
  - `ffmpeg -y -loglevel error -ss 3600 -t 80 -i the_duel_longplay.mp4 -vf "fps=1,scale=320:180,tile=4x5" -frames:v 1 tools/out/tmp_snow_scan/longplay_6000_6080_detail_sheet.png`
  - `ffmpeg -y -loglevel error -ss 3570 -t 240 -i the_duel_longplay.mp4 -vf "fps=1/10,scale=240:135,tile=4x6" -frames:v 1 tools/out/tmp_snow_scan/longplay_5950_6350_snow_sheet.png`
- promoted builder run:
  - `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the user hint was correct:
  snow begins at the one-hour mark of the local longplay
- promoted snow anchors:
  - `01:00:00` (`3600s`): first clear snow onset
  - `01:02:20` (`3740s`): snowy mountain curve with visible flakes and a
    stronger mountain horizon
  - `01:03:20` (`3800s`): later snowy corridor with a log truck ahead
- practical reading:
  - lane 3 no longer lacks preserved snow-specific gameplay frames
  - the snow corridor is now a named visual surface rather than a vague
    “maybe East/West Coast later” hypothesis

## Boundary

- this pack is still a longplay-derived visual anchor, not a trusted
  `BG1/BG2/BG3/OBJ` capture
- use it to aim later emulator-side snow capture, not to replace that work

## Next Best Step

- use this pack plus the earlier hard-phase pack to choose the first snow-capable
  emulator-side route worth reproducing
- once a live or savestate path reaches snow, keep the follow-up on `BG/OBJ`
  ownership instead of whole-frame-only review


## Gameplay And Lane 3 :: Prison Finale Anchor

- Source: `rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_longplay_prison_finale_anchor.md`
- Last updated: `2026-03-28 15:29`
- Note: Longplay-backed arrest/prison ending pack and high-score handoff.

---

# Track 1 Longplay Prison Finale Anchor

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_prison_finale_phase_pack/`

## Key Artifacts

- `tools/out/longplay_prison_finale_phase_pack/anchor_sheet.png`
- `tools/out/longplay_prison_finale_phase_pack/01_arrest_prelude_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/02_license_revoked_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/03_high_score_followthrough_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/manifest.json`

## What Was Run

- `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the user-requested final prison outcome screen is now preserved as a stable
  local artifact instead of only an end-of-longplay assumption
- promoted finale anchors from the local longplay:
  - `01:26:16` (`5176s`): arrest prelude message strip
  - `01:26:20` (`5180s`): clearest `license revoked` / prison still
  - `01:26:22` (`5182s`): direct handoff into the high-score panel
- practical reading:
  - this recording does not return from the prison still into more gameplay
  - it goes straight from the arrest/prison outcome into the score screen

## Why This Matters

- lane 3 now has the full requested visual boundary for the end-state outcome
  corridor:
  - in-race checkpoint service/post sequence
  - partial-results screen
  - final prison outcome
- future capture or runtime-mimetization work can target this finale by name
  instead of re-scanning the longplay ending manually

## Next Best Step

- keep this finale pack as the human-facing reference for the arrest/prison
  corridor
- if a later emulator/live-debug route reaches the same outcome, compare it
  against this pack while keeping `BG/OBJ` extraction as the trusted ownership
  surface


## Gameplay And Lane 3 :: Visible Layer Stack

- Source: `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- Last updated: `2026-03-27 22:59`
- Note: Layer composition read for a real gameplay seed.

---

# Track 1 Live-Race Visible Layer Stack

- Note date: `2026-03-27`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Guide hypothesis used for this pass:
  - the user-observed layer debugger read suggested a cockpit base plus a
    world/road layer and OAM-driven dynamic objects
  - this note treats that as a guide, not as prior truth

## What Was Run

- raw dump from the working manual live-race seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_bg0_silent.log 2>&1`
- scanline/PPU sample from the same seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_scanline0.log 2>&1`
- local derived analysis from that raw dump:
  - a temporary design pack built from the dumped `vram/cgram/oam/ppu_state`
  - temporary isolated renders for `BG1`, `BG2`, and `OBJ`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_layer_stack_summary.json`
- `tools/out/lane3_live_race_mid_layer_stack_summary.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`

## Current Reading

- the visible gameplay stack on the confirmed live-race `mid` sample is now
  materially narrower than the older heuristic:
  - `bgMode = 1`
  - `mainLayers = 0x13`
  - visible main-screen stack = `BG1 + BG2 + OBJ`
  - `subLayers = 0`
- `BG3` still exists in the raw `PPU/VRAM` state, but it is not enabled on the
  main or sub screen in this sample
- the scanline read gives the strongest current split between the two visible
  BG layers:
  - `BG1` stays scroll-stable across the sampled visible scanlines
  - `BG2` changes per scanline, including the wrapped `945/946` horizontal edge
    and the descending/wrapped vertical sequence
- practical fit to the user's observation:
  - `BG1` is now the strongest cockpit/HUD-base candidate
  - `BG2` is now the strongest road/world raster layer candidate
  - `OBJ` remains the strongest bucket for dynamic world/HUD actors
- code-side fit is now also stronger:
  - `bank1.asm` `L009075..L009111` arms the
    `02:9016 / 01:96A0 / 02:8F3C` family
  - `bank1.asm` `L009185` then enters `bank2.asm` `L011165`, which runs
    `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`, and `L0108EF`
    before the OAM flush
  - `bank2.asm` `2628..2644` arms HDMA channel `7` against destination
    register base `0x0F`, i.e. the `BG2` scroll register block, while
    `bank1.asm` `5846..5851` also writes `BG2VOFS` from `$22/$23`
  - practical read:
    the confirmed live-race sample already fits a rasterized road/world layer
    on `BG2` much better than a cockpit layer
- caveat:
  - the static single-state `BG2` render collapses to backdrop color on this
    sample; that does not disprove `BG2` visibility, because the scanline data
    shows `BG2` depends on per-line state that a single end-frame render does
    not reconstruct

## Negative Follow-Up Kept

- the same raw-dump helper wrappers were retried against
  `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- both returned exit code `255` under the headless helper path and produced no
  raw dump artifacts
- that failure is informative and should stay documented rather than silently
  dropped

## Boundary Recheck On Slot `#2`

- the preserved extra slot is now no longer just "unclassified backup":
  - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
- bounded recheck:
  - raw dump:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
  - scanline sample:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
  - short probe + compare:
    `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
    `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- observed result:
  - slot `#2` does **not** reproduce the `live_race_mid` surface
  - its frame-`0` raw dump reads:
    - `bgMode = 1`
    - `mainLayers = 0x04`
    - visible stack = `BG3` only
  - its sampled scanlines stay flat on:
    - `BG1 h/v = 0 / 1023`
    - `BG2 h/v = 0 / 1023`
    - `BG3 h/v = 0 / 1023`
  - its short probe also stays on the older front-end/boundary callback
    family:
    - `main = 00:8029`
    - `irq = 00:835F`
    - `nmi = 00:8029`
  - the compare against `live_race_mid` differs on all `8/8` frames in the
    callback surface, selector surface, and live-race workload fields such as
    `state_09a2`, `state_11f3`, `dp_0053`, `dp_0054`, and `oam_0730`
- practical read:
  - slot `#2` is an adjacent boundary seed, not a second gameplay replicate
  - this strengthens the rule of using the user's layer observation as a guide
    only: it helps on the confirmed live-race sample, but not every nearby
    preserved savestate is gameplay

## Next Best Step

- keep this note as the visible-stack baseline and use
  `track1_live_race_bg2_producer_path.md` for the producer-side follow-up
- do not use `slot2_extra` as the second-seed replication target; it is now a
  closed boundary seed
- if second-seed replication still matters, recover it from `live_race_plus30f`
  through a different export path such as the lab backend
- the next open edge is now semantic, not structural:
  map exactly what the `01:9809` loop and the `L01318D`
  `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134` cluster each contribute
  to the visible `BG2` motion


## Gameplay And Lane 3 :: BG2 Producer Path

- Source: `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- Last updated: `2026-03-27 22:58`
- Note: Producer-side narrowing for the gameplay road/world path.

---

# Track 1 Live-Race `BG2` Producer Path

- Note date: `2026-03-27`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Guide hypothesis used for this pass:
  - the user-observed layer debugger read remained the guide
  - this note still treats that observation as a working hypothesis, not as
    promoted truth by itself

## What Was Run

- bounded exec/write trace on the confirmed live-race seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=16 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_exec_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='main_9111=01:9111,cb_9185=01:9185,cb_9165=02:9165,road_12f48=02:AF48,road_1318d=02:B18D,road_1340e=02:B40E,road_13927=02:B927,road_108ef=02:88EF,road_1070a=02:870A,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='dp22=00:0022,dp23=00:0023,hdma_1e14=7E:1E14,hdma_1e15=7E:1E15,hdma_1e16=7E:1E16,hdma_1e2a=7E:1E2A,split_1e1c=7E:1E1C,split_1e1d=7E:1E1D,split_1e1e=7E:1E1E,split_1e1f=7E:1E1F,next_irq_ptr=00:003E,next_irq_bank=00:0040' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_exec_trace.log 2>&1`
- bounded PPU-register trace on the same seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=32 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_ppu_reg_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='cb_9185=01:9185,cb_9165=02:9165,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='bg1hofs=00:210D,bg1vofs=00:210E,bg2hofs=00:210F,bg2vofs=00:2110,bg3hofs=00:2111,bg3vofs=00:2112,tmain=00:212C,tsub=00:212D,hdmaen=00:420C,vtime=00:4209' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_ppu_reg_trace.log 2>&1`
- static ownership reads for the traced PCs:
  - `nl -ba bank1.asm | sed -n '2688,2820p'`
  - `nl -ba bank1.asm | sed -n '5838,5860p'`
  - `nl -ba bank2.asm | sed -n '6026,6150p'`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`

## Observed Runtime Path

- the confirmed live-race frame stays inside the shared gameplay family while
  still showing internal movement:
  - `active_main = 02:9016`
  - `active_irq = 01:96A0`
- the bounded exec trace now closes the first producer-side call chain:
  - `01:9185`
  - `02:9165`
  - `02:B18D`
  - `02:870A`
  - `02:88EF`
  - later `01:960D`
  - practical fit:
    `01:9185 -> 02:9165` is real on the confirmed gameplay seed, and the
    frame then enters the same bank-2 work cluster already suspected from the
    earlier static read
- the same trace also closes the immediate operand surface behind visible
  `BG2` motion:
  - `dp22` write hits: `26`
  - `dp23` write hits: `26`
  - `next_irq_ptr` write hits: `2`
  - unique `next_irq_ptr` retargets:
    - scanline `24`: `01:9808` writes low byte `0x0D`, i.e. next IRQ
      `01:960D`
    - scanline `121`: `01:969F` writes low byte `0xA0`, i.e. next IRQ
      `01:96A0`
- code-side fit is now explicit rather than heuristic:
  - `bank1.asm` `5846..5851` writes `BG2VOFS` directly from `$22/$23`
  - practical read:
    the repeated `$22/$23` writes are the immediate producer-side operands
    feeding live `BG2` vertical motion on this seed

## Visible Split Shape

- the PPU-register trace makes the split pattern much sharper:
  - `BG2HOFS` hits under the cap: `246`
  - `BG2VOFS` hits under the cap: `246`
  - `BG1HOFS/BG1VOFS` hits: `4 / 4`
  - `BG3HOFS/BG3VOFS` hits: `4 / 4`
  - `TMAIN` hits: `2`
  - dropped write hits after the probe cap: `20`
- the unique control points are high-signal:
  - scanline `23`: `01:96A7` writes `TMAIN = 0x17`
    (`BG1 + BG2 + BG3 + OBJ`)
  - scanline `121`: `01:965A` writes `TMAIN = 0x13`
    (`BG1 + BG2 + OBJ`)
  - `BG3HOFS/BG3VOFS` writes cluster around scanlines `23/24`
  - `BG1HOFS/BG1VOFS` writes cluster around scanline `120`
  - `BG2VOFS` receives unique writes on `123` scanlines under the cap, with a
    sampled span from scanline `0` through `226`
- practical read:
  - `BG2` is the only visible gameplay layer being reprogrammed heavily across
    the frame
  - `BG1` looks like a much more stable base layer
  - `BG3` behaves more like an early split-strip/auxiliary layer than the main
    gameplay world layer on this confirmed sample

## Static Fit On The Traced PCs

- the traced IRQ retarget points line up directly with the split scheduler in
  `bank1.asm`:
  - `2692..2706` choose `VTIMEL` and schedule `01:9809` or `01:960D`
  - `2713..2739` program the `BG3`/window branch and then schedule the next
    IRQ
  - `2750..2754` write `BG1HOFS/BG1VOFS`
- the traced bank-2 `BG2` operand writes now narrow the most promising
  producer cluster inside `L01318D`:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`
- those sites all sit in the same `L01318D` corridor that prepares `$22/$24`
  and calls `L012BE2`, `L012CA8`, `L012D5A`, or `L00179B`
- the earlier `02:A33F / 02:A495 / 02:A7FB` hits still matter, but they now
  read better as supporting cursor/search math than as the whole road builder

## Current Reading

- the user debugger observation is now stronger as a guide on the confirmed
  `live_race_mid` sample:
  - `BG1` is the strongest cockpit-base candidate
  - `BG2` is the strongest road/world raster candidate
  - `OBJ` remains the dynamic actor/HUD bucket
- the new runtime result also narrows `BG3` further:
  - it is still present and can be enabled transiently
  - but on this confirmed gameplay sample it behaves like a split-controlled
    strip/auxiliary layer, not like the full scrolling world plane
- the loop shape is now clearer:
  - main callback family builds producer-side operands and OAM/HUD work
  - the IRQ pair `01:96A0 / 01:960D` retimes visible-layer composition inside
    that same frame
  - the gameplay-visible road motion does not require a different top-level
    callback from `02:9016`; it already exists inside that family

## Remaining Limits

- the PPU-register trace hit the configured write cap and dropped `20` writes
  - that is still enough to close the split shape, but not enough to claim an
    exact full-frame register-write count
- `lane3_live_race_plus30f.mss` still does not have a clean headless raw-dump
  replicate through the current helper path

## Next Best Step

- map the semantic role of the `01:9809` `BG2` write loop and the
  `L01318D` cluster `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
- keep using the user debugger observation as a guide, but only promote claims
  that survive the runtime/code cross-check
- if a second visual replicate is still required, pivot to the lab backend on
  `lane3_live_race_plus30f.mss` instead of reusing `slot2_extra`


## Gameplay And Lane 3 :: L01318D Role Split

- Source: `rom_analysis/maps/tracks/track1_live_race_l01318d_static_role_split.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_live_race_l01318d_static_role_split.md`
- Last updated: `2026-03-28 09:15`
- Note: Static role split for the narrowed gameplay cluster.

---

# Track 1 Live-Race `L01318D` Static Role Split

- Note date: `2026-03-28`
- Primary code surface:
  - `bank2.asm` `L012F48 .. L01318D`
- Current gameplay seed context:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`

## What Was Read

- loop/caller context:
  - `nl -ba bank2.asm | sed -n '2148,2255p'`
  - `nl -ba bank2.asm | sed -n '5877,6168p'`
  - `nl -ba bank2.asm | sed -n '6168,6279p'`
- existing ownership notes:
  - `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
  - `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- small address walk used to pin the previously named PCs inside the loop:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`

## Loop Shape

- `L01114F` and `L011165` both call the same late gameplay block in order:
  - `L012F48`
  - `L01318D`
  - `L01070A`
  - `L0108EF`
  - OAM flush helper
- practical reading:
  - `L01318D` is not the already-closed rival-marker path
  - it sits earlier in the same frame build and prepares/emits the moving
    gameplay workload that later shares the frame with the closed
    `state_11f3 -> oam_0730` HUD marker path

## Static Role Split Inside `L01318D`

- `02:B042`
  - falls on `lda $12F4.w,X`
  - role:
    loads a per-entry attribute/variant word into `$26`
  - reading:
    operand selection, not sprite emission by itself

- `02:B05D`
  - falls on `adc $1CB2.w`
  - role:
    part of the low-index branch that converts the local selector into the
    final `$22` screen/object position before `jsr L012BE2`
  - reading:
    coordinate/phase assembly, not the final submit point

- `02:B0B1`
  - falls on an `asl A`
  - role:
    part of the high-index branch's `5 * value` style expansion on `$22`
    after subtracting `8` and optionally setting `$24 = 0x4000`
  - reading:
    position/tile-base math, not the final submit point

- `02:B0BD`
  - falls on `lda #$1D80.w`
  - role:
    loads the shared source-bank base into `$11/$10` immediately before the
    generic emitter call
  - reading:
    setup for submission, not the emission itself

- `02:B134`
  - falls on `jsr L012BE2.w`
  - role:
    the generic submit point on the default branch after `$26`, `$24`, `$22`,
    and the `1D80:8000` source base are prepared
  - reading:
    strongest current candidate for the actual road-line/object emission site
    among the previously named PCs

## Important Companion Branch

- one nearby site is at least as important as the five named PCs:
  - `02:B101` -> `jsr L012D5A.w`
- branch condition:
  - active only when the `1CEA` test takes the special path and `$BA != 0`
- reading:
  - the narrowed cluster is not one emitter
  - it already splits into:
    - generic `L012BE2` submissions
    - an alternate `L012D5A` submission path

## Practical Reading

- the old five-PC list mixed together three different kinds of work:
  - operand/variant load (`02:B042`)
  - coordinate/tile-base math (`02:B05D`, `02:B0B1`, `02:B0BD`)
  - actual generic submit (`02:B134`)
- that means the next proving target should no longer be "which one of the
  five is the road builder?"
- the tighter target is:
  - what `L012BE2` emits on the default path
  - what `L012D5A` emits on the alternate path
  - which live-race conditions choose between those two emitters

## Why The Radar Was Only An Anchor

- the radar/top-strip marker stayed useful because its ownership is already
  closed:
  - `L0117BA` seeds `state_11f3`
  - `L0108EF` turns it into `oam_0730`
- that closed path gave a reliable visual/state anchor for confirming that the
  manual live-race seeds were meaningfully different from the old control
  corridor
- but `L01318D` is where the open gameplay-world attribution still lives, so
  the lane should now spend effort there instead of treating the radar marker
  as the main destination


## Gameplay And Lane 3 :: 02:9016 State Ownership

- Source: `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- Bundle copy: `sources/rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- Last updated: `2026-03-27 22:59`
- Note: Semantic ownership pass for post-handoff gameplay fields.

---

# Track 1 `02:9016` State Ownership Notes

- Note date: `2026-03-27`
- Primary evidence surfaces:
  - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
  - `bank2.asm` `L0108EF`, `L0117BA`, `L012501`
  - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
  - `bank1.asm` `L009185`, `6250..6272`

## What Was Read

- static ownership reads:
  - `nl -ba bank2.asm | sed -n '1128,1208p'`
  - `nl -ba bank2.asm | sed -n '2860,3060p'`
  - `nl -ba bank2.asm | sed -n '4480,4585p'`
  - `nl -ba bank2.asm | sed -n '5488,5715p'`
  - `nl -ba bank2.asm | sed -n '6168,6205p'`
  - `nl -ba bank0.asm | sed -n '3294,3420p'`
  - `nl -ba bank0.asm | sed -n '3440,3775p'`
  - `nl -ba bank1.asm | sed -n '2088,2122p'`
  - `nl -ba bank1.asm | sed -n '6240,6320p'`
- probe spot-checks from existing promoted JSONs:
  - control aligned window `2048..2053`
  - manual live-race windows `0..5`

## Ownership Map

- `state_11f3` is no longer an anonymous split field.
  - `bank2.asm` `L0117BA` seeds it only on the rival-enabled branch:
    `$11F3 <- $11F1 - 1` when `$1C76 != 0`.
  - `bank2.asm` `L0108EF` then turns `$11F3` into `oam_0730`, while the
    adjacent words come from `$11F1 -> oam_072C` and `$11F5 -> oam_0734`.
  - `bank2.asm` `L012501` also compares `$11F3` against `$1CE8`, so the field
    participates in gameplay-facing thresholds as well as HUD/OAM staging.
  - practical read:
    `state_11f3 -> oam_0730` is a rival-only HUD/progress marker, not a menu
    artifact.

- `state_09a2` is an OAM staging cursor / sprite count.
  - `bank0.asm` startup resets it with `$09A2 = 0`, `$09A4 = 0x0200`,
    `$09A8 = 2`, then `L0015BD` fills the remaining `0700` buffer with the
    `E100` sentinel and raises `$096A`.
  - `bank0.asm` `L001662` and `L00179B` increment `$09A2` once per sprite
    emitted into `0700/0900`.
  - `bank1.asm` `L009185` preserves and restores `$09A2` around helper-bundle
    rendering before calling `L0015BD`.
  - practical read:
    `state_09a2` differences inside `02:9016` indicate different OAM workload,
    not a separate top-level callback family.

- `state_09a8` is a builder-side OAM allocator control value.
  - `bank0.asm` `L0015E1` copies `$09A8` into `$0AAA`, the allocator-side map
    associated with OAM entries.
  - `bank2.asm` repeatedly sets `$09A8` to non-default values immediately
    before sprite submission calls:
    - `#000A` around `L001662`
    - `#003C` in `L01318D`
    - `#FFFF` in bank-1 helper setup
    - then resets back to `#0002`
  - practical read:
    the `09A8 = 2/10` pulses in the live-race probes are allocator/build
    control changes, not a standalone gameplay mode flag.

- `dp_0053/dp_0054` behave as the read/write cursor pair for the `7E:0600`
  DMA descriptor ring.
  - the scanline instrumentation already models the pair that way in
    `validation/mesen_scanline_step_test.lua`, deriving active descriptor
    counts from `7E:0053/0054` over `7E:0600`.
  - the aligned control and manual live-race windows show the exact cursor
    catch-up shape expected from a producer/consumer ring in `8`-byte steps:
    - control: `E8/E8 -> E8/E8 -> E8/F8 -> F8/F8 -> F8/F8 -> F8/F8`
    - `live_race_mid`: `78/78 -> 78/88 -> 88/88 -> 88/98 -> 98/98 -> 98/A8`
    - `live_race_plus30f`: `28/28 -> 28/28 -> 28/28 -> 28/28 -> 28/30 -> 30/40`
  - practical read:
    `0053/0054` are queue-lifecycle telemetry inside `02:9016`, not durable
    car-physics state.

- `dp_0020/dp_0022` are still useful discriminators, but they look like
  transient builder operands rather than stable state.
  - `bank2.asm` writes and rewrites `$20.b/$22.b` throughout sprite/HUD
    builders such as `L012481`, `L012CA8`, `L012D5A`, and `L012DEC`.
  - those values act like temporary coordinates / source selectors / tile
    bases immediately before math or `L001662/L00179B` submission calls.
  - practical read:
    probe differences on `dp_0020/dp_0022` tell us which producer path last ran
    near frame end, but not by themselves which gameplay phase we are in.

## Current Reading

- the broad `02:9016 / 01:96A0 / 02:8F3C` family is now best read as a shared
  session driver that can host attract/demo, front-end carry, and live race.
- the manual live-race seeds differ from the old aligned control corridor
  because they schedule different rival HUD/OAM and DMA queue work inside that
  same driver:
  - rival marker source: `state_11f3 -> oam_0730`
  - OAM workload surface: `state_09a2/state_09a8`
  - DMA queue lifecycle: `dp_0053/dp_0054`
  - last-run builder scratch: `dp_0020/dp_0022`

## Next Best Step

- stop treating `09A2/09A8/0053/0054` as anonymous split bytes
- the first producer trace is now closed enough to focus the next pass:
  - `BG2VOFS` is fed directly from `$22/$23`
  - `next_irq_ptr` flips `01:960D <-> 01:96A0` inside the confirmed live-race
    frame
  - the strongest current producer cluster sits inside `L01318D` around
    `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
- next ownership target:
  map which of those producers also account for the extra live-race
  `09A2/09A8/0053/0054` movement instead of treating the whole cluster as one
  opaque road builder


## Runtime And Port Validation :: SDL Runtime Smoke

- Source: `rom_analysis/docs/port_sdl_runtime_mimetization_smoke.md`
- Bundle copy: `sources/rom_analysis/docs/port_sdl_runtime_mimetization_smoke.md`
- Last updated: `2026-03-28 10:19`
- Note: Bounded regression read for current intro/front-end parity in the C/SDL runtime.

---

# SDL Runtime Mimetization Smoke

Date: `2026-03-28`

## Goal

Measure, with one bounded regression pass, how far the current C/SDL runtime
already mimics the promoted SNES intro/attract sequence.

This is explicitly an intro/front-end smoke, not a gameplay-parity claim.

## Run

```sh
make -C port
./port/test_regression.sh
```

Sequence under test:

- `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt`

## Result

- `make -C port` reported the runtime already up to date
- the headless regression rendered `1000` frames successfully
- frame-format sanity passed on the dumped PPM output
- golden checks:
  - `bootstrap_queue_978` at frame `324`: `0` mismatched pixels
  - `bootstrap_queue_982` at frame `328`: `0` mismatched pixels
  - `bridgeoverride_986` at frame `332`: `0` mismatched pixels
  - `bridgeobj_990` at frame `336`: `0` mismatched pixels
  - `mode7_visible_991` at frame `337`: `4` mismatched pixels
    (`0.006975%`)
- transition check:
  - `mode7_hold_transition`: `PASS`

Regression summary:

- `5` passed
- `1` failed
- `0` skipped

## Practical Read

- The current SDL runtime reproduces the promoted bridge-visible intro path
  exactly through the checked `978/982/986/990` checkpoints.
- The first remaining measured parity gap in this smoke sits immediately after
  that block at frame `991`, and it is small: `4` pixels.
- For intro/front-end regression work, the runtime is already good enough to
  act as a useful SNES mimic and checkpoint surface.
- For gameplay, this smoke does **not** prove parity yet; the gameplay lane
  still relies on live-entry probe/capture work rather than direct SDL replay.

## Next Gate

- either close the `4`-pixel `991` gap directly
- or formalize that boundary explicitly if the runtime should treat it as a
  temporary tolerated Mode 7 edge


## Runtime And Port Validation :: Instrumented Backend Architecture

- Source: `rom_analysis/docs/mesen_instrumented_backend_architecture.md`
- Bundle copy: `sources/rom_analysis/docs/mesen_instrumented_backend_architecture.md`
- Last updated: `2026-03-22 22:03`
- Note: Architecture note for the experimental Mesen backend path.

---

# Instrumented Mesen Backend Architecture

Date: `2026-03-22`

This note documents the first engineering pass toward turning the local
`Mesen2` tree into a laboratory backend for ROM archaeology and native-port
evidence capture.

The intent is not generic emulator hacking. The backend is meant to produce
repeatable, structured evidence bundles that reduce ambiguity in the original
ROM behavior.

## 1. Source Findings

Verified in `/home/nivando-soares/Mesen2`.

### 1.1 Existing backend entrypoint

- `UI/Program.cs`
  - already routes `--testRunner` before Avalonia UI startup
- `UI/Utilities/TestRunner.cs`
  - initializes the emulator headlessly
  - loads one ROM
  - loads debugger workspace
  - can run without normal GUI lifecycle

Reading:

- a new backend mode can sit beside `TestRunner` with minimal disruption
- this is the lowest-risk integration point for an MVP

### 1.2 Frame ownership and boundaries

- `Core/Shared/Emulator.cpp`
  - `Emulator::Run()` drives `_console->RunFrame()`
  - `Emulator::ProcessEvent()` already routes `StartFrame`, `EndFrame`, `Nmi`,
    `Irq`, `StateLoaded`, etc through the debugger/script path
- `Core/SNES/SnesConsole.cpp`
  - `SnesConsole::RunFrame()` loops on `_cpu->Exec()` until `_frameRunning`
    becomes false
  - `ProcessEndOfFrame()` performs end-of-frame housekeeping
- `Core/SNES/SnesPpu.cpp`
  - `EventType::EndFrame` is emitted at the NMI/VBlank-side frame completion
  - `_frameCount++` happens there
  - `ConsoleNotificationType::PpuFrameDone` is sent from `SendFrame()`
  - `EventType::StartFrame` is emitted when scanline wraps to the next frame

Reading:

- the stable architectural boundaries already exist
- the MVP can consume them indirectly through debugger stepping and frame count
- a future lab sink should attach directly at these `StartFrame`/`EndFrame`
  sites to remove boundary ambiguity

### 1.3 VRAM / CGRAM / OAM / Mode 7 write paths

- `Core/SNES/SnesPpu.cpp`
  - `0x2104` OAM writes call `ProcessPpuWrite(..., MemoryType::SnesSpriteRam)`
  - `0x2118/0x2119` VRAM writes call
    `ProcessPpuWrite(..., MemoryType::SnesVideoRam)`
  - `0x2122` CGRAM writes call
    `ProcessPpuWrite(..., MemoryType::SnesCgRam)`
  - `0x211A..0x2120` update `_state.Mode7.*` directly

Reading:

- VRAM/CGRAM/OAM already have single choke points
- Mode 7 register writes are similarly centralized, even if not all of them
  use the same `ProcessPpuWrite` path

### 1.4 DMA paths

- `Core/SNES/SnesDmaController.cpp`
  - `Write(0x420B)` arms manual DMA
  - `Write(0x420C)` arms HDMA
  - `CopyDmaByte(...)` is the byte-level transfer choke point
  - `RunDma(...)` and `RunHdmaTransfer(...)` sit above it

Reading:

- `CopyDmaByte(...)` is the best eventual core hook for a first-class DMA lab
  sink
- for the MVP, debugger events already carry enough DMA attribution to avoid
  touching the core

### 1.5 Existing debugger/export infrastructure

- `Core/SNES/Debugger/SnesEventManager.cpp`
  - already classifies SNES register activity into:
    - OAM writes
    - BG option writes
    - BG scroll writes
    - VRAM writes
    - Mode 7 writes
    - CGRAM writes
    - other writes
  - attaches scanline, cycle, DMA channel, DMA channel config, and program
    counter
- `UI/Interop/DebugApi.cs`
  - exposes:
    - `InitializeDebugger`
    - `Step`
    - `GetConsoleState`
    - `GetCpuState`
    - `GetPpuState`
    - `GetMemoryState`
    - `SetInputOverrides`
    - `TakeEventSnapshot`
    - `GetDebugEvents`
- `UI/Interop/ConsoleState/SnesState.cs`
  - already exposes `SnesState`, `SnesPpuState`, `Mode7Config`,
    `SnesDmaControllerState`, etc
- `UI/Interop/NotificationListener.cs`
  - already exposes `PpuFrameDone` notifications

Reading:

- the MVP can be implemented entirely in C# against real emulator execution
- this avoids immediate C++ core surgery
- this is appropriate for a first vertical slice

## 2. Instrumentation Architecture

### 2.1 MVP architecture

- `LabRunner`
  - new backend-oriented runner beside `TestRunner`
- execution controller
  - loads ROM
  - optionally loads savestate
  - aligns to a frame boundary
  - applies scripted input windows
  - advances through a requested range
- probe selection
  - configures existing debugger event categories and memory dumps
- artifact writer
  - writes deterministic per-frame JSON and binary outputs
- manifest writer
  - records ROM hash, build version, range, probe sets, capture semantics, and
    artifact paths

### 2.2 Data flow

1. `Program.Main` detects `--labRunner`
2. `LabRunner` initializes headless emulation
3. `LabRunner` initializes debugger access
4. `LabRunner` configures the SNES event viewer categories for the selected
   probe sets
5. For each frame:
   - capture `startBoundary`
   - apply input override
   - advance to the next frame boundary
   - capture `endBoundary`
   - snapshot debugger events with previous-frame visibility enabled
   - dump optional `VRAM/CGRAM/OAM`
   - write `frame.json` and `events.json`
6. At end:
   - write `summary.json`
   - write `manifest.json`

### 2.3 Enable/disable strategy

- when `--labRunner` is not used, nothing changes for normal emulator startup
- within `--labRunner`, probe selection gates:
  - event categories
  - memory dumps
  - Mode 7 state export emphasis

### 2.4 Why this is the right first split

- it reuses proven debugger infrastructure instead of duplicating it
- it keeps the core untouched for the first slice
- it produces real artifacts now
- it leaves a clean path for a later core-native sink layer

### 2.5 Known MVP limitation

The debugger stepping surface does not yet give a perfectly canonical
single-instant “frame snapshot”. The current runner therefore exports both:

- `startBoundary`
- `endBoundary`

and uses previous-frame event snapshots explicitly. That is deliberate. The
backend should expose the ambiguity rather than hide it.

## 3. Backend/CLI Design

Current implemented mode:

```sh
Mesen --labRunner <rom> \
  --load-state <file> \
  --run-range <start:end> \
  --input-script <windows> \
  --probe-set <list> \
  --export-dir <path> \
  [--manifest-out <file>]
```

Implemented options:

- `--load-state <file>`
- `--run-range <start:end>`
- `--input-script <windows>`
- `--probe-set frame_core_probe,dma_vram_probe,mode7_probe`
- `--export-dir <path>`
- `--manifest-out <file>`

Input-script format:

- `frame:buttons`
- `start-end:buttons`
- buttons use the same comma-separated tokens already used in the repo:
  - `a,b,x,y,l,r,u,d,up,down,left,right,select,start`

Example:

```sh
./validation/run_mesen_lab_backend.sh \
  ./game.smc \
  --load-state ./.mesen-config/Mesen2/SaveStates/game_11.mss \
  --run-range 18030:18032 \
  --probe-set frame_core_probe,dma_vram_probe,mode7_probe \
  --export-dir tools/out/mesen_lab_mvp_18030_18032
```

Next CLI step after the MVP:

- add relative range syntax for savestate-seeded work such as `+0:+16`
- add named probe presets instead of comma-only flags
- optionally add a JSON spec mode once the direct CLI surface stabilizes

## 4. Probe Sets

### 4.1 `frame_core_probe`

Purpose:

- provide frame-indexed timing and execution context for reproducible windows

Signals:

- frame index
- master clock
- CPU register surface
- PPU frame/scanline/cycle state
- layer scroll/base config
- NMI/IRQ event counts

Schema:

- in `frame.json`
  - `startBoundary`
  - `endBoundary`
  - `eventSummary`

Port value:

- creates the minimal behavioral contract needed to anchor later comparison

### 4.2 `dma_vram_probe`

Purpose:

- capture data motion that directly changes rendered state

Signals:

- DMA-attributed register events
- VRAM write events
- CGRAM write events
- OAM write events
- raw `vram.bin`
- raw `cgram.bin`
- raw `oam.bin`
- per-dump SHA-256

Schema:

- `events.json`
- `frame.json -> memoryDumps`
- `frame_XXXXXX/vram.bin`
- `frame_XXXXXX/cgram.bin`
- `frame_XXXXXX/oam.bin`

Port value:

- exposes exactly which memory surfaces changed and preserves a diffable
  binary end state

### 4.3 `mode7_probe`

Purpose:

- surface transformation-relevant state for Mode 7 reconstruction

Signals:

- Mode 7 matrix values
- scroll
- center
- mirroring/fill flags
- Mode 7 register write events

Schema:

- `frame.json -> startBoundary.ppu.mode7`
- `frame.json -> endBoundary.ppu.mode7`
- `events.json` entries with category `mode7_write`

Port value:

- reduces ambiguity around producer switches vs parameter-only changes

### 4.4 Planned `ownership_probe`

Purpose:

- infer producer / callback / dispatcher ownership transitions

Planned signals:

- repeated PC hotspots from event sources
- optional callstack surface
- optional callback/dispatcher watch fields

Current status:

- designed only
- not implemented in the MVP

### 4.5 Planned `visual_contract_probe`

Purpose:

- bind runtime state to visual outputs and downstream scene comparison

Planned signals:

- frame metadata
- layer state
- relevant writes
- optional screenshot/tilemap/sprite surfaces

Current status:

- designed only
- not implemented in the MVP

## 5. Implementation Plan

### 5.1 Smallest valuable slice

- add a backend runner in `UI`
- keep it SNES-only for the first pass
- reuse debugger stepping/events/state/memory APIs
- emit deterministic JSON + binary bundles

### 5.2 Files touched in the first pass

In `Mesen2`:

- `UI/Program.cs`
- `UI/Utilities/CommandLineHelper.cs`
- `UI/Utilities/DependencyHelper.cs`
- `UI/Utilities/LabRunner.cs`

In `asmdump`:

- `validation/run_mesen_lab_backend.sh`
- `validation/README.md`
- this note

### 5.3 Main risks

- debugger step semantics at frame boundaries are subtle
- long warm-up ranges are expensive with frame-by-frame stepping
- the current MVP still depends on debugger lifetime and event snapshot
  semantics
- compile/publish behavior in the local `Mesen2` tree is noisier than the
  minimal code delta itself

## 6. Implementation Progress

Actually implemented:

- `--labRunner` mode wired into `Program.Main`
- CLI parsing for:
  - `--load-state`
  - `--run-range`
  - `--input-script`
  - `--probe-set`
  - `--export-dir`
  - `--manifest-out`
- SNES-only MVP exporter
- deterministic artifact layout
- frame-core state export
- debugger event export
- optional `VRAM/CGRAM/OAM` dumps with SHA-256
- shell launcher in `validation/`
- fallback dependency loading from on-disk `Dependencies.zip` beside the local
  executable

Still planned / not implemented:

- first-class core-native lab sink
- screenshot/tilemap/sprite capture integration in the backend mode
- ownership/callback-focused probe set
- visual-contract probe set
- relative frame ranges
- condition/event-based stop rules

## 7. Validation

### 7.1 What was tested

Code-level validation:

- `dotnet build UI/UI.csproj -c Release -p:RuntimeIdentifier=linux-x64 -t:Compile --no-restore`
  - succeeded for the first MVP cut before the later frame-boundary fix

Runtime/backend validation:

- savestate frame discovery:
  - `./validation/run_mesen_lab_backend.sh ... --load-state game_11.mss --run-range 0:0`
  - result: fast failure with verified message
    `loaded state starts at frame 18030`
- first exact-range run against that savestate:
  - `--run-range 18030:18032`
  - result: exposed a real frame-boundary mismatch
    `expected 18031, got 18030`
- attempted no-savestate validation at `300:302`
  - result: too expensive for the first backend cut and not useful enough to
    justify repeated retries before fixing the stepping surface

### 7.2 What was learned

- the savestate path is usable and provides a precise absolute frame anchor
- `Step(PpuFrame)` is not sufficient by itself for this backend contract
- the runner must explicitly handle “advance until frame count changes” instead
  of assuming one `PpuFrame` step equals one frame-count transition

### 7.3 Artifact examples

Produced during validation:

- `tools/out/mesen_lab_state_probe/`
  - run attempt used to discover that `game_11.mss` begins at frame `18030`

Not yet produced successfully after the stepping fix:

- a clean `18030..18032` three-frame bundle with all probes

That makes the current state a partial implementation with a concrete,
narrowed runtime blocker rather than a completed validated backend.

## 8. Recommended Next Steps

1. Rebuild the local `Mesen2` output cleanly after the stepping fix and rerun
   the `18030..18032` savestate-backed capture.
2. Promote the current boundary workaround into a cleaner helper with explicit
   metadata about any correction `PpuStep` count used.
3. Add relative-range syntax for savestate-seeded workflows.
4. Add a first ownership-focused summary surface:
   - top event PCs
   - optional callstack head
   - callback/watch fields from known WRAM/state points
5. Move the second slice into the core:
   - a lab sink fed directly from `StartFrame` / `EndFrame`,
     `ProcessPpuWrite(...)`, and `CopyDmaByte(...)`
   - keep the C# runner as the orchestration layer above it
