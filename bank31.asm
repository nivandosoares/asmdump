.BANK 31 SLOT 0
.ORG $0000

.SECTION "Bank31" FORCE

	bvs   0.b		; 70 00
	brk $08.b		; 00 08
	clv		; B8
	ora ($00.b,X)		; 01 00
	ora [$B8.b]		; 07 B8
	cop $00.b		; 02 00
	ora ($E8.b,X)		; 01 E8
	cop $00.b		; 02 00
	phb		; 8B
	iny		; C8
	php		; 08
	brk $89.b		; 00 89
	tya		; 98
	ora $8900.w		; 0D 00 89
	pla		; 68
	ora ($00.b)		; 12 00
	txa		; 8A
	cpy #$17.b		; C0 17
	brk $8C.b		; 00 8C
	plp		; 28
	asl $8D00.w,X		; 1E 00 8D
	clc		; 18
	and $00.b		; 25 00
	phb		; 8B
	sed		; F8
	rol A		; 2A
	brk $89.b		; 00 89
	iny		; C8
	and $408E00.l		; 2F 00 8E 40
	and [$00.b],Y		; 37 00
	.db $82, $58, $38		; 82 58 38
	brk $82.b		; 00 82
	bvs  57.b		; 70 39
	brk $82.b		; 00 82
	dey		; 88
	dec A		; 3A
	brk $82.b		; 00 82
	ldy #$3B.b		; A0 3B
	brk $82.b		; 00 82
	clv		; B8
	bit $8200.w,X		; 3C 00 82
	bne  61.b		; D0 3D
	brk $82.b		; 00 82
	inx		; E8
	rol $8D00.w,X		; 3E 00 8D
	cld		; D8
	eor $00.b		; 45 00
	sta $78.b,S		; 83 78
	eor [$00.b]		; 47 00
	sta $28.b		; 85 28
	lsr A		; 4A
	brk $86.b		; 00 86
	rts		; 60

	eor $8600.w		; 4D 00 86
	tya		; 98
	bvc   0.b		; 50 00
	sta $48.b		; 85 48
	eor ($00.b,S),Y		; 53 00
	sty $70.b		; 84 70
	eor $00.b,X		; 55 00
	sty $98.b		; 84 98
	eor [$00.b],Y		; 57 00
	sta ($08.b,X)		; 81 08
	brk $08.b		; 00 08
	brk $E6.b		; 00 E6
	sbc ($BE.b)		; F2 BE
	sbc $BEFFE6.l		; EF E6 FF BE
	sbc $000600.l,X		; FF 00 06 00
	brk $EE.b		; 00 EE
	sbc $01FFBE.l,X		; FF BE FF 01
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $02FFC6.l,X		; FF C6 FF 02
	asl $00.b		; 06 00
	brk $EF.b		; 00 EF
	sbc $03FFCE.l,X		; FF CE FF 03
	asl $00.b		; 06 00
	brk $EA.b		; 00 EA
	sbc $04FFD6.l,X		; FF D6 FF 04
	asl $00.b		; 06 00
	brk $E7.b		; 00 E7
	sbc $05FFDE.l,X		; FF DE FF 05
	asl $00.b		; 06 00
	brk $E7.b		; 00 E7
	sbc $06FFE6.l,X		; FF E6 FF 06
	asl $00.b		; 06 00
	brk $E9.b		; 00 E9
	sbc $07FFEE.l,X		; FF EE FF 07
	asl $00.b		; 06 00
	brk $08.b		; 00 08
	inx		; E8
	trb $1EC0.w		; 1C C0 1E
	cpy #$1F.b		; C0 1F
	cpy #$0F.b		; C0 0F
	cpy #$03.b		; C0 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	clc		; 18
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	bra  96.b		; 80 60
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl 112.b		; 10 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	brk $A0.b		; 00 A0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	ora $000E00.l		; 0F 00 0E 00
	tsb $00.b		; 04 00
	trb $1800.w		; 1C 00 18
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	clc		; 18
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	sei		; 78
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $06.b		; 00 06
	brk $E6.b		; 00 E6
	sbc ($C4.b)		; F2 C4
	sbc $C4FFE6.l		; EF E6 FF C4
	sbc $000600.l,X		; FF 00 06 00
	brk $E6.b		; 00 E6
	sbc $01FFCC.l,X		; FF CC FF 01
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $02FFE8.l,X		; FF E8 FF 02
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $03FFE0.l,X		; FF E0 FF 03
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $03FFD8.l,X		; FF D8 FF 03
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $04FFD0.l,X		; FF D0 FF 04
	asl $00.b		; 06 00
	brk $EE.b		; 00 EE
	sbc $05FFC8.l,X		; FF C8 FF 05
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C0.b		; C0 C0
	beq  96.b		; F0 60
	sei		; 78
	cpx #$F8.b		; E0 F8
	bvc -36.b		; 50 DC
	and ($F8.b)		; 32 F8
	stz $80F8.w,X		; 9E F8 80
	rti		; 40

	cpy #$20.b		; C0 20
	bmi   8.b		; 30 08
	clc		; 18
	brk $18.b		; 00 18
	tsb $8C.b		; 04 8C
	brk $C8.b		; 00 C8
	tsb $60.b		; 04 60
	brk $47.b		; 00 47
	bvs  35.b		; 70 23
	sec		; 38
	ora ($1C.b,S),Y		; 13 1C
	ora #$090C.w		; 09 0C 09
	tsb $0808.w		; 0C 08 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	clc		; 18
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $50.b		; 00 50
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cpx #$E4.b		; E0 E4
	lda $B6.b,X		; B5 B6
	cpx #$FF.b		; E0 FF
	lda $FF.b,X		; B5 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	sed		; F8
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
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
	brk $F2.b		; 00 F2
	asl $FFAE.w		; 0E AE FF
	sbc [$FF.b],Y		; F7 FF
	ldx $00FF.w		; AE FF 00
	tsb $0000.w		; 0C 00 00
	ora [$00.b]		; 07 00
	ldx $02FF.w		; AE FF 02
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b)		; F2 FF
	ldx $04FF.w,Y		; BE FF 04
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	ldx $06FF.w,Y		; BE FF 06
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b)		; F2 FF
	dec $08FF.w		; CE FF 08
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	dec $0AFF.w		; CE FF 0A
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $0CFFDE.l,X		; FF DE FF 0C
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $DE.b		; 00 DE
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F7.b		; 00 F7
	sbc $20FFEE.l,X		; FF EE FF 20
	tsb $0000.w		; 0C 00 00
	ora [$00.b]		; 07 00
	inc $22FF.w		; EE FF 22
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	inc $24FF.w,X		; FE FF 24
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	tsb $04.b		; 04 04
	ora $03.b,S		; 03 03
	tsb $07.b		; 04 07
	brk $04.b		; 00 04
	ora ($04.b,X)		; 01 04
	tsb $01.b		; 04 01
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	tsb $07.b		; 04 07
	brk $07.b		; 00 07
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	asl $00.b		; 06 00
	cpx #$E0.b		; E0 E0
	sed		; F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FC04.w,X)		; FC 04 FC
	sty $E4.b,X		; 94 E4
	stz $D0E4.w		; 9C E4 D0
	bit $00.b		; 24 00
	cpx #$00.b		; E0 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	sed		; F8
	tsb $F8.b		; 04 F8
	tsb $4C.b		; 04 4C
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $0C0D04.l		; 0F 04 0D 0C
	ora $1B0A.w,X		; 1D 0A 1B
	ora ($33.b)		; 12 33
	bpl  51.b		; 10 33
	clc		; 18
	and ($28.b)		; 32 28
	.db $62, $00, $0F		; 62 00 0F
	cop $0F.b		; 02 0F
	cop $1F.b		; 02 1F
	tsb $1F.b		; 04 1F
	tsb $0C3F.w		; 0C 3F 0C
	and $1D3F0D.l,X		; 3F 0D 3F 1D
	adc $600F00.l,X		; 7F 00 0F 60
	cop $58.b		; 02 58
	jsl $683248.l		; 22 48 32 68
	ora ($68.b)		; 12 68
	ora ($78.b)		; 12 78
	cop $F8.b		; 02 F8
	cop $F0.b		; 02 F0
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $00FFFD.l,X		; FF FD FF 00
	sty $22.b,X		; 94 22
	trb $D2.b		; 14 D2
	bit $D2.b		; 24 D2
	bit $F1.b		; 24 F1
	stz $99.b,X		; 74 99
	ldx $76F1.w		; AE F1 76
	beq   2.b		; F0 02
	tda		; 7B
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $8BFFFB.l,X		; FF FB FF 8B
	sbc $89DF01.l,X		; FF 01 DF 89
	sbc $00FFFD.l,X		; FF FD FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpx #$80.b		; E0 80
	rts		; 60

	bra  32.b		; 80 20
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra -32.b		; 80 E0
	cpy #$E0.b		; C0 E0
	bvc -35.b		; 50 DD
	bmi -34.b		; 30 DE
	jsr $30EC.w		; 20 EC 30
	adc $7E10.w		; 6D 10 7E
	bpl 124.b		; 10 7C
	brk $3C.b		; 00 3C
	plp		; 28
	bit $FF22.w		; 2C 22 FF
	and ($FF.b,X)		; 21 FF
	ora ($FF.b,S),Y		; 13 FF
	ora ($7F.b)		; 12 7F
	ora ($7F.b,X)		; 01 7F
	ora $7F.b,S		; 03 7F
	ora $3F.b,S		; 03 3F
	ora ($07.b,S),Y		; 13 07
	brk $A2.b		; 00 A2
	brk $22.b		; 00 22
	brk $E2.b		; 00 E2
	php		; 08
	.db $82, $28, $02		; 82 28 02
	sei		; 78
	cop $28.b		; 02 28
	cop $20.b		; 02 20
	cop $5D.b		; 02 5D
	sbc $1DFFDD.l,X		; FF DD FF 1D
	sbc $FDFF7D.l,X		; FF 7D FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $00FFFD.l,X		; FF FD FF 00
	eor $014F01.l		; 4F 01 4F 01
	jmp ($0E81.w,X)		; 7C 81 0E
	lda ($0F.b,X)		; A1 0F
	rtl		; 6B

	ora $5C005E.l		; 0F 5E 00 5C
	tsb $B0.b		; 04 B0
	sbc $81FFB0.l,X		; FF B0 FF 81
	sbc $FFF1.w,X		; FD F1 FF
	beq  -2.b		; F0 FE
	beq  -4.b		; F0 FC
	sbc $E0FFE0.l,X		; FF E0 FF E0
	rts		; 60

	bpl -32.b		; 10 E0
	bpl -96.b		; 10 A0
	bvc   0.b		; 50 00
	cpx #$40.b		; E0 40
	ldy #$80.b		; A0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	bra -32.b		; 80 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -64.b		; F0 C0
	cpx #$C0.b		; E0 C0
	cpx #$00.b		; E0 00
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bmi -128.b		; 30 80
	bmi -128.b		; 30 80
	bmi -128.b		; 30 80
	bmi -128.b		; 30 80
	bpl -128.b		; 10 80
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $7F3FFF.l,X		; 7F FF 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $E3.b		; 00 E3
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($02.b,X)		; 01 02
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	trb $64FF.w		; 1C FF 64
	jsr $64A4.w		; 20 A4 64
	bvs 112.b		; 70 70
	inx		; E8
	cpx #$C0.b		; E0 C0
	php		; 08
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	cpx #$18.b		; E0 18
	cld		; D8
	tsb $D8.b		; 04 D8
	brk $88.b		; 00 88
	brk $18.b		; 00 18
	brk $F0.b		; 00 F0
	php		; 08
	cpx #$1C.b		; E0 1C
	cpx #$1F.b		; E0 1F
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	sec		; 38
	.db $62, $3C, $6E		; 62 3C 6E
	sec		; 38
	ror $6C28.w		; 6E 28 6C
	clc		; 18
	jmp ($7C20.w,X)		; 7C 20 7C
	sec		; 38
	jsr ($FC78.w,X)		; FC 78 FC
	ora $117F.w,X		; 1D 7F 11
	adc $137F11.l,X		; 7F 11 7F 13
	adc $037F03.l,X		; 7F 03 7F 03
	adc $03FF03.l,X		; 7F 03 FF 03
	sbc $D802F8.l,X		; FF F8 02 D8
	cop $D8.b		; 02 D8
	cop $88.b		; 02 88
	cop $80.b		; 02 80
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
.ACCU 8
.INDEX 8
	sep #$FD		; E2 FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $70FF1D.l,X		; FF 1D FF 70
	cop $B8.b		; 02 B8
	cop $98.b		; 02 98
	ora $88.b,S		; 03 88
	ora $88.b,S		; 03 88
	ora $08.b,S		; 03 08
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	adc ($FD.b,S),Y		; 73 FD
	sbc $FCFFFD.l,X		; FF FD FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $80FF8C.l,X		; FF 8C FF 80
	bmi -64.b		; 30 C0
	bmi -32.b		; 30 E0
	bcs -32.b		; B0 E0
	sed		; F8
	cpx #$F8.b		; E0 F8
	brk $F8.b		; 00 F8
	bne -40.b		; D0 D8
	bcs -104.b		; B0 98
	cpy #$F0.b		; C0 F0
	cpy #$F0.b		; C0 F0
	rti		; 40

	beq   0.b		; F0 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	jsr $60F8.w		; 20 F8 60
	sed		; F8
	php		; 08
	tsb $38.b		; 04 38
	tsb $70.b		; 04 70
	tsb $40.b		; 04 40
	asl $00.b		; 06 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $3B.b		; 02 3B
	ora [$3B.b]		; 07 3B
	ora [$73.b]		; 07 73
	ora [$41.b]		; 07 41
	ora [$01.b]		; 07 01
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $80.b		; 02 80
	cop $C0.b		; 02 C0
	ora $C0.b,S		; 03 C0
	asl $02C0.w		; 0E C0 02
	cpy #$02.b		; C0 02
	sbc $FDFF.w,X		; FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $F1FFFC.l,X		; FF FC FF F1
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $400D03.l,X		; FF 03 0D 40
	ora $0740.w		; 0D 40 07
	mvp $44,$07		; 44 07 44
	ora [$40.b]		; 07 40
	ora $40.b,S		; 03 40
	ora $40.b,S		; 03 40
	ora $F6.b,S		; 03 F6
	sed		; F8
	sbc ($FC.b)		; F2 FC
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FFFC.l,X		; FF FC FF 00
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
	brk $10.b		; 00 10
	rti		; 40

	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	clc		; 18
	bra  24.b		; 80 18
	bra  24.b		; 80 18
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	jsr $200C.w		; 20 0C 20
	tsb $0420.w		; 0C 20 04
	jsr $2004.w		; 20 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	lda $FFBFFF.l,X		; BF FF BF FF
	lda $FFBFFF.l,X		; BF FF BF FF
	lda $FFBFFF.l,X		; BF FF BF FF
	lda $FFBFFF.l,X		; BF FF BF FF
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
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
	jmp ($0082.w,X)		; 7C 82 00
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
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
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	brk $3F.b		; 00 3F
	ror $7801.w,X		; 7E 01 78
	sta [$00.b]		; 87 00
	sbc $1F0000.l,X		; FF 00 00 1F
	and $1F3F1F.l,X		; 3F 1F 3F 1F
	and $003F00.l,X		; 3F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $040000.l,X		; FF 00 00 04
	rti		; 40

	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $E0.b		; 04 E0
	brk $3F.b		; 00 3F
	ora $FFBF20.l,X		; 1F 20 BF FF
	lda $FFBFFF.l,X		; BF FF BF FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	ora $3F00FF.l,X		; 1F FF 00 3F
	brk $3F.b		; 00 3F
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	sbc ($0E.b,S),Y		; F3 0E
	ldy $FF.b,X		; B4 FF
	sbc $FF.b,X		; F5 FF
	ldy $FF.b,X		; B4 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ldy $FF.b,X		; B4 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpy $FF.b		; C4 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cpy $FF.b		; C4 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	pei ($FF.b)		; D4 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	pei ($FF.b)		; D4 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc $E4FF.w,Y		; F9 FF E4
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $F7.b		; 00 F7
	sbc $0EFFF4.l,X		; FF F4 FF 0E
	tsb $0000.w		; 0C 00 00
	ora [$00.b]		; 07 00
	pea $20FF.w		; F4 FF 20
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sec		; 38
	sec		; 38
	inc $FFFE.w,X		; FE FE FF
	sta $FECFFE.l,X		; 9F FE CF FE
	sbc $7FFF39.l,X		; FF 39 FF 7F
	adc $00BFBF.l,X		; 7F BF BF 00
	sec		; 38
	brk $FE.b		; 00 FE
	rts		; 60

	sbc $00FF30.l,X		; FF 30 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	inc $7C40.w,X		; FE 40 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $29.b		; 00 29
	ora $38.b,S		; 03 38
	ora $30.b,S		; 03 30
	ora $50.b,S		; 03 50
	ora $50.b,S		; 03 50
	ora $50.b,S		; 03 50
	ora $48.b,S		; 03 48
	cop $D8.b		; 02 D8
	ora [$3F.b],Y		; 17 3F
	ora [$3F.b]		; 07 3F
	ora $7F2F3F.l		; 0F 3F 2F 7F
	and $7F2F7F.l		; 2F 7F 2F 7F
	and [$7F.b],Y		; 37 7F
	and [$FF.b]		; 27 FF
	jsr $2084.w		; 20 84 20
	sty $70.b		; 84 70
	sty $F1.b		; 84 F1
	ora $F1.b		; 05 F1
	tsb $F1.b		; 04 F1
	tsb $B1.b		; 04 B1
	tsb $B1.b		; 04 B1
	tsb $FB.b		; 04 FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFA.l,X		; FF FA FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $D4FFFB.l,X		; FF FB FF D4
	ora #$D3.b		; 09 D3
	ora #$F3.b		; 09 F3
	sbc $5C13.w		; ED 13 5C
	ora ($04.b),Y		; 11 04
	sbc ($04.b),Y		; F1 04
	sbc ($07.b),Y		; F1 07
	cmp ($07.b),Y		; D1 07
	inc $FF.b,X		; F6 FF
	inc $FF.b,X		; F6 FF
	ora ($FF.b)		; 12 FF
	ora $BF.b,S		; 03 BF
	xce		; FB
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $60.b		; 00 60
	cpy #$60.b		; C0 60
	cpy #$F0.b		; C0 F0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	brk $F0.b		; 00 F0
	brk $88.b		; 00 88
	adc ($88.b),Y		; 71 88
	adc ($F8.b),Y		; 71 F8
	brk $08.b		; 00 08
	ora ($08.b,X)		; 01 08
	ora ($0C.b,X)		; 01 0C
	ora ($04.b,X)		; 01 04
	ora ($04.b,X)		; 01 04
	adc [$FF.b],Y		; 77 FF
	adc [$8F.b],Y		; 77 8F
	ora [$8F.b]		; 07 8F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora $0F.b,S		; 03 0F
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	bra   4.b		; 80 04
	cpy #$04.b		; C0 04
	bra   4.b		; 80 04
	bra   4.b		; 80 04
	bra   4.b		; 80 04
	bra   4.b		; 80 04
	brk $06.b		; 00 06
	brk $0C.b		; 00 0C
	xce		; FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $F9FFFB.l,X		; FF FB FF F9
	sbc $02FFF3.l,X		; FF F3 FF 02
	ora $060939.l,X		; 1F 39 09 06
	tas		; 1B
	brk $1A.b		; 00 1A
	brk $0E.b		; 00 0E
	dey		; 88
	asl $0E88.w		; 0E 88 0E
	bra   6.b		; 80 06
	sbc ($FD.b,X)		; E1 FD
	inc $ECC0.w,X		; FE C0 EC
	beq -28.b		; F0 E4
	sed		; F8
	beq  -2.b		; F0 FE
	beq  -2.b		; F0 FE
	beq  -2.b		; F0 FE
	sed		; F8
	inc $4080.w,X		; FE 80 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2081.w		; 20 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($7E.b,X)		; 81 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $00FF7E.l,X		; FF 7E FF 00
	and ($20.b,X)		; 21 20
	ora ($00.b,X)		; 01 00
	and ($00.b,X)		; 21 00
	and ($48.b,X)		; 21 48
	and ($08.b),Y		; 31 08
	and ($10.b,X)		; 21 10
	and #$38.b		; 29 38
	ora ($FE.b,X)		; 01 FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $0CFFFE.l,X		; FF FE FF 0C
	jsr $200C.w		; 20 0C 20
	tsb $0C20.w		; 0C 20 0C
	jsr $200C.w		; 20 0C 20
	brk $3F.b		; 00 3F
	ror $7801.w,X		; 7E 01 78
	sta [$1F.b]		; 87 1F
	and $1F3F1F.l,X		; 3F 1F 3F 1F
	and $1F3F1F.l,X		; 3F 1F 3F 1F
	and $003F00.l,X		; 3F 00 3F 00
	adc $04FF00.l,X		; 7F 00 FF 04
	rti		; 40

	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $E0.b		; 04 E0
	lda $FFBFFF.l,X		; BF FF BF FF
	lda $FFBFFF.l,X		; BF FF BF FF
	lda $FF3FFF.l,X		; BF FF 3F FF
	and $FF1FFF.l,X		; 3F FF 1F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	cop $78.b		; 02 78
	brk $FF.b		; 00 FF
	brk $90.b		; 00 90
	brk $B4.b		; 00 B4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	ora [$7F.b]		; 07 7F
	brk $FF.b		; 00 FF
	adc $FF4FFF.l		; 6F FF 4F FF
	dec $DC4E.w		; CE 4E DC
	trb $9360.w		; 1C 60 93
	sec		; 38
	cmp [$00.b]		; C7 00
	inc $FF00.w,X		; FE 00 FF
	brk $38.b		; 00 38
	ora ($10.b,X)		; 01 10
	bcs   0.b		; B0 00
	sep #$00		; E2 00
	jmp ($7C83.w)		; 6C 83 7C
	sta $7D.b,S		; 83 7D
	sta $38.b,S		; 83 38
	cmp [$C7.b]		; C7 C7
	sbc $00FFEF.l,X		; FF EF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sec		; 38
	brk $FC.b		; 00 FC
	bpl  36.b		; 10 24
	bvc  38.b		; 50 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$F8.b		; C0 F8
	brk $FC.b		; 00 FC
	cld		; D8
	jsr ($FED8.w,X)		; FC D8 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $88.b		; 02 88
	brk $88.b		; 00 88
	brk $88.b		; 00 88
	brk $8E.b		; 00 8E
	brk $89.b		; 00 89
	brk $8C.b		; 00 8C
	brk $8B.b		; 00 8B
	brk $88.b		; 00 88
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc ($FF.b),Y		; 71 FF
	ror $FF.b,X		; 76 FF
	adc ($FF.b,S),Y		; 73 FF
	stz $FF.b,X		; 74 FF
	adc [$FF.b],Y		; 77 FF
	sta ($04.b),Y		; 91 04
	ora ($04.b),Y		; 11 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $C4.b		; 00 C4
	brk $44.b		; 00 44
	brk $84.b		; 00 84
	brk $04.b		; 00 04
	xce		; FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $3BFFFB.l,X		; FF FB FF 3B
	sbc $7BFFBB.l,X		; FF BB FF 7B
	sbc $F1FFFB.l,X		; FF FB FF F1
	ora [$50.b]		; 07 50
	ora [$41.b]		; 07 41
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	inc $9E03.w,X		; FE 03 9E
	ora $78.b,S		; 03 78
	cop $1D.b		; 02 1D
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $01FFF8.l,X		; FF F8 FF 01
	sbc $83FF61.l,X		; FF 61 FF 83
	xce		; FB
	sbc $FF.b,S		; E3 FF
	cpy #$F0.b		; C0 F0
	brk $F0.b		; 00 F0
	ldy #$B0.b		; A0 B0
	rts		; 60

	bmi -64.b		; 30 C0
	jsr $20C0.w		; 20 C0 20
	rti		; 40

	ldy #$00.b		; A0 00
	cpy #$00.b		; C0 00
	beq   0.b		; F0 00
	beq  64.b		; F0 40
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$80.b		; E0 80
	cpy #$01.b		; C0 01
	tsb $01.b		; 04 01
	tsb $01.b		; 04 01
	tsb $01.b		; 04 01
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	cop $03.b		; 02 03
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$01.b]		; 07 01
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $FB.b		; 04 FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $80FFFB.l,X		; FF FB FF 80
	asl $80.b		; 06 80
	asl $80.b		; 06 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $80.b		; 04 80
	tsb $F8.b		; 04 F8
	inc $FEF8.w,X		; FE F8 FE
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $3081.w		; 20 81 30
	sta ($10.b,X)		; 81 10
	sta ($10.b,X)		; 81 10
	sta ($30.b,X)		; 81 30
	sta ($30.b,X)		; 81 30
	sta ($30.b,X)		; 81 30
	sta ($30.b,X)		; 81 30
	sta ($7E.b,X)		; 81 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $10FF7E.l,X		; FF 7E FF 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($FE.b,X)		; 01 FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	brk $04.b		; 00 04
	tsa		; 3B
	ora $201F20.l,X		; 1F 20 1F 20
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $3F.b		; 04 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	sbc ($0B.b)		; F2 0B
	tyx		; BB
	sbc $F0FFF7.l,X		; FF F7 FF F0
	sbc $000C00.l,X		; FF 00 0C 00
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	sbc $000C02.l,X		; FF 02 0C 00
	brk $F6.b		; 00 F6
	sbc $04FFE0.l,X		; FF E0 FF 04
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	cpx #$FF.b		; E0 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	bne  -1.b		; D0 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	bne  -1.b		; D0 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpy #$FF.b		; C0 FF
	tsb $000C.w		; 0C 0C 00
	brk $03.b		; 00 03
	brk $C0.b		; 00 C0
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $FB.b		; 00 FB
	sbc $20FFB0.l,X		; FF B0 FF 20
	tsb $0000.w		; 0C 00 00
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $30.b		; 00 30
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	and $7F2F7F.l		; 2F 7F 2F 7F
	and $7F2F7F.l		; 2F 7F 2F 7F
	ora $3F173F.l		; 0F 3F 17 3F
	ora [$3F.b],Y		; 17 3F
	ora [$3F.b],Y		; 17 3F
	cop $C6.b		; 02 C6
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E5.b		; 00 E5
	and $1BFF.w,Y		; 39 FF 1B
	sbc $1BFF1B.l,X		; FF 1B FF 1B
	sbc $1BFF1B.l,X		; FF 1B FF 1B
	sbc $1AFF1B.l,X		; FF 1B FF 1A
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	tas		; 1B
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	brk $51.b		; 00 51
	cpx $1F.b		; E4 1F
	rol $2E7F.w		; 2E 7F 2E
	adc $2E7F2E.l,X		; 7F 2E 7F 2E
	adc $2E7F2E.l,X		; 7F 2E 7F 2E
	adc $007F2E.l,X		; 7F 2E 7F 00
	inc $00.b		; E6 00
	inc $00.b		; E6 00
	inc $00.b		; E6 00
	sep #$00		; E2 00
	sep #$00		; E2 00
	ldx #$02.b		; A2 02
	ldy #$04.b		; A0 04
	lda ($19.b)		; B2 19
	sbc $19FF19.l,X		; FF 19 FF 19
	sbc $1DFF1D.l,X		; FF 1D FF 1D
	sbc $1FBF1D.l,X		; FF 1D BF 1F
	lda $18BF0F.l,X		; BF 0F BF 18
	ldy #$10.b		; A0 10
	cpx #$00.b		; E0 00
	ldy #$00.b		; A0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	cli		; 58
	cpx #$10.b		; E0 10
	cpx #$40.b		; E0 40
	cpx #$00.b		; E0 00
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
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
	brk $01.b		; 00 01
	eor $FF00.w,X		; 5D 00 FF
	brk $4E.b		; 00 4E
	brk $7E.b		; 00 7E
	brk $66.b		; 00 66
	brk $5F.b		; 00 5F
	brk $47.b		; 00 47
	brk $57.b		; 00 57
	jsl $FF007F.l		; 22 7F 00 FF
	and ($7F.b),Y		; 31 7F
	ora ($7F.b,X)		; 01 7F
	ora $207F.w,Y		; 19 7F 20
	adc $287F38.l,X		; 7F 38 7F 28
	adc $E00400.l,X		; 7F 00 04 E0
	cpx $00.b		; E4 00
	tsb $03.b		; 04 03
	and $070400.l,X		; 3F 00 04 07
	sbc [$00.b]		; E7 00
	pea $2400.w		; F4 00 24
	xce		; FB
	sbc $FBFF1B.l,X		; FF 1B FF FB
	sbc $FBFFC0.l,X		; FF C0 FF FB
	sbc $0BFF18.l,X		; FF 18 FF 0B
	sbc $00FFDB.l,X		; FF DB FF 00
	ora $1C.b,S		; 03 1C
	asl $7F60.w,X		; 1E 60 7F
	brk $06.b		; 00 06
	beq  -1.b		; F0 FF
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	jsr ($E1FF.w,X)		; FC FF E1
	sbc $F9FF80.l,X		; FF 80 FF F9
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0FF80.l,X		; FF 80 FF E0
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $265920.l,X		; 1F 20 59 26
	.db $42, $11		; 42 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $7F5F3F.l,X		; 1F 3F 5F 7F
	ror $787F.w		; 6E 7F 78
	eor $DFBFBF.l		; 4F BF BF DF
	eor $663741.l,X		; 5F 41 37 66
	stx $34.b		; 86 34
	ora $039C.w,X		; 1D 9C 03
	brk $FF.b		; 00 FF
	bcs  -1.b		; B0 FF
	rti		; 40

	adc $483EA0.l,X		; 7F A0 3E 48
	brk $79.b		; 00 79
	bra -30.b		; 80 E2
	cmp ($FC.b,X)		; C1 FC
	sbc $00.b,S		; E3 00
	sbc $808080.l,X		; FF 80 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sed		; F8
	php		; 08
	.db $82, $1C, $03		; 82 1C 03
	sec		; 38
	cmp $00.b		; C5 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	jmp ($FCFE.w,X)		; 7C FE FC
	sbc $00FF3A.l,X		; FF 3A FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	brk $3F.b		; 00 3F
	rol $7841.w,X		; 3E 41 78
	sta [$00.b]		; 87 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	and $003F00.l,X		; 3F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	and $1F201F.l,X		; 3F 1F 20 1F
	jsr $1F00.w		; 20 00 1F
	inc A		; 1A
	sbc $1AFF1A.l,X		; FF 1A FF 1A
	sbc $00FF1A.l,X		; FF 1A FF 00
	and $003F00.l,X		; 3F 00 3F 00
	and $001F00.l,X		; 3F 00 1F 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor ($00.b),Y		; 51 00
	eor ($00.b),Y		; 51 00
	and ($00.b)		; 32 00
	rol $00.b,X		; 36 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	plp		; 28
	brk $28.b		; 00 28
	rol $2E7F.w		; 2E 7F 2E
	adc $093F0D.l,X		; 7F 0D 3F 09
	and $0F3F0F.l,X		; 3F 0F 3F 0F
	and $173F17.l,X		; 3F 17 3F 17
	and $05B700.l,X		; 3F 00 B7 05
	lda ($05.b)		; B2 05
	tsx		; BA
	brk $A8.b		; 00 A8
	php		; 08
	lda $056F0D.l		; AF 0D 6F 05
	adc [$05.b]		; 67 05
	adc [$0F.b]		; 67 0F
	lda $07BF0F.l,X		; BF 0F BF 07
	lda $10BF17.l,X		; BF 17 BF 10
	lda $98FF90.l,X		; BF 90 FF 98
	sbc $00FF98.l,X		; FF 98 FF 00
	rts		; 60

	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	bra -96.b		; 80 A0
	bra -96.b		; 80 A0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	bra -32.b		; 80 E0
	bra -64.b		; 80 C0
	rti		; 40

	cpx #$40.b		; E0 40
	cpx #$40.b		; E0 40
	cpx #$40.b		; E0 40
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
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
	and [$00.b]		; 27 00
	and [$00.b]		; 27 00
	and ($00.b,S),Y		; 33 00
	ora ($00.b,S),Y		; 13 00
	ora ($06.b,S),Y		; 13 06
	ora ($0F.b),Y		; 11 0F
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	and $0C3F18.l,X		; 3F 18 3F 0C
	and $0C1F0C.l,X		; 3F 0C 1F 0C
	ora $0F190E.l,X		; 1F 0E 19 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $000500.l,X		; FF 00 05 00
	sbc $001F00.l,X		; FF 00 1F 00
	ora $008E00.l,X		; 1F 00 8E 00
	ldx $8C00.w,Y		; BE 00 8C
	brk $FF.b		; 00 FF
	plx		; FA
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $71FFE0.l,X		; FF E0 FF 71
	sbc $73FF41.l,X		; FF 41 FF 73
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$00.b],Y		; 17 00
	adc $00FF00.l,X		; 7F 00 FF 00
	ora $001700.l,X		; 1F 00 17 00
	and $00EE01.l,X		; 3F 01 EE 00
	sbc $80FFE8.l,X		; FF E8 FF 80
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $C0FFE8.l,X		; FF E8 FF C0
	sbc $00FE11.l,X		; FF 11 FE 00
	rti		; 40

	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	rti		; 40

	ora $43106F.l,X		; 1F 6F 10 43
	bpl  64.b		; 10 40
	bcc   7.b		; 90 07
	bcc   0.b		; 90 00
	bcc   4.b		; 90 04
	stz $9800.w		; 9C 00 98
	adc ($7F.b,X)		; 61 7F
	adc $7F6F7F.l		; 6F 7F 6F 7F
	adc $FF6FFF.l		; 6F FF 6F FF
	adc $FF63FF.l		; 6F FF 63 FF
	adc [$FF.b]		; 67 FF
	and [$C8.b],Y		; 37 C8
	ora $EA.b,X		; 15 EA
	sbc [$08.b],Y		; F7 08
	and ($08.b)		; 32 08
	cmp ($09.b,X)		; C1 09
	cop $0A.b		; 02 0A
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	inc $FF.b,X		; F6 FF
	pea $F7FF.w		; F4 FF F7
	sbc $80FFF7.l,X		; FF F7 FF 80
	adc $0560.w,X		; 7D 60 05
	beq   5.b		; F0 05
	brk $05.b		; 00 05
	cpy #$C5.b		; C0 C5
	jsr $00A5.w		; 20 A5 00
	ora $08.b		; 05 08
	ora $FF82.w		; 0D 82 FF
	plx		; FA
	sbc $FAFFFA.l,X		; FF FA FF FA
	sbc $1AFF3A.l,X		; FF 3A FF 1A
	adc $F2FFFA.l,X		; 7F FA FF F2
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $7F78.w		; 1C 78 7F
	jsr ($7CFF.w,X)		; FC FF 7C
	lda $009F7C.l,X		; BF 7C 9F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $7F00.w		; 1C 00 7F
	brk $FF.b		; 00 FF
	rti		; 40

	sbc $00FF60.l,X		; FF 60 FF 00
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
	bra  10.b		; 80 0A
	bra  40.b		; 80 28
	brk $E9.b		; 00 E9
	asl $FFB1.w		; 0E B1 FF
	sbc [$FF.b],Y		; F7 FF
	beq  -1.b		; F0 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	beq  -1.b		; F0 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sed		; F8
	sbc $04FFE0.l,X		; FF E0 FF 04
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $E0.b		; 00 E0
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F8.b		; 00 F8
	sbc $08FFD0.l,X		; FF D0 FF 08
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $D0.b		; 00 D0
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $E9.b		; 00 E9
	sbc $0CFFC0.l,X		; FF C0 FF 0C
	tsb $0000.w		; 0C 00 00
	sbc $C0FF.w,Y		; F9 FF C0
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $09.b		; 00 09
	brk $C0.b		; 00 C0
	sbc $000C20.l,X		; FF 20 0C 00
	brk $F8.b		; 00 F8
	sbc $22FFB0.l,X		; FF B0 FF 22
	tsb $0000.w		; 0C 00 00
	php		; 08
	jsr $2008.w		; 20 08 20
	php		; 08
	jsr $2008.w		; 20 08 20
	php		; 08
	jsr $2008.w		; 20 08 20
	php		; 08
	jsr $2008.w		; 20 08 20
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	tsb $C0.b		; 04 C0
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
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
	jsr $1080.w		; 20 80 10
	sta ($10.b,X)		; 81 10
	sta ($10.b,X)		; 81 10
	sta ($10.b,X)		; 81 10
	eor ($10.b,X)		; 41 10
	eor ($10.b,X)		; 41 10
	eor ($10.b,X)		; 41 10
	eor ($7F.b,X)		; 41 7F
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $3EFF7E.l,X		; FF 7E FF 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	adc $107F3E.l,X		; 7F 3E 7F 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  24.b		; 80 18
	bra   8.b		; 80 08
	bcc  12.b		; 90 0C
	bcc 127.b		; 90 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx #$00.b		; A2 00
	rep #$00		; C2 00
	.db $82, $00, $82		; 82 00 82
	jsr $2082.w		; 20 82 20
	.db $82, $20, $81		; 82 20 81
	jsr $5D81.w		; 20 81 5D
	sbc $7DFF3D.l,X		; FF 3D FF 7D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $7EFF7D.l,X		; FF 7D FF 7E
	sbc $00FF7E.l,X		; FF 7E FF 00
	ora ($00.b,S),Y		; 13 00
	ora $000300.l		; 0F 00 03 00
	ora $82.b,S		; 03 82
	ora $87.b,S		; 03 87
	brk $87.b		; 00 87
	ora ($C0.b,X)		; 01 C0
	ora $EC.b,S		; 03 EC
	sbc $FCFFF0.l,X		; FF F0 FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sed		; F8
	sbc $78FE.w,X		; FD FE 78
	cpy $68.b		; C4 68
	trb $40.b		; 14 40
	clv		; B8
	bvc -24.b		; 50 E8
	cpx #$F0.b		; E0 F0
	ldy #$30.b		; A0 30
	jsr $C020.w		; 20 20 C0
	rts		; 60

	sec		; 38
	jsr ($7C78.w,X)		; FC 78 7C
	bvs  -8.b		; 70 F8
	bmi -72.b		; 30 B8
	brk $10.b		; 00 10
	cpy #$10.b		; C0 10
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
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	asl $1E1E.w,X		; 1E 1E 1E
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	asl $1E1E.w,X		; 1E 1E 1E
	asl $0200.w,X		; 1E 00 02
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $31.b		; 00 31
	brk $47.b		; 00 47
	brk $83.b		; 00 83
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	asl $0E1F.w		; 0E 1F 0E
	ora $383F0E.l,X		; 1F 0E 3F 38
	adc $06FF7C.l,X		; 7F 7C FF 06
	cmp #$20.b		; C9 20
	sta [$20.b]		; 87 20
	sty $20.b		; 84 20
	sty $20.b		; 84 20
	sty $60.b		; 84 60
	sty $61.b		; 84 61
	ora $71.b		; 05 71
	tsb $30.b		; 04 30
	sbc $7BFF78.l,X		; FF 78 FF 7B
	sbc $7BFF7B.l,X		; FF 7B FF 7B
	sbc $FAFF7B.l,X		; FF 7B FF FA
	sbc $00FFFB.l,X		; FF FB FF 00
	bit #$20.b		; 89 20
	php		; 08
	and ($08.b,X)		; 21 08
	and ($08.b,X)		; 21 08
	lda ($08.b,X)		; A1 08
	cpx #$CC.b		; E0 CC
	jsr $E0A4.w		; 20 A4 E0
	cpy $76.b		; C4 76
	sbc $F7FFF7.l,X		; FF F7 FF F7
	sbc $F7FFF7.l,X		; FF F7 FF F7
	sbc $1BFF33.l,X		; FF 33 FF 1B
	adc $08FF3B.l,X		; 7F 3B FF 08
	jsr $3F00.w		; 20 00 3F
	ror $7801.w,X		; 7E 01 78
	sta [$00.b]		; 87 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	and $003F00.l,X		; 3F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	cpy #$04.b		; C0 04
	cpy #$04.b		; C0 04
	cpy #$04.b		; C0 04
	cpx #$00.b		; E0 00
	and $1F201F.l,X		; 3F 1F 20 1F
	jsr $1F00.w		; 20 00 1F
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF1FFF.l,X		; 3F FF 1F FF
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	bpl  65.b		; 10 41
	rol $3E7F.w,X		; 3E 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	adc $109804.l,X		; 7F 04 98 10
	dey		; 88
	php		; 08
	bra   8.b		; 80 08
	bra   0.b		; 80 00
	dey		; 88
	brk $88.b		; 00 88
	brk $88.b		; 00 88
	php		; 08
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	sta ($20.b,X)		; 81 20
	bra  32.b		; 80 20
	bra  32.b		; 80 20
	bra  32.b		; 80 20
	bra 126.b		; 80 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7FFF7E.l,X		; FF 7E FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $40FF7F.l,X		; FF 7F FF 40
	ora $00.b,S		; 03 00
	ora ($01.b,X)		; 01 01
	ora ($11.b,X)		; 01 11
	ora ($10.b,X)		; 01 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  -4.b		; 80 FC
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $7FFFFE.l,X		; FF FE FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	sec		; 38
	brk $88.b		; 00 88
	adc [$80.b],Y		; 77 80
	adc $000038.l,X		; 7F 38 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $03.b,S		; 03 03
	ora $88073F.l		; 0F 3F 07 88
	ora [$80.b]		; 07 80
	ora $38.b,S		; 03 38
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	cmp ($00.b,S),Y		; D3 00
	ora $003900.l,X		; 1F 00 39 00
	sbc ($00.b,X)		; E1 00
	cmp ($00.b,X)		; C1 00
	ora ($00.b,X)		; 01 00
	ora ($7C.b,X)		; 01 7C
	sbc $E0FF2C.l,X		; FF 2C FF E0
	sbc $00F9C0.l,X		; FF C0 F9 00
	sbc ($00.b,X)		; E1 00
	cmp ($00.b,X)		; C1 00
	ora ($00.b,X)		; 01 00
	ora ($71.b,X)		; 01 71
	tsb $71.b		; 04 71
	tsb $31.b		; 04 31
	tsb $31.b		; 04 31
	tsb $20.b		; 04 20
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sty $00.b		; 84 00
	mvp $FF,$FB		; 44 FB FF
	xce		; FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $BBFF7B.l,X		; FF 7B FF BB
	sbc $E002E0.l,X		; FF E0 02 E0
	cop $90.b		; 02 90
	ora $90.b,S		; 03 90
	ora ($80.b,X)		; 01 80
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	ora $2700.w,Y		; 19 00 27
	sbc $FDFF.w,X		; FD FF FD
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $D8FFE6.l,X		; FF E6 FF D8
	sbc $000000.l,X		; FF 00 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	cpy #$60.b		; C0 60
	cpx #$60.b		; E0 60
	cpx #$30.b		; E0 30
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	cpy #$F0.b		; C0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora [$07.b]		; 07 07
	ora $000F0F.l		; 0F 0F 0F 00
	ora $3C3C1F.l,X		; 1F 1F 3C 3C
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $3F.b,S		; 03 3F
	ora $000000.l		; 0F 00 00 00
	cpy #$C0.b		; C0 C0
	beq -32.b		; F0 E0
	sed		; F8
	beq  -8.b		; F0 F8
	clc		; 18
	sed		; F8
	iny		; C8
	sed		; F8
	dey		; 88
	sed		; F8
	php		; 08
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $18.b		; 00 18
	brk $C8.b		; 00 C8
	rti		; 40

	dey		; 88
	cpx #$08.b		; E0 08
	bvc  16.b		; 50 10
	bvc  24.b		; 50 18
	cli		; 58
	sec		; 38
	sec		; 38
	sed		; F8
	sec		; 38
	jsr ($EC68.w,X)		; FC 68 EC
	cli		; 58
	cpy $8830.w		; CC 30 88
	cpx #$F0.b		; E0 F0
	cpx #$F8.b		; E0 F8
	cpy #$F8.b		; C0 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	bpl  -4.b		; 10 FC
	bmi  -4.b		; 30 FC
	bvs  -8.b		; 70 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $0D0E.w		; 0D 0E 0D
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	tsb $04.b		; 04 04
	ora [$1F.b]		; 07 1F
	ora [$E8.b]		; 07 E8
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora $000700.l		; 0F 00 07 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	brk $18.b		; 00 18
	ora $FA.b,X		; 15 FA
	bvc -56.b		; 50 C8
	clv		; B8
	bra  64.b		; 80 40
	plp		; 28
	bne  16.b		; D0 10
	bcc  16.b		; 90 10
	jsr $C030.w		; 20 30 C0
	beq -128.b		; F0 80
	ror $0028.w,X		; 7E 28 00
	bvs   8.b		; 70 08
	sed		; F8
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	bpl   0.b		; 10 00
	bmi -128.b		; 30 80
	ror $800C.w,X		; 7E 0C 80
	bmi   0.b		; 30 00
	cpx #$0E.b		; E0 0E
	ldx $E0FF.w		; AE FF E0
	sbc $00FFB4.l,X		; FF B4 FF 00
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	ldx $02FF.w		; AE FF 02
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	ldx $04FF.w,Y		; BE FF 04
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	dec $06FF.w		; CE FF 06
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	dec $08FF.w,X		; DE FF 08
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	inc $0AFF.w		; EE FF 0A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ldx $0CFF.w		; AE FF 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ldx $0EFF.w,Y		; BE FF 0E
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	dec $20FF.w		; CE FF 20
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	dec $22FF.w,X		; DE FF 22
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $24FF.w		; EE FF 24
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $26FF.w,X		; FE FF 26
	tsb $0000.w		; 0C 00 00
	sei		; 78
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora ($78.b,X)		; 01 78
	brk $0C.b		; 00 0C
	brk $3C.b		; 00 3C
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	beq   0.b		; F0 00
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	cpy #$FE.b		; C0 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora [$07.b]		; 07 07
	ora $000F0F.l		; 0F 0F 0F 00
	ora $3C3C1F.l,X		; 1F 1F 3C 3C
	ora [$00.b]		; 07 00
	asl A		; 0A
	ora $0100.w		; 0D 00 01
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $3F.b,S		; 03 3F
	ora $000200.l		; 0F 00 02 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FC.b		; 00 FC
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	ora $FF.b,S		; 03 FF
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	bcc  67.b		; 90 43
	bmi  66.b		; 30 42
	and $39C2.w,Y		; 39 C2 39
