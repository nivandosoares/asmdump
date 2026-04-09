Date: 2026-04-09

Summary
- Converted the current `DA96` lane-1 read into an explicit implementation-agnostic contract note instead of leaving it as scattered shape observations.
- Added a bounded literal-tilemap falsifier for `DA96` and used it to narrow the contract boundary.

What I ran
- refreshed local bank30 decoder artifacts needed by the shape pass:
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_da96.bin --bank 30 --addr 0xDA96 --json-out tools/out/bank30_67fb_da96.json`
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_df6c.bin --bank 30 --addr 0xDF6C --json-out tools/out/bank30_26fb_df6c.json`
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e039.bin --bank 30 --addr 0xE039 --json-out tools/out/bank30_26fb_e039.json`
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e73f.bin --bank 30 --addr 0xE73F --json-out tools/out/bank30_26fb_e73f.json`
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e800.bin --bank 30 --addr 0xE800 --json-out tools/out/bank30_26fb_e800.json`
  - `python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_ee7f.bin --bank 30 --addr 0xEE7F --json-out tools/out/bank30_26fb_ee7f.json`
- reran the structural summary:
  - `python3 tools/analyze_bank30_chunk_shapes.py --json-out tools/out/bank30_chunk_shapes.json --markdown-out tools/out/bank30_chunk_shapes.md`
- new bounded visual-correlation pass:
  - `python3 tools/correlate_bank30_da96_tilemaps.py --json-out tools/out/bank30_da96_tilemap_correlation.json --markdown-out tools/out/bank30_da96_tilemap_correlation.md`

Artifacts
- new contract note:
  - `rom_analysis/docs/bank30_da96_visual_payload_contract.md`
- new static correlator:
  - `tools/correlate_bank30_da96_tilemaps.py`
- new correlation artifacts:
  - `tools/out/bank30_da96_tilemap_correlation.json`
  - `tools/out/bank30_da96_tilemap_correlation.md`
- refreshed structural artifacts:
  - `tools/out/bank30_chunk_shapes.json`
  - `tools/out/bank30_chunk_shapes.md`

Findings / Interpretation
- `DA96` remains best described as a row-major visual payload, not code:
  - `14310` words
  - repeated `0x7C1F` run family on a fixed `157`-word stride
  - repeated-row block still closes at `157 x 33` with `32` identical rows
- The new bounded consumer-side check closes one tempting overclaim:
  - scanning `40` extracted BG tilemaps under current `tools/out/` and `port/assets/`
  - with a literal match threshold of `>= 8` contiguous words
  - produced `0` matches
- Practical consequence:
  - `DA96` still looks visual, but it should not currently be modeled as a
    plain BG tilemap source
  - the stronger next lane-1 step is raw-VRAM or staged-buffer correlation on
    a future real caller path, while `EE7F` remains the better runtime
    reachability target

What I learned (actionable)
- Lane 1 now has a cleaner contract boundary for `DA96`:
  - visual payload: yes, probably
  - plain literal BG tilemap dump: currently disproven for the extracted set
- This makes the next proving options sharper:
  1. chase `EE7F` for runtime reachability
  2. chase `DA96` through raw-VRAM / intermediate-buffer correlation, not
     through more tilemap JSON scans

Next steps / Checkpoints
1) Keep `EE7F` as the primary runtime queue target.
2) When a real `DA96` caller is found, compare the decompressed `314`-byte row
   structure against raw VRAM rows or other staged visual buffers first.
3) Reuse the new `DA96` tilemap correlator as a cheap falsifier whenever a new
   extracted tilemap set is added.

Files updated in this turn
- `tools/correlate_bank30_da96_tilemaps.py`
- `rom_analysis/docs/bank30_da96_visual_payload_contract.md`
- `rom_analysis/docs/bank30_decompression_report.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `tools/README.md`

Next reading
- `rom_analysis/docs/bank30_da96_visual_payload_contract.md`
- `tools/out/bank30_da96_tilemap_correlation.md`
- `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`

Date: 2026-04-08

Summary
- Narrowed the speed-side explanation enough to support the simple
  gameplay-motion write-up without overclaiming.
- `$11CE` is now materially stronger as a real gameplay speed field even
  though the final accelerator-to-speed writer is still open.

What I ran
- bounded reads over the strongest current speed consumers:
  - `sed -n '1188,1418p' bank2.asm`
  - `sed -n '4498,4598p' bank2.asm`
  - `sed -n '7448,8015p' bank2.asm`
  - `sed -n '2818,2878p' bank1.asm`
- bounded writer search:
  - `rg -n 'sta \\$11CE|stz \\$11CE|inc \\$11CE|dec \\$11CE|adc \\$11CE|sbc \\$11CE|cmp \\$11CE|lda \\$11CE' bank*.asm`

Artifacts
- new partial speed note:
  - `rom_analysis/docs/gameplay_speed_path_partial.md`
- refreshed simple gameplay-motion note:
  - `rom_analysis/docs/gameplay_motion_explained_simple.md`

Findings / Interpretation
- The exact low-level writer into `$11CE` is still not promoted.
- But `$11CE` itself is now strong enough to treat as real gameplay speed:
  - `L010981..L0109A5` decodes it into compact visible HUD marker/needle state
  - `L012521` uses it as the index into the generated `$1A28` span/depth map
  - `L013CD9..L013F4D` uses it repeatedly in the live movement/curvature math
- That means the remaining speed gap is narrower than before:
  it is no longer "is `$11CE` really speed?" but
  "where exactly is the authoritative accelerator-driven writer?"

Next steps / Checkpoints
1) Keep searching for the authoritative `$11CE` writer, likely in noisier
   bank-10 or adjacent control code.
2) Keep the simple visible-motion explanation aligned to the stronger partial
   speed read instead of calling the whole speed path unknown.
3) Continue the road/world producer work in `L01318D`.

Files updated in this turn
- `rom_analysis/docs/gameplay_speed_path_partial.md`
- `rom_analysis/docs/gameplay_motion_explained_simple.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/gameplay_speed_path_partial.md`
- `rom_analysis/docs/gameplay_motion_explained_simple.md`
- `rom_analysis/docs/bank2_main_callback_9016_human.md`

Date: 2026-04-08

Summary
- Added a simple "game explained" note for the currently strongest proven
  live-race motion path.
- The note is aimed at non-specialists and explains the visible chain from
  "player presses accelerate" to "road starts moving on screen."

What I ran
- grounded the simple note against already-promoted code paths and notes:
  - `bank1.asm` `01:9111`
  - `bank2.asm` `02:9016`, `L011165`, `L0109FD`, `L01397E`, `L01318D`
  - `rom_analysis/docs/bank2_main_callback_9016_human.md`
  - `rom_analysis/docs/bank1_irq_callback_96a0_human.md`
  - `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
  - `rom_analysis/maps/tracks/track1_live_race_l01318d_static_role_split.md`

Artifacts
- new simple explanation note:
  - `rom_analysis/docs/gameplay_motion_explained_simple.md`

Findings / Interpretation
- The current explanation is now simple enough to hand to a non-engineer
  without dropping the core bank split:
  - `02:9016` = input/control gate
  - `L0109FD -> L01397E` = control/progression fold
  - `L01318D` = strongest current road/world producer cluster
  - `01:960D -> 01:96A0` = visible display split that writes the road layer
    scroll from `$22/$23`
  - NMI/bank 0 = final upload to hardware
- One honesty boundary remains:
  the exact low-level button-to-`$11CE` speed-increment routine is still not
  fully closed, so the note explains the visible motion pipeline rather than
  claiming every speed/physics primitive is fully decoded.

Next steps / Checkpoints
1) Close the exact accelerator-to-`$11CE` physics path.
2) Keep tracing how `L01318D` chooses between its generic and alternate submit
   paths.
3) Keep the later frame-`3250` queue-backed object path separate from the
   simpler "road moves forward" explanation.

Files updated in this turn
- `rom_analysis/docs/gameplay_motion_explained_simple.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/gameplay_motion_explained_simple.md`
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`

Date: 2026-04-08

Summary
- Tried to restore headless Mesen probing on this host so the next bank pass
  could gather live evidence instead of only mining archived JSON artifacts.
- The local Mesen runtime is still blocked, but the fallback archaeology pass
  still closed an important ownership question:
  `09A2/09A8/0053/0054` are not best read as anonymous `02:9016`
  gameplay-mode bytes.
- The stronger current read is:
  - `09A2` = OAM staging cursor / sprite-count surface
  - `09A8` = builder-side allocator control value
  - `0053/0054` = descriptor-ring producer/consumer cursors

What I ran
- Mesen recovery attempts:
  - cloned `https://github.com/SourMesen/Mesen2` to `/home/nivando/Mesen2`
  - inspected `COMPILING.md` and the root `makefile`
  - downloaded `Mesen_2.1.1_Linux_x64.zip`
  - extracted `/home/nivando/mesen-release/extracted/Mesen`
  - supplied user-space runtime deps with locally extracted Debian packages:
    `libsdl2-2.0-0`, `libsamplerate0`, `libxss1`, `libdecor-0-0`
- bounded headless probe attempts:
  - short boot probe through `validation/run_mesen_probe_boot.sh`
  - short gameplay probe through `validation/run_mesen_gameplay_probe.sh`
- fallback code/probe reads:
  - `sed -n '3270,3465p' bank0.asm`
  - `sed -n '2080,2148p' bank1.asm`
  - `sed -n '3528,3640p' bank1.asm`
  - `sed -n '6248,6310p' bank1.asm`
  - `sed -n '1280,1525p' bank2.asm`
  - `sed -n '1,180p' rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
  - cached compare artifacts under `tools/out/post9016_*` and
    `tools/out/snes_select_opponent_post_9016_state_compare.json`

Artifacts
- promoted ownership clarification into the main human notes:
  - `rom_analysis/docs/bank2_main_callback_9016_human.md`
  - `rom_analysis/docs/snes_runtime_algorithm_human.md`
  - `rom_analysis/docs/progress_checkpoints.md`

Findings / Interpretation
- The headless Mesen route is not working yet on this host.
- Even after supplying the missing shared libraries in user space, both the
  short boot probe and the short gameplay probe abort inside the Mesen runtime
  with `std::bad_cast`.
- Because the official Linux release asset is only the single `Mesen` binary,
  the current best explanation is a mismatch between that launcher and the
  borrowed local `MesenCore.so` under `.mesen-config/Mesen2`.
- The archaeology side still moved forward:
  - `09A2` now reads as the bank-0 OAM staging cursor that `L00154E` resets
    and `L001662/L00179B` advance as sprite rows are emitted
  - `09A8` now reads as the builder-side allocator control copied into the
    `$0AAA` allocator/TTL family by bank-0 `L0015E1`
  - bank-1 `L009185` preserving/restoring `09A2` around helper rendering is
    strong evidence that these are workload/build surfaces, not top-level
    gameplay mode flags
  - the recurring post-`9016` `0053/0054` differences fit the already-promoted
    `7E:0600` descriptor-ring cursor model
- This materially narrows the older “post-9016 unknowns” bucket:
  the remaining question is no longer what those bytes broadly are, but which
  specific producer cluster advances the extra rival/no-opponent workload
  inside the shared `02:9016 / 01:96A0 / 02:8F3C` family.

What I learned (actionable)
- Treat the post-`9016` split in two layers:
  1. stable visible rival-only marker:
     `state_11f3 -> oam_0730`
  2. secondary workload/queue surfaces:
     `09A2/09A8/0053/0054` plus transient `0020/0022`
- Stop treating `09A2/09A8` as candidate top-level race-state fields in the
  main bank notes.
- If live Mesen probing becomes available later, the next probe should target
  the producer cluster around `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
  instead of re-proving the already-closed `11F3 -> oam_0730` split.

Next steps / Checkpoints
1) Either build a matched local Mesen runtime or fetch a compatible
   `MesenCore.so` bundle so `--testRunner` works again.
2) Trace which later bank-2 producer path owns the extra rival/no-opponent
   `09A2/09A8/0053/0054` workload movement.
3) Keep the heavy selector/control work on `02:9016 -> L0109FD` and the later
   path that chooses the queue-backed SNES-bank-`$15` upload behind frame
   `3250`.

Files updated in this turn
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`

Date: 2026-04-08

Summary
- Closed an important control-flow correction in bank 2:
  `02:9016` does not fall through into `L0110B2`.
- The anonymous main callback block at `02:9016` now reads as a self-contained
  transition/input-history gate with `RTL` on every currently visible path.
- `L0110B2 -> L011551` is still a strong selector-to-runtime builder, but it
  is called separately from bank 1 at `L009075`, which moves it from
  “per-frame callback body” to “gameplay-entry/setup builder.”
- Closed the first direct downstream consumers:
  - `02:9016` state feeds into `L0109FD` through `$118F/$1191/$11BD`
  - `$1A28` feeds into `L012521`
  - `$13FC` is a progression bound inside `L01397E`

What I ran
- bounded anonymous bank-2 block read:
  - `sed -n '1860,2145p' bank2.asm`
- bounded raw LoROM dump for `02:8F34..02:90C0`
- bounded callback/setup reads:
  - `sed -n '1940,2005p' bank1.asm`

Artifacts
- corrected callback/setup notes:
  - `rom_analysis/docs/bank2_main_callback_9016_human.md`
  - `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
  - `rom_analysis/docs/bank2_gameplay_entry_human.md`
  - `docs/dev_team_handoff.md`
  - `docs/engine_pseudocode.md`
  - `docs/bank_disassembly_status.md`
  - `rom_analysis/docs/snes_runtime_algorithm_human.md`
  - `rom_analysis/docs/progress_checkpoints.md`

Findings / Interpretation
- The raw branch layout around `02:9016` now closes one tempting false lead.
- The anonymous `02:9016` callback body does not jump or fall through into
  `L0110B2`; after the `$0996`, `$0998`, and `$11BD` control branches it
  always returns via `RTL`.
- That means `L0110B2 -> L011551` should not currently be modeled as “the
  next phase of `02:9016`”.
- The strongest proven caller for `L0110B2` remains the bank-1 setup corridor
  at `L009075`, after the derived bundle and the `$1C78/$1C7A` asset staging
  have already been performed.
- This is a useful narrowing move:
  `02:9016` is the active per-frame gate;
  `L0110B2 -> L011551` is the separate setup builder that prepares deeper
  gameplay runtime surfaces.
- The next positive closure is that these surfaces already have concrete
  consumers:
  - `L0109FD` reads `$118F/$1191/$11BD` and folds them into `$137E`
  - `L012521` reads `$1A28[speed_index]`
  - `L01397E` uses `$13FC` as an active progression bound

What I learned (actionable)
- The gameplay architecture is cleaner than the earlier rough read:
  1. bank 1 collapses selectors and performs setup-time calls
  2. bank 2 `L0110B2 -> L011551` builds generated runtime tables
  3. bank 2 `02:9016` runs as the later active callback gate
  4. bank 1 `01:960D -> 01:96A0` owns the visible IRQ split
- The next high-value task is no longer “find the 9016 -> 110B2 edge”; that
  edge is currently disproven.

Next steps / Checkpoints
1) Broaden the `02:9016 -> L0109FD` consumer chain beyond the first proven
   read through `$137E`.
2) Type the bank-10 and later bank-2 consumers of `$14DC/$13FC/$1A28` into
   better human pseudocode.
3) Keep tracing the path that eventually chooses the queue-backed SNES-bank-`$15`
   upload behind frame `3250`.

Files updated in this turn
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- `rom_analysis/docs/bank2_gameplay_entry_human.md`
- `docs/dev_team_handoff.md`
- `docs/engine_pseudocode.md`
- `docs/bank_disassembly_status.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- `rom_analysis/docs/bank1_irq_callback_96a0_human.md`

Date: 2026-04-08

Summary
- Typed the next heavy bank-2 builder block after the anonymous `02:9016`
  gate: `L0110B2 -> L011551`.
- Closed the first strong human read for that block as a selector-to-runtime
  builder rather than a menu or HUD helper.
- The current best interpretation is:
  - build one generated profile from `$1C7A`
  - post-process its `$1A28` span map through a tiny local transform table
  - rebuild the active profile from `$1C78`
  - seed one-lane vs rival-present runtime state from `$1C76`

What I ran
- bounded bank-2 reads around the builder and its siblings:
  - `sed -n '2050,2145p' bank2.asm`
  - `sed -n '2445,3065p' bank2.asm`
- bounded selector provenance reads in bank 1:
  - `sed -n '1468,1558p' bank1.asm`
  - `sed -n '1940,2005p' bank1.asm`
- bounded search for selector fields:
  - `rg -n "1C78|1C7A|1C76|1CCA" bank1.asm bank2.asm docs rom_analysis/docs`

Artifacts
- new builder note:
  - `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- refreshed team-facing callback/runtime docs:
  - `rom_analysis/docs/bank2_gameplay_entry_human.md`
  - `docs/bank_disassembly_status.md`
  - `docs/dev_team_handoff.md`
  - `rom_analysis/docs/snes_runtime_algorithm_human.md`
  - `rom_analysis/docs/progress_checkpoints.md`

Findings / Interpretation
- `L0110B2` is just a wrapper; the real work is `L011551`.
- `L011551` is only called from bank 1 after the derived gameplay bundle is
  already materialized, which makes it a good boundary between
  front-end-selected state and deeper gameplay runtime state.
- The routine has a clear two-profile structure:
  first keyed by `$1C7A`, then keyed by `$1C78`.
- Because bank-1 archaeology already closes `$1C7A` as the
  rival/no-opponent-derived selector and `$1C78` as the earlier player-facing
  car selector, the strongest current read is that this routine builds a
  secondary profile first and then rebuilds the active primary profile.
- The generated surfaces are now materially narrowed:
  `$14DC`, `$13FC`, and especially `$1A28` are runtime-generated maps/tables,
  not presentation lists.
- A useful low-level detail also closed here:
  the post-process profile table at `02:9549/02:954D` is embedded directly in
  the routine's own byte stream and indexed by `$1C6C`, with `$0996` forcing
  the fallback profile `3`.

What I learned (actionable)
- The architecture now reads more cleanly:
  bank 1 collapses selectors, then bank 2 `L011551` turns them into generated
  gameplay working state before the later gameplay frame loop keeps stepping.
- The next high-value bank-2 questions are less about "where is gameplay?" and
  more about naming the generated surfaces and linking them back to specific
  visible late-gameplay behaviors.

Next steps / Checkpoints
1) Keep tracing the anonymous `02:9016 .. 02:90B2` control block and identify
   which branch leads into `L0110B2`.
2) Name the generated `$1A28 / $14DC / $13FC` surfaces by comparing them
   against later bank-2/bank-10/bank-11 consumers.
3) Tie the state that arms `L011551` and the bank-1 IRQ family to the later
   queue-backed SNES-bank-`$15` object path behind frame `3250`.

Files updated in this turn
- `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- `rom_analysis/docs/bank2_gameplay_entry_human.md`
- `docs/bank_disassembly_status.md`
- `docs/dev_team_handoff.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/bank2_gameplay_builder_110b2_11551_human.md`
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/bank1_irq_callback_96a0_human.md`

Date: 2026-04-08

Summary
- Typed the promoted bank-1 gameplay IRQ callback family into human
  pseudocode instead of leaving `01:96A0` as a vague callback name.
- Closed the first strong semantic read for the anonymous bank-1 span
  `01:960D -> 01:96A0 -> 01:97B1/97E1/9809`: it is the visible
  `BG1/BG3/window/color-math` split lane, not the gameplay main loop.
- Refreshed the team-facing handoff/runtime/status docs so the callback bundle
  now reads as:
  - bank 2 main/control gate: `02:9016`
  - bank 1 visible IRQ split: `01:960D / 01:96A0`
  - bank 2 NMI-side gameplay partner: `02:8F3C`

What I ran
- bounded raw LoROM dump for the anonymous bank-1 IRQ region:
  - `python3` byte dump over `game.smc` for `01:9600..01:9840`
- bounded bank disassembly reads:
  - `sed -n '2550,2825p' bank1.asm`
  - `sed -n '2480,2765p' bank2.asm`
  - `sed -n '2860,3065p' bank2.asm`

Artifacts
- new IRQ-side human note:
  - `rom_analysis/docs/bank1_irq_callback_96a0_human.md`
- refreshed team-facing callback docs:
  - `docs/bank_disassembly_status.md`
  - `docs/dev_team_handoff.md`
  - `docs/engine_pseudocode.md`
  - `rom_analysis/docs/bank2_gameplay_entry_human.md`
  - `rom_analysis/docs/next_steps_roadmap.md`
  - `rom_analysis/docs/progress_checkpoints.md`
  - `rom_analysis/docs/snes_runtime_algorithm_human.md`

