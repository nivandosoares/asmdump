.BANK 22 SLOT 0
.ORG $0000

.SECTION "Bank22" FORCE

	pla		; 68
	ora ($00.b,X)		; 01 00
	cop $C0.b		; 02 C0
	ora ($00.b,X)		; 01 00
	tsb $28.b		; 04 28
	cop $00.b		; 02 00
	asl $E0.b		; 06 E0
	cop $00.b		; 02 00
	asl A		; 0A
	cld		; D8
	ora $00.b,S		; 03 00
	stx $10.b		; 86 10
	asl $00.b		; 06 00
	stx $48.b		; 86 48
	php		; 08
	brk $88.b		; 00 88
	bpl  11.b		; 10 0B
	brk $8C.b		; 00 8C
	sei		; 78
	bpl   0.b		; 10 00
	cop $D0.b		; 02 D0
	bpl   0.b		; 10 00
	tsb $58.b		; 04 58
	ora ($00.b),Y		; 11 00
	cop $90.b		; 02 90
	ora ($00.b),Y		; 11 00
	ora ($C0.b,X)		; 01 C0
	ora ($00.b),Y		; 11 00
	cop $F8.b		; 02 F8
	ora ($00.b),Y		; 11 00
	cop $30.b		; 02 30
	ora ($00.b)		; 12 00
	cop $68.b		; 02 68
	ora ($00.b)		; 12 00
	cop $A0.b		; 02 A0
	ora ($00.b)		; 12 00
	cop $D8.b		; 02 D8
	ora ($00.b)		; 12 00
	cop $10.b		; 02 10
	ora ($00.b,S),Y		; 13 00
	cop $48.b		; 02 48
	ora ($00.b,S),Y		; 13 00
	cop $80.b		; 02 80
	ora ($00.b,S),Y		; 13 00
	ora ($B0.b,X)		; 01 B0
	ora ($00.b,S),Y		; 13 00
	ora ($E0.b,X)		; 01 E0
	ora ($00.b,S),Y		; 13 00
	ora ($10.b,X)		; 01 10
	trb $00.b		; 14 00
	ora ($40.b,X)		; 01 40
	trb $00.b		; 14 00
	ora ($70.b,X)		; 01 70
	trb $00.b		; 14 00
	ora ($A0.b,X)		; 01 A0
	trb $00.b		; 14 00
	ora ($D0.b,X)		; 01 D0
	trb $00.b		; 14 00
	ora ($00.b,X)		; 01 00
	ora $00.b,X		; 15 00
	ora ($30.b,X)		; 01 30
	ora $00.b,X		; 15 00
	ora ($60.b,X)		; 01 60
	ora $00.b,X		; 15 00
	ora ($90.b,X)		; 01 90
	ora $00.b,X		; 15 00
	ora ($C0.b,X)		; 01 C0
	ora $00.b,X		; 15 00
	ora ($F0.b,X)		; 01 F0
	ora $00.b,X		; 15 00
	ora ($20.b,X)		; 01 20
	asl $00.b,X		; 16 00
	ora ($50.b,X)		; 01 50
	asl $00.b,X		; 16 00
	ora ($80.b,X)		; 01 80
	asl $00.b,X		; 16 00
	ora ($B0.b,X)		; 01 B0
	asl $00.b,X		; 16 00
	ora ($E0.b,X)		; 01 E0
	asl $00.b,X		; 16 00
	ora ($10.b,X)		; 01 10
	ora [$00.b],Y		; 17 00
	ora ($40.b,X)		; 01 40
	ora [$00.b],Y		; 17 00
	cop $98.b		; 02 98
	ora [$00.b],Y		; 17 00
	tsb $20.b		; 04 20
	clc		; 18
	brk $06.b		; 00 06
	sed		; F8
	clc		; 18
	brk $08.b		; 00 08
	brk $1A.b		; 00 1A
	brk $86.b		; 00 86
	clv		; B8
	trb $8600.w		; 1C 00 86
	beq  31.b		; F0 1F
	brk $88.b		; 00 88
	sec		; 38
	and $00.b,S		; 23 00
	sty $27A0.w		; 8C A0 27
	brk $02.b		; 00 02
	sed		; F8
	and [$00.b]		; 27 00
	tsb $60.b		; 04 60
	plp		; 28
	brk $03.b		; 00 03
	cpx #$0028.w		; E0 28 00
	asl $D8.b		; 06 D8
	and #$0900.w		; 29 00 09
	pha		; 48
	pld		; 2B
	brk $0E.b		; 00 0E
	bra  45.b		; 80 2D
	brk $89.b		; 00 89
	bvc  50.b		; 50 32
	brk $8B.b		; 00 8B
	bmi  56.b		; 30 38
	brk $8D.b		; 00 8D
	jsr $003F.w		; 20 3F 00
	sty $C8.b,X		; 94 C8
	eor #$0300.w		; 49 00 03
	pha		; 48
	lsr A		; 4A
	brk $05.b		; 00 05
	clc		; 18
	phk		; 4B
	brk $04.b		; 00 04
	cpy #$004B.w		; C0 4B 00
	asl $B8.b		; 06 B8
	jmp $0A00.w		; 4C 00 0A
	bvc  78.b		; 50 4E
	brk $0F.b		; 00 0F
	bcs  80.b		; B0 50
	brk $89.b		; 00 89
	bra  85.b		; 80 55
	brk $8B.b		; 00 8B
	rts		; 60

	tad		; 5B
	brk $8E.b		; 00 8E
	cld		; D8
	.db $62, $00, $95		; 62 00 95
	dey		; 88
	adc $0400.w		; 6D 00 04
	bmi 110.b		; 30 6E
	brk $06.b		; 00 06
	plp		; 28
	adc $A80300.l		; 6F 00 03 A8
	adc $780500.l		; 6F 00 05 78
	bvs   0.b		; 70 00
	ora #$71E8.w		; 09 E8 71
	brk $10.b		; 00 10
	bvs 116.b		; 70 74
	brk $89.b		; 00 89
	rti		; 40

	adc $8B00.w,Y		; 79 00 8B
	brk $00.b		; 00 00
	ora ($8E.b,X)		; 01 8E
	sei		; 78
	ora [$01.b]		; 07 01
	sta ($98.b,S),Y		; 93 98
	ora ($01.b),Y		; 11 01
	ora $18.b,S		; 03 18
	ora ($01.b)		; 12 01
	asl $10.b		; 06 10
	ora ($01.b,S),Y		; 13 01
	cop $68.b		; 02 68
	ora ($01.b,S),Y		; 13 01
	tsb $10.b		; 04 10
	trb $01.b		; 14 01
	asl $08.b		; 06 08
	ora $01.b,X		; 15 01
	php		; 08
	bvc  22.b		; 50 16
	ora ($86.b,X)		; 01 86
	dey		; 88
	ora $8601.w,Y		; 19 01 86
	cpy #$011C.w		; C0 1C 01
	dey		; 88
	php		; 08
	and ($01.b,X)		; 21 01
	sty $2670.w		; 8C 70 26
	ora ($02.b,X)		; 01 02
	iny		; C8
	rol $01.b		; 26 01
	tsb $02.b		; 04 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	ora $F8.b		; 05 F8
	sbc $F8FFFC.l,X		; FF FC FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $00.b		; 00 00
	rti		; 40

	asl $FF1E.w,X		; 1E 1E FF
	sbc $FF001E.l,X		; FF 1E 00 FF
	brk $00.b		; 00 00
	brk $9E.b		; 00 9E
	sbc $FFC000.l,X		; FF 00 C0 FF
	brk $A1.b		; 00 A1
	asl $0000.w,X		; 1E 00 00
	asl $FFFF.w,X		; 1E FF FF
	brk $0C.b		; 00 0C
	sbc $C061FF.l,X		; FF FF 61 C0
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$C000.w		; C0 00 C0
	cpy #$4000.w		; C0 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $C0.b		; 00 C0
	cpy #$C080.w		; C0 80 C0
	cpy #$0004.w		; C0 04 00
	cop $00.b		; 02 00
	sbc $F606.w,Y		; F9 06 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $00FFF6.l,X		; FF F6 FF 00
	mvp $00,$00		; 44 00 00
	sbc $FEFF.w,Y		; F9 FF FE
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $01FFFE.l,X		; FF FE FF 01
	mvp $00,$00		; 44 00 00
	brk $00.b		; 00 00
	ora $5F1F2F.l		; 0F 2F 1F 5F
	adc $00077F.l,X		; 7F 7F 07 00
	ora [$00.b]		; 07 00
	adc $000000.l,X		; 7F 00 00 00
	sbc $0FB000.l,X		; FF 00 B0 0F
	cpx #$801F.w		; E0 1F 80
	brk $87.b		; 00 87
	adc $FF7F87.l,X		; 7F 87 7F FF
	brk $03.b		; 00 03
	sbc $00FFC7.l,X		; FF C7 FF 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0C038.l,X		; FF 38 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	sbc [$09.b],Y		; F7 09
	pea $F7FF.w		; F4 FF F7
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $01FFF4.l,X		; FF F4 FF 01
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $004400.l,X		; FF 00 44 00
	brk $F7.b		; 00 F7
	sbc $02FFFC.l,X		; FF FC FF 02
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $03FFFC.l,X		; FF FC FF 03
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	sbc $004402.l,X		; FF 02 44 00
	brk $00.b		; 00 00
	bra   7.b		; 80 07
	phd		; 0B
	ora [$0F.b]		; 07 0F
	eor $00802F.l		; 4F 2F 80 00
	cmp $78FF78.l		; CF 78 FF 78
	sbc $007F20.l,X		; FF 20 7F 00
	stz $B807.w		; 9C 07 B8
	ora [$F0.b]		; 07 F0
	eor $FF7F80.l		; 4F 80 7F FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	plx		; FA
	jsr ($FEFE.w,X)		; FC FE FE
	inc $0000.w,X		; FE 00 00
	ldx $FF03.w,Y		; BE 03 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	jsr ($FC03.w,X)		; FC 03 FC
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $000000.l,X		; FF 00 00 00
	inc $001E.w,X		; FE 1E 00
	inc $E000.w,X		; FE 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFE00.l,X		; FF 00 FE FF
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $00EFE0.l		; 0F E0 EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $EFE0FF.l,X		; FF FF E0 EF
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $05.b		; 00 05
	brk $F4.b		; 00 F4
	asl $FFEF.w		; 0E EF FF
	pea $EFFF.w		; F4 FF EF
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $01FFEF.l,X		; FF EF FF 01
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	sbc $004400.l,X		; FF 00 44 00
	brk $FF.b		; 00 FF
	sbc $01FFEF.l,X		; FF EF FF 01
	mvp $00,$00		; 44 00 00
	pea $F7FF.w		; F4 FF F7
	sbc $000402.l,X		; FF 02 04 00
	brk $FC.b		; 00 FC
	sbc $03FFF7.l,X		; FF F7 FF 03
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F7.b		; 00 F7
	sbc $004402.l,X		; FF 02 44 00
	brk $FF.b		; 00 FF
	sbc $03FFF7.l,X		; FF F7 FF 03
	mvp $00,$00		; 44 00 00
	pea $FFFF.w		; F4 FF FF
	sbc $000404.l,X		; FF 04 04 00
	brk $0A.b		; 00 0A
	brk $FF.b		; 00 FF
	sbc $000404.l,X		; FF 04 04 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $434641.l,X		; 7F 41 46 43
	eor $4F73.w		; 4D 73 4F
	cpy #$80BF.w		; C0 BF 80
	brk $C9.b		; 00 C9
	rol $7F.b,X		; 36 7F
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	ora ($CE.b,X)		; 01 CE
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	brk $80.b		; 00 80
	adc $0049FF.l,X		; 7F FF 49 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FB0000.l,X		; FF 00 00 FB
	asl A		; 0A
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF.b,X		; F5 FF
	cmp #$FF36.w		; C9 36 FF
	brk $FF.b		; 00 FF
	jsr $00FF.w		; 20 FF 00
	sbc $0F7F20.l,X		; FF 20 7F 0F
	sbc $FF00F7.l,X		; FF F7 00 FF
	sbc $7FFF49.l,X		; FF 49 FF 7F
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00F700.l,X		; FF 00 F7 00
	adc $FFFF00.l,X		; 7F 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $CADB00.l,X		; FF 00 DB CA
	cpx #$0EE0.w		; E0 E0 0E
	inc $FFFF.w		; EE FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $0EF500.l,X		; FF 00 F5 0E
	sbc $F1EE00.l,X		; FF 00 EE F1
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	bpl   0.b		; 10 00
	sbc $FFEA12.l		; EF 12 EA FF
	sbc $FFEAFF.l		; EF FF EA FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFEAFF.l,X		; FF FF EA FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	nop		; EA
	sbc $004400.l,X		; FF 00 44 00
	brk $EF.b		; 00 EF
	sbc $04FFFA.l,X		; FF FA FF 04
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $06FFFA.l,X		; FF FA FF 06
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	sbc $004404.l,X		; FF 04 44 00
	brk $00.b		; 00 00
	jsr $5F00.w		; 20 00 5F
	brk $21.b		; 00 21
	brk $20.b		; 00 20
	jsr $1802.w		; 20 02 18
	lda $99.b		; A5 99
	ldy $1F.b		; A4 1F
	ora $3F001F.l,X		; 1F 1F 00 3F
	brk $61.b		; 00 61
	brk $61.b		; 00 61
	brk $43.b		; 00 43
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora $00E0.w,Y		; 19 E0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $FF603F.l,X		; 7F 3F 60 FF
	sbc $FFC07F.l,X		; FF 7F C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$807F.w		; C0 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $60FFFF.l,X		; FF FF FF 60
	sbc $60FFFF.l,X		; FF FF FF 60
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $60C8E0.l,X		; FF E0 C8 60
	beq -16.b		; F0 F0
	cpx $31.b		; E4 31
	plx		; FA
	sbc $FFF2.w,Y		; F9 F2 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $38.b		; 00 38
	cpx #$E018.w		; E0 18 E0
	trb $0FF0.w		; 1C F0 0F
	beq  15.b		; F0 0F
	sbc $0000.w,Y		; F9 00 00
	adc $007C00.l,X		; 7F 00 7C 00
	ora $83.b,S		; 03 83
	inc $00FD.w,X		; FE FD 00
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora ($FF.b,X)		; 01 FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	brk $FD.b		; 00 FD
	jsr ($FB03.w,X)		; FC 03 FB
	ora ($FD.b,X)		; 01 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FB01.w,X		; FE 01 FB
	jsr ($FEFD.w,X)		; FC FD FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $009400.l,X		; FF 00 94 00
	xce		; FB
	ora $FC.b,S		; 03 FC
	sbc $FBF8.w,X		; FD F8 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8FF00.l,X		; FF 00 FF F8
	ora [$F8.b]		; 07 F8
	sbc $FB03.w,X		; FD 03 FB
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	jsr ($FB07.w,X)		; FC 07 FB
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $0303FF.l,X		; FF FF 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $7F.b		; 00 7F
	brk $76.b		; 00 76
	ora $7F1F76.l,X		; 1F 76 1F 7F
	brk $7F.b		; 00 7F
	and $7F107F.l,X		; 3F 7F 10 7F
	sbc $FF3FC0.l,X		; FF C0 3F FF
	and $FF20FF.l,X		; 3F FF 20 FF
	jsr $3FFF.w		; 20 FF 3F
	cpy #$FF00.w		; C0 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	adc $00FFFF.l,X		; 7F FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F6.b		; 00 F6
	ora $FF1FF6.l,X		; 1F F6 1F FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFE0FF.l,X		; FF FF E0 FF
	cpx #$FFFF.w		; E0 FF FF
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bpl   0.b		; 10 00
	nop		; EA
	asl $E5.b,X		; 16 E5
	sbc $E5FFEA.l,X		; FF EA FF E5
	sbc $000400.l,X		; FF 00 04 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E5.b		; 00 E5
	sbc $004400.l,X		; FF 00 44 00
	brk $EA.b		; 00 EA
	sbc $04FFF5.l,X		; FF F5 FF 04
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $06FFF5.l,X		; FF F5 FF 06
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $004404.l,X		; FF 04 44 00
	brk $00.b		; 00 00
	clc		; 18
	brk $2F.b		; 00 2F
	bpl  64.b		; 10 40
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	tsb $0C23.w		; 0C 23 0C
	lda ($07.b)		; B2 07
	brk $1F.b		; 00 1F
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $61.b		; 00 61
	brk $6F.b		; 00 6F
	brk $7F.b		; 00 7F
	tsb $0000.w		; 0C 00 00
	brk $FF.b		; 00 FF
	ora $8F1C57.l		; 0F 57 1C 8F
	tas		; 1B
	lda $331F3C.l,X		; BF 3C 1F 33
	adc $FF3F6C.l,X		; 7F 6C 3F FF
	brk $FF.b		; 00 FF
	brk $78.b		; 00 78
	ora $E01FF0.l		; 0F F0 1F E0
	ora $C03FE0.l,X		; 1F E0 3F C0
	and $007FC0.l,X		; 3F C0 7F 00
	brk $00.b		; 00 00
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $01FFFE.l,X		; FF FE FF 01
	sbc $01FFFE.l,X		; FF FE FF 01
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	and $6F18EF.l,X		; 3F EF 18 6F
	tya		; 98
	adc $007F08.l,X		; 7F 08 7F 00
	sbc $FF1E80.l,X		; FF 80 1E FF
	inc $C0FF.w,X		; FE FF C0
	brk $FF.b		; 00 FF
	bpl -104.b		; 10 98
	adc [$EF.b],Y		; 77 EF
	bpl  -1.b		; 10 FF
	brk $7F.b		; 00 7F
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	ror A		; 6A
	brk $9F.b		; 00 9F
	cpy #$7F7F.w		; C0 7F 7F
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $1FF500.l,X		; FF 00 F5 1F
	sbc $0FF01F.l,X		; FF 1F F0 0F
	adc $FF0080.l,X		; 7F 80 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	bcs   0.b		; B0 00
	cmp $F7F01F.l		; CF 1F F0 F7
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $C07F00.l,X		; FF 00 7F C0
	sbc $807FC0.l,X		; FF C0 7F 80
	sbc [$0F.b],Y		; F7 0F
	brk $9E.b		; 00 9E
	adc $00C01F.l,X		; 7F 1F C0 00
	dex		; CA
	ora $FB.b,X		; 15 FB
	rol $3FE0.w		; 2E E0 3F
	stp		; DB
	rol $35CA.w		; 2E CA 35
	adc $00E000.l,X		; 7F 00 E0 00
	cpy #$DF3F.w		; C0 3F DF
	and $FF11FF.l,X		; 3F FF 11 FF
	ora ($FF.b),Y		; 11 FF
	ora ($DF.b),Y		; 11 DF
	ora $FF0000.l,X		; 1F 00 00 FF
	sbc $AA0000.l,X		; FF 00 00 AA
	eor $B5.b,X		; 55 B5
	nop		; EA
	asl A		; 0A
	sbc $B5.b,X		; F5 B5
	nop		; EA
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $00FFFF.l,X		; 1F FF FF 00
	brk $FF.b		; 00 FF
	sbc $AA0000.l,X		; FF 00 00 AA
	eor ($50.b)		; 52 50
	tay		; A8
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFD.l,X		; FF FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $AA0000.l,X		; FF 00 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00EF.w		; E0 EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  20.b		; 80 14
	brk $E6.b		; 00 E6
	inc A		; 1A
	cpx #$E6FF.w		; E0 FF E6
	sbc $00FFE0.l,X		; FF E0 FF 00
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $02FFE0.l,X		; FF E0 FF 02
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $E0.b		; 00 E0
	sbc $004400.l,X		; FF 00 44 00
	brk $FB.b		; 00 FB
	sbc $02FFE0.l,X		; FF E0 FF 02
	mvp $00,$00		; 44 00 00
	inc $FF.b		; E6 FF
	beq  -1.b		; F0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	beq  -1.b		; F0 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	phd		; 0B
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $FB.b		; 00 FB
	sbc $06FFF0.l,X		; FF F0 FF 06
	mvp $00,$00		; 44 00 00
	brk $04.b		; 00 04
	brk $17.b		; 00 17
	ora [$0F.b]		; 07 0F
	php		; 08
	bmi   0.b		; 30 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	rts		; 60

	asl $29.b		; 06 29
	ora $00.b,S		; 03 00
	ora $001F00.l		; 0F 00 1F 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	jsr $2000.w		; 20 00 20
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $07FFFF.l,X		; FF FF FF 07
	ora ($06.b,S),Y		; 13 06
	pld		; 2B
	and $471C07.l		; 2F 07 1C 47
	eor $00FF9F.l		; 4F 9F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	trb $3C07.w		; 1C 07 3C
	ora [$38.b]		; 07 38
	ora $F00F78.l		; 0F 78 0F F0
	ora $000000.l		; 0F 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $541748.l,X		; FF 48 17 54
	phd		; 0B
	lsr A		; 4A
	ora $60.b,X		; 15 60
	ora $F71C77.l,X		; 1F 77 1C F7
	php		; 08
	adc [$9C.b],Y		; 77 9C
	adc $3CDF00.l,X		; 7F 00 DF 3C
	cmp $3FDF3E.l,X		; DF 3E DF 3F
	cpx #$FF00.w		; E0 00 FF
	php		; 08
	php		; 08
	sbc $FF08FF.l,X		; FF FF 08 FF
	brk $02.b		; 00 02
	sbc $BA45.w,X		; FD 45 BA
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor [$FF.b]		; 47 FF
	sbc $00FFFF.l		; EF FF FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $40.b		; 00 40
	lda $5548B7.l,X		; BF B7 48 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F7EAE2.l,X		; FF E2 EA F7
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($E8.b)		; 12 E8
	ror A		; 6A
	bcc  82.b		; 90 52
	tay		; A8
	asl $F8.b		; 06 F8
	inc $EF38.w		; EE 38 EF
	bpl -18.b		; 10 EE
	and $00FE.w,Y		; 39 FE 00
	xce		; FB
	bit $7CBB.w,X		; 3C BB 7C
	xce		; FB
	jsr ($0007.w,X)		; FC 07 00
	sbc $FF1010.l,X		; FF 10 10 FF
	sbc $00FF10.l,X		; FF 10 FF 00
	eor #$0060.w		; 49 60 00
	cmp $606F50.l,X		; DF 50 6F 60
	brk $4A.b		; 00 4A
	ora $56.b		; 05 56
	ora #$1748.w		; 09 48 17
	mvn $2F,$0B		; 54 0B 2F
	asl $3F.b		; 06 3F
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	ora $DD3FCF.l,X		; 1F CF 3F DD
	rol $3CDF.w,X		; 3E DF 3C
	cmp $8F1C3C.l,X		; DF 3C 1C 8F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $ED.b,X		; 55 ED
	ora ($02.b)		; 12 02
	sbc $BA45.w,X		; FD 45 BA
	beq  31.b		; F0 1F
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $EF57FF.l,X		; FF FF 57 EF
	sbc $47FF47.l,X		; FF 47 FF 47
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $AD.b,X		; 55 AD
	tax		; AA
	phx		; DA
	sta $AA55.w		; 8D 55 AA
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF57FF.l,X		; FF FF 57 FF
	adc [$FF.b],Y		; 77 FF
	sbc $007FFF.l,X		; FF FF 7F 00
	sbc $BF5F80.l,X		; FF 80 5F BF
	cmp $BFBF5F.l,X		; DF 5F BF BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	and $007F00.l,X		; 3F 00 7F 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	bra   0.b		; 80 00
	sbc $FF3FFF.l,X		; FF FF 3F FF
	cpy #$00BF.w		; C0 BF 00
	sbc $008000.l,X		; FF 00 80 00
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $80FFFF.l,X		; 3F FF FF 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	brk $07.b		; 00 07
	ora ($FB.b,X)		; 01 FB
	sed		; F8
	sed		; F8
	jsr ($E707.w,X)		; FC 07 E7
	ora ($F9.b,X)		; 01 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FE01.l,X		; FF 01 FE 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$F8.b]		; E7 F8
	sbc $00FE.w,Y		; F9 FE 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	jsr $54FF.w		; 20 FF 54
	inc $0000.w,X		; FE 00 00
	ora ($FF.b,X)		; 01 FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	jsr ($FCAB.w,X)		; FC AB FC
	ora [$F8.b]		; 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($0003.w,X)		; FC 03 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $03FFFC.l,X		; FF FC FF 03
	sbc $FF00.w,X		; FD 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	jsr ($FFFF.w,X)		; FC FF FF
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	inc $FF00.w,X		; FE 00 FF
	ora ($FA.b,X)		; 01 FA
	sbc $FAFB.w,X		; FD FB FA
	sbc $00FD.w,X		; FD FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE00FF.l,X		; FF FF 00 FE
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $28800C.l,X		; FF 0C 80 28
	brk $E2.b		; 00 E2
	ora $E2FFDB.l,X		; 1F DB FF E2
	sbc $00FFDB.l,X		; FF DB FF 00
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $02FFDB.l,X		; FF DB FF 02
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $DB.b		; 00 DB
	sbc $000404.l,X		; FF 04 04 00
	brk $12.b		; 00 12
	brk $DB.b		; 00 DB
	sbc $000406.l,X		; FF 06 04 00
	brk $E2.b		; 00 E2
	sbc $08FFEB.l,X		; FF EB FF 08
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $EB.b		; 00 EB
	sbc $00040C.l,X		; FF 0C 04 00
	brk $12.b		; 00 12
	brk $EB.b		; 00 EB
	sbc $00040E.l,X		; FF 0E 04 00
	brk $E2.b		; 00 E2
	sbc $20FFFB.l,X		; FF FB FF 20
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $22FFFB.l,X		; FF FB FF 22
	tsb $00.b		; 04 00
	brk $10.b		; 00 10
	brk $FB.b		; 00 FB
	sbc $004420.l,X		; FF 20 44 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $004422.l,X		; FF 22 44 00
	brk $07.b		; 00 07
	ora $171300.l		; 0F 00 13 17
	ora [$04.b],Y		; 17 04
	plp		; 28
	jsr $0028.w		; 20 28 00
	php		; 08
	php		; 08
	bvc  64.b		; 50 40
	bvc   0.b		; 50 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $010500.l,X		; FF 00 05 01
	php		; 08
	ora ($0B.b,X)		; 01 0B
	ora ($13.b,X)		; 01 13
	ora $11.b,S		; 03 11
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$00.b]		; 07 00
	ora $010E01.l		; 0F 01 0E 01
	asl $1E01.w,X		; 1E 01 1E
	ora $FF.b,S		; 03 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $E07FFF.l,X		; FF FF 7F E0
	sbc $E0FFDF.l,X		; FF DF FF E0
	sbc $00FF9F.l,X		; FF 9F FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FCFFFF.l,X		; FF FF FF FC
	plx		; FA
	asl $EEFC.w,X		; 1E FC EE
	sbc $E7FF1E.l,X		; FF 1E FF E7
	inc $0000.w,X		; FE 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $8000FF.l,X		; FF FF 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	cpy #$2000.w		; C0 00 20
	ldy #$80A0.w		; A0 A0 80
	bvc  16.b		; 50 10
	bvc   0.b		; 50 00
	rti		; 40

	rti		; 40

	plp		; 28
	php		; 08
	plp		; 28
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $7A.b		; 00 7A
	ora [$76.b],Y		; 17 76
	tas		; 1B
	ply		; 7A
	ora [$67.b],Y		; 17 67
	ora $156A.w,Y		; 19 6A 15
	adc $1A.b		; 65 1A
	bvs  31.b		; 70 1F
	adc $0CFF0A.l,X		; 7F 0A FF 0C
	sbc $0CFF0C.l,X		; FF 0C FF 0C
	sbc $FF0E.w,X		; FD 0E FF
	ora $E00FEF.l		; 0F EF 0F E0
	brk $FB.b		; 00 FB
	tsb $72.b		; 04 72
	cmp $72FE53.l,X		; DF 53 FE 72
	cmp $AAACDF.l,X		; DF DF AC AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $21FF00.l,X		; FF 00 FF 21
	sbc $21FF21.l,X		; FF 21 FF 21
	lda $FF73.w		; AD 73 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $58AC00.l,X		; FF 00 AC 58
	bvc -96.b		; 50 A0
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $FFF700.l,X		; FF 00 F7 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $55EA00.l,X		; FF 00 EA 55
	ora $2A.b,X		; 15 2A
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $FFBF00.l,X		; FF 00 BF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $55AB00.l,X		; FF 00 AB 55
	eor $AB.b,X		; 55 AB
	plb		; AB
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $29.b		; 00 29
	sbc $29EF39.l,X		; FF 39 EF 29
	sbc $AAC6FF.l,X		; FF FF C6 AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	sbc $10FF01.l,X		; FF 01 FF 10
	sbc $10FF10.l,X		; FF 10 FF 10
	dec $39.b,X		; D6 39
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $60B800.l,X		; FF 00 B8 60
	sei		; 78
	ldy #$60B8.w		; A0 B8 60
	cli		; 58
	ldy #$6098.w		; A0 98 60
	cli		; 58
	ldy #$E038.w		; A0 38 E0
	sed		; F8
	rti		; 40

	jsr ($FCC0.w,X)		; FC C0 FC
	cpy #$C0FC.w		; C0 FC C0
	jsr ($FCC0.w,X)		; FC C0 FC
	cpy #$C0DC.w		; C0 DC C0
	trb $7C00.w		; 1C 00 7C
	bra   3.b		; 80 03
	trb $44.b		; 14 44
	bvc  67.b		; 50 43
	jmp ($CF60.w,X)		; 7C 60 CF
	cli		; 58
	and [$70.b]		; 27 70
	brk $62.b		; 00 62
	ora $67.b		; 05 67
	ora #$0077.w		; 09 77 00
	and [$03.b],Y		; 37 03
	ora $001F03.l,X		; 1F 03 1F 00
	cpy #$F000.w		; C0 00 F0
	ora $ED1FE7.l		; 0F E7 1F ED
	asl $A703.w,X		; 1E 03 A7
	sta $27.b,S		; 83 27
	ora [$C3.b]		; 07 C3
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $DF.b,X		; 55 DF
	ldy $03BC.w		; AC BC 03
	ldy $FC03.w,X		; BC 03 FC
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $ADFFFF.l,X		; FF FF FF AD
	adc ($E0.b,S),Y		; 73 E0
	sbc $FFFF1F.l,X		; FF 1F FF FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $AA0000.l,X		; FF 00 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $5B.b,X		; 55 5B
	plb		; AB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFF4FF.l,X		; FF FF F4 FF
	cpy #$FFFF.w		; C0 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $AA0000.l,X		; FF 00 00 AA
	eor $55.b,X		; 55 55
	ror A		; 6A
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFBFFF.l,X		; FF FF BF FF
	ora $FFE3FF.l,X		; 1F FF E3 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	ora $94.b,S		; 03 94
	tsb $90.b		; 04 90
	sta $0C.b,S		; 83 0C
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	tax		; AA
	eor $FF.b,X		; 55 FF
	dec $F7.b		; C6 F7
	brk $F7.b		; 00 F7
	ora $FF.b,S		; 03 FF
	sta $FF.b,S		; 83 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $D6FFFF.l,X		; FF FF FF D6
	and $A000.w,Y		; 39 00 A0
	bra  32.b		; 80 20
	brk $E8.b		; 00 E8
	bpl -60.b		; 10 C4
	pla		; 68
	bcc  56.b		; 90 38
	brk $98.b		; 00 98
	brk $58.b		; 00 58
	bra -72.b		; 80 B8
	brk $B8.b		; 00 B8
	brk $F0.b		; 00 F0
	brk $E8.b		; 00 E8
	brk $0C.b		; 00 0C
	brk $3C.b		; 00 3C
	cpy #$E09C.w		; C0 9C E0
	jmp.w [$7BE0]		; DC E0 7B
	asl $8E7B.w		; 0E 7B 8E
	adc $007F0A.l,X		; 7F 0A 7F 00
	adc $80FF00.l,X		; 7F 00 FF 80
	and $5FDF80.l,X		; 3F 80 DF 5F
	sbc $758E04.l,X		; FF 04 8E 75
	xce		; FB
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	and $FFDFAF.l,X		; 3F AF DF FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	phd		; 0B
	xba		; EB
	brk $74.b		; 00 74
	brk $80.b		; 00 80
	cpy #$00FF.w		; C0 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	pea $FF1F.w		; F4 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	jsr ($B9A0.w,X)		; FC A0 B9
	ora $07.b,S		; 03 07
	ora $0000FF.l		; 0F FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $BF.b		; 00 BF
	cpx #$E05F.w		; E0 5F E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	sbc $EFD7F0.l,X		; FF F0 D7 EF
	sbc $FE0100.l,X		; FF 00 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l		; EF 00 FF 00
	sei		; 78
	cpy #$C478.w		; C0 78 C4
	sed		; F8
	rti		; 40

	sed		; F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	tsb $F0.b		; 04 F0
	tsb $EC.b		; 04 EC
	inx		; E8
	jsr ($C480.w,X)		; FC 80 C4
	clv		; B8
	jmp ($FC80.w,X)		; 7C 80 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $BF.b		; 00 BF
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $E0E0FF.l,X		; FF FF E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $1F7F7F.l,X		; FF 7F 7F 1F
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -97.b		; 80 9F
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
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
	cpy #$8000.w		; C0 00 80
	cpx #$80E0.w		; E0 E0 80
	cpx #$E080.w		; E0 80 E0
	cpx #$00E0.w		; E0 E0 00
	brk $60.b		; 00 60
	cpy #$4000.w		; C0 00 40
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rts		; 60

	bra   0.b		; 80 00
	cpx #$6000.w		; E0 00 60
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
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $08.b		; 00 08
	sbc $FCFCFB.l,X		; FF FB FC FC
	sbc $00FFFB.l,X		; FF FB FF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FC.b		; 05 FC
	plx		; FA
	xce		; FB
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000000.l,X		; FF 00 00 00
	brk $C3.b		; 00 C3
	cmp $C3.b,S		; C3 C3
	cmp $00.b,S		; C3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00.b,S		; C3 00
	cmp $00.b,S		; C3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $0B.b		; 00 0B
	plx		; FA
	sbc $FAFA.w,Y		; F9 FA FA
	sbc $00FFF9.l,X		; FF F9 FF 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	asl $FEF5.w		; 0E F5 FE
	sbc ($F7.b),Y		; F1 F7
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	bpl -13.b		; 10 F3
	pea $F4F5.w		; F4 F5 F4
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $F4.b		; 00 F4
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	trb $EF.b		; 14 EF
	sbc ($F3.b),Y		; F1 F3
	sbc ($FF.b)		; F2 FF
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $F100.w		; 0C 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	clc		; 18
	xba		; EB
	sbc $F0F1.w		; ED F1 F0
	sbc $00FFED.l,X		; FF ED FF 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $ED.b		; 00 ED
	sbc $000000.l,X		; FF 00 00 00
	brk $40.b		; 00 40
	rti		; 40

	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	sbc $EA14.w		; ED 14 EA
	inc $FFED.w		; EE ED FF
	nop		; EA
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $EA.b		; 00 EA
	sbc $000000.l,X		; FF 00 00 00
	brk $60.b		; 00 60
	rts		; 60

	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora [$FE.b]		; 07 FE
	jsr ($FBFD.w,X)		; FC FD FB
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	plx		; FA
	asl $FE.b		; 06 FE
	sbc [$FA.b],Y		; F7 FA
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FC.b		; 00 FC
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl A		; 0A
	sbc $FCFB.w,X		; FD FB FC
	jsr ($FBFF.w,X)		; FC FF FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	plx		; FA
	xce		; FB
	plx		; FA
	sbc $00FFFA.l,X		; FF FA FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $F9F8.w		; 0D F8 F9
	plx		; FA
	sed		; F8
	sbc $00FFF9.l,X		; FF F9 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bpl -13.b		; 10 F3
	inc $F4F1.w,X		; FE F1 F4
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($F0.b,S),Y		; 13 F0
	pea $F1F5.w		; F4 F5 F1
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$EC.b],Y		; 17 EC
	sbc ($F3.b),Y		; F1 F3
	inc $F1FF.w		; EE FF F1
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	tas		; 1B
	inx		; E8
	cpx $ECF1.w		; EC F1 EC
	sbc $00FFEC.l,X		; FF EC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$40E0.w		; E0 E0 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $EAE5.w,X		; 1E E5 EA
	inc $FFE8.w		; EE E8 FF
	nop		; EA
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora #$FEFC.w		; 09 FC FE
	sbc $FFFB.w,Y		; F9 FB FF
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	inc $FAF8.w,X		; FE F8 FA
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $04.b,S		; 03 04
	xce		; FB
	jsr ($0003.w,X)		; FC 03 00
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	plx		; FA
	xce		; FB
	tsb $00.b		; 04 00
	plx		; FA
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $F9F8.w		; 0D F8 F9
	plx		; FA
	ora [$00.b]		; 07 00
	sbc $00FF.w,Y		; F9 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bpl -13.b		; 10 F3
	inc $09F1.w,X		; FE F1 09
	brk $F6.b		; 00 F6
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($F0.b,S),Y		; 13 F0
	pea $0CF5.w		; F4 F5 0C
	brk $F4.b		; 00 F4
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$EC.b],Y		; 17 EC
	sbc ($F3.b),Y		; F1 F3
	bpl   0.b		; 10 00
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	tas		; 1B
	inx		; E8
	sbc $12F1.w		; ED F1 12
	brk $ED.b		; 00 ED
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $EAE5.w,X		; 1E E5 EA
	inc $0016.w		; EE 16 00
	nop		; EA
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora #$FEFC.w		; 09 FC FE
	sbc $0004.w,Y		; F9 04 00
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	inc $06F8.w,X		; FE F8 06
	brk $FC.b		; 00 FC
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
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
	cpy #$8000.w		; C0 00 80
	cpx #$80E0.w		; E0 E0 80
	cpx #$E080.w		; E0 80 E0
	cpx #$00E0.w		; E0 E0 00
	brk $60.b		; 00 60
	cpy #$4000.w		; C0 00 40
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rts		; 60

	bra   0.b		; 80 00
	cpx #$6000.w		; E0 00 60
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
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	php		; 08
	sbc $FF.b,X		; F5 FF
	inc $FF.b,X		; F6 FF
	sbc $FF.b,X		; F5 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	inc $F5FF.w,X		; FE FF F5
	sbc $000401.l,X		; FF 01 04 00
	brk $06.b		; 00 06
	brk $F5.b		; 00 F5
	sbc $000402.l,X		; FF 02 04 00
	brk $F6.b		; 00 F6
	sbc $03FFFD.l,X		; FF FD FF 03
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFFD.l,X		; FF FD FF 04
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	sbc $004403.l,X		; FF 03 44 00
	brk $7F.b		; 00 7F
	bvs  28.b		; 70 1C
	rti		; 40

	tas		; 1B
	rts		; 60

	sbc $087F08.l,X		; FF 08 7F 08
	sta $1888.w		; 8D 88 18
	tya		; 98
	sbc $073800.l,X		; FF 00 38 07
	bvc  12.b		; 50 0C
	rts		; 60

	tas		; 1B
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $706F00.l,X		; 7F 00 6F 70
	brk $FF.b		; 00 FF
	sbc $00E701.l,X		; FF 01 E7 00
	tas		; 1B
	php		; 08
	sbc $02FF02.l,X		; FF 02 FF 02
	.db $42, $02		; 42 02
	ora $43.b,S		; 03 43
	sbc $FC0300.l,X		; FF 00 03 FC
	sbc #$0C0E.w		; E9 0E 0C
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	eor ($00.b,X)		; 41 00
	sbc $00C0C0.l,X		; FF C0 C0 00
	rti		; 40

	brk $C0.b		; 00 C0
	cpx #$C000.w		; E0 00 C0
	brk $20.b		; 00 20
	jsr $2000.w		; 20 00 20
	cpx #$8000.w		; E0 00 80
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$E000.w		; C0 00 E0
	rti		; 40

	sbc $00FFFF.l		; EF FF FF 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	and $F0007F.l,X		; 3F 7F 00 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFFF.w,X		; FE FF FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFFF.w,X		; FE FF FF
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $F3.b		; 00 F3
	asl $FFF0.w		; 0E F0 FF
	sbc ($FF.b,S),Y		; F3 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFF0.l,X		; FF F0 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000403.l,X		; FF 03 04 00
	brk $F3.b		; 00 F3
	sbc $04FFF8.l,X		; FF F8 FF 04
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $05FFF8.l,X		; FF F8 FF 05
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $004404.l,X		; FF 04 44 00
	brk $FF.b		; 00 FF
	sbc $05FFF8.l,X		; FF F8 FF 05
	tsb $00.b		; 04 00
	brk $21.b		; 00 21
	asl $2006.w,X		; 1E 06 20
	ora $2A0F2D.l		; 0F 2D 0F 2A
	adc $FF817E.l,X		; 7F 7E 81 FF
	adc $81D581.l,X		; 7F 81 D5 81
	ora $2400.w,X		; 1D 00 24
	cop $24.b		; 02 24
	cop $F8.b		; 02 F8
	ora $7F.b		; 05 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	asl $E0.b		; 06 E0
	asl $F0.b		; 06 F0
	cpy #$FF00.w		; C0 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	tax		; AA
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $26.b		; 00 26
	cpy #$E0D0.w		; C0 D0 E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	ora [$04.b]		; 07 04
	brk $2E.b		; 00 2E
	plp		; 28
	sbc $F70F28.l		; EF 28 0F F7
	sed		; F8
	ora $AA08FF.l		; 0F FF 08 AA
	php		; 08
	xce		; FB
	brk $34.b		; 00 34
	bmi 114.b		; 30 72
	jmp ($7EB1.w,X)		; 7C B1 7E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	bra -128.b		; 80 80
	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	cpx #$10E0.w		; E0 E0 10
	beq -32.b		; F0 E0
	bpl -80.b		; 10 B0
	bpl -128.b		; 10 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sta ($4F.b,X)		; 81 4F
	sta $FFFF.w		; 8D FF FF
	brk $FF.b		; 00 FF
	jsl $FF3F7B.l		; 22 7B 3F FF
	bra  -4.b		; 80 FC
	brk $FC.b		; 00 FC
	adc $3C733C.l,X		; 7F 3C 73 3C
	ora ($00.b,X)		; 01 00
	sbc $1DFB00.l,X		; FF 00 FB 1D
	adc $7C7C00.l,X		; 7F 00 7C 7C
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	bra  20.b		; 80 14
	brk $EF.b		; 00 EF
	ora ($EB.b)		; 12 EB
	sbc $EBFFEF.l,X		; FF EF FF EB
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $02FFEB.l,X		; FF EB FF 02
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $EB.b		; 00 EB
	sbc $000404.l,X		; FF 04 04 00
	brk $EF.b		; 00 EF
	sbc $06FFFB.l,X		; FF FB FF 06
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $08FFFB.l,X		; FF FB FF 08
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $004406.l,X		; FF 06 44 00
	brk $08.b		; 00 08
	ora $091915.l		; 0F 15 19 09
	ora ($23.b),Y		; 11 23
	bmi  39.b		; 30 27
	bit $07.b,X		; 34 07
	jsr ($033F.w,X)		; FC 3F 03
	adc $000700.l,X		; 7F 00 07 00
	php		; 08
	brk $11.b		; 00 11
	brk $12.b		; 00 12
	ora ($D0.b,X)		; 01 D0
	ora $FC.b,S		; 03 FC
	ora $3F.b,S		; 03 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	bra -128.b		; 80 80
	brk $F0.b		; 00 F0
	bmi 124.b		; 30 7C
	sec		; 38
	stz $C030.w		; 9C 30 C0
	lda $7F40FF.l,X		; BF FF 40 7F
	brk $80.b		; 00 80
	adc $18B030.l,X		; 7F 30 B0 18
	sed		; F8
	stz $78.b,X		; 74 78
	cli		; 58
	jmp.w [$00FF]		; DC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $606000.l,X		; FF 00 60 60
	ora $62.b,S		; 03 62
	ora [$05.b]		; 07 05
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rts		; 60

	ora ($01.b,X)		; 01 01
	ora $07.b,S		; 03 07
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	adc $3901F2.l,X		; 7F F2 01 39
	bpl  -4.b		; 10 FC
	plp		; 28
	jsr ($FC44.w,X)		; FC 44 FC
	ora $3F.b,S		; 03 3F
	jmp.w [$20FF]		; DC FF 20
	stz $1100.w,X		; 9E 00 11
	cpx #$2018.w		; E0 18 20
	tsb $44D0.w		; 0C D0 44
	sed		; F8
	ora $FC.b,S		; 03 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	brk $F0.b		; 00 F0
	cpy #$E000.w		; C0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $B0.b		; 00 B0
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
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
	brk $BF.b		; 00 BF
	cpy #$DFB1.w		; C0 B1 DF
	adc $BE40C0.l,X		; 7F C0 40 BE
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $0E7F00.l,X		; 7F 00 7F 0E
	and $3E7E00.l,X		; 3F 00 7E 3E
	ror $007E.w,X		; 7E 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	adc $0000FF.l,X		; 7F FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $0000FF.l,X		; 3F FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $38.b		; 00 38
	sbc $0000FF.l		; EF FF 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp [$FF.b]		; C7 FF
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	eor $9F51B1.l,X		; 5F B1 51 9F
	eor $83C49B.l,X		; 5F 9B C4 83
	cmp [$00.b]		; C7 00
	cmp $7F7F80.l,X		; DF 80 7F 7F
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	ora $7F1F7C.l,X		; 1F 7C 1F 7F
	ora $80803F.l,X		; 1F 3F 80 80
	adc $FF4CFF.l,X		; 7F FF 4C FF
	rti		; 40

	cmp $40.b,X		; D5 40
	.db $62, $40, $40		; 62 40 40
	rti		; 40

	rti		; 40

	rti		; 40

	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF03.l,X		; FF 03 FF 00
	ror A		; 6A
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rts		; 60

	sbc $00FF60.l,X		; FF 60 FF 00
	brk $FF.b		; 00 FF
	sbc $28F82F.l,X		; FF 2F F8 28
	lda $226D2F.l,X		; BF 2F 6D 22
	bit $202E.w		; 2C 2E 20
	and $FFFF00.l		; 2F 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF0FF3.l		; 0F F3 0F FF
	ora $0000FF.l		; 0F FF 00 00
	sbc $D0A0C0.l,X		; FF C0 A0 D0
	ldy #$A090.w		; A0 90 A0
	bcc  48.b		; 90 30
	brk $30.b		; 00 30
	brk $B0.b		; 00 B0
	bpl -32.b		; 10 E0
	cpx #$E010.w		; E0 10 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	bra -64.b		; 80 C0
	bpl  16.b		; 10 10
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $E9.b		; 00 E9
	ora $E6.b,X		; 15 E6
	sbc $E6FFE9.l,X		; FF E9 FF E6
	sbc $000400.l,X		; FF 00 04 00
	brk $F9.b		; 00 F9
	sbc $02FFE6.l,X		; FF E6 FF 02
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $E6.b		; 00 E6
	sbc $000404.l,X		; FF 04 04 00
	brk $E9.b		; 00 E9
	sbc $06FFF6.l,X		; FF F6 FF 06
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $08FFF6.l,X		; FF F6 FF 08
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $F6.b		; 00 F6
	sbc $00040A.l,X		; FF 0A 04 00
	brk $04.b		; 00 04
	ora [$0A.b]		; 07 0A
	tsb $0C00.w		; 0C 00 0C
	trb $18.b		; 14 18
	sbc ($78.b,X)		; E1 78
	adc ($78.b,X)		; 61 78
	ora ($FF.b,X)		; 01 FF
	and $3B.b,S		; 23 3B
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	tsb $0800.w		; 0C 00 08
	brk $99.b		; 00 99
	brk $F9.b		; 00 F9
	rts		; 60

	sbc $041B00.l,X		; FF 00 1B 04
	ora $103FF4.l		; 0F F4 3F 10
	bvs  32.b		; 70 20
	cpx $44.b		; E4 44
	cmp $0FDF9A.l,X		; DF 9A DF 0F
	plx		; FA
	ora [$0D.b]		; 07 0D
	beq -21.b		; F0 EB
	brk $30.b		; 00 30
	ora $CB1060.l		; 0F 60 10 CB
	and $074F87.l		; 2F 87 4F 07
	cmp $FFFA1A.l,X		; DF 1A FA FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sta [$00.b]		; 87 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	brk $FF.b		; 00 FF
	adc $0000FF.l,X		; 7F FF 00 00
	sbc $070002.l,X		; FF 02 00 07
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	and $07.b		; 25 07
	brk $FF.b		; 00 FF
	sbc ($FE.b)		; F2 FE
	brk $00.b		; 00 00
	sbc $080000.l,X		; FF 00 00 08
	ora [$10.b]		; 07 10
	ora $3C0F15.l		; 0F 15 0F 3C
	and $81000D.l,X		; 3F 0D 00 81
	adc $F041E2.l,X		; 7F E2 41 F0
	and ($F9.b,X)		; 21 F9
	bpl  -4.b		; 10 FC
	php		; 08
	jsr ($FC00.w,X)		; FC 00 FC
	ora [$06.b]		; 07 06
	ror $00BE.w,X		; 7E BE 00
	adc ($80.b,X)		; 61 80
	and ($C0.b),Y		; 31 C0
	tya		; 98
	rts		; 60

	jmp $44B0.w		; 4C B0 44
	clv		; B8
	ora [$F8.b]		; 07 F8
	inc $0001.w,X		; FE 01 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra  64.b		; 80 40
	cpy #$F038.w		; C0 38 F0
	bmi -16.b		; 30 F0
	brk $F8.b		; 00 F8
	jsr $00E0.w		; 20 E0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C8.b		; 00 C8
	brk $F8.b		; 00 F8
	bmi  -8.b		; 30 F8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	sbc [$80.b]		; E7 80
	eor $BF007F.l,X		; 5F 7F 00 BF
	sbc $18E09F.l,X		; FF 9F E0 18
	lda $BFE05F.l		; AF 5F E0 BF
	lda $3F073F.l,X		; BF 3F 07 3F
	bra -128.b		; 80 80
	adc $7F0040.l,X		; 7F 40 00 7F
	brk $7F.b		; 00 7F
	ora [$3F.b]		; 07 3F
	brk $7F.b		; 00 7F
	brk $30.b		; 00 30
	bcc   0.b		; 90 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $2000FF.l,X		; FF FF 00 20
	adc $FF00FF.l,X		; 7F FF 00 FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $7F.b		; 00 7F
	sta $FF00FF.l,X		; 9F FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF02FF.l,X		; FF FF 02 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $60.b		; 00 60
	eor $FFFF00.l,X		; 5F 00 FF FF
	brk $FF.b		; 00 FF
	sbc $2000FF.l,X		; FF FF 00 20
	sbc [$FF.b],Y		; F7 FF
	brk $FF.b		; 00 FF
	sbc $FF1FFF.l,X		; FF FF 1F FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $F7.b		; 00 F7
	cmp $FF00FF.l		; CF FF 00 FF
	brk $10.b		; 00 10
	clv		; B8
	php		; 08
	bne -16.b		; D0 F0
	brk $E8.b		; 00 E8
	sed		; F8
	iny		; C8
	sec		; 38
	cpy #$D0A8.w		; C0 A8 D0
	sec		; 38
	inx		; E8
	inx		; E8
	cpx #$E080.w		; E0 80 E0
	php		; 08
	php		; 08
	beq  16.b		; F0 10
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $7F.b		; 00 7F
	rti		; 40

	adc $1F7F00.l,X		; 7F 00 7F 1F
	sbc ($90.b,S),Y		; F3 90
	lda $C080DF.l,X		; BF DF 80 C0
	brk $D0.b		; 00 D0
	eor ($B1.b,X)		; 41 B1
	and $007F00.l,X		; 3F 00 7F 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $1F7E1F.l,X		; 7F 1F 7E 1F
	cmp $11FE30.l,X		; DF 30 FE 11
	sbc $50FFD0.l,X		; FF D0 FF 50
	sbc $D0.b,X		; F5 D0
	sec		; 38
	bpl  48.b		; 10 30
	bpl 112.b		; 10 70
	bvc  -1.b		; 50 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$C0BF.w		; C0 BF C0
	sbc $C03F00.l,X		; FF 00 3F C0
	sbc $00FF80.l,X		; FF 80 FF 00
	eor $00.b,X		; 55 00
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$00FF.w		; C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF02.l,X		; FF 02 FF 00
	sbc $1C.b,S		; E3 1C
	sbc $00FF08.l,X		; FF 08 FF 00
	eor $00.b,X		; 55 00
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	trb $00FF.w		; 1C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $60DF00.l,X		; FF 00 DF 60
	sbc $5FFF40.l,X		; FF 40 FF 5F
	inc $7F50.w,X		; FE 50 7F
	eor $6040E0.l,X		; 5F E0 40 60
	rti		; 40

	stz $54.b,X		; 74 54
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FEB1F.l,X		; FF 1F EB 1F
	beq  16.b		; F0 10
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	sei		; 78
	pha		; 48
	inx		; E8
	cld		; D8
	php		; 08
	clc		; 18
	brk $58.b		; 00 58
	bpl 104.b		; 10 68
	cpx #$F000.w		; E0 00 F0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	cpy #$C0F0.w		; C0 F0 C0
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F0F0F.l		; 0F 0F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  24.b		; 80 18
	brk $E5.b		; 00 E5
	inc A		; 1A
	sbc ($FF.b,X)		; E1 FF
	sbc $FF.b		; E5 FF
	sbc ($FF.b,X)		; E1 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	sbc ($FF.b,X)		; E1 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc ($FF.b,X)		; E1 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora $00.b,X		; 15 00
	sbc ($FF.b,X)		; E1 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc $FF.b		; E5 FF
	sbc ($FF.b),Y		; F1 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $F1.b		; 00 F1
	sbc $004408.l,X		; FF 08 44 00
	brk $FB.b		; 00 FB
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	mvp $00,$00		; 44 00 00
	cop $01.b		; 02 01
	ora $03.b		; 05 03
	cop $06.b		; 02 06
	asl A		; 0A
	asl $0A.b		; 06 0A
	tsb $2CB0.w		; 0C B0 2C
	bmi 124.b		; 30 7C
	asl $012E.w,X		; 1E 2E 01
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $CC.b		; 00 CC
	brk $AC.b		; 00 AC
	jsr $00C1.w		; 20 C1 00
	ora $FF.b,S		; 03 FF
	sbc [$FB.b],Y		; F7 FB
	ora $001E18.l,X		; 1F 18 1E 00
	and $7B30.w,X		; 3D 30 7B
	jsr $457E.w		; 20 7E 45
	sei		; 78
	rti		; 40

	sed		; F8
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	ora [$10.b]		; 07 10
	asl $0C11.w		; 0E 11 0C
	rts		; 60

	tas		; 1B
	rti		; 40

	dec A		; 3A
	cmp [$3F.b]		; C7 3F
	sbc $FFFF00.l,X		; FF 00 FF FF
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	cli		; 58
	ldy #$144C.w		; A0 4C 14
	tsb $FF00.w		; 0C 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $10.b		; 00 10
	cpx #$5800.w		; E0 00 58
	brk $48.b		; 00 48
	pea $FFF8.w		; F4 F8 FF
	brk $FF.b		; 00 FF
	sbc $783030.l,X		; FF 30 30 78
	sei		; 78
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	sbc $01001F.l,X		; FF 1F 00 01
	brk $0C.b		; 00 0C
	jmp $3F3F.w		; 4C 3F 3F
	adc $DCDC6A.l,X		; 7F 6A DC DC
	jsr ($FF00.w,X)		; FC 00 FF
	brk $00.b		; 00 00
	ora $321D1C.l,X		; 1F 1C 1D 32
	rol $7E58.w,X		; 3E 58 7E
	trb $3F7F.w		; 1C 7F 3F
	adc $BEFE01.l,X		; 7F 01 FE BE
	adc $E161E1.l,X		; 7F E1 61 E1
	ora ($F1.b,X)		; 01 F1
	bmi 120.b		; 30 78
	bpl 120.b		; 10 78
	php		; 08
	sbc $7E89.w,Y		; F9 89 7E
	brk $81.b		; 00 81
	brk $40.b		; 00 40
	bra  32.b		; 80 20
	cpy #$C020.w		; C0 20 C0
	clc		; 18
	rts		; 60

	php		; 08
	bvs  14.b		; 70 0E
	bvs   0.b		; 70 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	cpy #$D034.w		; C0 34 D0
	bmi  -8.b		; 30 F8
	cpx #$00D0.w		; E0 D0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $CC.b		; 00 CC
	brk $D4.b		; 00 D4
	bpl  12.b		; 10 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	inx		; E8
	rti		; 40

	inx		; E8
	rti		; 40

	cpx #$F310.w		; E0 10 F3
	tya		; 98
	adc $6000FF.l		; 6F FF 00 60
	sbc $3F7F1F.l,X		; FF 1F 7F 3F
	ora $3F0F3F.l		; 0F 3F 0F 3F
	ora [$2F.b]		; 07 2F
	ora $10.b,S		; 03 10
	bra   0.b		; 80 00
	sbc $E0009F.l,X		; FF 9F 00 E0
	brk $7C.b		; 00 7C
	sty $0C.b		; 84 0C
	sty $5C.b		; 84 5C
	pei ($0C.b)		; D4 0C
	pea $FF9E.w		; F4 9E FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $F0AFF0.l,X		; FF F0 AF F0
	sbc $0004F0.l,X		; FF F0 04 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $30FF00.l,X		; FF 00 FF 30
	sbc $000030.l,X		; FF 30 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	ora ($2D.b,X)		; 01 2D
	and $403F40.l,X		; 3F 40 3F 40
	and $CFBF40.l,X		; 3F 40 BF CF
	lda $C8ACC8.l,X		; BF C8 AC C8
	and $120DCF.l		; 2F CF 0D 12
	and $007F00.l,X		; 3F 00 7F 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $FE8100.l,X		; 7F 00 81 FE
	inc $F779.w,X		; FE 79 F7
	tsb $04FF.w		; 0C FF 04
	sbc $14FFF4.l,X		; FF F4 FF 14
	stz $FE14.w		; 9C 14 FE
	pea $00FF.w		; F4 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $47FF00.l,X		; FF 00 FF 47
	brk $FF.b		; 00 FF
	sbc $38C700.l,X		; FF 00 C7 38
	sbc $10FF38.l,X		; FF 38 FF 10
	sta ($00.b)		; 92 00
	eor #$B800.w		; 49 00 B8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sec		; 38
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor #$2400.w		; 49 00 24
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	bit #$FE01.w		; 89 01 FE
	sbc $708F00.l,X		; FF 00 8F 70
	sbc $20FF70.l,X		; FF 70 FF 20
	bit $00.b		; 24 00
	sta ($00.b)		; 92 00
	adc [$00.b],Y		; 77 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF70.l,X		; FF 70 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE0600.l,X		; FF 00 06 FE
	sbc $C0BF78.l,X		; FF 78 BF C0
	sbc $BFFF80.l,X		; FF 80 FF BF
	sbc $A0E4A0.l,X		; FF A0 E4 A0
	sbc $01FEBF.l,X		; FF BF FE 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $D00000.l,X		; FF 00 00 D0
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	pea $F4CC.w		; F4 CC F4
	jmp $4CD4.w		; 4C D4 4C
	bne -52.b		; D0 CC
	cpy #$F020.w		; C0 20 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	brk $9F.b		; 00 9F
	cpx #$E7DC.w		; E0 DC E7
	eor $C07FE3.l,X		; 5F E3 7F C0
	rts		; 60

	cmp $00BFC0.l,X		; DF C0 BF 00
	adc $7F0000.l,X		; 7F 00 00 7F
	brk $3F.b		; 00 3F
	ora $3F.b,S		; 03 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	ora $7F3F7F.l,X		; 1F 7F 3F 7F
	adc $FF0000.l,X		; 7F 00 00 FF
	brk $08.b		; 00 08
	cmp $FFE7FF.l,X		; DF FF E7 FF
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $E7DF00.l,X		; FF 00 DF E7
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $2080.w		; 0C 80 20
	brk $E1.b		; 00 E1
	ora $E1FFDC.l,X		; 1F DC FF E1
	sbc $00FFDC.l,X		; FF DC FF 00
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $02FFDC.l,X		; FF DC FF 02
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $DC.b		; 00 DC
	sbc $000404.l,X		; FF 04 04 00
	brk $11.b		; 00 11
	brk $DC.b		; 00 DC
	sbc $000406.l,X		; FF 06 04 00
	brk $E1.b		; 00 E1
	sbc $08FFEC.l,X		; FF EC FF 08
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $0AFFEC.l,X		; FF EC FF 0A
	tsb $00.b		; 04 00
	brk $10.b		; 00 10
	brk $EC.b		; 00 EC
	sbc $004408.l,X		; FF 08 44 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	sbc $00440A.l,X		; FF 0A 44 00
	brk $E1.b		; 00 E1
	sbc $0CFFFC.l,X		; FF FC FF 0C
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $0EFFFC.l,X		; FF FC FF 0E
	tsb $00.b		; 04 00
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	sbc $00440C.l,X		; FF 0C 44 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $00040E.l,X		; FF 0E 04 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora $01.b,S		; 03 01
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	asl $B8.b		; 06 B8
	rol $38.b,X		; 36 38
	ror $0000.w,X		; 7E 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	dec $00.b		; C6 00
	ldx $30.b,Y		; B6 30
	brk $FF.b		; 00 FF
	adc $83FE.w,X		; 7D FE 83
	sta ($07.b,X)		; 81 07
	asl $07.b		; 06 07
	brk $0F.b		; 00 0F
	tsb $081E.w		; 0C 1E 08
	and $00FE31.l,X		; 3F 31 FE 00
	sta ($00.b,X)		; 81 00
	ora $00.b,S		; 03 00
	cop $01.b		; 02 01
	tsb $03.b		; 04 03
	tsb $03.b		; 04 03
	clc		; 18
	asl $10.b		; 06 10
	asl $A0FF.w		; 0E FF A0
	sbc $00FFFF.l,X		; FF FF FF 00
	sed		; F8
	brk $80.b		; 00 80
	brk $7E.b		; 00 7E
	eor ($EB.b,X)		; 41 EB
	trb $EB.b		; 14 EB
	jsl $FF005F.l		; 22 5F 00 FF
	brk $00.b		; 00 00
	sbc $00F800.l,X		; FF 00 F8 00
	bra  34.b		; 80 22
	trb $6B80.w		; 1C 80 6B
	ldx #$FF6B.w		; A2 6B FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($06.b,X)		; 01 06
	ora [$00.b]		; 07 00
	ora [$80.b]		; 07 80
	brk $C0.b		; 00 C0
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	cpy #$00C0.w		; C0 C0 00
	cmp ($02.b,X)		; C1 02
	cop $03.b		; 02 03
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	ora ($FE.b,X)		; 01 FE
	phd		; 0B
	sbc $01FFFE.l,X		; FF FE FF 01
	adc $000300.l,X		; 7F 00 03 00
	and $34.b,X		; 35 34
	plx		; FA
	plx		; FA
	inc $F4A8.w,X		; FE A8 F4
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $7F00.w,X		; FE 00 7F
	bvs 115.b		; 70 73
	iny		; C8
	sbc $FC64.w,Y		; F9 64 FC
	stz $FE.b,X		; 74 FE
	ora ($FE.b,X)		; 01 FE
	jmp ($82FF.w,X)		; 7C FF 82
	ora $C1.b,S		; 03 C1
	cmp ($C1.b,X)		; C1 C1
	ora ($E1.b,X)		; 01 E1
	rts		; 60

	beq  32.b		; F0 20
	sed		; F8
	clc		; 18
	inc $0300.w,X		; FE 00 03
	brk $81.b		; 00 81
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  48.b		; 80 30
	cpy #$E010.w		; C0 10 E0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	rti		; 40

	bra  64.b		; 80 40
	cpy #$D83A.w		; C0 3A D8
	sec		; 38
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	dec $00.b		; C6 00
	phx		; DA
	clc		; 18
	bit $17C4.w,X		; 3C C4 17
	sbc [$00.b]		; E7 00
	ldy #$F453.w		; A0 53 F4
	rti		; 40

	pea $E010.w		; F4 10 E0
	bpl -56.b		; 10 C8
	ldy $7F79.w		; AC 79 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $2F.b		; 00 2F
	ora [$2F.b]		; 07 2F
	ora [$3F.b]		; 07 3F
	ora $37.b,S		; 03 37
	ora $13.b,S		; 03 13
	sta ($AF.b,X)		; 81 AF
	ora $FF.b		; 05 FF
	sbc $0103.w,X		; FD 03 01
	lda $410341.l,X		; BF 41 03 41
	and [$75.b],Y		; 37 75
	and $FD036D.l		; 2F 6D 03 FD
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	sbc $FCCBFC.l,X		; FF FC CB FC
	cmp ($FC.b,S),Y		; D3 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	eor ($00.b)		; 52 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00A500.l,X		; FF 00 A5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	ora ($01.b,X)		; 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $FE03.w,X		; FD 03 FE
	ora $3F.b,S		; 03 3F
	sbc $C0DF60.l,X		; FF 60 DF C0
	lda $007F00.l,X		; BF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	ora $7F3F7F.l,X		; 1F 7F 3F 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00F800.l,X		; FF 00 F8 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8F800.l,X		; FF 00 F8 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc $0000FF.l,X		; FF FF 00 00
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
	ora $FF0037.l,X		; 1F 37 00 FF
	brk $06.b		; 00 06
	and $403F00.l,X		; 3F 00 3F 40
	and $C7BF40.l,X		; 3F 40 BF C7
	lda $10D0C4.l,X		; BF C4 D0 10
	sbc $090600.l,X		; FF 00 06 09
	and $007F00.l,X		; 3F 00 7F 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $103E00.l,X		; 7F 00 3E 10
	adc $FFE0A0.l,X		; 7F A0 E0 FF
	sbc $01FF1E.l,X		; FF 1E FF 01
	sbc $FDFF01.l,X		; FF 01 FF FD
	sbc $0FF105.l,X		; FF 05 F1 0F
	cpx #$FF1F.w		; E0 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	tsb $00FC.w		; 0C FC 00
	and $7F8088.l,X		; 3F 88 80 7F
	sbc $0FF000.l,X		; FF 00 F0 0F
	sbc $02FF07.l,X		; FF 07 FF 02
	sbc ($FF.b)		; F2 FF
	ora [$FF.b]		; 07 FF
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF0F.l,X		; FF 0F FF 00
	sbc $00C000.l,X		; FF 00 C0 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	bra -32.b		; 80 E0
	cpx #$0000.w		; E0 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $050700.l,X		; FF 00 07 05
	asl $00.b		; 06 00
	sbc $FF00FE.l,X		; FF FE 00 FF
	sbc $03FC00.l,X		; FF 00 FC 03
	sbc $00FF01.l,X		; FF 01 FF 00
	brk $03.b		; 00 03
	ora $03.b		; 05 03
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $757500.l,X		; FF 00 75 75
	plb		; AB
	bvs  -8.b		; 70 F8
	and $03.b,S		; 23 03
	jsr ($01FF.w,X)		; FC FF 01
	ora $C1FFE1.l,X		; 1F E1 FF C1
	sbc $FEFA81.l,X		; FF 81 FA FE
	ldx $DFAF.w		; AE AF DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$00FF.w		; E0 FF 00
	sbc $11F900.l,X		; FF 00 F9 11
	jsr ($0E0B.w,X)		; FC 0B 0E
	inc $F0FF.w,X		; FE FF F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF7F.l,X		; FF 7F FF 40
	asl $0FE0.w,X		; 1E E0 0F
	beq  -2.b		; F0 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	cld		; D8
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
	sed		; F8
	brk $F8.b		; 00 F8
	tsb $F8.b		; 04 F8
	tsb $FA.b		; 04 FA
	dec $FA.b		; C6 FA
	lsr $16.b		; 46 16
	bpl  -2.b		; 10 FE
	brk $C0.b		; 00 C0
	jsr $00F8.w		; 20 F8 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	and $6080FF.l,X		; 3F FF 80 60
	sbc $8F7F1F.l,X		; FF 1F 7F 8F
	beq  14.b		; F0 0E
	lda ($2F.b,S),Y		; B3 2F
	sbc ($0F.b),Y		; F1 0F
	beq  31.b		; F0 1F
	cpy #$7F00.w		; C0 00 7F
	sta $00E000.l,X		; 9F 00 E0 00
	adc $017F00.l,X		; 7F 00 7F 01
	ora $001F00.l,X		; 1F 00 1F 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $F3.b		; 06 F3
	sbc $00FFF9.l,X		; FF F9 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $F9F700.l,X		; FF 00 F7 F9
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	jsr ($F805.w,X)		; FC 05 F8
	sbc $F8FFFC.l,X		; FF FC FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $00.b		; 00 00
	rti		; 40

	asl $FF1E.w,X		; 1E 1E FF
	sbc $FF001E.l,X		; FF 1E 00 FF
	brk $00.b		; 00 00
	brk $9E.b		; 00 9E
	sbc $FFC000.l,X		; FF 00 C0 FF
	brk $A1.b		; 00 A1
	asl $0000.w,X		; 1E 00 00
	asl $FFFF.w,X		; 1E FF FF
	brk $0C.b		; 00 0C
	sbc $C061FF.l,X		; FF FF 61 C0
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$C000.w		; C0 00 C0
	cpy #$4000.w		; C0 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $C0.b		; 00 C0
	cpy #$C080.w		; C0 80 C0
	cpy #$0004.w		; C0 04 00
	cop $00.b		; 02 00
	sbc $F606.w,Y		; F9 06 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $00FFF6.l,X		; FF F6 FF 00
	mvp $00,$00		; 44 00 00
	sbc $FEFF.w,Y		; F9 FF FE
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $01FFFE.l,X		; FF FE FF 01
	mvp $00,$00		; 44 00 00
	brk $00.b		; 00 00
	ora $5F1F2F.l		; 0F 2F 1F 5F
	adc $00077F.l,X		; 7F 7F 07 00
	ora [$00.b]		; 07 00
	adc $000000.l,X		; 7F 00 00 00
	sbc $0FB000.l,X		; FF 00 B0 0F
	cpx #$801F.w		; E0 1F 80
	brk $87.b		; 00 87
	adc $FF7F87.l,X		; 7F 87 7F FF
	brk $03.b		; 00 03
	sbc $00FFC7.l,X		; FF C7 FF 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0C038.l,X		; FF 38 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	inc $0C.b,X		; F6 0C
	sed		; F8
	sbc $F8FFF6.l,X		; FF F6 FF F8
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
	cpy #$B000.w		; C0 00 B0
	brk $CC.b		; 00 CC
	rti		; 40

	txy		; 9B
	rts		; 60

	cpx #$77E0.w		; E0 E0 77
	sbc [$BB.b],Y		; F7 BB
	cmp $C0703E.l		; CF 3E 70 C0
	brk $B0.b		; 00 B0
	bra -116.b		; 80 8C
	cpy #$B8FF.w		; C0 FF B8
	ora $80CE00.l,X		; 1F 00 CE 80
	bvs -62.b		; 70 C2
	sbc $3FC6.w,Y		; F9 C6 3F
	cpy #$E000.w		; C0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $E0E0C0.l,X		; 7F C0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sed		; F8
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
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $EF.b		; 00 EF
	ora $F5.b,X		; 15 F5
	brk $EF.b		; 00 EF
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF9.l,X		; FF F9 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F9.b		; 00 F9
	sbc $000403.l,X		; FF 03 04 00
	brk $0F.b		; 00 0F
	brk $F9.b		; 00 F9
	sbc $000404.l,X		; FF 04 04 00
	brk $F0.b		; 00 F0
	sbc $05FFF1.l,X		; FF F1 FF 05
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $06FFF1.l,X		; FF F1 FF 06
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000407.l,X		; FF 07 04 00
	brk $08.b		; 00 08
	brk $F1.b		; 00 F1
	sbc $000408.l,X		; FF 08 04 00
	brk $FF.b		; 00 FF
	lsr $5FF1.w		; 4E F1 5F
	sbc $F3.b		; E5 F3
	sbc #$E51B.w		; E9 1B E5
	ora ($01.b,S),Y		; 13 01
	ora $000E00.l,X		; 1F 00 0E 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl $1EFF.w		; 0E FF 1E
	sbc [$1E.b],Y		; F7 1E
	sbc $1E1F1E.l,X		; FF 1E 1F 1E
	asl $000E.w		; 0E 0E 00
	brk $DF.b		; 00 DF
	ora $FF20FF.l,X		; 1F FF 20 FF
	sed		; F8
	sbc $18FF27.l,X		; FF 27 FF 18
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	bne  32.b		; D0 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	inc $FFFE.w,X		; FE FE FF
	and $EC5EF1.l		; 2F F1 5E EC
	sbc $E6.b,X		; F5 E6
	eor ($EC.b),Y		; 51 EC
	sbc $150E.w,Y		; F9 0E 15
	brk $0F.b		; 00 0F
	ora $00F000.l,X		; 1F 00 F0 00
	sbc $1FFB0E.l,X		; FF 0E FB 1F
	sbc $1FF71F.l,X		; FF 1F F7 1F
	tas		; 1B
	ora $000F0F.l,X		; 1F 0F 0F 00
	brk $90.b		; 00 90
	bcc  -1.b		; 90 FF
	sbc $E07FFF.l		; EF FF 7F E0
	bra -128.b		; 80 80
	stx $F9.b		; 86 F9
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $38.b		; 00 38
	brk $94.b		; 00 94
	php		; 08
	sbc $06FF00.l,X		; FF 00 FF 06
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	jsr $F820.w		; 20 20 F8
	beq  -6.b		; F0 FA
	inc $007E.w,X		; FE 7E 00
	tsb $FA.b		; 04 FA
	inc $0000.w,X		; FE 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $18.b		; 00 18
	brk $04.b		; 00 04
	tsb $00FE.w		; 0C FE 00
	inc $FEFA.w,X		; FE FA FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	brk $C3.b		; 00 C3
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	brk $C3.b		; 00 C3
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $7F.b		; 00 7F
	brk $D7.b		; 00 D7
	php		; 08
	dec $00C0.w,X		; DE C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $7F.b		; 00 7F
	brk $D5.b		; 00 D5
	tsa		; 3B
	ora $002A.w,X		; 1D 2A 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sei		; 78
	cpx #$6AA0.w		; E0 A0 6A
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $5C.b		; 00 5C
	bcs 126.b		; B0 7E
	eor ($00.b)		; 52 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	bra  56.b		; 80 38
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$3800.w		; E0 00 38
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $E8.b		; 00 E8
	ora $E800F0.l,X		; 1F F0 00 E8
	sbc $00FFF0.l,X		; FF F0 FF 00
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $03FFF8.l,X		; FF F8 FF 03
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $05FFF8.l,X		; FF F8 FF 05
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000406.l,X		; FF 06 04 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000407.l,X		; FF 07 04 00
	brk $08.b		; 00 08
	brk $F1.b		; 00 F1
	sbc $000408.l,X		; FF 08 04 00
	brk $08.b		; 00 08
	brk $F9.b		; 00 F9
	sbc $000409.l,X		; FF 09 04 00
	brk $10.b		; 00 10
	brk $F4.b		; 00 F4
	sbc $00040A.l,X		; FF 0A 04 00
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	sbc $00040B.l,X		; FF 0B 04 00
	brk $18.b		; 00 18
	brk $F7.b		; 00 F7
	sbc $00040C.l,X		; FF 0C 04 00
	brk $18.b		; 00 18
	brk $FF.b		; 00 FF
	sbc $00040D.l,X		; FF 0D 04 00
	brk $7F.b		; 00 7F
	brk $70.b		; 00 70
	bpl 112.b		; 10 70
	bpl 112.b		; 10 70
	bpl 127.b		; 10 7F
	ora $FF.b,S		; 03 FF
	rti		; 40

	sbc $4DFA47.l,X		; FF 47 FA 4D
	adc $006000.l,X		; 7F 00 60 00
	rts		; 60

	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$F4.b]		; 07 F4
	trb $12FA.w		; 1C FA 12
	inc $7816.w,X		; FE 16 78
	bpl   6.b		; 10 06
	tsb $0D02.w		; 0C 02 0D
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	xce		; FB
	ora $F90FFD.l		; 0F FD 0F F9
	ora $0B0F7F.l		; 0F 7F 0F 0B
	ora $070F0F.l		; 0F 0F 0F 07
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $3C.b		; 00 3C
	brk $F9.b		; 00 F9
	sbc $2FFF.w,Y		; F9 FF 2F
	sbc $FCC1.w,X		; FD C1 FC
	sty $FF.b		; 84 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $3C.b		; 00 3C
	ora $00.b,S		; 03 00
	ora [$F0.b]		; 07 F0
	brk $FD.b		; 00 FD
	cop $FD.b		; 02 FD
	cop $7F.b		; 02 7F
	cpy $7F.b		; C4 7F
	adc $BF447F.l,X		; 7F 7F 44 BF
	adc $3FC73F.l,X		; 7F 3F C7 3F
	sed		; F8
	ora [$E7.b]		; 07 E7
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc [$88.b],Y		; F7 88
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $E0E7C0.l,X		; FF C0 E7 E0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $3E6300.l,X		; FF 00 63 3E
	sbc [$B8.b]		; E7 B8
	inc $FFA0.w,X		; FE A0 FF
	cpx #$9FFF.w		; E0 FF 9F
	sbc $008060.l,X		; FF 60 80 00
	sbc $BF4100.l,X		; FF 00 41 BF
	eor ($B7.b,X)		; 41 B7
	eor $BC.b,X		; 55 BC
	bpl  15.b		; 10 0F
	cpx #$FF00.w		; E0 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	adc $FF00FF.l,X		; 7F FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and ($F0.b),Y		; 31 F0
	sed		; F8
	inc $07.b,X		; F6 07
	plx		; FA
	pla		; 68
	sbc $67FFFF.l,X		; FF FF FF 67
	cld		; D8
	eor $CF00FF.l		; 4F FF 00 CF
	ldx $D42F.w,Y		; BE 2F D4
	sbc $87FFCE.l,X		; FF CE FF 87
	ora [$00.b]		; 07 00
	cld		; D8
	jsr $27FF.w		; 20 FF 27
	sbc $98.b,X		; F5 98
