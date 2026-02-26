.BANK 23 SLOT 0
.ORG $0000

.SECTION "Bank23" FORCE

	asl $3880.w		; 0E 80 38
	brk $C7.b		; 00 C7
	and ($E3.b),Y		; 31 E3
	brk $C7.b		; 00 C7
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $00.b		; 04 00
	brk $D7.b		; 00 D7
	sbc $02FFE3.l,X		; FF E3 FF 02
	tsb $00.b		; 04 00
	brk $E7.b		; 00 E7
	sbc $04FFE3.l,X		; FF E3 FF 04
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $06FFE3.l,X		; FF E3 FF 06
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E3.b		; 00 E3
	sbc $000408.l,X		; FF 08 04 00
	brk $17.b		; 00 17
	brk $E3.b		; 00 E3
	sbc $00040A.l,X		; FF 0A 04 00
	brk $27.b		; 00 27
	brk $E3.b		; 00 E3
	sbc $00040C.l,X		; FF 0C 04 00
	brk $C7.b		; 00 C7
	sbc $0EFFF3.l,X		; FF F3 FF 0E
	tsb $00.b		; 04 00
	brk $D7.b		; 00 D7
	sbc $20FFF3.l,X		; FF F3 FF 20
	tsb $00.b		; 04 00
	brk $E7.b		; 00 E7
	sbc $22FFF3.l,X		; FF F3 FF 22
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $24FFF3.l,X		; FF F3 FF 24
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F3.b		; 00 F3
	sbc $000426.l,X		; FF 26 04 00
	brk $17.b		; 00 17
	brk $F3.b		; 00 F3
	sbc $000428.l,X		; FF 28 04 00
	brk $27.b		; 00 27
	brk $F3.b		; 00 F3
	sbc $00042A.l,X		; FF 2A 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $3E00.w,X		; 1E 00 3E
	brk $3E.b		; 00 3E
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	and $003E00.l,X		; 3F 00 3E 00
	ror $7E00.w,X		; 7E 00 7E
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $7C.b,S		; 03 7C
	adc $FF3F00.l,X		; 7F 00 3F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	adc $0000FF.l,X		; 7F FF 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $1C.b		; 00 1C
	asl $7E60.w,X		; 1E 60 7E
	bra  -2.b		; 80 FE
	brk $FE.b		; 00 FE
	ror $FFFE.w,X		; 7E FE FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	asl $7E01.w,X		; 1E 01 7E
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc $181F00.l,X		; FF 00 1F 18
	ora $87048F.l		; 0F 8F 04 87
	brk $C7.b		; 00 C7
	ora $C7.b		; 05 C7
	ora [$C7.b]		; 07 C7
	ora $C3.b,S		; 03 C3
	brk $C1.b		; 00 C1
	sbc $07F008.l		; EF 08 F0 07
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora $F8.b,S		; 03 F8
	ora $FA.b,S		; 03 FA
	ora $FD.b,S		; 03 FD
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $3BFC05.l,X		; FF 05 FC 3B
	sed		; F8
	cmp $011FC0.l		; CF C0 1F 01
	adc $0FFF07.l,X		; 7F 07 FF 0F
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF.b,S		; 03 FF
	ora [$FE.b]		; 07 FE
	and $F0FEFC.l,X		; 3F FC FE F0
	sed		; F8
	cpx #$F0.b		; E0 F0
	brk $E0.b		; 00 E0
	bpl -80.b		; 10 B0
	dey		; 88
	sbc [$0F.b],Y		; F7 0F
	sbc $FFEE3F.l		; EF 3F EE FF
	jmp.w [$D0FE]		; DC FE D0
	jsr ($F0C0.w,X)		; FC C0 F0
	sbc $E07F00.l,X		; FF 00 7F E0
	sed		; F8
	bra -48.b		; 80 D0
	brk $11.b		; 00 11
	brk $23.b		; 00 23
	ora ($2F.b,X)		; 01 2F
	ora $3F.b,S		; 03 3F
	ora $FF0000.l		; 0F 00 00 FF
	sbc $48FF80.l,X		; FF 80 FF 48
	iny		; C8
	jmp ($BCFC.w,X)		; 7C FC BC
	jmp ($3878.w,X)		; 7C 78 38
	bit $FF1C.w		; 2C 1C FF
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $88.b		; 00 88
	brk $9C.b		; 00 9C
	brk $CC.b		; 00 CC
	bra -64.b		; 80 C0
	cpy #$F0.b		; C0 F0
	cpx #$00.b		; E0 00
	brk $F0.b		; 00 F0
	beq  14.b		; F0 0E
	inc $0F01.w,X		; FE 01 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	asl $0100.w		; 0E 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	cpx #$18.b		; E0 18
	sei		; 78
	asl $1E.b		; 06 1E
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	brk $18.b		; 00 18
	brk $07.b		; 00 07
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
	brk $E0.b		; 00 E0
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $007C00.l,X		; 7F 00 7C 00
	brk $00.b		; 00 00
	sbc $FF18FF.l,X		; FF FF 18 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7C.b		; 00 7C
	ora $00.b,S		; 03 00
	ora $007F00.l,X		; 1F 00 7F 00
	bra   0.b		; 80 00
	sbc $05F00A.l,X		; FF 0A F0 05
	beq   1.b		; F0 01
	beq   0.b		; F0 00
	trb $0F00.w		; 1C 00 0F
	adc $7F8080.l,X		; 7F 80 80 7F
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $0FF10F.l,X		; FF 0F F1 0F
	trb $0FE3.w		; 1C E3 0F
	beq 127.b		; F0 7F
	adc $84EAD5.l,X		; 7F D5 EA 84
	stp		; DB
	cmp $81CE80.l		; CF 80 CE 81
	sta $DA.b		; 85 DA
	rol A		; 2A
	eor $00.b,X		; 55 00
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	and $FF41FF.l,X		; 3F FF 41 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $FE00FF.l,X		; 7F FF 00 FE
	sbc $A3AB54.l,X		; FF 54 AB A3
	cli		; 58
	mvn $AA,$A8		; 54 A8 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	sbc $1515EA.l,X		; FF EA 15 15
	rol A		; 2A
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $01.b,X		; 55 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	sbc $4355AA.l,X		; FF AA 55 43
	tsx		; BA
	cpx $15.b		; E4 15
	sbc $14.b		; E5 14
	cpy #$3B.b		; C0 3B
	mvn $FF,$AA		; 54 AA FF
	brk $FF.b		; 00 FF
	inc $FFFF.w,X		; FE FF FF
	sbc $01FB81.l,X		; FF 81 FB 01
	xce		; FB
	ora ($FF.b,X)		; 01 FF
	sta ($FF.b,X)		; 81 FF
	inc $C000.w,X		; FE 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	asl $00.b		; 06 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $38.b,S		; 03 38
	inc $7F44.w,X		; FE 44 7F
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $79.b		; 00 79
	brk $FC.b		; 00 FC
	jmp $074B.w		; 4C 4B 07
	brk $82.b		; 00 82
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $83.b		; 00 83
	jmp ($FE79.w,X)		; 7C 79 FE
	jsr ($B7FF.w,X)		; FC FF B7
	sbc $3F0CF7.l,X		; FF F7 0C 3F
	cmp ($1E.b,S),Y		; D3 1E
	ora $010300.l,X		; 1F 00 03 01
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	ora $00.b,S		; 03 00
	bra  -5.b		; 80 FB
	sbc ($10.b,S),Y		; F3 10
	bpl -32.b		; 10 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $0EFEFE.l,X		; 7F FE FE 0E
	sbc $00.b,X		; F5 00
	sbc ($FE.b),Y		; F1 FE
	asl $C0.b		; 06 C0
	rts		; 60

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	sbc $000180.l,X		; FF 80 01 00
	tsb $04.b		; 04 04
	inc $F900.w,X		; FE 00 F9
	brk $9F.b		; 00 9F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($00F9.w,X)		; FC F9 00
	sbc $F20DFC.l,X		; FF FC 0D F2
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F9FF01.l,X		; FF 01 FF F9
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sei		; 78
	sed		; F8
	lda $FF00FF.l,X		; BF FF 00 FF
	php		; 08
	tsb $08.b		; 04 08
	tsb $08.b		; 04 08
	tsb $08.b		; 04 08
	tsb $E0.b		; 04 E0
	bra -128.b		; 80 80
	brk $40.b		; 00 40
	brk $38.b		; 00 38
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	xce		; FB
	ora $40C080.l,X		; 1F 80 C0 40
	eor [$40.b]		; 47 40
	eor $001C03.l		; 4F 03 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	and $C0BFC0.l,X		; 3F C0 BF C0
	lda $0FFFC7.l,X		; BF C7 FF 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	tsb $018C.w		; 0C 8C 01
	sbc $00.b,S		; E3 00
	adc ($00.b),Y		; 71 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	tsb $C1FD.w		; 0C FD C1
	inc $00E0.w,X		; FE E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
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
	bpl   0.b		; 10 00
	asl $0700.w		; 0E 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  31.b		; 10 1F
	asl $070F.w		; 0E 0F 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0700.w,X		; FE 00 07
	brk $F8.b		; 00 F8
	cpy #$3F.b		; C0 3F
	rti		; 40

	ora $001FE0.l,X		; 1F E0 1F 00
	ora $FFFC00.l,X		; 1F 00 FC FF
	brk $07.b		; 00 07
	sed		; F8
	sed		; F8
	ora [$FF.b]		; 07 FF
	cpy #$FF.b		; C0 FF
	cpx #$FF.b		; E0 FF
	cpx #$1F.b		; E0 1F
	cpx #$FC.b		; E0 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FF00FF.l,X		; 1F FF 00 FF
	asl $00.b		; 06 00
	sbc $FF06FF.l,X		; FF FF 06 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	cpy #$3F.b		; C0 3F
	and $00C000.l,X		; 3F 00 C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0A.b		; 00 0A
	tsb $01.b		; 04 01
	tsb $FCF0.w		; 0C F0 FC
	asl $1B.b		; 06 1B
	ora $1B.b,S		; 03 1B
	cop $18.b		; 02 18
	ora ($19.b,X)		; 01 19
	brk $18.b		; 00 18
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFD0F.l,X		; FF 0F FD 0F
	jsr ($FF0F.w,X)		; FC 0F FF
	ora $FF1FFE.l		; 0F FE 1F FF
	ora $AA05F6.l,X		; 1F F6 05 AA
	and ($1D.b,X)		; 21 1D
	brk $4C.b		; 00 4C
	bvs -84.b		; 70 AC
	bmi -36.b		; 30 DC
	bvc 109.b		; 50 6D
	adc ($25.b,X)		; 61 25
	cli		; 58
	xce		; FB
	sbc $FFFFDF.l,X		; FF DF FF FF
	sbc $DFFFBF.l,X		; FF BF FF DF
	sbc $9EFFAF.l,X		; FF AF FF 9E
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	rti		; 40

	and $4E007F.l,X		; 3F 7F 00 4E
	tsb $4B.b		; 04 4B
	cop $4B.b		; 02 4B
	cop $4E.b		; 02 4E
	brk $7F.b		; 00 7F
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807C80.l,X		; 7F 80 7C 80
	adc $7F80.w,Y		; 79 80 7F
	bra   0.b		; 80 00
	jsr $2000.w		; 20 00 20
	cmp $1000FF.l,X		; DF FF 00 10
	brk $90.b		; 00 90
	bra -112.b		; 80 90
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	php		; 08
	tsb $08.b		; 04 08
	ora $FA.b		; 05 FA
	sbc $080508.l,X		; FF 08 05 08
	tsb $18.b		; 04 18
	tsb $10.b		; 04 10
	tsb $F800.w		; 0C 00 F8
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $38.b		; 00 38
	ora $58B1.w		; 0D B1 58
	cpx $EC0C.w		; EC 0C EC
	ora $076C.w		; 0D 6C 07
	jmp ($6A0A.w)		; 6C 0A 6A
	php		; 08
	pla		; 68
	sbc $9FFE1F.l,X		; FF 1F FE 9F
	sbc [$BF.b],Y		; F7 BF
	sbc ($BF.b,S),Y		; F3 BF
	sbc ($3F.b,S),Y		; F3 3F
	xce		; FB
	and $F73FF5.l,X		; 3F F5 3F F7
	and $403080.l,X		; 3F 80 30 40
	tya		; 98
	jsr $A0D8.w		; 20 D8 A0
	stz $98A0.w		; 9C A0 98
	cpx #$1C.b		; E0 1C
	ldy #$5C.b		; A0 5C
	rti		; 40

	stz $E0FF.w		; 9C FF E0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	adc $FF78F8.l,X		; 7F F8 78 FF
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $C040F8.l,X		; FF F8 40 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $C0.b		; 00 C0
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FFFFFF.l		; 0F FF FF FF
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	beq -128.b		; F0 80
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cpx $3E3D.w		; EC 3D 3E
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00.b,S		; C3 00
	bit $07C0.w,X		; 3C C0 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora $E2FE03.l,X		; 1F 03 FE E2
	jsr ($FF00.w,X)		; FC 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1D1F.w,X		; FD 1F 1D
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $1F7F7F.l,X		; FF 7F 7F 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $53.b		; 00 53
	txs		; 9A
	sbc ($61.b)		; F2 61
	inc $85.b,X		; F6 85
	clc		; 18
	stx $00.b,Y		; 96 00
	inc $F800.w,X		; FE 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $9FFF.w		; ED FF 9F
	sbc $EEFF7B.l,X		; FF 7B FF EE
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $C03F80.l,X		; 7F 80 3F C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl 102.b		; 10 66
	ora $0272.w		; 0D 72 02
	plx		; FA
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $7F3F.w,X		; FD 3F 7F
	adc $003F3F.l,X		; 7F 3F 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	bit $5C60.w,X		; 3C 60 5C
	cpy #$BF.b		; C0 BF
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $F8BFF8.l,X		; DF F8 BF F8
	adc $E0E0F8.l,X		; 7F F8 E0 E0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($80.b,S),Y		; 13 80
	jmp $BE00.w		; 4C 00 BE
	and $00DD.w,Y		; 39 DD 00
	rol A		; 2A
	brk $EB.b		; 00 EB
	sbc $000400.l,X		; FF 00 04 00
	brk $2A.b		; 00 2A
	brk $FB.b		; 00 FB
	sbc $000402.l,X		; FF 02 04 00
	brk $1A.b		; 00 1A
	brk $E6.b		; 00 E6
	sbc $000404.l,X		; FF 04 04 00
	brk $1A.b		; 00 1A
	brk $F6.b		; 00 F6
	sbc $000406.l,X		; FF 06 04 00
	brk $0A.b		; 00 0A
	brk $DF.b		; 00 DF
	sbc $000408.l,X		; FF 08 04 00
	brk $0A.b		; 00 0A
	brk $EF.b		; 00 EF
	sbc $00040A.l,X		; FF 0A 04 00
	brk $FA.b		; 00 FA
	sbc $0CFFDE.l,X		; FF DE FF 0C
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0EFFEE.l,X		; FF EE FF 0E
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $20FFFE.l,X		; FF FE FF 20
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $22FFDE.l,X		; FF DE FF 22
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $24FFEE.l,X		; FF EE FF 24
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $26FFFE.l,X		; FF FE FF 26
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $28FFDD.l,X		; FF DD FF 28
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $2AFFED.l,X		; FF ED FF 2A
	tsb $00.b		; 04 00
	brk $CA.b		; 00 CA
	sbc $2CFFDD.l,X		; FF DD FF 2C
	tsb $00.b		; 04 00
	brk $CA.b		; 00 CA
	sbc $2EFFED.l,X		; FF ED FF 2E
	tsb $00.b		; 04 00
	brk $CA.b		; 00 CA
	sbc $40FFFD.l,X		; FF FD FF 40
	tsb $00.b		; 04 00
	brk $BA.b		; 00 BA
	sbc $42FFDD.l,X		; FF DD FF 42
	tsb $00.b		; 04 00
	brk $BA.b		; 00 BA
	sbc $44FFED.l,X		; FF ED FF 44
	tsb $00.b		; 04 00
	brk $60.b		; 00 60
	cpx #$02.b		; E0 02
	asl $00.b		; 06 00
	adc ($00.b),Y		; 71 00
	jsr ($0E80.w,X)		; FC 80 0E
	sei		; 78
	ora [$94.b]		; 07 94
	ora $28.b,S		; 03 28
	lda $00.b,S		; A3 00
	brk $FA.b		; 00 FA
	cop $FE.b		; 02 FE
	brk $FF.b		; 00 FF
	sei		; 78
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FFDFFE.l,X		; FF FE DF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr $10E0.w		; 20 E0 10
	bmi   8.b		; 30 08
	clc		; 18
	tsb $0C.b		; 04 0C
	cop $84.b		; 02 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $D020.w		; 20 20 D0
	bpl -24.b		; 10 E8
	php		; 08
	pea $F804.w		; F4 04 F8
	brk $BC.b		; 00 BC
	phd		; 0B
	tya		; 98
	sta [$E0.b],Y		; 97 E0
	ror $FC00.w		; 6E 00 FC
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	adc $FE9EFF.l		; 6F FF 9E FE
	jsr ($F0FC.w,X)		; FC FC F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00F000.l		; CF 00 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra -16.b		; 80 F0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	jmp ($FFDF.w,X)		; 7C DF FF
	bra 127.b		; 80 7F
	sty $02.b		; 84 02
	sty $02.b		; 84 02
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	beq   0.b		; F0 00
	cpy #$80.b		; C0 80
	jsr $9C00.w		; 20 00 9C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $C73E.w,X		; FE 3E C7
	jsr $1838.w		; 20 38 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	cmp [$38.b]		; C7 38
	sbc [$38.b]		; E7 38
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $18.b,S		; 03 18
	ora ($1A.b,X)		; 01 1A
	cop $1A.b		; 02 1A
	ora $1B.b,S		; 03 1B
	ora ($1C.b,X)		; 01 1C
	ora $1D.b,S		; 03 1D
	brk $1E.b		; 00 1E
	brk $FF.b		; 00 FF
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FC0F.w,X		; FD 0F FC
	ora $FE0FFF.l		; 0F FF 0F FE
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $18E0E0.l,X		; 1F E0 E0 18
	sed		; F8
	inc $FE.b		; E6 FE
	ora #$0F.b		; 09 0F
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sed		; F8
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	cpx #$98.b		; E0 98
	sed		; F8
	rol $3E.b		; 26 3E
	php		; 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	sec		; 38
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -65.b		; 80 BF
	sbc $004000.l,X		; FF 00 40 00
	rti		; 40

	brk $A0.b		; 00 A0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $80.b		; 00 80
	sta $7FBC4F.l		; 8F 4F BC 7F
	adc $76FF.w,X		; 7D FF 76
	inc $F7EB.w,X		; FE EB F7
	cmp $E3.b		; C5 E3
	sta ($C0.b,X)		; 81 C0
	sbc $00F000.l,X		; FF 00 F0 00
	cmp $00.b,S		; C3 00
	sta $00.b,S		; 83 00
	dey		; 88
	brk $1C.b		; 00 1C
	php		; 08
	rol $7F1C.w,X		; 3E 1C 7F
	and $FF0000.l,X		; 3F 00 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $F00000.l,X		; FF 00 00 F0
	beq -16.b		; F0 F0
	beq  96.b		; F0 60
	cpx #$FC.b		; E0 FC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	inx		; E8
	cpy #$A4.b		; C0 A4
	rts		; 60

	mvn $38,$A0		; 54 A0 38
	cpy #$1A.b		; C0 1A
	sbc ($0B.b),Y		; F1 0B
	beq  10.b		; F0 0A
	rts		; 60

	asl A		; 0A
	sbc $F867F0.l		; EF F0 67 F8
	lda [$F8.b],Y		; B7 F8
	stp		; DB
	jsr ($FCFB.w,X)		; FC FB FC
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	xce		; FB
	jsr ($0E04.w,X)		; FC 04 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3800FF.l,X		; FF FF 00 38
	bmi  14.b		; 30 0E
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $14.b		; 00 14
	ora #$94.b		; 09 94
	sta ($A4.b),Y		; 91 A4
	sta ($54.b,X)		; 81 54
	and ($EC.b,X)		; 21 EC
	sta ($44.b,X)		; 81 44
	eor #$16.b		; 49 16
	ora ($44.b,S),Y		; 13 44
	sta [$FF.b]		; 87 FF
	sbc $7FFF6F.l,X		; FF 6F FF 7F
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $EDFFBF.l,X		; FF BF FF ED
	sbc $00FFFB.l,X		; FF FB FF 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$FE.b		; C0 FE
	brk $FE.b		; 00 FE
	bra -128.b		; 80 80
	inc $80FF.w,X		; FE FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
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
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	sbc $04FF.w,X		; FD FF 04
	cop $04.b		; 02 04
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $18.b		; 00 18
	ora $0F08.w,Y		; 19 08 0F
	ora ($06.b,X)		; 01 06
	cop $04.b		; 02 04
	ora $64.b,S		; 03 64
	sta $F1.b,X		; 95 F1
	ora $7B.b,S		; 03 7B
	cop $1A.b		; 02 1A
	sbc [$38.b]		; E7 38
	sbc [$39.b],Y		; F7 39
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $6FF667.l,X		; FF 67 F6 6F
	jsr ($FD6F.w,X)		; FC 6F FD
	ora $000000.l		; 0F 00 00 00
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
	ora $000F00.l,X		; 1F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $000F0F.l,X		; 1F 0F 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FE00FF.l,X		; FF FF 00 FE
	inc $C93E.w,X		; FE 3E C9
	brk $E1.b		; 00 E1
	jsr ($800E.w,X)		; FC 0E 80
	bra   0.b		; 80 00
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	sbc $080001.l,X		; FF 01 00 08
	php		; 08
	inc $F100.w,X		; FE 00 F1
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $00F8.w,X		; FE F8 00
	sbc $FF00.w,X		; FD 00 FF
	inc $F40F.w,X		; FE 0F F4
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $F8FF01.l,X		; FF 01 FF F8
	sbc $0001FD.l,X		; FF FD 01 00
	ora $04.b		; 05 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $200000.l,X		; FF 00 00 20
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $80.b		; 00 80
	cpy #$E0.b		; C0 E0
	ora $FEE1FF.l,X		; 1F FF E1 FE
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	sbc $0F3F7F.l,X		; FF 7F 3F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $E0DFE0.l,X		; 1F E0 DF E0
	bcs 112.b		; B0 70
	cli		; 58
	and $EFF0F3.l,X		; 3F F3 F0 EF
	eor $00FFF8.l,X		; 5F F8 FF 00
	ora $060906.l,X		; 1F 06 09 06
	ora #$C0.b		; 09 C0
	bra -25.b		; 80 E7
	cpy #$0F.b		; C0 0F
	ora $40.b,S		; 03 40
	rti		; 40

	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0A6000.l,X		; FF 00 60 0A
	bvs  26.b		; 70 1A
	bvs  26.b		; 70 1A
	beq -118.b		; F0 8A
	bne  11.b		; D0 0B
	bcs  42.b		; B0 2A
	brk $52.b		; 00 52
	cpy #$B2.b		; C0 B2
	xce		; FB
	jsr ($FCEB.w,X)		; FC EB FC
	xba		; EB
	jsr ($FC7B.w,X)		; FC 7B FC
	xce		; FB
	jsr ($FCDB.w,X)		; FC DB FC
	lda ($FC.b,S),Y		; B3 FC
	adc ($FC.b,S),Y		; 73 FC
	cop $01.b		; 02 01
	tas		; 1B
	ora $003818.l,X		; 1F 18 38 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $C7.b		; 00 C7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc ($00.b,X)		; 61 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	inc $E0E0.w,X		; FE E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FC04FF.l,X		; FF FF 04 FC
	sed		; F8
	sed		; F8
	sbc ($E0.b,X)		; E1 E0
	cmp $00FFC0.l		; CF C0 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	sta $787FFF.l,X		; 9F FF 7F 78
	inc $F301.w,X		; FE 01 F3
	beq -49.b		; F0 CF
	cpy #$1F.b		; C0 1F
	ora ($3F.b,X)		; 01 3F
	ora [$FE.b]		; 07 FE
	ora $FD1FFE.l		; 0F FE 1F FD
	sbc $0F00FF.l,X		; FF FF 00 0F
	inc $F83F.w,X		; FE 3F F8
	inc $F8F0.w,X		; FE F0 F8
	cpx #$F1.b		; E0 F1
	bra -31.b		; 80 E1
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	sbc $000300.l,X		; FF 00 03 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($40.b,X)		; 01 40
	and $0F7185.l,X		; 3F 85 71 0F
	cpx $E203.w		; EC 03 E2
	asl $C6.b,X		; 16 C6
	and $BCCC.w,X		; 3D CC BC
	adc $FFBB7A.l,X		; 7F 7A BB FF
	ora $F33FFE.l,X		; 1F FE 3F F3
	adc $F9FFDD.l,X		; 7F DD FF F9
	sbc $83FFB3.l,X		; FF B3 FF 83
	sbc $00FF45.l,X		; FF 45 FF 00
	and $000F00.l,X		; 3F 00 0F 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $070F0F.l,X		; 3F 0F 0F 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $010000.l,X		; FF 00 00 01
	ora ($07.b,X)		; 01 07
	ora [$18.b]		; 07 18
	ora $00FFFF.l,X		; 1F FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $050000.l,X		; FF 00 00 05
	sty $03.b		; 84 03
	cmp $01.b,S		; C3 01
	eor $03.b,S		; 43 03
	eor $00.b,S		; 43 00
	adc ($01.b,X)		; 61 01
	adc ($01.b,X)		; 61 01
	adc ($F0.b,X)		; 61 F0
	brk $F9.b		; 00 F9
	brk $FE.b		; 00 FE
	ora $FC.b,S		; 03 FC
	ora ($FD.b,X)		; 01 FD
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $E6.b		; 00 E6
	asl $41.b,X		; 16 41
	clv		; B8
	mvn $00,$AB		; 54 AB 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00F9.l,X		; FF F9 00 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	asl $00.b		; 06 00
	sbc $0006FF.l,X		; FF FF 06 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	beq  15.b		; F0 0F
	ora $FFF000.l		; 0F 00 F0 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$55.b]		; 07 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFEF00.l,X		; FF 00 EF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	bpl  85.b		; 10 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $000100.l,X		; FF 00 01 00
	inc $1F00.w,X		; FE 00 1F
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $E01F00.l,X		; FF 00 1F E0
	cpx #$1F.b		; E0 1F
	sbc $000000.l,X		; FF 00 00 00
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
	and $370F41.l,X		; 3F 41 0F 37
	ora #$0E.b		; 09 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $C000.w,X		; 9E 00 C0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sbc $F8FFFF.l,X		; FF FF FF F8
	ora $000303.l		; 0F 03 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $1F.b		; 00 1F
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$FF.b]		; 07 FF
	ora $040300.l		; 0F 00 03 04
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$40.b]		; 07 40
	lda $00FFF8.l,X		; BF F8 FF 00
	adc $FF01FF.l,X		; 7F FF 01 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $07.b,S		; 03 07
	ora $FF.b,S		; 03 FF
	ora [$7F.b]		; 07 7F
	adc $2C4139.l,X		; 7F 39 41 2C
	eor $3F4A.w		; 4D 4A 3F
	bpl 126.b		; 10 7E
	and $B9.b		; 25 B9
	adc $C82FAE.l,X		; 7F AE 2F C8
	trb $FEE0.w		; 1C E0 FE
	sbc $C0FFF2.l,X		; FF F2 FF C0
	sbc $D6FF87.l,X		; FF 87 FF D6
	sbc $F7FFD1.l,X		; FF D1 FF F7
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $FF.b		; 00 FF
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $FF.b		; 00 FF
	sbc $54FF00.l,X		; FF 00 FF 54
	plb		; AB
	eor ($B8.b,X)		; 41 B8
	inc $16.b		; E6 16
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $0000.w,Y		; F9 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $70.b		; 00 70
	bra -16.b		; 80 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF06.l,X		; FF 06 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $F807E0.l,X		; 1F E0 07 F8
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	tsb $1FFB.w		; 0C FB 1F
	ora $FF0101.l,X		; 1F 01 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $1F.b		; 00 1F
	cpx #$01.b		; E0 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $54FF03.l,X		; FF 03 FF 54
	plb		; AB
	lda $A05040.l		; AF 40 50 A0
	tax		; AA
	eor $00.b,X		; 55 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	tax		; AA
	eor $55.b,X		; 55 55
	rol A		; 2A
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $05FFFF.l,X		; FF FF FF 05
	bne  60.b		; D0 3C
	rep #$07		; C2 07
	cpy #$00.b		; C0 00
	sei		; 78
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $1F.b		; 00 1F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cmp [$3F.b]		; C7 3F
	sei		; 78
	sta [$3F.b]		; 87 3F
	cpy #$00.b		; C0 00
	sbc $1F3F38.l,X		; FF 38 3F 1F
	ora $803F80.l,X		; 1F 80 3F 80
	eor $001FC0.l,X		; 5F C0 1F 00
	and $00FC00.l,X		; 3F 00 FC 00
	brk $00.b		; 00 00
	ora $FFFE00.l,X		; 1F 00 FE FF
	cpy #$FF.b		; C0 FF
	cpx #$DF.b		; E0 DF
	cpx #$3F.b		; E0 3F
	cpy #$FC.b		; C0 FC
	ora $00.b,S		; 03 00
	sbc $FFFF1F.l,X		; FF 1F FF FF
	sbc $000F00.l,X		; FF 00 0F 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $000707.l		; 0F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FCFE.w,X		; FE FE FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $08.b		; 00 08
	asl $0700.w		; 0E 00 07
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	ora $070F04.l		; 0F 04 0F 07
	ora $010F00.l		; 0F 00 0F 01
	brk $0F.b		; 00 0F
	ora $000F01.l		; 0F 01 0F 00
	ora $DA2500.l		; 0F 00 25 DA
	cop $FD.b		; 02 FD
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $80FF03.l,X		; FF 03 FF 80
	ora $9FE0E0.l,X		; 1F E0 E0 9F
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	php		; 08
	ora $080E09.l		; 0F 09 0E 08
	asl $0D09.w		; 0E 09 0D
	ora #$0D.b		; 09 0D
	ora $000F00.l		; 0F 00 0F 00
	ora $070F00.l		; 0F 00 0F 07
	ora $040F07.l		; 0F 07 0F 04
	asl $0E04.w		; 0E 04 0E
	tsb $00.b		; 04 00
	sed		; F8
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $AA.b,X		; 55 AA
	rol A		; 2A
	cmp $75.b,X		; D5 75
	asl A		; 0A
	adc ($0D.b)		; 72 0D
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF07FF.l		; 0F FF 07 FF
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $00FF00.l,X		; 1F 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $F6.b		; 00 F6
	tsb $FFF8.w		; 0C F8 FF
	inc $FF.b,X		; F6 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FE.b		; 00 FE
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $FE.b		; 00 FE
	brk $9F.b		; 00 9F
	asl $837F.w,X		; 1E 7F 83
	eor $CFD0.w		; 4D D0 CF
	lda ($0F.b,S),Y		; B3 0F
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	inc $E101.w,X		; FE 01 E1
	.db $62, $FC, $00		; 62 FC 00
	sbc $30FF30.l,X		; FF 30 FF 30
	and $000030.l,X		; 3F 30 00 00
	brk $00.b		; 00 00
	inc $BDC0.w,X		; FE C0 BD
	ldy $F9.b		; A4 F9
	dec $FE.b,X		; D6 FE
	rol $F9F7.w,X		; 3E F7 F9
	sbc ($16.b,S),Y		; F3 16
	tda		; 7B
	jmp $3F1E00.l		; 5C 00 1E 3F
	cmp ($59.b,X)		; C1 59
	cpx $2B3F.w		; EC 3F 2B
	cmp ($00.b,X)		; C1 00
	inc $FF08.w,X		; FE 08 FF
	tsb $0C77.w		; 0C 77 0C
	asl $001E.w,X		; 1E 1E 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	inc $00F8.w,X		; FE F8 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $02.b		; 00 02
	lsr $44.b		; 46 44
	tsx		; BA
	inc $0000.w,X		; FE 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $F3.b		; 00 F3
	bpl -10.b		; 10 F6
	sbc $F6FFF3.l,X		; FF F3 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F6.b		; 00 F6
	sbc $000403.l,X		; FF 03 04 00
	brk $03.b		; 00 03
	brk $FE.b		; 00 FE
	sbc $000404.l,X		; FF 04 04 00
	brk $0B.b		; 00 0B
	brk $F9.b		; 00 F9
	sbc $000405.l,X		; FF 05 04 00
	brk $FC.b		; 00 FC
	brk $C3.b		; 00 C3
	brk $FF.b		; 00 FF
	and $47817F.l,X		; 3F 7F 81 47
	sed		; F8
	cmp [$3F.b],Y		; D7 3F
	cmp [$A8.b],Y		; D7 A8
	ora [$3F.b]		; 07 3F
	jsr ($C303.w,X)		; FC 03 C3
	tsb $C0.b		; 04 C0
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	and $38EF.w,Y		; 39 EF 38
	sbc $383F38.l,X		; FF 38 3F 38
	sbc $38BF00.l,X		; FF 00 BF 38
	inc $B4.b		; E6 B4
	sbc $077FFB.l,X		; FF FB 7F 07
	sbc $FFFE01.l,X		; FF 01 FE FF
	inc $FF03.w,X		; FE 03 FF
	brk $87.b		; 00 87
	tda		; 7B
	phk		; 4B
	lda $07.b		; A5 07
	tsb $F8.b		; 04 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($1E.b,X)		; 01 1E
	tas		; 1B
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $010101.l,X		; 1F 01 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bcs   0.b		; B0 00
	cpy $9B40.w		; CC 40 9B
	rts		; 60

	cpx #$E0.b		; E0 E0
	adc [$F7.b],Y		; 77 F7
	tyx		; BB
	cmp $C0703E.l		; CF 3E 70 C0
	brk $B0.b		; 00 B0
	bra -116.b		; 80 8C
	cpy #$FF.b		; C0 FF
	clv		; B8
	ora $80CE00.l,X		; 1F 00 CE 80
	bvs -62.b		; 70 C2
	sbc $3FC6.w,Y		; F9 C6 3F
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	cpy #$E0.b		; C0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	jsr ($00F0.w,X)		; FC F0 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	tsb $F408.w		; 0C 08 F4
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	tsb $F8.b		; 04 F8
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $00.b		; 00 00
	sbc $0C149E.l,X		; FF 9E 14 0C
	brk $49.b		; 00 49
	sbc ($1C.b)		; F2 1C
	ora $F5.b,S		; 03 F5
	brk $9C.b		; 00 9C
	sbc $FF8000.l,X		; FF 00 80 FF
	brk $AB.b		; 00 AB
	asl $00FF.w,X		; 1E FF 00
	sbc $FC03BF.l,X		; FF BF 03 FC
	sbc $63FF0A.l,X		; FF 0A FF 63
	bra -128.b		; 80 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	rti		; 40

	cpy #$00.b		; C0 00
	rti		; 40

	cpy #$00.b		; C0 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra  64.b		; 80 40
	rti		; 40

	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc $F606.w,Y		; F9 06 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $01.b		; 00 01
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F9.b		; 00 F9
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	sbc $000403.l,X		; FF 03 04 00
	brk $00.b		; 00 00
	sbc $5FB61F.l,X		; FF 1F B6 5F
	bit #$03.b		; 89 03
	bra -86.b		; 80 AA
	pea $E976.w		; F4 76 E9
	ora [$00.b]		; 07 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $A9.b		; 00 A9
	ora $FF1FF6.l,X		; 1F F6 1F FF
	brk $FF.b		; 00 FF
	eor $001EFD.l,X		; 5F FD 1E 00
	sbc $0003FF.l,X		; FF FF 03 00
	jsr ($54E0.w,X)		; FC E0 54
	inx		; E8
	tsb $00.b		; 04 00
	tsb $B4.b		; 04 B4
	jmp $00BC58.l		; 5C 58 BC 00
	jsr ($00FC.w,X)		; FC FC 00
	jsr ($B400.w,X)		; FC 00 B4
	cpx #$FC.b		; E0 FC
	cpx #$FC.b		; E0 FC
	brk $FC.b		; 00 FC
	inx		; E8
	jsr ($FCE0.w,X)		; FC E0 FC
	brk $FC.b		; 00 FC
	brk $C7.b		; 00 C7
	sbc $00C000.l,X		; FF 00 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sec		; 38
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $007C.w		; 0C 7C 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($0CF0.w,X)		; 7C F0 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sbc [$09.b],Y		; F7 09
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b,X		; F5 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF5FF.l,X		; FF FF F5 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $FF.b,X		; F5 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $03FF.w,X		; FD FF 03
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $04FFFD.l,X		; FF FD FF 04
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $FD.b		; 00 FD
	sbc $000405.l,X		; FF 05 04 00
	brk $FF.b		; 00 FF
	sbc $4A0A0F.l,X		; FF 0F 0A 4A
	bit $00FF.w,X		; 3C FF 00
	dex		; CA
	adc $7ACD.w,X		; 7D CD 7A
	ldy $FEFF.w,X		; BC FF FE
	eor ($7F.b,X)		; 41 7F
	brk $95.b		; 00 95
	ora $FF4EF3.l		; 0F F3 4E FF
	brk $FF.b		; 00 FF
	ora [$FF.b],Y		; 17 FF
	ora [$FF.b],Y		; 17 FF
	rti		; 40

	sbc $FFFF00.l,X		; FF 00 FF FF
	plx		; FA
	ldy $0700.w		; AC 00 07
	ora [$08.b]		; 07 08
	dey		; 88
	ora [$54.b],Y		; 17 54
	pld		; 2B
	ror $7FFF.w,X		; 7E FF 7F
	cpy #$FF.b		; C0 FF
	brk $53.b		; 00 53
	inc $00FF.w,X		; FE FF 00
	ora $FDFFF0.l		; 0F F0 FF FD
	sbc $00FFFD.l,X		; FF FD FF 00
	sbc $E0C000.l,X		; FF 00 C0 E0
	brk $00.b		; 00 00
	rti		; 40

	bra -32.b		; 80 E0
	brk $60.b		; 00 60
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	rti		; 40

	cpy #$00.b		; C0 00
	jsr $E000.w		; 20 00 E0
	rti		; 40

	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	inc $001E.w,X		; FE 1E 00
	inc $E000.w,X		; FE 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFE00.l,X		; FF 00 FE FF
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $EFE01F.l		; 4F 1F E0 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1FEFE0.l,X		; FF E0 EF 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $F2.b		; 00 F2
	tsb $FFF0.w		; 0C F0 FF
	sbc ($FF.b)		; F2 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	plx		; FA
	sbc $01FFF0.l,X		; FF F0 FF 01
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $000402.l,X		; FF 02 04 00
	brk $0A.b		; 00 0A
	brk $F0.b		; 00 F0
	sbc $000403.l,X		; FF 03 04 00
	brk $F2.b		; 00 F2
	sbc $04FFF8.l,X		; FF F8 FF 04
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $05FFF8.l,X		; FF F8 FF 05
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000406.l,X		; FF 06 04 00
	brk $0A.b		; 00 0A
	brk $F8.b		; 00 F8
	sbc $000407.l,X		; FF 07 04 00
	brk $40.b		; 00 40
	adc $034301.l,X		; 7F 01 43 03
	cop $13.b		; 02 13
	asl $FFFF.w		; 0E FF FF
	sbc $7EAB00.l,X		; FF 00 AB 7E
	tax		; AA
	adc $46003F.l,X		; 7F 3F 00 46
	ora ($85.b,X)		; 01 85
	ora $BD.b,S		; 03 BD
	and $00.b,S		; 23 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor $FF.b		; 45 FF
	eor $03.b		; 45 03
	sbc $7F6BFF.l,X		; FF FF 6B 7F
	cmp ($FE.b)		; D2 FE
	lda $C0DF.w		; AD DF C0
	cpy #$20.b		; C0 20
	eor $AAA0.w,Y		; 59 A0 AA
	eor $FF.b,X		; 55 FF
	brk $94.b		; 00 94
	sbc $52FF2D.l,X		; FF 2D FF 52
	sbc $E0003F.l,X		; FF 3F 00 E0
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sei		; 78
	inx		; E8
	bvc -39.b		; 50 D9
	rol $7F.b,X		; 36 7F
	adc $523C03.l,X		; 7F 03 3C 52
	lda $FF5FA2.l		; AF A2 5F FF
	brk $84.b		; 00 84
	sed		; F8
	ldy $CFF8.w		; AC F8 CF
	sed		; F8
	bra   0.b		; 80 00
	and $F4FFC0.l,X		; 3F C0 FF F4
	sbc $8080F4.l,X		; FF F4 80 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	cpy #$00.b		; C0 00
	rti		; 40

	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	bra   0.b		; 80 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rti		; 40

	cpx #$40.b		; E0 40
	cmp $2A.b,X		; D5 2A
	cmp $00FF20.l,X		; DF 20 FF 00
	sbc $07FF00.l,X		; FF 00 FF 07
	sbc $FF00F7.l,X		; FF F7 00 FF
	brk $F8.b		; 00 F8
	sbc $20FF7F.l,X		; FF 7F FF 20
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $FFFF00.l,X		; 7F 00 FF FF
	sed		; F8
	sed		; F8
	eor $1C97.w,Y		; 59 97 1C
	inc $CD.b,X		; F6 CD
	rol $C5.b,X		; 36 C5
	rol $D5.b,X		; 36 D5
	cpy #$E0.b		; C0 E0
	sbc ($0E.b,X)		; E1 0E
	inc $0000.w		; EE 00 00
	cmp [$E8.b],Y		; D7 E8
	sbc [$08.b],Y		; F7 08
	rol $C9.b,X		; 36 C9
	sbc [$08.b],Y		; F7 08
	sbc $00FF0E.l,X		; FF 0E FF 00
	inc $00F1.w		; EE F1 00
	brk $55.b		; 00 55
	rol A		; 2A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FC7F00.l,X		; FF 00 7F FC
	sta $FD.b,S		; 83 FD
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	adc $00FFFF.l,X		; 7F FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF7C.l,X		; FF 7C FF FF
	ora $03.b,S		; 03 03
	rts		; 60

	bra -32.b		; 80 E0
	cpy #$E0.b		; C0 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$E0.b		; E0 E0
	cpy #$E0.b		; C0 E0
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	cpx #$06.b		; E0 06
	bra  24.b		; 80 18
	brk $EE.b		; 00 EE
	ora ($EB.b),Y		; 11 EB
	sbc $EBFFEE.l,X		; FF EE FF EB
	sbc $000400.l,X		; FF 00 04 00
	brk $FE.b		; 00 FE
	sbc $02FFEB.l,X		; FF EB FF 02
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $EB.b		; 00 EB
	sbc $000404.l,X		; FF 04 04 00
	brk $EE.b		; 00 EE
	sbc $06FFFB.l,X		; FF FB FF 06
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $08FFFB.l,X		; FF FB FF 08
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $FB.b		; 00 FB
	sbc $00040A.l,X		; FF 0A 04 00
	brk $3F.b		; 00 3F
	and $005F5F.l,X		; 3F 5F 5F 00
	jsr $0220.w		; 20 20 02
	clc		; 18
	brk $19.b		; 00 19
	bit $7F.b		; 24 7F
	adc $0000FF.l,X		; 7F FF 00 00
	brk $3F.b		; 00 3F
	brk $61.b		; 00 61
	brk $43.b		; 00 43
	brk $5B.b		; 00 5B
	brk $FF.b		; 00 FF
	ora $0080.w,Y		; 19 80 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $DB7FFF.l,X		; FF FF 7F DB
	sbc $B2DF89.l,X		; FF 89 DF B2
	tyx		; BB
	eor [$FF.b],Y		; 57 FF
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	sbc $7FA400.l,X		; FF 00 A4 7F
	ror $FF.b,X		; 76 FF
	eor $ACFF.w		; 4D FF AC
	sed		; F8
	ora ($00.b,X)		; 01 00
	inc $E001.w,X		; FE 01 E0
	sbc $FFFCFF.l,X		; FF FF FC FF
	.db $82, $FF, $37		; 82 FF 37
	sbc $FFFFEA.l,X		; FF EA FF FF
	sbc $000000.l,X		; FF 00 00 00
	ora $1FE300.l,X		; 1F 00 E3 1F
	adc $C8FF.w,X		; 7D FF C8
	sbc $00FF15.l,X		; FF 15 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	dey		; 88
	cpx #$B0.b		; E0 B0
	bcs 100.b		; B0 64
	sbc ($00.b),Y		; F1 00
	sta $FF72.w,Y		; 99 72 FF
	sbc $FFF807.l,X		; FF 07 F8 FF
	brk $78.b		; 00 78
	cpx #$58.b		; E0 58
	cpx #$9C.b		; E0 9C
	beq  -3.b		; F0 FD
	beq -49.b		; F0 CF
	and $0000.w,Y		; 39 00 00
	sbc $800000.l,X		; FF 00 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra  64.b		; 80 40
	cpx #$E0.b		; E0 E0
	beq   0.b		; F0 00
	cpy #$00.b		; C0 00
	rts		; 60

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	brk $F0.b		; 00 F0
	bra  16.b		; 80 10
	brk $F0.b		; 00 F0
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
	brk $7C.b		; 00 7C
	brk $7F.b		; 00 7F
	adc $007D7E.l,X		; 7F 7E 7D 00
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $83.b		; 00 83
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $FD.b		; 00 FD
	jsr ($FB03.w,X)		; FC 03 FB
	ora ($FD.b,X)		; 01 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF01.l,X		; FF 01 FF 00
	xce		; FB
	jsr ($FEFD.w,X)		; FC FD FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $03.b,X		; D5 03
	asl A		; 0A
	asl $FC.b		; 06 FC
	sbc $00FBF8.l,X		; FF F8 FB 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	asl $FFF1.w		; 0E F1 FF
	ora $FB.b,S		; 03 FB
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	cpy #$07.b		; C0 07
	ora [$07.b]		; 07 07
	xce		; FB
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F80400.l,X		; FF 00 04 F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  16.b		; F0 10
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	bpl   0.b		; 10 00
	beq   0.b		; F0 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
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
	cmp [$21.b],Y		; D7 21
	inc $1F.b,X		; F6 1F
	dec $3F.b,X		; D6 3F
	xba		; EB
	ora $C3.b,X		; 15 C3
	and $FF10EF.l,X		; 3F EF 10 FF
	bmi 127.b		; 30 7F
	brk $E1.b		; 00 E1
	rol $21FF.w,X		; 3E FF 21
	sbc $3EFF21.l,X		; FF 21 FF 3E
	jsr ($FF00.w,X)		; FC 00 FF
	bpl  -1.b		; 10 FF
	brk $FF.b		; 00 FF
	brk $D5.b		; 00 D5
	rol A		; 2A
	tax		; AA
	cmp $D5.b,X		; D5 D5
	tax		; AA
	plb		; AB
	eor ($32.b,S),Y		; 53 32
	lsr $FC03.w		; 4E 03 FC
	sbc ($1F.b,X)		; E1 1F
	sbc $7F03.w,X		; FD 03 7F
	sbc $FF7FFF.l,X		; FF FF 7F FF
	adc $FEFCFB.l,X		; 7F FB FC FE
	ora ($FC.b,X)		; 01 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $35.b		; 00 35
	asl A		; 0A
	sta ($05.b)		; 92 05
	eor $AA.b,X		; 55 AA
	.db $82, $79, $CF		; 82 79 CF
	sei		; 78
	plx		; FA
	asl $4C.b		; 06 4C
	jmp ($7047.w,X)		; 7C 47 70
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $877BFF.l,X		; FF FF 7B 87
	adc [$80.b],Y		; 77 80
	ora ($F8.b,X)		; 01 F8
	adc ($80.b,S),Y		; 73 80
	adc $A85880.l,X		; 7F 80 58 A8
	ldx $5F.b,Y		; B6 5F
	lsr $BF.b,X		; 56 BF
	plb		; AB
	eor $E0.b,X		; 55 E0
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $E8.b		; 00 E8
	sbc [$FF.b],Y		; F7 FF
	cpx #$FF.b		; E0 FF
	cpx #$FD.b		; E0 FD
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007000.l,X		; FF 00 70 00
	bcs -64.b		; B0 C0
	beq -128.b		; F0 80
	bcs  64.b		; B0 40
	bmi -64.b		; 30 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	cpx #$00.b		; E0 00
	bvs -64.b		; 70 C0
	beq  64.b		; F0 40
	beq  64.b		; F0 40
	bvs -64.b		; 70 C0
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
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
	asl $80.b		; 06 80
	clc		; 18
	brk $EA.b		; 00 EA
	asl $E6.b,X		; 16 E6
	sbc $E6FFEA.l,X		; FF EA FF E6
	sbc $000400.l,X		; FF 00 04 00
	brk $FA.b		; 00 FA
	sbc $02FFE6.l,X		; FF E6 FF 02
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $E6.b		; 00 E6
	sbc $000404.l,X		; FF 04 04 00
	brk $EA.b		; 00 EA
	sbc $06FFF6.l,X		; FF F6 FF 06
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $08FFF6.l,X		; FF F6 FF 08
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $F6.b		; 00 F6
	sbc $00040A.l,X		; FF 0A 04 00
	brk $1F.b		; 00 1F
	ora $005F5F.l,X		; 1F 5F 5F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($0C.b,X)		; 21 0C
	and ($0C.b,S),Y		; 33 0C
	and ($40.b)		; 32 40
	lsr $0000.w,X		; 5E 00 00
	and $006000.l,X		; 3F 00 60 00
	rts		; 60

	brk $61.b		; 00 61
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	tsb $00BF.w		; 0C BF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $3EC6.w,X		; 1D C6 3E
	sta $2B3C.w,X		; 9D 3C 2B
	and $AE7320.l,X		; 3F 20 73 AE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1FF900.l,X		; FF 00 F9 1F
