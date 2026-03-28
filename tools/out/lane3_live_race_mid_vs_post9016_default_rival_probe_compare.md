# Boot Probe Window Compare

- `live_race_mid`: `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `post9016_default_rival_noinput`: `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- frame offsets: `live_race_mid=0`, `post9016_default_rival_noinput=-2048`
- compared frames: `0..11` (`12` shared frames)

## Shared Callback Surface

- `main`: `same` | `live_race_mid` = `02:9016` | `post9016_default_rival_noinput` = `02:9016`
- `irq`: `same` | `live_race_mid` = `01:96A0` | `post9016_default_rival_noinput` = `01:96A0`
- `nmi`: `same` | `live_race_mid` = `02:8F3C` | `post9016_default_rival_noinput` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `oam_0730`
- `stable_all_frame_differences`: `dp_0020, dp_0022, dp_0053, dp_0054, state_09a2, state_11f3`
- `intermittent_constant_pair_differences`: `state_0960`
- `intermittent_mixed_differences`: `state_09a8`

## Differing Fields

- `dp_0020`: diff `12/12` frames, first `0`, last `11`, pairs `0 -> 192` x5, `40 -> 18` x1, `215 -> 18` x1, `221 -> 18` x1
- `dp_0022`: diff `12/12` frames, first `0`, last `11`, pairs `2 -> 9` x6, `3 -> 4` x3, `2 -> 4` x2, `303 -> 4` x1
- `dp_0053`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 248` x3, `120 -> 232` x2, `152 -> 248` x2, `136 -> 232` x1
- `dp_0054`: diff `12/12` frames, first `0`, last `11`, pairs `200 -> 248` x4, `152 -> 248` x2, `120 -> 232` x1, `136 -> 232` x1
- `oam_0730`: diff `12/12` frames, first `0`, last `11`, pairs `4645 -> 4618` x12
- `state_09a2`: diff `12/12` frames, first `0`, last `11`, pairs `43 -> 40` x2, `33 -> 27` x2, `49 -> 40` x2, `41 -> 38` x1
- `state_11f3`: diff `12/12` frames, first `0`, last `11`, pairs `477 -> 44` x6, `478 -> 44` x4, `479 -> 44` x2
- `state_09a8`: diff `2/12` frames, first `3`, last `11`, pairs `10 -> 2` x1, `2 -> 10` x1
- `state_0960`: diff `1/12` frames, first `0`, last `0`, pairs `128 -> 0` x1
