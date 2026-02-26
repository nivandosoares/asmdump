.BANK 21 SLOT 0
.ORG $0000

.SECTION "Bank21" FORCE

	asl $3880.w		; 0E 80 38
	brk $EA.b		; 00 EA
	ora $B5.b,X		; 15 B5
	tsb $F5.b		; 04 F5
	sbc $00FFB5.l,X		; FF B5 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	lda $FF.b,X		; B5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp $FF.b		; C5 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp $FF.b		; C5 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp $FF.b		; C5 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	nop		; EA
	sbc $0AFFD5.l,X		; FF D5 FF 0A
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $0CFFD5.l,X		; FF D5 FF 0C
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $D5.b		; 00 D5
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EB.b		; 00 EB
	sbc $20FFE5.l,X		; FF E5 FF 20
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $22FFE5.l,X		; FF E5 FF 22
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $E5.b		; 00 E5
	sbc $000C24.l,X		; FF 24 0C 00
	brk $EF.b		; 00 EF
	sbc $26FFF5.l,X		; FF F5 FF 26
	tsb $0000.w		; 0C 00 00
	sbc $FFF5FF.l,X		; FF FF F5 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	ora $FFF500.l		; 0F 00 F5 FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	brk $01.b		; 00 01
	rti		; 40

	adc $717F40.l,X		; 7F 40 7F 71
	ror $3E3F.w,X		; 7E 3F 3E
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $CF.b		; 00 CF
	ora $FC.b,S		; 03 FC
	asl $0CB0.w		; 0E B0 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $00DD02.l,X		; FF 02 DD 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $38FF00.l		; CF 00 FF 38
	stx $3C.b		; 86 3C
	cmp $03.b,S		; C3 03
	jsr ($7DA2.w,X)		; FC A2 7D
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	ora ($06.b,X)		; 01 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $1F1C1F.l,X		; 1F 1F 1C 1F
	brk $1F.b		; 00 1F
	ora ($06.b,X)		; 01 06
	brk $06.b		; 00 06
	ora ($01.b,X)		; 01 01
	ora $F9FE1F.l,X		; 1F 1F FE F9
	rts		; 60

	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	jsl $816EC1.l		; 22 C1 6E 81
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $9EF00F.l,X		; FF 0F F0 9E
	sbc $FFFC.w,X		; FD FC FF
	sbc [$0F.b],Y		; F7 0F
	rol $11DD.w,X		; 3E DD 11
	inc $FD02.w,X		; FE 02 FD
	asl $4FF1.w		; 0E F1 4F
	bcs   0.b		; B0 00
	sta ($00.b,X)		; 81 00
	ora $077F00.l,X		; 1F 00 7F 07
	sed		; F8
	sec		; 38
	ora [$00.b]		; 07 00
	lda $00BD02.l,X		; BF 02 BD 00
	cmp ($7E.b,X)		; C1 7E
	sbc $8FFFE0.l,X		; FF E0 FF 8F
	beq 120.b		; F0 78
	sta [$C0.b]		; 87 C0
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $00C100.l,X		; FF 00 C1 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx $F000.w		; EC 00 F0
	brk $F0.b		; 00 F0
	cpy #$30.b		; C0 30
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $EC.b		; 00 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $7E.b		; 00 7E
	ora $00.b,S		; 03 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ror $017F.w,X		; 7E 7F 01
	adc $000003.l,X		; 7F 03 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $003300.l,X		; FF 00 33 00
	sbc $40030C.l,X		; FF 0C 03 40
	ora $0C3601.l,X		; 1F 01 36 0C
	sbc ($0C.b,S),Y		; F3 0C
	lda ($00.b,S),Y		; B3 00
	sbc $0F3300.l,X		; FF 00 33 0F
	beq  -4.b		; F0 FC
	sbc ($E0.b,S),Y		; F3 E0
	lda $00FFC8.l,X		; BF C8 FF 00
	sbc $00BF00.l,X		; FF 00 BF 00
	sbc $C8E31C.l,X		; FF 1C E3 C8
	and ($78.b,S),Y		; 33 78
	bra  72.b		; 80 48
	bcs -119.b		; B0 89
	ror $00.b,X		; 76 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	sbc ($FC.b,S),Y		; F3 FC
	ora $CC.b,S		; 03 CC
	and [$0F.b],Y		; 37 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	beq   0.b		; F0 00
	sbc $C7DF20.l,X		; FF 20 DF C7
	php		; 08
	ora [$E0.b]		; 07 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sec		; 38
	ora [$80.b]		; 07 80
	asl $FA.b		; 06 FA
	ora ($D2.b,X)		; 01 D2
	ora $0FC0.w		; 0D C0 0F
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	cmp [$F9.b]		; C7 F9
	adc $E03FC4.l,X		; 7F C4 3F E0
	and $DCFF00.l,X		; 3F 00 FF DC
	and $DB.b,S		; 23 DB
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora ($FE.b,X)		; 01 FE
	tsb $06F3.w		; 0C F3 06
	sbc $F803.w,Y		; F9 03 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$3F.b		; C0 3F
	jsr $04DF.w		; 20 DF 04
	xce		; FB
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	rts		; 60

	bcc -32.b		; 90 E0
	bpl -64.b		; 10 C0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $01241B.l,X		; FF 1B 24 01
	ror $7C03.w,X		; 7E 03 7C
	ora $03001F.l,X		; 1F 1F 00 03
	bit $0F3C.w,X		; 3C 3C 0F
	sbc $04FF00.l,X		; FF 00 FF 04
	tsa		; 3B
	ora ($7E.b,X)		; 01 7E
	brk $7F.b		; 00 7F
	tsb $0D13.w		; 0C 13 0D
	sta ($00.b)		; 92 00
	adc $407F00.l,X		; 7F 00 7F 40
	lda $6E08F7.l,X		; BF F7 08 6E
	sta ($CD.b),Y		; 91 CD
	and ($FC.b)		; 32 FC
	sbc $70.b,S		; E3 70
	sbc $80FF80.l		; EF 80 FF 80
	sbc $0758A7.l,X		; FF A7 58 07
	sed		; F8
	clc		; 18
	sbc [$3C.b]		; E7 3C
	cmp $E0.b,S		; C3 E0
	brk $00.b		; 00 00
	clc		; 18
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	rts		; 60

	stz $7E80.w,X		; 9E 80 7E
	jsr $80DC.w		; 20 DC 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	clc		; 18
	brk $F8.b		; 00 F8
	clc		; 18
	cpx #$E0.b		; E0 E0
	asl $7E80.w,X		; 1E 80 7E
	brk $FC.b		; 00 FC
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
	asl $F9.b		; 06 F9
	sec		; 38
	cmp [$00.b]		; C7 00
	adc $007900.l,X		; 7F 00 79 00
	ora ($00.b,X)		; 01 00
	ora $00110E.l,X		; 1F 0E 11 00
	adc $38C13E.l,X		; 7F 3E C1 38
	cmp [$00.b]		; C7 00
	adc $1E7F06.l,X		; 7F 06 7F 1E
	ora $1E001F.l,X		; 1F 1F 00 1E
	ora ($00.b,X)		; 01 00
	adc $18B34C.l,X		; 7F 4C B3 18
	sbc [$28.b]		; E7 28
	cmp ($60.b,S),Y		; D3 60
	sta [$00.b]		; 87 00
	sbc $04817E.l,X		; FF 7E 81 04
	lda ($04.b,S),Y		; B3 04
	xce		; FB
	eor $BC.b,S		; 43 BC
	ora $FC.b,S		; 03 FC
	ora $F8.b,S		; 03 F8
	ora $E4.b,S		; 03 E4
	ora $00FFE0.l,X		; 1F E0 FF 00
	ora [$B0.b]		; 07 B0
	asl $F9.b		; 06 F9
	brk $FF.b		; 00 FF
	eor ($BE.b,X)		; 41 BE
	cmp $03FC30.l		; CF 30 FC 03
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	cmp $3C.b,S		; C3 3C
	bvc -81.b		; 50 AF
	and ($CE.b),Y		; 31 CE
	cmp ($3E.b,X)		; C1 3E
	cpy #$3F.b		; C0 3F
	cpx #$1F.b		; E0 1F
	beq  15.b		; F0 0F
	jsr ($C303.w,X)		; FC 03 C3
	bit $BF40.w,X		; 3C 40 BF
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	sta [$78.b]		; 87 78
	ror $99.b		; 66 99
	bra 124.b		; 80 7C
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	rts		; 60

	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	and ($3F.b),Y		; 31 3F
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $1B.b		; 00 1B
	brk $7E.b		; 00 7E
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	and $007EC0.l,X		; 3F C0 7E 00
	rts		; 60

	ora [$43.b]		; 07 43
	ldy $1B00.w,X		; BC 00 1B
	ora ($7F.b,X)		; 01 7F
	asl $FF.b		; 06 FF
	tsb $00FF.w		; 0C FF 00
	sbc $87FE80.l,X		; FF 80 FE 87
	cpx #$3B.b		; E0 3B
	cpy $0E.b		; C4 0E
	beq -120.b		; F0 88
	bpl -64.b		; 10 C0
	brk $84.b		; 00 84
	rtl		; 6B

	brk $43.b		; 00 43
	bra  17.b		; 80 11
	inc A		; 1A
	sbc ($C8.b,X)		; E1 C8
	and [$49.b],Y		; 37 49
	lda [$67.b],Y		; B7 67
	sbc $12FF3F.l,X		; FF 3F FF 12
	sbc $7C3F.w,X		; FD 3F 7C
	adc $04FFEE.l,X		; 7F EE FF 04
	cmp $142B30.l		; CF 30 2B 14
	jmp ($4793.w)		; 6C 93 47
	sec		; 38
	ora $FC.b,S		; 03 FC
	cpx #$1F.b		; E0 1F
	bra  15.b		; 80 0F
	cpx #$03.b		; E0 03
	cpx #$00.b		; E0 00
	cpx #$DF.b		; E0 DF
	rts		; 60

	sta $00BFC0.l,X		; 9F C0 BF 00
	sbc $F01FE0.l,X		; FF E0 1F F0
	adc $EF1FFC.l,X		; 7F FC 1F EF
	ora $7F00FF.l		; 0F FF 00 7F
	bra 126.b		; 80 7E
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	brk $7F.b		; 00 7F
	brk $6F.b		; 00 6F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7E.b		; 00 7E
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	bra  -1.b		; 80 FF
	brk $6F.b		; 00 6F
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	tda		; 7B
	tda		; 7B
	sbc $E3.b,S		; E3 E3
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $070300.l		; 0F 00 03 07
	adc $67.b,S		; 63 67
	tda		; 7B
	sei		; 78
	brk $FF.b		; 00 FF
	brk $34.b		; 00 34
	brk $7F.b		; 00 7F
	.db $42, $BD		; 42 BD
	bra  28.b		; 80 1C
	ora ($C0.b,X)		; 01 C0
	ora ($01.b)		; 12 01
	ora $FF00F0.l		; 0F F0 00 FF
	wai		; CB
	sbc $C23D42.l,X		; FF 42 3D C2
	and $1F83.w,X		; 3D 83 1F
	rol $EDFF.w,X		; 3E FF ED
	inc $00FF.w,X		; FE FF 00
	ora ($24.b,X)		; 01 24
	ora ($02.b,X)		; 01 02
	eor $3802.w		; 4D 02 38
	cmp ($23.b,X)		; C1 23
	jmp $113CC3.l		; 5C C3 3C 11
	inc $0EF1.w		; EE F1 0E
	eor $FCFF7A.l,X		; 5F 7A FF FC
	sbc $C63FB0.l,X		; FF B0 3F C6
	sta $C03FE0.l,X		; 9F E0 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sta ($78.b,X)		; 81 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$41.b]		; 07 41
	sta ($87.b)		; 92 87
	brk $0F.b		; 00 0F
	brk $EF.b		; 00 EF
	bpl -10.b		; 10 F6
	ora #$81.b		; 09 81
	sei		; 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$CC.b]		; 07 CC
	ora $FB7FF8.l,X		; 1F F8 7F FB
	pea $3FC0.w		; F4 C0 3F
	cpy #$3F.b		; C0 3F
	brk $1F.b		; 00 1F
	brk $F3.b		; 00 F3
	trb $F060.w		; 1C 60 F0
	php		; 08
	beq   8.b		; F0 08
	cmp ($00.b,X)		; C1 00
	rol $8000.w,X		; 3E 00 80
	brk $80.b		; 00 80
	sta $80F300.l,X		; 9F 00 F3 80
	jsr ($F800.w,X)		; FC 00 F8
	brk $F8.b		; 00 F8
	cmp ($00.b,X)		; C1 00
	rol $0000.w,X		; 3E 00 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $03.b,S		; 03 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	cpx #$1C.b		; E0 1C
	cpx #$1C.b		; E0 1C
	cpx #$1C.b		; E0 1C
	cpx #$1C.b		; E0 1C
	cpx #$1C.b		; E0 1C
	cpx #$1C.b		; E0 1C
	cpx #$3C.b		; E0 3C
	cpy #$FC.b		; C0 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0300.w		; 0C 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F133F.l,X		; 3F 3F 13 1F
	tsb $000F.w		; 0C 0F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $30.b		; 00 30
	cmp $01FC03.l		; CF 03 FC 01
	ror $F00A.w,X		; 7E 0A F0
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	bmi -49.b		; 30 CF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	ora $FF.b		; 05 FF
	asl $781F.w,X		; 1E 1F 78
	adc $00FCE0.l,X		; 7F E0 FC 00
	brk $F0.b		; 00 F0
	ora $131CE3.l		; 0F E3 1C 13
	jmp ($3E01.w)		; 6C 01 3E
	ora ($BE.b,X)		; 01 BE
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	and $E01FD0.l		; 2F D0 1F E0
	lda $80BFD0.l		; AF D0 BF 80
	and $003F80.l,X		; 3F 80 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	sec		; 38
	cmp [$C0.b]		; C7 C0
	and $03FC.w,X		; 3D FC 03
	cmp $26C130.l		; CF 30 C1 26
	cpy #$31.b		; C0 31
	cpy #$38.b		; C0 38
	cpy #$18.b		; C0 18
	cpy #$3F.b		; C0 3F
	jsr ($FF01.w,X)		; FC 01 FF
	brk $C0.b		; 00 C0
	and $C027C0.l,X		; 3F C0 27 C0
	and ($C0.b),Y		; 31 C0
	sec		; 38
	cpy #$18.b		; C0 18
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	asl $FEF1.w		; 0E F1 FE
	brk $F0.b		; 00 F0
	asl $C038.w		; 0E 38 C0
	jsr $0040.w		; 20 40 00
	brk $00.b		; 00 00
	cpy #$1C.b		; C0 1C
	cpx #$FC.b		; E0 FC
	ora $00.b,S		; 03 00
	inc $FE00.w,X		; FE 00 FE
	brk $F8.b		; 00 F8
	brk $60.b		; 00 60
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
	sbc $6F6FFF.l,X		; FF FF 6F 6F
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $6F6FFF.l,X		; FF FF 6F 6F
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0E0EFF.l,X		; FF FF 0E 0E
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $000F00.l		; 0F 00 0F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0E0EFF.l,X		; FF FF 0E 0E
	bit $3CC0.w,X		; 3C C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$3F.b		; C0 3F
	cpy #$BF.b		; C0 BF
	rti		; 40

	sbc $CEFE8F.l,X		; FF 8F FE CE
	adc [$67.b],Y		; 77 67
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta $77CEFE.l		; 8F FE CE 77
	adc [$00.b]		; 67 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $76FFFF.l,X		; 1F FF FF 76
	ror $E0.b,X		; 76 E0
	inx		; E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF1F.l,X		; FF 1F FF FF
	ror $76.b,X		; 76 76
	cpx #$E8.b		; E0 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
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
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	sbc $03C410.l		; EF 10 C4 03
	ora ($00.b,X)		; 01 00
	cpy $FF.b		; C4 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	pei ($FF.b)		; D4 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cpx $FF.b		; E4 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	pea $06FF.w		; F4 FF 06
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	cpy $FF.b		; C4 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	pei ($FF.b)		; D4 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	cpx $FF.b		; E4 FF
	tsb $000C.w		; 0C 0C 00
	brk $F1.b		; 00 F1
	sbc $0EFFF4.l,X		; FF F4 FF 0E
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b,X)		; E1 FF
	cpx #$FF.b		; E0 FF
	jsr $000C.w		; 20 0C 00
	brk $00.b		; 00 00
	bvs  16.b		; 70 10
	cpx #$70.b		; E0 70
	bra -64.b		; 80 C0
	asl $FE00.w		; 0E 00 FE
	rti		; 40

	ldy $6098.w,X		; BC 98 60
	ldy #$46.b		; A0 46
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	bra  78.b		; 80 4E
	rts		; 60

	stz $BC40.w,X		; 9E 40 BC
	bra 120.b		; 80 78
	brk $E6.b		; 00 E6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $FC.b		; 02 FC
	php		; 08
	sbc [$00.b],Y		; F7 00
	sta [$00.b]		; 87 00
	sbc $F1609F.l,X		; FF 9F 60 F1
	asl $FF00.w		; 0E 00 FF
	cpx #$1F.b		; E0 1F
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $87.b		; 00 87
	ror $99.b		; 66 99
	bra 127.b		; 80 7F
	cpy #$3F.b		; C0 3F
	cpx #$1F.b		; E0 1F
	beq  15.b		; F0 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $E0.b		; 00 E0
	bpl -32.b		; 10 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	pla		; 68
	ora [$4E.b],Y		; 17 4E
	bmi   7.b		; 30 07
	sed		; F8
	adc ($9E.b,X)		; 61 9E
	rts		; 60

	stx $60.b		; 86 60
	bra  65.b		; 80 41
	sec		; 38
	eor [$B8.b]		; 47 B8
	cpx #$9F.b		; E0 9F
	cpy #$BE.b		; C0 BE
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	sbc $EE1F.w,Y		; F9 1F EE
	asl $B8C1.w		; 0E C1 B8
	cmp [$38.b]		; C7 38
	sed		; F8
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	jsr ($BF00.w,X)		; FC 00 BF
	brk $3F.b		; 00 3F
	brk $EC.b		; 00 EC
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $BF.b		; 00 BF
	brk $3F.b		; 00 3F
	brk $EC.b		; 00 EC
	rts		; 60

	sta ($60.b),Y		; 91 60
	tya		; 98
	rts		; 60

	dey		; 88
	rts		; 60

	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra -32.b		; 80 E0
	ora ($E0.b),Y		; 11 E0
	clc		; 18
	cpx #$08.b		; E0 08
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bvs -128.b		; 70 80
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
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
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2400.w		; 20 00 24
	brk $0F.b		; 00 0F
	brk $FB.b		; 00 FB
	brk $7F.b		; 00 7F
	brk $0D.b		; 00 0D
	brk $01.b		; 00 01
	brk $19.b		; 00 19
	clc		; 18
	sec		; 38
	clc		; 18
	bit $0F00.w,X		; 3C 00 0F
	ora $F8.b,S		; 03 F8
	dey		; 88
	sbc [$FA.b],Y		; F7 FA
	sbc [$7F.b],Y		; F7 7F
	ror $1E07.w,X		; 7E 07 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($1E.b,X)		; 01 1E
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora $18071E.l,X		; 1F 1E 07 18
	brk $0F.b		; 00 0F
	ora ($0F.b,X)		; 01 0F
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	clc		; 18
	adc [$00.b]		; 67 00
	adc $A4F807.l,X		; 7F 07 F8 A4
	tad		; 5B
	bpl -21.b		; 10 EB
	bmi  71.b		; 30 47
	brk $7F.b		; 00 7F
	rol $02C1.w,X		; 3E C1 02
	adc $F986.w,X		; 7D 86 F9
	lda [$58.b]		; A7 58
	lda $5C.b,S		; A3 5C
	ora $F8.b,S		; 03 F8
	sta $F4.b,S		; 83 F4
	sta $00FFF0.l		; 8F F0 FF 00
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $1E.b		; 00 1E
	ora [$78.b]		; 07 78
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	ora ($1F.b,X)		; 01 1F
	brk $7F.b		; 00 7F
	sed		; F8
	jsr ($F8F7.w,X)		; FC F7 F8
	cld		; D8
	cmp $249F9C.l,X		; DF 9C 9F 24
	bra 112.b		; 80 70
	brk $62.b		; 00 62
	ora $11C0.w,X		; 1D C0 11
	ora $F8.b		; 05 F8
	stz $8B.b,X		; 74 8B
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	tad		; 5B
	sbc $81FF8F.l,X		; FF 8F FF 81
	inc $DE0F.w,X		; FE 0F DE
	sbc $887702.l,X		; FF 02 77 88
	ora $FFFFEE.l		; 0F EE FF FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	asl $001F.w,X		; 1E 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc [$00.b]		; 67 00
	sta [$00.b]		; 87 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$87.b]		; 07 87
	cpx #$07.b		; E0 07
	bra   7.b		; 80 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	inc $F708.w,X		; FE 08 F7
	bvs -113.b		; 70 8F
	iny		; C8
	and [$00.b],Y		; 37 00
	sta [$00.b]		; 87 00
	and $0F7F00.l,X		; 3F 00 7F 0F
	beq   6.b		; F0 06
	sed		; F8
	sei		; 78
	sta [$70.b]		; 87 70
	sta $787F80.l		; 8F 80 7F 78
	sbc $9FFFC0.l,X		; FF C0 FF 9F
	cpx #$70.b		; E0 70
	sta $000000.l		; 8F 00 00 00
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
	brk $21.b		; 00 21
	dec $814E.w,X		; DE 4E 81
	ora $FE01E0.l		; 0F E0 01 FE
	bmi  15.b		; 30 0F
	bra  13.b		; 80 0D
	stz $83.b,X		; 74 83
	mvn $01,$8B		; 54 8B 01
	inc $8F40.w,X		; FE 40 8F
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	beq -49.b		; F0 CF
	sbc ($7E.b,S),Y		; F3 7E
	pha		; 48
	lda $30BF60.l,X		; BF 60 BF 30
	cpy $FC00.w		; CC 00 FC
	bvs -116.b		; 70 8C
	pla		; 68
	bra   0.b		; 80 00
	sbc $7F847B.l,X		; FF 7B 84 7F
	bra  14.b		; 80 0E
	beq   0.b		; F0 00
	jsr ($CC30.w,X)		; FC 30 CC
	bpl -20.b		; 10 EC
	php		; 08
	cpx #$00.b		; E0 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $21EE10.l,X		; 7F 10 EE 21
	.db $42, $C7		; 42 C7
	brk $8F.b		; 00 8F
	brk $7F.b		; 00 7F
	bra  24.b		; 80 18
	sbc [$E0.b]		; E7 E0
	ora $03FC.w,X		; 1D FC 03
	adc $8FEC90.l		; 6F 90 EC 8F
	sed		; F8
	and $E074FB.l,X		; 3F FB 74 E0
	ora $FC1FE0.l,X		; 1F E0 1F FC
	ora ($FF.b,X)		; 01 FF
	brk $E0.b		; 00 E0
	ora $E010E0.l,X		; 1F E0 10 E0
	bpl -122.b		; 10 86
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq  26.b		; F0 1A
	cpx $F8.b		; E4 F8
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq -122.b		; F0 86
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	bra  48.b		; 80 30
	cpy #$F0.b		; C0 F0
	asl $F800.w		; 0E 00 F8
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	sbc $7FFF01.l,X		; FF 01 FF 7F
	sbc [$77.b],Y		; F7 77
	ldx $E0BE.w,Y		; BE BE E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	adc $BE77F7.l,X		; 7F F7 77 BE
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F0FC.w,X)		; FC FC F0
	beq -64.b		; F0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($F0F0.w,X)		; FC F0 F0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $87.b		; 00 87
	tsb $FB.b		; 04 FB
	eor $F10EA0.l,X		; 5F A0 0E F1
	bmi   3.b		; 30 03
	brk $83.b		; 00 83
	brk $F8.b		; 00 F8
	ora ($E1.b)		; 12 E1
	sei		; 78
	sbc $20FD02.l,X		; FF 02 FD 20
	cmp $CEF609.l,X		; DF 09 F6 CE
	sbc $FF7C.w,X		; FD 7C FF
	adc $ED1E87.l,X		; 7F 87 1E ED
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	brk $3F.b		; 00 3F
	brk $E3.b		; 00 E3
	bmi   6.b		; 30 06
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	ora ($3E.b,X)		; 01 3E
	trb $39FF.w		; 1C FF 39
	ora $003F00.l		; 0F 00 3F 00
	and $00FB04.l,X		; 3F 04 FB 00
	sbc $347906.l,X		; FF 06 79 34
	cmp #$14.b		; C9 14
	inx		; E8
	stz $9B.b		; 64 9B
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	rol $F641.w,X		; 3E 41 F6
	phd		; 0B
	ora [$FB.b]		; 07 FB
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	php		; 08
	sbc [$04.b],Y		; F7 04
	phd		; 0B
	php		; 08
	adc ($00.b),Y		; 71 00
	bit $01.b		; 24 01
	jsr $0403.w		; 20 03 04
	brk $67.b		; 00 67
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	tsb $7803.w		; 0C 03 78
	ora ($1B.b,X)		; 01 1B
	and $FBBF9E.l,X		; 3F 9E BF FB
	jsr ($7F18.w,X)		; FC 18 7F
	rts		; 60

	adc $460F00.l,X		; 7F 00 0F 46
	clv		; B8
	brk $8F.b		; 00 8F
	sec		; 38
	ora [$44.b]		; 07 44
	tsa		; 3B
	trb $78E3.w		; 1C E3 78
	sta [$24.b]		; 87 24
	wai		; CB
	cpy #$07.b		; C0 07
	eor [$B9.b]		; 47 B9
	adc [$F8.b],Y		; 77 F8
	cmp [$F8.b]		; C7 F8
	lda $FC03C0.l,X		; BF C0 03 FC
	ora [$F8.b]		; 07 F8
	ora ($FC.b,S),Y		; 13 FC
	and [$F0.b],Y		; 37 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $37377F.l,X		; 7F 7F 37 37
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $37377F.l,X		; 7F 7F 37 37
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	inc $FF01.w,X		; FE 01 FF
	inc $FFFF.w,X		; FE FF FF
	ora $0719.w,Y		; 19 19 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FFFF.w,X		; FE FF FF
	ora $0019.w,Y		; 19 19 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($06.b,X)		; 01 06
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	phd		; 0B
	cmp ($02.b,S),Y		; D3 02
	sbc [$FF.b],Y		; F7 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cmp ($FF.b,S),Y		; D3 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FF.b,S		; E3 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,S		; E3 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	pea $F3FF.w		; F4 FF F3
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $F3.b		; 00 F3
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $0F00.w,X		; 1E 00 0F
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $31.b		; 00 31
	ora $060610.l		; 0F 10 06 06
	brk $03.b		; 00 03
	brk $1E.b		; 00 1E
	ora ($1D.b)		; 12 1D
	ora $07010F.l		; 0F 0F 01 07
	asl $003F.w		; 0E 3F 00
	ora $303000.l,X		; 1F 00 30 30
	cpy #$60.b		; C0 60
	sty $FC00.w		; 8C 00 FC
	cli		; 58
	ldy #$40.b		; A0 40
	ldy $00.b		; A4 00
	jsr ($4EB0.w,X)		; FC B0 4E
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	cpy #$2C.b		; C0 2C
	jsr $C0DC.w		; 20 DC C0
	sec		; 38
	bra 100.b		; 80 64
	tsb $F8.b		; 04 F8
	bmi -50.b		; 30 CE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	brk $1F.b		; 00 1F
	brk $F3.b		; 00 F3
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	ora ($1E.b,X)		; 01 1E
	tsb $00FF.w		; 0C FF 00
	ora $001F00.l,X		; 1F 00 1F 00
	sbc $108976.l,X		; FF 76 89 10
	sbc $50EE10.l		; EF 10 EE 50
	lda $03A051.l		; AF 51 A0 03
	jsr ($FC03.w,X)		; FC 03 FC
	rol $FFC1.w,X		; 3E C1 FF
	brk $10.b		; 00 10
	sbc $D08E70.l		; EF 70 8E D0
	and $02EE1F.l		; 2F 1F EE 02
	sbc $DD22.w,X		; FD 22 DD
	brk $F8.b		; 00 F8
	tsb $F8.b		; 04 F8
	bit $DA.b		; 24 DA
	cpx $2A12.w		; EC 12 2A
	bne   0.b		; D0 00
	sbc $43304F.l,X		; FF 4F 30 43
	ldy $F800.w,X		; BC 00 F8
	brk $FC.b		; 00 FC
	jsr $04DE.w		; 20 DE 04
	plx		; FA
	cop $F8.b		; 02 F8
	brk $FF.b		; 00 FF
	bcc -17.b		; 90 EF
	tsb $FB.b		; 04 FB
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora ($20.b,X)		; 01 20
	tsb $0B.b		; 04 0B
	brk $1F.b		; 00 1F
	ora $1C.b,S		; 03 1C
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $F4BF.w,X		; 9E BF F4
	xce		; FB
	rts		; 60

	adc $0E1F00.l,X		; 7F 00 1F 0E
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	cld		; D8
	sbc $1C.b,S		; E3 1C
	and $3A0550.l		; 2F 50 05 3A
	tsb $3A.b		; 04 3A
	tsb $39.b		; 04 39
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	jsr ($1C03.w,X)		; FC 03 1C
	sbc $9F.b,S		; E3 9F
	cpx #$BC.b		; E0 BC
	sta $3C.b,S		; 83 3C
	cop $3C.b		; 02 3C
	ora ($3C.b,X)		; 01 3C
	brk $3C.b		; 00 3C
	brk $DC.b		; 00 DC
	brk $00.b		; 00 00
	cpx #$8E.b		; E0 8E
	bvs  -4.b		; 70 FC
	brk $18.b		; 00 18
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $00C0.w		; 1C C0 00
	cpx #$F8.b		; E0 F8
	asl $00.b		; 06 00
	jsr ($7800.w,X)		; FC 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1C.b,S		; 03 1C
	tsb $00.b		; 04 00
	brk $7E.b		; 00 7E
	tsb $18.b		; 04 18
	asl $09.b		; 06 09
	ora ($1E.b,X)		; 01 1E
	ora ($EE.b),Y		; 11 EE
	tsb $FA.b		; 04 FA
	cop $1D.b		; 02 1D
	tda		; 7B
	adc $07710F.l,X		; 7F 0F 71 07
	tas		; 1B
	brk $0F.b		; 00 0F
	sbc ($EE.b),Y		; F1 EE
	bvs -113.b		; 70 8F
	brk $FE.b		; 00 FE
	pla		; 68
	stx $00.b,Y		; 96 00
	cmp [$00.b]		; C7 00
	and $00F00E.l,X		; 3F 0E F0 00
	jsr ($4680.w,X)		; FC 80 46
	brk $FF.b		; 00 FF
	eor $3EC0A0.l,X		; 5F A0 C0 3E
	sec		; 38
	sbc $30E1DE.l,X		; FF DE E1 30
	dec $FC00.w		; CE 00 FC
	bra  70.b		; 80 46
	ldy $5B.b		; A4 5B
	cpy #$3F.b		; C0 3F
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
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	ora [$38.b]		; 07 38
	tsb $01.b		; 04 01
	brk $07.b		; 00 07
	brk $02.b		; 00 02
	tsb $0B.b		; 04 0B
	brk $14.b		; 00 14
	brk $07.b		; 00 07
	ora ($0F.b,X)		; 01 0F
	brk $3F.b		; 00 3F
	sbc $68FC.w,Y		; F9 FC 68
	adc $0CCFCD.l		; 6F CD CF 0C
	ora $0B.b,S		; 03 0B
	ora $800112.l,X		; 1F 12 01 80
	adc $1A4D82.l,X		; 7F 82 4D 1A
	cpx $02.b		; E4 02
	bit #$02.b		; 89 02
	ora $90.b		; 05 90
	.db $62, $64, $18		; 62 64 18
	inc $08FD.w		; EE FD 08
	sbc [$3E.b],Y		; F7 3E
	sbc ($FF.b),Y		; F1 FF
	ora ($3E.b,X)		; 01 3E
	lda $FE.b,X		; B5 FE
	sbc $6C9E.w,Y		; F9 9E 6C
	sta $609EE3.l,X		; 9F E3 9E 60
	sei		; 78
	bra  56.b		; 80 38
	cpy #$00.b		; C0 00
	lsr $8720.w,X		; 5E 20 87
	rts		; 60

	txs		; 9A
	sec		; 38
	tsb $F1.b		; 04 F1
	brk $00.b		; 00 00
	inc $F800.w,X		; FE 00 F8
	brk $F8.b		; 00 F8
	ldy #$FE.b		; A0 FE
	jsr $6087.w		; 20 87 60
	txs		; 9A
	cpy #$FC.b		; C0 FC
	lda ($40.b),Y		; B1 40
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
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $07077C.l,X		; 7F 7C 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $07077C.l,X		; 7F 7C 07 07
	brk $00.b		; 00 00
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	tsb $0C30.w		; 0C 30 0C
	bmi  12.b		; 30 0C
	beq -17.b		; F0 EF
	bpl  -2.b		; 10 FE
	inc $DB.b,X		; F6 DB
	stp		; DB
	bit $3C00.w,X		; 3C 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	inc $DB.b,X		; F6 DB
	stp		; DB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F07C.w,X)		; FC 7C F0
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jmp ($F0F0.w,X)		; 7C F0 F0
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
	ora $80.b,S		; 03 80
	tsb $F800.w		; 0C 00 F8
	php		; 08
	sep #$01		; E2 01
	plx		; FA
	sbc $00FFE2.l,X		; FF E2 FF 00
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFF2.l,X		; FF F2 FF 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F2.b		; 00 F2
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	ora $01.b		; 05 01
	inc A		; 1A
	ora ($06.b,X)		; 01 06
	brk $0B.b		; 00 0B
	tsb $3B.b		; 04 3B
	ora $3A.b		; 05 3A
	brk $02.b		; 00 02
	php		; 08
	and ($08.b,S),Y		; 33 08
	ora $3922.w		; 0D 22 39
	ora $061E.w,Y		; 19 1E 06
	ora $3E01.w		; 0D 01 3E
	cop $3D.b		; 02 3D
	adc $0D7F.w,X		; 7D 7F 0D
	rol $80.b,X		; 36 80
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rts		; 60

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra  96.b		; 80 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	asl $18.b		; 06 18
	trb $0762.w		; 1C 62 07
	clc		; 18
	brk $08.b		; 00 08
	brk $69.b		; 00 69
	ora $0602.w		; 0D 02 06
	eor $1904.w,Y		; 59 04 19
	ora ($1F.b,X)		; 01 1F
	ora ($7F.b,X)		; 01 7F
	adc $BFB760.l,X		; 7F 60 B7 BF
	adc [$0E.b]		; 67 0E
	lda ($BC.b,S),Y		; B3 BC
	and ($7E.b,X)		; 21 7E
	ora $1E.b,S		; 03 1E
	lsr $20.b,X		; 56 20
	jmp $40B0.w		; 4C B0 40
	sta $58.b,S		; 83 58
	and $5C.b		; 25 5C
	.db $82, $7E, $80		; 82 7E 80
	rti		; 40

	ldx $A05E.w,Y		; BE 5E A0
	cpy #$B6.b		; C0 B6
	cpy #$3C.b		; C0 3C
	bne  19.b		; D0 13
	cld		; D8
	lda $E0.b		; A5 E0
	rol $38C6.w,X		; 3E C6 38
	sbc ($0C.b)		; F2 0C
	cpy #$3E.b		; C0 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	bit $DB.b		; 24 DB
	ora #$56.b		; 09 56
	ora $0172.w		; 0D 72 01
	ror $F30C.w,X		; 7E 0C F3
	sty $4A.b,X		; 94 4A
	and ($DE.b,X)		; 21 DE
	stz $7B.b		; 64 7B
	adc $9C.b,S		; 63 9C
	and $7C.b,S		; 23 7C
	adc $7A0500.l,X		; 7F 00 05 7A
	bit $A7C3.w,X		; 3C C3 A7
	adc $FE01.w,Y		; 79 01 FE
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	ldy #$40.b		; A0 40
	php		; 08
	beq  64.b		; F0 40
	bit $C030.w,X		; 3C 30 C0
	inc A		; 1A
	stz $C4.b		; 64 C4
	sec		; 38
	brk $E0.b		; 00 E0
	rti		; 40

	bcs   0.b		; B0 00
	cpx #$80.b		; E0 80
	sei		; 78
	php		; 08
	stz $00.b,X		; 74 00
	beq -96.b		; F0 A0
	dec $F408.w,X		; DE 08 F4
	brk $09.b		; 00 09
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	and $02023F.l,X		; 3F 3F 02 02
	and ($38.b),Y		; 31 38
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	and $02023F.l,X		; 3F 3F 02 02
	mvp $40,$A0		; 44 A0 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  -2.b		; 80 FE
	ror $B0B0.w,X		; 7E B0 B0
	cpy #$24.b		; C0 24
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	inc $B07E.w,X		; FE 7E B0
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	cop $F1.b		; 02 F1
	brk $FD.b		; 00 FD
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($F9FF.w,X)		; FC FF F9
	sbc $000C01.l,X		; FF 01 0C 00
	brk $00.b		; 00 00
	pla		; 68
	bpl   8.b		; 10 08
	jsr $2858.w		; 20 58 28
	bvc   0.b		; 50 00
	sed		; F8
	bit $C8.b,X		; 34 C8
	brk $D8.b		; 00 D8
	brk $EC.b		; 00 EC
	jsr $2048.w		; 20 48 20
	sec		; 38
	brk $78.b		; 00 78
	bmi  72.b		; 30 48
	clv		; B8
	rti		; 40

	beq  12.b		; F0 0C
	rts		; 60

	clv		; B8
	trb $F8.b		; 14 F8
	pla		; 68
	sty $04.b		; 84 04
	php		; 08
	rol $2E10.w		; 2E 10 2E
	bvc   8.b		; 50 08
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl  12.b		; 10 0C
	tsb $F418.w		; 0C 18 F4
	stz $78.b,X		; 74 78
	phy		; 5A
	stz $18.b		; 64 18
	ror $18.b		; 66 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	tsb $801A.w		; 0C 1A 80
	pla		; 68
	brk $D4.b		; 00 D4
	rol A		; 2A
	ldx $04.b,Y		; B6 04
	cpx $B6FF.w		; EC FF B6
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FC.b		; 00 FC
	sbc $02FFB6.l,X		; FF B6 FF 02
	tsb $0000.w		; 0C 00 00
	tsb $B600.w		; 0C 00 B6
	sbc $000C04.l,X		; FF 04 0C 00
	brk $DB.b		; 00 DB
	sbc $06FFC6.l,X		; FF C6 FF 06
	tsb $0000.w		; 0C 00 00
	xba		; EB
	sbc $08FFC6.l,X		; FF C6 FF 08
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $0AFFC6.l,X		; FF C6 FF 0A
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $C6.b		; 00 C6
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $1B.b		; 00 1B
	brk $C6.b		; 00 C6
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $D4.b		; 00 D4
	sbc $20FFD6.l,X		; FF D6 FF 20
	tsb $0000.w		; 0C 00 00
	cpx $FF.b		; E4 FF
	dec $FF.b,X		; D6 FF
	jsl $00000C.l		; 22 0C 00 00
	pea $D6FF.w		; F4 FF D6
	sbc $000C24.l,X		; FF 24 0C 00
	brk $04.b		; 00 04
	brk $D6.b		; 00 D6
	sbc $000C26.l,X		; FF 26 0C 00
	brk $14.b		; 00 14
	brk $D6.b		; 00 D6
	sbc $000C28.l,X		; FF 28 0C 00
	brk $24.b		; 00 24
	brk $D6.b		; 00 D6
	sbc $000C2A.l,X		; FF 2A 0C 00
	brk $D5.b		; 00 D5
	sbc $2CFFE6.l,X		; FF E6 FF 2C
	tsb $0000.w		; 0C 00 00
	sbc $FF.b		; E5 FF
	inc $FF.b		; E6 FF
	rol $000C.w		; 2E 0C 00
	brk $F5.b		; 00 F5
	sbc $40FFE6.l,X		; FF E6 FF 40
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	inc $FF.b		; E6 FF
	.db $42, $0C		; 42 0C
	brk $00.b		; 00 00
	ora $00.b,X		; 15 00
	inc $FF.b		; E6 FF
	mvp $00,$0C		; 44 0C 00
	brk $25.b		; 00 25
	brk $E6.b		; 00 E6
	sbc $000C46.l,X		; FF 46 0C 00
	brk $D8.b		; 00 D8
	sbc $48FFF6.l,X		; FF F6 FF 48
	tsb $0000.w		; 0C 00 00
	inx		; E8
	sbc $4AFFF6.l,X		; FF F6 FF 4A
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $4CFFF6.l,X		; FF F6 FF 4C
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F6.b		; 00 F6
	sbc $000C4E.l,X		; FF 4E 0C 00
	brk $18.b		; 00 18
	brk $F6.b		; 00 F6
	sbc $000C60.l,X		; FF 60 0C 00
	brk $29.b		; 00 29
	brk $F6.b		; 00 F6
	sbc $000C62.l,X		; FF 62 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora [$0F.b]		; 07 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $0F.b,S		; 03 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	cop $07.b		; 02 07
	ora [$42.b]		; 07 42
	.db $42, $67		; 42 67
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $070502.l		; 0F 02 05 07
	brk $42.b		; 00 42
	ora ($67.b,X)		; 01 67
	bcc   0.b		; 90 00
	ora $00.b,S		; 03 00
	ora [$02.b]		; 07 02
	adc $00.b		; 65 00
	tsa		; 3B
	brk $78.b		; 00 78
	bpl  24.b		; 10 18
	sec		; 38
	sec		; 38
	bvs -12.b		; 70 F4
	brk $13.b		; 00 13
	brk $E7.b		; 00 E7
	php		; 08
	sbc [$04.b]		; E7 04
	xce		; FB
	cop $F8.b		; 02 F8
	ora ($EA.b),Y		; 11 EA
	sec		; 38
	cmp [$70.b]		; C7 70
	sta $00B000.l		; 8F 00 B0 00
	tya		; 98
	rti		; 40

	stz $6896.w,X		; 9E 96 68
	clc		; 18
	ror $38.b		; 66 38
	dec $03.b		; C6 03
	cpx $EC03.w		; EC 03 EC
	brk $B0.b		; 00 B0
	brk $98.b		; 00 98
	brk $DE.b		; 00 DE
	brk $FE.b		; 00 FE
	brk $7E.b		; 00 7E
	brk $FE.b		; 00 FE
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	ror $397E.w,X		; 7E 7E 39
	adc $3F7807.l,X		; 7F 07 78 3F
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	ror $3901.w,X		; 7E 01 39
	lsr $00.b		; 46 00
	adc $781F20.l,X		; 7F 20 1F 78
	sei		; 78
	and ($21.b,X)		; 21 21
	and ($C6.b),Y		; 31 C6
	brk $FF.b		; 00 FF
	rti		; 40

	sbc ($C0.b,X)		; E1 C0
	xba		; EB
	cpx #$FC.b		; E0 FC
	bvc -108.b		; 50 94
	sei		; 78
	brk $21.b		; 00 21
	brk $00.b		; 00 00
	sbc [$00.b],Y		; F7 00
	sbc $C0BD40.l,X		; FF 40 BD C0
	and $301FE0.l,X		; 3F E0 1F 30
	cmp [$01.b]		; C7 01
	dec $001F.w		; CE 1F 00
	ora $865F00.l,X		; 1F 00 5F 86
	ora ($F2.b,X)		; 01 F2
	ora ($F0.b,X)		; 01 F0
	adc ($80.b),Y		; 71 80
	adc ($00.b),Y		; 71 00
	brk $CF.b		; 00 CF
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	asl $D9.b		; 06 D9
	tsb $F3.b		; 04 F3
	tsb $F1.b		; 04 F1
	cop $F5.b		; 02 F5
	brk $F9.b		; 00 F9
	sbc $F100.w,X		; FD 00 F1
	brk $E1.b		; 00 E1
	ora ($E3.b,X)		; 01 E3
	ora $D9.b,S		; 03 D9
	ora ($F8.b,X)		; 01 F8
	bmi  -8.b		; 30 F8
	sei		; 78
	beq -16.b		; F0 F0
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	ora ($EC.b,S),Y		; 13 EC
	ora $EC.b,S		; 03 EC
	ora [$D8.b]		; 07 D8
	and [$C8.b],Y		; 37 C8
	tda		; 7B
	sty $F3.b		; 84 F3
	tsb $0700.w		; 0C 00 07
	bra  29.b		; 80 1D
	brk $00.b		; 00 00
	sta $9C.b,S		; 83 9C
	ora $7C.b,S		; 03 7C
	php		; 08
	sei		; 78
	trb $1C7C.w		; 1C 7C 1C
	trb $DF20.w		; 1C 20 DF
	rts		; 60

	sta $00C1.w,X		; 9D C1 00
	cpy #$1F.b		; C0 1F
	bra 127.b		; 80 7F
	dey		; 88
	adc [$9C.b],Y		; 77 9C
	adc $1F.b,S		; 63 1F
	brk $C0.b		; 00 C0
	bpl   0.b		; 10 00
	ldy $7800.w,X		; BC 00 78
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	ora ($3C.b,X)		; 01 3C
	cpy #$00.b		; C0 00
	bne   0.b		; D0 00
	ldy $7800.w,X		; BC 00 78
	bra  60.b		; 80 3C
	sta [$00.b]		; 87 00
	sed		; F8
	brk $46.b		; 00 46
	and $FC03.w,Y		; 39 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $E6.b		; 00 E6
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $70.b		; 00 70
	brk $E6.b		; 00 E6
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
	ora [$07.b]		; 07 07
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	bit $25.b		; 24 25
	jsr ($30FF.w,X)		; FC FF 30
	and [$07.b],Y		; 37 07
	brk $01.b		; 00 01
	php		; 08
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	bit $01.b		; 24 01
	jsr ($3003.w,X)		; FC 03 30
	ora [$47.b]		; 07 47
	cmp [$02.b]		; C7 02
	nop		; EA
	ora ($0F.b,X)		; 01 0F
	cmp $CF.b,S		; C3 CF
	sbc ($E7.b,X)		; E1 E7
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	ora $9C.b,S		; 03 9C
	eor [$B8.b]		; 47 B8
	cop $FD.b		; 02 FD
	ora ($0E.b,X)		; 01 0E
	cmp $0C.b,S		; C3 0C
	sbc ($06.b,X)		; E1 06
	bne   7.b		; D0 07
	bpl -57.b		; 10 C7
	brk $9F.b		; 00 9F
	rts		; 60

	cpx #$E0.b		; E0 E0
	sbc ($E0.b,X)		; E1 E0
	cmp ($F0.b,X)		; C1 F0
	dec $80.b		; C6 80
	ldy #$CC.b		; A0 CC
	and $0C.b,S		; 23 0C
	cop $F8.b		; 02 F8
	brk $60.b		; 00 60
	sta $C01FE0.l,X		; 9F E0 1F C0
	and $9037C0.l,X		; 3F C0 37 90
	adc ($10.b,X)		; 61 10
	sbc $000F30.l		; EF 30 0F 00
	xce		; FB
	ora $0C.b,S		; 03 0C
	ora $3C.b,S		; 03 3C
	eor ($7E.b,X)		; 41 7E
	sbc $FC.b,S		; E3 FC
	xce		; FB
	jsr ($9417.w,X)		; FC 17 94
	ora [$0E.b]		; 07 0E
	ora ($0E.b,X)		; 01 0E
	rti		; 40

	ora $403F40.l		; 0F 40 3F 40
	and $F81FE0.l,X		; 3F E0 1F F8
	ora [$14.b]		; 07 14
	wai		; CB
	lsr $99.b		; 46 99
	brk $FF.b		; 00 FF
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bcc  96.b		; 90 60
	plp		; 28
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	sec		; 38
	brk $30.b		; 00 30
	brk $00.b		; 00 00
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
	ora $07070F.l		; 0F 0F 07 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $38.b		; 00 38
	brk $0C.b		; 00 0C
	cpy #$CC.b		; C0 CC
	ora $000700.l		; 0F 00 07 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $13.b		; 00 13
	brk $39.b		; 00 39
	brk $0F.b		; 00 0F
	cpy #$0F.b		; C0 0F
	ora $9F9E1F.l,X		; 1F 1F 9E 9F
	jmp $824E.w		; 4C 4E 82
	bra  71.b		; 80 47
	rti		; 40

	cop $00.b		; 02 00
	bit $4B.b,X		; 34 4B
	.db $62, $1D, $1F		; 62 1D 1F
	rts		; 60

	stz $4C61.w,X		; 9E 61 4C
	and ($80.b,S),Y		; 33 80
	tda		; 7B
	rti		; 40

	lda $00BF00.l,X		; BF 00 BF 00
	sbc $93FF00.l,X		; FF 00 FF 93
	bra   1.b		; 80 01
	bcs  67.b		; B0 43
	bcc -31.b		; 90 E1
	brk $72.b		; 00 72
	tsb $5E21.w		; 0C 21 5E
	adc $00DA80.l		; 6F 80 DA 00
	dey		; 88
	eor ($06.b,S),Y		; 53 06
	sbc ($00.b),Y		; F1 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $3EFF00.l		; EF 00 FF 3E
	brk $B8.b		; 00 B8
	brk $80.b		; 00 80
	brk $8C.b		; 00 8C
	brk $0C.b		; 00 0C
	cpy #$00.b		; C0 00
	cpx #$01.b		; E0 01
	rti		; 40

	phd		; 0B
	brk $00.b		; 00 00
	inc $F900.w,X		; FE 00 F9
	ora $9C00E0.l,X		; 1F E0 00 9C
	brk $FD.b		; 00 FD
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $4000.w		; 20 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($C0.b,X)		; 01 C0
	ora ($03.b,X)		; 01 03
	cpx $F00F.w		; EC 0F F0
	cmp [$30.b]		; C7 30
	cmp $3C.b,S		; C3 3C
	adc ($8E.b),Y		; 71 8E
	adc ($84.b,S),Y		; 73 84
	and $C01FC0.l,X		; 3F C0 1F C0
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $01.b		; 02 01
	sta $80.b,S		; 83 80
	cpy #$C0.b		; C0 C0
	sty $0E80.w		; 8C 80 0E
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	ora $F80798.l		; 0F 98 07 F8
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	ora ($E0.b,X)		; 01 E0
	ora $00F40B.l		; 0F 0B F4 00
	cmp [$04.b],Y		; D7 04
	ora [$0E.b]		; 07 0E
	lsr $DC0C.w		; 4E 0C DC
	ora $0C0E1F.l,X		; 1F 1F 0E 0C
	adc $00.b,S		; 63 00
	brk $FF.b		; 00 FF
	php		; 08
	sbc [$04.b],Y		; F7 04
	xce		; FB
	asl $0CF1.w		; 0E F1 0C
	sbc ($1F.b,S),Y		; F3 1F
	rts		; 60

	jmp $EF00A3.l		; 5C A3 00 EF
	ora ($E0.b,X)		; 01 E0
	asl $61.b		; 06 61
	asl $0871.w		; 0E 71 08
	and [$40.b],Y		; 37 40
	jmp $68F0F0.l		; 5C F0 F0 68
	jmp ($04F0.w)		; 6C F0 04
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	rti		; 40

	lda $680FF0.l,X		; BF F0 0F 68
	sta $00.b,X		; 95 00
	sbc $000000.l,X		; FF 00 00 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $F9.b		; 00 F9
	brk $FE.b		; 00 FE
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
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	tsb $07.b		; 04 07
	ora [$07.b]		; 07 07
	ora $001C.w,X		; 1D 1C 00
	trb $0F06.w		; 1C 06 0F
	ora $031F.w		; 0D 1F 03
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $07.b,S		; 03 07
	brk $1C.b		; 00 1C
	ora ($00.b,X)		; 01 00
	trb $0906.w		; 1C 06 09
	ora $A012.w		; 0D 12 A0
	ldy $EF4C.w,X		; BC 4C EF
	stz $FF.b,X		; 74 FF
	jsr $8079.w		; 20 79 80
	rti		; 40

	bra -60.b		; 80 C4
	bpl -128.b		; 10 80
	sbc $1FA0C0.l,X		; FF C0 A0 1F
	jmp $74A3.w		; 4C A3 74
	phb		; 8B
	jsr $005F.w		; 20 5F 00
	jsr ($7680.w,X)		; FC 80 76
	ora ($9E.b,X)		; 01 9E
	cpy #$3F.b		; C0 3F
	jmp ($0791.w)		; 6C 91 07
	bcs  12.b		; B0 0C
	lda ($60.b),Y		; B1 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cop $00.b		; 02 00
	ora ($D3.b,X)		; 01 D3
	phd		; 0B
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $EE.b		; 00 EE
	asl $E1.b		; 06 E1
	clc		; 18
	sbc $80.b,S		; E3 80
	ora $9FDC03.l,X		; 1F 03 DC 9F
	rti		; 40

	brk $80.b		; 00 80
	ror $00.b		; 66 00
	.db $42, $06		; 42 06
	ora [$07.b]		; 07 07
	asl $C6.b		; 06 C6
	adc $CFC73F.l,X		; 7F 3F C7 CF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	dec A		; 3A
	cmp $87.b		; C5 87
	bpl   6.b		; 10 06
	sbc $C03F.w,Y		; F9 3F C0
	cmp [$38.b]		; C7 38
	rts		; 60

	ora ($E0.b,S),Y		; 13 E0
	brk $E4.b		; 00 E4
	bpl   0.b		; 10 00
	tsb $1915.w		; 0C 15 19
	and $7339.w,Y		; 39 39 73
	adc ($FF.b,S),Y		; 73 FF
	adc $FB00.w		; 6D 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$3F.b		; C0 3F
	ora ($2E.b),Y		; 11 2E
	and $73C6.w,Y		; 39 C6 73
	sty $926D.w		; 8C 6D 92
	rts		; 60

	bit #$00.b		; 89 00
	brk $00.b		; 00 00
	brk $C4.b		; 00 C4
	cpy $EE.b		; C4 EE
	sbc $C0C5C4.l		; EF C4 C5 C0
	cpy #$E0.b		; C0 E0
	dex		; CA
	ora $7E81E0.l,X		; 1F E0 81 7E
	ora ($FE.b,X)		; 01 FE
	cmp $00FF00.l,X		; DF 00 FF 00
	cmp $D922.w,X		; DD 22 D9
	rol $DF.b		; 26 DF
	jsr $001C.w		; 20 1C 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $400F00.l		; 0F 00 0F 40
	ora $007F00.l,X		; 1F 00 7F 00
	cpy #$1F.b		; C0 1F
	dey		; 88
	ora [$98.b]		; 07 98
	ora [$98.b]		; 07 98
	ora [$F0.b]		; 07 F0
	ora $E00FF0.l		; 0F F0 0F E0
	ora $E67F80.l,X		; 1F 80 7F E6
	brk $FE.b		; 00 FE
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $6D.b		; 00 6D
	bpl -24.b		; 10 E8
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $EF.b		; 00 EF
	cop $02.b		; 02 02
	sta [$87.b]		; 87 87
	eor $42.b,S		; 43 42
	sbc $FD80.w		; ED 80 FD
	brk $6F.b		; 00 6F
	bra 108.b		; 80 6C
	ora $60.b,S		; 03 60
	ora [$02.b]		; 07 02
	jsr ($7887.w,X)		; FC 87 78
	.db $42, $BD		; 42 BD
	bra 127.b		; 80 7F
	brk $FD.b		; 00 FD
	brk $EF.b		; 00 EF
	brk $6F.b		; 00 6F
	bpl 103.b		; 10 67
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$30.b		; C0 30
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $39.b		; 00 39
	brk $71.b		; 00 71
	brk $62.b		; 00 62
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $AF.b		; 00 AF
	brk $BD.b		; 00 BD
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $6F.b		; 00 6F
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F3.b		; 00 F3
	brk $73.b		; 00 73
	brk $37.b		; 00 37
	brk $C7.b		; 00 C7
	ora ($1E.b,X)		; 01 1E
	jmp $3D0003.l		; 5C 03 00 3D
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $73.b		; 00 73
	brk $37.b		; 00 37
	brk $C7.b		; 00 C7
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $02.b		; 00 02
	dey		; 88
	mvp $80,$38		; 44 38 80
	jsr ($FF00.w,X)		; FC 00 FF
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	sed		; F8
	ora [$F8.b]		; 07 F8
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	sbc ($F0.b,S),Y		; F3 F0
	eor $7C.b,S		; 43 7C
	ora $FC.b,S		; 03 FC
	brk $3E.b		; 00 3E
	trb $FC80.w		; 1C 80 FC
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	ora $C0.b,S		; 03 C0
	and $00FF00.l,X		; 3F 00 FF 00
	inc $FC00.w,X		; FE 00 FC
	brk $FC.b		; 00 FC
	ora ($F8.b,X)		; 01 F8
	and $0D00C0.l,X		; 3F C0 00 0D
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $39.b		; 00 39
	brk $37.b		; 00 37
	brk $0D.b		; 00 0D
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $35.b		; 00 35
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $F7.b		; 00 F7
	ora $010700.l		; 0F 00 07 01
	and ($00.b,S),Y		; 33 00
	jsr $0100.w		; 20 00 01
	eor ($04.b,X)		; 41 04
	bra   6.b		; 80 06
	brk $00.b		; 00 00
	ldx $00.b,Y		; B6 00
	ora $000E01.l		; 0F 01 0E 00
	and $013D00.l,X		; 3F 00 3D 01
	jmp.w [$C700]		; DC 00 C7
	brk $07.b		; 00 07
	brk $BE.b		; 00 BE
	cmp [$07.b]		; C7 07
	sbc $092AF9.l,X		; FF F9 2A 09
	inc $EA9D.w,X		; FE 9D EA
	inx		; E8
	inc $80.b,X		; F6 80
	and $0000.w,Y		; 39 00 00
	brk $07.b		; 00 07
	sed		; F8
	sbc $0806.w,Y		; F9 06 08
	sbc [$9C.b],Y		; F7 9C
	adc $E8.b,S		; 63 E8
	asl $80.b,X		; 16 80
	adc $383906.l,X		; 7F 06 39 38
	cpy #$FD.b		; C0 FD
	sbc $FDDD.w,X		; FD DD FD
	adc #$F4.b		; 69 F4
	adc $D33CF0.l,X		; 7F F0 3C D3
	and [$18.b]		; 27 18
	stz $1F.b		; 64 1F
	ora [$3F.b],Y		; 17 3F
	sbc $DD02.w,X		; FD 02 DD
	jsl $709F60.l		; 22 60 9F 70
	sta $00EF10.l		; 8F 10 EF 00
	sbc $17FB04.l,X		; FF 04 FB 17
	plp		; 28
	cmp $083DDE.l,X		; DF DE 3D 08
	and $50BF00.l,X		; 3F 00 BF 50
	and $F17DF9.l,X		; 3F F9 7D F1
	tas		; 1B
	xce		; FB
	ora ($70.b),Y		; 11 70
	dec $0821.w,X		; DE 21 08
	sbc [$00.b],Y		; F7 00
	sbc $39EF10.l,X		; FF 10 EF 39
	dec $73.b		; C6 73
	sty $E01B.w		; 8C 1B E0
	bpl 105.b		; 10 69
	cpy #$4C.b		; C0 4C
	cpx $04.b		; E4 04
	rol $A41E.w		; 2E 1E A4
	ldx $FF.b,Y		; B6 FF
	sbc $E7AFEF.l,X		; FF EF AF E7
	sbc [$51.b]		; E7 51
	ora ($7F.b,X)		; 01 7F
	bra  31.b		; 80 1F
	cpx #$1F.b		; E0 1F
	cpx #$BF.b		; E0 BF
	rti		; 40

	sbc $50AF00.l,X		; FF 00 AF 50
	sbc [$18.b]		; E7 18
	ora #$F6.b		; 09 F6
	and $00.b,S		; 23 00
	and $1C.b,S		; 23 1C
	bmi  12.b		; 30 0C
	bvs  12.b		; 70 0C
	bvs   0.b		; 70 00
	bra -128.b		; 80 80
	sta $061980.l,X		; 9F 80 19 06
	bra  35.b		; 80 23
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sta ($7C.b,X)		; 81 7C
	sta $00FD70.l		; 8F 70 FD 00
	cpx #$1F.b		; E0 1F
	brk $9F.b		; 00 9F
	cpx $3E0C.w		; EC 0C 3E
	asl $0E3C.w,X		; 1E 3C 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	sei		; 78
	sta [$78.b]		; 87 78
	sta [$0D.b]		; 87 0D
