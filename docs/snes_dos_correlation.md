# SNES/DOS Correlation Baseline

This note is a first-pass SNES correlation baseline driven by the verified DOS
runtime contracts. It only promotes claims that are grounded in current
bank-0/bank-1 archaeology or direct ROM-header evidence.

## Summary

| DOS concept | Current SNES read | Classification |
| --- | --- | --- |
| Selection vector | Flattened WRAM selector block around `$1C6A..$1C90`, not a proven slot-indexed vector | `VERIFIED` |
| Car/scenery materializers | One verified shared descriptor materializer; no recovered split into dedicated car and scenery builders yet | `VERIFIED` |
| Car roster size | Verified `3`-slot front-end surface through `$0202/$1C78`; no recovered front-end restriction on the third slot in the current menu loop | `VERIFIED` |
| Car-specific working set | Customizer UI plus live parameter fields exist | `VERIFIED` |
| Preview asset resolution | Verified 3-choice animated preview rebuilder through `$0202`; strongest current car-facing selector domain is `$0202/$1C78` | `VERIFIED` / `PROBABLE` |
| Track/scenery selector | Verified `4`-slot top-level selector through `$1C7C` with groups `[0, 5, 11, 18] / [5, 6, 7, 8]`; rendered rows `11..14` now recover `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, `West Coast - Hardest` | `VERIFIED` |
| UI descriptor rows | Adjacent menu helpers build a long ROM pointer rooted at `1E:8000`; current car-facing rows are `8..10`, current track-facing rows are `11..14` | `VERIFIED` |
| Selector persistence | No cart SRAM in ROM header | `VERIFIED` |
| DOS-style play-session gate | No verified dual-catalog equivalent yet; same corridor stages `02:9016/02:8F3C`, and `L009568/L0095AD` remains the strongest bank-1 boundary | `VERIFIED` / `PROBABLE` |

## Selection State

Relevant DOS contract:
- DOS live menu state is a selector vector rooted at `0x8a1c`, with persisted
  subset `0x8a1e`, `0x8a20`, and `0x8a22`.

### CLAIM AUDIT

- Claim: SNES front-end selection state is a contiguous WRAM block of named
  fields centered on `$1C6A..$1C90`, not a proven DOS-style slot-indexed
  selector vector.
- Classification: VERIFIED
- Evidence:
  - `L00BAE8` rotates `$1C6A` over `0..2`.
  - `L00BBCB` drives a `3`-choice preview through `$0202`, and `L008B57`
    commits `$0202 -> $1C78`.
  - `L00C20B` edits `$1C70` as a `2`-bit field.
  - `L00BE76` rotates `$1C7C` modulo `4`.
  - `L008B87` derives `$1C74/$1C76/$1C7A/$1C7E/$1C80` from
    `$1C6C/$1C70/$1C78/$1C7C/$1C90`.
  - Unlabeled front-end UI helpers later feed `L00179B/L001662` from slot
    families `$0202 + 0x0008` and `$1C7C + 0x000B` by constructing the long
    ROM pointer `1E:8000`.
- Notes:
  - This is a flattened named-field block, not a proven compact selector
    vector like DOS `0x8a1c`.
  - The fields are still clearly clustered in one WRAM neighborhood.

## Catalog And Working-Set Materialization

Relevant DOS contracts:
- DOS car selection and scenery selection are separate materialization
  handlers.
- DOS car IDs bind logic blobs, layout descriptors, and multiple visual asset
  roles through a single shared stem.
- DOS runtime car records and scene records carry source-selector metadata that
  is not present on disk.
- DOS derives preview assets from selected IDs.

### CLAIM AUDIT

- Claim: The adjacent front-end UI helpers previously read as `$1E80` buffer
  users actually construct the long ROM pointer `1E:8000` and dereference
  descriptor rows directly from that table.
- Classification: VERIFIED
- Evidence:
  - The helpers at `01:BDF4`, `01:BE53`, and `01:BAC3` all use the overlapping
    sequence `lda #$1E80 ; sta $11 ; lda #$8000 ; sta $10` before calling
    `L00179B` or `L001662`.
  - In `L00179B`, `[$10]` is treated as a long base pointer table, with the
    selected row resolved by adding the four-byte entry at `index * 4` to the
    base pointer.
  - [tools/out/snes_frontend_pointer_table_1e8000.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_1e8000.json)
    decodes the current adjacent menu rows:
    - car-facing selector surface -> rows `8..10`
    - track-facing selector surface -> rows `11..14`
