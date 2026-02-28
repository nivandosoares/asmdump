# Technical Pulse: Sprint 0 Snapshot

## Context
- The team continues to follow the approved `PORT_PLAN.md` strategy: build the runtime skeleton, capture assets, and document bank control flow before deep implementation. That means no strategic pivots—just the “just go forward” momentum the user requested, with Sprint 0 covering runtime, tooling, RE docs, and validation scripts in parallel.
- The reverse-engineering base is still the shared reference point rather than a clean decompilation. Every piece of progress therefore equates to a new, verifiable manifest or extraction artifact instead of speculative interpretation.

## Progress Highlights
- **Bridged intro coverage:** The `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt` manifest now stitches together native state from `ballistic_a39c` through the Mode 7 `01:9FE5` callback family up to frame `1093`. Frames `1030..1037` land at `0,0,0,0,4,3,0,0` mismatched pixels versus Mesen `main_visible`, `1038..1045` land at `6,6,9,12,13,11,16,15`, `1046..1053` land at `13,13,16,18,18,18,17,14`, `1054..1061` land at `14,14,15,16,19,20,21,22`, `1062..1069` land at `25,26,26,21,26,23,23,25`, `1070..1077` land at `29,27,26,28,34,33,39,32`, `1078..1085` land at `41,41,47,47,58,63,60,69`, and the newly promoted `1086..1093` block lands at `89,92,89,90,102,115,144,129`.
- **Visible-state diagnostics:** `tools/out/visible_mode7_1094_1101.json` now captures one visible-scanline Mode 7 sample per frame for the next failing block, but replaying those values via `ppu_state_visible.json` sidecars makes the compares much worse: `362,414,606,700,1244,1515,3962,5930` mismatched pixels for `1094..1101`. The late-attract blocker is therefore not a simple stale-`ppu_state` issue.
- **Mode 7 composer decision:** We’re already using the `mode7-ppu` per-scanline compositor that replicates the SNES OBJ layering (see the `mode7-ppu` runtime code path referenced next to these manifests). That key decision keeps the runtime rendering aligned with the original pipeline instead of throwing away scanline behavior.
- **Runtime manifest tooling:** `tools/build_mode7_source_scene.py` now feeds the runtime manifest system, producing the hybrid bridge-visible playlist and the `intro_loop_hybrid_sequence.txt` alongside the bridge build. The manifest-based workflow is the plumbing that lets us swap between sampled PNG frames and deep native state without rewriting the SDL loop.
- **Visual validation assets:** Two ppm-converted PNGs demonstrate the current alignment: the Mode 7 bridge frame at `tools/out/bank1_mode7_visible_991.ppm` (converted to `docs/images/bank1_mode7_visible_991.png`) and the queue diff at `tools/out/intro_loop_hybrid_queue_00324_diff.ppm` (converted to `docs/images/intro_loop_hybrid_queue_00324_diff.png`). These support the visual reference that designers need.

## Challenges & Next Steps
- Frame coverage beyond `1093` is the immediate unknown. The current manifest now plays native `snes_bg` scenes through `1093`, so the next block begins at sampled frame `1094` and needs the same bridge-extracted treatment or a callback-level builder.
- Closing the `958..977` bootstrap window still depends on perfecting the `L00A00C` scene builder (especially the DMA uploads in the `tools/out/intro_bootstrap_974_*` queue artifacts) so the transition into the Ballistic `A39C` state has no mismatched pixels. That sequence must be documented and automated before the runtime can claim “native attract full loop”.
- The documentation drive (bank 0 flow plus scheduler analysis) remains ongoing; the next step is to formalize callback sequencing for `RESET → NMI → main loop` in `docs/bank0_flow.md` while the `docs/technical_overview.md` keeps track of these dependencies.

