# Front-End Pointer Table Decode

- Table base: `1E:8000`
- File offset: `0x0F0000`

## Claim

- The bank-1 front-end helpers do not materialize a WRAM table at $1E80. The overlapping stores to $10/$11/$12 construct the long ROM pointer 1E:8000, and L00179B/L001662 then dereference rows from that table directly.

## Decoded Entries

| Index | Surface | Target | Count | Flags | Header |
| --- | --- | --- | ---: | --- | --- |
| 8 | car-facing adjacent helper ($0202 + 0x0008) | 1E:9ACC | 8 | none | 0x0008 0x0008 0x09F7 0xFBE7 |
| 9 | car-facing adjacent helper ($0202 + 0x0008) | 1E:9C14 | 8 | none | 0x0008 0x0008 0x09F7 0xFBE7 |
| 10 | car-facing adjacent helper ($0202 + 0x0008) | 1E:9D5C | 8 | none | 0x0008 0x0008 0x09F7 0xFBE7 |
| 11 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:9EA4 | 9 | bit_15_set | 0x8009 0x0024 0xC73F 0x3728 |
| 12 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A374 | 10 | bit_15_set | 0x800A 0x0028 0xCB2F 0x6556 |
| 13 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:A8CC | 8 | bit_15_set | 0x8008 0x0020 0xC347 0x9084 |
| 14 | track-facing adjacent helper ($1C7C + 0x000B) | 1E:AD14 | 10 | bit_15_set | 0x800A 0x0028 0xD437 0xBEB2 |

## Notes

- Indices `8..10` are the current car-facing adjacent helper rows.
- Indices `11..14` are the current track-facing adjacent helper rows.
- The remaining gap is decoding the descriptor payloads into human-readable labels, not finding a WRAM materializer for `$1E80`.
