# Lane 3 Today Brief

- Date: `2026-03-28`
- Audience: next dev picking up Lane 3 today
- Current source of truth:
  - `rom_analysis/docs/gameplay_default_rival_next_agent_handoff.md`
  - `rom_analysis/docs/lane3_visual_annotation_template.md`
  - `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
  - `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`

## Situation

The repo already has preserved manual live-race seeds, and that changed the
Lane 3 problem materially.

What is closed:

- `game_11.mss` is no longer admissible as a gameplay seed
- `lane3_live_race_mid.mss` and `lane3_live_race_plus30f.mss` are preserved
  and user-identified as real Desert Blast gameplay imagery
- a first human support note is now recorded in
  `manual_artifacts/lane3/responses.txt`
- the practical route back to `live_race_mid` is now explicit:
  keep taking the first menu option / keep pressing `A` until gameplay;
  `B` backs out one screen; in gameplay `A` accelerates, `B` reduces speed,
  and the d-pad steers
- the old post-`2050` power-on corridor is now a control surface, not the best
  gameplay anchor
- the first ownership pass is closed on:
  - `state_11f3 -> oam_0730`
  - `state_09a2`
  - `state_09a8`
  - `dp_0053 / dp_0054`
  - `dp_0020 / dp_0022`
- `lane3_live_race_mid` already narrows the visible gameplay stack to
  `BG1 + BG2 + OBJ`
- `slot2_extra` is now explicitly a boundary/control seed, not gameplay;
  the new human response also still describes it as intro/credits

What is still open:

- exact semantics of the narrowed `L01318D` cluster
- a second strong technical replicate for `live_race_plus30f`
- a robust image/export path for the manual seeds
- an equally detailed still-frame note for `live_race_plus30f`; the new human
  response is richest on `live_race_mid`

## Hard Facts To Keep Fixed

- `lane3_live_race_mid.mss`
  - preserved path:
    `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - current absolute frame anchor:
    `ppu.frameCount = 16655`
- `lane3_live_race_plus30f.mss`
  - preserved path:
    `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - current absolute frame anchor:
    `ppu.frameCount = 17495`
- measured absolute delta:
  - `17495 - 16655 = 840`
  - so `plus30f` is now only a historical filename, not a validated `+30f`
    timing claim
- current gameplay-family callback surface for both primary seeds:
  - `main = 02:9016`
  - `irq = 01:96A0`
  - `nmi = 02:8F3C`
- inherited selector block that still survives in those seeds:
  - `$1C6A = 1`
  - `$1C70 = 0`
  - `$1C76 = 1`
  - `$0202 = 0xFFFF`
- current strongest producer cluster:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`

## Priority Order For Today

1. Keep `live_race_mid` as the primary technical seed.
2. Use `live_race_plus30f` as the second visual reference, but do not assume
   it is machine-exportable today.
3. Spend effort on exact producer attribution inside `L01318D` before doing
   broad new sweeps.
4. Use human-visual exports and annotations deliberately; they have been the
   main catalyst on this lane and are still high leverage.
5. Do not reopen `game_11.mss` or `slot2_extra` as gameplay candidates.

## Important Open Questions

1. Which exact member of `L01318D`
   (`02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`) is the real road-line
   builder, and which are support/cursor math?
2. Which owner advances the extra live-race movement in `state_09A2`,
   `state_09A8`, `dp_0053`, and `dp_0054` alongside the `BG2` producer path?
3. Why do visually real gameplay seeds still surface under `02:9016` with the
   inherited selector block?
4. Is the current lab-backend failure on `live_race_plus30f` specific to that
   seed, or is it a general savestate-boundary bug in the backend path?
5. Which visibly distinct gameplay cues are the best anchors for mapping
   `BG1`, `BG2`, `OBJ`, and rival/HUD ownership without relying on broken
   headless screenshots?

## Documentation Requests

If another dev or human collaborator touches Lane 3 today, ask for these docs
back with the artifacts.

Preferred quick-fill template:

- `rom_analysis/docs/lane3_visual_annotation_template.md`

### Technical docs to request

- a short note when any new trace/export is promoted:
  - what exact command ran
  - which seed was used
  - whether frame numbering is absolute or savestate-relative
  - what changed in the reading
- a narrow ownership note whenever one PC in `L01318D` is promoted:
  - what it writes
  - what upstream operands feed it
  - what visible claim it supports
- an explicit failure note for any backend/export failure:
  - exact command
  - exact error text
  - whether artifacts were partially emitted

### Human visual docs to request

