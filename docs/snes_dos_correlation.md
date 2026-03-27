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
| Preview asset resolution | Verified 3-choice animated preview rebuilder through `$0202`; the per-car bases at `01:9C77` now calibrate as Porsche 959 / Lamborghini Diablo / Ferrari F40 OBJ catalogs, while exact-frame raw dumps from the current front-end car-presentation corridor keep the visible name/info box on BG without OAM and narrow the per-car tilemap delta to the top title row | `VERIFIED` / `PROBABLE` |
| Opponent/time selector | Verified downstream `4`-state `2x2` surface through `$1C70`, with a `1E:8000` row `0x1D` selection box, three explicit rear-car cells from `16:8000/18:8000/1B:8000`, a separate `BG1` `Select Opponent` stopwatch/clock slot from helper `8`, and a later `L008B87` collapse into opponent-enabled `$1C76 = 1` / rival-index `$1C7A` for slots `0..2` versus no-opponent `$1C76 = 0` for slot `3` | `VERIFIED` |
| Track/scenery selector | Verified `4`-slot top-level selector through `$1C7C` with groups `[0, 5, 11, 18] / [5, 6, 7, 8]`; rendered rows `11..14` now recover `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, `West Coast - Hardest` | `VERIFIED` |
| UI descriptor rows | Adjacent menu helpers build a long ROM pointer rooted at `1E:8000`; rows `8..10` read as a rolling-tire helper cycle, rows `11..14` as track labels, rows `15..17` as top-level signboard labels, and rows `0x15..0x1B` as control/sound labels | `VERIFIED` |
| Selector persistence | No cart SRAM in ROM header | `VERIFIED` |
| DOS-style play-session gate | No verified dual-catalog equivalent yet; no-force timed-input probes now recover the default rival path `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`, and a callback-relative `be43+17-22:start` confirm now also recovers the no-opponent fourth-slot path into the same later corridor while preserving `$1C70 = 3` / `$1C76 = 0`; a direct `2044..2199` compare keeps the same `02:9016/01:96A0/02:8F3C` callback surface and narrows the remaining post-handoff split to `14` sampled fields, with `state_09a2/state_09a8` the strongest non-selector deltas; `L009568/L0095AD` remains the strongest bank-1 boundary | `VERIFIED` / `PROBABLE` |

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
  - The same `L008B87` path already distinguishes the fourth `Select
    Opponent` slot from the three car slots by forcing `$1C76 = 0` and
    `$1C7A = 0` only when `$1C70 == 3`.
  - Unlabeled front-end UI helpers later feed `L00179B/L001662` from slot
    families `$0202 + 0x0008` and `$1C7C + 0x000B` by constructing the long
    ROM pointer `1E:8000`.
- Notes:
  - This is a flattened named-field block, not a proven compact selector
    vector like DOS `0x8a1c`.
  - The fields are still clearly clustered in one WRAM neighborhood.
  - The downstream `$1C70` surface is now structurally closed as a `2x2` grid
    rather than only as an unlabeled `2`-bit field.
  - That same surface now also has a verified downstream collapse into
    no-opponent vs rival-enabled handoff fields.

### CLAIM AUDIT

- Claim: `L00C20B` owns a verified downstream `4`-state `2x2` front-end
  selection surface on `$1C70`, with a `1E:8000` row `0x1D` selection box,
  three explicit rear-car cells, and a separate `BG1` stopwatch/clock slot.
- Classification: VERIFIED
- Evidence:
  - `L00C20B` draws row `6` from `16:8000`, `18:8000`, and `1B:8000` at the
    first three coordinate pairs from `01:C1C2..01:C1CC`.
  - `L00C20B` installs callback `01:C1D2` through `lda #$0001 ; ldx #$C1D2 ;
    jsl L000385`.
  - `01:C1D2` redraws `1E:8000` row `0x001D` through `L00179B`, selecting one
    of four coordinate pairs from `01:C1C2..01:C1D0` via `$1C70 * 4`.
  - `L00C20B` edits `$1C70` as a `2`-bit field at `01:C32A..01:C371`.
  - [tools/out/snes_frontend_rival_selection_grid.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_rival_selection_grid.json)
    records the verified coordinates, row indices, and preview PNGs in one
    artifact.
  - [tools/out/snes_frontend_select_opponent_bg1.png](/home/nivando-soares/asmdump/tools/out/snes_frontend_select_opponent_bg1.png)
    isolates helper `8` on `BG1` and renders the banner `Select Opponent`
    plus a stopwatch/clock icon in the bottom-right quadrant.
  - [tools/out/snes_frontend_select_opponent_clock_summary.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_select_opponent_clock_summary.json)
    records the helper-8 source trio `05:E950 / 05:EC0A / 05:FAD2`.
- Notes:
  - The fourth slot is no longer an unresolved “missing car row”; it is a
    separate BG-carried clock surface.
  - This is the strongest current post-car, pre-track front-end surface.
  - `L008B87` now closes the first downstream semantic split of that same
    surface: the three car cells preserve rival state, while the fourth slot
    forces the no-opponent branch.

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
    surface.
  - Normalized row previews now also show that the nearby car-facing rows
    `8..10` are not name-bearing text; they are a three-phase rolling-tire
    helper, so the actual car-name surface must live elsewhere.

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

- Claim: The recovered SNES front-end car-presentation surface exposes exactly
  `3` reachable slots through `$0202/$1C78`, and the current loop shows no
  separate front-end restriction on the third slot.
- Classification: VERIFIED
- Evidence:
  - `L008B3E` sets `$1C84 = 3`, copies `$1C78 -> $0202`, and enters
    `L00BBCB`.
  - `L008B31` only reaches that `$0202` path after first calling `L00BAE8`,
    which owns a separate `3`-option front-end gate on `$1C6A`.
  - `L00BDAC` increments `$0202`, wraps `2 -> 0`, and immediately re-enters
    `L00BC0F`.
  - `L00BDD0` decrements `$0202`, wraps `0 -> 2`, and immediately re-enters
    `L00BC0F`.
  - The three reachable bundle indices `0x0009 + $0202` map to distinct
    helper triples for indices `9`, `10`, and `11`.
- Notes:
  - This is a verified statement about the recovered front-end selector loop.
  - It is downstream of the separate top-level `$1C6A` menu surface, not a
    proof that the first title/menu screen itself is `$0202`-driven.
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
- Classification: VERIFIED
- Evidence:
  - `L00BBCB` cycles `$0202` over `0..2` and commits the final value into
    `$1C78`.
  - `L00BC0F` reloads the visible per-car panel through `L00A9A0/L00A9CB`
    with `A = $0202 + 0x0009`, without a paired per-car `L00A9F2`.
  - The three preview helper bundles are distinct:
    - index `9` -> `L00A9A0 00:B0AB`, `L00A9CB 0E:8000`, `L00A9F2 02:FC11`
    - index `10` -> `00:B6B2`, `0E:91FE`, `02:FBF3`
    - index `11` -> `00:BCBA`, `0E:A428`, `0D:C98F`
  - An adjacent front-end UI helper later uses `$00 = $0202 + 0x0008`
    against the ROM pointer table rooted at `1E:8000` through `L00179B`.
  - A separate verified `CUSTOMIZE CAR` surface exists in the same front-end
    corridor, and later bank-1 paths keep indexing auxiliary tables through
    `$1C78`.
  - The same `$0202` selector also chooses per-car bases from `01:9C77`:
    - `1A:97D8` now matches the Porsche 959 sprite catalog
    - `11:A578` now matches the Lamborghini Diablo sprite catalog
    - `1A:8000` now matches the Ferrari F40 sprite catalog
  - A live front-end car-presentation capture at frame `1500` still shows the `Porsche 959`
    title box and info panel when rendered without OAM, while the car art only
    returns when OAM is composed back in.
  - The right-navigation capture
    `TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right'`
    reaches a stable `Lamborghini Diablo` panel at frame `1640`.
  - The second-right probe
    `TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right'`
    changes `state_0202` from `2` to `0` at frame `1677`, giving a third live
    front-end anchor in the same selector domain.
  - [rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json](/home/nivando-soares/asmdump/rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json)
    now ties that live lower-screen surface to helper bundle `10`:
    - `L00A9A0 00:B6B2 -> VRAM 0x1000` matches the live `BG2` tilemap base
    - `L00A9CB 0E:91FE -> VRAM 0x3000` matches the live `BG2` CHR base
  - Exact-frame raw comparisons now tighten the per-car panel read:
    - [tools/out/car_select_raw_bg1_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1500_vs_1640.json),
      [tools/out/car_select_raw_bg1_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1500_vs_1780.json),
      and [tools/out/car_select_raw_bg1_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1640_vs_1780.json)
      all report `0` changed visible `BG1` cells across the three live anchors.
    - [tools/out/car_select_raw_bg2_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1500_vs_1640.json),
      [tools/out/car_select_raw_bg2_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1500_vs_1780.json),
      and [tools/out/car_select_raw_bg2_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1640_vs_1780.json)
      keep the `BG2` tilemap delta to `27/11/27` changed cells, all on the
      top screen row.
    - [tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json),
      [tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json),
      and [tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json)
      all report `0` changed bytes across the full inferred `BG2` CHR region
      `0x3000..0x5FFF` (`12288` bytes).