.ACCU 8
.INDEX 8
	sep #$3F		; E2 3F
	pei ($3F.b)		; D4 3F
	cmp $7FD13F.l,X		; DF 3F D1 7F
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $EA17FF.l,X		; FF FF 17 EA
	and [$DB.b]		; 27 DB
	sbc [$19.b]		; E7 19
	sbc $8000E6.l,X		; FF E6 00 80
	adc $00007F.l,X		; 7F 7F 00 00
	sbc $FF1500.l,X		; FF 00 15 FF
	bit $FF.b		; 24 FF
	inc $FF.b		; E6 FF
	ora $FFFF.w,Y		; 19 FF FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $136EFF.l,X		; FF FF 6E 13
	cpx $21DF.w		; EC DF 21
	lda ($4F.b),Y		; B1 4F
	sbc $0100D0.l,X		; FF D0 00 01
	jsr ($FFFC.w,X)		; FC FC FF
	brk $91.b		; 00 91
	sbc $DEFF13.l,X		; FF 13 FF DE
	sbc $2FFFB0.l,X		; FF B0 FF 2F
	sbc $0300FF.l,X		; FF FF 00 03
	brk $00.b		; 00 00
	sbc $C0D080.l,X		; FF 80 D0 C0
	clc		; 18
	cpx #$C8.b		; E0 C8
	cpx #$A4.b		; E0 A4
	sbc ($26.b,X)		; E1 26
	adc ($AA.b),Y		; 71 AA
	brk $03.b		; 00 03
	sbc $807000.l,X		; FF 00 70 80
	sed		; F8
	cpy #$38.b		; C0 38
	cpx #$5C.b		; E0 5C
	cpx #$DF.b		; E0 DF
	cpx #$DF.b		; E0 DF
	adc ($FF.b),Y		; 71 FF
	brk $00.b		; 00 00
	ldy #$40.b		; A0 40
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bpl -48.b		; 10 D0
	cpy #$00.b		; C0 00
	jsr $3000.w		; 20 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	bra -24.b		; 80 E8
	brk $F7.b		; 00 F7
	clc		; 18
	sbc $08FF18.l		; EF 18 FF 08
	adc $007F00.l,X		; 7F 00 7F 00
	asl $FEFF.w,X		; 1E FF FE
	sbc $FFFF00.l,X		; FF 00 FF FF
	php		; 08
	sbc $10EF10.l,X		; FF 10 EF 10
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	adc $FFFF00.l,X		; 7F 00 FF FF
	cpy #$3F.b		; C0 3F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	bra  26.b		; 80 1A
	sbc ($9A.b,S),Y		; F3 9A
	adc ($F5.b,S),Y		; 73 F5
	brk $6A.b		; 00 6A
	brk $90.b		; 00 90
	cpy #$7F.b		; C0 7F
	adc $80BF3F.l,X		; 7F 3F BF 80
	adc $F30CF3.l,X		; 7F F3 0C F3
	tsb $1FFF.w		; 0C FF 1F
	sbc $0FF01F.l,X		; FF 1F F0 0F
	adc $C0BF80.l,X		; 7F 80 BF C0
	xce		; FB
	sec		; 38
	sbc ($70.b,S),Y		; F3 70
	lda $007040.l,X		; BF 40 70 00
	lda $30500F.l		; AF 0F 50 30
	cpx #$EF.b		; E0 EF
	cpx #$EF.b		; E0 EF
	ora [$C0.b]		; 07 C0
	sta $00BF00.l		; 8F 00 BF 00
	sbc $C0FFC0.l,X		; FF C0 FF C0
	bvs -113.b		; 70 8F
	sbc $1FEF1F.l		; EF 1F EF 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sta [$80.b]		; 87 80
	phd		; 0B
	ora $00FF03.l		; 0F 03 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $C0B8FF.l,X		; FF FF B8 C0
	clv		; B8
	cpy #$F8.b		; C0 F8
	bra -16.b		; 80 F0
	brk $F8.b		; 00 F8
	php		; 08
	cpx #$F8.b		; E0 F8
	sed		; F8
	sed		; F8
	brk $F8.b		; 00 F8
	sed		; F8
	rti		; 40

	sed		; F8
	rti		; 40

	clv		; B8
	rti		; 40

	sed		; F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	sed		; F8
	adc $00FE7F.l,X		; 7F 7F FE 00
	sbc ($00.b,X)		; E1 00
	sbc #$3E.b		; E9 3E
	sbc $CE2E.w,Y		; F9 2E CE
	and [$D1.b],Y		; 37 D1
	rol $1EE0.w		; 2E E0 1E
	bra   0.b		; 80 00
	inc $E101.w,X		; FE 01 E1
	ora $FE11FE.l,X		; 1F FE 11 FE
	ora ($F7.b),Y		; 11 F7
	ora $1FFF.w,Y		; 19 FF 1F
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $CA.b,X		; F5 CA
	rol A		; 2A
	sbc $35.b,X		; F5 35
	nop		; EA
	nop		; EA
	cmp $60.b,X		; D5 60
	lda $00D18E.l		; AF 8E D1 00
	brk $00.b		; 00 00
	sbc $FF3FDF.l,X		; FF DF 3F FF
	cmp $DFDFFF.l,X		; DF FF DF DF
	and $3FC0FF.l,X		; 3F FF C0 3F
	brk $FF.b		; 00 FF
	bra  10.b		; 80 0A
	ora $5D.b,X		; 15 5D
	ldx $5CA2.w		; AE A2 5C
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $74.b,X		; 55 74
	sbc [$26.b],Y		; F7 26
	sbc [$7F.b]		; E7 7F
	brk $1F.b		; 00 1F
	sbc $FFFFF3.l,X		; FF F3 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E708F7.l,X		; FF F7 08 E7
	clc		; 18
	sbc $54A807.l,X		; FF 07 A8 54
	eor $AA.b,X		; 55 AA
	tax		; AA
	sta $55.b,X		; 95 55
	rol A		; 2A
	tax		; AA
	eor $83.b,X		; 55 83
	adc $F840FF.l,X		; 7F FF 40 F8
	brk $FC.b		; 00 FC
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BF00FF.l,X		; FF FF 00 BF
	brk $FF.b		; 00 FF
	sbc $780700.l,X		; FF 00 07 78
	tya		; 98
	ldy $7F.b		; A4 7F
	stz $BF.b		; 64 BF
	ldy $955B.w,X		; BC 5B 95
	txa		; 8A
	bra 127.b		; 80 7F
	brk $00.b		; 00 00
	ora [$F8.b]		; 07 F8
	cld		; D8
	sbc [$FF.b]		; E7 FF
	cpy #$FF.b		; C0 FF
	cpy #$DB.b		; C0 DB
	cpx $9F.b		; E4 9F
	adc $F800FF.l,X		; 7F FF 00 F8
	cpx #$18.b		; E0 18
	cpx #$18.b		; E0 18
	brk $B8.b		; 00 B8
	cpx #$F8.b		; E0 F8
	ldy #$98.b		; A0 98
	cpx #$58.b		; E0 58
	ldy #$38.b		; A0 38
	cpy #$18.b		; C0 18
	brk $F8.b		; 00 F8
	brk $18.b		; 00 18
	cpx #$F8.b		; E0 F8
	rti		; 40

	sed		; F8
	rti		; 40

	sed		; F8
	rti		; 40

	sed		; F8
	cpy #$F8.b		; C0 F8
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	bra  32.b		; 80 20
	brk $E6.b		; 00 E6
	inc A		; 1A
	sbc ($FF.b,X)		; E1 FF
	inc $FF.b		; E6 FF
	sbc ($FF.b,X)		; E1 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	sbc ($FF.b,X)		; E1 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc ($FF.b,X)		; E1 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	asl $00.b,X		; 16 00
	sbc ($FF.b,X)		; E1 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	inc $FF.b		; E6 FF
	sbc ($FF.b),Y		; F1 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F1.b		; 00 F1
	sbc $00040C.l,X		; FF 0C 04 00
	brk $16.b		; 00 16
	brk $F1.b		; 00 F1
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1F.b		; 00 1F
	ora $001710.l,X		; 1F 10 17 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bvc   0.b		; 50 00
	brk $06.b		; 00 06
	ora #$09.b		; 09 09
	bra   0.b		; 80 00
	brk $0F.b		; 00 0F
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	brk $6F.b		; 00 6F
	brk $6F.b		; 00 6F
	asl $FF.b		; 06 FF
	sbc $07FF00.l,X		; FF 00 FF 07
	and ($07.b,S),Y		; 33 07
	rol $670F.w		; 2E 0F 67
	ora $0B0C4B.l		; 0F 4B 0C 0B
	ora $00001C.l		; 0F 1C 00 00
	sbc $073C00.l,X		; FF 00 3C 07
	and $7807.w,Y		; 39 07 78
	ora $740F74.l		; 0F 74 0F 74
	ora $FF0F73.l		; 0F 73 0F FF
	sbc $21FF00.l,X		; FF 00 FF 21
	dec $EDFF.w,X		; DE FF ED
	cpy $0633.w		; CC 33 06
	sbc $D6FF.w,Y		; F9 FF D6
	bpl -17.b		; 10 EF
	brk $00.b		; 00 00
	sbc $FF2100.l,X		; FF 00 21 FF
	ora ($FF.b)		; 12 FF
	cpy $06FF.w		; CC FF 06
	sbc $10FF29.l,X		; FF 29 FF 10
	sbc $0FFFF0.l,X		; FF F0 FF 0F
	sbc $FFE7F8.l,X		; FF F8 E7 FF
	stp		; DB
	sed		; F8
	and $FF3EF9.l,X		; 3F F9 3E FF
	sbc $F6F9.w		; ED F9 F6
	ora $00FF00.l		; 0F 00 FF 00
	clc		; 18
	sbc $C0FF24.l,X		; FF 24 FF C0
	sbc $12FFC1.l,X		; FF C1 FF 12
	sbc $00FF09.l,X		; FF 09 FF 00
	sbc $87FFFF.l,X		; FF FF FF 87
	ply		; 7A
	xce		; FB
	adc [$F7.b],Y		; 77 F7
	ora $FFEF17.l		; 0F 17 EF FF
	bne -89.b		; D0 A7
	lsr $00FF.w,X		; 5E FF 00
	sbc $FF8500.l,X		; FF 00 85 FF
	dey		; 88
	sbc $10FFF0.l,X		; FF F0 FF 10
	sbc $A1FF2F.l,X		; FF 2F FF A1
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $002000.l,X		; FF 00 20 00
	ldy #$80.b		; A0 80
	bmi -64.b		; 30 C0
	tya		; 98
	cmp $CC.b,S		; C3 CC
	cpy $C8.b		; C4 C8
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	beq -128.b		; F0 80
	sei		; 78
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cmp $00.b,S		; C3 00
	jsr $8080.w		; 20 80 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	bmi   0.b		; 30 00
	jsr $A000.w		; 20 00 A0
	bra  40.b		; 80 28
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $B0.b		; 00 B0
	brk $B0.b		; 00 B0
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
	brk $F5.b		; 00 F5
	asl A		; 0A
	nop		; EA
	ora $E0.b,X		; 15 E0
	ora $F70CFB.l,X		; 1F FB 0C F7
	php		; 08
	sbc [$1C.b],Y		; F7 1C
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $04FF00.l,X		; FF 00 FF 04
	php		; 08
	sbc $FF08FF.l,X		; FF FF 08 FF
	brk $FF.b		; 00 FF
	brk $75.b		; 00 75
	tsx		; BA
	tay		; A8
	eor ($61.b,S),Y		; 53 61
	inc $F0.b,X		; F6 F0
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp $8FF8FF.l		; CF FF F8 8F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $57.b		; 00 57
	lda [$07.b]		; A7 07
	sbc $073EC6.l,X		; FF C6 3E 07
	sed		; F8
	sbc $8107.w,Y		; F9 07 81
	adc $FF07F9.l,X		; 7F F9 07 FF
	brk $E7.b		; 00 E7
	sed		; F8
	sbc $01FE00.l,X		; FF 00 FE 01
	sed		; F8
	ora [$07.b]		; 07 07
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7EC201.l,X		; FF 01 C2 7E
	cpy $7B.b		; C4 7B
	sbc [$78.b]		; E7 78
	sbc $A702.w,X		; FD 02 A7
	sec		; 38
	and [$39.b]		; 27 39
	and [$38.b]		; 27 38
	eor [$00.b],Y		; 57 00
	ror $7F81.w,X		; 7E 81 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	jsr ($C33C.w,X)		; FC 3C C3
	bit $3FC0.w,X		; 3C C0 3F
	cpy #$FF.b		; C0 FF
	jsr ($2A55.w,X)		; FC 55 2A
	asl $FEFE.w		; 0E FE FE
	ora ($4F.b,X)		; 01 4F
	cpy #$FF.b		; C0 FF
	brk $8F.b		; 00 8F
	bra  -1.b		; 80 FF
	brk $81.b		; 00 81
	brk $7F.b		; 00 7F
	sbc $FF01FE.l,X		; FF FE 01 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	sbc $FF007F.l,X		; FF 7F 00 FF
	brk $FF.b		; 00 FF
	brk $77.b		; 00 77
	sbc $00552A.l		; EF 2A 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tya		; 98
	adc $00FFFF.l,X		; 7F FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $A05800.l,X		; FF 00 58 A0
	tya		; 98
	rts		; 60

	sec		; 38
	cpy #$78.b		; C0 78
	cpy #$78.b		; C0 78
	bra 120.b		; 80 78
	cpy #$F0.b		; C0 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	cpy #$F8.b		; C0 F8
	cpy #$F8.b		; C0 F8
	brk $F8.b		; 00 F8
	bra -128.b		; 80 80
	sed		; F8
	sed		; F8
	bra  -8.b		; 80 F8
	brk $F8.b		; 00 F8
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
	brk $60.b		; 00 60
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $EC.b		; 00 EC
	ora [$F4.b],Y		; 17 F4
	ora $9F17EC.l		; 0F EC 17 9F
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FF18FF.l,X		; 1F FF 18 FF
	clc		; 18
	sbc $000018.l,X		; FF 18 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $CA32.w,X		; FD 32 CA
	sbc $FACD.w,X		; FD CD FA
	dex		; CA
	sbc $00FF.w,X		; FD FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	and [$CF.b],Y		; 37 CF
	sbc $37FF37.l,X		; FF 37 FF 37
	sbc $070737.l,X		; FF 37 07 07
	sbc $00FFFC.l,X		; FF FC FF 00
	cop $01.b		; 02 01
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $F8.b,X		; 55 F8
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	ror A		; 6A
	stx $15.b,Y		; 96 15
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $EBFFBF.l,X		; FF BF FF EB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FE0E0.l,X		; FF E0 E0 7F
	adc $A038F9.l,X		; 7F F9 38 A0
	bvc  85.b		; 50 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $1F.b,X		; 55 1F
	brk $80.b		; 00 80
	brk $C7.b		; 00 C7
	brk $F0.b		; 00 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0700.l,X		; FF 00 07 FF
	sbc $1000FF.l,X		; FF FF 00 10
	ora $9F60E0.l,X		; 1F E0 60 9F
	sbc [$90.b],Y		; F7 90
	sbc $FFF798.l,X		; FF 98 F7 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	cpx #$60.b		; E0 60
	sta $FF08FF.l,X		; 9F FF 08 FF
	php		; 08
	sbc $D00008.l,X		; FF 08 00 D0
	beq -16.b		; F0 F0
	sed		; F8
	brk $18.b		; 00 18
	cpx #$18.b		; E0 18
	brk $B8.b		; 00 B8
	rts		; 60

	sei		; 78
	ldy #$98.b		; A0 98
	rts		; 60

	inx		; E8
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $18.b		; 00 18
	cpx #$F8.b		; E0 F8
	cpy #$F8.b		; C0 F8
	cpy #$F8.b		; C0 F8
	cpy #$00.b		; C0 00
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
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	sbc $BFDF5F.l,X		; FF 5F DF BF
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $800000.l,X		; FF 00 00 80
	brk $FF.b		; 00 FF
	sbc $C0FF3F.l,X		; FF 3F FF C0
	lda $00FF00.l,X		; BF 00 FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $80FFFF.l,X		; 3F FF FF 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $06.b		; 00 06
	brk $FB.b		; 00 FB
	sed		; F8
	sed		; F8
	jsr ($E707.w,X)		; FC 07 E7
	ora ($F9.b,X)		; 01 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $F8E700.l,X		; FF 00 E7 F8
	sbc $00FE.w,Y		; F9 FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AB.b		; 00 AB
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $FF.b,S		; 03 FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr ($FC03.w,X)		; FC 03 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($0003.w,X)		; FC 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ror $8080.w,X		; 7E 80 80
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F8000.l,X		; FF 00 80 7F
	sbc $FF7F7F.l,X		; FF 7F 7F FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3F3700.l		; 0F 00 37 3F
	ora $EF17D7.l		; 0F D7 17 EF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $C03800.l,X		; FF 00 38 C0
	cmp $E0FFE0.l,X		; DF E0 FF E0
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	ora $00000F.l		; 0F 0F 00 00
	sed		; F8
	php		; 08
	cpx #$F8.b		; E0 F8
	beq  -8.b		; F0 F8
	inx		; E8
	inx		; E8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	tsb $2880.w		; 0C 80 28
	brk $E2.b		; 00 E2
	ora $E2FFDC.l,X		; 1F DC FF E2
	sbc $00FFDC.l,X		; FF DC FF 00
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $02FFDC.l,X		; FF DC FF 02
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $DC.b		; 00 DC
	sbc $000404.l,X		; FF 04 04 00
	brk $12.b		; 00 12
	brk $DC.b		; 00 DC
	sbc $000406.l,X		; FF 06 04 00
	brk $E2.b		; 00 E2
	sbc $08FFEC.l,X		; FF EC FF 08
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $0AFFEC.l,X		; FF EC FF 0A
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $EC.b		; 00 EC
	sbc $00040C.l,X		; FF 0C 04 00
	brk $12.b		; 00 12
	brk $EC.b		; 00 EC
	sbc $00040E.l,X		; FF 0E 04 00
	brk $E2.b		; 00 E2
	sbc $20FFFC.l,X		; FF FC FF 20
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $22FFFC.l,X		; FF FC FF 22
	tsb $00.b		; 04 00
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	sbc $004420.l,X		; FF 20 44 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $004422.l,X		; FF 22 44 00
	brk $0F.b		; 00 0F
	ora $271B18.l		; 0F 18 1B 27
	and [$00.b]		; 27 00
	php		; 08
	brk $08.b		; 00 08
	brk $48.b		; 00 48
	brk $10.b		; 00 10
	ora $14.b,S		; 03 14
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $003800.l,X		; 1F 00 38 00
	sec		; 38
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	brk $77.b		; 00 77
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $010C01.l,X		; FF 01 0C 01
	phd		; 0B
	ora $19.b,S		; 03 19
	ora $32.b,S		; 03 32
	ora $A2.b,S		; 03 A2
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $010E01.l		; 0F 01 0E 01
	asl $3D03.w,X		; 1E 03 3D
	ora $BD.b,S		; 03 BD
	ora $FF.b,S		; 03 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFBBE4.l,X		; FF E4 BB FF
	cmp $E6F9.w,X		; DD F9 E6
	cpx #$FF.b		; E0 FF
	ora $0000FA.l,X		; 1F FA 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	mvp $22,$FF		; 44 FF 22
	sbc $00FF19.l,X		; FF 19 FF 00
	sbc $FFFF05.l,X		; FF 05 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFEF1F.l,X		; FF 1F EF FF
	jmp.w [$B34F]		; DC 4F B3
	sbc $EFFF12.l		; EF 12 FF EF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bpl  -1.b		; 10 FF
	and $FF.b,S		; 23 FF
	jmp $EDFF.w		; 4C FF ED
	sbc $80FF10.l,X		; FF 10 FF 80
	sbc $FFFF7F.l,X		; FF 7F FF FF
	cmp $3BC4.w,X		; DD C4 3B
	sbc $F8C7DB.l,X		; FF DB C7 F8
	iny		; C8
	sbc [$FF.b],Y		; F7 FF
	adc $FF007F.l		; 6F 7F 00 FF
	brk $A2.b		; 00 A2
	adc $24FFC4.l,X		; 7F C4 FF 24
	sbc $08FF07.l,X		; FF 07 FF 08
	sbc $00FF90.l,X		; FF 90 FF 00
	sbc $FCFFFF.l,X		; FF FF FF FC
	tsx		; BA
	asl $EEE8.w,X		; 1E E8 EE
	cmp $5F3EDF.l,X		; DF DF 3E 5F
	tyx		; BB
	sbc $00FF41.l,X		; FF 41 FF 00
	sbc $FC4700.l,X		; FF 00 47 FC
	ora [$FE.b],Y		; 17 FE
	and ($FE.b,X)		; 21 FE
	cmp ($FF.b,X)		; C1 FF
	mvp $BE,$FF		; 44 FF BE
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $60.b		; 00 60
	bra  48.b		; 80 30
	sta $94.b,S		; 83 94
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	beq -128.b		; F0 80
	adc [$80.b],Y		; 77 80
	brk $20.b		; 00 20
	bra -128.b		; 80 80
	bra  80.b		; 80 50
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	plp		; 28
	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $38.b		; 00 38
	brk $B8.b		; 00 B8
	brk $FA.b		; 00 FA
	ora [$F6.b],Y		; 17 F6
	tas		; 1B
	xba		; EB
	ora $E5.b,X		; 15 E5
	inc A		; 1A
	nop		; EA
	ora $F0.b,X		; 15 F0
	ora $FD06FD.l		; 0F FD 06 FD
	asl $FF.b		; 06 FF
	tsb $0CFF.w		; 0C FF 0C
	sbc $FF0E.w,X		; FD 0E FF
	ora $FF0FFF.l		; 0F FF 0F FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	cop $72.b		; 02 72
	cmp $FEFE53.l,X		; DF 53 FE FE
	sta $AA55.w		; 8D 55 AA
	tax		; AA
	lsr $18.b,X		; 56 18
	cmp $00FF.w,X		; DD FF 00
	jsr ($FF03.w,X)		; FC 03 FF
	and $2DFF.w		; 2D FF 2D
	lda $FF73.w		; AD 73 FF
	sbc $E3FCFF.l,X		; FF FF FC E3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $56.b,X		; 55 56
	tay		; A8
	brk $FF.b		; 00 FF
	sei		; 78
	sta [$E0.b]		; 87 E0
	ora $FFFF00.l,X		; 1F 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFC.l,X		; FF FC FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AB.b		; 00 AB
	mvn $AA,$55		; 54 55 AA
	tax		; AA
	eor $7C.b,X		; 55 7C
	adc [$FC.b],Y		; 77 FC
	sbc [$6E.b],Y		; F7 6E
	sbc [$6E.b]		; E7 6E
	sbc [$FF.b]		; E7 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F78877.l,X		; FF 77 88 F7
	php		; 08
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	brk $FF.b		; 00 FF
	ror A		; 6A
	and $55.b,X		; 35 55
	txa		; 8A
	tax		; AA
	eor $11.b,X		; 55 11
	sbc ($20.b)		; F2 20
	cmp $27C03F.l,X		; DF 3F C0 27
	cpy #$E9.b		; C0 E9
	ora [$DF.b],Y		; 17 DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0FF3.l,X		; FF F3 0F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpx #$AB.b		; E0 AB
	eor $55.b,X		; 55 55
	plb		; AB
	plb		; AB
	mvn $AA,$55		; 54 55 AA
	sec		; 38
	sed		; F8
	jsr ($FF03.w,X)		; FC 03 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FF07F8.l,X		; FF F8 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $28.b		; 00 28
	sbc $E8EF38.l,X		; FF 38 EF E8
	cmp $AAA75F.l,X		; DF 5F A7 AA
	eor $00.b,X		; 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	bpl  -1.b		; 10 FF
	bpl -33.b		; 10 DF
	bmi  -9.b		; 30 F7
	sed		; F8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ldy $7C60.w,X		; BC 60 7C
	ldy #$9C.b		; A0 9C
	rts		; 60

	jmp $609CA0.l		; 5C A0 9C 60
	bit $FCC0.w,X		; 3C C0 FC
	rti		; 40

	jmp ($FCC0.w,X)		; 7C C0 FC
	cpy #$FC.b		; C0 FC
	cpy #$FC.b		; C0 FC
	cpy #$FC.b		; C0 FC
	cpy #$FC.b		; C0 FC
	cpy #$FC.b		; C0 FC
	brk $7C.b		; 00 7C
	bra  -4.b		; 80 FC
	bra   4.b		; 80 04
	bcc   3.b		; 90 03
	jmp $584F20.l		; 5C 20 4F 58
	adc [$FF.b]		; 67 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $F6.b		; 00 F6
	tas		; 1B
	adc [$03.b],Y		; 77 03
	lda $009F03.l,X		; BF 03 9F 00
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	beq  15.b		; F0 0F
	sbc $27830C.l,X		; FF 0C 83 27
	ora [$CA.b]		; 07 CA
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	sbc $008000.l,X		; FF 00 80 00
	ror $530D.w,X		; 7E 0D 53
	inc $03BC.w,X		; FE BC 03
	sbc $FF07.w,X		; FD 07 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $FFF32D.l,X		; 7F 2D F3 FF
	and $1DE2.w		; 2D E2 1D
	trb $00EB.w		; 1C EB 00
	brk $01.b		; 00 01
	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	ora [$FC.b],Y		; 17 FC
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $0000FF.l		; 0F FF 00 00
	beq -49.b		; F0 CF
	sbc $00C0C0.l,X		; FF C0 C0 00
	ora $2A.b,X		; 15 2A
	ldx $55.b		; A6 55
	bvc -88.b		; 50 A8
	brk $FF.b		; 00 FF
	sbc $404000.l,X		; FF 00 40 40
	lda $3FC080.l,X		; BF 80 C0 3F
	and $FFFBFF.l,X		; 3F FF FB FF
	sbc $B3CCFF.l,X		; FF FF CC B3
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc ($03.b,S),Y		; F3 03
	brk $00.b		; 00 00
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $B5.b,X		; 55 B5
	tax		; AA
	jmp $FFFF.w		; 4C FF FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $9FFF5F.l,X		; FF 5F FF 9F
	adc $1D03.w,X		; 7D 03 1D
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	plb		; AB
	mvn $AB,$55		; 54 55 AB
	.db $82, $FF, $FA		; 82 FF FA
	ora [$7F.b]		; 07 7F
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra -64.b		; 80 C0
	sbc $FFFFFE.l,X		; FF FE FF FF
	inc $9084.w,X		; FE 84 90
	sta $CC.b,S		; 83 CC
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	and $3F20C0.l,X		; 3F C0 20 3F
	cpy #$C0.b		; C0 C0
	and $8377F7.l		; 2F F7 77 83
	adc $00FF83.l,X		; 7F 83 FF 00
	brk $00.b		; 00 00
	sbc $C03F00.l,X		; FF 00 3F C0
	cpy #$3F.b		; C0 3F
	sbc [$18.b],Y		; F7 18
	bra  36.b		; 80 24
	brk $E8.b		; 00 E8
	bpl -56.b		; 10 C8
	pla		; 68
	tya		; 98
	jsr ($1C00.w,X)		; FC 00 1C
	cpx #$1C.b		; E0 1C
	brk $7C.b		; 00 7C
	ldy #$B8.b		; A0 B8
	brk $F4.b		; 00 F4
	brk $E4.b		; 00 E4
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $1C.b		; 00 1C
	cpx #$FC.b		; E0 FC
	cpy #$FB.b		; C0 FB
	asl $0AFF.w		; 0E FF 0A
	adc $007F00.l,X		; 7F 00 7F 00
	adc $80FF00.l,X		; 7F 00 FF 80
	cmp $BFBF5F.l,X		; DF 5F BF BF
	sbc $04FB04.l,X		; FF 04 FB 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	and $007F00.l,X		; 3F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$00.b		; E0 00
	sbc $DFAF3F.l,X		; FF 3F AF DF
	bne -17.b		; D0 EF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00DF00.l,X		; FF 00 DF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  15.b		; F0 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFC00.l,X		; FF 00 FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sbc $12F312.l,X		; FF 12 F3 12
	sbc ($12.b,S),Y		; F3 12
	sbc ($F2.b,S),Y		; F3 F2
	brk $E9.b		; 00 E9
	brk $76.b		; 00 76
	brk $80.b		; 00 80
	cpy #$FF.b		; C0 FF
	sbc $F30CF3.l,X		; FF F3 0C F3
	tsb $0CF3.w		; 0C F3 0C
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $00FF1F.l,X		; FF 1F FF 00
	sbc $CC3C00.l,X		; FF 00 3C CC
	and $C03FC0.l		; 2F C0 3F C0
	jmp $2900.w		; 4C 00 29
	ora $D3.b,S		; 03 D3
	ora [$0C.b]		; 07 0C
	ora $FBF8.w,X		; 1D F8 FB
	sbc $00.b,S		; E3 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $03FDF0.l,X		; FF F0 FD 03
	xce		; FB
	ora [$3F.b]		; 07 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sed		; F8
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $D0DF00.l,X		; 1F 00 DF D0
	ora [$AF.b],Y		; 17 AF
	and $00FFDF.l		; 2F DF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0BF00.l		; EF 00 BF C0
	sbc $C07CC0.l,X		; FF C0 7C C0
	jsr ($F840.w,X)		; FC 40 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	tsb $F0.b		; 04 F0
	tsb $EC.b		; 04 EC
	inx		; E8
	pea $FCF4.w		; F4 F4 FC
	bra 124.b		; 80 7C
	bra  -4.b		; 80 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $009F1F.l,X		; 7F 1F 9F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra -97.b		; 80 9F
	cpx #$00.b		; E0 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	ora $F8.b		; 05 F8
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $3F.b		; 00 3F
	rti		; 40

	adc ($03.b,S),Y		; 73 03
	jsr $FFFF.w		; 20 FF FF
	jsr $20E0.w		; 20 E0 20
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $C0.b		; 00 C0
	adc $334000.l,X		; 7F 00 40 33
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0020C0.l,X		; FF C0 20 00
	sbc $C0C000.l,X		; FF 00 C0 C0
	bra  64.b		; 80 40
	cpy #$00.b		; C0 00
	bra -32.b		; 80 E0
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	cpy #$00.b		; C0 00
	rti		; 40

	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rts		; 60

	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	rts		; 60

	rts		; 60

	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc $F707.w,Y		; F9 07 F7
	sbc $F7FFF9.l,X		; FF F9 FF F7
	sbc $000400.l,X		; FF 00 04 00
	brk $01.b		; 00 01
	brk $F7.b		; 00 F7
	sbc $000401.l,X		; FF 01 04 00
	brk $F9.b		; 00 F9
	sbc $02FFFF.l,X		; FF FF FF 02
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	sbc $000402.l,X		; FF 02 04 00
	brk $1F.b		; 00 1F
	rts		; 60

	jmp $FF1000.l		; 5C 00 10 FF
	adc $105A90.l,X		; 7F 90 5A 10
	beq -112.b		; F0 90
	adc $807FFF.l,X		; 7F FF 7F 80
	adc $1C4000.l,X		; 7F 00 40 1C
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $607F00.l,X		; FF 00 7F 60
	bpl   0.b		; 10 00
	sbc $0CF000.l,X		; FF 00 F0 0C
	stz $60.b,X		; 74 60
	bpl  -2.b		; 10 FE
	jsr ($B412.w,X)		; FC 12 B4
	bpl  30.b		; 10 1E
	ora ($FC.b)		; 12 FC
	inc $02FC.w,X		; FE FC 02
	jsr ($4400.w,X)		; FC 00 44
	bvs  -2.b		; 70 FE
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	tsb $0010.w		; 0C 10 00
	inc $0000.w,X		; FE 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	ora $01.b,S		; 03 01
	bit $2C02.w		; 2C 02 2C
	ora $2C.b,S		; 03 2C
	tsb $2C.b		; 04 2C
	ora $2C.b		; 05 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	asl $2C.b		; 06 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	ora ($2C.b,X)		; 01 2C
	ora [$2C.b]		; 07 2C
	php		; 08
	bit $2C09.w		; 2C 09 2C
	ora #$2C.b		; 09 2C
	ora #$2C.b		; 09 2C
	ora #$2C.b		; 09 2C
	ora #$2C.b		; 09 2C
	ora #$2C.b		; 09 2C
	asl A		; 0A
	bit $2C0B.w		; 2C 0B 2C
	phd		; 0B
	bit $2C0B.w		; 2C 0B 2C
	phd		; 0B
	bit $2C0B.w		; 2C 0B 2C
	phd		; 0B
	bit $2C0C.w		; 2C 0C 2C
	ora #$2C.b		; 09 2C
	ora #$2C.b		; 09 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	asl $0F2C.w		; 0E 2C 0F
	bit $2C10.w		; 2C 10 2C
	ora ($2C.b),Y		; 11 2C
	ora ($2C.b)		; 12 2C
	ora ($2C.b,S),Y		; 13 2C
	trb $2C.b		; 14 2C
	ora $2C.b,X		; 15 2C
	asl $2C.b,X		; 16 2C
	ora [$2C.b],Y		; 17 2C
	clc		; 18
	bit $2C19.w		; 2C 19 2C
	inc A		; 1A
	bit $2C1B.w		; 2C 1B 2C
	trb $0D2C.w		; 1C 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $1E2C.w,X		; 1D 2C 1E
	bit $2000.w		; 2C 00 20
	brk $20.b		; 00 20
	ora $2C1D2C.l,X		; 1F 2C 1D 2C
	ora $1D2C.w,X		; 1D 2C 1D
	bit $2C1D.w		; 2C 1D 2C
	ora $1D2C.w,X		; 1D 2C 1D
	bit $2C1D.w		; 2C 1D 2C
	ora $202C.w,X		; 1D 2C 20
	bit $2C21.w		; 2C 21 2C
	jsl $2C222C.l		; 22 2C 22 2C
	jsl $2C222C.l		; 22 2C 22 2C
	jsl $2C222C.l		; 22 2C 22 2C
	jsl $2C232C.l		; 22 2C 23 2C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	and $6C.b,S		; 23 6C
	jsl $2C222C.l		; 22 2C 22 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	and $2C.b		; 25 2C
	rol $2C.b		; 26 2C
	and [$2C.b]		; 27 2C
	plp		; 28
	bit $2C29.w		; 2C 29 2C
	rol A		; 2A
	bit $2C2B.w		; 2C 2B 2C
	bit $2D2C.w		; 2C 2C 2D
	bit $2C2E.w		; 2C 2E 2C
	and $2C302C.l		; 2F 2C 30 2C
	and ($2C.b),Y		; 31 2C
	and ($2C.b)		; 32 2C
	and ($2C.b,S),Y		; 33 2C
	bit $2C.b,X		; 34 2C
	and $2C.b,X		; 35 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	rol $2C.b,X		; 36 2C
	and [$2C.b],Y		; 37 2C
	sec		; 38
	bit $2C39.w		; 2C 39 2C
	dec A		; 3A
	bit $2C36.w		; 2C 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	tsa		; 3B
	bit $2C3C.w		; 2C 3C 2C
	bit $3C2C.w,X		; 3C 2C 3C
	bit $2C3C.w		; 2C 3C 2C
	bit $3C2C.w,X		; 3C 2C 3C
	bit $6C3B.w		; 2C 3B 6C
	rol $2C.b,X		; 36 2C
	rol $2C.b,X		; 36 2C
	and $3E2C.w,X		; 3D 2C 3E
	bit $2C3F.w		; 2C 3F 2C
	rti		; 40

	bit $2C41.w		; 2C 41 2C
	.db $42, $2C		; 42 2C
	eor $2C.b,S		; 43 2C
	mvp $45,$2C		; 44 2C 45
	bit $2C46.w		; 2C 46 2C
	eor [$2C.b]		; 47 2C
	pha		; 48
	bit $2C49.w		; 2C 49 2C
	lsr A		; 4A
	bit $2C4B.w		; 2C 4B 2C
	jmp $4D2C.w		; 4C 2C 4D
	bit $2C4E.w		; 2C 4E 2C
	eor $2C502C.l		; 4F 2C 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	mvn $50,$2C		; 54 2C 50
	bit $2C50.w		; 2C 50 2C
	bvc  44.b		; 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	eor $2C.b,X		; 55 2C
	lsr $2C.b,X		; 56 2C
	eor [$2C.b],Y		; 57 2C
	cli		; 58
	bit $2C59.w		; 2C 59 2C
	phy		; 5A
	bit $2C5B.w		; 2C 5B 2C
	jmp $2C5D2C.l		; 5C 2C 5D 2C
	lsr $5F2C.w,X		; 5E 2C 5F
	bit $2C60.w		; 2C 60 2C
	adc ($2C.b,X)		; 61 2C
	.db $62, $2C, $63		; 62 2C 63
	bit $2C64.w		; 2C 64 2C
	adc $2C.b		; 65 2C
	ror $2C.b		; 66 2C
	adc [$2C.b]		; 67 2C
	pla		; 68
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($6D2C.w)		; 6C 2C 6D
	bit $2C6E.w		; 2C 6E 2C
	ror $6E2C.w		; 6E 2C 6E
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($002C.w)		; 6C 2C 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	adc $2C702C.l		; 6F 2C 70 2C
	adc ($2C.b),Y		; 71 2C
	adc ($2C.b)		; 72 2C
	adc ($2C.b,S),Y		; 73 2C
	stz $2C.b,X		; 74 2C
	adc $2C.b,X		; 75 2C
	ror $2C.b,X		; 76 2C
	adc [$2C.b],Y		; 77 2C
	sei		; 78
	bit $2C79.w		; 2C 79 2C
	ply		; 7A
	bit $2C7B.w		; 2C 7B 2C
	jmp ($7D2C.w,X)		; 7C 2C 7D
	bit $2C7E.w		; 2C 7E 2C
	adc $2C802C.l,X		; 7F 2C 80 2C
	sta ($2C.b,X)		; 81 2C
	.db $82, $2C, $83		; 82 2C 83
	bit $2C84.w		; 2C 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sty $2C.b		; 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	sta [$2C.b]		; 87 2C
	dey		; 88
	bit $2C89.w		; 2C 89 2C
	txa		; 8A
	bit $2C8B.w		; 2C 8B 2C
	sty $8D2C.w		; 8C 2C 8D
	bit $2C8E.w		; 2C 8E 2C
	sta $2C902C.l		; 8F 2C 90 2C
	sta ($2C.b),Y		; 91 2C
	sta ($2C.b)		; 92 2C
	jmp ($932C.w,X)		; 7C 2C 93
	bit $2C94.w		; 2C 94 2C
	sta $2C.b,X		; 95 2C
	stx $2C.b,Y		; 96 2C
	sta [$2C.b],Y		; 97 2C
	tya		; 98
	bit $2C99.w		; 2C 99 2C
	txs		; 9A
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	stz $9D2C.w		; 9C 2C 9D
	bit $2C9E.w		; 2C 9E 2C
	sta $2CA02C.l,X		; 9F 2C A0 2C
	lda ($2C.b,X)		; A1 2C
	ldx #$2C.b		; A2 2C
	jmp ($A32C.w,X)		; 7C 2C A3
	bit $2CA4.w		; 2C A4 2C
	lda $2C.b		; A5 2C
	ldx $2C.b		; A6 2C
	lda [$2C.b]		; A7 2C
	tay		; A8
	bit $2CA9.w		; 2C A9 2C
	tax		; AA
	bit $2CAB.w		; 2C AB 2C
	ldy $AD2C.w		; AC 2C AD
	bit $2CAE.w		; 2C AE 2C
	lda $2CB02C.l		; AF 2C B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	lda ($2C.b),Y		; B1 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b,S),Y		; B3 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ldy $2C.b,X		; B4 2C
	lda $2C.b,X		; B5 2C
	ldx $2C.b,Y		; B6 2C
	lda [$2C.b],Y		; B7 2C
	clv		; B8
	bit $2CB9.w		; 2C B9 2C
	tsx		; BA
	bit $2CBB.w		; 2C BB 2C
	ldy $BD2C.w,X		; BC 2C BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	plp		; 28
	cpy #$2C.b		; C0 2C
	cmp ($2C.b,X)		; C1 2C