.INDEX 8
	sep #$1E		; E2 1E
	jsr $320C.w		; 20 0C 32
	beq  14.b		; F0 0E
	brk $0E.b		; 00 0E
	inc $0001.w,X		; FE 01 00
	sbc $04FF00.l,X		; FF 00 FF 04
	tsb $7E0E.w		; 0C 0E 7E
	asl $040F.w		; 0E 0F 04
	ora $30.b		; 05 30
	ora ($10.b,X)		; 01 10
	brk $32.b		; 00 32
	bpl 120.b		; 10 78
	tya		; 98
	cpy $0B.b		; C4 0B
	asl $0E71.w		; 0E 71 0E
	adc ($04.b),Y		; 71 04
	adc $FD00.w,Y		; 79 00 FD
	brk $F9.b		; 00 F9
	bpl -17.b		; 10 EF
	trb $00E3.w		; 1C E3 00
	jmp.w [$1F00]		; DC 00 1F
	brk $FF.b		; 00 FF
	brk $B7.b		; 00 B7
	brk $0B.b		; 00 0B
	bpl  15.b		; 10 0F
	jsr $7661.w		; 20 61 76
	bvs   0.b		; 70 00
	jmp.w [$1F00]		; DC 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $70DF.w		; 20 DF 70
	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	tya		; 98
	brk $B8.b		; 00 B8
	bmi -114.b		; 30 8E
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsa		; 3B
	brk $03.b		; 00 03
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $006F00.l,X		; FF 00 6F 00
	bit $00.b,X		; 34 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	php		; 08
	sbc ($00.b)		; F2 00
	dec $0700.w		; CE 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F201.w		; EE 01 F2
	ora ($CE.b,X)		; 01 CE
	php		; 08
	ora [$00.b]		; 07 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $07.b		; 00 07
	bvs   3.b		; 70 03
	sei		; 78
	ora $80.b,S		; 03 80
	php		; 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora ($C0.b,X)		; 01 C0
	ora $00FF00.l		; 0F 00 FF 00
	sbc $009F00.l,X		; FF 00 9F 00
	sbc $0A00.w		; ED 00 0A
	brk $00.b		; 00 00
	bra 112.b		; 80 70
	bra 112.b		; 80 70
	bra  16.b		; 80 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $F1.b		; 00 F1
	tsb $F0.b		; 04 F0
	asl $F0.b		; 06 F0
	phy		; 5A
	jsr $001F.w		; 20 1F 00
	cmp $00.b,S		; C3 00
	sbc $3C00.w,Y		; F9 00 3C
	php		; 08
	brk $08.b		; 00 08
	rti		; 40

	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	php		; 08
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	ora #$F6.b		; 09 F6
	asl $1E70.w		; 0E 70 1E
	rts		; 60

	eor $700F20.l,X		; 5F 20 0F 70
	asl $DE70.w		; 0E 70 DE
	jsr $00FE.w		; 20 FE 00
	ora ($1E.b),Y		; 11 1E
	brk $7B.b		; 00 7B
	adc ($78.b),Y		; 71 78
	rol A		; 2A
	and $0F3F.w		; 2D 3F 0F
	plx		; FA
	ora $F0.b		; 05 F0
	ora $30.b,S		; 03 30
	ora ($10.b,X)		; 01 10
	ora $767B04.l		; 0F 04 7B 76
	bit #$B8.b		; 89 B8
	eor [$CF.b]		; 47 CF
	bmi   0.b		; 30 00
	sbc $CEF304.l,X		; FF 04 F3 CE
	and ($DE.b),Y		; 31 DE
	and ($07.b,X)		; 21 07
	sed		; F8
	stz $E070.w,X		; 9E 70 E0
	cpx #$C0.b		; E0 C0
	sta $0006C8.l		; 8F C8 06 00
	ldx $F000.w		; AE 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl -18.b		; 10 EE
	cpx #$00.b		; E0 00
	bra  79.b		; 80 4F
	bpl -50.b		; 10 CE
	eor ($AE.b,X)		; 41 AE
	brk $FF.b		; 00 FF
	sbc ($20.b),Y		; F1 20
	xce		; FB
	php		; 08
	trb $0E1F.w		; 1C 1F 0E
	sbc $66FF0F.l		; EF 0F FF 66
	sta $807F00.l,X		; 9F 00 7F 80
	ora $20.b,S		; 03 20
	cmp $1CF708.l,X		; DF 08 F7 1C
	ora $0E.b,S		; 03 0E
	sbc ($0F.b,X)		; E1 0F
	beq   6.b		; F0 06
	sbc $7F80.w,Y		; F9 80 7F
	rti		; 40

	lda $E04059.l,X		; BF 59 40 E0
	ora $E0.b,S		; 03 E0
	brk $60.b		; 00 60
	brk $06.b		; 00 06
	inx		; E8
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $F9.b		; 00 F9
	rti		; 40

	lda $EF00.w,Y		; B9 00 EF
	brk $FF.b		; 00 FF
	brk $6F.b		; 00 6F
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $F9.b		; 00 F9
	cpx #$1C.b		; E0 1C
	brk $F8.b		; 00 F8
	rts		; 60

	tya		; 98
	bvs   0.b		; 70 00
	bmi   8.b		; 30 08
	brk $EC.b		; 00 EC
	brk $C4.b		; 00 C4
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $38.b		; 00 38
	brk $EC.b		; 00 EC
	brk $C4.b		; 00 C4
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0C.b		; 00 0C
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $003F00.l,X		; 1F 00 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
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
	brk $88.b		; 00 88
	brk $F8.b		; 00 F8
	brk $3C.b		; 00 3C
	bra -52.b		; 80 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	bra   7.b		; 80 07
	sed		; F8
	ora ($FE.b,X)		; 01 FE
	brk $BE.b		; 00 BE
	brk $FE.b		; 00 FE
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $30.b		; 00 30
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $D0.b		; 00 D0
	brk $F8.b		; 00 F8
	brk $E4.b		; 00 E4
	brk $FC.b		; 00 FC
	sbc $01FE00.l,X		; FF 00 FE 01
	jsr ($FE02.w,X)		; FC 02 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FC.b,X)		; 01 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc [$00.b]		; 67 00
	inx		; E8
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$10.b]		; C7 10
	asl $00.b		; 06 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	ldx $04.b		; A6 04
	tas		; 1B
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -49.b		; 30 CF
	jmp $DC13.w		; 4C 13 DC
	ora $18.b,S		; 03 18
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $001B00.l,X		; FF 00 1B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $B0.b		; 00 B0
	brk $B0.b		; 00 B0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phb		; 8B
	phb		; 8B
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phb		; 8B
	phb		; 8B
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$E7.b]		; E7 E7
	sty $008C.w		; 8C 8C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	sbc [$8C.b]		; E7 8C
	sty $0000.w		; 8C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	sbc $FEFEFF.l,X		; FF FF FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	sbc $FEFEFF.l,X		; FF FF FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	bra -113.b		; 80 8F
	sta $F89D.w,X		; 9D 9D F8
	sed		; F8
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $8F.b		; 00 8F
	bra -99.b		; 80 9D
	sta $F8F8.w,X		; 9D F8 F8
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	rol $3F00.w,X		; 3E 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	dec $EFDF.w,X		; DE DF EF
	sbc $007F7F.l		; EF 7F 7F 00
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	dec $EFEF.w,X		; DE EF EF
	adc $00007F.l,X		; 7F 7F 00 00
	clc		; 18
	brk $04.b		; 00 04
	bra   7.b		; 80 07
	brk $00.b		; 00 00
	bra  62.b		; 80 3E
	inc $CF0F.w,X		; FE 0F CF
	sta [$C7.b]		; 87 C7
	brk $00.b		; 00 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	rol $0FEF.w,X		; 3E EF 0F
	cmp [$87.b]		; C7 87
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	tsb $7F0C.w		; 0C 0C 7F
	adc $808C8C.l,X		; 7F 8C 8C 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $EC.b		; 00 EC
	tsb $7F7F.w		; 0C 7F 7F
	sty $808C.w		; 8C 8C 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sei		; 78
	sbc $6161FF.l,X		; FF FF 61 61
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sbc $6161FF.l,X		; FF FF 61 61
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($31.b),Y		; 31 31
	sbc $E8E8FF.l,X		; FF FF E8 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($31.b),Y		; 31 31
	sbc $E8E8FF.l,X		; FF FF E8 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $F220.w		; 20 20 F2
	sbc ($C8.b)		; F2 C8
	iny		; C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $F220.w		; 20 20 F2
	sbc ($C8.b)		; F2 C8
	iny		; C8
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
	ora $003C80.l		; 0F 80 3C 00
	cmp $C521.w,X		; DD 21 C5
	ora $E3.b,S		; 03 E3
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b,S),Y		; F3 FF
	pea $02FF.w		; F4 FF 02
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	pea $04FF.w		; F4 FF 04
	tsb $0000.w		; 0C 00 00
	ora ($00.b,S),Y		; 13 00
	pea $06FF.w		; F4 FF 06
	tsb $0000.w		; 0C 00 00
	cmp $E4FF.w,X		; DD FF E4
	sbc $000C08.l,X		; FF 08 0C 00
	brk $ED.b		; 00 ED
	sbc $0AFFE4.l,X		; FF E4 FF 0A
	tsb $0000.w		; 0C 00 00
	sbc $E4FF.w,X		; FD FF E4
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $0D.b		; 00 0D
	brk $E4.b		; 00 E4
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $1D.b		; 00 1D
	brk $E4.b		; 00 E4
	sbc $000C20.l,X		; FF 20 0C 00
	brk $DF.b		; 00 DF
	sbc $22FFD4.l,X		; FF D4 FF 22
	tsb $0000.w		; 0C 00 00
	sbc $FFD4FF.l		; EF FF D4 FF
	bit $0C.b		; 24 0C
	brk $00.b		; 00 00
	sbc $FFD4FF.l,X		; FF FF D4 FF
	rol $0C.b		; 26 0C
	brk $00.b		; 00 00
	ora $FFD400.l		; 0F 00 D4 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	sbc $FFC4FF.l		; EF FF C4 FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	sbc $FFC4FF.l,X		; FF FF C4 FF
	bit $000C.w		; 2C 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $00.b		; 14 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $39.b		; 00 39
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $005D00.l,X		; FF 00 5D 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  48.b		; 80 30
	brk $3C.b		; 00 3C
	brk $3A.b		; 00 3A
	brk $3E.b		; 00 3E
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	cop $60.b		; 02 60
	and $003E80.l,X		; 3F 80 3E 00
	rol $3E00.w,X		; 3E 00 3E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
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
	cpx #$00.b		; E0 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $2E.b		; 00 2E
	brk $64.b		; 00 64
	brk $7F.b		; 00 7F
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $7E.b		; 00 7E
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $BE.b		; 00 BE
	jmp ($3F00.w,X)		; 7C 00 3F
	ora $0F0193.l,X		; 1F 93 01 0F
	ora #$2E.b		; 09 2E
	php		; 08
	and $00.b,S		; 23 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	ora $FE0160.l,X		; 1F 60 01 FE
	ora #$F6.b		; 09 F6
	php		; 08
	and [$00.b],Y		; 37 00
	and ($03.b,S),Y		; 33 03
	cpx $EF00.w		; EC 00 EF
	inc $F6FE.w,X		; FE FE F6
	rol $3C5A.w,X		; 3E 5A 3C
	cmp $06C9BC.l,X		; DF BC C9 06
	sec		; 38
	ora [$05.b]		; 07 05
	ora $FE9E1E.l		; 0F 1E 9E FE
	ora ($36.b,X)		; 01 36
	cmp #$18.b		; C9 18
	sbc [$9C.b]		; E7 9C
	adc $00.b,S		; 63 00
	sbc $053FC0.l,X		; FF C0 3F 05
	asl A		; 0A
	asl $FF80.w,X		; 1E 80 FF
	inc $889D.w,X		; FE 9D 88
	stz $DF00.w,X		; 9E 00 DF
	and ($BD.b),Y		; 31 BD
	adc ($1B.b),Y		; 71 1B
	xce		; FB
	bcc -80.b		; 90 B0
	cpx #$18.b		; E0 18
	inc $8801.w,X		; FE 01 88
	adc [$00.b],Y		; 77 00
	sbc $33EE11.l,X		; FF 11 EE 33
	cpy $E01B.w		; CC 1B E0
	bcc  41.b		; 90 29
	brk $F9.b		; 00 F9
	sta ($90.b,X)		; 81 90
	cmp ($10.b),Y		; D1 10
	eor $5338.w,Y		; 59 38 53
	sei		; 78
	jmp.w [$DC5C]		; DC 5C DC
	jmp.w [$04A4]		; DC A4 04
	sec		; 38
	bpl  -4.b		; 10 FC
	ora ($3C.b,X)		; 01 3C
	cmp $3C.b,S		; C3 3C
	cmp $7C.b,S		; C3 7C
	sta $5F.b,S		; 83 5F
	ldy #$DF.b		; A0 DF
	jsr $F804.w		; 20 04 F8
	bpl -20.b		; 10 EC
	and $3301.w,X		; 3D 01 33
	cmp $83.b,S		; C3 83
	eor ($80.b,X)		; 41 80
	eor ($00.b,X)		; 41 00
	brk $F7.b		; 00 F7
	php		; 08
	cmp [$28.b],Y		; D7 28
	eor $0172.w		; 4D 72 01
	bit $F003.w,X		; 3C 03 F0
	ora ($C2.b,X)		; 01 C2
	asl $DFC1.w,X		; 1E C1 DF
	brk $00.b		; 00 00
	sbc $40FF00.l,X		; FF 00 FF 40
	and $C38282.l,X		; 3F 82 82 C3
	cmp $02C383.l,X		; DF 83 C3 02
	rep #$04		; C2 04
	brk $0D.b		; 00 0D
	cpy $1C.b		; C4 1C
	cpx $DC.b		; E4 DC
	bit $B2.b		; 24 B2
	eor ($C3.b,X)		; 41 C3
	trb $5C83.w		; 1C 83 5C
	cop $DC.b		; 02 DC
	cpy #$3C.b		; C0 3C
	tsb $FB.b		; 04 FB
	asl $F9.b		; 06 F9
	tsb $FB.b		; 04 FB
	brk $5C.b		; 00 5C
	brk $1E.b		; 00 1E
	brk $FE.b		; 00 FE
	brk $F7.b		; 00 F7
	bpl  15.b		; 10 0F
	jsr $3423.w		; 20 23 34
	bmi 109.b		; 30 6D
	jsr $DC00.w		; 20 00 DC
	brk $9E.b		; 00 9E
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $30DF.w		; 20 DF 30
	cmp $00DD20.l		; CF 20 DD 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $7373.w,Y		; F9 73 73
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $73F9.w,Y		; F9 F9 73
	adc ($00.b,S),Y		; 73 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $FF.b,S		; 03 FF
	sbc $007E7E.l,X		; FF 7E 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $FF.b,S		; 03 FF
	sbc $007E7E.l,X		; FF 7E 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sta $F3BFBF.l,X		; 9F BF BF F3
	sbc ($F9.b,S),Y		; F3 F9
	sbc $0000.w,Y		; F9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $BFBF80.l,X		; 9F 80 BF BF
	sbc ($F3.b,S),Y		; F3 F3
	sbc $03F9.w,Y		; F9 F9 03
	rti		; 40

	ora ($C0.b,X)		; 01 C0
	ora ($F0.b,X)		; 01 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	adc ($7F.b,S),Y		; 73 7F
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $737F00.l,X		; FF 00 7F 73
	inc $FCF8.w,X		; FE F8 FC
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	ora $03.b,S		; 03 03
	cmp $F3F3CF.l		; CF CF F3 F3
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	xce		; FB
	ora $CF.b,S		; 03 CF
	cmp $F0F3F3.l		; CF F3 F3 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	sec		; 38
	sbc $3131FF.l,X		; FF FF 31 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	sbc $3131FF.l,X		; FF FF 31 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $64.b		; 64 64
	sbc $D3D3FF.l,X		; FF FF D3 D3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $64.b		; 64 64
	sbc $D3D3FF.l,X		; FF FF D3 D3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $94.b,X		; 94 94
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $94.b,X		; 94 94
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $65.b		; 00 65
	brk $06.b		; 00 06
	brk $0F.b		; 00 0F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $7E.b		; 00 7E
	brk $0F.b		; 00 0F
	brk $0B.b		; 00 0B
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	tsb $DA.b		; 04 DA
	ora ($DC.b,X)		; 01 DC
	ora [$18.b]		; 07 18
	ror $18.b		; 66 18
	inc $1F00.w,X		; FE 00 1F
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	cmp $00DF00.l,X		; DF 00 DF 00
	cmp $001F00.l,X		; DF 00 1F 00
	inc $FE00.w,X		; FE 00 FE
	brk $BF.b		; 00 BF
	brk $C6.b		; 00 C6
	brk $3F.b		; 00 3F
	bra  71.b		; 80 47
	sta $10.b,S		; 83 10
	cmp $00F800.l,X		; DF 00 F8 00
	rts		; 60

	bra  32.b		; 80 20
	brk $E1.b		; 00 E1
	asl $BF00.w		; 0E 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	ora $2118E0.l,X		; 1F E0 18 21
	brk $FF.b		; 00 FF
	cpx #$08.b		; E0 08
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	jsr ($0200.w,X)		; FC 00 02
	sed		; F8
	cop $B8.b		; 02 B8
	tsb $0F10.w		; 0C 10 0F
	brk $FD.b		; 00 FD
	brk $9F.b		; 00 9F
	rts		; 60

	ora $FC.b,S		; 03 FC
	ora ($FE.b,X)		; 01 FE
	eor ($01.b,X)		; 41 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $10.b,S		; 03 10
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	cop $20.b		; 02 20
	ora $60.b,S		; 03 60
	ora $5E62.w,X		; 1D 62 5E
	and ($1F.b,X)		; 21 1F
	rts		; 60

	trb $FF63.w		; 1C 63 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	ora [$CD.b]		; 07 CD
	cmp $96.b,S		; C3 96
	ldx $3CFC.w		; AE FC 3C
	pei ($28.b)		; D4 28
	cpy #$0F.b		; C0 0F
	tsb $01.b		; 04 01
	sec		; 38
	brk $7F.b		; 00 7F
	brk $F1.b		; 00 F1
	asl $38C6.w		; 0E C6 38
	bit $01C0.w,X		; 3C C0 01
	jsr ($CF30.w,X)		; FC 30 CF
	cpx #$07.b		; E0 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp $03.b,S		; C3 03
	ora $1F.b,S		; 03 1F
	ora $FF.b,S		; 03 FF
	sta $1053.w		; 8D 53 10
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $03.b		; 00 03
	cpy #$03.b		; C0 03
	trb $FC03.w		; 1C 03 FC
	ora ($DE.b,X)		; 01 DE
	php		; 08
	sbc [$02.b],Y		; F7 02
	sbc $01.b,X		; F5 01
	rep #$00		; C2 00
	sta ($30.b,X)		; 81 30
	cpy #$B0.b		; C0 B0
	cpy #$C2.b		; C0 C2
	pea $FF80.w		; F4 80 FF
	brk $FD.b		; 00 FD
	clc		; 18
	and [$24.b]		; 27 24
	phd		; 0B
	jmp ($0003.w)		; 6C 03 00
	sbc $C07780.l,X		; FF 80 77 C0
	and [$80.b],Y		; 37 80
	adc $00FD00.l,X		; 7F 00 FD 00
	lda $00FF00.l,X		; BF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rts		; 60

	rti		; 40

	sec		; 38
	rti		; 40

	brk $C0.b		; 00 C0
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
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
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	rol $193E.w,X		; 3E 3E 19
	and $1F3807.l,X		; 3F 07 38 1F
	bpl -50.b		; 10 CE
	cmp $422624.l		; CF 24 26 42
	rti		; 40

	and [$20.b]		; 27 20
	rol $1901.w,X		; 3E 01 19
	rol $00.b		; 26 00
	and $CE8F10.l,X		; 3F 10 8F CE
	and ($24.b),Y		; 31 24
	tas		; 1B
	rti		; 40

	tsa		; 3B
	jsr $00DF.w		; 20 DF 00
	cmp [$80.b]		; C7 80
	cmp [$C1.b],Y		; D7 C1
	plx		; FA
	and ($A8.b,X)		; 21 A8
	asl $E0.b		; 06 E0
	asl $A0.b		; 06 A0
	dec $00.b		; C6 00
	rts		; 60

	tas		; 1B
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpy #$3F.b		; C0 3F
	rts		; 60

	sta $00E708.l		; 8F 08 E7 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $0F900D.l,X		; FF 0D 90 0F
	sta $8F.b,S		; 83 8F
	ora [$8F.b]		; 07 8F
	ora [$C4.b]		; 07 C4
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	sta $8C23.w,X		; 9D 23 8C
	ora [$A8.b],Y		; 17 A8
	ora [$C8.b]		; 07 C8
	brk $CF.b		; 00 CF
	jmp ($0483.w,X)		; 7C 83 04
	adc $07.b,S		; 63 07
	inx		; E8
	ldy #$2F.b		; A0 2F
	.db $82, $0E, $87		; 82 0E 87
	sta $000707.l		; 8F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	sta $F78D72.l		; 8F 72 8D F7
	php		; 08
	adc [$80.b]		; 67 80
	cpx #$01.b		; E0 01
	bvs   3.b		; 70 03
	ror $81.b,X		; 76 81
	rol $80C0.w,X		; 3E C0 80
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	ora ($1C.b,X)		; 01 1C
	rts		; 60

	brk $67.b		; 00 67
	tsb $07.b		; 04 07
	asl $0C2E.w		; 0E 2E 0C
	cpx $8047.w		; EC 47 80
	sei		; 78
	bra  38.b		; 80 26
	sta $7C83.w,Y		; 99 83 7C
	php		; 08
	adc [$04.b],Y		; 77 04
	xce		; FB
	asl $0CF1.w		; 0E F1 0C
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	iny		; C8
	brk $F0.b		; 00 F0
	php		; 08
	dec $18.b		; C6 18
	inc $10.b		; E6 10
	adc $00B380.l		; 6F 80 B3 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	iny		; C8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $060F.w		; 0E 0F 06
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0E.b		; 06 0E
	ora ($06.b,X)		; 01 06
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($18.b,X)		; 01 18
	clc		; 18
	bit #$89.b		; 89 89
	txy		; 9B
	sta $009F9B.l,X		; 9F 9B 9F 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $183F00.l		; 0F 00 3F 18
	ora [$89.b]		; 07 89
	asl $9B.b		; 06 9B
	mvp $64,$9B		; 44 9B 64
	brk $00.b		; 00 00
	brk $73.b		; 00 73
	plp		; 28
	eor ($02.b,S),Y		; 53 02
	lda $8887.w,X		; BD 87 88
	bra -115.b		; 80 8D
	bra -51.b		; 80 CD
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $73.b		; 00 73
	brk $7B.b		; 00 7B
	rti		; 40

	lda $802F90.l,X		; BF 90 2F 80
	adc $7D80.w,X		; 7D 80 7D
	php		; 08
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	ldy #$C0.b		; A0 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ldy #$00.b		; A0 00
	cpy #$00.b		; C0 00
	beq   0.b		; F0 00
	beq  64.b		; F0 40
	bcs  96.b		; B0 60
	brk $20.b		; 00 20
	bpl   0.b		; 10 00
	cld		; D8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	brk $D8.b		; 00 D8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	clc		; 18
	tas		; 1B
	bit $013F.w,X		; 3C 3F 01
	ora $7774.w		; 0D 74 77
	cld		; D8
	cpy #$08.b		; C0 08
	iny		; C8
	.db $62, $78, $00		; 62 78 00
	ora $18.b,S		; 03 18
	ora $3C.b,S		; 03 3C
	ora $01.b,S		; 03 01
	tsb $0374.w		; 0C 74 03
	cpy #$1F.b		; C0 1F
	php		; 08
	dec $60.b		; C6 60
	tas		; 1B
	trb $3223.w		; 1C 23 32
	ora $A01E.w		; 0D 1E A0
	sta $E8.b,S		; 83 E8
	clc		; 18
	rti		; 40

	sec		; 38
	brk $38.b		; 00 38
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $006F80.l,X		; FF 80 6F 00
	sbc $04B803.l,X		; FF 03 B8 04
	lda $8760.w,Y		; B9 60 87
	jmp $00B081.l		; 5C 81 B0 00
	asl $81C0.w,X		; 1E C0 81
	brk $44.b		; 00 44
	tsb $06.b		; 04 06
	asl $04.b		; 06 04
	mvp $BE,$7E		; 44 7E BE
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	and $0642.w,X		; 3D 42 06
	bcc   4.b		; 90 04
	xce		; FB
	rol $08C1.w,X		; 3E C1 08
	brk $5C.b		; 00 5C
	brk $83.b		; 00 83
	jmp $0080.w		; 4C 80 00
	asl $36.b		; 06 36
	eor [$67.b],Y		; 57 67
	ror $66.b		; 66 66
	dec $03CE.w		; CE CE 03
	jsr ($FC01.w,X)		; FC 01 FC
	brk $EF.b		; 00 EF
	tsb $FB.b		; 04 FB
	stx $78.b		; 86 78
	eor [$38.b]		; 47 38
	ror $99.b		; 66 99
	dec $3031.w		; CE 31 30
	bmi  19.b		; 30 13
	bmi   3.b		; 30 03
	bpl   0.b		; 10 00
	brk $40.b		; 00 40
	rti		; 40

	adc ($70.b,X)		; 61 70
	eor ($58.b,X)		; 41 58
	ora $00.b,S		; 03 00
	jsr ($F800.w,X)		; FC 00 F8
	ora $F8.b,S		; 03 F8
	ora $11.b,S		; 03 11
	cpx #$F3.b		; E0 F3
	brk $FE.b		; 00 FE
	ora ($DE.b,X)		; 01 DE
	and ($9C.b,X)		; 21 9C
	adc $0E.b,S		; 63 0E
	tsb $0033.w		; 0C 33 00
	and ($00.b,S),Y		; 33 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	dec $08.b,X		; D6 08
	bit $00D3.w		; 2C D3 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $E0D0D0.l,X		; DF D0 D0 E0
	brk $04.b		; 00 04
	tsb $8E.b		; 04 8E
	stx $80EB.w		; 8E EB 80
	xce		; FB
	brk $6F.b		; 00 6F
	bra 104.b		; 80 68
	ora [$D0.b]		; 07 D0
	and [$00.b]		; 27 00
	sbc $8EF804.l,X		; FF 04 F8 8E
	adc ($80.b),Y		; 71 80
	adc $00FB00.l,X		; 7F 00 FB 00
	sbc $006F00.l		; EF 00 6F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $01.b		; 00 01
	ora $03.b,S		; 03 03
	ora $21.b,S		; 03 21
	and $30.b,S		; 23 30
	and [$70.b],Y		; 37 70
	adc ($44.b,S),Y		; 73 44
	mvp $88,$64		; 44 64 88
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora $00.b,S		; 03 00
	and ($02.b,X)		; 21 02
	bmi   7.b		; 30 07
	bvs   3.b		; 70 03
	mvp $00,$00		; 44 00 00
	cpx $3E07.w		; EC 07 3E
	sta $9D84BE.l		; 8F BE 84 9D
	stx $81.b		; 86 81
	ora $700F70.l		; 0F 70 0F 70
	adc $007E00.l,X		; 7F 00 7E 00
	asl $39.b		; 06 39
	stx $8431.w		; 8E 31 84
	tas		; 1B
	cpy #$1F.b		; C0 1F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora ($7E.b,X)		; 01 7E
	php		; 08
	ora $0F6F8C.l,X		; 1F 8C 6F 0F
	ora $803242.l		; 0F 42 32 80
	ora ($A0.b,X)		; 01 A0
	ora ($30.b,X)		; 01 30
	ora [$20.b]		; 07 20
	jsr $F708.w		; 20 08 F7
	tsb $8FF3.w		; 0C F3 8F
	bpl -126.b		; 10 82
	adc $BF00.w,Y		; 79 00 BF
	php		; 08
	lda [$08.b],Y		; B7 08
	lda [$70.b],Y		; B7 70
	bra  96.b		; 80 60
	bra -24.b		; 80 E8
	bpl -60.b		; 10 C4
	php		; 08
	cpy #$08.b		; C0 08
	rts		; 60

	bra  96.b		; 80 60
	bra   0.b		; 80 00
	jmp.w [$3800]		; DC 00 38
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $CC.b		; 00 CC
	brk $C8.b		; 00 C8
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $DC.b		; 00 DC
	bra  56.b		; 80 38
	asl A		; 0A
	bra  40.b		; 80 28
	brk $E6.b		; 00 E6
	clc		; 18
	pei ($02.b)		; D4 02
	sbc $D4FF.w		; ED FF D4
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFD4.l,X		; FF D4 FF 02
	tsb $0000.w		; 0C 00 00
	ora $D400.w		; 0D 00 D4
	sbc $000C04.l,X		; FF 04 0C 00
	brk $E6.b		; 00 E6
	sbc $06FFE4.l,X		; FF E4 FF 06
	tsb $0000.w		; 0C 00 00
	inc $FF.b,X		; F6 FF
	cpx $FF.b		; E4 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	cpx $FF.b		; E4 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	asl $00.b,X		; 16 00
	cpx $FF.b		; E4 FF
	tsb $000C.w		; 0C 0C 00
	brk $E9.b		; 00 E9
	sbc $0EFFF4.l,X		; FF F4 FF 0E
	tsb $0000.w		; 0C 00 00
	sbc $F4FF.w,Y		; F9 FF F4
	sbc $000C20.l,X		; FF 20 0C 00
	brk $09.b		; 00 09
	brk $F4.b		; 00 F4
	sbc $000C22.l,X		; FF 22 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $09.b,S		; 03 09
	and #$2B.b		; 29 2B
	tsa		; 3B
	brk $03.b		; 00 03
	ora $181B.w,Y		; 19 1B 18
	clc		; 18
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	ora #$20.b		; 09 20
	pld		; 2B
	trb $00.b		; 14 00
	ora $19.b,S		; 03 19
	cop $1C.b		; 02 1C
	ora $00.b,S		; 03 00
	ora $6F00.w,Y		; 19 00 6F
	and $24.b,S		; 23 24
	rts		; 60

	adc [$40.b]		; 67 40
	cmp ($C4.b,X)		; C1 C4
	sta $9097E6.l		; 8F E6 97 90
	pha		; 48
	brk $D9.b		; 00 D9
	bpl -17.b		; 10 EF
	plp		; 28
	cmp [$60.b]		; C7 60
	sta $84B944.l,X		; 9F 44 B9 84
	tda		; 7B
	stx $79.b		; 86 79
	jsr $00DD.w		; 20 DD 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	bra -48.b		; 80 D0
	jsr $10C0.w		; 20 C0 10
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $D0.b		; 00 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	php		; 08
	asl A		; 0A
	ora ($0D.b,X)		; 01 0D
	bit $36.b,X		; 34 36
	pla		; 68
	rts		; 60

	and ($38.b)		; 32 38
	ora ($20.b,X)		; 01 20
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	php		; 08
	ora $01.b,S		; 03 01
	tsb $0334.w		; 0C 34 03
	rts		; 60

	ora $000B30.l		; 0F 30 0B 00
	and ($5A.b,X)		; 21 5A
	eor ($33.b,X)		; 41 33
	jmp $304D.w		; 4C 4D 30
	tsb $22E0.w		; 0C E0 22
	bra  96.b		; 80 60
	brk $03.b		; 00 03
	ora $CF.b		; 05 CF
	ora $00BF40.l		; 0F 40 BF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FA01.l,X		; FF 01 FA 08
	adc $C1.b		; 65 C1
	asl $F00F.w,X		; 1E 0F F0
	php		; 08
	ldy #$C2.b		; A0 C2
	jsr $000F.w		; 20 0F 00
	bmi   0.b		; 30 00
	eor ($45.b,X)		; 41 45
	eor $DB49.w		; 4D 49 DB
	stp		; DB
	lda $FA01BE.l,X		; BF BE 01 FA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	sbc ($0E.b),Y		; F1 0E
	eor #$06.b		; 49 06
	stp		; DB
	bit $BE.b		; 24 BE
	eor ($00.b,X)		; 41 00
	ora ($10.b,X)		; 01 10
	bpl  18.b		; 10 12
	bpl   1.b		; 10 01
	brk $21.b		; 00 21
	jsr $B0A3.w		; 20 A3 B0
	ora $00.b,S		; 03 00
	ora $20.b		; 05 20
	stz $FC61.w		; 9C 61 FC
	ora ($F8.b,X)		; 01 F8
	ora $12.b,S		; 03 12
	sbc ($72.b,X)		; E1 72
	ora ($FC.b,X)		; 01 FC
	ora $5C.b,S		; 03 5C
	lda $F0.b,S		; A3 F0
	ora $34.b		; 05 34
	lda $37.b,X		; B5 37
	and [$4E.b],Y		; 37 4E
	brk $FC.b		; 00 FC
	tsb $FE.b		; 04 FE
	tsb $FF.b		; 04 FF
	brk $D2.b		; 00 D2
	jsr $10D0.w		; 20 D0 10
	bit $CB.b,X		; 34 CB
	and [$C8.b],Y		; 37 C8
	brk $FF.b		; 00 FF
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	asl $C8.b,X		; 16 C8
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bra 112.b		; 80 70
	bra -84.b		; 80 AC
	brk $E0.b		; 00 E0
	brk $7C.b		; 00 7C
	brk $F0.b		; 00 F0
	cpy #$30.b		; C0 30
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bra 108.b		; 80 6C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and #$06.b		; 29 06
	ora [$00.b]		; 07 00
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	lda ($00.b,X)		; A1 00
	adc $0C.b,S		; 63 0C
	ora ($10.b,X)		; 01 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $A31070.l		; 0F 70 10 A3
	brk $7F.b		; 00 7F
	brk $17.b		; 00 17
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	bit $123F.w,X		; 3C 3F 12
	and $DC021C.l,X		; 3F 1C 02 DC
	cmp $002E28.l,X		; DF 28 2E 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $3C.b,S		; 03 3C
	ora $12.b,S		; 03 12
	and $9E01.w		; 2D 01 9E
	jmp.w [$2823]		; DC 23 28
	ora [$81.b],Y		; 17 81
	ldx $81.b,Y		; B6 81
	stx $27.b,Y		; 96 27
	rti		; 40

	ora ($3A.b,X)		; 01 3A
	ora ($B8.b,X)		; 01 B8
	ora $2C40.w,Y		; 19 40 2C
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	and [$80.b],Y		; 37 80
	ora [$00.b],Y		; 17 00
	adc [$00.b]		; 67 00
	xce		; FB
	brk $F9.b		; 00 F9
	brk $7D.b		; 00 7D
	rti		; 40

	and $F807.w,X		; 3D 07 F8
	cpx #$01.b		; E0 01
	cpx #$01.b		; E0 01
	bra   0.b		; 80 00
	cpx #$07.b		; E0 07
	cpx #$46.b		; E0 46
	cmp $C3.b,S		; C3 C3
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	tsb $EB.b		; 04 EB
	cli		; 58
	ldy #$18.b		; A0 18
	sbc [$58.b]		; E7 58
	lda [$D3.b]		; A7 D3
	jsr $C130.w		; 20 30 C1
	tya		; 98
	eor ($40.b,X)		; 41 40
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	bmi -128.b		; 30 80
	brk $00.b		; 00 00
	ora $38.b,S		; 03 38
	eor $00.b,S		; 43 00
	eor $000F08.l		; 4F 08 0F 00
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	bmi  76.b		; 30 4C
	bra 112.b		; 80 70
	sta $84.b,S		; 83 84
	tda		; 7B
	bpl 111.b		; 10 6F
	php		; 08
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	plp		; 28
	cpy #$28.b		; C0 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E8.b		; 00 E8
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	ora ($58.b,X)		; 01 58
	brk $7F.b		; 00 7F
	brk $38.b		; 00 38
	brk $4E.b		; 00 4E
	brk $0A.b		; 00 0A
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $79.b		; 00 79
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $FE.b		; 00 FE
	brk $7A.b		; 00 7A
	brk $1C.b		; 00 1C
	lda ($17.b)		; B2 17
	tda		; 7B
	eor $014168.l,X		; 5F 68 41 01
	ora ($03.b,X)		; 01 03
	phd		; 0B
	brk $C7.b		; 00 C7
	clc		; 18