## Stack & Environment
- **Runtime:** C11 + SDL2 for window/input/audio with a 256×224 software framebuffer presented via SDL textures and scalable output.
- **Toolchain:** WLA-DX for disassembly (`main.s`, `bank*.asm`), and the build artifacts (`game.smc`, `game.sym`) remain the authoritative reference for data layouts.
- **Validation:** Mesen-S for captures, Lua automation for input logs/PNGs, and the manifest-driven `tools/` scripts to reproduce VRAM/CGRA/OAM trips for the intro loop.
- **Dev constraints:** No strategic detours—everything feeds back into the port plan, so the tooling, manifest, runtime, and validation workstreams all stay synchronized.

## Visual Artifacts
![Mode 7 bridge reference](docs/images/bank1_mode7_visible_991.png)
*Mode 7 bridge frame from the `01:9FE5` callback series (converted from `tools/out/bank1_mode7_visible_991.ppm`).*

![Queue diff comparison](docs/images/intro_loop_hybrid_queue_00324_diff.png)
*Diff snapshot showing queue-based bootstrap convergence (converted from `tools/out/intro_loop_hybrid_queue_00324_diff.ppm`).*

## Example Manifest Snippet
```plaintext
# type duration_frames path_a [path_b path_c path_d]
ballistic_a39c 304 ballistic_callback/ballistic_a39c.txt
image 20 intro_loop_sequence_images/frame_00958.ppm
snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin
snes_bg 1 mesen_range_998_1005_v1/frame_00998/vram.bin mesen_range_998_1005_v1/frame_00998/cgram.bin mesen_range_998_1005_v1/frame_00998/ppu_state.json mesen_range_998_1005_v1/frame_00998/oam.bin
snes_bg 1 mesen_range_1038_1045_v1/frame_01038/vram.bin mesen_range_1038_1045_v1/frame_01038/cgram.bin mesen_range_1038_1045_v1/frame_01038/ppu_state.json mesen_range_1038_1045_v1/frame_01038/oam.bin
snes_bg 1 mesen_range_1046_1053_v1/frame_01046/vram.bin mesen_range_1046_1053_v1/frame_01046/cgram.bin mesen_range_1046_1053_v1/frame_01046/ppu_state.json mesen_range_1046_1053_v1/frame_01046/oam.bin
snes_bg 1 mesen_range_1054_1061_v1/frame_01054/vram.bin mesen_range_1054_1061_v1/frame_01054/cgram.bin mesen_range_1054_1061_v1/frame_01054/ppu_state.json mesen_range_1054_1061_v1/frame_01054/oam.bin
snes_bg 1 mesen_range_1062_1069_v1/frame_01062/vram.bin mesen_range_1062_1069_v1/frame_01062/cgram.bin mesen_range_1062_1069_v1/frame_01062/ppu_state.json mesen_range_1062_1069_v1/frame_01062/oam.bin
snes_bg 1 mesen_range_1070_1077_v1/frame_01070/vram.bin mesen_range_1070_1077_v1/frame_01070/cgram.bin mesen_range_1070_1077_v1/frame_01070/ppu_state.json mesen_range_1070_1077_v1/frame_01070/oam.bin
snes_bg 1 mesen_range_1078_1085_v1/frame_01078/vram.bin mesen_range_1078_1085_v1/frame_01078/cgram.bin mesen_range_1078_1085_v1/frame_01078/ppu_state.json mesen_range_1078_1085_v1/frame_01078/oam.bin
snes_bg 1 mesen_range_1086_1093_v1/frame_01086/vram.bin mesen_range_1086_1093_v1/frame_01086/cgram.bin mesen_range_1086_1093_v1/frame_01086/ppu_state.json mesen_range_1086_1093_v1/frame_01086/oam.bin
image 4 intro_loop_sequence_images/frame_01094.ppm
```

The manifest is the runtime’s “scripted intro” that interleaves native CGRAM/VRAM dumps, sampled imagery, and Mode 7 buffers. It is fed by `tools/build_mode7_source_scene.py` and is the basis for the SDL runtime to reproduce the currently validated segment.
