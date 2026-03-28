# ROM Archaeology Progress Checkpoints

Snapshot date: `2026-03-27`

This file tracks plan progress as checkpoints with objective evidence and the
next gate needed to advance.

## Plan Position (Across All Lanes)

| Lane | Status | Completion read |
|---|---|---|
| Lane 1: Bank30 compression provenance | active | core pipeline is in place; registry tightening now closes `9681` as `sentinel-control` and `E91F` as `nested-invalid-marker`; active unresolved queue remains `EE7F` and `DA96` |
| Lane 2: Mesen tile/sprite/tilemap design handoff | active | resume from `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`; extraction + design packs are operational; contiguous provenance windows still cover `1086..1117`, the later direct-hit cluster `7051/7059/7064` now also has interior tilemap carry confirmation at `7055/7061`, the reopened result is tilemap-only rather than full-scene carry because `7055` still diverges in visible-sprite/OAM composition, a new visual-contract IR now separates BG/CHR state from OBJ/OAM state with optional provenance binding, the frame-`300` live producer-trace proof is still good after the launcher fix, frames `986/990/994/998/1005/1013/1021/1029/1037/1045/1053/1061/1069/1077/1085/1093` now have live producer-trace-backed visual contracts under the same `01:9FE5` callback family, the new consolidated `986..1093` range summary now makes that callback/state progression explicit in one artifact, the post-`1093` compare summary now closes the first `1094..1101` read by proving `main_visible.ppm` is the top `224` lines of `main.ppm` and that swapping only visible-scanline `matrix[0]/[3]` values makes the render mismatch worse, a new Mesen activity-trace builder now normalizes `DMA/VRAM/Mode7` probe outputs into frame/callback events, the visual-contract builders now also merge that activity layer directly, the follow-up `1102..1117` compare summary proves the whole `00:8029` continuation keeps the same `bg1`/`61`-sprite surface, the new `1118..1125` continuation note extends that exact no-DMA surface past the old headless edge, the next sampled compare block now closes the same exact surface through `1133`, the wider `1164..1172` boundary window already proved the next later change is a producer-side reactivation rather than a callback switch, a refreshed blob-cycle report now ties that reactivation to a concrete ownership path `01:B6E3 -> 01:9DC6 -> 00:95BD -> $096A/$0700 -> OAMDATA`, filters strictly to `1134..1200`, and emits transition rows that prove `state0204` alone cannot explain blob/`VMADD` selection because each sampled `1/2/3` state reaches all three `AA10/AB58/ACA0` blobs and both `0x4920/0x49A0` targets. That moves the strongest next static target down into the deeper `$0440/$0442` phase loop inside `L00B6E3`. The previously open `$1C7C` naming frontier is now closed by rendered descriptor rows `11..14`: `Desert Blast - Easy`, `City Bound - Medium`, `East Coast - Hard`, `West Coast - Hardest`; the separate `$1C6A` top-menu surface is now also closed by rendered descriptor rows `15..17`: `Game Options`, `Play TDII`, `High Score`; those same `$1C6A` branches are now semantically closed as `Game Options -> L00C0C7`, `Play TDII -> downstream $0202 corridor`, and `High Score -> L00A3CC`; the next downstream `$1C70` surface is now fully closed as a `4`-state `2x2` Select Opponent grid with a `1E:8000` row `0x1D` selection box, three explicit rear-car cells from `16:8000/18:8000/1B:8000`, and a separate helper-`8` BG1 stopwatch/clock slot, and `L008B87` now also closes the first handoff semantics of that same choice by turning `$1C70 = 0..2` into `$1C76 = 1`, `$1C7A = $1C70` while `$1C70 = 3` forces the no-opponent branch `$1C76 = 0`, `$1C7A = 0`; no-force timed-input probes now also recover the default rival corridor organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`. Callback-relative `v5/v6` follow-ups now also drive the fourth slot organically by keying `right+down` and `start` to first live `01:C1D2`, and a later `be43+17-22:start` confirm now closes the no-opponent path through `L008B87 -> 01:902D -> 01:9111 -> active_main = 02:9016` while preserving `$1C70 = 3` / `$1C76 = 0` at the same downstream timestamps where the rival baseline keeps `0 / 1`. A direct `2044..2199` compare now shows that both paths already share `02:9016/01:96A0/02:8F3C`, keep `54` sampled fields identical, and narrow the remaining split to `14` fields, with `state_09a2/state_09a8` and the paired DP scratch fields `0020/0022/0053/0054` the strongest post-handoff targets; the corrected screenshot-review packs now establish that `2044` is a dead transition frame and the first shared non-black review window is `2048..2088`, while the extended probe compare now closes the first stable rival-vs-clock live split itself as `$1C76 -> state_11f3 -> oam_0730` in `bank2.asm` `L0108EF`, matching the rival-only top-strip OAM marker seen in the corrected screenshots. A full-rate `2048..2088` compare now pushes the lane further: frame `2048` alone carries a smaller transition bbox `(11, 20, 14, 21)`, frames `2049..2088` keep the same full top-strip bbox `(11, 11, 194, 21)`, and the suspected `09A2/09A8` pulse points `2051/2083` show no extra whole-frame or adjacent-frame-visible change in either lane. Normalized front-end row previews now also sharpen the remaining car-facing read: rows `8..10` decode to a three-phase rolling-tire helper rather than a name-bearing label set, rows `0x15..0x1B` decode to control/sound menu text (`Brake`, `Throttle`, `Horn`, `Upshift`, `Downshift`, `Steering`, `Pause`, `stereo`), the `01:9C77` per-car bases now calibrate to Porsche 959 / Lamborghini Diablo / Ferrari F40 OBJ catalogs, a stable frame-`1500` front-end car-presentation render keeps the `Porsche 959` title/info box intact without OAM, the helper-provenance artifact anchors that visible lower-screen BG2 surface to helper bundle `10`, static `L00BC0F` proves the per-car `BG2` reload uses `$0202 + 0x0009` through `L00A9A0/L00A9CB` without a paired per-car `L00A9F2`, and the new exact-frame raw-dump compare lane now keeps `BG1` unchanged across frames `1500/1640/1780`, limits visible `BG2` tilemap deltas to the top row (`27/11/27` changed cells), and shows `0` changed visible-union `BG2` CHR bytes across those same pairings; this frame trio is currently best described as one front-end car-presentation corridor rather than a proven interactive car-select menu. Short-force callback probes still show the next headless limit clearly: after one real `01:B1F9` entry at frame `1201`, `01:9568/01:95AD` stay pinned as `active_main` through frame `2199` with no `7E:096C..0971` writes and no exec hit at `01:B226/B638/B6A3/B6E3/B755/01:9D69/02:9016/02:8F3C`, so direct-force callback promotion remains low-yield unless a richer selector/savestate capture appears. |
| Lane 3: Gameplay-era frame archaeology | active | the older promoted `v2_current` lane still explains the historical screenshot-vs-end-frame split and the pre-drift queue-cursor equalization path through frames `90..92`, but a fresh current-seed recheck now closes an important confusion point: today's `game_11.mss` fingerprint no longer reproduces that window and instead stays flat on `00:8029/00:835F` with `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12` and `0` write hits in `target_frame=90/91` scanline reruns. The seed-surface audit still proves the current `game_11.mss` savestate is a `front_end_menu_seed`, not verified gameplay. The repo now also carries a preserved manual live-race seed pair from user Mesen slots `#1/#3`, plus slot `#2` as an explicit nearby boundary seed. The primary pair still loads onto `02:9016/01:96A0/02:8F3C` with the inherited selector family, and a new aligned control compare now proves the old post-`2050` default-rival no-input corridor is already separated inside that same callback family: both manual seeds differ on all `12/12` aligned frames in `oam_0730`, `state_11f3`, `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and `state_09a2`. A new attract/demo boundary note now demotes a key historical assumption: older no-input and early-input corridors can clip short gameplay-like demo slices, so the absence of a long uninterrupted gameplay segment there is no longer strong negative evidence by itself. A new ownership note now closes the first semantic pass on those split fields: `state_11f3 -> oam_0730` is rival-gated HUD/OAM, `state_09a2` is an OAM cursor, `state_09a8` is allocator/build control, `dp_0053/0054` behave as DMA-ring cursors, and `dp_0020/0022` are still best read as transient builder scratch. A new live-race layer-stack note now narrows the visible composition on a real manual seed: `lane3_live_race_mid.mss` frame `0` samples as `BG1 + BG2 + OBJ`, `BG1` stays scroll-stable, `BG2` changes per scanline, and the active `01:9111 -> 01:9185 -> 02:9165` path already matches that read via the `HDMA7` / `BG2VOFS` corridor. A new producer-path note now pushes that same seed into the visible split itself: `live_race_mid` repeatedly rewrites `$22/$23`, `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`, `TMAIN` briefly enables `BG3` at scanline `23`, and the strongest current producer cluster is now narrowed inside `L01318D` around `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`. The new static role split now sharpens that cluster: `02:B042` is a variant-word load, `02:B05D / 02:B0B1 / 02:B0BD` are setup/math, `02:B134` is the strongest generic `L012BE2` submit point, and a nearby alternate submit path exists at `02:B101 -> L012D5A`. A direct slot-`#2` recheck now closes the preserved extra seed as `00:8029/00:835F/00:8029` with visible `BG3` only at frame `0`, so it is a boundary/control seed rather than a second gameplay replicate. A new lab-backend boundary note now further closes `live_race_plus30f`: its absolute start frame is `17495`, which demotes the `plus30f` timing label to a historical name only, and current `labRunner` export attempts still fail during frame-boundary correction on that seed. A new human-support note now also makes the practical re-entry path explicit (`A` / first-option through menus, `B` backs out; in gameplay `A` accelerates, `B` decelerates, d-pad steers), confirms `slot2_extra` still looks like intro/credits, and extends `live_race_mid` visually through the checkpoint/post-stop sequence plus the late police/third-radar-marker event. That continuity is now backed by a preserved `43.86s` local video plus extracted stills for the opening live-race frame, curved/open-road continuity, checkpoint `STOP` sign, gas-station/post exterior, the black transition/fade, and a late resumed-driving frame with the extra colored radar marker. Lane 3 is therefore no longer blocked on “find any producer path”; it is blocked on exact emitter semantics inside that narrowed cluster plus a practical human-visual/export workflow while the backend replicate path remains unstable. |
| Lane 4: Bank API contracts (30/10/11) | queued | baseline hypotheses documented, contracts not yet proven |

## Lane 3 Live Entry Update (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_gameplay_entry_route.md`
- New tooling:
  - `tools/run_lane3_gameplay_entry.py`
  - `tools/search_boot_probe_matches.py`
- Closed practical read:
  - the user-guided `A`-through-menus route is now promoted as a real
    gameplay-entry lane from power-on
  - the launcher fixes the route as:
    - menu pulses:
      `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
    - gameplay-relative zero:
      frame `2050`
- Closed negative result:
  - a `17000`-frame run using that route plus gameplay-only `A` hold stays in
    the live gameplay family but does not recreate the preserved
    `live_race_mid` substate exactly
  - absolute frame `16655` keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
  - the preserved manual seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
  - the exact-field search over `15000..16999` never improves beyond a tied
    `129/228` slot match, so exact savestate recreation is not the right
    success gate for this route
- Practical implication:
  - this route is now the best current base for live gameplay probing,
    gameplay-relative input programs, and later live capture/debug loops
- next leverage should go into selector parameterization
    (cars / tracks / opponent branch), not into forcing one exact match to
    `live_race_mid`

## Lane 3 Gameplay Asset Focus (`2026-03-28`)

- New tooling:
  - `tools/build_gameplay_asset_report.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_race_asset_focus.md`
- New generated artifacts:
  - `tools/out/lane3_live_race_mid_asset_focus.json`
  - `tools/out/lane3_live_race_mid_asset_focus.md`
- Closed practical read:
  - lane 3 now has a gameplay-first asset inventory built from the confirmed
    `live_race_mid` seed instead of only separate layer and producer notes
  - the promoted split is now explicit and traceable:
    - `BG1` = cockpit / dashboard / HUD base
    - `BG2` = road / horizon / world raster
    - `OBJ` = traffic, radar markers, police, and other dynamic actors
    - `BG3` = transient top-strip / split-phase auxiliary layer
  - the report also closes the first behavior-facing watchlist:
    - steering / curvature:
      `$22/$23`, `dp_0020/0022`, `BG2HOFS/BG2VOFS`, `next_irq_ptr`,
      `01:9185 -> 02:9165 -> 02:B18D`, `02:B134`, `02:B101 -> L012D5A`
    - traffic / police / radar:
      `state_11f3`, `oam_0730`, `state_09a2`, `state_09a8`, `dp_0053/0054`,
      later OAM DMA
- Practical implication:
  - gameplay probes can now be widened against named visible buckets instead
    of tracing whole-frame deltas blindly
  - this is the gameplay-side equivalent of the earlier lane-2 asset-first
    gain that helped disambiguate car extraction

## Lane 3 Live Entry Phase Split (`2026-03-28`)

- New tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_phase_split_3250_3550.md`
- New generated artifacts:
  - `tools/out/lane3_live_entry_late_probe_v1/td2_boot_probe.json`
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.json`
  - `tools/out/lane3_live_entry_frame03250_vs_03550_compare.md`
- Closed practical read:
  - the promoted power-on live-entry route now has its first late gameplay
    phase split packaged as self-contained artifacts, not only as raw frame
    dumps
  - both anchors keep the same top-level gameplay callback family:
    `02:9016 / 01:96A0 / 02:8F3C`
  - frame `3250` is still open-road driving, while frame `3550` is already a
    shattered-windshield collision overlay with `Cars Left: 4`
  - the strongest machine read now matches that visual split:
    - `BG2` tilemap stats stay identical across the pair
    - `BG1` tilemap stats change sharply
    - `OBJ` workload also changes sharply
    - `BG2` scroll operands still move, so the road/world layer stays live
      under the later overlay
- Practical implication:
  - lane 3 can now do asset-first phase comparisons from the reproducible
    live-entry route itself, not only from preserved manual seeds
  - the next best gameplay pair is now a checkpoint/post-stop or
    police/radar-oriented phase, not another blind whole-frame diff

## Lane 3 Traffic Emergence Pair (`2026-03-28`)

- New note:
  - `rom_analysis/maps/tracks/track1_live_entry_brake_traffic_pair_3250_3400.md`
- Updated tooling:
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
- New generated artifacts:
  - `tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
  - `tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
  - `tools/out/lane3_live_entry_brake_probe_v1/td2_boot_probe.json`
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json`
  - `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`
- Closed practical read:
  - the first bounded post-collision follow-up does **not** yet recover the
    manual checkpoint/post-stop or police/radar flow from the live-entry lane
  - the steering-heavy `wiggle` attempt still crashes early
  - a bounded braking variant delays that failure and promotes a better event
    pair first:
    - frame `3250` keeps the road/signage surface without the red traffic car
    - frame `3400` introduces the red traffic car while preserving the same
      background stack
  - the promoted split is now cleaner than the earlier collision pair:
    - `BG1`, `BG2`, `BG3`, and the sampled `BG2` layer state all stay
      identical
    - only `OBJ` workload changes materially (`37 -> 41` visible sprites,
      `1138 -> 2117` drawn pixels)
  - matching probe rows now also narrow the dynamic side of that event:
    - `state_11f3`: `179 -> 208`
    - `oam_0730`: `4627 -> 4628`
    - `state_09a2`: `43 -> 47`
    - `dp_0053/0054`: `16 -> 224`
    - `dp_0022`: `22 -> 6`
- Practical implication:
  - the best current live-entry target is now traffic emergence as an
    `OBJ`-side event, not more whole-frame collision review
  - bundle builders now also emit designer-facing `PNG` previews beside the
    original `PPM` files, so labeling can happen directly on the promoted
    artifacts

## Lane 3 World-Support Follow-Up (`2026-03-28`)

- Updated tooling:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_gameplay_frame_bundle.py`
  - `tools/build_gameplay_bundle_compare.py`
  - `port/src/td2_ppu.c`
- Updated generated artifacts:
  - `tools/out/lane3_live_entry_frame03250_bundle/`
  - `tools/out/lane3_live_entry_frame03550_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
  - `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- Closed practical read:
  - designer review confirmed the earlier gameplay bundles were already good
    for `BG1` cockpit content and `OBJ` sprites, but still poor for visible
    road/background review
  - the raw renderer bug was real:
    gameplay `BG2` uses `largeTiles = true`, and the older layer renderer was
    still stepping that tilemap as if it were `8x8`
  - the renderer now respects `16x16` tile geometry in both the Python tool
    path and the SDL runtime path
  - even with that fix, gameplay `BG2` remains a static-state approximation
    because one end-frame `ppu_state.json` still does not capture the
    per-scanline presentation shaping the visible world/road plane
  - the promoted answer for human review is now explicit inside each gameplay
    bundle:
    - `world_visible_support.png` for exact screenshot-derived road/background
    - `bg_stack_visible_support.png` for exact screenshot-derived background
      stack without `OBJ`
    - `bg2.png` retained as the corrected state/VRAM-facing render
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_gameplay_frame_bundle.py tools/build_gameplay_bundle_compare.py`
  - `make -C port`
  - rebuild of the promoted `3250/3550` and `3250/3400` gameplay bundles
  - rebuild of the associated compare reports
- Practical implication:
  - the designer-facing gameplay packs are now useful for road/background
    labeling without hiding the remaining raster limitation
  - lane 3 can now continue with `OBJ` ownership on the traffic pair while
    deferring scanline-aware world reconstruction until it is actually needed

## Lane 3 Native Visible-Layer Extraction (`2026-03-28`)

- Updated tooling:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/build_gameplay_frame_bundle.py`
- New note:
  - `rom_analysis/maps/tracks/track1_live_race_native_visible_layers.md`
- New generated artifacts:
  - `tools/out/mesen_lane3_live_race_mid_native/`
  - `tools/out/lane3_live_race_mid_native_bundle/`
- Closed practical read:
  - the gameplay-native blocker is now narrowed materially
  - `mesen_ppu_extract` can load a preserved savestate directly via
    `--load-state` and treat `--frame` as a relative offset via
    `--frame-is-offset`
  - on the promoted `lane3_live_race_mid.mss` seed, the native extractor now
    provides exact separable gameplay surfaces that were previously missing
    from the bundle pipeline:
    - `bg2_visible` closes the road/pista layer
    - `bg3_visible` closes the scenery/horizon layer
    - `sprites_screen` closes the dynamic actor/traffic/police side
  - the remaining boundary is no longer “BG2/BG3 are absent”; it is the final
    composed export:
    `main_visible` and `sub_visible` are still black on this gameplay seed
- Practical implication:
  - gameplay review can now prefer savestate-backed native visible layers
    instead of leaning on screenshot-derived world-support surfaces whenever a
    preserved seed exists
  - `build_gameplay_frame_bundle.py --native-frame-dir ...` now promotes those
    native visible layers into the same gameplay bundle as the older
    state-facing renders

## Docs Wiki And SDL Smoke (`2026-03-28`)

- New tooling:
  - `tools/build_docs_wiki_report.py`
- New curation manifest:
  - `rom_analysis/docs/wiki_doc_index.json`
- New note:
  - `rom_analysis/docs/port_sdl_runtime_mimetization_smoke.md`
- New generated HTML artifact:
  - `tools/out/docs_wiki/index.html`
- Closed practical read:
  - the repo now has a simple wiki-style HTML surface that indexes the current
    markdown corpus by scene family instead of one flat list
  - the top-level split is now explicit:
    - `Source Of Truth`
    - `Attract And Intro`
    - `Front-End And Menu`
    - `Gameplay And Lane 3`
    - `Runtime And Port Validation`
  - this is the promoted answer to the current “do not pollute gameplay with
    menu/front-end material” requirement
  - from this checkpoint forward, relevant doc/artifact changes are expected
    to refresh the wiki through the promoted tooling path:
    `make -C tools docs-wiki`
- Validation:
  - `python3 -m py_compile tools/build_docs_wiki_report.py`
  - `python3 tools/build_docs_wiki_report.py --manifest rom_analysis/docs/wiki_doc_index.json --output-dir tools/out/docs_wiki`
  - local HTML link check over the generated site: `0` missing links
  - `make -C port`
  - `./port/test_regression.sh`
- Follow-up fix:
  - the wiki renderer now parses pipe-table separator rows correctly, so docs
    with Markdown tables no longer fall back to raw `| ... |` paragraph text
  - the wiki theme now also keeps code blocks and inline code on a white,
    high-contrast surface instead of the earlier dark code panel, which was
    making some generated pages hard to read
  - the wiki now also surfaces a per-document `Last updated` label on both
    index cards and rendered pages, sourced from the underlying Markdown
    file timestamp so recent updates are visible in the HTML surface itself
  - the `Attract And Intro` section on the index page now also exposes a
    `Latest` block and sorts its cards by most recent update first, so the
    current intro-facing read is visible without scanning the older notes
  - the index page now also exposes a global `Latest Articles` block with
    explicit `Rendered` and `Raw` links, so the newest docs stay visible at
    the top without hiding the section-level cards underneath
- SDL smoke read:
  - the current runtime renders the bridge-visible intro sequence through
    frame `1000`
  - exact golden parity holds at checkpoints `978`, `982`, `986`, and `990`
  - the first measured gap in that smoke is `mode7_visible_991` with only
    `4` mismatched pixels (`0.006975%`)
  - `mode7_hold_transition` passes seamlessly
- Practical implication:
  - current SDL/runtime parity is already strong enough to use as a real
    intro/front-end mimic and regression surface
  - gameplay parity is still not claimed by this smoke; the gameplay lane
    remains probe/capture-driven

## Lane 1 `B1F9` Stall Update (`2026-03-28`)

- New tooling:
  - `tools/build_b1f9_stage_report.py`
- New note:
  - `rom_analysis/docs/bank30_b1f9_forced_lane_stall.md`
- New generated artifacts:
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md`
- Closed practical read:
  - the forced `01:9568` / `01:95AD` lanes still reach `01:B1F9` once at
    frame `1201`, but all `L001210` hits in those same scenarios occur before
    that entry
  - post-entry `L001210` hit count is `0` in both forced lanes
  - `B1F9` stage counters also stay flat in both forced lanes:
    - `B226 = 0`
    - `B256 = 0`
    - `B273 = 0`
    - `B59B = 0`
  - both lanes stay pinned through frame `2199` with:
    - `state_1D10 = 0x4100`
    - `state_09A8 = 2`
    - `state_0960 = 0`
    - lane-specific `active_main = 01:9568 / 01:95AD`
  - static `bank1.asm` cross-check now closes why this matters:
    - the unresolved `EE7F`-relevant dynamic index select lives only in the
      `L00B1F9` prologue before the first `L00A9A0` call
    - the later `L00B6A3/L00B6E3` surface is a separate worker loop, not a
      second table-select/decompress phase
- Practical implication:
  - direct headless `B1F9` forcing is now a low-yield lane for `EE7F`
  - the active unresolved queue remains `EE7F` / `DA96`, but the next useful
    proving move should come from a real menu/live path or a different caller
    family, not more widening of the same forced lane

## Execution Reset (2026-03-19)

- The port plan now treats maintainability cleanup as a first-class execution
  track alongside the active archaeology lanes.
- The first cleanup slice is repo hygiene and portability:
  - fix ignore policy
  - untrack generated `mesen_ppu_extract` build output
  - untrack mutable `.mesen-config/Mesen2/LuaScriptData` output
  - remove hard-coded personal Mesen paths from promoted scripts and Makefiles
- The autonomous checkpoint loop is now stricter:
  - only ask the user for next-action guidance on urgent or extreme problems
  - otherwise close substantive work through validation, docs, commit/push,
    and a published dev.to update
- The first renderer-correctness cleanup checkpoint now exists:
  - the mirrored non-square OBJ regression is covered by a generated 16x32
    vertical-flip fixture that validates Python simple, Python `mode7-ppu`,
    and SDL runtime paths against one golden PPM
- Repo garbage cleanup is now an explicit maintained tool target instead of an
  ad hoc manual sweep.
- This refocus does not replace the lane order; it is intended to unblock the
  current intro/bootstrap push and make later port work less fragile.

## Completed Checkpoints

### CP-12: Experimental Mesen lab backend MVP pass

- Added an off-plan backend runner in the local `Mesen2` tree:
  - `UI/Utilities/LabRunner.cs`
- Added repo-side launcher:
  - `validation/run_mesen_lab_backend.sh`
- Added architecture note:
  - `rom_analysis/docs/mesen_instrumented_backend_architecture.md`

Current state:

- source-mapped architecture and CLI plan are documented
- the first SNES-only vertical slice exists in code
- savestate probing verifies `.mesen-config/Mesen2/SaveStates/game_11.mss`
  starts at frame `18030`
- the first exact-range runtime test exposed a real frame-boundary mismatch in
  the debugger-stepping contract (`expected 18031, got 18030`)
- the follow-up stepping correction is implemented in source but not yet
  revalidated end-to-end in this repo turn due local build instability/noise in
  the `Mesen2` incremental compile path

### CP-01: Bank30 decode support baseline

- Added `67FB` decode support in `tools/decompress_td2_chunk.py`.
- Added candidate validation tool:
  - `tools/validate_td2_chunks.py`
- Evidence:
  - `tools/out/bank30_chunk_validation.json`
  - `rom_analysis/docs/bank30_decompression_report.md`

### CP-02: Runtime dispatcher trace for `L001210`

- Added trace path in `validation/mesen_probe_boot.lua` for entry-time
  `$0C/$0E/$10` capture.
- Added summarizer:
  - `tools/summarize_l001210_trace.py`
- Evidence:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/td2_boot_probe_l001210_summary.json`

### CP-03: Consolidated unresolved queue registry

- Added registry builder:
  - `tools/build_bank30_chunk_registry.py`
- Added make targets in `tools/Makefile`:
  - `bank30-headers`, `bank30-validate`, `l001210-probe`,
    `l001210-probe-matrix`, `l001210-trace-summary`, `bank30-registry`
- Evidence:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`

Current active unresolved queue (from registry):

- `P0`: `1E:EE7F` (`26FB`, table-confirmed unseen at runtime)
- `P1`: `1E:DA96` (`67FB`, overlap-window unseen at runtime)

Closed non-runtime candidates (from the tightened registry):

- `done`: `1E:E91F` (`67FB`, nested-invalid-marker inside successful `1E:DA96/1E:E800` windows)
- `done`: `1E:9681` (`42FB`, sentinel-control zero-output record)

### CP-04: Design-team asset handoff proof

- Added design-pack tools:
  - `tools/build_mesen_design_pack.py`
  - `tools/build_mesen_design_pack_range.py`
- Proof bundles created:
  - `port/assets/test_dump_frame300`
  - `port/assets/test_dump_range_1086_1093`
- Workbench doc:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

### CP-06: Validation gates and state contracts

- Added pixel-gate runner:
  - `tools/check_regression_gates.py`
- Added callback contract runner:
  - `tools/validate_callback_contracts.py`
- Added contracts:
  - `validation/regression_gates_intro.jsonc`
  - `rom_analysis/docs/callback_state_contracts.jsonc`
- Added gate usage doc:
  - `rom_analysis/docs/validation_gates.md`

### CP-05: Deterministic `L001210` probe matrix harness

- Extended boot probe input controls:
  - `TD2_BOOT_PROBE_INPUT_END_FRAME`
  - `TD2_BOOT_PROBE_INPUT_WINDOWS` (`start-end:buttons;frame:buttons`)
- Added scenario runner:
  - `tools/run_l001210_probe_matrix.py`
- Added make target:
  - `make -C tools l001210-probe-matrix`
- Evidence:
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v1/matrix_summary.md`

Matrix v1 outcome (`1500` frames, `4` scenarios):

- no `1E:E91F` hits
- no `1E:EE7F` hits
- no `1E:DA96` hits
- no `1E:9681` hits
- `1E:DF6C/E039/E73F/E800` still appear in the expected attract-window runs
- periodic `start` pulses can suppress bank30 usage entirely for that window (`0` bank30 hits)

### CP-07: First tilemap-to-ROM provenance window (`1086..1093`)

- Added provenance builder:
  - `tools/build_tilemap_chunk_provenance.py`
- Added bank-13 validation lane for runtime source enrichment:
  - `tools/out/bank13_headers.json`
  - `tools/out/bank13_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1086_1093_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` is the active main-screen tile layer for all frames `1086..1093`.
- `chrBaseWords = 0x2000`.
- Runtime chunk anchor: `0D:C4DC` (`26FB`, decoded size `4000` bytes).
- Evidence confidence by frame:
  - `1088`: direct runtime hit
  - `1089..1093`: carry-over from the same hit
  - `1086..1087`: nearest-forward assignment to frame `1088` (lower confidence)

### CP-08: Extended `L001210` unresolved-candidate sweep (`matrix v3`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - added per-hit selectors: `$1C78`, `$1C80`, `$1CA8`, `$1CAC`, `$1CAE`
- Ran custom matrix v3:
  - `tools/out/l001210_probe_matrix_v3_scenarios.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v3/matrix_summary.md`

Matrix v3 outcome (`7` scenarios, `45000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- confirmed bank30 sources only:
  - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800` (`7` hits each aggregate)
- strongest positive scenario:
  - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
- strongest suppression scenario:
  - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits

### CP-09: Timed pulse sweep for attract-transition windows (`matrix v5`)

- Ran timed pulse matrix:
  - `tools/out/l001210_probe_matrix_v5_scenarios.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v5/matrix_summary.md`
- Scenario set (`12` runs, `4000` frames each):
  - `start` pulse at frames `240/600/900/1200/1500/1800/2100/2400`
  - `start,b` pulse at frames `1200/1500/1800/2100`

Matrix v5 outcome (`48000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- strongest positive scenarios:
  - `pulse_start_240` and `pulse_start_600`: `36` total hits, `8` bank30 hits
- strongest suppression scenarios:
  - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
- `start,b` single-frame pulses mirrored `start`-only outcomes at matching frames.
- caller coverage remained limited to:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - no hits observed from `01:B256`, `01:B273`, `01:B59B`

### CP-10: `L00A9*` index telemetry on `L001210` caller sites (`matrix v6`)

- Extended trace payload in `validation/mesen_probe_boot.lua`:
  - per-hit caller CPU regs (`A/X/Y/PC/SP/PS/D/DBR/K`)
  - derived `L00A9A0/L00A9CB` table index + expected source pointer
  - per-hit `caller_l00a9_source_matches`
- Ran compact verification matrix:
  - `tools/out/l001210_probe_matrix_v6_scenarios.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v6/matrix_summary.md`