.ACCU 16
.INDEX 16
	rep #$39		; C2 39
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
	.db $82, $7D, $82		; 82 7D 82
	adc $BC82.w,X		; 7D 82 BC
	sbc $3DFFBD.l,X		; FF BD FF 3D
	sbc $3DFF3D.l,X		; FF 3D FF 3D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $00FF7D.l,X		; FF 7D FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx #$C220.w		; A2 20 C2
	jsr $2082.w		; 20 82 20
	.db $82, $20, $82		; 82 20 82
	rts		; 60

	.db $82, $60, $82		; 82 60 82
	rts		; 60

	.db $82, $5D, $FF		; 82 5D FF
	and $7DFF.w,X		; 3D FF 7D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $00FF7D.l,X		; FF 7D FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  96.b		; 80 60
	bra  48.b		; 80 30
	bra  48.b		; 80 30
	bra  48.b		; 80 30
	bra  48.b		; 80 30
	rti		; 40

	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $7F3FFF.l,X		; 7F FF 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	cpy #$F0C0.w		; C0 C0 F0
	cpx #$F0F8.w		; E0 F8 F0
	sed		; F8
	clc		; 18
	sed		; F8
	iny		; C8
	sed		; F8
	dey		; 88
	sed		; F8
	php		; 08
	bvc -56.b		; 50 C8
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $18.b		; 00 18
	brk $C8.b		; 00 C8
	rti		; 40

	dey		; 88
	cpx #$2808.w		; E0 08 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $50, $02		; 82 50 02
	bvc   2.b		; 50 02
	bvc   2.b		; 50 02
	bvs 114.b		; 70 72
	cld		; D8
	tax		; AA
	beq 114.b		; F0 72
	bne   1.b		; D0 01
	adc $FDFF.w,X		; 7D FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $05FF8D.l,X		; FF 8D FF 05
	cmp $FEFF8D.l,X		; DF 8D FF FE
	sbc $802000.l,X		; FF 00 20 80
	jsr $3080.w		; 20 80 30
	bra  48.b		; 80 30
	rts		; 60

	bmi  96.b		; 30 60
	sec		; 38
	rts		; 60

	clc		; 18
	jsr $C008.w		; 20 08 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0F0.w		; C0 F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	sed		; F8
	cpx #$F0F8.w		; E0 F8 F0
	sed		; F8
	brk $01.b		; 00 01
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
	brk $0F.b		; 00 0F
	brk $83.b		; 00 83
	brk $43.b		; 00 43
	brk $33.b		; 00 33
	brk $0A.b		; 00 0A
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	jmp ($3CFF.w,X)		; 7C FF 3C
	adc $053F0C.l,X		; 7F 0C 3F 05
	ora $000700.l		; 0F 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	jsr ($803F.w,X)		; FC 3F 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $FF.b,S		; 03 FF
	adc $0D0EFF.l,X		; 7F FF 0E 0D
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	tsb $04.b		; 04 04
	sta [$7F.b]		; 87 7F
	ora [$68.b]		; 07 68
	sta $64.b,S		; 83 64
	cop $00.b		; 02 00
	ora $000700.l		; 0F 00 07 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	bra  -8.b		; 80 F8
	sta $FA.b,X		; 95 FA
	tya		; 98
	sbc $000100.l,X		; FF 00 01 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5D.b		; 00 5D
	.db $82, $69, $82		; 82 69 82
	and #$3982.w		; 29 82 39
	.db $82, $29, $82		; 82 29 82
	and #$2482.w		; 29 82 24
	.db $82, $04, $E2		; 82 04 E2
	adc $7DFF.w,X		; 7D FF 7D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $7DFF7D.l,X		; FF 7D FF 7D
	sbc $1DFF7D.l,X		; FF 7D FF 1D
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
	brk $60.b		; 00 60
	.db $82, $60, $82		; 82 60 82
	rts		; 60

	sta ($60.b,X)		; 81 60
	sta ($60.b,X)		; 81 60
	sta ($60.b,X)		; 81 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra 125.b		; 80 7D
	sbc $7EFF7D.l,X		; FF 7D FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	rti		; 40

	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	bmi  64.b		; 30 40
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl  64.b		; 10 40
	bpl 111.b		; 10 6F
	jsr ($F003.w,X)		; FC 03 F0
	ora $00FE00.l		; 0F 00 FE 00
	brk $3F.b		; 00 3F
	adc $3F7F3F.l,X		; 7F 3F 7F 3F
	adc $007F10.l,X		; 7F 10 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $0000.w,X		; FE 00 00
	clv		; B8
	bra  64.b		; 80 40
	plp		; 28
	bne  16.b		; D0 10
	bcc  16.b		; 90 10
	jsr $C030.w		; 20 30 C0
	inc $7E80.w,X		; FE 80 7E
	brk $C6.b		; 00 C6
	bvs   8.b		; 70 08
	sed		; F8
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	bpl   0.b		; 10 00
	rol $7F81.w,X		; 3E 81 7F
	and $00FF.w,Y		; 39 FF 00
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
	brk $C0.b		; 00 C0
	cld		; D8
	ora ($D8.b,X)		; 01 D8
	brk $D8.b		; 00 D8
	brk $D8.b		; 00 D8
	brk $58.b		; 00 58
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	tsb $FFFE.w		; 0C FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc ($FF.b,S),Y		; F3 FF
	jsr $300C.w		; 20 0C 30
	sty $EC38.w		; 8C 38 EC
	sec		; 38
	inc $FE38.w,X		; FE 38 FE
	brk $FE.b		; 00 FE
	bit $F6.b,X		; 34 F6
	bit $F0E6.w		; 2C E6 F0
	jsr ($FC70.w,X)		; FC 70 FC
	bpl  -4.b		; 10 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	php		; 08
	inc $FE18.w,X		; FE 18 FE
	jsr $2013.w		; 20 13 20
	ora ($20.b,S),Y		; 13 20
	ora $200320.l		; 0F 20 03 20
	ora $22.b,S		; 03 22
	ora $27.b,S		; 03 27
	brk $27.b		; 00 27
	ora ($EC.b,X)		; 01 EC
	sbc $F0FFEC.l,X		; FF EC FF F0
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FFFFFC.l,X		; FF FC FF FF
	sed		; F8
	sbc $C418F8.l,X		; FF F8 18 C4
	sei		; 78
	cpy $68.b		; C4 68
	trb $40.b		; 14 40
	clv		; B8
	bvc -24.b		; 50 E8
	cpx #$A0F0.w		; E0 F0 A0
	bmi  32.b		; 30 20
	jsr $FC38.w		; 20 38 FC
	sec		; 38
	jsr ($7C78.w,X)		; FC 78 7C
	bvs  -8.b		; 70 F8
	bmi -72.b		; 30 B8
	brk $10.b		; 00 10
	cpy #$C010.w		; C0 10 C0
	brk $10.b		; 00 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	sta ($7F.b,X)		; 81 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7E.l,X		; FF 7E FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $3E.b		; 00 3E
	eor ($00.b,X)		; 41 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	ora ($11.b,X)		; 01 11
	sta ($10.b,X)		; 81 10
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  -3.b		; 80 FD
	inc $FFFC.w,X		; FE FC FF
	inc $FEFF.w,X		; FE FF FE
	sbc $7FFF7E.l,X		; FF 7E FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $0060C0.l,X		; FF C0 60 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	clc		; 18
	sty $00.b		; 84 00
	tya		; 98
	php		; 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   8.b		; 80 08
	sta ($08.b,X)		; 81 08
	sta ($08.b,X)		; 81 08
	sta ($08.b,X)		; 81 08
	sta ($08.b,X)		; 81 08
	sta ($08.b,X)		; 81 08
	cmp ($08.b,X)		; C1 08
	adc [$3E.b]		; 67 3E
	eor ($7E.b,X)		; 41 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $18FF3E.l,X		; FF 3E FF 18
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
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $E6.b		; 00 E6
	asl $FFAE.w		; 0E AE FF
	sbc [$FF.b],Y		; F7 FF
	ldx $00FF.w		; AE FF 00
	tsb $0000.w		; 0C 00 00
	ora [$00.b]		; 07 00
	ldx $02FF.w		; AE FF 02
	tsb $0000.w		; 0C 00 00
	inc $FF.b		; E6 FF
	ldx $04FF.w,Y		; BE FF 04
	tsb $0000.w		; 0C 00 00
	inc $FF.b,X		; F6 FF
	ldx $06FF.w,Y		; BE FF 06
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	ldx $08FF.w,Y		; BE FF 08
	tsb $0000.w		; 0C 00 00
	sbc #$CEFF.w		; E9 FF CE
	sbc $00060A.l,X		; FF 0A 06 00
	brk $F9.b		; 00 F9
	sbc $0CFFCE.l,X		; FF CE FF 0C
	tsb $0000.w		; 0C 00 00
	ora #$CE00.w		; 09 00 CE
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EE.b		; 00 EE
	sbc $20FFDE.l,X		; FF DE FF 20
	tsb $0000.w		; 0C 00 00
	inc $DEFF.w,X		; FE FF DE
	sbc $000C22.l,X		; FF 22 0C 00
	brk $EE.b		; 00 EE
	sbc $24FFEE.l,X		; FF EE FF 24
	tsb $0000.w		; 0C 00 00
	inc $EEFF.w,X		; FE FF EE
	sbc $000C26.l,X		; FF 26 0C 00
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	sbc $000C28.l,X		; FF 28 0C 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	ora [$07.b]		; 07 07
	brk $0F.b		; 00 0F
	ora $031E1E.l		; 0F 1E 1E 03
	brk $05.b		; 00 05
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	ora $071F01.l		; 0F 01 1F 07
	brk $01.b		; 00 01
	brk $E0.b		; 00 E0
	cpx #$F0F8.w		; E0 F8 F0
	jsr ($FCF8.w,X)		; FC F8 FC
	tsb $E4FC.w		; 0C FC E4
	jmp ($FC44.w,X)		; 7C 44 FC
	tsb $28.b		; 04 28
	cpx $00.b		; E4 00
	cpx #$F000.w		; E0 00 F0
	brk $F8.b		; 00 F8
	brk $0C.b		; 00 0C
	brk $E4.b		; 00 E4
	ldy #$F0C4.w		; A0 C4 F0
	tsb $14.b		; 04 14
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  31.b		; 80 1F
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	rti		; 40

	dec $0020.w,X		; DE 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	inc $8D00.w,X		; FE 00 8D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora ($FF.b,X)		; 01 FF
	adc ($FF.b)		; 72 FF
	brk $90.b		; 00 90
	tsb $90.b		; 04 90
	tsb $B0.b		; 04 B0
	tsb $30.b		; 04 30
	tsb $30.b		; 04 30
	tsb $0C60.w		; 0C 60 0C
	jsr $A00C.w		; 20 0C A0
	adc $FF6FFF.l		; 6F FF 6F FF
	eor $FFCFFF.l		; 4F FF CF FF
	cmp $FF9FFF.l		; CF FF 9F FF
	cmp $FF5FFF.l,X		; DF FF 5F FF
	tsb $2CE0.w		; 0C E0 2C
	bra  44.b		; 80 2C
	bra  44.b		; 80 2C
	bra  60.b		; 80 3C
	stz $AA36.w		; 9C 36 AA
	bit $389C.w,X		; 3C 9C 38
	bra  31.b		; 80 1F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $63FF7F.l,X		; FF 7F FF 63
	sbc $63F741.l,X		; FF 41 F7 63
	sbc $00FF7F.l,X		; FF 7F FF 00
	bcc  32.b		; 90 20
	bra  32.b		; 80 20
	dey		; 88
	jsr $1888.w		; 20 88 18
	sty $8C18.w		; 8C 18 8C
	clc		; 18
	sty $08.b		; 84 08
	.db $42, $60		; 42 60
	beq 112.b		; F0 70
	beq 112.b		; F0 70
	sed		; F8
	bvs  -8.b		; 70 F8
	bvs  -4.b		; 70 FC
	bvs  -4.b		; 70 FC
	sei		; 78
	jsr ($FEBC.w,X)		; FC BC FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $4CE0.w		; 9C E0 4C
	rts		; 60

	eor $404760.l		; 4F 60 47 40
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	rts		; 60

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($80.b,X)		; 01 80
	ora ($80.b,X)		; 01 80
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	mvp $C4,$01		; 44 01 C4
	ora ($04.b,X)		; 01 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	cop $04.b		; 02 04
	tyx		; BB
	sbc $FBFF3B.l,X		; FF 3B FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $00FFFB.l,X		; FF FB FF 00
	and [$00.b]		; 27 00
	and [$00.b]		; 27 00
	asl $0780.w,X		; 1E 80 07
	bra   7.b		; 80 07
	sta $07.b		; 85 07
	sta $028E00.l		; 8F 00 8E 02
	cld		; D8
	sbc $E0FFD8.l,X		; FF D8 FF E0
	inc $FFF8.w,X		; FE F8 FF
	sed		; F8
	sbc $FFFEF8.l,X		; FF F8 FE FF
	beq  -1.b		; F0 FF
	beq  80.b		; F0 50
	sed		; F8
	beq -104.b		; F0 98
	beq -72.b		; F0 B8
	rts		; 60

	bcs -32.b		; B0 E0
	beq -64.b		; F0 C0
	cpx #$6040.w		; E0 40 60
	rti		; 40

	rti		; 40

	jsr $60F8.w		; 20 F8 60
	sed		; F8
	rti		; 40

	sed		; F8
	cpy #$00F0.w		; C0 F0 00
	bvs   0.b		; 70 00
	jsr $2080.w		; 20 80 20
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
	ora [$06.b]		; 07 06
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	cop $02.b		; 02 02
	ora $0F.b,S		; 03 0F
	ora $74.b,S		; 03 74
	ora ($B2.b,X)		; 01 B2
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $0C.b		; 00 0C
	asl A		; 0A
	adc $FF4C.w,X		; 7D 4C FF
	jmp $1420C0.l		; 5C C0 20 14
	pla		; 68
	php		; 08
	pha		; 48
	php		; 08
	bpl  24.b		; 10 18
	cpx #$C0FC.w		; E0 FC C0
	and $386380.l,X		; 3F 80 63 38
	tsb $FC.b		; 04 FC
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	php		; 08
	brk $1C.b		; 00 1C
	cpy #$1C3F.w		; C0 3F 1C
	sbc $000000.l,X		; FF 00 00 00
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
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $87.b,X		; F6 87
	rts		; 60

	ora $F8E0.w,Y		; 19 E0 F8
	bvc -36.b		; 50 DC
	and ($F8.b)		; 32 F8
	stz $47F8.w,X		; 9E F8 47
	bvs  35.b		; 70 23
	sec		; 38
	bvs   9.b		; 70 09
	sei		; 78
	ora ($18.b,X)		; 01 18
	tsb $8C.b		; 04 8C
	brk $C8.b		; 00 C8
	tsb $60.b		; 04 60
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$FE00.w		; E0 00 FE
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF1FFF.l,X		; FF FF 1F FF
	ora ($FF.b,X)		; 01 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0CA0.w		; 0C A0 0C
	rts		; 60

	trb $1C60.w		; 1C 60 1C
	cpx #$2014.w		; E0 14 20
	tsb $20.b		; 04 20
	brk $20.b		; 00 20
	brk $38.b		; 00 38
	eor $FF9FFF.l,X		; 5F FF 9F FF
	sta $FF1FFF.l,X		; 9F FF 1F FF
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F073F.l,X		; 1F 3F 07 3F
	sec		; 38
	bra  56.b		; 80 38
	bra  40.b		; 80 28
	bra  40.b		; 80 28
	bra  40.b		; 80 28
	bra  40.b		; 80 28
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sta $7F.b,S		; 83 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $28FF7C.l,X		; FF 7C FF 28
	.db $62, $2C, $63		; 62 2C 63
	asl $1C3B.w,X		; 1E 3B 1C
	and $073F13.l,X		; 3F 13 3F 07
	and $0D3F0D.l,X		; 3F 0D 3F 0D
	tsa		; 3B
	stz $9CFE.w		; 9C FE 9C
	sbc $C0FFC4.l,X		; FF C4 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C6FFC2.l,X		; FF C2 FF C6
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   1.b		; 80 01
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
	brk $80.b		; 00 80
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($C0.b,X)		; 01 C0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	tsb $41.b		; 04 41
	tsb $40.b		; 04 40
	cop $40.b		; 02 40
	cop $40.b		; 02 40
	ora $40.b,S		; 03 40
	ora ($40.b,X)		; 01 40
	ora ($40.b,X)		; 01 40
	ora ($FB.b,X)		; 01 FB
	sbc $FDFFFB.l,X		; FF FB FF FD
	sbc $FCFFFD.l,X		; FF FD FF FC
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $41FFFE.l,X		; FF FE FF 41
	asl $40.b		; 06 40
	asl $C0.b		; 06 C0
	ora $42.b,S		; 03 42
	ora $42.b,S		; 03 42
	ora $40.b,S		; 03 40
	ora ($40.b,X)		; 01 40
	ora ($40.b,X)		; 01 40
	ora ($FB.b,X)		; 01 FB
	jsr ($FEF9.w,X)		; FC F9 FE
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $00C080.l,X		; FF 80 C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	jsr $2008.w		; 20 08 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $10.b		; 04 10
	tsb $10.b		; 04 10
	tsb $10.b		; 04 10
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $1F0F3F.l,X		; 1F 3F 0F 1F
	ora $1F0F1F.l		; 0F 1F 0F 1F
	php		; 08
	jsr $2008.w		; 20 08 20
	php		; 08
	jsr $2008.w		; 20 08 20
	php		; 08
	jsr $2004.w		; 20 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$00E0.w		; E0 E0 00
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
	brk $02.b		; 00 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl  15.b		; 10 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $041F0F.l,X		; 1F 0F 1F 04
	jsr $2004.w		; 20 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	cop $20.b		; 02 20
	cop $20.b		; 02 20
	cop $20.b		; 02 20
	cop $20.b		; 02 20
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$80E0.w		; C0 E0 80
	cpy #$827C.w		; C0 7C 82
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
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
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl   4.b		; 10 04
	bpl  15.b		; 10 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $041F0F.l,X		; 1F 0F 1F 04
	jsr $2004.w		; 20 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	tsb $20.b		; 04 20
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
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
	cop $10.b		; 02 10
	cop $10.b		; 02 10
	cop $10.b		; 02 10
	brk $1F.b		; 00 1F
	and $433C00.l,X		; 3F 00 3C 43
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	ora $1F0F1F.l		; 0F 1F 0F 1F
	ora $1F001F.l		; 0F 1F 00 1F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	cop $20.b		; 02 20
	cop $20.b		; 02 20
	cop $20.b		; 02 20
	cop $E0.b		; 02 E0
	cop $E0.b		; 02 E0
	cop $F0.b		; 02 F0
	brk $9F.b		; 00 9F
	ora $FFDF10.l		; 0F 10 DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $9F00FF.l		; 0F FF 00 9F
	brk $1F.b		; 00 1F
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	bra  64.b		; 80 40
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $ED.b		; 00 ED
	asl $FFAF.w		; 0E AF FF
	sbc $FF.b,X		; F5 FF
	lda $0C00FF.l		; AF FF 00 0C
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	lda $0C02FF.l		; AF FF 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	lda $0C04FF.l,X		; BF FF 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	lda $0C06FF.l,X		; BF FF 06 0C
	brk $00.b		; 00 00
	pea $CFFF.w		; F4 FF CF
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $CF.b		; 00 CF
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $ED.b		; 00 ED
	sbc $0CFFDF.l,X		; FF DF FF 0C
	tsb $0000.w		; 0C 00 00
	sbc $DFFF.w,X		; FD FF DF
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $ED.b		; 00 ED
	sbc $20FFEF.l,X		; FF EF FF 20
	tsb $0000.w		; 0C 00 00
	sbc $EFFF.w,X		; FD FF EF
	sbc $000C22.l,X		; FF 22 0C 00
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	sbc $000C24.l,X		; FF 24 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $03.b		; 00 03
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($01.b,X)		; 01 01
	brk $38.b		; 00 38
	sec		; 38
	inc $FFFE.w,X		; FE FE FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	inc $8D8D.w,X		; FE 8D 8D
	adc [$39.b]		; 67 39
	bit $49.b,X		; 34 49
	brk $38.b		; 00 38
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	adc ($FD.b)		; 72 FD
	inc $9301.w,X		; FE 01 93
	bit $00.b		; 24 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $00.b		; 24 00
	mvp $44,$01		; 44 01 44
	ora ($44.b,X)		; 01 44
	ora ($84.b,X)		; 01 84
	ora ($8C.b,X)		; 01 8C
	ora ($88.b,X)		; 01 88
	ora ($88.b,X)		; 01 88
	tas		; 1B
	and $3B7F3B.l,X		; 3F 3B 7F 3B
	adc $7B7F3B.l,X		; 7F 3B 7F 7B
	sbc $77FF73.l,X		; FF 73 FF 77
	sbc $00FF77.l,X		; FF 77 FF 00
	asl $0400.w		; 0E 00 04
	eor ($04.b),Y		; 51 04
	eor ($04.b),Y		; 51 04
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	adc ($05.b),Y		; 71 05
	sbc ($FF.b),Y		; F1 FF
	xce		; FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FAFFFB.l,X		; FF FB FF FA
	sbc $040904.l,X		; FF 04 09 04
	ora #$0944.w		; 09 44 09
	eor $09.b,S		; 43 09
	cmp $0D.b,S		; C3 0D
	sbc $0C.b,S		; E3 0C
	sbc ($E4.b,X)		; E1 E4
	lda ($54.b),Y		; B1 54
	inc $FF.b,X		; F6 FF
	inc $FF.b,X		; F6 FF
	inc $FF.b,X		; F6 FF
	inc $FF.b,X		; F6 FF
	sbc ($FF.b)		; F2 FF
	sbc ($FF.b,S),Y		; F3 FF
	tas		; 1B
	sbc $00BF0B.l,X		; FF 0B BF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -32.b		; 80 E0
	brk $18.b		; 00 18
	brk $0F.b		; 00 0F
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	tsb $18.b		; 04 18
	rol $2E34.w,X		; 3E 34 2E
	jsr $2030.w		; 20 30 20
	sbc [$FF.b]		; E7 FF
	beq  -1.b		; F0 FF
	sbc [$FF.b],Y		; F7 FF
	adc [$7F.b],Y		; 77 7F
	rtl		; 6B

	adc $1F0907.l,X		; 7F 07 09 1F
	ora ($1F.b,X)		; 01 1F
	ora $00.b,S		; 03 00
	bit #$0800.w		; 89 00 08
	.db $42, $08		; 42 08
	eor $08.b,S		; 43 08
	cmp $08.b,S		; C3 08
	cmp $08.b,S		; C3 08
	cmp $08.b,S		; C3 08
	rep #$08		; C2 08
	ror $FF.b,X		; 76 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	ora [$3C.b]		; 07 3C
	asl $04F1.w		; 0E F1 04
	tsa		; 3B
	ora $3E.b		; 05 3E
	rol $7A3F.w		; 2E 3F 7A
	ora $72.b,S		; 03 72
	ora ($0C.b)		; 12 0C
	rol $C3.b,X		; 36 C3
	sbc $C7FF0F.l,X		; FF 0F FF C7
	sbc $C0FBC3.l,X		; FF C3 FB C0
	sbc ($FC.b),Y		; F1 FC
	sta ($FC.b,X)		; 81 FC
	bra -40.b		; 80 D8
	cpx #$4080.w		; E0 80 40
	bra  64.b		; 80 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	trb $4A.b		; 14 4A
	bmi  66.b		; 30 42
	bmi -62.b		; 30 C2
	bmi -30.b		; 30 E2
	bpl -62.b		; 10 C2
	bpl -62.b		; 10 C2
	bpl -126.b		; 10 82
	bpl   3.b		; 10 03
	ora [$07.b],Y		; 17 07
	and [$0F.b],Y		; 37 0F
	and $0F3F0F.l,X		; 3F 0F 3F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	ora $021F0F.l,X		; 1F 0F 1F 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl   2.b		; 10 02
	bpl -17.b		; 10 EF
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $00FFEF.l,X		; FF EF FF 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl -32.b		; 10 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $007000.l,X		; 1F 00 70 00
	cmp $010001.l,X		; DF 01 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $207F0F.l,X		; 1F 0F 7F 20
	sbc $290819.l,X		; FF 19 08 29
	eor $1C5C.w,Y		; 59 5C 1C
	nop		; EA
	sec		; 38
	bmi -125.b		; 30 83
	sec		; 38
	cmp [$40.b]		; C7 40
	ldx $CF30.w,Y		; BE 30 CF
	inc $01.b,X		; F6 01
	inc $00.b,X		; F6 00
	sep #$00		; E2 00
	dec $00.b		; C6 00
	jmp ($7C83.w,X)		; 7C 83 7C
	sta $3D.b,S		; 83 3D
	cmp $08.b,S		; C3 08
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$3800.w		; E0 00 38
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	cpy #$00F8.w		; C0 F8 00
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
	ora ($B8.b,X)		; 01 B8
	ora ($98.b,X)		; 01 98
	ora ($98.b,X)		; 01 98
	ora ($F8.b,X)		; 01 F8
	ora ($A8.b,X)		; 01 A8
	brk $B8.b		; 00 B8
	brk $CE.b		; 00 CE
	brk $09.b		; 00 09
	eor [$FF.b]		; 47 FF
	adc [$FF.b]		; 67 FF
	adc [$FF.b]		; 67 FF
	ora [$FF.b]		; 07 FF
	eor [$FF.b],Y		; 57 FF
	eor [$FF.b]		; 47 FF
	and ($FF.b),Y		; 31 FF
	ror $7F.b,X		; 76 7F
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	adc ($04.b),Y		; 71 04
	eor ($04.b),Y		; 51 04
	bvc   4.b		; 50 04
	brk $C4.b		; 00 C4
	xce		; FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $E1FF3B.l,X		; FF 3B FF E1
	cpx $A1.b		; E4 A1
	ora [$A1.b]		; 07 A1
	ora [$A1.b]		; 07 A1
	ora [$20.b]		; 07 20
	ora [$21.b]		; 07 21
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	inc $FF1B.w,X		; FE 1B FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $01FFF8.l,X		; FF F8 FF 01
	sbc $C06080.l,X		; FF 80 60 C0
	rts		; 60

	cpy #$C0F0.w		; C0 F0 C0
	beq   0.b		; F0 00
	beq -96.b		; F0 A0
	bcs  96.b		; B0 60
	bmi -64.b		; 30 C0
	jsr $E080.w		; 20 80 E0
	bra -32.b		; 80 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	rti		; 40

	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	cpx #$003C.w		; E0 3C 00
	tsb $14.b		; 04 14
	tsb $14.b		; 04 14
	tsb $16.b		; 04 16
	tsb $16.b		; 04 16
	tsb $0C12.w		; 0C 12 0C
	ora ($14.b)		; 12 14
	asl A		; 0A
	and $1B0F03.l,X		; 3F 03 0F 1B
	ora $1B0D1B.l		; 0F 1B 0D 1B
	ora $011B.w		; 0D 1B 01
	ora ($01.b,S),Y		; 13 01
	ora ($01.b,S),Y		; 13 01
	phd		; 0B
	.db $42, $08		; 42 08
	brk $08.b		; 00 08
	ora ($08.b,X)		; 01 08
	ora ($0C.b,X)		; 01 0C
	ora ($18.b,X)		; 01 18
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b]		; E7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	brk $34.b		; 00 34
	brk $1C.b		; 00 1C
	bpl  28.b		; 10 1C
	bpl  28.b		; 10 1C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	iny		; C8
	beq -32.b		; F0 E0
	jsr ($FCE0.w,X)		; FC E0 FC
	cpx #$F0FC.w		; E0 FC F0
	jsr ($FCF0.w,X)		; FC F0 FC
	beq  -4.b		; F0 FC
	beq  -8.b		; F0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora [$00.b]		; 07 00
	asl $1C00.w		; 0E 00 1C
	brk $38.b		; 00 38
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
	brk $82.b		; 00 82
	php		; 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	ora ($08.b,X)		; 01 08
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	brk $12.b		; 00 12
	tsb $13.b		; 04 13
	brk $11.b		; 00 11
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	ora ($10.b,X)		; 01 10
	sbc $FFEFFF.l		; EF FF EF FF
	sbc $FFEFFF.l		; EF FF EF FF
	sbc $FFEFFF.l		; EF FF EF FF
	sbc $FFEFFF.l		; EF FF EF FF
	brk $10.b		; 00 10
	bra  16.b		; 80 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	cpx #$E0F0.w		; E0 F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	php		; 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	inc $EEFF.w		; EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $001000.l,X		; FF 00 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	jsr $2000.w		; 20 00 20
	cpx #$E0F0.w		; E0 F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -64.b		; F0 C0
	cpx #$E0C0.w		; E0 C0 E0
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($08.b,X)		; 01 08
	ora ($08.b,X)		; 01 08
	brk $0F.b		; 00 0F
	ora $211E00.l,X		; 1F 00 1E 21
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($11.b,X)		; 01 11
	ora ($11.b,X)		; 01 11
	brk $F1.b		; 00 F1
	bra 113.b		; 80 71
	brk $F9.b		; 00 F9
	brk $CF.b		; 00 CF
	ora [$08.b]		; 07 08
	ora [$08.b]		; 07 08
	inc $EEFF.w		; EE FF EE
	sbc $0EFF0E.l,X		; FF 0E FF 0E
	sbc $00FF06.l,X		; FF 06 FF 00
	cmp $000F00.l		; CF 00 0F 00
	ora $002000.l		; 0F 00 20 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	cpy #$C020.w		; C0 20 C0
	jsr $E0C0.w		; 20 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$00E0.w		; C0 E0 00
	cpx #$E000.w		; E0 00 E0
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
	ora #$2480.w		; 09 80 24
	brk $ED.b		; 00 ED
	phd		; 0B
	tyx		; BB
	sbc $F0FFF7.l,X		; FF F7 FF F0
	sbc $000C00.l,X		; FF 00 0C 00
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	sbc $000C02.l,X		; FF 02 0C 00
	brk $ED.b		; 00 ED
	sbc $04FFE0.l,X		; FF E0 FF 04
	tsb $0000.w		; 0C 00 00
	sbc $E0FF.w,X		; FD FF E0
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F2.b		; 00 F2
	sbc $08FFD0.l,X		; FF D0 FF 08
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	bne  -1.b		; D0 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpy #$0CFF.w		; C0 FF 0C
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	cpy #$0EFF.w		; C0 FF 0E
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $20FFB0.l,X		; FF B0 FF 20
	tsb $0000.w		; 0C 00 00
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $30.b		; 00 30
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	and $7F2F7F.l		; 2F 7F 2F 7F
	and $7F2F7F.l		; 2F 7F 2F 7F
	ora $3F173F.l		; 0F 3F 17 3F
	ora [$3F.b],Y		; 17 3F
	ora [$3F.b],Y		; 17 3F
	cop $C6.b		; 02 C6
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $E5.b		; 00 E5
	and $1BFF.w,Y		; 39 FF 1B
	sbc $1BFF1B.l,X		; FF 1B FF 1B
	sbc $1BFF1B.l,X		; FF 1B FF 1B
	sbc $1AFF1B.l,X		; FF 1B FF 1A
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($45.b,X)		; 61 45
	sei		; 78
	brk $D0.b		; 00 D0
	clc		; 18
	bne  24.b		; D0 18
	bne  24.b		; D0 18
	cpy #$8028.w		; C0 28 80
	plp		; 28
	bra  40.b		; 80 28
	dec A		; 3A
	ora [$7F.b]		; 07 7F
	ora [$37.b]		; 07 37
	and $372F37.l		; 2F 37 2F 37
	and $173F17.l		; 2F 17 3F 17
	and $813F17.l,X		; 3F 17 3F 81
	sbc ($81.b,S),Y		; F3 81
	sbc ($81.b,S),Y		; F3 81
	sbc ($81.b,S),Y		; F3 81
	sbc ($81.b),Y		; F1 81
	sbc ($81.b),Y		; F1 81
	cmp ($81.b),Y		; D1 81
	bne -126.b		; D0 82
	cmp $FF0C.w,Y		; D9 0C FF
	tsb $0CFF.w		; 0C FF 0C
	sbc $0EFF0E.l,X		; FF 0E FF 0E
	sbc $0FDF0E.l,X		; FF 0E DF 0F
	cmp $0CDF07.l,X		; DF 07 DF 0C
	bvc   8.b		; 50 08
	bvs   0.b		; 70 00
	bvc   0.b		; 50 00
	bvs   0.b		; 70 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi -84.b		; 30 AC
	beq -120.b		; F0 88
	beq -96.b		; F0 A0
	beq -128.b		; F0 80
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq   2.b		; F0 02
	lsr $FF01.w,X		; 5E 01 FF
	brk $4E.b		; 00 4E
	brk $7E.b		; 00 7E
	ora ($67.b,X)		; 01 67
	brk $5F.b		; 00 5F
	brk $47.b		; 00 47
	brk $57.b		; 00 57
	and ($7F.b,X)		; 21 7F
	brk $FF.b		; 00 FF
	and ($7F.b),Y		; 31 7F
	ora ($7F.b,X)		; 01 7F
	clc		; 18
	adc $387F20.l,X		; 7F 20 7F 38
	adc $007F28.l,X		; 7F 28 7F 00
	tsb $E0.b		; 04 E0
	cpx $00.b		; E4 00
	tsb $3B.b		; 04 3B
	and $830400.l,X		; 3F 00 04 83
	sta [$70.b]		; 87 70
	pea $2400.w		; F4 00 24
	xce		; FB
	sbc $FBFF1B.l,X		; FF 1B FF FB
	sbc $FBFFC0.l,X		; FF C0 FF FB
	sbc $0BFF78.l,X		; FF 78 FF 0B
	sbc $04FFDB.l,X		; FF DB FF 04
	ora [$18.b]		; 07 18
	asl $7F40.w,X		; 1E 40 7F
	tsb $F00E.w		; 0C 0E F0
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $F81F00.l,X		; FF 00 1F F8
	sbc $80FFE1.l,X		; FF E1 FF 80
	sbc $00FFF1.l,X		; FF F1 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFE0.l,X		; FF E0 FF 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $265920.l,X		; 1F 20 59 26
	.db $42, $11		; 42 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $7F5F3F.l,X		; 1F 3F 5F 7F
	ror $787F.w		; 6E 7F 78
	eor $DFBFBF.l		; 4F BF BF DF
	eor $663741.l,X		; 5F 41 37 66
	stx $34.b		; 86 34
	ora $039C.w,X		; 1D 9C 03
	brk $FF.b		; 00 FF
	bcs  -1.b		; B0 FF
	rti		; 40

	adc $483EA0.l,X		; 7F A0 3E 48
	brk $79.b		; 00 79
	bra -30.b		; 80 E2
	cmp ($FC.b,X)		; C1 FC
	sbc $00.b,S		; E3 00
	sbc $808080.l,X		; FF 80 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sed		; F8
	php		; 08
	.db $82, $1C, $03		; 82 1C 03
	sec		; 38
	cmp $00.b		; C5 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	jmp ($FCFE.w,X)		; 7C FE FC
	sbc $00FF3A.l,X		; FF 3A FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	brk $3F.b		; 00 3F
	rol $7841.w,X		; 3E 41 78
	sta [$00.b]		; 87 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	and $003F00.l,X		; 3F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	sbc $00.b		; E5 00
	and $1F201F.l,X		; 3F 1F 20 1F
	jsr $1F00.w		; 20 00 1F
	inc A		; 1A
	sbc $1AFF1A.l,X		; FF 1A FF 1A
	sbc $00FF1A.l,X		; FF 1A FF 00
	and $003F00.l,X		; 3F 00 3F 00
	and $001F00.l,X		; 3F 00 1F 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $1C.b		; 00 1C
	brk $38.b		; 00 38
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
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
	plp		; 28
	brk $28.b		; 00 28
	ora ($19.b,X)		; 01 19
	cop $1B.b		; 02 1B
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $14.b		; 00 14
	brk $14.b		; 00 14
	ora [$3F.b],Y		; 17 3F
	ora [$3F.b],Y		; 17 3F
	asl $1F.b		; 06 1F
	tsb $1F.b		; 04 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	phd		; 0B
	ora $801F0B.l,X		; 1F 0B 1F 80
	stp		; DB
	.db $82, $D9, $82		; 82 D9 82
	cmp $D400.w,X		; DD 00 D4
	tsb $57.b		; 04 57
	asl $37.b		; 06 37
	cop $33.b		; 02 33
	cop $33.b		; 02 33
	ora [$DF.b]		; 07 DF
	ora [$DF.b]		; 07 DF
	ora $DF.b,S		; 03 DF
	phd		; 0B
	cmp $C8DF88.l,X		; DF 88 DF C8
	sbc $CCFFCC.l,X		; FF CC FF CC
	sbc $80B000.l,X		; FF 00 B0 80
	jsr $5080.w		; 20 80 50
	brk $50.b		; 00 50
	rti		; 40

	bne -64.b		; D0 C0
	bne -128.b		; D0 80
	bcs -128.b		; B0 80
	bcs -64.b		; B0 C0
	beq -64.b		; F0 C0
	cpx #$F0A0.w		; E0 A0 F0
	ldy #$20F0.w		; A0 F0 20
	beq  32.b		; F0 20
	beq  64.b		; F0 40
	beq  64.b		; F0 40
	beq   0.b		; F0 00
	and [$00.b]		; 27 00
	and [$00.b]		; 27 00
	and ($00.b,S),Y		; 33 00
	ora ($00.b,S),Y		; 13 00
	ora ($01.b,S),Y		; 13 01
	asl $0F.b,X		; 16 0F
	ora $080B.w		; 0D 0B 08
	clc		; 18
	and $0C3F18.l,X		; 3F 18 3F 0C
	and $0C1F0C.l,X		; 3F 0C 1F 0C
	ora $011F0A.l,X		; 1F 0A 1F 01
	cop $07.b		; 02 07
	brk $00.b		; 00 00
	sbc $000500.l,X		; FF 00 05 00
	sbc $F09F98.l,X		; FF 98 9F F0
	sbc $B08E08.l,X		; FF 08 8E B0
	rol $0C8C.w,X		; 3E 8C 0C
	brk $FF.b		; 00 FF
	plx		; FA
	sbc $60FF00.l,X		; FF 00 FF 60
	sbc $71FF00.l,X		; FF 00 FF 71
	sbc $F37FC1.l,X		; FF C1 7F F3
	adc $00FF00.l,X		; 7F 00 FF 00
	ora [$00.b],Y		; 17 00
	adc $00FF00.l,X		; 7F 00 FF 00
	ora $001700.l,X		; 1F 00 17 00
	and $00EE21.l,X		; 3F 21 EE 00
	sbc $80FFE8.l,X		; FF E8 FF 80
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $C0FFE8.l,X		; FF E8 FF C0
	sbc $00FE11.l,X		; FF 11 FE 00
	rti		; 40

	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	rti		; 40

	ora $43106F.l,X		; 1F 6F 10 43
	bpl  64.b		; 10 40
	bcc   7.b		; 90 07
	bcc   0.b		; 90 00
	bcc   4.b		; 90 04
	stz $9800.w		; 9C 00 98
	adc ($7F.b,X)		; 61 7F
	adc $7F6F7F.l		; 6F 7F 6F 7F
	adc $FF6FFF.l		; 6F FF 6F FF
	adc $FF63FF.l		; 6F FF 63 FF
	adc [$FF.b]		; 67 FF
	and [$C8.b],Y		; 37 C8
	ora $EA.b,X		; 15 EA
	sbc [$08.b],Y		; F7 08
	and ($08.b)		; 32 08
	cmp ($09.b,X)		; C1 09
	cop $0A.b		; 02 0A
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	inc $FF.b,X		; F6 FF
	pea $F7FF.w		; F4 FF F7
	sbc $80FFF7.l,X		; FF F7 FF 80
	adc $0560.w,X		; 7D 60 05
	beq   5.b		; F0 05
	brk $05.b		; 00 05
	cpy #$20C5.w		; C0 C5 20
	lda $00.b		; A5 00
	ora $08.b		; 05 08
	ora $FF82.w		; 0D 82 FF
	plx		; FA
	sbc $FAFFFA.l,X		; FF FA FF FA
	sbc $1AFF3A.l,X		; FF 3A FF 1A
	adc $F2FFFA.l,X		; 7F FA FF F2
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $FCFF78.l,X		; 7F 78 FF FC
	sbc $7CBF7C.l,X		; FF 7C BF 7C
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $60FF40.l,X		; FF 40 FF 60
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  14.b		; 80 0E
	bra  56.b		; 80 38
	brk $F0.b		; 00 F0
	and [$AE.b]		; 27 AE
	sbc $AEFFF8.l,X		; FF F8 FF AE
	sbc $000C00.l,X		; FF 00 0C 00
	brk $08.b		; 00 08
	brk $AE.b		; 00 AE
	sbc $000C02.l,X		; FF 02 0C 00
	brk $18.b		; 00 18
	brk $AE.b		; 00 AE
	sbc $000C04.l,X		; FF 04 0C 00
	brk $F8.b		; 00 F8
	sbc $06FFBE.l,X		; FF BE FF 06
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $BE.b		; 00 BE
	sbc $000C08.l,X		; FF 08 0C 00
	brk $18.b		; 00 18
	brk $BE.b		; 00 BE
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $F6.b		; 00 F6
	sbc $0CFFCE.l,X		; FF CE FF 0C
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	dec $0EFF.w		; CE FF 0E
	tsb $0000.w		; 0C 00 00
	inc $FF.b,X		; F6 FF
	dec $20FF.w,X		; DE FF 20
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	inc $22FF.w		; EE FF 22
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	inc $24FF.w		; EE FF 24
	tsb $0000.w		; 0C 00 00
	ora ($00.b),Y		; 11 00
	inc $26FF.w		; EE FF 26
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	inc $28FF.w,X		; FE FF 28
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $2AFF.w,X		; FE FF 2A
	tsb $0000.w		; 0C 00 00
	bit $3D00.w,X		; 3C 00 3D
	ora $39.b		; 05 39
	ora ($39.b,X)		; 01 39
	brk $79.b		; 00 79
	php		; 08
	adc ($00.b),Y		; 71 00
	adc ($00.b),Y		; 71 00
	adc ($01.b),Y		; 71 01
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	cop $FC.b		; 02 FC
	brk $FC.b		; 00 FC
	tsb $F8.b		; 04 F8
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	sty $9F00.w		; 8C 00 9F
	bra  63.b		; 80 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	php		; 08
	sed		; F8
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $17.b		; 00 17
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	sed		; F8
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $38.b		; 00 38
	brk $18.b		; 00 18
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	brk $C1.b		; 00 C1
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $BC.b		; 00 BC
	brk $3F.b		; 00 3F
	and $7E3F3F.l,X		; 3F 3F 3F 7E
	adc $7E7F7F.l,X		; 7F 7F 7F 7E
	adc $7C7F7E.l,X		; 7F 7E 7F 7C
	adc $007F7C.l,X		; 7F 7C 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $FF.b,S		; 03 FF
	sbc $1FFFDF.l,X		; FF DF FF 1F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $00.b		; 00 00
	jsr $E000.w		; 20 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bcs  -8.b		; B0 F8
	ldy #$20F8.w		; A0 F8 20
	beq  32.b		; F0 20
	beq   0.b		; F0 00
	cpx #$E000.w		; E0 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	adc ($11.b),Y		; 71 11
	rts		; 60

	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bpl -16.b		; 10 F0
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $2F.b		; 00 2F
	brk $7F.b		; 00 7F
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $01.b,S		; 03 01
	ora ($0F.b,X)		; 01 0F
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FB.b		; 00 FB
	bra  -5.b		; 80 FB
	bra  -7.b		; 80 F9
	iny		; C8
	sed		; F8
	iny		; C8
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sty $8E00.w		; 8C 00 8E
	brk $0B.b		; 00 0B
	brk $1B.b		; 00 1B
	brk $31.b		; 00 31
	brk $30.b		; 00 30
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	trb $3F3F.w		; 1C 3F 3F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	cmp ($C1.b,X)		; C1 C1
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $3E00FE.l,X		; FF FE 00 3E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($C0.b,X)		; 01 C0
	cpy #$C080.w		; C0 80 C0
	brk $C0.b		; 00 C0
	rti		; 40

	cpx #$E040.w		; E0 40 E0
	rti		; 40

	cpx #$E0C0.w		; E0 C0 E0
	cpy #$00E0.w		; C0 E0 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
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
	ora $000700.l		; 0F 00 07 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $21.b		; 00 21
	eor [$37.b]		; 47 37
	brk $3B.b		; 00 3B
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $77.b		; 00 77
	brk $EF.b		; 00 EF
	brk $E7.b		; 00 E7
	brk $00.b		; 00 00
	eor $024807.l,X		; 5F 07 48 02
	mvp $40,$06		; 44 06 40
	asl $0400.w		; 0E 00 04
	php		; 08
	sty $8010.w		; 8C 10 80
	clc		; 18
	inc $ECFF.w,X		; FE FF EC
	ora $F00FF4.l,X		; 1F F4 0F F0
	ora [$F4.b]		; 07 F4
	cop $EC.b		; 02 EC
	brk $EC.b		; 00 EC
	brk $EC.b		; 00 EC
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,S),Y		; 13 00
	phd		; 0B
	brk $0F.b		; 00 0F
	tsb $0A.b		; 04 0A
	tsb $0C10.w		; 0C 10 0C
	bpl  12.b		; 10 0C
	bpl   0.b		; 10 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $71.b		; 00 71
	brk $3F.b		; 00 3F
	brk $17.b		; 00 17
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $88.b		; 00 88
	brk $48.b		; 00 48
	brk $40.b		; 00 40
	asl $0028.w		; 0E 28 00
	brk $28.b		; 00 28
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	iny		; C8
	brk $C8.b		; 00 C8
	brk $C0.b		; 00 C0
	brk $D0.b		; 00 D0
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $28.b		; 00 28
	brk $38.b		; 00 38
	brk $08.b		; 00 08
	bmi   8.b		; 30 08
	bmi   0.b		; 30 00
	bmi  16.b		; 30 10
	jsr $6010.w		; 20 10 60
	bmi  64.b		; 30 40
	plp		; 28
	bne  56.b		; D0 38
	cpy #$0000.w		; C0 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pea $FC00.w		; F4 00 FC
	brk $F8.b		; 00 F8
	brk $E8.b		; 00 E8
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $D0.b		; 00 D0
	brk $80.b		; 00 80
	brk $04.b		; 00 04
	php		; 08
	tsb $0800.w		; 0C 00 08
	brk $08.b		; 00 08
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bmi  16.b		; 30 10
	jsr $6000.w		; 20 00 60
	bcc   0.b		; 90 00
	bvc   0.b		; 50 00
	rts		; 60

	brk $03.b		; 00 03
	ora $27.b,S		; 03 27
	and [$0F.b]		; 27 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $186010.l,X		; 3F 10 60 18
	jsr $001C.w		; 20 1C 00
	bit $5842.w,X		; 3C 42 58
	cop $70.b		; 02 70
	asl $20.b		; 06 20
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $007F7F.l,X		; FF 7F 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00F0F0.l,X		; FF F0 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cpy #$00F0.w		; C0 F0 00
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
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $001F00.l		; 0F 00 1F 00
	ora $001E00.l,X		; 1F 00 1E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	clv		; B8
	brk $BC.b		; 00 BC
	brk $FC.b		; 00 FC
	brk $E4.b		; 00 E4
	brk $48.b		; 00 48
	brk $56.b		; 00 56
	brk $32.b		; 00 32
	brk $D2.b		; 00 D2
	brk $38.b		; 00 38
	rti		; 40

	bit $7C40.w,X		; 3C 40 7C
	brk $64.b		; 00 64
	clc		; 18
	pha		; 48
	ldy $46.b,X		; B4 46
	tay		; A8
	cop $CC.b		; 02 CC
