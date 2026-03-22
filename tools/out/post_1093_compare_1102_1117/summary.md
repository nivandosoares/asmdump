# Post-1093 continuation compare summary

## Window

- frame range: `1102..1117`
- frame count: `16`
- roots: `/home/nivando-soares/asmdump/tools/out/mesen_range_1102_1109_v1`, `/home/nivando-soares/asmdump/tools/out/mesen_range_1110_1117_v1`

## Summary

- top-crop mismatches: `0..0`
- bottom-crop mismatches: `14901..21300`
- base-render mismatches vs `main_visible.ppm`: `838..2698`
- visible-state render mismatches vs `main_visible.ppm`: `2698..6292`
- activity main callbacks: `00:8029`
- frames with DMA: 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113
- frames without DMA: 1114, 1115, 1116, 1117

## Per-frame rows

| frame | main callback | top crop | bottom crop | base render | visible render | dma | mode7 events | mode7 writes |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1102 | 00:8029 | 0 | 14901 | 838 | 6082 | 1 | 3 | 16 |
| 1103 | 00:8029 | 0 | 15400 | 1061 | 5958 | 1 | 3 | 16 |
| 1104 | 00:8029 | 0 | 18457 | 1798 | 6292 | 1 | 3 | 16 |
| 1105 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1106 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1107 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1108 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1109 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1110 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1111 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1112 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1113 | 00:8029 | 0 | 21300 | 2698 | 2698 | 1 | 3 | 16 |
| 1114 | 00:8029 | 0 | 21300 | 2698 | 2698 | 0 | 3 | 16 |
| 1115 | 00:8029 | 0 | 21300 | 2698 | 2698 | 0 | 3 | 16 |
| 1116 | 00:8029 | 0 | 21300 | 2698 | 2698 | 0 | 3 | 16 |
| 1117 | 00:8029 | 0 | 21300 | 2698 | 2698 | 0 | 3 | 16 |

