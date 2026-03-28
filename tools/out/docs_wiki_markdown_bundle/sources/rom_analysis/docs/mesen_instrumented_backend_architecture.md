# Instrumented Mesen Backend Architecture

Date: `2026-03-22`

This note documents the first engineering pass toward turning the local
`Mesen2` tree into a laboratory backend for ROM archaeology and native-port
evidence capture.

The intent is not generic emulator hacking. The backend is meant to produce
repeatable, structured evidence bundles that reduce ambiguity in the original
ROM behavior.

## 1. Source Findings

Verified in `/home/nivando-soares/Mesen2`.

### 1.1 Existing backend entrypoint

- `UI/Program.cs`
  - already routes `--testRunner` before Avalonia UI startup
- `UI/Utilities/TestRunner.cs`
  - initializes the emulator headlessly
  - loads one ROM
  - loads debugger workspace
  - can run without normal GUI lifecycle

Reading:

- a new backend mode can sit beside `TestRunner` with minimal disruption
- this is the lowest-risk integration point for an MVP

### 1.2 Frame ownership and boundaries

- `Core/Shared/Emulator.cpp`
  - `Emulator::Run()` drives `_console->RunFrame()`
  - `Emulator::ProcessEvent()` already routes `StartFrame`, `EndFrame`, `Nmi`,
    `Irq`, `StateLoaded`, etc through the debugger/script path
- `Core/SNES/SnesConsole.cpp`
  - `SnesConsole::RunFrame()` loops on `_cpu->Exec()` until `_frameRunning`
    becomes false
  - `ProcessEndOfFrame()` performs end-of-frame housekeeping
- `Core/SNES/SnesPpu.cpp`
  - `EventType::EndFrame` is emitted at the NMI/VBlank-side frame completion
  - `_frameCount++` happens there
  - `ConsoleNotificationType::PpuFrameDone` is sent from `SendFrame()`
  - `EventType::StartFrame` is emitted when scanline wraps to the next frame

Reading:

- the stable architectural boundaries already exist
- the MVP can consume them indirectly through debugger stepping and frame count
- a future lab sink should attach directly at these `StartFrame`/`EndFrame`
  sites to remove boundary ambiguity

### 1.3 VRAM / CGRAM / OAM / Mode 7 write paths

- `Core/SNES/SnesPpu.cpp`
  - `0x2104` OAM writes call `ProcessPpuWrite(..., MemoryType::SnesSpriteRam)`
  - `0x2118/0x2119` VRAM writes call
    `ProcessPpuWrite(..., MemoryType::SnesVideoRam)`
  - `0x2122` CGRAM writes call
    `ProcessPpuWrite(..., MemoryType::SnesCgRam)`
  - `0x211A..0x2120` update `_state.Mode7.*` directly

Reading:

- VRAM/CGRAM/OAM already have single choke points
- Mode 7 register writes are similarly centralized, even if not all of them
  use the same `ProcessPpuWrite` path

### 1.4 DMA paths

- `Core/SNES/SnesDmaController.cpp`
  - `Write(0x420B)` arms manual DMA
  - `Write(0x420C)` arms HDMA
  - `CopyDmaByte(...)` is the byte-level transfer choke point
  - `RunDma(...)` and `RunHdmaTransfer(...)` sit above it

Reading:

- `CopyDmaByte(...)` is the best eventual core hook for a first-class DMA lab
  sink
- for the MVP, debugger events already carry enough DMA attribution to avoid
  touching the core

### 1.5 Existing debugger/export infrastructure

- `Core/SNES/Debugger/SnesEventManager.cpp`
  - already classifies SNES register activity into:
    - OAM writes
    - BG option writes
    - BG scroll writes
    - VRAM writes
    - Mode 7 writes
    - CGRAM writes
    - other writes
  - attaches scanline, cycle, DMA channel, DMA channel config, and program
    counter
- `UI/Interop/DebugApi.cs`
  - exposes:
    - `InitializeDebugger`
    - `Step`
    - `GetConsoleState`
    - `GetCpuState`
    - `GetPpuState`
    - `GetMemoryState`
    - `SetInputOverrides`
    - `TakeEventSnapshot`
    - `GetDebugEvents`
- `UI/Interop/ConsoleState/SnesState.cs`
  - already exposes `SnesState`, `SnesPpuState`, `Mode7Config`,
    `SnesDmaControllerState`, etc
- `UI/Interop/NotificationListener.cs`
  - already exposes `PpuFrameDone` notifications

Reading:

- the MVP can be implemented entirely in C# against real emulator execution
- this avoids immediate C++ core surgery
- this is appropriate for a first vertical slice

