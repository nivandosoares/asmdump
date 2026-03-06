# Bank 1 `L001210` Pointer Tables

This note captures the current static provenance map for data passed into the
common decompression dispatcher `L001210`.

## Relevant Callers

- `L00A9A0` uses:
  - pointer table at `01:A789`
  - bank table at `01:A7D3`
- `L00A9CB` uses:
  - pointer table at `01:A842`
  - bank table at `01:A888`

Both helpers eventually call `jsl L001210`.

## Bank-30 Entries Confirmed in Tables

From `01:A789/01:A7D3`:

| Index | Pointer | Bank | CPU Address |
|---|---:|---:|---|
| `28` | `0xDF6C` | `0x1E` | `1E:DF6C` |
| `29` | `0xE73F` | `0x1E` | `1E:E73F` |
| `32` | `0xEE7F` | `0x1E` | `1E:EE7F` |

From `01:A842/01:A888`:

| Index | Pointer | Bank | CPU Address |
|---|---:|---:|---|
| `28` | `0xE039` | `0x1E` | `1E:E039` |
| `29` | `0xE800` | `0x1E` | `1E:E800` |

## Current Reading

- These five bank-30 `26FB` starts are table-confirmed runtime candidates.
- `1E:DA96` (`67FB`) and `1E:E91F` (`67FB`) are not yet confirmed by this
  table set and should be traced via additional callers/runtime probes.
