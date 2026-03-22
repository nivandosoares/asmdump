# `SNESdev Wiki` Knowledge Bank

Scope:

- external reference surveyed from `https://snes.nesdev.org/wiki/SNESdev_Wiki`
- recursively followed the main index into the first-layer reference/guides
  pages most relevant to the current port/archeology workflow
- followed one second-layer Mode 7 page (`Mode 7 transform`) because the main
  page only links the effect gallery

Method:

- prioritize pages that answer:
  - who writes what
  - where it is written (`WRAM/VRAM/CGRAM/OAM/MMIO`)
  - when it is safe to write it (`VBlank/HBlank/Force Blank`)
  - which register protocol is in play (`write-twice`, `VMAIN`, DMA/HDMA)
- classify references by direct usefulness to the active lanes instead of by
  completeness of hardware coverage

This note is a process reference, not project ground truth. Use it to interpret
probes, dumps, and renderer behavior; do not replace game-specific evidence
with generic hardware expectations.

## High-Value Pages

- `Memory map`
  - URL: `https://snes.nesdev.org/wiki/Memory_map`
  - Why it matters:
    - clarifies LoROM/HiROM/ExHiROM bank layout and the fact that WRAM and I/O
      mirrors coexist with cart mapping
    - useful when reconciling ROM offsets, CPU-visible addresses, and tool
      outputs
  - Lane relevance:
    - Lane 1: moderate
    - Lane 2: moderate
    - Lane 4: high

- `ROM header`
  - URL: `https://snes.nesdev.org/wiki/ROM_header`
  - Why it matters:
    - explains map-mode/header placement and checksum rules
    - useful when validating ROM organization assumptions and any future
      rebuild/export path
  - Lane relevance:
    - Lane 1: moderate
    - Lane 4: moderate

- `CPU vectors`
  - URL: `https://snes.nesdev.org/wiki/CPU_vectors`
  - Why it matters:
    - concise reference for `RESET`, `NMI`, and `IRQ` vector locations in bank
      `00`
    - supports scheduler and interrupt reading in bank 0
  - Lane relevance:
    - Lane 4: moderate

- `MMIO registers`
  - URL: `https://snes.nesdev.org/wiki/MMIO_registers`
  - Why it matters:
    - central map for `NMITIMEN`, `HVBJOY`, `JOY1..4`, `MEMSEL`, `JOYOUT`,
      `JOYSER0/1`, `RDNMI`, `TIMEUP`
    - the `NMITIMEN` and `HVBJOY` details align directly with our probe and
      headless validation assumptions
  - Lane relevance:
    - Lane 2: high
    - Lane 3: moderate
    - Lane 4: high

- `PPU registers`
  - URL: `https://snes.nesdev.org/wiki/PPU_registers`
  - Why it matters:
    - authoritative bit-level reference for `BGMODE`, `BGxSC`, `BG12NBA`,
      `VMADD`, `VMDATA`, `CGADD`, `CGDATA`, `OAMADD`, `OAMDATA`, `TM/TS`,
      `SETINI`, `M7SEL`, `M7A-D`
    - directly useful for render correctness, dump interpretation, and
      per-scanline Mode 7 reasoning
  - Lane relevance:
    - Lane 2: very high
    - Port renderer: very high
    - Lane 4: moderate

- `DMA registers`
  - URL: `https://snes.nesdev.org/wiki/DMA_registers`
  - Why it matters:
    - direct reference for `DMAPn`, `BBADn`, `A1Tn`, `DASn`, `MDMAEN`,
      `HDMAEN`
    - gives the clean hardware vocabulary behind our WRAM queue and upload
      archaeology
  - Lane relevance:
    - Lane 2: very high
    - Lane 4: high

- `Reading and writing PPU memory`
  - URL: `https://snes.nesdev.org/wiki/Reading_and_writing_PPU_memory`
  - Why it matters:
    - one of the most practical pages in the whole survey
    - spells out safe access windows and the write/read-twice behavior for
      `CGRAM` and `OAM`
    - documents `VMAIN` usage for different VRAM access patterns
    - explicitly recommends a `544`-byte WRAM OAM buffer
  - Lane relevance:
    - Lane 2: very high
    - Port renderer/runtime I/O: very high

- `VBlank interrupts`
  - URL: `https://snes.nesdev.org/wiki/VBlank_interrupts`
  - Why it matters:
    - cleanly frames NMI as the boundary between main-loop state production and
      PPU consumption
    - matches our callback/state-contract mindset
  - Lane relevance:
    - Lane 2: high
    - Lane 4: high

- `VBlank routine`
  - URL: `https://snes.nesdev.org/wiki/VBlank_routine`
  - Why it matters:
    - probably the single best conceptual bridge to our repo
    - formalizes `shadow variables`, `buffers`, and `queues` as first-class
      producer/consumer patterns
    - maps directly onto our `0600` DMA queue work and the visual-contract
      separation between state preparation and actual PPU writes
  - Lane relevance:
    - Lane 2: very high
    - Lane 4: high

