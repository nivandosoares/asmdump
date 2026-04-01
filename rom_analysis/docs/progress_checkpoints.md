Date: 2026-04-01

Summary
- Moved gameplay scanline-profile selection out of the runtime hardcode and
  into the versioned contract
  `rom_analysis/docs/gameplay_scanline_contracts.jsonc`.
- Promoted a second gameplay consumer on that same surface:
  `tools/out/lane3_live_entry_frame03250_bundle/design_pack`, backed by the
  new tracked capture
  `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`.
- Closed an important negative result for that second phase:
  current flat-vs-contract compare on `3250` is still `0` mismatched pixels,
  which means later gameplay phases need more than the current
  `main_layers/bg1/bg2/bg3` scroll overlay.

What I ran
- new scanline capture for the late live-entry `3250` bundle:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=420 TD2_SCANLINE_TEST_TARGET_FRAME=3250 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`
- targeted smoke:
  - `make -C port`
  - `./port/test_scanline_contract.sh`
- targeted flat-vs-contract probe on `3250`:
  - contract-backed render on
    `tools/out/lane3_live_entry_frame03250_bundle/design_pack`
  - no-contract clone render on `/tmp/td2_flat_3250/scene`
  - `python3 tools/compare_frames.py /tmp/td2_flat_3250/flat_00000.ppm /tmp/td2_scanline_probe_3250/frame3250_00000.ppm`

Findings / Interpretation
- The scanline overlay path is no longer scene-specific runtime glue. Any
  bundle can now opt in through `gameplay_scanline_contracts.jsonc`.
- The new `3250` scanline capture is structurally valid and gameplay-shaped:
  - `224` samples
  - `main_layers`: `19 -> 23 -> 19`
  - `bg3_hscroll`: `0 -> 510` at scanline `23`
  - `bg3_vscroll`: `1023 -> 12` at scanline `24`
  - `bg2_hscroll`: lower-window ramp ending at `213`
- Despite that, the current renderer output for `3250` is still exactly the
  same with and without the contract (`0` mismatched pixels). That is the
  key result of this turn.

What I learned (actionable)
- The versioned contract path is the right abstraction boundary and is now
  ready for more gameplay bundles.
- The second gameplay bundle proved a stronger renderer boundary:
  later gameplay is not blocked on scanline-trace acquisition anymore; it is
  blocked on missing fields beyond the current `main_layers/bg1/bg2/bg3`
  scroll surface.

Next steps / Checkpoints
1) Extend `gameplay_scanline_contracts.jsonc` support to whichever next field
   is cheapest and most defensible for `3250`, instead of collecting more of
   the same scroll-only traces first.
2) Decide whether `3250` stays the best next consumer or whether the
   traffic-emergence `3400` bundle is the better proving lane for the next
   scanline-field promotion.
3) Keep `gameplay_live_race_mid` as the solved reference consumer while later
   gameplay phases are narrowed one field family at a time.

Immediate recommendation
- Use the local review pack that now includes the `3250` contract-backed PNG
  to show design the exact remaining gap: contract attached, but still no
  visible delta yet.
- Keep `./port/test_scanline_contract.sh` as the cheapest falsifier when
  touching scanline contract selection or adding a new gameplay consumer.

Files updated in this turn
- `port/Makefile`
- `port/src/td2_runtime.c`
- `port/test_scanline_contract.c`
- `port/test_scanline_contract.sh`
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`

Date: 2026-04-01

Summary
- Promoted the first gameplay scanline-aware presentation path in the SDL
  runtime for the `gameplay_live_race_mid` rail instead of treating that seed
  as one flat frame-end `ppu_state`.
- The runtime now attaches the measured visible-scanline profile from
  `tools/out/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json`
  and feeds per-scanline `main_layers` plus `bg1/bg2/bg3` scroll values into
  `td2_ppu`.
