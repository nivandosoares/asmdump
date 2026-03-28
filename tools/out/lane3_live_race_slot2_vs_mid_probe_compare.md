# Boot Probe Window Compare

- `slot2_extra`: `tools/out/lane3_live_race_slot2_probe.json`
- `live_race_mid`: `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- compared frames: `0..7` (`8` shared frames)

## Shared Callback Surface

- `main`: `different` | `slot2_extra` = `00:8029` | `live_race_mid` = `02:9016`
- `irq`: `different` | `slot2_extra` = `00:835F` | `live_race_mid` = `01:96A0`
- `nmi`: `different` | `slot2_extra` = `00:8029` | `live_race_mid` = `02:8F3C`

## Difference Categories

- `stable_constant_window_differences`: `active_irq_callback_addr, active_irq_callback_bank, active_main_callback_addr, active_main_callback_bank, active_nmi_callback_addr, active_nmi_callback_bank, oam_0730, state_0202, state_1c6a, state_1c76`
- `stable_all_frame_differences`: `dp_0022, dp_0053, dp_0054, state_09a2, state_11f3`
- `intermittent_constant_pair_differences`: `state_09a8, state_0960`
- `intermittent_mixed_differences`: `dp_0020`

## Differing Fields

- `active_irq_callback_addr`: diff `8/8` frames, first `0`, last `7`, pairs `33631 -> 38560` x8
- `active_irq_callback_bank`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 1` x8
- `active_main_callback_addr`: diff `8/8` frames, first `0`, last `7`, pairs `32809 -> 36886` x8
- `active_main_callback_bank`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 2` x8
- `active_nmi_callback_addr`: diff `8/8` frames, first `0`, last `7`, pairs `32809 -> 36668` x8
- `active_nmi_callback_bank`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 2` x8
- `dp_0022`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 2` x6, `0 -> 3` x2
- `dp_0053`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 120` x2, `0 -> 136` x2, `0 -> 152` x2, `0 -> 168` x1
- `dp_0054`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 136` x2, `0 -> 152` x2, `0 -> 120` x1, `0 -> 168` x1
- `oam_0730`: diff `8/8` frames, first `0`, last `7`, pairs `57616 -> 4645` x8
- `state_0202`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 65535` x8
- `state_09a2`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 43` x2, `0 -> 41` x1, `0 -> 29` x1, `0 -> 30` x1
- `state_11f3`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 477` x6, `0 -> 478` x2
- `state_1c6a`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 1` x8
- `state_1c76`: diff `8/8` frames, first `0`, last `7`, pairs `0 -> 1` x8
- `dp_0020`: diff `4/8` frames, first `1`, last `7`, pairs `0 -> 40` x1, `0 -> 215` x1, `0 -> 221` x1, `0 -> 52` x1
- `state_09a8`: diff `4/8` frames, first `1`, last `7`, pairs `2 -> 10` x4
- `state_0960`: diff `1/8` frames, first `0`, last `0`, pairs `0 -> 128` x1
