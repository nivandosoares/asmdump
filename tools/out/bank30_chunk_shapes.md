# Bank30 Chunk Shape Analysis

## Refreshed Chunk Metrics

| Chunk | Words | Zero % | Unique words | High-bit-set % | > `0x7FFF` % |
|---|---:|---:|---:|---:|---:|
| `da96` | `14310` | `6.499` | `2154` | `86.9881` | `21.768` |
| `df6c` | `899` | `88.2091` | `104` | `0.1112` | `0.0` |
| `e039` | `1632` | `41.7279` | `456` | `29.902` | `3.4926` |
| `e73f` | `899` | `88.7653` | `100` | `0.1112` | `0.1112` |
| `e800` | `1584` | `38.8889` | `470` | `37.8157` | `2.904` |
| `ee7f` | `899` | `23.4705` | `269` | `29.6997` | `5.8954` |

## `DA96` Focus

- repeated `0x7C1F` run count: `33`
- dominant run stride: `157` words
- repeated row block width/rows: `157` x `33`
- identical row variants across that block: `2` (largest repeated row count `32`)

Top `DA96` long runs (`>=32` words):
- start `65` length `34` word `0x0000`
- start `194` length `58` word `0xB639`
- start `252` length `49` word `0x70F6`
- start `301` length `109` word `0x6C60`
- start `410` length `97` word `0xF700`
- start `585` length `43` word `0x0000`
- start `721` length `34` word `0x0000`
- start `778` length `127` word `0xFF7F`
- start `929` length `65` word `0x6060`
- start `994` length `113` word `0x7C70`
- start `1107` length `121` word `0x7078`
- start `1228` length `113` word `0x6060`

## `EE7F` Family Focus

| Pair | Compared words | Same words | Same % |
|---|---:|---:|---:|
| `df6c_vs_e73f` | `899` | `697` | `77.5306` |
| `df6c_vs_ee7f` | `899` | `189` | `21.0234` |
| `e73f_vs_ee7f` | `899` | `183` | `20.356` |

- `DF6C` and `E73F` stay a tight sparse pair, while `EE7F` keeps the same 899-word footprint but materially different occupancy and same-index shape.
