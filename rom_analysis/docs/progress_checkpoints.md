# ROM Archaeology Progress Checkpoints

Snapshot date: `2026-03-19`

This file tracks plan progress as checkpoints with objective evidence and the
next gate needed to advance.

## Plan Position (Across All Lanes)

| Lane | Status | Completion read |
|---|---|---|
| Lane 1: Bank30 compression provenance | active | core pipeline is in place; unresolved targets remain |
| Lane 2: Mesen tile/sprite/tilemap design handoff | active | extraction + design packs are operational; contiguous provenance windows still cover `1086..1117`, the later direct-hit cluster `7051/7059/7064` is now packaged with exact provenance anchors, and the remaining Lane 2 question is whether a small interior sample set is enough to promote that later scene into a contiguous window |
| Lane 3: Gameplay-era frame archaeology | active | refreshed sweep `v2_current` keeps `b_hold` as the only dynamic seed lane; visible-phase scanline sampling now explains the screenshot-vs-end-frame split, the queue-cursor equalization path is directly observed through frames `90..92`, and the remaining edge is the frame-`91` `0x14B8` burst plus the frame-`92` reset while the active `0600` queue stays empty |
| Lane 4: Bank API contracts (30/10/11) | queued | baseline hypotheses documented, contracts not yet proven |

## Execution Reset (2026-03-19)

- The port plan now treats maintainability cleanup as a first-class execution
  track alongside the active archaeology lanes.
- The first cleanup slice is repo hygiene and portability:
  - fix ignore policy
  - untrack generated `mesen_ppu_extract` build output
  - untrack mutable `.mesen-config/Mesen2/LuaScriptData` output
  - remove hard-coded personal Mesen paths from promoted scripts and Makefiles
- The first renderer-correctness cleanup checkpoint now exists:
  - the mirrored non-square OBJ regression is covered by a generated 16x32
    vertical-flip fixture that validates Python simple, Python `mode7-ppu`,
    and SDL runtime paths against one golden PPM
- Repo garbage cleanup is now an explicit maintained tool target instead of an
  ad hoc manual sweep.
- This refocus does not replace the lane order; it is intended to unblock the
  current intro/bootstrap push and make later port work less fragile.

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
    `l001210-probe-matrix`, `l001210-trace-summary`, `bank30-registry`
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

### CP-06: Validation gates and state contracts

- Added pixel-gate runner:
  - `tools/check_regression_gates.py`
- Added callback contract runner:
  - `tools/validate_callback_contracts.py`
- Added contracts:
  - `validation/regression_gates_intro.jsonc`
  - `rom_analysis/docs/callback_state_contracts.jsonc`
- Added gate usage doc:
  - `rom_analysis/docs/validation_gates.md`

### CP-05: Deterministic `L001210` probe matrix harness

- Extended boot probe input controls:
  - `TD2_BOOT_PROBE_INPUT_END_FRAME`
  - `TD2_BOOT_PROBE_INPUT_WINDOWS` (`start-end:buttons;frame:buttons`)
- Added scenario runner:
  - `tools/run_l001210_probe_matrix.py`
- Added make target:
  - `make -C tools l001210-probe-matrix`
- Evidence:
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.md`

Matrix v1 outcome (`1500` frames, `4` scenarios):

- no `1E:E91F` hits
- no `1E:EE7F` hits
- no `1E:DA96` hits
- no `1E:9681` hits
- `1E:DF6C/E039/E73F/E800` still appear in the expected attract-window runs
- periodic `start` pulses can suppress bank30 usage entirely for that window (`0` bank30 hits)

### CP-07: First tilemap-to-ROM provenance window (`1086..1093`)

- Added provenance builder:
  - `tools/build_tilemap_chunk_provenance.py`
- Added bank-13 validation lane for runtime source enrichment:
  - `tools/out/bank13_headers.json`
  - `tools/out/bank13_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` is the active main-screen tile layer for all frames `1086..1093`.
- `chrBaseWords = 0x2000`.
- Runtime chunk anchor: `0D:C4DC` (`26FB`, decoded size `4000` bytes).
- Evidence confidence by frame:
  - `1088`: direct runtime hit
  - `1089..1093`: carry-over from the same hit
  - `1086..1087`: nearest-forward assignment to frame `1088` (lower confidence)

### CP-08: Extended `L001210` unresolved-candidate sweep (`matrix v3`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - added per-hit selectors: `$1C78`, `$1C80`, `$1CA8`, `$1CAC`, `$1CAE`
- Ran custom matrix v3:
  - `tools/out/l001210_probe_matrix_v3_scenarios.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.md`

Matrix v3 outcome (`7` scenarios, `45000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- confirmed bank30 sources only:
  - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800` (`7` hits each aggregate)
- strongest positive scenario:
  - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
- strongest suppression scenario:
  - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits

### CP-09: Timed pulse sweep for attract-transition windows (`matrix v5`)

- Ran timed pulse matrix:
  - `tools/out/l001210_probe_matrix_v5_scenarios.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.md`
- Scenario set (`12` runs, `4000` frames each):
  - `start` pulse at frames `240/600/900/1200/1500/1800/2100/2400`
  - `start,b` pulse at frames `1200/1500/1800/2100`

Matrix v5 outcome (`48000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- strongest positive scenarios:
  - `pulse_start_240` and `pulse_start_600`: `36` total hits, `8` bank30 hits
- strongest suppression scenarios:
  - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
- `start,b` single-frame pulses mirrored `start`-only outcomes at matching frames.
- caller coverage remained limited to:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - no hits observed from `01:B256`, `01:B273`, `01:B59B`

### CP-10: `L00A9*` index telemetry on `L001210` caller sites (`matrix v6`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - per-hit caller CPU regs (`A/X/Y/PC/SP/PS/D/DBR/K`)
  - derived `L00A9A0/L00A9CB` table index + expected source pointer
  - per-hit `caller_l00a9_source_matches`
- Ran compact verification matrix:
  - `tools/out/l001210_probe_matrix_v6_scenarios.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.md`