.ACCU 16
	rep #$2C		; C2 2C
	cmp $2C.b,S		; C3 2C
	cpy $2C.b		; C4 2C
	cmp $2C.b		; C5 2C
	dec $2C.b		; C6 2C
	cmp [$2C.b]		; C7 2C
	iny		; C8
	bit $2CC9.w		; 2C C9 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2CC9.w		; 2C C9 2C
	dex		; CA
	bit $2CCB.w		; 2C CB 2C
	cpy $CD2C.w		; CC 2C CD
	bit $2CCE.w		; 2C CE 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2000.w		; 2C 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cmp $2CD02C.l		; CF 2C D0 2C
	cmp ($2C.b),Y		; D1 2C
	cmp ($2C.b)		; D2 2C
	cmp ($2C.b,S),Y		; D3 2C
	pei ($2C.b)		; D4 2C
	cmp $2C.b,X		; D5 2C
	dec $2C.b,X		; D6 2C
	cmp [$2C.b],Y		; D7 2C
	cld		; D8
	plp		; 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	stp		; DB
	bit $2CDC.w		; 2C DC 2C
	cmp $7C2C.w,X		; DD 2C 7C
	bit $2CDE.w		; 2C DE 2C
	cmp $2CE02C.l,X		; DF 2C E0 2C
	sbc ($2C.b,X)		; E1 2C
.ACCU 8
	sep #$2C		; E2 2C
	sbc $2C.b,S		; E3 2C
	cpx $2C.b		; E4 2C
	sbc $2C.b		; E5 2C
	inc $2C.b		; E6 2C
	sbc [$2C.b]		; E7 2C
	inx		; E8
	bit $2CE9.w		; 2C E9 2C
	nop		; EA
	bit $6CE7.w		; 2C E7 6C
	inc $6C.b		; E6 6C
	sbc $6C.b		; E5 6C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	xba		; EB
	bit $2CEC.w		; 2C EC 2C
	sbc $EE2C.w		; ED 2C EE
	bit $2CEF.w		; 2C EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	beq  44.b		; F0 2C
	sbc ($2C.b),Y		; F1 2C
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	bit $2C7C.w		; 2C 7C 2C
	inc $2C.b,X		; F6 2C
	sbc [$2C.b],Y		; F7 2C
	sed		; F8
	bit $2CF9.w		; 2C F9 2C
	plx		; FA
	bit $2CFB.w		; 2C FB 2C
	jsr ($FD2C.w,X)		; FC 2C FD
	bit $2CFE.w		; 2C FE 2C
	sbc $2D002C.l,X		; FF 2C 00 2D
	ora ($2D.b,X)		; 01 2D
	cop $2D.b		; 02 2D
	ora $2D.b,S		; 03 2D
	tsb $2D.b		; 04 2D
	ora ($6D.b,X)		; 01 6D
	brk $6D.b		; 00 6D
	sbc $20006C.l,X		; FF 6C 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora $2D.b		; 05 2D
	asl $2D.b		; 06 2D
	ora [$2D.b]		; 07 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2D082C.l		; EF 2C 08 2D
	ora #$2D.b		; 09 2D
	asl A		; 0A
	and $290B.w		; 2D 0B 29
	tsb $0D29.w		; 0C 29 0D
	and #$0E.b		; 29 0E
	and $2D0F.w		; 2D 0F 2D
	bpl  45.b		; 10 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2D112C.l		; EF 2C 11 2D
	xce		; FB
	bit $2D12.w		; 2C 12 2D
	ora ($2D.b,S),Y		; 13 2D
	trb $2D.b		; 14 2D
	ora $2D.b,X		; 15 2D
	asl $2D.b,X		; 16 2D
	ora [$2D.b],Y		; 17 2D
	clc		; 18
	and $2D18.w		; 2D 18 2D
	ora $172D.w,Y		; 19 2D 17
	adc $6D16.w		; 6D 16 6D
	ora $6D.b,X		; 15 6D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	inc A		; 1A
	and $2D06.w		; 2D 06 2D
	tas		; 1B
	and $2D1C.w		; 2D 1C 2D
	ora $1E2D.w,X		; 1D 2D 1E
	and $2D1F.w		; 2D 1F 2D
	jmp ($202C.w,X)		; 7C 2C 20
	and $2921.w		; 2D 21 29
	jsl $292329.l		; 22 29 23 29
	bit $2D.b		; 24 2D
	and $2D.b		; 25 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	ora ($2D.b),Y		; 11 2D
	rol $2D.b		; 26 2D
	and [$2D.b]		; 27 2D
	plp		; 28
	and $2D29.w		; 2D 29 2D
	rol A		; 2A
	and $2D2B.w		; 2D 2B 2D
	bit $2D2D.w		; 2C 2D 2D
	and $2D2E.w		; 2D 2E 2D
	and $6D2C2D.l		; 2F 2D 2C 6D
	pld		; 2B
	adc $6D2A.w		; 6D 2A 6D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	bmi  45.b		; 30 2D
	asl $2D.b		; 06 2D
	and ($2D.b),Y		; 31 2D
	jmp ($7C2C.w,X)		; 7C 2C 7C
	bit $2C7C.w		; 2C 7C 2C
	jmp ($322C.w,X)		; 7C 2C 32
	and $2D33.w		; 2D 33 2D
	bit $2D.b,X		; 34 2D
	and $2D.b,X		; 35 2D
	rol $2D.b,X		; 36 2D
	and [$2D.b],Y		; 37 2D
	sec		; 38
	and $2CEF.w		; 2D EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2D392C.l		; EF 2C 39 2D
	dec A		; 3A
	and $2D3B.w		; 2D 3B 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2000.w		; 2D 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	asl $0F2C.w		; 0E 2C 0F
	bit $2C10.w		; 2C 10 2C
	ora ($2C.b),Y		; 11 2C
	ora ($2C.b)		; 12 2C
	ora ($2C.b,S),Y		; 13 2C
	trb $2C.b		; 14 2C
	ora $2C.b,X		; 15 2C
	asl $2C.b,X		; 16 2C
	ora [$2C.b],Y		; 17 2C
	clc		; 18
	bit $2C19.w		; 2C 19 2C
	inc A		; 1A
	bit $2C1B.w		; 2C 1B 2C
	trb $0D2C.w		; 1C 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	asl $0F2C.w		; 0E 2C 0F
	bit $2C10.w		; 2C 10 2C
	ora ($2C.b),Y		; 11 2C
	ora ($2C.b)		; 12 2C
	ora ($2C.b,S),Y		; 13 2C
	trb $2C.b		; 14 2C
	ora $2C.b,X		; 15 2C
	asl $2C.b,X		; 16 2C
	ora [$2C.b],Y		; 17 2C
	clc		; 18
	bit $2C19.w		; 2C 19 2C
	inc A		; 1A
	bit $2C1B.w		; 2C 1B 2C
	trb $0D2C.w		; 1C 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	ora $0D2C.w		; 0D 2C 0D
	bit $2C0D.w		; 2C 0D 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	and $2C.b		; 25 2C
	rol $2C.b		; 26 2C
	and [$2C.b]		; 27 2C
	plp		; 28
	bit $2C29.w		; 2C 29 2C
	rol A		; 2A
	bit $2C2B.w		; 2C 2B 2C
	bit $2D2C.w		; 2C 2C 2D
	bit $2C2E.w		; 2C 2E 2C
	and $2C302C.l		; 2F 2C 30 2C
	and ($2C.b),Y		; 31 2C
	and ($2C.b)		; 32 2C
	and ($2C.b,S),Y		; 33 2C
	bit $2C.b,X		; 34 2C
	and $2C.b,X		; 35 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	and $2C.b		; 25 2C
	rol $2C.b		; 26 2C
	and [$2C.b]		; 27 2C
	plp		; 28
	bit $2C29.w		; 2C 29 2C
	rol A		; 2A
	bit $2C2B.w		; 2C 2B 2C
	bit $2D2C.w		; 2C 2C 2D
	bit $2C2E.w		; 2C 2E 2C
	and $2C302C.l		; 2F 2C 30 2C
	and ($2C.b),Y		; 31 2C
	and ($2C.b)		; 32 2C
	and ($2C.b,S),Y		; 33 2C
	bit $2C.b,X		; 34 2C
	and $2C.b,X		; 35 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	bit $2C.b		; 24 2C
	and $3E2C.w,X		; 3D 2C 3E
	bit $2C3F.w		; 2C 3F 2C
	rti		; 40

	bit $2C41.w		; 2C 41 2C
	.db $42, $2C		; 42 2C
	eor $2C.b,S		; 43 2C
	mvp $45,$2C		; 44 2C 45
	bit $2C46.w		; 2C 46 2C
	eor [$2C.b]		; 47 2C
	pha		; 48
	bit $2C49.w		; 2C 49 2C
	lsr A		; 4A
	bit $2C4B.w		; 2C 4B 2C
	jmp $4D2C.w		; 4C 2C 4D
	bit $2C4E.w		; 2C 4E 2C
	eor $2C502C.l		; 4F 2C 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	mvn $50,$2C		; 54 2C 50
	bit $2C50.w		; 2C 50 2C
	bvc  44.b		; 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	and $3E2C.w,X		; 3D 2C 3E
	bit $2C3F.w		; 2C 3F 2C
	rti		; 40

	bit $2C41.w		; 2C 41 2C
	.db $42, $2C		; 42 2C
	eor $2C.b,S		; 43 2C
	mvp $45,$2C		; 44 2C 45
	bit $2C46.w		; 2C 46 2C
	eor [$2C.b]		; 47 2C
	pha		; 48
	bit $2C49.w		; 2C 49 2C
	lsr A		; 4A
	bit $2C4B.w		; 2C 4B 2C
	jmp $4D2C.w		; 4C 2C 4D
	bit $2C4E.w		; 2C 4E 2C
	eor $2C502C.l		; 4F 2C 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	mvn $50,$2C		; 54 2C 50
	bit $2C50.w		; 2C 50 2C
	bvc  44.b		; 50 2C
	bvc  44.b		; 50 2C
	eor ($2C.b),Y		; 51 2C
	eor ($2C.b)		; 52 2C
	eor ($2C.b,S),Y		; 53 2C
	eor $2C.b,X		; 55 2C
	lsr $2C.b,X		; 56 2C
	eor [$2C.b],Y		; 57 2C
	cli		; 58
	bit $2C59.w		; 2C 59 2C
	phy		; 5A
	bit $2C5B.w		; 2C 5B 2C
	jmp $2C5D2C.l		; 5C 2C 5D 2C
	lsr $5F2C.w,X		; 5E 2C 5F
	bit $2C60.w		; 2C 60 2C
	adc ($2C.b,X)		; 61 2C
	.db $62, $2C, $63		; 62 2C 63
	bit $2C64.w		; 2C 64 2C
	adc $2C.b		; 65 2C
	ror $2C.b		; 66 2C
	adc [$2C.b]		; 67 2C
	pla		; 68
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($6D2C.w)		; 6C 2C 6D
	bit $2C6E.w		; 2C 6E 2C
	ror $6E2C.w		; 6E 2C 6E
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($552C.w)		; 6C 2C 55
	bit $2C56.w		; 2C 56 2C
	eor [$2C.b],Y		; 57 2C
	cli		; 58
	bit $2C59.w		; 2C 59 2C
	phy		; 5A
	bit $2C5B.w		; 2C 5B 2C
	jmp $2C5D2C.l		; 5C 2C 5D 2C
	lsr $5F2C.w,X		; 5E 2C 5F
	bit $2C60.w		; 2C 60 2C
	adc ($2C.b,X)		; 61 2C
	.db $62, $2C, $63		; 62 2C 63
	bit $2C64.w		; 2C 64 2C
	adc $2C.b		; 65 2C
	ror $2C.b		; 66 2C
	adc [$2C.b]		; 67 2C
	pla		; 68
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($6D2C.w)		; 6C 2C 6D
	bit $2C6E.w		; 2C 6E 2C
	ror $6E2C.w		; 6E 2C 6E
	bit $2C69.w		; 2C 69 2C
	ror A		; 6A
	bit $2C6B.w		; 2C 6B 2C
	jmp ($6F2C.w)		; 6C 2C 6F
	bit $2C70.w		; 2C 70 2C
	adc ($2C.b),Y		; 71 2C
	adc ($2C.b)		; 72 2C
	adc ($2C.b,S),Y		; 73 2C
	stz $2C.b,X		; 74 2C
	adc $2C.b,X		; 75 2C
	ror $2C.b,X		; 76 2C
	adc [$2C.b],Y		; 77 2C
	sei		; 78
	bit $2C79.w		; 2C 79 2C
	ply		; 7A
	bit $2C7B.w		; 2C 7B 2C
	jmp ($7D2C.w,X)		; 7C 2C 7D
	bit $2C7E.w		; 2C 7E 2C
	adc $2C802C.l,X		; 7F 2C 80 2C
	sta ($2C.b,X)		; 81 2C
	.db $82, $2C, $83		; 82 2C 83
	bit $2C84.w		; 2C 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sty $2C.b		; 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	adc $2C702C.l		; 6F 2C 70 2C
	adc ($2C.b),Y		; 71 2C
	adc ($2C.b)		; 72 2C
	adc ($2C.b,S),Y		; 73 2C
	stz $2C.b,X		; 74 2C
	adc $2C.b,X		; 75 2C
	ror $2C.b,X		; 76 2C
	adc [$2C.b],Y		; 77 2C
	sei		; 78
	bit $2C79.w		; 2C 79 2C
	ply		; 7A
	bit $2C7B.w		; 2C 7B 2C
	jmp ($7D2C.w,X)		; 7C 2C 7D
	bit $2C7E.w		; 2C 7E 2C
	adc $2C802C.l,X		; 7F 2C 80 2C
	sta ($2C.b,X)		; 81 2C
	.db $82, $2C, $83		; 82 2C 83
	bit $2C84.w		; 2C 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sta $2C.b,S		; 83 2C
	sty $2C.b		; 84 2C
	sta $2C.b		; 85 2C
	stx $2C.b		; 86 2C
	sta [$2C.b]		; 87 2C
	dey		; 88
	bit $2C89.w		; 2C 89 2C
	txa		; 8A
	bit $2C8B.w		; 2C 8B 2C
	sty $8D2C.w		; 8C 2C 8D
	bit $2C8E.w		; 2C 8E 2C
	sta $2C902C.l		; 8F 2C 90 2C
	sta ($2C.b),Y		; 91 2C
	sta ($2C.b)		; 92 2C
	jmp ($932C.w,X)		; 7C 2C 93
	bit $2C94.w		; 2C 94 2C
	sta $2C.b,X		; 95 2C
	rol $3F2D.w,X		; 3E 2D 3F
	and $2C98.w		; 2D 98 2C
	sta $9A2C.w,Y		; 99 2C 9A
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	sta [$2C.b]		; 87 2C
	dey		; 88
	bit $2C89.w		; 2C 89 2C
	eor ($2D.b,X)		; 41 2D
	.db $42, $2D		; 42 2D
	sty $8D2C.w		; 8C 2C 8D
	bit $2C8E.w		; 2C 8E 2C
	sta $2C902C.l		; 8F 2C 90 2C
	sta ($2C.b),Y		; 91 2C
	sta ($2C.b)		; 92 2C
	jmp ($932C.w,X)		; 7C 2C 93
	bit $2C94.w		; 2C 94 2C
	sta $2C.b,X		; 95 2C
	rol $3F2D.w,X		; 3E 2D 3F
	and $2C98.w		; 2D 98 2C
	sta $9A2C.w,Y		; 99 2C 9A
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	txy		; 9B
	bit $2C9B.w		; 2C 9B 2C
	stz $9D2C.w		; 9C 2C 9D
	bit $2C9E.w		; 2C 9E 2C
	sta $2CA02C.l,X		; 9F 2C A0 2C
	lda ($2C.b,X)		; A1 2C
	ldx #$2C.b		; A2 2C
	jmp ($A32C.w,X)		; 7C 2C A3
	bit $2CA4.w		; 2C A4 2C
	lda $2C.b		; A5 2C
	ldx $2C.b		; A6 2C
	lda [$2C.b]		; A7 2C
	tay		; A8
	bit $2CA9.w		; 2C A9 2C
	tax		; AA
	bit $2D43.w		; 2C 43 2D
	mvp $AD,$2D		; 44 2D AD
	bit $2CAE.w		; 2C AE 2C
	lda $2CB02C.l		; AF 2C B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	lda ($2C.b),Y		; B1 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b,S),Y		; B3 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	stz $9D2C.w		; 9C 2C 9D
	bit $2D45.w		; 2C 45 2D
	lsr $2D.b		; 46 2D
	eor [$2D.b]		; 47 2D
	lda ($2C.b,X)		; A1 2C
	ldx #$2C.b		; A2 2C
	jmp ($A32C.w,X)		; 7C 2C A3
	bit $2CA4.w		; 2C A4 2C
	lda $2C.b		; A5 2C
	ldx $2C.b		; A6 2C
	lda [$2C.b]		; A7 2C
	tay		; A8
	bit $2CA9.w		; 2C A9 2C
	tax		; AA
	bit $2D43.w		; 2C 43 2D
	mvp $AD,$2D		; 44 2D AD
	bit $2CAE.w		; 2C AE 2C
	lda $2CB02C.l		; AF 2C B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	lda ($2C.b),Y		; B1 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b)		; B2 2C
	lda ($2C.b,S),Y		; B3 2C
	bcs  44.b		; B0 2C
	bcs  44.b		; B0 2C
	ldy $2C.b,X		; B4 2C
	lda $2C.b,X		; B5 2C
	ldx $2C.b,Y		; B6 2C
	lda [$2C.b],Y		; B7 2C
	clv		; B8
	bit $2CB9.w		; 2C B9 2C
	tsx		; BA
	bit $2CBB.w		; 2C BB 2C
	ldy $BD2C.w,X		; BC 2C BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	plp		; 28
	cpy #$2C.b		; C0 2C
	cmp ($2C.b,X)		; C1 2C
.ACCU 16
	rep #$2C		; C2 2C
	pha		; 48
	and $2D49.w		; 2D 49 2D
	lsr A		; 4A
	and $2D4B.w		; 2D 4B 2D
	cmp [$2C.b]		; C7 2C
	iny		; C8
	bit $2CC9.w		; 2C C9 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2CC9.w		; 2C C9 2C
	dex		; CA
	bit $2CCB.w		; 2C CB 2C
	cpy $CD2C.w		; CC 2C CD
	bit $2CCE.w		; 2C CE 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2CB4.w		; 2C B4 2C
	lda $2C.b,X		; B5 2C
	jmp $4D2D.w		; 4C 2D 4D
	and $2D4E.w		; 2D 4E 2D
	eor $2D502D.l		; 4F 2D 50 2D
	tyx		; BB
	bit $2CBC.w		; 2C BC 2C
	lda $BE28.w,X		; BD 28 BE
	plp		; 28
	lda $2CC028.l,X		; BF 28 C0 2C
	cmp ($2C.b,X)		; C1 2C
.ACCU 16
	rep #$2C		; C2 2C
	pha		; 48
	and $2D49.w		; 2D 49 2D
	lsr A		; 4A
	and $2D4B.w		; 2D 4B 2D
	cmp [$2C.b]		; C7 2C
	iny		; C8
	bit $2CC9.w		; 2C C9 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2CC9.w		; 2C C9 2C
	dex		; CA
	bit $2CCB.w		; 2C CB 2C
	cpy $CD2C.w		; CC 2C CD
	bit $2CCE.w		; 2C CE 2C
	cmp #$C92C.w		; C9 2C C9
	bit $2CCF.w		; 2C CF 2C
	bne  44.b		; D0 2C
	eor ($2D.b),Y		; 51 2D
	eor ($2D.b)		; 52 2D
	cmp ($2C.b,S),Y		; D3 2C
	pei ($2C.b)		; D4 2C
	cmp $2C.b,X		; D5 2C
	dec $2C.b,X		; D6 2C
	eor ($2D.b,S),Y		; 53 2D
	mvn $55,$29		; 54 29 55
	and #$6954.w		; 29 54 69
	lsr $2D.b,X		; 56 2D
	eor [$2D.b],Y		; 57 2D
	sbc $2D582C.l		; EF 2C 58 2D
	eor $5A2D.w,Y		; 59 2D 5A
	and $2D5B.w		; 2D 5B 2D
	sbc ($2C.b,X)		; E1 2C
.ACCU 8
	sep #$2C		; E2 2C
	sbc $2C.b,S		; E3 2C
	cpx $2C.b		; E4 2C
	sbc $2C.b		; E5 2C
	inc $2C.b		; E6 2C
	sbc [$2C.b]		; E7 2C
	inx		; E8
	bit $2CE9.w		; 2C E9 2C
	nop		; EA
	bit $6CE7.w		; 2C E7 6C
	inc $6C.b		; E6 6C
	sbc $6C.b		; E5 6C
	cmp $2CD02C.l		; CF 2C D0 2C
	jmp $2D5D2D.l		; 5C 2D 5D 2D
	eor $7C6D.w,X		; 5D 6D 7C
	bit $2D5E.w		; 2C 5E 2D
	eor $2D602D.l,X		; 5F 2D 60 2D
	adc ($29.b,X)		; 61 29
	.db $62, $29, $63		; 62 29 63
	and #$64.b		; 29 64
	and $2D57.w		; 2D 57 2D
	sbc $2D582C.l		; EF 2C 58 2D
	eor $652D.w,Y		; 59 2D 65
	and $2D66.w		; 2D 66 2D
	sbc ($2C.b,X)		; E1 2C
