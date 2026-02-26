.BANK 27 SLOT 0
.ORG $0000

.SECTION "Bank27" FORCE

	pla		; 68
	ora ($00.b,X)		; 01 00
	cop $C0.b		; 02 C0
	ora ($00.b,X)		; 01 00
	ora $50.b		; 05 50
	cop $00.b		; 02 00
	asl $28.b		; 06 28
	ora $00.b,S		; 03 00
	php		; 08
	bvc   4.b		; 50 04
	brk $86.b		; 00 86
	php		; 08
	ora [$00.b]		; 07 00
	dey		; 88
	bvc   9.b		; 50 09
	brk $88.b		; 00 88
	tya		; 98
	phd		; 0B
	brk $8C.b		; 00 8C
	brk $10.b		; 00 10
	brk $02.b		; 00 02
	sec		; 38
	bpl   0.b		; 10 00
	ora $E8.b		; 05 E8
	bpl   0.b		; 10 00
	cop $20.b		; 02 20
	ora ($00.b),Y		; 11 00
	cop $58.b		; 02 58
	ora ($00.b),Y		; 11 00
	cop $90.b		; 02 90
	ora ($00.b),Y		; 11 00
	cop $C8.b		; 02 C8
	ora ($00.b),Y		; 11 00
	cop $00.b		; 02 00
	ora ($00.b)		; 12 00
	cop $38.b		; 02 38
	ora ($00.b)		; 12 00
	cop $70.b		; 02 70
	ora ($00.b)		; 12 00
	cop $A8.b		; 02 A8
	ora ($00.b)		; 12 00
	cop $E0.b		; 02 E0
	ora ($00.b)		; 12 00
	cop $18.b		; 02 18
	ora ($00.b,S),Y		; 13 00
	ora ($48.b,X)		; 01 48
	ora ($00.b,S),Y		; 13 00
	ora ($78.b,X)		; 01 78
	ora ($00.b,S),Y		; 13 00
	ora ($A8.b,X)		; 01 A8
	ora ($00.b,S),Y		; 13 00
	ora ($D8.b,X)		; 01 D8
	ora ($00.b,S),Y		; 13 00
	ora ($08.b,X)		; 01 08
	trb $00.b		; 14 00
	ora ($38.b,X)		; 01 38
	trb $00.b		; 14 00
	ora ($68.b,X)		; 01 68
	trb $00.b		; 14 00
	ora ($98.b,X)		; 01 98
	trb $00.b		; 14 00
	ora ($C8.b,X)		; 01 C8
	trb $00.b		; 14 00
	ora ($F8.b,X)		; 01 F8
	trb $00.b		; 14 00
	ora ($28.b,X)		; 01 28
	ora $00.b,X		; 15 00
	ora ($58.b,X)		; 01 58
	ora $00.b,X		; 15 00
	ora ($88.b,X)		; 01 88
	ora $00.b,X		; 15 00
	ora ($B8.b,X)		; 01 B8
	ora $00.b,X		; 15 00
	ora ($E8.b,X)		; 01 E8
	ora $00.b,X		; 15 00
	ora ($18.b,X)		; 01 18
	asl $00.b,X		; 16 00
	ora ($48.b,X)		; 01 48
	asl $00.b,X		; 16 00
	ora ($78.b,X)		; 01 78
	asl $00.b,X		; 16 00
	ora ($A8.b,X)		; 01 A8
	asl $00.b,X		; 16 00
	ora ($D8.b,X)		; 01 D8
	asl $00.b,X		; 16 00
	cop $10.b		; 02 10
	ora [$00.b],Y		; 17 00
	ora $C0.b		; 05 C0
	ora [$00.b],Y		; 17 00
	asl $78.b		; 06 78
	clc		; 18
	brk $0B.b		; 00 0B
	sed		; F8
	ora $8600.w,Y		; 19 00 86
	bcs  28.b		; B0 1C
	brk $88.b		; 00 88
	sed		; F8
	ora $408800.l,X		; 1F 00 88 40
	bit $00.b		; 24 00
	stx $2B38.w		; 8E 38 2B
	brk $02.b		; 00 02
	bcc  43.b		; 90 2B
	brk $05.b		; 00 05
	jsr $002C.w		; 20 2C 00
	ora $F0.b		; 05 F0
	bit $0700.w		; 2C 00 07
	bpl  46.b		; 10 2E
	brk $0B.b		; 00 0B
	bne  47.b		; D0 2F
	brk $10.b		; 00 10
	cli		; 58
	and ($00.b)		; 32 00
	bit #$3728.w		; 89 28 37
	brk $8D.b		; 00 8D
	clc		; 18
	rol $9000.w,X		; 3E 00 90
	ldy #$0046.w		; A0 46 00
	sta $D0.b,X		; 95 D0
	eor ($00.b),Y		; 51 00
	tsb $78.b		; 04 78
	eor ($00.b)		; 52 00
	php		; 08
	cpy #$0053.w		; C0 53 00
	tsb $68.b		; 04 68
	mvn $07,$00		; 54 00 07
	dey		; 88
	eor $00.b,X		; 55 00
	asl A		; 0A
	brk $57.b		; 00 57
	brk $10.b		; 00 10
	dey		; 88
	eor $8A00.w,Y		; 59 00 8A
	cpx #$005E.w		; E0 5E 00
	sty $6548.w		; 8C 48 65
	brk $8F.b		; 00 8F
	pha		; 48
	adc $9500.w		; 6D 00 95
	sei		; 78
	sei		; 78
	brk $04.b		; 00 04
	jsr $0079.w		; 20 79 00
	ora [$40.b]		; 07 40
	ply		; 7A
	brk $04.b		; 00 04
	inx		; E8
	ply		; 7A
	brk $08.b		; 00 08
	bmi 124.b		; 30 7C
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	ora ($10.b,X)		; 01 10
	dey		; 88
	cop $01.b		; 02 01
	bit #$0758.w		; 89 58 07
	ora ($8C.b,X)		; 01 8C
	cpy #$010D.w		; C0 0D 01
	sta ($D0.b),Y		; 91 D0
	asl $01.b,X		; 16 01
	sty $78.b,X		; 94 78
	and ($01.b,X)		; 21 01
	ora $48.b		; 05 48
	jsl $680701.l		; 22 01 07 68
	and $01.b,S		; 23 01
	cop $C0.b		; 02 C0
	and $01.b,S		; 23 01
	ora $70.b		; 05 70
	bit $01.b		; 24 01
	asl $68.b		; 06 68
	and $01.b		; 25 01
	php		; 08
	bcs  38.b		; B0 26
	ora ($86.b,X)		; 01 86
	inx		; E8
	and #$8801.w		; 29 01 88
	bmi  46.b		; 30 2E
	ora ($88.b,X)		; 01 88
	sei		; 78
	and ($01.b)		; 32 01
	sty $38E0.w		; 8C E0 38
	ora ($02.b,X)		; 01 02
	clc		; 18
	and $0501.w,Y		; 39 01 05
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	plx		; FA
	asl $F8.b		; 06 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $1F.b		; 00 1F
	ora $7F607F.l,X		; 1F 7F 60 7F
	ora $7F0000.l,X		; 1F 00 00 7F
	brk $80.b		; 00 80
	rts		; 60

	sbc $C0C0FF.l,X		; FF FF C0 C0
	brk $00.b		; 00 00
	sta $7F9F00.l,X		; 9F 00 9F 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$FF1F.w		; E0 1F FF
	sbc $C0C0C0.l,X		; FF C0 C0 C0
	cpy #$10D0.w		; C0 D0 10
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	php		; 08
	bmi  -8.b		; 30 F8
	sed		; F8
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	inx		; E8
	brk $C8.b		; 00 C8
	beq  -8.b		; F0 F8
	brk $F8.b		; 00 F8
	brk $38.b		; 00 38
	cpy #$F8F8.w		; C0 F8 F8
	clc		; 18
	clc		; 18
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	sbc [$07.b],Y		; F7 07
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF7FF.l,X		; FF FF F7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0402FF.l,X		; FF FF 02 04
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc $0402FF.l,X		; FF FF 02 04
	brk $00.b		; 00 00
	ora $E06F1F.l		; 0F 1F 6F E0
	adc $00001F.l		; 6F 1F 00 00
	adc $007F7F.l,X		; 7F 7F 7F 00
	bra  96.b		; 80 60
	sbc $0000FF.l,X		; FF FF 00 00
	ora $6F9F00.l,X		; 1F 00 9F 6F
	sbc $70FF00.l,X		; FF 00 FF 70
	sbc $1FE000.l,X		; FF 00 E0 1F
	sbc $FCF8FF.l,X		; FF FF F8 FC
	xce		; FB
	ora $FB.b,S		; 03 FB
	jsr ($0000.w,X)		; FC 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $03.b		; 00 03
	sbc $0000FF.l,X		; FF FF 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	xce		; FB
	sbc $07FF00.l,X		; FF 00 FF 07
	sbc $FC0300.l,X		; FF 00 03 FC
	sbc $E0E0FF.l,X		; FF FF E0 E0
	brk $00.b		; 00 00
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
	brk $F5.b		; 00 F5
	asl A		; 0A
	pea $F5FF.w		; F4 FF F5
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $01FFF4.l,X		; FF F4 FF 01
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F4.b		; 00 F4
	sbc $000402.l,X		; FF 02 04 00
	brk $F5.b		; 00 F5
	sbc $03FFFC.l,X		; FF FC FF 03
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $04FFFC.l,X		; FF FC FF 04
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	sbc $004403.l,X		; FF 03 44 00
	brk $07.b		; 00 07
	ora [$3D.b]		; 07 3D
	and $7B0000.l,X		; 3F 00 00 7B
	brk $00.b		; 00 00
	tsb $48.b		; 04 48
	adc $7CFFBF.l,X		; 7F BF FF 7C
	bra   0.b		; 80 00
	brk $03.b		; 00 03
	ora ($FF.b,X)		; 01 FF
	brk $84.b		; 00 84
	tda		; 7B
	sbc $78FF00.l,X		; FF 00 FF 78
	brk $00.b		; 00 00
	adc $FFFF03.l,X		; 7F 03 FF FF
	bra -127.b		; 80 81
	brk $00.b		; 00 00
	sbc $0000FC.l,X		; FF FC 00 00
	brk $FF.b		; 00 FF
	sbc $00FCFF.l,X		; FF FF FC 00
	brk $00.b		; 00 00
	sta ($80.b,X)		; 81 80
	sbc $FFFC00.l,X		; FF 00 FC FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $808003.l,X		; FF 03 80 80
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	sei		; 78
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	sed		; F8
	pea $F8FC.w		; F4 FC F8
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $84.b		; 00 84
	sei		; 78
	jsr ($FC00.w,X)		; FC 00 FC
	sei		; 78
	brk $00.b		; 00 00
	sed		; F8
	brk $0C.b		; 00 0C
	sbc $F0FFFF.l,X		; FF FF FF F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	sbc $F0F0F0.l,X		; FF F0 F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	asl $FFEF.w		; 0E EF FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $F8.b		; 00 F8
	sbc $02FFEF.l,X		; FF EF FF 02
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $03FFF7.l,X		; FF F7 FF 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $000404.l,X		; FF 04 04 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $004403.l,X		; FF 03 44 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $000405.l,X		; FF 05 04 00
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	sbc $000406.l,X		; FF 06 04 00
	brk $07.b		; 00 07
	ora [$3F.b]		; 07 3F
	and $2A4040.l,X		; 3F 40 40 2A
	trb $D4.b		; 14 D4
	rol A		; 2A
	brk $00.b		; 00 00
	ror $017F.w,X		; 7E 7F 01
	adc $000000.l,X		; 7F 00 00 00
	brk $3F.b		; 00 3F
	brk $43.b		; 00 43
	bit $7C83.w,X		; 3C 83 7C
	sbc $7EFF00.l,X		; FF 00 FF 7E
	sbc $FFBF7E.l,X		; FF 7E BF FF
	adc $FF00C0.l,X		; 7F C0 00 FF
	ora [$7F.b]		; 07 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	adc $7F7F00.l,X		; 7F 00 7F 7F
	adc $78787F.l,X		; 7F 7F 78 78
	sei		; 78
	sei		; 78
	sbc $81C1FF.l,X		; FF FF C1 81
	beq -80.b		; F0 B0
	brk $00.b		; 00 00
	lda $BF4040.l,X		; BF 40 40 BF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	eor ($01.b,X)		; 41 01
	bvs  48.b		; 70 30
	sbc $C03F00.l,X		; FF 00 3F C0
	and $00FFFF.l,X		; 3F FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	beq -97.b		; F0 9F
	sta $FFFFFF.l,X		; 9F FF FF FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $60FF00.l,X		; FF 00 FF 60
	sbc $FFFF60.l,X		; FF 60 FF FF
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sbc $8183FF.l,X		; FF FF 83 81
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	plx		; FA
	tsb $04.b		; 04 04
	plx		; FA
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	.db $82, $80, $02		; 82 80 02
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	asl $F9.b		; 06 F9
	inc $00FF.w,X		; FE FF 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	sed		; F8
	sed		; F8
	tsb $04.b		; 04 04
	tay		; A8
	mvn $A8,$56		; 54 56 A8
	brk $00.b		; 00 00
	jsr ($00FC.w,X)		; FC FC 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	jsr ($FC02.w,X)		; FC 02 FC
	inc $FE00.w,X		; FE 00 FE
	jsr ($FCFE.w,X)		; FC FE FC
	plx		; FA
	inc $06FC.w,X		; FE FC 06
	brk $FE.b		; 00 FE
	cpy #$FEFE.w		; C0 FE FE
	inc $FEFE.w,X		; FE FE FE
	rol $3E3E.w,X		; 3E 3E 3E
	rol $0000.w,X		; 3E 00 00
	sed		; F8
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	rol $3E3E.w,X		; 3E 3E 3E
	rol $8006.w,X		; 3E 06 80
	trb $00.b		; 14 00
	cpx $EA13.w		; EC 13 EA
	sbc $EAFFEC.l,X		; FF EC FF EA
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $02FFEA.l,X		; FF EA FF 02
	tsb $00.b		; 04 00
	brk $0C.b		; 00 0C
	brk $EA.b		; 00 EA
	sbc $000404.l,X		; FF 04 04 00
	brk $ED.b		; 00 ED
	sbc $06FFFA.l,X		; FF FA FF 06
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $08FFFA.l,X		; FF FA FF 08
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	sbc $004406.l,X		; FF 06 44 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	and $557F3F.l,X		; 3F 3F 7F 55
	lsr A		; 4A
	tax		; AA
	ora $95.b,X		; 15 95
	rol A		; 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($1E.b,X)		; 21 1E
	cpy #$C03F.w		; C0 3F C0
	and $101F1F.l,X		; 3F 1F 1F 10
	adc $36C030.l		; 6F 30 C0 36
	dec $A0.b		; C6 A0
	bra  -1.b		; 80 FF
	sbc $101728.l,X		; FF 28 17 10
	and $1F0000.l		; 2F 00 00 1F
	brk $30.b		; 00 30
	brk $36.b		; 00 36
	asl $7F.b		; 06 7F
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	and $FF3FC7.l,X		; 3F C7 3F FF
	sbc $3CFF00.l,X		; FF 00 FF 3C
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $3C3C00.l,X		; FF 00 3C 3C
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sed		; F8
	php		; 08
	inc $0C.b,X		; F6 0C
	ora $0C.b,S		; 03 0C
	ora $05.b,S		; 03 05
	ora ($FF.b,X)		; 01 FF
	sbc $08E814.l,X		; FF 14 E8 08
	pea $0000.w		; F4 00 00
	sed		; F8
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	jsr ($FCE3.w,X)		; FC E3 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	jsr ($AAFE.w,X)		; FC FE AA
	eor ($55.b)		; 52 55
	tay		; A8
	lda #$0054.w		; A9 54 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	sei		; 78
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $FC.b		; 04 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF03.w,X)		; FC 03 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00E080.l,X		; FF 80 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0FFFF.l,X		; FF FF FF E0
	cpx #$0000.w		; E0 00 00
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
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1F07FF.l,X		; FF FF 07 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $3FE03F.l,X		; 7F 3F E0 3F
	and $7FBFFF.l,X		; 3F FF BF 7F
	eor $803FC0.l,X		; 5F C0 3F 80
	brk $7F.b		; 00 7F
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	bra   0.b		; 80 00
	and $00FF00.l,X		; 3F 00 FF 00
	adc $000080.l,X		; 7F 80 00 00
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $08F700.l,X		; FF 00 F7 08
	brk $FF.b		; 00 FF
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	sbc $3EFF00.l,X		; FF 00 FF 3E
	sbc $00003E.l,X		; FF 3E 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $10EF00.l,X		; FF 00 EF 10
	brk $FF.b		; 00 FF
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	brk $00.b		; 00 00
	sbc $7CFF00.l,X		; FF 00 FF 7C
	sbc $00007C.l,X		; FF 7C 00 00
	inc $07FC.w,X		; FE FC 07
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $FAFE.w,X		; FD FE FA
	ora $FC.b,S		; 03 FC
	ora ($00.b,X)		; 01 00
	inc $00FF.w,X		; FE FF 00
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $0001FC.l,X		; FF FC 01 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FE.b		; 00 FE
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  16.b		; 80 10
	brk $E7.b		; 00 E7
	clc		; 18
	sbc $FF.b		; E5 FF
	sbc [$FF.b]		; E7 FF
	sbc $FF.b		; E5 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b		; E5 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora #$E500.w		; 09 00 E5
	sbc $004400.l,X		; FF 00 44 00
	brk $F9.b		; 00 F9
	sbc $02FFE5.l,X		; FF E5 FF 02
	mvp $00,$00		; 44 00 00
	sbc [$FF.b]		; E7 FF
	sbc $FF.b,X		; F5 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b,X		; F5 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	ora #$F500.w		; 09 00 F5
	sbc $004404.l,X		; FF 04 44 00
	brk $F9.b		; 00 F9
	sbc $06FFF5.l,X		; FF F5 FF 06
	mvp $00,$00		; 44 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	and $554A7F.l,X		; 3F 7F 4A 55
	ora $0A.b,X		; 15 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F.b,X		; 35 1F
	rts		; 60

	ora $040303.l,X		; 1F 03 03 04
	ora ($04.b,S),Y		; 13 04
	xba		; EB
	tsb $0CD2.w		; 0C D2 0C
	lda ($CC.b)		; B2 CC
	cpy #$1FDF.w		; C0 DF 1F
	eor $000480.l		; 4F 80 04 00
	ora $011700.l		; 0F 00 17 01
	rol $4E00.w		; 2E 00 4E
	brk $3F.b		; 00 3F
	brk $60.b		; 00 60
	bra  63.b		; 80 3F
	cpy #$FFFF.w		; C0 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor ($41.b,X)		; 41 41
	cpx #$00E0.w		; E0 E0 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $E04141.l,X		; FF 41 41 E0
	cpx #$00FF.w		; E0 FF 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$01E0.w		; E0 E0 01
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $01E0E0.l,X		; FF E0 E0 01
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	bra  63.b		; 80 3F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $FE00FF.l,X		; 7F FF 00 FE
	ora ($04.b,X)		; 01 04
	xce		; FB
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$FFF0.w		; E0 F0 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $00FFC0.l,X		; 7F C0 FF 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$C0FF.w		; C0 FF C0
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	txa		; 8A
	and $95.b,X		; 35 95
	rol A		; 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F203F.l,X		; 7F 3F 20 7F
	lda $DFDF7F.l,X		; BF 7F DF DF
	cpx #$EA1F.w		; E0 1F EA
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $820020.l,X		; 3F 20 00 82
	eor $8A45.w		; 4D 45 8A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$20FF.w		; E0 FF 20
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $B8CF78.l,X		; FF 78 CF B8
	cmp $FF00FF.l		; CF FF 00 FF
	brk $FF.b		; 00 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $0000E0.l,X		; FF E0 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	bra  16.b		; 80 10
	brk $E4.b		; 00 E4
	ora $FFE0.w,X		; 1D E0 FF
	cpx $FF.b		; E4 FF
	cpx #$00FF.w		; E0 FF 00
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $02FFE0.l,X		; FF E0 FF 02
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $E0.b		; 00 E0
	sbc $004400.l,X		; FF 00 44 00
	brk $FE.b		; 00 FE
	sbc $02FFE0.l,X		; FF E0 FF 02
	mvp $00,$00		; 44 00 00
	cpx $FF.b		; E4 FF
	beq  -1.b		; F0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	pea $F0FF.w		; F4 FF F0
	sbc $000406.l,X		; FF 06 04 00
	brk $0E.b		; 00 0E
	brk $F0.b		; 00 F0
	sbc $004404.l,X		; FF 04 44 00
	brk $FE.b		; 00 FE
	sbc $06FFF0.l,X		; FF F0 FF 06
	mvp $00,$00		; 44 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	and $60607F.l,X		; 3F 7F 60 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $010100.l,X		; 1F 00 01 01
	brk $05.b		; 00 05
	ora ($3A.b,X)		; 01 3A
	ora ($F6.b,X)		; 01 F6
	ora $EC.b,S		; 03 EC
	ora $EC.b,S		; 03 EC
	sbc $0002FC.l,X		; FF FC 02 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora $00.b		; 05 00
	ora #$1300.w		; 09 00 13
	brk $13.b		; 00 13
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $807F80.l,X		; 7F 80 7F 80
	adc $9C6080.l,X		; 7F 80 60 9C
	jmp ($7F80.w,X)		; 7C 80 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	cpx #$FC20.w		; E0 20 FC
	bit $00FF.w,X		; 3C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	asl $1E1E.w,X		; 1E 1E 1E
	asl $FF00.w,X		; 1E 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	asl $1E1E.w,X		; 1E 1E 1E
	asl $00FF.w,X		; 1E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $3FA07F.l,X		; 3F 7F A0 3F
	eor $40007F.l		; 4F 7F 00 40
	and $803F00.l,X		; 3F 00 3F 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00C03F.l,X		; FF 3F C0 00
	bra   0.b		; 80 00
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFF800.l,X		; FF 00 F8 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $01FE00.l,X		; FF 00 FE 01
	ora ($FF.b,X)		; 01 FF
	and $F8FFFF.l,X		; 3F FF FF F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	eor [$A8.b],Y		; 57 A8
	xce		; FB
	mvn $AF,$54		; 54 54 AF
	and $00FFFF.l		; 2F FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $FF00F8.l,X		; FF F8 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0A1500.l,X		; FF 00 15 0A
	tax		; AA
	ora $95.b,X		; 15 95
	rol A		; 2A
	tax		; AA
	ora $00.b,X		; 15 00
	brk $40.b		; 00 40
	brk $7F.b		; 00 7F
	and $607F20.l,X		; 3F 20 7F 60
	ora $E01FF0.l,X		; 1F F0 1F E0
	ora $FF3FD5.l,X		; 1F D5 3F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $533FFF.l,X		; 3F FF 3F 53
	ldy #$43B0.w		; A0 B0 43
	rti		; 40

	lda ($A1.b,S),Y		; B3 A1
	eor ($00.b)		; 52 00
	tsb $00.b		; 04 00
	tsb $F8.b		; 04 F8
	sbc $3FFF08.l,X		; FF 08 FF 3F
	cpx #$E31F.w		; E0 1F E3
	rol $5EE3.w,X		; 3E E3 5E
	sbc ($FF.b,S),Y		; F3 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	brk $FF.b		; 00 FF
	lda $BF5F5F.l,X		; BF 5F 5F BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $007F00.l,X		; FF 00 7F 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	sbc $FFFEFF.l,X		; FF FF FE FF
	beq  -4.b		; F0 FC
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C080.w		; C0 80 C0
	cpy #$C03F.w		; C0 3F C0
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $C0FCFC.l,X		; FF FC FC C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $008000.l,X		; FF 00 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $008080.l,X		; FF 80 80 00
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	bra  32.b		; 80 20
	brk $DE.b		; 00 DE
	and ($DB.b,X)		; 21 DB
	sbc $DBFFDE.l,X		; FF DE FF DB
	sbc $000400.l,X		; FF 00 04 00
	brk $EE.b		; 00 EE
	sbc $02FFDB.l,X		; FF DB FF 02
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFDB.l,X		; FF DB FF 04
	tsb $00.b		; 04 00
	brk $12.b		; 00 12
	brk $DB.b		; 00 DB
	sbc $004400.l,X		; FF 00 44 00
	brk $02.b		; 00 02
	brk $DB.b		; 00 DB
	sbc $004402.l,X		; FF 02 44 00
	brk $DE.b		; 00 DE
	sbc $06FFEB.l,X		; FF EB FF 06
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $08FFEB.l,X		; FF EB FF 08
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $12.b		; 00 12
	brk $EB.b		; 00 EB
	sbc $004406.l,X		; FF 06 44 00
	brk $02.b		; 00 02
	brk $EB.b		; 00 EB
	sbc $004408.l,X		; FF 08 44 00
	brk $DF.b		; 00 DF
	sbc $0CFFFB.l,X		; FF FB FF 0C
	tsb $00.b		; 04 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $00040E.l,X		; FF 0E 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	and $007F3F.l,X		; 3F 3F 7F 00
	brk $00.b		; 00 00
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
	asl $7E00.w		; 0E 00 7E
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	and $DF402F.l		; 2F 2F 40 DF
	jsr $205F.w		; 20 5F 20
	sta $639C60.l,X		; 9F 60 9C 63
	tas		; 1B
	cpx #$C01F.w		; E0 1F C0
	brk $10.b		; 00 10
	brk $3F.b		; 00 3F
	brk $BF.b		; 00 BF
	brk $7F.b		; 00 7F
	ora [$7C.b]		; 07 7C
	tsb $FB.b		; 04 FB
	phd		; 0B
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($01.b,X)		; 01 01
	sta ($81.b,X)		; 81 81
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0101FF.l,X		; FF FF 01 01
	sta ($81.b,X)		; 81 81
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8F8FF.l,X		; FF FF F8 F8
	sed		; F8
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	trb $001D.w		; 1C 1D 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $0203.w,X		; FE 03 02
	ora $FF1D.w,X		; 1D 1D FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	ora $3F3F60.l,X		; 1F 60 3F 3F
	adc $A07FA0.l,X		; 7F A0 7F A0
	and $807FCF.l,X		; 3F CF 7F 80
	rti		; 40

	lda $1FFF00.l,X		; BF 00 FF 1F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $00C03F.l,X		; FF 3F C0 00
	bra   0.b		; 80 00
	lda $00FF00.l,X		; BF 00 FF 00
	inc $02FF.w,X		; FE FF 02
	sbc $03FFFE.l,X		; FF FE FF 03
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	cmp ($2D.b)		; D2 2D
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	pea $FF0B.w		; F4 0B FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $007FFF.l,X		; FF FF 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	inc $C0C0.w,X		; FE C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$80C0.w		; C0 C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $03037F.l,X		; 9F 7F 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0303FF.l,X		; FF FF 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	eor $4A.b		; 45 4A
	asl A		; 0A
	ora $B5.b,X		; 15 B5
	asl A		; 0A
	tax		; AA
	ora $95.b,X		; 15 95
	rol A		; 2A
	brk $00.b		; 00 00
	rti		; 40

	brk $1F.b		; 00 1F
	brk $3A.b		; 00 3A
	ora $E01F70.l		; 0F 70 1F E0
	ora $EA3FD0.l,X		; 1F D0 3F EA
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	lda ($AC.b,X)		; A1 AC
	bvc  84.b		; 50 54
	tay		; A8
	tay		; A8
	mvn $A8,$54		; 54 54 A8
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $F0AE00.l,X		; FF 00 AE F0
	ora [$F8.b]		; 07 F8
	sta $F807F8.l		; 8F F8 07 F8
	plb		; AB
	jsr ($00FF.w,X)		; FC FF 00
	sbc $008000.l,X		; FF 00 80 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	plp		; 28
	cmp [$57.b],Y		; D7 57
	plb		; AB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sta $FF.b,S		; 83 FF
	sta $FF.b,S		; 83 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	inc $00FD.w,X		; FE FD 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $3F.b		; 00 3F
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	adc $FF7F7F.l,X		; 7F 7F 7F FF
	brk $00.b		; 00 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	sbc $20E020.l,X		; FF 20 E0 20
	cpx #$FFFF.w		; E0 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FE000.l,X		; FF 00 E0 1F
	cpx #$FF1F.w		; E0 1F FF
	sbc $BFFFFF.l,X		; FF FF FF BF
	eor ($52.b)		; 52 52
	sbc $FF49.w		; ED 49 FF
	cmp #$00FF.w		; C9 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFE090.l,X		; FF 90 E0 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $003FFF.l,X		; 3F FF 3F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $7FF0F0.l,X		; FF F0 F0 7F
	bra -128.b		; 80 80
	sbc $FFFF80.l,X		; FF 80 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $EF0000.l,X		; FF 00 00 EF
	trb $14.b		; 14 14
	xce		; FB
	ora $F9FF.w,Y		; 19 FF F9
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $000FFF.l		; 0F FF 0F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $FA.b		; 00 FA
	asl $F8.b		; 06 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $00FFF8.l,X		; FF F8 FF 00
	mvp $00,$00		; 44 00 00
	rti		; 40

	jsr $DFC0.w		; 20 C0 DF
	bra  63.b		; 80 3F
	adc $00E06F.l		; 6F 6F E0 00
	lda $DFDF80.l,X		; BF 80 DF DF
	cpy #$7FC0.w		; C0 C0 7F
	brk $FF.b		; 00 FF
	cmp $903FFF.l,X		; DF FF 3F 90
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	cpy #$0005.w		; C0 05 00
	tsb $00.b		; 04 00
	sed		; F8
	php		; 08
	inc $FF.b,X		; F6 FF
	sed		; F8
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $08.b		; 00 08
	brk $F6.b		; 00 F6
	sbc $000402.l,X		; FF 02 04 00
	brk $F9.b		; 00 F9
	sbc $03FFFE.l,X		; FF FE FF 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $004403.l,X		; FF 03 44 00
	brk $08.b		; 00 08
	php		; 08
	rti		; 40

	and [$C8.b]		; 27 C8
	cmp $771F90.l		; CF 90 1F 77
	adc [$77.b],Y		; 77 77
	adc [$B8.b],Y		; 77 B8
	bra -120.b		; 80 88
	cmp [$0F.b]		; C7 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	cmp [$FF.b]		; C7 FF
	ora $880088.l		; 0F 88 00 88
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	php		; 08
	ora ($F2.b,X)		; 01 F2
	ora ($F9.b,X)		; 01 F9
	tsb $FC.b		; 04 FC
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	asl $0800.w		; 0E 00 08
	sbc ($F8.b),Y		; F1 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F8FF.w,Y		; F9 FF F8
	php		; 08
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	cpy #$E0E0.w		; C0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	asl $FEFD.w		; 0E FD FE
	sbc $FFFB.w,Y		; F9 FB FF
	sbc $00FF.w,Y		; F9 FF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
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
	asl A		; 0A
	sbc $F8FE.w,Y		; F9 FE F8
	sed		; F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
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
	sed		; F8
	ora [$FE.b]		; 07 FE
	sbc $F8.b,X		; F5 F8
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
	inc $F3F0.w,X		; FE F0 F3
	sbc $00FFF3.l,X		; FF F3 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
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
	ora $EC.b,X		; 15 EC
	sbc $F1EC.w,X		; FD EC F1
	sbc $00FFEF.l,X		; FF EF FF 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $EF.b		; 00 EF
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	sbc $FD12.w		; ED 12 FD
	sbc [$ED.b]		; E7 ED
	sbc $00FFEC.l,X		; FF EC FF 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $EC.b		; 00 EC
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
	jsr $FCE3.w		; 20 E3 FC
	sbc $EA.b,S		; E3 EA
	sbc $00FFE8.l,X		; FF E8 FF 00
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $E8.b		; 00 E8
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	inc $19.b		; E6 19
	xce		; FB
	cmp $E4FFE6.l,X		; DF E6 FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $16.b		; 00 16
	brk $E4.b		; 00 E4
	sbc $000000.l,X		; FF 00 00 00
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $0D.b		; 00 0D
	jsr ($FDFC.w,X)		; FC FC FD
	plx		; FA
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
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
	phd		; 0B
	plx		; FA
	xce		; FB
	jsr ($FFFB.w,X)		; FC FB FF
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
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
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bpl  -5.b		; 10 FB
	inc $FBF9.w,X		; FE F9 FB
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
	tsb $FEF7.w		; 0C F7 FE
	sed		; F8
	sed		; F8
	sbc $00FFF8.l,X		; FF F8 FF 00
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
	asl A		; 0A
	sbc $FE.b,X		; F5 FE
	sbc $F6.b,X		; F5 F6
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
	asl $FEEF.w		; 0E EF FE
	beq -14.b		; F0 F2
	sbc $00FFF3.l,X		; FF F3 FF 00
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
	ora [$EA.b],Y		; 17 EA
	sbc $EFEC.w,X		; FD EC EF
	sbc $00FFEF.l,X		; FF EF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	clc		; 18
	sbc $FC.b		; E5 FC
	inx		; E8
	nop		; EA
	sbc $00FFEB.l,X		; FF EB FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $23.b		; 00 23
	cpx #$E3FC.w		; E0 FC E3
	sbc [$FF.b]		; E7 FF
	inx		; E8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $24.b		; 00 24
	stp		; DB
	xce		; FB
	cmp $E4FFE2.l,X		; DF E2 FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	plx		; FA
	jsr ($FAFD.w,X)		; FC FD FA
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
	ora $FEF8.w		; 0D F8 FE
	sed		; F8
	xce		; FB
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
	bpl  -5.b		; 10 FB
	inc $04F9.w,X		; FE F9 04
	brk $F9.b		; 00 F9
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
	tsb $FEF7.w		; 0C F7 FE
	sed		; F8
	ora $00.b		; 05 00
	sed		; F8
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
	asl A		; 0A
	sbc $FE.b,X		; F5 FE
	sbc $08.b,X		; F5 08
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
	trb $EF.b		; 14 EF
	inc $0BF0.w,X		; FE F0 0B
	brk $F3.b		; 00 F3
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
	ora [$EA.b],Y		; 17 EA
	sbc $0FEC.w,X		; FD EC 0F
	brk $EF.b		; 00 EF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FCE4.w,Y		; 19 E4 FC
	inx		; E8
	ora ($00.b,S),Y		; 13 00
	xba		; EB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $23.b		; 00 23
	cpx #$E3FC.w		; E0 FC E3
	ora [$00.b],Y		; 17 00
	inx		; E8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $24.b		; 00 24
	stp		; DB
	xce		; FB
	cmp $E4001A.l,X		; DF 1A 00 E4
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	plx		; FA
	jsr ($03FD.w,X)		; FC FD 03
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FEF8.w		; 0D F8 FE
	sed		; F8
	tsb $00.b		; 04 00
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	plx		; FA
	asl $F8.b		; 06 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $00FFF8.l,X		; FF F8 FF 00
	mvp $00,$00		; 44 00 00
	rti		; 40

	jsr $DFC0.w		; 20 C0 DF
	bra  63.b		; 80 3F
	adc $00E06F.l		; 6F 6F E0 00
	lda $DFDF80.l,X		; BF 80 DF DF
	cpy #$7FC0.w		; C0 C0 7F
	brk $FF.b		; 00 FF
	cmp $903FFF.l,X		; DF FF 3F 90
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	cpy #$0005.w		; C0 05 00
	tsb $00.b		; 04 00
	sed		; F8
	php		; 08
	inc $FF.b,X		; F6 FF
	sed		; F8
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $08.b		; 00 08
	brk $F6.b		; 00 F6
	sbc $000402.l,X		; FF 02 04 00
	brk $F9.b		; 00 F9
	sbc $03FFFE.l,X		; FF FE FF 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $004403.l,X		; FF 03 44 00
	brk $08.b		; 00 08
	php		; 08
	rti		; 40

	and [$C8.b]		; 27 C8
	cmp $771F90.l		; CF 90 1F 77
	adc [$77.b],Y		; 77 77
	adc [$B8.b],Y		; 77 B8
	bra -120.b		; 80 88
	cmp [$0F.b]		; C7 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	cmp [$FF.b]		; C7 FF
	ora $880088.l		; 0F 88 00 88
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	php		; 08
	ora ($F2.b,X)		; 01 F2
	ora ($F9.b,X)		; 01 F9
	tsb $FC.b		; 04 FC
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	asl $0800.w		; 0E 00 08
	sbc ($F8.b),Y		; F1 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F8FF.w,Y		; F9 FF F8
	php		; 08
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	cpy #$E0E0.w		; C0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	pea $F30A.w		; F4 0A F3
	sbc $F3FFF4.l,X		; FF F4 FF F3
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $01FFF3.l,X		; FF F3 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F3.b		; 00 F3
	sbc $004400.l,X		; FF 00 44 00
	brk $F5.b		; 00 F5
	sbc $02FFFB.l,X		; FF FB FF 02
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $03FFFB.l,X		; FF FB FF 03
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	sbc $004402.l,X		; FF 02 44 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	ora ($30.b,X)		; 01 30
	and [$20.b],Y		; 37 20
	and $1DC0CF.l		; 2F CF C0 1D
	ora $3D3D.w,X		; 1D 3D 3D
	and $000161.l,X		; 3F 61 01 00
	and $137F00.l,X		; 3F 00 7F 13
	adc $C0FF27.l,X		; 7F 27 FF C0
	.db $62, $00, $42		; 62 00 42
	brk $5E.b		; 00 5E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $008300.l,X		; FF 00 83 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $83.b		; 00 83
	sta $FF.b,S		; 83 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C4.b		; 00 C4
	sta $83.b,S		; 83 83
	cmp $DF.b,S		; C3 DF
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	tsb $00FF.w		; 0C FF 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	inc $FFFE.w,X		; FE FE FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $09.b		; 00 09
	brk $EF.b		; 00 EF
	ora $EFFFEE.l		; 0F EE FF EF
	sbc $00FFEE.l,X		; FF EE FF 00
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $01FFEE.l,X		; FF EE FF 01
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $02FFEE.l,X		; FF EE FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	sbc $000403.l,X		; FF 03 04 00
	brk $0F.b		; 00 0F
	brk $EE.b		; 00 EE
	sbc $000404.l,X		; FF 04 04 00
	brk $F1.b		; 00 F1
	sbc $05FFF6.l,X		; FF F6 FF 05
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $06FFF6.l,X		; FF F6 FF 06
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000407.l,X		; FF 07 04 00
	brk $FE.b		; 00 FE
	sbc $06FFF6.l,X		; FF F6 FF 06
	mvp $00,$00		; 44 00 00
	sbc ($FF.b),Y		; F1 FF
	inc $08FF.w,X		; FE FF 08
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $FE.b		; 00 FE
	sbc $000408.l,X		; FF 08 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $0C.b		; 06 0C
	ora $3DFC.w		; 0D FC 3D
	bit $F3.b,X		; 34 F3
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora $091F04.l		; 0F 04 1F 09
	sbc [$F1.b],Y		; F7 F1
	sbc $0000E0.l		; EF E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $E1013F.l,X		; 3F 3F 01 E1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	and $00FF00.l,X		; 3F 00 FF 00
	sbc ($E1.b,X)		; E1 E1
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $002000.l,X		; FF 00 20 00
	jsr $0000.w		; 20 00 00
	brk $FE.b		; 00 FE
	inc $C3C0.w,X		; FE C0 C3
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FDFF.w,X		; FD FF FD
	sbc $FF00FE.l,X		; FF FE 00 FF
	brk $C3.b		; 00 C3
	cmp $FF.b,S		; C3 FF
	sbc $FFFFFC.l,X		; FF FC FF FF
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	bmi -80.b		; 30 B0
	clc		; 18
	cld		; D8
	ora $E716DE.l,X		; 1F DE 16 E7
	inc $FEFE.w,X		; FE FE FE
	inc $0000.w,X		; FE 00 00
	beq   0.b		; F0 00
	sed		; F8
	bcc  -4.b		; 90 FC
	pha		; 48
	sbc [$47.b],Y		; F7 47
	xce		; FB
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $F07FEF.l,X		; FF EF 7F F0
	adc $3FBC7F.l,X		; 7F 7F BC 3F
	cpy #$E09C.w		; C0 9C E0
	sta $FFC0FF.l,X		; 9F FF C0 FF
	ora $009000.l,X		; 1F 00 90 00
	sta $03C000.l		; 8F 00 C0 03
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $FF7FFF.l,X		; 7F FF 7F FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	bra   0.b		; 80 00
	bra   2.b		; 80 02
	sbc $000000.l,X		; FF 00 00 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FF.b,S		; 03 FF
	xce		; FB
	inc $FE07.w,X		; FE 07 FE
	inc $FC3D.w,X		; FE 3D FC
	ora $39.b,S		; 03 39
	ora [$F9.b]		; 07 F9
	sbc $FCFF03.l,X		; FF 03 FF FC
	brk $05.b		; 00 05
	brk $F9.b		; 00 F9
	brk $03.b		; 00 03
	cpy #$00FF.w		; C0 FF 00
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $F8F800.l,X		; FF 00 F8 F8
	sed		; F8
	sed		; F8
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
	asl $80.b		; 06 80
	trb $00.b		; 14 00
	nop		; EA
	ora $EA.b,X		; 15 EA
	sbc $EAFFEA.l,X		; FF EA FF EA
	sbc $000400.l,X		; FF 00 04 00
	brk $FA.b		; 00 FA
	sbc $02FFEA.l,X		; FF EA FF 02
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $EA.b		; 00 EA
	sbc $000404.l,X		; FF 04 04 00
	brk $ED.b		; 00 ED
	sbc $06FFFA.l,X		; FF FA FF 06
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $08FFFA.l,X		; FF FA FF 08
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	sbc $004406.l,X		; FF 06 44 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	ora $DE.b,S		; 03 DE
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	sbc $160E06.l,X		; FF 06 0E 16
	ora $000000.l,X		; 1F 00 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	cop $FF.b		; 02 FF
	jsr ($F8FD.w,X)		; FC FD F8
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	bpl  16.b		; 10 10
	pha		; 48
	lsr $BEA0.w		; 4E A0 BE
	rti		; 40

	adc $FEFF87.l,X		; 7F 87 FF FE
	ora ($F7.b,X)		; 01 F7
	sbc $1F7FF7.l,X		; FF F7 7F 1F
	brk $7E.b		; 00 7E
	asl $FE.b		; 06 FE
	asl $23FF.w,X		; 1E FF 23
	sbc $00FF67.l,X		; FF 67 FF 00
	dey		; 88
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0700FF.l,X		; FF FF 00 07
	ora [$07.b]		; 07 07
	ora [$FF.b]		; 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora [$07.b]		; 07 07
	ora [$05.b]		; 07 05
	plx		; FA
