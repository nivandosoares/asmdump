# Project Checkpoint

Status date: 2026-02-28

This document records the exact state of the SNES-to-PC port project at the current checkpoint.
It is intended to let another engineer resume work without reconstructing context from chat history.

## Executive Summary

The project is still in Sprint 0 / early Phase 1-3.

What is already real:

- a working C/SDL runtime skeleton exists under `port/`
- a measured `Ballistic presents` intro clip now plays inside that runtime as an indexed image plus palette timeline derived from deterministic captures
- a ROM-derived `Ballistic presents` intro clip now also plays inside that runtime from helper-scene CGRAM plus the `A39C` `04:99ED` palette ramp
- a direct runtime `ballistic_a39c` implementation now also plays that same Ballistic clip from a compact callback asset instead of a pre-expanded palette timeline
- a full first no-input attract loop now also plays inside that runtime as an exact sampled image sequence
- a hybrid first no-input attract loop also exists:
  - direct runtime Ballistic callback clip for `654..958`
  - native OAM-aware `snes_bg` playback for the first stable post-Ballistic window (`978..985`)
  - sampled playback for the remaining later attract states
- the SDL runtime can now auto-load optional `oam.bin` data for extracted SNES scenes and composite OBJ sprites on top of BG/Mode 7 scenes
- the first post-Ballistic native replacement is now promoted into the hybrid intro loop as an OAM-aware `snes_bg` clip for frames `978..985`
- an experimental ROM-side `L00A00C` scene builder now exists for the static `958..977` bootstrap window
- the `958..974` bootstrap landing frame now also has a decoded WRAM-side queue artifact:
  - `tools/out/intro_bootstrap_958_974_queue.json`
  - it identifies two live `0600` DMA descriptors and confirms `0700..091F` as OAM staging
- a working Mesen-based validation harness exists under `validation/`
- the bank 0 control kernel is documented well enough to guide runtime architecture
- the bank 1 boot/title screen build path is partially reconstructed into machine-readable manifests
- bank 7 compression is no longer opaque:
  - `42FB` is implemented and validated on the boot path
  - `26FB` is implemented and validated on the boot path plus one overlay case

What is not real yet:

- no gameplay has been ported
- no general native front-end state machine exists on the PC side yet beyond the first Ballistic callback family
- no deterministic post-splash savestate has been added to validation
- bank 10, bank 11, and bank 30 are not yet documented deeply enough to implement gameplay
- the post-Ballistic Mode 7 attract path still drifts after frame `978`, so OAM support alone did not close that segment

## Phase Status

### Phase 0: Golden Reference

Status: partially complete and already useful

Completed:

- Mesen capture script with deterministic input override and frame dumping
- isolated launcher that does not rely on the user config directory
- frame comparison tool for emulator PNG vs port PPM
- boot-state probe script for front-end selectors
- deterministic no-input Ballistic sample window pinned to frames `654..710`
- deterministic full first attract-loop period pinned to `1418` frames (`654 -> 2072`)

Validated outputs:

- capture log at `.mesen-config/Mesen2/LuaScriptData/mesen_capture/td2_track1_accel_input_log.json`
- `300` captured frames after `60` warm-up frames
- first captured input frame: frame `60`
- last captured input frame: frame `359`
- boot probe log at `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.json`
- boot probe revalidated to `3600` frames

Still missing:

- deterministic savestate at a known front-end or race start state
- automated capture that begins after the Ballistic splash instead of power-on
- audio capture path

### Phase 1: Typed Asset Extraction

Status: partially complete

Completed:

- sequential bank 3 palette extraction
- boot-time palette manifest extraction from real call sites
- flattened palette export for the current SDL loader
- SNES 2bpp/4bpp tile extraction to PPM
- bank 1 boot/title screen manifest extraction
- partial boot/title VRAM reconstruction
- bank 7 compression header scan
- bank 7 `42FB` decompression
- bank 7 boot-path `26FB` decompression
- flat `ppu_state.json` export from the Mesen bridge for direct port/runtime consumption
- range extraction of Mesen scene samples into line-oriented playback manifests
- single-run screenshot-backed range extraction for exact intro-loop playback
- indexed palette-animation extraction from deterministic screenshot ranges
- ROM-derived Ballistic clip generation from helper-scene CGRAM plus the `A39C` palette ramp
- compact Ballistic callback-asset generation for direct runtime playback
- sequence splicing for hybrid native-plus-sampled intro manifests
- experimental `L00A00C` scene building from ROM uploads plus optional live `VRAM/CGRAM/OAM` seeds
- repeatable bootstrap delta summaries between extracted intro frames plus optional probe-state overlays

