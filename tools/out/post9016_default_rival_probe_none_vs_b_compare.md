# Boot Probe Window Compare

- `no_input`: `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- `b_hold`: `tools/out/post9016_default_rival_probe_b/td2_boot_probe.json`
- compared frames: `2048..2208` (`161` shared frames)

## Shared Callback Surface

- `main`: `same` | `no_input` = `02:9016` | `b_hold` = `02:9016`
- `irq`: `same` | `no_input` = `01:96A0` | `b_hold` = `01:96A0`
- `nmi`: `same` | `no_input` = `02:8F3C` | `b_hold` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `none`
- `stable_all_frame_differences`: `none`
- `intermittent_constant_pair_differences`: `state_0960, dp_0008`
- `intermittent_mixed_differences`: `none`

## Differing Fields

- `state_0960`: diff `159/161` frames, first `2050`, last `2208`, pairs `0 -> 32768` x159
- `dp_0008`: diff `1/161` frames, first `2195`, last `2195`, pairs `3496 -> 0` x1
