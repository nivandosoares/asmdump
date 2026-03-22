# Mode 7 BG1 export audit

## Canonical Frame

- frame: `1117`
- plateau analysis: `/home/nivando-soares/asmdump/tools/out/mode7_plateau_1117/analysis.json`
- frame dir: `/home/nivando-soares/asmdump/tools/out/mesen_range_1110_1117_v1/frame_01117`
- design dir: `/home/nivando-soares/asmdump/tools/out/design_mesen_range_1110_1117_v1/frame_01117`
- BG diff bbox: `24,67 -> 232,138`
- target scanlines: `67, 102, 138`
- target columns: `0, 1, 24, 25, 128`

## Best Models

- best BG-only overall: `base_y+1_x+0_h+0_pre` -> BG `2271`, main `0`
- best BG-only with main `0`: `base_y+1_x+0_h+0_pre` -> BG `2271`, main `0`
- best main overall: `base_y+1_x-1_h+0_post` -> BG `2271`, main `0`
- zero-main models scanned: `5` / `36`

## Top BG-only Candidates

| id | state | y | x | hscroll | sample | BG-only | main |
|---|---|---:|---:|---:|---|---:|---:|
| `base_y+1_x+0_h+0_pre` | `base` | `1` | `0` | `0` | `pre` | `2271` | `0` |
| `base_y+1_x-1_h+0_post` | `base` | `1` | `-1` | `0` | `post` | `2271` | `0` |
| `base_y+1_x+0_h-1_post` | `base` | `1` | `0` | `-1` | `post` | `2271` | `0` |
| `base_y+1_x-1_h+1_pre` | `base` | `1` | `-1` | `1` | `pre` | `2271` | `0` |
| `base_y+1_x+1_h-1_pre` | `base` | `1` | `1` | `-1` | `pre` | `2271` | `0` |
| `base_y+1_x+0_h+0_post` | `base` | `1` | `0` | `0` | `post` | `2503` | `2509` |
| `base_y+1_x+1_h+0_pre` | `base` | `1` | `1` | `0` | `pre` | `2503` | `2509` |
| `base_y+1_x+0_h+1_pre` | `base` | `1` | `0` | `1` | `pre` | `2503` | `2509` |
| `base_y+1_x-1_h+1_post` | `base` | `1` | `-1` | `1` | `post` | `2503` | `2509` |
| `base_y+1_x+1_h-1_post` | `base` | `1` | `1` | `-1` | `post` | `2503` | `2509` |
| `base_y+1_x-1_h+0_pre` | `base` | `1` | `-1` | `0` | `pre` | `3579` | `2509` |
| `base_y+1_x+0_h-1_pre` | `base` | `1` | `0` | `-1` | `pre` | `3579` | `2509` |

## Reading

- This audit keeps the composed-scene closure constraint explicit instead of optimizing `bg1_visible` in isolation.
- If no zero-main candidate improves meaningfully over `line + 1`, the remaining gap is better treated as export semantics than another small renderer tweak.
