# External Decompiler Markdown Audit

Date: `2026-03-21`

Source under review:

- user-pasted markdown copied from an authenticated Vercel/v0 page that was not
  publicly readable from this environment

Purpose:

- compare the pasted "SNES 65816 Decompilation Map - Test Drive II" against the
  repo's current evidence baseline
- separate real ROM-derived observations from generic or unsupported filler

## Bottom Line

- The bank-`00` kernel excerpts are grounded in real disassembly from this ROM.
- The global bank map and most of the named asset/function claims are not
  supported by the current repo evidence.
- Some later-bank claims directly conflict with already verified runtime
  provenance in this repo.

Use this external markdown only as:

- a loose bank-`00` summary

Do not use it as:

- a source of truth for function names
- a source of truth for bank purpose labels
- a source of truth for asset locations
- evidence that the project is already decompiled

## Claim Audit

| External claim | Status | Repo reading |
|---|---|---|
| `L00002A` reset handler exists in bank `00` | confirmed | Real label and real startup path are present in `bank0.asm`. |
| `L000139` NMI handler exists in bank `00` | confirmed | Real label and real NMI entry are present in `bank0.asm`. |
| `L0001AB` is the DMA queue consumer | confirmed | Real label and real `$0600` descriptor-queue reader are present in `bank0.asm`. |
| The pasted C for reset/NMI/DMA is a faithful decompilation | partial / oversimplified | It captures the rough role of the routines, but omits major behavior such as the DMA budget path, the direct-VRAM write branch, the OAM DMA pass, and the callback-dispatch flow. |
| Bank `01` contains a clean game-state machine at `L018000` with `Title/Menu/CarSelect/Race/Results` | unsupported | No such label or symbol appears in the repo. The current verified front-end model is callback-family driven (`01:A39C`, `01:9D69`, `01:9FE5`), not a proven `switch`-style dispatcher at `01:8000`. |
| Bank `03` is a proven palette bank with named assets like `PAL_Ballistic_Logo` | unsupported | The repo has no verified symbol set or provenance table that supports these exact names or addresses. |
| Bank `04` is a proven font/string bank with assets like `FONT_Main` and `STR_Menu_EN` | unsupported | The repo has not yet mapped stable text/string buffers or finalized bank-`04` ownership. |
| Bank `06` is cockpit graphics, bank `07` is car sprites, bank `08` is scenery, bank `09` is HUD | unsupported / conflicting | These are not current source-of-truth mappings. In particular, bank `07` is already proven to contain live compressed chunk sources used by visible tilemaps at frames `1096` and `1101`, so "bank `07` = car sprites" is too narrow and misleading. |
| Bank `0A` is a proven 3D engine with `L0A8000` / `L0A8100` | unsupported | Those labels do not appear in the repo, and the port plan explicitly says later banks still contain mixed code/data and large undecoded regions. |
| Bank `0B` is a proven physics bank with `L0B8000` | unsupported | No matching label or grounded contract exists in the repo. |
| Bank `0C` is proven track data with named track assets at fixed addresses | unsupported | The repo still lists track/scenario-table recovery as an open mapping priority. |
| Bank `0E` is proven SPC/audio/sample content with named assets | unsupported | Audio queue/SPC handoff state is still an open mapping priority. |
| The document represents a real decompilation map of the whole ROM | unsupported | The current repo state is explicitly "reverse-engineering base, not yet a decompilation." |

## Confirmed Kernel Details

The pasted markdown is strongest where it stays close to the real bank-`00`
kernel:

- `L00002A` really performs native-mode entry, stack setup, interrupt disable,
  initial PPU clearing, and later jumps into additional initialization.
- `L000139` really uses `$51` as an NMI reentry guard.
- `L0001AB` really consumes `8`-byte descriptors from the `$0600` queue using
  `$53/$54` as the queue cursors.

The simplification boundary matters:

- the reset path in `bank0.asm` does more than the pasted snippet shows
- the NMI path dispatches through callback pointers rather than only running a
  fixed hard-coded "VBlank routine"
- the DMA path has both standard DMA and direct-VRAM write forms
- the NMI path also has a distinct OAM staging/DMA pass via `$0700`

## Repo-Grounded Alternative Reading

The current repo evidence supports this higher-confidence model instead:

- bank `00` contains recognizable kernel/setup/NMI/DMA/scheduler behavior
- bank `01` is currently understood through verified callback families and
  pointer-driven dispatch, not through a finished high-level game-state map
- bank `30` compression provenance is an active evidence lane with unresolved
  runtime candidates still open
- tilemap-to-ROM provenance is evidence-backed for multiple frame windows and
  already proves visible content sourced from banks `0D` and `07`
- the active intro path is modeled through callback/state contracts plus
  bridge-visible scene reconstruction, not through a completed whole-ROM
  decompilation

## Evidence Anchors

- `PORT_PLAN.md`
- `bank0.asm`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `rom_analysis/docs/memory_map.md`
- `rom_analysis/docs/bank1_l001210_pointer_tables.md`
- `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
- `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`

## Practical Policy

If similar external summaries are reviewed again:

1. Accept bank-`00` claims only after checking the real labels and flow in
   `bank0.asm`.
2. Reject later-bank asset/function naming unless there is a matching static or
   runtime artifact in the repo.
3. Prefer callback contracts, chunk validation, and tilemap provenance over
   prose bank-role summaries.
4. Do not import editorial function names from external summaries into repo
   docs unless they are grounded by actual control-flow evidence.