.ACCU 8
	sep #$2C		; E2 2C
	sbc $2C.b,S		; E3 2C
	cpx $2C.b		; E4 2C
	sbc $2C.b		; E5 2C
	inc $2C.b		; E6 2C
	sbc [$2C.b]		; E7 2C
	inx		; E8
	bit $2CE9.w		; 2C E9 2C
	nop		; EA
	bit $6CE7.w		; 2C E7 6C
	inc $6C.b		; E6 6C
	sbc $6C.b		; E5 6C
	xba		; EB
	bit $2D06.w		; 2C 06 2D
	adc [$2D.b]		; 67 2D
	pla		; 68
	and $2D69.w		; 2D 69 2D
	ror A		; 6A
	and $2D6B.w		; 2D 6B 2D
	jmp ($6D2D.w)		; 6C 2D 6D
	and $296E.w		; 2D 6E 29
	adc $297029.l		; 6F 29 70 29
	adc ($2D.b),Y		; 71 2D
	adc ($2D.b)		; 72 2D
	adc ($2D.b,S),Y		; 73 2D
	stz $2D.b,X		; 74 2D
	adc $2D.b,X		; 75 2D
	ror $2D.b,X		; 76 2D
	adc [$2D.b],Y		; 77 2D
	xce		; FB
	bit $2CFC.w		; 2C FC 2C
	sbc $FE2C.w,X		; FD 2C FE
	bit $2CFF.w		; 2C FF 2C
	brk $2D.b		; 00 2D
	ora ($2D.b,X)		; 01 2D
	cop $2D.b		; 02 2D
	ora $2D.b,S		; 03 2D
	tsb $2D.b		; 04 2D
	ora ($6D.b,X)		; 01 6D
	brk $6D.b		; 00 6D
	sbc $2CEB6C.l,X		; FF 6C EB 2C
	asl $2D.b		; 06 2D
	sei		; 78
	and $2D79.w		; 2D 79 2D
	ply		; 7A
	and $6CF7.w		; 2D F7 6C
	tda		; 7B
	and $2C7C.w		; 2D 7C 2C
	jmp ($7C2C.w,X)		; 7C 2C 7C
	and #$7D.b		; 29 7D
	and #$7E.b		; 29 7E
	and #$7F.b		; 29 7F
	and $2D80.w		; 2D 80 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	sta ($2D.b,X)		; 81 2D
	xce		; FB
	bit $2CFC.w		; 2C FC 2C
	sbc $FE2C.w,X		; FD 2C FE
	bit $2CFF.w		; 2C FF 2C
	brk $2D.b		; 00 2D
	ora ($2D.b,X)		; 01 2D
	cop $2D.b		; 02 2D
	ora $2D.b,S		; 03 2D
	tsb $2D.b		; 04 2D
	ora ($6D.b,X)		; 01 6D
	brk $6D.b		; 00 6D
	sbc $2D056C.l,X		; FF 6C 05 2D
	.db $82, $2D, $83		; 82 2D 83
	and $2C7C.w		; 2D 7C 2C
	jmp ($7C2C.w,X)		; 7C 2C 7C
	bit $2C7C.w		; 2C 7C 2C
	jmp ($842C.w,X)		; 7C 2C 84
	and $290B.w		; 2D 0B 29
	tsb $0D29.w		; 0C 29 0D
	and #$85.b		; 29 85
	and $2C7C.w		; 2D 7C 2C
	jmp ($7C2C.w,X)		; 7C 2C 7C
	bit $2C7C.w		; 2C 7C 2C
	jmp ($862C.w,X)		; 7C 2C 86
	and $2CFB.w		; 2D FB 2C
	ora ($2D.b)		; 12 2D
	ora ($2D.b,S),Y		; 13 2D
	trb $2D.b		; 14 2D
	ora $2D.b,X		; 15 2D
	asl $2D.b,X		; 16 2D
	ora [$2D.b],Y		; 17 2D
	clc		; 18
	and $2D18.w		; 2D 18 2D
	ora $172D.w,Y		; 19 2D 17
	adc $6D16.w		; 6D 16 6D
	ora $6D.b,X		; 15 6D
	ora $2D.b		; 05 2D
	.db $82, $2D, $87		; 82 2D 87
	and $2CEF.w		; 2D EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	dey		; 88
	and $2D89.w		; 2D 89 2D
	txa		; 8A
	and $290B.w		; 2D 0B 29
	tsb $0D29.w		; 0C 29 0D
	and #$8B.b		; 29 8B
	and $2D8C.w		; 2D 8C 2D
	sta $EF2D.w		; 8D 2D EF
	bit $2CEF.w		; 2C EF 2C
	sbc $2D8E2C.l		; EF 2C 8E 2D
	xce		; FB
	bit $2D12.w		; 2C 12 2D
	ora ($2D.b,S),Y		; 13 2D
	trb $2D.b		; 14 2D
	ora $2D.b,X		; 15 2D
	asl $2D.b,X		; 16 2D
	ora [$2D.b],Y		; 17 2D
	clc		; 18
	and $2D18.w		; 2D 18 2D
	ora $172D.w,Y		; 19 2D 17
	adc $6D16.w		; 6D 16 6D
	ora $6D.b,X		; 15 6D
	inc A		; 1A
	and $2D06.w		; 2D 06 2D
	sta $2D902D.l		; 8F 2D 90 2D
	sta ($2D.b),Y		; 91 2D
	sta ($2D.b)		; 92 2D
	sta ($2D.b,S),Y		; 93 2D
	sty $2D.b,X		; 94 2D
	sta $2D.b,X		; 95 2D
	and ($29.b,X)		; 21 29
	jsl $292329.l		; 22 29 23 29
	stx $2D.b,Y		; 96 2D
	sta [$2D.b],Y		; 97 2D
	tya		; 98
	and $2D99.w		; 2D 99 2D
	txs		; 9A
	and $2D9B.w		; 2D 9B 2D
	stx $2D.b		; 86 2D
	rol $2D.b		; 26 2D
	and [$2D.b]		; 27 2D
	plp		; 28
	and $2D29.w		; 2D 29 2D
	rol A		; 2A
	and $2D2B.w		; 2D 2B 2D
	bit $2D2D.w		; 2C 2D 2D
	and $2D2E.w		; 2D 2E 2D
	and $6D2C2D.l		; 2F 2D 2C 6D
	pld		; 2B
	adc $6D2A.w		; 6D 2A 6D
	inc A		; 1A
	and $2D06.w		; 2D 06 2D
	sta [$2D.b]		; 87 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	stz $9D2D.w		; 9C 2D 9D
	and $2921.w		; 2D 21 29
	jsl $292329.l		; 22 29 23 29
	stz $7C2D.w,X		; 9E 2D 7C
	bit $2D9F.w		; 2C 9F 2D
	ldy #$2D.b		; A0 2D
	lda ($2D.b,X)		; A1 2D
	ldx #$2D.b		; A2 2D
	lda $2D.b,S		; A3 2D
	rol $2D.b		; 26 2D
	and [$2D.b]		; 27 2D
	plp		; 28
	and $2D29.w		; 2D 29 2D
	rol A		; 2A
	and $2D2B.w		; 2D 2B 2D
	bit $2D2D.w		; 2C 2D 2D
	and $2D2E.w		; 2D 2E 2D
	and $6D2C2D.l		; 2F 2D 2C 6D
	pld		; 2B
	adc $6D2A.w		; 6D 2A 6D
	bmi  45.b		; 30 2D
	asl $2D.b		; 06 2D
	ldy $2D.b		; A4 2D
	lda $2D.b		; A5 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $2DA62C.l		; EF 2C A6 2D
	lda [$2D.b]		; A7 2D
	tay		; A8
	and $2D35.w		; 2D 35 2D
	lda #$2D.b		; A9 2D
	tax		; AA
	and $2DAB.w		; 2D AB 2D
	sbc $2CEF2C.l		; EF 2C EF 2C
	sbc $6DA52C.l		; EF 2C A5 6D
	ldy $262D.w		; AC 2D 26
	and $2D3B.w		; 2D 3B 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D30.w		; 2D 30 2D
	asl $2D.b		; 06 2D
	lda $EF2D.w		; AD 2D EF
	bit $2CEF.w		; 2C EF 2C
	sbc $2CEF2C.l		; EF 2C EF 2C
	ldx $7C2D.w		; AE 2D 7C
	bit $2DAF.w		; 2C AF 2D
	and $2D.b,X		; 35 2D
	bcs  45.b		; B0 2D
	lda ($2D.b),Y		; B1 2D
	lda ($2D.b)		; B2 2D
	lda ($2D.b,S),Y		; B3 2D
	jmp ($7C2C.w,X)		; 7C 2C 7C
	bit $2C7C.w		; 2C 7C 2C
	ldy $2D.b,X		; B4 2D
	rol $2D.b		; 26 2D
	tsa		; 3B
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $3C2D.w,X		; 3C 2D 3C
	and $2D3C.w		; 2D 3C 2D
	bit $B52D.w,X		; 3C 2D B5
	and $2DB6.w		; 2D B6 2D
	brk $20.b		; 00 20
	lda [$2D.b],Y		; B7 2D
	ldx $2D.b,Y		; B6 2D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	clv		; B8
	and $2DB9.w		; 2D B9 2D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	clv		; B8
	and $2DBA.w		; 2D BA 2D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	clv		; B8
	and $2DBB.w		; 2D BB 2D
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $3C.b		; 00 3C
	rol $29.b		; 26 29
	and $779B4E.l		; 2F 4E 9B 77
	brk $00.b		; 00 00
	rol $29.b		; 26 29
.INDEX 16
	rep #$18		; C2 18
	.db $82, $09, $00		; 82 09 00
	brk $05.b		; 00 05
	cop $5F.b		; 02 5F
	adc $7D5F.w,X		; 7D 5F 7D
	brk $00.b		; 00 00
	ora $7D5F7C.l,X		; 1F 7C 5F 7D
	eor $00007D.l,X		; 5F 7D 00 00
	cpx #$E003.w		; E0 03 E0
	ora $E0.b,S		; 03 E0
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $7D.b,S		; 03 7D
	ora $8E.b,S		; 03 8E
	ora ($21.b,X)		; 01 21
	tsb $DE.b		; 04 DE
	tda		; 7B
	brk $00.b		; 00 00
	sty $10.b		; 84 10
	dec $18.b		; C6 18
	lsr A		; 4A
	and #$CE.b		; 29 CE
	and $5AD6.w,Y		; 39 D6 5A
	stx $02.b,Y		; 96 02
	tsb $1400.w		; 0C 00 14
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $210000.l,X		; 7F 00 00 21
	tsb $84.b		; 04 84
	bpl -58.b		; 10 C6
	clc		; 18
	lsr A		; 4A
	and #$8C.b		; 29 8C
	and ($CE.b),Y		; 31 CE
	and $4210.w,Y		; 39 10 42
	eor ($4A.b)		; 52 4A
	dec $5A.b,X		; D6 5A
	trb $9C00.w		; 1C 00 9C
	adc ($0C.b,S),Y		; 73 0C
	brk $14.b		; 00 14
	brk $14.b		; 00 14
	and ($00.b,X)		; 21 00
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
	brk $5F.b		; 00 5F
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	ora $01.b,S		; 03 01
	plp		; 28
	cop $28.b		; 02 28
	ora $28.b,S		; 03 28
	ora $28.b,S		; 03 28
	tsb $28.b		; 04 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	ora $28.b		; 05 28
	asl $28.b		; 06 28
	ora [$28.b]		; 07 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	ora #$28.b		; 09 28
	asl A		; 0A
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	plp		; 28
	asl A		; 0A
	pla		; 68
	tsb $0828.w		; 0C 28 08
	plp		; 28
	ora $0E28.w		; 0D 28 0E
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	ora $281028.l		; 0F 28 10 28
	ora ($28.b),Y		; 11 28
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	ora $1A28.w,Y		; 19 28 1A
	plp		; 28
	tas		; 1B
	plp		; 28
	trb $1D28.w		; 1C 28 1D
	plp		; 28
	asl $1E28.w,X		; 1E 28 1E
	plp		; 28
	asl $0E28.w,X		; 1E 28 0E
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	asl $0D28.w		; 0E 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $1F28.w		; 0D 28 1F
	plp		; 28
	jsr $0028.w		; 20 28 00
	jsr $2000.w		; 20 00 20
	and ($28.b,X)		; 21 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	ora $281F28.l,X		; 1F 28 1F 28
	jsl $282328.l		; 22 28 23 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	and $68.b,S		; 23 68
	bit $28.b		; 24 28
	ora $282528.l,X		; 1F 28 25 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	and $28.b,X		; 35 28
	rol $28.b,X		; 36 28
	and [$28.b],Y		; 37 28
	sec		; 38
	plp		; 28
	and $3A28.w,Y		; 39 28 3A
	plp		; 28
	tsa		; 3B
	plp		; 28
	bit $3D28.w,X		; 3C 28 3D
	plp		; 28
	rol $3F28.w,X		; 3E 28 3F
	plp		; 28
	rti		; 40

	plp		; 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $45,$28		; 44 28 45
	plp		; 28
	lsr $28.b		; 46 28
	eor [$28.b]		; 47 28
	pha		; 48
	plp		; 28
	eor #$28.b		; 49 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	eor $28.b		; 45 28
	lsr A		; 4A
	plp		; 28
	phk		; 4B
	plp		; 28
	jmp $4C28.w		; 4C 28 4C
	plp		; 28
	jmp $4C28.w		; 4C 28 4C
	plp		; 28
	jmp $4C28.w		; 4C 28 4C
	plp		; 28
	eor $4E28.w		; 4D 28 4E
	plp		; 28
	eor $28.b		; 45 28
	eor $285028.l		; 4F 28 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $55,$28		; 54 28 55
	plp		; 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	rts		; 60

	plp		; 28
	adc ($28.b,X)		; 61 28
	.db $62, $28, $63		; 62 28 63
	plp		; 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $0028.w		; 6E 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	adc $287028.l		; 6F 28 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	adc ($28.b,S),Y		; 73 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$28.b]		; 87 28
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	phb		; 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $0028.w		; 8E 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	sta $289028.l		; 8F 28 90 28
	sta ($28.b),Y		; 91 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	ldx #$A328.w		; A2 28 A3
	plp		; 28
	ldy $28.b		; A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	lda [$28.b]		; A7 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	ldy $AD28.w		; AC 28 AD
	plp		; 28
	ldx $0028.w		; AE 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	lda $28B028.l		; AF 28 B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	plp		; 28
	cpy #$C128.w		; C0 28 C1
	plp		; 28
.ACCU 16
	rep #$28		; C2 28
	cmp $28.b,S		; C3 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	iny		; C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	bne  40.b		; D0 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b)		; D2 28
	cmp ($28.b,S),Y		; D3 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	adc ($28.b)		; 72 28
	stp		; DB
	plp		; 28
	jmp.w [$DD28]		; DC 28 DD
	plp		; 28
	dec $DF28.w,X		; DE 28 DF
	plp		; 28
	cpx #$E128.w		; E0 28 E1
	plp		; 28
.ACCU 8
	sep #$28		; E2 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	sbc #$28.b		; E9 28
	nop		; EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $ED28.w		; EC 28 ED
	plp		; 28
	inc $EF28.w		; EE 28 EF
	plp		; 28
	beq  40.b		; F0 28
	sbc ($28.b),Y		; F1 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sbc $FA28.w,Y		; F9 28 FA
	plp		; 28
	xce		; FB
	plp		; 28
	jsr ($FD28.w,X)		; FC 28 FD
	plp		; 28
	inc $FF28.w,X		; FE 28 FF
	plp		; 28
	brk $29.b		; 00 29
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora #$29.b		; 09 29
	asl A		; 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$0D.b		; 29 0D
	and #$0E.b		; 29 0E
	and #$0F.b		; 29 0F
	and #$10.b		; 29 10
	and #$72.b		; 29 72
	plp		; 28
	adc ($28.b)		; 72 28
	ora ($29.b),Y		; 11 29
	ora ($29.b)		; 12 29
	ora ($29.b,S),Y		; 13 29
	trb $29.b		; 14 29
	ora $29.b,X		; 15 29
	asl $29.b,X		; 16 29
	ora [$29.b],Y		; 17 29
	clc		; 18
	and #$19.b		; 29 19
	and #$1A.b		; 29 1A
	and #$1B.b		; 29 1B
	and #$1C.b		; 29 1C
	and #$1D.b		; 29 1D
	and #$1E.b		; 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$22.b		; 29 22
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	and $29.b,S		; 23 29
	bit $29.b		; 24 29
	and $29.b		; 25 29
	rol $29.b		; 26 29
	and [$29.b]		; 27 29
	plp		; 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$29.b		; 29 29
	and #$2A.b		; 29 2A
	and #$2B.b		; 29 2B
	and #$2C.b		; 29 2C
	and #$2D.b		; 29 2D
	and #$2E.b		; 29 2E
	and #$2F.b		; 29 2F
	and #$30.b		; 29 30
	and #$31.b		; 29 31
	and #$32.b		; 29 32
	and #$33.b		; 29 33
	and #$34.b		; 29 34
	and #$35.b		; 29 35
	and #$36.b		; 29 36
	and #$37.b		; 29 37
	and #$38.b		; 29 38
	and #$39.b		; 29 39
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	tsa		; 3B
	and #$3C.b		; 29 3C
	and #$3D.b		; 29 3D
	and #$3E.b		; 29 3E
	and #$3F.b		; 29 3F
	and #$40.b		; 29 40
	and #$41.b		; 29 41
	and #$42.b		; 29 42
	and #$43.b		; 29 43
	and #$44.b		; 29 44
	and #$45.b		; 29 45
	and #$46.b		; 29 46
	and #$30.b		; 29 30
	and #$47.b		; 29 47
	and #$48.b		; 29 48
	and #$49.b		; 29 49
	and #$4A.b		; 29 4A
	and #$4B.b		; 29 4B
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4D.b		; 29 4D
	and #$4E.b		; 29 4E
	and #$4F.b		; 29 4F
	and #$50.b		; 29 50
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	eor ($29.b),Y		; 51 29
	eor ($29.b),Y		; 51 29
	eor ($29.b)		; 52 29
	eor ($29.b,S),Y		; 53 29
	mvn $55,$29		; 54 29 55
	and #$56.b		; 29 56
	and #$57.b		; 29 57
	and #$58.b		; 29 58
	and #$59.b		; 29 59
	and #$5A.b		; 29 5A
	and #$5B.b		; 29 5B
	and #$5C.b		; 29 5C
	and #$5C.b		; 29 5C
	and #$5D.b		; 29 5D
	and #$5D.b		; 29 5D
	and #$5E.b		; 29 5E
	and #$5E.b		; 29 5E
	adc #$5F.b		; 69 5F
	and #$60.b		; 29 60
	and #$61.b		; 29 61
	and #$62.b		; 29 62
	and #$63.b		; 29 63
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	eor ($29.b),Y		; 51 29
	eor ($29.b),Y		; 51 29
	stz $29.b		; 64 29
	adc $29.b		; 65 29
	ror $29.b		; 66 29
	adc [$29.b]		; 67 29
	eor ($29.b),Y		; 51 29
	pla		; 68
	and #$69.b		; 29 69
	and #$6A.b		; 29 6A
	and #$6B.b		; 29 6B
	and #$72.b		; 29 72
	plp		; 28
	lsr $5E29.w,X		; 5E 29 5E
	and #$5E.b		; 29 5E
	and #$5E.b		; 29 5E
	and #$6C.b		; 29 6C
	and #$6D.b		; 29 6D
	and #$6E.b		; 29 6E
	and #$6F.b		; 29 6F
	and #$70.b		; 29 70
	and #$71.b		; 29 71
	and #$72.b		; 29 72
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora $0E28.w		; 0D 28 0E
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	ora $281028.l		; 0F 28 10 28
	ora ($28.b),Y		; 11 28
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	ora $1A28.w,Y		; 19 28 1A
	plp		; 28
	tas		; 1B
	plp		; 28
	trb $1D28.w		; 1C 28 1D
	plp		; 28
	asl $1E28.w,X		; 1E 28 1E
	plp		; 28
	asl $0E28.w,X		; 1E 28 0E
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	asl $0D28.w		; 0E 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	asl $0F28.w		; 0E 28 0F
	plp		; 28
	bpl  40.b		; 10 28
	ora ($28.b),Y		; 11 28
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	ora $1A28.w,Y		; 19 28 1A
	plp		; 28
	tas		; 1B
	plp		; 28
	trb $1D28.w		; 1C 28 1D
	plp		; 28
	asl $1E28.w,X		; 1E 28 1E
	plp		; 28
	asl $0E28.w,X		; 1E 28 0E
	plp		; 28
	asl $0E28.w		; 0E 28 0E
	plp		; 28
	asl $0D28.w		; 0E 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $0D28.w		; 0D 28 0D
	plp		; 28
	ora $2528.w		; 0D 28 25
	plp		; 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	and $28.b,X		; 35 28
	rol $28.b,X		; 36 28
	and [$28.b],Y		; 37 28
	sec		; 38
	plp		; 28
	and $3A28.w,Y		; 39 28 3A
	plp		; 28
	tsa		; 3B
	plp		; 28
	bit $3D28.w,X		; 3C 28 3D
	plp		; 28
	rol $3F28.w,X		; 3E 28 3F
	plp		; 28
	rti		; 40

	plp		; 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $25,$28		; 44 28 25
	plp		; 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	and $28.b,X		; 35 28
	rol $28.b,X		; 36 28
	and [$28.b],Y		; 37 28
	sec		; 38
	plp		; 28
	and $3A28.w,Y		; 39 28 3A
	plp		; 28
	tsa		; 3B
	plp		; 28
	bit $3D28.w,X		; 3C 28 3D
	plp		; 28
	rol $3F28.w,X		; 3E 28 3F
	plp		; 28
	rti		; 40

	plp		; 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $4F,$28		; 44 28 4F
	plp		; 28
	bvc  40.b		; 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $55,$28		; 54 28 55
	plp		; 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	rts		; 60

	plp		; 28
	adc ($28.b,X)		; 61 28
	.db $62, $28, $63		; 62 28 63
	plp		; 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $4F28.w		; 6E 28 4F
	plp		; 28
	bvc  40.b		; 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $55,$28		; 54 28 55
	plp		; 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	rts		; 60

	plp		; 28
	adc ($28.b,X)		; 61 28
	.db $62, $28, $63		; 62 28 63
	plp		; 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $6F28.w		; 6E 28 6F
	plp		; 28
	bvs  40.b		; 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	adc ($28.b,S),Y		; 73 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$28.b]		; 87 28
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	phb		; 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $6F28.w		; 8E 28 6F
	plp		; 28
	bvs  40.b		; 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	adc ($28.b,S),Y		; 73 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$28.b]		; 87 28
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	phb		; 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $8F28.w		; 8E 28 8F
	plp		; 28
	bcc  40.b		; 90 28
	sta ($28.b),Y		; 91 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	ldx #$A328.w		; A2 28 A3
	plp		; 28
	ldy $28.b		; A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	lda [$28.b]		; A7 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	ldy $AD28.w		; AC 28 AD
	plp		; 28
	ldx $8F28.w		; AE 28 8F
	plp		; 28
	bcc  40.b		; 90 28
	sta ($28.b),Y		; 91 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	ldx #$A328.w		; A2 28 A3
	plp		; 28
	ldy $28.b		; A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	lda [$28.b]		; A7 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	ldy $AD28.w		; AC 28 AD
	plp		; 28
	ldx $AF28.w		; AE 28 AF
	plp		; 28
	bcs  40.b		; B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	plp		; 28
	cpy #$C128.w		; C0 28 C1
	plp		; 28
.ACCU 16
	rep #$28		; C2 28
	cmp $28.b,S		; C3 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	iny		; C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	lda $28B028.l		; AF 28 B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	plp		; 28
	cpy #$C128.w		; C0 28 C1
	plp		; 28
.ACCU 16
	rep #$28		; C2 28
	cmp $28.b,S		; C3 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	iny		; C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	bne  40.b		; D0 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b)		; D2 28
	cmp ($28.b,S),Y		; D3 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	adc ($28.b)		; 72 28
	stp		; DB
	plp		; 28
	jmp.w [$DD28]		; DC 28 DD
	plp		; 28
	adc ($29.b,S),Y		; 73 29
	stz $29.b,X		; 74 29
	cpx #$E128.w		; E0 28 E1
	plp		; 28
.ACCU 8
	sep #$28		; E2 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	adc $29.b,X		; 75 29
	ror $29.b,X		; 76 29
	cmp ($28.b)		; D2 28
	cmp ($28.b,S),Y		; D3 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	adc ($28.b)		; 72 28
	stp		; DB
	plp		; 28
	jmp.w [$DD28]		; DC 28 DD
	plp		; 28
	adc ($29.b,S),Y		; 73 29
	stz $29.b,X		; 74 29
	cpx #$E128.w		; E0 28 E1
	plp		; 28
.ACCU 8
	sep #$28		; E2 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	wai		; CB
	plp		; 28
	adc ($28.b)		; 72 28
	sbc #$28.b		; E9 28
	nop		; EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $7728.w		; EC 28 77
	and #$EE.b		; 29 EE
	plp		; 28
	sbc $28F028.l		; EF 28 F0 28
	sbc ($28.b),Y		; F1 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sei		; 78
	and #$79.b		; 29 79
	and #$7A.b		; 29 7A
	and #$7B.b		; 29 7B
	and #$7C.b		; 29 7C
	and #$7D.b		; 29 7D
	and #$FF.b		; 29 FF
	plp		; 28
	brk $29.b		; 00 29
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$E9.b		; 29 E9
	plp		; 28
	nop		; EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $FD28.w		; EC 28 FD
	pla		; 68
	ror $7F29.w,X		; 7E 29 7F
	and #$80.b		; 29 80
	and #$F1.b		; 29 F1
	plp		; 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sei		; 78
	and #$79.b		; 29 79
	and #$7A.b		; 29 7A
	and #$7B.b		; 29 7B
	and #$7C.b		; 29 7C
	and #$7D.b		; 29 7D
	and #$FF.b		; 29 FF
	plp		; 28
	brk $29.b		; 00 29
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$09.b		; 29 09
	and #$0A.b		; 29 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$81.b		; 29 81
	and #$0E.b		; 29 0E
	and #$0F.b		; 29 0F
	and #$10.b		; 29 10
	and #$72.b		; 29 72
	plp		; 28
	adc ($28.b)		; 72 28
	ora ($29.b),Y		; 11 29
	ora ($29.b)		; 12 29
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	.db $82, $29, $83		; 82 29 83
	and #$10.b		; 29 10
	and #$72.b		; 29 72
	plp		; 28
	adc ($28.b)		; 72 28
	sty $29.b		; 84 29
	sta $29.b		; 85 29
	ora $1E29.w,X		; 1D 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$22.b		; 29 22
	and #$09.b		; 29 09
	and #$0A.b		; 29 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$1B.b		; 29 1B
	adc #$86.b		; 69 86
	and #$19.b		; 29 19
	adc #$18.b		; 69 18
	adc #$87.b		; 69 87
	and #$88.b		; 29 88
	and #$89.b		; 29 89
	and #$8A.b		; 29 8A
	and #$13.b		; 29 13
	adc #$72.b		; 69 72
	plp		; 28
	adc ($28.b)		; 72 28
	.db $82, $29, $83		; 82 29 83
	and #$10.b		; 29 10
	and #$72.b		; 29 72
	plp		; 28
	adc ($28.b)		; 72 28
	phb		; 8B
	and #$85.b		; 29 85
	and #$1D.b		; 29 1D
	and #$1E.b		; 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$22.b		; 29 22
	and #$23.b		; 29 23
	and #$24.b		; 29 24
	and #$25.b		; 29 25
	and #$26.b		; 29 26
	and #$8C.b		; 29 8C
	and #$8D.b		; 29 8D
	and #$8E.b		; 29 8E
	and #$8F.b		; 29 8F
	and #$90.b		; 29 90
	and #$91.b		; 29 91
	and #$92.b		; 29 92
	and #$93.b		; 29 93
	and #$92.b		; 29 92
	and #$92.b		; 29 92
	and #$92.b		; 29 92
	and #$94.b		; 29 94
	and #$95.b		; 29 95
	and #$96.b		; 29 96
	and #$97.b		; 29 97
	and #$98.b		; 29 98
	and #$99.b		; 29 99
	and #$9A.b		; 29 9A
	and #$36.b		; 29 36
	and #$37.b		; 29 37
	and #$38.b		; 29 38
	and #$39.b		; 29 39
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$23.b		; 29 23
	and #$24.b		; 29 24
	and #$25.b		; 29 25
	and #$9B.b		; 29 9B
	and #$9C.b		; 29 9C
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$9D.b		; 29 9D
	and #$30.b		; 29 30
	adc #$2F.b		; 69 2F
	adc #$2E.b		; 69 2E
	adc #$2D.b		; 69 2D
	adc #$2C.b		; 69 2C
	adc #$9E.b		; 69 9E
	and #$9F.b		; 29 9F
	and #$A0.b		; 29 A0
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	and #$A1.b		; 29 A1
	and #$9A.b		; 29 9A
	and #$36.b		; 29 36
	and #$37.b		; 29 37
	and #$38.b		; 29 38
	and #$39.b		; 29 39
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3A.b		; 29 3A
	and #$3B.b		; 29 3B
	and #$3C.b		; 29 3C
	and #$3D.b		; 29 3D
	and #$3E.b		; 29 3E
	and #$A2.b		; 29 A2
	and #$A3.b		; 29 A3
	and #$A4.b		; 29 A4
	and #$A5.b		; 29 A5
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A6.b		; 29 A6
	and #$A7.b		; 29 A7
	and #$A4.b		; 29 A4
	and #$A8.b		; 29 A8
	and #$A9.b		; 29 A9
	and #$AA.b		; 29 AA
	and #$4F.b		; 29 4F
	and #$50.b		; 29 50
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$3B.b		; 29 3B
	and #$3C.b		; 29 3C
	and #$3D.b		; 29 3D
	and #$3E.b		; 29 3E
	and #$AB.b		; 29 AB
	and #$AC.b		; 29 AC
	and #$AD.b		; 29 AD
	and #$AE.b		; 29 AE
	and #$4A.b		; 29 4A
	adc #$49.b		; 69 49
	adc #$48.b		; 69 48
	adc #$47.b		; 69 47
	adc #$AF.b		; 69 AF
	and #$46.b		; 29 46
	adc #$45.b		; 69 45
	adc #$44.b		; 69 44
	adc #$43.b		; 69 43
	adc #$42.b		; 69 42
	adc #$41.b		; 69 41
	adc #$B0.b		; 69 B0
	and #$B1.b		; 29 B1
	and #$B2.b		; 29 B2
	and #$4F.b		; 29 4F
	and #$50.b		; 29 50
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$52.b		; 29 52
	and #$53.b		; 29 53
	and #$B3.b		; 29 B3
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$B4.b		; 29 B4
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B5.b		; 29 B5
	and #$B4.b		; 29 B4
	adc #$B6.b		; 69 B6
	and #$B7.b		; 29 B7
	and #$B8.b		; 29 B8
	and #$62.b		; 29 62
	and #$63.b		; 29 63
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$52.b		; 29 52
	and #$53.b		; 29 53
	and #$61.b		; 29 61
	adc #$60.b		; 69 60
	adc #$5F.b		; 69 5F
	adc #$5E.b		; 69 5E
	and #$72.b		; 29 72
	plp		; 28
	eor $B969.w,X		; 5D 69 B9
	and #$5C.b		; 29 5C
	adc #$5C.b		; 69 5C
	adc #$5B.b		; 69 5B
	adc #$5A.b		; 69 5A
	adc #$59.b		; 69 59
	adc #$58.b		; 69 58
	adc #$57.b		; 69 57
	adc #$56.b		; 69 56
	adc #$55.b		; 69 55
	adc #$54.b		; 69 54
	adc #$62.b		; 69 62
	and #$63.b		; 29 63
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$64.b		; 29 64
	and #$BA.b		; 29 BA
	and #$BB.b		; 29 BB
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$BC.b		; 29 BC
	and #$BD.b		; 29 BD
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BE.b		; 29 BE
	and #$BF.b		; 29 BF
	and #$C0.b		; 29 C0
	and #$51.b		; 29 51
	and #$C1.b		; 29 C1
	and #$71.b		; 29 71
	and #$72.b		; 29 72
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$64.b		; 29 64
	and #$65.b		; 29 65
	and #$70.b		; 29 70
	adc #$6F.b		; 69 6F
	adc #$6E.b		; 69 6E
	adc #$6D.b		; 69 6D
	adc #$6C.b		; 69 6C
	adc #$72.b		; 69 72
	plp		; 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	adc ($28.b)		; 72 28
	rtl		; 6B

	adc #$6A.b		; 69 6A
	adc #$69.b		; 69 69
	adc #$C2.b		; 69 C2
	and #$51.b		; 29 51
	and #$67.b		; 29 67
	adc #$66.b		; 69 66
	adc #$71.b		; 69 71
	and #$72.b		; 29 72
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$51.b		; 29 51
	and #$C3.b		; 29 C3
	and #$C4.b		; 29 C4
	and #$00.b		; 29 00
	jsr $29C5.w		; 20 C5 29
	cpy $29.b		; C4 29
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cmp $29.b,S		; C3 29
	dec $29.b		; C6 29
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cmp $29.b,S		; C3 29
	cmp [$29.b]		; C7 29
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cmp $29.b,S		; C3 29
	iny		; C8
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $7C.b		; 00 7C
	rol $29.b		; 26 29
	and $779B4E.l		; 2F 4E 9B 77
	brk $00.b		; 00 00
	rol $29.b		; 26 29
.INDEX 16
	rep #$18		; C2 18
	.db $82, $09, $00		; 82 09 00
	brk $05.b		; 00 05
	cop $5F.b		; 02 5F
	adc $7D5F.w,X		; 7D 5F 7D
	brk $00.b		; 00 00
	ora $7D5F7C.l,X		; 1F 7C 5F 7D
	eor $00007D.l,X		; 5F 7D 00 00
	cpx #$E003.w		; E0 03 E0
	ora $FF.b,S		; 03 FF
	adc $E00000.l,X		; 7F 00 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $E0.b,S		; 03 E0
	ora $1E.b,S		; 03 1E
	ora $DE.b,S		; 03 DE
	eor ($42.b,S),Y		; 53 42
	bpl -34.b		; 10 DE
	tda		; 7B
	brk $08.b		; 00 08
	sty $18.b		; 84 18
	dec $20.b		; C6 20
	lsr A		; 4A
	and ($CE.b),Y		; 31 CE
	eor ($D6.b,X)		; 41 D6
	.db $62, $5C, $02		; 62 5C 02
	bpl   0.b		; 10 00
	trb $00.b		; 14 00
	trb $0000.w		; 1C 00 00
	brk $5F.b		; 00 5F
	adc $7D5F.w,X		; 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
	eor $7D5F7D.l,X		; 5F 7D 5F 7D
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
	eor $000002.l,X		; 5F 02 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $20.b		; 00 20
	brk $08.b		; 00 08
	ora $01.b,S		; 03 01
	plp		; 28
	cop $28.b		; 02 28
	ora $28.b,S		; 03 28
	tsb $28.b		; 04 28
	ora $28.b		; 05 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	asl $28.b		; 06 28
	ora [$28.b]		; 07 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	ora #$28.b		; 09 28
	asl A		; 0A
	plp		; 28
	asl A		; 0A
	plp		; 28
	phd		; 0B
	plp		; 28
	phd		; 0B
	pla		; 68
	asl A		; 0A
	plp		; 28
	asl A		; 0A
	plp		; 28
	ora #$68.b		; 09 68
	php		; 08
	plp		; 28
	php		; 08
	plp		; 28
	tsb $0D28.w		; 0C 28 0D
	plp		; 28
	asl $0F28.w		; 0E 28 0F
	plp		; 28
	bpl  40.b		; 10 28
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	ora $1A28.w,Y		; 19 28 1A
	plp		; 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	tas		; 1B
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1928.w		; 1C 28 19
	plp		; 28
	trb $1D28.w		; 1C 28 1D
	plp		; 28
	asl $1F28.w,X		; 1E 28 1F
	plp		; 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	jsr $2128.w		; 20 28 21
	plp		; 28
	ora $2228.w,Y		; 19 28 22
	plp		; 28
	and $28.b,S		; 23 28
	bit $28.b		; 24 28
	and $28.b		; 25 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	and $28.b,X		; 35 28
	rol $28.b,X		; 36 28
	and [$28.b],Y		; 37 28
	sec		; 38
	plp		; 28
	and $3A28.w,Y		; 39 28 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	and $28.b,X		; 35 28
	dec A		; 3A
	plp		; 28
	tsa		; 3B
	plp		; 28
	bit $3C28.w,X		; 3C 28 3C
	plp		; 28
	bit $3C28.w,X		; 3C 28 3C
	plp		; 28
	bit $3C28.w,X		; 3C 28 3C
	plp		; 28
	tsa		; 3B
	pla		; 68
	dec A		; 3A
	plp		; 28
	dec A		; 3A
	plp		; 28
	and $3E28.w,X		; 3D 28 3E
	plp		; 28
	and $284028.l,X		; 3F 28 40 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $45,$28		; 44 28 45
	plp		; 28
	lsr $28.b		; 46 28
	eor [$28.b]		; 47 28
	pha		; 48
	plp		; 28
	eor #$28.b		; 49 28
	lsr A		; 4A
	plp		; 28
	phk		; 4B
	plp		; 28
	lsr $28.b		; 46 28
	jmp $4D28.w		; 4C 28 4D
	plp		; 28
	lsr $4F28.w		; 4E 28 4F
	plp		; 28
	bvc  40.b		; 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	eor $28.b,X		; 55 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	rts		; 60

	plp		; 28
	adc ($28.b,X)		; 61 28
	.db $62, $28, $5D		; 62 28 5D
	plp		; 28
	adc $28.b,S		; 63 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $6F28.w		; 6E 28 6F
	plp		; 28
	bvs  40.b		; 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	jmp ($0028.w)		; 6C 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	adc ($28.b,S),Y		; 73 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$2C.b]		; 87 2C
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	jmp ($8B28.w)		; 6C 28 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $8F28.w		; 8E 28 8F
	plp		; 28
	bcc  40.b		; 90 28
	jmp ($0028.w)		; 6C 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	sta ($28.b),Y		; 91 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	php		; 08
	plp		; 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	adc [$E8.b]		; 67 E8
	ldx #$A32C.w		; A2 2C A3
	bit $28A4.w		; 2C A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	jmp ($A728.w)		; 6C 28 A7
	plp		; 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	lda #$68.b		; A9 68
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	jmp ($0028.w)		; 6C 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ldy $AD28.w		; AC 28 AD
	plp		; 28
	ldx $AF28.w		; AE 28 AF
	plp		; 28
	bcs  40.b		; B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	bit $28C0.w		; 2C C0 28
	cmp ($28.b,X)		; C1 28
.ACCU 16
	rep #$28		; C2 28
	jmp ($C328.w)		; 6C 28 C3
	plp		; 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	cmp $68.b		; C5 68
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	jmp ($0028.w)		; 6C 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	iny		; C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	bne  40.b		; D0 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b,S),Y		; D3 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp ($28.b)		; D2 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	stp		; DB
	plp		; 28
	jmp ($DC28.w)		; 6C 28 DC
	plp		; 28
	cmp $DE28.w,X		; DD 28 DE
	plp		; 28
	cmp $28E028.l,X		; DF 28 E0 28
	sbc ($28.b,X)		; E1 28
	jmp ($0028.w)		; 6C 28 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
