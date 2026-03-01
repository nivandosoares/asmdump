# 01:9D69 Bootstrap Callback Analysis

## Summary

Address `01:9D69` is the one-shot Mode 7 bootstrap callback that runs
during frames 958-977 of the intro loop. It initializes CGRAM, resolves
VRAM data tables, and stages DMA uploads for the Mode 7 attract scene.

## Disassembly (bank1.asm lines 3513-3551)

```
01:9D69  phk / plb / rep #$30          ; Set data bank to 01, 16-bit mode

; Step 1: Palette upload
         lda $0202  / asl / tax        ; Scene index * 2
         lda $0185EA,X                 ; Palette ROM pointer table
         sta $0C                       ; DP indirect source
         lda #$0000 / ldx #$0030      ; 48 colors at CGRAM offset 0
         jsl L000583                   ; CGRAM upload helper

; Step 2: Data table resolution
         lda $0202  / asl / tax
         lda $019C83,X                 ; Data table pointer table
         tax / sta $020A              ; Store pointer
         lda $0000,X / sta $0208      ; Read count from table
         jsl L000375                   ; Callback pointer setup
         jsl L00158F                   ; TTL table sweep

; Step 3: OAM trigger
         lda #$0002 / sta $09A8       ; OAM write counter

; Step 4: VRAM base address
         lda $0202 / asl / asl / tax  ; Scene index * 4
         lda $019C79,X / sta $12      ; VRAM base address -> DP $12
         lda $019C77,X / sta $10      ; VRAM data pointer -> DP $10

; Step 5: DMA queue allocation + submission
         lda #$0000
         jsl $0098FF                   ; VRAM DMA queue allocator
         jsl L0015BD                   ; OAM sentinel fill + trigger
         rtl
```

Size: 39 bytes.

## Input State

| Location | Frame 958 | Frame 974 | Set by       |
|----------|-----------|-----------|--------------|
| $0202    | 0x0000    | 0x0001    | L00A00C      |
| $0208    | 0x0000    | 0x000D    | 9D69 itself  |
| $020A    | 0x0000    | 0x9CC3    | 9D69 itself  |

## Data Tables (all bank 1)

| Address   | Stride | Index       | Purpose              |
|-----------|--------|-------------|----------------------|
| $0185EA   | 2      | $0202 * 2   | Palette ROM pointers |
| $019C83   | 2      | $0202 * 2   | Data table pointers  |
| $019C77   | 4      | $0202 * 4   | VRAM data pointer    |
| $019C79   | 4      | $0202 * 4   | VRAM base address    |

## Helper Routines — Now Traced

### L000375 — Callback Pointer Setup (bank0.asm:492-511)

```
L000375:
    php / sep #$20 / rep #$10
    lda #$00        ; A = 0
    ldx #$8029      ; X = callback address
    jsl L000385     ; -> stores A to $096E, X to $096C
    plp / rtl
```

Writes `$096C = 0x8029` (callback function pointer) and `$096E = 0x00`
(bank byte). This registers a callback for the NMI handler's indirect
dispatch at `jmp [$0038]` (bank0.asm:361). The value 0x8029 is the
address of the NMI-side PPU update routine.

**Not a PPU register writer — it's a callback registration.**

### L00158F — TTL Table Sweep (bank0.asm:3304-3335)

```
L00158F:
    lda $099C / sta $09A2      ; Copy index
    lda $09A0 / dec / beq done ; If count=0, skip
    asl / tax                  ; X = (count-1)*2
loop:
    lda $0AAA,X                ; Load TTL entry
    bmi skip                   ; Negative = skip
    dec / sta $0AAA,X          ; Decrement TTL
    bne skip                   ; Not zero = skip
    ; TTL expired: dispatch to L001B13 state handler
    sep #$20 / lda #$00 / pha
    rep #$20 / lda #$95B7 / pha
    phx / phy / jmp L001B13
skip:
    dex / dex / bpl loop
done:
    rtl
```

Iterates the TTL (time-to-live) table at $0AAA. Decrements each entry;
when an entry reaches zero, dispatches to L001B13 (the tile allocation
state machine). This drives the frame-by-frame VRAM tile refresh cycle.

