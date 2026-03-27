# SNES Unknowns

This note records the highest-value remaining unknowns after the first
DOS-driven SNES correlation pass.

## Open Claims

### CLAIM AUDIT

- Claim: `$1C78` and the `3`-choice `$0202` preview path are the active car
  selector for the main front-end flow.
- Classification: VERIFIED
- Evidence:
  - `L008B31` always passes through `L00BAE8` first; that routine owns a
    separate `3`-option front-end gate on `$1C6A` before control reaches the
    downstream `$0202` corridor at `L008B3E`.
  - `L00BBCB` cycles `$0202` over `0..2`, rebuilds one bundle from
    `0x0009 + $0202`, and `L008B57` commits `$0202 -> $1C78`.
  - `L00BC0F` reloads the live per-car panel through `L00A9A0/L00A9CB` with
    `A = $0202 + 0x0009`, while leaving per-car palette work off that inner
    loop.
  - `L00BDAC` and `L00BDD0` wrap the selection across all three slots without
    a recovered lock condition.
  - An adjacent front-end UI helper uses `$00 = $0202 + 0x0008` against the
    ROM descriptor table rooted at `1E:8000` through `L00179B/L001662`.
  - The three preview helper bundles are distinct:
    - index `9` -> `00:B0AB`, `0E:8000`, `02:FC11`
    - index `10` -> `00:B6B2`, `0E:91FE`, `02:FBF3`
    - index `11` -> `00:BCBA`, `0E:A428`, `0D:C98F`
  - A separate verified car-customize surface exists at `01:880D`.
  - The right-navigation probe
    `TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right'`
    changes `state_0202` from `1` to `2` at frame `1537`.
  - The matching visible capture at frame `1640` shows `Lamborghini Diablo`.
  - The second-right probe
    `TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right'`
    changes `state_0202` from `2` to `0` at frame `1677`.
- Notes:
  - The preview, commit, and per-car helper reload are direct code evidence.
  - The current `$0202` trio is not the first top-level menu surface; it is a
    downstream front-end corridor reached only after the separate `$1C6A`
    three-option gate returns through `L008B31`.
  - The current recovered loop already exposes all three front-end slots.
  - The remaining gap is no longer the selector domain itself; it is the
    exact payload ownership inside the helper-backed BG panel plus a direct
    name-bearing proof for the third live slot.
  - The raw helper bundles are now extractable.
  - Normalized `1E:8000` row previews strongly suggest rows `8..10` are
    rolling-tire phases rather than car names, so the remaining uncertainty is
    where the separate name-bearing surface lives.
  - A stable frame-`1500` front-end car-presentation capture now narrows that surface
    further: removing OAM keeps the `Porsche 959` title box and info panel
    intact while removing the car art, so the name-bearing surface is better
    read as BG/tilemap text rather than these OBJ helpers.

### CLAIM AUDIT

- Claim: `L00C20B/$1C70` is a verified downstream `4`-state `2x2` selection
  surface with three explicit rear-car cells and one separate `BG1`
  stopwatch/clock fourth slot.
- Classification: VERIFIED
- Evidence:
  - `L00C20B` draws row `6` from `16:8000`, `18:8000`, and `1B:8000` before
    entering its input loop.
  - `L00C20B` installs callback `01:C1D2`, which redraws `1E:8000` row
    `0x1D` as a movable selection box over four coordinate pairs from
    `01:C1C2..01:C1D0`.
  - `L00C20B` edits `$1C70` as a `2`-bit field, which yields the exact four
    selector values `0..3`.
  - [tools/out/snes_frontend_rival_selection_grid.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_rival_selection_grid.json)
    now promotes the structural read and preview PNGs in one artifact.
  - [tools/out/snes_frontend_select_opponent_bg1.png](/home/nivando-soares/asmdump/tools/out/snes_frontend_select_opponent_bg1.png)
    isolates helper `8` on `BG1` and shows `Select Opponent` plus the
    stopwatch/clock slot in the bottom-right quadrant.
- Notes:
  - This closes the geometry and ownership of all four slots.
  - The fourth slot is outside the OAM car-row list because it belongs to the
    helper-backed `BG1` surface, not the rear-car descriptor family.

### CLAIM AUDIT