- Refreshed the local design-review PNG pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` so the gameplay review
  frame now shows the restored horizon/roadside split instead of the old flat
  road/horizon collapse.

What I ran
- `make -C port clean && make -C port`
- `make -C port test`
- headless gameplay export:
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --input-script '3:a' --headless --frames 4 --dump-prefix tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame`
- manual visual review against:
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame_00003.png`
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_bg_stack_support.png`
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_world_support.png`

Findings / Interpretation
- The promoted live-race bundle now renders with the horizon and roadside
  separation restored in the native runtime. The prior failure mode where the
  road swallowed the shoulders/horizon was caused by flattening gameplay to
  one global `main_layers/BG2VOFS` state.
- The measured scanline overlay is enough to correct that first-order visual
  boundary without changing the scheduler rail or inventing a new gameplay
  heuristic.
- The new scheduler smoke now closes two useful guardrails on the same lane:
  - the scanline profile must load with the expected `224` visible lines and
    selected `main_layers/bg2/bg3` checkpoints
  - the rendered framebuffer must preserve a few stable sky/mountain/grass
    pixels on the first promoted gameplay frame

What I learned (actionable)
- For gameplay, the renderer can advance one rail at a time with measured
  per-scanline overlays before the deeper road emitter family is fully
  reconstructed.
- The current sibling-artifact attachment is good enough for one promoted
  rail, but the next clean replacement is to move this into versioned contract
  data so later gameplay bundles can opt in without path-specific glue.

Next steps / Checkpoints
1) Move the live-race scanline attachment into versioned contract data instead
   of the current sibling raw JSON path.
2) Promote a second gameplay phase on the same scanline-aware surface so
   checkpoint/post-stop or police/radar bundles stop falling back to flat
   presentation.
3) Only after a second gameplay phase closes cleanly, decide whether more of
   the road emitter family must move from measured overlay to executed logic.

Immediate recommendation
- Use `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame0003.png`
  as the current designer-facing gameplay PNG for this checkpoint.
- Keep `./port/test_scheduler.sh` as the cheapest falsifier when touching the
  live-race gameplay presenter, because it now proves both scanline profile
  attachment and a small set of render pixels.

Files updated in this turn
- `port/include/td2_ppu.h`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/test_scheduler.c`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `tools/out/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `port/src/td2_ppu.c`

Date: 2026-04-01

Summary
- Promoted the first real SDL live-input path into the runtime instead of
  keeping interactive input separate from the scripted mutator lane.
- `platform_sdl` now maps keyboard and SDL game-controller samples into SNES
  `JOY1` bits, and `td2_scheduler` records that history on the same surface
  already used by `--input-script`.
- Materialized a local PNG review pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` with baseline, routed
  menu, and gameplay snapshots generated from the same runtime path.

What I ran
- `make -C port clean && make -C port`
- `./port/test_live_input.sh`
- `./port/test_input_mutation.sh`
- `make -C port test`
- local PNG review export with `./port/build/td2_port` on:
  - `tools/out/design_frame1500_car_select`
  - `tools/out/design_lane3_live_race_mid_frame0_native`

Findings / Interpretation
- The SDL host is no longer a side channel for input. Live keyboard/controller
  state now lands in the exact same scheduler/mutator surface used by replay
  scripts, so route logic and current-frame `JOY1` sampling are validated once
  instead of separately.
- Three useful proofs are now closed cheaply:
  - live menu history can trigger the traced no-opponent handoff
  - live current input can drive gameplay `JOY1` sampling on the live-race
    seed
  - scripted prehistory and live current input can merge on the same measured
    default-rival corridor
- The important remaining boundary is temporal, not architectural: if the
  bundle starts after the first required route decisions, fully live
  reproduction still needs earlier scene bases or promoted prehistory.

What I learned (actionable)
- Feeding SDL input through the shared scheduler surface is the right
  abstraction boundary: route semantics, current-button mirroring, and later
  gameplay mutations all stay behind one validation wall.
- The next leverage point is not more SDL mapping work; it is promoting
  earlier scene bases or compiled route seeds for branches whose history begins
  before the current bundle base frame.

Next steps / Checkpoints
1) Promote compare-backed fixtures for the live-input menu/gameplay rails
   wherever trusted goldens exist.