.ACCU 16
	rep #$2C		; C2 2C
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	asl $06.b		; 06 06
	clc		; 18
	clc		; 18
	ora $E10D.w		; 0D 0D E1
	sbc ($00.b,X)		; E1 00
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $19.b		; 00 19
	brk $27.b		; 00 27
	brk $72.b		; 00 72
	ora ($1E.b,X)		; 01 1E
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	bvs 112.b		; 70 70
	beq -16.b		; F0 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra  32.b		; 80 20
	bra  96.b		; 80 60
	brk $C0.b		; 00 C0
	ora $700F90.l		; 0F 90 0F 70
	eor $6B6B4F.l		; 4F 4F 6B 6B
	ror $7E7E.w,X		; 7E 7E 7E
	ror $6C6C.w,X		; 7E 6C 6C
	jmp $DFDF5C.l		; 5C 5C DF DF
	sbc $4D30FF.l,X		; FF FF 30 4D
	trb $43.b		; 14 43
	brk $52.b		; 00 52
	brk $62.b		; 00 62
	bpl   4.b		; 10 04
	jsr $A704.w		; 20 04 A7
	php		; 08
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8F8FF.l,X		; FF FF F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F800.l,X		; FF 00 F8 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FB.b		; 00 FB
	asl A		; 0A
	txy		; 9B
	lda $0000.w		; AD 00 00
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l,X		; 1F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF3F.w		; EE 3F FF
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E4.b		; 00 E4
	brk $C1.b		; 00 C1
	brk $EE.b		; 00 EE
	ora ($82.b),Y		; 11 82
	and $0080.w,X		; 3D 80 00
	cpx #$E000.w		; E0 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$00C0.w		; C0 C0 00
	bra   0.b		; 80 00
	cpx #$E000.w		; E0 00 E0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$043D.w		; C0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clv		; B8
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007F19.l,X		; 7F 19 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $002000.l		; 2F 00 20 00
	brk $19.b		; 00 19
	eor ($00.b,X)		; 41 00
	eor $00.b,S		; 43 00
	brk $00.b		; 00 00
	and [$00.b]		; 27 00
	jsr $0000.w		; 20 00 00
	bpl   0.b		; 10 00
	ora $C0C0C0.l,X		; 1F C0 C0 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $80.b		; 02 80
	php		; 08
	brk $FB.b		; 00 FB
	asl A		; 0A
	txy		; 9B
	lda $0000.w		; AD 00 00
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l,X		; 1F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$7F.b],Y		; F7 7F
	sbc $001F02.l,X		; FF 02 1F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00E200.l,X		; FF 00 E2 00
	cpy #$F700.w		; C0 00 F7
	php		; 08
	bra  31.b		; 80 1F
	brk $00.b		; 00 00
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	cpy #$043D.w		; C0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clv		; B8
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007F0C.l,X		; 7F 0C 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and [$00.b],Y		; 37 00
	bmi   0.b		; 30 00
	cop $0C.b		; 02 0C
	rti		; 40

	brk $43.b		; 00 43
	brk $20.b		; 00 20
	brk $23.b		; 00 23
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	php		; 08
	brk $0F.b		; 00 0F
	cpy #$C0C0.w		; C0 C0 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	rti		; 40

	brk $40.b		; 00 40
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FB.b		; 00 FB
	asl A		; 0A
	txy		; 9B
	lda $0000.w		; AD 00 00
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l,X		; 1F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$3F.b],Y		; F7 3F
	sbc $001F00.l,X		; FF 00 1F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00E100.l,X		; FF 00 E1 00
	cpy #$F700.w		; C0 00 F7
	php		; 08
	bra  14.b		; 80 0E
	bra   0.b		; 80 00
	cpx #$E000.w		; E0 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	cpx #$00E0.w		; E0 E0 00
	bra   0.b		; 80 00
	cpx #$E000.w		; E0 00 E0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	bra   0.b		; 80 00
	cpx #$043D.w		; E0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F0C.l,X		; FF 0C 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $002F00.l,X		; 3F 00 2F 00
	and ($00.b,S),Y		; 33 00
	bmi   0.b		; 30 00
	bra  12.b		; 80 0C
	rti		; 40

	brk $41.b		; 00 41
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	tsb $0F00.w		; 0C 00 0F
	cpx #$C040.w		; E0 40 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rts		; 60

	rti		; 40

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FB.b		; 00 FB
	asl A		; 0A
	txy		; 9B
	lda $FFFF.w		; AD FF FF
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l		; 0F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F0F.w,X		; FD 0F 7F
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $FD.b		; 00 FD
	cop $40.b		; 02 40
	ora $C0.b,S		; 03 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	beq -16.b		; F0 F0
	bra -64.b		; 80 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $D0.b		; 00 D0
	jsr $30C0.w		; 20 C0 30
	and $7A04.w,X		; 3D 04 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F02.l,X		; 7F 02 3F 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $001300.l,X		; 1F 00 13 00
	ora $1800.w,Y		; 19 00 18
	brk $40.b		; 00 40
	ora $20.b,S		; 03 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	tsb $0600.w		; 0C 00 06
	brk $07.b		; 00 07
	beq  16.b		; F0 10
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	jsr $0000.w		; 20 00 00
	rts		; 60

	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $40.b		; 00 40
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FB.b		; 00 FB
	phd		; 0B
	txy		; 9B
	lda $FFFF.w		; AD FF FF
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l		; 0F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $7F0F.w,X		; FE 0F 7F
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	ora ($70.b,X)		; 01 70
	ora ($E0.b,X)		; 01 E0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpx #$00E0.w		; E0 E0 00
	cpx #$F800.w		; E0 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$043D.w		; E0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $001700.l,X		; 1F 00 17 00
	ora $1A00.w,Y		; 19 00 1A
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	php		; 08
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	beq -64.b		; F0 C0
	beq   0.b		; F0 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cpy #$0000.w		; C0 00 00
	jsr $2000.w		; 20 00 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FB.b		; 00 FB
	phd		; 0B
	txy		; 9B
	lda $FFFF.w		; AD FF FF
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l		; 0F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $7F0F.w,X		; FE 0F 7F
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	ora ($70.b,X)		; 01 70
	ora ($E0.b,X)		; 01 E0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpx #$00E0.w		; E0 E0 00
	cpx #$F800.w		; E0 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$043D.w		; E0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $001700.l,X		; 1F 00 17 00
	ora $1A00.w,Y		; 19 00 1A
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	php		; 08
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	beq -64.b		; F0 C0
	beq   0.b		; F0 00
	cpx #$A000.w		; E0 00 A0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cpy #$0000.w		; C0 00 00
	jsr $6000.w		; 20 00 60
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FB.b		; 00 FB
	phd		; 0B
	txy		; 9B
	lda $FFFF.w		; AD FF FF
	txy		; 9B
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FB.b		; 00 FB
	sbc $02FFAB.l,X		; FF AB FF 02
	tsb $0000.w		; 0C 00 00
	ora $007F00.l		; 0F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $7F0F.w,X		; FE 0F 7F
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	ora ($70.b,X)		; 01 70
	ora ($E0.b,X)		; 01 E0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpx #$00E0.w		; E0 E0 00
	cpx #$F800.w		; E0 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$043D.w		; E0 3D 04
	ply		; 7A
	php		; 08
	sbc ($10.b)		; F2 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0001.w		; 0C 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $001700.l,X		; 1F 00 17 00
	ora $1A00.w,Y		; 19 00 1A
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	php		; 08
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	beq -64.b		; F0 C0
	beq   0.b		; F0 00
	cpx #$2000.w		; E0 00 20
	brk $A0.b		; 00 A0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cpy #$0000.w		; C0 00 00
	jsr $E000.w		; 20 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $28.b		; 00 28
	.db $42, $93		; 42 93
	inc $002D.w,X		; FE 2D 00
	sta ($FF.b,S),Y		; 93 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	and $9300.w,X		; 3D 00 93
	sbc $000C02.l,X		; FF 02 0C 00
	brk $2E.b		; 00 2E
	brk $A3.b		; 00 A3
	sbc $000C04.l,X		; FF 04 0C 00
	brk $3E.b		; 00 3E
	brk $A3.b		; 00 A3
	sbc $000C06.l,X		; FF 06 0C 00
	brk $2D.b		; 00 2D
	brk $B3.b		; 00 B3
	sbc $000C08.l,X		; FF 08 0C 00
	brk $3D.b		; 00 3D
	brk $B3.b		; 00 B3
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $2B.b		; 00 2B
	brk $C3.b		; 00 C3
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $3B.b		; 00 3B
	brk $C3.b		; 00 C3
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $2D.b		; 00 2D
	brk $D3.b		; 00 D3
	sbc $000C20.l,X		; FF 20 0C 00
	brk $3D.b		; 00 3D
	brk $D3.b		; 00 D3
	sbc $000C22.l,X		; FF 22 0C 00
	brk $2F.b		; 00 2F
	brk $E3.b		; 00 E3
	sbc $000C24.l,X		; FF 24 0C 00
	brk $28.b		; 00 28
	brk $F3.b		; 00 F3
	sbc $000C26.l,X		; FF 26 0C 00
	brk $38.b		; 00 38
	brk $F3.b		; 00 F3
	sbc $000C28.l,X		; FF 28 0C 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	tsb $0A.b		; 04 0A
	asl A		; 0A
	tsb $04.b		; 04 04
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	ora $010007.l		; 0F 07 00 01
	ora ($03.b,X)		; 01 03
	brk $03.b		; 00 03
	ora $01.b		; 05 01
	phd		; 0B
	ora ($08.b,X)		; 01 08
	adc $07FFFF.l,X		; 7F FF FF 07
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $70.b		; 00 70
	brk $04.b		; 00 04
	brk $FB.b		; 00 FB
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ror $E0E0.w,X		; 7E E0 E0
	beq -16.b		; F0 F0
	tya		; 98
	sed		; F8
	sty $F8FC.w		; 8C FC F8
	jsr ($FF04.w,X)		; FC 04 FF
	sbc $FE00FF.l,X		; FF FF 00 FE
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
	brk $80.b		; 00 80
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
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	trb $3F00.w		; 1C 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $02.b		; 00 02
	trb $02.b		; 14 02
	and $005F00.l		; 2F 00 5F 00
	and $002B00.l,X		; 3F 00 2B 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $20.b		; 00 20
	brk $70.b		; 00 70
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	jsr $70C0.w		; 20 C0 70
	bra  -4.b		; 80 FC
	brk $EF.b		; 00 EF
	brk $87.b		; 00 87
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	and $003F00.l,X		; 3F 00 3F 00
	and $003B00.l,X		; 3F 00 3B 00
	and $003F00.l,X		; 3F 00 3F 00
	and $063700.l,X		; 3F 00 37 06
	brk $26.b		; 00 26
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	tsb $04.b		; 04 04
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	trb $3E00.w		; 1C 00 3E
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
	php		; 08
	beq  56.b		; F0 38
	cpy #$00F8.w		; C0 F8 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $EC.b		; 00 EC
	brk $1C.b		; 00 1C
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $78.b		; 00 78
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $0C.b		; 00 0C
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F20.w,X		; 3D 20 1F
	rts		; 60

	ora $E21565.l		; 0F 65 15 E2
	bmi -27.b		; 30 E5
	adc $C2.b,X		; 75 C2
	eor $025FC0.l,X		; 5F C0 5F 02
	cop $33.b		; 02 33
	brk $6F.b		; 00 6F
	bpl 114.b		; 10 72
	php		; 08
	and [$CA.b],Y		; 37 CA
	jsl $E520C8.l		; 22 C8 20 E5
	adc $A0.b,S		; 63 A0
	ora $FD.b,S		; 03 FD
	ora $FF.b,S		; 03 FF
	ora $FC.b,S		; 03 FC
	lda $A1.b,S		; A3 A1
	lda ($A2.b,X)		; A1 A2
	ldy #$80BF.w		; A0 BF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $1C.b,S		; 03 1C
	ora $FC.b,S		; 03 FC
	ora $61.b,S		; 03 61
	dec $DF62.w,X		; DE 62 DF
	adc $C3.b,S		; 63 C3
	ora $83.b,S		; 03 83
	ora $03.b,S		; 03 03
	ldy $BCC0.w,X		; BC C0 BC
	cpy #$C88C.w		; C0 8C C8
	dey		; 88
	pha		; 48
	beq   0.b		; F0 00
	jsr ($7C00.w,X)		; FC 00 7C
	brk $3C.b		; 00 3C
	brk $44.b		; 00 44
	bra -60.b		; 80 C4
	brk $F4.b		; 00 F4
	jsr $A474.w		; 20 74 A4
	jmp $0C8C.w		; 4C 8C 0C
	brk $84.b		; 00 84
	bra -44.b		; 80 D4
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
	ora [$0B.b]		; 07 0B
	ora $000F00.l		; 0F 00 0F 00
	ora $00.b,S		; 03 00
	ora $0B0B0E.l		; 0F 0E 0B 0B
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	ora ($0C.b,X)		; 01 0C
	brk $0B.b		; 00 0B
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $09.b		; 00 09
	brk $06.b		; 00 06
	ldy $BE.b,X		; B4 BE
	plx		; FA
	asl $24EC.w		; 0E EC 24
	inx		; E8
	bit $F0.b		; 24 F0
	jmp ($04F0.w)		; 6C F0 04
	cpx #$C000.w		; E0 00 C0
	brk $80.b		; 00 80
	ror $FE00.w,X		; 7E 00 FE
	brk $34.b		; 00 34
	brk $34.b		; 00 34
	brk $6C.b		; 00 6C
	brk $0C.b		; 00 0C
	brk $10.b		; 00 10
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	ora ($FC.b,X)		; 01 FC
	cop $FE.b		; 02 FE
	ora ($F5.b,X)		; 01 F5
	ora ($FF.b,X)		; 01 FF
	brk $7F.b		; 00 7F
	brk $77.b		; 00 77
	dey		; 88
	brk $8D.b		; 00 8D
	tsb $8B.b		; 04 8B
	ora ($09.b,X)		; 01 09
	brk $0A.b		; 00 0A
	ora #$0008.w		; 09 08 00
	php		; 08
	brk $08.b		; 00 08
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor $7F.b,S		; 43 7F
	cmp [$FF.b]		; C7 FF
	.db $42, $7F		; 42 7F
	bra  -2.b		; 80 FE
	ora ($FD.b,X)		; 01 FD
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	.db $82, $43, $05		; 82 43 05
	eor [$82.b]		; 47 82
	.db $42, $01		; 42 01
	bra  18.b		; 80 12
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	bra -16.b		; 80 F0
	brk $F0.b		; 00 F0
	bra  -8.b		; 80 F8
	cpy #$00F8.w		; C0 F8 00
	sed		; F8
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	bra -16.b		; 80 F0
	brk $78.b		; 00 78
	bra  56.b		; 80 38
	rti		; 40

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
	and $007F00.l,X		; 3F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $08FF00.l,X		; FF 00 FF 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $EC.b		; 00 EC
	brk $EC.b		; 00 EC
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $68.b		; 00 68
	brk $68.b		; 00 68
	brk $F8.b		; 00 F8
	brk $0C.b		; 00 0C
	bpl  12.b		; 10 0C
	bpl  12.b		; 10 0C
	bpl  12.b		; 10 0C
	bpl  12.b		; 10 0C
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl  24.b		; 10 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $803F80.l,X		; 3F 80 3F 80
	and $803F80.l,X		; 3F 80 3F 80
	ora $003F80.l,X		; 1F 80 3F 00
	and $623F00.l,X		; 3F 00 3F 62
	cpy #$C062.w		; C0 62 C0
	.db $62, $C0, $43		; 62 C0 43
	cpy #$C043.w		; C0 43 C0
	adc $C0.b,S		; 63 C0
	adc $40.b,S		; 63 40
	adc ($40.b,X)		; 61 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ldy $FC00.w,X		; BC 00 FC
	brk $78.b		; 00 78
	bra 120.b		; 80 78
	bra  48.b		; 80 30
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	eor $1741.w,X		; 5D 41 17
	ora $23.b,S		; 03 23
	ora $4F.b,S		; 03 4F
	ora [$7E.b]		; 07 7E
	asl $1C7C.w		; 0E 7C 1C
	jmp ($F81C.w,X)		; 7C 1C F8
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	.db $82, $00, $02		; 82 00 02
	brk $42.b		; 00 42
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $00.b		; 00 00
	inc $FC00.w,X		; FE 00 FC
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E1.b		; 00 E1
	brk $C3.b		; 00 C3
	brk $87.b		; 00 87
	brk $0F.b		; 00 0F
	ora $0F0D.w		; 0D 0D 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $3C1E1E.l		; 0F 1E 1E 3C
	bit $7C7C.w,X		; 3C 7C 7C
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sty $00.b		; 84 00
	sty $00.b		; 84 00
	sty $00.b		; 84 00
	sty $00.b		; 84 00
	stx $00.b		; 86 00
	.db $82, $00, $82		; 82 00 82
	brk $82.b		; 00 82
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	and ($30.b)		; 32 30
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	trb $701C.w		; 1C 1C 70
	bvs   0.b		; 70 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	tas		; 1B
	ora $FFFF6F.l,X		; 1F 6F FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	bcc -109.b		; 90 93
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	ora ($11.b),Y		; 11 11
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	jsr ($F0F0.w,X)		; FC F0 F0
	rts		; 60

	sbc [$E7.b],Y		; F7 E7
	sbc [$F7.b],Y		; F7 F7
	sbc $EEFFF7.l,X		; FF F7 FF EE
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $78.b		; 00 78
	bra -128.b		; 80 80
	ldy #$A0A0.w		; A0 A0 A0
	ldy #$3034.w		; A0 34 30
	bit $30.b,X		; 34 30
	bit $30.b,X		; 34 30
	bit $30.b,X		; 34 30
	sed		; F8
	bcs -16.b		; B0 F0
	bvs -16.b		; 70 F0
	bvc  -8.b		; 50 F8
	cli		; 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $7E.b		; 00 7E
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	eor ($01.b,X)		; 41 01
	eor ($01.b,X)		; 41 01
	eor $03.b,S		; 43 03
	eor $03.b,S		; 43 03
	eor ($00.b,X)		; 41 00
	and ($00.b,X)		; 21 00
	and ($00.b,X)		; 21 00
	and ($00.b,X)		; 21 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx $CCEC.w		; EC EC CC
	cpy $0C0C.w		; CC 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	ora $0D0C.w		; 0D 0C 0D
	tsb $8000.w		; 0C 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	.db $82, $00, $82		; 82 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	and ($30.b)		; 32 30
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	inc A		; 1A
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFCFF.l,X		; FF FF FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and #$3929.w		; 29 29 39
	and $7050.w,Y		; 39 50 70
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $467FD6.l,X		; FF D6 7F 46
	ora $3E7E7F.l		; 0F 7F 7E 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	cld		; D8
	sed		; F8
	sed		; F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $18.b		; 00 18
	and $18CCB4.l		; 2F B4 CC 18
	brk $BC.b		; 00 BC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $28.b		; 00 28
	brk $B4.b		; 00 B4
	sbc $000C02.l,X		; FF 02 0C 00
	brk $28.b		; 00 28
	brk $C4.b		; 00 C4
	sbc $000C04.l,X		; FF 04 0C 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	asl $1AFA.w		; 0E FA 1A
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $003F00.l		; 0F 00 3F 00
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	php		; 08
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($02.b,X)		; 01 02
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($1E.b,X)		; 01 1E
	ora ($7E.b,X)		; 01 7E
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $0C.b,S		; 03 0C
	ora ($0C.b,X)		; 01 0C
	cop $1C.b		; 02 1C
	asl $1C.b		; 06 1C
	asl $0B18.w		; 0E 18 0B
	clc		; 18
	phd		; 0B
	bpl   7.b		; 10 07
	asl $00.b		; 06 00
	ora $0E02.w		; 0D 02 0E
	ora ($06.b,X)		; 01 06
	ora $1904.w,Y		; 19 04 19
	tsb $1C.b		; 04 1C
	tsb $0C14.w		; 0C 14 0C
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
	brk $00.b		; 00 00
	sbc $1B3F10.l,X		; FF 10 3F 1B
	ora $00070E.l		; 0F 0E 07 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	jsr $0000.w		; 20 00 00
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	trb $06FE.w		; 1C FE 06
	sbc $02FF02.l,X		; FF 02 FF 02
	inc $36.b,X		; F6 36
	jsr ($F01C.w,X)		; FC 1C F0
	brk $70.b		; 00 70
	brk $A0.b		; 00 A0
	brk $48.b		; 00 48
	brk $B0.b		; 00 B0
	brk $45.b		; 00 45
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $F0.b,S		; 03 F0
	ora [$C0.b]		; 07 C0
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $3C.b		; 00 3C
	brk $70.b		; 00 70
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
	brk $10.b		; 00 10
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	bpl  47.b		; 10 2F
	lda #$10CC.w		; A9 CC 10
	brk $BD.b		; 00 BD
	sbc $000C00.l,X		; FF 00 0C 00
	brk $20.b		; 00 20
	brk $BD.b		; 00 BD
	sbc $000C02.l,X		; FF 02 0C 00
	brk $10.b		; 00 10
	brk $AD.b		; 00 AD
	sbc $000C04.l,X		; FF 04 0C 00
	brk $20.b		; 00 20
	brk $AD.b		; 00 AD
	sbc $000C06.l,X		; FF 06 0C 00
	brk $2D.b		; 00 2D
	brk $9D.b		; 00 9D
	sbc $000C08.l,X		; FF 08 0C 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $38.b		; 00 38
	brk $18.b		; 00 18
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	brk $C1.b		; 00 C1
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
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E1.b		; 00 E1
	ora ($E1.b,X)		; 01 E1
	ora ($F0.b,X)		; 01 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$2020.w		; E0 20 20
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $000F00.l		; 0F 00 0F 00
	ora $001F00.l		; 0F 00 1F 00
	ora $7C0F10.l,X		; 1F 10 0F 7C
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($0C.b,X)		; 01 0C
	cop $1C.b		; 02 1C
	asl $1C.b		; 06 1C
	asl $0B18.w		; 0E 18 0B
	clc		; 18
	phd		; 0B
	bpl   7.b		; 10 07
	bpl   7.b		; 10 07
	ora $0E02.w		; 0D 02 0E
	ora ($06.b,X)		; 01 06
	ora $1904.w,Y		; 19 04 19
	tsb $1C.b		; 04 1C
	tsb $0C14.w		; 0C 14 0C
	clc		; 18
	tsb $F018.w		; 0C 18 F0
	brk $F9.b		; 00 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F8.b,X)		; 01 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	cpy #$223F.w		; C0 3F 22
	and ($22.b)		; 32 22
	rol $36.b,X		; 36 36
	trb $801C.w		; 1C 1C 80
	brk $20.b		; 00 20
	brk $38.b		; 00 38
	brk $0F.b		; 00 0F
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	ora $FE.b,S		; 03 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FC.b,X)		; 01 FC
	ora ($F0.b,X)		; 01 F0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $12.b,S		; 03 12
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $1E.b		; 00 1E
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $10.b		; 00 10
	and $10CBA7.l		; 2F A7 CB 10
	brk $A7.b		; 00 A7
	sbc $000C00.l,X		; FF 00 0C 00
	brk $20.b		; 00 20
	brk $A7.b		; 00 A7
	sbc $000C02.l,X		; FF 02 0C 00
	brk $10.b		; 00 10
	brk $B7.b		; 00 B7
	sbc $000C04.l,X		; FF 04 0C 00
	brk $20.b		; 00 20
	brk $B7.b		; 00 B7
	sbc $000C06.l,X		; FF 06 0C 00
	brk $1D.b		; 00 1D
	brk $C7.b		; 00 C7
	sbc $000C08.l,X		; FF 08 0C 00
	brk $2D.b		; 00 2D
	brk $C7.b		; 00 C7
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	sec		; 38
	tsb $0C0C.w		; 0C 0C 0C
	tsb $4C.b		; 04 4C
	mvp $60,$7C		; 44 7C 60
	rol $3F30.w,X		; 3E 30 3F
	brk $3F.b		; 00 3F
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	php		; 08
	brk $18.b		; 00 18
	brk $20.b		; 00 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	ora $011F00.l,X		; 1F 00 1F 01
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	ora ($E0.b,X)		; 01 E0
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $F8.b,S		; 03 F8
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $1E.b		; 00 1E
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $2C.b		; 00 2C
	brk $24.b		; 00 24
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	cop $01.b		; 02 01
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpy #$C080.w		; C0 80 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8020.w		; C0 20 80
	jsr $8080.w		; 20 80 80
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
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
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
	brk $3F.b		; 00 3F
	bit $3F.b		; 24 3F
	jsl $1C3233.l		; 22 33 32 1C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b)		; 12 00
	trb $0100.w		; 1C 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $41.b		; 00 41
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	and $603F00.l,X		; 3F 00 3F 60
	ora $F80FF0.l,X		; 1F F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $96.b		; 00 96
	brk $0E.b		; 00 0E
	brk $8E.b		; 00 8E
	brk $0E.b		; 00 0E
	brk $1E.b		; 00 1E
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $18.b		; 00 18
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	brk $C1.b		; 00 C1
	brk $30.b		; 00 30
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $BC.b		; 00 BC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora $0C.b,S		; 03 0C
	ora ($0C.b,X)		; 01 0C
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $0D.b		; 00 0D
	cop $0E.b		; 02 0E
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
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $18.b		; 00 18
	and $1ECC9C.l		; 2F 9C CC 1E
	brk $9C.b		; 00 9C
	sbc $000C00.l,X		; FF 00 0C 00
	brk $2E.b		; 00 2E
	brk $9C.b		; 00 9C
	sbc $000C02.l,X		; FF 02 0C 00
	brk $22.b		; 00 22
	brk $AC.b		; 00 AC
	sbc $000C04.l,X		; FF 04 0C 00
	brk $18.b		; 00 18
	brk $BC.b		; 00 BC
	sbc $000C06.l,X		; FF 06 0C 00
	brk $2B.b		; 00 2B
	brk $BC.b		; 00 BC
	sbc $000C08.l,X		; FF 08 0C 00
	brk $2B.b		; 00 2B
	brk $CC.b		; 00 CC
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $0C.b		; 00 0C
	tsb $0606.w		; 0C 06 06
	jsl $222A22.l		; 22 22 2A 22
	bit $3C34.w,X		; 3C 34 3C
	bpl 124.b		; 10 7C
	brk $7C.b		; 00 7C
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $10.b		; 00 10
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	ora ($78.b,X)		; 01 78
	ora ($7C.b,X)		; 01 7C
	ora ($7F.b,X)		; 01 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	jmp ($FC00.w,X)		; 7C 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	cpy #$E03C.w		; C0 3C E0
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $58.b		; 00 58
	brk $E8.b		; 00 E8
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  56.b		; 80 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

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
	jmp ($7C00.w,X)		; 7C 00 7C
	brk $FE.b		; 00 FE
	dey		; 88
	stx $DE88.w		; 8E 88 DE
	cld		; D8
	adc $000F70.l,X		; 7F 70 0F 00
	ora $005000.l		; 0F 00 50 00
	jsr $5200.w		; 20 00 52
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $23.b		; 00 23
	brk $23.b		; 00 23
	brk $17.b		; 00 17
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	tsb $C0.b		; 04 C0
	tsb $80.b		; 04 80
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $E0.b		; 04 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $30.b		; 00 30
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $BC.b		; 00 BC
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	clc		; 18
	rts		; 60

	php		; 08
	rts		; 60

	bpl -32.b		; 10 E0
	bmi -32.b		; 30 E0
	bvs -64.b		; 70 C0
	cli		; 58
	cpy #$8058.w		; C0 58 80
	sec		; 38
	bmi   0.b		; 30 00
	pla		; 68
	bpl 112.b		; 10 70
	php		; 08
	bmi -56.b		; 30 C8
	jsr $20C8.w		; 20 C8 20
	cpx #$A060.w		; E0 60 A0
	rts		; 60

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	clc		; 18
	and [$A6.b],Y		; 37 A6
	wai		; CB
	plp		; 28
	brk $A6.b		; 00 A6
	sbc $000C00.l,X		; FF 00 0C 00
	brk $18.b		; 00 18
	brk $B6.b		; 00 B6
	sbc $000C02.l,X		; FF 02 0C 00
	brk $28.b		; 00 28
	brk $B6.b		; 00 B6
	sbc $000C04.l,X		; FF 04 0C 00
	brk $1C.b		; 00 1C
	brk $C6.b		; 00 C6
	sbc $000C06.l,X		; FF 06 0C 00
	brk $2C.b		; 00 2C
	brk $C6.b		; 00 C6
	sbc $000C08.l,X		; FF 08 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	ora $001F00.l,X		; 1F 00 1F 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	adc ($00.b),Y		; 71 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $05EB00.l,X		; FF 00 EB 05
	sbc ($51.b),Y		; F1 51
	asl A		; 0A
	lda $007F00.l,X		; BF 00 7F 00
	inc $AC00.w,X		; FE 00 AC
	brk $20.b		; 00 20
	brk $34.b		; 00 34
	bpl  46.b		; 10 2E
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $CE.b		; 00 CE
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($7C03.w,X)		; 7C 03 7C
	ora $7C.b,S		; 03 7C
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $F8.b,S		; 03 F8
	ora $F8.b,S		; 03 F8
	ora $06.b,S		; 03 06
	brk $06.b		; 00 06
	brk $0E.b		; 00 0E
	brk $3E.b		; 00 3E
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	cmp $00FF00.l,X		; DF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $20FF00.l,X		; FF 00 FF 20
	jsr $0020.w		; 20 20 00
	jsr $6000.w		; 20 00 60
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	brk $41.b		; 00 41
	brk $FB.b		; 00 FB
	brk $6F.b		; 00 6F
	ora $1F.b,S		; 03 1F
	ora ($1F.b,X)		; 01 1F
	ora ($1F.b,X)		; 01 1F
	tas		; 1B
	ora $00000E.l		; 0F 0E 00 00
	brk $00.b		; 00 00
	tay		; A8
	tsb $48.b		; 04 48
	bpl  22.b		; 10 16
	brk $12.b		; 00 12
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F1.b		; 00 F1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $CB.b		; 00 CB
	pld		; 2B
	cmp $61.b		; C5 61
	wai		; CB
	xba		; EB
	sta $BF.b		; 85 BF
	bra -65.b		; 80 BF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $11.b		; E4 11
	ror $4495.w		; 6E 95 44
	sta ($40.b),Y		; 91 40
	wai		; CB
	dec $40.b		; C6 40
	cpy $80.b		; C4 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bvs   0.b		; 70 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bcs -64.b		; B0 C0
	bcs -64.b		; B0 C0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $003F00.l,X		; 3F 00 3F 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $383F00.l,X		; FF 00 3F 38
	ora [$3C.b]		; 07 3C
	ora $20.b,S		; 03 20
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $02.b		; 00 02
	brk $1B.b		; 00 1B
	brk $0E.b		; 00 0E
	brk $0B.b		; 00 0B
	xce		; FB
	ora $D5.b		; 05 D5
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bit $01.b		; 24 01
	rol A		; 2A
	and $20.b		; 25 20
	cop $20.b		; 02 20
	brk $20.b		; 00 20
	jsr $0030.w		; 20 30 00
	and ($00.b),Y		; 31 00
	jsr $FB00.w		; 20 00 FB
	tas		; 1B
	sbc ($11.b),Y		; F1 11
	sbc ($11.b),Y		; F1 11
	xce		; FB
	phd		; 0B
	plx		; FA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $3F.b		; 02 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($82.b,X)		; 01 82
	brk $C1.b		; 00 C1
	brk $31.b		; 00 31
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $DF.b		; 00 DF
	brk $BC.b		; 00 BC
	brk $E8.b		; 00 E8
	brk $DC.b		; 00 DC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bpl -61.b		; 10 C3
	jsr $400C.w		; 20 0C 40
	php		; 08
	bpl -100.b		; 10 9C
	jsr $03F0.w		; 20 F0 03
	cpx #$C003.w		; E0 03 C0
	ora [$80.b]		; 07 80
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora $0C.b,S		; 03 0C
	ora ($30.b,X)		; 01 30
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $0D.b		; 00 0D
	cop $00.b		; 02 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00BF00.l,X		; FF 00 BF 00
	sbc $41FF00.l,X		; FF 00 FF 41
	brk $43.b		; 00 43
	brk $43.b		; 00 43
	brk $41.b		; 00 41
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	adc $00.b,S		; 63 00
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
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	clc		; 18
	and $18CBA7.l		; 2F A7 CB 18
	brk $BC.b		; 00 BC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $28.b		; 00 28
	brk $BC.b		; 00 BC
	sbc $000C02.l,X		; FF 02 0C 00
	brk $28.b		; 00 28
	brk $AC.b		; 00 AC
	sbc $000C04.l,X		; FF 04 0C 00
	brk $2C.b		; 00 2C
	brk $9C.b		; 00 9C
	sbc $000C06.l,X		; FF 06 0C 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $82.b		; 00 82
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $C7.b		; 00 C7
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	ora $E0.b,S		; 03 E0
	ora [$C0.b]		; 07 C0
	ora [$80.b]		; 07 80
	ora [$00.b]		; 07 00
	ora [$0C.b]		; 07 0C
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $60.b		; 00 60
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
	ora $001F00.l,X		; 1F 00 1F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $007F00.l,X		; 3F 00 7F 00
	adc $103F00.l,X		; 7F 00 3F 10
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $BF.b		; 00 BF
	.db $82, $CF, $C0		; 82 CF C0
	adc [$60.b]		; 67 60
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rep #$00		; C2 00
	and ($00.b),Y		; 31 00
	ora #$0600.w		; 09 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	inx		; E8
	dey		; 88
	inx		; E8
	dey		; 88
	sed		; F8
	tya		; 98
	bvs 112.b		; 70 70
	tsb $00.b		; 04 00
	tsb $9C00.w		; 0C 00 9C
	brk $A7.b		; 00 A7
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $0C.b,S		; 03 0C
	ora ($0C.b,X)		; 01 0C
	cop $1C.b		; 02 1C
	asl $1C.b		; 06 1C
	asl $0B18.w		; 0E 18 0B
	clc		; 18
	phd		; 0B
	bpl   7.b		; 10 07
	asl $00.b		; 06 00
	ora $0E02.w		; 0D 02 0E
	ora ($06.b,X)		; 01 06
	ora $1904.w,Y		; 19 04 19
	tsb $1C.b		; 04 1C
	tsb $0C14.w		; 0C 14 0C
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
	brk $00.b		; 00 00
	bmi  15.b		; 30 0F
	bit $3C03.w,X		; 3C 03 3C
	ora $3C.b,S		; 03 3C
	ora $7C.b,S		; 03 7C
	ora $7C.b,S		; 03 7C
	ora $7C.b,S		; 03 7C
	ora $FC.b,S		; 03 FC
	ora $03.b,S		; 03 03
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $1E.b		; 00 1E
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $40.b		; 00 40
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $18.b		; 00 18
	and [$A6.b],Y		; 37 A6
	wai		; CB
	clc		; 18
	brk $BC.b		; 00 BC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $28.b		; 00 28
	brk $BC.b		; 00 BC
	sbc $000C02.l,X		; FF 02 0C 00
	brk $28.b		; 00 28
	brk $AC.b		; 00 AC
	sbc $000C04.l,X		; FF 04 0C 00
	brk $2C.b		; 00 2C
	brk $9C.b		; 00 9C
	sbc $000C06.l,X		; FF 06 0C 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $83.b		; 00 83
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $11.b		; 00 11
	brk $E7.b		; 00 E7
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	ora $E0.b,S		; 03 E0
	ora [$C0.b]		; 07 C0
	ora [$80.b]		; 07 80
	ora [$00.b]		; 07 00
	ora [$0C.b]		; 07 0C
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40BF00.l,X		; FF 00 BF 40
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $43.b		; 00 43
	brk $43.b		; 00 43
	brk $41.b		; 00 41
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xba		; EB
	ora $F1.b		; 05 F1
	phd		; 0B
	xce		; FB
	ora $D5.b		; 05 D5
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	bit $10.b,X		; 34 10
	rol $2405.w		; 2E 05 24
	ora ($2A.b,X)		; 01 2A
	and $20.b		; 25 20
	cop $20.b		; 02 20
	brk $20.b		; 00 20
	jsr $0030.w		; 20 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003D00.l,X		; FF 00 3D 00
	ora #$0300.w		; 09 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	brk $33.b		; 00 33
	brk $3E.b		; 00 3E
	brk $1E.b		; 00 1E
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $8E.b		; 00 8E
	brk $0C.b		; 00 0C
	brk $98.b		; 00 98
	brk $5F.b		; 00 5F
	brk $A8.b		; 00 A8
	brk $E8.b		; 00 E8
	brk $D8.b		; 00 D8
	brk $70.b		; 00 70
	brk $04.b		; 00 04
	ora $0C.b,S		; 03 0C
	ora ($0C.b,X)		; 01 0C
	cop $1C.b		; 02 1C
	asl $1C.b		; 06 1C
	asl $0B18.w		; 0E 18 0B
	clc		; 18
	phd		; 0B
	bpl   7.b		; 10 07
	asl $00.b		; 06 00
	ora $0E02.w		; 0D 02 0E
	ora ($06.b,X)		; 01 06
	ora $1904.w,Y		; 19 04 19
	tsb $1C.b		; 04 1C
	tsb $0C14.w		; 0C 14 0C
	clc		; 18
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ldy $B4.b,X		; B4 B4
	mvn $B4,$14		; 54 14 B4
	lda [$50.b],Y		; B7 50
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0063.l,X		; FF 63 00 FF
	brk $4C.b		; 00 4C
	tas		; 1B
	cpx $4C5B.w		; EC 5B 4C
	clc		; 18
	brk $B0.b		; 00 B0
	rts		; 60

	brk $40.b		; 00 40
	brk $30.b		; 00 30
	ora $3C033C.l		; 0F 3C 03 3C
	ora $3C.b,S		; 03 3C
	ora $7C.b,S		; 03 7C
	ora $7C.b,S		; 03 7C
	ora $7C.b,S		; 03 7C
	ora $FC.b,S		; 03 FC
	ora $03.b,S		; 03 03
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $1E.b		; 00 1E
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $00FF00.l,X		; DF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $31FF00.l,X		; BF 00 FF 31
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	jsr $0020.w		; 20 20 00
	jsr $6000.w		; 20 00 60
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $003F00.l,X		; 1F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $05.b		; 00 05
	brk $1B.b		; 00 1B
	brk $27.b		; 00 27
	brk $4F.b		; 00 4F
	brk $8A.b		; 00 8A
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bpl   0.b		; 10 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ldy #$00F0.w		; A0 F0 00
	beq   0.b		; F0 00
	cpx #$C000.w		; E0 00 C0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bra   4.b		; 80 04
	brk $31.b		; 00 31
	and [$9F.b],Y		; 37 9F
	lda ($31.b,X)		; A1 31
	brk $9F.b		; 00 9F
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FE.b		; 00 FE
	inc $1E.b		; E6 1E
	bpl  62.b		; 10 3E
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E0.b		; E6 E0
	bpl  64.b		; 10 40
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc $1F7C1F.l,X		; 7F 1F 7C 1F
	jmp ($7C1F.w,X)		; 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	sbc $00087E.l		; EF 7E 08 00
	tsb $1100.w		; 0C 00 11
	brk $16.b		; 00 16
	brk $B8.b		; 00 B8
	trb $BA.b		; 14 BA
	and $BD.b,X		; 35 BD
	lsr $1F.b,X		; 56 1F
	brk $1F.b		; 00 1F
	jmp ($7C1F.w,X)		; 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $00007C.l,X		; 1F 7C 00 00
	brk $00.b		; 00 00
	and ($04.b,X)		; 21 04
	sty $10.b		; 84 10
	dec $18.b		; C6 18
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $35AD.w		; 2D AD 35
	sbc $46313D.l		; EF 3D 31 46
	sty $52.b,X		; 94 52
	dec $5A.b,X		; D6 5A
	clc		; 18
	adc $7B.b,S		; 63 7B
	adc $FF77BD.l		; 6F BD 77 FF
	adc $600000.l,X		; 7F 00 00 60
	clc		; 18
	ldy #$E124.w		; A0 24 E1
	bmi  67.b		; 30 43
	eor ($C7.b,X)		; 41 C7
	eor $5E6E.w		; 4D 6E 5E
	rol $6F.b,X		; 36 6F
	eor $3EDF5F.l,X		; 5F 5F DF 3E
	and $01BF1E.l,X		; 3F 1E BF 01
	ply		; 7A
	ora ($14.b,X)		; 01 14
	ora ($CF.b,X)		; 01 CF
	brk $8A.b		; 00 8A
	brk $1F.b		; 00 1F
	jmp ($00E7.w,X)		; 7C E7 00
	lda $7301.w		; AD 01 73
	cop $39.b		; 02 39
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	pld		; 2B
	sbc $7FFF53.l,X		; FF 53 FF 7F
	sbc [$5F.b],Y		; F7 5F
	sbc $1FE73F.l		; EF 3F E7 1F
	cpx #$0003.w		; E0 03 00
	ora $20.b,S		; 03 20
	cop $40.b		; 02 40
	ora ($1F.b,X)		; 01 1F
	jmp ($0000.w,X)		; 7C 00 00
	lda [$0C.b]		; A7 0C
	adc $32171D.l		; 6F 1D 17 32
	cmp $573F42.l,X		; DF 42 3F 57
	sta $7FFF6B.l,X		; 9F 6B FF 7F
	xba		; EB
	trb $60.b		; 14 60
	clc		; 18
	sbc ($30.b,X)		; E1 30
	eor $41.b,S		; 43 41
	cmp [$4D.b]		; C7 4D
	ror $365E.w		; 6E 5E 36
	adc $007C1F.l		; 6F 1F 7C 00
	brk $63.b		; 00 63
	tsb $18C6.w		; 0C C6 18
	lsr A		; 4A
	and #$35AD.w		; 29 AD 35
	and ($46.b),Y		; 31 46
	sty $52.b,X		; 94 52
	clc		; 18
	adc $9C.b,S		; 63 9C
	adc ($08.b,S),Y		; 73 08
	brk $11.b		; 00 11
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	jmp ($7C1F.w,X)		; 7C 1F 7C
	ora $FB267C.l,X		; 1F 7C 26 FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	eor [$D6.b]		; 47 D6
	tad		; 5B
	ora $49.b,X		; 15 49
	bcc  24.b		; 90 18
	.db $82, $CA, $41		; 82 CA 41
	clv		; B8
	bit $D5.b,X		; 34 D5
	cmp #$4818.w		; C9 18 48
	rol $81.b,X		; 36 81
	cld		; D8
	pei ($4B.b)		; D4 4B
	and $0A.b,S		; 23 0A
	ora $1C4D.w		; 0D 4D 1C
	rol $74.b,X		; 36 74
	sbc ($69.b),Y		; F1 69
	ora ($32.b),Y		; 11 32
	tyx		; BB
	cmp [$B8.b]		; C7 B8
	bcc 124.b		; 90 7C
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	tsb $68.b		; 04 68
	ldx $41.b		; A6 41
	stz $11.b,X		; 74 11
	eor $52.b,S		; 43 52
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$1934.w		; 49 34 19
	lda $48BB.w		; AD BB 48
	tsb $6964.w		; 0C 64 69
	asl A		; 0A
	rol $4D.b,X		; 36 4D
	and $1B.b,S		; 23 1B
	rol $D1.b,X		; 36 D1
	ldx $D537.w,Y		; BE 37 D5
	phb		; 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	dec $D1.b		; C6 D1
	lda $459A32.l,X		; BF 32 9A 45
	lda [$F6.b],Y		; B7 F6
	cmp $B6.b,X		; D5 B6
	bvs  11.b		; 70 0B
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $AD.b,X		; D5 AD
	plb		; AB
	jmp ($5AE0.w)		; 6C E0 5A
	eor $B6.b		; 45 B6
	inc $7209.w		; EE 09 72
	sbc $CB.b		; E5 CB
	sta [$2E.b],Y		; 97 2E
	jmp $E572B9.l		; 5C B9 72 E5
	wai		; CB
	sta [$2E.b],Y		; 97 2E
	jmp $E772B9.l		; 5C B9 72 E7
	asl $E1.b		; 06 E1
	ora $226D.w,Y		; 19 6D 22
	jmp.w [$862B]		; DC 2B 86
	bvs -20.b		; 70 EC
	sty $8C8C.w		; 8C 8C 8C
	sta $31C3.w		; 8D C3 31
	txs		; 9A
	cmp $B366.w		; CD 66 B3
	jmp $913143.l		; 5C 43 31 91
	sta ($91.b),Y		; 91 91
	sta ($B8.b),Y		; 91 B8
	adc [$33.b]		; 67 33
	phx		; DA
	lsr $34.b		; 46 34
	ora [$B8.b],Y		; 17 B8
	sta [$14.b],Y		; 97 14
	jmp.w [$B6B8]		; DC B8 B6
	sbc $C6.b		; E5 C6
	and ($1C.b,S),Y		; 33 1C
	rtl		; 6B

	stx $ED71.w		; 8E 71 ED
	ora [$20.b],Y		; 17 20
	cpx $5C.b		; E4 5C
	sta ($72.b,S),Y		; 93 72
	cpx $DC.b		; E4 DC
	lda $95.b,S		; A3 95
	adc [$33.b]		; 67 33
	phx		; DA
	lsr $34.b		; 46 34
	ora [$B7.b],Y		; 17 B7
	lsr $CB59.w		; 4E 59 CB
	lda $3985.w,Y		; B9 85 39
	stx $63.b,Y		; 96 63
	ora [$34.b]		; 07 34
	inc $DC.b		; E6 DC
	sbc $9D.b,S		; E3 9D
	adc ($CC.b,S),Y		; 73 CC
	mvn $83,$D2		; 54 D2 83
	sbc [$3E.b]		; E7 3E
	nop		; EA
	jmp $7BE6.w		; 4C E6 7B
	lda #$A3BA.w		; A9 BA A3
	tax		; AA
	tsx		; BA
	bcs   0.b		; B0 00
	bit $17.b,X		; 34 17
	lda [$4E.b],Y		; B7 4E
	ldx $0EEB.w		; AE EB 0E
	lda ($EB.b)		; B2 EB
	lsr $CCB6.w		; 4E B6 CC
	adc $C7.b,X		; 75 C7
	eor $E775.w,X		; 5D 75 E7
	eor $610776.l,X		; 5F 76 07 61
	ror $27.b,X		; 76 27
	adc $76.b,S		; 63 76
	eor [$65.b]		; 47 65
	ror $66.b,X		; 76 66
	adc ($3D.b,S),Y		; 73 3D
	cmp $A1DD.w,Y		; D9 DD A1
	phx		; DA
	eor $00A8.w,X		; 5D A8 00
	inc A		; 1A
	phd		; 0B
	cmp $DBAD.w,X		; DD AD DB
	ora $DBB5.w,X		; 1D B5 DB
	sta $DCBD.w,X		; 9D BD DC
	ora $DCC5.w,X		; 1D C5 DC
	sta $DDCD.w,X		; 9D CD DD
	ora $DDD5.w,X		; 1D D5 DD
	sta $DEDD.w,X		; 9D DD DE
	ora $DEE5.w,X		; 1D E5 DE
	sta $DFED.w,X		; 9D ED DF
	ora $F7CC.w,Y		; 19 CC F7
	adc $E777.w,X		; 7D 77 E7
	adc $ED0678.l,X		; 7F 78 06 ED
	tyx		; BB
	ror $B6DB.w		; 6E DB B6
	txy		; 9B
	eor $57E0.w		; 4D E0 57
	ldy $7813.w,X		; BC 13 78
	dec $1B3C.w,X		; DE 3C 1B
	sei		; 78
	dec $233C.w,X		; DE 3C 23
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	and ($C3.b,S),Y		; 33 C3
	ldy $C443.w,X		; BC 43 C4
	ldy $C553.w,X		; BC 53 C5
	ldy $C663.w,X		; BC 63 C6
	ldy $C773.w,X		; BC 73 C7
	ldy $7A83.w,X		; BC 83 7A
	sbc ($2F.b)		; F2 2F
	bit $F2.b		; 24 F2
	ror $A681.w		; 6E 81 A6
	cmp ($69.b,S),Y		; D3 69
	ldy $DA.b,X		; B4 DA
	sta $4247.w		; 8D 47 42
	lda $1EE5.w,X		; BD E5 1E
	eor $E5.b,X		; 55 E5
	stz $E65D.w,X		; 9E 5D E6
	asl $D165.w,X		; 1E 65 D1
	bit $CDD3.w,X		; 3C D3 CD
	ldy $CEE3.w,X		; BC E3 CE
	ldy $CFF3.w,X		; BC F3 CF
	lda $D003.w,X		; BD 03 D0
	tsx		; BA
	and [$48.b],Y		; 37 48
	pea $464F.w		; F4 4F 46
	dec $23BD.w,X		; DE BD 23
	cmp ($BD.b)		; D2 BD
	and ($D3.b,S),Y		; 33 D3
	lda $1A.b,X		; B5 1A
	sta $A346.w		; 8D 46 A3
	eor $AA.b,X		; 55 AA
	sbc $0B.b,X		; F5 0B
	dec $EAA5.w,X		; DE A5 EA
	stz $EBAD.w,X		; 9E AD EB
	asl $EBB5.w,X		; 1E B5 EB
	sta $D713.w,X		; 9D 13 D7
	lda $D883.w,X		; BD 83 D8
	lda $D993.w,X		; BD 93 D9
	lda $DAA3.w,X		; BD A3 DA
	lda $DBB3.w,X		; BD B3 DB
	lda $DCC3.w,X		; BD C3 DC
	lda $7AD3.w,X		; BD D3 7A
	sbc [$6F.b],Y		; F7 6F
	sei		; 78
	sbc [$AF.b],Y		; F7 AF
	jmp ($6AD5.w,X)		; 7C D5 6A
	lda $5A.b,X		; B5 5A
	lda $B366.w		; AD 66 B3
	cmp $077CAF.l,X		; DF AF 7C 07
	cmp ($7C.b,X)		; C1 7C
	and [$C3.b]		; 27 C3
	jmp ($C547.w,X)		; 7C 47 C5
	jmp ($C767.w,X)		; 7C 67 C7
	jmp ($C987.w,X)		; 7C 87 C9
	jmp ($CBA7.w,X)		; 7C A7 CB
	stz $AE.b,X		; 74 AE
	sta $1FF3.w,Y		; 99 F3 1F
	and $F3.b,X		; 35 F3
	sta $1FF43D.l,X		; 9F 3D F4 1F
	eor $F4.b		; 45 F4
	sta $1FF54D.l,X		; 9F 4D F5 1F
	eor $AC.b,X		; 55 AC
	dec $6B.b,X		; D6 6B
	and $9A.b,X		; 35 9A
	sbc $D677.w		; ED 77 D6
	adc $D877.w,X		; 7D 77 D8
	adc $DA97.w,X		; 7D 97 DA
	adc $DCB7.w,X		; 7D B7 DC
	adc $DED7.w,X		; 7D D7 DE
	adc $E0F7.w,X		; 7D F7 E0
	ror $E217.w,X		; 7E 17 E2
	ror $E437.w,X		; 7E 37 E4
	ror $E657.w,X		; 7E 57 E6
	ror $E877.w,X		; 7E 77 E8
	ror $4E97.w,X		; 7E 97 4E
	nop		; EA
	ora $DFFAA9.l,X		; 1F A9 FA DF
	lda ($FB.b),Y		; B1 FB
	phy		; 5A
	sbc $BB76.w		; ED 76 BB
	eor $D8B0.w,X		; 5D B0 D8
	ror $EFE7.w,X		; 7E E7 EF
	adc $7FF107.l,X		; 7F 07 F1 7F
	and [$F3.b]		; 27 F3
	adc $7FF547.l,X		; 7F 47 F5 7F
	adc [$F7.b]		; 67 F7
	adc $7FF987.l,X		; 7F 87 F9 7F
	lda [$FB.b]		; A7 FB
	adc $7FFDC7.l,X		; 7F C7 FD 7F
	sbc [$FF.b]		; E7 FF
	bit $9B.b		; 24 9B
	and #$9BB3.w		; 29 B3 9B
	eor #$4DBE.w		; 49 BE 4D
	inc $59.b,X		; F6 59
	and [$E9.b],Y		; 37 E9
	bcs -40.b		; B0 D8
	jmp ($A632.w)		; 6C 32 A6
	mvn $E6,$DF		; 54 DF E6
	dec $6D.b,X		; D6 6D
	lda [$01.b]		; A7 01
	and $0C9C.w		; 2D 9C 0C
	stp		; DB
	dec $5D0A.w		; CE 0A 5D
	sec		; 38
	and $4CC2.w,Y		; 39 C2 4C
	lda $3297.w,Y		; B9 97 32
	inc $5C.b		; E6 5C
	sbc ($67.b,X)		; E1 67
	ora $7938.w		; 0D 38 79
	sta ($6E.b)		; 92 6E
	rol $64.b		; 26 64
	cmp $449C.w		; CD 9C 44
	dec $F399.w		; CE 99 F3
	adc $2634.w		; 6D 34 26
	mvn $99,$CA		; 54 CA 99
	eor ($F9.b)		; 52 F9
	jmp ($5FBE.w,X)		; 7C BE 5F
	and $E24C9C.l		; 2F 9C 4C E2
	ldx $E6.b		; A6 E6
	adc ($73.b),Y		; 71 73
	sty $6C9C.w		; 8C 9C 6C
	sbc $A7.b,S		; E3 A7
	ora $8C6634.l,X		; 1F 34 66 8C
	cmp ($9A.b),Y		; D1 9A
	and ($90.b,S),Y		; 33 90
	stz $E48C.w		; 9C 8C E4
	lda [$27.b]		; A7 27
	and $CA49.w,Y		; 39 49 CA
	cmp $E5D4.w		; CD D4 E5
	lda [$2F.b]		; A7 2F
	and $7C89.w,Y		; 39 89 7C
	ldx $2F5F.w,Y		; BE 5F 2F
	sta [$CA.b],Y		; 97 CA
	sta $2A.b,X		; 95 2A
	mvn $CC,$A9		; 54 A9 CC
	cpy $1326.w		; CC 26 13
	txs		; 9A
	stz $C2DC.w		; 9C DC C2
	adc ($30.b,X)		; 61 30
	tya		; 98
	jmp $1326.w		; 4C 26 13
	ora #$C284.w		; 09 84 C2
	adc ($30.b,X)		; 61 30
	tya		; 98
	lsr $7372.w		; 4E 72 73
	lda ($09.b,S),Y		; B3 09
	sty $E7.b		; 84 E7
	lda $4A.b		; A5 4A
	sta $2A.b,X		; 95 2A
	mvn $63,$C6		; 54 C6 63
	and ($98.b),Y		; 31 98
	cpy $3366.w		; CC 66 33
	ora $C68C.w,Y		; 19 8C C6
	adc $31.b,S		; 63 31
	tya		; 98
	cpy $3366.w		; CC 66 33
	ora $C68C.w,Y		; 19 8C C6
	adc $31.b,S		; 63 31
	tya		; 98
	cpy $3366.w		; CC 66 33
	ora $C68C.w,Y		; 19 8C C6
	adc $31.b,S		; 63 31
	tya		; 98
	cpy $3366.w		; CC 66 33
	ora $A58C.w,Y		; 19 8C A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $A5.b,X		; 94 A5
	and #$524A.w		; 29 4A 52
	sty $D2.b,X		; 94 D2
	bcc  66.b		; 90 42
	xce		; FB
	brk $29.b		; 00 29
	rti		; 40

	eor $402900.l		; 4F 00 29 40
	trb $8A.b		; 14 8A
	asl $00.b,X		; 16 00
	brk $1D.b		; 00 1D
	asl $16.b,X		; 16 16
	jsl $24FF00.l		; 22 00 FF 24
	sbc $2225FF.l,X		; FF FF 25 22
	jsl $1D1D29.l		; 22 29 1D 1D
	and ($24.b),Y		; 31 24
	bit $32.b		; 24 32
	and $25.b		; 25 25
	dec A		; 3A
	and #$4229.w		; 29 29 42
	and $22.b		; 25 22
	lsr $31.b		; 46 31
	and ($4A.b),Y		; 31 4A
	sbc $1D4B32.l,X		; FF 32 4B 1D
	asl $4D.b,X		; 16 4D
	lsr A		; 4A
	.db $42, $52		; 42 52
	sbc $03590F.l,X		; FF 0F 59 03
	jsr ($075A.w,X)		; FC 5A 07
	brk $5C.b		; 00 5C
	inc $62FE.w,X		; FE FE 62
	and #$634B.w		; 29 4B 63
	dec A		; 3A
	asl $66.b,X		; 16 66
	and ($24.b),Y		; 31 24
	txa		; 8A
	sbc ($F1.b),Y		; F1 F1
	phb		; 8B
	cpx #$8CE0.w		; E0 E0 8C
	beq -16.b		; F0 F0
	sta $0F00.w		; 8D 00 0F
	sta $52.b,X		; 95 52
	eor ($99.b)		; 52 99
	sed		; F8
	jsr ($599D.w,X)		; FC 9D 59
	eor $FFA2.w,Y		; 59 A2 FF
	jsl L8000A3.l		; 22 A3 80 80
	lda [$FE.b]		; A7 FE
	ora ($B1.b,X)		; 01 B1
	adc $4D.b,S		; 63 4D
	lda ($AA.b)		; B2 AA
	eor $B5.b,X		; 55 B5
	and #$B616.w		; 29 16 B6
	and $E3B93F.l,X		; 3F 3F B9 E3
	sbc $D4.b,S		; E3 D4
	sed		; F8
	sbc $7F00DB.l,X		; FF DB 00 7F
	inc $99.b		; E6 99
	sta $07EA.w,Y		; 99 EA 07
	ora [$ED.b]		; 07 ED
	brk $80.b		; 00 80
	ora ($FF.b)		; 12 FF
	dec A		; 3A
	and $D4.b,S		; 23 D4
	pei ($26.b)		; D4 26
	sed		; F8
	sed		; F8
	and $0100.w		; 2D 00 01
	and $FF.b,X		; 35 FF
	eor $49.b,X		; 55 49
	ora #$4CF9.w		; 09 F9 4C
	sta $95.b,X		; 95 95
	lsr $F800.w		; 4E 00 F8
	eor ($FF.b),Y		; 51 FF
	adc $FC0053.l,X		; 7F 53 00 FC
	lsr $FF.b,X		; 56 FF
	beq  93.b		; F0 5D
	and ($32.b)		; 32 32
	adc ($5A.b,X)		; 61 5A
	phy		; 5A
	stz $8D.b		; 64 8D
	sta $0069.w		; 8D 69 00
	ora $F1FF6A.l,X		; 1F 6A FF F1
	stz $03.b,X		; 74 03
	ora $76.b,S		; 03 76
	and #$891D.w		; 29 1D 89
	sta $919D.w,X		; 9D 9D 91
	beq  15.b		; F0 0F
	sta ($FC.b)		; 92 FC
	jsr ($0096.w,X)		; FC 96 00
	cpy #$F79B.w		; C0 9B F7
	sbc $3F00A6.l,X		; FF A6 00 3F
	lda #$FFC0.w		; A9 C0 FF
	plb		; AB
	asl $4D.b,X		; 16 4D
	ldy $2232.w		; AC 32 22
	lda $5D3A.w		; AD 3A 5D
	ldx $4949.w		; AE 49 49
	ldy $4E.b,X		; B4 4E
	lsr $E8C5.w		; 4E C5 E8
	inx		; E8
	dec $01.b		; C6 01
	ora ($CB.b,X)		; 01 CB
	php		; 08
	php		; 08
	cmp ($40.b,S),Y		; D3 40
	lda $2446D6.l,X		; BF D6 46 24
	phx		; DA
	eor ($51.b),Y		; 51 51
	sbc $5C.b		; E5 5C
	jmp $7F7FE9.l		; 5C E9 7F 7F
	xba		; EB
	txa		; 8A
	txa		; 8A
	cpx $9B9B.w		; EC 9B 9B
	ora $15A2.w		; 0D A2 15
	ora ($D0.b,S),Y		; 13 D0
	and $FE001A.l		; 2F 1A 00 FE
	pld		; 2B
	cmp [$FF.b]		; C7 FF
	bit $F808.w		; 2C 08 F8
	bit $46.b,X		; 34 46
	lsr $37.b		; 46 37
	brk $E0.b		; 00 E0
	and $FFFC.w,Y		; 39 FC FF
	mvp $0F,$0F		; 44 0F 0F
	cli		; 58
	bit $22.b		; 24 22
	tad		; 5B
	cpy #$65C0.w		; C0 C0 65
	cmp $E66B20.l,X		; DF 20 6B E6
	inc $6D.b		; E6 6D
	sbc $6EED.w		; ED ED 6E
	brk $03.b		; 00 03
	adc ($FF.b)		; 72 FF
	and $75.b		; 25 75
	asl $22.b,X		; 16 22
	ply		; 7A
	ora $7B41.w,Y		; 19 41 7B
	ora $2B841F.l,X		; 1F 1F 84 2B
	pld		; 2B
	bcc  53.b		; 90 35
	ora $3A94.w		; 0D 94 3A
	ora $3F9A.w,X		; 1D 9A 3F
	ora [$9C.b]		; 07 9C
	lsr $66.b		; 46 66
	lda $A7.b		; A5 A7
	lda [$B0.b]		; A7 B0
	lda #$B7A9.w		; A9 A9 B7
	lda ($D3.b)		; B2 D3
	tyx		; BB
	lda $BCB9.w,Y		; B9 B9 BC
	sbc ($FE.b,X)		; E1 FE
	lda $E0FF.w,X		; BD FF E0
	cmp #$0400.w		; C9 00 04
	dex		; CA
	lda [$B2.b],Y		; B7 B2
	cmp $7909.w		; CD 09 79
	dec $3524.w		; CE 24 35
	cmp ($2C.b)		; D2 2C
	bit $39D7.w		; 2C D7 39
	and $4621.w,Y		; 39 21 46
	and ($28.b),Y		; 31 28
	lsr $56.b,X		; 56 56
	tsa		; 3B
	ror A		; 6A
	ror A		; 6A
	and $9088.w,X		; 3D 88 90
	eor $8F.b,S		; 43 8F
	sta $10EF45.l		; 8F 45 EF 10
	eor $5708F7.l		; 4F F7 08 57
	brk $5A.b		; 00 5A
	pla		; 68
	adc [$FF.b],Y		; 77 FF
	jmp ($123D.w)		; 6C 3D 12
	adc $CEDD.w,X		; 7D DD CE
	.db $82, $00, $F0		; 82 00 F0
	sta $FF.b		; 85 FF
	ora ($93.b,X)		; 01 93
	sbc $009E42.l,X		; FF 42 9E 00
	eor $A1.b,X		; 55 A1
	brk $18.b		; 00 18
	ldy $8F.b		; A4 8F
	sbc $1C00A8.l,X		; FF A8 00 1C
	cpy $03.b		; C4 03
	sbc $FF3FD1.l,X		; FF D1 3F FF
	cmp $6CFF.w,Y		; D9 FF 6C
	sbc $70EF77.l		; EF 77 EF 70
	sbc [$7F.b]		; E7 7F
	sbc [$7F.b]		; E7 7F
	phx		; DA
	phx		; DA
	sta [$14.b]		; 87 14
	ora ($80.b,S),Y		; 13 80
	bpl -121.b		; 10 87
	ora $801F87.l,X		; 1F 87 1F 80
	adc $69ED.w		; 6D ED 69
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $3A4A1F.l,X		; FF 1F 4A 3A
	bit $A2.b		; 24 A2
	and ($14.b,X)		; 21 14
	adc $16.b		; 65 16
	and ($29.b),Y		; 31 29
	lsr $32.b		; 46 32
	dec A		; 3A
	sbc $D6A2FE.l,X		; FF FE A2 D6
	sbc $3414FE.l,X		; FF FE 14 34
	asl $31.b,X		; 16 31
	and #$3246.w		; 29 46 32
	dec A		; 3A
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	eor $43.b,S		; 43 43
	eor $43.b,S		; 43 43
	mvp $44,$44		; 44 44 44
	mvp $A4,$A4		; 44 A4 A4
	ldy $8F.b		; A4 8F
	jmp $0E12.w		; 4C 12 0E
	sbc [$0E.b],Y		; F7 0E
	sbc [$0E.b],Y		; F7 0E
	sbc [$0E.b],Y		; F7 0E
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$F8.b],Y		; F7 F8
	sbc ($F8.b),Y		; F1 F8
	sbc ($F8.b),Y		; F1 F8
	sbc ($F8.b),Y		; F1 F8
	sbc ($F8.b),Y		; F1 F8
	beq  -8.b		; F0 F8
	beq  -8.b		; F0 F8
	beq  -8.b		; F0 F8
	beq -15.b		; F0 F1
	tsa		; 3B
	ror A		; 6A
	plp		; 28
	plp		; 28
	ora ($51.b)		; 12 51
	sbc $4651DB.l,X		; FF DB 51 46
	eor ($36.b),Y		; 51 36
	asl $7F.b,X		; 16 7F
	eor ($FF.b),Y		; 51 FF
	and #$3246.w		; 29 46 32
	dec A		; 3A
	bit $A2.b		; 24 A2
	and ($14.b,X)		; 21 14
	eor ($16.b,S),Y		; 53 16
	and ($29.b),Y		; 31 29
	lsr $32.b		; 46 32
	dec A		; 3A
	jsr ($FCEF.w,X)		; FC EF FC
	ora $D7D7D7.l		; 0F D7 D7 D7
	inx		; E8
	pha		; 48
	wai		; CB
	rol $26.b		; 26 26
	and #$D423.w		; 29 23 D4
	sed		; F8
	lsr A		; 4A
	dec A		; 3A
	ora ($A5.b,X)		; 01 A5
	lda $A5.b		; A5 A5
	lda [$E5.b]		; A7 E5
	sbc $E5.b		; E5 E5
	sbc $FE.b		; E5 FE
	bit $3A.b,X		; 34 3A
	bne  39.b		; D0 27
	ora ($D0.b,S),Y		; 13 D0
	rol $D114.w		; 2E 14 D1
	trb $26.b		; 14 26
	ora ($13.b,S),Y		; 13 13
	bne  46.b		; D0 2E
	trb $D1.b		; 14 D1
	rol $0810.w		; 2E 10 08
	clc		; 18
	lda ($01.b,X)		; A1 01
	ora ($08.b),Y		; 11 08
	clc		; 18
	lda ($A1.b,X)		; A1 A1
	ora ($19.b,X)		; 01 19
	sta $954C.w		; 8D 4C 95
	eor ($12.b)		; 52 12
	ora [$E7.b]		; 07 E7
	ora [$E7.b]		; 07 E7
	sta [$67.b]		; 87 67
	sta [$77.b]		; 87 77
	ora [$F7.b]		; 07 F7
	ora [$F7.b]		; 07 F7
	sta [$67.b],Y		; 97 67
	sta [$67.b],Y		; 97 67
	clc		; 18
	bpl  24.b		; 10 18
	bpl -104.b		; 10 98
	bpl -120.b		; 10 88
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl -120.b		; 10 88
	bpl -120.b		; 10 88
	bpl  35.b		; 10 23
	and $23.b,S		; 23 23
	and $3A.b,S		; 23 3A
	cmp $EFDFEF.l,X		; DF EF DF EF
	cmp $CCFFEF.l,X		; DF EF FF CC
	sbc $24C1A9.l,X		; FF A9 C1 24
	ror A		; 6A
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	and ($33.b,S),Y		; 33 33
	ldx $3E.b,Y		; B6 3E
	rol $0E16.w,X		; 3E 16 0E
	asl $FF30.w		; 0E 30 FF
	bmi  -1.b		; 30 FF
	bmi  -1.b		; 30 FF
	and ($FF.b,S),Y		; 33 FF
	cmp ($3E.b),Y		; D1 3E
	ldx #$120E.w		; A2 0E 12
	jsr ($E66B.w,X)		; FC 6B E6
	sta $04F8.w,Y		; 99 F8 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $06.b,S		; 03 06
	ora ($04.b,X)		; 01 04
	ora $06.b,S		; 03 06
	ora ($89.b,X)		; 01 89
	bit #$3A3A.w		; 89 3A 3A
	ora ($EE.b),Y		; 11 EE
	lda ($55.b)		; B2 55
	tax		; AA
	lda ($77.b)		; B2 77
	dey		; 88
	lda ($FF.b)		; B2 FF
	brk $A7.b		; 00 A7
	eor $0F63.w		; 4D 63 0F
	stz $64.b		; 64 64
	stz $8D.b		; 64 8D
	ora $5FAFEF.l,X		; 1F EF AF 5F
	eor $5FAFAF.l,X		; 5F AF AF 5F
	adc $5FAF8F.l,X		; 7F 8F AF 5F
	jmp $954C.w		; 4C 4C 95
	dec A		; 3A
	ldy $4E.b,X		; B4 4E
	bit $AEAE.w		; 2C AE AE
	ror $EC.b		; 66 EC
	cpx $34F7.w		; EC F7 34
	ora ($EF.b)		; 12 EF
	sbc $EEEFEF.l		; EF EF EF EE
	sbc $F0EFE8.l		; EF E8 EF F0
	sed		; F8
	sty $8C8C.w		; 8C 8C 8C
	inc $56.b,X		; F6 56
	ror A		; 6A
	inc $D4F7.w,X		; FE F7 D4
	beq  40.b		; F0 28
	lsr $46.b,X		; 56 46
	rol $8C.b		; 26 8C
	sty $298C.w		; 8C 8C 29
	phy		; 5A
	ora $FF2264.l		; 0F 64 22 FF
	adc $6C14FF.l		; 6F FF 14 6C
	ror A		; 6A
	sbc $EBEB.w,X		; FD EB EB
	adc $6FF8FF.l		; 6F FF F8 6F
	sbc ($14.b,S),Y		; F3 14
	jmp ($3B3B.w)		; 6C 3B 3B
	ror A		; 6A
	ror $FD.b		; 66 FD
	sbc $EBEB.w,X		; FD EB EB
	phk		; 4B
	cop $00.b		; 02 00
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	jsl $73A4FF.l		; 22 FF A4 73
	sbc $F9F926.l,X		; FF 26 F9 F9
	ror $06.b		; 66 06
	sbc $8F7214.l,X		; FF 14 72 8F
	jsr ($FF73.w,X)		; FC 73 FF
	pei ($F9.b)		; D4 F9
	and ($F0.b),Y		; 31 F0
	ror $FF.b		; 66 FF
	rol $F9.b		; 26 F9
	sbc $4B66.w,Y		; F9 66 4B
	phy		; 5A
	asl $4B.b		; 06 4B
	inc A		; 1A
	sbc $C1FEF8.l,X		; FF F8 FE C1
	sbc $F9E1.w,X		; FD E1 F9
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	trb $D9.b		; 14 D9
	inc $D4C7.w,X		; FE C7 D4
	cmp ($FF.b,X)		; C1 FF
	sbc ($BD.b,X)		; E1 BD
	lda $BDBD.w,X		; BD BD BD
	bit $5C.b		; 24 5C
	sbc $F9FD.w,X		; FD FD F9
	sbc $8B8B.w,Y		; F9 8B 8B
	phb		; 8B
	phb		; 8B
	asl $01.b,X		; 16 01
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	adc #$6969.w		; 69 69 69
	adc #$6800.w		; 69 00 68
	ora [$77.b]		; 07 77
	and ($EA.b),Y		; 31 EA
	nop		; EA
	nop		; EA
	nop		; EA
	sta $310768.l		; 8F 68 07 31
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	bit $77.b		; 24 77
	adc [$31.b],Y		; 77 31
	nop		; EA
	nop		; EA
	nop		; EA
	nop		; EA
	asl $88.b,X		; 16 88
	ora $B4B4.w,X		; 1D B4 B4
	brk $07.b		; 00 07
	txs		; 9A
	txs		; 9A
	txs		; 9A
	txs		; 9A
	txs		; 9A
	txs		; 9A
	txs		; 9A
	bit $8484.w,X		; 3C 84 84
	sty $2B.b		; 84 2B
	trb $C5.b		; 14 C5
	sbc $929C.w,X		; FD 9C 92
	.db $62, $6E, $BD		; 62 6E BD
	ror A		; 6A
	xce		; FB
	sbc ($6A.b),Y		; F1 6A
	lsr $BD.b,X		; 56 BD
	sbc $0FF881.l,X		; FF 81 F8 0F
	phb		; 8B
	txa		; 8A
	sbc ($F5.b),Y		; F1 F5
	txa		; 8A
	sty $E7E7.w		; 8C E7 E7
	ldx $8CBE.w,Y		; BE BE 8C
	lsr $5C.b		; 46 5C
	sty $B5A3.w		; 8C A3 B5
	and $DB8D.w		; 2D 8D DB
	jsl $FCFF31.l		; 22 31 FF FC
	inc $F8C1.w,X		; FE C1 F8
	ora $1F3FE7.l		; 0F E7 3F 1F
	sbc $F7FF.w,X		; FD FF F7
	ror $DE.b		; 66 DE
	dec $5B8C.w,X		; DE 8C 5B
	ora $01.b,S		; 03 01
	ora $923107.l		; 0F 07 31 92
	tad		; 5B
	ora $EAC6.w,X		; 1D C6 EA
	ora $A66E.w,X		; 1D 6E A6
	and $1A.b		; 25 1A
	brk $D4.b		; 00 D4
	adc $7FC1D4.l,X		; 7F D4 C1 7F
	ora $FFFD24.l,X		; 1F 24 FD FF
	lda $1680DA.l,X		; BF DA 80 16
	brk $A3.b		; 00 A3
	asl $02.b,X		; 16 02
	brk $40.b		; 00 40
	adc $FF16.w		; 6D 16 FF
	phk		; 4B
	and $25A6.w		; 2D A6 25
	asl $42.b,X		; 16 42
	inc A		; 1A
	stx $1D.b,Y		; 96 1D
	cli		; 58
	and ($3A.b,X)		; 21 3A
	jsl $16324B.l		; 22 4B 32 16
	.db $42, $29		; 42 29
	cpy #$31A2.w		; C0 A2 31
	sty $2B.b		; 84 2B
	cmp [$52.b]		; C7 52
	ora $CBCB4B.l		; 0F 4B CB CB
	wai		; CB
	wai		; CB
	ora $D24BFF.l		; 0F FF 4B D2
	cmp ($16.b)		; D2 16
	.db $42, $00		; 42 00
	adc ($5A.b,X)		; 61 5A
	ora [$0F.b]		; 07 0F
	sbc [$14.b],Y		; F7 14
	eor $2480F7.l		; 4F F7 80 24
	sbc $9F83A4.l,X		; FF A4 83 9F
	sbc ($87.b),Y		; F1 87
	clv		; B8
	sta $F8.b,S		; 83 F8
	beq  56.b		; F0 38
	bmi  29.b		; 30 1D
	bvs   0.b		; 70 00
	jmp ($7E60.w,X)		; 7C 60 7E
	sei		; 78
	adc $FFF07C.l,X		; 7F 7C F0 FF
	bmi  63.b		; 30 3F
	.db $62, $96, $32		; 62 96 32
	and $31.b		; 25 31
	cpy $FC.b		; C4 FC
	bit $FF.b		; 24 FF
	cmp ($14.b,S),Y		; D3 14
	bcs -48.b		; B0 D0
	cmp $7FB5EF.l,X		; DF EF B5 7F
	bra  47.b		; 80 2F
	rti		; 40

	bpl  32.b		; 10 20
	and $2D.b		; 25 2D
	.db $62, $1A, $AC		; 62 1A AC
	ror $22.b		; 66 22
	cli		; 58
	ora $B5FF22.l		; 0F 22 FF B5
	ldx #$721D.w		; A2 1D 72
	dec A		; 3A
	ldy $39D7.w		; AC D7 39
	jsr ($01A2.w,X)		; FC A2 01
	bit $96.b		; 24 96
	cmp ($B5.b,X)		; C1 B5
	inc $0022.w,X		; FE 22 00
	rol $4201.w,X		; 3E 01 42
	stp		; DB
	.db $62, $ED, $32		; 62 ED 32
	ora ($A5.b,X)		; 01 A5
	lda [$FE.b]		; A7 FE
	trb $21.b		; 14 21
	inc $FF80.w,X		; FE 80 FF
	inc $3F0F.w,X		; FE 0F 3F
	cpy #$E5E5.w		; C0 E5 E5
	asl $161E.w,X		; 1E 1E 16
	beq -90.b		; F0 A6
	cpy #$7B46.w		; C0 46 7B
	.db $62, $37, $42		; 62 37 42
	inc $FE41.w,X		; FE 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($24.b,X)		; 41 24
	ora $BD.b,S		; 03 BD
	sbc $E301E3.l,X		; FF E3 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($4B.b,X)		; 01 4B
	dec $3A.b,X		; D6 3A
	.db $42, $13		; 42 13
	ora ($D0.b,S),Y		; 13 D0
	rol $D114.w		; 2E 14 D1
	rol $27D0.w		; 2E D0 27
	ora ($58.b,S),Y		; 13 58
	clc		; 18
	lda ($A1.b,X)		; A1 A1
	ora ($19.b,X)		; 01 19
	brk $10.b		; 00 10
	php		; 08
	clc		; 18
	ora $4C8D.w,X		; 1D 8D 4C
	eor ($12.b)		; 52 12
	and $17.b		; 25 17
	sbc [$17.b]		; E7 17
	sbc [$97.b],Y		; F7 97
	adc [$97.b],Y		; 77 97
	adc [$17.b],Y		; 77 17
	sbc [$17.b],Y		; F7 17
	sbc [$E7.b],Y		; F7 E7
	sbc [$1F.b],Y		; F7 1F
	sbc $181008.l,X		; FF 08 10 18
	brk $98.b		; 00 98
	brk $98.b		; 00 98
	lda ($A1.b,X)		; A1 A1
	lda ($16.b,X)		; A1 16
	brk $23.b		; 00 23
	and $23.b,S		; 23 23
	clc		; 18
	ora $223762.l,X		; 1F 62 37 22
	lda $E4FF.w,X		; BD FF E4
	sbc $B0FFCC.l,X		; FF CC FF B0
	cpy $14FF.w		; CC FF 14
	cmp #$14FF.w		; C9 FF 14
	cmp #$1B7B.w		; C9 7B 1B
	tas		; 1B
	and ($33.b,S),Y		; 33 33
	ldx $B6.b,Y		; B6 B6
	and ($33.b,S),Y		; 33 33
	rol $36.b,X		; 36 36
	rol $36.b,X		; 36 36
	ora $FF1BFF.l,X		; 1F FF 1B FF
	and ($FF.b,S),Y		; 33 FF
	cmp ($D1.b),Y		; D1 D1
	and ($FF.b,S),Y		; 33 FF
	rol $FF.b,X		; 36 FF
	rol $7F.b,X		; 36 7F
	.db $62, $ED, $FC		; 62 ED FC
	rtl		; 6B

	inc $99.b		; E6 99
	sed		; F8
	ora $02.b		; 05 02
	asl $01.b		; 06 01
	ora $02.b		; 05 02
	asl $01.b		; 06 01
	phy		; 5A
	asl $01.b		; 06 01
	phy		; 5A
	asl $01.b		; 06 01
	bit #$3A89.w		; 89 89 3A
	dec A		; 3A
	sbc $22DD00.l,X		; FF 00 DD 22
	stz $EF00.w,X		; 9E 00 EF
	stz $AA00.w,X		; 9E 00 AA
	stz $635D.w,X		; 9E 5D 63
	ora $646464.l		; 0F 64 64 64
	sta $DF52.w		; 8D 52 DF
	ora $0F5F52.l		; 0F 52 5F 0F
	sbc $0F5F0F.l		; EF 0F 5F 0F
	lda $0F5F0F.l		; AF 0F 5F 0F
	jmp $3A4C.w		; 4C 4C 3A
	ldx $AEAE.w		; AE AE AE
	ldx $ECEC.w		; AE EC EC
	cpx $F79B.w		; EC 9B F7
	bit $12.b,X		; 34 12
	sty $C5C5.w		; 8C C5 C5
	cmp $C5.b		; C5 C5
	cmp $C5.b		; C5 C5
	bit $56.b		; 24 56
	sbc $D42323.l,X		; FF 23 23 D4
	sed		; F8
	bit $8C.b		; 24 8C
	rol $26.b		; 26 26
	rol $26.b		; 26 26
	rol $26.b		; 26 26
	bit $0F.b		; 24 0F
	brk $61.b		; 00 61
	adc ($5A.b,X)		; 61 5A
	ora [$16.b]		; 07 16
	brk $EB.b		; 00 EB
	txa		; 8A
	sed		; F8
	sbc $99F8.w,Y		; F9 F8 99
	jsr ($3B31.w,X)		; FC 31 3B
	inc $FFF1.w,X		; FE F1 FF
	and $FC.b,S		; 23 FC
	and ($EB.b),Y		; 31 EB
	txa		; 8A
	sbc $F8F9.w,Y		; F9 F9 F8
	sta $31FC.w,Y		; 99 FC 31
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	eor [$03.b],Y		; 57 03
	ora $FF1A.w,X		; 1D 1A FF
	inc $FEFF.w,X		; FE FF FE
	sbc $798579.l,X		; FF 79 85 79
	stz $44.b,X		; 74 44
	bit $E7.b		; 24 E7
	inc $FE1F.w,X		; FE 1F FE
	adc ($FE.b),Y		; 71 FE
	sta [$79.b]		; 87 79
	sta $FF.b		; 85 FF
	ora $52.b,S		; 03 52
	dec $79.b,X		; D6 79
	adc $4474.w,Y		; 79 74 44
	bit $29.b		; 24 29
	stx $53.b		; 86 53
	.db $82, $16, $00		; 82 16 00
	tyx		; BB
	lda $E0E3.w,Y		; B9 E3 E0
	sbc $E1.b,S		; E3 E1
	sbc ($E2.b,X)		; E1 E2
	cpx #$24E3.w		; E0 E3 24
	sbc $E3FFE3.l,X		; FF E3 FF E3
	sbc $E3FCE3.l,X		; FF E3 FC E3
	sbc $FEE3.w,X		; FD E3 FE
	sbc ($BD.b,X)		; E1 BD
	bit $BB.b		; 24 BB
	tyx		; BB
	tyx		; BB
	lda $1C24.w,Y		; B9 24 1C
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	adc $31.b,X		; 75 31
	ldy $68.b		; A4 68
	sbc [$14.b]		; E7 14
	cpy $BF.b		; C4 BF
	ora $14.b		; 05 14
	sbc $66.b		; E5 66
	ldy $68.b		; A4 68
	sbc [$FF.b]		; E7 FF
	trb $BC.b		; 14 BC
	cmp [$FE.b]		; C7 FE
	asl $8C.b		; 06 8C
	dec $92.b,X		; D6 92
	cpx $E4.b		; E4 E4
	sty $6EB5.w		; 8C B5 6E
	clc		; 18
	ora $8D.b,S		; 03 8D
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	sbc ($FA.b),Y		; F1 FA
	lsr $14.b,X		; 56 14
	eor $14.b,S		; 43 14
	and $CF18.w,X		; 3D 18 CF
	sbc [$1F.b],Y		; F7 1F
	sta $FE5628.l		; 8F 28 56 FE
	sbc [$F7.b],Y		; F7 F7
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	bmi -16.b		; 30 F0
	phb		; 8B
	asl $31.b,X		; 16 31
	jmp $2D768C.l		; 5C 8C 76 2D
	sta $0F32.w		; 8D 32 0F
	bmi 127.b		; 30 7F
	ora ($F8.b,X)		; 01 F8
	ora $2F3FE7.l		; 0F E7 3F 2F
	cmp $E2FBDF.l,X		; DF DF FB E2
	sbc $C75FB3.l		; EF B3 5F C7
	sbc [$BE.b],Y		; F7 BE
	ldx $5B8C.w,Y		; BE 8C 5B
	jsr $0710.w		; 20 10 07
	and ($14.b,S),Y		; 33 14
	ora ($3F.b)		; 12 3F
	sta $7F.b,S		; 83 7F
	sty $4BA3.w		; 8C A3 4B
	stz $0E.b,X		; 74 0E
	ora $DB8D74.l		; 0F 74 8D DB
	.db $42, $53		; 42 53
	brk $F1.b		; 00 F1
	eor ($E7.b,S),Y		; 53 E7
	and $FFFE1F.l,X		; 3F 1F FE FF
	txy		; 9B
	pld		; 2B
	adc [$7F.b]		; 67 7F
	sbc [$3F.b]		; E7 3F
	sbc [$1F.b]		; E7 1F
	sbc [$5B.b]		; E7 5B
	ora ($8D.b,X)		; 01 8D
	ora [$27.b]		; 07 27
	ora [$E7.b]		; 07 E7
	adc [$67.b]		; 67 67
	sbc [$27.b]		; E7 27
	sbc [$07.b]		; E7 07
	sbc [$1D.b]		; E7 1D
	nop		; EA
	tda		; 7B
	sbc #$FF7F.w		; E9 7F FF
	cmp ($1F.b),Y		; D1 1F
	adc ($4E.b)		; 72 4E
	and [$6D.b],Y		; 37 6D
	stx $37.b,Y		; 96 37
	sbc $D1BFBF.l,X		; FF BF BF D1
	ora $F78FEF.l,X		; 1F EF 8F F7
	pld		; 2B
	sbc [$FB.b]		; E7 FB
	sbc $FF.b,S		; E3 FF
	sbc ($7F.b,S),Y		; F3 7F
	ldx $7F.b,Y		; B6 7F
	tda		; 7B
	sta $CFC79F.l		; 8F 9F C7 CF
	sbc [$E7.b]		; E7 E7
	sbc $E7.b,S		; E3 E7
	sbc ($F3.b,S),Y		; F3 F3
	ldx $9C.b,Y		; B6 9C
	stx $62.b,Y		; 96 62
	phx		; DA
	phx		; DA
	phx		; DA
	eor ($F0.b),Y		; 51 F0
	rts		; 60

	bra 109.b		; 80 6D
	adc $006D.w		; 6D 6D 00
	sta $254A16.l,X		; 9F 16 4A 25
	and [$62.b],Y		; 37 62
	adc #$E021.w		; 69 21 E0
	cpy #$76B6.w		; C0 B6 76
	and $4A1696.l,X		; 3F 96 16 4A
	jsl $A66296.l		; 22 96 62 A6
	jsl $FFFE66.l		; 22 66 FE FF
	and $C0E0.w,Y		; 39 E0 C0
	ldx $24.b,Y		; B6 24
	phk		; 4B
	and $3F6E.w		; 2D 6E 3F
	stx $1D.b,Y		; 96 1D
	lsr A		; 4A
	stx $B5.b,Y		; 96 B5
	and $A66E.w		; 2D 6E A6
	and $A9.b		; 25 A9
	trb $85.b		; 14 85
	plx		; FA
	jsl $07FF07.l		; 22 07 FF 07
	sbc $FBFB74.l,X		; FF 74 FB FB
	xce		; FB
	xce		; FB
	wai		; CB
	php		; 08
	pha		; 48
	php		; 08
	iny		; C8
	brk $C8.b		; 00 C8
	brk $C8.b		; 00 C8
	sed		; F8
	tsb $C9.b		; 04 C9
	cmp #$D2D2.w		; C9 D2 D2
	bit $574B.w		; 2C 4B 57
	eor [$00.b]		; 47 00
	cmp [$00.b]		; C7 00
	cmp [$00.b]		; C7 00
	cmp [$42.b]		; C7 42
	rol $0183.w,X		; 3E 83 01
	sta ($ED.b,X)		; 81 ED
	sta ($81.b,X)		; 81 81
	jmp $318181.l		; 5C 81 81 31
	trb $7D.b		; 14 7D
	ror $E97E.w,X		; 7E 7E E9
	adc $017F7E.l,X		; 7F 7E 7F 01
	ror $3A7E.w,X		; 7E 7E 3A
	phk		; 4B
	eor $6E14.w		; 4D 14 6E
	sbc [$33.b],Y		; F7 33
	sbc $FF98.w,X		; FD 98 FF
	trb $CE.b		; 14 CE
	sbc $886616.l,X		; FF 16 66 88
	bpl -62.b		; 10 C2
	tsb $8760.w		; 0C 60 87
	bmi -63.b		; 30 C1
	ora ($29.b)		; 12 29
	eor $8024.w		; 4D 24 80
	lsr $7F.b,X		; 56 7F
	sbc $31DB.w		; ED DB 31
	pei ($1D.b)		; D4 1D
	bra -37.b		; 80 DB
	lda $3A.b,S		; A3 3A
	and #$244D.w		; 29 4D 24
	and $00C0BD.l,X		; 3F BD C0 00
	ldx $24.b,Y		; B6 24
	sbc $FF85FE.l,X		; FF FE 85 FF
	ora $963F.w,X		; 1D 3F 96
	dec A		; 3A
	lda $4D.b,X		; B5 4D
	sta [$FC.b]		; 87 FC
	cpx #$69FF.w		; E0 FF 69
	ora $4EFF31.l		; 0F 31 FF 4E
	lda $07.b,S		; A3 07
	sei		; 78
	adc #$4BE0.w		; 69 E0 4B
	eor [$7F.b],Y		; 57 7F
	lda ($E7.b),Y		; B1 E7
	ora $66B6CF.l,X		; 1F CF B6 66
	sbc $96E01D.l,X		; FF 1D E0 96
	and #$B125.w		; 29 25 B1
	and ($E9.b,X)		; 21 E9
	.db $62, $80, $22		; 62 80 22
	lda ($9C.b),Y		; B1 9C
	ldx $62.b,Y		; B6 62
	cpy #$31B1.w		; C0 B1 31
	cmp $DFEFFF.l,X		; DF FF EF DF
	sbc $EFF7DF.l		; EF DF F7 EF
	sbc [$EF.b],Y		; F7 EF
	sbc $201DF7.l,X		; FF F7 1D 20
	brk $30.b		; 00 30
	bpl  56.b		; 10 38
	clc		; 18
	clc		; 18
	php		; 08
	trb $0C0C.w		; 1C 0C 0C
	tsb $DB.b		; 04 DB
	ldx $69.b		; A6 69
	sta $6100.w		; 8D 00 61
	ora $6E.b,S		; 03 6E
	sbc $3796.w		; ED 96 37
	.db $82, $B4, $53		; 82 B4 53
	eor ($FC.b,S),Y		; 53 FC
	rtl		; 6B

	inc $99.b		; E6 99
	sed		; F8
	phy		; 5A
	ora $57.b		; 05 57
	ora $57.b		; 05 57
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora $00.b		; 05 00
	bit #$3A89.w		; 89 89 3A
	dec A		; 3A
	dey		; 88
	stz $9E16.w,X		; 9E 16 9E
	asl $00.b,X		; 16 00
	trb $44.b		; 14 44
	ora $635D.w,X		; 1D 5D 63
	ora $0E018D.l		; 0F 8D 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	sta $0F5F0F.l		; 8F 0F 5F 0F
	asl $5E0F.w		; 0E 0F 5E
	ora $140F0E.l		; 0F 0E 0F 14
	lsr $0E0F.w		; 4E 0F 0E
	ora $4C0F0E.l		; 0F 0E 0F 4C
	jmp $FF3A.w		; 4C 3A FF
	jsr $02F2.w		; 20 F2 02
	ply		; 7A
	ply		; 7A
	ply		; 7A
	ply		; 7A
	ply		; 7A
	ply		; 7A
	adc ($00.b),Y		; 71 00
	cop $FD.b		; 02 FD
	ldy $BCBC.w,X		; BC BC BC
	ldy $BCBC.w,X		; BC BC BC
	bit $3A.b,X		; 34 3A
	ldx $CDCD.w		; AE CD CD
	cmp $CDCD.w		; CD CD CD
	cmp $68EC.w		; CD EC 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	adc [$34.b],Y		; 77 34
	ora ($34.b)		; 12 34
	bit $34.b,X		; 34 34
	dec A		; 3A
	stz $9CFE.w		; 9C FE 9C
	sbc $929C92.l,X		; FF 92 9C 92
	.db $62, $6E, $46		; 62 6E 46
	inc $FF56.w,X		; FE 56 FF
	pld		; 2B
	trb $46FC.w		; 1C FC 46
	sta ($8B.b)		; 92 8B
	lda $03.b,S		; A3 03
	jsl $92FF66.l		; 22 66 FF 92
	phb		; 8B
	lda $B5.b,S		; A3 B5
	ror $DB69.w		; 6E 69 DB
	jsl $6AFE24.l		; 22 24 FE 6A
	sbc $38FFCF.l,X		; FF CF FF 38
	sed		; F8
	phb		; 8B
	sta $83.b,S		; 83 83
	clc		; 18
	ora $9224.w,Y		; 19 24 92
	phb		; 8B
	lda $5A.b,S		; A3 5A
	ora $074EDB.l,X		; 1F DB 4E 07
	bit $92.b		; 24 92
	phb		; 8B
	lda $B5.b,S		; A3 B5
	ror $DB69.w		; 6E 69 DB
	and ($F8.b)		; 32 F8
	ldx #$4B24.w		; A2 24 4B
	and $F901.w,Y		; 39 01 F9
	lda $1D.b,S		; A3 1D
	sta ($2D.b,S),Y		; 93 2D
	inc $62A3.w,X		; FE A3 62
	stp		; DB
	and ($42.b)		; 32 42
	ror $1CFD.w,X		; 7E FD 1C
	sbc $F9FAC3.l,X		; FF C3 FA F9
	xce		; FB
	trb $1A.b		; 14 1A
	tas		; 1B
	ora $C6.b,S		; 03 C6
	sbc $02C0.w		; ED C0 02
	ora ($6E.b,X)		; 01 6E
	ora ($04.b,X)		; 01 04
	cmp #$04E0.w		; C9 E0 04
	plx		; FA
	tsb $FD.b		; 04 FD
	cop $A7.b		; 02 A7
	lda $1314.w		; AD 14 13
	sbc $88C4C4.l		; EF C4 C4 88
	beq  36.b		; F0 24
	adc $FFBFFF.l,X		; 7F FF BF FF
	jmp.w [$C47F]		; DC 7F C4
	cpy $03.b		; C4 03
	eor ($70.b)		; 52 70
	phk		; 4B
	bra   0.b		; 80 00
	stz $74.b,X		; 74 74
	stz $B5.b,X		; 74 B5
	eor ($53.b,S),Y		; 53 53
	eor ($AC.b,S),Y		; 53 AC
	sta $FCC7F7.l		; 8F F7 C7 FC
	sta $83.b,S		; 83 83
	sbc #$D424.w		; E9 24 D4
	sta $FF.b,S		; 83 FF
	rts		; 60

	cpx #$F787.w		; E0 87 F7
	cmp [$92.b]		; C7 92
	lda $4B.b,S		; A3 4B
	adc #$A400.w		; 69 00 A4
	trb $C4.b		; 14 C4
	jsr ($B5A3.w,X)		; FC A3 B5
	brk $70.b		; 00 70
	brk $14.b		; 00 14
	tsa		; 3B
	stp		; DB
	ldy $91F8.w		; AC F8 91
	ora $FF8031.l		; 0F 31 80 FF
	bmi -16.b		; 30 F0
	ora $8CFF.w,X		; 1D FF 8C
	phk		; 4B
	sta $0025.w		; 8D 25 00
	sty $8D62.w		; 8C 62 8D
	and ($42.b)		; 32 42
	tda		; 7B
	and ($A9.b),Y		; 31 A9
	clc		; 18
	sed		; F8
	phk		; 4B
	cpx #$004B.w		; E0 4B 00
	ora [$42.b]		; 07 42
	lda ($31.b),Y		; B1 31
	bra  -1.b		; 80 FF
	bvs -16.b		; 70 F0
	.db $62, $0F, $32		; 62 0F 32
	lda ($24.b),Y		; B1 24
	beq  -1.b		; F0 FF
	ora [$12.b]		; 07 12
	lsr A		; 4A
	lda ($FB.b),Y		; B1 FB
	xce		; FB
	brk $FB.b		; 00 FB
	ror $C9.b,X		; 76 C9
	cmp #$04FB.w		; C9 FB 04
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $4F.b		; 04 4F
	eor $3A58AD.l		; 4F AD 58 3A
	lsr A		; 4A
	jsl $324A63.l		; 22 63 4A 32
	tad		; 5B
	.db $62, $3F, $32		; 62 3F 32
	and $B1.b		; 25 B1
	tsb $62FC.w		; 0C FC 62
	ora $32.b,S		; 03 32
	.db $42, $B1		; 42 B1
	lda $2D.b,X		; B5 2D
	cop $06.b		; 02 06
	brk $0B.b		; 00 0B
	lsr A		; 4A
	jsl $F8A700.l		; 22 00 A7 F8
	ora [$AD.b]		; 07 AD
	phk		; 4B
	ora ($0F.b,X)		; 01 0F
	bpl 115.b		; 10 73
	bra -97.b		; 80 9F
	stp		; DB
	jsl $910093.l		; 22 93 00 91
	bra 127.b		; 80 7F
	and $AD.b		; 25 AD
	phk		; 4B
	jmp $939301.l		; 5C 01 93 93
	and $42FE.w		; 2D FE 42
	lda $ED29.w		; AD 29 ED
	rti		; 40

	rts		; 60

	jsr $B014.w		; 20 14 B0
	bpl -40.b		; 10 D8
	lsr A		; 4A
	stp		; DB
	bra  63.b		; 80 3F
	cpy #$E01F.w		; C0 1F E0
	lda $62C6.w		; AD C6 62
	inc $4232.w,X		; FE 32 42
	lda ($FB.b),Y		; B1 FB
	txy		; 9B
	sbc ($14.b,S),Y		; F3 14
	adc $7B14.w,X		; 7D 14 7B
	adc $797F.w,Y		; 79 7F 79
	adc [$71.b],Y		; 77 71
	adc $E7EFF3.l,X		; 7F F3 EF E7
	cmp $0E040C.l,X		; DF 0C 04 0E
	cop $86.b		; 02 86
	cop $86.b		; 02 86
	cop $8E.b		; 02 8E
	brk $8E.b		; 00 8E
	tay		; A8
	brk $38.b		; 00 38
	asl $03.b,X		; 16 03
	and $2D2D.w		; 2D 2D 2D
	and $6E2D.w		; 2D 2D 6E
	eor [$FC.b],Y		; 57 FC
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	eor ($00.b,S),Y		; 53 00
	rtl		; 6B

	rtl		; 6B

	sed		; F8
	tsb $00.b		; 04 00
	ora $C9.b		; 05 C9
	brk $05.b		; 00 05
	cmp #$C9C9.w		; C9 C9 C9
	cmp #$8900.w		; C9 00 89
	bit #$633A.w		; 89 3A 63
	rol A		; 2A
	rol A		; 2A
	asl $AA.b,X		; 16 AA
	tax		; AA
	ora ($11.b),Y		; 11 11
	tax		; AA
	tax		; AA
	cmp $D5.b,X		; D5 D5
	tax		; AA
	tax		; AA
	sbc $22D500.l,X		; FF 00 D5 22
	stz $EE00.w,X		; 9E 00 EE
	stz $2A00.w,X		; 9E 00 2A
	stz $2D3A.w,X		; 9E 3A 2D
	asl $021F.w		; 0E 1F 02
	txs		; 9A
	ora $05.b		; 05 05
	brk $14.b		; 00 14
	bit $1505.w		; 2C 05 15
	asl A		; 0A
	rol $0C00.w		; 2E 00 0C
	asl $3C0F.w		; 0E 0F 3C
	trb $21.b		; 14 21
	sec		; 38
	brk $14.b		; 00 14
	sta $BA.b		; 85 BA
	ldx $14.b		; A6 14
	sta $BA.b		; 85 BA
	trb $CA.b		; 14 CA
	sbc $80.b,X		; F5 80
	lda $1FDF52.l,X		; BF 52 DF 1F
	sbc $D17F3F.l,X		; FF 3F 7F D1
	and $3FB67F.l,X		; 3F 7F B6 3F
	adc $7A3A3F.l,X		; 7F 3F 3A 7A
	ply		; 7A
	trb $1A.b		; 14 1A
	trb $43.b		; 14 43
	lda $E924BF.l,X		; BF BF 24 E9
	lda $BC24BF.l,X		; BF BF 24 BC
	ldy $FCE3.w,X		; BC E3 FC
	lda $DBFF40.l,X		; BF 40 FF DB
	bra -65.b		; 80 BF
	rti		; 40

	ldx #$129C.w		; A2 9C 12
	cmp $78F8.w		; CD F8 78
	eor ($D6.b),Y		; 51 D6
	pla		; 68
	bra   7.b		; 80 07
	bra  50.b		; 80 32
	and $9C.b		; 25 9C
	ora ($24.b)		; 12 24
	asl $FE.b,X		; 16 FE
	sbc $5BEFE8.l,X		; FF E8 EF 5B
	clv		; B8
	cmp $4080F0.l,X		; DF F0 80 40
	bra  88.b		; 80 58
	asl $E0.b,X		; 16 E0
	bpl -111.b		; 10 91
	cpx #$2442.w		; E0 42 24
	sbc $5B8B92.l,X		; FF 92 8B 5B
	lda $A3.b,S		; A3 A3
	phk		; 4B
	ror $A669.w		; 6E 69 A6
	stp		; DB
	stp		; DB
	jsl $87FFF0.l		; 22 F0 FF 87
	sbc $8CFE3E.l,X		; FF 3E FE 8C
	adc $1D.b,X		; 75 1D
	phb		; 8B
	asl $01.b,X		; 16 01
	sta $FF16.w		; 8D 16 FF
	asl $A2.b,X		; 16 A2
	brk $8B.b		; 00 8B
	.db $62, $69, $32		; 62 69 32
	.db $42, $8C		; 42 8C
	lda $C6.b,S		; A3 C6
	cop $02.b		; 02 02
	and $F504.w		; 2D 04 F5
	tsb $5A.b		; 04 5A
	ora $0F.b,S		; 03 0F
	stp		; DB
	jsl $22A700.l		; 22 00 A7 22
	tsb $0359.w		; 0C 59 03
	sed		; F8
	ora [$AD.b]		; 07 AD
	jsr $407F.w		; 20 7F 40
	sta $FC.b		; 85 FC
	asl $F2.b		; 06 F2
	tsb $1FEF.w		; 0C EF 1F
	cld		; D8
	and $3C9014.l,X		; 3F 14 90 3C
	phb		; 8B
	ora $023FC0.l,X		; 1F C0 3F 02
	sbc $1CFD0A.l,X		; FF 0A FD 1C
	sbc ($14.b,S),Y		; F3 14
	tsa		; 3B
	cpx $14.b		; E4 14
	eor [$E8.b],Y		; 57 E8
	and $031DD0.l		; 2F D0 1D 03
	sta $A669.w		; 8D 69 A6
	stp		; DB
	stp		; DB
	asl $4A.b,X		; 16 4A
	and ($50.b)		; 32 50
	adc [$FC.b],Y		; 77 FC
	sbc $FE07.w,Y		; F9 07 FE
	sbc $1E87.w,Y		; F9 87 1E
	trb $D3.b		; 14 D3
	ora $970871.l,X		; 1F 71 08 97
	jsl $FAFF88.l		; 22 88 FF FA
	ora [$06.b]		; 07 06
	sbc $06F9.w,Y		; F9 F9 06
	lsr $BDE1.w,X		; 5E E1 BD
	cmp $F81660.l,X		; DF 60 16 F8
	inc A		; 1A
	ldy $40AB.w		; AC AB 40
	rts		; 60

	jsr $08F0.w		; 20 F0 08
	jsr ($7C04.w,X)		; FC 04 7C
	bra -70.b		; 80 BA