.ACCU 16
.INDEX 16
	rep #$3B		; C2 3B
	cpy #$ED12.w		; C0 12 ED
	tad		; 5B
	ldy $40.b		; A4 40
	lda $034031.l,X		; BF 31 40 03
	sei		; 78
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	stx $EF00.w		; 8E 00 EF
	ora $B95D.w,Y		; 19 5D B9
	pha		; 48
	cld		; D8
	bcs -120.b		; B0 88
	bmi -64.b		; 30 C0
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	sbc $1BF609.l,X		; FF 09 F6 1B
	cpx $48.b		; E4 48
	sta ($80.b),Y		; 91 80
	and $F802.w,Y		; 39 02 F8
	tsb $C8.b		; 04 C8
	ora [$C0.b]		; 07 C0
	ldy $62.b		; A4 62
	ldy $B0E2.w		; AC E2 B0
	bcs  82.b		; B0 52
	ora ($62.b),Y		; 11 62
	and $86.b,S		; 23 86
	asl $03.b		; 06 03
	ora ($0E.b,X)		; 01 0E
	and ($70.b,X)		; 21 70
	stx $0EF0.w		; 8E F0 0E
	ldx $1040.w,Y		; BE 40 10
	sbc $22.b,S		; E3 22
	cmp ($37.b),Y		; D1 37
	iny		; C8
	and $30C2.w,X		; 3D C2 30
	cmp $001830.l		; CF 30 18 00
	clc		; 18
	ora ($00.b,X)		; 01 00
	sbc ($0D.b,S),Y		; F3 0D
	tad		; 5B
	lda $58.b		; A5 58
	bmi -64.b		; 30 C0
	cmp $100AC1.l		; CF C1 0A 10
	pld		; 2B
	cpx #$F81B.w		; E0 1B F8
	ora [$01.b]		; 07 01
	inc $FE01.w,X		; FE 01 FE
	bcc 104.b		; 90 68
	cpy #$100F.w		; C0 0F 10
	wai		; CB
	bra  -2.b		; 80 FE
	bra  -9.b		; 80 F7
	brk $0E.b		; 00 0E
	trb $10.b		; 14 10
	and $9010.w,X		; 3D 10 90
	sbc ($E2.b,X)		; E1 E2
	pea $FF40.w		; F4 40 FF
	bra 126.b		; 80 7E
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	bcc 111.b		; 90 6F
	bpl -19.b		; 10 ED
	bra 127.b		; 80 7F
	cpx #$4016.w		; E0 16 40
	lda $000000.l,X		; BF 00 00 00
	bra   0.b		; 80 00
	cpy #$0080.w		; C0 80 00
	bra  96.b		; 80 60
	bra  64.b		; 80 40
	rti		; 40

	brk $00.b		; 00 00
	ldy #$0000.w		; A0 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($32.b)		; 32 32
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($32.b)		; 32 32
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $F70D.w		; 0C 0D F7
	sbc [$07.b],Y		; F7 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	tsb $F7F7.w		; 0C F7 F7
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$E002.w		; A0 02 E0
	asl $B0.b		; 06 B0
	tsb $00.b		; 04 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	tsb $0800.w		; 0C 00 08
	sbc $E01F00.l		; EF 00 1F E0
	ora $F007F0.l		; 0F F0 07 F0
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	bpl   3.b		; 10 03
	jmp $7F00.w		; 4C 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	ora ($80.b,S),Y		; 13 80
	adc $80FF00.l,X		; 7F 00 FF 80
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -125.b		; 10 83
	rti		; 40

	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00C700.l,X		; FF 00 C7 00
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $5AA0.w		; EC A0 5A
	cpx #$001A.w		; E0 1A 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $FA00.w		; EC 00 FA
	brk $FA.b		; 00 FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $1C.b		; 00 1C
	brk $1E.b		; 00 1E
	brk $FE.b		; 00 FE
	rol $BE3F.w,X		; 3E 3F BE
	lda $0F0000.l,X		; BF 00 00 0F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	rol $BEBF.w,X		; 3E BF BE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $02.b		; 00 02
	cop $72.b		; 02 72
	adc ($70.b)		; 72 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $FA.b		; 00 FA
	cop $72.b		; 02 72
	adc ($70.b)		; 72 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $62.b		; 00 62
	.db $62, $4D, $4D		; 62 4D 4D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $62, $62, $4D		; 62 62 4D
	eor $0000.w		; 4D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc $01E310.l		; EF 10 E3 01
	beq  -1.b		; F0 FF
	sbc $FF.b,S		; E3 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc $FFF3FF.l		; EF FF F3 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	sbc $FFF3FF.l,X		; FF FF F3 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora $FFF300.l		; 0F 00 F3 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
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
	asl $01.b		; 06 01
	brk $01.b		; 00 01
	tsb $04.b		; 04 04
	and $37.b		; 25 37
	ora $06.b,S		; 03 06
	ora ($17.b)		; 12 17
	eor $7C.b,S		; 43 7C
	lda $B403A0.l		; AF A0 03 B4
	brk $03.b		; 00 03
	tsb $03.b		; 04 03
	and $1A.b		; 25 1A
	cop $05.b		; 02 05
	ora ($05.b)		; 12 05
	rti		; 40

	and $000FA0.l,X		; 3F A0 0F 00
	sbc [$00.b],Y		; F7 00
	bne  48.b		; D0 30
	brk $0C.b		; 00 0C
	bcs   8.b		; B0 08
	bvs  58.b		; 70 3A
	bmi   8.b		; 30 08
	bpl  64.b		; 10 40
	rol $3000.w,X		; 3E 00 30
	brk $D0.b		; 00 D0
	rti		; 40

	bmi   0.b		; 30 00
	jsr ($F800.w,X)		; FC 00 F8
	bmi  74.b		; 30 4A
	brk $78.b		; 00 78
	brk $7E.b		; 00 7E
	wai		; CB
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	ora ($02.b,X)		; 01 02
	jsr $6000.w		; 20 00 60
	brk $9C.b		; 00 9C
	ora $34.b,S		; 03 34
	asl $0200.w		; 0E 00 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $E700.w,X		; 1E 00 E7
	brk $6B.b		; 00 6B
	brk $FF.b		; 00 FF
	brk $37.b		; 00 37
	brk $1E.b		; 00 1E
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	sbc $2D9765.l,X		; FF 65 97 2D
	pla		; 68
	stz $08.b		; 64 08
	bvs -16.b		; 70 F0
	brk $80.b		; 00 80
	brk $9E.b		; 00 9E
	jsr $0000.w		; 20 00 00
	adc $9A.b		; 65 9A
	ora $FA.b		; 05 FA
	rts		; 60

	ora $7C00.w		; 0D 00 7C
	ora $F0.b,S		; 03 F0
	adc [$88.b],Y		; 77 88
	ora ($FE.b,X)		; 01 FE
	brk $7E.b		; 00 7E
	bne -55.b		; D0 C9
	cpx #$4BE0.w		; E0 E0 4B
	jmp $199B.w		; 4C 9B 19
	asl $0240.w,X		; 1E 40 02
	eor ($1F.b,X)		; 41 1F
	bra   0.b		; 80 00
	cpy #$19E6.w		; C0 E6 19
	sbc $A74800.l,X		; FF 00 48 A7
	adc $6182.w,X		; 7D 82 61
	stz $03F8.w,X		; 9E F8 03
	cpy #$C03F.w		; C0 3F C0
	bpl   0.b		; 10 00
	sta $EB0324.l		; 8F 24 03 EB
	jsr $1894.w		; 20 94 18
	bmi -33.b		; 30 DF
	sty $03.b		; 84 03
	asl A		; 0A
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $206F80.l		; EF 80 6F 20
	cmp $108F10.l,X		; DF 10 8F 10
	sbc $00F700.l		; EF 00 F7 00
	ora $000000.l,X		; 1F 00 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	rti		; 40

	bra  64.b		; 80 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	ora $04.b,S		; 03 04
	inc A		; 1A
	tas		; 1B
	ora $20.b,S		; 03 20
	asl $11.b		; 06 11
	ora ($38.b),Y		; 11 38
	cpx $F8.b		; E4 F8
	bra -64.b		; 80 C0
	ora $00C1.w,X		; 1D C1 00
	ora [$1A.b]		; 07 1A
	ora $00.b		; 05 00
	and $101F00.l		; 2F 00 1F 10
	pld		; 2B
	cpx #$881F.w		; E0 1F 88
	eor ($01.b,S),Y		; 53 01
	dec $C393.w,X		; DE 93 C3
	rol A		; 2A
	bra -120.b		; 80 88
	bvc -32.b		; 50 E0
	bpl  16.b		; 10 10
	brk $A2.b		; 00 A2
	rol $EA.b		; 26 EA
	ror A		; 6A
	dec $87DC.w,X		; DE DC 87
	bvs   0.b		; 70 00
	tyx		; BB
	ora $F8.b,S		; 03 F8
	ora ($FE.b,X)		; 01 FE
	cop $FD.b		; 02 FD
	adc ($8C.b)		; 72 8C
	ror A		; 6A
	sta $DD.b,X		; 95 DD
	jsl $003134.l		; 22 34 31 00
	phd		; 0B
	cop $0A.b		; 02 0A
	.db $42, $42		; 42 42
	ora $808F00.l		; 0F 00 8F 80
	asl $2E00.w,X		; 1E 00 2E
	.db $82, $F2, $05		; 82 F2 05
	bra  31.b		; 80 1F
	.db $62, $8D, $E2		; 62 8D E2
	ora $8F50.w		; 0D 50 8F
	bne  15.b		; D0 0F
	rts		; 60

	sta $002DC2.l,X		; 9F C2 2D 00
	bra   0.b		; 80 00
	ldy #$5000.w		; A0 00 50
	cpy #$20C0.w		; C0 C0 20
	jsr $0090.w		; 20 90 00
	bra  56.b		; 80 38
	brk $1C.b		; 00 1C
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	cpy #$203C.w		; C0 3C 20
	bne   0.b		; D0 00
	beq   0.b		; F0 00
	clv		; B8
	bra  60.b		; 80 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $1B1BEF.l		; EF EF 1B 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $1B1BEF.l		; EF EF 1B 1B
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	bra -73.b		; 80 B7
	sbc [$98.b],Y		; F7 98
	cld		; D8
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F7.b		; 00 F7
	lda [$D8.b],Y		; B7 D8
	tya		; 98
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
	brk $FE.b		; 00 FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sed		; F8
	ora [$F2.b]		; 07 F2
	brk $F8.b		; 00 F8
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFFA.l,X		; FF FA FF 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	plx		; FA
	sbc $000C03.l,X		; FF 03 0C 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $01.b,S		; 03 01
	asl $01.b		; 06 01
	ora $1014.w,X		; 1D 14 10
	brk $10.b		; 00 10
	sta $87.b		; 85 87
	ror $0018.w,X		; 7E 18 00
	ora ($01.b,X)		; 01 01
	cop $00.b		; 02 00
	ora [$03.b]		; 07 03
	trb $0D12.w		; 1C 12 0D
	brk $3E.b		; 00 3E
	sta $42.b		; 85 42
	clc		; 18
	adc [$40.b]		; 67 40
	jsr $4020.w		; 20 20 40
	jsr $4000.w		; 20 00 40
	rti		; 40

	php		; 08
	bpl 112.b		; 10 70
	bra -68.b		; 80 BC
	bra -64.b		; 80 C0
	stx $00.b,Y		; 96 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	cpx #$8000.w		; E0 00 80
	sei		; 78
	bra 124.b		; 80 7C
	cpy #$803C.w		; C0 3C 80
	lsr $C405.w,X		; 5E 05 C4
	bpl  40.b		; 10 28
	bmi   0.b		; 30 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora $05.b		; 05 05
	brk $00.b		; 00 00
	trb $C3.b		; 14 C3
	cop $B8.b		; 02 B8
	ora #$0176.w		; 09 76 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	ora $00.b		; 05 00
	brk $4B.b		; 00 4B
	sec		; 38
	stz $3E.b		; 64 3E
	and ($00.b)		; 32 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	php		; 08
	sbc [$A4.b],Y		; F7 A4
	phy		; 5A
	bra 118.b		; 80 76
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $F607.w,Y		; F9 07 F6
	ora ($F9.b,X)		; 01 F9
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FE.b		; 00 FE
	sbc $02FFF2.l,X		; FF F2 FF 02
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	and [$00.b]		; 27 00
	and [$00.b],Y		; 37 00
	cmp $007B00.l,X		; DF 00 7B 00
	ora $00FF00.l,X		; 1F 00 FF 00
	ora $050500.l		; 0F 00 05 05
	and $27.b		; 25 27
	and [$37.b],Y		; 37 37
	stp		; DB
	cmp $187B70.l,X		; DF 70 7B 18
	ora $00FFF9.l,X		; 1F F9 FF 00
	ora $C000C0.l		; 0F C0 00 C0
	brk $D4.b		; 00 D4
	brk $DC.b		; 00 DC
	brk $F0.b		; 00 F0
	brk $6E.b		; 00 6E
	brk $FC.b		; 00 FC
	brk $EC.b		; 00 EC
	brk $40.b		; 00 40
	cpy #$C000.w		; C0 00 C0
	bra -44.b		; 80 D4
	rti		; 40

	jmp.w [$F000]		; DC 00 F0
	brk $6E.b		; 00 6E
	brk $FC.b		; 00 FC
	brk $EC.b		; 00 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $B8.b		; 00 B8
	brk $B8.b		; 00 B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $2020.w		; 20 20 20
	tay		; A8
	clv		; B8
	tay		; A8
	clv		; B8
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	xce		; FB
	ora $F8.b		; 05 F8
	brk $FB.b		; 00 FB
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sed		; F8
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FE.b		; 00 FE
	sbc $020000.l,X		; FF 00 00 02
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	asl $00.b,X		; 16 00
	asl $00.b,X		; 16 00
	lsr $7E00.w,X		; 5E 00 7E
	brk $BE.b		; 00 BE
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $04.b		; 00 04
	tsb $16.b		; 04 16
	asl $16.b,X		; 16 16
	asl $54.b,X		; 16 54
	lsr $7E7C.w,X		; 5E 7C 7E
	ldx $20BE.w		; AE BE 20
	and $00FFE4.l,X		; 3F E4 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FA02.w,X)		; FC 02 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	bpl   0.b		; 10 00
	sec		; 38
	brk $38.b		; 00 38
	brk $78.b		; 00 78
	brk $DC.b		; 00 DC
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl  48.b		; 10 30
	sec		; 38
	bmi  56.b		; 30 38
	sei		; 78
	sei		; 78
	cpy #$D0DC.w		; C0 DC D0
	inc $3E00.w,X		; FE 00 3E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FC02.w,X		; FE 02 FC
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $B0.b		; 00 B0
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rts		; 60

	cpx #$80E0.w		; E0 E0 80
	bcs   0.b		; B0 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FE00.w		; 0D 00 FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $000C00.l,X		; FF 00 0C 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	asl $F7.b		; 06 F7
	cop $F8.b		; 02 F8
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	xce		; FB
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FD.b		; 00 FD
	sbc $02FFF3.l,X		; FF F3 FF 02
	asl $0000.w		; 0E 00 00
	asl $09.b		; 06 09
	ora ($08.b,X)		; 01 08
	brk $03.b		; 00 03
	bpl  12.b		; 10 0C
	tsb $1130.w		; 0C 30 11
	plp		; 28
	sbc #$2A10.w		; E9 10 2A
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $10.b		; 00 10
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $26.b		; 00 26
	brk $4C.b		; 00 4C
	brk $F2.b		; 00 F2
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	rti		; 40

	cli		; 58
	ldy #$00DC.w		; A0 DC 00
	mvp $00,$80		; 44 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	tsb $F9.b		; 04 F9
	ora ($FA.b,X)		; 01 FA
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FD.b		; 00 FD
	sbc $02FFF2.l,X		; FF F2 FF 02
	asl $0000.w		; 0E 00 00
	tas		; 1B
	brk $09.b		; 00 09
	bpl   4.b		; 10 04
	brk $02.b		; 00 02
	tsb $1020.w		; 0C 20 10
	and $40.b		; 25 40
	dec $20.b		; C6 20
	phk		; 4B
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
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
	brk $50.b		; 00 50
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	ora $FB.b,S		; 03 FB
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	php		; 08
	bmi   4.b		; 30 04
	jsr $0010.w		; 20 10 00
	php		; 08
	bpl  32.b		; 10 20
	rti		; 40

	sta ($40.b)		; 92 40
	ora $0000.w		; 0D 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3E.b		; 00 3E
	brk $7E.b		; 00 7E
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	bvc   0.b		; 50 00
	jsr $4000.w		; 20 00 40
	bra -112.b		; 80 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	php		; 08
	sed		; F8
	ora $F9.b,S		; 03 F9
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sed		; F8
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FA.b		; 00 FA
	sbc $020000.l,X		; FF 00 00 02
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora $0E.b,S		; 03 0E
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $08.b		; 04 08
	asl A		; 0A
	bit $08.b		; 24 08
	ror $29.b,X		; 76 29
	cmp ($3D.b)		; D2 3D
	cpy #$AC00.w		; C0 00 AC
	brk $40.b		; 00 40
	asl $00.b		; 06 00
	ora $003F00.l,X		; 1F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $DC10.w		; 0C 10 DC
	jsr $08B4.w		; 20 B4 08
	cpy $28.b		; C4 28
	sec		; 38
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bne -65.b		; D0 BF
	brk $0B.b		; 00 0B
	brk $02.b		; 00 02
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
	brk $C2.b		; 00 C2
	brk $FC.b		; 00 FC
	brk $50.b		; 00 50
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	ora $FA.b		; 05 FA
	cop $FB.b		; 02 FB
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	asl $0000.w		; 0E 00 00
	bpl   0.b		; 10 00
	php		; 08
	bvc   0.b		; 50 00
	sed		; F8
	adc $80.b,X		; 75 80
	cop $51.b		; 02 51
	ora ($80.b,X)		; 01 80
	lda $001500.l,X		; BF 00 15 00
	bit $7E00.w,X		; 3C 00 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra -64.b		; 80 C0
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	cop $FC.b		; 02 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	jsr $0200.w		; 20 00 02
	cpx #$827C.w		; E0 7C 82
	php		; 08
	rol $04.b		; 26 04
	bra  62.b		; 80 3E
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FD.b		; 02 FD
	brk $FE.b		; 00 FE
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	brk $C0.b		; 00 C0
	sed		; F8
	brk $10.b		; 00 10
	bra  32.b		; 80 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000E00.l,X		; FF 00 0E 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	ora #$01F3.w		; 09 F3 01
	jsr ($F3FF.w,X)		; FC FF F3
	sbc $000C00.l,X		; FF 00 0C 00
	brk $04.b		; 00 04
	brk $F3.b		; 00 F3
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FC.b		; 00 FC
	sbc $02FFFB.l,X		; FF FB FF 02
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	xce		; FB
	sbc $000C03.l,X		; FF 03 0C 00
	brk $18.b		; 00 18
	trb $1C18.w		; 1C 18 1C
	bpl  28.b		; 10 1C
	rts		; 60

	sei		; 78
	rts		; 60

	sei		; 78
	rti		; 40

	adc $0D20.w,Y		; 79 20 0D
	jsl $001C85.l		; 22 85 1C 00
	trb $1C00.w		; 1C 00 1C
	brk $70.b		; 00 70
	php		; 08
	bvs   8.b		; 70 08
	bvs   9.b		; 70 09
	jsr $222D.w		; 20 2D 22
	lda [$00.b]		; A7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	jsr $1497.w		; 20 97 14
	eor $14.b,S		; 43 14
	lsr A		; 4A
	bpl 110.b		; 10 6E
	brk $1C.b		; 00 1C
	and ($0C.b)		; 32 0C
	eor $000000.l		; 4F 00 00 00
	jsr $14B7.w		; 20 B7 14
	eor [$14.b],Y		; 57 14
	lsr $7E10.w,X		; 5E 10 7E
	brk $1C.b		; 00 1C
	brk $3E.b		; 00 3E
	brk $4F.b		; 00 4F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pea $C800.w		; F4 00 C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pea $C800.w		; F4 00 C8
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $F606.w,X		; FD 06 F6
	ora ($FD.b,X)		; 01 FD
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $FEFF.w,X		; FD FF FE
	sbc $000C01.l,X		; FF 01 0C 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000C02.l,X		; FF 02 0C 00
	brk $20.b		; 00 20
	bmi  32.b		; 30 20
	bmi -64.b		; 30 C0
	sep #$C0		; E2 C0
	sep #$40		; E2 40
	trb $48.b		; 14 48
	trb $40.b		; 14 40
	bit $8C30.w,X		; 3C 30 8C
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	cpx #$E002.w		; E0 02 E0
	cop $40.b		; 02 40
	mvn $5C,$48		; 54 48 5C
	rti		; 40

	jmp ($BC30.w,X)		; 7C 30 BC
	jsr $00D8.w		; 20 D8 00
	bmi 107.b		; 30 6B
	bpl -98.b		; 10 9E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	sed		; F8
	brk $30.b		; 00 30
	brk $7B.b		; 00 7B
	brk $9E.b		; 00 9E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	inc $F904.w,X		; FE 04 F9
	ora ($FE.b,X)		; 01 FE
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	inc $01FF.w,X		; FE FF 01
	brk $01.b		; 00 01
	tsb $0000.w		; 0C 00 00
	rti		; 40

	rts		; 60

	bra -64.b		; 80 C0
	bra -56.b		; 80 C8
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	rts		; 60

	bcc  64.b		; 90 40
	ldy #$204C.w		; A0 4C 20
	rts		; 60

	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	php		; 08
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	rts		; 60

	beq  64.b		; F0 40
	cpx #$6C00.w		; E0 00 6C
	tsx		; BA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsx		; BA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	tsb $01.b		; 04 01
	xce		; FB
	brk $FF.b		; 00 FF
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	brk $40.b		; 00 40
	bra -128.b		; 80 80
	bra  96.b		; 80 60
	rti		; 40

	jsr $4000.w		; 20 00 40
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	cpx #$6040.w		; E0 40 60
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0C00FF.l,X		; FF FF 00 0C
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc ($0D.b)		; F2 0D
	stp		; DB
	ora $F2.b,S		; 03 F2
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	pea $02FF.w		; F4 FF 02
	asl $0000.w		; 0E 00 00
	sbc ($FF.b)		; F2 FF
	cpx $FF.b		; E4 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cpx $FF.b		; E4 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFD4.l,X		; FF D4 FF 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	jmp ($037C.w,X)		; 7C 7C 03
	ora $00.b,S		; 03 00
	brk $08.b		; 00 08
	php		; 08
	asl $031E.w,X		; 1E 1E 03
	ora $03.b,S		; 03 03
	jsr ($4738.w,X)		; FC 38 47
	jmp ($0303.w,X)		; 7C 03 03
	brk $C3.b		; 00 C3
	bit $1728.w,X		; 3C 28 17
	asl $0301.w,X		; 1E 01 03
	brk $18.b		; 00 18
	clc		; 18
	brk $00.b		; 00 00
	tya		; 98
	tya		; 98
	sed		; F8
	sed		; F8
	ora ($01.b,X)		; 01 01
	clc		; 18
	clc		; 18
	cld		; D8
	cld		; D8
	sbc [$F7.b],Y		; F7 F7
	asl $3F00.w,X		; 1E 00 3F
	cpy #$619E.w		; C0 9E 61
	sed		; F8
	ora [$07.b]		; 07 07
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $3E.b		; 04 3E
	rol $F8F8.w,X		; 3E F8 F8
	cpy #$07C0.w		; C0 C0 07
	ora [$0B.b]		; 07 0B
	phd		; 0B
	bcs -80.b		; B0 B0
	ora $02FC00.l		; 0F 00 FC 02
	rol $F9C0.w,X		; 3E C0 F9
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $CB.b		; 00 CB
	tsb $B0.b		; 04 B0
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	asl $06.b		; 06 06
	jsr $0020.w		; 20 20 00
	brk $06.b		; 00 06
	asl $03.b		; 06 03
	ora $10.b,S		; 03 10
	bpl   0.b		; 10 00
	brk $18.b		; 00 18
	jsr $1866.w		; 20 66 18
	tsa		; 3B
	tsb $00.b		; 04 00
	ora $030106.l,X		; 1F 06 01 03
	sec		; 38
	ora ($6C.b,S),Y		; 13 6C
	cpy #$23C0.w		; C0 C0 23
	and $3B.b,S		; 23 3B
	tsa		; 3B
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	cpy #$C3C0.w		; C0 C0 C3
	cmp $98.b,S		; C3 98
	tya		; 98
	cmp [$38.b]		; C7 38
	and $DC.b,S		; 23 DC
	and $003600.l,X		; 3F 00 36 00
	rol $C1.b,X		; 36 C1
	cpx #$C31F.w		; E0 1F C3
	tsb $009E.w		; 0C 9E 00
	sec		; 38
	sec		; 38
	cmp $C3.b,S		; C3 C3
	dec $C6.b		; C6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	rts		; 60

	rts		; 60

	ora $03.b,S		; 03 03
	clv		; B8
	brk $C3.b		; 00 C3
	brk $C7.b		; 00 C7
	brk $07.b		; 00 07
	clc		; 18
	bit $F8C0.w,X		; 3C C0 F8
	brk $6F.b		; 00 6F
	brk $7B.b		; 00 7B
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
	bra  96.b		; 80 60
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
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $00.b		; 02 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	brk $0F.b		; 00 0F
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$04.b],Y		; 77 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $DC.b		; 00 DC
	brk $30.b		; 00 30
	brk $7F.b		; 00 7F
	bra 119.b		; 80 77
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $5E00.w		; 2D 00 5E
	brk $A4.b		; 00 A4
	brk $B8.b		; 00 B8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1C.b		; 00 1C
	trb $0303.w		; 1C 03 03
	asl $06.b		; 06 06
	ora [$07.b]		; 07 07
	clc		; 18
	clc		; 18
	php		; 08
	php		; 08
	cop $02.b		; 02 02
	tsb $04.b		; 04 04
	ora $0302.w,X		; 1D 02 03
	brk $36.b		; 00 36
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	jsr $3008.w		; 20 08 30
	cop $0D.b		; 02 0D
	sty $03.b		; 84 03
	sei		; 78
	sei		; 78
	eor ($41.b,X)		; 41 41
	ora ($13.b,S),Y		; 13 13
	inc $C0FE.w,X		; FE FE C0
	cpy #$0000.w		; C0 00 00
	eor ($53.b,S),Y		; 53 53
	sbc ($F1.b),Y		; F1 F1
	sbc $A64900.l,X		; FF 00 49 A6
	ora ($0C.b,S),Y		; 13 0C
	inc $C300.w,X		; FE 00 C3
	bit $4F30.w,X		; 3C 30 4F
	tad		; 5B
	ldy $FF.b		; A4 FF
	brk $39.b		; 00 39
	and $FAFA.w,Y		; 39 FA FA
	stp		; DB
	stp		; DB
	cpy $CBCC.w		; CC CC CB
	wai		; CB
	rol $26.b		; 26 26
	sed		; F8
	sed		; F8
	cld		; D8
	cld		; D8
	and $FAC6.w,Y		; 39 C6 FA
	tsb $DB.b		; 04 DB
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $26.b		; 00 26
	cpy #$00F8.w		; C0 F8 00
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$80E0.w		; E0 E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	asl $C60E.w		; 0E 0E C6
	dec $C0.b		; C6 C0
	cpy #$0201.w		; C0 01 02
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	brk $01.b		; 00 01
	ora $CF00.w,Y		; 19 00 CF
	bmi -25.b		; 30 E7
	clc		; 18
	cmp $C0C000.l		; CF 00 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$4040.w		; C0 40 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	ror $C06E.w		; 6E 6E C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -17.b		; 80 EF
	brk $FE.b		; 00 FE
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F5.b		; 00 F5
	ora #$02E3.w		; 09 E3 02
	sbc $FF.b,X		; F5 FF
	sbc $FF.b,S		; E3 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc $FF.b,S		; E3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	sbc ($FF.b,S),Y		; F3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc ($FF.b,S),Y		; F3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	tsb $0C0C.w		; 0C 0C 0C
	tsb CGADD.w		; 0C 21 21
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $0E02.w		; 0D 02 0E
	ora ($0D.b,X)		; 01 0D
	brk $21.b		; 00 21
	.db $42, $30		; 42 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi   0.b		; 30 00
	brk $C0.b		; 00 C0
	cpy #$D8D8.w		; C0 D8 D8
	tas		; 1B
	tas		; 1B
	bit $303C.w,X		; 3C 3C 30
	rti		; 40

	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	brk $20.b		; 00 20
	cpy #$FB20.w		; C0 20 FB
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsl $080822.l		; 22 22 08 08
	ora ($13.b,S),Y		; 13 13
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	rol $0841.w,X		; 3E 41 08
	ora [$13.b],Y		; 17 13
	tsb $F00C.w		; 0C 0C F0
	adc ($9E.b,X)		; 61 9E
	ora $708C00.l		; 0F 00 8C 70
	eor $3C.b,S		; 43 3C
	ora $BF0D.w		; 0D 0D BF
	lda $C09F9F.l,X		; BF 9F 9F C0
	cpy #$0000.w		; C0 00 00
	cmp $1C1CCF.l		; CF CF 1C 1C
	cpy #$3FC0.w		; C0 C0 3F
	cpy #$00FF.w		; C0 FF 00
	sbc $00E100.l,X		; FF 00 E1 00
	sbc $30CF00.l,X		; FF 00 CF 30
	and $00EF00.l,X		; 3F 00 EF 00
	rts		; 60

	rts		; 60

	sec		; 38
	sec		; 38
	jsr $0020.w		; 20 20 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $20.b		; 00 20
	jsr $C8C8.w		; 20 C8 C8
	cpx #$3800.w		; E0 00 38
	brk $38.b		; 00 38
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $C8.b		; 00 C8
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $4119.w,Y		; 19 19 41
	eor ($1A.b,X)		; 41 1A
	inc A		; 1A
	asl $220E.w		; 0E 0E 22
	jsl $183131.l		; 22 31 31 18
	clc		; 18
	ora $20D91F.l,X		; 1F 1F D9 20
	adc $1B10.w		; 6D 10 1B
	tsb $0E.b		; 04 0E
	rts		; 60

	rol $37D0.w		; 2E D0 37
	php		; 08
	sei		; 78
	brk $3F.b		; 00 3F
	brk $FC.b		; 00 FC
	jsr ($8080.w,X)		; FC 80 80
	ora [$07.b]		; 07 07
	bit $34.b,X		; 34 34
	cpy #$C3C0.w		; C0 C0 C3
	cmp $BF.b,S		; C3 BF
	lda $FCEDED.l,X		; BF ED ED FC
	brk $A0.b		; 00 A0
	ora $0F.b,S		; 03 0F
	beq  53.b		; F0 35
	rti		; 40

	sbc [$00.b]		; E7 00
	sbc ($0C.b,S),Y		; F3 0C
	lda $00EF40.l,X		; BF 40 EF 00
	bra -128.b		; 80 80
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bcc -112.b		; 90 90
	cld		; D8
	jsr $00D8.w		; 20 D8 00
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
	brk $40.b		; 00 40
	bra 120.b		; 80 78
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
	brk $0F.b		; 00 0F
	ora $000101.l		; 0F 01 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $52.b		; 00 52
	brk $1D.b		; 00 1D
	brk $35.b		; 00 35
	cop $0F.b		; 02 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BA.b		; 00 BA
	tsx		; BA
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	sta [$00.b]		; 87 00
	sed		; F8
	brk $BA.b		; 00 BA
	ora ($BB.b,X)		; 01 BB
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	ora [$EA.b]		; 07 EA
	ora ($F8.b,X)		; 01 F8
	sbc $00FFEA.l,X		; FF EA FF 00
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $02FFFA.l,X		; FF FA FF 02
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	asl $06.b		; 06 06
	bpl  16.b		; 10 10
	mvp $36,$44		; 44 44 36
	rol $00.b,X		; 36 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($05.b,X)		; 01 05
	brk $17.b		; 00 17
	php		; 08
	ora [$00.b],Y		; 17 00
	mvp $B7,$0B		; 44 0B B7
	rti		; 40

	ora [$78.b]		; 07 78
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	dec $C6.b		; C6 C6
	iny		; C8
	iny		; C8
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	dec $00.b		; C6 00
	cmp $C03800.l		; CF 00 38 C0
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	ora $00011F.l,X		; 1F 1F 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	rol $00.b,X		; 36 00
	adc [$08.b]		; 67 08
	sta ($60.b),Y		; 91 60
	ora $001F70.l		; 0F 70 1F 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	cpy #$0DC0.w		; C0 C0 0D
	ora $E0E0.w		; 0D E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $E8.b		; 00 E8
	brk $DF.b		; 00 DF
	brk $7D.b		; 00 7D
	brk $E0.b		; 00 E0
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $18.b		; 00 18
	clc		; 18
	ror $66.b		; 66 66
	bpl  16.b		; 10 10
	and $00003F.l,X		; 3F 3F 00 00
	ora ($12.b)		; 12 12
	cop $02.b		; 02 02
	nop		; EA
	nop		; EA
	clc		; 18
	eor ($6F.b,X)		; 41 6F
	bpl  16.b		; 10 10
	ora $007F.w		; 0D 7F 00
	asl $41.b		; 06 41
	ora ($2D.b)		; 12 2D
	ora ($E0.b,S),Y		; 13 E0
	xba		; EB
	trb $A0.b		; 14 A0
	ldy #$3434.w		; A0 34 34
	beq -16.b		; F0 F0
	phy		; 5A
	phy		; 5A
	plp		; 28
	plp		; 28
	sbc ($F3.b,S),Y		; F3 F3
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	ldy $B400.w,X		; BC 00 B4
	pha		; 48
	beq   8.b		; F0 08
	lsr $2800.w,X		; 5E 00 28
	cpy #$00F3.w		; C0 F3 00
	asl $3800.w,X		; 1E 00 38
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	xce		; FB
	tsb $F2.b		; 04 F2
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc ($FF.b)		; F2 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFA.l,X		; FF FA FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000E03.l,X		; FF 03 0E 00
	brk $04.b		; 00 04
	tsb $10.b		; 04 10
	bpl  36.b		; 10 24
	bit $14.b		; 24 14
	trb $90.b		; 14 90
	bcc  38.b		; 90 26
	rol $52.b		; 26 52
	eor ($79.b)		; 52 79
	adc $0804.w,Y		; 79 04 08
	clc		; 18
	brk $2F.b		; 00 2F
	bpl  20.b		; 10 14
	dey		; 88
	lda $2740.w,Y		; B9 40 27
	dey		; 88
	ror $7901.w,X		; 7E 01 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $32.b		; 00 32
	and ($01.b)		; 32 01
	ora ($1E.b,X)		; 01 1E
	asl $0008.w,X		; 1E 08 00
	wai		; CB
	brk $7F.b		; 00 7F
	brk $06.b		; 00 06
	sei		; 78
	and #$32C0.w		; 29 C0 32
	tsb $609B.w		; 0C 9B 60
	asl $0800.w,X		; 1E 00 08
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $F9.b		; 02 F9
	brk $FE.b		; 00 FE
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	rti		; 40

	rts		; 60

	rts		; 60

	jsr $D020.w		; 20 20 D0
	bne   0.b		; D0 00
	brk $18.b		; 00 18
	clc		; 18
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	rti		; 40

	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $D0.b		; 00 D0
	brk $10.b		; 00 10
	bra  88.b		; 80 58
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $F2.b		; 00 F2
	ora $04DC.w		; 0D DC 04
	sbc ($FF.b)		; F2 FF
	sbc $FF.b,X		; F5 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFD5.l,X		; FF D5 FF 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	jmp ($037C.w,X)		; 7C 7C 03
	ora $00.b,S		; 03 00
	brk $08.b		; 00 08
	php		; 08
	asl $031E.w,X		; 1E 1E 03
	ora $03.b,S		; 03 03
	jsr ($4738.w,X)		; FC 38 47
	jmp ($0303.w,X)		; 7C 03 03
	brk $C3.b		; 00 C3
	bit $1728.w,X		; 3C 28 17
	asl $0301.w,X		; 1E 01 03
	brk $18.b		; 00 18
	clc		; 18
	brk $00.b		; 00 00
	tya		; 98
	tya		; 98
	sed		; F8
	sed		; F8
	ora ($01.b,X)		; 01 01
	clc		; 18
	clc		; 18
	cld		; D8
	cld		; D8
	sbc [$F7.b],Y		; F7 F7
	asl $3F00.w,X		; 1E 00 3F
	cpy #$619E.w		; C0 9E 61
	sed		; F8
	ora [$07.b]		; 07 07
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $3E.b		; 04 3E
	rol $F8F8.w,X		; 3E F8 F8
	cpy #$07C0.w		; C0 C0 07
	ora [$0B.b]		; 07 0B
	phd		; 0B
	bcs -80.b		; B0 B0
	ora $02FC00.l		; 0F 00 FC 02
	rol $F9C0.w,X		; 3E C0 F9
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $CB.b		; 00 CB
	tsb $B0.b		; 04 B0
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	asl $06.b		; 06 06
	jsr $0020.w		; 20 20 00
	brk $06.b		; 00 06
	asl $03.b		; 06 03
	ora $10.b,S		; 03 10
	bpl   0.b		; 10 00
	brk $18.b		; 00 18
	jsr $1866.w		; 20 66 18
	tsa		; 3B
	tsb $00.b		; 04 00
	ora $030106.l,X		; 1F 06 01 03
	sec		; 38
	ora ($6C.b,S),Y		; 13 6C
	cpy #$23C0.w		; C0 C0 23
	and $3B.b,S		; 23 3B
	tsa		; 3B
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	cpy #$C3C0.w		; C0 C0 C3
	cmp $98.b,S		; C3 98
	tya		; 98
	cmp [$38.b]		; C7 38
	and $DC.b,S		; 23 DC
	and $003600.l,X		; 3F 00 36 00
	rol $C1.b,X		; 36 C1
	cpx #$C31F.w		; E0 1F C3
	tsb $009E.w		; 0C 9E 00
	sec		; 38
	sec		; 38
	cmp $C3.b,S		; C3 C3
	dec $C6.b		; C6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	rts		; 60

	rts		; 60

	ora $03.b,S		; 03 03
	clv		; B8
	brk $C3.b		; 00 C3
	brk $C7.b		; 00 C7
	brk $07.b		; 00 07
	clc		; 18
	bit $F8C0.w,X		; 3C C0 F8
	brk $6F.b		; 00 6F
	brk $7B.b		; 00 7B
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
	bra  96.b		; 80 60
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
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $00.b		; 02 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	brk $0F.b		; 00 0F
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$04.b],Y		; 77 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $DC.b		; 00 DC
	brk $30.b		; 00 30
	brk $7F.b		; 00 7F
	bra 119.b		; 80 77
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $5E00.w		; 2D 00 5E
	brk $A4.b		; 00 A4
	brk $B8.b		; 00 B8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1C.b		; 00 1C
	trb $0303.w		; 1C 03 03
	asl $06.b		; 06 06
	ora [$07.b]		; 07 07
	clc		; 18
	clc		; 18
	php		; 08
	php		; 08
	cop $02.b		; 02 02
	tsb $04.b		; 04 04
	ora $0302.w,X		; 1D 02 03
	brk $36.b		; 00 36
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	jsr $3008.w		; 20 08 30
	cop $0D.b		; 02 0D
	sty $03.b		; 84 03
	sei		; 78
	sei		; 78
	eor ($41.b,X)		; 41 41
	ora ($13.b,S),Y		; 13 13
	inc $C0FE.w,X		; FE FE C0
	cpy #$0000.w		; C0 00 00
	eor ($53.b,S),Y		; 53 53
	sbc ($F1.b),Y		; F1 F1
	sbc $A64900.l,X		; FF 00 49 A6
	ora ($0C.b,S),Y		; 13 0C
	inc $C300.w,X		; FE 00 C3
	bit $4F30.w,X		; 3C 30 4F
	tad		; 5B
	ldy $FF.b		; A4 FF
	brk $39.b		; 00 39
	and $FAFA.w,Y		; 39 FA FA
	stp		; DB
	stp		; DB
	cpy $CBCC.w		; CC CC CB
	wai		; CB
	rol $26.b		; 26 26
	sed		; F8
	sed		; F8
	cld		; D8
	cld		; D8
	and $FAC6.w,Y		; 39 C6 FA
	tsb $DB.b		; 04 DB
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $26.b		; 00 26
	cpy #$00F8.w		; C0 F8 00
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$80E0.w		; E0 E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	asl $C60E.w		; 0E 0E C6
	dec $C0.b		; C6 C0
	cpy #$0201.w		; C0 01 02
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	brk $01.b		; 00 01
	ora $CF00.w,Y		; 19 00 CF
	bmi -25.b		; 30 E7
	clc		; 18
	cmp $C0C000.l		; CF 00 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$4040.w		; C0 40 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	ror $C06E.w		; 6E 6E C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -17.b		; 80 EF
	brk $FE.b		; 00 FE
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F5.b		; 00 F5
	ora #$03E4.w		; 09 E4 03
	sbc $FF.b,X		; F5 FF
	cpx $FF.b		; E4 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	cpx $FF.b		; E4 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	pea $04FF.w		; F4 FF 04
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	pea $06FF.w		; F4 FF 06
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	tsb $0C0C.w		; 0C 0C 0C
	tsb CGADD.w		; 0C 21 21
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $0E02.w		; 0D 02 0E
	ora ($0D.b,X)		; 01 0D
	brk $21.b		; 00 21
	.db $42, $30		; 42 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi   0.b		; 30 00
	brk $C0.b		; 00 C0
	cpy #$D8D8.w		; C0 D8 D8
	tas		; 1B
	tas		; 1B
	bit $303C.w,X		; 3C 3C 30
	rti		; 40

	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	brk $20.b		; 00 20
	cpy #$FB20.w		; C0 20 FB
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsl $080822.l		; 22 22 08 08
	ora ($13.b,S),Y		; 13 13
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	rol $0841.w,X		; 3E 41 08
	ora [$13.b],Y		; 17 13
	tsb $F00C.w		; 0C 0C F0
	adc ($9E.b,X)		; 61 9E
	ora $708C00.l		; 0F 00 8C 70
	eor $3C.b,S		; 43 3C
	ora $BF0D.w		; 0D 0D BF
	lda $C09F9F.l,X		; BF 9F 9F C0
	cpy #$0000.w		; C0 00 00
	cmp $1C1CCF.l		; CF CF 1C 1C
	cpy #$3FC0.w		; C0 C0 3F
	cpy #$00FF.w		; C0 FF 00
	sbc $00E100.l,X		; FF 00 E1 00
	sbc $30CF00.l,X		; FF 00 CF 30
	and $00EF00.l,X		; 3F 00 EF 00
	rts		; 60

	rts		; 60

	sec		; 38
	sec		; 38
	jsr $0020.w		; 20 20 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $20.b		; 00 20
	jsr $C8C8.w		; 20 C8 C8
	cpx #$3800.w		; E0 00 38
	brk $38.b		; 00 38
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $C8.b		; 00 C8
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $4119.w,Y		; 19 19 41
	eor ($1A.b,X)		; 41 1A
	inc A		; 1A
	asl $220E.w		; 0E 0E 22
	jsl $183131.l		; 22 31 31 18
	clc		; 18
	ora $20D91F.l,X		; 1F 1F D9 20
	adc $1B10.w		; 6D 10 1B
	tsb $0E.b		; 04 0E
	rts		; 60

	rol $37D0.w		; 2E D0 37
	php		; 08
	sei		; 78
	brk $3F.b		; 00 3F
	brk $FC.b		; 00 FC
	jsr ($8080.w,X)		; FC 80 80
	ora [$07.b]		; 07 07
	bit $34.b,X		; 34 34
	cpy #$C3C0.w		; C0 C0 C3
	cmp $BF.b,S		; C3 BF
	lda $FCEDED.l,X		; BF ED ED FC
	brk $A0.b		; 00 A0
	ora $0F.b,S		; 03 0F
	beq  53.b		; F0 35
	rti		; 40

	sbc [$00.b]		; E7 00
	sbc ($0C.b,S),Y		; F3 0C
	lda $00EF40.l,X		; BF 40 EF 00
	bra -128.b		; 80 80
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bcc -112.b		; 90 90
	cld		; D8
	jsr $00D8.w		; 20 D8 00
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
	brk $40.b		; 00 40
	bra 120.b		; 80 78
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
	brk $0F.b		; 00 0F
	ora $000101.l		; 0F 01 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $52.b		; 00 52
	brk $1D.b		; 00 1D
	brk $35.b		; 00 35
	cop $0F.b		; 02 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BA.b		; 00 BA
	tsx		; BA
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	sta [$00.b]		; 87 00
	sed		; F8
	brk $BA.b		; 00 BA
	ora ($BB.b,X)		; 01 BB
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	ora [$EB.b]		; 07 EB
	cop $F8.b		; 02 F8
	sbc $00FFEB.l,X		; FF EB FF 00
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $02FFFB.l,X		; FF FB FF 02
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	asl $06.b		; 06 06
	bpl  16.b		; 10 10
	mvp $36,$44		; 44 44 36
	rol $00.b,X		; 36 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($05.b,X)		; 01 05
	brk $17.b		; 00 17
	php		; 08
	ora [$00.b],Y		; 17 00
	mvp $B7,$0B		; 44 0B B7
	rti		; 40

	ora [$78.b]		; 07 78
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	dec $C6.b		; C6 C6
	iny		; C8
	iny		; C8
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	dec $00.b		; C6 00
	cmp $C03800.l		; CF 00 38 C0
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	ora $00011F.l,X		; 1F 1F 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	rol $00.b,X		; 36 00
	adc [$08.b]		; 67 08
	sta ($60.b),Y		; 91 60
	ora $001F70.l		; 0F 70 1F 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	cpy #$0DC0.w		; C0 C0 0D
	ora $E0E0.w		; 0D E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $E8.b		; 00 E8
	brk $DF.b		; 00 DF
	brk $7D.b		; 00 7D
	brk $E0.b		; 00 E0
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $18.b		; 00 18
	clc		; 18
	ror $66.b		; 66 66
	bpl  16.b		; 10 10
	and $00003F.l,X		; 3F 3F 00 00
	ora ($12.b)		; 12 12
	cop $02.b		; 02 02
	nop		; EA
	nop		; EA
	clc		; 18
	eor ($6F.b,X)		; 41 6F
	bpl  16.b		; 10 10
	ora $007F.w		; 0D 7F 00
	asl $41.b		; 06 41
	ora ($2D.b)		; 12 2D
	ora ($E0.b,S),Y		; 13 E0
	xba		; EB
	trb $A0.b		; 14 A0
	ldy #$3434.w		; A0 34 34
	beq -16.b		; F0 F0
	phy		; 5A
	phy		; 5A
	plp		; 28
	plp		; 28
	sbc ($F3.b,S),Y		; F3 F3
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	ldy $B400.w,X		; BC 00 B4
	pha		; 48
	beq   8.b		; F0 08
	lsr $2800.w,X		; 5E 00 28
	cpy #$00F3.w		; C0 F3 00
	asl $3800.w,X		; 1E 00 38
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	xce		; FB
	tsb $F2.b		; 04 F2
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc ($FF.b)		; F2 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFA.l,X		; FF FA FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000E03.l,X		; FF 03 0E 00
	brk $04.b		; 00 04
	tsb $10.b		; 04 10
	bpl  36.b		; 10 24
	bit $14.b		; 24 14
	trb $90.b		; 14 90
	bcc  38.b		; 90 26
	rol $52.b		; 26 52
	eor ($79.b)		; 52 79
	adc $0804.w,Y		; 79 04 08
	clc		; 18
	brk $2F.b		; 00 2F
	bpl  20.b		; 10 14
	dey		; 88
	lda $2740.w,Y		; B9 40 27
	dey		; 88
	ror $7901.w,X		; 7E 01 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $32.b		; 00 32
	and ($01.b)		; 32 01
	ora ($1E.b,X)		; 01 1E
	asl $0008.w,X		; 1E 08 00
	wai		; CB
	brk $7F.b		; 00 7F
	brk $06.b		; 00 06
	sei		; 78
	and #$32C0.w		; 29 C0 32
	tsb $609B.w		; 0C 9B 60
	asl $0800.w,X		; 1E 00 08
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $F9.b		; 02 F9
	brk $FE.b		; 00 FE
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	rti		; 40

	rts		; 60

	rts		; 60

	jsr $D020.w		; 20 20 D0
	bne   0.b		; D0 00
	brk $18.b		; 00 18
	clc		; 18
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	rti		; 40

	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $D0.b		; 00 D0
	brk $10.b		; 00 10
	bra  88.b		; 80 58
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	bra  60.b		; 80 3C
	brk $E9.b		; 00 E9
	clc		; 18
	ldx $FD05.w		; AE 05 FD
	sbc $00FFAE.l,X		; FF AE FF 00
	asl $0000.w		; 0E 00 00
	sbc $FF.b,X		; F5 FF
	ldx $02FF.w,Y		; BE FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	ldx $04FF.w,Y		; BE FF 04
	asl $0000.w		; 0E 00 00
	sbc #$CEFF.w		; E9 FF CE
	sbc $000E06.l,X		; FF 06 0E 00
	brk $F9.b		; 00 F9
	sbc $08FFCE.l,X		; FF CE FF 08
	asl $0000.w		; 0E 00 00
	ora #$CE00.w		; 09 00 CE
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $E9.b		; 00 E9
	sbc $0CFFDE.l,X		; FF DE FF 0C
	asl $0000.w		; 0E 00 00
	sbc $DEFF.w,Y		; F9 FF DE
	sbc $000E0E.l,X		; FF 0E 0E 00
	brk $09.b		; 00 09
	brk $DE.b		; 00 DE
	sbc $000E20.l,X		; FF 20 0E 00
	brk $ED.b		; 00 ED
	sbc $22FFEE.l,X		; FF EE FF 22
	asl $0000.w		; 0E 00 00
	sbc $EEFF.w,X		; FD FF EE
	sbc $000E24.l,X		; FF 24 0E 00
	brk $0D.b		; 00 0D
	brk $EE.b		; 00 EE
	sbc $000E26.l,X		; FF 26 0E 00
	brk $EF.b		; 00 EF
	sbc $28FFFE.l,X		; FF FE FF 28
	asl $0000.w		; 0E 00 00
	sbc $FFFEFF.l,X		; FF FF FE FF
	rol A		; 2A
	asl $0000.w		; 0E 00 00
	ora $FFFE00.l		; 0F 00 FE FF
	bit $000E.w		; 2C 0E 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	bpl  12.b		; 10 0C
	bpl  12.b		; 10 0C
	trb $0C.b		; 14 0C
	trb $0C.b		; 14 0C
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora $070F00.l		; 0F 00 0F 07
	tsb $0F.b		; 04 0F
	tsb $0F.b		; 04 0F
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4F.b		; 00 4F
	lda ($3F.b,S),Y		; B3 3F
	tsb $C8F4.w		; 0C F4 C8
	stz $FB.b,X		; 74 FB
	stz $FB.b,X		; 74 FB
	sta [$7B.b]		; 87 7B
	cmp [$7C.b]		; C7 7C
	lda $0000C8.l,X		; BF C8 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -64.b		; 30 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0080.w		; C0 80 00
	dey		; 88
	brk $30.b		; 00 30
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $08.b,S		; 03 08
	ora $08.b,S		; 03 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	ora $073B34.l		; 0F 34 3B 07
	phd		; 0B
	ora [$0B.b]		; 07 0B
	bit $4F03.w,X		; 3C 03 4F
	eor $3F883F.l		; 4F 3F 88 3F
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $3F.b,S		; C3 3F
	phd		; 0B
	sbc [$80.b],Y		; F7 80
	sbc $3BFF80.l,X		; FF 80 FF 3B
	cpy $C7.b		; C4 C7
	sec		; 38
	ora $FB0FFB.l		; 0F FB 0F FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	wai		; CB
	brk $F7.b		; 00 F7
	cmp $CF.b,S		; C3 CF
	bit $3CCF.w,X		; 3C CF 3C
	and $738FF8.l,X		; 3F F8 8F 73
	lda $CCBFCC.l,X		; BF CC BF CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	clv		; B8
	beq -16.b		; F0 F0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cmp $80.b,S		; C3 80
	pea $FFF0.w		; F4 F0 FF
	bra  -1.b		; 80 FF
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
	brk $61.b		; 00 61
	rol $3F40.w,X		; 3E 40 3F
	jmp ($0703.w,X)		; 7C 03 07
	phd		; 0B
	phd		; 0B
	brk $80.b		; 00 80
	tda		; 7B
	bra 123.b		; 80 7B
	sec		; 38
	sta [$00.b]		; 87 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	tsb $47.b		; 04 47
	sty $7C.b		; 84 7C
	sbc $FFCFF0.l,X		; FF F0 CF FF
	sed		; F8
	iny		; C8
	and [$08.b],Y		; 37 08
	sbc [$3F.b],Y		; F7 3F
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda [$CF.b],Y		; B7 CF
	lda [$CF.b],Y		; B7 CF
	tsb $7BFF.w		; 0C FF 7B
	sta [$FC.b]		; 87 FC
	ora $20.b,S		; 03 20
	cmp $3F07F8.l,X		; DF F8 07 3F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc [$F8.b],Y		; F7 F8
	sta [$0C.b]		; 87 0C
	sbc $F83CC3.l,X		; FF C3 3C F8
	sta $3FFF02.l		; 8F 02 FF 3F
	sbc ($FF.b,S),Y		; F3 FF
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	trb $0C.b		; 14 0C
	trb $0C.b		; 14 0C
	bit $0C.b,X		; 34 0C
	bit $0C.b,X		; 34 0C
	bit $4C.b,X		; 34 4C
	ldy $0F.b,X		; B4 0F
	xce		; FB
	eor $0000B3.l		; 4F B3 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	bit $3B.b,X		; 34 3B
	bit $3B.b,X		; 34 3B
	brk $FF.b		; 00 FF
	cpy $0833.w		; CC 33 08
	bmi  60.b		; 30 3C
	sec		; 38
	bit $3F38.w,X		; 3C 38 3F
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $88.b		; 00 88
	stz $88.b,X		; 74 88
	stz $00.b,X		; 74 00
	sbc $4CFB07.l,X		; FF 07 FB 4C
	lda [$C0.b],Y		; B7 C0
	and $BC3FC0.l,X		; 3F C0 3F BC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	clv		; B8
	rti		; 40

	clv		; B8
	cpy #$FC00.w		; C0 00 FC
	pea $C038.w		; F4 38 C0
	sed		; F8
	brk $F8.b		; 00 F8
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000807.l		; 0F 07 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora [$07.b]		; 07 07
	brk $83.b		; 00 83
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	sbc ($C4.b,S),Y		; F3 C4
	tsa		; 3B
	sei		; 78
	ora [$F3.b]		; 07 F3
	tsb $0CF3.w		; 0C F3 0C
	cpy #$077F.w		; C0 7F 07
	sed		; F8
	cmp $3C.b,S		; C3 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$7F.b]		; C7 7F
	beq  15.b		; F0 0F
	ora [$F8.b]		; 07 F8
	php		; 08
	sbc $40FF08.l,X		; FF 08 FF 40
	sbc $B0837C.l,X		; FF 7C 83 B0
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jmp ($48FF.w,X)		; 7C FF 48
	lda $F887F0.l,X		; BF F0 87 F8
	sta [$F8.b]		; 87 F8
	tsa		; 3B
	cmp [$00.b]		; C7 00
	sbc $000FFB.l,X		; FF FB 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	pha		; 48
	sed		; F8
	brk $F8.b		; 00 F8
	brk $CF.b		; 00 CF
	sbc $C7FF48.l,X		; FF 48 FF C7
	cpy #$0000.w		; C0 00 00
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
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor [$00.b]		; 47 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sei		; 78
	ora [$33.b]		; 07 33
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	ora [$08.b]		; 07 08
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	ora $BF7F83.l		; 0F 83 7F BF
	ror $C17E.w,X		; 7E 7E C1
	jsr ($0783.w,X)		; FC 83 07
	sta [$07.b]		; 87 07
	jsr ($FC07.w,X)		; FC 07 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	sbc $F4EBF4.l,X		; FF F4 EB F4
	phd		; 0B
	tsb $F1FF.w		; 0C FF F1
	ora $07FF19.l		; 0F 19 FF 07
	sbc $00FF7C.l,X		; FF 7C FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sty $03.b		; 84 03
	sbc $37FF03.l,X		; FF 03 FF 37
	wai		; CB
	tsa		; 3B
	cpy #$78F8.w		; C0 F8 78
	and $FC3FFC.l,X		; 3F FC 3F FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $3CFC.w,X		; 3C FC 3C
	jsr ($807F.w,X)		; FC 7F 80
	jmp ($BF00.w,X)		; 7C 00 BF
	sta $FFFC3F.l		; 8F 3F FC FF
	jsr ($7FC0.w,X)		; FC C0 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $7804.w,X		; BC 04 78
	php		; 08
	adc [$F0.b],Y		; 77 F0
	bit $3CC0.w,X		; 3C C0 3C
	cpy #$F078.w		; C0 78 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $3C.b,S		; C3 3C
	clv		; B8
	ora [$00.b]		; 07 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ldy $0E32.w,X		; BC 32 0E
	adc $0FFD.w,X		; 7D FD 0F
	sta $F09F03.l,X		; 9F 03 9F F0
	sbc $007F7E.l,X		; FF 7E 7F 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $83.b		; 00 83
	sbc $F3FE1F.l,X		; FF 1F FE F3
	inc $3E71.w,X		; FE 71 3E
	adc ($0F.b,S),Y		; 73 0F
	sbc $FF.b,S		; E3 FF
	eor $601FFC.l,X		; 5F FC 1F 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	sbc $FC7F00.l,X		; FF 00 7F FC
	jmp ($70F0.w,X)		; 7C F0 70
	beq -96.b		; F0 A0
	beq   0.b		; F0 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $3F.b		; 00 3F
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	sta $7C.b,S		; 83 7C
	jsr ($0404.w,X)		; FC 04 04
	brk $00.b		; 00 00
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
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $2F.b		; 00 2F
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
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$80.b]		; 07 80
	asl $0000.w,X		; 1E 00 00
	jmp ($0E00.w,X)		; 7C 00 0E
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	sta $10.b,S		; 83 10
	cmp [$10.b]		; C7 10
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7C.b		; 00 7C
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $99.b		; 00 99
	brk $40.b		; 00 40
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
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
	bra  -1.b		; 80 FF
	cpy #$00F8.w		; C0 F8 00
	and ($4C.b,S),Y		; 33 4C
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	tda		; 7B
	brk $7B.b		; 00 7B
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $40.b		; 00 40
	rti		; 40

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000300.l,X		; 1F 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $EE.b		; 00 EE
	ora ($C1.b)		; 12 C1
	tsb $FA.b		; 04 FA
	sbc $00FFC1.l,X		; FF C1 FF 00
	asl $0000.w		; 0E 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp ($FF.b),Y		; D1 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp ($FF.b),Y		; D1 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	inc $E1FF.w		; EE FF E1
	sbc $000E06.l,X		; FF 06 0E 00
	brk $FE.b		; 00 FE
	sbc $08FFE1.l,X		; FF E1 FF 08
	asl $0000.w		; 0E 00 00
	asl $E100.w		; 0E 00 E1
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $F1.b		; 00 F1
	sbc $0CFFF1.l,X		; FF F1 FF 0C
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sbc ($FF.b),Y		; F1 FF
	asl $000E.w		; 0E 0E 00
	brk $11.b		; 00 11
	brk $F1.b		; 00 F1
	sbc $000E20.l,X		; FF 20 0E 00
	brk $F2.b		; 00 F2
	sbc $220001.l,X		; FF 01 00 22
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	bit $0E.b		; 24 0E
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($07.b,X)		; 01 07
	ora ($07.b,X)		; 01 07
	ora ($07.b,X)		; 01 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	trb $D7A8.w		; 1C A8 D7
	brk $FF.b		; 00 FF
	rts		; 60

	sta $EC8B44.l,X		; 9F 44 8B EC
	cmp $FB.b,S		; C3 FB
	bvs  99.b		; 70 63
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	cop $10.b		; 02 10
	stx $E010.w		; 8E 10 E0
	inc $8E7C.w,X		; FE 7C 8E
	beq  30.b		; F0 1E
	cpx #$6091.w		; E0 91 60
	sta $000003.l		; 8F 03 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $12.b		; 00 12
	ora $031C.w,X		; 1D 1C 03
	asl $80E1.w		; 0E E1 80
	ror $0FF1.w,X		; 7E F1 0F
	ora $030F0E.l,X		; 1F 0E 0F 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($6F.b),Y		; 91 6F
	tsb $FF.b		; 04 FF
	and [$C8.b],Y		; 37 C8
	inc A		; 1A
	sbc [$3A.b]		; E7 3A
	and $FFE1.w		; 2D E1 FF
	sta [$78.b]		; 87 78
	sbc $0000C0.l,X		; FF C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FC.b,S		; 03 FC
	ora $80F3.w		; 0D F3 80
	adc $FCE31D.l,X		; 7F 1D E3 FC
	sbc $82.b,S		; E3 82
	sbc $9CEE71.l,X		; FF 71 EE 9C
	adc $00.b,S		; 63 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $CE.b		; 00 CE
	inc $FF09.w,X		; FE 09 FF
	cmp [$C0.b]		; C7 C0
	bit $3FFC.w,X		; 3C FC 3F
	cpy #$00BC.w		; C0 BC 00
	ror $00CF.w,X		; 7E CF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bpl -32.b		; 10 E0
	jsr $C0D8.w		; 20 D8 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $7072.w		; 8C 72 70
	tsb $0301.w		; 0C 01 03
	brk $02.b		; 00 02
	ora $01010F.l		; 0F 0F 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	sbc $EF7F91.l		; EF 91 7F EF
	sbc $8EF377.l		; EF 77 F3 8E
	sbc $01FFF5.l,X		; FF F5 FF 01
	stx $00.b		; 86 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	sbc $7EDFE0.l,X		; FF E0 DF 7E
	dec $DC3C.w,X		; DE 3C DC
	jmp ($F0E0.w,X)		; 7C E0 F0
	bra -32.b		; 80 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $1C.b		; 00 1C
	brk $E0.b		; 00 E0
	brk $7F.b		; 00 7F
	cmp $3C.b,S		; C3 3C
	jsr ($0404.w,X)		; FC 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	ora [$09.b],Y		; 17 09
	asl $09.b,X		; 16 09
	asl $07.b,X		; 16 07
	and ($1F.b,X)		; 21 1F
	sec		; 38
	ora $4E71FE.l		; 0F FE 71 4E
	sbc $004F.w,Y		; F9 4F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$1800.w		; C0 00 18
	jsr $E020.w		; 20 20 E0
	cpy #$C4C0.w		; C0 C0 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	asl $0201.w		; 0E 01 02
	ora $030300.l		; 0F 00 03 03
	adc $FC0312.l		; 6F 12 03 FC
	sbc ($0E.b),Y		; F1 0E
	asl $0001.w		; 0E 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	sbc [$C0.b],Y		; F7 C0
	sbc $E7E41B.l,X		; FF 1B E4 E7
	tya		; 98
	sta $BF677B.l		; 8F 7B 67 BF
	bvs -113.b		; 70 8F
	ora [$F8.b]		; 07 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $709E8F.l,X		; FF 8F 9E 70
	ror $1FE2.w,X		; 7E E2 1F
	sbc $F1927F.l		; EF 7F 92 F1
	beq  -2.b		; F0 FE
	bra 127.b		; 80 7F
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ldy #$F080.w		; A0 80 F0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	adc ($1E.b,X)		; 61 1E
	sta $010E00.l,X		; 9F 00 0E 01
	sbc ($1E.b,X)		; E1 1E
	adc $020002.l		; 6F 02 00 02
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $4FF3B0.l		; 4F B0 F3 4F
	sta ($7F.b,X)		; 81 7F
	asl $E1FF.w,X		; 1E FF E1
	ora $3111EE.l,X		; 1F EE 11 31
	and $00EF30.l,X		; 3F 30 EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc $F3FF.w,X		; FD FF F3
	ora $7F81E2.l,X		; 1F E2 81 7F
	sta $F02DF1.l		; 8F F1 2D F0
	bit $EFFC.w,X		; 3C FC EF
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $C0FD.w,X		; FE FD C0
	lda $FC01FE.l,X		; BF FE 01 FC
	cpy #$C0FF.w		; C0 FF C0
	sbc $3200.w,Y		; F9 00 32
	tsb $7F83.w		; 0C 83 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs -128.b		; 70 80
	cpx #$00C0.w		; E0 C0 00
	brk $E8.b		; 00 E8
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $BE.b		; 00 BE
	brk $3F.b		; 00 3F
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($E4.b,X)		; 01 E4
	ora ($36.b,X)		; 01 36
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $3F.b		; 00 3F
	brk $72.b		; 00 72
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $D8.b		; 00 D8
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	ora $02D0.w		; 0D D0 02
	sbc $FF.b,X		; F5 FF
	sbc ($FF.b,S),Y		; F3 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc ($FF.b,S),Y		; F3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FF.b,S		; E3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,S		; E3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFD3.l,X		; FF D3 FF 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	asl $FD.b		; 06 FD
	sta $6263.w,Y		; 99 63 62
	ora $0301.w,Y		; 19 01 03
	asl $001F.w,X		; 1E 1F 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	inc $7FC4.w,X		; FE C4 7F
	stz $B7FB.w		; 9C FB B7
	tyx		; BB
	adc [$FC.b]		; 67 FC
	trb $0020.w		; 1C 20 00
	beq   0.b		; F0 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	brk $FC.b		; 00 FC
	brk $3C.b		; 00 3C
	brk $0E.b		; 00 0E
	inc $E31F.w,X		; FE 1F E3
	trb $00FC.w		; 1C FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($17.b,X)		; 01 17
	php		; 08
	ora ($3E.b,X)		; 01 3E
	asl $01.b		; 06 01
	asl $2801.w		; 0E 01 28
	and [$18.b],Y		; 37 18
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	sbc $B3CC.w,X		; FD CC B3
	sta $4F7E.w,X		; 9D 7E 4F
	sbc $90F30D.l,X		; FF 0D F3 90
	adc $A3FE41.l,X		; 7F 41 FE A3
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$FC80.w		; E0 80 FC
	sei		; 78
	inc $9CA0.w,X		; FE A0 9C
	bra  -2.b		; 80 FE
	brk $F8.b		; 00 F8
	brk $67.b		; 00 67
	inc $E066.w,X		; FE 66 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora $06.b,S		; 03 06
	ora ($0F.b,X)		; 01 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	rts		; 60

	ldy #$A060.w		; A0 60 A0
	iny		; C8
	bpl -48.b		; 10 D0
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
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
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	rts		; 60

	brk $08.b		; 00 08
	sbc [$08.b],Y		; F7 08
	brk $00.b		; 00 00
	bit $3C00.w,X		; 3C 00 3C
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $50.b		; 00 50
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	adc $1FE7.w,Y		; 79 E7 1F
	ora $DF000E.l,X		; 1F 0E 00 DF
	eor [$38.b]		; 47 38
	clc		; 18
	ora [$C7.b]		; 07 C7
	sec		; 38
	eor $000008.l,X		; 5F 08 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $FF105C.l		; AF 5C 10 FF
	sbc ($0C.b,S),Y		; F3 0C
	adc ($8F.b),Y		; 71 8F
	lda $FFE07E.l,X		; BF 7E E0 FF
	ora ($FE.b),Y		; 11 FE
	adc $9E.b		; 65 9E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $9EFC.w		; 1C FC 9E
	cpx #$E73F.w		; E0 3F E7
	inc $E17D.w,X		; FE 7D E1
	cmp $FFE07D.l,X		; DF 7D E0 FF
	rts		; 60

	adc $0000.w,Y		; 79 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	ora #$060F.w		; 09 0F 06
	inc A		; 1A
	ora $28.b,X		; 15 28
	ora [$00.b],Y		; 17 00
	ora ($1A.b,S),Y		; 13 1A
	ora ($09.b),Y		; 11 09
	and [$E3.b],Y		; 37 E3
	cmp $0000.w,X		; DD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	ldy #$04E8.w		; A0 E8 04
	bpl -52.b		; 10 CC
	jmp ($4CB8.w,X)		; 7C B8 4C
	beq  28.b		; F0 1C
	cpx #$87CF.w		; E0 CF 87
	sbc $0000CF.l,X		; FF CF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra  64.b		; 80 40
	cpy #$C040.w		; C0 40 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	sbc [$08.b],Y		; F7 08
	sbc ($02.b,X)		; E1 02
	sed		; F8
	sbc $00FFE1.l,X		; FF E1 FF 00
	asl $0000.w		; 0E 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b),Y		; F1 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b),Y		; F1 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $060001.l,X		; FF 01 00 06
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	ora ($00.b,X)		; 01 00
	ora ($07.b,X)		; 01 07
	asl $05.b		; 06 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C040.w		; C0 40 C0
	bra -128.b		; 80 80
	rti		; 40

	bne -128.b		; D0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $42, $7F		; 42 7F
	bit $9B.b		; 24 9B
	cmp $3F3F.w,Y		; D9 3F 3F
	clc		; 18
	sta $266B.w,X		; 9D 6B 26
	ora $0405BA.l,X		; 1F BA 05 04
	tda		; 7B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec A		; 3A
	dec $987B.w,X		; DE 7B 98
	ora [$F8.b]		; 07 F8
	ror $F89B.w		; 6E 9B F8
	cmp [$1E.b],Y		; D7 1E
	sed		; F8
	and $B1C0.w,X		; 3D C0 B1
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
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
	brk $F4.b		; 00 F4
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0E.b		; 00 0E
	ora #$0B14.w		; 09 14 0B
	asl $1509.w		; 0E 09 15
	tas		; 1B
	php		; 08
	ora $151A1D.l,X		; 1F 1D 1A 15
	sbc $000E31.l		; EF 31 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcs -16.b		; B0 F0
	rts		; 60

	bmi -64.b		; 30 C0
	clv		; B8
	clc		; 18
	bcs  64.b		; B0 40
	bit $CCF8.w,X		; 3C F8 CC
	cpy #$C07E.w		; C0 7E C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $13.b		; 24 13
	cop $0E.b		; 02 0E
	asl $07.b		; 06 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	adc $DF.b,S		; 63 DF
	bcs -48.b		; B0 D0
	rts		; 60

	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $E000.w,X		; 1E 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	ora $F2.b,S		; 03 F2
	brk $FC.b		; 00 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $18.b		; 00 18
	php		; 08
	bpl  24.b		; 10 18
	jsr $2034.w		; 20 34 20
	php		; 08
	jmp $8C38.w		; 4C 38 8C
	bvs -79.b		; 70 B1
	lsr $38C7.w		; 4E C7 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $3D30.w		; CE 30 3D
	stp		; DB
	trb $2C.b		; 14 2C
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $EA.b		; 00 EA
	ora $B7.b,X		; 15 B7
	ora $F0.b		; 05 F0
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	inc $FF.b,X		; F6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	xba		; EB
	sbc $06FFE6.l,X		; FF E6 FF 06
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $08FFE6.l,X		; FF E6 FF 08
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $E6.b		; 00 E6
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $EA.b		; 00 EA
	sbc $0CFFD6.l,X		; FF D6 FF 0C
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $0EFFD6.l,X		; FF D6 FF 0E
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $D6.b		; 00 D6
	sbc $000C20.l,X		; FF 20 0C 00
	brk $F1.b		; 00 F1
	sbc $22FFC6.l,X		; FF C6 FF 22
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	dec $FF.b		; C6 FF
	bit $0C.b		; 24 0C
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	ldx $FF.b,Y		; B6 FF
	rol $0C.b		; 26 0C
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ldx $FF.b,Y		; B6 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	sec		; 38
	cmp $38.b,S		; C3 38
	cpy #$C038.w		; C0 38 C0
	sec		; 38
	cpy #$C038.w		; C0 38 C0
	sec		; 38
	cpy #$C038.w		; C0 38 C0
	sec		; 38
	cpy #$03F8.w		; C0 F8 03
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	asl $0400.w		; 0E 00 04
	brk $04.b		; 00 04
	rol $7B3F.w,X		; 3E 3F 7B
	tda		; 7B
	sbc $E3.b,S		; E3 E3
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $070300.l		; 0F 00 03 07
	adc $67.b,S		; 63 67
	sta [$78.b]		; 87 78
	brk $FF.b		; 00 FF
	brk $34.b		; 00 34
	brk $7F.b		; 00 7F
	.db $42, $BD		; 42 BD
	bra  28.b		; 80 1C
	ora ($C0.b,X)		; 01 C0
	ora ($01.b)		; 12 01
	adc [$88.b],Y		; 77 88
	brk $FF.b		; 00 FF
	wai		; CB
	sbc $C23D42.l,X		; FF 42 3D C2
	and $1F83.w,X		; 3D 83 1F
	rol $EDFF.w,X		; 3E FF ED
	inc $6E91.w,X		; FE 91 6E
	ora ($24.b,X)		; 01 24
	ora ($02.b,X)		; 01 02
	eor $3802.w		; 4D 02 38
	cmp ($23.b,X)		; C1 23
	jmp $113CC3.l		; 5C C3 3C 11
	inc $609F.w		; EE 9F 60
	eor $FCFF7A.l,X		; 5F 7A FF FC
	sbc $C63FB0.l,X		; FF B0 3F C6
	sta $C03FE0.l,X		; 9F E0 3F C0
	sbc $00C000.l,X		; FF 00 C0 00
	sta ($78.b,X)		; 81 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$41.b]		; 07 41
	sta ($87.b)		; 92 87
	brk $0F.b		; 00 0F
	brk $EF.b		; 00 EF
	bpl -34.b		; 10 DE
	asl $7881.w,X		; 1E 81 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$CC.b]		; 07 CC
	ora $FB7FF8.l,X		; 1F F8 7F FB
	pea $3FC0.w		; F4 C0 3F
	brk $DF.b		; 00 DF
	brk $1F.b		; 00 1F
	brk $F3.b		; 00 F3
	trb $F060.w		; 1C 60 F0
	php		; 08
	beq   8.b		; F0 08
	cmp ($00.b,X)		; C1 00
	rol $0000.w,X		; 3E 00 00
	cmp $009F80.l,X		; DF 80 9F 00
	sbc ($80.b,S),Y		; F3 80
	jsr ($F800.w,X)		; FC 00 F8
	brk $F8.b		; 00 F8
	cmp ($00.b,X)		; C1 00
	rol $0000.w,X		; 3E 00 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $7E.b		; 00 7E
	ora $00.b,S		; 03 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ror $017F.w,X		; 7E 7F 01
	adc $000003.l,X		; 7F 03 00 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and ($00.b,S),Y		; 33 00
	sbc $40030C.l,X		; FF 0C 03 40
	ora $0C3601.l,X		; 1F 01 36 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and ($0F.b,S),Y		; 33 0F
	beq  -4.b		; F0 FC
	sbc ($E0.b,S),Y		; F3 E0
	lda $00FFC8.l,X		; BF C8 FF 00
	sbc $00F708.l,X		; FF 08 F7 00
	sbc $C8E31C.l,X		; FF 1C E3 C8
	and ($78.b,S),Y		; 33 78
	bra  72.b		; 80 48
	bcs -119.b		; B0 89
	ror $00.b,X		; 76 00
	sbc $0CF30C.l,X		; FF 0C F3 0C
	sbc ($FC.b,S),Y		; F3 FC
	ora $CC.b,S		; 03 CC
	and [$0F.b],Y		; 37 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	beq   0.b		; F0 00
	sbc $C75FA0.l,X		; FF A0 5F C7
	php		; 08
	ora [$E0.b]		; 07 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sec		; 38
	ora [$80.b]		; 07 80
	asl $FA.b		; 06 FA
	ora ($80.b,X)		; 01 80
	adc $000FC0.l,X		; 7F C0 0F 00
	sbc [$00.b]		; E7 00
	sbc $F8FF00.l,X		; FF 00 FF F8
	cmp [$F9.b]		; C7 F9
	adc $003FC4.l,X		; 7F C4 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	brk $9F.b		; 00 9F
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $FF1FE0.l,X		; 1F E0 1F FF
	brk $FF.b		; 00 FF
	brk $37.b		; 00 37
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $7C.b		; 00 7C
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $DA.b		; 00 DA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	tsb $0300.w		; 0C 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	sei		; 78
	and $1F133F.l,X		; 3F 3F 13 1F
	tsb $000F.w		; 0C 0F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $0F.b,S		; 03 0F
	beq  48.b		; F0 30
	cmp $01FC03.l		; CF 03 FC 01
	ror $F00A.w,X		; 7E 0A F0
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	sbc $CF3000.l,X		; FF 00 30 CF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	ora $FF.b		; 05 FF
	asl $781F.w,X		; 1E 1F 78
	adc $F1FCE0.l,X		; 7F E0 FC F1
	asl $0FF0.w		; 0E F0 0F
	sbc $1C.b,S		; E3 1C
	ora ($6C.b,S),Y		; 13 6C
	ora ($3E.b,X)		; 01 3E
	ora ($BE.b,X)		; 01 BE
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	sbc $D02F00.l,X		; FF 00 2F D0
	ora $D0AFE0.l,X		; 1F E0 AF D0
	lda $803F80.l,X		; BF 80 3F 80
	and $003F00.l,X		; 3F 00 3F 00
	inc $09.b,X		; F6 09
	sec		; 38
	cmp [$C0.b]		; C7 C0
	and $03FC.w,X		; 3D FC 03
	cmp $26C130.l		; CF 30 C1 26
	cpy #$C031.w		; C0 31 C0
	sec		; 38
	cpy #$C03F.w		; C0 3F C0
	and $FF01FC.l,X		; 3F FC 01 FF
	brk $C0.b		; 00 C0
	and $C027C0.l,X		; 3F C0 27 C0
	and ($C0.b),Y		; 31 C0
	sec		; 38
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	asl $FEF1.w		; 0E F1 FE
	brk $F0.b		; 00 F0
	asl $C038.w		; 0E 38 C0
	jsr $0040.w		; 20 40 00
	bra   0.b		; 80 00
	cpy #$E01C.w		; C0 1C E0
	jsr ($0003.w,X)		; FC 03 00
	inc $FE00.w,X		; FE 00 FE
	brk $F8.b		; 00 F8
	brk $60.b		; 00 60
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	and ($3F.b),Y		; 31 3F
	sbc $B30CFF.l,X		; FF FF 0C B3
	brk $1B.b		; 00 1B
	brk $7E.b		; 00 7E
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	adc $007EC0.l,X		; 7F C0 7E 00
	rts		; 60

	ora [$00.b]		; 07 00
	lda $011B00.l,X		; BF 00 1B 01
	adc $0CFF06.l,X		; 7F 06 FF 0C
	sbc $80FF00.l,X		; FF 00 FF 80
	inc $E087.w,X		; FE 87 E0
	brk $FF.b		; 00 FF
	asl $88F0.w		; 0E F0 88
	bpl -64.b		; 10 C0
	brk $84.b		; 00 84
	rtl		; 6B

	brk $43.b		; 00 43
	bra  17.b		; 80 11
	inc A		; 1A
	sbc ($20.b,X)		; E1 20
	cmp $67B749.l,X		; DF 49 B7 67
	sbc $12FF3F.l,X		; FF 3F FF 12
	sbc $7C3F.w,X		; FD 3F 7C
	adc $04FFEE.l,X		; 7F EE FF 04
	cmp ($0D.b)		; D2 0D
	pld		; 2B
	trb $6C.b		; 14 6C
	sta ($47.b,S),Y		; 93 47
	sec		; 38
	eor $FC.b,S		; 43 FC
	cpx #$801F.w		; E0 1F 80
	ora $E003E0.l		; 0F E0 03 E0
	and $60DFE0.l,X		; 3F E0 DF 60
	sta $00BFC0.l,X		; 9F C0 BF 00
	sbc $F01FE0.l,X		; FF E0 1F F0
	adc $CC1FFC.l,X		; 7F FC 1F CC
	and ($00.b,S),Y		; 33 00
	sbc $DB23DC.l,X		; FF DC 23 DB
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	cpy #$0C3F.w		; C0 3F 0C
	sbc ($06.b,S),Y		; F3 06
	sbc $F803.w,Y		; F9 03 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$203F.w		; C0 3F 20
	cmp $008000.l,X		; DF 00 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq  96.b		; F0 60
	bcc -32.b		; 90 E0
	bpl   0.b		; 10 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $000601.l,X		; 1F 01 06 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b]		; 07 1F
	ora $001F1C.l,X		; 1F 1C 1F 00
	ora $000601.l,X		; 1F 01 06 00
	asl $01.b		; 06 01
	ora ($1F.b,X)		; 01 1F
	ora $60C33C.l,X		; 1F 3C C3 60
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	jsl $816EC1.l		; 22 C1 6E 81
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $9EFC03.l,X		; FF 03 FC 9E
	sbc $FFFC.w,X		; FD FC FF
	sbc [$0F.b],Y		; F7 0F
	rol $11DD.w,X		; 3E DD 11
	inc $FD02.w,X		; FE 02 FD
	asl $D8F1.w		; 0E F1 D8
	jsr $8100.w		; 20 00 81
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	ora [$F8.b]		; 07 F8
	sec		; 38
	ora [$00.b]		; 07 00
	lda $C0BD02.l,X		; BF 02 BD C0
	sec		; 38
	ror $E0FF.w,X		; 7E FF E0
	sbc $78F08F.l,X		; FF 8F F0 78
	sta [$C0.b]		; 87 C0
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $000000.l,X		; FF 00 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	cpy #$0030.w		; C0 30 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	brk $01.b		; 00 01
	rti		; 40

	adc $717F40.l,X		; 7F 40 7F 71
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $CF.b		; 00 CF
	ora $FC.b,S		; 03 FC
	asl $0CB0.w		; 0E B0 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $38FF00.l		; CF 00 FF 38
	stx $3C.b		; 86 3C
	cmp $03.b,S		; C3 03
	jsr ($0000.w,X)		; FC 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	sei		; 78
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $78.b		; 00 78
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
	ora ($FE.b,X)		; 01 FE
	sbc $807F00.l,X		; FF 00 7F 80
	ror $F000.w,X		; 7E 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	brk $7F.b		; 00 7F
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7E.b		; 00 7E
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	bra  -1.b		; 80 FF
	cpy #$0000.w		; C0 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $07.b		; 00 07
	asl $F9.b		; 06 F9
	sec		; 38
	cmp [$00.b]		; C7 00
	adc $007900.l,X		; 7F 00 79 00
	ora ($00.b,X)		; 01 00
	ora $FE110E.l,X		; 1F 0E 11 FE
	sbc $C13E.w,Y		; F9 3E C1
	sec		; 38
	cmp [$00.b]		; C7 00
	adc $1E7F06.l,X		; 7F 06 7F 1E
	ora $1E001F.l,X		; 1F 1F 00 1E
	ora ($0F.b,X)		; 01 0F
	beq  76.b		; F0 4C
	lda ($18.b,S),Y		; B3 18
	sbc [$28.b]		; E7 28
	cmp ($60.b,S),Y		; D3 60
	sta [$00.b]		; 87 00
	sbc $04817E.l,X		; FF 7E 81 04
	lda ($4F.b,S),Y		; B3 4F
	bcs  67.b		; B0 43
	ldy $FC03.w,X		; BC 03 FC
	ora $F8.b,S		; 03 F8
	ora $E4.b,S		; 03 E4
	ora $00FFE0.l,X		; 1F E0 FF 00
	ora [$B0.b]		; 07 B0
	brk $C1.b		; 00 C1
	brk $FF.b		; 00 FF
	eor ($BE.b,X)		; 41 BE
	cmp $03FC30.l		; CF 30 FC 03
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	cmp $3C.b,S		; C3 3C
	brk $C1.b		; 00 C1
	and ($CE.b),Y		; 31 CE
	cmp ($3E.b,X)		; C1 3E
	cpy #$E03F.w		; C0 3F E0
	ora $FC0FF0.l,X		; 1F F0 0F FC
	ora $C3.b,S		; 03 C3
	bit $EC00.w,X		; 3C 00 EC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	sta [$78.b]		; 87 78
	brk $EC.b		; 00 EC
	bra 124.b		; 80 7C
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	cpx #$001F.w		; E0 1F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $01241B.l,X		; FF 1B 24 01
	ror $3E3F.w,X		; 7E 3F 3E
	ora $03001F.l,X		; 1F 1F 00 03
	bit $0F3C.w,X		; 3C 3C 0F
	sbc $04FF00.l,X		; FF 00 FF 04
	tsa		; 3B
	ora ($7E.b,X)		; 01 7E
	cop $DD.b		; 02 DD
	tsb $0D13.w		; 0C 13 0D
	sta ($00.b)		; 92 00
	adc $407F00.l,X		; 7F 00 7F 40
	lda $6E08F7.l,X		; BF F7 08 6E
	sta ($A2.b),Y		; 91 A2
	adc $E3FC.w,X		; 7D FC E3
	bvs -17.b		; 70 EF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	lda [$58.b]		; A7 58
	ora [$F8.b]		; 07 F8
	clc		; 18
	sbc [$00.b]		; E7 00
	beq -32.b		; F0 E0
	brk $00.b		; 00 00
	clc		; 18
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	rts		; 60

	stz $7E80.w,X		; 9E 80 7E
	jsr $00DC.w		; 20 DC 00
	beq   0.b		; F0 00
	cpx #$1800.w		; E0 00 18
	brk $F8.b		; 00 F8
	clc		; 18
	cpx #$1EE0.w		; E0 E0 1E
	bra 126.b		; 80 7E
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	bra  40.b		; 80 28
	brk $EF.b		; 00 EF
	bpl -58.b		; 10 C6
	tsb $F6.b		; 04 F6
	sbc $00FFC6.l,X		; FF C6 FF 00
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	dec $FF.b		; C6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc $FFD6FF.l		; EF FF D6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	sbc $FFD6FF.l,X		; FF FF D6 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora $FFD600.l		; 0F 00 D6 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	sbc $FFE6FF.l		; EF FF E6 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc $FFE6FF.l,X		; FF FF E6 FF
	tsb $000C.w		; 0C 0C 00
	brk $0F.b		; 00 0F
	brk $E6.b		; 00 E6
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F3.b		; 00 F3
	sbc $20FFF6.l,X		; FF F6 FF 20
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	inc $FF.b,X		; F6 FF
	jsl $00000C.l		; 22 0C 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	brk $01.b		; 00 01
	jsr $313F.w		; 20 3F 31
	rol $1E1F.w,X		; 3E 1F 1E
	ora $1C1C0F.l		; 0F 0F 1C 1C
	brk $0E.b		; 00 0E
	cop $9C.b		; 02 9C
	asl $10F0.w		; 0E F0 10
	sbc $08FF00.l		; EF 00 FF 08
	lda [$13.b],Y		; B7 13
	bit $FF00.w		; 2C 00 FF
	brk $0E.b		; 00 0E
	brk $9E.b		; 00 9E
	brk $FE.b		; 00 FE
	bvs -113.b		; 70 8F
	tsb $48F3.w		; 0C F3 48
	sbc [$F0.b],Y		; F7 F0
	cmp $00FF00.l		; CF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
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
	ora ($06.b,X)		; 01 06
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	ora ($06.b,X)		; 01 06
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	asl $19.b		; 06 19
	brk $1F.b		; 00 1F
	ora ($7E.b,X)		; 01 7E
	.db $82, $7D, $04		; 82 7D 04
	plx		; FA
	tsb $0091.w		; 0C 91 00
	ora $0016E1.l,X		; 1F E1 16 00
	ora $E9FEE1.l,X		; 1F E1 FE E9
	stx $80.b,Y		; 96 80
	adc $60FE00.l,X		; 7F 00 FE 60
	sbc $FCE3.w,X		; FD E3 FC
	sbc ($16.b,X)		; E1 16
	brk $FF.b		; 00 FF
	cop $FD.b		; 02 FD
	cpy #$0121.w		; C0 21 01
	inc $D827.w,X		; FE 27 D8
	bit $00C3.w,X		; 3C C3 00
	sbc $80DC23.l,X		; FF 23 DC 80
	adc $C07F80.l,X		; 7F 80 7F C0
	and ($E1.b,X)		; 21 E1
	asl $1FE0.w,X		; 1E E0 1F
	beq  15.b		; F0 0F
	sed		; F8
	ora [$E3.b]		; 07 E3
	trb $0080.w		; 1C 80 00
	brk $C0.b		; 00 C0
	brk $D8.b		; 00 D8
	brk $F0.b		; 00 F0
	cpx #$6000.w		; E0 00 60
	bra   0.b		; 80 00
	sed		; F8
	sty $0070.w		; 8C 70 00
	bra   0.b		; 80 00
	cpy #$D800.w		; C0 00 D8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	cpy #$003C.w		; C0 3C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	clc		; 18
	ora ($00.b,X)		; 01 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	ror $7F.b		; 66 7F
	inc $3DFF.w,X		; FE FF 3D
	rol $7776.w,X		; 3E 76 77
	ora ($00.b,X)		; 01 00
	ora #$1CE0.w		; 09 E0 1C
	cpy #$8718.w		; C0 18 87
	inx		; E8
	brk $01.b		; 00 01
	rol $E21D.w,X		; 3E 1D E2
	brk $F8.b		; 00 F8
	cop $F8.b		; 02 F8
	asl $FF.b,X		; 16 FF
	and $FF.b,S		; 23 FF
	rts		; 60

	sbc $3FEF07.l,X		; FF 07 EF 3F
	brk $DD.b		; 00 DD
	jsl $17FB03.l		; 22 03 FB 17
	sbc $051A.w		; ED 1A 05
	ora ($0C.b,S),Y		; 13 0C
	sta ($7E.b),Y		; 91 7E
	brk $23.b		; 00 23
	cli		; 58
	and ($18.b,X)		; 21 18
	cpx #$4E10.w		; E0 10 4E
	dec $F821.w,X		; DE 21 F8
	sbc [$F0.b]		; E7 F0
	sbc $FCBF40.l		; EF 40 BF FC
	cmp $FB87FE.l,X		; DF FE 87 FB
	ora $F0.b,S		; 03 F0
	ldx $01FE.w		; AE FE 01
	rol $BCC0.w,X		; 3E C0 BC
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	brk $BF.b		; 00 BF
	brk $2F.b		; 00 2F
	rti		; 40

	ora $00F00C.l		; 0F 0C F0 00
	inc $BC00.w,X		; FE 00 BC
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	rti		; 40

	sbc $40AF80.l,X		; FF 80 AF 40
	ora $00FC00.l		; 0F 00 FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $7F.b		; 00 7F
	phd		; 0B
	trb $03.b		; 14 03
	bit $0006.w,X		; 3C 06 00
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	asl $38.b		; 06 38
	ora $7F007F.l		; 0F 7F 00 7F
	tsb $1B.b		; 04 1B
	brk $3F.b		; 00 3F
	sbc $EFFF.w,Y		; F9 FF EF
	sbc $01F00F.l,X		; FF 0F F0 01
	and $81FF00.l,X		; 3F 00 FF 81
	ror $11EE.w,X		; 7E EE 11
	stx $68.b,Y		; 96 68
	brk $70.b		; 00 70
	brk $67.b		; 00 67
	brk $0F.b		; 00 0F
	dec $0021.w		; CE 21 00
	sbc $0EB04F.l,X		; FF 4F B0 0E
	sbc ($70.b),Y		; F1 70
	stx $BFCF.w		; 8E CF BF
	tya		; 98
	sbc $30FCF3.l,X		; FF F3 FC 30
	cmp $00C000.l,X		; DF 00 C0 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	cpx #$0010.w		; E0 10 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	tsb $0001.w		; 0C 01 00
	ora $000000.l		; 0F 00 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($FB.b,X)		; 01 FB
	sbc $0EFF07.l,X		; FF 07 FF 0E
	ora $00.b,S		; 03 00
	ora $010000.l		; 0F 00 00 01
	inc $FF00.w,X		; FE 00 FF
	ora ($9E.b,X)		; 01 9E
	adc [$18.b]		; 67 18
	ora $FA.b		; 05 FA
	ora $60A6.w,Y		; 19 A6 60
	sta $01DE01.l,X		; 9F 01 DE 01
	inc $FE01.w,X		; FE 01 FE
	ora $9EE190.l		; 0F 90 E1 9E
	ora ($FE.b,X)		; 01 FE
	eor ($FE.b,X)		; 41 FE
	brk $FF.b		; 00 FF
	ora $DA.b		; 05 DA
	php		; 08
	sbc [$13.b],Y		; F7 13
	cpx #$7883.w		; E0 83 78
	brk $1F.b		; 00 1F
	tsb $2003.w		; 0C 03 20
	cmp $1D.b,S		; C3 1D
	cpx #$06C9.w		; E0 C9 06
	bra 127.b		; 80 7F
	bcc  99.b		; 90 63
	bra 123.b		; 80 7B
	cpx #$FCFF.w		; E0 FF FC
	sbc ($FC.b,S),Y		; F3 FC
	ora $38EF12.l,X		; 1F 12 EF 38
	sbc [$4C.b],Y		; F7 4C
	lda ($80.b,S),Y		; B3 80
	adc $0023DC.l,X		; 7F DC 23 00
	sbc $1EFF00.l,X		; FF 00 FF 1E
	adc ($1F.b,X)		; 61 1F
	cpx #$01FE.w		; E0 FE 01
	rti		; 40

	lda $04F30C.l,X		; BF 0C F3 04
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$20BF.w		; C0 BF 20
	cmp $00FF00.l,X		; DF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	cpy #$0000.w		; C0 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	cop $1C.b		; 02 1C
	brk $09.b		; 00 09
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $19.b		; 00 19
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $0600.w,X		; 1E 00 06
	ora $3E7077.l		; 0F 77 70 3E
	and $181F06.l,X		; 3F 06 1F 18
	ora $110000.l,X		; 1F 00 00 11
	inc $6300.w		; EE 00 63
	asl $3F01.w		; 0E 01 3F
	cpy #$38C7.w		; C0 C7 38
	asl $09E1.w,X		; 1E E1 09
	sbc ($00.b)		; F2 00
	ora $EE11.w		; 0D 11 EE
	ora $F17E.w,X		; 1D 7E F1
	inc $00FF.w,X		; FE FF 00
	cpy #$013F.w		; C0 3F 01
	inc $FF04.w,X		; FE 04 FF
	adc ($7C.b),Y		; 71 7C
	dey		; 88
	bpl  49.b		; 10 31
	cpy #$C023.w		; C0 23 C0
	ora $06E2.w,X		; 1D E2 06
	sbc $C738.w,Y		; F9 38 C7
	and $E518C0.l,X		; 3F C0 18 E5
	xce		; FB
	adc $FE.b,S		; 63 FE
	ora $F81DFE.l		; 0F FE 1D F8
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora $78.b		; 05 78
	sty $F8.b		; 84 F8
	tsb $E1.b		; 04 E1
	brk $80.b		; 00 80
	rti		; 40

	brk $E0.b		; 00 E0
	brk $7C.b		; 00 7C
	asl $F9.b		; 06 F9
	sei		; 78
	stx $00.b		; 86 00
	jsr ($FC00.w,X)		; FC 00 FC
	sbc ($00.b,X)		; E1 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	tsb $FC70.w		; 0C 70 FC
	ora $00.b,S		; 03 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $781F.w,X		; 1E 1F 78
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($9E.b,X)		; 01 9E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora $001F80.l,X		; 1F 80 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	sta ($46.b,X)		; 81 46
	sta ($62.b,X)		; 81 62
	bra  32.b		; 80 20
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  71.b		; 80 47
	bra  99.b		; 80 63
	bra  32.b		; 80 20
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $009F00.l		; 2F 00 9F 00
	and $000600.l,X		; 3F 00 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1C.b,S		; 03 1C
	ora $1C.b,S		; 03 1C
	ora $1C.b,S		; 03 1C
	sta $7C.b,S		; 83 7C
	xce		; FB
	tsb $FF.b		; 04 FF
	brk $DB.b		; 00 DB
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $DA.b		; 00 DA
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
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
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	phd		; 0B
	cmp $03.b,X		; D5 03
	sbc [$FF.b],Y		; F7 FF
	cmp $FF.b,X		; D5 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cmp $FF.b,X		; D5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FF.b		; E5 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b		; E5 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	pea $F5FF.w		; F4 FF F5
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $000F00.l,X		; 1F 00 0F 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	and ($0F.b),Y		; 31 0F
	bpl   6.b		; 10 06
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	ora $0F1D12.l,X		; 1F 12 1D 0F
	ora $0E1918.l		; 0F 18 19 0E
	and $001F00.l,X		; 3F 00 1F 00
	bmi  48.b		; 30 30
	cpy #$BC40.w		; C0 40 BC
	brk $FC.b		; 00 FC
	cli		; 58
	ldy #$FC00.w		; A0 00 FC
	brk $FC.b		; 00 FC
	bcs  78.b		; B0 4E
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	cpy #$203C.w		; C0 3C 20
	jmp.w [$38C0]		; DC C0 38
	brk $FC.b		; 00 FC
	tsb $F8.b		; 04 F8
	bmi -50.b		; 30 CE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $04.b,S		; 03 04
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	ora ($00.b,X)		; 01 00
	brk $F3.b		; 00 F3
	ora ($1E.b,X)		; 01 1E
	brk $02.b		; 00 02
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	sbc $FF0CFE.l,X		; FF FE 0C FF
	brk $1F.b		; 00 1F
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	trb $EB.b		; 14 EB
	bpl -17.b		; 10 EF
	bpl -18.b		; 10 EE
	bvs -125.b		; 70 83
	eor ($A0.b),Y		; 51 A0
	ora $FC.b,S		; 03 FC
	clc		; 18
	sbc ($3E.b,X)		; E1 3E
	cmp ($1C.b,X)		; C1 1C
	sbc $10.b,S		; E3 10
	sbc $1C8E70.l		; EF 70 8E 1C
	sbc $02EE1F.l		; EF 1F EE 02
	sbc $AF56.w,X		; FD 56 AF
	brk $F8.b		; 00 F8
	cpy $38.b		; C4 38
	bit $DA.b		; 24 DA
	cpx $0012.w		; EC 12 00
	inc $FF00.w,X		; FE 00 FF
	eor $807E30.l		; 4F 30 7E 80
	brk $F8.b		; 00 F8
	cpx #$201C.w		; E0 1C 20
	dec $FA04.w,X		; DE 04 FA
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	bcc -17.b		; 90 EF
	brk $FE.b		; 00 FE
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora $1C.b,S		; 03 1C
	ora ($6E.b,X)		; 01 6E
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $7F10C0.l,X		; DF C0 10 7F
	rts		; 60

	adc $1C0303.l,X		; 7F 03 03 1C
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $19.b		; E6 19
	cpy $2F33.w		; CC 33 2F
	bvc   4.b		; 50 04
	tsx		; BA
	tsb $3B.b		; 04 3B
	tsb $39.b		; 04 39
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	jsr ($3F03.w,X)		; FC 03 3F
	cpy #$E09F.w		; C0 9F E0
	bit $3C82.w,X		; 3C 82 3C
	ora $3C.b,S		; 03 3C
	ora ($3C.b,X)		; 01 3C
	brk $3C.b		; 00 3C
	brk $80.b		; 00 80
	rti		; 40

	brk $F8.b		; 00 F8
	stx $7070.w		; 8E 70 70
	sty $2010.w		; 8C 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	dey		; 88
	bvs  -8.b		; 70 F8
	asl $00.b		; 06 00
	jsr ($3000.w,X)		; FC 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$18.b]		; 07 18
	tsb $00.b		; 04 00
	brk $7E.b		; 00 7E
	ora $18.b		; 05 18
	asl $09.b		; 06 09
	ora ($1E.b,X)		; 01 1E
	.db $62, $9D, $04		; 62 9D 04
	plx		; FA
	brk $1F.b		; 00 1F
	tda		; 7B
	adc $02710F.l,X		; 7F 0F 71 02
	ora $F10F00.l,X		; 1F 00 0F F1
	inc $9F60.w		; EE 60 9F
	brk $FE.b		; 00 FE
	bvc -96.b		; 50 A0
	brk $C7.b		; 00 C7
	brk $3F.b		; 00 3F
	bmi -116.b		; 30 8C
	brk $FC.b		; 00 FC
	bra  70.b		; 80 46
	tsb $FB.b		; 04 FB
	eor $30C0A0.l,X		; 5F A0 C0 30
	sec		; 38
	sbc $C0E1DE.l,X		; FF DE E1 C0
	jmp ($FC00.w,X)		; 7C 00 FC
	bra  70.b		; 80 46
	cpy $3B.b		; C4 3B
	cpy #$003F.w		; C0 3F 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0E00.w		; 0E 00 0E
	ora [$30.b]		; 07 30
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	php		; 08
	and ($00.b),Y		; 31 00
	trb $01.b		; 14 01
	ora $480F01.l		; 0F 01 0F 48
	adc $687976.l,X		; 7F 76 79 68
	adc $380304.l		; 6F 04 03 38
	ora ($0B.b,X)		; 01 0B
	ora $8201C2.l,X		; 1F C2 01 82
	adc $D20400.l,X		; 7F 00 04 D2
	bit $8902.w		; 2C 02 89
	pld		; 2B
	sty $06.b		; 84 06
	sec		; 38
	stz $18.b		; 64 18
	rol $08FD.w,X		; 3E FD 08
	sbc [$7F.b],Y		; F7 7F
	tda		; 7B
	dec $3E20.w,X		; DE 20 3E
	lda $FF.b,X		; B5 FF
	bvc -33.b		; 50 DF
	sbc ($9F.b,X)		; E1 9F
	sbc $DC.b,S		; E3 DC
	brk $78.b		; 00 78
	bra   0.b		; 80 00
	sed		; F8
	brk $17.b		; 00 17
	jsr $8487.w		; 20 87 84
	sei		; 78
	sei		; 78
	tsb $F1.b		; 04 F1
	brk $00.b		; 00 00
	jmp.w [$F800]		; DC 00 F8
	brk $F8.b		; 00 F8
	cpy #$20D7.w		; C0 D7 20
	sta [$80.b]		; 87 80
	jmp ($FC80.w,X)		; 7C 80 FC
	lda ($40.b),Y		; B1 40
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b],Y		; 17 00
	ora $000200.l,X		; 1F 00 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	tsb $0C30.w		; 0C 30 0C
	bmi  15.b		; 30 0F
	beq  -1.b		; F0 FF
	brk $AE.b		; 00 AE
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $FE.b		; 00 FE
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $DC.b		; 00 DC
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  12.b		; 80 0C
	brk $F8.b		; 00 F8
	php		; 08
	sbc $01.b,S		; E3 01
	sed		; F8
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F1.b		; 00 F1
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	asl $0C03.w		; 0E 03 0C
	brk $00.b		; 00 00
	ora $0C.b,S		; 03 0C
	cop $03.b		; 02 03
	php		; 08
	ora $040706.l		; 0F 06 07 04
	ora $00.b		; 05 00
	ora $1F0F00.l		; 0F 00 0F 1F
	ora $200F00.l,X		; 1F 00 0F 20
	rti		; 40

	brk $F0.b		; 00 F0
	rti		; 40

	bcs   0.b		; B0 00
	beq   0.b		; F0 00
	sed		; F8
	jsr $00C0.w		; 20 C0 00
	clv		; B8
	rts		; 60

	bcc   0.b		; 90 00
	rts		; 60

	bra 112.b		; 80 70
	rti		; 40

	bcs   0.b		; B0 00
	beq  96.b		; F0 60
	tya		; 98
	bra  96.b		; 80 60
	rti		; 40

	sed		; F8
	bra 112.b		; 80 70
	tsb $33.b		; 04 33
	clc		; 18
	rti		; 40

	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	cop $11.b		; 02 11
	phd		; 0B
	trb $01.b		; 14 01
	bit $0500.w,X		; 3C 00 05
	php		; 08
	and $E1FBA3.l,X		; 3F A3 FB E1
	sbc $0B17.w,X		; FD 17 0B
	and $683E.w		; 2D 3E 68
	adc [$42.b],Y		; 77 42
	adc $5C1C19.l,X		; 7F 19 1C 5C
	cpx #$1C00.w		; E0 00 1C
	pha		; 48
	lda $E2.b,S		; A3 E2
	trb $8019.w		; 1C 19 80
	jsr $72D8.w		; 20 D8 72
	sta $A846.w		; 8D 46 A8
	bra 124.b		; 80 7C
	cpx #$C8FC.w		; E0 FC C8
	and $E0.b,S		; 23 E0
	asl $70E9.w,X		; 1E E9 70
	cpy #$FE38.w		; C0 38 FE
	ora ($C0.b,X)		; 01 C0
	rol $0080.w		; 2E 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bpl  47.b		; 10 2F
	brk $07.b		; 00 07
	ora #$0116.w		; 09 16 01
	asl $0B.b,X		; 16 0B
	bit $08.b		; 24 08
	and [$01.b],Y		; 37 01
	asl $1E19.w		; 0E 19 1E
	bpl  47.b		; 10 2F
	ora $191E.w,Y		; 19 1E 19
	asl $03.b		; 06 03
	trb $D9.b		; 14 D9
	inc $00.b,X		; F6 00
	and $000C03.l,X		; 3F 03 0C 00
	sed		; F8
	bpl -20.b		; 10 EC
	brk $FC.b		; 00 FC
	ora ($EC.b)		; 12 EC
	asl $00C1.w,X		; 1E C1 00
	adc $9E8877.l,X		; 7F 77 88 9E
	and ($00.b,X)		; 21 00
	sed		; F8
	bcc 108.b		; 90 6C
	cpy #$983C.w		; C0 3C 98
	ror $02.b		; 66 02
	cmp $FF80.w,X		; DD 80 FF
	rti		; 40

	lda $00FF40.l,X		; BF 40 FF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($1F.b,X)		; 01 1F
	brk $0B.b		; 00 0B
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra 126.b		; 80 7E
	bra 112.b		; 80 70
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	ora $F2.b,S		; 03 F2
	brk $FC.b		; 00 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $00.b		; 00 00
	bit $1C00.w,X		; 3C 00 1C
	php		; 08
	bmi   4.b		; 30 04
	sec		; 38
	tsb $78.b		; 04 78
	asl A		; 0A
	stz $08.b,X		; 74 08
	lda [$26.b]		; A7 26
	pha		; 48
	bpl  44.b		; 10 2C
	jsr $103C.w		; 20 3C 10
	plp		; 28
	bpl  44.b		; 10 2C
	bpl 108.b		; 10 6C
	bpl 110.b		; 10 6E
	cli		; 58
	sbc [$10.b],Y		; F7 10
	ror $5328.w,X		; 7E 28 53
	tsb $92.b		; 04 92
	plp		; 28
	cmp ($08.b)		; D2 08
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl  28.b		; 10 1C
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sta [$B8.b]		; 87 B8
	rol $E01A.w		; 2E 1A E0
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	xce		; FB
	brk $07.b		; 00 07
	asl $9C.b		; 06 9C
	brk $07.b		; 00 07
	asl $72.b		; 06 72
	jsr $0073.w		; 20 73 00
	bit $7374.w,X		; 3C 74 73
	adc ($75.b,S),Y		; 73 75
	stz $74.b,X		; 74 74
	ror $75.b,X		; 76 75
	adc $77.b,X		; 75 77
	brk $1C.b		; 00 1C
	sei		; 78
	adc [$77.b],Y		; 77 77
	adc $7676.w,Y		; 79 76 76
	ply		; 7A
	sei		; 78
	sei		; 78
	tda		; 7B
	adc $7D79.w,Y		; 79 79 7D
	ply		; 7A
	ply		; 7A
	ror $4F3C.w,X		; 7E 3C 4F
	adc $807B7B.l,X		; 7F 7B 7B 80
	ror $817E.w,X		; 7E 7E 81
	adc $827D.w,X		; 7D 7D 82
	bit $8376.w,X		; 3C 76 83
	stz $73.b,X		; 74 73
	sty $55.b		; 84 55
	bit $8285.w,X		; 3C 85 82
	adc $86.b,X		; 75 86
	bra -128.b		; 80 80
	sta [$7F.b]		; 87 7F
	adc $3C3988.l,X		; 7F 88 39 3C
	bit #$8484.w		; 89 84 84
	txa		; 8A
	bit $8B45.w,X		; 3C 45 8B
	dey		; 88
	dey		; 88
	sty $8A8A.w		; 8C 8A 8A
	sta $3C62.w		; 8D 62 3C
	stx $8181.w		; 8E 81 81
	sta $903C04.l		; 8F 04 3C 90
	sta $918D.w		; 8D 8D 91
	trb $923C.w		; 1C 3C 92
	sta $70938F.l		; 8F 8F 93 70
	bit $7720.w,X		; 3C 20 77
	brk $08.b		; 00 08
	ora $87.b,S		; 03 87
	sta [$87.b]		; 87 87
	ror $83.b,X		; 76 83
	ora ($3C.b,X)		; 01 3C
	cop $3C.b		; 02 3C
	ora $3C.b,S		; 03 3C
	sta ($92.b)		; 92 92
	sta $063C05.l		; 8F 05 3C 06
	bit $8379.w,X		; 3C 79 83
	ora [$3C.b]		; 07 3C
	php		; 08
	bit $3C09.w,X		; 3C 09 3C
	asl A		; 0A
	bit $3C0B.w,X		; 3C 0B 3C
	tsb $0D3C.w		; 0C 3C 0D
	bit $3C0E.w,X		; 3C 0E 3C
	ora $3C103C.l		; 0F 3C 10 3C
	ora ($3C.b),Y		; 11 3C
	ora ($3C.b)		; 12 3C
	ora ($3C.b,S),Y		; 13 3C
	trb $3C.b		; 14 3C
	ora $3C.b,X		; 15 3C
	asl $85.b,X		; 16 85
	sta $17.b,S		; 83 17
	bit $3C18.w,X		; 3C 18 3C
	ora $1A3C.w,Y		; 19 3C 1A
	bit $3C1B.w,X		; 3C 1B 3C
	sta ($91.b),Y		; 91 91
	ora $743C.w,X		; 1D 3C 74
	asl $913C.w,X		; 1E 3C 91
	sta ($1F.b),Y		; 91 1F
	bit $3C20.w,X		; 3C 20 3C
	and ($3C.b,X)		; 21 3C
	jsl $85233C.l		; 22 3C 23 85
	stz $24.b,X		; 74 24
	bit $3C25.w,X		; 3C 25 3C
	rol $3C.b		; 26 3C
	and [$3C.b]		; 27 3C
	plp		; 28
	bit $3C29.w,X		; 3C 29 3C
	and #$2A3C.w		; 29 3C 2A
	bit $3C2B.w,X		; 3C 2B 3C
	pld		; 2B
	bit $3C2C.w,X		; 3C 2C 3C
	and $2E3C.w		; 2D 3C 2E
	bit $3C2F.w,X		; 3C 2F 3C
	bmi  60.b		; 30 3C
	and ($3C.b),Y		; 31 3C
	and ($3C.b)		; 32 3C
	and ($85.b,S),Y		; 33 85
	stz $34.b,X		; 74 34
	bit $3C35.w,X		; 3C 35 3C
	rol $3C.b,X		; 36 3C
	and [$3C.b],Y		; 37 3C
	sec		; 38
	bit $8B8B.w,X		; 3C 8B 8B
	phb		; 8B
	phb		; 8B
	dec A		; 3A
	bit $3C3B.w,X		; 3C 3B 3C
	bit $3D3C.w,X		; 3C 3C 3D
	bit $853E.w,X		; 3C 3E 85
	adc ($3F.b,S),Y		; 73 3F
	bit $3C40.w,X		; 3C 40 3C
	eor ($3C.b,X)		; 41 3C
	.db $42, $3C		; 42 3C
	eor $3C.b,S		; 43 3C
	mvp $8C,$8C		; 44 8C 8C
	sty $3C8C.w		; 8C 8C 3C
	lsr $3C.b		; 46 3C
	eor [$3C.b]		; 47 3C
	pha		; 48
	bit $3C49.w,X		; 3C 49 3C
	lsr A		; 4A
	bit $854B.w,X		; 3C 4B 85
	jmp $4D3C.w		; 4C 3C 4D
	bit $864E.w,X		; 3C 4E 86
	stx $86.b		; 86 86
	bra  60.b		; 80 3C
	bvc  60.b		; 50 3C
	eor ($3C.b),Y		; 51 3C
	eor ($85.b)		; 52 85
	eor ($3C.b,S),Y		; 53 3C
	mvn $84,$3C		; 54 3C 84
	lsr $3C.b,X		; 56 3C
	eor [$3C.b],Y		; 57 3C
	bit #$5884.w		; 89 84 58
	bit $3C59.w,X		; 3C 59 3C
	eor $587C.w,Y		; 59 7C 58
	jmp ($8989.w,X)		; 7C 89 89
	phy		; 5A
	bit $5B84.w,X		; 3C 84 5B
	bit $855C.w,X		; 3C 5C 85
	eor $5E3C.w,X		; 5D 3C 5E
	bit $3C5F.w,X		; 3C 5F 3C
	rts		; 60

	bit $3C61.w,X		; 3C 61 3C
	bcc -115.b		; 90 8D
	adc $3C.b,S		; 63 3C
	stz $3C.b		; 64 3C
	stz $7C.b		; 64 7C
	adc $7C.b,S		; 63 7C
	bcc -115.b		; 90 8D
	adc $3C.b		; 65 3C
	ror $3C.b		; 66 3C
	eor $3C673C.l,X		; 5F 3C 67 3C
	phk		; 4B
	ldy $7576.w,X		; BC 76 75
	adc ($68.b,S),Y		; 73 68
	bit $3C69.w,X		; 3C 69 3C
	ror A		; 6A
	bit $3C6B.w,X		; 3C 6B 3C
	sta $6C.b,S		; 83 6C
	bit $3C6D.w,X		; 3C 6D 3C
	adc $6C3C.w		; 6D 3C 6C
	jmp ($6B83.w,X)		; 7C 83 6B
	jmp ($7C6A.w,X)		; 7C 6A 7C
	adc #$6E7C.w		; 69 7C 6E
	sta $74.b		; 85 74
	adc $93933C.l		; 6F 3C 93 93
	adc ($82.b),Y		; 71 82
	stz $71.b,X		; 74 71
	jmp ($9393.w,X)		; 7C 93 93
	adc $757F7C.l		; 6F 7C 7F 75
	sta $8E.b,S		; 83 8E
	stx $7D81.w		; 8E 81 7D
	ply		; 7A
	sei		; 78
	adc [$00.b],Y		; 77 00
	adc ($1C.b)		; 72 1C
	brk $26.b		; 00 26
	xce		; FB
	brk $0E.b		; 00 0E
	rti		; 40

	tsb $00.b		; 04 00
	adc ($22.b)		; 72 22
	pei ($D2.b)		; D4 D2
	lsr $14.b,X		; 56 14
	bit $1036.w		; 2C 36 10
	txs		; 9A
	inc A		; 1A
	rti		; 40

	jsr $8340.w		; 20 40 83
	tsb $15.b		; 04 15
	beq  42.b		; F0 2A
	stx $81.b		; 86 81
	cmp $12AAD2.l,X		; DF D2 AA 12
	.db $82, $28, $61		; 82 28 61
	ldx #$6821.w		; A2 21 68
	cpx #$E49B.w		; E0 9B E4
	phb		; 8B
	sbc #$C95A.w		; E9 5A C9
	ora ($10.b)		; 12 10
	and $1262.w		; 2D 62 12
	eor ($1E.b,X)		; 41 1E
	eor $08FD25.l		; 4F 25 FD 08
	sta $FB48FF.l,X		; 9F FF 48 FB
	ora ($B2.b)		; 12 B2
	rol A		; 2A
	dey		; 88
	bit #$9784.w		; 89 84 97
	phd		; 0B
	pha		; 48
	tya		; 98
	lda #$44AF.w		; A9 AF 44
	iny		; C8
	mvn $49,$97		; 54 97 49
	bit $92.b		; 24 92
	rol $BDA2.w		; 2E A2 BD
	lda $518E22.l		; AF 22 8E 51
	bcc -126.b		; 90 82
	eor ($B8.b)		; 52 B8
	phx		; DA
	dey		; 88
	bit #$4451.w		; 89 51 44
	lda #$3A4A.w		; A9 4A 3A
	rol $79.b,X		; 36 79
	ora #$1199.w		; 09 99 11
	trb $BD.b		; 14 BD
	cpx $D2.b		; E4 D2
	stp		; DB
	jsl $49F324.l		; 22 24 F3 49
	and $64.b		; 25 64
	bit #$B288.w		; 89 88 B2
	cmp #$D6ED.w		; C9 ED D6
	eor $B6EC.w		; 4D EC B6
	ora ($0B.b,S),Y		; 13 0B
	adc $33.b,S		; 63 33
	rtl		; 6B

	adc $13E81F.l,X		; 7F 1F E8 13
	rol $32.b,X		; 36 32
	cmp $6F6F.w		; CD 6F 6F
	bit $7699.w,X		; 3C 99 76
	cpx $1AC2.w		; EC C2 1A
	ply		; 7A
	adc $B97E.w,X		; 7D 7E B9
	and ($ED.b)		; 32 ED
	tsb $C93D.w		; 0C 3D C9
	and ($ED.b,S),Y		; 33 ED
	sta ($2D.b,S),Y		; 93 2D
	adc $CDA480.l		; 6F 80 A4 CD
	eor $12.b		; 45 12
	adc $AA.b		; 65 AA
	cop $93.b		; 02 93
	and $14.b,X		; 35 14
	eor #$4D97.w		; 49 97 4D
	and $EDDD.w,X		; 3D DD ED
	jmp ($288A.w)		; 6C 8A 28
	rol $6D.b		; 26 6D
	tsa		; 3B
	eor $241225.l		; 4F 25 12 24
	cmp $7A9E.w		; CD 9E 7A
	plp		; 28
	sbc #$2663.w		; E9 63 26
	jmp ($7A21.w,X)		; 7C 21 7A
	bne   4.b		; D0 04
	eor ($64.b),Y		; 51 64
	sbc $779E.w,Y		; F9 9E 77
	sta $EB7157.l,X		; 9F 57 71 EB
	sbc $E9770E.l,X		; FF 0E 77 E9
	bra  69.b		; 80 45
	ora [$99.b],Y		; 17 99
	eor [$D0.b],Y		; 57 D0
	sta [$32.b],Y		; 97 32
	dec $91.b,X		; D6 91
	lda [$28.b]		; A7 28
	ora $85.b,S		; 03 85
	mvn $96,$49		; 54 49 96
	sbc ($49.b,X)		; E1 49
	sta $1C11.w,Y		; 99 11 1C
	pla		; 68
	tax		; AA
	bit $AD8F.w,X		; 3C 8F AD
	sbc $11C5FF.l,X		; FF FF C5 11
	trb $8068.w		; 1C 68 80
	inc A		; 1A
	adc $AFF8.w,Y		; 79 F8 AF
	adc $7A.b,X		; 75 7A
	ldx $6C.b,Y		; B6 6C
	ldx #$DEA8.w		; A2 A8 DE
	sbc $9E67.w,Y		; F9 67 9E
	stx $19A6.w		; 8E A6 19
	ora ($00.b),Y		; 11 00
	ora $169F64.l		; 0F 64 9F 16
	jsl $882ABA.l		; 22 BA 2A 88
	sta ($88.b,X)		; 81 88
	ldx $0088.w		; AE 88 00
	rol A		; 2A
	ora $8A.b,S		; 03 8A
	tsx		; BA
	tay		; A8
	dey		; 88
	brk $A2.b		; 00 A2
	brk $0A.b		; 00 0A
	bra -118.b		; 80 8A
	tay		; A8
	dey		; 88
	brk $A2.b		; 00 A2
	brk $08.b		; 00 08
	ora ($01.b,X)		; 01 01
	eor $12.b,X		; 55 12
	adc $41.b		; 65 41
	ora ($67.b)		; 12 67
	dec $2A.b		; C6 2A
	ldx #$0044.w		; A2 44 00
	lsr $88.b		; 46 88
	brk $44.b		; 00 44
	brk $23.b		; 00 23
	bit $22EA.w,X		; 3C EA 22
	brk $29.b		; 00 29
	and $01B0.w,X		; 3D B0 01
	brk $1B.b		; 00 1B
	adc ($F3.b,S),Y		; 73 F3
	adc $22AA.w,Y		; 79 AA 22
	brk $29.b		; 00 29
	cmp $00D2.w		; CD D2 00
	ora $C8.b,X		; 15 C8
	sty $AEA1.w		; 8C A1 AE
	rol A		; 2A
	jsl $0D8504.l		; 22 04 85 0D
	stz $00.b,X		; 74 00
	ora $E7.b,X		; 15 E7
	sbc ($FD.b,S),Y		; F3 FD
	sbc $5151DE.l		; EF DE 51 51
	lda #$08F8.w		; A9 F8 08
	ldy $B1.b,X		; B4 B1
	ror $5468.w		; 6E 68 54
	brk $8B.b		; 00 8B
	sbc ($22.b,X)		; E1 22
	sty $27.b		; 84 27
	stz $1510.w,X		; 9E 10 15
	asl $DB5F.w,X		; 1E 5F DB
	wai		; CB
	bcc   1.b		; 90 01
	.db $82, $00, $7F		; 82 00 7F
	and $4D.b		; 25 4D
	stx $32A1.w		; 8E A1 32
	sta $12.b,X		; 95 12
	adc $A2.b		; 65 A2
	jmp $E542.w		; 4C 42 E5
	wai		; CB
	phx		; DA
	cmp $378A.w,X		; DD 8A 37
	pea $FBE5.w		; F4 E5 FB
	adc $A0BE.w,Y		; 79 BE A0
	tsb $0E.b		; 04 0E
	cmp $8C.b		; C5 8C
	sbc #$EA72.w		; E9 72 EA
	sbc $54.b		; E5 54
	pea $E0B6.w		; F4 B6 E0
	ora ($44.b),Y		; 11 44
	eor $1D.b		; 45 1D
	pha		; 48
	tax		; AA
	eor $52.b		; 45 52
	lda $50.b,X		; B5 50
	php		; 08
	dey		; 88
	dey		; 88
	iny		; C8
	iny		; C8
	cmp #$C70E.w		; C9 0E C7
	tyx		; BB
	lda $CB.b,S		; A3 CB
	cmp $D3.b,X		; D5 D3
	cmp $D2.b,X		; D5 D2
	lda $AD.b,X		; B5 AD
	rtl		; 6B

	phy		; 5A
	dec $B5.b,X		; D6 B5
	lda $62C2F0.l		; AF F0 C2 62
	lda ($39.b),Y		; B1 39
	and $3939.w,Y		; 39 39 39
	and $22D4.w,Y		; 39 D4 22
	and $23.b,S		; 23 23
	iny		; C8
	sta ($CC.b,S),Y		; 93 CC
	lda $6DE9.w		; AD E9 6D
	and [$D2.b],Y		; 37 D2
	sbc #$F667.w		; E9 67 F6
	jsl $8A2423.l		; 22 23 24 8A
	ldy $6A76.w,X		; BC 76 6A
	tad		; 5B
	plb		; AB
	jmp ($7F6C.w,X)		; 7C 6C 7F
	cmp [$0B.b]		; C7 0B
	plx		; FA
	lda $EEFB.w,Y		; B9 FB EE
	asl $D6EB.w		; 0E EB D6
	sbc $FE.b,S		; E3 FE
	lda $FBF5AF.l,X		; BF AF F5 FB
	ora $F7B177.l,X		; 1F 77 B1 F7
	adc ($68.b),Y		; 71 68
	adc ($E5.b,X)		; 61 E5
	eor $B6AD5B.l		; 4F 5B AD B6
	dec $E0.b,X		; D6 E0
	adc ($B7.b,S),Y		; 73 B7
	and [$B4.b],Y		; 37 B4
	sbc $2C9069.l		; EF 69 90 2C
	bra  95.b		; 80 5F
	brk $12.b		; 00 12
	rol $6649.w		; 2E 49 66
	plp		; 28
	lda $8C.b,S		; A3 8C
	lda $40DC1C.l,X		; BF 1C DC 40
	rti		; 40

	bpl   1.b		; 10 01
	trb $55.b		; 14 55
	eor $54.b		; 45 54
	rti		; 40

	dec $01.b		; C6 01
	pha		; 48
	ora ($41.b,X)		; 01 41
	php		; 08
	clc		; 18
	sbc ($09.b,X)		; E1 09
	sbc [$29.b]		; E7 29
	stz $506E.w,X		; 9E 6E 50
	cop $01.b		; 02 01
	jmp ($B600.w,X)		; 7C 00 B6
	eor $10.b		; 45 10
	cmp $37.b		; C5 37
	and $2D37C7.l		; 2F C7 37 2D
	sta ($18.b),Y		; 91 18
	bra  41.b		; 80 29
	brk $31.b		; 00 31
	bcc -28.b		; 90 E4
	tya		; 98
	lda ($37.b,X)		; A1 37
	and #$6E9E.w		; 29 9E 6E
	adc $DD.b,S		; 63 DD
	inc $7B.b,X		; F6 7B
	eor $3FFEAB.l,X		; 5F AB FE 3F
	adc [$F7.b]		; 67 F7
	inc $0EA7.w,X		; FE A7 0E
	dec $E37E.w		; CE 7E E3
	sta $5F.b,S		; 83 5F
	cpy $70DE.w		; CC DE 70
	and ($C1.b,X)		; 21 C1
	cmp $5F.b,S		; C3 5F
	ora $299D.w		; 0D 9D 29
	bit $AB.b,X		; 34 AB
	sbc $49E0E4.l		; EF E4 E0 49
	cpy #$4F20.w		; C0 20 4F
	tsb $3437.w		; 0C 37 34
	lda $77.b,X		; B5 77
	plx		; FA
	rol $1FEF.w,X		; 3E EF 1F
	xce		; FB
	sbc [$DF.b],Y		; F7 DF
	trb $7221.w		; 1C 21 72
	sbc $AB.b		; E5 AB
	jmp $691DEB.l		; 5C EB 1D 69
	adc $175F2D.l,X		; 7F 2D 5F 17
	cmp ($D8.b)		; D2 D8
	sbc ($72.b,S),Y		; F3 72
	lda $F4D7.w		; AD D7 F4
	and ($2C.b)		; 32 2C
	cmp #$B65E.w		; C9 5E B6
	dec $AE.b,X		; D6 AE
	cmp [$23.b],Y		; D7 23
	rtl		; 6B

	sta ($FC.b),Y		; 91 FC
	sbc $6D11.w,Y		; F9 11 6D
	adc ($6A.b)		; 72 6A
	ora $08.b,X		; 15 08
	iny		; C8
	iny		; C8
	dec $0054.w		; CE 54 00
	php		; 08
	rti		; 40

	sty $F0.b		; 84 F0
	stz $4F78.w,X		; 9E 78 4F
	tax		; AA
	ora ($09.b,X)		; 01 09
	lda $81CB.w,X		; BD CB 81
	adc ($E5.b)		; 72 E5
	xba		; EB
	cmp $2A.b,X		; D5 2A
	pei ($AD.b)		; D4 AD
	sta $B6.b,X		; 95 B6
	stp		; DB
	adc $55.b		; 65 55
	sta [$2F.b],Y		; 97 2F
	and ($73.b,S),Y		; 33 73
	sta [$2D.b],Y		; 97 2D
	bit #$2A09.w		; 89 09 2A
	eor [$A9.b],Y		; 57 A9
	lsr $72A5.w,X		; 5E A5 72
	cmp #$AD66.w		; C9 66 AD
	sta ($D7.b)		; 92 D7
	eor $4EFFD3.l		; 4F D3 FF 4E
	ora $B971F9.l		; 0F F9 71 B9
	xce		; FB
	dec $0B17.w,X		; DE 17 0B
	and $3A5C71.l,X		; 3F 71 5C 3A
	sbc [$56.b]		; E7 56
	eor $132EC5.l		; 4F C5 2E 13
	bpl -120.b		; 10 88
	tya		; 98
	bvs -49.b		; 70 CF
	sec		; 38
	adc ($C2.b,X)		; 61 C2
	tay		; A8
	ldy #$67E1.w		; A0 E1 67
	phk		; 4B
	jsr $2722.w		; 20 22 27
	tsa		; 3B
	tyx		; BB
	cmp $4FF0.w		; CD F0 4F
	phb		; 8B
	adc $42516D.l,X		; 7F 6D 51 42
	cmp $BB.b,X		; D5 BB
	asl $6B.b,X		; 16 6B
	cmp [$9C.b],Y		; D7 9C
	tsb $44.b		; 04 44
	plp		; 28
	lda ($92.b,X)		; A1 92
	.db $42, $85		; 42 85
	eor $09.b		; 45 09
	ora ($A1.b),Y		; 11 A1
	lda ($64.b,S),Y		; B3 64
	ora ($10.b),Y		; 11 10
	ora $41.b		; 05 41
	eor ($41.b),Y		; 51 41
	mvp $11,$54		; 44 54 11
	bpl   5.b		; 10 05
	eor ($51.b,X)		; 41 51
	eor $0E.b,S		; 43 0E
	ora ($15.b),Y		; 11 15
	tsb $44.b		; 04 44
	ora ($50.b,X)		; 01 50
	mvn $01,$50		; 54 50 01
	ora $04.b,X		; 15 04
	mvp $50,$01		; 44 01 50
	stz $5074.w,X		; 9E 74 50
	sta ($41.b)		; 92 41
	ora $B6.b,X		; 15 B6
	jsl $860A20.l		; 22 20 0A 86
	adc $5074.w,X		; 7D 74 50
	eor ($15.b),Y		; 51 15
	mvp $09,$44		; 44 44 09
	plp		; 28
	bvc -74.b		; 50 B6
	ldx #$8882.w		; A2 82 88
	tax		; AA
	jsl $9F6721.l		; 22 21 67 9F
	tda		; 7B
	asl $DA1C.w		; 0E 1C DA
	dex		; CA
	txa		; 8A
	clc		; 18
	eor ($B2.b),Y		; 51 B2
	cpx $8850.w		; EC 50 88
	bit #$FCBC.w		; 89 BC FC
	stz $AD8F.w		; 9C 8F AD
	txy		; 9B
	clv		; B8
	cmp ($79.b,S),Y		; D3 79
	clv		; B8
	sta ($42.b),Y		; 91 42
	lsr A		; 4A
	rtl		; 6B

	cmp ($E2.b)		; D2 E2
	mvp $4F,$44		; 44 44 4F
	eor [$FE.b],Y		; 57 FE
	adc $CF5E.w,X		; 7D 5E CF
	plb		; AB
	cmp $7DEF.w,Y		; D9 EF 7D
	rol $55AF.w,X		; 3E AF 55
	trb $3C.b		; 14 3C
	ldx $366D.w,Y		; BE 6D 36
	and #$4DB1.w		; 29 B1 4D
	tax		; AA
	and [$44.b]		; 27 44
	jmp $2F8F.w		; 4C 8F 2F
	wai		; CB
	sbc $51FF4F.l,X		; FF 4F FF 51
	cpx $FC.b		; E4 FC
	inc $522C.w,X		; FE 2C 52
	sbc ($FB.b),Y		; F1 FB
	sbc ($F6.b,X)		; E1 F6
	bit $BE.b,X		; 34 BE
	sta $3AAF.w,X		; 9D AF 3A
	cpy $85.b		; C4 85
	adc ($C9.b,S),Y		; 73 C9
	eor [$C1.b],Y		; 57 C1
	adc ($0B.b,X)		; 61 0B
	cmp [$2D.b],Y		; D7 2D
	pla		; 68
	phx		; DA
	cmp ($B5.b),Y		; D1 B5
	lda $6B.b,S		; A3 6B
	dec A		; 3A
	dec $75.b		; C6 75
	sty $10EB.w		; 8C EB 10
	and [$B9.b]		; 27 B9
	and $EEC9.w,X		; 3D C9 EE
	eor $AC0D73.l		; 4F 73 0D AC
	rol $B0.b,X		; 36 B0
	phx		; DA
	dec $CECF.w		; CE CF CE
	cmp $F5CFCE.l		; CF CE CF F5
	pea $BCB8.w		; F4 B8 BC
	ror $1F2F.w,X		; 7E 2F 1F
	phb		; 8B
	cmp [$E2.b]		; C7 E2
	sbc ($ED.b),Y		; F1 ED
	stx $CB.b,Y		; 96 CB
	adc $F2.b		; 65 F2
	jsr ($E5B7.w,X)		; FC B7 E5
	lda $64F92D.l,X		; BF 2D F9 64
	sta ($71.b,S),Y		; 93 71
	.db $62, $D9, $FB		; 62 D9 FB
	tyx		; BB
	inc $AFD5.w,X		; FE D5 AF
	txa		; 8A
	cmp ($BC.b,S),Y		; D3 BC
	jmp ($47E6.w,X)		; 7C E6 47
	bvs -39.b		; 70 D9
	sbc $F68F5C.l,X		; FF 5C 8F F6
	sbc $8F6F.w,X		; FD 6F 8F
	bit #$7EF8.w		; 89 F8 7E
	lda $AAE1E1.l,X		; BF E1 E1 AA
	rol $03.b		; 26 03
	inx		; E8
	and ($8D.b),Y		; 31 8D
	and $6E5595.l		; 2F 95 55 6E
	cmp $D9D9.w,X		; DD D9 D9
	sbc ($F9.b)		; F2 F9
	ror A		; 6A
	eor $54A3.w		; 4D A3 54
	jmp $1207.w		; 4C 07 12
	and $165FBF.l,X		; 3F BF 5F 16
	ldx $2D.b,Y		; B6 2D
	ora $55.b,X		; 15 55
	tyx		; BB
	adc [$A1.b],Y		; 77 A1
	bne -47.b		; D0 D1
	cmp ($AF.b),Y		; D1 AF
	plb		; AB
	lsr $A2E2.w,X		; 5E E2 A2
	rts		; 60

	tsa		; 3B
	eor ($EC.b,S),Y		; 53 EC
