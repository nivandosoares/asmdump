# Lane 3 Phase 4 Snow Seed Request Summary

## early_right_guess

- note: early 01:BAB3 right pulses
- probe: `tools/out/lane3_track_east_probe_guess/td2_boot_probe.json`
- first `01:BE43`: `None`
- first `02:9016`: `None`
- `selector_1c7c` values: `[0, 7538]`

| Frame | `selector_1c7c` | `state_0960` | `state_1c70` | `state_1c76` | `active_main` |
|---:|---:|---:|---:|---:|---|
| 1250 | 0 | 256 | 0 | 0 | `01:BAB3` |
| 1260 | 0 | 256 | 0 | 0 | `01:BAB3` |
| 1280 | 0 | 128 | 0 | 0 | `01:BAB3` |
| 1629 | 0 | 0 | 0 | 0 | `01:BAB3` |
| 1640 | 0 | 128 | 0 | 0 | `01:BAB3` |
| 1714 | 0 | 0 | 0 | 0 | `00:8029` |
| 1730 | 0 | 128 | 0 | 0 | `00:8029` |
| 1736 | 0 | 0 | 0 | 0 | `00:8029` |
| 2044 | 0 | 0 | 0 | 0 | `00:8029` |

## early_down_guess

- note: early 01:BAB3 down pulses
- probe: `tools/out/lane3_track_east_down_probe_guess/td2_boot_probe.json`
- first `01:BE43`: `1717`
- first `02:9016`: `2044`
- `selector_1c7c` values: `[0, 8903]`

| Frame | `selector_1c7c` | `state_0960` | `state_1c70` | `state_1c76` | `active_main` |
|---:|---:|---:|---:|---:|---|
| 1250 | 0 | 1024 | 0 | 0 | `01:BAB3` |
| 1260 | 0 | 1024 | 0 | 0 | `01:BAB3` |
| 1280 | 0 | 128 | 0 | 0 | `01:BAB3` |
| 1629 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 1640 | 0 | 128 | 0 | 0 | `01:C1D2` |
| 1714 | 0 | 0 | 0 | 0 | `00:8029` |
| 1730 | 0 | 128 | 0 | 0 | `01:BE43` |
| 1736 | 0 | 0 | 0 | 1 | `01:BE43` |
| 2044 | 0 | 0 | 0 | 1 | `02:9016` |

## be43_down_guess

- note: be43-relative down guess
- probe: `tools/out/lane3_track_be43_down_guess/td2_boot_probe.json`
- first `01:BE43`: `None`
- first `02:9016`: `None`
- `selector_1c7c` values: `[0, 43487]`

| Frame | `selector_1c7c` | `state_0960` | `state_1c70` | `state_1c76` | `active_main` |
|---:|---:|---:|---:|---:|---|
| 1250 | 0 | 0 | 0 | 0 | `01:BAB3` |
| 1260 | 0 | 0 | 0 | 0 | `01:BAB3` |
| 1280 | 0 | 4096 | 0 | 0 | `01:BAB3` |
| 1629 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 1640 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 1714 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 1730 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 1736 | 0 | 0 | 0 | 0 | `01:C1D2` |
| 2044 | 0 | 0 | 0 | 0 | `01:C1D2` |
