# Front-End Pointer Table Decode

- Table base: `1E:8000`
- File offset: `0x0F0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 8 | front-end rolling-tire helper ($0202 + 0x0008) | 1E:9ACC | 8 | 8 | contiguous | none | frontend_row_08_preview.ppm |
| 9 | front-end rolling-tire helper ($0202 + 0x0008) | 1E:9C14 | 8 | 8 | contiguous | none | frontend_row_09_preview.ppm |
| 10 | front-end rolling-tire helper ($0202 + 0x0008) | 1E:9D5C | 8 | 8 | contiguous | none | frontend_row_10_preview.ppm |
| 11 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:9EA4 | 9 | 36 | split_row_padded | bit_15_set | frontend_row_11_preview.ppm |
| 12 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A374 | 10 | 40 | split_row_padded | bit_15_set | frontend_row_12_preview.ppm |
| 13 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A8CC | 8 | 32 | contiguous | bit_15_set | frontend_row_13_preview.ppm |
| 14 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:AD14 | 10 | 40 | split_row_padded | bit_15_set | frontend_row_14_preview.ppm |

## Entry Notes

### Row `8`

- Target: `1E:9ACC`
- Header: `0x0008 0x0008 0x09F7 0xFBE7`
- Descriptor blob: `8` tiles / `256` bytes at `0x0F1B14`
- Layout: `contiguous`
- Preview: `frontend_row_08_preview.ppm`
- Tile sheet: `frontend_row_08_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFE7 / -25 | 0x0400 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFE7 / -25 | 0x0401 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFE7 / -25 | 0x0402 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEF / -17 | 0x0403 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEF / -17 | 0x0404 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEF / -17 | 0x0405 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFF7 / -9 | 0x0406 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFF7 / -9 | 0x0407 | 0x0000 |

### Row `9`

- Target: `1E:9C14`
- Header: `0x0008 0x0008 0x09F7 0xFBE7`
- Descriptor blob: `8` tiles / `256` bytes at `0x0F1C5C`
- Layout: `contiguous`
- Preview: `frontend_row_09_preview.ppm`
- Tile sheet: `frontend_row_09_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFE7 / -25 | 0x0400 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFE7 / -25 | 0x0401 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFE7 / -25 | 0x0402 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEF / -17 | 0x0403 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEF / -17 | 0x0404 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEF / -17 | 0x0405 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFF7 / -9 | 0x0406 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFF7 / -9 | 0x0407 | 0x0000 |

### Row `10`

- Target: `1E:9D5C`
- Header: `0x0008 0x0008 0x09F7 0xFBE7`
- Descriptor blob: `8` tiles / `256` bytes at `0x0F1DA4`
- Layout: `contiguous`
- Preview: `frontend_row_10_preview.ppm`
- Tile sheet: `frontend_row_10_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFE7 / -25 | 0x0400 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFE7 / -25 | 0x0401 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFE7 / -25 | 0x0402 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEF / -17 | 0x0403 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEF / -17 | 0x0404 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEF / -17 | 0x0405 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFF7 / -9 | 0x0406 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFF7 / -9 | 0x0407 | 0x0000 |

### Row `11`