.ACCU 8
.INDEX 8
	sep #$F2		; E2 F2
	inc $E9BE.w		; EE BE E9
	bmi -30.b		; 30 E2
	sec		; 38
	sbc ($F9.b,X)		; E1 F9
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	sbc $1FFD0F.l,X		; FF 0F FD 1F
	sbc ($1F.b),Y		; F1 1F
	sbc $1FF71F.l,X		; FF 1F F7 1F
	inc $1F1F.w,X		; FE 1F 1F
	ora $E00F0F.l,X		; 1F 0F 0F E0
	brk $F8.b		; 00 F8
	cpx #$0E.b		; E0 0E
	php		; 08
	sta $82.b,S		; 83 82
	stz $8060.w		; 9C 60 80
	bra -126.b		; 80 82
	.db $82, $E1, $61		; 82 E1 61
	cpx #$00.b		; E0 00
	sed		; F8
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	bra  -1.b		; 80 FF
	jsr ($00FF.w,X)		; FC FF 00
	adc $009F00.l,X		; 7F 00 9F 00
	adc $BE9B.w,Y		; 79 9B BE
	eor [$BD.b]		; 47 BD
	cmp $BF.b,S		; C3 BF
	inc $C0B8.w,X		; FE B8 C0
	and $FF3FC0.l,X		; 3F C0 3F FF
	brk $80.b		; 00 80
	sbc [$82.b]		; E7 82
	sbc $7CC1.w,Y		; F9 C1 7C
	cpy #$7E.b		; C0 7E
	cpy #$7F.b		; C0 7F
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$80.b		; C0 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($80.b,X)		; 01 80
	bra  96.b		; 80 60
	rts		; 60

	cmp $FFFFFF.l,X		; DF FF FF FF
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	cpx #$00.b		; E0 00
	brk $7F.b		; 00 7F
	inc $007F.w,X		; FE 7F 00
	stz $FF63.w		; 9C 63 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	adc $FF.b,S		; 63 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra 124.b		; 80 7C
	stz $FA.b		; 64 FA
	inc $FEFC.w,X		; FE FC FE
	sbc $00FF07.l,X		; FF 07 FF 00
	cop $FD.b		; 02 FD
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	sed		; F8
	brk $04.b		; 00 04
	tsb $03.b		; 04 03
	cop $07.b		; 02 07
	sed		; F8
	sbc $FDFF00.l,X		; FF 00 FF FD
	sbc $0000FF.l,X		; FF FF 00 00
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
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	sbc ($29.b,X)		; E1 29
	xba		; EB
	brk $E1.b		; 00 E1
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $02FFF1.l,X		; FF F1 FF 02
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $F1.b		; 00 F1
	sbc $000404.l,X		; FF 04 04 00
	brk $11.b		; 00 11
	brk $F1.b		; 00 F1
	sbc $000406.l,X		; FF 06 04 00
	brk $21.b		; 00 21
	brk $F1.b		; 00 F1
	sbc $000408.l,X		; FF 08 04 00
	brk $E2.b		; 00 E2
	sbc $0AFFE1.l,X		; FF E1 FF 0A
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $E1.b		; 00 E1
	sbc $00040E.l,X		; FF 0E 04 00
	brk $12.b		; 00 12
	brk $E1.b		; 00 E1
	sbc $000420.l,X		; FF 20 04 00
	brk $7F.b		; 00 7F
	brk $BF.b		; 00 BF
	rti		; 40

	lda $47BC41.l,X		; BF 41 BC 47
	xce		; FB
	ora $FA.b		; 05 FA
	asl $08FD.w		; 0E FD 08
	sbc $7F08.w,X		; FD 08 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FE.b,S		; 03 FE
	ora [$FD.b]		; 07 FD
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $BF00FF.l		; 0F FF 00 BF
	cpy #$0F.b		; C0 0F
	beq -17.b		; F0 EF
	bcc -121.b		; 90 87
	clc		; 18
	sta $889F8F.l,X		; 9F 8F 9F 88
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F07FE0.l,X		; FF E0 7F F0
	sbc $F07FF0.l,X		; FF F0 7F F0
	adc $E0F3F0.l,X		; 7F F0 F3 E0
	sbc $1FDF1F.l,X		; FF 1F DF 1F
	jmp.w [$FF1C]		; DC 1C FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bne  63.b		; D0 3F
	and $F00C13.l,X		; 3F 13 0C F0
	brk $DF.b		; 00 DF
	jsr $20DF.w		; 20 DF 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C03F00.l,X		; FF 00 3F C0
	cmp $FF20.w,X		; DD 20 FF
	bra  -1.b		; 80 FF
	sbc $FF001F.l,X		; FF 1F 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$C2.b		; C0 C2
	cld		; D8
	adc ($1F.b,X)		; 61 1F
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8D7900.l,X		; FF 00 79 8D
	sbc $FF7F66.l,X		; FF 66 7F FF
	eor $A07FA3.l,X		; 5F A3 7F A0
	pla		; 68
	sta $A319F5.l,X		; 9F F5 19 A3
	adc $437F.w,Y		; 79 7F 43
	sbc $8383.w,X		; FD 83 83
	brk $DC.b		; 00 DC
	jsr $20DF.w		; 20 DF 20
	sbc $0FFE07.l,X		; FF 07 FE 0F
	inc $B85F.w,X		; FE 5F B8
	cpy #$A3.b		; C0 A3
	trb $E0E0.w		; 1C E0 E0
	cmp ($C1.b,X)		; C1 C1
	beq 112.b		; F0 70
	bit $DFCC.w,X		; 3C CC DF
	lda $9F.b,S		; A3 9F
	jsr $B8F8.w		; 20 F8 B8
	sbc $00FFFF.l,X		; FF FF FF 00
	and $008F00.l,X		; 3F 00 8F 00
	sbc ($C0.b,S),Y		; F3 C0
	jmp ($FFE0.w,X)		; 7C E0 FF
	cpx #$1C.b		; E0 1C
	bpl -64.b		; 10 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$30.b		; C0 30
	bmi -20.b		; 30 EC
	cpx $3B3B.w		; EC 3B 3B
	sbc ($FF.b,X)		; E1 FF
	trb $FF00.w		; 1C 00 FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	rti		; 40

	jsr ($F8E4.w,X)		; FC E4 F8
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	beq   0.b		; F0 00
	sec		; 38
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	ora #$3E.b		; 09 3E
	asl A		; 0A
	ora $06.b,S		; 03 06
	ora ($07.b,X)		; 01 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $3D07.w,X		; FE 07 3D
	ora [$05.b]		; 07 05
	ora [$06.b]		; 07 06
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $97.b		; 00 97
	php		; 08
	ora [$08.b],Y		; 17 08
	ora [$1F.b]		; 07 1F
	sbc [$9F.b]		; E7 9F
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F87FF8.l,X		; FF F8 7F F8
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	sei		; 78
	ora $FFFF68.l,X		; 1F 68 FF FF
	sbc $1F1FE0.l,X		; FF E0 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF3F.l,X		; FF 3F FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $1F1FF0.l,X		; FF F0 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $AAF1.w		; AD F1 AA
	dec A		; 3A
	cpx $EBF8.w		; EC F8 EB
	and ($E5.b,S),Y		; 33 E5
	bit $FBE6.w,X		; 3C E6 FB
	bpl  15.b		; 10 0F
	tsb $03.b		; 04 03
	inc $F55F.w,X		; FE 5F F5
	ora $FC1FF7.l,X		; 1F F7 1F FC
	ora $FC1FFB.l,X		; 1F FB 1F FC
	ora $071F1F.l,X		; 1F 1F 1F 07
	ora [$6F.b]		; 07 6F
	bmi -17.b		; 30 EF
	beq 111.b		; F0 6F
	bmi -95.b		; 30 A1
	lda ($AF.b),Y		; B1 AF
	bpl  79.b		; 10 4F
	beq  31.b		; F0 1F
	sbc $DFA040.l		; EF 40 A0 DF
	beq  31.b		; F0 1F
	beq -36.b		; F0 DC
	sbc ($5E.b,S),Y		; F3 5E
	beq  -1.b		; F0 FF
	beq  63.b		; F0 3F
	beq  -1.b		; F0 FF
	beq -32.b		; F0 E0
	cpx #$F6.b		; E0 F6
	rol $1FFF.w,X		; 3E FF 1F
	cmp [$27.b],Y		; D7 27
	jmp ($C0C0.w,X)		; 7C C0 C0
	cop $F8.b		; 02 F8
	brk $FF.b		; 00 FF
	sbc $C90000.l,X		; FF 00 00 C9
	ora $3F00E0.l		; 0F E0 00 3F
	cpy #$3F.b		; C0 3F
	brk $FE.b		; 00 FE
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	brk $00.b		; 00 00
	bcc -49.b		; 90 CF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	rti		; 40

	brk $20.b		; 00 20
	brk $F8.b		; 00 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $FFFCFC.l,X		; FF FC FC FF
	tsb $82.b		; 04 82
	adc $0FFD7F.l,X		; 7F 7F FD 0F
	ora $FF.b,S		; 03 FF
	ora $030000.l		; 0F 00 00 03
	ora $03.b,S		; 03 03
	brk $07.b		; 00 07
	sed		; F8
	sbc $80FF3D.l,X		; FF 3D FF 80
	sbc $00F000.l,X		; FF 00 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $1F7F00.l,X		; 7F 00 7F 1F
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	sbc $00000F.l,X		; FF 0F 00 00
	brk $00.b		; 00 00
	adc $006F00.l,X		; 7F 00 6F 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $F0FF00.l		; 0F 00 FF F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $000F00.l		; 0F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	and $10E600.l,X		; 3F 00 E6 10
	stz $7E59.w,X		; 9E 59 7E
	adc $0000.w,Y		; 79 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $09F600.l,X		; 3F 00 F6 09
	dec $39.b		; C6 39
	asl $F9.b		; 06 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $C13FF8.l		; 0F F8 3F C1
	sta ($E3.b,S),Y		; 93 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$FE.b]		; 07 FE
	asl $BF.b		; 06 BF
	tsb $0093.w		; 0C 93 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $E070FE.l,X		; FF FE 70 E0
	adc $34E7.w,Y		; 79 E7 34
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $24CF3E.l		; CF 3E CF 24
	xba		; EB
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	cpx #$0E.b		; E0 0E
	php		; 08
	ora $02.b,S		; 03 02
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sed		; F8
	brk $0E.b		; 00 0E
	brk $83.b		; 00 83
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
	brk $DA.b		; 00 DA
	and ($E6.b)		; 32 E6
	brk $DA.b		; 00 DA
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $02FFF1.l,X		; FF F1 FF 02
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $04FFF1.l,X		; FF F1 FF 04
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $F1.b		; 00 F1
	sbc $000406.l,X		; FF 06 04 00
	brk $1A.b		; 00 1A
	brk $F1.b		; 00 F1
	sbc $000408.l,X		; FF 08 04 00
	brk $2A.b		; 00 2A
	brk $F1.b		; 00 F1
	sbc $00040A.l,X		; FF 0A 04 00
	brk $DA.b		; 00 DA
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0EFFE1.l,X		; FF E1 FF 0E
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $20FFE1.l,X		; FF E1 FF 20
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $E1.b		; 00 E1
	sbc $000422.l,X		; FF 22 04 00
	brk $1A.b		; 00 1A
	brk $E1.b		; 00 E1
	sbc $000424.l,X		; FF 24 04 00
	brk $BE.b		; 00 BE
	adc $FC.b,S		; 63 FC
	ora $FD.b,S		; 03 FD
	asl $FF.b		; 06 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $7F.b		; 05 7F
	ora $FF.b		; 05 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $7E.b,S		; 03 7E
	ora $03.b,S		; 03 03
	jsr ($E6FB.w,X)		; FC FB E6
	phb		; 8B
	stx $11.b		; 86 11
	ora [$E5.b]		; 07 E5
	jsl $E52265.l		; 22 65 22 E5
	cmp $05.b,S		; C3 05
	ora $FF.b,S		; 03 FF
	sed		; F8
	ora $FC7FFC.l,X		; 1F FC 7F FC
	sbc $FEDFFE.l,X		; FF FE DF FE
	cmp $FE3FFE.l,X		; DF FE 3F FE
	sbc $00FCFE.l,X		; FF FE FC 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	ora $EF00F7.l		; 0F F7 00 EF
	asl $0FE9.w		; 0E E9 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	clc		; 18
	sbc $10EF10.l		; EF 10 EF 10
	cpx #$E0.b		; E0 E0
	sta $80FF80.l,X		; 9F 80 FF 80
	sbc $E0FF80.l,X		; FF 80 FF E0
	sbc $40FF9F.l,X		; FF 9F FF 40
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $FFC1.w,X		; FE C1 FF
	and $FF01FE.l,X		; 3F FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	adc ($BF.b,X)		; 61 BF
	jsr $079E.w		; 20 9E 07
	sbc ($1D.b,S),Y		; F3 1D
	eor [$BD.b]		; 47 BD
	.db $62, $B8, $6C		; 62 B8 6C
	bcs -22.b		; B0 EA
	plx		; FA
	stz $DF60.w,X		; 9E 60 DF
	rts		; 60

	sbc $0FFE61.l,X		; FF 61 FE 0F
	plx		; FA
	sta $FF9FFF.l,X		; 9F FF 9F FF
	sta $C01FF5.l,X		; 9F F5 1F C0
	cpy #$FC.b		; C0 FC
	bit $C737.w,X		; 3C 37 C7
	cmp $A8B7B1.l		; CF B1 B7 A8
	cmp [$98.b],Y		; D7 98
	pld		; 2B
	sty $FB.b		; 84 FB
	stz $3F.b		; 64 3F
	brk $C3.b		; 00 C3
	brk $F8.b		; 00 F8
	cpy #$7E.b		; C0 7E
	beq  95.b		; F0 5F
	sed		; F8
	adc $FC7FF8.l		; 6F F8 7F FC
	sta $3838FC.l,X		; 9F FC 38 38
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	eor $7F9FC8.l		; 4F C8 9F 7F
	cpx $F31F.w		; EC 1F F3
	ora $FF03FC.l		; 0F FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $80.b		; 00 80
	brk $E3.b		; 00 E3
	ora $F0.b,S		; 03 F0
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
	jsr $FFFF.w		; 20 FF FF
	ora $FF77FF.l		; 0F FF 77 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000800.l,X		; FF 00 08 00
	pea $8AF0.w		; F4 F0 8A
	sed		; F8
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	asl $04.b		; 06 04
	ora $02.b,S		; 03 02
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bra  -2.b		; 80 FE
	inc $FAF0.w,X		; FE F0 FA
	sed		; F8
	sbc $00F8F8.l,X		; FF F8 F8 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $20.b		; 00 20
	brk $1E.b		; 00 1E
	asl $070F.w		; 0E 0F 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $073F00.l,X		; 3F 00 3F 07
	bit $0004.w,X		; 3C 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $3B.b		; 00 3B
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $3D.b		; 00 3D
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	ora $C9.b,S		; 03 C9
	cmp [$F9.b]		; C7 F9
	adc [$00.b]		; 67 00
	sbc $00FE00.l,X		; FF 00 FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $FE3F.w,X		; FE 3F FE
	sta $FFFFFE.l,X		; 9F FE FF FF
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $3F.b		; 00 3F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	ora $E0001F.l		; 0F 1F 00 E0
	cpx #$1F.b		; E0 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	sbc $0100FF.l,X		; FF FF 00 01
	brk $FE.b		; 00 FE
	inc $0303.w,X		; FE 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000300.l,X		; FF 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	sec		; 38
	sbc $31EB39.l		; EF 39 EB 31
	sbc $3E.b		; E5 3E
	ror $7B.b		; 66 7B
	sta $9D.b,S		; 83 9D
	php		; 08
	ora [$06.b]		; 07 06
	ora ($F7.b,X)		; 01 F7
	ora $FE1FF6.l,X		; 1F F6 1F FE
	ora $FC1FF9.l,X		; 1F F9 1F FC
	ora $0F1F9E.l,X		; 1F 9E 1F 0F
	ora $BB0707.l		; 0F 07 07 BB
	tsb $5B.b		; 04 5B
	eor [$48.b]		; 47 48
	mvp $1C,$D3		; 44 D3 1C
	lda ($EC.b,S),Y		; B3 EC
	sbc $DC.b,S		; E3 DC
	ora #$F7.b		; 09 F7
	bit $D8.b		; 24 D8
	jsr ($BCFF.w,X)		; FC FF BC
	jsr ($FCBF.w,X)		; FC BF FC
	sbc $FC1FFC.l		; EF FC 1F FC
	and $FFFEFC.l,X		; 3F FC FE FF
	jsr ($7FFC.w,X)		; FC FC 7F
	sta ($7F.b,X)		; 81 7F
	bra  47.b		; 80 2F
	sec		; 38
	sed		; F8
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $78.b		; 00 78
	ora [$C7.b]		; 07 C7
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	inc $00FF.w,X		; FE FF 00
	cpy #$80.b		; C0 80
	tsb $80BE.w		; 0C BE 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $7F007F.l,X		; FF 7F 00 7F
	bmi  -1.b		; 30 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $0210E8.l,X		; 7F E8 10 02
	ora ($00.b,X)		; 01 00
	ror $0000.w,X		; 7E 00 00
	ora [$03.b]		; 07 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	ora $00FFE0.l,X		; 1F E0 FF 00
	inc $FF7F.w,X		; FE 7F FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	ora ($02.b,X)		; 01 02
	and $0F7D7B.l,X		; 3F 7B 7D 0F
	ora $FC.b,S		; 03 FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora [$FD.b]		; 07 FD
	ora $3F.b,S		; 03 3F
	sbc $807F.w,X		; FD 7F 80
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($7C04.w,X)		; 7C 04 7C
	tsb $7C.b		; 04 7C
	tsb $7F.b		; 04 7F
	ora $7F.b,S		; 03 7F
	brk $BF.b		; 00 BF
	rts		; 60

	lda $61BF60.l,X		; BF 60 BF 61
	sei		; 78
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $7C.b		; 00 7C
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq   7.b		; F0 07
	brk $7F.b		; 00 7F
	brk $F9.b		; 00 F9
	ora $F3.b		; 05 F3
	phd		; 0B
	sbc $0FFFF8.l,X		; FF F8 FF 0F
	jsr ($FC00.w,X)		; FC 00 FC
	brk $07.b		; 00 07
	brk $7F.b		; 00 7F
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	ora [$07.b]		; 07 07
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	ora $83.b,S		; 03 83
	adc $7F.b,S		; 63 7F
	adc [$FF.b]		; 67 FF
	sbc [$FF.b]		; E7 FF
	sbc [$16.b]		; E7 16
	ora ($F6.b,X)		; 01 F6
	sbc ($FF.b,X)		; E1 FF
	ora $E0FFFC.l,X		; 1F FC FF E0
	ora $18F718.l,X		; 1F 18 F7 18
	sbc [$18.b],Y		; F7 18
	sbc [$16.b]		; E7 16
	inc $0E16.w		; EE 16 0E
	cpx #$00.b		; E0 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	jsr ($C700.w,X)		; FC 00 C7
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	jsr ($80FF.w,X)		; FC FF 80
	adc $C32383.l,X		; 7F 83 23 C3
	ror A		; 6A
	sta ($7F.b,X)		; 81 7F
	sta $FF.b,S		; 83 FF
	cpy #$7F.b		; C0 7F
	lda $0FFF03.l,X		; BF 03 FF 0F
	sbc $1C7F0C.l,X		; FF 0C 7F 1C
	and $14.b,S		; 23 14
	rts		; 60

	ora $7C.b,S		; 03 7C
	and $00C000.l,X		; 3F 00 C0 00
	sbc $3EF800.l,X		; FF 00 F8 3E
	sbc ($9D.b),Y		; F1 9D
	sbc ($9B.b,S),Y		; F3 9B
	sbc $BA8D.w,Y		; F9 8D BA
	lsr $FD.b		; 46 FD
	asl $FF.b		; 06 FF
	sbc $E77FFF.l,X		; FF FF 7F E7
	ora $9367.w,Y		; 19 67 93
	adc $87.b,X		; 75 87
	sbc $233D43.l,X		; FF 43 3D 23
	sbc $000001.l,X		; FF 01 00 00
	sta ($81.b,X)		; 81 81
	brk $40.b		; 00 40
	bmi  32.b		; 30 20
	sed		; F8
	bcs -34.b		; B0 DE
	rts		; 60

	sbc $7884A0.l,X		; FF A0 84 78
	brk $00.b		; 00 00
	eor ($80.b,X)		; 41 80
	cpx #$00.b		; E0 00
	bne  48.b		; D0 30
	iny		; C8
	sed		; F8
	inc $DF5E.w,X		; FE 5E DF
	sbc $FFFCFF.l,X		; FF FF FC FF
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	rti		; 40

	clc		; 18
	bpl  14.b		; 10 0E
	php		; 08
	ora $02.b,S		; 03 02
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bvs   0.b		; 70 00
	clc		; 18
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $E0.b		; 00 E0
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $D3.b		; 00 D3
	bit $01E2.w,X		; 3C E2 01
	cmp ($FF.b,S),Y		; D3 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cmp ($FF.b,S),Y		; D3 FF
	sbc ($FF.b)		; F2 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	sbc ($FF.b)		; F2 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $0AFFF2.l,X		; FF F2 FF 0A
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $E3.b		; 00 E3
	sbc $00040C.l,X		; FF 0C 04 00
	brk $03.b		; 00 03
	brk $F3.b		; 00 F3
	sbc $00040E.l,X		; FF 0E 04 00
	brk $13.b		; 00 13
	brk $E4.b		; 00 E4
	sbc $000420.l,X		; FF 20 04 00
	brk $13.b		; 00 13
	brk $F4.b		; 00 F4
	sbc $000422.l,X		; FF 22 04 00
	brk $23.b		; 00 23
	brk $EC.b		; 00 EC
	sbc $000424.l,X		; FF 24 04 00
	brk $23.b		; 00 23
	brk $FC.b		; 00 FC
	sbc $000426.l,X		; FF 26 04 00
	brk $33.b		; 00 33
	brk $F1.b		; 00 F1
	sbc $000428.l,X		; FF 28 04 00
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	ora $3E.b,S		; 03 3E
	cop $7E.b		; 02 7E
	cop $7E.b		; 02 7E
	cop $7E.b		; 02 7E
	cop $7E.b		; 02 7E
	cop $7F.b		; 02 7F
	ora ($3F.b,X)		; 01 3F
	brk $3D.b		; 00 3D
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora $FF.b,S		; 03 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $7F.b		; 02 7F
	cop $1F.b		; 02 1F
	cop $00.b		; 02 00
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($7F.b,X)		; 01 7F
	ora ($1F.b,X)		; 01 1F
	ora ($03.b,X)		; 01 03
	ora $C9.b,S		; 03 C9
	rti		; 40

	clv		; B8
	tya		; 98
	lda $BB98.w,Y		; B9 98 BB
	tya		; 98
	clv		; B8
	bcs -87.b		; B0 A9
	ldy #$41.b		; A0 41
	rti		; 40

	sbc ($40.b,S),Y		; F3 40
	lda $FF67FF.l,X		; BF FF 67 FF
	adc [$FF.b]		; 67 FF
	adc [$FF.b]		; 67 FF
	eor $FF5FFF.l		; 4F FF 5F FF
	lda $FFBFFF.l,X		; BF FF BF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00FF00.l		; 0F 00 FF 00
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00FF00.l		; 0F 00 FF 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $0001FF.l,X		; FF FF 01 00
	jmp ($F803.w,X)		; 7C 03 F8
	tsb $F3.b		; 04 F3
	phd		; 0B
	sta $BF3F5F.l,X		; 9F 5F 3F BF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	adc $03FC00.l,X		; 7F 00 FC 03
	sed		; F8
	ora [$C0.b]		; 07 C0
	and $7F7F80.l,X		; 3F 80 7F 7F
	beq 127.b		; F0 7F
	cmp $7EC07F.l		; CF 7F C0 7E
	cpy #$3E.b		; C0 3E
	cpx #$3E.b		; E0 3E
	cpx #$3E.b		; E0 3E
	cpx #$3F.b		; E0 3F
	cpx #$FF.b		; E0 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -4.b		; 80 FC
	sta $FC.b,S		; 83 FC
	cmp $FC.b,S		; C3 FC
	cmp $FC.b,S		; C3 FC
	cmp $FF.b,S		; C3 FF
	cpy #$FF.b		; C0 FF
	php		; 08
	sbc $3FFFC4.l,X		; FF C4 FF 3F
	adc $7C6704.l,X		; 7F 04 67 7C
	adc $724F7E.l,X		; 7F 7E 4F 72
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $00E000.l,X		; FF 00 E0 00
	sbc $00FFC0.l,X		; FF C0 FF 00
	and $9FE01F.l,X		; 3F 1F E0 9F
	cmp $DF9E.w,X		; DD 9E DF
	stz $1DDE.w		; 9C DE 1D
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr $60DF.w		; 20 DF 60
	sta $40BD40.l,X		; 9F 40 BD 40
	lda $003EC0.l,X		; BF C0 3E 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq 127.b		; F0 7F
	beq  -1.b		; F0 FF
	jsr $07FF.w		; 20 FF 07
	ora [$87.b]		; 07 87
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FE0FFE.l		; 0F FE 0F FE
	ora $FF18FE.l,X		; 1F FE 18 FF
	sei		; 78
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($00FF.w,X)		; FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	sbc $FC02.w,X		; FD 02 FC
	ora $FC.b,S		; 03 FC
	ora $FF.b,S		; 03 FF
	sbc $FD03FC.l,X		; FF FC 03 FD
	cop $FD.b		; 02 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sei		; 78
	sed		; F8
	and $F33DF1.l,X		; 3F F1 3D F3
	sta $FF0EFA.l,X		; 9F FA 0E FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $C33FC7.l,X		; 7F C7 3F C3
	sec		; 38
	inc $13.b		; E6 13
	stz $83.b,X		; 74 83
	sbc $FFC3.w,X		; FD C3 FF
	brk $FF.b		; 00 FF
	ora $D040C0.l,X		; 1F C0 40 D0
	brk $00.b		; 00 00
	jsr $908C.w		; 20 8C 90
	inc $EED8.w		; EE D8 EE
	jsr ($00FF.w,X)		; FC FF 00
	sbc $C0A000.l,X		; FF 00 A0 C0
	beq -48.b		; F0 D0
	beq -128.b		; F0 80
	jsr ($F68C.w,X)		; FC 8C F6
	inc $EEF2.w		; EE F2 EE
	sbc ($3E.b)		; F2 3E
	ror $B8.b		; 66 B8
	adc [$BC.b]		; 67 BC
	cpy $4BB4.w		; CC B4 4B
	tyx		; BB
	eor $3C4E3B.l		; 4F 3B 4E 3C
	lsr A		; 4A
	bit $0FFD.w,X		; 3C FD 0F
	sbc $9FFB9F.l,X		; FF 9F FB 9F
	xce		; FB
	and $F4BFF4.l,X		; 3F F4 BF F4
	and $F33FF3.l,X		; 3F F3 3F F3
	and $CD2CB3.l,X		; 3F B3 2C CD
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
	lsr A		; 4A
	ora [$44.b],Y		; 17 44
	dec $F5.b,X		; D6 F5
	ror $0E35.w		; 6E 35 0E
	ora $BE.b		; 05 BE
	lda $DF.b,X		; B5 DF
	jsr ($FE3F.w,X)		; FC 3F FE
	lda [$FE.b],Y		; B7 FE
	tyx		; BB
	inc $FF0B.w,X		; FE 0B FF
	wai		; CB
	sbc $4BFFFB.l,X		; FF FB FF 4B
	sbc $BF007F.l,X		; FF 7F 00 BF
	rts		; 60

	lda $60BF60.l,X		; BF 60 BF 60
	lda $61BF60.l,X		; BF 60 BF 61
	ldx $FE61.w,Y		; BE 61 FE
	ora $7F.b,S		; 03 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($E3.b,X)		; 01 E3
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $82.b		; 00 82
	sbc $38FF00.l,X		; FF 00 FF 38
	cmp [$A3.b]		; C7 A3
	jsr $00E0.w		; 20 E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7CFF00.l,X		; FF 00 FF 7C
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $0100FF.l,X		; DF FF 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $A0.b		; 65 A0
	rol $00C9.w		; 2E C9 00
	sbc $003F00.l,X		; FF 00 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	sbc $FFFFF7.l,X		; FF F7 FF FF
	sbc $003F3F.l,X		; FF 3F 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr ($00FF.w,X)		; FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $C0BF80.l,X		; 7F 80 BF C0
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $078700.l,X		; FF 00 87 07
	adc $07FCB8.l,X		; 7F B8 FC 07
	cmp [$08.b]		; C7 08
	cmp $0FCF0F.l		; CF 0F CF 0F
	cmp #$FF08.w		; C9 08 FF
	php		; 08
	bra 127.b		; 80 7F
	ora [$00.b]		; 07 00
	sed		; F8
	brk $CF.b		; 00 CF
	bmi -49.b		; 30 CF
	bmi -49.b		; 30 CF
	bmi -57.b		; 30 C7
	bmi  -1.b		; 30 FF
	brk $3F.b		; 00 3F
	cpx #$FE3E.w		; E0 3E FE
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0E1C0.l,X		; FF C0 E1 C0
	cpx #$80E0.w		; E0 E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $000101.l,X		; FF 01 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	and $BB.b		; 25 BB
	tsb $FF.b		; 04 FF
	cpy #$2FF7.w		; C0 F7 2F
	sbc [$F8.b]		; E7 F8
	tas		; 1B
	php		; 08
	sbc $00FF00.l,X		; FF 00 FF 00
	tya		; 98
	tda		; 7B
	clv		; B8
	tad		; 5B
	bit $C003.w,X		; 3C 03 C0
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $B3.b		; 00 B3
	tsb $FF.b		; 04 FF
	asl $FF.b		; 06 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FE01FE.l,X		; FF FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($CB.b,X)		; 01 CB
	sta $0E.b,S		; 83 0E
	sed		; F8
	ora $0000FE.l		; 0F FE 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $FCFF3F.l,X		; FF 3F FF FC
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$FF00.w		; C0 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	inc $00FF.w,X		; FE FF 00
	sta $3FFE81.l		; 8F 81 FE 3F
	sbc $0000FC.l,X		; FF FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ror $C000.w,X		; 7E 00 C0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cmp [$FD.b]		; C7 FD
	cmp $7D.b,S		; C3 7D
	.db $82, $FF, $3F		; 82 FF 3F
	cmp $20BF61.l,X		; DF 61 BF 20
	tyx		; BB
	and [$EC.b]		; 27 EC
	ora $FE033C.l,X		; 1F 3C 03 FE
	ora ($FF.b,X)		; 01 FF
	ora ($C0.b,X)		; 01 C0
	brk $9E.b		; 00 9E
	rts		; 60

	cmp $60DF60.l,X		; DF 60 DF 60
	sbc $406F03.l,X		; FF 03 6F 40
	stz $0B.b,X		; 74 0B
	cmp ($3E.b,X)		; C1 3E
	bra -128.b		; 80 80
	beq -80.b		; F0 B0
	jsr ($1C10.w,X)		; FC 10 1C
	sbc ($0F.b,X)		; E1 0F
	bpl  -1.b		; 10 FF
	sbc $FFF7FF.l,X		; FF FF F7 FF
	sbc $0F007F.l,X		; FF 7F 00 0F
	brk $E3.b		; 00 E3
	brk $FE.b		; 00 FE
	cpx #$F0FF.w		; E0 FF F0
	cmp $BA44B5.l		; CF B5 44 BA
