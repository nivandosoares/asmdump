# SNES Unknowns

This note records the highest-value remaining unknowns after the first
DOS-driven SNES correlation pass.

## Open Claims

### CLAIM AUDIT

- Claim: `$1C78` and the `3`-choice `$0202` preview path are the active car
  selector for the main front-end flow.
- Classification: PROBABLE
- Evidence:
  - `L00BBCB` cycles `$0202` over `0..2`, rebuilds one bundle from
    `0x0009 + $0202`, and `L008B57` commits `$0202 -> $1C78`.
  - A separate verified car-customize surface exists at `01:880D`.
- Notes:
  - The preview and commit behavior are direct code evidence.
  - The domain label car still needs a name-bearing asset or debugger-backed
    menu trace.

### CLAIM AUDIT

- Claim: `$1C7C` is the best current track or scenery selector candidate.
- Classification: PROBABLE
- Evidence:
  - `L00BE76` rotates `$1C7C` over `4` states.
  - `L008B87` derives `$1C7E/$1C80` from `$1C7C`.
  - `L008C10` uses the resulting base/count pair to choose the live descriptor
    row.
- Notes:
  - The selector mechanics are verified.
  - The track/scenery label still needs a direct ID, name, or gameplay-side
    confirmation.

### CLAIM AUDIT

- Claim: The SNES port dropped DOS `select.dat`-style persistence rather than
  remapping it to cart SRAM.
- Classification: PROBABLE
- Evidence:
  - The ROM header reports `sram_size = 0x00`.
  - No current front-end archaeology has recovered a battery-backed selector
    block.
- Notes:
  - This is a strong persistence negative on the cartridge surface.
  - It does not rule out an unproven password-like or other non-SRAM path.

### CLAIM AUDIT

- Claim: `L009568/L0095AD -> L00B1F9/L00B75E` is the nearest SNES equivalent to
  the DOS play-session assembly boundary.
- Classification: PROBABLE
- Evidence:
  - The path increments `$1CA8`, compares it against `$1C80`, and either
    rebuilds through `L008C10` or unwinds to `L008B31`.
  - It sits immediately before deeper runtime work in `L00B1F9` and
    `L00B75E`.
- Notes:
  - This is the strongest current boundary candidate.
  - It is still not a verified dual-catalog validity gate.

## Next Probes

- Get a deterministic post-attract or menu savestate where `$1CAC/$1CCA/$1CE*`
  are nonzero, then rerun the boot probe to capture a richer selector block.
- Decode the `01:8000` and `01:8016..01:8330` table families into named rows so
  `$1C7C`, `$1CAC`, and `$1CCA` can be tied to concrete assets instead of raw
  indices.
- Trace `L00BBCB` bundle indices `0x0009..0x000B` to bank sources or visible
  menu assets to prove whether that preview domain is car-specific.
- Trace the `$1C7C`-seeded descriptor rows to name-bearing assets or gameplay
  windows to prove whether that selector is track/scenery-facing.
- Follow `L009568/L0095AD` into the first confirmed gameplay callback chain and
  compare that boundary against the existing `02:9016` gameplay evidence.
