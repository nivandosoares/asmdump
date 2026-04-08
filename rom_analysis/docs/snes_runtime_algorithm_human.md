# SNES Runtime Algorithm In Human Terms

This note rewrites the currently proven SNES runtime behavior into plain
language. It is intentionally high-level and only promotes steps that are
already grounded in code reads, probes, or generated artifacts.

## Scope

- focus: front-end selection/materialization path plus the known handoff
  corridor toward gameplay-facing callbacks
- evidence base:
  - `docs/snes_dos_correlation.md`
  - `rom_analysis/docs/progress_checkpoints.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

## Human Algorithm

1. The game keeps a live selector/state block in WRAM around `$1C6A..$1C90`
   instead of one compact DOS-style selector vector.
2. Front-end input mutates that block through small bank-1 helper loops:
   - `$1C6A` drives a separate `3`-option top-level signboard gate
   - `$0202/$1C78` drives the `3`-slot car-facing preview domain
   - `$1C7C` drives the `4`-slot top-level phase domain
   - semantically, the top-level `$1C6A` branches are now closed as:
     `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`,
     `High Score -> L00A3CC`
3. The top-level bank-1 success corridor does not fall straight into a build.
   It first requires the helper chain rooted at `L008B26` to return success.
   If any helper returns `0xFFFF`, bank 1 loops back to an earlier menu point
   instead of building the final working set.
4. Once the selectors are accepted, `L008B87` collapses the live selector
   fields into a smaller derived descriptor:
   - `$1C7E/$1C80` come from the top-level `$1C7C` group tables at `01:8000`
   - `$1C82 = $1CA8 + $1C7E`
   - `L008C10` then expands that into the active bundle fields
     `$1CAC/$1CCA/$1CFA/$1CAA/$1CE2/$1CE4/$1CE6/...`
5. `L008CA2` uses that derived bundle to materialize the actual visual working
   set:
   - `L00A9A0` resolves paged VRAM uploads
   - `L00A9CB` resolves bulk VRAM uploads
   - `L00A9F2` resolves CGRAM/palette uploads
   - `L001210` is the common decompression dispatcher when a source is packed
   - `L0005AC` and `L0006C9` perform the concrete VRAM copy shapes after the
     source is resolved or decompressed
6. The adjacent menu labels do not come from a WRAM text buffer at `$1E80`.
   The helpers build the long ROM pointer `1E:8000` directly and index rows
   from that ROM table.
7. Each `1E:8000` row is a small self-contained descriptor:
   - header
   - object list
   - descriptor-local `4bpp` OBJ blob
   - the object list defines where each glyph sprite is drawn
   - the local blob provides the sprite graphics for that row
8. `L00179B/L001662` interpret those rows and stage the result into the low
   WRAM OAM buffers:
   - `$0700` low table
   - `$0900` high table
   - for negative-layout rows, the blob is staged with a split padded layout
     so the glyph bottoms land on the correct next 16-tile row
9. `L0015BD` finishes the current OAM staging span and arms the usual NMI-side
   upload path. In human terms: bank 1 prepares the next visible sprite list in
   WRAM, and bank 0/NMI is what actually pushes it into PPU OAM.
10. The currently closed `$1C7C` top-level rows now read as:
    - `$1C7C = 0` -> `Desert Blast - Easy`
    - `$1C7C = 1` -> `City Bound - Medium`
    - `$1C7C = 2` -> `East Coast - Hard`
    - `$1C7C = 3` -> `West Coast - Hardest`
11. The nearby front-end row families now split more cleanly than before:
    - rows `8..10` are a rolling-tire helper cycle, not names
    - rows `15..17` are the top-level signboard labels:
      `Game Options`, `Play TDII`, `High Score`
    - rows `0x15..0x1B` are control/sound settings labels
    - the next downstream `$1C70` surface is now structurally closed as a
      `2x2` grid:
      - selector box = `1E:8000` row `0x1D`
      - explicit rear-car cells = `16:8000` row `6`, `18:8000` row `6`,
        `1B:8000` row `6`
      - the bottom-right cell is carried separately by helper `8` on `BG1` as
        a `Select Opponent` stopwatch/clock slot
      - `L008B87` then collapses that same choice into a derived handoff:
        `0..2 -> $1C76 = 1`, `$1C7A = rival index`
        `3 -> $1C76 = 0`, `$1C7A = 0`
    - the per-car bases at `01:9C77` are now better read as OBJ catalogs for
      Porsche 959, Lamborghini Diablo, and Ferrari F40 body/wheel/canopy
      animation pieces
    - a stable car-select frame at `1500` keeps the `Porsche 959` name box and
      info panel even with OAM removed, and the current helper-provenance read
      now lands that lower-screen `BG2` surface on helper bundle `10`
      (`00:B6B2 -> VRAM 0x1000`, `0E:91FE -> VRAM 0x3000`), so the remaining
      gap is the exact text/payload ownership inside that bundle
12. After the front-end bundle is accepted and built, the strongest currently
    proven gameplay-facing corridor is still the bank-1 path that stages
    `02:9016` (main) and `02:8F3C` (NMI) at `01:902D..01:9034`. That corridor
    is real, and no-force timed-input probes now recover the default top-left
    rival path into it organically:
    `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by
    `active_main = 02:9016`. Callback-relative input keyed first to live
    `01:C1D2` and then to `be43+17-22:start` now also recovers the fourth-slot
    no-opponent path into that same downstream corridor:
    `L00C20B -> 01:C1D2 -> L00BE76 -> 01:BE43 -> L008B87 -> 01:902D ->
    01:9111 -> active_main = 02:9016`. The important difference is preserved
    in state, not in this handoff timing: the rival baseline keeps
    `$1C70 = 0`, `$1C76 = 1`, while the no-opponent lane keeps
    `$1C70 = 3`, `$1C76 = 0` at the same downstream timestamps. A direct
    compare over frames `2044..2199` now shows that both paths also keep the
    same callback surface (`02:9016` main, `01:96A0` IRQ, `02:8F3C` NMI) while
    narrowing the remaining post-handoff split to `14` sampled fields. The
    first stable visible split inside the corrected non-black window
    `2048..2088` is now also closed: `bank2.asm` `L0108EF` stages the
    top-strip OAM slot `oam_0730` from `state_11f3` only when `$1C76 != 0`,
    which matches the rival-only red marker seen in the corrected screenshot
    review pack. That means `state_09a2/state_09a8` are no longer the first
    visible split; they are now secondary post-handoff OAM candidates after
    the already-closed top-strip marker.
    A newer Lane 3 constraint now sharpens the interpretation of this whole
    family: the old no-input and early-input power-on corridors were probably
    crossing short attract/demo gameplay slices, not a clean long-form
    player-controlled gameplay state. That is why the same broad
    `02:9016/01:96A0/02:8F3C` family can appear "menu-like" in some archived
    passes and still hold user-verified live Desert Blast gameplay imagery in
    the preserved manual seeds. The callback family is therefore broader than a
    menu-only label; the real separation sits in internal HUD/OAM/substate
    fields. The bank-1 IRQ half of that bundle is also no longer opaque:
    `01:960D -> 01:96A0 -> 01:97B1/97E1/9809` now reads as a staged
    BG1/BG3/window/color-math visible-split family, while `02:9016` remains
    the bank-2 gameplay-side control gate. The next heavy bank-2 block after
    that gate is also no longer opaque in shape: `L0110B2 -> L011551` reads
    as a generated selector-to-runtime builder that consumes the earlier
    `$1C78/$1C7A/$1C76` collapse and produces deeper gameplay working tables
    like `$14DC/$13FC/$1A28`.
    Direct headless forcing of `01:9568/01:95AD` still does not promote into
    that same corridor: short-force probes keep `active_main` pinned on
    `01:9568/01:95AD` through frame `2199` with no staged callback writes.