2) Move pre-bundle route history into earlier scene bases or compiled route
   seeds for menu/gameplay branches that start before the current bundle.
3) Extend the measured menu corridor past `2088` only when a new bounded
   probe block closes cleanly.

Immediate recommendation
- Use the local PNG pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` as the current
  designer-facing review surface for this checkpoint.
- Keep `./port/test_live_input.sh` and `./port/test_input_mutation.sh` as the
  cheapest falsifiers when touching interactive input on the current runtime.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/include/td2_input.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_input.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_live_input.c`
- `port/test_live_input.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/platform_sdl.c`
- `port/src/td2_scheduler.c`
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`

Date: 2026-04-01

Summary
- Promoted the `menu_gameplay_entry` baseline from sparse post-`2050` anchors
  to an exact sampled scheduler-contract window across frames `2052..2088`.
- Expanded the default-rival `A` mutator in the runtime from isolated anchors
  into the measured `2052..2088` window, while preserving the later promoted
  checkpoints at `2104` and `2125`.
- Materialized a second local PNG review pack under
  `tools/out/port_input_mutation_window2054_2088_pngs_20260401/` with paired
  `A/B` outputs for frames `2054`, `2066`, `2083`, and `2088`.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `./port/test_input_mutation.sh`
- `./port/test_compare_lane.sh`
- `./port/test_regression.sh`
- `make -C port test`
- local PNG review export with `./port/build/td2_port` on
  `tools/out/design_frame1500_car_select` for frames
  `2054/2066/2083/2088` under both scripted `A` and scripted `B`

Findings / Interpretation
- The `2054..2088` corridor is deterministic enough to promote verbatim. The
  no-input rail is no longer inferred from a handful of checkpoints; it now
  has exact sampled baseline state for every frame in that bounded window.
- The default-rival `A` lane also has a real measured shape rather than a
  guessed extrapolation: `dp_0053/dp_0054` advance as a staircase,
  `dp_0020` changes only on selected even frames, and `state_09a8` flips
  only on a subset of odd frames.
- The new scheduler and mutator coverage stayed compatible with the existing
  compare lane and native renderer: no regression gate loosened to land this
  window.

What I learned (actionable)
- When probe data already exposes a bounded staircase window, exact promotion
  is cheaper and safer than inventing a generalized heuristic early.
- The next useful port step is no longer more manual densification inside
  `2054..2088`; it is feeding SDL live input into the same mutator surface
  that now already matches scripted replay on this corridor.

Next steps / Checkpoints
1) Feed live SDL keyboard/controller input into the same runtime mutator
   surface that currently accepts `--input-script`.
2) Promote compare-backed menu/gameplay fixtures wherever trusted goldens
   exist for this corridor.
3) Extend the measured menu corridor past `2088` only when a new bounded
   probe block closes cleanly.

Immediate recommendation
- Use the PNG pack under
  `tools/out/port_input_mutation_window2054_2088_pngs_20260401/` as the
  current designer-facing review surface for this checkpoint.
- Keep `./port/test_scheduler.sh` and `./port/test_input_mutation.sh` as the
  cheapest falsifiers when promoting the next measured menu window.

Files updated in this turn
- `port/include/td2_scheduler.h`
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `port/test_input_mutation.c`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `tools/out/port_input_mutation_window2054_2088_pngs_20260401/`

Next reading
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `port/src/td2_scheduler.c`

Date: 2026-04-01

Summary
- Extended the runtime input mutator beyond `state_0960` and the first
  no-opponent handoff into the first measured post-`2050` default-rival `A`
  anchors on `menu_gameplay_entry`.
- Promoted exact scheduler-contract baseline checkpoints for sampled
  no-input frames `2052`, `2053`, `2083`, `2104`, and `2125`, then overlaid
  the traced `A` route deltas on top of them.
- Runtime dumps and compare bundles now emit PNG siblings next to the
  existing PPM artifacts, and this turn also materialized a design-review
  anchor pack under `tools/out/port_input_mutation_anchor_pngs_20260401/`.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `./port/test_input_mutation.sh`
- `./port/test_compare_lane.sh`
- `./port/test_regression.sh`
- `make -C port test`
- PNG writer sanity check:
  - `./port/build/td2_port --scene-dir port/assets/test_dump_frame300/design_pack --headless --frames 1 --dump-prefix <tmp>/frame300`
  - `python3 tools/compare_frames.py <tmp>/frame300_00000.ppm <tmp>/frame300_00000.png`
- design-review export:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:a' --headless --frames 626 --dump-prefix <tmp>/a`
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:b' --headless --frames 626 --dump-prefix <tmp>/b`