- Notes:
  - The selector domain itself is now materially closed for the active three
    live anchors inside the current front-end car-presentation corridor.
  - That corridor is downstream of the separate `$1C6A` three-option top menu
    at `L00BAE8`, so it should not be collapsed into the title/menu-signboard
    surface without additional evidence.
  - The actual title/info box is now better read as a helper-backed `BG2`
    tilemap/CHR surface than as an OBJ descriptor row family.
  - The exact-frame raw-dump evidence narrows that further: the visible
    title/info panel is no longer best read as a broad `BG2` tilemap rewrite,
    the visible-union CHR delta is currently zero, and the full inferred
    `BG2` CHR region is also currently zero, so the best exact-frame read is a
    small top-row tilemap delta over shared CHR.
  - This frame trio should currently be described conservatively as a
    front-end car-presentation/preview surface, not yet a proven interactive
    car-select menu.
  - The raw helper assets for indices `9..11` are now reachable through the
  partial-bulk extractor; the remaining gap is exact text/payload ownership
    inside helper bundles `10/11`, plus a direct text-bearing proof that the
    raw third anchor is the remaining `Ferrari F40` slot.

### CLAIM AUDIT

- Claim: the top-level `$1C6A` signboard menu now has closed branch semantics:
  `Game Options` enters the configuration loop, `Play TDII` is the only
  branch that advances into the downstream `$0202` corridor, and `High Score`
  enters `L00A3CC` before returning to the top menu.
