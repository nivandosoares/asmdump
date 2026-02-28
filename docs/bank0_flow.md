# Bank 0 Flow Notes

## Scope

This document captures the current understanding of bank 0 as the control kernel for boot, NMI, main-loop dispatch, and IRQ split handling.

It is based on the current disassembly in `bank0.asm` and is intended to support the first C/SDL runtime work, not to be the final word on every routine.

## Key State

Likely long-pointer staging areas:

- `$0038-$003A`: active main callback target
- `$003B-$003D`: active NMI callback target
- `$003E-$0040`: active IRQ callback target
- `$096C-$096E`: pending main callback target
- `$096F-$0971`: pending NMI callback target

Other important state:

- `$0960-$0961`: joypad 1 sample
- `$0962-$0963`: joypad 2 sample
- `$0964-$0965`: frame counter
- `$0966`: display brightness / forced blank shadow
- `$0968`: gate for the main DMA queue pass inside NMI
- `$096A`: OAM DMA pending flag
- `$0972-$0973`: NMI DMA budget for the current frame
- `$0F2E-$0F31`: cached IRQ timer values
- `$0F32-$0F41`: cached scroll register values pushed to PPU each NMI
- `$53/$54`: DMA queue read/end pointers into `$0600+`
- `$51`: reentrancy guard for NMI

## RESET Flow

Entry point: `L00002A` at `$00:802A`.

Observed order:

1. Enter native mode with `clc` / `xce`, set 16-bit index registers, 8-bit accumulator.
2. Initialize stack pointer to `$01FF`, set data bank to the current program bank, and zero direct page.
3. Disable interrupts through `NMITIMEN`, blank the screen with `INIDSP = $8F`, and clear OAM setup registers.
4. Zero broad ranges of PPU registers from `$2105` upward, then seed part of the register block with a ROM-side table copied from bank 0.
5. Set color math defaults with `CGWSEL`, `CGADSUB`, `COLDATA`, and clear `SETINI`.
6. Call `L00045B` with zeroed `A/X/Y`. This is an early VRAM DMA helper call; exact payload semantics still need confirmation.
7. Clear the CPU-side I/O block from `$4202` through `$420C`.
8. Set `$0C/$0E` to a data pointer and call `L001283`, then clear `$0000-$1FFF`.
9. Copy six bytes from `$8023+X` into `$0100+X`.
10. Call `L008AF8`.
11. Initialize display shadow state (`$0966 = $8F`) and copy a 29-byte table from `$8006+X` into `$38+X`.
12. Clear pending callback state, frame counter, and several runtime flags.
13. Seed the active IRQ callback pointer with bank 0 address `$8029` by writing `$3E/$3F`.
14. Clear cached scroll/timer state at `$0F32-$0F40`.
15. Call `L00154E`, enable NMI with `NMITIMEN = $81`, then call `L002368`, `L00050F`, and finally jump to `L008B26`.

## NMI Flow

Entry wrapper: `L000139` at `$00:8139`.

Observed order:

1. Save registers and read `RDNMI`.
2. Check `$51`. If it is non-zero, the handler exits immediately with `rti`.
3. Set `$51 = $FFFF` as an in-progress guard.
4. If a pending NMI callback exists in `$096F-$0971`, copy it into the active callback slot `$003B-$003D` and clear the pending copy.
5. Jump through the active NMI callback pointer via `jmp [$003B]`. The wrapper pushes a return address first, so control comes back into the common NMI body.
6. Program `VTIMEL` and `HTIMEL` from cached values in `$0F2E/$0F30`.
7. Restore `INIDSP` from `$0966`.
8. Push cached scroll values from `$0F32+` into the BG scroll register block starting at `$210D`.
9. If `$0968 == 0`, process the DMA queue rooted at `$0600+`:
   - `$53` is the current read pointer.
   - `$54` is the end pointer.
   - non-negative entries map to VRAM DMA transfers
   - negative entries map to direct VRAM data writes
   - `$0972/$0973` provide the frame budget
10. If the DMA queue leaves enough budget and `$096A != 0`, perform a fixed OAM DMA from `$0700` with length `$0220`, then clear `$096A`.
11. Increment the frame counter in `$0964` unless `$0998 != 0`.
12. If `$0974 != 0`, save direct-page scratch bytes `$00-$17` into `$0976+`.
13. Wait for auto-joypad read completion by polling `$4212`, then copy `JOY1L` to `$0960` and `JOY2L` to `$0962`.
14. If a pending main callback exists in `$096C-$096E`, copy it into the active main callback slot `$0038-$003A` and clear the pending copy.
15. Jump through the active main callback pointer via `jmp [$0038]`.
16. If `$0974 != 0`, restore the saved direct-page scratch bytes.
17. Clear `$51`, restore registers, and `rti`.

