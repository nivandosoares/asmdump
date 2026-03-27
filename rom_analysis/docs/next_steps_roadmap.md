# ROM Archaeology Next Steps

This roadmap is the direct follow-up after enabling Mesen design packs with
decoded tilemaps and sprite visibility metadata.

## Current Status Snapshot (2026-03-27)

Checkpoint log: `rom_analysis/docs/progress_checkpoints.md`.

| Roadmap lane | Status | Current reading |
|---|---|---|
| 1. Consolidate `67FB` coverage | in progress | Decoder + runtime tracing + consolidated registry + matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps are done; registry tightening now demotes `9681` to `sentinel-control` and `E91F` to `nested-invalid-marker`, leaving active unresolved queue (`EE7F`, `DA96`). |
| 2. Tilemap-to-ROM provenance | in progress | Resume from `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`; contiguous provenance still covers `1086..1117`; the later direct-hit cluster `7051/7059/7064` now also has interior tilemap carry confirmation at `7055/7061` via the reopened timed-input bridge, `7055` still diverges from `7051` in visible-sprite/OAM composition so the gain is tilemap-only, not full-scene carry, the visual-contract builders now separate BG/CHR state from OBJ/OAM state with optional provenance binding, producer-side write-breakpoint summaries now also have real later-window proofs at `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` under the same `01:9FE5` callback family, the new consolidated `986..1093` range summary now makes that callback/state progression explicit in one artifact, the post-`1093` compare summary now shows `1094..1101` `main_visible.ppm` is exactly the top `224` lines of `main.ppm` while swapping only visible-scanline `ppu.mode7.matrix[0]/[3]` values worsens the render mismatch from `177..574` to `362..5930`, a new active-trace builder now turns `DMA/VRAM/Mode7` probe outputs into frame/callback events, the visual-contract range builders now also merge that activity layer directly, the exact `00:8029` continuation is now also closed through `1133` with the same `bg1`/`61`-sprite / no-DMA / `3`-event `16`-write surface, the late `1165+` reactivation is now tied to a concrete ownership path `01:B6E3 -> 01:9DC6 -> 00:95BD -> bank-0 NMI OAM DMA`, and the DOS-driven SNES correlation lane has now narrowed materially: the recovered front-end car loop already exposes `3` slots through `$0202/$1C78` with no recovered third-slot lock branch, static flow closes a separate top-level three-option gate at `L00BAE8/$1C6A` before the downstream `$0202` corridor begins at `L008B31 -> L008B3E`, and the next surface `L00C20B/$1C70` is now fully closed as a downstream `4`-state `2x2` Select Opponent grid with a `1E:8000` row `0x1D` selection box, three explicit rear-car cells from `16:8000/18:8000/1B:8000`, and a separate helper-`8` BG1 stopwatch/clock slot. `L008B87` now also closes the first handoff semantics of that surface: `$1C70 = 0..2` preserves rival-car state through `$1C76 = 1` and `$1C7A = $1C70`, while `$1C70 = 3` forces the no-opponent branch `$1C76 = 0`, `$1C7A = 0`. No-force timed-input probes now also recover the default rival corridor organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`. Callback-relative `v5/v6` follow-ups now also drive the fourth slot organically by keying `right+down` and `start` to first live `01:C1D2`, and a later `be43+17-22:start` confirm now closes the no-opponent path through `L008B87 -> 01:902D -> 01:9111 -> active_main = 02:9016` while preserving `$1C70 = 3` / `$1C76 = 0` at the same downstream timestamps where the rival baseline keeps `0 / 1`. A direct `2044..2199` compare now shows that both paths already share `02:9016/01:96A0/02:8F3C`, keep `54` sampled fields identical, and narrow the remaining split to `14` fields, with `state_09a2/state_09a8` and the paired DP scratch fields `0020/0022/0053/0054` the strongest post-handoff targets; the corrected screenshot-review packs now also establish that `2044` is a dead transition frame, the first shared non-black review window is `2048..2088`, and the earliest stable rival-vs-clock visual delta is confined to the top radar strip (`125..137` differing pixels inside `(11, 11, 194, 21)`), where the rival lane carries an extra red marker absent from the no-opponent lane. `$1C7C` is now better read as the verified `4`-slot top-level phase selector with bases/counts `[0, 5, 11, 18] / [5, 6, 7, 8]`, `$0202/$1C78` has explicit helper-bundle coverage for indices `9/10/11`, the preview extractor now rebuilds helpers `9/10/11` by tolerating early-ending `26FB` bulks, clean isolated-layer validation shows `BG1` blank for all three and `BG2` nontrivial only for helper `9`, static decode now closes the old `$1E80` WRAM-table assumption because the adjacent UI helpers actually construct the long ROM pointer `1E:8000`, current car-facing rows are `8..10`, current track-facing rows are `11..14`, those rendered rows now close the exact `$1C7C` label set as `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, and `West Coast - Hardest`, top-menu rows `15..17` now close the separate `$1C6A` signboard surface as `Game Options`, `Play TDII`, and `High Score`, and the `$1C6A` branches are now semantically closed as `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`, and `High Score -> L00A3CC`; normalized previews now also show rows `8..10` are a front-end rolling-tire cycle rather than name-bearing text, the `01:9C77` per-car bases now calibrate to Porsche 959 / Lamborghini Diablo / Ferrari F40 OBJ catalogs, a stable frame-`1500` front-end car-presentation render keeps the `Porsche 959` title/info box intact without OAM, the frame-`1500` helper provenance artifact anchors that visible lower-screen `BG2` surface to helper bundle `10`, a new right-navigation calibration reaches a stable `Lamborghini Diablo` panel at frame `1640`, a second-right probe closes the third live selector anchor by changing `$0202` `2 -> 0` at frame `1677`, static `L00BC0F` proves the per-car `BG2` reload uses `$0202 + 0x0009` through `L00A9A0/L00A9CB` without a paired per-car `L00A9F2`, earlier design-pack diffs overestimated the exact-frame tilemap change, the exact-frame raw-dump comparer now keeps `BG1` unchanged across frames `1500/1640/1780` while limiting the visible `BG2` tilemap delta to the top row (`27/11/27` changed cells across the three pairings), the visible-union `BG2` CHR delta is `0`, and the full inferred `BG2` CHR region `0x3000..0x5FFF` is also `0` across those same pairings; this frame trio is now best described conservatively as one downstream front-end car-presentation corridor rather than either the top menu signboard or a proven interactive car-select menu. `mesen_ppu_extract` currently diverges from the exact-frame raw dump at `1780`, so raw runner dumps are now the source of truth for front-end exact-frame comparison. |
| 3. Gameplay-frame expansion | in progress | the older promoted `v2_current` lane still explains the screenshot-vs-end-frame split and the queue-cursor equalization path through frames `90..92`, but a new fingerprinted `v3_ab_compare` sweep proves the current `game_11.mss` seed has drifted: `a_hold` and `b_hold` are now pixel-identical dynamic lanes from frame `62`, `a+b` stays aligned early and first diverges at frame `219`, and the next profitable target is that current-seed branch instead of more work on the micro-blink. |
| 4. Bank API contracts | not started | Baseline docs exist; callback/API contracts for bank 30/10/11 are not yet mapped to completion. |

