Date: 2026-04-01

Summary
- Promoted the new `port/` bootstrap from reference-frame blitting to a real
  synthetic PPU path over raw `VRAM/CGRAM/OAM/PPU` state.
- Extended the design-pack loader so `td2_io.*` now also consumes
  `raw/ppu_state.json` and populates layer, Mode 7, and OAM register state.
- Ported the working SNES BG/OBJ/Mode7 rasterization core into the new
  `Td2PpuState` architecture.
- Moved the large `Td2Runtime` allocation off the stack in `main.c` so the
  expanded PPU cache/state remains stable in headless and SDL runs.

What I ran
- `make -C port`
- `./port/test_regression.sh`

Findings / Interpretation
- The promoted fixtures are now exact through the native runtime compositor
  itself, not through `main_visible.ppm` blitting.
- Exact parity still holds on both current checkpoint scenes:
  - `frame300_bootstrap`: `0` mismatched pixels
  - `frame1086_bootstrap`: `0` mismatched pixels
- The new runtime spine now has the right ownership split for the next gate:
  trusted raw-state ingest on one side and synthetic frame generation on the
  other, with extracted `main_visible.ppm` kept only as a regression golden.

What I learned (actionable)
- The old renderer core was reusable with limited adaptation; the shortest
  path forward is continuing to lift proven renderer/contract pieces into the
  new runtime shape instead of rebuilding them from scratch.
- The next port checkpoint should focus on Zelda3-style side-by-side compare
  and callback/state drift reporting, not on more bootstrap rendering work.

Next steps / Checkpoints
1) Add the side-by-side compare lane between the runtime and trusted traces.
2) Start feeding validated callback/state contracts into the runtime loop.
3) Keep using the promoted frame-`300` and frame-`1086` fixtures as the cheap
   native smoke while broadening compare coverage.

Immediate recommendation
- Use `make -C port` plus `./port/test_regression.sh` as the default falsifier
  after any PPU/runtime change.
- Treat `layers/main_visible.ppm` strictly as a compare surface from this
  checkpoint onward.

Files updated in this turn
- `port/include/td2_io.h`
- `port/include/td2_ppu.h`
- `port/main.c`
- `port/src/td2_io.c`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `validation/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-01

Summary
- Reset the port lane to the new SNES-mimetic strategy and replaced the old
  gameplay/physics stand-ins in `port/` with a clean bootstrap runtime.
- Added repo ignore protection for the local-only reference inputs:
  - `zelda3/`
  - `sentrysearch/`
  - `the_duel_longplay.mp4`
- Added the new bootstrap runtime pieces:
  - `port/Makefile`
  - `port/main.c`
  - `port/platform_sdl.c`
  - `port/platform_sdl.h`
  - `port/include/td2_io.h`
  - `port/include/td2_ppu.h`
  - `port/include/td2_runtime.h`
  - `port/src/td2_io.c`
  - `port/src/td2_ppu.c`
  - `port/src/td2_runtime.c`
  - `port/docs/ARCHITECTURE.md`
- Removed the old port-facing stubs that encoded invented gameplay / tilemap
  demos instead of SNES-like runtime ownership.
- Added the new gameplay chunk helper that reuses the attached SentrySearch
  chunker without indexing the repo into Git:
  - `tools/build_sentrysearch_chunk_manifest.py`
- Produced the first reusable longplay chunk artifacts:
  - `tools/out/sentrysearch_longplay_anchor_chunks.json`
  - `tools/out/sentrysearch_longplay_anchor_chunks.md`
- Added the gameplay lookup note:
  - `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`

What I ran
- `make -C port`
- `./port/test_regression.sh`
- `cd sentrysearch && uv run sentrysearch stats`
- `python3 -m py_compile tools/build_sentrysearch_chunk_manifest.py`
- `python3 tools/build_sentrysearch_chunk_manifest.py sentrysearch/video/the_duel_longplay.mp4 --window 'bridge:1802:90:bridge crossing|purple water|mountain horizon|traffic right lane' --window 'tunnel:2028:90:tunnel driving|dark tunnel walls|mountain wall corridor' --window 'rain:2688:90:rain segment|windshield droplets|traffic ahead' --window 'snow:3570:120:snow onset|snow mountain curve|log truck ahead' --json-out tools/out/sentrysearch_longplay_anchor_chunks.json --markdown-out tools/out/sentrysearch_longplay_anchor_chunks.md`

Findings / Interpretation
- The new `port/` checkpoint now matches the strategy reset:
  SDL host shell + SNES-like raw state shadow + extracted design-pack loading,
  with no fake gameplay loop left in the runtime.
- The bootstrap smoke is exact on the promoted frame fixtures:
  - `frame300_bootstrap`: `0` mismatched pixels
  - `frame1086_bootstrap`: `0` mismatched pixels
- The current renderer is intentionally still a bootstrap:
  it presents exact extracted `main_visible` surfaces while seeding the raw
  `VRAM/CGRAM/OAM` buffers that the future synthetic PPU path must consume.
- The local SentrySearch install works, but its persistent index is empty by
  default; there was no hidden prebuilt semantic index to reuse.
- The new chunk manifest still gives lane 3 a useful immediate surface without
  paying the indexing cost up front:
  - `bridge`: `30:02..31:32` (`4` chunks)
  - `tunnel`: `33:48..35:18` (`4` chunks)
  - `rain`: `44:48..46:18` (`4` chunks)
  - `snow`: `59:30..01:01:30` (`5` chunks)

What I learned (actionable)
- The port lane can now advance on the right architecture without carrying the
  old speculative PC runtime forward.
- The next port checkpoint should replace reference-frame blitting with a
  real compositor over the already-loaded raw state, not rebuild another demo.
- Lane 3 now has reusable longplay windows plus query vocabulary that can be
  used before a full semantic SentrySearch index exists.

Next steps / Checkpoints
1) Replace `main_visible` blitting in `port/src/td2_ppu.c` with synthetic
   rasterization from raw `VRAM/CGRAM/OAM/PPU` state.
2) Add a Zelda3-style side-by-side compare lane between the runtime and
   trusted traces / state contracts.
3) Use the new SentrySearch chunk manifest to aim the next bounded gameplay
   capture or semantic indexing pass at one named window, not the whole
   longplay.

Immediate recommendation
- Use `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md` plus
  `tools/out/sentrysearch_longplay_anchor_chunks.md` when choosing the next
  lane-3 capture target.
- Treat `make -C port test` as the default bounded smoke for the new runtime
  until the synthetic PPU path lands.

Files added in this turn
- `port/Makefile`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/include/td2_io.h`
- `port/include/td2_ppu.h`
- `port/include/td2_runtime.h`
- `port/src/td2_io.c`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/docs/ARCHITECTURE.md`
- `tools/build_sentrysearch_chunk_manifest.py`
- `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `PORT_PLAN.md`
- `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-01

Summary
- Refreshed the stale bank30 generated evidence so lane-1 docs match current tool behavior again.
- Rebuilt:
  - `tools/out/bank30_headers.json`
  - `tools/out/bank30_chunk_validation.json`
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`
- Added the new repeatable chunk-shape analyzer:
  - `tools/analyze_bank30_chunk_shapes.py`