## 2. Instrumentation Architecture

### 2.1 MVP architecture

- `LabRunner`
  - new backend-oriented runner beside `TestRunner`
- execution controller
  - loads ROM
  - optionally loads savestate
  - aligns to a frame boundary
  - applies scripted input windows
  - advances through a requested range
- probe selection
  - configures existing debugger event categories and memory dumps
- artifact writer
  - writes deterministic per-frame JSON and binary outputs
- manifest writer
  - records ROM hash, build version, range, probe sets, capture semantics, and
    artifact paths

### 2.2 Data flow

1. `Program.Main` detects `--labRunner`
2. `LabRunner` initializes headless emulation
3. `LabRunner` initializes debugger access
4. `LabRunner` configures the SNES event viewer categories for the selected
   probe sets
5. For each frame:
   - capture `startBoundary`
   - apply input override
   - advance to the next frame boundary
   - capture `endBoundary`
   - snapshot debugger events with previous-frame visibility enabled
   - dump optional `VRAM/CGRAM/OAM`
   - write `frame.json` and `events.json`
6. At end:
   - write `summary.json`
   - write `manifest.json`

### 2.3 Enable/disable strategy

- when `--labRunner` is not used, nothing changes for normal emulator startup
- within `--labRunner`, probe selection gates:
  - event categories
  - memory dumps
  - Mode 7 state export emphasis

### 2.4 Why this is the right first split

- it reuses proven debugger infrastructure instead of duplicating it
- it keeps the core untouched for the first slice
- it produces real artifacts now
- it leaves a clean path for a later core-native sink layer

### 2.5 Known MVP limitation

The debugger stepping surface does not yet give a perfectly canonical
single-instant “frame snapshot”. The current runner therefore exports both:

- `startBoundary`
- `endBoundary`

and uses previous-frame event snapshots explicitly. That is deliberate. The
backend should expose the ambiguity rather than hide it.

## 3. Backend/CLI Design

Current implemented mode:

```sh
Mesen --labRunner <rom> \
  --load-state <file> \
  --run-range <start:end> \
  --input-script <windows> \
  --probe-set <list> \
  --export-dir <path> \
  [--manifest-out <file>]
```

Implemented options:

- `--load-state <file>`
- `--run-range <start:end>`
- `--input-script <windows>`
- `--probe-set frame_core_probe,dma_vram_probe,mode7_probe`
- `--export-dir <path>`
- `--manifest-out <file>`

Input-script format:

- `frame:buttons`
- `start-end:buttons`
- buttons use the same comma-separated tokens already used in the repo:
  - `a,b,x,y,l,r,u,d,up,down,left,right,select,start`

Example:

```sh
./validation/run_mesen_lab_backend.sh \
  ./game.smc \
  --load-state ./.mesen-config/Mesen2/SaveStates/game_11.mss \
  --run-range 18030:18032 \
  --probe-set frame_core_probe,dma_vram_probe,mode7_probe \
  --export-dir tools/out/mesen_lab_mvp_18030_18032
```

Next CLI step after the MVP:

- add relative range syntax for savestate-seeded work such as `+0:+16`
- add named probe presets instead of comma-only flags
- optionally add a JSON spec mode once the direct CLI surface stabilizes

## 4. Probe Sets

### 4.1 `frame_core_probe`

Purpose:

- provide frame-indexed timing and execution context for reproducible windows

Signals:

- frame index
- master clock
- CPU register surface
- PPU frame/scanline/cycle state
- layer scroll/base config
- NMI/IRQ event counts

Schema:

- in `frame.json`
  - `startBoundary`
  - `endBoundary`
  - `eventSummary`

Port value:

- creates the minimal behavioral contract needed to anchor later comparison

### 4.2 `dma_vram_probe`

Purpose:

- capture data motion that directly changes rendered state

Signals:

- DMA-attributed register events
- VRAM write events
- CGRAM write events
- OAM write events
- raw `vram.bin`
- raw `cgram.bin`
- raw `oam.bin`
- per-dump SHA-256

Schema:

- `events.json`
- `frame.json -> memoryDumps`
- `frame_XXXXXX/vram.bin`
- `frame_XXXXXX/cgram.bin`
- `frame_XXXXXX/oam.bin`

Port value:

- exposes exactly which memory surfaces changed and preserves a diffable
  binary end state

### 4.3 `mode7_probe`

Purpose:

- surface transformation-relevant state for Mode 7 reconstruction

Signals:

- Mode 7 matrix values
- scroll
- center
- mirroring/fill flags
- Mode 7 register write events

Schema:

- `frame.json -> startBoundary.ppu.mode7`
- `frame.json -> endBoundary.ppu.mode7`
- `events.json` entries with category `mode7_write`

Port value:

- reduces ambiguity around producer switches vs parameter-only changes

### 4.4 Planned `ownership_probe`

Purpose:

- infer producer / callback / dispatcher ownership transitions

Planned signals:

- repeated PC hotspots from event sources
- optional callstack surface
- optional callback/dispatcher watch fields

Current status:

- designed only
- not implemented in the MVP

### 4.5 Planned `visual_contract_probe`

Purpose:

- bind runtime state to visual outputs and downstream scene comparison

Planned signals:

- frame metadata
- layer state
- relevant writes
- optional screenshot/tilemap/sprite surfaces

Current status:

- designed only
- not implemented in the MVP

## 5. Implementation Plan

### 5.1 Smallest valuable slice

- add a backend runner in `UI`
- keep it SNES-only for the first pass
- reuse debugger stepping/events/state/memory APIs
- emit deterministic JSON + binary bundles

### 5.2 Files touched in the first pass

In `Mesen2`:

- `UI/Program.cs`
- `UI/Utilities/CommandLineHelper.cs`
- `UI/Utilities/DependencyHelper.cs`
- `UI/Utilities/LabRunner.cs`

In `asmdump`:

- `validation/run_mesen_lab_backend.sh`
- `validation/README.md`
- this note

### 5.3 Main risks

- debugger step semantics at frame boundaries are subtle
- long warm-up ranges are expensive with frame-by-frame stepping
- the current MVP still depends on debugger lifetime and event snapshot
  semantics
- compile/publish behavior in the local `Mesen2` tree is noisier than the
  minimal code delta itself

## 6. Implementation Progress

Actually implemented:

- `--labRunner` mode wired into `Program.Main`
- CLI parsing for:
  - `--load-state`
  - `--run-range`
  - `--input-script`
  - `--probe-set`
  - `--export-dir`
  - `--manifest-out`
- SNES-only MVP exporter
- deterministic artifact layout
- frame-core state export
- debugger event export
- optional `VRAM/CGRAM/OAM` dumps with SHA-256
- shell launcher in `validation/`
- fallback dependency loading from on-disk `Dependencies.zip` beside the local
  executable

Still planned / not implemented:

- first-class core-native lab sink
- screenshot/tilemap/sprite capture integration in the backend mode
- ownership/callback-focused probe set
- visual-contract probe set
- relative frame ranges
- condition/event-based stop rules

## 7. Validation

### 7.1 What was tested

Code-level validation:

- `dotnet build UI/UI.csproj -c Release -p:RuntimeIdentifier=linux-x64 -t:Compile --no-restore`
  - succeeded for the first MVP cut before the later frame-boundary fix

Runtime/backend validation:

- savestate frame discovery:
  - `./validation/run_mesen_lab_backend.sh ... --load-state game_11.mss --run-range 0:0`
  - result: fast failure with verified message
    `loaded state starts at frame 18030`
- first exact-range run against that savestate:
  - `--run-range 18030:18032`
  - result: exposed a real frame-boundary mismatch
    `expected 18031, got 18030`
- attempted no-savestate validation at `300:302`
  - result: too expensive for the first backend cut and not useful enough to
    justify repeated retries before fixing the stepping surface

### 7.2 What was learned

- the savestate path is usable and provides a precise absolute frame anchor
- `Step(PpuFrame)` is not sufficient by itself for this backend contract
- the runner must explicitly handle “advance until frame count changes” instead
  of assuming one `PpuFrame` step equals one frame-count transition

### 7.3 Artifact examples

Produced during validation:

- `tools/out/mesen_lab_state_probe/`
  - run attempt used to discover that `game_11.mss` begins at frame `18030`

Not yet produced successfully after the stepping fix:

- a clean `18030..18032` three-frame bundle with all probes

That makes the current state a partial implementation with a concrete,
narrowed runtime blocker rather than a completed validated backend.

## 8. Recommended Next Steps

1. Rebuild the local `Mesen2` output cleanly after the stepping fix and rerun
   the `18030..18032` savestate-backed capture.
2. Promote the current boundary workaround into a cleaner helper with explicit
   metadata about any correction `PpuStep` count used.
3. Add relative-range syntax for savestate-seeded workflows.
4. Add a first ownership-focused summary surface:
   - top event PCs
   - optional callstack head
   - callback/watch fields from known WRAM/state points
5. Move the second slice into the core:
   - a lab sink fed directly from `StartFrame` / `EndFrame`,
     `ProcessPpuWrite(...)`, and `CopyDmaByte(...)`
   - keep the C# runner as the orchestration layer above it