.INDEX 16
	rep #$DE		; C2 DE
	rts		; 60

	trb $CD.b		; 14 CD
	sbc ($BF.b,X)		; E1 BF
	adc $C03F80.l,X		; 7F 80 3F C0
	ora $F887F0.l		; 0F F0 87 F8
	cmp $7C.b,S		; C3 7C
	sbc $3C.b,S		; E3 3C
	trb $51.b		; 14 51
	ldx $A114.w,Y		; BE 14 A1
	lsr $804B.w,X		; 5E 4B 80
	stx $37.b,Y		; 96 37
	.db $82, $82, $AB		; 82 82 AB
	trb $61.b		; 14 61
	and $761E1E.l,X		; 3F 1E 1E 76
	rti		; 40

	bra  20.b		; 80 14
	lda ($D3.b,X)		; A1 D3
	rti		; 40

	adc $65.b		; 65 65
	adc $45.b		; 65 45
	eor $AD.b		; 45 AD
	dec A		; 3A
	eor $62B1.w		; 4D B1 62
	sbc $B14D03.l,X		; FF 03 4D B1
	.db $62, $24, $4D		; 62 24 4D
	lda ($62.b),Y		; B1 62
	cmp $4F4FDF.l,X		; DF DF 4F 4F
	eor $454F91.l		; 4F 91 4F 45
	eor $65.b		; 45 65
	lda $2462.w		; AD 62 24
	adc ($16.b)		; 72 16
	bit $42.b		; 24 42
	lda ($76.b),Y		; B1 76
	phy		; 5A
	sbc [$F0.b],Y		; F7 F0
	adc ($16.b)		; 72 16
	bit $25.b		; 24 25
	ora ($FF.b,X)		; 01 FF
	lda ($B5.b),Y		; B1 B5
	and $01FC.w		; 2D FC 01
	lda [$72.b]		; A7 72
	asl $58.b,X		; 16 58
	brk $14.b		; 00 14
	eor [$50.b],Y		; 57 50
	sbc $1720B1.l,X		; FF B1 20 17
	ora ($2F.b,X)		; 01 2F
	cop $BF.b		; 02 BF
	stp		; DB
	tsb $7F.b		; 04 7F
	brk $A7.b		; 00 A7
	jsr ($5601.w,X)		; FC 01 56
	ora $801FE0.l		; 0F E0 1F 80
	adc $FF0125.l,X		; 7F 25 01 FF
	cop $85.b		; 02 85
	inc $01B5.w,X		; FE B5 01
	ror $AB6E.w		; 6E 6E AB
	jsr $14FF.w		; 20 FF 14
	.db $82, $FB, $0F		; 82 FB 0F
	sbc [$30.b]		; E7 30
	sta [$67.b],Y		; 97 67
	jmp ($14F8.w,X)		; 7C F8 14
	dec $F8.b		; C6 F8
	sta $E0.b,S		; 83 E0
	tsb $22.b		; 04 22
	tsb $FF.b		; 04 FF
	ora [$F8.b],Y		; 17 F8
	bvc -17.b		; 50 EF
	sbc [$98.b]		; E7 98
	trb $DA.b		; 14 DA
	and [$BF.b]		; 27 BF
	eor [$7E.b]		; 47 7E
	sta $16.b,S		; 83 16
	phy		; 5A
	ora $1632DB.l,X		; 1F DB 32 16
	lsr A		; 4A
	and ($80.b)		; 32 80
	lda $38CFE0.l,X		; BF E0 CF 38
	sbc ($CC.b,S),Y		; F3 CC
	trb $3D.b		; 14 3D
	inc $14.b,X		; F6 14
	stz $8EFB.w,X		; 9E FB 8E
	eor [$14.b]		; 47 14
	lda $4022.w,X		; BD 22 40
	sbc $143FD0.l,X		; FF D0 3F 14
	bit $CF.b,X		; 34 CF
	trb $CE.b		; 14 CE
	and ($F7.b,S),Y		; 33 F7
	ora #$05FA.w		; 09 FA 05
	sbc $1602.w,X		; FD 02 16
	cpy #$5382.w		; C0 82 53
	inc A		; 1A
	.db $42, $AB		; 42 AB
	php		; 08
	inx		; E8
	brk $F4.b		; 00 F4
	lsr $FC04.w		; 4E 04 FC
	ora [$FC.b]		; 07 FC
	ora ($FA.b,X)		; 01 FA
	ora ($14.b,X)		; 01 14
	ply		; 7A
	ora ($FA.b,X)		; 01 FA
	ora $F807F0.l		; 0F F0 07 F8
	jsl $07F807.l		; 22 07 F8 07
	sed		; F8
	eor $FC83.w,Y		; 59 83 FC
	eor $8076.w,Y		; 59 76 80
	sbc $C6AB.w		; ED AB C6
	dec $1D.b		; C6 1D
	sta ($1A.b,S),Y		; 93 1A
	inc A		; 1A
	asl $24.b,X		; 16 24
	and ($B1.b)		; 32 B1
	cmp $7897BF.l		; CF BF 97 78
	ora $031530.l		; 0F 30 15 03
	xce		; FB
	ora [$F7.b]		; 07 F7
	ora $BF1FEF.l		; 0F EF 1F BF
	adc $A62270.l,X		; 7F 70 22 A6
	cpy #$164A.w		; C0 4A 16
	ora $1D0700.l		; 0F 00 07 1D
	dec $C6.b		; C6 C6
	stz $07.b,X		; 74 07
	phy		; 5A
	beq  78.b		; F0 4E
	and $1A.b		; 25 1A
	inc A		; 1A
	eor ($00.b,S),Y		; 53 00
	sta $03D4.w,Y		; 99 D4 03
	and ($04.b,X)		; 21 04
	eor ($16.b,S),Y		; 53 16
	ldy $5900.w		; AC 00 59
	ora $21.b,S		; 03 21
	sbc $5C9263.l,X		; FF 63 92 5C
	trb $68.b		; 14 68
	trb $68.b		; 14 68
	cpy #$CD14.w		; C0 14 CD
	trb $A8.b		; 14 A8
	tax		; AA
	mvn $5D,$14		; 54 14 5D
	cpy #$16CC.w		; C0 CC 16
	cop $02.b		; 02 02
	asl $14.b,X		; 16 14
	pla		; 68
	sta [$C0.b],Y		; 97 C0
	and $14A814.l,X		; 3F 14 A8 14
	eor [$54.b],Y		; 57 54
	trb $AB.b		; 14 AB
	cpy #$00D1.w		; C0 D1 00
	sbc $FE39.w,X		; FD 39 FE
	dec $3A.b,X		; D6 3A
	dec A		; 3A
	sbc #$BB14.w		; E9 14 BB
	trb $BB.b		; 14 BB
	ror $7D.b		; 66 7D
	sbc $140080.l,X		; FF 80 00 14
	mvp $76,$3A		; 44 3A 76
	brk $05.b		; 00 05
	trb $35.b		; 14 35
	cop $2A.b		; 02 2A
	asl A		; 0A
	asl $0A02.w,X		; 1E 02 0A
	ora #$4B09.w		; 09 09 4B
	trb $45.b		; 14 45
	trb $7A.b		; 14 7A
	trb $82.b		; 14 82
	trb $BD.b		; 14 BD
	trb $CA.b		; 14 CA
	sbc $C2.b,X		; F5 C2
	sbc $E914.w,X		; FD 14 E9
	inc $7D.b,X		; F6 7D
	sbc $7F3FBF.l,X		; FF BF 3F 7F
	ldx $B6.b,Y		; B6 B6
	and $4B3A7B.l,X		; 3F 7B 3A 4B
	ldx $24.b,Y		; B6 24
	sbc #$BFBF.w		; E9 BF BF
	sbc #$3F4B.w		; E9 4B 3F
	lda #$80DB.w		; A9 DB 80
	lda $807F40.l,X		; BF 40 7F 80
	adc $12D6.w,X		; 7D D6 12
	phk		; 4B
	dec $4B.b,X		; D6 4B
	lsr A		; 4A
	brk $7D.b		; 00 7D
	dec $12.b,X		; D6 12
	phk		; 4B
	ldy #$DFC0.w		; A0 C0 DF
	cpx #$F0EF.w		; E0 EF F0
	sbc [$F8.b],Y		; F7 F8
	beq  -8.b		; F0 F8
	ora [$1F.b],Y		; 17 1F
	ora [$1F.b],Y		; 17 1F
	tsb $4A2F.w		; 0C 2F 4A
	brk $D8.b		; 00 D8
	cpx #$E0F8.w		; E0 F8 E0
	bvs -64.b		; 70 C0
	ora $5BA3.w,X		; 1D A3 5B
	phb		; 8B
	phk		; 4B
	and $DB.b		; 25 DB
	ldx $69.b		; A6 69
	adc #$A669.w		; 69 69 A6
	asl $72.b,X		; 16 72
	adc $FF.b,X		; 75 FF
	sta [$FF.b]		; 87 FF
	rol $4AFE.w,X		; 3E FE 4A
	ora $B12D.w,X		; 1D 2D B1
	php		; 08
	phd		; 0B
	brk $07.b		; 00 07
	cpy #$E007.w		; C0 07 E0
	phy		; 5A
	ora [$E0.b]		; 07 E0
	sbc [$C0.b]		; E7 C0
	cmp [$00.b]		; C7 00
	ora [$F8.b]		; 07 F8
	ora [$91.b]		; 07 91
	sta ($91.b),Y		; 91 91
	sta ($10.b),Y		; 91 10
	ora $910F30.l		; 0F 30 0F 91
	lda $2071.w		; AD 71 20
	sbc ($CC.b),Y		; F1 CC
	cpx #$5614.w		; E0 14 56