- Classification: VERIFIED
- Evidence:
  - `L00BAE8` branches on `$1C6A` at `01:BB7F`.
  - `$1C6A = 0` reaches `01:BB8D`, which does `jsr L00C0C7 ; jmp L00BAE8`.
  - `$1C6A = 2` reaches `01:BB93`, which does `lda #$FFFF ; jsr L00A3CC ;
    jmp L00BAE8`.
  - The remaining top-level branch returns success to `L008B31`, which then
    falls through to `L008B3E` and enters the separate `$0202/$1C78`
    front-end corridor.
  - [tools/out/snes_frontend_top_menu_transitions.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_top_menu_transitions.json)
    records the closed mapping in one artifact.
- Notes:
  - This resolves the semantic meaning of the three signboards, not just their
    rendered labels.
  - It also gives the settings-menu path a direct static anchor from the
    initial top-level menu.

### CLAIM AUDIT

- Claim: the `1E:8000` rows `15..17` are the visible signboard labels for the
  separate top-level `$1C6A` menu gate.
- Classification: VERIFIED
- Evidence:
  - `01:BAC3` loads `$00 = $1C6A + 0x000F` and calls `L00179B` after building
    the long ROM pointer `1E:8000`.
  - [tools/out/snes_frontend_pointer_table_top_menu_0f_11.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_top_menu_0f_11.json)
    decodes rows `15..17` under that exact callsite.
  - [tools/out/snes_frontend_top_menu_labels.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_top_menu_labels.json)
    fixes the rendered row texts as:
    - `Game Options`
    - `Play TDII`
    - `High Score`
- Notes:
  - This closes the top-level signboard naming surface with direct ROM-side
    row renders.
  - The downstream `$0202` three-slot preview corridor should not be collapsed
    into this first top-level menu surface.

### CLAIM AUDIT

- Claim: the later `1E:8000` rows `0x15..0x1B` are front-end control/sound
  labels rather than car-facing assets.
- Classification: VERIFIED
- Evidence:
  - [tools/out/snes_frontend_pointer_table_controls_15_1b.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_controls_15_1b.json)
    and its Markdown companion decode direct text previews for:
    - `Brake`
    - `Throttle`
    - `Horn`
    - `Upshift`
    - `Downshift`
    - `Steering`, `Pause`
    - `stereo`
- Notes:
  - This removes `0x15..0x1B` from the car-name search space.
  - The next front-end naming frontier is now a different family than both
    rows `8..10` and rows `0x15..0x1B`.

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
  - The next front-end naming frontier is a different family than rows
    `8..10`, because those now read as rolling-tire phases.

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

- Claim: The `Select Opponent` clock slot is already a verified no-opponent
  handoff split at `L008B87`, not only a visual `BG1` icon.