- Notes:
  - This closes the old WRAM-materializer assumption around `$1E80`.
  - The remaining gap is no longer payload naming for the top-level `$1C7C`
    surface; it is the still-open car-facing naming surface and later runtime
    composition/promotion questions.

### CLAIM AUDIT

- Claim: After menu stabilization, SNES bank 1 collapses selector state into
  one derived content descriptor at `$1CAC/$1CCA/$1CFA/$1CAA/$1CE2/$1CE4/$1CE6/...`
  and materializes assets from that shared descriptor.
- Classification: VERIFIED
- Evidence:
  - `L008C10` computes `$1C82 = $1CA8 + $1C7E` and indexes tables
    `01:8016..01:8330`.
  - `L008C10` writes `$1CAC/$1CCA/$1CFA/$1CAA/$1CE2/$1CE4/$1CE6/$1CB8/$1CBE/$1CBA/$1CBC/$1CC2/$1CCC/$1CCE/$1CD0`.
  - `L008CA2` consumes those fields through `L00A9A0`, `L00A9CB`,
    `L00A9F2`, `L0005AC`, `L0006C9`, and `L001210`.
- Notes:
  - This is the clearest SNES equivalent of a working-set materializer.
  - It is still one shared bundle builder, not a proven split of dedicated car
    and scenery builders.

### CLAIM AUDIT

- Claim: SNES has a verified car-specific customization surface with dedicated
  parameter fields, anchored by the string `CUSTOMIZE CAR` at `01:880D`.
- Classification: VERIFIED
- Evidence:
  - `L008A50` prints the string block at `01:880D`, including `Autoshift`,
    `Car Height`, `Drag Coeff`, `Accel Coeff`, `Brake Coeff`, `Max G Force`,
    `Scrub Rate`, `0-60`, `0-100`, `1/4 Mile`, `1/4 Speed`, `Top Speed`,
    `Top Time`, and `Lives`.
  - `L008784` enters that editor loop and later copies
    `$1406/$1444/$1446/$1408/$1442/$1416` into
    `$1470/$1472/$1474/$1476/$1478/$147A`.
- Notes:
  - This proves a car-specific working parameter surface.
  - It does not yet prove a full named car catalog or DOS-style shared stem
    table.

### CLAIM AUDIT

- Claim: The recovered SNES front-end car-selection surface exposes exactly
  `3` reachable slots through `$0202/$1C78`, and the current loop shows no
  separate front-end restriction on the third slot.
- Classification: VERIFIED
- Evidence:
  - `L008B3E` sets `$1C84 = 3`, copies `$1C78 -> $0202`, and enters
    `L00BBCB`.
  - `L00BDAC` increments `$0202`, wraps `2 -> 0`, and immediately re-enters
    `L00BC0F`.
  - `L00BDD0` decrements `$0202`, wraps `0 -> 2`, and immediately re-enters
    `L00BC0F`.
  - The three reachable bundle indices `0x0009 + $0202` map to distinct
    helper triples for indices `9`, `10`, and `11`.
- Notes:
  - This is a verified statement about the recovered front-end selector loop.
  - It does not rule out some unrelated later gameplay-mode restriction
    elsewhere, but no front-end lock condition is recovered here.

### CLAIM AUDIT

- Claim: SNES has a verified `3`-choice animated preview rebuilder driven by
  `$0202`.
- Classification: VERIFIED
- Evidence:
  - `L00BBCB` seeds one bundle with index `0x0007`, then rebuilds a second
    bundle from `0x0009 + $0202`.
  - The same routine cycles `$0202` over `0..2`.
  - `L008B57` commits the final `$0202` value into `$1C78`.
- Notes:
  - This is the strongest current preview-asset resolver.
  - Its domain is still not named directly by this routine alone.

### CLAIM AUDIT

- Claim: `$0202/$1C78` is the strongest current car-facing selector domain in
  the SNES front end.
- Classification: PROBABLE
- Evidence:
  - `L00BBCB` cycles `$0202` over `0..2` and commits the final value into
    `$1C78`.
  - The three preview helper bundles are distinct:
    - index `9` -> `L00A9A0 00:B0AB`, `L00A9CB 0E:8000`, `L00A9F2 02:FC11`
    - index `10` -> `00:B6B2`, `0E:91FE`, `02:FBF3`
    - index `11` -> `00:BCBA`, `0E:A428`, `0D:C98F`
  - An adjacent front-end UI helper later uses `$00 = $0202 + 0x0008`
    against the ROM pointer table rooted at `1E:8000` through `L00179B`.
  - A separate verified `CUSTOMIZE CAR` surface exists in the same front-end
    corridor, and later bank-1 paths keep indexing auxiliary tables through
    `$1C78`.
