# Front-End Pointer Table Decode

- Table base: `1A:97D8`
- File offset: `0x0D17D8`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Blob Tiles | Layout | Flags | Preview |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| 0 | unclassified current lane | 1A:9820 | 36 | 132 | split_row_padded | bit_15_set | frontend_row_00_preview.ppm |
| 1 | unclassified current lane | 1A:A9C8 | 8 | 8 | contiguous | none | frontend_row_01_preview.ppm |
| 2 | unclassified current lane | 1A:AB10 | 8 | 8 | contiguous | none | frontend_row_02_preview.ppm |
| 3 | unclassified current lane | 1A:AC58 | 8 | 8 | contiguous | none | frontend_row_03_preview.ppm |
| 4 | unclassified current lane | 1A:ADA0 | 8 | 8 | contiguous | none | frontend_row_04_preview.ppm |
| 5 | unclassified current lane | 1A:AEE8 | 9 | 9 | contiguous | none | frontend_row_05_preview.ppm |
| 6 | unclassified current lane | 1A:B058 | 9 | 9 | contiguous | none | frontend_row_06_preview.ppm |
| 7 | unclassified current lane | 1A:B1C8 | 9 | 9 | contiguous | none | frontend_row_07_preview.ppm |
| 8 | front-end rolling-tire helper ($0202 + 0x0008) | 1A:B338 | 9 | 9 | contiguous | none | frontend_row_08_preview.ppm |
| 9 | front-end rolling-tire helper ($0202 + 0x0008) | 1A:B4A8 | 9 | 9 | contiguous | none | frontend_row_09_preview.ppm |
| 10 | front-end rolling-tire helper ($0202 + 0x0008) | 1A:B618 | 9 | 9 | contiguous | none | frontend_row_10_preview.ppm |
| 11 | track-facing adjacent helper ($1C7C + 0x000B) | 1A:B788 | 9 | 9 | contiguous | none | frontend_row_11_preview.ppm |
| 12 | track-facing adjacent helper ($1C7C + 0x000B) | 1A:B8F8 | 9 | 9 | contiguous | none | frontend_row_12_preview.ppm |

## Entry Notes

### Row `0`