Findings / Interpretation
- The bank-1 gameplay IRQ lane is no longer best described as
  “some callback near `01:96A0`”.
- `01:960D` is the first-stage IRQ setup point:
  it applies one of the BG1 offset presets from `$11AB`, restores the default
  `TMAIN/CGWSEL` surface, and under a narrower late-gameplay condition arms
  the second-stage callback `01:96A0`.
- `01:96A0` is the second-stage visible split routine:
  it applies BG3 scroll, window, and color-math writes, reprograms `VTIMEL`,
  and may schedule one or two follow-up IRQ slices through the anonymous
  continuations `01:97B1`, `01:97E1`, and `01:9809`.
- This narrows the heavy remaining archaeology target:
  the hard unresolved problem is less “what is `01:96A0`?” and more
  “what exact bank-2/gameplay state arms this IRQ family and chooses the
  queue-backed SNES-bank-`$15` object path?”

What I learned (actionable)
- The promoted callback bundle now has clearer ownership:
  - bank 2 main/control gate
  - bank 1 visible split IRQ lane
  - bank 2 NMI upload partner
- For port planning, late gameplay must preserve mid-frame IRQ-visible PPU
  reprogramming, not only queue/NMI behavior.

Next steps / Checkpoints
1) Keep tracing the bank-2 selector/control block in `02:9016 .. 02:90B2`.
2) Tie the conditions that arm `01:960D -> 01:96A0` to the same state changes
   that eventually choose the SNES-bank-`$15` object upload behind frame
   `3250`.
3) Compare `L011551` with its sibling gameplay setup/build routines to decide
   whether it is the next high-value track-span/state-builder note.

Files updated in this turn
- `rom_analysis/docs/bank1_irq_callback_96a0_human.md`
- `rom_analysis/docs/bank2_gameplay_entry_human.md`
- `docs/bank_disassembly_status.md`
- `docs/dev_team_handoff.md`
- `docs/engine_pseudocode.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`

Next reading
- `rom_analysis/docs/bank1_irq_callback_96a0_human.md`
- `rom_analysis/docs/bank2_main_callback_9016_human.md`
- `rom_analysis/docs/snes_bank15_object_catalog_human.md`

Date: 2026-04-08

Summary
- Corrected a bank-namespace mismatch around the late-entry `3250` object:
  the proven payload address `15:B4A8 -> 15:B4B8` is SNES bank `$15`, which
  maps to repo file `bank21.asm`, not repo file `bank15.asm`.
- Added shared-session reuse to the PTY helper so callers can keep one live
  shell and reattach to it by pointer instead of spawning a new session every
  time.
- Refreshed the main bank/team handoff docs to match the current promoted
  bank map: `bank0`, `bank1`, `bank2`, `bank10`, `bank11`, `bank21($15)`,
  and `bank30`.
- Rewrote the dev-team handoff around current human pseudocode and current
  unresolved bank edges instead of the older `bank10/11/30`-only framing.

What I ran
- bounded LoROM address sanity check for `15:B4A8`:
  - `od -Ax -tx2 -N 96 -j $((0x15*0x8000 + (0xB4A8-0x8000))) game.smc`
- bounded terminal-bot smoke:
  - `python3 tools/terminal_bot.py self-test`

Artifacts
- shared current-session support:
  - `tools/terminal_bot.py`
- refreshed tooling usage notes:
  - `tools/README.md`
- refreshed team-facing bank docs:
  - `docs/bank_disassembly_status.md`
  - `docs/dev_team_handoff.md`
  - `rom_analysis/docs/bank2_gameplay_entry_human.md`
  - `rom_analysis/docs/bank2_main_callback_9016_human.md`
  - `rom_analysis/docs/snes_bank15_object_catalog_human.md`

Findings / Interpretation
- The repo had been mixing decimal file names (`bank15.asm`, `bank21.asm`)
  with hex-style SNES bank addresses (`15:B4A8`). A quick LoROM offset check
  closes that ambiguity: the promoted late object lives in SNES bank `$15`,
  not SNES bank `$0F`.
- The PTY helper already persisted session logs and metadata, but callers
  still had to pass raw `session_...` ids around manually, which encouraged
  unnecessary new session starts.
- A shared `current_session.json` pointer plus `@current` alias is enough to
  keep multi-host automation on one live session without changing the
  underlying PTY/session model.
- The helper smoke exposed a real teardown bug in the PTY drain loop: EOF on
  the master PTY could spin forever during close. Fixing that also makes the
  session helper more reliable for long-lived reuse.
- The older handoff docs were behind the promoted archaeology state. The
  stronger current human read is bank-scoped:
  gameplay is `bank2`-anchored, `bank10/11` are service banks, and
  `bank21($15)/bank30` are typed support/content banks with specific unresolved
  provenance edges.

What I learned (actionable)
- For this repo, “resume the last live shell” should be the default operator
  habit. `@current` is the right level of indirection; a second session layer
  is unnecessary.
- The dev-team handoff reads better when it leads with bank ownership and
  pseudocode, then points to deeper archaeology notes for proof.

Next steps / Checkpoints
1) Use `python3 tools/terminal_bot.py start --resume-current` plus
   `exec @current ...` as the default automation path.
2) Keep turning the active support banks into team-readable pseudocode,
   starting from the SNES-bank-`$15` selector path and the remaining unresolved
   bank-30 targets `DA96/EE7F`.

Files updated in this turn
- `tools/terminal_bot.py`
- `tools/README.md`
- `docs/bank_disassembly_status.md`
- `docs/dev_team_handoff.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/terminal_bot.py`
- `docs/dev_team_handoff.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`

- Reframed the DOS lane one level lower around future engine work instead of
  pushing immediately into packed-asset rendering.
- Promoted the first repo-owned DOS contract lane instead of keeping DOS as an
  off-repo assumption behind SNES-correlation prose.
- Added a Python-only DOS executable extractor that recovers launcher,
  sidecar-resource, persistence/media, disk-role, toggle, and
  gameplay-failure/reporting surfaces from the shipped DOS binaries.
- Added a minimal runnable DOS frontend model that replays the first
  contract-driven selection/play-gate surface for future language ports.
- Added an engine-first DOS manifest builder that promotes catalogs, selector
  bootstrap, per-car bundle roles, preview-materializer pairing, and
  play-session gating as the stable reimplementation surface.
- Added review-focused HTML/Markdown outputs so the design team can inspect
  roster, bundle roles, and preview token directions before packed rendering
  exists.
- Added a preview/materializer manifest so engine work can target the real
  `.SS + *ST.PES` bundle contract before implementing decode/render.

What I ran
- source-of-truth recovery:
  - `sed -n '1,220p' PORT_PLAN.md`
  - `sed -n '1,220p' rom_analysis/docs/next_steps_roadmap.md`
  - `sed -n '1,220p' rom_analysis/docs/progress_checkpoints.md`
  - `sed -n '1,220p' rom_analysis/docs/validation_gates.md`
  - `sed -n '1,220p' validation/README.md`
- bounded DOS executable archaeology:
  - Python-only MZ header decode over `../Downloads/testdrive2/DUEL.EXE`
  - Python-only string extraction over:
    - `../Downloads/testdrive2/TD2EGA.EXE`
    - `../Downloads/testdrive2/TD2CGA.EXE`
    - `../Downloads/testdrive2/TD2TDY.EXE`
- bounded validation:
  - `python3 tools/extract_dos_contracts.py ../Downloads/testdrive2 --json-out tools/out/dos_version_contracts.json --markdown-out tools/out/dos_version_contracts.md`
  - `python3 tools/dos_frontend_port.py --contract-json tools/out/dos_version_contracts.json --script 'right_car,right_scenery,drop_scenery_catalog,restore_scenery_catalog,toggle_music' --json-out tools/out/dos_frontend_port_replay.json`
  - `python3 tools/build_dos_engine_manifest.py ../Downloads/testdrive2 --json-out tools/out/dos_engine_manifest.json --markdown-out tools/out/dos_engine_manifest.md`
  - `python3 tools/build_dos_design_review.py --manifest-json tools/out/dos_engine_manifest.json --html-out tools/out/dos_design_review.html --markdown-out tools/out/dos_design_review.md`
  - `python3 tools/build_dos_preview_manifest.py --engine-manifest tools/out/dos_engine_manifest.json --contracts-json tools/out/dos_version_contracts.json --json-out tools/out/dos_preview_manifest.json --markdown-out tools/out/dos_preview_manifest.md`
  - direct Python assertion smoke over extractor output and replay output

Artifacts
- new DOS extractor:
  - `tools/extract_dos_contracts.py`
- new minimal DOS frontend model:
  - `tools/dos_frontend_port.py`
- versioned DOS contract model:
  - `rom_analysis/docs/dos_contract_model.jsonc`
- new engine-first DOS manifest builder:
  - `tools/build_dos_engine_manifest.py`
- new DOS design-review builder:
  - `tools/build_dos_design_review.py`
- new DOS preview/materializer builder:
  - `tools/build_dos_preview_manifest.py`
- versioned engine-first DOS contract model:
  - `rom_analysis/docs/dos_engine_contracts.jsonc`
- new DOS contract note:
  - `docs/dos_version_contracts.md`
- new DOS engine porting note:
  - `docs/dos_engine_porting.md`
- generated local artifacts:
  - `tools/out/dos_version_contracts.json`
  - `tools/out/dos_version_contracts.md`
  - `tools/out/dos_frontend_port_replay.json`
  - `tools/out/dos_engine_manifest.json`
  - `tools/out/dos_engine_manifest.md`
  - `tools/out/dos_design_review.html`
  - `tools/out/dos_design_review.md`
  - `tools/out/dos_preview_manifest.json`
  - `tools/out/dos_preview_manifest.md`

Findings / Interpretation
- The shipped DOS build exposes cleaner contract surfaces than the current
  SNES recovery for front-end/session assembly:
  - graphics-device launcher
  - named `.pcs/.pes` sidecar resource families
  - explicit persistence/media files `select.dat` and `diskid.dat`
  - explicit disk/content roles `MASTER/CAR/SCENERY/PLAY/PROGRAM`
  - explicit play-gate messaging: `Play Disk needs both cars and scenery!`
  - first-class runtime toggles
  - first-class gameplay failure/reporting strings
- That is enough to stop treating DOS contracts as undocumented premises.
- The better near-term DOS porting surface is engine-first rather than
  renderer-first:
  - catalog loader
  - selection state
  - preview materializer contract
  - play-session gate
  - later packed-asset decode/render
- Design review can now happen in parallel with that engine work because the
  new HTML/Markdown surfaces show bootstrap selections, roster, bundle roles,
  and `.SS` token layouts without pretending the packed renderer is solved.
- The preview/materializer surface is now explicit enough to guide the next
  renderer step:
  same-stem `.SS` plus `*ST` packed assets, with token-family classification
  already separated into `window_only` vs `window_plus_face` layouts.
- The live `CARS.DAT` and `SCENES.DAT` files now also make the platform split
  explicit enough to encode directly in the repo instead of forcing a false
  SNES-aligned roster assumption.

What I learned (actionable)
- The best first DOS checkpoint is not “full disassembly” but “versioned
  contract extraction plus runnable state model”.
- The next useful engine artifact is not a flat image renderer but a stable
  manifest of which IDs own which logic/layout/visual bundles.
- Even without local `objdump/strings/ndisasm` availability in this runtime,
  the DOS binaries already yield enough hard evidence to anchor the port lane.
- The next valuable proving targets are exact DOS field layouts and code
  entrypoints, not more SNES-side speculation about equivalent surfaces.

Next steps / Checkpoints
1) Keep the future engine centered on DOS catalogs and selector state before
   writing a packed-asset renderer.
2) Identify the concrete DOS preview/materializer path behind `.SS + *ST.PES`
   so the renderer sits on the right engine abstraction.
3) Expand the engine manifest with the active gameplay parameter consumers of
   `<ID>.BIN` and `<ID>O.BIN`, then promote gameplay-side runtime modules.

Files updated in this turn
- `tools/extract_dos_contracts.py`
- `tools/dos_frontend_port.py`
- `tools/build_dos_engine_manifest.py`
- `tools/build_dos_design_review.py`
- `tools/build_dos_preview_manifest.py`
- `tools/tests/test_dos_contracts.py`
- `docs/dos_version_contracts.md`
- `docs/dos_engine_porting.md`
- `rom_analysis/docs/dos_contract_model.jsonc`
- `rom_analysis/docs/dos_engine_contracts.jsonc`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `validation/README.md`

Next reading
- `docs/dos_version_contracts.md`
- `docs/dos_engine_porting.md`
- `rom_analysis/docs/dos_contract_model.jsonc`
- `rom_analysis/docs/dos_engine_contracts.jsonc`
- `tools/extract_dos_contracts.py`
- `tools/dos_frontend_port.py`
- `tools/build_dos_engine_manifest.py`
- `tools/build_dos_design_review.py`
- `tools/build_dos_preview_manifest.py`

Date: 2026-04-07

Summary
- Recovered the actual repo stop point from the source-of-truth docs and then
  audited the dirty worktree for the separate port changes another agent left
  behind.
- Confirmed the documented checkpoint was still the `2026-04-03` bank-only
  Mermaid work, while the worktree also contained an undocumented
  `2026-04-05` SDL mini-kernel prototype under `port/src/` plus generated
  asset headers.
- Restored the official `port/Makefile` so the promoted SNES-mimetic runtime,
  demo launcher, and smoke targets remain the repo-default build surface, and
  preserved the alternate prototype as `make -C port prototype`.

What I ran
- source-of-truth recovery:
  - `sed -n '1,220p' PORT_PLAN.md`
  - `sed -n '1,260p' rom_analysis/docs/next_steps_roadmap.md`
  - `sed -n '1,260p' rom_analysis/docs/progress_checkpoints.md`
  - `sed -n '1,260p' rom_analysis/docs/validation_gates.md`
  - `sed -n '1,220p' validation/README.md`
- worktree / history inspection:
  - `git status --short`
  - `git log --oneline --decorate -n 12`
  - `ls -lt port/src port/include tools`
  - `git diff --stat -- port tools/extract_raw_layers.py tools/generate_attract_assets.py`
  - `git diff -- port/Makefile ...`
  - `git show HEAD:port/Makefile`
- bounded validation / environment probes:
  - `command -v make`
  - `command -v gcc`
  - `command -v clang`
  - `command -v sdl2-config`
  - `./port/td2_port`

Artifacts
- restored main build surface with preserved side prototype:
  - `port/Makefile`
- runtime note for the side prototype:
  - `port/README.md`

Findings / Interpretation
- The April 5 work is real and substantive, but it is not a continuation of
  the promoted runtime lane. It is a parallel prototype that embeds ROM/raw
  blobs directly and drives a small SDL kernel from `src/main.c`.
- The highest-risk breakage was not the new source files themselves; it was
  the Makefile replacement, which silently displaced the validated runtime and
  test entrypoints described in the repo docs.
- The current host cannot compile or run either SDL path, so the prototype is
  only resumed to the point of safe coexistence and a clear rebuild entry.

What I learned (actionable)
- The clean resume point for the other agent's work is:
  `make -C port prototype` on a machine that actually has a compiler and SDL2.
- Until then, the prototype should stay explicitly separate from the official
  port/runtime lane so it does not mask regressions in the documented build.

Next steps / Checkpoints
1) Rebuild `make -C port prototype` on a toolchain-capable SDL host and record
   whether the mini-kernel still links from source instead of relying on stale
   `src/*.o` artifacts.
2) If it does build, capture one prototype frame and compare it to the
   current design-pack runtime output before promoting any code from it.
3) Keep lane-1 bank30 closure as the primary archaeology gate; treat this
   prototype as a side experiment unless it yields a directly reusable port
   component.

Files updated in this turn
- `port/Makefile`
- `port/README.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `port/README.md`
- `port/src/main.c`
- `port/src/snes_kernel.c`

Date: 2026-04-03

Summary
- Narrowed the new root Mermaid datagram from a mixed archaeology/process view
  into a bank-only SNES disassembly map.
- The root artifact now shows only promoted bank-to-bank flow in the original
  ROM code: `bank0`, `bank1`, `bank2`, `bank10`, `bank11`, `bank15`, and
  `bank30`.
- Kept the short pseudocode tips, but attached them directly to bank nodes so
  the diagram stays focused on original-bank roles and handoffs.

What I ran
- bounded Mermaid render validation:
  - `npx -y @mermaid-js/mermaid-cli -p <temp puppeteer no-sandbox json> -i BANK_INVESTIGATION_DATAGRAM.md -o <temp>/out.md -e svg -a <temp>/artifacts`

Artifacts
- revised root bank-only datagram:
  - `BANK_INVESTIGATION_DATAGRAM.md`

Findings / Interpretation
- The previous version was accurate, but it mixed archaeology process with the
  bank map and diluted the main question.
- The tighter version reads much better as a disassembly orientation sheet:
  which bank hands off to which bank, and where the currently promoted
  callback family actually lives.

What I learned (actionable)
- For this repo, the best root-level Mermaid is not “tooling plus runtime” but
  “banks plus validated handoff edges”.
- `bank0 -> bank1/bank2` and `bank1 -> bank2` are the most important promoted
  control edges to keep visible at summary level.

Next steps / Checkpoints
1) Keep the root datagram bank-only unless a second artifact is explicitly
   needed for the archaeology workflow itself.
2) If lane-1 closes more of `bank30`, add consumer-specific edges instead of
   broadening the diagram back into a process map.

Files updated in this turn
- `BANK_INVESTIGATION_DATAGRAM.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `BANK_INVESTIGATION_DATAGRAM.md`
- `docs/bank0_flow.md`
- `docs/snes_dos_correlation.md`

Date: 2026-04-03

Summary
- Added a root-level Mermaid bank investigation datagram so the current
  archaeology process and promoted bank/callback ownership can be read from
  one file instead of being scattered across multiple notes.
- The new diagram explicitly maps the promoted control spine
  `bank0 -> staged callbacks -> bank1 handoff -> bank2 main/NMI -> bank1 IRQ`,
  plus the currently typed support/content banks `bank10`, `bank11`,
  `bank15`, and `bank30`.
- Added short pseudocode placeholders at the diagram tips so the artifact can
  double as a quick orientation sheet instead of only a static picture.

What I ran
- Mermaid tooling availability probe:
  - `command -v npx`
- bounded Mermaid render validation:
  - `npx -y @mermaid-js/mermaid-cli -p <temp puppeteer no-sandbox json> -i BANK_INVESTIGATION_DATAGRAM.md -o <temp>/out.md -e svg -a <temp>/artifacts`

Artifacts
- new root orientation note:
  - `BANK_INVESTIGATION_DATAGRAM.md`

Findings / Interpretation
- The repo already had the underlying evidence, but it was spread across bank
  flow notes, lane notes, and status docs.
- Putting the investigation loop and the promoted callback spine into one
  Mermaid artifact makes the bank relationships easier to scan without
  flattening unresolved lanes like `bank30`.
- In this environment, Mermaid CLI needed a temporary Puppeteer config with
  `--no-sandbox` before Chromium would launch cleanly for the render check.

What I learned (actionable)
- The shortest faithful high-level explanation is two-layered:
  one graph for the archaeology loop and one graph for the promoted bank
  ownership/callback spine.
- `bank30` should stay labeled as a mixed content/support bank in summary
  visuals: it is clearly typed as dispatch/data, but `DA96` and `EE7F` still
  need different proving lanes.

Next steps / Checkpoints
1) Keep the new root datagram aligned with the promoted callback family and
   bank-status docs as lane evidence changes.
2) If the bank30 queue closes later, tighten the `bank30` node from mixed
   provenance wording into a more specific consumer map.