- Claim: `L00C20B/$1C70` is the strongest current SNES equivalent of the
  user-guided `3 rivals + clock` menu between car selection and phase
  selection.
- Classification: VERIFIED
- Evidence:
  - The static flow already fits the user-guided sequence:
    `L00BAE8 -> L008B3E -> L00C20B -> L00BE76`.
  - `L00C20B` exposes a `4`-state surface immediately after the `3`-car
    `$0202/$1C78` corridor and immediately before the verified `4`-track
    `$1C7C` selector.
  - Three of the four cells are explicit rear-car renders.
  - The fourth slot is now directly visible on helper `8` as a `BG1`
    stopwatch/clock icon under the `Select Opponent` banner.
  - `L008B87` later collapses the same selector into downstream handoff fields:
    `$1C70 = 0..2 -> $1C76 = 1, $1C7A = $1C70`, while
    `$1C70 = 3 -> $1C76 = 0, $1C7A = 0`.
- Notes:
  - The open semantic edge is now narrower:
    the icon and first no-opponent split are both closed, while the exact live
    gameplay/HUD behavior after choosing it still belongs to the later
    play-session boundary lane.

### CLAIM AUDIT

- Claim: The fourth `Select Opponent` slot already collapses into a verified
  no-opponent handoff split through `$1C76/$1C7A`.
- Classification: VERIFIED
- Evidence:
  - `L008B87` only executes `dex ; lda #$0000` when `$1C70 == 3`, then stores
    `X -> $1C76` and `A -> $1C7A`.
  - For selector values `0..2`, the same path stores `$1C76 = 1` and
    preserves `$1C7A = $1C70`.
  - `$1C7A` later selects rival-facing tables in `bank1.asm:1820-1837`,
    `bank1.asm:1965-1975`, and `bank2.asm:2675-2702`.
  - `$1C76` gates later branch work in `bank1.asm:2403-2405` and
    `bank2.asm:2943-2958`, `bank2.asm:4118-4129`, and `bank2.asm:4671-4682`.
  - [tools/out/snes_frontend_select_opponent_mode_split.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_select_opponent_mode_split.json)
    now consolidates the split and branch sites.
- Notes:
  - This closes the immediate handoff distinction between the fourth clock slot
    and the three rival-car cells.
  - The unresolved part is no longer whether the branch exists.
  - The unresolved part is how that branch manifests later in live gameplay.

### CLAIM AUDIT

- Claim: `01:9C77` indexes three car-specific OBJ catalogs, while the visible
  car-name/info box belongs to a separate `BG2` helper-bundle path.