- Target: `1A:9820`
- Header: `0x8024 0x0084 0x52A9 0x00C8`
- Descriptor blob: `132` tiles / `4224` bytes at `0x0D1948`
- Layout: `split_row_padded`
- Split staging: `130` tiles first, `2` overflow tiles at tile `0x90`
- Preview: `frontend_row_00_preview.ppm`
- Tile sheet: `frontend_row_00_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFA9 / -87 | 0xFFF1 / -15 | 0x0000 | 0x0000 |
| 1 | 0xFFB9 / -71 | 0xFFF1 / -15 | 0x0002 | 0x0000 |
| 2 | 0xFFC9 / -55 | 0xFFF1 / -15 | 0x0004 | 0x0000 |
| 3 | 0xFFD9 / -39 | 0xFFF1 / -15 | 0x0006 | 0x0000 |
| 4 | 0xFFE9 / -23 | 0xFFF1 / -15 | 0x0008 | 0x0000 |
| 5 | 0xFFF9 / -7 | 0xFFF1 / -15 | 0x0008 | 0x0000 |
| 6 | 0x0009 / 9 | 0xFFF1 / -15 | 0x000A | 0x0000 |
| 7 | 0x0019 / 25 | 0xFFF1 / -15 | 0x000C | 0x0000 |
| 8 | 0x0029 / 41 | 0xFFF1 / -15 | 0x0004 | 0x0000 |
| 9 | 0x0039 / 57 | 0xFFF1 / -15 | 0x000E | 0x0000 |
| 10 | 0x0049 / 73 | 0xFFF1 / -15 | 0x0020 | 0x0000 |
| 11 | 0xFFA9 / -87 | 0xFFE1 / -31 | 0x0022 | 0x0000 |
| 12 | 0xFFB9 / -71 | 0xFFE1 / -31 | 0x0024 | 0x0000 |
| 13 | 0xFFC9 / -55 | 0xFFE1 / -31 | 0x0026 | 0x0000 |
| 14 | 0xFFD9 / -39 | 0xFFE1 / -31 | 0x0028 | 0x0000 |
| 15 | 0xFFE9 / -23 | 0xFFE1 / -31 | 0x002A | 0x0000 |
| 16 | 0xFFF9 / -7 | 0xFFE1 / -31 | 0x002A | 0x0000 |
| 17 | 0x0009 / 9 | 0xFFE1 / -31 | 0x002C | 0x0000 |
| 18 | 0x0019 / 25 | 0xFFE1 / -31 | 0x002E | 0x0000 |
| 19 | 0x0029 / 41 | 0xFFE1 / -31 | 0x0040 | 0x0000 |
| 20 | 0x0039 / 57 | 0xFFE1 / -31 | 0x0042 | 0x0000 |
| 21 | 0x0049 / 73 | 0xFFE1 / -31 | 0x0044 | 0x0000 |
| 22 | 0xFFB6 / -74 | 0xFFD1 / -47 | 0x0046 | 0x0000 |
| 23 | 0xFFC6 / -58 | 0xFFD1 / -47 | 0x0048 | 0x0000 |
| 24 | 0xFFD6 / -42 | 0xFFD1 / -47 | 0x004A | 0x0000 |
| 25 | 0xFFE6 / -26 | 0xFFD1 / -47 | 0x004C | 0x0000 |
| 26 | 0xFFF6 / -10 | 0xFFD1 / -47 | 0x004E | 0x0000 |
| 27 | 0x0006 / 6 | 0xFFD1 / -47 | 0x0060 | 0x0000 |
| 28 | 0x0016 / 22 | 0xFFD1 / -47 | 0x0062 | 0x0000 |
| 29 | 0x0026 / 38 | 0xFFD1 / -47 | 0x0064 | 0x0000 |
| 30 | 0x0036 / 54 | 0xFFD1 / -47 | 0x0066 | 0x0000 |
| 31 | 0x0046 / 70 | 0xFFD1 / -47 | 0x0068 | 0x0000 |
| 32 | 0xFFEB / -21 | 0xFFC1 / -63 | 0x006A | 0x0000 |
| 33 | 0xFFFB / -5 | 0xFFC1 / -63 | 0x006C | 0x0000 |
| 34 | 0x000B / 11 | 0xFFC1 / -63 | 0x006E | 0x0000 |
| 35 | 0x001B / 27 | 0xFFC1 / -63 | 0x0080 | 0x0000 |

### Row `1`

- Target: `1A:A9C8`
- Header: `0x0008 0x0008 0x0AF7 0xFDE9`
- Descriptor blob: `8` tiles / `256` bytes at `0x0D2A10`
- Layout: `contiguous`
- Preview: `frontend_row_01_preview.ppm`
- Tile sheet: `frontend_row_01_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFF6 / -10 | 0x0000 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFF6 / -10 | 0x0001 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFF6 / -10 | 0x0002 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEE / -18 | 0x0003 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEE / -18 | 0x0004 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEE / -18 | 0x0005 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFE6 / -26 | 0x0006 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFE6 / -26 | 0x0007 | 0x0000 |

### Row `2`

- Target: `1A:AB10`
- Header: `0x0008 0x0008 0x0AF7 0xFDE9`
- Descriptor blob: `8` tiles / `256` bytes at `0x0D2B58`
- Layout: `contiguous`
- Preview: `frontend_row_02_preview.ppm`
- Tile sheet: `frontend_row_02_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFF6 / -10 | 0x0000 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFF6 / -10 | 0x0001 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFF6 / -10 | 0x0002 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEE / -18 | 0x0003 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEE / -18 | 0x0004 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEE / -18 | 0x0005 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFE6 / -26 | 0x0006 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFE6 / -26 | 0x0007 | 0x0000 |

### Row `3`

- Target: `1A:AC58`
- Header: `0x0008 0x0008 0x0AF7 0xFDE9`
- Descriptor blob: `8` tiles / `256` bytes at `0x0D2CA0`
- Layout: `contiguous`
- Preview: `frontend_row_03_preview.ppm`
- Tile sheet: `frontend_row_03_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFF6 / -10 | 0x0000 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFF6 / -10 | 0x0001 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFF6 / -10 | 0x0002 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEE / -18 | 0x0003 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEE / -18 | 0x0004 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEE / -18 | 0x0005 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFE6 / -26 | 0x0006 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFE6 / -26 | 0x0007 | 0x0000 |

### Row `4`

