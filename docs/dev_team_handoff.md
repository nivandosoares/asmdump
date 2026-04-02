# Dev Team Handoff: C-Rebuild Roadmap

## 1. Engine Architecture Summary (Validated vs Inferred)

### Validated (Confirmed by Trace/Emulator)
- **Main Scheduler:** Bank 0 uses `$0038` as the primary callback vector. NMI cadence drives the engine.
- **Radar Pipeline:** `Bank 2 L0108EF` (`$02:88EF`) translates car X-coordinates from `$11F1..$11F5` to OAM radar slots `$072C..$0734`.
- **UI Logic:** `Bank 2 L010930` (`$02:8930`) handles speedometer and gear calculations.
- **Asset Loading:** `Bank 30` contains compressed chunks (DA96, etc.) using `67FB` algorithm.

### Inferred (Strong Evidence, Awaiting Trace)
- **Physics Core:** `Bank 10` (specifically `$0A:5322`) is the physics integrator. Lack of `RTL` instructions suggests it's a tight loop called by Bank 7.
- **Road Rasterizer:** Bank 11 calculates scanline-by-scanline HDMA tables in WRAM at `$0200` (BG2HOFS) and `$0400` (BG2VOFS). A performance-critical subroutine at `$12EE` in WRAM is called every frame to update these tables based on player speed and track curvature.
- **Track Segments:** `Banks 13/14` likely store the track segments in a 16-bit word-aligned format (curves/hills).

## 2. Logic Modules to Implement in C

### Core Logic (`core/`)
- **`init.c`**: Rebuild `$0A:0000` initialization logic.
- **`physics.c`**: Implement speed calculation and steering based on `$0A:5322`.
- **`actors.c`**: Rebuild AI behavior for rivals and traffic.
- **`collision.c`**: Port collision detection logic from Bank 10.

### Rendering (`render/`)
- **`rasterizer.c`**: Rebuild Bank 11 road rendering (scanline logic).
- **`sprites.c`**: Implement OAM builder (`L0108EF` equivalent).
- **`ui.c`**: Handle HUD updates and speedometer logic.

### Assets (`assets/`)
- **`decompressor.c`**: Implement the `L001210` decompression algorithms (`42FB`, `26FB`, `67FB`, `27FB`).
- **`loader.c`**: Handle asset dispatching from Bank 30.

## 3. Immediate Priorities for Disassembly

1.  **Bank 11 (Road):** Trace the scanline-by-scanline HDMA table generation.
2.  **Bank 10 (Physics):** Isolate the velocity integrator loop.
3.  **Bank 13/14 (Track):** Define the road segment data format (curves, hills, scenario triggers).

## 4. Visualization Targets (Datagrams)
- **Data Flow:** [engine_datagram.md](file:///home/nivando-soares/asmdump/docs/engine_datagram.md)
- **Logic Flow:** [engine_pseudocode.md](file:///home/nivando-soares/asmdump/docs/engine_pseudocode.md)
- **Sprite Extraction:** Status is **Advanced** (Banks 6-9).

## 5. Next Steps for Agents
- Proactively analyze Bank 11's `rts` points to find the main raster loop.
- Cross-reference Bank 13/14 data with Bank 11's segment readers.
- Keep `bank_disassembly_status.md` updated with every new discovery.