- `DMA examples`
  - URL: `https://snes.nesdev.org/wiki/DMA_examples`
  - Why it matters:
    - executable register-level reference for real upload patterns
    - especially useful when we need to explain a queue entry as a concrete
      `A-bus -> B-bus` transfer
  - Lane relevance:
    - Lane 2: high

- `HDMA examples`
  - URL: `https://snes.nesdev.org/wiki/HDMA_examples`
  - Why it matters:
    - strongest general reference for per-scanline state changes
    - explains table structure, indirect mode, and VBlank-time table updates
    - directly relevant for late attract/gameplay scanline archaeology
  - Lane relevance:
    - Lane 2: moderate
    - Lane 3: high
    - Port renderer: moderate

- `Backgrounds`
  - URL: `https://snes.nesdev.org/wiki/Backgrounds`
  - Why it matters:
    - concise mode matrix and layer priority view, including Mode 7 placement
    - useful when checking whether a scene model is even plausible before
      blaming the renderer
  - Lane relevance:
    - Lane 2: high
    - Port renderer: high

- `Tilemaps`
  - URL: `https://snes.nesdev.org/wiki/Tilemaps`
  - Why it matters:
    - exact tilemap word layout:
      - tile index
      - palette selection
      - priority
      - flip bits
    - this is directly actionable for our tilemap-to-ROM provenance lane
  - Lane relevance:
    - Lane 2: very high

- `Tiles`
  - URL: `https://snes.nesdev.org/wiki/Tiles`
  - Why it matters:
    - clarifies `2bpp/4bpp/8bpp` and Mode 7 tile layouts
    - useful when validating tileset decodes and renderer assumptions
  - Lane relevance:
    - Lane 2: high
    - Port renderer: high

- `Sprites`
  - URL: `https://snes.nesdev.org/wiki/Sprites`
  - Why it matters:
    - documents OBJ VRAM/palette selection and the real scanline limits:
      `32` sprites per line and `34` slivers per line
    - this is exactly the kind of constraint that can explain scene mismatch
      even when OAM bytes look superficially correct
  - Lane relevance:
    - Lane 2: high
    - Port renderer: very high

- `Palettes`
  - URL: `https://snes.nesdev.org/wiki/Palettes`
  - Why it matters:
    - concise CGRAM color model refresher
    - supports palette animation and fixed-color reasoning
  - Lane relevance:
    - Lane 2: moderate
    - Port renderer: high

- `Color math`
  - URL: `https://snes.nesdev.org/wiki/Color_math`
  - Why it matters:
    - especially relevant to horizon/fade behavior in Mode 7 scenes
    - the additive-horizon example maps well to the class of effects we may
      eventually need for track/gameplay presentation
  - Lane relevance:
    - Lane 2: moderate
    - Lane 3: moderate
    - Port renderer: moderate

- `Mode 7 transform`
  - URL: `https://snes.nesdev.org/wiki/Mode_7_transform`
  - Why it matters:
    - the most directly useful Mode 7 page in the survey
    - states the transform model clearly and explicitly calls out scanline-wise
      HDMA variation
  - Lane relevance:
    - Lane 2: high
    - Lane 3: moderate
    - Port renderer: high

- `Controller reading`
  - URL: `https://snes.nesdev.org/wiki/Controller_reading`
  - Why it matters:
    - useful for probe correctness and gameplay harnesses
    - explains the small timing window around auto-read start and the expected
      `HVBJOY` / `JOY1` usage
  - Lane relevance:
    - Lane 3: high
    - validation harnesses: high

- `Standard controller`
  - URL: `https://snes.nesdev.org/wiki/Standard_controller`
  - Why it matters:
    - compact bit layout reference for `JOY1`
    - useful when double-checking trace decoding or manual test scripting
  - Lane relevance:
    - Lane 3: moderate

## Highest-Value Knowledge Extracted

### 1. The wiki confirms our current producer/consumer model

The strongest process fit is not any single register page. It is the combined
picture from:

- `VBlank interrupts`
- `VBlank routine`
- `DMA examples`
- `Reading and writing PPU memory`

The SNESdev pattern is:

- gameplay/main-loop prepares state
- state lands in shadow variables, buffers, or queues
- NMI/VBlank consumes that state and performs PPU-visible writes

That matches this repo's current archaeology architecture unusually well:

- frame probes describe observed state
- visual contracts separate BG/CHR state from OBJ/OAM state
- queue archaeology tries to explain the handoff between staged WRAM data and
  actual PPU uploads

Practical implication:

- keep reasoning in terms of:
  - producer-side state preparation
  - bounded upload windows
  - consumer-side PPU writes
- do not collapse all late-frame differences into "renderer bug" or "wrong
  asset" too early