.ACCU 16
.INDEX 16
	rep #$BF		; C2 BF
	sbc ($7F.b,X)		; E1 7F
	bmi  47.b		; 30 2F
	clc		; 18
	ora [$06.b],Y		; 17 06
	ora $00.b		; 05 00
	brk $7A.b		; 00 7A
	and $7C3F7D.l,X		; 3F 7D 3F 7C
	and $1F1FFE.l,X		; 3F FE 1F 1F
	and $031F0F.l,X		; 3F 0F 1F 03
	ora [$00.b]		; 07 00
	brk $B6.b		; 00 B6
	lda $EC.b,X		; B5 EC
	phd		; 0B
	php		; 08
	ora $02F758.l,X		; 1F 58 F7 02
	sbc $F906.w,X		; FD 06 F9
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	phk		; 4B
	sbc $E7FFF7.l,X		; FF F7 FF E7
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $C00000.l,X		; FF 00 00 C0
	brk $70.b		; 00 70
	rti		; 40

	clc		; 18
	bpl  14.b		; 10 0E
	php		; 08
	ora $02.b,S		; 03 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $18.b		; 00 18
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jmp.w [$7C80]		; DC 80 7C
	rti		; 40

	trb $0018.w		; 1C 18 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $DC.b		; 00 DC
	brk $7C.b		; 00 7C
	brk $1C.b		; 00 1C
	brk $F5.b		; 00 F5
	ora [$FB.b]		; 07 FB
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	beq   5.b		; F0 05
	ora [$F8.b]		; 07 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	and $F8000F.l,X		; 3F 0F 00 F8
	brk $FF.b		; 00 FF
	sbc $C7FF00.l,X		; FF 00 FF C7
	sbc $BF5F78.l,X		; FF 78 5F BF
	and $FF8F6F.l		; 2F 6F 8F FF
	brk $FC.b		; 00 FC
	php		; 08
	brk $00.b		; 00 00
	adc $1F187F.l,X		; 7F 7F 18 1F
	sta [$07.b]		; 87 07
	cpy #$F700.w		; C0 00 F7
	brk $00.b		; 00 00
	sbc $0000F7.l,X		; FF F7 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$3030.w		; C0 30 30
	asl $030C.w		; 0E 0C 03
	cop $0F.b		; 02 0F
	ora $000000.l		; 0F 00 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $4A.b		; 00 4A
	adc ($4B.b),Y		; 71 4B
	adc ($00.b),Y		; 71 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	sta ($7F.b,X)		; 81 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	sbc $00FCFF.l,X		; FF FF FC 00
	brk $F3.b		; 00 F3
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFC.l,X		; FF FC FF 00
	sbc $00F000.l,X		; FF 00 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr ($FE8C.w,X)		; FC 8C FE
	inc $FAF0.w,X		; FE F0 FA
	sed		; F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sed		; F8
	bra   0.b		; 80 00
	cpx #$F000.w		; E0 00 F0
	brk $40.b		; 00 40
	brk $2E.b		; 00 2E
	asl $0717.w		; 0E 17 07
	ora #$0701.w		; 09 01 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rti		; 40

	ora $0000F0.l		; 0F F0 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc [$C7.b]		; E7 C7
	jsr ($FF18.w,X)		; FC 18 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$1818.w		; E0 18 18
	inc $FDE6.w,X		; FE E6 FD
	sbc $00FF.w,X		; FD FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8040FF.l,X		; FF FF 40 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	sed		; F8
	ora $F8.b,S		; 03 F8
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	adc $FFFF3F.l,X		; 7F 3F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $D0.b		; 00 D0
	cpy #$C0C8.w		; C0 C8 C0
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40A080.l,X		; FF 80 A0 40
	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra 127.b		; 80 7F
	adc $01FE80.l,X		; 7F 80 FE 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01040C.l,X		; FF 0C 04 01
	cop $FF.b		; 02 FF
	xce		; FB
	sbc $0080.w,X		; FD 80 00
	ora $70F003.l		; 0F 03 F0 70
	brk $00.b		; 00 00
	ora $03FDF0.l		; 0F F0 FD 03
	sbc $00FFFD.l,X		; FF FD FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	cpy #$C000.w		; C0 00 C0
	cpy #$40C0.w		; C0 C0 40
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	bra  80.b		; 80 50
	brk $CC.b		; 00 CC
	eor $DD.b		; 45 DD
	ora ($36.b,X)		; 01 36
	brk $ED.b		; 00 ED
	sbc $000400.l,X		; FF 00 04 00
	brk $36.b		; 00 36
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $26.b		; 00 26
	brk $E5.b		; 00 E5
	sbc $000404.l,X		; FF 04 04 00
	brk $26.b		; 00 26
	brk $F5.b		; 00 F5
	sbc $000406.l,X		; FF 06 04 00
	brk $16.b		; 00 16
	brk $DF.b		; 00 DF
	sbc $000408.l,X		; FF 08 04 00
	brk $16.b		; 00 16
	brk $EF.b		; 00 EF
	sbc $00040A.l,X		; FF 0A 04 00
	brk $16.b		; 00 16
	brk $FF.b		; 00 FF
	sbc $00040C.l,X		; FF 0C 04 00
	brk $06.b		; 00 06
	brk $DE.b		; 00 DE
	sbc $00040E.l,X		; FF 0E 04 00
	brk $06.b		; 00 06
	brk $EE.b		; 00 EE
	sbc $000420.l,X		; FF 20 04 00
	brk $06.b		; 00 06
	brk $FE.b		; 00 FE
	sbc $000422.l,X		; FF 22 04 00
	brk $F6.b		; 00 F6
	sbc $24FFDE.l,X		; FF DE FF 24
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $26FFEE.l,X		; FF EE FF 26
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $28FFFE.l,X		; FF FE FF 28
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $2AFFDD.l,X		; FF DD FF 2A
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $2CFFED.l,X		; FF ED FF 2C
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $2EFFDD.l,X		; FF DD FF 2E
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $40FFED.l,X		; FF ED FF 40
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $42FFFD.l,X		; FF FD FF 42
	tsb $00.b		; 04 00
	brk $C6.b		; 00 C6
	sbc $44FFDD.l,X		; FF DD FF 44
	tsb $00.b		; 04 00
	brk $C6.b		; 00 C6
	sbc $46FFED.l,X		; FF ED FF 46
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra 112.b		; 80 70
	rti		; 40

	ora $FEFF08.l		; 0F 08 FF FE
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	cpx #$F800.w		; E0 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bmi  24.b		; 30 18
	sed		; F8
	tsb $EC.b		; 04 EC
	dey		; 88
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sei		; 78
	ldy $3C.b,X		; B4 3C
	brk $00.b		; 00 00
	sbc $E11FFF.l,X		; FF FF 1F E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $F8F00F.l,X		; 7F 0F F0 F8
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F000.l,X		; FF 00 F0 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cpx #$FF00.w		; E0 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $42.b		; 00 42
	eor $60FF00.l,X		; 5F 00 FF 60
	sta $FFFFFF.l,X		; 9F FF FF FF
	brk $80.b		; 00 80
	brk $19.b		; 00 19
	dec $DE19.w,X		; DE 19 DE
	lda ($F0.b)		; B2 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $E0DF00.l,X		; FF 00 DF E0
	cmp $FF00E0.l,X		; DF E0 00 FF
	bra  -1.b		; 80 FF
	adc $F8FF7F.l,X		; 7F 7F FF F8
	plx		; FA
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	adc $003F7F.l,X		; 7F 7F 3F 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	ora [$07.b]		; 07 07
	sed		; F8
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $008000.l,X		; FF 00 80 00
	cpx #$3880.w		; E0 80 38
	jsr $101C.w		; 20 1C 10
	ora [$04.b]		; 07 04
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$3800.w		; E0 00 38
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $77.b		; 00 77
	rti		; 40

	ora $000010.l,X		; 1F 10 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$7700.w		; C0 00 77
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	bra -80.b		; 80 B0
	sec		; 38
	inc $F60C.w,X		; FE 0C F6
	ora [$FD.b]		; 07 FD
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $C7.b		; 00 C7
	brk $F1.b		; 00 F1
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	asl $FF.b		; 06 FF
	.db $82, $7F, $7F		; 82 7F 7F
	sbc $BFC0FF.l,X		; FF FF C0 BF