.ACCU 8
	sep #$28		; E2 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	sbc #$28.b		; E9 28
	nop		; EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $ED28.w		; EC 28 ED
	plp		; 28
	inc $EF28.w		; EE 28 EF
	plp		; 28
	beq  40.b		; F0 28
	sbc ($28.b),Y		; F1 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sbc $FA28.w,Y		; F9 28 FA
	plp		; 28
	xce		; FB
	plp		; 28
	jsr ($FD28.w,X)		; FC 28 FD
	plp		; 28
	inc $FF28.w,X		; FE 28 FF
	plp		; 28
	brk $29.b		; 00 29
	plx		; FA
	plp		; 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$09.b		; 29 09
	and #$0A.b		; 29 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$0D.b		; 29 0D
	and #$0E.b		; 29 0E
	and #$0F.b		; 29 0F
	and #$10.b		; 29 10
	and #$11.b		; 29 11
	and #$12.b		; 29 12
	and #$13.b		; 29 13
	and #$14.b		; 29 14
	and #$15.b		; 29 15
	and #$16.b		; 29 16
	and #$F8.b		; 29 F8
	plp		; 28
	ora [$29.b],Y		; 17 29
	plx		; FA
	plp		; 28
	clc		; 18
	and #$19.b		; 29 19
	and #$1A.b		; 29 1A
	and #$1B.b		; 29 1B
	and #$19.b		; 29 19
	and #$1C.b		; 29 1C
	and #$FA.b		; 29 FA
	plp		; 28
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	ora $1E29.w,X		; 1D 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$22.b		; 29 22
	and #$23.b		; 29 23
	and #$08.b		; 29 08
	and #$24.b		; 29 24
	and #$25.b		; 29 25
	and #$26.b		; 29 26
	and #$27.b		; 29 27
	and #$28.b		; 29 28
	and #$29.b		; 29 29
	and #$2A.b		; 29 2A
	and #$2B.b		; 29 2B
	and #$2C.b		; 29 2C
	and #$08.b		; 29 08
	plp		; 28
	and $2E29.w		; 2D 29 2E
	and #$2F.b		; 29 2F
	and #$30.b		; 29 30
	and #$31.b		; 29 31
	and #$32.b		; 29 32
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	bit $29.b,X		; 34 29
	and $29.b,X		; 35 29
	rol $29.b,X		; 36 29
	and [$29.b],Y		; 37 29
	sec		; 38
	and #$39.b		; 29 39
	and #$3A.b		; 29 3A
	and #$3B.b		; 29 3B
	and #$3C.b		; 29 3C
	and #$3D.b		; 29 3D
	and #$3E.b		; 29 3E
	and #$3F.b		; 29 3F
	and #$40.b		; 29 40
	and #$41.b		; 29 41
	and #$42.b		; 29 42
	and #$43.b		; 29 43
	and #$44.b		; 29 44
	and #$45.b		; 29 45
	and #$46.b		; 29 46
	and #$47.b		; 29 47
	and #$48.b		; 29 48
	and #$49.b		; 29 49
	and #$4A.b		; 29 4A
	and #$4B.b		; 29 4B
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	eor $4E29.w		; 4D 29 4E
	and #$4F.b		; 29 4F
	and #$50.b		; 29 50
	and #$51.b		; 29 51
	and #$52.b		; 29 52
	and #$53.b		; 29 53
	and #$54.b		; 29 54
	and #$55.b		; 29 55
	and #$56.b		; 29 56
	and #$57.b		; 29 57
	and #$58.b		; 29 58
	and #$59.b		; 29 59
	and #$5A.b		; 29 5A
	and #$5B.b		; 29 5B
	and #$5C.b		; 29 5C
	and #$5D.b		; 29 5D
	and #$5E.b		; 29 5E
	and #$5F.b		; 29 5F
	and #$60.b		; 29 60
	and #$61.b		; 29 61
	and #$62.b		; 29 62
	and #$63.b		; 29 63
	and #$64.b		; 29 64
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	tsb $0D28.w		; 0C 28 0D
	plp		; 28
	asl $0F28.w		; 0E 28 0F
	plp		; 28
	bpl  40.b		; 10 28
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0D28.w		; 0C 28 0D
	plp		; 28
	asl $0F28.w		; 0E 28 0F
	plp		; 28
	bpl  40.b		; 10 28
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	ora ($68.b)		; 12 68
	ora ($28.b),Y		; 11 28
	ora ($68.b),Y		; 11 68
	ora ($28.b)		; 12 28
	ora ($28.b,S),Y		; 13 28
	trb $28.b		; 14 28
	ora $28.b,X		; 15 28
	asl $28.b,X		; 16 28
	ora [$28.b],Y		; 17 28
	clc		; 18
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	tsb $0C28.w		; 0C 28 0C
	plp		; 28
	jsl $282328.l		; 22 28 23 28
	bit $28.b		; 24 28
	and $28.b		; 25 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	jsl $282328.l		; 22 28 23 28
	bit $28.b		; 24 28
	and $28.b		; 25 28
	rol $28.b		; 26 28
	and [$28.b]		; 27 28
	plp		; 28
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	bit $2D28.w		; 2C 28 2D
	plp		; 28
	and #$28.b		; 29 28
	rol A		; 2A
	plp		; 28
	pld		; 2B
	plp		; 28
	and #$28.b		; 29 28
	and #$28.b		; 29 28
	rol $2F28.w		; 2E 28 2F
	plp		; 28
	bmi  40.b		; 30 28
	and ($28.b),Y		; 31 28
	and ($28.b)		; 32 28
	and ($28.b,S),Y		; 33 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	bit $28.b,X		; 34 28
	and $3E28.w,X		; 3D 28 3E
	plp		; 28
	and $284028.l,X		; 3F 28 40 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $45,$28		; 44 28 45
	plp		; 28
	lsr $28.b		; 46 28
	eor [$28.b]		; 47 28
	pha		; 48
	plp		; 28
	eor #$28.b		; 49 28
	lsr A		; 4A
	plp		; 28
	phk		; 4B
	plp		; 28
	lsr $28.b		; 46 28
	jmp $4D28.w		; 4C 28 4D
	plp		; 28
	lsr $4F28.w		; 4E 28 4F
	plp		; 28
	bvc  40.b		; 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	and $3E28.w,X		; 3D 28 3E
	plp		; 28
	and $284028.l,X		; 3F 28 40 28
	eor ($28.b,X)		; 41 28
	.db $42, $28		; 42 28
	eor $28.b,S		; 43 28
	mvp $45,$28		; 44 28 45
	plp		; 28
	lsr $28.b		; 46 28
	eor [$28.b]		; 47 28
	pha		; 48
	plp		; 28
	eor #$28.b		; 49 28
	lsr A		; 4A
	plp		; 28
	phk		; 4B
	plp		; 28
	lsr $28.b		; 46 28
	jmp $4D28.w		; 4C 28 4D
	plp		; 28
	lsr $4F28.w		; 4E 28 4F
	plp		; 28
	bvc  40.b		; 50 28
	eor ($28.b),Y		; 51 28
	eor ($28.b)		; 52 28
	eor ($28.b,S),Y		; 53 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	mvn $54,$28		; 54 28 54
	plp		; 28
	eor $28.b,X		; 55 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	rts		; 60

	plp		; 28
	adc ($28.b,X)		; 61 28
	.db $62, $28, $5D		; 62 28 5D
	plp		; 28
	adc $28.b,S		; 63 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $6F28.w		; 6E 28 6F
	plp		; 28
	bvs  40.b		; 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	jmp ($5528.w)		; 6C 28 55
	plp		; 28
	lsr $28.b,X		; 56 28
	eor [$28.b],Y		; 57 28
	cli		; 58
	plp		; 28
	eor $5A28.w,Y		; 59 28 5A
	plp		; 28
	tad		; 5B
	plp		; 28
	jmp $285D28.l		; 5C 28 5D 28
	lsr $5F28.w,X		; 5E 28 5F
	plp		; 28
	adc $29.b		; 65 29
	ror $29.b		; 66 29
	.db $62, $28, $5D		; 62 28 5D
	plp		; 28
	adc $28.b,S		; 63 28
	stz $28.b		; 64 28
	adc $28.b		; 65 28
	ror $28.b		; 66 28
	adc [$28.b]		; 67 28
	pla		; 68
	plp		; 28
	adc #$28.b		; 69 28
	ror A		; 6A
	plp		; 28
	rtl		; 6B

	plp		; 28
	jmp ($6D28.w)		; 6C 28 6D
	plp		; 28
	ror $6F28.w		; 6E 28 6F
	plp		; 28
	bvs  40.b		; 70 28
	adc ($28.b),Y		; 71 28
	adc ($28.b)		; 72 28
	jmp ($7328.w)		; 6C 28 73
	plp		; 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$2C.b]		; 87 2C
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	jmp ($8B28.w)		; 6C 28 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $8F28.w		; 8E 28 8F
	plp		; 28
	bcc  40.b		; 90 28
	jmp ($7328.w)		; 6C 28 73
	plp		; 28
	stz $28.b,X		; 74 28
	adc $28.b,X		; 75 28
	ror $28.b,X		; 76 28
	adc [$28.b],Y		; 77 28
	sei		; 78
	plp		; 28
	adc $7A28.w,Y		; 79 28 7A
	plp		; 28
	tda		; 7B
	plp		; 28
	jmp ($7D28.w,X)		; 7C 28 7D
	plp		; 28
	ror $7F28.w,X		; 7E 28 7F
	plp		; 28
	bra  40.b		; 80 28
	sta ($28.b,X)		; 81 28
	.db $82, $28, $83		; 82 28 83
	plp		; 28
	sty $28.b		; 84 28
	sta $28.b		; 85 28
	stx $28.b		; 86 28
	sta [$2C.b]		; 87 2C
	dey		; 88
	plp		; 28
	bit #$28.b		; 89 28
	txa		; 8A
	plp		; 28
	jmp ($8B28.w)		; 6C 28 8B
	plp		; 28
	sty $8D28.w		; 8C 28 8D
	plp		; 28
	stx $8F28.w		; 8E 28 8F
	plp		; 28
	bcc  40.b		; 90 28
	jmp ($9128.w)		; 6C 28 91
	plp		; 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	php		; 08
	plp		; 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	adc [$E8.b]		; 67 E8
	ldx #$A32C.w		; A2 2C A3
	bit $28A4.w		; 2C A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	jmp ($A728.w)		; 6C 28 A7
	plp		; 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	lda #$68.b		; A9 68
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	jmp ($9128.w)		; 6C 28 91
	plp		; 28
	sta ($28.b)		; 92 28
	sta ($28.b,S),Y		; 93 28
	sty $28.b,X		; 94 28
	php		; 08
	plp		; 28
	sta $28.b,X		; 95 28
	stx $28.b,Y		; 96 28
	sta [$28.b],Y		; 97 28
	tya		; 98
	plp		; 28
	sta $9A28.w,Y		; 99 28 9A
	plp		; 28
	txy		; 9B
	plp		; 28
	stz $9D28.w		; 9C 28 9D
	plp		; 28
	stz $9F28.w,X		; 9E 28 9F
	plp		; 28
	ldy #$A128.w		; A0 28 A1
	plp		; 28
	adc [$E8.b]		; 67 E8
	ldx #$A32C.w		; A2 2C A3
	bit $28A4.w		; 2C A4 28
	lda $28.b		; A5 28
	ldx $28.b		; A6 28
	jmp ($A728.w)		; 6C 28 A7
	plp		; 28
	tay		; A8
	plp		; 28
	lda #$28.b		; A9 28
	lda #$68.b		; A9 68
	tax		; AA
	plp		; 28
	plb		; AB
	plp		; 28
	jmp ($AC28.w)		; 6C 28 AC
	plp		; 28
	lda $AE28.w		; AD 28 AE
	plp		; 28
	lda $28B028.l		; AF 28 B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	bit $28C0.w		; 2C C0 28
	cmp ($28.b,X)		; C1 28
.ACCU 16
	rep #$28		; C2 28
	jmp ($C328.w)		; 6C 28 C3
	plp		; 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	cmp $68.b		; C5 68
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	jmp ($AC28.w)		; 6C 28 AC
	plp		; 28
	lda $AE28.w		; AD 28 AE
	plp		; 28
	lda $28B028.l		; AF 28 B0 28
	lda ($28.b),Y		; B1 28
	lda ($28.b)		; B2 28
	lda ($28.b,S),Y		; B3 28
	ldy $28.b,X		; B4 28
	lda $28.b,X		; B5 28
	ldx $28.b,Y		; B6 28
	lda [$28.b],Y		; B7 28
	lda [$28.b],Y		; B7 28
	clv		; B8
	plp		; 28
	lda $BA28.w,Y		; B9 28 BA
	plp		; 28
	tyx		; BB
	plp		; 28
	ldy $BD28.w,X		; BC 28 BD
	plp		; 28
	ldx $BF28.w,Y		; BE 28 BF
	bit $28C0.w		; 2C C0 28
	cmp ($28.b,X)		; C1 28
.ACCU 16
	rep #$28		; C2 28
	jmp ($C328.w)		; 6C 28 C3
	plp		; 28
	cpy $28.b		; C4 28
	cmp $28.b		; C5 28
	cmp $68.b		; C5 68
	dec $28.b		; C6 28
	cmp [$28.b]		; C7 28
	jmp ($C828.w)		; 6C 28 C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	bne  40.b		; D0 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b,S),Y		; D3 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp ($28.b)		; D2 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	stp		; DB
	plp		; 28
	jmp ($DC28.w)		; 6C 28 DC
	plp		; 28
	cmp $DE28.w,X		; DD 28 DE
	plp		; 28
	cmp $28E028.l,X		; DF 28 E0 28
	sbc ($28.b,X)		; E1 28
	jmp ($C828.w)		; 6C 28 C8
	plp		; 28
	cmp #$CA28.w		; C9 28 CA
	plp		; 28
	wai		; CB
	plp		; 28
	cpy $CD28.w		; CC 28 CD
	plp		; 28
	dec $CF28.w		; CE 28 CF
	plp		; 28
	bne  40.b		; D0 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	cmp ($28.b,S),Y		; D3 28
	cmp ($28.b)		; D2 28
	cmp ($28.b),Y		; D1 28
	pei ($28.b)		; D4 28
	cmp $28.b,X		; D5 28
	dec $28.b,X		; D6 28
	cmp [$28.b],Y		; D7 28
	cld		; D8
	plp		; 28
	cmp ($28.b)		; D2 28
	cmp $DA28.w,Y		; D9 28 DA
	plp		; 28
	stp		; DB
	plp		; 28
	jmp ($DC28.w)		; 6C 28 DC
	plp		; 28
	cmp $DE28.w,X		; DD 28 DE
	plp		; 28
	cmp $28E028.l,X		; DF 28 E0 28
	sbc ($28.b,X)		; E1 28
	jmp ($E228.w)		; 6C 28 E2
	plp		; 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	sbc #$EA28.w		; E9 28 EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $ED28.w		; EC 28 ED
	plp		; 28
	inc $EF28.w		; EE 28 EF
	plp		; 28
	beq  40.b		; F0 28
	sbc ($28.b),Y		; F1 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sbc $FA28.w,Y		; F9 28 FA
	plp		; 28
	xce		; FB
	plp		; 28
	jsr ($FD28.w,X)		; FC 28 FD
	plp		; 28
	inc $FF28.w,X		; FE 28 FF
	plp		; 28
	brk $29.b		; 00 29
	plx		; FA
	plp		; 28
.ACCU 8
	sep #$28		; E2 28
	sbc $28.b,S		; E3 28
	cpx $28.b		; E4 28
	sbc $28.b		; E5 28
	inc $28.b		; E6 28
	sbc [$28.b]		; E7 28
	inx		; E8
	plp		; 28
	sbc #$28.b		; E9 28
	nop		; EA
	plp		; 28
	xba		; EB
	plp		; 28
	cpx $ED28.w		; EC 28 ED
	plp		; 28
	inc $EF28.w		; EE 28 EF
	plp		; 28
	beq  40.b		; F0 28
	sbc ($28.b),Y		; F1 28
	sbc ($28.b)		; F2 28
	sbc ($28.b,S),Y		; F3 28
	pea $F528.w		; F4 28 F5
	plp		; 28
	inc $28.b,X		; F6 28
	sbc [$28.b],Y		; F7 28
	sed		; F8
	plp		; 28
	sbc $FA28.w,Y		; F9 28 FA
	plp		; 28
	xce		; FB
	plp		; 28
	jsr ($FD28.w,X)		; FC 28 FD
	plp		; 28
	inc $FF28.w,X		; FE 28 FF
	plp		; 28
	brk $29.b		; 00 29
	plx		; FA
	plp		; 28
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$09.b		; 29 09
	and #$0A.b		; 29 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$0D.b		; 29 0D
	and #$0E.b		; 29 0E
	and #$0F.b		; 29 0F
	and #$10.b		; 29 10
	and #$11.b		; 29 11
	and #$12.b		; 29 12
	and #$13.b		; 29 13
	and #$14.b		; 29 14
	and #$15.b		; 29 15
	and #$16.b		; 29 16
	and #$F8.b		; 29 F8
	plp		; 28
	ora [$29.b],Y		; 17 29
	plx		; FA
	plp		; 28
	clc		; 18
	and #$19.b		; 29 19
	and #$1A.b		; 29 1A
	and #$1B.b		; 29 1B
	and #$19.b		; 29 19
	and #$1C.b		; 29 1C
	and #$FA.b		; 29 FA
	plp		; 28
	ora ($29.b,X)		; 01 29
	cop $29.b		; 02 29
	ora $29.b,S		; 03 29
	tsb $29.b		; 04 29
	ora $29.b		; 05 29
	asl $29.b		; 06 29
	ora [$29.b]		; 07 29
	php		; 08
	and #$09.b		; 29 09
	and #$0A.b		; 29 0A
	and #$0B.b		; 29 0B
	and #$0C.b		; 29 0C
	and #$0D.b		; 29 0D
	and #$0E.b		; 29 0E
	and #$0F.b		; 29 0F
	and #$10.b		; 29 10
	and #$11.b		; 29 11
	and #$12.b		; 29 12
	and #$13.b		; 29 13
	and #$14.b		; 29 14
	and #$15.b		; 29 15
	and #$16.b		; 29 16
	and #$F8.b		; 29 F8
	plp		; 28
	ora [$29.b],Y		; 17 29
	plx		; FA
	plp		; 28
	clc		; 18
	and #$19.b		; 29 19
	and #$1A.b		; 29 1A
	and #$1B.b		; 29 1B
	and #$19.b		; 29 19
	and #$1C.b		; 29 1C
	and #$FA.b		; 29 FA
	plp		; 28
	ora $1E29.w,X		; 1D 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$67.b		; 29 67
	and #$23.b		; 29 23
	and #$08.b		; 29 08
	and #$24.b		; 29 24
	and #$68.b		; 29 68
	and #$69.b		; 29 69
	and #$6A.b		; 29 6A
	and #$6B.b		; 29 6B
	and #$6C.b		; 29 6C
	and #$6D.b		; 29 6D
	and #$6E.b		; 29 6E
	and #$6F.b		; 29 6F
	and #$08.b		; 29 08
	plp		; 28
	bvs  41.b		; 70 29
	rol $2F29.w		; 2E 29 2F
	and #$30.b		; 29 30
	and #$31.b		; 29 31
	and #$32.b		; 29 32
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$1D.b		; 29 1D
	and #$1E.b		; 29 1E
	and #$1F.b		; 29 1F
	and #$20.b		; 29 20
	and #$21.b		; 29 21
	and #$67.b		; 29 67
	and #$23.b		; 29 23
	and #$71.b		; 29 71
	and #$72.b		; 29 72
	and #$73.b		; 29 73
	and #$74.b		; 29 74
	and #$75.b		; 29 75
	and #$76.b		; 29 76
	and #$77.b		; 29 77
	and #$78.b		; 29 78
	and #$79.b		; 29 79
	and #$6F.b		; 29 6F
	and #$08.b		; 29 08
	plp		; 28
	ply		; 7A
	and #$2E.b		; 29 2E
	and #$2F.b		; 29 2F
	and #$30.b		; 29 30
	and #$31.b		; 29 31
	and #$32.b		; 29 32
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$33.b		; 29 33
	and #$34.b		; 29 34
	and #$35.b		; 29 35
	and #$36.b		; 29 36
	and #$37.b		; 29 37
	and #$38.b		; 29 38
	and #$7B.b		; 29 7B
	and #$3A.b		; 29 3A
	and #$7C.b		; 29 7C
	and #$7D.b		; 29 7D
	and #$7E.b		; 29 7E
	and #$7F.b		; 29 7F
	and #$80.b		; 29 80
	and #$81.b		; 29 81
	and #$82.b		; 29 82
	and #$83.b		; 29 83
	and #$84.b		; 29 84
	and #$85.b		; 29 85
	and #$86.b		; 29 86
	and #$87.b		; 29 87
	and #$88.b		; 29 88
	and #$48.b		; 29 48
	and #$49.b		; 29 49
	and #$4A.b		; 29 4A
	and #$4B.b		; 29 4B
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$34.b		; 29 34
	and #$35.b		; 29 35
	and #$36.b		; 29 36
	and #$37.b		; 29 37
	and #$38.b		; 29 38
	and #$89.b		; 29 89
	and #$8A.b		; 29 8A
	and #$8B.b		; 29 8B
	and #$8C.b		; 29 8C
	and #$8D.b		; 29 8D
	and #$8E.b		; 29 8E
	and #$8F.b		; 29 8F
	and #$90.b		; 29 90
	and #$91.b		; 29 91
	and #$92.b		; 29 92
	and #$93.b		; 29 93
	and #$94.b		; 29 94
	and #$86.b		; 29 86
	and #$95.b		; 29 95
	and #$88.b		; 29 88
	and #$48.b		; 29 48
	and #$49.b		; 29 49
	and #$4A.b		; 29 4A
	and #$4B.b		; 29 4B
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4D.b		; 29 4D
	and #$4E.b		; 29 4E
	and #$4F.b		; 29 4F
	and #$50.b		; 29 50
	and #$51.b		; 29 51
	and #$96.b		; 29 96
	and #$97.b		; 29 97
	and #$98.b		; 29 98
	and #$99.b		; 29 99
	and #$9A.b		; 29 9A
	and #$9B.b		; 29 9B
	and #$9C.b		; 29 9C
	and #$9D.b		; 29 9D
	and #$9E.b		; 29 9E
	and #$9F.b		; 29 9F
	and #$A0.b		; 29 A0
	and #$A1.b		; 29 A1
	and #$A2.b		; 29 A2
	and #$A3.b		; 29 A3
	and #$A4.b		; 29 A4
	and #$61.b		; 29 61
	and #$62.b		; 29 62
	and #$63.b		; 29 63
	and #$64.b		; 29 64
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4D.b		; 29 4D
	and #$4E.b		; 29 4E
	and #$4F.b		; 29 4F
	and #$A5.b		; 29 A5
	and #$A6.b		; 29 A6
	and #$A7.b		; 29 A7
	and #$A8.b		; 29 A8
	and #$5D.b		; 29 5D
	and #$A9.b		; 29 A9
	and #$AA.b		; 29 AA
	and #$5A.b		; 29 5A
	and #$AB.b		; 29 AB
	and #$9C.b		; 29 9C
	and #$AC.b		; 29 AC
	and #$AD.b		; 29 AD
	and #$AE.b		; 29 AE
	and #$AF.b		; 29 AF
	and #$B0.b		; 29 B0
	and #$B1.b		; 29 B1
	and #$B2.b		; 29 B2
	and #$B3.b		; 29 B3
	and #$62.b		; 29 62
	and #$63.b		; 29 63
	and #$64.b		; 29 64
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$4C.b		; 29 4C
	and #$B4.b		; 29 B4
	and #$B5.b		; 29 B5
	and #$00.b		; 29 00
	jsr $29B6.w		; 20 B6 29
	lda $29.b,X		; B5 29
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	lda [$29.b],Y		; B7 29
	clv		; B8
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	lda [$29.b],Y		; B7 29
	lda $0029.w,Y		; B9 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	lda [$29.b],Y		; B7 29
	tsx		; BA
	and #$00.b		; 29 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	sta $0061.w		; 8D 61 00
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
	brk $1E.b		; 00 1E
	ora $7A.b,S		; 03 7A
	cop $00.b		; 02 00
	brk $42.b		; 00 42
	php		; 08
	lda $14.b		; A5 14
	and #$25.b		; 29 25
	sty $EF31.w		; 8C 31 EF
	and $4A52.w,X		; 3D 52 4A
	lda $56.b,X		; B5 56
	clc		; 18
	adc $7B.b,S		; 63 7B
	adc $F87FFF.l		; 6F FF 7F F8
	adc $0039DF.l,X		; 7F DF 39 00
	brk $DC.b		; 00 DC
	clc		; 18
	trb $0021.w		; 1C 21 00
	brk $42.b		; 00 42
	php		; 08
	lda $14.b		; A5 14
	and #$25.b		; 29 25
	sty $EF31.w		; 8C 31 EF
	and $4A52.w,X		; 3D 52 4A
	lda $56.b,X		; B5 56
	clc		; 18
	adc $7B.b,S		; 63 7B
	adc $F87FFF.l		; 6F FF 7F F8
	adc $0039DF.l,X		; 7F DF 39 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	php		; 08
	and ($04.b,X)		; 21 04
	and ($04.b,X)		; 21 04
	and ($04.b,X)		; 21 04
	and ($04.b,X)		; 21 04
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
	eor $000002.l,X		; 5F 02 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	bpl   0.b		; 10 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora [$FF.b],Y		; 17 FF
	sbc $435F46.l,X		; FF 46 5F 43
	eor ($55.b)		; 52 55
	eor #$53.b		; 49 53
	eor $2E.b		; 45 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($1600.w)		; 6C 00 16
	ldy #$FF16.w		; A0 16 FF
	sbc $2B172A.l,X		; FF 2A 17 2B
	ora [$2C.b],Y		; 17 2C
	ora [$FF.b],Y		; 17 FF
	sbc $2FFFFF.l,X		; FF FF FF 2F
	ora [$FF.b],Y		; 17 FF
	sbc $321731.l,X		; FF 31 17 32
	ora [$33.b],Y		; 17 33
	ora [$FF.b],Y		; 17 FF
	sbc $361735.l,X		; FF 35 17 36
	ora [$37.b],Y		; 17 37
	ora [$38.b],Y		; 17 38
	ora [$A2.b],Y		; 17 A2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	bne -62.b		; D0 C2
	ora ($22.b,X)		; 01 22
	and ($44.b,S),Y		; 33 44
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	lda ($66.b)		; B2 66
	adc $43.b		; 65 43
	and ($10.b)		; 32 10
	sbc $CBDC.w		; ED DC CB
	lda ($A9.b)		; B2 A9
	sta $AA9A.w,Y		; 99 9A AA
	ldy $EFCD.w,X		; BC CD EF
	ora ($C2.b,X)		; 01 C2
	ora ($12.b),Y		; 11 12
	and ($45.b,S),Y		; 33 45
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	jsl $EE0F21.l		; 22 21 0F EE
	jmp.w [$BBCB]		; DC CB BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $CCCC.w		; CC CC CC
	cmp $EEDE.w		; CD DE EE
	sbc $1101B2.l,X		; FF B2 01 11
	ora ($23.b),Y		; 11 23
	eor $55.b		; 45 55
	ror $65.b		; 66 65
	lda ($55.b)		; B2 55
	lsr $65.b,X		; 56 65
	.db $42, $10		; 42 10
	asl $BADC.w		; 0E DC BA
	lda ($99.b)		; B2 99
	txs		; 9A
	tax		; AA
	tyx		; BB
	cpy $EFCD.w		; CC CD EF
	cop $C2.b		; 02 C2
	jsl $554433.l		; 22 33 44 55
	lsr $66.b,X		; 56 66
	eor $54.b,X		; 55 54
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	and ($10.b,X)		; 21 10
	inc $CBED.w,X		; FE ED CB
	tsx		; BA
	lda #$99C2.w		; A9 C2 99
	sta $AB9A.w,Y		; 99 9A AB
	ldy $F0DE.w,X		; BC DE F0
	ora ($C2.b,X)		; 01 C2
	ora ($33.b)		; 12 33
	mvp $55,$44		; 44 44 55
	mvn $33,$44		; 54 44 33
	lda ($43.b)		; B2 43
	and ($10.b,X)		; 21 10
	inc $CBDC.w,X		; FE DC CB
	tsx		; BA
	sta $CCC2.w,Y		; 99 C2 CC
	cpy $DEDD.w		; CC DD DE
	inc $01FF.w		; EE FF 01
	and $C2.b,S		; 23 C2
	bit $55.b,X		; 34 55
	lsr $66.b,X		; 56 66
	eor $55.b,X		; 55 55
	mvp $B2,$43		; 44 43 B2
	mvn $21,$43		; 54 43 21
	inc $CADC.w,X		; FE DC CA
	lda #$B299.w		; A9 99 B2
	sta $AAAA.w,Y		; 99 AA AA
	tax		; AA
	ldy $F0DE.w,X		; BC DE F0
	ora ($B2.b,S),Y		; 13 B2
	mvp $66,$45		; 44 45 66
	adc [$77.b],Y		; 77 77
	adc [$65.b],Y		; 77 65
	eor $C2.b,S		; 43 C2
	ora ($11.b),Y		; 11 11
	ora $DCDDFE.l		; 0F FE DD DC
	wai		; CB
	tsx		; BA
.ACCU 16
	rep #$AB		; C2 AB
	tyx		; BB
	ldy $DDCD.w,X		; BC CD DD
	sbc $C21200.l		; EF 00 12 C2
	and $34.b,S		; 23 34
	mvp $44,$44		; 44 44 44
	mvp $43,$44		; 44 44 43
.INDEX 16
	rep #$11		; C2 11
	brk $0F.b		; 00 0F
	sbc $BBDC.w		; ED DC BB
	tyx		; BB
	tyx		; BB
	rep #$CC		; C2 CC
	cmp $EFDE.w,X		; DD DE EF
	beq   0.b		; F0 00
	ora ($22.b),Y		; 11 22
.ACCU 16
	rep #$22		; C2 22
	and ($34.b,S),Y		; 33 34
	mvp $44,$44		; 44 44 44
	eor $32.b,S		; 43 32
	lda ($43.b)		; B2 43
	and ($20.b)		; 32 20
	ora $A9BBDC.l		; 0F DC BB A9
	sta $CCC2.w,Y		; 99 C2 CC
	cpy $CDCC.w		; CC CC CD
	cmp $F0EF.w,X		; DD EF F0
	ora ($C2.b),Y		; 11 C2
	jsl $544533.l		; 22 33 45 54
	mvp $43,$44		; 44 44 43
	and ($C2.b)		; 32 C2
	ora ($00.b),Y		; 11 00
	sbc $BBCCED.l,X		; FF ED CC BB
	tyx		; BB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $DDCD.w,X		; BC CD DD
	inc $01FF.w		; EE FF 01
	ora ($C2.b)		; 12 C2
	and ($33.b,S),Y		; 33 33
	mvp $45,$44		; 44 44 45
	eor $44.b,X		; 55 44
	mvp $77,$B2		; 44 B2 77
	adc $43.b		; 65 43
	bpl  -2.b		; 10 FE
	jmp.w [$9ABA]		; DC BA 9A
	lda ($AA.b)		; B2 AA
	tyx		; BB
	cmp $EFDD.w		; CD DD EF
	beq   2.b		; F0 02
	bit $B2.b,X		; 34 B2
	mvp $77,$57		; 44 57 77
	adc [$77.b],Y		; 77 77
	adc [$76.b],Y		; 77 76
	.db $42, $C2		; 42 C2
	brk $00.b		; 00 00
	inc $CBED.w,X		; FE ED CB
	tsx		; BA
	lda #$C299.w		; A9 99 C2
	tax		; AA
	tyx		; BB
	ldy $DDCC.w,X		; BC CC DD
	inc $1201.w		; EE 01 12
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	mvp $55,$44		; 44 44 55
	ror $65.b		; 66 65
	mvn $B2,$33		; 54 33 B2
	eor $32.b,S		; 43 32
	and ($00.b,X)		; 21 00
	sbc $A9CB.w		; ED CB A9
	sta $9AB2.w,Y		; 99 B2 9A
	sta $CC9A.w,Y		; 99 9A CC
	dec $12F0.w,X		; DE F0 12
	and $C2.b,X		; 35 C2
	and ($45.b,S),Y		; 33 45
	eor $54.b,X		; 55 54
	eor $54.b,X		; 55 54
	eor $22.b,S		; 43 22
.INDEX 16
	rep #$11		; C2 11
	brk $FE.b		; 00 FE
	jmp.w [$BBCC]		; DC CC BB
	tyx		; BB
	ldy $CCC2.w,X		; BC C2 CC
	cpy $DDDD.w		; CC DD DD
	inc $FFEE.w		; EE EE FF
	brk $A2.b		; 00 A2
	beq  19.b		; F0 13
	mvp $67,$66		; 44 66 67
	adc [$66.b],Y		; 77 66
	ror $B2.b		; 66 B2
	and ($22.b)		; 32 22
	bpl  -2.b		; 10 FE
	jmp.w [$BBCB]		; DC CB BB
	cmp $DEB2.w		; CD B2 DE
	sbc $000000.l		; EF 00 00 00
	ora ($24.b),Y		; 11 24
	lsr $C2.b,X		; 56 C2
	bit $45.b,X		; 34 45
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	mvn $C2,$32		; 54 32 C2
	jsl $EDFF10.l		; 22 10 FF ED
	cpy $AABB.w		; CC BB AA
	txs		; 9A
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	tyx		; BB
	ldy $DECC.w,X		; BC CC DE
	beq   1.b		; F0 01
.ACCU 16
	rep #$22		; C2 22
	and $34.b,S		; 23 34
	eor $55.b		; 45 55
	mvn $33,$43		; 54 43 33
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	ora ($00.b),Y		; 11 00
	inc $DCED.w,X		; FE ED DC
	wai		; CB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	cmp $F0DE.w		; CD DE F0
	ora ($23.b)		; 12 23
	mvp $55,$C2		; 44 C2 55
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	adc $43.b		; 65 43
	and ($C2.b)		; 32 C2
	bpl  15.b		; 10 0F
	inc $CBDC.w		; EE DC CB
	tyx		; BB
	ldy $B2CD.w,X		; BC CD B2
	tax		; AA
	tax		; AA
	ldy $EECD.w,X		; BC CD EE
	ora ($23.b,X)		; 01 23
	mvp $44,$B2		; 44 B2 44
	mvp $44,$44		; 44 44 44
	lsr $54.b,X		; 56 54
	mvp $C2,$33		; 44 33 C2
	ora ($0F.b),Y		; 11 0F
	sbc $CCDD.w		; ED DD CC
	cpy $CCBC.w		; CC BC CC
	lda ($9A.b)		; B2 9A
	plb		; AB
	ldy $F0CE.w,X		; BC CE F0
	cop $34.b		; 02 34
	lsr $C2.b,X		; 56 C2
	bit $45.b,X		; 34 45
	eor $55.b,X		; 55 55
	lsr $65.b,X		; 56 65
	eor $32.b,S		; 43 32
.ACCU 16
	rep #$21		; C2 21
	ora $BBDCED.l		; 0F ED DC BB
	tax		; AA
	tax		; AA
	tyx		; BB
	lda ($99.b)		; B2 99
	txs		; 9A
	plb		; AB
	cmp $23E0.w		; CD E0 23
	eor $56.b		; 45 56
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($44.b,S),Y		; 33 44
	mvp $33,$44		; 44 44 33
	and ($22.b)		; 32 22
.INDEX 16
	rep #$11		; C2 11
	brk $FF.b		; 00 FF
	sbc $CCDD.w		; ED DD CC
	tyx		; BB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cmp $EEDD.w		; CD DD EE
	beq  17.b		; F0 11
	ora ($22.b),Y		; 11 22
	lda ($67.b)		; B2 67
	adc [$77.b],Y		; 77 77
	adc [$76.b],Y		; 77 76
	mvn $21,$43		; 54 43 21
	rep #$0F		; C2 0F
	sbc $CCDC.w		; ED DC CC
	cpy $CCCC.w		; CC CC CC
	cpy $99B2.w		; CC B2 99
	plb		; AB
	ldy $F0DE.w,X		; BC DE F0
	ora ($45.b,S),Y		; 13 45
	lsr $B2.b,X		; 56 B2
	adc [$77.b]		; 67 77
	adc [$77.b],Y		; 77 77
	ror $55.b,X		; 76 55
	mvp $B2,$44		; 44 44 B2
	and ($10.b)		; 32 10
	inc $BADC.w,X		; FE DC BA
	sta $AB9A.w,Y		; 99 9A AB
.INDEX 16
	rep #$DE		; C2 DE
	inc $F0EF.w		; EE EF F0
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
.INDEX 16
	rep #$55		; C2 55
	eor $65.b,X		; 55 65
	eor $55.b,X		; 55 55
	mvp $21,$32		; 44 32 21
.INDEX 16
	rep #$10		; C2 10
	inc $BBDC.w,X		; FE DC BB
	tax		; AA
	sta $ABAA.w,Y		; 99 AA AB
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cmp $EEDD.w		; CD DD EE
	beq  17.b		; F0 11
	jsl $44C233.l		; 22 33 C2 44
	mvp $54,$55		; 44 55 54
	eor $32.b,S		; 43 32
	and ($11.b,X)		; 21 11
	rep #$00		; C2 00
	ora $CCDDEE.l		; 0F EE DD CC
	tyx		; BB
	tyx		; BB
	cpy $CDC2.w		; CC C2 CD
	inc $00FF.w		; EE FF 00
	ora ($23.b)		; 12 23
	and ($44.b,S),Y		; 33 44
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	and ($21.b,S),Y		; 33 21
	bpl -62.b		; 10 C2
	inc $CCDD.w,X		; FE DD CC
	wai		; CB
	tyx		; BB
	tyx		; BB
	cpy $C2CC.w		; CC CC C2
	cpy $DDCD.w		; CC CD DD
	dec $F0EF.w,X		; DE EF F0
	brk $11.b		; 00 11
	lda ($34.b)		; B2 34
	eor $56.b,X		; 55 56
	adc [$76.b],Y		; 77 76
	ror $65.b		; 66 65
	mvn $32,$B2		; 54 B2 32
	ora $A9CBED.l		; 0F ED CB A9
	sta $9999.w,Y		; 99 99 99
.INDEX 16
	rep #$DE		; C2 DE
	inc $F0EF.w		; EE EF F0
	ora ($23.b,X)		; 01 23
	and ($44.b,S),Y		; 33 44
.INDEX 16
	rep #$55		; C2 55
	eor $66.b,X		; 55 66
	ror $65.b		; 66 65
	eor $32.b,S		; 43 32
	jsl $FE10C2.l		; 22 C2 10 FE
	sbc $CBDC.w		; ED DC CB
	tyx		; BB
	tyx		; BB
	ldy $CCC2.w,X		; BC C2 CC
	cmp $EEDD.w		; CD DD EE
	beq   0.b		; F0 00
	ora ($11.b),Y		; 11 11
	lda ($34.b)		; B2 34
	lsr $67.b,X		; 56 67
	adc [$65.b],Y		; 77 65
	mvp $43,$44		; 44 44 43
.INDEX 16
	rep #$11		; C2 11
	ora $CCDDFE.l		; 0F FE DD CC
	cpy $CCCC.w		; CC CC CC
	rep #$CD		; C2 CD
	dec $F0EF.w,X		; DE EF F0
	ora ($22.b)		; 12 22
	bit $45.b,X		; 34 45
.INDEX 16
	rep #$55		; C2 55
	ror $66.b		; 66 66
	eor $44.b,X		; 55 44
	and ($21.b)		; 32 21
	ora $DDEEC2.l		; 0F C2 EE DD
	cpy $BCCC.w		; CC CC BC
	cpy $CCCC.w		; CC CC CC
	lda ($99.b)		; B2 99
	plb		; AB
	dec $12F0.w,X		; DE F0 12
	and ($33.b,S),Y		; 33 33
	eor $B2.b		; 45 B2
	eor $55.b,X		; 55 55
	ror $66.b		; 66 66
	lsr $65.b,X		; 56 65
	eor $43.b,X		; 55 43
	lda ($20.b)		; B2 20
	inc $CBED.w,X		; FE ED CB
	tax		; AA
	tax		; AA
	plb		; AB
	ldy $EEC2.w,X		; BC C2 EE
	inc $F0EF.w		; EE EF F0
	ora ($23.b)		; 12 23
	bit $44.b,X		; 34 44
	rep #$44		; C2 44
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	and ($22.b)		; 32 22
	bpl -62.b		; 10 C2
	inc $CBED.w,X		; FE ED CB
	tsx		; BA
	lda #$AA9A.w		; A9 9A AA
	plb		; AB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $DECC.w,X		; BC CC DE
	beq  18.b		; F0 12
	and ($44.b,S),Y		; 33 44
	rep #$45		; C2 45
	eor $66.b,X		; 55 66
	eor $43.b,X		; 55 43
	and ($22.b,S),Y		; 33 22
	ora ($C2.b),Y		; 11 C2
	ora $CCDDFE.l		; 0F FE DD CC
	cpy $CCCC.w		; CC CC CC
	cpy $DDC2.w		; CC C2 DD
	inc $01F0.w		; EE F0 01
	ora ($23.b)		; 12 23
	eor $66.b		; 45 66
