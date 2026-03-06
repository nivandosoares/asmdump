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
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.json \
  --json-out tools/out/callback_state_contracts_report.json
```

This validates callback continuity and selected state fields at known frames
(`01:A39C`, `01:9D69`, `01:9FE5` windows) as first-class machine checks.
Use a probe capture that matches the contract's expected profile in
`expected_probe_profile`.

## 3) Practical Gate Policy

For each archaeology lane:

1. Add or update checkpoint rows in the JSON contracts.
2. Keep temporary tolerances only for known unstable windows.
3. Reduce tolerances as renderer/state fidelity improves.
4. Promote checkpoint to strict (`0`) once solved.
