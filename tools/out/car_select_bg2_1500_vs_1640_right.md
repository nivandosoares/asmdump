# Design-Pack Visible BG Diff

- Reference frame: `1500`
- Comparison frame: `1640`
- Layer: `bg2`
- Reference pack: `/home/nivando-soares/asmdump/tools/out/design_frame1500_car_select`
- Comparison pack: `/home/nivando-soares/asmdump/tools/out/design_frame1640_car_select_right`

## Summary

- Visible window: screen tiles `0,63` -> `32x28`
- State fields match: `True`
- Changed visible cells: `256`
- Unchanged visible cells: `640`
- Zero->nonzero: `0`
- Nonzero->zero: `0`
- Nonzero->nonzero: `256`
- Changed tile bbox: `0..30 x 16..27`
- Changed pixel bbox: `0..247 x 128..223`
- Changed rows: `[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]`
- Changed columns: `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]`
- Reference changed tile indices: `[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217]`
- Comparison changed tile indices: `[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232]`

## Sample Changes

| Screen | Map | Reference | Comparison |
| --- | --- | --- | --- |
| `(2, 16)` | `(2, 15)` | `entryWords=5, tileIndex=5, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=6, tileIndex=6, palette=0, priority=0, hflip=0, vflip=0` |
| `(3, 16)` | `(3, 15)` | `entryWords=5, tileIndex=5, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=7, tileIndex=7, palette=0, priority=0, hflip=0, vflip=0` |
| `(4, 16)` | `(4, 15)` | `entryWords=6, tileIndex=6, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=8, tileIndex=8, palette=0, priority=0, hflip=0, vflip=0` |
| `(5, 16)` | `(5, 15)` | `entryWords=7, tileIndex=7, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=9, tileIndex=9, palette=0, priority=0, hflip=0, vflip=0` |
| `(6, 16)` | `(6, 15)` | `entryWords=8, tileIndex=8, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=10, tileIndex=10, palette=0, priority=0, hflip=0, vflip=0` |
| `(7, 16)` | `(7, 15)` | `entryWords=9, tileIndex=9, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=11, tileIndex=11, palette=0, priority=0, hflip=0, vflip=0` |
| `(8, 16)` | `(8, 15)` | `entryWords=10, tileIndex=10, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=12, tileIndex=12, palette=0, priority=0, hflip=0, vflip=0` |
| `(9, 16)` | `(9, 15)` | `entryWords=11, tileIndex=11, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=13, tileIndex=13, palette=0, priority=0, hflip=0, vflip=0` |
| `(10, 16)` | `(10, 15)` | `entryWords=12, tileIndex=12, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=14, tileIndex=14, palette=0, priority=0, hflip=0, vflip=0` |
| `(11, 16)` | `(11, 15)` | `entryWords=13, tileIndex=13, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=15, tileIndex=15, palette=0, priority=0, hflip=0, vflip=0` |
| `(12, 16)` | `(12, 15)` | `entryWords=14, tileIndex=14, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=16, tileIndex=16, palette=0, priority=0, hflip=0, vflip=0` |
| `(13, 16)` | `(13, 15)` | `entryWords=15, tileIndex=15, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=17, tileIndex=17, palette=0, priority=0, hflip=0, vflip=0` |
| `(14, 16)` | `(14, 15)` | `entryWords=5, tileIndex=5, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=18, tileIndex=18, palette=0, priority=0, hflip=0, vflip=0` |
| `(15, 16)` | `(15, 15)` | `entryWords=16, tileIndex=16, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=19, tileIndex=19, palette=0, priority=0, hflip=0, vflip=0` |
| `(16, 16)` | `(16, 15)` | `entryWords=17, tileIndex=17, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=20, tileIndex=20, palette=0, priority=0, hflip=0, vflip=0` |
| `(17, 16)` | `(17, 15)` | `entryWords=18, tileIndex=18, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=21, tileIndex=21, palette=0, priority=0, hflip=0, vflip=0` |
| `(18, 16)` | `(18, 15)` | `entryWords=19, tileIndex=19, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=22, tileIndex=22, palette=0, priority=0, hflip=0, vflip=0` |
| `(19, 16)` | `(19, 15)` | `entryWords=20, tileIndex=20, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=23, tileIndex=23, palette=0, priority=0, hflip=0, vflip=0` |
| `(20, 16)` | `(20, 15)` | `entryWords=21, tileIndex=21, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=24, tileIndex=24, palette=0, priority=0, hflip=0, vflip=0` |
| `(21, 16)` | `(21, 15)` | `entryWords=22, tileIndex=22, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=25, tileIndex=25, palette=0, priority=0, hflip=0, vflip=0` |
| `(22, 16)` | `(22, 15)` | `entryWords=23, tileIndex=23, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=26, tileIndex=26, palette=0, priority=0, hflip=0, vflip=0` |
| `(23, 16)` | `(23, 15)` | `entryWords=24, tileIndex=24, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=27, tileIndex=27, palette=0, priority=0, hflip=0, vflip=0` |
| `(24, 16)` | `(24, 15)` | `entryWords=25, tileIndex=25, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=28, tileIndex=28, palette=0, priority=0, hflip=0, vflip=0` |
| `(25, 16)` | `(25, 15)` | `entryWords=26, tileIndex=26, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=29, tileIndex=29, palette=0, priority=0, hflip=0, vflip=0` |
| `(26, 16)` | `(26, 15)` | `entryWords=27, tileIndex=27, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=30, tileIndex=30, palette=0, priority=0, hflip=0, vflip=0` |
| `(27, 16)` | `(27, 15)` | `entryWords=28, tileIndex=28, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=31, tileIndex=31, palette=0, priority=0, hflip=0, vflip=0` |
| `(28, 16)` | `(28, 15)` | `entryWords=29, tileIndex=29, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=32, tileIndex=32, palette=0, priority=0, hflip=0, vflip=0` |
| `(29, 16)` | `(29, 15)` | `entryWords=30, tileIndex=30, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=33, tileIndex=33, palette=0, priority=0, hflip=0, vflip=0` |
| `(30, 16)` | `(30, 15)` | `entryWords=31, tileIndex=31, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=34, tileIndex=34, palette=0, priority=0, hflip=0, vflip=0` |
| `(2, 17)` | `(2, 16)` | `entryWords=5, tileIndex=5, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=35, tileIndex=35, palette=0, priority=0, hflip=0, vflip=0` |
| `(3, 17)` | `(3, 16)` | `entryWords=5, tileIndex=5, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=36, tileIndex=36, palette=0, priority=0, hflip=0, vflip=0` |
| `(4, 17)` | `(4, 16)` | `entryWords=32, tileIndex=32, palette=0, priority=0, hflip=0, vflip=0` | `entryWords=37, tileIndex=37, palette=0, priority=0, hflip=0, vflip=0` |