- Classification: VERIFIED
- Evidence:
  - `01:9C77` resolves the three per-car bases `1A:8000`, `1A:97D8`, and
    `11:A578`, and `L009D69/L009DC6` consume those bases through the same
    `$0202` selector domain.
  - [tools/out/snes_car_obj_catalog_manifest.json](/home/nivando-soares/asmdump/tools/out/snes_car_obj_catalog_manifest.json)
    now promotes the canonical car OBJ labels:
    - `1A:97D8` -> Porsche 959 body plus wheel/canopy pieces
    - `11:A578` -> Lamborghini Diablo body plus wheel/canopy pieces
    - `1A:8000` -> Ferrari F40 body plus wheel/canopy pieces
  - The stable frame-`1500` front-end car-presentation capture reached via
    `TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start'` keeps the
    `Porsche 959` title box, prompt, and stats panel in a BG-only render from
    `tools/render_mesen_snes_bg.py`, while the car itself disappears without
    OAM and returns when OAM is composed.
  - [rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json](/home/nivando-soares/asmdump/rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json)
    now anchors that live lower-screen BG surface to helper bundle `10`:
    - `L00A9A0 00:B6B2 -> VRAM 0x1000` for the live `BG2` tilemap base
    - `L00A9CB 0E:91FE -> VRAM 0x3000` for the live `BG2` CHR base
  - `L00BC0F` statically proves the per-car panel reload uses
    `$0202 + 0x0009` through `L00A9A0/L00A9CB`, without a paired per-car
    `L00A9F2`.
  - The second-right probe reaches a third live selector anchor by changing
    `state_0202` from `2` to `0` at frame `1677`; the exact-frame raw dump at
    frame `1780` keeps the same `BG1/BG2` state fields as frames `1500/1640`.
  - [tools/out/car_select_raw_bg1_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1500_vs_1640.json),
    [tools/out/car_select_raw_bg1_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1500_vs_1780.json),
    and [tools/out/car_select_raw_bg1_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg1_1640_vs_1780.json)
    all report `0` changed visible `BG1` cells across the three live anchors.
  - [tools/out/car_select_raw_bg2_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1500_vs_1640.json),
    [tools/out/car_select_raw_bg2_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1500_vs_1780.json),
    and [tools/out/car_select_raw_bg2_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_1640_vs_1780.json)
    keep the exact-frame `BG2` tilemap delta to the top screen row only:
    `27/11/27` changed cells for `1500->1640`, `1500->1780`, and
    `1640->1780`.
  - [tools/out/car_select_raw_bg2_chr_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_1500_vs_1640.json),
    [tools/out/car_select_raw_bg2_chr_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_1500_vs_1780.json),
    and [tools/out/car_select_raw_bg2_chr_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_1640_vs_1780.json)
    all report `0` changed visible-union `BG2` CHR tiles and `0` changed
    visible-union `BG2` CHR bytes across those same three pairings.
  - [tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json),
    [tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json),
    and [tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json](/home/nivando-soares/asmdump/tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json)
    all report `0` changed bytes across the full inferred `BG2` CHR region
    `0x3000..0x5FFF` (`12288` bytes) for those same three pairings.
  - [tools/out/car_select_bg1_1500_vs_1640_right.json](/home/nivando-soares/asmdump/tools/out/car_select_bg1_1500_vs_1640_right.json)
    reports `0` changed visible `BG1` cells between the `Porsche 959` frame
    `1500` and the `Lamborghini Diablo` frame `1640`.
  - [tools/out/car_select_bg2_1500_vs_1640_right.json](/home/nivando-soares/asmdump/tools/out/car_select_bg2_1500_vs_1640_right.json)
    reports `256` changed visible `BG2` cells over bbox `x=0..247`,
    `y=128..223`, with matching `BG2` state fields in both frames.
- Notes:
  - This reclassifies the per-car bases as animation/catalog surfaces for the
    visible car sprite, not as the car-name text source.
  - The current `1500/1640/1780` frame trio should be described
    conservatively as one front-end car-presentation corridor, not yet as a
    proven interactive car-select menu.
  - The exact-frame raw comparisons narrow the visible `BG2` change further
    than the earlier design-pack diff: the tilemap delta is small and
    top-row-bound, while the visible-union `BG2` CHR delta is currently zero.
  - The current best exact-frame read is therefore shared glyph/panel CHR plus
    a small title-row tilemap change, not a proven visible CHR swap.
  - The full inferred `BG2` CHR region is also flat across the three anchors,
    so the current exact-frame difference is now best read as tilemap-only.
  - The raw third anchor at `state_0202 = 0` is the remaining front-end slot
    by elimination against the calibrated `01:9C77` catalogs, so it is the
    strongest current `Ferrari F40` candidate even though the name-bearing
    text proof is not yet promoted directly.
  - `mesen_ppu_extract` diverged from the exact-frame raw dump at `1780`, so
    the raw runner dump is now the source of truth for exact front-end frame
    comparisons until that extractor timing mismatch is explained.

### CLAIM AUDIT

- Claim: the `$1C6A` signboard menu now has closed branch semantics:
  `Game Options` enters the configuration loop, `Play TDII` advances into the
  downstream `$0202` corridor, and `High Score` enters the `L00A3CC` surface.
- Classification: VERIFIED
- Evidence:
  - At `01:BB7F`, `L00BAE8` branches on `$1C6A`.
  - `$1C6A = 0` reaches `01:BB8D`, which does `jsr L00C0C7 ; jmp L00BAE8`.
  - `$1C6A = 2` reaches `01:BB93`, which does `lda #$FFFF ; jsr L00A3CC ;
    jmp L00BAE8`.
  - The remaining `$1C6A = 1` path returns success from `L00BAE8`, and the
    caller `L008B31` then falls through to `L008B3E`, entering the separate
    `$0202/$1C78` front-end corridor.
  - [tools/out/snes_frontend_top_menu_transitions.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_top_menu_transitions.json)
    records the closed mapping in one artifact.
