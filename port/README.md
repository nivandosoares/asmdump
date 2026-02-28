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
- sequence playback for extracted intro/front-end scenes

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
./port/build/td2_port --sequence ./tools/out/intro_loop_sequence.txt
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
./port/build/td2_port --headless --sequence ./tools/out/intro_loop_sequence.txt --sequence-no-loop --frames 1418 --dump-prefix ./port/build/intro_loop
```

This writes `./port/build/frame_00000.ppm` or `./port/build/credits_00000.ppm`.

The SNES BG path accepts either a shared prefix or explicit files:

```sh
./port/build/td2_port --snes-bg-prefix ./tools/out/bank1_credits_scene

./port/build/td2_port \
  --snes-bg-vram ./tools/out/bank1_credits_scene_vram.bin \
  --snes-bg-cgram ./tools/out/bank1_credits_scene_cgram.bin \
  --snes-bg-state ./tools/out/bank1_credits_scene_ppu_state.json
```

This uses the extracted VRAM/CGRAM/state directly and renders the BG layers inside the SDL runtime, without going through a prebuilt PPM.

That same path now supports Mode 7 BG scenes from live Mesen dumps:

```sh
./port/build/td2_port \
  --snes-bg-vram ./tools/out/td2_boot_probe_vram_1080.bin \
  --snes-bg-cgram ./tools/out/td2_boot_probe_cgram_1080.bin \
  --snes-bg-state ./tools/out/td2_boot_probe_ppu_state_1080.json
```

Sequence manifests are simple text files. Each line is one playback entry:

```txt
# type duration_frames vram_path cgram_path ppu_state_path
snes_bg 4 frame_00654/vram.bin frame_00654/cgram.bin frame_00654/ppu_state.json
```

Paths can be relative to the manifest itself. This is the current path for sampled intro playback such as the `Ballistic presents` splash.

The current exact no-input intro-loop milestone uses an `image` sequence built from Mesen screenshots:

```txt
image 4 intro_loop_sequence_images/frame_00654.ppm
```

That is intentionally a sampled playback milestone, not yet a native reimplementation of the front-end callbacks.
