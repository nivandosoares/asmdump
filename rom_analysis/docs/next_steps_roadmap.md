# ROM Archaeology Next Steps

This roadmap is the direct follow-up after enabling Mesen design packs with
decoded tilemaps and sprite visibility metadata.

## Current Status Snapshot (2026-03-06)

Checkpoint log: `rom_analysis/docs/progress_checkpoints.md`.

| Roadmap lane | Status | Current reading |
|---|---|---|
| 1. Consolidate `67FB` coverage | in progress | Decoder + runtime tracing + consolidated registry are done; unresolved queue remains (`E91F`, `EE7F`, `DA96`, `9681`). |
| 2. Tilemap-to-ROM provenance | in progress | Design-pack tooling and proof exports are done; direct frame/layer/tile-index -> chunk mapping is pending. |
| 3. Gameplay-frame expansion | not started | Intro/attract windows are covered; deterministic gameplay capture windows are not yet extracted. |
| 4. Bank API contracts | not started | Baseline docs exist; callback/API contracts for bank 30/10/11 are not yet mapped to completion. |

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
  - `make -C tools l001210-trace-summary`
  - Current no-input attract coverage confirms `DF6C/E039/E73F/E800` and leaves `DA96/E91F/EE7F` unresolved.
  - `start,b` scripted-input probe (`4000` frames, input from frame `240`) currently yields only early `42FB` hits and no bank30 coverage.
- Consolidated chunk registry:
  - `make -C tools bank30-registry`
  - Current status counts:
    - `runtime-confirmed`: `4`
    - `decode-fail`: `1` (`1E:E91F`)
    - `table-confirmed-unseen`: `1` (`1E:EE7F`)
    - `67fb-unseen`: `1` (`1E:DA96`)
    - `candidate-unseen`: `1` (`1E:9681`)
- Export outputs under:
  - `rom_analysis/graphics/tilesets/`
  - `rom_analysis/maps/tilemaps/`
- Update `rom_analysis/docs/bank30_decompression_report.md` with signatures and inferred payload types.

## 2. Build Tilemap-to-ROM Provenance

Goal: tie frame-visible tilemap entries back to ROM/chunk origin.

- For target windows (start with `1086..1093`):
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/mesen_range_1086_1093_v1`
- For each frame pack:
  - use `tilemaps/bg*_tilemap.json` and `tilesets/tiles_bg*.json` to map live tile indices to CHR bases.
- Produce a provenance table:
  - `frame -> layer -> tile index range -> chr base -> candidate ROM chunk`
- Save outputs in:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`

## 3. Expand Into Gameplay Frames

Goal: move from intro archaeology to gameplay-era assets.

- Capture deterministic gameplay frame windows via Mesen extractor.
- Build design packs for those windows:
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/<gameplay_range_dir>`
- Classify extracted assets:
  - road surfaces and horizon tiles -> `rom_analysis/graphics/tilesets/`
  - HUD/UI elements -> `rom_analysis/graphics/ui/`
  - dynamic objects/sprites -> `rom_analysis/graphics/sprites/`

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