.ACCU 8
.INDEX 8
	sep #$FD		; E2 FD
	ora [$F8.b],Y		; 17 F8
	inc $FEFF.w,X		; FE FF FE
	sbc $0700FF.l,X		; FF FF 00 07
	asl $07.b		; 06 07
	ora [$FD.b]		; 07 FD
	sbc $FFFFFA.l,X		; FF FA FF FF
	bpl   1.b		; 10 01
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $5C.b		; 00 5C
	bne  46.b		; D0 2E
	cpx $F417.w		; EC 17 F4
	sbc $F7F61F.l,X		; FF 1F F6 F7
	inc $EF.b,X		; F6 EF
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	sbc $44FF80.l,X		; FF 80 FF 44
	sbc $01FB63.l,X		; FF 63 FB 01
	bpl   8.b		; 10 08
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	bvs -16.b		; 70 F0
	beq   0.b		; F0 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $93.b		; 00 93
	bra -17.b		; 80 EF
	adc $7E8F70.l		; 6F 70 8F 7E
	ror $7E7E.w,X		; 7E 7E 7E
	ror $007E.w,X		; 7E 7E 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	tsb $00FF.w		; 0C FF 00
	sbc $7E7E00.l,X		; FF 00 7E 7E
	ror $7E7E.w,X		; 7E 7E 7E
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF1C.l,X		; FF 1C FF 00
	sbc $010100.l,X		; FF 00 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b],Y		; 17 1F
	asl $0F.b		; 06 0F
	asl $1F.b,X		; 16 1F
	ora ($0F.b,S),Y		; 13 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora ($0F.b,X)		; 01 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	clc		; 18
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	brk $F7.b		; 00 F7
	sbc $FDFF03.l,X		; FF 03 FF FD
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $E31C.w,X		; FD 1C E3
	trb $001C.w		; 1C 1C 00
	sbc $FC0008.l,X		; FF 08 00 FC
	brk $02.b		; 00 02
	brk $FE.b		; 00 FE
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	trb $00FF.w		; 1C FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FCFF.w,X		; FE FF FC
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc $03FB00.l,X		; FF 00 FB 03
	jsr ($0303.w,X)		; FC 03 03
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora [$00.b]		; 07 00
	jsr ($0000.w,X)		; FC 00 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $F6FF06.l,X		; FF 06 FF F6
	sbc $00FF0C.l,X		; FF 0C FF 00
	sbc $887F80.l,X		; FF 80 7F 88
	sta $00FE00.l		; 8F 00 FE 00
	brk $F8.b		; 00 F8
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bra -13.b		; 80 F3
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  24.b		; 80 18
	brk $E4.b		; 00 E4
	inc A		; 1A
	sbc $FF.b		; E5 FF
	cpx $FF.b		; E4 FF
	sbc $FF.b		; E5 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	pea $E5FF.w		; F4 FF E5
	sbc $000402.l,X		; FF 02 04 00
	brk $04.b		; 00 04
	brk $E5.b		; 00 E5
	sbc $000404.l,X		; FF 04 04 00
	brk $14.b		; 00 14
	brk $E5.b		; 00 E5
	sbc $000406.l,X		; FF 06 04 00
	brk $E7.b		; 00 E7
	sbc $08FFF5.l,X		; FF F5 FF 08
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $0AFFF5.l,X		; FF F5 FF 0A
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $F5.b		; 00 F5
	sbc $004408.l,X		; FF 08 44 00
	brk $F8.b		; 00 F8
	sbc $0AFFF5.l,X		; FF F5 FF 0A
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $02.b		; 06 02
	brk $9E.b		; 00 9E
	sbc ($FF.b,X)		; E1 FF
	sbc $000604.l,X		; FF 04 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora ($06.b,X)		; 01 06
	ora ($FF.b,X)		; 01 FF
	jsr ($FCFE.w,X)		; FC FE FC
	ora ($00.b,X)		; 01 00
	ora $03.b,S		; 03 03
	ora $3E0D.w		; 0D 0D 3E
	sbc $D0EFE8.l,X		; FF E8 EF D0
	cmp $FFBFA0.l,X		; DF A0 BF FF
	rti		; 40

	and $00023F.l,X		; 3F 3F 02 00
	phd		; 0B
	brk $27.b		; 00 27
	ora ($DF.b,X)		; 01 DF
	sta [$BF.b]		; 87 BF
	ora $FF1F7F.l		; 0F 7F 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$00.b		; C0 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $E03FDF.l,X		; FF DF 3F E0
	sbc $C00000.l,X		; FF 00 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$FF.b		; C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $7C7C7C.l,X		; FF 7C 7C 7C
	jmp ($FF00.w,X)		; 7C 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jmp ($7C7C.w,X)		; 7C 7C 7C
	jmp ($FFFF.w,X)		; 7C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0701FF.l,X		; FF FF 01 07
	ora [$07.b]		; 07 07
	ora #$FF.b		; 09 FF
	php		; 08
	sbc $F7FF80.l,X		; FF 80 FF F7
	sed		; F8
	adc $0000FF.l		; 6F FF 00 00
	ora [$06.b]		; 07 06
	ora [$07.b]		; 07 07
	sbc $F8FF.w,Y		; F9 FF F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	rts		; 60

	sbc $808060.l,X		; FF 60 80 80
	rts		; 60

	rts		; 60

	sed		; F8
	sbc $16EE2E.l,X		; FF 2E EE 16
	inc $0A.b,X		; F6 0A
	xce		; FB
	sbc $F8F805.l,X		; FF 05 F8 F8
	bra   0.b		; 80 00
	ldy #$00.b		; A0 00
	iny		; C8
	brk $F6.b		; 00 F6
	cmp $FA.b,S		; C3 FA
	adc ($FD.b,X)		; 61 FD
	bmi  -2.b		; 30 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	brk $F2.b		; 00 F2
	asl $FEFE.w		; 0E FE FE
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $FE.b		; 00 FE
	ror $7EFE.w,X		; 7E FE 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -17.b		; 80 EF
	bra -92.b		; 80 A4
	bra -76.b		; 80 B4
	bra -97.b		; 80 9F
	cpy $C4.b		; C4 C4
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	brk $0F.b		; 00 0F
	beq   0.b		; F0 00
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $3E.b		; 00 3E
	sbc ($3E.b,X)		; E1 3E
	jsr $0000.w		; 20 00 00
	brk $FF.b		; 00 FF
	sbc $20.b,X		; F5 20
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	bit $1E.b,X		; 34 1E
	xba		; EB
	asl $00FF.w,X		; 1E FF 00
	sbc $1EFF00.l,X		; FF 00 FF 1E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0C0800.l,X		; FF 00 08 0C
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	ora $07.b,S		; 03 07
	ora $0F.b,S		; 03 0F
	ora ($0F.b,X)		; 01 0F
	brk $0B.b		; 00 0B
	bpl  27.b		; 10 1B
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $1C.b		; 00 1C
	brk $41.b		; 00 41
	adc ($01.b,X)		; 61 01
	eor ($00.b,X)		; 41 00
	bra 127.b		; 80 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $00BFFF.l,X		; FF FF BF 00
	sbc $7F807F.l,X		; FF 7F 80 7F
	bra  -1.b		; 80 FF
	brk $80.b		; 00 80
	brk $7F.b		; 00 7F
	brk $40.b		; 00 40
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	sbc $FFBFFF.l,X		; FF FF BF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl  -1.b		; 10 FF
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	cop $FF.b		; 02 FF
	sbc $FFFBFF.l,X		; FF FF FB FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	brk $04.b		; 00 04
	tsb $0400.w		; 0C 00 04
	brk $02.b		; 00 02
	sbc $FFFD.w,X		; FD FD FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	xce		; FB
	brk $FF.b		; 00 FF
	sbc $FD02.w,X		; FD 02 FD
	cop $FF.b		; 02 FF
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	rts		; 60

	jsr $2060.w		; 20 60 20
	rts		; 60

	bra -64.b		; 80 C0
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $A0.b		; 00 A0
	bpl -80.b		; 10 B0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $000000.l,X		; 3F 00 00 00
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
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	brk $08.b		; 00 08
	bra  32.b		; 80 20
	brk $E1.b		; 00 E1
	ora $E1FFE0.l,X		; 1F E0 FF E1
	sbc $00FFE0.l,X		; FF E0 FF 00
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $02FFE0.l,X		; FF E0 FF 02
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $E0.b		; 00 E0
	sbc $000404.l,X		; FF 04 04 00
	brk $11.b		; 00 11
	brk $E0.b		; 00 E0
	sbc $000406.l,X		; FF 06 04 00
	brk $E4.b		; 00 E4
	sbc $08FFF0.l,X		; FF F0 FF 08
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $0AFFF0.l,X		; FF F0 FF 0A
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $14.b		; 00 14
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	cop $00.b		; 02 00
	cop $03.b		; 02 03
	ora ($DE.b,X)		; 01 DE
	sbc ($FF.b,X)		; E1 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	ora ($07.b,X)		; 01 07
	brk $FF.b		; 00 FF
	jsr ($FEFF.w,X)		; FC FF FE
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	cmp $F2FD.w,X		; DD FD F2
	ora ($FE.b,S),Y		; 13 FE
	sbc $B0DFD0.l,X		; FF D0 DF B0
	lda $01FFE0.l,X		; BF E0 FF 01
	brk $02.b		; 00 02
	brk $0B.b		; 00 0B
	brk $FF.b		; 00 FF
	ora ($EF.b,X)		; 01 EF
	cmp ($BF.b,X)		; C1 BF
	stx $0EFF.w		; 8E FF 0E
	adc $80801E.l,X		; 7F 1E 80 80
	and $F8003F.l,X		; 3F 3F 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	sec		; 38
	sbc $FFF00F.l,X		; FF 0F F0 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $00FF3F.l,X		; FF 3F FF 00
	brk $00.b		; 00 00
	sbc $0303FF.l,X		; FF FF 03 03
	ora $03.b,S		; 03 03
	brk $FF.b		; 00 FF
	sbc $FF03FF.l,X		; FF FF 03 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030300.l,X		; FF 00 03 03
	ora $03.b,S		; 03 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$C0.b		; C0 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $FF0EFF.l,X		; FF FF 0E FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$FF.b		; C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0E0EFF.l,X		; FF FF 0E 0E
	asl $F3F3.w		; 0E F3 F3
	tsa		; 3B
	and $4C7F7D.l,X		; 3F 7D 7F 4C
	sbc $00FF6C.l,X		; FF 6C FF 00
	sbc $F62FD0.l,X		; FF D0 2F F6
	brk $FD.b		; 00 FD
	brk $3F.b		; 00 3F
	bit $7E7F.w,X		; 3C 7F 7E
	cmp $FDEFFF.l		; CF FF EF FD
	cmp [$F8.b]		; C7 F8
	cmp [$38.b],Y		; D7 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $7FFF.w		; EC FF 7F
	adc ($9C.b,X)		; 61 9C
	sta $EE2F.w,X		; 9D 2F EE
	ora $F6.b,X		; 15 F6
	tas		; 1B
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $BE.b		; 00 BE
	brk $FD.b		; 00 FD
	asl $C0F7.w		; 0E F7 C0
	xce		; FB
	cpx #$FF.b		; E0 FF
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -10.b		; 80 F6
	stx $FEFE.w		; 8E FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $FE7E.w,X		; 7E 7E FE
	inc $FFAF.w,X		; FE AF FF
	cmp $BF.b,S		; C3 BF
	bra 111.b		; 80 6F
	cpy #$B0.b		; C0 B0
	cmp ($E6.b)		; D2 E6
	cmp ($E6.b)		; D2 E6
	cmp ($E6.b)		; D2 E6
	tad		; 5B
	ora [$C1.b],Y		; 17 C1
	brk $60.b		; 00 60
	brk $90.b		; 00 90
	brk $CF.b		; 00 CF
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	sbc $007FFF.l,X		; FF FF 7F 00
	sbc $0F0000.l,X		; FF 00 00 0F
	brk $0F.b		; 00 0F
	ora $FF0000.l		; 0F 00 00 FF
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $00BF3F.l,X		; FF 3F BF 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $00FF.w,X		; FE FF 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $F00000.l,X		; FF 00 00 F0
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $6F.b		; 00 6F
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq -15.b		; F0 F1
	sbc $05FDC7.l,X		; FF C7 FD 05
	sbc ($03.b)		; F2 03
	ora $674B.w		; 0D 4B 67
	phk		; 4B
	adc [$4B.b]		; 67 4B
	adc [$FA.b]		; 67 FA
	iny		; C8
	sta $00.b,S		; 83 00
	cop $00.b		; 02 00
	ora $F300.w		; 0D 00 F3
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $0A.b		; 06 0A
	asl $0C08.w		; 0E 08 0C
	bpl  28.b		; 10 1C
	bpl  28.b		; 10 1C
	bpl  28.b		; 10 1C
	tas		; 1B
	ora $011711.l		; 0F 11 17 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $4F.b		; 00 4F
	and $200000.l,X		; 3F 00 00 20
	bcs  64.b		; B0 40
	rts		; 60

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $00FF40.l,X		; BF 40 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $002000.l,X		; 3F 00 20 00
	sed		; F8
	sbc $404040.l,X		; FF 40 40 40
	rti		; 40

	rti		; 40

	rti		; 40

	jsr $2020.w		; 20 20 20
	jsr $FFFF.w		; 20 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF02.l,X		; FF 02 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0808FF.l,X		; FF FF 08 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $002000.l,X		; 1F 00 20 00
	sbc #$F1.b		; E9 F1
	ora ($01.b,X)		; 01 01
	bpl  48.b		; 10 30
	php		; 08
	trb $0800.w		; 1C 00 08
	brk $00.b		; 00 00
	sbc $FFFEFF.l,X		; FF FF FE FF
	inc $FE00.w,X		; FE 00 FE
	brk $F3.b		; 00 F3
	tsb $00FF.w		; 0C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   0.b		; F0 00
	bpl   0.b		; 10 00
	bra -128.b		; 80 80
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$20.b		; C0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$60.b		; E0 60
	cpy #$20.b		; C0 20
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $E4.b		; 00 E4
	cpy #$78.b		; C0 78
	cpx #$7F.b		; E0 7F
	and $589FA0.l,X		; 3F A0 9F 58
	eor [$3F.b]		; 47 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $FC03FC.l,X		; 3F FC 03 FC
	ora $FF.b,S		; 03 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $7F007F.l,X		; 3F 7F 00 7F
	ora $00FFFF.l		; 0F FF FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$7F.b		; C0 7F
	sta $FF807F.l		; 8F 7F 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	sbc ($FF.b),Y		; F1 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030303.l,X		; FF 03 03 03
	ora $03.b,S		; 03 03
	ora $FF.b,S		; 03 FF
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $27.b,S		; 03 27
	and $3E.b,S		; 23 3E
	and [$FE.b]		; 27 FE
	jsr ($F905.w,X)		; FC 05 F9
	asl $FCE6.w,X		; 1E E6 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($3FFC.w,X)		; FC FC 3F
	cpy #$3F.b		; C0 3F
	cpy #$FF.b		; C0 FF
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	bra  52.b		; 80 34
	brk $DA.b		; 00 DA
	bit $DB.b		; 24 DB
	sbc $DBFFDA.l,X		; FF DA FF DB
	sbc $000400.l,X		; FF 00 04 00
	brk $EA.b		; 00 EA
	sbc $02FFDB.l,X		; FF DB FF 02
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $04FFDB.l,X		; FF DB FF 04
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $DB.b		; 00 DB
	sbc $000406.l,X		; FF 06 04 00
	brk $1A.b		; 00 1A
	brk $DB.b		; 00 DB
	sbc $000408.l,X		; FF 08 04 00
	brk $DF.b		; 00 DF
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0CFFEB.l,X		; FF EB FF 0C
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0EFFEB.l,X		; FF EB FF 0E
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $EB.b		; 00 EB
	sbc $000420.l,X		; FF 20 04 00
	brk $1F.b		; 00 1F
	brk $EB.b		; 00 EB
	sbc $000422.l,X		; FF 22 04 00
	brk $E0.b		; 00 E0
	sbc $24FFFB.l,X		; FF FB FF 24
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $26FFFB.l,X		; FF FB FF 26
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $000426.l,X		; FF 26 04 00
	brk $10.b		; 00 10
	brk $FB.b		; 00 FB
	sbc $000428.l,X		; FF 28 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	adc $1EC37F.l,X		; 7F 7F C3 1E
	dec $B9F9.w,X		; DE F9 B9
	cmp ($B3.b)		; D2 B3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	and $385D00.l,X		; 3F 00 5D 38
	adc $017F10.l,X		; 7F 10 7F 01
	inc A		; 1A
	inc A		; 1A
	tsa		; 3B
	tsa		; 3B
	pla		; 68
	adc $20DFD0.l		; 6F D0 DF 20
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $1DFF00.l,X		; FF 00 FF 1D
	brk $27.b		; 00 27
	brk $5F.b		; 00 5F
	ora [$BF.b]		; 07 BF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FFE0FF.l,X		; 3F FF E0 FF
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$FF.b		; C0 FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $0F0F07.l,X		; FF 07 0F 0F
	ora $000F0F.l		; 0F 0F 0F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $0F.b		; 00 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $808000.l,X		; FF 00 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F90707.l,X		; FF 07 07 F9
	sbc $3E02.w,Y		; F9 02 3E
	ora $3E3F.w,X		; 1D 3F 3E
	and $36FF22.l,X		; 3F 22 FF 36
	sbc $FBFF00.l,X		; FF 00 FF FB
	brk $FE.b		; 00 FE
	brk $3F.b		; 00 3F
	bit $3E3F.w,X		; 3C 3F 3E
	and $FFE33F.l,X		; 3F 3F E3 FF
	sbc [$FE.b],Y		; F7 FE
	sbc $FC.b,S		; E3 FC
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	rts		; 60

	rts		; 60

	tyx		; BB
	lda $67D8DF.l,X		; BF DF D8 67
	sbc [$0B.b]		; E7 0B
	xce		; FB
	ora $FD.b		; 05 FD
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	ldy #$00.b		; A0 00
	bne   0.b		; D0 00
	sbc $83FF00.l		; EF 00 FF 83
	sbc $FEF0.w,X		; FD F0 FE
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -32.b		; 80 E0
	cpx #$30.b		; E0 30
	bra -80.b		; 80 B0
	beq -48.b		; F0 D0
	ldx $00D1.w,Y		; BE D1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	cpy #$E0.b		; C0 E0
	bra -17.b		; 80 EF
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$0F.b		; E0 0F
	adc $A77FCF.l,X		; 7F CF 7F A7
	sbc $D15F83.l,X		; FF 83 5F D1
	lda $C06790.l,X		; BF 90 67 C0
	clv		; B8
	iny		; C8
	sbc $800080.l		; EF 80 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $98.b		; 00 98
	brk $C7.b		; 00 C7
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	lda $00FF00.l,X		; BF 00 FF 00
	brk $03.b		; 00 03
	jsr ($0000.w,X)		; FC 00 00
	sbc $008000.l,X		; FF 00 80 00
	cpy #$00.b		; C0 00
	adc $000000.l,X		; 7F 00 00 00
	sbc $030100.l,X		; FF 00 01 03
	sbc $EFFFFF.l,X		; FF FF FF EF
	sbc $FFFFF7.l,X		; FF F7 FF FF
	jsr ($07F8.w,X)		; FC F8 07
	sbc [$00.b],Y		; F7 00
	brk $F0.b		; 00 F0
	ora $F00020.l		; 0F 20 00 F0
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $50.b		; 00 50
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFDFF.l,X		; FF FF FD FF
	xce		; FB
	sbc $C7CFFF.l,X		; FF FF CF C7
	sed		; F8
	xce		; FB
	brk $00.b		; 00 00
	ora $FC.b,S		; 03 FC
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	and $00FC00.l,X		; 3F 00 FC 00
	sbc $030100.l,X		; FF 00 01 03
	ora [$CF.b],Y		; 17 CF
	adc $0101FF.l,X		; 7F FF 01 01
	cop $03.b		; 02 03
	tsb $07.b		; 04 07
	tsb $07.b		; 04 07
	tsb $07.b		; 04 07
	tsb $07.b		; 04 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pea $EFF7.w		; F4 F7 EF
	cpx $C74B.w		; EC 4B C7
	cpy #$C0.b		; C0 C0
	sta ($84.b)		; 92 84
	dey		; 88
	sty $8880.w		; 8C 80 88
	tax		; AA
	tax		; AA
	sbc $80DFC3.l		; EF C3 DF 80
	and $003F00.l,X		; 3F 00 3F 00
	adc [$08.b],Y		; 77 08
	adc $007F00.l,X		; 7F 00 7F 00
	eor $00.b,X		; 55 00
	ora $FF.b,S		; 03 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	tsb $04.b		; 04 04
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	plb		; AB
	plb		; AB
	sbc $00FFE3.l,X		; FF E3 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $005500.l,X		; FF 00 55 00
	sbc $3FFFC0.l,X		; FF C0 FF 3F
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tax		; AA
	tax		; AA
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $005500.l,X		; FF 00 55 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tax		; AA
	tax		; AA
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $005500.l,X		; FF 00 55 00
	sbc $FFFFFC.l,X		; FF FC FF FF
	asl $FF.b		; 06 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tax		; AA
	tax		; AA
	sbc $06FFFC.l,X		; FF FC FF 06
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $005500.l,X		; FF 00 55 00
	inx		; E8
	ora [$FF.b],Y		; 17 FF
	bra 127.b		; 80 7F
	sbc $040202.l,X		; FF 02 02 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $AD.b		; 04 AD
	lda $1CEB.w		; AD EB 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	phy		; 5A
	brk $06.b		; 00 06
	inc $06FF.w,X		; FE FF 06
	plx		; FA
	jsr ($0000.w,X)		; FC 00 00
	cop $06.b		; 02 06
	cop $07.b		; 02 07
	brk $02.b		; 00 02
	eor $55.b,X		; 55 55
	sbc $00FF78.l,X		; FF 78 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $FC.b		; 00 FC
	sbc $207F7F.l,X		; FF 7F 7F 20
	bmi  56.b		; 30 38
	sec		; 38
	sty $1C.b,X		; 94 1C
	trb $1C.b		; 14 1C
	trb $1C.b		; 14 1C
	mvn $7F,$5C		; 54 5C 7F
	and $C01FBF.l,X		; 3F BF 1F C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
	jsr $E0E0.w		; 20 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp #$F3.b		; C9 F3
	cmp #$F3.b		; C9 F3
	bpl -113.b		; 10 8F
	eor $F20B.w		; 4D 0B F2
	cpy #$BC.b		; C0 BC
	beq 103.b		; F0 67
	and $FC1D3E.l,X		; 3F 3E 1D FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	sbc $3EC0FD.l,X		; FF FD C0 3E
	jsr $233F.w		; 20 3F 23
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	and $C03FC3.l,X		; 3F C3 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	eor $00AF00.l,X		; 5F 00 AF 00
	sbc $FFFFF0.l,X		; FF F0 FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc $00FFF0.l,X		; FF F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $FD00.w,X		; FE 00 FD
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	beq  15.b		; F0 0F
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora ($00.b,X)		; 01 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $F05000.l,X		; FF 00 50 F0
	jsr ($FDFF.w,X)		; FC FF FD
	sbc $F0FFF8.l,X		; FF F8 FF F0
	adc $02FEE3.l,X		; 7F E3 FE 02
	sbc $0601.w,Y		; F9 01 06
	ora $FD.b		; 05 FD
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sta ($00.b,X)		; 81 00
	sta ($00.b,X)		; 81 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	sbc $0300.w,Y		; F9 00 03
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	ora [$7F.b]		; 07 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $007F7F.l,X		; 7F 7F 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $007F7F.l,X		; 7F 7F 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0E0E0.l,X		; FF E0 E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $070707.l,X		; FF 07 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	cpx #$FC.b		; E0 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FC00.w,X		; FE 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cmp $113F10.l,X		; DF 10 3F 11
	sbc $FFFFF1.l,X		; FF F1 FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $73.b		; 45 73
	eor $73.b		; 45 73
	cop $FC.b		; 02 FC
	sbc $33D4.w		; ED D4 33
	and ($2E.b,X)		; 21 2E
	and $F9.b,S		; 23 F9
	inc $EE1E.w,X		; FE 1E EE
	sta $008F00.l		; 8F 00 8F 00
	sbc $00FB00.l,X		; FF 00 FB 00
	and $C03FC0.l,X		; 3F C0 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	rti		; 40

	cpy #$40.b		; C0 40
	rti		; 40

	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	plx		; FA
	asl $F8.b		; 06 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $1F.b		; 00 1F
	ora $7F607F.l,X		; 1F 7F 60 7F
	ora $7F0000.l,X		; 1F 00 00 7F
	brk $80.b		; 00 80
	rts		; 60

	sbc $C0C0FF.l,X		; FF FF C0 C0
	brk $00.b		; 00 00
	sta $7F9F00.l,X		; 9F 00 9F 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$1F.b		; E0 1F
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$C0.b		; C0 C0
	bne  16.b		; D0 10
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	php		; 08
	bmi  -8.b		; 30 F8
	sed		; F8
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	inx		; E8
	brk $C8.b		; 00 C8
	beq  -8.b		; F0 F8
	brk $F8.b		; 00 F8
	brk $38.b		; 00 38
	cpy #$F8.b		; C0 F8
	sed		; F8
	clc		; 18
	clc		; 18
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	sbc [$07.b],Y		; F7 07
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF7FF.l,X		; FF FF F7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0402FF.l,X		; FF FF 02 04
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc $0402FF.l,X		; FF FF 02 04
	brk $00.b		; 00 00
	ora $E06F1F.l		; 0F 1F 6F E0
	adc $00001F.l		; 6F 1F 00 00
	adc $007F7F.l,X		; 7F 7F 7F 00
	bra  96.b		; 80 60
	sbc $0000FF.l,X		; FF FF 00 00
	ora $6F9F00.l,X		; 1F 00 9F 6F
	sbc $70FF00.l,X		; FF 00 FF 70
	sbc $1FE000.l,X		; FF 00 E0 1F
	sbc $FCF8FF.l,X		; FF FF F8 FC
	xce		; FB
	ora $FB.b,S		; 03 FB
	jsr ($0000.w,X)		; FC 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $03.b		; 00 03
	sbc $0000FF.l,X		; FF FF 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	xce		; FB
	sbc $07FF00.l,X		; FF 00 FF 07
	sbc $FC0300.l,X		; FF 00 03 FC
	sbc $E0E0FF.l,X		; FF FF E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sbc ($0C.b,S),Y		; F3 0C
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F7.b		; 00 F7
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $F7.b		; 00 F7
	sbc $000403.l,X		; FF 03 04 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $000404.l,X		; FF 04 04 00
	brk $03.b		; 00 03
	ora $1F.b,S		; 03 1F
	ora $FECFFF.l,X		; 1F FF CF FE
	brk $21.b		; 00 21
	inc $7F5D.w,X		; FE 5D 7F
	bvs  95.b		; 70 5F
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	sbc $20FF00.l,X		; FF 00 FF 20
	adc $707F70.l,X		; 7F 70 7F 70
	bmi  48.b		; 30 30
	jsr ($48FC.w,X)		; FC FC 48
	cld		; D8
	sta ($EC.b,S),Y		; 93 EC
	sbc $03FFFF.l,X		; FF FF FF 03
	ora $FE.b		; 05 FE
	ora [$FE.b]		; 07 FE
	rol $25.b		; 26 25
	ora $00.b,S		; 03 00
	bne  16.b		; D0 10
	sbc $00005C.l,X		; FF 5C 00 00
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $272707.l,X		; FF 07 27 27
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	tya		; 98
	tya		; 98
	dec $EF4E.w		; CE 4E EF
	ldy #$8B.b		; A0 8B
	sbc $00C7C7.l,X		; FF C7 C7 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $67.b		; 00 67
	brk $B1.b		; 00 B1
	brk $DF.b		; 00 DF
	bra  -1.b		; 80 FF
	bra -57.b		; 80 C7
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	bpl -10.b		; 10 F6
	sbc $F7FFEF.l,X		; FF EF FF F7
	sbc $000400.l,X		; FF 00 04 00
	brk $F7.b		; 00 F7
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $03FFF6.l,X		; FF F6 FF 03
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $04FFFE.l,X		; FF FE FF 04
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000405.l,X		; FF 05 04 00
	brk $0F.b		; 00 0F
	brk $FA.b		; 00 FA
	sbc $000406.l,X		; FF 06 04 00
	brk $0F.b		; 00 0F
	ora $FFFFFB.l		; 0F FB FF FF
	bra  24.b		; 80 18
	sbc $2F6F34.l,X		; FF 34 6F 2F
	and [$34.b],Y		; 37 34
	and $001C1C.l		; 2F 1C 1C 00
	brk $0C.b		; 00 0C
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	clc		; 18
	adc $3C3F3C.l,X		; 7F 3C 3F 3C
	and $1C1C3C.l,X		; 3F 3C 1C 1C
	sbc $F9A8FF.l,X		; FF FF A8 F9
	and ($FE.b),Y		; 31 FE
	sbc $40FFFF.l,X		; FF FF FF 40
	jsr $FFFF.w		; 20 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $59.b		; 00 59
	eor ($DF.b,X)		; 41 DF
	cmp $0040.w		; CD 40 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($83FC.w,X)		; FC FC 83
	sbc $4F.b,S		; E3 4F
	beq  -4.b		; F0 FC
	jsr ($9BFF.w,X)		; FC FF 9B
	sbc [$AD.b],Y		; F7 AD
	lda $3CF6.w		; AD F6 3C
	sbc [$00.b],Y		; F7 00
	brk $60.b		; 00 60
	rts		; 60

	lda $0043B0.l		; AF B0 43 00
	jsr ($FE18.w,X)		; FC 18 FE
	bit $3CFF.w,X		; 3C FF 3C
	sbc $2E363C.l,X		; FF 3C 36 2E
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	rol $1C1C.w,X		; 3E 1C 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	adc ($72.b)		; 72 72
	trb $FF1C.w		; 1C 1C FF
	sbc $FF80BF.l,X		; FF BF 80 FF
	sbc $000E0E.l,X		; FF 0E 0E 00
	brk $10.b		; 00 10
	brk $8C.b		; 00 8C
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $0E.b		; 00 0E
	asl $0000.w		; 0E 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	brk $0B.b		; 00 0B
	brk $EC.b		; 00 EC
	trb $F4.b		; 14 F4
	brk $EC.b		; 00 EC
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $01FFF4.l,X		; FF F4 FF 01
	tsb $00.b		; 04 00
	brk $FC.b		; 00 FC
	sbc $02FFF4.l,X		; FF F4 FF 02
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	sbc $000403.l,X		; FF 03 04 00
	brk $0C.b		; 00 0C
	brk $F4.b		; 00 F4
	sbc $000404.l,X		; FF 04 04 00
	brk $14.b		; 00 14
	brk $F4.b		; 00 F4
	sbc $000405.l,X		; FF 05 04 00
	brk $EE.b		; 00 EE
	sbc $06FFFC.l,X		; FF FC FF 06
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $07FFFC.l,X		; FF FC FF 07
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $08FFFC.l,X		; FF FC FF 08
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $FC.b		; 00 FC
	sbc $000409.l,X		; FF 09 04 00
	brk $0E.b		; 00 0E
	brk $FC.b		; 00 FC
	sbc $00040A.l,X		; FF 0A 04 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $7C.b,S		; 03 7C
	adc $7FFF.w,X		; 7D FF 7F
	adc $FE1F80.l,X		; 7F 80 1F FE
	rol $27F7.w,X		; 3E F7 27
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	bra   0.b		; 80 00
	sbc $0EFF00.l,X		; FF 00 FF 0E
	sbc $1FFF1E.l,X		; FF 1E FF 1F
	brk $00.b		; 00 00
	sbc $7F64FF.l,X		; FF FF 64 7F
	sbc $17FFFF.l,X		; FF FF FF 17
	sbc $FC1310.l,X		; FF 10 13 FC
	sed		; F8
	sbc $050000.l,X		; FF 00 00 05
	brk $BB.b		; 00 BB
	pld		; 2B
	bpl   0.b		; 10 00
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0CFFF9.l,X		; FF F9 FF 0C
	sbc $FFEF9E.l,X		; FF 9E EF FF
	sbc $FD1DFF.l,X		; FF FF 1D FD
	ora $F71B.w,Y		; 19 1B F7
	brk $00.b		; 00 00
	sbc [$07.b],Y		; F7 07
	plx		; FA
	sbc ($FC.b,S),Y		; F3 FC
	ora $0008.w,Y		; 19 08 00
	sbc ($00.b,S),Y		; F3 00
	sbc $03.b,X		; F5 03
	sbc $F0F003.l,X		; FF 03 F0 F0
	asl $01FE.w		; 0E FE 01
	ora $00.b,S		; 03 00
	sbc $FFF7FF.l,X		; FF FF F7 FF
	cmp $ECFF.w,Y		; D9 FF EC
	cmp $00004F.l,X		; DF 4F 00 00
	beq -16.b		; F0 F0
	cop $02.b		; 02 02
	sbc $0008FF.l,X		; FF FF 08 00
	inc $00.b		; E6 00
	sbc ($C0.b,S),Y		; F3 C0
	bne -32.b		; D0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rts		; 60

	cpx #$F8.b		; E0 F8
	cld		; D8
	inc $EFF6.w,X		; FE F6 EF
	jmp ($FFFF.w,X)		; 7C FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	jsr $0800.w		; 20 00 08
	brk $93.b		; 00 93
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
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
	brk $BC.b		; 00 BC
	sbc $FC9FCC.l		; EF CC 9F FC
	jmp.w [$7878]		; DC 78 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFFFC.l,X		; FF FC FF FC
	jsr ($78FC.w,X)		; FC FC 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF00FF.l,X		; 1F FF 00 FF
	ora $07070F.l		; 0F 0F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $07070F.l		; 0F 0F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $0AFA.w		; CD FA 0A
	sbc $0D888D.l,X		; FF 8D 88 0D
	ora $000707.l		; 0F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $8F0FFF.l		; 0F FF 0F 8F
	sta $070F0F.l		; 8F 0F 0F 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpx #$B0.b		; E0 B0
	pea $FF9F.w		; F4 9F FF
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $8BF480.l,X		; FF 80 F4 8B
	sbc $E0E080.l,X		; FF 80 E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	jsr ($E0FC.w,X)		; FC FC E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	asl $FC.b		; 06 FC
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $E2.b		; 00 E2
	asl $00EF.w,X		; 1E EF 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	sbc ($FF.b)		; F2 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	plx		; FA
	sbc $000401.l,X		; FF 01 04 00
	brk $EA.b		; 00 EA
	sbc $02FFF1.l,X		; FF F1 FF 02
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $03FFF9.l,X		; FF F9 FF 03
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $04FFEF.l,X		; FF EF FF 04
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $05FFF7.l,X		; FF F7 FF 05
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $06FFEF.l,X		; FF EF FF 06
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $07FFF7.l,X		; FF F7 FF 07
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $EF.b		; 00 EF
	sbc $000408.l,X		; FF 08 04 00
	brk $02.b		; 00 02
	brk $F7.b		; 00 F7
	sbc $000409.l,X		; FF 09 04 00
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	sbc $00040A.l,X		; FF 0A 04 00
	brk $0A.b		; 00 0A
	brk $F0.b		; 00 F0
	sbc $00040B.l,X		; FF 0B 04 00
	brk $0A.b		; 00 0A
	brk $F8.b		; 00 F8
	sbc $00040C.l,X		; FF 0C 04 00
	brk $12.b		; 00 12
	brk $F2.b		; 00 F2
	sbc $00040D.l,X		; FF 0D 04 00
	brk $12.b		; 00 12
	brk $FA.b		; 00 FA
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1A.b		; 00 1A
	brk $F6.b		; 00 F6
	sbc $00040F.l,X		; FF 0F 04 00
	brk $00.b		; 00 00
	and $7FC738.l,X		; 3F 38 C7 7F
	bra  32.b		; 80 20
	cmp $88FF07.l,X		; DF 07 FF 88
	sbc $FA16.w,X		; FD 16 FA
	ora $000075.l,X		; 1F 75 00 00
	clv		; B8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora $7F1FFF.l		; 0F FF 1F 7F
	ora $191E12.l,X		; 1F 12 1E 19
	ora $17.b,X		; 15 17
	trb $0F08.w		; 1C 08 0F
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	eor ($FF.b,X)		; 41 FF
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	and $F807C0.l,X		; 3F C0 07 F8
	bra  -1.b		; 80 FF
	rti		; 40

	sbc $71001C.l,X		; FF 1C 00 71
	jsr $0000.w		; 20 00 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	rti		; 40

	cpy #$62.b		; C0 62
	sbc $60FF62.l,X		; FF 62 FF 60
	sbc $F0F8F8.l,X		; FF F8 F8 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $FFE2FF.l,X		; FF FF E2 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	cpx #$F8.b		; E0 F8
	sed		; F8
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $FF.b		; 00 FF
	rti		; 40

	inc $FF00.w,X		; FE 00 FF
	brk $DF.b		; 00 DF
	brk $BF.b		; 00 BF
	ldx $BF01.w,Y		; BE 01 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7A.b		; 00 7A
	dec A		; 3A
	sbc [$F7.b],Y		; F7 F7
	ora ($20.b,X)		; 01 20
	brk $40.b		; 00 40
	ldx $BF40.w,Y		; BE 40 BF
	rti		; 40

	ora $BF00B0.l		; 0F B0 00 BF
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	lda $40BF40.l,X		; BF 40 BF 40
	ora [$F8.b]		; 07 F8
	sed		; F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	ora $01.b,S		; 03 01
	ora ($FF.b,X)		; 01 FF
	sbc $02FF06.l,X		; FF 06 FF 02
	ora $0FFF01.l,X		; 1F 01 FF 0F
	sbc $00FF0F.l,X		; FF 0F FF 00
	sbc $000EF0.l,X		; FF F0 0E 00
	brk $01.b		; 00 01
	ora ($1C.b,X)		; 01 1C
	trb $FEFE.w		; 1C FE FE
	sbc $0F0F0F.l,X		; FF 0F 0F 0F
	brk $00.b		; 00 00
	beq   1.b		; F0 01
	jsr ($1D00.w,X)		; FC 00 1D
	cpx #$0A.b		; E0 0A
	sbc ($01.b),Y		; F1 01
	cop $00.b		; 02 00
	inc $FF00.w,X		; FE 00 FF
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	sbc $FD02.w,X		; FD 02 FD
	cop $FB.b		; 02 FB
	tsb $03.b		; 04 03
	jsr ($00FF.w,X)		; FC FF 00
	sbc $F0F000.l,X		; FF 00 F0 F0
	cpx #$E0.b		; E0 E0
	sbc $FF38FF.l,X		; FF FF 38 FF
	clc		; 18
	sed		; F8
	jsr $43F8.w		; 20 F8 43
	lda $38FF8F.l,X		; BF 8F FF 38
	eor $5C.b		; 45 5C
	tsa		; 3B
	brk $00.b		; 00 00
	sbc $F8F8FF.l,X		; FF FF F8 F8
	rts		; 60

	sei		; 78
	cmp [$9F.b]		; C7 9F
	bra -128.b		; 80 80
	and $FD82.w,Y		; 39 82 FD
	brk $FE.b		; 00 FE
	adc $E441.w,X		; 7D 41 E4
	phx		; DA
	cmp ($B7.b,S),Y		; D3 B7
	cmp $A9FB.w		; CD FB A9
	sbc [$95.b]		; E7 95
	ora $5B53.w,Y		; 19 53 5B
	adc [$FE.b]		; 67 FE
	sec		; 38
	sbc $FF7E.w,X		; FD 7E FF
	ror $7EFF.w,X		; 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	adc $7F7F7E.l,X		; 7F 7E 7F 7F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	trb $033C.w		; 1C 3C 03
	ora [$0F.b]		; 07 0F
	inc $FF20.w,X		; FE 20 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr $0420.w		; 20 20 04
	tsb $FF.b		; 04 FF
	inc $C0.b,X		; F6 C0
	brk $30.b		; 00 30
	brk $4C.b		; 00 4C
	brk $23.b		; 00 23
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sed		; F8
	sbc [$E7.b]		; E7 E7
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	ora $000000.l,X		; 1F 00 00 00
	cmp [$01.b]		; C7 01
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $FFFF00.l,X		; FF 00 FF FF
	cpy #$C0.b		; C0 C0
	rts		; 60

	rts		; 60

	beq -16.b		; F0 F0
	tsb $03FC.w		; 0C FC 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	sbc $006060.l,X		; FF 60 60 00
	brk $30.b		; 00 30
	brk $0C.b		; 00 0C
	brk $03.b		; 00 03
	brk $18.b		; 00 18
	clc		; 18
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	brk $FF.b		; 00 FF
	sbc $3C3CFF.l,X		; FF FF 3C 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00FF80.l,X		; 7F 80 FF 00
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $3C3CFF.l,X		; FF FF 3C 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	cpx #$10.b		; E0 10
	cpx #$00.b		; E0 00
	sed		; F8
	ldy #$80.b		; A0 80
	sei		; 78
	brk $E8.b		; 00 E8
	iny		; C8
	beq -16.b		; F0 F0
	rti		; 40

	cpy #$80.b		; C0 80
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $68.b		; 00 68
	bmi  -8.b		; 30 F8
	brk $E8.b		; 00 E8
	bmi -16.b		; 30 F0
	brk $C0.b		; 00 C0
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $DA.b		; 00 DA
	plp		; 28
	xba		; EB
	brk $DA.b		; 00 DA
	sbc $00FFEC.l,X		; FF EC FF 00
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $02FFFC.l,X		; FF FC FF 02
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $04FFEB.l,X		; FF EB FF 04
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $06FFFB.l,X		; FF FB FF 06
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $08FFEB.l,X		; FF EB FF 08
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0AFFFB.l,X		; FF FB FF 0A
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $EB.b		; 00 EB
	sbc $00040C.l,X		; FF 0C 04 00
	brk $0A.b		; 00 0A
	brk $FB.b		; 00 FB
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1A.b		; 00 1A
	brk $F0.b		; 00 F0
	sbc $000420.l,X		; FF 20 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3E7F00.l,X		; 3F 00 7F 3E
	cmp ($7F.b,X)		; C1 7F
	bra 112.b		; 80 70
	sta $00FD05.l		; 8F 05 FD 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	adc $00FF0C.l,X		; 7F 0C FF 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	ora ($FF.b,X)		; 01 FF
	brk $0F.b		; 00 0F
	bvs   0.b		; 70 00
	brk $01.b		; 00 01
	brk $1E.b		; 00 1E
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $7F.b		; 00 7F
	bra   5.b		; 80 05
	tsb $07.b		; 04 07
	asl $03.b		; 06 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	and $FC7E3E.l,X		; 3F 3E 7E FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FEFEFF.l,X		; FF FF FE FE
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $1C3F0E.l		; CF 0E 3F 1C
	sbc $00FC04.l,X		; FF 04 FC 00
	xce		; FB
	brk $FB.b		; 00 FB
	xce		; FB
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $CF.b		; 00 CF
	asl $1F.b		; 06 1F
	tsb $0201.w		; 0C 01 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	xce		; FB
	tsb $00.b		; 04 00
	adc $08FB07.l,X		; 7F 07 FB 08
	pea $EF10.w		; F4 10 EF
	and ($5F.b,X)		; 21 5F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$00.b]		; 07 00
	brk $37.b		; 00 37
	bpl -20.b		; 10 EC
	stz $DF.b		; 64 DF
	cmp $001EBF.l		; CF BF 1E 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	sbc $0F0F00.l,X		; FF 00 0F 0F
	ora $000707.l		; 0F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	ora $000707.l		; 0F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $02F7F8.l,X		; FF F8 F7 02
	and $FE01.w,X		; 3D 01 FE
	asl $3FFF.w,X		; 1E FF 3F
	cmp $00E01F.l,X		; DF 1F E0 00
	sbc $F80000.l,X		; FF 00 00 F8
	brk $3E.b		; 00 3E
	bit $FEFF.w,X		; 3C FF FE
	sbc $1F3F1F.l,X		; FF 1F 3F 1F
	ora $000000.l,X		; 1F 00 00 00
	and $FF0EFF.l,X		; 3F FF 0E FF
	asl $FF.b		; 06 FF
	tsb $FE.b		; 04 FE
	.db $42, $BD		; 42 BD
	clv		; B8
	cmp [$80.b]		; C7 80
	lda $001FA0.l,X		; BF A0 1F 00
	brk $FF.b		; 00 FF
	sbc $3C7F7F.l,X		; FF 7F 7F 3C
	rol $8FCB.w,X		; 3E CB 8F
	sbc $C080C7.l,X		; FF C7 80 C0
	ldy #$40.b		; A0 40
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $E9.b		; A4 E9
	and $35B5.w		; 2D B5 35
	and ($32.b)		; 32 32
	and $1F1F.w,Y		; 39 1F 1F
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	sbc $7FBA3F.l,X		; FF 3F BA 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	brk $08.b		; 00 08
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	bit $00FF.w,X		; 3C FF 00
	sbc $00FF10.l,X		; FF 10 FF 00
	lda $0F0038.l,X		; BF 38 00 0F
	php		; 08
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	sbc $E0FFFF.l,X		; FF FF FF E0
	tsb $2300.w		; 0C 00 23
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$27.b]		; 07 27
	sbc [$F8.b]		; E7 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	and $F8FF27.l,X		; 3F 27 FF F8
	sbc $0000.w,Y		; F9 00 00
	brk $00.b		; 00 00
	brk $7D.b		; 00 7D
	adc $67.b,S		; 63 67
	sed		; F8
	cpx #$FF.b		; E0 FF
	inc $FCFE.w,X		; FE FE FC
	jsr ($F0F0.w,X)		; FC F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FEFEC0.l,X		; FF C0 FE FE
	jsr ($F0FC.w,X)		; FC FC F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	sbc [$FF.b]		; E7 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $E495FE.l		; 0F FE 95 E4
	ora $493BE9.l,X		; 1F E9 3B 49
	inc A		; 1A
	plp		; 28
	php		; 08
	phd		; 0B
	asl A		; 0A
	php		; 08
	ora $07FF08.l		; 0F 08 FF 07
	sbc [$0F.b],Y		; F7 0F
	sbc $0F7F0F.l,X		; FF 0F 7F 0F
	and $0F0F0F.l,X		; 3F 0F 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	rts		; 60

	adc $283FB0.l,X		; 7F B0 3F 28
	eor $180050.l,X		; 5F 50 00 18
	ora $180F58.l		; 0F 58 0F 18
	eor $FF1B6C.l		; 4F 6C 1B FF
	cpy #$FF.b		; C0 FF
	beq  -1.b		; F0 FF
	beq -16.b		; F0 F0
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	brk $03.b		; 00 03
	sed		; F8
	brk $FB.b		; 00 FB
	brk $FD.b		; 00 FD
	brk $01.b		; 00 01
	rol $70C0.w,X		; 3E C0 70
	lda $FBD73F.l		; AF 3F D7 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FD.b		; 04 FD
	cop $01.b		; 02 01
	inc $01FE.w,X		; FE FE 01
	sbc $10FF20.l,X		; FF 20 FF 10
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FF00E0.l,X		; 1F E0 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	rol $0CF2.w,X		; 3E F2 0C
	sbc $3D04.w,Y		; F9 04 3D
	cpy #$0A.b		; C0 0A
	sbc ($00.b),Y		; F1 00
	tsa		; 3B
	brk $C3.b		; 00 C3
	brk $FF.b		; 00 FF
	cmp ($00.b,X)		; C1 00
	sbc ($01.b)		; F2 01
	sbc $FD02.w,Y		; F9 02 FD
	cop $FB.b		; 02 FB
	tsb $3B.b		; 04 3B
	cpy $C3.b		; C4 C3
	bit $00FF.w,X		; 3C FF 00
	ror $E603.w,X		; 7E 03 E6
	asl $DF.b,X		; 16 DF
	and $755990.l,X		; 3F 90 59 75
	beq 111.b		; F0 6F
	sbc [$68.b],Y		; F7 68
	cpx #$64.b		; E0 64
	nop		; EA
	jmp ($F680.w,X)		; 7C 80 F6
	ora $DF1FFF.l		; 0F FF 1F DF
	and $FD3FFF.l,X		; 3F FF 3F FD
	and $FF3FFF.l,X		; 3F FF 3F FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $C09FB0.l,X		; FF B0 9F C0
	sbc $61FE61.l,X		; FF 61 FE 61
	ror $7F7F.w,X		; 7E 7F 7F
	jsr $8700.w		; 20 00 87
	brk $C1.b		; 00 C1
	bra -96.b		; 80 A0
	cpy #$E0.b		; C0 E0
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$00.b		; C0 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40C45C.l,X		; FF 5C C4 40
	cpy #$1E.b		; C0 1E
	sbc $F000C0.l,X		; FF C0 00 F0
	brk $1C.b		; 00 1C
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	clc		; 18
	and $00FF00.l,X		; 3F 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -12.b		; 80 F4
	jsr $08FF.w		; 20 FF 08
	sbc $20FF02.l,X		; FF 02 FF 20
	cmp $00FF00.l,X		; DF 00 FF 00
	sbc $700080.l,X		; FF 80 00 70
	php		; 08
	clc		; 18
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $38.b		; 00 38
	sec		; 38
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	sty $F8.b		; 84 F8
	asl $F0.b		; 06 F0
	dec A		; 3A
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	jmp $FE00.w		; 4C 00 FE
	brk $CE.b		; 00 CE
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $F8FF07.l,X		; FF 07 FF F8
	sbc $FEF800.l,X		; FF 00 F8 FE
	inc $7C7C.w,X		; FE 7C 7C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $07F800.l,X		; FF 00 F8 07
	inc $7CFE.w,X		; FE FE 7C
	jmp ($0006.w,X)		; 7C 06 00
	sec		; 38
	jsr ($CC30.w,X)		; FC 30 CC
	beq  -4.b		; F0 FC
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FC00.w,X		; FE 00 FC
	brk $FC.b		; 00 FC
	bmi  -4.b		; 30 FC
	brk $F8.b		; 00 F8
	tsb $00.b		; 04 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $D1.b		; 00 D1
	and ($E6.b)		; 32 E6
	ora ($D1.b,X)		; 01 D1
	sbc $00FFE6.l,X		; FF E6 FF 00
	tsb $00.b		; 04 00
	brk $E1.b		; 00 E1
	sbc $02FFE6.l,X		; FF E6 FF 02
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $04FFE6.l,X		; FF E6 FF 04
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $E6.b		; 00 E6
	sbc $000406.l,X		; FF 06 04 00
	brk $11.b		; 00 11
	brk $E6.b		; 00 E6
	sbc $000408.l,X		; FF 08 04 00
	brk $21.b		; 00 21
	brk $E6.b		; 00 E6
	sbc $00040A.l,X		; FF 0A 04 00
	brk $31.b		; 00 31
	brk $E6.b		; 00 E6
	sbc $00040C.l,X		; FF 0C 04 00
	brk $D3.b		; 00 D3
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $20FFF6.l,X		; FF F6 FF 20
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $22FFF6.l,X		; FF F6 FF 22
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F6.b		; 00 F6
	sbc $000424.l,X		; FF 24 04 00
	brk $13.b		; 00 13
	brk $F6.b		; 00 F6
	sbc $000426.l,X		; FF 26 04 00
	brk $23.b		; 00 23
	brk $F6.b		; 00 F6
	sbc $000428.l,X		; FF 28 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FFFFC0.l,X		; 1F C0 FF FF
	cpx #$7F.b		; E0 7F
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $07.b,S		; 03 07
	sbc $00FB03.l,X		; FF 03 FB 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $07.b,S		; 03 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	cmp $80.b,S		; C3 80
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	brk $FC.b		; 00 FC
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora $247F0B.l		; 0F 0B 7F 24
	sbc $00FF88.l,X		; FF 88 FF 00
	sta $00.b,S		; 83 00
	sbc $00DF00.l		; EF 00 DF 00
	brk $F1.b		; 00 F1
	brk $8F.b		; 00 8F
	php		; 08
	and $86FE23.l,X		; 3F 23 FE 86
	stz $08.b,X		; 74 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	sbc $FFCFFF.l,X		; FF FF CF FF
	bpl  -8.b		; 10 F8
	brk $F8.b		; 00 F8
	rti		; 40

	sbc $03FF83.l,X		; FF 83 FF 03
	sbc [$00.b]		; E7 00
	sbc $CF0000.l,X		; FF 00 00 CF
	brk $98.b		; 00 98
	dey		; 88
	sec		; 38
	sec		; 38
	adc $7CFF3F.l,X		; 7F 3F FF 7C
	ora $000004.l,X		; 1F 04 00 00
	sbc $F9FEFF.l,X		; FF FF FE F9
	ora ($0E.b,X)		; 01 0E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	inc $0F00.w,X		; FE 00 0F
	asl $FFFF.w		; 0E FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $010F0F.l,X		; FF 0F 0F 01
	dec $03C1.w		; CE C1 03
	sbc $81FF03.l,X		; FF 03 FF 81
	adc $21BF41.l,X		; 7F 41 BF 21
	cmp $F0EE90.l,X		; DF 90 EE F0
	sbc $7F003F.l,X		; FF 3F 00 7F
	adc $9F3F3F.l,X		; 7F 3F 3F 9F
	ora $E78FCF.l,X		; 1F CF 8F E7
	cmp [$F1.b]		; C7 F1
	cpx #$F0.b		; E0 F0
	beq  56.b		; F0 38
	sed		; F8
	cmp $F0C0F0.l		; CF F0 C0 F0
	cpy #$E0.b		; C0 E0
	bra -32.b		; 80 E0
	eor ($FF.b,X)		; 41 FF
	ora $807FFF.l		; 0F FF 7F 80
	sbc $FFFF00.l,X		; FF 00 FF FF
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	ldy #$E0.b		; A0 E0
	adc $FF3FFF.l,X		; 7F FF 3F FF
	adc $000000.l,X		; 7F 00 00 00
	brk $80.b		; 00 80
	rts		; 60

	bpl  12.b		; 10 0C
	cop $01.b		; 02 01
	brk $C3.b		; 00 C3
	sbc $FCFC03.l,X		; FF 03 FC FC
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	bra 126.b		; 80 7E
	bvs  15.b		; 70 0F
	asl $0101.w		; 0E 01 01
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $4F8F0F.l		; 0F 0F 8F 4F
	sta $C0F0F0.l		; 8F F0 F0 C0
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $CFFF0F.l		; CF 0F FF CF
	sbc $C0FFF0.l,X		; FF F0 FF C0
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0800.w		; 20 00 08
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $88.b		; 00 88
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora ($39.b)		; 12 39
	ora ($19.b,S),Y		; 13 19
	ora ($11.b,S),Y		; 13 11
	inc A		; 1A
	inc A		; 1A
	ora $0C09.w,Y		; 19 09 0C
	asl $060C.w		; 0E 0C 06
	ora [$FF.b]		; 07 FF
	ora $1F1F3F.l,X		; 1F 3F 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $0F0F0F.l,X		; 1F 0F 0F 0F
	ora $0C0707.l		; 0F 07 07 0C
	ora [$4C.b]		; 07 4C
	eor [$2C.b]		; 47 2C
	ora [$0C.b]		; 07 0C
	and [$2C.b]		; 27 2C
	and $5FDFAC.l		; 2F AC DF 5F
	and $FF7F3B.l,X		; 3F 3B 7F FF
	jsr ($FCBF.w,X)		; FC BF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	cmp $FCFFFC.l,X		; DF FC FF FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $837C80.l,X		; 7F 80 7C 83
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	ora $FF.b,S		; 03 FF
	ora $FA.b,S		; 03 FA
	tsb $FF76.w		; 0C 76 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	ora $FF.b,S		; 03 FF
	ora $FB.b,S		; 03 FB
	ora [$7F.b]		; 07 7F
	ora [$FF.b]		; 07 FF
	brk $07.b		; 00 07
	sed		; F8
	adc ($76.b),Y		; 71 76
	sed		; F8
	xce		; FB
	sty $368D.w		; 8C 8D 36
	ora [$86.b]		; 07 86
	lsr A		; 4A
	txa		; 8A
	.db $42, $FF		; 42 FF
	brk $FF.b		; 00 FF
	brk $77.b		; 00 77
	sed		; F8
	xce		; FB
	jsr ($FEFD.w,X)		; FC FD FE
	sbc $FFFEFE.l,X		; FF FE FE FF
	inc $FFFF.w,X		; FE FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFF007.l,X		; FF 07 F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $0F.b		; 00 0F
	cpx #$00.b		; E0 00
	sbc $F7EF00.l		; EF 00 EF F7
	brk $DF.b		; 00 DF
	jsr $20DF.w		; 20 DF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	sbc $10EF10.l		; EF 10 EF 10
	sbc $08F710.l		; EF 10 F7 08
	brk $FF.b		; 00 FF
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	sbc $003FC0.l,X		; FF C0 3F 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
	cpy #$06.b		; C0 06
	sed		; F8
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $FE01.w,X		; FE 01 FE
	ora ($00.b,X)		; 01 00
	sbc $00C700.l		; EF 00 C7 00
	bra  29.b		; 80 1D
	ora $37.b,S		; 03 37
	ora $E70BFB.l		; 0F FB 0B E7
	asl $9E.b,X		; 16 9E
	jmp ($1080.w,X)		; 7C 80 10
	plp		; 28
	bpl  95.b		; 10 5F
	jsr $40BF.w		; 20 BF 40
	adc $07FB83.l,X		; 7F 83 FB 07
	sbc [$0F.b],Y		; F7 0F
	sbc $F9000F.l,X		; FF 0F 00 F9
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpx #$DF.b		; E0 DF
	sed		; F8
	sbc [$EC.b],Y		; F7 EC
	sbc $A41E0D.l		; EF 0D 1E A4
	tsb $0608.w		; 0C 08 06
	asl $00.b		; 06 00
	cmp ($00.b,X)		; C1 00
	cpx #$00.b		; E0 00
	sed		; F8
	cpx #$E8.b		; E0 E8
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $00FE.w,X		; FD FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $80EF00.l,X		; DF 00 EF 80
	beq   0.b		; F0 00
	sbc $0C0030.l,X		; FF 30 00 0C
	brk $02.b		; 00 02
	brk $3F.b		; 00 3F
	brk $30.b		; 00 30
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	ora $00.b,S		; 03 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cpx $FF00.w		; EC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	.db $62, $10, $18		; 62 10 18
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $30.b		; 00 30
	bmi  31.b		; 30 1F
	clc		; 18
	sed		; F8
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra  16.b		; 80 10
	cpx #$04.b		; E0 04
	sed		; F8
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	php		; 08
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $10.b		; 00 10
	brk $FC.b		; 00 FC
	brk $45.b		; 00 45
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

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
	brk $07.b		; 00 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	cmp $1CE31C.l,X		; DF 1C E3 1C
	sbc $03F10E.l		; EF 0E F1 03
	sbc $C0FF00.l,X		; FF 00 FF C0
	cpy #$80.b		; C0 80
	bra  -1.b		; 80 FF
	clc		; 18
	sbc $0CFF00.l,X		; FF 00 FF 0C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0C000.l,X		; FF 00 C0 C0
	bra -128.b		; 80 80
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $1FE020.l,X		; DF 20 E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF7F7F.l,X		; FF 7F 7F FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $007F7F.l,X		; FF 7F 7F 00
	xce		; FB
	brk $7B.b		; 00 7B
	brk $87.b		; 00 87
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	xce		; FB
	tsb $7B.b		; 04 7B
	sty $87.b		; 84 87
	sei		; 78
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	cpy #$C0.b		; C0 C0
	ror $F2.b,X		; 76 F2
	ror A		; 6A
	inc $68.b,X		; F6 68
	cpx $73.b		; E4 73
	sbc $EA.b		; E5 EA
	cpx $28.b		; E4 28
	pea $3432.w		; F4 32 34
	sec		; 38
	and ($FF.b,S),Y		; 33 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFE.l,X		; 3F FE 3F FF
	and $3F3FFF.l,X		; 3F FF 3F 3F
	and $303F3F.l,X		; 3F 3F 3F 30
	ora [$C8.b],Y		; 17 C8
	eor $8F1F48.l,X		; 5F 48 1F 8F
	ora $CB5B4C.l,X		; 1F 4C 5B CB
	jmp $981F38.l		; 5C 38 1F 98
	and $FFF8F7.l,X		; 3F F7 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	jsr $20C8.w		; 20 C8 20
	iny		; C8
	jsr $F0C8.w		; 20 C8 F0
	sbc $FDF0.w,X		; FD F0 FD
	sbc $CF301F.l		; EF 1F 30 CF
	bpl -17.b		; 10 EF
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	sbc $FD02.w,X		; FD 02 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	ora [$E0.b]		; 07 E0
	ora $00FFFF.l		; 0F FF FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq   7.b		; F0 07
	sed		; F8
	sbc $F8E700.l,X		; FF 00 E7 F8
	sbc $00FFF0.l		; EF F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	beq -16.b		; F0 F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FF000.l,X		; FF 00 F0 0F
	jsr $FF00.w		; 20 00 FF
	brk $60.b		; 00 60
	stx $60.b		; 86 60
	sty $FCFC.w		; 8C FC FC
	brk $FE.b		; 00 FE
	ror $00FE.w,X		; 7E FE 00
	brk $C7.b		; 00 C7
	sec		; 38
	sbc $78E600.l,X		; FF 00 E6 78
	cpx $FC70.w		; EC 70 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	brk $3F.b		; 00 3F
	and $000E0E.l,X		; 3F 0E 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $000E0E.l,X		; 3F 0E 0E 00
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
	brk $1D.b		; 00 1D
	clc		; 18
	asl $070C.w		; 0E 0C 07
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $070F0F.l,X		; 1F 0F 0F 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	adc $DF7FF7.l,X		; 7F F7 7F DF
	sbc $00F838.l,X		; FF 38 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00F8F8.l,X		; FF F8 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($F8F8.w,X)		; FC F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -128.b		; 10 80
	rti		; 40

	brk $C8.b		; 00 C8
	dec A		; 3A
	sbc ($01.b,X)		; E1 01
	iny		; C8
	sbc $00FFE4.l,X		; FF E4 FF 00
	tsb $00.b		; 04 00
	brk $C8.b		; 00 C8
	sbc $02FFF4.l,X		; FF F4 FF 02
	tsb $00.b		; 04 00
	brk $D8.b		; 00 D8
	sbc $04FFE2.l,X		; FF E2 FF 04
	tsb $00.b		; 04 00
	brk $D8.b		; 00 D8
	sbc $06FFF2.l,X		; FF F2 FF 06
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $08FFE1.l,X		; FF E1 FF 08
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $0EFFF1.l,X		; FF F1 FF 0E
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $E1.b		; 00 E1
	sbc $000420.l,X		; FF 20 04 00
	brk $08.b		; 00 08
	brk $F1.b		; 00 F1
	sbc $000422.l,X		; FF 22 04 00
	brk $08.b		; 00 08
	brk $01.b		; 00 01
	brk $24.b		; 00 24
	tsb $00.b		; 04 00
	brk $18.b		; 00 18
	brk $E3.b		; 00 E3
	sbc $000426.l,X		; FF 26 04 00
	brk $18.b		; 00 18
	brk $F3.b		; 00 F3
	sbc $000428.l,X		; FF 28 04 00
	brk $28.b		; 00 28
	brk $E8.b		; 00 E8
	sbc $00042A.l,X		; FF 2A 04 00
	brk $28.b		; 00 28
	brk $F8.b		; 00 F8
	sbc $00042C.l,X		; FF 2C 04 00
	brk $38.b		; 00 38
	brk $F0.b		; 00 F0
	sbc $00042E.l,X		; FF 2E 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3CFF00.l,X		; 1F 00 FF 3C
	cmp $3F.b,S		; C3 3F
	cpy #$3F.b		; C0 3F
	cpy #$7F.b		; C0 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	ror $FF00.w,X		; 7E 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tsa		; 3B
	asl $1F.b		; 06 1F
	cop $07.b		; 02 07
	asl $07.b		; 06 07
	asl $06.b		; 06 06
	ora [$03.b]		; 07 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $3F.b,S		; 03 3F
	ora $1F.b,S		; 03 1F
	ora $07.b,S		; 03 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $40.b,S		; 03 40
	brk $6C.b		; 00 6C
	bit $3C.b		; 24 3C
	stz $34.b		; 64 34
	.db $62, $60, $02		; 62 60 02
	sbc [$00.b],Y		; F7 00
	rol $89.b,X		; 36 89
	sta $FF81.w,X		; 9D 81 FF
	sbc $FFFFDF.l,X		; FF DF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	ora $FCF00F.l		; 0F 0F F0 FC
	sbc ($F0.b),Y		; F1 F0
	adc [$00.b]		; 67 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	rts		; 60

	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $04.b,S		; 03 04
	ora [$03.b]		; 07 03
	adc $0FFF07.l,X		; 7F 07 FF 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	brk $F8.b		; 00 F8
	brk $83.b		; 00 83
	brk $07.b		; 00 07
	ora ($0F.b,X)		; 01 0F
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($40.b,X)		; 01 40
	sbc $C1FF40.l,X		; FF 40 FF C1
	ror $5EC1.w,X		; 7E C1 5E
	cpx #$7F.b		; E0 7F
	cpx #$7F.b		; E0 7F
	cpx #$7F.b		; E0 7F
	cpx #$FF.b		; E0 FF
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $E0DFC0.l,X		; FF C0 DF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	brk $FF.b		; 00 FF
	sbc $FFF000.l,X		; FF 00 F0 FF
	sbc $7FF870.l,X		; FF 70 F8 7F
	adc $FF1FB8.l,X		; 7F B8 1F FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20FF70.l,X		; FF 70 FF 20
	sbc $10FF18.l,X		; FF 18 FF 10
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	brk $FF.b		; 00 FF
	dec $FF.b		; C6 FF
	cld		; D8
	sbc $61FFB0.l,X		; FF B0 FF 61
	sbc $00BF00.l,X		; FF 00 BF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $C7.b		; 00 C7
	ora ($DE.b,X)		; 01 DE
	lsr $BC.b		; 46 BC
	sty $1879.w		; 8C 79 18
	ora $43.b,S		; 03 43
	brk $80.b		; 00 80
	sbc $FF00FF.l,X		; FF FF 00 FF
	and $E000FF.l,X		; 3F FF 00 E0
	brk $E1.b		; 00 E1
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $606000.l,X		; 3F 00 60 60
	sbc ($E1.b,X)		; E1 E1
	sbc $F8FFFF.l,X		; FF FF FF F8
	ora $7F0018.l,X		; 1F 18 00 7F
	brk $BF.b		; 00 BF
	bcs  15.b		; B0 0F
	ora $00C0B0.l		; 0F B0 C0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $7FFF.w,X		; FE FF 7F
	bra -65.b		; 80 BF
	rti		; 40

	lda $40BF40.l,X		; BF 40 BF 40
	cpy #$3F.b		; C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F80700.l,X		; FF 00 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($0303.w,X)		; FC 03 03
	tsb $F000.w		; 0C 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $0FF0F0.l		; 0F F0 F0 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	pea $01FF.w		; F4 FF 01
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $1BFF1F.l,X		; FF 1F FF 1B
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	php		; 08
	rol $FF3E.w,X		; 3E 3E FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $831FFF.l,X		; 1F FF 1F 83
	bra   0.b		; 80 00
	adc $00BF00.l,X		; 7F 00 BF 00
	sbc $10FB40.l		; EF 40 FB 10
	inc $FF84.w,X		; FE 84 FF
	.db $82, $FF, $7F		; 82 FF 7F
	brk $FF.b		; 00 FF
	adc $1F3F7F.l,X		; 7F 7F 3F 1F
	ora $E18387.l		; 0F 87 83 E1
	cpx #$F8.b		; E0 F8
	sed		; F8
	jsr ($FFFC.w,X)		; FC FC FF
	brk $7E.b		; 00 7E
	bra  14.b		; 80 0E
	beq   0.b		; F0 00
	inc $3EC0.w,X		; FE C0 3E
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($01.b,X)		; 01 01
	inc $00FF.w,X		; FE FF 00
	sbc $0F7700.l,X		; FF 00 77 0F
	sbc [$0F.b],Y		; F7 0F
	dex		; CA
	tsa		; 3B
	ora #$FA.b		; 09 FA
	php		; 08
	plx		; FA
	asl A		; 0A
	sed		; F8
	asl A		; 0A
	sed		; F8
	asl A		; 0A
	sed		; F8
	adc $03FF83.l,X		; 7F 83 FF 03
	xce		; FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$7C.b]		; 07 7C
	sta $00.b,S		; 83 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF81.w,X		; FE 81 FF
	ora ($01.b,X)		; 01 01
	ora $FF.b,S		; 03 FF
	.db $62, $1F, $FF		; 62 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	ora ($01.b,X)		; 01 01
	sbc $7F03FF.l,X		; FF FF 03 7F
	ora $0F.b,S		; 03 0F
	beq  24.b		; F0 18
	stp		; DB
	bit $D33C.w,X		; 3C 3C D3
	sbc [$9D.b]		; E7 9D
	cmp ($36.b,X)		; C1 36
	sta ($D1.b,X)		; 81 D1
	and ($52.b)		; 32 52
	bmi  -1.b		; 30 FF
	brk $DB.b		; 00 DB
	bit $FF3C.w,X		; 3C 3C FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0101FF.l,X		; FF FF 01 01
	ora ($01.b,X)		; 01 01
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
	cmp $E3.b,X		; D5 E3
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  15.b		; F0 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $F80780.l,X		; 7F 80 07 F8
	brk $7F.b		; 00 7F
	bra -65.b		; 80 BF
	cpy #$C0.b		; C0 C0
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $C0BF80.l,X		; 7F 80 BF C0
	cpy #$FF.b		; C0 FF
	brk $FE.b		; 00 FE
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $DCFFF0.l,X		; FF F0 FF DC
	jsr ($FC9C.w,X)		; FC 9C FC
	sec		; 38
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFCF0.l,X		; FF F0 FC FC
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$C0.b		; C0 C0
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	adc $000000.l,X		; 7F 00 00 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0FF0.l,X		; FF F0 0F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3F7F7F.l,X		; FF 7F 7F 3F
	and $001F1F.l,X		; 3F 1F 1F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $1F3F3F.l,X		; 7F 3F 3F 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $1F.b		; 00 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE00.w,X		; FD 00 FE
	bra 127.b		; 80 7F
	cpx #$1F.b		; E0 1F
	beq  15.b		; F0 0F
	jsr ($7F00.w,X)		; FC 00 7F
	adc $030707.l,X		; 7F 07 07 03
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	inc $F710.w,X		; FE 10 F7
	brk $B7.b		; 00 B7
	brk $74.b		; 00 74
	brk $C0.b		; 00 C0
	ora $80.b,S		; 03 80
	ora $03.b		; 05 03
	ora $FD05.w,Y		; 19 05 FD
	jsr ($E8E0.w,X)		; FC E0 E8
	cpy #$08.b		; C0 08
	sta $08.b,S		; 83 08
	and $205F10.l		; 2F 10 5F 20
	lda $837D40.l,X		; BF 40 7D 83
	cpx #$FF.b		; E0 FF
	ora $FF00FF.l,X		; 1F FF 00 FF
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0F000.l,X		; FF 00 F0 F0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	sed		; F8
	sed		; F8
	plx		; FA
	trb $F6.b		; 14 F6
	asl $07.b		; 06 07
	cop $03.b		; 02 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	xce		; FB
	ora [$FB.b]		; 07 FB
	ora [$F7.b]		; 07 F7
	ora $030707.l		; 0F 07 07 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	inc $FEF0.w,X		; FE F0 FE
	sei		; 78
	jsr ($FC40.w,X)		; FC 40 FC
	rts		; 60

	sed		; F8
	bvc  47.b		; 50 2F
	and ($9F.b,X)		; 21 9F
	sbc $FEFE00.l,X		; FF 00 FE FE
	inc $FCFE.w,X		; FE FE FC
	jsr ($FCCC.w,X)		; FC CC FC
	inx		; E8
	sed		; F8
	cmp $3F6F7F.l,X		; DF 7F 6F 3F
	beq   0.b		; F0 00
	brk $30.b		; 00 30
	brk $0E.b		; 00 0E
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $E0FF.w,X		; 3C FF E0
	sbc $3E00F0.l,X		; FF F0 00 3E
	bmi  15.b		; 30 0F
	asl $0101.w		; 0E 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ldx $CE.b		; A6 CE
	ora $83.b		; 05 83
	adc $2001.w,X		; 7D 01 20
	adc $26.b		; 65 26
	adc [$83.b]		; 67 83
	brk $C3.b		; 00 C3
	.db $42, $E1		; 42 E1
	rti		; 40

	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFBD.l,X		; FF BD FF FF
	sbc $80BF00.l,X		; FF 00 BF 80
	cmp $C05F40.l,X		; DF 40 5F C0
	sbc $00BF80.l,X		; FF 80 BF 00
	lda $5FFF4F.l,X		; BF 4F FF 5F
	sbc $E000C0.l,X		; FF C0 00 E0
	brk $60.b		; 00 60
	bra  -1.b		; 80 FF
	bra -65.b		; 80 BF
	cpy #$BF.b		; C0 BF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$7F.b		; C0 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sec		; 38
	brk $07.b		; 00 07
	bit $07FF.w,X		; 3C FF 07
	inc $00E0.w,X		; FE E0 00
	brk $FF.b		; 00 FF
	cpy #$00.b		; C0 00
	sed		; F8
	cpy #$3F.b		; C0 3F
	sec		; 38
	ora [$07.b]		; 07 07
	sbc $E6FFFF.l,X		; FF FF FF E6
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $1E1E.w,X		; 1E 1E 1E
	asl $C03E.w,X		; 1E 3E C0
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $DE1E.w,X		; 1E 1E DE
	asl $C0FF.w,X		; 1E FF C0
	sbc $000600.l,X		; FF 00 06 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	sta ($30.b),Y		; 91 30
	sta ($30.b),Y		; 91 30
	bcc  48.b		; 90 30
	cmp $E7E0E0.l,X		; DF E0 E0 E7
	sta ($E6.b,X)		; 81 E6
	eor $0000BF.l,X		; 5F BF 00 00
	cmp $01CE01.l		; CF 01 CE 01
	cmp $00FF00.l		; CF 00 FF 00
	sbc [$18.b]		; E7 18
	sbc [$19.b]		; E7 19
	sbc $FF0000.l,X		; FF 00 00 FF
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	sbc $07E000.l,X		; FF 00 E0 07
	cpx #$0F.b		; E0 0F
	sbc $0000FF.l,X		; FF FF 00 00
	eor $F08FE0.l,X		; 5F E0 8F F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$F8.b]		; E7 F8
	sbc $00FFF0.l		; EF F0 FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bpl -20.b		; 10 EC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	bra   0.b		; 80 00
	jsr $8800.w		; 20 00 88
	bmi 114.b		; 30 72
	brk $18.b		; 00 18
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sed		; F8
	rti		; 40

	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	pea $8D00.w		; F4 00 8D
	brk $00.b		; 00 00
	sbc $E0FF1F.l,X		; FF 1F FF E0
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFC.l,X		; FF FC FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	jsr ($F00E.w,X)		; FC 0E F0
	inc $00FF.w,X		; FE FF 00
	sbc $C0FF3F.l,X		; FF 3F FF C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	and $008080.l,X		; 3F 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$20.b		; C0 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	rti		; 40

	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	jsr $E000.w		; 20 00 E0
	brk $60.b		; 00 60
	bra -32.b		; 80 E0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $780300.l		; 0F 00 03 78
	sbc ($74.b),Y		; F1 74
	stz $FC.b,X		; 74 FC
	sbc $00FF.w,X		; FD FF 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc ($00.b),Y		; F1 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $77.b		; 00 77
	sed		; F8
	sbc $F1FE.w,X		; FD FE F1
	asl $FF00.w		; 0E 00 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	sbc $000C00.l,X		; FF 00 0C 00
	ora $C0.b,S		; 03 C0
	cpy #$00.b		; C0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $80.b		; 00 80
	brk $E3.b		; 00 E3
	lsr $C3.b		; 46 C3
	asl $66.b		; 06 66
	and $7D.b		; 25 7D
	ora ($AB.b),Y		; 11 AB
	ora ($05.b),Y		; 11 05
	sta $FF.b,S		; 83 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DBFFFF.l,X		; FF FF FF DB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $59FFFF.l,X		; FF FF FF 59
	sbc [$4E.b]		; E7 4E
	sbc ($C3.b),Y		; F1 C3
	jsr ($FFC0.w,X)		; FC C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $F8FE.w,X		; FE FE F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and ($FF.b,X)		; 21 FF
	rti		; 40

	sbc $00FF3F.l,X		; FF 3F FF 00
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $0F.b		; 00 0F
	brk $BF.b		; 00 BF
	adc $FFFF00.l,X		; 7F 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000303.l,X		; FF 03 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000303.l,X		; FF 03 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	lda $00FFF8.l,X		; BF F8 FF 00
	sbc $00F800.l,X		; FF 00 F8 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $80.b		; 00 80
	adc $077070.l,X		; 7F 70 70 07
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	inc $E010.w,X		; FE 10 E0
	brk $FF.b		; 00 FF
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	sbc $F80600.l,X		; FF 00 06 F8
	adc $00FF00.l,X		; 7F 00 FF 00
	brk $00.b		; 00 00
	jsr ($FA07.w,X)		; FC 07 FA
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rti		; 40

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
	ora $80.b,X		; 15 80
	mvn $BF,$00		; 54 00 BF
	mvp $01,$DC		; 44 DC 01
	lda $FFE1FF.l,X		; BF FF E1 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	lda $FFF1FF.l,X		; BF FF F1 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	cmp $FFDEFF.l		; CF FF DE FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	cmp $FFEEFF.l		; CF FF EE FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	cmp $FFFEFF.l		; CF FF FE FF
	php		; 08
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $0AFFDC.l,X		; FF DC FF 0A
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $0CFFEC.l,X		; FF EC FF 0C
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0EFFDC.l,X		; FF DC FF 0E
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $20FFEC.l,X		; FF EC FF 20
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $22FFFC.l,X		; FF FC FF 22
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $24FFDC.l,X		; FF DC FF 24
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $26FFEC.l,X		; FF EC FF 26
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $28FFFC.l,X		; FF FC FF 28
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $DC.b		; 00 DC
	sbc $00042A.l,X		; FF 2A 04 00
	brk $0F.b		; 00 0F
	brk $EC.b		; 00 EC
	sbc $00042C.l,X		; FF 2C 04 00
	brk $0F.b		; 00 0F
	brk $FC.b		; 00 FC
	sbc $00042E.l,X		; FF 2E 04 00
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	sbc $000440.l,X		; FF 40 04 00
	brk $1F.b		; 00 1F
	brk $F0.b		; 00 F0
	sbc $000442.l,X		; FF 42 04 00
	brk $2F.b		; 00 2F
	brk $E4.b		; 00 E4
	sbc $000444.l,X		; FF 44 04 00
	brk $2F.b		; 00 2F
	brk $F4.b		; 00 F4
	sbc $000446.l,X		; FF 46 04 00
	brk $3F.b		; 00 3F
	brk $EC.b		; 00 EC
	sbc $000448.l,X		; FF 48 04 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	adc $10BF27.l,X		; 7F 27 BF 10
	bne  15.b		; D0 0F
	beq  31.b		; F0 1F
	cpx #$1F.b		; E0 1F
	cpx #$3F.b		; E0 3F
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $DFFFE0.l,X		; FF E0 FF DF
	ora $FF00F8.l,X		; 1F F8 00 FF
	brk $03.b		; 00 03
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $350B00.l,X		; FF 00 0B 35
	ora $0D0301.l		; 0F 01 03 0D
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $000300.l		; 0F 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $CC.b,X		; 94 CC
	bne -128.b		; D0 80
	cld		; D8
	dey		; 88
	cmp $CC99.w		; CD 99 CC
	tya		; 98
	tya		; 98
	cpy #$9C.b		; C0 9C
	cpy $FC.b		; C4 FC
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	adc $00FF3F.l,X		; 7F 3F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030000.l,X		; FF 00 00 03
	brk $FE.b		; 00 FE
	brk $F0.b		; 00 F0
	bra   7.b		; 80 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	sec		; 38
	bit $485F.w		; 2C 5F 48
	tad		; 5B
	cli		; 58
	phd		; 0B
	asl $1E0F.w,X		; 1E 0F 1E
	ora $1E0D1C.l		; 0F 1C 0D 1E
	eor $FFF7F8.l		; 4F F8 F7 FF
	sed		; F8
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FFFE.w,X		; FD FE FF
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	ora [$F3.b]		; 07 F3
	ora $F907F7.l		; 0F F7 07 F9
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF02.l,X		; FF 02 FF 03
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $FEBE00.l,X		; FF 00 BE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($01.b,X)		; C1 01
	sbc $3EFF07.l,X		; FF 07 FF 3E
	sbc $05FFF8.l,X		; FF F8 FF 05
	sbc $0000.w,X		; FD 00 00
	ora $00.b,S		; 03 00
	rol $C100.w,X		; 3E 00 C1
	brk $07.b		; 00 07
	ora ($3F.b,X)		; 01 3F
	asl $F9FF.w		; 0E FF F9
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	clc		; 18
	sbc $01FFC0.l,X		; FF C0 FF 01
	sbc $0CFF02.l,X		; FF 02 FF 0C
	sbc $031F18.l,X		; FF 18 1F 03
	brk $E0.b		; 00 E0
	brk $1E.b		; 00 1E
	cop $FC.b		; 02 FC
	sty $FD.b		; 84 FD
	bit $79FB.w,X		; 3C FB 79
	cmp $07FFC3.l		; CF C3 FF 07
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	inc $FE00.w,X		; FE 00 FE
	inc $FE80.w,X		; FE 80 FE
	inc $FD01.w,X		; FE 01 FD
	cop $FD.b		; 02 FD
	cop $01.b		; 02 01
	inc $01FE.w,X		; FE FE 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	jsr ($0303.w,X)		; FC 03 03
	jsr ($0101.w,X)		; FC 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE0100.l,X		; FF 00 01 FE
	sbc $FF00FF.l,X		; FF FF 00 FF
	adc $E080FF.l,X		; 7F FF 80 E0
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $60E000.l,X		; 7F 00 E0 60
	cpx #$E1E0.w		; E0 E0 E1
	sbc ($FF.b,X)		; E1 FF
	sed		; F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	brk $FF.b		; 00 FF
	sbc $0F00FC.l,X		; FF FC 00 0F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $0000FF.l,X		; 1F FF 00 00
	brk $00.b		; 00 00
	sbc $0F0F00.l,X		; FF 00 0F 0F
	ora $FFFF1F.l,X		; 1F 1F FF FF
	sbc $1FFF0F.l,X		; FF 0F FF 1F
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FE81.w,X		; FE 81 FE
	rti		; 40

	rti		; 40

	ora $FD.b,S		; 03 FD
	and ($4D.b,S),Y		; 33 4D
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3F4000.l,X		; FF 00 40 3F
	sbc $007F00.l,X		; FF 00 7F 00
	brk $FF.b		; 00 FF
	ror $DFAE.w		; 6E AE DF
	eor $B0B8B4.l,X		; 5F B4 B8 B0
	ldy #$6067.w		; A0 67 60
	pea $95CC.w		; F4 CC 95
	cmp $00FF.w		; CD FF 00
	inc $DF1F.w		; EE 1F DF
	and $BF7FBF.l,X		; 3F BF 7F BF
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4E.b		; 00 4E
	adc $65.b,S		; 63 65
	.db $62, $34, $38		; 62 34 38
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $07071F.l,X		; 1F 1F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F0FF.l,X		; FF FF F0 00
	sbc $C03F00.l,X		; FF 00 3F C0
	ora $FFC0F0.l		; 0F F0 C0 FF
	rts		; 60

	sbc $003F70.l,X		; FF 70 3F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$C0FF.w		; C0 FF C0
	sbc $FF00E0.l,X		; FF E0 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $FF0080.l,X		; 7F 80 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	asl $4E4F.w,X		; 1E 4F 4E
	eor $DF1FFE.l,X		; 5F FE 1F DF
	and $BB3FBD.l,X		; 3F BD 3F BB
	adc $CFFFF7.l,X		; 7F F7 FF CF
	sbc $BFFEFF.l,X		; FF FF FE BF
	inc $FEFF.w,X		; FE FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$8080.w		; C0 80 80
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
	tsb $F9.b		; 04 F9
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	sbc [$F3.b],Y		; F7 F3
	sbc ($08.b,S),Y		; F3 08
	xce		; FB
	brk $F9.b		; 00 F9
	cop $F9.b		; 02 F9
	tsb $04.b		; 04 04
	cop $00.b		; 02 00
	tsb $08.b		; 04 08
	tsb $04.b		; 04 04
	php		; 08
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FD.b		; 04 FD
	cop $00.b		; 02 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFF8.l,X		; FF F8 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	cmp $00FF7F.l		; CF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpy #$80FF.w		; C0 FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cop $FE.b		; 02 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$3FFF.w		; C0 FF 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8EFF00.l,X		; FF 00 FF 8E
	ora $FF00FC.l		; 0F FC 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F01B00.l,X		; FF 00 1B F0
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	asl $FE.b		; 06 FE
	sbc ($FF.b,X)		; E1 FF
	cpx #$F40F.w		; E0 0F F4
	ora [$FF.b]		; 07 FF
	ora $0F3F3F.l,X		; 1F 3F 3F 0F
	ora $010303.l		; 0F 03 03 01
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0707F8.l,X		; FF F8 07 07
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	plx		; FA
	ora $FD.b,S		; 03 FD
	ora ($FE.b,X)		; 01 FE
	brk $3F.b		; 00 3F
	cpy #$F00F.w		; C0 0F F0
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	cpx #$FC1F.w		; E0 1F FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $0F3F3F.l,X		; 7F 3F 3F 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $0F3F3F.l,X		; 7F 3F 3F 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -32.b		; F0 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	beq   0.b		; F0 00
	sbc $C07F00.l,X		; FF 00 7F C0
	and $309B60.l		; 2F 60 9B 30
	cmp $F608.w		; CD 08 F6
	cpy $FB.b		; C4 FB
	ora $1F1F00.l		; 0F 00 1F 1F
	sta $0FDF1F.l,X		; 9F 1F DF 0F
	sbc [$83.b]		; E7 83
	sbc ($C1.b,S),Y		; F3 C1
	sbc $FCF0.w,Y		; F9 F0 FC
	sed		; F8
	cpx #$3F1F.w		; E0 1F 3F
	sbc $3FE73F.l,X		; FF 3F E7 3F
	sbc $0CFF07.l,X		; FF 07 FF 0C
	sbc $08FF0A.l,X		; FF 0A FF 08
	adc $FF00FF.l,X		; 7F FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $F81FFA.l,X		; FF FA 1F F8
	ora $17C049.l		; 0F 49 C0 17
	bra -98.b		; 80 9E
	lda ($3D.b,X)		; A1 3D
	sta $BA.b,S		; 83 BA
	stx $22.b		; 86 22
	lsr $7E02.w,X		; 5E 02 7E
	asl A		; 0A
	ror $2F.b,X		; 76 2F
	bpl  95.b		; 10 5F
	jsr $403F.w		; 20 3F 40
	lda $41BE40.l,X		; BF 40 BE 41
	ror $7E81.w,X		; 7E 81 7E
	sta ($7E.b,X)		; 81 7E
	sta ($8E.b,X)		; 81 8E
	lsr $FF7F.w		; 4E 7F FF
	lda $6050BF.l,X		; BF BF 50 60
	sbc [$C0.b]		; E7 C0
	dec $94C0.w		; CE C0 94
	cpy $CD95.w		; CC 95 CD
	dec $FF3F.w		; CE 3F FF
	and $7F7FBF.l,X		; 3F BF 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
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
	brk $E5.b		; 00 E5