Findings / Interpretation
- The menu rail now has a defensible first post-`2050` mutation layer that is
  grounded by the existing probe compares instead of hand-written heuristics:
  - `2052`: `dp_0020 = 89`, `dp_0054 = 0`
  - `2053`: `dp_0053 = 0`, `dp_0054 = 0`, `state_09a8 = 2`
  - `2083`: `dp_0020 = 170`, `dp_0022 = 289`, `dp_0053 = 128`,
    `dp_0054 = 128`
  - `2104`: `dp_0020 = 105`, `dp_0053 = 200`, `dp_0054 = 208`,
    `state_137c = 1`
  - `2125`: `dp_0020 = 19`, `dp_0022 = 289`, `dp_0053 = 8`,
    `dp_0054 = 8`, `state_09a2 = 26`, `state_137c = 1`
- The old no-opponent mutator was too permissive once the traced default-rival
  route was added to the same smoke surface; tightening that overlap was
  necessary so `default-rival` and `no-opponent` stop aliasing the same menu
  handoff.
- PNG dump output is now machine-validated against the existing PPM path with
  `0` mismatched pixels on the frame-`300` smoke, so design review can trust
  the new format as a faithful sibling artifact, not a separate render path.

What I learned (actionable)
- For the current bootstrap, exact sampled anchors are a good way to advance
  the post-`2050` corridor without pretending the whole lane is already
  continuously modeled. The next useful expansion is short windows, not a
  speculative all-frame rewrite.
- Design-review artifacts should stay in-band with the validation path.
  Emitting PNG next to the existing PPM/JSON bundle keeps regression and
  human review on the same artifact set.

Next steps / Checkpoints
1) Densify the new post-`2050` anchors into short `2054..2088` windows, where
   the visible dashboard/radar divergence is already bounded.
2) Feed live SDL keyboard/controller input into the same mutator surface that
   now accepts both sampled anchors and scripted windows.
3) Promote compare-backed menu/gameplay fixtures for those post-`2050`
   anchors whenever trusted goldens exist.

Immediate recommendation
- Use the PNG pack under `tools/out/port_input_mutation_anchor_pngs_20260401/`
  as the current designer-facing review surface for this checkpoint.
- Keep `./port/test_input_mutation.sh` as the cheapest falsifier when adding
  new post-`2050` anchor rows or mutator overlays.

Files updated in this turn
- `port/main.c`
- `port/include/td2_compare.h`
- `port/include/td2_contracts.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_compare_lane.sh`
- `port/test_regression.sh`
- `port/test_scheduler.c`
- `port/test_input_mutation.c`
- `port/docs/ARCHITECTURE.md`
- `port/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `tools/out/port_input_mutation_anchor_pngs_20260401/`

Next reading
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `port/src/td2_scheduler.c`

Date: 2026-04-01

Summary
- Added the first real input-driven mutation layer on top of the contract-fed
  scheduler rails.
- The runtime now accepts `--input-script` windows in the same
  `frame:buttons` / `start-end:buttons` syntax already used by the Mesen-side
  tooling.
- The new input layer currently proves two grounded mutations:
  - `state_0960` mirrors the current `JOY1` sample from active buttons
  - the traced menu no-opponent route (`right+down`, then confirm) mutates
    the downstream `menu_gameplay_entry` handoff to `$1C70 = 3 / $1C76 = 0`

What I ran
- `make -C port clean && make -C port`
- `./port/test_input_mutation.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --input-script '3:a' --headless --frames 1 --dump-prefix <tmp>/gameplay`
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1584-1589:right,down;1730-1735:start' --headless --frames 545`