Current concrete outputs:

- `tools/out/bank3_palettes.json`: `1024` sequential 16-color palette entries
- `tools/out/bank1_boot_palettes_flat.json`: `74` extracted boot-path palettes
- `tools/out/bank1_boot_screen.json`: structured `L008CA2` build manifest
- `tools/out/bank1_boot_vram_variant0.json`: main-path partial VRAM build summary
- `tools/out/bank1_boot_vram_variant0_overlay.json`: same snapshot with optional overlay forced on
- `tools/out/bank7_42fb_8000.json`: first `42FB` decode summary
- `tools/out/bank7_26fb_817a.json`: first `26FB` decode summary
- `tools/out/ballistic_native/ballistic_splash.txt`: measured indexed palette-animation clip for the Ballistic splash
- `tools/out/ballistic_native_sequence.txt`: single-entry runtime manifest for that measured Ballistic clip
- `tools/out/ballistic_rom/ballistic_splash.txt`: ROM-derived indexed palette-animation clip for the Ballistic splash
- `tools/out/ballistic_rom_sequence.txt`: single-entry runtime manifest for that ROM-derived Ballistic clip
- `tools/out/ballistic_callback/ballistic_a39c.txt`: compact callback asset for direct runtime Ballistic playback
- `tools/out/ballistic_callback_sequence.txt`: single-entry runtime manifest for the direct `ballistic_a39c` path
- `tools/out/intro_loop_hybrid_sequence.txt`: hybrid intro-loop manifest with direct runtime Ballistic, a native OAM-aware `978..985` splice, and sampled later attract states
- `tools/out/intro_native_978/sequence.txt`: the promoted OAM-aware native splice source for the post-Ballistic attract path (`978..985`)
- `tools/out/bank1_l00a00c_scene.ppm`: experimental ROM-side `L00A00C` bootstrap scene preview using `954` seeds and a `974` presentation template
- `tools/out/intro_bootstrap_954_958_delta.json`: summary of the first Ballistic-to-bootstrap transition step
- `tools/out/intro_bootstrap_958_974_delta.json`: summary of the first live `01:9D69` bootstrap step
- `tools/out/intro_bootstrap_958_974_queue.json`: decoded low-WRAM queue state for that same landing frame

Still missing:

- true tilemap extraction and screen composition output
- text/string extraction from bank 4 in a usable port format
- track/scenario extraction for gameplay content
- audio extraction beyond bank-level notes
- broad `26FB` and any `27FB` validation beyond the current boot/title path

### Phase 2: Engine Archaeology

Status: started, useful, incomplete

Completed:

- bank 0 reset/NMI/IRQ/callback scheduler notes
- bank 1 post-reset handoff and boot/title build path notes
- bank 7 compression notes and practical decode workflow

Current understanding:

- bank 0 runs a callback-driven frame loop centered on NMI
- staged main and NMI callbacks live in `$096C-$0971`
- active callbacks live in `$0038-$0040`
- IRQ screen split setup is routed through `L000341`
- bank 1 `L008CA2` is now understood as a table-driven boot/title screen build stage

Still missing:

- first confirmed transition from front-end setup into a clearly identified interactive title/menu state
- bank 0 to bank 30 callback mapping for gameplay entry
- bank 11 rasterizer documentation
- bank 10 physics/AI documentation

### Phase 3: PC Runtime Skeleton

Status: complete for Sprint 0 scope

Completed:

- SDL2 app bootstrapping
- fixed-step `60 Hz` loop
- `256x224` framebuffer
- headless mode for smoke tests
- palette viewer
- extracted image viewer
- PPM frame dumping
- sequence playback for extracted SNES BG scenes
- sequence playback for exact sampled image-frame manifests

Still missing:

- tilemap-based screen compositor
- content package loading beyond the current simple JSON/PPM inputs
- debug HUD for game-state variables
- actual gameplay states

## Track-by-Track Status

### Track A: Runtime

Implemented in `port/`:

- `port/src/main.c`
- `port/Makefile`
- `port/README.md`

Known-good commands:

