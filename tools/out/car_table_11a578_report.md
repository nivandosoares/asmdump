# Front-End Pointer Table Decode

- Table base: `11:A578`
- File offset: `0x08A578`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 0 | unclassified current lane | 11:A590 | 37 | 136 | split_row_padded | bit_15_set | frontend_row_00_preview.ppm |
| 1 | unclassified current lane | 11:B7C0 | 9 | 9 | contiguous | none | frontend_row_01_preview.ppm |
| 2 | unclassified current lane | 11:B930 | 9 | 9 | contiguous | none | frontend_row_02_preview.ppm |
| 3 | unclassified current lane | 11:BAA0 | 9 | 9 | contiguous | none | frontend_row_03_preview.ppm |
| 4 | unclassified current lane | 11:BC10 | 9 | 9 | contiguous | none | frontend_row_04_preview.ppm |
| 5 | unclassified current lane | 11:BD80 | 12 | 12 | contiguous | none | frontend_row_05_preview.ppm |

## Entry Notes

### Row `0`

- Target: `11:A590`
- Header: `0x8025 0x0088 0x57A8 0xFFCD`
- Descriptor blob: `136` tiles / `4352` bytes at `0x08A6C0`
- Layout: `split_row_padded`
- Split staging: `132` tiles first, `4` overflow tiles at tile `0x90`
- Preview: `frontend_row_00_preview.ppm`
- Tile sheet: `frontend_row_00_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFA8 / -88 | 0xFFE3 / -29 | 0x0000 | 0x0000 |
| 1 | 0xFFA8 / -88 | 0xFFF3 / -13 | 0x0002 | 0x0000 |
| 2 | 0xFFB8 / -72 | 0xFFDD / -35 | 0x0004 | 0x0000 |
| 3 | 0xFFB8 / -72 | 0xFFED / -19 | 0x0006 | 0x0000 |
| 4 | 0xFFB8 / -72 | 0xFFFD / -3 | 0x0008 | 0x0000 |
| 5 | 0xFFC8 / -56 | 0xFFD6 / -42 | 0x000A | 0x0000 |
| 6 | 0xFFC8 / -56 | 0xFFE6 / -26 | 0x000C | 0x0000 |
| 7 | 0xFFC8 / -56 | 0xFFF6 / -10 | 0x000E | 0x0000 |
| 8 | 0xFFD8 / -40 | 0xFFD0 / -48 | 0x0020 | 0x0000 |
| 9 | 0xFFD8 / -40 | 0xFFE0 / -32 | 0x0022 | 0x0000 |
| 10 | 0xFFD8 / -40 | 0xFFF0 / -16 | 0x0024 | 0x0000 |
| 11 | 0xFFE8 / -24 | 0xFFCD / -51 | 0x0026 | 0x0000 |
| 12 | 0xFFE8 / -24 | 0xFFDD / -35 | 0x0028 | 0x0000 |
| 13 | 0xFFE8 / -24 | 0xFFED / -19 | 0x002A | 0x0000 |
| 14 | 0xFFE8 / -24 | 0xFFFD / -3 | 0x0008 | 0x0000 |
| 15 | 0xFFF8 / -8 | 0xFFCD / -51 | 0x002C | 0x0000 |
| 16 | 0xFFF8 / -8 | 0xFFDD / -35 | 0x002E | 0x0000 |
| 17 | 0xFFF8 / -8 | 0xFFED / -19 | 0x0040 | 0x0000 |
| 18 | 0xFFF8 / -8 | 0xFFFD / -3 | 0x0008 | 0x0000 |
| 19 | 0x0008 / 8 | 0xFFCD / -51 | 0x0042 | 0x0000 |
| 20 | 0x0008 / 8 | 0xFFDD / -35 | 0x0044 | 0x0000 |
| 21 | 0x0008 / 8 | 0xFFED / -19 | 0x0046 | 0x0000 |
| 22 | 0x0008 / 8 | 0xFFFD / -3 | 0x0008 | 0x0000 |
| 23 | 0x0018 / 24 | 0xFFCE / -50 | 0x0048 | 0x0000 |
| 24 | 0x0018 / 24 | 0xFFDE / -34 | 0x004A | 0x0000 |
| 25 | 0x0018 / 24 | 0xFFEE / -18 | 0x004C | 0x0000 |
| 26 | 0x0018 / 24 | 0xFFFE / -2 | 0x004E | 0x0000 |
| 27 | 0x0028 / 40 | 0xFFCF / -49 | 0x0060 | 0x0000 |
| 28 | 0x0028 / 40 | 0xFFDF / -33 | 0x0062 | 0x0000 |
| 29 | 0x0028 / 40 | 0xFFEF / -17 | 0x0064 | 0x0000 |
| 30 | 0x0028 / 40 | 0xFFFF / -1 | 0x0066 | 0x0000 |
| 31 | 0x0038 / 56 | 0xFFD1 / -47 | 0x0068 | 0x0000 |
| 32 | 0x0038 / 56 | 0xFFE1 / -31 | 0x006A | 0x0000 |
| 33 | 0x0038 / 56 | 0xFFF1 / -15 | 0x006C | 0x0000 |
| 34 | 0x0048 / 72 | 0xFFD2 / -46 | 0x006E | 0x0000 |
| 35 | 0x0048 / 72 | 0xFFE2 / -30 | 0x0080 | 0x0000 |
| 36 | 0x0048 / 72 | 0xFFFA / -6 | 0x0082 | 0x0000 |

### Row `1`

- Target: `11:B7C0`
- Header: `0x0009 0x0009 0x09F5 0xF9E5`
- Descriptor blob: `9` tiles / `288` bytes at `0x08B810`
- Layout: `contiguous`
- Preview: `frontend_row_01_preview.ppm`
- Tile sheet: `frontend_row_01_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF5 / -11 | 0xFFE5 / -27 | 0x0200 | 0x0000 |
| 1 | 0xFFFD / -3 | 0xFFE5 / -27 | 0x0201 | 0x0000 |
| 2 | 0x0005 / 5 | 0xFFE5 / -27 | 0x0202 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0203 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0204 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x0205 | 0x0000 |
| 6 | 0xFFF7 / -9 | 0xFFF5 / -11 | 0x0206 | 0x0000 |
| 7 | 0xFFFF / -1 | 0xFFF5 / -11 | 0x0207 | 0x0000 |
| 8 | 0x0007 / 7 | 0xFFF5 / -11 | 0x0208 | 0x0000 |