Findings / Interpretation
- The port now has an explicit input surface instead of only frame-indexed
  playback. It is still bootstrap-scoped, but it is no longer input-blind.
- The new smoke closes two useful facts cheaply:
  - gameplay rails can now carry a real current-button sample
  - menu rails can now switch between default-rival and no-opponent handoffs
    using traced input history
- Existing regression, compare, callback-model, and scheduler rails stayed
  green under the new input layer.

What I learned (actionable)
- `state_0960` is a good first-class runtime field for scripted/live input
  because it is direct, cheap to validate, and already grounded by the memory
  map as the `JOY1` sample copied in NMI.
- The no-opponent route should stay framed as a traced menu mutator, not as a
  generic “menu AI”: it is grounded by the recovered `right+down` plus
  confirm corridor and should be extended only when more route semantics are
  actually validated.

Next steps / Checkpoints
1) Extend the input mutator beyond `state_0960` and the no-opponent handoff
   into post-`2050` gameplay deltas like `state_09a2/state_09a8/dp_0053/0054`.
2) Feed live SDL keyboard/controller input into the same runtime input layer.
3) Promote compare-backed fixtures for input-mutated menu/gameplay windows
   where trusted goldens already exist.

Immediate recommendation
- Use `--input-script` for bounded runtime experiments before adding new
  scheduler contract rows.
- Keep `./port/test_input_mutation.sh` as the cheapest falsifier for
  input-driven work on menu/gameplay rails.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/include/td2_contracts.h`
- `port/include/td2_input.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_input.c`
- `port/src/td2_scheduler.c`
- `port/src/td2_runtime.c`
- `port/test_callback_model.c`
- `port/test_input_mutation.c`
- `port/test_input_mutation.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/src/td2_input.c`
- `port/src/td2_scheduler.c`
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`

Date: 2026-04-01

Summary
- Promoted the menu/gameplay scheduler rails from hardcoded C anchors into
  the new contract surface `rom_analysis/docs/scheduler_rail_contracts.jsonc`.
- `td2_scheduler` now loads versioned rail segments for
  `menu_gameplay_entry` and `gameplay_live_race_mid`, while intro continues
  to use the callback model path.
- `tools/push_checkpoint.sh` no longer depends on a clean main worktree to
  refresh the curated wiki: it now rebuilds and commits the wiki in an
  isolated temporary `git worktree`, then cleans local generated wiki output
  back to the pushed state.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --headless --frames 1 --dump-prefix <tmp>/menu`
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --headless --frames 1 --dump-prefix <tmp>/gameplay`

Findings / Interpretation
- The scheduler gate is now closed in reusable form for the non-intro rails:
  the smoke still proves the same menu/gameplay checkpoints, but those rails
  are now sourced from a shared JSONC contract instead of branches in
  `td2_scheduler.c`.
- The scheduler smoke grew from `156` to `175` checks because it now also
  proves rail origin (`scheduler.contract_loaded`, `segment_count`, and
  `scheduler_contract` source) in addition to frame state.
- The wiki refresh path is no longer blocked by unrelated dirty files in the
  main worktree, because the follow-up commit is created from a clean
  temporary worktree at the pushed checkpoint.

What I learned (actionable)
- The next port gate should move off rail externalization and onto mutation:
  menu/gameplay now have a stable contract surface that can absorb real
  input-driven state deltas without recompiling the scheduler.
- The repo no longer needs the older "skip wiki auto-commit when anything
  else is dirty" safety rule for generated wiki output. Isolating the refresh
  in a clean worktree is safer and more useful.

Next steps / Checkpoints
1) Start mutating `menu_gameplay_entry` and `gameplay_live_race_mid` under
   input instead of replaying fixed contract rows.
2) Promote compare-backed menu/gameplay fixtures wherever trusted goldens
   exist.
3) Expand the scheduler contract only when a new rail or new checkpoint is
   validated, not as a substitute for input/state execution.