```sh
make -C port
./port/build/td2_port
./port/build/td2_port --headless --palette ./tools/out/bank1_boot_palettes_flat.json --frames 1 --dump-prefix ./port/build/checkpoint_palette
./port/build/td2_port --headless --image ./tools/out/bank1_boot_vram_variant0_overlay_4bpp.ppm --frames 1 --dump-prefix ./port/build/checkpoint_vram
```

Current limit:

The SDL runtime is still a validation-first viewer/compositor harness. It can now play sampled intro scenes, the full first no-input loop, measured and ROM-derived Ballistic clips, and a direct runtime Ballistic callback asset, but it does not yet implement broader native front-end state logic or gameplay.

### Track B: Content

Implemented in `tools/`:

- palette extraction
- boot palette manifest extraction
- palette manifest flattening
- boot screen manifest extraction
- VRAM snapshot builder
- tile extractor
- compression header scan
- `42FB` decoder
- boot-path `26FB` decoder
- Mesen scene-range extractor for intro playback manifests
- scene-manifest builder for exact screenshot-backed intro playback

Most useful make targets:

```sh
make -C tools bank3-palettes
make -C tools boot-palettes
make -C tools boot-palettes-flat
make -C tools boot-screen-manifest
make -C tools boot-vram-preview
make -C tools boot-vram-overlay-preview
make -C tools bank7-42fb0-preview
make -C tools bank7-26fb0-preview
make -C tools bank9-preview
```

Important verified details:

- `42FB` at `07:8000` expands to `0x1006` bytes and consumes `377` compressed bytes
- the first `42FB` output is an `L0005AC` record:
  - `6` bytes of header
  - `0x1000` bytes of payload
- `26FB` at `07:817A` expands to `2160` bytes and consumes `1160` compressed bytes
- overlay `26FB` at `0D:EFDE` also decodes under the same current model

Current limit:

The current preview path still shows planar tile sheets or raw VRAM dumps, not a final screen.
The new intro playback manifests are useful and deterministic. Ballistic now has a measured reference clip, a ROM-derived clip, and a direct runtime callback asset, but the later attract states are still sampled scene playback rather than native callback recreation.
The new `L00A00C` builder is useful for controlled iteration on the `958..977` bootstrap, but it is not exact yet even with `954` seed dumps and a stable `974` PPU template.
The new bootstrap delta summaries materially improved the reading of that gap: `954 -> 958` carries CGRAM forward unchanged, while `958 -> 974` is the first step where `01:9D69` becomes active and populates the `0202/0208/020A` state consumed by `L009DC6`.
The new WRAM-side queue decode sharpened that further: by frame `974`, `dp_0054 = 0x10`, which means two `0600` DMA descriptors are armed, sourced from `1A:9948` and `1A:A988`, and `0700..091F` is confirmed as the staged OAM upload buffer rather than a tile queue.
That queue artifact is also directly builder-friendly now: it carries `active_dma_descriptor_count_after` plus `active_after_entries`, so the next bootstrap pass can consume the live NMI queue without re-deriving the active slice from raw WRAM.

Deferred requirement recorded for later phases:

- once the extraction formats stabilize, add standalone visual-asset tooling for designers/modders:
  - isolated BG/layer previews
  - standalone asset image exports for upscale work
  - mod-friendly asset replacement paths

### Track C: Reverse Engineering

Current docs:

- `docs/bank0_flow.md`
- `docs/bank1_boot_flow.md`
- `docs/bank7_notes.md`

Most important conclusions so far:

- the runtime architecture should follow bank 0's NMI-driven callback scheduler
- boot/title content selection is table-driven in bank 1 before `L008CA2`
- boot/title palettes are not centralized in bank 3
- the main-path local bank 1 patch selectors are currently confirmed as:
  - `$1C78 = 1`
  - `$1C7A = 0`

Current limit:

There is still no confirmed end-to-end map from reset to a gameplay callback chain through bank 30.

### Track D: Validation

Implemented in `validation/`:

- `mesen_capture.lua`
- `run_mesen_capture.sh`
- `mesen_probe_boot.lua`
- `run_mesen_probe_boot.sh`

Known-good commands:

```sh
./validation/run_mesen_capture.sh
./validation/run_mesen_probe_boot.sh
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 TD2_BOOT_PROBE_INPUT_START_FRAME=240 TD2_BOOT_PROBE_INPUT=start,b ./validation/run_mesen_probe_boot.sh
```

Important observed result:

- the boot probe does confirm the stable defaults `$1C78 = 1` and `$1C7A = 0`
- the Ballistic splash now has a clean exact anchor at frame `654`, where the active callback first becomes `01:A39C`
- the Ballistic splash has been collapsed into `15` indexed pixel classes and `76` palette frames (`304` frames total)
- the measured, ROM-derived, and direct-callback Ballistic paths all reproduce the sampled validation frames exactly inside the SDL runtime
- the first attract loop repeats every `1418` frames and currently has both an exact sampled SDL playback manifest and a hybrid manifest with the direct Ballistic callback clip spliced in
- the same probe does not yet reach a populated `$1CCA/$1CE*` state from pure power-on
- after `3600` frames on the tested no-savestate path, those later selectors remained `0`

Current limit:

Validation is strong enough for boot-path experimentation, but not yet strong enough for deterministic gameplay parity work.

## Exact Boot/Title Reconstruction State

This is where the front-end reconstruction currently stands.

Resolved:

- `L008CA2` has been turned into a structured manifest of VRAM/CGRAM work
- the main-path build can now reconstruct a VRAM image with:
  - bank 9 page uploads
  - bank 8 raw block upload
  - mixed uploads to VRAM `0x0000` and `0x3000`
  - bank 7 `42FB` group A
  - bank 7 `26FB` group B
  - local bank 1 tilemap patches
- the optional overlay at `0D:EFDE` can be forced on and included in the build

Not resolved:

- actual BG tilemap interpretation on the PC side
- how close the current reconstructed VRAM is to the visually correct boot/title screen
- the later front-end state variables beyond the early selector defaults

Most relevant artifacts:

- `tools/out/bank1_boot_vram_variant0_4bpp.ppm`
- `tools/out/bank1_boot_vram_variant0_overlay_4bpp.ppm`
- `port/build/boot_vram_variant0_overlay_view_00000.ppm`

## Known Environment Assumptions

ROM path:

- `./game.smc`

Preferred Mesen binary:

- `/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen`

Known bad fallback in this environment:

- `/home/nivando-soares/Downloads/Mesen_2.1.1_Linux_x64/Mesen`
- this one previously crashed under `--testRunner` with `std::bad_cast`

Generated-output locations:

- `tools/out/`
- `port/build/`
- `.mesen-config/`

## Workspace Caveats

The git worktree was already dirty before and during this effort.

Pre-existing deletions remain in place under older visualization tooling and legacy `tools/` content.
Those deletions were intentionally left untouched.

If a checkpoint commit is prepared, review the worktree carefully rather than assuming every deletion belongs to this port effort.

## Resume Sequence

If work resumes from this checkpoint, the next sequence should be:

1. Capture or create a deterministic savestate after the Ballistic splash or at a known title/menu state.
2. Re-run `run_mesen_probe_boot.sh` against that savestate and record nonzero `$1CCA/$1CE*` values.
3. Build a tilemap-aware boot/title compositor that combines:
   - `bank1_boot_screen.json`
   - `bank1_boot_palettes_flat.json`
   - `bank1_boot_vram_variant0*.bin`
4. Continue reverse engineering from bank 0 into bank 30 and bank 11 to identify the first gameplay-capable callback chain.
5. Only after that, start implementing title/menu or gameplay state code in the SDL runtime.

## Regeneration Checklist

Use this if the generated files need to be rebuilt from scratch.

```sh
make -C tools bank3-palettes
make -C tools boot-palettes
make -C tools boot-palettes-flat
make -C tools boot-screen-manifest
make -C tools boot-vram-preview
make -C tools boot-vram-overlay-preview
make -C tools bank7-42fb0-preview
make -C tools bank7-26fb0-preview
make -C port
./validation/run_mesen_capture.sh
./validation/run_mesen_probe_boot.sh
```

## File Map

Primary planning:

- `PORT_PLAN.md`

Primary runtime:

- `port/src/main.c`
- `port/README.md`

Primary tooling:

- `tools/README.md`
- `tools/Makefile`
- `tools/decompress_td2_chunk.py`
- `tools/build_boot_vram.py`
- `tools/extract_boot_screen_manifest.py`

Primary reverse-engineering docs:

- `docs/bank0_flow.md`
- `docs/bank1_boot_flow.md`
- `docs/bank7_notes.md`

Primary validation:

- `validation/README.md`
- `validation/mesen_capture.lua`
- `validation/mesen_probe_boot.lua`