.ACCU 8
	sep #$AF		; E2 AF
	sta $5F.b,X		; 95 5F
	ror A		; 6A
	tax		; AA
	lda [$6E.b],Y		; B7 6E
	inc $79F7.w		; EE F7 79
	ora $AA18.w,Y		; 19 18 AA
	.db $62, $C8, $54		; 62 C8 54
	jmp $D305.w		; 4C 05 D3
	brk $E0.b		; 00 E0
	ror $ADAA.w		; 6E AA AD
	stp		; DB
	clv		; B8
	bmi  93.b		; 30 5D
	tsx		; BA
	rts		; 60

	rol $26AA.w		; 2E AA 26
	cop $ED.b		; 02 ED
	eor $075F7A.l		; 4F 7A 5F 07
	eor $2AE1.w		; 4D E1 2A
	lda $BDDB.w		; AD DB BD
	asl $138F.w,X		; 1E 8F 13
	dey		; 88
	ror A		; 6A
	cld		; D8
	cmp ($54.b),Y		; D1 54
	jmp $DC07.w		; 4C 07 DC
	lda $58F3.w,Y		; B9 F3 58
	cmp [$D9.b],Y		; D7 D9
	ror $5585.w,X		; 7E 85 55
	tyx		; BB
	adc [$06.b],Y		; 77 06
	ora $2A35CD.l		; 0F CD 35 2A
	phk		; 4B
	lda $54.b,X		; B5 54
	jmp $1A07.w		; 4C 07 1A
	lda [$4E.b],Y		; B7 4E
	cpy $9EF0.w		; CC F0 9E
