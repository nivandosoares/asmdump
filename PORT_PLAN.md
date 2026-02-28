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
  - native OAM-aware `snes_bg` replacement for the first stable post-Ballistic window (`978..985`)
  - sampled image playback for the remaining later attract states
- there is now also a repeatable experimental ROM-side `L00A00C` builder:
  - it applies the direct setup uploads onto seeded `VRAM/CGRAM`
  - it is useful for iterating on the `958..977` bootstrap
  - it is not exact yet, which narrows the missing behavior to more than the obvious direct uploads

Immediate next focus:

1. Replace the later sampled attract segments with native front-end state machines one callback family at a time.
2. Push backward into the unstable `958..977` bootstrap using the new repeatable `L00A00C` scene builder and the carry-over state model from the end of Ballistic.
3. Keep building standalone extraction formats so later artist/mod tooling can sit on stable data instead of volatile reverse-engineering experiments.

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
