# Front-End Pointer Table Decode

- Table base: `1E:8000`
- File offset: `0x0F0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 21 | front-end control/sound labels | 1E:C3CC | 4 | 4 | contiguous | none | frontend_row_21_preview.ppm |
| 22 | front-end control/sound labels | 1E:C474 | 6 | 6 | contiguous | none | frontend_row_22_preview.ppm |
| 23 | front-end control/sound labels | 1E:C56C | 3 | 3 | contiguous | none | frontend_row_23_preview.ppm |
| 24 | front-end control/sound labels | 1E:C5EC | 5 | 5 | contiguous | none | frontend_row_24_preview.ppm |
| 25 | front-end control/sound labels | 1E:C6BC | 7 | 7 | contiguous | none | frontend_row_25_preview.ppm |
| 26 | front-end control/sound labels | 1E:C7DC | 9 | 36 | split_row_padded | bit_15_set | frontend_row_26_preview.ppm |
| 27 | front-end control/sound labels | 1E:CCAC | 3 | 12 | split_row_padded | bit_15_set | frontend_row_27_preview.ppm |

## Entry Notes

### Row `21`

- Target: `1E:C3CC`
- Header: `0x0004 0x0004 0x1D00 0x03FD`
- Descriptor blob: `4` tiles / `128` bytes at `0x0F43F4`
- Layout: `contiguous`
- Preview: `frontend_row_21_preview.ppm`
- Tile sheet: `frontend_row_21_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0000 / 0 | 0xFFFD / -3 | 0x0400 | 0x0000 |
| 1 | 0x0008 / 8 | 0xFFFD / -3 | 0x0401 | 0x0000 |
| 2 | 0x0010 / 16 | 0xFFFD / -3 | 0x0402 | 0x0000 |
| 3 | 0x0019 / 25 | 0xFFFD / -3 | 0x0403 | 0x0000 |

### Row `22`

- Target: `1E:C474`
- Header: `0x0006 0x0006 0x2B00 0x03FD`
- Descriptor blob: `6` tiles / `192` bytes at `0x0F44AC`
- Layout: `contiguous`
- Preview: `frontend_row_22_preview.ppm`
- Tile sheet: `frontend_row_22_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0000 / 0 | 0xFFFD / -3 | 0x0400 | 0x0000 |
| 1 | 0x0008 / 8 | 0xFFFD / -3 | 0x0401 | 0x0000 |
| 2 | 0x0010 / 16 | 0xFFFD / -3 | 0x0402 | 0x0000 |
| 3 | 0x0019 / 25 | 0xFFFD / -3 | 0x0403 | 0x0000 |
| 4 | 0x0021 / 33 | 0xFFFD / -3 | 0x0404 | 0x0000 |
| 5 | 0x0029 / 41 | 0xFFFD / -3 | 0x0405 | 0x0000 |

### Row `23`

- Target: `1E:C56C`
- Header: `0x0003 0x0003 0x1701 0x03FD`
- Descriptor blob: `3` tiles / `96` bytes at `0x0F458C`
- Layout: `contiguous`
- Preview: `frontend_row_23_preview.ppm`
- Tile sheet: `frontend_row_23_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0000 / 0 | 0xFFFD / -3 | 0x0400 | 0x0000 |
| 1 | 0x0008 / 8 | 0xFFFD / -3 | 0x0401 | 0x0000 |
| 2 | 0x0010 / 16 | 0xFFFD / -3 | 0x0402 | 0x0000 |

### Row `24`

- Target: `1E:C5EC`
- Header: `0x0005 0x0005 0x2501 0x05FD`
- Descriptor blob: `5` tiles / `160` bytes at `0x0F461C`
- Layout: `contiguous`
- Preview: `frontend_row_24_preview.ppm`
- Tile sheet: `frontend_row_24_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x001E / 30 | 0xFFFD / -3 | 0x0400 | 0x0000 |
| 1 | 0x0016 / 22 | 0xFFFD / -3 | 0x0401 | 0x0000 |
| 2 | 0x000E / 14 | 0xFFFD / -3 | 0x0402 | 0x0000 |
| 3 | 0x0006 / 6 | 0xFFFF / -1 | 0x0403 | 0x0000 |
| 4 | 0xFFFE / -2 | 0xFFFD / -3 | 0x0404 | 0x0000 |

### Row `25`

- Target: `1E:C6BC`
- Header: `0x0007 0x0007 0x3400 0x03FD`
- Descriptor blob: `7` tiles / `224` bytes at `0x0F46FC`
- Layout: `contiguous`
- Preview: `frontend_row_25_preview.ppm`
- Tile sheet: `frontend_row_25_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0000 / 0 | 0xFFFD / -3 | 0x0400 | 0x0000 |
| 1 | 0x0008 / 8 | 0xFFFD / -3 | 0x0401 | 0x0000 |
| 2 | 0x0010 / 16 | 0xFFFD / -3 | 0x0402 | 0x0000 |
| 3 | 0x0018 / 24 | 0xFFFD / -3 | 0x0403 | 0x0000 |
| 4 | 0x0020 / 32 | 0xFFFD / -3 | 0x0404 | 0x0000 |
| 5 | 0x0028 / 40 | 0xFFFD / -3 | 0x0405 | 0x0000 |
| 6 | 0x0030 / 48 | 0xFFFD / -3 | 0x0406 | 0x0000 |

### Row `26`

- Target: `1E:C7DC`
- Header: `0x8009 0x0024 0xA52D 0x9F81`
- Descriptor blob: `36` tiles / `1152` bytes at `0x0F482C`
- Layout: `split_row_padded`
- Split staging: `34` tiles first, `2` overflow tiles at tile `0x30`
- Preview: `frontend_row_26_preview.ppm`
- Tile sheet: `frontend_row_26_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x002B / 43 | 0x0081 / 129 | 0x0400 | 0x0000 |
| 1 | 0x003B / 59 | 0x0081 / 129 | 0x0402 | 0x0000 |
| 2 | 0x004B / 75 | 0x0081 / 129 | 0x0404 | 0x0000 |
| 3 | 0x005B / 91 | 0x0081 / 129 | 0x0406 | 0x0000 |
| 4 | 0x0083 / 131 | 0x0081 / 129 | 0x0408 | 0x0000 |
| 5 | 0x0093 / 147 | 0x0081 / 129 | 0x040A | 0x0000 |
| 6 | 0x00A3 / 163 | 0x0081 / 129 | 0x040C | 0x0000 |
| 7 | 0x0078 / 120 | 0x0091 / 145 | 0x040E | 0x0000 |
| 8 | 0x0088 / 136 | 0x0091 / 145 | 0x0420 | 0x0000 |

### Row `27`

- Target: `1E:CCAC`
- Header: `0x8003 0x000C 0x2903 0x03FB`
- Descriptor blob: `12` tiles / `384` bytes at `0x0F4CCC`
- Layout: `split_row_padded`
- Split staging: `6` tiles first, `6` overflow tiles at tile `0x10`
- Preview: `frontend_row_27_preview.ppm`
- Tile sheet: `frontend_row_27_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0x0001 / 1 | 0xFFFB / -5 | 0x0000 | 0x0000 |
| 1 | 0x0011 / 17 | 0xFFFB / -5 | 0x0002 | 0x0000 |
| 2 | 0x0021 / 33 | 0xFFFB / -5 | 0x0004 | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