- Classification: VERIFIED
- Evidence:
  - At `L008B87`, the code loads `X = 1` and `A = $1C70`; only on
    `$1C70 == 3` does it execute `dex` and `lda #$0000` before storing
    `X -> $1C76` and `A -> $1C7A`.
  - For selector values `0..2`, the same path stores `$1C76 = 1` and
    preserves `$1C7A = $1C70`.
  - `$1C7A` later selects rival-facing tables in `bank1.asm:1820-1837`,
    `bank1.asm:1965-1975`, and `bank2.asm:2675-2702`.
  - `$1C76` later gates the branch to `L00948A` vs `L009568` in
    `bank1.asm:2403-2405` and opponent-side runtime work in
    `bank2.asm:2943-2958`, `bank2.asm:4118-4129`, and `bank2.asm:4671-4682`.
  - [tools/out/snes_frontend_select_opponent_mode_split.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_select_opponent_mode_split.json)
    consolidates the collapse and downstream consumers.
- Notes:
  - This closes the first gameplay-facing distinction between the fourth clock
    slot and the three rival-car slots.
  - The remaining open edge is narrower:
    exact timer/HUD behavior for the no-opponent branch is still not directly
    captured in live gameplay.

### CLAIM AUDIT

- Claim: No-force timed-input probes now recover the default top-left `Select
  Opponent` path organically through `L00C20B -> 01:C1D2 -> L00BE76 ->
  L008B87 -> 01:902D`, followed later by `active_main = 02:9016`.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json)
    reaches `L00C20B` at frame `1562`, `01:C1D2` at `1577..1617`,
    `L00BE76` at `1616`, `L008B87` at `1706`, `01:902D` at `1857`, and
    first `active_main = 02:9016` at frame `2014`.
  - [tools/out/select_opponent_clock_path_v2/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v2/td2_boot_probe.json)
    reaches `L00C20B` at frame `1584`, `01:C1D2` at `1599..1647`,
    `L00BE76` at `1646`, `L008B87` at `1736`, `01:902D` at `1887`, and
    first `active_main = 02:9016` at frame `2044`.
  - In both runs, `$1C70` stays `0` through the recovered corridor and
    `$1C76` flips from `0` to `1` only after `L008B87`, matching the default
    top-left rival slot rather than the fourth clock slot.
  - [tools/out/snes_select_opponent_organic_default_path.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_organic_default_path.json)
    consolidates the timings and the failed early `right+down` attempts in one
    promoted artifact.
- Notes:
  - This closes organic reachability for the default rival path without
    `active_main` forcing.
  - The remaining proof target is now to move the clock-slot input inside the
    live `01:C1D2` window so the no-opponent branch can be compared against
    this recovered default baseline.

### CLAIM AUDIT

- Claim: Callback-relative input keyed to first live `01:C1D2` now closes
  organic fourth-slot selection through `L00BE76 -> 01:BE43` with
  `$1C70 = 3` and `$1C76 = 0`.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe.json)
    records trigger windows relative to first `01:C1D2` at frame `1628`,
    reaches `L00BE76` at `1642`, and has `$1C70 = 3` / `$1C76 = 0` by that
    same frame.
  - The same `v5` run samples `active_main = 01:BE43` at frames `1713`,
    `1736`, `1857`, `1887`, `2014`, and `2044`, with no traced
    `L008B87`, `01:902D`, or `01:9111` hit.
  - [tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe.json)
    reproduces `L00BE76` at `1642`, first `01:BE43` at `1713`, and keeps
    `$1C70 = 3` / `$1C76 = 0` through sampled frames `2200`, `2400`, and
    `2600`.
  - [tools/out/snes_select_opponent_callback_relative_selection.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_callback_relative_selection.json)
    consolidates the callback-relative fourth-slot proof and scopes the
    remaining later confirm gap.
- Notes:
  - This closes organic fourth-slot selection itself.
  - Because the bounded `v5/v6` program omits the later confirm `start` used
    in the default-rival path, the remaining open edge is the later
    no-opponent phase-confirm/promotion path after `01:BE43`.

### CLAIM AUDIT