- Produced the new structural artifacts:
  - `tools/out/bank30_chunk_shapes.json`
  - `tools/out/bank30_chunk_shapes.md`
- Wrote the dev-team handoff:
  - `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`

What I ran
- `python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json`
- `python3 tools/validate_td2_chunks.py game.smc --bank 30 --headers-json tools/out/bank30_headers.json --json-out tools/out/bank30_chunk_validation.json`
- `python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md`
- `python3 tools/analyze_bank30_chunk_shapes.py --json-out tools/out/bank30_chunk_shapes.json --markdown-out tools/out/bank30_chunk_shapes.md`

Findings / Interpretation
- The refreshed header manifest again exposes all `8` candidate starts, including the two `67FB` rows:
  - `1E:DA96`
  - `1E:E91F`
- The refreshed validation pass now matches decoder reality:
  - `DA96` decodes successfully (`28620` output bytes, `6429` source bytes consumed)
  - `E91F` fails as a standalone `67FB` (`index out of range`)
- The rebuilt registry is now back in sync:
  - `runtime-confirmed`: `DF6C/E039/E73F/E800`
  - `sentinel-control`: `9681`
  - `nested-invalid-marker`: `E91F`
  - unresolved queue:
    - `P0`: `EE7F`
    - `P1`: `DA96`
- Static shape analysis materially narrows the two unresolved lanes:
  - `DA96` carries a repeated `0x7C1F` run block with `33` starts on a fixed `157`-word stride; treating that as a row width yields a `157 x 33` repeated block with `32` identical rows, which is strong evidence for row-major visual/map payload rather than code-like material
  - `EE7F` keeps the same `899`-word footprint as `DF6C/E73F`, but only `20.356..21.0234%` same-index overlap against them, while `DF6C` vs `E73F` stays `77.5306%`; that makes `EE7F` a real distinct helper payload, not a near-clone of the already-seen pair

What I learned (actionable)
- `EE7F` should remain the highest-priority runtime proving target because it is both bank1-table-confirmed and structurally distinct from the already-observed `26FB` siblings.
- `DA96` is still runtime-unseen, but it is now better framed as a visual/map-provenance problem than a hidden-code problem.
- The immediate doc/tool mismatch is closed; future lane-1 work can rely on the rebuilt bank30 registry again.