.INDEX 8
	sep #$DA		; E2 DA
	sbc ($7F.b,X)		; E1 7F
	jsr ($FF1B.w,X)		; FC 1B FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $860F0D.l,X		; 1F 0D 0F 86
	ora [$E0.b]		; 07 E0
	brk $FF.b		; 00 FF
	sbc $00A060.l,X		; FF 60 A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpx #$E0.b		; E0 E0
	sbc $FAC2.w,X		; FD C2 FA
	cmp [$76.b]		; C7 76
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora $E20FFF.l,X		; 1F FF 0F E2
	sta $0FDB46.l,X		; 9F 46 DB 0F
	sbc $3FFF00.l,X		; FF 00 FF 3F
	cpx #$C0.b		; E0 C0
	bra -128.b		; 80 80
	ldy #$00.b		; A0 00
	brk $40.b		; 00 40
	clc		; 18
	bmi -36.b		; 30 DC
	clv		; B8
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$20.b		; E0 20
	rti		; 40

	bra -32.b		; 80 E0
	ldy #$F0.b		; A0 F0
	brk $E8.b		; 00 E8
	clc		; 18
	cpx $DC.b		; E4 DC
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	beq -16.b		; F0 F0
	sbc $000000.l,X		; FF 00 00 00
	rti		; 40

	and [$00.b],Y		; 37 00
	sbc $00E0FE.l,X		; FF FE E0 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $F700FF.l,X		; FF FF 00 F7
	ora $FFFFFF.l		; 0F FF FF FF
	brk $46.b		; 00 46
	inc $E0E3.w,X		; FE E3 E0
	and $30FF00.l,X		; 3F 00 FF 30
	bpl   3.b		; 10 03
	php		; 08
	xce		; FB
	bpl  -5.b		; 10 FB
	ora ($00.b,X)		; 01 00
	cli		; 58
	trb $011E.w		; 1C 1E 01
	sbc ($1E.b,X)		; E1 1E
	and $0BF7C0.l,X		; 3F C0 F7 0B
	sbc $E3FFF3.l,X		; FF F3 FF E3
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	sbc $FF08FF.l,X		; FF FF 08 FF
	mvp $FF,$7F		; 44 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	brk $C8.b		; 00 C8
	cpy #$A4.b		; C0 A4
	cpx #$03.b		; E0 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $0F.b		; 00 0F
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$FC.b		; C0 FC
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $080F00.l,X		; FF 00 0F 08
	ora [$04.b]		; 07 04
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rts		; 60

	rts		; 60

	clc		; 18
	clc		; 18
	ora $000700.l		; 0F 00 07 00
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF10.l		; EF 10 FF 00
	sbc $0706F0.l		; EF F0 06 07
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E01F00.l,X		; FF 00 1F E0
	cpx #$1F.b		; E0 1F
	ora $00F800.l		; 0F 00 F8 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $23D30E.l		; EF 0E D3 23
	sbc $C2FF00.l,X		; FF 00 FF C2
	phd		; 0B
	ora $00FE.w,X		; 1D FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $F2.b		; 00 F2
	cop $3D.b		; 02 3D
	cpy #$C0.b		; C0 C0
	and $E0003D.l,X		; 3F 3D 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	and [$E3.b],Y		; 37 E3
	tsa		; 3B
	sbc $1D.b,X		; F5 1D
	sbc $FF0C.w,Y		; F9 0C FF
	cmp [$FF.b]		; C7 FF
	sbc $FF837F.l,X		; FF 7F 83 FF
	bra  -5.b		; 80 FB
	ora $FB07FF.l		; 0F FF 07 FB
	ora [$FF.b]		; 07 FF
	ora $3F.b,S		; 03 3F
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	bra 127.b		; 80 7F
	bra -50.b		; 80 CE
	sed		; F8
	sbc $90DF70.l		; EF 70 DF 90
	cpx #$0F.b		; E0 0F
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	cpx #$60.b		; E0 60
	sed		; F8
	bmi -10.b		; 30 F6
	dec $6FDF.w		; CE DF 6F
	sbc $F7FFFF.l		; EF FF FF F7
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00C700.l,X		; 1F 00 C7 00
	sbc $9FEC80.l,X		; FF 80 EC 9F
	eor [$FB.b]		; 47 FB
	cmp $EB9FF5.l		; CF F5 9F EB
	sty $F1.b,X		; 94 F1
	bit $D1.b,X		; 34 D1
	and $7FD3.w,Y		; 39 D3 7F
	bra 127.b		; 80 7F
	sta $FC.b,S		; 83 FC
	and $F43FFA.l,X		; 3F FA 3F F4
	adc $EE7FEE.l,X		; 7F EE 7F EE
	sbc $FAFFEC.l,X		; FF EC FF FA
	tsb $C33A.w		; 0C 3A C3
	sbc [$98.b]		; E7 98
	adc [$68.b],Y		; 77 68
	txy		; 9B
	sty $EB.b,X		; 94 EB
	sty $8EE9.w		; 8C E9 8E
	and $82.b,X		; 35 82
	sbc ($00.b),Y		; F1 00
	jsr ($7FC0.w,X)		; FC C0 7F
	sed		; F8
	sta $FC6FF8.l,X		; 9F F8 6F FC
	adc [$FC.b],Y		; 77 FC
	adc [$FE.b],Y		; 77 FE
	adc $FB87FE.l,X		; 7F FE 87 FB
	cpy #$BF.b		; C0 BF
	rts		; 60

	eor $00131C.l,X		; 5F 1C 13 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	adc $3FFF7F.l,X		; 7F 7F FF 3F
	adc $001F0F.l,X		; 7F 0F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	cmp $04F906.l		; CF 06 F9 04
	xce		; FB
	ora ($ED.b,S),Y		; 13 ED
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora $FF.b,S		; 03 FF
	cmp $C0BFE1.l,X		; DF E1 BF C0
	ldy $D8.b		; A4 D8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $BF.b		; 00 BF
	ora $A4.b,S		; 03 A4
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $82FF03.l,X		; FF 03 FF 82
	sbc $09FF01.l,X		; FF 01 FF 09
	sbc $3E3F3C.l,X		; FF 3C 3F 3E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F17F00.l,X		; FF 00 7F F1
	inc $F7F9.w,X		; FE F9 F7
	sed		; F8
	cmp $FC.b,S		; C3 FC
	cmp ($3E.b,X)		; C1 3E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $01FF7E.l,X		; FF 7E FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $08.b,X		; F6 08
	inc $08.b,X		; F6 08
	sbc [$08.b],Y		; F7 08
	sbc $17E810.l		; EF 10 E8 17
	sbc #$EF17.w		; E9 17 EF
	ora $FFF7F9.l,X		; 1F F9 F7 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $030000.l,X		; FF 00 00 03
	brk $1F.b		; 00 1F
	brk $FE.b		; 00 FE
	ora ($F8.b,X)		; 01 F8
	asl $E3.b		; 06 E3
	tas		; 1B
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00FF00.l,X		; 1F 00 FF 00
	inc $F801.w,X		; FE 01 F8
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	sed		; F8
	and $00FF00.l,X		; 3F 00 FF 00
	sta $61.b		; 85 61
	bit $FBA1.w,X		; 3C A1 FB
	sbc $FB.b,S		; E3 FB
	sbc $F8.b,S		; E3 F8
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $E4.b		; 00 E4
	tas		; 1B
	stz $1873.w		; 9C 73 18
	sbc [$18.b],Y		; F7 18
	sbc [$F2.b],Y		; F7 F2
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	sbc ($FF.b),Y		; F1 FF
	ora $8F019F.l		; 0F 9F 01 8F
	bpl -31.b		; 10 E1
	trb $00FF.w		; 1C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $E01FE0.l,X		; 1F E0 1F E0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $80FF3F.l,X		; FF 3F FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	adc $E63200.l,X		; 7F 00 32 E6
	and ($F0.b),Y		; 31 F0
	bit $2EF0.w,X		; 3C F0 2E
	sbc ($37.b)		; F2 37
	cmp ($15.b,S),Y		; D3 15
	jsr ($FC0C.w,X)		; FC 0C FC
	sty $D9F7.w		; 8C F7 D9
	sbc $CFFFCF.l,X		; FF CF FF CF
	sbc $ECFFCD.l,X		; FF CD FF EC
	sbc $F3FFE3.l,X		; FF E3 FF F3
	sbc $DC7FF8.l,X		; FF F8 7F DC
	adc ($BC.b,S),Y		; 73 BC
	and $1C.b,S		; 23 1C
	ora $6C.b,S		; 03 6C
	adc $64.b,S		; 63 64
	adc $A4.b,S		; 63 A4
	pld		; 2B
	clc		; 18
	and $8FF7B8.l,X		; 3F B8 F7 8F
	sbc $FFFFDF.l,X		; FF DF FF FF
	sbc $9FFF9F.l,X		; FF 9F FF 9F
	sbc $C7FFD7.l,X		; FF D7 FF C7
	sbc $00FF0F.l,X		; FF 0F FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BD.b		; 00 BD
	bvc -67.b		; 50 BD
	rti		; 40

	lda $00FF40.l,X		; BF 40 FF 00
	sbc $7F.b,S		; E3 7F
	adc $80BF80.l,X		; 7F 80 BF 80
	sbc $BC8A00.l,X		; FF 00 8A BC
	.db $82, $BC, $80		; 82 BC 80
	lda $803FC0.l,X		; BF C0 3F 80
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	jsr $1C27.w		; 20 27 1C
	sbc $3A.b,X		; F5 3A
	sbc $CFF707.l,X		; FF 07 F7 CF
	sbc [$38.b],Y		; F7 38
	inc $09.b,X		; F6 09
	inc $08.b,X		; F6 08
	cmp $02C71E.l,X		; DF 1E C7 02
	adc ($C1.b),Y		; 71 C1
	adc $0038F8.l,X		; 7F F8 38 00
	cmp $01FE00.l		; CF 00 FE 01
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $00FF3F.l,X		; FF 3F FF 00
	adc $C1FF00.l,X		; 7F 00 FF C1
	adc $00FF7F.l,X		; 7F 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	adc $11ED00.l,X		; 7F 00 ED 11
	sbc $ED11.w		; ED 11 ED
	ora ($ED.b),Y		; 11 ED
	sbc ($FF.b),Y		; F1 FF
	ora $FB.b,S		; 03 FB
	ora $FB.b,S		; 03 FB
	sbc $FFE1FF.l,X		; FF FF E1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	and $FE01E1.l		; 2F E1 01 FE
	cpx #$DF.b		; E0 DF
	and $F300FF.l,X		; 3F FF 00 F3
	ora $F3.b,S		; 03 F3
	ora $F3.b,S		; 03 F3
	ora $E0.b,S		; 03 E0
	ora $1E1FE0.l,X		; 1F E0 1F 1E
	ora ($C0.b,X)		; 01 C0
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	trb $1CE3.w		; 1C E3 1C
	sbc $1C.b,S		; E3 1C
	sbc $F7C3.w,Y		; F9 C3 F7
	dec $17.b		; C6 17
	brk $F7.b		; 00 F7
	brk $BF.b		; 00 BF
	sed		; F8
	cmp $FFFEE0.l,X		; DF E0 FE FF
	sbc $E0.b,S		; E3 E0
	sec		; 38
	sbc [$31.b]		; E7 31
	sbc $F7EF17.l		; EF 17 EF F7
	phd		; 0B
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $1E9900.l,X		; DF 00 99 1E
	sta ($1C.b,S),Y		; 93 1C
	sbc $1FFFE0.l,X		; FF E0 FF 1F
	sbc $808700.l,X		; FF 00 87 80
	sbc $0000FF.l,X		; FF FF 00 00
	ora $E01FE0.l,X		; 1F E0 1F E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	sbc $40FF80.l,X		; FF 80 FF 40
	sbc $FFFF40.l,X		; FF 40 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$C0.b		; C0 C0
	and $00FF3F.l,X		; 3F 3F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $003F00.l,X		; FF 00 3F 00
	and $FFFF00.l,X		; 3F 00 FF FF
	sbc $1F.b,S		; E3 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7CFB00.l,X		; FF 00 FB 7C
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FEFFE0.l,X		; FF E0 FF FE
	sbc $00FF07.l,X		; FF 07 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	ora $000100.l,X		; 1F 00 01 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $877800.l,X		; FF 00 78 87
	inc $C379.w,X		; FE 79 C3
	cpy #$9D.b		; C0 9D
	bcc  56.b		; 90 38
	clc		; 18
	adc $3918.w,Y		; 79 18 39
	clc		; 18
	sei		; 78
	bvs  -1.b		; 70 FF
	sbc $3FFF87.l,X		; FF 87 FF 3F
	sbc $E7FF6F.l,X		; FF 6F FF E7
	sbc $E7FFE7.l,X		; FF E7 FF E7
	sbc $3FFF8F.l,X		; FF 8F FF 3F
	cpy #$7F.b		; C0 7F
	cpy #$5F.b		; C0 5F
	cpx #$3F.b		; E0 3F
	jsr ($63BF.w,X)		; FC BF 63
	lda $60BF60.l,X		; BF 60 BF 60
	lda $80FF60.l,X		; BF 60 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $7F00C0.l,X		; FF C0 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $03FF00.l,X		; FF 00 FF 03
	jsr ($FC04.w,X)		; FC 04 FC
	tsb $FC.b		; 04 FC
	tsb $FC.b		; 04 FC
	tsb $FC.b		; 04 FC
	tsb $FC.b		; 04 FC
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $02.b		; 00 02
	ora ($03.b,X)		; 01 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	sta $FC.b,S		; 83 FC
	ora $FD.b,S		; 03 FD
	asl $FF.b		; 06 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $FF.b		; 05 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $78.b,S		; 03 78
	bvs -127.b		; 70 81
	bra -109.b		; 80 93
	bra -15.b		; 80 F1
	cpy #$E3.b		; C0 E3
	rts		; 60

	ror $3CB9.w,X		; 7E B9 3C
	cmp $00.b,S		; C3 00
	sbc $7FFF8F.l,X		; FF 8F FF 7F
	sbc $3FFF7F.l,X		; FF 7F FF 3F
	sbc $C7FF9F.l,X		; FF 9F FF C7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $9F709F.l,X		; FF 9F 70 9F
	bvs -97.b		; 70 9F
	adc $1FF01F.l,X		; 7F 1F F0 1F
	beq  31.b		; F0 1F
	sbc $00FF0F.l,X		; FF 0F FF 00
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$F0.b		; E0 F0
	cpx #$FF.b		; E0 FF
	beq -32.b		; F0 E0
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sta ($FE.b,X)		; 81 FE
	sta $FC.b,S		; 83 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $7F.b		; 05 7F
	ora $0D.b		; 05 0D
	asl $01.b		; 06 01
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $FE.b		; 00 FE
	ora $7E.b,S		; 03 7E
	ora $0F.b,S		; 03 0F
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $F3.b		; 00 F3
	asl A		; 0A
	sbc $F3FF.w,Y		; F9 FF F3
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $000402.l,X		; FF 02 04 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	.db $62, $80, $FF		; 62 80 FF
	brk $00.b		; 00 00
	clc		; 18
	adc [$00.b]		; 67 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	sbc $06E500.l,X		; FF 00 E5 06
	sbc $FF007F.l,X		; FF 7F 00 FF
	adc $7F0098.l,X		; 7F 98 00 7F
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	lsr $7846.w,X		; 5E 46 78
	cli		; 58
	ora [$07.b]		; 07 07
	ora [$1F.b]		; 07 1F
	cop $36.b		; 02 36
	sta $EC.b,S		; 83 EC
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	lda $00A060.l,X		; BF 60 A0 00
	sed		; F8
	brk $1F.b		; 00 1F
	sed		; F8
	sbc $BF3C.w,X		; FD 3C BF
	bit $1818.w,X		; 3C 18 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	inc $0D00.w,X		; FE 00 0D
	beq  11.b		; F0 0B
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	ora $060FFF.l		; 0F FF 0F 06
	asl $00.b		; 06 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $EF.b		; 00 EF
	ora $FFF7.w		; 0D F7 FF
	sbc $FFF8FF.l		; EF FF F8 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $FA.b		; 00 FA
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	adc ($80.b,X)		; 61 80
	sbc $00720C.l,X		; FF 0C 72 00
	brk $0C.b		; 00 0C
	adc ($00.b,S),Y		; 73 00
	brk $00.b		; 00 00
	tsb $00FF.w		; 0C FF 00
	sep #$03		; E2 03
	sbc $3EFF7F.l,X		; FF 7F FF 3E
	brk $FF.b		; 00 FF
	adc $7F008C.l,X		; 7F 8C 00 7F
	tsb $1B0C.w		; 0C 0C 1B
	clc		; 18
	sta $C00093.l,X		; 9F 93 00 C0
	brk $C3.b		; 00 C3
	ora ($04.b,X)		; 01 04
	cop $C4.b		; 02 C4
	and ($3C.b,X)		; 21 3C
	brk $03.b		; 00 03
	sbc [$1C.b]		; E7 1C
	jmp ($FF80.w)		; 6C 80 FF
	cpy #$FF.b		; C0 FF
	ora $07.b,S		; 03 07
	sbc $2707FF.l,X		; FF FF 07 27
	cmp [$03.b]		; C7 03
	ora $E0.b,S		; 03 E0
	cpx #$80.b		; E0 80
	bra 127.b		; 80 7F
	adc $7FB000.l,X		; 7F 00 B0 7F
	sbc $7FA020.l,X		; FF 20 A0 7F
	bra   0.b		; 80 00
	brk $78.b		; 00 78
	brk $06.b		; 00 06
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra -33.b		; 80 DF
	bra  -1.b		; 80 FF
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$1C.b		; E0 1C
	trb $FAE2.w		; 1C E2 FA
	php		; 08
	bit $D0.b		; 24 D0
	rol $00.b		; 26 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jsr ($FE18.w,X)		; FC 18 FE
	bit $3CFE.w,X		; 3C FE 3C
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000400.l,X		; FF 00 04 00
	tsb $00.b		; 04 00
	sbc $0D.b,X		; F5 0D
	sbc $F5FF.w,Y		; F9 FF F5
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F9.b		; 00 F9
	sbc $000402.l,X		; FF 02 04 00
	brk $0D.b		; 00 0D
	brk $F9.b		; 00 F9
	sbc $000403.l,X		; FF 03 04 00
	brk $C6.b		; 00 C6
	.db $42, $D8		; 42 D8
	plp		; 28
	bra  64.b		; 80 40
	sbc [$00.b],Y		; F7 00
	sbc ($1B.b,S),Y		; F3 1B
	rtl		; 6B

	trb $00.b		; 14 00
	trb $0000.w		; 1C 00 00
	sta $06.b		; 85 06
	sbc [$18.b],Y		; F7 18
	sbc $1CFF00.l,X		; FF 00 FF 1C
	sbc $1C7F1C.l		; EF 1C 7F 1C
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $91.b		; 00 91
	sta ($00.b),Y		; 91 00
	jsr $00FF.w		; 20 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $7100.w,X		; FE 00 71
	bcs  -1.b		; B0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -17.b		; 80 EF
	iny		; C8
	lda [$FF.b]		; A7 FF
	sta [$68.b],Y		; 97 68
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$40.b		; C0 40
	sed		; F8
	brk $FF.b		; 00 FF
	bmi -33.b		; 30 DF
	sei		; 78
	sbc $303078.l,X		; FF 78 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	beq  16.b		; F0 10
	sbc [$FF.b],Y		; F7 FF
	beq  -1.b		; F0 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $0401FF.l,X		; FF FF 01 04
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFF7.l,X		; FF F7 FF 02
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $000403.l,X		; FF 03 04 00
	brk $08.b		; 00 08
	brk $FA.b		; 00 FA
	sbc $000404.l,X		; FF 04 04 00
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	sbc $000405.l,X		; FF 05 04 00
	brk $E0.b		; 00 E0
	jsr $23E7.w		; 20 E7 23
	cpx #$10.b		; E0 10
	cmp $0DF23F.l,X		; DF 3F F2 0D
	sbc $F408.w,X		; FD 08 F4
	asl $0D32.w		; 0E 32 0D
	cpy #$00.b		; C0 00
	cpy $07.b		; C4 07
	sbc $00E000.l,X		; FF 00 E0 00
	sbc $07FF07.l,X		; FF 07 FF 07
	xce		; FB
	ora $000F3F.l		; 0F 3F 0F 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	jsr $0808.w		; 20 08 08
	ora $FD19.w,Y		; 19 19 FD
	sbc $FF847F.l,X		; FF 7F 84 FF
	sty $7F.b		; 84 7F
	sbc $5F807F.l,X		; FF 7F 80 5F
	rts		; 60

	pea $E708.w		; F4 08 E7
	tas		; 1B
	asl $00.b		; 06 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	php		; 08
	asl A		; 0A
	sbc $05FEFF.l,X		; FF FF FE 05
	sbc $FFFE05.l,X		; FF 05 FE FF
	inc $F801.w,X		; FE 01 F8
	php		; 08
	trb $0E04.w		; 1C 04 0E
	cop $04.b		; 02 04
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($E0.b,X)		; 01 E0
	cpx #$4E.b		; E0 4E
	ldx $10BE.w,Y		; BE BE 10
	sta $B04FDF.l		; 8F DF 4F B0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	sbc $F07FE1.l,X		; FF E1 7F F0
	sbc $E0E0F0.l,X		; FF F0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	brk $0A.b		; 00 0A
	brk $EC.b		; 00 EC
	trb $F5.b		; 14 F5
	sbc $F8FFEC.l,X		; FF EC FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $F4.b		; 00 F4
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $FC.b		; 00 FC
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $0C.b		; 00 0C
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $14.b		; 00 14
	brk $F8.b		; 00 F8
	sbc $000405.l,X		; FF 05 04 00
	brk $EC.b		; 00 EC
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $07FFF0.l,X		; FF F0 FF 07
	tsb $00.b		; 04 00
	brk $FC.b		; 00 FC
	sbc $08FFF0.l,X		; FF F0 FF 08
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F0.b		; 00 F0
	sbc $000409.l,X		; FF 09 04 00
	brk $BF.b		; 00 BF
	sbc $FCE0BF.l,X		; FF BF E0 FC
	xce		; FB
	sbc $FA06.w,Y		; F9 06 FA
	sty $38.b		; 84 38
	and $0601.w,X		; 3D 01 06
	brk $03.b		; 00 03
	cpx #$00.b		; E0 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $07FF07.l,X		; FF 07 FF 07
	and $070707.l,X		; 3F 07 07 07
	ora $03.b,S		; 03 03
	sbc $03FFFF.l,X		; FF FF FF 03
	and $7F1FC0.l,X		; 3F C0 1F 7F
	ora $BFDFA0.l,X		; 1F A0 DF BF
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	cop $00.b		; 02 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	adc $E0E0E0.l,X		; 7F E0 E0 E0
	cpy #$C0.b		; C0 C0
	inc $FEFF.w,X		; FE FF FE
	sta ($FF.b,X)		; 81 FF
	bra  -1.b		; 80 FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	inc $21F7.w,X		; FE F7 21
	jsr ($E923.w,X)		; FC 23 E9
	inc $24FA.w,X		; FE FA 24
	sed		; F8
	sbc $0601.w,X		; FD 01 06
	brk $03.b		; 00 03
	cpx #$00.b		; E0 00
	inc $FF08.w,X		; FE 08 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b],Y		; 17 FF
	ora [$FF.b]		; 07 FF
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $E0.b		; 00 E0
	cpx #$30.b		; E0 30
	pei ($19.b)		; D4 19
	adc $1F.b,S		; 63 1F
	ldy #$DF.b		; A0 DF
	lda $006000.l,X		; BF 00 60 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	cpy $E6FE.w		; CC FE E6
	sbc $E07FE0.l,X		; FF E0 7F E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$20.b		; E0 20
	sbc $21.b,S		; E3 21
	beq  56.b		; F0 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rep #$03		; C2 03
	cmp $000000.l		; CF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  48.b		; 70 30
	.db $82, $86, $06		; 82 86 06
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $827D70.l		; 4F 70 7D 82
	sbc $0006.w,Y		; F9 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $606301.l,X		; FF 01 63 60
	adc ($E0.b,X)		; 61 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	rti		; 40

	ora $000F00.l		; 0F 00 0F 00
	sbc $1F.b,S		; E3 1F
	beq  -1.b		; F0 FF
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	xba		; EB
	sbc $01FFF0.l,X		; FF F0 FF 01
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $03FFF0.l,X		; FF F0 FF 03
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000404.l,X		; FF 04 04 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000405.l,X		; FF 05 04 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $E3.b		; 00 E3
	sbc $07FFF8.l,X		; FF F8 FF 07
	tsb $00.b		; 04 00
	brk $EB.b		; 00 EB
	sbc $08FFF8.l,X		; FF F8 FF 08
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $09FFF8.l,X		; FF F8 FF 09
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $0AFFF8.l,X		; FF F8 FF 0A
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $00040B.l,X		; FF 0B 04 00
	brk $0B.b		; 00 0B
	brk $F8.b		; 00 F8
	sbc $00040C.l,X		; FF 0C 04 00
	brk $13.b		; 00 13
	brk $F8.b		; 00 F8
	sbc $00040D.l,X		; FF 0D 04 00
	brk $1B.b		; 00 1B
	brk $F8.b		; 00 F8
	sbc $00040E.l,X		; FF 0E 04 00
	brk $78.b		; 00 78
	dey		; 88
	sei		; 78
	dey		; 88
	adc $7C88.w,Y		; 79 88 7C
	sta $AF877F.l		; 8F 7F 87 AF
	sed		; F8
	lda $F8AFF8.l		; AF F8 AF F8
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	sbc ($01.b),Y		; F1 01
	sbc ($00.b,S),Y		; F3 00
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	ora [$7C.b]		; 07 7C
	jmp ($F800.w,X)		; 7C 00 F8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc [$3C.b]		; E7 3C
	sta ($FF.b,X)		; 81 FF
	brk $00.b		; 00 00
	clc		; 18
	ora $FFF887.l,X		; 1F 87 F8 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $20A07E.l,X		; FF 7E A0 20
	sty $1C8C.w		; 8C 8C 1C
	bit $7C7C.w,X		; 3C 7C 7C
	sbc ($FF.b,X)		; E1 FF
	sbc $03FD07.l,X		; FF 07 FD 03
	sbc $C0FF01.l,X		; FF 01 FF C0
	xce		; FB
	tsb $E3.b		; 04 E3
	trb $3CC3.w		; 1C C3 3C
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	tsb $0844.w		; 0C 44 08
	pla		; 68
	sbc $F809E7.l,X		; FF E7 09 F8
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	trb $1C.b		; 14 1C
	clc		; 18
	clc		; 18
	sed		; F8
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $10.b		; 00 10
	brk $08.b		; 00 08
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $40C001.l,X		; FF 01 C0 40
	sed		; F8
	clc		; 18
	ror $06.b,X		; 76 06
	ora $0E01.w,X		; 1D 01 0E
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	sbc $01DFFF.l,X		; FF FF DF 01
	bne   3.b		; D0 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	inc $F320.w,X		; FE 20 F3
	and $000000.l		; 2F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$3C.b		; E0 3C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $FFC0.w		; 20 C0 FF
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sta ($3E.b,X)		; 81 3E
	and ($00.b),Y		; 31 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($3F.b,X)		; 01 3F
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	cmp $4A.b,S		; C3 4A
	lda $30.b,X		; B5 30
	sta $DB6E.w,X		; 9D 6E DB
	eor ($A5.b)		; 52 A5
	bit $00CB.w		; 2C CB 00
	ror $1800.w,X		; 7E 00 18
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFB5FF.l		; EF FF B5 FF
	sbc $FFF7FF.l,X		; FF FF F7 FF
	ror $187E.w,X		; 7E 7E 18
	clc		; 18
	sbc $FF7F80.l,X		; FF 80 7F FF
	adc ($8C.b,S),Y		; 73 8C
	bvs -113.b		; 70 8F
	adc $C07FFF.l,X		; 7F FF 7F C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF80.l,X		; FF 80 FF FF
	sbc $40FF80.l,X		; FF 80 FF 40
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FFFE.l,X		; FF FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $48.b		; A4 48
	sbc #$E6F6.w		; E9 F6 E6
	ora ($CD.b,S),Y		; 13 CD
	tas		; 1B
	dex		; CA
	trb $C5.b		; 14 C5
	ora $0F00.w,Y		; 19 00 0F
	brk $07.b		; 00 07
	sbc $1FFF5F.l		; EF 5F FF 1F
	sbc $D61F.w,X		; FD 1F D6
	and $DE3FDF.l,X		; 3F DF 3F DE
	and $070F0F.l,X		; 3F 0F 0F 07
	ora [$9F.b]		; 07 9F
	eor [$5E.b]		; 47 5E
	ldy #$5F.b		; A0 5F
	sbc $4F208F.l,X		; FF 8F 20 4F
	ldy #$8F.b		; A0 8F
	rts		; 60

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	cld		; D8
	cpx #$FF.b		; E0 FF
	sbc ($BF.b,X)		; E1 BF
	cpx #$EF.b		; E0 EF
	beq -17.b		; F0 EF
	beq -17.b		; F0 EF
	beq -64.b		; F0 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $40.b		; 00 40
	cpy #$20.b		; C0 20
	rts		; 60

	bra  32.b		; 80 20
	beq  48.b		; F0 30
	beq  48.b		; F0 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	beq  96.b		; F0 60
	cld		; D8
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $DB.b		; 00 DB
	plp		; 28
	xba		; EB
	sbc $F0FFDB.l,X		; FF DB FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $EB.b		; 00 EB
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $1B.b		; 00 1B
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $DB.b		; 00 DB
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	tsb $00.b		; 04 00
	brk $EB.b		; 00 EB
	sbc $0CFFE0.l,X		; FF E0 FF 0C
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $0EFFE0.l,X		; FF E0 FF 0E
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $E0.b		; 00 E0
	sbc $000420.l,X		; FF 20 04 00
	brk $FF.b		; 00 FF
	ora $AB.b,S		; 03 AB
	ror $7EAB.w,X		; 7E AB 7E
	plb		; AB
	ror $7EAB.w,X		; 7E AB 7E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	pea $E00F.w		; F4 0F E0
	and $8578C5.l,X		; 3F C5 78 85
	adc ($83.b),Y		; 71 83
	sbc ($FF.b,X)		; E1 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FE3FFF.l,X		; 1F FF 3F FE
	adc $007FFE.l,X		; 7F FE 7F 00
	sbc $DFFFFF.l,X		; FF FF FF DF
	brk $9F.b		; 00 9F
	cpy #$3F.b		; C0 3F
	cpx #$1F.b		; E0 1F
	beq  79.b		; F0 4F
	sec		; 38
	cmp [$FF.b]		; C7 FF
	sbc $000000.l,X		; FF 00 00 00
	cmp $20DF20.l,X		; DF 20 DF 20
	sbc $E0FFC0.l,X		; FF C0 FF E0
	sbc $F83FF0.l,X		; FF F0 3F F8
	sbc $E0F8.w,Y		; F9 F8 E0
	cmp $E43FFF.l,X		; DF FF 3F E4
	ora $FF1CE7.l,X		; 1F E7 1C FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	sbc $3FF906.l,X		; FF 06 F9 3F
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	beq   0.b		; F0 00
	sed		; F8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	bpl  48.b		; 10 30
	sed		; F8
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	cop $01.b		; 02 01
	ora ($FF.b,X)		; 01 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $010003.l,X		; FF 03 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b,S		; 03 FF
	sbc $FF22FF.l,X		; FF FF 22 FF
	jsl $F720FF.l		; 22 FF 20 F7
	plp		; 28
	inc $98FE.w,X		; FE FE 98
	clc		; 18
	cmp [$07.b]		; C7 07
	jsr $FD00.w		; 20 00 FD
	cop $FD.b		; 02 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	php		; 08
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($07FF.w,X)		; FC FF 07
	cmp $3C.b,S		; C3 3C
	bra  63.b		; 80 3F
	cop $41.b		; 02 41
	ora ($82.b),Y		; 11 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	ror $FF7F.w,X		; 7E 7F FF
	sbc $00FF.w,X		; FD FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -16.b		; 80 F0
	beq  -4.b		; F0 FC
	bit $0F7F.w,X		; 3C 7F 0F
	and $000083.l,X		; 3F 83 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bvs -128.b		; 70 80
	ldy $00C1.w,X		; BC C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$00.b		; C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  63.b		; 80 3F
	jsr $0407.w		; 20 07 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003F00.l,X		; FF 00 3F 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $D5.b,X		; 94 D5
	sta ($D8.b)		; 92 D8
	stz $0DDE.w,X		; 9E DE 0D
	adc #$7600.w		; 69 00 76
	ora $38.b		; 05 38
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	nop		; EA
	adc $E17FEF.l,X		; 7F EF 7F E1
	adc $797F76.l,X		; 7F 76 7F 79
	adc $1F3F3F.l,X		; 7F 3F 3F 1F
	ora $470707.l,X		; 1F 07 07 47
	clc		; 18
	eor [$5C.b]		; 47 5C
	eor [$5C.b]		; 47 5C
	cmp $7F.b,S		; C3 7F
	eor $3C.b,S		; 43 3C
	ora $E3.b,S		; 03 E3
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $F8BFF8.l,X		; FF F8 BF F8
	lda $FCBFF8.l,X		; BF F8 BF FC
	sbc $E0E3FC.l,X		; FF FC E3 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	sbc $7FC101.l,X		; FF 01 C1 7F
	cmp $FFFF70.l		; CF 70 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF80.l,X		; FF 80 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $29.b,X		; F6 29
	jsr ($FC23.w,X)		; FC 23 FC
	and ($FC.b,X)		; 21 FC
	cmp ($FC.b,X)		; C1 FC
	ora ($FC.b,X)		; 01 FC
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	sbc $01FF09.l,X		; FF 09 FF 01
	sbc $FD03.w,X		; FD 03 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $A6.b		; 00 A6
	bit $48.b		; 24 48
	tsb $3A.b		; 04 3A
	and ($E2.b)		; 32 E2
	rts		; 60

	and $20AC.w,X		; 3D AC 20
	cmp $00.b,S		; C3 00
	sbc $DB3C00.l,X		; FF 00 3C DB
	sbc $CDFFFB.l,X		; FF FB FF CD
	sbc $D3FF9F.l,X		; FF 9F FF D3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1F3C3C.l,X		; FF 3C 3C 1F
	cpx #$1F.b		; E0 1F
	cpx #$00.b		; E0 00
	cpy #$1F.b		; C0 1F
	cpy #$1F.b		; C0 1F
	cpy #$1F.b		; C0 1F
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	cpy #$C0.b		; C0 C0
	sbc $DFE0DF.l,X		; FF DF E0 DF
	cpx #$DF.b		; E0 DF
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	beq -40.b		; F0 D8
	sei		; 78
	bpl  16.b		; 10 10
	inx		; E8
	php		; 08
	inx		; E8
	php		; 08
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$A0.b		; C0 A0
	rts		; 60

	tsb $FCE0.w		; 0C E0 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	tsb $FC.b		; 04 FC
	tsb $FC.b		; 04 FC
	tsb $FE.b		; 04 FE
	cop $FF.b		; 02 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($87.b,X)		; 01 87
	and $00FCFC.l,X		; 3F FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	ora [$C0.b]		; 07 C0
	sbc $00F807.l,X		; FF 07 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($22.b,X)		; 01 22
	asl $F030.w		; 0E 30 F0
	sta ($81.b,X)		; 81 81
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	and ($3E.b),Y		; 31 3E
	ora $807FF0.l		; 0F F0 7F 80
	jsr ($0003.w,X)		; FC 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $03.b		; 00 03
	ora $70.b,S		; 03 70
	bvs -16.b		; 70 F0
	beq -15.b		; F0 F1
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $CC.b		; 00 CC
	bmi  12.b		; 30 0C
	beq  14.b		; F0 0E
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	clc		; 18
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	plp		; 28
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	jsr $1010.w		; 20 10 10
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sed		; F8
	php		; 08
	ror $1D46.w,X		; 7E 46 1D
	ora ($0F.b,X)		; 01 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	bra  44.b		; 80 2C
	brk $D2.b		; 00 D2
	and ($E6.b),Y		; 31 E6
	sbc $F0FFD2.l,X		; FF D2 FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $E2.b		; 00 E2
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $12.b		; 00 12
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $22.b		; 00 22
	brk $F0.b		; 00 F0
	sbc $00040A.l,X		; FF 0A 04 00
	brk $D2.b		; 00 D2
	sbc $0CFFE0.l,X		; FF E0 FF 0C
	tsb $00.b		; 04 00
	brk $E2.b		; 00 E2
	sbc $0EFFE0.l,X		; FF E0 FF 0E
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $20FFE0.l,X		; FF E0 FF 20
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $E0.b		; 00 E0
	sbc $000422.l,X		; FF 22 04 00
	brk $12.b		; 00 12
	brk $E0.b		; 00 E0
	sbc $000424.l,X		; FF 24 04 00
	brk $AA.b		; 00 AA
	adc $AA7FAA.l,X		; 7F AA 7F AA
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sta ($FF.b,X)		; 81 FF
	sta $F8.b,S		; 83 F8
	sta [$F0.b]		; 87 F0
	ora $F20EF9.l		; 0F F9 0E F2
	trb $1CF0.w		; 1C F0 1C
	sbc [$1A.b],Y		; F7 1A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $0FFD0F.l,X		; FF 0F FD 0F
	inc $02FC.w,X		; FE FC 02
	inc $FF00.w,X		; FE 00 FF
	dey		; 88
	ora [$24.b]		; 07 24
	ora $D2.b,S		; 03 D2
	and ($AC.b,X)		; 21 AC
	eor ($D3.b,X)		; 41 D3
	pei ($FE.b)		; D4 FE
	ora ($FE.b,X)		; 01 FE
	sbc $FFFF.w,X		; FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $00FFFF.l		; 2F FF FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $E13FFF.l,X		; 3F FF 3F E1
	and $00FFE1.l,X		; 3F E1 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $3FE4C0.l,X		; FF C0 E4 3F
	sbc [$3F.b]		; E7 3F
	sbc $04FF1C.l,X		; FF 1C FF 04
	sbc $FFFF02.l,X		; FF 02 FF FF
	sbc $F97F81.l,X		; FF 81 7F F9
	sbc $00F800.l,X		; FF 00 F8 00
	sbc [$00.b]		; E7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F03F00.l,X		; FF 00 3F F0
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00CF00.l,X		; FF 00 CF 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $02FF00.l,X		; FF 00 FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $02FFFF.l,X		; FF FF FF 02
	sbc $00FF02.l,X		; FF 02 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $30CF00.l,X		; FF 00 CF 30
	sbc $11DE30.l,X		; FF 30 DE 11
	jsr ($3901.w,X)		; FC 01 39
	dec $F2.b		; C6 F2
	pea $C430.w		; F4 30 C4
	sbc [$0A.b],Y		; F7 0A
	cmp $30CF30.l		; CF 30 CF 30
	sbc $03FD30.l		; EF 30 FD 03
	sbc $0FF7C3.l,X		; FF C3 F7 0F
	sbc [$CF.b],Y		; F7 CF
	sbc $FF0F.w,X		; FD 0F FF
	ora $0301FF.l		; 0F FF 01 03
	jmp ($0688.w,X)		; 7C 88 06
	bit $03.b		; 24 03
	cmp ($21.b)		; D2 21
	ldy $D341.w		; AC 41 D3
	pei ($F0.b)		; D4 F0
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	sed		; F8
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FF2F.l,X		; FF 2F FF 80
	bra -32.b		; 80 E0
	cpx #$F8.b		; E0 F8
	sei		; 78
	inc $781E.w,X		; FE 1E 78
	sta [$3E.b]		; 87 3E
	cmp ($3F.b,X)		; C1 3F
	bra  31.b		; 80 1F
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F9.b		; 00 F9
	ora ($FE.b,X)		; 01 FE
	bra -65.b		; 80 BF
	cpy #$FF.b		; C0 FF
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	rti		; 40

	beq -112.b		; F0 90
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	jsr $8060.w		; 20 60 80
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sta ($FF.b,X)		; 81 FF
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $88.b		; 00 88
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$06.b]		; 07 06
	cmp $FA.b		; C5 FA
	adc $070760.l,X		; 7F 60 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $000700.l,X		; 7F 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($1B.b)		; F2 1B
	sbc $1A.b,X		; F5 1A
	brk $1C.b		; 00 1C
	ora $0D.b,S		; 03 0D
	ora ($0E.b,X)		; 01 0E
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $FD0F.w,X		; FD 0F FD
	ora $0E1F1F.l		; 0F 1F 1F 0E
	ora $070F0F.l		; 0F 0F 0F 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $1C.b		; 00 1C
	plp		; 28
	sbc $54.b		; E5 54
	beq -91.b		; F0 A5
	ldx $CC51.w,Y		; BE 51 CC
	plb		; AB
	dey		; 88
	ora [$00.b]		; 07 00
	inc $F800.w,X		; FE 00 F8
	sbc [$FF.b],Y		; F7 FF
	plb		; AB
	sbc $EFFF5F.l,X		; FF 5F FF EF
	sbc $FFFF57.l,X		; FF 57 FF FF
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
	ora $F01FE1.l,X		; 1F E1 1F F0
	ora $F01FFF.l,X		; 1F FF 1F F0
	ora $0F0F90.l,X		; 1F 90 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sta $000F80.l,X		; 9F 80 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$FF.b]		; 07 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $00FFFC.l,X		; FF FC FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