- Notes:
  - The strongest remaining gap is a name-bearing asset or debugger-backed
    menu trace.
  - The raw helper assets for indices `9..11` are now reachable through the
    partial-bulk extractor; the remaining gap is runtime composition, not raw
    decode reachability.

### CLAIM AUDIT

- Claim: The one-shot ROM-side preview extractor now rebuilds helper indices
  `9..11` despite early-ending `26FB` bulk streams, and the clean
  isolated-layer model only renders non-backdrop content for helper `9` on
  `BG2`.
- Classification: VERIFIED
- Evidence:
  - Strict `decode_26fb` on `0E:8000` still raises
    `got 11348 bytes, expected 16640`, while `strict_length = False` returns
    the `11348` decoded bytes.
  - `tools/build_bank1_helper_scene.py` now routes the `L0006C9` bulk path
    through `allow_partial_26fb = True` and records
    `declared_output_size/actual_output_size/length_mismatch`.
  - [tools/out/bank1_preview_helper_9_11_summary.json](/home/nivando-soares/asmdump/tools/out/bank1_preview_helper_9_11_summary.json)
    records clean one-shot rebuilds with:
    - `BG1` non-backdrop `0/0/0`
    - `BG2` non-backdrop `14336/0/0`
    - helper order `9/10/11`
- Notes:
  - This closes the previous extractor blind spot for helpers `9..11`.
  - It does not prove the full animated menu composition.
  - The remaining preview unknown is why helpers `10` and `11` stay blank in
    the clean one-shot model.

### CLAIM AUDIT

- Claim: `$1C7C` is a verified `4`-slot top-level front-end selector with
  bases/counts `[0, 5, 11, 18] / [5, 6, 7, 8]`.
- Classification: VERIFIED
- Evidence:
  - `L008B6F` sets `$1C84 = 4` before entering `L00BE76`.
  - `L00BE76` rotates `$1C7C` modulo `4`.
  - `L008B87` uses `$1C7C` to read `$1C7E/$1C80` from `01:8000`.
  - Raw table decode at `01:8000/01:8008` yields group bases
    `[0, 5, 11, 18]` and counts `[5, 6, 7, 8]`.
  - `L008C10` immediately uses `$1C82 = $1CA8 + $1C7E` to derive the live
    descriptor row.
  - An adjacent front-end UI helper uses `$00 = $1C7C + 0x000B` against the
    ROM pointer table rooted at `1E:8000` through `L00179B`.
  - [tools/out/snes_frontend_pointer_table_tracks.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_tracks.json)
    and its rendered previews now close the label mapping:
    - `$1C7C = 0` -> `Desert Blast - Easy`
    - `$1C7C = 1` -> `City Bound - Medium`
    - `$1C7C = 2` -> `East Coast - Hard`
    - `$1C7C = 3` -> `West Coast - Hardest`
- Notes:
  - The selector behavior and cardinality are direct code evidence.
  - The remaining uncertainty is no longer the top-level labels themselves.
  - The next front-end naming frontier is the car-facing row family `8..10`.

### CLAIM AUDIT

- Claim: No verified split between dedicated SNES car-catalog and
  scenery-catalog materializers has been recovered yet; current evidence points
  to one shared descriptor build fed by multiple selectors.
- Classification: VERIFIED
- Evidence:
  - The recovered bundle builder is `L008C10/L008CA2`.
  - Selector-specific routines `L00BBCB` and `L00BE76` only prove preview/UI
    surfaces and selector mutation, not separate final materializers.
- Notes:
  - This is a statement about the current recovered evidence.
  - It should not be over-read as proof that no deeper split exists elsewhere.

## Persistence

Relevant DOS contract:
- DOS persistence stores three numeric selectors plus three IDs.

### CLAIM AUDIT

- Claim: The SNES ROM header declares no cart SRAM, so DOS-style battery-backed
  selector persistence is not evidenced on the cartridge.
- Classification: VERIFIED
- Evidence:
  - LoROM header byte `0x7FD8` reports `sram_size = 0x00`.
  - LoROM header byte `0x7FD6` reports `cart_type = 0x00`.
- Notes:
  - This rules out battery-backed cart SRAM on the shipped image.
  - It does not rule out transient WRAM state or an unproven non-SRAM
    persistence mechanism.

