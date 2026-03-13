# ROM Archaeology Next Steps

This roadmap is the direct follow-up after enabling Mesen design packs with
decoded tilemaps and sprite visibility metadata.

## Current Status Snapshot (2026-03-13)

Checkpoint log: `rom_analysis/docs/progress_checkpoints.md`.

| Roadmap lane | Status | Current reading |
|---|---|---|
| 1. Consolidate `67FB` coverage | in progress | Decoder + runtime tracing + consolidated registry + matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps are done; targeted `B1F9` prologue traces now prove forced entry context, but unresolved queue still remains (`E91F`, `EE7F`, `DA96`, `9681`). |
| 2. Tilemap-to-ROM provenance | in progress | First committed mapping exists for `1086..1093`; next step is to expand beyond the initial window and raise confidence where mapping is currently carry/forward inferred. |
| 3. Gameplay-frame expansion | not started | Intro/attract windows are covered; deterministic gameplay capture windows are not yet extracted. |
| 4. Bank API contracts | not started | Baseline docs exist; callback/API contracts for bank 30/10/11 are not yet mapped to completion. |

Validation contract baseline:

- `validation/regression_gates_intro.jsonc`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `rom_analysis/docs/validation_gates.md`
- Latest run status: callback contracts `18/18` pass; regression gates `6/6` pass.

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
  - `make -C tools l001210-probe-matrix L001210_MATRIX_TOTAL_FRAMES=1500`
  - `make -C tools l001210-trace-summary`
  - Current no-input attract coverage confirms `DF6C/E039/E73F/E800` and leaves `DA96/E91F/EE7F` unresolved.
  - `start,b` scripted-input probe (`4000` frames, input from frame `240`) currently yields only early `42FB` hits and no bank30 coverage.
  - matrix v1 (`4` scenarios, `1500` frames each) also leaves `DA96/E91F/EE7F` unresolved and shows one strong suppression path with `0` bank30 hits (`periodic_start_pulses_240_1800`).
  - matrix v2 (`13` scenarios, `3200` frames each) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`) and only increases hit density on already-confirmed `DF6C/E039/E73F/E800` (peak `pulse_b_every120`: `20` bank30 hits).
  - matrix v3 (`7` scenarios, `45000` frames aggregate) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`); strongest positive run remains no-input (`8000` frames, `12` bank30 hits).
  - matrix v5 (`12` scenarios, `48000` frames aggregate; timed `start`/`start,b` pulses) still leaves all unresolved candidates untouched (`E91F/EE7F/DA96/9681`) and shows no new caller coverage (`01:B256/B273/B59B` still unseen).
  - matrix v6 (`3` scenarios, `12000` frames aggregate) adds callsite-index telemetry: observed `L00A9*` indices are `0/4/5/6/15/28/29/34`; unresolved `EE7F` index `32` is still unseen.
  - matrix v7 forced-branch tests (`5` scenarios, `20000` frames aggregate) force `$1C78/$1C80/$1CA8 = 1/0/2` (including `B1F9` exec-point forcing), but still do not produce index `32` or `EE7F`.
  - matrix v10a/v10b caller-family sweeps (`16` scenarios, `117000` frames aggregate) add non-`L00A9*` callsite coverage (`01:8E3C/01:8E59`) and expand observed `L00A9*` indices (`7/8/9/10/11/22/25`), but still do not reach `01:B256/B273/B59B` or unresolved sources.
  - matrix v11/v11b `01:9016` sequence follow-ups (`16` scenarios, `200000` frames aggregate) keep a fixed bank30 profile (`12` hits per scenario, only `DF6C/E039/E73F/E800`) and still do not reach `01:B256/B273/B59B`.
  - matrix v12/v12b precondition forcing (`8` scenarios, `72000` frames aggregate) confirms selector/state forcing applies but still yields `b1f9_exec_count = 0` in that lane.
  - matrix v13 callback activation (`5` scenarios, `16000` frames aggregate) forces active callback to `01:9568/01:95AD`; callback+state variants reach `B1F9` once (`frame 1201`) but still do not produce `01:B256/B273/B59B` `L001210` hits.
  - matrix v14 stage trace (`3` scenarios, `6600` frames aggregate) confirms forced lanes still report `b1f9_exec_count = 1` but show no `B1F9` internal stage progress (`B226/B256/B273/B59B` all `0`).
  - targeted prologue exec traces (`2200` frames each, forced `01:9568` and `01:95AD`) record only the `01:B1F9` entry at frame `1201`; no exec hits are yet observed at `00:050F`, `00:083F`, return sites `01:B202/01:B206`, or inner stages `01:B226/B256/B273/B59B`.
  - targeted side-effect traces over the same forced lanes and frame window (`1200..1202`) also record no writes at the expected helper/setup sites (`HDMAEN`, `$0966/$0968`, `$0974`, `BGMODE/BGxSC/BG12NBA`, `$0F42`, `TMAIN`, `OBJSEL`, or the `L00052E` window/color-math resets).
  - stack-return tracing now proves the forced entries are real in-bank calls:
    - forced `01:9568` reaches `L00B1F9` with `stack_return_rts = 0x9575` (`L009575`)
    - forced `01:95AD` reaches `L00B1F9` with `stack_return_rts = 0x95B7`
    - both lanes also carry the same deeper stack anchor `0x82A0`, matching the
      bank-0 callback-dispatch wrapper before `jmp [$0038]`
  - corrected exec-point tracing now honors the configured trace-frame window.
  - corrected late-window `01:9568` trace (`1200..1202`) records:
    - `00:82A1` at frame `1200`
    - `01:B1F9` at frame `1201`
    - no `01:9575` hit in that immediate window
  - caller/frame-state reconciliation is now tighter:
    - frame snapshots still hold the forced pre-call tuple
      `$1C78/$1C80/$1CA8 = 1/0/2`
    - but the corrected `01:B1F9` exec snapshot sees `$1CA8 = 3`
    - static bank-1 caller reads explain that delta because both `L009568` and
      `L0095AD` do `inc $1CA8` before `jsr L00B1F9`
  - lane-specific difference:
    - forced `01:9568` enters with `$0F77 = 1`
    - forced `01:95AD` enters with `$0F77 = 0`
  - static `L00B1F9` reading now shows the missing immediate return is not the
    right bottleneck:
    - after setup, the routine can enter longer wait/worker loops at
      `L00B638` / `L00B6E3` before it reaches `L00B755` and returns
  - combined v10/v11/v12/v13/v14 telemetry still shows bank30 producers only from `01:A9BD/01:A9E1` with `L00A9` indices `28/29`; unresolved index `32` remains unseen.
  - immediate follow-up should pivot from immediate-return watchpoints to the
    `L00B638` / `L00B6E3` wait/exit surface, or to manual debugger
    verification there, because the real dispatcher-driven
    `01:9568/01:95AD -> 01:B1F9` path can legitimately stay inside `L00B1F9`
    longer than a `1200..1202` return window.
  - trace payload now includes selector fields (`$1C78/$1C80/$1CA8/$1CAC/$1CAE`) per hit, which confirms the `L00B1F9` dynamic-index branch condition for `EE7F` (`$1C80 < $1CA8` with `$1C78 = 1`) is not active during the observed no-input bank30 hit windows.
  - trace payload now also includes `selector_1c86` and `state_1d10`, plus probe-level `b1f9_exec_count/b1f9_exec_frames`, `b1f9_stage_counts/b1f9_stage_frames`, and main-callback forcing controls for targeted control-flow tests.
  - trace payload now also includes caller CPU regs and derived `L00A9A0/L00A9CB` index/source fields (`caller_l00a9_*`), with no mismatches seen across v10/v11 sweeps (`1645/1645` matches where present).
  - savestate-targeted matrix lane is currently blocked in this environment: `--testRunner` exposes savestate load but no callable save API on `emu`.
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

- Closed first window deliverable:
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
  - generated via `tools/build_tilemap_chunk_provenance.py` with runtime trace + bank13 validation binding
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