.INDEX 8
	sep #$1B		; E2 1B
	sbc $0A.b		; E5 0A
	cpx #$0C.b		; E0 0C
	sbc $0D.b,S		; E3 0D
	sbc ($0E.b,X)		; E1 0E
	cpx #$E7.b		; E0 E7
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $ED0F.w,X		; FD 0F ED
	ora $EE1FEF.l,X		; 1F EF 1F EE
	ora $E71FEF.l,X		; 1F EF 1F E7
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $1C.b		; 00 1C
	plp		; 28
	sbc $54.b		; E5 54
	beq -91.b		; F0 A5
	ldx $CC51.w,Y		; BE 51 CC
	plb		; AB
	dey		; 88
	ora [$00.b]		; 07 00
	inc $F800.w,X		; FE 00 F8
	sbc [$FF.b],Y		; F7 FF
	plb		; AB
	sbc $EFFF5F.l,X		; FF 5F FF EF
	sbc $FFFF57.l,X		; FF 57 FF FF
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
	ora $C000E0.l,X		; 1F E0 00 C0
	ora $C01FC0.l,X		; 1F C0 1F C0
	ora $C01FC0.l,X		; 1F C0 1F C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFC0C0.l,X		; FF C0 C0 FF
	cmp $E0DFE0.l,X		; DF E0 DF E0
	cmp $E0DFE0.l,X		; DF E0 DF E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
