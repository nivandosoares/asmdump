# Bank 2 Archaeology: Gameplay Mechanics

## Overview
Bank 2 contains core gameplay logic, including HUD updates, player car state, and radar tracking.

## Key Routines

### `L0108EF` - Radar Marker Updates
- Tracks Car 1 and Car 2 X-coordinates from `$11F1` and `$11F3`.
- Updates OAM radar slots at `$072C` and `$0730`.
- Logic:
  ```asm
  lda $11F1.w
  lsr A; lsr A; lsr A; lsr A
  ora #$1000.w
  clc; adc #$0008.w
  sta $072C.w
  ```

### `L010930` - Speedometer and Gear Logic
- Reads frame counter `$0964` for timing.
- Calculates gear and speed display.
- Writes to:
  - `$12B9`: Current Gear
  - `$12BA`: Speed high nibble?
  - `$12BB`: Speed low nibble?
- Arms DMA descriptors at `$0600` using cursor `$54`.

## API Contracts (Bank 10/11/30)

| Entry Point | Source Bank | Function |
|-------------|-------------|----------|
| `$0A:0000`  | Bank 6      | Gameplay Initialization |
| `$0A:5322`  | Bank 7      | Physics/AI Update (Mid-race) |
| `$0A:8759`  | Bank 7      | Physics/AI Update (Collision/Event) |
| `$1E:4112`  | Bank 10     | Dispatch Table (Service) |
| `$1E:EE22`  | Bank 10     | Dispatch Table (End-race) |

## Untouched Regions
- **Bank 2:** Large blocks between `$109FC` and the end of the bank contain unmapped physics and AI steering logic.
- **Bank 11:** Zero `RTL` instructions suggest it's a dedicated road-rasterizer subsystem with a private interface.
