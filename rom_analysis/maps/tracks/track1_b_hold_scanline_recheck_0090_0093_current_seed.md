# Current-Seed `b_hold` Scanline Recheck `0090..0093`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- ROM SHA-256:
  `53e1a9e17a8b0cffd24946e61a47a6f21e7d85ba32b9436da8705b5e53b1f017`
- Current savestate SHA-256:
  `516b217fe396e68d3c7149f13a6b156cd514ca2929172518a0d27654555f853e`
- Historical comparison point:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md` recorded
    the earlier `game_11.mss` fingerprint
    `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`

## What Was Run

- Current-seed boot-probe sanity check:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_selfcheck_probe_game11/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=8 ./validation/run_mesen_probe_boot.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss`
- Current-seed scanline frame-`0` sanity check:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=1 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_scanline_diag/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua ./.mesen-config/Mesen2/SaveStates/game_11.mss`
- Current-seed `b_hold` recheck:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_SCANLINE_TEST_TARGET_FRAME=90 TD2_SCANLINE_TEST_MAX_SAMPLES=620 TD2_SCANLINE_TEST_INPUT_WINDOWS='60-359:b' TD2_SCANLINE_TEST_TRACE_EXEC_POINTS='main_visible=02:9016,irq_960d=01:960D,irq_96a0=01:96A0,cand_9825=01:9825,cand_9868=01:9868,main_end=00:8029' TD2_SCANLINE_TEST_TRACE_WRITE_POINTS='dp_0053=00:0053,dp_0054=00:0054,dp_0055=00:0055,dp_0056=00:0056,helper_1e24=7E:1E24,helper_1e26=7E:1E26,helper_070c=7E:070C,helper_0718=7E:0718' TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_scanline_bhold_0090/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua ./.mesen-config/Mesen2/SaveStates/game_11.mss`
  - same command with `TD2_SCANLINE_TEST_TARGET_FRAME=91` and output prefix
    `tools/out/lane3_scanline_bhold_0091/td2_scanline_step_test`

## Artifacts

- `tools/out/lane3_selfcheck_probe_game11/td2_boot_probe.json`
- `tools/out/lane3_scanline_diag/td2_scanline_step_test.json`
- `tools/out/lane3_scanline_bhold_0090/td2_scanline_step_test.json`
- `tools/out/lane3_scanline_bhold_0091/td2_scanline_step_test.json`

## Current Reading

- The current `game_11.mss` still loads as the same broad front-end/demo seed
  family at frame `0`:
  - boot probe frame `0`: `active_main = 02:9016`, `active_irq = 01:96A0`,
    `$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF`
  - scanline frame `0` also starts on `02:9016 / 01:96A0`
- The old promoted `v2_current` `90..92` equalization window does **not**
  reproduce on the current savestate fingerprint.
- Fresh `b_hold` scanline reruns now stay completely flat:
  - frame `90 start/end`: `active_main = 00:8029`, `active_irq = 00:835F`,
    `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12`
  - frame `91 start/end`: the same flat tuple
  - frame `92 start/end`: the same flat tuple in the isolated `target=91`
    rerun
  - frame `93 start`: the same flat tuple in the isolated `target=91` rerun
- The fresh reruns record:
  - `0` exec hits at the old candidate points
  - `0` write hits at `00:0053..0056`
  - `0` helper write hits at `7E:1E24/1E26/070C/0718`

## Practical Reading

- The old `tools/out/track1_b_hold_scanline_frame_0090_trace_v1/v2.json`
  and `tools/out/track1_b_hold_scanline_frame_0091_trace_v1.json` artifacts
  remain useful historical evidence, but they are no longer reproducible from
  the current `game_11.mss`.
- The current savestate has drifted again since the already-fingerprinted
  `v3_ab_compare` note, so reopening the old `90..92` queue-cursor equalization
  step on today's `game_11.mss` is low-yield.
- The next defensible Lane 3 work remains the newer post-`02:9016`
  default-rival corridor, not more extraction attempts on the archived
  `90..92` window.