.ACCU 16
.INDEX 16
	rep #$3C		; C2 3C
	tsb $04.b		; 04 04
	sbc $1BFB1F.l,X		; FF 1F FB 1B
	cpx #$E200.w		; E0 00 E2
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	sed		; F8
	sbc $00.b,S		; E3 00
	sbc [$00.b]		; E7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $807F81.l,X		; FF 81 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $7FAA00.l,X		; FF 00 AA 7F
	tax		; AA
	adc $7E7FAA.l,X		; 7F AA 7F 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	bra -95.b		; 80 A1
	sta [$FF.b]		; 87 FF
	sbc $FF7FC0.l,X		; FF C0 7F FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	bra   0.b		; 80 00
	brk $01.b		; 00 01
	ora ($38.b,X)		; 01 38
	and $BF7F00.l,X		; 3F 00 7F BF
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	ora $1F.b,S		; 03 1F
	adc $80F8F8.l,X		; 7F F8 F8 80
	bra   0.b		; 80 00
	sbc $FEFEFE.l,X		; FF FE FE FE
	brk $FE.b		; 00 FE
	brk $0C.b		; 00 0C
	ora $07FF80.l		; 0F 80 FF 07
	sed		; F8
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $01.b		; 00 01
	inc $FE01.w,X		; FE 01 FE
	ora ($E0.b,X)		; 01 E0
	cpx #$0300.w		; E0 00 03
	ora ($07.b,X)		; 01 07
	ora $0F.b,S		; 03 0F
	ora $7F.b,S		; 03 7F
	jsr ($FFFF.w,X)		; FC FF FF
	ora $FF.b,S		; 03 FF
	brk $1B.b		; 00 1B
	cpx $F7.b		; E4 F7
	php		; 08
	dec $BC31.w		; CE 31 BC
	eor $7C.b,S		; 43 7C
	sta $03.b,S		; 83 03
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
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
	brk $FE.b		; 00 FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  48.b		; F0 30
	sbc $00000F.l,X		; FF 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	rts		; 60

	cpx #$F0F0.w		; E0 F0 F0
	sbc ($F0.b),Y		; F1 F0
	sbc ($F0.b),Y		; F1 F0
	ora $FC.b		; 05 FC
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sed		; F8
	brk $98.b		; 00 98
	rts		; 60

	tsb $0CF0.w		; 0C F0 0C
	sbc ($0C.b),Y		; F1 0C
	sbc ($FC.b),Y		; F1 FC
	ora ($30.b,X)		; 01 30
	brk $BF.b		; 00 BF
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	bra   8.b		; 80 08
	dey		; 88
	trb $0894.w		; 1C 94 08
	cld		; D8
	bra  96.b		; 80 60
	inc $FFFF.w,X		; FE FF FF
	sbc ($01.b),Y		; F1 01
	brk $38.b		; 00 38
	sec		; 38
	sec		; 38
	sec		; 38
	bit $3C.b,X		; 34 3C
	plp		; 28
	plp		; 28
	clc		; 18
	tya		; 98
	ora ($00.b,X)		; 01 00
	inc $F000.w,X		; FE 00 F0
	beq  28.b		; F0 1C
	tsb $0303.w		; 0C 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FCFF.l,X		; FF FF FC 00
	ora $000310.l,X		; 1F 10 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	pha		; 48
	pla		; 68
	rti		; 40

	mvp $FF,$03		; 44 03 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	bmi  48.b		; 30 30
	sty $E30C.w		; 8C 0C E3
	ora $70.b,S		; 03 70
	brk $58.b		; 00 58
	jsr $00FE.w		; 20 FE 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F0C0.w		; C0 C0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -4.b		; 80 FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $3880.w		; 0E 80 38
	brk $CA.b		; 00 CA
	tsa		; 3B
	sbc ($FF.b,X)		; E1 FF
	dex		; CA
	sbc $00FFE1.l,X		; FF E1 FF 00
	tsb $00.b		; 04 00
	brk $CA.b		; 00 CA
	sbc $02FFF1.l,X		; FF F1 FF 02
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $04FFE2.l,X		; FF E2 FF 04
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $06FFF2.l,X		; FF F2 FF 06
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $08FFE1.l,X		; FF E1 FF 08
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0EFFF1.l,X		; FF F1 FF 0E
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $E3.b		; 00 E3
	sbc $000420.l,X		; FF 20 04 00
	brk $0A.b		; 00 0A
	brk $F3.b		; 00 F3
	sbc $000422.l,X		; FF 22 04 00
	brk $1A.b		; 00 1A
	brk $EA.b		; 00 EA
	sbc $000424.l,X		; FF 24 04 00
	brk $1A.b		; 00 1A
	brk $FA.b		; 00 FA
	sbc $000426.l,X		; FF 26 04 00
	brk $2A.b		; 00 2A
	brk $EE.b		; 00 EE
	sbc $000428.l,X		; FF 28 04 00
	brk $3A.b		; 00 3A
	brk $F6.b		; 00 F6
	sbc $00042A.l,X		; FF 2A 04 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	rti		; 40

	cpy $FF41.w		; CC 41 FF
	adc $003FE0.l,X		; 7F E0 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $8E.b		; 00 8E
	ora $DF1F80.l		; 0F 80 1F DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	rts		; 60

	ora $01010C.l		; 0F 0C 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	ora $000100.l		; 0F 00 01 00
	jsr ($FC07.w,X)		; FC 07 FC
	ora [$F8.b]		; 07 F8
	ora $F90FF8.l		; 0F F8 0F F9
	asl $0EF8.w		; 0E F8 0E
	sed		; F8
	asl $8EF9.w		; 0E F9 8E
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	adc $0F.b,S		; 63 0F
	and $F0F0FF.l,X		; 3F FF F0 F0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	bvs 127.b		; 70 7F
	brk $FF.b		; 00 FF
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $000600.l,X		; FF 00 06 00
	adc $0F.b,S		; 63 0F
	bit $F0FC.w,X		; 3C FC F0
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	xce		; FB
	ora [$07.b]		; 07 07
	bvs 127.b		; 70 7F
	ora [$F8.b]		; 07 F8
	ora $03FCE0.l,X		; 1F E0 FC 03
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $5A.b		; 04 5A
	sta $81.b,S		; 83 81
	ora #$3333.w		; 09 33 33
	sed		; F8
	tya		; 98
	.db $82, $C4, $2E		; 82 C4 2E
	tax		; AA
	ldy $B4.b,X		; B4 B4
	ora [$4E.b],Y		; 17 4E
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $67FFCC.l,X		; FF CC FF 67
	sbc $55FF7F.l,X		; FF 7F FF 55
	sbc $B9FF4B.l,X		; FF 4B FF B9
	sbc $633E43.l,X		; FF 43 3E 63
	eor $711E83.l,X		; 5F 83 1E 71
	lda $C10F41.l		; AF 41 0F C1
	cmp $406FF1.l		; CF F1 6F 40
	cmp $BFFCFF.l,X		; DF FF FC BF
	jsr ($FCFF.w,X)		; FC FF FC
	cmp $FEFFFE.l,X		; DF FE FF FE
	and $FE9FFE.l,X		; 3F FE 9F FE
	lda $0C20FF.l,X		; BF FF 20 0C
	rts		; 60

	beq -64.b		; F0 C0
	cpy #$0F07.w		; C0 07 0F
	ora $7F3F1F.l		; 0F 1F 3F 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	and $E81730.l,X		; 3F 30 17 E8
	and [$C8.b],Y		; 37 C8
	cmp $C73830.l		; CF 30 38 C7
	beq  15.b		; F0 0F
	cpy #$803F.w		; C0 3F 80
	adc $000000.l,X		; 7F 00 00 00
	brk $1F.b		; 00 1F
	ora $828182.l,X		; 1F 82 81 82
	sta ($C2.b,X)		; 81 C2
	cmp ($C2.b,X)		; C1 C2
	cmp ($E6.b,X)		; C1 E6
	sbc ($FF.b,X)		; E1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	.db $82, $60, $82		; 82 60 82
	bmi -62.b		; 30 C2
	bmi -62.b		; 30 C2
	clc		; 18
	inc $FF.b		; E6 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF06FF.l,X		; FF FF 06 FF
	ora [$F8.b]		; 07 F8
	ora [$F9.b]		; 07 F9
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpy #$FC03.w		; C0 03 FC
	sta $00FF0C.l		; 8F 0C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($00.b,S),Y		; F3 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	trb $580C.w		; 1C 0C 58
	cli		; 58
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $383800.l,X		; FF 00 38 38
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	jmp ($B87C.w)		; 6C 7C B8
	sed		; F8
	trb $081C.w		; 1C 1C 08
	tsb $FAF8.w		; 0C F8 FA
	tsb $0F04.w		; 0C 04 0F
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F3.b		; 00 F3
	ora $FC.b,S		; 03 FC
	brk $0F.b		; 00 0F
	php		; 08
	phd		; 0B
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FD500.l,X		; FF 00 D5 3F
	cmp $3F.b,X		; D5 3F
	cmp $3F.b,X		; D5 3F
	cmp $3F.b,X		; D5 3F
	cmp $3F.b,X		; D5 3F
	cmp $3F.b,X		; D5 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FF000.l,X		; FF 00 F0 3F
	adc $C07FCF.l,X		; 7F CF 7F C0
	adc $C07FC0.l,X		; 7F C0 7F C0
	adc $C17FC0.l,X		; 7F C0 7F C1
	inc $CF03.w,X		; FE 03 CF
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $F0.b		; 00 F0
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $20F10A.l,X		; FF 0A F1 20
	cpy #$0000.w		; C0 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $EFEFFF.l,X		; FF FF EF EF
	sbc $00EF00.l		; EF 00 EF 00
	lda $E02FC0.l		; AF C0 2F E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	sta [$7C.b]		; 87 7C
	brk $10.b		; 00 10
	sbc $10EF10.l		; EF 10 EF 10
	sbc $D0EF10.l		; EF 10 EF D0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $23AFF8.l,X		; FF F8 AF 23
	and $0AFD.w		; 2D FD 0A
	sbc ($00.b),Y		; F1 00
	sbc $003F00.l,X		; FF 00 3F 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	jmp.w [$C2FF]		; DC FF C2
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0E3F3F.l,X		; FF 3F 3F 0E
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	jsr $001F.w		; 20 1F 00
	adc $00F000.l,X		; 7F 00 F0 00
	cpx #$8000.w		; E0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq -16.b		; F0 F0
	cpx #$80E0.w		; E0 E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FE0000.l,X		; 1F 00 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E6.b		; 00 E6
	sbc ($F0.b,X)		; E1 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $81FF80.l,X		; FF 80 FF 81
	sbc $FEBE.w,X		; FD BE FE
	sbc $E61800.l,X		; FF 00 18 E6
	ora $00E000.l		; 0F 00 E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $C100.w,X		; FE 00 C1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	bra 127.b		; 80 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	clv		; B8
	brk $FE.b		; 00 FE
	inc $FFFF.w,X		; FE FF FF
	sbc ($0E.b,X)		; E1 0E
	inc $E0EF.w		; EE EF E0
	sbc $00FF00.l,X		; FF 00 FF 00
	pha		; 48
	pla		; 68
	inc $0100.w,X		; FE 00 01
	brk $FE.b		; 00 FE
	brk $F1.b		; 00 F1
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rts		; 60

	bne -48.b		; D0 D0
	rts		; 60

	stz $5A.b		; 64 5A
	jsl $0E5914.l		; 22 14 59 0E
	tsb $C0C0.w		; 0C C0 C0
	bmi  48.b		; 30 30
	sty $E30C.w		; 8C 0C E3
	ora $78.b,S		; 03 78
	brk $4C.b		; 00 4C
	brk $6E.b		; 00 6E
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	eor ($00.b,X)		; 41 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	rts		; 60

	clc		; 18
	clc		; 18
	asl $06.b		; 06 06
	sta ($01.b,X)		; 81 01
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $48F7FF.l,X		; FF FF F7 48
	sbc [$48.b],Y		; F7 48
	inc $FE41.w,X		; FE 41 FE
	eor ($FE.b,X)		; 41 FE
	rti		; 40

	inc $FE80.w,X		; FE 80 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $FE01.w,X		; FE 01 FE
	ora ($00.b,X)		; 01 00
	bra  12.b		; 80 0C
	jsr ($FFC0.w,X)		; FC C0 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	ora [$E0.b]		; 07 E0
	ora $C03EC1.l		; 0F C1 3E C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FEF00.l,X		; FF 00 EF 1F
	sbc $00001F.l,X		; FF 1F 00 00
	brk $00.b		; 00 00
	bmi -16.b		; 30 F0
	sta $3F.b,S		; 83 3F
	cpy #$100F.w		; C0 0F 10
	sbc ($02.b,X)		; E1 02
	pea $3A41.w		; F4 41 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	brk $FE.b		; 00 FE
	brk $F7.b		; 00 F7
	sed		; F8
	xce		; FB
	jsr ($E902.w,X)		; FC 02 E9
	ora $E4.b,X		; 15 E4
	ora $7F.b		; 05 7F
	ora ($3E.b,X)		; 01 3E
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	xce		; FB
	sbc $3F7F78.l,X		; FF 78 7F 3F
	and $030F0F.l,X		; 3F 0F 0F 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	stp		; DB
	cpx $63.b		; E4 63
	ldy #$40AF.w		; A0 AF 40
	rol $F800.w,X		; 3E 00 F8
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and [$FF.b],Y		; 37 FF
	sta $FF5FFF.l,X		; 9F FF 5F FF
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$F030.w		; C0 30 F0
	tsb $837C.w		; 0C 7C 83
	ora $7807E0.l,X		; 1F E0 07 78
	sta ($7E.b,X)		; 81 7E
	bra  63.b		; 80 3F
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$F900.w		; E0 00 F9
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq  68.b		; F0 44
	jsr ($5E12.w,X)		; FC 12 5E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$30C0.w		; C0 C0 30
	bvs -88.b		; 70 A8
	sec		; 38
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	sbc $FCFFFF.l,X		; FF FF FF FC
	eor $FF.b,S		; 43 FF
	eor $FF.b,S		; 43 FF
	eor $FF.b,S		; 43 FF
	rti		; 40

	sbc $48F740.l,X		; FF 40 F7 48
	cpy #$4000.w		; C0 00 40
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FE01.w,X		; FE 01 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	cli		; 58
	phd		; 0B
	bvs  16.b		; 70 10
	adc ($06.b,X)		; 61 06
	inc $3F.b		; E6 3F
	cmp ($10.b,S),Y		; D3 10
	cld		; D8
	ora $D5.b		; 05 D5
	rol $D6.b,X		; 36 D6
	cmp $FF7F3F.l,X		; DF 3F 7F FF
	adc $FFF9FF.l,X		; 7F FF F9 FF
	cpx $EFFF.w		; EC FF EF
	sbc $E9FFEA.l,X		; FF EA FF E9
	sbc $480D10.l,X		; FF 10 0D 48
	adc [$2C.b]		; 67 2C
	pld		; 2B
	bvs  99.b		; 70 63
	asl $4815.w		; 0E 15 48
	sta ($D8.b,X)		; 81 D8
	eor $8D9E.w,Y		; 59 9E 8D
	sbc $9FFE.w,X		; FD FE 9F
	sbc $9FFFD7.l,X		; FF D7 FF 9F
	sbc $FFFFFB.l,X		; FF FB FF FF
	sbc $73FFA7.l,X		; FF A7 FF 73
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
	brk $3F.b		; 00 3F
	rti		; 40

	and $800080.l,X		; 3F 80 00 80
	and $803F80.l,X		; 3F 80 3F 80
	and $803F80.l,X		; 3F 80 3F 80
	brk $00.b		; 00 00
	adc $C0BF80.l,X		; 7F 80 BF C0
	bra  -1.b		; 80 FF
	lda $C0BFC0.l,X		; BF C0 BF C0
	lda $C0BFC0.l,X		; BF C0 BF C0
	brk $00.b		; 00 00
	bit #$C03E.w		; 89 3E C0
	trb $0202.w		; 1C 02 02
	sbc $F905.w,X		; FD 05 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($00.b,X)		; 01 00
	brk $CC.b		; 00 CC
	tsb $03E4.w		; 0C E4 03
	ora ($FC.b,X)		; 01 FC
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $15.b		; 00 15
	bra  80.b		; 80 50
	brk $C1.b		; 00 C1
	mvp $FF,$DC		; 44 DC FF
	cmp ($FF.b,X)		; C1 FF
	jmp.w [$00FF]		; DC FF 00
	tsb $00.b		; 04 00
	brk $C1.b		; 00 C1
	sbc $02FFEC.l,X		; FF EC FF 02
	tsb $00.b		; 04 00
	brk $D1.b		; 00 D1
	sbc $04FFDF.l,X		; FF DF FF 04
	tsb $00.b		; 04 00
	brk $D1.b		; 00 D1
	sbc $06FFEF.l,X		; FF EF FF 06
	tsb $00.b		; 04 00
	brk $D1.b		; 00 D1
	sbc $08FFFF.l,X		; FF FF FF 08
	tsb $00.b		; 04 00
	brk $E1.b		; 00 E1
	sbc $0AFFDC.l,X		; FF DC FF 0A
	tsb $00.b		; 04 00
	brk $E1.b		; 00 E1
	sbc $0CFFEC.l,X		; FF EC FF 0C
	tsb $00.b		; 04 00
	brk $E1.b		; 00 E1
	sbc $0EFFFC.l,X		; FF FC FF 0E
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $20FFDC.l,X		; FF DC FF 20
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $22FFEC.l,X		; FF EC FF 22
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $24FFFC.l,X		; FF FC FF 24
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $DC.b		; 00 DC
	sbc $000426.l,X		; FF 26 04 00
	brk $01.b		; 00 01
	brk $EC.b		; 00 EC
	sbc $000428.l,X		; FF 28 04 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $000424.l,X		; FF 24 04 00
	brk $11.b		; 00 11
	brk $E1.b		; 00 E1
	sbc $00042A.l,X		; FF 2A 04 00
	brk $11.b		; 00 11
	brk $F1.b		; 00 F1
	sbc $00042C.l,X		; FF 2C 04 00
	brk $21.b		; 00 21
	brk $E8.b		; 00 E8
	sbc $00042E.l,X		; FF 2E 04 00
	brk $21.b		; 00 21
	brk $F8.b		; 00 F8
	sbc $000440.l,X		; FF 40 04 00
	brk $31.b		; 00 31
	brk $EB.b		; 00 EB
	sbc $000442.l,X		; FF 42 04 00
	brk $31.b		; 00 31
	brk $FB.b		; 00 FB
	sbc $000444.l,X		; FF 44 04 00
	brk $41.b		; 00 41
	brk $F3.b		; 00 F3
	sbc $000446.l,X		; FF 46 04 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	jsr $20E0.w		; 20 E0 20
	cpy #$E020.w		; C0 20 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bpl -13.b		; 10 F3
	bpl -17.b		; 10 EF
	ora $C000C0.l,X		; 1F C0 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E3.b		; 00 E3
	ora $E0.b,S		; 03 E0
	ora [$EB.b]		; 07 EB
	asl $EB.b,X		; 16 EB
	asl $FF.b,X		; 16 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bne 127.b		; D0 7F
	bne  -1.b		; D0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $38.b		; 00 38
	ora ($87.b,X)		; 01 87
	adc $00FFFF.l,X		; 7F FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($3E.b,X)		; 01 3E
	and $01FF80.l,X		; 3F 80 FF 01
	inc $00FF.w,X		; FE FF 00
	sbc $000000.l,X		; FF 00 00 00
	trb $8100.w		; 1C 00 81
	ora $FCFF3F.l,X		; 1F 3F FF FC
	jsr ($0000.w,X)		; FC 00 00
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	cpx #$00FF.w		; E0 FF 00
	sbc $FFF807.l,X		; FF 07 F8 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	sed		; F8
	bit #$10F0.w		; 89 F0 10
	cpx #$E707.w		; E0 07 E7
	tsa		; 3B
	cmp ($19.b,S),Y		; D3 19
	cmp $10.b,X		; D5 10
	pei ($02.b)		; D4 02
	cmp ($FF.b)		; D2 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $ECFFF8.l,X		; FF F8 FF EC
	sbc $EFFFEE.l,X		; FF EE FF EF
	sbc $04FFED.l,X		; FF ED FF 04
	ora $A2.b,S		; 03 A2
	and ($3B.b),Y		; 31 3B
	tsx		; BA
	bit $30.b,X		; 34 30
	sta $E5.b,S		; 83 E5
	rti		; 40

	bpl -94.b		; 10 A2
	.db $42, $E6		; 42 E6
	ldx $FF.b		; A6 FF
	sbc $C5FFCF.l,X		; FF CF FF C5
	sbc $1EFFCF.l,X		; FF CF FF 1E
	sbc $FDFFEF.l,X		; FF EF FF FD
	sbc $00FF59.l,X		; FF 59 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $C7.b		; 00 C7
	ora [$FC.b]		; 07 FC
	jsr ($E0E0.w,X)		; FC E0 E0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	brk $00.b		; 00 00
	ora $FEF90F.l		; 0F 0F F9 FE
	ora [$F8.b]		; 07 F8
	bit $FBC3.w,X		; 3C C3 FB
	tsb $E7.b		; 04 E7
	clc		; 18
	dec $8421.w,X		; DE 21 84
	bit $C080.w		; 2C 80 C0
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $7F3F1F.l		; 0F 1F 3F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	xba		; EB
	bne 111.b		; D0 6F
	bcc -97.b		; 90 9F
	rts		; 60

	adc $03FC80.l,X		; 7F 80 FC 03
	beq  15.b		; F0 0F
	cpy #$003F.w		; C0 3F 00
	sbc $7F80FF.l,X		; FF FF 80 7F
	cpy #$C07F.w		; C0 7F C0
	ora $F01FF0.l,X		; 1F F0 1F F0
	ora $F80FFF.l		; 0F FF 0F F8
	sta $00FF78.l		; 8F 78 FF 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $01FFF0.l,X		; FF F0 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1CFFFF.l,X		; FF FF FF 1C
	sbc $00FF1F.l,X		; FF 1F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $810100.l,X		; FF 00 01 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($80.b,X)		; 81 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	adc $807F80.l,X		; 7F 80 7F 80
	xba		; EB
	asl $EB.b,X		; 16 EB
	asl $EB.b,X		; 16 EB
	asl $EB.b,X		; 16 EB
	asl $EB.b,X		; 16 EB
	asl $EB.b,X		; 16 EB
	asl $FF.b,X		; 16 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora $7E0FF4.l		; 0F F4 0F 7E
	cmp ($7F.b,S),Y		; D3 7F
	bne 127.b		; D0 7F
	bne 127.b		; D0 7F
	bne 127.b		; D0 7F
	bne 127.b		; D0 7F
	bne -25.b		; D0 E7
	brk $F3.b		; 00 F3
	brk $FA.b		; 00 FA
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  63.b		; 80 3F
	bmi   7.b		; 30 07
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($7F.b,X)		; 01 7F
	adc ($00.b,X)		; 61 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	ora [$FC.b]		; 07 FC
	ora $C03FE0.l,X		; 1F E0 3F C0
	and $FF7EC1.l,X		; 3F C1 7E FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l,X		; 1F FF 3F FF
	and $FE00FE.l,X		; 3F FE 00 FE
	brk $FE.b		; 00 FE
	brk $0C.b		; 00 0C
	inc $FE02.w,X		; FE 02 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bcs  15.b		; B0 0F
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc ($FE.b),Y		; F1 FE
	sbc $FFFF.w,X		; FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and [$D7.b],Y		; 37 D7
	ora $EC.b		; 05 EC
	ora ($E6.b)		; 12 E6
	asl A		; 0A
	adc ($02.b,S),Y		; 73 02
	jmp ($3E01.w,X)		; 7C 01 3E
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	inx		; E8
	sbc $F9FFF3.l,X		; FF F3 FF F9
	sbc $7F7F7C.l,X		; FF 7C 7F 7F
	adc $1F3F3F.l,X		; 7F 3F 3F 1F
	ora $470707.l,X		; 1F 07 07 47
	eor ($6A.b,X)		; 41 6A
	inc $F1.b		; E6 F1
	sei		; 78
	cmp ($D1.b)		; D2 D1
	php		; 08
	ora [$B0.b]		; 07 B0
	ora $00FF00.l		; 0F 00 FF 00
	jsr ($FFBE.w,X)		; FC BE FF
	sta $87FF.w,X		; 9D FF 87
	sbc $FFFF2F.l,X		; FF 2F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $37DF00.l		; 0F 00 DF 37
	and $00FF.w,Y		; 39 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	dec $DF21.w,X		; DE 21 DF
	jsr $C000.w		; 20 00 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	adc $FF80FF.l,X		; 7F FF 80 FF
	cmp $03FF63.l,X		; DF 63 FF 03
	sbc $01FF03.l,X		; FF 03 FF 01
	sbc $FF0001.l,X		; FF 01 00 FF
	bra 127.b		; 80 7F
	adc $008000.l,X		; 7F 00 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$7C.b]		; 07 7C
	ora [$7C.b]		; 07 7C
	ora [$7C.b]		; 07 7C
	sta [$7C.b]		; 87 7C
	ora $FF.b,S		; 03 FF
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $C2.b,S		; 03 C2
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $C0C3FC.l,X		; FF FC C3 C0
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	sbc ($1F.b)		; F2 1F
	sbc $FFFF00.l		; EF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $C0C01F.l,X		; 1F 1F C0 C0
	rep #$41		; C2 41
	rep #$41		; C2 41
