# Bank 2 Main Callback `02:9016` In Human Terms

Date: `2026-04-08`

This note focuses on the still-unlabeled control block behind the promoted
main gameplay callback:

- installed from bank 1 as `02:9016`
- located in the anonymous block between:
  - `L010F34` at `02:8F34`
  - `L0110B2` at `02:90B2`

That anonymous block is now the strongest current target for “heavy bank
analysis” because it sits directly between the staged gameplay callback
install and the better-typed bank-2 helper families.

## Current Reading

The first useful result is negative but important:

- `02:9016` is **not** the whole gameplay loop by itself
- it is the control/transition gate that decides when deeper gameplay helpers
  should run and when several transient flags/counters should be advanced or
  cleared

The strongest currently readable state family in this block is:

- `$0996`
- `$0998`
- `$118F`
- `$1191`
- `$0F76`
- `$11BD[(frame-1) & 7]`
- input sources:
  - `$0960`
  - `$0962`

## Proven Control Behavior

### 1. Transitional gate on `$0996`

At entry, the callback first checks `$0996`.

Current human read:

```c
if (state_0996 != 0) {
    if (joy1_current != 0) {
        state_118F = 0xFFFF;
        state_0996 = 0;
    }
    return;
}
```

This is already enough to classify `$0996` as a transition/hold gate rather
than ordinary per-frame gameplay state.

### 2. Countdown / latch handling on `$0998`

If `$118F == 0`, the same control block uses `$0998` as a short-lived counter
or latch:

- if `$0998 == 0`, it falls through to the later branch family
- otherwise it inspects:
  - `JOY1` state in `$0960`
  - specifically bit mask `0x1000`
  - one special exact input pattern `0x2040`
- it decrements `$0998`
- when the count drains to zero, it clears `$0F76`

Current human read:

```c
if (state_118F == 0 && state_0998 != 0) {
    if ((joy1_current == 0x2040) || (joy1_current & 0x1000) != 0) {
        state_0998--;
        return;
    }

    state_0998--;
    if (state_0998 == 0) {
        state_0F76 = 0;
    }
    return;
}
```

The exact semantic meaning of `$0998/$0F76` is still open, but this is very
strong evidence for a short transition/debounce/countdown surface.

### 3. Input-history capture into `$11BD`

The later part of the same block records recent input history under a tighter
set of conditions:

- `$1CEA` must be non-negative
- `JOY2` bit `0x0080` must be set in `$0962`
- `$117D == 0`
- `$11CD >= 0x2800`

When those conditions hold, it writes current `JOY1` into a rolling buffer:

```c
int slot = ((frame_counter - 1) & 7);
state_11BD[slot] = joy1_current;
```

If `JOY1` bit `0x1000` is also set and both `$118F` and `$1191` are `0`, the
same block seeds:

- `$0998 = 3`
- increments `$0F76`

Current human read:

```c
if (state_1CEA >= 0 &&
    (joy2_current & 0x0080) != 0 &&
    state_117D == 0 &&
    state_11CD >= 0x2800) {
    state_11BD[(frame_counter - 1) & 7] = joy1_current;

    if ((joy1_current & 0x1000) != 0 &&
        state_118F == 0 &&
        state_1191 == 0) {
        state_0998 = 3;
        state_0F76++;
    }
}
```

This is the strongest current evidence that `02:9016` owns a local
transition/input-history surface on top of deeper gameplay state.

## Why This Matters

This narrows the heavy disassembly problem:

- the unresolved work is not “what bank 2 does at all”
- it is the exact semantic ownership of the `9016` control block:
  - what transition does `$0996` gate?
  - what event does `$0998` count down?
  - what input history is `$11BD[0..7]` preserving?
  - how does this gate feed the later queue-backed SNES-bank-`$15` object
    uploads?

## Current Best Pseudocode

```c
void bank2_main_callback_9016(void) {
    if (transition_hold_active()) {
        maybe_break_hold_on_input();
        return;
    }

    if (mode_or_phase_is_idle() && short_input_latch_active()) {
        service_short_input_latch();
        return;
    }

    if (late-entry_history_window_is_open()) {
        record_recent_joy1_sample();
        maybe_arm_short_input_latch();
        return;
    }

    // The rest of the gameplay family continues into the later
    // bank-2 helpers that already have stronger typing.
}
```

## Open Questions

- what exact named gameplay mode does `$118F` represent?
- what exact named sub-phase does `$1191` represent?
- what real-world event is `$0998 = 3` measuring?
- is `$0F76` a retry counter, latch depth, or phase counter?
- which branch out of `02:9016` ultimately chooses the SNES-bank-`$15`
  object family for the frame-`3250` queue-backed upload?