- a short Markdown note per export window with:
  - road shape:
    straight / left curve / right curve / crest / tunnel / bridge / rain
  - traffic:
    none / distant / approaching / side-by-side / passing
  - cockpit state:
    wheel straight / left / right
  - HUD state:
    speed/needle movement, radar marker, police/rival cues, blinking lights
  - scenery:
    horizon, desert props, barriers, roadside objects
  - confidence:
    what is certain vs what is guesswork

## Export Queue Worth Doing Today

### E1. Manual screenshot pair for the preserved live-race seeds

Goal:

- give the next dev a real visual sidecar for the preserved technical seeds

Current status:

- `manual_artifacts/lane3/responses.txt` now records a first filled screenshot
  note for `ESTADO 1` / `live_race_mid`
- strongest current read from that note:
  - green NPC car near on the player's right
  - wheel straight
  - straight road with centered yellow divider
  - `Porsche 959` cockpit base
  - active radar marker
- the same response also says `slot2_extra` still looks like intro/credits
- remaining gap:
  - no equally detailed still-frame note is recorded there yet for
    `live_race_plus30f`

Requested output:

- one screenshot for `lane3_live_race_mid.mss`
- one screenshot for `lane3_live_race_plus30f.mss`
- optional third screenshot for `lane3_live_race_slot2_extra.mss` as a
  boundary/control visual contrast

Human annotation prompts:

- where is the green NPC car?
- is the wheel straight or turned?
- is the road straight or curving?
- which parts of the screen feel like cockpit base vs moving road vs dynamic
  objects?
- is there any top-strip/radar/rival cue obviously active?

### E2. Short manual video clip around `live_race_mid`

Goal:

- give motion context the static technical traces do not provide

Current status:

- the new human response already summarizes a short local clip from
  `live_race_mid`
- strongest current motion/scene hooks from that summary:
  - road curves plus elevations/depressions
  - insects hitting the windshield
  - checkpoint/post stop, gas-station dialog, and partial-results screen
  - late police arrival with siren and a third radar marker
- remaining gap:
  - if the clip itself needs to become a promoted artifact later, pair this
    summary with a time-stamped note rather than re-asking for the same human
    read

Requested output:

- `5..10` seconds of footage starting from `lane3_live_race_mid.mss`

Human annotation prompts:

- what visibly moves first:
  road, horizon, traffic, HUD needle, rival marker, wheel?
- does the green car approach in depth, lateral motion, or both?
- is any layer visibly split near the top strip?

### E3. `live_race_mid` producer-side export pack

Goal:

- help the next dev correlate `L01318D` work with visible gameplay claims

Use existing promoted artifacts first:

- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `tools/out/lane3_live_race_mid_layer_stack_summary.json`
- `tools/out/lane3_live_race_mid_layer_stack_summary.md`

If more export work is needed:

- bounded exec/write trace centered on:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`
- keep `01:960D`, `01:96A0`, and `01:9809` in the same run

Human annotation prompts:

- if a trace line is promoted as “road builder”, what concrete visible cue is
  it meant to explain?
- is the cue road pitch, road curvature, horizon split, NPC placement, or HUD?

### E4. `live_race_plus30f` lab-backend retry only if doing tooling work

Goal:

- recover a second technical replicate without relying on broken PNG exports

Current state:

- seed starts at absolute frame `17495`
- current backend fails at boundary correction on both `17495` and `17496`

Only do this if you are explicitly touching backend/tooling today.

### E5. Boundary/control contrast pack

Goal:

- stop future confusion between gameplay seeds and nearby non-gameplay seeds

Use:

- `lane3_live_race_mid.mss`
- `lane3_live_race_slot2_extra.mss`
- old `post9016` control compare artifacts

Human annotation prompts:

- what is visibly missing from `slot2_extra` that is present in `live_race_mid`?
- does `slot2_extra` look like menu, transition, split strip, or attract?
- which visual cue most clearly separates “true live-race feel” from the
  older `00:8029` boundary family?

## Minimal Human Annotation Template

Use this exact structure if someone sends back a note quickly:

```md
# Lane 3 Visual Note

- artifact:
- seed:
- frame/time:
- road shape:
- traffic state:
- cockpit wheel state:
- HUD/radar/rival cue:
- scenery cue:
- strongest moving element:
- strongest static element:
- confidence:
- open doubt:
```

## Recommended Work Split

If two people are working today, split like this:

- Dev A:
  producer attribution inside `L01318D` and related IRQ scheduler ownership
- Dev B:
  export/annotation pipeline and visual sidecars for `live_race_mid` and
  `live_race_plus30f`

That keeps the code-facing and human-facing catalyst lanes moving in parallel
without redoing the same work.
