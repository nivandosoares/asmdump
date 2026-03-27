# Front-End Pointer Table Decode

- Table base: `1A:8000`
- File offset: `0x0D0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 0 | unclassified current lane | 1A:8018 | 42 | 132 | split_row_padded | bit_15_set | frontend_row_00_preview.ppm |
| 1 | unclassified current lane | 1A:91F0 | 9 | 6 | contiguous | none | frontend_row_01_preview.ppm |
| 2 | unclassified current lane | 1A:9300 | 9 | 9 | contiguous | none | frontend_row_02_preview.ppm |
| 3 | unclassified current lane | 1A:9470 | 9 | 6 | contiguous | none | frontend_row_03_preview.ppm |
| 4 | unclassified current lane | 1A:9580 | 9 | 6 | contiguous | none | frontend_row_04_preview.ppm |
| 5 | unclassified current lane | 1A:9690 | 8 | 8 | contiguous | none | frontend_row_05_preview.ppm |

## Entry Notes

### Row `0`

- Target: `1A:8018`
- Header: `0x802A 0x0084 0x55A6 0xFFCD`
- Descriptor blob: `132` tiles / `4224` bytes at `0x0D0170`
- Layout: `split_row_padded`
- Split staging: `130` tiles first, `2` overflow tiles at tile `0x90`
- Preview: `frontend_row_00_preview.ppm`
- Tile sheet: `frontend_row_00_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFCD / -51 | 0xFFCD / -51 | 0x0000 | 0x0000 |
| 1 | 0xFFDD / -35 | 0xFFCD / -51 | 0x0002 | 0x0000 |
| 2 | 0xFFED / -19 | 0xFFCD / -51 | 0x0004 | 0x0000 |
| 3 | 0xFFFD / -3 | 0xFFCD / -51 | 0x0006 | 0x0000 |
| 4 | 0x000D / 13 | 0xFFCD / -51 | 0x0008 | 0x0000 |
| 5 | 0x001D / 29 | 0xFFCD / -51 | 0x000A | 0x0000 |
| 6 | 0x002D / 45 | 0xFFCD / -51 | 0x000C | 0x0000 |
| 7 | 0x003D / 61 | 0xFFCD / -51 | 0x000E | 0x0000 |
| 8 | 0x004D / 77 | 0xFFCD / -51 | 0x0020 | 0x0000 |
| 9 | 0xFFA6 / -90 | 0xFFDD / -35 | 0x0022 | 0x0000 |
| 10 | 0xFFB6 / -74 | 0xFFDD / -35 | 0x0024 | 0x0000 |
| 11 | 0xFFC6 / -58 | 0xFFDD / -35 | 0x0026 | 0x0000 |
| 12 | 0xFFD6 / -42 | 0xFFDD / -35 | 0x0028 | 0x0000 |
| 13 | 0xFFE6 / -26 | 0xFFDD / -35 | 0x002A | 0x0000 |
| 14 | 0xFFF6 / -10 | 0xFFDD / -35 | 0x002C | 0x0000 |
| 15 | 0x0006 / 6 | 0xFFDD / -35 | 0x002E | 0x0000 |
| 16 | 0x0016 / 22 | 0xFFDD / -35 | 0x0040 | 0x0000 |
| 17 | 0x0026 / 38 | 0xFFDD / -35 | 0x0042 | 0x0000 |
| 18 | 0x0036 / 54 | 0xFFDD / -35 | 0x0044 | 0x0000 |
| 19 | 0x0046 / 70 | 0xFFDD / -35 | 0x0046 | 0x0000 |
| 20 | 0xFFA6 / -90 | 0xFFED / -19 | 0x0048 | 0x0000 |
| 21 | 0xFFB6 / -74 | 0xFFED / -19 | 0x004A | 0x0000 |
| 22 | 0xFFC6 / -58 | 0xFFED / -19 | 0x004C | 0x0000 |
| 23 | 0xFFD6 / -42 | 0xFFED / -19 | 0x004E | 0x0000 |
| 24 | 0xFFE6 / -26 | 0xFFED / -19 | 0x0060 | 0x0000 |
| 25 | 0xFFF6 / -10 | 0xFFED / -19 | 0x0060 | 0x0000 |
| 26 | 0x0006 / 6 | 0xFFED / -19 | 0x0062 | 0x0000 |
| 27 | 0x0016 / 22 | 0xFFED / -19 | 0x0064 | 0x0000 |
| 28 | 0x0026 / 38 | 0xFFED / -19 | 0x0066 | 0x0000 |
| 29 | 0x0036 / 54 | 0xFFED / -19 | 0x0068 | 0x0000 |
| 30 | 0x0046 / 70 | 0xFFED / -19 | 0x006A | 0x0000 |
| 31 | 0xFFA8 / -88 | 0xFFFD / -3 | 0x006C | 0x0000 |
| 32 | 0xFFB8 / -72 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 33 | 0xFFC8 / -56 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 34 | 0xFFD8 / -40 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 35 | 0xFFE8 / -24 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 36 | 0xFFF8 / -8 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 37 | 0x0008 / 8 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 38 | 0x0018 / 24 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 39 | 0x0028 / 40 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 40 | 0x0038 / 56 | 0xFFFD / -3 | 0x006E | 0x0000 |
| 41 | 0x0048 / 72 | 0xFFFD / -3 | 0x0080 | 0x0000 |

### Row `1`

