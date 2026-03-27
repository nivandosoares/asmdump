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
   - `$0202/$1C78` drives the `3`-slot car-facing preview domain
   - `$1C7C` drives the `4`-slot top-level phase domain
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
    - rows `0x15..0x1B` are control/sound settings labels
    - the actual car-name text surface has not been located yet
12. After the front-end bundle is accepted and built, the strongest currently
    proven gameplay-facing corridor is still the bank-1 path that stages
    `02:9016` (main) and `02:8F3C` (NMI) at `01:902D..01:9034`. That corridor
    is real, but direct headless forcing of `01:9568/01:95AD` does not yet
    promote into it: short-force probes still pin `active_main` on
    `01:9568/01:95AD` through frame `2199` with no staged callback writes.

## Short Version

If you strip away the assembly details, the proven logic is:

1. Read and mutate menu selectors in WRAM.
2. Refuse to advance until the helper chain says the current selection state is
   valid.
3. Collapse the accepted selectors into one derived content bundle.
4. Build VRAM, CGRAM, and OBJ label content from ROM tables and compressed
   sources.
5. Stage OAM in WRAM and let NMI upload it to the PPU.
6. Continue running the current callback family until the later callback
   promotion rules take over.

## Open Edges

- the actual front-end car-name text surface is still not located
- the exact organic callback-promotion timing into the `02:9016/02:8F3C`
  gameplay lane is still not closed
- late attract producer scheduling after `1133` is materially narrowed, but the
  native replacement schedule is still a live archaeology target
