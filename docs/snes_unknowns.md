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
  - An adjacent front-end UI helper uses `$00 = $0202 + 0x0008` against the
    shared `$1E80` buffer through `L00179B`.
  - The three preview helper bundles are distinct:
    - index `9` -> `00:B0AB`, `0E:8000`, `02:FC11`
    - index `10` -> `00:B6B2`, `0E:91FE`, `02:FBF3`
    - index `11` -> `00:BCBA`, `0E:A428`, `0D:C98F`
  - A separate verified car-customize surface exists at `01:880D`.
- Notes:
  - The preview and commit behavior are direct code evidence.
  - The domain label car still needs a name-bearing asset or debugger-backed
    menu trace.
  - The current simple helper-scene builder does not yet extract these preview
    bundles cleanly; helper indices `9..11` currently fail with an
    `L00A9CB` `26FB` length mismatch (`11348` bytes vs expected `16640`).

### CLAIM AUDIT

- Claim: `$1C7C` is the best current track or scenery selector candidate.
- Classification: PROBABLE
- Evidence:
  - `L00BE76` rotates `$1C7C` over `4` states.
  - `01:8000/01:8008` decodes to group bases/counts
    `[0, 5, 11, 18] / [5, 6, 7, 8]`.
  - `L008B87` derives `$1C7E/$1C80` from `$1C7C`.
  - `L008C10` uses the resulting base/count pair to choose the live descriptor
    row.
  - An adjacent front-end UI helper uses `$00 = $1C7C + 0x000B` against the
    shared `$1E80` buffer through `L00179B`.
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
  - Forced `01:9568` and `01:95AD` probes each reach `01:B1F9` once at frame
    `1201`, with stack returns `0x9575 / 0x95B7` and `state_0f77 = 1 / 0`.
  - The same forced `1200..1300` trace window records no writes to
    `7E:096C..0971` and no exec hit at `02:9016`.
- Notes:
  - This is the strongest current boundary candidate.
  - It is still not a verified dual-catalog validity gate.
  - The missing proof is now the callback-promotion timing around that
    boundary, not whether the bank-1 branch entry itself is real.

## Next Probes

- Get a deterministic post-attract or menu savestate where `$1CAC/$1CCA/$1CE*`
  are nonzero, then rerun the boot probe to capture a richer selector block.
- Extend the preview extractor for helper indices `9..11`, because the current
  simple helper-scene path fails on the `L00A9CB` `26FB` bulk decode.
- Keep decoding the `01:8016..01:8330` table families into named rows so
  `$1C7C`, `$1CAC`, and `$1CCA` can be tied to concrete assets instead of raw
  indices.
- Trace the `$1C7C`-seeded descriptor rows to name-bearing assets or gameplay
  windows to prove whether that selector is track/scenery-facing.
- Widen the forced `01:9568/01:95AD` trace window around callback promotion so
  `$096C-$0971` and `02:9016` can be observed, or disproven, closer to the
  bank-1 boundary itself.