Immediate recommendation
- Treat `rom_analysis/docs/scheduler_rail_contracts.jsonc` as the editable
  proving surface for menu/gameplay rail checkpoints.
- Keep `./port/test_scheduler.sh` as the cheapest falsifier before broader
  compare or bundle work.

Files updated in this turn
- `port/include/td2_contracts.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `tools/push_checkpoint.sh`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `port/src/td2_scheduler.c`
- `tools/push_checkpoint.sh`

Date: 2026-04-01

Summary
- Replaced the old one-shot callback seed path with a minimal scheduler that
  executes validated callback families and handoffs on three promoted rails:
  `intro_noinput`, `menu_gameplay_entry`, and `gameplay_live_race_mid`.
- The design-pack loader now also tolerates tracked bundles that only carry
  local `raw/` dumps and no `layers/main_visible.ppm`, which makes the
  promoted menu/gameplay investigation packs runnable in the SDL runtime when
  compare is not requested.
- Added the new scheduler smoke so `make -C port test` now covers:
  regression parity, compare lane, intro callback model, and the three target
  scheduler rails.

What I ran
- `make -C port clean && make -C port`
- `./port/test_callback_model.sh`
- `./port/test_scheduler.sh`
- `./port/test_regression.sh`
- `./port/test_compare_lane.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --headless --frames 1 --dump-prefix <tmp>/menu`
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --headless --frames 1 --dump-prefix <tmp>/gameplay`

Findings / Interpretation
- The stale-build regression was a build artifact, not a scheduler bug:
  after a clean rebuild, both the old regression smoke and compare lane
  stayed exact.
- The new scheduler smoke now proves the three rails the user asked for:
  - intro no-input: `986`, `1093`, `1102`, `1117`
  - menu with input: `1500`, `1640`, `1677`, `1857`, `2014`, `2044`, `2050`
  - gameplay seed: `3`, `11`
- The promoted menu/gameplay bundles now load directly in the runtime even
  without `main_visible.ppm`, as long as compare is not requested.

What I learned (actionable)
- The active port gate is no longer "replace seeded callback state at all";
  that gate is closed in bootstrap form.
- The next leverage point is converting the hardcoded scheduler anchors into
  reusable contract surfaces, then applying real input-driven state mutation
  on top of those callback families.
- Intro should stop being the only proving lane now; the same scheduler loop
  is already viable on menu and gameplay surfaces.

Next steps / Checkpoints
1) Promote the three scheduler rails from hardcoded anchors into contract-fed
   rails.
2) Add input-driven mutation work on top of `menu_gameplay_entry` and
   `gameplay_live_race_mid`.
3) Promote compare-backed menu/gameplay fixtures when trusted goldens exist.

Immediate recommendation
- Use `./port/test_scheduler.sh` as the cheap falsifier for callback-family
  and handoff work before spending time on full compare bundles.
- Use `--scheduler-profile menu_gameplay_entry` and
  `--scheduler-profile gameplay_live_race_mid` when running the main binary on
  promoted investigation bundles outside `port/assets/`.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/include/td2_contracts.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_callback_model.c`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_io.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_callback_model.c`
- `port/test_scheduler.c`
- `port/test_scheduler.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `PORT_PLAN.md`

Date: 2026-04-01

Summary
- Fixed the curated docs wiki `Last updated` regression.
- `tools/build_docs_wiki_report.py` no longer trusts filesystem mtime alone;
  it now prefers the latest Git commit timestamp for each source doc and only
  falls back to local mtime when Git history is unavailable.

What I ran
- `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Findings / Interpretation
- The wiki was previously showing stale timestamps for recently committed docs
  because file mtimes in this repo were lagging behind the actual push/commit
  chronology.
- After the fix, the Source Of Truth docs now show the latest pushed commit
  time again:
  - `PORT_PLAN.md`: `2026-04-01 10:37`
  - `next_steps_roadmap.md`: `2026-04-01 10:37`
  - `progress_checkpoints.md`: `2026-04-01 10:37`
  - `validation_gates.md`: `2026-04-01 10:37`
  - `validation/README.md`: `2026-04-01 10:37`
  - `port/README.md`: `2026-04-01 10:37`

