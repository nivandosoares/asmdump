# B1F9 Stage Report

- input dir: `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace`
- scenarios: `3`
- forced scenarios: `2`
- forced-lane read: `stall-after-entry`

## Scenario Summary

| Scenario | `B1F9` exec | Post-entry `L001210` hits | Bank30 hits | Stage counts | Tail main | Tail `1D10` | Tail `09A8` | Tail `0960` |
|---|---:|---:|---:|---|---|---|---:|---:|
| `force_main_9568_with_state_stagetrace` | `1` | `0` | `0` | `b226:0/b256:0/b273:0/b59b:0` | `01:9568` | `0x4100` | `2` | `0` |
| `force_main_95ad_with_state_stagetrace` | `1` | `0` | `0` | `b226:0/b256:0/b273:0/b59b:0` | `01:95AD` | `0x4100` | `2` | `0` |
| `seq_base_stagetrace_2200` | `0` | `0` | `4` | `b226:0/b256:0/b273:0/b59b:0` | `01:A39C` | `0x0000` | `2` | `0` |

## Forced Lane Detail

### `force_main_9568_with_state_stagetrace`

- `B1F9` exec frames: `[1201]`
- post-entry `L001210` hits: `0`
- post-entry bank30 hits: `0`
- all bank30 sources seen in scenario: `none`
- entry snapshot: `main=01:9568` `1C78/1C80/1CA8=1/0/2` `1D10=0x4100` `09A8=2` `0960=0`
- tail snapshot: `main=01:9568` `1D10=0x4100` `09A8=2` `0960=0` `1C86=1`

### `force_main_95ad_with_state_stagetrace`

- `B1F9` exec frames: `[1201]`
- post-entry `L001210` hits: `0`
- post-entry bank30 hits: `0`
- all bank30 sources seen in scenario: `none`
- entry snapshot: `main=01:95AD` `1C78/1C80/1CA8=1/0/2` `1D10=0x4100` `09A8=2` `0960=0`
- tail snapshot: `main=01:95AD` `1D10=0x4100` `09A8=2` `0960=0` `1C86=1`
