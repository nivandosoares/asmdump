# Boot Probe Window Compare

- `live_race_plus30f`: `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- `post9016_default_rival_noinput`: `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- frame offsets: `live_race_plus30f=0`, `post9016_default_rival_noinput=-2048`
- compared frames: `0..11` (`12` shared frames)

## Shared Callback Surface

- `main`: `same` | `live_race_plus30f` = `02:9016` | `post9016_default_rival_noinput` = `02:9016`
- `irq`: `same` | `live_race_plus30f` = `01:96A0` | `post9016_default_rival_noinput` = `01:96A0`
- `nmi`: `same` | `live_race_plus30f` = `02:8F3C` | `post9016_default_rival_noinput` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `oam_0730`
- `stable_all_frame_differences`: `dp_0020, dp_0022, dp_0053, dp_0054, state_09a2, state_11f3`
- `intermittent_constant_pair_differences`: `state_09a8`
- `intermittent_mixed_differences`: `none`

## Differing Fields

- `dp_0020`: diff `12/12` frames, first `0`, last `11`, pairs `0 -> 192` x6, `88 -> 18` x5, `12 -> 18` x1
- `dp_0022`: diff `12/12` frames, first `0`, last `11`, pairs `304 -> 4` x6, `0 -> 9` x4, `2 -> 9` x2
- `dp_0053`: diff `12/12` frames, first `0`, last `11`, pairs `64 -> 248` x6, `40 -> 232` x3, `40 -> 248` x2, `48 -> 248` x1
- `dp_0054`: diff `12/12` frames, first `0`, last `11`, pairs `64 -> 248` x7, `40 -> 232` x2, `40 -> 248` x2, `48 -> 248` x1
- `oam_0730`: diff `12/12` frames, first `0`, last `11`, pairs `4655 -> 4618` x12
- `state_09a2`: diff `12/12` frames, first `0`, last `11`, pairs `25 -> 27` x5, `25 -> 40` x5, `25 -> 38` x1, `24 -> 27` x1
- `state_11f3`: diff `12/12` frames, first `0`, last `11`, pairs `627 -> 44` x4, `628 -> 44` x4, `629 -> 44` x4
- `state_09a8`: diff `4/12` frames, first `1`, last `11`, pairs `2 -> 10` x4