.ACCU 8
	sep #$A1		; E2 A1
	inc $A1.b		; E6 A1
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	cpx #$E082.w		; E0 82 E0
	.db $82, $70, $C2		; 82 70 C2
	bvs -58.b		; 70 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	trb $5E14.w		; 1C 14 5E
	lsr $00FF.w,X		; 5E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bit $7E3C.w,X		; 3C 3C 7E
	ror $7C74.w,X		; 7E 74 7C
	rol $227E.w,X		; 3E 7E 22
	clv		; B8
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00C700.l,X		; FF 00 C7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	sbc $0000FF.l,X		; FF FF 00 00
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
	ora [$07.b]		; 07 07
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	sbc $0003FF.l,X		; FF FF 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	ora $02.b,S		; 03 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpy #$0000.w		; C0 00 00
	ldy #$48B0.w		; A0 B0 48
	jmp $2222.w		; 4C 22 22
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	cpy #$30C0.w		; C0 C0 30
	bmi -52.b		; 30 CC
	tsb $03C3.w		; 0C C3 03
	bvs   0.b		; 70 00
	bit $0700.w,X		; 3C 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	rts		; 60

	jsr $10B0.w		; 20 B0 10
	clc		; 18
	cpy $86.b		; C4 86
	asl $FF.b		; 06 FF
	cpy #$38C0.w		; C0 C0 38
	sec		; 38
	stx $06.b		; 86 06
	sta ($01.b,X)		; 81 01
	cpy #$6000.w		; C0 00 60
	bra  -8.b		; 80 F8
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $0E.b		; 00 0E
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rts		; 60

	rts		; 60

	sed		; F8
	sed		; F8
	asl $000E.w		; 0E 0E 00
	brk $FF.b		; 00 FF
	sbc $FF06FF.l,X		; FF FF 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	jsr ($00FF.w,X)		; FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FDFC00.l,X		; FF 00 FC FD
	sec		; 38
	cmp $38.b		; C5 38
	cmp $F9.b,S		; C3 F9
	cop $F0.b		; 02 F0
	asl A		; 0A
	beq  10.b		; F0 0A
	beq   2.b		; F0 02
	sbc ($02.b),Y		; F1 02
	sbc $FD03.w,X		; FD 03 FD
	cmp $FB.b,S		; C3 FB
	cmp [$FB.b]		; C7 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$F3.b]		; 07 F3
	ora $400FF3.l		; 0F F3 0F 40
	cpx #$FF00.w		; E0 00 FF
	inc $FF00.w,X		; FE 00 FF
	brk $E0.b		; 00 E0
	ora $004F80.l,X		; 1F 80 4F 00
	lda $10700D.l,X		; BF 0D 70 10
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	and $7F7FBF.l,X		; 3F BF 7F 7F
	sbc $800000.l,X		; FF 00 00 80
	bra -30.b		; 80 E2
	stz $07F8.w,X		; 9E F8 07
	rol $0DC1.w,X		; 3E C1 0D
	bcs   7.b		; B0 07
	inx		; E8
	sta $7C.b,S		; 83 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$F800.w		; E0 00 F8
	brk $BE.b		; 00 BE
	cpy #$F0EF.w		; C0 EF F0
	sbc $A1E6F8.l,X		; FF F8 E6 A1
	inc $D1.b,X		; F6 D1
	ora [$F0.b],Y		; 17 F0
	beq  -1.b		; F0 FF
	sbc $FFFFCF.l,X		; FF CF FF FF
	brk $FF.b		; 00 FF
	ora ($FD.b,X)		; 01 FD
	sei		; 78
	dec $38.b		; C6 38
	inc $F8.b		; E6 F8
	ora [$0F.b]		; 07 0F
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $3C.b		; 00 3C
	sec		; 38
	trb $80DC.w		; 1C DC 80
	rts		; 60

	brk $FF.b		; 00 FF
	sbc $F8F7FF.l,X		; FF FF F7 F8
	ora $F6.b		; 05 F6
	tad		; 5B
	bra -36.b		; 80 DC
	sed		; F8
	bit $183C.w		; 2C 3C 18
	tya		; 98
	sbc $000000.l,X		; FF 00 00 00
	sbc [$00.b],Y		; F7 00
	sbc $7F00.w,Y		; F9 00 7F
	brk $FF.b		; 00 FF
	cpx #$FC1F.w		; E0 1F FC
	lda [$10.b]		; A7 10
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $006F00.l,X		; FF 00 6F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $005FFF.l,X		; FF FF 5F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	asl A		; 0A
	ora $02.b		; 05 02
	asl A		; 0A
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000800.l,X		; FF 00 08 00
	ora $0700.w		; 0D 00 07
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF06FF.l,X		; FF FF 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $06.b		; 06 06
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $FF1CE3.l,X		; FF E3 1C FF
	trb $1CFF.w		; 1C FF 1C
	xba		; EB
	php		; 08
	sbc $01FE00.l,X		; FF 00 FE 01
	rol $00C0.w,X		; 3E C0 00
	brk $E3.b		; 00 E3
	trb $1CE3.w		; 1C E3 1C
	sbc $1C.b,S		; E3 1C
	sbc [$1C.b],Y		; F7 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FFC1.w,X		; FE C1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	sbc ($00.b),Y		; F1 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	ora $F30FF3.l		; 0F F3 0F F3
	ora $0101F1.l		; 0F F1 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$814D.w		; C0 4D 81
	sta ($05.b,X)		; 81 05
	and $DC39.w,Y		; 39 39 DC
	sta $85A8CA.l,X		; 9F CA A8 85
	ldx #$9517.w		; A2 17 95
	sbc $FFFEFF.l,X		; FF FF FE FF
	inc $C6FF.w,X		; FE FF C6
	sbc $77FF60.l,X		; FF 60 FF 77
	sbc $6AFF7F.l,X		; FF 7F FF 6A
	sbc $101A21.l,X		; FF 21 1A 10
	stx $D6D8.w		; 8E D8 D6
	ldy #$1C87.w		; A0 87 1C
	pld		; 2B
	brk $83.b		; 00 83
	bpl  19.b		; 10 13
	bmi  51.b		; 30 33
	xce		; FB
	jsr ($FF7E.w,X)		; FC 7E FF
	rol $7FFF.w		; 2E FF 7F
	sbc $7FFFF7.l,X		; FF F7 FF 7F
	sbc $CFFFEF.l,X		; FF EF FF CF
	sbc $2BBABA.l,X		; FF BA BA 2B
	adc [$97.b]		; 67 97
	and ($56.b,S),Y		; 33 56
	stz $E010.w,X		; 9E 10 E0
	ora $00F0.w		; 0D F0 00
	adc $451F00.l,X		; 7F 00 1F 45
	sbc $CCFF9C.l,X		; FF 9C FF CC
	sbc $FFFFE1.l,X		; FF E1 FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $3C1F1F.l,X		; 7F 1F 1F 3C
	phd		; 0B
	bvc  55.b		; 50 37
	dey		; 88
	cmp [$90.b]		; C7 90
	sta $803F40.l		; 8F 40 3F 80
	sei		; 78
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	sbc [$FF.b],Y		; F7 FF
	sbc $FF3FFF.l		; EF FF 3F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$80C0.w		; C0 C0 80
	bra  16.b		; 80 10
	beq -120.b		; F0 88
	sei		; 78
	.db $62, $1E, $D8		; 62 1E D8
	ora [$FE.b]		; 07 FE
	ora ($7F.b,X)		; 01 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  32.b		; 80 20
	cpx #$3C84.w		; E0 84 3C
	cmp ($5F.b),Y		; D1 5F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$70C0.w		; C0 C0 70
	bvs -88.b		; 70 A8
	sec		; 38
	and $803F80.l,X		; 3F 80 3F 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $C0BFC0.l,X		; BF C0 BF C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $C0.b		; 00 C0
	jsr $10E0.w		; 20 E0 10
	bpl -112.b		; 10 90
	bne  32.b		; D0 20
	jsr $2020.w		; 20 20 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	jsr $B000.w		; 20 00 B0
	rti		; 40

	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $403F40.l,X		; 3F 40 3F 40
	and $803F40.l,X		; 3F 40 3F 80
	brk $80.b		; 00 80
	and $803F80.l,X		; 3F 80 3F 80
	and $807F80.l,X		; 3F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	lda $FF80C0.l,X		; BF C0 80 FF
	lda $C0BFC0.l,X		; BF C0 BF C0
	lda $0FC8C0.l,X		; BF C0 C8 0F
	cpx $17.b		; E4 17
	inc $F609.w		; EE 09 F6
	ora $00.b		; 05 00
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $F4.b		; 00 F4
	trb $0EEA.w		; 1C EA 0E
	beq   0.b		; F0 00
	xce		; FB
	brk $00.b		; 00 00
	sbc $FF00FE.l,X		; FF FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$C000.w		; E0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	ora $FFF9.w		; 0D F9 FF
	sbc $FF.b,X		; F5 FF
	sbc $00FF.w,Y		; F9 FF 00
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F9.b		; 00 F9
	sbc $000402.l,X		; FF 02 04 00
	brk $0D.b		; 00 0D
	brk $F9.b		; 00 F9
	sbc $000403.l,X		; FF 03 04 00
	brk $C6.b		; 00 C6
	.db $42, $D8		; 42 D8
	plp		; 28
	bra  64.b		; 80 40
	sbc [$00.b],Y		; F7 00
	sbc ($1B.b,S),Y		; F3 1B
	rtl		; 6B

	trb $00.b		; 14 00
	trb $0000.w		; 1C 00 00
	sta $06.b		; 85 06
	sbc [$18.b],Y		; F7 18
	sbc $1CFF00.l,X		; FF 00 FF 1C
	sbc $1C7F1C.l		; EF 1C 7F 1C
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $91.b		; 00 91
	sta ($00.b),Y		; 91 00
	jsr $00FF.w		; 20 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $7100.w,X		; FE 00 71
	bcs  -1.b		; B0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -17.b		; 80 EF
	iny		; C8
	lda [$FF.b]		; A7 FF
	sta [$68.b],Y		; 97 68
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F840.w		; C0 40 F8
	brk $FF.b		; 00 FF
	bmi -33.b		; 30 DF
	sei		; 78
	sbc $303078.l,X		; FF 78 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	beq  16.b		; F0 10
	sbc [$FF.b],Y		; F7 FF
	beq  -1.b		; F0 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $0401FF.l,X		; FF FF 01 04
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFF7.l,X		; FF F7 FF 02
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $000403.l,X		; FF 03 04 00
	brk $08.b		; 00 08
	brk $FA.b		; 00 FA
	sbc $000404.l,X		; FF 04 04 00
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	sbc $000405.l,X		; FF 05 04 00
	brk $E0.b		; 00 E0
	jsr $23E7.w		; 20 E7 23
	cpx #$DF10.w		; E0 10 DF
	and $FD0DF2.l,X		; 3F F2 0D FD
	php		; 08
	pea $320E.w		; F4 0E 32
	ora $00C0.w		; 0D C0 00
	cpy $07.b		; C4 07
	sbc $00E000.l,X		; FF 00 E0 00
	sbc $07FF07.l,X		; FF 07 FF 07
	xce		; FB
	ora $000F3F.l		; 0F 3F 0F 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	jsr $0808.w		; 20 08 08
	ora $FD19.w,Y		; 19 19 FD
	sbc $FF847F.l,X		; FF 7F 84 FF
	sty $7F.b		; 84 7F
	sbc $5F807F.l,X		; FF 7F 80 5F
	rts		; 60

	pea $E708.w		; F4 08 E7
	tas		; 1B
	asl $00.b		; 06 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	php		; 08
	asl A		; 0A
	sbc $05FEFF.l,X		; FF FF FE 05
	sbc $FFFE05.l,X		; FF 05 FE FF
	inc $F801.w,X		; FE 01 F8
	php		; 08
	trb $0E04.w		; 1C 04 0E
	cop $04.b		; 02 04
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($E0.b,X)		; 01 E0
	cpx #$BE4E.w		; E0 4E BE
	ldx $8F10.w,Y		; BE 10 8F
	cmp $00B04F.l,X		; DF 4F B0 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	sbc $F07FE1.l,X		; FF E1 7F F0
	sbc $E0E0F0.l,X		; FF F0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc ($0A.b,S),Y		; F3 0A
	sbc $F3FF.w,Y		; F9 FF F3
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $000402.l,X		; FF 02 04 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	.db $62, $80, $FF		; 62 80 FF
	brk $00.b		; 00 00
	clc		; 18
	adc [$00.b]		; 67 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	sbc $06E500.l,X		; FF 00 E5 06
	sbc $FF007F.l,X		; FF 7F 00 FF
	adc $7F0098.l,X		; 7F 98 00 7F
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	lsr $7846.w,X		; 5E 46 78
	cli		; 58
	ora [$07.b]		; 07 07
	ora [$1F.b]		; 07 1F
	cop $36.b		; 02 36
	sta $EC.b,S		; 83 EC
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	lda $00A060.l,X		; BF 60 A0 00
	sed		; F8
	brk $1F.b		; 00 1F
	sed		; F8
	sbc $BF3C.w,X		; FD 3C BF
	bit $1818.w,X		; 3C 18 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	inc $0D00.w,X		; FE 00 0D
	beq  11.b		; F0 0B
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	ora $060FFF.l		; 0F FF 0F 06
	asl $00.b		; 06 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $EF.b		; 00 EF
	ora $FFF7.w		; 0D F7 FF
	sbc $FFF8FF.l		; EF FF F8 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $FA.b		; 00 FA
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	adc ($80.b,X)		; 61 80
	sbc $00720C.l,X		; FF 0C 72 00
	brk $0C.b		; 00 0C
	adc ($00.b,S),Y		; 73 00
	brk $00.b		; 00 00
	tsb $00FF.w		; 0C FF 00
	sep #$03		; E2 03
	sbc $3EFF7F.l,X		; FF 7F FF 3E
	brk $FF.b		; 00 FF
	adc $7F008C.l,X		; 7F 8C 00 7F
	tsb $1B0C.w		; 0C 0C 1B
	clc		; 18
	sta $C00093.l,X		; 9F 93 00 C0
	brk $C3.b		; 00 C3
	ora ($04.b,X)		; 01 04
	cop $C4.b		; 02 C4
	and ($3C.b,X)		; 21 3C
	brk $03.b		; 00 03
	sbc [$1C.b]		; E7 1C
	jmp ($FF80.w)		; 6C 80 FF
	cpy #$03FF.w		; C0 FF 03
	ora [$FF.b]		; 07 FF
	sbc $C72707.l,X		; FF 07 27 C7
	ora $03.b,S		; 03 03
	cpx #$80E0.w		; E0 E0 80
	bra 127.b		; 80 7F
	adc $7FB000.l,X		; 7F 00 B0 7F
	sbc $7FA020.l,X		; FF 20 A0 7F
	bra   0.b		; 80 00
	brk $78.b		; 00 78
	brk $06.b		; 00 06
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra -33.b		; 80 DF
	bra  -1.b		; 80 FF
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$1C1C.w		; E0 1C 1C
.ACCU 8
.INDEX 8
	sep #$FA		; E2 FA
	php		; 08
	bit $D0.b		; 24 D0
	rol $00.b		; 26 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jsr ($FE18.w,X)		; FC 18 FE
	bit $3CFE.w,X		; 3C FE 3C
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000900.l,X		; FF 00 09 00
	ora #$00.b		; 09 00
	xba		; EB
	ora ($F4.b),Y		; 11 F4
	sbc $F8FFEB.l,X		; FF EB FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $F3.b		; 00 F3
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $0B.b		; 00 0B
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $EB.b		; 00 EB
	sbc $05FFF0.l,X		; FF F0 FF 05
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $07FFF0.l,X		; FF F0 FF 07
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $00.b		; 00 00
	sbc $00BF40.l,X		; FF 40 BF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	sbc $FF9FFF.l,X		; FF FF 9F FF
	brk $00.b		; 00 00
	sbc $000EFF.l,X		; FF FF 0E 00
	sbc $000707.l,X		; FF 07 07 00
	brk $00.b		; 00 00
	beq  96.b		; F0 60
	bcs   1.b		; B0 01
	brk $0F.b		; 00 0F
	ora $00F001.l		; 0F 01 F0 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora ($FF.b,X)		; 01 FF
	beq -33.b		; F0 DF
	bcc  -1.b		; 90 FF
	brk $0F.b		; 00 0F
	beq  -1.b		; F0 FF
	brk $0F.b		; 00 0F
	beq   3.b		; F0 03
	ora $01.b,S		; 03 01
	ora ($06.b,X)		; 01 06
	ora [$80.b]		; 07 80
	and ($20.b,X)		; 21 20
	cld		; D8
	eor [$07.b],Y		; 57 07
	eor ($03.b,S),Y		; 53 03
	bcc   7.b		; 90 07
	rts		; 60

	bcc   0.b		; 90 00
	cpx #$F8.b		; E0 F8
	brk $AF.b		; 00 AF
	bvs  -1.b		; 70 FF
	beq  -9.b		; F0 F7
	sed		; F8
	pea $F7F8.w		; F4 F8 F7
	sed		; F8
	sbc [$F8.b],Y		; F7 F8
	cpx #$E0.b		; E0 E0
	tsa		; 3B
	sbc [$00.b],Y		; F7 00
	cop $00.b		; 02 00
	cop $FF.b		; 02 FF
	sbc $008200.l,X		; FF 00 82 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	tsb $FF00.w		; 0C 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$08.b		; E0 08
	tsb $7604.w		; 0C 04 76
	eor ($8A.b)		; 52 8A
	bmi -120.b		; 30 88
	bvc -120.b		; 50 88
	brk $F8.b		; 00 F8
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sed		; F8
	bvs  -4.b		; 70 FC
	sed		; F8
	inc $FEF8.w,X		; FE F8 FE
	sed		; F8
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00C000.l,X		; FF 00 C0 00
	cpx #$00.b		; E0 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $F9.b		; 05 F9
	brk $07.b		; 00 07
	stx $E2.b		; 86 E2
	adc $E0.b,S		; 63 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($1C00.w,X)		; FC 00 1C
	ora $1D.b,S		; 03 1D
	sbc $FD.b,S		; E3 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $BE0F28.l,X		; FF 28 0F BE
	rol $E0.b,X		; 36 E0
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	cpy #$CE.b		; C0 CE
	brk $3C.b		; 00 3C
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rts		; 60

	cpx #$10.b		; E0 10
	bpl   8.b		; 10 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