.INDEX 16
	rep #$51		; C2 51
	rts		; 60

	bit $38.b,X		; 34 38
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $07071F.l,X		; 1F 1F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00F8.w		; E0 F8 00
	sbc [$00.b]		; E7 00
	cpy #$C000.w		; C0 00 C0
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	sbc $E7E718.l,X		; FF 18 E7 E7
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $1C.b		; 00 1C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	adc $FFE1FF.l,X		; 7F FF E1 FF
	brk $00.b		; 00 00
	cpx #$FC00.w		; E0 00 FC
	cpx #$1C1F.w		; E0 1F 1C
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	rti		; 40

	adc $B8DFF0.l,X		; 7F F0 DF B8
	lda $D46C2B.l		; AF 2B 6C D4
	and [$98.b],Y		; 37 98
	dec A		; 3A
	rol A		; 2A
	tas		; 1B
	lsr A		; 4A
	tad		; 5B
	brk $80.b		; 00 80
	cpx #$B080.w		; E0 80 B0
	cpy #$F0EF.w		; C0 EF F0
	sbc [$F8.b],Y		; F7 F8
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	xce		; FB
	jsr ($FF00.w,X)		; FC 00 FF
	brk $ED.b		; 00 ED
	brk $FA.b		; 00 FA
	bra  -1.b		; 80 FF
	stx $000E.w		; 8E 0E 00
	sbc $02FD02.l,X		; FF 02 FD 02
	sbc $003F.w,X		; FD 3F 00
	asl $0700.w,X		; 1E 00 07
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $DD.b		; 00 DD
	and $FB7F3D.l,X		; 3F 3D 7F FB
	adc $CFFFF7.l,X		; 7F F7 FF CF
	sbc $00FC3C.l,X		; FF 3C FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F8FCFC.l,X		; FF FC FC F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F8FCFC.l,X		; FF FC FC F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FF0FF.l,X		; FF FF F0 0F
	sbc $F0FF00.l,X		; FF 00 FF F0
	beq   0.b		; F0 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
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
	brk $E2.b		; 00 E2
	sbc $FEF9.w,X		; FD F9 FE
	ora $FD0CFF.l,X		; 1F FF 0C FD
	tsb $F018.w		; 0C 18 F0
	pea $E802.w		; F4 02 E8
	bit $F0.b		; 24 F0
	inc $FFFC.w,X		; FE FC FF
	inc $FFFF.w,X		; FE FF FF
	beq -14.b		; F0 F2
	sbc $02.b		; E5 02
	ora $1B02.w		; 0D 02 1B
	tsb $17.b		; 04 17
	php		; 08
	ora ($9E.b,X)		; 01 9E
	asl $01F9.w,X		; 1E F9 01
	inc $FF00.w,X		; FE 00 FF
	bra  -1.b		; 80 FF
	bmi  63.b		; 30 3F
	ora ($01.b,X)		; 01 01
	eor $0F793F.l,X		; 5F 3F 79 0F
	ora $000101.l,X		; 1F 01 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$FE00.w		; C0 00 FE
	brk $FF.b		; 00 FF
	brk $0A.b		; 00 0A
	ror $1A.b,X		; 76 1A
	inc $1A.b		; E6 1A
	inc $3A.b		; E6 3A
	dec $F2.b		; C6 F2
	asl $FEF6.w		; 0E F6 FE
	ora $FD.b		; 05 FD
	ora ($01.b,X)		; 01 01
	ror $FE81.w,X		; 7E 81 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FD.b,X)		; 01 FD
	ora $01.b,S		; 03 01
	ora ($B4.b,X)		; 01 B4
	cpy $88F8.w		; CC F8 88
	sbc $EC99.w		; ED 99 EC
	tya		; 98
	cpx $B898.w		; EC 98 B8
	cpy #$C49C.w		; C0 9C C4
	dec $FFC3.w		; CE C3 FF
	sbc $FEFFF7.l,X		; FF F7 FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
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
	brk $3F.b		; 00 3F
	sbc $FFFF01.l,X		; FF 01 FF FF
	brk $00.b		; 00 00
	sbc $18E700.l,X		; FF 00 E7 18
	sbc $83FF04.l,X		; FF 04 FF 83
	adc $FFFFFF.l,X		; 7F FF FF FF
	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	asl $18.b		; 06 18
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	ora $3FC0F0.l		; 0F F0 C0 3F
	brk $7F.b		; 00 7F
	brk $ED.b		; 00 ED
	brk $FB.b		; 00 FB
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	cpy #$F000.w		; C0 00 F0
	brk $1E.b		; 00 1E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $56.b		; 00 56
	eor $174F56.l		; 4F 56 4F 17
	ora $574E57.l		; 0F 57 4E 57
	lsr $4F56.w		; 4E 56 4F
	lsr $9E1F.w		; 4E 1F 9E
	and $BFFCFF.l,X		; 3F FF FC BF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FD02FC.l,X		; FF FC 02 FD
	asl $FFFF.w		; 0E FF FF
	sbc $E2FF3E.l,X		; FF 3E FF E2
	ora $3F01FF.l,X		; 1F FF 01 3F
	cmp ($00.b,X)		; C1 00
	sbc $FF00FE.l,X		; FF FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$FC80.w		; E0 80 FC
	sed		; F8
	sbc $80FC9F.l,X		; FF 9F FC 80
	ora $00.b,S		; 03 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	brk $FC.b		; 00 FC
	cpx #$FCFF.w		; E0 FF FC
	sbc $1CFFFF.l,X		; FF FF FF 1C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	sec		; 38
	bit $FC1C.w,X		; 3C 1C FC
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $00F700.l		; EF 00 F7 00
	sbc $0000.w,X		; FD 00 00
	bit $FC3C.w,X		; 3C 3C FC
	bit $00FE.w,X		; 3C FE 00
	sbc $001800.l,X		; FF 00 18 00
	asl $0300.w		; 0E 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $43C043.l,X		; FF 43 C0 43
	cpy #$C043.w		; C0 43 C0
	sbc $FF0100.l,X		; FF 00 01 FF
	rti		; 40

	dec $00FF.w,X		; DE FF 00
	brk $00.b		; 00 00
	and $3E03.w,X		; 3D 03 3E
	ora $3D.b,S		; 03 3D
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	and ($01.b,X)		; 21 01
	ora ($00.b,X)		; 01 00
	sbc $A00080.l,X		; FF 80 00 A0
	jsr $0080.w		; 20 80 00
	sbc $FDFA00.l,X		; FF 00 FA FD
	ldx $01.b		; A6 01
	inc $0000.w,X		; FE 00 00
	brk $3F.b		; 00 3F
	cpy #$C0BF.w		; C0 BF C0
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $F8F700.l,X		; FF 00 F7 F8
	rti		; 40

	brk $30.b		; 00 30
	cpx #$800C.w		; E0 0C 80
	ora [$9C.b]		; 07 9C
	ora ($7F.b,X)		; 01 7F
	brk $DF.b		; 00 DF
	brk $F7.b		; 00 F7
	brk $FD.b		; 00 FD
	cpy #$1000.w		; C0 00 10
	brk $1C.b		; 00 1C
	rts		; 60

	cmp ($20.b,S),Y		; D3 20
	beq   0.b		; F0 00
	sec		; 38
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra 112.b		; 80 70
	cpx #$F80C.w		; E0 0C F8
	ora $FE.b,S		; 03 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $10.b		; 00 10
	brk $04.b		; 00 04
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $F0FF1F.l,X		; FF 1F FF F0
	sbc $E7FF00.l,X		; FF 00 FF E7
	sbc [$FF.b]		; E7 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	ora $01001F.l,X		; 1F 1F 00 01
	inc $FC02.w,X		; FE 02 FC
	ora $F9.b		; 05 F9
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora $E0E0FF.l		; 0F FF E0 E0
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $06FF03.l,X		; FF 03 FF 06
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	cpy #$6000.w		; C0 00 60
	cpy #$E030.w		; C0 30 E0
	tsb $80F8.w		; 0C F8 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $04.b		; 00 04
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $D0.b		; 00 D0
	brk $04.b		; 00 04
	brk $BC.b		; 00 BC
	cpy #$C03C.w		; C0 3C C0
	ldy $FCC0.w,X		; BC C0 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	cmp $00B700.l,X		; DF 00 B7 00
	sbc $FB00.w,X		; FD 00 FB
	brk $FE.b		; 00 FE
	adc $0000FF.l,X		; 7F FF 00 00
	bra   0.b		; 80 00
	cpx #$7800.w		; E0 00 78
	brk $FE.b		; 00 FE
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	lda $009FA0.l,X		; BF A0 9F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $7F.b		; 00 7F
	brk $03.b		; 00 03
	stz $FFFF.w		; 9C FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00FF63.l,X		; 9F 63 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvn $FF,$03		; 54 03 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $07FFFF.l,X		; FF FF FF 07
	ora [$03.b]		; 07 03
	ora $01.b,S		; 03 01
	ora ($F7.b,X)		; 01 F7
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	ora ($FF.b,X)		; 01 FF
	bra 127.b		; 80 7F
	jsr $04DF.w		; 20 DF 04
	sed		; F8
	brk $FF.b		; 00 FF
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$3030.w		; E0 30 30
	sbc $000000.l,X		; FF 00 00 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $7F0400.l,X		; FF 00 04 7F
	eor #$20DF.w		; 49 DF 20
	sbc $1F1F00.l		; EF 00 1F 1F
	inc $0001.w,X		; FE 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $00.b,S		; E3 00
	bmi   0.b		; 30 00
	ora $00E000.l,X		; 1F 00 E0 00
	brk $01.b		; 00 01
	sbc $01FE01.l,X		; FF 01 FE 01
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$80C0.w		; C0 C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	bpl -128.b		; 10 80
	bpl -32.b		; 10 E0
	cpx #$F080.w		; E0 80 F0
	brk $F8.b		; 00 F8
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sed		; F8
	brk $90.b		; 00 90
	cpx #$E090.w		; E0 90 E0
	cpx #$F000.w		; E0 00 F0
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc ($0B.b,S),Y		; F3 0B
	sed		; F8
	sbc $F8FFF3.l,X		; FF F3 FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $01.b		; 00 01
	ora [$03.b]		; 07 03
	ora $FE7D82.l,X		; 1F 82 7D FE
	brk $28.b		; 00 28
	cmp [$7F.b],Y		; D7 7F
	tda		; 7B
	sei		; 78
	sei		; 78
	bmi  48.b		; 30 30
	asl $FC00.w,X		; 1E 00 FC
	brk $7C.b		; 00 7C
	sbc $FF00FF.l,X		; FF FF 00 FF
	plp		; 28
	adc $78787C.l,X		; 7F 7C 78 78
	bmi  48.b		; 30 30
	cpy #$84C0.w		; C0 C0 84
	bra -100.b		; 80 9C
	sty $9B.b		; 84 9B
	ldy $6F7C.w,X		; BC 7C 6F
	bit $7CC7.w,X		; 3C C7 7C
	jmp ($3838.w)		; 6C 38 38
	and $047E00.l,X		; 3F 00 7E 04
	adc $187F00.l,X		; 7F 00 7F 18
	lda $3CFF3C.l,X		; BF 3C FF 3C
	jmp ($387C.w,X)		; 7C 7C 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E720.w		; 20 20 E7
	rol $FF.b		; 26 FF
	adc $F91F.w,Y		; 79 1F F9
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	cpx #$3C00.w		; E0 00 3C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	ora $060FFF.l		; 0F FF 0F 06
	asl $00.b		; 06 00
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
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $EE.b		; 00 EE
	asl $FFF6.w		; 0E F6 FF
	inc $F6FF.w		; EE FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $F6.b		; 00 F6
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000403.l,X		; FF 03 04 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000404.l,X		; FF 04 04 00
	brk $F0.b		; 00 F0
	sbc $05FFFE.l,X		; FF FE FF 05
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $06FFFE.l,X		; FF FE FF 06
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $FE.b		; 00 FE
	sbc $000407.l,X		; FF 07 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FFBF40.l		; 0F 40 BF FF
	brk $1F.b		; 00 1F
	adc $3F6D12.l,X		; 7F 12 6D 3F
	rol $00.b,X		; 36 00
	brk $07.b		; 00 07
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	sbc $7F00FF.l,X		; FF FF 00 7F
	rts		; 60

	adc $3F3F12.l,X		; 7F 12 3F 3F
	asl $3C1E.w		; 0E 1E 3C
	sbc $F0F0.w,X		; FD F0 F0
	cmp ($30.b,S),Y		; D3 30
	cmp [$13.b],Y		; D7 13
	sta $EC0EFE.l,X		; 9F FE 0E EC
	sbc $FF.b		; E5 FF
	and ($00.b),Y		; 31 00
	cmp $00.b,S		; C3 00
	ora $E00F00.l		; 0F 00 0F E0
	sbc $63FF03.l		; EF 03 FF 63
	sbc [$07.b],Y		; F7 07
	inc $0007.w,X		; FE 07 00
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	jsr $20A0.w		; 20 A0 20
	sbc $FEFFA0.l,X		; FF A0 FF FE
	cmp $7B.b		; C5 7B
	cpy #$FF7F.w		; C0 7F FF
	brk $F0.b		; 00 F0
	jsr $00FF.w		; 20 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $0000C0.l,X		; FF C0 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	stx $FE8C.w		; 8E 8C FE
	txy		; 9B
	sed		; F8
	sbc [$76.b],Y		; F7 76
	plx		; FA
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	asl $1EFF.w		; 0E FF 1E
	inc $003E.w,X		; FE 3E 00
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $78EC.w		; EC EC 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($78FC.w,X)		; FC FC 78
	sei		; 78
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
	brk $E0.b		; 00 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc ($0C.b,S),Y		; F3 0C
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $FB.b		; 00 FB
	sbc $000403.l,X		; FF 03 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	tya		; 98
	adc $3C2F3C.l,X		; 7F 3C 2F 3C
	bit $18.b,X		; 34 18
	clc		; 18
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3CFF18.l,X		; FF 18 FF 3C
	and $3C3C3C.l,X		; 3F 3C 3C 3C
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	plp		; 28
	plp		; 28
	brk $0C.b		; 00 0C
	cpy #$EF10.w		; C0 10 EF
	bpl  31.b		; 10 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $3F.b		; 00 3F
	brk $F8.b		; 00 F8
	plp		; 28
	jsr ($FF0C.w,X)		; FC 0C FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  60.b		; 80 3C
	brk $FF.b		; 00 FF
	tsb $FEFF.w		; 0C FF FE
	ora $1A1EF6.l,X		; 1F F6 1E 1A
	tsb $C00C.w		; 0C 0C C0
	brk $B8.b		; 00 B8
	bra  -2.b		; 80 FE
	brk $FF.b		; 00 FF
	tsb $1EFF.w		; 0C FF 1E
	sbc $1E1E1E.l,X		; FF 1E 1E 1E
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	bpl -10.b		; 10 F6
	sbc $F6FFEE.l,X		; FF EE FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $F6.b		; 00 F6
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000403.l,X		; FF 03 04 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000404.l,X		; FF 04 04 00
	brk $F2.b		; 00 F2
	sbc $05FFFE.l,X		; FF FE FF 05
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $FE.b		; 00 FE
	sbc $000406.l,X		; FF 06 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FA.b]		; 07 FA
	sbc $394C.w,X		; FD 4C 39
	trb $000A.w		; 1C 0A 00
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora $1F0F7F.l		; 0F 7F 0F 1F
	ora $020303.l		; 0F 03 03 02
	cop $FF.b		; 02 FF
	sbc $FF03FF.l,X		; FF FF 03 FF
	ora ($FF.b,X)		; 01 FF
	sbc $80FF81.l,X		; FF 81 FF 80
	sbc $FF0000.l,X		; FF 00 00 FF
	cop $01.b		; 02 01
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -2.b		; 80 FE
	inc $4343.w,X		; FE 43 43
	brk $E2.b		; 00 E2
	inc $FFFF.w,X		; FE FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $40.b		; 00 40
	rti		; 40

