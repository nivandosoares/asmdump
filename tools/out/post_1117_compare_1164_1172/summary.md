# Post-1093 continuation compare summary

## Window

- frame range: `1164..1172`
- frame count: `9`
- roots: `/home/nivando-soares/asmdump/tools/out/mesen_range_1164_1172_v1`

## Summary

- top-crop mismatches: `0..0`
- bottom-crop mismatches: `21258..21300`
- base-render mismatches vs `main_visible.ppm`: `0..0`
- visible-state render mismatches vs `main_visible.ppm`: `n/a`
- activity main callbacks: `00:8029`
- frames with DMA: 1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172
- frames without DMA: 1164

## Per-frame rows

| frame | main callback | top crop | bottom crop | base render | visible render | dma | mode7 events | mode7 writes |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1164 | 00:8029 | 0 | 21300 | 0 | None | 0 | 3 | 16 |
| 1165 | 00:8029 | 0 | 21300 | 0 | None | 2 | 5 | 274 |
| 1166 | 00:8029 | 0 | 21300 | 0 | None | 1 | 3 | 16 |
| 1167 | 00:8029 | 0 | 21300 | 0 | None | 1 | 3 | 16 |
| 1168 | 00:8029 | 0 | 21300 | 0 | None | 1 | 3 | 16 |
| 1169 | 00:8029 | 0 | 21266 | 0 | None | 1 | 3 | 16 |
| 1170 | 00:8029 | 0 | 21266 | 0 | None | 2 | 5 | 274 |
| 1171 | 00:8029 | 0 | 21262 | 0 | None | 1 | 3 | 16 |
| 1172 | 00:8029 | 0 | 21258 | 0 | None | 2 | 5 | 274 |