## Play-Session Gate

Relevant DOS contract:
- DOS play-session assembly is guarded by a non-graphics gate that requires
  both car and scenery catalogs.

### CLAIM AUDIT

- Claim: SNES bank 1 will not derive or build the final front-end descriptor
  until the helper chain rooted at `L008B26` returns success.
- Classification: VERIFIED
- Evidence:
  - `L008B26` calls `L009C3E`, `L00BAE8`, `L00BBCB`, `L00C20B`, and `L00BE76`
    in sequence.
  - A `0xFFFF` return from those helpers branches back to earlier loop points
    instead of falling through to `L008B87/L008C10`.
  - Only the success path reaches the descriptor derivation at `L008B87` and
    the build/materialization path at `L008C10/L008CA2`.
- Notes:
  - This is a verified selection gate.
  - It is not yet a verified DOS-style dual-catalog gameplay gate.

### CLAIM AUDIT

- Claim: The same bank-1 setup corridor explicitly stages the known gameplay
  callback chain `02:9016` (main) and `02:8F3C` (NMI) before entering the
  bank-1 loop at `L009111`.
- Classification: VERIFIED
- Evidence:
  - At `01:902D..01:9033`, the path loads `A = 0x0002` and stages
    `X = 0x9016` through `L000385`, then `X = 0x8F3C` through `L0003A0`.
  - [docs/bank0_flow.md](/home/nivando-soares/asmdump/docs/bank0_flow.md)
    confirms `L000385` writes the staged main callback to `$096C-$096E` and
    `L0003A0` writes the staged NMI callback to `$096F-$0971`.
  - Control continues directly into `L009111` afterward.
- Notes:
  - This proves adjacency to the later gameplay callback family already
    observed as `active_main = 02:9016`.
  - It still does not prove that `L009568/L0095AD` are the exact DOS-style
    both-catalogs gate.

### CLAIM AUDIT

- Claim: `L009568/L0095AD` form the strongest current SNES gameplay-handoff
  candidate because they advance `$1CA8`, compare it against `$1C80`, and
  either rebuild the next descriptor row via `L008C10` or unwind back to
  `L008B31`.
- Classification: PROBABLE
- Evidence:
  - `L009568` and `L0095AD` both increment `$1CA8` before `L00B1F9`.
  - `L0095D0` compares `$1CA8` against `$1C80`; equality branches to
    `L0095AD`, otherwise control jumps back to `L008C10`.
  - The unwind path goes through `L00A5AE/L00A3CC` and returns to `L008B31`.
  - Forced `01:9568` and `01:95AD` probes each reach `01:B1F9` once at frame
    `1201`, with `stack_return_rts = 0x9575 / 0x95B7` and `state_0f77 = 1 / 0`
    respectively.
  - The original forced `1200..1300` trace window records no writes to
    `7E:096C..0971` and no exec hit at `02:9016`.
  - Short-force follow-ups that inject `01:9568/01:95AD` only on frames
    `1200..1201` still leave `active_main` pinned on `01:9568/01:95AD`
    through frame `2199`, with no traced writes to `7E:096C..0971` and no
    exec hit at `01:B226/B638/B6A3/B6E3/B755/01:9D69/02:9016/02:8F3C`.
  - Static bank-1 reading still shows the explicit `02:9016/02:8F3C` install
    at `01:902D..01:9034`, while the later explicit callback stage inside
    `L00B1F9` is `01:9D69` at `01:B6A3`.
- Notes:
  - The control-flow boundary is verified.
  - Its equivalence to the DOS dual-catalog gameplay gate is still inferred.
  - The missing proof is no longer just “use a wider trace window”.
  - Direct active-main forcing itself produces a sticky bank-1 surface, so the
    remaining gap is now about richer preconditions for observing organic
    promotion, not about whether the branch entry is real.

### CLAIM AUDIT

- Claim: No verified SNES refusal branch equivalent to the DOS `0x6064`
  both-catalogs-required gate has been recovered yet.
- Classification: VERIFIED
- Evidence:
  - Current recovered gate surfaces are the front-end success gate at `L008B26`
    and the descriptor-progression boundary at `L009568/L0095AD`, plus the
    explicit callback install of `02:9016/02:8F3C` from the same bank-1
    corridor.
  - Neither recovered surface directly proves validation of separate car and
    scenery working sets before gameplay.
- Notes:
  - This is a statement about the present evidence state.
  - It is not proof that no such gate exists elsewhere in the ROM.