- Notes:
  - This closes the semantic meaning of the top-level menu, not just the
    rendered signboard text.
  - `Game Options` is now directly tied to the already decoded settings-label
    surface rather than only to a user-guided longplay reading.

### CLAIM AUDIT

- Claim: rows `15..17` in the `1E:8000` front-end table are the top-level
  signboard labels for the separate `$1C6A` menu gate.
- Classification: VERIFIED
- Evidence:
  - `01:BAC3` loads `$00 = $1C6A + 0x000F` and calls `L00179B` against the
    long ROM pointer table rooted at `1E:8000`.
  - [tools/out/snes_frontend_pointer_table_top_menu_0f_11.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_top_menu_0f_11.json)
    decodes rows `15..17` as one adjacent three-row family under that callsite.
  - [tools/out/snes_frontend_top_menu_labels.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_top_menu_labels.json)
    now fixes the rendered row texts as `Game Options`, `Play TDII`, and
    `High Score`.
- Notes:
  - This closes the old user-guided heuristic about the initial signboard menu
    with direct ROM-side descriptor evidence.
  - It also sharpens the ownership split: the downstream `$0202` three-slot
    corridor is not the first top-level signboard surface.

### CLAIM AUDIT

- Claim: rows `0x15..0x1B` in the `1E:8000` front-end table belong to the
  control/sound settings surface, not the car-name surface.
- Classification: VERIFIED
- Evidence:
  - [tools/out/snes_frontend_pointer_table_controls_15_1b.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_controls_15_1b.json)
    renders `Brake`, `Throttle`, `Horn`, `Upshift`, `Downshift`,
    `Steering/Pause`, and `stereo`.
- Notes:
  - This closes one nearby false lead in the front-end naming hunt.

### CLAIM AUDIT

- Claim: The one-shot helper extractor for preview indices `9..11` is now
  recovered, but the clean isolated-layer model only shows visible `BG2`
  content for helper `9`.
- Classification: VERIFIED
- Evidence:
  - Strict `decode_26fb` on `0E:8000` raises
    `26FB decode length mismatch: got 11348 bytes, expected 16640`.
  - The patched `L0006C9` extraction path accepts partial `26FB` output and
    records both declared and actual bulk sizes.
  - [tools/out/bank1_preview_helper_9_11_summary.json](/home/nivando-soares/asmdump/tools/out/bank1_preview_helper_9_11_summary.json)
    records clean one-shot rebuilds with `BG1` non-backdrop `0/0/0` and `BG2`
    non-backdrop `14336/0/0` for helpers `9/10/11`.
- Notes:
  - This is extractor/model evidence, not a proof of final runtime
    presentation.
  - The next unknown is whether helpers `10` and `11` need follow-up
    callbacks, a different PPU layer mix, or are intentionally blank at this
    stage.

### CLAIM AUDIT

- Claim: `$1C7C` is the verified four-slot track/scenery selector in the
  current front-end flow.
- Classification: VERIFIED
- Evidence:
  - `L008B6F` sets `$1C84 = 4` before `L00BE76`.
  - `L00BE76` rotates `$1C7C` over `4` states.
  - `01:8000/01:8008` decodes to group bases/counts
    `[0, 5, 11, 18] / [5, 6, 7, 8]`.
  - `L008B87` derives `$1C7E/$1C80` from `$1C7C`.
  - `L008C10` uses the resulting base/count pair to choose the live descriptor
    row.
  - An adjacent front-end UI helper uses `$00 = $1C7C + 0x000B` against the
    ROM descriptor table rooted at `1E:8000` through `L00179B`.
  - [tools/out/snes_frontend_pointer_table_tracks.json](/home/nivando-soares/asmdump/tools/out/snes_frontend_pointer_table_tracks.json)
    renders rows `11..14` as `Desert Blast - Easy`, `City Bound - Medium`,
    `East Coast - Hard`, and `West Coast - Hardest`.
- Notes:
  - Both the selector mechanics and the human-readable row mapping are now
    closed for the top-level four-slot track surface.

### CLAIM AUDIT

- Claim: The SNES port dropped DOS `select.dat`-style persistence rather than
  remapping it to cart SRAM.
- Classification: PROBABLE
- Evidence:
  - The ROM header reports `sram_size = 0x00`.
  - No current front-end archaeology has recovered a battery-backed selector
    block.
