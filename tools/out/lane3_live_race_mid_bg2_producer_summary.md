# Lane 3 Live-Race Mid BG2 Producer Summary

- Note date: `2026-03-27`
- Seed: `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Raw inputs:
  - `tools/out/lane3_live_race_mid_exec_trace.json`
  - `tools/out/lane3_live_race_mid_ppu_reg_trace.json`

## Exec Trace Surface

- exec hits: `7`
- write hits: `54`
- observed exec points:
  - `irq_96a0` at `01:96A0` return `0x833A`
  - `road_1318d` at `02:B18D` return `0x91E0`
  - `road_1070a` at `02:870A` return `0x91E3`
  - `road_108ef` at `02:88EF` return `0x91E6`
  - `irq_960d` at `01:960D` return `0x833A`
  - `cb_9185` at `01:9185` return `0x0001`
  - `cb_9165` at `02:9165` return `0x9189`
- write-count split:
  - `dp22`: `26`
  - `dp23`: `26`
  - `next_irq_ptr`: `2`
- next-IRQ pointer writes:
  - scanline `24`: `01:9808` writes low byte `13` -> next IRQ `01:960D`
  - scanline `121`: `01:969F` writes low byte `160` -> next IRQ `01:96A0`

## PPU Register Split

- `bg2hofs` hits: `246`
- `bg2vofs` hits: `246`
- `bg1hofs` hits: `4`
- `bg1vofs` hits: `4`
- `bg3hofs` hits: `4`
- `bg3vofs` hits: `4`
- `tmain` hits: `2`
- `vtime` hits: `2`
- dropped writes after cap: `20`
- `TMAIN` unique writes:
  - scanline `23`: `01:96A7` -> `23` (`BG1+BG2+BG3+OBJ`)
  - scanline `121`: `01:965A` -> `19` (`BG1+BG2+OBJ`)
- `VTIMEL` unique writes:
  - scanline `225`: `00:8172` -> `23`
  - scanline `24`: `01:9801` -> `120`
- `BG1` unique writes:
  - `bg1hofs` scanline `225` from `00:818B` -> `0`
  - `bg1hofs` scanline `225` from `00:8191` -> `0`
  - `bg1hofs` scanline `120` from `01:9637` -> `0`
  - `bg1hofs` scanline `120` from `01:963A` -> `0`
  - `bg1vofs` scanline `226` from `00:818B` -> `255`
  - `bg1vofs` scanline `226` from `00:8191` -> `255`
  - `bg1vofs` scanline `120` from `01:963D` -> `255`
  - `bg1vofs` scanline `120` from `01:9640` -> `255`
- `BG3` unique writes:
  - `bg3hofs` scanline `226` from `00:818B` -> `0`
  - `bg3hofs` scanline `226` from `00:8191` -> `0`
  - `bg3hofs` scanline `23` from `01:96B7` -> `85`
  - `bg3hofs` scanline `23` from `01:96BD` -> `0`
  - `bg3vofs` scanline `226` from `00:818B` -> `255`
  - `bg3vofs` scanline `226` from `00:8191` -> `255`
  - `bg3vofs` scanline `24` from `01:96C3` -> `20`
  - `bg3vofs` scanline `24` from `01:96C9` -> `0`
- `BG2VOFS` unique scanlines hit under the cap: `123`
- first `BG2` write sample span under the cap: `scanline 0 .. 226`

## Current Reading

- The active live-race frame stays inside 02:9016 / 01:96A0 while repeatedly rewriting $22/$23 and then writing BG2VOFS from those operands.
- The next-IRQ pointer flips between 01:960D and 01:96A0 inside the frame, so gameplay uses a two-phase IRQ split rather than a single static visible pass.
- BG2 registers are written across most visible scanlines, while BG1 writes only land at the deeper split and frame edge and BG3 writes cluster around the early top-strip split.
- This supports using the user debugger observation as a guide: BG1 is a strong cockpit-base candidate, BG2 is the strongest road/world raster candidate, and BG3 looks more like a temporary strip/auxiliary layer in this confirmed sample than the full gameplay world layer.
