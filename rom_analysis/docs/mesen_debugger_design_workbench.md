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

It repacks a raw frame dump into:

- `layers/`
- `tilemaps/` (decoded per-cell tile index/palette/flip/priority JSON+CSV)
- `tilesets/`
- `sprites/`
- `palette/`
- `raw/`
- `design_pack.json` (single manifest + quick `ppu_summary` + tilemap/sprite analysis refs)

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

## Gap to Close Next

1. Link decoded tilemap entries to ROM/chunk provenance tags for archaeology traceability.
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
