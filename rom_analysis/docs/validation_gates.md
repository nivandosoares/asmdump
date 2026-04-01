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
  `1500 -> 2050`
- `gameplay_live_race_mid`: validates the reproducible gameplay seed over the
  promoted `3 -> 11` window

This smoke is intentionally state-first. It proves that the runtime now steps
callback families and handoffs for the three target rails, even when a given
design pack has no trusted `main_visible.ppm` golden.

## 6) Practical Gate Policy

For each archaeology lane:

1. Add or update checkpoint rows in the JSON contracts.
2. Keep temporary tolerances only for known unstable windows.
3. Reduce tolerances as renderer/state fidelity improves.
4. Promote checkpoint to strict (`0`) once solved.
