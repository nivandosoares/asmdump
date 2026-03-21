# ROM Archaeology Next Steps

This roadmap is the direct follow-up after enabling Mesen design packs with
decoded tilemaps and sprite visibility metadata.

## Current Status Snapshot (2026-03-20)

Checkpoint log: `rom_analysis/docs/progress_checkpoints.md`.

| Roadmap lane | Status | Current reading |
|---|---|---|
| 1. Consolidate `67FB` coverage | in progress | Decoder + runtime tracing + consolidated registry + matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps are done; registry tightening now demotes `9681` to `sentinel-control` and `E91F` to `nested-invalid-marker`, leaving active unresolved queue (`EE7F`, `DA96`). |
| 2. Tilemap-to-ROM provenance | in progress | Contiguous provenance still covers `1086..1117`, the later direct-hit cluster `7051/7059/7064` is now packaged with exact provenance anchors, and the planned `7055/7061` interior carry check is currently blocked by a live timed-input bridge timeout regression on the local Mesen setup. |
| 3. Gameplay-frame expansion | in progress | refreshed sweep `v2_current` keeps `b_hold` as the only dynamic seed lane; visible-phase scanline sampling now explains the screenshot-vs-end-frame split, the queue-cursor equalization path is directly observed through frames `90..92`, and the remaining edge is the frame-`91` `0x14B8` burst plus the frame-`92` reset while the active `0600` queue stays empty. |
| 4. Bank API contracts | not started | Baseline docs exist; callback/API contracts for bank 30/10/11 are not yet mapped to completion. |

Validation contract baseline:

- `validation/regression_gates_intro.jsonc`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `rom_analysis/docs/validation_gates.md`
- Latest run status: callback contracts `18/18` pass; regression gates `6/6` pass.

## Execution Reset (2026-03-19)

The repo is now following a `90`-step cleanup/refocus plan alongside the
existing archaeology lanes.

Lane order stays the same. The difference is that the next concrete steps are
now constrained by a cross-cutting cleanup track:

1. Repo hygiene and portability baseline:
   - fix ignore policy
   - untrack generated bridge/emulator outputs
   - remove hard-coded personal Mesen paths from promoted scripts/Makefiles
   - keep a repo-owned cleanup target for disposable build/scratch output and
     debugger coverage junk instead of letting those surfaces accumulate
2. Renderer correctness fixes with targeted tests:
   - mirrored OBJ regression is now covered by the generated
     `check_obj_vertical_flip.py` fixture across Python simple, Python
     `mode7-ppu`, and SDL runtime paths
   - BG4 and tile-priority are now covered by the generated
     `check_bg_layer_priority.py` fixture across the Python renderer and SDL
     runtime
3. Contract and validation hardening:
   - schemas
   - address registry
   - checkpoint IDs
   - per-run validation output isolation
4. Continue intro archaeology in parallel:
   - `958..977` bootstrap
   - `986+` final-screen composition gap
   - callback-family replacement beyond `1093`
   - the new `intro-oam-deltas` target now proves the late probe-vs-bridge OAM fork at `986/990` and the absence of a distinct committed OAM fork at `994`

Immediate concrete step after the cleanup kickoff:

- repo hygiene now suppresses default `tools/out` status noise and the cleanup
  target also removes obvious untracked `tmp*` / `test_*` scratch output
  without touching tracked evidence-bearing archaeology families
- promoted scripts/Makefiles and the main tooling READMEs now avoid hard-coded
  personal Mesen paths, and `make -C tools portability-path-check` guards that
  surface against regression
- the promoted boot-probe path now defaults to repo-owned outputs:
  - `validation/mesen_probe_boot.lua` accepts `TD2_BOOT_PROBE_OUTPUT_PREFIX`
  - `make -C tools l001210-probe` and `l001210-save-savestate` now default to
    `tools/out/td2_boot_probe*` instead of shared `LuaScriptData`
  - `tools/run_l001210_probe_matrix.py` now writes per-scenario probe outputs
    directly under its run directory instead of copying them out of shared
    emulator state