Files updated in this turn
- `BANK_INVESTIGATION_DATAGRAM.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `BANK_INVESTIGATION_DATAGRAM.md`
- `docs/bank0_flow.md`
- `docs/bank_disassembly_status.md`

Date: 2026-04-03

Summary
- Fixed the second wiki `404` boundary: the NotebookLM bundle is now mirrored
  inside the published wiki root instead of living only as a sibling output
  directory.
- Added `vercel.json` so the repository declares the wiki build command and
  `tools/out/docs_wiki` as the Vercel output root, which matches the actual
  generated static payload.
- Kept the standalone bundle under `tools/out/docs_wiki_markdown_bundle/` for
  offline/local use, but switched published wiki links to the in-tree copy at
  `tools/out/docs_wiki/notebooklm_bundle/`.
- After pushing the repo-side fix, the live Vercel domain still returned
  `404` on six bounded polls, so the remaining failure is now external to the
  repo content itself.

What I ran
- wiki regeneration:
  - `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`
- root-only static-host validation:
  - `python3 -m http.server 8123` from `tools/out/docs_wiki/`
  - bounded HTTP checks for:
    - `/`
    - `/pages/PORT_PLAN.html`
    - `/notebooklm_bundle/wiki_bundle_index.md`
    - `/notebooklm_bundle/wiki_combined.md`
    - `/notebooklm_bundle/sources/PORT_PLAN.md`
- live-host spot check before the fix:
  - `curl -I -L -s https://asmdump.vercel.app/`
  - observed `HTTP/2 404` with `x-vercel-error: NOT_FOUND`
- live-host bounded poll after pushing the fix:
  - `curl` checks over `https://asmdump.vercel.app/` and
    `https://asmdump.vercel.app/notebooklm_bundle/wiki_bundle_index.md`
  - `6` attempts, `10s` spacing, all still `404`

Artifacts
- publish-root fix:
  - `tools/build_docs_wiki_report.py`
- explicit Vercel publish config:
  - `vercel.json`
- refreshed published wiki outputs:
  - `tools/out/docs_wiki/index.html`
  - `tools/out/docs_wiki/notebooklm_bundle/`
  - `tools/out/docs_wiki/pages/**/*.html`
  - `tools/out/docs_wiki/site_index.json`

Findings / Interpretation
- The prior fix closed repo-root escape links, but it still assumed the host
  published both `docs_wiki/` and the sibling
  `docs_wiki_markdown_bundle/` directory together.
- The stronger deploy-safe model is to keep the NotebookLM bundle inside the
  wiki root itself, because static hosts commonly publish just one configured
  output directory.
- The current public domain was also failing at `/`, which is consistent with
  a missing or stale host output-root configuration rather than one bad file
  link.
- Because the host stayed `404` even after the repo-side deploy fix was pushed,
  the remaining blocker is likely Vercel project wiring or a stale external
  deployment, not another bad internal wiki href.

What I learned (actionable)
- For this repo, the published wiki must be self-contained under
  `tools/out/docs_wiki/`.
- The local `docs_wiki_markdown_bundle/` output is still useful, but it should
  be treated as an export artifact, not the only published raw-doc surface.
- A root-only static server probe is the right cheap falsifier for this
  deployment class.

Next steps / Checkpoints
1) Keep the published NotebookLM links anchored on
   `tools/out/docs_wiki/notebooklm_bundle/`.
2) After pushing a wiki/deploy fix, verify the live host root and one raw-doc
   URL instead of validating only local HTML structure.
3) Check the external Vercel project state: the repo now contains a valid
   `vercel.json`, but the public domain still needs an actual deploy that
   serves this repository output.

Files updated in this turn
- `tools/build_docs_wiki_report.py`
- `tools/README.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `vercel.json`
- `tools/out/docs_wiki/index.html`
- `tools/out/docs_wiki/notebooklm_bundle/**`
- `tools/out/docs_wiki/pages/**/*.html`
- `tools/out/docs_wiki/site_index.json`

Next reading
- `vercel.json`
- `tools/build_docs_wiki_report.py`
- `tools/out/docs_wiki/notebooklm_bundle/wiki_bundle_index.md`

Date: 2026-04-03

Summary
- Fixed the curated docs wiki so published per-doc Markdown links no longer
  escape the generated site tree and 404 under static hosting.
- `tools/build_docs_wiki_report.py` now points each wiki `Raw Markdown` action
  at the mirrored NotebookLM bundle copy under
  `tools/out/docs_wiki_markdown_bundle/sources/...` instead of the repository
  source path outside the published wiki payload.
- Regenerated the HTML wiki and bundle outputs so the deployed/static copy is
  immediately consistent with the new link target policy.

What I ran
- wiki regeneration:
  - `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`
- bounded publish-surface validation:
  - `python3 - <<'PY' ...` scan over `tools/out/docs_wiki/**/*.html` asserting
    that local `.md/.jsonc` links resolve through `docs_wiki_markdown_bundle/`
    rather than out to the repo root

Artifacts
- link-target fix:
  - `tools/build_docs_wiki_report.py`
- refreshed published wiki outputs:
  - `tools/out/docs_wiki/index.html`
  - `tools/out/docs_wiki/pages/**/*.html`
  - `tools/out/docs_wiki/site_index.json`
- refreshed NotebookLM bundle outputs:
  - `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.md`
  - `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.json`
  - `tools/out/docs_wiki_markdown_bundle/wiki_combined.md`

Findings / Interpretation
- The bug was structural, not doc-specific:
  the wiki chrome was generating `Raw Markdown` links relative to the repo
  tree, which works locally but breaks once only `docs_wiki/` and the bundle
  are published together as a static payload.
- The mirrored NotebookLM bundle is the correct published raw-doc target
  because it preserves repo-relative paths while staying inside the generated
  site artifact set.

What I learned (actionable)
- The wiki generator should treat the NotebookLM bundle as the canonical
  published raw-doc surface.
- A cheap HTML href scan is enough to catch this class of regression without
  needing a browser pass.

Next steps / Checkpoints
1) Keep future wiki publish checks anchored on the generated bundle paths
   instead of repo-root raw links.
2) If any non-curated raw-doc links need to be exposed later, mirror them into
   the published payload first rather than linking out of tree.

Files updated in this turn
- `tools/build_docs_wiki_report.py`
- `tools/README.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `tools/out/docs_wiki/index.html`
- `tools/out/docs_wiki/pages/**/*.html`
- `tools/out/docs_wiki/site_index.json`
- `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.md`
- `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.json`
- `tools/out/docs_wiki_markdown_bundle/wiki_combined.md`

Next reading
- `tools/build_docs_wiki_report.py`
- `tools/out/docs_wiki/index.html`
- `tools/out/docs_wiki_markdown_bundle/wiki_bundle_index.md`

Date: 2026-04-02

Summary
- Promoted the SDL demo launcher from a single near-static gameplay seed into
  a native archaeology timeline built from raw-state `design_pack` and
  `design_pack_range` artifacts already validated in the port/docs.
- Added a default timeline manifest that remounts investigated credits,
  attract/Mode7, menu, and gameplay screens in sequence, using exact packs
  where present and explicit `infer_hold` stretches only where the current
  archaeology still has gaps.
- Tightened the launcher proof surface by disabling optional
  `layers/main_visible.ppm` reference loading in demo mode, so the launcher
  now runs purely from `raw/vram.bin`, `raw/cgram.bin`, `raw/oam.bin`, and
  `raw/ppu_state.json`.

What I ran
- rebuild affected port binaries:
  - `make -C port`
- targeted demo validation:
  - `./port/test_demo_launcher.sh`
  - `SDL_VIDEODRIVER=dummy ./port/build/td2_demo --scene-dir ./tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --window-width 960 --window-height 540 --frames 1`
- full port validation closure:
  - `make -C port test`

Artifacts
- default archaeology timeline manifest:
  - `port/assets/native_demo_archaeology_timeline.txt`
- upgraded launcher/player:
  - `port/demo_main.c`
  - `port/run_demo.sh`
- demo-path raw-only design-pack loading:
  - `port/include/td2_io.h`
  - `port/include/td2_runtime.h`
  - `port/src/td2_io.c`
  - `port/src/td2_runtime.c`
- strengthened launcher smoke:
  - `port/test_demo_launcher.sh`

Findings / Interpretation
- The default SDL demo is no longer effectively a single-frame proof:
  it now advances across `81` native clips (`504` display frames total) and
  visibly traverses the best-promoted archaeology path currently in-repo:
  credits -> attract bridge/Mode7 -> menu -> gameplay.
- The launcher path now closes a subtle but important proof gap:
  even when a design pack carries `layers/main_visible.ppm`, the demo no
  longer loads that surface into memory for presentation. In demo mode, those
  files are absent from the runtime path instead of merely being ignored at
  compare time.
- The current montage is intentionally honest about open archaeology:
  contiguous ranges stay exact, sparse intro anchors use `exact_hold` timing,
  and the overlay calls out when a displayed stretch is an inferred hold
  instead of a newly solved native frame.

What I learned (actionable)
- The raw-state artifact set is already strong enough to give design a moving,
  SDL-native capability demo without falling back to screenshot playback.
- `design_pack_range.json` is now useful beyond archaeology bookkeeping:
  it can directly drive native presentation timelines as long as the launcher
  expands the per-frame `packDir` entries.
- The next upgrade for this lane is content density, not launcher plumbing:
  replace inferred holds and gameplay snapshots with denser raw-state captures
  or true runtime-owned frame progression.

Next steps / Checkpoints
1) Replace the remaining intro/gameplay `infer_hold` stretches with more
   exact raw-state ranges where archaeology already has nearby coverage.
2) Promote a denser gameplay-native sequence than the current
   `frame0/3250/3400/3550` snapshot set before claiming a continuous gameplay
   demo lane.
3) If design needs faster navigation, add section-skip hotkeys/presets on top
   of the current timeline instead of adding another screenshot-based launcher.

Files updated in this turn
- `port/assets/native_demo_archaeology_timeline.txt`
- `port/demo_main.c`
- `port/include/td2_io.h`
- `port/include/td2_runtime.h`
- `port/run_demo.sh`
- `port/src/td2_io.c`
- `port/src/td2_runtime.c`
- `port/test_demo_launcher.sh`
- `port/README.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/assets/native_demo_archaeology_timeline.txt`
- `port/README.md`
- `rom_analysis/docs/validation_gates.md`

Date: 2026-04-02

Summary
- Added a dedicated native SDL demo launcher for the promoted live-race port
  rail instead of relying on headless compare/dump commands for demos.
- Added an on-screen proof overlay that states the demo is running through the
  native SDL path with `compare` off, `PPM/PNG` dumps off, and no
  ROM/CPU-emulation path.
- Hardened `platform_sdl` with a software-renderer fallback so the launcher and
  the main runtime stay runnable under `SDL_VIDEODRIVER=dummy`.

What I ran
- rebuild affected port binaries:
  - `make -C port`
- targeted launcher/live-input validation:
  - `./port/test_demo_launcher.sh`
  - `./port/test_live_input.sh`
  - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --frames 1`
- full port validation closure:
  - `make -C port test`

Artifacts
- new demo launcher binary and wrapper:
  - `port/demo_main.c`
  - `port/run_demo.sh`
- new demo smoke:
  - `port/test_demo_launcher.sh`
- SDL fallback change:
  - `port/platform_sdl.c`

Findings / Interpretation
- The project now has a presentation-grade SDL entry point for the current
  strongest native gameplay proof, with the overlay carrying the exact claims
  design asked to see on-screen:
  - native SDL path
  - Mesen off
  - ROM/CPU emulation off
  - `PPM/PNG` dump path off
  - compare lane off
- The live-race rail is still the correct rail for this kind of demo:
  it is native/runtime-rendered and contract-backed, while the broader
  attract/no-input loop is still documented elsewhere as hybrid/sample-backed.
- The software-renderer fallback closed a practical packaging gap:
  SDL launcher smoke now runs in dummy environments without requiring an
  accelerated render driver.

What I learned (actionable)
- For design/demo check-ins, the preferred entry point should now be
  `./port/run_demo.sh`, not a compare/dump command line.
- Resolution changes do not need a separate renderer path:
  SDL logical-size presentation plus window resizing is enough for the current
  demo lane.
- The next stronger demo upgrade is still content-side, not launcher-side:
  promote a fuller native attract/demo path before claiming a native no-input
  demo loop.

Next steps / Checkpoints
1) Keep the demo launcher pinned to `gameplay_live_race_mid` until a fuller
   attract or later-gameplay rail is promoted natively.
2) If design wants another presentation preset, add scene/profile wrappers on
   top of `td2_demo` instead of forking another SDL shell.
3) When the attract lane stops being hybrid/sample-backed, promote a second
   launcher preset for that path rather than weakening the current “native
   demo” wording.

Files updated in this turn
- `port/demo_main.c`
- `port/platform_sdl.c`
- `port/Makefile`
- `port/run_demo.sh`
- `port/test_demo_launcher.sh`
- `port/README.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/README.md`
- `validation/README.md`
- `rom_analysis/docs/validation_gates.md`

Date: 2026-04-02

Summary
- Promoted richer gameplay-state fields into the port runtime contract/state
  surface so scheduler-backed gameplay rails are no longer limited to the old
  `state_11f3/dp_0053/dp_0054` subset.
- Extended the `gameplay_live_race_mid` scheduler rail with measured gameplay
  anchors out to frame `95` using the gameplay-first Mesen smoke.
- Hardened the port smokes so they now validate those later gameplay anchors
  directly, including two late `JOY1` mutation cases.

What I ran
- rebuild affected port binaries:
  - `make -C port`
- scheduler rail validation:
  - `./port/test_scheduler.sh`
- input mutation validation:
  - `./port/test_input_mutation.sh`

Artifacts
- promoted contract/state surface:
  - `port/include/td2_contracts.h`
  - `port/src/td2_contracts.c`
  - `port/src/td2_compare.c`
- promoted gameplay scheduler anchors:
  - `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- strengthened port smokes:
  - `port/test_scheduler.c`
  - `port/test_input_mutation.c`

Findings / Interpretation
- The port runtime can now ingest and carry this richer gameplay slice from
  scheduler contracts:
  - `state_0440`
  - `state_09a2/state_09a8`
  - `state_129e/state_18ee`
  - `dp_0020/dp_0022`
  - `dp_0053/dp_0054/dp_0055/dp_0056`
- The promoted `gameplay_live_race_mid` rail is now materially less front-end
  shaped: it carries real queue/route anchors at frames
  `16`, `30`, `60`, `90`, and `95`, all tied to the gameplay-first smoke
  under `tools/out/gameplay_seed_probe_smoke`.
- The input surface is now checked against those later anchors too:
  `JOY1` mutation at frame `60` keeps the measured
  `state_09a2/state_09a8/dp_0020/dp_0022/dp_0053/dp_0054` gameplay state,
  and the same is now true again at frame `95`.
- Validation stayed bounded and closed cleanly:
  - scheduler smoke: `480/480`
  - input mutation smoke: `220/220`

What I learned (actionable)
- The port no longer needs to treat the live-race seed as only an early
  `3 -> 11` proof; it now has a scheduler-backed gameplay checkpoint set
  through frame `95`.
- The next meaningful port-side promotion for this rail is not “more generic
  input plumbing”; it is either:
  - densifying the gameplay rail between these anchors, or
  - promoting the next late-gameplay selector/queue fields once the lane-3
    archaeology proves them.

Next steps / Checkpoints
1) Keep using `tools/out/gameplay_seed_probe_smoke/td2_boot_probe.json` as the
   current source for gameplay-rail promotions until a denser gameplay probe is
   justified.
2) If the next port step needs continuous playback beyond the anchor set,
   capture a denser gameplay-only probe rather than inventing interpolation
   ranges between these exact samples.
3) Feed the still-open lane-3 selector work back into the same contract once
   the upstream path behind `02:B0B1 / 02:B0BD -> L012BE2` is narrowed far
   enough to promote new state safely.

Files updated in this turn
- `port/include/td2_contracts.h`
- `port/src/td2_contracts.c`
- `port/src/td2_compare.c`
- `port/test_scheduler.c`
- `port/test_input_mutation.c`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `PORT_PLAN.md`

Next reading
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.md`
- `port/test_scheduler.c`

Date: 2026-04-02

Summary
- Added a gameplay-first Mesen probe wrapper so lane-3 runs can start from the
  preserved live-race savestate instead of replaying boot, intro, and menus.
- Validated that wrapper against `manual_artifacts/lane3/lane3_live_race_mid.mss`
  and generated a first gameplay-only smoke artifact over frames `0..96`
  relative to the savestate.
- Closed the immediate request behind the earlier `probe_0300` confusion:
  the new gameplay wrapper starts directly on the live-race surface at frame
  `0`, not on the track-select/front-end corridor.

What I ran
- wrapper syntax/permission check:
  - `chmod +x validation/run_mesen_gameplay_probe.sh`
  - `bash -n validation/run_mesen_gameplay_probe.sh`
- gameplay-seed smoke:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=96 TD2_BOOT_PROBE_SAMPLE_EVERY=8 TD2_BOOT_PROBE_CAPTURE_FRAMES='0,30,60,90' TD2_BOOT_PROBE_COMPARE_FRAMES='0,30,60,90' TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/gameplay_seed_probe_smoke/td2_boot_probe ./validation/run_mesen_gameplay_probe.sh ./game.smc`
- gameplay corridor summary:
  - `python3 tools/summarize_deep_probe_corridor.py tools/out/gameplay_seed_probe_smoke/td2_boot_probe.json --frame-start 0 --frame-end 96 --output tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.json --markdown-out tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.md`

Artifacts
- new wrapper:
  - `validation/run_mesen_gameplay_probe.sh`
- gameplay-seed smoke output:
  - `tools/out/gameplay_seed_probe_smoke/td2_boot_probe.json`
  - `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_summary.md`
  - `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_frame.png`
  - `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.json`
  - `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.md`

Findings / Interpretation
- The gameplay wrapper now does exactly what the lane needed:
  it loads `manual_artifacts/lane3/lane3_live_race_mid.mss` by default and
  begins directly inside the live-race family.
- Frame `0` of the new smoke already shows:
  - `main_callback_snes = 02:9016`
  - `irq_callback_snes = 01:96A0`
  - `nmi_callback_snes = 02:8F3C`
  - `state_0202 = FFFF`
  - `state_1C70 = 0`
  - `state_1C76 = 1`
  - `state_11F3 = 477`
  - `dp_0053/0054 = 0x78 / 0x78`
- That closes the practical ambiguity from the stalled boot-based late run:
  the new artifact does not begin on track select or any earlier front-end
  surface.
- The first `96` gameplay-relative frames keep the expected lane-3 shape:
  - callback family stays fixed on `02:9016 / 01:96A0 / 02:8F3C`
  - `state_11f3` rises `477 -> 495`
  - `state_129e` stays `0x0100`
  - `dp_0053/0054` cycle actively through the DMA ring
  - capture frames `60` and `90` show nonzero active queue descriptors
- The run did print many Mesen `Uninitialized memory read` warnings while
  loading the manual savestate, but the probe JSON and derived corridor
  summary still completed and were internally coherent.

What I learned (actionable)
- For lane 3, the default archaeology entry point should now be the new
  gameplay wrapper unless the question explicitly needs the boot/menu path.
- The boot-based deep wrapper remains the right tool for cross-pipeline
  intro/front-end/gameplay handoffs.
- The new gameplay wrapper is the cheaper falsifier for:
  - live-race callback/state checks
  - queue cursor movement
  - `L01318D` branch/activity questions from a real gameplay seed

Next steps / Checkpoints
1) Use `validation/run_mesen_gameplay_probe.sh` for the next bounded trace
   that chases the selector/data path feeding
   `02:B0B1 / 02:B0BD -> L012BE2`.
2) Keep the boot-based deep wrapper for whole-pipeline questions only.
3) If needed, add a second gameplay preset around
   `manual_artifacts/lane3/lane3_live_race_plus30f.mss` rather than
   stretching the boot-based route longer again.

Files updated in this turn
- `validation/run_mesen_gameplay_probe.sh`
- `validation/README.md`
- `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.json`
- `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `validation/README.md`
- `tools/out/gameplay_seed_probe_smoke/td2_boot_probe_corridor_0_96.md`
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`

Date: 2026-04-02

Summary
- Added a reusable deep-probe corridor summarizer so late gameplay windows can
  be reduced into one readable artifact instead of hand-reading the full probe
  JSON.
- Ran a bounded light-profile late probe through frame `3600`, then generated
  a focused corridor report for `3200..3555`.
- Closed the strongest new late-lane narrowing:
  inside the stable `02:9016 / 01:96A0 / 02:8F3C` family, the late corridor
  is now tied specifically to the high-index default `L01318D` branch
  `02:B0B1 / 02:B0BD -> L012BE2`, not to the alternate
  `02:B101 -> L012D5A` path.

