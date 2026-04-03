# Late `00:8029` Mode 7 Blob Cycle (`1134..1200`)

This note closes the next ownership question for the late `00:8029` tail:
what exactly owns the producer-side reactivation after the flat `1114..1133`
steady block?

The answer is now stronger than "DMA came back at `1165`":

- the resumed late cycle is still under `00:8029`
- the `VRAM` burst path is the same `1A:AA10 / 1A:AB58 / 1A:ACA0` blob family
  already used by the earlier `build_mode7_source_scene.py` bridge-visible
  model
- the direct `VMDATA` burst and the `DMA0 -> VMDATAL` burst match the same ROM
  blob on every sampled burst frame
- the resumed `OAM` DMA is the normal `$096A -> $0700 -> OAMDATA` path, not a
  separate late special-case uploader

Primary artifacts:

- `tools/out/activity_trace_1134_1200/activity_trace.json`
- `tools/out/activity_trace_1134_1200/activity_trace.md`
- `tools/out/mode7_blob_cycle_1134_1200/report.json`
- `tools/out/mode7_blob_cycle_1134_1200/report.md`

Builder path:

- `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
- `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`

## Runtime Read

The wide `1134..1200` trace now splits into three layers:

- `1134..1163`
  - still the solved flat `00:8029` surface
  - no DMA/direct writes
  - `Mode 7` register loop only
- `1164`
  - still no producer burst
  - but `state0204` and `dp0054` step to `2` / `0x88`
- `1165..1200`
  - `OAM` DMA resumes every frame sampled by the probe
  - `VRAM` burst frames recur under the same callback family

The new blob-cycle report proves the producer-side burst identity precisely:

- the refreshed report now also filters strictly to the traced `1134..1200`
  window and emits per-transition schedule rows instead of only burst rows
- burst frames sampled in this report:
  - `1165, 1170, 1172, 1174, 1175, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1198, 1199, 1200`
- transition rows now make the cadence explicit:
  - isolated early burst probes:
    `1165`, `1170`, `1172`
  - first double-burst pair:
    `1174..1175`
  - first near-continuous burst run:
    `1177..1196`
  - late tail after one idle break:
    `1198..1200`
- on every burst frame:
  - the direct `VMDATAL/VMDATAH` byte stream is a full `0x100`-byte exact
    match for one known ROM blob
  - the `DMA0` source points at the same blob label
  - the direct target alternates between `VMADD = 0x4920` and
    `VMADD = 0x49A0`
- distinct matched blob labels:
  - `AA10`
  - `AB58`
  - `ACA0`

Concrete examples from the report:

- `1165`
  - `state0204 = 2`
  - `dp0054 = 0x88`
  - `VMADD = 0x49A0`
  - direct burst = `AB58`
  - `DMA0` source = `1A:AB58`
- `1170`
  - `state0204 = 3`
  - `dp0054 = 0x90`
  - `VMADD = 0x4920`
  - direct burst = `ACA0`
  - `DMA0` source = `1A:ACA0`
- `1172`
  - `state0204 = 1`
  - `dp0054 = 0x98`
  - `VMADD = 0x49A0`
  - direct burst = `AA10`
  - `DMA0` source = `1A:AA10`

Reading:

- the late `00:8029` reactivation is not just "some VRAM work came back"
- it is the same three-blob Mode 7 producer family already seen earlier in the
  attract path
- the direct-write and DMA views are now reconciled: they are two programming
  paths carrying the same blob identity on the same burst frame
- the schedule read is now also sharper:
  - `state0204` alone is not the blob selector
  - in the sampled burst window, each observed `state0204` value (`1/2/3`)
    reaches all three blob labels (`AA10/AB58/ACA0`) and both `VMADD`
    targets (`0x4920/0x49A0`)
  - the two same-`dp0054` double-burst pairs (`1174/1175`, `1195/1196`) flip
    blob + `VMADD` without advancing `dp0054`, which argues for a deeper
    phase/stage owner than a simple `state0204 -> blob` lookup

## Native-Replacement Link

This blob family is not new to the repo.

The earlier bridge-visible late-attract model already uses
`tools/build_mode7_source_scene.py` plus exact ROM patches from:

- `1A:AA10`
- `1A:AB58`
- `1A:ACA0`

and it applies them directly onto the same visible Mode 7 destinations:

- `0x4920`
- `0x49A0`

Reading:

- the late `1165+` `00:8029` cycle is now tied back to an existing native
  replacement model family, not a newly discovered data source
- the remaining gap is schedule/selection ownership inside this later tail,
  not blob provenance

## Static Ownership Path

The static bank read now explains how the resumed late uploads fit into the
normal producer pipeline.

### 1. `L00B6E3` is the late state machine that re-enters the producer path

At `01:B6E3`, the code:

- advances internal counters via `$0440/$0442`
- checks stage thresholds
- updates `$0444`
- calls `jsl L009DC6` with the current `$0204/$0206` pair

That is the same pair the probe records changing across the late cycle.

### 2. `L009DC6` rebuilds scene/OAM work and finishes by arming OAM DMA

At `01:9DC6`, the routine:

- stores the incoming `X/Y` into `$0204/$0206`
- runs several `jsl L001662` builder calls
- conditionally runs more `L001662` work from `$0444`
- always ends with `jsl L0015BD`

Practical reading:

- the late `state0204` changes are not passive metadata
- they are inputs to the same builder path that repopulates the late scene
  work and then hands control to the standard OAM-DMA arming helper

### 3. `L0015BD` and the bank-0 NMI path explain the resumed `00:0700` DMA

`L0015BD` in bank 0:

- pads the remaining `$0700` OAM staging entries with `0xE100`
- stores `#$01` into `$096A`

The bank-0 NMI path then:

- checks `$096A`
- clears it
- runs `DMA1`
- source `0x0700`
- size `0x0220`
- target `OAMDATA` (`$2104`)

Reading:

- the resumed late `00:0700 -> OAMDATA` transfer is the normal staged OAM DMA
  path already documented earlier
- the `1165+` behavior is therefore owned by the standard builder/NMI handoff,
  not by a separate hidden late uploader

## Practical Reading

- Lane 2 now has a concrete ownership read for the late `00:8029` producer
  cycle:
  - stage loop `01:B6E3`
  - scene builder `01:9DC6`
  - builder helpers `00:9662` / `00:979B`
  - OAM arm helper `00:95BD`
  - NMI consume path via `$096A` and `$0700`
- the `VRAM` burst side is now tied to the same `AA10/AB58/ACA0` family and
  the same `0x4920/0x49A0` Mode 7 destinations already used by the existing
  native bridge-visible model
- the next Lane 2 step is no longer "which producer owns the late cycle?"
- the next step is:
  - derive the later-frame selection/schedule rule strongly enough to express
    the full `00:8029` late producer cycle as a native replacement path, not
    just as individual matched burst frames
  - the stronger immediate static target is now the `$0440/$0442` phase loop
    in `L00B6E3`, because the refreshed transition report now rules out
    `state0204` as a sufficient selector by itself
