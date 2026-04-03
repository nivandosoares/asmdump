# Late `01:9FE5` Window Summary (`986..1093`)

This note consolidates the late bridge-visible intro window that previously
lived only as per-frame visual contracts.

Primary artifact:

- `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`

Builder path:

- `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`

## Window Shape

- sampled frames:
  - `986`, `990`, `994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`,
    `1045`, `1053`, `1061`, `1069`, `1077`, `1085`, `1093`
- callback family is flat across the whole sampled window:
  - main callback: `01:9FE5`
  - IRQ callback: `00:835F`
- presentation surface is also flat:
  - `bgMode = 7`
  - main-screen layers: `bg1`

## OBJ Growth

- visible sprite count:
  - `986` -> `0`
  - `990` -> `5`
  - `994` -> `19`
  - `998` -> `32`
  - `1005` -> `53`
  - `1013..1093` -> `61`

Reading:

- the late overlay grows quickly between `986` and `1005`
- by `1013`, the visible OBJ set has reached its stable sampled size

## State Progression

- `$0204` settles back to `1` from `1013` onward after the early `3 -> 2 -> 1 -> 2 -> 3` prelude
- `$0206` stays `0` through `1021`, then rises:
  - `1029` -> `1`
  - `1037` -> `3`
  - `1045` -> `5`
  - `1053` -> `7`
  - `1061` -> `9`
  - `1069` -> `11`
  - `1077..1093` -> `13`
- `$040A` follows the same later stair-step:
  - `1029` -> `6`
  - `1037` -> `8`
  - `1045` -> `10`
  - `1053` -> `12`
  - `1061` -> `14`
  - `1069` -> `16`
  - `1077..1093` -> `17`
- `$0054` wraps and then plateaus:
  - `986` -> `56`
  - `990` -> `88`
  - `994` -> `120`
  - `998` -> `152`
  - `1005` -> `208`
  - `1013` -> `8`
  - `1021` -> `32`
  - `1029` -> `40`
  - `1037` -> `56`
  - `1045` -> `72`
  - `1053` -> `88`
  - `1061` -> `104`
  - `1069` -> `120`
  - `1077..1093` -> `128`

## Producer Domains

- distinct sampled producer domains across the whole window:
  - `oam`
  - `vram`
- sampled OAM-only windows:
  - `1029`
  - `1085`
  - `1093`

Reading:

- late ownership stays inside the same callback family even when the sampled
  `vram` domain disappears
- this means the next open problem after `1093` is not callback-family
  identification
- it is the post-`1093` composition/export change that makes the visible-state
  continuation diverge more sharply

## Next Reading

- use this range summary as the current source of truth for the late
  `01:9FE5` callback family
- continue with:
  - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`
  - that note closes the first post-`1093` read:
    - `main_visible.ppm` is exactly the top `224` lines of `main.ppm`
    - swapping only the visible-scanline `ppu.mode7.matrix[0]/[3]` values
      makes the render mismatch worse, not better