.ACCU 8
	sep #$AA		; E2 AA
	cmp $D1BB.w,X		; DD BB D1
	inx		; E8
	dec $7EBD.w,X		; DE BD 7E
	tda		; 7B
	ror $1C.b		; 66 1C
	bit $66.b,X		; 34 66
	eor ($B4.b,S),Y		; 53 B4
	inc $CFDD.w,X		; FE DD CF
	sbc $FF56.w		; ED 56 FF
	cld		; D8
	tad		; 5B
	stx $DE.b,Y		; 96 DE
	sbc $D1C2.w,Y		; F9 C2 D1
	lda $2BFDE3.l		; AF E3 FD 2B
	sta $871E.w,X		; 9D 1E 87
	ora ($D8.b,S),Y		; 13 D8
	sbc $1FFE6E.l		; EF 6E FE 1F
	eor $75.b,S		; 43 75
	sta $CCBA.w,Y		; 99 BA CC
	cmp $6D66.w,X		; DD 66 6D
	inc $9B.b,X		; F6 9B
	adc $DFA6.w,X		; 7D A6 DF
	adc #$B7.b		; 69 B7
	phx		; DA
	cli		; 58
	stp		; DB
	adc [$F3.b],Y		; 77 F3
	bcs -38.b		; B0 DA
	cmp $6B.b,S		; C3 6B
	cmp [$97.b]		; C7 97
	sbc $CB.b,S		; E3 CB
	sbc ($E5.b),Y		; F1 E5
	sed		; F8
	sbc ($FC.b)		; F2 FC
	tad		; 5B
	adc ($67.b)		; 72 67
	cmp $37.b		; C5 37
	rol $7C.b		; 26 7C
	mvp $C9,$47		; 44 47 C9
	cmp $FBF7ED.l,X		; DF ED F7 FB
	adc $DFFE.w,X		; 7D FE DF
	adc $EDDFB7.l,X		; 7F B7 DF ED
	sbc [$FE.b],Y		; F7 FE
	ora $F9E093.l		; 0F 93 E0 F9
	ora $5959.w,Y		; 19 59 59
	eor $5959.w,Y		; 59 59 59
	jmp $F431C7.l		; 5C C7 31 F4
	cmp $9FF78D.l,X		; DF 8D F7 9F
	sta $DEF7.w		; 8D F7 DE
	wai		; CB
	bne 123.b		; D0 7B
	eor $3C6E.w,X		; 5D 6E 3C
	ldy $7359.w,X		; BC 59 73
	lda $E2.b		; A5 E2
	cmp $F5.b,X		; D5 F5
	rol A		; 2A
	beq -29.b		; F0 E3
	dec $5C17.w,X		; DE 17 5C
	ror $7F3D.w		; 6E 3D 7F
	cmp $E7FFF2.l		; CF F2 FF E7
	eor $2BDFFD.l,X		; 5F FD DF 2B