.ACCU 16
	rep #$65		; C2 65
	eor $55.b,X		; 55 55
	mvp $21,$32		; 44 32 21
	brk $FE.b		; 00 FE
.ACCU 16
	rep #$ED		; C2 ED
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	cpy $DECC.w		; CC CC DE
	lda ($CD.b)		; B2 CD
	sbc $231200.l		; EF 00 12 23
	and ($44.b,S),Y		; 33 44
	mvn $55,$B2		; 54 B2 55
	lsr $76.b,X		; 56 76
	mvn $33,$44		; 54 44 33
	jsl $FFC210.l		; 22 10 C2 FF
	inc $CBDD.w		; EE DD CB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
.INDEX 16
	rep #$DD		; C2 DD
	inc $01FF.w		; EE FF 01
	jsl $554423.l		; 22 23 44 55
.INDEX 16
	rep #$55		; C2 55
	ror $66.b		; 66 66
	eor $43.b,X		; 55 43
	jsl $C20F11.l		; 22 11 0F C2
	inc $CBDD.w,X		; FE DD CB
	tsx		; BA
	tax		; AA
	tyx		; BB
	cpy $C2CD.w		; CC CD C2
	dec $F0EE.w,X		; DE EE F0
	ora ($23.b),Y		; 11 23
	bit $44.b,X		; 34 44
	eor $C2.b		; 45 C2
	ror $66.b		; 66 66
	adc $54.b		; 65 54
	and ($22.b,S),Y		; 33 22
	and ($00.b,X)		; 21 00
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	jmp.w [$AABB]		; DC BB AA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $CDC2.w,X		; BC C2 CD
	dec $01F0.w,X		; DE F0 01
	and $44.b,S		; 23 44
	lsr $66.b,X		; 56 66
.INDEX 16
	rep #$55		; C2 55
	eor $54.b,X		; 55 54
	and ($22.b,S),Y		; 33 22
	ora ($0F.b),Y		; 11 0F
	sbc $DDC2.w		; ED C2 DD
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	cpy $EECD.w		; CC CD EE
.ACCU 16
	rep #$EF		; C2 EF
	sbc $231201.l,X		; FF 01 12 23
	bit $44.b,X		; 34 44
	mvp $44,$C2		; 44 C2 44
	mvp $33,$44		; 44 44 33
	jsl $FE0F11.l		; 22 11 0F FE
.ACCU 16
	rep #$ED		; C2 ED
	cpy $BBBB.w		; CC BB BB
	ldy $CDCC.w,X		; BC CC CD
	cmp $EEC2.w,X		; DD C2 EE
	sbc $2212F0.l		; EF F0 12 22
	and ($44.b,S),Y		; 33 44
	mvp $55,$C2		; 44 C2 55
	eor $54.b,X		; 55 54
	eor $21.b,S		; 43 21
	ora ($0F.b),Y		; 11 0F
	inc $DCC2.w		; EE C2 DC
	wai		; CB
	tsx		; BA
	plb		; AB
	ldy $CDCC.w,X		; BC CC CD
	cmp $EEC2.w,X		; DD C2 EE
	beq  17.b		; F0 11
	ora ($22.b)		; 12 22
	and ($44.b,S),Y		; 33 44
	mvp $45,$C2		; 44 C2 45
	eor $43.b,X		; 55 43
	and ($21.b)		; 32 21
	bpl  15.b		; 10 0F
	inc $DCC2.w,X		; FE C2 DC
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	ldy $DECC.w,X		; BC CC DE
.ACCU 16
	rep #$EF		; C2 EF
	beq  18.b		; F0 12
	and $34.b,S		; 23 34
	eor $55.b		; 45 55
	eor $C2.b,X		; 55 C2
	eor $55.b,X		; 55 55
	mvn $32,$43		; 54 43 32
	bpl  -1.b		; 10 FF
	inc $BAB2.w		; EE B2 BA
	sta $9999.w,Y		; 99 99 99
	tax		; AA
	tax		; AA
	plb		; AB
	cpy $DDB2.w		; CC B2 DD
	sbc $331200.l		; EF 00 12 33
	eor $55.b		; 45 55
	eor $B2.b,X		; 55 B2
	lsr $65.b,X		; 56 65
	eor $33.b,S		; 43 33
	and ($32.b,S),Y		; 33 32
	ora $EDC2ED.l,X		; 1F ED C2 ED
	jmp.w [$CCCC]		; DC CC CC
	cpy $DDCC.w		; CC CC DD
	cmp $EEC2.w,X		; DD C2 EE
	sbc $2312F0.l,X		; FF F0 12 23
	bit $44.b,X		; 34 44
	eor $C2.b,X		; 55 C2
	eor $55.b,X		; 55 55
	mvn $22,$32		; 54 32 22
	ora ($0F.b),Y		; 11 0F
	inc $DDC2.w		; EE C2 DD
	cpy $CCBB.w		; CC BB CC
	cpy $DECC.w		; CC CC DE
	inc $FFC2.w		; EE C2 FF
	ora ($23.b,X)		; 01 23
	and ($44.b,S),Y		; 33 44
	mvp $44,$44		; 44 44 44
.INDEX 16
	rep #$54		; C2 54
	eor $33.b,S		; 43 33
	and ($22.b)		; 32 22
	bpl  15.b		; 10 0F
	inc $EDC2.w,X		; FE C2 ED
	jmp.w [$BBCB]		; DC CB BB
	ldy $CCCC.w,X		; BC CC CC
	cmp $EEC2.w,X		; DD C2 EE
	beq   1.b		; F0 01
	jsl $444433.l		; 22 33 44 44
	eor $C2.b		; 45 C2
	eor $44.b,X		; 55 44
	and ($22.b,S),Y		; 33 22
	ora ($0F.b),Y		; 11 0F
	inc $C2DC.w		; EE DC C2
	tyx		; BB
	tax		; AA
	tax		; AA
	tyx		; BB
	cpy $EEDD.w		; CC DD EE
	sbc $01EFB2.l		; EF B2 EF 01
	and $33.b,S		; 23 33
	mvp $66,$55		; 44 55 66
	eor $B2.b,X		; 55 B2
	ror $54.b		; 66 54
	mvp $55,$55		; 44 55 55
	eor $20.b,S		; 43 20
	inc $EEC2.w,X		; FE C2 EE
	jmp.w [$CCCC]		; DC CC CC
	cmp $EEDE.w,X		; DD DE EE
	inc $F0C2.w		; EE C2 F0
	brk $12.b		; 00 12
	and $34.b,S		; 23 34
	mvp $55,$45		; 44 45 55
.INDEX 16
	rep #$54		; C2 54
	mvp $11,$32		; 44 32 11
	bpl  -2.b		; 10 FE
	cmp $C2CC.w,X		; DD CC C2
	tyx		; BB
	tsx		; BA
	tax		; AA
	plb		; AB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
.ACCU 16
	rep #$EF		; C2 EF
	beq  18.b		; F0 12
	and $33.b,S		; 23 33
	bit $44.b,X		; 34 44
	eor $C2.b,X		; 55 C2
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	and ($10.b,X)		; 21 10
	inc $C2ED.w,X		; FE ED C2
	cmp $CCCC.w,X		; DD CC CC
	cpy $CDCC.w		; CC CC CD
	inc $C2EF.w		; EE EF C2
	beq  18.b		; F0 12
	and $44.b,S		; 23 44
	lsr $77.b,X		; 56 77
	ror $66.b,X		; 76 66
.ACCU 16
	rep #$65		; C2 65
	mvn $32,$44		; 54 44 32
	and ($0E.b,X)		; 21 0E
	jmp.w [$C2CC]		; DC CC C2
	tyx		; BB
	plb		; AB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
	inc $B2FF.w		; EE FF B2
	beq  17.b		; F0 11
	jsl $674523.l		; 22 23 45 67
	ror $77.b,X		; 76 77
	lda ($65.b)		; B2 65
	and ($22.b,S),Y		; 33 22
	and ($10.b,X)		; 21 10
	sbc $99BA.w		; ED BA 99
	rep #$CC		; C2 CC
	cpy $CDCC.w		; CC CC CD
	cmp $EFEE.w,X		; DD EE EF
	sbc $1200C2.l,X		; FF C2 00 12
	and $34.b,S		; 23 34
	eor $55.b,X		; 55 55
	eor $54.b,X		; 55 54
	rep #$44		; C2 44
	and ($21.b,S),Y		; 33 21
	bpl  -2.b		; 10 FE
	cmp $CCDC.w,X		; DD DC CC
	rep #$CB		; C2 CB
	tax		; AA
	tax		; AA
	plb		; AB
	tyx		; BB
	cpy $DECD.w		; CC CD DE
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ora ($23.b)		; 12 23
	mvp $55,$45		; 44 45 55
	ror $66.b		; 66 66
.INDEX 16
	rep #$54		; C2 54
	and ($21.b)		; 32 21
	ora ($10.b),Y		; 11 10
	inc $DDED.w,X		; FE ED DD
	rep #$CC		; C2 CC
	cpy $DDDD.w		; CC DD DD
	dec $F0EF.w,X		; DE EF F0
	ora ($C2.b,X)		; 01 C2
	jsl $553423.l		; 22 23 34 55
	adc [$66.b]		; 67 66
	ror $55.b		; 66 55
	rep #$44		; C2 44
	and ($21.b)		; 32 21
	brk $FE.b		; 00 FE
	jmp.w [$CBCC]		; DC CC CB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $CDCC.w		; CC CC CD
	dec $EFEE.w,X		; DE EE EF
	sbc $1101B2.l,X		; FF B2 01 11
	ora ($12.b),Y		; 11 12
	jsl $443433.l		; 22 33 34 44
	lda ($33.b)		; B2 33
	and ($33.b,S),Y		; 33 33
	and ($1F.b)		; 32 1F
	sbc $BADC.w		; ED DC BA
	rep #$CC		; C2 CC
	cpy $CCCC.w		; CC CC CC
	cmp $DEDD.w		; CD DD DE
	beq -62.b		; F0 C2
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
.INDEX 16
	rep #$54		; C2 54
	and ($22.b,S),Y		; 33 22
	bpl  -2.b		; 10 FE
	sbc $BACB.w		; ED CB BA
.ACCU 16
	rep #$A9		; C2 A9
	sta $AA9A.w,Y		; 99 9A AA
	tyx		; BB
	cpy $DECD.w		; CC CD DE
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ora ($23.b)		; 12 23
	mvp $66,$45		; 44 45 66
	ror $66.b		; 66 66
.INDEX 16
	rep #$54		; C2 54
	mvp $22,$43		; 44 43 22
	bpl  15.b		; 10 0F
	inc $B2DD.w		; EE DD B2
	sta $9999.w,Y		; 99 99 99
	sta $EFAC.w,Y		; 99 AC EF
	ora ($34.b,X)		; 01 34
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	eor $66.b,X		; 55 66
	adc [$77.b],Y		; 77 77
	ror $66.b,X		; 76 66
	eor $C2.b,X		; 55 C2
	eor $22.b,S		; 43 22
	bpl  -1.b		; 10 FF
	sbc $BBCC.w		; ED CC BB
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	plb		; AB
	tyx		; BB
	cpy $EEDD.w		; CC DD EE
	inc $B2FF.w		; EE FF B2
	cop $34.b		; 02 34
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	ror $64.b		; 66 64
.ACCU 16
	rep #$22		; C2 22
	ora ($00.b),Y		; 11 00
	ora $CCDDFE.l		; 0F FE DD CC
	tyx		; BB
.ACCU 16
	rep #$AB		; C2 AB
	ldy $DDCC.w,X		; BC CC DD
	inc $00FF.w		; EE FF 00
	ora ($C2.b),Y		; 11 C2
	and $34.b,S		; 23 34
	eor $55.b		; 45 55
	eor $55.b,X		; 55 55
	mvn $C2,$44		; 54 44 C2
	and ($22.b)		; 32 22
	ora ($0F.b),Y		; 11 0F
	jmp.w [$BBCB]		; DC CB BB
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	plb		; AB
	cpy $EEDE.w		; CC DE EE
	sbc $C212F0.l		; EF F0 12 C2
	and $34.b,S		; 23 34
	mvp $55,$44		; 44 44 55
	eor $54.b,X		; 55 54
	eor $C2.b,S		; 43 C2
	jsl $0F1121.l		; 22 21 11 0F
	sbc $CCDC.w		; ED DC CC
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $CDCC.w		; CC CC CD
	inc $00FF.w		; EE FF 00
	ora ($C2.b),Y		; 11 C2
	jsl $555534.l		; 22 34 55 55
	mvp $33,$43		; 44 43 33
	jsl $0011C2.l		; 22 C2 11 00
	sbc $CCDCED.l,X		; FF ED DC CC
	tyx		; BB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	tyx		; BB
	cpy $EEDD.w		; CC DD EE
	beq  17.b		; F0 11
.ACCU 16
	rep #$23		; C2 23
	and ($34.b,S),Y		; 33 34
	eor $55.b		; 45 55
	eor $55.b,X		; 55 55
	mvp $77,$B2		; 44 B2 77
	ror $66.b		; 66 66
	eor ($10.b,S),Y		; 53 10
	sbc $A9CB.w		; ED CB A9
	lda ($9A.b)		; B2 9A
	lda #$BC99.w		; A9 99 BC
	cmp $12E0.w		; CD E0 12
	eor $C2.b		; 45 C2
	bit $55.b,X		; 34 55
	ror $66.b		; 66 66
	ror $65.b		; 66 65
	eor $43.b,X		; 55 43
.ACCU 16
	rep #$21		; C2 21
	brk $FE.b		; 00 FE
	wai		; CB
	tax		; AA
	tax		; AA
	sta $C299.w,Y		; 99 99 C2
	txs		; 9A
	tax		; AA
	plb		; AB
	ldy $DDCD.w,X		; BC CD DD
	sbc $12C200.l		; EF 00 C2 12
	and ($44.b,S),Y		; 33 44
	eor $55.b		; 45 55
	eor $54.b,X		; 55 54
	and ($C2.b)		; 32 C2
	jsl $0F1122.l		; 22 22 11 0F
	inc $DCDD.w		; EE DD DC
	cpy $CCC2.w		; CC C2 CC
	cpy $DECC.w		; CC CC DE
	inc $01FF.w		; EE FF 01
	jsl $5534C2.l		; 22 C2 34 55
	ror $76.b		; 66 76
	ror $55.b		; 66 55
	mvn $C2,$33		; 54 33 C2
	and ($00.b,X)		; 21 00
	inc $BBDC.w,X		; FE DC BB
	tsx		; BA
	tax		; AA
	tyx		; BB
	lda ($99.b)		; B2 99
	tax		; AA
	ldy $01EF.w,X		; BC EF 01
	jsl $B25644.l		; 22 44 56 B2
	adc $55.b		; 65 55
	eor $66.b,X		; 55 66
	lsr $66.b,X		; 56 66
	mvn $C2,$44		; 54 44 C2
	and ($11.b,X)		; 21 11
	bpl  -2.b		; 10 FE
	cmp $BBDC.w,X		; DD DC BB
	tyx		; BB
	rep #$CC		; C2 CC
	cmp $EEEE.w		; CD EE EE
	sbc $221200.l		; EF 00 12 22
	lda ($45.b)		; B2 45
	adc [$77.b]		; 67 77
	ror $66.b		; 66 66
	adc $55.b		; 65 55
	.db $42, $C2		; 42 C2
	bpl   0.b		; 10 00
	inc $CCDD.w,X		; FE DD CC
	tyx		; BB
	tax		; AA
	plb		; AB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $DDCD.w		; CC CD DD
	inc $01FF.w		; EE FF 01
	and $C2.b,S		; 23 C2
	mvp $67,$56		; 44 56 67
	adc [$77.b],Y		; 77 77
	adc [$65.b],Y		; 77 65
	mvp $43,$C2		; 44 C2 43
	and ($11.b)		; 32 11
	ora $BBCCED.l		; 0F ED CC BB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	ldy $DECD.w,X		; BC CD DE
	sbc $C21201.l,X		; FF 01 12 C2
	and ($45.b,S),Y		; 33 45
	eor $55.b,X		; 55 55
	mvp $22,$43		; 44 43 22
	ora ($C2.b),Y		; 11 C2
	bpl  15.b		; 10 0F
	jmp.w [$BBCB]		; DC CB BB
	tax		; AA
	plb		; AB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cpy $EEDE.w		; CC DE EE
	beq   1.b		; F0 01
	jsl $44C233.l		; 22 33 C2 44
	eor $55.b		; 45 55
	eor $55.b,X		; 55 55
	mvn $33,$43		; 54 43 33
	lda ($44.b)		; B2 44
	and ($0E.b)		; 32 0E
	sbc $A9CB.w		; ED CB A9
	sta $B299.w,Y		; 99 99 B2
	sta $BC9A.w,Y		; 99 9A BC
	cmp $01EF.w		; CD EF 01
	bit $67.b		; 24 67
	rep #$45		; C2 45
	eor $54.b,X		; 55 54
	mvp $44,$44		; 44 44 44
	and ($11.b)		; 32 11
	rep #$00		; C2 00
	sbc $BBCC.w,X		; FD CC BB
	tax		; AA
	lda #$AA99.w		; A9 99 AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $DDCD.w,X		; BC CD DD
	sbc $342201.l		; EF 01 22 34
	rep #$44		; C2 44
	eor $55.b		; 45 55
	eor $55.b,X		; 55 55
	eor $32.b,S		; 43 32
	ora ($C2.b),Y		; 11 C2
	bpl  15.b		; 10 0F
	inc $CCDD.w,X		; FE DD CC
	wai		; CB
	ldy $C2CC.w,X		; BC CC C2
	cpy $EEDD.w		; CC DD EE
	sbc $231200.l,X		; FF 00 12 23
	eor $C2.b		; 45 C2
	lsr $66.b,X		; 56 66
	ror $55.b		; 66 55
	eor $44.b,X		; 55 44
	and ($10.b)		; 32 10
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	sbc $BACB.w		; ED CB BA
	tax		; AA
	tax		; AA
	ldy $B2CC.w,X		; BC CC B2
	sta $CCAB.w,Y		; 99 AB CC
	cmp $443401.l,X		; DF 01 34 44
	eor $B2.b,X		; 55 B2
	ror $77.b		; 66 77
	adc [$66.b],Y		; 77 66
	ror $44.b		; 66 44
	mvp $B2,$43		; 44 43 B2
	and ($21.b,S),Y		; 33 21
	ora $B9DCEE.l		; 0F EE DC B9
	sta $B2AA.w,Y		; 99 AA B2
	tyx		; BB
	cpy $CDCB.w		; CC CB CD
	inc $3401.w		; EE 01 34
	eor $B2.b		; 45 B2
	ror $76.b		; 66 76
	ror $77.b		; 66 77
	ror $64.b,X		; 76 64
	and ($00.b,X)		; 21 00
	rep #$0F		; C2 0F
	inc $CBDD.w		; EE DD CB
	tsx		; BA
	tax		; AA
	tax		; AA
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cmp $EFDE.w		; CD DE EF
	ora ($12.b,X)		; 01 12
	and $45.b,S		; 23 45
.INDEX 16
	rep #$55		; C2 55
	lsr $66.b,X		; 56 66
	ror $65.b		; 66 65
	eor $33.b,S		; 43 33
	and ($B2.b)		; 32 B2
	eor $21.b,S		; 43 21
	ora $AADCFE.l		; 0F FE DC AA
	sta $C299.w,Y		; 99 99 C2
	cmp $EEDE.w,X		; DD DE EE
	beq   1.b		; F0 01
	and $34.b,S		; 23 34
	mvp $55,$C2		; 44 C2 55
	eor $55.b,X		; 55 55
	mvp $22,$43		; 44 43 22
	and ($10.b,X)		; 21 10
	rep #$0F		; C2 0F
	sbc $BBCC.w		; ED CC BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $DDDD.w		; CC DD DD
	sbc $1200FF.l		; EF FF 00 12
	lda ($44.b)		; B2 44
	mvp $44,$44		; 44 44 44
	eor $22.b,S		; 43 22
	and ($00.b,X)		; 21 00
	lda ($FF.b)		; B2 FF
	sbc $BACB.w		; ED CB BA
	lda #$9999.w		; A9 99 99
	tax		; AA
	lda ($BB.b)		; B2 BB
	wai		; CB
	ldy $01DF.w,X		; BC DF 01
	bit $56.b		; 24 56
	adc [$C2.b]		; 67 C2
	eor $56.b,X		; 55 56
	adc [$77.b]		; 67 77
	adc [$65.b],Y		; 77 65
	and ($22.b,S),Y		; 33 22
.INDEX 16
	rep #$10		; C2 10
	inc $CCDC.w,X		; FE DC CC
	wai		; CB
	tyx		; BB
	cpy $B2CC.w		; CC CC B2
	plb		; AB
	ldy $F0DE.w,X		; BC DE F0
	bit $55.b		; 24 55
	adc $66.b		; 65 66
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	mvp $55,$55		; 44 55 55
	eor $32.b,S		; 43 32
	jsl $10C221.l		; 22 21 C2 10
	inc $CCDD.w,X		; FE DD CC
	tyx		; BB
	tax		; AA
	tax		; AA
	tax		; AA
.ACCU 16
	rep #$AB		; C2 AB
	cmp $F0DE.w		; CD DE F0
	ora ($22.b),Y		; 11 22
	bit $45.b,X		; 34 45
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	mvp $22,$43		; 44 43 22
	bpl  15.b		; 10 0F
.ACCU 16
	rep #$ED		; C2 ED
	jmp.w [$AABB]		; DC BB AA
	tax		; AA
	tyx		; BB
	cpy $B2CD.w		; CC CD B2
	plb		; AB
	ldy $F1DE.w,X		; BC DE F1
	and $44.b,S		; 23 44
	mvn $B2,$56		; 54 56 B2
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc $67.b		; 65 67
	ror $55.b		; 66 55
	lda ($32.b)		; B2 32
	ora $A9CBEE.l		; 0F EE CB A9
	sta $9A99.w,Y		; 99 99 9A
	lda ($AB.b)		; B2 AB
	ldy $F0DE.w,X		; BC DE F0
	ora ($24.b,X)		; 01 24
	lsr $77.b,X		; 56 77
	rep #$45		; C2 45
	eor $55.b,X		; 55 55
	mvn $33,$43		; 54 43 33
	jsl $21B221.l		; 22 21 B2 21
	asl $CCDD.w		; 0E DD CC
	tsx		; BA
	sta $AA99.w,Y		; 99 99 AA
.INDEX 16
	rep #$DE		; C2 DE
	inc $F0EF.w		; EE EF F0
	ora ($11.b),Y		; 11 11
	and $34.b,S		; 23 34
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	mvn $32,$43		; 54 43 32
	jsl $FEC210.l		; 22 10 C2 FE
	sbc $BBCC.w		; ED CC BB
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
	lda ($99.b)		; B2 99
	txs		; 9A
	ldy $F0DE.w,X		; BC DE F0
	ora ($11.b),Y		; 11 11
	ora ($B2.b)		; 12 B2
	bit $55.b,X		; 34 55
	lsr $66.b,X		; 56 66
	eor $55.b,X		; 55 55
	ror $54.b		; 66 54
	lda ($21.b)		; B2 21
	brk $ED.b		; 00 ED
	wai		; CB
	lda #$AA99.w		; A9 99 AA
	plb		; AB
.ACCU 16
	rep #$EE		; C2 EE
	inc $F0EF.w		; EE EF F0
	ora ($23.b)		; 12 23
	bit $45.b,X		; 34 45
.INDEX 16
	rep #$55		; C2 55
	ror $65.b		; 66 65
	eor $43.b,X		; 55 43
	jsl $C20F11.l		; 22 11 0F C2
	inc $BBDC.w		; EE DC BB
	tax		; AA
	sta $9999.w,Y		; 99 99 99
	tax		; AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cmp $00EF.w		; CD EF 00
	ora ($23.b),Y		; 11 23
	bit $44.b,X		; 34 44
	rep #$45		; C2 45
	eor $44.b,X		; 55 44
	eor $32.b,S		; 43 32
	and ($10.b,X)		; 21 10
	ora $EEFFC2.l		; 0F C2 FF EE
	sbc $CCDD.w		; ED DD CC
	cpy $DDCD.w		; CC CD DD
.ACCU 16
	rep #$EE		; C2 EE
	sbc $3312F0.l		; EF F0 12 33
	eor $55.b		; 45 55
	ror $C2.b		; 66 C2
	adc $55.b		; 65 55
	mvn $33,$44		; 54 44 33
	jsl $B21011.l		; 22 11 10 B2
	sbc $AACC.w		; ED CC AA
	sta $9A99.w,Y		; 99 99 9A
	tax		; AA
	tax		; AA
	lda ($AB.b)		; B2 AB
	cmp $01EF.w		; CD EF 01
	bit $44.b,X		; 34 44
	lsr $67.b,X		; 56 67
	lda ($77.b)		; B2 77
	adc [$76.b],Y		; 77 76
	mvn $22,$33		; 54 33 22
	bpl  -2.b		; 10 FE
.ACCU 16
	rep #$ED		; C2 ED
	cmp $BBCC.w,X		; DD CC BB
	tax		; AA
	tyx		; BB
	tyx		; BB
	cpy $DDC2.w		; CC C2 DD
	dec $01F0.w,X		; DE F0 01
	jsl $444433.l		; 22 33 44 44
	rep #$44		; C2 44
	mvp $44,$44		; 44 44 44
	and ($10.b),Y		; 31 10
	brk $FE.b		; 00 FE
.INDEX 16
	rep #$DD		; C2 DD
	wai		; CB
	tyx		; BB
	tyx		; BB
	ldy $DDCD.w,X		; BC CD DD
	inc $DEB2.w		; EE B2 DE
	beq  18.b		; F0 12
	bit $44.b,X		; 34 44
	lsr $67.b,X		; 56 67
	adc [$C2.b],Y		; 77 C2
	mvp $44,$44		; 44 44 44
	and ($22.b,S),Y		; 33 22
	and ($11.b,X)		; 21 11
	brk $C2.b		; 00 C2
	sbc $CCDDEE.l,X		; FF EE DD CC
	cpy $CCCC.w		; CC CC CC
	cpy $DDC2.w		; CC C2 DD
	dec $01FF.w,X		; DE FF 01
	ora ($23.b)		; 12 23
	bit $55.b,X		; 34 55
	rep #$44		; C2 44
	mvp $33,$44		; 44 44 33
	and ($10.b,X)		; 21 10
	ora $DCC2FE.l		; 0F FE C2 DC
	wai		; CB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	cpy $C2DD.w		; CC DD C2
	dec $F0EF.w,X		; DE EF F0
	ora ($23.b),Y		; 11 23
	and ($34.b,S),Y		; 33 34
	mvp $44,$C2		; 44 C2 44
	eor $54.b,X		; 55 54
	mvp $33,$44		; 44 44 33
	and ($10.b)		; 32 10
	lda ($0F.b)		; B2 0F
	sbc $A9CB.w		; ED CB A9
	tax		; AA
	plb		; AB
	ldy $B2DD.w,X		; BC DD B2
	dec $00FF.w,X		; DE FF 00
	and $44.b,S		; 23 44
	eor $77.b		; 45 77
	adc [$B2.b],Y		; 77 B2
	adc [$77.b],Y		; 77 77
	adc [$64.b],Y		; 77 64
	and ($11.b,X)		; 21 11
	ora $DCC2DB.l		; 0F DB C2 DC
	tyx		; BB
	tax		; AA
	sta $AB9A.w,Y		; 99 9A AB
	tyx		; BB
	cpy $CDC2.w		; CC C2 CD
	dec $11E0.w,X		; DE E0 11
	and $34.b,S		; 23 34
	mvp $C2,$45		; 44 45 C2
	lsr $66.b,X		; 56 66
	eor $43.b,X		; 55 43
	and ($21.b)		; 32 21
	ora ($00.b),Y		; 11 00
	lda ($0E.b)		; B2 0E
	jmp.w [$99BA]		; DC BA 99
	sta $99A9.w,Y		; 99 A9 99
	ldy $EEC2.w		; AC C2 EE
	beq   1.b		; F0 01
	ora ($23.b)		; 12 23
	bit $55.b,X		; 34 55
	eor $C2.b,X		; 55 C2
	eor $55.b		; 45 55
	mvp $21,$32		; 44 32 21
	bpl  15.b		; 10 0F
	sbc $CCC2.w		; ED C2 CC
	wai		; CB
	tyx		; BB
	tyx		; BB
	cpy $CDCC.w		; CC CC CD
	cmp $BCB2.w,X		; DD B2 BC
	cpy $F0DE.w		; CC DE F0
	brk $01.b		; 00 01
	ora ($23.b)		; 12 23
	ldx #$7766.w		; A2 66 77
	ror $66.b,X		; 76 66
	adc $54.b		; 65 54
	and ($FD.b),Y		; 31 FD
	lda ($ED.b)		; B2 ED
	cpy $BCBB.w		; CC BB BC
	cmp $F0EE.w,X		; DD EE F0
	brk $C2.b		; 00 C2
	brk $00.b		; 00 00
	ora ($22.b),Y		; 11 22
	and ($44.b,S),Y		; 33 44
	eor $55.b,X		; 55 55
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	eor $22.b,S		; 43 22
	and ($0F.b,X)		; 21 0F
	inc $DCC2.w,X		; FE C2 DC
	wai		; CB
	tsx		; BA
	lda #$AAAA.w		; A9 AA AA
	plb		; AB
	tyx		; BB
	rep #$CC		; C2 CC
	cmp $00EF.w		; CD EF 00
	ora ($22.b)		; 12 22
	and ($44.b,S),Y		; 33 44
.INDEX 16
	rep #$55		; C2 55
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	and ($10.b,X)		; 21 10
	ora $DDEEC2.l		; 0F C2 EE DD
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	ldy $C2DD.w,X		; BC DD C2
	sbc $342201.l		; EF 01 22 34
	eor $56.b		; 45 56
	ror $66.b		; 66 66
.ACCU 16
	rep #$66		; C2 66
	ror $54.b		; 66 54
	and ($21.b,S),Y		; 33 21
	brk $FE.b		; 00 FE
	sbc $CCC2.w		; ED C2 CC
	tyx		; BB
	tyx		; BB
	cpy $DDDD.w		; CC DD DD
	cmp $B2EE.w,X		; DD EE B2
	dec $12E0.w,X		; DE E0 12
	bit $44.b,X		; 34 44
	mvp $44,$44		; 44 44 44
	lda ($45.b)		; B2 45
	adc $44.b		; 65 44
	eor $32.b,S		; 43 32
	jsr $AAEC.w		; 20 EC AA
.INDEX 16
	rep #$DC		; C2 DC
	cpy $CCCB.w		; CC CB CC
	cmp $DEDD.w		; CD DD DE
	inc $F0C2.w		; EE C2 F0
	brk $11.b		; 00 11
	jsl $554433.l		; 22 33 44 55
	eor $C2.b,X		; 55 C2
	eor $66.b,X		; 55 66
	mvn $22,$33		; 54 33 22
	bpl  -2.b		; 10 FE
	cmp $CBC2.w,X		; DD C2 CB
	tsx		; BA
	tax		; AA
	plb		; AB
	ldy $DDCD.w,X		; BC CD DD
	dec $EFC2.w,X		; DE C2 EF
	ora ($22.b,X)		; 01 22
	and $33.b,S		; 23 33
	and ($34.b,S),Y		; 33 34
	mvp $44,$C2		; 44 C2 44
	eor $33.b,S		; 43 33
	jsl $0F1021.l		; 22 21 10 0F
	inc $DDC2.w,X		; FE C2 DD
	jmp.w [$BBCB]		; DC CB BB
	tyx		; BB
	cpy $DEDD.w		; CC DD DE
	lda ($DF.b)		; B2 DF
	cop $22.b		; 02 22
	bit $56.b,X		; 34 56
	adc [$77.b],Y		; 77 77
	adc [$B2.b],Y		; 77 B2
	adc [$65.b],Y		; 77 65
	mvp $10,$32		; 44 32 10
	cpx $99BA.w		; EC BA 99
	rep #$CC		; C2 CC
	cpy $CCCC.w		; CC CC CC
	cpy $DECD.w		; CC CD DE
	inc $EFB2.w		; EE B2 EF
	ora ($34.b,X)		; 01 34
	eor $66.b,X		; 55 66
	adc [$77.b],Y		; 77 77
	adc [$B2.b],Y		; 77 B2
	adc [$65.b],Y		; 77 65
	mvn $43,$44		; 54 44 43
	and ($0F.b,X)		; 21 0F
	sbc $CBB2.w		; ED B2 CB
	lda #$AA99.w		; A9 99 AA
	tyx		; BB
	ldy $EFDD.w,X		; BC DD EF
	rep #$00		; C2 00
	ora ($23.b),Y		; 11 23
	bit $45.b,X		; 34 45
	eor $56.b,X		; 55 56
	eor $C2.b,X		; 55 C2
	eor $54.b,X		; 55 54
	eor $22.b,S		; 43 22
	ora ($0F.b),Y		; 11 0F
	sbc $C2CB.w		; ED CB C2
	tsx		; BA
	lda #$AA9A.w		; A9 9A AA
	tyx		; BB
	cpy $DEDD.w		; CC DD DE
.ACCU 16
	rep #$EF		; C2 EF
	ora ($12.b,X)		; 01 12
	and $34.b,S		; 23 34
	mvp $55,$45		; 44 45 55
	rep #$44		; C2 44
	and ($22.b,S),Y		; 33 22
	ora ($10.b),Y		; 11 10
	brk $FE.b		; 00 FE
	sbc $DCC2.w		; ED C2 DC
	wai		; CB
	tyx		; BB
	ldy $DECC.w,X		; BC CC DE
	sbc $01C2F0.l		; EF F0 C2 01
	jsl $453433.l		; 22 33 34 45
	eor $55.b,X		; 55 55
	eor $C2.b,X		; 55 C2
	mvn $32,$43		; 54 43 32
	ora ($0F.b),Y		; 11 0F
	sbc $CCDC.w		; ED DC CC
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
	cpy $DDDD.w		; CC DD DD
	lda ($BD.b)		; B2 BD
	sbc $231101.l		; EF 01 11 23
	eor $55.b		; 45 55
	adc [$B2.b]		; 67 B2
	adc [$66.b],Y		; 77 66
	ror $55.b		; 66 55
	eor $20.b,S		; 43 20
	inc $B2DC.w,X		; FE DC B2
	tsx		; BA
	sta $9999.w,Y		; 99 99 99
	txs		; 9A
	cpy $EFCD.w		; CC CD EF
	rep #$00		; C2 00
	ora ($33.b)		; 12 33
	bit $45.b,X		; 34 45
	eor $56.b,X		; 55 56
	ror $C2.b		; 66 C2
	ror $54.b		; 66 54
	and ($22.b,S),Y		; 33 22
	and ($0F.b,X)		; 21 0F
	inc $C2DD.w		; EE DD C2
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
	dec $CEB2.w,X		; DE B2 CE
	beq  17.b		; F0 11
	jsl $664533.l		; 22 33 45 66
	adc [$B2.b],Y		; 77 B2
	ror $54.b,X		; 76 54
	mvp $32,$44		; 44 44 32
	bpl  -3.b		; 10 FD
	wai		; CB
.INDEX 16
	rep #$DC		; C2 DC
	cpy $CCCC.w		; CC CC CC
	cpy $EEDD.w		; CC DD EE
	sbc $2201C2.l,X		; FF C2 01 22
	and $44.b,S		; 23 44
	eor $56.b,X		; 55 56
	ror $65.b		; 66 65
.INDEX 16
	rep #$54		; C2 54
	eor $22.b,S		; 43 22
	bpl  -2.b		; 10 FE
	sbc $CCDC.w		; ED DC CC
	rep #$CB		; C2 CB
	cpy $CCCC.w		; CC CC CC
	cmp $EEDD.w		; CD DD EE
	sbc $2301B2.l,X		; FF B2 01 23
	and ($34.b,S),Y		; 33 34
	eor $55.b,X		; 55 55
	lsr $66.b,X		; 56 66
	lda ($65.b)		; B2 65
	ror $55.b		; 66 55
	mvn $0F,$32		; 54 32 0F
	inc $B2DC.w		; EE DC B2
	tsx		; BA
	tax		; AA
	tax		; AA
	tyx		; BB
	cpy $CDCC.w		; CC CC CD
	dec $01C2.w,X		; DE C2 01
	jsl $444433.l		; 22 33 44 44
	eor $55.b		; 45 55
	eor $C2.b,X		; 55 C2
	mvn $22,$43		; 54 43 22
	and ($0F.b,X)		; 21 0F
	inc $BBDC.w		; EE DC BB
.ACCU 16
	rep #$AA		; C2 AA
	sta $AAAA.w,Y		; 99 AA AA
	tyx		; BB
	tyx		; BB
	cpy $C2CD.w		; CC CD C2
	sbc $342301.l		; EF 01 23 34
	mvp $56,$55		; 44 55 56
	adc $C2.b		; 65 C2
	mvn $32,$33		; 54 33 32
	and ($10.b,X)		; 21 10
	sbc $C2DCED.l,X		; FF ED DC C2
	cpy $CCCC.w		; CC CC CC
	cpy $DECD.w		; CC CD DE
	sbc $11C200.l		; EF 00 C2 11
	jsl $665634.l		; 22 34 56 66
	eor $55.b,X		; 55 55
	mvn $43,$C2		; 54 C2 43
	jsl $EE0F10.l		; 22 10 0F EE
	jmp.w [$BBCB]		; DC CB BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $CDCC.w,X		; BC CC CD
	inc $F0FF.w		; EE FF F0
	brk $B2.b		; 00 B2
	jsl $453433.l		; 22 33 34 45
	eor $55.b		; 45 55
	adc [$65.b]		; 67 65