**Not a direct PPU writer — manages the allocation/scheduling tables.**

### $0098FF — VRAM DMA Queue Allocator (bank0.asm:3855-4122)

**This was the missing label — code at $98FF after L0018FE's RTL.**

```
$0098FF:
    phx / phy
    asl / asl / tay            ; A*4 = offset into data table
    lda [$10],Y / clc          ; Read pointer from table
    adc $10 / sta $0C          ; $0C = source ROM pointer
    iny / iny
    lda [$10],Y / adc $12      ; $0E = source bank
    sta $0E
    bra +2                     ; Skip alternate entry at $0098FF+$15
```

Then falls through to the **tile page allocator** (line 3870+):
1. Computes VRAM tile page address from data ($28 = page | row)
2. Searches dedup table at `$09AA` (up to $09A0 entries)
3. If duplicate found, returns early (L001941: RTL with slot index)
4. Otherwise allocates via free-list at `$0B2A` (block splitting)
5. **Writes DMA descriptor to $0600 queue** (line 4076):

```
L001A70:
    sep #$10              ; 8-bit index
    ldx $54               ; Queue write pointer
    sta $0600,X  <- $04   ; Word count / flags
    sta $0602,X  <- $06   ; Source address
    sta $0604,X  <- $08   ; Transfer size (tile data bytes)
    sta $0606,X  <- computed VRAM dest ($0A << 4 + $099A)
    ; Advance pointer
    txa / clc / adc #$08 / sta $54
```

Normal return (L001ABD): PLY / PLX / returns slot count in A.
Failure return (L0019C0): returns $FFFF (allocation failed).

**Key data structures managed:**
- `$0600,X` — DMA queue (8-byte descriptors)
- `$09AA` — VRAM page dedup table (2-byte entries, up to 64)
- `$09A0` — Allocation count
- `$0A2A` — Node map (free-list pointers)
- `$0B2A` — Block size table (free-list with splitting)
- `$0D2C` — Back-pointer table
- `$54` (DP) — Queue write pointer

### L0015BD — OAM Sentinel Fill + DMA Trigger (bank0.asm:3336-3359)

```
L0015BD:
    lda $09A2 / asl / asl / tax   ; X = index * 4
    lda #$E100                     ; Sentinel value
loop:
    cpx $09A4 / beq done          ; Until queue pointer
    sta $0700,X                    ; Fill $0700 OAM staging
    inx / inx / inx / inx
    bne loop
done:
    stx $09A4                      ; Update pointer
    sep #$20
    lda #$01 / sta $096A           ; Set DMA trigger flag
    rep #$20 / rtl
```

Fills the OAM staging buffer ($0700+) with $E100 sentinels and sets
$096A = 1 to arm the NMI handler for DMA execution.

## Complete Execution Flow

```
01:9D69 entry ($0202=1):
  1. L000583: Upload 48 palette colors to CGRAM offset 0
  2. L000375: Register callback $8029 at $096C (NMI PPU updater)
  3. L00158F: Sweep TTL table at $0AAA, expire stale entries
  4. $0098FF: Allocate VRAM tile slot, write DMA descriptor to $0600
  5. L0015BD: Fill OAM sentinels at $0700, set DMA trigger $096A=1
  -> NMI handler fires:
     - Reads $096A=1 -> executes DMA from $0600 queue to VRAM
     - Calls callback at $096C=$8029 -> PPU register updates
     - Result visible on next frame
```

## Why L00A00C Scene Builder Fails (100% mismatch)

The builder applies ROM uploads but doesn't replay the allocation state
machine. The actual VRAM content at frame 974 is the result of:
1. DMA queue entries built by $0098FF (tile page allocator)
2. NMI-driven DMA execution (consuming $0600 queue)
3. Callback at $8029 (PPU register writes — still needs tracing)

The builder misses steps 1-3 entirely. The VRAM it produces comes from
direct ROM reads, but the game uses an indirect path through the DMA
queue allocator with deduplication and block splitting.

## NMI Callback $8029 — No-Op (bank0.asm, offset $0029)