.ACCU 8
.INDEX 8
	sep #$72		; E2 72
	jsl $C5E49B.l		; 22 9B E4 C5
	inx		; E8
	cmp $F5.b		; C5 F5
	ror A		; 6A
	mvn $69,$8F		; 54 8F 69
	ldx $C5.b,Y		; B6 C5
	pea $D561.w		; F4 61 D5
	cmp $7B.b,S		; C3 7B
	asl $1BAE.w		; 0E AE 1B
	cld		; D8
	lda $B1.b,X		; B5 B1
	pla		; 68
	cmp ($FD.b,S),Y		; D3 FD
	cmp $2CCC12.l		; CF 12 CC 2C
	jmp.w [$0BB3]		; DC B3 0B
	and [$2B.b],Y		; 37 2B
	nop		; EA
	cmp [$B9.b],Y		; D7 B9
	asl $C3A9.w,X		; 1E A9 C3
	sta ($B4.b)		; 92 B4
	sta $9F1E.w,Y		; 99 1E 9F
	pei ($F6.b)		; D4 F6
	adc $F6AF53.l,X		; 7F 53 AF F6
	plb		; AB
	sbc $FE6D.w		; ED 6D FE
	phb		; 8B
	phx		; DA
	ldx #$A5.b		; A2 A5
	ora ($51.b),Y		; 11 51
	pea $D0A8.w		; F4 A8 D0
	cmp $A9.b		; C5 A9
	phb		; 8B
	jsl $CFA37C.l		; 22 7C A3 CF
	bvs  55.b		; 70 37
	jmp $03D70D.l		; 5C 0D D7 03
	adc $C0.b,X		; 75 C0
	cmp $1730.w,X		; DD 30 17
	jmp $D305.w		; 4C 05 D3
	ora ($74.b,X)		; 01 74
	cpy #$5D.b		; C0 5D
	inc $DEF4.w		; EE F4 DE
	and ($CF.b,S),Y		; 33 CF
	inc $7EDF.w		; EE DF 7E
	sbc $AF8D83.l,X		; FF 83 8D AF
	sbc $827DF9.l		; EF F9 7D 82
	asl $AF.b,X		; 16 AF
	phy		; 5A
	cmp $2E.b,X		; D5 2E
	cli		; 58
	dec $2E.b,X		; D6 2E
	eor $FE.b,X		; 55 FE
	iny		; C8
	ldx $31F9.w		; AE F9 31
	tyx		; BB
	ora $C7DF.w,X		; 1D DF C7
	sbc [$BF.b],Y		; F7 BF
	ldx $D5DF.w		; AE DF D5
	cmp [$F2.b],Y		; D7 F2
	sed		; F8
	and $E94E1F.l,X		; 3F 1F 4E E9
	eor ($AE.b)		; 52 AE
	lsr $EA.b		; 46 EA
	lda $E8.b,X		; B5 E8
	tsx		; BA
	cmp $4546.w,Y		; D9 46 45
	lda $3EDC.w		; AD DC 3E
	cpx $08.b		; E4 08
	eor $31F9.w		; 4D F9 31
	jmp ($823F.w,X)		; 7C 3F 82
	adc ($17.b,S),Y		; 73 17
	and $18F6.w,Y		; 39 F6 18
	eor $268F2F.l,X		; 5F 2F 8F 26
	dec $FBA5.w,X		; DE A5 FB
	txy		; 9B
	cmp $9F5C.w,X		; DD 5C 9F
	stp		; DB
	lda ($2D.b,S),Y		; B3 2D
	stz $7FBE.w		; 9C BE 7F
	dec $D5E7.w,X		; DE E7 D5
	lda [$BC.b],Y		; B7 BC
	lda [$E7.b],Y		; B7 E7
	ldx $77FB.w,Y		; BE FB 77
	sbc [$F4.b]		; E7 F4
	tyx		; BB
	cmp $B0.b,X		; D5 B0
	sbc $0FAF.w,X		; FD AF 0F
	sta $1D563E.l,X		; 9F 3E 56 1D
	sbc $CF.b,X		; F5 CF
	cpx #$38.b		; E0 38
	ror $DB6E.w,X		; 7E 6E DB
	plx		; FA
	rol $32DF.w,X		; 3E DF 32
	lda [$32.b],Y		; B7 32
	lda [$32.b],Y		; B7 32
	lda [$2E.b],Y		; B7 2E
	eor #$7D.b		; 49 7D
	cmp #$7D.b		; C9 7D
	cmp $C5DF16.l		; CF 16 DF C5
	sbc $393B.w,X		; FD 3B 39
	tad		; 5B
	and $395B.w,Y		; 39 5B 39
	tad		; 5B
	ora $193B.w,Y		; 19 3B 19
	tsa		; 3B
	ora $CF24.w,Y		; 19 24 CF
	sta ($02.b,X)		; 81 02
	.db $62, $91, $4C		; 62 91 4C
	mvp $22,$22		; 44 22 22
	jsl $222222.l		; 22 22 22 22
	jsl $CF3F22.l		; 22 22 3F CF
	cpx $E9.b		; E4 E9
	adc [$3A.b],Y		; 77 3A
	eor $97CE.w,X		; 5D CE 97
	adc ($A5.b,S),Y		; 73 A5
	jmp.w [$77E9]		; DC E9 77
	dec A		; 3A
	eor $27C2.w,X		; 5D C2 27
	and ($C3.b,S),Y		; 33 C3
	txy		; 9B
	sbc ($CD.b,X)		; E1 CD
	beq -26.b		; F0 E6
	sed		; F8
	adc ($7C.b,S),Y		; 73 7C
	and $1CBE.w,Y		; 39 BE 1C
	jmp.w [$677B]		; DC 7B 67
	inc $BF.b		; E6 BF
	pea $F073.w		; F4 73 F0
	inc $FCE5.w,X		; FE E5 FC
	cmp $610044.l,X		; DF 44 00 61
	.db $82, $7B, $AC		; 82 7B AC
	tas		; 1B
	dec $2062.w		; CE 62 20
	sec		; 38
	tas		; 1B
	tay		; A8
	ldx #$00.b		; A2 00
	rol $02.b		; 26 02
	nop		; EA
	jsl $EF0322.l		; 22 22 03 EF
	ldy $714C.w,X		; BC 4C 71
	jsr ($E6F4.w,X)		; FC F4 E6
	sbc $9800D8.l,X		; FF D8 00 98
	and $FD.b,S		; 23 FD
	sty $46.b,X		; 94 46
	ldx #$20.b		; A2 20
	adc ($E4.b)		; 72 E4
	cmp ($E4.b,S),Y		; D3 E4
	adc #$F2.b		; 69 F2
	bit $F9.b,X		; 34 F9
	inc A		; 1A
	jmp ($E58F.w,X)		; 7C 8F E5
	cpx $7F.b		; E4 7F
	and [$22.b],Y		; 37 22
	ldy $3236.w,X		; BC 36 32
	adc $D79E.w,Y		; 79 9E D7
	and ($DA.b,S),Y		; 33 DA
	inc $7B.b		; E6 7B
	jmp $976BCF.l		; 5C CF 6B 97
	lda $CB.b		; A5 CB
	cmp ($9B.b)		; D2 9B
	rti		; 40

	sta ($02.b,X)		; 81 02
	tsb $08.b		; 04 08
	tsb $20.b		; 04 20
	jmp $1042.w		; 4C 42 10
	brk $22.b		; 00 22
	tya		; 98
	bra  68.b		; 80 44
	mvp $44,$44		; 44 44 44
	mvp $44,$44		; 44 44 44
	asl $97.b		; 06 97
	and [$5B.b],Y		; 37 5B
	lda $A79FD3.l		; AF D3 9F A7
	cmp [$D6.b],Y		; D7 D6
	sta $697D5A.l,X		; 9F 5A 7D 69
	cmp [$10.b],Y		; D7 10
	dey		; 88
	cmp [$44.b],Y		; D7 44
	rti		; 40

	ora ($45.b),Y		; 11 45
	brk $05.b		; 00 05
	tsb $45.b		; 04 45
	mvp $F4,$40		; 44 40 F4
	inc $FD0B.w,X		; FE 0B FD
	dec $874E.w,X		; DE 4E 87
	eor ($93.b,S),Y		; 53 93
	lda ($16.b,X)		; A1 16
	sty $5A.b		; 84 5A
	ora ($2F.b),Y		; 11 2F
	ldx $63.b,Y		; B6 63
	cmp $63C6.w		; CD C6 63
	stx $33.b		; 86 33
	ora $018C.w,Y		; 19 8C 01
	tas		; 1B
	beq -66.b		; F0 BE
	bcc  32.b		; 90 20
	eor ($42.b,X)		; 41 42
	sbc $BF7C.w,Y		; F9 7C BF
	rol $2F.b,X		; 36 2F
	sta [$C0.b],Y		; 97 C0
	ora ($45.b),Y		; 11 45
	brk $2A.b		; 00 2A
	plp		; 28
	jsl $31252A.l		; 22 2A 25 31
	bra -118.b		; 80 8A
	plp		; 28
	ora ($96.b,X)		; 01 96
	ldy #$88.b		; A0 88
	tay		; A8
	sta ($EB.b)		; 92 EB
	sta [$EC.b]		; 87 EC
	adc $7D8C.w,X		; 7D 8C 7D
	dec A		; 3A
	stz $48AD.w		; 9C AD 48
	sbc $23.b,X		; F5 23
	pei ($8F.b)		; D4 8F
	eor ($35.b)		; 52 35
	ldy $A7.b		; A4 A7
	sta ($49.b,X)		; 81 49
	eor #$49.b		; 49 49
	eor #$48.b		; 49 48
	ora $B5.b,X		; 15 B5
	xba		; EB
	rtl		; 6B

	sed		; F8
	cpx $A3.b		; E4 A3
	lsr $2559.w,X		; 5E 59 25
	sta ($59.b)		; 92 59
	asl $52.b,X		; 16 52
	.db $82, $83, $62		; 82 83 62
	adc $B193.w		; 6D 93 B1
	sta ($B1.b,S),Y		; 93 B1
	sta ($04.b)		; 92 04
	jsr $8140.w		; 20 40 81
	cop $04.b		; 02 04
	ora #$8A.b		; 09 8A
	eor $11.b		; 45 11
	ora ($33.b),Y		; 11 33