Matrix v6 outcome (`3` scenarios, `12000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- `L00A9` source derivation consistency:
  - `58/58` `L00A9A0/L00A9CB` hits had `caller_l00a9_source_matches = true`
- observed `L00A9*` indices:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- observed bank30-producing indices:
  - `28` and `29` only (both `L00A9A0` and `L00A9CB`)
- no observed index `32` (`0x20`, `1E:EE7F`)

### CP-11: Forced `L00B1F9` selector branch tests (`matrix v7`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - frame-window selector forcing:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_1C78`
    - `TD2_BOOT_PROBE_FORCE_1C80`
    - `TD2_BOOT_PROBE_FORCE_1CA8`
    - `TD2_BOOT_PROBE_FORCE_1CAC`
    - `TD2_BOOT_PROBE_FORCE_1CAE`
  - optional exec-point re-apply at dynamic index path:
    - `TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1`
- Extended matrix runner scenario env support:
  - `tools/run_l001210_probe_matrix.py` now accepts `extra_env` per scenario
- Ran forced matrix:
  - `tools/out/l001210_probe_matrix_v7_force_index32_scenarios.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v7_force_index32/matrix_summary.md`

Matrix v7 outcome (`5` scenarios, `20000` total frames):

- forced selector state confirmed on bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- observed `L00A9*` indices unchanged:
  - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
- no observed index `32` (`0x20`, `EE7F`) despite forced branch condition
- caller coverage still excludes:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-12: Caller-family activation around the `01:BE43` window (`matrix v10a/v10b`)

- Ran directional-hold matrix:
  - `tools/out/l001210_probe_matrix_v10a_be43_directional_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10a_be43_directional/matrix_summary.md`
- Ran button-map pulse matrix:
  - `tools/out/l001210_probe_matrix_v10b_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v10b_buttonmap/matrix_summary.md`

Matrix v10 outcome (`16` scenarios, `117000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- caller-family expansion reached non-`L00A9*` callsites:
  - `01:8E3C`, `01:8E59`
- observed `L00A9*` index set expanded to include:
  - `7`, `8`, `9`, `10`, `11`, `22`, `25`
- bank30-producing indices remained:
  - `28` and `29` only
- target caller set remained unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-13: Extended `01:9016` sequence stress (`matrix v11/v11b`)

- Ran pulse-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11_9016_buttonmap/matrix_summary.md`
- Ran hold-follow-up matrix:
  - `tools/out/l001210_probe_matrix_v11b_9016_holds_scenarios.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v11b_9016_holds/matrix_summary.md`

Matrix v11 outcome (`16` scenarios, `200000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- per-scenario bank30 profile remained fixed:
  - `12` bank30 hits per scenario (`DF6C/E039/E73F/E800`, `3` each)
- bank30 selector tuple remained stable across all bank30 hits:
  - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` hits)
- target caller set still unseen:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-14: `L00B1F9` precondition forcing audit (`matrix v12/v12b`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - additional forced-state knobs:
    - `TD2_BOOT_PROBE_FORCE_1C86`
    - `TD2_BOOT_PROBE_FORCE_1D10`
  - explicit `01:B1F9` exec telemetry:
    - `b1f9_exec_count`
    - `b1f9_exec_frames`
  - per-hit trace additions:
    - `selector_1c86`
    - `state_1d10`
- Ran precondition matrix:
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12_b1f9_preconditions/matrix_summary.md`
- Ran explicit `B1F9` exec-check matrix:
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck_scenarios.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v12b_b1f9_execcheck/matrix_summary.md`

Matrix v12/v12b outcome (`8` scenarios, `72000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- no caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`
- `B1F9` execution remained absent in this lane:
  - `b1f9_exec_count = 0` in all `v12b` scenarios
- forcing selector/precondition state changed captured state as intended but did not
  alter runtime caller-family coverage.

### CP-15: Forced callback activation into `01:9568/01:95AD` (`matrix v13`)

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - main-callback forcing window:
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR`
    - `TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK`
- Extended matrix runner env cleanup support:
  - `tools/run_l001210_probe_matrix.py` now clears the callback-forcing env keys
    between scenarios.
- Ran callback activation matrix:
  - `tools/out/l001210_probe_matrix_v13_callback_activation_scenarios.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v13_callback_activation/matrix_summary.md`

Matrix v13 outcome (`5` scenarios, `16000` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback-only scenarios (`01:9568`/`01:95AD`) reduced total trace activity:
  - `6` total hits each, `0` bank30 hits each
- callback + state-forced scenarios reached `B1F9` once:
  - `b1f9_exec_count = 1` at frame `1201` (`01:9568` and `01:95AD` variants)
- despite a `B1F9` entry, no `L001210` calls were observed from:
  - `01:B256`, `01:B273`, `01:B59B`
- combined `v13` caller coverage remained:
  - `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`

### CP-16: `B1F9` internal stage telemetry (`matrix v14`)

- Extended probe telemetry in `validation/mesen_probe_boot.lua`:
  - top-level `B1F9` stage counters:
    - `b1f9_stage_counts` (`b226`, `b256`, `b273`, `b59b`)
    - `b1f9_stage_frames`
  - stage exec callbacks:
    - `01:B226`
    - `01:B256`
    - `01:B273`
    - `01:B59B`
- Ran stage-trace matrix:
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_scenarios.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.json`
  - `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/matrix_summary.md`

Matrix v14 outcome (`3` scenarios, `6600` total frames):

- unresolved candidates still `0` hits:
  - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
- forced callback+state scenarios still showed:
  - `b1f9_exec_count = 1`
- but `B1F9` internal stage counters remained zero:
  - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
- no `L001210` caller hits from:
  - `01:B256`, `01:B273`, `01:B59B`

### CP-17: `B1F9` prologue exec-point trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_EXEC_POINTS`
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS`
  - top-level `exec_point_trace` bundle in `td2_boot_probe.json`
- Ran targeted forced-callback probes with explicit watchpoints:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`
- Watch list:
  - `00:050F`
  - `00:083F`
  - `01:B1F9`
  - `01:B202`
  - `01:B206`
  - `01:B226`
  - `01:B256`
  - `01:B273`
  - `01:B59B`

Exec-trace outcome (`2` scenarios, `2200` frames each):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- headless exec-point trace recorded only the entry point:
  - `01:B1F9`
- no exec hits were observed at:
  - `00:050F`, `00:083F`
  - `01:B202`, `01:B206`
  - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
- shared `B1F9` entry snapshot across both lanes:
  - `$1C80/$1CA8 = 0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
  - `$0960 = 0`
- lane-specific difference at entry:
  - forced `01:9568` shows `$0F77 = 1`
  - forced `01:95AD` shows `$0F77 = 0`
- note:
  - this first prologue bundle was captured before exec-point traces honored
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`; the
    corrected late-window read is recorded in `CP-20`
- practical reading:
  - the headless runner now proves the `B1F9` entry context, but still does not
    expose post-entry helper/return flow through pure exec watchpoints.

### CP-18: `B1F9` prologue side-effect trace

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_TRACE_WRITE_POINTS`
  - `TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS`
  - top-level `write_point_trace` bundle in `td2_boot_probe.json`
- Ran bounded forced-callback write-trace probes:
  - `tools/out/b1f9_sideeffect_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_sideeffect_trace_95ad/td2_boot_probe.json`
- Traced write points:
  - `00:420C` (`HDMAEN`)
  - `00:2106` (`MOSAIC`)
  - `00:2105` (`BGMODE`)
  - `00:2107/2108/2109` (`BG1SC/BG2SC/BG3SC`)
  - `00:210B` (`BG12NBA`)
  - `00:2101` (`OBJSEL`)
  - `00:212C` (`TMAIN`)
  - `00:2131/2130` (`CGADSUB/CGWSEL`)
  - `00:212E/212D/212F` (`TMW/TSUB/TSW`)
  - `00:2123/2124/2125` (`W12SEL/W34SEL/WOBJSEL`)
  - `7E:0966`
  - `7E:0968`
  - `7E:0974`
  - `00:0F42`

Write-trace outcome (`2` scenarios, `2200` frames each, trace window `1200..1202`):

- both forced callback+state lanes still reached `01:B1F9` exactly once:
  - frame `1201`
- both lanes recorded:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- no traced writes were observed for:
  - `L0004DF`-style side effects (`HDMAEN`, `$0966/$0968`)
  - `L00050F/L00052E` reset writes (`$0974`, `CGADSUB/CGWSEL/TMW/TSUB/TSW`, window registers, `MOSAIC`, `SETINI`)
  - `L00083F` setup writes (`BGMODE`, `BG1SC/BG2SC/BG3SC`, `BG12NBA`, `$0F42`)
  - immediate `B1F9` setup writes (`TMAIN`, `OBJSEL`)
- practical reading:
  - in the headless forced lane, the observed `01:B1F9` entry still does not
    produce any of the expected helper/setup side effects in the surrounding
    frame window.

### CP-19: `B1F9` caller stack proof

- Extended exec-point payload in `validation/mesen_probe_boot.lua`:
  - `stack_addr`
  - `stack_bytes`
  - `stack_return_minus_one`
  - `stack_return_rts`
- Re-ran narrow forced-callback entry probes for `01:B1F9`.
- Evidence:
  - `tools/out/b1f9_prologue_trace_9568/td2_boot_probe.json`
  - `tools/out/b1f9_prologue_trace_95ad/td2_boot_probe.json`

Stack outcome:

- forced `01:9568` lane:
  - `stack_return_rts = 0x9575`
  - this matches the post-`jsr L00B1F9` site at `L009575`
- forced `01:95AD` lane:
  - `stack_return_rts = 0x95B7`
  - this matches the post-`jsr L00B1F9` site immediately after the `L0095AD`
    call sequence
- deeper stack word on both lanes:
  - `0x82A0` (`+1 -> 0x82A1`)
  - this matches the bank-0 main-callback dispatcher wrapper that pushes a
    synthetic return before `jmp [$0038]`
- practical reading:
  - the forced entry is a real bank-1 `jsr` into `L00B1F9`, not an artifact of
    the callback pointer override alone
  - the call chain shape is now also consistent with normal NMI callback
    dispatch:
    - bank 0 dispatcher -> `01:9568/01:95AD` -> `01:B1F9`
- the unresolved problem is now narrower:
  - why the real `jsr` path in the headless forced lane still shows no
    downstream helper/setup exec hits or writes

### CP-20: `B1F9` return-window correction and caller-side `1CA8` increment

- Fixed probe behavior in `validation/mesen_probe_boot.lua`:
  - exec-point callbacks now honor
    `TD2_BOOT_PROBE_TRACE_START_FRAME` / `TD2_BOOT_PROBE_TRACE_END_FRAME`
- Updated validation note in `validation/README.md`.
- Ran a corrected late-window forced-callback probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_return_trace_9568/td2_boot_probe.json`

Corrected late-window outcome (`2200` frames, trace window `1200..1202`):

- observed exec points:
  - `00:82A1` at frame `1200`
  - `01:B1F9` at frame `1201`
- no exec hit was observed at:
  - `01:9575`
- frame snapshots for `1200..1201` still show the forced pre-call state:
  - `$1C78/$1C80/$1CA8 = 1/0/2`
  - `$1C86 = 1`
  - `$1D10 = 0x4100`
- but the corrected `01:B1F9` exec snapshot records:
  - `$1CA8 = 3`
  - `stack_return_rts = 0x9575`
- static caller read now explains that delta:
  - `L009568` does `inc $1CA8` before `jsr L00B1F9`
  - `L0095AD` does the same
- static `L00B1F9` read also explains why an immediate `01:9575` hit is not the
  best next proving surface:
  - after entry/setup, the routine can run long internal wait loops at
    `L00B638` / `L00B6E3` before it reaches `L00B755` and returns to the caller
- practical reading:
  - the old “entry sees `$1CA8 = 2`” interpretation was too literal; the forced
    frame state is `2`, but both known callers increment it before the `jsr`
  - the missing immediate `01:9575` hit no longer points to a broken call chain;
    it is consistent with `L00B1F9` doing longer in-routine work before return
  - the next low-thrash lane should target the `L00B638` / `L00B6E3` wait/exit
    conditions or use manual debugger confirmation, not more immediate-return
    watchpoints

### CP-21: Per-point-capped `B1F9` wait/exit surface check

- Extended probe control surface in `validation/mesen_probe_boot.lua`:
  - `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT`
- Added the same env cleanup to `tools/run_l001210_probe_matrix.py`.
- Updated validation note in `validation/README.md`.
- Ran a widened forced-callback wait/exit probe for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_surface_9568/td2_boot_probe.json`

Wait/exit outcome (`2200` frames, trace window `1200..1800`):

- watch list:
  - `01:B1F9`
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- trace budget:
  - `exec_point_max_hits = 16`
  - `exec_point_max_hits_per_point = 1`
- observed exec hits:
  - `01:B1F9` once at frame `1201`
- no exec hits were observed at:
  - `01:B226`
  - `01:B638`
  - `01:B6E3`
  - `01:B755`
  - `01:9575`
- the per-point cap did not hide later hits:
  - `exec_point_trace.dropped_hits = 0`
- practical reading:
  - removing repeat-budget pressure still does not expose any downstream
    `L00B1F9` progress in the headless exec surface
  - this is a stronger negative than the earlier immediate-return probe because
    the window is wide and the trace no longer risks being flooded by loop hits
  - the next useful proving lane should move away from headless exec
    watchpoints and toward manual debugger confirmation or a different state/write
    instrumentation surface around the `L00B638` / `L00B6E3` wait conditions

### CP-22: `B1F9` wait-path WRAM write surface check

- Ran a widened forced-callback WRAM write trace for the `01:9568` lane.
- Evidence:
  - `tools/out/b1f9_wait_wram_9568/td2_boot_probe.json`

Write-surface outcome (`2200` frames, trace window `1200..1800`):

- watched state writes:
  - `7E:0960`
  - `7E:0964`
  - `7E:0200`
  - `7E:0202`
  - `7E:1E2C`
  - `7E:0440`
  - `7E:0442`
  - `7E:0444`
  - `7E:040A`
- observed write hits:
  - none
- trace result:
  - `write_point_trace.hit_count = 0`
  - `write_point_trace.dropped_hits = 0`
- nearby frame snapshots (`1200..1210`) remain flat at:
  - `$0960 = 0`
  - `$0200 = 0`
  - `$0202 = 1`
  - `$1E2C = 0`
  - `$0440/$0442/$0444 = 0/0/0`
  - `$040A = 0x0011`
- practical reading:
  - even a different headless state/write surface around the expected
    `L00B638` / `L00B6E3` wait-path state does not reveal progress beyond the
    known `01:B1F9` entry
  - this is enough evidence to treat the current headless `B1F9` lane as
    low-yield; the remaining useful follow-up is manual debugger work or a shift
    to the next unblocked roadmap lane

### CP-23: Second contiguous tilemap provenance window (`1094..1101`)

- Built a second design-pack range:
  - `tools/out/design_mesen_range_1094_1101_v1/design_pack_range.json`
- Added bank-7 chunk validation metadata:
  - `tools/out/bank7_compression_headers.json`
  - `tools/out/bank7_chunk_validation.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.md`
- Added memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1094..1101`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance advances across the same visible tilemap block:
  - `1094..1095`: carry-over from `0D:C4DC` (`26FB`, bank 13) hit at frame `1088`
  - `1096`: direct runtime hit at `07:BF49` (`42FB`, bank 7)
  - `1097..1100`: carry-over from `07:BF49`
  - `1101`: direct runtime hit at `07:C112` (`26FB`, bank 7)
- Validation metadata now exists for all three anchors:
  - `0D:C4DC`: `output_size = 4000`
  - `07:BF49`: `output_size = 4102`
  - `07:C112`: `output_size = 2832`
- runtime-binding note:
  - this window uses the preserved
    `tools/out/l001210_probe_matrix_v1/periodic_start_pulses_240_1800_l001210_exec.json`
    trace because the original ad hoc `.mesen` runtime trace was overwritten
    later; the preserved trace matches the contiguous `1088/1096/1101` hit
    sequence used for this late-attract block
- practical reading:
  - the visible `bg1` tilemap stays constant while the backing runtime chunk
    source changes underneath it
  - the next useful Lane 2 step is to capture and bind the next contiguous block
    after `1101`, not to keep reworking `1086..1101`

### CP-24: Carry-covered continuation of the late-attract tilemap window (`1102..1117`)

- Built two follow-on design-pack ranges:
  - `tools/out/design_mesen_range_1102_1109_v1/design_pack_range.json`
  - `tools/out/design_mesen_range_1110_1117_v1/design_pack_range.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.md`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.md`
- Extended the memory-map binding:
  - `rom_analysis/docs/memory_map.md`

Window reading:

- `bg1` remains the active main-screen tile layer for all frames `1102..1117`.
- `chrBaseWords` remains `0x2000`.
- The visible tile-index set stays stable:
  - `144` unique indices
  - `22` contiguous ranges
- Runtime chunk provenance stays on the same validated bank-7 source for the full carry-covered block:
  - `1102..1109`: `07:C112` (`26FB`, bank 7), `frame_delta = 1..8`
  - `1110..1117`: `07:C112` (`26FB`, bank 7), `frame_delta = 9..16`
- Validation metadata remains stable for the carry source:
  - `07:C112`: `output_size = 2832`, `consumed_bytes = 2333`
- practical reading:
  - contiguous late-attract tilemap provenance now covers `1086..1117`
  - `1117` is the current headless confidence edge because it exactly exhausts
    the current carry window from the direct `1101` hit, and the preserved
    `periodic_start_pulses_240_1800` trace has no later direct hit after `1101`
  - a scripted-input attempt to open the later direct-hit cluster
    (`6800:start;6900-6920:start,a` -> `7051/7059/7064`) was tried three ways in
    the extractor bridge and failed on the same boundary: once
    `InitializeDebugger` + input overrides were enabled, the Mesen bridge did
    not advance frames
  - per the blocker policy, that extractor lane is now documented and parked;
    the next useful move is either a different bridge surface for a later direct
    runtime hit or a pivot to the next roadmap lane

### CP-25: First deterministic gameplay-seed window (`track1`, frames `86..93`)

- Verified an existing deterministic seed savestate:
  - `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Revalidated the screenshot harness against that seed:
  - `validation/mesen_capture.lua` captures `300` frames after `60` warm-up
    frames with `b` held
  - the first nontrivial screenshot appears at capture index `26`
    (script frame `86`)
- Added a seeded gameplay-range dump lane in `validation/mesen_dump_bg_range.lua`:
  - the dumper now accepts the same simple fixed input window controls used by
    the other validation harnesses
- Captured the first raw gameplay-seed window:
  - `tools/out/track1_seed_0086_0093_v2.json`
  - `tools/out/track1_seed_0086_0093_v2_sequence.txt`
  - `tools/out/track1_seed_0086_0093_v2_sequence.json`
- Added a committed window note:
  - `rom_analysis/maps/tracks/track1_seed_0086_0093.md`

Window reading:

- The flat dump covers frames `86..93` from the seeded run with `b` held during
  script frames `60..359`.
- Frame `86` renders back from `VRAM + CGRAM + PPU state + OAM` with `0`
  mismatched pixels against the screenshot harness image
  `td2_track1_accel_frame_00026.png`.
- Render-side reading for the captured seed window:
  - `bgMode = 1`
  - `mainScreenLayers = 0x04`
- The captured scene is static across the full `86..93` window:
  - `VRAM` diff `0`
  - `CGRAM` diff `0`
  - `OAM` diff `0`
  - rendered BG output unchanged between frames `86` and `93`
- Probe-side callback/state context over the same seeded input window remains
  trivial:
  - `active_main = 00:8029`
  - `active_nmi = 00:8029`
  - tracked `$0202/$0204/$0206/$0208/$020A/$040A/$0054` all stay `0`
- practical reading:
  - `game_11.mss` is a valid deterministic seed for track-start visuals
  - this specific raw `86..93` window is still static under the original
    `b`-hold path
  - the next gameplay follow-up should be a seeded button sweep or a different
    savestate nearer active driving

### CP-26: Seeded gameplay sweep and early raw-bridge blocker (`track1`)

- Extended the gameplay capture path for automation:
  - `validation/mesen_capture.lua` now accepts env-driven capture controls and
    multi-window inputs
  - `validation/mesen_dump_bg_range.lua` now accepts
    `TD2_BG_RANGE_INPUT_WINDOWS`
  - `validation/run_mesen_capture.sh` now creates parent directories for
    capture/bg-range output prefixes
- Added a bounded gameplay sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `make -C tools track1-seed-sweep`
- Added the sweep note:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v1.md`
- Sweep artifacts:
  - `tools/out/track1_seed_sweep_v1/summary.json`
  - `tools/out/track1_seed_sweep_v1/summary.md`

Sweep reading:

- `b_hold` (`60-359:b`) is dynamic:
  - first nontrivial frame `76`
  - first later motion `92`
  - `4` distinct screenshot hashes
- `start_then_b_hold` (`60:start;61-359:b`) remains a static seed:
  - first nontrivial frame `64`
  - no later motion in the bounded `300`-frame run
- `start_then_a_hold` (`60:start;61-359:a`) is also dynamic:
  - first nontrivial frame `61`
  - first later motion `65`
  - `3` distinct screenshot hashes

Targeted raw follow-up:

- Captured the earliest dynamic raw window for `start_then_a_hold`:
  - `tools/out/track1_start_then_a_0061_0068_v1.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.txt`
  - `tools/out/track1_start_then_a_0061_0068_v1_sequence.json`
  - `tools/out/track1_start_then_a_0061_0068_v1_delta_61_65.json`
- Added a screenshot probe of the exact same dumper lane:
  - `tools/out/track1_start_then_a_frame61_probe_v1_frame_00061_frame.png`

Blocker reading:

- the moving-window blocker has changed:
  - movement is now proven at the screenshot level from `game_11.mss`
  - but the early `start_then_a_hold` raw bridge does not align with that
    screenshot sweep
- three narrowing attempts all held the same boundary:
  - raw frame `61` renders as `bgMode = 0`, `mainScreenLayers = 0x00`
  - the dumper screenshot differs from the sweep screenshot for frame `61` by
    `51503` pixels
  - that mismatch stays flat across nearby sweep frames `60..70`
  - raw `VRAM/CGRAM/OAM/PPU` state stays unchanged from frames `61` to `65`
- per the blocker policy, that exact early raw-bridge lane is now documented and
  parked
- next useful gameplay follow-up:
  - use the new screenshot-backed `b_hold` cycle as the next binding target, or
  - replace `game_11.mss` with a later gameplay savestate whose raw dump aligns
    cleanly

### CP-27: Screenshot-backed `b_hold` gameplay cycle (`track1`, frames `76..156`)

- Added a capture-log sequence builder:
  - `tools/build_capture_sequence_manifest.py`
  - `make -C tools track1-b-hold-cycle`
- Added the committed gameplay-cycle note:
  - `rom_analysis/maps/tracks/track1_b_hold_cycle_0076_0156.md`
- Refreshed the sweep source behind that cycle:
  - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
- Built screenshot-backed runtime artifacts:
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.txt`
  - `tools/out/track1_b_hold_cycle_0076_0156_v2_sequence.json`

Cycle reading:

- the selected `b_hold` window covers script frames `76..155`
- collapsed runtime artifact:
  - `5` image entries
  - `4` distinct screenshot states
  - `16` frames per state
- transition frames:
  - `76`, `92`, `108`, `124`, `140`
- cadence read:
  - frame `140` reuses the frame-`76` image
  - the visible track-start motion therefore closes one screenshot-backed
    `64`-frame cycle
- context binding note:
  - the first state still covers the known screenshot-validated frame `86` from
    `track1_seed_0086_0093.md`
  - the screenshot transition at frame `92` is now the next unbound
    `VRAM/CGRAM/OAM/PPU` / probe edge
- initial gameplay contract pointers now referenced in the cycle note:
  - bank 10 external entries from `rom_analysis/code/physics.asm`
  - bank 11 render/IRQ anchors from `rom_analysis/code/render.asm`
- practical reading:
  - gameplay archaeology now has a reusable moving reference artifact even
    while the early raw-bridge mismatch remains parked
  - the next best Lane 3 step is to bind one later cycle state (`92` or `108`)
    back to raw/probe context, or switch to a later gameplay savestate if the
    current seed keeps diverging there

### CP-28: `game_11.mss` screenshot-vs-raw blocker narrowed at `92/108`

- Refreshed the gameplay sweep on the current harness:
  - `tools/out/track1_seed_sweep_v2_current/summary.json`
  - `tools/out/track1_seed_sweep_v2_current/summary.md`
- Archived the seeded probe follow-up:
  - `tools/out/track1_b_hold_probe_0086_0108_v1/td2_boot_probe.json`
- Kept the targeted raw dump artifacts:
  - `tools/out/track1_b_hold_0086_0108_v1.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_86_92.json`
  - `tools/out/track1_b_hold_0086_0108_v1_delta_92_108.json`

Current reading:

- refreshed sweep status:
  - `b_hold`: dynamic (`first_nontrivial = 76`, `first_motion = 92`)
  - `start_then_b_hold`: `static_after_first_nontrivial` (`64`)
  - `start_then_a_hold`: `static_after_first_nontrivial` (`64`)
- raw/probe follow-up on the same `b_hold` seed lane:
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `86 -> 92`
  - raw `VRAM/CGRAM/OAM/PPU` stays identical across `92 -> 108`
  - probe-side callback/state remains flat at `86`, `92`, and `108`:
    - `active_main = active_nmi = 00:8029`
    - tracked `$0200/$0202/$0204/$0206/$0208/$020A/$040A/$0440/$0442/$0444/$1E2C/$0054 = 0`
- failed but informative experiment:
  - a one-off attempt to dump raw state directly from `mesen_capture.lua`
    perturbed the `b_hold` lane into a static post-`86` capture
  - that code path was reverted in the same turn and should not be reused as
    evidence
- practical reading:
  - the blocker is no longer “find a moving gameplay lane”
  - the blocker is now “explain why the screenshot lane moves while raw/probe
    remain static on `game_11.mss`”
  - the next best step is either a later gameplay savestate or deeper debugger
    inspection on this seed

### CP-29: Visible-phase gameplay path bound on `game_11.mss`

- Extended the scanline-step probe so it can load a savestate and replay the
  same seeded input windows used by the gameplay capture harness:
  - `validation/mesen_scanline_step_test.lua`
- Added a repeatable full-sample range runner:
  - `tools/capture_scanline_samples_range.py`
- Captured seeded visible-phase samples for the first `b_hold` cycle states:
  - `tools/out/track1_b_hold_scanline_frame_0086_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v1.json`
- Archived the targeted late-scanline register trace:
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes_summary.json`
- Added the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`

Current reading:

- the screenshot-vs-raw split on `game_11.mss` is now explained as a phase
  split:
  - end-of-frame raw/probe still lands on `00:8029/00:835F` with
    `ppu.mainScreenLayers = 0x04`
  - visible-scanline sampling on frames `86`, `92`, and `108` runs under
    `02:9016` with alternating `01:96A0/01:960D` IRQ behavior and
    `ppu.mainScreenLayers = 0x13/0x17`
- the visible frame also carries real split-style motion that the end-of-frame
  dump misses:
  - `bg2_hscroll` spans `66` values
  - `bg2_vscroll` spans `101` values
  - `bg3_vscroll` toggles between `0x03FF` and `0x0014`
- late-scanline register tracing over frames `86..108` records a stable
  `16`-write pattern every frame:
  - `M7HOFS`, `M7VOFS`, `$210F-$2114`
  - all at scanlines `225..227`
  - no DMA writes, no VRAM writes
- the remaining blocker is now narrower:
  - the sampled visible-phase `PPU`/callback pattern matches across frames
    `86`, `92`, and `108`
  - only `dp_0054` differs (`0x38` at `86`, `0x48` at `92/108`)
  - screenshot transitions at `92` and `108` therefore still need a deeper
    producer-side or sprite/color-math explanation

### CP-30: Bank-1 producer-state follow-up stays flat on the visible gameplay lane

- Extended the scanline-step probe with additional producer-side fields used by
  the bank-1 IRQ path:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v2` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v2.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v2.json`
- Added the bank-1 producer and low-WRAM follow-up to the lane note:
  - `rom_analysis/maps/tracks/track1_b_hold_visible_scanline_0086_0108.md`
- Archived start-of-frame WRAM follow-up:
  - `tools/out/track1_b_hold_wram_frame_0086_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0092_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0108_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json`
- Archived negative exec/write trace:
  - `tools/out/track1_b_hold_execwrite_trace_0086_0108_v1/td2_boot_probe.json`

Current reading:

- the added bank-1 producer-side WRAM fields stay identical across frames
  `86`, `92`, and `108`:
  - `$1396`
  - `$13A4/$13A6/$13A8/$13AA/$13AC/$13AE`
  - `$13B4/$13B6/$13BA`
  - `$1CE6/$1CEB/$1CEC`
  - `$1E1C/$1E1E`
  - `$0F3A`
- visible window and OAM summary fields also stay identical across those same
  three frames
- targeted end-of-frame write/exec tracing against `02:9016`, `01:960D`,
  `01:96A0`, and the corresponding bank-1 producer-side WRAM addresses records
  no hits in the traced `86..108` window
- the low-WRAM queue follow-up is also negative:
  - the archived `td2_boot_probe_startframe_wram.bin` dumps keep the sampled
    `0600` region flat across `86`, `92`, and `108`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json` therefore has
    `0` active parsed queue entries for all three frames
- practical reading:
  - even after widening the visible-phase probe to bank-1 producer-side state,
    sampled `dp_0054` remains the only known field that separates frame `86`
    from frames `92/108`
  - the next best Lane 3 target is to bind that sampled `dp_0054` field to its
    real producer/base before spending more time on bank-1 WRAM mirrors

### CP-31: Visible-phase `dp_0054` is a real `7E:0054` WRAM field

- Extended the scanline-step probe with direct-page-base and explicit WRAM
  mirror samples:
  - `validation/mesen_scanline_step_test.lua`
- Captured refreshed `v3/v4` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v4.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v4.json`
- Archived the low-page/WRAM write-trace follow-up:
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`

Current reading:

- `v3` rules out a hidden direct-page-base explanation:
  - `cpu.d = 0` on all sampled scanlines for frames `86`, `92`, and `108`
  - the effective direct-page address therefore stays fixed at `0x0054`
- `v4` binds the sampled value to real WRAM during the visible phase:
  - visible `00:0054..0056` matches `7E:0054..0056` exactly
  - frame `86` carries `7E:0054..0056 = 0x38/0x90/0x15`
  - frames `92` and `108` carry `7E:0054..0056 = 0x48/0x90/0x15`
  - only `7E:0054` changes across those three frames
- the end-of-frame write-trace lane remains a negative-but-useful result:
  - tracked writes hit only late `00:0055 = 0x84` and `00:0056 = 0x17`
    once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0054..0056`
  - end-of-frame frame snapshots at `86/92/108` still read `dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the remaining gameplay discriminator is now bound to visible-phase
    `7E:0054`, not an ambiguous low-page alias
  - the next best Lane 3 target is to trace the producer/reset path that takes
    visible-phase `7E:0054` from `0x38 -> 0x48 -> 0x00`

### CP-32: Visible-phase `7E:0053/0054` is a drained queue cursor pair

- Extended the scanline-step probe with explicit queue-cursor and parsed
  `0600` descriptor summary samples:
  - `validation/mesen_scanline_step_test.lua`
- Added a queue-summary helper:
  - `tools/summarize_scanline_dma_queue.py`
- Captured refreshed `v5` scanline samples:
  - `tools/out/track1_b_hold_scanline_frame_0086_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v5.json`
  - `tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json`
- Archived the queue-cursor follow-up trace:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe_trace_summary.json`

Current reading:

- visible-phase `v5` samples now bind the queue cursor pair directly:
  - frame `86`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x38`
  - frames `92` and `108`: `00:0053 = 00:0054 = 7E:0053 = 7E:0054 = 0x48`
  - all three frames keep `7E:0055/0056 = 0x90/0x15`
- the sampled visible queue window is drained, not growing:
  - `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines for
    frames `86`, `92`, and `108`
  - `queue_dma_nonzero_entry_count = 32`, so the `0600` ring still contains
    stale descriptor content outside the active read/write window
- the end-of-frame cursor trace remains negative-but-useful:
  - tracked writes still hit only late `00:0053 = 0`, `00:0055 = 0x84`, and
    `00:0056 = 0x17` once per frame at scanline `227`
  - no writes were observed at `00:0054` or `7E:0053/0054`
  - end-of-frame snapshots at `86/92/108` still read `dp_0053 = dp_0054 = 0`
    under `active_main = 00:8029`
- practical reading:
  - the old “mystery `7E:0054`” read is now too vague; the sampled gameplay
    discriminator is the visible-phase queue cursor pair `7E:0053/0054`
  - the next best Lane 3 target is to trace the bank-0 cursor advance/reset
    path that takes visible `0x38/0x38` or `0x48/0x48` back to `0x00/0x00`

### CP-33: Late gameplay cursor reset splits into two sampled phases

- Extended the scanline-step range wrapper with optional exec/write trace-point
  pass-through:
  - `validation/mesen_scanline_step_test.lua`
  - `tools/capture_scanline_samples_range.py`
- Archived the mirrored-bank boot-probe rerun:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
- Captured the widened scanline-local late-phase trace:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`

Current reading:

- the mirrored-bank boot-probe rerun closes one simple ambiguity:
  - tracing `80:01AB/021E/04DF/06ED/0715/0798/1A70`, `81:8A7F`, and
    `82:08B2/09CD` still records `exec_hit_count = 0`
  - the old negative exec result was therefore not just a `00:` vs `80:`
    bank-mirror mistake
- the scanline-local trace adds a new late boundary on frame `86`:
  - `224`-sample trace (`v1`) records no exec or write hits through the visible
    phase
  - `260`-sample trace (`v2`) still records no exec-point hits, but it does
    catch a write trio at frame `87`, scanline `228`:
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
    - `00:0053 = 0x38`
  - at that same late point, `00:0054` still reads `0x38` and
    `active_main = 02:9016`
  - sampled scanlines `223`, `224`, `227`, and `259` all still carry
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- practical reading:
  - the late gameplay reset is now split into at least two sampled phases:
    - an intermediate post-visible stage still under `02:9016` that preserves
      the visible cursor/budget tuple
    - a later end-of-frame stage under `00:8029` that collapses to
      `00:0053/0055/0056 = 0x00/0x84/0x17`
  - the next best Lane 3 target is to extend the scanline-local trace farther
    until that `02:9016 -> 00:8029` handoff is observed directly

### CP-34: Frame-boundary sampling keeps frame `87` on the visible gameplay path

- Extended the scanline-step probe with explicit frame-boundary snapshots:
  - `validation/mesen_scanline_step_test.lua`
- Passed the new `frame_events` payload through the range wrapper:
  - `tools/capture_scanline_samples_range.py`
- Captured the boundary-aware late-phase reruns:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`

Current reading:

- `v3` (`260` samples) now records explicit frame-boundary snapshots:
  - frame `86 start` at scanline `0`
  - frame `86 end` at scanline `225`
  - both still read `active_main = 02:9016` and
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- `v4` (`360` samples) extends past the scanline wrap:
  - frame `87 start` at scanline `0` still reads the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the sampled scanline stream wraps at sample `262`
    (`scanline 261 -> 0`) and still does not leave `02:9016`
  - the last sampled point is frame `87`, scanline `97`, still with
    `02:9016` and `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the only traced late writes in that widened window remain:
  - frame `87`, scanline `228`
  - `00:0053 = 0x38`
  - `00:0055 = 0x90`
  - `00:0056 = 0x15`
- practical reading:
  - the visible gameplay path now survives across frame `86 end`, frame `87`
    start, and at least through frame `87`, scanline `97`
  - the remaining `02:9016 -> 00:8029` handoff is therefore later than that
    boundary
  - the next best Lane 3 target is to extend the same bounded trace through the
    rest of frame `87` and into frame `88`

### CP-35: The same late `02:9016` stage survives into frame `89`

- Captured wider boundary-aware late-phase traces:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`

Current reading:

- `v5` (`target_frame = 86`, `620` samples) now records:
  - frame `86 end`
  - frame `87 start`
  - frame `87 end`
  - frame `88 start`
  - all four frame events still read:
    - `active_main = 02:9016`
    - `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
  - the same late write trio repeats on frame `88`, scanline `227`
- shifted `v1` (`target_frame = 87`, `620` samples) extends that same result:
  - frame `87 end`
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - all four frame events still read the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the late write trio repeats again on frame `89`, scanline `228`
  - the last sampled point is frame `89`, scanline `96`, still on `02:9016`
    with the same cursor/budget tuple
- practical reading:
  - the recurring late gameplay stage under `02:9016` is now proven to survive
    through frame `89 start` and at least frame `89`, scanline `96`
  - the `02:9016 -> 00:8029` handoff is therefore later than frame `89`,
    scanline `96`
  - the next best Lane 3 target is to advance the same trace one more
    target-frame window so it covers the rest of frame `89` and enters frame
    `90`

### CP-36: First direct visible-path `00:0054` producer observed on frame `90`

- Captured the next shifted boundary-aware trace:
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`

Current reading:

- the recurring late `02:9016` stage still survives:
  - frame `88 start`
  - frame `88 end`
  - frame `89 start`
  - frame `89 end`
  - frame `90 start`
  - all of those frame events still read
    `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- the new result is the first direct producer for `00:0054` on that path:
  - frame `90`, scanline `30`: `00:0054 = 0x40`
  - frame `90`, scanline `54`: `00:0054 = 0x48`
  - those writes happen under `active_main = 02:9016`
  - `00:0053` still remains `0x38`
- practical reading:
  - the visible gameplay lane itself advances the queue write pointer from
    `0x38 -> 0x40 -> 0x48` before the later sampled `0x48/0x48` state
  - the next best Lane 3 target is now to trace when and where `00:0053`
    catches up from `0x38` to `0x48`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is no longer the closest unexplained edge

### CP-37: `00:0053` catches up on frame `91`, with a transient `0x14B8` budget

- Captured the next shifted boundary-aware trace and helper-side follow-up:
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`

Current reading:

- the visible gameplay lane now has a directly observed equalization path:
  - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
  - frame `91 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `91 end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
- the frame-`91` burst is now explicit:
  - frame `91`, scanline `228`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    then `00:0055 = 0x08`, `00:0056 = 0x15`
  - frame `91`, scanline `229`: `00:0055 = 0xB8`, `00:0056 = 0x14`,
    `00:0053 = 0x48`
  - frame `92`, scanline `227`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    `00:0053 = 0x48`
- helper-side write tracing against nearby bank-1 sinks stays negative:
  - added write points at `7E:1E24/1E26/070C/0718`
  - no writes were recorded at those sinks in the same `90..92` window
- practical reading:
  - the old “find the `00:0053` catch-up” question is now closed
  - the next best Lane 3 target is now the producer/reset path behind the
    transient frame-`91` `00:0055/0056 = 0xB8/0x14` state and the frame-`92`
    reset back to `0x90/0x15`
  - the later `00:8029` / `0x00/0x84/0x17` end-of-frame collapse is still open,
    but it is again the second boundary, not the first

### CP-38: Later timed-input direct-hit bridge reopened at `7051`

- Extended the Mesen extractor bridge so timed input windows work through the
  headless frame extractor:
  - `tools/mesen_ppu_extract/Program.cs`
  - `tools/extract_mesen_scene_range.py`
- Added the successful later-scene extraction artifacts:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
- Re-ran the matching targeted `L001210` probe:
  - `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added committed provenance outputs:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_provenance.md`
- Extended the supporting docs:
  - `rom_analysis/docs/memory_map.md`
  - `tools/README.md`

Current reading:

- the extractor bridge no longer stalls when timed input windows are combined
  with the headless Mesen asset path:
  - smoke validation `0-3:start` now extracts frame `8`
  - the previously blocked later-scene path
    `6800:start;6900-6920:start,a` now extracts frame `7051`
- the matching targeted probe recovers the later direct-hit cluster on that
  same scenario:
  - frame `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - frame `7059` -> `07:BF49` (`42FB`, bank 7)
  - frame `7064` -> `07:C112` (`26FB`, bank 7)
- the new one-frame provenance artifact binds the visible tilemap layers at
  frame `7051` directly to the bank-13 source:
  - `bg1` tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` tile index `0x000` at `CHR 0x3000`
  - `bg3` tile index `0x000` at `CHR 0x6000`
  - all backed by exact `runtime-hit@7051`
- practical reading:
  - Lane 2 is no longer blocked on the timed-input extractor bridge
  - headless proof now extends beyond the old `1117` carry boundary with a
    later direct runtime anchor
  - the next best Lane 2 step is to extract/design-pack `7059` and `7064` on
    the same scenario and decide whether they close a later contiguous
    provenance window around the recovered `0D:C4DC -> 07:BF49 -> 07:C112`
    sequence

### CP-39: Later direct-hit cluster packaged, but not yet promoted to a full window

- Extended the recovered later-scene extraction lane to include the remaining
  direct-hit frames:
  - `tools/out/l001210_probe_7051_inputfix_summary.json`
- Added a combined exact-hit provenance artifact:
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7051_7064_provenance.md`
- Updated the supporting docs:
  - `rom_analysis/docs/next_steps_roadmap.md`
  - `rom_analysis/docs/memory_map.md`
  - `validation/README.md`

Current reading:

- the recovered later direct-hit cluster is now packaged end-to-end on the same
  timed-input scenario `6800:start;6900-6920:start,a`:
  - `7051` -> `0D:C4DC` (`26FB`, bank 13)
  - `7059` -> `07:BF49` (`42FB`, bank 7)
  - `7064` -> `07:C112` (`26FB`, bank 7)
- the extracted design-pack range is stable across those exact-hit frames:
  - `bgMode = 1`
  - `mainScreenLayers = 0x11`
  - `forcedBlank = false`
  - `bg1` keeps tile indices `0x000..0x2C8` at `CHR 0x2000`
  - `bg2` and `bg3` each stay on tile index `0x000`
- practical reading:
  - this closes the exact later-hit anchors, not the full `7051..7064` window
  - the source chunk changes at each recovered hit, so promoting a contiguous
    window still needs at least one interior confirmation per segment rather
    than a blind carry assumption
  - the next best Lane 2 step is a minimal interior follow-up:
    - extract/design-pack `7055` and `7061`
    - if those mid-segment samples keep the same tile-index block and map
      cleanly by carry (`7055 <- 7051`, `7061 <- 7059`), promote the later
      scene into a documented contiguous provenance window

### CP-40: Mirrored non-square OBJ regression closed and covered

- Fixed the vertical-mirror row sampling bug in both renderer implementations:
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Applied the same height-based fix to both OBJ code paths in each renderer:
  - the normal OBJ compositor
  - the Mode 7 scanline/PPU-accurate compositor
- Added a generated regression fixture and runner:
  - `tools/check_obj_vertical_flip.py`
  - `make -C tools obj-vertical-flip-check`
- Updated the validation docs:
  - `validation/README.md`
  - `tools/README.md`

Current reading:

- the old bug only showed up on vertically mirrored non-square sprites because
  the row-sampling logic incorrectly used `width` where it needed full sprite
  `height`
- the new generated fixture is intentionally minimal:
  - one 16x32 OBJ sprite
  - four unique tile rows
  - one shared golden PPM
- that single fixture now checks four paths:
  - Python simple OBJ renderer
  - Python `mode7-ppu` OBJ renderer
  - SDL non-Mode-7 OBJ renderer
  - SDL Mode 7 OBJ renderer
- practical reading:
  - the mirrored-OBJ correctness gap is now closed and guarded
  - the next cleanup-side renderer target should move to BG4 support and
    tile-priority ordering instead of revisiting this bug class ad hoc

### CP-41: Generated-clutter cleanup is now automated

- Added a repo-owned cleanup tool:
  - `tools/clean_generated_artifacts.py`
  - `make -C tools clean-generated`
  - `make -C tools clean-generated-dry-run`
- The cleanup scope is explicit and conservative:
  - build output (`port/build`, `tools/mesen_ppu_extract/bin`, `tools/mesen_ppu_extract/obj`)
  - mutable emulator output (`.mesen-config/Mesen2/LuaScriptData`, `.mesen-runs`)
  - scratch `tools/out` surfaces (`*smoke*`, `*makecheck*`, `*designtest*`,
    the vertical-flip fixture output)
  - debugger coverage junk (`game.cdl`) under `.mesen-config`, `tools/out`,
    and committed proof bundles
- Updated tooling/docs:
  - `tools/Makefile`
  - `tools/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Current reading:

- `tools/out` is the dominant local clutter surface (`2.4G` in this snapshot),
  but most of that tree is still evidence-bearing archaeology output, so the
  new cleanup target intentionally does **not** blanket-delete it
- the always-safe/scratch slice already identified here is enough to reclaim
  build products, smoke outputs, stale design-test packs, and debugger junk
  without touching referenced proof artifacts
- practical reading:
  - repo hygiene now has a repeatable cleanup path instead of one-off manual
    deletions
  - the next cleanup-side work can move back to renderer/port progress without
    letting disposable surfaces keep accumulating

### CP-42: BG4 and tile-priority rendering are now covered

- Expanded the shared renderer model from `3` BG layers to `4`:
  - `port/src/td2_types.h`
  - `port/src/td2_ppu.c`
  - `tools/render_mesen_snes_bg.py`
- Replaced the old implicit non-Mode-7 layer paint order with explicit ordered
  BG passes:
  - low priority `BG4 -> BG3 -> BG2 -> BG1`
  - then high priority `BG4 -> BG3 -> BG2 -> BG1`
- Fixed the per-mode BPP table so BG4 is only active in modes that actually
  expose it.
- Added a generated regression fixture and runner:
  - `tools/check_bg_layer_priority.py`
  - `make -C tools bg-layer-priority-check`
- Updated docs/cleanup wiring:
  - `validation/README.md`
  - `tools/README.md`
  - `tools/clean_generated_artifacts.py`

Current reading:

- the old non-Mode-7 path had two coupled correctness gaps:
  - hard-coded `3`-layer scene state
  - no tile-priority ordering at all
- the new fixture is intentionally tiny but targeted:
  - BG4-only cell
  - low-priority overlap cell
  - high-priority-over-low cell
  - high-priority ordering cell
- practical reading:
  - BG4 visibility and basic tile-priority ordering are now guarded in both
    renderers
  - the next renderer-side work should move to the remaining composition gaps
    rather than this older background-order failure class

### CP-43: Late intro probe-vs-bridge OAM divergence is now machine-readable

- Added a dedicated OAM delta analyzer:
  - `tools/analyze_oam_delta.py`
- Added a reproducible late-intro target:
  - `make -C tools intro-oam-deltas`
- Evidence:
  - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.json`
  - `tools/out/intro_oam_deltas/frame_986_probe_vs_bridge.md`
  - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.json`
  - `tools/out/intro_oam_deltas/frame_990_probe_vs_bridge.md`
  - `tools/out/intro_oam_deltas/frame_994_variant_compare.json`
  - `tools/out/intro_oam_deltas/frame_994_variant_compare.md`

Current reading:

- frame `986`:
  - full `544`-byte OAM delta is `37` bytes (`35` low-table, `2` high-table)
  - `9` sprites change, and all `9` are visible in the probe dump while the
    bridge dump carries `0` visible sprites
  - practical reading: the bridge-visible path has already cleared the whole
    late overlay by `986`
- frame `990`:
  - full `544`-byte OAM delta is `92` bytes (`86` low-table, `6` high-table)
  - `23` sprites change; visible sprite count drops from `23` in the probe dump
    to `5` in the bridge dump
  - practical reading: the first `5` sprites are repositioned/resized into a
    compact bridge-visible cluster and the remaining `18` probe sprites vanish
- frame `994`:
  - the current committed `fromraw990` and `bridgeobj` variants compare at `0`
    OAM bytes / `0` sprite deltas
  - practical reading: the remaining screenshot gap at `994` is already
    downstream of a raw OAM fork in the committed artifact set

### CP-44: `tools/out` repo hygiene is now quiet by default

- Updated the ignore policy:
  - `.gitignore`
- Tightened the conservative cleanup target:
  - `tools/clean_generated_artifacts.py`
  - `make -C tools clean-generated`
  - `make -C tools clean-generated-dry-run`
- Updated the workflow docs:
  - `tools/README.md`
  - `validation/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `make -C tools clean-generated-dry-run`
- `make -C tools clean-generated`
- `git status --short`

Current reading:

- `tools/out/` is now git-ignored by default, which removes the normal
  worktree noise from new local extractor/probe runs without affecting already
  tracked proof artifacts under that tree
- promoting a new `tools/out` artifact is now explicit (`git add -f`) instead
  of accidental
- the cleanup target now also removes obvious untracked `tmp*` / `test_*`
  scratch surfaces while skipping any tracked path and staying conservative
  around evidence-bearing archaeology runs
- practical reading:
  - the ignore-policy slice of repo hygiene is now closed enough to move to the
    remaining portability cleanup
  - the next cleanup-side step should remove hard-coded personal Mesen paths
    from promoted scripts and Makefiles
  - intro-side evidence families like `intro_oam_deltas` remain intentionally
    out of the cleaner's delete set

### CP-45: Promoted tooling surfaces are portable by default

- Added a repo-owned portability guard:
  - `tools/check_portability_paths.py`
  - `make -C tools portability-path-check`
- Wired the new check into the promoted tooling surface:
  - `tools/Makefile`
- Removed hard-coded personal-path examples from the main tooling docs:
  - `tools/README.md`
  - `validation/README.md`

Evidence:

- `make -C tools portability-path-check`
- `python3 -m py_compile tools/check_portability_paths.py`

Current reading:

- the actual runtime wrappers were already portable:
  - `validation/run_mesen_capture.sh` resolves via `MESEN_BIN`,
    `MESEN_RELEASE_DIR`, then `PATH`
  - `tools/run_mesen_ppu_extract.sh` derives `MESEN_RELEASE_DIR` from
    `MESEN_BIN` or `PATH`
- the remaining portability leak was in promoted usage examples and notes that
  still embedded one personal Linux source-build path
- the new guard keeps that same issue from re-entering the promoted tooling
  surface silently
- scope note:
  - this closes the roadmap gate for promoted scripts/Makefiles and main
    tooling docs
  - historical generated artifacts and long-form docs may still carry absolute
    paths and should be treated as separate cleanup work rather than current
    wrapper/Makefile blockers
- practical reading:
  - the personal-path portability slice is now closed enough to move on
  - the next cleanup-side target should be validation-output isolation instead
    of mutable shared `LuaScriptData`

### CP-46: Boot-probe validation output defaults are now repo-owned

- Added a repo-owned boot-probe output prefix:
  - `validation/mesen_probe_boot.lua` now accepts
    `TD2_BOOT_PROBE_OUTPUT_PREFIX`
  - `validation/run_mesen_capture.sh` now creates the parent directory for that
    prefix before launching Mesen
- Promoted boot-probe targets now default to repo-owned outputs:
  - `tools/Makefile` now routes `l001210-probe` and `l001210-save-savestate`
    through `tools/out/td2_boot_probe*`
  - `tools/run_l001210_probe_matrix.py` now assigns each scenario its own
    repo-owned output prefix inside the matrix output directory
- Updated promoted docs and contract examples:
  - `tools/README.md`
  - `validation/README.md`
  - `rom_analysis/docs/validation_gates.md`

Evidence:

- `bash -n validation/run_mesen_capture.sh validation/run_mesen_probe_boot.sh validation/run_mesen_dump_bg_range.sh`
- `python3 -m py_compile tools/run_l001210_probe_matrix.py`
- `make -C tools -n l001210-probe L001210_PROBE_TOTAL_FRAMES=2 MESEN_TIMEOUT_SECONDS=15`
- `make -C tools -n l001210-save-savestate L001210_SAVE_TOTAL_FRAMES=2 MESEN_TIMEOUT_SECONDS=15`
- bounded negative runtime check:
  - both local Linux Mesen binaries abort in `--testRunner` mode with
    `std::bad_cast` before the probe completes, so live proof of the redirected
    files remains environment-blocked rather than code-blocked

Current reading:

- the promoted boot-probe lane no longer defaults to shared
  `.mesen-config/Mesen2/LuaScriptData` for its trace/screenshot/contract paths
- the matrix harness now keeps per-scenario probe JSON and trace JSON under the
  scenario output family instead of reading from mutable shared emulator state
- the remaining gap on this slice is live runtime confirmation once the local
  Mesen `--testRunner` crash is resolved
- practical reading:
  - the cleanup-side output-isolation slice is now closed enough to move on
  - the next cleanup-side target should push the same repo-owned/per-run policy
    into the remaining validation surfaces and contract examples that still
    assume shared emulator output

### CP-47: Visible scanline helper output is now repo-owned by default

- Extended the generic Mesen launcher for the scanline probe family:
  - `validation/run_mesen_capture.sh` now prepares the parent directory for
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX`
- Moved the committed visible-range scanline helper off shared emulator output:
  - `tools/capture_visible_mode7_range.py` now derives a repo-owned per-run
    `TD2_SCANLINE_TEST_OUTPUT_PREFIX` from `--output`
  - the helper records that raw probe path in its aggregate JSON payload
- Updated promoted docs for the scanline path:
  - `validation/README.md`
  - `tools/README.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `bash -n validation/run_mesen_capture.sh`
- `python3 -m py_compile tools/capture_visible_mode7_range.py`
- `python3 tools/capture_visible_mode7_range.py --help`

Current reading:

- the committed visible-scanline capture helper no longer depends on shared
  `.mesen-config/Mesen2/LuaScriptData` as its default raw JSON surface
- direct one-off `mesen_scanline_step_test.lua` runs can now also stay
  repo-owned when `TD2_SCANLINE_TEST_OUTPUT_PREFIX` is set explicitly
- scope note:
  - this checkpoint does not yet change the newer gameplay-specific
    `capture_scanline_samples_range.py` helper that is currently in the dirty
    worktree
  - it closes the committed visible-range scanline helper path only
- practical reading:
  - the cleanup-side output-isolation slice is moving, but not finished
  - the next cleanup-side target should isolate the remaining scanline/gameplay
    wrappers and the lingering doc examples that still assume shared emulator
    output

### CP-48: Later-scene interior carry check is blocked again by bridge timeout regression

- Rebuilt the committed Mesen bridge extractor to retry the later-scene lane:
  - `dotnet build tools/mesen_ppu_extract/mesen_ppu_extract.csproj --configfile tools/mesen_ppu_extract/NuGet.Config`
- Retried the planned Lane 2 interior carry extraction on the documented timed-
  input scenario `6800:start;6900-6920:start,a`:
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 7055 --end-frame 7061 --step 6 --out-dir tools/out/mesen_range_7055_7061_inputfix_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --input-windows '6800:start;6900-6920:start,a' --frame-timeout-seconds 180`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 --out-dir tools/out/mesen_frame_7055_inputfix_retry_v1 --frame-timeout-seconds 300 --input-windows '6800:start;6900-6920:start,a'`
- Updated the source-of-truth roadmap with the live blocker:
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- first retry failed with `System.TimeoutException` waiting for frame `1762`
  while targeting frame `7055`
- final bounded retry failed with the same exception earlier, at frame `411`,
  on the single-frame wrapper path
- both retries produced only scratch `.mesen-home` output directories and no
  frame assets under:
  - `tools/out/mesen_range_7055_7061_inputfix_v1`
  - `tools/out/mesen_frame_7055_inputfix_retry_v1`

Current reading:

- this is a real regression relative to CP-38/CP-39, which had already
  recovered the same later-scene timed-input path
- the current local bridge environment is not healthy enough to promote the
  `7051..7064` window with the planned `7055/7061` interior confirmation
- practical reading:
  - do not claim the later scene as a contiguous provenance window yet
  - the next defensible move is to pin or recover a known-good
    `Mesen`/`MesenCore.so` pair for timed-input bridge extraction, then rerun
    `7055` and `7061`

### CP-49: Bank30 unresolved queue is tighter after registry reclassification

- Extended `tools/build_bank30_chunk_registry.py` so the consolidated registry
  now records whether a candidate sits inside another successful decode window
  and can classify non-runtime cases more honestly.
- Regenerated the bank30 registry outputs:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`
- Updated the source-of-truth lane docs:
  - `rom_analysis/docs/bank30_decompression_report.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `python3 -m py_compile tools/build_bank30_chunk_registry.py`
- `python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md`

Current reading:

- `1E:9681` is no longer best treated as a live unresolved content target:
  - `42FB`
  - declared output `0`
  - registry status: `sentinel-control`
- `1E:E91F` is no longer best treated as a top-level unresolved chunk:
  - `67FB`
  - standalone decode still fails with source exhaustion
  - the marker sits inside the successful `1E:DA96` decode window and also
    inside the successful `1E:E800` nested window
  - registry status: `nested-invalid-marker`
- the active unresolved queue is now tighter and smaller:
  - `P0`: `1E:EE7F` (`26FB`, table-confirmed unseen)
  - `P1`: `1E:DA96` (`67FB`, valid top-level decode still unseen at runtime)
- practical reading:
  - this does not solve runtime reachability for `EE7F` or `DA96`
  - it does remove two low-signal pseudo-targets from the active queue so the
    next lane-1 work can stay focused on real remaining ambiguity

### CP-50: Later-scene interior tilemap carry check reopened at `7055/7061`

- Patched `tools/mesen_ppu_extract/Program.cs` so timed-input bridge extraction
  no longer depends on fragile per-frame `Resume/WaitForFrame/Pause` stepping:
  - switch timed-input advance to debugger `PpuFrame` stepping
  - wait on the expected frame count directly so fast steps do not false-timeout
  - chunk long same-input spans into `256`-frame steps to keep the current
    local `Mesen` / `MesenCore.so` pair stable
- Rebuilt the committed bridge extractor and reran the previously blocked
  later-scene lane on scenario `6800:start;6900-6920:start,a`:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07055 --frame-timeout-seconds 180 --input-windows '6800:start;6900-6920:start,a'`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7061 --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07061 --frame-timeout-seconds 180 --input-windows '6800:start;6900-6920:start,a'`
- Packed the reopened interior frames and promoted tilemap-side evidence:
  - `tools/out/design_mesen_range_7055_7061_inputfix_v2/design_pack_range.json`
  - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc`
  - `rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.md`
- Updated the source-of-truth lane docs:
  - `rom_analysis/docs/memory_map.md`
  - `rom_analysis/docs/next_steps_roadmap.md`

Evidence:

- `dotnet build tools/mesen_ppu_extract/mesen_ppu_extract.csproj --configfile tools/mesen_ppu_extract/NuGet.Config`
- `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_7055_7061_inputfix_v2 tools/out/design_mesen_range_7055_7061_inputfix_v2 --clean-out`
- raw/design-pack comparison reading:
  - `7055` vs `7051`:
    - `bg1/bg2/bg3` tilemaps: exact match
    - `vram.bin`: exact match
    - `cgram.bin`, `ppu_state.json`, `oam.bin`: different
    - visible sprites: `10 -> 0`
  - `7061` vs `7059`:
    - `bg1/bg2/bg3` tilemaps: exact match
    - `vram.bin`, `oam.bin`: exact match
    - `cgram.bin`, `ppu_state.json`: different
    - visible sprites: `0 -> 0`

Current reading:

- the current local timed-input bridge is usable again for the planned later-
  scene extraction path; the previous compatibility blocker is no longer the
  active reason Lane 2 was stalled
- `7055` now closes the intended interior tilemap carry check for
  `0D:C4DC`, but it does **not** close whole-scene carry because the
  visible-sprite/OAM composition changes between `7051` and `7055`
- `7061` now closes the intended interior tilemap carry check for `07:BF49`,
  and that pair already agrees on visible-sprite emptiness plus raw OAM
- practical reading:
  - Lane 2 is no longer blocked on bridge compatibility for this check
  - the new evidence is enough to promote tilemap-side interior carry
  - it is still not enough to promote `7051..7064` as full-scene contiguous
    carry evidence

### CP-51: Translation-facing visual contracts now bridge design packs into BG/OBJ IR

- Added new frame-level IR builders:
  - `tools/build_mesen_visual_contract.py`
  - `tools/build_mesen_visual_contract_range.py`
- The new contract layer is intentionally split along the real rendering
  boundary:
  - BG stays tilemap/CHR-driven from decoded `tilemaps/bg*_tilemap.json`
  - OBJ stays OAM-driven from `sprites/sprites_visible.json` plus raw
    `oam.bin/cgram.bin/ppu_state.json`
- The builder can also attach current lane-2 tilemap provenance rows so the
  translation surface already carries frame/layer -> chunk evidence when that
  data exists.
- Updated the design-workbench doc to promote the new contract surface:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 tools/out/visual_contract_7051.json --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc`
- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_7055_7061_inputfix_v2 tools/out/visual_contract_range_7055_7061 --provenance-json rom_analysis/maps/tilemaps/mesen_range_7055_7061_provenance.jsonc --clean-out`

Current reading:

- the repo now has a machine-readable visual IR that is more useful for later
  assembly translation than raw design packs alone
- the IR makes the key architectural split explicit:
  - BG provenance can already bind to tilemap/chunk evidence
  - OBJ state still needs producer-side breakpoint/write ownership to become a
    reliable assembly contract
- practical reading:
  - this is the right staging layer for automated CHR/sprite archaeology
  - it does not replace runtime tracing; it gives tracing a stable target

### CP-52: Visual contracts now accept producer-side write-breakpoint ownership

- Extended `validation/mesen_probe_boot.lua` generic write-point trace payload:
  - CPU regs/PC now ride along with each write hit
  - active IRQ callback bank/addr now ride along with each write hit
- Extended the visual-contract builders:
  - `tools/build_mesen_visual_contract.py` now accepts `--probe-json`
  - `tools/build_mesen_visual_contract_range.py` now forwards `--probe-json`
    and exposes `producerTraceEnabled` in the range index
- The merged contract now emits `producerTrace` by write domain:
  - `vram`
  - `cgram`
  - `oam`
  - `obj_state`
  - each domain carries top write callsites and active callbacks, plus sample
    hits
- Updated the design-workbench doc so the contract workflow now includes
  producer-side ownership as a first-class input:
  - `rom_analysis/docs/mesen_debugger_design_workbench.md`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- synthetic merge validation:
  - `tools/out/visual_contract_probe_fixture.json`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 tools/out/visual_contract_7051_with_probe.json --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc --probe-json tools/out/visual_contract_probe_fixture.json`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_7051_inputfix_v1 tools/out/visual_contract_range_7051_with_probe --frame-glob frame_07051 --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc --probe-json tools/out/visual_contract_probe_fixture.json --clean-out`
- negative live validation in the current local environment:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BOOT_PROBE_TOTAL_FRAMES=2 ./validation/run_mesen_probe_boot.sh`
  - the same baseline with write points enabled and longer attempts at `986`
    and `7051`
  - all three headless runs exited without emitting the expected probe JSON,
    and the short baseline surfaced exit code `255`

Current reading:

- the IR surface is now ready to carry producer-side ownership once a probe
  capture exists
- the merge path itself is validated
- the current blocker is not the contract schema anymore; it is the local
  headless boot-probe runner

### CP-53: Headless producer-trace capture reopened by absolute path normalization

- Updated the shared headless launcher:
  - `validation/run_mesen_capture.sh`
  - ROM path, Lua script path, optional savestate path, and repo-facing output
    prefixes are now normalized to absolute paths before invoking
    `Mesen --testRunner`
- Root cause of the earlier `exit 255` / no-output reports:
  - `Mesen --testRunner` resolves relative Lua file I/O under the isolated
    config root (`.mesen-config/Mesen2`), not the repo working directory
  - repo-relative nested prefixes like `tools/out/...` therefore targeted
    missing directories inside the config tree and the Lua callbacks timed out
    before they could reach `emu.stop(0)`
- Revalidated the previously failing relative-prefix smoke paths:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=10 TD2_CAPTURE_WARMUP_FRAMES=0 TD2_CAPTURE_FRAMES=1 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/capture_smoke/cap ./validation/run_mesen_capture.sh`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/dump_bg_smoke/intro ./validation/run_mesen_dump_bg_range.sh`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=15 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_baseline/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2 ./validation/run_mesen_probe_boot.sh`
- Promoted a real live producer-trace proof instead of relying only on the
  synthetic merge fixture:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=30 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/frame300_live_probe_cap2048/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=301 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=300 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=2048 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_visual_contract.py port/assets/test_dump_frame300/design_pack tools/out/visual_contract_frame300_live_probe_cap2048.json --probe-json tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
- Produced evidence:
  - `tools/out/frame300_live_probe_cap2048/td2_boot_probe.json`
  - `tools/out/visual_contract_frame300_live_probe_cap2048.json`

Current reading:

- the old blocker is closed; the headless runner can now emit repo-owned probe
  and capture outputs reliably with the documented relative `tools/out/...`
  prefixes
- the promoted frame-`300` proof records `2048` retained write hits with
  `133427` dropped by cap and yields live producer domains for:
  - `vram`
  - `cgram`
  - `oam`
  - `obj_state`
- the current limitation has narrowed:
  - a narrow `296..300` write window on the same frame emits `0` hits
  - that means the next problem is choosing producer-active windows for later
    scene ownership (`986`, `7051`, `7055`, `7059`, `7061`), not reviving the
    runner itself
- bounded 2026-03-21 follow-up on the later timed-input `7051` path:
  - attempted longer live ownership trace:
    - `MESEN_TIMEOUT_SECONDS=120`
    - `TD2_BOOT_PROBE_TOTAL_FRAMES=7062`
    - `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`
    - `TD2_BOOT_PROBE_TRACE_END_FRAME=7061`
    - `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'`
    - result: `exit 255`, no
      `tools/out/visual_contract_probe_7051_7061_live/td2_boot_probe.json`
  - attempted narrowed live ownership trace:
    - `MESEN_TIMEOUT_SECONDS=120`
    - `TD2_BOOT_PROBE_TOTAL_FRAMES=7052`
    - `TD2_BOOT_PROBE_TRACE_START_FRAME=7048`
    - `TD2_BOOT_PROBE_TRACE_END_FRAME=7051`
    - `TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a'`
    - result: `exit 255`, no
      `tools/out/visual_contract_probe_7051_live/td2_boot_probe.json`
  - practical reading:
    - later power-on timed-input producer traces are still not reproducible
      headlessly in this environment even though the early frame-`300` proof is
      reproducible
    - this is an informative negative result, not evidence against the visual
      contract merge path itself
  - next best step:
    - do not spend more retries on the same power-on `7051` path without a new
      starting surface
    - recover a reusable later-intro savestate/seed for the `7051..7061`
      window, or promote a cheaper later design-pack target such as `986`
      before retrying live producer-trace ownership

### CP-54: Frame `986` now has a live producer-trace-backed visual contract

- Promoted a cheaper later-window ownership proof before retrying the blocked
  timed-input `7051` path:
  - extracted a fresh raw frame dump and design pack for `986`
  - ran a bounded live write-point trace for frames `982..986`
  - merged that probe into a translation-facing visual contract
- Hardened the probe/contract schema at the same time:
  - `validation/mesen_probe_boot.lua` now writes
    `trace_start_frame` / `trace_end_frame` into the main
    `td2_boot_probe.json` payload, which lets merged visual contracts preserve
    an exact `producerTrace.traceWindow`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=986`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=987 TD2_BOOT_PROBE_TRACE_START_FRAME=982 TD2_BOOT_PROBE_TRACE_END_FRAME=986 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame986 tools/out/visual_contract_frame986_live_probe.json --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/design_frame986/design_pack.json`
  - `tools/out/visual_contract_probe_986_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame986_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00986_frame.png tools/out/mesen_frame986/main_visible.ppm --diff-out tools/out/mesen_frame986_vs_intro986_diff.ppm`
  - `267` mismatched pixels (`0.465611%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame986/main_visible.ppm tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm --diff-out tools/out/mesen_frame986_vs_bridgeoverride986_diff.ppm`
  - `2` mismatched pixels (`0.003488%`)

Current reading:

- the cheap `986` frame target is reproducible in the promoted extractor path
  and lands on the same practical surface as the committed bridgeoverride scene
- the fresh design pack reports:
  - `frame_number = 986`
  - `bgMode = 7`
  - `mainScreenLayers = 0x11`
  - active visible BG layer: `bg1`
  - visible sprite count: `0`
- the live write-point trace records `3246` writes with `0` drops:
  - OAM domain: `2730` writes across frames `982..986`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `516` writes at frames `984` and `986`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits in this late window still run under active main
  callback `01:9FE5`
- no `CGRAM` or `OBJSEL` writes were observed inside `982..986`
- practical reading:
  - by `986`, the visible late overlay is already gone (`0` visible sprites),
    but OAM upload traffic is still active in the same callback family
  - the live ownership proof now exists for a real later intro window without
    needing the blocked timed-input `7051` path
  - the contract hardening change is immediately useful because
    `producerTrace.traceWindow` now carries the exact `982..986` span

Next best step:

- extend the same live ownership path forward into `990` and then `994`, where
  the late OAM/visible-composition boundaries are already documented
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-55: Frames `990` and `994` now extend live ownership through the late bridge-object edge

- Extended the same bounded ownership workflow used at `986` into the next late
  attract edges:
  - extracted a fresh raw frame dump and design pack for `990`
  - ran a bounded live write-point trace for frames `986..990`
  - merged that probe into a translation-facing visual contract
  - extracted raw frame `994`, built a design pack from it, ran a bounded live
    write-point trace for frames `990..994`, and merged that probe too
- The first `994` extractor attempt timed out when launched in parallel with
  the live probe, so the promoted path now records the standalone extractor
  invocation that closed the frame cleanly:
  - `./tools/run_mesen_ppu_extract.sh --frame 994 --frame-timeout-seconds 120`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=990`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=991 TD2_BOOT_PROBE_TRACE_START_FRAME=986 TD2_BOOT_PROBE_TRACE_END_FRAME=990 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame990 tools/out/visual_contract_frame990_live_probe.json --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release ./tools/run_mesen_ppu_extract.sh --rom ./game.smc --frame 994 --frame-timeout-seconds 120 --out-dir ./tools/out/mesen_frame994`
- `python3 tools/build_mesen_design_pack.py tools/out/mesen_frame994 tools/out/design_frame994 --clean-out`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=995 TD2_BOOT_PROBE_TRACE_START_FRAME=990 TD2_BOOT_PROBE_TRACE_END_FRAME=994 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame994 tools/out/visual_contract_frame994_live_probe.json --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame990_live_probe.json`
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame994_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00990_frame.png tools/out/mesen_frame990/main_visible.ppm --diff-out tools/out/mesen_frame990_vs_intro990_diff.ppm`
  - `1516` mismatched pixels (`2.643694%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame990/main_visible.ppm tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm --diff-out tools/out/mesen_frame990_vs_bridgeobj990_diff.ppm`
  - `2` mismatched pixels (`0.003488%`)
- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00994_frame.png tools/out/mesen_frame994/main_visible.ppm --diff-out tools/out/mesen_frame994_vs_intro994_diff.ppm`
  - `2622` mismatched pixels (`4.572405%`)
- `python3 tools/compare_frames.py tools/out/mesen_frame994/main_visible.ppm tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm --diff-out tools/out/mesen_frame994_vs_bridgeobj994_diff.ppm`
  - `96` mismatched pixels (`0.167411%`)

Current reading:

- frame `990`:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json` records
    `3762` write hits with `0` drops over `986..990`
  - the merged contract preserves exact
    `producerTrace.traceWindow = 986..990`
  - OAM domain: `2730` writes across frames `986..990`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1032` writes across frames `986/988/989/990`
    - dominant callsites: `00:81E5` / `00:81F2`
  - `tools/out/design_frame990/sprites/sprites_visible.json` reports `5`
    visible sprites
- frame `994`:
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json` records
    `4020` write hits with `0` drops over `990..994`
  - the merged contract preserves exact
    `producerTrace.traceWindow = 990..994`
  - OAM domain: `2730` writes across frames `990..994`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1290` writes across frames `990..994`
    - dominant callsites: `00:81E5` / `00:81F2`
  - `tools/out/design_frame994/sprites/sprites_visible.json` reports `19`
    visible sprites
- all sampled write hits in both windows still run under active main callback
  `01:9FE5` with the same active IRQ callback `00:835F`
- practical reading:
  - the late bridge-object edge now has live ownership coverage from `986`
    through `994`
  - OAM upload volume stays flat from `990` to `994`, while VRAM traffic grows
    (`1032 -> 1290`) and the visible overlay expands (`5 -> 19` sprites)
  - the remaining frame-`994` screenshot gap is no longer blocked on missing
    producer-side ownership evidence or a separate committed OAM fork

Next best step:

- extend the same live ownership surface to frame `998`, where the direct
  bridge-extracted `01:9FE5` continuation already begins
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-56: Frame `998` now anchors live ownership at the start of the direct bridge-extracted block

- Extended the same bounded ownership workflow one step further into the
  direct bridge-extracted `01:9FE5` continuation:
  - extracted a fresh raw frame dump and design pack for `998`
  - ran a bounded live write-point trace for frames `994..998`
  - merged that probe into a translation-facing visual contract
- Kept validation bounded and translation-facing:
  - compared the fresh Mesen frame dump against the local screenshot
  - compared the extracted frame dump against the repo's Python
    `mode7-ppu` renderer instead of the SDL runtime because the local runtime
    worktree currently contains unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=998`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=999 TD2_BOOT_PROBE_TRACE_START_FRAME=994 TD2_BOOT_PROBE_TRACE_END_FRAME=998 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame998 tools/out/visual_contract_frame998_live_probe.json --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_998_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame998_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_00998_frame.png tools/out/mesen_frame998/main_visible.ppm --diff-out tools/out/mesen_frame998_vs_intro998_diff.ppm`
  - `3119` mismatched pixels (`5.439104%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame998/vram.bin tools/out/mesen_frame998/cgram.bin tools/out/mesen_frame998/ppu_state.json tools/out/mesen_frame998_mode7ppu.ppm --oam tools/out/mesen_frame998/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame998_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame998/main_visible.ppm tools/out/mesen_frame998_mode7ppu.ppm --diff-out tools/out/mesen_frame998_mode7ppu_vs_mesen998_diff.ppm`
  - `4` mismatched pixels (`0.006975%`)

Current reading:

- `tools/out/visual_contract_probe_998_live/td2_boot_probe.json` records
  `4020` write hits with `0` drops over `994..998`
- the merged contract preserves exact `producerTrace.traceWindow = 994..998`
- producer domains remain the same as the late `994` window:
  - OAM domain: `2730` writes across frames `994..998`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1290` writes across frames `994..998`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame998/sprites/sprites_visible.json` reports `32`
  visible sprites
- practical reading:
  - `998` is now a live ownership anchor at the start of the direct
    bridge-extracted continuation, not just a callback-state claim from older
    probe logs
  - compared with `994`, producer traffic stays flat while the visible overlay
    expands again (`19 -> 32` sprites)
  - the Python `mode7-ppu` renderer still lands on the same practical
    surface (`4` pixels from `main_visible.ppm`) that the docs already report
    for the `998..1005` bridge-visible block

Next best step:

- extend the same live ownership surface to frame `1005`, which closes the
  first direct bridge-extracted `998..1005` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-57: Frame `1005` now closes the first direct bridge-extracted `998..1005` ownership block

- Extended the live ownership surface from the `998` anchor to the end of the
  first direct bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1005`
  - ran a bounded live write-point trace for the whole `998..1005` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1005` through the
    headless range dumper so the screenshot compare now exists in the same
    `intro_loop_frame_*` family as the earlier late-window checkpoints
- Kept the renderer-side validation on the stable repo surface:
  - used the Python `mode7-ppu` renderer instead of the SDL runtime because
    the local runtime worktree still contains unrelated user edits under
    `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1005`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1006 TD2_BOOT_PROBE_TRACE_START_FRAME=998 TD2_BOOT_PROBE_TRACE_END_FRAME=1005 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1005 tools/out/visual_contract_frame1005_live_probe.json --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BG_RANGE_START_FRAME=1005 TD2_BG_RANGE_END_FRAME=1005 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop ./validation/run_mesen_dump_bg_range.sh`
- produced artifacts:
  - `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1005_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01005_frame.png tools/out/mesen_frame1005/main_visible.ppm --diff-out tools/out/mesen_frame1005_vs_intro1005_diff.ppm`
  - `4466` mismatched pixels (`7.788086%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1005/vram.bin tools/out/mesen_frame1005/cgram.bin tools/out/mesen_frame1005/ppu_state.json tools/out/mesen_frame1005_mode7ppu.ppm --oam tools/out/mesen_frame1005/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1005_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1005/main_visible.ppm tools/out/mesen_frame1005_mode7ppu.ppm --diff-out tools/out/mesen_frame1005_mode7ppu_vs_mesen1005_diff.ppm`
  - `4` mismatched pixels (`0.006975%`)

Current reading:

- `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json` records
  `6432` write hits with `0` drops over `998..1005`
- the merged contract preserves exact
  `producerTrace.traceWindow = 998..1005`
- producer domains stay inside the same late `01:9FE5` surface for the whole
  block:
  - OAM domain: `4368` writes across frames `998..1005`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `2064` writes across frames `998..1005`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1005/sprites/sprites_visible.json` reports `53`
  visible sprites
- practical reading:
  - the first direct bridge-extracted `998..1005` block is now closed by live
    ownership evidence at both ends (`998` and `1005`)
  - compared with `998`, producer traffic scales with the longer block window
    while the visible overlay keeps expanding (`32 -> 53` sprites) without a
    callback-family change
  - the Python `mode7-ppu` renderer still lands on the same practical surface
    (`4` pixels from `main_visible.ppm`) that earlier bridge-visible docs
    already report for frame `1005`

Next best step:

- extend the same live ownership surface to frame `1013`, which closes the
  next direct bridge-extracted `1006..1013` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-58: Frame `1013` now closes the next direct bridge-extracted `1006..1013` ownership block

- Extended the live ownership surface through the second direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1013`
  - ran a bounded live write-point trace for the whole `1006..1013` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1013` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1013`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1014 TD2_BOOT_PROBE_TRACE_START_FRAME=1006 TD2_BOOT_PROBE_TRACE_END_FRAME=1013 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1013 tools/out/visual_contract_frame1013_live_probe.json --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1013_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01013_frame.png tools/out/mesen_frame1013/main_visible.ppm --diff-out tools/out/mesen_frame1013_vs_intro1013_diff.ppm`
  - `4638` mismatched pixels (`8.088030%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1013/vram.bin tools/out/mesen_frame1013/cgram.bin tools/out/mesen_frame1013/ppu_state.json tools/out/mesen_frame1013_mode7ppu.ppm --oam tools/out/mesen_frame1013/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1013_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1013/main_visible.ppm tools/out/mesen_frame1013_mode7ppu.ppm --diff-out tools/out/mesen_frame1013_mode7ppu_vs_mesen1013_diff.ppm`
  - `10` mismatched pixels (`0.017439%`)

Current reading:

- `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json` records
  `6174` write hits with `0` drops over `1006..1013`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1006..1013`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1006..1013`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1806` writes across frames `1006..1012`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1013/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the second direct bridge-extracted `1006..1013` block is now closed by
    live ownership evidence at its end
  - compared with `1005`, OAM activity stays flat, visible sprites keep
    growing (`53 -> 61`), and the notable contract change is that bounded VRAM
    writes stop one frame earlier (`1006..1012`, not `1006..1013`)
  - the Python `mode7-ppu` renderer rises to the same `10`-pixel practical
    surface that earlier bridge-visible docs already report for frame `1013`

Next best step:

- extend the same live ownership surface to frame `1021`, which closes the
  next direct bridge-extracted `1014..1021` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-59: Frame `1021` now closes the direct bridge-extracted `1014..1021` ownership block

- Extended the live ownership surface through the third direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1021`
  - ran a bounded live write-point trace for the whole `1014..1021` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1021` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1021`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1022 TD2_BOOT_PROBE_TRACE_START_FRAME=1014 TD2_BOOT_PROBE_TRACE_END_FRAME=1021 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1021 tools/out/visual_contract_frame1021_live_probe.json --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1021_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01021_frame.png tools/out/mesen_frame1021/main_visible.ppm --diff-out tools/out/mesen_frame1021_vs_intro1021_diff.ppm`
  - `3557` mismatched pixels (`6.202916%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1021/vram.bin tools/out/mesen_frame1021/cgram.bin tools/out/mesen_frame1021/ppu_state.json tools/out/mesen_frame1021_mode7ppu.ppm --oam tools/out/mesen_frame1021/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1021_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1021/main_visible.ppm tools/out/mesen_frame1021_mode7ppu.ppm --diff-out tools/out/mesen_frame1021_mode7ppu_vs_mesen1021_diff.ppm`
  - `10` mismatched pixels (`0.017439%`)

Current reading:

- `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json` records
  `5400` write hits with `0` drops over `1014..1021`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1014..1021`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1014..1021`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `1032` writes at frames `1014/1015/1017/1019`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1021/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the third direct bridge-extracted `1014..1021` block is now closed by
    live ownership evidence at its end
  - compared with `1013`, visible sprites stay flat at `61` while bounded
    VRAM activity becomes sparse instead of contiguous inside the block
  - the Python `mode7-ppu` renderer stays on the same `10`-pixel practical
    surface already documented for frame `1021`

Next best step:

- extend the same live ownership surface to frame `1029`, which closes the
  next direct bridge-extracted `1022..1029` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-60: Frame `1029` now closes the direct bridge-extracted `1022..1029` ownership block

- Extended the live ownership surface through the fourth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1029`
  - ran a bounded live write-point trace for the whole `1022..1029` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1029` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1029`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1030 TD2_BOOT_PROBE_TRACE_START_FRAME=1022 TD2_BOOT_PROBE_TRACE_END_FRAME=1029 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1029 tools/out/visual_contract_frame1029_live_probe.json --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1029_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01029_frame.png tools/out/mesen_frame1029/main_visible.ppm --diff-out tools/out/mesen_frame1029_vs_intro1029_diff.ppm`
  - `1` mismatched pixel (`0.001744%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1029/vram.bin tools/out/mesen_frame1029/cgram.bin tools/out/mesen_frame1029/ppu_state.json tools/out/mesen_frame1029_mode7ppu.ppm --oam tools/out/mesen_frame1029/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1029_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1029/main_visible.ppm tools/out/mesen_frame1029_mode7ppu.ppm --diff-out tools/out/mesen_frame1029_mode7ppu_vs_mesen1029_diff.ppm`
  - `11` mismatched pixels (`0.019182%`)

Current reading:

- `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json` records
  `3822` write hits with `0` drops over `1022..1029`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1022..1029`
- producer domains stay inside the same late `01:9FE5` family, but now only
  one bounded write domain is still active:
  - OAM domain: `3822` writes across frames
    `1022/1023/1024/1025/1027/1028/1029`
    - dominant callsites: `00:824F` / `00:8257`
  - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1029/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the fourth direct bridge-extracted `1022..1029` block is now closed by
    live ownership evidence at its end
  - compared with `1021`, visible sprites stay flat at `61` while bounded
    producer traffic collapses from `OAM + sparse VRAM` down to `OAM` only
  - frame `1029` also lands at a near-solved local screenshot surface (`1`
    mismatched pixel), so this block is no longer merely bridge-visible

Next best step:

- extend the same live ownership surface to frame `1037`, which closes the
  next direct bridge-extracted `1030..1037` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-61: Frame `1037` now closes the direct bridge-extracted `1030..1037` ownership block

- Extended the live ownership surface through the fifth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1037`
  - ran a bounded live write-point trace for the whole `1030..1037` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1037` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1037`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1038 TD2_BOOT_PROBE_TRACE_START_FRAME=1030 TD2_BOOT_PROBE_TRACE_END_FRAME=1037 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1037 tools/out/visual_contract_frame1037_live_probe.json --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1037_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01037_frame.png tools/out/mesen_frame1037/main_visible.ppm --diff-out tools/out/mesen_frame1037_vs_intro1037_diff.ppm`
  - `29` mismatched pixels (`0.050572%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1037/vram.bin tools/out/mesen_frame1037/cgram.bin tools/out/mesen_frame1037/ppu_state.json tools/out/mesen_frame1037_mode7ppu.ppm --oam tools/out/mesen_frame1037/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1037_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1037/main_visible.ppm tools/out/mesen_frame1037_mode7ppu.ppm --diff-out tools/out/mesen_frame1037_mode7ppu_vs_mesen1037_diff.ppm`
  - `8` mismatched pixels (`0.013951%`)

Current reading:

- `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1030..1037`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1030..1037`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1030..1037`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1030` and `1034`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1037/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the fifth direct bridge-extracted `1030..1037` block is now closed by
    live ownership evidence at its end
  - compared with `1029`, visible sprites stay flat at `61`, but the bounded
    producer surface is no longer OAM-only because a narrow VRAM pulse returns
    at `1030` and `1034`
  - frame `1037` stays close to the screenshot-backed surface without any
    callback-family fork

Next best step:

- extend the same live ownership surface to frame `1045`, which closes the
  next direct bridge-extracted `1038..1045` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-62: Frame `1045` now closes the direct bridge-extracted `1038..1045` ownership block

- Extended the live ownership surface through the sixth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1045`
  - ran a bounded live write-point trace for the whole `1038..1045` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1045` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Recorded one invalid concurrency attempt before the valid rerun:
  - parallel probe + screenshot runs against the same isolated Mesen config
    both ended with `exit 255` before emitting artifacts
  - rerunning those same steps serially produced the committed outputs
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1045`
- invalid bounded attempt:
  - parallel `run_mesen_probe_boot.sh` and `run_mesen_dump_bg_range.sh`
    over the same isolated config; both ended `exit 255` without artifacts
- valid rerun:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1046 TD2_BOOT_PROBE_TRACE_START_FRAME=1038 TD2_BOOT_PROBE_TRACE_END_FRAME=1045 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1045 tools/out/visual_contract_frame1045_live_probe.json --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1045_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01045_frame.png tools/out/mesen_frame1045/main_visible.ppm --diff-out tools/out/mesen_frame1045_vs_intro1045_diff.ppm`
  - `34` mismatched pixels (`0.059291%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1045/vram.bin tools/out/mesen_frame1045/cgram.bin tools/out/mesen_frame1045/ppu_state.json tools/out/mesen_frame1045_mode7ppu.ppm --oam tools/out/mesen_frame1045/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1045_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1045/main_visible.ppm tools/out/mesen_frame1045_mode7ppu.ppm --diff-out tools/out/mesen_frame1045_mode7ppu_vs_mesen1045_diff.ppm`
  - `15` mismatched pixels (`0.026158%`)

Current reading:

- `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1038..1045`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1038..1045`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1038..1045`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1038` and `1042`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1045/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the sixth direct bridge-extracted `1038..1045` block is now closed by
    live ownership evidence at its end
  - compared with `1037`, the narrow VRAM pulse pattern remains but shifts
    later to `1038` and `1042` while visible sprites stay flat
  - parallel reuse of the same isolated Mesen config is not reliable for this
    lane; serialize probe and screenshot capture when needed

Next best step:

- extend the same live ownership surface to frame `1053`, which closes the
  next direct bridge-extracted `1046..1053` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-63: Frame `1053` now closes the direct bridge-extracted `1046..1053` ownership block

- Extended the live ownership surface through the seventh direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1053`
  - ran a bounded live write-point trace for the whole `1046..1053` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1053` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again after the `1045` concurrency
  failure:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1053`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1054 TD2_BOOT_PROBE_TRACE_START_FRAME=1046 TD2_BOOT_PROBE_TRACE_END_FRAME=1053 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1053 tools/out/visual_contract_frame1053_live_probe.json --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1053_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01053_frame.png tools/out/mesen_frame1053/main_visible.ppm --diff-out tools/out/mesen_frame1053_vs_intro1053_diff.ppm`
  - `31` mismatched pixels (`0.054060%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1053/vram.bin tools/out/mesen_frame1053/cgram.bin tools/out/mesen_frame1053/ppu_state.json tools/out/mesen_frame1053_mode7ppu.ppm --oam tools/out/mesen_frame1053/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1053_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1053/main_visible.ppm tools/out/mesen_frame1053_mode7ppu.ppm --diff-out tools/out/mesen_frame1053_mode7ppu_vs_mesen1053_diff.ppm`
  - `14` mismatched pixels (`0.024414%`)

Current reading:

- `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1046..1053`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1046..1053`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1046..1053`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1046` and `1050`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1053/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the seventh direct bridge-extracted `1046..1053` block is now closed by
    live ownership evidence at its end
  - compared with `1045`, the same narrow VRAM pulse pattern persists one
    block later and shifts again, now landing at `1046` and `1050`
  - the lane still prefers serialized Mesen capture whenever both a probe
    artifact and a local screenshot are needed

Next best step:

- extend the same live ownership surface to frame `1061`, which closes the
  next direct bridge-extracted `1054..1061` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-64: Frame `1061` now closes the direct bridge-extracted `1054..1061` ownership block

- Extended the live ownership surface through the eighth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1061`
  - ran a bounded live write-point trace for the whole `1054..1061` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1061` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1061`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1062 TD2_BOOT_PROBE_TRACE_START_FRAME=1054 TD2_BOOT_PROBE_TRACE_END_FRAME=1061 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1061 tools/out/visual_contract_frame1061_live_probe.json --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1061_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01061_frame.png tools/out/mesen_frame1061/main_visible.ppm --diff-out tools/out/mesen_frame1061_vs_intro1061_diff.ppm`
  - `36` mismatched pixels (`0.062779%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1061/vram.bin tools/out/mesen_frame1061/cgram.bin tools/out/mesen_frame1061/ppu_state.json tools/out/mesen_frame1061_mode7ppu.ppm --oam tools/out/mesen_frame1061/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1061_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1061/main_visible.ppm tools/out/mesen_frame1061_mode7ppu.ppm --diff-out tools/out/mesen_frame1061_mode7ppu_vs_mesen1061_diff.ppm`
  - `22` mismatched pixels (`0.038365%`)

Current reading:

- `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1054..1061`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1054..1061`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1054..1061`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1054` and `1058`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1061/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the eighth direct bridge-extracted `1054..1061` block is now closed by
    live ownership evidence at its end
  - compared with `1053`, the same narrow VRAM pulse pattern persists yet
    again and shifts to `1054` and `1058`, while visible sprites stay flat
  - serialized Mesen capture remains the preferred path whenever both a probe
    artifact and a local screenshot are needed

Next best step:

- extend the same live ownership surface to frame `1069`, which closes the
  next direct bridge-extracted `1062..1069` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-65: Frame `1069` now closes the direct bridge-extracted `1062..1069` ownership block

- Extended the live ownership surface through the ninth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1069`
  - ran a bounded live write-point trace for the whole `1062..1069` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1069` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1069`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1070 TD2_BOOT_PROBE_TRACE_START_FRAME=1062 TD2_BOOT_PROBE_TRACE_END_FRAME=1069 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1069 tools/out/visual_contract_frame1069_live_probe.json --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1069_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01069_frame.png tools/out/mesen_frame1069/main_visible.ppm --diff-out tools/out/mesen_frame1069_vs_intro1069_diff.ppm`
  - `48` mismatched pixels (`0.083705%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1069/vram.bin tools/out/mesen_frame1069/cgram.bin tools/out/mesen_frame1069/ppu_state.json tools/out/mesen_frame1069_mode7ppu.ppm --oam tools/out/mesen_frame1069/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1069_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1069/main_visible.ppm tools/out/mesen_frame1069_mode7ppu.ppm --diff-out tools/out/mesen_frame1069_mode7ppu_vs_mesen1069_diff.ppm`
  - `25` mismatched pixels (`0.043597%`)

Current reading:

- `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1062..1069`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1062..1069`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1062..1069`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1062` and `1066`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1069/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the ninth direct bridge-extracted `1062..1069` block is now closed by
    live ownership evidence at its end
  - compared with `1061`, the same narrow VRAM pulse pattern persists again
    and shifts to `1062` and `1066`, while visible sprites stay flat
  - screenshot-backed mismatch is rising slowly, but still without any
    callback-family fork

Next best step:

- extend the same live ownership surface to frame `1077`, which closes the
  next direct bridge-extracted `1070..1077` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-66: Frame `1077` now closes the direct bridge-extracted `1070..1077` ownership block

- Extended the live ownership surface through the tenth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1077`
  - ran a bounded live write-point trace for the whole `1070..1077` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1077` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1077`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1078 TD2_BOOT_PROBE_TRACE_START_FRAME=1070 TD2_BOOT_PROBE_TRACE_END_FRAME=1077 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1077 tools/out/visual_contract_frame1077_live_probe.json --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1077_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01077_frame.png tools/out/mesen_frame1077/main_visible.ppm --diff-out tools/out/mesen_frame1077_vs_intro1077_diff.ppm`
  - `36` mismatched pixels (`0.062779%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1077/vram.bin tools/out/mesen_frame1077/cgram.bin tools/out/mesen_frame1077/ppu_state.json tools/out/mesen_frame1077_mode7ppu.ppm --oam tools/out/mesen_frame1077/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1077_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1077/main_visible.ppm tools/out/mesen_frame1077_mode7ppu.ppm --diff-out tools/out/mesen_frame1077_mode7ppu_vs_mesen1077_diff.ppm`
  - `52` mismatched pixels (`0.090681%`)

Current reading:

- `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops over `1070..1077`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1070..1077`
- producer domains still stay inside the same late `01:9FE5` family:
  - OAM domain: `4368` writes across frames `1070..1077`
    - dominant callsites: `00:824F` / `00:8257`
  - VRAM domain: `580` writes at frames `1070` and `1074`
    - dominant callsites: `00:81E5` / `00:81F2`
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1077/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the tenth direct bridge-extracted `1070..1077` block is now closed by
    live ownership evidence at its end
  - compared with `1069`, the same narrow VRAM pulse pattern persists again
    and shifts to `1070` and `1074`, while visible sprites stay flat
  - the screenshot-backed surface stays tight, but the Python `mode7-ppu` gap
    now rises materially inside the same callback family

Next best step:

- extend the same live ownership surface to frame `1093`, which closes the
  next direct bridge-extracted `1086..1093` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-67: Frame `1085` now closes the direct bridge-extracted `1078..1085` ownership block

- Extended the live ownership surface through the eleventh direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1085`
  - ran a bounded live write-point trace for the whole `1078..1085` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1085` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1085`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1086 TD2_BOOT_PROBE_TRACE_START_FRAME=1078 TD2_BOOT_PROBE_TRACE_END_FRAME=1085 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1085 tools/out/visual_contract_frame1085_live_probe.json --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1085_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01085_frame.png tools/out/mesen_frame1085/main_visible.ppm --diff-out tools/out/mesen_frame1085_vs_intro1085_diff.ppm`
  - `74` mismatched pixels (`0.129046%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1085/vram.bin tools/out/mesen_frame1085/cgram.bin tools/out/mesen_frame1085/ppu_state.json tools/out/mesen_frame1085_mode7ppu.ppm --oam tools/out/mesen_frame1085/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1085_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1085/main_visible.ppm tools/out/mesen_frame1085_mode7ppu.ppm --diff-out tools/out/mesen_frame1085_mode7ppu_vs_mesen1085_diff.ppm`
  - `69` mismatched pixels (`0.120326%`)

Current reading:

- `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops over `1078..1085`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1078..1085`
- producer domains now collapse to a single late `01:9FE5` OAM family:
  - OAM domain: `4368` writes across frames `1078..1085`
    - dominant callsites: `00:824F` / `00:8257`
  - no sampled VRAM writes fire in the bounded `1078..1085` trace window
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1085/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the eleventh direct bridge-extracted `1078..1085` block is now closed by
    live ownership evidence at its end
  - compared with `1077`, the narrow VRAM pulse disappears entirely, leaving a
    pure-OAM ownership block under the same callback family
  - the screenshot-backed and Python `mode7-ppu` gaps now both land in the
    high double digits inside the same callback family

Next best step:

- extend the same live ownership surface to frame `1093`, which closes the
  next direct bridge-extracted `1086..1093` block under the same callback
  family
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-68: Frame `1093` now closes the direct bridge-extracted `1086..1093` ownership block

- Extended the live ownership surface through the twelfth direct
  bridge-extracted block:
  - extracted a fresh raw frame dump and design pack for `1093`
  - ran a bounded live write-point trace for the whole `1086..1093` block
  - merged that probe into a translation-facing visual contract
  - materialized a fresh local screenshot for frame `1093` in the same
    `intro_loop_frame_*` family used by the earlier late-window checkpoints
- Kept the Mesen-facing steps serialized again:
  - probe first
  - screenshot capture second
- Kept renderer-side validation on the stable Python surface again:
  - used `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
  - skipped SDL runtime validation because the local runtime worktree still has
    unrelated user edits under `port/src/td2_ppu.c`

Evidence:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release make -C tools mesen-design-pack MESEN_FRAME=1093`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=150 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1094 TD2_BOOT_PROBE_TRACE_START_FRAME=1086 TD2_BOOT_PROBE_TRACE_END_FRAME=1093 TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1093 tools/out/visual_contract_frame1093_live_probe.json --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
- produced artifacts:
  - `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json`
  - `tools/out/visual_contract_frame1093_live_probe.json`

Targeted validation:

- `python3 tools/compare_frames.py tools/out/intro_loop_frame_01093_frame.png tools/out/mesen_frame1093/main_visible.ppm --diff-out tools/out/mesen_frame1093_vs_intro1093_diff.ppm`
  - `207` mismatched pixels (`0.360979%`)
- `python3 tools/render_mesen_snes_bg.py tools/out/mesen_frame1093/vram.bin tools/out/mesen_frame1093/cgram.bin tools/out/mesen_frame1093/ppu_state.json tools/out/mesen_frame1093_mode7ppu.ppm --oam tools/out/mesen_frame1093/oam.bin --obj-renderer mode7-ppu --json-out tools/out/mesen_frame1093_mode7ppu.json`
- `python3 tools/compare_frames.py tools/out/mesen_frame1093/main_visible.ppm tools/out/mesen_frame1093_mode7ppu.ppm --diff-out tools/out/mesen_frame1093_mode7ppu_vs_mesen1093_diff.ppm`
  - `129` mismatched pixels (`0.224958%`)

Current reading:

- `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops over `1086..1093`
- the merged contract preserves exact
  `producerTrace.traceWindow = 1086..1093`
- producer domains remain inside a single late `01:9FE5` OAM family:
  - OAM domain: `4368` writes across frames `1086..1093`
    - dominant callsites: `00:824F` / `00:8257`
  - no sampled VRAM writes fire in the bounded `1086..1093` trace window
- all sampled write hits still run under active main callback `01:9FE5` with
  active IRQ callback `00:835F`
- `tools/out/design_frame1093/sprites/sprites_visible.json` reports `61`
  visible sprites
- practical reading:
  - the twelfth direct bridge-extracted `1086..1093` block is now closed by
    live ownership evidence at its end
  - the pure-OAM ownership shape survives again, but the screenshot-backed gap
    now jumps sharply while the callback family still stays flat
  - `1093` is now the promoted bridge-visible frontier for this callback
    family

Next best step:

- pivot from ownership extension to the post-`1093` composition/export nuance:
  explain why the already-documented `1094..1101` visible-state pass still
  explodes the `main_visible` compare instead of closing it
- keep the timed-input `7051` path parked until a reusable later-intro seed or
  savestate exists

### CP-69: The late `01:9FE5` window now has a consolidated callback/state range summary (`986..1093`)

- Promoted the existing per-frame live ownership proofs into one reproducible
  range artifact instead of leaving the window split across `16` isolated frame
  contracts.
- Extended the visual-contract builders so the per-frame contract can now carry
  the matching probe frame's callback/state snapshot, and the range builder can
  now map per-frame probes with `--probe-pattern`.
- Built a consolidated range index over the already-promoted late intro frames:
  - `986`, `990`, `994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`,
    `1045`, `1053`, `1061`, `1069`, `1077`, `1085`, `1093`

Evidence:

- `python3 -m py_compile tools/build_mesen_visual_contract.py tools/build_mesen_visual_contract_range.py`
- `python3 tools/build_mesen_visual_contract_range.py tools/out tools/out/visual_contract_range_986_1093_live --frame-glob 'design_frame*' --probe-pattern 'tools/out/visual_contract_probe_{frame}_live/td2_boot_probe.json' --clean-out`
- produced artifacts:
  - `tools/out/visual_contract_range_986_1093_live/visual_contract_range.json`
  - `rom_analysis/docs/intro_01_9fe5_window_986_1093.md`

Current reading:

- the sampled late window stays on one callback family for every promoted frame:
  - main callback: `01:9FE5`
  - IRQ callback: `00:835F`
- the visible presentation surface also stays fixed:
  - `bgMode = 7`
  - main-screen layers: `bg1` only
- visible OBJ growth is now explicit as one progression instead of separate
  frame notes:
  - `0` sprites at `986`
  - `5` at `990`
  - `19` at `994`
  - `32` at `998`
  - `53` at `1005`
  - `61` from `1013` through `1093`
- the later state ramp is now explicit in one timeline:
  - `$0206` stays `0` through `1021`
  - then rises `1,3,5,7,9,11,13` from `1029` through `1077`
  - `$040A` rises `6,8,10,12,14,16,17` over the same sampled frames
  - `$0054` plateaus at `128` from `1077` through `1093`
- producer ownership remains late-window-local:
  - distinct producer domains across the whole range: `oam`, `vram`
  - sampled frames with no `vram` domain: `1029`, `1085`, `1093`
- practical reading:
  - the `986..1093` surface is now strong enough to serve as the current
    callback-family anchor for the late attract path
  - the next unresolved question is no longer "what family is this?"
  - it is "what changes after `1093` that breaks the already-closed ownership
    story into a worse final-screen compare?"

Next best step:

- keep the timed-input `7051` path parked
- use the consolidated `986..1093` range summary as the source of truth while
  explaining the post-`1093` composition/export nuance and the `1094..1101`
  mismatch jump

### CP-70: The first post-`1093` continuation block is now reduced to an export/composition problem (`1094..1101`)

- Built a matching visual-contract range for the first failing continuation
  block after the promoted `1093` frontier.
- Measured the actual exported surface against the visible surface and the two
  current render candidates instead of treating `ppu_state_visible.json` as an
  assumed fix.

Evidence:

- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1094_1101_v1 tools/out/visual_contract_range_1094_1101 --provenance-json rom_analysis/maps/tilemaps/mesen_range_1094_1101_provenance.jsonc --clean-out`
- per frame `1094..1101`:
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state.json ...`
  - `python3 tools/render_mesen_snes_bg.py ... frame_xxxxx/ppu_state_visible.json ...`
  - `python3 tools/compare_frames.py ...`
- produced artifacts:
  - `tools/out/visual_contract_range_1094_1101/visual_contract_range.json`
  - `tools/out/post_1093_compare/summary.json`
  - `tools/out/post_1093_compare/summary.md`
  - `rom_analysis/docs/intro_01_9fe5_post_1093_window_1094_1101.md`

Current reading:

- `1094..1101` keeps the same late visible surface shape:
  - `bgMode = 7`
  - main-screen layers: `bg1`
  - visible OBJ count: `61`
- the visible export boundary is now explicit:
  - `main.ppm` is `256x239`
  - `main_visible.ppm` is exactly the top `224` lines of `main.ppm` for all
    `8` frames
  - the bottom `224`-line crop diverges by `13155..14143` pixels, so it is
    not the right comparison surface
- only two sampled Mode 7 fields differ between `ppu_state.json` and
  `ppu_state_visible.json`:
  - `ppu.mode7.matrix[0]`
  - `ppu.mode7.matrix[3]`
- visible-state substitution is now directly falsified:
  - base render vs `main_visible.ppm` lands at `177..574` mismatched pixels
  - visible-state render vs `main_visible.ppm` lands at `362..5930`
    mismatched pixels
- practical reading:
  - callback/layer/OBJ continuity is not the blocker after `1093`
  - export surface selection is now explained
  - the remaining open issue is the narrower render/composition behavior after
    the `1093 -> 1094` boundary

Next best step:

- keep the timed-input `7051` path parked
- use the active-trace follow-up to split the continuation into:
  - `1102..1113`
  - `1114..1117`
- test whether the residual mismatch tracks:
  - the `01:9FE5 -> 00:8029` callback switch at `1102`
  - the disappearance of the per-frame `00:0700 -> OAMDATA` DMA at `1114`
- do not keep searching for hidden direct `VRAM/CGRAM` uploads in this window
  unless a new targeted trace contradicts the current proof

### CP-71: `DOOM-FX` now has a local architecture reference note

- Cloned `https://github.com/RandalLinden/DOOM-FX` into the ignored local
  workspace `.external/DOOM-FX` and kept it out of repo status noise via
  `.git/info/exclude`.
- Read the external repo as a comparative SNES production reference instead of
  treating it as a direct porting source for `Test Drive II`.
- Added a local note:
  - `rom_analysis/docs/doom_fx_reference.md`

Evidence:

- file makeup from `.external/DOOM-FX/source`:
  - `.i`: `189`
  - `.a`: `167`
  - `.rev`: `161`
  - `.asm`: `59`
  - `.c`: `8`
- key architectural sources:
  - `.external/DOOM-FX/source/xfer.i`
  - `.external/DOOM-FX/source/xfer.a`
  - `.external/DOOM-FX/source/rlgsu.a`
  - `.external/DOOM-FX/source/rlirq.a`
  - `.external/DOOM-FX/source/rlram1.a`
  - `.external/DOOM-FX/source/rlram7.a`
  - `.external/DOOM-FX/source/title.a`
  - `.external/DOOM-FX/source/rlstatus.a`
  - `.external/DOOM-FX/source/rldraw.a`
  - `.external/DOOM-FX/source/mkray.c`

Current reading:

- `DOOM-FX` is not primarily a portable-C SNES codebase.
- The reusable value for this repo is architectural:
  - explicit transfer descriptors for `RAM/VRAM/CGRAM` style uploads
  - explicit mirrored shared-state blocks across execution domains
  - explicit phase tables with requirement/post hooks
  - aggressive offline preprocessing instead of runtime table building
- This reinforces the current `PORT_PLAN.md` direction:
  - verified behavior + stable artifacts + native runtime
  - not literal source translation

Next best step:

- keep Lane 2 on the already-open post-`1093` composition/export boundary
- use the `DOOM-FX` note as a design reference when the project is ready to
  promote a first-class transfer schema or stronger callback/phase contracts

### CP-72: `SNESdev Wiki` now has a lane-oriented knowledge bank

- Surveyed `https://snes.nesdev.org/wiki/SNESdev_Wiki` recursively through the
  first-layer hardware/reference pages most relevant to this project and one
  second-layer Mode 7 transform page.
- Added a local knowledge bank:
  - `rom_analysis/docs/snesdev_wiki_knowledge_bank.md`

Evidence:

- core pages reviewed:
  - `Memory map`
  - `ROM header`
  - `CPU vectors`
  - `MMIO registers`
  - `PPU registers`
  - `DMA registers`
  - `Backgrounds`
  - `Tilemaps`
  - `Tiles`
  - `Sprites`
  - `Palettes`
  - `Color math`
  - `Init code`
  - `VBlank interrupts`
  - `DMA examples`
  - `VBlank routine`
  - `HDMA examples`
  - `Reading and writing PPU memory`
  - `Controller reading`
  - `Standard controller`
  - second-layer follow-up: `Mode 7 transform`

Current reading:

- the wiki strongly validates the current repo direction:
  - extraction + validation + native runtime
  - not direct source translation
- the most useful pages for active work are not general tutorials:
  - `VBlank routine`
  - `Reading and writing PPU memory`
  - `PPU registers`
  - `Tilemaps`
  - `Sprites`
- the strongest conceptual fit is the producer/consumer model:
  - main-loop state preparation
  - shadow variables / buffers / queues
  - bounded NMI/VBlank upload windows
- the survey also sharpens several renderer/archeology warnings:
  - `CGRAM/OAM` write-twice semantics matter
  - OAM correctness is affected by `OBJSEL`, rotation, and per-line limits, not
    just by raw `544`-byte dumps
  - Mode 7 should be treated as base transform plus optional scanline-time
    modulation and color-math interaction

Next best step:

- keep the current lane order unchanged
- use the new knowledge bank as a hardware-reference companion while Lane 2
  continues through the post-`1093` composition/export boundary and while Lane
  4 later formalizes producer/consumer contracts around NMI-visible surfaces

### CP-73: The post-`1093` late-attract window now has an active Mesen behavior trace (`1094..1117`)

- Added a new builder:
  - `tools/build_mesen_activity_trace.py`
- Captured a bounded live probe window with `DMA`, direct `VRAM/CGRAM`, and
  `Mode 7` tracing enabled.
- Added the current reading note:
  - `rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`

Evidence:

- capture command:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1094_1117/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1118 TD2_BOOT_PROBE_TRACE_START_FRAME=1094 TD2_BOOT_PROBE_TRACE_END_FRAME=1117 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
- normalization command:
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1094_1117/td2_boot_probe.json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md`
- produced artifacts:
  - `tools/out/activity_trace_1094_1117/activity_trace.json`
  - `tools/out/activity_trace_1094_1117/activity_trace.md`
  - `rom_analysis/docs/intro_01_9fe5_activity_trace_1094_1117.md`

Current reading:

- there are no direct `VRAM/CGRAM` data writes in `1094..1117`
  - `td2_boot_probe_vram_writes.json` records `0` writes
  - normalized direct-write events: `0`
- there is exactly one repeated `OAM` DMA per frame through `1113`
  - channel `1`
  - `DMAEN = 0x02`
  - target `00:2104` (`OAMDATA`)
  - source `00:0700`
  - size `544` bytes
  - scanline `227`
- that DMA disappears entirely at `1114..1117`
- the callback-family switch is now explicit:
  - `1094..1101`: `01:9FE5`
  - `1102..1117`: `00:8029`
- the sampled state tuple stays stable across that switch:
  - `$0204 = 1`
  - `$0206 = 13`
  - `$040A = 17`
  - `$0054 = 128`
- the `Mode 7` program narrows after `1101`
  - `1094..1101`: scanlines `225`, `226`, `227`, and `231`, including `M7A/M7D`
  - `1102..1117`: scanlines `225`, `226`, `227` only, with no `M7A/M7D`

Practical reading:

- the continuation after `1093` is not one homogeneous block
- the next useful boundaries are now:
  - `1102`
  - `1114`
- the next compare/composition pass should stop treating `1102..1117` as one
  unit and should stop searching for hidden direct `VRAM/CGRAM` uploads in
  this window unless a new targeted trace contradicts the current proof

### CP-74: The `00:8029` continuation is now closed as one stable surface with one remaining compare plateau (`1102..1117`)

- Extended the visual-contract builders:
  - `tools/build_mesen_visual_contract.py`
  - `tools/build_mesen_visual_contract_range.py`
  - both now accept `--activity-trace-json`
- Added a reusable compare-summary builder:
  - `tools/build_mesen_window_compare.py`
- Added the current reading note:
  - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`

Evidence:

- activity-merged range contracts:
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1102_1109_v1 tools/out/visual_contract_range_1102_1109_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1110_1117_v1 tools/out/visual_contract_range_1110_1117_activity --provenance-json rom_analysis/maps/tilemaps/mesen_range_1110_1117_provenance.jsonc --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --clean-out`
- compare summary:
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117/summary.md`
- canonical plateau analysis:
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`
- produced artifacts:
  - `tools/out/visual_contract_range_1102_1109_activity/visual_contract_range.json`
  - `tools/out/visual_contract_range_1110_1117_activity/visual_contract_range.json`
  - `tools/out/post_1093_compare_1102_1117/summary.json`
  - `tools/out/post_1093_compare_1102_1117/summary.md`
  - `tools/out/mode7_plateau_1105/analysis.json`
  - `tools/out/mode7_plateau_1105/analysis.md`
  - `rom_analysis/docs/intro_00_8029_post_1102_window_1102_1117.md`

Current reading:

- `1102..1117` keeps the same visible surface:
  - `bgMode = 7`
  - main-screen layer `bg1`
  - `61` visible sprites
  - main callback `00:8029`
- the export surface explanation now survives through the whole tail:
  - `main_visible.ppm` is the top `224` lines of `main.ppm` on every frame
  - bottom-crop compare stays bad (`14901..21300` mismatched pixels)
- the internal activity split is narrower than the visible surface split:
  - `1102..1113`: `1` per-frame `OAM` DMA, no direct `VRAM/CGRAM` writes,
    `3` `Mode 7` events / `16` writes
  - `1114..1117`: no DMA, still no direct `VRAM/CGRAM` writes, same `Mode 7`
    event shape
- visible-state `Mode 7` substitution is only still wrong at:
  - `1102..1104`
- by `1105`, the base and visible-state matrices already agree
  (`matrix[0]/matrix[3] = 256/257`)
- the remaining renderer gap is now one stable plateau:
  - `1105..1117` -> `2698` mismatched pixels against `main_visible.ppm`
- the updated compare summary now proves that plateau is exactly the same
  spatial/content diff on every frame `1105..1117`:
  - same diff-mask hash
  - same diff payload hash
  - same bounding box `24,68 -> 232,138`
- the same compare artifact now also proves that from `1105..1117`:
  - `main_visible.ppm` is byte-identical
  - `vram.bin` is byte-identical
  - `oam.bin` is byte-identical
  - `ppu_state.json` is byte-identical
  - only `cgram.bin` keeps changing frame to frame
- canonical frame-`1105` object checks now read:
  - `mode7-ppu`: `2698` mismatched pixels
  - `simple`: `2698`
  - no-`OAM`: `9717`
- the new canonical plateau analyzer now adds:
  - `bg1_visible.ppm` is also byte-identical from `1105..1117`
  - no-`OAM` vs `bg1_visible.ppm`: `3982` mismatched pixels
  - BG-only diff box: `24,67 -> 232,138`
  - only `4` sprites touch the main plateau diff box
  - their combined coverage there is just `128 / 14839` pixels
    (`0.862592%`)
  - a whole-box horizontal shift of `-1` improves the BG-only compare
    `3982 -> 3611`
  - a direct `ppu.mode7.hscroll +1` perturbation also improves the BG-only
    compare `3982 -> 3613`
  - but the same perturbation worsens the full-scene compare
    `2698 -> 2780`
  - per-row best-shift counts still favor `-1` on `38` rows

Practical reading:

- the late `00:8029` continuation no longer looks like an ownership or upload
  mystery
- the best current Lane 2 frontier is the static `1105..1117` `Mode 7/BG1`
  plateau, not sprite ownership
- the `1114` `OAM DMA` shutdown is now proven not to be the cause of that
  plateau
- the remaining narrowing now points away from an OBJ-renderer fork and toward
  fixed `Mode 7/BG1` horizontal sampling, rounding, or edge semantics inside
  one canonical static scene
- the `hscroll +1` result is now a useful clue about the coordinate path, but
  not a drop-in fix

### CP-75: Doc-driven `Mode 7` narrowing demotes `M7SEL` edge handling on canonical `1105`

- Added doc/reference checkpoint:
  - `rom_analysis/docs/mode7_1105_validation_reference.md`
- Extended plateau builder:
  - `tools/build_mode7_plateau_analysis.py`
  - now reports explicit `Mode 7` sampling stats for the plateau bboxes
- Rebuilt canonical plateau artifact:
  - `tools/out/mode7_plateau_1105/analysis.json`
  - `tools/out/mode7_plateau_1105/analysis.md`

Validation:

- `python3 -m py_compile tools/build_mode7_plateau_analysis.py`
- `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105/analysis.json --markdown-out tools/out/mode7_plateau_1105/analysis.md`

Current reading:

- the external doc/source cross-check now agrees on the important core point:
  - the repo renderer already follows the same operational `Mode 7` shape used
    by `fullsnes` and `Mesen-S`
- the canonical plateau state keeps these features inactive:
  - `EXTBG`
  - direct color
  - color math
  - subscreen layering
- the new sampling stats now prove the plateau bbox never touches the outside-map
  path at all:
  - main bbox `24,68 -> 232,138`: `outsideMapPixels = 0`
  - BG bbox `24,67 -> 232,138`: `outsideMapPixels = 0`
  - best tested BG-only `hscroll +1` variant: still `outsideMapPixels = 0`
- concrete sample ranges on the BG bbox:
  - base `hscroll = 0`: `x = 24..232`, `y = 65..137`
  - best tested BG-only `hscroll = +1`: `x = 25..233`, `y = 65..137`

Practical reading:

- `M7SEL` outside-map fill/transparent behavior is no longer a leading suspect
  for the canonical plateau
- the next highest-value renderer checks are now:
  - X-origin / first-pixel placement
  - visible-latched `M7HOFS/M7VOFS` timing
  - only then residual full-scene composition outside the BG-only box

### CP-76: Exact-hit first-pixel audit promotes `screenY + 1` to the leading plateau fix

- Added exact-hit source note:
  - `rom_analysis/docs/mode7_1105_exact_hit_sources.md`
- Added first-pixel audit tool:
  - `tools/build_mode7_first_pixel_audit.py`
- Added plateau audit note:
  - `rom_analysis/docs/mode7_plateau_first_pixel_audit.md`
- Added canonical audit artifacts:
  - `tools/out/mode7_first_pixel_1105/audit.json`
  - `tools/out/mode7_first_pixel_1105/audit.md`
- Added plateau-tail confirmation artifacts:
  - `tools/out/mode7_plateau_1117/analysis.json`
  - `tools/out/mode7_plateau_1117/analysis.md`
  - `tools/out/mode7_first_pixel_1117/audit.json`
  - `tools/out/mode7_first_pixel_1117/audit.md`

Validation:

- `python3 -m py_compile tools/build_mode7_first_pixel_audit.py`
- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1105/analysis.json tools/out/mode7_first_pixel_1105/audit.json --markdown-out tools/out/mode7_first_pixel_1105/audit.md`
- `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1117/analysis.json --canonical-frame 1117 --markdown-out tools/out/mode7_plateau_1117/analysis.md`
- `python3 tools/build_mode7_first_pixel_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_first_pixel_1117/audit.json --markdown-out tools/out/mode7_first_pixel_1117/audit.md`

Current reading:

- focused visible-state `Mode 7` deltas are absent on both tested plateau ends:
  - `ppu_state.json`
  - `ppu_state_visible.json`
  - no focused `Mode 7` key differs in either audit
- `increment-before-sample` and `X-origin +1` collapse to the same result on
  this plateau state:
  - full scene `2780`
  - BG-only `3613`
  - equivalence is expected here because the canonical plateau keeps
    `M7A = 256` and `M7C = 0`
- the first tested rule that actually closes the composed scene is
  `screenY + 1`:
  - frame `1105`: full-scene compare `2698 -> 0`
  - frame `1117`: full-scene compare `2698 -> 0`
- the same rule does **not** close the isolated layer export:
  - `bg1_visible` compare improves `3982 -> 2271`
  - so the composed-screen fix and the isolated-layer export mismatch are now
    separate questions

Practical reading:

- the static plateau is no longer best read as an `M7HOFS/M7VOFS`
  visible-latch problem
- the strongest renderer candidate is now the scanline-start term used by the
  composed-screen `Mode 7` path
- the next defensible step is to promote the `screenY + 1` candidate into the
  renderer/compare path and then re-check `1102..1104` plus the isolated
  `bg1_visible` export semantics

### CP-77: Vertical line-origin source pass isolates the remaining `Y` conflict

- Added focused source note:
  - `rom_analysis/docs/mode7_line_origin_y_sources.md`
- Updated plateau audit note:
  - `rom_analysis/docs/mode7_plateau_first_pixel_audit.md`

Validation:

- source-only checkpoint; no local runtime/tool behavior changed

Current reading:

- under the stricter allowed-source filter:
  - `fullsnes` is the only explicit `line + 1` hardware-oriented source
  - `Mesen-S` is the only allowed implementation comparison and uses
    current-line `Y`
  - `SNESdev` confirms only that `M7SEL` owns vertical flip and `M7Y` is the
    center term
  - the public `snes-test-roms` surface still has no dedicated first-visible-
    line `Mode 7` test for this question
  - indirect timing surfaces now also exist but stay below proof level:
    - the NESdev `93143` discussion suggests per-line preprocessing and a
      "current state for the line" mental model for `Mode 7`
    - `SNESdev` `HDMA_examples` proves scanline-level timing/latch hazards are
      real for write-twice PPU state, including `M7A`
- the allowed sources still agree on the ordering around `Y`:
  - choose one scanline `Y`
  - apply vertical mirroring before the transform contribution
  - keep that `Y` shared across the scanline while `X` advances per pixel

Practical reading:

- the plateau result `screenY + 1 -> 0 mismatched pixels` is still not a blind
  tweak; it matches the only explicit `line + 1` hardware-oriented source we
  have under the strict filter
- but the stricter pass also proves the renderer frontier is still an explicit
  unresolved conflict, not a settled hardware fact
- the next step should therefore promote the `line + 1` candidate carefully,
  while preserving the tie in the docs until a hardware-oriented proof surface
  breaks it

### CP-78: Frame-`300` regolden keeps the builder exact and the old SDL runtime gap unchanged

- Re-tested the promoted frame-`300` credits scene against the current local
  worktree without touching the existing committed builder artifacts:
  - `python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene_regolden_20260322`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_vs_mesen_diff.ppm`
  - `python3 tools/render_mesen_snes_bg.py tools/out/bank1_credits_scene_regolden_20260322_vram.bin tools/out/bank1_credits_scene_regolden_20260322_cgram.bin tools/out/bank1_credits_scene_regolden_20260322_ppu_state.json tools/out/bank1_credits_scene_regolden_20260322_python.ppm`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322_python.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_python_vs_mesen_diff.ppm`
  - `make -C port`
  - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --headless --snes-bg-prefix ./tools/out/bank1_credits_scene_regolden_20260322 --frames 1 --dump-prefix ./port/build/credits_regolden_20260322`
  - `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_mesen_diff.ppm`
  - `python3 tools/compare_frames.py tools/out/bank1_credits_scene_regolden_20260322.ppm port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_builder_diff.ppm`
- New evidence:
  - all canonical frame-`300` screenshot PNGs still hash to the same payload:
    - `tools/out/td2_boot_probe_frame_300.png`
    - `tools/out/frame300_live_probe/td2_boot_probe_frame.png`
    - `tools/out/frame300_live_probe_cap2048/td2_boot_probe_frame.png`
    - `tools/out/frame300_live_probe_fulltrace/td2_boot_probe_frame.png`
  - rebuilt ROM-side credits scene stays exact:
    - screenshot vs `bank1_credits_scene_regolden_20260322.ppm`: `0`
      mismatched pixels
  - Python renderer stays exact on the rebuilt artifacts:
    - screenshot vs `bank1_credits_scene_regolden_20260322_python.ppm`: `0`
      mismatched pixels
    - rebuilt builder PPM vs Python renderer PPM: `0` mismatched pixels
  - SDL runtime output is unchanged from the old local gap:
    - screenshot vs `port/build/credits_regolden_20260322_00000.ppm`:
      `7244` mismatched pixels (`12.632533%`)
    - builder PPM vs the same runtime dump: `7244` mismatched pixels
    - mismatch bbox: `16,56 -> 222,167`
    - the newly generated diff files are byte-identical to the pre-existing
      `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`
    - the runtime output hash matches the older local `credits_native*` dumps
- Practical reading:
  - the frame-`300` golden point itself has not regressed
  - the exact solved surface still covers:
    - captured screenshot
    - ROM-side builder
    - Python SNES BG renderer
  - the SDL runtime still carries the same historical credits-scene gap, so
    frame `300` should not be described as a zero-diff runtime parity milestone
  - no roadmap pivot is justified from this retest; the active Lane 2 gate
    remains the late `Mode 7/BG1` scanline-start semantics around `1102..1117`

### CP-79: Controlled `line + 1` promotion closes the whole composed-screen window and leaves BG1 isolated

- Promoted the `screenY + 1` hypothesis into the Python renderer-side compare
  path without touching the dirty SDL runtime worktree:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_mesen_window_compare.py`
  - `tools/build_mode7_plateau_analysis.py`
- New promoted artifacts:
  - `tools/out/post_1093_compare_1102_1117_linebias1/summary.json`
  - `tools/out/post_1093_compare_1102_1117_linebias1/summary.md`
  - `tools/out/mode7_plateau_1105_linebias1/analysis.json`
  - `tools/out/mode7_plateau_1105_linebias1/analysis.md`
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_mesen_window_compare.py tools/build_mode7_plateau_analysis.py`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117_linebias1/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --mode7-line-bias 1 --markdown-out tools/out/post_1093_compare_1102_1117_linebias1/summary.md`
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117_linebias1/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105_linebias1/analysis.json --canonical-frame 1105 --mode7-line-bias 1 --markdown-out tools/out/mode7_plateau_1105_linebias1/analysis.md`
  - direct BG-only spot checks:
    - frame `1102`: `6031 -> 6032` (`line_bias 0 -> 1`)
    - frame `1103`: `6003 -> 5966`
    - frame `1104`: `6353 -> 6176`
    - frame `1105`: `3982 -> 2271`
    - frame `1117`: `3982 -> 2271`
- New evidence:
  - base render vs `main_visible.ppm` with `--mode7-line-bias 1`:
    - `1102`: `838 -> 0`
    - `1103`: `1061 -> 0`
    - `1104`: `1798 -> 0`
    - `1105..1117`: `2698 -> 0`
  - visible-state render vs `main_visible.ppm` with the same bias:
    - `1102`: `6082 -> 6045`
    - `1103`: `5958 -> 5951`
    - `1104`: `6292 -> 6066`
    - `1105..1117`: `2698 -> 0`
  - updated canonical `1105` plateau analysis now survives the zero-diff
    composed-screen case:
    - `mainDiffBBox = none`
    - fallback sampling bbox: `24,67 -> 231,120`
    - `mode7-ppu` with OAM vs `main_visible.ppm`: `0`
    - `simple` with OAM vs `main_visible.ppm`: `0`
    - no-`OAM` vs `main_visible.ppm`: `7019`
    - no-`OAM` vs `bg1_visible.ppm`: `2271`
    - best tested hscroll delta is now `0` for both full-scene and BG-only
- Practical reading:
  - the composed-screen `Mode 7` rule is no longer hypothetical; the regular
    Python compare path now closes the whole `1102..1117` window under
    `line + 1`
  - the surviving `1102..1104` visible-state mismatch is now a narrower
    state-selection issue, not evidence against the promoted composed-screen
    rule
  - the active Lane 2 frontier has moved again:
    - no longer "which scanline-start term closes the scene?"
    - now "should `line + 1` become default renderer behavior, and what still
      explains the isolated `bg1_visible`/layer-export mismatch that remains
      after the scene is closed?"

### CP-80: Sampled regression sweep makes `line + 1` look broader than the late `00:8029` slice

- Ran a bounded direct render/compare sweep with `render_mesen_snes_bg.py` plus
  `compare_frames.py` over known `Mode 7` anchors, testing both
  `--mode7-line-bias 0` and `--mode7-line-bias 1`:
  - `978`
  - `982`
  - `986`
  - `990`
  - `994`
  - `1080`
  - `1200`
- New evidence:
  - frame `978`: `4 -> 0`
  - frame `982`: `4 -> 1`
  - frame `986`: `270 -> 266`
  - frame `990`: `1641 -> 1638`
  - frame `994`: `3232 -> 3228`
  - frame `1200`: `5249 -> 2551`
  - frame `1080`: `14813 -> 14816`
- Practical reading:
  - the `line + 1` rule is no longer only a plausible fix for the late
    `1102..1117` continuation
  - sampled anchors now show it is either beneficial or effectively neutral on
    every tested `Mode 7` frame except one tiny `+3` regression on the still-
    unsolved frame `1080`
  - that makes the next renderer decision much more concrete:
    - promotion to the default Python `Mode 7` path is now a defensible
      engineering move
    - but the strict hardware-proof tie (`fullsnes` vs `Mesen-S`) is still
      unresolved, so keeping `--mode7-line-bias 0` as an explicit escape hatch
      would still be prudent if that promotion happens

### CP-81: `line + 1` is now the official Python `Mode 7` rule, with SDL deferred behind a dirty-runtime boundary

- Compared the two active methods in the clean tooling path:
  - legacy current-line default (`--mode7-line-bias 0`)
  - promoted `line + 1` default (`--mode7-line-bias 1`)
- Promoted `line + 1` into the default Python renderer/builders without
  touching the dirty SDL runtime file:
  - `tools/render_mesen_snes_bg.py`
  - `tools/build_mesen_window_compare.py`
  - `tools/build_mode7_plateau_analysis.py`
- Validation:
  - `python3 -m py_compile tools/render_mesen_snes_bg.py tools/build_mesen_window_compare.py tools/build_mode7_plateau_analysis.py`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1093_compare_1102_1117_default/summary.json tools/out/mesen_range_1102_1109_v1 tools/out/mesen_range_1110_1117_v1 --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json --markdown-out tools/out/post_1093_compare_1102_1117_default/summary.md`
  - `python3 tools/build_mode7_plateau_analysis.py tools/out/post_1093_compare_1102_1117_default/summary.json tools/out/design_mesen_range_1102_1109_v1 tools/out/design_mesen_range_1110_1117_v1 tools/out/mode7_plateau_1105_default/analysis.json --canonical-frame 1105 --markdown-out tools/out/mode7_plateau_1105_default/analysis.md`
  - metadata-scrubbed compare against the earlier explicit `--mode7-line-bias 1`
    artifacts:
    - compare summary: identical after dropping path/timestamp-only fields
    - plateau analysis: identical except for the expected `compareSummaryPath`
      rebinding to the new default summary
- New evidence:
  - the no-flag default compare summary now reports the same operational
    closure as the earlier explicit `line + 1` run:
    - base render vs `main_visible.ppm`: `0` across `1102..1117`
    - visible-state render vs `main_visible.ppm`: `6045/5951/6066/0`
      at `1102/1103/1104/1105..1117`
  - the no-flag canonical plateau analysis now reports the same solved
    composed-screen read:
    - `mode7LineBias = 1`
    - `mainVisibleCompare.mode7PpuMismatchPixels = 0`
    - `bg1VisibleCompare.mismatchPixels = 2271`
    - sampling bbox unchanged: `24,67 -> 231,120`
  - practical comparison with the older current-line method remains the same as
    the prior sweep:
    - `978`: `4 -> 0`
    - `982`: `4 -> 1`
    - `986`: `270 -> 266`
    - `990`: `1641 -> 1638`
    - `994`: `3232 -> 3228`
    - `1200`: `5249 -> 2551`
    - `1080`: `14813 -> 14816`
- Practical reading:
  - the project now has one official `Mode 7` rule for the active evidence path:
    - Python renderer/builders default to `line + 1`
    - `--mode7-line-bias 0` remains available only for counterfactual runs
  - that choice is strong enough for the rest of Lane 2 because it reproduces
    the earlier explicit solved artifacts and keeps the only known downside to
    a tiny `+3` change on still-unsolved frame `1080`
  - the same rule is **not** yet promoted into the SDL runtime:
    - `port/src/td2_ppu.c` is already dirty from another process
    - changing it here would mix a policy decision with unrelated runtime work
  - the active frontier therefore stays narrow:
    - keep using the new default Python rule
    - isolate the remaining `bg1_visible` mismatch
    - revisit SDL promotion only after the runtime file is clean

### CP-82: Shared `td2_ppu.c` was patchable after all; the real validation trap was the default sequence manifest

- Re-audited the active worktree conflict around `port/src/td2_ppu.c`.
- File-level reading:
  - the other-process delta in `td2_ppu.c` touches:
    - layer-state JSON loading
    - ad hoc BG debug logging
  - it does **not** overlap the `render_snes_mode7_scene()` line-origin block
    at `screen_y -> real_y`
- Promoted the same `line + 1` rule into the shared SDL runtime with a
  surgical patch in `render_snes_mode7_scene()`:
  - `line_y = screen_y + 1`
  - `real_y = vertical_mirroring ? (255 - line_y) : line_y`
- Validation:
  - `make -C port`
  - isolated runtime renders, explicitly suppressing the default intro-loop
    manifest with `--sequence /dev/null`:
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1102 --snes-bg-vram ./tools/out/mesen_range_1102_1109_v1/frame_01102/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1102_1109_v1/frame_01102/cgram.bin --snes-bg-state ./tools/out/mesen_range_1102_1109_v1/frame_01102/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1102_1109_v1/frame_01102/oam.bin`
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1105 --snes-bg-vram ./tools/out/mesen_range_1102_1109_v1/frame_01105/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1102_1109_v1/frame_01105/cgram.bin --snes-bg-state ./tools/out/mesen_range_1102_1109_v1/frame_01105/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1102_1109_v1/frame_01105/oam.bin`
    - `SDL_VIDEODRIVER=dummy ./port/build/td2_port --sequence /dev/null --headless --frames 1 --dump-prefix ./port/build/mode7_1117 --snes-bg-vram ./tools/out/mesen_range_1110_1117_v1/frame_01117/vram.bin --snes-bg-cgram ./tools/out/mesen_range_1110_1117_v1/frame_01117/cgram.bin --snes-bg-state ./tools/out/mesen_range_1110_1117_v1/frame_01117/ppu_state.json --snes-bg-oam ./tools/out/mesen_range_1110_1117_v1/frame_01117/oam.bin`
  - compares against extracted `main_visible.ppm`:
    - `1102`: `0`
    - `1105`: `0`
    - `1117`: `0`
  - temporary `HEAD` rebuild for control:
    - built `/tmp/td2_port_head` from `HEAD:port/src/td2_ppu.c`
    - same isolated scene path remains at:
      - `1102`: `838`
      - `1105`: `2698`
- Practical reading:
  - the shared-file conflict was weaker than it looked:
    - the other process was active in the same file, but not in the same
      semantic block
    - the runtime patch could be merged isonomically without reverting or
      trampling those edits
  - the earlier near-full-screen mismatch was a validation trap, not a runtime
    regression:
    - `td2_port` auto-loads the default intro sequence unless told otherwise
    - isolated `--snes-bg-*` validation must therefore neutralize that path
      with `--sequence /dev/null` (or another empty manifest)
  - the remaining Lane 2 frontier is again the BG-only/export side, not a
    worktree blocker in the runtime file

### CP-83: Bounded export audit demotes more local `Mode 7` tweaks as the explanation for `bg1_visible`

- Added a dedicated bounded export-side audit:
  - `tools/build_mode7_bg1_export_audit.py`
- Promoted artifacts:
  - `tools/out/mode7_bg1_export_audit_1105/audit.json`
  - `tools/out/mode7_bg1_export_audit_1105/audit.md`
  - `tools/out/mode7_bg1_export_audit_1117/audit.json`
  - `tools/out/mode7_bg1_export_audit_1117/audit.md`
  - `rom_analysis/docs/mode7_bg1_export_semantics.md`
- Validation:
  - `python3 -m py_compile tools/build_mode7_bg1_export_audit.py`
  - `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1105_default/analysis.json tools/out/mode7_bg1_export_audit_1105/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1105/audit.md`
  - `python3 tools/build_mode7_bg1_export_audit.py tools/out/mode7_plateau_1117/analysis.json tools/out/mode7_bg1_export_audit_1117/audit.json --markdown-out tools/out/mode7_bg1_export_audit_1117/audit.md`
- Audit grid:
  - plateau endpoints `1105` and `1117`
  - `36` models per endpoint
  - swept dimensions:
    - `yLineBias = 0/1`
    - `xOriginBias = -1/0/1`
    - `hscrollBias = -1/0/1`
    - sample order `pre/post`
- New evidence:
  - both endpoints agree exactly
  - best BG-only overall:
    - `base_y+1_x+0_h+0_pre`
    - BG-only `2271`
    - main `0`
  - best BG-only with `main = 0` is the same model
  - `5 / 36` models keep the composed scene at `0`
  - none of those `5` models improves the BG-only export below `2271`
  - tied `main = 0` family:
    - `base_y+1_x+0_h+0_pre`
    - `base_y+1_x-1_h+0_post`
    - `base_y+1_x+0_h-1_post`
    - `base_y+1_x-1_h+1_pre`
    - `base_y+1_x+1_h-1_pre`
    - all still land at BG-only `2271`
- Practical reading:
  - once the composed scene is already solved, the remaining `bg1_visible`
    gap is stable against the obvious next local `Mode 7` perturbations
  - that makes the frontier sharper:
    - stop expecting one more small renderer-side `Mode 7` tweak to close the
      layer export
    - treat `layers/bg1_visible.ppm` as a separate export-surface semantics
      problem instead

### CP-84: Visible-crop audit closes the late-attract `bg1_visible` extractor question

- Added extractor-semantic audit tool:
  - `tools/build_mesen_visible_crop_audit.py`
- Promoted artifacts:
  - `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json`
  - `tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`
  - `rom_analysis/docs/mode7_bg1_export_semantics.md`
- Validation:
  - `python3 -m py_compile tools/build_mesen_visible_crop_audit.py`
  - `python3 tools/build_mesen_visible_crop_audit.py tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json tools/out/design_mesen_range_1102_1109_v1/frame_01102 tools/out/design_mesen_range_1102_1109_v1/frame_01105 tools/out/design_mesen_range_1110_1117_v1/frame_01117 --markdown-out tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md`
- Source cross-check:
  - `tools/mesen_ppu_extract/Program.cs` writes the full `GetTilemap(...)`
    layer render first and then derives `*_visible.ppm` via:
    - `NormalizeScroll(info.ScrollX, size.Width)`
    - `NormalizeScroll(info.ScrollY, size.Height)`
    - `CropVisibleRegion(...)`
- New evidence:
  - frames `1102`, `1105`, and `1117` all land at `0` mismatched pixels
    between:
    - committed `layers/bg1_visible.ppm`
    - a local recomputed crop of `layers/bg1.ppm`
  - the audited metadata is stable across those frames:
    - full size `1024x1024`
    - visible size `256x224`
    - raw scroll `0,8191`
    - normalized scroll `0,0`
- Practical reading:
  - the late-attract `bg1_visible` mismatch is now explained concretely as
    bridge/extractor semantics
  - `layers/bg1_visible.ppm` is a viewer-style viewport crop of the full layer
    render, not the exact on-screen `BG1` contribution target
  - for this slice, renderer parity should stay pinned to `main_visible.ppm`
    while `layers/*_visible.ppm` should only be used for viewer/export
    questions
  - the next Lane 2 step should return to later-window continuity beyond
    `1117`, not more local `Mode 7` tweaking against `bg1_visible`

### CP-85: The stable `00:8029` late-attract continuation now extends through `1125`

- Promoted artifacts:
  - `tools/out/design_mesen_range_1118_1125_v1/design_pack_range.json`
  - `tools/out/activity_trace_1118_1125/activity_trace.json`
  - `tools/out/activity_trace_1118_1125/activity_trace.md`
  - `tools/out/visual_contract_range_1118_1125_activity/visual_contract_range.json`
  - `tools/out/post_1117_compare_1118_1125/summary.json`
  - `tools/out/post_1117_compare_1118_1125/summary.md`
  - `rom_analysis/docs/intro_00_8029_post_1117_window_1118_1125.md`
- Validation:
  - `python3 -m py_compile tools/build_mesen_design_pack.py tools/build_mesen_design_pack_range.py tools/build_mesen_visual_contract_range.py tools/build_mesen_window_compare.py`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1121 --end-frame 1125 --step 1 --out-dir tools/out/mesen_range_1118_1125_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1118_1125_v1 tools/out/design_mesen_range_1118_1125_v1 --clean-out`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1118_1125/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1126 TD2_BOOT_PROBE_TRACE_START_FRAME=1118 TD2_BOOT_PROBE_TRACE_END_FRAME=1125 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1118_1125/td2_boot_probe.json tools/out/activity_trace_1118_1125/activity_trace.json --markdown-out tools/out/activity_trace_1118_1125/activity_trace.md`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1118_1125_v1 tools/out/visual_contract_range_1118_1125_activity --probe-json tools/out/activity_trace_1118_1125/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1118_1125/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1118_1125/summary.json tools/out/mesen_range_1118_1125_v1 --activity-trace-json tools/out/activity_trace_1118_1125/activity_trace.json --markdown-out tools/out/post_1117_compare_1118_1125/summary.md`
- Tooling follow-up included in the same turn:
  - `tools/build_mesen_window_compare.py` now tolerates windows that do not
    export `ppu_state_visible.json`; the summary reports visible-state mismatch
    as unavailable instead of throwing on an empty set
- New evidence:
  - sampled frames `1118..1125` all keep the same late-attract behavior:
    - main callback `00:8029`
    - IRQ callback `00:835F`
    - visible surface `bg1` with `61` visible sprites
    - `$0204 = 1`, `$0206 = 13`, `$040A = 17`, `$0054 = 128`
  - producer-side activity also stays flat:
    - DMA events: `0`
    - direct `VRAM/CGRAM` events: `0`
    - `Mode 7` events: `3` per frame
    - `Mode 7` writes: `16` per frame
  - export/composed-scene compare stays solved:
    - top `224` rows of `main.ppm` vs `main_visible.ppm`: `0` mismatched pixels
    - default base render vs `main_visible.ppm`: `0` mismatched pixels
    - bottom-crop compare remains the same non-visible counterexample at
      `21300` mismatched pixels
- Practical reading:
  - the measured `00:8029` continuation is no longer capped at `1117`; it now
    extends at least through `1125`
  - there is still no basis to extend tilemap-to-ROM provenance beyond `1117`
    on carry alone, because this checkpoint closes continuity and renderer
    behavior, not a new runtime chunk anchor
  - the next Lane 2 step should therefore move later than `1125`, not back to
    the resolved `1118..1125` steady block or the demoted `bg1_visible`
    export question

### CP-86: The late `00:8029` tail now has an internal producer boundary at `1164/1165`

- Promoted artifacts:
  - `tools/out/activity_trace_1126_1133/activity_trace.json`
  - `tools/out/activity_trace_1126_1133/activity_trace.md`
  - `tools/out/post_1117_compare_1126_1133/summary.json`
  - `tools/out/post_1117_compare_1126_1133/summary.md`
  - `tools/out/visual_contract_range_1126_1133_activity/visual_contract_range.json`
  - `tools/out/activity_trace_1134_1200/activity_trace.json`
  - `tools/out/activity_trace_1134_1200/activity_trace.md`
  - `tools/out/activity_trace_1164_1172/activity_trace.json`
  - `tools/out/activity_trace_1164_1172/activity_trace.md`
  - `tools/out/post_1117_compare_1164_1172/summary.json`
  - `tools/out/post_1117_compare_1164_1172/summary.md`
  - `tools/out/visual_contract_range_1164_1172_activity/visual_contract_range.json`
  - `rom_analysis/docs/intro_00_8029_post_1125_reactivation_1164_1172.md`
- Validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1126_1133/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1134 TD2_BOOT_PROBE_TRACE_START_FRAME=1126 TD2_BOOT_PROBE_TRACE_END_FRAME=1133 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1126_1133/td2_boot_probe.json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/activity_trace_1126_1133/activity_trace.md`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1126 --end-frame 1133 --step 1 --out-dir tools/out/mesen_range_1126_1133_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1126_1133_v1 tools/out/design_mesen_range_1126_1133_v1 --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1126_1133_v1 tools/out/visual_contract_range_1126_1133_activity --probe-json tools/out/activity_trace_1126_1133/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1126_1133/summary.json tools/out/mesen_range_1126_1133_v1 --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/post_1117_compare_1126_1133/summary.md`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1134_1200/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1201 TD2_BOOT_PROBE_TRACE_START_FRAME=1134 TD2_BOOT_PROBE_TRACE_END_FRAME=1200 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/activity_trace.json --markdown-out tools/out/activity_trace_1134_1200/activity_trace.md`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1164_1172/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1173 TD2_BOOT_PROBE_TRACE_START_FRAME=1164 TD2_BOOT_PROBE_TRACE_END_FRAME=1172 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1164_1172/td2_boot_probe.json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/activity_trace_1164_1172/activity_trace.md`
  - `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1164 --end-frame 1172 --step 1 --out-dir tools/out/mesen_range_1164_1172_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
  - `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1164_1172_v1 tools/out/design_mesen_range_1164_1172_v1 --clean-out`
  - `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1164_1172_v1 tools/out/visual_contract_range_1164_1172_activity --probe-json tools/out/activity_trace_1164_1172/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --clean-out`
  - `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1164_1172/summary.json tools/out/mesen_range_1164_1172_v1 --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/post_1117_compare_1164_1172/summary.md`
- New evidence:
  - the exact `00:8029` continuation now also closes the next sampled block:
    - `1126..1133` keep `0` top-crop mismatch and `0` base-render mismatch
    - `bg1` stays the only main-screen layer and visible OBJ count stays `61`
    - DMA/direct activity stays flat at `0`, with `Mode 7` activity fixed at
      `3` events and `16` writes per frame
  - the wider frontier probe then narrows the next real change:
    - `1134..1163` remain on the same no-DMA surface under
      `00:8029/00:835F`
    - `1164` steps `state0204: 1 -> 2` and `dp0054: 128 -> 136`
    - `1165` is the first producer-reactivation frame
  - the narrowed `1164..1172` window makes that change concrete:
    - callback family still stays `00:8029/00:835F`
    - exact composed-scene compare still holds at `0` mismatched pixels
    - `1165..1172` renew `00:0700` OAM DMA
    - the first sampled VRAM DMA producers rotate across:
      - `1165` -> `1A:AB58`
      - `1170` -> `1A:ACA0`
      - `1172` -> `1A:AA10`
    - burst frames raise `Mode 7` writes from `16` to `274`
- Practical reading:
  - the next later-window Lane 2 boundary is no longer "where does `00:8029`
    continue?" but "what owns the reactivated `00:8029` producer cycle?"
  - the new boundary at `1164/1165` is a producer-side state/upload change,
    not a callback-family handoff or a composed-scene regression
  - tilemap-to-ROM provenance still stays capped at `1117`, because this
    checkpoint closes continuity and the next upload boundary, not a new direct
    runtime chunk anchor

### CP-87: The late `00:8029` producer cycle now has explicit blob and ownership proof

- Promoted artifacts:
  - `tools/build_mode7_blob_cycle_report.py`
  - `tools/out/mode7_blob_cycle_1134_1200/report.json`
  - `tools/out/mode7_blob_cycle_1134_1200/report.md`
  - `rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- Validation:
  - `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
  - `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`
- New evidence:
  - the new report matches every sampled direct `VMDATA` burst frame in
    `1134..1200` against the same ROM blob label seen on the paired `DMA0`
    source:
    - `AA10`
    - `AB58`
    - `ACA0`
  - the direct burst side alternates only between the two earlier late-attract
    Mode 7 destinations:
    - `VMADD = 0x4920`
    - `VMADD = 0x49A0`
  - `OAM` DMA remains the normal staged path:
    - source `00:0700`
    - size `0x0220`
    - target `OAMDATA`
  - static ownership is now tied to concrete routines:
    - `01:B6E3` advances the late state loop and re-enters `01:9DC6`
    - `01:9DC6` rebuilds the scene/OAM work with repeated `00:9662` calls and
      always ends in `00:95BD`
    - `00:95BD` arms `$096A`
    - the bank-0 NMI path consumes `$096A` and DMAs `$0700 -> OAMDATA`
  - this also links the late `1165+` cycle back to the already-promoted native
    bridge-visible model family:
    - the same `AA10/AB58/ACA0` blobs
    - the same `0x4920/0x49A0` destinations used by
      `build_mode7_source_scene.py`
- Practical reading:
  - the lane no longer has an open "who owns the late `00:8029` producer
    cycle?" question
  - the remaining open question is the later-frame selection/schedule rule that
    chooses which blob lands on which target for native replacement purposes
  - tilemap-to-ROM provenance still stays capped at `1117`, because this turn
    closes producer ownership and blob identity, not a new direct tilemap chunk
    anchor

### CP-88: Lane 2 now has an explicit next-agent handoff after `00:8029` ownership closure

- Promoted artifacts:
  - `rom_analysis/docs/intro_00_8029_next_agent_handoff.md`
- Validation:
  - `git diff --check -- rom_analysis/docs/intro_00_8029_next_agent_handoff.md rom_analysis/docs/next_steps_roadmap.md rom_analysis/docs/progress_checkpoints.md`
- New evidence:
  - the lane now has one direct resume note that pins:
    - what is already closed
    - what should not be reopened
    - which artifacts to read first
    - which experiment should come next
  - the handoff fixes the current frontier explicitly at the later-frame
    selection/schedule rule for `AA10/AB58/ACA0` over `0x4920/0x49A0`, not at
    basic ownership, callback continuity, or `bg1_visible` semantics
  - the handoff also records the exact checkpoint trail to resume from:
    - `6cccf8e`
    - `e4eaada`
    - `87e3167`
- Practical reading:
  - the next agent can resume Lane 2 from one note instead of reconstructing
    the late `00:8029` state from multiple prior turns
  - this turn is documentation-only; it does not change the technical frontier
    beyond making the current boundary and next gate explicit

## Current Checkpoint Metrics

- `L001210` no-input attract probe (`3600` frames):
  - total hits: `34`
  - runtime-confirmed bank30 starts:
    - `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800`
  - repeat spacing: `1418` frames
- Alternate scripted input (`start,b`, `4000` frames):
  - total hits: `2` (`02:F51F`, `04:8000`)
  - no bank30 candidates reached
- Matrix v1 (`1500` frames each, `4` scenarios):
  - `poweron_no_input`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `hold_start_b_240_359`: `17` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `pulse_start_240`: `11` total hits, `4` bank30 hits (`DF6C/E039/E73F/E800`)
  - `periodic_start_pulses_240_1800`: `17` total hits, `0` bank30 hits
- Matrix v2 (`3200` frames each, `13` scenarios):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenario:
    - `pulse_b_every120`: `81` total hits, `20` bank30 hits (still only `DF6C/E039/E73F/E800`)
- Matrix v3 (`7` scenarios, `45000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - aggregate bank30 hits:
    - `1E:DF6C/E039/E73F/E800`: `7` hits each
  - strongest positive bank30 scenario:
    - `poweron_no_input_8000`: `64` total hits, `12` bank30 hits
  - strongest suppression scenario:
    - `hold_start_1200_3200`: `8` total hits, `0` bank30 hits
- Matrix v5 (`12` scenarios, `48000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - strongest positive bank30 scenarios:
    - `pulse_start_240`, `pulse_start_600`: `8` bank30 hits each
  - strongest suppression scenarios:
    - `pulse_start_900`, `pulse_start_1200`, `pulse_start_b_1200`: `0` bank30 hits
  - aggregate bank30 caller coverage:
    - `01:A9BD`: `22`, `01:A9E1`: `22`
  - no caller hits from `01:B256`, `01:B273`, `01:B59B`
- Matrix v6 (`3` scenarios, `12000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - `L00A9*` index telemetry:
    - observed indices: `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
    - observed bank30-producing indices: `28`, `29`
    - unobserved critical index: `32` (`EE7F`)
    - derivation check: `58/58` matches
- Matrix v7 forced-branch tests (`5` scenarios, `20000` total frames aggregate):
  - unresolved candidates still `0` hits:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced selector values on bank30 hits:
    - `$1C78/$1C80/$1CA8 = 1/0/2`
  - observed `L00A9*` indices remained:
    - `0`, `4`, `5`, `6`, `15`, `28`, `29`, `34`
  - critical index still absent:
    - `32` (`EE7F`)
  - caller coverage still excludes:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v10a/v10b (`16` scenarios, `117000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - expanded caller coverage reached:
    - `01:8E3C`, `01:8E59`
  - expanded `L00A9*` index set:
    - added `7`, `8`, `9`, `10`, `11`, `22`, `25`
  - bank30-producing indices remained:
    - `28`, `29` only
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v11/v11b (`16` scenarios, `200000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - each scenario remained fixed at:
    - `66` total hits, `12` bank30 hits
  - bank30 selector tuple was constant:
    - `$1C78/$1C80/$1CA8 = 1/0/0` (`192/192` bank30 hits)
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v12/v12b (`8` scenarios, `72000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
  - `B1F9` execution telemetry:
    - `b1f9_exec_count = 0` across all `v12b` scenarios
- Matrix v13 callback forcing (`5` scenarios, `16000` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - callback-only forced scenarios (`01:9568`/`01:95AD`) each produced:
    - `6` total hits, `0` bank30 hits
  - callback+state forced scenarios reached:
    - `b1f9_exec_count = 1` at frame `1201`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Matrix v14 `B1F9` stage trace (`3` scenarios, `6600` total frames aggregate):
  - unresolved candidates still `0` hits across all scenarios:
    - `1E:E91F`, `1E:EE7F`, `1E:DA96`, `1E:9681`
  - forced callback+state scenarios still reached:
    - `b1f9_exec_count = 1`
  - `B1F9` stage counters stayed at:
    - `b226 = 0`, `b256 = 0`, `b273 = 0`, `b59b = 0`
  - still no caller hits from:
    - `01:B256`, `01:B273`, `01:B59B`
- Targeted `B1F9` prologue exec traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - exec trace hits observed only at:
    - `01:B1F9`
  - no hits at:
    - `00:050F`, `00:083F`
    - `01:B202`, `01:B206`
    - `01:B226`, `01:B256`, `01:B273`, `01:B59B`
  - shared entry tuple:
    - `$1C80/$1CA8 = 0/2`, `$1C86 = 1`, `$1D10 = 0x4100`, `$0960 = 0`
  - lane difference:
    - `$0F77 = 1` on forced `01:9568`
    - `$0F77 = 0` on forced `01:95AD`
- Corrected `B1F9` return-window trace (`01:9568`, `2200` frames, window `1200..1202`):
  - observed:
    - `00:82A1` at frame `1200`
    - `01:B1F9` at frame `1201`
  - no hit at:
    - `01:9575`
  - corrected entry read:
    - frame-level forced state still holds `$1C78/$1C80/$1CA8 = 1/0/2`
    - but the `01:B1F9` exec snapshot itself sees `$1CA8 = 3`
  - static caller explanation:
    - `L009568` and `L0095AD` both `inc $1CA8` before `jsr L00B1F9`
- Per-point-capped `B1F9` wait/exit surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed:
    - `01:B1F9` once at frame `1201`
  - no hits at:
    - `01:B226`, `01:B638`, `01:B6E3`, `01:B755`, `01:9575`
  - trace budget note:
    - `exec_point_max_hits_per_point = 1`
    - `exec_point_trace.dropped_hits = 0`
- `B1F9` wait-path WRAM write surface (`01:9568`, `2200` frames, window `1200..1800`):
  - observed writes:
    - none
  - trace result:
    - `write_point_trace.hit_count = 0`
    - `write_point_trace.dropped_hits = 0`
  - stable nearby state snapshots:
    - `$0960 = 0`, `$0200 = 0`, `$0202 = 1`, `$1E2C = 0`
    - `$0440/$0442/$0444 = 0/0/0`, `$040A = 0x0011`
- Targeted `B1F9` side-effect traces (`2` scenarios, `4400` total frames):
  - both forced callback+state scenarios reached:
    - `01:B1F9` once at frame `1201`
  - both runs reported:
    - `write_point_trace.hit_count = 0`
  - no writes observed at:
    - `00:420C`, `00:2106`, `00:2105`, `00:2107`, `00:2108`, `00:2109`, `00:210B`
    - `00:2101`, `00:212C`, `00:2131`, `00:2130`, `00:212E`, `00:212D`, `00:212F`
    - `00:2123`, `00:2124`, `00:2125`, `7E:0966`, `7E:0968`, `7E:0974`, `00:0F42`
- Targeted `B1F9` stack-return traces:
  - forced `01:9568` lane:
    - `stack_return_rts = 0x9575` (`L009575`)
  - forced `01:95AD` lane:
    - `stack_return_rts = 0x95B7`
  - shared deeper stack word:
    - `0x82A0` (`dispatcher wrapper anchor`, `RTS -> 0x82A1`)
  - practical reading:
    - both forced lanes reach `L00B1F9` through the expected in-bank `jsr`
      call sites under the normal bank-0 callback dispatcher
- Combined caller/index telemetry (`v10a/v10b/v11/v11b`, `32` traces):
  - observed caller PCs:
    - `01:8E3C`, `01:8E59`, `01:A043`, `01:A061`, `01:A1C4`, `01:A42F`, `01:A9BD`, `01:A9E1`
  - bank30 caller PCs:
    - `01:A9BD`: `192`, `01:A9E1`: `192`
  - `L00A9` source derivation consistency:
    - `1645/1645` matches (`0` mismatches)
- Callback/state contracts:
  - `make -C tools callback-contracts-check` -> `18/18` checks passed
  - capture profile used: no-input probe, `1120` frames
- Pixel regression gates:
  - `make -C tools regression-gates REGRESSION_GATES_RENDER_DIR=../port/build/regression_frames_v2`
  - result: `6/6` checks passed (`0` mismatched pixels each)

### CP-89: DOS-driven SNES front-end correlation baseline

- Added required machine-readable outputs:
  - `snes_selection_state_contract.json`
  - `snes_catalog_contracts.json`
  - `snes_play_session_gate.json`
- Added correlation docs:
  - `docs/snes_dos_correlation.md`
  - `docs/snes_unknowns.md`

Current read:

- selection state is now formalized as a verified SNES WRAM block centered on
  `$1C6A..$1C90`, with flattened named fields instead of a proven DOS-style
  slot-indexed selector vector
- the front-end bundle materializer is now explicit in one place:
  - `L008C10/L008CA2` builds one derived descriptor from selector fields
    instead of a recovered split between separate car and scenery builders
- the strongest current domain-specific menu surfaces are now separated:
  - verified car-customize screen at `01:880D` (`CUSTOMIZE CAR`)
  - verified `3`-choice preview rebuilder through `$0202`
  - probable `4`-state track/scenery selector through `$1C7C`
- persistence reading tightened materially:
  - the ROM header reports `sram_size = 0x00`, so no battery-backed
    DOS-style selector persistence is evidenced on cartridge
- gameplay-gate reading is now explicit:
  - verified front-end success gate at `L008B26`
  - probable play-session boundary candidate at `L009568/L0095AD`
  - no verified SNES equivalent of the DOS `0x6064` dual-catalog refusal gate
    has been recovered yet

Next best step:

- prove the `$0202/$1C78` preview domain and the `$1C7C` four-state domain with
  name-bearing assets or debugger-backed menu traces, then follow
  `L009568/L0095AD` into the first confirmed gameplay callback chain

### CP-90: selector-domain decode and forced `B1F9` callback narrowing

- tightened the selector-domain read with new static decode:
  - `01:8000/01:8008` now explicitly decodes to `$1C7C` group
    bases/counts `[0, 5, 11, 18] / [5, 6, 7, 8]`
  - unlabeled front-end UI helpers now also show the slot split directly:
    - `$0202 + 0x0008`
    - `$1C7C + 0x000B`
    - both feed the shared `$1E80` text/UI buffer through `L00179B`
- tightened the `$0202/$1C78` preview read:
  - helper indices `9/10/11` now resolve to distinct bundle triples
    (`L00A9A0`, `L00A9CB`, `L00A9F2`)
  - current negative result:
    - the simple `tools/build_bank1_helper_scene.py` path does not yet rebuild
      that preview cleanly because helper indices `9..11` fail on an
      `L00A9CB` `26FB` length mismatch (`11348` vs expected `16640`)
- bounded forced callback probes are now recorded under:
  - `tools/out/tmp_b1f9_9568/td2_boot_probe.json`
  - `tools/out/tmp_b1f9_95ad/td2_boot_probe.json`
- current forced-lane reading:
  - both `01:9568` and `01:95AD` reach `01:B1F9` exactly once at frame `1201`
  - return sites now re-confirm the sibling split:
    - `0x9575`
    - `0x95B7`
  - state split also persists:
    - `state_0f77 = 1` on the `01:9568` lane
    - `state_0f77 = 0` on the `01:95AD` lane
  - immediate callback promotion is still not observed in the narrow window:
    - no writes to `7E:096C..0971`
    - no exec hit at `02:9016`
    - trace window: `1200..1300`
- practical reading:
  - `$0202/$1C78` is now a stronger car-facing selector candidate, but still
    needs a name-bearing asset or debugger-backed menu proof
  - `$1C7C` is now a verified four-group descriptor selector, while the
    track/scenery label remains probable
  - the missing handoff proof is now narrowed to callback-promotion timing
    around the real `B1F9` branch entry, not branch reachability itself

Next best step:

- widen around the `01:9568/01:95AD` callback-promotion window or get a richer
  deterministic menu savestate, and extend the preview extractor for helper
  indices `9..11`

### CP-91: partial `26FB` preview-helper extraction

- patched the ROM-side helper extractor so the `L0006C9` path can keep partial
  `26FB` payloads instead of aborting the whole scene build on early end
  markers:
  - `tools/decompress_td2_chunk.py`
  - `tools/build_boot_vram.py`
  - `tools/build_bank1_helper_scene.py`
- added compact validation artifacts:
  - `tools/out/bank1_preview_helper_9_11_summary.json`
  - `tools/out/bank1_preview_helper_9_11_summary.md`
- bounded validation:
  - strict `26FB` decode still fails on `0E:8000` as expected:
    - `got 11348 bytes, expected 16640`
  - non-strict decode now returns the partial payload instead of aborting:
    - `11348 / 16640` bytes for `0E:8000`
  - clean helper-scene rebuilds now succeed for helpers `9/10/11` on both
    isolated `BG1` and isolated `BG2` surfaces
- current clean-model reading from the committed summary artifact:
  - helper `9`:
    - `BG1` blank
    - `BG2` non-backdrop `14336`
  - helper `10`:
    - `BG1` blank
    - `BG2` blank
  - helper `11`:
    - `BG1` blank
    - `BG2` blank
- practical reading:
  - the previous blind spot is now closed at the extractor level
  - the remaining unknown moved from raw bulk decode failure to runtime
    composition/state:
    - why helper `9` already lights `BG2` in the clean model
    - why helpers `10/11` still need follow-up explanation

Next best step:

- capture the live preview-menu layer mix and follow-up callback activity so
  helper `10/11` can be explained as either deferred composition or genuinely
  blank one-shot states

### CP-92: front-end selector cardinality tightening

- tightened the recovered SNES front-end cardinality with direct code evidence:
  - car surface:
    - `L008B3E` sets `$1C84 = 3`
    - `L00BBCB` wraps `$0202` across `0..2`
    - helper indices `9/10/11` are the three reachable bundle triples
    - no separate front-end restriction branch on the third slot is recovered
      in this loop
  - top-level track surface:
    - `L008B6F` sets `$1C84 = 4`
    - `L00BE76` wraps `$1C7C` across `0..3`
    - `L008B87` then resolves descriptor groups
      `[0, 5, 11, 18] / [5, 6, 7, 8]`
- added compact evidence artifact:
  - `tools/out/snes_frontend_selector_cardinality.json`
  - `tools/out/snes_frontend_selector_cardinality.md`
- bounded validation and narrowing:
  - bank-1 ASCII scan confirms the customization block at `01:880D..01:889B`
    is plain text and shows no plain ASCII track names in that scanned bank-1
    surface
  - simple start-pulse WRAM probes at frames `1200` and `1400` still leave
    `$1E80..$1FFF` zero, even when frame `1200` transiently reaches active main
    callback `01:BAB3`
- practical reading:
  - the current recovered front-end loop already supports all `3` car slots;
    the unresolved gap is the human-readable naming path, not a hidden
    front-end restriction on the third slot
  - `$1C7C` is now better read as the verified `4`-slot top-level track
    surface, while the specific track names still need the descriptor/text
    materializer path

Next best step:

- trace the exact path that populates or bypasses `$1E80` for the menu-label
  descriptors, then tie the `4` `$1C7C` slots to concrete track names

### CP-93: front-end descriptor table base closure

- closed the old `$1E80` WRAM-table assumption with direct static decode:
  - the helper sites at `01:BDF4`, `01:BE53`, and `01:BAC3` all use the
    overlapping sequence:
    - `lda #$1E80 ; sta $11`
    - `lda #$8000 ; sta $10`
  - that sequence constructs the long ROM pointer `1E:8000`, not a WRAM
    buffer at `7E:1E80`
  - `L00179B/L001662` then dereference four-byte rows from that table directly
- promoted a reusable extractor and compact artifact:
  - `tools/decode_frontend_pointer_table.py`
  - `tools/out/snes_frontend_pointer_table_1e8000.json`
  - `tools/out/snes_frontend_pointer_table_1e8000.md`
- decoded current adjacent menu rows:
  - car-facing helper surface:
    - `$0202 + 0x0008` -> rows `8..10`
    - targets `1E:9ACC`, `1E:9C14`, `1E:9D5C`
    - header counts `8/8/8`
  - track-facing helper surface:
    - `$1C7C + 0x000B` -> rows `11..14`
    - targets `1E:9EA4`, `1E:A374`, `1E:A8CC`, `1E:AD14`
    - header counts `9/10/8/10`
- practical reading:
  - the previous WRAM probe result remains true as a negative observation, but
    it no longer defines the gate because `L00179B` was never waiting for a
    writer to `7E:1E80`
  - the active naming frontier is now the ROM descriptor payloads themselves
    and any live overlay/composition layered on top of them

Next best step:

- decode or render the `1E:8000` row payloads `11..14` far enough to tie the
  four `$1C7C` slots to concrete track names, then widen callback promotion
  only if a live overlay still obscures that mapping

### CP-94: `$1C7C` top-level phase-name rows closed through rendered descriptors

- extended the reusable decoder so it now closes the descriptor payload format
  instead of stopping at the row headers:
  - `tools/decode_frontend_pointer_table.py`
  - parses each row into:
    - object list
    - descriptor-local `4bpp` OBJ blob
    - staged-tile layout (`contiguous` vs `split_row_padded`)
  - emits monochrome preview strips plus tile sheets for selected rows
- promoted concrete evidence artifacts for the active four-slot surface:
  - `tools/out/snes_frontend_pointer_table_tracks.json`
  - `tools/out/snes_frontend_pointer_table_tracks.md`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_11_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_12_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_13_preview.ppm`
  - `tools/out/snes_frontend_pointer_table_tracks/frontend_row_14_preview.ppm`
- bounded validation:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 11-14 --render-dir tools/out/snes_frontend_pointer_table_tracks --json-out tools/out/snes_frontend_pointer_table_tracks.json --md-out tools/out/snes_frontend_pointer_table_tracks.md`
- recovered exact `$1C7C -> row -> rendered label` mapping:
  - `$1C7C = 0` -> row `11` -> `Desert Blast - Easy`
  - `$1C7C = 1` -> row `12` -> `City Bound - Medium`
  - `$1C7C = 2` -> row `13` -> `East Coast - Hard`
  - `$1C7C = 3` -> row `14` -> `West Coast - Hardest`
- descriptor-format reading tightened materially:
  - all four top-level rows are now proven to be OBJ label strips, not hidden
    WRAM text or a separate live string materializer
  - rows `11/12/14` use the negative-layout `split_row_padded` staging rule
    inferred from `L0015E1/L001945`
  - row `13` is the aligned `32`-tile `contiguous` case
- practical reading:
  - the old “probable track/scenery selector” read is now concrete phase-name
    evidence with explicit difficulty suffixes baked into the descriptor rows
  - the active Lane 2 naming frontier has moved away from `$1C7C`; the next
    open naming surface is the car-facing row family `8..10`
  - callback-promotion archaeology can now resume without the old top-level
    phase-name blocker

Next best step:

- return to the bank-1 callback-promotion corridor with the top-level phase
  surface now closed:
  - widen the real promotion window around `01:9568/01:95AD`
  - keep watching for the first concrete `02:9016/02:8F3C` handoff
  - only reopen front-end naming if the still-open car-facing rows `8..10`
    become the stronger blocker

Savestate lane blocker (current environment):

- `mesen_probe_boot.lua` can load savestates, but headless `--testRunner` does not expose
  a callable save API (`saveSavestate/saveState/serializeState` absent on `emu` table).
- probe JSON currently reports:
  - `saved_savestate_error = "no supported savestate API found on emu table"`

### CP-95: Short-force `01:9568/01:95AD` probes stay pinned after `B1F9`

- Added edge-release artifacts:
  - `tools/out/b1f9_edge_release_9568/td2_boot_probe.json`
  - `tools/out/b1f9_edge_release_9568/td2_boot_probe_l001210_exec.json`
  - `tools/out/b1f9_edge_release_95ad/td2_boot_probe.json`
  - `tools/out/b1f9_edge_release_95ad/td2_boot_probe_l001210_exec.json`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ... TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/b1f9_edge_release_9568/td2_boot_probe ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ... TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/b1f9_edge_release_95ad/td2_boot_probe ./validation/run_mesen_probe_boot.sh ./game.smc`
- probe shape:
  - force `active_main` only on frames `1200..1201`
  - re-apply selectors at the `01:B1F9` exec point
  - trace frames `1200..2200`
  - watch exec at `01:B1F9/B226/B638/B6A3/B6E3/B755`, return sites
    `01:9575/01:95B7`, and candidate follow-up callbacks `01:9D69`,
    `02:9016`, `02:8F3C`
  - watch writes to `7E:096C..0971`, `7E:0200/0202`, `7E:1E2C`,
    `7E:0440/0442/0444`, and `7E:040A`
- observed result on both lanes:
  - `01:9568` and `01:95AD` still reach `01:B1F9` exactly once at frame
    `1201`
  - stack returns remain concrete and lane-specific:
    - `01:9568` -> `0x9575`
    - `01:95AD` -> `0x95B7`
  - no traced writes hit `7E:096C..0971`
  - no traced writes hit the expected `L00B608/L00B6A3` state surface
    (`7E:0200/0202`, `7E:1E2C`, `7E:0440/0442/0444`, `7E:040A`)
  - no exec hits are seen at `01:B226`, `01:B638`, `01:B6A3`, `01:B6E3`,
    `01:B755`, `01:9D69`, `02:9016`, or `02:8F3C`
  - after the forced-entry edge, `active_main` stays pinned on the injected
    callback through the end of the run:
    - `01:9568` through frame `2199`
    - `01:95AD` through frame `2199`
- static cross-check:
  - the only explicit `02:9016/02:8F3C` staging site currently recovered in
    bank 1 is still `01:902D..01:9034`
  - the later explicit callback stage inside `L00B1F9` is `01:9D69` at
    `01:B6A3`, not `02:9016`
- practical reading:
  - the old “just widen the window” reading is no longer sufficient
  - direct active-main forcing itself produces a sticky bank-1 surface and is
    not enough to observe an organic callback promotion
  - the headless proof gap has narrowed from “find a wider trace window” to
    “obtain richer preconditions than raw callback injection”

Next best step:

- treat direct-force callback promotion as low-yield in headless mode:
  - if a richer selector-bearing savestate or live debugger session becomes
    available, return to organic `01:9568/01:95AD -> 02:9016/02:8F3C`
    promotion capture
  - otherwise keep Lane 2 moving on the still-unlocated car-name text surface,
    because rows `8..10` now read as rolling-tire phases rather than names

### CP-96: longplay-calibrated front-end rows split into tire phases and settings labels

- improved the reusable front-end row decoder:
  - `tools/decode_frontend_pointer_table.py`
  - descriptor previews now normalize signed local offsets instead of clipping
    fully negative rows to black
- refreshed the committed base artifact:
  - `tools/out/snes_frontend_pointer_table_1e8000.json`
  - `tools/out/snes_frontend_pointer_table_1e8000.md`
- added a second focused artifact for the next nearby row family:
  - `tools/out/snes_frontend_pointer_table_controls_15_1b.json`
  - `tools/out/snes_frontend_pointer_table_controls_15_1b.md`
- bounded validation:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 8-14 ...`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 0x15-0x1b ...`
  - one local Mesen capture with `start` pulse at frame `1200` to anchor the
    same front-end corridor against live screenshots
- observed result:
  - rows `8..10` now render as three near-identical `24x24` wheel phases,
    not text
  - rows `0x15..0x1B` decode directly to front-end settings/help labels:
    - `Brake`
    - `Throttle`
    - `Horn`
    - `Upshift`
    - `Downshift`
    - `Steering`, `Pause`
    - `stereo`
- practical reading:
  - the longplay plus live Mesen front-end corridor were useful because they
    falsified the old “car-facing names live in rows 8..10” read
  - the current headless naming frontier has moved:
    - `8..10` is a rolling-tire helper cycle
    - `0x15..0x1B` is control/sound menu text
    - the actual car-name surface must be elsewhere

Next best step:

- stop treating rows `8..10` as a naming gate
- trace the neighboring front-end row families and callsites to locate the
  actual car-name text surface

### CP-97: frame-1500 car-select split proves BG name box vs per-car OBJ catalogs

- bounded validation/artifact run:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=1500 TD2_BG_RANGE_END_FRAME=1500 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1500 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 tools/render_mesen_snes_bg.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_cgram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json /tmp/.../car_select_frame_1500_bg_only.ppm`
  - `python3 tools/render_mesen_snes_bg.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_cgram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json /tmp/.../car_select_frame_1500_with_oam.ppm --oam tools/out/car_select_frame_1500_frame_01500_oam.bin --obj-renderer mode7-ppu`
- observed result:
  - the stable frame-`1500` render lands on the first car-select panel with
    `Porsche 959`
  - the BG-only render keeps the patterned backdrop, prompt, title box, and
    whole stats/info panel intact
  - the car art disappears without OAM and returns exactly when OAM is
    composed back in
  - longplay-calibrated static previews now line up the three `01:9C77`
    bases as:
    - `1A:97D8` -> Porsche 959 body + wheel/canopy pieces
    - `11:A578` -> Lamborghini Diablo body + wheel/canopy pieces
    - `1A:8000` -> Ferrari F40 body + wheel/canopy pieces
- practical reading:
  - the per-car bases are visual OBJ catalogs for the selectable car sprite,
    not the source of the visible car-name text
  - the car-name and info surface is now better read as BG/tilemap text

Next best step:

- use the repeatable frame-`1500` schedule as the new calibration anchor
- trace the BG/tilemap/CHR provenance for the `Porsche 959` box and info panel
- stop mining `1A:8000/1A:97D8/11:A578` as if they were name-label tables

### CP-98: frame-1500 BG2 provenance lands on helper bundle `10`

- added a small bank-1 helper provenance builder:
  - `tools/build_bank1_helper_provenance.py`
- promoted the frame-`1500` design-facing artifacts needed for the read:
  - `tools/out/design_frame1500_car_select/design_pack.json`
  - `tools/out/visual_contract_frame1500_car_select.json`
  - `tools/out/car_select_frame1500_probe_repo/td2_boot_probe.json`
  - `tools/out/car_select_frame1500_probe_repo/td2_boot_probe_l001210_exec.json`
- added frame-local provenance outputs:
  - `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json`
  - `rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- bounded validation:
  - `python3 tools/build_mesen_design_pack.py /tmp/car_select_frame_01500 tools/out/design_frame1500_car_select --clean-out`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1500_car_select tools/out/visual_contract_frame1500_car_select.json`
  - `MESEN_BIN=<repo-compatible Mesen build> MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_frame1500_probe_repo/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1501 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start' TD2_BOOT_PROBE_TRACE_L001210=1 TD2_BOOT_PROBE_L001210_MAX_HITS=4096 ./validation/run_mesen_probe_boot.sh`
  - `python3 tools/extract_compression_header_manifest.py game.smc --bank 0 --json-out tools/out/bank0_headers.json`
  - `python3 tools/extract_compression_header_manifest.py game.smc --bank 14 --json-out tools/out/bank14_headers.json`
  - `python3 tools/validate_td2_chunks.py game.smc --bank 0 --headers-json tools/out/bank0_headers.json --json-out tools/out/bank0_chunk_validation.json`
  - `python3 tools/validate_td2_chunks.py game.smc --bank 14 --headers-json tools/out/bank14_headers.json --json-out tools/out/bank14_chunk_validation.json`
  - `python3 -m py_compile tools/build_bank1_helper_provenance.py`
  - `python3 tools/build_bank1_helper_provenance.py game.smc tools/out/design_frame1500_car_select tools/out/car_select_frame1500_probe_repo/td2_boot_probe.json tools/out/car_select_frame1500_probe_repo/td2_boot_probe_l001210_exec.json rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.json --chunk-validation tools/out/bank0_chunk_validation.json --chunk-validation tools/out/bank14_chunk_validation.json --markdown-out rom_analysis/maps/tilemaps/car_select_frame_1500_bg2_provenance.md`
- observed result:
  - isolating the live frame proves `BG1` is only the wallpaper strip while `BG2` owns the entire lower-screen title/info surface
  - the visible nonzero `BG2` window spans screen pixels `0..255 x 120..223`
  - the matching frame-`1500` probe state is `$0202/$0204/$0208/$020A/$0054 = 1/3/13/$9CC3/136`
  - the last matching helper-trace hits before frame `1500` are:
    - frame `1304`: `L00A9A0`, helper index `10`, source `00:B6B2`
    - frame `1310`: `L00A9CB`, helper index `10`, source `0E:91FE`
  - helper bundle `10` stages:
    - `L00A9A0 00:B6B2 -> VRAM 0x1000`
    - `L00A9CB 0E:91FE -> VRAM 0x3000`
    - `L00A9F2 02:FBF3 -> CGRAM 0xC0`
  - those VRAM destinations match the live frame exactly:
    - `BG2 tilemapBaseWords = 0x1000`
    - `BG2 chrBaseWords = 0x3000`
  - validation status now closes the coarse source read:
    - `00:B6B2` validates as an `ok` `42FB` chunk (`4102` bytes out, `1543` bytes consumed)
    - `0E:91FE` reproduces the known helper-bundle partial `26FB` frontier (`13111` bytes actual vs `16640` declared), so the CHR anchor is real even though strict validation still reports `fail`
- practical reading:
  - the frame-`1500` car-name/info panel is no longer just “some BG surface”
  - its live tilemap/CHR base pair now lands on the same helper bundle `10`
    used by the selector-state runtime path
  - the remaining gap is narrower:
    - identify which part of helper bundle `10` owns the actual title/info
      strings and panel glyphs
    - explain how the runtime composition uses that bundle after the last
      observed `1304/1310` decompressions

Next best step:

- trace the visible `Porsche 959` title/info glyphs inside helper bundle `10`,
  not in the `01:9C77` OBJ catalogs
- split the remaining ownership question across:
  - `00:B6B2` paged tilemap/layout payload
  - `0E:91FE` partial bulk CHR payload
  - `02:FBF3` palette payload

### CP-99: right-nav car-select diff closes BG2 mutability and promotes local car catalogs

- added a visible-window design-pack comparer:
  - `tools/compare_design_pack_bg_visible.py`
- promoted local car catalog reports:
  - `tools/out/car_table_1a8000_report.json`
  - `tools/out/car_table_1a8000_report.md`
  - `tools/out/car_table_1a97d8_report.json`
  - `tools/out/car_table_1a97d8_report.md`
  - `tools/out/car_table_11a578_report.json`
  - `tools/out/car_table_11a578_report.md`
  - `tools/out/snes_car_obj_catalog_manifest.json`
  - `tools/out/snes_car_obj_catalog_manifest.md`
- promoted second-state car-select artifacts:
  - `tools/out/car_select_frame_1500_frame_01500_frame.png`
  - `tools/out/car_select_right_capture/capture_frame_01640.png`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_cgram.bin`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json`
  - `tools/out/car_select_frame_1640_rightnav_frame_01640_oam.bin`
  - `tools/out/design_frame1640_car_select_right/design_pack.json`
  - `tools/out/visual_contract_frame1640_car_select_right.json`
  - `tools/out/car_select_bg1_1500_vs_1640_right.json`
  - `tools/out/car_select_bg1_1500_vs_1640_right.md`
  - `tools/out/car_select_bg2_1500_vs_1640_right.json`
  - `tools/out/car_select_bg2_1500_vs_1640_right.md`
- bounded validation/artifact run:
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x1a --base-addr 0x8000 --indices 0-5 --render-dir tools/out/car_table_1a8000_renders --json-out tools/out/car_table_1a8000_report.json --md-out tools/out/car_table_1a8000_report.md`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x1a --base-addr 0x97d8 --indices 0-12 --render-dir tools/out/car_table_1a97d8_renders --json-out tools/out/car_table_1a97d8_report.json --md-out tools/out/car_table_1a97d8_report.md`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --base-bank 0x11 --base-addr 0xa578 --indices 0-5 --render-dir tools/out/car_table_11a578_renders --json-out tools/out/car_table_11a578_report.json --md-out tools/out/car_table_11a578_report.md`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_nav_right_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1565 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' ./validation/run_mesen_probe_boot.sh`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_CAPTURE_WARMUP_FRAMES=0 TD2_CAPTURE_FRAMES=1700 TD2_CAPTURE_SCREENSHOT_EVERY=20 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/car_select_right_capture/capture TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BG_RANGE_START_FRAME=1640 TD2_BG_RANGE_END_FRAME=1640 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1640_rightnav ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 tools/build_mesen_design_pack.py /tmp/car_select_frame_01640_right tools/out/design_frame1640_car_select_right --clean-out`
  - `python3 tools/build_mesen_visual_contract.py tools/out/design_frame1640_car_select_right tools/out/visual_contract_frame1640_car_select_right.json`
  - `python3 -m py_compile tools/compare_design_pack_bg_visible.py`
  - `python3 tools/compare_design_pack_bg_visible.py tools/out/design_frame1500_car_select tools/out/design_frame1640_car_select_right tools/out/car_select_bg1_1500_vs_1640_right.json --layer bg1 --markdown-out tools/out/car_select_bg1_1500_vs_1640_right.md`
  - `python3 tools/compare_design_pack_bg_visible.py tools/out/design_frame1500_car_select tools/out/design_frame1640_car_select_right tools/out/car_select_bg2_1500_vs_1640_right.json --layer bg2 --markdown-out tools/out/car_select_bg2_1500_vs_1640_right.md`
- observed result:
  - the right-navigation probe changes `state_0202` from `1` to `2` at frame
    `1537`
  - the visible car-select capture at frame `1640` shows `Lamborghini Diablo`
  - the frame-`1500` `Porsche 959` PNG is now promoted as a stable in-repo
    screenshot artifact, so both live anchors can be cited directly in
    article/documentation outputs
  - `L00BC0F` statically closes the per-car helper math:
    - `lda $0202`
    - `adc #$0009`
    - `jsr L00A9A0`
    - `jsr L00A9CB`
    - no paired per-car `L00A9F2`
  - the promoted manifest now gives stable in-repo names for the three
    `01:9C77` OBJ catalogs
  - the visible-layer diff now localizes the mutable car-select panel:
    - `BG1`: `0` changed visible cells
    - `BG2`: `256` changed visible cells
    - changed screen bbox: `x=0..247`, `y=128..223`
    - all changed `BG2` cells are nonzero->nonzero, so this is not a blanking
      or layer-enable event
- practical reading:
  - the mutable per-car title/stats panel is now closed as a `BG2`
    tilemap/CHR rewrite, not an OAM rewrite and not a wallpaper-layer change
  - the frame-`1500` `Porsche 959` panel and the frame-`1640`
    `Lamborghini Diablo` panel sit on the same `BG2` state shape, so the next
    byte-ownership target is the per-car helper payload delta, not a coarse
    PPU-mode fork
  - the active naming gap is now the third live `Ferrari F40` anchor plus the
    exact split between helper `10/11` tilemap bytes and CHR bytes

Next best step:

- land the third live `Ferrari F40` car-select frame and run the same visible
  `BG2` diff against the existing `Porsche 959` and `Lamborghini Diablo`
  frames
- map the `BG2` delta against helper `10/11` payload ownership:
  - `00:B6B2` vs `00:BCBA`
  - `0E:91FE` vs `0E:A428`

### CP-100: raw exact-frame front-end car-presentation triangle narrows the panel delta to top-row tilemap changes

- added a raw-frame visible-window comparer:
  - `tools/compare_raw_bg_visible.py`
- added a raw-frame visible-CHR delta summarizer:
  - `tools/summarize_raw_bg_chr_delta.py`
- promoted third-slot selector and front-end car-presentation frame artifacts:
  - `tools/out/car_select_nav_right2_probe/td2_boot_probe.json`
  - `tools/out/car_select_frame_1780_right2.json`
  - `tools/out/car_select_frame_1780_right2_frame_01780_vram.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_cgram.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json`
  - `tools/out/car_select_frame_1780_right2_frame_01780_oam.bin`
  - `tools/out/car_select_frame_1780_right2_frame_01780_frame.png`
- promoted raw exact-frame compare artifacts:
  - `tools/out/car_select_raw_bg1_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg1_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg1_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg1_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg1_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg1_1640_vs_1780.md`
  - `tools/out/car_select_raw_bg2_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_1640_vs_1780.md`
- promoted raw visible-CHR delta artifacts:
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_chr_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_1640_vs_1780.md`
- bounded validation/artifact run:
  - `MESEN_TIMEOUT_SECONDS=60 MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/car_select_nav_right2_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1825 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right' ./validation/run_mesen_probe_boot.sh`
  - `MESEN_TIMEOUT_SECONDS=60 MESEN_BIN=/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen TD2_BG_RANGE_START_FRAME=1780 TD2_BG_RANGE_END_FRAME=1780 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:right;1645-1650:right' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/car_select_frame_1780_right2 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `python3 -m py_compile tools/compare_raw_bg_visible.py`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg1_1500_vs_1640.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1500_vs_1640.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1500_vs_1640.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg1_1500_vs_1780.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1500_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1500_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg1_1640_vs_1780.json --layer bg1 --markdown-out tools/out/car_select_raw_bg1_1640_vs_1780.md`
  - `python3 tools/compare_raw_bg_visible.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_1640_vs_1780.md`
  - `python3 -m py_compile tools/summarize_raw_bg_chr_delta.py`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_chr_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1500_vs_1640.md`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1500_vs_1780.md`
  - `python3 tools/summarize_raw_bg_chr_delta.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_1640_vs_1780.md`
- observed result:
  - the second-right probe changes `state_0202` from `2` to `0` at frame
    `1677`, closing the third live anchor in the same front-end
    presentation/preview corridor.
  - the exact-frame raw dump at `1780` keeps the same `BG1/BG2` state fields
    as the earlier `1500` and `1640` front-end presentation anchors.
  - the new raw comparer reproduces the strong structural boundary while
    correcting the earlier tilemap-overreach:
    - `BG1` changed visible cells remain `0` across `1500->1640`,
      `1500->1780`, and `1640->1780`
    - `BG2` tilemap changes shrink to the top row only:
      - `1500->1640`: `27` changed cells
      - `1500->1780`: `11` changed cells
      - `1640->1780`: `27` changed cells
  - the visible-union `BG2` CHR delta is now explicitly negative:
    - `1500->1640`: `0` changed CHR tiles, `0` changed CHR bytes
    - `1500->1780`: `0` changed CHR tiles, `0` changed CHR bytes
    - `1640->1780`: `0` changed CHR tiles, `0` changed CHR bytes
  - the earlier design-pack compare stays useful as a looser pack-level signal,
    but it is no longer the source of truth for exact-frame tilemap deltas.
  - `mesen_ppu_extract` diverges from the exact-frame raw dump at `1780`, so
    front-end exact-frame comparison should currently trust the raw runner
    dump until extractor timing semantics are reconciled.
- practical reading:
  - the `1500/1640/1780` trio should now be described conservatively as one
    front-end car-presentation/preview corridor, not yet a proven interactive
    car-select menu.
  - the per-car visible mutation is still on `BG2`, but the exact-frame
    tilemap ownership is now much narrower than the old `256`-cell read.
  - the strongest current split is:
    - `BG1`: stable wallpaper
    - `BG2` tilemap: small top-row name/title delta
    - visible `BG2` CHR: currently unchanged across the exact-frame visible
      tile union, so the live panel-name change is best explained by tilemap
      selection over shared glyph/panel CHR
  - `L00A9CB` is still a real per-car reload path, but this checkpoint does
    not yet tie it to the visible exact-frame delta; it may be staging
    non-visible tiles or reloading CHR that is identical over the visible
    union.
  - the raw third selector anchor is the remaining front-end slot in the
    verified `3`-choice loop and is therefore the strongest current
    `Ferrari F40` candidate by elimination, but the direct name-bearing proof
    is still pending.

Next best step:

- measure the full `0x3000` `BG2` CHR-region deltas across frames
  `1500/1640/1780`, not just the visible tile union, so `L00A9CB` can be tied
  either to non-visible staging or to identical visible glyph reloads.
- reconcile the `1780` timing mismatch between `mesen_dump_bg_range` and
  `mesen_ppu_extract` before using the extractor as an exact-frame source in
  this front-end lane again.

### CP-101: full `BG2` CHR region stays flat and the `$0202` corridor is confirmed downstream of the top menu

- added a full-region CHR delta summarizer:
  - `tools/summarize_raw_bg_chr_region_delta.py`
- promoted full-region delta artifacts:
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.md`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.md`
  - `tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json`
  - `tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.md`
- bounded validation/artifact run:
  - `python3 -m py_compile tools/summarize_raw_bg_chr_region_delta.py`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1500_vs_1640.md`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1500_frame_01500_vram.bin tools/out/car_select_frame_1500_frame_01500_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1500_vs_1780.md`
  - `python3 tools/summarize_raw_bg_chr_region_delta.py tools/out/car_select_frame_1640_rightnav_frame_01640_vram.bin tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json tools/out/car_select_frame_1780_right2_frame_01780_vram.bin tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.json --layer bg2 --markdown-out tools/out/car_select_raw_bg2_chr_region_1640_vs_1780.md`
  - static flow read:
    - `L008B31 -> L00BAE8`
    - `L00BAE8` owns the separate top-level `$1C6A` three-option gate
    - only later does `L008B31 -> L008B3E` enter the downstream `$0202` loop
- observed result:
  - the full inferred `BG2` CHR region `0x3000..0x5FFF` (`12288` bytes) is
    identical across all three exact-frame pairings:
    - `1500->1640`: `0` changed bytes
    - `1500->1780`: `0` changed bytes
    - `1640->1780`: `0` changed bytes
  - this extends the earlier visible-union `CHR = 0` result to the whole
    inferred region, not just the currently visible tiles.
  - static flow now closes one front-end ownership boundary:
    - `L00BAE8` is the separate top-level `3`-option menu gate on `$1C6A`
    - the `$0202` three-slot corridor is downstream of that gate, not the
      first title/menu signboard surface itself
- practical reading:
  - the exact-frame difference across `1500/1640/1780` is now tilemap-only in
    the currently inferred `BG2` region.
  - `L00A9CB` remains a real reload path in code, but this frame trio no
    longer supports using visible or full-region `BG2` CHR deltas to explain
    the observed front-end difference.
  - the next front-end narrowing should stop assuming `CHR` ownership first
    and instead explain why the static reload path can be present while the
    exact-frame region remains identical.

Next best step:

- reconcile the `1780` timing mismatch between `mesen_dump_bg_range` and
  `mesen_ppu_extract` so extractor output can be trusted again for exact-frame
  front-end work.
- use the now-closed `L00BAE8` split to document the top-level three-option
  menu surface separately from the downstream `$0202` corridor.

### CP-102: top-level `1E:8000` signboard rows close the initial three-option menu labels

- decoder/tooling promotion:
  - `tools/decode_frontend_pointer_table.py` now classifies rows `15..17` as
    `top-level signboard labels ($1C6A + 0x000F)`
- promoted artifacts:
  - `tools/out/snes_frontend_pointer_table_top_menu_0f_11.json`
  - `tools/out/snes_frontend_pointer_table_top_menu_0f_11.md`
  - `tools/out/snes_frontend_top_menu_labels.json`
  - `tools/out/snes_frontend_top_menu_labels.md`
  - `tools/out/snes_frontend_top_menu_signboards.png`
- bounded validation/artifact run:
  - `python3 -m py_compile tools/decode_frontend_pointer_table.py`
  - `python3 tools/decode_frontend_pointer_table.py game.smc --indices 0x0f-0x11 --render-dir tools/out/frontend_top_menu_rows_0f_11 --json-out tools/out/snes_frontend_pointer_table_top_menu_0f_11.json --md-out tools/out/snes_frontend_pointer_table_top_menu_0f_11.md`
  - image review of:
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_15_preview.png`
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_16_preview.png`
    - `tools/out/frontend_top_menu_rows_0f_11/frontend_row_17_preview.png`
- observed result:
  - the separate top-level callsite `01:BAC3` now has direct row-label closure:
    - `$1C6A = 0` -> row `15` -> `Game Options`
    - `$1C6A = 1` -> row `16` -> `Play TDII`
    - `$1C6A = 2` -> row `17` -> `High Score`
  - this turns the old user-guided menu reading into direct ROM-side evidence
    for the initial signboard surface.
  - the exact ROM-side label is `Play TDII`, so the previous informal
    expansions `Play Test Drive` / `High Scores` should no longer be treated
    as the promoted wording for this descriptor family.
- practical reading:
  - the first top-level front-end menu already lives in the same `1E:8000`
    descriptor-table family as the later track labels and settings labels.
  - this reinforces the ownership split:
    - `$1C6A + 0x000F` -> top-level signboards
    - `$1C7C + 0x000B` -> track labels
    - `$0202 + 0x0008` -> rolling-tire helper cycle
    - `0x15..0x1B` -> control/sound settings labels

Next best step:

- use the newly closed top-menu signboard labels plus the previously recovered
  config-menu strings to capture or statically narrow the exact initial-menu
  runtime path without conflating it with the downstream `$0202` corridor.
- keep the `1780` raw-dump versus `mesen_ppu_extract` timing mismatch open,
  but no longer block front-end menu ownership claims on that exact-frame
  extractor issue.

### CP-103: top-level signboard semantics close the menu branches behind `$1C6A`

- promoted artifacts:
  - `tools/out/snes_frontend_top_menu_transitions.json`
  - `tools/out/snes_frontend_top_menu_transitions.md`
- bounded static read:
  - `L00BAE8` decision site at `01:BB7F`
  - upstream caller `L008B31`
  - config branch target `L00C0C7`
  - high-score branch target `L00A3CC`
- observed result:
  - the three top-level signboards are no longer just labels; their branch
    behavior is now closed:
    - `$1C6A = 0` / `Game Options` -> `jsr L00C0C7 ; jmp L00BAE8`
    - `$1C6A = 1` / `Play TDII` -> returns success to `L008B31`, which falls
      through to `L008B3E` and enters the separate `$0202/$1C78` corridor
    - `$1C6A = 2` / `High Score` -> `lda #$FFFF ; jsr L00A3CC ; jmp L00BAE8`
  - this proves `Play TDII` is the only top-level branch that advances into
    the later front-end setup chain.
  - it also proves `Game Options` is the exact static entry into the
    configuration loop rather than just a user-supplied longplay label.
- practical reading:
  - the top menu is now closed at two levels:
    - visible text through rows `15..17`
    - semantic branch behavior through `L00BAE8`
  - this reduces the remaining uncertainty around the initial menu to runtime
    composition/capture details, not branch meaning.

Next best step:

- use the now-closed `Game Options -> L00C0C7 -> settings-label surface`
  mapping to narrow the exact initial-menu runtime/callback path and recover a
  clean capture boundary for the signboard menu itself.
- keep the `High Score -> L00A3CC` path as the next adjacent front-end branch
  to decode if the initial-menu capture path stalls.

### CP-104: downstream `$1C70` rival-grid structure closes as a 4-state 2x2 surface

- promoted artifacts:
  - `tools/out/snes_frontend_rival_selection_grid.json`
  - `tools/out/snes_frontend_rival_selection_grid.md`
  - `tools/out/snes_frontend_rival_grid_selection_box_row1d.png`
  - `tools/out/snes_frontend_rival_grid_top_left_bank16_row6.png`
  - `tools/out/snes_frontend_rival_grid_top_right_bank18_row6.png`
  - `tools/out/snes_frontend_rival_grid_bottom_left_bank1b_row6.png`
  - `tools/out/snes_car_obj_catalog_p959_sheet.png`
  - `tools/out/snes_car_obj_catalog_diablo_sheet.png`
  - `tools/out/snes_car_obj_catalog_f40_sheet.png`
- bounded static/artifact read:
  - `L00C20B` at `01:C20B`
  - hidden callback `01:C1D2`
  - coordinate table `01:C1C2..01:C1D0`
  - rendered row-`6` previews from `16:8000`, `18:8000`, `1B:8000`
  - rendered row-`0x1D` preview from `1E:8000`
- observed result:
  - the old loose read of `$1C70` as only a `2`-bit field is now stronger:
    it is a concrete `2x2` downstream selection surface.
  - `L00C20B` draws three explicit rear-car cells at:
    - top-left -> `16:8000` row `6`
    - top-right -> `18:8000` row `6`
    - bottom-left -> `1B:8000` row `6`
  - the callback `01:C1D2` redraws `1E:8000` row `0x1D` as a selection box at
    all four grid coordinates, including the unresolved bottom-right slot.
  - this closes the geometry and OAM ownership of the post-car, pre-track
    surface without over-promoting the missing fourth cell.
  - the car OBJ catalog manifest now also carries canonical committed PNG
    sheets for `p959`, `diablo`, and `f40`, so later articles/docs no longer
    need to point back into `/home/nivando-soares/tmp/...`.
- practical reading:
  - the guided flow fit `cars -> adversary/clock -> phase` is now narrowed to
    one remaining semantic question:
    what the bottom-right `$1C70 = 3` slot actually is.
  - the next profitable work is no longer geometry recovery; it is a runtime
    or descriptor/text tie for that fourth slot.

Next best step:

- use the now-closed `Select Opponent` `BG1` clock slot to narrow the later
  gameplay-handoff semantics instead of spending more time reopening grid
  geometry.

### CP-105: helper-8 BG1 closes the fourth `Select Opponent` slot as a clock surface

- promoted artifacts:
  - `tools/out/snes_frontend_select_opponent_bg1.png`
  - `tools/out/snes_frontend_select_opponent_bg1_x4.png`
  - `tools/out/snes_frontend_select_opponent_clock_summary.json`
  - `tools/out/snes_frontend_select_opponent_clock_summary.md`
- bounded artifact run:
  - `python3 tools/build_bank1_helper_scene.py game.smc tools/out/l00c20b_helper8_bg1 --helper-index 8 --visible-layer bg1 --scene-name l00c20b_helper8_bg1 --source-routine L00C20B`
  - `python3 tools/build_bank1_helper_scene.py game.smc tools/out/l00c20b_helper8_bg2 --helper-index 8 --visible-layer bg2 --scene-name l00c20b_helper8_bg2 --source-routine L00C20B`
  - image review of helper-8 `BG1` plus enlarged export
- observed result:
  - helper `8` is the missing non-OAM surface for `L00C20B`.
  - isolated on `BG1`, it renders:
    - banner: `Select Opponent`
    - the `2x2` panel scaffold
    - a distinct stopwatch/clock icon in the bottom-right quadrant
  - isolated on `BG2`, the same helper contributes nothing useful.
  - this closes the user-guided observation that the fourth slot sits outside
    the car-row list: it belongs to `BG1`, not the rear-car descriptor family.
- practical reading:
  - the `L00C20B` screen is no longer “3 car rows plus one unresolved slot”.
  - it is now directly evidenced as:
    - `3` rear-car opponent cells
    - `1` clock/time slot on `BG1`

Next best step:

- trace or capture the downstream behavior after choosing the clock slot so the
  remaining uncertainty moves from menu archaeology into the gameplay handoff.

### CP-106: `L008B87` closes the first no-opponent-vs-rival handoff split

- promoted artifacts:
  - `tools/out/snes_frontend_select_opponent_mode_split.json`
  - `tools/out/snes_frontend_select_opponent_mode_split.md`
- bounded static read:
  - `bank1.asm:1472-1488` for the `$1C70 -> $1C76/$1C7A` collapse
  - `bank1.asm:1820-1837`, `bank1.asm:1965-1975`, `bank2.asm:2675-2702` for
    `$1C7A` consumers
  - `bank1.asm:2403-2405`, `bank2.asm:2943-2958`,
    `bank2.asm:4118-4129`, `bank2.asm:4671-4682` for `$1C76` branch consumers
- observed result:
  - selector values `0..2` preserve a rival-car handoff:
    - `$1C76 = 1`
    - `$1C7A = $1C70`
  - selector value `3` forces the separate no-opponent branch:
    - `$1C76 = 0`
    - `$1C7A = 0`
  - the fourth clock slot is therefore not only a helper-`8` `BG1` icon; it
    already changes downstream bank-1/bank-2 state and branch behavior.
- practical reading:
  - the remaining gap is narrower than before:
    what is still open is not whether the fourth slot changes handoff, but how
    far the `$1C76 = 0` branch diverges organically once live gameplay/HUD
    logic is running.

Next best step:

- capture or derive a richer post-selection state where the `$1C76 = 0` and
  `$1C76 = 1` paths can diverge without forced `active_main` pinning, then
  compare that organic split against the already-known `02:9016/02:8F3C`
  gameplay corridor.

### CP-107: no-force probes close the default-rival handoff corridor into `02:9016`

- promoted artifacts:
  - `tools/out/snes_select_opponent_organic_default_path.json`
  - `tools/out/snes_select_opponent_organic_default_path.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v1b/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1560-1565:right,down;1610-1615:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v2/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v1b` reaches:
    - `L00C20B` at frame `1562`
    - first `01:C1D2` at `1577`
    - `L00BE76` at `1616`
    - `L008B87` at `1706`
    - `01:902D` at `1857`
    - first `active_main = 02:9016` at `2014`
  - `v2` reaches:
    - `L00C20B` at frame `1584`
    - first `01:C1D2` at `1599`
    - `L00BE76` at `1646`
    - `L008B87` at `1736`
    - `01:902D` at `1887`
    - first `active_main = 02:9016` at `2044`
  - in both runs:
    - `$1C70` stays `0`
    - `$1C76` flips `0 -> 1` only after `L008B87`
    - the early `right+down` attempt does not move the selector off the
      default top-left rival slot
- practical reading:
  - the default-rival path is now recovered organically from power-on into the
    known bank-2 gameplay callback family.
  - the remaining `Select Opponent` blocker is no longer reachability.
  - the remaining blocker is timing the fourth-slot move inside the live
    `01:C1D2` window so the `$1C76 = 0` branch can be compared against this
    baseline.

Next best step:

- inject `right+down` only after `01:C1D2` is already live, then compare the
  resulting `$1C76 = 0` branch against the recovered default-rival corridor.

### CP-108: absolute-frame clock-slot probes still drift ahead of live `01:C1D2`

- promoted artifacts:
  - `tools/out/snes_select_opponent_clock_timing_narrowing.json`
  - `tools/out/snes_select_opponent_clock_timing_narrowing.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v3/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1600-1605:right,down;1610-1615:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v4/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1620-1625:right,down;1630-1635:start;1700-1705:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v3` reaches `L00C20B` at `1600` and first `01:C1D2` only at
    `1615..1617`, so `right+down` at `1600..1605` is still early and the run
    falls through the already known default-rival path:
    `L00BE76` at `1616`, `L008B87` at `1706`, `01:902D` at `1857`, first
    `active_main = 02:9016` at `2014`.
  - `v4` delays confirmation enough to shift `L00C20B` to `1613` and first
    `01:C1D2` to `1628..1637`; the delayed `right+down` at `1620..1625` is
    still early, and the run only reaches `L00BE76` at `1636` before sampled
    later frames stay on `active_main = 01:BE43` with no `L008B87` or
    `01:902D` hit in the trace window.
- practical reading:
  - the remaining clock-slot problem is now callback-relative timing drift,
    not uncertain button semantics.
  - sliding absolute-frame windows later is still changing the corridor
    itself, so that tactic is low-yield beyond this point.

Next best step:

- overlap `right+down` with the live `01:C1D2` window itself, or trigger the
  move relative to first `01:C1D2`, before spending more runs on guessed
  absolute-frame offsets.

### CP-109: callback-relative probes close organic fourth-slot selection

- promoted artifacts:
  - `tools/out/snes_select_opponent_callback_relative_selection.json`
  - `tools/out/snes_select_opponent_callback_relative_selection.md`
- tooling surface:
  - `validation/mesen_probe_boot.lua`
  - `validation/README.md`
- bounded probe runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=1900 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=210 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2800 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=2400 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be43=01:BE43,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=512 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `validation/mesen_probe_boot.lua` now supports callback-relative input
    windows keyed to the first traced exec-point hit and records both
    `trigger_input_windows` and `exec_point_trace.first_frames`.
  - `v5` records first `01:C1D2` at `1628`; the callback-relative windows then
    move `$1C70 -> 3`, keep `$1C76 = 0`, and reach `L00BE76` at `1642`.
    Later sampled frames `1713/1736/1857/1887/2014/2044` all show
    `active_main = 01:BE43`, while no traced `L008B87`, `01:902D`, or
    `01:9111` hit appears.
  - `v6` reproduces the same early corridor and extends the later callback
    proof: `01:BE43` first appears at `1713` and remains traced through
    `2206`; sampled frames `2200/2400/2600` still hold `$1C70 = 3`,
    `$1C76 = 0`, and `active_main = 01:BE43`.
- practical reading:
  - callback-relative input closes organic fourth-slot selection itself.
  - the absence of `L008B87/01:902D/02:9016` is scoped to this specific input
    program, because `v5/v6` omit the later phase-confirm `start` window used
    in the default-rival baseline.

Next best step:

- pair the callback-relative fourth-slot move with a later `start` confirm
  after `01:BE43` is live so the no-opponent lane can be compared directly
  against the recovered default-rival baseline.

### CP-110: be43-relative confirm closes the organic no-opponent handoff path

- promoted artifacts:
  - `tools/out/snes_select_opponent_no_opponent_organic_path.json`
  - `tools/out/snes_select_opponent_no_opponent_organic_path.md`
- bounded probe run:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=3200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=2600 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be43=01:BE43,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111,9016=02:9016' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=768 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
- observed result:
  - `v7` keeps the callback-relative fourth-slot move from `v5/v6`, then adds
    a later `be43+17-22:start` confirm.
  - That single later confirm closes the previously open path:
    `L008B87` at `1736`, `01:902D` at `1887`, `01:9111` at `2043`, and first
    `active_main = 02:9016` at `2044`.
  - The critical state is preserved through the whole downstream handoff:
    `$1C70 = 3`, `$1C76 = 0`, `$1C7A = 0`.
  - The timing now matches the default-rival `v2` corridor exactly at
    `1736 / 1887 / 2044`, but with the no-opponent state tuple `3 / 0 / 0`
    instead of the rival tuple `0 / 1 / 0`.
- practical reading:
  - the remaining gap is no longer front-end confirmation.
  - the next proving lane is the gameplay/HUD divergence after both paths have
    already converged to the shared `02:9016` corridor.

Next best step:

- capture and compare the first no-opponent `02:9016` window against the
  default-rival baseline so downstream bank1/bank2 branches gated by
  `$1C76 = 0` can be tied to visible gameplay differences.

### CP-111: first shared `02:9016` window narrows the post-handoff split

- promoted artifacts:
  - `tools/compare_boot_probe_windows.py`
  - `tools/out/snes_select_opponent_post_9016_state_compare.json`
  - `tools/out/snes_select_opponent_post_9016_state_compare.md`
- bounded compare run:
  - `python3 tools/compare_boot_probe_windows.py tools/out/select_opponent_clock_path_v2/td2_boot_probe.json tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json tools/out/snes_select_opponent_post_9016_state_compare.json --markdown-out tools/out/snes_select_opponent_post_9016_state_compare.md --label-a default_rival --label-b no_opponent_clock --start-frame 2044 --end-frame 2199`
- observed result:
  - the first shared gameplay-facing window already keeps the same callback
    surface in both lanes for all `156` frames:
    `main = 02:9016`, `irq = 01:96A0`, `nmi = 02:8F3C`.
  - across the same window, `54` sampled fields stay identical.
  - only `14` fields differ at all.
  - stable whole-window differences are limited to selector state
    `$1C70 = 0 -> 3`, `$1C76 = 1 -> 0`, and the paired DP cadence fields
    `$0053/$0054`.
  - the strongest remaining non-selector downstream deltas are:
    - `state_09a2`: `77` differing frames, `38/40 -> 34`
    - `state_09a8`: `11` differing frames, `2 -> 10`
    - paired DP scratch fields `$0020/$0022`: `77` differing frames,
      `192/9 -> 149/294`
- practical reading:
  - the remaining gap is no longer callback reachability or a broad
    post-handoff mystery.
  - the next proving target is a small set of state fields inside the already
    shared `02:9016` corridor.

Next best step:

- rerun the rival/no-opponent pair with a guided export or targeted write trace
  around the first shared `02:9016` window so `state_09a2/state_09a8` and the
  paired DP scratch fields can be tied to visible HUD/opponent-side behavior.

### CP-112: screenshot review pack for the first shared `02:9016` window

- promoted artifacts:
  - `tools/out/post9016_default_rival_capture/`
  - `tools/out/post9016_no_opponent_clock_capture/`
  - `tools/out/post9016_compare_questions.md`
- bounded capture runs:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2044 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2044 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
- supporting normalization:
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_default_rival_capture/capture_input_log.json tools/out/post9016_default_rival_capture/sequence.txt --json-out tools/out/post9016_default_rival_capture/sequence.json --start-frame 2044 --end-frame-exclusive 2085`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_no_opponent_clock_capture/capture_input_log.json tools/out/post9016_no_opponent_clock_capture/sequence.txt --json-out tools/out/post9016_no_opponent_clock_capture/sequence.json --start-frame 2044 --end-frame-exclusive 2085`
- negative result kept:
  - the first attempt to use the bridge-side guided export for the same window
    failed in `extract_mesen_scene_range.py` because `mesen_ppu_extract`
    timed out waiting to reach frame `1280` on the long warmup path.
- observed result:
  - the screenshot capture path succeeds for both lanes over frames
    `2044..2084`, sampled every `4` frames.
  - both capture logs confirm the expected review window shape:
    `41` captured frames each, from `2044` through `2084`.
  - the compare note now points the reviewer directly at matched PNG pairs and
    asks for numbered answers about the earliest visible rival/no-opponent
    difference, BG-vs-OAM ownership, radar/HUD deltas, and whether a later
    window is needed.
- practical reading:
  - this creates a human-review surface that is better matched to the current
    open question than the bridge path.
  - the next narrowing step can now use direct reviewer answers instead of
    guessing which of `09A2/09A8/0020/0022/0053/0054` first becomes visible.

Superseded by `CP-113`: the original `2044` packs were later found to be
misaligned for review because `mesen_capture.lua` was not applying input-window
buttons during warmup, and the chosen default-rival input recipe also stopped
too early.

### CP-113: corrected post-`02:9016` review packs isolate the first visible delta

- code/tool fix:
  - `validation/mesen_capture.lua`
- corrected promoted artifacts:
  - `tools/out/post9016_default_rival_capture/`
  - `tools/out/post9016_no_opponent_clock_capture/`
  - `tools/out/post9016_compare_questions.md`
  - `tools/out/post9016_compare_summary.json`
  - `tools/out/post9016_compare_summary.md`
  - `tools/out/post9016_compare_first_delta_diff.png`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_probe_clock_sanity_v1/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2045 TD2_BOOT_PROBE_SCREENSHOT_FRAME=2044 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_probe_clock_sanity_v2/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2045 TD2_BOOT_PROBE_SCREENSHOT_FRAME=2044 TD2_BOOT_PROBE_TRACE_START_FRAME=1600 TD2_BOOT_PROBE_TRACE_END_FRAME=2044 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=4 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_default_rival_capture/capture_input_log.json tools/out/post9016_default_rival_capture/sequence.txt --json-out tools/out/post9016_default_rival_capture/sequence.json --start-frame 2048 --end-frame-exclusive 2089`
  - `python3 tools/build_capture_sequence_manifest.py tools/out/post9016_no_opponent_clock_capture/capture_input_log.json tools/out/post9016_no_opponent_clock_capture/sequence.txt --json-out tools/out/post9016_no_opponent_clock_capture/sequence.json --start-frame 2048 --end-frame-exclusive 2089`
- observed result:
  - the first boot-probe sanity run kept `TD2_BOOT_PROBE_TRACE_START_FRAME` at
    its default, so `exec_point_trace.first_frames.c1d2` was only learned at
    `2044`; that negative result confirmed callback-relative probe input cannot
    work unless the trace window opens before the trigger point.
  - the corrected probe run with `TRACE_START_FRAME=1600` restores the
    documented no-opponent timing: `c1d2 = 1628`, `be43 = 1713`, `b87 = 1736`,
    and `active_main = 02:9016` at `2044` while preserving `$1C70 = 3`,
    `$1C76 = 0`; the `2044` screenshot itself is still fully black, so that
    frame is not a useful human-review surface.
  - after fixing `mesen_capture.lua` to apply `TD2_CAPTURE_INPUT_WINDOWS`
    during warmup and using the real default-rival `v2` input recipe, the
    corrected capture packs now cover the first shared non-black window
    `2048..2088`.
  - `tools/out/post9016_compare_summary.json` localizes every sampled
    rival-vs-clock delta in that window to the same top-strip bounding box
    `(11, 11, 194, 21)` with `125..137` differing pixels.
  - the first-delta diff image and the corrected PNG pairs show the practical
    semantic read: the default-rival lane carries an extra red radar/opponent
    marker that is absent from the no-opponent lane, while the lower cockpit
    surface stays visually matched in this window.
- practical reading:
  - the open question is no longer “is there any visible divergence after
    `02:9016`?”; the answer is yes, and it appears immediately in the top
    radar/HUD strip once the first non-black shared window begins at `2048`.
  - the next narrowing step is to tie that top-strip delta back to the already
    narrowed WRAM split (`09A2/09A8/0020/0022/0053/0054`) and, optionally, use
    the corrected question sheet for semantic confirmation from a human read.

Next best step:

- tie the corrected top-strip/radar delta back to the already-narrowed state
  split in the shared `02:9016` corridor, using the corrected review pack for
  optional semantic confirmation rather than as the only discovery surface.

### CP-114: extended probe fields close the first live rival-only HUD marker

- tool change:
  - `validation/mesen_probe_boot.lua` now snapshots gameplay-facing fields
    `state_11a7/state_11cd/state_11df/state_11f1/state_11f3/state_11f5`,
    `state_137c`, and OAM staging words `072C/072E/0730/0732/0734/0736/0738/073A`
    inside the normal per-frame probe payload.
- promoted artifacts:
  - `tools/out/post9016_rival_v2_fields/td2_boot_probe.json`
  - `tools/out/post9016_clock_v7_fields/td2_boot_probe.json`
  - `tools/out/post9016_extended_state_compare.json`
  - `tools/out/post9016_extended_state_compare.md`
  - `tools/out/post9016_visual_semantics.json`
  - `tools/out/post9016_visual_semantics.md`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=260 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_rival_v2_fields/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2089 TD2_BOOT_PROBE_TRACE_START_FRAME=2044 TD2_BOOT_PROBE_TRACE_END_FRAME=2088 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=300 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/post9016_clock_v7_fields/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=2089 TD2_BOOT_PROBE_TRACE_START_FRAME=1600 TD2_BOOT_PROBE_TRACE_END_FRAME=2088 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start' TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2,be43=01:BE43,b87=01:8B87,d902d=01:902D,d9111=01:9111' ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `python3 tools/compare_boot_probe_windows.py tools/out/post9016_rival_v2_fields/td2_boot_probe.json tools/out/post9016_clock_v7_fields/td2_boot_probe.json tools/out/post9016_extended_state_compare.json --markdown-out tools/out/post9016_extended_state_compare.md --label-a default_rival_v2_fields --label-b no_opponent_v7_fields --start-frame 2048 --end-frame 2088`
- observed result:
  - the extended compare over `2048..2088` demotes `09A2/09A8` from “first
    visible delta candidates” to secondary intermittent differences.
  - the stable whole-window split is now explicit:
    - `state_1c76 = 1 -> 0`
    - `state_11f3 = 44 -> 0`
    - `oam_0730 = 4618 -> 57600`
    - `state_1c70 = 0 -> 3`
  - the adjacent staged OAM words remain identical:
    - `oam_072c = 4106` in both lanes
    - `oam_0734 = 57600` in both lanes
  - static bank-2 reading at `L0108EF` (`bank2.asm:1145-1165`) matches that
    exact split:
    - `oam_072c <- state_11f1`
    - `oam_0730 <- state_11f3` only when `$1C76 != 0`
    - `oam_0734 <- state_11f5`
  - the corrected human review now fits the code:
    the rival-only red top-strip marker is OAM-owned and disappears in the
    no-opponent lane, while the lower cockpit stays unchanged in this window.
- practical reading:
  - the first live post-`02:9016` divergence is no longer a generic “HUD
    difference”; it is a closed rival-only OAM marker under
    `$1C76 -> state_11f3 -> oam_0730`.
  - the remaining unknowns narrowed again:
    the reported rearview blinking lights and the intermittent
    `state_09a2/state_09a8`-side differences are now later or secondary
    OAM-facing targets, not the first visible split.

### CP-115: full-rate compare demotes `09A2/09A8` as visible pulse candidates

- promoted artifacts:
  - `tools/out/post9016_fullrate_compare.json`
  - `tools/out/post9016_fullrate_compare.md`
  - `tools/out/post9016_intralane_focus_compare.json`
  - `tools/out/post9016_intralane_focus_compare.md`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_default_rival_capture_full/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=400 TD2_CAPTURE_OUTPUT_PREFIX=tools/out/post9016_no_opponent_clock_capture_full/capture TD2_CAPTURE_WARMUP_FRAMES=2048 TD2_CAPTURE_FRAMES=41 TD2_CAPTURE_SCREENSHOT_EVERY=1 TD2_CAPTURE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start;1629-1634:right,down;1636-1641:start;1730-1735:start' ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua`
  - full-rate compare artifact built from those `41`-frame PNG sets
  - adjacent-frame focus compare built for frames `2050->2051`, `2051->2052`,
    `2082->2083`, and `2083->2084` in both lanes
- observed result:
  - the first frame `2048` still behaves like a transition surface:
    rival-vs-clock diff bbox is only `(11, 20, 14, 21)` with `8` pixels.
  - frames `2049..2088` keep the same full top-strip bbox
    `(11, 11, 194, 21)` with no new breakout region at the suspected
    `09A2/09A8` pulse points `2051` and `2083`.
  - the intra-lane focus compare reports `0` mismatched pixels for both rival
    and no-opponent adjacent-frame pairs around `2051` and `2083`.
- practical reading:
  - `09A2/09A8` are now further demoted as explanations for a visible pulse in
    this exact `2048..2088` window.
  - the reported rearview blinking lights likely belong to a later gameplay
    window or a different surface than the first shared post-`02:9016`
    marker split.

### CP-116: first rival-only blink cue narrows to `2048 -> 2049`

- promoted artifacts:
  - `tools/out/post9016_firstframe_blink_compare.json`
  - `tools/out/post9016_firstframe_blink_compare.md`
- bounded validation:
  - direct frame compare for rival `2048 -> 2049`
  - direct frame compare for no-opponent `2048 -> 2049`
- observed result:
  - rival `2048 -> 2049` changes `117` pixels over bbox `(180, 11, 194, 19)`
  - no-opponent `2048 -> 2049` changes `0` pixels
  - the subregion is inside the already-closed top HUD strip but concentrated
    at the right edge, matching the user report that the first cue is the
    rival lights in the rearview turning on rather than the center strip
    marker itself
- practical reading:
  - the first user-reported rival-only blink cue is now narrowed to a single
    lane-local frame step and a small top-right bbox
  - this is strong enough to redirect the next trace away from
    `09A2/09A8` pulse frames and toward rival-only OAM/state changes that can
    explain `2048 -> 2049`

### CP-117: fingerprinted seeded sweep reopens `A/B` equivalence

- promoted tooling/data:
  - `tools/run_track1_seed_sweep.py`
  - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.md`
- bounded validation:
  - `python3 -m py_compile tools/run_track1_seed_sweep.py`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v3_ab_compare --scenario a_hold=60-359:a --scenario b_hold=60-359:b --scenario a_and_b_hold=60-359:a,b`
  - pairwise PNG hash compare across `a_hold`, `b_hold`, and `a_and_b_hold`
  - cross-generation compare against `tools/out/track1_seed_sweep_v2_current/b_hold`
- observed result:
  - the sweep summary now records ROM/savestate SHA-256 and capture config,
    making seed drift explicit in the artifact instead of relying on implicit
    local state
  - on savestate SHA-256
    `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`,
    `a_hold` and `b_hold` are both dynamic and pixel-identical across all
    `300` captured frames
  - `a+b` stays aligned with that same lane through capture `158`
    (`script frame 218`) and first diverges at capture `159`
    (`script frame 219`)
  - that first `a_hold` vs `a+b` divergence is already large and localized:
    `2085` mismatched pixels in bbox `[99, 75, 153, 113]`
  - the current fingerprinted `b_hold` output no longer matches the older
    promoted `v2_current` `b_hold` from capture `0`, so the mutable current
    `game_11.mss` seed must be treated as changed evidence rather than the old
    `76/92/108` baseline
- practical reading:
  - stop treating `b = true` as the only defensible early-gameplay
    accelerator proxy on the current seed
  - CP-118 now supersedes the gameplay reading for this same sweep family:
    the current `game_11.mss` seed audits as menu-bound, so this checkpoint is
    only admissible as deterministic input equivalence inside that seed family

### CP-118: `game_11.mss` seed audit demotes current lane-3 sweep to menu-bound evidence

- promoted artifacts:
  - `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.json`
  - `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
  - `tools/out/game11_seed_surface_audit/game11_a_hold_frame_060.png`
  - `tools/out/game11_seed_surface_audit/game11_a_hold_frame_219.png`
  - `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.md`
  - `tools/run_track1_seed_sweep.py`
- bounded validation:
  - `python3 -m py_compile tools/run_track1_seed_sweep.py`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v3_ab_compare --scenario a_hold=60-359:a --scenario b_hold=60-359:b --scenario a_and_b_hold=60-359:a,b`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=60 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/game11_menu_audit/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss`
  - matched-input boot probes for `a_hold` and `a+b` through frame `229`
- observed result:
  - the no-input audit stays on `active_main = 02:9016`, `irq = 01:96A0`,
    `$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF` for frames `0..7`
  - the same seed presents gameplay-like cockpit imagery at frame `060` but is
    back on the top-level signboard menu by frame `219`
  - sampled `a_hold` and `a+b` probes keep the same top-menu selector family
    through frames `0/60/62/159/219/229`
  - the first sampled cross-scenario state delta is only `state_0960` from
    frame `60` onward
- practical reading:
  - `game_11.mss` must not be treated as a verified gameplay seed
  - the current `v3_ab_compare` divergence at frame `219` is deterministic, but
    still front-end/menu-bound rather than gameplay-backed
  - the next defensible Lane 3 target is now to recover a true gameplay seed
    before promoting more gameplay claims from this sweep family

### CP-119: power-on default-rival post-`02:9016` corridor is input-sensitive

- promoted tooling/data:
  - `tools/compare_capture_sequences.py`
  - `tools/out/post9016_default_rival_probe_none_vs_a_compare.json`
  - `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
  - `tools/out/post9016_default_rival_probe_none_vs_b_compare.json`
  - `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
  - `tools/out/post9016_default_rival_a2050_sequence_compare.json`
  - `tools/out/post9016_default_rival_a2050_sequence_compare.md`
  - `tools/out/post9016_default_rival_b2050_sequence_compare.json`
  - `tools/out/post9016_default_rival_b2050_sequence_compare.md`
  - `tools/out/post9016_default_rival_noinput_frame_02052.png`
  - `tools/out/post9016_default_rival_a_frame_02052.png`
  - `tools/out/post9016_default_rival_noinput_frame_02056.png`
  - `tools/out/post9016_default_rival_a_frame_02056.png`
- bounded validation:
  - three power-on boot probes over frames `2048..2208`:
    - no-input baseline
    - late `A` from `2050..2208`
    - late `B` from `2050..2208`
  - two short power-on capture reruns over frames `2048..2088`:
    - late `A` from `2050..2088`
    - late `B` from `2050..2088`
  - `python3 -m py_compile tools/compare_capture_sequences.py`
  - `python3 tools/compare_capture_sequences.py ...post9016_default_rival_capture_full ...post9016_default_rival_capture_a2050 ...`
  - `python3 tools/compare_capture_sequences.py ...post9016_default_rival_capture_full ...post9016_default_rival_capture_b2050 ...`
- observed result:
  - all three probe lanes keep the same callback surface through `2048..2208`:
    `02:9016` main, `01:96A0` IRQ, `02:8F3C` NMI
  - both late-input lanes first diverge in `state_0960` at frame `2050`:
    - `A`: `0 -> 128`
    - `B`: `0 -> 32768`
  - `A` is the richer lane:
    - `dp_0054` first diverges at `2052`
    - `dp_0053` and `state_09a8` first diverge at `2053`
    - `state_137c` first diverges at `2104`
    - the first post-input visible divergence against no-input is frame `2052`
      with bbox `[17, 13, 193, 17]`
    - from `2054` onward the same lane also diverges over a lower dashboard
      bbox around `[72..88, 155..174]`
  - `B` currently behaves like a control lane:
    - outside `state_0960`, the probe delta set is almost empty
    - visible divergence against no-input is sparse (`2052`, `2068`, `2084`)
- practical reading:
  - the power-on default-rival post-`02:9016` corridor is not just an
    infinitely repeated passive frame
  - but the run still carries the inherited selector family
    (`$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF`), so this does
  not yet close the “verified gameplay seed” gate
  - the best active Lane 3 target is now to extend the `A`-responsive lane
    until it either produces unmistakable world/gameplay motion or cleanly
    exits the inherited top-menu selector family

### CP-120: explicit Lane 3 next-agent handoff added

- promoted docs:
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- bounded validation:
  - `git diff --check -- rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md rom_analysis/docs/next_steps_roadmap.md rom_analysis/docs/progress_checkpoints.md`
- observed result:
  - the current Lane 3 resume point is now explicit instead of being spread
    across the last two checkpoints and multiple compare artifacts
  - the handoff fixes:
    - the invalid `game_11.mss` gameplay-seed assumption
    - the exact trusted artifacts for the late `A/B` narrowing
    - the concrete next experiment (`2050-2400:a` with `B` as control)
- practical reading:
  - the next agent should start from the handoff doc, not from older
    `game_11.mss` sweep notes or the old `v2_current` baseline

### CP-121: preserved manual live-race seed pair now anchors Lane 3

- promoted artifacts:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
  - `manual_artifacts/lane3/lane3_live_race_notes.txt`
  - `manual_artifacts/lane3/responses.txt`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
  - `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
  - `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
  - `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
  - `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- bounded validation:
  - copied the user-created Mesen slot files from `~/.config/Mesen2/SaveStates/`
    into `manual_artifacts/lane3/`
  - `sha256sum` on the preserved copies
  - two short seeded boot probes (`12` frames each) on the preserved primary
    pair
  - `python3 tools/compare_boot_probe_windows.py ...lane3_live_race_mid... ...lane3_live_race_plus30f...`
  - short `mesen_capture.lua` reruns (`8` frames each, no input) as a bounded
    screenshot-path check
- observed result:
  - preserved hashes:
    - `lane3_live_race_mid.mss`:
      `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
    - `lane3_live_race_plus30f.mss`:
      `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
    - `lane3_live_race_slot2_extra.mss`:
      `f2ce9ae98cf0a4563e51adcb9ddcaf0a971c3d55a0e904970483e166c754aec8`
  - user-supplied read for the primary pair:
    - `Porsche` cockpit in motion
    - first `Desert Blast` segment
    - approaching a green NPC traffic car
  - follow-up human-support read now also records:
    - practical route back to `live_race_mid`:
      keep taking the first menu option / keep pressing `A` until gameplay
    - menu semantics:
      `A` advances, `B` backs out one screen
    - gameplay essentials:
      `A` accelerates, `B` reduces speed, d-pad steers
    - `slot2_extra` still looks like intro/credits, matching the technical
      boundary/control read
    - the first filled `live_race_mid` still-frame note keeps:
      straight road, centered yellow divider, straight wheel, green NPC car
      near on the player's right, and an active radar marker
    - the same response extends `live_race_mid` through checkpoint/post-stop
      dialog plus a late police arrival with a third radar marker
  - both primary seeds still load onto the same callback family:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
  - both still inherit the same selector block at frame `0`:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - the pair is not a duplicate:
    - stable all-frame differences over frames `0..11`:
      `dp_0053`, `dp_0054`, `state_09a2`, `state_11f3`
    - strongest split:
      - `live_race_mid`: `state_11f3 = 477..479`,
        `dp_0053/0054 = 120..200`
      - `live_race_plus30f`: `state_11f3 = 627..629`,
        `dp_0053/0054 = 40..64`
  - negative validation result:
    - the current headless screenshot path emitted zero-byte PNGs for both
      `td2_boot_probe_frame.png` and `mesen_capture.lua` outputs on these
      seeds
- practical reading:
  - the next agent should start from the preserved manual seed pair, not from
    `game_11.mss`
  - the new active Lane 3 question is now:
    why do user-verified live-race seeds still present as the old
    `02:9016/01:96A0/02:8F3C` family with inherited selector values?

### CP-122: manual live-race seeds now separate cleanly from the old post-`2050` control corridor

- promoted tooling/docs:
  - `tools/compare_boot_probe_windows.py`
  - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md`
- bounded validation:
  - `python3 -m py_compile tools/compare_boot_probe_windows.py`
  - aligned compare reruns with `--frame-offset-b -2048` over relative
    frames `0..11` against
    `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- observed result:
  - both manual seeds still share the exact callback surface with the control:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
  - both also keep the inherited selector family over the aligned window:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - nevertheless, both manual seeds differ from the aligned control on all
    `12/12` frames in:
    - `oam_0730`
    - `state_11f3`
    - `dp_0053`
    - `dp_0054`
    - `dp_0020`
    - `dp_0022`
    - `state_09a2`
  - strongest stable split:
    - control: `state_11f3 = 44`, `oam_0730 = 4618`
    - `live_race_mid`: `state_11f3 = 477..479`, `oam_0730 = 4645`
    - `live_race_plus30f`: `state_11f3 = 627..629`, `oam_0730 = 4655`
- practical reading:
  - the manual seeds no longer need a new callback-family transition to be
    distinguished from the old post-`2050` corridor
  - the open Lane 3 frontier is now semantic ownership of HUD/OAM/substate
    fields inside the broader `02:9016` family, not discovery of a first
    separating callback

### CP-123: older Lane 3 power-on corridors are now treated as mixed attract/demo evidence

- promoted docs:
  - `rom_analysis/docs/lane3_attract_demo_boundary.md`
- bounded validation:
  - documentation-only consolidation against already-promoted Lane 3 artifacts:
    - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
    - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
    - `rom_analysis/maps/tracks/track1_seed_sweep_v2_current.md`
    - `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
    - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
- observed result:
  - the old no-input and early-input corridors are no longer modeled as a
    clean menu-vs-gameplay boundary
  - the stronger current fit is:
    - short gameplay-like attract/demo slices can appear inside those runs
    - scripted input can cut those slices before they resemble a stable
      player-controlled gameplay session
  - this explains why some archived `02:9016` evidence looked menu-like in one
    pass and gameplay-like in another without requiring a brand-new callback
    family
- practical reading:
  - lack of a long gameplay segment in those older power-on lanes is no longer
    strong disproof of gameplay-adjacent behavior
  - those lanes should now be treated as mixed front-end/presentation/demo
    evidence unless corroborated by stronger code-facing or manual-seed proof

### CP-124: first semantic ownership pass closes the main `02:9016` split fields

- promoted docs:
  - `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- bounded validation:
  - documentation + code-reading consolidation against already-promoted Lane 3
    artifacts and current source:
    - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
    - `bank2.asm` `L0108EF`, `L0117BA`, `L012501`
    - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
    - `bank1.asm` `L009185`, `6250..6272`
  - probe spot-checks from the existing promoted JSONs over:
    - control aligned window `2048..2053`
    - manual live-race windows `0..5`
- observed result:
  - `state_11f3` is now materially explained:
    - `L0117BA` seeds it as `$11F1 - 1` only when `$1C76 != 0`
    - `L0108EF` converts it directly into `oam_0730`
    - `L012501` also compares it against `$1CE8`
  - `state_09a2/state_09a8` now fit the bank-0 OAM builder model:
    - `09A2` is the sprite cursor used while populating `0700/0900`
    - `09A8` is copied into the allocator-side `0AAA` map and is repeatedly
      raised above its default `2` value only around sprite-submission calls
  - `dp_0053/dp_0054` now fit DMA-ring cursor behavior instead of generic
    gameplay state:
    - control spot-check: `E8/E8 -> E8/E8 -> E8/F8 -> F8/F8`
    - `live_race_mid`: `78/78 -> 78/88 -> 88/88 -> 88/98 -> 98/98 -> 98/A8`
    - `live_race_plus30f`: `28/28 -> 28/28 -> 28/28 -> 28/28 -> 28/30 -> 30/40`
    - the step size stays consistent with the `8`-byte descriptor model used
      by the scanline queue summarizer over `7E:0600`
  - `dp_0020/dp_0022` remain discriminative but still look like transient
    builder operands, because bank-2 rewrites `$20.b/$22.b` throughout the
    sprite/HUD submission paths immediately before math and `L001662/L00179B`
    calls
- practical reading:
  - the main `02:9016` split bytes are no longer anonymous
  - the surviving open problem is now producer attribution:
    which exact bank-2 paths are responsible for the extra live-race OAM and
    DMA queue work inside the shared driver

### CP-125: first live-race layer-stack pass narrows gameplay to `BG1 + BG2 + OBJ`

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_layer_stack_summary.json`
  - `tools/out/lane3_live_race_mid_layer_stack_summary.md`
- bounded validation:
  - real-seed raw dump from the working manual live-race seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_bg0_silent.log 2>&1`
  - scanline/PPU sample from the same seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_scanline0.log 2>&1`
  - derived design-pack/tilemap read from the dumped raw files
  - local isolated renders for `BG1`, `BG2`, and `OBJ`
- observed result:
  - the confirmed `live_race_mid` sample now has a direct visible-layer read:
    - `bgMode = 1`
    - `mainLayers = 0x13`
    - visible stack = `BG1 + BG2 + OBJ`
    - `subLayers = 0`
  - `BG1` is stable across the sampled visible scanlines:
    - `hscroll = 0`
    - `vscroll = 1023`
  - `BG2` is the only visible BG layer with meaningful per-scanline movement:
    - `hscroll = 0 -> 945 -> 946`
    - `vscroll = 1023 -> 1013`, then wraps to `0 -> 2`
  - the derived design-pack read matches that mask:
    - `bg1`: `enabledOnMain = true`
    - `bg2`: `enabledOnMain = true`
    - `bg3`: `enabledOnMain = false`
    - `bg4`: inactive
  - the isolated static renderer fits that read conservatively:
    - `BG1` alone still draws a full-scene non-backdrop surface
    - `OBJ` alone draws a smaller actor/HUD region
    - `BG2` alone falls back to backdrop under a single static `ppu_state`,
      which is consistent with a per-scanline/rasterized producer rather than
      strong evidence that `BG2` is absent
  - explicit negative follow-up kept:
    - the same raw helper wrappers returned `255` on
      `lane3_live_race_plus30f.mss` and produced no raw dump artifacts
- practical reading:
  - the older “`BG1 + BG2 + BG3 + OBJ` gameplay stack” heuristic is now too
    strong for the confirmed `live_race_mid` sample
  - current strongest fit is:
    - `BG1` = cockpit/HUD base candidate
    - `BG2` = road/world raster layer candidate
    - `OBJ` = dynamic world/HUD actors
    - `BG3` = present in raw state but not visible on main/sub in this sample
  - the next open edge is not “which visible layer exists” but who drives the
    per-scanline `BG2` motion and whether the same mask holds on the second
    manual seed

### CP-126: runtime path and slot-`#2` boundary sharpen the live-race layer read

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_slot2_boundary_summary.json`
  - `tools/out/lane3_live_race_slot2_boundary_summary.md`
  - `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
  - `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- bounded validation:
  - code-side follow-up on the active live-race family:
    - `nl -ba bank1.asm | sed -n '2008,2098p'`
    - `nl -ba bank1.asm | sed -n '2558,2835p'`
    - `nl -ba bank1.asm | sed -n '5760,5910p'`
    - `nl -ba bank2.asm | sed -n '2148,2255p'`
    - `nl -ba bank2.asm | sed -n '2628,2662p'`
    - `nl -ba bank2.asm | sed -n '6538,6615p'`
    - `nl -ba bank2.asm | sed -n '7204,7278p'`
  - boundary recheck on the preserved extra slot:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
    - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- observed result:
  - the active live-race callback family is now tied more tightly to the
    visible `BG2` road/world read:
    - `bank1.asm` `L009075..L009111` arms the
      `02:9016 / 01:96A0 / 02:8F3C` family
    - `bank1.asm` `L009185` enters `bank2.asm` `L011165`
    - `L011165` runs `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`,
      and `L0108EF` before the OAM flush
    - `bank2.asm` `2628..2644` arms `HDMA7` against destination base `0x0F`,
      i.e. the `BG2` scroll register block
    - `bank1.asm` `5846..5851` also writes `BG2VOFS` from `$22/$23`
  - the preserved extra slot is now explicitly closed as a non-gameplay
    boundary seed:
    - boot probe surface stays `00:8029 / 00:835F / 00:8029`
    - frame-`0` raw dump reads `bgMode = 1`, `mainLayers = 0x04`,
      visible `BG3` only
    - scanline sample stays flat on `BG1/BG2/BG3 = 0 / 1023`
    - compare vs `live_race_mid` differs on all `8/8` frames in the callback
      surface plus live-race workload fields like `state_09a2`, `state_11f3`,
      `dp_0053`, `dp_0054`, and `oam_0730`
- practical reading:
  - the user's layer observation is now useful as a guide on confirmed
    gameplay, but the repo also has a direct nearby counterexample
  - `slot2_extra` is boundary/control evidence, not a second gameplay sample
  - the remaining open problem is specifically producer attribution inside the
    confirmed `02:9016` live-race family, not proving that every nearby seed is
    gameplay

### CP-127: bounded producer trace ties live-race `BG2` motion to `$22/$23` and the IRQ split

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
  - `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- bounded validation:
  - exec/write trace on the confirmed manual live-race seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=16 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_exec_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='main_9111=01:9111,cb_9185=01:9185,cb_9165=02:9165,road_12f48=02:AF48,road_1318d=02:B18D,road_1340e=02:B40E,road_13927=02:B927,road_108ef=02:88EF,road_1070a=02:870A,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='dp22=00:0022,dp23=00:0023,hdma_1e14=7E:1E14,hdma_1e15=7E:1E15,hdma_1e16=7E:1E16,hdma_1e2a=7E:1E2A,split_1e1c=7E:1E1C,split_1e1d=7E:1E1D,split_1e1e=7E:1E1E,split_1e1f=7E:1E1F,next_irq_ptr=00:003E,next_irq_bank=00:0040' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_exec_trace.log 2>&1`
  - PPU register trace on the same seed:
    - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=32 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_ppu_reg_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='cb_9185=01:9185,cb_9165=02:9165,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='bg1hofs=00:210D,bg1vofs=00:210E,bg2hofs=00:210F,bg2vofs=00:2110,bg3hofs=00:2111,bg3vofs=00:2112,tmain=00:212C,tsub=00:212D,hdmaen=00:420C,vtime=00:4209' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_ppu_reg_trace.log 2>&1`
  - static PC follow-up:
    - `nl -ba bank1.asm | sed -n '2688,2820p'`
    - `nl -ba bank1.asm | sed -n '5838,5860p'`
    - `nl -ba bank2.asm | sed -n '6026,6150p'`
- observed result:
  - the bounded exec trace now closes the immediate gameplay-side producer path:
    - exec hits include `01:9185`, `02:9165`, `02:B18D`, `02:870A`,
      `02:88EF`, `01:960D`, and `01:96A0`
    - `02:9165` returns to `01:9189`, confirming the active
      `01:9185 -> 02:9165` call path on the confirmed gameplay seed
  - the same trace now ties live visible `BG2` motion to concrete operands:
    - `dp22` writes: `26`
    - `dp23` writes: `26`
    - `next_irq_ptr` writes: `2`
    - unique retarget points:
      - scanline `24`: `01:9808` -> next IRQ `01:960D`
      - scanline `121`: `01:969F` -> next IRQ `01:96A0`
    - `bank1.asm` `5846..5851` writes `BG2VOFS` directly from `$22/$23`
  - the bounded PPU-register trace now closes the visible split shape:
    - `BG2HOFS/BG2VOFS` hits under cap: `246 / 246`
    - `BG1HOFS/BG1VOFS` hits: `4 / 4`
    - `BG3HOFS/BG3VOFS` hits: `4 / 4`
    - `TMAIN` writes:
      - scanline `23`: `0x17` (`BG1 + BG2 + BG3 + OBJ`)
      - scanline `121`: `0x13` (`BG1 + BG2 + OBJ`)
    - `BG3` writes cluster around scanlines `23/24`
    - `BG1` writes cluster around scanline `120`
    - `BG2VOFS` still receives unique writes across `123` scanlines under the
      configured cap
  - static fit now narrows the strongest current road/world producer cluster:
    - inside `L01318D`, especially `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD /
      02:B134`
- practical reading:
  - the current live-race sample no longer just "looks like" cockpit plus road
    in the debugger; it now has a matching runtime split:
    - `BG1` remains the strongest cockpit-base candidate
    - `BG2` is the strongest road/world raster candidate
    - `BG3` behaves like a split-controlled strip/auxiliary layer on this
      sample rather than the full gameplay world plane
  - the lane is no longer blocked on finding any `BG2` producer path; it is
    blocked on semantic attribution inside the narrowed `L01318D` cluster and
    on recovering the second manual seed through a usable export path

## Next Advancement Gates

### Gate G1 (Immediate): close active bank30 unresolved queue

Goal:
- observe `1E:EE7F` on a real runtime path and resolve reachability for the
  top-level `1E:DA96` `67FB` stream.

Definition of done:
- `tools/out/bank30_chunk_registry.json` no longer lists unresolved `P0/P1`
  entries for bank30.

Current status:
- registry tightening has closed two non-runtime queue entries:
  - `1E:E91F` -> `nested-invalid-marker`
  - `1E:9681` -> `sentinel-control`
- the active unresolved queue is now:
  - `P0`: `1E:EE7F`
  - `P1`: `1E:DA96`
- still open after matrix v1/v2/v3/v5/v6/v7/v10a/v10b/v11/v11b/v12/v12b/v13/v14 sweeps; no runtime hits observed for `EE7F` or `DA96`.
- caller-family expansion partially succeeded (new callsites `01:8E3C/01:8E59`), but target callsites are still absent:
  - `01:B256`, `01:B273`, `01:B59B`
- newest telemetry still shows no runtime use of `L00A9*` index `0x20` (`32`) and no bank30 producer beyond indices `28/29`.
- callback/state forcing can now trigger a single `B1F9` entry, but still does not reach
  `B1F9`'s internal `L001210` callsites (`01:B256/01:B273/01:B59B`).
- stage telemetry now shows no progress beyond entry (`B226/B256/B273/B59B` all `0`)
  in the forced lane.
- targeted exec-point tracing now also confirms the forced entry-time state on both
  `01:9568`/`01:95AD` lanes, but the headless runner still reports only `01:B1F9`
  itself and no downstream helper/return sites.
- widened per-point-capped exec tracing keeps the same boundary:
  - only `01:B1F9` is seen; no `B226/B638/B6E3/B755/9575`
- widened WRAM write tracing around the expected wait-path state also stays flat:
  - no writes at `$0960/$0964/$0200/$0202/$1E2C/$0440/$0442/$0444/$040A`
- targeted side-effect tracing is now also negative: no helper/setup writes were
  observed around the forced `01:B1F9` entry.
- caller-stack proof now closes one ambiguity: the forced lane really is entering
  from `01:9568/01:95AD`.
- the new consolidated stall report closes the remaining headless ambiguity in
  that same lane:
  - both forced lanes hit `01:B1F9` once at frame `1201`
  - post-entry `L001210` hit count is `0`
  - both lanes stay pinned through frame `2199` with `state_1D10 = 0x4100`,
    `state_09A8 = 2`, `state_0960 = 0`
  - static `L00B1F9` read now isolates the `EE7F`-relevant selector to the
    prologue before the first `L00A9A0` call, so the later `L00B6A3/L00B6E3`
    worker surface is no longer a plausible hidden fallback for index `32`
- corrected late-window tracing plus static caller/routine reads now show a more
  specific next proving lane:
  - use manual debugger confirmation for the remaining `B1F9` question, or move
    to the next unblocked roadmap lane in headless mode, because further
    headless exec/state/write widening has stopped changing the observed
    boundary.

### Gate G2: tilemap provenance binding for first frame window (closed)

Goal:
- produce `frame/layer/tile-index -> ROM chunk` mapping for `1086..1093`.

Definition of done:
- provenance table added to:
  - `rom_analysis/maps/tilemaps/`
  - `rom_analysis/docs/memory_map.md`

Current status:
- closed via `mesen_range_1086_1093_provenance.{jsonc,md}` and memory-map binding.

### Gate G3: gameplay-era archaeology start

Goal:
- capture first deterministic gameplay window with design pack + runtime context.

Definition of done:
- one committed gameplay window with:
  - frame range assets
  - callback/context notes
  - initial bank10/bank11 contract pointers

Current status:
- the older promoted `v2_current` sweep is now historical evidence from an
  earlier mutable seed state, not the admissible baseline for the current
  `game_11.mss`
- a committed screenshot-backed `b_hold` cycle now exists for frames `76..156`
- the new seed-surface audit reclassifies the current `game_11.mss` as
  `front_end_menu_seed`:
  - no-input frames `0..7` stay on `02:9016` with `$1C6A = 1`,
    `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF`
  - `a_hold` and `b_hold` are still pixel-identical dynamic lanes from frame
    `62`, and `a+b` still first diverges at frame `219`, but all of that is
    now treated as mixed front-end/attract-demo evidence rather than direct
    gameplay proof
- the repo now does have preserved user-verified live-race seeds, but the
  current blocker has moved:
  - it is no longer "find any code-facing separator from the old corridor"
  - it is now "explain the stable HUD/OAM/substate split that already exists
    inside `02:9016`"
- the confirmed `live_race_mid` seed now also has a first bounded producer
  trace:
  - `$22/$23` are repeatedly rewritten in-frame and directly feed `BG2VOFS`
  - `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24/121`
  - `TMAIN` briefly enables `BG3` at scanline `23`
  - the strongest current producer cluster is narrowed inside `L01318D` around
    `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
- the old post-`2050` no-input default-rival window is now a control surface,
  not the leading gameplay candidate:
  - aligned `0..11` compares show that both manual live-race seeds already
    differ immediately from that control in `oam_0730`, `state_11f3`,
    `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and `state_09a2`
  - the control window remains useful because it keeps the same callback and
    selector family while stripping away the live-race values
- visible-phase scanline work now explains the split itself and narrows the
  remaining edge to the queue cursor lifecycle:
  - visible-phase `7E:0053/0054` now has a directly observed equalization path:
    `00:0054` moves `0x38 -> 0x40 -> 0x48` on frame `90`, and `00:0053`
    catches up to `0x48` on frame `91`
  - the active visible `0600` queue window is empty (`read == write`)
  - late tracing now shows a transient frame-`91` `02:9016` state with
    `00:0055/0056 = 0xB8/0x14` before the older `00:8029` end-of-frame collapse
- next defensible target:
  - keep the old post-`2050` no-input window as the control surface
  - assign exact semantic roles inside the narrowed `L01318D` cluster while
    keeping the already-closed split-field ownership (`state_11f3`, `09A2`,
    `09A8`, `0053/0054`, `0020/0022`) in mind
  - recover a second visual replicate from `live_race_plus30f` through the lab
    backend if that path becomes cheaper than more symbolic narrowing
  - only after that decide whether the best next gameplay-facing target is the
    old frame-`91` burst / frame-`92` reset path or a later `A`-lane follow-up

### CP-126: `live_race_plus30f` lab backend now has a closed frame anchor and a narrower export blocker

- promoted docs:
  - `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
  - `rom_analysis/docs/lane3_today_work_brief.md`
- promoted artifacts:
  - `tools/out/lane3_live_race_plus30f_lab_17495/manifest.json`
- bounded validation:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 0:0 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_smoke`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17495:17495 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17495`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17496:17496 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17496`
- observed result:
  - the smoke failure already closes the absolute start frame of the seed:
    `17495`
  - paired with the earlier `live_race_mid` raw-dump anchor (`16655`), that
    demotes the `plus30f` timing name to a historical label; the measured
    absolute delta between the two preserved seeds is `840` frames
  - the `17495` attempt emits a partial manifest with:
    - `captureCompleted = false`
    - `alignedStartBoundary.ppu.frameCount = 17495`
  - both `17495` and `17496` export attempts fail on the same narrowed bug:
    `failed to advance beyond frame 17495 after PpuFrame + 2048 PPU correction steps`
- practical reading:
  - `live_race_plus30f` is no longer blocked on unknown timing
  - it is blocked on a specific lab-backend boundary-correction failure
  - the next dev should treat human visual exports as the practical fallback
    for today's second-seed work while the backend path remains unstable