.ACCU 16
	rep #$22		; C2 22
	and ($11.b,X)		; 21 11
	ora ($0F.b),Y		; 11 0F
	inc $DCED.w,X		; FE ED DC
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $CDCC.w,X		; BC CC CD
	cmp $EFDE.w,X		; DD DE EF
	beq -62.b		; F0 C2
	ora ($22.b)		; 12 22
	bit $45.b,X		; 34 45
	eor $56.b,X		; 55 56
	ror $65.b		; 66 65
.INDEX 16
	rep #$54		; C2 54
	and ($21.b)		; 32 21
	bpl  -1.b		; 10 FF
	sbc $BBDC.w		; ED DC BB
.ACCU 16
	rep #$AA		; C2 AA
	plb		; AB
	ldy $DDCC.w,X		; BC CC DD
	inc $01EF.w		; EE EF 01
.INDEX 16
	rep #$12		; C2 12
	and ($44.b,S),Y		; 33 44
	mvp $66,$56		; 44 56 66
	ror $55.b		; 66 55
	rep #$43		; C2 43
	and ($22.b)		; 32 22
	bpl  15.b		; 10 0F
	sbc $BACB.w		; ED CB BA
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	tax		; AA
	plb		; AB
	cpy $EFDD.w		; CC DD EF
	brk $C2.b		; 00 C2
	ora ($34.b)		; 12 34
	eor $66.b		; 45 66
	adc $55.b		; 65 55
	eor $43.b,X		; 55 43
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	and ($10.b,X)		; 21 10
	inc $DCDD.w,X		; FE DD DC
	wai		; CB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $DECC.w,X		; BC CC DE
	inc $F0FF.w		; EE FF F0
	ora ($C2.b),Y		; 11 C2
	jsl $444433.l		; 22 33 44 44
	mvp $44,$44		; 44 44 44
	eor $C2.b,S		; 43 C2
	and ($21.b)		; 32 21
	bpl  -1.b		; 10 FF
	inc $CBDC.w		; EE DC CB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $DDCC.w		; CC CC DD
	dec $FFEE.w,X		; DE EE FF
	ora ($C2.b,X)		; 01 C2
	jsl $443423.l		; 22 23 34 44
	eor $55.b		; 45 55
	eor $44.b,X		; 55 44
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	ora ($10.b),Y		; 11 10
	inc $CCED.w,X		; FE ED CC
	tyx		; BB
	tax		; AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $DDCC.w		; CC CC DD
	dec $01EF.w,X		; DE EF 01
	ora ($C2.b),Y		; 11 C2
	jsl $443423.l		; 22 23 34 44
	mvp $54,$55		; 44 55 54
	and ($C2.b,S),Y		; 33 C2
	jsl $FF0011.l		; 22 11 00 FF
	sbc $CBCC.w		; ED CC CB
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	cpy $EECD.w		; CC CD EE
	sbc $C22201.l,X		; FF 01 22 C2
	and ($44.b,S),Y		; 33 44
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	lda ($75.b)		; B2 75
	.db $42, $1F		; 42 1F
	jmp.w [$A9BB]		; DC BB A9
	sta $B299.w,Y		; 99 99 B2
	txs		; 9A
	tax		; AA
	tax		; AA
	ldy $DECD.w,X		; BC CD DE
	beq   1.b		; F0 01
	lda ($23.b)		; B2 23
	bit $55.b,X		; 34 55
	eor $55.b,X		; 55 55
	ror $54.b		; 66 54
	and ($C2.b,S),Y		; 33 C2
	ora ($22.b)		; 12 22
	bpl  -1.b		; 10 FF
	inc $CCDD.w		; EE DD CC
	cpy $CCC2.w		; CC C2 CC
	cpy $DDCD.w		; CC CD DD
	dec $FFEF.w,X		; DE EF FF
	ora ($C2.b,X)		; 01 C2
	jsl $454433.l		; 22 33 44 45
	eor $55.b,X		; 55 55
	eor $43.b,X		; 55 43
.ACCU 16
	rep #$22		; C2 22
	and ($10.b,X)		; 21 10
	inc $DCED.w,X		; FE ED DC
	wai		; CB
	ldy $CCC2.w,X		; BC C2 CC
	cpy $EECD.w		; CC CD EE
	sbc $3312F0.l		; EF F0 12 33
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	mvp $44,$44		; 44 44 44
	eor $44.b		; 45 44
	and ($33.b,S),Y		; 33 33
.ACCU 16
	rep #$22		; C2 22
	and ($00.b,X)		; 21 00
	sbc $CCDDEE.l,X		; FF EE DD CC
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $CDCC.w		; CC CC CD
	dec $00EF.w,X		; DE EF 00
	ora ($C2.b)		; 12 C2
	and $34.b,S		; 23 34
	mvp $55,$44		; 44 44 55
	mvn $32,$43		; 54 43 32
.ACCU 16
	rep #$21		; C2 21
	bpl  -2.b		; 10 FE
	sbc $BACB.w		; ED CB BA
	tax		; AA
	plb		; AB
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cmp $EEDE.w		; CD DE EE
	sbc $1211F0.l,X		; FF F0 11 12
	lda ($34.b)		; B2 34
	eor $56.b		; 45 56
	adc $56.b		; 65 56
	adc $44.b		; 65 44
	eor $C2.b		; 45 C2
	jsl $002122.l		; 22 22 21 00
	inc $CCED.w,X		; FE ED CC
	cpy $99B2.w		; CC B2 99
	txs		; 9A
	ldy $DECC.w,X		; BC CC DE
	beq  18.b		; F0 12
	bit $C2.b,X		; 34 C2
	and ($44.b,S),Y		; 33 44
	mvp $55,$55		; 44 55 55
	mvp $21,$43		; 44 43 21
.INDEX 16
	rep #$11		; C2 11
	ora $CBDCED.l		; 0F ED DC CB
	tyx		; BB
	tax		; AA
	tax		; AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $CDCC.w,X		; BC CC CD
	dec $01FF.w,X		; DE FF 01
	jsl $3333C2.l		; 22 C2 33 33
	mvp $55,$45		; 44 45 55
	mvn $33,$43		; 54 43 33
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	ora ($0F.b),Y		; 11 0F
	inc $DCDD.w		; EE DD DC
	cpy $B2CC.w		; CC CC B2
	sta $AC99.w,Y		; 99 99 AC
	cmp $12DF.w		; CD DF 12
	eor $67.b		; 45 67
	rep #$45		; C2 45
	adc [$77.b]		; 67 77
	ror $66.b		; 66 66
	eor $44.b,X		; 55 44
	eor $C2.b,S		; 43 C2
	jsl $CCED10.l		; 22 10 ED CC
	wai		; CB
	tsx		; BA
	tyx		; BB
	ldy $CCC2.w,X		; BC C2 CC
	cmp $EFDE.w		; CD DE EF
	beq   0.b		; F0 00
	ora ($11.b),Y		; 11 11
	lda ($34.b)		; B2 34
	lsr $77.b,X		; 56 77
	adc [$76.b]		; 67 76
	eor ($32.b,S),Y		; 53 32
	jsl $0F10C2.l		; 22 C2 10 0F
	inc $CCDD.w		; EE DD CC
	cpy $CCCC.w		; CC CC CC
	lda ($9A.b)		; B2 9A
	ldy $DEDD.w,X		; BC DD DE
	sbc $573502.l		; EF 02 35 57
	rep #$45		; C2 45
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	eor $32.b,S		; 43 32
	ora ($C2.b),Y		; 11 C2
	ora $CCDDED.l		; 0F ED DD CC
	cpy $AABA.w		; CC BA AA
	tax		; AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	ldy $DDCC.w,X		; BC CC DD
	sbc $342201.l		; EF 01 22 34
	rep #$44		; C2 44
	eor $56.b,X		; 55 56
	ror $65.b		; 66 65
	eor $22.b,S		; 43 22
	ora ($C2.b),Y		; 11 C2
	ora ($0F.b),Y		; 11 0F
	inc $DCDD.w		; EE DD DC
	cpy $DDCD.w		; CC CD DD
.INDEX 16
	rep #$DD		; C2 DD
	inc $00FF.w		; EE FF 00
	ora ($22.b)		; 12 22
	and ($45.b,S),Y		; 33 45
.INDEX 16
	rep #$56		; C2 56
	ror $66.b,X		; 76 66
	adc $54.b		; 65 54
	eor $22.b,S		; 43 22
	bpl -62.b		; 10 C2
	ora $CCCCED.l		; 0F ED CC CC
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
	lda ($AA.b)		; B2 AA
	ldy $EECD.w,X		; BC CD EE
	beq  17.b		; F0 11
	ora ($11.b),Y		; 11 11
	lda ($22.b)		; B2 22
	and $33.b,S		; 23 33
	mvp $33,$43		; 44 43 33
	and ($33.b,S),Y		; 33 33
.INDEX 16
	rep #$11		; C2 11
	ora $DCEEFE.l		; 0F FE EE DC
	cpy $CCCC.w		; CC CC CC
	lda ($99.b)		; B2 99
	tax		; AA
	plb		; AB
	dec $23F0.w		; CE F0 23
	eor $67.b		; 45 67
	rep #$45		; C2 45
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	eor $32.b,S		; 43 32
	and ($C2.b,X)		; 21 C2
	ora $BBDCEE.l		; 0F EE DC BB
	tax		; AA
	sta $AA99.w,Y		; 99 99 AA
.ACCU 16
	rep #$AB		; C2 AB
	ldy $DDCC.w,X		; BC CC DD
	sbc $342201.l		; EF 01 22 34
	rep #$44		; C2 44
	lsr $66.b,X		; 56 66
	ror $65.b		; 66 65
	mvp $32,$44		; 44 44 32
	lda ($42.b)		; B2 42
	ora $A9BBDC.l,X		; 1F DC BB A9
	sta $9999.w,Y		; 99 99 99
.INDEX 16
	rep #$DD		; C2 DD
	sbc $2311F0.l		; EF F0 11 23
	eor $56.b		; 45 56
	adc [$C2.b]		; 67 C2
	adc [$77.b],Y		; 77 77
	ror $65.b		; 66 65
	mvn $21,$32		; 54 32 21
	ora $DCFEC2.l		; 0F C2 FE DC
	wai		; CB
	tsx		; BA
	tax		; AA
	tax		; AA
	tyx		; BB
	ldy $9AB2.w,X		; BC B2 9A
	tyx		; BB
	ldy $F0CD.w,X		; BC CD F0
	and $45.b,S		; 23 45
	eor $B2.b,X		; 55 B2
	eor $55.b,X		; 55 55
	lsr $66.b,X		; 56 66
	mvp $21,$33		; 44 33 21
	brk $C2.b		; 00 C2
	sbc $CBDCED.l,X		; FF ED DC CB
	tsx		; BA
	tyx		; BB
	cpy $C2CD.w		; CC CD C2
	dec $F0EF.w,X		; DE EF F0
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	eor $C2.b,X		; 55 C2
	eor $55.b,X		; 55 55
	eor $44.b,X		; 55 44
	eor $22.b,S		; 43 22
	and ($10.b,X)		; 21 10
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	cpy $BABB.w		; CC BB BA
	tax		; AA
	tax		; AA
	ldy $B2CD.w,X		; BC CD B2
	ldy $DECD.w,X		; BC CD DE
	cop $45.b		; 02 45
	adc [$77.b]		; 67 77
	adc [$C2.b],Y		; 77 C2
	eor $55.b		; 45 55
	eor $44.b,X		; 55 44
	and ($22.b)		; 32 22
	ora ($10.b),Y		; 11 10
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	cmp $CBCC.w,X		; DD CC CB
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
.INDEX 16
	rep #$DE		; C2 DE
	sbc $1201F0.l		; EF F0 01 12
	and $45.b,S		; 23 45
	eor $C2.b,X		; 55 C2
	mvn $33,$44		; 54 44 33
	and ($21.b)		; 32 21
	bpl  15.b		; 10 0F
	inc $DDC2.w,X		; FE C2 DD
	cpy $BBCB.w		; CC CB BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	ldy $CDC2.w,X		; BC C2 CD
	dec $01EF.w,X		; DE EF 01
	ora ($33.b)		; 12 33
	and ($44.b,S),Y		; 33 44
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	mvn $33,$44		; 54 44 33
	and ($32.b,S),Y		; 33 32
	lda ($31.b)		; B2 31
	asl $BADC.w		; 0E DC BA
	sta $99AA.w,Y		; 99 AA 99
	txy		; 9B
.ACCU 16
	rep #$EE		; C2 EE
	sbc $331200.l,X		; FF 00 12 33
	eor $56.b		; 45 56
	ror $C2.b		; 66 C2
	ror $66.b		; 66 66
	eor $54.b,X		; 55 54
	and ($10.b)		; 32 10
	ora $BAC2EC.l		; 0F EC C2 BA
	tax		; AA
	lda #$9999.w		; A9 99 99
	tax		; AA
	tax		; AA
	tyx		; BB
	rep #$CC		; C2 CC
	cmp $F0DE.w,X		; DD DE F0
	ora ($23.b,X)		; 01 23
	bit $44.b,X		; 34 44
.INDEX 16
	rep #$55		; C2 55
	eor $55.b,X		; 55 55
	eor $22.b,S		; 43 22
	jsl $C21021.l		; 22 21 10 C2
	inc $DDED.w,X		; FE ED DD
	cpy $CCCC.w		; CC CC CC
	cpy $C2CD.w		; CC CD C2
	inc $F0EF.w		; EE EF F0
	ora ($23.b)		; 12 23
	eor $56.b		; 45 56
	adc [$C2.b]		; 67 C2
	ror $65.b		; 66 65
	eor $43.b,X		; 55 43
	and ($10.b)		; 32 10
	ora $CBC2ED.l		; 0F ED C2 CB
	tyx		; BB
	tax		; AA
	plb		; AB
	ldy $DEDD.w,X		; BC DD DE
	sbc $12F0B2.l		; EF B2 F0 12
	bit $45.b		; 24 45
	ror $55.b		; 66 55
	eor $56.b,X		; 55 56
	lda ($65.b)		; B2 65
	ror $65.b		; 66 65
	mvp $32,$44		; 44 44 32
	and ($0E.b,X)		; 21 0E
.ACCU 16
	rep #$ED		; C2 ED
	cmp $BBCB.w,X		; DD CB BB
	ldy $DECC.w,X		; BC CC DE
	inc $DDB2.w		; EE B2 DD
	cpx #$3412.w		; E0 12 34
	mvp $77,$56		; 44 56 77
	ror $B2.b,X		; 76 B2
	ror $66.b		; 66 66
	eor $54.b,X		; 55 54
	and ($10.b,X)		; 21 10
	inc $C2CA.w,X		; FE CA C2
	jmp.w [$BACB]		; DC CB BA
	tax		; AA
	tyx		; BB
	ldy $DDCC.w,X		; BC CC DD
.INDEX 16
	rep #$DE		; C2 DE
	sbc $3412F0.l		; EF F0 12 34
	eor $66.b		; 45 66
	adc [$C2.b],Y		; 77 C2
	adc [$77.b],Y		; 77 77
	ror $54.b,X		; 76 54
	mvp $21,$33		; 44 33 21
	bpl -62.b		; 10 C2
	inc $CBDC.w,X		; FE DC CB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	cpy $DDC2.w		; CC C2 DD
	sbc $2311F0.l		; EF F0 11 23
	bit $55.b,X		; 34 55
	eor $C2.b,X		; 55 C2
	mvn $32,$44		; 54 44 32
	and ($11.b,X)		; 21 11
	brk $FD.b		; 00 FD
	cpy $BBC2.w		; CC C2 BB
	tsx		; BA
	tax		; AA
	tyx		; BB
	tyx		; BB
	cpy $EECD.w		; CC CD EE
.ACCU 16
	rep #$EF		; C2 EF
	brk $12.b		; 00 12
	and $34.b,S		; 23 34
	mvp $55,$55		; 44 55 55
.INDEX 16
	rep #$55		; C2 55
	eor $44.b,X		; 55 44
	and ($32.b,S),Y		; 33 32
	jsl $B2FF10.l		; 22 10 FF B2
	jmp.w [$99BA]		; DC BA 99
	sta $9999.w,Y		; 99 99 99
	plb		; AB
	cpy $FFC2.w		; CC C2 FF
	brk $11.b		; 00 11
	and $44.b,S		; 23 44
	eor $55.b,X		; 55 55
	mvp $44,$C2		; 44 C2 44
	mvp $21,$43		; 44 43 21
	bpl  15.b		; 10 0F
	jmp.w [$C2CB]		; DC CB C2
	tsx		; BA
	tax		; AA
	sta $AB9A.w,Y		; 99 9A AB
	tyx		; BB
	cpy $C2DD.w		; CC DD C2
	dec $12F0.w,X		; DE F0 12
	and $44.b,S		; 23 44
	mvp $55,$55		; 44 55 55
.INDEX 16
	rep #$55		; C2 55
	mvn $21,$33		; 54 33 21
	ora ($00.b),Y		; 11 00
	sbc $DCC2ED.l,X		; FF ED C2 DC
	cpy $CCBB.w		; CC BB CC
	cpy $DECD.w		; CC CD DE
	sbc $01F0C2.l		; EF C2 F0 01
	jsl $665534.l		; 22 34 55 66
	ror $65.b		; 66 65
.INDEX 16
	rep #$55		; C2 55
	mvn $21,$43		; 54 43 21
	ora $BBDCFE.l		; 0F FE DC BB
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	plb		; AB
	cpy $CDCC.w		; CC CC CD
	dec $B2EF.w,X		; DE EF B2
	beq  19.b		; F0 13
	mvp $56,$45		; 44 45 56
	adc [$77.b]		; 67 77
	ror $B2.b,X		; 76 B2
	ror $64.b		; 66 64
	mvp $33,$44		; 44 44 33
	and ($10.b)		; 32 10
	inc $EDB2.w,X		; FE B2 ED
	wai		; CB
	sta $AB9A.w,Y		; 99 9A AB
	ldy $BCCC.w,X		; BC CC BC
	lda ($DE.b)		; B2 DE
	cpx #$4413.w		; E0 13 44
	lsr $67.b,X		; 56 67
	ror $67.b		; 66 67
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($21.b,S),Y		; 33 21
	bpl   0.b		; 10 00
	inc $DCED.w,X		; FE ED DC
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tax		; AA
	tax		; AA
	plb		; AB
	tyx		; BB
	cpy $EEDD.w		; CC DD EE
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ora ($22.b),Y		; 11 22
	bit $55.b,X		; 34 55
	eor $66.b,X		; 55 66
	ror $C2.b		; 66 C2
	ror $54.b		; 66 54
	and ($33.b,S),Y		; 33 33
	jsl $0F0021.l		; 22 21 00 0F
	lda ($ED.b)		; B2 ED
	dex		; CA
	lda #$9A99.w		; A9 99 9A
	plb		; AB
	ldy $C2DD.w,X		; BC DD C2
	brk $12.b		; 00 12
	and ($44.b,S),Y		; 33 44
	eor $55.b		; 45 55
	eor $54.b,X		; 55 54
	rep #$44		; C2 44
	and ($22.b)		; 32 22
	ora ($00.b),Y		; 11 00
	inc $CBDC.w,X		; FE DC CB
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	ldy $DDCD.w,X		; BC CD DD
	lda ($BC.b)		; B2 BC
	dec $12FF.w,X		; DE FF 12
	bit $44.b,X		; 34 44
	mvp $B2,$44		; 44 44 B2
	mvp $22,$32		; 44 32 22
	bpl  15.b		; 10 0F
	inc $BBDC.w,X		; FE DC BB
	lda ($AA.b)		; B2 AA
	sta $9A99.w,Y		; 99 99 9A
	plb		; AB
	ldy $CDBB.w,X		; BC BB CD
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ora ($22.b,X)		; 01 22
	and ($45.b,S),Y		; 33 45
	eor $66.b,X		; 55 66
	adc [$C2.b],Y		; 77 C2
	adc [$76.b],Y		; 77 76
	eor ($32.b,S),Y		; 53 32
	and ($0F.b,X)		; 21 0F
	sbc $C2CC.w		; ED CC C2
	cpy $BCBB.w		; CC BB BC
	cpy $DECD.w		; CC CD DE
	sbc $01C2FF.l		; EF FF C2 01
	jsl $333333.l		; 22 33 33 33
	bit $45.b,X		; 34 45
	eor $C2.b,X		; 55 C2
	mvn $22,$33		; 54 33 22
	jsl $ED0F11.l		; 22 11 0F ED
	jmp.w [$CBC2]		; DC C2 CB
	tsx		; BA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $EFDD.w,X		; BC DD EF
	rep #$01		; C2 01
	ora ($23.b)		; 12 23
	mvp $55,$55		; 44 55 55
	eor $54.b,X		; 55 54
	rep #$44		; C2 44
	and ($21.b)		; 32 21
	brk $FE.b		; 00 FE
	cmp $BACB.w,X		; DD CB BA
.ACCU 16
	rep #$AA		; C2 AA
	plb		; AB
	ldy $DDCC.w,X		; BC CC DD
	dec $F0EF.w,X		; DE EF F0
	lda ($12.b)		; B2 12
	bit $45.b,X		; 34 45
	eor $67.b		; 45 67
	adc [$77.b],Y		; 77 77
	adc [$B2.b],Y		; 77 B2
	ror $56.b,X		; 76 56
	ror $65.b,X		; 76 65
	eor ($20.b,S),Y		; 53 20
	inc $B3EC.w,X		; FE EC B3
	tsx		; BA
	sta $9999.w,Y		; 99 99 99
	tax		; AA
	tyx		; BB
	cmp $59EF.w		; CD EF 59
	eor $4B.b,X		; 55 4B
	eor $010000.l		; 4F 00 00 01
	bcs   0.b		; B0 00
	brk $12.b		; 00 12
	bcs -23.b		; B0 E9
	ora $1A.b,S		; 03 1A
	jsr $4B53.w		; 20 53 4B
	eor #$2E44.w		; 49 44 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($0000.w)		; 6C 00 00
	adc $0D006C.l		; 6F 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D9D4.w		; E9 D4 D9
	cmp $270DED.l,X		; DF ED 0D 27
	and #$101B.w		; 29 1B 10
	ora $F1.b,S		; 03 F1
	sbc ($02.b)		; F2 02
	ora #$FC02.w		; 09 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	eor ($00.b)		; 52 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora #$3066.w		; 09 66 30
	cpy $00.b		; C4 00
	cpy #$F0C0.w		; C0 C0 F0
	bcs  51.b		; B0 33
	adc ($E0.b)		; 72 E0
	jsl $AAEC20.l		; 22 20 EC AA
	cpy $47E0.w		; CC E0 47
	ror $3F.b,X		; 76 3F
	sbc $CCDDEE.l		; EF EE DD CC
	sbc ($33.b),Y		; F1 33
	brk $92.b		; 00 92
	brk $0E.b		; 00 0E
	wai		; CB
	lda $FFEF.w,X		; BD EF FF
	inc $76EE.w		; EE EE 76
	cpy $12B1.w		; CC B1 12
	bit $1E.b,X		; 34 1E
	dec $BCF0.w		; CE F0 BC
	stx $E2.b		; 86 E2
	ora ($F2.b),Y		; 11 F2
	and ($CA.b),Y		; 31 CA
	cpy #$3012.w		; C0 12 30
	stx $F0.b,Y		; 96 F0
	ora ($11.b,X)		; 01 11
	ora $57C2BA.l,X		; 1F BA C2 57
	and $F3CD96.l,X		; 3F 96 CD F3
	trb $14BC.w		; 1C BC 14
	eor ($00.b)		; 52 00
	and ($A6.b)		; 32 A6
	jsr ($33CE.w,X)		; FC CE 33
	rol $35DF.w		; 2E DF 35
	rti		; 40

	lda $C1A6.w,Y		; B9 A6 C1
	eor $EB.b,S		; 43 EB
.ACCU 8
	sep #$66		; E2 66
	and $E2BC.w,X		; 3D BC E2
	stx $1E.b,Y		; 96 1E
	cpy $54F4.w		; CC F4 54
	jsr $24FF.w		; 20 FF 24
	ora #$A6.b		; 09 A6
	ldy $11E0.w		; AC E0 11
	and $52.b,X		; 35 52
	asl $BBDD.w		; 0E DD BB
	ldx $BE.b		; A6 BE
	ora $77.b,X		; 15 77
	eor $AAEDDE.l		; 4F DE ED AA
	cpy #$25B6.w		; C0 B6 25
	bmi -18.b		; 30 EE
	ora ($1F.b)		; 12 1F
	cpx $34CF.w		; EC CF 34
	lda ($21.b)		; B2 21
	ora $0C4302.l		; 0F 02 43 0C
	sta $01BE.w,Y		; 99 BE 01
	ldx $0E.b		; A6 0E
	cmp $02FE11.l,X		; DF 11 FE 02
	tsb $64B1.w		; 0C B1 64
	lda ($0C.b)		; B2 0C
	plb		; AB
	sbc ($54.b,S),Y		; F3 54
	tsb $F2AB.w		; 0C AB F2
	ora $BFB6.w,X		; 1D B6 BF
	and $41.b,X		; 35 41
	sbc $10E1DD.l,X		; FF DD E1 10
	sbc $1012B6.l,X		; FF B6 12 10
	sbc ($31.b),Y		; F1 31
	cpx $16AE.w		; EC AE 16
	rti		; 40

	ldx $CC.b,Y		; B6 CC
	rol $3F.b,X		; 36 3F
	wai		; CB
	cpy $6404.w		; CC 04 64
	ora $CEB6.w,X		; 1D B6 CE
	ora ($33.b,X)		; 01 33
	ora $03AA.w		; 0D AA 03
	ror $2F.b		; 66 2F
	ldx $BB.b,Y		; B6 BB
	cpx $41.b		; E4 41
	wai		; CB
	cmp ($45.b,X)		; C1 45
	and ($0E.b)		; 32 0E
	ldx $DA.b,Y		; B6 DA
	bcs  84.b		; B0 54
	xce		; FB
	pea $FA74.w		; F4 74 FA
	lda ($B6.b),Y		; B1 B6
	eor ($DA.b)		; 52 DA
	lda $104324.l,X		; BF 24 43 10
	inc $B6E0.w		; EE E0 B6
	ora ($FD.b),Y		; 11 FD
	dec $23F1.w		; CE F1 23
	eor $1E.b		; 45 1E
	cmp $EEB6.w,X		; DD B6 EE
	ora ($EA.b,S),Y		; 13 EA
	cmp ($44.b),Y		; D1 44
	mvn $EF,$FC		; 54 FC EF
	lda ($EE.b)		; B2 EE
	dex		; CA
	txs		; 9A
	tsx		; BA
	txs		; 9A
	bne  38.b		; D0 26
	ror $C2.b,X		; 76 C2
	bpl  -2.b		; 10 FE
	sbc $CECBFE.l		; EF FE CB CE
	cop $33.b		; 02 33
	ldx $FE.b,Y		; B6 FE
	inc $14CC.w,X		; FE CC 14
	lsr $149C.w		; 4E 9C 14
	eor $C6.b		; 45 C6
	jsr $EDFE.w		; 20 FE ED
	sep #$43		; E2 43
	tsb $42C0.w		; 0C C0 42
	dec $FE.b		; C6 FE
	ora $1E.b,S		; 03 1E
	cmp $3F25.w		; CD 25 3F
	cmp $B2F1.w,X		; DD F1 B2
	sbc $45CF.w		; ED CF 45
	trb $42C0.w		; 1C C0 42
	cmp #$C1.b		; C9 C1
	ldx $2A.b,Y		; B6 2A
	sta $540223.l,X		; 9F 23 02 54
	ora $E4BC.w,X		; 1D BC E4
	ldx $5F.b,Y		; B6 5F
	plb		; AB
	trb $1F.b		; 14 1F
	trb $52.b		; 14 52
	stp		; DB
	lda $0C34B6.l,X		; BF B6 34 0C
	cmp $46E020.l		; CF 20 E0 46
	and $E1B6CD.l,X		; 3F CD B6 E1
	bpl -35.b		; 10 DD
	ora ($FB.b,S),Y		; 13 FB
	cmp ($56.b),Y		; D1 56
	and $F2DEB6.l		; 2F B6 DE F2
	bpl  15.b		; 10 0F
	asl $04CD.w		; 0E CD 04
	eor ($A6.b,X)		; 41 A6
	jmp.w [$5405]		; DC 05 54
	asl $C9ED.w,X		; 1E ED C9
	ldx $A633.w		; AE 33 A6
	asl $6703.w,X		; 1E 03 67
	adc ($B9.b)		; 72 B9
	ldx $CEFD.w,Y		; BE FD CE
	ldx $23.b,Y		; B6 23
	ora $35CF.w		; 0D CF 35
	eor ($EC.b)		; 52 EC
	ora ($0D.b,X)		; 01 0D
	ldx $BC.b,Y		; B6 BC
	ora $3E.b,X		; 15 3E
	cmp $EE4036.l		; CF 36 40 EE
	brk $A6.b		; 00 A6
	jmp.w [$10CD]		; DC CD 10
	stp		; DB
	cpx $76.b		; E4 76
	ror $3E.b		; 66 3E
	ldx $DD.b,Y		; B6 DD
	beq  14.b		; F0 0E
	cpy $32F2.w		; CC F2 32
	jsl $0BB643.l		; 22 43 B6 0B
	lda $ADEB44.l,X		; BF 44 EB AD
	eor [$2B.b],Y		; 57 2B
	lda $3B57B6.l,X		; BF B6 57 3B
	lda $BDFD64.l		; AF 64 FD BD
	ora $3C.b,X		; 15 3C
	rep #$CA		; C2 CA
	ldx $1101.w,Y		; BE 01 11
	and $32.b,S		; 23 32
	bpl  -3.b		; 10 FD
	ldx $CF.b,Y		; B6 CF
	and ($EE.b)		; 32 EE
	and $54.b,S		; 23 54
	and $22CF.w		; 2D CF 22
	ldx $FD.b,Y		; B6 FD
	jmp.w [$32D0]		; DC D0 32
	ora $012012.l		; 0F 12 20 01
	ldx $33.b,Y		; B6 33
	sbc $CEDB.w,X		; FD DB CE
	lsr $3D.b		; 46 3D
	lda $C224.w		; AD 24 C2
	brk $13.b		; 00 13
	eor $1F.b,S		; 43 1F
	cmp $FDF0.w,X		; DD F0 FD
	cpy $13B6.w		; CC B6 13
	bit $33.b,X		; 34 33
	sbc $E1DD.w,X		; FD DD E1
	and $01B6CC.l		; 2F CC B6 01
	jsl $DB5223.l		; 22 23 52 DB
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	stp		; DB
	ldx $BF.b,Y		; B6 BF
	eor $DF.b,S		; 43 DF
	rol $4D.b,X		; 36 4D
	stz $0D67.w,X		; 9E 67 0D
	ldx $BC.b,Y		; B6 BC
	bne  49.b		; D0 31
	asl $22F1.w		; 0E F1 22
	jsl $F2B60F.l		; 22 0F B6 F2
	asl $C0DA.w		; 0E DA C0
	adc $EA.b,X		; 75 EA
	sbc $74.b		; E5 74
	ldx $C9.b,Y		; B6 C9
	cpy $72.b		; C4 72
	cmp #$C1.b		; C9 C1
	and ($0F.b,S),Y		; 33 0F
	cop $B6.b		; 02 B6
	jsr $CF0D.w		; 20 0D CF
	lsr $1E.b		; 46 1E
	tyx		; BB
	cpx $64.b		; E4 64
	ldx $FB.b,Y		; B6 FB
	ldx $3F24.w,Y		; BE 24 3F
	dec $1C34.w		; CE 34 1C
	cpy #$B6.b		; C0 B6
	mvp $CC,$1C		; 44 1C CC
	sbc ($32.b)		; F2 32
	asl $3202.w		; 0E 02 32
	ldx $0E.b,Y		; B6 0E
	beq  14.b		; F0 0E
	cpy $32E3.w		; CC E3 32
	ora ($21.b)		; 12 21
	lda ($43.b)		; B2 43
	jsl $ADB91E.l		; 22 1E B9 AD
	ora $B656E0.l		; 0F E0 56 B6
	tax		; AA
	sbc $52.b,S		; E3 52
	brk $0F.b		; 00 0F
	dec $1D13.w,X		; DE 13 1D
	ldx $D1.b,Y		; B6 D1
	.db $42, $EC		; 42 EC
	pea $BA50.w		; F4 50 BA
	inc $71.b		; E6 71
	ldx $BA.b,Y		; B6 BA
	sbc ($41.b,S),Y		; F3 41
	stp		; DB
	pea $DB73.w		; F4 73 DB
	cpy #$B2.b		; C0 B2
	cmp $FB5324.l,X		; DF 24 53 FB
	txs		; 9A
	bne  18.b		; D0 12
	and ($B6.b,S),Y		; 33 B6
	inc $23F1.w,X		; FE F1 23
	asl $E2AA.w,X		; 1E AA E2
	and ($02.b),Y		; 31 02
	ldx $45.b,Y		; B6 45
	asl $02CD.w,X		; 1E CD 02
	and $21E0CC.l		; 2F CC E0 21
	ldx $23.b,Y		; B6 23
	eor $0D.b,S		; 43 0D
	cmp $DFFE23.l		; CF 23 FE DF
	cpx #$C2.b		; E0 C2
	cmp $14DE.w,X		; DD DE 14
	eor ($DD.b,X)		; 41 DD
	ora $52.b,X		; 15 52
	stp		; DB
.INDEX 16
	rep #$D3		; C2 D3
	eor ($DA.b)		; 52 DA
	cpy #$EC33.w		; C0 33 EC
	sbc $54.b,S		; E3 54
	dec $DD.b		; C6 DD
	cmp ($52.b)		; D2 52
	wai		; CB
	sep #$42		; E2 42
	sbc $C6F3.w,X		; FD F3 C6
	eor ($FD.b,X)		; 41 FD
	dec $4301.w,X		; DE 01 43
	cpx $34C0.w		; EC C0 34
	ldx $2C.b,Y		; B6 2C
	ldx $4145.w		; AE 45 41
	dex		; CA
	cmp ($6F.b,S),Y		; D3 6F
	sta $BFC2.w,Y		; 99 C2 BF
	and ($EB.b)		; 32 EB
	cpy #$0D43.w		; C0 43 0D
	sbc ($40.b,S),Y		; F3 40
	rep #$CA		; C2 CA
	cmp ($42.b,X)		; C1 42
	cpx $42F2.w		; EC F2 42
	ora $EAB602.l		; 0F 02 B6 EA
	cpy #$2043.w		; C0 43 20
	brk $10.b		; 00 10
	sbc $B6E1.w,X		; FD E1 B6
	.db $42, $DC		; 42 DC
	pea $BB30.w		; F4 30 BB
	sbc ($22.b)		; F2 22
	bit $B6.b		; 24 B6
	bmi -36.b		; 30 DC
	cmp ($32.b),Y		; D1 32
	nop		; EA
	lda $B63223.l		; AF 23 32 B6
	mvn $CF,$0D		; 54 0D CF
	ora ($FE.b),Y		; 11 FE
	sbc $24CE.w		; ED CE 24
	rep #$01		; C2 01
	and $22.b,S		; 23 22
	jsl $F2BB1E.l		; 22 1E BB F2
	rol $93B6.w		; 2E B6 93
	stz $CA.b,X		; 74 CA
	inc $73.b,X		; F6 73
	lda #$C4.b		; A9 C4
	adc ($C2.b)		; 72 C2
	ora $03BC.w,X		; 1D BC 03
	rol $F2BC.w		; 2E BC F2
	asl $C2E1.w,X		; 1E E1 C2
	mvp $BD,$2E		; 44 2E BD
	ora $30.b,X		; 15 30
	stp		; DB
	cmp $B6EF.w		; CD EF B6
	rol $5F.b,X		; 36 5F
	cpy $1D01.w		; CC 01 1D
	ldy $FF12.w,X		; BC 12 FF
	ldx $12.b,Y		; B6 12
	eor $FD.b,S		; 43 FD
	asl $5F.b,X		; 16 5F
	wai		; CB
	stz $B666.w,X		; 9E 66 B6
	plx		; FA
	sbc $50.b,S		; E3 50
	ldy $7316.w		; AC 16 73
	cpx $B6DC.w		; EC DC B6
.ACCU 16
	rep #$62		; C2 62
	dex		; CA
	sbc $21.b,S		; E3 21
	sbc $B64125.l,X		; FF 25 41 B6
	dec $EB00.w,X		; DE 00 EB
	cmp ($41.b,X)		; C1 41
	cmp $4203.w,X		; DD 03 42
	ldx $FE.b,Y		; B6 FE
	pea $FD52.w		; F4 52 FD
	dex		; CA
	cmp ($42.b,X)		; C1 42
	ora $4E34B6.l		; 0F B6 34 4E
	txy		; 9B
	ora [$60.b],Y		; 17 60
	wai		; CB
	sbc ($4E.b,X)		; E1 4E
	ldx $AB.b,Y		; B6 AB
	ora ($23.b,S),Y		; 13 23
	bit $30.b,X		; 34 30
	inc $F3DD.w		; EE DD F3
	ldx $20.b,Y		; B6 20
	sbc $13BD.w		; ED BD 13
	and ($25.b)		; 32 25
	bvc -69.b		; 50 BB
	rep #$03		; C2 03
	and ($DB.b),Y		; 31 DB
	cmp $02DE0E.l		; CF 0E DE 02
	mvp $DE,$C6		; 44 C6 DE
	bit $2F.b		; 24 2F
	jmp.w [$43D1]		; DC D1 43
	cpx $C6E3.w		; EC E3 C6
	.db $42, $DC		; 42 DC
	sbc ($42.b,S),Y		; F3 42
	inc $E1ED.w,X		; FE ED E1
	and ($B6.b),Y		; 31 B6
	lda $4015.w,X		; BD 15 40
	cpy $6016.w		; CC 16 60
	dec $B6FF.w,X		; DE FF B6
	dec $DB12.w,X		; DE 12 DB
	lda ($44.b),Y		; B1 44
	jsl $C24402.l		; 22 02 44 C2
	eor ($1F.b,S),Y		; 53 1F
	wai		; CB
	sbc ($3F.b,S),Y		; F3 3F
	tsx		; BA
	cmp $01C612.l		; CF 12 C6 01
	and ($FE.b,X)		; 21 FE
	inc $24DE.w,X		; FE DE 24
	rti		; 40

	cmp $C1B6.w,X		; DD B6 C1
	and ($01.b),Y		; 31 01
	and $2E.b,X		; 35 2E
	cmp $27CD.w,X		; DD CD 27