.ACCU 8
	sep #$22		; E2 22
	rol $21.b		; 26 21
	lda $B43E.w		; AD 3E B4
	plx		; FA
	cmp ($EB.b,S),Y		; D3 EB
	eor $433F9F.l		; 4F 9F 3F 43
	cmp [$DE.b],Y		; D7 DE
	beq -72.b		; F0 B8
.ACCU 16
	rep #$22		; C2 22
	jsl $459A6B.l		; 22 6B 9A 45
	xce		; FB
	bit $CF.b		; 24 CF
	mvn $44,$44		; 54 44 44
	mvp $D0,$05		; 44 05 D0
	phb		; 8B
	.db $42, $2D		; 42 2D
	php		; 08
	ldy $22.b,X		; B4 22
	bne -117.b		; D0 8B
	.db $42, $2E		; 42 2E
	lda [$25.b]		; A7 25
	lda $63C68C.l,X		; BF 8C C6 63
	and ($98.b),Y		; 31 98
	cpy $B667.w		; CC 67 B6
	.db $42, $04		; 42 04
	php		; 08
	bpl -73.b		; 10 B7
	cmp ($B7.b,S),Y		; D3 B7
	plb		; AB
	tda		; 7B
	tyx		; BB
	tda		; 7B
	tyx		; BB