.INDEX 8
	sep #$14		; E2 14
	eor #$41FA.w		; 49 FA 41
	sbc $50F2.w,X		; FD F2 50
	trb $6D.b		; 14 6D
	bpl  20.b		; 10 14
	xba		; EB
	trb $A5.b		; 14 A5
	dec $4F14.w,X		; DE 14 4F
	ldx $1455.w,Y		; BE 55 14
	ldx $5B14.w		; AE 14 5B
	trb $A4.b		; 14 A4
	lsr $A114.w,X		; 5E 14 A1
	adc $14EE80.l,X		; 7F 80 EE 14
	sta ($2F.b,S),Y		; 93 2F
	trb $D7.b		; 14 D7
	lsr A		; 4A
	and $DB.b		; 25 DB
	plb		; AB
	trb $2C.b		; 14 2C
	trb $D2.b		; 14 D2
	cld		; D8
	ora $14.b,S		; 03 14
	bcc  20.b		; 90 14
	adc #$1405.w		; 69 05 14
	txs		; 9A
	ora $14.b,S		; 03 14
	stz $7E81.w		; 9C 81 7E
	trb $92.b		; 14 92
	trb $65.b		; 14 65
	sbc ($14.b),Y		; F1 14
	ora $6A14.w		; 0D 14 6A
	sta [$DF.b],Y		; 97 DF
	and [$14.b]		; 27 14
	txs		; 9A
	adc [$8F.b]		; 67 8F
	bvs  20.b		; 70 14
	txy		; 9B
	trb $64.b		; 14 64
	adc $14.b		; 65 14
	adc $8E.b,X		; 75 8E
	adc $4D9E14.l		; 6F 14 9E 4D
	plb		; AB
	sbc ($27.b),Y		; F1 27
	sed		; F8
	dec $17F8.w,X		; DE F8 17
	sed		; F8
	ora [$F8.b],Y		; 17 F8
	trb $37.b		; 14 37
	sei		; 78
	sbc $B714D0.l,X		; FF D0 14 B7
	cpy #$BF.b		; C0 BF
	trb $A9.b		; 14 A9
	lsr $1313.w,X		; 5E 13 13
	ora ($91.b,S),Y		; 13 91
	sta ($B8.b),Y		; 91 B8
	trb $4F.b		; 14 4F
	ldy #$5F.b		; A0 5F
	sed		; F8
	ldy $B4.b,X		; B4 B4
	ldy $82.b,X		; B4 82
	plb		; AB
	asl $00.b,X		; 16 00
	lda $80.b,S		; A3 80
	cpy #$80.b		; C0 80
	sbc ($80.b,X)		; E1 80
	sbc $80C080.l,X		; FF 80 C0 80
	sbc $83.b,S		; E3 83
	eor $45.b		; 45 45
	eor $EE.b		; 45 EE
	ora ($F1.b),Y		; 11 F1
	asl $53A2.w		; 0E A2 53
	lda ($16.b),Y		; B1 16
	ora ($16.b,X)		; 01 16
	ror $7525.w		; 6E 25 75
	cli		; 58
	eor ($03.b,S),Y		; 53 03
	eor $9472.w,Y		; 59 72 94
	eor $0F1F.w		; 4D 1F 0F
	beq  63.b		; F0 3F
	asl $72.b,X		; 16 72
	adc $58.b,X		; 75 58
	asl $24.b,X		; 16 24
	.db $42, $94		; 42 94
	eor $1639.w		; 4D 39 16
	sta ($75.b,S),Y		; 93 75
	bit $16.b		; 24 16
	bit $32.b		; 24 32
	sty $4A.b,X		; 94 4A
	and ($16.b)		; 32 16
	sta ($75.b,S),Y		; 93 75
	bit $16.b		; 24 16
	bit $32.b		; 24 32
	sty $4D.b,X		; 94 4D
	brk $DF.b		; 00 DF
	ora $759320.l,X		; 1F 20 93 75
	sbc $C03F65.l,X		; FF 65 3F C0
	lsr A		; 4A
	sty $4D.b,X		; 94 4D
	ora ($FE.b,X)		; 01 FE
	sta $A2.b		; 85 A2
	ora $4F.b,S		; 03 4F
	jsr ($160C.w,X)		; FC 0C 16
	jmp $53FFA7.l		; 5C A7 FF 53
	cpy $4E.b		; C4 4E
	ora [$FC.b]		; 07 FC
	cpy $2D.b		; C4 2D
	lda ($F7.b),Y		; B1 F7
	bpl -121.b		; 10 87
	bra  -9.b		; 80 F7
	bpl  90.b		; 10 5A
	cmp $808F40.l		; CF 40 8F 80
	ora $E069DB.l,X		; 1F DB 69 E0
	sta $E01F70.l		; 8F 70 1F E0
	ora $807FE0.l,X		; 1F E0 7F 80
	adc ($B1.b)		; 72 B1
	jsr ($A701.w,X)		; FC 01 A7
	jsr ($8501.w,X)		; FC 01 85
	sbc $8501.w,X		; FD 01 85
	sbc $E801.w,X		; FD 01 E8
	and ($42.b)		; 32 42
	brk $A7.b		; 00 A7
	lda $F903.w		; AD 03 F9
	ora [$FE.b]		; 07 FE
	ora [$FA.b]		; 07 FA
	ora [$FA.b]		; 07 FA
	ora [$FA.b]		; 07 FA
	ora [$FF.b]		; 07 FF
	cop $FB.b		; 02 FB
	jsl $02FE05.l		; 22 05 FE 02
	sbc $FD02.w,X		; FD 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	eor $FC07.w,Y		; 59 07 FC
	ora ($FE.b,X)		; 01 FE
	adc ($61.b,X)		; 61 61
	adc ($5A.b,X)		; 61 5A
	ora $AB.b,S		; 03 AB
	trb $89.b		; 14 89
	asl $8E.b		; 06 8E
	rts		; 60

	tsb $B3.b		; 04 B3
	bpl  20.b		; 10 14
	jmp $0CD0.w		; 4C D0 0C
	trb $EC.b		; 14 EC
	trb $93.b		; 14 93
	trb $84.b		; 14 84
	trb $6B.b		; 14 6B
	sta [$14.b]		; 87 14
	cli		; 58
	trb $2B.b		; 14 2B
	pea $F17E.w		; F4 7E F1
	trb $AC.b		; 14 AC
	adc ($DC.b,S),Y		; 73 DC
	trb $23.b		; 14 23
	pea $A70B.w		; F4 0B A7
	adc ($14.b,S),Y		; 73 14
	stz $7B14.w		; 9C 14 7B
	trb $BC.b		; 14 BC
	eor $67AB.w		; 4D AB 67
	trb $91.b		; 14 91
	cmp [$1E.b]		; C7 1E
	sta [$48.b]		; 87 48
	and $E11FD0.l		; 2F D0 1F E1
	phd		; 0B
	sbc [$14.b],Y		; F7 14
	stx $14.b,Y		; 96 14
	and $148E.w		; 2D 8E 14
	adc $BA55.w		; 6D 55 BA
	inc $3914.w,X		; FE 14 39
	trb $D6.b		; 14 D6
	trb $39.b		; 14 39
	ror $6581.w,X		; 7E 81 65
	sbc $AD1400.l,X		; FF 00 14 AD
	trb $72.b		; 14 72
	trb $7D.b		; 14 7D
	sbc ($4D.b)		; F2 4D
	plb		; AB
	sta ($3E.b,X)		; 81 3E
	cmp ($FE.b,X)		; C1 FE
	cmp ($BE.b,X)		; C1 BE
	cmp $BF.b,S		; C3 BF
	cmp $BF.b,S		; C3 BF
	cpy #$FC.b		; C0 FC
	bra -72.b		; 80 B8
	lsr DMASRC1B.w		; 4E 14 43
	jsr ($7C83.w,X)		; FC 83 7C
	sta $7C.b,S		; 83 7C
	sta $7C.b,S		; 83 7C
	sta $7C.b,S		; 83 7C
	sta ($7F.b,X)		; 81 7F
	cmp [$7F.b]		; C7 7F
	ora $FF.b		; 05 FF
	cpy #$96.b		; C0 96
	stx $96.b,Y		; 96 96
	stx $96.b,Y		; 96 96
	stx $ED.b,Y		; 96 ED
	asl $4A.b,X		; 16 4A
	eor ($4E.b,S),Y		; 53 4E
	brk $99.b		; 00 99
	ora $E7.b,S		; 03 E7
	ora $FF313F.l,X		; 1F 3F 31 FF
	phk		; 4B
	lsr A		; 4A
	brk $7D.b		; 00 7D
	sbc $7B741D.l,X		; FF 1D 74 7B
	bit $4B.b		; 24 4B
	and $53.b		; 25 53
	and [$29.b],Y		; 37 29
	dec $4B.b,X		; D6 4B
	lsr A		; 4A
	brk $7D.b		; 00 7D
	sbc $4B467B.l,X		; FF 7B 46 4B
	and [$62.b],Y		; 37 62
	trb $28.b		; 14 28
	trb $2B.b		; 14 2B
	bne -43.b		; D0 D5
	trb $94.b		; 14 94
	trb $9E.b		; 14 9E
	bvc  84.b		; 50 54
	trb $A4.b		; 14 A4
	trb $A4.b		; 14 A4
	phk		; 4B
	trb $28.b		; 14 28
	trb $D7.b		; 14 D7
	ora ($14.b,S),Y		; 13 14
	sty $14.b,X		; 94 14
	rtl		; 6B

	bvc -81.b		; 50 AF
	trb $A5.b		; 14 A5
	trb $5B.b		; 14 5B
	adc $FF46.w,X		; 7D 46 FF
	jmp $4B3A3A.l		; 5C 3A 3A 4B
	inc $FF35.w		; EE 35 FF
	tax		; AA
	and $D9.b,X		; 35 D9
	dec A		; 3A
	jsr $2000.w		; 20 00 20
	brk $B6.b		; 00 B6
	lda $FF.b,X		; B5 FF
	cpy #$7F.b		; C0 7F
	cpy #$BF.b		; C0 BF
	cpy #$55.b		; C0 55
	cmp $A6A6.w,Y		; D9 A6 A6
	ldx $62.b		; A6 62
	bit $B5.b		; 24 B5
	adc ($9E.b)		; 72 9E
	cmp $B542.w,Y		; D9 42 B5
	eor [$03.b],Y		; 57 03
	beq -15.b		; F0 F1
	and $9129.w		; 2D 29 91
	pea $FA0F.w		; F4 0F FA
	ora $22D954.l		; 0F 54 D9 22
	brk $FB.b		; 00 FB
	brk $F1.b		; 00 F1
	and $1429.w		; 2D 29 14
	plp		; 28
	trb $B4.b		; 14 B4
	rol $14.b,X		; 36 14
	cmp $F003.w,Y		; D9 03 F0
	tsb $FC.b		; 04 FC
	brk $FB.b		; 00 FB
	brk $7E.b		; 00 7E
	ldx $8D.b		; A6 8D
	trb $76.b		; 14 76
	trb $CB.b		; 14 CB
	tas		; 1B
	cpx $08.b		; E4 08
	sbc [$06.b],Y		; F7 06
	sbc $A705.w,Y		; F9 05 A7
	ldx #$10.b		; A2 10
	eor ($A6.b),Y		; 51 A6
	adc #$578D.w		; 69 8D 57
	ora ($4B.b,X)		; 01 4B
	lsr A		; 4A
	stp		; DB
	ldx $8D.b		; A6 8D
	trb $A8.b		; 14 A8
	trb $D2.b		; 14 D2
	adc $F8FE86.l,X		; 7F 86 FE F8
	sbc $0201.w,Y		; F9 01 02
	stx $D914.w		; 8E 14 D9
	adc ($25.b,S),Y		; 73 25
	inc $14.b,X		; F6 14
	ora $F8A7.w		; 0D A7 F8
	ora [$59.b]		; 07 59
	sta $14.b		; 85 14
	stz $8F.b,X		; 74 8F
	and $4A.b		; 25 4A
	eor ($4B.b,S),Y		; 53 4B
	eor $14A0.w		; 4D A0 14
	ror $FE48.w		; 6E 48 FE
	bpl 124.b		; 10 7C
	bpl -36.b		; 10 DC
	jsr $82B8.w		; 20 B8 82
	and [$ED.b],Y		; 37 ED
	bvs -97.b		; 70 9F
	cmp ($3F.b,X)		; C1 3F
	trb $82.b		; 14 82
	adc $FF2114.l,X		; 7F 14 21 FF
	rti		; 40

	sbc $560D05.l,X		; FF 05 0D 56
	and [$96.b],Y		; 37 96
	sbc $FEB5.w		; ED B5 FE
	inc A		; 1A
	eor ($53.b,S),Y		; 53 53
	lsr $3782.w		; 4E 82 37
	sbc $A3FF.w		; ED FF A3
	bra 118.b		; 80 76
	ldx #$00.b		; A2 00
	tax		; AA
	and $D9.b,X		; 35 D9
	and $76.b		; 25 76
	sbc $002562.l,X		; FF 62 25 00
	tax		; AA
	and $D9.b,X		; 35 D9
	and $76.b		; 25 76
	trb $84.b		; 14 84
	brk $02.b		; 00 02
	ror $00.b,X		; 76 00
	lda [$85.b]		; A7 85
	tax		; AA
	and $D9.b,X		; 35 D9
	jsl $01761A.l		; 22 1A 76 01
	trb $3D.b		; 14 3D
	ora ($1E.b,X)		; 01 1E
	adc #$578D.w		; 69 8D 57
	ora $2D.b,S		; 03 2D
	asl $C3.b,X		; 16 C3
	inc $FF40.w,X		; FE 40 FF
	ldy #$FF.b		; A0 FF
	bvc  -1.b		; 50 FF
	dey		; 88
	sbc $FF0D54.l,X		; FF 54 0D FF
	ora $2D.b,S		; 03 2D
	.db $62, $3F, $69		; 62 3F 69
	adc #$578D.w		; 69 8D 57
	ora $2D.b,S		; 03 2D
	asl $14.b,X		; 16 14
	eor $14.b		; 45 14
	ldx $B3.b		; A6 B3
	cpy $871F.w		; CC 1F 87
	and [$E0.b]		; 27 E0
	brk $DC.b		; 00 DC
	asl $F3.b		; 06 F3
	jsl $B714DB.l		; 22 DB 14 B7
	trb $58.b		; 14 58
	adc $47.b		; 65 47
	clv		; B8
	bmi -49.b		; 30 CF
	and $FC0BF0.l		; 2F F0 0B FC
	and $72.b		; 25 72
	stp		; DB
	ldx $8D.b		; A6 8D
	phk		; 4B
	lsr A		; 4A
	and $DB.b		; 25 DB
	trb $45.b		; 14 45
	trb $93.b		; 14 93
	plx		; FA
	trb $37.b		; 14 37
	beq -61.b		; F0 C3
	iny		; C8
	asl $1411.w		; 0E 11 14
	adc $C8.b,X		; 75 C8
	sta $B35322.l,X		; 9F 22 53 B3
	trb $6C.b		; 14 6C
	inc $09.b,X		; F6 09
	trb $C4.b		; 14 C4
	trb $3B.b		; 14 3B
	ora $FAE7.w,Y		; 19 E7 FA
	ora $227FA0.l		; 0F A0 7F 22
	ora ($58.b,X)		; 01 58
	inc A		; 1A
	eor ($4E.b,S),Y		; 53 4E
	and [$4B.b],Y		; 37 4B
	lsr A		; 4A
	and $53.b		; 25 53
	brk $78.b		; 00 78
	rti		; 40

	beq -128.b		; F0 80
	beq -128.b		; F0 80
	cpx #$96.b		; E0 96
	sbc $861D.w		; ED 1D 86
	sbc $0AFF05.l,X		; FF 05 FF 0A
	sbc $08FF15.l,X		; FF 15 FF 08
	bcc  -1.b		; 90 FF
	bra  58.b		; 80 3A
	sed		; F8
	.db $82, $82, $37		; 82 82 37
	stx $ED.b,Y		; 96 ED
	sty $22.b,X		; 94 22
	rti		; 40

	ldx #$88.b		; A2 88
	adc [$22.b],Y		; 77 22
	dex		; CA
	dec A		; 3A
	sty $31.b,X		; 94 31
	and #$4022.w		; 29 22 40
	sta ($CA.b,S),Y		; 93 CA
	sty $25.b,X		; 94 25
	lda $66.b,X		; B5 66
	and #$CAAC.w		; 29 AC CA
	adc $42.b,S		; 63 42
	and #$662D.w		; 29 2D 66
	and #$CAAC.w		; 29 AC CA
	dec A		; 3A
	and $2942.w		; 2D 42 29
	eor ($66.b,S),Y		; 53 66
	and #$CAAC.w		; 29 AC CA
	dec A		; 3A
	eor ($42.b,S),Y		; 53 42
	and #$668D.w		; 29 8D 66
	and #$CAAC.w		; 29 AC CA
	dec A		; 3A
	sta $2942.w		; 8D 42 29
	and [$66.b],Y		; 37 66
	and #$CAAC.w		; 29 AC CA
	dec A		; 3A
	and [$42.b],Y		; 37 42
	lda $5B.b,X		; B5 5B
	rol $A3.b		; 26 A3
	and #$0842.w		; 29 42 08
	sbc [$22.b],Y		; F7 22
	dex		; CA
	adc $96.b,S		; 63 96
	lsr $3AED.w		; 4E ED 3A
	and #$AA55.w		; 29 55 AA
	lda ($65.b)		; B2 65
	lda ($93.b)		; B2 93
	and #$6622.w		; 29 22 66
	sbc $140062.l,X		; FF 62 00 14
	brk $00.b		; 00 00
	ora $14E07C.l,X		; 1F 7C E0 14
	cpy $15.b		; C4 15
	ror A		; 6A
	inc A		; 1A
	sta $2A7143.l		; 8F 43 71 2A
	trb $2B.b		; 14 2B
	txs		; 9A
	ora $8C14A5.l		; 0F A5 14 8C
	and ($52.b),Y		; 31 52
	lsr A		; 4A
	and $2067.w,Y		; 39 67 20
	ora $40.b		; 05 40
	cop $FF.b		; 02 FF
	adc $1F0040.l,X		; 7F 40 00 1F
	jmp ($04E0.w,X)		; 7C E0 04
	adc $01.b,S		; 63 01
	sbc $7101.w		; ED 01 71
	cop $91.b		; 02 91
	cop $20.b		; 02 20
	ora $FF.b		; 05 FF
	adc $8C14A5.l,X		; 7F A5 14 8C
	and ($52.b),Y		; 31 52
	lsr A		; 4A
	and $A067.w,Y		; 39 67 A0
	brk $DD.b		; 00 DD
	asl $D7.b,X		; 16 D7
	ora $1D50.w,X		; 1D 50 1D
	sbc ($77.b),Y		; F1 77
	sta ($04.b,X)		; 81 04
	mvp $44,$12		; 44 12 44
	ora ($1F.b),Y		; 11 1F
	brk $14.b		; 00 14
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $4F.b		; 00 4F
	and #$5298.w		; 29 98 52
	asl $691E.w		; 0E 1E 69
	ora #$7FFF.w		; 09 FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7C007F.l,X		; FF 7F 00 7C
	sta ($04.b,X)		; 81 04
	sep #$08		; E2 08
	mvp $E0,$11		; 44 11 E0
	brk $A8.b		; 00 A8
	ora ($0E.b),Y		; 11 0E
	asl $02.b,X		; 16 02
	brk $4C.b		; 00 4C
	and #$5296.w		; 29 96 52
	adc [$16.b],Y		; 77 16
	brk $00.b		; 00 00
	sty $3931.w		; 8C 31 39
	adc [$69.b]		; 67 69
	ora #$7FFF.w		; 09 FF 7F
	ora $7FFF7C.l,X		; 1F 7C FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	dec $1839.w		; CE 39 18
	adc $29.b,S		; 63 29
	and $FF.b		; 25 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $827C1F.l,X		; 7F 1F 7C 82
	php		; 08
	bit $11.b		; 24 11
	iny		; C8
	ora $2E2C.w,X		; 1D 2C 2E
	lda ($46.b),Y		; B1 46
	php		; 08
	brk $90.b		; 00 90
	brk $98.b		; 00 98
	ora ($46.b,X)		; 01 46
	brk $4D.b		; 00 4D
	and ($55.b,X)		; 21 55
	rol $5F3C.w,X		; 3E 3C 5F
	rti		; 40

	rol $54.b		; 26 54
	and [$FF.b],Y		; 37 FF
	adc $E07FFF.l,X		; 7F FF 7F E0
	trb $81.b		; 14 81
	ora $2A66.w		; 0D 66 2A
	bvc  75.b		; 50 4B
	sbc $67.b,X		; F5 67
	ror $371E.w		; 6E 1E 37
	and [$86.b],Y		; 37 86
	php		; 08
	bit $3309.w		; 2C 09 33
	asl A		; 0A
	ora $813B.w,Y		; 19 3B 81
	jsr $12AF.w		; 20 AF 12
	bit $FF09.w		; 2C 09 FF
	adc $007FFF.l,X		; 7F FF 7F 00
	ora ($C1.b,X)		; 01 C1
	ora $E9.b		; 05 E9
	jsl $C243F8.l		; 22 F8 43 C2
	tsb $55.b		; 04 55
	rol $4B1A.w		; 2E 1A 4B
	sta ($20.b,X)		; 81 20
	sbc $021F29.l,X		; FF 29 1F 02
	dec $2C76.w		; CE 76 2C
	ora #$39CE.w		; 09 CE 39
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	ora $048100.l,X		; 1F 00 81 04
	sep #$08		; E2 08
	mvp $8A,$0D		; 44 0D 8A
	ora $A5.b		; 05 A5
	trb $CE.b		; 14 CE
	and $4B18.w,Y		; 39 18 4B
	sbc [$14.b]		; E7 14
	clc		; 18
	phk		; 4B
	sbc [$14.b]		; E7 14
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $6BF17F.l,X		; FF 7F F1 6B
	sta ($04.b,X)		; 81 04
	sbc $0D4429.l		; EF 29 44 0D
	sbc [$14.b]		; E7 14
	sbc $4B1829.l		; EF 29 18 4B
	lda $14.b		; A5 14
	inc $E205.w		; EE 05 E2
	php		; 08
	and $FF25.w		; 2D 25 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C266B8.l,X		; 7F B8 66 C2
	php		; 08
	sta [$11.b]		; 87 11
	and $C222.w		; 2D 22 C2
	php		; 08
	dec $00.b		; C6 00
	nop		; EA
	trb $EA.b		; 14 EA
	trb $A0.b		; 14 A0
	ora $2D.b,X		; 15 2D
	jsl $E60000.l		; 22 00 00 E6
	trb $2D69.w		; 1C 69 2D
	inc $723D.w		; EE 3D 72
	lsr $7FFF.w		; 4E FF 7F
	sbc $08C27F.l,X		; FF 7F C2 08
	and $A722.w		; 2D 22 A7
	ora ($A7.b),Y		; 11 A7
	bpl -85.b		; 10 AB
	and $EA.b,X		; 35 EA
	trb $22.b		; 14 22
	inc A		; 1A
	bit $00.b		; 24 00
	pha		; 48
	tsb $CC.b		; 04 CC
	bpl 111.b		; 10 6F
	and $52.b		; 25 52
	lsr $16.b		; 46 16
	adc $28.b,S		; 63 28
	brk $B2.b		; 00 B2
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $840D03.l,X		; 7F 03 0D 84
	clc		; 18
	sbc [$24.b]		; E7 24
	sbc $135941.l		; EF 41 59 13
	cmp ($12.b),Y		; D1 12
	rep #$08		; C2 08
	adc $0D.b,S		; 63 0D
	sbc $12447F.l,X		; FF 7F 44 12
	dec $5A.b,X		; D6 5A
	dec $18.b		; C6 18
	bra   0.b		; 80 00
	sbc $0D637F.l,X		; FF 7F 63 0D
	sta $00.b		; 85 00
	and #$CE0D.w		; 29 0D CE
	and #$4293.w		; 29 93 42
	eor $4463.w,Y		; 59 63 44
	ora ($D1.b)		; 12 D1
	ora ($30.b)		; 12 30
	rol $FF.b,X		; 36 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $E00080.l,X		; 7F 80 00 E0
	adc $2000E3.l,X		; 7F E3 00 20
	ora ($86.b),Y		; 11 86
	rol A		; 2A
	and $8310.w,Y		; 39 10 83
	trb $CD.b		; 14 CD
	eor ($B4.b,X)		; 41 B4
	lsr $7FFF.w,X		; 5E FF 7F
	bra   0.b		; 80 00
	and $11.b		; 25 11
	dex		; CA
	ora $2A90.w,X		; 1D 90 2A
	and ($1A.b,X)		; 21 1A
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	cpx #$7F.b		; E0 7F
	sbc $00.b,S		; E3 00
	stx $2A.b		; 86 2A
	jsr $8311.w		; 20 11 83
	trb $28.b		; 14 28
	and #$5EB4.w		; 29 B4 5E
	cmp ($19.b,X)		; C1 19
	adc $FF2B.w		; 6D 2B FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $002809.l,X		; 7F 09 28 00
	bmi -124.b		; 30 84
	bpl -58.b		; 10 C6
	jmp ($1226.w,X)		; 7C 26 12
	brk $00.b		; 00 00
	dey		; 88
	ora ($B5.b)		; 12 B5
	lsr $4A.b,X		; 56 4A
	and #$7D4A.w		; 29 4A 7D
	sbc $18DF3D.l		; EF 3D DF 18
	eor $6B5A29.l,X		; 5F 29 5A 6B
	sbc $7FFF2B.l,X		; FF 2B FF 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $26.b		; 00 26
	xce		; FB
	brk $01.b		; 00 01
	cop $05.b		; 02 05
	cop $0C.b		; 02 0C
	sbc $6C.b,X		; F5 6C
	sta $202C.w,Y		; 99 2C 20
	bmi   6.b		; 30 06
	clv		; B8
	beq  92.b		; F0 5C
	phd		; 0B
	cmp ($A1.b),Y		; D1 A1
	sbc #$22C1.w		; E9 C1 22
	trb $08.b		; 14 08
	cli		; 58
	plb		; AB
	eor ($25.b,X)		; 41 25
	stz $232F.w		; 9C 2F 23
	asl A		; 0A
	eor $F6F4.w,X		; 5D F4 F6
	lda $4E6F.w,X		; BD 6F 4E
	eor ($49.b)		; 52 49
	bit $92.b		; 24 92
	eor #$9224.w		; 49 24 92
	eor #$C327.w		; 49 27 C3
	ror $ED.b,X		; 76 ED
	stz $7819.w,X		; 9E 19 78
	bvs -47.b		; 70 D1
	cmp $FCF6.w		; CD F6 FC
	adc $84.b		; 65 84
	sta ($7C.b)		; 92 7C
	lda ($F0.b)		; B2 F0
	inx		; E8
	inc $FCE1.w		; EE E1 FC
	rep #$49		; C2 49
	bit $92.b		; 24 92
	lsr $9B6D.w		; 4E 6D 9B
	ldy $6A.b,X		; B4 6A
	cmp $5D96.w,X		; DD 96 5D
	tya		; 98
	eor #$9224.w		; 49 24 92
	tda		; 7B
	lda $1A4D5F.l,X		; BF 5F 4D 1A
	lda [$65.b],Y		; B7 65
	sta [$66.b],Y		; 97 66
	ora ($49.b)		; 12 49
	bit $9A.b		; 24 9A
	tsx		; BA
	ldx $79.b,Y		; B6 79
	adc $84.b		; 65 84
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	adc ($6C.b,S),Y		; 73 6C
	sbc ($D1.b,X)		; E1 D1
	cmp $57A3.w,X		; DD A3 57
	lsr $CF.b,X		; 56 CF
	bit $93B0.w		; 2C B0 93
	inc $4240.w,X		; FE 40 42
	xce		; FB
	brk $01.b		; 00 01
	dec $95.b,X		; D6 95
	brk $01.b		; 00 01
	dec $09.b,X		; D6 09
	ora [$0A.b],Y		; 17 0A
	tsb $0C.b		; 04 0C
	phd		; 0B
	asl A		; 0A
	asl A		; 0A
	ora $0B0B.w		; 0D 0B 0B
	asl $0D0D.w		; 0E 0D 0D
	ora $100C00.l		; 0F 00 0C 10
	cop $0C.b		; 02 0C
	ora ($0F.b),Y		; 11 0F
	ora $0C0512.l		; 0F 12 05 0C
	ora ($10.b,S),Y		; 13 10
	bpl  20.b		; 10 14
	ora ($12.b)		; 12 12
	ora $0E.b,X		; 15 0E
	asl $1316.w		; 0E 16 13
	ora ($17.b,S),Y		; 13 17
	trb $14.b		; 14 14
	clc		; 18
	ora ($0F.b),Y		; 11 0F
	ora $0C03.w,Y		; 19 03 0C
	inc A		; 1A
	asl $1B06.w		; 0E 06 1B
	tsb $1C18.w		; 0C 18 1C
	ora $1A.b,X		; 15 1A
	asl $1616.w,X		; 1E 16 16
	ora $201717.l,X		; 1F 17 17 20
	ora $211C.w,Y		; 19 1C 21
	jsr $221B.w		; 20 1B 22
	and ($21.b,X)		; 21 21
	ora $0800.w,X		; 1D 00 08
	brk $08.b		; 00 08
	ora $18.b,S		; 03 18
	ora ($0C.b,X)		; 01 0C
	asl $1E1E.w,X		; 1E 1E 1E
	ora ($4C.b,X)		; 01 4C
	clc		; 18
	jsl $012222.l		; 22 22 22 01
	sty $1F1F.w		; 8C 1F 1F
	ora $0C0907.l,X		; 1F 07 09 0C
	brk $26.b		; 00 26
	xce		; FB
	brk $01.b		; 00 01
	dec $04.b		; C6 04
	ora $94.b,S		; 03 94
	sbc $B1926D.l		; EF 6D 92 B1
	plx		; FA
	phd		; 0B
	cmp ($EC.b,X)		; C1 EC
	ora ($C1.b),Y		; 11 C1
	tax		; AA
	bvs -102.b		; 70 9A
	ora ($A4.b,S),Y		; 13 A4
	tsb $8C.b		; 04 8C
	cmp $A8.b,S		; C3 A8
	and $92.b,S		; 23 92
	and ($03.b)		; 32 03
	ldx $67.b		; A6 67
	lda ($D7.b,S),Y		; B3 D7
	cmp ($24.b),Y		; D1 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$6626.w		; 49 26 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	ror $64.b		; 66 64
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$9B24.w		; 49 24 9B
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	stz $92.b		; 64 92
	sed		; F8
	clv		; B8
	ldy $6D5E.w,X		; BC 5E 6D
	adc $AE5D.w,X		; 7D 5D AE
	inc $BC.b,X		; F6 BC
	cmp $C55B97.l,X		; DF 97 5B C5
	lda $4B1717.l		; AF 17 17 4B
	cmp $EDD6.w		; CD D6 ED
	adc $6666A6.l,X		; 7F A6 66 66
	ror $49.b		; 66 49
	and $5A6B.w		; 2D 6B 5A
	dec $B5.b,X		; D6 B5
	lda $2469.w		; AD 69 24
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $4B92.w,Y		; 99 92 4B
	dec $BEFD.w,X		; DE FD BE
	sbc $BF73.w		; ED 73 BF
	sbc [$17.b],Y		; F7 17
	ora [$CD.b],Y		; 17 CD
	dex		; CA
	eor #$6626.w		; 49 26 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	ror $64.b		; 66 64
	sta ($E7.b)		; 92 E7
	stz $BB.b,X		; 74 BB
	eor $2EEE.w,X		; 5D EE 2E
	eor ($49.b)		; 52 49
	bit $93.b		; 24 93
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($49.b)		; 32 49
	rtl		; 6B

	phy		; 5A
	dec $B5.b,X		; D6 B5
	lda $5A6B.w		; AD 6B 5A
	cmp ($4C.b)		; D2 4C
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cmp $FB26D2.l,X		; DF D2 26 FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	eor $5432.w,Y		; 59 32 54
	stz $29.b,X		; 74 29
	jsr $1DB7.w		; 20 B7 1D
	asl $07.b,X		; 16 07
	sty $01C4.w		; 8C C4 01
	sbc $030A.w		; ED 0A 03
	tsx		; BA
	and $00.b		; 25 00
	inx		; E8
	eor $B8.b		; 45 B8
	ora $01.b,X		; 15 01
	and $B81084.l,X		; 3F 84 10 B8
	beq -125.b		; F0 83
	bit $92.b		; 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$273F.w		; 49 3F 27
	ora ($26.b,S),Y		; 13 26
	lsr $E3.b		; 46 E3
	adc ($B8.b),Y		; 71 B8
	jmp.w [$376E]		; DC 6E 37
	tas		; 1B
	sta $E3C6.w		; 8D C6 E3
	adc ($B8.b),Y		; 71 B8
	jmp.w [$6464]		; DC 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	stz $64.b		; 64 64
	ror $1B37.w		; 6E 37 1B
	sta $E3C6.w		; 8D C6 E3
	adc ($B8.b),Y		; 71 B8
	jmp.w [$886E]		; DC 6E 88
	sbc #$A293.w		; E9 93 A2
	phk		; 4B
	jmp $A2A5.w		; 4C A5 A2
	dec A		; 3A
	bit $B1.b		; 24 B1
	lda $121D.w,Y		; B9 1D 12
	cli		; 58
	jmp.w [$6464]		; DC 64 64
	stz $64.b		; 64 64
	ror $1B37.w		; 6E 37 1B
	sta $E3C6.w		; 8D C6 E3
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and #$A69B.w		; 29 9B A6
	stx $B99A.w		; 8E 9A B9
	stx $A26B.w		; 8E 6B A2
	tsx		; BA
	jmp ($9CE7.w)		; 6C E7 9C
	xce		; FB
	lda $3A.b,S		; A3 3A
	ror $EEE8.w		; 6E E8 EE
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	eor ($04.b)		; 52 04
	php		; 08
	bpl  32.b		; 10 20
	rti		; 40

	sta ($07.b,X)		; 81 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$02.b]		; 07 02
	tsb $08.b		; 04 08
	bpl  32.b		; 10 20
	rti		; 40

	stx $BE.b,Y		; 96 BE
	adc $38.b		; 65 38
	and #$40C9.w		; 29 C9 40
	eor ($0A.b)		; 52 0A
	stz $52.b,X		; 74 52
	sta $3B.b		; 85 3B
	plp		; 28
	lsr A		; 4A
	sei		; 78
	lsr $E929.w		; 4E 29 E9
	lsr A		; 4A
	sty $F8.b,X		; 94 F8
	lda [$E5.b]		; A7 E5
	rti		; 40

	rol A		; 2A
	asl A		; 0A
	bvc -110.b		; 50 92
	stx $94.b		; 86 94
	mvp $A5,$A2		; 44 A2 A5
	ora $E928.w,Y		; 19 28 E9
	pha		; 48
	lsr A		; 4A
	lsr A		; 4A
	eor ($92.b)		; 52 92
	stx $94.b,Y		; 96 94
	cpy $A6.b		; C4 A6
	lda $39.b		; A5 39
	and #$50E9.w		; 29 E9 50
	lsr A		; 4A
	bit #$8A54.w		; 89 54 8A
	ldx $55.b		; A6 55
	.db $42, $AA		; 42 AA
	sta $58.b,X		; 95 58
	tax		; AA
	sbc $58.b		; E5 58
	rol A		; 2A
	cmp #$8A56.w		; C9 56 8A
	ldx $55.b,Y		; B6 55
