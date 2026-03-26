# Front-End Pointer Table Decode

- Table base: `1E:8000`
- File offset: `0x0F0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 11 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:9EA4 | 9 | 36 | split_row_padded | bit_15_set | frontend_row_11_preview.ppm |
| 12 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A374 | 10 | 40 | split_row_padded | bit_15_set | frontend_row_12_preview.ppm |
| 13 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A8CC | 8 | 32 | contiguous | bit_15_set | frontend_row_13_preview.ppm |
| 14 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:AD14 | 10 | 40 | split_row_padded | bit_15_set | frontend_row_14_preview.ppm |

## Entry Notes

### Row `11`

- Target: `1E:9EA4`
- Header: `0x8009 0x0024 0xC73F 0x3728`
- Descriptor blob: `36` tiles / `1152` bytes at `0x0F1EF4`
- Layout: `split_row_padded`
- Split staging: `34` tiles first, `2` overflow tiles at tile `0x30`
- Preview: `frontend_row_11_preview.ppm`
- Tile sheet: `frontend_row_11_tiles.ppm`
- Object records:
| Slot | X | Y | Tile Word | Aux |
| ---: | ---: | ---: | --- | --- |
| 0 | 63 | 40 | 0x0000 | 0x0000 |
| 1 | 79 | 40 | 0x0002 | 0x0000 |
| 2 | 95 | 40 | 0x0004 | 0x0000 |
| 3 | 111 | 40 | 0x0006 | 0x0000 |
| 4 | 127 | 40 | 0x0008 | 0x0000 |
| 5 | 143 | 40 | 0x000A | 0x0000 |
| 6 | 159 | 40 | 0x000C | 0x0000 |
| 7 | 175 | 40 | 0x000E | 0x0000 |
| 8 | 191 | 40 | 0x0020 | 0x0000 |

### Row `12`

- Target: `1E:A374`
- Header: `0x800A 0x0028 0xCB2F 0x6556`
- Descriptor blob: `40` tiles / `1280` bytes at `0x0F23CC`
- Layout: `split_row_padded`
- Split staging: `36` tiles first, `4` overflow tiles at tile `0x30`
- Preview: `frontend_row_12_preview.ppm`
- Tile sheet: `frontend_row_12_tiles.ppm`
- Object records:
| Slot | X | Y | Tile Word | Aux |
| ---: | ---: | ---: | --- | --- |
| 0 | 47 | 86 | 0x0000 | 0x0000 |
| 1 | 63 | 86 | 0x0002 | 0x0000 |
| 2 | 82 | 86 | 0x0004 | 0x0000 |
| 3 | 98 | 86 | 0x0006 | 0x0000 |
| 4 | 114 | 86 | 0x0008 | 0x0000 |
| 5 | 133 | 86 | 0x000A | 0x0000 |
| 6 | 149 | 86 | 0x000C | 0x0000 |
| 7 | 165 | 86 | 0x000E | 0x0000 |
| 8 | 181 | 86 | 0x0020 | 0x0000 |
| 9 | 197 | 86 | 0x0022 | 0x0000 |

### Row `13`

- Target: `1E:A8CC`
- Header: `0x8008 0x0020 0xC347 0x9084`
- Descriptor blob: `32` tiles / `1024` bytes at `0x0F2914`
- Layout: `contiguous`
- Preview: `frontend_row_13_preview.ppm`
- Tile sheet: `frontend_row_13_tiles.ppm`
- Object records:
| Slot | X | Y | Tile Word | Aux |
| ---: | ---: | ---: | --- | --- |
| 0 | 71 | 132 | 0x0000 | 0x0000 |
| 1 | 87 | 132 | 0x0002 | 0x0000 |
| 2 | 105 | 132 | 0x0004 | 0x0000 |
| 3 | 121 | 132 | 0x0006 | 0x0000 |
| 4 | 137 | 132 | 0x0008 | 0x0000 |
| 5 | 153 | 132 | 0x000A | 0x0000 |
| 6 | 169 | 132 | 0x000C | 0x0000 |
| 7 | 185 | 132 | 0x000E | 0x0000 |

### Row `14`

- Target: `1E:AD14`
- Header: `0x800A 0x0028 0xD437 0xBEB2`
- Descriptor blob: `40` tiles / `1280` bytes at `0x0F2D6C`
- Layout: `split_row_padded`
- Split staging: `36` tiles first, `4` overflow tiles at tile `0x30`
- Preview: `frontend_row_14_preview.ppm`
- Tile sheet: `frontend_row_14_tiles.ppm`
- Object records:
| Slot | X | Y | Tile Word | Aux |
| ---: | ---: | ---: | --- | --- |
| 0 | 55 | 178 | 0x0000 | 0x0000 |
| 1 | 71 | 178 | 0x0002 | 0x0000 |
| 2 | 87 | 178 | 0x0004 | 0x0000 |
| 3 | 103 | 178 | 0x0006 | 0x0000 |
| 4 | 119 | 178 | 0x0008 | 0x0000 |
| 5 | 135 | 178 | 0x000A | 0x0000 |
| 6 | 151 | 178 | 0x000C | 0x0000 |
| 7 | 167 | 178 | 0x000E | 0x0000 |
| 8 | 183 | 178 | 0x0020 | 0x0000 |
| 9 | 199 | 178 | 0x0022 | 0x0000 |

## Notes

- Indices `8..10` are the current car-facing adjacent helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
