# Bank 1 Boot Flow Notes

## Scope

This document tracks the post-RESET handoff from bank 0 into bank 1, centered on `L008B26`.

The goal is to identify concrete boot/setup behavior that can be ported or extracted, especially PPU and palette setup.

## Entry From RESET

Bank 0 finishes hardware initialization and jumps long to `L008B26` in bank 1.

Observed shape:

1. `L008B26` clears `$1E2C` and calls `L009D1C`.
2. It enters a selection loop through `L009C3E`, `L00BAE8`, `L00BBCB`, `L00C20B`, and `L00BE76`.
3. That loop appears to resolve configuration or menu state into fields like `$1C6C`, `$1C70`, `$1C78`, `$1C7A`, `$1C7C`, and `$1C90`.
4. Once those indices are stable, the flow derives a set of table-driven pointers and enters `L008CA2`.

Working interpretation:

- `L008B26` is not gameplay proper.
- It looks like early front-end or scenario setup that chooses a content bundle and then materializes the screen from tables.

## Table-Driven Setup Before `L008CA2`

Before the main screen build starts, the routine derives several table-backed fields:

- `$1C92-$1C9A` from table `01:85F6`
- `$1C7E/$1C80` from table `01:8000`
- `$1CAC/$1CCA/$1CFA/$1CAA/$1CE2/$1CE4/$1CE6/...` from table families `01:8016` through `01:8330`

These look like a compact content descriptor for the selected boot/title state:

- tilemap sources
- palette source selectors
- optional secondary overlays or windows
- metadata that later controls BG layout and sprite/theme selection

## `L008CA2`: PPU Setup And Asset Upload

`L008CA2` is the clearest “build a screen” stage in this path.

It performs:

1. `jsl L00050F` to reset video/DMA state.
2. Programs the PPU for a multi-BG scene:
   - `BGMODE = $21`
   - `BG1SC = $01`
   - `BG2SC = $0B`
   - `BG3SC = $19`
   - `BG12NBA = $23`
   - `BG34NBA = $35`
   - `TMAIN = $17`
   - `OBJSEL = $03`
3. Computes additional selectors in `$1D1C` and `$1CAE` from `$1CE2/$1CE4/$1CE6`.
4. Branches on `$1CEA` to choose one of two window/subscreen setups.

From there it starts uploading tilemaps, character data, and palettes through the common bank 0 helpers.

## Screen-Build Jobs Confirmed

The current manifest in `tools/out/bank1_boot_screen.json` resolves these concrete upload groups:

- paged VRAM uploads from bank `09` through `L0005AC`
- a large raw DMA block from bank `08` through `L0006C9`
- mixed bank `17/19/06` uploads into low VRAM and VRAM `0x3000`
- compressed bank `07` groups routed through `L001210`
- three small local bank `01` tilemap patches near VRAM `0x60B0`

The compressed bank `07` jobs split into:

- group A: `42FB` chunks, then `L0005AC`
- group B: `26FB` tables selected into WRAM and then copied to VRAM `0x5000`
- optional overlay: compressed block at `0D:EFDE` copied to VRAM `0x4D00` when `$1CE6 != 0`

This is enough to treat `L008CA2` as a reproducible asset build script rather than a loose blob of setup code.

## Partial VRAM Snapshot

`tools/build_boot_vram.py` now turns the current manifest into a partial VRAM image for variant `0`.

What is already applied:

- `bank9_boot_vram_pages` through the `L0005AC` page-layout rules
- `bank8_bulk_vram_block` through `L0006C9`
- `mixed_page_uploads_to_vram_0000`
- `mixed_bulk_uploads_to_vram_3000`
- `compressed_bank7_group_a` after `42FB` decompression
- `compressed_bank7_group_b` after `26FB` decompression
- `local_bank1_tilemap_patches`, using the observed default selector values `$1C78 = 1` and `$1C7A = 0`

