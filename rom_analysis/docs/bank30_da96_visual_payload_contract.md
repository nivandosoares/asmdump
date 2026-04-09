# Bank30 DA96 Visual Payload Contract

### Bank30 DA96 Row-Major Visual Payload Contract

**Status**: PROBABLE

**Description**:
`1E:DA96` is best modeled as a prebuilt visual payload stream, not as a plain
SNES BG tilemap blob and not as executable code. The strongest current read is
that a scene-specific caller selects this bank30 `67FB` word-mode stream,
decompresses it into a row-major buffer, and then feeds some later visual
consumer that is still not closed in runtime traces.

**Inputs**:
- Active scene/state that chooses the `1E:DA96` payload
- Bank30 compressed stream start `1E:DA96`
- A destination staging buffer owned by the unknown caller/consumer

**State**:
- Decompressed output buffer: `14310` words / `28620` bytes
- Dominant repeated-row region: `157` words (`314` bytes) wide
- Repeated filler-like row family: `33` starts, `32` identical rows
- Unresolved caller/consumer binding: no direct runtime `L001210` hit yet

**Update Rules**:
1. A scene-specific loader selects the bank30 `67FB` stream at `1E:DA96`.
2. The loader decompresses it in word mode into a `16-bit` row-major buffer.
3. The resulting buffer keeps strong repeated-row structure, including a long
   repeated `0x7C1F` block on a fixed `157`-word stride.
4. Current extracted BG tilemaps are not literal copies of this stream:
   a direct scan over the current extracted tilemap set finds no contiguous
   `>= 8`-word row matches.
5. Until a concrete caller/output path is observed, downstream reimplementation
   should treat this as a separate visual-asset class rather than collapsing it
   into the normal BG-tilemap contract.

**Ordering Constraints**:
- The chunk must be selected and decompressed before the visual consumer can
  compose its scene.
- The payload should not be interpreted as a standard BG tilemap unless a later
  trace proves a direct row/entry mapping into VRAM tilemap state.
- The next proving step is consumer-side comparison against raw VRAM or other
  staged visual buffers, not more literal tilemap matching.

**Outputs**:
- A staged visual/map-like buffer with row-major structure
- Likely front-end or helper-driven visual content, but no verified screen
  binding yet

**Evidence**:
- Bank/reference:
  - `1E:DA96`
  - `rom_analysis/docs/memory_map.md`
- Static structure:
  - `tools/out/bank30_chunk_shapes.json`
  - `tools/out/bank30_chunk_shapes.md`
- Current negative consumer check:
  - `tools/out/bank30_da96_tilemap_correlation.json`
  - `tools/out/bank30_da96_tilemap_correlation.md`
  - scanned extracted BG tilemaps from current design-pack sets under
    `tools/out/` and `port/assets/` (`40` tilemaps total)
- Runtime contrast:
  - `tools/out/bank30_chunk_registry.md`
  - no-input attract `L001210` hits confirm `DF6C/E039/E73F/E800` around
    frames `1280..1294` and `2698..2712`, while `DA96` remains unseen

**Test Strategy**:
- Trigger a real `DA96` caller path in Mesen and capture:
  - `VRAM`
  - `CGRAM`
  - destination WRAM/work buffers if visible
- Compare the decompressed `314`-byte row structure against:
  - raw VRAM row windows
  - staged visual buffers
  - screen-space support masks or image-like intermediate buffers
- Falsify this contract by finding either:
  - a direct BG tilemap row match in a newly captured consumer, or
  - a proven code/control consumer instead of a visual buffer consumer

**Pseudo-code**:
```text
if scene_selector chooses DA96:
    buffer = decompress_word_stream(bank30[0xDA96])
    assert buffer.has_repeated_rows(width_bytes=314)
    if literal_bg_tilemap_match(buffer):
        classify as tilemap producer
    else:
        classify as separate visual payload
        wait for caller/destination proof
```