- Target: `1A:ADA0`
- Header: `0x0008 0x0008 0x0AF7 0xFDE9`
- Descriptor blob: `8` tiles / `256` bytes at `0x0D2DE8`
- Layout: `contiguous`
- Preview: `frontend_row_04_preview.ppm`
- Tile sheet: `frontend_row_04_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF7 / -9 | 0xFFF6 / -10 | 0x0000 | 0x0000 |
| 1 | 0xFFFF / -1 | 0xFFF6 / -10 | 0x0001 | 0x0000 |
| 2 | 0x0007 / 7 | 0xFFF6 / -10 | 0x0002 | 0x0000 |
| 3 | 0xFFF7 / -9 | 0xFFEE / -18 | 0x0003 | 0x0000 |
| 4 | 0xFFFF / -1 | 0xFFEE / -18 | 0x0004 | 0x0000 |
| 5 | 0x0007 / 7 | 0xFFEE / -18 | 0x0005 | 0x0000 |
| 6 | 0xFFF9 / -7 | 0xFFE6 / -26 | 0x0006 | 0x0000 |
| 7 | 0x0001 / 1 | 0xFFE6 / -26 | 0x0007 | 0x0000 |

### Row `5`

- Target: `1A:AEE8`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D2F38`
- Layout: `contiguous`
- Preview: `frontend_row_05_preview.ppm`
- Tile sheet: `frontend_row_05_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `6`

- Target: `1A:B058`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D30A8`
- Layout: `contiguous`
- Preview: `frontend_row_06_preview.ppm`
- Tile sheet: `frontend_row_06_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `7`

- Target: `1A:B1C8`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D3218`
- Layout: `contiguous`
- Preview: `frontend_row_07_preview.ppm`
- Tile sheet: `frontend_row_07_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `8`

- Target: `1A:B338`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D3388`
- Layout: `contiguous`
- Preview: `frontend_row_08_preview.ppm`
- Tile sheet: `frontend_row_08_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `9`

- Target: `1A:B4A8`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D34F8`
- Layout: `contiguous`
- Preview: `frontend_row_09_preview.ppm`
- Tile sheet: `frontend_row_09_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `10`

- Target: `1A:B618`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D3668`
- Layout: `contiguous`
- Preview: `frontend_row_10_preview.ppm`
- Tile sheet: `frontend_row_10_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `11`

- Target: `1A:B788`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D37D8`
- Layout: `contiguous`
- Preview: `frontend_row_11_preview.ppm`
- Tile sheet: `frontend_row_11_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

### Row `12`

- Target: `1A:B8F8`
- Header: `0x0009 0x0009 0x15F3 0xDACE`
- Descriptor blob: `9` tiles / `288` bytes at `0x0D3948`
- Layout: `contiguous`
- Preview: `frontend_row_12_preview.ppm`
- Tile sheet: `frontend_row_12_tiles.ppm`
- Object records:
| Slot | X (raw/signed) | Y (raw/signed) | Tile Word | Aux |
| ---: | --- | --- | --- | --- |
| 0 | 0xFFF3 / -13 | 0xFFD3 / -45 | 0x0200 | 0x0000 |
| 1 | 0xFFFB / -5 | 0xFFD3 / -45 | 0x0201 | 0x0000 |
| 2 | 0x0003 / 3 | 0xFFD3 / -45 | 0x0202 | 0x0000 |
| 3 | 0x000B / 11 | 0xFFD3 / -45 | 0x0203 | 0x0000 |
| 4 | 0x0013 / 19 | 0xFFD3 / -45 | 0x0204 | 0x0000 |
| 5 | 0xFFF6 / -10 | 0xFFCB / -53 | 0x0205 | 0x0000 |
| 6 | 0xFFFE / -2 | 0xFFCB / -53 | 0x0206 | 0x0000 |
| 7 | 0x0006 / 6 | 0xFFCB / -53 | 0x0207 | 0x0000 |
| 8 | 0x000E / 14 | 0xFFCB / -53 | 0x0208 | 0x0000 |

## Notes

- Indices `8..10` are the current front-end rolling-tire helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- Indices `0x15..0x1B` are now decoded as front-end control/sound labels.
- The descriptor payload format is now closed enough to split each row into an object list plus a descriptor-local 4bpp OBJ blob.
- Negative-layout rows (`bit_15_set`) use a split staged-tile layout that pads overflow glyph bottoms onto the next 16-tile row.