- Claim: A later `be43+17-22:start` confirm now closes the organic
  no-opponent path through `L008B87 -> 01:902D -> 01:9111 -> 02:9016`, while
  preserving `$1C70 = 3` and `$1C76 = 0`.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json)
    records first `01:C1D2` at `1628`, `L00BE76` at `1642`, first
    `01:BE43` at `1713`, `L008B87` at `1736`, `01:902D` at `1887`,
    `01:9111` at `2043`, and first `active_main = 02:9016` at `2044`.
  - The same `v7` run samples `$1C70 = 3` / `$1C76 = 0` at `1736`, `1887`,
    `2044`, `2600`, and `3000`.
  - At frame `1730`, `v7` still has `active_main = 01:BE43` with
    `state_0960 = 0x1000`, matching the be43-relative confirm pulse that
    precedes `L008B87`.
  - [tools/out/select_opponent_clock_path_v2/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v2/td2_boot_probe.json)
    reaches the same downstream timestamps `1736 / 1887 / 2044`, but with the
    rival state `$1C70 = 0` / `$1C76 = 1`.
  - [tools/out/snes_select_opponent_no_opponent_organic_path.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_no_opponent_organic_path.json)
    consolidates the no-opponent path and the timing/state comparison against
    the default-rival baseline.
- Notes:
  - This closes the later no-opponent confirm/promotion path itself.
  - The remaining open edge is now the gameplay-facing divergence after the
    shared `02:9016` corridor begins.

### CLAIM AUDIT

- Claim: The first shared `02:9016` window of the recovered rival and
  no-opponent paths keeps identical `main/irq/nmi` callbacks but narrows the
  remaining observed state split to `14` sampled fields, with the strongest
  non-selector deltas in `state_09a2` and `state_09a8`.
- Classification: VERIFIED
- Evidence:
  - [tools/out/snes_select_opponent_post_9016_state_compare.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_post_9016_state_compare.json)
    compares frames `2044..2199` of the default-rival and no-opponent runs.
  - The compare keeps the same callback surface across the whole window:
    `main = 02:9016`, `irq = 01:96A0`, `nmi = 02:8F3C`.
  - The same compare reports `54` unchanged sampled fields and only `14`
    differing fields in the whole window.
  - Stable whole-window differences are limited to `$1C70 = 0 -> 3` and
    `$1C76 = 1 -> 0`, plus DP cadence fields `$0053/$0054`; the strongest
    non-selector downstream deltas are `state_09a2` (`77` differing frames,
    `38/40 -> 34`) and `state_09a8` (`11` differing frames, `2 -> 10`).
- Notes:
  - This is a narrowing result, not a semantic decode of those fields.
  - The next useful target is ownership or visibility for `09A2/09A8` and the
    paired DP scratch fields inside the shared `02:9016` corridor.

### CLAIM AUDIT

- Claim: The first stable rival-vs-no-opponent visual split after both paths
  reach `02:9016` is a rival-only OAM marker on the top HUD strip, gated by
  `$1C76` through `state_11f3 -> oam_0730`.
- Classification: VERIFIED
- Evidence:
  - `bank2.asm:1145-1165` (`L0108EF`) stages `oam_072c` from `state_11f1`,
    conditionally stages `oam_0730` from `state_11f3` only when
    `$1C76 != 0`, and stages `oam_0734` from `state_11f5`.
  - [tools/out/post9016_extended_state_compare.json](/home/nivando-soares/asmdump/tools/out/post9016_extended_state_compare.json)
    compares frames `2048..2088` of corrected rival/no-opponent probes and
    keeps stable whole-window differences `oam_0730 = 4618 -> 57600`,
    `state_11f3 = 44 -> 0`, `$1C76 = 1 -> 0`, and `$1C70 = 0 -> 3`.
  - [tools/out/post9016_compare_summary.json](/home/nivando-soares/asmdump/tools/out/post9016_compare_summary.json)
    localizes all sampled image deltas in the same window to the top-strip
    bounding box `(11, 11, 194, 21)`.
  - Human review of the corrected screenshot pack reports a red rival marker
    absent from the no-opponent lane and confirms the difference disappears
    with OAM disabled while the lower cockpit stays unchanged.
- Notes:
  - This closes the first stable gameplay-visible split as rival-only OAM
    ownership.
  - The user also reports rival blinking lights in the rearview as the first
    meaningful cue, but that finer rearview mapping is not yet tied to a
    specific state field.

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
  - Current recovered gate surfaces are the front-end success gate at `L008B26`,
    the verified `L008B87` no-opponent-vs-rival split, the organic default
    rival path through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D
    -> active_main = 02:9016`, the descriptor-progression boundary at
    `L009568/L0095AD`, and the explicit callback install of `02:9016/02:8F3C`
    from the same bank-1 corridor.
  - Neither recovered surface directly proves validation of separate car and
    scenery working sets before gameplay.
- Notes:
  - This is a statement about the present evidence state.
  - It is not proof that no such gate exists elsewhere in the ROM.