What I ran
- attempted heavy late deep-probe profile:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_TOTAL_FRAMES=3600 TD2_BOOT_PROBE_SAMPLE_EVERY=16 TD2_BOOT_PROBE_CAPTURE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_COMPARE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/deep_probe_late/td2_boot_probe ./validation/run_mesen_deep_probe.sh ./game.smc`
- bounded light late deep-probe profile:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_TOTAL_FRAMES=3600 TD2_BOOT_PROBE_SAMPLE_EVERY=16 TD2_BOOT_PROBE_CAPTURE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_COMPARE_FRAMES='2088,3250,3400,3550' TD2_BOOT_PROBE_CAPTURE_SCREENSHOTS=0 TD2_BOOT_PROBE_CAPTURE_PPU_MEMORY=0 TD2_BOOT_PROBE_CAPTURE_WRAM_MEMORY=0 TD2_BOOT_PROBE_TRACE_MODE7=0 TD2_BOOT_PROBE_TRACE_DMA=0 TD2_BOOT_PROBE_TRACE_VRAM=0 TD2_BOOT_PROBE_TRACE_L001210=0 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/deep_probe_late_light/td2_boot_probe ./validation/run_mesen_deep_probe.sh ./game.smc`
- corridor-summary validation:
  - `python3 -m py_compile tools/summarize_deep_probe_corridor.py`
- corridor-summary artifact:
  - `python3 tools/summarize_deep_probe_corridor.py tools/out/deep_probe_late_light/td2_boot_probe.json --frame-start 3200 --frame-end 3555 --output tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.json --markdown-out tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`

Artifacts
- stalled heavy-profile negative result:
  - `tools/out/deep_probe_late/td2_boot_probe_frame_00300.png`
- successful light-profile late probe:
  - `tools/out/deep_probe_late_light/td2_boot_probe.json`
  - `tools/out/deep_probe_late_light/td2_boot_probe_summary.md`
- focused corridor summary:
  - `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.json`
  - `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`
- lane note:
  - `rom_analysis/maps/tracks/track1_late_deep_probe_corridor_3200_3555.md`

Findings / Interpretation
- The heavy late profile was low-yield in this lane:
  it only emitted the frame-`300` screenshot before stalling, so the bounded
  pivot to the light profile was the correct retry.
- The late gameplay corridor now has a stronger code-side read than before:
  - callbacks stay fixed on `02:9016 / 01:96A0 / 02:8F3C`
  - `02:B0B1` and `02:B0BD` appear only on odd frames `3201..3327`
  - `02:B042`, `02:B05D`, `02:B101`, and `02:B134` have `0` hits in
    `3200..3555`
- Because `02:B0B1` and `02:B0BD` are the high-index default-branch setup
  inside `L01318D`, the corridor is now narrowed past the old vague
  “emitter cluster” wording:
  late gameplay is using the default `L012BE2` submit path here, not the
  alternate `L012D5A` submit path.
- The sampled timeline and compare pairs keep the earlier late-lane reading
  intact while sharpening its target:
  - `3250`, `3400`, and `3550` all stay in the same family
  - `state_11f3` rises `169 -> 237`
  - `dp_0022` decays `26 -> 0`
  - `dp_0053/0054` keep the queue-ring cursor motion as the dominant moving
    surface
  - `state_129E` first becomes nonzero in this late family
  - `CGRAM` changes stay `0` on `2088 -> 3250`, `3250 -> 3400`, and
    `3400 -> 3550`
- The front-end carry false lead also stays closed under this new pass:
  - `wram_0200_020f` stays unchanged across the two late compare pairs
  - `wram_1c60_1cef` and `wram_1d00_1d3f` stay unchanged on `3250 -> 3400`
  - practical read:
    the `3250` counterexample is still queue/builder-side late gameplay work,
    not revived front-end selector ownership
- The watched write points stayed silent again in `3200..3555`, which means
  the next bounded trace should move deeper into the data path feeding the
  high-index branch rather than reusing the same exact watch cells.

What I learned (actionable)
- The lane-3 target is no longer “which site inside
  `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B101 / 02:B134` matters?”
- The late corridor now points to one narrower question:
  what feeds the high-index default `L01318D` path
  `02:B0B1 / 02:B0BD -> L012BE2`
  starting at frame `3201`?
- The next static/dynamic proving surface should therefore chase:
  - `$22`
  - `$24`
  - `$26`
  - the `12F2/12F4`-indexed selector family
- The next trace should *not* spend its budget on:
  - callback-family handoff hunting
  - the alternate `02:B101 -> L012D5A` branch

Next steps / Checkpoints
1) Resolve which upstream selector/data path first activates the
   `02:B0B1 / 02:B0BD -> L012BE2` branch at frame `3201`.
2) Keep using the light deep-probe profile plus the corridor summarizer as the
   cheap falsifier before any new heavy capture rerun.
3) If another dynamic pass is needed, trace the operands feeding
   `$22/$24/$26` and the `12F2/12F4` family rather than replaying the same
   watched write-point set.

Files updated in this turn
- `tools/summarize_deep_probe_corridor.py`
- `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.json`
- `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`
- `rom_analysis/maps/tracks/track1_late_deep_probe_corridor_3200_3555.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/maps/tracks/track1_late_deep_probe_corridor_3200_3555.md`
- `tools/out/deep_probe_late_light/td2_boot_probe_corridor_3200_3555.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-02

Summary
- Promoted the old boot probe into a deep Mesen pipeline probe that can cover
  intro, front-end, gameplay entry, and later gameplay anchors in one run
  without drowning the output in unbounded trace spam.
- Added a dedicated wrapper:
  `validation/run_mesen_deep_probe.sh`
  with a default route that drives:
  `intro -> menu -> gameplay entry -> brake corridor -> traffic/collision-era anchors`.
- Extended `validation/mesen_probe_boot.lua` so one run now emits:
  - sparse sampled frame entries (`sample_every`)
  - multi-window trace gating (`trace_windows`)
  - capped `Mode7` / `DMA` / `VRAM` write traces
  - callback/state transition events
  - anchor-frame capture artifacts with queue summaries plus selected WRAM
    region fingerprints
  - consecutive compare pairs over those anchor captures
  - a scan-friendly markdown summary next to the JSON output
- Added a second, interactive Mesen-side collector:
  `validation/mesen_live_play_probe.lua`
  so the dev can keep the probe resident while playing and trigger:
  bookmarks, quick captures, deep captures, and session flushes with
  `Select + L + R + <button>` command chords.
- Updated `validation/run_mesen_capture.sh` so the generic launcher now also
  recognizes `TD2_LIVE_PROBE_OUTPUT_PREFIX`, which makes the live probe
  smoke-testable in headless mode with `TD2_LIVE_PROBE_AUTO_STOP_FRAMES`.

What I ran
- shell syntax check:
  - `bash -n validation/run_mesen_deep_probe.sh`
- deep-probe smoke:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=45 TD2_BOOT_PROBE_TOTAL_FRAMES=24 TD2_BOOT_PROBE_SAMPLE_EVERY=4 TD2_BOOT_PROBE_CAPTURE_FRAMES='0,8,16,23' TD2_BOOT_PROBE_COMPARE_FRAMES='0,8,16,23' TD2_BOOT_PROBE_TRACE_WINDOWS='0-23' TD2_BOOT_PROBE_CAPTURE_SCREENSHOTS=0 TD2_BOOT_PROBE_CAPTURE_PPU_MEMORY=0 TD2_BOOT_PROBE_CAPTURE_WRAM_MEMORY=0 TD2_BOOT_PROBE_TRACE_MODE7=0 TD2_BOOT_PROBE_TRACE_DMA=0 TD2_BOOT_PROBE_TRACE_VRAM=0 TD2_BOOT_PROBE_TRACE_L001210=0 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='front_8b31=00:8B31' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='dp_0053=00:0053' TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/deep_probe_smoke/td2_boot_probe ./validation/run_mesen_deep_probe.sh ./game.smc`
- route-bearing deep-probe validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_SAMPLE_EVERY=16 TD2_BOOT_PROBE_CAPTURE_FRAMES='300,654,986,1093,1500,1640,1780,2050,2088' TD2_BOOT_PROBE_COMPARE_FRAMES='300,654,986,1093,1500,1640,1780,2050,2088' TD2_BOOT_PROBE_CAPTURE_SCREENSHOTS=0 TD2_BOOT_PROBE_CAPTURE_PPU_MEMORY=0 TD2_BOOT_PROBE_CAPTURE_WRAM_MEMORY=0 TD2_BOOT_PROBE_TRACE_MODE7=0 TD2_BOOT_PROBE_TRACE_DMA=0 TD2_BOOT_PROBE_TRACE_VRAM=0 TD2_BOOT_PROBE_TRACE_L001210=0 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/deep_probe_mid/td2_boot_probe ./validation/run_mesen_deep_probe.sh ./game.smc`
- live-probe smoke:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_LIVE_PROBE_AUTO_STOP_FRAMES=32 TD2_LIVE_PROBE_AUTOSAVE_EVERY=16 TD2_LIVE_PROBE_OUTPUT_PREFIX=tools/out/live_play_probe_smoke/session ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_live_play_probe.lua`

Artifacts
- smoke output:
  - `tools/out/deep_probe_smoke/td2_boot_probe.json`
  - `tools/out/deep_probe_smoke/td2_boot_probe_summary.md`
- route-bearing deep-probe output:
  - `tools/out/deep_probe_mid/td2_boot_probe.json`
  - `tools/out/deep_probe_mid/td2_boot_probe_summary.md`
- live-probe smoke output:
  - `tools/out/live_play_probe_smoke/session.json`
  - `tools/out/live_play_probe_smoke/session_summary.md`

Findings / Interpretation
- The new probe path is now structurally ready for the still-open pipeline
  work because it captures the three layers that were previously split across
  ad hoc runs:
  - callback family handoffs
  - queue / WRAM control-state deltas
  - exact anchor-frame `VRAM/CGRAM/OAM` and selected WRAM region comparisons
- The new default wrapper is intentionally biased toward the obscure open
  surfaces rather than the already-solved intro-only lane:
  - front-end helper/callback corridor around `1500/1640/1780`
  - gameplay-entry handoff around `2050/2088`
  - late gameplay anchor set `3250/3400/3550`
  - emitter cluster `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B101 / 02:B134`
- The short smoke also confirms the new outputs are internally coherent:
  - sampled entries, transition events, capture artifacts, and compare pairs
    all materialize in one JSON
  - the markdown summary is useful as a first-pass scan before opening the
    heavier JSON or memory dumps
- The route-bearing validation already proves the deep probe is not just a
  boot-only tool:
  - it reaches the expected callback anchors
    `00:8029 -> 01:A39C -> 01:9FE5 -> 01:C1D2 -> 01:BE43 -> 02:9016`
  - it records the gameplay entry handoff into
    `02:9016 / 01:96A0 / 02:8F3C`
  - it keeps the queue/state oscillation visible inside the post-`2050`
    corridor instead of collapsing that window to one end-frame state
- The live-probe smoke closes the manual-tooling part defensibly:
  - it records sampled frames and transition events in resident mode
  - it writes the rolling session files without `testRunner`-specific
    assumptions
  - command-triggered captures remain untested in headless mode, but the
    command surface is now documented and the auto-stop path is validated

What I learned (actionable)
- The repo now has one reusable Mesen-side collector for “what actually
  changed in the hidden pipeline?” instead of stitching together:
  - one boot probe
  - one dump-range run
  - one gameplay-only trace
- For the active obscure lanes, the best next use is no longer another narrow
  ad hoc probe:
  run the deep wrapper once, then branch analysis from:
  - `transition_events`
  - `capture_compare_pairs`
  - the per-anchor queue summaries and memory-region diffs
- The new `trace_windows` surface should be preferred over one giant
  contiguous trace window whenever the target spans intro/menu/gameplay in the
  same pass.

Next steps / Checkpoints
1) Run `validation/run_mesen_deep_probe.sh` with the full default profile and
   inspect the first real output around `1500/1640/1780` and
   `3250/3400/3550`.
2) Use the emitted compare pairs to decide whether the next archaeology turn
   should prioritize:
   - front-end top-row `BG2` producer provenance
   - gameplay emitter semantics inside the `02:B042..02:B134` cluster
3) If the full run is too noisy on one lane, keep the wrapper and narrow only
   `TD2_BOOT_PROBE_TRACE_WINDOWS`, not the whole instrumentation surface.

Files updated in this turn
- `validation/mesen_probe_boot.lua`
- `validation/run_mesen_deep_probe.sh`
- `validation/mesen_live_play_probe.lua`
- `validation/run_mesen_capture.sh`
- `validation/README.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `validation/README.md`
- `tools/out/deep_probe_smoke/td2_boot_probe_summary.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-02

Summary
- Added a reusable front-end car-helper ASCII auditor so the current car-panel
  load path can be checked without repeating ad hoc LoROM math.
- Closed the exact panel-helper source set behind `L00BC0F`:
  `$0202 + 0x0009` maps to helper indices `9/10/11`, which load:
  - `L00A9A0`: `00:B0AB`, `00:B6B2`, `00:BCBA`
  - `L00A9CB`: `0E:8000`, `0E:91FE`, `0E:A428`
- Kept the main negative result instead of overfitting the new `.sol` string
  suspicion:
  those helper sources do not carry `CARBMP`, `CARBMP.sol`, `Porsche`,
  `Lamborghini`, `Diablo`, `Ferrari`, `F40`, `959`, or `P959_8K` as direct or
  fixed-stride ASCII in either the source bytes or the decoded payloads.
- Added a stronger read on the familiar `.sol` names:
  `GAMEOVER.sol`, `WHOA.sol`, `YEAH.sol`, and `P959_8K.sol` all sit inside the
  same nearby `YUKO` container family, which raises the prior that
  `P959_8K.sol` is another AV/effect asset label rather than the front-end
  car-name surface.

What I ran
- helper audit tool validation:
  - `python3 -m py_compile tools/audit_frontend_car_helper_ascii.py`
- helper audit artifact:
  - `python3 tools/audit_frontend_car_helper_ascii.py game.smc --json-out tools/out/frontend_car_helper_ascii_audit_20260402.json --markdown-out tools/out/frontend_car_helper_ascii_audit_20260402.md`
- ROM-wide `.sol` and car-name string pass:
  - `strings -a -t x game.smc | rg "CARBMP|\\.sol$|Porsche|Lamborghini|Ferrari|959|Diablo|F40|CAR"`
- direct LoROM-mapped YUKO block comparison over the familiar `.sol` names:
  - ad hoc Python inspection around `00:DEE3`, `0A:C65A`, `0B:B557`, and
    `0A:EDEA`

Findings / Interpretation
- The current panel-helper load path is now explicit in one reusable artifact:
  - helper `9` (`$0202 = 0`):
    - `L00A9A0 00:B0AB` -> file `0x0030AB`
    - `L00A9CB 0E:8000` -> file `0x070000`
  - helper `10` (`$0202 = 1`):
    - `L00A9A0 00:B6B2` -> file `0x0036B2`
    - `L00A9CB 0E:91FE` -> file `0x0711FE`
  - helper `11` (`$0202 = 2`):
    - `L00A9A0 00:BCBA` -> file `0x003CBA`
    - `L00A9CB 0E:A428` -> file `0x072428`
- All three `L00A9A0` sources are `42FB`; all three `L00A9CB` sources are
  `26FB`.
- The new audit closes the main question defensibly:
  - no `CARBMP`/car-name needle hits land in the compressed source bytes
  - no such hits land in the decoded `L0005AC` tilemap blobs either
  - no such hits land in the decoded `L0006C9` CHR blobs either
  - there are also no positive fixed-stride (`1/2/3`) hits for those needles
- That means the still-missing name-bearing surface is not usefully explained
  by “the helper bundle already embeds ASCII car names”.
- The `.sol` comparison is now more concrete:
  - `GAMEOVER.sol` at `00:DEE3`, `WHOA.sol` at `0A:C65A`,
    `YEAH.sol` at `0B:B557`, and `P959_8K.sol` at `0A:EDEA` are each preceded
    by the same nearby `YUKO` signature block
  - the three familiar examples match known spoken/FX cues from gameplay
  - practical read: `P959_8K.sol` currently fits the same container family
    better than it fits the front-end title/info-box path
- Practical consequence for the active front-end lane:
  - the strongest remaining explanation is still the old exact-frame one:
    shared panel/glyph CHR plus a small top-row `BG2` tilemap delta
  - the next useful target is therefore tilemap/tile provenance on that top
    row, not deeper blind `.sol` scanning inside helpers `9/10/11`

What I learned (actionable)
- The `L00BC0F` panel reload path is no longer “helper bundle 10 in general”;
  it is the exact `9/10/11` source sextet above, with validated LoROM file
  offsets and compression modes.
- The new `.sol` suspicion did produce a real architecture-facing gain even
  though it did not reveal the car-name text:
  it cleanly separates the front-end helper path from the nearby `YUKO` asset
  family.
- For this front-end lane, blind ASCII scans inside the helper payloads should
  now be demoted behind the stronger exact-frame tilemap-delta path.

Next steps / Checkpoints
1) Trace the top-row `BG2` tilemap delta across the `1500/1640/1780` front-end
   anchors back to the producing row/tile selector.
2) Keep the current helper sextet as the closed negative result when the
   “embedded ASCII car-name” hypothesis comes up again.
3) If the `.sol`/`YUKO` family becomes active as its own lane later, treat it
   as a separate AV/effect-asset cataloguing problem rather than as car-panel
   text provenance.

Files updated in this turn
- `tools/audit_frontend_car_helper_ascii.py`
- `tools/out/frontend_car_helper_ascii_audit_20260402.json`
- `tools/out/frontend_car_helper_ascii_audit_20260402.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/out/frontend_car_helper_ascii_audit_20260402.md`
- `docs/snes_unknowns.md`
- `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json`

Date: 2026-04-02

Summary
- Switched the text-validation detour away from phrase needles and onto a
  raw `0x41` anchor pass:
  extracting printable runs that contain byte `0x41` now closes real
  start/end text corridors in `bank 01`, not just isolated string hits.
- Added a quick bank-wide ASCII detour with a reusable scanner:
  contiguous `stride=1` hits now show real runtime/user-facing phrases in
  `bank 01`, and a targeted interleaved pass closes one real hidden-string
  proof at `0D:C364` -> `Press any button.` under `stride=2`.
- Documented a new low-risk text-storage fact for the front-end lane:
  the known string block at `01:880D` is stored in the ROM as literal
  NUL-terminated ASCII, not a custom packed charset.
- Added a stronger cross-surface reading from team debug:
  Mesen-side inspection also reports ASCII codepoints on dynamic
  `High Score` text, on the gameplay service-corridor attendant dialog, and
  on the long splash/copyright sentence.
- Added a stronger architectural read from the same team debug:
  the repeated `1 byte = 1 character` behavior now looks more like a shared
  game-wide text routine than an isolated menu-only storage quirk.
- Added a small gameplay-state watchlist note from team debug:
  `$00129E` now reads as the "times the car crashed" counter, and `$0018EE`
  reads as the current `cars left` reserve.

What I ran
- anchor-byte bank-`01` artifact:
  - `python3 tools/find_ascii_candidates.py game.smc --banks 0x01 --strides 1 --min-length 6 --per-bank-limit 20 --anchor-byte 0x41 --markdown-out tools/out/ascii_anchor41_bank01_20260402.md --json-out tools/out/ascii_anchor41_bank01_20260402.json`
- anchor-byte global summary:
  - `python3 tools/find_ascii_candidates.py game.smc --banks 0-31 --strides 1,2,3 --min-length 6 --per-bank-limit 8 --anchor-byte 0x41 --json-out tools/out/ascii_anchor41_global_20260402.json --markdown-out tools/out/ascii_anchor41_global_20260402.md`
- direct hex expansion around the two strongest bank-`01` anchor clusters:
  - `xxd -g1 -s 0x8800 -l 176 game.smc`
  - `xxd -g1 -s 0xab30 -l 352 game.smc`
- scanner validation:
  - `python3 -m py_compile tools/find_ascii_candidates.py`
- contiguous bank-wide scan:
  - `python3 tools/find_ascii_candidates.py game.smc --banks 0-31 --strides 1 --min-length 6 --per-bank-limit 8 --json-out tools/out/ascii_candidate_scan_stride1_20260402.json --markdown-out tools/out/ascii_candidate_scan_stride1_20260402.md`
- bank-wide needle scan over contiguous plus interleaved lanes:
  - `python3 tools/find_ascii_candidates.py game.smc --banks 0-31 --strides 1,2,3 --min-length 6 --per-bank-limit 3 --needles 'HIGH SCORE,GAME OPTIONS,PLAY TDII,AUTOSHIFT,BRAKE,THROTTLE,STEERING,LIVES,LICENSE,SCORE,SPEED,GAS,DRIVING,JAIL,POLICE' --json-out tools/out/ascii_candidate_scan_needles_20260402.json`