### 2. `write-twice` semantics are first-class, not edge trivia

The wiki is explicit that:

- `CGDATA` is write-twice
- `OAMDATA` must be treated as write-twice
- multiple register families carry internal latches
- `VMAIN` controls VRAM access shape and increment timing

Practical implication for this repo:

- any tool or runtime path that treats `CGRAM/OAM/Mode 7` register traffic as
  bytewise without latch semantics is at risk of subtle false mismatches
- this especially matters when interpreting partial traces or reconstructing
  upload order from bounded windows

### 3. OAM correctness is more than "same 544 bytes"

The `Sprites` and `PPU registers` pages reinforce that sprite output depends on:

- OAM contents
- OBJSEL base/size configuration
- scanline limits (`32` sprites, `34` slivers)
- optional priority rotation via `OAMADD`

Practical implication:

- late-scene or gameplay mismatches can survive identical-looking OAM data if
  sprite evaluation constraints differ
- renderer comparisons should keep explicit hooks for:
  - OBJSEL
  - OAM priority rotation
  - scanline clipping/overflow behavior

### 4. `Tilemap -> CHR base -> palette/priority/flip` should remain explicit

The `Tilemaps`, `Tiles`, `Backgrounds`, and `PPU registers` pages collectively
give the exact hardware vocabulary behind our Lane 2 provenance work:

- tile index
- palette select
- priority bit
- flip bits
- CHR base via `BG12NBA/BG34NBA`
- mode-dependent bit depth and layer ordering

Practical implication:

- our provenance and visual-contract artifacts should continue to keep these
  axes explicit instead of flattening them into a single "tile source" label

### 5. Mode 7 must be treated as a transform plus optional scanline modulation

The `Mode 7 transform`, `PPU registers`, `HDMA examples`, and `Color math`
pages give a good generic model for the class of scenes we keep touching:

- base affine transform from `M7A-D`, `M7HOFS`, `M7VOFS`, center registers
- optional scanline-wise variation via HDMA
- optional color-math horizon/fade effects via fixed color and HDMA

Practical implication:

- for our process, the right question is often not "is the matrix wrong?"
- it is:
  - is the base matrix wrong?
  - is there a per-scanline modulation we are not modeling?
  - is there a color-math/fixed-color contribution hiding in the final screen?

## What Helps The Current Process Most

### Immediate help

- `VBlank routine`
  - directly informs our queue archaeology vocabulary
- `Reading and writing PPU memory`
  - directly informs interpretation of bounded PPU access windows
- `PPU registers`
  - directly informs renderer and dump semantics
- `Tilemaps`
  - directly informs provenance labels
- `Sprites`
  - directly informs OAM mismatch triage

### Medium-term help

- `HDMA examples`
  - useful when scanline archaeology expands further
- `Color math`
  - useful if final-screen gaps turn out not to be plain geometry/state issues
- `Mode 7 transform`
  - useful for formalizing our Mode 7 model beyond current ad hoc field names

### Lower immediate value

- pinouts
- sound pages
- cartridge connector details
- coprocessor pages unrelated to the current game
- generic tutorial pages

These are not bad references. They simply do not move the active gates as much
as PPU/DMA/VBlank/OAM/Mode 7 material.

## Concrete Repo-Level Takeaways

1. Keep the current plan intact.
   - The wiki supports the current strategy of extraction + validation +
     reimplementation. It does not suggest a plan pivot.

2. Promote `queue/buffer/shadow-variable` vocabulary in archaeology docs.
   - The SNESdev pages show that this vocabulary is hardware-native and is a
     better mental model than treating every frame difference as a monolithic
     callback effect.

3. Keep `producerTrace` and visual-contract separation explicit.
   - The wiki strongly validates the split between producer-side intent and
     actual PPU-visible traffic.

4. Treat OAM and Mode 7 as protocol surfaces, not just memory dumps.
   - `write-twice`, rotation, overflow, access windows, and scanline-time
     modulation all matter.

5. Use the wiki to narrow hypotheses, not to "prove" game-specific behavior.
   - If a hardware page contradicts a current assumption, that is a reason to
     probe the game more carefully, not to overwrite the game's observed
     behavior.

## Suggested Reuse In Future Work

- Lane 2:
  - use this note while formalizing later-window upload ownership and any
    first-class transfer schema
- Lane 3:
  - use `Controller reading`, `HVBJOY`, and `HDMA examples` when scanline/input
    timing becomes the active blocker again
- Lane 4:
  - use the `VBlank interrupts` / `VBlank routine` model to describe
    bank-to-bank contracts as producers/consumers around NMI-visible surfaces
- Port runtime:
  - keep the renderer honest about:
    - tilemap word semantics
    - CHR base pages
    - sprite per-line limits
    - OAM access/protocol semantics
    - Mode 7 matrix and potential scanline modulation
