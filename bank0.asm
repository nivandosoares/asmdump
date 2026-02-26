.BANK 0 SLOT 0
.ORG $0000

.SECTION "Bank0" FORCE

	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	and #$0080.w		; 29 80 00
	and #$0080.w		; 29 80 00
	eor $E50083.l,X		; 5F 83 00 E5
	lda $F5F527.l		; AF 27 F5 F5
	cmp ($B7.b)		; D2 B7
	lsr $CD.b,X		; 56 CD
	asl A		; 0A
	sec		; 38
	asl $00.b,X		; 16 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $45.b		; 00 45
	eor ($43.b,X)		; 41 43
	mvp $49,$53		; 44 53 49
	rtl		; 6B

L00002A:
	clc		; Clear carry
	xce		; Exchange carry bit to set emulation or native mode
.INDEX 16
	rep #$10
.ACCU 8
	sep #$20
	ldx #$01FF.w
	txs
	phk
	plb
	ldx #$0000.w
	phx
	pld
	stz NMITIMEN.w		; Interrupt Enable Flags
	lda #$8F.b
	sta INIDSP.w		; Screen Display
	stz OBJSEL.w		; Object Size and Chr Address
	stz OAMADDL.w		; OAM Address Low Byte
	stz OAMADDH.w		; OAM Address High Byte
	stz OAMDATA.w		; Data for OAM write
	stz OAMDATA.w		; Data for OAM write
	ldx #$2105.w
L000055:
	stz $00.b,X
	inx
	cpx #$210D.w
	bne L000055.b
L00005D:
	stz $00.b,X
	stz $00.b,X
	inx
	cpx #$2115.w
	bne L00005D.b
	lda #$80.b
	sta VMAIN.w		; Video Port Control
	inx
L00006D:
	stz $00.b,X
	inx
	cpx #$211B.w
	bne L00006D.b
	ldy #$0000.w
L000078:
	stz $00.b,X
	lda $8000.w,Y
	sta $00.b,X
	iny
	inx
	cpx #$2121.w
	bne L000078.b
L000086:
	stz $00.b,X
	inx
	cpx #$2130.w
	bne L000086.b
	lda #$30.b
	sta CGWSEL.w		; Color Addition Select
	stz CGADSUB.w		; Color Math Designation
	lda #$E0.b
	sta COLDATA.w		; Fixed Color Data
	stz SETINI.w		; Screen Mode/Video Select
.ACCU 16
	rep #$20
	lda #$0000.w
.BASE $80
L8000A3:
.BASE $00
L0000A3:
	tax
	tay
	jsl L00045B.l
.ACCU 8
	sep #$20
	stz NMITIMEN.w		; Interrupt Enable Flags
	lda #$FF.b
	sta WRIO.w		; I/O port output/write
	ldx #$4202.w
L0000B6:
	stz $00.b,X
	inx
	cpx #$420D.w
	bne L0000B6.b
.ACCU 16
	rep #$20
	lda #$AC1B.w
	sta $0C.b
	stz $0E.b
	jsl L001283.l
.ACCU 8
	sep #$20
	ldx #$1FFF.w
L0000D0:
	stz $00.b,X
	dex
	bpl L0000D0.b
	ldx #$0005.w
L0000D8:
	lda $8023.w,X
	sta $0100.w,X
	dex
	bpl L0000D8.b
	jsl L008AF8.l
	lda #$8F.b
	sta $0966.w
	ldx #$001C.w
L0000ED:
	lda $8006.w,X
	sta $38.b,X
	dex
	bpl L0000ED.b
	stz $0968.w
	stz $096A.w
	stz $40.b
.ACCU 16
	rep #$20
	stz $096C.w
	stz $096F.w
	stz $0974.w
	stz $0964.w
	stz $0998.w
	lda #$8029.w
	sta $3E.b
	ldx #$000E.w
L000116:
	stz $0F32.w,X
	dex
	dex
	bpl L000116.b
	lda #$0000.w
	tax
	tay
	jsl L00154E.l
.ACCU 8
	sep #$20
	lda #$81.b
	sta NMITIMEN.w		; Interrupt Enable Flags
	jsl L002368.l
	jsl L00050F.l
	jmp L008B26.l
L000139:
.ACCU 16
.INDEX 16
	rep #$30
	phb
	phk
	plb
	pha
	cli		; Clear interupt
	lda RDNMI.w		; NMI Flag and 5A22 Version
	lda $51.b
	beq L00014A.b
	pla
	plb
	rti

L00014A:
	phx
	phy
	lda #$FFFF.w
	sta $51.b
.INDEX 8
	sep #$10
	lda $096F.w
	beq L000162.b
	sta $3B.b
	stz $096F.w
	ldx $0971.w
	stx $3D.b
L000162:
	ldx #$00.b
	phx
	lda #$816B.w
	pha
	jmp.w [$003B]
	lda $0F2E.w
	sta VTIMEL.w		; V-Count Timer
	lda $0F30.w
	sta HTIMEL.w		; H-Count Timer
.ACCU 8
.INDEX 8
	sep #$30
	lda $0966.w
	sta INIDSP.w		; Screen Display
	ldx #$00.b
L000182:
	txa
	lsr A
	tay
	lda $0F32.w,X
	sta $210D.w,Y
	lda $0F33.w,X
	sta $210D.w,Y
	inx
	inx
	cpx #$10.b
	bcc L000182.b
	lda $0968.w
	bne L00019F.b
	jmp L00022E.w
L00019F:
	lda $0972.w
	sta $55.b
	lda $0973.w
	sta $56.b
	ldx $53.b
L0001AB:
	cpx $54.b
	beq L00021E.b
	lda $0600.w,X
	bmi L0001F3.b
	sta DMAP0.w		; DMA 0 Control
	lda #$18.b
	sta DMADEST0.w		; DMA 0 Destination Register
	lda $0601.w,X
	sta DMASRC0L.w		; DMA 0 Source Adress Low Byte
.ACCU 16
	rep #$20
	lda $55.b
	sec		; Set carry
	sbc #$0068.w
	bcc L00021E.b
	sbc $0604.w,X
	bcc L00021E.b
	sta $55.b
	lda $0602.w,X
	sta DMASRC0H.w		; DMA 0 Source Address High Byte
	lda $0604.w,X
	sta DMALEN0L.w		; DMA 0 Transfer Size Low Byte
	lda $0606.w,X
	sta VMADDL.w		; VRAM Address Low Byte
.ACCU 8
	sep #$20
	txa
	clc		; Clear carry
	adc #$08.b
	tax
	lda #$01.b
	sta MDMAEN.w		; DMA Channel Enable
	bra L0001AB.b
L0001F3:
	tay
.ACCU 16
	rep #$20
	lda $55.b
	sec		; Set carry
	sbc #$0050.w
	bcc L00021E.b
	sta $55.b
	lda $0602.w,X
	sta VMADDL.w		; VRAM Address Low Byte
	lda $0604.w,X
	sta VMDATAL.w		; VRAM Data Write Low Byte
	iny
	beq L000215.b
	lda $0606.w,X
	sta VMDATAL.w		; VRAM Data Write Low Byte
L000215:
.ACCU 8
	sep #$20
	txa
	clc		; Clear carry
	adc #$08.b
	tax
	bra L0001AB.b
L00021E:
	stx $53.b
.ACCU 16
	rep #$20
	lda $55.b
	cmp #$0260.w
	bcc L000256.b
.ACCU 8
	sep #$20
	lda $096A.w
L00022E:
	beq L000256.b
	stz $096A.w
	stz DMAP1.w		; DMA 1 Control
	lda #$04.b
	sta DMADEST1.w		; DMA 1 Destination Register
	stz DMASRC1B.w		; DMA 1 Source Address Bank
.ACCU 16
	rep #$20
	lda #$0700.w
	sta DMASRC1L.w		; DMA 1 Source Adress Low Byte
	lda #$0220.w
	sta DMALEN1L.w		; DMA 1 Transfer Size Low Byte
	stz OAMADDL.w		; OAM Address Low Byte
.ACCU 8
	sep #$20
	lda #$02.b
	sta MDMAEN.w		; DMA Channel Enable
L000256:
.ACCU 16
	rep #$20
	lda $0998.w
	bne L000260.b
	inc $0964.w
L000260:
.ACCU 8
.INDEX 8
	sep #$30
	lda $0974.w
	beq L000271.b
	ldx #$17.b
L000269:
	lda $00.b,X
	sta $0976.w,X
	dex
	bpl L000269.b
L000271:
	lda #$01.b
L000273:
	bit $4212.w
	bne L000273.b
.ACCU 16
	rep #$20
	lda JOY1L.w		; Joyport1 Data Low Byte
	sta $0960.w
	lda JOY2L.w		; Joyport2 Data Low Byte
	sta $0962.w
.INDEX 8
	sep #$10
	lda $096C.w
	beq L000297.b
	sta $38.b
	stz $096C.w
	ldx $096E.w
	stx $3A.b
L000297:
	ldx #$00.b
	phx
	lda #$82A0.w
	pha
	jmp.w [$0038]
	jsr L002BD3.w
.ACCU 8
.INDEX 8
	sep #$30
	lda $0974.w
	beq L0002B5.b
	ldx #$17.b
L0002AD:
	lda $0976.w,X
	sta $00.b,X
	dex
	bpl L0002AD.b
L0002B5:
.ACCU 16
.INDEX 16
	rep #$30
	stz $51.b
	ply
	plx
	pla
	plb
	rti

	brk $01.b		; 00 01
	cop $03.b		; 02 03
	tsb $05.b		; 04 05
	asl $07.b		; 06 07
	php		; 08
	ora #$1110.w		; 09 10 11
	ora ($13.b)		; 12 13
	trb $15.b		; 14 15
	asl $17.b,X		; 16 17
	clc		; 18
	ora $2120.w,Y		; 19 20 21
	jsl $252423.l		; 22 23 24 25
	rol $27.b		; 26 27
	plp		; 28
	and #$3130.w		; 29 30 31
	and ($33.b)		; 32 33
	bit $35.b,X		; 34 35
	rol $37.b,X		; 36 37
	sec		; 38
	and $4140.w,Y		; 39 40 41
	.db $42, $43		; 42 43
	mvp $46,$45		; 44 45 46
	eor [$48.b]		; 47 48
	eor #$5150.w		; 49 50 51
	eor ($53.b)		; 52 53
	mvn $56,$55		; 54 55 56
	eor [$58.b],Y		; 57 58
	eor $6160.w,Y		; 59 60 61
	.db $62, $63, $64		; 62 63 64
	adc $66.b		; 65 66
	adc [$68.b]		; 67 68
	adc #$7170.w		; 69 70 71
	adc ($73.b)		; 72 73
	stz $75.b,X		; 74 75
	ror $77.b,X		; 76 77
	sei		; 78
	adc $8180.w,Y		; 79 80 81
	.db $82, $83, $84		; 82 83 84
	sta $86.b		; 85 86
	sta [$88.b]		; 87 88
	bit #$9190.w		; 89 90 91
	sta ($93.b)		; 92 93
	sty $95.b,X		; 94 95
	stx $97.b,Y		; 96 97
	tya		; 98
	.db $99		; Opcode overrunning section
L000322:
.ACCU 16
.INDEX 16
	rep #$30
	sei		; Disable interrupts
	phb
	phk
	plb
	pha
	phx
	phy
.INDEX 8
	sep #$10
	ldx TIMEUP.w		; IRQ Flag
	ldx #$00.b
	phx
	lda #$8339.w
	pha
	jmp.w [$003E]
.ACCU 16
.INDEX 16
	rep #$30
	ply
	plx
	pla
	plb
	rti

L000341:
	php
	sei		; Disable interrupts
	sty $0F2E.w
	sty VTIMEL.w		; V-Count Timer
	ldy $0F30.w
	sty HTIMEL.w		; H-Count Timer
.ACCU 8
	sep #$20
	sta $40.b
	stx $3E.b
	jsl L0003AB.l
	lda #$B1.b
	sta NMITIMEN.w		; Interrupt Enable Flags
	plp
	cli		; Clear interupt
	rtl

L000361:
	php
	sei		; Disable interrupts
.ACCU 8
	sep #$20
	lda #$81.b
	sta NMITIMEN.w		; Interrupt Enable Flags
	stz $40.b
.ACCU 16
	rep #$20
	lda #$835F.w
	sta $3E.b
	plp
	rtl

L000375:
	php
.ACCU 8
	sep #$20
.INDEX 16
	rep #$10
	lda #$00.b
	ldx #$8029.w
	jsl L000385.l
	plp
	rtl

L000385:
	php
.ACCU 8
	sep #$20
	sta $096E.w
	stx $096C.w
	plp
	rtl

L000390:
	php
.ACCU 8
	sep #$20
.INDEX 16
	rep #$10
	lda #$00.b
	ldx #$8029.w
	jsl L0003A0.l
	plp
	rtl

L0003A0:
	php
.ACCU 8
	sep #$20
	sta $0971.w
	stx $096F.w
	plp
	rtl

L0003AB:
	lda $0964.w
L0003AE:
	cmp $0964.w
	beq L0003AE.b
	rtl

L0003B4:
	iny
L0003B5:
	jsl L0003AB.l
	dex
	bne L0003B5.b
	dey
	bne L0003B5.b
	rtl

L0003C0:
.ACCU 16
	rep #$20
	iny
L0003C3:
	jsl L0003AB.l
	dex
	bne L0003D1.b
	dey
	bne L0003D1.b
	lda #$0000.w
	rtl

L0003D1:
	lda $0960.w
	beq L0003C3.b
	rtl

.ACCU 16
	rep #$20		; C2 20
	iny		; C8
	jsl L0003AB.l		; 22 AB 83 00
	dex		; CA
	bne   7.b		; D0 07
	dey		; 88
	bne   4.b		; D0 04
	lda #$0000.w		; A9 00 00
	rtl		; 6B

	lda $0962.w		; AD 62 09
	beq -19.b		; F0 ED
	rtl		; 6B

L0003EE:
	php
.ACCU 16
	rep #$20
	pha
L0003F2:
	jsl L0003AB.l
	lda $0960.w
	beq L0003FE.b
	dex
	bne L0003F2.b
L0003FE:
	pla
	plp
L000400:
	rtl

L000401:
	php
.ACCU 16
	rep #$20
	pha
L000405:
	lda $0960.w
	bne L000405.b
	pla
	plp
	rtl

L00040D:
	php
.ACCU 16
	rep #$20
	pha
L000411:
	jsl L0003AB.l
	lda $0962.w
	beq L00041D.b
	dex
	bne L000411.b
L00041D:
	pla
	plp
	rtl

L000420:
	php
.ACCU 16
	rep #$20
	pha
L000424:
	lda $0962.w
	bne L000424.b
	pla
	plp
	rtl

L00042C:
	clc		; Clear carry
	lda $46.b
	adc $45.b
	sta $45.b
	adc $44.b
	sta $44.b
	adc $43.b
	sta $43.b
	adc $42.b
	sta $42.b
	adc $41.b
	sta $41.b
	inc $46.b
	bne L00045A.b
	inc $45.b
	bne L00045A.b
	inc $44.b
	bne L00045A.b
	inc $43.b
	bne L00045A.b
	inc $42.b
	bne L00045A.b
	inc $41.b
	inc A
L00045A:
	rtl

L00045B:
	php
	sta DMALEN4L.w		; DMA 4 Transfer Size Low Byte
	stx $14.b
	sty VMADDL.w		; VRAM Address Low Byte
	ldy #$0014.w
	sty DMASRC4L.w		; DMA 4 Source Adress Low Byte
.ACCU 8
	sep #$20
	lda #$09.b
	sta DMAP4.w		; DMA 4 Control
	lda #$18.b
	sta DMADEST4.w		; DMA 4 Destination Register
	stz DMASRC4B.w		; DMA 4 Source Address Bank
	lda #$10.b
	sta MDMAEN.w		; DMA Channel Enable
	plp
	rtl

L000480:
	php
	pha
	phy
	sta DMALEN4L.w		; DMA 4 Transfer Size Low Byte
	stx $14.b
	sty VMADDL.w		; VRAM Address Low Byte
	ldy #$0014.w
	sty DMASRC4L.w		; DMA 4 Source Adress Low Byte
.ACCU 8
	sep #$20
	stz VMAIN.w		; Video Port Control
	lda #$08.b
	sta DMAP4.w		; DMA 4 Control
	lda #$18.b
	sta DMADEST4.w		; DMA 4 Destination Register
	stz DMASRC4B.w		; DMA 4 Source Address Bank
	lda #$10.b
	sta MDMAEN.w		; DMA Channel Enable
.ACCU 16
	rep #$20
	ply
	pla
	sta DMALEN4L.w		; DMA 4 Transfer Size Low Byte
	sty VMADDL.w		; VRAM Address Low Byte
	ldy #$0015.w
	sty DMASRC4L.w		; DMA 4 Source Adress Low Byte
.ACCU 8
	sep #$20
	lda #$80.b
	sta VMAIN.w		; Video Port Control
	lda #$08.b
	sta DMAP4.w		; DMA 4 Control
	lda #$19.b
	sta DMADEST4.w		; DMA 4 Destination Register
	stz DMASRC4B.w		; DMA 4 Source Address Bank
	lda #$10.b
	sta MDMAEN.w		; DMA Channel Enable
	plp
	rtl

L0004D3:
	php
.ACCU 16
	rep #$20
	lda #$4000.w
	jsl L000480.l
	plp
	rtl

L0004DF:
	php
	jsl L0003AB.l
	jsl L000361.l
	jsl L000375.l
	jsl L000390.l
.ACCU 16
	rep #$20
	lda #$1784.w
	sta $0972.w
.ACCU 8
	sep #$20
	lda #$8F.b
	sta $0966.w
	stz $0968.w
	lda $53.b
	sta $54.b
	jsl L0003AB.l
	stz HDMAEN.w		; HDMA Channel Enable
	plp
	rtl

L00050F:
	jsl L0004DF.l
	ldx #$0000.w
	txy
	jsl L0004D3.l
	stz $0974.w
	jmp L00052E.w
L000521:
	php
.ACCU 8
	sep #$20
	lda #$0F.b
	sta $0966.w
	sta $0968.w
	plp
	rtl

L00052E:
	php
.ACCU 16
	rep #$20
	stz $0F32.w
	stz $0F36.w
	stz $0F3A.w
	stz $0F3E.w
	lda #$FFFF.w
	sta $0F34.w
	sta $0F38.w
	sta $0F3C.w
	sta $0F40.w
	lda #$FFF0.w
	sta $30.b
	sta $34.b
	sta $2C.b
	lda #$00E0.w
	sta $32.b
	sta $36.b
	lda #$0100.w
	sta $2E.b
.ACCU 8
	sep #$20
	stz CGADSUB.w		; Color Math Designation
	stz CGWSEL.w		; Color Addition Select
	stz TMW.w		; Window Mask Designation for the Main Screen
	stz MOSAIC.w		; Screen Pixelation
	stz SETINI.w		; Screen Mode/Video Select
	stz TSUB.w		; Subscreen Designation
	stz TSW.w		; Window Mask Designation for the Subscreen
	stz W12SEL.w		; Window Mask Settings for BG1 and BG2
	stz W34SEL.w		; Window Mask Settings for BG3 and BG4
	stz WOBJSEL.w		; Window Mask Settings for Objects and Color Window
	plp
	rtl

L000583:
	php
.ACCU 8
	sep #$20
.INDEX 16
	rep #$10
	sta CGADD.w		; CGRAM Address
.ACCU 16
	rep #$20
	txa
	beq L0005AA.b
	dec A
	and #$00FF.w
	inc A
	tax
.ACCU 8
	sep #$20
	ldy #$0000.w
L00059B:
	lda [$0C.b],Y
	sta CGDATA.w		; CGRAM Data Write
	iny
	lda [$0C.b],Y
	sta CGDATA.w		; CGRAM Data Write
	iny
	dex
	bne L00059B.b
L0005AA:
	plp
	rtl

L0005AC:
	php
.ACCU 16
.INDEX 16
	rep #$30
	stx $1C.b
	sty $1E.b
	ldy #$0000.w
	lda [$0C.b],Y
	sta $18.b
	iny
	iny
	lda [$0C.b],Y
	sta $1A.b
	lda $0C.b
	clc		; Clear carry
	adc #$0006.w
	tax
	lda $1E.b
	asl A
	asl A
	asl A
	asl A
	asl A
	adc $0990.w
	ora $1C.b
	tay
.ACCU 8
	sep #$20
	lda $0E.b
	sta DMASRC5B.w		; DMA 5 Source Address Bank
	lda #$01.b
	sta DMAP5.w		; DMA 5 Control
	lda #$18.b
	sta DMADEST5.w		; DMA 5 Destination Register
.ACCU 16
	rep #$20
L0005E7:
	lda $18.b
	clc		; Clear carry
	adc $1C.b
	cmp #$0021.w
	bcs L000628.b
	lda $18.b
	asl A
	sta DMALEN5L.w		; DMA 5 Transfer Size Low Byte
	stx DMASRC5L.w		; DMA 5 Source Adress Low Byte
	sty VMADDL.w		; VRAM Address Low Byte
L0005FD:
.ACCU 8
	sep #$20
	lda #$20.b
	sta MDMAEN.w		; DMA Channel Enable
.ACCU 16
	rep #$20
	txa
	clc		; Clear carry
	adc $18.b
	adc $18.b
	tax
	tya
	clc		; Clear carry
	adc #$0020.w
	tay
	inc $1E.b
	lda $1E.b
	cmp #$0020.w
	bne L000622.b
	tya
	clc		; Clear carry
	adc $0992.w
	tay
L000622:
	dec $1A.b
	bne L0005E7.b
	plp
	rtl

L000628:
	lda #$0020.w
	sbc $1C.b
	asl A
	sta $20.b
	sta DMALEN5L.w		; DMA 5 Transfer Size Low Byte
	stx DMASRC5L.w		; DMA 5 Source Adress Low Byte
	sty VMADDL.w		; VRAM Address Low Byte
.ACCU 8
	sep #$20
	lda #$20.b
	sta MDMAEN.w		; DMA Channel Enable
.ACCU 16
	rep #$20
	lda $18.b
	asl A
	sec		; Set carry
	sbc $20.b
	sta DMALEN5L.w		; DMA 5 Transfer Size Low Byte
	txa
	clc		; Clear carry
	adc $20.b
	sta DMASRC5L.w		; DMA 5 Source Adress Low Byte
	tya
	adc #$0400.w
	and #$FFE0.w
	sta VMADDL.w		; VRAM Address Low Byte
	jmp L0005FD.w
L00065F:
	php
.ACCU 16
.INDEX 16
	rep #$30
	stx $1C.b
	sty $1E.b
	ldy #$0000.w
	lda [$0C.b],Y
	sta $18.b
	iny
	iny
	lda [$0C.b],Y
	sta $1A.b
	lda $0C.b
	clc		; Clear carry
	adc #$0006.w
	tax
	lda $1E.b
	asl A
	asl A
	asl A
	asl A
	asl A
	asl A
	asl A
	adc $0990.w
	ora $1C.b
	tay
.ACCU 8
	sep #$20
	lda $0E.b
	sta DMASRC5B.w		; DMA 5 Source Address Bank
	stz DMAP5.w		; DMA 5 Control
	stz VMAIN.w		; Video Port Control
	lda #$18.b
	sta DMADEST5.w		; DMA 5 Destination Register
.ACCU 16
	rep #$20
L00069D:
	lda $18.b
	sta DMALEN5L.w		; DMA 5 Transfer Size Low Byte
	stx DMASRC5L.w		; DMA 5 Source Adress Low Byte
	sty VMADDL.w		; VRAM Address Low Byte
.ACCU 8
	sep #$20
	lda #$20.b
	sta MDMAEN.w		; DMA Channel Enable
.ACCU 16
	rep #$20
	txa
	clc		; Clear carry
	adc $18.b
	tax
	tya
	clc		; Clear carry
	adc #$0080.w
	tay
	dec $1A.b
	bne L00069D.b
.ACCU 8
	sep #$20
	lda #$80.b
	sta VMAIN.w		; Video Port Control
	plp
	rtl

L0006C9:
	php
	sta DMALEN0L.w		; DMA 0 Transfer Size Low Byte
	lda $0C.b
	sta DMASRC0L.w		; DMA 0 Source Adress Low Byte
	stx VMADDL.w		; VRAM Address Low Byte
.ACCU 8
	sep #$20
	lda $0E.b
	sta DMASRC0B.w		; DMA 0 Source Address Bank
	lda #$01.b
	sta DMAP0.w		; DMA 0 Control
	lda #$18.b
	sta DMADEST0.w		; DMA 0 Destination Register
	lda #$01.b
	sta MDMAEN.w		; DMA Channel Enable
	plp
	rtl

L0006ED:
	php
	stx $14.b
.INDEX 8
	sep #$10
	ldx $54.b
	sta $0604.w,X
	lda $14.b
	sta $0606.w,X
	lda $0D.b
	sta $0602.w,X
.ACCU 8
	sep #$20
	lda $0C.b
	sta $0601.w,X
	lda #$01.b
	sta $0600.w,X
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
	plp
	rtl

L000715:
	php
	stx $14.b
	sty $16.b
.INDEX 8
	sep #$10
	ldx $54.b
	sta $0604.w,X
	lda $16.b
	sta $0606.w,X
	lda #$0014.w
	sta $0601.w,X
.ACCU 8
	sep #$20
	stz $0603.w,X
	lda #$09.b
	sta $0600.w,X
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
	plp
	rtl

L00073E:
	php
	sta DMALEN0L.w		; DMA 0 Transfer Size Low Byte
	lda $0C.b
	sta DMASRC0L.w		; DMA 0 Source Adress Low Byte
	stx VMADDL.w		; VRAM Address Low Byte
.ACCU 8
	sep #$20
	lda $0E.b
	sta DMASRC0B.w		; DMA 0 Source Address Bank
	stz DMAP0.w		; DMA 0 Control
	lda #$19.b
	sta DMADEST0.w		; DMA 0 Destination Register
	lda #$01.b
	sta MDMAEN.w		; DMA Channel Enable
	plp
	rtl

	php		; 08
	sta $20.b		; 85 20
	tya		; 98
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	sta $14.b		; 85 14
	txa		; 8A
	clc		; 18
	adc $14.b		; 65 14
	clc		; 18
	adc $0990.w		; 6D 90 09
.INDEX 8
	sep #$10		; E2 10
	ldx $54.b		; A6 54
	sta $0606.w,X		; 9D 06 06
	lda $0C.b		; A5 0C
	sta $0601.w,X		; 9D 01 06
	lda $20.b		; A5 20
	sta $0604.w,X		; 9D 04 06
.ACCU 8
	sep #$20		; E2 20
	lda #$01.b		; A9 01
	sta $0600.w,X		; 9D 00 06
	lda $0E.b		; A5 0E
	sta $0603.w,X		; 9D 03 06
	txa		; 8A
	clc		; 18
	adc #$08.b		; 69 08
	sta $54.b		; 85 54
	plp		; 28
	rtl		; 6B

L000798:
	sta $18.b
	tya
	asl A
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $14.b
	txa
	asl A
	adc $14.b
	clc		; Clear carry
	adc $0990.w
	tax
	ldy #$0000.w
L0007AF:
	lda [$0C.b],Y
	and #$00FF.w
	beq L0007CB.b
	clc		; Clear carry
	adc $18.b
	sta $7E0000.l,X
	inx
	inx
	iny
	cpy $20.b
	bne L0007AF.b
	rtl

	lda #$0020.w		; A9 20 00
	clc		; 18
	adc $18.b		; 65 18
L0007CB:
	cpy $20.b
	bcs L0007D8.b
	sta $7E0000.l,X
	inx
	inx
	iny
	bra L0007CB.b
L0007D8:
	rtl

L0007D9:
	sta $18.b
	tya
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $14.b
	txa
	adc $14.b
	clc		; Clear carry
	adc $0990.w
	sta VMADDL.w		; VRAM Address Low Byte
	ldy #$0000.w
L0007F0:
	lda [$0C.b],Y
	and #$00FF.w
	beq L00080C.b
	clc		; Clear carry
	adc $18.b
	sta VMDATAL.w		; VRAM Data Write Low Byte
	inx
	inx
	iny
	cpy $20.b
	bne L0007F0.b
	bra L000818.b
	lda #$0020.w		; A9 20 00
	clc		; 18
	adc $18.b		; 65 18
L00080C:
	cpy $20.b
	bcs L000818.b
	sta VMDATAL.w		; VRAM Data Write Low Byte
	inx
	inx
	iny
	bra L00080C.b
L000818:
	rtl

L000819:
	php
.ACCU 8
	sep #$20
	stz $0F42.w
	lda #$01.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$01.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$09.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$11.b
	sta BG3SC.w		; BG3 Tilemap Address and Size
	lda #$42.b
	sta BG12NBA.w		; BG1&2 Tilemap Character Address
	lda #$06.b
	sta BG34NBA.w		; BG3&4 Tilemap Character Address
	plp
	rtl

L00083F:
	php
.ACCU 8
	sep #$20
	lda #$04.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$FF.b
	sta $0F42.w
	lda #$00.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$0A.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$04.b
	sta BG3SC.w		; BG3 Tilemap Address and Size
	lda #$04.b
	sta BG3SC.w		; BG3 Tilemap Address and Size
	lda #$13.b
	sta BG12NBA.w		; BG1&2 Tilemap Character Address
.ACCU 16
.INDEX 16
	rep #$30
	ldx #$0000.w
	ldy #$0400.w
	jsl L0004D3.l
	plp
	rtl

.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	sta WRMPYA.w		; 8D 02 42
	stx WRMPYB.w		; 8E 03 42
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	nop		; EA
	lda RDMPYL.w		; AD 16 42
	rtl		; 6B

	cmp #$0000.w		; C9 00 00
	beq  63.b		; F0 3F
	sta $00.b		; 85 00
	txa		; 8A
	beq  58.b		; F0 3A
.ACCU 8
	sep #$20		; E2 20
	sta WRMPYA.l		; 8F 02 42 00
	lda $00.b		; A5 00
	sta WRMPYB.l		; 8F 03 42 00
	stz $08.b		; 64 08
	xba		; EB
	sta WRMPYA.l		; 8F 02 42 00
.ACCU 16
	rep #$20		; C2 20
	lda RDMPYL.l		; AF 16 42 00
.ACCU 8
	sep #$20		; E2 20
	tax		; AA
	lda $00.b		; A5 00
	sta WRMPYB.l		; 8F 03 42 00
	stz $0B.b		; 64 0B
.ACCU 16
	rep #$20		; C2 20
	lda RDMPYL.l		; AF 16 42 00
	sta $09.b		; 85 09
	txa		; 8A
	clc		; 18
	adc $08.b		; 65 08
	sta $08.b		; 85 08
	lda #$0000.w		; A9 00 00
	adc $0A.b		; 65 0A
	sta $0A.b		; 85 0A
	rtl		; 6B

	stz $08.b		; 64 08
	stz $0A.b		; 64 0A
	rtl		; 6B

L0008CB:
	phy
L0008CC:
	tay
	beq L0008F6.b
	txa
	beq L0008F6.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	sty WRMPYB.w		; Multplier B
	stz $0A.b
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $08.b
	sty WRMPYB.w		; Multplier B
	stz $0B.b
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	sta $09.b
	ply
	rtl

L0008F6:
	stz $08.b
	stz $0A.b
	ply
	rtl

L0008FC:
	phy
	cmp #$0000.w
	beq L0008F6.b
	cpx #$0000.w
	beq L0008F6.b
	bpl L0008CC.b
	tay
	txa
	eor #$FFFF.w
	inc A
	tax
	tya
	jsl L0008CB.l
	lda #$0000.w
	sec		; Set carry
	sbc $08.b
	sta $08.b
	lda #$0000.w
	sbc $0A.b
	sta $0A.b
	ply
	rtl

L000926:
	phy
	tay
	beq L0008F6.b
	sta $00.b
	txa
	beq L0008F6.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	sty WRMPYB.w		; Multplier B
	stz $08.b
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $04.b
	sty WRMPYB.w		; Multplier B
	stz $0B.b
	ldy $01.b
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $09.b
	sty WRMPYB.w		; Multplier B
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $06.b
	sty WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	sta $09.b
	bcc L00096B.b
	inc $0B.b
L00096B:
	lda $04.b
	clc		; Clear carry
	adc $08.b
	sta $08.b
	lda $06.b
	adc $0A.b
	sta $0A.b
	ply
	rtl

L00097A:
	bit $0F42.w
	bvc L0009C2.b
.ACCU 16
	rep #$20
	asl A
	sta $57.b
	lsr A
	and #$00FF.w
	sta $55.b
	lda #$0000.w
	asl $57.b
	bcc L000993.b
	adc $55.b
L000993:
	asl A
	asl $57.b
	bcc L00099A.b
	adc $55.b
L00099A:
	asl A
	asl $57.b
	bcc L0009A1.b
	adc $55.b
L0009A1:
	asl A
	asl $57.b
	bcc L0009A8.b
	adc $55.b
L0009A8:
	asl A
	asl $57.b
	bcc L0009AF.b
	adc $55.b
L0009AF:
	asl A
	asl $57.b
	bcc L0009B6.b
	adc $55.b
L0009B6:
	asl A
	asl $57.b
	bcc L0009BD.b
	adc $55.b
L0009BD:
	asl A
	xba
.ACCU 8
	sep #$20
	rts

L0009C2:
	asl A
	sta M7A.w		; Mode 7 Matrix A
	stz M7A.w		; Mode 7 Matrix A
	xba
	sta M7B.w		; Mode 7 Matrix B
	lda MPYM.w		; Multiplication Result Middle Byte
	rts

L0009D1:
	bit $0F41.w
	bvc L000A0F.b
	cpy #$00.b
	beq L0009DF.b
	cmp #$0000.w
	bne L0009E3.b
L0009DF:
	lda #$0000.w
	rts

L0009E3:
	sty $5D.b
	sta $55.b
	stz $57.b
	stz $59.b
	stz $5B.b
	ldy #$07.b
L0009EF:
	asl $55.b
	rol $57.b
	lda $5D.b
	beq L000A0C.b
	lsr A
	sta $5D.b
	bcc L000A09.b
	lda $59.b
	clc		; Clear carry
	adc $55.b
	sta $59.b
	lda $5B.b
	adc $57.b
	sta $5B.b
L000A09:
	dey
	bne L0009EF.b
L000A0C:
	lda $5A.b
	rts

L000A0F:
.ACCU 8
	sep #$20
	sta M7A.w		; Mode 7 Matrix A
	xba
	sta M7A.w		; Mode 7 Matrix A
	sty M7B.w		; Mode 7 Matrix B
.ACCU 16
	rep #$20
	lda MPYM.w		; Multiplication Result Middle Byte
	asl A
	sta $5A.b
	rts

L000A24:
	php
.ACCU 8
	sep #$20
	lda $0B.b
	beq L000A4C.b
	cmp $05.b
	bcs L000AA0.b
.ACCU 16
	rep #$20
	lda $0A.b
	ldx #$0010.w
L000A36:
	asl $08.b
	rol A
	bcs L000A3F.b
	cmp $04.b
	bcc L000A42.b
L000A3F:
	sbc $04.b
	sec		; Set carry
L000A42:
	rol $00.b
	dex
	bne L000A36.b
	plp
	rtl

L000A49:
	php
.ACCU 8
	sep #$20
L000A4C:
	lda $05.b
	beq L000AAC.b
	lda $0A.b
	beq L000A94.b
	cmp $05.b
	bcc L000A75.b
.ACCU 16
	rep #$20
	lda $0A.b
	and #$00FF.w
	ldx #$0010.w
L000A62:
	asl $08.b
	rol A
	bcs L000A6B.b
	cmp $04.b
	bcc L000A6E.b
L000A6B:
	sbc $04.b
	sec		; Set carry
L000A6E:
	rol $00.b
	dex
	bne L000A62.b
	plp
	rtl

L000A75:
	stz $00.b
.ACCU 16
	rep #$20
	lda $09.b
	ldx #$0008.w
L000A7E:
	asl $07.b
	rol A
	bcs L000A87.b
	cmp $04.b
	bcc L000A8A.b
L000A87:
	sbc $04.b
	sec		; Set carry
L000A8A:
	rol $00.b
	dex
	bne L000A7E.b
	plp
	rtl

	php		; 08
.ACCU 8
	sep #$20		; E2 20
L000A94:
	lda $09.b
	cmp $05.b
	bcs L000A75.b
.ACCU 16
	rep #$20
	stz $00.b
	plp
	rtl

L000AA0:
.ACCU 16
	rep #$20
	lda #$7FFF.w
	sta $00.b
	plp
	rtl

	php		; 08
.ACCU 8
	sep #$20		; E2 20
L000AAC:
	lda $0A.b
	beq L000AE6.b
	cmp $04.b
	bcs L000AA0.b
	ldx $09.b
	lda $04.b
	stx WRDIVL.w		; Dividend Low Byte
	sta WRDIVB.w		; Divisor
	phx
	plx
.INDEX 16
	rep #$10
	nop
	lda RDDIVL.w		; Quotient of Divide Result Low Byte
	sta $01.b
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	sta $09.b
	lda $04.b
	ldx $08.b
	stx WRDIVL.w		; Dividend Low Byte
	sta WRDIVB.w		; Divisor
	phx
	plx
.INDEX 16
	rep #$10
	nop
	lda RDDIVL.w		; Quotient of Divide Result Low Byte
	sta $00.b
	plp
	rtl

L000AE3:
	php
.ACCU 8
	sep #$20
L000AE6:
	lda $04.b
	beq L000AA0.b
	ldx $08.b
	stx WRDIVL.w		; Dividend Low Byte
	sta WRDIVB.w		; Divisor
	phx
	plx
.ACCU 16
	rep #$20
	nop
	lda RDDIVL.w		; Quotient of Divide Result Low Byte
	sta $00.b
	plp
	rtl

L000AFE:
	php
.ACCU 8
	sep #$20
	stx WRDIVL.w		; Dividend Low Byte
	sta WRDIVB.w		; Divisor
	phx
	plx
.ACCU 16
	rep #$20
	nop
	lda RDDIVL.w		; Quotient of Divide Result Low Byte
	plp
	rtl

	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	php		; 08
	brk $09.b		; 00 09
	brk $0B.b		; 00 0B
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $10.b		; 00 10
	brk $11.b		; 00 11
	brk $13.b		; 00 13
	brk $14.b		; 00 14
	brk $16.b		; 00 16
	brk $18.b		; 00 18
	brk $19.b		; 00 19
	brk $1B.b		; 00 1B
	brk $1C.b		; 00 1C
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $24.b		; 00 24
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2F.b		; 00 2F
	brk $30.b		; 00 30
	brk $32.b		; 00 32
	brk $33.b		; 00 33
	brk $35.b		; 00 35
	brk $37.b		; 00 37
	brk $38.b		; 00 38
	brk $3A.b		; 00 3A
	brk $3B.b		; 00 3B
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $40.b		; 00 40
	brk $41.b		; 00 41
	brk $43.b		; 00 43
	brk $44.b		; 00 44
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4C.b		; 00 4C
	brk $4D.b		; 00 4D
	brk $4F.b		; 00 4F
	brk $50.b		; 00 50
	brk $52.b		; 00 52
	brk $53.b		; 00 53
	brk $55.b		; 00 55
	brk $56.b		; 00 56
	brk $58.b		; 00 58
	brk $59.b		; 00 59
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	brk $5E.b		; 00 5E
	brk $5F.b		; 00 5F
	brk $61.b		; 00 61
	brk $62.b		; 00 62
	brk $63.b		; 00 63
	brk $65.b		; 00 65
	brk $66.b		; 00 66
	brk $68.b		; 00 68
	brk $69.b		; 00 69
	brk $6B.b		; 00 6B
	brk $6C.b		; 00 6C
	brk $6D.b		; 00 6D
	brk $6F.b		; 00 6F
	brk $70.b		; 00 70
	brk $72.b		; 00 72
	brk $73.b		; 00 73
	brk $75.b		; 00 75
	brk $76.b		; 00 76
	brk $77.b		; 00 77
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $88.b		; 00 88
	brk $89.b		; 00 89
	brk $8A.b		; 00 8A
	brk $8C.b		; 00 8C
	brk $8D.b		; 00 8D
	brk $8E.b		; 00 8E
	brk $90.b		; 00 90
	brk $91.b		; 00 91
	brk $92.b		; 00 92
	brk $93.b		; 00 93
	brk $95.b		; 00 95
	brk $96.b		; 00 96
	brk $97.b		; 00 97
	brk $98.b		; 00 98
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	brk $A1.b		; 00 A1
	brk $A2.b		; 00 A2
	brk $A4.b		; 00 A4
	brk $A5.b		; 00 A5
	brk $A6.b		; 00 A6
	brk $A7.b		; 00 A7
	brk $A8.b		; 00 A8
	brk $AA.b		; 00 AA
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B1.b		; 00 B1
	brk $B2.b		; 00 B2
	brk $B3.b		; 00 B3
	brk $B4.b		; 00 B4
	brk $B5.b		; 00 B5
	brk $B6.b		; 00 B6
	brk $B7.b		; 00 B7
	brk $B8.b		; 00 B8
	brk $B9.b		; 00 B9
	brk $BA.b		; 00 BA
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	brk $BE.b		; 00 BE
	brk $BF.b		; 00 BF
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	brk $C2.b		; 00 C2
	brk $C3.b		; 00 C3
	brk $C4.b		; 00 C4
	brk $C5.b		; 00 C5
	brk $C6.b		; 00 C6
	brk $C7.b		; 00 C7
	brk $C8.b		; 00 C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $D3.b		; 00 D3
	brk $D4.b		; 00 D4
	brk $D5.b		; 00 D5
	brk $D6.b		; 00 D6
	brk $D7.b		; 00 D7
	brk $D7.b		; 00 D7
	brk $D8.b		; 00 D8
	brk $D9.b		; 00 D9
	brk $DA.b		; 00 DA
	brk $DB.b		; 00 DB
	brk $DC.b		; 00 DC
	brk $DC.b		; 00 DC
	brk $DD.b		; 00 DD
	brk $DE.b		; 00 DE
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $E2.b		; 00 E2
	brk $E3.b		; 00 E3
	brk $E3.b		; 00 E3
	brk $E4.b		; 00 E4
	brk $E5.b		; 00 E5
	brk $E5.b		; 00 E5
	brk $E6.b		; 00 E6
	brk $E7.b		; 00 E7
	brk $E7.b		; 00 E7
	brk $E8.b		; 00 E8
	brk $E9.b		; 00 E9
	brk $E9.b		; 00 E9
	brk $EA.b		; 00 EA
	brk $EB.b		; 00 EB
	brk $EB.b		; 00 EB
	brk $EC.b		; 00 EC
	brk $ED.b		; 00 ED
	brk $ED.b		; 00 ED
	brk $EE.b		; 00 EE
	brk $EE.b		; 00 EE
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $F0.b		; 00 F0
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F2.b		; 00 F2
	brk $F2.b		; 00 F2
	brk $F3.b		; 00 F3
	brk $F3.b		; 00 F3
	brk $F4.b		; 00 F4
	brk $F4.b		; 00 F4
	brk $F5.b		; 00 F5
	brk $F5.b		; 00 F5
	brk $F5.b		; 00 F5
	brk $F6.b		; 00 F6
	brk $F6.b		; 00 F6
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($18.b,X)		; 01 18
	adc #$0100.w		; 69 00 01
	php		; 08
.INDEX 16
	rep #$10		; C2 10
	and #$03FF.w		; 29 FF 03
	cmp #$0200.w		; C9 00 02
	bcc  26.b		; 90 1A
	sbc #$0200.w		; E9 00 02
	cmp #$0100.w		; C9 00 01
	bcc   6.b		; 90 06
	eor #$FFFF.w		; 49 FF FF
	adc #$0200.w		; 69 00 02
	asl A		; 0A
	tax		; AA
	lda #$0000.w		; A9 00 00
	sec		; 38
	sbc $008B11.l,X		; FF 11 8B 00
	plp		; 28
	rtl		; 6B

	cmp #$0100.w		; C9 00 01
	bcc   6.b		; 90 06
	eor #$FFFF.w		; 49 FF FF
	adc #$0200.w		; 69 00 02
	asl A		; 0A
	tax		; AA
	lda $008B11.l,X		; BF 11 8B 00
	plp		; 28
	rtl		; 6B

L000D4F:
	php
.ACCU 16
	rep #$20
.INDEX 8
	sep #$10
	inc $0C.b
	inc $0C.b
	inc $0C.b
	inc $0C.b
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	xba
	pha
	clc		; Clear carry
	adc $10.b
	sta $81.b
	lda #$0000.w
	tax
L000D6F:
	sta $0600.w,X
	inx
	inx
	bne L000D6F.b
.ACCU 8
	sep #$20
	lda [$0C.b]
	tax
	lda #$80.b
	sta $0600.w,X
.ACCU 16
	rep #$20
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	tay
	beq L000DA9.b
L000D8B:
	lda [$0C.b]
	inc $0C.b
	tax
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
.ACCU 8
	sep #$20
	sta $0700.w,X
	xba
	sta $0800.w,X
	lda #$01.b
	sta $0600.w,X
.ACCU 16
	rep #$20
	dey
	bne L000D8B.b
L000DA9:
.INDEX 16
	rep #$10
	ldy $10.b
	lda #$0000.w
.ACCU 8
	sep #$20
L000DB2:
	lda [$0C.b]
	inc $0C.b
	beq L000DC5.b
L000DB8:
	tax
	lda $0600.w,X
	beq L000DC9.b
	bmi L000DD0.b
	jsr L000DE7.w
	bra L000DB2.b
L000DC5:
	inc $0D.b
	bra L000DB8.b
L000DC9:
	txa
	sta $0000.w,Y
	iny
	bra L000DB2.b
L000DD0:
	lda [$0C.b]
	sta $0000.w,Y
	iny
	cpy $81.b
	beq L000DE2.b
	inc $0C.b
	bne L000DB2.b
	inc $0D.b
	bra L000DB2.b
L000DE2:
.ACCU 16
	rep #$20
	pla
	plp
	rtl

L000DE7:
	lda $0700.w,X
	phx
	tax
	lda $0600.w,X
	beq L000E24.b
	bmi L000E16.b
	jsr L000DE7.w
L000DF6:
	plx
	lda $0800.w,X
	tax
	lda $0600.w,X
	beq L000E10.b
	bpl L000DE7.b
	lda [$0C.b]
	sta $0000.w,Y
	iny
	inc $0C.b
	beq L000E0D.b
	rts

L000E0D:
	inc $0D.b
	rts

L000E10:
	txa
	sta $0000.w,Y
	iny
	rts

L000E16:
	lda [$0C.b]
	sta $0000.w,Y
	iny
	inc $0C.b
	bne L000DF6.b
	inc $0D.b
	bne L000DF6.b
L000E24:
	txa
	sta $0000.w,Y
	iny
	bra L000DF6.b
L000E2B:
	php
.ACCU 16
	rep #$20
.INDEX 8
	sep #$10
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	xba
	pha
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	xba
	sta $7E.b
	ldy #$08.b
	jsr L0010B3.w
.ACCU 8
	sep #$20
	lda $7F.b
	sta $84.b
.ACCU 16
	rep #$20
	ldx #$08.b
	jsr L001151.w
	sty $83.b
	stz $88.b
	stz $86.b
	ldx #$FE.b
	ldy #$10.b
L000E61:
	inx
	inx
	dey
	asl $86.b
	lda $86.b
	sec		; Set carry
	sbc $88.b
	sta $0920.w,X
	phy
	ldy $83.b
	jsr L0010B3.w
	sty $83.b
	ply
	sta $0900.w,X
	clc		; Clear carry
	adc $88.b
	sta $88.b
	lda $81.b
	clc		; Clear carry
	adc $86.b
	sta $86.b
	lda $81.b
	bne L000E8F.b
	stz $0940.w,X
	bra L000E61.b
L000E8F:
	lda $86.b
	sta $00.b
	cpy #$00.b
	clc		; Clear carry
	beq L000E9E.b
	tya
L000E99:
	asl $00.b
	dec A
	bne L000E99.b
L000E9E:
	lda $00.b
	sta $0940.w,X
	bcc L000E61.b
	txa
	lsr A
	inc A
	sta $8A.b
	ldx #$00.b
L000EAC:
	stz $0700.w,X
	inx
	inx
	bne L000EAC.b
	ldy #$00.b
	ldx #$FF.b
L000EB7:
.ACCU 16
	rep #$20
	phy
	ldy $83.b
	jsr L0010B3.w
	sty $83.b
	ply
.ACCU 8
	sep #$20
	inc $81.b
L000EC6:
	inx
	lda $0700.w,X
	bne L000EC6.b
	dec $81.b
	bne L000EC6.b
	dec $0700.w,X
	txa
	sta $0600.w,Y
	iny
	dec $88.b
	bne L000EB7.b
.ACCU 16
	rep #$20
	lda #$1010.w
	ldx #$00.b
L000EE3:
	sta $0800.w,X
	inx
	inx
	bne L000EE3.b
.ACCU 8
	sep #$20
	ldx #$00.b
	txy
	lda #$01.b
	sta $8C.b
L000EF3:
	phx
	lda $8C.b
	dec A
	asl A
	tax
	cpx #$10.b
	beq L000F47.b
	lda $0900.w,X
	sta $88.b
	ldx $8C.b
	lda $009168.l,X
	sta $8E.b
	plx
	bra L000F39.b
L000F0D:
	lda $8C.b
	dec A
	asl A
	sta $00.b
	lda $0600.w,Y
	sta $01.b
	iny
	cmp $84.b
	bne L000F25.b
	lda $8C.b
	sta $85.b
	lda #$12.b
	sta $00.b
L000F25:
	phy
	ldy $8E.b
	bra L000F35.b
L000F2A:
	lda $01.b
	sta $0700.w,X
	lda $00.b
	sta $0800.w,X
	inx
L000F35:
	dey
	bne L000F2A.b
	ply
L000F39:
	dec $88.b
	bpl L000F0D.b
	inc $8C.b
	lda $8A.b
	cmp $8C.b
	bcs L000EF3.b
	bra L000F60.b
L000F47:
	lda #$10.b
	sec		; Set carry
	sbc $8C.b
	sta $0900.w,X
	lda $8C.b
	sec		; Set carry
	sbc #$08.b
	sta $0901.w,X
	inc $8C.b
	inx
	inx
	cpx #$20.b
	bne L000F47.b
	plx
L000F60:
	lda $8A.b
	sec		; Set carry
	sbc #$09.b
	sta $8A.b
	ldy $83.b
.ACCU 16
	rep #$20
	jmp L000FF2.w
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  88.b		; 80 58
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  80.b		; 80 50
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  72.b		; 80 48
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  64.b		; 80 40
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  56.b		; 80 38
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  48.b		; 80 30
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  40.b		; 80 28
.ACCU 8
	sep #$20		; E2 20
	lda [$0C.b]		; A7 0C
.ACCU 16
	rep #$20		; C2 20
	inc $0C.b		; E6 0C
	ldy #$08.b		; A0 08
	bra  32.b		; 80 20
	asl A		; 0A
	dey		; 88
	beq -100.b		; F0 9C
	asl A		; 0A
	dey		; 88
	beq -92.b		; F0 A4
	asl A		; 0A
	dey		; 88
	beq -84.b		; F0 AC
	asl A		; 0A
	dey		; 88
	beq -76.b		; F0 B4
	asl A		; 0A
	dey		; 88
	beq -68.b		; F0 BC
	asl A		; 0A
	dey		; 88
	beq -60.b		; F0 C4
	asl A		; 0A
	dey		; 88
	beq -52.b		; F0 CC
	asl A		; 0A
	dey		; 88
	beq -44.b		; F0 D4
	sta $7E.b		; 85 7E
	inc $10.b		; E6 10
L000FF2:
	ldx $7F.b
	lda $0700.w,X
	sta ($10.b)
	lda $0800.w,X
	tax
	lda $7E.b
	jmp ($9002.w,X)
	nop
	sta $E28FE6.l
	sta $DA8FDE.l
	sta $D28FD6.l
	sta $168FCE.l
	bcc 126.b		; Invalid branch target (bcc L001093)
	bcc L001071.b
	lda #$0000.w
.ACCU 8
	sep #$20
	stz $7D.b
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	cpy #$08.b
	beq L00102E.b
L001028:
	asl A
	iny
	cpy #$08.b
	bne L001028.b
L00102E:
	ora $7D.b
	sta $7D.b
	ldx #$10.b
	ldy $8A.b
	beq L001045.b
	sec		; Set carry
L001039:
	lda $7E.b
	sbc $0940.w,X
	bcc L001045.b
	inx
	inx
	dey
	bne L001039.b
L001045:
	ldy $0900.w,X
	lda $7E.b
L00104A:
	lsr A
	dey
	bne L00104A.b
	sec		; Set carry
	sbc $0920.w,X
	tay
.ACCU 8
	sep #$20
	lda $0600.w,Y
	cmp $84.b
	beq L001071.b
	sta ($10.b)
.ACCU 16
	rep #$20
	inc $10.b
	lda $7D.b
	sta $7E.b
	ldy $0901.w,X
	tyx
	ply
	jsr L001151.w
	jmp L000FF2.w
L001071:
.ACCU 16
	rep #$20
	lda $7D.b
	sta $7E.b
	ldy $0901.w,X
	tyx
	ply
	bra L001080.b
	ldx $85.b		; A6 85
L001080:
	jsr L001151.w
	jsr L0010B3.w
	beq L001099.b
	dec $10.b
	lda ($10.b)
	inc $10.b
	sta ($10.b)
	inc $10.b
	.db $C6		; Opcode overrunning section
L001093:
	sta ($D0.b,X)		; 81 D0
	sed		; Set decimal
	jmp L000FF2.w
L001099:
	lda $7E.b
	bmi L0010B0.b
	ldx #$01.b
	jsr L001151.w
	lda $7F.b
	sta ($10.b)
	inc $10.b
	ldx #$08.b
	jsr L001151.w
	jmp L000FF2.w
L0010B0:
	pla
	plp
	rtl

L0010B3:
	stz $81.b
	lda $7E.b
	asl A
	dey
	beq L0010CE.b
L0010BB:
	bcc L0010F2.b
	asl A
	rol $81.b
	dey
	beq L0010DA.b
L0010C3:
	asl A
	rol $81.b
	dey
	beq L0010E6.b
L0010C9:
	sta $7E.b
	lda $81.b
	rts

L0010CE:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L0010BB.b
L0010DA:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L0010C3.b
L0010E6:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L0010C9.b
L0010F2:
	phx
	ldx #$02.b
L0010F5:
	asl A
	dey
	beq L001117.b
L0010F9:
	inx
	bcc L0010F5.b
	phx
L0010FD:
	asl A
	rol $81.b
	dey
	beq L001123.b
L001103:
	dex
	bne L0010FD.b
	sta $7E.b
	plx
	txa
	asl A
	tax
	lda $00912B.l,X
	plx
	clc		; Clear carry
	adc $81.b
	sta $81.b
	rts

L001117:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L0010F9.b
L001123:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L001103.b
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $1C00.w		; 0C 00 1C
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	ora ($FC.b,X)		; 01 FC
	ora $FC.b,S		; 03 FC
	ora [$FC.b]		; 07 FC
	ora $FC1FFC.l		; 0F FC 1F FC
	and $FC7FFC.l,X		; 3F FC 7F FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	.db $FF		; Opcode overrunning section
L001151:
	lda $7E.b
L001153:
	asl A
	dey
	beq L00115D.b
L001157:
	dex
	bne L001153.b
	sta $7E.b
	rts

L00115D:
.ACCU 8
	sep #$20
	lda [$0C.b]
.ACCU 16
	rep #$20
	inc $0C.b
	ldy #$08.b
	bra L001157.b
	sta ($41.b,X)		; 81 41
	and ($11.b,X)		; 21 11
	ora #$0305.w		; 09 05 03
	.db $02		; Opcode overrunning section
L001171:
	php
.ACCU 16
.INDEX 16
	rep #$30
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	xba
	pha
	clc		; Clear carry
	adc $10.b
	sta $81.b
	inc $0C.b
	inc $0C.b
	inc $0C.b
	inc $0C.b
	inc $0C.b
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	cmp #$0101.w
	bne L0011D1.b
	ldy $10.b
L00119A:
	lda [$0C.b]
	inc $0C.b
	and #$00FF.w
	cmp #$0080.w
	bcc L0011BD.b
	eor #$00FF.w
	inc A
	tax
L0011AB:
	lda [$0C.b]
	inc $0C.b
	sta $0000.w,Y
	iny
	dex
	bne L0011AB.b
	cpy $81.b
	bcc L00119A.b
	pla
	plp
	rtl

L0011BD:
	tax
	inx
	lda [$0C.b]
	inc $0C.b
L0011C3:
	sta $0000.w,Y
	iny
	dex
	bne L0011C3.b
	cpy $81.b
	bcc L00119A.b
	pla
	plp
	rtl

L0011D1:
	ldy $10.b
L0011D3:
	lda [$0C.b]
	inc $0C.b
	and #$00FF.w
	cmp #$0080.w
	bcc L0011F9.b
	eor #$00FF.w
	inc A
	tax
L0011E4:
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	sta $0000.w,Y
	iny
	iny
	dex
	bne L0011E4.b
	cpy $81.b
	bcc L0011D3.b
	pla
	plp
	rtl

L0011F9:
	tax
	inx
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
L001201:
	sta $0000.w,Y
	iny
	iny
	dex
	bne L001201.b
	cpy $81.b
	bcc L0011D3.b
	pla
	plp
	rtl

L001210:
	php
.ACCU 16
.INDEX 16
	rep #$30
	phb
	lda #$7E7E.w
	pha
	plb
	plb
	lda $10.b
	pha
	lda [$0C.b]
	inc $0C.b
	inc $0C.b
	xba
	cmp #$42FB.w
	bne L00122F.b
	jsl L000D4F.l
	bra L001278.b
L00122F:
	cmp #$26FB.w
	bne L00123A.b
	jsl L000E2B.l
	bra L001278.b
L00123A:
	cmp #$67FB.w
	bne L001245.b
	jsl L001171.l
	bra L001278.b
L001245:
	cmp #$27FB.w
	bne L00126D.b
	jsl L000E2B.l
	ldy #$007E.w
	sty $0E.b
	ply
	sty $0C.b
	pha
	tax
.ACCU 8
	sep #$20
	lda #$00.b
L00125C:
	clc		; Clear carry
	adc $0000.w,Y
	sta $0000.w,Y
	iny
	dex
	bne L00125C.b
.ACCU 16
	rep #$20
	pla
	plb
	plp
	rtl

L00126D:
	plx
	dec $0C.b
	dec $0C.b
	lda #$0001.w
	plb
	plp
	rtl

L001278:
	plx
	stx $0C.b
	ldx #$007E.w
	stx $0E.b
	plb
	plp
	rtl

L001283:
	php
.ACCU 16
.INDEX 16
	rep #$30
	ldy #$0000.w
	lda #$BBAA.w
L00128C:
	cmp $2140.w
	bne L00128C.b
.ACCU 8
	sep #$20
	lda #$CC.b
	bra L0012BD.b
L001297:
	lda [$0C.b],Y
	iny
	xba
	lda #$00.b
	bra L0012AA.b
L00129F:
	xba
	lda [$0C.b],Y
	iny
	xba
L0012A4:
	cmp $2140.w
	bne L0012A4.b
	inc A
L0012AA:
.ACCU 16
	rep #$20
	sta APUIO0.w		; APU I/O Port 0
.ACCU 8
	sep #$20
	dex
	bne L00129F.b
L0012B4:
	cmp $2140.w
	bne L0012B4.b
L0012B9:
	adc #$03.b
	beq L0012B9.b
L0012BD:
	pha
.ACCU 16
	rep #$20
	lda [$0C.b],Y
	iny
	iny
	tax
	lda [$0C.b],Y
	iny
	iny
	sta APUIO2.w		; APU I/O Port 2
.ACCU 8
	sep #$20
	cpx #$0001.w
	lda #$00.b
	rol A
	sta APUIO1.w		; APU I/O Port 1
	adc #$7F.b
	pla
	sta APUIO0.w		; APU I/O Port 0
L0012DD:
	cmp $2140.w
	bne L0012DD.b
	bvs L001297.b
	stz APUIO0.w		; APU I/O Port 0
	plp
	rtl

L0012E9:
	php
.ACCU 8
	sep #$20
L0012EC:
	lda APUIO0.w		; APU I/O Port 0
	bne L0012EC.b
	lda #$01.b
	sta APUIO0.w		; APU I/O Port 0
L0012F6:
	cmp $2140.w
	bne L0012F6.b
	stz APUIO0.w		; APU I/O Port 0
	plp
	rtl

L001300:
	php
.ACCU 8
	sep #$20
L001303:
	lda APUIO0.w		; APU I/O Port 0
	bne L001303.b
	lda #$02.b
	sta APUIO0.w		; APU I/O Port 0
L00130D:
	cmp $2140.w
	bne L00130D.b
	lda APUIO1.w		; APU I/O Port 1
	tay
	lda #$80.b
	sta APUIO0.w		; APU I/O Port 0
L00131B:
	cmp $2140.w
	bne L00131B.b
	ldx APUIO1.w		; APU I/O Port 1
	stz APUIO0.w		; APU I/O Port 0
.ACCU 16
	rep #$20
	tya
	plp
	rtl

L00132B:
	php
.ACCU 8
	sep #$20
L00132E:
	lda APUIO0.w		; APU I/O Port 0
	bne L00132E.b
	sty APUIO2.w		; APU I/O Port 2
	lda #$03.b
	sta APUIO0.w		; APU I/O Port 0
	stz APUIO1.w		; APU I/O Port 1
L00133E:
	cmp $2140.w
	bne L00133E.b
	ldy #$0000.w
L001346:
	lda [$0C.b],Y
	sta APUIO2.w		; APU I/O Port 2
	iny
	tya
	sta APUIO1.w		; APU I/O Port 1
L001350:
	cmp $2141.w
	bne L001350.b
	nop
	nop
	nop
	dex
	bne L001346.b
	stz APUIO0.w		; APU I/O Port 0
	plp
	rtl

	php		; 08
.ACCU 8
	sep #$20		; E2 20
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	lda #$04.b		; A9 04
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	stx APUIO1.w		; 8E 41 21
	lda #$05.b		; A9 05
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
	sty APUIO2.w		; 8C 42 21
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	stx APUIO1.w		; 8E 41 21
	lda #$06.b		; A9 06
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	stx APUIO1.w		; 8E 41 21
	ldy #$00.b		; A0 00
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	iny		; C8
	lda #$07.b		; A9 07
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	ldx #$81.b		; A2 81
	stx APUIO0.w		; 8E 40 21
	cpx APUIO0.w		; EC 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	ldy #$00.b		; A0 00
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	iny		; C8
	lda #$08.b		; A9 08
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	ldx #$82.b		; A2 82
	stx APUIO0.w		; 8E 40 21
	cpx APUIO0.w		; EC 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	ldy #$00.b		; A0 00
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	iny		; C8
	lda #$09.b		; A9 09
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	ldx #$83.b		; A2 83
	stx APUIO0.w		; 8E 40 21
	cpx APUIO0.w		; EC 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	ldy #$00.b		; A0 00
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	iny		; C8
	lda #$0A.b		; A9 0A
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO3.w		; 8D 43 21
	ldx #$84.b		; A2 84
	stx APUIO0.w		; 8E 40 21
	cpx APUIO0.w		; EC 40 21
	bne  -5.b		; D0 FB
	lda [$0C.b],Y		; B7 0C
	sta APUIO1.w		; 8D 41 21
	iny		; C8
	lda [$0C.b],Y		; B7 0C
	sta APUIO2.w		; 8D 42 21
	inx		; E8
	stx APUIO0.w		; 8E 40 21
	cpx APUIO0.w		; EC 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
	sty APUIO2.w		; 8C 42 21
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	stx APUIO1.w		; 8E 41 21
	lda #$0B.b		; A9 0B
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda APUIO0.w		; AD 40 21
	bne  -5.b		; D0 FB
	sty APUIO2.w		; 8C 42 21
	stx APUIO1.w		; 8E 41 21
	lda #$0C.b		; A9 0C
	sta APUIO0.w		; 8D 40 21
	cmp $2140.w		; CD 40 21
	bne  -5.b		; D0 FB
	stz APUIO0.w		; 9C 40 21
	plp		; 28
	rtl		; 6B

L001505:
	php
.ACCU 8
.INDEX 8
	sep #$30
L001508:
	lda APUIO0.w		; APU I/O Port 0
	bne L001508.b
	lda #$0D.b
	sta APUIO0.w		; APU I/O Port 0
L001512:
	cmp $2140.w
	bne L001512.b
	stz APUIO0.w		; APU I/O Port 0
	plp
	rtl

L00151C:
	php
.ACCU 8
.INDEX 8
	sep #$30
	pha
L001520:
	lda APUIO0.w		; APU I/O Port 0
	bne L001520.b
	pla
	sty APUIO3.w		; APU I/O Port 4
	sta APUIO2.w		; APU I/O Port 2
	stx APUIO1.w		; APU I/O Port 1
	lda #$0E.b
	sta APUIO0.w		; APU I/O Port 0
L001534:
	cmp $2140.w
	bne L001534.b
	stz APUIO0.w		; APU I/O Port 0
	plp
	rtl

	jsr ($CFF3.w,X)		; FC F3 CF
	and $100401.l,X		; 3F 01 04 10
	rti		; 40

	cop $08.b		; 02 08
	jsr $0380.w		; 20 80 03
	tsb $C030.w		; 0C 30 C0
L00154E:
	sta $099A.w
	stx $099C.w
	sty $099E.w
	stz $09A0.w
	tyx
	lda #$0100.w
	sec		; Set carry
	sbc $099E.w
	sta $0B2A.w,X
	stz $0D2A.w
	lda #$FFFF.w
	sta $0D2C.w,X
	stx $0E2C.w
	ldx #$0100.w
	lda #$0100.w
	sta $0B2A.w,X
	stx $0F2C.w
	lda #$0002.w
	sta $09A8.w
	stz $09A2.w
	lda #$0200.w
	sta $09A4.w
	jmp L0015BD.w
L00158F:
	lda $099C.w
	sta $09A2.w
	lda $09A0.w
	dec A
	beq L0015BC.b
	asl A
	tax
L00159D:
	lda $0AAA.w,X
	bmi L0015B8.b
	dec A
	sta $0AAA.w,X
	bne L0015B8.b
.ACCU 8
	sep #$20
	lda #$00.b
	pha
.ACCU 16
	rep #$20
	lda #$95B7.w
	pha
	phx
	phy
	jmp L001B13.w
L0015B8:
	dex
	dex
	bpl L00159D.b
L0015BC:
	rtl

L0015BD:
	lda $09A2.w
	asl A
	asl A
	tax
	lda #$E100.w
L0015C6:
	cpx $09A4.w
	beq L0015D4.b
	sta $0700.w,X
	inx
	inx
	inx
	inx
	bne L0015C6.b
L0015D4:
	stx $09A4.w
.ACCU 8
	sep #$20
	lda #$01.b
	sta $096A.w
.ACCU 16
	rep #$20
	rtl

L0015E1:
	lda $0D.b
	asl A
	asl A
	asl A
	and #$F800.w
	sta $28.b
	lda $0C.b
	asl A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	ora $28.b
	ldy $09A0.w
	beq L001607.b
	ldx #$0000.w
L0015FD:
	cmp $09AA.w,X
	beq L00162F.b
	inx
	inx
	dey
	bne L0015FD.b
L001607:
	sta $28.b
	lda $14.b
	pha
.ACCU 8
	sep #$20
	lda #$00.b
	pha
.ACCU 16
	rep #$20
	lda #$961B.w
	pha
	phx
	phy
	jmp L001945.w
	cmp #$0000.w		; C9 00 00
	bpl  10.b		; 10 0A
	pla		; 68
	sta $14.b		; 85 14
	lda #$FFFF.w		; A9 FF FF
	sta $09A6.w		; 8D A6 09
	rts		; 60

	tax		; AA
	pla		; 68
	sta $14.b		; 85 14
L00162F:
	lda $09A8.w
	sta $0AAA.w,X
	lda $0A2A.w,X
	and #$0FFF.w
	rts

L00163C:
	pha
	phy
	lda $00.b
	asl A
	asl A
	tay
	lda [$10.b],Y
	clc		; Clear carry
	adc $10.b
	sta $0C.b
	iny
	iny
	lda [$10.b],Y
	adc $12.b
	sta $0E.b
	ply
	pla
	stx $1C.b
	sty $1E.b
	sta $14.b
	lda $0A.b
	sta $09A2.w
	jmp L00168A.w
L001662:
	pha
	phy
	lda $00.b
	asl A
	asl A
	tay
	lda [$10.b],Y
	clc		; Clear carry
	adc $10.b
	sta $0C.b
	iny
	iny
	lda [$10.b],Y
	adc $12.b
	sta $0E.b
	ply
	pla
	stx $1C.b
	sty $1E.b
	sta $14.b
	jsr L0015E1.w
	bmi L0016A5.b
	sta $16.b
	lda $09A2.w
L00168A:
	asl A
	asl A
	tax
	ldy #$0000.w
	lda [$0C.b],Y
	sta $02.b
	and #$0FFF.w
	beq L0016A5.b
	sta $00.b
	lda $14.b
	and #$4000.w
	bne L0016A6.b
	jmp L0017D4.w
L0016A5:
	rtl

L0016A6:
	ldy #$0008.w
L0016A9:
	cpx #$0200.w
	beq L0016A5.b
	iny
	iny
	lda $1E.b
	clc		; Clear carry
	adc [$0C.b],Y
	sta $26.b
	dey
	dey
	cmp $30.b
	bmi L0016D2.b
	cmp $34.b
	bmi L0016C9.b
	cmp $36.b
	bmi L0016D5.b
	cmp $32.b
	bpl L0016D2.b
L0016C9:
	lda $098E.w
	eor $14.b
	sta $28.b
	bra L0016D9.b
L0016D2:
	jmp L001766.w
L0016D5:
	lda $14.b
	sta $28.b
L0016D9:
	lda $1C.b
	sec		; Set carry
	sbc [$0C.b],Y
	bit $02.b
	bpl L0016E8.b
	sec		; Set carry
	sbc #$000F.w
	bra L0016EC.b
L0016E8:
	sec		; Set carry
	sbc #$0007.w
L0016EC:
	cmp $2E.b
	bpl L001766.b
	cmp $2C.b
	bmi L001766.b
	phy
	sta $20.b
.ACCU 8
	sep #$20
	sta $0700.w,X
	iny
	iny
	lda $26.b
	sta $0701.w,X
.ACCU 16
	rep #$20
	iny
	iny
	lda [$0C.b],Y
	clc		; Clear carry
	adc $16.b
	eor $28.b
	sta $0702.w,X
	lda $09A2.w
	lsr A
	lsr A
	tay
	lda $09A2.w
	and #$0003.w
	tax
.ACCU 8
	sep #$20
	lda $21.b
	bpl L00173E.b
	lda $03.b
	bpl L001731.b
	lda $0900.w,Y
	ora $00954A.l,X
	bra L001756.b
L001731:
	lda $0900.w,Y
	and $00953E.l,X
	ora $009542.l,X
	bra L001756.b
L00173E:
	lda $03.b
	bpl L00174F.b
	lda $0900.w,Y
	and $00953E.l,X
	ora $009546.l,X
	bra L001756.b
L00174F:
	lda $0900.w,Y
	and $00953E.l,X
L001756:
	sta $0900.w,Y
.ACCU 16
	rep #$20
	lda $09A2.w
	inc A
	sta $09A2.w
	asl A
	asl A
	tax
	ply
L001766:
	tya
	clc		; Clear carry
	adc #$0008.w
	tay
	dec $00.b
	beq L001773.b
	jmp L0016A9.w
L001773:
	rtl

L001774:
	pha
	phy
	lda $00.b
	asl A
	asl A
	tay
	lda [$10.b],Y
	clc		; Clear carry
	adc $10.b
	sta $0C.b
	iny
	iny
	lda [$10.b],Y
	adc $12.b
	sta $0E.b
	ply
	pla
	stx $1C.b
	sty $1E.b
	sta $14.b
	lda $0A.b
	sta $09A2.w
	jmp L0017C3.w
L00179A:
	rtl

L00179B:
	pha
	phy
	lda $00.b
	asl A
	asl A
	tay
	lda [$10.b],Y
	clc		; Clear carry
	adc $10.b
	sta $0C.b
	iny
	iny
	lda [$10.b],Y
	adc $12.b
	sta $0E.b
	ply
	pla
	stx $1C.b
	sty $1E.b
	sta $14.b
	jsr L0015E1.w
	bmi L00179A.b
	sta $16.b
	lda $09A2.w
L0017C3:
	asl A
	asl A
	tax
	ldy #$0000.w
	lda [$0C.b],Y
	sta $02.b
	and #$0FFF.w
	beq L00179A.b
	sta $00.b
L0017D4:
	ldy #$0008.w
L0017D7:
	cpx #$0200.w
	beq L001851.b
	iny
	iny
	lda $1E.b
	clc		; Clear carry
	adc [$0C.b],Y
	sta $26.b
	dey
	dey
	cmp $30.b
	bmi L001800.b
	cmp $34.b
	bmi L0017F7.b
	cmp $36.b
	bmi L001803.b
	cmp $32.b
	bpl L001800.b
L0017F7:
	lda $098E.w
	eor $14.b
	sta $28.b
	bra L001807.b
L001800:
	jmp L001887.w
L001803:
	lda $14.b
	sta $28.b
L001807:
	lda [$0C.b],Y
	clc		; Clear carry
	adc $1C.b
	cmp $2E.b
	bpl L001887.b
	cmp $2C.b
	bmi L001887.b
	phy
	sta $20.b
.ACCU 8
	sep #$20
	sta $0700.w,X
	iny
	iny
	lda $26.b
	sta $0701.w,X
.ACCU 16
	rep #$20
	iny
	iny
	lda [$0C.b],Y
	clc		; Clear carry
	adc $16.b
	eor $28.b
	sta $0702.w,X
	lda $09A2.w
	lsr A
	lsr A
	tay
	lda $09A2.w
	and #$0003.w
	tax
.ACCU 8
	sep #$20
	lda $21.b
	bpl L00185F.b
	lda $03.b
	bpl L001852.b
	lda $0900.w,Y
	ora $00954A.l,X
	bra L001877.b
L001851:
	rtl

L001852:
	lda $0900.w,Y
	and $00953E.l,X
	ora $009542.l,X
	bra L001877.b
L00185F:
	lda $03.b
	bpl L001870.b
	lda $0900.w,Y
	and $00953E.l,X
	ora $009546.l,X
	bra L001877.b
L001870:
	lda $0900.w,Y
	and $00953E.l,X
L001877:
	sta $0900.w,Y
.ACCU 16
	rep #$20
	lda $09A2.w
	inc A
	sta $09A2.w
	asl A
	asl A
	tax
	ply
L001887:
	tya
	clc		; Clear carry
	adc #$0008.w
	tay
	dec $00.b
	beq L001894.b
	jmp L0017D7.w
L001894:
	rtl

L001895:
	phx
	phy
	asl A
.BASE $80
L801898:
.BASE $00
L001898:
	asl A
	tay
	lda [$10.b],Y
	clc		; Clear carry
	adc $10.b
	sta $0C.b
	iny
	iny
	lda [$10.b],Y
	adc $12.b
	sta $0E.b
	bra L0018AD.b
	phx		; DA
	phy		; 5A
L0018AD:
	lda $00.b
	sta $0A.b
	lda #$0001.w
	sta $04.b
	lda $0E.b
	sta $07.b
	ldy #$0000.w
	lda [$0C.b],Y
	sta $00.b
	beq L0018FE.b
	asl A
	asl A
	asl A
	adc #$0008.w
	adc $0C.b
	sta $05.b
	iny
	iny
	ldx $00.b
	bpl L0018F2.b
	lda [$0C.b],Y
	tax
	and #$001F.w
	beq L0018F0.b
	lsr A
	sta $14.b
	txa
	and #$FFE0.w
	clc		; Clear carry
	adc $14.b
	sta $14.b
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $08.b
	bra L0018FB.b
L0018F0:
	stz $00.b
L0018F2:
	lda [$0C.b],Y
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $08.b
L0018FB:
	jmp L001A70.w
L0018FE:
	rtl

	phx		; DA
	phy		; 5A
	asl A		; 0A
	asl A		; 0A
	tay		; A8
	lda [$10.b],Y		; B7 10
	clc		; 18
	adc $10.b		; 65 10
	sta $0C.b		; 85 0C
	iny		; C8
	iny		; C8
	lda [$10.b],Y		; B7 10
	adc $12.b		; 65 12
	sta $0E.b		; 85 0E
	bra   2.b		; 80 02
	phx		; DA
	phy		; 5A
	lda $0D.b		; A5 0D
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	and #$F800.w		; 29 00 F8
	sta $28.b		; 85 28
	lda $0C.b		; A5 0C
	asl A		; 0A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	ora $28.b		; 05 28
	sta $28.b		; 85 28
	ldy $09A0.w		; AC A0 09
	beq L001945.b		; F0 13
	ldx #$0000.w		; A2 00 00
	cmp $09AA.w,X		; DD AA 09
	beq L001941.b		; F0 07
	inx		; E8
	inx		; E8
	dey		; 88
	bne -10.b		; D0 F6
	bra L001945.b		; 80 04
L001941:
	txa
	ply
	plx
	rtl

L001945:
	ldy $09A0.w
	cpy #$0040.w
	beq L0019C0.b
	lda #$0001.w
	sta $04.b
	lda $0E.b
	sta $07.b
	ldy #$0000.w
	lda [$0C.b],Y
	sta $00.b
	beq L001941.b
	asl A
	asl A
	asl A
	adc #$0008.w
	adc $0C.b
	sta $05.b
	iny
	iny
	ldx $00.b
	bpl L001996.b
	lda [$0C.b],Y
	tax
	and #$001F.w
	beq L001994.b
	lsr A
	sta $14.b
	txa
	and #$FFE0.w
	clc		; Clear carry
	adc $14.b
	sta $14.b
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $08.b
	lda $14.b
	clc		; Clear carry
	adc #$0010.w
	sta $14.b
	bra L0019A7.b
L001994:
	stz $00.b
L001996:
	lda [$0C.b],Y
	asl A
	asl A
	asl A
	asl A
	asl A
	sta $08.b
	lda [$0C.b],Y
	inc A
	and #$FFFE.w
	sta $14.b
L0019A7:
	lda $099E.w
L0019AA:
	tax
	lda $0B2A.w,X
	beq L0019C0.b
	bmi L0019B6.b
	cmp $14.b
	bcs L0019C6.b
L0019B6:
	txa
	clc		; Clear carry
	adc $0B2A.w,X
	and #$0FFF.w
	bra L0019AA.b
L0019C0:
	ply
	plx
	lda #$FFFF.w
	rtl

L0019C6:
	lda $09A0.w
	asl A
	tay
	lda $28.b
	sta $09AA.w,Y
	inc $09A0.w
	lda $00.b
	bpl L001A41.b
	txa
	ora #$8000.w
	sta $0A2A.w,Y
	sta $0A.b
	lda $14.b
	sec		; Set carry
	sbc #$0010.w
	sta $14.b
	and #$000F.w
	sta $16.b
	lda $0B2A.w,X
	pha
	lda $14.b
	ora #$8000.w
	sta $0B2A.w,X
	txa
	clc		; Clear carry
	adc $14.b
	tay
	txa
	sta $0D2C.w,Y
	tyx
	lda #$0010.w
	sec		; Set carry
	sbc $16.b
	sta $0B2A.w,X
	txa
	clc		; Clear carry
	adc $0B2A.w,X
	tay
	txa
	sta $0D2C.w,Y
	tyx
	lda $16.b
	ora #$8000.w
	sta $0B2A.w,X
	txa
	adc $16.b
	tay
	txa
	sta $0D2C.w,Y
	pla
	sec		; Set carry
	sbc #$0010.w
	sbc $14.b
	beq L001A70.b
	tyx
	sta $0B2A.w,X
	txa
	clc		; Clear carry
	adc $0B2A.w,X
	tay
	txa
	sta $0D2C.w,Y
	jmp L001A70.w
L001A41:
	txa
	sta $0A2A.w,Y
	sta $0A.b
	lda $0B2A.w,X
	sec		; Set carry
	sbc $14.b
	beq L001A68.b
	sta $16.b
	txa
	clc		; Clear carry
	adc $14.b
	tay
	lda $16.b
	sta $0B2A.w,Y
	txa
	sta $0D2C.w,Y
	phy
	tya
	adc $16.b
	tay
	pla
	sta $0D2C.w,Y
L001A68:
	lda $14.b
	ora #$8000.w
	sta $0B2A.w,X
L001A70:
.INDEX 8
	sep #$10
	ldx $54.b
	lda $04.b
	sta $0600.w,X
	lda $06.b
	sta $0602.w,X
	lda $08.b
	sta $0604.w,X
	lda $0A.b
	asl A
	asl A
	asl A
	asl A
	adc $099A.w
	sta $0606.w,X
.ACCU 8
	sep #$20
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
.ACCU 16
.INDEX 16
	rep #$30
	ldx $00.b
	bpl L001ABD.b
	lda $14.b
	clc		; Clear carry
	adc #$0010.w
	and #$FFF0.w
	adc $0A.b
	sta $0A.b
	lda $08.b
	clc		; Clear carry
	adc $05.b
	sta $05.b
	lda $08.b
	and #$01E0.w
	sta $08.b
	stz $00.b
	jmp L001A70.w
L001ABD:
	ply
	plx
	lda $09A0.w
	dec A
	asl A
	rtl

	phx		; DA
	phy		; 5A
	asl A		; 0A
	asl A		; 0A
	tay		; A8
	iny		; C8
	lda $11.b		; A5 11
	clc		; 18
	adc [$10.b],Y		; 77 10
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	and #$F800.w		; 29 00 F8
	sta $28.b		; 85 28
	dey		; 88
	lda [$10.b],Y		; B7 10
	clc		; 18
	adc $10.b		; 65 10
	asl A		; 0A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	ora $28.b		; 05 28
	bra  22.b		; 80 16
	phx		; DA
	phy		; 5A
	lda $0D.b		; A5 0D
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	and #$F800.w		; 29 00 F8
	sta $28.b		; 85 28
	lda $0C.b		; A5 0C
	asl A		; 0A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	ora $28.b		; 05 28
	ldy $09A0.w		; AC A0 09
	beq  13.b		; F0 0D
	ldx #$0000.w		; A2 00 00
	cmp $09AA.w,X		; DD AA 09
	beq L001B13.b		; F0 08
	inx		; E8
	inx		; E8
	dey		; 88
	bne -10.b		; D0 F6
	ply		; 7A
	plx		; FA
	rtl		; 6B

L001B13:
	lda $0A2A.w,X
	sta $00.b
	and #$0FFF.w
	sta $14.b
	dec $09A0.w
	beq L001B39.b
	lda $09A0.w
	asl A
	tay
	lda $09AA.w,Y
	sta $09AA.w,X
	lda $0A2A.w,Y
	sta $0A2A.w,X
	lda $0AAA.w,Y
	sta $0AAA.w,X
L001B39:
	ldx $14.b
	lda $0B2A.w,X
	and #$0FFF.w
	sta $02.b
	sta $16.b
	clc		; Clear carry
	adc $14.b
	cmp #$0100.w
	beq L001B58.b
	tay
	lda $0B2A.w,Y
	bmi L001B58.b
	clc		; Clear carry
	adc $16.b
	sta $16.b
L001B58:
	cpx #$0100.w
	beq L001B7E.b
	lda $0D2C.w,X
	bmi L001B7E.b
	tay
	lda $0B2A.w,Y
	bmi L001B7E.b
	clc		; Clear carry
	adc $16.b
	sta $0B2A.w,Y
	tya
	adc $0B2A.w,Y
	tax
	tya
	sta $0D2C.w,X
	lda $00.b
	bmi L001B93.b
	ply
	plx
	rtl

L001B7E:
	lda $16.b
	sta $0B2A.w,X
	txa
	clc		; Clear carry
	adc $16.b
	tay
	txa
	sta $0D2C.w,Y
	lda $00.b
	bmi L001B93.b
	ply
	plx
	rtl

L001B93:
	lda $02.b
	clc		; Clear carry
	adc #$0010.w
	and #$FFF0.w
	adc $00.b
	and #$0FFF.w
	sta $14.b
	stz $00.b
	jmp L001B39.w
	stz $14.b		; 64 14
	lda $099E.w		; AD 9E 09
	tax		; AA
	lda $0B2A.w,X		; BD 2A 0B
	beq  17.b		; F0 11
	bmi   5.b		; 30 05
	clc		; 18
	adc $14.b		; 65 14
	sta $14.b		; 85 14
	txa		; 8A
	clc		; 18
	adc $0B2A.w,X		; 7D 2A 0B
	and #$0FFF.w		; 29 FF 0F
	bra -23.b		; 80 E9
	lda $14.b		; A5 14
	rtl		; 6B

	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	ora $02.b,S		; 03 02
	and $32.b,S		; 23 32
	and ($22.b,S),Y		; 33 22
	bmi  32.b		; 30 20
	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	and #$00FF.w		; 29 FF 00
	pha		; 48
	stz $0F6A.w		; 9C 6A 0F
	jsr $9E07.w		; 20 07 9E
	lda #$0200.w		; A9 00 02
	sta $79.b		; 85 79
	clc		; 18
	adc #$0200.w		; 69 00 02
	sta $0F44.w		; 8D 44 0F
	clc		; 18
	adc #$00E0.w		; 69 E0 00
	sta $0F47.w		; 8D 47 0F
	lda #$00E0.w		; A9 E0 00
	sta $7B.b		; 85 7B
	lda #$0000.w		; A9 00 00
	ldx #$A033.w		; A2 33 A0
	jsl L000385.l		; 22 85 83 00
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	stz W1L.w		; 9C 26 21
	stz W2L.w		; 9C 28 21
	lda #$FF.b		; A9 FF
	sta W1R.w		; 8D 27 21
	sta W2R.w		; 8D 29 21
	plx		; FA
	stz WBGLOG.w		; 9C 2A 21
	lda $009BCF.l,X		; BF CF 9B 00
	sta W12SEL.w		; 8D 23 21
	lda $009BC7.l,X		; BF C7 9B 00
	sta TMW.w		; 8D 2E 21
	lda #$41.b		; A9 41
	sta DMAP7.w		; 8D 70 43
	lda #$26.b		; A9 26
	sta DMADEST7.w		; 8D 71 43
	ldx #$0F43.w		; A2 43 0F
	stx DMASRC7L.w		; 8E 72 43
	stz DMASRC7B.w		; 9C 74 43
	stz DMALEN7B.w		; 9C 77 43
	lda #$F0.b		; A9 F0
	sta $0F43.w		; 8D 43 0F
	sta $0F46.w		; 8D 46 0F
	stz $0F49.w		; 9C 49 0F
	lda #$80.b		; A9 80
	sta HDMAEN.w		; 8D 0C 42
	jsl L000521.l		; 22 21 85 00
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	stz $0F6C.w		; 9C 6C 0F
	stz $0F6E.w		; 9C 6E 0F
	lda #$0168.w		; A9 68 01
	sta $0F4A.w		; 8D 4A 0F
	jsr $9CB4.w		; 20 B4 9C
	lda $0960.w		; AD 60 09
	bne  39.b		; D0 27
	lda #$0001.w		; A9 01 00
	sta $0F6A.w		; 8D 6A 0F
	lda $0F6C.w		; AD 6C 0F
	pha		; 48
	lda $0F6A.w		; AD 6A 0F
	bne  -5.b		; D0 FB
	pla		; 68
	cmp $0F6C.w		; CD 6C 0F
	bne   4.b		; D0 04
	jsl L0003AB.l		; 22 AB 83 00
	lda $0F4A.w		; AD 4A 0F
	sec		; 38
	sbc #$0005.w		; E9 05 00
	sta $0F4A.w		; 8D 4A 0F
	beq   2.b		; F0 02
	bpl -47.b		; 10 D1
	stz W1R.w		; 9C 27 21
	stz W2R.w		; 9C 29 21
	lda #$FFFF.w		; A9 FF FF
	sta W1L.w		; 8D 26 21
	sta W2L.w		; 8D 28 21
.ACCU 8
	sep #$20		; E2 20
	stz HDMAEN.w		; 9C 0C 42
	jsl L000375.l		; 22 75 83 00
	jsl L0003AB.l		; 22 AB 83 00
.ACCU 16
	rep #$20		; C2 20
	lda $0960.w		; AD 60 09
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	stz $0F4E.w		; 9C 4E 0F
	lda $0F4A.w		; AD 4A 0F
	bne   2.b		; D0 02
	plp		; 28
	rts		; 60

	sta $0F50.w		; 8D 50 0F
	asl A		; 0A
	sta $0F52.w		; 8D 52 0F
	lda #$0003.w		; A9 03 00
	sec		; 38
	sbc $0F52.w		; ED 52 0F
	sta $0F52.w		; 8D 52 0F
	lda #$00E0.w		; A9 E0 00
	sec		; 38
	sbc $0F4E.w		; ED 4E 0F
	and #$FFFE.w		; 29 FE FF
	sta $0F5E.w		; 8D 5E 0F
	clc		; 18
	adc #$0020.w		; 69 20 00
	cmp #$8000.w		; C9 00 80
	ror A		; 6A
	sta $0F54.w		; 8D 54 0F
	lda #$00E0.w		; A9 E0 00
	sec		; 38
	sbc $0F50.w		; ED 50 0F
	and #$FFFE.w		; 29 FE FF
	sta $0F5C.w		; 8D 5C 0F
	clc		; 18
	adc #$0020.w		; 69 20 00
	cmp #$8000.w		; C9 00 80
	ror A		; 6A
	sta $0F56.w		; 8D 56 0F
	bit $0F5C.w		; 2C 5C 0F
	bpl   5.b		; 10 05
	bit $0F5E.w		; 2C 5E 0F
	bmi 120.b		; 30 78
	lda #$00E0.w		; A9 E0 00
	clc		; 18
	adc $0F4E.w		; 6D 4E 0F
	and #$FFFE.w		; 29 FE FF
	sta $0F60.w		; 8D 60 0F
	clc		; 18
	adc #$0020.w		; 69 20 00
	cmp #$8000.w		; C9 00 80
	ror A		; 6A
	sta $0F5A.w		; 8D 5A 0F
	lda #$00E0.w		; A9 E0 00
	clc		; 18
	adc $0F50.w		; 6D 50 0F
	and #$FFFE.w		; 29 FE FF
	sta $0F62.w		; 8D 62 0F
	clc		; 18
	adc #$0020.w		; 69 20 00
	cmp #$8000.w		; C9 00 80
	ror A		; 6A
	sta $0F58.w		; 8D 58 0F
.ACCU 8
	sep #$20		; E2 20
	ldy $0F5C.w		; AC 5C 0F
	bmi  30.b		; 30 1E
	lda $0F54.w		; AD 54 0F
	bpl   2.b		; 10 02
	lda #$00.b		; A9 00
	sta ($79.b),Y		; 91 79
	ldy $0F62.w		; AC 62 0F
	sta ($79.b),Y		; 91 79
	iny		; C8
	lda $0F5A.w		; AD 5A 0F
	bmi   2.b		; 30 02
	lda #$FF.b		; A9 FF
	sta ($79.b),Y		; 91 79
	ldy $0F5C.w		; AC 5C 0F
	iny		; C8
	sta ($79.b),Y		; 91 79
	ldy $0F5E.w		; AC 5E 0F
	bmi  30.b		; 30 1E
	lda $0F56.w		; AD 56 0F
	bpl   2.b		; 10 02
	lda #$00.b		; A9 00
	sta ($79.b),Y		; 91 79
	ldy $0F60.w		; AC 60 0F
	sta ($79.b),Y		; 91 79
	iny		; C8
	lda $0F58.w		; AD 58 0F
	bmi   2.b		; 30 02
	lda #$FF.b		; A9 FF
	sta ($79.b),Y		; 91 79
	ldy $0F5E.w		; AC 5E 0F
	iny		; C8
	sta ($79.b),Y		; 91 79
.ACCU 16
	rep #$20		; C2 20
	lda $0F52.w		; AD 52 0F
	bpl  17.b		; 10 11
	lda $0F4E.w		; AD 4E 0F
	asl A		; 0A
	asl A		; 0A
	clc		; 18
	adc #$0006.w		; 69 06 00
	adc $0F52.w		; 6D 52 0F
	sta $0F52.w		; 8D 52 0F
	bra  22.b		; 80 16
	lda $0F4E.w		; AD 4E 0F
	sec		; 38
	sbc $0F50.w		; ED 50 0F
	asl A		; 0A
	asl A		; 0A
	clc		; 18
	adc #$000A.w		; 69 0A 00
	adc $0F52.w		; 6D 52 0F
	sta $0F52.w		; 8D 52 0F
	dec $0F50.w		; CE 50 0F
	inc $0F4E.w		; EE 4E 0F
	lda $0F4E.w		; AD 4E 0F
	cmp $0F50.w		; CD 50 0F
	bcs   3.b		; B0 03
	jmp $9CD2.w		; 4C D2 9C
	lda #$00E0.w		; A9 E0 00
	sec		; 38
	sbc $0F4A.w		; ED 4A 0F
	bcc  28.b		; 90 1C
	cmp #$8000.w		; C9 00 80
	ror A		; 6A
	sta $0F64.w		; 8D 64 0F
	ldy #$0000.w		; A0 00 00
	ldx #$0000.w		; A2 00 00
	lda #$00FF.w		; A9 FF 00
	cpx $0F64.w		; EC 64 0F
	beq   7.b		; F0 07
	sta ($79.b),Y		; 91 79
	iny		; C8
	iny		; C8
	inx		; E8
	bra -12.b		; 80 F4
	lda #$00E0.w		; A9 E0 00
	clc		; 18
	adc $0F4A.w		; 6D 4A 0F
	lsr A		; 4A
	inc A		; 1A
	cmp #$00E0.w		; C9 E0 00
	bcs  18.b		; B0 12
	tax		; AA
	asl A		; 0A
	tay		; A8
	lda #$00FF.w		; A9 FF 00
	cpx #$00E0.w		; E0 E0 00
	beq   7.b		; F0 07
	sta ($79.b),Y		; 91 79
	iny		; C8
	iny		; C8
	inx		; E8
	bra -12.b		; 80 F4
	plp		; 28
	rts		; 60

	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	ldx #$0000.w		; A2 00 00
	lda #$FF00.w		; A9 00 FF
	sta $0200.w,X		; 9D 00 02
	sta $0400.w,X		; 9D 00 04
	inx		; E8
	inx		; E8
	cpx #$01C0.w		; E0 C0 01
	bcc -13.b		; 90 F3
	plp		; 28
	rts		; 60

	php		; 08
.ACCU 16
	rep #$20		; C2 20
	lda $0F4A.w		; AD 4A 0F
	sec		; 38
	sbc #$0080.w		; E9 80 00
	sta $0F4E.w		; 8D 4E 0F
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	ldy #$0000.w		; A0 00 00
	cpy #$00E0.w		; C0 E0 00
	bcs  55.b		; B0 37
	cpy $0F4A.w		; CC 4A 0F
	bcs  37.b		; B0 25
	cpy $0F4E.w		; CC 4E 0F
	bpl   9.b		; 10 09
	lda #$00.b		; A9 00
	eor $0F4C.w		; 4D 4C 0F
	sta ($79.b),Y		; 91 79
	bra  20.b		; 80 14
.ACCU 16
	rep #$20		; C2 20
	tya		; 98
	sec		; 38
	sbc $0F4A.w		; ED 4A 0F
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	and #$000F.w		; 29 0F 00
.ACCU 8
	sep #$20		; E2 20
	eor $0F4C.w		; 4D 4C 0F
	sta ($79.b),Y		; 91 79
	iny		; C8
	bra -47.b		; 80 D1
	lda #$0F.b		; A9 0F
	eor $0F4C.w		; 4D 4C 0F
	sta ($79.b),Y		; 91 79
	iny		; C8
	cpy #$00E0.w		; C0 E0 00
	bcc  -8.b		; 90 F8
	plp		; 28
	rts		; 60

	php		; 08
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	ldx #$0000.w		; A2 00 00
	lda #$0F.b		; A9 0F
	eor $0F4C.w		; 4D 4C 0F
	sta $0200.w,X		; 9D 00 02
	inx		; E8
	cpx #$00E0.w		; E0 E0 00
	bcc  -9.b		; 90 F7
	plp		; 28
	rts		; 60

	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	and #$00FF.w		; 29 FF 00
	beq   3.b		; F0 03
	lda #$000F.w		; A9 0F 00
	sta $0F4C.w		; 8D 4C 0F
	stz $0F6A.w		; 9C 6A 0F
	jsr $9E71.w		; 20 71 9E
	lda #$0200.w		; A9 00 02
	sta $79.b		; 85 79
	clc		; 18
	adc #$0200.w		; 69 00 02
	sta $0F44.w		; 8D 44 0F
	clc		; 18
	adc #$0070.w		; 69 70 00
	sta $0F47.w		; 8D 47 0F
	lda #$0070.w		; A9 70 00
	sta $7B.b		; 85 7B
	lda #$0000.w		; A9 00 00
	ldx #$A033.w		; A2 33 A0
	jsl L000385.l		; 22 85 83 00
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	lda #$40.b		; A9 40
	sta DMAP7.w		; 8D 70 43
	lda #$00.b		; A9 00
	sta DMADEST7.w		; 8D 71 43
	ldx #$0F43.w		; A2 43 0F
	stx DMASRC7L.w		; 8E 72 43
	stz DMASRC7B.w		; 9C 74 43
	stz DMALEN7B.w		; 9C 77 43
	lda #$F0.b		; A9 F0
	sta $0F43.w		; 8D 43 0F
	sta $0F46.w		; 8D 46 0F
	stz $0F49.w		; 9C 49 0F
	lda #$80.b		; A9 80
	sta HDMAEN.w		; 8D 0C 42
	jsl L000521.l		; 22 21 85 00
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	stz $0F6C.w		; 9C 6C 0F
	stz $0F6E.w		; 9C 6E 0F
	lda #$0000.w		; A9 00 00
	sta $0F4A.w		; 8D 4A 0F
	jsr $9E1F.w		; 20 1F 9E
	lda $0960.w		; AD 60 09
	bne  26.b		; D0 1A
	lda #$0001.w		; A9 01 00
	sta $0F6A.w		; 8D 6A 0F
	lda $0F6A.w		; AD 6A 0F
	bne  -5.b		; D0 FB
	lda $0F4A.w		; AD 4A 0F
	clc		; 18
	adc #$0003.w		; 69 03 00
	sta $0F4A.w		; 8D 4A 0F
	cmp #$0160.w		; C9 60 01
	bcc -34.b		; 90 DE
.ACCU 8
	sep #$20		; E2 20
	stz HDMAEN.w		; 9C 0C 42
	jsl L000375.l		; 22 75 83 00
	jsl L0003AB.l		; 22 AB 83 00
.ACCU 16
	rep #$20		; C2 20
	lda $0960.w		; AD 60 09
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 16
	rep #$20		; C2 20
	lda $0F4A.w		; AD 4A 0F
	sec		; 38
	sbc #$0080.w		; E9 80 00
	sta $0F4E.w		; 8D 4E 0F
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	ldy #$0000.w		; A0 00 00
	cpy #$00E0.w		; C0 E0 00
	bcs  53.b		; B0 35
	cpy $0F4A.w		; CC 4A 0F
	bcs  38.b		; B0 26
	cpy $0F4E.w		; CC 4E 0F
	bpl   4.b		; 10 04
	lda #$F1.b		; A9 F1
	bra  24.b		; 80 18
.ACCU 16
	rep #$20		; C2 20
	tya		; 98
	sec		; 38
	sbc $0F4A.w		; ED 4A 0F
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	and #$000F.w		; 29 0F 00
	eor #$000F.w		; 49 0F 00
.ACCU 8
	sep #$20		; E2 20
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	ora #$0F.b		; 09 0F
	sta ($79.b),Y		; 91 79
	iny		; C8
	bra -48.b		; 80 D0
	lda #$00.b		; A9 00
	sta ($79.b),Y		; 91 79
	iny		; C8
	cpy #$00E0.w		; C0 E0 00
	bcc  -8.b		; 90 F8
	plp		; 28
	rts		; 60

	php		; 08
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	ldx #$0000.w		; A2 00 00
	lda #$00.b		; A9 00
	sta $0200.w,X		; 9D 00 02
	inx		; E8
	cpx #$00E0.w		; E0 E0 00
	bcc  -9.b		; 90 F7
	plp		; 28
	rts		; 60

	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	stz $0F6A.w		; 9C 6A 0F
	jsr $9F81.w		; 20 81 9F
	lda #$0200.w		; A9 00 02
	sta $79.b		; 85 79
	clc		; 18
	adc #$0200.w		; 69 00 02
	sta $0F44.w		; 8D 44 0F
	clc		; 18
	adc #$0070.w		; 69 70 00
	sta $0F47.w		; 8D 47 0F
	lda #$0070.w		; A9 70 00
	sta $7B.b		; 85 7B
	lda #$0000.w		; A9 00 00
	ldx #$A033.w		; A2 33 A0
	jsl L000385.l		; 22 85 83 00
.INDEX 16
	rep #$10		; C2 10
.ACCU 8
	sep #$20		; E2 20
	lda #$40.b		; A9 40
	sta DMAP7.w		; 8D 70 43
	lda #$06.b		; A9 06
	sta DMADEST7.w		; 8D 71 43
	ldx #$0F43.w		; A2 43 0F
	stx DMASRC7L.w		; 8E 72 43
	stz DMASRC7B.w		; 9C 74 43
	stz DMALEN7B.w		; 9C 77 43
	lda #$F0.b		; A9 F0
	sta $0F43.w		; 8D 43 0F
	sta $0F46.w		; 8D 46 0F
	stz $0F49.w		; 9C 49 0F
	lda #$80.b		; A9 80
	sta HDMAEN.w		; 8D 0C 42
	jsl L000521.l		; 22 21 85 00
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	stz $0F6C.w		; 9C 6C 0F
	stz $0F6E.w		; 9C 6E 0F
	lda #$0000.w		; A9 00 00
	sta $0F4A.w		; 8D 4A 0F
	jsr $9F31.w		; 20 31 9F
	lda $0960.w		; AD 60 09
	bne  26.b		; D0 1A
	lda #$0001.w		; A9 01 00
	sta $0F6A.w		; 8D 6A 0F
	lda $0F6A.w		; AD 6A 0F
	bne  -5.b		; D0 FB
	lda $0F4A.w		; AD 4A 0F
	clc		; 18
	adc #$0002.w		; 69 02 00
	sta $0F4A.w		; 8D 4A 0F
	cmp #$0160.w		; C9 60 01
	bcc -34.b		; 90 DE
.ACCU 8
	sep #$20		; E2 20
	stz HDMAEN.w		; 9C 0C 42
	jsl L000375.l		; 22 75 83 00
	jsl L0003AB.l		; 22 AB 83 00
.ACCU 16
	rep #$20		; C2 20
	lda $0960.w		; AD 60 09
	plp		; 28
	rtl		; 6B

	php		; 08
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	inc $0F6C.w		; EE 6C 0F
	lda $0F6A.w		; AD 6A 0F
	beq  38.b		; F0 26
	inc $0F6E.w		; EE 6E 0F
	lda #$0200.w		; A9 00 02
	cmp $0F44.w		; CD 44 0F
	bne   3.b		; D0 03
	lda #$0400.w		; A9 00 04
	sta $0F44.w		; 8D 44 0F
	clc		; 18
	adc $7B.b		; 65 7B
	sta $0F47.w		; 8D 47 0F
	lda #$0200.w		; A9 00 02
	cmp $79.b		; C5 79
	bne   3.b		; D0 03
	lda #$0400.w		; A9 00 04
	sta $79.b		; 85 79
	stz $0F6A.w		; 9C 6A 0F
	plp		; 28
	rtl		; 6B

	ora ($02.b,X)		; 01 02
	tsb $08.b		; 04 08
	bpl  32.b		; 10 20
	rti		; 40

	bra  32.b		; 80 20
	brk $21.b		; 00 21
	brk $23.b		; 00 23
	brk $26.b		; 00 26
	brk $28.b		; 00 28
	brk $2A.b		; 00 2A
	brk $2D.b		; 00 2D
	brk $2F.b		; 00 2F
	brk $32.b		; 00 32
	brk $35.b		; 00 35
	brk $39.b		; 00 39
	brk $3C.b		; 00 3C
	brk $40.b		; 00 40
	brk $43.b		; 00 43
	brk $47.b		; 00 47
	brk $4C.b		; 00 4C
	brk $50.b		; 00 50
	brk $55.b		; 00 55
	brk $5A.b		; 00 5A
	brk $5F.b		; 00 5F
	brk $65.b		; 00 65
	brk $6B.b		; 00 6B
	brk $72.b		; 00 72
	brk $78.b		; 00 78
	brk $80.b		; 00 80
	brk $87.b		; 00 87
	brk $8F.b		; 00 8F
	brk $98.b		; 00 98
	brk $A1.b		; 00 A1
	brk $AA.b		; 00 AA
	brk $B5.b		; 00 B5
	brk $BF.b		; 00 BF
	brk $CB.b		; 00 CB
	brk $D7.b		; 00 D7
	brk $E4.b		; 00 E4
	brk $F1.b		; 00 F1
	brk $00.b		; 00 00
	ora ($0F.b,X)		; 01 0F
	ora ($1F.b,X)		; 01 1F
	ora ($30.b,X)		; 01 30
	ora ($42.b,X)		; 01 42
	ora ($55.b,X)		; 01 55
	ora ($6A.b,X)		; 01 6A
	ora ($7F.b,X)		; 01 7F
	ora ($96.b,X)		; 01 96
	ora ($AE.b,X)		; 01 AE
	ora ($C8.b,X)		; 01 C8
	ora ($E3.b,X)		; 01 E3
	ora ($00.b,X)		; 01 00
	cop $1E.b		; 02 1E
	cop $3E.b		; 02 3E
	cop $60.b		; 02 60
	cop $85.b		; 02 85
	cop $AB.b		; 02 AB
	cop $D4.b		; 02 D4
	cop $FF.b		; 02 FF
	cop $2C.b		; 02 2C
	ora $5D.b,S		; 03 5D
	ora $90.b,S		; 03 90
	ora $C6.b,S		; 03 C6
	ora $00.b,S		; 03 00
	tsb $3C.b		; 04 3C
	tsb $7D.b		; 04 7D
	tsb $C1.b		; 04 C1
	tsb $0A.b		; 04 0A
	ora $56.b		; 05 56
	ora $A8.b		; 05 A8
	ora $FE.b		; 05 FE
	ora $59.b		; 05 59
	asl $BA.b		; 06 BA
	asl $20.b		; 06 20
	ora [$8D.b]		; 07 8D
	ora [$00.b]		; 07 00
	php		; 08
	adc $FA08.w,Y		; 79 08 FA
	php		; 08
	sta $09.b,S		; 83 09
	trb $0A.b		; 14 0A
	lda $500A.w		; AD 0A 50
	phd		; 0B
	jsr ($B20B.w,X)		; FC 0B B2
	tsb $0D74.w		; 0C 74 0D
	eor ($0E.b,X)		; 41 0E
	inc A		; 1A
	ora $F31000.l		; 0F 00 10 F3
	bpl -11.b		; 10 F5
	ora ($06.b),Y		; 11 06
	ora ($28.b,S),Y		; 13 28
	trb $5B.b		; 14 5B
	ora $A0.b,X		; 15 A0
	asl $F9.b,X		; 16 F9
	ora [$65.b],Y		; 17 65
	ora $1AE8.w,Y		; 19 E8 1A
	.db $82, $1C, $34		; 82 1C 34
	asl $2000.w,X		; 1E 00 20
	sbc [$21.b]		; E7 21
	xba		; EB
	and $0D.b,S		; 23 0D
	rol $51.b		; 26 51
	plp		; 28
	lda [$2A.b],Y		; B7 2A
	eor ($2D.b,X)		; 41 2D
	sbc ($2F.b)		; F2 2F
	wai		; CB
	and ($D1.b)		; 32 D1
	and $04.b,X		; 35 04
	and $3C68.w,Y		; 39 68 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	ora $03.b,S		; 03 03
	tsb $04.b		; 04 04
	ora $05.b		; 05 05
	ora $06.b		; 05 06
	asl $07.b		; 06 07
	ora [$08.b]		; 07 08
	php		; 08
	php		; 08
	ora #$0A09.w		; 09 09 0A
	asl A		; 0A
	phd		; 0B
	tsb $0D0C.w		; 0C 0C 0D
	ora $0E0E.w		; 0D 0E 0E
	ora $11100F.l		; 0F 0F 10 11
	ora ($12.b),Y		; 11 12
	ora ($13.b)		; 12 13
	trb $14.b		; 14 14
	ora $16.b,X		; 15 16
	asl $17.b,X		; 16 17
	ora [$18.b],Y		; 17 18
	ora $1A19.w,Y		; 19 19 1A
	tas		; 1B
	tas		; 1B
	trb $1D1D.w		; 1C 1D 1D
	asl $1F1F.w,X		; 1E 1F 1F
	jsr $2121.w		; 20 21 21
	jsl $242323.l		; 22 23 23 24
	and $25.b		; 25 25
	rol $27.b		; 26 27
	and [$28.b]		; 27 28
	and #$2A29.w		; 29 29 2A
	pld		; 2B
	pld		; 2B
	bit $2D2D.w		; 2C 2D 2D
	rol $2F2E.w		; 2E 2E 2F
	bmi L0021D0.b		; 30 30
	and ($31.b),Y		; 31 31
	and ($32.b)		; 32 32
	and ($34.b,S),Y		; 33 34
	bit $35.b,X		; 34 35
	and $36.b,X		; 35 36
	rol $37.b,X		; 36 37
	and [$38.b],Y		; 37 38
	sec		; 38
	and $3A39.w,Y		; 39 39 3A
	dec A		; 3A
	dec A		; 3A
	tsa		; 3B
	tsa		; 3B
	bit $3C3C.w,X		; 3C 3C 3C
	and $3E3D.w,X		; 3D 3D 3E
	rol $3E3E.w,X		; 3E 3E 3E
	and $403F3F.l,X		; 3F 3F 3F 40
	rti		; 40

	rti		; 40

	rti		; 40

L0021C6:
	phx
	phy
	phb
	php
.ACCU 8
.INDEX 8
	sep #$30
	dec $0F70.w
	pha
L0021D0:
	lda $67.b
	pha
	plb
	pla
	asl A
	tay
.ACCU 16
	rep #$20
	lda [$4D.b],Y
	clc		; Clear carry
	adc $4D.b
	sta $65.b
	ldx #$00.b
	txy
L0021E3:
	lda $109D.w,X
	cmp $65.b
	beq L002202.b
L0021EA:
	inx
	inx
	iny
	cpy #$08.b
	bne L0021E3.b
	ldx #$10.b
	stx $61.b
	ldx #$20.b
	stx $0F83.w
	lda $65.b
	sta $0FEE.w,X
	jmp L002238.w
L002202:
	lda $1065.w,Y
	and #$00FF.w
	beq L0021EA.b
	inc $0F70.w
	plp
	plb
	ply
	plx
	rtl

L002212:
	phx
	phy
	phb
	php
.ACCU 8
.INDEX 8
	sep #$30
	dec $0F70.w
	pha
	lda $67.b
	pha
	plb
	pla
	ldx #$10.b
	stx $61.b
	ldx #$20.b
	stx $0F83.w
	asl A
	tay
.ACCU 16
	rep #$20
	lda [$4D.b],Y
	clc		; Clear carry
	adc $4D.b
	sta $65.b
	sta $0FEE.w,X
L002238:
	ldy #$06.b
	lda ($65.b),Y
	sta $75.b
.ACCU 8
	sep #$20
	ldy #$05.b
	lda ($65.b),Y
	sta $77.b
	ldy #$2F.b
	lda ($65.b),Y
	sta $1021.w,X
	stz $1010.w,X
L002250:
	lda $0994.w
	bne L002261.b
	ldy #$12.b
	lda ($65.b),Y
	sta $1042.w
	iny
	lda ($65.b),Y
	bra L002268.b
L002261:
	ldy #$17.b
	lda ($65.b),Y
	sta $1042.w
L002268:
	sta $1053.w
	lda #$7F.b
	sta $71.b
	ldy #$10.b
	jsr L002662.w
	inc $0F70.w
	plp
	plb
	ply
	plx
	rtl

	phx		; DA
	phy		; 5A
	phb		; 8B
	php		; 08
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	dec $0F70.w		; CE 70 0F
	pha		; 48
	lda $67.b		; A5 67
	pha		; 48
	plb		; AB
	pla		; 68
	asl A		; 0A
	tay		; A8
.ACCU 16
	rep #$20		; C2 20
	lda [$4D.b],Y		; B7 4D
	clc		; 18
	adc $4D.b		; 65 4D
	sta $65.b		; 85 65
	ldx #$00.b		; A2 00
	txy		; 9B
	lda $109D.w,X		; BD 9D 10
	cmp $65.b		; C5 65
	bne   5.b		; D0 05
	jsr $AA51.w		; 20 51 AA
	bra   7.b		; 80 07
	inx		; E8
	inx		; E8
	iny		; C8
	cpy #$08.b		; C0 08
	bne -19.b		; D0 ED
	inc $0F70.w		; EE 70 0F
	plp		; 28
	plb		; AB
	ply		; 7A
	plx		; FA
	rtl		; 6B

L0022B4:
	phx
	phy
	phb
	php
.ACCU 8
.INDEX 8
	sep #$30
	dec $0F70.w
	pha
	lda $67.b
	pha
	plb
	pla
	asl A
	tay
.ACCU 16
	rep #$20
	lda [$4D.b],Y
	clc		; Clear carry
	adc $4D.b
	sta $65.b
	ldx #$00.b
	txy
L0022D1:
	lda $109D.w,X
	cmp $65.b
	bne L0022DD.b
	jsr L002A42.w
	bra L0022E4.b
L0022DD:
	inx
	inx
	iny
	cpy #$08.b
	bne L0022D1.b
L0022E4:
	inc $0F70.w
	plp
	plb
	ply
	plx
	rtl

L0022EC:
	php
.ACCU 8
.INDEX 8
	sep #$30
	jsl L002336.l
	dec $0F70.w
.INDEX 16
	rep #$10
	ldy #$0020.w
	ldx #$09D8.w
	lda [$0C.b],Y
	jsl L000AFE.l
	sta $0F7A.w
.INDEX 8
	sep #$10
	lda $0E.b
	sta $6F.b
.ACCU 16
	rep #$20
	ldy #$00.b
L002311:
	lda [$0C.b],Y
	beq L002322.b
	clc		; Clear carry
	adc $0C.b
	sta $0F88.w,Y
	sta $0FAA.w,Y
	iny
	iny
	bra L002311.b
L002322:
	stz $0F74.w
.ACCU 8
	sep #$20
	tya
	lsr A
	sta $0F85.w
	lda #$01.b
	sta $0F77.w
	inc $0F70.w
	plp
	rtl

L002336:
	php
.ACCU 8
.INDEX 8
	sep #$30
	lda #$FF.b
	sta $0F70.w
	stz $0F77.w
	stz $0F85.w
	ldy #$07.b
L002346:
	lda $106D.w,Y
	cmp #$10.b
	bcs L002355.b
	lda $1065.w,Y
	beq L002355.b
	jsr L002A42.w
L002355:
	dey
	bpl L002346.b
	ldy #$00.b
	ldx #$10.b
	jsr L0023B8.w
	stz $0F70.w
	plp
	rtl

	sta $0F7D.w		; 8D 7D 0F
	rtl		; 6B

L002368:
	php
.ACCU 8
	sep #$20
.INDEX 16
	rep #$10
	lda #$FF.b
	sta $0F70.w
	ldx $4F.b
	stx $67.b
	ldx #$0208.w
L002379:
	stz $0F74.w,X
	dex
	bpl L002379.b
	ldx #$5000.w
	stx $0F7B.w
	ldx #$0000.w
	stx $0F7D.w
.INDEX 8
	sep #$10
	ldy #$00.b
	ldx #$11.b
	jsr L0023B8.w
	jsr L0023D5.w
	jsl L0023A5.l
	lda #$12.b
	sta $0F7A.w
	stz $0F70.w
	plp
	rtl

L0023A5:
	php
.ACCU 8
.INDEX 8
	sep #$30
	dec $0F70.w
	ldy #$07.b
L0023AD:
	jsr L002A42.w
	dey
	bpl L0023AD.b
	inc $0F70.w
	plp
	rtl

L0023B8:
	php
.ACCU 8
.INDEX 8
	sep #$30
	stx $69.b
	tya
	tax
	asl A
	tay
.ACCU 16
	rep #$20
	lda #$0000.w
L0023C6:
	sta $0FEE.w,Y
	sta $0FCC.w,Y
	iny
	iny
	inx
	cpx $69.b
	bne L0023C6.b
	plp
	rts

L0023D5:
	jsl L001505.l
L0023D9:
	lda APUIO0.w		; APU I/O Port 0
	bne L0023D9.b
	lda $0F7C.w
	sta APUIO1.w		; APU I/O Port 1
	sta APUIO2.w		; APU I/O Port 2
	lda $000F73.l
	sta APUIO3.w		; APU I/O Port 4
	lda #$08.b
	sta APUIO0.w		; APU I/O Port 0
L0023F3:
	cmp $2140.w
	bne L0023F3.b
	lda $000F72.l
	sta APUIO1.w		; APU I/O Port 1
	lda $000F71.l
	sta APUIO2.w		; APU I/O Port 2
	ldx #$82.b
	stx APUIO0.w		; APU I/O Port 0
L00240B:
	cpx APUIO0.w		; APU I/O Port 0
	bne L00240B.b
	stz APUIO0.w		; APU I/O Port 0
	rts

L002414:
	lda APUIO0.w		; APU I/O Port 0
	bne L002414.b
	sty APUIO1.w		; APU I/O Port 1
	lda #$05.b
	sta APUIO0.w		; APU I/O Port 0
L002421:
	cmp $2140.w
	bne L002421.b
	stz APUIO0.w		; APU I/O Port 0
	rts

L00242A:
	lda APUIO0.w		; APU I/O Port 0
	bne L00242A.b
	lda $62.b
	sta APUIO1.w		; APU I/O Port 1
	lda $0F80.w
	sta APUIO2.w		; APU I/O Port 2
	lda $0F82.w
	sta APUIO3.w		; APU I/O Port 4
	lda #$07.b
	sta APUIO0.w		; APU I/O Port 0
L002445:
	cmp $2140.w
	bne L002445.b
	ldy #$14.b
	lda ($65.b),Y
	sta APUIO1.w		; APU I/O Port 1
	iny
	lda ($65.b),Y
	sta APUIO2.w		; APU I/O Port 2
	pha
	iny
	lda ($65.b),Y
	sta APUIO3.w		; APU I/O Port 4
	ldx #$81.b
	stx APUIO0.w		; APU I/O Port 0
L002463:
	cpx APUIO0.w		; APU I/O Port 0
	bne L002463.b
	stz APUIO0.w		; APU I/O Port 0
L00246B:
	lda APUIO0.w		; APU I/O Port 0
	bne L00246B.b
	lda $62.b
	sta APUIO1.w		; APU I/O Port 1
.ACCU 16
	rep #$20
	lda $71.b
	sta APUIO2.w		; APU I/O Port 2
.ACCU 8
	sep #$20
	lda #$06.b
	sta APUIO0.w		; APU I/O Port 0
L002483:
	cmp $2140.w
	bne L002483.b
	stz APUIO0.w		; APU I/O Port 0
	pla
	bmi L0024A5.b
L00248E:
	lda APUIO0.w		; APU I/O Port 0
	bne L00248E.b
	lda $74.b
	sta APUIO2.w		; APU I/O Port 2
	lda #$0C.b
	sta APUIO0.w		; APU I/O Port 0
L00249D:
	cmp $2140.w
	bne L00249D.b
	stz APUIO0.w		; APU I/O Port 0
L0024A5:
	ldy $62.b
	rts

L0024A8:
	lda APUIO0.w		; APU I/O Port 0
	bne L0024A8.b
	lda $72.b
	sta APUIO2.w		; APU I/O Port 2
	sty APUIO1.w		; APU I/O Port 1
	lda #$0C.b
	sta APUIO0.w		; APU I/O Port 0
L0024BA:
	cmp $2140.w
	bne L0024BA.b
	stz APUIO0.w		; APU I/O Port 0
L0024C2:
	lda APUIO0.w		; APU I/O Port 0
	bne L0024C2.b
.ACCU 16
	rep #$20
	lda $77.b
	sta APUIO2.w		; APU I/O Port 2
.ACCU 8
	sep #$20
	sty APUIO1.w		; APU I/O Port 1
	lda #$0B.b
	sta APUIO0.w		; APU I/O Port 0
L0024D8:
	cmp $2140.w
	bne L0024D8.b
	stz APUIO0.w		; APU I/O Port 0
	rts

L0024E1:
.ACCU 16
	rep #$20
	lda $108D.w,X
	bmi L002526.b
	bne L002523.b
.ACCU 8
	sep #$20
	lda $1065.w,Y
	cmp #$01.b
	beq L002529.b
	lda $106D.w,Y
	phx
	tax
	lda $1054.w,X
	plx
	cmp #$00.b
	bne L002522.b
	lda #$04.b
	sta $1065.w,Y
	phy
.ACCU 16
	rep #$20
	dec $108D.w,X
	lda $109D.w,X
	sta $65.b
	ldy #$15.b
	lda ($65.b),Y
	lsr A
	and #$7000.w
	clc		; Clear carry
	adc #$0FFF.w
	sta $10AD.w,X
	ply
.ACCU 8
	sep #$20
L002522:
	rts

L002523:
	dec $108D.w,X
L002526:
.ACCU 8
	sep #$20
	rts

L002529:
	jsr L002A42.w
	rts

L00252D:
	ldx #$00.b
	txy
L002530:
	sty $62.b
	stx $0F84.w
	lda $1065.w,Y
	beq L002544.b
	lda $106D.w,Y
	cmp #$10.b
	bcs L002544.b
	jsr L0024E1.w
L002544:
	inx
	inx
	iny
	cpy #$08.b
	bcc L002530.b
	rts

L00254C:
	lda [$6D.b]
	inc $6D.b
	tax
	and #$007F.w
	txy
	bpl L002571.b
L002557:
	sta $69.b
	lda [$6D.b]
	inc $6D.b
	tax
	and #$007F.w
	sta $6B.b
	lda $69.b
	asl A
	asl A
	asl A
	asl A
	asl A
	asl A
	asl A
	ora $6B.b
	txy
	bmi L002557.b
L002571:
	rts

L002572:
	lda $63.b
	sta $6D.b
	jsr L00254C.w
	lda [$6D.b]
	inc $6D.b
	tay
	sty $77.b
	cpy #$D9.b
	bcc L0025E3.b
	cpy #$E7.b
	bne L002595.b
	lda [$6D.b]
	and #$00FF.w
	sec		; Set carry
	adc $6D.b
	sta $6D.b
	jmp L0025EF.w
L002595:
	cpy #$D9.b
	beq L0025EF.b
	cpy #$DA.b
	beq L0025EF.b
	cpy #$DB.b
	beq L0025EF.b
	cpy #$E3.b
	beq L0025EF.b
	cpy #$DC.b
	beq L0025B5.b
	cpy #$DD.b
	beq L0025B5.b
	cpy #$DE.b
	beq L0025B5.b
	cpy #$E2.b
	bne L0025BF.b
L0025B5:
	lda [$6D.b]
	inc $6D.b
	tay
	sty $71.b
	jmp L0025EF.w
L0025BF:
	cpy #$DF.b
	bne L0025D4.b
	lda [$6D.b]
	inc $6D.b
	tay
	sty $71.b
	lda [$6D.b]
	inc $6D.b
	tay
	sty $75.b
	jmp L0025EF.w
L0025D4:
	cpy #$E5.b
	bne L0025EF.b
	lda [$6D.b]
	inc $6D.b
	inc $6D.b
	sta $75.b
	jmp L0025EF.w
L0025E3:
	lda [$6D.b]
	inc $6D.b
	tay
	sty $71.b
	jsr L00254C.w
	sta $75.b
L0025EF:
	rts

L0025F0:
	ldx #$07.b
L0025F2:
	lda $1065.w,X
	beq L002659.b
L0025F7:
	dex
	bpl L0025F2.b
	lda #$FF.b
	sta $62.b
	stz $0F7F.w
	stz $0F80.w
	stz $0F81.w
	ldy #$2A.b
	lda ($65.b),Y
	sta $0F82.w
	ldx #$07.b
	ldy #$0E.b
L002612:
	lda ($65.b)
	and $00A066.l,X
	beq L00264A.b
	lda $0F82.w
	cmp $1085.w,X
	bcc L00264A.b
	lda $1065.w,X
	cmp $0F81.w
	bcc L00264A.b
	bne L00263D.b
.ACCU 16
	rep #$20
	lda $10DD.w,Y
	cmp $0F7F.w
	bcc L00264A.b
	stx $62.b
	sta $0F7F.w
	bra L00264A.b
L00263D:
	stx $62.b
	sta $0F81.w
.ACCU 16
	rep #$20
	lda $10DD.w,Y
	sta $0F7F.w
L00264A:
.ACCU 8
	sep #$20
	dey
	dey
	dex
	bpl L002612.b
	ldx $62.b
	bmi L002661.b
	txy
	jmp L002414.w
L002659:
	lda ($65.b)
	and $00A066.l,X
	beq L0025F7.b
L002661:
	rts

L002662:
	php
.ACCU 16
	rep #$20
	lda $0FEE.w,X
	beq L002676.b
	sta $65.b
.ACCU 8
.INDEX 8
	sep #$30
	jsr L0025F0.w
	stx $62.b
	txa
	bpl L002678.b
L002676:
	plp
	rts

L002678:
	asl A
	sta $0F84.w
	lda $61.b
	sta $106D.w,X
	ldy #$2A.b
	lda ($65.b),Y
	sta $1085.w,X
	ldy #$15.b
	lda ($65.b),Y
	bpl L002692.b
	lda #$02.b
	bra L002694.b
L002692:
	lda #$01.b
L002694:
	sta $1065.w,X
	ldx $0F84.w
.ACCU 16
	rep #$20
	lda $75.b
	dec A
	sta $108D.w,X
	stz $10DD.w,X
	stz $10ED.w,X
	stz $10FD.w,X
	ldy #$1C.b
	lda ($65.b),Y
	sta $110D.w,X
	stz $111D.w,X
	ldy #$20.b
	lda ($65.b),Y
	sta $112D.w,X
	stz $113D.w,X
	ldy #$1E.b
	lda ($65.b),Y
	sta $114D.w,X
	stz $115D.w,X
	ldy #$2D.b
	lda ($65.b),Y
	bmi L0026D4.b
	lda #$FFFF.w
	bra L0026D7.b
L0026D4:
	lda #$0000.w
L0026D7:
	sta $116D.w,X
	ldy #$0A.b
	lda ($65.b),Y
	sta $10AD.w,X
	sta $73.b
	lda $65.b
	sta $109D.w,X
.ACCU 8
	sep #$20
	ldx $71.b
	lda $00A146.l,X
	and #$FF.b
	cmp #$40.b
	bne L002708.b
	ldx $61.b
	lda $1032.w,X
	sta $0F80.w
	iny
	lda $1043.w,X
	sta $0F82.w
	jmp L002728.w
L002708:
	asl A
	sta $71.b
	ldx $62.b
	sta $1075.w,X
	ldx $61.b
	xba
	lda $1032.w,X
	jsr L00097A.w
	sta $0F80.w
	lda $71.b
	xba
	lda $1043.w,X
	jsr L00097A.w
	sta $0F82.w
L002728:
	lda $0F86.w
	beq L002744.b
	lda $61.b
	cmp #$10.b
	beq L002744.b
	lsr $0F82.w
	lsr $0F80.w
	lda $0F86.w
	bpl L002744.b
	lsr $0F82.w
	lsr $0F80.w
L002744:
	ldy #$04.b
	lda $77.b
	clc		; Clear carry
	adc ($65.b),Y
	sta $77.b
	ldx $62.b
	sta $107D.w,X
	asl A
	tax
.ACCU 16
	rep #$20
	lda $00A06E.l,X
	ldx $0F84.w
	sta $10CD.w,X
	sta $71.b
.ACCU 8
	sep #$20
	ldy $61.b
	lda $1021.w,Y
	beq L0027CD.b
	lda $1010.w,Y
	beq L0027CD.b
	bmi L002799.b
	lda $77.b
	clc		; Clear carry
	adc $1021.w,Y
	asl A
	tax
.ACCU 16
	rep #$20
	lda $00A06E.l,X
	sec		; Set carry
	sbc $71.b
	sta $75.b
.ACCU 8
	sep #$20
	lda $1010.w,Y
	tay
.ACCU 16
	rep #$20
	lda $75.b
	jsr L0009D1.w
	clc		; Clear carry
	adc $71.b
	sta $71.b
	bra L0027CD.b
L002799:
	lda $77.b
	sec		; Set carry
	sbc $1021.w,Y
	asl A
	tax
.ACCU 16
	rep #$20
	lda $71.b
	sec		; Set carry
	sbc $00A06E.l,X
	sta $75.b
.ACCU 8
	sep #$20
	lda #$00.b
	sec		; Set carry
	sbc $1010.w,Y
	bpl L0027BE.b
.ACCU 16
	rep #$20
	lda $75.b
	sta $5A.b
	bra L0027C6.b
L0027BE:
	tay
.ACCU 16
	rep #$20
	lda $75.b
	jsr L0009D1.w
L0027C6:
	lda $71.b
	sec		; Set carry
	sbc $5A.b
	sta $71.b
L0027CD:
.ACCU 16
	rep #$20
	ldy #$02.b
	lda ($65.b),Y
	ldx $0F84.w
	clc		; Clear carry
	adc $71.b
	sta $10BD.w,X
.ACCU 8
	sep #$20
	jsr L00242A.w
	tya
	plp
	rts

L0027E4:
	txa
	sta $61.b
	asl A
	tax
	stx $0F83.w
L0027EC:
.ACCU 16
	rep #$20
	lda $0FCC.w,X
	beq L0027F6.b
	jmp L002A3A.w
L0027F6:
	lda $0F88.w,X
	sta $63.b
L0027FB:
	jsr L002572.w
	lda $6D.b
	sta $63.b
	ldx $0F83.w
	ldy $77.b
	cpy #$D9.b
	bcs L00280E.b
	jmp L002A21.w
L00280E:
	beq L002814.b
	cpy #$DA.b
	bne L00281B.b
L002814:
	jsl L002336.l
	jmp L002A3D.w
L00281B:
	cpy #$E2.b
	bne L00282B.b
	lda $0F88.w,X
	inc A
	inc A
	inc A
	sta $0FAA.w,X
	jmp L002A24.w
L00282B:
	cpy #$DB.b
	bne L002837.b
	lda $0FAA.w,X
	sta $0F88.w,X
	bra L0027EC.b
L002837:
	cpy #$DD.b
	bne L002843.b
	ldy $71.b
	sty $0F7A.w
	jmp L002A24.w
L002843:
	cpy #$DE.b
	beq L00284A.b
	jmp L0028DB.w
L00284A:
	lda $0FEE.w,X
	sta $65.b
.ACCU 8
	sep #$20
	lda $0994.w
	bne L002862.b
	ldy #$12.b
	lda ($65.b),Y
	sta $0F7F.w
	iny
	lda ($65.b),Y
	bra L002869.b
L002862:
	ldy #$17.b
	lda ($65.b),Y
	sta $0F7F.w
L002869:
	sta $0F81.w
	ldx $61.b
	lda $0F7F.w
	xba
	lda $71.b
	jsr L00097A.w
	sta $1032.w,X
	lda $0F81.w
	xba
	lda $71.b
	jsr L00097A.w
	sta $1043.w,X
	ldy #$07.b
L002888:
	lda $106D.w,Y
	cmp $61.b
	bne L0028CC.b
	ldx $61.b
	lda $1032.w,X
	xba
	lda $1075.w,Y
	jsr L00097A.w
	sta $0F80.w
	lda $1043.w,X
	xba
	lda $1075.w,Y
	jsr L00097A.w
	sta $0F82.w
L0028AB:
	lda APUIO0.w		; APU I/O Port 0
	bne L0028AB.b
	lda $0F82.w
	sta APUIO3.w		; APU I/O Port 4
	lda $0F80.w
	sta APUIO2.w		; APU I/O Port 2
	sty APUIO1.w		; APU I/O Port 1
	lda #$0E.b
	sta APUIO0.w		; APU I/O Port 0
L0028C4:
	cmp $2140.w
	bne L0028C4.b
	stz APUIO0.w		; APU I/O Port 0
L0028CC:
	dey
	bpl L002888.b
.ACCU 16
	rep #$20
	jmp L002A24.w
L0028D4:
	lda $75.b
	sta $71.b
	jmp L00284A.w
L0028DB:
	cpy #$DF.b
	bne L002918.b
	ldy $71.b
	cpy #$07.b
	beq L0028D4.b
	cpy #$40.b
	bne L002915.b
.ACCU 8
	sep #$20
	ldx $61.b
	lda $75.b
	sta $1054.w,X
	bne L002910.b
	ldx #$07.b
L0028F6:
	lda $106D.w,X
	cmp $61.b
	bne L00290D.b
	lda $1065.w,X
	beq L00290D.b
	lda #$04.b
	sta $1065.w,X
	stz $108D.w,X
	stz $108E.w,X
L00290D:
	dex
	bpl L0028F6.b
L002910:
.ACCU 16
	rep #$20
	jmp L002A24.w
L002915:
	jmp L002A24.w
L002918:
	cpy #$E5.b
	beq L00291F.b
	jmp L0029DE.w
L00291F:
.ACCU 8
	sep #$20
	lda $75.b
	xba
	lda $71.b
	asl A
.ACCU 16
	rep #$20
	sec		; Set carry
	sbc #$4000.w
	asl A
.ACCU 8
	sep #$20
	xba
	ldx $61.b
	sta $1010.w,X
	sta $73.b
	lda $1021.w,X
	bne L002940.b
	jmp L0029D9.w
L002940:
	sta $77.b
	ldy #$07.b
L002944:
	lda $106D.w,Y
	cmp $61.b
	beq L00294E.b
	jmp L0029D1.w
L00294E:
	phy
	tya
	asl A
	tax
	phx
	lda $73.b
	beq L002982.b
	bmi L00298C.b
	lda $107D.w,Y
	clc		; Clear carry
	adc $77.b
	asl A
	tax
.ACCU 16
	rep #$20
	lda $00A06E.l,X
	plx
	sec		; Set carry
	sbc $10CD.w,X
	sta $75.b
.ACCU 8
	sep #$20
	lda $73.b
	tay
.ACCU 16
	rep #$20
	lda $75.b
	jsr L0009D1.w
	clc		; Clear carry
	adc $10CD.w,X
	sta $71.b
	bra L0029C6.b
L002982:
.ACCU 16
	rep #$20
	plx
	lda $10CD.w,X
	sta $71.b
	bra L0029C6.b
L00298C:
	lda $107D.w,Y
	sec		; Set carry
	sbc $77.b
	asl A
	tax
.ACCU 16
	rep #$20
	lda $00A06E.l,X
	sta $71.b
	plx
	lda $10CD.w,X
	sec		; Set carry
	sbc $71.b
	sta $75.b
.ACCU 8
	sep #$20
	lda #$00.b
	sec		; Set carry
	sbc $73.b
	bpl L0029B6.b
.ACCU 16
	rep #$20
	lda $75.b
	sta $5A.b
	bra L0029BE.b
L0029B6:
	tay
.ACCU 16
	rep #$20
	lda $75.b
	jsr L0009D1.w
L0029BE:
	lda $10CD.w,X
	sec		; Set carry
	sbc $5A.b
	sta $71.b
L0029C6:
	ldy #$02.b
	lda ($65.b),Y
	clc		; Clear carry
	adc $71.b
	sta $10BD.w,X
	ply
L0029D1:
.ACCU 8
	sep #$20
	dey
	bmi L0029D9.b
	jmp L002944.w
L0029D9:
.ACCU 16
	rep #$20
	jmp L002A24.w
L0029DE:
	cpy #$DC.b
	bne L002A1C.b
	lda $71.b
	and #$00FF.w
	asl A
	tay
	lda [$4D.b],Y
	clc		; Clear carry
L0029EC:
	adc $4D.b
	sta $0FEE.w,X
	sta $65.b
.ACCU 8
	sep #$20
	ldx $61.b
	ldy #$2F.b
	lda ($65.b),Y
	sta $1021.w,X
	stz $1010.w,X
	lda $0994.w
	bne L002A12.b
	ldy #$12.b
	lda ($65.b),Y
	sta $1032.w,X
	iny
	lda ($65.b),Y
	bra L002A19.b
L002A12:
	ldy #$17.b
	lda ($65.b),Y
	sta $1032.w,X
L002A19:
	sta $1043.w,X
L002A1C:
.ACCU 16
	rep #$20
	jmp L002A24.w
L002A21:
	jsr L002662.w
L002A24:
	jsr L00254C.w
	ldx $0F83.w
	cmp #$0000.w
	bne L002A32.b
	jmp L0027FB.w
L002A32:
	sta $0FCC.w,X
	lda $63.b
	sta $0F88.w,X
L002A3A:
	dec $0FCC.w,X
L002A3D:
.ACCU 8
.INDEX 8
	sep #$30
	ldx $61.b
	rts

L002A42:
.ACCU 8
.INDEX 8
	sep #$30
	lda #$00.b
	sta $1065.w,Y
	lda #$FF.b
	sta $106D.w,Y
	jmp L002414.w
.ACCU 16
	rep #$20		; C2 20
	stz $108D.w,X		; 9E 8D 10
.ACCU 8
	sep #$20		; E2 20
	lda $1065.w,Y		; B9 65 10
	bmi  34.b		; 30 22
	beq  31.b		; F0 1F
	lda #$04.b		; A9 04
	sta $1065.w,Y		; 99 65 10
	phy		; 5A
.ACCU 16
	rep #$20		; C2 20
	lda $109D.w,X		; BD 9D 10
	sta $65.b		; 85 65
	ldy #$15.b		; A0 15
	lda ($65.b),Y		; B1 65
	lsr A		; 4A
	and #$7000.w		; 29 00 70
	clc		; 18
	adc #$0FFF.w		; 69 FF 0F
	sta $10AD.w,X		; 9D AD 10
	ply		; 7A
.ACCU 8
	sep #$20		; E2 20
	rts		; 60

	jsr L002A42.w		; 20 42 AA
	rts		; 60

L002A83:
	lda $0F79.w
	clc		; Clear carry
	adc #$10.b
L002A89:
	sta $0F79.w
	cmp $0F7A.w
	bcc L002AB3.b
	jsr L00252D.w
	lda $0F76.w
	bne L002AAA.b
	ldx $0F85.w
	beq L002AB3.b
	dex
L002A9F:
	jsr L0027E4.w
	lda $0F77.w
	beq L002AB3.b
	dex
	bpl L002A9F.b
L002AAA:
	lda $0F79.w
	sec		; Set carry
	sbc $0F7A.w
	bra L002A89.b
L002AB3:
	rts

L002AB4:
	ldx #$00.b
	txy
L002AB7:
	sty $62.b
	stx $0F84.w
	lda $1065.w,Y
	bne L002AC4.b
	jmp L002B9A.w
L002AC4:
	pha
	lda $106D.w,Y
	cmp #$10.b
	bcc L002ACF.b
	jsr L0024E1.w
L002ACF:
.ACCU 16
	rep #$20
	lda $109D.w,X
	sta $65.b
	lda $10BD.w,X
	sta $77.b
	lda $10AD.w,X
	sta $71.b
	lda $10DD.w,X
	inc A
	sta $10DD.w,X
	ldy #$1A.b
	cmp ($65.b),Y
	bcs L002AF8.b
	ldy #$18.b
	cmp ($65.b),Y
	bcc L002AF8.b
	dec $10ED.w,X
	bmi L002AFB.b
L002AF8:
	jmp L002B8E.w
L002AFB:
	ldy #$2A.b
	lda ($65.b),Y
	clc		; Clear carry
	adc $111D.w,X
	sta $111D.w,X
	iny
	iny
	lda ($65.b),Y
	adc $110D.w,X
	sta $110D.w,X
	sta $10ED.w,X
	ldy #$26.b
	lda ($65.b),Y
	clc		; Clear carry
	adc $113D.w,X
	sta $113D.w,X
	iny
	iny
	lda ($65.b),Y
	adc $112D.w,X
	sta $112D.w,X
	ldy #$22.b
	lda ($65.b),Y
	clc		; Clear carry
	adc $115D.w,X
	sta $115D.w,X
	iny
	iny
	lda ($65.b),Y
	adc $114D.w,X
	sta $114D.w,X
	bit $116D.w,X
	bmi L002B63.b
	clc		; Clear carry
	adc $10FD.w,X
	sta $10FD.w,X
	bmi L002B86.b
	cmp $112D.w,X
	bcc L002B86.b
	ldy #$2D.b
	lda ($65.b),Y
	and #$4000.w
	bne L002B5E.b
	stz $10FD.w,X
	bra L002B86.b
L002B5E:
	dec $116D.w,X
	bra L002B86.b
L002B63:
	lda $10FD.w,X
	sec		; Set carry
	sbc $114D.w,X
	sta $10FD.w,X
	bpl L002B86.b
	eor #$FFFF.w
	inc A
	cmp $112D.w,X
	bcc L002B86.b
	ldy #$2D.b
	lda ($65.b),Y
	bmi L002B83.b
	stz $10FD.w,X
	bra L002B86.b
L002B83:
	inc $116D.w,X
L002B86:
	lda $10FD.w,X
	clc		; Clear carry
	adc $77.b
	sta $77.b
L002B8E:
	ply
	cpy #$02.b
	bne L002B9D.b
.ACCU 8
	sep #$20
	ldy $62.b
	jsr L0024C2.w
L002B9A:
	jmp L002BC6.w
L002B9D:
	cpy #$01.b
	beq L002BBF.b
	cpy #$02.b
	beq L002BBF.b
	cpy #$04.b
	bne L002BBF.b
.ACCU 16
	rep #$20
	ldy #$10.b
	lda $10AD.w,X
	sec		; Set carry
	sbc ($65.b),Y
	sta $10AD.w,X
	bcs L002BBF.b
	ldy $62.b
	jsr L002A42.w
	bra L002BC6.b
L002BBF:
.ACCU 8
	sep #$20
	ldy $62.b
	jsr L0024A8.w
L002BC6:
.ACCU 8
	sep #$20
	inx
	inx
	iny
	cpy #$08.b
	bcs L002BD2.b
	jmp L002AB7.w
L002BD2:
	rts

L002BD3:
.ACCU 8
.INDEX 8
	sep #$30
	lda $67.b
	pha
	plb
	lda $0F70.w
	bne L002C1A.b
.ACCU 16
	rep #$20
	lda $0F7D.w
	beq L002BF5.b
	lda $0F7B.w
	sec		; Set carry
	sbc $0F7D.w
	sta $0F7B.w
	bcs L002BF5.b
	jsl L002368.l
L002BF5:
.ACCU 8
	sep #$20
	lda $0F76.w
	beq L002C03.b
	lda $0F7C.w
	pha
	stz $0F7C.w
L002C03:
	jsr L0023D9.w
	lda $0F76.w
	beq L002C0F.b
	pla
	sta $0F7C.w
L002C0F:
	jsr L002AB4.w
	lda $0F77.w
	beq L002C1A.b
	jsr L002A83.w
L002C1A:
	rts

	php		; 08
	ora $00.b,S		; 03 00
	tsb $20.b		; 04 20
	cmp $BDFF.w		; CD FF BD
	inx		; E8
	bcc -60.b		; 90 C4
	sbc ($E8.b),Y		; F1 E8
	bpl -60.b		; 10 C4
	plx		; FA
	inx		; E8
	sta ($C4.b,X)		; 81 C4
	sbc ($E8.b),Y		; F1 E8
	brk $C4.b		; 00 C4
	brk $E8.b		; 00 E8
	php		; 08
	cpy $03.b		; C4 03
	inx		; E8
	ora [$C4.b]		; 07 C4
	tsb $E8.b		; 04 E8
	cop $8D.b		; 02 8D
	eor $F2CB.w,X		; 5D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	brk $8D.b		; 00 8D
	jmp $C4F2CB.l		; 5C CB F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	sbc $CB4C8D.l,X		; FF 8D 4C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	sbc $CB5C8D.l,X		; FF 8D 5C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	brk $8D.b		; 00 8D
	bit $F2CB.w		; 2C CB F2
	cpy $F3.b		; C4 F3
	sta $CB3C.w		; 8D 3C CB
	sbc ($C4.b)		; F2 C4
	sbc ($8D.b,S),Y		; F3 8D
	ora $F2CB.w		; 0D CB F2
	cpy $F3.b		; C4 F3
	sta $CB6D.w		; 8D 6D CB
	sbc ($C4.b)		; F2 C4
	sbc ($8D.b,S),Y		; F3 8D
	adc $F2CB.w,X		; 7D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	rts		; 60

	sta $CB0C.w		; 8D 0C CB
	sbc ($C4.b)		; F2 C4
	sbc ($8D.b,S),Y		; F3 8D
	trb $F2CB.w		; 1C CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	brk $8D.b		; 00 8D
	and $F2CB.w		; 2D CB F2
	cpy $F3.b		; C4 F3
	sta $CB3D.w		; 8D 3D CB
	sbc ($C4.b)		; F2 C4
	sbc ($8D.b,S),Y		; F3 8D
	eor $F2CB.w		; 4D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	jsr $6C8D.w		; 20 8D 6C
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	brk $C4.b		; 00 C4
	sbc $C4.b,X		; F5 C4
	inc $5F.b,X		; F6 5F
	sta $04.b,X		; 95 04
	cpy $F4.b		; C4 F4
	cpx $F4.b		; E4 F4
	bne  -4.b		; D0 FC
	inx		; E8
	brk $C4.b		; 00 C4
	pea $F4E4.w		; F4 E4 F4
	beq  -4.b		; F0 FC
	brk $00.b		; 00 00
	stz $F4.b		; 64 F4
	bne -10.b		; D0 F6
	trb $1F5D.w		; 1C 5D 1F
	ldx $0104.w		; AE 04 01
	cop $04.b		; 02 04
	php		; 08
	bpl  32.b		; 10 20
	rti		; 40

	bra -50.b		; 80 CE
	tsb $E7.b		; 04 E7
	tsb $00.b		; 04 00
	ora $56.b		; 05 56
	ora $6F.b		; 05 6F
	ora $7F.b		; 05 7F
	ora $AD.b		; 05 AD
	ora $EC.b		; 05 EC
	ora $21.b		; 05 21
	asl $56.b		; 06 56
	asl $AB.b		; 06 AB
	asl $C6.b		; 06 C6
	asl $E2.b		; 06 E2
	asl $EF.b		; 06 EF
	asl $08.b		; 06 08
	ora [$E8.b]		; 07 E8
	brk $C4.b		; 00 C4
	brk $E8.b		; 00 E8
	php		; 08
	cpy $03.b		; C4 03
	inx		; E8
	ora [$C4.b]		; 07 C4
	tsb $E8.b		; 04 E8
	sbc $CB5C8D.l,X		; FF 8D 5C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	ora ($5F.b,X)		; 01 5F
	sta $00E404.l		; 8F 04 E4 00
	cpy $F5.b		; C4 F5
	inx		; E8
	cop $C4.b		; 02 C4
	pea $F464.w		; F4 64 F4
	beq  -4.b		; F0 FC
	cpx $03.b		; E4 03
	cpy $F5.b		; C4 F5
	cpx $04.b		; E4 04
	cpy $F6.b		; C4 F6
	inx		; E8
	bra  95.b		; 80 5F
	sta $00E404.l		; 8F 04 E4 00
	pla		; 68
	rts		; 60

	beq  75.b		; F0 4B
	trb $5D1C.w		; 1C 1C 5D
	cpx $03.b		; E4 03
	cmp $00.b,X		; D5 00
	cop $60.b		; 02 60
	sty $F6.b		; 84 F6
	cmp $02.b,X		; D5 02
	cop $E4.b		; 02 E4
	tsb $D5.b		; 04 D5
	ora ($02.b,X)		; 01 02
	sty $F7.b		; 84 F7
	cmp $03.b,X		; D5 03
	cop $CD.b		; 02 CD
	brk $8D.b		; 00 8D
	brk $D8.b		; 00 D8
	sbc $E8.b,X		; F5 E8
	ora $C4.b,S		; 03 C4
	pea $3E3D.w		; F4 3D 3E
	sbc $F0.b,X		; F5 F0
	clc		; 18
	cpx $F4.b		; E4 F4
	bne  -8.b		; D0 F8
	cpx $00.b		; E4 00
	trb $5D1C.w		; 1C 1C 5D
	cpx $03.b		; E4 03
	cmp $04.b,X		; D5 04
	cop $E4.b		; 02 E4
	tsb $D5.b		; 04 D5
	ora $02.b		; 05 02
	plb		; AB
	brk $5F.b		; 00 5F
	sta $04.b,X		; 95 04
	cpx $F6.b		; E4 F6
	cmp [$03.b],Y		; D7 03
	cld		; D8
	sbc $3A.b,X		; F5 3A
	ora $3D.b,S		; 03 3D
	eor $E80529.l,X		; 5F 29 05 E8
	sbc $048F5F.l,X		; FF 5F 8F 04
	cpx $00.b		; E4 00
	beq  -9.b		; F0 F7
	stz $00C4.w		; 9C C4 00
	trb $5D1C.w		; 1C 1C 5D
	sbc $00.b,X		; F5 00
	cop $C4.b		; 02 C4
	ora $F5.b,S		; 03 F5
	ora ($02.b,X)		; 01 02
	cpy $04.b		; C4 04
	inx		; E8
	tsb $5F.b		; 04 5F
	sta $F5F804.l		; 8F 04 F8 F5
	sbc $A8.b,X		; F5 A8
	tsb $8D.b		; 04 8D
	jmp $C4F2CB.l		; 5C CB F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	ora $5F.b		; 05 5F
	sta $F5E404.l		; 8F 04 E4 F5
	trb $1C1C.w		; 1C 1C 1C
	trb $FCFD.w		; 1C FD FC
	jsr ($F6E4.w,X)		; FC E4 F6
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F7.b		; E4 F7
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	brk $8D.b		; 00 8D
	jmp $C4F2CB.l		; 5C CB F2 C4
	sbc ($F8.b,S),Y		; F3 F8
	sbc $F5.b,X		; F5 F5
	tay		; A8
	tsb $8D.b		; 04 8D
	jmp $F2CB.w		; 4C CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	asl $5F.b		; 06 5F
	sta $F5E404.l		; 8F 04 E4 F5
	trb $1C1C.w		; 1C 1C 1C
	trb $E4FD.w		; 1C FD E4
	inc $CB.b,X		; F6 CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F7.b		; E4 F7
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	inx		; E8
	ora [$C4.b]		; 07 C4
	pea $F464.w		; F4 64 F4
	beq  -4.b		; F0 FC
	jsr ($E4FC.w,X)		; FC FC E4
	sbc $CB.b,X		; F5 CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F6.b		; E4 F6
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F7.b		; E4 F7
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	inx		; E8
	brk $CB.b		; 00 CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	sta ($5F.b,X)		; 81 5F
	sta $F5E404.l		; 8F 04 E4 F5
	sta $CB0C.w		; 8D 0C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	trb $F2CB.w		; 1C CB F2
	cpy $F3.b		; C4 F3
	cpx $F7.b		; E4 F7
	sta $CB2D.w		; 8D 2D CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	php		; 08
	cpy $F4.b		; C4 F4
	stz $F4.b		; 64 F4
	beq  -4.b		; F0 FC
	cpx $F5.b		; E4 F5
	sta $CB3D.w		; 8D 3D CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	eor $F2CB.w		; 4D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	.db $82, $5F, $8F		; 82 5F 8F
	tsb $E4.b		; 04 E4
	sbc $8D.b,X		; F5 8D
	bit $F2CB.w		; 2C CB F2
	cpy $F3.b		; C4 F3
	cpx $F6.b		; E4 F6
	sta $CB3C.w		; 8D 3C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	sbc [$8D.b],Y		; F7 8D
	ora $F2CB.w		; 0D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	ora #$C4.b		; 09 C4
	pea $F464.w		; F4 64 F4
	beq  -4.b		; F0 FC
	cpx $F5.b		; E4 F5
	sta $CB6D.w		; 8D 6D CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	adc $F2CB.w,X		; 7D CB F2
	cpy $F3.b		; C4 F3
	inx		; E8
	sta $5F.b,S		; 83 5F
	sta $F5E404.l		; 8F 04 E4 F5
	sta $CB0F.w		; 8D 0F CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	ora $C4F2CB.l,X		; 1F CB F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	sbc [$8D.b],Y		; F7 8D
	and $C4F2CB.l		; 2F CB F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	asl A		; 0A
	cpy $F4.b		; C4 F4
	stz $F4.b		; 64 F4
	beq  -4.b		; F0 FC
	cpx $F5.b		; E4 F5
	sta $CB3F.w		; 8D 3F CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	eor $C4F2CB.l		; 4F CB F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	sbc [$8D.b],Y		; F7 8D
	eor $C4F2CB.l,X		; 5F CB F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	sty $C4.b		; 84 C4
	pea $F464.w		; F4 64 F4
	beq  -4.b		; F0 FC
	cpx $F5.b		; E4 F5
	sta $CB6F.w		; 8D 6F CB
	sbc ($C4.b)		; F2 C4
	sbc ($E4.b,S),Y		; F3 E4
	inc $8D.b,X		; F6 8D
	adc $C4F2CB.l,X		; 7F CB F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	sta $5F.b		; 85 5F
	sta $F5E404.l		; 8F 04 E4 F5
	trb $1C1C.w		; 1C 1C 1C
	trb $FCFD.w		; 1C FD FC
	jsr ($F6E4.w,X)		; FC E4 F6
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F7.b		; E4 F7
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	phd		; 0B
	eor $E4048F.l,X		; 5F 8F 04 E4
	sbc $1C.b,X		; F5 1C
	trb $1C1C.w		; 1C 1C 1C
	dey		; 88
	ora $FD.b		; 05 FD
	inx		; E8
	brk $CB.b		; 00 CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	jsr ($F6E4.w,X)		; FC E4 F6
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	tsb $8F5F.w		; 0C 5F 8F
	tsb $E8.b		; 04 E8
	sbc $CB5C8D.l,X		; FF 8D 5C CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	ora $8F5F.w		; 0D 5F 8F
	tsb $E4.b		; 04 E4
	sbc $1C.b,X		; F5 1C
	trb $1C1C.w		; 1C 1C 1C
	sbc $F6E4.w,X		; FD E4 F6
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($FC.b,S),Y		; F3 FC
	cpx $F7.b		; E4 F7
	wai		; CB
	sbc ($C4.b)		; F2 C4
	sbc ($E8.b,S),Y		; F3 E8
	asl $8F5F.w		; 0E 5F 8F
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora ($00.b,X)		; 01 00
	brk $52.b		; 00 52
	bpl  78.b		; 10 4E
	bpl  10.b		; 10 0A
	php		; 08
	bvc  16.b		; 50 10
	sty $18.b,X		; 94 18
	sty $52.b,X		; 94 52
	php		; 08
	and ($84.b,X)		; 21 84
	bpl -106.b		; 10 96
	clc		; 18
	php		; 08
	php		; 08
	sty $1831.w		; 8C 31 18
	adc $10.b,S		; 63 10
	.db $42, $D8		; 42 D8
	jsr $7D5F.w		; 20 5F 7D
	brk $00.b		; 00 00
	ror $1D.b,X		; 76 1D
	sec		; 38
	and ($9B.b)		; 32 9B
	rol $1050.w,X		; 3E 50 10
	asl A		; 0A
	php		; 08
	sty $52.b,X		; 94 52
	php		; 08
	and ($ED.b,X)		; 21 ED
	brk $84.b		; 00 84
	bpl  95.b		; 10 5F
	adc $318C.w,X		; 7D 8C 31
	clc		; 18
	adc $10.b,S		; 63 10
	.db $42, $5F		; 42 5F
	adc $7D5F.w,X		; 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $5D407D.l,X		; 5F 7D 40 5D
	brk $00.b		; 00 00
	php		; 08
	and ($8C.b,X)		; 21 8C
	and ($10.b),Y		; 31 10
	.db $42, $D6		; 42 D6
	phy		; 5A
	dec $D07B.w,X		; DE 7B D0
	bpl  82.b		; 10 52
	and ($DE.b,X)		; 21 DE
	and ($58.b,X)		; 21 58
	rtl		; 6B

	txs		; 9A
	adc ($DC.b,S),Y		; 73 DC
	tda		; 7B
	sta ($52.b)		; 92 52
	asl $8A42.w		; 0E 42 8A
	and ($5F.b),Y		; 31 5F
	adc $7D5F.w,X		; 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $04EC7D.l,X		; 5F 7D EC 04
	ldy $153E.w,X		; BC 3E 15
	and ($50.b)		; 32 50
	ora ($88.b),Y		; 11 88
	brk $DE.b		; 00 DE
	tda		; 7B
	dec $5A.b,X		; D6 5A
	bpl  66.b		; 10 42
	sty $0831.w		; 8C 31 08
	and ($00.b,X)		; 21 00
	brk $7F.b		; 00 7F
	adc $7D9F.w,X		; 7D 9F 7D
	sta $7D9F7D.l,X		; 9F 7D 9F 7D
	sta $7D9F7D.l,X		; 9F 7D 9F 7D
	sta $7D9F7D.l,X		; 9F 7D 9F 7D
	sta $7D9F7D.l,X		; 9F 7D 9F 7D
	sta $7D9F7D.l,X		; 9F 7D 9F 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	lda $7DBF7D.l,X		; BF 7D BF 7D
	cmp $7DDF7D.l,X		; DF 7D DF 7D
	cmp $7DDF7D.l,X		; DF 7D DF 7D
	cmp $7DDF7D.l,X		; DF 7D DF 7D
	cmp $7DDF7D.l,X		; DF 7D DF 7D
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $037B03.l,X		; FF 03 7B 03
	sbc [$02.b],Y		; F7 02
	sty $02.b,X		; 94 02
	bpl   2.b		; 10 02
	sty $0801.w		; 8C 01 08
	ora ($A5.b,X)		; 01 A5
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	trb $35AD.w		; 1C AD 35
	adc ($4E.b,S),Y		; 73 4E
	lda ($0C.b,S),Y		; B3 0C
	and [$1D.b],Y		; 37 1D
	lda $77BD01.l,X		; BF 01 BD 77
	phy		; 5A
	rtl		; 6B

	clc		; 18
	adc $D6.b,S		; 63 D6
	phy		; 5A
	sty $52.b,X		; 94 52
	eor ($4A.b)		; 52 4A
	bpl  66.b		; 10 42
	dec $8C39.w		; CE 39 8C
	and ($4A.b),Y		; 31 4A
	and #$08.b		; 29 08
	and ($A5.b,X)		; 21 A5
	trb $63.b		; 14 63
	tsb $0421.w		; 0C 21 04
	brk $00.b		; 00 00
	ora $28.b,X		; 15 28
	sbc $00CD7F.l,X		; FF 7F CD 00
	sbc $011100.l		; EF 00 11 01
	and ($01.b,S),Y		; 33 01
	eor $01.b,X		; 55 01
	sei		; 78
	ora ($1B.b,X)		; 01 1B
	asl $4B1F.w,X		; 1E 1F 4B
	brk $00.b		; 00 00
	sbc [$1C.b]		; E7 1C
	lda $7335.w		; AD 35 73
	lsr $0CB3.w		; 4E B3 0C
	sbc [$1D.b],Y		; F7 1D
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $037B03.l,X		; FF 03 7B 03
	sbc [$02.b],Y		; F7 02
	sty $02.b,X		; 94 02
	bpl   2.b		; 10 02
	sty $0801.w		; 8C 01 08
	ora ($A5.b,X)		; 01 A5
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	trb $35AD.w		; 1C AD 35
	adc ($4E.b,S),Y		; 73 4E
	lda ($0C.b,S),Y		; B3 0C
	and [$1D.b],Y		; 37 1D
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $01.b		; 06 01
	brk $10.b		; 00 10
	asl $09.b		; 06 09
	pld		; 2B
	asl A		; 0A
	brk $00.b		; 00 00
	phd		; 0B
	asl A		; 0A
	asl A		; 0A
	tsb $0005.w		; 0C 05 00
	ora $1C05.w		; 0D 05 1C
	ora $110C0C.l		; 0F 0C 0C 11
	phd		; 0B
	phd		; 0B
	ora ($0D.b)		; 12 0D
	ora $1214.w		; 0D 14 12
	ora ($15.b)		; 12 15
	ora $11170F.l		; 0F 0F 17 11
	ora ($18.b),Y		; 11 18
	trb $14.b		; 14 14
	ora $1717.w,Y		; 19 17 17
	tas		; 1B
	cop $02.b		; 02 02
	ora $1818.w,X		; 1D 18 18
	ora $221515.l,X		; 1F 15 15 22
	tsb $40.b		; 04 40
	and $02.b,S		; 23 02
	asl $24.b		; 06 24
	brk $03.b		; 00 03
	and $0F.b		; 25 0F
	tsb $1926.w		; 0C 26 19
	ora $0427.w,Y		; 19 27 04
	brk $29.b		; 00 29
	and $23.b,S		; 23 23
	and $2424.w		; 2D 24 24
	rol $1B1B.w		; 2E 1B 1B
	and ($1D.b),Y		; 31 1D
	ora $2233.w,X		; 1D 33 22
	and [$35.b]		; 27 35
	brk $33.b		; 00 33
	rol $29.b,X		; 36 29
	and #$37.b		; 29 37
	rol $26.b		; 26 26
	sec		; 38
	and $392D.w		; 2D 2D 39
	ora ($1F.b,X)		; 01 1F
	dec A		; 3A
	rol $3C2E.w		; 2E 2E 3C
	and ($31.b),Y		; 31 31
	and $355F.w,X		; 3D 5F 35
	rol $00D4.w,X		; 3E D4 00
	and $430F15.l,X		; 3F 15 0F 43
	ora ($72.b,X)		; 01 72
	mvp $3D,$00		; 44 00 3D
	eor $15.b		; 45 15
	and $46.b		; 25 46
	rol $36.b,X		; 36 36
	eor [$37.b]		; 47 37
	and [$48.b],Y		; 37 48
	sec		; 38
	sec		; 38
	lsr A		; 4A
	eor $43.b,S		; 43 43
	jsr $4000.w		; 20 00 40
	brk $08.b		; 00 08
	ora $47.b,S		; 03 47
	eor [$47.b]		; 47 47
	and [$01.b],Y		; 37 01
	brk $02.b		; 00 02
	pha		; 48
	pha		; 48
	pha		; 48
	sec		; 38
	brk $02.b		; 00 02
	rti		; 40

	ora ($40.b,X)		; 01 40
	and [$25.b]		; 27 25
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $09.b		; 00 09
	ora #$00.b		; 09 00
	ora #$0A.b		; 09 0A
	brk $09.b		; 00 09
	phd		; 0B
	brk $09.b		; 00 09
	tsb $0900.w		; 0C 00 09
	ora $0E00.w		; 0D 00 0E
	brk $09.b		; 00 09
	ora $100C00.l		; 0F 00 0C 10
	brk $09.b		; 00 09
	ora ($00.b),Y		; 11 00
	ora #$12.b		; 09 12
	brk $13.b		; 00 13
	brk $09.b		; 00 09
	trb $00.b		; 14 00
	ora #$15.b		; 09 15
	brk $16.b		; 00 16
	brk $09.b		; 00 09
	ora [$00.b],Y		; 17 00
	ora #$18.b		; 09 18
	brk $09.b		; 00 09
	ora $1A00.w,Y		; 19 00 1A
	brk $09.b		; 00 09
	tas		; 1B
	brk $1C.b		; 00 1C
	brk $09.b		; 00 09
	ora $1E00.w,X		; 1D 00 1E
	brk $09.b		; 00 09
	ora $202535.l,X		; 1F 35 25 20
	brk $21.b		; 00 21
	brk $09.b		; 00 09
	jsl $230900.l		; 22 00 09 23
	brk $09.b		; 00 09
	bit $00.b		; 24 00
	and ($00.b,X)		; 21 00
	ora #$25.b		; 09 25
	brk $21.b		; 00 21
	rti		; 40

	ora #$26.b		; 09 26
	brk $09.b		; 00 09
	and [$00.b]		; 27 00
	ora $330C1F.l,X		; 1F 1F 0C 33
	plp		; 28
	brk $0F.b		; 00 0F
	ora #$29.b		; 09 29
	brk $2A.b		; 00 2A
	brk $2B.b		; 00 2B
	brk $2A.b		; 00 2A
	brk $2C.b		; 00 2C
	brk $2A.b		; 00 2A
	rti		; 40

	pld		; 2B
	brk $2B.b		; 00 2B
	brk $09.b		; 00 09
	and $0900.w		; 2D 00 09
	rol $2F00.w		; 2E 00 2F
	brk $30.b		; 00 30
	brk $09.b		; 00 09
	and ($00.b),Y		; 31 00
	and ($00.b)		; 32 00
	ora $220C15.l,X		; 1F 15 0C 22
	ora #$33.b		; 09 33
	brk $34.b		; 00 34
	brk $09.b		; 00 09
	and $00.b,X		; 35 00
	ora #$36.b		; 09 36
	brk $09.b		; 00 09
	and [$00.b],Y		; 37 00
	ora #$38.b		; 09 38
	brk $09.b		; 00 09
	and $0900.w,Y		; 39 00 09
	dec A		; 3A
	brk $3B.b		; 00 3B
	brk $09.b		; 00 09
	bit $0900.w,X		; 3C 00 09
	and $0900.w,X		; 3D 00 09
	rol $0900.w,X		; 3E 00 09
	and $004000.l,X		; 3F 00 40 00
	eor ($00.b,X)		; 41 00
	.db $42, $00		; 42 00
	ora #$43.b		; 09 43
	brk $09.b		; 00 09
	mvp $09,$00		; 44 00 09
	eor $00.b		; 45 00
	and $09.b		; 25 09
	lsr $00.b		; 46 00
	ora #$47.b		; 09 47
	brk $09.b		; 00 09
	pha		; 48
	brk $49.b		; 00 49
	brk $49.b		; 00 49
	brk $49.b		; 00 49
	brk $49.b		; 00 49
	brk $49.b		; 00 49
	brk $09.b		; 00 09
	lsr A		; 4A
	and $3F.b,X		; 35 3F
	phk		; 4B
	brk $4C.b		; 00 4C
	brk $4D.b		; 00 4D
	brk $4E.b		; 00 4E
	brk $4F.b		; 00 4F
	brk $50.b		; 00 50
	brk $51.b		; 00 51
	brk $52.b		; 00 52
	brk $53.b		; 00 53
	brk $54.b		; 00 54
	brk $55.b		; 00 55
	brk $56.b		; 00 56
	brk $25.b		; 00 25
	eor [$00.b],Y		; 57 00
	cli		; 58
	brk $59.b		; 00 59
	brk $5A.b		; 00 5A
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	brk $5D.b		; 00 5D
	brk $5E.b		; 00 5E
	mvp $60,$3F		; 44 3F 60
	brk $61.b		; 00 61
	brk $62.b		; 00 62
	brk $63.b		; 00 63
	brk $64.b		; 00 64
	brk $65.b		; 00 65
	brk $66.b		; 00 66
	brk $67.b		; 00 67
	brk $68.b		; 00 68
	brk $69.b		; 00 69
	brk $6A.b		; 00 6A
	brk $6B.b		; 00 6B
	brk $6C.b		; 00 6C
	brk $6D.b		; 00 6D
	brk $6E.b		; 00 6E
	brk $6F.b		; 00 6F
	brk $70.b		; 00 70
	brk $71.b		; 00 71
	brk $72.b		; 00 72
	brk $73.b		; 00 73
	brk $74.b		; 00 74
	brk $75.b		; 00 75
	brk $76.b		; 00 76
	mvp $25,$1F		; 44 1F 25
	adc [$00.b],Y		; 77 00
	sei		; 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	brk $6F.b		; 00 6F
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	mvp $88,$25		; 44 25 88
	brk $89.b		; 00 89
	brk $8A.b		; 00 8A
	brk $8B.b		; 00 8B
	brk $8C.b		; 00 8C
	brk $8D.b		; 00 8D
	brk $8E.b		; 00 8E
	brk $8F.b		; 00 8F
	brk $90.b		; 00 90
	brk $91.b		; 00 91
	brk $92.b		; 00 92
	brk $93.b		; 00 93
	brk $94.b		; 00 94
	brk $95.b		; 00 95
	brk $96.b		; 00 96
	brk $97.b		; 00 97
	brk $98.b		; 00 98
	brk $28.b		; 00 28
	brk $6F.b		; 00 6F
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	mvp $0C,$15		; 44 15 0C
	ldy #$00.b		; A0 00
	ora $A200A1.l		; 0F A1 00 A2
	brk $0C.b		; 00 0C
	lda $00.b,S		; A3 00
	ldy $00.b		; A4 00
	lda $00.b		; A5 00
	ldx $00.b		; A6 00
	lda [$00.b]		; A7 00
	tay		; A8
	brk $A9.b		; 00 A9
	brk $0F.b		; 00 0F
	tax		; AA
	brk $6F.b		; 00 6F
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B0.b		; 00 B0
	brk $B1.b		; 00 B1
	mvp $25,$1F		; 44 1F 25
	lda ($00.b)		; B2 00
	lda ($00.b,S),Y		; B3 00
	ldy $00.b,X		; B4 00
	lda $00.b,X		; B5 00
	ldx $00.b,Y		; B6 00
	lda [$00.b],Y		; B7 00
	tax		; AA
	brk $25.b		; 00 25
	adc $00B800.l		; 6F 00 B8 00
	lda $BA00.w,Y		; B9 00 BA
	brk $BB.b		; 00 BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	brk $BE.b		; 00 BE
	mvp $25,$1F		; 44 1F 25
	lda $00C000.l,X		; BF 00 C0 00
	ora $C200C1.l,X		; 1F C1 00 C2
	brk $C3.b		; 00 C3
	brk $C4.b		; 00 C4
	brk $C5.b		; 00 C5
	brk $74.b		; 00 74
	brk $75.b		; 00 75
	brk $76.b		; 00 76
	mvp $C6,$25		; 44 25 C6
	brk $C7.b		; 00 C7
	brk $C8.b		; 00 C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $15.b		; 00 15
	tsb $00D3.w		; 0C D3 00
	rol $00D5.w,X		; 3E D5 00
	dec $00.b,X		; D6 00
	cmp [$00.b],Y		; D7 00
	sta $00.b		; 85 00
	stx $00.b		; 86 00
	sta [$44.b]		; 87 44
	and $D8.b		; 25 D8
	brk $D9.b		; 00 D9
	brk $DA.b		; 00 DA
	brk $DB.b		; 00 DB
	brk $32.b		; 00 32
	brk $DC.b		; 00 DC
	brk $DD.b		; 00 DD
	brk $DE.b		; 00 DE
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $E2.b		; 00 E2
	brk $3F.b		; 00 3F
	cmp ($00.b,S),Y		; D3 00
	rol $00E3.w,X		; 3E E3 00
	cpx $00.b		; E4 00
	sbc $00.b		; E5 00
	sta $9E00.w,X		; 9D 00 9E
	brk $9F.b		; 00 9F
	mvp $E6,$25		; 44 25 E6
	brk $E7.b		; 00 E7
	brk $E8.b		; 00 E8
	brk $E9.b		; 00 E9
	brk $EA.b		; 00 EA
	brk $EB.b		; 00 EB
	brk $EC.b		; 00 EC
	brk $ED.b		; 00 ED
	brk $EE.b		; 00 EE
	brk $EF.b		; 00 EF
	brk $F0.b		; 00 F0
	brk $F1.b		; 00 F1
	brk $3F.b		; 00 3F
	cmp ($00.b,S),Y		; D3 00
	rol $00F2.w,X		; 3E F2 00
	sbc ($00.b,S),Y		; F3 00
	pea $F500.w		; F4 00 F5
	brk $F6.b		; 00 F6
	brk $B1.b		; 00 B1
	mvp $88,$0F		; 44 0F 88
	brk $F7.b		; 00 F7
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FA.b		; 00 FA
	brk $FB.b		; 00 FB
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $CD.b		; 00 CD
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	asl A		; 0A
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora ($04.b,X)		; 01 04
	ora ($05.b,X)		; 01 05
	ora ($06.b,X)		; 01 06
	ora ($07.b,X)		; 01 07
	ora ($08.b,X)		; 01 08
	ora ($3E.b,X)		; 01 3E
	ora #$09.b		; 09 09
	ora ($09.b,X)		; 01 09
	asl A		; 0A
	ora ($09.b,X)		; 01 09
	phd		; 0B
	ora ($09.b,X)		; 01 09
	tsb $0901.w		; 0C 01 09
	ora $BE01.w		; 0D 01 BE
	mvp $0E,$0F		; 44 0F 0E
	ora ($09.b,X)		; 01 09
	ora $00DB01.l		; 0F 01 DB 00
	bpl   1.b		; 10 01
	ora #$11.b		; 09 11
	ora ($09.b,X)		; 01 09
	ora ($01.b)		; 12 01
	ora ($01.b,S),Y		; 13 01
	ora #$14.b		; 09 14
	ora ($09.b,X)		; 01 09
	ora $01.b,X		; 15 01
	asl $01.b,X		; 16 01
	ora #$17.b		; 09 17
	ora ($09.b,X)		; 01 09
	clc		; 18
	ora ($09.b,X)		; 01 09
	ora $1601.w,Y		; 19 01 16
	ora ($1A.b,X)		; 01 1A
	ora ($09.b,X)		; 01 09
	tas		; 1B
	ora ($1C.b,X)		; 01 1C
	ora ($09.b,X)		; 01 09
	ora $1E01.w,X		; 1D 01 1E
	ora ($09.b,X)		; 01 09
	ora $203E01.l,X		; 1F 01 3E 20
	ora ($21.b,X)		; 01 21
	ora ($09.b,X)		; 01 09
	jsl $230901.l		; 22 01 09 23
	ora ($09.b,X)		; 01 09
	bit $01.b		; 24 01
	ror $44.b,X		; 76 44
	and $09.b		; 25 09
	and $01.b		; 25 01
	sbc #$00.b		; E9 00
	ora #$26.b		; 09 26
	ora ($09.b,X)		; 01 09
	and [$01.b]		; 27 01
	plp		; 28
	ora ($09.b,X)		; 01 09
	and #$01.b		; 29 01
	rol A		; 2A
	ora ($2B.b,X)		; 01 2B
	ora ($2C.b,X)		; 01 2C
	ora ($09.b,X)		; 01 09
	and $0901.w		; 2D 01 09
	rol $2F01.w		; 2E 01 2F
	ora ($2C.b,X)		; 01 2C
	ora ($30.b,X)		; 01 30
	ora ($09.b,X)		; 01 09
	and ($01.b),Y		; 31 01
	and ($01.b)		; 32 01
	ora #$33.b		; 09 33
	ora ($34.b,X)		; 01 34
	ora ($09.b,X)		; 01 09
	and $01.b,X		; 35 01
	rol $093E.w,X		; 3E 3E 09
	rol $01.b,X		; 36 01
	ora #$37.b		; 09 37
	ora ($09.b,X)		; 01 09
	sec		; 38
	ora ($09.b,X)		; 01 09
	and $0901.w,Y		; 39 01 09
	dec A		; 3A
	ora ($3D.b,X)		; 01 3D
	ora $09013B.l		; 0F 3B 01 09
	bit $0901.w,X		; 3C 01 09
	and $0901.w,X		; 3D 01 09
	rol $0701.w,X		; 3E 01 07
	ora ($09.b,X)		; 01 09
	and $014001.l,X		; 3F 01 40 01
	eor ($01.b,X)		; 41 01
	.db $42, $01		; 42 01
	ora #$43.b		; 09 43
	ora ($09.b,X)		; 01 09
	mvp $09,$01		; 44 01 09
	eor $01.b		; 45 01
	ora #$46.b		; 09 46
	ora ($09.b,X)		; 01 09
	eor [$01.b]		; 47 01
	ora [$01.b]		; 07 01
	ora #$48.b		; 09 48
	ora ($49.b,X)		; 01 49
	ora ($09.b,X)		; 01 09
	lsr A		; 4A
	ora ($0C.b,X)		; 01 0C
	cmp ($00.b,S),Y		; D3 00
	rol $4B3E.w,X		; 3E 3E 4B
	ora ($4C.b,X)		; 01 4C
	ora ($4D.b,X)		; 01 4D
	ora ($4E.b,X)		; 01 4E
	ora ($4F.b,X)		; 01 4F
	ora ($3D.b,X)		; 01 3D
	eor $50.b		; 45 50
	ora ($51.b,X)		; 01 51
	ora ($2F.b,X)		; 01 2F
	brk $52.b		; 00 52
	ora ($53.b,X)		; 01 53
	ora ($54.b,X)		; 01 54
	ora ($55.b,X)		; 01 55
	ora ($56.b,X)		; 01 56
	ora ($57.b,X)		; 01 57
	ora ($0E.b,X)		; 01 0E
	ora ($58.b,X)		; 01 58
	ora ($59.b,X)		; 01 59
	ora ($5A.b,X)		; 01 5A
	ora ($0C.b,X)		; 01 0C
	tad		; 5B
	ora ($5C.b,X)		; 01 5C
	ora ($5C.b,X)		; 01 5C
	ora ($5D.b,X)		; 01 5D
	ora ($5E.b,X)		; 01 5E
	ora ($5F.b,X)		; 01 5F
	ora ($60.b,X)		; 01 60
	ora ($61.b,X)		; 01 61
	ora ($62.b,X)		; 01 62
	ora ($33.b,X)		; 01 33
	eor $63.b		; 45 63
	ora ($64.b,X)		; 01 64
	ora ($65.b,X)		; 01 65
	ora ($66.b,X)		; 01 66
	ora ($67.b,X)		; 01 67
	ora ($68.b,X)		; 01 68
	ora ($69.b,X)		; 01 69
	ora ($6A.b,X)		; 01 6A
	ora ($6B.b,X)		; 01 6B
	ora ($6C.b,X)		; 01 6C
	ora ($6D.b,X)		; 01 6D
	ora ($6E.b,X)		; 01 6E
	ora ($6F.b,X)		; 01 6F
	ora ($70.b,X)		; 01 70
	ora ($71.b,X)		; 01 71
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	eor $01.b,S		; 43 01
	adc ($01.b,S),Y		; 73 01
	and ($1F.b,S),Y		; 33 1F
	and $74.b		; 25 74
	ora ($75.b,X)		; 01 75
	ora ($76.b,X)		; 01 76
	ora ($77.b,X)		; 01 77
	ora ($78.b,X)		; 01 78
	ora ($79.b,X)		; 01 79
	ora ($7A.b,X)		; 01 7A
	ora ($7B.b,X)		; 01 7B
	ora ($7C.b,X)		; 01 7C
	ora ($7D.b,X)		; 01 7D
	ora ($7E.b,X)		; 01 7E
	and $1F33.w,Y		; 39 33 1F
	and $7F.b		; 25 7F
	ora ($80.b,X)		; 01 80
	ora ($81.b,X)		; 01 81
	ora ($82.b,X)		; 01 82
	ora ($83.b,X)		; 01 83
	ora ($84.b,X)		; 01 84
	ora ($85.b,X)		; 01 85
	ora ($86.b,X)		; 01 86
	ora ($87.b,X)		; 01 87
	ora ($88.b,X)		; 01 88
	ora ($89.b,X)		; 01 89
	and $2533.w,Y		; 39 33 25
	txa		; 8A
	ora ($8B.b,X)		; 01 8B
	ora ($8C.b,X)		; 01 8C
	ora ($8D.b,X)		; 01 8D
	ora ($8E.b,X)		; 01 8E
	ora ($8F.b,X)		; 01 8F
	ora ($90.b,X)		; 01 90
	ora ($AA.b,X)		; 01 AA
	bra  31.b		; 80 1F
	tsb $0191.w		; 0C 91 01
	sta ($41.b),Y		; 91 41
	ora $922533.l,X		; 1F 33 25 92
	ora ($93.b,X)		; 01 93
	ora ($94.b,X)		; 01 94
	ora ($95.b,X)		; 01 95
	ora ($96.b,X)		; 01 96
	ora ($97.b,X)		; 01 97
	ora ($98.b,X)		; 01 98
	ora ($99.b,X)		; 01 99
	ora ($9A.b,X)		; 01 9A
	ora ($9B.b,X)		; 01 9B
	ora ($9C.b,X)		; 01 9C
	ora ($9D.b,X)		; 01 9D
	and $3345.w,Y		; 39 45 33
	and $9F019E.l,X		; 3F 9E 01 9F
	ora ($A0.b,X)		; 01 A0
	ora ($A1.b,X)		; 01 A1
	ora ($A2.b,X)		; 01 A2
	ora ($A3.b,X)		; 01 A3
	ora ($A4.b,X)		; 01 A4
	ora ($9F.b,X)		; 01 9F
	ora ($A5.b,X)		; 01 A5
	and $3345.w,Y		; 39 45 33
	ora $A6.b,X		; 15 A6
	ora ($A7.b,X)		; 01 A7
	ora ($A8.b,X)		; 01 A8
	ora ($A9.b,X)		; 01 A9
	ora ($1E.b,X)		; 01 1E
	ora ($AA.b,X)		; 01 AA
	ora ($DE.b,X)		; 01 DE
	brk $AB.b		; 00 AB
	ora ($AC.b,X)		; 01 AC
	ora ($AD.b,X)		; 01 AD
	ora ($30.b,X)		; 01 30
	brk $1F.b		; 00 1F
	eor $33.b		; 45 33
	ora $AE.b,X		; 15 AE
	ora ($AF.b,X)		; 01 AF
	ora ($B0.b,X)		; 01 B0
	ora ($B1.b,X)		; 01 B1
	ora ($34.b,X)		; 01 34
	ora ($B2.b,X)		; 01 B2
	ora ($ED.b,X)		; 01 ED
	brk $B3.b		; 00 B3
	ora ($B4.b,X)		; 01 B4
	ora ($B5.b,X)		; 01 B5
	ora ($B6.b,X)		; 01 B6
	and $3345.w,Y		; 39 45 33
	ora $B7.b,X		; 15 B7
	ora ($B8.b,X)		; 01 B8
	ora ($B9.b,X)		; 01 B9
	ora ($BA.b,X)		; 01 BA
	ora ($07.b,X)		; 01 07
	ora ($BB.b,X)		; 01 BB
	ora ($42.b,X)		; 01 42
	ora ($BC.b,X)		; 01 BC
	ora ($BD.b,X)		; 01 BD
	ora ($BE.b,X)		; 01 BE
	ora ($BF.b,X)		; 01 BF
	and $3345.w,Y		; 39 45 33
	and $1A.b		; 25 1A
	ora ($C0.b,X)		; 01 C0
	ora ($C1.b,X)		; 01 C1
	ora ($C2.b,X)		; 01 C2
	ora ($C3.b,X)		; 01 C3
	ora ($C4.b,X)		; 01 C4
	ora ($C5.b,X)		; 01 C5
	ora ($DE.b,X)		; 01 DE
	brk $C6.b		; 00 C6
	ora ($D8.b,X)		; 01 D8
	rti		; 40

	inc A		; 1A
	ora ($C7.b,X)		; 01 C7
	ora ($C8.b,X)		; 01 C8
	ora ($C9.b,X)		; 01 C9
	ora ($CA.b,X)		; 01 CA
	ora ($CB.b,X)		; 01 CB
	ora ($CC.b,X)		; 01 CC
	ora ($CD.b,X)		; 01 CD
	ora ($13.b,X)		; 01 13
	and $2533.w,Y		; 39 33 25
	dec $CF01.w		; CE 01 CF
	ora ($D0.b,X)		; 01 D0
	ora ($D1.b,X)		; 01 D1
	ora ($D2.b,X)		; 01 D2
	ora ($34.b,X)		; 01 34
	eor ($D3.b,X)		; 41 D3
	ora ($D4.b,X)		; 01 D4
	ora ($63.b,X)		; 01 63
	ora ($D5.b,X)		; 01 D5
	ora ($D6.b,X)		; 01 D6
	ora ($D7.b,X)		; 01 D7
	ora ($D8.b,X)		; 01 D8
	ora ($A9.b,X)		; 01 A9
	bra -39.b		; 80 D9
	ora ($DA.b,X)		; 01 DA
	ora ($DB.b,X)		; 01 DB
	ora ($DC.b,X)		; 01 DC
	ora ($DD.b,X)		; 01 DD
	and $1533.w,Y		; 39 33 15
	tsa		; 3B
	ora ($DE.b,X)		; 01 DE
	ora ($DF.b,X)		; 01 DF
	ora ($E0.b,X)		; 01 E0
	ora ($E1.b,X)		; 01 E1
	ora ($E2.b,X)		; 01 E2
	ora ($E3.b,X)		; 01 E3
	ora ($CE.b,X)		; 01 CE
	brk $E4.b		; 00 E4
	ora ($E5.b,X)		; 01 E5
	ora ($07.b,X)		; 01 07
	ora ($BB.b,X)		; 01 BB
	ora ($E6.b,X)		; 01 E6
	and $0C15.w,Y		; 39 15 0C
	and ($3F.b,S),Y		; 33 3F
	sbc [$01.b]		; E7 01
	inx		; E8
	ora ($E9.b,X)		; 01 E9
	ora ($EA.b,X)		; 01 EA
	ora ($E1.b,X)		; 01 E1
	brk $EB.b		; 00 EB
	ora ($EC.b,X)		; 01 EC
	ora ($0F.b,X)		; 01 0F
	ldx #$00.b		; A2 00
	ora $3F333F.l,X		; 1F 3F 33 3F
	sbc $EE01.w		; ED 01 EE
	ora ($EF.b,X)		; 01 EF
	ora ($F0.b,X)		; 01 F0
	ora ($F1.b,X)		; 01 F1
	ora ($F2.b,X)		; 01 F2
	ora ($F3.b,X)		; 01 F3
	and $0C1F.w,Y		; 39 1F 0C
	and ($0F.b,S),Y		; 33 0F
	bpl   0.b		; 10 00
	pea $F501.w		; F4 01 F5
	ora ($F6.b,X)		; 01 F6
	ora ($F7.b,X)		; 01 F7
	ora ($F8.b,X)		; 01 F8
	ora ($F9.b,X)		; 01 F9
	ora ($FA.b,X)		; 01 FA
	ora ($FB.b,X)		; 01 FB
	ora ($FC.b,X)		; 01 FC
	ora ($FD.b,X)		; 01 FD
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	and $2245.w,Y		; 39 45 22
	brk $02.b		; 00 02
	ora ($3A.b,X)		; 01 3A
	dec A		; 3A
	dec A		; 3A
	tas		; 1B
	cop $03.b		; 02 03
	dec A		; 3A
	dec A		; 3A
	dec A		; 3A
	rol $0102.w		; 2E 02 01
	.db $42, $04		; 42 04
	cop $05.b		; 02 05
	lsr $46.b		; 46 46
	lsr $36.b		; 46 36
	and #$02.b		; 29 02
	ora [$02.b]		; 07 02
	bit $3C3C.w,X		; 3C 3C 3C
	bit $3C3C.w,X		; 3C 3C 3C
	ora $1418.w,X		; 1D 18 14
	ora ($0D.b)		; 12 0D
	ora $09.b		; 05 09
	trb NMITIMEN.w		; 1C 00 42
	xce		; FB
	brk $10.b		; 00 10
	asl $02.b		; 06 02
	brk $10.b		; 00 10
	asl $09.b		; 06 09
	and $000A.w		; 2D 0A 00
	brk $0B.b		; 00 0B
	asl A		; 0A
	asl A		; 0A
	tsb $0005.w		; 0C 05 00
	ora $1C05.w		; 0D 05 1C
	asl $0C0C.w		; 0E 0C 0C
	ora $110B0B.l		; 0F 0B 0B 11
	ora $120D.w		; 0D 0D 12
	ora ($11.b),Y		; 11 11
	trb $0E.b		; 14 0E
	asl $0F15.w		; 0E 15 0F
	ora $121217.l		; 0F 17 12 12
	ora $1515.w,Y		; 19 15 15
	inc A		; 1A
	cop $02.b		; 02 02
	tas		; 1B
	ora [$17.b],Y		; 17 17
	ora $1414.w,X		; 1D 14 14
	asl $4004.w,X		; 1E 04 40
	and ($02.b,X)		; 21 02
	asl $22.b		; 06 22
	brk $03.b		; 00 03
	and $0E.b,S		; 23 0E
	tsb $1924.w		; 0C 24 19
	ora $0425.w,Y		; 19 25 04
	brk $26.b		; 00 26
	and ($21.b,X)		; 21 21
	and [$22.b]		; 27 22
	jsl $1A1A28.l		; 22 28 1A 1A
	and #$1B.b		; 29 1B
	tas		; 1B
	pld		; 2B
	asl $2E25.w,X		; 1E 25 2E
	brk $2B.b		; 00 2B
	and $302626.l		; 2F 26 26 30
	bit $24.b		; 24 24
	and ($27.b),Y		; 31 27
	and [$33.b]		; 27 33
	ora ($1D.b,X)		; 01 1D
	rol $28.b,X		; 36 28
	plp		; 28
	and [$29.b],Y		; 37 29
	and #$38.b		; 29 38
	trb $0E.b		; 14 0E
	and $2E61.w,Y		; 39 61 2E
	dec A		; 3A
	brk $D6.b		; 00 D6
	bit $2314.w,X		; 3C 14 23
	and $7101.w,X		; 3D 01 71
	rol $3900.w,X		; 3E 00 39
	and $433AD5.l,X		; 3F D5 3A 43
	and $30442F.l		; 2F 2F 44 30
	bmi  69.b		; 30 45
	and ($31.b),Y		; 31 31
	lsr $3D.b		; 46 3D
	and $3F47.w,X		; 3D 47 3F
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $08.b		; 00 08
	ora $44.b,S		; 03 44
	mvp $30,$44		; 44 44 30
	ora ($00.b,X)		; 01 00
	cop $45.b		; 02 45
	eor $45.b		; 45 45
	and ($00.b),Y		; 31 00
	cop $40.b		; 02 40
	ora ($40.b,X)		; 01 40
	and $23.b		; 25 23
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $09.b		; 00 09
	ora #$00.b		; 09 00
	ora #$0A.b		; 09 0A
	brk $09.b		; 00 09
	phd		; 0B
	brk $09.b		; 00 09
	tsb $0900.w		; 0C 00 09
	ora $0900.w		; 0D 00 09
	asl $0900.w		; 0E 00 09
	ora $100C00.l		; 0F 00 0C 10
	brk $09.b		; 00 09
	ora ($00.b),Y		; 11 00
	ora #$12.b		; 09 12
	brk $13.b		; 00 13
	brk $09.b		; 00 09
	trb $00.b		; 14 00
	ora #$15.b		; 09 15
	brk $16.b		; 00 16
	brk $09.b		; 00 09
	ora [$00.b],Y		; 17 00
	clc		; 18
	brk $09.b		; 00 09
	ora $0900.w,Y		; 19 00 09
	inc A		; 1A
	brk $09.b		; 00 09
	tas		; 1B
	brk $1C.b		; 00 1C
	brk $09.b		; 00 09
	ora $0900.w,X		; 1D 00 09
	asl $1F00.w,X		; 1E 00 1F
	rol $2023.w		; 2E 23 20
	brk $09.b		; 00 09
	and ($00.b,X)		; 21 00
	ora #$22.b		; 09 22
	brk $09.b		; 00 09
	and $00.b,S		; 23 00
	ora #$24.b		; 09 24
	brk $09.b		; 00 09
	and $00.b		; 25 00
	ora #$26.b		; 09 26
	brk $09.b		; 00 09
	and [$00.b]		; 27 00
	ora #$28.b		; 09 28
	brk $09.b		; 00 09
	and #$00.b		; 29 00
	ora $0C1D.w,X		; 1D 1D 0C
	pld		; 2B
	rol A		; 2A
	brk $0E.b		; 00 0E
	ora #$2B.b		; 09 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2C.b		; 00 2C
	brk $09.b		; 00 09
	rol $2C00.w		; 2E 00 2C
	rti		; 40

	and $2D00.w		; 2D 00 2D
	brk $09.b		; 00 09
	and $300900.l		; 2F 00 09 30
	brk $09.b		; 00 09
	and ($00.b),Y		; 31 00
	and ($00.b)		; 32 00
	ora #$33.b		; 09 33
	brk $34.b		; 00 34
	brk $1D.b		; 00 1D
	trb $0C.b		; 14 0C
	asl $0035.w,X		; 1E 35 00
	ora #$36.b		; 09 36
	brk $09.b		; 00 09
	and [$00.b],Y		; 37 00
	ora #$38.b		; 09 38
	brk $09.b		; 00 09
	and $0900.w,Y		; 39 00 09
	dec A		; 3A
	brk $3B.b		; 00 3B
	brk $09.b		; 00 09
	bit $0900.w,X		; 3C 00 09
	and $0900.w,X		; 3D 00 09
	rol $0900.w,X		; 3E 00 09
	and $004000.l,X		; 3F 00 40 00
	eor ($00.b,X)		; 41 00
	.db $42, $00		; 42 00
	ora #$43.b		; 09 43
	brk $09.b		; 00 09
	mvp $09,$00		; 44 00 09
	eor $00.b		; 45 00
	ora #$46.b		; 09 46
	brk $09.b		; 00 09
	eor [$00.b]		; 47 00
	and $48.b,S		; 23 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4C.b		; 00 4C
	rol $4D38.w		; 2E 38 4D
	brk $4E.b		; 00 4E
	brk $4F.b		; 00 4F
	brk $50.b		; 00 50
	brk $51.b		; 00 51
	brk $52.b		; 00 52
	brk $53.b		; 00 53
	brk $54.b		; 00 54
	brk $55.b		; 00 55
	brk $56.b		; 00 56
	brk $57.b		; 00 57
	brk $58.b		; 00 58
	brk $23.b		; 00 23
	eor $5A00.w,Y		; 59 00 5A
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	brk $5D.b		; 00 5D
	brk $5E.b		; 00 5E
	brk $5F.b		; 00 5F
	brk $60.b		; 00 60
	rol $6238.w,X		; 3E 38 62
	brk $63.b		; 00 63
	brk $64.b		; 00 64
	brk $65.b		; 00 65
	brk $66.b		; 00 66
	brk $67.b		; 00 67
	brk $68.b		; 00 68
	brk $69.b		; 00 69
	brk $6A.b		; 00 6A
	brk $6B.b		; 00 6B
	brk $6C.b		; 00 6C
	brk $6D.b		; 00 6D
	brk $6E.b		; 00 6E
	brk $0E.b		; 00 0E
	adc $007000.l		; 6F 00 70 00
	adc ($00.b),Y		; 71 00
	adc ($00.b)		; 72 00
	adc ($00.b,S),Y		; 73 00
	stz $00.b,X		; 74 00
	adc $00.b,X		; 75 00
	ror $3E.b,X		; 76 3E
	ora $7723.w,X		; 1D 23 77
	brk $78.b		; 00 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $0C.b		; 00 0C
	adc $008000.l		; 6F 00 80 00
	sta ($00.b,X)		; 81 00
	.db $82, $00, $83		; 82 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	rol $8723.w,X		; 3E 23 87
	brk $88.b		; 00 88
	brk $89.b		; 00 89
	brk $8A.b		; 00 8A
	brk $8B.b		; 00 8B
	brk $8C.b		; 00 8C
	brk $8D.b		; 00 8D
	brk $8E.b		; 00 8E
	brk $8F.b		; 00 8F
	brk $90.b		; 00 90
	brk $91.b		; 00 91
	brk $92.b		; 00 92
	brk $93.b		; 00 93
	brk $94.b		; 00 94
	brk $95.b		; 00 95
	brk $96.b		; 00 96
	brk $97.b		; 00 97
	brk $2A.b		; 00 2A
	brk $6F.b		; 00 6F
	brk $98.b		; 00 98
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	rol $0C14.w,X		; 3E 14 0C
	sta $A00E00.l,X		; 9F 00 0E A0
	brk $A1.b		; 00 A1
	brk $0C.b		; 00 0C
	ldx #$00.b		; A2 00
	lda $00.b,S		; A3 00
	ldy $00.b		; A4 00
	lda $00.b		; A5 00
	ldx $00.b		; A6 00
	lda [$00.b]		; A7 00
	tay		; A8
	brk $0E.b		; 00 0E
	lda #$00.b		; A9 00
	adc $00AA00.l		; 6F 00 AA 00
	plb		; AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B0.b		; 00 B0
	rol $231D.w,X		; 3E 1D 23
	lda ($00.b),Y		; B1 00
	lda ($00.b)		; B2 00
	lda ($00.b,S),Y		; B3 00
	ldy $00.b,X		; B4 00
	lda $00.b,X		; B5 00
	ldx $00.b,Y		; B6 00
	lda #$00.b		; A9 00
	and $6F.b,S		; 23 6F
	brk $B7.b		; 00 B7
	brk $B8.b		; 00 B8
	brk $B9.b		; 00 B9
	brk $BA.b		; 00 BA
	brk $BB.b		; 00 BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	rol $231D.w,X		; 3E 1D 23
	ldx $BF00.w,Y		; BE 00 BF
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	brk $38.b		; 00 38
	rep #$00		; C2 00
	cmp $00.b,S		; C3 00
	cpy $00.b		; C4 00
	cmp $00.b		; C5 00
	dec $00.b		; C6 00
	cmp [$00.b]		; C7 00
	adc $00.b,X		; 75 00
	ror $3E.b,X		; 76 3E
	and $C8.b,S		; 23 C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $D3.b		; 00 D3
	brk $D4.b		; 00 D4
	brk $14.b		; 00 14
	tsb $D747.w		; 0C 47 D7
	brk $D8.b		; 00 D8
	brk $D9.b		; 00 D9
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	rol $DA23.w,X		; 3E 23 DA
	brk $DB.b		; 00 DB
	brk $DC.b		; 00 DC
	brk $DD.b		; 00 DD
	brk $34.b		; 00 34
	brk $DE.b		; 00 DE
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $E2.b		; 00 E2
	brk $E3.b		; 00 E3
	brk $E4.b		; 00 E4
	brk $38.b		; 00 38
	eor [$E5.b]		; 47 E5
	brk $E6.b		; 00 E6
	brk $E7.b		; 00 E7
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	rol $E823.w,X		; 3E 23 E8
	brk $E9.b		; 00 E9
	brk $EA.b		; 00 EA
	brk $EB.b		; 00 EB
	brk $EC.b		; 00 EC
	brk $ED.b		; 00 ED
	brk $EE.b		; 00 EE
	brk $EF.b		; 00 EF
	brk $C1.b		; 00 C1
	rti		; 40

	beq   0.b		; F0 00
	sbc ($00.b),Y		; F1 00
	sbc ($00.b)		; F2 00
	sec		; 38
	eor [$F3.b]		; 47 F3
	brk $F4.b		; 00 F4
	brk $F5.b		; 00 F5
	brk $F6.b		; 00 F6
	brk $F7.b		; 00 F7
	brk $B0.b		; 00 B0
	rol $870E.w,X		; 3E 0E 87
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FA.b		; 00 FA
	brk $FB.b		; 00 FB
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	asl A		; 0A
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora ($04.b,X)		; 01 04
	ora ($05.b,X)		; 01 05
	ora ($06.b,X)		; 01 06
	ora ($07.b,X)		; 01 07
	ora ($08.b,X)		; 01 08
	ora ($47.b,X)		; 01 47
	ora #$09.b		; 09 09
	ora ($09.b,X)		; 01 09
	asl A		; 0A
	ora ($09.b,X)		; 01 09
	phd		; 0B
	ora ($09.b,X)		; 01 09
	tsb $0901.w		; 0C 01 09
	ora $BD01.w		; 0D 01 BD
	rol $090E.w,X		; 3E 0E 09
	asl $0901.w		; 0E 01 09
	ora $00DD01.l		; 0F 01 DD 00
	bpl   1.b		; 10 01
	ora #$11.b		; 09 11
	ora ($09.b,X)		; 01 09
	ora ($01.b)		; 12 01
	ora ($01.b,S),Y		; 13 01
	ora #$14.b		; 09 14
	ora ($09.b,X)		; 01 09
	ora $01.b,X		; 15 01
	asl $01.b,X		; 16 01
	ora #$17.b		; 09 17
	ora ($18.b,X)		; 01 18
	ora ($09.b,X)		; 01 09
	ora $0901.w,Y		; 19 01 09
	inc A		; 1A
	ora ($09.b,X)		; 01 09
	tas		; 1B
	ora ($1C.b,X)		; 01 1C
	ora ($09.b,X)		; 01 09
	ora $0901.w,X		; 1D 01 09
	asl $1F01.w,X		; 1E 01 1F
	ora ($47.b,X)		; 01 47
	jsr $0901.w		; 20 01 09
	and ($01.b,X)		; 21 01
	ora #$22.b		; 09 22
	ora ($09.b,X)		; 01 09
	and $01.b,S		; 23 01
	ora #$24.b		; 09 24
	ora ($76.b,X)		; 01 76
	rol $0923.w,X		; 3E 23 09
	and $01.b		; 25 01
	xba		; EB
	brk $09.b		; 00 09
	rol $01.b		; 26 01
	ora #$27.b		; 09 27
	ora ($09.b,X)		; 01 09
	plp		; 28
	ora ($09.b,X)		; 01 09
	and #$01.b		; 29 01
	rol A		; 2A
	ora ($09.b,X)		; 01 09
	pld		; 2B
	ora ($2C.b,X)		; 01 2C
	ora ($2D.b,X)		; 01 2D
	ora ($09.b,X)		; 01 09
	rol $0901.w		; 2E 01 09
	and $300901.l		; 2F 01 09 30
	ora ($09.b,X)		; 01 09
	and ($01.b),Y		; 31 01
	and ($01.b)		; 32 01
	ora #$33.b		; 09 33
	ora ($34.b,X)		; 01 34
	ora ($35.b,X)		; 01 35
	ora ($3F.b,X)		; 01 3F
	dec A		; 3A
	brk $09.b		; 00 09
	rol $01.b,X		; 36 01
	ora #$37.b		; 09 37
	ora ($09.b,X)		; 01 09
	sec		; 38
	ora ($09.b,X)		; 01 09
	and $0901.w,Y		; 39 01 09
	dec A		; 3A
	ora ($39.b,X)		; 01 39
	asl $013B.w		; 0E 3B 01
	ora #$3C.b		; 09 3C
	ora ($09.b,X)		; 01 09
	and $0901.w,X		; 3D 01 09
	rol $0801.w,X		; 3E 01 08
	ora ($09.b,X)		; 01 09
	and $014001.l,X		; 3F 01 40 01
	eor ($01.b,X)		; 41 01
	.db $42, $01		; 42 01
	ora $01.b,S		; 03 01
	ora #$43.b		; 09 43
	ora ($09.b,X)		; 01 09
	mvp $09,$01		; 44 01 09
	eor $01.b		; 45 01
	ora #$46.b		; 09 46
	ora ($08.b,X)		; 01 08
	ora ($09.b,X)		; 01 09
	eor [$01.b]		; 47 01
	pha		; 48
	ora ($49.b,X)		; 01 49
	ora ($0C.b,X)		; 01 0C
	and $4A003A.l,X		; 3F 3A 00 4A
	ora ($4B.b,X)		; 01 4B
	ora ($4C.b,X)		; 01 4C
	ora ($4D.b,X)		; 01 4D
	ora ($4E.b,X)		; 01 4E
	ora ($39.b,X)		; 01 39
	bit $014F.w,X		; 3C 4F 01
	bvc   1.b		; 50 01
	eor ($01.b),Y		; 51 01
	eor ($01.b)		; 52 01
	eor ($01.b,S),Y		; 53 01
	mvn $55,$01		; 54 01 55
	ora ($DC.b,X)		; 01 DC
	rti		; 40

	lsr $01.b,X		; 56 01
	eor [$01.b],Y		; 57 01
	cli		; 58
	ora ($53.b,X)		; 01 53
	ora ($59.b,X)		; 01 59
	ora ($5A.b,X)		; 01 5A
	ora ($5B.b,X)		; 01 5B
	ora ($5C.b,X)		; 01 5C
	ora ($5C.b,X)		; 01 5C
	ora ($5D.b,X)		; 01 5D
	ora ($5E.b,X)		; 01 5E
	ora ($5F.b,X)		; 01 5F
	ora ($60.b,X)		; 01 60
	ora ($61.b,X)		; 01 61
	ora ($62.b,X)		; 01 62
	ora ($2B.b,X)		; 01 2B
	bit $00BE.w,X		; 3C BE 00
	adc $01.b,S		; 63 01
	stz $01.b		; 64 01
	adc $01.b		; 65 01
	ror $01.b		; 66 01
	adc [$01.b]		; 67 01
	pla		; 68
	ora ($69.b,X)		; 01 69
	ora ($6A.b,X)		; 01 6A
	ora ($6B.b,X)		; 01 6B
	ora ($6C.b,X)		; 01 6C
	ora ($6D.b,X)		; 01 6D
	ora ($6E.b,X)		; 01 6E
	ora ($6F.b,X)		; 01 6F
	ora ($70.b,X)		; 01 70
	lsr $46.b		; 46 46
	lsr $3D.b		; 46 3D
	ora ($72.b,X)		; 01 72
	ora ($2B.b,X)		; 01 2B
	ora $7323.w,X		; 1D 23 73
	ora ($74.b,X)		; 01 74
	ora ($75.b,X)		; 01 75
	ora ($76.b,X)		; 01 76
	ora ($77.b,X)		; 01 77
	ora ($78.b,X)		; 01 78
	ora ($79.b,X)		; 01 79
	ora ($7A.b,X)		; 01 7A
	ora ($7B.b,X)		; 01 7B
	ora ($7C.b,X)		; 01 7C
	ora ($7D.b,X)		; 01 7D
	and ($2B.b,S),Y		; 33 2B
	ora $D023.w,X		; 1D 23 D0
	brk $7E.b		; 00 7E
	ora ($7F.b,X)		; 01 7F
	ora ($80.b,X)		; 01 80
	ora ($81.b,X)		; 01 81
	ora ($82.b,X)		; 01 82
	ora ($83.b,X)		; 01 83
	ora ($84.b,X)		; 01 84
	ora ($85.b,X)		; 01 85
	ora ($86.b,X)		; 01 86
	ora ($87.b,X)		; 01 87
	and ($2B.b,S),Y		; 33 2B
	and $88.b,S		; 23 88
	ora ($89.b,X)		; 01 89
	ora ($8A.b,X)		; 01 8A
	ora ($8B.b,X)		; 01 8B
	ora ($8C.b,X)		; 01 8C
	ora ($8D.b,X)		; 01 8D
	ora ($8E.b,X)		; 01 8E
	ora ($A9.b,X)		; 01 A9
	bra  29.b		; 80 1D
	tsb $018F.w		; 0C 8F 01
	bcc  51.b		; 90 33
	pld		; 2B
	and $91.b,S		; 23 91
	ora ($92.b,X)		; 01 92
	ora ($93.b,X)		; 01 93
	ora ($94.b,X)		; 01 94
	ora ($95.b,X)		; 01 95
	ora ($96.b,X)		; 01 96
	ora ($97.b,X)		; 01 97
	ora ($98.b,X)		; 01 98
	ora ($99.b,X)		; 01 99
	ora ($9A.b,X)		; 01 9A
	ora ($9B.b,X)		; 01 9B
	ora ($9C.b,X)		; 01 9C
	and ($3C.b,S),Y		; 33 3C
	pld		; 2B
	sec		; 38
	sta $9E01.w,X		; 9D 01 9E
	ora ($9F.b,X)		; 01 9F
	ora ($A0.b,X)		; 01 A0
	ora ($A1.b,X)		; 01 A1
	ora ($A2.b,X)		; 01 A2
	ora ($A3.b,X)		; 01 A3
	ora ($A4.b,X)		; 01 A4
	ora ($A5.b,X)		; 01 A5
	and ($3C.b,S),Y		; 33 3C
	pld		; 2B
	trb $7F.b		; 14 7F
	cpy #$E1.b		; C0 E1
	rti		; 40

	ldx $01.b		; A6 01
	clc		; 18
	ora ($1F.b,X)		; 01 1F
	ora ($A7.b,X)		; 01 A7
	ora ($E0.b,X)		; 01 E0
	brk $16.b		; 00 16
	ora ($A8.b,X)		; 01 A8
	ora ($A9.b,X)		; 01 A9
	ora ($32.b,X)		; 01 32
	brk $1D.b		; 00 1D
	bit $142B.w,X		; 3C 2B 14
	tax		; AA
	ora ($AB.b,X)		; 01 AB
	ora ($AC.b,X)		; 01 AC
	ora ($AD.b,X)		; 01 AD
	ora ($35.b,X)		; 01 35
	ora ($AE.b,X)		; 01 AE
	ora ($EF.b,X)		; 01 EF
	brk $2C.b		; 00 2C
	ora ($AF.b,X)		; 01 AF
	ora ($B0.b,X)		; 01 B0
	ora ($B1.b,X)		; 01 B1
	and ($3C.b,S),Y		; 33 3C
	pld		; 2B
	trb $B2.b		; 14 B2
	ora ($84.b,X)		; 01 84
	ora ($B3.b,X)		; 01 B3
	ora ($B4.b,X)		; 01 B4
	ora ($08.b,X)		; 01 08
	ora ($B5.b,X)		; 01 B5
	ora ($42.b,X)		; 01 42
	ora ($B6.b,X)		; 01 B6
	ora ($B7.b,X)		; 01 B7
	ora ($B8.b,X)		; 01 B8
	ora ($B9.b,X)		; 01 B9
	and ($3C.b,S),Y		; 33 3C
	pld		; 2B
	and $BA.b,S		; 23 BA
	ora ($BB.b,X)		; 01 BB
	ora ($BC.b,X)		; 01 BC
	ora ($BD.b,X)		; 01 BD
	ora ($BE.b,X)		; 01 BE
	ora ($BF.b,X)		; 01 BF
	ora ($C0.b,X)		; 01 C0
	ora ($E0.b,X)		; 01 E0
	brk $C1.b		; 00 C1
	ora ($DA.b,X)		; 01 DA
	rti		; 40

	tsx		; BA
	ora ($C2.b,X)		; 01 C2
	ora ($C3.b,X)		; 01 C3
	ora ($C4.b,X)		; 01 C4
	ora ($C5.b,X)		; 01 C5
	ora ($A6.b,X)		; 01 A6
	ora ($C6.b,X)		; 01 C6
	ora ($C7.b,X)		; 01 C7
	ora ($13.b,X)		; 01 13
	and ($2B.b,S),Y		; 33 2B
	and $C8.b,S		; 23 C8
	ora ($C9.b,X)		; 01 C9
	ora ($CA.b,X)		; 01 CA
	ora ($CB.b,X)		; 01 CB
	ora ($CC.b,X)		; 01 CC
	ora ($35.b,X)		; 01 35
	eor ($CD.b,X)		; 41 CD
	ora ($CE.b,X)		; 01 CE
	ora ($BE.b,X)		; 01 BE
	brk $CF.b		; 00 CF
	ora ($D0.b,X)		; 01 D0
	ora ($D1.b,X)		; 01 D1
	ora ($D2.b,X)		; 01 D2
	ora ($A8.b,X)		; 01 A8
	bra -45.b		; 80 D3
	ora ($D4.b,X)		; 01 D4
	ora ($D5.b,X)		; 01 D5
	ora ($D6.b,X)		; 01 D6
	ora ($D7.b,X)		; 01 D7
	and ($2B.b,S),Y		; 33 2B
	trb $3B.b		; 14 3B
	ora ($D8.b,X)		; 01 D8
	ora ($D9.b,X)		; 01 D9
	ora ($DA.b,X)		; 01 DA
	ora ($DB.b,X)		; 01 DB
	ora ($DC.b,X)		; 01 DC
	ora ($DD.b,X)		; 01 DD
	ora ($DE.b,X)		; 01 DE
	ora ($DF.b,X)		; 01 DF
	ora ($E0.b,X)		; 01 E0
	ora ($E1.b,X)		; 01 E1
	ora ($E2.b,X)		; 01 E2
	ora ($E3.b,X)		; 01 E3
	and ($14.b,S),Y		; 33 14
	tsb $382B.w		; 0C 2B 38
	cpx $01.b		; E4 01
	sbc $01.b		; E5 01
	inc $01.b		; E6 01
	sbc [$01.b]		; E7 01
	inx		; E8
	ora ($E9.b,X)		; 01 E9
	ora ($EA.b,X)		; 01 EA
	ora ($EB.b,X)		; 01 EB
	ora ($0C.b,X)		; 01 0C
	adc $381D00.l,X		; 7F 00 1D 38
	pld		; 2B
	sec		; 38
	cpx $ED01.w		; EC 01 ED
	ora ($EE.b,X)		; 01 EE
	ora ($EF.b,X)		; 01 EF
	ora ($F0.b,X)		; 01 F0
	ora ($F1.b,X)		; 01 F1
	ora ($F2.b,X)		; 01 F2
	ora ($F3.b,X)		; 01 F3
	and ($1D.b,S),Y		; 33 1D
	pld		; 2B
	asl $0010.w		; 0E 10 00
	pea $F501.w		; F4 01 F5
	ora ($F6.b,X)		; 01 F6
	ora ($F7.b,X)		; 01 F7
	ora ($F8.b,X)		; 01 F8
	ora ($F9.b,X)		; 01 F9
	ora ($FA.b,X)		; 01 FA
	ora ($FB.b,X)		; 01 FB
	ora ($FC.b,X)		; 01 FC
	ora ($FD.b,X)		; 01 FD
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	and ($3C.b,S),Y		; 33 3C
	asl $0200.w,X		; 1E 00 02
	ora ($36.b,X)		; 01 36
	rol $36.b,X		; 36 36
	inc A		; 1A
	cop $03.b		; 02 03
	rol $36.b,X		; 36 36
	rol $28.b,X		; 36 28
	cop $01.b		; 02 01
	.db $42, $04		; 42 04
	cop $05.b		; 02 05
	eor $43.b,S		; 43 43
	eor $2F.b,S		; 43 2F
	rol $02.b		; 26 02
	ora [$02.b]		; 07 02
	and [$37.b],Y		; 37 37
	and [$37.b],Y		; 37 37
	and [$37.b],Y		; 37 37
	tas		; 1B
	ora [$12.b],Y		; 17 12
	ora ($0D.b),Y		; 11 0D
	ora $09.b		; 05 09
	trb NMITIMEN.w		; 1C 00 42
	xce		; FB
	brk $10.b		; 00 10
	asl $1F.b		; 06 1F
	brk $10.b		; 00 10
	asl $14.b		; 06 14
	rol $0015.w		; 2E 15 00
	brk $17.b		; 00 17
	ora $15.b,X		; 15 15
	clc		; 18
	ora $1C.b		; 05 1C
	ora $1818.w,Y		; 19 18 18
	inc A		; 1A
	ora $00.b		; 05 00
	tas		; 1B
	ora [$17.b],Y		; 17 17
	ora $1A1A.w,X		; 1D 1A 1A
	asl $1919.w,X		; 1E 19 19
	ora $221D1D.l,X		; 1F 1D 1D 22
	tas		; 1B
	tas		; 1B
	and $1E.b,S		; 23 1E
	asl $2225.w,X		; 1E 25 22
	jsl $232327.l		; 22 27 23 23
	plp		; 28
	ora $04291F.l,X		; 1F 1F 29 04
	rti		; 40

	rol A		; 2A
	cop $12.b		; 02 12
	pld		; 2B
	brk $03.b		; 00 03
	bit $0004.w		; 2C 04 00
	rol $2A2A.w		; 2E 2A 2A
	and $310E02.l		; 2F 02 0E 31
	and $25.b		; 25 25
	bit $2B.b,X		; 34 2B
	pld		; 2B
	and $1D.b,X		; 35 1D
	inc A		; 1A
	rol $27.b,X		; 36 27
	and [$37.b]		; 27 37
	and #$2C.b		; 29 2C
	and $2F2F.w,Y		; 39 2F 2F
	tsa		; 3B
	brk $37.b		; 00 37
	bit $2E2E.w,X		; 3C 2E 2E
	and $3131.w,X		; 3D 31 31
	rol $3434.w,X		; 3E 34 34
	and $443636.l,X		; 3F 36 36 44
	and $4539.w,Y		; 39 39 45
	ora ($28.b,X)		; 01 28
	lsr $67.b		; 46 67
	tsa		; 3B
	eor [$00.b]		; 47 00
	cpx $48.b		; E4 48
	ora $014A1D.l,X		; 1F 1D 4A 01
	adc $46004B.l,X		; 7F 4B 00 46
	jmp $351F.w		; 4C 1F 35
	eor $47E3.w		; 4D E3 47
	lsr $5100.w		; 4E 00 51
	eor $523C3C.l		; 4F 3C 3C 52
	and $533D.w,X		; 3D 3D 53
	rol $543E.w,X		; 3E 3E 54
	lsr A		; 4A
	lsr A		; 4A
	eor $4D.b,X		; 55 4D
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $08.b		; 00 08
	ora $52.b,S		; 03 52
	eor ($52.b)		; 52 52
	and $0001.w,X		; 3D 01 00
	cop $53.b		; 02 53
	eor ($53.b,S),Y		; 53 53
	rol $0200.w,X		; 3E 00 02
	rti		; 40

	ora ($40.b,X)		; 01 40
	bit $061A.w		; 2C 1A 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	brk $11.b		; 00 11
	brk $12.b		; 00 12
	brk $13.b		; 00 13
	brk $14.b		; 00 14
	trb $00.b		; 14 00
	trb $15.b		; 14 15
	brk $16.b		; 00 16
	brk $14.b		; 00 14
	ora [$00.b],Y		; 17 00
	trb $18.b		; 14 18
	brk $14.b		; 00 14
	ora $1400.w,Y		; 19 00 14
	inc A		; 1A
	brk $14.b		; 00 14
	tas		; 1B
	brk $1C.b		; 00 1C
	brk $14.b		; 00 14
	ora $1400.w,X		; 1D 00 14
	asl $1400.w,X		; 1E 00 14
	ora $002000.l,X		; 1F 00 20 00
	and ($00.b,X)		; 21 00
	trb $22.b		; 14 22
	tsa		; 3B
	inc A		; 1A
	trb $23.b		; 14 23
	brk $24.b		; 00 24
	brk $14.b		; 00 14
	and $00.b		; 25 00
	rol $00.b		; 26 00
	trb $27.b		; 14 27
	brk $14.b		; 00 14
	plp		; 28
	brk $14.b		; 00 14
	and #$00.b		; 29 00
	trb $2A.b		; 14 2A
	brk $14.b		; 00 14
	pld		; 2B
	brk $14.b		; 00 14
	bit $2D00.w		; 2C 00 2D
	brk $14.b		; 00 14
	rol $1400.w		; 2E 00 14
	and $282800.l		; 2F 00 28 28
	and [$30.b],Y		; 37 30
	brk $14.b		; 00 14
	and ($00.b),Y		; 31 00
	and ($00.b)		; 32 00
	and ($00.b)		; 32 00
	and ($00.b,S),Y		; 33 00
	and ($00.b)		; 32 00
	and ($00.b,S),Y		; 33 00
	trb $34.b		; 14 34
	brk $33.b		; 00 33
	rti		; 40

	and ($00.b)		; 32 00
	and ($00.b)		; 32 00
	trb $35.b		; 14 35
	brk $14.b		; 00 14
	rol $00.b,X		; 36 00
	trb $37.b		; 14 37
	brk $38.b		; 00 38
	brk $14.b		; 00 14
	and $3A00.w,Y		; 39 00 3A
	brk $28.b		; 00 28
	ora $14291A.l,X		; 1F 1A 29 14
	tsa		; 3B
	brk $14.b		; 00 14
	bit $1400.w,X		; 3C 00 14
	and $1400.w,X		; 3D 00 14
	rol $1400.w,X		; 3E 00 14
	and $004000.l,X		; 3F 00 40 00
	eor ($00.b,X)		; 41 00
	.db $42, $00		; 42 00
	eor $00.b,S		; 43 00
	trb $44.b		; 14 44
	brk $14.b		; 00 14
	eor $00.b		; 45 00
	trb $46.b		; 14 46
	brk $14.b		; 00 14
	eor [$00.b]		; 47 00
	trb $48.b		; 14 48
	brk $49.b		; 00 49
	brk $14.b		; 00 14
	lsr A		; 4A
	brk $14.b		; 00 14
	phk		; 4B
	brk $14.b		; 00 14
	jmp $1400.w		; 4C 00 14
	eor $3500.w		; 4D 00 35
	trb $4E.b		; 14 4E
	brk $14.b		; 00 14
	eor $4E5000.l		; 4F 00 50 4E
	lsr $4E4E.w		; 4E 4E 4E
	lsr $1400.w		; 4E 00 14
	eor ($3B.b)		; 52 3B
	pha		; 48
	trb $53.b		; 14 53
	brk $14.b		; 00 14
	mvn $14,$00		; 54 00 14
	eor $00.b,X		; 55 00
	lsr $00.b,X		; 56 00
	eor [$00.b],Y		; 57 00
	cli		; 58
	brk $59.b		; 00 59
	brk $5A.b		; 00 5A
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	brk $5D.b		; 00 5D
	brk $5E.b		; 00 5E
	brk $35.b		; 00 35
	eor $006000.l,X		; 5F 00 60 00
	adc ($00.b,X)		; 61 00
	.db $62, $00, $63		; 62 00 63
	brk $64.b		; 00 64
	brk $65.b		; 00 65
	brk $66.b		; 00 66
	phk		; 4B
	pha		; 48
	pla		; 68
	brk $69.b		; 00 69
	brk $6A.b		; 00 6A
	brk $6B.b		; 00 6B
	brk $6C.b		; 00 6C
	brk $6D.b		; 00 6D
	brk $6E.b		; 00 6E
	brk $6F.b		; 00 6F
	brk $70.b		; 00 70
	brk $71.b		; 00 71
	brk $72.b		; 00 72
	brk $73.b		; 00 73
	brk $74.b		; 00 74
	brk $75.b		; 00 75
	brk $76.b		; 00 76
	brk $77.b		; 00 77
	brk $78.b		; 00 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	phk		; 4B
	plp		; 28
	and $7F.b,X		; 35 7F
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	brk $88.b		; 00 88
	brk $77.b		; 00 77
	brk $89.b		; 00 89
	brk $8A.b		; 00 8A
	brk $8B.b		; 00 8B
	brk $8C.b		; 00 8C
	brk $8D.b		; 00 8D
	brk $8E.b		; 00 8E
	brk $8F.b		; 00 8F
	phk		; 4B
	and $90.b,X		; 35 90
	brk $91.b		; 00 91
	brk $92.b		; 00 92
	brk $93.b		; 00 93
	brk $94.b		; 00 94
	brk $95.b		; 00 95
	brk $96.b		; 00 96
	brk $97.b		; 00 97
	brk $98.b		; 00 98
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	brk $30.b		; 00 30
	brk $77.b		; 00 77
	brk $A1.b		; 00 A1
	brk $A2.b		; 00 A2
	brk $A3.b		; 00 A3
	brk $A4.b		; 00 A4
	brk $A5.b		; 00 A5
	brk $A6.b		; 00 A6
	brk $A7.b		; 00 A7
	phk		; 4B
	ora $00A81A.l,X		; 1F 1A A8 00
	ora $00A9.w,X		; 1D A9 00
	tax		; AA
	brk $1A.b		; 00 1A
	cli		; 58
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $35.b		; 00 35
	bcs   0.b		; B0 00
	adc [$00.b],Y		; 77 00
	lda ($00.b),Y		; B1 00
	lda ($00.b)		; B2 00
	lda ($00.b,S),Y		; B3 00
	ldy $00.b,X		; B4 00
	lda $00.b,X		; B5 00
	ldx $00.b,Y		; B6 00
	lda [$4B.b],Y		; B7 4B
	plp		; 28
	and $B8.b,X		; 35 B8
	brk $B9.b		; 00 B9
	brk $BA.b		; 00 BA
	brk $BB.b		; 00 BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	brk $BE.b		; 00 BE
	brk $BF.b		; 00 BF
	brk $C0.b		; 00 C0
	brk $1A.b		; 00 1A
	adc [$00.b],Y		; 77 00
	cmp ($00.b,X)		; C1 00
	rep #$00		; C2 00
	cmp $00.b,S		; C3 00
	cpy $00.b		; C4 00
	cmp $00.b		; C5 00
	dec $00.b		; C6 00
	cmp [$4B.b]		; C7 4B
	plp		; 28
	and $C8.b,X		; 35 C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $1A.b		; 00 1A
	cmp ($00.b),Y		; D1 00
	cmp ($00.b)		; D2 00
	cmp ($00.b,S),Y		; D3 00
	ply		; 7A
	brk $D4.b		; 00 D4
	brk $D5.b		; 00 D5
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	phk		; 4B
	and $D6.b,X		; 35 D6
	brk $D7.b		; 00 D7
	brk $D8.b		; 00 D8
	brk $D9.b		; 00 D9
	brk $DA.b		; 00 DA
	brk $DB.b		; 00 DB
	brk $DC.b		; 00 DC
	brk $DD.b		; 00 DD
	brk $DE.b		; 00 DE
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $E2.b		; 00 E2
	brk $1F.b		; 00 1F
	inc A		; 1A
	eor $E5.b,X		; 55 E5
	brk $E6.b		; 00 E6
	brk $E7.b		; 00 E7
	brk $E8.b		; 00 E8
	brk $8E.b		; 00 8E
	brk $8F.b		; 00 8F
	phk		; 4B
	and $E9.b,X		; 35 E9
	brk $EA.b		; 00 EA
	brk $EB.b		; 00 EB
	brk $EC.b		; 00 EC
	brk $3A.b		; 00 3A
	brk $ED.b		; 00 ED
	brk $EE.b		; 00 EE
	brk $EF.b		; 00 EF
	brk $F0.b		; 00 F0
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	rti		; 40

	sbc ($00.b)		; F2 00
	pha		; 48
	eor $F3.b,X		; 55 F3
	brk $F4.b		; 00 F4
	brk $F5.b		; 00 F5
	brk $A5.b		; 00 A5
	brk $A6.b		; 00 A6
	brk $A7.b		; 00 A7
	phk		; 4B
	and $F6.b,X		; 35 F6
	brk $F7.b		; 00 F7
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FA.b		; 00 FA
	brk $FB.b		; 00 FB
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora $01.b,X		; 15 01
	sbc $4840.w,X		; FD 40 48
	eor $01.b,X		; 55 01
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora ($04.b,X)		; 01 04
	ora ($05.b,X)		; 01 05
	ora ($B7.b,X)		; 01 B7
	phk		; 4B
	ora $0090.w,X		; 1D 90 00
	asl $01.b		; 06 01
	ora [$01.b]		; 07 01
	php		; 08
	ora ($09.b,X)		; 01 09
	ora ($0A.b,X)		; 01 0A
	ora ($0B.b,X)		; 01 0B
	ora ($0C.b,X)		; 01 0C
	ora ($DD.b,X)		; 01 DD
	brk $0D.b		; 00 0D
	ora ($0E.b,X)		; 01 0E
	ora ($0F.b,X)		; 01 0F
	ora ($10.b,X)		; 01 10
	ora ($11.b,X)		; 01 11
	ora ($12.b,X)		; 01 12
	ora ($13.b,X)		; 01 13
	ora ($14.b,X)		; 01 14
	trb $01.b		; 14 01
	trb $15.b		; 14 15
	ora ($16.b,X)		; 01 16
	ora ($55.b,X)		; 01 55
	trb $17.b		; 14 17
	ora ($14.b,X)		; 01 14
	clc		; 18
	ora ($14.b,X)		; 01 14
	ora $1401.w,Y		; 19 01 14
	inc A		; 1A
	ora ($14.b,X)		; 01 14
	tas		; 1B
	ora ($C7.b,X)		; 01 C7
	phk		; 4B
	ora $011C.w,X		; 1D 1C 01
	trb $1D.b		; 14 1D
	ora ($EC.b,X)		; 01 EC
	brk $14.b		; 00 14
	asl $1401.w,X		; 1E 01 14
	ora $012001.l,X		; 1F 01 20 01
	and ($01.b,X)		; 21 01
	trb $22.b		; 14 22
	ora ($14.b,X)		; 01 14
	and $01.b,S		; 23 01
	bit $01.b		; 24 01
	trb $25.b		; 14 25
	ora ($26.b,X)		; 01 26
	ora ($14.b,X)		; 01 14
	and [$01.b]		; 27 01
	trb $28.b		; 14 28
	ora ($14.b,X)		; 01 14
	and #$01.b		; 29 01
	trb $2A.b		; 14 2A
	ora ($14.b,X)		; 01 14
	pld		; 2B
	ora ($14.b,X)		; 01 14
	bit $2D01.w		; 2C 01 2D
	ora ($55.b,X)		; 01 55
	trb $2E.b		; 14 2E
	ora ($14.b,X)		; 01 14
	and $013001.l		; 2F 01 30 01
	trb $31.b		; 14 31
	ora ($32.b,X)		; 01 32
	ora ($7E.b,X)		; 01 7E
	phk		; 4B
	and $33.b,X		; 35 33
	ora ($F9.b,X)		; 01 F9
	brk $14.b		; 00 14
	bit $01.b,X		; 34 01
	trb $35.b		; 14 35
	ora ($14.b,X)		; 01 14
	rol $01.b,X		; 36 01
	trb $37.b		; 14 37
	ora ($38.b,X)		; 01 38
	ora ($14.b,X)		; 01 14
	and $3A01.w,Y		; 39 01 3A
	ora ($14.b,X)		; 01 14
	tsa		; 3B
	ora ($14.b,X)		; 01 14
	bit $1401.w,X		; 3C 01 14
	and $1401.w,X		; 3D 01 14
	rol $1401.w,X		; 3E 01 14
	and $014001.l,X		; 3F 01 40 01
	eor ($01.b,X)		; 41 01
	.db $42, $01		; 42 01
	eor $01.b,S		; 43 01
	eor $0047.w		; 4D 47 00
	trb $44.b		; 14 44
	ora ($14.b,X)		; 01 14
	eor $01.b		; 45 01
	trb $46.b		; 14 46
	ora ($14.b,X)		; 01 14
	eor [$01.b]		; 47 01
	trb $48.b		; 14 48
	ora ($46.b,X)		; 01 46
	ora $0149.w,X		; 1D 49 01
	trb $4A.b		; 14 4A
	ora ($14.b,X)		; 01 14
	phk		; 4B
	ora ($14.b,X)		; 01 14
	jmp $1601.w		; 4C 01 16
	ora ($14.b,X)		; 01 14
	eor $1401.w		; 4D 01 14
	lsr $1401.w		; 4E 01 14
	eor $015001.l		; 4F 01 50 01
	dec $014E.w,X		; DE 4E 01
	trb $52.b		; 14 52
	ora ($14.b,X)		; 01 14
	eor ($01.b,S),Y		; 53 01
	trb $54.b		; 14 54
	ora ($16.b,X)		; 01 16
	ora ($14.b,X)		; 01 14
	eor $01.b,X		; 55 01
	lsr $01.b,X		; 56 01
	eor [$01.b],Y		; 57 01
	inc A		; 1A
	eor $0047.w		; 4D 47 00
	cli		; 58
	ora ($59.b,X)		; 01 59
	ora ($5A.b,X)		; 01 5A
	ora ($5B.b,X)		; 01 5B
	ora ($5C.b,X)		; 01 5C
	ora ($46.b,X)		; 01 46
	jmp $015D.w		; 4C 5D 01
	lsr $5F01.w,X		; 5E 01 5F
	ora ($60.b,X)		; 01 60
	ora ($61.b,X)		; 01 61
	ora ($62.b,X)		; 01 62
	ora ($63.b,X)		; 01 63
	ora ($EB.b,X)		; 01 EB
	rti		; 40

	stz $01.b		; 64 01
	adc $01.b		; 65 01
	ror $01.b		; 66 01
	adc ($01.b,X)		; 61 01
	adc [$01.b]		; 67 01
	pla		; 68
	ora ($69.b,X)		; 01 69
	ora ($6A.b,X)		; 01 6A
	ora ($6A.b,X)		; 01 6A
	ora ($6B.b,X)		; 01 6B
	ora ($6C.b,X)		; 01 6C
	ora ($6D.b,X)		; 01 6D
	ora ($6E.b,X)		; 01 6E
	ora ($6F.b,X)		; 01 6F
	ora ($70.b,X)		; 01 70
	ora ($37.b,X)		; 01 37
	jmp $00FE.w		; 4C FE 00
	adc ($01.b),Y		; 71 01
	adc ($01.b)		; 72 01
	adc ($01.b,S),Y		; 73 01
	stz $01.b,X		; 74 01
	adc $01.b,X		; 75 01
	ror $01.b,X		; 76 01
	adc [$01.b],Y		; 77 01
	sei		; 78
	ora ($79.b,X)		; 01 79
	ora ($7A.b,X)		; 01 7A
	ora ($7B.b,X)		; 01 7B
	ora ($7C.b,X)		; 01 7C
	ora ($7D.b,X)		; 01 7D
	ora ($7E.b,X)		; 01 7E
	mvn $54,$54		; 54 54 54
	lsr A		; 4A
	ora ($80.b,X)		; 01 80
	ora ($37.b,X)		; 01 37
	plp		; 28
	and $81.b,X		; 35 81
	ora ($82.b,X)		; 01 82
	ora ($83.b,X)		; 01 83
	ora ($84.b,X)		; 01 84
	ora ($85.b,X)		; 01 85
	ora ($86.b,X)		; 01 86
	ora ($87.b,X)		; 01 87
	ora ($88.b,X)		; 01 88
	ora ($89.b,X)		; 01 89
	ora ($8A.b,X)		; 01 8A
	ora ($8B.b,X)		; 01 8B
	eor $37.b		; 45 37
	plp		; 28
	and $8C.b,X		; 35 8C
	ora ($8D.b,X)		; 01 8D
	ora ($8E.b,X)		; 01 8E
	ora ($8F.b,X)		; 01 8F
	ora ($90.b,X)		; 01 90
	ora ($91.b,X)		; 01 91
	ora ($92.b,X)		; 01 92
	ora ($93.b,X)		; 01 93
	ora ($94.b,X)		; 01 94
	ora ($95.b,X)		; 01 95
	ora ($96.b,X)		; 01 96
	eor $37.b		; 45 37
	and $97.b,X		; 35 97
	ora ($98.b,X)		; 01 98
	ora ($99.b,X)		; 01 99
	ora ($9A.b,X)		; 01 9A
	ora ($9B.b,X)		; 01 9B
	ora ($9C.b,X)		; 01 9C
	ora ($9D.b,X)		; 01 9D
	ora ($B0.b,X)		; 01 B0
	bra  40.b		; 80 28
	inc A		; 1A
	stz $9E01.w,X		; 9E 01 9E
	eor ($28.b,X)		; 41 28
	and [$35.b],Y		; 37 35
	sta $01A001.l,X		; 9F 01 A0 01
	lda ($01.b,X)		; A1 01
	ldx #$01.b		; A2 01
	lda $01.b,S		; A3 01
	ldy $01.b		; A4 01
	lda $01.b		; A5 01
	lda $01A680.l		; AF 80 A6 01
	lda [$01.b]		; A7 01
	tay		; A8
	ora ($A9.b,X)		; 01 A9
	eor $4C.b		; 45 4C
	and [$48.b],Y		; 37 48
	tax		; AA
	ora ($AB.b,X)		; 01 AB
	ora ($AC.b,X)		; 01 AC
	ora ($AD.b,X)		; 01 AD
	ora ($AE.b,X)		; 01 AE
	ora ($AF.b,X)		; 01 AF
	ora ($B0.b,X)		; 01 B0
	ora ($B1.b,X)		; 01 B1
	ora ($B2.b,X)		; 01 B2
	eor $4C.b		; 45 4C
	and [$1F.b],Y		; 37 1F
	lda ($01.b,S),Y		; B3 01
	ldy $01.b,X		; B4 01
	lda $01.b,X		; B5 01
	rol $01.b		; 26 01
	and $B601.w		; 2D 01 B6
	ora ($EF.b,X)		; 01 EF
	brk $24.b		; 00 24
	ora ($B7.b,X)		; 01 B7
	ora ($B8.b,X)		; 01 B8
	ora ($38.b,X)		; 01 38
	brk $28.b		; 00 28
	jmp $1F37.w		; 4C 37 1F
	lda $BA01.w,Y		; B9 01 BA
	ora ($BB.b,X)		; 01 BB
	ora ($BC.b,X)		; 01 BC
	ora ($43.b,X)		; 01 43
	ora ($BD.b,X)		; 01 BD
	ora ($FD.b,X)		; 01 FD
	brk $3A.b		; 00 3A
	ora ($BE.b,X)		; 01 BE
	ora ($BF.b,X)		; 01 BF
	ora ($C0.b,X)		; 01 C0
	eor $4C.b		; 45 4C
	and [$1F.b],Y		; 37 1F
	cmp ($01.b,X)		; C1 01
	rep #$01		; C2 01
	cmp $01.b,S		; C3 01
	cpy $01.b		; C4 01
	asl $01.b,X		; 16 01
	cmp $01.b		; C5 01
	bvc   1.b		; 50 01
	dec $01.b		; C6 01
	cmp $41.b,S		; C3 41
	cmp [$01.b]		; C7 01
	iny		; C8
	eor $4C.b		; 45 4C
	and [$35.b],Y		; 37 35
	sbc ($40.b),Y		; F1 40
	cmp #$01.b		; C9 01
	dex		; CA
	ora ($CB.b,X)		; 01 CB
	ora ($CC.b,X)		; 01 CC
	ora ($CD.b,X)		; 01 CD
	ora ($CE.b,X)		; 01 CE
	ora ($EF.b,X)		; 01 EF
	brk $F0.b		; 00 F0
	brk $E9.b		; 00 E9
	rti		; 40

	cmp $01D001.l		; CF 01 D0 01
	cmp ($01.b),Y		; D1 01
	cmp ($01.b)		; D2 01
	cmp ($01.b,S),Y		; D3 01
	pei ($01.b)		; D4 01
	cmp $01.b,X		; D5 01
	dec $01.b,X		; D6 01
	and ($45.b,X)		; 21 45
	and [$35.b],Y		; 37 35
	cmp [$01.b],Y		; D7 01
	cld		; D8
	ora ($D9.b,X)		; 01 D9
	ora ($DA.b,X)		; 01 DA
	ora ($DB.b,X)		; 01 DB
	ora ($43.b,X)		; 01 43
	eor ($DC.b,X)		; 41 DC
	ora ($DD.b,X)		; 01 DD
	ora ($FE.b,X)		; 01 FE
	brk $DE.b		; 00 DE
	ora ($DF.b,X)		; 01 DF
	ora ($E0.b,X)		; 01 E0
	ora ($E1.b,X)		; 01 E1
	ora ($C0.b,X)		; 01 C0
	bra -30.b		; 80 E2
	ora ($E3.b,X)		; 01 E3
	ora ($E4.b,X)		; 01 E4
	ora ($E5.b,X)		; 01 E5
	ora ($E6.b,X)		; 01 E6
	eor $37.b		; 45 37
	ora $E70149.l,X		; 1F 49 01 E7
	ora ($E8.b,X)		; 01 E8
	ora ($E9.b,X)		; 01 E9
	ora ($EA.b,X)		; 01 EA
	ora ($EB.b,X)		; 01 EB
	ora ($EC.b,X)		; 01 EC
	ora ($ED.b,X)		; 01 ED
	ora ($EE.b,X)		; 01 EE
	ora ($0F.b,X)		; 01 0F
	ora ($16.b,X)		; 01 16
	ora ($C5.b,X)		; 01 C5
	ora ($EF.b,X)		; 01 EF
	eor $1F.b		; 45 1F
	inc A		; 1A
	and [$48.b],Y		; 37 48
	beq   1.b		; F0 01
	sbc ($01.b),Y		; F1 01
	sbc ($01.b)		; F2 01
	sbc ($01.b,S),Y		; F3 01
	pea $F501.w		; F4 01 F5
	ora ($F6.b,X)		; 01 F6
	ora ($F7.b,X)		; 01 F7
	ora ($1A.b,X)		; 01 1A
	tax		; AA
	brk $28.b		; 00 28
	pha		; 48
	and [$48.b],Y		; 37 48
	sed		; F8
	ora ($F9.b,X)		; 01 F9
	ora ($FA.b,X)		; 01 FA
	ora ($FB.b,X)		; 01 FB
	ora ($FC.b,X)		; 01 FC
	ora ($FD.b,X)		; 01 FD
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	eor $28.b		; 45 28
	and [$1D.b],Y		; 37 1D
	ora ($15.b,S),Y		; 13 15
	cop $01.b		; 02 01
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $04.b		; 02 04
	cop $05.b		; 02 05
	cop $06.b		; 02 06
	cop $07.b		; 02 07
	cop $08.b		; 02 08
	cop $09.b		; 02 09
	cop $0A.b		; 02 0A
	cop $0B.b		; 02 0B
	cop $28.b		; 02 28
	jmp $0C29.w		; 4C 29 0C
	cop $0D.b		; 02 0D
	mvp $44,$44		; 44 44 44
	and $440F02.l		; 2F 02 0F 44
	mvp $39,$44		; 44 44 39
	cop $0D.b		; 02 0D
	.db $42, $10		; 42 10
	cop $11.b		; 02 11
	eor $3C4F4F.l		; 4F 4F 4F 3C
	rol $1302.w		; 2E 02 13
	cop $3F.b		; 02 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $1E2327.l,X		; 3F 27 23 1E
	ora $0518.w,Y		; 19 18 05
	trb $1C.b		; 14 1C
	brk $59.b		; 00 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	rti		; 40

	phb		; 8B
	lsr $10.b		; 46 10
	xba		; EB
	eor $4F4F.w		; 4D 4F 4F
	eor $4F4F.w		; 4D 4F 4F
	rol $6F73.w		; 2E 73 6F
	jmp ($0300.w)		; 6C 00 03
	sbc #$21.b		; E9 21
	sbc $088E.w,X		; FD 8E 08
	rol $8B.b		; 26 8B
	asl $86.b,X		; 16 86
	php		; 08
	ora $02.b		; 05 02
	brk $89.b		; 00 89
	lsr $FA.b		; 46 FA
	bit #$56.b		; 89 56
	jsr ($5EC4.w,X)		; FC C4 5E
	plx		; FA
	rol $8B.b		; 26 8B
	and [$39.b],Y		; 37 39
	ror $10.b,X		; 76 10
	adc $763908.l,X		; 7F 08 39 76
	asl $037E.w		; 0E 7E 03
	rol $00.b		; 26 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	sta $0090.w,Y		; 99 90 00
	rts		; 60

	tsb $44.b		; 04 44
	mvp $44,$44		; 44 44 44
	tsb $C9CC.w		; 0C CC C9
	stz $F0.b		; 64 F0
	bcs -13.b		; B0 F3
	ora $33F4CF.l		; 0F CF F4 33
	rti		; 40

	stz $22.b,X		; 74 22
	and $0D.b		; 25 0D
	beq  33.b		; F0 21
	jmp.w [$E0E0]		; DC E0 E0
	stz $CB.b		; 64 CB
	sbc $B2BAFC.l,X		; FF FC BA B2
	.db $62, $7F, $47		; 62 7F 47
	stz $42.b,X		; 74 42
	and $10.b,S		; 23 10
	ora ($41.b,S),Y		; 13 41
	inc $DEDC.w,X		; FE DC DE
	stz $CC.b,X		; 74 CC
	cmp $BFFAFF.l		; CF FF FA BF
	ora $23.b,S		; 03 23
	ora ($90.b)		; 12 90
	cop $34.b		; 02 34
	eor $55.b		; 45 55
	adc [$64.b]		; 67 64
	and ($0E.b,X)		; 21 0E
	bcc -53.b		; 90 CB
	lda #$99.b		; A9 99
	txs		; 9A
	ldy $12E0.w,X		; BC E0 12
	jsl $343390.l		; 22 90 33 34
	mvp $34,$33		; 44 33 34
	mvp $0E,$31		; 44 31 0E
	sty $CC.b		; 84 CC
	cmp $1000.w		; CD 00 10
	ora ($45.b),Y		; 11 45
	rti		; 40

	inc $0084.w		; EE 84 00
	brk $22.b		; 00 22
	eor ($25.b,X)		; 41 25
	ora $FFBC.w,X		; 1D BC FF
	sty $CC.b		; 84 CC
	cmp $ECE10E.l,X		; DF 0E E1 EC
	ora $72.b		; 05 72
	ora ($84.b)		; 12 84
	eor $22.b		; 45 22
	jsl $DB0032.l		; 22 32 00 DB
	txy		; 9B
	cmp $DD84.w,X		; DD 84 DD
	cpx #$FD.b		; E0 FD
	inc $33F0.w		; EE F0 33
	eor $44.b		; 45 44
	sty $43.b		; 84 43
	eor $30.b,S		; 43 30
	xce		; FB
	bne  -1.b		; D0 FF
	sbc $94DE.w		; ED DE 94
	sbc $EEDE.w,X		; FD DE EE
	ora $54140F.l		; 0F 0F 14 54
	eor $84.b,S		; 43 84
	and ($34.b),Y		; 31 34
	trb $349D.w		; 1C 9D 34
	sbc $CEBC.w		; ED BC CE
	sty $0F.b,X		; 94 0F
	cmp $10E1.w,X		; DD E1 10
.ACCU 8
.INDEX 8
	sep #$35		; E2 35
	eor $40.b		; 45 40
	sty $12.b,X		; 94 12
	and ($FE.b)		; 32 FE
	sbc $CCECFF.l		; EF FF EC CC
	cmp $CC94.w,X		; DD 94 CC
	dec $3212.w		; CE 12 32
	bit $44.b		; 24 44
	.db $42, $12		; 42 12
	sty $13.b,X		; 94 13
	and ($0D.b)		; 32 0D
	dec $CCED.w		; CE ED CC
	cpy $94EE.w		; CC EE 94
	jmp.w [$55D0]		; DC D0 55
	eor $21.b,S		; 43 21
	ora ($33.b,S),Y		; 13 33
	and ($94.b,X)		; 21 94
	trb $32.b		; 14 32
	bpl  15.b		; 10 0F
	sbc $CCCC.w,X		; FD CC CC
	dec $DD94.w		; CE 94 DD
	dec $25CD.w,X		; DE CD 25
	mvn $54,$46		; 54 46 54
	.db $42, $94		; 42 94
	eor $11.b,S		; 43 11
	ora ($DC.b),Y		; 11 DC
	dec $BBCB.w		; CE CB BB
	cmp $DD94.w		; CD 94 DD
	cpx $66D1.w		; EC D1 66
	mvn $43,$44		; 54 44 43
	ora ($94.b),Y		; 11 94
	ora ($34.b,X)		; 01 34
	rti		; 40

	inc $BAFC.w		; EE FC BA
	tyx		; BB
	cpy $DE94.w		; CC 94 DE
	inc $DFFE.w,X		; FE FE DF
	cop $44.b		; 02 44
	ror $65.b		; 66 65
	sty $55.b,X		; 94 55
	eor $54.b		; 45 54
	and $CBAB.w		; 2D AB CB
	lda #$BC.b		; A9 BC
	bcs -69.b		; B0 BB
	tax		; AA
	sta $BC99.w,Y		; 99 99 BC
	cmp $944513.l,X		; DF 13 45 94
	eor $43.b,S		; 43 43
	and ($20.b,S),Y		; 33 20
	sbc $99BA.w,X		; FD BA 99
	txs		; 9A
	ldy $DD.b		; A4 DD
	inc $F2DC.w		; EE DC F2
	mvp $34,$33		; 44 33 34
	jsl $244394.l		; 22 94 43 24
	lsr $50.b		; 46 50
	phx		; DA
	txs		; 9A
	sta $9499.w,Y		; 99 99 94
	plb		; AB
	cmp $E1DD.w		; CD DD E1
	lsr $52.b,X		; 56 52
	lsr $77.b,X		; 56 77
	ldy $32.b		; A4 32
	and ($35.b)		; 32 35
	rti		; 40

	jmp.w [$CBCD]		; DC CD CB
	cmp $DCC0.w		; CD C0 DC
	cpy $CCCC.w		; CC CC CC
	cmp $01EF.w		; CD EF 01
	and $A4.b,S		; 23 A4
	jsl $413322.l		; 22 22 33 41
	xba		; EB
	tyx		; BB
	ldy $A4CD.w,X		; BC CD A4
	dec $F0DE.w,X		; DE DE F0
	sbc $424402.l,X		; FF 02 44 42
	and ($A4.b,S),Y		; 33 A4
	and ($21.b,S),Y		; 33 21
	brk $11.b		; 00 11
	and ($0C.b),Y		; 31 0C
	cmp $94CD.w		; CD CD 94
	tax		; AA
	txy		; 9B
	lda $43AF.w,Y		; B9 AF 43
	mvp $65,$67		; 44 67 65
	ldy $22.b		; A4 22
	sbc ($34.b),Y		; F1 34
	jsr $2F14.w		; 20 14 2F
	wai		; CB
	ldy $EEA4.w		; AC A4 EE
	sbc $1FF0.w		; ED F0 1F
	sbc $214402.l		; EF 02 44 21
	sty $24.b,X		; 94 24
	jsl $115366.l		; 22 66 53 11
	ora ($FD.b,X)		; 01 FD
	tyx		; BB
	sty $BB.b,X		; 94 BB
	lda #$AA.b		; A9 AA
	dec $FEFF.w		; CE FF FE
	sbc $43A435.l		; EF 35 A4 43
	mvp $22,$33		; 44 33 22
	bpl -35.b		; 10 DD
	trb $30.b		; 14 30
	ldy $DC.b		; A4 DC
	wai		; CB
	cpy $EFEF.w		; CC EF EF
	cpx $269C.w		; EC 9C 26
	ldy $65.b		; A4 65
	ror $41.b,X		; 76 41
	ora ($11.b,X)		; 01 11
	bit $32.b,X		; 34 32
	brk $A4.b		; 00 A4
	stp		; DB
	tyx		; BB
	dec $DDFE.w		; CE FE DD
	inc $01DF.w		; EE DF 01
	sty $67.b,X		; 94 67
	ror $56.b,X		; 76 56
	ror $77.b,X		; 76 77
	adc $0C.b		; 65 0C
	ldy $02A4.w		; AC A4 02
	asl $CDCB.w		; 0E CB CD
	wai		; CB
	cmp $2013.w		; CD 13 20
	ldy $FF.b		; A4 FF
	bit $54.b		; 24 54
	mvp $30,$44		; 44 44 30
	jmp.w [$C0E2]		; DC E2 C0
	and ($21.b,S),Y		; 33 21
	asl $BBCB.w		; 0E CB BB
	cmp $EDEF.w		; CD EF ED
	ldy $E2.b		; A4 E2
	eor $66.b,X		; 55 66
	eor ($23.b)		; 52 23
	asl $F0DD.w		; 0E DD F0
	ldy $FC.b		; A4 FC
	lda $FEF0.w,X		; BD F0 FE
	inc $EEFE.w,X		; FE FE EE
	pea $75A4.w		; F4 A4 75
	and $112312.l		; 2F 12 23 11
	and ($2F.b,S),Y		; 33 2F
	ldy $DEA4.w,X		; BC A4 DE
	ora $ECFFEE.l		; 0F EE FF EC
	ldy $36F1.w,X		; BC F1 36
	ldy $33.b,X		; B4 33
	jsr $F100.w		; 20 00 F1
	bit $20.b		; 24 20
	sbc $A4BB.w		; ED BB A4
	cmp ($31.b,S),Y		; D3 31
	asl $CEDB.w		; 0E DB CE
	cop $57.b		; 02 57
	eor ($A4.b),Y		; 51 A4
	sbc ($46.b),Y		; F1 46
	.db $62, $EB, $CD		; 62 EB CD
	dec $3E35.w		; CE 35 3E
	ldy $BB.b		; A4 BB
	ldx $0F02.w,Y		; BE 02 0F
	sbc ($0E.b)		; F2 0E
	cmp ($35.b),Y		; D1 35
	ldy $42.b		; A4 42
	ora ($25.b)		; 12 25
	and ($ED.b),Y		; 31 ED
	sbc $A42201.l		; EF 01 22 A4
	ora $9BA9.w,X		; 1D A9 9B
.ACCU 8
.INDEX 8
	sep #$75		; E2 75
	and $B4D0DE.l		; 2F DE D0 B4
	bit $32.b		; 24 32
	sbc $F3CB.w,X		; FD CB F3
	eor ($FE.b,X)		; 41 FE
	ora $34E0A4.l		; 0F A4 E0 34
	.db $42, $FC		; 42 FC
	cmp $BA7247.l		; CF 47 72 BA
	ldy $C2.b		; A4 C2
	jsr $2D13.w		; 20 13 2D
	tsx		; BA
	bne  50.b		; D0 32
	sbc $CFA4.w,X		; FD A4 CF
	bit $1E.b,X		; 34 1E
	cpx #$22.b		; E0 22
	ora ($57.b,X)		; 01 57
	adc ($B0.b,X)		; 61 B0
	adc ($F0.b,X)		; 61 F0
	and $54.b,X		; 35 54
	jsr L0029EC.w		; 20 EC A9
	ldy $33B4.w		; AC B4 33
	asl $00F0.w		; 0E F0 00
	ora ($30.b)		; 12 30
	inc $B4CB.w		; EE CB B4
	sbc $52.b,S		; E3 52
	sbc $11E0FF.l,X		; FF FF E0 11
	and ($1E.b),Y		; 31 1E
	ldy $D0.b		; A4 D0
	eor [$72.b],Y		; 57 72
	lda $4EE4.w,Y		; B9 E4 4E
	cmp $DCA40F.l		; CF 0F A4 DC
	dec $1E03.w		; CE 03 1E
	sbc $F00012.l		; EF 12 00 F0
	ldy $23.b		; A4 23
	and $56.b,S		; 23 56
	and $43F2CC.l,X		; 3F CC F2 43
	asl $FEA4.w		; 0E A4 FE
	dex		; CA
	ldy $75E3.w		; AC E3 75
	cpx $10E0.w		; EC E0 10
	bcs -32.b		; B0 E0
	and $53.b,X		; 35 53
	sbc #$9C.b		; E9 9C
	and $42.b		; 25 42
	asl $02A4.w		; 0E A4 02
	ora ($12.b),Y		; 11 12
	sbc $46D0.w,X		; FD D0 46
	eor $16A4AB.l,X		; 5F AB A4 16
	lsr $1FE0.w		; 4E E0 1F
	jmp.w [$23DF]		; DC DF 23
	jsr ($B0A4.w,X)		; FC A4 B0
	lsr $2E.b,X		; 56 2E
	plb		; AB
	ora ($11.b,X)		; 01 11
	rol $61.b,X		; 36 61
	ldy $DA.b		; A4 DA
	cmp ($55.b,S),Y		; D3 55
	asl $DDCC.w,X		; 1E CC DD
	cpy $B406.w		; CC 06 B4
	eor ($FE.b)		; 52 FE
	sbc $1103F0.l,X		; FF F0 03 11
	jsr ($B4CD.w,X)		; FC CD B4
	and $41.b,X		; 35 41
	sbc $01EF.w		; ED EF 01
	ora ($22.b)		; 12 22
	sbc $F1B4.w,X		; FD B4 F1
	bit $1E.b,X		; 34 1E
	cmp $1F13.w		; CD 13 1F
	ora ($1F.b,X)		; 01 1F
	ldy $DB.b		; A4 DB
	dec $0C12.w		; CE 12 0C
	cmp $CD2E23.l,X		; DF 23 2E CD
	ldy $11.b		; A4 11
	ora ($56.b)		; 12 56
	bvc -34.b		; 50 DE
	sbc ($32.b)		; F2 32
	asl $33B0.w		; 0E B0 33
	ora $42D2CA.l,X		; 1F CA D2 42
	jsr ($BCCC.w,X)		; FC CC BC
	ldy $33.b,X		; B4 33
	and $56C1DB.l		; 2F DB C1 56
	rol $01DE.w		; 2E DE 01
	ldy $12.b,X		; B4 12
	and $20.b,S		; 23 20
	cpy $42F2.w		; CC F2 42
	cpx $A4C0.w		; EC C0 A4
	.db $62, $F0, $32		; 62 F0 32
	sbc $02BD.w,X		; FD BD 02
	and $24A4CC.l		; 2F CC A4 24
	.db $42, $0E		; 42 0E
	beq -19.b		; F0 ED
	tsb $74.b		; 04 74
	nop		; EA
	ldy $D0.b,X		; B4 D0
	ora ($10.b,S),Y		; 13 10
	beq  15.b		; F0 0F
	inc $5204.w		; EE 04 52
	ldy $ED.b,X		; B4 ED
	sbc $2F11FF.l		; EF FF 11 2F
	cpx $37BE.w		; EC BE 37
	ldy $40.b,X		; B4 40
	cmp $22E0.w,X		; DD E0 22
	and $42.b,S		; 23 42
	jsr ($B0D1.w,X)		; FC D1 B0
	eor [$73.b],Y		; 57 73
	cpx $0FE0.w		; EC E0 0F
	sbc $A4BAED.l		; EF ED BA A4
	trb $3F.b		; 14 3F
	wai		; CB
	pea $2F66.w		; F4 66 2F
	cop $0D.b		; 02 0D
	bcs   0.b		; B0 00
	rol $74.b,X		; 36 74
	ora $21E0.w		; 0D E0 21
	ora $DDB4FE.l		; 0F FE B4 DD
	ora $53.b,S		; 03 53
	asl $11EF.w		; 0E EF 11
	and ($1F.b,X)		; 21 1F
	ldy $DB.b,X		; B4 DB
	ldx $4047.w,Y		; BE 47 40
	jmp.w [$12DF]		; DC DF 12
	and ($B4.b)		; 32 B4
	eor ($ED.b,X)		; 41 ED
	sbc ($43.b)		; F2 43
	jsr ($21BF.w,X)		; FC BF 21
	ora ($B4.b),Y		; 11 B4
	and ($FD.b,X)		; 21 FD
	cmp $2F13.w,X		; DD 13 2F
	cpy $34E1.w		; CC E1 34
	ldy $2E.b		; A4 2E
	ora $0B.b,S		; 03 0B
	cmp ($77.b),Y		; D1 77
	eor $26AD.w,X		; 5D AD 26
	ldy $20.b,X		; B4 20
	dec $DEFD.w,X		; DE FD DE
	bit $52.b		; 24 52
	sbc $B4EE.w,X		; FD EE B4
	ora ($20.b,X)		; 01 20
	ora $57D1DB.l		; 0F DB D1 57
	bmi -36.b		; 30 DC
	ldy $D0.b,X		; B4 D0
	and $34.b,S		; 23 34
	rol $04CC.w,X		; 3E CC 04
	.db $42, $EB		; 42 EB
	ldy $AE.b,X		; B4 AE
	ora ($24.b),Y		; 11 24
	jsr $CEEB.w		; 20 EB CE
	and $30.b,X		; 35 30
	ldy $CC.b,X		; B4 CC
	cmp ($33.b),Y		; D1 33
	jsl $E2EC00.l		; 22 00 EC E2
	eor $B0.b,S		; 43 B0
	eor ($ED.b)		; 52 ED
	sbc ($33.b)		; F2 33
	ora $F39BCA.l,X		; 1F CA 9B F3
	ldy $41.b,X		; B4 41
	cmp $22E1.w,X		; DD E1 22
	and $05ACED.l		; 2F ED AC 05
	ldy $63.b,X		; B4 63
	sbc $F2BC.w,X		; FD BC F2
	and ($43.b,S),Y		; 33 43
	asl $B4D0.w,X		; 1E D0 B4
	and $40.b		; 25 40
	tyx		; BB
	cmp $1F3400.l		; CF 00 34 1F
	cpy $A0A4.w		; CC A4 A0
	lsr $1C.b,X		; 56 1C
	txs		; 9A
	pea $5666.w		; F4 66 56
	lsr $DFB4.w		; 4E B4 DF
	ora ($42.b,S),Y		; 13 42
	stp		; DB
	sbc ($32.b,X)		; E1 32
	asl $B4DC.w		; 0E DC B4
	ldy $5513.w,X		; BC 13 55
	rol $03BC.w		; 2E BC 03
	mvp $B4,$20		; 44 20 B4
	dex		; CA
	cpy #$46.b		; C0 46
	rti		; 40

	jmp.w [$03AE]		; DC AE 03
	mvp $30,$B4		; 44 B4 30
	jmp.w [$54E1]		; DC E1 54
	trb $F1BD.w		; 1C BD F1
	ora ($B4.b,S),Y		; 13 B4
	eor $FC.b,S		; 43 FC
	ldx $4214.w,Y		; BE 14 42
	cpx $02BD.w		; EC BD 02
	bcs -31.b		; B0 E1
	eor $3F.b		; 45 3F
	lda $32B0.w,Y		; B9 B0 32
	sbc $B4E1.w,X		; FD E1 B4
	and ($0F.b,S),Y		; 33 0F
	ldy $34D1.w,X		; BC D1 34
	eor ($FD.b)		; 52 FD
	lda $03B4.w,X		; BD B4 03
	eor ($FC.b,X)		; 41 FC
	ldy $6305.w,X		; BC 05 63
	asl $B4CB.w		; 0E CB B4
	sbc ($34.b,X)		; E1 34
	eor ($FD.b)		; 52 FD
	cpx #$25.b		; E0 25
	rti		; 40

	wai		; CB
	ldy $DF.b,X		; B4 DF
	beq  52.b		; F0 34
	asl $C0DB.w,X		; 1E DB C0
	mvp $B0,$20		; 44 20 B0
	ora $ACA9.w		; 0D A9 AC
	pea $3F77.w		; F4 77 3F
	sbc ($45.b,X)		; E1 45
	ldy $DE.b,X		; B4 DE
	sbc ($22.b),Y		; F1 22
	ora $03ADFD.l		; 0F FD AD 03
	eor $B4.b,X		; 55 B4
	bmi -36.b		; 30 DC
	cpx #$23.b		; E0 23
	jsr $C1CB.w		; 20 CB C1
	lsr $B4.b,X		; 56 B4
	bmi -37.b		; 30 DB
	lda $5513.w,X		; BD 13 55
	and $B4F3BC.l,X		; 3F BC F3 B4
	mvn $BC,$1D		; 54 1D BC
	cpx #$14.b		; E0 14
	eor ($EC.b,S),Y		; 53 EC
	ldy $14B4.w		; AC B4 14
	eor ($FC.b),Y		; 51 FC
	dec $2302.w		; CE 02 23
	.db $42, $0D		; 42 0D
	ldy $D1.b,X		; B4 D1
	bit $0C.b,X		; 34 0C
	cmp $0E3122.l		; CF 22 31 0E
	dex		; CA
	ldy $C0.b,X		; B4 C0
	and $43.b		; 25 43
	tsb $24DE.w		; 0C DE 24
	jsl $ADB4FB.l		; 22 FB B4 AD
	and $63.b		; 25 63
	ora $E1BB.w		; 0D BB E1
	and $43.b,X		; 35 43
	ldy $FB.b,X		; B4 FB
	cmp $CB4135.l		; CF 35 41 CB
	dec $4601.w,X		; DE 01 46
	ldy $2F.b,X		; B4 2F
	tax		; AA
	rep #$45		; C2 45
	rol $CFDA.w,X		; 3E DA CF
	and $B4.b,S		; 23 B4
	lsr $3F.b		; 46 3F
	ldy $41F4.w,X		; BC F4 41
	jmp.w [$34D1]		; DC D1 34
	ldy $21.b,X		; B4 21
	cpx $F2AC.w		; EC AC F2
	eor $31.b,X		; 55 31
	jmp.w [$B4D2]		; DC D2 B4
	and ($0D.b)		; 32 0D
	ldy $65F3.w,X		; BC F3 65
	and $B4BEDC.l,X		; 3F DC BE B4
	and $55.b,S		; 23 55
	ora $13BD.w,X		; 1D BD 13
	eor ($0C.b,S),Y		; 53 0C
	cmp $DEB4.w,X		; DD B4 DE
	rol $42.b		; 26 42
	stp		; DB
	ldx $4224.w		; AE 24 42
	asl $CBB4.w		; 0E B4 CB
	cpx #$34.b		; E0 34
	.db $62, $FC, $E1		; 62 FC E1
	and ($0C.b,S),Y		; 33 0C
	ldy $D0.b,X		; B4 D0
	ora ($22.b),Y		; 11 22
	rol $DFCB.w		; 2E CB DF
	bit $42.b,X		; 34 42
	ldy $1E.b,X		; B4 1E
	cpx #$00.b		; E0 00
	inc $F3BC.w,X		; FE BC F3
	lsr $31.b,X		; 56 31
	ldy $EB.b,X		; B4 EB
	lda $5513.w,X		; BD 13 55
	and $44E2BB.l,X		; 3F BB E2 44
	ldy $1E.b,X		; B4 1E
	sbc $04DD.w		; ED DD 04
	eor ($FC.b,S),Y		; 53 FC
	lda $B003.w,X		; BD 03 B0
	ora $43.b,S		; 03 43
	ora $ADA9.w,X		; 1D A9 AD
	ora ($32.b,S),Y		; 13 32
	ora ($B0.b)		; 12 B0
	lsr $40.b,X		; 56 40
	jmp.w [$24E0]		; DC E0 24
	eor ($FB.b,S),Y		; 53 FB
	plb		; AB
	ldy $23.b,X		; B4 23
	and ($FF.b,X)		; 21 FF
	brk $10.b		; 00 10
	sbc $03BB.w,X		; FD BB 03
	ldy $54.b,X		; B4 54
	and ($FC.b,X)		; 21 FC
	dec $4514.w		; CE 14 45
	rol $B0CC.w		; 2E CC B0
	bne  52.b		; D0 34
	and ($32.b,S),Y		; 33 32
	nop		; EA
	lda $B05157.l		; AF 57 51 B0
	stp		; DB
	plb		; AB
	sbc ($33.b,X)		; E1 33
	and $F19BB9.l		; 2F B9 9B F1
	ldy $12.b		; A4 12
	bit $40.b,X		; 34 40
	ldy $0FDF.w,X		; BC DF 0F
	and $3E.b,X		; 35 3E
	bcs  -4.b		; B0 FC
	tax		; AA
	bne  17.b		; D0 11
	ora ($11.b,X)		; 01 11
	ora $BEB4EB.l		; 0F EB B4 BE
	and $43.b		; 25 43
	ora ($EC.b),Y		; 11 EC
	bne  51.b		; D0 33
	eor $B4.b,S		; 43 B4
	asl $02CD.w,X		; 1E CD 02
	and $DD1EEF.l		; 2F EF 1E DD
	ora $A0.b,X		; 15 A0
	ror $1E.b,X		; 76 1E
	ora $0C.b,S		; 03 0C
	plb		; AB
	pea $FA63.w		; F4 63 FA
	ldy $E0.b,X		; B4 E0
	bpl   2.b		; 10 02
	mvn $BE,$0C		; 54 0C BE
	ora ($11.b)		; 12 11
	ldy $43.b		; A4 43
	tsb $24CE.w		; 0C CE 24
	bvc -51.b		; 50 CD
	sbc ($2E.b)		; F2 2E
	ldy $FE.b,X		; B4 FE
	stp		; DB
	cmp ($55.b,X)		; C1 55
	rti		; 40

	asl $03CD.w		; 0E CD 03
	cpy #$02.b		; C0 02
	mvp $11,$32		; 44 32 11
	and $1F.b,S		; 23 1F
	sbc $CFB400.l		; EF 00 B4 CF
	and ($FC.b,S),Y		; 33 FC
	sbc ($42.b,X)		; E1 42
	sbc $13D0.w,X		; FD D0 13
	ldy $10.b,X		; B4 10
	sbc $13FF00.l,X		; FF 00 FF 13
	eor $FC.b,S		; 43 FC
	cmp $1011A4.l		; CF A4 11 10
	trb $2E.b		; 14 2E
	lda $CD4E47.l,X		; BF 47 4E CD
	ldy $01.b,X		; B4 01
	sbc $15BCDD.l,X		; FF DD BC 15
	eor ($11.b)		; 52 11
	ora $CFB4.w		; 0D B4 CF
	and $43.b,S		; 23 43
	rol $13E0.w		; 2E E0 13
	ora $B0CE.w		; 0D CE B0
	beq -38.b		; F0 DA
	cmp ($41.b,X)		; C1 41
	cmp #$BF.b		; C9 BF
	bit $20.b,X		; 34 20
	ldy $E1.b,X		; B4 E1
	ora ($10.b),Y		; 11 10
	bpl  -4.b		; 10 FC
	cmp ($45.b),Y		; D1 45
	ora $DBB0.w,X		; 1D B0 DB
	lda $02EF.w,X		; BD EF 02
	eor $1F.b,S		; 43 1F
	cop $56.b		; 02 56
	ldy $FF.b,X		; B4 FF
	ora ($FE.b),Y		; 11 FE
	cmp $F4BB.w,X		; DD BB F4
	adc $0E.b,S		; 63 0E
	ldy $1D.b		; A4 1D
	plb		; AB
	and $77.b,X		; 35 77
	adc ($DD.b)		; 72 DD
	and $5D.b,X		; 35 5D
	ldy $BC.b,X		; B4 BC
	ora $1D.b,S		; 03 1D
	cmp ($3F.b),Y		; D1 3F
	cpy $51F4.w		; CC F4 51
	ldy $FE.b,X		; B4 FE
	cpx #$11.b		; E0 11
	ora $EF2001.l		; 0F 01 20 EF
	bit $B0.b		; 24 B0
	adc $1E.b,X		; 75 1E
	sbc ($20.b),Y		; F1 20
	jmp.w [$0FE0]		; DC E0 0F
	beq -76.b		; F0 B4
	and ($EF.b,X)		; 21 EF
	bit $1F.b		; 24 1F
	cmp $D3BB.w,X		; DD BB D3
	stz $A4.b		; 64 A4
	asl $AA0F.w		; 0E 0F AA
	asl $76.b		; 06 76
	and $55E2.w		; 2D E2 55
	ldy $1E.b,X		; B4 1E
	tyx		; BB
	sbc ($2E.b,S),Y		; F3 2E
	sep #$40		; E2 40
	tyx		; BB
	ora $B0.b,S		; 03 B0
	bit $2F.b		; 24 2F
	cpx #$11.b		; E0 11
	bpl  -2.b		; 10 FE
	sbc $35B4DC.l,X		; FF DC B4 35
	and $31F2CB.l,X		; 3F CB F2 31
	beq  34.b		; F0 22
	asl $01B4.w		; 0E B4 01
	jsl $1F010F.l		; 22 0F 01 1F
	sbc $C2BB.w		; ED BB C2
	bcs -64.b		; B0 C0
	sbc $C9EF.w,X		; FD EF C9
	stz $7705.w		; 9C 05 77
	.db $42, $B4		; 42 B4
	ora ($20.b,S),Y		; 13 20
	ldy $1D04.w,X		; BC 04 1D
	cpy #$41.b		; C0 41
	wai		; CB
	ldy $F4.b,X		; B4 F4
	eor ($FC.b,S),Y		; 53 FC
	cpx #$22.b		; E0 22
	ora $B01FFF.l		; 0F FF 1F B0
	dex		; CA
	cmp ($65.b,S),Y		; D3 65
	trb $EFBD.w		; 1C BD EF
	sbc $1FB403.l		; EF 03 B4 1F
	sbc ($21.b),Y		; F1 21
	sbc $DC2F13.l		; EF 13 2F DC
	dex		; CA
	ldy $C3.b,X		; B4 C3
	stz $ED.b		; 64 ED
	cop $FD.b		; 02 FD
	ora $33.b,S		; 03 33
	bmi -76.b		; 30 B4
	cop $22.b		; 02 22
	sbc $F4BB.w		; ED BB F4
	bmi -47.b		; 30 D1
	ora $04CCB4.l,X		; 1F B4 CC 04
	eor ($FD.b,S),Y		; 53 FD
	sbc ($32.b)		; F2 32
	ora $31B0FF.l		; 0F FF B0 31
	sbc $5204.w		; ED 04 52
	xba		; EB
	lda $AAEC.w,X		; BD EC AA
	ldy $33.b,X		; B4 33
	ora ($13.b),Y		; 11 13
	bmi -33.b		; 30 DF
	bit $2F.b		; 24 2F
	stp		; DB
	ldy $BB.b,X		; B4 BB
	tsb $40.b		; 04 40
	cmp $DF1F.w		; CD 1F DF
	bit $42.b		; 24 42
	ldy $FF.b,X		; B4 FF
	cop $44.b		; 02 44
	tsb $13AC.w		; 0C AC 13
	ora $B403.w		; 0D 03 B4
	and $25BD.w		; 2D BD 25
	rti		; 40

	cpy $3203.w		; CC 03 32
	ora $0FE0B4.l		; 0F B4 E0 0F
	cmp ($54.b,X)		; C1 54
	trb $22BF.w		; 1C BF 22
	sbc $C1A4.w,X		; FD A4 C1
	ror $10.b		; 66 10
	rol $4F.b		; 26 4F
	cpy #$56.b		; C0 56
	phd		; 0B
	ldy $CB.b,X		; B4 CB
	ldx $2D45.w		; AE 45 2D
	cpy #$1E.b		; C0 1E
	beq  52.b		; F0 34
	ldy $31.b,X		; B4 31
	sbc $DA4114.l,X		; FF 14 41 DA
	cpy #$30.b		; C0 30
	dec $32B4.w		; CE B4 32
	xba		; EB
.INDEX 16
	rep #$55		; C2 55
	ora $23CF.w,X		; 1D CF 23
	jsl $5555B0.l		; 22 B0 55 55
	and $2D66E1.l,X		; 3F E1 66 2D
	ldy $B4FF.w,X		; BC FF B4
	cpy $20F3.w		; CC F3 20
	ora ($32.b)		; 12 32
	sbc $B44204.l,X		; FF 04 42 B4
	sbc $C3BA.w		; ED BA C3
	adc $DD.b,S		; 63 DD
	brk $EC.b		; 00 EC
	ora $B0.b,S		; 03 B0
	ora $53.b		; 05 53
	ora ($57.b)		; 12 57
	stz $EA.b,X		; 74 EA
	bcs  47.b		; B0 2F
	bcs -48.b		; B0 D0
	and ($D9.b)		; 32 D9
	ldx $4047.w		; AE 47 40
	dec $B001.w,X		; DE 01 B0
	ora ($33.b)		; 12 33
	rol $D2BA.w		; 2E BA D2
	eor ($DB.b)		; 52 DB
	cmp ($B4.b),Y		; D1 B4
	ora $23D0.w,X		; 1D D0 23
	brk $24.b		; 00 24
	and $B403DC.l,X		; 3F DC 03 B4
	and $36ADEB.l		; 2F EB AD 36
	rol $3EC1.w		; 2E C1 3E
	bne -76.b		; D0 B4
	and $42.b,S		; 23 42
	ora $DB2013.l		; 0F 13 20 DB
	cpy #$B420.w		; C0 20 B4
	dec $0C35.w		; CE 35 0C
	lda $003024.l		; AF 24 30 00
	and ($B4.b)		; 32 B4
	inc $3102.w,X		; FE 02 31
	wai		; CB
	sbc $52.b,S		; E3 52
	stp		; DB
	cmp ($A4.b),Y		; D1 A4
	eor $4C379B.l,X		; 5F 9B 37 4C
.ACCU 16
	rep #$65		; C2 65
	and ($13.b),Y		; 31 13
	ldy $0F.b,X		; B4 0F
	inc $E4CB.w		; EE CB E4
	adc ($CC.b,X)		; 61 CC
	ora ($FE.b,S),Y		; 13 FE
	ldy $12.b,X		; B4 12
	.db $42, $10		; 42 10
	ora $30.b,S		; 03 30
	sbc $14BC.w		; ED BC 14
	bcs  12.b		; B0 0C
	stz $C900.w		; 9C 00 C9
	ldx $0E22.w		; AE 22 0E
	tsb $B0.b		; 04 B0
	mvn $24,$21		; 54 21 24
	eor $3FD2A9.l		; 4F A9 D2 3F
	tyx		; BB
	bcs -32.b		; B0 E0
	nop		; EA
	stz $1E23.w		; 9C 23 1E
	sbc ($55.b,S),Y		; F3 55
	lsr $B4.b,X		; 56 B4
	ora $C2DBED.l,X		; 1F ED DB C2
	adc $EB.b		; 65 EB
	sbc $1F.b,S		; E3 1F
	ldy $E2.b,X		; B4 E2
	eor $20.b,S		; 43 20
	sbc ($43.b)		; F2 43
	jsr ($F4AC.w,X)		; FC AC F4
	ldy $3E.b,X		; B4 3E
	cmp $F3DC11.l		; CF 11 DC F3
	adc $EC.b,S		; 63 EC
	pea $56B0.w		; F4 B0 56
	bmi   3.b		; 30 03
	adc $0C.b		; 65 0C
	cmp ($43.b),Y		; D1 43
	xba		; EB
	bcs -47.b		; B0 D1
	and $30F3BA.l		; 2F BA F3 30
	sbc $B41212.l		; EF 12 12 B4
	jsl $BFDBFD.l		; 22 FD DB BF
	lsr $3D.b		; 46 3D
	cpy #$B430.w		; C0 30 B4
	beq  35.b		; F0 23
	bmi -15.b		; 30 F1
	bit $0D.b,X		; 34 0D
	tsx		; BA
.ACCU 16
.INDEX 16
	rep #$B4		; C2 B4
	eor ($DC.b)		; 52 DC
	ora ($FC.b,S),Y		; 13 FC
	cmp ($44.b),Y		; D1 44
	and $43B4D2.l		; 2F D2 B4 43
	cpx $52D1.w		; EC D1 52
	stp		; DB
	rep #$42		; C2 42
	stp		; DB
	bcs -83.b		; B0 AD
	ora $42E2CB.l		; 0F CB E2 42
	brk $24.b		; 00 24
	lsr $B4.b,X		; 56 B4
	bpl  -3.b		; 10 FD
	jmp.w [$26AD]		; DC AD 26
	eor $B420BF.l,X		; 5F BF 20 B4
	sbc $014322.l,X		; FF 22 43 01
	bit $1E.b		; 24 1E
	tsx		; BA
	cmp ($B4.b,X)		; C1 B4
	mvn $E0,$FD		; 54 FD E0
	jsr ($35CE.w,X)		; FC CE 35
	eor ($E0.b,X)		; 41 E0
	ldy $35.b,X		; B4 35
	phd		; 0B
	lda $B02D35.l,X		; BF 35 2D B0
	ora ($EE.b),Y		; 11 EE
	ldy $F3.b,X		; B4 F3
	rti		; 40

	cpy $3005.w		; CC 05 30
	sbc $B41012.l		; EF 12 10 B4
	ora ($FE.b)		; 12 FE
	cmp $05AC.w,X		; DD AC 05
	adc ($CE.b),Y		; 71 CE
	ora ($B4.b)		; 12 B4
	inc $3312.w,X		; FE 12 33
	jsr $2F14.w		; 20 14 2F
	dex		; CA
	ldx $35B4.w		; AE B4 35
	ora $2EE1.w,X		; 1D E1 2E
	lda $4114.w,X		; BD 14 41
	ora $3E35B4.l		; 0F B4 35 3E
	ldy $3FF3.w,X		; BC F3 3F
	lda $B4DC21.l,X		; BF 21 DC B4
	sbc ($54.b,X)		; E1 54
	sbc $41F3.w		; ED F3 41
	sbc $B41212.l		; EF 12 12 B4
	ora ($0E.b),Y		; 11 0E
	cmp $E4BB.w,X		; DD BB E4
	adc $DD.b,S		; 63 DD
	cop $B4.b		; 02 B4
	inc $2302.w,X		; FE 02 23
	and ($24.b,X)		; 21 24
	and $B4ACCA.l,X		; 3F CA AC B4
	and $3F.b		; 25 3F
	bne  30.b		; D0 1E
	ldy $4214.w,X		; BC 14 42
	beq -76.b		; F0 B4
	and $3F.b		; 25 3F
	ldy $2FF3.w,X		; BC F3 2F
	dec $EB12.w,X		; DE 12 EB
	ldy $A1.b		; A4 A1
	adc [$3F.b],Y		; 77 3F
	asl $60.b,X		; 16 60
	ldy $4325.w,X		; BC 25 43
	ldy $1F.b,X		; B4 1F
	sbc $ABDD.w,X		; FD DD AB
	pea $FD63.w		; F4 63 FD
	jsl $02FEB4.l		; 22 B4 FE 02
	jsl $2E4421.l		; 22 21 44 2E
	dex		; CA
	sta $25B4.w,X		; 9D B4 25
	rol $0DE0.w		; 2E E0 0D
	cmp $3313.w		; CD 13 33
	ora ($B4.b)		; 12 B4
	bit $4F.b,X		; 34 4F
	wai		; CB
.ACCU 8
.INDEX 8
	sep #$3F		; E2 3F
	dec $EC00.w,X		; DE 00 EC
	ldy $91.b		; A4 91
	ror $33.b		; 66 33
	eor [$6F.b]		; 47 6F
	txy		; 9B
	ora ($45.b,S),Y		; 13 45
	ldy $31.b,X		; B4 31
	sbc $ABDB.w,X		; FD DB AB
	ora $51.b		; 05 51
	dec $B422.w,X		; DE 22 B4
	asl $2102.w		; 0E 02 21
	and ($44.b,X)		; 21 44
	rol $9CCA.w,X		; 3E CA 9C
	ldy $25.b,X		; B4 25
	and $CCFDE0.l		; 2F E0 FD CC
	trb $33.b		; 14 33
	cop $B4.b		; 02 B4
	and $31.b,X		; 35 31
	stp		; DB
	cpx #$20.b		; E0 20
	inc $EC01.w		; EE 01 EC
	ldy $BE.b,X		; B4 BE
	and $33.b,S		; 23 33
	bit $40.b,X		; 34 40
	jmp.w [$12E1]		; DC E1 12
	ldy $32.b,X		; B4 32
	sbc $ACDB.w,X		; FD DB AC
	ora $51.b,X		; 15 51
	cmp $FFB422.l,X		; DF 22 B4 FF
	ora ($22.b,X)		; 01 22
	ora ($34.b),Y		; 11 34
	rol $ADCA.w		; 2E CA AD
	ldy $24.b,X		; B4 24
	ora $CDFDF1.l		; 0F F1 FD CD
	tsb $42.b		; 04 42
	ora ($B4.b,X)		; 01 B4
	bit $30.b,X		; 34 30
	cmp $1E01.w,X		; DD 01 1E
	sbc $A4EC00.l		; EF 00 EC A4
	stz $5646.w,X		; 9E 46 56
	adc [$6F.b]		; 67 6F
	txy		; 9B
	trb $43.b		; 14 43
	ldy $10.b,X		; B4 10
	sbc $ADDC.w		; ED DC AD
	rol $3F.b		; 26 3F
	bne  49.b		; D0 31
	ldy $FF.b,X		; B4 FF
	cop $21.b		; 02 21
	jsl $BA1D44.l		; 22 44 1D BA
	ldx $43B4.w		; AE B4 43
	sbc $AEFC01.l,X		; FF 01 FC AE
	trb $32.b		; 14 32
	jsl $2D44B4.l		; 22 B4 44 2D
	ldx $1E23.w,Y		; BE 23 1E
	cmp $B4DCFF.l,X		; DF FF DC B4
	bne  35.b		; D0 23
	and ($34.b,S),Y		; 33 34
	rol $12CD.w		; 2E CD 12
	and $B4.b,S		; 23 B4
	and ($DD.b),Y		; 31 DD
	wai		; CB
	ldx $1E35.w		; AE 35 1E
	sbc ($31.b)		; F2 31
	ldy $EE.b,X		; B4 EE
	ora ($22.b,X)		; 01 22
	and $44.b,S		; 23 44
	tsb $B0BA.w		; 0C BA B0
	ldy $32.b,X		; B4 32
	sbc $BDFC11.l,X		; FF 11 FC BD
	and $42.b,S		; 23 42
	and $B4.b,S		; 23 B4
	eor ($EB.b,S),Y		; 53 EB
	cmp $EF0F43.l		; CF 43 0F EF
	sbc $B4CD.w,X		; FD CD B4
	sbc ($22.b),Y		; F1 22
	bit $54.b		; 24 54
	tsb $03AE.w		; 0C AE 03
	and $B4.b,S		; 23 B4
	and ($ED.b,X)		; 21 ED
	wai		; CB
	lda ($63.b),Y		; B1 63
	jsr ($31F2.w,X)		; FC F2 31
	ldy $FF.b,X		; B4 FF
	cop $21.b		; 02 21
	ora ($44.b,S),Y		; 13 44
	jsr ($D399.w,X)		; FC 99 D3
	ldy $40.b,X		; B4 40
	cpx #$21.b		; E0 21
	xba		; EB
	bcs  35.b		; B0 23
	and ($24.b,X)		; 21 24
	ldy $52.b,X		; B4 52
	xba		; EB
	ldx $0F34.w,Y		; BE 34 0F
	beq  -3.b		; F0 FD
	ldy $12B4.w,X		; BC B4 12
	and ($23.b,S),Y		; 33 23
	mvn $BD,$0C		; 54 0C BD
	ora ($22.b,S),Y		; 13 22
	ldy $0F.b,X		; B4 0F
	sbc $E4CA.w		; ED CA E4
	eor ($DD.b)		; 52 DD
	and $2F.b,S		; 23 2F
	ldy $F1.b,X		; B4 F1
	ora ($11.b)		; 12 11
	and $40.b,S		; 23 40
	nop		; EA
	plb		; AB
	pea $2FB4.w		; F4 B4 2F
.ACCU 8
	sep #$20		; E2 20
	cpy $31E1.w		; CC E1 31
	ora ($24.b),Y		; 11 24
	ldy $41.b,X		; B4 41
	xba		; EB
	cpy #$12.b		; C0 12
	sbc $CDFC00.l,X		; FF 00 FC CD
	ldy $12.b,X		; B4 12
	and $34.b,S		; 23 34
	mvn $CF,$FB		; 54 FB CF
	ora ($22.b)		; 12 22
	ldy $0F.b,X		; B4 0F
	cpx $05BB.w		; EC BB 05
	eor $1F24DE.l,X		; 5F DE 24 1F
	ldy $F0.b,X		; B4 F0
	jsl $3F3510.l		; 22 10 35 3F
	cmp #$9C.b		; C9 9C
	trb $B4.b		; 14 B4
	and $BC2EF3.l		; 2F F3 2E BC
	ora $31.b,S		; 03 31
	sbc ($35.b),Y		; F1 35
	ldy $3F.b,X		; B4 3F
	wai		; CB
.INDEX 8
	sep #$10		; E2 10
	sbc $CFEC00.l,X		; FF 00 EC CF
	ldy $22.b,X		; B4 22
	and ($44.b)		; 32 44
	eor ($FC.b)		; 52 FC
	cpy #$12.b		; C0 12
	jsr $FEB4.w		; 20 B4 FE
	jmp.w [$36BE]		; DC BE 36
	and $32D0.w		; 2D D0 32
	brk $B4.b		; 00 B4
	ora ($21.b),Y		; 11 21
	ora ($44.b),Y		; 11 44
	ora $ADB9.w		; 0D B9 AD
	and ($B4.b,S),Y		; 33 B4
	brk $23.b		; 00 23
	tsb $13BE.w		; 0C BE 13
	jsr $5402.w		; 20 02 54
	ldy $1D.b,X		; B4 1D
	ldy $1F02.w,X		; BC 02 1F
	beq  14.b		; F0 0E
	jmp.w [$B4E1]		; DC E1 B4
	and $32.b,S		; 23 32
	eor $30.b		; 45 30
	cmp $21F1.w		; CD F1 21
	ora $CBEEB4.l,X		; 1F B4 EE CB
	cmp ($54.b,X)		; C1 54
	sbc $21F3.w,X		; FD F3 21
	brk $B4.b		; 00 B4
	ora ($11.b)		; 12 11
	jsl $A9EB42.l		; 22 42 EB A9
	lda ($30.b),Y		; B1 30
	ldy $F1.b,X		; B4 F1
	eor $FB.b,S		; 43 FB
	bne  50.b		; D0 32
	bpl  35.b		; 10 23
	eor ($B4.b)		; 52 B4
	xba		; EB
	cmp $0F01.w		; CD 01 0F
	ora $02CC0E.l		; 0F 0E CC 02
	ldy $32.b,X		; B4 32
	bit $45.b,X		; 34 45
	and $2001CE.l		; 2F CE 01 20
	asl $EEB4.w		; 0E B4 EE
	tyx		; BB
	pea $DE51.w		; F4 51 DE
	jsl $B40121.l		; 22 21 01 B4
	ora ($11.b),Y		; 11 11
	bit $3F.b		; 24 3F
	wai		; CB
	tax		; AA
	sbc ($0E.b)		; F2 0E
	ldy $F3.b,X		; B4 F3
	and ($DD.b)		; 32 DD
	cop $30.b		; 02 30
	ora ($34.b,X)		; 01 34
	bmi -76.b		; 30 B4
	cpy $00CF.w		; CC CF 00
	beq   0.b		; F0 00
	sbc $13CE.w,X		; FD CE 13
	ldy $23.b,X		; B4 23
	bit $54.b,X		; 34 54
	sbc $21D0.w,X		; FD D0 21
	asl $B4FE.w		; 0E FE B4
	cpx $36AF.w		; EC AF 36
	and $32D0.w		; 2D D0 32
	jsr $B421.w		; 20 21 B4
	ora ($02.b),Y		; 11 02
	mvp $BA,$0D		; 44 0D BA
	lda $EE21.w		; AD 21 EE
	ldy $03.b,X		; B4 03
	rol $23E0.w		; 2E E0 23
	bpl   2.b		; 10 02
	eor ($1D.b,S),Y		; 53 1D
	cpy #$1F.b		; C0 1F
	sbc $EEEEEE.l,X		; FF EE EE EE
	wai		; CB
	tax		; AA
	cmp $33B4.w		; CD B4 33
	eor $30.b		; 45 30
	cmp $2013.w,X		; DD 13 20
	sbc $B4ED.w,X		; FD ED B4
	wai		; CB
	cpx $52.b		; E4 52
	jmp.w [$3102]		; DC 02 31
	ora ($21.b)		; 12 21
	ldy $10.b,X		; B4 10
	and $4F.b,S		; 23 4F
	jmp.w [$D2AA]		; DC AA D2
	and $31B4DF.l		; 2F DF B4 31
	inc $3203.w		; EE 03 32
	brk $34.b		; 00 34
	rti		; 40

	cpx $0FC0.w		; EC C0 0F
	inc $EEEE.w,X		; FE EE EE
	jmp.w [$ABBA]		; DC BA AB
	cmp $5434B4.l,X		; DF B4 34 54
	tsb $33D0.w		; 0C D0 33
	ora $B4DCED.l		; 0F ED DC B4
	bcs  84.b		; B0 54
	tsb $22E1.w		; 0C E1 22
	ora ($12.b),Y		; 11 12
	bpl -76.b		; 10 B4
	ora ($42.b,S),Y		; 13 42
	jsr ($BEBA.w,X)		; FC BA BE
	ora ($FF.b)		; 12 FF
	ora ($B4.b,S),Y		; 13 B4
	ora $22D0.w		; 0D D0 22
	and ($23.b,X)		; 21 23
	eor ($FD.b,S),Y		; 53 FD
	lda $CFA4.w,X		; BD A4 CF
	brk $12.b		; 00 12
	sbc $9DB9.w,X		; FD B9 9D
	and [$77.b],Y		; 37 77
	ldy $44.b,X		; B4 44
	rti		; 40

	sbc $EF1001.l		; EF 01 10 EF
	jmp.w [$B0BD]		; DC BD B0
	stz $BCFD.w,X		; 9E FD BC
	cpx #$12.b		; E0 12
	eor $55.b		; 45 55
	lsr $B4.b,X		; 56 B4
	mvp $CB,$1D		; 44 1D CB
	ldy $F0EE.w,X		; BC EE F0
	bit $2E.b,X		; 34 2E
	ldy $DF.b,X		; B4 DF
	cop $22.b		; 02 22
	ora ($45.b,S),Y		; 13 45
	ora $DECD.w,X		; 1D CD DE
	cpy #$DD.b		; C0 DD
	dec $DCFE.w,X		; DE FE DC
	tsx		; BA
	ldy $24E0.w,X		; BC E0 24
	ldy $40.b,X		; B4 40
	ora ($22.b,X)		; 01 22
	ora $ADDCED.l		; 0F ED DC AD
	eor $B4.b		; 45 B4
	ora $22D1.w		; 0D D1 22
	ora ($32.b),Y		; 11 32
	ora $B43401.l		; 0F 01 34 B4
	and $EDBECC.l		; 2F CC BE ED
	dec $3F24.w		; CE 24 3F
	beq -76.b		; F0 B4
	jsl $541201.l		; 22 01 12 54
	asl $EECE.w,X		; 1E CE EE
	dec $11B4.w,X		; DE B4 11
	asl $EEED.w,X		; 1E ED EE
	ora ($33.b,S),Y		; 13 33
	mvp $B4,$2F		; 44 2F B4
	sbc ($20.b),Y		; F1 20
	ora $BEDCEF.l		; 0F EF DC BE
	eor $0C.b		; 45 0C
	ldy $E2.b,X		; B4 E2
	jsl $1F3301.l		; 22 01 33 1F
	cmp ($34.b),Y		; D1 34
	rol $CBB4.w		; 2E B4 CB
	cmp $25BD0E.l		; CF 0E BD 25
	and $B433D0.l,X		; 3F D0 33 B4
	ora $1D5403.l		; 0F 03 54 1D
	dec $EDEE.w		; CE EE ED
	ora $B4.b,S		; 03 B4
	asl $E0DD.w,X		; 1E DD E0
	and $33.b,S		; 23 33
	mvp $E2,$2E		; 44 2E E2
	ldy $31.b,X		; B4 31
	inc $DCEF.w		; EE EF DC
	lda $E1FD45.l		; AF 45 FD E1
	ldy $32.b,X		; B4 32
	ora ($22.b)		; 12 22
	and $2E33FF.l		; 2F FF 33 2E
	dex		; CA
	ldy $CF.b,X		; B4 CF
	ora $3014BD.l,X		; 1F BD 14 30
	beq  51.b		; F0 33
	ora $5401B4.l		; 0F B4 01 54
	asl $EFCD.w,X		; 1E CD EF
	dec $1E03.w,X		; DE 03 1E
	cpy #$CB.b		; C0 CB
	ldy $01DF.w,X		; BC DF 01
	and $54.b,X		; 35 54
	bit $55.b,X		; 34 55
	ldy $FE.b,X		; B4 FE
	inc $C1DB.w		; EE DB C1
	eor ($DC.b,S),Y		; 53 DC
	sbc ($31.b)		; F2 31
	ldy $21.b,X		; B4 21
	jsl $33F210.l		; 22 10 F2 33
	ora $C0CA.w		; 0D CA C0
	ldy $1E.b,X		; B4 1E
	ldx $1E34.w,Y		; BE 34 1E
	sbc ($33.b),Y		; F1 33
	brk $02.b		; 00 02
	ldy $44.b,X		; B4 44
	asl $EDDE.w,X		; 1E DE ED
	cmp $0E13.w,X		; DD 13 0E
	cmp $F2B4.w		; CD B4 F2
	and ($34.b)		; 32 34
	eor ($FB.b,S),Y		; 53 FB
	cpx $41.b		; E4 41
	inc $EDB4.w		; EE B4 ED
	phx		; DA
	cmp ($62.b,S),Y		; D3 62
	jmp.w [$22F2]		; DC F2 22
	jsl $1022B4.l		; 22 B4 22 10
	sbc ($42.b)		; F2 42
	cpx $D1CA.w		; EC CA D1
	asl $BEB4.w,X		; 1E B4 BE
	eor $1E.b		; 45 1E
	cmp ($32.b),Y		; D1 32
	brk $14.b		; 00 14
	eor ($C0.b,S),Y		; 53 C0
	eor ($11.b,S),Y		; 53 11
	ora $EDDDDD.l		; 0F DD DD ED
	tsx		; BA
	plb		; AB
	ldy $33.b,X		; B4 33
	and $55.b,X		; 35 55
	xce		; FB
	cmp ($41.b,X)		; C1 41
	inc $B4EE.w,X		; FE EE B4
	stp		; DB
	sbc $52.b,S		; E3 52
	jmp.w [$2202]		; DC 02 22
	ora ($21.b)		; 12 21
	ldy $0F.b,X		; B4 0F
	cop $42.b		; 02 42
	jsr ($D1BB.w,X)		; FC BB D1
	ora $B4BF.w,X		; 1D BF B4
	and $1D.b,X		; 35 1D
	sbc ($22.b)		; F2 22
	beq  19.b		; F0 13
	eor ($FD.b,S),Y		; 53 FD
	ldy $CE.b,X		; B4 CE
	inc $12D0.w,X		; FE D0 12
	sbc $03CD.w,X		; FD CD 03
	and ($B4.b,S),Y		; 33 B4
	and ($64.b,S),Y		; 33 64
	tsb $21C0.w		; 0C C0 21
	inc $CBEE.w,X		; FE EE CB
	ldy $F4.b,X		; B4 F4
	eor ($CE.b),Y		; 51 CE
	jsl $202321.l		; 22 21 23 20
	inc $03B4.w,X		; FE B4 03
	.db $42, $ED		; 42 ED
	tsx		; BA
	sbc ($0C.b,X)		; E1 0C
	cpy #$44.b		; C0 44
	ldy $0F.b,X		; B4 0F
	ora $20.b,S		; 03 20
	sbc $FD4323.l,X		; FF 23 43 FD
	dec $DCB4.w,X		; DE B4 DC
	bne  51.b		; D0 33
	sbc $12CD.w,X		; FD CD 12
	and ($24.b,S),Y		; 33 24
	ldy $53.b,X		; B4 53
	inc $FF01.w,X		; FE 01 FF
	sbc $16BCED.l		; EF ED BC 16
	ldy $7D.b		; A4 7D
	stz $3445.w,X		; 9E 45 34
	and $54.b,X		; 35 54
	nop		; EA
	inc $B4.b,X		; F6 B4
	and ($EC.b),Y		; 31 EC
	ldy $EBF1.w,X		; BC F1 EB
	cmp ($43.b)		; D2 43
	asl $23B4.w		; 0E B4 23
	and $5124EF.l,X		; 3F EF 24 51
	inc $DCEE.w		; EE EE DC
	ldy $D1.b,X		; B4 D1
	and ($EC.b)		; 32 EC
	cmp $342313.l,X		; DF 13 23 34
	eor ($B4.b,X)		; 41 B4
	inc $0E11.w		; EE 11 0E
	inc $CEEC.w		; EE EC CE
	eor $1D.b		; 45 1D
	ldy $A0.b		; A4 A0
	mvn $44,$43		; 54 43 44
	eor ($EE.b,S),Y		; 53 EE
	and $2D.b		; 25 2D
	ldy $DB.b,X		; B4 DB
	lda $E3DA21.l		; AF 21 DA E3
	eor ($00.b,X)		; 41 00
	bit $B4.b		; 24 B4
	rol $34D0.w		; 2E D0 34
	bmi -33.b		; 30 DF
	sbc $B4D1DC.l,X		; FF DC D1 B4
	and ($DB.b),Y		; 31 DB
	sbc ($32.b,X)		; E1 32
	and ($35.b)		; 32 35
	and $21B4DF.l,X		; 3F DF B4 21
	inc $DBEE.w,X		; FE EE DB
.ACCU 16
	rep #$63		; C2 63
	cpx $B4F2.w		; EC F2 B4
	and ($12.b)		; 32 12
	jsl $311100.l		; 22 00 11 31
	sbc $B4BA.w,X		; FD BA B4
	lda ($40.b)		; B2 40
	cpy $21F3.w		; CC F3 21
	cop $33.b		; 02 33
	inc $E1B4.w,X		; FE B4 E1
	mvp $DE,$2E		; 44 2E DE
	sbc $1EF0DD.l,X		; FF DD F0 1E
	ldy $CD.b,X		; B4 CD
	ora $33.b,S		; 03 33
	and ($44.b,S),Y		; 33 44
	ora $B40EF0.l,X		; 1F F0 0E B4
	inc $CCED.w,X		; FE ED CC
	asl $4F.b		; 06 4F
	ldx $2222.w,Y		; BE 22 22
	ldy $23.b,X		; B4 23
	and ($FF.b,X)		; 21 FF
	and $3F.b,S		; 23 3F
	jmp.w [$E3AB]		; DC AB E3
	ldy $2E.b,X		; B4 2E
	lda $130023.l,X		; BF 23 00 13
	and ($EE.b)		; 32 EE
	tsb $B4.b		; 04 B4
	.db $42, $FD		; 42 FD
	bne  -3.b		; D0 FD
	cmp $CFFC00.l,X		; DF 00 FC CF
	ldy $33.b,X		; B4 33
	and ($35.b,S),Y		; 33 35
	eor ($EF.b,X)		; 41 EF
	ora ($EE.b,X)		; 01 EE
	sbc $CEECB4.l		; EF B4 EC CE
	lsr $0C.b,X		; 56 0C
	cmp ($23.b),Y		; D1 23
	ora ($23.b)		; 12 23
	ldy $10.b,X		; B4 10
	sbc ($33.b),Y		; F1 33
	asl $ACCB.w		; 0E CB AC
	ora ($FC.b,S),Y		; 13 FC
	ldy $E3.b,X		; B4 E3
	bmi   0.b		; 30 00
	jsl $24F020.l		; 22 20 F0 24
	and $FFDEB4.l,X		; 3F B4 DE FF
	sbc $1FD0.w		; ED D0 1F
	stp		; DB
.ACCU 8
.INDEX 8
	sep #$33		; E2 33
	ldy $32.b,X		; B4 32
	mvp $E1,$3F		; 44 3F E1
	jsr $EEEE.w		; 20 EE EE
	wai		; CB
	ldy $E4.b,X		; B4 E4
	eor ($CD.b),Y		; 51 CD
	ora $21.b,S		; 03 21
	jsl $B40F22.l		; 22 22 0F B4
	and $40.b,S		; 23 40
	cmp $C0BB.w,X		; DD BB C0
	rol $23DF.w		; 2E DF 23
	ldy $10.b,X		; B4 10
	sbc ($22.b)		; F2 22
	sbc $0C4412.l,X		; FF 12 44 0C
	cmp $EE0FB4.l		; CF B4 0F EE
	sbc ($FE.b,X)		; E1 FE
	lda $3204.w,X		; BD 04 32
	and ($B4.b,S),Y		; 33 B4
	mvn $00,$0E		; 54 0E 00
	asl $EDEE.w		; 0E EE ED
	dec $B436.w		; CE 36 B4
	bit $23C0.w		; 2C C0 23
	ora ($34.b),Y		; 11 34
	rol $44D0.w		; 2E D0 44
	ldy $2D.b,X		; B4 2D
	jmp.w [$F1BD]		; DC BD F1
	cpx $3103.w		; EC 03 31
	ora ($B4.b,X)		; 01 B4
	and $1E.b,S		; 23 1E
	bne  36.b		; D0 24
	eor ($ED.b,X)		; 41 ED
	cmp $E0B4EE.l,X		; DF EE B4 E0
	bpl -21.b		; 10 EB
	bne  51.b		; D0 33
	jsl $B44134.l		; 22 34 41 B4
	brk $0F.b		; 00 0F
	inc $DBEE.w		; EE EE DB
	pea $CC52.w		; F4 52 CC
	ldy $02.b,X		; B4 02
	jsl $FC4312.l		; 22 12 43 FC
	sbc ($42.b,S),Y		; F3 42
	sbc $BBB4.w		; ED B4 BB
.INDEX 8
	sep #$1D		; E2 1D
	cpy #$32.b		; C0 32
	ora ($12.b),Y		; 11 12
	eor ($B4.b,X)		; 41 B4
	jmp.w [$43F2]		; DC F2 43
	asl $FEEE.w,X		; 1E EE FE
	dec $B402.w,X		; DE 02 B4
	ora $13CE.w		; 0D CE 13
	jsl $104322.l		; 22 22 43 10
	bpl -76.b		; 10 B4
	inc $DCED.w,X		; FE ED DC
	cmp ($55.b,X)		; C1 55
	cpx $32D1.w		; EC D1 32
	ldy $12.b,X		; B4 12
	mvp $D0,$1D		; 44 1D D0
	mvp $CB,$FD		; 44 FD CB
	lda ($B4.b),Y		; B1 B4
	and ($CD.b),Y		; 31 CD
	trb $20.b		; 14 20
	sbc ($34.b)		; F2 34
	tsb $B4C0.w		; 0C C0 B4
	bit $3F.b,X		; 34 3F
	cmp $F2DDFE.l,X		; DF FE DD F2
	and $F5A4CB.l,X		; 3F CB A4 F5
	eor ($34.b,S),Y		; 53 34
	adc [$63.b]		; 67 63
	brk $EC.b		; 00 EC
	tyx		; BB
	ldy $DC.b,X		; B4 DC
	lda $D11C46.l,X		; BF 46 1C D1
	and ($11.b)		; 32 11
	bit $B4.b,X		; 34 B4
	and $1E34BE.l,X		; 3F BE 34 1E
	stp		; DB
	lda $B4DC32.l,X		; BF 32 DC B4
	ora $31.b,S		; 03 31
	sbc ($34.b),Y		; F1 34
	and $24BF.w		; 2D BF 24
	bmi -76.b		; 30 B4
	cmp $E1DCFF.l,X		; DF FF DC E1
	bmi -36.b		; 30 DC
.ACCU 8
.INDEX 8
	sep #$32		; E2 32
	ldy $12.b,X		; B4 12
	bit $22.b		; 24 22
	bpl  14.b		; 10 0E
	sbc $BCEC.w		; ED EC BC
	ldy $36.b,X		; B4 36
	and $23CF.w,X		; 3D CF 23
	and ($34.b,X)		; 21 34
	rti		; 40

	ldy $15B4.w,X		; BC B4 15
	and $22BCDC.l,X		; 3F DC BC 22
	cpx $32F3.w		; EC F3 32
	bcs  -1.b		; B0 FF
	ora $76.b,X		; 15 76
	and $527714.l		; 2F 14 77 52
	ora ($C0.b),Y		; 11 C0
	asl $DECC.w		; 0E CC DE
	stp		; DB
	ldy $F0EF.w,X		; BC EF F0
	ora ($B4.b,S),Y		; 13 B4
	and ($11.b)		; 32 11
	asl $DDED.w		; 0E ED DD
	ldy $4D26.w,X		; BC 26 4D
	ldy $CE.b,X		; B4 CE
	and $21.b,S		; 23 21
	bit $52.b		; 24 52
	dex		; CA
	trb $30.b		; 14 30
	ldy $DC.b,X		; B4 DC
	lda $EB12.w,X		; BD 12 EB
	sbc $32.b,S		; E3 32
	bpl  36.b		; 10 24
	ldy $30.b,X		; B4 30
	cmp $4015.w		; CD 15 40
	dec $EDE0.w,X		; DE E0 ED
	cmp $CADDC0.l		; CF C0 DD CA
	plb		; AB
	cmp $452301.l,X		; DF 01 23 45
	eor $B4.b,X		; 55 B4
	bpl -19.b		; 10 ED
	cmp $F5BB.w,X		; DD BB F5
	bvc -66.b		; 50 BE
	ora ($B4.b)		; 12 B4
	jsl $FD4312.l		; 22 12 43 FD
	tsb $30.b		; 04 30
	jmp.w [$B4BC]		; DC BC B4
	ora ($FB.b,X)		; 01 FB
	cmp ($42.b),Y		; D1 42
	jsr $3222.w		; 20 22 32
	sbc $5623C0.l		; EF C0 23 56
	.db $42, $10		; 42 10
	asl $CDDC.w		; 0E DC CD
	wai		; CB
	ldy $B1.b		; A4 B1
	ror $54.b		; 66 54
	eor $64.b,X		; 55 64
	ora ($32.b),Y		; 11 32
	xba		; EB
	ldy $DD.b,X		; B4 DD
	phx		; DA
	cmp ($62.b)		; D2 62
	stp		; DB
	cop $31.b		; 02 31
	jsl $1D24B4.l		; 22 B4 24 1D
.INDEX 8
	sep #$53		; E2 53
	sbc $EFCB.w		; ED CB EF
	tsb $BFB4.w		; 0C B4 BF
	bit $20.b,X		; 34 20
	cop $32.b		; 02 32
	ora $B44412.l		; 0F 12 44 B4
	ora $EECE.w		; 0D CE EE
	dec $0D10.w		; CE 10 0D
	ldx $B424.w,Y		; BE 24 B4
	and ($23.b)		; 32 23
	and ($20.b,S),Y		; 33 20
	ora ($FE.b)		; 12 FE
	cmp $B4DC.w,X		; DD DC B4
	bcs  84.b		; B0 54
	xce		; FB
	cmp ($32.b),Y		; D1 32
	and ($33.b,X)		; 21 33
	and $44D1B4.l		; 2F B4 D1 44
	ora $CECD.w		; 0D CD CE
	ora $24BD.w		; 0D BD 24
	ldy $3F.b,X		; B4 3F
	ora ($33.b,X)		; 01 33
	bpl   1.b		; 10 01
	mvp $DD,$3E		; 44 3E DD
	ldy $EE.b,X		; B4 EE
	cmp $1EF1.w		; CD F1 1E
	cpy $42F3.w		; CC F3 42
	and ($B4.b)		; 32 B4
	bit $10.b,X		; 34 10
	ora $20.b,S		; 03 20
	cmp $ACDD.w,X		; DD DD AC
	rol $B4.b		; 26 B4
	bit $22C0.w		; 2C C0 22
	jsl $F02112.l		; 22 12 21 F0
	bit $B4.b,X		; 34 B4
	and $FECDCC.l		; 2F CC CD FE
	cpy $41F3.w		; CC F3 41
	ora ($C0.b,X)		; 01 C0
	ora ($22.b,X)		; 01 22
	ora ($34.b)		; 12 34
	ror $53.b		; 66 53
	and ($FE.b,X)		; 21 FE
	ldy $D0.b,X		; B4 D0
	ora $43E1DB.l,X		; 1F DB E1 43
	and $34.b,S		; 23 34
	bmi -76.b		; 30 B4
	sbc ($30.b)		; F2 30
	sbc $BBDD.w,X		; FD DD BB
	sbc $4F.b,X		; F5 4F
	ldx $12B4.w,Y		; BE B4 12
	jsl $FF3122.l		; 22 22 31 FF
	trb $40.b		; 14 40
	cpx $CCB4.w		; EC B4 CC
	sbc $42E1DB.l		; EF DB E1 42
	beq  35.b		; F0 23
	bmi -76.b		; 30 B4
	brk $23.b		; 00 23
	eor ($FD.b)		; 52 FD
	inc $EEDD.w		; EE DD EE
	bpl -76.b		; 10 B4
	xba		; EB
	bne  51.b		; D0 33
	and ($33.b)		; 32 33
	eor ($F1.b,X)		; 41 F1
	and ($B4.b),Y		; 31 B4
	sbc $CBDE.w,X		; FD DE CB
	cmp ($51.b,S),Y		; D3 51
	cpy $3102.w		; CC 02 31
	ldy $22.b,X		; B4 22
	and ($0D.b)		; 32 0D
	ora $52.b,S		; 03 52
	jsr ($DECD.w,X)		; FC CD DE
	ldy $EC.b,X		; B4 EC
	cmp ($43.b,X)		; C1 43
	ora $003112.l		; 0F 12 31 00
	ora ($B4.b)		; 12 B4
	mvp $DE,$1E		; 44 1E DE
	sbc $00DE.w		; ED DE 00
	sbc $A4CE.w,X		; FD CE A4
	eor [$54.b]		; 47 54
	eor [$75.b]		; 47 75
	bpl  51.b		; 10 33
	jsr ($B4AB.w,X)		; FC AB B4
	stp		; DB
.INDEX 16
	rep #$53		; C2 53
	stp		; DB
	sbc ($22.b)		; F2 22
	jsl $0DB433.l		; 22 33 B4 0D
	sep #$44		; E2 44
	ora $EECC.w		; 0D CC EE
	jsr ($A4B0.w,X)		; FC B0 A4
	adc [$2F.b]		; 67 2F
	ora $54.b,X		; 15 54
	inc $6703.w		; EE 03 67
	rol $EEB4.w,X		; 3E B4 EE
	inc $F1DD.w,X		; FE DD F1
	sbc $23CE.w,X		; FD CE 23
	jsl $3313B4.l		; 22 B4 13 33
	ora ($11.b),Y		; 11 11
	asl $DCED.w		; 0E ED DC
	lda ($B4.b),Y		; B1 B4
	mvn $E1,$EB		; 54 EB E1
	and ($22.b)		; 32 22
	bit $1D.b,X		; 34 1D
	cmp ($B4.b,X)		; C1 B4
	mvp $CC,$1E		; 44 1E CC
	cmp $33BEFD.l,X		; DF FD BE 33
	and ($C0.b,X)		; 21 C0
	beq  35.b		; F0 23
	and ($11.b,X)		; 21 11
	and $54.b,X		; 35 54
	and ($10.b)		; 32 10
	ldy $DD.b,X		; B4 DD
	beq  -3.b		; F0 FD
	dec W34SEL.w		; CE 24 21
	ora ($33.b,S),Y		; 13 33
	ldy $21.b,X		; B4 21
	ora ($FF.b),Y		; 11 FF
	dec $C0DB.w,X		; DE DB C0
	stz $EB.b		; 64 EB
	ldy $D2.b,X		; B4 D2
	and $12.b,S		; 23 12
	bit $2D.b,X		; 34 2D
	cmp $B41E45.l		; CF 45 1E B4
	wai		; CB
	bne  14.b		; D0 0E
	lda $3024.w,X		; BD 24 30
	cop $32.b		; 02 32
	cpy #$1131.w		; C0 31 11
	bit $54.b		; 24 54
	and ($10.b,X)		; 21 10
	sbc $B4DD.w,X		; FD DD B4
	ora $03CE.w,X		; 1D CE 03
	and ($22.b),Y		; 31 22
	and ($21.b,S),Y		; 33 21
	brk $B4.b		; 00 B4
	ora $BFDBEE.l		; 0F EE DB BF
	lsr $FB.b,X		; 56 FB
	bne  51.b		; D0 33
	ldy $12.b,X		; B4 12
	bit $4E.b,X		; 34 4E
	ldx $2E35.w,Y		; BE 35 2E
	wai		; CB
	bne -76.b		; D0 B4
	ora $3014BC.l,X		; 1F BC 14 30
	ora ($34.b,X)		; 01 34
	ora $B4D0.w,X		; 1D D0 B4
	bit $3F.b,X		; 34 3F
	dec $ECFF.w,X		; DE FF EC
	sbc ($1E.b,X)		; E1 1E
	cmp $ACC0.w		; CD C0 AC
	sbc $5524F1.l		; EF F1 24 55
	mvn $10,$32		; 54 32 10
	ldy $EC.b,X		; B4 EC
	lda $C01B56.l,X		; BF 56 1B C0
	and ($12.b)		; 32 12
	and $B4.b		; 25 B4
	and $3E34BD.l,X		; 3F BD 34 3E
	phx		; DA
	cpy #$BB30.w		; C0 30 BB
	cpy #$EFAC.w		; C0 AC EF
	beq  19.b		; F0 13
	and ($00.b)		; 32 00
	ora ($44.b,S),Y		; 13 44
	ldy $DE.b,X		; B4 DE
	bpl -36.b		; 10 DC
	cmp ($1E.b),Y		; D1 1E
	cmp $3212.w		; CD 12 32
	ldy $22.b,X		; B4 22
	and ($22.b,S),Y		; 33 22
	ora $DCFEFE.l		; 0F FE FE DC
	ldx $46B4.w,Y		; BE B4 46
	bit $32CF.w		; 2C CF 32
	and ($34.b,X)		; 21 34
	bvc -68.b		; 50 BC
	ldy $15.b,X		; B4 15
	and $31B0DB.l,X		; 3F DB B0 31
	wai		; CB
	sbc $32.b,S		; E3 32
	ldy $01.b,X		; B4 01
	bit $2D.b,X		; 34 2D
	cmp $CE3034.l		; CF 34 30 CE
	beq -76.b		; F0 B4
	cpx $2FC0.w		; EC C0 2F
	dec $3202.w,X		; DE 02 32
	ora ($33.b)		; 12 33
	ldy $31.b,X		; B4 31
	ora $DCEEEF.l		; 0F EF EE DC
	lda $B41C46.l,X		; BF 46 1C B4
	cpy #$1132.w		; C0 32 11
	and $40.b		; 25 40
	cmp $2F13.w		; CD 13 2F
	ldy $DB.b,X		; B4 DB
	cpy #$CC31.w		; C0 31 CC
	sbc $31.b,S		; E3 31
	ora ($24.b),Y		; 11 24
	cpy #$1042.w		; C0 42 10
	and $54.b,S		; 23 54
	and ($11.b,X)		; 21 11
	asl $A4CC.w		; 0E CC A4
	rol $15AB.w		; 2E AB 15
	mvn $45,$34		; 54 34 45
	mvn $B4,$1F		; 54 1F B4
	inc $DCFE.w		; EE FE DC
	cmp $C10C46.l		; CF 46 0C C1
	and ($B4.b)		; 32 B4
	bpl  52.b		; 10 34
	eor $1E24CE.l		; 4F CE 24 1E
	phx		; DA
	cmp ($B4.b,X)		; C1 B4
	eor ($CB.b,X)		; 41 CB
	sbc ($31.b)		; F2 31
	ora ($34.b),Y		; 11 34
	ora $B4D0.w,X		; 1D D0 B4
	bit $2F.b,X		; 34 2F
	dec $EC0F.w,X		; DE 0F EC
	bne  30.b		; D0 1E
	dec $35A4.w,X		; DE A4 35
	mvp $54,$45		; 44 45 54
	bit $3F.b,X		; 34 3F
	stp		; DB
	ldy $DCB4.w,X		; BC B4 DC
	lda $C00C56.l,X		; BF 56 0C C0
	and ($12.b,S),Y		; 33 12
	and $B4.b		; 25 B4
	and $1E32CE.l,X		; 3F CE 32 1E
	wai		; CB
	cmp ($41.b,X)		; C1 41
	stp		; DB
	cpy #$EFBC.w		; C0 BC EF
	beq  19.b		; F0 13
	.db $42, $00		; 42 00
	bit $43.b		; 24 43
	ldy $EE.b,X		; B4 EE
	brk $DC.b		; 00 DC
	bne  31.b		; D0 1F
	cmp $B42212.l,X		; DF 12 22 B4
	jsl $101232.l		; 22 32 12 10
	inc $CCDE.w,X		; FE DE CC
	lda $0C66B4.l,X		; BF B4 66 0C
	cpy #$1223.w		; C0 23 12
	and $2F.b,X		; 35 2F
	cmp $1E33B4.l		; CF B4 33 1E
	wai		; CB
	lda ($42.b),Y		; B1 42
	wai		; CB
	cmp ($22.b)		; D2 22
	ldy $11.b,X		; B4 11
	bit $2E.b,X		; 34 2E
	cmp $DF3F34.l		; CF 34 3F DF
	brk $C0.b		; 00 C0
	asl $DCDC.w		; 0E DC DC
	tsx		; BA
	lda $01EF.w,X		; BD EF 01
	and $B4.b,S		; 23 B4
	ora ($11.b)		; 12 11
	inc $DBED.w,X		; FE ED DB
	bcs  86.b		; B0 56
	tas		; 1B
	ldy $CF.b,X		; B4 CF
	and ($22.b)		; 32 22
	and $2E.b,X		; 35 2E
	cmp $B41E33.l		; CF 33 1E B4
	wai		; CB
	lda ($42.b),Y		; B1 42
	cpy $21D2.w		; CC D2 21
	ora ($34.b),Y		; 11 34
	cpy #$0032.w		; C0 32 00
	and $43.b,S		; 23 43
	and ($11.b,X)		; 21 11
	asl $A4DD.w		; 0E DD A4
	tsb $34BE.w		; 0C BE 34
	bit $44.b,X		; 34 44
	mvn $21,$32		; 54 32 21
	ldy $0E.b,X		; B4 0E
	inc $BFDB.w		; EE DB BF
	lsr $1C.b,X		; 56 1C
	bcs  34.b		; B0 22
	ldy $22.b,X		; B4 22
	bit $3E.b,X		; 34 3E
	cmp $CA1E35.l		; CF 35 1E CA
	lda ($B4.b),Y		; B1 B4
	eor ($EB.b,X)		; 41 EB
	sbc ($2F.b,X)		; E1 2F
	cop $35.b		; 02 35
	ora $B4D0.w,X		; 1D D0 B4
	bit $3F.b,X		; 34 3F
	sbc $EFEC10.l		; EF 10 EC EF
	inc $A4DF.w,X		; FE DF A4
	bit $33.b		; 24 33
	mvp $33,$54		; 44 54 33
	and ($ED.b,X)		; 21 ED
	wai		; CB
	ldy $DB.b,X		; B4 DB
	lda ($56.b),Y		; B1 56
	tsb $32CF.w		; 0C CF 32
	ora ($34.b)		; 12 34
	ldy $2E.b,X		; B4 2E
	cmp $CA2E34.l		; CF 34 2E CA
	cpy #$DC42.w		; C0 42 DC
	ldy $F1.b,X		; B4 F1
	and $1D44F1.l		; 2F F1 44 1D
	bne  51.b		; D0 33
	jsr $BFA4.w		; 20 A4 BF
	and ($D9.b,S),Y		; 33 D9
	ldx $AEEB.w		; AE EB AE
	bit $34.b		; 24 34
	ldy $22.b,X		; B4 22
	jsl $0F1012.l		; 22 12 10 0F
	inc $B1CB.w		; EE CB B1
	ldy $55.b,X		; B4 55
	tsb $31D0.w		; 0C D0 31
	ora ($34.b)		; 12 34
	and $B4CF.w		; 2D CF B4
	mvp $CA,$2E		; 44 2E CA
	cmp ($42.b,X)		; C1 42
	cpy $1E03.w		; CC 03 1E
	bcs -84.b		; B0 AC
	ora $51.b,X		; 15 51
	dec $7525.w,X		; DE 25 75
	jsl $C9A435.l		; 22 35 A4 C9
	lda $13BDFC.l,X		; BF FC BD 13
	mvp $33,$43		; 44 43 33
	ldy $21.b,X		; B4 21
	ora $DAFEFF.l		; 0F FF FE DA
	cmp ($64.b)		; D2 64
	xce		; FB
	ldy $E2.b,X		; B4 E2
	and ($02.b,X)		; 21 02
	mvn $C0,$1B		; 54 1B C0
	mvp $B4,$1E		; 44 1E B4
	tsx		; BA
	cmp ($41.b),Y		; D1 41
	cmp $1E13.w		; CD 13 1E
.INDEX 8
	sep #$53		; E2 53
	bcs  64.b		; B0 40
	dec $6425.w,X		; DE 25 64
	jsl $DC2F44.l		; 22 44 2F DC
	ldy $ED.b		; A4 ED
	cmp $423611.l,X		; DF 11 36 42
	and $32.b,S		; 23 32
	ora $FDFFB4.l		; 0F B4 FF FD
	wai		; CB
	sbc $51.b,X		; F5 51
	cmp $2102.w,X		; DD 02 21
	ldy $12.b,X		; B4 12
	eor ($EB.b,S),Y		; 53 EB
	cmp ($43.b)		; D2 43
	ora $F3AB.w		; 0D AB F3
	bcs -20.b		; B0 EC
	sta $FDCF.w,Y		; 99 CF FD
	cmp ($56.b),Y		; D1 56
	rol $B4DF.w		; 2E DF B4
	.db $42, $FE		; 42 FE
	ora ($1F.b,X)		; 01 1F
	inc $DFFF.w		; EE FF DF
	cop $A4.b		; 02 A4
	brk $26.b		; 00 26
	eor ($00.b),Y		; 51 00
	jsl $EAEE1F.l		; 22 1F EE EA
	ldy $BD.b,X		; B4 BD
	rol $3E.b		; 26 3E
	dec $1123.w		; CE 23 11
	bit $40.b		; 24 40
	ldy $CB.b,X		; B4 CB
	tsb $41.b		; 04 41
	jmp.w [$23AD]		; DC AD 23
	sbc $B4F2.w,X		; FD F2 B4
	bmi -32.b		; 30 E0
	and $3D.b		; 25 3D
	lda $3113.w,X		; BD 13 31
	sbc $EB23A4.l		; EF A4 23 EB
	bcs  12.b		; B0 0C
	cmp $37FE44.l		; CF 44 FE 37
	ldy $21.b,X		; B4 21
	ora $FF0F01.l		; 0F 01 0F FF
	jmp.w [$56B0]		; DC B0 56
	ldy $0C.b,X		; B4 0C
	cmp ($32.b),Y		; D1 32
	ora ($45.b),Y		; 11 45
	and $24BE.w		; 2D BE 24
	ldy $1F.b,X		; B4 1F
	wai		; CB
	cmp ($30.b,X)		; C1 30
	dec $2E23.w,X		; DE 23 2E
	sbc ($B4.b)		; F2 B4
	eor ($0B.b,S),Y		; 53 0B
	cmp $F1FE33.l		; CF 33 FE F1
	and ($DD.b,X)		; 21 DD
	ldy $F2.b		; A4 F2
	xce		; FB
.INDEX 16
	rep #$53		; C2 53
	beq  69.b		; F0 45
	and ($FE.b),Y		; 31 FE
	ldy $00.b,X		; B4 00
	ora $F5DBEE.l		; 0F EE DB F5
	adc ($DC.b,X)		; 61 DC
	ora $B4.b,S		; 03 B4
	jsr $5313.w		; 20 13 53
	plx		; FA
	cmp ($43.b),Y		; D1 43
	jsr ($B4BB.w,X)		; FC BB B4
	ora $2E.b,S		; 03 2E
	cmp ($33.b),Y		; D1 33
	sbc $5204.w,X		; FD 04 52
	wai		; CB
	bcs -49.b		; B0 CF
	and ($0D.b,S),Y		; 33 0D
	sbc ($31.b,X)		; E1 31
	stp		; DB
	dec $A4DA.w,X		; DE DA A4
	pei ($62.b)		; D4 62
	cop $35.b		; 02 35
	eor ($ED.b,X)		; 41 ED
	ora ($ED.b),Y		; 11 ED
	ldy $EC.b,X		; B4 EC
	lda $3E36.w,X		; BD 36 3E
	lda $251132.l,X		; BF 32 11 25
	ldy $40.b,X		; B4 40
	tyx		; BB
	trb $40.b		; 14 40
	stp		; DB
	ldx $FC33.w		; AE 33 FC
	ldy $03.b,X		; B4 03
	and ($EF.b),Y		; 31 EF
	bit $3E.b,X		; 34 3E
	lda $2E14.w,X		; BD 14 2E
	bcs -19.b		; B0 ED
	ora $3F.b,S		; 03 3F
	cpy $B9EE.w		; CC EE B9
	txy		; 9B
	sbc $2212B4.l		; EF B4 12 22
	ora $FE10E0.l,X		; 1F E0 10 FE
	xba		; EB
	lda ($B4.b),Y		; B1 B4
	lsr $0B.b,X		; 56 0B
	cmp ($31.b),Y		; D1 31
	ora ($45.b),Y		; 11 45
	bit $B4BE.w		; 2C BE B4
	bit $2E.b,X		; 34 2E
	dex		; CA
	rep #$41		; C2 41
	cmp $2E14.w,X		; DD 14 2E
	ldy $E1.b,X		; B4 E1
	mvn $B0,$1C		; 54 1C B0
	and ($FD.b,S),Y		; 33 FD
	cmp ($32.b),Y		; D1 32
	ldy $B9.b		; A4 B9
	cmp ($2D.b)		; D2 2D
	lda $3524.w		; AD 24 35
	eor ($32.b,S),Y		; 53 32
	ldy $0E.b,X		; B4 0E
	beq  31.b		; F0 1F
	inc $F5BB.w,X		; FE BB F5
	per L000AA0.w		; 62 CC B4
	sbc ($20.b,S),Y		; F3 20
	ora ($54.b,S),Y		; 13 54
	nop		; EA
	cmp ($43.b)		; D2 43
	sbc $ABB4.w,X		; FD B4 AB
	pea $D03E.w		; F4 3E D0
	and ($FD.b,S),Y		; 33 FD
	tsb $42.b		; 04 42
	bcs  79.b		; B0 4F
	sbc ($43.b,X)		; E1 43
	ora $32D0.w		; 0D D0 32
	cpx $A4DE.w		; EC DE A4
	cpx $22D0.w		; EC D0 22
	lsr $42.b,X		; 56 42
	bmi -35.b		; 30 DD
	brk $B4.b		; 00 B4
	ora $46BFFB.l		; 0F FB BF 46
	and $22BF.w		; 2D BF 22
	ora ($B4.b),Y		; 11 B4
	and $3F.b,X		; 35 3F
	lda $3024.w		; AD 24 30
	wai		; CB
	lda $EBB033.l		; AF 33 B0 EB
	ldx $ED11.w,Y		; BE 11 ED
	ora $63.b		; 05 63
	inc $A414.w,X		; FE 14 A4
	asl A		; 0A
	sta $C1FA55.l,X		; 9F 55 FA C1
	asl $01CD.w		; 0E CD 01
	ldy $12.b,X		; B4 12
	and ($12.b)		; 32 12
	asl $00F0.w		; 0E F0 00
	inc $B4DB.w,X		; FE DB B4
	sbc $62.b		; E5 62
	jmp.w [$21F2]		; DC F2 21
	ora $54.b,S		; 03 54
	xce		; FB
	bcs   2.b		; B0 02
	adc [$63.b]		; 67 63
	nop		; EA
	txy		; 9B
	cmp $F2BC.w,X		; DD BC F2
	bcs  31.b		; B0 1F
	sbc ($67.b,X)		; E1 67
	rol $44D1.w,X		; 3E D1 44
	ora $A4D0.w,X		; 1D D0 A4
	lsr $21AD.w,X		; 5E AD 21
	wai		; CB
.INDEX 8
	sep #$11		; E2 11
	rol $53.b		; 26 53
	ldy $10.b,X		; B4 10
	inc $0F10.w		; EE 10 0F
	jsr ($46BE.w,X)		; FC BE 46
	rol $BEB4.w,X		; 3E B4 BE
	jsl $402511.l		; 22 11 25 40
	tyx		; BB
	ora $30.b,X		; 15 30
	ldy $DB.b,X		; B4 DB
	ldx $FF22.w,Y		; BE 22 FF
	ora $3F.b,S		; 03 3F
	cpx #$24.b		; E0 24
	bcs 116.b		; B0 74
	sbc $5204.w,X		; FD 04 52
	cpx $0DE1.w		; EC E1 0D
	ldy $50A4.w		; AC A4 50
	ldy $1002.w,X		; BC 02 10
	eor $33.b,X		; 55 33
	trb $B4CF.w		; 1C CF B4
	bpl  15.b		; 10 0F
	wai		; CB
	sbc $63.b,S		; E3 63
	cpx $21E2.w		; EC E2 21
	ldy $12.b,X		; B4 12
	eor $0B.b		; 45 0B
	cpy #$43.b		; C0 43
	asl $D2BB.w		; 0E BB D2
	ldy $3F.b,X		; B4 3F
	cpx #$34.b		; E0 34
	ora $44E2.w		; 0D E2 44
	xba		; EB
	cmp ($B0.b,S),Y		; D3 B0
	lsr $3F.b		; 46 3F
	dec $EB01.w,X		; DE 01 EB
	ldx $BAFD.w,Y		; BE FD BA
	ldy $31.b		; A4 31
	ora $43.b,S		; 03 43
	mvp $E0,$FC		; 44 FC E0
	ora $BEB4EA.l,X		; 1F EA B4 BE
	rol $3E.b,X		; 36 3E
	ldx $1F22.w,Y		; BE 22 1F
	and $51.b		; 25 51
	ldy $CA.b,X		; B4 CA
	sbc ($41.b,S),Y		; F3 41
	cpx $23AE.w		; EC AE 23
	asl $B0F2.w		; 0E F2 B0
	and $0E.b,S		; 23 0E
	tsb $76.b		; 04 76
	ora $63F4.w		; 0D F4 63
	jsr ($25A4.w,X)		; FC A4 25
	rol A		; 2A
	bcc  83.b		; 90 53
	phx		; DA
.ACCU 8
	sep #$21		; E2 21
	bit $B4.b		; 24 B4
	ora ($20.b)		; 12 20
	sbc $DB0F01.l		; EF 01 0F DB
	cmp ($65.b)		; D2 65
	ldy $FB.b,X		; B4 FB
	cmp ($21.b),Y		; D1 21
	ora ($45.b,X)		; 01 45
	bit $44AE.w		; 2C AE 44
	ldy $2E.b,X		; B4 2E
	dex		; CA
	cmp ($31.b)		; D2 31
	inc $2E13.w		; EE 13 2E
	sbc ($B0.b),Y		; F1 B0
	eor [$61.b]		; 47 61
	cpy $3F14.w		; CC 14 3F
	cpy $FC02.w		; CC 02 FC
	ldy $E5.b		; A4 E5
	lsr $32AD.w		; 4E AD 32
	ora ($32.b)		; 12 32
	eor $0C.b		; 45 0C
	ldy $E0.b,X		; B4 E0
	brk $FD.b		; 00 FD
	ldy $5016.w,X		; BC 16 50
	lda $B413.w,X		; BD 13 B4
	brk $14.b		; 00 14
	eor ($DA.b,S),Y		; 53 DA
	cmp ($53.b,S),Y		; D3 53
	cpx $B4AD.w		; EC AD B4
	ora ($1F.b,S),Y		; 13 1F
	sbc ($31.b),Y		; F1 31
	sbc $BB4F14.l		; EF 14 4F BB
	ldy $F7.b		; A4 F7
	bvs -102.b		; 70 9A
	ora [$5C.b],Y		; 17 5C
	stz $EA35.w		; 9C 35 EA
	ldy $B1.b		; A4 B1
	and ($43.b,S),Y		; 33 43
	ora ($31.b,X)		; 01 31
	cmp $10F1.w,X		; DD F1 10
	ldy $DB.b,X		; B4 DB
	cmp $65.b,S		; C3 65
	jsr ($30D1.w,X)		; FC D1 30
	sbc ($55.b),Y		; F1 55
	ldy $3D.b,X		; B4 3D
	lda $1E14.w,X		; BD 14 1E
	wai		; CB
	sbc $30.b,S		; E3 30
	cmp $1D25B4.l,X		; DF B4 25 1D
	cmp ($54.b,X)		; C1 54
	tsb $44BF.w		; 0C BF 44
	ora $9FA4.w		; 0D A4 9F
	adc $E9.b		; 65 E9
	cmp ($52.b,X)		; C1 52
	cpy $2301.w		; CC 01 23
	ldy $20.b,X		; B4 20
	ora ($0F.b,X)		; 01 0F
	cpx #$F0.b		; E0 F0
	asl $26BE.w		; 0E BE 26
	ldy $40.b,X		; B4 40
	lda $1F13.w,X		; BD 13 1F
	ora ($53.b,S),Y		; 13 53
	nop		; EA
	cmp ($B4.b)		; D2 B4
	.db $42, $EC		; 42 EC
	ldx $1F13.w		; AE 13 1F
	sbc ($41.b)		; F2 41
	sbc $14B4.w		; ED B4 14
	rti		; 40

	tyx		; BB
	sbc ($40.b,S),Y		; F3 40
	jmp.w [$3F03]		; DC 03 3F
	ldy $AB.b		; A4 AB
	and $3E.b,X		; 35 3E
	cmp $013311.l		; CF 11 33 01
	and ($B4.b,X)		; 21 B4
	inc $0F00.w		; EE 00 0F
	stp		; DB
.ACCU 8
	sep #$65		; E2 65
	jsr ($B4E2.w,X)		; FC E2 B4
	and ($F1.b),Y		; 31 F1
	eor $2D.b		; 45 2D
	lda $1E13.w,X		; BD 13 1E
	wai		; CB
	ldy $E3.b,X		; B4 E3
	and $2F24DF.l,X		; 3F DF 24 2F
	sep #$44		; E2 44
	phd		; 0B
	ldy $BF.b,X		; B4 BF
	bit $0C.b,X		; 34 0C
	cmp $E1FD32.l,X		; DF 32 FD E1
	jsr $B994.w		; 20 94 B9
	ora ($04.b,S),Y		; 13 04
	bvc  21.b		; 50 15
	rol A		; 2A
	ldx $B401.w,Y		; BE 01 B4
	sbc $36CE.w,X		; FD CE 36
	eor $1F23BE.l,X		; 5F BE 23 1F
	trb $B4.b		; 14 B4
	eor ($DB.b),Y		; 51 DB
	cmp ($31.b),Y		; D1 31
	xba		; EB
	cmp $B40F33.l		; CF 33 0F B4
	sbc ($30.b,S),Y		; F3 30
	sbc $BB4014.l		; EF 14 40 BB
	sbc ($2F.b,S),Y		; F3 2F
	bcs -39.b		; B0 D9
	txy		; 9B
	sbc $22E0DC.l		; EF DC E0 22
	ora ($12.b,X)		; 01 12
	ldy $21.b,X		; B4 21
	bpl  16.b		; 10 10
	inc $FEFF.w,X		; FE FF FE
	wai		; CB
	sbc ($B4.b,S),Y		; F3 B4
	stz $DC.b,X		; 74 DC
	sbc ($31.b)		; F2 31
	cop $45.b		; 02 45
	and $B4AD.w		; 2D AD B4
	and ($1D.b,S),Y		; 33 1D
	tyx		; BB
	cpx $30.b		; E4 30
	sbc $B41E33.l		; EF 33 1E B4
	sep #$44		; E2 44
	phd		; 0B
	lda $C00D23.l,X		; BF 23 0D C0
	jsl $BFFCA0.l		; 22 A0 FC BF
	lsr $3F.b		; 46 3F
	sbc $EEFFEE.l,X		; FF EE FF EE
	ldy $0E.b,X		; B4 0E
	beq   0.b		; F0 00
	sbc $46CF.w,X		; FD CF 46
	eor $22B4D0.l		; 4F D0 B4 22
	ora ($14.b),Y		; 11 14
	and ($DC.b),Y		; 31 DC
	bne  15.b		; D0 0F
	xba		; EB
	ldy $CF.b,X		; B4 CF
	and ($0F.b,S),Y		; 33 0F
	ora ($31.b)		; 12 31
	sbc $B44123.l,X		; FF 23 41 B4
	wai		; CB
	sbc ($2F.b)		; F2 2F
	cpy $20E2.w		; CC E2 20
	cmp $5DA414.l,X		; DF 14 A4 5D
	lda $312432.l,X		; BF 32 24 31
	and $B4FFDD.l		; 2F DD FF B4
	inc $F5CC.w,X		; FE CC F5
	adc $EC.b,S		; 63 EC
	ora $2F.b,S		; 03 2F
	sbc ($B4.b,S),Y		; F3 B4
	mvp $BF,$1D		; 44 1D BF
	and ($FD.b),Y		; 31 FD
	tyx		; BB
	ora ($4F.b,S),Y		; 13 4F
	ldy $F0.b,X		; B4 F0
	eor $FD.b,S		; 43 FD
	sbc ($43.b)		; F2 43
	tsb $11C0.w		; 0C C0 11
	ldy $B9.b		; A4 B9
	ldx $0E44.w		; AE 44 0E
	ora $63.b,X		; 15 63
	sbc $B413.w		; ED 13 B4
	bpl  16.b		; 10 10
	beq  -2.b		; F0 FE
	sbc $D1DCFF.l,X		; FF FF DC D1
	ldy $55.b,X		; B4 55
	and $32E1.w		; 2D E1 32
	ora ($34.b,X)		; 01 34
	and $01B4CC.l,X		; 3F CC B4 01
	asl $C1CB.w,X		; 1E CB C1
	and ($0F.b)		; 32 0F
	ora ($20.b,S),Y		; 13 20
	cpy #$11.b		; C0 11
	and $44.b,S		; 23 44
	and ($12.b,X)		; 21 12
	bpl -19.b		; 10 ED
	dec $2CA4.w,X		; DE A4 2C
	lda $E11D46.l,X		; BF 46 1D E1
	and ($23.b)		; 32 23
	ora ($B4.b),Y		; 11 B4
	asl $0FFF.w		; 0E FF 0F
	jsr ($46CE.w,X)		; FC CE 46
	rti		; 40

	dec $22B4.w		; CE B4 22
	bpl  36.b		; 10 24
	.db $42, $EC		; 42 EC
	sbc $B4EC1F.l		; EF 1F EC B4
	lda $2F24.w,X		; BD 24 2F
	sbc ($32.b,S),Y		; F3 32
	inc $4203.w,X		; FE 03 42
	cpy #$31.b		; C0 31
	brk $10.b		; 00 10
	sbc $EECC.w,X		; FD CC EE
	cmp $A4DF.w,X		; DD DF A4
	.db $62, $EE, $22		; 62 EE 22
	and ($32.b,S),Y		; 33 32
	asl $EFBC.w		; 0E BC EF
	ldy $FD.b,X		; B4 FD
	cpy $6205.w		; CC 05 62
	sbc BG3VOFS.w		; ED 12 21
	cop $B4.b		; 02 B4
	eor $0D.b,S		; 43 0D
	bne  17.b		; D0 11
	sbc $E3BB.w		; ED BB E3
	and ($A4.b),Y		; 31 A4
	sbc ($56.b),Y		; F1 56
	and $74D4.w		; 2D D4 74
	sbc #$C4.b		; E9 C4
	eor ($A4.b),Y		; 51 A4
	lda $239D.w,Y		; B9 9D 23
	jsr ($44E3.w,X)		; FC E3 44
	ora $11B414.l		; 0F 14 B4 11
	ora ($00.b),Y		; 11 00
	inc $FFE0.w		; EE E0 FF
	stp		; DB
	cmp ($B4.b)		; D2 B4
	lsr $0E.b,X		; 56 0E
.ACCU 8
	sep #$22		; E2 22
	ora ($24.b,X)		; 01 24
	bmi -34.b		; 30 DE
	ldy $01.b,X		; B4 01
	sbc $C0CB.w,X		; FD CB C0
	and ($00.b)		; 32 00
	and $2F.b,S		; 23 2F
	bcs   0.b		; B0 00
	rol $75.b,X		; 36 75
	and ($45.b,X)		; 21 45
	rti		; 40

	stp		; DB
	tax		; AA
	ldy $FD.b		; A4 FD
	bne  87.b		; D0 57
	and $3321E2.l,X		; 3F E2 21 33
	and ($B4.b)		; 32 B4
	asl $0FEF.w		; 0E EF 0F
	xce		; FB
	cmp $C03E46.l		; CF 46 3E C0
	ldy $23.b,X		; B4 23
	brk $14.b		; 00 14
	eor ($EC.b,X)		; 41 EC
	sbc ($1E.b),Y		; F1 1E
	jmp.w [$BEB4]		; DC B4 BE
	ora ($10.b,S),Y		; 13 10
	ora ($31.b,S),Y		; 13 31
	inc $4113.w		; EE 13 41
	bcs  64.b		; B0 40
	trb $63.b		; 14 63
	jsr ($CCBB.w,X)		; FC BB CC
	lda #$9C.b		; A9 9C
	ldy $51.b		; A4 51
	beq  34.b		; F0 22
	and $33.b,S		; 23 33
	bmi -36.b		; 30 DC
	cmp $BDFDB4.l,X		; DF B4 FD BD
	ora $61.b,X		; 15 61
	cmp $2F23.w,X		; DD 23 2F
	cop $B4.b		; 02 B4
	bit $0C.b,X		; 34 0C
	cmp ($30.b),Y		; D1 30
	cpx $F3BB.w		; EC BB F3
	jsr $D1A4.w		; 20 A4 D1
	adc $0E.b		; 65 0E
	pea $0965.w		; F4 65 09
	cpy $71.b		; C4 71
	bcs  46.b		; B0 2E
	tsx		; BA
	ldy $9BB9.w,X		; BC B9 9B
	cpx #$FE.b		; E0 FE
	cpx #$B4.b		; E0 B4
	ora ($11.b),Y		; 11 11
	ora ($0E.b,X)		; 01 0E
	sbc $D2CB0F.l,X		; FF 0F CB D2
	ldy $74.b,X		; B4 74
	sbc $31F3.w,X		; FD F3 31
	beq  36.b		; F0 24
	rol $B4CE.w,X		; 3E CE B4
	and $0D.b,S		; 23 0D
	wai		; CB
	cmp ($31.b,X)		; C1 31
	sbc $B42F24.l,X		; FF 24 2F B4
	beq  52.b		; F0 34
	asl $32BF.w,X		; 1E BF 32
	ora $F1DE.w		; 0D DE F1
	ldy $0A.b		; A4 0A
	bcs  85.b		; B0 55
	rol $44E2.w		; 2E E2 44
	.db $42, $12		; 42 12
	ldy $0F.b,X		; B4 0F
	inc $DC0F.w		; EE 0F DC
	cmp $C03D56.l		; CF 56 3D C0
	ldy $33.b,X		; B4 33
	brk $13.b		; 00 13
	eor ($EC.b),Y		; 51 EC
	sbc ($2E.b)		; F2 2E
	cpx $BEB4.w		; EC B4 BE
	ora ($0E.b)		; 12 0E
	sbc ($31.b,S),Y		; F3 31
	sbc $A45123.l,X		; FF 23 51 A4
	lda #$16.b		; A9 16
	bit $E0AB.w		; 2C AB E0
	ora $A414DE.l,X		; 1F DE 14 A4
	rol $24CE.w,X		; 3E CE 24
	mvp $32,$11		; 44 11 32
	sbc $B4EE.w		; ED EE B4
	jsr ($26BD.w,X)		; FC BD 26
	bvc -50.b		; 50 CE
	ora ($2F.b,S),Y		; 13 2F
	cop $B4.b		; 02 B4
	bit $FD.b,X		; 34 FD
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	cmp $03AC.w,X		; DD AC 03
	ora $E0B4.w,X		; 1D B4 E0
	eor $0E.b,S		; 43 0E
	cop $44.b		; 02 44
	jsr ($31D2.w,X)		; FC D2 31
	ldy $C9.b		; A4 C9
	bcs  49.b		; B0 31
	cpy $20F4.w		; CC F4 20
	dec $B434.w,X		; DE 34 B4
	jsl $FE0010.l		; 22 10 00 FE
	sbc $F4CC0E.l,X		; FF 0E CC F4
	ldy $74.b,X		; B4 74
	jmp.w [$30E3]		; DC E3 30
	sbc ($35.b),Y		; F1 35
	rol $B4CE.w,X		; 3E CE B4
	and ($FE.b,X)		; 21 FE
	tyx		; BB
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	cpx #$13.b		; E0 13
	ora $34F1B4.l,X		; 1F B4 F1 34
	rol $22C0.w		; 2E C0 22
	sbc $11CF.w		; ED CF 11
	ldy $DB.b		; A4 DB
	sbc $63.b,S		; E3 63
	jmp.w [$66F3]		; DC F3 66
	bmi   1.b		; 30 01
	ldy $1F.b,X		; B4 1F
	inc $CBFF.w,X		; FE FF CB
	cmp ($64.b,S),Y		; D3 64
	tsb $B4E1.w		; 0C E1 B4
	and ($00.b)		; 32 00
	bit $4F.b		; 24 4F
	ldx $2E23.w,Y		; BE 23 2E
	tyx		; BB
	cpy #$CC.b		; C0 CC
	cmp $DECC.w,X		; DD CC DE
	brk $01.b		; 00 01
	and $55.b,S		; 23 55
	bcs  97.b		; B0 61
	ora ($31.b,S),Y		; 13 31
	stp		; DB
	dec $A9FD.w		; CE FD A9
	lda $1DA4.w,X		; BD A4 1D
	sbc ($57.b,X)		; E1 57
	adc $01.b,S		; 63 01
	and $B4FEDD.l		; 2F DD FE B4
	jmp.w [$66C0]		; DC C0 66
	trb $13CE.w		; 1C CE 13
	ora ($14.b),Y		; 11 14
	ldy $42.b,X		; B4 42
	jmp.w [$1E03]		; DC 03 1E
	stp		; DB
	cpy #$32.b		; C0 32
	inc $F1B4.w,X		; FE B4 F1
	ora ($F0.b),Y		; 11 F0
	ora ($43.b,S),Y		; 13 43
	sbc $1F01.w		; ED 01 1F
	ldy $BB.b		; A4 BB
	cmp $25CF0F.l		; CF 0F CF 25
	and $26CE.w		; 2D CE 26
	ldy $32.b,X		; B4 32
	brk $00.b		; 00 00
	sbc $BFFD0F.l,X		; FF 0F FD BF
	rol $B4.b,X		; 36 B4
	bvc -52.b		; 50 CC
	ora $20.b,S		; 03 20
	cop $53.b		; 02 53
	cpx $B4E2.w		; EC E2 B4
	and $02BDEC.l		; 2F EC BD 02
	ora $1022F1.l		; 0F F1 22 10
	ldy $13.b		; A4 13
	adc $FA.b,X		; 75 FA
	pei ($62.b)		; D4 62
	dex		; CA
	cmp $ABA41F.l		; CF 1F A4 AB
	cmp ($21.b),Y		; D1 21
	cmp $7614.w,X		; DD 14 76
	jsr $B401.w		; 20 01 B4
	brk $00.b		; 00 00
	ora $15CC.w		; 0D CC 15
	.db $62, $DC, $E1		; 62 DC E1
	ldy $22.b,X		; B4 22
	ora ($35.b,X)		; 01 35
	trb $32CF.w		; 1C CF 32
	inc $B4CD.w,X		; FE CD B4
	sbc ($1F.b),Y		; F1 1F
	inc OAMADDL.w		; EE 02 21
	ora ($24.b,X)		; 01 24
	rol $20A0.w		; 2E A0 20
	rol $61.b,X		; 36 61
	dex		; CA
	sbc ($1E.b,X)		; E1 1E
	cpy $B0EF.w		; CC EF B0
	xba		; EB
	sta $23BF.w,Y		; 99 BF 23
	and ($32.b,S),Y		; 33 32
	ora $DCB4FE.l		; 0F FE B4 DC
	cmp ($66.b)		; D2 66
	bit $32CE.w		; 2C CE 32
	bpl  36.b		; 10 24
	ldy $40.b,X		; B4 40
	cpy $0E23.w		; CC 23 0E
	stp		; DB
	cmp $B00E23.l,X		; DF 23 0E B0
	tsx		; BA
	ldy $14DE.w,X		; BC DE 14
	adc [$40.b],Y		; 77 40
	trb $64.b		; 14 64
	ldy $99.b		; A4 99
	sbc ($2E.b,S),Y		; F3 2E
	ldx $2E23.w,Y		; BE 23 2E
	sbc $B415.w		; ED 15 B4
	and ($EF.b)		; 32 EF
	bpl   0.b		; 10 00
	sbc $37BEFD.l,X		; FF FD BE 37
	ldy $5F.b,X		; B4 5F
	cpy OAMADDH.w		; CC 03 21
	ora $52.b,S		; 03 52
	xba		; EB
	sbc $B0.b,S		; E3 B0
	adc [$51.b],Y		; 77 51
	stp		; DB
	lda $99DC.w,X		; BD DC 99
	ldy $A4EE.w		; AC EE A4
	ora ($76.b,S),Y		; 13 76
	sbc $52D3.w,Y		; F9 D3 52
	phx		; DA
	cmp ($40.b)		; D2 40
	ldy $CC.b		; A4 CC
	sbc ($1E.b,X)		; E1 1E
	dec $7604.w,X		; DE 04 76
	sbc $B4F0.w,X		; FD F0 B4
	beq  -1.b		; F0 FF
	brk $DC.b		; 00 DC
	pea $FB63.w		; F4 63 FB
	bne -76.b		; D0 B4
	and ($11.b),Y		; 31 11
	mvp $B0,$2D		; 44 2D B0
	and ($FD.b)		; 32 FD
	cmp $D3A4.w		; CD A4 D3
	and ($EC.b),Y		; 31 EC
	sbc ($11.b,X)		; E1 11
	ora ($57.b),Y		; 11 57
	jmp $AFA4.w		; 4C A4 AF
	adc [$1C.b]		; 67 1C
	stz $EC23.w		; 9C 23 EC
	bne  33.b		; D0 21
	ldy $0E.b		; A4 0E
	sbc $CF5E47.l		; EF 47 5E CF
	brk $1F.b		; 00 1F
	sbc $C1ECB4.l		; EF B4 EC C1
	lsr $3D.b,X		; 56 3D
	ldx $1023.w,Y		; BE 23 10
	ora $B4.b,X		; 15 B4
	eor $2F24BC.l		; 4F BC 24 2F
	stp		; DB
	cpy #$12.b		; C0 12
	asl $9AB0.w		; 0E B0 9A
	cmp $661400.l		; CF 00 14 66
	rol $33D0.w		; 2E D0 33
	ldy #$0B.b		; A0 0B
	cmp ($42.b,X)		; C1 42
	cpx $A9BB.w		; EC BB A9
	sta $B4C3.w,Y		; 99 C3 B4
	eor ($FF.b,X)		; 41 FF
	beq  -1.b		; F0 FF
	beq  -3.b		; F0 FD
	cmp $B437.w		; CD 37 B4
	eor ($BC.b),Y		; 51 BC
	sbc ($30.b)		; F2 30
	ora ($52.b,S),Y		; 13 52
	cpx $B0E3.w		; EC E3 B0
	ror $4F.b,X		; 76 4F
	lda $EDAD.w,Y		; B9 AD ED
	tsx		; BA
	lda $B4FF.w,X		; BD FF B4
	ora ($33.b)		; 12 33
	cpx $33C1.w		; EC C1 33
	sbc $31D1.w,X		; FD D1 31
	ldy $EC.b		; A4 EC
	cpx #$10.b		; E0 10
	sbc $1E67F2.l		; EF F2 67 1E
	dec $F0B4.w,X		; DE B4 F0
	ora $F3DBFF.l		; 0F FF DB F3
	stz $0B.b,X		; 74 0B
	cmp ($B4.b),Y		; D1 B4
	jsl $1D3501.l		; 22 01 35 1D
	cpy #$33.b		; C0 33
	inc $A4BC.w,X		; FE BC A4
	lda ($43.b)		; B2 43
	jmp.w [$43E2]		; DC E2 43
	ora ($47.b),Y		; 11 47
	jmp $F11EB0.l		; 5C B0 1E F1
	ora $20E1CB.l,X		; 1F CB E1 20
	sbc $A4DD.w		; ED DD A4
	sbc $5F4612.l,X		; FF 12 46 5F
	cpx #$0F.b		; E0 0F
	inc $B4DF.w		; EE DF B4
	cpx $56C1.w		; EC C1 56
	and $22BF.w		; 2D BF 22
	bpl  36.b		; 10 24
	ldy $30.b,X		; B4 30
	cmp $1F24.w		; CD 24 1F
	stp		; DB
	cmp $A40E21.l,X		; DF 21 0E A4
	cpy #$45.b		; C0 45
	and ($14.b,X)		; 21 14
	.db $62, $B9, $E3		; 62 B9 E3
	and $F59AA4.l		; 2F A4 9A F5
	.db $62, $DE, $E1		; 62 DE E1
	bpl -17.b		; 10 EF
	ora $B4.b		; 05 B4
	and ($FF.b)		; 32 FF
	brk $00.b		; 00 00
	ora $15BDEE.l		; 0F EE BD 15
	ldy $62.b,X		; B4 62
	cpy $21F3.w		; CC F3 21
	ora ($43.b,X)		; 01 43
	jsr ($B0D2.w,X)		; FC D2 B0
	lsr $41.b,X		; 56 41
	phx		; DA
	ldy $B9DD.w		; AC DD B9
	stz $A4E0.w		; 9C E0 A4
	ora ($65.b,S),Y		; 13 65
	inc A		; 1A
	lda $9FE942.l		; AF 42 E9 9F
	mvn $0D,$A4		; 54 A4 0D
	beq  34.b		; F0 22
	sbc $2F36FF.l,X		; FF FF 36 2F
	sbc ($B4.b),Y		; F1 B4
	brk $00.b		; 00 00
	sbc $65C0EC.l,X		; FF EC C0 65
	bit $B4CF.w		; 2C CF B4
	and $10.b,S		; 23 10
	ora ($30.b,S),Y		; 13 30
	cmp $1F13.w,X		; DD 13 1F
	jmp.w [$9FA4]		; DC A4 9F
	eor $FD.b,S		; 43 FD
	cpy #$33.b		; C0 33
	ora ($37.b),Y		; 11 37
	adc ($B0.b),Y		; 71 B0
	rti		; 40

	cop $43.b		; 02 43
	xce		; FB
	lda $EDFF.w		; AD FF ED
	cmp $FD00A0.l,X		; DF A0 00 FD
	cmp $546547.l		; CF 47 65 54
	eor $43.b		; 45 43
	ldy $FE.b,X		; B4 FE
	cpy $5205.w		; CC 05 52
	jmp.w [$21F2]		; DC F2 21
	ora ($B4.b,X)		; 01 B4
	eor $0C.b,S		; 43 0C
	cmp ($41.b),Y		; D1 41
	sbc $F2CD.w,X		; FD CD F2
	bpl -92.b		; 10 A4
	cmp $4F14.w,X		; DD 14 4F
	sbc ($67.b,X)		; E1 67
	bit $459F.w		; 2C 9F 45
	bcs  48.b		; B0 30
	stp		; DB
	dec $CCED.w		; CE ED CC
	sbc $B40000.l		; EF 00 00 B4
	ora ($1F.b)		; 12 1F
	sbc ($00.b),Y		; F1 00
	brk $0F.b		; 00 0F
	cpx $B4B1.w		; EC B1 B4
	lsr $1C.b,X		; 56 1C
	cmp $141032.l		; CF 32 10 14
	rti		; 40

	cpy $15B0.w		; CC B0 15
	adc $2E.b		; 65 2E
	tax		; AA
	cmp $AADB.w		; CD DB AA
	cmp $250FA4.l,X		; DF A4 0F 25
	adc ($BA.b,X)		; 61 BA
	ora $5F.b		; 05 5F
	lda $A4E2.w,Y		; B9 E2 A4
	rol $13CE.w		; 2E CE 13
	and ($FF.b),Y		; 31 FF
	tsb $52.b		; 04 52
	inc $0FB4.w		; EE B4 0F
	brk $10.b		; 00 10
	asl $05CC.w		; 0E CC 05
	eor ($DC.b)		; 52 DC
	cpy #$EF.b		; C0 EF
	ora ($01.b),Y		; 11 01
	bit $42.b		; 24 42
	brk $23.b		; 00 23
	and ($A4.b,X)		; 21 A4
	txs		; 9A
	ora $2F.b,S		; 03 2F
	cmp $3013.w,X		; DD 13 30
	sbc ($56.b)		; F2 56
	ldy $1B.b		; A4 1B
	lda $AE0A54.l		; AF 54 0A AE
	jsl $94D0FE.l		; 22 FE D0 94
	and $30.b,X		; 35 30
	ora ($47.b,X)		; 01 47
	eor $EDF0.w		; 4D F0 ED
	cop $B4.b		; 02 B4
	bpl -20.b		; 10 EC
	cmp ($45.b,X)		; C1 45
	ora $22CF.w,X		; 1D CF 22
	bpl -76.b		; 10 B4
	ora ($30.b,S),Y		; 13 30
	cmp $2F04.w		; CD 04 2F
	jmp.w [$22D0]		; DC D0 22
	ldy $FF.b		; A4 FF
	sbc ($21.b,X)		; E1 21
	sbc $BA6126.l,X		; FF 26 61 BA
	sbc $A4.b,X		; F5 A4
	lsr $E2AA.w		; 4E AA E2
	and $2112FE.l		; 2F FE 12 21
	brk $B4.b		; 00 B4
	cop $21.b		; 02 21
	sbc $01000F.l,X		; FF 0F 00 01
	asl $B4CB.w,X		; 1E CB B4
	tsb $52.b		; 04 52
	jmp.w [$21F2]		; DC F2 21
	cop $33.b		; 02 33
	tsb $00B0.w		; 0C B0 00
	and $40.b,X		; 35 40
	cmp #$AC.b		; C9 AC
	inc $F0EE.w		; EE EE F0
	ldy $0E.b		; A4 0E
	sbc ($44.b)		; F2 44
	trb $53C0.w		; 1C C0 53
	plx		; FA
	ldx $3294.w,Y		; BE 94 32
	cpx $35E1.w		; EC E1 35
	and $2C6701.l		; 2F 01 67 2C
	ldy $F0.b,X		; B4 F0
	ora $FC1101.l		; 0F 01 11 FC
	bcs  68.b		; B0 44
	rol $CEB4.w		; 2E B4 CE
	jsl $311311.l		; 22 11 13 31
	jmp.w [$30F2]		; DC F2 30
	ldy $DC.b,X		; B4 DC
	cmp $110F31.l		; CF 31 0F 11
	jsr $13FF.w		; 20 FF 13
	ldy $30.b		; A4 30
	tyx		; BB
	ora $4F.b,X		; 15 4F
	tax		; AA
.ACCU 8
.INDEX 8
	sep #$3E		; E2 3E
	cmp $F2A4.w,X		; DD A4 F2
	and ($11.b)		; 32 11
	ora ($51.b,S),Y		; 13 51
	dec $F0EF.w,X		; DE EF F0
	ldy $01.b,X		; B4 01
	ora $52F5CC.l		; 0F CC F5 52
	cmp $21E2.w,X		; DD E2 21
	cpy #$12.b		; C0 12
	bit $43.b,X		; 34 43
	bpl  18.b		; 10 12
	bpl -19.b		; 10 ED
	cmp $40A4.w		; CD A4 40
	cpx #$34.b		; E0 34
	asl $53F3.w		; 0E F3 53
	tsb $A4C0.w		; 0C C0 A4
	mvp $AD,$FC		; 44 FC AD
	and $0D.b,S		; 23 0D
	cmp $A42012.l,X		; DF 12 20 A4
	brk $35.b		; 00 35
	and $01F0EE.l,X		; 3F EE F0 01
	ora ($EA.b,X)		; 01 EA
	ldy $BF.b,X		; B4 BF
	and $3E.b,X		; 35 3E
	cmp $130112.l		; CF 12 01 13
	bmi -76.b		; 30 B4
	sbc $2002.w		; ED 02 20
	cpx $21BE.w		; EC BE 21
	ora $30A412.l,X		; 1F 12 A4 30
	sbc $CD3F24.l		; EF 24 3F CD
	trb $3E.b		; 14 3E
	tyx		; BB
	ldy $D2.b		; A4 D2
	bmi -18.b		; 30 EE
	beq  34.b		; F0 22
	ora ($02.b),Y		; 11 02
	mvp $FF,$B4		; 44 B4 FF
	beq   0.b		; F0 00
	bpl  31.b		; 10 1F
	phx		; DA
	cmp ($54.b)		; D2 54
	ldy $D9.b		; A4 D9
	cmp ($42.b,S),Y		; D3 42
	ora ($67.b,S),Y		; 13 67
	pld		; 2B
	ldx $B445.w		; AE 45 B4
	ora $21D1CB.l		; 0F CB D1 21
	beq  18.b		; F0 12
	asl $A401.w,X		; 1E 01 A4
	stz $FB.b		; 64 FB
	cmp ($52.b,X)		; C1 52
	stp		; DB
	lda $A40D33.l,X		; BF 33 0D A4
	cpx #$10.b		; E0 10
	beq  17.b		; F0 11
	and $30.b		; 25 30
	sbc $01B4F0.l		; EF F0 B4 01
	brk $FE.b		; 00 FE
	cpy $4005.w		; CC 05 40
	sbc $C012.w		; ED 12 C0
	brk $12.b		; 00 12
	mvp $11,$32		; 44 32 11
	jsl $A4ED20.l		; 22 20 ED A4
	ora $2E.b,S		; 03 2E
	sbc ($52.b,X)		; E1 52
	inc $5204.w,X		; FE 04 52
	jmp.w [$D190]		; DC 90 D1
	eor ($E9.b,S),Y		; 53 E9
	stz $C921.w,X		; 9E 21 C9
	ldy $94B9.w		; AC B9 94
	cmp ($34.b),Y		; D1 34
	mvn $F1,$FE		; 54 FE F1
	bpl  16.b		; 10 10
	ora $ADECA4.l		; 0F A4 EC AD
	eor [$5E.b]		; 47 5E
	lda $2123.w,X		; BD 23 21
	bit $A4.b		; 24 A4
	bmi -35.b		; 30 DD
	sbc ($10.b)		; F2 10
	xba		; EB
	ldx $0E23.w,Y		; BE 23 0E
	sty $D3.b,X		; 94 D3
	eor ($EF.b)		; 52 EF
	and [$5D.b],Y		; 37 5D
	txy		; 9B
	trb $3E.b		; 14 3E
	sty $9B.b		; 84 9B
	and [$4B.b],Y		; 37 4B
	stz $EB12.w,X		; 9E 12 EB
	ora $65.b,S		; 03 65
	bcs  17.b		; B0 11
	ora ($11.b,X)		; 01 11
	ora ($11.b),Y		; 11 11
	brk $0E.b		; 00 0E
	cpy $C1A0.w		; CC A0 C1
	jsr $F1DC.w		; 20 DC F1
	jsl $427646.l		; 22 46 76 42
	sty $12.b,X		; 94 12
	and $33B0BA.l		; 2F BA B0 33
	cpx OAMADDH.w		; EC 03 21
	sty $D1.b		; 84 D1
	eor $0A.b,X		; 55 0A
	sta $B02E55.l,X		; 9F 55 2E B0
	eor $74.b,S		; 43 74
	sbc #$9E.b		; E9 9E
	ora $52F3EE.l,X		; 1F EE F3 52
	asl $8422.w		; 0E 22 84
	and ($0F.b,X)		; 21 0F
	ora $A0DA00.l		; 0F 00 DA A0
	adc $FD.b,X		; 75 FD
	stz $D5.b,X		; 74 D5
	stz $02.b		; 64 02
	eor [$3B.b]		; 47 3B
	txy		; 9B
	bit $2F.b		; 24 2F
	stz $A9.b,X		; 74 A9
	cmp $30.b,S		; C3 30
	inc $4E11.w		; EE 11 4E
	brk $22.b		; 00 22
	bvc 112.b		; 50 70
	sta $0000.w,Y		; 99 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($00.b),Y		; 91 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $59.b		; 06 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	jsr $0005.w		; 20 05 00
	phd		; 0B
	ora ($47.b,X)		; 01 47
	eor ($4D.b,X)		; 41 4D
	eor $4F.b		; 45 4F
	lsr $45.b,X		; 56 45
	eor ($2E.b)		; 52 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($0000.w)		; 6C 00 00
	brk $00.b		; 00 00
	cmp $173F.w		; CD 3F 17
	ora $00.b,X		; 15 00
	cmp $993F.w		; CD 3F 99
	ora #$00.b		; 09 00
	cmp $B23F.w		; CD 3F B2
	cop $00.b		; 02 00
	cmp $003F.w		; CD 3F 00
	brk $00.b		; 00 00
	cmp $C53F.w		; CD 3F C5
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$CC.b		; 09 CC
	sta $649C.w,Y		; 99 9C 64
	cpy $B030.w		; CC 30 B0
	sbc $FFFFCF.l,X		; FF CF FF FF
	sbc $EFDD80.l,X		; FF 80 DD EF
	ora ($22.b,X)		; 01 22
	eor $56.b		; 45 56
	adc [$77.b],Y		; 77 77
	stz $22.b		; 64 22
	eor $E1EEE5.l,X		; 5F E5 EE E1
	sbc $DCD0.w		; ED D0 DC
	stz $DC.b		; 64 DC
	jsr ($BFF0.w,X)		; FC F0 BF
	lda $BBFEFB.l,X		; BF FB FE BB
	sty $F0.b		; 84 F0
	inc $AE31.w,X		; FE 31 AE
	eor $957A92.l,X		; 5F 92 7A 95
	sty $5F.b		; 84 5F
	bne  38.b		; D0 26
	and $3F1314.l		; 2F 14 13 3F
	pea $7790.w		; F4 90 77
	adc $56.b,X		; 75 56
	stz $33.b		; 64 33
	jsl $74FF10.l		; 22 10 FF 74
	jsr ($F3EC.w,X)		; FC EC F3
	inc A		; 1A
	sbc ($34.b),Y		; F1 34
	jsr ($8043.w,X)		; FC 43 80
	ora ($10.b),Y		; 11 10
	bit $42.b		; 24 42
	and ($36.b,X)		; 21 36
	and $6013.w		; 2D 13 60
	adc $4CC4.w,Y		; 79 C4 4C
	cpy $0C.b		; C4 0C
	brk $09.b		; 00 09
	cpy $FC64.w		; CC 64 FC
	cmp $0FBF3C.l		; CF 3C BF 0F
	xce		; FB
	sbc $DE8023.l,X		; FF 23 80 DE
	sbc $453202.l,X		; FF 02 32 45
	eor $43.b,X		; 55 43
	and ($74.b,S),Y		; 33 74
	ldx $CDEE.w,Y		; BE EE CD
	cmp $DEDF.w		; CD DF DE
	sbc $F17421.l,X		; FF 21 74 F1
	eor ($23.b,S),Y		; 53 23
	jsl $1FF052.l		; 22 52 F0 1F
	sbc ($84.b,X)		; E1 84
	sbc $FDFF.w		; ED FF FD
	cmp $BCFF.w,X		; DD FF BC
	sbc $EFB0CB.l		; EF CB B0 EF
	cmp $11F0.w,X		; DD F0 11
	ora ($44.b)		; 12 44
	bit $44.b,X		; 34 44
	sty $32.b,X		; 94 32
	cmp $CEFE10.l,X		; DF 10 FE CE
	ora $840FCD.l,X		; 1F CD 0F 84
	and $51BF.w		; 2D BF 51
	ora ($F5.b)		; 12 F5
	stz $02.b,X		; 74 02
	eor $84.b		; 45 84
	eor $DC3FE1.l		; 4F E1 3F DC
	dec $ABFC.w		; CE FC AB
	inc $EC84.w		; EE 84 EC
	dec $0E0F.w		; CE 0F 0E
	cpy #$2F.b		; C0 2F
	lda $A4F0.w		; AD F0 A4
	inc $43FE.w,X		; FE FE 43
	ldx $0163.w		; AE 63 01
	sbc ($53.b),Y		; F1 53
	sty $E0.b,X		; 94 E0
	jsr $BA46.w		; 20 46 BA
	ora $0F.b,S		; 03 0F
	tax		; AA
	and $94.b,S		; 23 94
	jmp.w [$14DF]		; DC DF 14
	sbc $4302.w,X		; FD 02 43
	asl $9417.w		; 0E 17 94
	and $0D24FF.l,X		; 3F FF 24 0D
	sbc $E1EC10.l		; EF 10 EC E1
	sty $01.b		; 84 01
	cpy $2017.w		; CC 17 20
	and ($37.b,X)		; 21 37
	and $318402.l,X		; 3F 02 84 31
	xce		; FB
	cmp ($FC.b)		; D2 FC
	ldy $EBF0.w,X		; BC F0 EB
	cpx #$A0.b		; E0 A0
	cmp $CDDC.w		; CD DC CD
	cmp $CCDC.w,X		; DD DC CC
	cpy $A4BB.w		; CC BB A4
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $D44EE2.l		; 0F E2 4E D4
	bcs  17.b		; B0 11
	jsl $555524.l		; 22 24 55 55
	mvn $32,$55		; 54 55 32
	sty $0F.b,X		; 94 0F
	ora $209E.w		; 0D 9E 20
	dec $430F.w,X		; DE 0F 43
	beq -96.b		; F0 A0
	cop $45.b		; 02 45
	mvn $66,$56		; 54 56 66
	mvn $32,$44		; 54 44 32
	sty $1C.b		; 84 1C
	cmp ($3D.b,X)		; C1 3D
	cmp ($13.b),Y		; D1 13
	rol $3F04.w		; 2E 04 3F
	sty $20.b		; 84 20
	cpx #$1F.b		; E0 1F
	dec $FCCE.w,X		; DE CE FC
	ldy $94FD.w		; AC FD 94
	sbc $FE0FEE.l		; EF EE 0F FE
	sbc $1BCDFD.l		; EF FD CD 1B
	ldy $E5.b,X		; B4 E5
	rol A		; 2A
	asl $10.b		; 06 10
	ora $112E13.l,X		; 1F 13 2E 11
	ldy $C1.b		; A4 C1
	jmp $1D00A0.l		; 5C A0 00 1D
	lda ($4F.b,X)		; A1 4F
	beq -92.b		; F0 A4
	ora $11E044.l		; 0F 44 E0 11
	eor ($FD.b,X)		; 41 FD
	ora ($F0.b,S),Y		; 13 F0
	sty $CC.b,X		; 94 CC
	ora ($FB.b,S),Y		; 13 FB
	inc $0B15.w		; EE 15 0B
	ora $41.b		; 05 41
	sty $00.b,X		; 94 00
	trb $3F.b		; 14 3F
	sbc $BF1C01.l		; EF 01 1C BF
	brk $84.b		; 00 84
	lda #$A0.b		; A9 A0
	and $0F9E.w		; 2D 9E 0F
	asl $2FA0.w,X		; 1E A0 2F
	ldy $F0.b,X		; B4 F0
	ora $FE0FF0.l		; 0F F0 0F FE
	eor $CE.b,S		; 43 CE
	eor $A4.b,S		; 43 A4
	ora ($00.b),Y		; 11 00
	mvp $1D,$00		; 44 00 1D
	sbc $1B.b		; E5 1B
	cmp $0C01A0.l		; CF A0 01 0C
	lda $FFEF.w		; AD EF FF
	cpx #$45.b		; E0 45
	mvn $05,$94		; 54 94 05
	rts		; 60

	lda $1E22.w,X		; BD 22 1E
	cpy $0E13.w		; CC 13 0E
	sty $EE.b,X		; 94 EE
	rol $1C.b,X		; 36 1C
	pea $FE43.w		; F4 43 FE
	sbc ($10.b)		; F2 10
	sty $DC.b,X		; 94 DC
	sbc ($0D.b,X)		; E1 0D
	dec $FEFF.w		; CE FF FE
	cmp $0EA402.l,X		; DF 02 A4 0E
	beq  16.b		; F0 10
	inc $0FFF.w,X		; FE FF 0F
	ldx $B4FF.w,Y		; BE FF B4
	.db $42, $BF		; 42 BF
	adc $01.b,S		; 63 01
	brk $23.b		; 00 23
	ora $36B00E.l		; 0F 0E B0 36
	rti		; 40

	sbc $CEFD00.l,X		; FF 00 FD CE
	brk $00.b		; 00 00
	ldy $F4.b		; A4 F4
	eor ($E0.b),Y		; 51 E0
	ora $2F.b,S		; 03 2F
	dec $0F10.w,X		; DE 10 0F
	sty $AE.b,X		; 94 AE
	ora $30.b,S		; 03 30
	cmp $031D67.l		; CF 67 1D 03
	.db $42, $94		; 42 94
	sbc $10F0.w,X		; FD F0 10
	cpy $1DE0.w		; CC E0 1D
	dec $9401.w		; CE 01 94
	asl $00EE.w		; 0E EE 00
	asl $0ECE.w		; 0E CE 0E
	sbc $B0CD.w		; ED CD B0
	tax		; AA
	sta $EE9A.w,Y		; 99 9A EE
	dec $4524.w		; CE 24 45
	eor $A4.b,X		; 55 A4
	eor ($FF.b,X)		; 41 FF
	sbc $DB02.w,X		; FD 02 DB
	beq   1.b		; F0 01
	inc $2594.w		; EE 94 25
	and ($30.b,S),Y		; 33 30
	ora [$60.b]		; 07 60
	inc $1D12.w,X		; FE 12 1D
	sty $AE.b,X		; 94 AE
	inc $DD0E.w,X		; FE 0E DD
	and $10.b		; 25 10
	ora ($44.b,S),Y		; 13 44
	sty $40.b		; 84 40
	and ($21.b,S),Y		; 33 21
	xce		; FB
	ldx $9A0C.w,Y		; BE 0C 9A
	cmp $CFFD84.l		; CF 84 FD CF
	ora ($2F.b,X)		; 01 2F
	sbc $9B0C1F.l,X		; FF 1F 0C 9B
	ldy $00.b		; A4 00
	inc $FEF0.w		; EE F0 FE
	sbc $05E0EE.l		; EF EE E0 05
	ldy $2D.b,X		; B4 2D
	ora $20.b,X		; 15 20
	ora ($12.b),Y		; 11 12
	bpl -16.b		; 10 F0
	cpx #$A4.b		; E0 A4
	and $10BD.w		; 2D BD 10
	beq -32.b		; F0 E0
	and ($12.b)		; 32 12
	ora ($94.b),Y		; 11 94
	and [$1E.b],Y		; 37 1E
	ora $DFEB00.l,X		; 1F 00 EB DF
	dec $941F.w,X		; DE 1F 94
	cmp ($63.b),Y		; D1 63
	sbc ($43.b)		; F2 43
	and $10.b,S		; 23 10
	ora $B98400.l,X		; 1F 00 84 B9
	bcs -54.b		; B0 CA
	cmp $0DD0.w		; CD D0 0D
	ora ($D0.b,X)		; 01 D0
	sty $10.b,X		; 94 10
	sbc $0CE0.w		; ED E0 0C
	cpy $DBFF.w		; CC FF DB
	cmp $FFA4.w		; CD A4 FF
	ora $253014.l		; 0F 14 30 25
	.db $42, $32		; 42 32
	cop $94.b		; 02 94
	ora $0DBCFE.l,X		; 1F FE BC 0D
	lda $01FF.w,X		; BD FF 01
	ora ($94.b),Y		; 11 94
	bit $34.b		; 24 34
	and ($23.b),Y		; 31 23
	bpl  -2.b		; 10 FE
	inc $84FD.w,X		; FE FD 84
	txy		; 9B
	dec $F31F.w		; CE 1F F3
	adc [$64.b]		; 67 64
	eor [$52.b],Y		; 57 52
	sty $42.b		; 84 42
	dec $AB0E.w		; CE 0E AB
	ldy $DCDD.w,X		; BC DD DC
	sbc $001094.l,X		; FF 94 10 00
	ora ($00.b,X)		; 01 00
	ora $FFED.w		; 0D ED FF
	phx		; DA
	ldy $F0.b,X		; B4 F0
	asl $FFF0.w		; 0E F0 FF
	ora $D043F0.l		; 0F F0 43 D0
	ldy $53.b,X		; B4 53
	ora ($2F.b,X)		; 01 2F
	ora ($F0.b)		; 12 F0
	inc $0DF1.w,X		; FE F1 0D
	ldy $D1.b		; A4 D1
	brk $2F.b		; 00 2F
	sbc ($32.b)		; F2 32
	and ($F0.b),Y		; 31 F0
	eor ($94.b),Y		; 51 94
	cmp $CA00EE.l		; CF EE 00 CA
	dec $FDF3.w,X		; DE F3 FD
	tsb $94.b		; 04 94
	eor $20.b,X		; 55 20
	rol $31.b,X		; 36 31
	ora $BD1DE0.l		; 0F E0 1D BD
	sty $EF.b,X		; 94 EF
	sbc $10CE.w,X		; FD CE 10
	brk $F0.b		; 00 F0
	ora ($0F.b,S),Y		; 13 0F
	sty $EF.b,X		; 94 EF
	brk $CD.b		; 00 CD
	dec $CBEE.w,X		; DE EE CB
	dec $B4DB.w,X		; DE DB B4
	beq -15.b		; F0 F1
	eor ($C3.b,X)		; 41 C3
	eor ($02.b),Y		; 51 02
	bpl  33.b		; 10 21
	ldy $FE.b		; A4 FE
	cpx $CA13.w		; EC 13 CA
	sbc ($F1.b),Y		; F1 F1
	ora $A403.w,X		; 1D 03 A4
	and ($20.b)		; 32 20
	sbc ($40.b,S),Y		; F3 40
	cpx #$FF.b		; E0 FF
	ora $FE94EC.l,X		; 1F EC 94 FE
	ora ($EC.b)		; 12 EC
	rol $53.b		; 26 53
	jsr $4F36.w		; 20 36 4F
	sty $0F.b,X		; 94 0F
	sbc ($0C.b,X)		; E1 0C
	lda $FCFE.w,X		; BD FE FC
	cmp $F19411.l		; CF 11 94 F1
	sbc $00FD33.l,X		; FF 33 FD 00
	inc $FEBB.w,X		; FE BB FE
	ldy $FF.b,X		; B4 FF
	sbc $04FFE0.l,X		; FF E0 FF 04
	asl $2115.w,X		; 1E 15 21
	ldy $32.b		; A4 32
	ora $3F.b,S		; 03 3F
	inc $2ECF.w,X		; FE CF 2E
	ldx $9400.w,Y		; BE 00 94
	cop $FE.b		; 02 FE
	eor $53.b,X		; 55 53
	bmi  39.b		; 30 27
	rol $94EE.w		; 2E EE 94
	sbc $FFAD0C.l		; EF 0C AD FF
	bpl -48.b		; 10 D0
	mvn $94,$44		; 54 44 94
	ora ($46.b),Y		; 11 46
	rol $F0F0.w		; 2E F0 F0
	cmp $FDBF.w,X		; DD BF FD
	sty $CC.b		; 84 CC
	ldx $FF40.w		; AE 40 FF
	ora $40.b,S		; 03 40
	cpx $A4E0.w		; EC E0 A4
	inc $FEEF.w,X		; FE EF FE
	inc $DEEE.w		; EE EE DE
	inc $B477.w,X		; FE 77 B4
	cmp $200163.l,X		; DF 63 01 20
	tsb $FE.b		; 04 FE
	asl $A4F1.w		; 0E F1 A4
	rol A		; 2A
	lda ($2F.b,X)		; A1 2F
	bpl -31.b		; 10 E1
	eor $21.b,S		; 43 21
	ora $EE44A4.l		; 0F A4 44 EE
	sbc $E0FCF1.l,X		; FF F1 FC E0
	sbc ($0E.b),Y		; F1 0E
	sty $F4.b,X		; 94 F4
	adc $43.b,S		; 63 43
	ora $74.b,S		; 03 74
	cmp $94F000.l,X		; DF 00 F0 94
	tyx		; BB
	sbc $E2ECDE.l,X		; FF DE EC E2
	asl $1300.w,X		; 1E 00 13
	sty $1F.b,X		; 94 1F
	sbc $CCEC0E.l		; EF 0E EC CC
	inc $FBA9.w,X		; FE A9 FB
	ldy $E0.b,X		; B4 E0
	sbc ($4C.b,S),Y		; F3 4C
	sbc [$4F.b]		; E7 4F
	ora ($00.b,S),Y		; 13 00
	bmi -92.b		; 30 A4
	cmp $A923DD.l,X		; DF DD 23 A9
	ora ($F1.b)		; 12 F1
	ora $A414.w,X		; 1D 14 A4
	and ($11.b),Y		; 31 11
	sbc ($4F.b,S),Y		; F3 4F
	sbc $CD00F0.l		; EF F0 00 CD
	sty $F0.b,X		; 94 F0
	ora $2337EE.l,X		; 1F EE 37 23
	.db $42, $16		; 42 16
	lsr $E194.w,X		; 5E 94 E1
	ora $1DBDFD.l		; 0F FD BD 1D
	dec $21DD.w,X		; DE DD 21
	sty $FE.b,X		; 94 FE
	ora ($21.b,X)		; 01 21
	inc $FEE0.w,X		; FE E0 FE
	wai		; CB
	cmp $FFB4.w,X		; DD B4 FF
	inc $F4FF.w,X		; FE FF F4
	jmp $40D7.w		; 4C D7 40
	ora ($B4.b)		; 12 B4
	sbc ($31.b),Y		; F1 31
	sbc $EC12FE.l		; EF FE 12 EC
	sbc ($00.b)		; F2 00
	ldy $1D.b		; A4 1D
	tsb $32.b		; 04 32
	ora ($E2.b),Y		; 11 E2
	eor ($DE.b),Y		; 51 DE
	beq -96.b		; F0 A0
	mvp $CD,$1D		; 44 1D CD
	dec $B0DB.w,X		; DE DB B0
	and ($34.b,S),Y		; 33 34
	sty $35.b,X		; 94 35
	bvs -64.b		; 70 C0
	ora $10AB0F.l,X		; 1F 0F AB 10
	jmp.w [$AC84]		; DC 84 AC
	tsb $FB.b		; 04 FB
	sbc ($53.b,X)		; E1 53
	ora #$A3.b		; 09 A3
	and $FFB4.w,Y		; 39 B4 FF
	ora $E0FFFF.l		; 0F FF FF E0
	sbc $B4CF43.l,X		; FF 43 CF B4
	stz $00.b		; 64 00
	jsr $0D13.w		; 20 13 0D
	brk $E0.b		; 00 E0
	rol $DDB0.w		; 2E B0 DD
	sbc $13EE00.l,X		; FF 00 EE 13
	jsl $A43533.l		; 22 33 35 A4
	ora $00E0.w,X		; 1D E0 00
	ora $10B0.w,X		; 1D B0 10
	brk $F0.b		; 00 F0
	sty $57.b,X		; 94 57
	and ($12.b),Y		; 31 12
	and $2D.b,X		; 35 2D
	bne  31.b		; D0 1F
	sbc $CE94.w		; ED 94 CE
	ora $12DFDD.l		; 0F DD DF 12
	sbc $1F00.w		; ED 00 1F
	ldy $0F.b,X		; B4 0F
	ora $EF0F0F.l		; 0F 0F 0F EF
	ora $B414EE.l		; 0F EE 14 B4
	bit $51F4.w,X		; 3C F4 51
	brk $02.b		; 00 02
	and $A40FE0.l,X		; 3F E0 0F A4
	sbc $FB.b,S		; E3 FB
	bne  19.b		; D0 13
	ora $52E3.w,X		; 1D E3 52
	sbc ($94.b),Y		; F1 94
	sbc ($53.b),Y		; F1 53
	sbc $F3ED.w		; ED ED F3
	asl A		; 0A
	lda $1F9422.l		; AF 22 94 1F
	sbc ($55.b),Y		; F1 55
	eor ($11.b,X)		; 41 11
	and $2F.b,S		; 23 2F
	dec $F194.w,X		; DE 94 F1
	ora $F1BD.w		; 0D BD F1
	sbc $12DD.w,X		; FD DD 12
	inc $EF94.w,X		; FE 94 EF
	beq  -1.b		; F0 FF
	jmp.w [$0DDF]		; DC DF 0D
	tsx		; BA
	txs		; 9A
	ldy $F2.b,X		; B4 F2
	eor $4035D0.l,X		; 5F D0 35 40
	cmp $A0FD45.l		; CF 45 FD A0
	mvn $73,$47		; 54 47 73
	inc $03ED.w,X		; FE ED 03
	jsr $A4F0.w		; 20 F0 A4
	bit $2E.b,X		; 34 2E
	cpy #$42.b		; C0 42
	ora $12DE.w,X		; 1D DE 12
	asl $FEB0.w		; 0E B0 FE
	sbc $001100.l		; EF 00 11 00
	bit $44.b		; 24 44
	jsl $2C3594.l		; 22 94 35 2C
	lda $0EF1.w,X		; BD F1 0E
	cpy $00DF.w		; CC DF 00
	sty $FC.b		; 84 FC
	stz $2D13.w,X		; 9E 13 2D
	lda $EDF0.w,Y		; B9 F0 ED
	cmp #$C0.b		; C9 C0
	cmp $CDCC.w,X		; DD CC CD
	sbc $23F0FE.l,X		; FF FE F0 23
	and ($94.b)		; 32 94
	and $31.b,X		; 35 31
	asl $D9E0.w		; 0E E0 D9
	cmp ($4F.b,S),Y		; D3 4F
	jmp.w [$D394]		; DC 94 D3
	stz $FF.b		; 64 FF
	and ($11.b,X)		; 21 11
	bpl  33.b		; 10 21
	sbc $1190.w		; ED 90 11
	jsl $DECC1F.l		; 22 1F CC DE
	tsb $77.b		; 04 77
	adc [$84.b],Y		; 77 84
	ora ($63.b)		; 12 63
	sbc $EEDFDC.l,X		; FF DC DF EE
	cmp $74BB.w,X		; DD BB 74
	stz $CCEE.w		; 9C EE CC
	ldy $BBDC.w,X		; BC DC BB
	tyx		; BB
	tyx		; BB
	ldy $FF.b		; A4 FF
	sbc $53E1ED.l,X		; FF ED E1 53
	ora $A03301.l		; 0F 01 33 A0
	eor $57.b,S		; 43 57
	ror $66.b,X		; 76 66
	adc [$76.b]		; 67 76
	eor $55.b,X		; 55 55
	sty $FC.b		; 84 FC
	rep #$43		; C2 43
	jmp.w [$00F2]		; DC F2 00
	dec $7413.w,X		; DE 13 74
	eor $22BE.w,X		; 5D BE 22
	bit $64F2.w,X		; 3C F2 64
	ora $337403.l,X		; 1F 03 74 33
	ora ($35.b),Y		; 11 35
	bpl -47.b		; 10 D1
	ora ($EB.b),Y		; 11 EB
	jmp.w [$FE84]		; DC 84 FE
	jmp.w [$DCDD]		; DC DD DC
	cmp $EDDE.w		; CD DE ED
	dec $FF94.w,X		; DE 94 FF
	sbc $D3DCFE.l,X		; FF FE DC D3
	adc $9415FF.l		; 6F FF 15 94
	eor ($12.b),Y		; 51 12
	mvn $11,$32		; 54 32 11
	and ($0E.b),Y		; 31 0E
	ora $84.b,S		; 03 84
	and ($DB.b),Y		; 31 DB
	cpx #$0E.b		; E0 0E
	cmp $0E00.w		; CD 00 0E
	dec $0184.w,X		; DE 84 01
	sbc $4111.w		; ED 11 41
	bpl  19.b		; 10 13
	eor ($21.b,X)		; 41 21
	stz $65.b,X		; 74 65
	rti		; 40

	brk $32.b		; 00 32
	cpy $FFF1.w		; CC F1 FF
	lda $DF84.w,Y		; B9 84 DF
	sbc $DDCE.w		; ED CE DD
	cpy $DBCD.w		; CC CD DB
	ldy $EE94.w		; AC 94 EE
	cpx $26CD.w		; EC CD 26
	asl $5612.w		; 0E 12 56
	and ($94.b,X)		; 21 94
	and $44.b,X		; 35 44
	and ($22.b,X)		; 21 22
	bpl -32.b		; 10 E0
	jsl $BF84FF.l		; 22 FF 84 BF
	sbc $FFD0DB.l,X		; FF DB D0 FF
	inc $1FF0.w		; EE F0 1F
	stz $9F.b,X		; 74 9F
	eor $3E.b,X		; 55 3E
	ora ($46.b,X)		; 01 46
	mvp $53,$35		; 44 35 53
	stz $62.b,X		; 74 62
	and $40.b,S		; 23 40
	beq  16.b		; F0 10
	nop		; EA
	tyx		; BB
	cpy $DD84.w		; CC 84 DD
	dec $DDCD.w,X		; DE CD DD
	cmp $DDDC.w		; CD DC DD
	stp		; DB
	bcs -69.b		; B0 BB
	tsx		; BA
	sta $CCBD.w,Y		; 99 BD CC
	dec $0100.w,X		; DE 00 01
	sty $46.b,X		; 94 46
	and ($32.b,S),Y		; 33 32
	jsl $20E11E.l		; 22 1E E1 20
	asl $F084.w		; 0E 84 F0
	inc $FDBB.w,X		; FE BB FD
	sbc $0D020F.l,X		; FF 0F 02 0D
	sty $EF.b		; 84 EF
	and ($22.b,S),Y		; 33 22
	bit $52.b		; 24 52
	brk $21.b		; 00 21
	ora ($74.b,X)		; 01 74
	sbc ($34.b)		; F2 34
	nop		; EA
	tyx		; BB
	jmp.w [$CFAC]		; DC AC CF
	stp		; DB
	sty $FE.b,X		; 94 FE
	inc $EFEE.w,X		; FE EE EF
	inc $EDEE.w,X		; FE EE ED
	stp		; DB
	sty $BD.b,X		; 94 BD
	eor $0E.b,X		; 55 0E
	ora ($64.b,S),Y		; 13 64
	ora ($45.b,X)		; 01 45
	eor ($84.b,S),Y		; 53 84
	lsr $55.b,X		; 56 55
	ora $42B0.w,X		; 1D B0 42
	sbc $0EF1.w,X		; FD F1 0E
	sty $CA.b		; 84 CA
	dec $E0EE.w		; CE EE E0
	ora ($1E.b)		; 12 1E
	cpx #$11.b		; E0 11
	sty $01.b		; 84 01
	and $54.b		; 25 54
	and $12.b,S		; 23 12
	ora $842200.l		; 0F 00 22 84
	bpl -16.b		; 10 F0
	jsr ($DECC.w,X)		; FC CC DE
	inc $EDED.w		; EE ED ED
	sty $EE.b,X		; 94 EE
	sbc $DEFD.w		; ED FD DE
	sbc $65BCDB.l		; EF DB BC 65
	sty $EE.b,X		; 94 EE
	bit $63.b		; 24 63
	ora ($56.b),Y		; 11 56
	and ($34.b,S),Y		; 33 34
	and ($84.b)		; 32 84
	ora $41C0.w,X		; 1D C0 41
	cpx $FDF3.w		; EC F3 FD
	wai		; CB
	sbc $CC84.w		; ED 84 CC
	cpx #$12.b		; E0 12
	brk $F0.b		; 00 F0
	jsl $842402.l		; 22 02 24 84
	eor ($34.b,S),Y		; 53 34
	and ($00.b)		; 32 00
	beq   0.b		; F0 00
	sbc $EE840F.l,X		; FF 0F 84 EE
	cmp $DEDD.w		; CD DD DE
	cmp $CBCC.w,X		; DD CC CB
	tyx		; BB
	cpy #$ED.b		; C0 ED
	cmp $CCDD.w,X		; DD DD CC
	cmp $EFEE.w		; CD EE EF
	ora ($94.b,X)		; 01 94
	rti		; 40

	trb $51.b		; 14 51
	sbc ($44.b,S),Y		; F3 44
	and ($ED.b),Y		; 31 ED
	sbc $DFCC94.l		; EF 94 CC DF
	bpl  17.b		; 10 11
	ora ($1F.b)		; 12 1F
	beq   0.b		; F0 00
	sty $23.b		; 84 23
	and ($35.b,X)		; 21 35
	and ($10.b)		; 32 10
	brk $00.b		; 00 00
	sbc ($74.b)		; F2 74
	and $FBEE.w		; 2D EE FB
	phx		; DA
	ldy $BDED.w		; AC ED BD
	cmp $EDFF94.l,X		; DF 94 FF ED
	sbc $DCDC.w		; ED DC DC
	cpx $BADC.w		; EC DC BA
	ldy $CD.b		; A4 CD
	and [$64.b]		; 27 64
	lsr $65.b,X		; 56 65
	asl $EDF1.w,X		; 1E F1 ED
	sty $A0.b,X		; 94 A0
	ora $E0CBDD.l,X		; 1F DD CB E0
	sbc ($47.b,X)		; E1 47
	ror $94.b,X		; 76 94
	adc $21.b,S		; 63 21
	cpx $FEBE.w		; EC BE FE
	ora ($12.b,X)		; 01 12
	ora ($84.b),Y		; 11 84
	sbc ($43.b),Y		; F1 43
	and $54.b,S		; 23 54
	eor ($0D.b,X)		; 41 0D
	cpy $84B9.w		; CC B9 84
	lda $CDDC.w,X		; BD DC CD
	cmp $DDED.w		; CD ED DD
	cmp $C0BB.w,X		; DD BB C0
	cmp $CCDC.w,X		; DD DC CC
	tyx		; BB
	tsx		; BA
	plb		; AB
	cmp $45C002.l,X		; DF 02 C0 45
	ror $54.b		; 66 54
	and ($10.b,S),Y		; 33 10
	ora ($00.b,X)		; 01 00
	ora $01EFA4.l		; 0F A4 EF 01
	bit $54.b		; 24 54
	and ($10.b,S),Y		; 33 10
	inc $94DD.w		; EE DD 94
	lda $1233F2.l,X		; BF F2 33 12
	and ($02.b,X)		; 21 02
	and $22.b,S		; 23 22
	sty $20.b,X		; 94 20
	asl $CDCC.w		; 0E CC CD
	cmp $FFF0.w,X		; DD F0 FF
	asl $FF94.w		; 0E 94 FF
	inc $ECFE.w,X		; FE FE EC
	tyx		; BB
	plb		; AB
	ldy $B4BB.w		; AC BB B4
	inc $43F3.w,X		; FE F3 43
	eor $44.b,S		; 43 44
	ora $A4FEEF.l,X		; 1F EF FE A4
	lda $EF01.w,X		; BD 01 EF
	asl $22F0.w		; 0E F0 22
	and $53.b,X		; 35 53
	sty $62.b,X		; 94 62
	trb $A99A.w		; 1C 9A A9
	bne  19.b		; D0 13
	mvp $94,$22		; 44 22 94
	and ($01.b)		; 32 01
	and ($10.b)		; 32 10
	ora $CDCBDD.l,X		; 1F DD CB CD
	sty $EF.b,X		; 94 EF
	ora ($0F.b,X)		; 01 0F
	ora $CDEEFF.l		; 0F FF EE CD
	tyx		; BB
	ldy $FE.b,X		; B4 FE
	inc $EEFE.w,X		; FE FE EE
	and $44.b		; 25 44
	mvp $A4,$41		; 44 41 A4
	jsr ($CBCD.w,X)		; FC CD CB
	cmp $FFE02F.l		; CF 2F E0 FF
	sbc ($A4.b)		; F2 A4
	and ($56.b,S),Y		; 33 56
	eor ($10.b)		; 52 10
	cpx $CECC.w		; EC CC CE
	ora ($94.b,X)		; 01 94
	eor $44.b,X		; 55 44
	and ($30.b)		; 32 30
	ora ($21.b),Y		; 11 21
	brk $FD.b		; 00 FD
	sty $CC.b,X		; 94 CC
	ldy $F0EE.w,X		; BC EE F0
	bpl  15.b		; 10 0F
	sbc $FFB4ED.l,X		; FF ED B4 FF
	inc $EEEF.w,X		; FE EF EE
	sbc $53F3.w,X		; FD F3 53
	mvn $53,$B4		; 54 B4 53
	ora $EEEEED.l,X		; 1F ED EE EE
	ora ($FF.b,X)		; 01 FF
	ora $24F1A4.l		; 0F A4 F1 24
	eor $64.b,X		; 55 64
	jsr $BCED.w		; 20 ED BC
	jmp.w [$D194]		; DC 94 D1
	ora ($45.b,S),Y		; 13 45
	mvn $33,$45		; 54 45 33
	jsr $94FD.w		; 20 FD 94
	cpx $DDBD.w		; EC BD DD
	sbc $0FFFFF.l		; EF FF FF 0F
	ora ($B4.b,X)		; 01 B4
	brk $FF.b		; 00 FF
	sbc $EEEEEE.l		; EF EE EE EE
	pea $B444.w		; F4 44 B4
	eor $43.b		; 45 43
	ora $EFEEEE.l		; 0F EE EE EF
	beq  -1.b		; F0 FF
	ldy $FF.b		; A4 FF
	sbc ($45.b),Y		; F1 45
	lsr $54.b,X		; 56 54
	ora $94CCEC.l,X		; 1F EC CC 94
	tax		; AA
	cpx #$13.b		; E0 13
	eor $53.b,X		; 55 53
	mvn $20,$31		; 54 31 20
	sty $ED.b,X		; 94 ED
	sbc $DCCD.w		; ED CD DC
	dec $F0FF.w,X		; DE FF F0
	brk $B4.b		; 00 B4
	brk $FF.b		; 00 FF
	inc $EEFE.w,X		; FE FE EE
	dec $4414.w,X		; DE 14 44
	ldy $44.b,X		; B4 44
	.db $42, $FF		; 42 FF
	inc $FFEE.w		; EE EE FF
	ora $FFA4E0.l		; 0F E0 A4 FF
	sbc ($56.b),Y		; F1 56
	lsr $53.b,X		; 56 53
	ora $94CDCC.l		; 0F CC CD 94
	tyx		; BB
	sbc ($44.b)		; F2 44
	eor $42.b,S		; 43 42
	and ($22.b)		; 32 22
	and $FCFE94.l		; 2F 94 FE FC
	tyx		; BB
	jmp.w [$00EE]		; DC EE 00
	brk $FE.b		; 00 FE
	ldy $0F.b,X		; B4 0F
	inc $FEFE.w,X		; FE FE FE
	dec $3414.w,X		; DE 14 34
	mvp $41,$B4		; 44 B4 41
	ora $FFEEEE.l		; 0F EE EE FF
	ora $A40FEF.l,X		; 1F EF 0F A4
	ora ($46.b,X)		; 01 46
	adc $52.b		; 65 52
	ora $DECEDB.l,X		; 1F DB CE DE
	sty $14.b,X		; 94 14
	eor $22.b,S		; 43 22
	and ($21.b,X)		; 21 21
	bit $31.b		; 24 31
	inc $EC94.w		; EE 94 EC
	plb		; AB
	dec $F1FE.w		; CE FE F1
	sbc $B4CCDC.l,X		; FF DC CC B4
	inc $EDFE.w,X		; FE FE ED
	ora ($33.b,S),Y		; 13 33
	eor $42.b		; 45 42
	sbc $CCDEA4.l,X		; FF A4 DE CC
	dec $CE1F.w,X		; DE 1F CE
	sbc $A445F0.l,X		; FF F0 45 A4
	adc $52.b		; 65 52
	jsr $DDDC.w		; 20 DC DD
	inc $1112.w,X		; FE 12 11
	sty $00.b,X		; 94 00
	beq  18.b		; F0 12
	and $43.b		; 25 43
	inc $9BCC.w,X		; FE CC 9B
	ldy $EF.b		; A4 EF
	beq  15.b		; F0 0F
	asl $DEED.w		; 0E ED DE
	cmp $B4DB.w,X		; DD DB B4
	sbc ($33.b,S),Y		; F3 33
	bit $43.b,X		; 34 43
	brk $FE.b		; 00 FE
	sbc $00A4EE.l,X		; FF EE A4 00
	jmp.w [$00FF]		; DC FF 00
	ora $55.b,X		; 15 55
	eor ($21.b,S),Y		; 53 21
	sty $EB.b,X		; 94 EB
	txy		; 9B
	sbc $0E11F1.l,X		; FF F1 11 0E
	cmp $339414.l,X		; DF 14 94 33
	eor $0E.b,X		; 55 0E
	ldy $CDAB.w,X		; BC AB CD
	cpx #$FE.b		; E0 FE
	cpy #$ED.b		; C0 ED
	jmp.w [$AABB]		; DC BB AA
	txs		; 9A
	dec $4502.w		; CE 02 45
	ldy $5F.b		; A4 5F
	cpx $CDEF.w		; EC EF CD
	cmp ($FB.b),Y		; D1 FB
	dec $A4F0.w,X		; DE F0 A4
	trb $56.b		; 14 56
	adc $20.b		; 65 20
	asl $F0DD.w,X		; 1E DD F0
	brk $94.b		; 00 94
	sbc $14DDEE.l,X		; FF EE DD 14
	stz $45.b		; 64 45
	rol $A4CA.w		; 2E CA A4
	dec $FFEE.w,X		; DE EE FF
	sbc $CCCDED.l,X		; FF ED CD CC
	cpy $04B4.w		; CC B4 04
	eor $44.b,S		; 43 44
	.db $42, $0F		; 42 0F
	sbc $A4FFFE.l		; EF FE FF A4
	ora $00DECB.l		; 0F CB DE 00
	and $76.b		; 25 76
	adc $21.b,S		; 63 21
	sty $1C.b,X		; 94 1C
	lda $DD0F.w,X		; BD 0F DD
	cpy $E0CC.w		; CC CC E0
	lsr $94.b		; 46 94
	adc $53.b		; 65 53
	ora $CCBB.w		; 0D BB CC
	cpy $B9CD.w		; CC CD B9
	ldy $EE.b,X		; B4 EE
	sbc $4314DE.l		; EF DE 14 43
	mvp $0F,$42		; 44 42 0F
	ldy $CE.b		; A4 CE
	sbc $00DE.w		; ED DE 00
	wai		; CB
	cmp $14F0.w,X		; DD F0 14
	ldy $57.b		; A4 57
	stz $22.b		; 64 22
	ora $FE00EF.l,X		; 1F EF 00 FE
	inc $CC94.w		; EE 94 CC
	dec $5516.w		; CE 16 55
	eor $20.b,S		; 43 20
	stp		; DB
	cmp $FFB4.w,X		; DD B4 FF
	sbc $EEEEFE.l,X		; FF FE EE EE
	cmp $B43414.l,X		; DF 14 34 B4
	mvn $0F,$41		; 54 41 0F
	cpx #$FE.b		; E0 FE
	sbc $A4FE0F.l,X		; FF 0F FE A4
	lda $03EF.w,X		; BD EF 03
	ror $64.b		; 66 64
	and ($20.b)		; 32 20
	sbc $FD0094.l,X		; FF 94 00 FD
	ldy $BDCC.w		; AC CC BD
	ora ($44.b,S),Y		; 13 44
	.db $42, $A4		; 42 A4
	bpl  -1.b		; 10 FF
	sbc $DDDEFF.l,X		; FF FF DE DD
	wai		; CB
	tyx		; BB
	ldy $EF.b,X		; B4 EF
	and $34.b,S		; 23 34
	mvp $1F,$31		; 44 31 1F
	beq  -1.b		; F0 FF
	ldy $D0.b		; A4 D0
	ora $CDDB.w		; 0D DB CD
	dec $5502.w,X		; DE 02 55
	eor ($A4.b,S),Y		; 53 A4
	mvp $00,$21		; 44 21 00
	bpl  -1.b		; 10 FF
	dec $EEED.w,X		; DE ED EE
	sty $02.b,X		; 94 02
	jsl $FE2132.l		; 22 32 21 FE
	beq  14.b		; F0 0E
	jmp.w [$DDA4]		; DC A4 DD
	cpy $BFBB.w		; CC BB BF
	bit $66.b,X		; 34 66
	adc [$54.b],Y		; 77 54
	ldy $10.b		; A4 10
	beq  14.b		; F0 0E
	beq  -2.b		; F0 FE
	cmp $DDBD.w,X		; DD BD DD
	ldy $F0.b		; A4 F0
	bit $33.b,X		; 34 33
	eor $33.b,S		; 43 33
	ora ($11.b),Y		; 11 11
	ora $CCCC94.l		; 0F 94 CC CC
	lda $11EF.w,X		; BD EF 11
	brk $11.b		; 00 11
	brk $A4.b		; 00 A4
	brk $10.b		; 00 10
	sbc $CDDCED.l,X		; FF ED DC CD
	lda $A4E2.w,X		; BD E2 A4
	mvp $65,$55		; 44 55 65
	and ($00.b)		; 32 00
	bpl  -1.b		; 10 FF
	brk $94.b		; 00 94
	cpx $AB99.w		; EC 99 AB
	ldx $65E2.w,Y		; BE E2 65
	eor $56.b,X		; 55 56
	sty $54.b,X		; 94 54
	jsl $CDFD22.l		; 22 22 FD CD
	dec $F0EE.w,X		; DE EE F0
	sty $0F.b,X		; 94 0F
	sbc $010000.l,X		; FF 00 00 01
	bpl -19.b		; 10 ED
	cpy $EDA4.w		; CC A4 ED
	sbc $E2DD.w		; ED DD E2
	and $44.b,S		; 23 44
	eor $22.b,X		; 55 22
	sty $10.b,X		; 94 10
	ora ($0F.b),Y		; 11 0F
	ora ($ED.b,X)		; 01 ED
	wai		; CB
	ldy $94DE.w		; AC DE 94
	cpx #$34.b		; E0 34
	bit $34.b,X		; 34 34
	mvp $11,$31		; 44 31 11
	asl $AC84.w		; 0E 84 AC
	inc $DDFD.w		; EE FD DD
	sbc $F0DFDC.l,X		; FF DC DF F0
	sty $FF.b,X		; 94 FF
	ora ($FE.b,X)		; 01 FE
	dec $DDDE.w,X		; DE DE DD
	cmp $94CB.w,X		; DD CB 94
	cmp ($45.b),Y		; D1 45
	ror $76.b		; 66 76
	eor ($0F.b,S),Y		; 53 0F
	ora ($10.b),Y		; 11 10
	sty $01.b,X		; 94 01
	ora $EFCDDB.l		; 0F DB CD EF
	beq  35.b		; F0 23
	and ($84.b)		; 32 84
	eor $56.b,S		; 43 56
	.db $42, $01		; 42 01
	and ($EE.b,X)		; 21 EE
	cpx #$10.b		; E0 10
	bcc  66.b		; 90 42
	and ($0F.b,X)		; 21 0F
	jmp.w [$CBCC]		; DC CC CB
	tyx		; BB
	tyx		; BB
	sty $FE.b,X		; 94 FE
	sbc $EEEEFF.l,X		; FF FF EE EE
	stp		; DB
	bne  35.b		; D0 23
	sty $53.b,X		; 94 53
	eor $43.b		; 45 43
	bpl   2.b		; 10 02
	and ($00.b,X)		; 21 00
	sbc $CDFC94.l,X		; FF 94 FC CD
	beq  15.b		; F0 0F
	ora ($21.b),Y		; 11 21
	bpl   2.b		; 10 02
	sty $74.b		; 84 74
	ora ($11.b),Y		; 11 11
	ora $11DE.w		; 0D DE 11
	asl $74EF.w,X		; 1E EF 74
	inc $C1CA.w		; EE CA C1
	ora ($ED.b),Y		; 11 ED
	sbc ($ED.b),Y		; F1 ED
	stp		; DB
	bcs  -1.b		; B0 FF
	sbc $DDEEEE.l,X		; FF EE EE DD
	wai		; CB
	ldy $94DE.w,X		; BC DE 94
	mvp $31,$44		; 44 44 31
	ora ($23.b,X)		; 01 23
	and ($F0.b,X)		; 21 F0
	sbc $CEB984.l,X		; FF 84 B9 CE
	cop $00.b		; 02 00
	jsl $24EF22.l		; 22 22 EF 24
	sty $54.b		; 84 54
	brk $00.b		; 00 00
	sbc $22EF.w,X		; FD EF 22
	asl $74EF.w,X		; 1E EF 74
	inc $E1CA.w,X		; FE CA E1
	and ($ED.b)		; 32 ED
	asl $B9FC.w		; 0E FC B9
	sty $FF.b		; 84 FF
	inc $DDDD.w,X		; FE DD DD
	phx		; DA
	lda $5590.w,Y		; B9 90 55
	ldy #$CE.b		; A0 CE
	cop $34.b		; 02 34
	mvn $77,$45		; 54 45 77
	ror $54.b,X		; 76 54
	sty $DB.b		; 84 DB
	tsx		; BA
	sbc ($31.b),Y		; F1 31
	beq   1.b		; F0 01
	ora $2584E0.l		; 0F E0 84 25
	.db $42, $1E		; 42 1E
	ora $1200FE.l		; 0F FE 00 12
	ora $EEDE74.l		; 0F 74 DE EE
	dec $1DD0.w		; CE D0 1D
	phd		; 0B
	cmp $FE84DF.l,X		; DF DF 84 FE
	cmp $EEDDFE.l,X		; DF FE DD EE
	cpx $AADC.w		; EC DC AA
	sty $02.b,X		; 94 02
	mvp $33,$43		; 44 43 33
	jsl $212300.l		; 22 00 23 21
	sty $DC.b		; 84 DC
	ldy $CFED.w		; AC ED CF
	trb $30.b		; 14 30
	ora $74F2.w		; 0D F2 74
	jsr $4514.w		; 20 14 45
	and ($11.b),Y		; 31 11
	and ($FF.b)		; 32 FF
	brk $64.b		; 00 64
	and ($EA.b)		; 32 EA
	dec $990D.w,X		; DE 0D 99
	bcs  -4.b		; B0 FC
	tyx		; BB
	stz $CF.b,X		; 74 CF
	ora $DDDD.w,X		; 1D DD DD
	jsr ($FCDC.w,X)		; FC DC FC
	tax		; AA
	sty $EE.b,X		; 94 EE
	dec $15DF.w,X		; DE DF 15
	mvp $22,$32		; 44 32 22
	and ($84.b,X)		; 21 84
	and ($55.b,S),Y		; 33 55
	and $BF9A.w		; 2D 9A BF
	beq -16.b		; F0 F0
	jsl $AE0D74.l		; 22 74 0D AE
	and [$43.b]		; 27 43
	bpl  31.b		; 10 1F
	sbc $4484F2.l		; EF F2 84 44
	jsr $F1FE.w		; 20 FE F1
	ora $0D00F0.l		; 0F F0 00 0D
	stz $CC.b,X		; 74 CC
	bpl  -4.b		; 10 FC
	dec $DBFF.w,X		; DE FF DB
	cmp $FF94EF.l,X		; DF EF 94 FF
	sbc $EEFEFE.l		; EF FE FE EE
	cmp $45D0.w,X		; DD D0 45
	sty $55.b,X		; 94 55
	jsl $223222.l		; 22 22 32 22
	and $FE.b,S		; 23 FE
	ldy $C084.w,X		; BC 84 C0
	ora ($FE.b,X)		; 01 FE
	brk $0F.b		; 00 0F
	beq  53.b		; F0 35
	eor $84.b,S		; 43 84
	inc $12FF.w		; EE FF 12
	beq  19.b		; F0 13
	.db $42, $0F		; 42 0F
	sbc ($74.b),Y		; F1 74
	and $ED.b,S		; 23 ED
	cmp $CFCD0D.l,X		; DF 0D CD CF
	ora $A0EB.w		; 0D EB A0
	inc $EDEE.w		; EE EE ED
	cmp $CCDD.w,X		; DD DD CC
	tyx		; BB
	tax		; AA
	sty $ED.b,X		; 94 ED
	cmp $05CC.w,X		; DD CC 05
	adc [$52.b],Y		; 77 52
	ora ($24.b)		; 12 24
	sty $43.b,X		; 94 43
	and $2F.b,S		; 23 2F
	wai		; CB
	lda $1F11.w		; AD 11 1F
	inc $D184.w		; EE 84 D1
	ora ($45.b)		; 12 45
	adc [$3F.b]		; 67 3F
	cmp $5103.w		; CD 03 51
	ldy #$32.b		; A0 32
	bpl  15.b		; 10 0F
	beq  19.b		; F0 13
	mvp $12,$32		; 44 32 12
	sty $43.b		; 84 43
	ora $FDEE.w		; 0D EE FD
	cmp $1EF0.w		; CD F0 1E
	jmp.w [$C084]		; DC 84 C0
	ora ($FD.b),Y		; 11 FD
	sbc $BACB.w		; ED CB BA
	tsx		; BA
	sta $EEA4.w,Y		; 99 A4 EE
	ora ($45.b,S),Y		; 13 45
	jsr $3301.w		; 20 01 33
	and ($10.b,X)		; 21 10
	sty $0E.b,X		; 94 0E
	tsx		; BA
	lda $1E12.w		; AD 12 1E
	cmp $44F1.w		; CD F1 44
	sty $33.b,X		; 94 33
	and ($10.b,S),Y		; 33 10
	sbc $EC2102.l		; EF 02 21 EC
	lda $DDA0.w,X		; BD A0 DD
	inc $3401.w		; EE 01 34
	eor $23.b,S		; 43 23
	lsr $65.b		; 46 65
	sty $AC.b		; 84 AC
	cmp $FEBDED.l,X		; DF ED BD FE
	sbc $23CE.w		; ED CE 23
	sty $10.b,X		; 94 10
	sbc $EEEF.w		; ED EF EE
	stp		; DB
	cpy $C2BA.w		; CC BA C2
	ldy $46.b		; A4 46
	eor ($F0.b,S),Y		; 53 F0
	ora ($43.b,S),Y		; 13 43
	jsr $EDFF.w		; 20 FF ED
	sty $BA.b,X		; 94 BA
	cmp ($21.b)		; D2 21
	cpx $47BF.w		; EC BF 47
	adc $21.b		; 65 21
	sty $11.b,X		; 94 11
	brk $F1.b		; 00 F1
	ora ($FC.b),Y		; 11 FC
	plb		; AB
	bne  50.b		; D0 32
	sty $0D.b		; 84 0D
	tsb $76.b		; 04 76
	adc ($36.b,S),Y		; 73 36
	.db $42, $EB		; 42 EB
	ldx $0094.w,Y		; BE 94 00
	sbc $F1BD.w,X		; FD BD F1
	brk $F0.b		; 00 F0
	ora ($1F.b,X)		; 01 1F
	ldy $0F.b		; A4 0F
	ora $EEDEFF.l		; 0F FF DE EE
	sbc $F5CD.w,X		; FD CD F5
	ldy $66.b		; A4 66
	rti		; 40

	sbc ($34.b),Y		; F1 34
	.db $42, $0E		; 42 0E
	sbc $EEA4DD.l		; EF DD A4 EE
	ora ($1F.b),Y		; 11 1F
	inc $5402.w		; EE 02 54
	ora ($0F.b),Y		; 11 0F
	sty $21.b,X		; 94 21
	ora $CAFE00.l,X		; 1F 00 FE CA
	lda $942023.l,X		; BF 23 20 94
	cmp $6612.w,X		; DD 12 66
	mvn $FF,$1F		; 54 1F FF
	beq  16.b		; F0 10
	bcc 116.b		; 90 74
	phd		; 0B
	sta $BB9B.w,Y		; 99 9B BB
	lda #$9A.b		; A9 9A
	ldy $1094.w,X		; BC 94 10
	inc $CDDD.w,X		; FE DD CD
	inc $CBDC.w,X		; FE DC CB
	tax		; AA
	ldy $E4.b		; A4 E4
	ror $51.b		; 66 51
	sbc $1D5324.l		; EF 24 53 1D
	cmp $EFDFA4.l,X		; DF A4 DF EF
	ora ($1F.b,X)		; 01 1F
	inc $4501.w		; EE 01 45
	jsr $EF94.w		; 20 94 EF
	cop $21.b		; 02 21
	sbc $DEDCEE.l,X		; FF EE DC DE
	ora ($94.b,S),Y		; 13 94
	jsr $04DE.w		; 20 DE 04
	lsr $41.b,X		; 56 41
	beq   0.b		; F0 00
	brk $84.b		; 00 84
	ora $CFAADC.l		; 0F DC AA CF
	ora ($0C.b),Y		; 11 0C
	cpy $9401.w		; CC 01 94
	ora ($FF.b),Y		; 11 FF
	inc $DEEE.w,X		; FE EE DE
	sbc $A4B9DB.l		; EF DB B9 A4
	cmp $FF5356.l,X		; DF 56 53 FF
	ora $44.b,S		; 03 44
	jsr $A0DE.w		; 20 DE A0
	eor ($10.b,S),Y		; 53 10
	brk $11.b		; 00 11
	ora $F3CD.w		; 0D CD F3
	lsr $84.b,X		; 56 84
	jsr ($23F2.w,X)		; FC F2 23
	ora $9CD90E.l		; 0F 0E D9 9C
	pea $5184.w		; F4 84 51
	xba		; EB
	cpy #$57.b		; C0 57
	adc $32.b		; 65 32
	and ($F0.b,X)		; 21 F0
	sty $12.b		; 84 12
	bmi -21.b		; 30 EB
	lda $0EF1.w		; AD F1 0E
	cpy $94EE.w		; CC EE 94
	beq   0.b		; F0 00
	beq  -3.b		; F0 FD
	inc $0FFF.w		; EE FF 0F
	xba		; EB
	bcs -70.b		; B0 BA
	sta $E09C.w,Y		; 99 9C E0
	bpl   0.b		; 10 00
	and $45.b,S		; 23 45
	sty $0B.b		; 84 0B
	sbc $CEDC.w,X		; FD DC CE
	and ($1D.b,X)		; 21 1D
	plb		; AB
	sbc $84.b,X		; F5 84
	ror $51.b,X		; 76 51
	ora ($00.b,X)		; 01 00
	ora $CA2021.l		; 0F 21 20 CA
	sty $BE.b		; 84 BE
	and ($1F.b,X)		; 21 1F
	cmp $4442F1.l,X		; DF F1 42 44
	eor ($74.b,S),Y		; 53 74
	.db $42, $1E		; 42 1E
	jsl $99CC10.l		; 22 10 CC 99
	ldy $84BC.w,X		; BC BC 84
	cpx #$EF.b		; E0 EF
	dec $0FE0.w,X		; DE E0 0F
	cpx $EDCC.w		; EC CC ED
	sty $EE.b,X		; 94 EE
	cmp $F5CD.w,X		; DD CD F5
	stz $31.b		; 64 31
	beq  69.b		; F0 45
	sty $51.b		; 84 51
	and ($24.b,X)		; 21 24
	asl $11CD.w,X		; 1E CD 11
	and ($FE.b)		; 32 FE
	stz $AE.b		; 64 AE
	adc ($26.b,X)		; 61 26
	rol $2F.b		; 26 2F
	plb		; AB
	sta $45.b,X		; 95 45
	bra 100.b		; 80 64
	and ($22.b)		; 32 22
	ora $FEDEED.l,X		; 1F ED DE FE
	sbc $442474.l		; EF 74 24 44
	bit $33.b,X		; 34 33
	and ($32.b)		; 32 32
	ora ($FE.b)		; 12 FE
	stz $DE.b,X		; 74 DE
	ldy $A9DA.w,X		; BC DA A9
	tyx		; BB
	tsx		; BA
	dex		; CA
	wai		; CB
	sty $FE.b		; 84 FE
	dec $CEDD.w,X		; DE DD CE
	cmp $41D4.w,Y		; D9 D4 41
	rti		; 40

	sty $01.b,X		; 94 01
	and $30.b,X		; 35 30
	and ($23.b),Y		; 31 23
	bmi  15.b		; 30 0F
	ora ($74.b),Y		; 11 74
	eor $FD.b,S		; 43 FD
	dec $CD2C.w,X		; DE 2C CD
	sbc ($ED.b),Y		; F1 ED
	plx		; FA
	bvs -52.b		; 70 CC
	cpx $ACA9.w		; EC A9 AC
	cop $EC.b		; 02 EC
	txs		; 9A
	dec $0074.w		; CE 74 00
	.db $42, $22		; 42 22
	eor $25.b,S		; 43 25
	adc ($23.b,S),Y		; 73 23
	rti		; 40

	sty $10.b		; 84 10
	sbc $CDEEE0.l,X		; FF E0 EE CD
	dec $DDDE.w		; CE DE DD
	sty $DE.b		; 84 DE
	sbc $DEEE.w,X		; FD EE DE
	cmp $C9DC.w,X		; DD DC C9
	dec $94.b		; C6 94
	bmi  17.b		; 30 11
	sbc ($36.b)		; F2 36
	and $212322.l,X		; 3F 22 23 21
	stz $CD.b,X		; 74 CD
	adc $11.b		; 65 11
	sbc $C10CE0.l,X		; FF E0 0C C1
	ora ($74.b),Y		; 11 74
	sbc #$EB.b		; E9 EB
	tsb $EE.b		; 04 EE
	cpy #$30.b		; C0 30
	asl $74CF.w		; 0E CF 74
	ora ($20.b,X)		; 01 20
	sbc ($42.b)		; F2 42
	jsl $4F4745.l		; 22 45 47 4F
	stz $25.b,X		; 74 25
	jsl $DDE00F.l		; 22 0F E0 DD
	lda $CBCA.w,Y		; B9 CA CB
	stz $9B.b,X		; 74 9B
	plb		; AB
	dex		; CA
	ldy $DBDD.w,X		; BC DD DB
	cmp #$9A.b		; C9 9A
	sty $ED.b,X		; 94 ED
	dec $0143.w,X		; DE 43 01
	ora $025135.l		; 0F 35 51 02
	sty $65.b		; 84 65
	adc ($10.b,X)		; 61 10
	ora $0F.b,X		; 15 0F
	ora $84EF2F.l		; 0F 2F EF 84
	cpx #$30.b		; E0 30
	cpx $01C0.w		; EC C0 01
	asl $20FF.w		; 0E FF 20
	stz $CE.b,X		; 74 CE
	beq  48.b		; F0 30
	asl $52D4.w		; 0E D4 52
	cop $47.b		; 02 47
	stz $45.b,X		; 74 45
	and $0F4235.l		; 2F 35 42 0F
	cpx #$DB.b		; E0 DB
	stp		; DB
	ldy #$0F.b		; A0 0F
	inc $DCDD.w,X		; FE DD DC
	cpy $BABB.w		; CC BB BA
	tax		; AA
	sty $DE.b		; 84 DE
	inc $CEDC.w		; EE DC CE
	cmp $F176.w		; CD 76 F1
	ora ($94.b)		; 12 94
	and ($42.b,S),Y		; 33 42
	ora $32.b,S		; 03 32
	ora ($11.b),Y		; 11 11
	cop $0F.b		; 02 0F
	stz $21.b,X		; 74 21
	ora $C0B1.w		; 0D B1 C0
	and $D3C9.w,X		; 3D C9 D3
	bne 116.b		; D0 74
	tsb $F20E.w		; 0C 0E F2
	cmp $100E2F.l		; CF 2F 0E 10
	asl $74.b,X		; 16 74
	rti		; 40

	bit $55.b		; 24 55
	and ($12.b,S),Y		; 33 12
	eor ($00.b,S),Y		; 53 00
	ora $FBED74.l		; 0F 74 ED FB
	jmp.w [$ABCA]		; DC CA AB
	cmp $AAAD.w,X		; DD AD AA
	sty $DF.b		; 84 DF
	inc $DEEE.w		; EE EE DE
	dec $CCDB.w,X		; DE DB CC
	lda ($94.b,X)		; A1 94
	eor ($E1.b,S),Y		; 53 E1
	cop $45.b		; 02 45
	bmi  35.b		; 30 23
	and ($11.b),Y		; 31 11
	ldy #$77.b		; A0 77
	adc [$65.b],Y		; 77 65
	eor $44.b,X		; 55 44
	and ($23.b,S),Y		; 33 23
	and ($70.b)		; 32 70
	rts		; 60

	bit $22.b		; 24 22
	asl $CACC.w		; 0E CC CA
	stz $74EC.w		; 9C EC 74
	cpx #$14.b		; E0 14
	jsl $236502.l		; 22 02 65 23
	ora ($45.b,S),Y		; 13 45
	stz $10.b,X		; 74 10
	and $DCEF0D.l		; 2F 0D EF DC
	jmp.w [$BDAA]		; DC AA BD
	stz $BB.b,X		; 74 BB
	plb		; AB
	wai		; CB
	dex		; CA
	sta $ADBB.w,Y		; 99 BB AD
	cmp #$B0.b		; C9 B0
	wai		; CB
	tsx		; BA
	plb		; AB
	cmp $1200FF.l,X		; DF FF 00 12
	bit $84.b,X		; 34 84
	tsb $2C.b		; 04 2C
	pea $EE31.w		; F4 31 EE
	plb		; AB
	asl $11.b,X		; 16 11
	sty $00.b		; 84 00
	sbc $2E0332.l		; EF 32 03 2E
	lda $1111.w,X		; BD 11 11
	sty $CC.b		; 84 CC
	dec $231E.w,X		; DE 1E 23
	jsl $722422.l		; 22 22 24 72
	sty $0F.b		; 84 0F
	ora ($22.b,X)		; 01 22
	asl $DDDD.w		; 0E DD DD
	sbc $DE84DC.l,X		; FF DC 84 DE
	cpx #$00.b		; E0 00
	jmp.w [$FFDD]		; DC DD FF
	cpx $A4CD.w		; EC CD A4
	beq -16.b		; F0 F0
	sbc $EFE0FF.l,X		; FF FF E0 EF
	ora $50.b,X		; 15 50
	bcs   1.b		; B0 01
	and $56.b,S		; 23 56
	mvn $22,$43		; 54 43 22
	and ($10.b)		; 32 10
	sty $FF.b,X		; 94 FF
	bit $2F.b		; 24 2F
	sbc ($13.b),Y		; F1 13
	eor ($EE.b,X)		; 41 EE
	ora ($90.b,X)		; 01 90
	eor $53.b,X		; 55 53
	ora $FDEFED.l		; 0F ED EF FD
	dec $8415.w		; CE 15 84
	eor ($04.b)		; 52 04
	and ($30.b,S),Y		; 33 30
	sbc $0F01.w,X		; FD 01 0F
	cmp $CE84.w,X		; DD 84 CE
	inc $DDDE.w,X		; FE DE DD
	cpx #$0F.b		; E0 0F
	cpx $84CE.w		; EC CE 84
	inc $DDDB.w		; EE DB DD
	cop $1A.b		; 02 1A
	ldx $CCFD.w		; AE FD CC
	bcs -70.b		; B0 BA
	sta $10C0.w,Y		; 99 C0 10
	ora ($35.b,X)		; 01 35
	ror $44.b		; 66 44
	sty $1F.b,X		; 94 1F
.ACCU 8
.INDEX 8
	sep #$FA		; E2 FA
	cpy #$11.b		; C0 11
	and ($F1.b),Y		; 31 F1
	and ($84.b)		; 32 84
	eor [$FC.b]		; 47 FC
	sbc ($1F.b)		; F2 1F
	stp		; DB
	lda $84CE3F.l		; AF 3F CE 84
	beq  19.b		; F0 13
	trb $62.b		; 14 62
	rol $73.b		; 26 73
	beq  15.b		; F0 0F
	sty $22.b		; 84 22
	cpx $E0DF.w		; EC DF E0
	jsr ($EFCC.w,X)		; FC CC EF
	brk $84.b		; 00 84
	dec $FF0E.w		; CE 0E FF
	xba		; EB
	cmp $CBDE.w		; CD DE CB
	sta $F0A4.w,X		; 9D A4 F0
	sbc $E1E0FE.l,X		; FF FE E0 E1
	adc [$FF.b]		; 67 FF
	and ($A4.b,S),Y		; 33 A4
	and $2C.b		; 25 2C
	sbc ($0F.b,X)		; E1 0F
	brk $DF.b		; 00 DF
	bpl   1.b		; 10 01
	sty $1F.b,X		; 94 1F
	bit $11.b,X		; 34 11
	bmi -31.b		; 30 E1
	ora $94DFFE.l,X		; 1F FE DF 94
	ora ($0E.b,X)		; 01 0E
	sbc $F01F12.l		; EF 12 1F F0
	and $63.b,S		; 23 63
	sty $D1.b		; 84 D1
	and $43.b,S		; 23 43
	phx		; DA
	sbc ($0F.b,X)		; E1 0F
	xce		; FB
	ldx $0F84.w		; AE 84 0F
	sbc $01CD.w		; ED CD 01
	asl $0FDD.w		; 0E DD 0F
	cpx $EE94.w		; EC 94 EE
	inc $FEEE.w		; EE EE FE
	cmp $DBFF.w,X		; DD FF DB
	dec $27A4.w,X		; DE A4 27
	adc $5133E4.l		; 6F E4 33 51
	lda $940F10.l,X		; BF 10 0F 94
	jmp.w [$02E2]		; DC E2 02
	ora $113115.l,X		; 1F 15 31 11
	beq -124.b		; F0 84
	eor ($DD.b),Y		; 51 DD
	stz $0C12.w		; 9C 12 0C
	wai		; CB
	asl $5D.b		; 06 5D
	sty $F0.b,X		; 94 F0
	ora ($53.b,S),Y		; 13 53
	asl $2112.w,X		; 1E 12 21
	asl $84E0.w		; 0E E0 84
	and $00BDED.l		; 2F ED BD 00
	jmp.w [$01CE]		; DC CE 01
	sbc $EF84.w,X		; FD 84 EF
	asl $BCEC.w,X		; 1E EC BC
	cmp $BBCEBB.l,X		; DF BB CE BB
	bcs -69.b		; B0 BB
	lda #$99.b		; A9 99
	sta $0210.w,X		; 9D 10 02
	bit $77.b,X		; 34 77
	ldy $BF.b		; A4 BF
	jsr $DFFF.w		; 20 FF DF
	brk $01.b		; 00 01
	ora $608414.l		; 0F 14 84 60
	ora ($F3.b),Y		; 11 F3
	rti		; 40

	dex		; CA
	stz $DD32.w,X		; 9E 32 DD
	sty $DE.b,X		; 94 DE
	and $1E.b,S		; 23 1E
	sbc $3F3422.l,X		; FF 22 34 3F
	ora $84.b,S		; 03 84
	adc ($EF.b,X)		; 61 EF
	lda $DECB30.l,X		; BF 30 CB DE
	ora $CD84DC.l		; 0F DC 84 CD
	ora ($ED.b)		; 12 ED
	cmp $ABFE0F.l		; CF 0F FE AB
	dec $DCB0.w,X		; DE B0 DC
	cpy $BBBB.w		; CC BB BB
	tsx		; BA
	sta $F19A.w,Y		; 99 9A F1
	ldy $D1.b		; A4 D1
	eor $44.b,S		; 43 44
	cpx $F011.w		; EC 11 F0
	sbc $9401.w		; ED 01 94
	sbc ($1F.b),Y		; F1 1F
	inc $61.b,X		; F6 61
	brk $01.b		; 00 01
	and ($ED.b),Y		; 31 ED
	sty $9C.b		; 84 9C
	bit $DD.b		; 24 DD
	wai		; CB
	asl $4F.b		; 06 4F
	dec $9405.w		; CE 05 94
	and ($41.b)		; 32 41
	sbc ($32.b)		; F2 32
	ora $FE11FE.l		; 0F FE 11 FE
	sty $BE.b		; 84 BE
	brk $EC.b		; 00 EC
	lda $DE1C00.l,X		; BF 00 1C DE
	brk $94.b		; 00 94
	sbc $E0DD.w,X		; FD DD E0
	sbc $EFDD.w		; ED DD EF
	sbc $B4CB.w,X		; FD CB B4
	sbc $023E15.l,X		; FF 15 3E 02
	jsl $10E02F.l		; 22 2F E0 10
	sty $DC.b,X		; 94 DC
	ldy #$10.b		; A0 10
	ora ($EF.b)		; 12 EF
	adc [$2F.b]		; 67 2F
	beq -108.b		; F0 94
	ora ($1F.b,S),Y		; 13 1F
	cpy $20E1.w		; CC E1 20
	sbc $42E0.w		; ED E0 42
	sty $0B.b		; 84 0B
	cmp ($44.b),Y		; D1 44
	ora ($45.b,X)		; 01 45
	adc [$4F.b]		; 67 4F
	sep #$84		; E2 84
	jsr $BEEC.w		; 20 EC BE
	sbc ($DC.b),Y		; F1 DC
	dec $FD1F.w		; CE 1F FD
	sty $DE.b		; 84 DE
	beq  12.b		; F0 0C
	cmp $DCCD.w,X		; DD CD DC
	cpy $B4DD.w		; CC DD B4
	ora $0FFF0F.l		; 0F 0F FF 0F
	sbc ($53.b,X)		; E1 53
	cpx #$21.b		; E0 21
	ldy $55.b		; A4 55
	xce		; FB
	cop $F0.b		; 02 F0
	cmp $0001.w,X		; DD 01 00
	ora $720694.l,X		; 1F 94 06 72
	beq -14.b		; F0 F2
	jsr $BEFE.w		; 20 FE BE
	ora ($84.b)		; 12 84
	sbc $16CA.w,X		; FD CA 16
	rts		; 60

	ldx $5447.w,Y		; BE 47 54
	eor ($84.b,X)		; 41 84
	sbc $41.b		; E5 41
	jsr ($10F1.w,X)		; FC F1 10
	jmp.w [$1EDF]		; DC DF 1E
	sty $DB.b		; 84 DB
	cmp $CEFD00.l		; CF 00 FD CE
	ora ($DA.b,S),Y		; 13 DA
	ldy $00B4.w,X		; BC B4 00
	sbc $FF00F0.l,X		; FF F0 00 FF
	sbc $A414FF.l,X		; FF FF 14 A4
	adc $3404.w,X		; 7D 04 34
	eor $0D2FA0.l,X		; 5F A0 2F 0D
	bne -108.b		; D0 94
	ora ($22.b),Y		; 11 22
	cpx #$67.b		; E0 67
	and $0F13FF.l		; 2F FF 13 0F
	sty $DB.b,X		; 94 DB
	sbc ($20.b,X)		; E1 20
	inc $43D0.w,X		; FE D0 43
	ora $A0E1.w		; 0D E1 A0
	cop $45.b		; 02 45
	eor $46.b,S		; 43 46
	ror $43.b		; 66 43
	and ($43.b,S),Y		; 33 43
	sty $BB.b		; 84 BB
	sbc ($0C.b)		; F2 0C
	cpy $3FF2.w		; CC F2 3F
	wai		; CB
	cpx #$94.b		; E0 94
	ora $0EDEDC.l,X		; 1F DC DE 0E
	sbc $EFDE.w		; ED DE EF
	xba		; EB
	ldy $FF.b,X		; B4 FF
	sbc ($53.b),Y		; F1 53
	cpx #$22.b		; E0 22
	and $ED.b,S		; 23 ED
	ora ($94.b,X)		; 01 94
	ora $13F2BA.l		; 0F BA F2 13
	rol $73F6.w,X		; 3E F6 73
	sbc $22D194.l,X		; FF 94 D1 22
	jsr ($22BD.w,X)		; FC BD 22
	bpl -35.b		; 10 DD
	tsb $94.b		; 04 94
	rti		; 40

	dec $2301.w,X		; DE 01 23
	.db $42, $D1		; 42 D1
	and ($10.b)		; 32 10
	sty $DA.b		; 84 DA
	trb $0C.b		; 14 0C
	lda $FD10.w		; AD 10 FD
	wai		; CB
	sbc ($94.b)		; F2 94
	ora $00F0EE.l,X		; 1F EE F0 00
	cpx $0FDF.w		; EC DF 0F
	sbc $F0B4.w		; ED B4 F0
	brk $FF.b		; 00 FF
	sbc $FF45F0.l		; EF F0 45 FF
	ora ($A4.b)		; 12 A4
	lsr $1A.b		; 46 1A
	cmp ($00.b)		; D2 00
	sbc $12E0.w		; ED E0 12
	and $7713A0.l		; 2F A0 13 77
	adc [$64.b],Y		; 77 64
	eor $54.b,X		; 55 54
	ora $2294F0.l,X		; 1F F0 94 22
	jsr ($53E2.w,X)		; FC E2 53
	sbc $34F2.w,X		; FD F2 34
	jsr $C084.w		; 20 84 C0
	eor ($2E.b,S),Y		; 53 2E
	sbc $1E03.w		; ED 03 1E
	ldy $84F0.w,X		; BC F0 84
	inc $D0BD.w		; EE BD D0
	ora ($CC.b),Y		; 11 CC
	sbc $B4ECFE.l		; EF FE EC B4
	beq -16.b		; F0 F0
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	inc $A426.w		; EE 26 A4
	adc $2612.w		; 6D 12 26
	eor $FFA0.w,X		; 5D A0 FF
	asl $94EF.w,X		; 1E EF 94
	sbc ($65.b),Y		; F1 65
	beq 100.b		; F0 64
	ora $0D.b,S		; 03 0D
	sbc $519000.l,X		; FF 00 90 51
	inc $43F1.w		; EE F1 43
	inc $4403.w,X		; FE 03 44
	and ($94.b)		; 32 94
	cop $44.b		; 02 44
	sbc $1F220F.l,X		; FF 0F 22 1F
	cmp $0D8411.l,X		; DF 11 84 0D
	tyx		; BB
	bne  14.b		; D0 0E
	cmp $0FF0.w		; CD F0 0F
	cmp $FE0E94.l		; CF 94 0E FE
	sbc $EFEC.w		; ED EC EF
	asl $CBAB.w,X		; 1E AB CB
	ldy $E0.b,X		; B4 E0
	stz $0F.b		; 64 0F
	ora ($24.b),Y		; 11 24
	tsb $F0F0.w		; 0C F0 F0
	sty $0D.b,X		; 94 0D
	inc $61F5.w,X		; FE F5 61
	ora $41.b		; 05 41
	ora ($ED.b)		; 12 ED
	sty $FF.b,X		; 94 FF
	beq -18.b		; F0 EE
	cpx #$14.b		; E0 14
	and $32D0.w,X		; 3D D0 32
	ldy #$32.b		; A0 32
	and ($23.b,X)		; 21 23
	eor $44.b,X		; 55 44
	and ($44.b,S),Y		; 33 44
	eor $84.b,S		; 43 84
	cpy #$01.b		; C0 01
	ora $1EDECB.l		; 0F CB DE 1E
	inc $94F0.w		; EE F0 94
	ora $EDEEEE.l		; 0F EE EE ED
	cmp $EFDD.w,X		; DD DD EF
	cpx $FEB4.w		; EC B4 FE
	sbc ($74.b,X)		; E1 74
	ora $0C251F.l		; 0F 1F 25 0C
	sbc $00F0B0.l,X		; FF B0 F0 00
	brk $F0.b		; 00 F0
	jsl $344334.l		; 22 34 43 34
	sty $FF.b,X		; 94 FF
	sbc $0FEF.w		; ED EF 0F
	asl $2F14.w		; 0E 14 2F
	beq -108.b		; F0 94
	ora ($10.b,X)		; 01 10
	inc $5314.w,X		; FE 14 53
	ora $8422EF.l,X		; 1F EF 22 84
	phd		; 0B
	ldx $30E2.w,Y		; BE E2 30
	wai		; CB
	cmp $94EE0F.l,X		; DF 0F EE 94
	sbc $DEFE00.l		; EF 00 FE DE
	dec $CDFC.w,X		; DE FC CD
	inc $0FB4.w,X		; FE B4 0F
	sbc $F066E0.l		; EF E0 66 F0
	ora $B00D25.l		; 0F 25 0D B0
	and ($FF.b,X)		; 21 FF
	brk $00.b		; 00 00
	beq  18.b		; F0 12
	and $53.b,X		; 35 53
	ldy #$66.b		; A0 66
	ror $53.b		; 66 53
	bpl   0.b		; 10 00
	brk $02.b		; 00 02
	and ($84.b,X)		; 21 84
	brk $12.b		; 00 12
	sbc ($11.b),Y		; F1 11
	mvn $12,$52		; 54 52 12
	inc $E174.w		; EE 74 E1
	rol $ADDF.w		; 2E DF AD
	cop $EB.b		; 02 EB
	ldy $B0AF.w		; AC AF B0
	sbc $EEEEFF.l,X		; FF FF EE EE
	cmp $BBCC.w,X		; DD CC BB
	tyx		; BB
	ldy $0F.b,X		; B4 0F
	sbc $63F3FE.l,X		; FF FE F3 63
	sbc ($F0.b),Y		; F1 F0
	and ($A4.b,S),Y		; 33 A4
	cmp $E1DC.w,X		; DD DC E1
	cop $0F.b		; 02 0F
	sbc ($21.b)		; F2 21
	eor $94.b,S		; 43 94
	sbc $12FF.w		; ED FF 12
	tsb $01CE.w		; 0C CE 01
	ora $DF8422.l,X		; 1F 22 84 DF
	ora ($32.b),Y		; 11 32
	bpl   3.b		; 10 03
	mvn $1F,$20		; 54 20 1F
	stz $B0.b,X		; 74 B0
	ora ($FE.b)		; 12 FE
	sbc $0EBD.w,X		; FD BD 0E
	dex		; CA
	cpy $FFB0.w		; CC B0 FF
	sbc $EDEEFF.l,X		; FF FF EE ED
	jmp.w [$BBCB]		; DC CB BB
	ldy $0F.b,X		; B4 0F
	sbc $55E1FE.l,X		; FF FE E1 55
	ora ($FE.b),Y		; 11 FE
	bit $A4.b		; 24 A4
	and $C0EB.w		; 2D EB C0
	cop $2F.b		; 02 2F
	cpx #$20.b		; E0 20
	eor $94.b		; 45 94
	and $F3FD.w		; 2D FD F3
	and $11D0CC.l		; 2F CC D0 11
	ora ($84.b,S),Y		; 13 84
	sbc $44F0.w		; ED F0 44
	rti		; 40

	cmp $2F5236.l,X		; DF 36 52 2F
	stz $9F.b,X		; 74 9F
	rti		; 40

	bpl -51.b		; 10 CD
	lda $AACC0F.l,X		; BF 0F CC AA
	sty $FF.b		; 84 FF
	asl $EDFF.w		; 0E FF ED
	jmp.w [$BACA]		; DC CA BA
	tsx		; BA
	ldy $F0.b,X		; B4 F0
	sbc $26FEFF.l,X		; FF FF FE 26
	and ($0F.b),Y		; 31 0F
	sbc ($A4.b,S),Y		; F3 A4
	adc $01ACEF.l,X		; 7F EF AC 01
	jsl $1500FE.l		; 22 FE 00 15
	ldy $50.b		; A4 50
	sbc $0E21E0.l,X		; FF E0 21 0E
	inc $1100.w		; EE 00 11
	sty $5B.b		; 84 5B
	dec $6514.w		; CE 14 65
	jsr ($5413.w,X)		; FC 13 54
	and ($90.b)		; 32 90
	ror $66.b,X		; 76 66
	ror $64.b		; 66 64
	and ($10.b,X)		; 21 10
	brk $FD.b		; 00 FD
	sty $D0.b		; 84 D0
	ora $EDEDEF.l		; 0F EF ED ED
	wai		; CB
	lda $B4CB.w,Y		; B9 CB B4
	sbc $FFFE0F.l,X		; FF 0F FE FF
	and $30.b		; 25 30
	ora $5FA403.l,X		; 1F 03 A4 5F
	beq -68.b		; F0 BC
	brk $11.b		; 00 11
	asl $14E0.w,X		; 1E E0 14
	ldy $42.b		; A4 42
	sbc $0E23FF.l,X		; FF FF 23 0E
	inc $11E0.w,X		; FE E0 11
	ldy #$21.b		; A0 21
	asl $13F0.w		; 0E F0 13
	eor $23.b,S		; 43 23
	bit $56.b,X		; 34 56
	sty $DB.b		; 84 DB
	ora $DE1EF4.l		; 0F F4 1E DE
	cmp $84FD10.l,X		; DF 10 FD 84
	dec $F0F1.w		; CE F1 F0
	sbc $DCBE.w		; ED BE DC
	wai		; CB
	lda #$B4.b		; A9 B4
	sbc $EFFF0F.l,X		; FF 0F FF EF
	and $10.b,X		; 35 10
	bpl   2.b		; 10 02
	ldy $50.b		; A4 50
	beq  -6.b		; F0 FA
	cop $00.b		; 02 00
	brk $DE.b		; 00 DE
	and $94.b,S		; 23 94
	mvn $E0,$0F		; 54 0F E0
	and ($21.b)		; 32 21
	inc $02CE.w		; EE CE 02
	sty $20.b,X		; 94 20
	dec $12FF.w,X		; DE FF 12
	eor ($01.b),Y		; 51 01
	sbc ($22.b),Y		; F1 22
	sty $4F.b		; 84 4F
	cmp $11F1.w		; CD F1 11
	trb $EFCC.w		; 1C CC EF
	brk $84.b		; 00 84
	dec $F1ED.w,X		; DE ED F1
	asl $BDDD.w		; 0E DD BD
	cmp $A4CC.w		; CD CC A4
	inc $FDFE.w,X		; FE FE FD
	sbc ($63.b)		; F2 63
	sbc $942212.l,X		; FF 12 22 94
	rts		; 60

	sbc ($00.b),Y		; F1 00
	sbc ($3E.b),Y		; F1 3E
	ora $84F3EF.l		; 0F EF F3 84
	lsr $01F1.w,X		; 5E F1 01
	ora $10.b,S		; 03 10
	ora ($FE.b)		; 12 FE
	sbc ($74.b),Y		; F1 74
	and $25ED41.l		; 2F 41 ED 25
	ora $010F32.l,X		; 1F 32 0F 01
	stz $F1.b,X		; 74 F1
	and $DE2FFF.l		; 2F FF 2F DE
	ora $0CED.w		; 0D ED 0C
	sty $EE.b		; 84 EE
	inc $ECEE.w,X		; FE EE EC
	jmp.w [$CCCD]		; DC CD CC
	stp		; DB
	sty $DE.b,X		; 94 DE
	cmp $0E26.w,X		; DD 26 0E
	and $33.b,S		; 23 33
	eor $11.b,S		; 43 11
	sty $45.b		; 84 45
	and ($41.b)		; 32 41
	cmp $3EF120.l,X		; DF 20 F1 3E
	bne 116.b		; D0 74
	jsl $11FDF0.l		; 22 F0 FD 11
	ora ($05.b),Y		; 11 05
	ora $7413.w,X		; 1D 13 74
	and ($53.b),Y		; 31 53
	inc $FF11.w,X		; FE 11 FF
	sbc $74F0D0.l,X		; FF D0 F0 74
	sbc $DEEE0E.l		; EF 0E EE DE
	sbc $DBDDDE.l		; EF DE DD DB
	sty $EE.b		; 84 EE
	sbc $DCDD.w		; ED DD DC
	jmp.w [$CBCD]		; DC CD CB
	cmp ($84.b)		; D2 84
	jsl $674532.l		; 22 32 45 67
	adc $22.b,X		; 75 22
	mvn $74,$21		; 54 21 74
	bpl -65.b		; 10 BF
	asl $FEEE.w		; 0E EE FE
	sbc ($31.b)		; F2 31
	sbc ($74.b),Y		; F1 74
	and $013F15.l,X		; 3F 15 3F 01
	sbc ($33.b),Y		; F1 33
	ora $64F1.w,X		; 1D F1 64
	rol $A912.w		; 2E 12 A9
	bne -48.b		; D0 D0
	tsb $F00C.w		; 0C 0C F0
	stz $0F.b,X		; 74 0F
	inc $EDCF.w		; EE CF ED
	stp		; DB
	tyx		; BB
	wai		; CB
	dex		; CA
	sty $EE.b		; 84 EE
	cmp $CDDE.w,X		; DD DE CD
	lda $E053.w,X		; BD 53 E0
	and $84.b,X		; 35 84
	and $53.b		; 25 53
	and $54.b		; 25 54
	bit $20.b,X		; 34 20
	ora ($10.b,X)		; 01 10
	ldy #$44.b		; A0 44
	eor $33.b,S		; 43 33
	and ($33.b,S),Y		; 33 33
	and ($33.b)		; 32 33
	and ($54.b)		; 32 54
	mvn $44,$E4		; 54 E4 44
	jmp.w [$3BC3]		; DC C3 3B
	pld		; 2B
	tsx		; BA
	stz $0D.b		; 64 0D
	ora $CFCC.w		; 0D CC CF
	bit $CBFF.w,X		; 3C FF CB
	sbc $DCD074.l,X		; FF 74 D0 DC
	cmp $DCEB.w,X		; DD EB DC
	phx		; DA
	cpy $84CD.w		; CC CD 84
	inc $EEDE.w		; EE DE EE
	beq  -2.b		; F0 FE
	ora ($21.b)		; 12 21
	bit $84.b,X		; 34 84
	ora ($44.b)		; 12 44
	jsl $312242.l		; 22 42 22 31
	ora ($20.b),Y		; 11 20
	ldy #$44.b		; A0 44
	mvp $44,$44		; 44 44 44
	mvp $33,$44		; 44 44 33
	and ($90.b,S),Y		; 33 90
	ror $54.b		; 66 54
	eor $32.b,S		; 43 32
	jsl $FF0010.l		; 22 10 00 FF
	stz $BB.b		; 64 BB
	lda $EFFEFA.l,X		; BF FA FE EF
	lda $74EEEA.l		; AF EA EE 74
	sbc $EBDF.w,X		; FD DF EB
	inc $DEDE.w,X		; FE DE DE
	inc $740F.w		; EE 0F 74
	cpy #$FE.b		; C0 FE
	sbc $F130E0.l		; EF E0 30 F1
	trb $34.b		; 14 34
	stz $32.b,X		; 74 32
	and $24.b		; 25 24
	eor ($33.b),Y		; 51 33
	eor $41.b,S		; 43 41
	rti		; 40

	bcc 119.b		; 90 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$76.b],Y		; 77 76
	adc $64.b		; 65 64
	inc $EDFE.w,X		; FE FE ED
	lda $9C1C.w		; AD 1C 9C
	wai		; CB
	jsr ($EC64.w,X)		; FC 64 EC
	plb		; AB
	nop		; EA
	inc $EEEE.w		; EE EE EE
	inc $64DE.w		; EE DE 64
	nop		; EA
	inc $E9DE.w		; EE DE E9
	sbc $1EED.w		; ED ED 1E
	sbc $2164.w		; ED 64 21
	ldx $EE1E.w,Y		; BE 1E EE
	inc $2EE2.w,X		; FE E2 2E
	and $241174.l,X		; 3F 74 11 24
	ora ($23.b)		; 12 23
	mvp $31,$33		; 44 33 31
	eor $64.b,S		; 43 64
	adc ($33.b,S),Y		; 73 33
	eor [$34.b]		; 47 34
	bmi   3.b		; 30 03
	sbc ($FF.b,S),Y		; F3 FF
	stz $EF.b		; 64 EF
	inc $9DD2.w		; EE D2 9D
	jmp.w [$FC0D]		; DC 0D FC
	cpy $FB64.w		; CC 64 FB
	xce		; FB
	plx		; FA
	plx		; FA
	sbc $EEAEEE.l		; EF EE AE EE
	mvn $CD,$3C		; 54 3C CD
	cpy $C4CD.w		; CC CD C4
	cmp $5DDC.w		; CD DC 5D
	mvn $5D,$DD		; 54 DD 5D
	sbc $EE.b		; E5 EE
	adc $FF6FEF.l		; 6F EF 6F FF
	stz $34.b		; 64 34
	brk $04.b		; 00 04
	rti		; 40

	trb $14.b		; 14 14
	ora ($15.b),Y		; 11 15
	stz $15.b		; 64 15
	ora ($15.b)		; 12 15
	and ($22.b,X)		; 21 22
	ora ($21.b)		; 12 21
	jsl $B3B354.l		; 22 54 B3 B3
	pld		; 2B
	rol A		; 2A
	and #$11.b		; 29 11
	inc A		; 1A
	bcc 100.b		; 90 64
	tsb $FC0C.w		; 0C 0C FC
	beq -65.b		; F0 BF
	sbc $54EFCF.l,X		; FF CF EF 54
	inc $EDDE.w		; EE DE ED
	sbc $5EEE.w		; ED EE 5E
	inc $54EE.w		; EE EE 54
	inc $FE.b		; E6 FE
	inc $EFFF.w,X		; FE FF EF
	sbc $54FEEF.l		; EF EF FE 54
	inc $FF.b,X		; F6 FF
	adc $00070F.l,X		; 7F 0F 07 00
	brk $71.b		; 00 71
	stz $00.b		; 64 00
	eor ($01.b,X)		; 41 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	tsb $64.b		; 04 64
	ora ($0D.b),Y		; 11 0D
	bpl  20.b		; 10 14
	ora $0101.w,X		; 1D 01 01
	ora ($61.b,X)		; 01 61
	mvp $00,$44		; 44 44 00
	brk $CC.b		; 00 CC
	cpy $9C99.w		; CC 99 9C
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	bcs   0.b		; B0 00
	brk $FF.b		; 00 FF
	sbc $FF0004.l,X		; FF 04 00 FF
	sbc $006701.l,X		; FF 01 67 00
	cmp #$00.b		; C9 00
	cmp #$00.b		; C9 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsx		; BA
	jsr ($0031.w,X)		; FC 31 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	ora ($8A.b,X)		; 01 8A
	xba		; EB
	cmp ($FF.b,X)		; C1 FF
	brk $0F.b		; 00 0F
	beq   0.b		; F0 00
	beq 106.b		; F0 6A
	ora ($00.b)		; 12 00
	ora ($22.b),Y		; 11 22
	jsl $433422.l		; 22 22 34 43
	ply		; 7A
	jsl $233322.l		; 22 22 33 23
	and ($34.b,S),Y		; 33 34
	and ($44.b,S),Y		; 33 44
.ACCU 16
.INDEX 16
	rep #$3E		; C2 3E
	cmp $DDDD.w,X		; DD DD DD
	cmp $DDDD.w,X		; DD DD DD
	cmp $418A.w,X		; DD 8A 41
	xba		; EB
	ora $0F00FF.l		; 0F FF 00 0F
	brk $0F.b		; 00 0F
	ror A		; 6A
	ora ($20.b),Y		; 11 20
	ora ($12.b),Y		; 11 12
	jsl $443323.l		; 22 23 33 44
	ply		; 7A
	jsl $332322.l		; 22 22 23 33
	and ($33.b,S),Y		; 33 33
	bit $44.b,X		; 34 44
.ACCU 16
.INDEX 16
	rep #$3E		; C2 3E
	cmp $DDDD.w,X		; DD DD DD
	cmp $DDDD.w,X		; DD DD DD
	cmp $418B.w,X		; DD 8B 41
	xba		; EB
	ora $0F00FF.l		; 0F FF 00 0F
	brk $0F.b		; 00 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
.ENDS
