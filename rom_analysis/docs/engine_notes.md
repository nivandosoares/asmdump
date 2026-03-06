# Engine Notes (Gameplay Archaeology)

## Current Read

- Bank 0 is a callback scheduler wrapped by NMI cadence.
- Front-end intro work is advanced, but gameplay handoff is still unmapped.
- Bank 30 appears to be shared dispatch/service infrastructure.
- Bank 10 likely owns physics/AI core updates.
- Bank 11 likely owns road/rasterizer and depends on bank 10 state.

## Practical Objectives

1. Build a verified callback transition chain:
   `RESET -> front-end callbacks -> gameplay callbacks`.
2. Convert bank 30 from "entry-point list" to "typed API map".
3. Extract bank 10 state contracts into named structs.
4. Extract bank 11 table formats for road/sprite composition.
5. Tie map/content extraction to runtime-facing schemas.

## Priority Work Queue

### P0.5: Compression Dispatch Provenance

- See detailed table dump: `rom_analysis/docs/bank1_l001210_pointer_tables.md`.
- `L001210` dispatch now confirmed to handle `42FB`, `26FB`, `67FB`, `27FB`.
- Current static callsite sample (`bank1.asm`) stages `$0E` mostly as `0x0004`,
  `0x0006`, `0x0007`, `0x000D`, `0x001A`; no direct `0x001E` constant in the
  current callsite set.
- Bank-1 pointer tables (`01:A789/01:A7D3` and `01:A842/01:A888`) explicitly
  reference bank-30 `26FB` starts: `1E:DF6C`, `1E:E039`, `1E:E73F`,
  `1E:E800`, `1E:EE7F`.
- Bank-30 `67FB` at `1E:DA96` decodes and spans `[0x5A96,0x73B3)` in-bank,
  proving overlap exists; the five `26FB` starts above are now confirmed
  independent entries inside that larger window.
- Runtime `L001210` tracing (`3600` no-input frames) now confirms active usage
  of bank-30 `26FB` sources `1E:DF6C/E039/E73F/E800`; each repeats exactly
  `1418` frames later, matching the measured attract-loop period.
- The same runtime window did not hit `1E:9681`, `1E:DA96`, `1E:E91F`, or
  `1E:EE7F`, so those remain branch/path-conditional targets.

### P0: Gameplay Entry Discovery

- Trace first bank 30 callback staged into `$096C-$096E`.
- Capture accompanying WRAM state snapshot for each transition.
- Produce transition graph with trigger conditions.
- Keep machine-readable intro callback checkpoints in:
  - `rom_analysis/docs/callback_state_contracts.jsonc`

### P1: Bank 30 Interface Contract

- Enumerate RTL entry points and all call sites.
- For each entry, record:
  - caller bank/address
  - input registers (`A/X/Y`, DBR assumptions)
  - WRAM reads/writes
  - side effects (callback writes, DMA setup, state flags)

### P2: Bank 10/11 Behavioral Contracts

- Bank 10:
  - identify per-frame integrator/update loops
  - separate physics from AI decision logic
- Bank 11:
  - identify road segment/table readers
  - identify raster output buffers and IRQ/HDMA dependencies

### P3: Content Lanes Unblocking Gameplay

- Graphics:
  - track tileset/tilemap ownership by scenario/state.
- Maps:
  - recover track/scenario tables and progression links.
- Audio:
  - identify SPC command stream, command timing, and sample tables.

## Definition of Done for "Gameplay Archaeology Ready"

- A reproducible document that maps:
  - callback chain into gameplay code
  - bank 30 service entry contracts
  - bank 10/11 state contracts
- At least one deterministic gameplay frame window captured with:
  - known callback
  - known state struct snapshot
  - known render/audio command outcomes