- Target: `1A:91F0`
- Header: `0x0009 0x0006 0x0CF5 0xFCE5`
- Descriptor blob: `6` tiles / `192` bytes at `0x0D1240`
- Layout: `contiguous`
- Preview: `frontend_row_01_preview.ppm`
- Tile sheet: `frontend_row_01_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF6 / -10 | 0xFFE5 / -27 | 0x0000 | 0x0000 |
| 1 | 0xFFFE / -2 | 0xFFE5 / -27 | 0x0001 | 0x0000 |
| 2 | 0x0004 / 4 | 0xFFE5 / -27 | 0x4000 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0002 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0003 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x4002 | 0x0000 |
| 6 | 0xFFF6 / -10 | 0xFFF5 / -11 | 0x0004 | 0x0000 |
| 7 | 0xFFFE / -2 | 0xFFF5 / -11 | 0x0005 | 0x0000 |
| 8 | 0x0004 / 4 | 0xFFF5 / -11 | 0x4004 | 0x0000 |

### Row `2`

- Target: `1A:9300`
- Header: `0x0009 0x0009 0x0CF5 0xFCE5`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D1350`
- Layout: `contiguous`
- Preview: `frontend_row_02_preview.ppm`
- Tile sheet: `frontend_row_02_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF6 / -10 | 0xFFE5 / -27 | 0x0000 | 0x0000 |
| 1 | 0xFFFE / -2 | 0xFFE5 / -27 | 0x0001 | 0x0000 |
| 2 | 0x0006 / 6 | 0xFFE5 / -27 | 0x0002 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0003 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0004 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x0005 | 0x0000 |
| 6 | 0xFFF6 / -10 | 0xFFF5 / -11 | 0x0006 | 0x0000 |
| 7 | 0xFFFE / -2 | 0xFFF5 / -11 | 0x0007 | 0x0000 |
| 8 | 0x0006 / 6 | 0xFFF5 / -11 | 0x0008 | 0x0000 |

### Row `3`

- Target: `1A:9470`
- Header: `0x0009 0x0006 0x0CF5 0xFCE5`
- Descriptor blob: `6` tiles / `192` bytes at `0x0D14C0`
- Layout: `contiguous`
- Preview: `frontend_row_03_preview.ppm`
- Tile sheet: `frontend_row_03_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF6 / -10 | 0xFFE5 / -27 | 0x0000 | 0x0000 |
| 1 | 0xFFFE / -2 | 0xFFE5 / -27 | 0x0001 | 0x0000 |
| 2 | 0x0004 / 4 | 0xFFE5 / -27 | 0x4000 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0002 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0003 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x4002 | 0x0000 |
| 6 | 0xFFF6 / -10 | 0xFFF5 / -11 | 0x0004 | 0x0000 |
| 7 | 0xFFFE / -2 | 0xFFF5 / -11 | 0x0005 | 0x0000 |
| 8 | 0x0004 / 4 | 0xFFF5 / -11 | 0x4004 | 0x0000 |

### Row `4`

- Target: `1A:9580`
- Header: `0x0009 0x0006 0x0CF5 0xFCE5`
- Descriptor blob: `6` tiles / `192` bytes at `0x0D15D0`
- Layout: `contiguous`
- Preview: `frontend_row_04_preview.ppm`
- Tile sheet: `frontend_row_04_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF6 / -10 | 0xFFE5 / -27 | 0x0000 | 0x0000 |
| 1 | 0xFFFE / -2 | 0xFFE5 / -27 | 0x0001 | 0x0000 |
| 2 | 0x0004 / 4 | 0xFFE5 / -27 | 0x4000 | 0x0000 |
| 3 | 0xFFF5 / -11 | 0xFFED / -19 | 0x0002 | 0x0000 |
| 4 | 0xFFFD / -3 | 0xFFED / -19 | 0x0003 | 0x0000 |
| 5 | 0x0005 / 5 | 0xFFED / -19 | 0x4002 | 0x0000 |
| 6 | 0xFFF6 / -10 | 0xFFF5 / -11 | 0x0004 | 0x0000 |
| 7 | 0xFFFE / -2 | 0xFFF5 / -11 | 0x0005 | 0x0000 |
| 8 | 0x0004 / 4 | 0xFFF5 / -11 | 0x4004 | 0x0000 |

### Row `5`

- Target: `1A:9690`
- Header: `0x0008 0x0008 0x13F2 0xDCD0`
- Descriptor blob: `8` tiles / `256` bytes at `0x0D16D8`
- Layout: `contiguous`
- Preview: `frontend_row_05_preview.ppm`
- Tile sheet: `frontend_row_05_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF6 / -10 | 0xFFD0 / -48 | 0x0200 | 0x0000 |
| 1 | 0xFFFE / -2 | 0xFFD0 / -48 | 0x0201 | 0x0000 |
| 2 | 0x0006 / 6 | 0xFFD0 / -48 | 0x0202 | 0x0000 |
| 3 | 0x000E / 14 | 0xFFD0 / -48 | 0x0203 | 0x0000 |
| 4 | 0xFFF2 / -14 | 0xFFD8 / -40 | 0x0204 | 0x0000 |
| 5 | 0xFFFA / -6 | 0xFFD8 / -40 | 0x0205 | 0x0000 |
| 6 | 0x0002 / 2 | 0xFFD8 / -40 | 0x0206 | 0x0000 |
| 7 | 0x000A / 10 | 0xFFD8 / -40 | 0x0207 | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