Matrix v6 outcome (`3` scenarios, `12000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- `L00A9` source derivation consistency:
  - `58/58` `L00A9A0/L00A9CB` hits had `caller_l00a9_source_matches = true`
- observed `L00A9*` indices:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- observed bank30-producing indices:
  - `28` and `29` only (both `L00A9A0` and `L00A9CB`)
- no observed index `32` (`0x20`, `1E:EE7F`)

### CP-11: Forced `L00B1F9` selector branch tests (`matrix v7`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - frame-window selector forcing:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_1C78`
    - `TD2_BOOT_PROBE_FORCE_1C80`
    - `TD2_BOOT_PROBE_FORCE_1CA8`
    - `TD2_BOOT_PROBE_FORCE_1CAC`
    - `TD2_BOOT_PROBE_FORCE_1CAE`
  - optional exec-point re-apply at dynamic index path:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1`
- Extended matrix runner scenario env support:
  - `tools/run_l001210_probe_matrix.py` now accepts `extra_env` per scenario
- Ran forced matrix:
  - `tools/out/l001210_probe_matrix_v7_force_index32_scenarios.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.md`

Matrix v7 outcome (`5` scenarios, `20000` total frames):

- forced selector state confirmed on bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- observed `L00A9*` indices unchanged:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- no observed index `32` (`0x20`, `EE7F`) despite forced branch condition
- caller coverage still excludes:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-12: Caller-family activation around the `01:BE43` window (`matrix v10a/v10b`)

- Ran directional-hold matrix:
  - `tools/out/l001210_probe_matrix_v10a_be43_directional_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.md`
- Ran button-map pulse matrix:
  - `tools/out/l001210_probe_matrix_v10b_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.md`

Matrix v10 outcome (`16` scenarios, `117000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- caller-family expansion reached non-`L00A9*` callsites:
  - `01:8E3C`, `01:8E59`
- observed `L00A9*` index set expanded to include:
  - `7`, `8`, `9`, `10`, `11`, `22`, `25`
- bank30-producing indices remained:
  - `28` and `29` only
- target caller set remained unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-13: Extended `01:9016` sequence stress (`matrix v11/v11b`)

- Ran pulse-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.md`
- Ran hold-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11b_9016_holds_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.md`

Matrix v11 outcome (`16` scenarios, `200000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- per-scenario bank30 profile remained fixed:
  - `12` bank30 hits per scenario (`DF6C/E039/E73F/E800`, `3` each)
- bank30 selector tuple remained stable across all bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` hits)
- target caller set still unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-14: `L00B1F9` precondition forcing audit (`matrix v12/v12b`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - additional forced-state knobs:
    - `TD2_BOOT_PROBE_FORCE_1C86`
    - `TD2_BOOT_PROBE_FORCE_1D10`
  - explicit `01:B1F9` exec telemetry:
    - `b1f9_exec_count`
    - `b1f9_exec_frames`
  - per-hit trace additions:
    - `selector_1c86`
    - `state_1d10`
- Ran precondition matrix:
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.md`
- Ran explicit `B1F9` exec-check matrix:
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.md`

Matrix v12/v12b outcome (`8` scenarios, `72000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- no caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`
- `B1F9` execution remained absent in this lane:
  - `b1f9_exec_count = 0` in all `v12b` scenarios
- forcing selector/precondition state changed captured state as intended but did not
  alter runtime caller-family coverage.

### CP-15: Forced callback activation into `01:9568/01:95AD` (`matrix v13`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - main-callback forcing window:
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK`
- Extended matrix runner env cleanup support:
  - `tools/run_l001210_probe_matrix.py` now clears the callback-forcing env keys
    between scenarios.
- Ran callback activation matrix:
  - `tools/out/l001210_probe_matrix_v13_callback_activation_scenarios.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.md`

Matrix v13 outcome (`5` scenarios, `16000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback-only scenarios (`01:9568`/`01:95AD`) reduced total trace activity:
  - `6` total hits each, `0` bank30 hits each
- callback + state-forced scenarios reached `B1F9` once:
  - `b1f9_exec_count = 1` at frame `1201` (`01:9568` and `01:95AD` variants)
- despite a `B1F9` entry, no `L001210` calls were observed from:
  - `01:B256`, `01:B273`, `01:B59B`
- combined `v13` caller coverage remained:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`

### CP-16: `B1F9` internal stage telemetry (`matrix v14`)

- Extended probe telemetry in `validation/mesen_probe_boot.lua`:
  - top-level `B1F9` stage counters:
    - `b1f9_stage_counts` (`b226`, `b256`, `b273`, `b59b`)
    - `b1f9_stage_frames`
  - stage exec callbacks:
    - `01:B226`
    - `01:B256`
    - `01:B273`
    - `01:B59B`
- Ran stage-trace matrix:
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_scenarios.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.md`

Matrix v14 outcome (`3` scenarios, `6600` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback+state scenarios still showed:
  - `b1f9_exec_count = 1`
- but `B1F9` internal stage counters remained zero:
  - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
- no `L001210` caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-17: `B1F9` prologue exec-point trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_EXEC_POINTS`
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS`
  - top-level `exec_point_trace` bundle in `td2_boot_probe.json`
- Ran targeted forced-callback probes with explicit watchpoints:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`
- Watch list:
  - `00:050F`
  - `00:083F`
  - `01:B1F9`
  - `01:B202`
  - `01:B206`
  - `01:B226`
  - `01:B256`
  - `01:B273`
  - `01:B59B`

Exec-trace outcome (`2` scenarios, `2200` frames each):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- headless exec-point trace recorded only the entry point:
  - `01:B1F9`
- no exec hits were observed at:
  - `00:050F`, `00:083F`
  - `01:B202`, `01:B206`
  - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
- shared `B1F9` entry snapshot across both lanes:
  - `$1C80/$1CA8 = 0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
  - `$0960 = 0`
- lane-specific difference at entry:
  - forced `01:9568` shows `$0F77 = 1`
  - forced `01:95AD` shows `$0F77 = 0`
- note:
  - this first prologue bundle was captured before exec-point traces honored
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`; the
    corrected late-window read is recorded in `CP-20`
- practical reading:
  - the headless runner now proves the `B1F9` entry context, but still does not
    expose post-entry helper/return flow through pure exec watchpoints.

### CP-18: `B1F9` prologue side-effect trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_WRITE_POINTS`
  - `TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS`
  - top-level `write_point_trace` bundle in `td2_boot_probe.json`
- Ran bounded forced-callback write-trace probes:
  - `tools/out/b1f9_sideeffect_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_sideeffect_trace_95ad/td2_boot_probe.json`
- Traced write points:
  - `00:420C` (`HDMAEN`)
  - `00:2106` (`MOSAIC`)
  - `00:2105` (`BGMODE`)
  - `00:2107/2108/2109` (`BG1SC/BG2SC/BG3SC`)
  - `00:210B` (`BG12NBA`)
  - `00:2101` (`OBJSEL`)
  - `00:212C` (`TMAIN`)
  - `00:2131/2130` (`CGADSUB/CGWSEL`)
  - `00:212E/212D/212F` (`TMW/TSUB/TSW`)
  - `00:2123/2124/2125` (`W12SEL/W34SEL/WOBJSEL`)
  - `7E:0966`
  - `7E:0968`
  - `7E:0974`
  - `00:0F42`

Write-trace outcome (`2` scenarios, `2200` frames each, trace window `1200..1202`):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- both lanes recorded:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- no traced writes were observed for:
  - `L0004DF`-style side effects (`HDMAEN`, `$0966/$0968`)
  - `L00050F/L00052E` reset writes (`$0974`, `CGADSUB/CGWSEL/TMW/TSUB/TSW`, window registers, `MOSAIC`, `SETINI`)
  - `L00083F` setup writes (`BGMODE`, `BG1SC/BG2SC/BG3SC`, `BG12NBA`, `$0F42`)
  - immediate `B1F9` setup writes (`TMAIN`, `OBJSEL`)
- practical reading:
  - in the headless forced lane, the observed `01:B1F9` entry still does not
    produce any of the expected helper/setup side effects in the surrounding
    frame window.

### CP-19: `B1F9` caller stack proof

- Extended exec-point payload in `validation/mesen_probe_boot.lua`:
  - `stack_addr`
  - `stack_bytes`
  - `stack_return_minus_one`
  - `stack_return_rts`
- Re-ran narrow forced-callback entry probes for `01:B1F9`.
- Evidence:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`

Stack outcome:

- forced `01:9568` lane:
  - `stack_return_rts = 0x9575`
  - this matches the post-`jsr L00B1F9` site at `L009575`
- forced `01:95AD` lane:
  - `stack_return_rts = 0x95B7`
  - this matches the post-`jsr L00B1F9` site immediately after the `L0095AD`
    call sequence
- deeper stack word on both lanes:
  - `0x82A0` (`+1 -> 0x82A1`)
  - this matches the bank-0 main-callback dispatcher wrapper that pushes a
    synthetic return before `jmp [$0038]`
- practical reading:
  - the forced entry is a real bank-1 `jsr` into `L00B1F9`, not an artifact of
    the callback pointer override alone
  - the call chain shape is now also consistent with normal NMI callback
    dispatch:
    - bank 0 dispatcher -> `01:9568/01:95AD` -> `01:B1F9`
- the unresolved problem is now narrower:
  - why the real `jsr` path in the headless forced lane still shows no
    downstream helper/setup exec hits or writes

### CP-20: `B1F9` return-window correction and caller-side `1CA8` increment

- Fixed probe behavior in `validation/mesen_probe_boot.lua`:
  - exec-point callbacks now honor
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`
- Updated validation note in `validation/README.md`.
- Ran a corrected late-window forced-callback probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_return_trace_9568/td2_boot_probe.json`

Corrected late-window outcome (`2200` frames, trace window `1200..1202`):

- observed exec points:
  - `00:82A1` at frame `1200`
  - `01:B1F9` at frame `1201`
- no exec hit was observed at:
  - `01:9575`
- frame snapshots for `1200..1201` still show the forced pre-call state:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
- but the corrected `01:B1F9` exec snapshot records:
  - `$1CA8 = 3`
  - `stack_return_rts = 0x9575`
- static caller read now explains that delta:
  - `L009568` does `inc $1CA8` before `jsr L00B1F9`
  - `L0095AD` does the same
- static `L00B1F9` read also explains why an immediate `01:9575` hit is not the
  best next proving surface:
  - after entry/setup, the routine can run long internal wait loops at
    `L00B638` / `L00B6E3` before it reaches `L00B755` and returns to the caller
- practical reading:
  - the old “entry sees `$1CA8 = 2`” interpretation was too literal; the forced
    frame state is `2`, but both known callers increment it before the `jsr`
  - the missing immediate `01:9575` hit no longer points to a broken call chain;
    it is consistent with `L00B1F9` doing longer in-routine work before return
  - the next low-thrash lane should target the `L00B638` / `L00B6E3` wait/exit
    conditions or use manual debugger confirmation, not more immediate-return
    watchpoints

### CP-21: Per-point-capped `B1F9` wait/exit surface check

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT`
- Added the same env cleanup to `tools/run_l001210_probe_matrix.py`.
- Updated validation note in `validation/README.md`.
- Ran a widened forced-callback wait/exit probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_surface_9568/td2_boot_probe.json`

Wait/exit outcome (`2200` frames, trace window `1200..1800`):

- watch list:
  - `01:B1F9`
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- trace budget:
  - `exec_point_max_hits = 16`
  - `exec_point_max_hits_per_point = 1`
- observed exec hits:
  - `01:B1F9` once at frame `1201`
- no exec hits were observed at:
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- the per-point cap did not hide later hits:
  - `exec_point_trace.dropped_hits = 0`
- practical reading:
  - removing repeat-budget pressure still does not expose any downstream
    `L00B1F9` progress in the headless exec surface
  - this is a stronger negative than the earlier immediate-return probe because
    the window is wide and the trace no longer risks being flooded by loop hits
  - the next useful proving lane should move away from headless exec
    watchpoints and toward manual debugger confirmation or a different state/write
    instrumentation surface around the `L00B638` / `L00B6E3` wait conditions

### CP-22: `B1F9` wait-path WRAM write surface check

- Ran a widened forced-callback WRAM write trace for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_wram_9568/td2_boot_probe.json`

Write-surface outcome (`2200` frames, trace window `1200..1800`):

- watched state writes:
  - `7E:0960`
  - `7E:0964`
  - `7E:0200`
  - `7E:0202`
  - `7E:1E2C`
  - `7E:0440`
  - `7E:0442`
  - `7E:0444`
  - `7E:040A`
- observed write hits:
  - none
- trace result:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- nearby frame snapshots (`1200..1210`) remain flat at:
  - `$0960 = 0`
  - `$0200 = 0`
  - `$0202 = 1`
  - `$1E2C = 0`
  - `$0440/$0442/$0444 = 0/0/0`
  - `$040A = 0x0011`
- practical reading:
  - even a different headless state/write surface around the expected
    `L00B638` / `L00B6E3` wait-path state does not reveal progress beyond the
    known `01:B1F9` entry
  - this is enough evidence to treat the current headless `B1F9` lane as
    low-yield; the remaining useful follow-up is manual debugger work or a shift
    to the next unblocked roadmap lane

### CP-23: Second contiguous tilemap provenance window (`1094..1101`)

- Built a second design-pack range:
  - `tools/out/design_mesen_range_1094_1101_v1/design_pack_range.json`
- Added bank-7 chunk validation metadata:
  - `tools/out/bank7_compression_headers.json`
  - `tools/out/bank7_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1094..1101`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance advances across the same visible tilemap block:
  - `1094..1095`: carry-over from `0D:C4DC` (`26FB`, bank 13) hit at frame `1088`
  - `1096`: direct runtime hit at `07:BF49` (`42FB`, bank 7)
  - `1097..1100`: carry-over from `07:BF49`
  - `1101`: direct runtime hit at `07:C112` (`26FB`, bank 7)
- Validation metadata now exists for all three anchors:
  - `0D:C4DC`: `output_size = 4000`
  - `07:BF49`: `output_size = 4102`
  - `07:C112`: `output_size = 2832`
- runtime-binding note:
  - this window uses the preserved
    `tools/out/l001210_probe_matrix_v1/periodic_start_pulses_240_1800_l001210_exec.json`
    trace because the original ad hoc `.mesen` runtime trace was overwritten
    later; the preserved trace matches the contiguous `1088/1096/1101` hit
    sequence used for this late-attract block
- practical reading:
  - the visible `bg1` tilemap stays constant while the backing runtime chunk
    source changes underneath it
  - the next useful Lane 2 step is to capture and bind the next contiguous block
    after `1101`, not to keep reworking `1086..1101`

### CP-24: Carry-covered continuation of the late-attract tilemap window (`1102..1117`)

- Built two follow-on design-pack ranges:
  - `tools/out/design_mesen_range_1102_1109_v1/design_pack_range.json`
  - `tools/out/design_mesen_range_1110_1117_v1/design_pack_range.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.md`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`
- Extended the memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1102..1117`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance stays on the same validated bank-7 source for the full carry-covered block:
  - `1102..1109`: `07:C112` (`26FB`, bank 7), `frame_delta = 1..8`
  - `1110..1117`: `07:C112` (`26FB`, bank 7), `frame_delta = 9..16`
- Validation metadata remains stable for the carry source:
  - `07:C112`: `output_size = 2832`, `consumed_bytes = 2333`
- practical reading:
  - contiguous late-attract tilemap provenance now covers `1086..1117`
  - `1117` is the current headless confidence edge because it exactly exhausts
    the current carry window from the direct `1101` hit, and the preserved
    `periodic_start_pulses_240_1800` trace has no later direct hit after `1101`
  - a scripted-input attempt to open the later direct-hit cluster
    (`6800:start;6900-6920:start,a` -> `7051/7059/7064`) was tried three ways in
    the extractor bridge and failed on the same boundary: once
    `InitializeDebugger` + input overrides were enabled, the Mesen bridge did
    not advance frames
  - per the blocker policy, that extractor lane is now documented and parked;
    the next useful move is either a different bridge surface for a later direct
    runtime hit or a pivot to the next roadmap lane

### CP-25: First deterministic gameplay-seed window (`track1`, frames `86..93`)

- Verified an existing deterministic seed savestate:
  - `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Revalidated the screenshot harness against that seed:
  - `validation/mesen_capture.lua` captures `300` frames after `60` warm-up
    frames with `b` held
  - the first nontrivial screenshot appears at capture index `26`
    (script frame `86`)
- Added a seeded gameplay-range dump lane in `validation/mesen_dump_bg_range.lua`:
  - the dumper now accepts the same simple fixed input window controls used by
    the other validation harnesses
- Captured the first raw gameplay-seed window:
  - `tools/out/track1_seed_0086_0093_v2.json`
  - `tools/out/track1_seed_0086_0093_v2_sequence.txt`
  - `tools/out/track1_seed_0086_0093_v2_sequence.json`
- Added a committed window note:
  - `rom_analysis/maps/tracks/track1_seed_0086_0093.md`

Window reading:

- The flat dump covers frames `86..93` from the seeded run with `b` held during
  script frames `60..359`.
- Frame `86` renders back from `VRAM + CGRAM + PPU state + OAM` with `0`
  mismatched pixels against the screenshot harness image
  `td2_track1_accel_frame_00026.png`.
- Render-side reading for the captured seed window:
  - `bgMode = 1`
  - `mainScreenLayers = 0x04`
- The captured scene is static across the full `86..93` window:
  - `VRAM` diff `0`
  - `CGRAM` diff `0`
  - `OAM` diff `0`
  - rendered BG output unchanged between frames `86` and `93`
- Probe-side callback/state context over the same seeded input window remains
  trivial:
  - `active_main = 00:8029`
  - `active_nmi = 00:8029`
  - tracked `$0202/$0204/$0206/$0208/$020A/$040A/$0054` all stay `0`
- practical reading:
  - `game_11.mss` is a valid deterministic seed for track-start visuals
  - this specific raw `86..93` window is still static under the original
    `b`-hold path
  - the next gameplay follow-up should be a seeded button sweep or a different
    savestate nearer active driving

### CP-26: Seeded gameplay sweep and early raw-bridge blocker (`track1`)

- Extended the gameplay capture path for automation:
  - `validation/mesen_capture.lua` now accepts env-driven capture controls and
    multi-window inputs
  - `validation/mesen_dump_bg_range.lua` now accepts
    `TD2_BG_RANGE_INPUT_WINDOWS`
  - `validation/run_mesen_capture.sh` now creates parent directories for
    capture/bg-range output prefixes
- Added a bounded gameplay sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `make -C tools track1-seed-sweep`
- Added the sweep note:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v1.md`
- Sweep artifacts:
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`

Sweep reading:

- `b_hold` (`60-359:b`) is dynamic:
  - first nontrivial frame `76`
  - first later motion `92`
  - `4` distinct screenshot hashes
- `start_then_b_hold` (`60:start;61-359:b`) remains a static seed:
  - first nontrivial frame `64`
  - no later motion in the bounded `300`-frame run
- `start_then_a_hold` (`60:start;61-359:a`) is also dynamic:
  - first nontrivial frame `61`
  - first later motion `65`
  - `3` distinct screenshot hashes

Targeted raw follow-up:

- Captured the earliest dynamic raw window for `start_then_a_hold`:
  - `tools/out/track1_start_then_a_0061_0068_v1.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.txt`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_delta_61_65.json`
- Added a screenshot probe of the exact same dumper lane:
  - `tools/out/track1_start_then_a_frame61_probe_v1_frame_00061_frame.png`

Blocker reading:

- the moving-window blocker has changed:
  - movement is now proven at the screenshot level from `game_11.mss`
  - but the early `start_then_a_hold` raw bridge does not align with that
    screenshot sweep
- three narrowing attempts all held the same boundary:
  - raw frame `61` renders as `bgMode = 0`, `mainScreenLayers = 0x00`
  - the dumper screenshot differs from the sweep screenshot for frame `61` by
    `51503` pixels
  - that mismatch stays flat across nearby sweep frames `60..70`
  - raw `VRAM/CGRAM/OAM/PPU` state stays unchanged from frames `61` to `65`
- per the blocker policy, that exact early raw-bridge lane is now documented and
  parked
- next useful gameplay follow-up:
  - use the new screenshot-backed `b_hold` cycle as the next binding target, or
  - replace `game_11.mss` with a later gameplay savestate whose raw dump aligns
    cleanly

### CP-27: Screenshot-backed `b_hold` gameplay cycle (`track1`, frames `76..156`)

- Added a capture-log sequence builder:
  - `tools/build_capture_sequence_manifest.py`
  - `make -C tools track1-b-hold-cycle`
- Added the committed gameplay-cycle note:
  - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
- Refreshed the sweep source behind that cycle:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
- Built screenshot-backed runtime artifacts:
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`

Cycle reading:

- the selected `b_hold` window covers script frames `76..155`
- collapsed runtime artifact:
  - `5` image entries
  - `4` distinct screenshot states
  - `16` frames per state
- transition frames:
  - `76`, `92`, `108`, `124`, `140`
- cadence read:
  - frame `140` reuses the frame-`76` image
  - the visible track-start motion therefore closes one screenshot-backed
    `64`-frame cycle
- context binding note:
  - the first state still covers the known screenshot-validated frame `86` from
    `track1_seed_0086_0093.md`
  - the screenshot transition at frame `92` is now the next unbound
    `VRAM/CGRAM/OAM/PPU` / probe edge
- initial gameplay contract pointers now referenced in the cycle note:
  - bank 10 external entries from `rom_analysis/code/physics.asm`
  - bank 11 render/IRQ anchors from `rom_analysis/code/render.asm`
- practical reading:
  - gameplay archaeology now has a reusable moving reference artifact even
    while the early raw-bridge mismatch remains parked
  - the next best Lane 3 step is to bind one later cycle state (`92` or `108`)
    back to raw/probe context, or switch to a later gameplay savestate if the
    current seed keeps diverging there

### CP-28: `game_11.mss` screenshot-vs-raw blocker narrowed at `92/108`

- Refreshed the gameplay sweep on the current harness:
  - `tools/out/track1_seed_sweep_v2_current/summary.json`
  - `tools/out/track1_seed_sweep_v2_current/summary.md`
- Archived the seeded probe follow-up:
  - `tools/out/track1_b_hold_probe_0086_0108_v1/td2_boot_probe.json`
- Kept the targeted raw dump artifacts:
  - `tools/out/track1_b_hold_0086_0108_v1.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_86_92.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_92_108.json`

Current reading:

- refreshed sweep status:
  - `b_hold`: dynamic (`first_nontrivial = 76`, `first_motion = 92`)
  - `start_then_b_hold`: `static_after_first_nontrivial` (`64`)
  - `start_then_a_hold`: `static_after_first_nontrivial` (`64`)
- raw/probe follow-up on the same `b_hold` seed lane:
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `86 -> 92`
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `92 -> 108`
  - probe-side callback/state remains flat at `86`, `92`, and `108`:
    - `active_main = active_nmi = 00:8029`
    - tracked `$0200/$0202/$0204/$0206/$0208/$020A/$040A/$0440/$0442/$0444/$1E2C/$0054 = 0`
- failed but informative experiment:
  - a one-off attempt to dump raw state directly from `mesen_capture.lua`
    perturbed the `b_hold` lane into a static post-`86` capture
  - that code path was reverted in the same turn and should not be reused as
    evidence
- practical reading:
  - the blocker is no longer “find a moving gameplay lane”
  - the blocker is now “explain why the screenshot lane moves while raw/probe
    remain static on `game_11.mss`”
  - the next best step is either a later gameplay savestate or deeper debugger
    inspection on this seed

### CP-29: Visible-phase gameplay path bound on `game_11.mss`

- Extended the scanline-step probe so it can load a savestate and replay the
  same seeded input windows used by the gameplay capture harness:
  - `validation/mesen_scanline_step_test.lua`
- Added a repeatable full-sample range runner:
  - `tools/capture_scanline_samples_range.py`
- Captured seeded visible-phase samples for the first `b_hold` cycle states:
  - `tools/out/track1_b_hold_scanline_frame_0086_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v1.json`
- Archived the targeted late-scanline register trace:
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes_summary.json`
- Added the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`

Current reading:

- the screenshot-vs-raw split on `game_11.mss` is now explained as a phase
  split:
  - end-of-frame raw/probe still lands on `00:8029/00:835F` with
    `ppu.mainScreenLayers = 0x04`
  - visible-scanline sampling on frames `86`, `92`, and `108` runs under
    `02:9016` with alternating `01:96A0/01:960D` IRQ behavior and
    `ppu.mainScreenLayers = 0x13/0x17`
- the visible frame also carries real split-style motion that the end-of-frame
  dump misses:
  - `bg2_hscroll` spans `66` values
  - `bg2_vscroll` spans `101` values
  - `bg3_vscroll` toggles between `0x03FF` and `0x0014`
- late-scanline register tracing over frames `86..108` records a stable
  `16`-write pattern every frame:
  - `M7HOFS`, `M7VOFS`, `$210F-$2114`
  - all at scanlines `225..227`
  - no DMA writes, no VRAM writes
- the remaining blocker is now narrower:
  - the sampled visible-phase `PPU`/callback pattern matches across frames
    `86`, `92`, and `108`
  - only `dp_0054` differs (`0x38` at `86`, `0x48` at `92/108`)
  - screenshot transitions at `92` and `108` therefore still need a deeper
    producer-side or sprite/color-math explanation

### CP-30: Bank-1 producer-state follow-up stays flat on the visible gameplay lane

- Extended the scanline-step probe with additional producer-side fields used by
  the bank-1 IRQ path:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v2` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v2.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v2.json`
- Added the bank-1 producer and low-WRAM follow-up to the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`
- Archived start-of-frame WRAM follow-up:
  - `tools/out/track1_b_hold_wram_frame_0086_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0092_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0108_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json`
- Archived negative exec/write trace:
  - `tools/out/track1_b_hold_execwrite_trace_0086_0108_v1/td2_boot_probe.json`

Current reading:

- the added bank-1 producer-side WRAM fields stay identical across frames
  `86`, `92`, and `108`:
  - `$1396`
  - `$13A4/$13A6/$13A8/$13AA/$13AC/$13AE`
  - `$13B4/$13B6/$13BA`
  - `$1CE6/$1CEB/$1CEC`
  - `$1E1C/$1E1E`
  - `$0F3A`
- visible window and OAM summary fields also stay identical across those same
  three frames
- targeted end-of-frame write/exec tracing against `02:9016`, `01:960D`,
  `01:96A0`, and the corresponding bank-1 producer-side WRAM addresses records
  no hits in the traced `86..108` window
- the low-WRAM queue follow-up is also negative:
  - the archived `td2_boot_probe_startframe_wram.bin` dumps keep the sampled
    `0600` region flat across `86`, `92`, and `108`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json` therefore has
    `0` active parsed queue entries for all three frames
- practical reading:
  - even after widening the visible-phase probe to bank-1 producer-side state,
    sampled `dp_0054` remains the only known field that separates frame `86`
    from frames `92/108`
  - the next best Lane 3 target is to bind that sampled `dp_0054` field to its
    real producer/base before spending more time on bank-1 WRAM mirrors

### CP-31: Visible-phase `dp_0054` is a real `7E:0054` WRAM field

- Extended the scanline-step probe with direct-page-base and explicit WRAM
  mirror samples:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v3/v4` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v4.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v4.json`
- Archived the low-page/WRAM write-trace follow-up:
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`

Current reading:

- `v3` rules out a hidden direct-page-base explanation:
  - `cpu.d = 0` on all sampled scanlines for frames `86`, `92`, and `108`
  - the effective direct-page address therefore stays fixed at `0x0054`
- `v4` binds the sampled value to real WRAM during the visible phase:
  - visible `00:0054..0056` matches `7E:0054..0056` exactly
  - frame `86` carries `7E:0054..0056 = 0x38/0x90/0x15`
  - frames `92` and `108` carry `7E:0054..0056 = 0x48/0x90/0x15`
  - only `7E:0054` changes across those three frames
- the end-of-frame write-trace lane remains a negative-but-useful result:
  - tracked writes hit only late `00:0055 = 0x84` and `00:0056 = 0x17`
    once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0054..0056`
  - end-of-frame frame snapshots at `86/92/108` still read `dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the remaining gameplay discriminator is now bound to visible-phase
    `7E:0054`, not an ambiguous low-page alias
  - the next best Lane 3 target is to trace the producer/reset path that takes
    visible-phase `7E:0054` from `0x38 -> 0x48 -> 0x00`

### CP-32: Visible-phase `7E:0053/0054` is a drained queue cursor pair

- Extended the scanline-step probe with explicit queue-cursor and parsed
  `0600` descriptor summary samples:
  - `validation/mesen_scanline_step_test.lua`
- Added a queue-summary helper:
  - `tools/summarize_scanline_dma_queue.py`
- Captured refreshed `v5` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v5.json`
  - `tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json`
- Archived the queue-cursor follow-up trace:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe_trace_summary.json`

Current reading:

- visible-phase `v5` samples now bind the queue cursor pair directly:
  - frame `86`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x38`
  - frames `92` and `108`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x48`
  - all three frames keep `7E:0055/0056 = 0x90/0x15`
- the sampled visible queue window is drained, not growing:
  - `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines for
    frames `86`, `92`, and `108`
  - `queue_dma_nonzero_entry_count = 32`, so the `0600` ring still contains
    stale descriptor content outside the active read/write window
- the end-of-frame cursor trace remains negative-but-useful:
  - tracked writes still hit only late `00:0053 = 0`, `00:0055 = 0x84`, and
    `00:0056 = 0x17` once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0053/0054`
  - end-of-frame snapshots at `86/92/108` still read `dp_0053 = dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the old “mystery `7E:0054`” read is now too vague; the sampled gameplay
    discriminator is the visible-phase queue cursor pair `7E:0053/0054`
  - the next best Lane 3 target is to trace the bank-0 cursor advance/reset
    path that takes visible `0x38/0x38` or `0x48/0x48` back to `0x00/0x00`

### CP-33: Late gameplay cursor reset splits into two sampled phases

- Extended the scanline-step range wrapper with optional exec/write trace-point
  pass-through:
  - `validation/mesen_scanline_step_test.lua`
  - `tools/capture_scanline_samples_range.py`
- Archived the mirrored-bank boot-probe rerun:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
- Captured the widened scanline-local late-phase trace:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`

Current reading:

- the mirrored-bank boot-probe rerun closes one simple ambiguity:
  - tracing `80:01AB/021E/04DF/06ED/0715/0798/1A70`, `81:8A7F`, and
    `82:08B2/09CD` still records `exec_hit_count = 0`
  - the old negative exec result was therefore not just a `00:` vs `80:`
    bank-mirror mistake
- the scanline-local trace adds a new late boundary on frame `86`:
  - `224`-sample trace (`v1`) records no exec or write hits through the visible
    phase
  - `260`-sample trace (`v2`) still records no exec-point hits, but it does
    catch a write trio at frame `87`, scanline `228`:
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
    - `00:0053 = 0x38`
  - at that same late point, `00:0054` still reads `0x38` and
    `active_main = 02:9016`
  - sampled scanlines `223`, `224`, `227`, and `259` all still carry
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- practical reading:
  - the late gameplay reset is now split into at least two sampled phases:
    - an intermediate post-visible stage still under `02:9016` that preserves
      the visible cursor/budget tuple
    - a later end-of-frame stage under `00:8029` that collapses to
      `00:0053/0055/0056 = 0x00/0x84/0x17`
  - the next best Lane 3 target is to extend the scanline-local trace farther
    until that `02:9016 -> 00:8029` handoff is observed directly

### CP-34: Frame-boundary sampling keeps frame `87` on the visible gameplay path

- Extended the scanline-step probe with explicit frame-boundary snapshots:
  - `validation/mesen_scanline_step_test.lua`
- Passed the new `frame_events` payload through the range wrapper:
  - `tools/capture_scanline_samples_range.py`
- Captured the boundary-aware late-phase reruns:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`

Current reading:

- `v3` (`260` samples) now records explicit frame-boundary snapshots:
  - frame `86 start` at scanline `0`
  - frame `86 end` at scanline `225`
  - both still read `active_main = 02:9016` and
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- `v4` (`360` samples) extends past the scanline wrap:
  - frame `87 start` at scanline `0` still reads the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the sampled scanline stream wraps at sample `262`
    (`scanline 261 -> 0`) and still does not leave `02:9016`
  - the last sampled point is frame `87`, scanline `97`, still with
    `02:9016` and `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the only traced late writes in that widened window remain:
  - frame `87`, scanline `228`
  - `00:0053 = 0x38`
  - `00:0055 = 0x90`
  - `00:0056 = 0x15`
- practical reading:
  - the visible gameplay path now survives across frame `86 end`, frame `87`
    start, and at least through frame `87`, scanline `97`
  - the remaining `02:9016 -> 00:8029` handoff is therefore later than that
    boundary
  - the next best Lane 3 target is to extend the same bounded trace through the
    rest of frame `87` and into frame `88`

### CP-35: The same late `02:9016` stage survives into frame `89`

- Captured wider boundary-aware late-phase traces:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`

Current reading:

- `v5` (`target_frame = 86`, `620` samples) now records:
  - frame `86 end`
  - frame `87 start`
  - frame `87 end`
  - frame `88 start`
  - all four frame events still read:
    - `active_main = 02:9016`
    - `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
  - the same late write trio repeats on frame `88`, scanline `227`
- shifted `v1` (`target_frame = 87`, `620` samples) extends that same result:
  - frame `87 end`
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - all four frame events still read the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the late write trio repeats again on frame `89`, scanline `228`
  - the last sampled point is frame `89`, scanline `96`, still on `02:9016`
    with the same cursor/budget tuple
- practical reading:
  - the recurring late gameplay stage under `02:9016` is now proven to survive
    through frame `89 start` and at least frame `89`, scanline `96`
  - the `02:9016 -> 00:8029` handoff is therefore later than frame `89`,
    scanline `96`
  - the next best Lane 3 target is to advance the same trace one more
    target-frame window so it covers the rest of frame `89` and enters frame
    `90`

### CP-36: First direct visible-path `00:0054` producer observed on frame `90`

- Captured the next shifted boundary-aware trace:
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`

Current reading:

- the recurring late `02:9016` stage still survives:
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - frame `89 end`
  - frame `90 start`
  - all of those frame events still read
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the new result is the first direct producer for `00:0054` on that path:
  - frame `90`, scanline `30`: `00:0054 = 0x40`
  - frame `90`, scanline `54`: `00:0054 = 0x48`
  - those writes happen under `active_main = 02:9016`
  - `00:0053` still remains `0x38`
- practical reading:
  - the visible gameplay lane itself advances the queue write pointer from
    `0x38 -> 0x40 -> 0x48` before the later sampled `0x48/0x48` state
  - the next best Lane 3 target is now to trace when and where `00:0053`
    catches up from `0x38` to `0x48`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is no longer the closest unexplained edge

### CP-37: `00:0053` catches up on frame `91`, with a transient `0x14B8` budget

- Captured the next shifted boundary-aware trace and helper-side follow-up:
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`

Current reading:

- the visible gameplay lane now has a directly observed equalization path:
  - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
  - frame `91 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `91 end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
- the frame-`91` burst is now explicit:
  - frame `91`, scanline `228`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    then `00:0055 = 0x08`, `00:0056 = 0x15`
  - frame `91`, scanline `229`: `00:0055 = 0xB8`, `00:0056 = 0x14`,
    `00:0053 = 0x48`
  - frame `92`, scanline `227`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    `00:0053 = 0x48`
- helper-side write tracing against nearby bank-1 sinks stays negative:
  - added write points at `7E:1E24/1E26/070C/0718`
  - no writes were recorded at those sinks in the same `90..92` window
- practical reading:
  - the old “find the `00:0053` catch-up” question is now closed
  - the next best Lane 3 target is now the producer/reset path behind the
    transient frame-`91` `00:0055/0056 = 0xB8/0x14` state and the frame-`92`
    reset back to `0x90/0x15`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is again the second boundary, not the first

### CP-38: Later timed-input direct-hit bridge reopened at `7051`

- Extended the Mesen extractor bridge so timed input windows work through the
  headless frame extractor:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/extract_mesen_scene_range.py`
- Added the successful later-scene extraction artifacts:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
- Re-ran the matching targeted `L001210` probe:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.md`
- Extended the supporting docs:
  - `rom_analysis/docs/memory_map.md`
  - `tools/README.md`

Current reading:

- the extractor bridge no longer stalls when timed input windows are combined
  with the headless Mesen asset path:
  - smoke validation `0-3:start` now extracts frame `8`
  - the previously blocked later-scene path
    `6800:start;6900-6920:start,a` now extracts frame `7051`
- the matching targeted probe recovers the later direct-hit cluster on that
  same scenario:
  - frame `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - frame `7059` -> `07:BF49` (`42FB`, bank 7)
  - frame `7064` -> `07:C112` (`26FB`, bank 7)
- the new one-frame provenance artifact binds the visible tilemap layers at
  frame `7051` directly to the bank-13 source:
  - `bg1` tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` tile index `0x000` at `CHR 0x3000`
  - `bg3` tile index `0x000` at `CHR 0x6000`
  - all backed by exact `runtime-hit@7051`
- practical reading:
  - Lane 2 is no longer blocked on the timed-input extractor bridge
  - headless proof now extends beyond the old `1117` carry boundary with a
    later direct runtime anchor
  - the next best Lane 2 step is to extract/design-pack `7059` and `7064` on
    the same scenario and decide whether they close a later contiguous
    provenance window around the recovered `0D:C4DC -> 07:BF49 -> 07:C112`
    sequence

### CP-39: Later direct-hit cluster packaged, but not yet promoted to a full window

- Extended the recovered later-scene extraction lane to include the remaining
  direct-hit frames:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added a combined exact-hit provenance artifact:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.md`
- Updated the supporting docs:
  - `rom_analysis/docs/next_steps_roadmap.md`
  - `rom_analysis/docs/memory_map.md`
  - `validation/README.md`

Current reading:

- the recovered later direct-hit cluster is now packaged end-to-end on the same
  timed-input scenario `6800:start;6900-6920:start,a`:
  - `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - `7059` -> `07:BF49` (`42FB`, bank 7)
  - `7064` -> `07:C112` (`26FB`, bank 7)
- the extracted design-pack range is stable across those exact-hit frames:
  - `bgMode = 1`
  - `mainScreenLayers = 0x11`
  - `forcedBlank = false`
  - `bg1` keeps tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` and `bg3` each stay on tile index `0x000`
- practical reading:
  - this closes the exact later-hit anchors, not the full `7051..7064` window
  - the source chunk changes at each recovered hit, so promoting a contiguous
    window still needs at least one interior confirmation per segment rather
    than a blind carry assumption
  - the next best Lane 2 step is a minimal interior follow-up:
    - extract/design-pack `7055` and `7061`
    - if those mid-segment samples keep the same tile-index block and map
      cleanly by carry (`7055 <- 7051`, `7061 <- 7059`), promote the later
      scene into a documented contiguous provenance window

### CP-40: Mirrored non-square OBJ regression closed and covered

- Fixed the vertical-mirror row sampling bug in both renderer implementations:
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Applied the same height-based fix to both OBJ code paths in each renderer:
  - the normal OBJ compositor
  - the Mode 7 scanline/PPU-accurate compositor
- Added a generated regression fixture and runner:
  - `tools/check_obj_vertical_flip.py`
  - `make -C tools obj-vertical-flip-check`
- Updated the validation docs:
  - `validation/README.md`
  - `tools/README.md`

Current reading:

- the old bug only showed up on vertically mirrored non-square sprites because
  the row-sampling logic incorrectly used `width` where it needed full sprite
  `height`
- the new generated fixture is intentionally minimal:
  - one 16x32 OBJ sprite
  - four unique tile rows
  - one shared golden PPM
- that single fixture now checks four paths:
  - Python simple OBJ renderer
  - Python `mode7-ppu` OBJ renderer
  - SDL non-Mode-7 OBJ renderer
  - SDL Mode 7 OBJ renderer
- practical reading:
  - the mirrored-OBJ correctness gap is now closed and guarded
  - the next cleanup-side renderer target should move to BG4 support and
    tile-priority ordering instead of revisiting this bug class ad hoc

### CP-41: Generated-clutter cleanup is now automated

- Added a repo-owned cleanup tool:
  - `tools/clean_generated_artifacts.py`
  - `make -C tools clean-generated`
  - `make -C tools clean-generated-dry-run`
- The cleanup scope is explicit and conservative:
  - build output (`port/build`, `tools/mesen_ppu_extract/bin`, `tools/mesen_ppu_extract/obj`)
  - mutable emulator output (`.mesen-config/Mesen2/LuaScriptData`, `.mesen-runs`)
  - scratch `tools/out` surfaces (`*smoke*`, `*makecheck*`, `*designtest*`,
    the vertical-flip fixture output)
  - debugger coverage junk (`game.cdl`) under `.mesen-config`, `tools/out`,
    and committed proof bundles
- Updated tooling/docs:
  - `tools/Makefile`
  - `tools/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Current reading:

- `tools/out` is the dominant local clutter surface (`2.4G` in this snapshot),
  but most of that tree is still evidence-bearing archaeology output, so the
  new cleanup target intentionally does **not** blanket-delete it
- the always-safe/scratch slice already identified here is enough to reclaim
  build products, smoke outputs, stale design-test packs, and debugger junk
  without touching referenced proof artifacts
- practical reading:
  - repo hygiene now has a repeatable cleanup path instead of one-off manual
    deletions
  - the next cleanup-side work can move back to renderer/port progress without
    letting disposable surfaces keep accumulating

### CP-42: BG4 and tile-priority rendering are now covered

- Expanded the shared renderer model from `3` BG layers to `4`:
  - `port/src/td2_types.h`
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Replaced the old implicit non-Mode-7 layer paint order with explicit ordered
  BG passes:
  - low priority `BG4 -> BG3 -> BG2 -> BG1`
  - then high priority `BG4 -> BG3 -> BG2 -> BG1`
- Fixed the per-mode BPP table so BG4 is only active in modes that actually
  expose it.
- Added a generated regression fixture and runner:
  - `tools/check_bg_layer_priority.py`
  - `make -C tools bg-layer-priority-check`
- Updated docs/cleanup wiring:
  - `validation/README.md`
  - `tools/README.md`
  - `tools/clean_generated_artifacts.py`

Current reading:

- the old non-Mode-7 path had two coupled correctness gaps:
  - hard-coded `3`-layer scene state
  - no tile-priority ordering at all
- the new fixture is intentionally tiny but targeted:
  - BG4-only cell
  - low-priority overlap cell
  - high-priority-over-low cell
  - high-priority ordering cell
- practical reading:
  - BG4 visibility and basic tile-priority ordering are now guarded in both
    renderers
  - the next renderer-side work should move to the remaining composition gaps
    rather than this older background-order failure class

## Current Checkpoint Metrics

- `L001210` no-input attract probe (`3600` frames):
  - total hits: `34`
  - runtime-confirmed bank30 starts:
    - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800`
  - repeat spacing: `1418` frames
- Alternate scripted input (`start,b`, `4000` frames):
  - total hits: `2` (`02:F51F`, `04:8000`)
  - no bank30 candidates reached
- Matrix v1 (`1500` frames each, `4` scenarios):
  - `poweron_no_input`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `hold_start_b_240_359`: `17` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `pulse_start_240`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `periodic_start_pulses_240_1800`: `17` total hits, `0` bank30 hits
- Matrix v2 (`3200` frames each, `13` scenarios):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenario:
    - `pulse_b_every120`: `81` total hits, `20` bank30 hits (still only `DF6C/E039/E73F/E800`)
- Matrix v3 (`7` scenarios, `45000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - aggregate bank30 hits:
    - `1E:DF6C/E039/E73F/E800`: `7` hits each
  - strongest positive bank30 scenario:
    - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
  - strongest suppression scenario:
    - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits
- Matrix v5 (`12` scenarios, `48000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenarios:
    - `pulse_start_240`, `pulse_start_600`: `8` bank30 hits each
  - strongest suppression scenarios:
    - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
  - aggregate bank30 caller coverage:
    - `01:A9BD`: `22`, `01:A9E1`: `22`
  - no caller hits from `01:B256`, `01:B273`, `01:B59B`
- Matrix v6 (`3` scenarios, `12000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - `L00A9*` index telemetry:
    - observed indices: `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
    - observed bank30-producing indices: `28`, `29`
    - unobserved critical index: `32` (`EE7F`)
    - derivation check: `58/58` matches
- Matrix v7 forced-branch tests (`5` scenarios, `20000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced selector values on bank30 hits:
    - `$1C78/$1C80/$1CA8 = 1/0/2`
  - observed `L00A9*` indices remained:
    - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
  - critical index still absent:
    - `32` (`EE7F`)
  - caller coverage still excludes:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v10a/v10b (`16` scenarios, `117000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - expanded caller coverage reached:
    - `01:8E3C`, `01:8E59`
  - expanded `L00A9*` index set:
    - added `7`, `8`, `9`, `10`, `11`, `22`, `25`
  - bank30-producing indices remained:
    - `28`, `29` only
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v11/v11b (`16` scenarios, `200000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - each scenario remained fixed at:
    - `66` total hits, `12` bank30 hits
  - bank30 selector tuple was constant:
    - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` bank30 hits)
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v12/v12b (`8` scenarios, `72000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
  - `B1F9` execution telemetry:
    - `b1f9_exec_count = 0` across all `v12b` scenarios
- Matrix v13 callback forcing (`5` scenarios, `16000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - callback-only forced scenarios (`01:9568`/`01:95AD`) each produced:
    - `6` total hits, `0` bank30 hits
  - callback+state forced scenarios reached:
    - `b1f9_exec_count = 1` at frame `1201`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v14 `B1F9` stage trace (`3` scenarios, `6600` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced callback+state scenarios still reached:
    - `b1f9_exec_count = 1`
  - `B1F9` stage counters stayed at:
    - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Targeted `B1F9` prologue exec traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - exec trace hits observed only at:
    - `01:B1F9`
  - no hits at:
    - `00:050F`, `00:083F`
    - `01:B202`, `01:B206`
    - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
  - shared entry tuple:
    - `$1C80/$1CA8 = 0/2`, `$1C86 = 1`, `$1D10 = 0x4100`, `$0960 = 0`
  - lane difference:
    - `$0F77 = 1` on forced `01:9568`
    - `$0F77 = 0` on forced `01:95AD`
- Corrected `B1F9` return-window trace (`01:9568`, `2200` frames, window `1200..1202`):
  - observed:
    - `00:82A1` at frame `1200`
    - `01:B1F9` at frame `1201`
  - no hit at:
    - `01:9575`
  - corrected entry read:
    - frame-level forced state still holds `$1C78/$1C80/$1CA8 = 1/0/2`
    - but the `01:B1F9` exec snapshot itself sees `$1CA8 = 3`
  - static caller explanation:
    - `L009568` and `L0095AD` both `inc $1CA8` before `jsr L00B1F9`
- Per-point-capped `B1F9` wait/exit surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed:
    - `01:B1F9` once at frame `1201`
  - no hits at:
    - `01:B226`, `01:B638`, `01:B6E3`, `01:B755`, `01:9575`
  - trace budget note:
    - `exec_point_max_hits_per_point = 1`
    - `exec_point_trace.dropped_hits = 0`
- `B1F9` wait-path WRAM write surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed writes:
    - none
  - trace result:
    - `write_point_trace.hit_count = 0`
    - `write_point_trace.dropped_hits = 0`
  - stable nearby state snapshots:
    - `$0960 = 0`, `$0200 = 0`, `$0202 = 1`, `$1E2C = 0`
    - `$0440/$0442/$0444 = 0/0/0`, `$040A = 0x0011`
- Targeted `B1F9` side-effect traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - both runs reported:
    - `write_point_trace.hit_count = 0`
  - no writes observed at:
    - `00:420C`, `00:2106`, `00:2105`, `00:2107`, `00:2108`, `00:2109`, `00:210B`
    - `00:2101`, `00:212C`, `00:2131`, `00:2130`, `00:212E`, `00:212D`, `00:212F`
    - `00:2123`, `00:2124`, `00:2125`, `7E:0966`, `7E:0968`, `7E:0974`, `00:0F42`
- Targeted `B1F9` stack-return traces:
  - forced `01:9568` lane:
    - `stack_return_rts = 0x9575` (`L009575`)
  - forced `01:95AD` lane:
    - `stack_return_rts = 0x95B7`
  - shared deeper stack word:
    - `0x82A0` (`dispatcher wrapper anchor`, `RTS -> 0x82A1`)
  - practical reading:
    - both forced lanes reach `L00B1F9` through the expected in-bank `jsr`
      call sites under the normal bank-0 callback dispatcher
- Combined caller/index telemetry (`v10a/v10b/v11/v11b`, `32` traces):
  - observed caller PCs:
    - `01:8E3C`, `01:8E59`, `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - bank30 caller PCs:
    - `01:A9BD`: `192`, `01:A9E1`: `192`
  - `L00A9` source derivation consistency:
    - `1645/1645` matches (`0` mismatches)
- Callback/state contracts:
  - `make -C tools callback-contracts-check` -> `18/18` checks passed
  - capture profile used: no-input probe, `1120` frames
- Pixel regression gates:
  - `make -C tools regression-gates REGRESSION_GATES_RENDER_DIR=../port/build/regression_frames_v2`
  - result: `6/6` checks passed (`0` mismatched pixels each)

Savestate lane blocker (current environment):

- `mesen_probe_boot.lua` can load savestates, but headless `--testRunner` does not expose
  a callable save API (`saveSavestate/saveState/serializeState` absent on `emu` table).
- probe JSON currently reports:
  - `saved_savestate_error = "no supported savestate API found on emu table"`

## Next Advancement Gates

### Gate G1 (Immediate): close P0 unresolved queue

Goal:
- observe `1E:EE7F` on runtime path and resolve `1E:E91F` decode/runtime state.

Definition of done:
- `tools/out/bank30_chunk_registry.json` no longer lists unresolved `P0`.

Current status:
- still open after matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps; no `E91F`/`EE7F` hits observed.
- caller-family expansion partially succeeded (new callsites `01:8E3C/01:8E59`), but target callsites are still absent:
  - `01:B256`, `01:B273`, `01:B59B`
- newest telemetry still shows no runtime use of `L00A9*` index `0x20` (`32`) and no bank30 producer beyond indices `28/29`.
- callback/state forcing can now trigger a single `B1F9` entry, but still does not reach
  `B1F9`'s internal `L001210` callsites (`01:B256/01:B273/01:B59B`).
- stage telemetry now shows no progress beyond entry (`B226/B256/B273/B59B` all `0`)
  in the forced lane.
- targeted exec-point tracing now also confirms the forced entry-time state on both
  `01:9568`/`01:95AD` lanes, but the headless runner still reports only `01:B1F9`
  itself and no downstream helper/return sites.
- widened per-point-capped exec tracing keeps the same boundary:
  - only `01:B1F9` is seen; no `B226/B638/B6E3/B755/9575`
- widened WRAM write tracing around the expected wait-path state also stays flat:
  - no writes at `$0960/$0964/$0200/$0202/$1E2C/$0440/$0442/$0444/$040A`
- targeted side-effect tracing is now also negative: no helper/setup writes were
  observed around the forced `01:B1F9` entry.
- caller-stack proof now closes one ambiguity: the forced lane really is entering
  from `01:9568/01:95AD`.
- corrected late-window tracing plus static caller/routine reads now show a more
  specific next proving lane:
  - use manual debugger confirmation for the remaining `B1F9` question, or move
    to the next unblocked roadmap lane in headless mode, because further
    headless exec/state/write widening has stopped changing the observed
    boundary.

### Gate G2: tilemap provenance binding for first frame window (closed)

Goal:
- produce `frame/layer/tile-index -> ROM chunk` mapping for `1086..1093`.

Definition of done:
- provenance table added to:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`

Current status:
- closed via `mesen_range_1086_1093_provenance.{jsonc,md}` and memory-map binding.

### Gate G3: gameplay-era archaeology start

Goal:
- capture first deterministic gameplay window with design pack + runtime context.

Definition of done:
- one committed gameplay window with:
  - frame range assets
  - callback/context notes
  - initial bank10/bank11 contract pointers

Current status:
- refreshed current sweep keeps deterministic screenshot movement only on
  `b_hold`
- a committed screenshot-backed `b_hold` cycle now exists for frames `76..156`
- the current open blocker is the screenshot-vs-raw/probe split on
  `game_11.mss`, not movement discovery
- visible-phase scanline work now explains the split itself and narrows the
  remaining edge to the queue cursor lifecycle:
  - visible-phase `7E:0053/0054` now has a directly observed equalization path:
    `00:0054` moves `0x38 -> 0x40 -> 0x48` on frame `90`, and `00:0053`
    catches up to `0x48` on frame `91`
  - the active visible `0600` queue window is empty (`read == write`)
  - late tracing now shows a transient frame-`91` `02:9016` state with
    `00:0055/0056 = 0xB8/0x14` before the older `00:8029` end-of-frame collapse
- next defensible target:
  - deeper debugger work on the frame-`91` burst / frame-`92` reset path, or
  - later gameplay savestate only if that cursor lane stops narrowing