- targeted interleaved follow-up on the one positive bank:
  - `python3 tools/find_ascii_candidates.py game.smc --banks 0x0D --strides 2 --min-length 6 --per-bank-limit 20`
- direct ROM byte check over the verified customize-menu anchor:
  - `xxd -g1 -s 0x880d -l 96 game.smc`

Findings / Interpretation
- The `0x41`-anchored pass is already more useful than phrase needles for
  “where does the text block really begin/end?”:
  - front-end/config corridor:
    - anchor hits land on `01:880D..01:8845`
    - direct hex shows this is one contiguous NUL-terminated ASCII block
      running at least `01:880D..01:88A0`
    - current visible members include:
      `CUSTOMIZE CAR`, `Autoshift`, `Car Height`, `Accel Coeff`,
      `Brake Coeff`, `Max G Force`, `Scrub Rate`, `0-60`, `0-100`,
      `1/4 Mile`, `1/4 Speed`, `Top Speed`, `Top Time`, `Lives`
  - judgement/advice corridor:
    - anchor hits land on `01:AB3F..01:AC53`
    - direct hex expansion shows one larger contiguous ASCII corridor already
      visible from at least `01:AB30` through `01:AC8F+`
    - that corridor carries chained NUL-terminated advice/judgement lines such
      as `ACME driving school?`, `The gas pedal is on the`, `Go faster.  This
      is only a`, `Sports cars can go much`, `Don\`t give up your day job,`,
      `Autobahns were made for`, and `find the brak...`
- The same anchor pass is also clarifying what is *not* text:
  - `bank 04` still returns mostly synthetic/repetitive `A`-heavy blobs
    (`I999999AAAAAAAAAAAAA`, `ADDDDJ`) rather than clean English corridors
  - practical read: `bank 04` remains open, but the current `0x41` anchor
    evidence is much stronger in `bank 01` than there
- The quick detour already closes two useful text-storage behaviors:
  - `bank 01` contains real contiguous ASCII phrases, not just one static menu
    block; current scanner hits include:
    - `01:AD07` -> `Great driving!  You deserve`
    - `01:AEBD` -> `License revoked and a 30`
    - `01:ADEC` -> `You ran out of gas.`
    - `01:AEB6` -> `You got the best score!`
  - `bank 0D` contains at least one real interleaved hidden string:
    - raw `stride=1` view at `0D:C364` looks noisy
    - `stride=2 phase=0` cleanly resolves the same bytes as
      `Press any button.`
    - direct hex now closes the concrete layout there as alternating
      `ASCII,0x28` bytes:
      `50 28 72 28 65 28 73 28 ...`
- Negative-but-useful result from the same pass:
  - the current blind ASCII scan did not produce comparably clean hits in
    `bank 04`, despite the standing text/string suspicion there
  - practical read: some text is plainly stored in ASCII across banks, but
    `bank 04` likely still needs stronger format-aware extraction than this
    first blind pass
- The raw bytes at `01:880D` decode directly as:
  - `CUSTOMIZE CAR`
  - `Autoshift`
  - `Car Height`
  - `Drag Coeff`
  - `Accel Coeff`
  - `Brake Coeff`
  - `Max G Force`
  - `Scrub Rate`
- Team-reported Mesen debug also sees plain ASCII semantics on two dynamic
  text families plus the opening splash sentence:
  - the `High Score` surface reached through `L00A3CC`
  - the service-corridor attendant dialog noted in the live-race post-stop
    screen pack
  - the long splash/copyright sentence (`original ... designed and developed
    by distinctive software`) also follows the same ASCII codepoint semantics
- Team-reported Mesen debug also now reinforces a structural rule:
  the text path appears to be `1 byte per character` broadly, not just on one
  isolated block.
- Team-reported Mesen debug also surfaced two concrete gameplay-facing WRAM
  cells that are likely worth promoting into later contracts:
  - `$00129E`: crash-count / collision-tally state
  - `$0018EE`: `cars left` reserve
- Practical read on those two fields:
  - they do not directly advance the active `bank30` provenance gate
  - they are still high-value watchpoints for later gameplay archaeology
    because they should cut across:
    - HUD/reserve-life presentation
    - post-crash/service or checkpoint recovery paths
    - partial-results / failure-state transitions
  - current repo-side status is still "team-reported Mesen fact":
    there is no matching named consumer or direct asm reference for either
    address in the checked-in docs/disassembly yet
- Practical read:
  - at least this front-end string family is source-stored as plain ASCII plus
    `0x00` terminators
  - the prior is now stronger than “one static menu block happens to be ASCII”:
    the same codepoint semantics now appear across:
    - static splash/copyright text
    - front-end/menu text
    - dynamic runtime text paths
  - that pushes the best current hypothesis from “several ASCII pockets” toward
    “one shared game text representation with a common renderer/stager”
  - important precision: this should not be described as a “native SNES font”.
    The SNES does not provide a built-in text font/printing system; the likely
    shared routine is still game code that maps bytes to glyph tiles / OAM / BG
    output
  - the remaining reverse-engineering problem for this surface is now more
    clearly glyph staging/render ownership, not byte-to-character decoding
  - this does not yet prove that every text surface in the ROM uses ASCII, and
    it does not close the old unsupported claim that bank `04` is already a
    proven global font/string bank
  - the dynamic-surface extension is currently a team-reported debug fact, not
    yet a repo-side trace artifact

What I learned (actionable)
- For current validation, phrase search should be demoted behind the stronger
  method:
  - anchor on byte `0x41`
  - expand to the full printable run in that lane
  - then confirm the real corridor bounds in raw hex
- The current best text corridors to trace forward/backward are now explicit:
  - `01:880D..01:88A0` front-end/config block
  - `01:AB30..01:AC8F+` judgement/advice block
- The quick scanner is now a reusable cheap falsifier for both:
  - direct ASCII text banks (`stride=1`)
  - hidden fixed-stride text pockets (`stride=2/3`)
- The current strongest quick-scan text owners are no longer hypothetical:
  - `bank 01` for menu/results/dialog/judgement phrases
  - `bank 0D` for at least one hidden interleaved prompt string
- `bank 04` stays open after this detour; that is now a stronger signal that
  its suspected text surfaces may be descriptor- or table-mediated rather than
  trivially raw-ASCII contiguous/interleaved blobs
- Raw ASCII scans are now a cheap falsifier for adjacent front-end text
  families and for the still-open text-extraction lane.
- Current documentation should treat this as an encoding/storage proof for a
  verified bank-`01` block, not as a global text-system proof.
- The next useful instrumentation target is now clearer:
  hunt the WRAM/runtime buffer that feeds `High Score` and attendant-dialog
  text before chasing any custom character-decoder theory.
- The strongest architecture-facing question is now:
  where is the shared byte-to-glyph routine, and which text surfaces bypass it
  versus reuse it directly?
- The new gameplay-state addendum should be kept as a narrow future watchlist,
  not inflated into a proof:
  - `$00129E` and `$0018EE` are already good fields to add to later bounded
    gameplay probes
  - the next useful promotion is to catch one concrete consumer/producer edge
    for each field before naming a full subsystem owner

Next steps / Checkpoints
1) Reuse the ASCII-plus-NUL assumption as the first pass when probing other
   menu/control-label families.
2) Keep separating source-string ownership from glyph/OBJ composition
   ownership in the docs and extractor tooling.
3) When the text/content lane is active, trace the dynamic `L00A3CC`
   high-score path and the service-corridor attendant dialog for live ASCII
   buffer writes and their downstream glyph-staging consumer.
4) Revisit `bank 04` with format-aware extraction rather than another blind
   raw-byte scan if the text lane becomes active.
5) Use the explicit bank-`01` corridors `01:880D..01:88A0` and
   `01:AB30..01:AC8F+` as the next backward/forward ownership targets for the
   shared byte-to-glyph routine.
6) When the gameplay-state lane is active again, add `$00129E` and `$0018EE`
   to the bounded watchlist for crash/recovery/results captures.

Immediate recommendation
- When the content-extraction lane is active again, start with raw ASCII scans
  around already verified front-end callsites before inventing a custom text
  table.

Files updated in this turn
- `tools/find_ascii_candidates.py`
- `tools/out/ascii_anchor41_bank01_20260402.json`
- `tools/out/ascii_anchor41_bank01_20260402.md`
- `tools/out/ascii_anchor41_global_20260402.json`
- `tools/out/ascii_anchor41_global_20260402.md`
- `tools/out/ascii_candidate_scan_stride1_20260402.json`
- `tools/out/ascii_candidate_scan_stride1_20260402.md`
- `tools/out/ascii_candidate_scan_needles_20260402.json`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/out/ascii_candidate_scan_stride1_20260402.md`
- `tools/out/ascii_candidate_scan_needles_20260402.json`
- `docs/snes_dos_correlation.md`
- `rom_analysis/docs/external_decompiler_markdown_audit.md`

Date: 2026-04-02

Summary
- Reclassified the late-entry `3250` visible descriptor from a generic raw
  VRAM copy into the bank-0 table-driven queue-builder family rooted at
  `L001895 / L001A70`.
- Closed the object-side provenance one step further:
  the active descriptor `01 b8 b4 15 20 00 80 61` matches a one-tile bank-15
  object at `15:B4A8` whose payload begins at `15:B4B8`.
- Kept a bounded negative trace result instead of overfitting:
  two targeted Mesen trace variants did not hit the guessed producer sites,
  but both still pinned the frame-start callback pair to `02:9016` main and
  `01:96A0` IRQ.

What I ran
- ROM-side descriptor/object decode over `game.smc`:
  - ad hoc Python inspection around `15:B4A8..15:B4C6`
  - literal-word search for `B4A8/B4B8/34A8/34B8` inside bank `15`
- targeted Mesen trace variant 1:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=480 TD2_SCANLINE_TEST_TARGET_FRAME=3250 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_SCANLINE_TEST_TRACE_EXEC_POINTS='builder=00:1895,emit=00:1A70,wrap=00:98FF,bank1_983d=01:983D,bank1_988b=01:988B,bank1_9185=01:9185,bank2_1165=02:1165' TD2_SCANLINE_TEST_EXEC_POINT_MAX_HITS=256 TD2_SCANLINE_TEST_TRACE_WRITE_POINTS='q0600=7E:0600,q0601=7E:0601,q0602=7E:0602,q0603=7E:0603,q0604=7E:0604,q0605=7E:0605,q0606=7E:0606,q0607=7E:0607' TD2_SCANLINE_TEST_WRITE_POINT_MAX_HITS=256 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250_producer_trace/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`
- targeted Mesen trace variant 2:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=480 TD2_SCANLINE_TEST_TARGET_FRAME=3250 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_SCANLINE_TEST_TRACE_EXEC_POINTS='builder=80:1895,emit=80:1A70,wrap=80:98FF,bank1_983d=81:983D,bank1_988b=81:988B,bank1_9185=81:9185,bank2_1165=82:1165' TD2_SCANLINE_TEST_EXEC_POINT_MAX_HITS=256 TD2_SCANLINE_TEST_TRACE_WRITE_POINTS='q0600=7E:0600,q0601=7E:0601,q0602=7E:0602,q0603=7E:0603,q0604=7E:0604,q0605=7E:0605,q0606=7E:0606,q0607=7E:0607' TD2_SCANLINE_TEST_WRITE_POINT_MAX_HITS=256 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250_producer_trace_mirror/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`

Findings / Interpretation
- The observed `3250` descriptor now matches the table-driven builder family,
  not the earlier simple-copy guess:
  - `$04/$05 = 0xB801`
  - `$06/$07 = 0x15B4`
  - `$08/$09 = 0x0020`
  - `$0606 = ($0A << 4) + $099A = 0x6180`
- The only bank-15 object layout that fits `source = 15:B4B8` and
  `transfer_size = 0x20` under that family is:
  - table start `15:B4A8`
  - word `0 = 0x0001` (`1` chunk)
  - word `1 = 0x0001` (`1` tile)
  - payload start `15:B4B8`
- Direct literal search did not find raw `B4A8/B4B8` words in bank `1`, bank
  `2`, or elsewhere in bank `15`, so the current read is “table-resolved
  gameplay object family”, not “simple hardcoded pointer pair”.
- The two targeted trace variants are still informative negative results:
  - both kept `0` exec hits on the guessed builder sites
  - both kept `0` write hits on traced `7E:0600..0607`
  - both still preserved the same frame-start callback anchor:
    `active_main = 02:9016`, `active_irq = 01:96A0`
  - frame-start queue cursors remain `0x70/0x70`, while the visible
    descriptor still becomes active by scanline `46`

What I learned (actionable)
- The remaining question is no longer “is `3250` some arbitrary queued copy?”
- The stronger question is:
  which table-resolved gameplay object selector inside the active
  `02:9016 / 01:96A0` family chooses the one-tile bank-15 payload
  `15:B4A8 -> 15:B4B8` and sends it to `VRAM 0x6180`?

Next steps / Checkpoints
1) Treat `15:B4A8` as the current best object-side provenance for the
   transient `3250` BG1 upload.
2) Resolve the unlabeled `02:9016..02:90B2` region against nearby bank-2
   labels/callers before another broad trace retry.
3) Use `01:96A0` as the paired IRQ-side anchor for the same frame.
4) Only after that, run another targeted probe that records actual live
   `K:PC` through scanlines `0..46` instead of only guessed builder sites.

Immediate recommendation
- Read these together before the next `3250` producer pass:
  - `rom_analysis/maps/tracks/track1_live_entry_bg1_queue_object_3250.md`
  - `tools/out/lane3_live_entry_frame03250_producer_trace/td2_scanline_step_test.json`
  - `tools/out/lane3_live_entry_frame03250_producer_trace_mirror/td2_scanline_step_test.json`

Files updated in this turn
- `rom_analysis/maps/tracks/track1_live_entry_bg1_queue_object_3250.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `docs/engine_datagram.md`
- `docs/engine_pseudocode.md`
- `NEXT_AGENT.md`

Next reading
- `rom_analysis/maps/tracks/track1_live_entry_bg1_queue_object_3250.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `docs/engine_datagram.md`

Date: 2026-04-02

Summary
- Narrowed the remaining late-entry `3250` counterexample past the old
  “maybe another window/layer field” read and into a visible queue/DMA
  boundary.
- Refreshed `tools/summarize_scanline_dma_queue.py` so it now works on the
  current root-level scanline-capture schema and emits reusable Markdown
  beside JSON summaries.
- Closed a new late-gameplay boundary note:
  `3250` is the only promoted late-entry frame that keeps an active visible
  queue descriptor, while the positive scanline consumers `3400` and `3550`
  keep that surface empty across all `224` sampled scanlines.

What I ran
- tool validation:
  - `python3 -m py_compile tools/summarize_scanline_dma_queue.py`
- reusable late-entry queue summary:
  - `python3 tools/summarize_scanline_dma_queue.py tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json --output tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json --markdown-out tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- direct three-way trace compare over the same captures:
  - current negative fields checked:
    - `sub_layers`
    - `window0_left/right`
    - `window1_left/right`
    - `window_mask_main_bg1/bg2/bg3/obj`
  - current positive outlier fields checked:
    - `queue_dma_active_descriptor_count`
    - `queue_dma_active_entries`
    - `dp_0053/0054/0055/0056`
    - `wram_0053/0054/0055/0056`

Findings / Interpretation
- `3250` is the only promoted late-entry trace with visible queue work:
  - `1` active descriptor across scanlines `46..223` (`178` sampled lines)
  - stable descriptor payload:
    - slot `14`
    - offset `112`
    - words `[0xB801, 0x15B4, 0x0020, 0x6180]`
    - source `0x15B4B8`
    - transfer size `0x20`
    - VRAM destination `0x6180`
- `3400` and `3550` both keep
  `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines.
- The old “maybe this is a window/sub-screen surface” branch is now a bounded
  negative result for this late-entry trio:
  - `sub_layers = 0` on all three traces
  - all sampled window coordinates stay `0`
  - all sampled `window_mask_main_*` fields stay `false`
- The DP/WRAM queue family splits in the same direction:
  - `3250`: representative `dp_0053/0054 = 0x70/0x70`,
    `wram_0055/0056 = 0x18/0x12`, with `dp_0054` advancing to `0x78` once
    the visible descriptor becomes active
  - `3400`: representative `0xE0/0xE0`, `0x90/0x15`
  - `3550`: representative `0xF8/0xF8`, `0x90/0x15`
- The queue target is now tied to concrete visible ownership:
  - `VRAM 0x6180` resolves to `BG1` tile `396`
  - that tile is referenced at `BG1` cell `(4, 24)` on all three promoted
    bundles and lands near screen `(32, 193)` under the current `BG1` scroll
  - the end-frame raw `VRAM` bytes at `0x6180..0x61FF` are still identical on
    `3250/3400/3550`, so the `3250` queue-backed visible state is transient
    and not preserved in the seeded bundle dump

What I learned (actionable)
- The next useful question is no longer “which extra window or screen-mask
  field should `3250` load?”
- The stronger next question is:
  which producer path feeds the visible `BG1` tile `396` upload at
  `slot 14 -> VRAM 0x6180`, and does that require a queue-backed runtime
  surface distinct from the `3400/3550` scroll-only positive set?

Next steps / Checkpoints
1) Treat `3400/3550` as the scroll-only positive set for the current measured
   scanline family.
2) Treat `3250` as a queue-backed counterexample, not a window/sub-screen
   counterexample.
3) Chase the producer path behind the `3250` visible `BG1` tile `396` upload
   before promoting any new runtime rule.

Immediate recommendation
- Read these together before the next `3250` runtime experiment:
  - `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`
  - `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`

Files updated in this turn
- `tools/summarize_scanline_dma_queue.py`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `NEXT_AGENT.md`

Next reading
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.md`
- `tools/out/lane3_live_entry_scanline_queue_boundary_3250_3400_3550.json`
- `rom_analysis/maps/tracks/track1_live_entry_scanline_queue_boundary_3250_3400_3550.md`

Date: 2026-04-01

Summary
- Promoted the later collision-heavy `3550` bundle onto the same versioned
  gameplay scanline-contract surface that had just been proven on `3400`.
- Extended the port smoke again so `3550` is no longer treated as a
  composition-only consumer; it now proves loaded scanline values plus
  top-band sky pixels in `port/test_scanline_contract.c`.
- Closed a stronger family-wide read on late gameplay:
  the current measured `main_layers/bg1/bg2/bg3` scanline fields now have two
  positive promoted consumers (`3400`, `3550`) against one explicit
  counterexample (`3250`).

What I ran
- late-entry `3550` scanline capture on the promoted no-brake route:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=420 TD2_SCANLINE_TEST_TARGET_FRAME=3550 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`
- stable runtime PNG for the promoted `3550` scanline-backed consumer:
  - `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_frame03550_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550`
- bounded compare probes:
  - `python3 tools/compare_frames.py tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
  - `python3 tools/compare_frames.py tools/out/lane3_live_entry_frame03550_bundle/bg_stack_visible_support.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
- targeted port validation:
  - `make -C port`
  - `./port/test_scanline_contract.sh`

Findings / Interpretation
- The new `3550` trace is structurally valid on the same late-entry family:
  - `224` visible scanline samples
  - the same `23/24` top-band `BG3` handoff seen on `3250/3400`
  - the same `120/121` main-layer split
  - a different later-phase scroll envelope than `3400`
    (`BG3 HOFS = 192`, `BG2 HOFS 254/256` at `120/121`)
- This later collision-heavy phase also benefits materially from the current
  measured scanline field family:
  - the new scanline-backed runtime render changes `9367` pixels versus the
    earlier composition-only `3550` runtime PNG
  - against `bg_stack_visible_support.png`, mismatch drops
    `17848 -> 9741`
- Practical read:
  - `3400` was not an isolated win
  - the current late-entry scanline family now has two positive consumers
    (`3400`, `3550`)
  - `3250` is now the useful remaining counterexample, not the representative
    default for the whole family

What I learned (actionable)
- The next useful port-side question is no longer “does this scanline family
  help late gameplay at all?”
- The better next question is:
  what extra fields or state ownership make `3250` stay flat while `3400`
  and `3550` both improve?

Next steps / Checkpoints
1) Use `3400/3550` together as the positive proof set for late-entry
   scanline-backed rendering.
2) Treat `3250` as the explicit narrowing target for the next field/state
   promotion instead of extending static composition blindly.
3) Keep the new `3550` runtime PNG beside the earlier composition-only output
   in design review so the later-family gain stays visible.

Immediate recommendation
- Use these `3550` runtime PNGs side-by-side for the next late-gameplay
  review:
  - `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png`
  - `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`

Files updated in this turn
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `port/test_scanline_contract.c`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `NEXT_AGENT.md`

Next reading
- `tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json`
- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3550_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png`