.ACCU 8
	sep #$E2		; E2 E2
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bvs 112.b		; 70 70
	stz $FF8E.w,X		; 9E 8E FF
	sta $B6EB.w,X		; 9D EB B6
	sbc $EA.b,S		; E3 EA
	and [$E2.b],Y		; 37 E2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	beq   0.b		; F0 00
	inc $FF1C.w,X		; FE 1C FF
	rol $3EFF.w,X		; 3E FF 3E
	sbc $00003E.l,X		; FF 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$2060.w		; E0 60 20
	cpx #$40C0.w		; E0 C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $98.b		; 00 98
	iny		; C8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tay		; A8
	cld		; D8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	brk $09.b		; 00 09
	brk $E9.b		; 00 E9
	ora $F4.b,X		; 15 F4
	sbc $F8000E.l,X		; FF 0E 00 F8
	sbc $000400.l,X		; FF 00 04 00
	brk $06.b		; 00 06
	brk $F5.b		; 00 F5
	sbc $000401.l,X		; FF 01 04 00
	brk $06.b		; 00 06
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $FE.b		; 00 FE
	sbc $03FFF4.l,X		; FF F4 FF 03
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFFC.l,X		; FF FC FF 04
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $05FFF4.l,X		; FF F4 FF 05
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $04FFFC.l,X		; FF FC FF 04
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $06FFF5.l,X		; FF F5 FF 06
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $07FFFD.l,X		; FF FD FF 07
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $08FFF6.l,X		; FF F6 FF 08
	tsb $00.b		; 04 00
	brk $60.b		; 00 60
	rts		; 60

	cpx $FD8C.w		; EC 8C FD
	cmp ($E0.b,X)		; C1 E0
	rti		; 40

	bvs -50.b		; 70 CE
	inc $C040.w,X		; FE 40 C0
	cpy #$8080.w		; C0 80 80
	bra   0.b		; 80 00
	beq -128.b		; F0 80
	inc $FFC0.w,X		; FE C0 FF
	cpy #$C0FE.w		; C0 FE C0
	inc $C0C0.w,X		; FE C0 C0
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	mvp $43,$64		; 44 64 43
	tad		; 5B
	and $67BF60.l		; 2F 60 BF 67
	sbc $FC2C.w,X		; FD 2C FC
	nop		; EA
	ora $00E0F8.l		; 0F F8 E0 00
	jmp ($5C44.w,X)		; 7C 44 5C
	rti		; 40

	sbc $07FF00.l,X		; FF 00 FF 07
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FD0A0F.l,X		; FF 0F 0A FD
	ora $07070C.l		; 0F 0C 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0F0F0F.l,X		; FF 0F 0F 0F
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0300FE.l,X		; FF FE 00 03
	brk $80.b		; 00 80
	cpy #$00FC.w		; C0 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	tsb $14.b		; 04 14
	sbc ($FD.b,X)		; E1 FD
	inc $FFFE.w,X		; FE FE FF
	cop $FF.b		; 02 FF
	cop $3F.b		; 02 3F
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	sbc $FE000F.l,X		; FF 0F 00 FE
	tsb $7F.b		; 04 7F
	and $0003.w		; 2D 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora $00001F.l		; 0F 1F 00 00
	sbc $FE7900.l,X		; FF 00 79 FE
	cpx $DFCF.w		; EC CF DF
	lda [$8C.b]		; A7 8C
	cmp [$07.b],Y		; D7 07
	brk $FC.b		; 00 FC
	php		; 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFF78.l,X		; FF 78 FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	pei ($A7.b)		; D4 A7
	jsr ($78CC.w,X)		; FC CC 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFCFC.l,X		; FF FC FC FC
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001F00.l,X		; 1F 00 1F 00
	clc		; 18
	ora [$1F.b]		; 07 1F
	ora $001F00.l,X		; 1F 00 1F 00
	ora $010700.l		; 0F 00 07 01
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $DF.b		; 00 DF
	ora $18FFEF.l,X		; 1F EF FF 18
	brk $F5.b		; 00 F5
	sbc $000400.l,X		; FF 00 04 00
	brk $10.b		; 00 10
	brk $F2.b		; 00 F2
	sbc $000401.l,X		; FF 01 04 00
	brk $10.b		; 00 10
	brk $FA.b		; 00 FA
	sbc $000402.l,X		; FF 02 04 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $000403.l,X		; FF 03 04 00
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $000405.l,X		; FF 05 04 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $000406.l,X		; FF 06 04 00
	brk $F8.b		; 00 F8
	sbc $07FFEF.l,X		; FF EF FF 07
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $08FFF7.l,X		; FF F7 FF 08
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $09FFF0.l,X		; FF F0 FF 09
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $0AFFF8.l,X		; FF F8 FF 0A
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $0BFFF1.l,X		; FF F1 FF 0B
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $0CFFF9.l,X		; FF F9 FF 0C
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $0DFFF2.l,X		; FF F2 FF 0D
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $0EFFFA.l,X		; FF FA FF 0E
	tsb $00.b		; 04 00
	brk $D8.b		; 00 D8
	sbc $0FFFF4.l,X		; FF F4 FF 0F
	tsb $00.b		; 04 00
	brk $80.b		; 00 80
	bra -16.b		; 80 F0
	bvs  -4.b		; 70 FC
	tsb $BF7F.w		; 0C 7F BF
	adc $9EC081.l,X		; 7F 81 C0 9E
	cpx #$FE80.w		; E0 80 FE
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
	cpy #$F000.w		; C0 00 F0
	bra 124.b		; 80 7C
	sbc $FE7D07.l,X		; FF 07 7D FE
	inc $C3C7.w,X		; FE C7 C3
	tyx		; BB
	adc $C029.w		; 6D 29 C0
	cpy #$0080.w		; C0 80 00
	bra   0.b		; 80 00
	sed		; F8
	brk $FF.b		; 00 FF
	jmp ($FEFF.w,X)		; 7C FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta ($45.b,S),Y		; 93 45
	adc $D345.w		; 6D 45 D3
	tyx		; BB
	sbc [$C7.b],Y		; F7 C7
	inc $38FE.w,X		; FE FE 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $38FE.w,X		; FE FE 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F8C0.w		; C0 C0 F8
	sed		; F8
	and $9C1B3F.l,X		; 3F 3F 1B 9C
	cmp $FEE3FE.l,X		; DF FE E3 FE
	sbc [$02.b],Y		; F7 02
	inc $0005.w,X		; FE 05 00
	brk $C0.b		; 00 C0
	brk $38.b		; 00 38
	brk $9F.b		; 00 9F
	stz $183D.w		; 9C 3D 18
	tas		; 1B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	phd		; 0B
	sbc $FF0B.w,X		; FD 0B FF
	xce		; FB
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $010101.l,X		; FF 01 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFFE.w,X		; FE FE FF
	sbc $000101.l,X		; FF 01 01 00
	brk $80.b		; 00 80
	inc $FFFF.w,X		; FE FF FF
	sbc $00FF01.l,X		; FF 01 FF 00
	brk $00.b		; 00 00
	inc $0100.w,X		; FE 00 01
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ror $0000.w,X		; 7E 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $9BFFFF.l,X		; 7F FF FF 9B
	xce		; FB
	asl $FFFF.w,X		; 1E FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	bpl  -1.b		; 10 FF
	bpl   0.b		; 10 00
	brk $6F.b		; 00 6F
	rts		; 60

	xba		; EB
	sbc $EE.b,S		; E3 EE
	sbc [$10.b]		; E7 10
	brk $90.b		; 00 90
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl  -1.b		; 10 FF
	beq  -1.b		; F0 FF
	php		; 08
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F7F7FF.l,X		; FF FF F7 F7
	cmp $FFFFCF.l		; CF CF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	brk $00.b		; 00 00
	stx $3D02.w		; 8E 02 3D
	ora $00.b		; 05 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $06FE87.l,X		; FF 87 FE 06
	adc $80FF82.l,X		; 7F 82 FF 80
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $7F.b		; 02 7F
	.db $82, $FF, $80		; 82 FF 80
	sbc $000080.l,X		; FF 80 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $E71C.w		; 1C 1C E7
	sbc [$FF.b],Y		; F7 FF
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	inc $9DEC.w,X		; FE EC 9D
	asl $0066.w,X		; 1E 66 00
	ora $16.b,S		; 03 16
	tsb $00F8.w		; 0C F8 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFDF8.l,X		; FF F8 FD FE
	inc $D3FF.w,X		; FE FF D3
	eor [$A3.b],Y		; 57 A3
	pld		; 2B
	wai		; CB
	phb		; 8B
	and $8EBE77.l		; 2F 77 BE 8E
	jsr ($78FC.w,X)		; FC FC 78
	sei		; 78
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FCFE.w,X		; FE FE FC
	jsr ($7878.w,X)		; FC 78 78
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	adc $007F00.l,X		; 7F 00 7F 00
	adc $7F0300.l,X		; 7F 00 03 7F
	sta [$7F.b]		; 87 7F
	ora [$FF.b]		; 07 FF
	dec $3E.b		; C6 3E
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $CE3707.l,X		; FF 07 37 CE
	asl $1E.b		; 06 1E
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $071F07.l,X		; FF 07 1F 07
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	bra  40.b		; 80 28
	brk $D5.b		; 00 D5
	and #$FFEB.w		; 29 EB FF
	inc A		; 1A
	brk $F0.b		; 00 F0
	sbc $000400.l,X		; FF 00 04 00
	brk $0A.b		; 00 0A
	brk $EB.b		; 00 EB
	sbc $000402.l,X		; FF 02 04 00
	brk $0A.b		; 00 0A
	brk $FB.b		; 00 FB
	sbc $000404.l,X		; FF 04 04 00
	brk $FA.b		; 00 FA
	sbc $06FFEB.l,X		; FF EB FF 06
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $08FFFB.l,X		; FF FB FF 08
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0CFFFB.l,X		; FF FB FF 0C
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $0EFFEC.l,X		; FF EC FF 0E
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $20FFFC.l,X		; FF FC FF 20
	tsb $00.b		; 04 00
	brk $CA.b		; 00 CA
	sbc $22FFEE.l,X		; FF EE FF 22
	tsb $00.b		; 04 00
	brk $80.b		; 00 80
	bra -16.b		; 80 F0
	beq  -2.b		; F0 FE
	asl $037F.w,X		; 1E 7F 03
	sbc $315FE0.l,X		; FF E0 5F 31
	sta $88DF18.l		; 8F 18 DF 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$7C00.w		; E0 00 7C
	bra  -1.b		; 80 FF
	cpx #$F0FE.w		; E0 FE F0
	sbc $F8FFF8.l,X		; FF F8 FF F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F8C0.w		; C0 C0 F8
	sec		; 38
	inc $FDFE.w,X		; FE FE FD
	ora ($FD.b,X)		; 01 FD
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $80.b		; 00 80
	bra 120.b		; 80 78
	sed		; F8
	ora $4F417F.l		; 0F 7F 41 4F
	rti		; 40

	eor $0E.b,S		; 43 0E
	cmp $31FFEF.l		; CF EF FF 31
	and $800000.l,X		; 3F 00 00 80
	brk $70.b		; 00 70
	brk $4E.b		; 00 4E
	rti		; 40

	eor $43.b,S		; 43 43
	cmp $0E1FCF.l		; CF CF 1F 0E
	dec $0000.w		; CE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EE.b		; 00 EE
	inc $F83C.w		; EE 3C F8
	eor $4179E3.l,X		; 5F E3 79 41
	adc $000040.l,X		; 7F 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $C40E.w		; 0E 0E C4
	brk $FC.b		; 00 FC
	bra  -2.b		; 80 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $48.b		; 00 48
	sbc $74.b,S		; E3 74
	sbc $38.b,S		; E3 38
	bmi  31.b		; 30 1F
	ora $000707.l,X		; 1F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $3F7FFF.l,X		; 7F FF 7F 3F
	and $071F1F.l,X		; 3F 1F 1F 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $DCC0C0.l,X		; FF C0 C0 DC
	dec $FCF4.w,X		; DE F4 FC
	brk $FF.b		; 00 FF
	sbc $8080FF.l,X		; FF FF 80 80
	sbc $000080.l,X		; FF 80 00 00
	rti		; 40

	brk $5E.b		; 00 5E
	asl $3C74.w,X		; 1E 74 3C
	sbc $00803F.l,X		; FF 3F 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0300FF.l,X		; FF FF 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	inc $0FFF.w,X		; FE FF 0F
	ora $0000FF.l		; 0F FF 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   1.b		; 80 01
	ora ($F0.b,X)		; 01 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	ora ($FF.b,X)		; 01 FF
	sbc $7F1F3F.l,X		; FF 3F 1F 7F
	adc $FFFF.w,X		; 7D FF FF
	ora $03.b,S		; 03 03
	sed		; F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$0083.w		; C0 83 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $9CDFEB.l,X		; FF EB DF 9C
	and $FFFFB8.l,X		; 3F B8 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	ora $AF.b,S		; 03 AF
	eor [$DF.b]		; 47 DF
	sta $000000.l		; 8F 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	sbc $00FFC0.l,X		; FF C0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpy #$C0FF.w		; C0 FF C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FF00C0.l,X		; 3F C0 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	trb $FF1E.w		; 1C 1E FF
	sbc $F80303.l,X		; FF 03 03 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sbc $020000.l,X		; FF 00 00 02
	ora ($0F.b,X)		; 01 0F
	asl $FC.b		; 06 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($8CAF.w,X)		; FC AF 8C
	rol $EF0C.w		; 2E 0C EF
	cpy $0CDF.w		; CC DF 0C
	tya		; 98
	ora $E03070.l,X		; 1F 70 30 E0
	cpx #$8080.w		; E0 80 80
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F0F0F8.l,X		; FF F8 F0 F0
	cpx #$80E0.w		; E0 E0 80
	bra -62.b		; 80 C2
	cop $00.b		; 02 00
	jsr ($0000.w,X)		; FC 00 00
	beq   0.b		; F0 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	cop $FC.b		; 02 FC
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	inc $FF00.w,X		; FE 00 FF
	sbc $FF00.w,X		; FD 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	sta $F89FFF.l		; 8F FF 9F F8
	bmi -73.b		; 30 B7
	rts		; 60

	dec $E066.w		; CE 66 E0
	rti		; 40

	cpx #$E04C.w		; E0 4C E0
	jmp $07FF.w		; 4C FF 07
	sbc $1FFF0F.l,X		; FF 0F FF 1F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00007F.l,X		; FF 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	adc $80FF80.l,X		; 7F 80 FF 80
	sbc $FF7F40.l,X		; FF 40 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $E01F00.l,X		; FF 00 1F E0
	sta ($FE.b,X)		; 81 FE
	lda $FEC1FF.l,X		; BF FF C1 FE
	cpy #$C0FF.w		; C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	cpy #$C0FF.w		; C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFC000.l,X		; FF 00 C0 FF
	cpy #$40FF.w		; C0 FF 40
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$C0FF.w		; C0 FF C0
	sbc $000040.l,X		; FF 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b,S		; 03 FF
	asl $FF.b		; 06 FF
	tsb $FE.b		; 04 FE
	asl $CDFC.w		; 0E FC CD
	bit $3CCD.w,X		; 3C CD 3C
	ora $0EFC.w		; 0D FC 0E
	tsb $03FF.w		; 0C FF 03
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	ora $FFFF0F.l		; 0F 0F FF FF
	sta [$03.b]		; 87 03
	tda		; 7B
	ora ($C8.b,X)		; 01 C8
	adc $0409.w		; 6D 09 04
	adc ($80.b),Y		; 71 80
	sta $CC.b		; 85 CC
	ldy $FF11.w		; AC 11 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	asl $06.b		; 06 06
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $53.b		; 00 53
	and $0387.w,Y		; 39 87 03
	inc $78FE.w,X		; FE FE 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $78FE.w,X		; FE FE 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	tsb $0E03.w		; 0C 03 0E
	ora #$0C0F.w		; 09 0F 0C
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  15.b		; 10 0F
	asl $0311.w		; 0E 11 03
	tsb $0300.w		; 0C 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $000300.l		; 0F 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $3080.w		; 0C 80 30
	brk $CB.b		; 00 CB
	and ($E6.b)		; 32 E6
	sbc $EE0023.l,X		; FF 23 00 EE
	sbc $000400.l,X		; FF 00 04 00
	brk $13.b		; 00 13
	brk $E9.b		; 00 E9
	sbc $000402.l,X		; FF 02 04 00
	brk $13.b		; 00 13
	brk $F9.b		; 00 F9
	sbc $000404.l,X		; FF 04 04 00
	brk $03.b		; 00 03
	brk $E6.b		; 00 E6
	sbc $000406.l,X		; FF 06 04 00
	brk $03.b		; 00 03
	brk $F6.b		; 00 F6
	sbc $000408.l,X		; FF 08 04 00
	brk $F3.b		; 00 F3
	sbc $0AFFE6.l,X		; FF E6 FF 0A
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $0CFFF6.l,X		; FF F6 FF 0C
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $0EFFE6.l,X		; FF E6 FF 0E
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $20FFF6.l,X		; FF F6 FF 20
	tsb $00.b		; 04 00
	brk $D3.b		; 00 D3
	sbc $22FFE8.l,X		; FF E8 FF 22
	tsb $00.b		; 04 00
	brk $D3.b		; 00 D3
	sbc $24FFF8.l,X		; FF F8 FF 24
	tsb $00.b		; 04 00
	brk $C3.b		; 00 C3
	sbc $26FFEA.l,X		; FF EA FF 26
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	cpx #$FCE0.w		; E0 E0 FC
	jsr ($3B3F.w,X)		; FC 3F 3B
	eor $FF.b,S		; 43 FF
	cpy #$E0DF.w		; C0 DF E0
	cmp $70FFD0.l		; CF D0 FF 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$7C00.w		; C0 00 7C
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	cpy #$E0DF.w		; C0 DF E0
	sbc $0000E0.l,X		; FF E0 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -32.b		; 80 E0
	rts		; 60

	sei		; 78
	cpx $FA0E.w		; EC 0E FA
	ora $F8.b,S		; 03 F8
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $80.b		; 00 80
	cpx #$BF33.w		; E0 33 BF
	ora $FC83EF.l,X		; 1F EF 83 FC
	beq  -9.b		; F0 F7
	cmp ($F8.b,S),Y		; D3 F8
	ora [$F0.b],Y		; 17 F0
	ora $0000D0.l,X		; 1F D0 00 00
	cmp $03.b,S		; C3 03
	beq -128.b		; F0 80
	sbc $E0F8F0.l,X		; FF F0 F8 E0
	cmp [$40.b],Y		; D7 40
	sta $003F00.l,X		; 9F 00 3F 00
	brk $00.b		; 00 00
	cpy #$40C0.w		; C0 C0 40
	bra -40.b		; 80 D8
	clc		; 18
	brk $FF.b		; 00 FF
	inc $07.b,X		; F6 07
	sbc [$39.b],Y		; F7 39
	inc $F7.b,X		; F6 F7
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $F7.b		; 00 F7
	sei		; 78
	ora $F8F8.w,X		; 1D F8 F8
	trb $EC0E.w		; 1C 0E EC
	ora $070E.w		; 0D 0E 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $EF1FFF.l,X		; 1F FF 1F EF
	ora $070F0F.l		; 0F 0F 0F 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $8E.b		; 00 8E
	asl $9A.b		; 06 9A
	bmi  -3.b		; 30 FD
	bmi   2.b		; 30 02
	ora ($7B.b,X)		; 01 7B
	sta [$FE.b]		; 87 FE
	inc $7878.w,X		; FE 78 78
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ldy #$0C38.w		; A0 38 0C
	sbc $201D01.l		; EF 01 1D 20
	and $60.b,S		; 23 60
	rts		; 60

	ora [$E7.b]		; 07 E7
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	brk $1E.b		; 00 1E
	brk $23.b		; 00 23
	jsr $6060.w		; 20 60 60
	sbc [$E7.b]		; E7 E7
	ora $FEFF1F.l,X		; 1F 1F FF FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sec		; 38
	inc $FE60.w,X		; FE 60 FE
	cpy #$81FE.w		; C0 FE 81
	sbc $04FF02.l,X		; FF 02 FF 04
	sbc $007F04.l,X		; FF 04 7F 00
	brk $78.b		; 00 78
	sec		; 38
	sed		; F8
	sei		; 78
	sed		; F8
	sed		; F8
	sbc $07F9.w,Y		; F9 F9 07
	ora ($04.b,X)		; 01 04
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	sbc $300000.l,X		; FF 00 00 30
	bmi  72.b		; 30 48
	sei		; 78
	cpy #$00F8.w		; C0 F8 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	pla		; 68
	sei		; 78
	cpy #$FEF8.w		; C0 F8 FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 127.b		; 70 7F
	cpy #$01FE.w		; C0 FE 01
	sed		; F8
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	bvs -63.b		; 70 C1
	cpy #$0007.w		; C0 07 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	adc $1C0302.l,X		; 7F 02 03 1C
	cmp [$68.b]		; C7 68
	ora $007FF1.l		; 0F F1 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $3C.b		; 00 3C
	brk $E9.b		; 00 E9
	bpl -13.b		; 10 F3
	and ($00.b,X)		; 21 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $6F.b		; 00 6F
	rts		; 60

	ror $7F70.w,X		; 7E 70 7F
	bvs 126.b		; 70 7E
	bvs  -1.b		; 70 FF
	bvs  -8.b		; 70 F8
	sbc $80C0C0.l,X		; FF C0 C0 80
	bra -17.b		; 80 EF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq -64.b		; F0 C0
	cpy #$8080.w		; C0 80 80
	brk $03.b		; 00 03
	brk $FE.b		; 00 FE
	bit $00C0.w,X		; 3C C0 00
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $FB.b,S		; 23 FB
	and [$FD.b]		; 27 FD
	lsr $4CFC.w		; 4E FC 4C
	sbc #$ED5C.w		; E9 5C ED
	tya		; 98
	sbc $F81D98.l,X		; FF 98 1D F8
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $877BFF.l,X		; FF FF 7B 87
	bmi   1.b		; 30 01
	ldx $EE60.w		; AE 60 EE
	jmp ($0C09.w)		; 6C 09 0C
	sta $D0.b		; 85 D0
	cmp $C6.b,X		; D5 C6
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0100.l,X		; FF 00 01 FF
	brk $1F.b		; 00 1F
	cpx #$FC03.w		; E0 03 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $E1.b		; 00 E1
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $84.b		; 00 84
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	cop $FF.b		; 02 FF
	inc $02FF.w,X		; FE FF 02
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	and $F08FC0.l,X		; 3F C0 8F F0
	eor [$78.b]		; 47 78
	ldy #$DFBF.w		; A0 BF DF
	cmp $FFEF60.l,X		; DF 60 EF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -65.b		; 80 BF
	cpy #$E0DF.w		; C0 DF E0
	sbc $00FFF0.l		; EF F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FFFFE0.l,X		; 1F E0 FF FF
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $6FE800.l,X		; FF 00 E8 6F
	beq 119.b		; F0 77
	beq 119.b		; F0 77
	beq 119.b		; F0 77
	bvs  -9.b		; 70 F7
	beq  -9.b		; F0 F7
	cpy #$80C0.w		; C0 C0 80
	bra -17.b		; 80 EF
	beq  -9.b		; F0 F7
	sed		; F8
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	cpy #$80C0.w		; C0 C0 80
	bra 120.b		; 80 78
	lda $3E9F70.l,X		; BF 70 9F 3E
	cmp $0FE71C.l		; CF 1C E7 0F
	beq   0.b		; F0 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sec		; 38
	sbc $0EFF10.l,X		; FF 10 FF 0E
	sbc $00FF04.l,X		; FF 04 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$001F.w		; E0 1F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $00.b		; 05 00
	and $FE0380.l,X		; 3F 80 03 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FD0007.l,X		; FF 07 00 FD
	ora $C0.b,S		; 03 C0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	and $F83C.w,Y		; 39 3C F8
	ora $0E1C.w,Y		; 19 1C 0E
	tsb $0E0F.w		; 0C 0F 0E
	ora [$07.b]		; 07 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	ora $07070F.l		; 0F 0F 07 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	ldx $AC.b,Y		; B6 AC
	dec $4C.b		; C6 4C
	dey		; 88
	bmi  -3.b		; 30 FD
	bmi   3.b		; 30 03
	ora ($7B.b,X)		; 01 7B
	sta [$FE.b]		; 87 FE
	inc $FCFC.w,X		; FE FC FC
	sbc $FFBFFF.l,X		; FF FF BF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FCFE.w,X		; FE FE FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $003F00.l,X		; 1F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	brk $3F.b		; 00 3F
	rti		; 40

	ora $7F003F.l,X		; 1F 3F 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	sed		; F8
	ora [$F7.b],Y		; 17 F7
	and $DEDDEF.l		; 2F EF DD DE
	adc $BC79BC.l,X		; 7F BC 79 BC
	adc $FCB8.w,X		; 7D B8 FC
	and $07F8.w,Y		; 39 F8 07
	sbc [$0F.b],Y		; F7 0F
	sbc $3FDF1F.l		; EF 1F DF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cop $03.b		; 02 03
	inc $7BFE.w,X		; FE FE 7B
	sta [$32.b]		; 87 32
	ora ($C4.b,X)		; 01 C4
	rts		; 60

	ror A		; 6A
	jmp ($0C0A.w)		; 6C 0A 0C
	stx $A0.b		; 86 A0
	ora $FC.b,S		; 03 FC
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $60.b		; 00 60
	eor $407F7F.l		; 4F 7F 7F 40
	lda $1C8F70.l,X		; BF 70 8F 1C
	adc $07.b,S		; 63 07
	clc		; 18
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $001F00.l,X		; 7F 00 1F 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	ora $003C80.l		; 0F 80 3C 00
	cmp ($3C.b,X)		; C1 3C
	sbc ($FF.b,X)		; E1 FF
	cmp ($FF.b,X)		; C1 FF
	inc $FF.b		; E6 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cmp ($FF.b,X)		; C1 FF
	inc $FF.b,X		; F6 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	cmp ($FF.b),Y		; D1 FF
	sbc $FF.b,S		; E3 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	cmp ($FF.b),Y		; D1 FF
	sbc ($FF.b,S),Y		; F3 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc ($FF.b,X)		; E1 FF
	sbc ($FF.b,X)		; E1 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $E1.b		; 00 E1
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	tsb $00.b		; 04 00
	brk $F1.b		; 00 F1
	sbc $0EFFF1.l,X		; FF F1 FF 0E
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $E1.b		; 00 E1
	sbc $000420.l,X		; FF 20 04 00
	brk $01.b		; 00 01
	brk $F1.b		; 00 F1
	sbc $000422.l,X		; FF 22 04 00
	brk $11.b		; 00 11
	brk $E2.b		; 00 E2
	sbc $000424.l,X		; FF 24 04 00
	brk $11.b		; 00 11
	brk $F2.b		; 00 F2
	sbc $000426.l,X		; FF 26 04 00
	brk $21.b		; 00 21
	brk $E6.b		; 00 E6
	sbc $000428.l,X		; FF 28 04 00
	brk $21.b		; 00 21
	brk $F6.b		; 00 F6
	sbc $00042A.l,X		; FF 2A 04 00
	brk $31.b		; 00 31
	brk $ED.b		; 00 ED
	sbc $00042C.l,X		; FF 2C 04 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $60.b		; 00 60
	ora $3F001F.l,X		; 1F 1F 00 3F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$00.b]		; 07 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	asl $0100.w		; 0E 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000100.l		; 0F 00 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$07.b],Y		; F7 07
	ora [$F7.b]		; 07 F7
	ora [$77.b]		; 07 77
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	adc [$0F.b],Y		; 77 0F
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bpl   3.b		; 10 03
	beq   0.b		; F0 00
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $1C.b		; 00 1C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $17.b		; 00 17
	tsb $38.b		; 04 38
	plp		; 28
	and $FF00EF.l		; 2F EF 00 FF
	brk $0F.b		; 00 0F
	bra   1.b		; 80 01
	inc $FF00.w,X		; FE 00 FF
	brk $1B.b		; 00 1B
	brk $D8.b		; 00 D8
	ora [$EF.b]		; 07 EF
	asl $0000.w,X		; 1E 00 00
	beq   0.b		; F0 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $8C.b		; 00 8C
	tsb $0020.w		; 0C 20 00
	plp		; 28
	php		; 08
	and ($18.b)		; 32 18
	bmi  24.b		; 30 18
	bit $04.b,X		; 34 04
	sta ($03.b)		; 92 03
	phy		; 5A
	sta $FF.b,S		; 83 FF
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFB.l,X		; FF FB FF FF
	sbc $2BFFFF.l,X		; FF FF FF 2B
	cmp [$17.b]		; C7 17
	cmp $37.b,S		; C3 37
	ora $57.b,S		; 03 57
	ora $77.b,S		; 03 77
	adc $D3.b,S		; 63 D3
	sbc [$2B.b]		; E7 2B
	ora [$47.b]		; 07 47
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $800001.l,X		; FF 01 00 80
	brk $1C.b		; 00 1C
	cmp ($73.b,S),Y		; D3 73
	eor $F93ECE.l		; 4F CE 3E F9
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	sbc $20DC00.l,X		; FF 00 DC 20
	bvs -128.b		; 70 80
	cmp ($00.b,X)		; C1 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FFFF1F.l,X		; 1F 1F FF FF
	adc #$BAEB.w		; 69 EB BA
	sta $EB3F75.l,X		; 9F 75 3F EB
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $0000E0.l,X		; FF E0 00 00
	brk $1A.b		; 00 1A
	tsb $7D.b		; 04 7D
	php		; 08
	xce		; FB
	bpl  -9.b		; 10 F7
	and ($00.b,X)		; 21 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF80.l,X		; FF 80 FF 00
	adc $A0BFA0.l,X		; 7F A0 BF A0
	lda $C0DFC0.l,X		; BF C0 DF C0
	cmp $FFDFC0.l,X		; DF C0 DF FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -65.b		; 80 BF
	cpy #$C0BF.w		; C0 BF C0
	cmp $E0DFE0.l,X		; DF E0 DF E0
	cmp $FFFFE0.l,X		; DF E0 FF FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	beq 127.b		; F0 7F
	cpx #$783F.w		; E0 3F 78
	sta $1CDF30.l,X		; 9F 30 DF 1C
	sbc $FF00FF.l		; EF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bvs  -1.b		; 70 FF
	jsr $18FF.w		; 20 FF 18
	sbc $0CFF10.l,X		; FF 10 FF 0C
	sbc $FFCFFF.l,X		; FF FF CF FF
	adc [$FF.b],Y		; 77 FF
	cmp [$FF.b]		; C7 FF
	sta [$FF.b]		; 87 FF
	ora [$FF.b]		; 07 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	brk $00.b		; 00 00
	bit $FC00.w,X		; 3C 00 FC
	sec		; 38
	jsr ($FC78.w,X)		; FC 78 FC
	sed		; F8
	jsr ($03F8.w,X)		; FC F8 03
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	sbc $0CFFFF.l,X		; FF FF FF 0C
	asl $1E1E.w,X		; 1E 1E 1E
	bpl  30.b		; 10 1E
	cpx #$00FE.w		; E0 FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	asl $1E1E.w,X		; 1E 1E 1E
	clc		; 18
	asl $FEE0.w,X		; 1E E0 FE
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($01.b,X)		; 01 01
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvs  79.b		; 70 4F
	sei		; 78
	adc [$7C.b]		; 67 7C
	adc ($80.b,S),Y		; 73 80
	adc $709F60.l,X		; 7F 60 9F 70
	sta $03700F.l		; 8F 0F 70 03
	trb $007F.w		; 1C 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	ora $FE0200.l,X		; 1F 00 02 FE
	ora $FB.b,S		; 03 FB
	ora [$FF.b]		; 07 FF
	ora [$E7.b],Y		; 17 E7
	ora [$E7.b],Y		; 17 E7
	ora [$E7.b],Y		; 17 E7
	ora [$E7.b],Y		; 17 E7
	cmp [$27.b],Y		; D7 27
	inc $FB01.w,X		; FE 01 FB
	ora [$FF.b]		; 07 FF
	ora [$F7.b]		; 07 F7
	ora $F70FF7.l		; 0F F7 0F F7
	ora $F70FF7.l		; 0F F7 0F F7
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $C0F0EF.l,X		; FF EF F0 C0
	cpx #$805D.w		; E0 5D 80
	stx $0C.b,Y		; 96 0C
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	ora $7E41F0.l		; 0F F0 41 7E
	bne -33.b		; D0 DF
	tsx		; BA
	tda		; 7B
	and $C71D.w		; 2D 1D C7
	ora $FF07EF.l		; 0F EF 07 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -33.b		; 80 DF
	cpx #$FCFB.w		; E0 FB FC
	sbc $FFFE.w,X		; FD FE FF
	sbc $A7FFFF.l,X		; FF FF FF A7
	cpy #$E0C0.w		; C0 C0 E0
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $1E2E0F.l,X		; 9F 0F 2E 1E
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	cpy #$F807.w		; C0 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $DFC000.l,X		; FF 00 C0 DF
	cpy #$00DF.w		; C0 DF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	cpx #$E0DF.w		; E0 DF E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF00F0.l		; 0F F0 00 FF
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
	cop $3F.b		; 02 3F
	.db $82, $02, $FF		; 82 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	ora ($C2.b,X)		; 01 C2
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$FF00.w		; C0 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$3FC0.w		; C0 C0 3F
	and $87FCFC.l,X		; 3F FC FC 87
	sbc $000700.l,X		; FF 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $01.b,S		; 03 01
	sbc $00.b,S		; E3 00
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $E3.b,S		; 03 E3
	sbc $FF.b,S		; E3 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	cpy #$FFFF.w		; C0 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000F00.l,X		; FF 00 0F 00
	beq -16.b		; F0 F0
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra -128.b		; 80 80
	beq -16.b		; F0 F0
	asl $07DE.w,X		; 1E DE 07
	and [$07.b],Y		; 37 07
	ora [$02.b]		; 07 02
	ora $06.b,S		; 03 06
	ora [$0F.b],Y		; 17 0F
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	brk $38.b		; 00 38
	brk $0E.b		; 00 0E
	asl $0F0F.w		; 0E 0F 0F
	ora $FFFF1F.l,X		; 1F 1F FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F0C0.w		; C0 C0 F0
	sed		; F8
	adc $F308FF.l		; 6F FF 08 F3
	pei ($E7.b)		; D4 E7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $90.b		; 00 90
	brk $FF.b		; 00 FF
	bra  -8.b		; 80 F8
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	cop $7F.b		; 02 7F
	cop $FF.b		; 02 FF
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $38FD00.l,X		; FF 00 FD 38
	sbc $38.b,X		; F5 38
	plx		; FA
	bmi  -5.b		; 30 FB
	bmi  -6.b		; 30 FA
	and ($7A.b),Y		; 31 7A
	lda ($32.b),Y		; B1 32
	sed		; F8
	sbc $38.b,X		; F5 38
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cpy #$00C0.w		; C0 C0 00
	bra -128.b		; 80 80
	bvs   0.b		; 70 00
	inc $0700.w,X		; FE 00 07
	sed		; F8
	brk $B3.b		; 00 B3
	jmp ($F3F2.w,X)		; 7C F2 F3
	cpy #$80C0.w		; C0 C0 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $7C.b		; 00 7C
	bra  15.b		; 80 0F
	bvs -125.b		; 70 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	jsr ($9300.w,X)		; FC 00 93
	bra -121.b		; 80 87
	stx $CB.b		; 86 CB
	lsr $3094.w		; 4E 94 30
	stx $30.b,Y		; 96 30
	adc $0000.w,Y		; 79 00 00
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFB7.l,X		; FF B7 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F3C3E.l,X		; FF 3E 3C 3F
	bit $3C3F.w,X		; 3C 3F 3C
	adc $7BBA3C.l,X		; 7F 3C BA 7B
	bvs -16.b		; 70 F0
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$F8FF.w		; C0 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FCFBF8.l,X		; FF F8 FB FC
	beq -16.b		; F0 F0
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$C000.w		; C0 00 C0
	brk $78.b		; 00 78
	bra   7.b		; 80 07
	brk $3F.b		; 00 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00C000.l,X		; FF 00 C0 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sed		; F8
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$1080.w		; E0 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
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
	brk $0F.b		; 00 0F
	sbc $02FE07.l,X		; FF 07 FE 02
	ora $02F0.w		; 0D F0 02
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($1F.b,X)		; 01 1F
	ora ($0F.b,S),Y		; 13 0F
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	ldy #$A03F.w		; A0 3F A0
	adc $21FE20.l,X		; 7F 20 FE 21
	sbc $8FF743.l,X		; FF 43 F7 8F
	sbc $D89E.w		; ED 9E D8
	bit $00FF.w,X		; 3C FF 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $FF001F.l,X		; FF 1F 00 FF
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
	sec		; 38
	jsr ($1C1E.w,X)		; FC 1E 1C
	ora $071E.w,X		; 1D 1E 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	and $1F1F1F.l,X		; 3F 1F 1F 1F
	ora $030707.l,X		; 1F 07 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $837D.w,X		; FE 7D 83
	brk $01.b		; 00 01
	inc $DA00.w		; EE 00 DA
	rts		; 60

	stz $6E.b		; 64 6E
	ora $0E.b		; 05 0E
	ora $04.b		; 05 04
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $EFC0FC.l,X		; FF FC C0 EF
	beq -40.b		; F0 D8
	bne -65.b		; D0 BF
	sei		; 78
	adc [$30.b],Y		; 77 30
	adc $3C3B38.l,X		; 7F 38 3B 3C
	and $00FF3C.l,X		; 3F 3C FF 00
	sbc $E0DFC0.l,X		; FF C0 DF E0
	sbc $F8F7F0.l,X		; FF F0 F7 F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	jmp ($007C.w,X)		; 7C 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $007C7C.l,X		; FF 7C 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $F0FF00.l,X		; 3F 00 FF F0
	beq  -2.b		; F0 FE
	rol $07FF.w,X		; 3E FF 07
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00C100.l		; 0F 00 C1 00
	sed		; F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $15.b		; 00 15
	bra  84.b		; 80 54
	brk $B7.b		; 00 B7
	lsr $DC.b		; 46 DC
	sbc $DCFFB9.l,X		; FF B9 FF DC
	sbc $000400.l,X		; FF 00 04 00
	brk $C9.b		; 00 C9
	sbc $02FFDC.l,X		; FF DC FF 02
	tsb $00.b		; 04 00
	brk $D9.b		; 00 D9
	sbc $04FFDC.l,X		; FF DC FF 04
	tsb $00.b		; 04 00
	brk $E9.b		; 00 E9
	sbc $06FFDC.l,X		; FF DC FF 06
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $08FFDC.l,X		; FF DC FF 08
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $DC.b		; 00 DC
	sbc $00040A.l,X		; FF 0A 04 00
	brk $19.b		; 00 19
	brk $DC.b		; 00 DC
	sbc $00040C.l,X		; FF 0C 04 00
	brk $29.b		; 00 29
	brk $DC.b		; 00 DC
	sbc $00040E.l,X		; FF 0E 04 00
	brk $39.b		; 00 39
	brk $DC.b		; 00 DC
	sbc $000420.l,X		; FF 20 04 00
	brk $B7.b		; 00 B7
	sbc $22FFEC.l,X		; FF EC FF 22
	tsb $00.b		; 04 00
	brk $C7.b		; 00 C7
	sbc $24FFEC.l,X		; FF EC FF 24
	tsb $00.b		; 04 00
	brk $D7.b		; 00 D7
	sbc $26FFEC.l,X		; FF EC FF 26
	tsb $00.b		; 04 00
	brk $E7.b		; 00 E7
	sbc $28FFEC.l,X		; FF EC FF 28
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $2AFFEC.l,X		; FF EC FF 2A
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $EC.b		; 00 EC
	sbc $00042C.l,X		; FF 2C 04 00
	brk $17.b		; 00 17
	brk $EC.b		; 00 EC
	sbc $00042E.l,X		; FF 2E 04 00
	brk $27.b		; 00 27
	brk $EC.b		; 00 EC
	sbc $000440.l,X		; FF 40 04 00
	brk $37.b		; 00 37
	brk $EC.b		; 00 EC
	sbc $000442.l,X		; FF 42 04 00
	brk $CA.b		; 00 CA
	sbc $44FFFC.l,X		; FF FC FF 44
	tsb $00.b		; 04 00
	brk $22.b		; 00 22
	brk $FC.b		; 00 FC
	sbc $000446.l,X		; FF 46 04 00
	brk $32.b		; 00 32
	brk $FC.b		; 00 FC
	sbc $000448.l,X		; FF 48 04 00
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
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $70.b		; 00 70
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $08.b		; 00 08
	ora ($43.b,X)		; 01 43
	ora $007D15.l		; 0F 15 7D 00
	sbc $000700.l,X		; FF 00 07 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $71.b		; 00 71
	brk $8D.b		; 00 8D
	ora $00.b,S		; 03 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	ora [$61.b]		; 07 61
	cmp $0504.w,X		; DD 04 05
	cpx #$1FF3.w		; E0 F3 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $07.b		; 00 07
	brk $FB.b		; 00 FB
	brk $3D.b		; 00 3D
	cop $06.b		; 02 06
	sed		; F8
	jsr ($00C0.w,X)		; FC C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	sbc $1D3F83.l,X		; FF 83 3F 1D
	jsr ($FAFE.w,X)		; FC FE FA
	wai		; CB
	cmp $00.b,S		; C3 00
	sbc $F80007.l,X		; FF 07 00 F8
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	ora ($3B.b,X)		; 01 3B
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	sbc $05FFFE.l,X		; FF FE FF 05
	sbc $A32F69.l,X		; FF 69 2F A3
	lda $68FFD6.l,X		; BF D6 FF 68
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $E3.b		; 00 E3
	bpl -73.b		; 10 B7
	adc ($EF.b,X)		; 61 EF
	cmp [$9F.b]		; C7 9F
	ora $0F0000.l		; 0F 00 00 0F
	sbc $7FFF5F.l,X		; FF 5F FF 7F
	sbc $8FFFEF.l,X		; FF EF FF 8F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $00FF02.l,X		; FF 02 FF 00
	brk $39.b		; 00 39
	brk $F9.b		; 00 F9
	bmi  -7.b		; 30 F9
	beq  -7.b		; F0 F9
	beq  -7.b		; F0 F9
	beq  -7.b		; F0 F9
	beq   7.b		; F0 07
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $0C.b		; 00 0C
	asl $3F3E.w,X		; 1E 3E 3F
	and ($3F.b),Y		; 31 3F
	cpx #$00FF.w		; E0 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	asl $3F3F.w,X		; 1E 3F 3F
	and $E03F.w,Y		; 39 3F E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$F0E0.w		; E0 E0 F0
	sbc $01FFE7.l,X		; FF E7 FF 01
	asl $00.b		; 06 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	beq 112.b		; F0 70
	ror $CF2E.w,X		; 7E 2E CF
	ora [$3B.b]		; 07 3B
	ora ($06.b,X)		; 01 06
	ora ($20.b,X)		; 01 20
	jsr $0060.w		; 20 60 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $3C.b		; 00 3C
	brk $07.b		; 00 07
	brk $21.b		; 00 21
	and ($61.b,X)		; 21 61
	adc ($00.b,X)		; 61 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F8C0.w		; C0 C0 F8
	sei		; 78
	adc $827B43.l,X		; 7F 43 7B 82
	ldy $0000.w,X		; BC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr ($7FC0.w,X)		; FC C0 7F
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	xce		; FB
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
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
	ora $001F00.l		; 0F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	bra  31.b		; 80 1F
	cpy #$7F1F.w		; C0 1F 7F
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
	brk $F8.b		; 00 F8
	ora [$00.b]		; 07 00
	sbc $FFFF01.l,X		; FF 01 FF FF
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
	brk $00.b		; 00 00
	sbc $7F8000.l,X		; FF 00 80 7F
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $00FF7F.l,X		; 7F 7F FF 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $1F18.w,X		; FE 18 1F
	plx		; FA
	xce		; FB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FCFBE0.l,X		; 1F E0 FB FC
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E01F00.l,X		; FF 00 1F E0
	cpy #$FF00.w		; C0 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $803F00.l,X		; FF 00 3F 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $04.b		; 00 04
	sbc $04FF04.l,X		; FF 04 FF 04
	sbc $FF0404.l,X		; FF 04 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $04.b		; 04 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	and $000000.l,X		; 3F 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	jsr ($0303.w,X)		; FC 03 03
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and ($63.b,X)		; 21 63
	ora ($E3.b,X)		; 01 E3
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	cop $1D.b		; 02 1D
	sbc ($00.b,X)		; E1 00
	inc $FF00.w,X		; FE 00 FF
	brk $63.b		; 00 63
	adc $E3.b,S		; 63 E3
	sbc $1F.b,S		; E3 1F
	ora $E30203.l,X		; 1F 03 02 E3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	adc $3EFFF1.l,X		; 7F F1 FF 3E
	sbc $13FBF9.l,X		; FF F9 FB 13
	sbc $DB25.w		; ED 25 DB
	asl $3B.b		; 06 3B
	phb		; 8B
	asl $FF.b		; 06 FF
	sed		; F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $00F330.l,X		; FF 30 F3 00
	sbc [$00.b]		; E7 00
	cmp [$00.b]		; C7 00
	sbc $9B4600.l,X		; FF 00 46 9B
	asl $A0E0.w,X		; 1E E0 A0
	and $FF00F8.l,X		; 3F F8 00 FF
	brk $F9.b		; 00 F9
	ora [$ED.b]		; 07 ED
	ora $6F8F.w,X		; 1D 8F 6F
	jsr ($FF00.w,X)		; FC 00 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	ora $EF.b,S		; 03 EF
	ora $60E000.l,X		; 1F 00 E0 60
	bvs   0.b		; 70 00
	inc $7F40.w,X		; FE 40 7F
	xce		; FB
	ora $E7.b,S		; 03 E7
	sed		; F8
	sbc $FDEE.w		; ED EE FD
	sbc $0000.w,X		; FD 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $EF.b		; 00 EF
	beq  -3.b		; F0 FD
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra  -8.b		; 80 F8
	bcs  63.b		; B0 3F
	inc $BD0F.w		; EE 0F BD
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
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
	brk $3C.b		; 00 3C
	and $3C.b,S		; 23 3C
	and ($3F.b,S),Y		; 33 3F
	and $703FC0.l,X		; 3F C0 3F 70
	sta $0FC738.l		; 8F 38 C7 0F
	bvs   7.b		; 70 07
	sec		; 38
	and $003F00.l,X		; 3F 00 3F 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $003F00.l,X		; 7F 00 3F 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	inc $05FE.w,X		; FE FE 05
	sbc $F905.w,Y		; F9 05 F9
	ora $F9.b		; 05 F9
	ora $F9.b		; 05 F9
	cmp $39.b		; C5 39
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FD01.w,X		; FE 01 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora $BF.b,S		; 03 BF
	lda $FA7F7E.l,X		; BF 7E 7F FA
	jsr ($F8F4.w,X)		; FC F4 F8
	sbc #$EAF0.w		; E9 F0 EA
	beq -45.b		; F0 D3
	cpx #$E0D4.w		; E0 D4 E0
	lda $FF7F7F.l,X		; BF 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $07F9FF.l,X		; FF FF F9 07
	and ($00.b,X)		; 21 00
	jmp.w [$6A00]		; DC 00 6A
	cpy #$CEC5.w		; C0 C5 CE
	adc $0E04EE.l		; 6F EE 04 0E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	cmp ($FE.b,X)		; C1 FE
	bne -33.b		; D0 DF
	stz $F7.b,X		; 74 F7
	tyx		; BB
	tda		; 7B
	ply		; 7A
	tsa		; 3B
	jmp $1DAD3D.l		; 5C 3D AD 1D
	ldx $FF1E.w		; AE 1E FF
	bra -33.b		; 80 DF
	cpx #$F8F7.w		; E0 F7 F8
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	sbc $FDFE.w,X		; FD FE FD
	inc $FFFE.w,X		; FE FE FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $FFFF80.l,X		; 7F 80 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpx #$C0FF.w		; E0 FF C0
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$C0FF.w		; E0 FF C0
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FF01.w,X		; FE 01 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra -65.b		; 80 BF
	cpy #$4040.w		; C0 40 40
	adc $FF7FC0.l,X		; 7F C0 7F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000F00.l,X		; FF 00 0F 00
	beq   0.b		; F0 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sta $00FF80.l		; 8F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01F700.l,X		; FF 00 F7 01
	inc $FF01.w,X		; FE 01 FF
	cop $FB.b		; 02 FB
	asl $FD.b		; 06 FD
	asl $FF.b		; 06 FF
	tsb $F7.b		; 04 F7
	tsb $0CFB.w		; 0C FB 0C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$17.b]		; E7 17
	dec $9A2F.w		; CE 2F 9A
	jmp $BB78F5.l		; 5C F5 78 BB
	bmi 106.b		; 30 6A
	beq  99.b		; F0 63
	beq -12.b		; F0 F4
	cpx #$0FF7.w		; E0 F7 0F
	sbc $3FDF1F.l		; EF 1F DF 3F
	sbc $7FBF3F.l,X		; FF 3F BF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00007F.l,X		; FF 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra  -8.b		; 80 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $0D81.w,X		; 7D 81 0D
	sbc ($01.b),Y		; F1 01
	adc $1D01.w,X		; 7D 01 1D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FD03.w,X		; FD 03 FD
	ora $7D.b,S		; 03 7D
	ora $1D.b,S		; 03 1D
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D5.b		; 00 D5
	sbc $D7.b,S		; E3 D7
	sbc $D5.b,S		; E3 D5
	sbc $D5.b,S		; E3 D5
	cpx #$F0EB.w		; E0 EB F0
	xba		; EB
	beq 116.b		; F0 74
	sei		; 78
	dec A		; 3A
	bit $FFFF.w,X		; 3C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	and $00A23F.l,X		; 3F 3F A2 00
	lda ($87.b)		; B2 87
	and [$87.b]		; 27 87
	lsr A		; 4A
	eor $7B3025.l		; 4F 25 30 7B
	bmi  24.b		; 30 18
	bvs   1.b		; 70 01
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFB7.l,X		; FF B7 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $AFFFFF.l,X		; FF FF FF AF
	ora $AF1FAF.l,X		; 1F AF 1F AF
	ora $5F1F2F.l,X		; 1F 2F 1F 5F
	and $F83F7F.l,X		; 3F 7F 3F F8
	sei		; 78
	bvs -16.b		; 70 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	adc $7C3FF0.l,X		; 7F F0 3F 7C
	sta $0FC738.l,X		; 9F 38 C7 0F
	beq   0.b		; F0 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sei		; 78
	sbc $1CFF30.l,X		; FF 30 FF 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	jsr ($FE01.w,X)		; FC 01 FE
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $63.b,X		; 75 63
	adc [$63.b],Y		; 77 63
	adc $63.b,X		; 75 63
	adc $70.b		; 65 70
	rtl		; 6B

	bvs 123.b		; 70 7B
	bvs  56.b		; 70 38
	bit $3C3E.w,X		; 3C 3E 3C
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $7F7FFF.l,X		; 7F FF 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	sbc $01FEFF.l,X		; FF FF FE 01
	and $EE00.w,Y		; 39 00 EE
	brk $53.b		; 00 53
	cpx #$E6E5.w		; E0 E5 E6
	eor [$E6.b]		; 47 E6
	tsb $06.b		; 04 06
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $E8E7D0.l,X		; DF D0 E7 E8
	lda ($74.b,S),Y		; B3 74
	eor $1A393C.l,X		; 5F 3C 39 1A
	and $1C8D1E.l		; 2F 1E 8D 1C
	stz $DF0D.w		; 9C 0D DF
	cpx #$F0EF.w		; E0 EF F0
	sbc [$F8.b],Y		; F7 F8
	sbc $FCFBF8.l,X		; FF F8 FB FC
	sbc $FEFDFC.l,X		; FF FC FD FE
	sbc $ECFE.w,X		; FD FE EC
	ora $FF01F1.l		; 0F F1 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpy #$F880.w		; C0 80 F8
	cld		; D8
	asl $0FEC.w,X		; 1E EC 0F
	cpx $F60F.w		; EC 0F F6
	ora [$F6.b]		; 07 F6
	ora [$38.b]		; 07 38
	and $000000.l,X		; 3F 00 00 00
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $F7.b		; 00 F7
	sed		; F8
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $0F0F3F.l,X		; 3F 3F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FEFE1F.l		; EF 1F FE FE
	jsr ($F0FC.w,X)		; FC FC F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFEFE.l,X		; FF FE FE FC
	jsr ($F0F0.w,X)		; FC F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$F8.b],Y		; F7 F8
	adc $1F1F7F.l,X		; 7F 7F 1F 1F
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	ora $07071F.l,X		; 1F 1F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF1F.l		; EF 1F FF FF
	jsr ($E0FC.w,X)		; FC FC E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($E0FC.w,X)		; FC FC E0
	cpx #$0000.w		; E0 00 00
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
	ora ($80.b)		; 12 80
	tsx		; BA
	sta [$17.b]		; 87 17
	sta [$42.b]		; 87 42
	eor [$15.b]		; 47 15
	sec		; 38
	tda		; 7B
	sec		; 38
	inc $0100.w,X		; FE 00 01
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFBF.l,X		; FF BF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $9FFFFF.l,X		; FF FF FF 9F
	ora $9F0F9F.l		; 0F 9F 0F 9F
	ora $2F1F8F.l		; 0F 8F 1F 2F
	ora $B81F3F.l,X		; 1F 3F 1F B8
	sei		; 78
	bvs -16.b		; 70 F0
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	bra  31.b		; 80 1F
	sta $1FDF60.l,X		; 9F 60 DF 1F
	xce		; FB
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	dey		; 88
	brk $F0.b		; 00 F0
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F3.b		; 00 F3
	tsb $FFF7.w		; 0C F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $FB.b		; 00 FB
	sbc $000403.l,X		; FF 03 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	tya		; 98
	adc $3C2F3C.l,X		; 7F 3C 2F 3C
	bit $18.b,X		; 34 18
	clc		; 18
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3CFF18.l,X		; FF 18 FF 3C
	and $3C3C3C.l,X		; 3F 3C 3C 3C
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	plp		; 28
	plp		; 28
	brk $0C.b		; 00 0C
	cpy #$EF10.w		; C0 10 EF
	bpl  31.b		; 10 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $3F.b		; 00 3F
	brk $F8.b		; 00 F8
	plp		; 28
	jsr ($FF0C.w,X)		; FC 0C FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  60.b		; 80 3C
	brk $FF.b		; 00 FF
	tsb $FEFF.w		; 0C FF FE
	ora $1A1EF6.l,X		; 1F F6 1E 1A
	tsb $C00C.w		; 0C 0C C0
	brk $B8.b		; 00 B8
	bra  -2.b		; 80 FE
	brk $FF.b		; 00 FF
	tsb $1EFF.w		; 0C FF 1E
	sbc $1E1E1E.l,X		; FF 1E 1E 1E
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	bpl -10.b		; 10 F6
	sbc $F6FFEE.l,X		; FF EE FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $F6.b		; 00 F6
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000403.l,X		; FF 03 04 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000404.l,X		; FF 04 04 00
	brk $F2.b		; 00 F2
	sbc $05FFFE.l,X		; FF FE FF 05
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $FE.b		; 00 FE
	sbc $000406.l,X		; FF 06 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FA.b]		; 07 FA
	sbc $394C.w,X		; FD 4C 39
	trb $000A.w		; 1C 0A 00
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora $1F0F7F.l		; 0F 7F 0F 1F
	ora $020303.l		; 0F 03 03 02
	cop $FF.b		; 02 FF
	sbc $FF03FF.l,X		; FF FF 03 FF
	ora ($FF.b,X)		; 01 FF
	sbc $80FF81.l,X		; FF 81 FF 80
	sbc $FF0000.l,X		; FF 00 00 FF
	cop $01.b		; 02 01
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -2.b		; 80 FE
	inc $4343.w,X		; FE 43 43
	brk $E2.b		; 00 E2
	inc $FFFF.w,X		; FE FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $40.b		; 00 40
	rti		; 40