What I learned (actionable)
- Git commit time is the right primary signal for this wiki surface because it
  tracks what was actually published, while local mtimes in this repo are not
  stable enough to sort/update the index reliably.
- The post-push wiki rebuild remains correct locally even when the follow-up
  wiki auto-commit must be skipped due unrelated dirty tracked docs.

Next steps / Checkpoints
1) Keep using Git-backed timestamps in the wiki generator.
2) Return to the active port gate:
   replace the seeded callback bootstrap with real front-end callback/state
   execution.

Immediate recommendation
- Treat the local rebuilt wiki under `tools/out/docs_wiki/` as the source of
  truth for `Last updated` until the worktree is clean enough for the wrapper
  to auto-commit the regenerated HTML again.

Files updated in this turn
- `tools/build_docs_wiki_report.py`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/build_docs_wiki_report.py`
- `rom_analysis/docs/progress_checkpoints.md`

Date: 2026-04-01

Summary
- Promoted the first callback-backed compare-lane checkpoint on top of the
  seeded PPU-state lane.
- Added `td2_contracts.*`, which resolves
  `rom_analysis/docs/callback_state_contracts.jsonc` from the scene path,
  loads the matching frame checkpoint when one exists, and seeds a bootstrap
  runtime-state shadow from it.
- The compare JSON now also emits `callback_contract`, alongside the existing
  `state_contract`.
- Promoted `frame_01093` as the first callback-backed fixture in the default
  compare smoke because it has both exact pixel parity and a validated
  `01:9FE5` callback/state checkpoint.

What I ran
- `make -C port test`

Findings / Interpretation
- The compare lane now spans three layers:
  pixels, seeded PPU-visible state, and seeded callback/state for covered
  frames.
- Current promoted fixtures stay exact:
  - `frame300_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `58`, `0` failed callback checks out of `0`
  - `frame1086_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `59`, `0` failed callback checks out of `0`
  - `frame1093_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `59`, `0` failed callback checks out of `8`
- This is still a bootstrap checkpoint:
  the runtime seeds the callback/state shadow from trusted contracts; it does
  not yet execute those callback families on its own.

What I learned (actionable)
- The next technical gap is no longer how to represent callback/state
  checkpoints; that representation now exists in the runtime and compare JSON.
- The next gate should replace seeded callback/state shadowing with real
  callback/state stepping for covered front-end frames.

Next steps / Checkpoints
1) Start replacing seeded callback-state shadowing with real callback/state
   execution for the front-end intro family.
2) Promote more compare fixtures that land on known contract rows, not just
   `1093`.
3) Keep `frame1093_compare` in the default smoke as the first cheap callback
   contract falsifier.

Immediate recommendation
- Treat `callback_contract.failed_checks` as a first-class compare gate next
  to `state_contract.failed_checks`.
- Use `frame_01093` when a code change needs one promoted fixture with both
  visual parity and validated callback/state coverage.