Date: 2026-04-01

Summary
- Promoted the late-entry `3400` traffic-emergence bundle onto the versioned
  gameplay scanline-contract surface in
  `rom_analysis/docs/gameplay_scanline_contracts.jsonc`.
- Extended the port smoke so `3400` no longer validates as a
  composition-only consumer; it now proves loaded scanline values plus
  top-band sky pixels in `port/test_scanline_contract.c`.
- Closed the immediate “static composition or stronger scanline/state?”
  decision for late gameplay with one bounded probe:
  the measured `3400` scanline fields materially improve the promoted SDL
  output over the earlier composition-only checkpoint.

What I ran
- late-entry `3400` scanline capture on the bounded braking route:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=420 TD2_SCANLINE_TEST_TARGET_FRAME=3400 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-2949:a;2950-3400:b;3401-5649:a' TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`
- targeted port validation:
  - `make -C port`
  - `./port/test_scanline_contract.sh`
- stable runtime PNG for the promoted `3400` scanline-backed consumer:
  - `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400`
- bounded compare probes:
  - `python3 tools/compare_frames.py tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
  - `python3 tools/compare_frames.py tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`

Findings / Interpretation
- The new `3400` trace is structurally valid on the late-entry family:
  - `224` visible scanline samples
  - the same `23/24` top-band `BG3` handoff seen on `3250`
  - the same `120/121` main-layer split, but with later-phase
    `BG2` scroll values (`235/239` at `120/121`, `283` by `223`)
- Unlike `3250`, this late-entry phase is not a no-op consumer of the current
  measured scanline fields:
  - the new scanline-backed runtime render changes `9309` pixels versus the
    earlier composition-only `3400` runtime PNG
  - against `bg_stack_visible_support.png`, mismatch drops
    `15497 -> 7649`
- Practical read:
  - the late-entry family should no longer be treated as a uniform
    composition-only lane
  - `3400` is now the first promoted proof that the current measured
    `main_layers/bg1/bg2/bg3` field set can materially improve later gameplay
    when paired with the existing top-band `BG3` composition rule
  - `3250` remains the useful counterexample where those same fields are
    still a no-op

What I learned (actionable)
- The active gate is now resolved in favor of stronger measured
  scanline/state promotion, not “extend the static composition contract first”
  as the default next move.
- The cheapest next proving target is another late-entry consumer on the same
  family, likely `3550`, unless a tighter `3250` field expansion becomes more
  defensible than another later-anchor promotion.

Next steps / Checkpoints
1) Use `3400` as the new late-entry proof point when deciding whether another
   promoted bundle belongs on scanline+composition or composition-only.
2) Prefer `3550` as the next bounded follow-up unless a concrete field family
   for the still-no-op `3250` case is already in hand.
3) Keep the new `3400` scanline runtime PNG in design review next to the old
   composition-only checkpoint so the improvement stays visible.

Immediate recommendation
- Use these two `3400` runtime PNGs side-by-side for the next late-gameplay
  review:
  - `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`
  - `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`

Files updated in this turn
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `port/test_scanline_contract.c`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `NEXT_AGENT.md`

Next reading
- `tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json`
- `tools/out/port_gameplay_scanline_runtime_pngs_20260401/live_entry_3400_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`

Date: 2026-04-01

Summary
- Promoted the late-gameplay `BG3` top-band hypothesis from a sweep artifact
  into a versioned runtime contract in
  `rom_analysis/docs/gameplay_composition_contracts.jsonc`.
- Extended the native PPU path so later gameplay bundles can enable `BG3` on
  the main screen only in a measured upper band and keep `BG3 > BG2` there.
- Closed the immediate design-review loop with a fresh runtime PNG pack in
  `tools/out/port_gameplay_composition_runtime_pngs_20260401/` for the
  promoted late-entry anchors `3250`, `3400`, and `3550`.
- Added a root-level handoff note in `NEXT_AGENT.md` so the next agent can
  resume lane 3 without reconstructing this checkpoint from scattered notes.

What I ran
- full runtime validation:
  - `make -C port test`
- local design-review PNG pack:
  - `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_frame03250_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3250`
  - `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400`
  - `./port/build/td2_port --scene-dir tools/out/lane3_live_entry_frame03550_bundle/design_pack --headless --frames 1 --dump-prefix tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550`
- wiki refresh:
  - `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Findings / Interpretation
- The promoted late-gameplay rule is now explicit and versioned instead of
  living only in `tools/out/gameplay_bg3_cutoff_sweep_20260401/`:
  - `3250`: enable `BG3` on the top `79` scanlines and keep `BG3 > BG2`
    there
  - `3400`: same `79`-line window
  - `3550`: same rule with a deeper `95`-line window
- This closed the renderer boundary one step further:
  the SDL runtime no longer needs a separate ad hoc late-gameplay lookup to
  restore the horizon strip on those anchors.
- Validation stayed cheap and sufficient:
  - `make -C port test` passed in full
  - `./port/test_scanline_contract.sh` now closes `39` checks across the
    solved live-race consumer plus the three late-entry composition consumers

What I learned (actionable)
- The late-gameplay family now has a defensible contract boundary for one
  concrete presentation rule: top-band `BG3` enable + precedence.
- The next useful narrowing is no longer “is there a good cutoff?”; it is
  whether the same family now needs more state than this static band rule, or
  whether extending the same composition profile to another later anchor still
  pays off.

Next steps / Checkpoints
1) Decide whether the late-entry family should keep growing through the same
   composition contract surface or switch back to stronger measured scanline
   fields on the same bundles.
2) Keep the new runtime PNG pack in design review so the team is reacting to
   the promoted SDL output, not only to sweep candidates.
3) Use the now-versioned `BG3` top-band rule as the cheap falsifier before any
   broader gameplay-layer rewrite.

Immediate recommendation
- Use these fresh runtime PNGs for the next design review:
  - `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3250_00000.png`
  - `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`
  - `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3550_00000.png`

Files updated in this turn
- `port/include/td2_ppu.h`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/test_scanline_contract.c`
- `rom_analysis/docs/gameplay_composition_contracts.jsonc`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `rom_analysis/docs/wiki_doc_index.json`
- `validation/README.md`
- `NEXT_AGENT.md`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/`

Next reading
- `rom_analysis/docs/gameplay_composition_contracts.jsonc`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3250_00000.png`
- `tools/out/port_gameplay_composition_runtime_pngs_20260401/live_entry_3400_00000.png`

Date: 2026-04-01

Summary
- Added a dedicated late-gameplay cutoff sweep tool in
  `tools/analyze_gameplay_bg3_cutoff.py` to test one narrow composition rule:
  `BG3` above `BG2` in a top band, `BG3` under `BG2` below it.
- Promoted a tracked artifact pack in
  `tools/out/gameplay_bg3_cutoff_sweep_20260401/` with candidate PNGs and
  compare strips for the late-entry anchors `3250`, `3400`, and `3550`.
- Closed a stronger late-gameplay renderer reading:
  the best measured fix is no longer “somehow use BG3 more”; it is a
  top-band precedence shift with stable cutoffs near `79` lines on `3250`
  and `3400`, and a deeper `95`-line window on `3550`.

What I ran
- tooling validation:
  - `python3 -m py_compile tools/analyze_gameplay_bg3_cutoff.py`
- promoted cutoff sweep:
  - `python3 tools/analyze_gameplay_bg3_cutoff.py tools/out/lane3_live_entry_frame03250_bundle tools/out/lane3_live_entry_brake_traffic_frame03400_bundle tools/out/lane3_live_entry_frame03550_bundle --output-dir tools/out/gameplay_bg3_cutoff_sweep_20260401`

Findings / Interpretation
- The sweep compares three surfaces against `bg_stack_visible_support.png`:
  - tracked `main.png`
  - flat `BG3 under BG2`
  - flat `BG3 over BG2`
  - a mixed stack with a swept top-band cutoff
- Best cutoffs landed at:
  - `3250`: `79`
  - `3400`: `79`
  - `3550`: `95`
- The mixed candidate beats the tracked `main.png` on all three anchors:
  - `3250`: `sad_rgb 4813358 -> 4285002`
  - `3400`: `sad_rgb 4425905 -> 3791435`
  - `3550`: `sad_rgb 4751245 -> 3983097`
- That is strong enough to rule out “missing BG3 asset” and materially narrow
  the remaining gap to a top-band composition rule.

What I learned (actionable)
- Late gameplay now has a cheap falsifier for one concrete renderer idea:
  top-band `BG3 > BG2` precedence.
- The consistency between `3250` and `3400` is especially useful because it
  suggests one stable background rule can survive an `OBJ`-heavy gameplay
  event without a full background-family rewrite.

Next steps / Checkpoints
1) Decide whether the `79/95` top-band cutoffs should be promoted first as a
   measured late-gameplay contract or translated directly into a renderer-side
   rule.
2) Keep the cutoff compare strips in design review so future tweaks are judged
   against the same tracked reference.
3) Only after this top-band precedence hypothesis is proven or falsified,
   reopen broader late-gameplay scanline-field collection.

Immediate recommendation
- Use these tracked design PNGs for the next renderer review:
  - `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_frame03250_bundle_bg3_cutoff_candidate.png`
  - `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_brake_traffic_frame03400_bundle_bg3_cutoff_candidate.png`
  - `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_frame03550_bundle_bg3_cutoff_candidate.png`

Files updated in this turn
- `tools/analyze_gameplay_bg3_cutoff.py`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/summary.md`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_frame03250_bundle_bg3_cutoff_compare.png`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_brake_traffic_frame03400_bundle_bg3_cutoff_compare.png`

Date: 2026-04-01

Summary
- Promoted raw `BG3` bundle previews for late gameplay archaeology by
  extending `tools/build_gameplay_frame_bundle.py` to emit `bg3.ppm` and
  `bg3.png` next to the existing `bg1/bg2/obj/main` outputs.
- Refreshed the tracked late-entry bundles for frames `3250`, `3400`, and
  `3550` so design review now has direct `BG3` PNGs instead of only
  screenshot-derived support masks for the sky/horizon side.
- Closed a useful ambiguity on the late gameplay stack:
  `BG3` is populated and visually meaningful on these bundles, so the next
  renderer question is composition/gating, not whether the raw helper layer is
  missing.

What I ran
- refreshed late gameplay bundles with the updated builder:
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_frame03250_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_brake_traffic_frame03400 --frame 3400 --vram tools/out/lane3_live_entry_brake_frame03400_frame_03400_vram.bin --cgram tools/out/lane3_live_entry_brake_frame03400_frame_03400_cgram.bin --ppu-state tools/out/lane3_live_entry_brake_frame03400_frame_03400_ppu_state.json --oam tools/out/lane3_live_entry_brake_frame03400_frame_03400_oam.bin --screenshot tools/out/lane3_live_entry_brake_frame03400_frame_03400_frame.png --out-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_frame03550 --frame 3550 --vram tools/out/lane3_live_entry_frame03550_frame_03550_vram.bin --cgram tools/out/lane3_live_entry_frame03550_frame_03550_cgram.bin --ppu-state tools/out/lane3_live_entry_frame03550_frame_03550_ppu_state.json --oam tools/out/lane3_live_entry_frame03550_frame_03550_oam.bin --screenshot tools/out/lane3_live_entry_frame03550_frame_03550_frame.png --out-dir tools/out/lane3_live_entry_frame03550_bundle`
- targeted builder/tooling validation:
  - `python3 -m py_compile tools/build_gameplay_frame_bundle.py`
  - manifest + PNG existence check on the refreshed bundles

Findings / Interpretation
- The new raw `BG3` previews are populated on all three late anchors and keep
  the expected sky-to-horizon gradient:
  - `3250`: `tools/out/lane3_live_entry_frame03250_bundle/bg3.png`
  - `3400`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg3.png`
  - `3550`: `tools/out/lane3_live_entry_frame03550_bundle/bg3.png`
- This materially improves design review because the sky/horizon discussion no
  longer depends only on `world_visible_support.png` or `bg_stack_visible_support.png`.
- It also sharpens the renderer read:
  the late gameplay boundary is no longer “does this bundle have usable BG3?”
  but “which composition/gating rule makes that helper layer visible in the
  final frame?”

What I learned (actionable)
- Late gameplay archaeology now has a tracked raw-state `BG3` surface that is
  useful for both design review and renderer debugging.
- The cheapest next renderer experiments should stay focused on composition
  rules over existing assets, not on collecting yet another proof that the
  horizon strip exists in VRAM.

Next steps / Checkpoints
1) Keep `bg3.png` in the late-gameplay bundle surface whenever new anchor
   pairs are promoted.
2) Use the refreshed `3250/3400/3550` raw `BG3` previews to narrow the next
   late-gameplay renderer rule instead of chasing fresh asset extraction.
3) Re-open scanline/composition work only where the new `BG3` preview and the
   screenshot-derived support masks still diverge in a defensible way.

Immediate recommendation
- Use the new tracked PNGs directly in design review:
  - `tools/out/lane3_live_entry_frame03250_bundle/bg3.png`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg3.png`
  - `tools/out/lane3_live_entry_frame03550_bundle/bg3.png`

Files updated in this turn
- `tools/build_gameplay_frame_bundle.py`
- `tools/out/lane3_live_entry_frame03250_bundle/`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- `tools/out/lane3_live_entry_frame03550_bundle/`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/out/lane3_live_entry_frame03250_bundle/bg3.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg3.png`
- `tools/out/lane3_live_entry_frame03550_bundle/bg3.png`

Date: 2026-04-01

Summary
- Moved gameplay scanline-profile selection out of the runtime hardcode and
  into the versioned contract
  `rom_analysis/docs/gameplay_scanline_contracts.jsonc`.
- Promoted a second gameplay consumer on that same surface:
  `tools/out/lane3_live_entry_frame03250_bundle/design_pack`, backed by the
  new tracked capture
  `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`.
- Closed an important negative result for that second phase:
  current flat-vs-contract compare on `3250` is still `0` mismatched pixels,
  which means later gameplay phases need more than the current
  `main_layers/bg1/bg2/bg3` scroll overlay.

What I ran
- new scanline capture for the late live-entry `3250` bundle:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=420 TD2_SCANLINE_TEST_TARGET_FRAME=3250 TD2_SCANLINE_TEST_MAX_SAMPLES=224 TD2_SCANLINE_TEST_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-4800:a' TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua`
- targeted smoke:
  - `make -C port`
  - `./port/test_scanline_contract.sh`
- targeted flat-vs-contract probe on `3250`:
  - contract-backed render on
    `tools/out/lane3_live_entry_frame03250_bundle/design_pack`
  - no-contract clone render on `/tmp/td2_flat_3250/scene`
  - `python3 tools/compare_frames.py /tmp/td2_flat_3250/flat_00000.ppm /tmp/td2_scanline_probe_3250/frame3250_00000.ppm`

Findings / Interpretation
- The scanline overlay path is no longer scene-specific runtime glue. Any
  bundle can now opt in through `gameplay_scanline_contracts.jsonc`.
- The new `3250` scanline capture is structurally valid and gameplay-shaped:
  - `224` samples
  - `main_layers`: `19 -> 23 -> 19`
  - `bg3_hscroll`: `0 -> 510` at scanline `23`
  - `bg3_vscroll`: `1023 -> 12` at scanline `24`
  - `bg2_hscroll`: lower-window ramp ending at `213`
- Despite that, the current renderer output for `3250` is still exactly the
  same with and without the contract (`0` mismatched pixels). That is the
  key result of this turn.

What I learned (actionable)
- The versioned contract path is the right abstraction boundary and is now
  ready for more gameplay bundles.
- The second gameplay bundle proved a stronger renderer boundary:
  later gameplay is not blocked on scanline-trace acquisition anymore; it is
  blocked on missing fields beyond the current `main_layers/bg1/bg2/bg3`
  scroll surface.

Next steps / Checkpoints
1) Extend `gameplay_scanline_contracts.jsonc` support to whichever next field
   is cheapest and most defensible for `3250`, instead of collecting more of
   the same scroll-only traces first.
2) Decide whether `3250` stays the best next consumer or whether the
   traffic-emergence `3400` bundle is the better proving lane for the next
   scanline-field promotion.
3) Keep `gameplay_live_race_mid` as the solved reference consumer while later
   gameplay phases are narrowed one field family at a time.

Immediate recommendation
- Use the local review pack that now includes the `3250` contract-backed PNG
  to show design the exact remaining gap: contract attached, but still no
  visible delta yet.
- Keep `./port/test_scanline_contract.sh` as the cheapest falsifier when
  touching scanline contract selection or adding a new gameplay consumer.

Files updated in this turn
- `port/Makefile`
- `port/src/td2_runtime.c`
- `port/test_scanline_contract.c`
- `port/test_scanline_contract.sh`
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `rom_analysis/docs/gameplay_scanline_contracts.jsonc`
- `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`

Date: 2026-04-01

Summary
- Promoted the first gameplay scanline-aware presentation path in the SDL
  runtime for the `gameplay_live_race_mid` rail instead of treating that seed
  as one flat frame-end `ppu_state`.
- The runtime now attaches the measured visible-scanline profile from
  `tools/out/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json`
  and feeds per-scanline `main_layers` plus `bg1/bg2/bg3` scroll values into
  `td2_ppu`.
- Refreshed the local design-review PNG pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` so the gameplay review
  frame now shows the restored horizon/roadside split instead of the old flat
  road/horizon collapse.

What I ran
- `make -C port clean && make -C port`
- `make -C port test`
- headless gameplay export:
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --input-script '3:a' --headless --frames 4 --dump-prefix tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame`
- manual visual review against:
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame_00003.png`
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_bg_stack_support.png`
  - `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_world_support.png`

Findings / Interpretation
- The promoted live-race bundle now renders with the horizon and roadside
  separation restored in the native runtime. The prior failure mode where the
  road swallowed the shoulders/horizon was caused by flattening gameplay to
  one global `main_layers/BG2VOFS` state.
- The measured scanline overlay is enough to correct that first-order visual
  boundary without changing the scheduler rail or inventing a new gameplay
  heuristic.
- The new scheduler smoke now closes two useful guardrails on the same lane:
  - the scanline profile must load with the expected `224` visible lines and
    selected `main_layers/bg2/bg3` checkpoints
  - the rendered framebuffer must preserve a few stable sky/mountain/grass
    pixels on the first promoted gameplay frame

What I learned (actionable)
- For gameplay, the renderer can advance one rail at a time with measured
  per-scanline overlays before the deeper road emitter family is fully
  reconstructed.
- The current sibling-artifact attachment is good enough for one promoted
  rail, but the next clean replacement is to move this into versioned contract
  data so later gameplay bundles can opt in without path-specific glue.

Next steps / Checkpoints
1) Move the live-race scanline attachment into versioned contract data instead
   of the current sibling raw JSON path.
2) Promote a second gameplay phase on the same scanline-aware surface so
   checkpoint/post-stop or police/radar bundles stop falling back to flat
   presentation.
3) Only after a second gameplay phase closes cleanly, decide whether more of
   the road emitter family must move from measured overlay to executed logic.

Immediate recommendation
- Use `tools/out/port_live_input_runtime_pngs_20260401/gameplay_live_a_frame0003.png`
  as the current designer-facing gameplay PNG for this checkpoint.
- Keep `./port/test_scheduler.sh` as the cheapest falsifier when touching the
  live-race gameplay presenter, because it now proves both scanline profile
  attachment and a small set of render pixels.

Files updated in this turn
- `port/include/td2_ppu.h`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/test_scheduler.c`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `tools/out/lane3_live_race_mid_scanline_full/td2_scanline_step_test.json`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `port/src/td2_ppu.c`

Date: 2026-04-01

Summary
- Promoted the first real SDL live-input path into the runtime instead of
  keeping interactive input separate from the scripted mutator lane.
- `platform_sdl` now maps keyboard and SDL game-controller samples into SNES
  `JOY1` bits, and `td2_scheduler` records that history on the same surface
  already used by `--input-script`.
- Materialized a local PNG review pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` with baseline, routed
  menu, and gameplay snapshots generated from the same runtime path.

