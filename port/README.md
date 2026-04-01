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
  and seeded PPU-state contract checks
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

Notes:

- `../zelda3/` and `../sentrysearch/` are local investigation aids only and
  are intentionally ignored by the repo git.
- The promoted smoke fixtures now render exactly from raw state in the native
  runtime; `layers/main_visible.ppm` remains a regression golden, not the
  render source.
- The compare JSON now carries `state_contract`, so `--fail-on-compare-diff`
  fails on both pixel drift and semantic drift in the seeded scene state.
- `tools/push_checkpoint.sh` is the repo-local wrapper for the post-push step:
  it pushes the current checkpoint, refreshes the curated wiki, and issues a
  follow-up wiki refresh commit/push only if the generated wiki changed and
  the worktree is otherwise clean enough to avoid mixing unrelated changes.