- the committed scanline validation path now follows the same policy:
  - `validation/run_mesen_capture.sh` now prepares
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX`
  - `tools/capture_visible_mode7_range.py` now defaults its raw probe JSON to
    a repo-owned per-run prefix derived from `--output` instead of shared
    `LuaScriptData`
- finish the remaining cleanup hardening next:
  - keep moving validation toward per-run output isolation beyond the boot
    probe path instead of mutable shared `LuaScriptData`
- keep the renderer correctness track moving after the mirrored-OBJ fix:
  - preserve the new BG4/tile-priority pass ordering while the next renderer
    slice moves on to remaining composition gaps
- keep intro-side work moving in parallel through the cleaned workflow:
  - `958..977` bootstrap
  - `986+` final-screen composition gap
  - use the new `tools/out/intro_oam_deltas/` reports as the current OAM source of truth before changing late-frame renderer/compositor behavior

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
  - widened per-point-capped wait/exit tracing (`1200..1800`) still records only:
    - `01:B1F9` once at frame `1201`
    - no `01:B226`, `01:B638`, `01:B6E3`, `01:B755`, or `01:9575`
    - `exec_point_trace.dropped_hits = 0`
  - widened WRAM write tracing around the expected wait-path state (`1200..1800`) also stays flat:
    - no writes at `7E:0960`, `7E:0964`, `7E:0200`, `7E:0202`, `7E:1E2C`,
      `7E:0440`, `7E:0442`, `7E:0444`, or `7E:040A`
    - nearby frame snapshots remain stable at `$0960 = 0`, `$0200 = 0`,
      `$0202 = 1`, `$1E2C = 0`, `$0440/$0442/$0444 = 0/0/0`
  - combined v10/v11/v12/v13/v14 telemetry still shows bank30 producers only from `01:A9BD/01:A9E1` with `L00A9` indices `28/29`; unresolved index `32` remains unseen.
  - immediate follow-up should now pivot away from more headless `B1F9`
    probing:
    - use manual debugger confirmation if you want to keep pressing this lane
    - otherwise move to the next unblocked roadmap lane in headless mode
  - trace payload now includes selector fields (`$1C78/$1C80/$1CA8/$1CAC/$1CAE`) per hit, which confirms the `L00B1F9` dynamic-index branch condition for `EE7F` (`$1C80 < $1CA8` with `$1C78 = 1`) is not active during the observed no-input bank30 hit windows.
  - trace payload now also includes `selector_1c86` and `state_1d10`, plus probe-level `b1f9_exec_count/b1f9_exec_frames`, `b1f9_stage_counts/b1f9_stage_frames`, and main-callback forcing controls for targeted control-flow tests.
  - trace payload now also includes caller CPU regs and derived `L00A9A0/L00A9CB` index/source fields (`caller_l00a9_*`), with no mismatches seen across v10/v11 sweeps (`1645/1645` matches where present).
  - savestate-targeted matrix lane is currently blocked in this environment: `--testRunner` exposes savestate load but no callable save API on `emu`.
- Consolidated chunk registry:
  - `make -C tools bank30-registry`
  - Current status counts:
    - `runtime-confirmed`: `4`
    - `table-confirmed-unseen`: `1` (`1E:EE7F`)
    - `67fb-unseen`: `1` (`1E:DA96`)
    - `nested-invalid-marker`: `1` (`1E:E91F`)
    - `sentinel-control`: `1` (`1E:9681`)
  - active unresolved queue is now only:
    - `P0`: `1E:EE7F`
    - `P1`: `1E:DA96`
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
- Closed second contiguous window deliverable:
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
  - generated from `tools/out/design_mesen_range_1094_1101_v1` with preserved
    `L001210` runtime hits at `1088/1096/1101` plus bank13/bank7 validation binding
- Closed carry-covered continuation deliverables:
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.md`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`
  - generated from `tools/out/design_mesen_range_1102_1109_v1` and
    `tools/out/design_mesen_range_1110_1117_v1` with preserved bank-7 carryover
    from the direct `1101` `07:C112` hit
- Current window reading:
  - `bg1` remains the visible main-screen layer through `1117`
  - the tile-index set stays fixed at `144` indices / `22` ranges with
    `chrBaseWords = 0x2000`
  - runtime chunk provenance steps across that same visible block:
    - `1094..1095` -> `0D:C4DC`
    - `1096..1100` -> `07:BF49`
    - `1101..1117` -> `07:C112`
  - confidence boundary:
    - `1117` is the current headless edge because it is `frame_delta = 16` from
      the direct `1101` hit and the preserved `periodic_start_pulses_240_1800`
      trace has no later direct hit after `1101`
- For target windows (start with `1086..1093`):
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/mesen_range_1086_1093_v1`
- For each frame pack:
  - use `tilemaps/bg*_tilemap.json` and `tilesets/tiles_bg*.json` to map live tile indices to CHR bases.