- Target: `1E:9EA4`
- Header: `0x8009 0x0024 0xC73F 0x3728`
- Descriptor blob: `36` tiles / `1152` bytes at `0x0F1EF4`
- Layout: `split_row_padded`
- Split staging: `34` tiles first, `2` overflow tiles at tile `0x30`
- Preview: `frontend_row_11_preview.ppm`
- Tile sheet: `frontend_row_11_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x003F / 63 | 0x0028 / 40 | 0x0000 | 0x0000 |
| 1 | 0x004F / 79 | 0x0028 / 40 | 0x0002 | 0x0000 |
| 2 | 0x005F / 95 | 0x0028 / 40 | 0x0004 | 0x0000 |
| 3 | 0x006F / 111 | 0x0028 / 40 | 0x0006 | 0x0000 |
| 4 | 0x007F / 127 | 0x0028 / 40 | 0x0008 | 0x0000 |
| 5 | 0x008F / 143 | 0x0028 / 40 | 0x000A | 0x0000 |
| 6 | 0x009F / 159 | 0x0028 / 40 | 0x000C | 0x0000 |
| 7 | 0x00AF / 175 | 0x0028 / 40 | 0x000E | 0x0000 |
| 8 | 0x00BF / 191 | 0x0028 / 40 | 0x0020 | 0x0000 |

### Row `12`

- Target: `1E:A374`
- Header: `0x800A 0x0028 0xCB2F 0x6556`
- Descriptor blob: `40` tiles / `1280` bytes at `0x0F23CC`
- Layout: `split_row_padded`
- Split staging: `36` tiles first, `4` overflow tiles at tile `0x30`
- Preview: `frontend_row_12_preview.ppm`
- Tile sheet: `frontend_row_12_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x002F / 47 | 0x0056 / 86 | 0x0000 | 0x0000 |
| 1 | 0x003F / 63 | 0x0056 / 86 | 0x0002 | 0x0000 |
| 2 | 0x0052 / 82 | 0x0056 / 86 | 0x0004 | 0x0000 |
| 3 | 0x0062 / 98 | 0x0056 / 86 | 0x0006 | 0x0000 |
| 4 | 0x0072 / 114 | 0x0056 / 86 | 0x0008 | 0x0000 |
| 5 | 0x0085 / 133 | 0x0056 / 86 | 0x000A | 0x0000 |
| 6 | 0x0095 / 149 | 0x0056 / 86 | 0x000C | 0x0000 |
| 7 | 0x00A5 / 165 | 0x0056 / 86 | 0x000E | 0x0000 |
| 8 | 0x00B5 / 181 | 0x0056 / 86 | 0x0020 | 0x0000 |
| 9 | 0x00C5 / 197 | 0x0056 / 86 | 0x0022 | 0x0000 |

### Row `13`

- Target: `1E:A8CC`
- Header: `0x8008 0x0020 0xC347 0x9084`
- Descriptor blob: `32` tiles / `1024` bytes at `0x0F2914`
- Layout: `contiguous`
- Preview: `frontend_row_13_preview.ppm`
- Tile sheet: `frontend_row_13_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0047 / 71 | 0x0084 / 132 | 0x0000 | 0x0000 |
| 1 | 0x0057 / 87 | 0x0084 / 132 | 0x0002 | 0x0000 |
| 2 | 0x0069 / 105 | 0x0084 / 132 | 0x0004 | 0x0000 |
| 3 | 0x0079 / 121 | 0x0084 / 132 | 0x0006 | 0x0000 |
| 4 | 0x0089 / 137 | 0x0084 / 132 | 0x0008 | 0x0000 |
| 5 | 0x0099 / 153 | 0x0084 / 132 | 0x000A | 0x0000 |
| 6 | 0x00A9 / 169 | 0x0084 / 132 | 0x000C | 0x0000 |
| 7 | 0x00B9 / 185 | 0x0084 / 132 | 0x000E | 0x0000 |

### Row `14`

- Target: `1E:AD14`
- Header: `0x800A 0x0028 0xD437 0xBEB2`
- Descriptor blob: `40` tiles / `1280` bytes at `0x0F2D6C`
- Layout: `split_row_padded`
- Split staging: `36` tiles first, `4` overflow tiles at tile `0x30`
- Preview: `frontend_row_14_preview.ppm`
- Tile sheet: `frontend_row_14_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0037 / 55 | 0x00B2 / 178 | 0x0000 | 0x0000 |
| 1 | 0x0047 / 71 | 0x00B2 / 178 | 0x0002 | 0x0000 |
| 2 | 0x0057 / 87 | 0x00B2 / 178 | 0x0004 | 0x0000 |
| 3 | 0x0067 / 103 | 0x00B2 / 178 | 0x0006 | 0x0000 |
| 4 | 0x0077 / 119 | 0x00B2 / 178 | 0x0008 | 0x0000 |
| 5 | 0x0087 / 135 | 0x00B2 / 178 | 0x000A | 0x0000 |
| 6 | 0x0097 / 151 | 0x00B2 / 178 | 0x000C | 0x0000 |
| 7 | 0x00A7 / 167 | 0x00B2 / 178 | 0x000E | 0x0000 |
| 8 | 0x00B7 / 183 | 0x00B2 / 178 | 0x0020 | 0x0000 |
| 9 | 0x00C7 / 199 | 0x00B2 / 178 | 0x0022 | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
