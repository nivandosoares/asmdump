# Bank 1 IRQ Callback `01:96A0` In Human Terms

Date: `2026-04-08`

This note translates the currently promoted gameplay IRQ pair in bank 1:

- first-stage setup / default return target: `01:960D`
- second-stage visible split handler: `01:96A0`

The important correction is that `01:96A0` is not a vague "gameplay IRQ"
placeholder. It is a staged PPU-timing routine that applies BG scroll,
window, and color-math changes across one or more scanline interrupts.

## Proven Role

Current best human read:

- `01:960D` chooses an initial BG1 offset mode from `$11AB`
- under a narrower late-gameplay condition, `01:960D` arms a second IRQ phase
  by storing `0x96A0` into the active IRQ callback slot
- `01:96A0` then performs the visible split choreography:
  - BG3 scroll writes
  - `TMAIN/TSUB` changes
  - `W1L/W1R` window writes
  - `CGWSEL/CGADSUB/COLDATA` color-math writes
  - reprogramming `VTIMEL` for another IRQ slice or returning to `01:960D`

That makes bank 1 the owner of the gameplay-visible IRQ split, while bank 2
still owns the main gameplay control gate at `02:9016`.

## What `01:960D` Does

The small `01:960D` entry is the first-stage IRQ handler.

Proven behavior:

- reads `$11AB`
- applies one of three BG1 offset presets
- always restores:
  - `TMAIN = 0x13`
  - `CGWSEL = 0x30`
- if all of these hold:
  - `$1CEC < 0`
  - `$1396 < 0`
  - `$B8 != 0`
  then it arms a more complex visible phase:
  - `W1L = 0x00`
  - `W1R = 0xFF`
  - `TMAIN = 0x17`
  - `TSW = 0x06`
  - `CGADSUB = 0x86`
  - `CGWSEL = 0x10`
  - `$0F3A = 0x0100`
  - `active_irq = 0x96A0`

Current pseudocode:

```c
void irq_960d(void) {
    apply_bg1_mode_from_11ab();
    TMAIN = 0x13;
    CGWSEL = 0x30;

    if (state_1CEC < 0 && state_1396 < 0 && dp_b8 != 0) {
        W1L = 0x00;
        W1R = 0xFF;
        TMAIN = 0x17;
        TSW = 0x06;
        CGADSUB = 0x86;
        CGWSEL = 0x10;
        state_0F3A = 0x0100;
        active_irq = 0x96A0;
    }
}
```

## What `01:96A0` Does

`01:96A0` is the second-stage visible split handler.

The strongest current read is:

1. force `TMAIN = 0x17`
2. either use the base BG3 scroll from `$1E1C..$1E1F` or jump straight into a
   special window/color-math path depending on `$1CEB`
3. if `$1CE6 != 0`, enable a stronger subscreen/color-math mode and return to
   the default scanline target
4. otherwise use `$13AA/$13A8/$13AC/$13AE/$13B4/$13B6` to choose another IRQ
   slice
5. always finish by restoring BG1 scroll from `$00C2/$00C4/$00C5`

The three useful branch families are:

- `$13AA == 0`
  - if `$13B6 < 0x74`, schedule one more IRQ at `VTIMEL = $13B6 - 1`
    via `01:9809`
  - otherwise return to the normal `01:960D` target at scanline `0x78`
- `$13AA != 0` and `$13A8 < 0x1C`
  - load `CGWSEL = $13AE`
  - if `$13AA < 0x74`, schedule continuation `01:97E1`
  - otherwise return to `01:960D`
- `$13AA != 0` and `$13A8 >= 0x1C`
  - schedule continuation `01:97B1`
  - use `CGWSEL = $13AC`

Current pseudocode:

```c
void irq_96a0(void) {
    TMAIN = 0x17;

    if (state_1CEB >= 0) {
        apply_bg3_scroll(state_1E1C, state_1E1E);

        if (state_1CE6 != 0) {
            TMAIN = 0x16;
            TSUB = 0x01;
            CGWSEL = 0x02;
            CGADSUB = 0x93;
            COLDATA = 0xE0;
            schedule_irq(0x78, 0x960D);
            return;
        }
    }

    TSW = state_13BA;
    CGADSUB = state_13BA | 0x80;
    W1L = state_13A4;
    W1R = state_13A6;
    apply_bg3_scroll(state_13B4, state_1E1E);

    if (state_13AA == 0) {
        if (state_13B6 < 0x74) {
            schedule_irq(state_13B6 - 1, 0x9809);
        } else {
            schedule_irq(0x78, 0x960D);
        }
    } else if (state_13A8 < 0x1C) {
        CGWSEL = state_13AE;
        apply_bg3_hscroll_only(state_1E1C);

        if (state_13AA < 0x74) {
            schedule_irq(state_13AA, 0x97E1);
        } else {
            schedule_irq(0x78, 0x960D);
        }
    } else {
        CGWSEL = state_13AC;
        schedule_irq(state_13AA, 0x97B1);
    }

    apply_bg1_scroll(dp_c2, dp_c4, dp_c5);
}
```

## The Continuation Helpers

The anonymous continuations are small but readable:

- `01:97B1`
  - writes `CGWSEL = $13AE`
  - applies BG3 horizontal scroll from `$1E1C`
  - if `$13AA < 0x74`, schedules `01:97E1`
  - otherwise returns to `01:960D`
- `01:97E1`
  - writes `CGWSEL = $13AC`
  - applies BG3 horizontal scroll from `$13B4`
  - restores `VTIMEL = 0x78`
  - restores `active_irq = 0x960D`
- `01:9809`
  - reapplies BG3 horizontal scroll from `$1E1C`
  - tails directly into the same "restore `0x78` / return to `01:960D`"
    epilogue

So the whole family is better read as:

```c
void gameplay_irq_family(void) {
    irq_960d();          // base visible setup
    irq_96a0();          // second-stage split/window phase when armed
    irq_97b1_97e1_9809();// optional timed continuations inside the same frame
}
```

## Why This Matters

This removes one major ambiguity from the current gameplay callback bundle:

- `02:9016` is the gameplay-side control/transition gate
- `01:96A0` is the gameplay-visible IRQ split choreography
- `02:8F3C` is still the paired NMI-side gameplay callback

For the port, the important runtime consequence is that late gameplay is not
just "main logic plus final VRAM." The IRQ lane is actively reprogramming
visible PPU state mid-frame.

## Open Questions

- what exact named visual mode do `$1CE6/$1CEB/$1CEC` represent?
- what exact display/window concept is encoded by `$13AA/$13A8/$13AC/$13AE`?
- which bank-2 state changes are responsible for arming the `01:960D -> 01:96A0`
  escalation on the late gameplay frames that still stream queue-backed BG1
  objects?