Validation contract baseline:

- `validation/regression_gates_intro.jsonc`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `rom_analysis/docs/validation_gates.md`
- Latest run status: callback contracts `18/18` pass; regression gates `6/6` pass.

## Gameplay Capture Heuristics (User-supplied, Unverified)

Use these as guided-capture targets for lane 3, not as promoted ROM claims:

- Longplay anchor:
  - gameplay begins at `1:13`
  - opening route is `Desert Blast`
  - opening matchup is `Ferrari F40` cockpit vs `Lamborghini`
  - first checkpoint lands at `4:17`
- Longplay progression anchor:
  - after finishing phases, the game goes to the player-arrest animation,
    then credits, then returns to rival/track re-selection
- Phase-behavior anchor:
  - later stages move from simpler two-lane roads toward harder road layouts
  - night driving begins at `24:11`
  - East Coast / West Coast may introduce new sprites such as animals on the
    road and snow
  - watch specifically for trucks as separate gameplay-facing OAM targets
  - river crossing via bridge appears at `30:32`
  - mountain section appears at `33:40` with no right shoulder and a stone
    wall on the left
  - tunnel appears at `34:18`
  - rain appears at `45:18`
- Gameplay composition heuristic:
  - cockpit car uses three visual states/layers: straight wheel plus two
    diagonal steering variants
  - gameplay layer `2` should be the road/pista surface
  - gameplay layer `3` should be the scrolling scenery/background surface
  - mutable OAM should be a strong candidate for speedometer needle, gear
    changes, traffic, motorcycles, trees, police events, and other outside
    car happenings

## Front-End Menu Split

Use these to avoid collapsing distinct front-end surfaces into one:

- Code-backed split:
  - `L00BAE8` is a separate top-level `3`-option gate on `$1C6A`
  - the downstream `$0202` three-slot corridor is only reached later from
    `L008B31 -> L008B3E`
- ROM-side signboard closure:
  - `01:BAC3` uses `$1C6A + 0x000F` against `1E:8000`
  - rendered rows `15..17` now close the visible top-menu labels as:
    `Game Options`, `Play TDII`, `High Score`
- Closed semantic mapping:
  - `Game Options` branches into `L00C0C7` and the settings-menu loop
  - `Play TDII` is the only top-level branch that advances into the separate
    downstream `$0202` corridor
  - `High Score` branches into `L00A3CC` before returning to the top menu