Next steps / Checkpoints
1) Chase an organic `EE7F` reachability path before widening more forced-`B1F9` experiments.
2) Keep `DA96` on a separate consumer/visual-correlation track instead of trying to route it through the same helper-index funnel as `EE7F`.
3) Reuse `tools/analyze_bank30_chunk_shapes.py` whenever a new bank30 unresolved candidate needs a quick “clone vs distinct payload” read.

Immediate recommendation
- Use the new handoff note first:
  - `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`
- Then spend the next bounded lane-1 step on an organic `EE7F` path, not another widened forced-callback stall.

Files added in this turn
- `tools/analyze_bank30_chunk_shapes.py`
- `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`

Date: 2026-03-30

Summary
- Executed an expanded L001210 probe matrix (7 scenarios) to exercise additional branch gates and force selectors / callback values aimed at surfacing bank30 callers DA96 (1E:DA96) and EE7F (1E:EE7F).
- The run used the repository's Mesen bridge and validation runner and wrote outputs under:
  - tools/out/l001210_probe_matrix_expanded/matrix_summary.json
  - tools/out/l001210_probe_matrix_expanded/matrix_summary.md
  - per-scenario traces and summaries under tools/out/l001210_probe_matrix_expanded/
- Added the scenarios manifest: tools/l001210_expanded_scenarios.json (committed to the repo).

What I ran
- tools/run_l001210_probe_matrix.py --rom game.smc --out-dir tools/out/l001210_probe_matrix_expanded \
  --total-frames 2200 --timeout-seconds 120 --max-hits 0 --scenarios-json tools/l001210_expanded_scenarios.json
- Scenarios included the previous default four plus three targeted experiments:
  - force_b1f9_selectors_full: re-applies selector forcing across frames with TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1 and traces B1F9 exec point
  - force_main_callback_9568_1200_1800: force the main callback pointer to 0x9568 (38248 dec) for frames 1200..1800 and trace selected exec points
  - force_main_and_selectors: combined forcing of selectors and main-callback with exec-point tracing

Artifacts produced
- tools/out/l001210_probe_matrix_expanded/matrix_summary.json (.md)
- Per-scenario trace JSONs; summary JSONs: e.g. tools/out/l001210_probe_matrix_expanded/force_b1f9_selectors_full_summary.json

Findings / Interpretation
- Existing table-confirmed bank30 entries (1E:DF6C, 1E:E039, 1E:E73F, 1E:E800) produced hits in runtime (each observed in one or more scenarios).
- Candidate addresses 1E:DA96 and 1E:EE7F remain unseen (hit_count == 0) across all scenarios, including the selector-forced and forced-callback experiments.
- force_main_callback_9568_1200_1800 produced very few total hits (6) and zero bank30 hits — suggests that this forced callback alone did not drive those bank30 outputs in the observed windows.
- force_b1f9_selectors_full (selectors forced across frames and re-applied at B1F9) produced more general hits but still did not reveal DA96/EE7F — this narrows the likely calling contexts for those candidates.

What I learned (actionable)
- DA96/EE7F are not triggered by the baseline boot and a set of targeted forced-selector/callback windows we tried. They likely come from a different execution path not yet exercised (another caller family, later gameplay event, or metaprotection/conditional gate).
- The probe infrastructure (trace/write/exec-point forcing) is working as expected and writes rich per-hit metadata (caller PC, selector snapshot, CPU regs) that will be useful when/if DA96/EE7F appear.

Next steps / Checkpoints
1) Targeted static analysis of decompressed DA96 output (if available) to find likely caller patterns and strings. This reduces runtime guessing and can propose exact exec points to trace. (Checkpoint: produce DA96 disassembly and list of plausible caller PC addresses.)
2) Enumerate and add more scenarios that exercise other gameplay subsystems (e.g., in-game menu sequences, specific player actions, iterative controller patterns) or longer-run scenarios that reach later gameplay states. (Checkpoint: add a scenario set for in-game menu sequences and try again.)
3) If static hints point to a particular bank1 caller address family, construct a forced-callback experiment that sets the main callback to that caller and force selector values around it (similar to the B1F9 forcing we already used). (Checkpoint: create and run a focused scenario that forces the discovered caller.)
4) Consider integrating periodic CI probing that runs the matrix overnight to capture intermittent or rare hits. (Checkpoint: CI job + alert when candidate hit_count > 0.)

Immediate recommendation
- Do the static analysis (step 1) first — it has the highest chance of producing concrete exec addresses to target with the probe harness. If you want, I can extract and disassemble the DA96 decompressed binary now and produce a short list of candidate call-sites.

Files added in this turn
- tools/l001210_expanded_scenarios.json
- rom_analysis/docs/progress_checkpoints.md

Next reading
- rom_analysis/docs/next_steps_roadmap.md (follow the lane order in PORT_PLAN.md)
