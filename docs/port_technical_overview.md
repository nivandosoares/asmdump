# The Duel: Test Drive II PC Port

Technical overview for engineers joining the project.

This document summarizes the current porting passes, the active toolchain, the dev environment, the intro/front-end reconstruction work, and the main technical blockers. It is written as a working handoff, not as marketing material.

All images embedded below are PNG copies generated from existing PPM artifacts in the repo. The source PNGs live under `docs/images/port_article/`.

## Scope

The project is a C/SDL reimplementation backed by ROM extraction and emulator validation. It is not a direct ASM-to-C port.

Current high-level status:

| Area | Status | Notes |
| --- | --- | --- |
| Phase 0: Golden reference | Partial, usable | Capture/probe/diff loop is working |
| Phase 1: Typed extraction | Partial, strong on intro/front-end | Compression, palettes, scene dumps, queue-driven scenes are usable |
| Phase 2: Engine archaeology | Started | Bank 0 and bank 1 are productive; gameplay banks are still shallow |
| Phase 3: PC runtime skeleton | Complete for Sprint 0 | SDL runtime, scene playback, headless validation are in place |
| Phase 4: Vertical slice | Not delivered | Front-end only; no playable race yet |
| Phase 5-6: full game / ship | Not started | Future work |

Reference plan: [PORT_PLAN.md](/home/nivando-soares/asmdump/PORT_PLAN.md#L1)  
Live checkpoint: [project_checkpoint.md](/home/nivando-soares/asmdump/docs/project_checkpoint.md#L1)

## Stack

### Runtime

- Language: C11
- Windowing/render loop: SDL2
- Framebuffer: `256x224`
- Simulation cadence: fixed `60 Hz`
- Renderer model: software framebuffer uploaded to SDL

Build example:

```sh
make -C port
./port/build/td2_port --sequence ./tools/out/intro_loop_hybrid_bridge_sequence.txt
```

Reference: [port/Makefile](/home/nivando-soares/asmdump/port/Makefile#L1), [port/src/main.c](/home/nivando-soares/asmdump/port/src/main.c#L1)

### Tooling

- Python 3 for extraction, decompression, render validation, queue analysis, manifest generation
- .NET 8 for the Mesen bridge extractor
- Mesen2 for emulator-driven capture and state extraction

Bridge build/runtime example:

```sh
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 990 --out-dir tools/out/mesen_frame990_assets_v2
```

Reference: [tools/run_mesen_ppu_extract.sh](/home/nivando-soares/asmdump/tools/run_mesen_ppu_extract.sh#L1), [mesen_ppu_extract.csproj](/home/nivando-soares/asmdump/tools/mesen_ppu_extract/mesen_ppu_extract.csproj#L1)

### Validation

- Mesen test-runner Lua scripts
- PNG/PPM compare tooling
- Boot/front-end probe and range dump scripts

Validation example:

```sh
env TD2_BOOT_PROBE_TOTAL_FRAMES=995 \
    TD2_BOOT_PROBE_SCREENSHOT_FRAME=994 \
    TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
    TD2_BOOT_PROBE_DUMP_WRAM_MEMORY=1 \
    ./validation/run_mesen_probe_boot.sh
```

Reference: [validation/run_mesen_capture.sh](/home/nivando-soares/asmdump/validation/run_mesen_capture.sh#L1), [validation/mesen_probe_boot.lua](/home/nivando-soares/asmdump/validation/mesen_probe_boot.lua#L1), [tools/compare_frames.py](/home/nivando-soares/asmdump/tools/compare_frames.py#L1)

## Dev Environment

Current known-good environment:

- Linux
- `cc` or `clang`/`gcc` with SDL2 available via `pkg-config`
- `python3`
- `dotnet` with `net8.0`
- local Mesen2 Linux release under `/home/nivando-soares/Mesen2/bin/linux-x64/Release`

Important wrappers:

- runtime build: [port/Makefile](/home/nivando-soares/asmdump/port/Makefile#L1)
- Mesen bridge: [tools/run_mesen_ppu_extract.sh](/home/nivando-soares/asmdump/tools/run_mesen_ppu_extract.sh#L1)
- isolated Mesen validation runner: [validation/run_mesen_capture.sh](/home/nivando-soares/asmdump/validation/run_mesen_capture.sh#L1)

The validation launcher uses an isolated config under `.mesen-config/`, so it does not depend on or overwrite the user’s normal Mesen profile.

## Engineering Passes

### Pass 0: Golden reference

Goal: make the original ROM measurable.

Delivered:

- deterministic input capture path
- frame dumping
- boot/title probe
- range dump for the intro loop
- frame compare tool

What this unlocked:

- deterministic no-input intro loop period `654 -> 2072`
- stable boot/title anchors such as frame `300` credits and frame `654` Ballistic

Reference artifacts:

- [intro_loop_sequence.txt](/home/nivando-soares/asmdump/tools/out/intro_loop_sequence.txt#L1)
- [validation/README.md](/home/nivando-soares/asmdump/validation/README.md#L1)

### Pass 1: Typed extraction

Goal: stop treating ROM banks as anonymous bytes.

Delivered:

- bank 3 palette extraction
- bank 7 `42FB` and boot-path `26FB` decompression
- bank 1 boot/title manifests
- SNES scene dumps as `VRAM + CGRAM + PPU state + optional OAM`
- queue analysis from low WRAM
- Ballistic clip builders

Representative commands:

```sh
make -C tools bank1-bootstrap-queue-990-bridgeoam-preview
make -C tools intro-bootstrap-queue
make -C tools intro-loop-hybrid-bridge-sequence
```

Reference:

- [tools/Makefile](/home/nivando-soares/asmdump/tools/Makefile#L1)
- [tools/README.md](/home/nivando-soares/asmdump/tools/README.md#L1)

### Pass 2: Runtime skeleton

Goal: stand up a deterministic SDL runtime that can consume extracted artifacts.

Delivered:

- SDL startup
- fixed `60 Hz` loop
- headless mode
- framebuffer dump path
- image playback
- sequence playback
- indexed palette animation playback
- SNES BG renderer with optional OBJ composition

Representative manifest snippet:

```txt
# type duration_frames path_a [path_b path_c path_d]
ballistic_a39c 304 ballistic_callback/ballistic_a39c.txt
image 20 intro_loop_sequence_images/frame_00958.ppm
snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin
snes_bg 4 bank1_bootstrap_queue_982_vram.bin bank1_bootstrap_queue_982_cgram.bin bank1_bootstrap_queue_982_ppu_state.json bank1_bootstrap_queue_982_oam.bin
```

Reference: [intro_loop_hybrid_bridge_sequence.txt](/home/nivando-soares/asmdump/tools/out/intro_loop_hybrid_bridge_sequence.txt#L1)

### Pass 3: Intro/front-end reconstruction

This is the main active area.

Delivered so far:

- exact frame-`300` credits scene from ROM-side builder
- direct runtime `ballistic_a39c` playback
- screenshot-exact sampled intro loop
- hybrid native-plus-sampled intro loop
- bridge-accurate native coverage through frame `990`

This is the current split:

- screenshot-exact current best: [intro_loop_hybrid_sequence.txt](/home/nivando-soares/asmdump/tools/out/intro_loop_hybrid_sequence.txt#L1)
- bridge-accurate native-coverage current best: [intro_loop_hybrid_bridge_sequence.txt](/home/nivando-soares/asmdump/tools/out/intro_loop_hybrid_bridge_sequence.txt#L1)

### Pass 4: Gameplay archaeology and vertical slice

Not delivered yet.

Still missing:

- bank 10 physics/AI reconstruction
- bank 11 rasterizer documentation
- bank 30 gameplay dispatch mapping
- first playable race on PC

Reference gap summary: [project_checkpoint.md](/home/nivando-soares/asmdump/docs/project_checkpoint.md#L165)

## Visual Examples

### Exact credits scene reconstruction

This scene is solved both from live Mesen state and from a ROM-side builder.

![Credits Scene](images/port_article/credits_scene.png)

Source artifact: [bank1_credits_scene_regen.ppm](/home/nivando-soares/asmdump/tools/out/bank1_credits_scene_regen.ppm)

### First stable queue-driven post-bootstrap frame

Frame `978` is the first strong native replacement after the unstable bootstrap.

![Queue 978](images/port_article/queue_978.png)

Source artifact: [bank1_bootstrap_queue_978.ppm](/home/nivando-soares/asmdump/tools/out/bank1_bootstrap_queue_978.ppm)

### Next queue-driven step

Frame `982` continues the same callback family and is also stable enough to promote.

![Queue 982](images/port_article/queue_982.png)

Source artifact: [bank1_bootstrap_queue_982.ppm](/home/nivando-soares/asmdump/tools/out/bank1_bootstrap_queue_982.ppm)

### Bridge-accurate frame `986`

This frame is not screenshot-exact, but the queue-driven scene with bridge OAM is within `2` pixels of Mesen `main_visible`.

![Queue 986 Bridge](images/port_article/queue_986_bridge.png)

Source artifact: [bank1_bootstrap_queue_986_bridgeoverride.ppm](/home/nivando-soares/asmdump/tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm)

### Bridge-accurate frame `990`

This is the current edge of reproducible native intro coverage.

![Queue 990 Bridge](images/port_article/queue_990_bridge.png)

Source artifact: [bank1_bootstrap_queue_990_bridgeobj.ppm](/home/nivando-soares/asmdump/tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm)

### `L00A00C` bootstrap experiment

This is intentionally included as a failure example. It is a useful harness, but not yet a faithful reconstruction.

![L00A00C Experiment](images/port_article/a00c_experiment.png)

Source artifact: [bank1_l00a00c_scene.ppm](/home/nivando-soares/asmdump/tools/out/bank1_l00a00c_scene.ppm)

## Current Metrics

The most important intro/front-end accuracy numbers right now:

| Artifact | Against screenshot | Against Mesen `main_visible` | Reading |
| --- | ---: | ---: | --- |
| Credits scene | `0 px` | exact solved path | Closed |
| `bank1_bootstrap_queue_978` | `2 px` | `1 px` | Promoted |
| `bank1_bootstrap_queue_982` | `2 px` | `2 px` | Promoted |
| `bank1_bootstrap_queue_986_bridgeoverride` | `21 px` | `2 px` | Bridge-accurate, not screenshot-exact |
| `bank1_bootstrap_queue_990_bridgeobj` | `1518 px` | `2 px` | Bridge-accurate, not screenshot-exact |
| `bank1_bootstrap_queue_994_bridgeobj` | `2143 px` | `96 px` | Next unresolved edge |
| `bank1_l00a00c_scene` | effectively unusable | not promotable | Experiment only |

This is the central technical boundary in the project: after frame `982`, extracted Mesen scene output and the final captured screenshot diverge in a way that is not yet fully modeled.

## Main Challenges

### 1. Final-screen composition after frame `982`

The queue-driven scene builders are now close to Mesen `main_visible` through frame `990`, but they are not yet close to the final screenshot after `982`.

Current reading:

- `978` and `982` are practically solved
- `986` and `990` are bridge-accurate but not final-screen accurate
- `994` is the next unresolved boundary even in bridge-space

This means there is still missing presentation logic after `982`. That gap is narrower than it was, but it is still real.

### 2. Unstable bootstrap window `958..977`

The static visible image there is stable, but live extracted state is not directly faithful enough to rebuild the scene.

Working assets:

- [intro_bootstrap_958_974_queue.json](/home/nivando-soares/asmdump/tools/out/intro_bootstrap_958_974_queue.json#L1)
- [build_bank1_l00a00c_scene.py](/home/nivando-soares/asmdump/tools/build_bank1_l00a00c_scene.py#L1)

Status:

- good experiment harness
- not yet a native replacement

### 3. Gameplay remains mostly untouched

The project has real front-end momentum, but gameplay work is still blocked on deeper archaeology:

- bank 10 physics/AI
- bank 11 renderer/rasterizer
- bank 30 dispatch/state entry points

### 4. Audio is still mostly a note, not an implementation

Audio banks are identified, but there is no real extraction/porting path yet.

## Practical Workflow For New Developers

### If you are working on validation

Start here:

- [validation/README.md](/home/nivando-soares/asmdump/validation/README.md#L1)
- [mesen_probe_boot.lua](/home/nivando-soares/asmdump/validation/mesen_probe_boot.lua#L1)

Typical loop:

```sh
env TD2_BOOT_PROBE_TOTAL_FRAMES=995 \
    TD2_BOOT_PROBE_SCREENSHOT_FRAME=994 \
    TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
    TD2_BOOT_PROBE_DUMP_WRAM_MEMORY=1 \
    ./validation/run_mesen_probe_boot.sh
```

### If you are working on extraction/tooling

Start here:

- [tools/README.md](/home/nivando-soares/asmdump/tools/README.md#L1)
- [tools/Makefile](/home/nivando-soares/asmdump/tools/Makefile#L1)

Typical loop:

```sh
make -C tools intro-bootstrap-queue
make -C tools bank1-bootstrap-queue-990-bridgeoam-preview
make -C tools bank1-bootstrap-queue-994-bridgeoam-preview
```

### If you are working on the runtime

Start here:

- [port/README.md](/home/nivando-soares/asmdump/port/README.md#L1)
- [port/src/main.c](/home/nivando-soares/asmdump/port/src/main.c#L1)

Typical loop:

```sh
make -C port
./port/build/td2_port --headless \
  --sequence ./tools/out/intro_loop_hybrid_bridge_sequence.txt \
  --sequence-no-loop \
  --frames 340 \
  --dump-prefix ./port/build/intro_loop_hybrid_bridge
```

## Key Repo Artifacts

Start from these files if you need the shortest path back into the project:

- [PORT_PLAN.md](/home/nivando-soares/asmdump/PORT_PLAN.md#L46)
- [project_checkpoint.md](/home/nivando-soares/asmdump/docs/project_checkpoint.md#L8)
- [bank1_boot_flow.md](/home/nivando-soares/asmdump/docs/bank1_boot_flow.md#L400)
- [tools/README.md](/home/nivando-soares/asmdump/tools/README.md#L1)
- [validation/README.md](/home/nivando-soares/asmdump/validation/README.md#L1)
- [port/README.md](/home/nivando-soares/asmdump/port/README.md#L1)

## Bottom Line

The project has moved beyond setup. It now has:

- a working validation harness
- a working extraction stack
- a working SDL runtime
- a deterministic intro loop
- native runtime Ballistic playback
- queue-driven native front-end reconstruction through frame `990` when measured against extracted emulator scene state

It does not yet have:

- a fully native screenshot-exact intro loop
- a gameplay-capable vertical slice
- decoded gameplay systems
- audio parity

That is the real current position.
