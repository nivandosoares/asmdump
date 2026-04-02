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

## Dynamic Index Path for `L00A9A0`

At `01:B1F9` the code can feed a dynamic index into `L00A9A0`:

- default index: `0x0002`
- if `$1C80 < $1CA8`, override index to `($1C78 + 0x001F)`

Implication for the unresolved `1E:EE7F` table entry:

- `1E:EE7F` is index `32` (`0x0020`) in `01:A789/01:A7D3`.
- that requires the dynamic branch (`$1C80 < $1CA8`) and `$1C78 = 1`.

Runtime reading from the no-input attract probe (`3200` frames):

- bank30 hit frames (`DF6C/E039/E73F/E800`) all report:
  - `$1C78 = 1`
  - `$1C80 = 0`
  - `$1CA8 = 0`
- so `$1C80 < $1CA8` is false on those hits, meaning this dynamic path does not
  produce index `0x0020` in that window.

## Caller-Index Telemetry (Matrix v6)

Probe payload now records caller-side CPU registers and derived `L00A9*` table
index/source for `01:A9BD` (`L00A9A0`) and `01:A9E1` (`L00A9CB`).

Evidence:

- `tools/out/l001210_probe_matrix_v6/matrix_summary.json`
- per-scenario traces under `tools/out/l001210_probe_matrix_v6/*_l001210_exec.json`

Observed `L00A9*` indices across the v6 scenarios (`poweron_no_input_4000`,
`pulse_start_240`, `pulse_start_1200`):

- `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- bank30-producing indices were only `28` and `29`
- index `32` (`0x20`, `EE7F`) was not observed

Consistency check:

- derived source pointer from table index matched live `$0C/$0E` source on all
  traced `L00A9*` hits (`58/58` matches).

Forced-branch follow-up (matrix v7):

- forced `$1C78/$1C80/$1CA8 = 1/0/2` across targeted windows, including
  re-application at `01:B1F9` exec.
- bank30 hits carried the forced selector values as expected.
- observed `L00A9*` indices still remained:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- index `32` (`EE7F`) still did not occur.
