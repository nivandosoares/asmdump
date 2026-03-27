# SNES Select Opponent Mode Split

### CLAIM AUDIT

- Claim: The fourth `Select Opponent` slot is already a downstream no-opponent
  handoff at `L008B87`, not just a visual clock icon.
- Classification: VERIFIED
- Evidence:
  - `L008B87` loads `X = 1` and `A = $1C70`; only on `$1C70 == 3` it executes
    `dex` and `lda #$0000` before storing `X -> $1C76` and `A -> $1C7A`.
  - For selector values `0..2`, the same path stores `$1C76 = 1` and preserves
    `$1C7A = $1C70`.
  - `$1C7A` later selects rival-facing tables in `bank1.asm:1820-1837`,
    `bank1.asm:1965-1975`, and `bank2.asm:2675-2702`.
  - `$1C76` later gates opponent-side branches in `bank1.asm:2403-2405` and
    `bank2.asm:2943-2958`, `bank2.asm:4118-4129`, `bank2.asm:4671-4682`.
  - The fourth slot is already visually closed as a helper-`8` `BG1`
    stopwatch/clock surface in
    `tools/out/snes_frontend_select_opponent_clock_summary.json`.
- Notes:
  - This closes the immediate semantic split between the three rival-car cells
    and the fourth clock slot at the bank-1 handoff boundary.
  - The stronger runtime reading is now:
    `clock slot -> no-opponent branch verified`.
  - The remaining open edge is narrower:
    exact live gameplay/HUD behavior for that no-opponent branch is still not
    directly captured, so full "time-only" semantics remain `PROBABLE`.

## Downstream Consumers

| Field | Site | Observed effect | Classification |
| --- | --- | --- | --- |
| `$1C7A` | `bank1.asm:1820-1837` | selects `01:8384..01:838A` before CGRAM upload at `0x00A0` | `VERIFIED` |
| `$1C7A` | `bank1.asm:1965-1975` | selects `01:8614 + ($1C7A << 5)` for `VRAM 0x60C0` | `VERIFIED` |
| `$1C7A` | `bank2.asm:2675-2702` | selects `02:8306 / 02:830C` tables into `14DC` and `13FC` | `VERIFIED` |
| `$1C76` | `bank1.asm:2403-2405` | branches to `L00948A` vs `L009568` | `VERIFIED` |
| `$1C76` | `bank2.asm:2943-2958` | gates extra opponent-side init | `VERIFIED` |
| `$1C76` | `bank2.asm:4118-4129` | gates the second actor/path update | `VERIFIED` |
| `$1C76` | `bank2.asm:4671-4682` | gates later opponent-side runtime work | `VERIFIED` |
