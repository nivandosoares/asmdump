# Track 1 Late Entry: BG1 Queue Object Provenance at Frame 3250

Date: 2026-04-02

## Scope

This note extends the earlier queue-boundary narrowing for the late-entry
`3250` counterexample. The target is the single active visible descriptor:

- slot `14`
- offset `112`
- bytes `01 b8 b4 15 20 00 80 61`
- source `15:B4B8`
- transfer size `0x20`
- VRAM destination `0x6180`

## New Object-Side Provenance

The descriptor no longer reads like an arbitrary raw VRAM copy. It matches the
bank-0 table-driven queue-builder family rooted at `L001895` / `L001A70`.

That family packs its queued words through overlapping direct-page pairs:

- `$04/$05 -> 0xB801`
- `$06/$07 -> 0x15B4`
- `$08/$09 -> 0x0020`
- `$0606 = ($0A << 4) + $099A -> 0x6180`

Under that packing scheme, the observed descriptor implies:

- command `1`
- source low byte from the high half of `$04/$05`
- source high/bank from `$06/$07`
- transfer size `1` tile (`0x20` bytes)
- destination tile slot `0x18` on a `0x6000` VRAM base

ROM-side decode closes the payload object one step further:

- bank-15 object table start: `15:B4A8`
- first word: `0x0001` (`1` queued chunk)
- second word: `0x0001` (`1` tile -> `0x20` bytes)
- payload start:
  `table + 8 * count + 8 = 15:B4B8`

That is exactly the active descriptor source observed on frame `3250`.

## Useful Negative Result

Raw-word search did **not** find direct literal references to `B4A8` or
`B4B8` inside `bank1.asm`, `bank2.asm`, or the rest of bank `15`.

Current read:

- this is probably not a trivial hardcoded `addr -> VRAM` pair
- it is more likely a table-resolved gameplay object family that eventually
  lands on the one-tile bank-15 object at `15:B4A8`

## Bounded Trace Result

Two targeted Mesen variants were run against frame `3250`:

1. low-bank callback/builder probes
2. mirrored-bank callback/builder probes

Both variants kept:

- `0` exec hits on the guessed producer sites
- `0` write hits on traced `7E:0600..0607`

So the current trace instrumentation did **not** catch the producer directly.

That negative result is still useful because both captures preserved the same
frame-start callback anchors:

- active main callback: `02:9016`
- active IRQ callback: `01:96A0`
- queue cursors at frame start: `dp_0053/0054 = 0x70/0x70`

By scanline `46`, the same frame still shows the visible descriptor active,
which means the next producer proof should stay anchored on that callback pair
even though these first guessed hook points were wrong.

## Practical Consequence

The `3250` counterexample is now narrowed past:

- window/sub-screen speculation
- end-frame VRAM ownership speculation
- generic “some DMA happened” wording

Current strongest read:

- `3250` is carrying a transient visible-phase BG1 CHR update
- that update matches a bank-0 table-driven queue builder
- the queued object resolves to a one-tile bank-15 payload at `15:B4A8`
- the remaining unresolved step is the gameplay-side selector path inside the
  active `02:9016` main / `01:96A0` IRQ family

## Next Best Step

Before another broad Mesen retry:

1. resolve the unlabeled `02:9016..02:90B2` region against nearby bank-2 code
2. follow how `01:96A0` and its callers feed that same late-gameplay family
3. only then add another targeted trace, ideally one that logs live `K:PC`
   through scanlines `0..46` instead of preselected builder sites