- Notes:
  - This is a strong persistence negative on the cartridge surface.
  - It does not rule out an unproven password-like or other non-SRAM path.

### CLAIM AUDIT

- Claim: `L009568/L0095AD -> L00B1F9/L00B75E` is the nearest SNES equivalent to
  the DOS play-session assembly boundary.
- Classification: PROBABLE
- Evidence:
  - The path increments `$1CA8`, compares it against `$1C80`, and either
    rebuilds through `L008C10` or unwinds to `L008B31`.
  - It sits immediately before deeper runtime work in `L00B1F9` and
    `L00B75E`.
  - Forced `01:9568` and `01:95AD` probes each reach `01:B1F9` once at frame
    `1201`, with stack returns `0x9575 / 0x95B7` and `state_0f77 = 1 / 0`.
  - The original forced `1200..1300` trace window records no writes to
    `7E:096C..0971` and no exec hit at `02:9016`.
  - Short-force follow-ups that inject `01:9568/01:95AD` only on frames
    `1200..1201` still keep `active_main` pinned on `01:9568/01:95AD`
    through frame `2199`, with no traced writes to `7E:096C..0971` and no
    exec hit at `01:B226/B638/B6A3/B6E3/B755/01:9D69/02:9016/02:8F3C`.
- Notes:
  - This is the strongest current boundary candidate.
  - It is still not a verified dual-catalog validity gate.
  - The branch entry itself is real.
  - The remaining proof gap is now a live no-opponent capture problem inside a
    corridor whose default rival path is already recovered organically.

### CLAIM AUDIT

- Claim: The default top-left `Select Opponent` path is now recovered
  organically from power-on into the later `02:9016` gameplay callback family.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json)
    reaches `L00C20B` at frame `1562`, first `01:C1D2` at `1577`,
    `L00BE76` at `1616`, `L008B87` at `1706`, `01:902D` at `1857`, and first
    `active_main = 02:9016` at frame `2014`.
  - [tools/out/select_opponent_clock_path_v2/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v2/td2_boot_probe.json)
    reaches `L00C20B` at frame `1584`, first `01:C1D2` at `1599`,
    `L00BE76` at `1646`, `L008B87` at `1736`, `01:902D` at `1887`, and first
    `active_main = 02:9016` at frame `2044`.
  - In both runs, `$1C70` stays `0` and `$1C76` flips `0 -> 1` only after
    `L008B87`, so the organic path currently closes the default rival slot,
    not the fourth clock slot.
  - [tools/out/snes_select_opponent_organic_default_path.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_organic_default_path.json)
    consolidates the two probe timings and the early `right+down` miss.
- Notes:
  - This removes reachability as the blocker for the `Select Opponent` lane.
  - The remaining unknown is to hit `$1C70 = 3` while `01:C1D2` is already
    live, so the no-opponent path can be compared against the recovered
    default-rival baseline.

### CLAIM AUDIT

- Claim: The remaining fourth-slot clock probe is now blocked by
  callback-relative timing drift rather than by uncertain button semantics.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v3/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v3/td2_boot_probe.json)
    reaches `L00C20B` at frame `1600` but first `01:C1D2` only at
    `1615..1617`, so `right+down` at `1600..1605` still lands too early and
    the run falls through the default-rival baseline again.
  - [tools/out/select_opponent_clock_path_v4/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v4/td2_boot_probe.json)
    delays confirmation, but that also shifts first `01:C1D2` to
    `1628..1637`; `right+down` at `1620..1625` is still early, and the run
    only reaches `L00BE76` before staying on `active_main = 01:BE43` through
    the sampled later frames.
  - [tools/out/snes_select_opponent_clock_timing_narrowing.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_clock_timing_narrowing.json)
    consolidates the two bounded follow-ups.
- Notes:
  - This narrows the remaining input problem substantially.
  - The next defensible probe should overlap `right+down` with the live
    `01:C1D2` window itself or trigger relative to first `01:C1D2`, instead
    of continuing to slide absolute-frame windows forward by guesswork.

### CLAIM AUDIT

- Claim: Callback-relative input windows now close organic fourth-slot
  `Select Opponent` selection into the `L00BE76 -> 01:BE43` corridor with
  `$1C70 = 3` and `$1C76 = 0`.
