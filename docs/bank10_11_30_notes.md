# Banks 10, 11, 30 — Gameplay Entry Point Analysis

## Overview

Banks 10, 11, and 30 contain gameplay-critical code (physics/AI, road
rasterizer, dispatch tables). None of them are called directly from
bank 0 or bank 1 — all cross-bank calls originate from banks 4, 6, 7,
8, 9, 10, 11, 14, 17, and 23.

## Bank 10 ($0A) — Physics / AI

- **13,492 lines** disassembly
- **37 subroutines** (36 RTS + 1 RTL)
- **366 calls** (199 JSR + 167 JSL)
- Only 1 RTL: this bank is mostly called via JSR from within or via
  trampolines — the single RTL indicates one primary far-call entry.

### Entry Points

| Target     | Caller   | Notes                      |
|------------|----------|----------------------------|
| $0A:0000   | Bank 6   | Bank start — likely init   |
| $0A:5322   | Bank 7   | Mid-bank                   |
| $0A:8759   | Bank 7   | Mid-bank                   |
| $0A:9FB5   | Bank 4   | Near end                   |
| $0A:B634   | Bank 11  | Bank end entry             |

## Bank 11 ($0B) — Road Rasterizer

- **12,870 lines** disassembly
- **64 subroutines** (64 RTS, 0 RTL)
- **311 calls** (155 JSR + 156 JSL)
- Zero RTL: no designed far-call interface. All external entries must
  be via JSL landing on a JSR-internal routine.

### Entry Points

| Target     | Caller    | Notes            |
|------------|-----------|------------------|
| $0B:122E   | Bank 11   | Self-call        |
| $0B:7422   | Bank 11   | Self-call        |
| $0B:B643   | Bank 23   | Bank end entry   |

### Notes
- Self-referential calls suggest a state machine or recursive rasterizer.
- Calls **into** bank 10 — bank 11 depends on bank 10 as a lower-level API.

## Bank 30 ($1E) — Dispatch Tables

- **14,854 lines** disassembly
- **97 subroutines** (84 RTS + 13 RTL)
- **212 calls** (203 JSR + 9 JSL)
- 13 RTL: well-designed long-call interface with multiple entry points.

### Entry Points

| Target     | Caller    | Notes              |
|------------|-----------|--------------------|
| $1E:4112   | Bank 10   | Primary entry      |
| $1E:5422   | Bank 8    | Primary entry      |
| $1E:B01F   | Bank 9    | High bank entry    |
| $1E:B633   | Bank 17   | High bank entry    |
| $1E:C922   | Bank 14   | End region entry   |
| $1E:EE22   | Bank 10   | High end entry     |

## Architecture

```
Bank 6/7/4 ──> Bank 10 (Physics/AI) ──> Bank 30 (Dispatch)
                   ^                         ^
                   |                         |
Bank 11 (Rasterizer) ───────────────────────/
                   ^
                   |
              Bank 23
```

Bank 30 is the shared service layer, called from 5 different banks.
Banks 10 and 11 are specialized subsystems with bank 11 depending on 10.

## Recommended RE Order

1. **Bank 30** — most structured (13 RTL boundaries), shared service layer
2. **Bank 10** — single far-call entry, serves as physics/AI core
3. **Bank 11** — rasterizer, depends on bank 10, least structured

## Next Steps

- Use `tools/scan_structured_bank.py` on each bank to find data tables
- Map RTL locations as subroutine boundaries
- Trace register usage (A, X, Y) at each JSL entry point
- Cross-reference with bank 0 callback scheduler to find gameplay dispatch
