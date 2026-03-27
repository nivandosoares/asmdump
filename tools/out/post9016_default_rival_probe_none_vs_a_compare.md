# Boot Probe Window Compare

- `no_input`: `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- `a_hold`: `tools/out/post9016_default_rival_probe_a/td2_boot_probe.json`
- compared frames: `2048..2208` (`161` shared frames)

## Shared Callback Surface

- `main`: `same` | `no_input` = `02:9016` | `a_hold` = `02:9016`
- `irq`: `same` | `no_input` = `01:96A0` | `a_hold` = `01:96A0`
- `nmi`: `same` | `no_input` = `02:8F3C` | `a_hold` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `none`
- `stable_all_frame_differences`: `none`
- `intermittent_constant_pair_differences`: `state_0960, state_137c, dp_0011, dp_0012`
- `intermittent_mixed_differences`: `dp_0054, dp_0053, dp_000c, dp_0020, dp_0008, dp_0040, state_11cd, dp_0022, dp_0004, dp_0000, state_09a2, dp_0055, dp_0056, state_09a8, state_11f1`

## Differing Fields

- `state_0960`: diff `159/161` frames, first `2050`, last `2208`, pairs `0 -> 128` x159
- `dp_0054`: diff `152/161` frames, first `2052`, last `2208`, pairs `248 -> 48` x4, `8 -> 184` x4, `8 -> 216` x4, `8 -> 224` x4
- `dp_0053`: diff `151/161` frames, first `2053`, last `2208`, pairs `248 -> 48` x4, `8 -> 184` x4, `8 -> 216` x4, `8 -> 224` x4
- `dp_000c`: diff `138/161` frames, first `2052`, last `2208`, pairs `33480 -> 45808` x58, `128 -> 45936` x4, `128 -> 43144` x3, `128 -> 43368` x3
- `dp_0020`: diff `117/161` frames, first `2052`, last `2208`, pairs `18 -> 19` x21, `192 -> 89` x15, `192 -> 88` x13, `192 -> 0` x11
- `dp_0008`: diff `109/161` frames, first `2052`, last `2208`, pairs `5376 -> 64` x36, `0 -> 3496` x26, `5376 -> 32` x13, `5376 -> 96` x10
- `state_137c`: diff `105/161` frames, first `2104`, last `2208`, pairs `0 -> 1` x105
- `dp_0040`: diff `85/161` frames, first `2124`, last `2208`, pairs `1537 -> 42497` x4, `1537 -> 7425` x4, `1537 -> 35329` x2, `1537 -> 36865` x2
- `state_11cd`: diff `85/161` frames, first `2124`, last `2208`, pairs `0 -> 30` x2, `0 -> 95` x2, `0 -> 169` x2, `0 -> 263` x2
- `dp_0022`: diff `82/161` frames, first `2083`, last `2208`, pairs `9 -> 48` x43, `4 -> 289` x33, `4 -> 309` x3, `4 -> 5` x2
- `dp_0004`: diff `74/161` frames, first `2052`, last `2208`, pairs `10 -> 32` x10, `10 -> 18433` x8, `10 -> 26625` x7, `10 -> 43009` x7
- `dp_0000`: diff `68/161` frames, first `2053`, last `2207`, pairs `4 -> 0` x28, `4 -> 1` x16, `0 -> 61440` x11, `4 -> 289` x8
- `state_09a2`: diff `64/161` frames, first `2125`, last `2208`, pairs `27 -> 26` x22, `27 -> 23` x9, `27 -> 24` x8, `40 -> 37` x8
- `dp_0055`: diff `62/161` frames, first `2053`, last `2207`, pairs `5520 -> 5352` x32, `5520 -> 5384` x12, `5520 -> 5320` x9, `5520 -> 5152` x3
- `dp_0056`: diff `49/161` frames, first `2053`, last `2204`, pairs `21 -> 20` x47, `20 -> 19` x1, `21 -> 17` x1
- `dp_0011`: diff `37/161` frames, first `2083`, last `2203`, pairs `7552 -> 4736` x37
- `dp_0012`: diff `37/161` frames, first `2083`, last `2203`, pairs `29 -> 18` x37
- `state_09a8`: diff `36/161` frames, first `2053`, last `2207`, pairs `10 -> 2` x33, `2 -> 10` x3
- `state_11f1`: diff `29/161` frames, first `2180`, last `2208`, pairs `45 -> 46` x22, `45 -> 47` x7