.ACCU 16
	rep #$AE		; C2 AE
	sta $78.b,X		; 95 78
	plb		; AB
	sbc $60.b		; E5 60
	phk		; 4B
	asl A		; 0A
	cli		; 58
	sta ($C6.b)		; 92 C6
	stx $44.b,Y		; 96 44
	lda ($A5.b)		; B2 A5
	sta $E92C.w,Y		; 99 2C E9
	pla		; 68
	phk		; 4B
	lsr A		; 4A
	phy		; 5A
	sta ($D6.b)		; 92 D6
	stx $C4.b,Y		; 96 C4
	ldx $A5.b,Y		; B6 A5
	lda $E92D.w,Y		; B9 2D E9
	bvs  75.b		; 70 4B
	txa		; 8A
	jmp $57E68A.l		; 5C 8A E6 57
	.db $42, $BA		; 42 BA
	sta $D8.b,X		; 95 D8
	ldx $78E5.w		; AE E5 78
	pld		; 2B
	cmp #$8A5E.w		; C9 5E 8A
	cli		; 58
	lda $4B7C65.l		; AF 65 7C 4B
	nop		; EA
	eor $98FE92.l,X		; 5F 92 FE 98
	tsb $C0.b		; 04 C0
	ldx $09.b		; A6 09
	bmi 105.b		; 30 69
	sty $4C.b		; 84 4C
	rol A		; 2A
	adc ($93.b,X)		; 61 93
	asl $8498.w		; 0E 98 84
	cpy $A6.b		; C4 A6
	and #$6931.w		; 29 31 69
	sty $6A4C.w		; 8C 4C 6A
	adc $93.b,S		; 63 93
	asl $0499.w,X		; 1E 99 04
	iny		; C8
	stx $48.b,Y		; 96 48
	lda ($65.b)		; B2 65
	sty $2C.b,X		; 94 2C
	lda #$8B65.w		; A9 65 8B
	rol $8259.w		; 2E 59 82
	cpy $6896.w		; CC 96 68
	lda ($69.b,S),Y		; B3 69
	stz $EA4C.w		; 9C 4C EA
	adc [$93.b]		; 67 93
	rol $049A.w,X		; 3E 9A 04
	bne -90.b		; D0 A6
	bit #$6934.w		; 89 34 69
	ldy $4D.b		; A4 4D
	rol A		; 2A
	adc #$4E93.w		; 69 93 4E
	txs		; 9A
	sty $D4.b		; 84 D4
	ldx $A9.b		; A6 A9
	and $69.b,X		; 35 69
	ldy $6A4D.w		; AC 4D 6A
	rtl		; 6B

	sta ($5E.b,S),Y		; 93 5E
	txy		; 9B
	tsb $D8.b		; 04 D8
	stx $C8.b,Y		; 96 C8
	ldx $65.b,Y		; B6 65
	ldy $2D.b,X		; B4 2D
	lda #$8B6D.w		; A9 6D 8B
	ror $825B.w		; 6E 5B 82
	jmp.w [$E896]		; DC 96 E8
	lda [$69.b],Y		; B7 69
	ldy $EA4D.w,X		; BC 4D EA
	adc $9C7E93.l		; 6F 93 7E 9C
	tsb $E0.b		; 04 E0
	lda [$09.b]		; A7 09
	sec		; 38
	adc #$4EC4.w		; 69 C4 4E
	rol A		; 2A
	adc ($93.b),Y		; 71 93
	stx $849C.w		; 8E 9C 84
	cpx $A7.b		; E4 A7
	and #$6939.w		; 29 39 69
	cpy $6A4E.w		; CC 4E 6A
	adc ($93.b,S),Y		; 73 93
	stz $049D.w,X		; 9E 9D 04
	inx		; E8
	sta [$49.b],Y		; 97 49
	sta ($EC.b)		; 92 EC
	sta [$64.b],Y		; 97 64
	tyx		; BB
	and $D9.b		; 25 D9
	rol $9BCE.w		; 2E CE 9B
	dec A		; 3A
	sty $B3EA.w		; 8C EA B3
	ldy $BBCE.w		; AC CE BB
	tsa		; 3B
	tsb $B2EC.w		; 0C EC B2
	phk		; 4B
	tsa		; 3B
	jmp $B3ED.w		; 4C ED B3
	clv		; B8
	dec $26EB.w		; CE EB 26
	ora $7BDE.w,Y		; 19 DE 7B
	ldx $81F7.w,Y		; BE F7 81
	sbc $27DE0B.l		; EF 0B DE 27
	ldy $786F.w,X		; BC 6F 78
	dec $BDF1.w,X		; DE F1 BD
	cpx $8C.b		; E4 8C
	sta [$BC.b],Y		; 97 BC
	lda [$BC.b]		; A7 BC
	lda [$BA.b],Y		; B7 BA
	rol $3F.b,X		; 36 3F
	bmi -68.b		; 30 BC
	dec $79.b,X		; D6 79
	cpy $D9F3.w		; CC F3 D9
	inx		; E8
	and ($D1.b,S),Y		; 33 D1
	adc [$A4.b]		; 67 A4
	cmp $A39E4D.l		; CF 4D 9E A3
	and $7A56.w,X		; 3D 56 7A
	cpy $D9F5.w		; CC F5 D9
	cpx $D933.w		; EC 33 D9
	adc [$B4.b]		; 67 B4
	cmp $E39E6D.l		; CF 6D 9E E3
	and $7BD6.w,X		; 3D D6 7B
	cpy $D9F7.w		; CC F7 D9
	beq  61.b		; F0 3D
	beq -67.b		; F0 BD
	sbc ($3D.b),Y		; F1 3D
	sbc ($BD.b),Y		; F1 BD
	sbc ($3D.b)		; F2 3D
	sbc ($BD.b)		; F2 BD
	sbc ($3D.b,S),Y		; F3 3D
	sbc ($BD.b,S),Y		; F3 BD
	pea $F43D.w		; F4 3D F4
	lda $3DF5.w,X		; BD F5 3D
	sbc $BD.b,X		; F5 BD
	inc $33.b,X		; F6 33
	sbc $DC67.w		; ED 67 DC
	cmp $839FBD.l		; CF BD 9F 83
	and $4C7E16.l,X		; 3F 16 7E 4C
	jsr ($FAD9.w,X)		; FC D9 FA
	and ($F5.b,S),Y		; 33 F5
	adc [$EC.b]		; 67 EC
	cmp $C39FDD.l		; CF DD 9F C3
	and $4C7F96.l,X		; 3F 96 7F 4C
	inc $FED9.w,X		; FE D9 FE
	and ($FD.b,S),Y		; 33 FD
	adc [$FC.b]		; 67 FC
	cmp $FF84FD.l		; CF FD 84 FF
	cpy #$F1.b		; C0 F1
	lda $93F911.l,X		; BF 11 F9 93
	inx		; E8
	jsr ($F9CD.w,X)		; FC CD F9
	lda $F3.b,S		; A3 F3
	eor [$D8.b],Y		; 57 D8
	xce		; FB
	eor $D9FC8A.l,X		; 5F 8A FC D9
	lda $C6F635.l		; AF 35 F6 C6
	jmp ($B1DD.w)		; 6C DD B1
	phx		; DA
	lda $9C0D.w		; AD 0D 9C
	rol $72.b,X		; 36 72
	cld		; D8
	tas		; 1B
	and ($B3.b,X)		; 21 B3
	ldx $CA.b		; A6 CA
	rol $76.b,X		; 36 76
	cld		; D8
	tad		; 5B
	bit $9B6B.w,X		; 3C 6B 9B
	and $AB6C.w,X		; 3D 6C AB
	adc [$CD.b]		; 67 CD
	sta $E8009D.l,X		; 9F 9D 00 E8
	and [$42.b]		; 27 42
	ror $FD86.w,X		; 7E 86 FD
	ora ($FA.b),Y		; 11 FA
	pld		; 2B
	pea $E867.w		; F4 67 E8
	sbc $A41FD2.l		; EF D2 1F A4
	lda $2D6D4A.l,X		; BF 4A 6D 2D
	ldy $C6.b,X		; B4 C6
	cmp ($5B.b,S),Y		; D3 5B
	lsr $3A6D.w		; 4E 6D 3A
	cmp ($4F.b),Y		; D1 4F
	adc $B541.w		; 6D 41 B5
	asl $D4.b,X		; 16 D4
	txy		; 9B
	eor ($6D.b,S),Y		; 53 6D
	eor ($B5.b),Y		; 51 B5
	lsr $D5.b,X		; 56 D5
	txy		; 9B
	eor [$6D.b],Y		; 57 6D
	adc ($B5.b,X)		; 61 B5
	stx $D6.b,Y		; 96 D6
	txy		; 9B
	tad		; 5B
	adc $B571.w		; 6D 71 B5
	dec $D7.b,X		; D6 D7
	sta $60BFAF.l,X		; 9F AF BF 60
	ror $FDC2.w,X		; 7E C2 FD
	bit #$1BFB.w		; 89 FB 1B
	inc $47.b,X		; F6 47
	cpx $D9AF.w		; EC AF D9
	sta $68BFB3.l,X		; 9F B3 BF 68
	ror $DBD2.w,X		; 7E D2 DB
	eor ($6D.b,S),Y		; 53 6D
	adc $36B6.w		; 6D B6 36
	phx		; DA
	stp		; DB
	adc ($6D.b,S),Y		; 73 6D
	sbc $36B8.w		; ED B8 36