.ACCU 16
	rep #$20		; C2 20
	cmp $3F04.w,X		; DD 04 3F
	cmp $34F1.w		; CD F1 34
	.db $42, $B6		; 42 B6
	cmp $AEDA43.l		; CF 43 DA AE
	mvp $01,$21		; 44 21 01
	ora ($B6.b)		; 12 B6
	ora ($1E.b,X)		; 01 1E
	ldy $5016.w,X		; BC 16 50
	tyx		; BB
	cmp $C2E2.w		; CD E2 C2
	cmp $315503.l,X		; DF 03 55 31
	cpx $54D1.w		; EC D1 54
	sbc $25B6.w,X		; FD B6 25
	xce		; FB
	sbc ($45.b,S),Y		; F3 45
	eor $1DE1CD.l,X		; 5F CD E1 1D
	ldx $BC.b,Y		; B6 BC
	rol $3C.b		; 26 3C
	cmp ($54.b,S),Y		; D3 54
	and $B600EE.l		; 2F EE 00 B6
	cpx $23AD.w		; EC AD 23
	bit $73.b		; 24 73
	cpx $AA0F.w		; EC 0F AA
.ACCU 16
.INDEX 16
	rep #$BF		; C2 BF
	and ($0C.b,S),Y		; 33 0C
	ldy $0FF1.w		; AC F1 0F
	trb $65.b		; 14 65
	rep #$0D		; C2 0D
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	tsx		; BA
	cmp $F15135.l		; CF 35 51 F1
	dec $2E.b		; C6 2E
	lda $CD2E25.l,X		; BF 25 2E CD
	ora $30.b,S		; 03 30
	cmp $2F34C6.l,X		; DF C6 34 2F
	cmp $0D12.w,X		; DD 12 0D
	cpy #$24.b		; C0 24
	bmi -62.b		; 30 C2
	asl $1DE0.w,X		; 1E E0 1D
	ldy $6404.w		; AC 04 64
	ora $B6CE.w		; 0D CE B6
	ora $4702.w,X		; 1D 02 47
	lsr $1FCE.w		; 4E CE 1F
	ldy $B606.w,X		; BC 06 B6
	eor ($C9.b)		; 52 C9
	lda $751333.l		; AF 33 13 75
	jsr ($C6EF.w,X)		; FC EF C6
	inc $22EF.w,X		; FE EF 22
	asl $2E13.w		; 0E 13 2E
	cmp $64C235.l		; CF 35 C2 64
	ora $BFCAFF.l		; 0F FF CA BF
	and ($0B.b,S),Y		; 33 0B
	cpy #$C2.b		; C0 C2
	.db $42, $DC		; 42 DC
	ora $52.b		; 05 52
	xba		; EB
	tyx		; BB
	cmp $46B6FF.l,X		; DF FF B6 46
	bit $15AD.w,X		; 3C AD 15
	phd		; 0B
	cmp $70.b,X		; D5 70
	lda #$B6.b		; A9 B6
	cpy #$22.b		; C0 22
	ora ($35.b)		; 12 35
	eor $14CCDC.l		; 4F DC CC 14
	dec $1F.b		; C6 1F
	sbc ($30.b),Y		; F1 30
	jmp.w [$5203]		; DC 03 52
	sbc $C2E0.w		; ED E0 C2
	sbc $23CE.w,X		; FD CE 23
	ora $23CE.w,X		; 1D CE 23
	bpl  19.b		; 10 13
	ldx $EA.b,Y		; B6 EA
	lda $040E46.l,X		; BF 46 0E 04
	eor $B6C0CB.l		; 4F CB C0 B6
	jsl $CB6015.l		; 22 15 60 CB
	lda $4503.w,X		; BD 03 45
	eor ($B6.b),Y		; 51 B6
	stp		; DB
	wai		; CB
	sbc $54.b,S		; E3 54
	eor ($EC.b,X)		; 41 EC
	wai		; CB
	sbc ($B6.b,X)		; E1 B6
	eor $3F.b,X		; 55 3F
	beq  -4.b		; F0 FC
	ldx $6F47.w,Y		; BE 47 6F
	wai		; CB
	ldx $BD.b,Y		; B6 BD
	trb $42.b		; 14 42
	and ($2F.b,X)		; 21 2F
	stp		; DB
	cmp $40B645.l		; CF 45 B6 40
	dec $CA00.w,X		; DE 00 CA
	pea $1C66.w		; F4 66 1C
	cmp $14DEB6.l		; CF B6 DE 14
	stz $FD.b		; 64 FD
	dec $13CC.w,X		; DE CC 13
	and ($B6.b)		; 32 B6
	mvp $DD,$1D		; 44 1D DD
	cpx #$22.b		; E0 22
	asl $00CF.w		; 0E CF 00
	ldx $F1.b,Y		; B6 F1
	bit $54.b		; 24 54
	sbc $DCEF.w		; ED EF DC
	cmp ($64.b)		; D2 64
	ldx $1E.b,Y		; B6 1E
	wai		; CB
	sbc $43.b,S		; E3 43
	and ($0E.b),Y		; 31 0E
	cmp $B6FF.w,X		; DD FF B6
	eor $2E.b		; 45 2E
	dex		; CA
	cmp $622433.l		; CF 33 24 62
	jmp.w [$DDB6]		; DC B6 DD
	cpy #$45.b		; C0 45
	and $E2DBEE.l,X		; 3F EE DB E2
	eor $B6.b,S		; 43 B6
	eor $2D.b,S		; 43 2D
	cmp $1101.w		; CD 01 11
	ora $A6E2CC.l		; 0F CC E2 A6
	adc $77.b,X		; 75 77
	and $E0AB.w,X		; 3D AB E0
	cop $1C.b		; 02 1C
	txy		; 9B
	ldx $02.b,Y		; B6 02
	ora ($35.b,X)		; 01 35
	bmi  -2.b		; 30 FE
	sbc $53C0.w		; ED C0 53
	ldx $FD.b,Y		; B6 FD
	sbc $4124F0.l		; EF F0 24 41
	sbc $B6CEFE.l,X		; FF FE CE B6
	trb $30.b		; 14 30
	cpx $14DE.w		; EC DE 14
	mvp $DE,$2F		; 44 2F DE
	ldx $EC.b,Y		; B6 EC
	cmp $FE2045.l,X		; DF 45 20 FE
	inc $5203.w		; EE 03 52
	ldx $EC.b,Y		; B6 EC
	cop $FC.b		; 02 FC
	cpy #$43.b		; C0 43
	sbc $35F2.w		; ED F2 35
	ldx $40.b,Y		; B6 40
	inc $DBFE.w		; EE FE DB
.ACCU 8
	sep #$22		; E2 22
	ora ($22.b)		; 12 22
	ldx $EC.b,Y		; B6 EC
	sbc $54.b,S		; E3 54
	inc $EEEE.w,X		; FE EE EE
	dec $B213.w		; CE 13 B2
	pea $DB73.w		; F4 73 DB
	pea $0C64.w		; F4 64 0C
	cmp ($52.b,X)		; C1 52
.ACCU 16
	rep #$EB		; C2 EB
	lda $1D03.w,X		; BD 03 1D
	dec $5325.w		; CE 25 53
	bpl -58.b		; 10 C6
	beq  16.b		; F0 10
	sbc $43F2.w		; ED F2 43
	jsr ($22D1.w,X)		; FC D1 22
	ldx $23.b,Y		; B6 23
	rol $E0EE.w		; 2E EE E0
	ora $26AE.w,X		; 1D AE 26
	bvc -74.b		; 50 B6
	ldy $5325.w		; AC 25 53
	sbc $F0EE.w,X		; FD EE F0
	inc $B6E1.w		; EE E1 B6
	and $4E.b		; 25 4E
	lda $3F24.w		; AD 24 3F
	brk $0E.b		; 00 0E
	sbc $CCDCC2.l		; EF C2 DC CC
	cpx #$23.b		; E0 23
	jsr $2112.w		; 20 12 21
	ora $0F00B6.l		; 0F B6 00 0F
	cmp $21E2.w		; CD E2 21
	eor $4E.b		; 45 4E
	bne -74.b		; D0 B6
	bpl -20.b		; 10 EC
	bne  15.b		; D0 0F
	sbc ($11.b),Y		; F1 11
	and $53.b,S		; 23 53
	ldx $FD.b,Y		; B6 FD
	sbc $2401ED.l		; EF ED 01 24
	rol $F49B.w		; 2E 9B F4
	lda ($15.b)		; B2 15
	ror $2E.b,X		; 76 2E
	cpx #$1E.b		; E0 1E
	plb		; AB
	ora [$72.b],Y		; 17 72
	ldx $BD.b,Y		; B6 BD
	ora ($00.b,X)		; 01 00
	and $21.b,S		; 23 21
	ora $B600F0.l		; 0F F0 00 B6
	ora ($20.b,X)		; 01 20
	cpx $02BD.w		; EC BD 02
	jsl $B61332.l		; 22 32 13 B6
	jsr $BDED.w		; 20 ED BD
	and [$1A.b]		; 27 1A
	sta $B62133.l,X		; 9F 33 21 B6
	and ($2F.b,S),Y		; 33 2F
	sbc $73D3DB.l,X		; FF DB D3 73
	phx		; DA
	ldx $23B6.w		; AE B6 23
	eor $00.b,S		; 43 00
	and ($FD.b,S),Y		; 33 FD
	ldy $4D27.w,X		; BC 27 4D
	ldx $99.b,Y		; B6 99
	sbc $42.b,S		; E3 42
	ora ($45.b,X)		; 01 45
	rol $C1DC.w,X		; 3E DC C1
	ldx $61.b,Y		; B6 61
	lda $32C1.w,Y		; B9 C1 32
	and $22.b,S		; 23 22
	ora ($0E.b)		; 12 0E
	ldx $DC.b,Y		; B6 DC
.ACCU 8
	sep #$2E		; E2 2E
	lda $2012.w,X		; BD 12 20
	trb $53.b		; 14 53
	ldx $FD.b,Y		; B6 FD
	cpx #$FC.b		; E0 FC
	lda $000121.l,X		; BF 21 01 00
	ora ($B6.b)		; 12 B6
	and ($31.b,X)		; 21 31
	ora $E1DEFF.l		; 0F FF DE E1
	asl $B6BE.w,X		; 1E BE B6
	and $21.b,S		; 23 21
	brk $45.b		; 00 45
	rol $E0DE.w		; 2E DE E0
	bpl -74.b		; 10 B6
	tyx		; BB
.ACCU 8
	sep #$21		; E2 21
	ora ($36.b,X)		; 01 36
	eor $B60FDE.l		; 4F DE 0F B6
	stp		; DB
	cpx $40.b		; E4 40
	cpy DMASRC0H.w		; CC 03 43
	sbc $C606.w		; ED 06 C6
	bmi  -3.b		; 30 FD
	bne  51.b		; D0 33
	cpx $21D0.w		; EC D0 21
	bpl -74.b		; 10 B6
	ora $64.b,S		; 03 64
	sbc $C1DC.w		; ED DC C1
	adc ($B9.b,S),Y		; 73 B9
	cpy #$B6.b		; C0 B6
	.db $42, $22		; 42 22
	and ($10.b,S),Y		; 33 10
	sbc $70C5DA.l		; EF DA C5 70
.ACCU 16
	rep #$EB		; C2 EB
	lda $01F0.w,X		; BD F0 01
	bit $43.b,X		; 34 43
	and ($FC.b,X)		; 21 FC
	ldx $04.b,Y		; B6 04
	rol $32E0.w,X		; 3E E0 32
	inc $5105.w,X		; FE 05 51
	inc $FEB6.w		; EE B6 FE
	jmp.w [$23BF]		; DC BF 23
	jsl $04EC42.l		; 22 42 EC 04
	ldx $30.b,Y		; B6 30
	inc $FCF0.w		; EE F0 FC
	ldx $3224.w		; AE 24 32
	sbc ($B6.b),Y		; F1 B6
	eor $0B.b,X		; 55 0B
	lda $1C57.w		; AD 57 1C
	txs		; 9A
	sbc ($31.b,S),Y		; F3 31
	ldx $11.b,Y		; B6 11
	lsr $1D.b,X		; 56 1D
	jmp.w [$62C2]		; DC C2 62
	tsx		; BA
	cmp ($B6.b)		; D2 B6
	and $5323E1.l,X		; 3F E1 23 53
	inc $CBEF.w,X		; FE EF CB
	sbc $B6.b		; E5 B6
	bvs -68.b		; 70 BC
	brk $00.b		; 00 00
	ora ($24.b)		; 12 24
	eor ($DE.b,X)		; 41 DE
	ldx $DA.b,Y		; B6 DA
	cmp ($65.b)		; D2 65
	cmp $33B1.w,Y		; D9 B1 33
	ora $62B603.l,X		; 1F 03 B6 62
	sbc $03DD.w		; ED DD 03
	plx		; FA
	cmp ($34.b,X)		; C1 34
	eor ($B6.b,X)		; 41 B6
	tyx		; BB
	and [$4E.b]		; 27 4E
	sbc $BFEC00.l		; EF 00 EC BF
	jsl $6312B6.l		; 22 B6 12 63
	jsr ($FFF1.w,X)		; FC F1 FF
	ora ($1E.b,S),Y		; 13 1E
	dex		; CA
	ldx $D2.b,Y		; B6 D2
	and ($13.b)		; 32 13
	mvn $EF,$ED		; 54 ED EF
	brk $CD.b		; 00 CD
	ldx $13.b,Y		; B6 13
	jsr $1F01.w		; 20 01 1F
	inc $3D36.w		; EE 36 3D
	dec $BDB6.w,X		; DE B6 BD
	trb $32.b		; 14 32
	brk $00.b		; 00 00
	cpx $45C0.w		; EC C0 45
	lda ($65.b)		; B2 65
	and $F29CC9.l		; 2F C9 9C F2
	eor [$62.b],Y		; 57 62
	nop		; EA
	ldx $03.b,Y		; B6 03
	ora $53E3.w,X		; 1D E3 53
	inc $21E1.w,X		; FE E1 21
	inc $11A6.w		; EE A6 11
	sbc #$359C.w		; E9 9C 35
	stz $66.b		; 64 66
	lsr $B6BC.w,X		; 5E BC B6
	inc $03CC.w,X		; FE CC 03
	bmi   1.b		; 30 01
	and ($3E.b,S),Y		; 33 3E
	bne -74.b		; D0 B6
	and ($EE.b,X)		; 21 EE
	cpx $23BE.w		; EC BE 23
	ora ($45.b)		; 12 45
	and $EEEFB6.l		; 2F B6 EF EE
	dec $0A24.w,X		; DE 24 0A
	bcs  67.b		; B0 43
	ora ($B6.b),Y		; 11 B6
	bit $4F.b		; 24 4F
	inc $DEFD.w		; EE FD DE
	sbc ($00.b),Y		; F1 00
	ora ($A6.b),Y		; 11 A6
	and ($32.b)		; 32 32
	ror $1C.b		; 66 1C
	cmp $CADB.w,X		; DD DB CA
	ldx $35A6.w		; AE A6 35
	eor $2D.b		; 45 2D
	and [$5F.b]		; 27 5F
	tyx		; BB
	lda ($71.b,S),Y		; B3 71
	ldx $B9.b,Y		; B6 B9
	cmp ($32.b),Y		; D1 32
	ora ($25.b),Y		; 11 25
	eor $B6CEDE.l		; 4F DE CE B6
	and $2C.b,X		; 35 2C
	txy		; 9B
	ora $21.b,S		; 03 21
	ora ($54.b,S),Y		; 13 54
	sbc $EFB6.w,X		; FD B6 EF
	cmp $FA13.w,X		; DD 13 FA
	sep #$42		; E2 42
	sbc $44B603.l,X		; FF 03 B6 44
	ora $FDEF.w,X		; 1D EF FD
	sbc ($FC.b),Y		; F1 FC
	cmp ($33.b),Y		; D1 33
	ldx $0E.b,Y		; B6 0E
	ora $52.b		; 05 52
	sbc $EBF0.w,X		; FD F0 EB
.ACCU 16
	rep #$62		; C2 62
	ldx $AA.b,Y		; B6 AA
	tsb $44.b		; 04 44
	sbc $36E0.w,X		; FD E0 36
	and $C2B6CC.l		; 2F CC B6 C2
	eor $55149C.l,X		; 5F 9C 14 55
	asl A		; 0A
	lda ($54.b)		; B2 54
	ldx $1E.b,Y		; B6 1E
	cmp $0D01.w		; CD 01 0D
	cpy #$23.b		; C0 23
	ora ($42.b),Y		; 11 42
	ldx $BB.b,Y		; B6 BB
	ora [$51.b]		; 07 51
	wai		; CB
	cmp ($43.b),Y		; D1 43
	xce		; FB
	lda $24B6.w,X		; BD B6 24
	adc $CA.b,S		; 63 CA
	sbc [$60.b],Y		; F7 60
	lda #$6FF6.w		; A9 F6 6F
	ldx $9A.b,Y		; B6 9A
	cpx $42.b		; E4 42
	sbc $CC4015.l,X		; FF 15 40 CC
	cmp $DC33B6.l,X		; DF B6 33 DC
	beq  16.b		; F0 10
	ora ($23.b,X)		; 01 23
	and ($ED.b,S),Y		; 33 ED
	rep #$00		; C2 00
	inc $DECC.w,X		; FE CC DE
	sbc $111100.l,X		; FF 00 11 11
	ldx $22.b,Y		; B6 22
	asl $FCE0.w		; 0E E0 FC
	ldx $1033.w,Y		; BE 33 10
	trb $B6.b		; 14 B6
	bvc -33.b		; 50 DF
	beq  15.b		; F0 0F
	sbc $23E2EC.l,X		; FF EC E2 23
	ldx $10.b,Y		; B6 10
	ora $4F.b,X		; 15 4F
	dec $FCF0.w,X		; DE F0 FC
	cpy #$33.b		; C0 33
	ldx $00.b,Y		; B6 00
	ora $51.b,S		; 03 51
	cmp $1E01.w,X		; DD 01 1E
	inc $B6CD.w,X		; FE CD B6
	ora ($31.b,S),Y		; 13 31
	inc $3E26.w,X		; FE 26 3E
	lda $B6FC23.l,X		; BF 23 FC B6
	ldx $EC45.w,Y		; BE 45 EC
	cpx $53.b		; E4 53
	jmp.w [$1D14]		; DC 14 1D
	ldx $D0.b,Y		; B6 D0
	asl $33BF.w,X		; 1E BF 33
	ora $ED4104.l		; 0F 04 41 ED
	ldx $E0.b,Y		; B6 E0
	ora $56DF.w,X		; 1D DF 56
	rol $CCDD.w		; 2E DD CC
	tsb $B6.b		; 04 B6
	eor $0D.b,X		; 55 0D
	sbc ($0D.b),Y		; F1 0D
	cmp $B93D46.l		; CF 46 3D B9
	ldx $E1.b,Y		; B6 E1
	.db $42, $34		; 42 34
	bmi -35.b		; 30 DD
	ora ($0D.b,X)		; 01 0D
	cmp $F01EB6.l,X		; DF B6 1E F0
	bit $3F.b,X		; 34 3F
	cpy #$45.b		; C0 45
	ora $B6EF.w		; 0D EF B6
	cmp $33D0.w,X		; DD D0 33
	.db $42, $CA		; 42 CA
	sbc $44.b,S		; E3 44
	bmi -62.b		; 30 C2
	and ($0F.b,X)		; 21 0F
	cpx $EFBC.w		; EC BC EF
	ora ($22.b)		; 12 22
	and ($B6.b)		; 32 B6
	stp		; DB
	sbc $52.b,S		; E3 52
	xba		; EB
	ldx $4323.w,Y		; BE 23 43
	and $EDFFB6.l		; 2F B6 FF ED
	sep #$42		; E2 42
	cpx $4F03.w		; EC 03 4F
	tyx		; BB
	ldx $04.b,Y		; B6 04
	adc $FE.b,S		; 63 FE
	sbc $55E1EB.l,X		; FF EB E1 55
	bmi -78.b		; 30 B2
	bmi -55.b		; 30 C9
	sta $4213.w,X		; 9D 13 42
	jsr ($25DF.w,X)		; FC DF 25
	ldx $2F.b,Y		; B6 2F
	sbc $F3DE.w		; ED DE F3
	eor ($0D.b,S),Y		; 53 0D
	cpx #$FD.b		; E0 FD
	ldx $D0.b,Y		; B6 D0
	and $51.b,X		; 35 51
	cpx $D0DD.w		; EC DD D0
	and $44.b,S		; 23 44
	ldx $1E.b,Y		; B6 1E
	wai		; CB
	cmp ($32.b),Y		; D1 32
	ora ($34.b)		; 12 34
	tsb $B6AC.w		; 0C AC B6
	ora $50.b		; 05 50
	jmp.w [$0FE1]		; DC E1 0F
	ora ($44.b),Y		; 11 44
	rol $CDB6.w,X		; 3E B6 CD
	bne  16.b		; D0 10
	cmp $DF0C44.l,X		; DF 44 0C DF
	mvp $10,$B6		; 44 B6 10
	ora ($FE.b)		; 12 FE
	inc $F2CB.w		; EE CB F2
	and ($11.b)		; 32 11
	ldx $14.b,Y		; B6 14
	rti		; 40

	stp		; DB
	cpy #$65.b		; C0 65
	sbc #$35BE.w		; E9 BE 35
	ldx $3D.b,Y		; B6 3D
	cmp ($66.b),Y		; D1 66
	ora $279C.w		; 0D 9C 27
	rol $B6BA.w,X		; 3E BA B6
	cpx $5F.b		; E4 5F
	lda $EE4136.l,X		; BF 36 41 EE
	sbc $00B6FE.l,X		; FF FE B6 00
	asl $04BC.w		; 0E BC 04
	and ($1F.b,S),Y		; 33 1F
	sbc $50.b,X		; F5 50
	ldx $DE.b,Y		; B6 DE
	jmp.w [$5E06]		; DC 06 5E
	tax		; AA
	cpx $62.b		; E4 62
	cpy $26B6.w		; CC B6 26
	eor ($DD.b),Y		; 51 DD
	sbc $CB21EF.l,X		; FF EF 21 CB
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	and ($00.b),Y		; 31 00
	and $43.b,S		; 23 43
	tsb $03EC.w		; 0C EC 03
	tas		; 1B
	ldx $A0.b,Y		; B6 A0
	bit $52.b		; 24 52
	dex		; CA
	sbc $72.b,X		; F5 72
	xba		; EB
	lda ($C2.b),Y		; B1 C2
	ora ($EB.b,X)		; 01 EB
	ldy $20E1.w		; AC E1 20
	sbc $B64235.l		; EF 35 42 B6
	inc $FE0F.w		; EE 0F FE
	cpy $3303.w		; CC 03 33
	mvn $B6,$0C		; 54 0C B6
	cpx #$00.b		; E0 00
	inc $2EF1.w,X		; FE F1 2E
	lda $3213.w		; AD 13 32
	rep #$00		; C2 00
	ora $55.b,S		; 03 55
	.db $42, $1E		; 42 1E
	bne  50.b		; D0 32
	cpx $13B6.w		; EC B6 13
	and ($11.b,X)		; 21 11
	and $1E.b,X		; 35 1E
	dec $27CC.w,X		; DE CC 27
	ldx $2B.b,Y		; B6 2B
	sta $1123.w,X		; 9D 23 11
	jsl $EE33F1.l		; 22 F1 33 EE
	ldx $EB.b,Y		; B6 EB
	cmp ($3E.b)		; D2 3E
	lda $020E34.l,X		; BF 34 0E 02
	and $B6.b,X		; 35 B6
	rol $BEDD.w		; 2E DD BE
	eor $F9.b		; 45 F9
	bcs  34.b		; B0 22
	ora ($B6.b),Y		; 11 B6
	and $43.b,S		; 23 43
	sbc $C1DB.w,X		; FD DB C1
	stz $DA.b,X		; 74 DA
	lda $1133B6.l,X		; BF B6 33 11
	trb $52.b		; 14 52
	sbc $F0ED.w		; ED ED F0
	sbc $CFB6.w,X		; FD B6 CF
	bit $22.b,X		; 34 22
	sbc $DE3E25.l,X		; FF 25 3E DE
	sbc $CEB6.w		; ED B6 CE
	and $45.b,S		; 23 45
	bit $249D.w		; 2C 9D 24
	mvn $B2,$FD		; 54 FD B2
	jsr ($FCCF.w,X)		; FC CF FC
	txs		; 9A
	pea $CC40.w		; F4 40 CC
	cpx #$B6.b		; E0 B6
	and $3F.b		; 25 3F
	cmp $DCFE.w,X		; DD FE DC
	tsb $40.b		; 04 40
	dec $11B6.w,X		; DE B6 11
	ora ($44.b),Y		; 11 44
	ora $FCEE.w,X		; 1D EE FC
	bne  50.b		; D0 32
	ldx $CB.b		; A6 CB
	ora $30.b,X		; 15 30
	ora ($46.b),Y		; 11 46
	adc ($0B.b,X)		; 61 0B
	cmp $DBB6.w		; CD B6 DB
.ACCU 8
	sep #$21		; E2 21
	beq  34.b		; F0 22
	sbc $B64311.l,X		; FF 11 43 B6
	asl $C4DB.w		; 0E DB C4
	rts		; 60

	lda #$03.b		; A9 03
	and ($F1.b)		; 32 F1
	ldx $35.b,Y		; B6 35
	rol $F6BA.w		; 2E BA F6
	eor $33BFCB.l,X		; 5F CB BF 33
	ldx $11.b,Y		; B6 11
	ora ($54.b)		; 12 54
	sbc $D4CB.w,X		; FD CB D4
	adc ($A9.b,X)		; 61 A9
	ldx $F4.b,Y		; B6 F4
	adc ($BE.b,X)		; 61 BE
	and $51.b,X		; 35 51
	sbc $F7CA.w		; ED CA F7
	ldx $6E.b,Y		; B6 6E
	stz $1F12.w		; 9C 12 1F
	cop $34.b		; 02 34
	rti		; 40

	dex		; CA
	ldx $E3.b,Y		; B6 E3
	eor $63F4AA.l		; 4F AA F4 63
	cpy $4D37.w		; CC 37 4D
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	sbc ($31.b,S),Y		; F3 31
	jsr ($DFBC.w,X)		; FC BC DF
	beq  20.b		; F0 14
	ldx $3E.b,Y		; B6 3E
	dex		; CA
	cmp $71.b,S		; C3 71
	stp		; DB
	ldx $2024.w		; AE 24 20
	ldx $14.b,Y		; B6 14
	eor ($ED.b)		; 52 ED
	cmp $0C14.w		; CD 14 0C
	ldy $B602.w,X		; BC 02 B6
	and ($23.b),Y		; 31 23
	.db $42, $0E		; 42 0E
	inc $0FFF.w		; EE FF 0F
	jmp.w [$E3B6]		; DC B6 E3
	lsr $2B.b,X		; 56 2B
	cmp ($2D.b,X)		; C1 2D
	bne  86.b		; D0 56
	bit $E9B2.w,X		; 3C B2 E9
	bcc  83.b		; 90 53
	cmp $5E37.w,X		; DD 37 5E
	txs		; 9A
	sbc $B6.b,X		; F5 B6
	eor $369B.w		; 4D 9B 36
	eor $259D.w		; 4D 9D 25
	eor ($FA.b,S),Y		; 53 FA
	ldx $C2.b,Y		; B6 C2
	.db $42, $DB		; 42 DB
	lda ($73.b),Y		; B1 73
	tsx		; BA
	sbc ($45.b,S),Y		; F3 45
	ldx $4F.b,Y		; B6 4F
	lda $1E13.w,X		; BD 13 1E
	sbc $22CE.w		; ED CE 22
	brk $B6.b		; 00 B6
	ora ($35.b)		; 12 35
	and $2FD1.w		; 2D D1 2F
	sbc $B6E2DB.l		; EF DB E2 B6
	bmi   2.b		; 30 02
	ora ($34.b),Y		; 11 34
	ora $35BD.w,X		; 1D BD 35
	tsb $BBB6.w		; 0C B6 BB
	sbc ($30.b)		; F2 30
	ora ($53.b,S),Y		; 13 53
	nop		; EA
	lda $F9B646.l,X		; BF 46 B6 F9
	cpy $73.b		; C4 73
	tsx		; BA
	asl $3D.b,X		; 16 3D
	plb		; AB
	ora $B6.b		; 05 B6
	adc $DA.b,S		; 63 DA
	cpx $40.b		; E4 40
	plb		; AB
	sbc ($43.b)		; F2 43
	sbc $7515B2.l,X		; FF B2 15 75
	plx		; FA
	lda $2E4512.l,X		; BF 12 45 2E
	lda #$25A6.w		; A9 A6 25
	eor $52.b		; 45 52
	bne  -6.b		; D0 FA
	lda ($22.b,X)		; A1 22
	eor [$B6.b],Y		; 57 B6
	ora $E2BC.w		; 0D BC E2
	and ($43.b)		; 32 43
	asl $C0CC.w,X		; 1E CC C0
	lda ($D1.b)		; B2 D1
	jsl $322223.l		; 22 23 22 32
	ora $AC99.w		; 0D 99 AC
	ldx $12.b,Y		; B6 12
	eor ($FA.b,S),Y		; 53 FA
	ldx $3F46.w		; AE 46 3F
	inc $A6DC.w,X		; FE DC A6
	lda ($66.b)		; B2 66
	eor $3E.b,S		; 43 3E
	bcs  65.b		; B0 41
	dec $B6CC.w,X		; DE CC B6
	ora ($FD.b,X)		; 01 FD
	ora ($30.b,S),Y		; 13 30
	sbc $D02D24.l		; EF 24 2D D0
	ldx $31.b,Y		; B6 31
	dex		; CA
	cmp ($55.b)		; D2 55
	phd		; 0B
	sbc $51.b,S		; E3 51
	tyx		; BB
	lda ($AE.b)		; B2 AE
	eor [$51.b]		; 47 51
	stp		; DB
	dec $AEB9.w		; CE B9 AE
	ora $B6.b,S		; 03 B6
	and ($EF.b),Y		; 31 EF
	cmp $BD0E11.l,X		; DF 11 0E BD
	lsr $1A.b		; 46 1A
	ldx $B1.b,Y		; B6 B1
	lsr $40.b		; 46 40
	ldy $0D33.w,X		; BC 33 0D
	ldy $B613.w,X		; BC 13 B6
	jsr $44F1.w		; 20 F1 44
	trb $54C0.w		; 1C C0 54
	sbc $B6EF.w,X		; FD EF B6
	cpx $22D1.w		; EC D1 22
	and $40.b,S		; 23 40
	beq  -3.b		; F0 FD
	dec $F1C2.w,X		; DE C2 F1
	ora $FDF0CC.l,X		; 1F CC F0 FD
	cpx #$3F34.w		; E0 34 3F
	ldx $D5.b,Y		; B6 D5
	eor $2DE3DC.l,X		; 5F DC E3 2D
	lda $B61133.l,X		; BF 33 11 B6
	and $11.b,S		; 23 11
	sbc $CEECFF.l,X		; FF FF EC CE
	and ($1F.b,S),Y		; 33 1F
	ldx $11.b,Y		; B6 11
	and $42.b,S		; 23 42
	sbc $FEFF.w		; ED FF FE
	sbc $E2B6DC.l,X		; FF DC B6 E2
	jsl $3E3611.l		; 22 11 36 3E
	dec $12EF.w		; CE EF 12
	ldx $FD.b,Y		; B6 FD
	dec $0F14.w		; CE 14 0F
	ora ($44.b,S),Y		; 13 44
	ora $B6DF.w,X		; 1D DF B6
	sbc $C0FD0F.l,X		; FF 0F FD C0
	and $10.b,S		; 23 10
	and $4F.b,X		; 35 4F
	ldx $DB.b,Y		; B6 DB
	lda ($62.b),Y		; B1 62
	dex		; CA
	pei ($73.b)		; D4 73
	cmp #$B2F6.w		; C9 F6 B2
	adc $D9.b		; 65 D9
	lda ($64.b,S),Y		; B3 64
	ora $FDDF.w		; 0D DF FD
	tax		; AA
	ldx $34.b,Y		; B6 34
	bmi  -2.b		; 30 FE
	sbc ($11.b),Y		; F1 11
	ora $A7CFDD.l,X		; 1F DD CF A7
	eor $10.b,X		; 55 10
	and $40.b		; 25 40
	inc $6E.b,X		; F6 6E
	ldy $59EE.w		; AC EE 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bmi 112.b		; 30 70
	rol $44AE.w,X		; 3E AE 44
	mvp $54,$45		; 44 45 54
	eor $43.b		; 45 43
	mvn $52,$4F		; 54 4F 52
	rol $6F73.w		; 2E 73 6F
	jmp ($B300.w)		; 6C 00 B3
	cmp $7CE0BA.l		; CF BA E0 7C
	ora $895D83.l,X		; 1F 83 5D 89
	stz $DA8F.w		; 9C 8F DA
	sta $18.b,X		; 95 18
	stz $A257.w		; 9C 57 A2
	sta $A8.b,X		; 95 A8
	pei ($AE.b)		; D4 AE
	ora ($B5.b)		; 12 B5
	eor ($BB.b),Y		; 51 BB
	sta $C7CEC1.l		; 8F C1 CE C7
	tsb $4ACE.w		; 0C CE 4A
	pei ($89.b)		; D4 89
	phx		; DA
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	ora $2729D4.l,X		; 1F D4 29 27
	bcs -49.b		; B0 CF
	eor $FAC6.w,X		; 5D C6 FA
	eor ($93.b)		; 52 93
	eor $B007.w,Y		; 59 07 B0
	lda $B77D.w		; AD 7D B7
	ora #$9362.w		; 09 62 93
	eor $B017.w,Y		; 59 17 B0
	ldx $B77C.w		; AE 7C B7
	sbc $9462.w,Y		; F9 62 94
	eor #$C027.w		; 49 27 C0
	cmp $FDE44E.l,X		; DF 4E E4 FD
	and ($C2.b),Y		; 31 C2
	bit $C414.w		; 2C 14 C4
	sta ($5A.b)		; 92 5A
	asl $CD.b		; 06 CD
	ror $19B6.w		; 6E B6 19
	eor ($C4.b,S),Y		; 53 C4
	sta ($5A.b)		; 92 5A
	asl $CD.b		; 06 CD
	ror $19B6.w		; 6E B6 19
	mvp $DF,$C0		; 44 C0 DF
	lsr $0CD4.w		; 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	cmp $0CD44E.l,X		; DF 4E D4 0C
	and ($C2.b),Y		; 31 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C231.w		; 0C 31 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C231.w		; 0C 31 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C232.w		; 0C 32 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C232.w		; 0C 32 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C232.w		; 0C 32 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C232.w		; 0C 32 C2
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44E.w,X		; DE 4E D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C004.w,X		; 3C 04 C0
	dec $D44F.w,X		; DE 4F D4
	tsb $C132.w		; 0C 32 C1
	bit $C404.w,X		; 3C 04 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	cmp [$DC.b],Y		; D7 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C4.b,X		; 35 C4
	sta ($6B.b),Y		; 91 6B
	inc $DC.b		; E6 DC
	rts		; 60

	lda $29.b		; A5 29
	and $C0.b,X		; 35 C0
	dec $D44F.w,X		; DE 4F D4
	trb $C122.w		; 1C 22 C1
	bit $C0F4.w,X		; 3C F4 C0
	dec $D44F.w,X		; DE 4F D4
	trb $C122.w		; 1C 22 C1
	bit $C0F4.w,X		; 3C F4 C0
	dec $D34F.w,X		; DE 4F D3
	trb $C122.w		; 1C 22 C1
	bit $C0F4.w,X		; 3C F4 C0
	dec $D44F.w,X		; DE 4F D4
	trb $D122.w		; 1C 22 D1
	rol $A002.w		; 2E 02 A0
	bcc 122.b		; 90 7A
	inc $BF.b,X		; F6 BF
	jmp ($ECD6.w)		; 6C D6 EC
	bvc -96.b		; 50 A0
	cpy $1C.b		; C4 1C
	jsl $F12ED0.l		; 22 D0 2E F1
	sbc $A47010.l,X		; FF 10 70 A4
	cpx $E00E.w		; EC 0E E0
	cpy #$042A.w		; C0 2A 04
	ldx $6C70.w		; AE 70 6C
	ldx $EA.b		; A6 EA
	rti		; 40

	ldx #$242A.w		; A2 2A 24
	cpy #$7C60.w		; C0 60 7C
	cmp [$0C.b]		; C7 0C
	stz $C4.b,X		; 74 C4
	jmp $C444.w		; 4C 44 C4
	bvc 121.b		; 50 79
	ora [$90.b]		; 07 90
	adc $9007.w,Y		; 79 07 90
	adc $5097.w,Y		; 79 97 50
	sta $9070.w,Y		; 99 70 90
	ora #$9000.w		; 09 00 90
	ora #$6000.w		; 09 00 60
	cpy $CC0C.w		; CC 0C CC
	cpy $CCC9.w		; CC C9 CC
	stz $6409.w		; 9C 09 64
	and ($C0.b,S),Y		; 33 C0
	jmp $CCC7.w		; 4C C7 CC
	bvs -60.b		; 70 C4
	tsb $9050.w		; 0C 50 90
	sta $9009.w,Y		; 99 09 90
	ora #$9000.w		; 09 00 90
	ora #$9050.w		; 09 50 90
	sta $9009.w,Y		; 99 09 90
	ora #$0000.w		; 09 00 00
	ora #$0000.w		; 09 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	bvs   7.b		; 70 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	brk $90.b		; 00 90
	ora #$5000.w		; 09 00 50
	bcc   9.b		; 90 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$5100.w		; 09 00 51
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$9990.w		; 09 90 99
	bcc  -1.b		; 90 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0BFFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0BFFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0BFFFF. Skipping.
.ENDS
