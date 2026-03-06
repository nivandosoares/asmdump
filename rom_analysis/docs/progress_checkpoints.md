# ROM Archaeology Progress Checkpoints

Snapshot date: `2026-03-06`

This file tracks plan progress as checkpoints with objective evidence and the
next gate needed to advance.

## Plan Position (Across All Lanes)

| Lane | Status | Completion read |
|---|---|---|
| Lane 1: Bank30 compression provenance | active | core pipeline is in place; unresolved targets remain |
| Lane 2: Mesen tile/sprite/tilemap design handoff | active | extraction + design packs are operational and proofed |
| Lane 3: Gameplay-era frame archaeology | queued | no deterministic gameplay capture window committed yet |
| Lane 4: Bank API contracts (30/10/11) | queued | baseline hypotheses documented, contracts not yet proven |

## Completed Checkpoints

### CP-01: Bank30 decode support baseline

- Added `67FB` decode support in `tools/decompress_td2_chunk.py`.
- Added candidate validation tool:
  - `tools/validate_td2_chunks.py`
- Evidence:
  - `tools/out/bank30_chunk_validation.json`
  - `rom_analysis/docs/bank30_decompression_report.md`

### CP-02: Runtime dispatcher trace for `L001210`

- Added trace path in `validation/mesen_probe_boot.lua` for entry-time
  `$0C/$0E/$10` capture.
- Added summarizer:
  - `tools/summarize_l001210_trace.py`
- Evidence:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/td2_boot_probe_l001210_summary.json`

### CP-03: Consolidated unresolved queue registry

- Added registry builder:
  - `tools/build_bank30_chunk_registry.py`
- Added make targets in `tools/Makefile`:
  - `bank30-headers`, `bank30-validate`, `l001210-probe`,
    `l001210-trace-summary`, `bank30-registry`
- Evidence:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`

Current unresolved queue (from registry):

- `P0`: `1E:E91F` (`67FB`, decode fail)
- `P0`: `1E:EE7F` (`26FB`, table-confirmed unseen at runtime)
- `P1`: `1E:DA96` (`67FB`, overlap-window unseen at runtime)
- `P2`: `1E:9681` (`42FB`, sentinel candidate unseen at runtime)

### CP-04: Design-team asset handoff proof

- Added design-pack tools:
  - `tools/build_mesen_design_pack.py`
  - `tools/build_mesen_design_pack_range.py`
- Proof bundles created:
  - `port/assets/test_dump_frame300`
  - `port/assets/test_dump_range_1086_1093`
- Workbench doc:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

## Current Checkpoint Metrics

- `L001210` no-input attract probe (`3600` frames):
  - total hits: `34`
  - runtime-confirmed bank30 starts:
    - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800`
  - repeat spacing: `1418` frames
- Alternate scripted input (`start,b`, `4000` frames):
  - total hits: `2` (`02:F51F`, `04:8000`)
  - no bank30 candidates reached

## Next Advancement Gates

### Gate G1 (Immediate): close P0 unresolved queue

Goal:
- observe `1E:EE7F` on runtime path and resolve `1E:E91F` decode/runtime state.

Definition of done:
- `tools/out/bank30_chunk_registry.json` no longer lists unresolved `P0`.

### Gate G2: tilemap provenance binding for first frame window

Goal:
- produce `frame/layer/tile-index -> ROM chunk` mapping for `1086..1093`.

Definition of done:
- provenance table added to:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`

### Gate G3: gameplay-era archaeology start

Goal:
- capture first deterministic gameplay window with design pack + runtime context.

Definition of done:
- one committed gameplay window with:
  - frame range assets
  - callback/context notes
  - initial bank10/bank11 contract pointers
