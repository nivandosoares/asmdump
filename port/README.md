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
- `Td2PpuState` shadow seeded from extracted design packs
- exact-reference bootstrap that presents `main_visible.ppm`
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
./port/test_regression.sh
```

Notes:

- `../zelda3/` and `../sentrysearch/` are local investigation aids only and
  are intentionally ignored by the repo git.
- The current renderer prefers exact extracted visible layers so the host,
  asset loading, and validation spine can stabilize before the synthetic PPU
  path replaces the bootstrap.
