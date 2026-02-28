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
- three small local bank `01` patches near VRAM `0x60B0`

The compressed bank `07` jobs split into:

- group A: `42FB` chunks, then `L0005AC`
- group B: `26FB` tables selected into WRAM and then copied to VRAM `0x5000`
- optional overlay: compressed block at `0D:EFDE` copied to VRAM `0x4D00` when `$1CE6 != 0`

This is enough to treat `L008CA2` as a reproducible asset build script rather than a loose blob of setup code.

## Partial VRAM Snapshot

`tools/build_boot_vram.py` now turns the current manifest into a partial VRAM image for variant `0`.
It no longer selects jobs by raw manifest index. Instead it models the bank 1 state-table path first and then uses the same selectors that `L008CA2` uses at runtime.

What is already applied:

- `bank9_boot_vram_pages` through the `L0005AC` page-layout rules, selected by `$1CCA`
- `bank8_bulk_vram_block` through `L0006C9`, selected by `$1CCA`
- `mixed_page_uploads_to_vram_0000`, selected by `$1C78`
- `mixed_bulk_uploads_to_vram_3000`, selected by `$1C78`
- `compressed_bank7_group_a` after `42FB` decompression, selected by `$1CAC` or forced to entry `8` on the negative-layout path
- `compressed_bank7_group_b` after `26FB` decompression, selected by the same rule as group A
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

For the current state-0 path, the modeled selectors resolve to:

- `$1CAC = 7`
- `$1CCA = 0`
- `$1CEA = 0`
- `$1C78 = 1`
- `$1C7A = 0`

That means the current main-path VRAM reconstruction is not "all entry 0":

- `bank9_boot_vram_pages`: entry `0`, VRAM base `0x0800`
- `bank8_bulk_vram_block`: entry `0`
- `mixed_page_uploads_to_vram_0000`: entry `1`
- `mixed_bulk_uploads_to_vram_3000`: entry `1`
- `compressed_bank7_group_a`: entry `7`
- `compressed_bank7_group_b`: entry `7`

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
- only `CGRAM 0x00-0x1F` feeds BG palettes; the `0x90+` uploads land in OBJ palette space

## BG Preview Renderer

`tools/render_boot_screen.py` now uses:

- the rebuilt boot VRAM snapshot
- the structured boot palette manifest
- the same state-table model used by `tools/build_boot_vram.py`

It currently renders a BG-only `256x224` preview by composing:

- BG2 as a 4bpp base layer
- BG1 as a 4bpp middle layer
- BG3 as a 2bpp top layer

Current limitations:

- OAM is not decoded yet
- sprite palettes at `CGRAM 0x90+` are tracked, but not drawn
- the local bank `01` patches near VRAM `0x60B0` are still not fully classified

One useful negative result is already confirmed:

- forcing the optional `0D:EFDE` overlay currently produces a byte-identical BG-only preview
- that strongly suggests the overlay is either OBJ-facing, outside the visible BG viewport, or dependent on state the current renderer does not model yet

Another important separation is now confirmed by Mesen capture:

- on pure power-on, frame `300` (`5` seconds at `60 Hz`) is already the colored copyright/credits scene
- the captured reference frame lives at `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png`
- the tracked bank 1 selectors are still the trivial early values on that frame, with `$1C78 = 1`, `$1C7A = 0`, and the richer `$1CAC/$1CCA/$1CE*` family still `0`
- comparing that frame against `tools/out/bank1_boot_screen_variant0.ppm` gives `85.886928%` pixel mismatch

Working interpretation:

- the current `L008CA2` reconstruction is useful, but it is not the same front-end state as the `5`-second colored-text scene
- there is at least one later front-end step between the current modeled boot build and the scene the player sees after a short idle power-on

## Frame-300 Credits Scene

The frame-`300` copyright/credits scene is now reverse-engineered far enough to be a real validation target instead of a screenshot-only reference.

Using:

- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_vram.bin`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_cgram.bin`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_ppu_state.json`

`tools/render_mesen_snes_bg.py` reproduces the screenshot exactly:

- `tools/out/mesen_poweron_5s_bg_only.ppm`
- `tools/out/mesen_poweron_5s_bg_only.json`
- comparison against `td2_boot_probe_frame.png`: `0` mismatched pixels

Important live PPU state on that frame:

- `ppu.bgMode = 1`
- `ppu.mainScreenLayers = 0x04`
- raw layer state:
  - `ppu.layers[0].tilemapAddress = 0`
  - `ppu.layers[1].tilemapAddress = 2048`
  - `ppu.layers[2].tilemapAddress = 4096`
  - `ppu.layers[0].chrAddress = 8192`
  - `ppu.layers[1].chrAddress = 16384`
  - `ppu.layers[2].chrAddress = 24576`

For this specific scene, the raw dumped `vscroll = 1023` behaves like an effective visible scroll of `0`.
That normalization is built into `tools/render_mesen_snes_bg.py`.

The practical conclusion is that the colored copyright/credits scene is BG-driven and already fully recoverable from live VRAM/CGRAM/state without needing OAM reconstruction.

## Confirmed Copyright/Credits Builder

`L009D1C` is now confirmed as a sufficient ROM-side builder for the frame-`300` colored copyright/credits scene.

Proof path:

- it calls `jsl L00050F` and `jsl L000819`
- it then forces `TMAIN = $04`, which matches the live single-layer main-screen output
- it calls the helper trio with index `0`:
  - `jsr L00A9A0` with `A = 0`
  - `jsr L00A9CB` with `A = 0`
  - `jsr L00A9F2` with `A = 0`

Helper entry `0` currently decodes as:

- `L00A9A0(0)`:
  - compressed source pointer `04:8000`
  - VRAM page base shadow `$0990 = 0x1000`
- `L00A9CB(0)`:
  - compressed source pointer `02:F51F`
  - VRAM destination `0x6000`
- `L00A9F2(0)`:
  - palette source pointer `02:FBD1`
  - CGRAM destination `0x00`
  - color count low byte `0x20`

The ROM-driven builder now reconstructs the scene exactly:

- `tools/build_bank1_credits_scene.py`
- `tools/out/bank1_credits_scene_vram.bin`
- `tools/out/bank1_credits_scene_cgram.bin`
- `tools/out/bank1_credits_scene_ppu_state.json`
- `tools/out/bank1_credits_scene.ppm`
- compare against `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png`: `0` mismatched pixels

Important implementation detail:

- `L00A9CB(0)` uses a `42FB` chunk through `L0006C9`, not through `L0005AC`
- the shared tooling now accepts `42FB` on the `L0006C9` path so this scene can be rebuilt from ROM without ad hoc scripts

Artifacts:

- `tools/out/bank1_boot_screen_variant0.ppm`
- `tools/out/bank1_boot_screen_variant0.json`
- `tools/out/bank1_boot_screen_variant0_overlay.ppm`
- `tools/out/bank1_boot_screen_variant0_overlay.json`
- `tools/out/bank1_credits_scene.ppm`
- `tools/out/bank1_credits_scene.json`

## Next Front-End Signatures

Longer no-input power-on probing now gives two strong routine signatures after the frame-`300` credits scene:

- frame `900`:
  - `ppu.bgMode = 1`
  - `ppu.mainScreenLayers = 0x01`
  - this matches `L00A35A`, which reuses `L000819`, forces `TMAIN = $01`, and calls the helper trio with index `4`
  - probe evidence is now stronger than a visual guess:
    - active main callback is `01:A39C`, the callback staged by `L00A35A`
    - `$20 = 8` on the sampled frame, which means the scene is already inside the follow-up animation path under that callback
- frame `1200`:
  - `ppu.bgMode = 7`
  - `ppu.mainScreenLayers = 0x11`
  - `ppu.mode7.centerX = 128`
  - `ppu.mode7.centerY = 112`
  - this matches `L00A00C`, which switches into Mode 7 and sets `TMAIN = $11`
  - on the sampled frame, the active main callback has already fallen back to bank 0 idle `00:8029`

Current practical reading:

- `L009C3E` is now strongly supported as the post-credits attract loop:
  - `L00A35A`
  - `L00A00C`
  - `L00A16C`
  - `L00A3CC`
- the later front-end path is still running before the richer `$1CAC/$1CCA/$1CE*` selector family becomes nonzero on the no-savestate boot probe

One caution matters for validation:

- frame `900` is not a perfect dump-to-screenshot match with the current end-of-frame probe:
  - live BG-only reconstruction from dumped VRAM/CGRAM/state mismatches the screenshot by `9.163993%`
  - the likely cause is that this scene is already animating under callback `01:A39C` after the one-shot helper build, so the end-of-frame dump can reflect the next frame's state more than the screenshot does
- frames `1080` and `1200` are now renderable through the shared Mode 7 BG path:
  - `tools/out/td2_boot_probe_bg_1080.ppm` compares against `td2_boot_probe_frame_1080_ppu.png` with `12.341309%` mismatch
  - `tools/out/td2_boot_probe_bg_1200.ppm` compares against `td2_boot_probe_frame_1200_ppu.png` with `9.125628%` mismatch
  - the residual delta is consistent with missing OBJ or other overlay composition, not with the Mode 7 transform itself
  - later probing narrowed that further:
    - visible OBJ coverage is concentrated in the lower-left corner and does not explain most of the mismatch area
    - a targeted register trace shows the sampled frames perform CPU writes to Mode 7/TMAIN only in late scanlines `225+`
    - frame `1200` additionally performs a burst of VRAM writes through `$2118/$2119` at scanlines `227-229`
    - a new `startFrame` PPU snapshot path confirms that simply moving the capture earlier does not materially reduce the mismatch, so the remaining gap is more likely HDMA or an unmodeled Mode 7 presentation detail than plain end-of-frame contamination

Trace-driven refinement of the Mode 7 entry path:

- a wider DMA trace over frames `900-1200` shows no CPU writes to `HDMAEN` or channel `7` setup registers in that window
- the first visible DMA activity for the Mode 7 attract path starts at frame `974`
  - frame `974`: channel `1` MDMA to `BBAD1 = $04`, i.e. OAM upload, while the active callback is bank 0 idle `00:8029`
  - frame `975`: callback `01:9D69` appears and performs:
    - channel `0` MDMA to `BBAD0 = $18`, i.e. VRAM upload
    - channel `1` MDMA to `BBAD1 = $04`, i.e. OAM upload
    - direct VRAM register writes through `$2116-$2119`
- a narrow Mode 7 trace over frames `974-977` then shows the handoff into the animated callback:
  - frame `976`: the first observed `M7A/M7D` writes occur under callback `01:9FE5`
  - frame `977`: the Mode 7 attract loop is established under `01:9FE5`, with scroll writes at `$210D/$210E` and continued VRAM activity
- practical reading:
  - `01:9D69` is the one-shot bootstrap that feeds the first VRAM uploads for the Mode 7 attract scene
  - `01:9FE5` is the live animation callback that steps the matrix (`$22 -> M7A/M7D`)
  - the current mismatch is not explained by a fresh CPU-visible HDMA setup inside frames `974-1200`
  - an explicit scanline-step probe on frame `1200` also found `ppu.mode7.*` stable across all `224` visible scanlines, which weakens the “per-scanline register drift” hypothesis for that particular frame
  - OBJ composition is real but only partially explanatory so far:
    - frame `1200`: adding the current simple OBJ overlay improves `9.125628% -> 7.934570%`
    - frame `1080`: the same OBJ overlay path is still materially wrong and compares at `26.457868%`

## `L00A35A -> 01:A39C` and the Ballistic Splash

The `Ballistic presents` splash is now pinned down more concretely than the earlier frame-`900` midpoint sample.

Current validated map:

- the active main callback first becomes `01:A39C` at frame `654`
- frame `654` is a clean exact scene anchor:
  - `tools/out/mesen_frame654_assets/bg1_visible.ppm` compares against `tools/out/td2_boot_probe_frame_654.png` with `0` mismatched pixels
  - `ppu.bgMode = 1`
  - `ppu.mainScreenLayers = 0x01`
  - visible sprites = `0`
- this means the splash is still a pure BG scene at entry, and can already be reproduced in the PC runtime from extracted `VRAM + CGRAM + PPU state`

The callback body immediately after `L00A35A` is now understood well enough to matter for porting:

- `L00A35A`:
  - calls `L000819`
  - forces `TMAIN = $01`
  - builds the scene through helper index `4` with `L00A9A0/L00A9CB/L00A9F2`
  - installs main callback `01:A39C`
  - clears `$20`
- `01:A39C`:
  - gates its work on `($0964 & 3) == 0`
  - uses `L000583` to rewrite CGRAM from a sliding source window rooted at `04:99ED`
  - decrements `$20` with wrap to `13`

Important practical conclusion:

- the visible splash animation is palette-driven, not sprite-driven
- the ROM data at `04:99ED` is a gradient-like BGR555 ramp used by this callback
- probe logs show `$20` changing every `4` frames from frame `656` onward:
  - `656 -> 13`
  - `660 -> 12`
  - `664 -> 11`
  - ...
  - `708 -> 0`

The current port-side compromise is still pragmatic, but it is now more compact than the earlier sampled scene playback:

- use the deterministic screenshot range `654..954`, step `4`, as the measured source of truth for the current Ballistic clip
- collapse that window into one indexed `256x224` image plus a palette timeline
- the resulting clip uses `15` pixel classes total, including black, and `76` palette frames for `304` frames of runtime
- the measured reference clip lives at `tools/out/ballistic_native_sequence.txt`
- a ROM-derived clip now also exists at `tools/out/ballistic_rom_sequence.txt`
- that ROM-derived clip keeps the same indexed image but replaces the measured palette timeline with:
  - helper-scene CGRAM from `L00A9F2(4)`
  - the `A39C` sliding rewrite of CGRAM slots `2..15`
  - fixed accent colors from the helper-loaded CGRAM (`34`, `36`, `37`)
- a direct runtime callback asset now also exists at `tools/out/ballistic_callback_sequence.txt`
- that direct runtime path uses the same indexed image and class mapping, but computes the visible palette from:
  - helper-scene CGRAM
  - the `04:99ED` ramp
  - the live `A39C` counter/update rules (`step=4`, start at black, wrap counter to `13`)
- the ROM-derived manifest and the direct runtime callback path both compare exactly against the sampled validation frames

The longer no-input attract loop is now pinned down as well:

- after the first `01:A39C` entry at frame `654`, the same callback/state cycle returns at frame `2072`
- it returns again at frame `3490`
- the repeat period is therefore `1418` frames

That makes the current exact sampled loop milestone straightforward:

- dump frames `654..2070` every `4` frames
- use end-exclusive frame `2072`
- build a sampled SDL manifest from those frames

Current implementation status:

- `tools/out/intro_loop_sequence.txt` is the first full no-input attract-loop manifest
- `tools/out/ballistic_native_sequence.txt` is the measured Ballistic reference clip
- `tools/out/ballistic_rom_sequence.txt` is the current ROM-derived Ballistic runtime clip
- `tools/out/ballistic_callback_sequence.txt` is the current direct runtime Ballistic callback clip
- `tools/out/intro_loop_hybrid_sequence.txt` is the current best no-input intro-loop runtime manifest:
  - direct runtime Ballistic callback for `654..958`
  - sampled `image` playback for the later attract states
- the manifest collapses identical adjacent screenshots, reducing `355` captured frames to `226` playback entries while preserving the full `1418` frames of runtime duration

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
