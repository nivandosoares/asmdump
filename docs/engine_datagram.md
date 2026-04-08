# The Duel: Engine Architecture Datagram

## Data Flow Overview

```mermaid
graph TD
    subgraph "Input / Callback Layer"
        Joypad[Joypad Registers $4218] --> MainCB[Main Callback 02:9016]
        MainCB --> IRQCB[IRQ Callback 01:96A0]
    end

    subgraph "Logic Layer (Bank 10 / Bank 2)"
        MainCB --> PlayerPhysics[Player Physics: Acceleration/Braking/Steering]
        PlayerPhysics --> WorldState[World State: Speed $11CE, Gear $12B9, Pos]
        WorldState --> AI_Logic[Opponent/Traffic AI: Bank 10]
        AI_Logic --> ActorState[Actor Positions: $11F1, $11F3, $11F5]
        ActorState --> Collision[Collision Detection: Bank 10/Bank 2]
        MainCB --> HudState[Gameplay HUD / Late-Entry State]
        IRQCB --> VisibleSplit[Cockpit / Road / BG Split]
    end

    subgraph "Asset Layer (ROM Sources)"
        Dispatch[Asset Dispatcher: Bank 30] --> Decompressor[SNES Decompressor: L001210]
        Decompressor --> VRAM_Staging[VRAM/CGRAM Buffers]
        Bank21Obj[SNES Bank $15 Object Catalogs\nrepo file bank21.asm]
        Bank21Obj --> TileObj3250[Late-entry object 15:B4A8\npayload 15:B4B8]
    end

    subgraph "Rendering / Staging Layer"
        WorldState --> RoadRaster[Road Rasterizer: Bank 11]
        ActorState --> OAM_Builder[OAM Builder: L0108EF / Bank 2]
        RoadRaster --> HDMA_Queue[HDMA/Scroll Queues]
        OAM_Builder --> OAM_Staging[OAM Buffer $0700]
        HudState --> QueueBuilder[Queue Builder Family\nBank 0 L001895 / L001A70]
        TileObj3250 --> QueueBuilder
        QueueBuilder --> DMAQueue[0600 DMA Queue]
        DMAQueue --> Desc3250[3250 visible descriptor\n01 B8 B4 15 20 00 80 61]
    end

    subgraph "SNES Hardware Handoff (Bank 0)"
        HDMA_Queue --> NMI[NMI L00014A: DMA/VRAM Upload]
        OAM_Staging --> NMI
        VRAM_Staging --> NMI
        Desc3250 --> NMI
        NMI --> BG1Tile[VRAM 0x6180 -> BG1 tile 396]
        BG1Tile --> VisiblePix[Visible BG1 cell (4,24)\napprox screen (32,193)]
    end
```

## Comparison Hook For The Port

- The current SNES-side proof is not “final VRAM alone explains frame 3250”.
- The live hardware path can select a small bank-15 tile object during the
  `02:9016 / 01:96A0` gameplay family, queue it in `$0600`, and only then let
  NMI materialize it into visible BG1 CHR.
- That is the comparison target for the port data flow:
  a gameplay-side object selector plus a queue-backed VRAM handoff, not only a
  flat end-frame state snapshot.

## Core Logic Modules

### 1. Physics & Simulation (`core/physics.c`)
- **Acceleration:** Derived from Gear ($12B9) and RPM (not yet mapped).
- **Steering:** Modifies player X-offset relative to road center.
- **Velocity:** Integral of acceleration, stored at `$11CE`.

### 2. Actor Management (`core/actors.c`)
- **Tracking:** Car 1 ($11F1), Car 2 ($11F3), Car 3 ($11F5).
- **AI Behavior:** Simple state machine in Bank 10 that updates X/Y coordinates based on player speed and track curvature.
- **Radar:** Mapping X-coordinates to the HUD top-strip ($072C, $0730).

### 3. Visual Pipeline (`render/rasterizer.c`)
- **Road:** Scanline-by-scanline HDMA updates for BG2HOFS/BG2VOFS.
- **HUD:** BG1 cockpit static layer + dynamic OAM overlays (needle, gear).
- **Sprites:** 128-entry OAM table built every frame from ActorState.

### 4. System Scheduler (`platform/snes_sim.c`)
- **Main Loop:** Jumps through `$0038` vector.
- **V-Blank (NMI):** Processes the `$0600` DMA queue and copies `$0700` to SNES OAM.
- **Raster Split (IRQ):** Handles the cockpit/road screen split.

### 5. Current Late-Gameplay Constraint
- **Frame `3250`:** One active visible descriptor survives on the queue.
- **Descriptor:** `01 B8 B4 15 20 00 80 61`.
- **Interpretation:** A one-tile object from SNES bank `$15`
  (`15:B4A8 -> 15:B4B8`) is streamed into `VRAM 0x6180`, which resolves to
  visible `BG1` tile `396`.