What I ran
- `make -C port clean && make -C port`
- `./port/test_live_input.sh`
- `./port/test_input_mutation.sh`
- `make -C port test`
- local PNG review export with `./port/build/td2_port` on:
  - `tools/out/design_frame1500_car_select`
  - `tools/out/design_lane3_live_race_mid_frame0_native`

Findings / Interpretation
- The SDL host is no longer a side channel for input. Live keyboard/controller
  state now lands in the exact same scheduler/mutator surface used by replay
  scripts, so route logic and current-frame `JOY1` sampling are validated once
  instead of separately.
- Three useful proofs are now closed cheaply:
  - live menu history can trigger the traced no-opponent handoff
  - live current input can drive gameplay `JOY1` sampling on the live-race
    seed
  - scripted prehistory and live current input can merge on the same measured
    default-rival corridor
- The important remaining boundary is temporal, not architectural: if the
  bundle starts after the first required route decisions, fully live
  reproduction still needs earlier scene bases or promoted prehistory.

What I learned (actionable)
- Feeding SDL input through the shared scheduler surface is the right
  abstraction boundary: route semantics, current-button mirroring, and later
  gameplay mutations all stay behind one validation wall.
- The next leverage point is not more SDL mapping work; it is promoting
  earlier scene bases or compiled route seeds for branches whose history begins
  before the current bundle base frame.

Next steps / Checkpoints
1) Promote compare-backed fixtures for the live-input menu/gameplay rails
   wherever trusted goldens exist.
2) Move pre-bundle route history into earlier scene bases or compiled route
   seeds for menu/gameplay branches that start before the current bundle.
3) Extend the measured menu corridor past `2088` only when a new bounded
   probe block closes cleanly.

Immediate recommendation
- Use the local PNG pack under
  `tools/out/port_live_input_runtime_pngs_20260401/` as the current
  designer-facing review surface for this checkpoint.
- Keep `./port/test_live_input.sh` and `./port/test_input_mutation.sh` as the
  cheapest falsifiers when touching interactive input on the current runtime.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/include/td2_input.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_input.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_live_input.c`
- `port/test_live_input.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/platform_sdl.c`
- `port/src/td2_scheduler.c`
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`

Date: 2026-04-01

Summary
- Promoted the `menu_gameplay_entry` baseline from sparse post-`2050` anchors
  to an exact sampled scheduler-contract window across frames `2052..2088`.
- Expanded the default-rival `A` mutator in the runtime from isolated anchors
  into the measured `2052..2088` window, while preserving the later promoted
  checkpoints at `2104` and `2125`.
- Materialized a second local PNG review pack under
  `tools/out/port_input_mutation_window2054_2088_pngs_20260401/` with paired
  `A/B` outputs for frames `2054`, `2066`, `2083`, and `2088`.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `./port/test_input_mutation.sh`
- `./port/test_compare_lane.sh`
- `./port/test_regression.sh`
- `make -C port test`
- local PNG review export with `./port/build/td2_port` on
  `tools/out/design_frame1500_car_select` for frames
  `2054/2066/2083/2088` under both scripted `A` and scripted `B`

Findings / Interpretation
- The `2054..2088` corridor is deterministic enough to promote verbatim. The
  no-input rail is no longer inferred from a handful of checkpoints; it now
  has exact sampled baseline state for every frame in that bounded window.
- The default-rival `A` lane also has a real measured shape rather than a
  guessed extrapolation: `dp_0053/dp_0054` advance as a staircase,
  `dp_0020` changes only on selected even frames, and `state_09a8` flips
  only on a subset of odd frames.
- The new scheduler and mutator coverage stayed compatible with the existing
  compare lane and native renderer: no regression gate loosened to land this
  window.

What I learned (actionable)
- When probe data already exposes a bounded staircase window, exact promotion
  is cheaper and safer than inventing a generalized heuristic early.
- The next useful port step is no longer more manual densification inside
  `2054..2088`; it is feeding SDL live input into the same mutator surface
  that now already matches scripted replay on this corridor.

Next steps / Checkpoints
1) Feed live SDL keyboard/controller input into the same runtime mutator
   surface that currently accepts `--input-script`.
2) Promote compare-backed menu/gameplay fixtures wherever trusted goldens
   exist for this corridor.
3) Extend the measured menu corridor past `2088` only when a new bounded
   probe block closes cleanly.

Immediate recommendation
- Use the PNG pack under
  `tools/out/port_input_mutation_window2054_2088_pngs_20260401/` as the
  current designer-facing review surface for this checkpoint.
- Keep `./port/test_scheduler.sh` and `./port/test_input_mutation.sh` as the
  cheapest falsifiers when promoting the next measured menu window.

Files updated in this turn
- `port/include/td2_scheduler.h`
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `port/test_input_mutation.c`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `tools/out/port_input_mutation_window2054_2088_pngs_20260401/`

Next reading
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `port/src/td2_scheduler.c`

Date: 2026-04-01

Summary
- Extended the runtime input mutator beyond `state_0960` and the first
  no-opponent handoff into the first measured post-`2050` default-rival `A`
  anchors on `menu_gameplay_entry`.
- Promoted exact scheduler-contract baseline checkpoints for sampled
  no-input frames `2052`, `2053`, `2083`, `2104`, and `2125`, then overlaid
  the traced `A` route deltas on top of them.
- Runtime dumps and compare bundles now emit PNG siblings next to the
  existing PPM artifacts, and this turn also materialized a design-review
  anchor pack under `tools/out/port_input_mutation_anchor_pngs_20260401/`.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `./port/test_input_mutation.sh`
- `./port/test_compare_lane.sh`
- `./port/test_regression.sh`
- `make -C port test`
- PNG writer sanity check:
  - `./port/build/td2_port --scene-dir port/assets/test_dump_frame300/design_pack --headless --frames 1 --dump-prefix <tmp>/frame300`
  - `python3 tools/compare_frames.py <tmp>/frame300_00000.ppm <tmp>/frame300_00000.png`
- design-review export:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:a' --headless --frames 626 --dump-prefix <tmp>/a`
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:b' --headless --frames 626 --dump-prefix <tmp>/b`

Findings / Interpretation
- The menu rail now has a defensible first post-`2050` mutation layer that is
  grounded by the existing probe compares instead of hand-written heuristics:
  - `2052`: `dp_0020 = 89`, `dp_0054 = 0`
  - `2053`: `dp_0053 = 0`, `dp_0054 = 0`, `state_09a8 = 2`
  - `2083`: `dp_0020 = 170`, `dp_0022 = 289`, `dp_0053 = 128`,
    `dp_0054 = 128`
  - `2104`: `dp_0020 = 105`, `dp_0053 = 200`, `dp_0054 = 208`,
    `state_137c = 1`
  - `2125`: `dp_0020 = 19`, `dp_0022 = 289`, `dp_0053 = 8`,
    `dp_0054 = 8`, `state_09a2 = 26`, `state_137c = 1`
- The old no-opponent mutator was too permissive once the traced default-rival
  route was added to the same smoke surface; tightening that overlap was
  necessary so `default-rival` and `no-opponent` stop aliasing the same menu
  handoff.
- PNG dump output is now machine-validated against the existing PPM path with
  `0` mismatched pixels on the frame-`300` smoke, so design review can trust
  the new format as a faithful sibling artifact, not a separate render path.

What I learned (actionable)
- For the current bootstrap, exact sampled anchors are a good way to advance
  the post-`2050` corridor without pretending the whole lane is already
  continuously modeled. The next useful expansion is short windows, not a
  speculative all-frame rewrite.
- Design-review artifacts should stay in-band with the validation path.
  Emitting PNG next to the existing PPM/JSON bundle keeps regression and
  human review on the same artifact set.

Next steps / Checkpoints
1) Densify the new post-`2050` anchors into short `2054..2088` windows, where
   the visible dashboard/radar divergence is already bounded.
2) Feed live SDL keyboard/controller input into the same mutator surface that
   now accepts both sampled anchors and scripted windows.
3) Promote compare-backed menu/gameplay fixtures for those post-`2050`
   anchors whenever trusted goldens exist.

Immediate recommendation
- Use the PNG pack under `tools/out/port_input_mutation_anchor_pngs_20260401/`
  as the current designer-facing review surface for this checkpoint.
- Keep `./port/test_input_mutation.sh` as the cheapest falsifier when adding
  new post-`2050` anchor rows or mutator overlays.

Files updated in this turn
- `port/main.c`
- `port/include/td2_compare.h`
- `port/include/td2_contracts.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_compare_lane.sh`
- `port/test_regression.sh`
- `port/test_scheduler.c`
- `port/test_input_mutation.c`
- `port/docs/ARCHITECTURE.md`
- `port/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`
- `tools/out/port_input_mutation_anchor_pngs_20260401/`

Next reading
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `port/src/td2_scheduler.c`

Date: 2026-04-01

Summary
- Added the first real input-driven mutation layer on top of the contract-fed
  scheduler rails.
- The runtime now accepts `--input-script` windows in the same
  `frame:buttons` / `start-end:buttons` syntax already used by the Mesen-side
  tooling.
- The new input layer currently proves two grounded mutations:
  - `state_0960` mirrors the current `JOY1` sample from active buttons
  - the traced menu no-opponent route (`right+down`, then confirm) mutates
    the downstream `menu_gameplay_entry` handoff to `$1C70 = 3 / $1C76 = 0`

What I ran
- `make -C port clean && make -C port`
- `./port/test_input_mutation.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --input-script '3:a' --headless --frames 1 --dump-prefix <tmp>/gameplay`
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --input-script '1584-1589:right,down;1730-1735:start' --headless --frames 545`

Findings / Interpretation
- The port now has an explicit input surface instead of only frame-indexed
  playback. It is still bootstrap-scoped, but it is no longer input-blind.
- The new smoke closes two useful facts cheaply:
  - gameplay rails can now carry a real current-button sample
  - menu rails can now switch between default-rival and no-opponent handoffs
    using traced input history
- Existing regression, compare, callback-model, and scheduler rails stayed
  green under the new input layer.

What I learned (actionable)
- `state_0960` is a good first-class runtime field for scripted/live input
  because it is direct, cheap to validate, and already grounded by the memory
  map as the `JOY1` sample copied in NMI.
- The no-opponent route should stay framed as a traced menu mutator, not as a
  generic “menu AI”: it is grounded by the recovered `right+down` plus
  confirm corridor and should be extended only when more route semantics are
  actually validated.

Next steps / Checkpoints
1) Extend the input mutator beyond `state_0960` and the no-opponent handoff
   into post-`2050` gameplay deltas like `state_09a2/state_09a8/dp_0053/0054`.
2) Feed live SDL keyboard/controller input into the same runtime input layer.
3) Promote compare-backed fixtures for input-mutated menu/gameplay windows
   where trusted goldens already exist.

Immediate recommendation
- Use `--input-script` for bounded runtime experiments before adding new
  scheduler contract rows.
- Keep `./port/test_input_mutation.sh` as the cheapest falsifier for
  input-driven work on menu/gameplay rails.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/include/td2_contracts.h`
- `port/include/td2_input.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_input.c`
- `port/src/td2_scheduler.c`
- `port/src/td2_runtime.c`
- `port/test_callback_model.c`
- `port/test_input_mutation.c`
- `port/test_input_mutation.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/src/td2_input.c`
- `port/src/td2_scheduler.c`
- `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`

Date: 2026-04-01

Summary
- Promoted the menu/gameplay scheduler rails from hardcoded C anchors into
  the new contract surface `rom_analysis/docs/scheduler_rail_contracts.jsonc`.
- `td2_scheduler` now loads versioned rail segments for
  `menu_gameplay_entry` and `gameplay_live_race_mid`, while intro continues
  to use the callback model path.
- `tools/push_checkpoint.sh` no longer depends on a clean main worktree to
  refresh the curated wiki: it now rebuilds and commits the wiki in an
  isolated temporary `git worktree`, then cleans local generated wiki output
  back to the pushed state.

What I ran
- `make -C port clean && make -C port`
- `./port/test_scheduler.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --headless --frames 1 --dump-prefix <tmp>/menu`
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --headless --frames 1 --dump-prefix <tmp>/gameplay`

Findings / Interpretation
- The scheduler gate is now closed in reusable form for the non-intro rails:
  the smoke still proves the same menu/gameplay checkpoints, but those rails
  are now sourced from a shared JSONC contract instead of branches in
  `td2_scheduler.c`.
- The scheduler smoke grew from `156` to `175` checks because it now also
  proves rail origin (`scheduler.contract_loaded`, `segment_count`, and
  `scheduler_contract` source) in addition to frame state.
- The wiki refresh path is no longer blocked by unrelated dirty files in the
  main worktree, because the follow-up commit is created from a clean
  temporary worktree at the pushed checkpoint.

What I learned (actionable)
- The next port gate should move off rail externalization and onto mutation:
  menu/gameplay now have a stable contract surface that can absorb real
  input-driven state deltas without recompiling the scheduler.
- The repo no longer needs the older "skip wiki auto-commit when anything
  else is dirty" safety rule for generated wiki output. Isolating the refresh
  in a clean worktree is safer and more useful.

Next steps / Checkpoints
1) Start mutating `menu_gameplay_entry` and `gameplay_live_race_mid` under
   input instead of replaying fixed contract rows.
2) Promote compare-backed menu/gameplay fixtures wherever trusted goldens
   exist.
3) Expand the scheduler contract only when a new rail or new checkpoint is
   validated, not as a substitute for input/state execution.

Immediate recommendation
- Treat `rom_analysis/docs/scheduler_rail_contracts.jsonc` as the editable
  proving surface for menu/gameplay rail checkpoints.
- Keep `./port/test_scheduler.sh` as the cheapest falsifier before broader
  compare or bundle work.

Files updated in this turn
- `port/include/td2_contracts.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `tools/push_checkpoint.sh`
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `rom_analysis/docs/scheduler_rail_contracts.jsonc`
- `port/src/td2_scheduler.c`
- `tools/push_checkpoint.sh`

Date: 2026-04-01

Summary
- Replaced the old one-shot callback seed path with a minimal scheduler that
  executes validated callback families and handoffs on three promoted rails:
  `intro_noinput`, `menu_gameplay_entry`, and `gameplay_live_race_mid`.
- The design-pack loader now also tolerates tracked bundles that only carry
  local `raw/` dumps and no `layers/main_visible.ppm`, which makes the
  promoted menu/gameplay investigation packs runnable in the SDL runtime when
  compare is not requested.
- Added the new scheduler smoke so `make -C port test` now covers:
  regression parity, compare lane, intro callback model, and the three target
  scheduler rails.

What I ran
- `make -C port clean && make -C port`
- `./port/test_callback_model.sh`
- `./port/test_scheduler.sh`
- `./port/test_regression.sh`
- `./port/test_compare_lane.sh`
- `make -C port test`
- direct runtime probes:
  - `./port/build/td2_port --scene-dir tools/out/design_frame1500_car_select --scheduler-profile menu_gameplay_entry --headless --frames 1 --dump-prefix <tmp>/menu`
  - `./port/build/td2_port --scene-dir tools/out/design_lane3_live_race_mid_frame0_native --scheduler-profile gameplay_live_race_mid --headless --frames 1 --dump-prefix <tmp>/gameplay`

Findings / Interpretation
- The stale-build regression was a build artifact, not a scheduler bug:
  after a clean rebuild, both the old regression smoke and compare lane
  stayed exact.
- The new scheduler smoke now proves the three rails the user asked for:
  - intro no-input: `986`, `1093`, `1102`, `1117`
  - menu with input: `1500`, `1640`, `1677`, `1857`, `2014`, `2044`, `2050`
  - gameplay seed: `3`, `11`
- The promoted menu/gameplay bundles now load directly in the runtime even
  without `main_visible.ppm`, as long as compare is not requested.

What I learned (actionable)
- The active port gate is no longer "replace seeded callback state at all";
  that gate is closed in bootstrap form.
- The next leverage point is converting the hardcoded scheduler anchors into
  reusable contract surfaces, then applying real input-driven state mutation
  on top of those callback families.
- Intro should stop being the only proving lane now; the same scheduler loop
  is already viable on menu and gameplay surfaces.

Next steps / Checkpoints
1) Promote the three scheduler rails from hardcoded anchors into contract-fed
   rails.
2) Add input-driven mutation work on top of `menu_gameplay_entry` and
   `gameplay_live_race_mid`.
3) Promote compare-backed menu/gameplay fixtures when trusted goldens exist.

Immediate recommendation
- Use `./port/test_scheduler.sh` as the cheap falsifier for callback-family
  and handoff work before spending time on full compare bundles.
- Use `--scheduler-profile menu_gameplay_entry` and
  `--scheduler-profile gameplay_live_race_mid` when running the main binary on
  promoted investigation bundles outside `port/assets/`.

Files updated in this turn
- `port/Makefile`
- `port/main.c`
- `port/include/td2_contracts.h`
- `port/include/td2_runtime.h`
- `port/include/td2_scheduler.h`
- `port/src/td2_callback_model.c`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_io.c`
- `port/src/td2_runtime.c`
- `port/src/td2_scheduler.c`
- `port/test_callback_model.c`
- `port/test_scheduler.c`
- `port/test_scheduler.sh`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

Next reading
- `port/src/td2_scheduler.c`
- `port/test_scheduler.c`
- `PORT_PLAN.md`

Date: 2026-04-01

Summary
- Fixed the curated docs wiki `Last updated` regression.
- `tools/build_docs_wiki_report.py` no longer trusts filesystem mtime alone;
  it now prefers the latest Git commit timestamp for each source doc and only
  falls back to local mtime when Git history is unavailable.

What I ran
- `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Findings / Interpretation
- The wiki was previously showing stale timestamps for recently committed docs
  because file mtimes in this repo were lagging behind the actual push/commit
  chronology.
- After the fix, the Source Of Truth docs now show the latest pushed commit
  time again:
  - `PORT_PLAN.md`: `2026-04-01 10:37`
  - `next_steps_roadmap.md`: `2026-04-01 10:37`
  - `progress_checkpoints.md`: `2026-04-01 10:37`
  - `validation_gates.md`: `2026-04-01 10:37`
  - `validation/README.md`: `2026-04-01 10:37`
  - `port/README.md`: `2026-04-01 10:37`

What I learned (actionable)
- Git commit time is the right primary signal for this wiki surface because it
  tracks what was actually published, while local mtimes in this repo are not
  stable enough to sort/update the index reliably.
- The post-push wiki rebuild remains correct locally even when the follow-up
  wiki auto-commit must be skipped due unrelated dirty tracked docs.

Next steps / Checkpoints
1) Keep using Git-backed timestamps in the wiki generator.
2) Return to the active port gate:
   replace the seeded callback bootstrap with real front-end callback/state
   execution.

Immediate recommendation
- Treat the local rebuilt wiki under `tools/out/docs_wiki/` as the source of
  truth for `Last updated` until the worktree is clean enough for the wrapper
  to auto-commit the regenerated HTML again.

Files updated in this turn
- `tools/build_docs_wiki_report.py`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `tools/build_docs_wiki_report.py`
- `rom_analysis/docs/progress_checkpoints.md`

Date: 2026-04-01

Summary
- Promoted the first callback-backed compare-lane checkpoint on top of the
  seeded PPU-state lane.
- Added `td2_contracts.*`, which resolves
  `rom_analysis/docs/callback_state_contracts.jsonc` from the scene path,
  loads the matching frame checkpoint when one exists, and seeds a bootstrap
  runtime-state shadow from it.
- The compare JSON now also emits `callback_contract`, alongside the existing
  `state_contract`.
- Promoted `frame_01093` as the first callback-backed fixture in the default
  compare smoke because it has both exact pixel parity and a validated
  `01:9FE5` callback/state checkpoint.

What I ran
- `make -C port test`

Findings / Interpretation
- The compare lane now spans three layers:
  pixels, seeded PPU-visible state, and seeded callback/state for covered
  frames.
- Current promoted fixtures stay exact:
  - `frame300_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `58`, `0` failed callback checks out of `0`
  - `frame1086_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `59`, `0` failed callback checks out of `0`
  - `frame1093_compare`: `0` mismatched pixels, `0` failed PPU-state checks
    out of `59`, `0` failed callback checks out of `8`
- This is still a bootstrap checkpoint:
  the runtime seeds the callback/state shadow from trusted contracts; it does
  not yet execute those callback families on its own.

What I learned (actionable)
- The next technical gap is no longer how to represent callback/state
  checkpoints; that representation now exists in the runtime and compare JSON.
