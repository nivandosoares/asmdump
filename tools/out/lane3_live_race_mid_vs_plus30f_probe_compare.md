# Boot Probe Window Compare

- `live_race_mid`: `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `live_race_plus30f`: `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- compared frames: `0..11` (`12` shared frames)

## Shared Callback Surface

- `main`: `same` | `live_race_mid` = `02:9016` | `live_race_plus30f` = `02:9016`
- `irq`: `same` | `live_race_mid` = `01:96A0` | `live_race_plus30f` = `01:96A0`
- `nmi`: `same` | `live_race_mid` = `02:8F3C` | `live_race_plus30f` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `none`
- `stable_all_frame_differences`: `dp_0053, dp_0054, state_09a2, state_11f3`
- `intermittent_constant_pair_differences`: `state_09a8, state_0960`
- `intermittent_mixed_differences`: `dp_0022, dp_0020`

## Differing Fields

- `dp_0053`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 64` x3, `120 -> 40` x2, `136 -> 40` x2, `152 -> 40` x1
- `dp_0054`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 64` x4, `136 -> 40` x2, `120 -> 40` x1, `152 -> 40` x1
- `state_09a2`: diff `12/12` frames, first `0`, last `11`, pairs `43 -> 25` x2, `49 -> 25` x2, `41 -> 25` x1, `29 -> 25` x1
- `state_11f3`: diff `12/12` frames, first `0`, last `11`, pairs `477 -> 627` x4, `477 -> 628` x2, `478 -> 628` x2, `478 -> 629` x2
- `dp_0022`: diff `10/12` frames, first `1`, last `11`, pairs `2 -> 0` x4, `3 -> 304` x3, `2 -> 304` x2, `303 -> 304` x1
- `dp_0020`: diff `7/12` frames, first `1`, last `11`, pairs `40 -> 88` x1, `215 -> 88` x1, `221 -> 12` x1, `52 -> 88` x1
- `state_09a8`: diff `4/12` frames, first `1`, last `9`, pairs `10 -> 2` x4
- `state_0960`: diff `1/12` frames, first `0`, last `0`, pairs `128 -> 0` x1
