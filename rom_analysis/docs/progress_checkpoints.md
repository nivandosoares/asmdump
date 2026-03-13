# ROM Archaeology Progress Checkpoints

Snapshot date: `2026-03-13`

This file tracks plan progress as checkpoints with objective evidence and the
next gate needed to advance.

## Plan Position (Across All Lanes)

| Lane | Status | Completion read |
|---|---|---|
| Lane 1: Bank30 compression provenance | active | core pipeline is in place; unresolved targets remain |
| Lane 2: Mesen tile/sprite/tilemap design handoff | active | extraction + design packs are operational; contiguous provenance windows now cover `1086..1101` with validated bank13/bank7 runtime anchors |
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