.INDEX 8
	sep #$1A		; E2 1A
	sbc $FFE2FF.l		; EF FF E2 FF
	sbc $0400FF.l		; EF FF 00 04
	brk $00.b		; 00 00
	nop		; EA
	sbc $01FFEF.l,X		; FF EF FF 01
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $02FFEF.l,X		; FF EF FF 02
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $03FFEF.l,X		; FF EF FF 03
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $EF.b		; 00 EF
	sbc $000404.l,X		; FF 04 04 00
	brk $0A.b		; 00 0A
	brk $EF.b		; 00 EF
	sbc $000405.l,X		; FF 05 04 00
	brk $12.b		; 00 12
	brk $EF.b		; 00 EF
	sbc $000406.l,X		; FF 06 04 00
	brk $E2.b		; 00 E2
	sbc $07FFF7.l,X		; FF F7 FF 07
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $08FFF7.l,X		; FF F7 FF 08
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $09FFF7.l,X		; FF F7 FF 09
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0AFFF7.l,X		; FF F7 FF 0A
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F7.b		; 00 F7
	sbc $00040B.l,X		; FF 0B 04 00
	brk $0A.b		; 00 0A
	brk $F7.b		; 00 F7
	sbc $00040C.l,X		; FF 0C 04 00
	brk $12.b		; 00 12
	brk $F7.b		; 00 F7
	sbc $00040D.l,X		; FF 0D 04 00
	brk $1A.b		; 00 1A
	brk $F7.b		; 00 F7
	sbc $00040E.l,X		; FF 0E 04 00
	brk $F9.b		; 00 F9
	sbc $0FFFFF.l,X		; FF FF FF 0F
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	bvs 127.b		; 70 7F
	adc $EAFAC5.l,X		; 7F C5 FA EA
	cmp $00.b,X		; D5 00
	brk $7F.b		; 00 7F
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	ora $000FBF.l		; 0F BF 0F 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($08.b,X)		; 01 08
	ora $FF7F40.l		; 0F 40 7F FF
	sbc $ACAB55.l,X		; FF 55 AB AC
	eor ($00.b)		; 52 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FF7F00.l		; 0F 00 7F FF
	brk $FE.b		; 00 FE
	sed		; F8
	sbc $0F0FF8.l,X		; FF F8 0F 0F
	ora $9E9E1F.l,X		; 1F 1F 9E 9E
	ora #$C8.b		; 09 C8
	phd		; 0B
	iny		; C8
	.db $82, $C3, $00		; 82 C3 00
	cpy #$80.b		; C0 80
	rti		; 40

	brk $00.b		; 00 00
	beq  31.b		; F0 1F
	adc ($8F.b,X)		; 61 8F
	adc $84778F.l,X		; 7F 8F 77 84
	jsr ($FF00.w,X)		; FC 00 FF
	bra  -1.b		; 80 FF
	bra  -2.b		; 80 FE
	inc $C7D7.w,X		; FE D7 C7
	adc $990F.w		; 6D 0F 99
	tas		; 1B
	adc ($79.b),Y		; 71 79
	ora [$FF.b]		; 07 FF
	ora ($01.b,X)		; 01 01
	pha		; 48
	bmi   0.b		; 30 00
	brk $38.b		; 00 38
	cpx #$F3.b		; E0 F3
	bra -25.b		; 80 E7
	tsb $8E.b		; 04 8E
	asl $00.b		; 06 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -12.b		; F0 F4
	jsr ($8383.w,X)		; FC 83 83
	brk $00.b		; 00 00
	lda $FF8380.l,X		; BF 80 83 FF
	lsr $0026.w,X		; 5E 26 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	and $F90000.l,X		; 3F 00 00 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$80.b		; C0 80
	brk $FF.b		; 00 FF
	lda $001100.l,X		; BF 00 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bra  64.b		; 80 40
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  16.b		; 80 10
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	brk $FE.b		; 00 FE
	ora ($7E.b,X)		; 01 7E
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	sbc $7F41FF.l,X		; FF FF 41 7F
	sta ($00.b,X)		; 81 00
	adc $000303.l,X		; 7F 03 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $800100.l,X		; FF 00 01 80
	and $001FC0.l,X		; 3F C0 1F 00
	brk $00.b		; 00 00
	sbc $FFE000.l,X		; FF 00 E0 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $DFC1FF.l,X		; FF FF C1 DF
	cpx #$00.b		; E0 00
	sbc $F0FFFF.l,X		; FF FF FF F0
	beq   0.b		; F0 00
	rti		; 40

	ora ($C0.b,X)		; 01 C0
	rol $003F.w,X		; 3E 3F 00
	cpy #$00.b		; C0 00
	cmp ($00.b,X)		; C1 00
	ora ($36.b,X)		; 01 36
	sbc [$00.b],Y		; F7 00
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$FE.b		; C0 FE
	ora ($FF.b,X)		; 01 FF
	ora ($3F.b,X)		; 01 3F
	cmp ($F9.b,X)		; C1 F9
	cmp ($07.b,X)		; C1 07
	ora [$84.b]		; 07 84
	sei		; 78
	bvc -116.b		; 50 8C
	and ($67.b,S),Y		; 33 67
	iny		; C8
	asl $58.b		; 06 58
	stx $D0.b		; 86 D0
	lda [$F0.b]		; A7 F0
	rol $10.b		; 26 10
	cmp #$FF.b		; C9 FF
	bmi  -1.b		; 30 FF
	sed		; F8
	cmp $FCFFFC.l,X		; DF FC FF FC
	sbc $FC7FFC.l,X		; FF FC 7F FC
	cmp $FEF9FC.l,X		; DF FC F9 FE
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	sbc $50A8FF.l,X		; FF FF A8 50
	cpy #$20.b		; C0 20
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($09.b,X)		; 01 09
	brk $08.b		; 00 08
	sbc $0901FF.l,X		; FF FF 01 09
	brk $F9.b		; 00 F9
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($00.b,X)		; 01 00
	brk $04.b		; 00 04
	ror $20.b,X		; 76 20
	cmp #$78.b		; C9 78
	ldy #$20.b		; A0 20
	bra  48.b		; 80 30
	sty $58.b		; 84 58
	sty $30.b		; 84 30
	cmp $F8F000.l,X		; DF 00 F0 F8
	bmi  -2.b		; 30 FE
	sei		; 78
	cmp $FFF8F8.l,X		; DF F8 F8 FF
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F0F0F8.l		; EF F8 F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $D9.b		; 00 D9
	and ($EC.b,X)		; 21 EC
	sbc $F0FFD9.l,X		; FF D9 FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $E9.b		; 00 E9
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $19.b		; 00 19
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $D9.b		; 00 D9
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	tsb $00.b		; 04 00
	brk $E9.b		; 00 E9
	sbc $0CFFE0.l,X		; FF E0 FF 0C
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $0EFFE0.l,X		; FF E0 FF 0E
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $E0.b		; 00 E0
	sbc $000420.l,X		; FF 20 04 00
	brk $00.b		; 00 00
	sei		; 78
	adc $FF807F.l,X		; 7F 7F 80 FF
	sta ($8D.b)		; 92 8D
	sta $8A.b,X		; 95 8A
	cop $05.b		; 02 05
	brk $F8.b		; 00 F8
	brk $20.b		; 00 20
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	adc $FF07FF.l,X		; 7F FF 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	jsr $FF20.w		; 20 20 FF
	php		; 08
	ora $00F0E8.l		; 0F E8 F0 00
	sbc $5505CA.l,X		; FF CA 05 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	ora $FF0F00.l,X		; 1F 00 0F FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $1F.b		; 00 1F
	cpx #$00.b		; E0 00
	plx		; FA
	brk $02.b		; 00 02
	tsb $FF.b		; 04 FF
	iny		; C8
	and $C0B750.l		; 2F 50 B7 C0
	and $000300.l		; 2F 00 03 00
	sbc $FFF807.l,X		; FF 07 F8 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $84EF84.l,X		; FF 84 EF 84
	sbc $00FF84.l,X		; FF 84 FF 00
	sbc $212F00.l,X		; FF 00 2F 21
	ora $000017.l		; 0F 17 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	dec $E018.w,X		; DE 18 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($E0.b,X)		; 01 E0
	sed		; F8
	beq  -4.b		; F0 FC
	sec		; 38
	and $000800.l,X		; 3F 00 08 00
	mvp $FA,$00		; 44 00 FA
	pla		; 68
	mvp $23,$B4		; 44 B4 23
	ora $030F07.l,X		; 1F 07 0F 03
	cpy $00.b		; C4 00
	sbc $38C700.l,X		; FF 00 C7 38
	xce		; FB
	jsr ($FEBD.w,X)		; FC BD FE
	cmp $C040FE.l,X		; DF FE 40 C0
	bmi  79.b		; 30 4F
	cmp $3E003F.l,X		; DF 3F 00 3E
	ora [$09.b],Y		; 17 09
	bpl  20.b		; 10 14
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	bra   0.b		; 80 00
	sbc $0000B0.l,X		; FF B0 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00FF00.l		; EF 00 FF 00
	sbc $0C0400.l,X		; FF 00 04 0C
	brk $FC.b		; 00 FC
	tsx		; BA
	sta ($0E.b,X)		; 81 0E
	adc ($02.b),Y		; 71 02
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	ora $7F.b,S		; 03 7F
	dec A		; 3A
	.db $82, $00, $7F		; 82 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$0E.b		; C0 0E
	sbc ($08.b,S),Y		; F3 08
	bit $2504.w		; 2C 04 25
	brk $23.b		; 00 23
	ora ($2A.b,X)		; 01 2A
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rep #$02		; C2 02
	sbc ($0C.b,S),Y		; F3 0C
	xce		; FB
	tsb $01FF.w		; 0C FF 01
	sbc $00000B.l,X		; FF 0B 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	brk $10.b		; 00 10
	brk $F4.b		; 00 F4
	cmp ($19.b,X)		; C1 19
	rts		; 60

	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sed		; F8
	cpx #$FF.b		; E0 FF
	sbc ($FF.b),Y		; F1 FF
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $3F0000.l,X		; 7F 00 00 3F
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bvc   7.b		; 50 07
	brk $07.b		; 00 07
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	cpx #$1F.b		; E0 1F
	sbc $F807F8.l,X		; FF F8 07 F8
	inc $0001.w,X		; FE 01 00
	sbc $3E7F7F.l,X		; FF 7F 7F 3E
	rol $0000.w,X		; 3E 00 00
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	sbc $FF08FF.l,X		; FF FF 08 FF
	brk $3F.b		; 00 3F
	cpy #$1F.b		; C0 1F
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $040201.l,X		; FF 01 02 04
	ora $00.b,S		; 03 00
	ora [$80.b]		; 07 80
	lsr $38.b		; 46 38
	and $001F00.l,X		; 3F 00 1F 00
	ora [$FE.b]		; 07 FE
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FE.b,S		; 03 FE
	ora $3F.b,S		; 03 3F
	ora $3F.b,S		; 03 3F
	ora [$1F.b]		; 07 1F
	ora $D90707.l,X		; 1F 07 07 D9
	eor $E8.b,S		; 43 E8
	sbc $58.b,S		; E3 58
	eor $98.b,S		; 43 98
	sbc ($10.b,S),Y		; F3 10
	cmp [$6C.b]		; C7 6C
	eor #$50.b		; 49 50
	sty $F000.w		; 8C 00 F0
	lda $FE1FFE.l,X		; BF FE 1F FE
	lda $FE2FFE.l,X		; BF FE 2F FE
	tyx		; BB
	inc $FEB5.w,X		; FE B5 FE
	jsr ($F0FF.w,X)		; FC FF F0
	beq  -1.b		; F0 FF
	sbc $385420.l,X		; FF 20 54 38
	lsr $00.b		; 46 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora $00E000.l,X		; 1F 00 E0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	xce		; FB
	brk $26.b		; 00 26
	eor ($26.b,X)		; 41 26
	ora ($C7.b,X)		; 01 C7
	ora ($06.b,X)		; 01 06
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	plx		; FA
	ora $FF07FF.l		; 0F FF 07 FF
	ora [$FE.b]		; 07 FE
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $10.b		; 00 10
	plp		; 28
	bvc   8.b		; 50 08
	beq  12.b		; F0 0C
	bvc  44.b		; 50 2C
	beq  28.b		; F0 1C
	ldy #$BE.b		; A0 BE
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $FFF8F8.l,X		; FF F8 F8 FF
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F85EF8.l		; EF F8 5E F8
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
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00F800.l,X		; 7F 00 F8 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	dec A		; 3A
	bra  -6.b		; 80 FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000700.l,X		; FF 00 07 00
	ora [$38.b]		; 07 38
	ora [$F8.b]		; 07 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $7E0280.l,X		; BF 80 02 7E
	brk $38.b		; 00 38
	and ($30.b,S),Y		; 33 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3F8100.l,X		; 3F 00 81 3F
	cmp [$3F.b]		; C7 3F
	sbc $00003E.l		; EF 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$10.b		; E0 10
	ror $ED0F.w,X		; 7E 0F ED
	and $00FDE8.l,X		; 3F E8 FD 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	cpy #$D2.b		; C0 D2
	brk $17.b		; 00 17
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc $E04040.l,X		; FF 40 40 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$10.b		; C0 10
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
	brk $D0.b		; 00 D0
	and #$E7.b		; 29 E7
	sbc $F0FFD0.l,X		; FF D0 FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $E0.b		; 00 E0
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $10.b		; 00 10
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $20.b		; 00 20
	brk $F0.b		; 00 F0
	sbc $00040A.l,X		; FF 0A 04 00
	brk $D0.b		; 00 D0
	sbc $0CFFE0.l,X		; FF E0 FF 0C
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $0EFFE0.l,X		; FF E0 FF 0E
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $20FFE0.l,X		; FF E0 FF 20
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $000422.l,X		; FF 22 04 00
	brk $10.b		; 00 10
	brk $E0.b		; 00 E0
	sbc $000424.l,X		; FF 24 04 00
	brk $9D.b		; 00 9D
	rep #$8A		; C2 8A
	cmp $01.b,X		; D5 01
	ror $0100.w,X		; 7E 00 01
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $01FF7F.l,X		; FF 7F FF 01
	ora $FC.b,S		; 03 FC
	jsr ($FF33.w,X)		; FC 33 FF
	brk $FF.b		; 00 FF
	brk $41.b		; 00 41
	ldy #$AA.b		; A0 AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $C0.b,X		; 16 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $3FFF00.l,X		; FF 00 FF 3F
	mvn $AE,$AB		; 54 AB AE
	bvc  84.b		; 50 54
	plb		; AB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	brk $7F.b		; 00 7F
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $E01F00.l,X		; FF 00 1F E0
	cpx #$1F.b		; E0 1F
	adc $586080.l,X		; 7F 80 60 58
	brk $38.b		; 00 38
	jsr $0058.w		; 20 58 00
	sed		; F8
	brk $18.b		; 00 18
	brk $F8.b		; 00 F8
	ora [$07.b]		; 07 07
	brk $F8.b		; 00 F8
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $E0FF20.l,X		; FF 20 FF E0
	sbc $C0FF00.l,X		; FF 00 FF C0
	ora [$F8.b]		; 07 F8
	sbc $0000C0.l,X		; FF C0 00 00
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	brk $03.b		; 00 03
	ora $03.b		; 05 03
	brk $06.b		; 00 06
	xce		; FB
	inc $0503.w,X		; FE 03 05
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FF03.w,X		; FE 03 FF
	ora $FD.b,S		; 03 FD
	ora [$FE.b]		; 07 FE
	ora [$00.b]		; 07 00
	tsb $00.b		; 04 00
	rti		; 40

	brk $FC.b		; 00 FC
	clc		; 18
	ora $B4.b,X		; 15 B4
	jsl $DE22A8.l		; 22 A8 22 DE
	rti		; 40

	cpx $FF70.w		; EC 70 FF
	brk $C3.b		; 00 C3
	bit $FEFD.w,X		; 3C FD FE
	sbc $DEFE.w		; ED FE DE
	sbc $BEFFDE.l,X		; FF DE FF BE
	sbc $00FF9E.l,X		; FF 9E FF 00
	ora $0E020D.l		; 0F 0D 02 0E
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sta ($7F.b,X)		; 81 7F
	sbc $FF9C00.l,X		; FF 00 9C FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00F010.l		; 0F 10 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	sbc $F08000.l,X		; FF 00 80 F0
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $D0.b		; 00 D0
	and $010031.l		; 2F 31 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	inc $0001.w,X		; FE 01 00
	ora [$00.b],Y		; 17 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C33C00.l,X		; FF 00 3C C3
	jsr $1030.w		; 20 30 10
	ora ($00.b,S),Y		; 13 00
	asl $00.b		; 06 00
	tsb $06.b		; 04 06
	plp		; 28
	inc $FE.b,X		; F6 FE
	tsb $3C.b		; 04 3C
	brk $00.b		; 00 00
	cmp $31EF30.l		; CF 30 EF 31
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $0FF927.l,X		; FF 27 F9 0F
	xce		; FB
	and $108080.l,X		; 3F 80 80 10
	jsr $E400.w		; 20 00 E4
	eor ($32.b,X)		; 41 32
	rts		; 60

	ora ($D0.b),Y		; 11 D0
	dey		; 88
	jsr $E048.w		; 20 48 E0
	pha		; 48
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sed		; F8
	cpy #$FC.b		; C0 FC
	cpx #$FE.b		; E0 FE
	beq 127.b		; F0 7F
	beq  -1.b		; F0 FF
	beq -72.b		; F0 B8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($E2.b,X)		; 01 E2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000.w,X		; FD 00 00
	sbc $007800.l,X		; FF 00 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $78.b		; 00 78
	ora [$00.b]		; 07 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	sbc #$00.b		; E9 00
	rts		; 60

	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $9F603F.l,X		; FF 3F 60 9F
	and $7F40C0.l,X		; 3F C0 40 7F
	and $0F0F3F.l,X		; 3F 3F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $807F80.l,X		; FF 80 7F 80
	sbc ($1E.b,X)		; E1 1E
	brk $FF.b		; 00 FF
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	ora [$7F.b]		; 07 7F
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807800.l,X		; FF 00 78 80
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($06.b,X)		; 01 06
	ora $0D.b,S		; 03 0D
	cop $0E.b		; 02 0E
	sbc ($FD.b),Y		; F1 FD
	sbc ($FE.b),Y		; F1 FE
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	sbc $07FE07.l,X		; FF 07 FE 07
	sbc $0E07.w,X		; FD 07 0E
	ora [$FF.b]		; 07 FF
	ora $1F7F7F.l		; 0F 7F 7F 1F
	ora $4C0F0F.l,X		; 1F 0F 0F 4C
	bra 124.b		; 80 7C
	bvs  14.b		; 70 0E
	jsr $D258.w		; 20 58 D2
	pea $C8C2.w		; F4 C2 C8
	asl $00.b		; 06 00
	jsr ($F800.w,X)		; FC 00 F8
	inc $8EFF.w,X		; FE FF 8E
	sbc $AEFFFE.l,X		; FF FE FF AE
	sbc $FEFF3E.l,X		; FF 3E FF FE
	sbc $F8FCFC.l,X		; FF FC FC F8
	sed		; F8
	trb $1C83.w		; 1C 83 1C
	bra   0.b		; 80 00
	sbc $008000.l,X		; FF 00 80 00
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cop $01.b		; 02 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $18.b		; 05 18
	ora $1D.b		; 05 1D
	cop $1A.b		; 02 1A
	ora $18.b,S		; 03 18
	ora ($1D.b,X)		; 01 1D
	ora ($FF.b,X)		; 01 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	sbc $1FFA1F.l,X		; FF 1F FA 1F
	sbc $FF1F.w,X		; FD 1F FF
	ora $FE1FFE.l,X		; 1F FE 1F FE
	ora $001F1F.l,X		; 1F 1F 1F 00
	brk $20.b		; 00 20
	sty $0C60.w		; 8C 60 0C
	bmi  92.b		; 30 5C
	bvs  44.b		; 70 2C
	rts		; 60

	eor $00B0C0.l,X		; 5F C0 B0 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $F8EFF8.l,X		; FF F8 EF F8
	cmp $F8BFF8.l,X		; DF F8 BF F8
	bvs -16.b		; 70 F0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	adc $FF807F.l,X		; 7F 7F 80 FF
	txa		; 8A
	cmp $7C.b,X		; D5 7C
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $0003FF.l,X		; 7F FF 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $FB.b,S		; 03 FB
	jsr ($FF07.w,X)		; FC 07 FF
	tay		; A8
	eor [$00.b],Y		; 57 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sec		; 38
	and $00FF80.l,X		; 3F 80 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	and $FFFF00.l,X		; 3F 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C01101.l,X		; FF 01 11 C0
	cmp ($81.b),Y		; D1 81
	cmp ($01.b),Y		; D1 01
	cmp ($00.b),Y		; D1 00
	bne   0.b		; D0 00
	bpl -64.b		; 10 C0
	cld		; D8
	brk $F8.b		; 00 F8
	rol $3E01.w,X		; 3E 01 3E
	cpy #$3E.b		; C0 3E
	cpy #$3E.b		; C0 3E
	cpy #$3F.b		; C0 3F
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$00.b		; E0 00
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
	brk $E0.b		; 00 E0
	bpl   0.b		; 10 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	inc $F818.w,X		; FE 18 F8
	adc $E0.b,S		; 63 E0
	ora [$81.b]		; 07 81
	sta $7F0F83.l,X		; 9F 83 0F 7F
	ora [$18.b],Y		; 17 18
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	ora [$FF.b]		; 07 FF
	ora $787EFC.l,X		; 1F FC 7E 78
	jmp ($8060.w,X)		; 7C 60 80
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $77.b		; 00 77
	ora $EC3FEF.l		; 0F EF 3F EC
	sbc $E0FCE9.l,X		; FF E9 FC E0
	sed		; F8
	cpx #$FC.b		; E0 FC
	cmp $3F.b,S		; C3 3F
	brk $00.b		; 00 00
	sed		; F8
	cpy #$D0.b		; C0 D0
	brk $13.b		; 00 13
	brk $17.b		; 00 17
	ora $1F.b,S		; 03 1F
	ora [$1F.b]		; 07 1F
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $F8FF7E.l,X		; FF 7E FF F8
	sed		; F8
	sei		; 78
	sed		; F8
	jsr $1C60.w		; 20 60 1C
	and ($FB.b,S),Y		; 33 FB
	sed		; F8
	sec		; 38
	and $FF00FE.l,X		; 3F FE 00 FF
	brk $78.b		; 00 78
	brk $B8.b		; 00 B8
	brk $C0.b		; 00 C0
	bra -17.b		; 80 EF
	cpy $0307.w		; CC 07 03
	cpy #$00.b		; C0 00
	cpx #$E0.b		; E0 E0
	clc		; 18
	sed		; F8
	asl $1E.b		; 06 1E
	ora ($07.b,X)		; 01 07
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $AF7700.l,X		; FF 00 77 AF
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	clc		; 18
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $002020.l,X		; FF 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	brk $F7.b		; 00 F7
	cmp $000000.l,X		; DF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FC.b		; 00 FC
	bpl  -4.b		; 10 FC
	bra  40.b		; 80 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0B7FFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0B7FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0B7FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0B7FFF. Skipping.
.ENDS