.INDEX 16
	rep #$D6		; C2 D6
	ldx $2F5F.w,Y		; BE 5F 2F
	sta [$0E.b],Y		; 97 0E
	and $9B.b,X		; 35 9B
	lsr $B7.b,X		; 56 B7
	tyx		; BB
	cmp $101D.w,X		; DD 1D 10
	brk $54.b		; 00 54
	ora ($44.b),Y		; 11 44
	mvp $05,$05		; 44 05 05
	tsb $B18A.w		; 0C 8A B1
	cmp $14.b		; C5 14
	jmp ($57AE.w,X)		; 7C AE 57
	eor ($A9.b,S),Y		; 53 A9
	sbc $5977.w,Y		; F9 77 59
	sbc $779F.w,X		; FD 9F 77
	cmp $3AA2.w,Y		; D9 A2 3A
	stz $A6.b		; 64 A6
	eor $0627B3.l		; 4F B3 27 06
	eor $FAF0C9.l		; 4F C9 F0 FA
	stx $B8.b,Y		; 96 B8
	ldy $DC5D.w,X		; BC 5D DC
	tyx		; BB
	xba		; EB
	lsr $B7.b,X		; 56 B7
	dec $D7B4.w,X		; DE B4 D7
	lda $03DE.w,X		; BD DE 03
	lsr $A957.w,X		; 5E 57 A9
	lda $133FF1.l		; AF F1 3F 13
	sed		; F8
	sta $B2CA.w,X		; 9D CA B2
	sta ($32.b,S),Y		; 93 32
	sta $5AB5.w,Y		; 99 B5 5A
	stp		; DB
	and $B6.b,X		; 35 B6
	ror $E87A.w,X		; 7E 7A E8
	bit #$E419.w		; 89 19 E4
	lda $22.b,S		; A3 22
	lda $96E3D1.l		; AF D1 E3 96
	eor $F548.w,X		; 5D 48 F5
	and $D4.b,S		; 23 D4
	sta $483D52.l		; 8F 52 3D 48
	sbc $23.b,X		; F5 23
	pei ($8F.b)		; D4 8F
	tas		; 1B
	eor #$4949.w		; 49 49 49
	eor #$4949.w		; 49 49 49
	pha		; 48
	ora ($C9.b)		; 12 C9
	bit $3599.w		; 2C 99 35
	lda ($6B.b)		; B2 6B
	stz $D6.b		; 64 D6
	pea $0D7D.w		; F4 7D 0D
	sta $5DCD1E.l,X		; 9F 1E CD 5D
	sty $8C9D.w		; 8C 9D 8C
	txs		; 9A
	and $A2.b		; 25 A2
	phy		; 5A
	and $F9.b		; 25 F9
	lda ($A5.b)		; B2 A5
	stx $8A.b,Y		; 96 8A
	and ($F7.b,S),Y		; 33 F7
	lda [$B8.b],Y		; B7 B8
	cmp $F3.b,X		; D5 F3
	cpy #$6D03.w		; C0 03 6D
	ldx $8A.b,Y		; B6 8A
	and $1B1B.w		; 2D 1B 1B
	cmp $8BED.w,X		; DD ED 8B
	asl $66.b,X		; 16 66
	eor $36679B.l		; 4F 9B 67 36
	iny		; C8
	txa		; 8A
	jmp $FEAD.w		; 4C AD FE
	sbc $05D5AB.l,X		; FF AB D5 05
	ora $55.b		; 05 55
	nop		; EA
	tyx		; BB
	pea $2645.w		; F4 45 26
	eor [$7B.b],Y		; 57 7B
	lda $DCB9.w,X		; BD B9 DC
	.db $82, $82, $AA		; 82 82 AA
	inc $F35E.w		; EE 5E F3
	adc $0E.b,S		; 63 0E
	jmp ($49F8.w,X)		; 7C F8 49
	sta $08.b,X		; 95 08
	lsr $9DBD.w,X		; 5E BD 9D
	sta $EBD6.w,X		; 9D D6 EB
	ror $66.b		; 66 66
	eor ($32.b),Y		; 51 32
	stz $E8.b,X		; 74 E8
	sbc [$62.b]		; E7 62
	stz $B2DD.w,X		; 9E DD B2
	.db $62, $16, $ED		; 62 16 ED
	sta ($12.b,S),Y		; 93 12
	eor ($62.b)		; 52 62
	asl A		; 0A
	jmp $A546.w		; 4C 46 A5
	and $A8.b,X		; 35 A8
	ldy $99.b		; A4 99
	phy		; 5A
	phy		; 5A
	bvc -123.b		; 50 85
	phy		; 5A
	ldy $50.b,X		; B4 50
	trb $4C.b		; 14 4C
	stz $1A5D.w,X		; 9E 5D 1A
	stz $13.b,X		; 74 13
	ora ($B3.b,S),Y		; 13 B3
	ror $BD.b		; 66 BD
	adc ($63.b)		; 72 63
	nop		; EA
	ldy $C7.b		; A4 C7
	sbc ($62.b),Y		; F1 62
	stz $6672.w,X		; 9E 72 66
	sty $D2.b		; 84 D2
	brk $00.b		; 00 00
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $4DAD62.l,X		; 1F 62 AD 4D
	asl $00.b		; 06 00
	ora $3300.w		; 0D 00 33
	tsb $7A.b		; 04 7A
	tsb $253B.w		; 0C 3B 25
	trb $FE42.w		; 1C 42 FE
	lsr $7FFF.w,X		; 5E FF 7F
	eor ($4A.b)		; 52 4A
	sty $C631.w		; 8C 31 C6
	clc		; 18
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ora #$DA00.w		; 09 00 DA
	clc		; 18
	lda $064D.w		; AD 4D 06
	brk $0D.b		; 00 0D
	brk $33.b		; 00 33
	tsb $7A.b		; 04 7A
	tsb $253B.w		; 0C 3B 25
	trb $FE42.w		; 1C 42 FE
	lsr $7FFF.w,X		; 5E FF 7F
	eor ($4A.b)		; 52 4A
	sty $C631.w		; 8C 31 C6
	clc		; 18
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ora #$DA00.w		; 09 00 DA
	clc		; 18
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	lda $064D.w		; AD 4D 06
	brk $0D.b		; 00 0D
	brk $33.b		; 00 33
	tsb $7A.b		; 04 7A
	tsb $253B.w		; 0C 3B 25
	trb $FE42.w		; 1C 42 FE
	lsr $7FFF.w,X		; 5E FF 7F
	eor ($4A.b)		; 52 4A
	sty $C631.w		; 8C 31 C6
	clc		; 18
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ora #$DA00.w		; 09 00 DA
	clc		; 18
	.db $42, $FB		; 42 FB
	brk $07.b		; 00 07
	asl $A9.b		; 06 A9
	brk $07.b		; 00 07
	asl $5F.b		; 06 5F
	clc		; 18
	rts		; 60

	brk $1C.b		; 00 1C
	adc ($60.b,X)		; 61 60
	rts		; 60

	.db $62, $61, $61		; 62 61 61
	adc $62.b,S		; 63 62
	.db $62, $64, $63		; 62 64 63
	adc $65.b,S		; 63 65
	stz $64.b		; 64 64
	ror $65.b		; 66 65
	adc $67.b		; 65 67
	trb $6825.w		; 1C 25 68
	jmp $4A6963.l		; 5C 63 69 4A
	trb $676A.w		; 1C 6A 67
	adc [$6B.b]		; 67 6B
	pla		; 68
	.db $62, $6C, $66		; 62 6C 66
	ror $6D.b		; 66 6D
	trb $6E4C.w		; 1C 4C 6E
	adc #$6F69.w		; 69 69 6F
	jmp $1C7064.l		; 5C 64 70 1C
	eor $6D6D71.l		; 4F 71 6D 6D
	adc ($1C.b)		; 72 1C
	eor ($73.b)		; 52 73
	bvs 112.b		; 70 70
	stz $1C.b,X		; 74 1C
	phy		; 5A
	adc $72.b,X		; 75 72
	adc ($76.b)		; 72 76
	stz $74.b,X		; 74 74
	adc [$1C.b],Y		; 77 1C
	rol $6020.w		; 2E 20 60
	brk $08.b		; 00 08
	ora $6C.b,S		; 03 6C
	jmp ($6366.w)		; 6C 66 63
	adc ($60.b,X)		; 61 60
	ora ($1C.b,X)		; 01 1C
	cop $1C.b		; 02 1C
	ora $1C.b,S		; 03 1C
	tsb $1C.b		; 04 1C
	ora $1C.b		; 05 1C
	ora $1C.b		; 05 1C
	tsb $5C.b		; 04 5C
	ora $5C.b,S		; 03 5C
	asl $1C.b		; 06 1C
	ora ($6F.b,X)		; 01 6F
	.db $62, $60, $07		; 62 60 07
	trb $1C08.w		; 1C 08 1C
	ora #$0A1C.w		; 09 1C 0A
	trb $1C0B.w		; 1C 0B 1C
	tsb $0C1C.w		; 0C 1C 0C
	jmp $0D5C0B.l		; 5C 0B 5C 0D
	trb $1C0E.w		; 1C 0E 1C
	ora $6F071C.l		; 0F 1C 07 6F
	adc ($60.b,X)		; 61 60
	bpl  28.b		; 10 1C
	ora ($1C.b),Y		; 11 1C
	ora ($1C.b)		; 12 1C
	ora ($1C.b,S),Y		; 13 1C
	trb $1C.b		; 14 1C
	ora $1C.b,X		; 15 1C
	adc ($15.b,X)		; 61 15
	jmp $135C14.l		; 5C 14 5C 13
	jmp $111C16.l		; 5C 16 1C 11
	jmp $616F10.l		; 5C 10 6F 61
	ora [$1C.b],Y		; 17 1C
	clc		; 18
	trb $1C19.w		; 1C 19 1C
	inc A		; 1A
	trb $1C1B.w		; 1C 1B 1C
	trb $1D1C.w		; 1C 1C 1D
	trb $1C1D.w		; 1C 1D 1C
	trb $1B5C.w		; 1C 5C 1B
	trb $1C1E.w		; 1C 1E 1C
	ora $5C181C.l,X		; 1F 1C 18 5C
	ora [$6F.b],Y		; 17 6F
	jsr $211C.w		; 20 1C 21
	trb $1C22.w		; 1C 22 1C
	and $1C.b,S		; 23 1C
	bit $6A.b		; 24 6A
	ror A		; 6A
	ror A		; 6A
	ror A		; 6A
	trb $5C24.w		; 1C 24 5C
	rol $1C.b		; 26 1C
	jsl $5C215C.l		; 22 5C 21 5C
	jsr $616B.w		; 20 6B 61
	and [$1C.b]		; 27 1C
	plp		; 28
	trb $1C29.w		; 1C 29 1C
	rol A		; 2A
	trb $1C2B.w		; 1C 2B 1C
	bit $2D1C.w		; 2C 1C 2D
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	trb $5C2D.w		; 1C 2D 5C
	bit $2B1C.w		; 2C 1C 2B
	jmp $295C2A.l		; 5C 2A 5C 29
	jmp $275C28.l		; 5C 28 5C 27
	rtl		; 6B

	rts		; 60

	and $1C301C.l		; 2F 1C 30 1C
	and ($1C.b),Y		; 31 1C
	and ($1C.b)		; 32 1C
	and ($1C.b,S),Y		; 33 1C
	and ($1C.b,S),Y		; 33 1C
	bit $1C.b,X		; 34 1C
	and $1C.b,X		; 35 1C
	rol $1C.b,X		; 36 1C
	and [$1C.b],Y		; 37 1C
	sec		; 38
	trb $1C39.w		; 1C 39 1C
	dec A		; 3A
	trb $1C3B.w		; 1C 3B 1C
	and ($5C.b,S),Y		; 33 5C
	and ($5C.b,S),Y		; 33 5C
	and ($5C.b)		; 32 5C
	and ($5C.b),Y		; 31 5C
	bmi  92.b		; 30 5C
	and $1C3C6B.l		; 2F 6B 3C 1C
	and $3E1C.w,X		; 3D 1C 3E
	trb $1C3F.w		; 1C 3F 1C
	rti		; 40

	trb $1C40.w		; 1C 40 1C
	eor ($1C.b,X)		; 41 1C
	.db $42, $1C		; 42 1C
	eor $1C.b,S		; 43 1C
	mvp $45,$1C		; 44 1C 45
	trb $1C46.w		; 1C 46 1C
	eor $5C.b,S		; 43 5C
	eor [$1C.b]		; 47 1C
	rti		; 40

	jmp $3F5C40.l		; 5C 40 5C 3F
	jmp $3D5C3E.l		; 5C 3E 5C 3D
	jmp $486B3C.l		; 5C 3C 6B 48
	trb $1C49.w		; 1C 49 1C
	ror $4B6E.w		; 6E 6E 4B
	adc ($71.b),Y		; 71 71
	adc ($1C.b),Y		; 71 1C
	phk		; 4B
	jmp $496E6E.l		; 5C 6E 6E 49
	jmp $4D6B48.l		; 5C 48 6B 4D
	trb $734E.w		; 1C 4E 73
	bvs  28.b		; 70 1C
	bvc  28.b		; 50 1C
	eor ($75.b),Y		; 51 75
	adc $75.b,X		; 75 75
	trb $5C51.w		; 1C 51 5C
	eor ($73.b,S),Y		; 53 73
	bvs  28.b		; 70 1C
	lsr $4D5C.w		; 4E 5C 4D
	rtl		; 6B

	rts		; 60

	mvn $55,$1C		; 54 1C 55
	trb $1C56.w		; 1C 56 1C
	eor [$1C.b],Y		; 57 1C
	cli		; 58
	trb $7659.w		; 1C 59 76
	ror $76.b,X		; 76 76
	trb $5C59.w		; 1C 59 5C
	cli		; 58
	jmp $565C57.l		; 5C 57 5C 56
	trb $5C55.w		; 1C 55 5C
	mvn $61,$6B		; 54 6B 61
	tad		; 5B
	trb $1C5C.w		; 1C 5C 1C
	eor $5E1C.w,X		; 5D 1C 5E
	trb $6163.w		; 1C 63 61
	lsr $5D5C.w,X		; 5E 5C 5D
	trb $5C5C.w		; 1C 5C 5C
	tad		; 5B
	jmp $62666C.l		; 5C 6C 66 62
	adc ($00.b,X)		; 61 00
	eor $26001C.l,X		; 5F 1C 00 26
	xce		; FB
	brk $0B.b		; 00 0B
	cpx #$0004.w		; E0 04 00
	eor $B28526.l,X		; 5F 26 85 B2
	lsr $1CC7.w		; 4E C7 1C
	bpl   9.b		; 10 09
	stx $10.b		; 86 10
	php		; 08
	trb $A0.b		; 14 A0
	cpy #$5C08.w		; C0 08 5C
	cld		; D8
	sty $C021.w		; 8C 21 C0
	ldy $2F.b		; A4 2F
	lsr A		; 4A
	ldx #$20C5.w		; A2 C5 20
	sta ($10.b,X)		; 81 10
	.db $42, $6B		; 42 6B
	phk		; 4B
	.db $62, $EC, $FA		; 62 EC FA
	bit $0D8B.w		; 2C 8B 0D
	ora ($81.b)		; 12 81
	ora $D794.w,X		; 1D 94 D7
	lda $D9B26D.l		; AF 6D B2 D9
	eor [$58.b],Y		; 57 58
	lda ($C4.b)		; B2 C4
	ldx #$CFD0.w		; A2 D0 CF
	adc $2169.w,X		; 7D 69 21
	and ($65.b),Y		; 31 65
	ora ($96.b),Y		; 11 96
	eor #$F52A.w		; 49 2A F5
	ror $99.b		; 66 99
	cmp $9DAEB8.l		; CF B8 AE 9D
	and $FD96B4.l		; 2F B4 96 FD
	cmp $526C.w,Y		; D9 6C 52
	bit $A7B2.w		; 2C B2 A7
	stp		; DB
	and $DC96.w		; 2D 96 DC
	sbc $7D.b		; E5 7D
	lda $426D.w		; AD 6D 42
	bit $B58B.w		; 2C 8B B5
	asl $5942.w,X		; 1E 42 59
	inc A		; 1A
	lsr $C1.b		; 46 C1
	lsr $DB6C.w,X		; 5E 6C DB
	sta $E7A927.l,X		; 9F 27 A9 E7
	beq 122.b		; F0 7A
	rti		; 40

	clc		; 18
	bit $378C.w,X		; 3C 8C 37
	sbc ($F4.b,S),Y		; F3 F4
	stz $01.b,X		; 74 01
	pei ($F9.b)		; D4 F9
	tsx		; BA
	sbc $AF26.w,X		; FD 26 AF
	sta $B7.b,X		; 95 B7
	dec $70FF.w,X		; DE FF 70
	cmp ($D0.b,X)		; C1 D0
	cmp $2D.b,S		; C3 2D
	pld		; 2B
	tas		; 1B
	eor $757028.l		; 4F 28 70 75
	phy		; 5A
	asl $A8.b,X		; 16 A8
	eor ($C9.b,X)		; 41 C9
	tsx		; BA
	sta ($A0.b)		; 92 A0
	inc A		; 1A
	stx $AA.b,Y		; 96 AA
	sty $09.b		; 84 09
	and $40.b		; 25 40
	and $54.b		; 25 54
	jsr $2A49.w		; 20 49 2A
	brk $F3.b		; 00 F3
	ror $1FBE.w,X		; 7E BE 1F
	plx		; FA
	sbc ($F5.b),Y		; F1 F5
	stz $F8.b,X		; 74 F8
	ldy $D6A0.w,X		; BC A0 D6
	sbc $F5.b,X		; F5 F5
	sbc $B5.b,S		; E3 B5
	adc $6D.b		; 65 6D
	dec $8161.w		; CE 61 81
	txy		; 9B
	bmi 115.b		; 30 73
	and $0398.w,Y		; 39 98 03
	asl $0C.b		; 06 0C
	cli		; 58
	lda ($67.b),Y		; B1 67
	adc $BD9F.w,X		; 7D 9F BD
	sbc $7F.b		; E5 7F
	eor $7EEC33.l		; 4F 33 EC 7E
	lda [$C3.b],Y		; B7 C3
	xce		; FB
	lsr $A3CF.w,X		; 5E CF A3
	sbc $7A9B9B.l,X		; FF 9B 9B 7A
	bit $BBBF.w,X		; 3C BF BB
	lda [$DE.b]		; A7 DE
	plx		; FA
	rol $AFD7.w,X		; 3E D7 AF
	inc $FB.b,X		; F6 FB
	jmp $993FEE.l		; 5C EE 3F 99
	cmp [$CC.b]		; C7 CC
	sbc $EA.b,S		; E3 EA
	adc $D8.b		; 65 D8
	sbc $1F.b,X		; F5 1F
	ora $EACBB7.l		; 0F B7 CB EA
	tda		; 7B
	tsx		; BA
	lda $01.b,X		; B5 01
	cmp [$AF.b]		; C7 AF
	adc $A9.b,X		; 75 A9
	dec $D6.b		; C6 D6
	ora ($22.b,X)		; 01 22
	tay		; A8
	cop $40.b		; 02 40
	ora ($23.b,X)		; 01 23
	sta $94978F.l		; 8F 8F 97 94
	cop $40.b		; 02 40
	ora ($23.b,X)		; 01 23
	lda [$D3.b]		; A7 D3
	cmp $B3.b,X		; D5 B3
	sbc #$12D2.w		; E9 D2 12
	brk $09.b		; 00 09
	ldy $AA.b,X		; B4 AA
	brk $DB.b		; 00 DB
	sty $3100.w		; 8C 00 31
	stp		; DB
	cld		; D8
	cmp $39F4.w,X		; DD F4 39
	sbc $012D17.l,X		; FF 17 2D 01
	phb		; 8B
	lda $AF.b,X		; B5 AF
	sbc $CD.b,S		; E3 CD
	stz $DF01.w		; 9C 01 DF
	sed		; F8
	lda $DB3A.w,Y		; B9 3A DB
	inc $C93F.w,X		; FE 3F C9
	jmp.w [$BFFA]		; DC FA BF
	and ($EB.b,S),Y		; 33 EB
	plx		; FA
	stz $EF6E.w,X		; 9E 6E EF
	phk		; 4B
	sbc [$7D.b]		; E7 7D
	sta $CFC163.l,X		; 9F 63 C1 CF
	sbc $677E.w,Y		; F9 7E 67
	stp		; DB
	sbc $F8FF.w,X		; FD FF F8
	sbc #$73F5.w		; E9 F5 73
	pea $DCB9.w		; F4 B9 DC
	dec $0070.w		; CE 70 00
	adc ($3C.b,S),Y		; 73 3C
	stx $F8.b		; 86 F8
	brk $73.b		; 00 73
	and ($C7.b),Y		; 31 C7
	stz $C9C3.w,X		; 9E C3 C9
	sbc ($4C.b)		; F2 4C
	tas		; 1B
	cmp $0C362F.l,X		; DF 2F 36 0C
	adc ($63.b,S),Y		; 73 63
	sta $E69D.w,X		; 9D 9D E6
	adc ($E6.b,X)		; 61 E6
	adc ($E6.b,X)		; 61 E6
	adc ($D0.b,X)		; 61 D0
	cmp $A1.b,S		; C3 A1
	cmp $FCE0F1.l,X		; DF F1 E0 FC
	cmp $CE1F.w,X		; DD 1F CE
	cpx $DC.b		; E4 DC
	sbc $72.b		; E5 72
	and $981C.w,Y		; 39 1C 98
	ror $A68E.w,X		; 7E 8E A6
	tad		; 5B
	sbc $E56F.w,Y		; F9 6F E5
	lda $F696.w,X		; BD 96 F6
	tad		; 5B
	cmp $656F.w,Y		; D9 6F 65
	lda $8D96.w,X		; BD 96 8D
	inc A		; 1A
	stz $EA.b,X		; 74 EA
	cmp $8BED.w,Y		; D9 ED 8B
	jmp ($B727.w)		; 6C 27 B7
	adc $6CC78F.l		; 6F 8F C7 6C
	tda		; 7B
	adc ($BD.b,X)		; 61 BD
	tda		; 7B
	ora ($96.b,S),Y		; 13 96
	eor $FA84.w		; 4D 84 FA
	and $E9D5B9.l,X		; 3F B9 D5 E9
	sbc $D1DE68.l		; EF 68 DE D1
	lda $7BA3.w,X		; BD A3 7B
	lsr $F6.b		; 46 F6
	sta $F3DD73.l		; 8F 73 DD F3
	adc ($DF.b),Y		; 71 DF
	cmp [$73.b]		; C7 73
	ora $77CC.w,X		; 1D CC 77
	and ($DC.b),Y		; 31 DC
	cmp [$73.b]		; C7 73
	ora $5ECC.w,X		; 1D CC 5E
	tda		; 7B
	cmp ($69.b)		; D2 69
	ror $ADBA.w		; 6E BA AD
	bne  -7.b		; D0 F9
	eor $AF5E.w,X		; 5D 5E AF
	ora $83.b,S		; 03 83
	plb		; AB
	cmp ($A9.b,X)		; C1 A9
	lda $BA.b		; A5 BA
	dec A		; 3A
	and $D8FF.w,X		; 3D FF D8
	sbc $1D7CF4.l		; EF F4 7C 1D
	ora $CF4B07.l,X		; 1F 07 4B CF
	inx		; E8
	jsr ($BD1F.w,X)		; FC 1F BD
	jsr ($1F1C.w,X)		; FC 1C 1F
	eor $3F8F9F.l		; 4F 9F 8F 3F
	asl $3C7E.w,X		; 1E 7E 3C
	jsr ($FC7D.w,X)		; FC 7D FC
	adc $7FFC.w,X		; 7D FC 7F
	asl $8E3E.w,X		; 1E 3E 8E
	adc $BDFFD4.l,X		; 7F D4 FF BD
	inc $873E.w		; EE 3E 87
	and [$53.b]		; 27 53
	phb		; 8B
	eor [$1A.b]		; 47 1A
	dec $65.b		; C6 65
	lda $BD8C96.l,X		; BF 96 8C BD
	tsb $B8B7.w		; 0C B7 B8
	cmp ($5A.b)		; D2 5A
	ror A		; 6A
	ora $2B.b		; 05 2B
	and $254800.l		; 2F 00 48 25
	cpx $AA6B.w		; EC 6B AA
	ora $29.b		; 05 29
	tsb $82.b		; 04 82
	eor $65.b		; 45 65
	bcc  41.b		; 90 29
	pha		; 48
	bit $12.b		; 24 12
	plp		; 28
	ora $29.b		; 05 29
	tsb $82.b		; 04 82
	eor $50.b		; 45 50
	and #$7858.w		; 29 58 78
	cop $41.b		; 02 41
	and $FF0A.w		; 2D 0A FF
	and $CFDCF1.l		; 2F F1 DC CF
	lda $F8E6BB.l,X		; BF BB E6 F8
	lda $EB73.w,Y		; B9 73 EB
	lda ($98.b)		; B2 98
	sbc $8FCBE3.l		; EF E3 CB 8F
	sbc $9DB9E3.l,X		; FF E3 B9 9D
	and $B6.b		; 25 B6
	brk $30.b		; 00 30
	ror $CD.b		; 66 CD
	sbc ($39.b)		; F2 39
	bra   6.b		; 80 06
	tsb $8318.w		; 0C 18 83
	ora [$CE.b],Y		; 17 CE
	cmp $EF3CF5.l,X		; DF F5 3C EF
	cmp $F7.b		; C5 F7
	sec		; 38
	bit $A0.b,X		; 34 A0
	cmp $E8.b		; C5 E8
	sbc [$EC.b]		; E7 EC
	sbc $60486A.l		; EF 6A 48 60
	lda [$6D.b],Y		; B7 6D
	phy		; 5A
	bit $DF2D.w		; 2C 2D DF
	inc $3FF4.w,X		; FE F4 3F
	and #$4982.w		; 29 82 49
	rol $B9.b,X		; 36 B9
	asl $B4D7.w,X		; 1E D7 B4
	cpy $CB.b		; C4 CB
	pld		; 2B
	sta ($D1.b)		; 92 D1
	lda [$6F.b],Y		; B7 6F
	ora $3A5677.l		; 0F 77 56 3A
	sbc $2C.b,X		; F5 2C
	ldy $CE.b,X		; B4 CE
	rol $38.b,X		; 36 38
	sbc $BE.b,X		; F5 BE
	stx $9D.b,Y		; 96 9D
	and #$AAA4.w		; 29 A4 AA
	and $32.b,X		; 35 32
	sta ($41.b)		; 92 41
	phy		; 5A
	sbc $D2.b,X		; F5 D2
	eor $51.b		; 45 51
	ora ($48.b)		; 12 48
	plp		; 28
	sbc ($F1.b,S),Y		; F3 F1
	stz $63.b		; 64 63
	sta $72BB.w		; 8D BB 72
	sbc #$F6D3.w		; E9 D3 F6
	tyx		; BB
	ldx $1EFF.w,Y		; BE FF 1E
	asl $8E35.w,X		; 1E 35 8E
	cmp $969D.w,Y		; D9 9D 96
	lsr $E3C7.w,X		; 5E C7 E3
	sbc $4F3E.w,Y		; F9 3E 4F
	txy		; 9B
	dec $CFDC.w		; CE DC CF
	cmp $0647C7.l		; CF C7 47 06
	sbc $B14F07.l		; EF 07 4F B1
	sbc $36.b,X		; F5 36
	jmp $86D6ED.l		; 5C ED D6 86
	stx $A6.b,Y		; 96 A6
	lda [$A8.b]		; A7 A8
	cpx $6D96.w		; EC 96 6D
	ldx $E85F.w,Y		; BE 5F E8
	inc $6F8F.w,X		; FE 8F 6F
	inc $3B77.w,X		; FE 77 3B
	adc $DFFCB3.l,X		; 7F B3 FC DF
	wai		; CB
	sbc $E9BD.w,Y		; F9 BD E9
	bit $896F.w,X		; 3C 6F 89
	beq -65.b		; F0 BF
	pld		; 2B
	cmp $7F69.w,X		; DD 69 7F
	sta $FEFD9D.l,X		; 9F 9D FD FE
	cmp [$F0.b],Y		; D7 F0
	sbc $D95F.w,Y		; F9 5F D9
	plx		; FA
	lda $7FFBE9.l,X		; BF E9 FB 7F
	sta [$9D.b]		; 87 9D
	sed		; F8
	tsx		; BA
	sta $897F73.l,X		; 9F 73 7F 89
	plb		; AB
	ora $F9B9.w,X		; 1D B9 F9
	adc [$7F.b],Y		; 77 7F
	rol $C98F.w,X		; 3E 8F C9
	lda [$E0.b]		; A7 E0
	cmp ($CB.b),Y		; D1 CB
	sta $D263E4.l,X		; 9F E4 63 D2
	plx		; FA
	adc $7EF3DD.l,X		; 7F DD F3 7E
	lda $96D3DD.l		; AF DD D3 96
	clv		; B8
	lda $B30F1F.l		; AF 1F 0F B3
	sbc $6E5D.w,X		; FD 5D 6E
	asl $817F.w,X		; 1E 7F 81
	rol A		; 2A
	phy		; 5A
	sta $7CCD.w,X		; 9D CD 7C
	ora $3577.w,Y		; 19 77 35
	bit $56.b		; 24 56
	lda $197C.w,X		; BD 7C 19
	adc #$5492.w		; 69 92 54
	ldy $29.b		; A4 29
	jsl $549282.l		; 22 82 92 54
	ldy $D5.b		; A4 D5
	tax		; AA
	sta ($28.b)		; 92 28
	and $C9.b,X		; 35 C9
	rol A		; 2A
	eor ($55.b)		; 52 55
	bit $50.b		; 24 50
	bit $95.b		; 24 95
	jsr $3018.w		; 20 18 30
	rts		; 60

	cmp ($80.b,X)		; C1 80
	clc		; 18
	bmi  96.b		; 30 60
	cmp ($83.b,X)		; C1 83
	lda ($E9.b,S),Y		; B3 E9
	adc $78F86F.l,X		; 7F 6F F8 78
	adc $AC2C.w,Y		; 79 2C AC
	ldx $F7.b,Y		; B6 F7
	jmp ($367C.w,X)		; 7C 7C 36
	eor $D0A7.w,X		; 5D A7 D0
	cpx #$3AD2.w		; E0 D2 3A
	and $3B1D.w,X		; 3D 1D 3B
	ora ($F8.b,S),Y		; 13 F8
	rol $1EE7.w,X		; 3E E7 1E
	sta $A47A.w		; 8D 7A A4
	cmp [$97.b]		; C7 97
	asl $795C.w,X		; 1E 5C 79
	adc $24.b,X		; 75 24
	ora $2DBE.w		; 0D BE 2D
	ldx $BE2D.w,Y		; BE 2D BE
	bit $B59A.w		; 2C 9A B5
	lda #$162D.w		; A9 2D 16
	phb		; 8B
	mvp $34,$90		; 44 90 34
	adc ($68.b),Y		; 71 68
.INDEX 8
	sep #$D1		; E2 D1
	cpy $45.b		; C4 45
	and $A6.b		; 25 A6
	cmp ($69.b,S),Y		; D3 69
	sta ($06.b)		; 92 06
	sta $2289.w,X		; 9D 89 22
	sta ($B5.b)		; 92 B5
	cmp $0249ED.l,X		; DF ED 49 02
	tax		; AA
	dey		; 88
	ldy $AC.b		; A4 AC
	ldx $482A.w		; AE 2A 48
	ora $54.b,X		; 15 54
	eor $25.b		; 45 25
	ror $2E.b,X		; 76 2E
	cmp $0A24.w		; CD 24 0A
	tax		; AA
	jsl $B7BA92.l		; 22 92 BA B7
	plx		; FA
	cmp ($40.b)		; D2 40
	tax		; AA
	ldx #$29.b		; A2 29
	pld		; 2B
	ror $52F1.w,X		; 7E F1 52
	rti		; 40

	tax		; AA
	ldx #$29.b		; A2 29
	pld		; 2B
	wai		; CB
	ldx $483A.w,Y		; BE 3A 48
	ora $54.b,X		; 15 54
	eor $25.b		; 45 25
	ror $F49B.w,X		; 7E 9B F4
	cmp ($40.b)		; D2 40
	tax		; AA
	ldx #$29.b		; A2 29
	pld		; 2B
	inc A		; 1A
	ldy $81.b		; A4 81
	eor $4C.b,X		; 55 4C
	clc		; 18
	lda ($33.b,S),Y		; B3 33
	and ($33.b,S),Y		; 33 33
	and ($63.b),Y		; 31 63
	sta $16.b,S		; 83 16
	jmp ($6133.w)		; 6C 33 61
	txy		; 9B
	tsb $62D8.w		; 0C D8 62
	cmp $65.b		; C5 65
	adc $65.b		; 65 65
	adc $70.b		; 65 70
	jmp $B59A1A.l		; 5C 1A 9A B5
	adc #$F4D9.w		; 69 D9 F4
	jmp ($6DED.w)		; 6C ED 6D
	adc #$CB63.w		; 69 63 CB
	inc $BD.b,X		; F6 BD
	ror $A3EF.w,X		; 7E EF A3
	cmp $64F4.w,X		; DD F4 64
	sta $B7.b,X		; 95 B7
	cmp $B7.b		; C5 B7
	cmp $B7.b		; C5 B7
	cmp $B7.b		; C5 B7
	cpy $09.b		; C4 09
	phy		; 5A
	and $8B16.w		; 2D 16 8B
	mvp $B4,$92		; 44 92 B4
	adc ($68.b),Y		; 71 68
.INDEX 8
	sep #$D1		; E2 D1
	cmp $A3.b		; C5 A3
	dey		; 88
	ora ($B4.b)		; 12 B4
	phx		; DA
	adc $9936.w		; 6D 36 99
	and $69.b		; 25 69
	cld		; D8
	bcs  75.b		; B0 4B
	eor $BBDC.w,X		; 5D DC BB
	sta $49.b,X		; 95 49
	and $048D.w		; 2D 8D 04
	clv		; B8
	ldx $2A2B.w		; AE 2B 2A
	ldy $96.b		; A4 96
	dec $82.b		; C6 82
	eor $B38B.w,X		; 5D 8B B3
	ror $6A.b,X		; 76 6A
	sta ($5B.b)		; 92 5B
	inc A		; 1A
	ora #$6E75.w		; 09 75 6E
	sbc $F8.b		; E5 F8
	rol A		; 2A
	sta ($5B.b)		; 92 5B
	inc A		; 1A
	ora #$BD7E.w		; 09 7E BD
	dec $EAB7.w,X		; DE B7 EA
	sta ($5B.b)		; 92 5B
	inc A		; 1A
	ora #$BE6D.w		; 09 6D BE
	tsa		; 3B
	wai		; CB
	tax		; AA
	eor #$686C.w		; 49 6C 68
	and $8D.b		; 25 8D
	cli		; 58
	cmp $24.b,X		; D5 24
	ldx $34.b,Y		; B6 34
	ora ($62.b)		; 12 62
	cmp $8B.b		; C5 8B
	asl $66.b,X		; 16 66
	bit $D8CC.w		; 2C CC D8
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	eor $647A.w		; 4D 7A 64
	tsx		; BA
	cld		; D8
	rol $1DB6.w		; 2E B6 1D
	jmp ($EA35.w)		; 6C 35 EA
	sta ($70.b)		; 92 70
	lda [$0B.b]		; A7 0B
	sty $52.b		; 84 52
	eor #$A424.w		; 49 24 A4
	sta ($48.b)		; 92 48
	eor ($59.b)		; 52 59
	sbc $73DB.w		; ED DB 73
	sta $C8.b,X		; 95 C8
	ldy $E4.b		; A4 E4
	adc ($B8.b),Y		; 71 B8
	cmp $29C203.l,X		; DF 03 C2 29
	rol A		; 2A
	ldy #$52.b		; A0 52
	ora ($23.b,X)		; 01 23
	asl $66.b,X		; 16 66
	ror $2C.b		; 66 2C
	clc		; 18
	bmi  97.b		; 30 61
	phb		; 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	bmi  96.b		; 30 60
	cpy #$BA.b		; C0 BA
	cld		; D8
	adc $B0.b,X		; 75 B0
	eor $3E6C.w,X		; 5D 6C 3E
	stx $6C.b,Y		; 96 6C
	jsr ($BCBB.w,X)		; FC BB BC
	sta ($85.b,S),Y		; 93 85
.INDEX 16
	rep #$9C		; C2 9C
	rol $44EA.w		; 2E EA 44
	sta ($92.b)		; 92 92
	ora ($49.b)		; 12 49
	bit $89.b		; 24 89
	and $27.b		; 25 27
	lda $DFFAD3.l,X		; BF D3 FA DF
	cmp #$9224.w		; C9 24 92
	adc [$FA.b],Y		; 77 FA
	ora $39E7F5.l,X		; 1F F5 E7 39
	trb $478E.w		; 1C 8E 47
	and [$1E.b]		; 27 1E
	sbc [$22.b],Y		; F7 22
	adc [$35.b],Y		; 77 35
	sed		; F8
	lsr $8517.w,X		; 5E 17 85
	sbc ($78.b,X)		; E1 78
	eor ($64.b)		; 52 64
	brk $09.b		; 00 09
	bit $92.b		; 24 92
	pha		; 48
	bit $94.b		; 24 94
	sta $7DF7CF.l,X		; 9F CF F7 7D
	lda $4992E3.l,X		; BF E3 92 49
	and $FBD7AF.l,X		; 3F AF D7 FB
	asl $D1D7.w,X		; 1E D7 D1
	wai		; CB
	lda $AF.b,X		; B5 AF
	sta $5D0E5F.l		; 8F 5F 0E 5D
	stx $D0C7.w		; 8E C7 D0
	sbc $FA.b,X		; F5 FA
	asl $3BCF.w,X		; 1E CF 3B
	lda ($26.b,S),Y		; B3 26
	lda [$59.b]		; A7 59
	lda ($E4.b,X)		; A1 E4
	bmi  26.b		; 30 1A
	sty $84.b		; 84 84
	pld		; 2B
	phy		; 5A
	tsb $21.b		; 04 21
	ora #$5108.w		; 09 08 51
	cop $10.b		; 02 10
	sbc $1C.b		; E5 1C
	lda $68A3.w		; AD A3 68
	ldy $9DE9.w		; AC E9 9D
	txa		; 8A
	.db $62, $87, $A7		; 62 87 A7
	bne -24.b		; D0 E8
	asl $D39B.w,X		; 1E 9B D3
	sbc $BF.b,X		; F5 BF
	phb		; 8B
	eor [$D6.b],Y		; 57 D6
	cmp $AA.b,X		; D5 AA
	ldx $07FF.w,Y		; BE FF 07
	cmp $BBEFE0.l,X		; DF E0 EF BB
	sbc $CDFBC2.l		; EF C2 FB CD
	adc $B8.b,S		; 63 B8
	cmp ($D3.b)		; D2 D3
	lda $77BF46.l		; AF 46 BF 77
	eor $66AFBB.l,X		; 5F BB AF 66
	ldx $7C0D.w		; AE 0D 7C
	inc A		; 1A
	sbc ($71.b)		; F2 71
	tyx		; BB
	asl $50C3.w		; 0E C3 50
	sta ($48.b)		; 92 48
	trb $00.b		; 14 00
	pha		; 48
	adc ($7D.b,S),Y		; 73 7D
	ror $AD6F.w		; 6E 6F AD
	cmp $B9F5.w		; CD F5 B9
	ldx $37B7.w,Y		; BE B7 37
	sbc [$F3.b]		; E7 F3
	ror $437B.w,X		; 7E 7B 43
	adc ($5E.b,X)		; 61 5E
	lda $DBAF6F.l,X		; BF 6F AF DB
	xba		; EB
	inc $FA.b,X		; F6 FA
	sbc $BFBE.w,X		; FD BE BF
	adc $4DDBAF.l		; 6F AF DB 4D
	sta $7A.b		; 85 7A
	eor $97EE.w,X		; 5D EE 97
	tda		; 7B
	lda $DE.b		; A5 DE
	sbc #$BA77.w		; E9 77 BA
	eor $97EE.w,X		; 5D EE 97
	adc $1536.w,Y		; 79 36 15
	sbc [$3D.b],Y		; F7 3D
	eor $F7D573.l,X		; 5F 73 D5 F7
	and $735F.w,X		; 3D 5F 73
	cmp $D7.b,X		; D5 D7
	phx		; DA
	cmp [$DA.b],Y		; D7 DA
	adc ($B6.b),Y		; 71 B6
	ora ($36.b,S),Y		; 13 36
	pha		; 48
	ldy #$1F03.w		; A0 03 1F
	.db $62, $1F, $62		; 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $4C0A62.l,X		; 1F 62 0A 4C
	brk $00.b		; 00 00
	.db $42, $08		; 42 08
	lda $14.b		; A5 14
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $39CE.w		; 2D CE 39
	and ($46.b),Y		; 31 46
	adc ($4E.b,S),Y		; 73 4E
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $FF025F.l,X		; 7F 5F 02 FF
	brk $57.b		; 00 57
	brk $0A.b		; 00 0A
	jmp $0000.w		; 4C 00 00
	adc $0C.b,S		; 63 0C
	lda $14.b		; A5 14
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $39CE.w		; 2D CE 39
	and ($46.b),Y		; 31 46
	adc ($4E.b,S),Y		; 73 4E
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $FF025F.l,X		; 7F 5F 02 FF
	brk $57.b		; 00 57
	brk $1F.b		; 00 1F
	.db $62, $1F, $62		; 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	asl A		; 0A
	jmp $0000.w		; 4C 00 00
	adc $0C.b,S		; 63 0C
	lda $14.b		; A5 14
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $39CE.w		; 2D CE 39
	and ($46.b),Y		; 31 46
	adc ($4E.b,S),Y		; 73 4E
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $FF025F.l,X		; 7F 5F 02 FF
	brk $57.b		; 00 57
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0AFFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0AFFFF. Skipping.
.ENDS
