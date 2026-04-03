# Track 1 Live-Race `BG2` Producer Path

- Note date: `2026-03-27`
- Primary anchor:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Guide hypothesis used for this pass:
  - the user-observed layer debugger read remained the guide
  - this note still treats that observation as a working hypothesis, not as
    promoted truth by itself

## What Was Run

- bounded exec/write trace on the confirmed live-race seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=16 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_exec_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='main_9111=01:9111,cb_9185=01:9185,cb_9165=02:9165,road_12f48=02:AF48,road_1318d=02:B18D,road_1340e=02:B40E,road_13927=02:B927,road_108ef=02:88EF,road_1070a=02:870A,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='dp22=00:0022,dp23=00:0023,hdma_1e14=7E:1E14,hdma_1e15=7E:1E15,hdma_1e16=7E:1E16,hdma_1e2a=7E:1E2A,split_1e1c=7E:1E1C,split_1e1d=7E:1E1D,split_1e1e=7E:1E1E,split_1e1f=7E:1E1F,next_irq_ptr=00:003E,next_irq_bank=00:0040' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_exec_trace.log 2>&1`
- bounded PPU-register trace on the same seed:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2 TD2_BOOT_PROBE_TRACE_START_FRAME=0 TD2_BOOT_PROBE_TRACE_END_FRAME=0 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=256 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=32 TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=512 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_ppu_reg_trace TD2_BOOT_PROBE_TRACE_EXEC_POINTS='cb_9185=01:9185,cb_9165=02:9165,irq_960d=01:960D,irq_96a0=01:96A0' TD2_BOOT_PROBE_TRACE_WRITE_POINTS='bg1hofs=00:210D,bg1vofs=00:210E,bg2hofs=00:210F,bg2vofs=00:2110,bg3hofs=00:2111,bg3vofs=00:2112,tmain=00:212C,tsub=00:212D,hdmaen=00:420C,vtime=00:4209' ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_mid.mss > tools/out/lane3_live_race_mid_ppu_reg_trace.log 2>&1`
- static ownership reads for the traced PCs:
  - `nl -ba bank1.asm | sed -n '2688,2820p'`
  - `nl -ba bank1.asm | sed -n '5838,5860p'`
  - `nl -ba bank2.asm | sed -n '6026,6150p'`

## Promoted Artifacts

- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`

## Observed Runtime Path

- the confirmed live-race frame stays inside the shared gameplay family while
  still showing internal movement:
  - `active_main = 02:9016`
  - `active_irq = 01:96A0`
- the bounded exec trace now closes the first producer-side call chain:
  - `01:9185`
  - `02:9165`
  - `02:B18D`
  - `02:870A`
  - `02:88EF`
  - later `01:960D`
  - practical fit:
    `01:9185 -> 02:9165` is real on the confirmed gameplay seed, and the
    frame then enters the same bank-2 work cluster already suspected from the
    earlier static read
- the same trace also closes the immediate operand surface behind visible
  `BG2` motion:
  - `dp22` write hits: `26`
  - `dp23` write hits: `26`
  - `next_irq_ptr` write hits: `2`
  - unique `next_irq_ptr` retargets:
    - scanline `24`: `01:9808` writes low byte `0x0D`, i.e. next IRQ
      `01:960D`
    - scanline `121`: `01:969F` writes low byte `0xA0`, i.e. next IRQ
      `01:96A0`
- code-side fit is now explicit rather than heuristic:
  - `bank1.asm` `5846..5851` writes `BG2VOFS` directly from `$22/$23`
  - practical read:
    the repeated `$22/$23` writes are the immediate producer-side operands
    feeding live `BG2` vertical motion on this seed

## Visible Split Shape

- the PPU-register trace makes the split pattern much sharper:
  - `BG2HOFS` hits under the cap: `246`
  - `BG2VOFS` hits under the cap: `246`
  - `BG1HOFS/BG1VOFS` hits: `4 / 4`
  - `BG3HOFS/BG3VOFS` hits: `4 / 4`
  - `TMAIN` hits: `2`
  - dropped write hits after the probe cap: `20`
- the unique control points are high-signal:
  - scanline `23`: `01:96A7` writes `TMAIN = 0x17`
    (`BG1 + BG2 + BG3 + OBJ`)
  - scanline `121`: `01:965A` writes `TMAIN = 0x13`
    (`BG1 + BG2 + OBJ`)
  - `BG3HOFS/BG3VOFS` writes cluster around scanlines `23/24`
  - `BG1HOFS/BG1VOFS` writes cluster around scanline `120`
  - `BG2VOFS` receives unique writes on `123` scanlines under the cap, with a
    sampled span from scanline `0` through `226`
- practical read:
  - `BG2` is the only visible gameplay layer being reprogrammed heavily across
    the frame
  - `BG1` looks like a much more stable base layer
  - `BG3` behaves more like an early split-strip/auxiliary layer than the main
    gameplay world layer on this confirmed sample

## Static Fit On The Traced PCs

- the traced IRQ retarget points line up directly with the split scheduler in
  `bank1.asm`:
  - `2692..2706` choose `VTIMEL` and schedule `01:9809` or `01:960D`
  - `2713..2739` program the `BG3`/window branch and then schedule the next
    IRQ
  - `2750..2754` write `BG1HOFS/BG1VOFS`
- the traced bank-2 `BG2` operand writes now narrow the most promising
  producer cluster inside `L01318D`:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`
- those sites all sit in the same `L01318D` corridor that prepares `$22/$24`
  and calls `L012BE2`, `L012CA8`, `L012D5A`, or `L00179B`
- the earlier `02:A33F / 02:A495 / 02:A7FB` hits still matter, but they now
  read better as supporting cursor/search math than as the whole road builder

## Current Reading

- the user debugger observation is now stronger as a guide on the confirmed
  `live_race_mid` sample:
  - `BG1` is the strongest cockpit-base candidate
  - `BG2` is the strongest road/world raster candidate
  - `OBJ` remains the dynamic actor/HUD bucket
- the new runtime result also narrows `BG3` further:
  - it is still present and can be enabled transiently
  - but on this confirmed gameplay sample it behaves like a split-controlled
    strip/auxiliary layer, not like the full scrolling world plane
- the loop shape is now clearer:
  - main callback family builds producer-side operands and OAM/HUD work
  - the IRQ pair `01:96A0 / 01:960D` retimes visible-layer composition inside
    that same frame
  - the gameplay-visible road motion does not require a different top-level
    callback from `02:9016`; it already exists inside that family

## Remaining Limits

- the PPU-register trace hit the configured write cap and dropped `20` writes
  - that is still enough to close the split shape, but not enough to claim an
    exact full-frame register-write count
- `lane3_live_race_plus30f.mss` still does not have a clean headless raw-dump
  replicate through the current helper path

## Next Best Step

- map the semantic role of the `01:9809` `BG2` write loop and the
  `L01318D` cluster `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
- keep using the user debugger observation as a guide, but only promote claims
  that survive the runtime/code cross-check
- if a second visual replicate is still required, pivot to the lab backend on
  `lane3_live_race_plus30f.mss` instead of reusing `slot2_extra`