## Main Callback Scheduling

The important distinction is staged callback vs active callback.

### Active callback slots

- Main callback executes from `$0038-$003A`.
- NMI callback executes from `$003B-$003D`.
- IRQ callback executes from `$003E-$0040`.

### Staging helpers

`L000385`:

- input: `X = 16-bit address`, `A = 8-bit bank`
- output: writes staged main callback to `$096C-$096E`

`L0003A0`:

- input: `X = 16-bit address`, `A = 8-bit bank`
- output: writes staged NMI callback to `$096F-$0971`

`L000375` and `L000390` are convenience wrappers that stage bank 0 address `$8029` for the main and NMI callback slots respectively.

Operationally, the scheduler works like this:

1. Game code writes a future main callback to `$096C-$096E`.
2. NMI finishes PPU/DMA/input work.
3. Near the end of NMI, the staged pointer is promoted into `$0038-$003A`.
4. Control jumps through `$0038-$003A`.

That means the "main loop" is effectively a callback dispatch embedded inside the NMI-driven frame cadence.

## IRQ / Screen Split

Entry wrapper: `L000322` at `$00:8322`.

Observed order:

1. Save registers.
2. Read `TIMEUP` to acknowledge the timer IRQ.
3. Push a return address and jump through the active IRQ callback pointer in `$003E-$0040`.
4. Restore registers and `rti`.

Two helper routines matter most:

### `L000341`

This appears to arm or re-arm the split IRQ:

1. Disable interrupts locally.
2. Store `Y` into `$0F2E` and `VTIMEL`.
3. Restore `HTIMEL` from `$0F30`.
4. Store the next IRQ callback pointer from `X` (address) and `A` (bank) into `$003E-$0040`.
5. Wait one frame via `L0003AB`.
6. Write `$B1` to `NMITIMEN`, which strongly suggests enabling the H/V timer IRQ path alongside NMI.

### `L000361`

This appears to shut the split path back down:

1. Set `NMITIMEN = $81`.
2. Clear `$40`, the bank byte of the IRQ callback pointer.
3. Replace `$003E/$003F` with `$835F`, a bank 0 fallback handler location.

The current working hypothesis is:

- gameplay installs a timed IRQ callback through `L000341`
- that callback performs the HUD/cockpit split work
- non-gameplay states fall back to the simpler `$835F` path via `L000361`

## Observed Transition Effects

Several late-bank-0 routines around `$009E07-$009F81` appear to be screen transitions rather than steady-state gameplay.

Shared behavior across the three clearest call sites:

- they clear `$0F6A`, prepare a line buffer at `$0200/$0400`, and stage the main callback to bank 0 address `$A033`
- they enable HDMA channel 7 and call `L000521`, then enter a per-frame loop gated by `$0F6A`
- when the effect completes, they disable `HDMAEN`, restore the default main callback with `L000375`, wait one frame with `L0003AB`, and return

The three variants differ mainly in the HDMA destination register and the evolution of `$0F4A`:

- call site near line `4303`: seeds `$0F4A = $0168`, uses `DMADEST7 = $26`, and decrements `$0F4A` by `5` per frame until it reaches zero
- call site near line `4634`: seeds `$0F4A = $0000`, uses `DMADEST7 = $00`, and increments `$0F4A` by `3` per frame until `$0160`
- call site near line `4765`: seeds `$0F4A = $0000`, uses `DMADEST7 = $06`, and increments `$0F4A` by `2` per frame until `$0160`

Working interpretation:

- bank 0 address `$A033` is a per-frame helper for these transition effects
- the routines at `$9E07/$9E71/$9F31/$9F81` likely build HDMA/window tables in RAM for wipes or fades
- these blocks are useful to port as self-contained transition modules, but they are not the primary gameplay loop

## Confirmed Support Routines

These are already useful for the PC port design:

- `L0003AB`: wait for the next frame by spinning on `$0964`
- `L0004DF`: reset runtime video/DMA state, disable HDMA, restore default callbacks
- `L00050F`: calls `L0004DF`, clears VRAM through `L0004D3`, resets several PPU shadow registers, and lands in `L00052E`
- `L000583`: CGRAM upload helper from pointer `$0C/$0E`
- `L0006ED` and `L000715`: enqueue VRAM DMA work into the `$0600+` queue

## Open Questions

- What exact callback table is copied from `$8006` into `$38+` during reset?
- Which states install gameplay vs menu callbacks into `$096C` and `$096F`?
- Is `$0972/$0973` a strict DMA byte budget, a cycle budget, or a hybrid heuristic?
- What exact handler lives at the fallback IRQ address `$835F`?
- Which routines first configure the gameplay split associated with `L000341`?