.INDEX 8
	sep #$DB		; E2 DB
	sta ($6E.b,S),Y		; 93 6E
	adc $36BA.w		; 6D BA 36
	nop		; EA
	stp		; DB
	lda ($6E.b,S),Y		; B3 6E
	sbc $36BC.w		; ED BC 36
	sbc ($DB.b)		; F2 DB
	cmp ($65.b,S),Y		; D3 65
	sta $597E96.l,X		; 9F 96 7E 59
	xce		; FB
	stp		; DB
	sbc [$C7.b],Y		; F7 C7
	sbc $9FDFAF.l		; EF AF DF 9F
	lda $7F80BF.l,X		; BF BF 80 7F
	cop $FE.b		; 02 FE
	ora #$1BFC.w		; 09 FC 1B
	sed		; F8
	eor [$F0.b]		; 47 F0
	lda $879BE1.l		; AF E1 9B 87
	jmp $57E242.l		; 5C 42 E2 57
	trb $B8.b		; 14 B8
	lda $C5.b,X		; B5 C5
	ldx $7131.w		; AE 31 71
	plb		; AB
	stx $7A5C.w		; 8E 5C 7A
	cpx $17.b		; E4 17
	jsl $C925B9.l		; 22 B9 25 C9
	ldx $7251.w		; AE 51 72
	bcs 101.b		; B0 65
	ldy #$CB.b		; A0 CB
	cmp ($97.b,X)		; C1 97
	sta $31.b,S		; 83 31
	asl $65.b		; 06 65
	adc ($50.b,S),Y		; 73 50
	ror $E0.b		; 66 E0
	dec $9D41.w		; CE 41 9D
	sta $3D.b,S		; 83 3D
	asl $7E.b		; 06 7E
	ora $1A04.w		; 0D 04 1A
	clc		; 18
	bit $50.b,X		; 34 50
	pla		; 68
	cpx #$D2.b		; E0 D2
	asl $7495.w,X		; 1E 95 74
	wai		; CB
	lda [$5D.b]		; A7 5D
	.db $42, $EA		; 42 EA
	eor [$54.b],Y		; 57 54
	tsx		; BA
	lda $D6.b,X		; B5 D6
	rol $75B5.w		; 2E B5 75
	wai		; CB
	lda $EC825D.l		; AF 5D 82 EC
	eor [$64.b],Y		; 57 64
	tyx		; BB
	and $DA.b,X		; 35 DA
	eor ($B5.b,X)		; 41 B5
	sta $6D.b,S		; 83 6D
	asl $DD.b		; 06 DD
	adc [$0B.b],Y		; 77 0B
	lda $7583.w,Y		; B9 83 75
	asl $EE.b		; 06 EE
	ora $1BE4.w		; 0D E4 1B
	cld		; D8
	and [$CB.b],Y		; 37 CB
	lda $1C045E.l,X		; BF 5E 04 1C
	clc		; 18
	sec		; 38
	bvc 112.b		; 50 70
	cpx #$E2.b		; E0 E2
	ora $CB7815.l,X		; 1F 15 78 CB
	cmp [$5E.b]		; C7 5E
	.db $42, $F2		; 42 F2
	eor [$94.b],Y		; 57 94
	ldy $E6B5.w,X		; BC B5 E6
	and $CB7935.l		; 2F 35 79 CB
	cmp $F4825E.l		; CF 5E 82 F4
	eor [$A4.b],Y		; 57 A4
	lda ($F0.b)		; B2 F0
	stz $E0.b,X		; 74 E0
	nop		; EA
	eor ($D5.b,X)		; 41 D5
	lsr $F5B2.w,X		; 5E B2 F5
	cmp [$B0.b],Y		; D7 B0
	lda $9295.w,X		; BD 95 92
	lda $EDA5.w,X		; BD A5 ED
	lda $AB7B71.l		; AF 71 7B AB
	bmi -77.b		; 30 B3
	phd		; 0B
	dec $FC5E.w,X		; DE 5E FC
	asl $F005.w,X		; 1E 05 F0
	lda $6B7C89.l		; AF 89 7C 6B
	cpx $8C.b		; E4 8C
	sta $F2.b,X		; 95 F2
	sta [$CB.b],Y		; 97 CB
	eor $D57C31.l,X		; 5F 31 7C D5
	sbc ($97.b,S),Y		; F3 97
	cmp $7D415F.l		; CF 5F 41 7D
	ora $F4.b,X		; 15 F4
	sta [$D3.b],Y		; 97 D3
	sta $D4.b,S		; 83 D4
	sta $D5.b,S		; 83 D5
	sta $D6.b,S		; 83 D6
	sta $D7.b,S		; 83 D7
	eor $957D61.l,X		; 5F 61 7D 95
	inc $97.b,X		; F6 97
	stp		; DB
	eor $DA7A71.l,X		; 5F 71 7A DA
	sbc $E57D75.l,X		; FF 75 7D E5
	sbc [$D7.b],Y		; F7 D7
	cpx #$5F.b		; E0 5F
	stx $0F.b		; 86 0F
	bit #$387E.w		; 89 7E 38
	rol $F945.w,X		; 3E 45 F9
	eor [$E6.b],Y		; 57 E6
	eor $857E9D.l,X		; 5F 9D 7E 85
	plx		; FA
	eor [$EA.b],Y		; 57 EA
	eor $C57EAD.l,X		; 5F AD 7E C5
	xce		; FB
	eor [$EE.b],Y		; 57 EE
	eor $057FBD.l,X		; 5F BD 7F 05
	jsr ($F257.w,X)		; FC 57 F2
	sta $F3.b,S		; 83 F3
	sta $F4.b,S		; 83 F4
	sta $F5.b,S		; 83 F5
	sta $F6.b,S		; 83 F6
	eor $857FDD.l,X		; 5F DD 7F 85
	inc $FA57.w,X		; FE 57 FA
	eor $C57FED.l,X		; 5F ED 7F C5
	sbc $5FFE57.l,X		; FF 57 FE 5F
	sbc $414A.w,X		; FD 4A 41
	iny		; C8
	bit #$6522.w		; 89 22 65
	and ($04.b,X)		; 21 04
	cpy $044D.w		; CC 4D 04
	pei ($30.b)		; D4 30
	bit $4D.b,X		; 34 4D
	mvp $36,$51		; 44 51 36
	ora $D4C407.l		; 0F 07 C4 D4
	lsr $91.b		; 46 91
	and [$91.b],Y		; 37 91
	asl $C842.w,X		; 1E 42 C8
	ora ($27.b)		; 12 27
	cop $72.b		; 02 72
	jsr $0412.w		; 20 12 04
	inx		; E8
	lsr $A084.w		; 4E 84 A0
	sta $1789.w,X		; 9D 89 17
	clc		; 18
	mvp $3A,$F0		; 44 F0 3A
	mvp $44,$F6		; 44 F6 44
	ldy $BA84.w		; AC 84 BA
	cmp $E24FA2.l		; CF A2 4F E2
	bne  35.b		; D0 23
	bvc  98.b		; 50 62
	bne -94.b		; D0 A2
	bne -30.b		; D0 E2
	cmp ($22.b),Y		; D1 22
	cmp ($62.b),Y		; D1 62
	cmp ($A2.b),Y		; D1 A2
	cmp ($E2.b),Y		; D1 E2
	cmp ($05.b)		; D2 05
	rol $2D.b		; 26 2D
	plp		; 28
	eor ($C5.b)		; 52 C5
	bmi  83.b		; 30 53
	eor $38.b		; 45 38
	eor ($C5.b,S),Y		; 53 C5
	rti		; 40

	mvn $48,$45		; 54 45 48
	mvn $50,$C5		; 54 C5 50
	eor $45.b,X		; 55 45
	cli		; 58
	eor $C5.b,X		; 55 C5
	rts		; 60

	lsr $61.b,X		; 56 61
	lda $5B43.w		; AD 43 5B
	stx $B9.b		; 86 B9
	ora $2576.w		; 0D 76 25
	ply		; 7A
	and $7C.b		; 25 7C
	cli		; 58
	ora $86.b		; 05 86
	and $88.b,X		; 35 88
	cli		; 58