Files updated in this turn
- `port/Makefile`
- `port/include/td2_compare.h`
- `port/include/td2_contracts.h`
- `port/include/td2_runtime.h`
- `port/main.c`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`

Next reading
- `PORT_PLAN.md`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `port/docs/ARCHITECTURE.md`

Date: 2026-04-01

Summary
- Promoted the compare lane from pixel-only review into a first semantic
  state-contract surface.
- The compare JSON now includes `state_contract`, which validates seeded
  PPU-visible fields against the runtime state:
  - visible PPU/OAM registers
  - Mode 7 fields
  - per-layer tilemap/CHR/scroll metadata
  - raw `VRAM/CGRAM/OAM` byte parity
- `--fail-on-compare-diff` now fails on either pixel drift or state-contract
  drift.
- Extended `port/test_compare_lane.sh` so the compare smoke enforces both
  exact pixels and zero semantic failures.

What I ran
- `make -C port test`

Findings / Interpretation
- The compare lane now carries the right shape for the next callback/state
  phase instead of only reporting image deltas.
- Current promoted fixtures stay exact in both dimensions:
  - `frame300_compare`: `0` mismatched pixels, `0/58` state failures
  - `frame1086_compare`: `0` mismatched pixels, `0/59` state failures
- The new semantic contract is still bootstrap-scoped:
  it proves that the runtime preserves the loaded SNES-visible scene state,
  not yet that it advances real callback families over time.

What I learned (actionable)
- The next compare extension should target trusted multi-frame callback/state
  traces, not more static-scene bookkeeping.
- The current seeded PPU contract is still worth keeping in the default smoke,
  because it will catch silent raw-state drift when the runtime starts mutating
  `VRAM/CGRAM/OAM` or layer registers dynamically.

Next steps / Checkpoints
1) Start feeding trusted intro callback/state traces into the compare lane
   shape, beginning with front-end families once the runtime can step them.
2) Keep the seeded PPU contract active as the cheap guardrail for static
   bootstrap fixtures.
3) Continue using `make -C port test` as the default bounded falsifier.

Immediate recommendation
- Treat `state_contract.failed_checks` in the compare JSON as a first-class
  gate alongside `metrics.mismatch_pixels`.
- Use `--fail-on-compare-diff` whenever generating review bundles so both
  pixel drift and semantic drift fail fast.

Files updated in this turn
- `port/include/td2_compare.h`
- `port/main.c`
- `port/src/td2_compare.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/validation_gates.md`

Date: 2026-04-01

Summary
- Added the first Zelda3-style compare lane to the new `port/` runtime.
- The native binary now supports `--compare`, which emits:
  - native runtime frame
  - trusted `main_visible` golden
  - absolute RGB diff map
  - `runtime | golden | diff` strip
  - machine-readable JSON drift metrics
- Added the dedicated compare smoke:
  - `port/test_compare_lane.sh`
- Promoted `make -C port test` so it now covers both exact-frame parity and
  compare-bundle generation.
- Verified the curated docs wiki is still valid by rebuilding it with
  `tools/build_docs_wiki_report.py`.
- Added the repo-local push wrapper:
  - `tools/push_checkpoint.sh`
  This pushes the current checkpoint, rebuilds the curated wiki, and creates a
  follow-up wiki refresh commit/push only when the generated wiki changes and
  the worktree is otherwise clean enough to avoid mixing unrelated edits.

What I ran
- `make -C port`
- `./port/test_regression.sh`
- `./port/test_compare_lane.sh`
- `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Findings / Interpretation
- The runtime now has the first compare/reporting spine that matches the new
  port direction instead of relying on ad hoc external diffs only.
- The compare lane is exact on the current promoted fixtures:
  - `frame300_compare`: `0` mismatched pixels
  - `frame1086_compare`: `0` mismatched pixels
- The curated wiki regenerated cleanly from current docs.
- The generated wiki output is not safe to auto-commit in the current mixed
  dirty worktree, which is why the new push wrapper now guards against that
  case instead of sweeping unrelated edits into the wiki follow-up commit.

What I learned (actionable)
- The cheapest high-signal next step is no longer visual parity on isolated
  fixtures; it is feeding callback/state contracts into this compare spine.
- The wiki step is cheap enough to keep in the routine checkpoint pipeline,
  but it does not need a second commit when the generated output is unchanged.

Next steps / Checkpoints
1) Start promoting callback/state expectations into the compare lane outputs.
2) Tie the compare lane to trusted intro traces beyond the two static
   design-pack fixtures.
3) Keep using `tools/push_checkpoint.sh` at the end of future pushed
   checkpoints so the wiki refresh stays routine.

Immediate recommendation
- Use `make -C port test` as the default bounded port smoke.
- Use `./port/build/td2_port --compare ...` whenever a new fixture needs a
  reviewable runtime-vs-golden bundle.

Files updated in this turn
- `port/Makefile`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `port/include/td2_compare.h`
- `port/include/td2_runtime.h`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/src/td2_compare.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `tools/push_checkpoint.sh`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`

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