- Remaining user-guided heuristic:
  - the road/background composition of the initial menu is still a live
    runtime-capture target
  - the configuration-menu string surface remains a useful anchor if an exact
    path back to the initial menu needs to be re-established
  - guided front-end flow now reads as:
    `Ballistic -> initial menu -> Play TDII -> cars -> adversary/clock -> phase -> gameplay`
  - current code-backed fit for that user-guided flow is:
    `L00BAE8 -> L008B3E -> L00C20B -> L00BE76`
  - `L00C20B` itself is now structurally and visually closed:
    - selector field `$1C70`
    - domain `0..3`
    - hidden selection-box callback `01:C1D2` using `1E:8000` row `0x1D`
    - three explicit rear-car cells from `16:8000/18:8000/1B:8000` row `6`
    - helper `8` on `BG1` renders `Select Opponent` plus the fourth-slot
      stopwatch/clock icon
  - `L008B87` now closes the first downstream semantics of that same choice:
    - `$1C70 = 0..2 -> $1C76 = 1`, `$1C7A = $1C70`
    - `$1C70 = 3 -> $1C76 = 0`, `$1C7A = 0`
  - no-force timed-input probes now already recover the default top-left rival
    path organically:
    `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by
    `active_main = 02:9016`
  - callback-relative `v5/v6` probes now also move the fourth slot organically
    inside live `01:C1D2`, and a later `be43+17-22:start` confirm now closes
    the no-opponent path too:
    `L00C20B -> 01:C1D2 -> L00BE76 -> 01:BE43 -> L008B87 -> 01:902D ->
    01:9111 -> active_main = 02:9016`
  - the remaining proving target is now post-handoff divergence:
    corrected screenshot review packs start at `2048` because the earlier
    `2044` frame was a dead transition surface, objective image compare
    localizes the earliest stable rival-vs-clock delta to the top strip
    (`125..137` differing pixels inside `(11, 11, 194, 21)`), and an extended
    probe compare now closes that first live split as
    `$1C76 -> state_11f3 -> oam_0730` in `bank2.asm` `L0108EF`; the next step
    is therefore no longer “find any visible delta” but tie the remaining
    intermittent OAM-side differences to later rival-only behavior. A new
    full-rate compare over `2048..2088` now also shows that the suspected
    `09A2/09A8` pulses at `2051/2083` do not create any extra whole-frame
    visible pulse in this same window: frame `2048` alone carries a smaller
    transition bbox `(11, 20, 14, 21)`, frames `2049..2088` keep the same
    full top-strip bbox `(11, 11, 194, 21)`, and adjacent-frame compares for
    `2050->2051`, `2051->2052`, `2082->2083`, and `2083->2084` are all
    pixel-identical in both lanes. That pushes the reported rearview blinking
    lights search later than those `09A2/09A8` pulse frames. A tighter first-
    frame compare now narrows the user-reported blink cue further:
    rival `2048->2049` changes only in bbox `(180, 11, 194, 19)`, while the
    no-opponent lane is pixel-identical across the same step. The next best
    move is therefore a rival-only state/OAM trace around `2048->2049`,
    targeted at that top-right subregion rather than the whole strip.

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
    - `tools/out/mesen_range_7055_7061_inputfix_v2`
    - `tools/out/design_mesen_range_7055_7061_inputfix_v2/design_pack_range.json`
    - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc`
    - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.md`
  - the promoted bridge extractor now uses chunked debugger `PpuFrame`
    stepping for timed-input windows, which reopens the current local
    `Mesen`/`MesenCore.so` pair on scenario
    `6800:start;6900-6920:start,a`
  - the matching targeted probe restores the later direct-hit cluster, and the
    extracted design packs keep the same visible layer/tile-index block across
    those exact hits:
    - `7051` -> `0D:C4DC`
    - `7059` -> `07:BF49`
    - `7064` -> `07:C112`
  - interior carry-check reading:
    - `7055` keeps the same `bg1/bg2/bg3` tilemaps and `vram.bin` as `7051`,
      so tilemap carry from `0D:C4DC` now holds at `frame_delta = 4`
    - `7055` is not a full-scene carry frame:
      `cgram.bin`, `ppu_state.json`, and `oam.bin` differ and visible sprites
      drop `10 -> 0`
    - `7061` keeps the same `bg1/bg2/bg3` tilemaps as `7059`; `vram.bin` and
      `oam.bin` also match there, so the tilemap carry from `07:BF49` now
      holds at `frame_delta = 2`
  - current decision:
    - later-scene tilemap provenance is now stronger inside the window, but do
      not promote `7051..7064` as a full-scene contiguous carry block
  - the new translation-facing IR layer now exists:
    - `tools/build_mesen_visual_contract.py`
    - `tools/build_mesen_visual_contract_range.py`
    - it promotes each design-pack frame into explicit `bg` vs `obj`
      contracts, keeps OBJ/OAM separate from tilemaps, and can attach current
      tilemap provenance rows per frame/layer
    - it can now also attach summarized producer-side write-breakpoint domains
      from `mesen_probe_boot.lua` via optional `--probe-json`
  - headless producer-trace capture is live again:
    - `validation/run_mesen_capture.sh` now rewrites repo-relative output
      prefixes like `tools/out/...` to absolute repo paths before invoking
      `Mesen --testRunner`
    - the local root cause was not the probe schema; it was that `Mesen`
      resolves relative Lua I/O under `.mesen-config/Mesen2`, so nested
      repo-relative prefixes were timing out after silent write failures
    - promoted live proof artifact:
      - `tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
      - `tools/out/visual_contract_frame300_live_probe_cap2048.json`
    - current proof reading:
      - the frame-`300` full-range trace records `2048` retained write hits with
        `133427` dropped by cap
      - the merged visual contract now carries live `vram`, `cgram`, `oam`,
        and `obj_state` producer domains
  - next best step:
    - retarget the now-working producer-trace path at later translation-facing
      windows (`986`, `7051`, `7055`, `7059`, `7061`) instead of the early
      frame-`300` proof window
    - promoted cheaper later-window proof:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=986`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=987 TD2_BOOT_PROBE_TRACE_START_FRAME=982 TD2_BOOT_PROBE_TRACE_END_FRAME=986 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame986 tools/out/visual_contract_frame986_live_probe.json --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/design_frame986/design_pack.json`
        - `tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame986_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00986_frame.png tools/out/mesen_frame986/main_visible.ppm --diff-out tools/out/mesen_frame986_vs_intro986_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame986/main_visible.ppm tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm --diff-out tools/out/mesen_frame986_vs_bridgeoverride986_diff.ppm`
      - current reading:
        - the extracted `mesen_frame986/main_visible.ppm` is `267` pixels from
          the local frame-`986` screenshot and only `2` pixels from the
          committed `bank1_bootstrap_queue_986_bridgeoverride.ppm`
        - the frame-`986` design pack reports `bgMode = 7`,
          `mainScreenLayers = 0x11`, active `bg1`, and `0` visible sprites
        - the live producer trace records `3246` write hits with no drops:
          `2730` OAM writes across frames `982..986` plus `516` VRAM writes at
          frames `984` and `986`
        - dominant write callsites are IRQ/NMI-side helpers, not mainline game
          logic:
          - OAM: `00:824F/00:8257`
          - VRAM: `00:81E5/00:81F2`
        - all sampled write hits in this window still run under active main
          callback `01:9FE5`
        - no `CGRAM` or `OBJSEL` writes were observed inside `982..986`
        - practical reading: by `986`, the visible late overlay is already
          gone (`0` visible sprites) even though OAM upload traffic is still
          active in the same callback family
        - contract hardening side effect: `td2_boot_probe.json` now preserves
          `trace_start_frame` and `trace_end_frame`, so the merged visual
          contract can carry an exact `producerTrace.traceWindow`
    - keep trace windows producer-active; the narrow frame-`296..300` proof
      attempt emitted `0` write hits even though the full `0..300` window
      works, so empty traces are now a window-selection problem rather than a
      runner problem
    - if you want a machine-generated combined provenance artifact, preserve or
      regenerate the per-hit `td2_boot_probe_l001210_exec.json` for this
      scenario instead of only the summarized singleton source list
    - if you want full-scene continuity, isolate the `7051 -> 7055`
      sprite/OAM disappearance before claiming composition carry
    - bounded 2026-03-21 follow-up in this environment:
      - `MESEN_TIMEOUT_SECONDS=120`, `TD2_BOOT_PROBE_TOTAL_FRAMES=7062`,
        `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`,
        `TD2_BOOT_PROBE_TRACE_END_FRAME=7061`,
        `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'` ->
        `exit 255`, no
        `tools/out/visual_contract_probe_7051_7061_live/td2_boot_probe.json`
      - `MESEN_TIMEOUT_SECONDS=120`, `TD2_BOOT_PROBE_TOTAL_FRAMES=7052`,
        `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`,
        `TD2_BOOT_PROBE_TRACE_END_FRAME=7051`,
        `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'` ->
        `exit 255`, no
        `tools/out/visual_contract_probe_7051_live/td2_boot_probe.json`
    - practical reading:
        - the frame-`300` live producer-trace proof remains valid
        - bounded 2026-03-22 regolden checks also keep the screenshot/build
          target intact:
          - `build_bank1_credits_scene.py` -> `0` mismatched pixels vs
            `tools/out/td2_boot_probe_frame_300.png`
          - `render_mesen_snes_bg.py` on the rebuilt
            `bank1_credits_scene_regolden_20260322_*` files -> `0`
            mismatched pixels vs the same screenshot
          - `td2_port --headless --snes-bg-prefix` still lands at `7244`
            mismatched pixels (`12.632533%`), identical to the historical
            `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`
        - practical routing:
          - keep frame `300` as a solved capture/ROM/Python golden point
          - do not treat it as a zero-diff SDL runtime milestone yet
          - do not pivot Lane 2 away from the current `Mode 7` scanline-start
            gate just because the old credits-scene runtime gap still exists
        - later power-on timed-input ownership traces are still blocked locally
          before artifact emission
      - next best step after this negative result:
        - do not spend more headless retries on the same power-on `7051` path
          without a new starting surface
        - keep using the now-proved `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` window as the current
          later-window ownership anchor while the post-`1093`
          composition/export nuance is explained, before coming back to the
          blocked timed-input `7051` path
        - recover a reusable later-intro savestate/seed for the `7051..7061`
          window only when you need timed-input ownership, not generic late
          attract ownership
    - promoted forward extensions at `990` and `994`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=990`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=991 TD2_BOOT_PROBE_TRACE_START_FRAME=986 TD2_BOOT_PROBE_TRACE_END_FRAME=990 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame990 tools/out/visual_contract_frame990_live_probe.json --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom ./game.smc --frame 994 --frame-timeout-seconds 120 --out-dir ./tools/out/mesen_frame994`
      - `python3 tools/build_mesen_design_pack.py tools/out/mesen_frame994 tools/out/design_frame994 --clean-out`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=995 TD2_BOOT_PROBE_TRACE_START_FRAME=990 TD2_BOOT_PROBE_TRACE_END_FRAME=994 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame994 tools/out/visual_contract_frame994_live_probe.json --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame990_live_probe.json`
        - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame994_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00990_frame.png tools/out/mesen_frame990/main_visible.ppm --diff-out tools/out/mesen_frame990_vs_intro990_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame990/main_visible.ppm tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm --diff-out tools/out/mesen_frame990_vs_bridgeobj990_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00994_frame.png tools/out/mesen_frame994/main_visible.ppm --diff-out tools/out/mesen_frame994_vs_intro994_diff.ppm`
        - `python3 tools/compare_frames.py tools/out/mesen_frame994/main_visible.ppm tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm --diff-out tools/out/mesen_frame994_vs_bridgeobj994_diff.ppm`
      - current reading:
        - frame `990`:
          - `3762` write hits, `0` drops, exact
            `producerTrace.traceWindow = 986..990`
          - `2730` OAM writes across `986..990`
          - `1032` VRAM writes across `986/988/989/990`
          - `5` visible sprites in the fresh design pack
          - `1516` pixels vs the local screenshot and `2` pixels vs the
            committed bridge-object scene
        - frame `994`:
          - `4020` write hits, `0` drops, exact
            `producerTrace.traceWindow = 990..994`
          - `2730` OAM writes across `990..994`
          - `1290` VRAM writes across `990..994`
          - `19` visible sprites in the fresh design pack
          - `2622` pixels vs the local screenshot and `96` pixels vs the
            committed bridge-object scene
        - both windows stay on the same late callback family:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - live producer-side ownership now spans the late bridge-object edge
            from `986` through `994`
          - OAM traffic stays flat while VRAM traffic grows and the visible
            overlay expands between `990` and `994`
          - the remaining frame-`994` screenshot gap is now downstream of
            source ownership, not a missing producer-trace surface
    - promoted forward extension at `998`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=998`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=999 TD2_BOOT_PROBE_TRACE_START_FRAME=994 TD2_BOOT_PROBE_TRACE_END_FRAME=998 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame998 tools/out/visual_contract_frame998_live_probe.json --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame998_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_00998_frame.png tools/out/mesen_frame998/main_visible.ppm --diff-out tools/out/mesen_frame998_vs_intro998_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame998/vram.bin tools/out/mesen_frame998/cgram.bin tools/out/mesen_frame998/ppu_state.json tools/out/mesen_frame998_mode7ppu.ppm --oam tools/out/mesen_frame998/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame998_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame998/main_visible.ppm tools/out/mesen_frame998_mode7ppu.ppm --diff-out tools/out/mesen_frame998_mode7ppu_vs_mesen998_diff.ppm`
      - current reading:
        - `4020` write hits, `0` drops, exact
          `producerTrace.traceWindow = 994..998`
        - `2730` OAM writes across `994..998`
        - `1290` VRAM writes across `994..998`
        - `32` visible sprites in the fresh design pack
        - `3119` pixels vs the local screenshot
        - `4` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - `998` now anchors live ownership at the start of the direct
            bridge-extracted block instead of relying only on earlier callback
            continuity notes
          - producer traffic stays flat from `994` into `998` while the
            visible overlay expands again
    - promoted forward extension at `1005`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1005`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1006 TD2_BOOT_PROBE_TRACE_START_FRAME=998 TD2_BOOT_PROBE_TRACE_END_FRAME=1005 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1005 tools/out/visual_contract_frame1005_live_probe.json --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BG_RANGE_START_FRAME=1005 TD2_BG_RANGE_END_FRAME=1005 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop ./validation/run_mesen_dump_bg_range.sh`
      - evidence:
        - `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1005_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01005_frame.png tools/out/mesen_frame1005/main_visible.ppm --diff-out tools/out/mesen_frame1005_vs_intro1005_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1005/vram.bin tools/out/mesen_frame1005/cgram.bin tools/out/mesen_frame1005/ppu_state.json tools/out/mesen_frame1005_mode7ppu.ppm --oam tools/out/mesen_frame1005/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1005_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1005/main_visible.ppm tools/out/mesen_frame1005_mode7ppu.ppm --diff-out tools/out/mesen_frame1005_mode7ppu_vs_mesen1005_diff.ppm`
      - current reading:
        - `6432` write hits, `0` drops, exact
          `producerTrace.traceWindow = 998..1005`
        - `4368` OAM writes across `998..1005`
        - `2064` VRAM writes across `998..1005`
        - `53` visible sprites in the fresh design pack
        - `4466` pixels vs the fresh local screenshot
        - `4` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the first direct bridge-extracted `998..1005` block is now closed
            by live ownership evidence at both ends
          - producer traffic remains inside the same callback family while the
            visible overlay keeps expanding into frame `1005`
    - promoted forward extension at `1013`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1013`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1014 TD2_BOOT_PROBE_TRACE_START_FRAME=1006 TD2_BOOT_PROBE_TRACE_END_FRAME=1013 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1013 tools/out/visual_contract_frame1013_live_probe.json --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1013_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01013_frame.png tools/out/mesen_frame1013/main_visible.ppm --diff-out tools/out/mesen_frame1013_vs_intro1013_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1013/vram.bin tools/out/mesen_frame1013/cgram.bin tools/out/mesen_frame1013/ppu_state.json tools/out/mesen_frame1013_mode7ppu.ppm --oam tools/out/mesen_frame1013/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1013_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1013/main_visible.ppm tools/out/mesen_frame1013_mode7ppu.ppm --diff-out tools/out/mesen_frame1013_mode7ppu_vs_mesen1013_diff.ppm`
      - current reading:
        - `6174` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1006..1013`
        - `4368` OAM writes across `1006..1013`
        - `1806` VRAM writes across `1006..1012`
        - `61` visible sprites in the fresh design pack
        - `4638` pixels vs the fresh local screenshot
        - `10` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the second direct bridge-extracted `1006..1013` block is now
            closed by live ownership evidence at its end
          - OAM stays flat while the visible overlay keeps expanding, and the
            bounded VRAM domain stops one frame earlier than the block end
    - promoted forward extension at `1021`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1021`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1022 TD2_BOOT_PROBE_TRACE_START_FRAME=1014 TD2_BOOT_PROBE_TRACE_END_FRAME=1021 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1021 tools/out/visual_contract_frame1021_live_probe.json --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1021_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01021_frame.png tools/out/mesen_frame1021/main_visible.ppm --diff-out tools/out/mesen_frame1021_vs_intro1021_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1021/vram.bin tools/out/mesen_frame1021/cgram.bin tools/out/mesen_frame1021/ppu_state.json tools/out/mesen_frame1021_mode7ppu.ppm --oam tools/out/mesen_frame1021/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1021_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1021/main_visible.ppm tools/out/mesen_frame1021_mode7ppu.ppm --diff-out tools/out/mesen_frame1021_mode7ppu_vs_mesen1021_diff.ppm`
      - current reading:
        - `5400` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1014..1021`
        - `4368` OAM writes across `1014..1021`
        - `1032` VRAM writes at `1014/1015/1017/1019`
        - `61` visible sprites in the fresh design pack
        - `3557` pixels vs the fresh local screenshot
        - `10` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the third direct bridge-extracted `1014..1021` block is now
            closed by live ownership evidence at its end
          - OAM stays flat, visible sprites stop growing, and bounded VRAM
            activity becomes sparse inside the block
    - promoted forward extension at `1029`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1029`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1030 TD2_BOOT_PROBE_TRACE_START_FRAME=1022 TD2_BOOT_PROBE_TRACE_END_FRAME=1029 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1029 tools/out/visual_contract_frame1029_live_probe.json --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1029_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01029_frame.png tools/out/mesen_frame1029/main_visible.ppm --diff-out tools/out/mesen_frame1029_vs_intro1029_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1029/vram.bin tools/out/mesen_frame1029/cgram.bin tools/out/mesen_frame1029/ppu_state.json tools/out/mesen_frame1029_mode7ppu.ppm --oam tools/out/mesen_frame1029/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1029_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1029/main_visible.ppm tools/out/mesen_frame1029_mode7ppu.ppm --diff-out tools/out/mesen_frame1029_mode7ppu_vs_mesen1029_diff.ppm`
      - current reading:
        - `3822` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1022..1029`
        - only the `oam` producer domain appears in this bounded block:
          - `3822` OAM writes across `1022/1023/1024/1025/1027/1028/1029`
          - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
        - `61` visible sprites in the fresh design pack
        - `1` pixel vs the fresh local screenshot
        - `11` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the fourth direct bridge-extracted `1022..1029` block is now
            closed by live ownership evidence at its end
          - the bounded producer surface has now collapsed to OAM-only inside
            the block while visible sprites stay flat at `61`
          - frame `1029` also lands on a near-solved screenshot surface, so
            this block is no longer merely bridge-visible
    - promoted forward extension at `1037`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1037`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1038 TD2_BOOT_PROBE_TRACE_START_FRAME=1030 TD2_BOOT_PROBE_TRACE_END_FRAME=1037 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1037 tools/out/visual_contract_frame1037_live_probe.json --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1037_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01037_frame.png tools/out/mesen_frame1037/main_visible.ppm --diff-out tools/out/mesen_frame1037_vs_intro1037_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1037/vram.bin tools/out/mesen_frame1037/cgram.bin tools/out/mesen_frame1037/ppu_state.json tools/out/mesen_frame1037_mode7ppu.ppm --oam tools/out/mesen_frame1037/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1037_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1037/main_visible.ppm tools/out/mesen_frame1037_mode7ppu.ppm --diff-out tools/out/mesen_frame1037_mode7ppu_vs_mesen1037_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1030..1037`
        - `4368` OAM writes across `1030..1037`
        - `580` VRAM writes at `1030` and `1034`
        - `61` visible sprites in the fresh design pack
        - `29` pixels vs the fresh local screenshot
        - `8` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the fifth direct bridge-extracted `1030..1037` block is now
            closed by live ownership evidence at its end
          - the bounded producer surface is no longer OAM-only: a narrow VRAM
            pulse returns at `1030` and `1034` while visible sprites stay flat
          - frame `1037` stays close to the screenshot-backed surface without
            needing a callback-family fork
    - promoted forward extension at `1045`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1045`
      - invalid bounded attempt while probe + screenshot shared the same isolated config:
        - parallel `run_mesen_probe_boot.sh` and `run_mesen_dump_bg_range.sh`
          both overran the useful window and ended with `exit 255` before
          emitting artifacts
        - retry policy used:
          - reran the same commands serially, which produced the committed
            artifacts below
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1046 TD2_BOOT_PROBE_TRACE_START_FRAME=1038 TD2_BOOT_PROBE_TRACE_END_FRAME=1045 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1045 tools/out/visual_contract_frame1045_live_probe.json --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1045_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01045_frame.png tools/out/mesen_frame1045/main_visible.ppm --diff-out tools/out/mesen_frame1045_vs_intro1045_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1045/vram.bin tools/out/mesen_frame1045/cgram.bin tools/out/mesen_frame1045/ppu_state.json tools/out/mesen_frame1045_mode7ppu.ppm --oam tools/out/mesen_frame1045/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1045_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1045/main_visible.ppm tools/out/mesen_frame1045_mode7ppu.ppm --diff-out tools/out/mesen_frame1045_mode7ppu_vs_mesen1045_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1038..1045`
        - `4368` OAM writes across `1038..1045`
        - `580` VRAM writes at `1038` and `1042`
        - `61` visible sprites in the fresh design pack
        - `34` pixels vs the fresh local screenshot
        - `15` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the sixth direct bridge-extracted `1038..1045` block is now
            closed by live ownership evidence at its end
          - the narrow VRAM pulse pattern remains, but it shifts later to
            `1038` and `1042` while visible sprites stay flat
          - parallel reuse of the same isolated Mesen config is not reliable
            for this lane; serialize probe and screenshot capture when needed
    - promoted forward extension at `1053`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1053`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1054 TD2_BOOT_PROBE_TRACE_START_FRAME=1046 TD2_BOOT_PROBE_TRACE_END_FRAME=1053 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1053 tools/out/visual_contract_frame1053_live_probe.json --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1053_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01053_frame.png tools/out/mesen_frame1053/main_visible.ppm --diff-out tools/out/mesen_frame1053_vs_intro1053_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1053/vram.bin tools/out/mesen_frame1053/cgram.bin tools/out/mesen_frame1053/ppu_state.json tools/out/mesen_frame1053_mode7ppu.ppm --oam tools/out/mesen_frame1053/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1053_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1053/main_visible.ppm tools/out/mesen_frame1053_mode7ppu.ppm --diff-out tools/out/mesen_frame1053_mode7ppu_vs_mesen1053_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1046..1053`
        - `4368` OAM writes across `1046..1053`
        - `580` VRAM writes at `1046` and `1050`
        - `61` visible sprites in the fresh design pack
        - `31` pixels vs the fresh local screenshot
        - `14` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the seventh direct bridge-extracted `1046..1053` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists one block later and
            shifts again, now landing at `1046` and `1050`
          - the lane still prefers serialized Mesen capture when both a probe
            artifact and a local screenshot are needed
    - promoted forward extension at `1061`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1061`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1062 TD2_BOOT_PROBE_TRACE_START_FRAME=1054 TD2_BOOT_PROBE_TRACE_END_FRAME=1061 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1061 tools/out/visual_contract_frame1061_live_probe.json --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1061_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01061_frame.png tools/out/mesen_frame1061/main_visible.ppm --diff-out tools/out/mesen_frame1061_vs_intro1061_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1061/vram.bin tools/out/mesen_frame1061/cgram.bin tools/out/mesen_frame1061/ppu_state.json tools/out/mesen_frame1061_mode7ppu.ppm --oam tools/out/mesen_frame1061/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1061_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1061/main_visible.ppm tools/out/mesen_frame1061_mode7ppu.ppm --diff-out tools/out/mesen_frame1061_mode7ppu_vs_mesen1061_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1054..1061`
        - `4368` OAM writes across `1054..1061`
        - `580` VRAM writes at `1054` and `1058`
        - `61` visible sprites in the fresh design pack
        - `36` pixels vs the fresh local screenshot
        - `22` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the eighth direct bridge-extracted `1054..1061` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists yet again and shifts to
            `1054` and `1058`, while visible sprites stay flat
          - serialized Mesen capture remains the preferred path when both a
            probe artifact and a local screenshot are required
    - promoted forward extension at `1069`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1069`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1070 TD2_BOOT_PROBE_TRACE_START_FRAME=1062 TD2_BOOT_PROBE_TRACE_END_FRAME=1069 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1069 tools/out/visual_contract_frame1069_live_probe.json --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1069_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01069_frame.png tools/out/mesen_frame1069/main_visible.ppm --diff-out tools/out/mesen_frame1069_vs_intro1069_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1069/vram.bin tools/out/mesen_frame1069/cgram.bin tools/out/mesen_frame1069/ppu_state.json tools/out/mesen_frame1069_mode7ppu.ppm --oam tools/out/mesen_frame1069/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1069_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1069/main_visible.ppm tools/out/mesen_frame1069_mode7ppu.ppm --diff-out tools/out/mesen_frame1069_mode7ppu_vs_mesen1069_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1062..1069`
        - `4368` OAM writes across `1062..1069`
        - `580` VRAM writes at `1062` and `1066`
        - `61` visible sprites in the fresh design pack
        - `48` pixels vs the fresh local screenshot
        - `25` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the ninth direct bridge-extracted `1062..1069` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists again and shifts to
            `1062` and `1066`, while visible sprites stay flat
          - screenshot-backed mismatch is rising slowly, but still without any
            callback-family fork
    - promoted forward extension at `1077`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1077`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1078 TD2_BOOT_PROBE_TRACE_START_FRAME=1070 TD2_BOOT_PROBE_TRACE_END_FRAME=1077 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1077 tools/out/visual_contract_frame1077_live_probe.json --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1077_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01077_frame.png tools/out/mesen_frame1077/main_visible.ppm --diff-out tools/out/mesen_frame1077_vs_intro1077_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1077/vram.bin tools/out/mesen_frame1077/cgram.bin tools/out/mesen_frame1077/ppu_state.json tools/out/mesen_frame1077_mode7ppu.ppm --oam tools/out/mesen_frame1077/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1077_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1077/main_visible.ppm tools/out/mesen_frame1077_mode7ppu.ppm --diff-out tools/out/mesen_frame1077_mode7ppu_vs_mesen1077_diff.ppm`
      - current reading:
        - `4948` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1070..1077`
        - `4368` OAM writes across `1070..1077`
        - `580` VRAM writes at `1070` and `1074`
        - `61` visible sprites in the fresh design pack
        - `36` pixels vs the fresh local screenshot
        - `52` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the tenth direct bridge-extracted `1070..1077` block is now
            closed by live ownership evidence at its end
          - the same narrow VRAM pulse pattern persists again and shifts to
            `1070` and `1074`, while visible sprites stay flat
          - the screenshot-backed surface stays tight, but the Python
            `mode7-ppu` gap now rises materially inside the same callback
            family, which makes `1085` the next useful boundary
    - promoted forward extension at `1085`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1085`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1086 TD2_BOOT_PROBE_TRACE_START_FRAME=1078 TD2_BOOT_PROBE_TRACE_END_FRAME=1085 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1085 tools/out/visual_contract_frame1085_live_probe.json --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1085_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01085_frame.png tools/out/mesen_frame1085/main_visible.ppm --diff-out tools/out/mesen_frame1085_vs_intro1085_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1085/vram.bin tools/out/mesen_frame1085/cgram.bin tools/out/mesen_frame1085/ppu_state.json tools/out/mesen_frame1085_mode7ppu.ppm --oam tools/out/mesen_frame1085/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1085_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1085/main_visible.ppm tools/out/mesen_frame1085_mode7ppu.ppm --diff-out tools/out/mesen_frame1085_mode7ppu_vs_mesen1085_diff.ppm`
      - current reading:
        - `4368` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1078..1085`
        - producer domains collapse to OAM only across `1078..1085`
        - no sampled VRAM writes fire in the bounded `1078..1085` window
        - `61` visible sprites in the fresh design pack
        - `74` pixels vs the fresh local screenshot
        - `69` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the eleventh direct bridge-extracted `1078..1085` block is now
            closed by live ownership evidence at its end
          - compared with `1077`, the narrow VRAM pulse disappears entirely,
            leaving a pure-OAM ownership block under the same callback family
          - the screenshot-backed and Python-render gaps now rise together,
            which makes `1093` the next useful boundary
    - promoted forward extension at `1093`:
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1093`
      - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1094 TD2_BOOT_PROBE_TRACE_START_FRAME=1086 TD2_BOOT_PROBE_TRACE_END_FRAME=1093 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
      - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1093 tools/out/visual_contract_frame1093_live_probe.json --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
      - evidence:
        - `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
        - `tools/out/visual_contract_frame1093_live_probe.json`
      - targeted validation:
        - `python3 tools/compare_frames.py tools/out/intro_loop_frame_01093_frame.png tools/out/mesen_frame1093/main_visible.ppm --diff-out tools/out/mesen_frame1093_vs_intro1093_diff.ppm`
        - `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1093/vram.bin tools/out/mesen_frame1093/cgram.bin tools/out/mesen_frame1093/ppu_state.json tools/out/mesen_frame1093_mode7ppu.ppm --oam tools/out/mesen_frame1093/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1093_mode7ppu.json`
        - `python3 tools/compare_frames.py tools/out/mesen_frame1093/main_visible.ppm tools/out/mesen_frame1093_mode7ppu.ppm --diff-out tools/out/mesen_frame1093_mode7ppu_vs_mesen1093_diff.ppm`
      - current reading:
        - `4368` write hits, `0` drops, exact
          `producerTrace.traceWindow = 1086..1093`
        - producer domains stay OAM-only across `1086..1093`
        - no sampled VRAM writes fire in the bounded `1086..1093` window
        - `61` visible sprites in the fresh design pack
        - `207` pixels vs the fresh local screenshot
        - `129` pixels vs the repo's Python `mode7-ppu` render of the same frame
        - the callback family still does not change:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - practical reading:
          - the twelfth direct bridge-extracted `1086..1093` block is now
            closed by live ownership evidence at its end
          - the pure-OAM ownership shape survives again, but the
            screenshot-backed gap now jumps sharply while the callback family
            still stays flat
          - `1093` is now the promoted bridge-visible frontier for this
            callback family, so the next step is to explain the post-`1093`
            composition/export nuance rather than extend the same proof loop
    - consolidated callback/state range checkpoint for the same late window:
      - `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
      - `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`
      - evidence:
        - `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`
        - `rom_analysis/docs/intro_01_9fe5_window_986_1093.md`
      - current reading:
        - sampled frames `986..1093` stay on one callback family:
          - main callback `01:9FE5`
          - IRQ callback `00:835F`
        - `bgMode = 7` and main-screen `bg1` stay fixed across the whole
          sampled window
        - visible sprite progression is now explicit in one artifact:
          - `0` at `986`
          - `5` at `990`
          - `19` at `994`
          - `32` at `998`
          - `53` at `1005`
          - `61` from `1013` through `1093`
        - the late state ramp is now also explicit in one timeline:
          - `$0206` stays `0` through `1021`
          - then rises `1,3,5,7,9,11,13` from `1029` through `1077`
          - `$040A` rises `6,8,10,12,14,16,17` across that same later block
          - `$0054` plateaus at `128` from `1077` through `1093`
        - producer domains across the whole range stay inside `oam`/`vram`,
          with sampled OAM-only windows at `1029`, `1085`, and `1093`
      - next best step:
        - treat the new `986..1093` range summary as the current late
          callback-family source of truth
        - use it to explain the post-`1093` composition/export nuance before
          reopening the blocked timed-input `7051` ownership lane
    - post-`1093` compare checkpoint for the first failing continuation block:
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1094_1101_v1 tools/out/visual_contract_range_1094_1101 --provenance-json rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc --clean-out`
      - evidence:
        - `tools/out/visual_contract_range_1094_1101/visual_contract_range.json`
        - `tools/out/post_1093_compare/summary.json`
        - `tools/out/post_1093_compare/summary.md`
        - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`
      - current reading:
        - `1094..1101` keeps the same visible surface shape:
          - `bgMode = 7`
          - main-screen `bg1`
          - `61` visible sprites
        - the export surface change is now explicit:
          - `main.ppm` is `256x239`
          - `main_visible.ppm` is exactly the top `224` lines of `main.ppm`
          - the bottom `224` lines are not the right comparison surface
        - only two sampled Mode 7 fields differ between end-of-frame and
          visible-state dumps:
          - `ppu.mode7.matrix[0]`
          - `ppu.mode7.matrix[3]`
        - bare visible-state substitution is now falsified:
          - base render vs `main_visible.ppm`: `177..574` mismatched pixels
          - visible-state render vs `main_visible.ppm`: `362..5930`
            mismatched pixels
      - next best step:
        - keep `7051` parked
        - use the active-trace boundaries to split the continuation into:
          - `1102..1113`
          - `1114..1117`
        - do not spend more time searching for hidden direct `VRAM/CGRAM`
          uploads in this window unless a new targeted trace contradicts the
          current proof
    - post-`1102` continuation checkpoint for the `00:8029` tail:
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1102_1109_v1 tools/out/visual_contract_range_1102_1109_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
      - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1110_1117_v1 tools/out/visual_contract_range_1110_1117_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
      - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117/summary.md`
      - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`
        - evidence:
        - `tools/out/visual_contract_range_1102_1109_activity/visual_contract_range.json`
        - `tools/out/visual_contract_range_1110_1117_activity/visual_contract_range.json`
        - `tools/out/post_1093_compare_1102_1117/summary.json`
        - `tools/out/post_1093_compare_1102_1117/summary.md`
        - `tools/out/mode7_plateau_1105/analysis.json`
        - `tools/out/mode7_plateau_1105/analysis.md`
        - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`
        - `rom_analysis/docs/mode7_1105_validation_reference.md`
      - current reading:
        - the entire `1102..1117` window keeps the same presentation surface:
          - `bgMode = 7`
          - main-screen `bg1`
          - `61` visible sprites
          - main callback `00:8029`
        - `main_visible.ppm` remains the top `224`-line crop of `main.ppm`
          across the whole window
        - the later internal boundaries are now narrower:
          - `1102..1113`: one per-frame `OAM` DMA, no direct `VRAM/CGRAM`
            writes, `3` `Mode 7` events / `16` writes
          - `1114..1117`: no DMA, still no direct `VRAM/CGRAM` writes, same
            `Mode 7` event shape
        - bare visible-state substitution is only still wrong for `1102..1104`
          and then converges by `1105`
        - the remaining renderer gap stabilizes at `2698` mismatched pixels for
          every frame `1105..1117`
        - the updated compare artifact now proves that plateau is spatially and
          byte-wise identical from `1105..1117`:
          - same diff-mask hash
          - same diff payload hash
          - same bounding box `24,68 -> 232,138`
        - the same compare artifact now also proves the plateau is driven by
          one canonical extracted scene state from `1105..1117`:
          - `main_visible.ppm`, `vram.bin`, `oam.bin`, and `ppu_state.json`
            are byte-identical from `1105..1117`
          - only `cgram.bin` continues to change frame to frame
        - canonical frame-`1105` object sanity checks now show:
          - current `mode7-ppu` render: `2698` mismatched pixels
          - `simple` OBJ render: `2698`
          - no-`OAM` render: `9717`
        - the new canonical plateau analyzer now also proves:
          - `bg1_visible.ppm` is byte-identical from `1105..1117`
          - no-`OAM` vs `bg1_visible.ppm` still mismatches `3982` pixels
          - the BG-only diff box is `24,67 -> 232,138`
          - only `4` visible sprites intersect the main plateau diff box
          - their combined coverage there is only `128 / 14839` pixels
            (`0.862592%`)
          - a whole-box horizontal shift of `-1` improves the BG-only compare
            from `3982 -> 3611`
          - a direct `ppu.mode7.hscroll +1` perturbation reproduces most of
            that BG-only gain (`3982 -> 3613`)
          - but the same perturbation worsens the full-scene compare
            (`2698 -> 2780`)
          - per-row best-shift counts still favor `-1` on `38` rows, so the
            plateau now reads as mostly BG sampling/rounding rather than sprite
            ownership
          - the new `Mode 7` sampling stats now also prove:
            - the main and BG-only plateau bboxes stay entirely inside the map
              (`outsideMapPixels = 0`)
            - base BG bbox sample range is `x = 24..232`, `y = 65..137`
            - best tested BG-only delta (`hscroll +1`) still stays inside the
              map with sample range `x = 25..233`, `y = 65..137`
          - the doc/source cross-check now agrees with that narrowing:
            - the repo renderer already matches the main `fullsnes` /
              `Mesen-S` operational formula shape
            - canonical `1105` keeps `EXTBG`, direct color, windows, and color
              math inactive
            - so the leading frontier is no longer `M7SEL` edge handling
      - next best step:
        - keep `7051` parked
        - treat `line + 1` as the official Python/tooling `Mode 7` rule for
          the late `00:8029` window and for the broader compare path
        - stop treating the old `2698` composed-screen plateau as the active
          frontier; it is now closed on the Python compare path
        - do not treat the surviving `1102..1104` visible-state mismatch as a
          reason to reopen the composed-screen rule; end-of-frame state plus
          `line + 1` already lands at `0`
        - treat the isolated `bg1_visible` mismatch as the new immediate
          frontier:
          - `1102`: `6032`
          - `1103`: `5966`
          - `1104`: `6176`
          - `1105..1117`: `2271`
        - keep `--mode7-line-bias 0` only as an explicit counterfactual /
          escape hatch for validation and source-comparison runs
        - stop spending iterations on more local `Mode 7` near-neighbor tweaks
          of the same family for the plateau:
          - bounded `36`-model grids at `1105` and `1117`
          - no zero-main candidate beats the current `2271` BG-only floor
        - current sampled evidence outside `1102..1117` now leans toward
          promotion rather than rollback:
          - frame `978`: `4 -> 0`
          - frame `982`: `4 -> 1`
          - frame `986`: `270 -> 266`
          - frame `990`: `1641 -> 1638`
          - frame `994`: `3232 -> 3228`
          - frame `1200`: `5249 -> 2551`
          - frame `1080`: `14813 -> 14816`
        - practical reading:
          - `line + 1` is no longer just a late-`00:8029` patch candidate
          - it is now the official default for the Python renderer/builders
            that drive Lane 2 evidence and compare artifacts
          - the only sampled regression so far is the tiny `+3` change on the
            already-unsolved frame `1080`
          - the shared `td2_ppu.c` file is no longer a presumed blocker for
            this rule:
            - the other-process diff does not overlap the `Mode 7` line-origin
              block
            - a surgical runtime patch closes isolated scene renders at
              `1102/1105/1117` to `0`
          - the remaining caution is operational, not semantic:
            - use `--sequence /dev/null` for isolated `--snes-bg-*` runtime
              validation so the default intro-loop manifest does not overwrite
              the requested scene
          - the export-side ambiguity is now closed:
            - `tools/mesen_ppu_extract/Program.cs` writes `layers/bg1.ppm`
              from `GetTilemap(...)` and derives `layers/bg1_visible.ppm`
              through `NormalizeScroll(...) + CropVisibleRegion(...)`
            - the dedicated crop audit closes that exact path at
              `1102/1105/1117` with `0` mismatched pixels
            - `layers/bg1_visible.ppm` should therefore be treated as a
              viewer/export surface, not as the exact on-screen `BG1`
              contribution target for this slice
          - the next concrete step returns to Lane 2 continuity:
            - resume later-window callback/provenance/native replacement work
              beyond `1117`
            - keep `main_visible.ppm` as the composed-scene parity surface for
              renderer validation

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
  - `.mesen-config/Mesen2/SaveStates/game_11.mss` remains a usable
    deterministic track-start seed, but it must now be treated as versioned
    evidence rather than a stable implicit baseline
  - bounded scripted-input sweep result:
    - `b_hold` first becomes nontrivial at frame `76` and moves again at `92`
    - `start_then_b_hold` stays a static seed after frame `64`
    - current refreshed sweep (`v2_current`) now also keeps `start_then_a_hold`
      static after its first nontrivial frame `64`
  - the newer fingerprinted sweep changes the current-seed read materially:
    - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
    - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
    - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.json`
    - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.json`
    - on savestate SHA-256
      `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`,
      both `a_hold` and `b_hold` are dynamic and pixel-identical across the
      first `300` captured frames
    - `a+b` stays aligned with that same lane through frame `218` and first
      diverges at frame `219` with bbox `[99, 75, 153, 113]`
    - the current `b_hold` output no longer matches the older promoted
      `v2_current` `b_hold` from capture `0`, so the old `76/92/108` cadence
      cannot be assumed to describe the mutable current seed
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
  - first exploit the new current-seed branch before reopening the older
    `76/92/108` debugger path:
    - compare `a_hold` vs `a+b` around frame `219`
    - use that first divergence as the next gameplay-facing ownership target
      because it already localizes to a concrete bbox instead of a whole-frame
      phase split
  - only after that, return to the older visible-phase debugger lane on the
    frame-`91` burst / frame-`92` reset if the `219` branch does not yield a
    clearer gameplay-facing subsystem boundary

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