.ACCU 8
	sep #$E2		; E2 E2
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bvs 112.b		; 70 70
	stz $FF8E.w,X		; 9E 8E FF
	sta $B6EB.w,X		; 9D EB B6
	sbc $EA.b,S		; E3 EA
	and [$E2.b],Y		; 37 E2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	beq   0.b		; F0 00
	inc $FF1C.w,X		; FE 1C FF
	rol $3EFF.w,X		; 3E FF 3E
	sbc $00003E.l,X		; FF 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$2060.w		; E0 60 20
	cpx #$40C0.w		; E0 C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $98.b		; 00 98
	iny		; C8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tay		; A8
	cld		; D8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc ($0B.b,S),Y		; F3 0B
	sed		; F8
	sbc $F8FFF3.l,X		; FF F3 FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $01.b		; 00 01
	ora [$03.b]		; 07 03
	ora $FE7D82.l,X		; 1F 82 7D FE
	brk $28.b		; 00 28
	cmp [$7F.b],Y		; D7 7F
	tda		; 7B
	sei		; 78
	sei		; 78
	bmi  48.b		; 30 30
	asl $FC00.w,X		; 1E 00 FC
	brk $7C.b		; 00 7C
	sbc $FF00FF.l,X		; FF FF 00 FF
	plp		; 28
	adc $78787C.l,X		; 7F 7C 78 78
	bmi  48.b		; 30 30
	cpy #$84C0.w		; C0 C0 84
	bra -100.b		; 80 9C
	sty $9B.b		; 84 9B
	ldy $6F7C.w,X		; BC 7C 6F
	bit $7CC7.w,X		; 3C C7 7C
	jmp ($3838.w)		; 6C 38 38
	and $047E00.l,X		; 3F 00 7E 04
	adc $187F00.l,X		; 7F 00 7F 18
	lda $3CFF3C.l,X		; BF 3C FF 3C
	jmp ($387C.w,X)		; 7C 7C 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E720.w		; 20 20 E7
	rol $FF.b		; 26 FF
	adc $F91F.w,Y		; 79 1F F9
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	cpx #$3C00.w		; E0 00 3C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	ora $060FFF.l		; 0F FF 0F 06
	asl $00.b		; 06 00
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
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $EE.b		; 00 EE
	asl $FFF6.w		; 0E F6 FF
	inc $F6FF.w		; EE FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $F6.b		; 00 F6
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F6.b		; 00 F6
	sbc $000403.l,X		; FF 03 04 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000404.l,X		; FF 04 04 00
	brk $F0.b		; 00 F0
	sbc $05FFFE.l,X		; FF FE FF 05
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $06FFFE.l,X		; FF FE FF 06
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $FE.b		; 00 FE
	sbc $000407.l,X		; FF 07 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FFBF40.l		; 0F 40 BF FF
	brk $1F.b		; 00 1F
	adc $3F6D12.l,X		; 7F 12 6D 3F
	rol $00.b,X		; 36 00
	brk $07.b		; 00 07
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	sbc $7F00FF.l,X		; FF FF 00 7F
	rts		; 60

	adc $3F3F12.l,X		; 7F 12 3F 3F
	asl $3C1E.w		; 0E 1E 3C
	sbc $F0F0.w,X		; FD F0 F0
	cmp ($30.b,S),Y		; D3 30
	cmp [$13.b],Y		; D7 13
	sta $EC0EFE.l,X		; 9F FE 0E EC
	sbc $FF.b		; E5 FF
	and ($00.b),Y		; 31 00
	cmp $00.b,S		; C3 00
	ora $E00F00.l		; 0F 00 0F E0
	sbc $63FF03.l		; EF 03 FF 63
	sbc [$07.b],Y		; F7 07
	inc $0007.w,X		; FE 07 00
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	jsr $20A0.w		; 20 A0 20
	sbc $FEFFA0.l,X		; FF A0 FF FE
	cmp $7B.b		; C5 7B
	cpy #$FF7F.w		; C0 7F FF
	brk $F0.b		; 00 F0
	jsr $00FF.w		; 20 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $0000C0.l,X		; FF C0 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	stx $FE8C.w		; 8E 8C FE
	txy		; 9B
	sed		; F8
	sbc [$76.b],Y		; F7 76
	plx		; FA
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	asl $1EFF.w		; 0E FF 1E
	inc $003E.w,X		; FE 3E 00
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $78EC.w		; EC EC 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($78FC.w,X)		; FC FC 78
	sei		; 78
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
	brk $E0.b		; 00 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	brk $0A.b		; 00 0A
	brk $E8.b		; 00 E8
	ora ($F4.b),Y		; 11 F4
	sbc $F6000A.l,X		; FF 0A 00 F6
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $000401.l,X		; FF 01 04 00
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	sbc $000402.l,X		; FF 02 04 00
	brk $FA.b		; 00 FA
	sbc $03FFF4.l,X		; FF F4 FF 03
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $04FFFC.l,X		; FF FC FF 04
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $05FFF4.l,X		; FF F4 FF 05
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $06FFFC.l,X		; FF FC FF 06
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $07FFF5.l,X		; FF F5 FF 07
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $08FFFD.l,X		; FF FD FF 08
	tsb $00.b		; 04 00
	brk $E2.b		; 00 E2
	sbc $09FFF6.l,X		; FF F6 FF 09
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	cli		; 58
	ldy $ECAC.w,X		; BC AC EC
	lda [$F7.b],Y		; B7 F7
	cpx $3CEC.w		; EC EC 3C
	sei		; 78
	sed		; F8
	cpx #$F800.w		; E0 00 F8
	brk $FE.b		; 00 FE
	clc		; 18
	sbc $3CFF3C.l,X		; FF 3C FF 3C
	sbc $3CFC3C.l,X		; FF 3C FC 3C
	sed		; F8
	sei		; 78
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	jsr ($8102.w,X)		; FC 02 81
	sta ($81.b,X)		; 81 81
	sta ($F8.b,X)		; 81 F8
	rti		; 40

	adc $FFFFC0.l,X		; 7F C0 FF FF
	jsr ($0300.w,X)		; FC 00 03
	bra  -1.b		; 80 FF
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	sed		; F8
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	jsr $05C6.w		; 20 C6 05
	ora ($E0.b,X)		; 01 E0
	brk $7C.b		; 00 7C
	beq  -9.b		; F0 F7
	sed		; F8
	sed		; F8
	sta $FF4FAF.l,X		; 9F AF 4F FF
	brk $FF.b		; 00 FF
	stx $FF.b		; 86 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rts		; 60

	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $2FD8F8.l,X		; FF F8 D8 2F
	plp		; 28
	eor $F098D8.l		; 4F D8 98 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $F8F8F8.l,X		; FF F8 F8 F8
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	ora [$1F.b]		; 07 1F
	sbc $68FCFC.l,X		; FF FC FC 68
	tya		; 98
	rtl		; 6B

	tya		; 98
	xce		; FB
	sed		; F8
	ora $01.b,S		; 03 01
	phd		; 0B
	sbc ($3F.b),Y		; F1 3F
	brk $E0.b		; 00 E0
	brk $03.b		; 00 03
	brk $87.b		; 00 87
	beq -121.b		; F0 87
	beq  -9.b		; F0 F7
	cpx #$01FF.w		; E0 FF 01
	sbc $79FF01.l,X		; FF 01 FF 79
	sbc $0303FF.l,X		; FF FF 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF81.l,X		; FF 81 FF FF
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	brk $3F.b		; 00 3F
	cpy #$C07F.w		; C0 7F C0
	adc $008080.l,X		; 7F 80 80 00
	brk $63.b		; 00 63
	stz $4E7F.w		; 9C 7F 4E
	ora $00FF00.l,X		; 1F 00 FF 00
	adc $BF7FBF.l,X		; 7F BF 7F BF
	bra  -1.b		; 80 FF
	sbc $63FF00.l,X		; FF 00 FF 63
	adc $7F7F31.l,X		; 7F 31 7F 7F
	rol $1C3E.w,X		; 3E 3E 1C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $3E3E7F.l,X		; 7F 7F 3E 3E
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $01.b		; 02 01
	cop $03.b		; 02 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $03.b,S		; 03 03
	ora ($03.b,X)		; 01 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode 00 overrunning bank boundry at 0DFFFF. Skipping.
.ENDS
