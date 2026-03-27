# Front-End Pointer Table Decode

- Table base: `1E:8000`
- File offset: `0x0F0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 15 | top-level signboard labels ($1C6A + 0x000F) | 1E:B26C | 12 | 40 | split_row_padded | bit_15_set | frontend_row_15_preview.ppm |
| 16 | top-level signboard labels ($1C6A + 0x000F) | 1E:B7D4 | 12 | 32 | contiguous | bit_15_set | frontend_row_16_preview.ppm |
| 17 | top-level signboard labels ($1C6A + 0x000F) | 1E:BC3C | 12 | 36 | split_row_padded | bit_15_set | frontend_row_17_preview.ppm |

## Entry Notes

### Row `15`

- Target: `1E:B26C`
- Header: `0x800C 0x0028 0x5A24 0x714B`
- Descriptor blob: `40` tiles / `1280` bytes at `0x0F32D4`
- Layout: `split_row_padded`
- Split staging: `36` tiles first, `4` overflow tiles at tile `0x30`
- Preview: `frontend_row_15_preview.ppm`
- Tile sheet: `frontend_row_15_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0024 / 36 | 0x004B / 75 | 0x0400 | 0x0000 |
| 1 | 0x0034 / 52 | 0x004B / 75 | 0x0402 | 0x0000 |
| 2 | 0x0044 / 68 | 0x004B / 75 | 0x0404 | 0x0000 |
| 3 | 0x0054 / 84 | 0x004B / 75 | 0x0406 | 0x0000 |
| 4 | 0x0024 / 36 | 0x005B / 91 | 0x0408 | 0x0000 |
| 5 | 0x0034 / 52 | 0x005B / 91 | 0x040A | 0x0000 |
| 6 | 0x0044 / 68 | 0x005B / 91 | 0x040C | 0x0000 |
| 7 | 0x0054 / 84 | 0x005B / 91 | 0x040E | 0x0000 |
| 8 | 0x0026 / 38 | 0x006B / 107 | 0x0420 | 0x0000 |
| 9 | 0x0036 / 54 | 0x006B / 107 | 0x0422 | 0x0000 |
| 10 | 0x0049 / 73 | 0x006B / 107 | 0x4420 | 0x0000 |
| 11 | 0x0039 / 57 | 0x006B / 107 | 0x0422 | 0x0000 |

### Row `16`

- Target: `1E:B7D4`
- Header: `0x800C 0x0020 0x9963 0x714B`
- Descriptor blob: `32` tiles / `1024` bytes at `0x0F383C`
- Layout: `contiguous`
- Preview: `frontend_row_16_preview.ppm`
- Tile sheet: `frontend_row_16_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0063 / 99 | 0x004B / 75 | 0x0400 | 0x0000 |
| 1 | 0x0073 / 115 | 0x004B / 75 | 0x0402 | 0x0000 |
| 2 | 0x008A / 138 | 0x004B / 75 | 0x4400 | 0x0000 |
| 3 | 0x007A / 122 | 0x004B / 75 | 0x0404 | 0x0000 |
| 4 | 0x0063 / 99 | 0x005B / 91 | 0x0406 | 0x0000 |
| 5 | 0x0073 / 115 | 0x005B / 91 | 0x0408 | 0x0000 |
| 6 | 0x008A / 138 | 0x005B / 91 | 0x4406 | 0x0000 |
| 7 | 0x007A / 122 | 0x005B / 91 | 0x040A | 0x0000 |
| 8 | 0x0065 / 101 | 0x006B / 107 | 0x040C | 0x0000 |
| 9 | 0x0075 / 117 | 0x006B / 107 | 0x040E | 0x0000 |
| 10 | 0x0088 / 136 | 0x006B / 107 | 0x440C | 0x0000 |
| 11 | 0x0078 / 120 | 0x006B / 107 | 0x040E | 0x0000 |

### Row `17`

- Target: `1E:BC3C`
- Header: `0x800C 0x0024 0xD8A2 0x714B`
- Descriptor blob: `36` tiles / `1152` bytes at `0x0F3CA4`
- Layout: `split_row_padded`
- Split staging: `34` tiles first, `2` overflow tiles at tile `0x30`
- Preview: `frontend_row_17_preview.ppm`
- Tile sheet: `frontend_row_17_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x00A2 / 162 | 0x004B / 75 | 0x0400 | 0x0000 |
| 1 | 0x00B2 / 178 | 0x004B / 75 | 0x0402 | 0x0000 |
| 2 | 0x00C9 / 201 | 0x004B / 75 | 0x4400 | 0x0000 |
| 3 | 0x00B9 / 185 | 0x004B / 75 | 0x0404 | 0x0000 |
| 4 | 0x00A2 / 162 | 0x005B / 91 | 0x0406 | 0x0000 |
| 5 | 0x00B2 / 178 | 0x005B / 91 | 0x0408 | 0x0000 |
| 6 | 0x00C2 / 194 | 0x005B / 91 | 0x040A | 0x0000 |
| 7 | 0x00D2 / 210 | 0x005B / 91 | 0x040C | 0x0000 |
| 8 | 0x00A4 / 164 | 0x006B / 107 | 0x040E | 0x0000 |
| 9 | 0x00B4 / 180 | 0x006B / 107 | 0x0420 | 0x0000 |
| 10 | 0x00C7 / 199 | 0x006B / 107 | 0x440E | 0x0000 |
| 11 | 0x00B7 / 183 | 0x006B / 107 | 0x0420 | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `15..17` are the current top-level signboard labels.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
