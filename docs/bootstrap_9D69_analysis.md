# 01:9D69 Bootstrap Callback Analysis

## Summary

Address `01:9D69` is the one-shot Mode 7 bootstrap callback that runs
during frames 958–977 of the intro loop. It initializes CGRAM, resolves
VRAM data tables, and stages DMA uploads for the Mode 7 attract scene.

## Disassembly (bank1.asm lines 3513–3551)

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
         jsl L000375                   ; PPU setup helper (UNTRACED)
         jsl L00158F                   ; VRAM address setup (UNTRACED)

; Step 3: OAM trigger
         lda #$0002 / sta $09A8       ; OAM write counter

; Step 4: VRAM base address
         lda $0202 / asl / asl / tax  ; Scene index * 4
         lda $019C79,X / sta $12      ; VRAM base address
         lda $019C77,X / sta $10      ; VRAM offset

; Step 5: Final helpers
         lda #$0000
         jsl $0098FF                   ; Unknown helper (UNTRACED)
         jsl L0015BD                   ; VRAM write submission
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
| $019C77   | 4      | $0202 * 4   | VRAM offset          |
| $019C79   | 4      | $0202 * 4   | VRAM base address    |

## Effects

- **CGRAM**: Colors 1–14 updated (278 bytes changed in probes)
- **VRAM**: 5875 bytes changed in $4000–$4900 region (Mode 7 tile buffers)
- **DMA queue**: $0600 prepped with 2 active descriptors ($0054 = 0x10)
- **OAM**: Sentinel patterns staged at $0700–$091F

## Why L00A00C Scene Builder Fails (100% mismatch)

The existing `build_bank1_l00a00c_scene.py` applies ROM uploads but
misses the side effects of three untraced helper routines:

1. **L000375** — likely PPU register writes ($2105–$210C range)
2. **L00158F** — likely VRAM address register setup
3. **$0098FF** — unknown, possibly ROM decompression or data staging

The empirical evidence: seeding from frame 954 VRAM + frame 974 PPU
template still produces 99.99% mismatch, confirming the gap is
structural PPU/VRAM setup, not palette.

## Untraced Dependencies (blocking native replay)

| Routine    | Location    | Likely Purpose             | Priority |
|------------|-------------|----------------------------|----------|
| L000375    | bank0.asm   | PPU register init          | HIGH     |
| L00158F    | bank0.asm   | VRAM address reg setup     | HIGH     |
| $0098FF    | bank0.asm   | ROM copy/decompress        | HIGH     |
| L0015BD    | bank0.asm   | VRAM DMA staging           | MEDIUM   |

## Next Steps

1. Trace L000375 in bank0.asm — document all PPU register writes
2. Trace L00158F — document VRAM address setup sequence
3. Trace $0098FF — determine if this is decompression or bulk copy
4. With all helpers traced, build a complete state replay that
   reproduces the frame-974 VRAM/CGRAM exactly
5. Validate against `mesen_probe_boot` frame 974 dumps