- Produce a provenance table:
  - `frame -> layer -> tile index range -> chr base -> candidate ROM chunk`
- Save outputs in:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`
- Immediate follow-up:
  - do not extend blindly past `1117` on carryover alone
  - recovered later-scene deliverables:
    - `tools/out/l001210_probe_7051_inputfix_summary.json`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.md`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.md`
    - `tools/out/l001210_probe_7051_inputfix_summary.json`
  - the timed input-window bridge now succeeds on the previously blocked
    scenario `6800:start;6900-6920:start,a`
  - the matching targeted probe restores the later direct-hit cluster, and the
    extracted design packs keep the same visible layer/tile-index block across
    those exact hits:
    - `7051` -> `0D:C4DC`
    - `7059` -> `07:BF49`
    - `7064` -> `07:C112`
  - current decision:
    - this is enough to close exact anchors, but not enough to claim a full
      `7051..7064` contiguous window because the source rotates at each direct
      hit and the interior frames are still unextracted
  - the planned minimal interior carry check is now blocked again in the
    current local bridge environment:
    - `python3 tools/extract_mesen_scene_range.py ... --start-frame 7055
      --end-frame 7061 --step 6 --frame-timeout-seconds 180` timed out waiting
      for frame `1762` before the late input window
    - `MESEN_RELEASE_DIR=... ./tools/run_mesen_ppu_extract.sh ... --frame 7055
      --frame-timeout-seconds 300` timed out earlier at frame `411`
    - both retries only produced scratch `.mesen-home` directories and no frame
      assets
  - the next best step is now compatibility-focused instead of provenance-
    promotion-focused:
    - pin or recover a known-good `Mesen`/`MesenCore.so` pair for the timed-
      input extractor bridge
    - once that bridge is healthy again, rerun `7055` and `7061` before
      claiming the full `7051..7064` contiguous window

## 3. Expand Into Gameplay Frames

Goal: move from intro archaeology to gameplay-era assets.

- Closed first deterministic seed-window deliverable:
  - `rom_analysis/maps/tracks/track1_seed_0086_0093.md`
  - `tools/out/track1_seed_0086_0093_v2.json`
  - `tools/out/track1_seed_0086_0093_v2_sequence.txt`
  - `tools/out/track1_seed_0086_0093_v2_sequence.json`
- Closed seeded sweep deliverable:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v1.md`
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`
- Current gameplay reading:
  - `.mesen-config/Mesen2/SaveStates/game_11.mss` is a usable deterministic
    track-start seed
  - bounded scripted-input sweep result:
    - `b_hold` first becomes nontrivial at frame `76` and moves again at `92`
    - `start_then_b_hold` stays a static seed after frame `64`
    - current refreshed sweep (`v2_current`) now also keeps `start_then_a_hold`
      static after its first nontrivial frame `64`
  - the old raw `86..93` `b`-hold dump is still exact against the screenshot
    harness, but that specific window remains static
  - the first early moving raw follow-up (`start_then_a_hold`, `61..68`) is now
    a documented blocker:
    - input scheduling is present in the dump summary
    - but the raw surface renders back as `bgMode = 0`,
      `mainScreenLayers = 0x00`
    - the dumper screenshot for frame `61` differs from the sweep screenshot by
      `51503` pixels and does not match nearby sweep frames either
  - the first screenshot-backed moving follow-up is now committed:
    - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
    - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
    - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
    - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`
    - it collapses frames `76..155` into `5` image entries / `4` distinct
      states
    - state changes land on a `16`-frame cadence at `76/92/108/124/140`
    - frame `140` repeats the frame-`76` image, giving a screenshot-backed
      `64`-frame cycle
  - the current blocker is now sharper:
    - raw dump artifacts `track1_b_hold_0086_0108_v1*` stay byte-identical
      across `86 -> 92` and `92 -> 108`
    - archived probe fields also stay flat at `86`, `92`, and `108`
    - deeper debugger follow-up now explains why:
      - visible-scanline sampling on frames `86`, `92`, and `108` runs under
        `active_main = 02:9016`
      - visible IRQ state alternates between `01:96A0` and `01:960D`
      - visible `ppu.mainScreenLayers` toggles between `0x13` and `0x17`
      - targeted late-scanline register tracing records the same
        `M7HOFS/M7VOFS/$210F-$2114` write set on every frame `86..108`
      - end-of-frame raw/probe still collapses back to `00:8029/00:835F` and
        `ppu.mainScreenLayers = 0x04`
    - practical read:
      - the screenshot-vs-raw split is now a phase split, not a missing
        gameplay lane
      - the remaining blocker is that the sampled visible-phase `PPU` state for
        `86`, `92`, and `108` still matches except for the visible-phase queue
        cursor pair `7E:0053/0054`
      - the added bank-1 producer-side WRAM/window/OAM fields also stay flat
        across those three frames
      - `cpu.d = 0` rules out a hidden direct-page base change
      - explicit visible-phase `v5` samples bind `00:0053/0054` to the same
        `7E:0053/0054` WRAM values, with frame `86` at `0x38/0x38` and frames
        `92/108` at `0x48/0x48`
      - the same `v5` queue summary shows `queue_dma_active_descriptor_count = 0`
        across all sampled visible scanlines even though `0600` still has
        `32` nonzero slots
      - mirrored-bank boot-probe exec tracing still reports `0` hits on the
        bank-0 queue helpers and bank-1/bank-2 queue producers
      - widened scanline-local tracing on frame `86` now reaches scanline `259`
        and catches an intermediate late write trio at frame `87`, scanline
        `228`: `00:0053/0055/0056 = 0x38/0x90/0x15` while `00:0054` stays
        `0x38` under `active_main = 02:9016`
      - frame-boundary follow-up now proves that same state survives frame
        `86 end`, frame `87 start`, the frame-`87` scanline wrap
        (`261 -> 0`), and at least through frame `87`, scanline `97`
      - wider multi-frame follow-ups now prove the same state also survives
        frame `87 end`, frame `88 start`, frame `88 end`, frame `89` start,
        and at least through frame `89`, scanline `96`
      - the same late write trio repeats on frames `88` and `89`, which makes
        this a recurring post-visible `02:9016` stage rather than a one-frame
        anomaly
      - shifted `88` follow-up now records the first direct visible-path
        `00:0054` producer:
        - frame `90`, scanline `30`: `00:0054 = 0x40`
        - frame `90`, scanline `54`: `00:0054 = 0x48`
        - `00:0053` still remains `0x38`
      - shifted `90` follow-up now records the next equalized gameplay state:
        - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
        - frame `91 start/end`:
          `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
        - frame `92 start`:
          `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
        - frame `91`, scanline `229`: `00:0053 = 0x48`,
          `00:0055/0056 = 0xB8/0x14`
        - frame `92`, scanline `227`: `00:0055/0056` resets to `0x90/0x15`
      - helper-side follow-up against nearby bank-1 sinks
        `7E:1E24/1E26/070C/0718` stays negative across that same `90..92`
        window
      - the older end-of-frame write trace still collapses later to
        `00:0053/0055/0056 = 0x00/0x84/0x17` under `active_main = 00:8029`
- Capture deterministic gameplay frame windows via Mesen extractor.
- Build design packs for those windows:
  - `make -C tools mesen-design-pack-range MESEN_RANGE_FRAMES_DIR=out/<gameplay_range_dir>`
- Classify extracted assets:
  - road surfaces and horizon tiles -> `rom_analysis/graphics/tilesets/`
  - HUD/UI elements -> `rom_analysis/graphics/ui/`
  - dynamic objects/sprites -> `rom_analysis/graphics/sprites/`
- Immediate follow-up:
  - do not spend more retries on the early `start_then_a_hold` raw mismatch;
    that blocker has already been narrowed three times without a changed
    boundary
  - next best headless path is now the visible-phase debugger lane:
    - trace the producer/reset path behind the frame-`91`
      `00:0053/0055/0056` burst and the frame-`92` return to
      `0x48/0x48/0x90/0x15` first
    - then return to the later `02:9016` -> `00:8029` collapse once the
      transient `0x14B8` visible state is explained
    - then extend scanline or targeted trace coverage toward
      sprite/OAM/color-math or other producer-side state
    - keep “later gameplay savestate” as a fallback if this visible-phase lane
      stops narrowing the transition

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