- The next gate should replace seeded callback/state shadowing with real
  callback/state stepping for covered front-end frames.

Next steps / Checkpoints
1) Start replacing seeded callback-state shadowing with real callback/state
   execution for the front-end intro family.
2) Promote more compare fixtures that land on known contract rows, not just
   `1093`.
3) Keep `frame1093_compare` in the default smoke as the first cheap callback
   contract falsifier.

Immediate recommendation
- Treat `callback_contract.failed_checks` as a first-class compare gate next
  to `state_contract.failed_checks`.
- Use `frame_01093` when a code change needs one promoted fixture with both
  visual parity and validated callback/state coverage.

Files updated in this turn
- `port/Makefile`
- `port/include/td2_compare.h`
- `port/include/td2_contracts.h`
- `port/include/td2_runtime.h`
- `port/main.c`
- `port/src/td2_compare.c`
- `port/src/td2_contracts.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`

Next reading
- `PORT_PLAN.md`
- `rom_analysis/docs/callback_state_contracts.jsonc`
- `port/docs/ARCHITECTURE.md`

Date: 2026-04-01

Summary
- Promoted the compare lane from pixel-only review into a first semantic
  state-contract surface.
- The compare JSON now includes `state_contract`, which validates seeded
  PPU-visible fields against the runtime state:
  - visible PPU/OAM registers
  - Mode 7 fields
  - per-layer tilemap/CHR/scroll metadata
  - raw `VRAM/CGRAM/OAM` byte parity
- `--fail-on-compare-diff` now fails on either pixel drift or state-contract
  drift.
- Extended `port/test_compare_lane.sh` so the compare smoke enforces both
  exact pixels and zero semantic failures.

What I ran
- `make -C port test`

Findings / Interpretation
- The compare lane now carries the right shape for the next callback/state
  phase instead of only reporting image deltas.
- Current promoted fixtures stay exact in both dimensions:
  - `frame300_compare`: `0` mismatched pixels, `0/58` state failures
  - `frame1086_compare`: `0` mismatched pixels, `0/59` state failures
- The new semantic contract is still bootstrap-scoped:
  it proves that the runtime preserves the loaded SNES-visible scene state,
  not yet that it advances real callback families over time.

What I learned (actionable)
- The next compare extension should target trusted multi-frame callback/state
  traces, not more static-scene bookkeeping.
- The current seeded PPU contract is still worth keeping in the default smoke,
  because it will catch silent raw-state drift when the runtime starts mutating
  `VRAM/CGRAM/OAM` or layer registers dynamically.

Next steps / Checkpoints
1) Start feeding trusted intro callback/state traces into the compare lane
   shape, beginning with front-end families once the runtime can step them.
2) Keep the seeded PPU contract active as the cheap guardrail for static
   bootstrap fixtures.
3) Continue using `make -C port test` as the default bounded falsifier.

Immediate recommendation
- Treat `state_contract.failed_checks` in the compare JSON as a first-class
  gate alongside `metrics.mismatch_pixels`.
- Use `--fail-on-compare-diff` whenever generating review bundles so both
  pixel drift and semantic drift fail fast.

Files updated in this turn
- `port/include/td2_compare.h`
- `port/main.c`
- `port/src/td2_compare.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/validation_gates.md`

Date: 2026-04-01

Summary
- Added the first Zelda3-style compare lane to the new `port/` runtime.
- The native binary now supports `--compare`, which emits:
  - native runtime frame
  - trusted `main_visible` golden
  - absolute RGB diff map
  - `runtime | golden | diff` strip
  - machine-readable JSON drift metrics
- Added the dedicated compare smoke:
  - `port/test_compare_lane.sh`
- Promoted `make -C port test` so it now covers both exact-frame parity and
  compare-bundle generation.
- Verified the curated docs wiki is still valid by rebuilding it with
  `tools/build_docs_wiki_report.py`.
- Added the repo-local push wrapper:
  - `tools/push_checkpoint.sh`
  This pushes the current checkpoint, rebuilds the curated wiki, and creates a
  follow-up wiki refresh commit/push only when the generated wiki changes and
  the worktree is otherwise clean enough to avoid mixing unrelated edits.

What I ran
- `make -C port`
- `./port/test_regression.sh`
- `./port/test_compare_lane.sh`
- `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki --markdown-bundle-dir tools/out/docs_wiki_markdown_bundle`

Findings / Interpretation
- The runtime now has the first compare/reporting spine that matches the new
  port direction instead of relying on ad hoc external diffs only.
- The compare lane is exact on the current promoted fixtures:
  - `frame300_compare`: `0` mismatched pixels
  - `frame1086_compare`: `0` mismatched pixels
- The curated wiki regenerated cleanly from current docs.
- The generated wiki output is not safe to auto-commit in the current mixed
  dirty worktree, which is why the new push wrapper now guards against that
  case instead of sweeping unrelated edits into the wiki follow-up commit.

What I learned (actionable)
- The cheapest high-signal next step is no longer visual parity on isolated
  fixtures; it is feeding callback/state contracts into this compare spine.
- The wiki step is cheap enough to keep in the routine checkpoint pipeline,
  but it does not need a second commit when the generated output is unchanged.

Next steps / Checkpoints
1) Start promoting callback/state expectations into the compare lane outputs.
2) Tie the compare lane to trusted intro traces beyond the two static
   design-pack fixtures.
3) Keep using `tools/push_checkpoint.sh` at the end of future pushed
   checkpoints so the wiki refresh stays routine.

Immediate recommendation
- Use `make -C port test` as the default bounded port smoke.
- Use `./port/build/td2_port --compare ...` whenever a new fixture needs a
  reviewable runtime-vs-golden bundle.

Files updated in this turn
- `port/Makefile`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `port/include/td2_compare.h`
- `port/include/td2_runtime.h`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/src/td2_compare.c`
- `port/src/td2_runtime.c`
- `port/test_compare_lane.sh`
- `validation/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `tools/push_checkpoint.sh`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-01

Summary
- Promoted the new `port/` bootstrap from reference-frame blitting to a real
  synthetic PPU path over raw `VRAM/CGRAM/OAM/PPU` state.
- Extended the design-pack loader so `td2_io.*` now also consumes
  `raw/ppu_state.json` and populates layer, Mode 7, and OAM register state.
- Ported the working SNES BG/OBJ/Mode7 rasterization core into the new
  `Td2PpuState` architecture.
- Moved the large `Td2Runtime` allocation off the stack in `main.c` so the
  expanded PPU cache/state remains stable in headless and SDL runs.

What I ran
- `make -C port`
- `./port/test_regression.sh`

Findings / Interpretation
- The promoted fixtures are now exact through the native runtime compositor
  itself, not through `main_visible.ppm` blitting.
- Exact parity still holds on both current checkpoint scenes:
  - `frame300_bootstrap`: `0` mismatched pixels
  - `frame1086_bootstrap`: `0` mismatched pixels
- The new runtime spine now has the right ownership split for the next gate:
  trusted raw-state ingest on one side and synthetic frame generation on the
  other, with extracted `main_visible.ppm` kept only as a regression golden.

What I learned (actionable)
- The old renderer core was reusable with limited adaptation; the shortest
  path forward is continuing to lift proven renderer/contract pieces into the
  new runtime shape instead of rebuilding them from scratch.
- The next port checkpoint should focus on Zelda3-style side-by-side compare
  and callback/state drift reporting, not on more bootstrap rendering work.

Next steps / Checkpoints
1) Add the side-by-side compare lane between the runtime and trusted traces.
2) Start feeding validated callback/state contracts into the runtime loop.
3) Keep using the promoted frame-`300` and frame-`1086` fixtures as the cheap
   native smoke while broadening compare coverage.

Immediate recommendation
- Use `make -C port` plus `./port/test_regression.sh` as the default falsifier
  after any PPU/runtime change.
- Treat `layers/main_visible.ppm` strictly as a compare surface from this
  checkpoint onward.

Files updated in this turn
- `port/include/td2_io.h`
- `port/include/td2_ppu.h`
- `port/main.c`
- `port/src/td2_io.c`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/README.md`
- `port/docs/ARCHITECTURE.md`
- `validation/README.md`
- `PORT_PLAN.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `PORT_PLAN.md`
- `port/docs/ARCHITECTURE.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-01

Summary
- Reset the port lane to the new SNES-mimetic strategy and replaced the old
  gameplay/physics stand-ins in `port/` with a clean bootstrap runtime.
- Added repo ignore protection for the local-only reference inputs:
  - `zelda3/`
  - `sentrysearch/`
  - `the_duel_longplay.mp4`
- Added the new bootstrap runtime pieces:
  - `port/Makefile`
  - `port/main.c`
  - `port/platform_sdl.c`
  - `port/platform_sdl.h`
  - `port/include/td2_io.h`
  - `port/include/td2_ppu.h`
  - `port/include/td2_runtime.h`
  - `port/src/td2_io.c`
  - `port/src/td2_ppu.c`
  - `port/src/td2_runtime.c`
  - `port/docs/ARCHITECTURE.md`
- Removed the old port-facing stubs that encoded invented gameplay / tilemap
  demos instead of SNES-like runtime ownership.
- Added the new gameplay chunk helper that reuses the attached SentrySearch
  chunker without indexing the repo into Git:
  - `tools/build_sentrysearch_chunk_manifest.py`
- Produced the first reusable longplay chunk artifacts:
  - `tools/out/sentrysearch_longplay_anchor_chunks.json`
  - `tools/out/sentrysearch_longplay_anchor_chunks.md`
- Added the gameplay lookup note:
  - `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`

What I ran
- `make -C port`
- `./port/test_regression.sh`
- `cd sentrysearch && uv run sentrysearch stats`
- `python3 -m py_compile tools/build_sentrysearch_chunk_manifest.py`
- `python3 tools/build_sentrysearch_chunk_manifest.py sentrysearch/video/the_duel_longplay.mp4 --window 'bridge:1802:90:bridge crossing|purple water|mountain horizon|traffic right lane' --window 'tunnel:2028:90:tunnel driving|dark tunnel walls|mountain wall corridor' --window 'rain:2688:90:rain segment|windshield droplets|traffic ahead' --window 'snow:3570:120:snow onset|snow mountain curve|log truck ahead' --json-out tools/out/sentrysearch_longplay_anchor_chunks.json --markdown-out tools/out/sentrysearch_longplay_anchor_chunks.md`

Findings / Interpretation
- The new `port/` checkpoint now matches the strategy reset:
  SDL host shell + SNES-like raw state shadow + extracted design-pack loading,
  with no fake gameplay loop left in the runtime.
- The bootstrap smoke is exact on the promoted frame fixtures:
  - `frame300_bootstrap`: `0` mismatched pixels
  - `frame1086_bootstrap`: `0` mismatched pixels
- The current renderer is intentionally still a bootstrap:
  it presents exact extracted `main_visible` surfaces while seeding the raw
  `VRAM/CGRAM/OAM` buffers that the future synthetic PPU path must consume.
- The local SentrySearch install works, but its persistent index is empty by
  default; there was no hidden prebuilt semantic index to reuse.
- The new chunk manifest still gives lane 3 a useful immediate surface without
  paying the indexing cost up front:
  - `bridge`: `30:02..31:32` (`4` chunks)
  - `tunnel`: `33:48..35:18` (`4` chunks)
  - `rain`: `44:48..46:18` (`4` chunks)
  - `snow`: `59:30..01:01:30` (`5` chunks)

What I learned (actionable)
- The port lane can now advance on the right architecture without carrying the
  old speculative PC runtime forward.
- The next port checkpoint should replace reference-frame blitting with a
  real compositor over the already-loaded raw state, not rebuild another demo.
- Lane 3 now has reusable longplay windows plus query vocabulary that can be
  used before a full semantic SentrySearch index exists.

Next steps / Checkpoints
1) Replace `main_visible` blitting in `port/src/td2_ppu.c` with synthetic
   rasterization from raw `VRAM/CGRAM/OAM/PPU` state.
2) Add a Zelda3-style side-by-side compare lane between the runtime and
   trusted traces / state contracts.
3) Use the new SentrySearch chunk manifest to aim the next bounded gameplay
   capture or semantic indexing pass at one named window, not the whole
   longplay.

Immediate recommendation
- Use `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md` plus
  `tools/out/sentrysearch_longplay_anchor_chunks.md` when choosing the next
  lane-3 capture target.
- Treat `make -C port test` as the default bounded smoke for the new runtime
  until the synthetic PPU path lands.

Files added in this turn
- `port/Makefile`
- `port/main.c`
- `port/platform_sdl.c`
- `port/platform_sdl.h`
- `port/include/td2_io.h`
- `port/include/td2_ppu.h`
- `port/include/td2_runtime.h`
- `port/src/td2_io.c`
- `port/src/td2_ppu.c`
- `port/src/td2_runtime.c`
- `port/docs/ARCHITECTURE.md`
- `tools/build_sentrysearch_chunk_manifest.py`
- `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `PORT_PLAN.md`
- `rom_analysis/docs/sentrysearch_gameplay_chunk_workflow.md`
- `rom_analysis/docs/next_steps_roadmap.md`

Date: 2026-04-01

Summary
- Refreshed the stale bank30 generated evidence so lane-1 docs match current tool behavior again.
- Rebuilt:
  - `tools/out/bank30_headers.json`
  - `tools/out/bank30_chunk_validation.json`
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`
- Added the new repeatable chunk-shape analyzer:
  - `tools/analyze_bank30_chunk_shapes.py`
- Produced the new structural artifacts:
  - `tools/out/bank30_chunk_shapes.json`
  - `tools/out/bank30_chunk_shapes.md`
- Wrote the dev-team handoff:
  - `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`

What I ran
- `python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json`
- `python3 tools/validate_td2_chunks.py game.smc --bank 30 --headers-json tools/out/bank30_headers.json --json-out tools/out/bank30_chunk_validation.json`
- `python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md`
- `python3 tools/analyze_bank30_chunk_shapes.py --json-out tools/out/bank30_chunk_shapes.json --markdown-out tools/out/bank30_chunk_shapes.md`

Findings / Interpretation
- The refreshed header manifest again exposes all `8` candidate starts, including the two `67FB` rows:
  - `1E:DA96`
  - `1E:E91F`
- The refreshed validation pass now matches decoder reality:
  - `DA96` decodes successfully (`28620` output bytes, `6429` source bytes consumed)
  - `E91F` fails as a standalone `67FB` (`index out of range`)
- The rebuilt registry is now back in sync:
  - `runtime-confirmed`: `DF6C/E039/E73F/E800`
  - `sentinel-control`: `9681`
  - `nested-invalid-marker`: `E91F`
  - unresolved queue:
    - `P0`: `EE7F`
    - `P1`: `DA96`
- Static shape analysis materially narrows the two unresolved lanes:
  - `DA96` carries a repeated `0x7C1F` run block with `33` starts on a fixed `157`-word stride; treating that as a row width yields a `157 x 33` repeated block with `32` identical rows, which is strong evidence for row-major visual/map payload rather than code-like material
  - `EE7F` keeps the same `899`-word footprint as `DF6C/E73F`, but only `20.356..21.0234%` same-index overlap against them, while `DF6C` vs `E73F` stays `77.5306%`; that makes `EE7F` a real distinct helper payload, not a near-clone of the already-seen pair

What I learned (actionable)
- `EE7F` should remain the highest-priority runtime proving target because it is both bank1-table-confirmed and structurally distinct from the already-observed `26FB` siblings.
- `DA96` is still runtime-unseen, but it is now better framed as a visual/map-provenance problem than a hidden-code problem.
- The immediate doc/tool mismatch is closed; future lane-1 work can rely on the rebuilt bank30 registry again.

Next steps / Checkpoints
1) Chase an organic `EE7F` reachability path before widening more forced-`B1F9` experiments.
2) Keep `DA96` on a separate consumer/visual-correlation track instead of trying to route it through the same helper-index funnel as `EE7F`.
3) Reuse `tools/analyze_bank30_chunk_shapes.py` whenever a new bank30 unresolved candidate needs a quick “clone vs distinct payload” read.

Immediate recommendation
- Use the new handoff note first:
  - `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`
- Then spend the next bounded lane-1 step on an organic `EE7F` path, not another widened forced-callback stall.

Files added in this turn
- `tools/analyze_bank30_chunk_shapes.py`
- `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`
- `rom_analysis/docs/progress_checkpoints.md`

Next reading
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/bank30_unresolved_queue_dev_handoff_2026-04-01.md`

Date: 2026-03-30

Summary
- Executed an expanded L001210 probe matrix (7 scenarios) to exercise additional branch gates and force selectors / callback values aimed at surfacing bank30 callers DA96 (1E:DA96) and EE7F (1E:EE7F).
- The run used the repository's Mesen bridge and validation runner and wrote outputs under:
  - tools/out/l001210_probe_matrix_expanded/matrix_summary.json
  - tools/out/l001210_probe_matrix_expanded/matrix_summary.md
  - per-scenario traces and summaries under tools/out/l001210_probe_matrix_expanded/
- Added the scenarios manifest: tools/l001210_expanded_scenarios.json (committed to the repo).

What I ran
- tools/run_l001210_probe_matrix.py --rom game.smc --out-dir tools/out/l001210_probe_matrix_expanded \
  --total-frames 2200 --timeout-seconds 120 --max-hits 0 --scenarios-json tools/l001210_expanded_scenarios.json
- Scenarios included the previous default four plus three targeted experiments:
  - force_b1f9_selectors_full: re-applies selector forcing across frames with TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1 and traces B1F9 exec point
  - force_main_callback_9568_1200_1800: force the main callback pointer to 0x9568 (38248 dec) for frames 1200..1800 and trace selected exec points
  - force_main_and_selectors: combined forcing of selectors and main-callback with exec-point tracing

Artifacts produced
- tools/out/l001210_probe_matrix_expanded/matrix_summary.json (.md)
- Per-scenario trace JSONs; summary JSONs: e.g. tools/out/l001210_probe_matrix_expanded/force_b1f9_selectors_full_summary.json

Findings / Interpretation
- Existing table-confirmed bank30 entries (1E:DF6C, 1E:E039, 1E:E73F, 1E:E800) produced hits in runtime (each observed in one or more scenarios).
- Candidate addresses 1E:DA96 and 1E:EE7F remain unseen (hit_count == 0) across all scenarios, including the selector-forced and forced-callback experiments.
- force_main_callback_9568_1200_1800 produced very few total hits (6) and zero bank30 hits — suggests that this forced callback alone did not drive those bank30 outputs in the observed windows.
- force_b1f9_selectors_full (selectors forced across frames and re-applied at B1F9) produced more general hits but still did not reveal DA96/EE7F — this narrows the likely calling contexts for those candidates.

What I learned (actionable)
- DA96/EE7F are not triggered by the baseline boot and a set of targeted forced-selector/callback windows we tried. They likely come from a different execution path not yet exercised (another caller family, later gameplay event, or metaprotection/conditional gate).
- The probe infrastructure (trace/write/exec-point forcing) is working as expected and writes rich per-hit metadata (caller PC, selector snapshot, CPU regs) that will be useful when/if DA96/EE7F appear.

Next steps / Checkpoints
1) Targeted static analysis of decompressed DA96 output (if available) to find likely caller patterns and strings. This reduces runtime guessing and can propose exact exec points to trace. (Checkpoint: produce DA96 disassembly and list of plausible caller PC addresses.)
2) Enumerate and add more scenarios that exercise other gameplay subsystems (e.g., in-game menu sequences, specific player actions, iterative controller patterns) or longer-run scenarios that reach later gameplay states. (Checkpoint: add a scenario set for in-game menu sequences and try again.)
3) If static hints point to a particular bank1 caller address family, construct a forced-callback experiment that sets the main callback to that caller and force selector values around it (similar to the B1F9 forcing we already used). (Checkpoint: create and run a focused scenario that forces the discovered caller.)
4) Consider integrating periodic CI probing that runs the matrix overnight to capture intermittent or rare hits. (Checkpoint: CI job + alert when candidate hit_count > 0.)

Immediate recommendation
- Do the static analysis (step 1) first — it has the highest chance of producing concrete exec addresses to target with the probe harness. If you want, I can extract and disassemble the DA96 decompressed binary now and produce a short list of candidate call-sites.

Files added in this turn
- tools/l001210_expanded_scenarios.json
- rom_analysis/docs/progress_checkpoints.md

Next reading
- rom_analysis/docs/next_steps_roadmap.md (follow the lane order in PORT_PLAN.md)