13. The current late-gameplay `3250` counterexample now adds an important
    constraint on top of that callback family:
    - the visible BG1 surface there is not fully determined by end-frame
      `VRAM`
    - frame `3250` keeps one active visible descriptor in the `0600` queue
      with bytes `01 b8 b4 15 20 00 80 61`
    - that descriptor now matches the bank-0 table-driven queue-builder family
      rooted at `L001895 / L001A70`
    - the queued source payload closes one step further to a one-tile
      SNES-bank-`$15` object:
      table start `15:B4A8`, payload `15:B4B8`, destination `VRAM 0x6180`
    - in human terms:
      this late gameplay family can still stream small BG1 tile objects during
      the visible gameplay callback corridor, so a flat
      “seed final VRAM and render once” model is not strong enough for every
      promoted lane-3 anchor

## Short Version

If you strip away the assembly details, the proven logic is:

1. Read and mutate menu selectors in WRAM.
2. Refuse to advance until the helper chain says the current selection state is
   valid.
3. Collapse the accepted selectors into one derived content bundle.
4. Split the downstream opponent/time choice into opponent-enabled vs
   no-opponent derived fields before deeper setup.
5. Build VRAM, CGRAM, and OBJ label content from ROM tables and compressed
   sources.
6. Stage OAM in WRAM and let NMI upload it to the PPU.
7. Continue running the current callback family until the later callback
   promotion rules take over.
8. In late gameplay, allow for small queue-backed BG1 tile streams that are
   selected by gameplay callback state and only later uploaded by NMI.

## Open Edges

- the actual front-end car-name text surface is still not located
- the exact organic runtime/HUD divergence between the recovered default-rival
  path (`$1C76 = 1`) and the fourth-slot no-opponent path (`$1C76 = 0`) is
  no longer fully opaque: the first stable visible split is the rival-only
  top-strip OAM marker under `state_11f3 -> oam_0730`, but the reported
  rearview blinking lights and the intermittent `09A2/09A8`-side differences
  are still not fully semantically decoded; a full-rate compare now also shows
  that `2051/2083` do not create any extra whole-frame or adjacent-frame
  visible pulse inside `2048..2088`, while a tighter first-frame compare shows
  the first rival-only blink cue is concentrated in top-right bbox
  `(180, 11, 194, 19)` on rival `2048->2049` with no matching change in the
  no-opponent lane; that gives the next trace a much smaller target even
  though the exact state/OAM binding is still open
- the remaining front-end/gameplay bridge problem is no longer late confirm;
  it is assigning meaning and visible ownership to the narrowed post-handoff
  deltas, especially `state_09a2/state_09a8` and the paired DP scratch fields,
  after both paths have already converged to the shared `02:9016/02:8F3C`
  corridor
- the generated runtime surfaces coming out of `L011551`
  (`$14DC/$13FC/$1A28`) now have a strong control read but still need
  semantic naming
- the `3250` late-entry producer path is no longer opaque at the object side:
  the transient upload now closes to the SNES-bank-`$15` object
  `15:B4A8 -> 15:B4B8 -> VRAM 0x6180`,
  and the bank-1 IRQ half now reads as the visible split lane,
  but the gameplay-side selector path that arms that pair and chooses the
  transient object inside `02:9016` is still not fully resolved
- late attract producer scheduling after `1133` is materially narrowed, but the
  native replacement schedule is still a live archaeology target