- Classification: VERIFIED
- Evidence:
  - [tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe.json)
    records `trigger_input_windows` keyed to first `01:C1D2` at frame `1628`,
    then reaches `L00BE76` at `1642` with `$1C70 = 3` and `$1C76 = 0`.
  - The same `v5` run samples `active_main = 01:BE43` at frames `1713`,
    `1736`, `1857`, `1887`, `2014`, and `2044`, with no traced
    `L008B87`, `01:902D`, or `01:9111` hit.
  - [tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe.json](/home/nivando-soares/asmdump/tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe.json)
    reproduces first `01:C1D2` at `1628`, `L00BE76` at `1642`, first
    `01:BE43` at `1713`, and keeps `$1C70 = 3` / `$1C76 = 0` through sampled
    frames `2200`, `2400`, and `2600`.
  - [tools/out/snes_select_opponent_callback_relative_selection.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_callback_relative_selection.json)
    consolidates the callback-relative selection proof and scopes the open
    later confirm edge.
- Notes:
  - The remaining unknown is no longer whether the fourth slot can be selected
    organically.
  - The remaining unknown is the later no-opponent phase-confirm path after
    `01:BE43`, because the bounded `v5/v6` input program omits the later
    confirm `start` used in the default-rival baseline.

### CLAIM AUDIT

- Claim: A later `be43+17-22:start` confirm now closes the organic no-opponent
  path through `L008B87 -> 01:902D -> 01:9111 -> 02:9016`, while preserving
  `$1C70 = 3` and `$1C76 = 0`.
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
    reaches the same downstream timestamps `1736 / 1887 / 2044`, but keeps the
    rival state `$1C70 = 0` / `$1C76 = 1`.
  - [tools/out/snes_select_opponent_no_opponent_organic_path.json](/home/nivando-soares/asmdump/tools/out/snes_select_opponent_no_opponent_organic_path.json)
    consolidates the recovered no-opponent path and the timing/state
    comparison against the default-rival baseline.
- Notes:
  - The remaining unknown is no longer the later confirm path itself.
  - The remaining unknown is the gameplay-facing divergence after the shared
    `02:9016` corridor begins, especially HUD/opponent-side differences tied
    to `$1C76 = 0`.

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

## Next Probes

- Get a deterministic post-attract or menu savestate where `$1CAC/$1CCA/$1CE*`
  are nonzero, then rerun the boot probe to capture a richer selector block.
- Capture live menu `TMAIN/BG1SC/BG2SC/BG12NBA` around the preview cycle so the
  clean one-shot helper builds can be compared against the real layer mix.
- Use the frame-`1500` helper provenance anchor to split the remaining name-box
  ownership across `00:B6B2` tilemap/layout, `0E:91FE` bulk CHR, and
  `02:FBF3` palette payloads, using exact-frame raw dumps before design-pack
  extractor outputs when those two surfaces disagree.
- Reconcile why `L00A9CB` still exists as a per-car reload path even though the
  full inferred exact-frame `BG2` CHR region is identical across the current
  three front-end anchors.
- Trace the follow-up callback/composition path after the helper `9/10/11`
  bundle build to explain why helpers `10` and `11` stay blank in the current
  isolated-layer model.
- Stop treating rows `8..10` as a naming target and locate the separate
  car-name text surface instead.
- Use the now-decoded `0x15..0x1B` settings labels to identify the exact
  front-end submenu/callsite that owns that control/sound surface.
- Use the now-closed no-opponent path plus the `2044..2199` compare artifact
  to target ownership for `state_09a2`, `state_09a8`, and the paired DP
  scratch fields (`$0020/$0022`, `$0053/$0054`) inside the shared
  post-`02:9016` corridor.
- Keep decoding the `01:8016..01:8330` table families into named rows so
  `$1C7C`, `$1CAC`, and `$1CCA` can be tied to concrete assets instead of raw
  indices.
- Trace the `$1C7C`-seeded descriptor rows to name-bearing assets or gameplay
  windows to prove whether that selector is track/scenery-facing.
- Prefer a richer selector-bearing savestate or live debugger capture over
  more direct-force headless windows, because short-force probes now stay
  pinned on `01:9568/01:95AD` without ever staging `$096C-$0971`, while the
  default-rival corridor is already recovered organically without forcing.
