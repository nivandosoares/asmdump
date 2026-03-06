# ROM Archaeology Workspace

This directory is the focused workspace for gameplay-era ROM archaeology.
It is organized around the next blocked milestone in the project:
mapping the callback chain from front-end code into gameplay logic.

## Scope

- Confirm the control-flow handoff from bank 0 scheduler callbacks into gameplay.
- Document bank 30 dispatch entry points and contracts.
- Trace bank 10 physics/AI state inputs and outputs.
- Trace bank 11 road/rasterizer data dependencies.
- Build extractable assets for maps, graphics, and audio in reusable formats.

## Layout

- `code/`: reverse-engineered assembly notes by subsystem (`main_loop`, `render`, `physics`).
- `graphics/`: extracted graphics candidates (tilesets, sprites, UI).
- `maps/`: extracted track and tilemap candidates.
- `audio/`: SPC traces and decoded sample assets.
- `docs/`: high-level memory map, engine sequencing notes, and execution roadmap.

## Immediate Next Steps

Detailed execution checklist: `rom_analysis/docs/next_steps_roadmap.md`.
Progress checkpoints: `rom_analysis/docs/progress_checkpoints.md`.

1. Main-loop handoff map (bank 0 -> bank 30):
   - find first writes to `$096C-$0971` that target bank 30 addresses.
   - record state predicates for each callback transition.
2. Bank 30 API map:
   - catalog RTL entry points and caller banks.
   - classify each entry as dispatch/service/render/audio/input.
3. Bank 10 physics contract:
   - map RAM addresses read/written by external bank 10 entry points.
   - derive a C-struct draft for core physics state.
4. Bank 11 render contract:
   - map road/rasterizer table formats and frame outputs.
   - confirm dependencies on bank 10 and bank 30.
5. Content extraction lane:
   - track/text extraction from bank 4.
   - track/scenario extraction for gameplay maps.
   - audio path from SPC traces to runtime playback metadata.
6. Design tooling lane:
   - keep Mesen debugger extraction as the source of truth for tilemap/tiles/sprite inspection.
   - package per-frame design bundles with `tools/build_mesen_design_pack.py`.
   - package frame windows with `tools/build_mesen_design_pack_range.py` for design timeline review.
   - use `tilemaps/bg*_tilemap.json` and `sprites/sprites_visible.json` for draw-ready inspection metadata.

## Useful Commands

```sh
# Compression/data-structure scan by bank
python3 tools/scan_structured_bank.py game.smc --bank 10 --json-out tools/out/bank10_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 11 --json-out tools/out/bank11_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 30 --json-out tools/out/bank30_chunks.json

# Header manifest scan for compressed blocks
python3 tools/extract_compression_header_manifest.py game.smc --bank 10 --json-out tools/out/bank10_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 11 --json-out tools/out/bank11_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json

# Fast call-site hunting in disassembly
rg -n "jsl|jsr|jmp \\[" bank0.asm bank10.asm bank11.asm bank30.asm

# Runtime provenance for L001210 chunk dispatch (no-input attract loop)
make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90
make -C tools l001210-trace-summary
make -C tools bank30-registry
```