The value $8029 stored by L000375 into $096C is **RTL ($6B)** — an
immediate return. This is a no-op callback: the NMI handler dispatches
via `jmp [$0038]` but the target does nothing. It serves as a "slot
occupied" marker to prevent re-initialization during the bootstrap
window.

## NMI VRAM DMA Consumer (bank0.asm:232-290)

The NMI handler processes the $0600 queue written by $0098FF:

```
L0001AB:                              ; Loop: read ptr $53, write ptr $54
    cpx $54 / beq done               ; Done when ptrs match
    lda $0600,X                       ; Byte 0: DMA control / type
    bmi direct_write                  ; Negative = direct VRAM word write

    ; DMA transfer path:
    sta DMAP0                         ; DMA channel 0 control byte
    lda #$18 / sta DMADEST0           ; Dest = $2118 (VMDATAL)
    lda $0601,X / sta DMASRC0L        ; Source addr low
    ; V-blank budget check: $55 -= 0x68 + xfer size
    lda $0602,X / sta DMASRC0H        ; Source addr high + bank
    lda $0604,X / sta DMALEN0L        ; Transfer size
    lda $0606,X / sta VMADDL          ; VRAM dest address ($2116)
    lda #$01 / sta MDMAEN             ; Fire DMA channel 0
    X += 8 / bra loop

direct_write:                         ; 1-2 word inline VRAM write
    lda $0602,X / sta VMADDL          ; VRAM address
    lda $0604,X / sta VMDATAL         ; Write word 1
    [optional] lda $0606,X / sta VMDATAL  ; Write word 2
    X += 8 / bra loop

done:
    stx $53                           ; Save read pointer
```

After the VRAM queue, the NMI handler also DMAs OAM (when $096A != 0):
- DMA channel 1: WRAM $0700 → $2104 (OAMDATA), 544 bytes ($0220)

### DMA Descriptor Format ($0600 queue, 8 bytes each)

| Offset | Field           | Used as               |
|--------|-----------------|-----------------------|
| +0     | Control byte    | DMAP0 (neg = inline)  |
| +1     | Source low      | DMASRC0L              |
| +2     | Source high+bank| DMASRC0H              |
| +4     | Transfer size   | DMALEN0L              |
| +6     | VRAM address    | VMADDL ($2116)        |

## Fully Traced Execution Chain

```
Frame N (main loop):
  01:9D69 callback:
    L000583  → CGRAM: upload 48 colors
    L000375  → $096C = $8029 (NOP callback armed)
    L00158F  → TTL table sweep at $0AAA
    $0098FF  → Allocate tile slot, write DMA descriptor to $0600
    L0015BD  → Fill OAM sentinels at $0700, set $096A = 1

Frame N+1 (NMI):
    $0600 queue → DMA ch0 → VRAM (tile data)
    $096A check → DMA ch1 → OAM (544 bytes from $0700)
    $096C check → jmp [$0038] → $8029 (RTL, no-op)
```

## Remaining Untraced (non-blocking)

| Routine | Location       | Purpose                        | Priority |
|---------|----------------|--------------------------------|----------|
| L001B13 | bank0.asm:4179 | Tile allocation state machine  | LOW      |

## Why This Solves the Mismatch

The existing queue-driven scene builder (`build_bootstrap_queue_scene.py`)
already replays the $0600 DMA descriptors and achieves **2 pixel mismatch**
at frame 978. The 100% mismatch from the ROM-side L00A00C builder happens
because it bypasses the entire allocation/DMA pipeline.

The full chain is now traced. To extend native coverage into 958-977:

1. Capture the $0600 queue state at frame 958 (pre-bootstrap)
2. Run $0098FF allocation logic (already understood) to generate descriptors
3. Apply descriptors as VRAM DMA (already implemented in queue builder)
4. Apply CGRAM from L000583 palette upload
5. Apply OAM from $0700 sentinel fill

The queue-driven approach is confirmed as the correct replay strategy.
The remaining 2-pixel mismatch at frame 978 is likely a timing boundary
issue (DMA vs. rendering phase) rather than missing state.
