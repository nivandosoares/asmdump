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
  - `L00BDAC` and `L00BDD0` wrap the selection across all three slots without
    a recovered lock condition.
  - An adjacent front-end UI helper uses `$00 = $0202 + 0x0008` against the
    ROM descriptor table rooted at `1E:8000` through `L00179B/L001662`.
  - The three preview helper bundles are distinct:
    - index `9` -> `00:B0AB`, `0E:8000`, `02:FC11`
    - index `10` -> `00:B6B2`, `0E:91FE`, `02:FBF3`
    - index `11` -> `00:BCBA`, `0E:A428`, `0D:C98F`
  - A separate verified car-customize surface exists at `01:880D`.
- Notes:
  - The preview and commit behavior are direct code evidence.
  - The domain label car still needs a name-bearing asset or debugger-backed
    menu trace.
  - The current recovered loop already exposes all three front-end slots; the
    remaining gap is naming, not a recovered front-end restriction on the
    third slot.
  - The raw helper bundles are now extractable; the remaining uncertainty is
    runtime composition and naming.

### CLAIM AUDIT

- Claim: The one-shot helper extractor for preview indices `9..11` is now
  recovered, but the clean isolated-layer model only shows visible `BG2`
  content for helper `9`.
- Classification: VERIFIED
- Evidence:
  - Strict `decode_26fb` on `0E:8000` raises
    `26FB decode length mismatch: got 11348 bytes, expected 16640`.
  - The patched `L0006C9` extraction path accepts partial `26FB` output and
    records both declared and actual bulk sizes.
  - [tools/out/bank1_preview_helper_9_11_summary.json](/home/nivando-soares/asmdump/tools/out/bank1_preview_helper_9_11_summary.json)
    records clean one-shot rebuilds with `BG1` non-backdrop `0/0/0` and `BG2`
    non-backdrop `14336/0/0` for helpers `9/10/11`.
- Notes:
  - This is extractor/model evidence, not a proof of final runtime
    presentation.
  - The next unknown is whether helpers `10` and `11` need follow-up
    callbacks, a different PPU layer mix, or are intentionally blank at this
    stage.

### CLAIM AUDIT

- Claim: `$1C7C` is the best current track or scenery selector candidate.
- Classification: PROBABLE
- Evidence:
  - `L008B6F` sets `$1C84 = 4` before `L00BE76`.
  - `L00BE76` rotates `$1C7C` over `4` states.
  - `01:8000/01:8008` decodes to group bases/counts
    `[0, 5, 11, 18] / [5, 6, 7, 8]`.
  - `L008B87` derives `$1C7E/$1C80` from `$1C7C`.
  - `L008C10` uses the resulting base/count pair to choose the live descriptor
    row.
  - An adjacent front-end UI helper uses `$00 = $1C7C + 0x000B` against the
    ROM descriptor table rooted at `1E:8000` through `L00179B`.
- Notes:
  - The selector mechanics and `4`-slot cardinality are verified.
  - The remaining gap is the human-readable name mapping for the four slots.

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
- Capture live menu `TMAIN/BG1SC/BG2SC/BG12NBA` around the preview cycle so the
  clean one-shot helper builds can be compared against the real layer mix.
- Trace the follow-up callback/composition path after the helper `9/10/11`
  bundle build to explain why helpers `10` and `11` stay blank in the current
  isolated-layer model.
- Decode and render the `1E:8000` descriptor rows `8..14` so the current
  car-facing and track-facing adjacent menu surfaces can be tied to concrete
  labels instead of raw descriptor headers.
- Keep decoding the `01:8016..01:8330` table families into named rows so
  `$1C7C`, `$1CAC`, and `$1CCA` can be tied to concrete assets instead of raw
  indices.
- Trace the `$1C7C`-seeded descriptor rows to name-bearing assets or gameplay
  windows to prove whether that selector is track/scenery-facing.
- Widen the forced `01:9568/01:95AD` trace window around callback promotion so
  `$096C-$0971` and `02:9016` can be observed, or disproven, closer to the
  bank-1 boundary itself.
