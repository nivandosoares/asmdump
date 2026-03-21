# Bank30 Chunk Registry Summary

- total entries: `8`
- runtime-confirmed entries: `4`
- unresolved entries: `2`
- closed non-runtime entries: `2`

## Runtime Confirmed

| SNES | Marker | Hits | First frame | Last frame |
|---|---|---:|---:|---:|
| `1E:DF6C` | `26FB` | `2` | `1280` | `2698` |
| `1E:E039` | `26FB` | `2` | `1282` | `2700` |
| `1E:E73F` | `26FB` | `2` | `1292` | `2709` |
| `1E:E800` | `26FB` | `2` | `1294` | `2712` |

## Unresolved Queue

| Priority | SNES | Marker | Decode status | Table confirmed | Notes |
|---|---|---|---|---|---|
| `P0` | `1E:EE7F` | `26FB` | `ok` | `True` | bank1-pointer-table-confirmed, nested-in-successful-window@1E:DA96 |
| `P1` | `1E:DA96` | `67FB` | `ok` | `False` | overlaps-larger-window |

## Closed Non-Runtime Entries

| Status | SNES | Marker | Notes |
|---|---|---|---|
| `sentinel-control` | `1E:9681` | `42FB` | zero-output-control-record |
| `nested-invalid-marker` | `1E:E91F` | `67FB` | nested-in-successful-window@1E:DA96/1E:E800, 67FB stream ended early while reading byte |
