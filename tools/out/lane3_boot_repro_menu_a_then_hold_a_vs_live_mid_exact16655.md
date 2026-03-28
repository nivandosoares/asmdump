# Boot Probe Window Compare

- `live_race_mid`: `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `menu_a_then_hold_a`: `tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe.json`
- frame offsets: `live_race_mid=0`, `menu_a_then_hold_a=-16655`
- compared frames: `0..11` (`12` shared frames)

## Shared Callback Surface

- `main`: `same` | `live_race_mid` = `02:9016` | `menu_a_then_hold_a` = `02:9016`
- `irq`: `same` | `live_race_mid` = `01:96A0` | `menu_a_then_hold_a` = `01:96A0`
- `nmi`: `same` | `live_race_mid` = `02:8F3C` | `menu_a_then_hold_a` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `oam_0730`
- `stable_all_frame_differences`: `dp_0020, dp_0022, dp_0053, dp_0054, state_11f3`
- `intermittent_constant_pair_differences`: `state_0960, state_09a8`
- `intermittent_mixed_differences`: `state_09a2`

## Differing Fields

- `dp_0020`: diff `12/12` frames, first `0`, last `11`, pairs `0 -> 11` x5, `40 -> 11` x1, `215 -> 11` x1, `221 -> 11` x1
- `dp_0022`: diff `12/12` frames, first `0`, last `11`, pairs `2 -> 284` x8, `3 -> 284` x3, `303 -> 284` x1
- `dp_0053`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 248` x3, `120 -> 248` x2, `136 -> 248` x2, `152 -> 248` x2
- `dp_0054`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 248` x4, `136 -> 248` x2, `152 -> 248` x2, `120 -> 248` x1
- `oam_0730`: diff `12/12` frames, first `0`, last `11`, pairs `4645 -> 4628` x12
- `state_11f3`: diff `12/12` frames, first `0`, last `11`, pairs `477 -> 198` x6, `478 -> 198` x4, `479 -> 198` x2
- `state_0960`: diff `11/12` frames, first `1`, last `11`, pairs `0 -> 128` x11
- `state_09a2`: diff `11/12` frames, first `0`, last `11`, pairs `43 -> 32` x2, `33 -> 32` x2, `49 -> 32` x2, `41 -> 32` x1
- `state_09a8`: diff `5/12` frames, first `1`, last `9`, pairs `10 -> 2` x5
