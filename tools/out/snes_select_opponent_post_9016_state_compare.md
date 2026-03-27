# Boot Probe Window Compare

- `default_rival`: `tools/out/select_opponent_clock_path_v2/td2_boot_probe.json`
- `no_opponent_clock`: `tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json`
- compared frames: `2044..2199` (`156` shared frames)

## Shared Callback Surface

- `main`: `same` | `default_rival` = `02:9016` | `no_opponent_clock` = `02:9016`
- `irq`: `same` | `default_rival` = `01:96A0` | `no_opponent_clock` = `01:96A0`
- `nmi`: `same` | `default_rival` = `02:8F3C` | `no_opponent_clock` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `state_1c70, state_1c76`
- `stable_all_frame_differences`: `dp_0053, dp_0054`
- `intermittent_constant_pair_differences`: `dp_0020, dp_0022, dp_0000, dp_000c, state_09a8, dp_0056`
- `intermittent_mixed_differences`: `dp_0008, state_09a2, dp_0004, dp_0055`

## Differing Fields

- `dp_0053`: diff `156/156` frames, first `2044`, last `2199`, pairs `248 -> 96` x32, `8 -> 104` x32, `24 -> 112` x32, `40 -> 120` x32
- `dp_0054`: diff `156/156` frames, first `2044`, last `2199`, pairs `248 -> 96` x32, `8 -> 104` x32, `24 -> 112` x32, `40 -> 120` x32
- `state_1c70`: diff `156/156` frames, first `2044`, last `2199`, pairs `0 -> 3` x156
- `state_1c76`: diff `156/156` frames, first `2044`, last `2199`, pairs `1 -> 0` x156
- `dp_0008`: diff `88/156` frames, first `2046`, last `2198`, pairs `5376 -> 960` x71, `3496 -> 0` x11, `32 -> 960` x5, `96 -> 960` x1
- `dp_0020`: diff `77/156` frames, first `2046`, last `2198`, pairs `192 -> 149` x77
- `dp_0022`: diff `77/156` frames, first `2046`, last `2198`, pairs `9 -> 294` x77
- `state_09a2`: diff `77/156` frames, first `2046`, last `2198`, pairs `40 -> 34` x40, `38 -> 34` x37
- `dp_0000`: diff `11/156` frames, first `2047`, last `2195`, pairs `0 -> 4` x11
- `dp_000c`: diff `11/156` frames, first `2047`, last `2195`, pairs `45808 -> 33480` x11
- `state_09a8`: diff `11/156` frames, first `2047`, last `2195`, pairs `2 -> 10` x11
- `dp_0004`: diff `6/156` frames, first `2046`, last `2178`, pairs `24577 -> 10` x5, `63489 -> 10` x1
- `dp_0055`: diff `6/156` frames, first `2047`, last `2179`, pairs `5304 -> 5440` x5, `5320 -> 5520` x1
- `dp_0056`: diff `6/156` frames, first `2047`, last `2179`, pairs `20 -> 21` x6