.INDEX 8
	sep #$D9		; E2 D9
	jsl $D962D9.l		; 22 D9 62 D9
	ldx #$D9.b		; A2 D9
.INDEX 8
	sep #$DA		; E2 DA
	ora $A4.b		; 05 A4
	phy		; 5A
	sta $AC.b		; 85 AC
	tad		; 5B
	ora $B4.b		; 05 B4
	tad		; 5B
	sta $BC.b		; 85 BC
	jmp $5CC405.l		; 5C 05 C4 5C
	sta $CC.b		; 85 CC
	eor $D405.w,X		; 5D 05 D4
	eor $DC85.w,X		; 5D 85 DC
	lsr $E405.w,X		; 5E 05 E4
	lsr $B484.w,X		; 5E 84 B4
	and [$B8.b],Y		; 37 B8
	adc $62DF90.l		; 6F 90 DF 62
	eor $60FC85.l,X		; 5F 85 FC 60
	asl $04.b		; 06 04
	rts		; 60

	stx $0C.b		; 86 0C
	adc ($06.b,X)		; 61 06
	trb $61.b		; 14 61
	stx $1C.b		; 86 1C
	.db $62, $06, $24		; 62 06 24
	.db $62, $86, $2C		; 62 86 2C
	adc $06.b,S		; 63 06
	bit $63.b,X		; 34 63
	stx $3C.b		; 86 3C
	stz $06.b		; 64 06
	mvp $86,$64		; 44 64 86
	jmp $0665.w		; 4C 65 06
	mvn $86,$65		; 54 65 86
	jmp $640666.l		; 5C 66 06 64
	ror $85.b		; 66 85
	plx		; FA
	sbc ($9B.b,S),Y		; F3 9B
	sta [$39.b]		; 87 39
	ora ($3B.b,S),Y		; 13 3B
	tas		; 1B
	and $3F1B.w,X		; 3D 1B 3F
	tas		; 1B
	rti		; 40

	bit $23.b,X		; 34 23
	mvp $C3,$2F		; 44 2F C3
	lsr $34.b		; 46 34
	sta ($B4.b),Y		; 91 B4
	lda ($B4.b),Y		; B1 B4
	cmp $4E.b,S		; C3 4E
	and $03.b,X		; 35 03
	eor ($35.b)		; 52 35
	eor $56.b,S		; 43 56
	and $83.b,X		; 35 83
	phy		; 5A
	and $C3.b,X		; 35 C3
	lsr $0336.w,X		; 5E 36 03
	.db $62, $36, $43		; 62 36 43
	ror $36.b		; 66 36
	sta $6B.b,S		; 83 6B
	asl $1DDA.w		; 0E DA 1D
	ldy $883B.w,X		; BC 3B 88
	adc [$30.b],Y		; 77 30
	inc $DDA1.w		; EE A1 DD
	cpy $DE.b		; C4 DE
	lsr $DE.b		; 46 DE
	dec $DF.b		; C6 DF
	lsr $DF.b		; 46 DF
	cmp $E0.b		; C5 E0
	asl $E108.w		; 0E 08 E1
	asl $E218.w		; 0E 18 E2
	asl $E328.w		; 0E 28 E3
	asl $E438.w		; 0E 38 E4
	asl $E548.w		; 0E 48 E5
	asl $E658.w		; 0E 58 E6
	asl $E768.w		; 0E 68 E7
	asl $E878.w		; 0E 78 E8
	asl $E988.w		; 0E 88 E9
	ora #$D371.w		; 09 71 D3
	sta [$A9.b]		; 87 A9
	ora $B41E56.l		; 0F 56 1E B4
	and $7A78.w,X		; 3D 78 7A
	beq -10.b		; F0 F6
	and ($32.b,X)		; 21 32
	cpx $2289.w		; EC 89 22
	pha		; 48
	sta ($24.b)		; 92 24
	stx $EDD0.w		; 8E D0 ED
	bit #$4822.w		; 89 22 48
	sta ($24.b)		; 92 24
	stx $92E0.w		; 8E E0 92
	bit $89.b		; 24 89
	and $BA.b,S		; 23 BA
	rol $25.b		; 26 25
	ror $25.b		; 66 25
	ror $25.b		; 66 25
	tda		; 7B
	cmp ($B3.b)		; D2 B3
	ora ($B3.b)		; 12 B3
	ora ($B3.b)		; 12 B3
	ora ($BD.b)		; 12 BD
	sed		; F8
	stz $C3.b		; 64 C3
	cpx #$87.b		; E0 87
	cmp $0F.b,S		; C3 0F
	txa		; 8A
	ora $383E14.l,X		; 1F 14 3E 38
	lsr $C850.w		; 4E 50 C8
	iny		; C8
	iny		; C8
	sbc $9C.b,S		; E3 9C
	adc ($8E.b,S),Y		; 73 8E
	adc ($CE.b),Y		; 71 CE
	and $C791.w,Y		; 39 91 C7
	sec		; 38
	sbc [$1C.b]		; E7 1C
	sbc $9C.b,S		; E3 9C
	adc ($8E.b,S),Y		; 73 8E
	adc ($CE.b),Y		; 71 CE
	and $9191.w,Y		; 39 91 91
	sta ($C7.b),Y		; 91 C7
	sec		; 38
	sbc [$1C.b]		; E7 1C
	sbc $99.b,S		; E3 99
	trb $CAA1.w		; 1C A1 CA
	trb $CAA1.w		; 1C A1 CA
	trb $CAA1.w		; 1C A1 CA
	ora $2479.w,Y		; 19 79 24
	sbc $28867F.l,X		; FF 7F 86 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $A1.b,S		; 03 A1
	brk $E2.b		; 00 E2
	brk $84.b		; 00 84
	ora $26.b		; 05 26
	cop $AA.b		; 02 AA
	ora ($E9.b)		; 12 E9
	ora $2924.w,Y		; 19 24 29
	sta [$31.b]		; 87 31
	lda ($56.b),Y		; B1 56
	cpx #$60.b		; E0 60
	sty $4231.w		; 8C 31 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $FF.b,S		; 03 FF
	adc $8411D2.l,X		; 7F D2 11 84
	ora $97.b		; 05 97
	rol $094F.w		; 2E 4F 09
	tay		; A8
	brk $82.b		; 00 82
	php		; 08
	eor $0E.b,S		; 43 0E
	ora $60E03F.l		; 0F 3F E0 60
	sty $4231.w		; 8C 31 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $8C.b,S		; 03 8C
	and ($E0.b),Y		; 31 E0
	rts		; 60

	sep #$08		; E2 08
	mvp $85,$0D		; 44 0D 85
	ora $11C7.w		; 0D C7 11
	phk		; 4B
	asl $79.b,X		; 16 79
	and [$71.b],Y		; 37 71
	inc A		; 1A
	bra   0.b		; 80 00
	asl $4216.w		; 0E 16 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $8C.b,S		; 03 8C
	and ($E0.b),Y		; 31 E0
	rts		; 60

	.db $42, $14		; 42 14
	and #$3939.w		; 29 39 39
	adc $4408E2.l,X		; 7F E2 08 44
	ora $0D85.w		; 0D 85 0D
	lda $FF2A.w,Y		; B9 2A FF
	and $420080.l,X		; 3F 80 00 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $8C.b,S		; 03 8C
	and ($E0.b),Y		; 31 E0
	rts		; 60

	rol $29.b		; 26 29
	and $779B4E.l		; 2F 4E 9B 77
	sep #$08		; E2 08
	mvp $85,$0D		; 44 0D 85
	ora $164B.w		; 0D 4B 16
	adc ($1A.b),Y		; 71 1A
	adc $4237.w,Y		; 79 37 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $8C.b,S		; 03 8C
	and ($E0.b),Y		; 31 E0
	rts		; 60

	rol $59.b		; 26 59
	cmp ($3C.b,X)		; C1 3C
	sta ($20.b,X)		; 81 20
	sep #$08		; E2 08
	mvp $85,$0D		; 44 0D 85
	ora $091A.w		; 0D 1A 09
	lda $14.b		; A5 14
	sbc $14427F.l,X		; FF 7F 42 14
	brk $00.b		; 00 00
	stx $28.b		; 86 28
	php		; 08
	and ($FF.b,X)		; 21 FF
	ora $8C.b,S		; 03 8C
	and ($E0.b),Y		; 31 E0
	rts		; 60

	sbc [$1C.b]		; E7 1C
	eor ($4A.b)		; 52 4A
	cpx #$76.b		; E0 76
	sep #$08		; E2 08
	mvp $85,$0D		; 44 0D 85
	ora $164B.w		; 0D 4B 16
	tax		; AA
	ora ($80.b)		; 12 80
	brk $42.b		; 00 42
	trb $00.b		; 14 00
	brk $86.b		; 00 86
	plp		; 28
	rol A		; 2A
	and $496C.w,X		; 3D 6C 49
	beq  85.b		; F0 55
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $1CE77F.l,X		; FF 7F E7 1C
	eor ($4A.b)		; 52 4A
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $14427F.l,X		; FF 7F 42 14
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode 00 overrunning bank boundry at 0FFFFF. Skipping.
.ENDS
