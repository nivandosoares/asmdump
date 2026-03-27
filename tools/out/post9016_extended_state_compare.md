# Boot Probe Window Compare

- `default_rival_v2_fields`: `tools/out/post9016_rival_v2_fields/td2_boot_probe.json`
- `no_opponent_v7_fields`: `tools/out/post9016_clock_v7_fields/td2_boot_probe.json`
- compared frames: `2048..2088` (`41` shared frames)

## Shared Callback Surface

- `main`: `same` | `default_rival_v2_fields` = `02:9016` | `no_opponent_v7_fields` = `02:9016`
- `irq`: `same` | `default_rival_v2_fields` = `01:96A0` | `no_opponent_v7_fields` = `01:96A0`
- `nmi`: `same` | `default_rival_v2_fields` = `02:8F3C` | `no_opponent_v7_fields` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `oam_0730, state_11f3, state_1c70, state_1c76`
- `stable_all_frame_differences`: `dp_0053, dp_0054`
- `intermittent_constant_pair_differences`: `dp_0020, dp_0022, dp_0000, dp_000c, state_09a8, dp_0004, dp_0055, dp_0056`
- `intermittent_mixed_differences`: `dp_0008, state_09a2`

## Differing Fields

- `dp_0053`: diff `41/41` frames, first `2048`, last `2088`, pairs `248 -> 96` x32, `8 -> 104` x6, `232 -> 88` x3
- `dp_0054`: diff `41/41` frames, first `2048`, last `2088`, pairs `248 -> 96` x32, `8 -> 104` x7, `232 -> 88` x2
- `oam_0730`: diff `41/41` frames, first `2048`, last `2088`, pairs `4618 -> 57600` x41
- `state_11f3`: diff `41/41` frames, first `2048`, last `2088`, pairs `44 -> 0` x41
- `state_1c70`: diff `41/41` frames, first `2048`, last `2088`, pairs `0 -> 3` x41
- `state_1c76`: diff `41/41` frames, first `2048`, last `2088`, pairs `1 -> 0` x41
- `dp_0008`: diff `24/41` frames, first `2048`, last `2088`, pairs `5376 -> 960` x19, `3496 -> 0` x3, `32 -> 960` x2
- `dp_0020`: diff `21/41` frames, first `2048`, last `2088`, pairs `192 -> 149` x21
- `dp_0022`: diff `21/41` frames, first `2048`, last `2088`, pairs `9 -> 294` x21
- `state_09a2`: diff `21/41` frames, first `2048`, last `2088`, pairs `40 -> 34` x12, `38 -> 34` x9
- `dp_0000`: diff `3/41` frames, first `2051`, last `2083`, pairs `0 -> 4` x3
- `dp_000c`: diff `3/41` frames, first `2051`, last `2083`, pairs `45808 -> 33480` x3
- `state_09a8`: diff `3/41` frames, first `2051`, last `2083`, pairs `2 -> 10` x3
- `dp_0004`: diff `2/41` frames, first `2050`, last `2082`, pairs `24577 -> 10` x2
- `dp_0055`: diff `2/41` frames, first `2051`, last `2083`, pairs `5304 -> 5440` x2
- `dp_0056`: diff `2/41` frames, first `2051`, last `2083`, pairs `20 -> 21` x2
