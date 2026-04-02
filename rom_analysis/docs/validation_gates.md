# Validation Gates

This note formalizes automated pass/fail gates for the intro vertical slice.

## 1) Pixel Regression Gates

Contract:

- `validation/regression_gates_intro.jsonc`

Runner:

```sh
python3 tools/check_regression_gates.py \
  validation/regression_gates_intro.jsonc \
  --render-dir port/build/regression_frames \
  --json-out tools/out/regression_gates_intro_report.json
```

Current policy buckets:

- `solved_strict`: exact parity required (`0` mismatched pixels)
- `bootstrap_tolerated`: temporary bootstrap tolerance (`<=24` mismatched pixels)
- `mode7_tolerated`: temporary Mode 7 tolerance (`<=8` mismatched pixels)

This enforces explicit error budgets per checkpoint instead of ad hoc checks.

## 2) Callback/State Contracts

Contract:

- `rom_analysis/docs/callback_state_contracts.jsonc`

Runner:

```sh
python3 tools/validate_callback_contracts.py \
  rom_analysis/docs/callback_state_contracts.jsonc \
  tools/out/td2_boot_probe.json \
  --json-out tools/out/callback_state_contracts_report.json
```

This validates callback continuity and selected state fields at known frames
(`01:A39C`, `01:9D69`, `01:9FE5` windows) as first-class machine checks.
Use a probe capture that matches the contract's expected profile in
`expected_probe_profile`, for example a run with
`TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe`.

## 3) Bootstrap Compare-State Contract

Runner:

```sh
./port/build/td2_port \
  --scene-dir port/assets/test_dump_frame300/design_pack \
  --headless \
  --frames 1 \
  --compare \
  --fail-on-compare-diff \
  --dump-prefix port/build/frame300_compare
```

Current compare JSON now also carries `state_contract`, which validates the
loaded design pack against live runtime state for:

- visible PPU/OAM registers
- Mode 7 fields
- per-layer tilemap/CHR/scroll metadata
- raw `VRAM/CGRAM/OAM` byte parity

This is intentionally bootstrap-scoped: it protects the static seeded-state
path now, and becomes the cheap semantic guardrail underneath later
callback/state execution work.

## 4) Bootstrap Callback-State Contract

Runner:

```sh
./port/build/td2_port \
  --scene-dir port/assets/test_dump_range_1086_1093/design_pack_range/frame_01093 \
  --headless \
  --frames 1 \
  --compare \
  --fail-on-compare-diff \
  --dump-prefix port/build/frame1093_compare
```

For frames covered by `rom_analysis/docs/callback_state_contracts.jsonc`, the
runtime now seeds a bootstrap callback/state shadow and emits
`callback_contract` in the compare JSON. Current promoted callback-backed
fixture:

- frame `1093`: `01:9FE5` continuity checkpoint with `8` validated fields

This is also bootstrap-scoped: it proves the runtime can carry validated
callback/state checkpoints in-band with compare output, but it does not yet
prove that the runtime executed those callbacks to reach the state on its own.

## 5) Scheduler Rail Smoke

Runner:

```sh
./port/test_scheduler.sh
```

This validates the minimal callback scheduler over the three promoted rails:

- `intro_noinput`: validates the `986 -> 1117` family and the `1093 -> 1102`
  handoff
- `menu_gameplay_entry`: validates the input-driven menu corridor
  `1500 -> 2050` plus the promoted exact sampled post-`2050`
  `2052..2088` baseline window and later checkpoints
- `gameplay_live_race_mid`: validates the reproducible gameplay seed over the
  promoted `3 -> 11` window

This smoke is intentionally state-first. It proves that the runtime now steps
callback families and handoffs for the three target rails, even when a given
design pack has no trusted `main_visible.ppm` golden. It also now proves that
menu/gameplay are loading `scheduler_contract` state from
`rom_analysis/docs/scheduler_rail_contracts.jsonc` instead of hardcoded C
anchors. For `gameplay_live_race_mid`, it now also proves that the measured
visible-scanline overlay is attached and that key framebuffer pixels stay on
the restored sky/mountain/roadside split.

## 6) Input Mutation Smoke

Runner:

```sh
./port/test_input_mutation.sh
```

This validates the first runtime input surface on top of the scheduler rails:

- current-button mirroring into `state_0960` (`JOY1`)
- traced menu no-opponent handoff on `menu_gameplay_entry`
- default-rival `A` measured-window mutations on `menu_gameplay_entry` for
  the exact `2052..2088` window plus later checkpoints, over
  `state_09a2/state_09a8/state_137c` and
  `dp_0020/dp_0022/dp_0053/dp_0054`
- PNG artifact generation next to runtime and compare PPM dumps

This is intentionally narrow. It proves the runtime is no longer input-blind
for menu/gameplay rails before the later gameplay-state mutators are promoted.

## 7) Live SDL Input Smoke

Runner:

```sh
./port/test_live_input.sh
```

This validates the first real SDL-host input path on top of the same
mutator/history surface already exercised by `--input-script`:

- keyboard mapping into SNES `JOY1` bits
- SDL game-controller mapping into the same `JOY1` bits
- live-input history driving the traced no-opponent menu handoff
- live current input merging with scripted prehistory on the measured
  default-rival `2050..2088` corridor

This gate is intentionally scoped to the shared input surface, not to broad
interactive gameplay claims. It proves the SDL host is no longer bypassing the
validated route/mutator layer.

## 8) Scanline / Composition Contract Smoke

Runner:

```sh
./port/test_scanline_contract.sh
```

This validates the versioned gameplay scanline-contract surface, plus the new
late-gameplay composition-contract surface, independently of the scheduler
rails:

- a bootstrap bundle with no matching contract stays flat
- `gameplay_live_race_mid` loads its contract from
  `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- the solved live-race consumer still preserves selected sky/mountain/grass
  framebuffer pixels after loading that contract
- `lane3_live_entry_frame03250_bundle/design_pack` still loads the promoted
  scanline surface as a known late-entry no-op consumer
- `lane3_live_entry_brake_traffic_frame03400_bundle/design_pack` now also
  loads a promoted scanline profile from
  `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- that `3400` consumer preserves selected scanline fields and top-band sky
  pixels after loading both scanline and composition contracts
- the late-entry bundles `3250`, `3400`, and `3550` now load promoted
  composition profiles from
  `rom_analysis/docs/gameplay_composition_contracts.jsonc`
- those late-entry bundles preserve promoted top-band framebuffer anchors
  after enabling `BG3` and keeping `BG3 > BG2` in the measured upper window

This gate is intentionally narrow. It protects the new contract-selection path
and keeps later gameplay bundles from silently falling back to ad hoc runtime
lookups.

## 9) Practical Gate Policy

For each archaeology lane:

1. Add or update checkpoint rows in the JSON contracts.
2. Keep temporary tolerances only for known unstable windows.
3. Reduce tolerances as renderer/state fidelity improves.
4. Promote checkpoint to strict (`0`) once solved.