### Row `2`

- Target: `11:B930`
- Header: `0x0009 0x0009 0x09F5 0xF9E5`
- Descriptor blob: `9` tiles / `288` bytes at `0x08B980`
- Layout: `contiguous`
- Preview: `frontend_row_02_preview.ppm`
- Tile sheet: `frontend_row_02_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF5 / -11 | 0xFFE5 / -27 | 0x0200 | 0x0000 |
| 1 | 0xFFFD / -3 | 0xFFE5 / -27 | 0x0201 | 0x0000 |
| 2 | 0x0005 / 5 | 0xFFE5 / -27 | 0x0202 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0203 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0204 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x0205 | 0x0000 |
| 6 | 0xFFF7 / -9 | 0xFFF5 / -11 | 0x0206 | 0x0000 |
| 7 | 0xFFFF / -1 | 0xFFF5 / -11 | 0x0207 | 0x0000 |
| 8 | 0x0007 / 7 | 0xFFF5 / -11 | 0x0208 | 0x0000 |

### Row `3`

- Target: `11:BAA0`
- Header: `0x0009 0x0009 0x09F5 0xF9E5`
- Descriptor blob: `9` tiles / `288` bytes at `0x08BAF0`
- Layout: `contiguous`
- Preview: `frontend_row_03_preview.ppm`
- Tile sheet: `frontend_row_03_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF5 / -11 | 0xFFE5 / -27 | 0x0200 | 0x0000 |
| 1 | 0xFFFD / -3 | 0xFFE5 / -27 | 0x0201 | 0x0000 |
| 2 | 0x0005 / 5 | 0xFFE5 / -27 | 0x0202 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0203 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0204 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x0205 | 0x0000 |
| 6 | 0xFFF7 / -9 | 0xFFF5 / -11 | 0x0206 | 0x0000 |
| 7 | 0xFFFF / -1 | 0xFFF5 / -11 | 0x0207 | 0x0000 |
| 8 | 0x0007 / 7 | 0xFFF5 / -11 | 0x0208 | 0x0000 |

### Row `4`

- Target: `11:BC10`
- Header: `0x0009 0x0009 0x09F5 0xF9E5`
- Descriptor blob: `9` tiles / `288` bytes at `0x08BC60`
- Layout: `contiguous`
- Preview: `frontend_row_04_preview.ppm`
- Tile sheet: `frontend_row_04_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF5 / -11 | 0xFFE5 / -27 | 0x0200 | 0x0000 |
| 1 | 0xFFFD / -3 | 0xFFE5 / -27 | 0x0201 | 0x0000 |
| 2 | 0x0005 / 5 | 0xFFE5 / -27 | 0x0202 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0203 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0204 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x0205 | 0x0000 |
| 6 | 0xFFF7 / -9 | 0xFFF5 / -11 | 0x0206 | 0x0000 |
| 7 | 0xFFFF / -1 | 0xFFF5 / -11 | 0x0207 | 0x0000 |
| 8 | 0x0007 / 7 | 0xFFF5 / -11 | 0x0208 | 0x0000 |

### Row `5`

- Target: `11:BD80`
- Header: `0x000C 0x000C 0x0CD6 0xDDD0`
- Descriptor blob: `12` tiles / `384` bytes at `0x08BDE8`
- Layout: `contiguous`
- Preview: `frontend_row_05_preview.ppm`
- Tile sheet: `frontend_row_05_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFD6 / -42 | 0xFFD6 / -42 | 0x0400 | 0x0000 |
| 1 | 0xFFDE / -34 | 0xFFD6 / -42 | 0x0401 | 0x0000 |
| 2 | 0xFFE6 / -26 | 0xFFD6 / -42 | 0x0402 | 0x0000 |
| 3 | 0xFFEE / -18 | 0xFFD6 / -42 | 0x0403 | 0x0000 |
| 4 | 0xFFF6 / -10 | 0xFFD6 / -42 | 0x0404 | 0x0000 |
| 5 | 0xFFFE / -2 | 0xFFD6 / -42 | 0x0405 | 0x0000 |
| 6 | 0x0006 / 6 | 0xFFD6 / -42 | 0x0406 | 0x0000 |
| 7 | 0xFFE7 / -25 | 0xFFCE / -50 | 0x0407 | 0x0000 |
| 8 | 0xFFEF / -17 | 0xFFCE / -50 | 0x0408 | 0x0000 |
| 9 | 0xFFF7 / -9 | 0xFFCE / -50 | 0x0409 | 0x0000 |
| 10 | 0xFFFF / -1 | 0xFFCE / -50 | 0x040A | 0x0000 |
| 11 | 0x0007 / 7 | 0xFFCE / -50 | 0x040B | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
