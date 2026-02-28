# TD2 Port Runtime Skeleton

This directory contains the first PC runtime skeleton for the SNES-to-PC port.

Current scope:

- SDL2 window and renderer
- fixed-timestep 60 Hz main loop
- 256x224 framebuffer presentation
- palette JSON loader for bank 3 experiments
- palette swatch and gradient viewer
- PPM image viewer for extracted assets

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
```

This writes `./port/build/frame_00000.ppm`.