What is still missing from that preview:

- the optional `0D:EFDE` overlay unless the snapshot is built with `--apply-optional-overlay`
- no remaining gaps on the main path besides the optional overlay

Artifacts:

- `tools/out/bank1_boot_vram_variant0.bin`: 64 KB partial VRAM snapshot
- `tools/out/bank1_boot_vram_variant0.json`: job-level summary of what was applied or skipped
- `tools/out/bank1_boot_vram_variant0_4bpp.ppm`: sequential 4bpp preview of the first `0xC000` bytes
- `tools/out/bank1_boot_vram_variant0_overlay.bin`: same snapshot with the optional `0D:EFDE` overlay forced on
- `tools/out/bank1_boot_vram_variant0_overlay.json`: summary for the overlay-enabled build

The current defaults for the local patch selectors come from two sources that agree:

- static flow: `L008B26` seeds `$1C78` with `1`, and the default path through `L008B87` leaves `$1C7A` at `0`
- runtime probe: `validation/mesen_probe_boot.lua` observed `$1C78 = 1` and `$1C7A = 0` stabilizing early on the no-savestate boot path

## Palette Loads Confirmed In This Flow

The palette helper `L000583` is used repeatedly here.

Confirmed uploads:

- `CGRAM 0x00`, `32` colors:
  - source pointers come from bank 1 table `01:8588`
  - source bank is hard-coded to bank `06`
- `CGRAM 0x90`, `16` colors:
  - source bundle comes from table `01:8364`
- `CGRAM 0xA0`, `16` colors:
  - source bundle comes from table `01:8384`
- `CGRAM 0xB0`, `0xC0`, `0xD0`, each `16` colors:
  - source pairs come from the shared table rooted at `01:836C`

Implication for the port:

- boot/title palette data is not centralized in bank 3 on this path
- at least this setup sequence pulls palette payloads from banks `06`, `11`, and `1F`
- palette extraction needs to follow actual call sites and tables, not only bank-level categorization

## Existing Tooling Hook

`tools/extract_boot_palette_manifest.py` now dumps these known boot-time palette tables into JSON.

`tools/extract_boot_screen_manifest.py` now dumps the matching `L008CA2` VRAM/CGRAM upload plan, including:

- direct DMA blocks
- paged VRAM uploads
- compressed `bank7` sources routed through `L001210`
- local `bank1` tilemap patches
- the IRQ/main/NMI callbacks installed at the end of setup

That manifest is intended to feed two later steps:

- validation of extracted palette blocks against captured frames
- a future SDL-side named palette loader instead of the current sequential `bank3` chunks

## Post-Setup Dispatcher

After the initial build and callback installation, control settles into the loop starting near `L009111`.

Observed structure:

- `L009111` mirrors state like `$1CBE -> $1CC0`, submits UI/event handlers through `L002212`, and conditionally queues an overlay DMA with `L0006ED`
- `L0091E1` acts as the main post-setup dispatcher
- if `$0996 != 0`, the code tears the scene down and jumps back to `L008B2E`
- if the current result code is `0xFFFF`, it tears down and jumps back to `L008B31`
- result codes `0x0001` and `0x0002` jump directly to `L0093A6`
- other result codes pass through `L00924B`, which either waits for an animation/transition to settle or enters the heavier setup at `L0092D1`

`L0092D1` looks like the transition from front-end screen into the next interactive state:

- enqueues a DMA command via `L000715`
- seeds timing and camera-like fields such as `$12A7`, `$11DF`, `$1C9C`, `$1CA2-$1CA6`
- clears/initializes arrays at `$117D+`
- updates `$1CC2` from the current content selector

Working interpretation:

- `L008CA2` builds the front-end screen
- `L009111` / `L0091E1` form the active state loop for that screen
- `L0092D1` is the main "advance out of the boot/title setup" path
- `L0093A6` is a common follow-on path used both by direct result codes and by the transition route
