# Bank Disassembly Status Report

This report tracks the analysis and disassembly status of all 32 ROM banks ($00-$1F).

| Bank | Address | Primary Function | Status | Notes |
|------|---------|------------------|--------|-------|
| $00 | $00:8000 | Boot / NMI / IRQ / Scheduler | **Advanced** | Core flow identified. Vectors mapped. |
| $01 | $01:8000 | Intro / Front-End Logic | **Advanced** | Multiple callbacks ($9FE5, $A39C) analyzed. |
| $02 | $02:8000 | Gameplay Logic / HUD | **Active** | Radar ($108EF) and Speed/Gear ($10930) mapped. |
| $03 | $03:8000 | Palettes | **Asset Done** | Bank 3 palette extractor is operational. |
| $04 | $04:8000 | Text / Strings | **Asset Done** | String blocks for menus identified. |
| $05 | $05:8000 | TBD | Queued | |
| $06 | $06:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $07 | $07:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $08 | $08:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $09 | $09:8000 | Sprites / Tiles | **Asset Done** | Advanced extraction complete. |
| $0A | $0A:8000 | Physics / AI Core | **Active** | Entry points ($5322, $8759) identified. No labels in ASM. |
| $0B | $0B:8000 | Road Rasterizer | **Advanced** | Scanline HDMA generation ($0200/$0400). Calls WRAM routine at $12EE. |
| $0C | $0C:8000 | Unmapped / Empty | **Advanced** | 0x6000 bytes of empty space ($00). Ends with Bank 13 start. |
| $0D | $0D:8000 | Track / Scenario | **Advanced** | Bit-stream compressed data (26 FB). Decompressed via L000E2B. |
| $0E | $0E:8000 | Track / Scenario | **Advanced** | Bit-stream compressed data (26 FB). Extension of Bank 13. |
| $0F | $0F:8000 | TBD | Queued | |
| $10 | $10:8000 | TBD | Queued | |
| $11 | $11:8000 | TBD | Queued | |
| $12 | $12:8000 | Track / Scenario | **High Priority** | Road segment data. Empty space at start. |
| $13 | $13:8000 | Track / Scenario | **High Priority** | Road segment data. Contains RTLs. |
| $14 | $14:8000 | Track / Scenario | **High Priority** | Road segment data. Contains RTLs. |
| $15 | $15:8000 | TBD | Queued | |
| $16 | $16:8000 | TBD | Queued | |
| $17 | $17:8000 | TBD | Queued | |
| $18 | $18:8000 | Audio (SPC700 / BRR) | **Queued** | Music and samples. |
| $19 | $19:8000 | Audio (SPC700 / BRR) | **Queued** | Music and samples. |
| $1A | $1A:8000 | TBD | Queued | |
| $1B | $1B:8000 | TBD | Queued | |
| $1C | $1C:8000 | TBD | Queued | |
| $1D | $1D:8000 | TBD | Queued | |
| $1E | $1E:8000 | Dispatch Tables / Data | **Advanced** | $DA96 (67FB) and nested chunks resolved. |
| $1F | $1F:8000 | TBD | Queued | |

## Legend
- **Advanced:** High confidence in logic and data structures.
- **Active:** Under active reverse-engineering.
- **Asset Done:** Data formats identified and extractors built.
- **High Priority:** Critical for core gameplay parity.
- **Queued:** Not yet analyzed.
