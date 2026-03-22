# `DOOM-FX` Reference Note

Repository analyzed locally in an ignored workspace:

- clone: `.external/DOOM-FX`
- source repo: `https://github.com/RandalLinden/DOOM-FX`

## Executive Reading

`DOOM-FX` is useful as a historical SNES production reference, but it is not a
good template for "write the game in portable C and then ship it on SNES."

The repo is mostly:

- `65816` assembly for SNES-side orchestration
- `GSU/Super FX` assembly for the heavy renderer/gameplay phases
- Amiga-era offline tools and scripts
- a small amount of C used mainly for table generation and content processing

That means the main value for `asmdump` is architectural, not translational.

## What The Repo Actually Contains

There is no modern `README` or portable build entrypoint. The top level is
mostly:

- `source/`: runtime code, data, generated tables, and engine banks
- `make/`: shell/REXX helpers that drive the original build flow
- `convert/` and `binaries/`: historical conversion tools and utilities
- `docs/sfx.guide`: a Super FX command/register reference
- `source/ripdoom.txt`: command-line notes for the WAD ripping tool

The file makeup is strongly biased toward assembly:

- counted from `source/`:
  - `.i`: `189`
  - `.a`: `167`
  - `.rev`: `161`
  - `.asm`: `59`
  - `.c`: `8`
- the small set of `.c` files are offline generators like:
  - `mkray.c`
  - `mksec.c`
  - `mktan.c`
  - `mkrlpixscale.c`

Those C programs emit `dc.w`/`dc.l` tables; they are not the gameplay/runtime.

## The Important Runtime Pattern

The strongest reusable idea in `DOOM-FX` is the explicit split between:

1. offline content/table generation
2. SNES orchestration on `65816`
3. accelerator-heavy execution on `GSU`
4. explicit data transfer and phase boundaries between those worlds

Three files make this especially clear:

- `source/rlgsu.a`
  - defines an explicit GSU phase scheduler
  - phases are data-driven through tables like `GSUPhaseR15`,
    `GSUPhaseReqCode`, and `GSUPhasePostCode`
- `source/rlirq.a`
  - advances those phases from IRQ context
  - swaps state blocks between SNES WRAM and GSU RAM
- `source/rlram1.a` and `source/rlram7.a`
  - define mirrored variable blocks:
    - `RLSNESXVars`
    - `RLSNESGSUXVars`
    - `RLGSUSNESXVars`

This is effectively a machine-readable contract between processors.

The runtime is also not just "raw assembly everywhere"; it is assembly organized
around reusable descriptors. For example:

- `source/title.a`
  - calls `XFer` on `TitleXFer` before programming the PPU state
- `source/rlstatus.a`
  - defines `StatusBarXFer` with mixed `xftVRAM16`, `xftVRAMF16+xftRAW`, and
    `xftRAM` records
- `source/rldraw.a`
  - enters `SECTION ENGINE_GSUCODE` with `cpu sfx`, which makes the renderer
    dependency on Super FX explicit rather than hidden behind C wrappers

For `asmdump`, that is a strong confirmation that our callback/state-contract
direction is correct. The contract is the important artifact, not a
source-level translation.

## The Most Transferable Idea: A Transfer IR

The single most useful piece for us is `source/xfer.i` plus `source/xfer.a`.

That pair defines a compact transfer structure with:

- transfer type
- source address
- destination address
- length / fill / mask fields
- flags for:
  - raw vs compressed
  - no-data records
  - end markers

And the executor supports multiple targets:

- RAM
- VRAM
- CGRAM
- fill/mask variants
- code execution records

This is very close in spirit to what `asmdump` needs for the intro/bootstrap
and later native-scene work:

- a neutral representation of "what got uploaded where"
- separate from the final renderer
- usable by tools, validators, and the SDL runtime

This is more valuable to us than any individual rendering trick in `DOOM-FX`.

## Why It Helps `asmdump`

`DOOM-FX` reinforces several current choices in this repo:

### 1. Reimplementation is the right strategy

The repo is not a clean decompilation target. Even when source exists, the
important behavior is split across:

- assembly modules
- hardware-specific interrupts
- transfer lists
- mirrored memory contracts
- accelerator-specific code

That matches the logic in `PORT_PLAN.md`: the shippable path is stable data +
verified behavior + native runtime, not literal source translation.

### 2. Offline tooling should stay first-class

The C code in `DOOM-FX` mostly exists to generate tables and preprocess assets.
That is a useful precedent for our own split:

- Python/C tools for extraction and normalization
- SDL runtime for playback/reimplementation

It argues against collapsing the tooling layer into the runtime too early.

### 3. Contracts matter more than filenames

The mirrored SNES/GSU blocks are a strong example of explicit ownership:

- what the producer writes
- what the consumer reads
- where the synchronization boundary is

That is directly relevant to:

- Lane 2 visual contracts
- Lane 4 bank API contracts

### 4. Phase tables beat implicit control flow

`GSUPhaseR15` / `ReqCode` / `PostCode` give a formal phase model for a frame.
That suggests a useful direction for our own later archaeology:

- model callback families as named phases with:
  - entry condition
  - required state
  - produced side effects
  - next phase

That would be more stable than reasoning only from raw addresses and frame
numbers.

## What Does Not Transfer Well

Several parts are not good templates for us:

### 1. It is not a portable C gameplay codebase

If the question is "can we copy a C SNES engine pattern from here?", the
answer is mostly no. The runtime core is not portable C.

### 2. It is tightly coupled to Super FX

Large parts of the renderer/game loop are written in GSU assembly and depend on:

- cache-block layout
- GSU register discipline
- phase IRQ handoff
- SNES/GSU shared RAM layout

That is historically interesting, but it does not map directly to our SDL port.

### 3. The original build pipeline is historically specific

The `make/*.rex`, shell fragments, and binary converters are valuable as
evidence of workflow, but not as something we should adopt directly.

## Practical Takeaways For `asmdump`

The best concrete follow-ups are:

1. Promote a first-class transfer schema.
   - cover `RAM`, `VRAM`, `CGRAM`, `OAM`, fill/mask, raw/compressed, and code hooks
   - make it consumable by both tooling and the SDL runtime

2. Formalize shared-state contracts.
   - model bank/callback-family boundaries the way `DOOM-FX` models
     SNES/GSU exchange blocks

3. Add phase vocabulary above raw callbacks.
   - use named phases with preconditions/postconditions for late intro windows
     and eventually gameplay lanes

4. Keep offline generators separate from runtime code.
   - `DOOM-FX` is a good precedent for "precompute aggressively, keep runtime
     lean"

5. Do not treat `DOOM-FX` as a decompilation shortcut.
   - it is a reference for dataflow and contracts, not for code reuse

## Bottom Line

`DOOM-FX` does help, but indirectly.

It does **not** give us a reusable C SNES engine for `Test Drive II`.
What it gives us is a strong existence proof that serious SNES codebases were
structured around:

- explicit phase scheduling
- explicit transfer descriptors
- explicit shared-memory contracts
- heavy offline preprocessing

Those are exactly the kinds of artifacts `asmdump` should keep promoting.
