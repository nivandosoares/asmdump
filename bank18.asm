.BANK 18 SLOT 0
.ORG $0000

.SECTION "Bank18" FORCE

	brk $05.b		; 00 05
	brk $04.b		; 00 04
	tay		; A8
	ora $00.b		; 05 00
	ora $28.b,S		; 03 28
	asl $00.b		; 06 00
	cop $80.b		; 02 80
	asl $00.b		; 06 00
	ora ($B0.b,X)		; 01 B0
	asl $00.b		; 06 00
	ora ($E0.b,X)		; 01 E0
	asl $00.b		; 06 00
	tsb $88.b		; 04 88
	ora [$00.b]		; 07 00
	ora $08.b,S		; 03 08
	php		; 08
	brk $02.b		; 00 02
	rts		; 60

	php		; 08
	brk $01.b		; 00 01
	bcc   8.b		; 90 08
	brk $01.b		; 00 01
	cpy #$0008.w		; C0 08 00
	tsb $68.b		; 04 68
	ora #$0300.w		; 09 00 03
	inx		; E8
	ora #$0100.w		; 09 00 01
	clc		; 18
	asl A		; 0A
	brk $01.b		; 00 01
	pha		; 48
	asl A		; 0A
	brk $01.b		; 00 01
	sei		; 78
	asl A		; 0A
	brk $04.b		; 00 04
	jsr $000B.w		; 20 0B 00
	ora $A0.b,S		; 03 A0
	phd		; 0B
	brk $01.b		; 00 01
	bne  11.b		; D0 0B
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	brk $01.b		; 00 01
	bmi  12.b		; 30 0C
	brk $88.b		; 00 88
	sei		; 78
	bpl   0.b		; 10 00
	sta $28.b		; 85 28
	ora ($00.b,S),Y		; 13 00
	sty $50.b		; 84 50
	ora $00.b,X		; 15 00
	ora $20.b		; 05 20
	asl $00.b,X		; 16 00
	cop $78.b		; 02 78
	asl $00.b,X		; 16 00
	sty $A0.b		; 84 A0
	clc		; 18
	brk $84.b		; 00 84
	iny		; C8
	inc A		; 1A
	brk $83.b		; 00 83
	pla		; 68
	trb $0300.w		; 1C 00 03
	inx		; E8
	trb $0100.w		; 1C 00 01
	clc		; 18
	ora $8D00.w,X		; 1D 00 8D
	php		; 08
	bit $00.b		; 24 00
	bit #$28D8.w		; 89 D8 28
	brk $86.b		; 00 86
	bpl  44.b		; 10 2C
	brk $82.b		; 00 82
	plp		; 28
	and $0200.w		; 2D 00 02
	bra  45.b		; 80 2D
	brk $93.b		; 00 93
	ldy #$0037.w		; A0 37 00
	stx $3F18.w		; 8E 18 3F
	brk $89.b		; 00 89
	inx		; E8
	eor $00.b,S		; 43 00
	sta $98.b		; 85 98
	lsr $00.b		; 46 00
	ora $68.b		; 05 68
	eor [$00.b]		; 47 00
	tsb $10.b		; 04 10
	pha		; 48
	brk $03.b		; 00 03
	bcc  72.b		; 90 48
	brk $01.b		; 00 01
	cpy #$0048.w		; C0 48 00
	ora ($F0.b,X)		; 01 F0
	pha		; 48
	brk $01.b		; 00 01
	jsr $0049.w		; 20 49 00
	ora $A0.b,S		; 03 A0
	eor #$0300.w		; 49 00 03
	jsr $004A.w		; 20 4A 00
	ora ($50.b,X)		; 01 50
	lsr A		; 4A
	brk $01.b		; 00 01
	bra  74.b		; 80 4A
	brk $01.b		; 00 01
	bcs  74.b		; B0 4A
	brk $03.b		; 00 03
	bmi  75.b		; 30 4B
	brk $02.b		; 00 02
	dey		; 88
	phk		; 4B
	brk $01.b		; 00 01
	clv		; B8
	phk		; 4B
	brk $01.b		; 00 01
	inx		; E8
	phk		; 4B
	brk $01.b		; 00 01
	clc		; 18
	jmp $0400.w		; 4C 00 04
	cpy #$004C.w		; C0 4C 00
	cop $18.b		; 02 18
	eor $0100.w		; 4D 00 01
	pha		; 48
	eor $0100.w		; 4D 00 01
	sei		; 78
	eor $0100.w		; 4D 00 01
	tay		; A8
	eor $8500.w		; 4D 00 85
	cli		; 58
	bvc   0.b		; 50 00
	sty $80.b		; 84 80
	eor ($00.b)		; 52 00
	sta $20.b,S		; 83 20
	mvn $04,$00		; 54 00 04
	iny		; C8
	mvn $01,$00		; 54 00 01
	sed		; F8
	mvn $85,$00		; 54 00 85
	tay		; A8
	eor [$00.b],Y		; 57 00
	sta $48.b,S		; 83 48
	eor $8200.w,Y		; 59 00 82
	rts		; 60

	phy		; 5A
	brk $03.b		; 00 03
	cpx #$005A.w		; E0 5A 00
	ora ($10.b,X)		; 01 10
	tad		; 5B
	brk $8E.b		; 00 8E
	dey		; 88
	.db $62, $00, $89		; 62 00 89
	cli		; 58
	adc [$00.b]		; 67 00
	stx $90.b		; 86 90
	ror A		; 6A
	brk $83.b		; 00 83
	bmi 108.b		; 30 6C
	brk $02.b		; 00 02
	dey		; 88
	jmp ($8A00.w)		; 6C 00 8A
	cpx #$0071.w		; E0 71 00
	sta [$A0.b]		; 87 A0
	adc $00.b,X		; 75 00
	sta $50.b		; 85 50
	sei		; 78
	brk $82.b		; 00 82
	pla		; 68
	adc $0200.w,Y		; 79 00 02
	cpy #$0079.w		; C0 79 00
	tsb $68.b		; 04 68
	ply		; 7A
	brk $03.b		; 00 03
	inx		; E8
	ply		; 7A
	brk $01.b		; 00 01
	clc		; 18
	tda		; 7B
	brk $01.b		; 00 01
	pha		; 48
	tda		; 7B
	brk $00.b		; 00 00
	bvc 123.b		; 50 7B
	brk $06.b		; 00 06
	pha		; 48
	jmp ($0300.w,X)		; 7C 00 03
	iny		; C8
	jmp ($0200.w,X)		; 7C 00 02
	jsr $007D.w		; 20 7D 00
	cop $78.b		; 02 78
	adc $0100.w,X		; 7D 00 01
	tay		; A8
	adc $0700.w,X		; 7D 00 07
	iny		; C8
	ror $0500.w,X		; 7E 00 05
	brk $00.b		; 00 00
	ora ($03.b,X)		; 01 03
	bra   0.b		; 80 00
	ora ($01.b,X)		; 01 01
	bcs   0.b		; B0 00
	ora ($01.b,X)		; 01 01
	cpx #$0100.w		; E0 00 01
	ora $60.b,S		; 03 60
	ora ($01.b,X)		; 01 01
	ora ($90.b,X)		; 01 90
	ora ($01.b,X)		; 01 01
	ora ($C0.b,X)		; 01 C0
	ora ($01.b,X)		; 01 01
	ora ($F0.b,X)		; 01 F0
	ora ($01.b,X)		; 01 01
	brk $F8.b		; 00 F8
	ora ($01.b,X)		; 01 01
	sta [$B8.b]		; 87 B8
	ora $01.b		; 05 01
	sty $E0.b		; 84 E0
	ora [$01.b]		; 07 01
	sta $80.b,S		; 83 80
	ora #$0401.w		; 09 01 04
	plp		; 28
	asl A		; 0A
	ora ($01.b,X)		; 01 01
	cli		; 58
	asl A		; 0A
	ora ($89.b,X)		; 01 89
	plp		; 28
	ora $D88501.l		; 0F 01 85 D8
	ora ($01.b),Y		; 11 01
	sty $00.b		; 84 00
	trb $01.b		; 14 01
	ora $D0.b		; 05 D0
	trb $01.b		; 14 01
	ora ($00.b,X)		; 01 00
	ora $01.b,X		; 15 01
	stx $38.b		; 86 38
	clc		; 18
	ora ($83.b,X)		; 01 83
	cld		; D8
	ora $8201.w,Y		; 19 01 82
	beq  26.b		; F0 1A
	ora ($82.b,X)		; 01 82
	php		; 08
	trb $0101.w		; 1C 01 01
	sec		; 38
	trb $8501.w		; 1C 01 85
	inx		; E8
	asl $8301.w,X		; 1E 01 83
	dey		; 88
	jsr $8201.w		; 20 01 82
	ldy #$0121.w		; A0 21 01
	.db $82, $B8, $22		; 82 B8 22
	ora ($01.b,X)		; 01 01
	inx		; E8
	jsl $900401.l		; 22 01 04 90
	and $01.b,S		; 23 01
	ora $10.b,S		; 03 10
	bit $01.b		; 24 01
	ora ($40.b,X)		; 01 40
	bit $01.b		; 24 01
	ora ($70.b,X)		; 01 70
	bit $01.b		; 24 01
	ora ($A0.b,X)		; 01 A0
	bit $01.b		; 24 01
	tsb $48.b		; 04 48
	and $01.b		; 25 01
	ora $C8.b,S		; 03 C8
	and $01.b		; 25 01
	ora ($F8.b,X)		; 01 F8
	and $01.b		; 25 01
	ora ($28.b,X)		; 01 28
	rol $01.b		; 26 01
	ora ($58.b,X)		; 01 58
	rol $01.b		; 26 01
	ora $D8.b,S		; 03 D8
	rol $01.b		; 26 01
	ora $58.b,S		; 03 58
	and [$01.b]		; 27 01
	ora ($88.b,X)		; 01 88
	and [$01.b]		; 27 01
	ora ($B8.b,X)		; 01 B8
	and [$01.b]		; 27 01
	ora ($E8.b,X)		; 01 E8
	and [$01.b]		; 27 01
	tsb $90.b		; 04 90
	plp		; 28
	ora ($02.b,X)		; 01 02
	inx		; E8
	plp		; 28
	ora ($01.b,X)		; 01 01
	clc		; 18
	and #$0101.w		; 29 01 01
	pha		; 48
	and #$0101.w		; 29 01 01
	sei		; 78
	and #$8701.w		; 29 01 87
	sec		; 38
	and $8501.w		; 2D 01 85
	inx		; E8
	and $108401.l		; 2F 01 84 10
	and ($01.b)		; 32 01
	ora $E0.b		; 05 E0
	and ($01.b)		; 32 01
	ora ($10.b,X)		; 01 10
	and ($01.b,S),Y		; 33 01
	sta $C0.b		; 85 C0
	and $01.b,X		; 35 01
	sta $70.b		; 85 70
	sec		; 38
	ora ($82.b,X)		; 01 82
	dey		; 88
	and $0401.w,Y		; 39 01 04
	bmi  58.b		; 30 3A
	ora ($01.b,X)		; 01 01
	rts		; 60

	dec A		; 3A
	ora ($8D.b,X)		; 01 8D
	bvc  65.b		; 50 41
	ora ($89.b,X)		; 01 89
	jsr $0146.w		; 20 46 01
	stx $58.b		; 86 58
	eor #$8301.w		; 49 01 83
	sed		; F8
	lsr A		; 4A
	ora ($02.b,X)		; 01 02
	bvc  75.b		; 50 4B
	ora ($96.b,X)		; 01 96
	php		; 08
	eor [$01.b],Y		; 57 01
	sta $015F08.l		; 8F 08 5F 01
	bit #$63D8.w		; 89 D8 63
	ora ($85.b,X)		; 01 85
	dey		; 88
	ror $01.b		; 66 01
	tsb $30.b		; 04 30
	adc [$01.b]		; 67 01
	cop $88.b		; 02 88
	adc [$01.b]		; 67 01
	cop $E0.b		; 02 E0
	adc [$01.b]		; 67 01
	ora ($10.b,X)		; 01 10
	pla		; 68
	ora ($01.b,X)		; 01 01
	rti		; 40

	pla		; 68
	ora ($00.b,X)		; 01 00
	pha		; 48
	pla		; 68
	ora ($05.b,X)		; 01 05
	clc		; 18
	adc #$0301.w		; 69 01 03
	tya		; 98
	adc #$0301.w		; 69 01 03
	clc		; 18
	ror A		; 6A
	ora ($01.b,X)		; 01 01
	pha		; 48
	ror A		; 6A
	ora ($01.b,X)		; 01 01
	sei		; 78
	ror A		; 6A
	ora ($05.b,X)		; 01 05
	pha		; 48
	rtl		; 6B

	ora ($03.b,X)		; 01 03
	iny		; C8
	rtl		; 6B

	ora ($02.b,X)		; 01 02
	jsr $016C.w		; 20 6C 01
	ora ($50.b,X)		; 01 50
	jmp ($0101.w)		; 6C 01 01
	bra 108.b		; 80 6C
	ora ($03.b,X)		; 01 03
	brk $6D.b		; 00 6D
	ora ($02.b,X)		; 01 02
	cli		; 58
	adc $0101.w		; 6D 01 01
	dey		; 88
	adc $0101.w		; 6D 01 01
	clv		; B8
	adc $0101.w		; 6D 01 01
	inx		; E8
	adc $8501.w		; 6D 01 85
	tya		; 98
	bvs   1.b		; 70 01
	sty $C0.b		; 84 C0
	adc ($01.b)		; 72 01
	sta $60.b,S		; 83 60
	stz $01.b,X		; 74 01
	tsb $08.b		; 04 08
	adc $01.b,X		; 75 01
	ora ($38.b,X)		; 01 38
	adc $01.b,X		; 75 01
	bit #$7A08.w		; 89 08 7A
	ora ($85.b,X)		; 01 85
	clv		; B8
	jmp ($8401.w,X)		; 7C 01 84
	cpx #$017E.w		; E0 7E 01
	ora $B0.b		; 05 B0
	adc $000101.l,X		; 7F 01 01 00
	brk $02.b		; 00 02
	sta $020800.l		; 8F 00 08 02
	phb		; 8B
	cpx #$020D.w		; E0 0D 02
	stx $18.b		; 86 18
	ora ($02.b),Y		; 11 02
	sty $40.b		; 84 40
	ora ($02.b,S),Y		; 13 02
	cop $98.b		; 02 98
	ora ($02.b,S),Y		; 13 02
	sta $021B98.l		; 8F 98 1B 02
	phb		; 8B
	sei		; 78
	and ($02.b,X)		; 21 02
	sta [$38.b]		; 87 38
	and $02.b		; 25 02
	sta $D8.b,S		; 83 D8
	rol $02.b		; 26 02
	cop $30.b		; 02 30
	and [$02.b]		; 27 02
	tsb $D8.b		; 04 D8
	and [$02.b]		; 27 02
	ora $58.b,S		; 03 58
	plp		; 28
	cop $02.b		; 02 02
	bcs  40.b		; B0 28
	cop $01.b		; 02 01
	cpx #$0228.w		; E0 28 02
	ora ($10.b,X)		; 01 10
	and #$0502.w		; 29 02 05
	cpx #$0229.w		; E0 29 02
	ora $60.b,S		; 03 60
	rol A		; 2A
	cop $02.b		; 02 02
	clv		; B8
	rol A		; 2A
	cop $01.b		; 02 01
	inx		; E8
	rol A		; 2A
	cop $01.b		; 02 01
	clc		; 18
	pld		; 2B
	cop $05.b		; 02 05
	inx		; E8
	pld		; 2B
	cop $03.b		; 02 03
	pla		; 68
	bit $0302.w		; 2C 02 03
	inx		; E8
	bit $0102.w		; 2C 02 01
	clc		; 18
	and $0102.w		; 2D 02 01
	pha		; 48
	and $0402.w		; 2D 02 04
	beq  45.b		; F0 2D
	cop $02.b		; 02 02
	pha		; 48
	rol $0102.w		; 2E 02 01
	sei		; 78
	rol $0102.w		; 2E 02 01
	tay		; A8
	rol $0102.w		; 2E 02 01
	cld		; D8
	rol $8A02.w		; 2E 02 8A
	bmi  52.b		; 30 34
	cop $86.b		; 02 86
	pla		; 68
	and [$02.b],Y		; 37 02
	sty $90.b		; 84 90
	and $0602.w,Y		; 39 02 06
	dey		; 88
	dec A		; 3A
	cop $02.b		; 02 02
	cpx #$023A.w		; E0 3A 02
	sty $08.b		; 84 08
	and $8402.w,X		; 3D 02 84
	bmi  63.b		; 30 3F
	cop $83.b		; 02 83
	bne  64.b		; D0 40
	cop $04.b		; 02 04
	sei		; 78
	eor ($02.b,X)		; 41 02
	ora ($A8.b,X)		; 01 A8
	eor ($02.b,X)		; 41 02
	sty $4810.w		; 8C 10 48
	cop $8A.b		; 02 8A
	pla		; 68
	eor $8602.w		; 4D 02 86
	ldy #$0250.w		; A0 50 02
	sta $40.b,S		; 83 40
	eor ($02.b)		; 52 02
	cop $98.b		; 02 98
	eor ($02.b)		; 52 02
	sta ($B8.b,S),Y		; 93 B8
	jmp $308E02.l		; 5C 02 8E 30
	stz $02.b		; 64 02
	bit #$6900.w		; 89 00 69
	cop $85.b		; 02 85
	bcs 107.b		; B0 6B
	cop $03.b		; 02 03
	bmi 108.b		; 30 6C
	cop $02.b		; 02 02
	dey		; 88
	jmp ($0202.w)		; 6C 02 02
	cpx #$026C.w		; E0 6C 02
	ora ($10.b,X)		; 01 10
	adc $0102.w		; 6D 02 01
	rti		; 40

	adc $0002.w		; 6D 02 00
	pha		; 48
	adc $0302.w		; 6D 02 03
	iny		; C8
	adc $0202.w		; 6D 02 02
	jsr $026E.w		; 20 6E 02
	ora ($50.b,X)		; 01 50
	ror $0102.w		; 6E 02 01
	bra 110.b		; 80 6E
	cop $01.b		; 02 01
	bcs 110.b		; B0 6E
	cop $03.b		; 02 03
	bmi 111.b		; 30 6F
	cop $02.b		; 02 02
	dey		; 88
	adc $B80102.l		; 6F 02 01 B8
	adc $E80102.l		; 6F 02 01 E8
	adc $180102.l		; 6F 02 01 18
	bvs   2.b		; 70 02
	tsb $C0.b		; 04 C0
	bvs   2.b		; 70 02
	cop $18.b		; 02 18
	adc ($02.b),Y		; 71 02
	ora ($48.b,X)		; 01 48
	adc ($02.b),Y		; 71 02
	ora ($78.b,X)		; 01 78
	adc ($02.b),Y		; 71 02
	ora ($A8.b,X)		; 01 A8
	adc ($02.b),Y		; 71 02
	sty $D0.b		; 84 D0
	adc ($02.b,S),Y		; 73 02
	sta $70.b,S		; 83 70
	adc $02.b,X		; 75 02
	.db $82, $88, $76		; 82 88 76
	cop $03.b		; 02 03
	php		; 08
	adc [$02.b],Y		; 77 02
	ora ($38.b,X)		; 01 38
	adc [$02.b],Y		; 77 02
	sta $E8.b		; 85 E8
	adc $8202.w,Y		; 79 02 82
	brk $7B.b		; 00 7B
	cop $82.b		; 02 82
	clc		; 18
	jmp ($0202.w,X)		; 7C 02 02
	bvs 124.b		; 70 7C
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	ora $8E.b,S		; 03 8E
	sei		; 78
	ora [$03.b]		; 07 03
	bit #$0C48.w		; 89 48 0C
	ora $86.b,S		; 03 86
	bra  15.b		; 80 0F
	ora $83.b,S		; 03 83
	jsr $0311.w		; 20 11 03
	cop $78.b		; 02 78
	ora ($03.b),Y		; 11 03
	txs		; 9A
	bvc  31.b		; 50 1F
	ora $8F.b,S		; 03 8F
	bvc  39.b		; 50 27
	ora $8A.b,S		; 03 8A
	tay		; A8
	bit $8503.w		; 2C 03 85
	cli		; 58
	and $000403.l		; 2F 03 04 00
	bmi   3.b		; 30 03
	ora $80.b,S		; 03 80
	bmi   3.b		; 30 03
	ora $00.b,S		; 03 00
	and ($03.b),Y		; 31 03
	ora ($30.b,X)		; 01 30
	and ($03.b),Y		; 31 03
	ora ($60.b,X)		; 01 60
	and ($03.b),Y		; 31 03
	ora ($90.b,X)		; 01 90
	and ($03.b),Y		; 31 03
	ora $10.b,S		; 03 10
	and ($03.b)		; 32 03
	ora $90.b,S		; 03 90
	and ($03.b)		; 32 03
	ora ($C0.b,X)		; 01 C0
	and ($03.b)		; 32 03
	ora ($F0.b,X)		; 01 F0
	and ($03.b)		; 32 03
	ora ($20.b,X)		; 01 20
	and ($03.b,S),Y		; 33 03
	tsb $C8.b		; 04 C8
	and ($03.b,S),Y		; 33 03
	ora $48.b,S		; 03 48
	bit $03.b,X		; 34 03
	ora ($78.b,X)		; 01 78
	bit $03.b,X		; 34 03
	ora ($A8.b,X)		; 01 A8
	bit $03.b,X		; 34 03
	ora ($D8.b,X)		; 01 D8
	bit $03.b,X		; 34 03
	tsb $80.b		; 04 80
	and $03.b,X		; 35 03
	ora $00.b,S		; 03 00
	rol $03.b,X		; 36 03
	cop $58.b		; 02 58
	rol $03.b,X		; 36 03
	ora ($88.b,X)		; 01 88
	rol $03.b,X		; 36 03
	ora ($B8.b,X)		; 01 B8
	rol $03.b,X		; 36 03
	sta $68.b		; 85 68
	and $8403.w,Y		; 39 03 84
	bcc  59.b		; 90 3B
	ora $82.b,S		; 03 82
	tay		; A8
	bit $0403.w,X		; 3C 03 04
	bvc  61.b		; 50 3D
	ora $01.b,S		; 03 01
	bra  61.b		; 80 3D
	ora $85.b,S		; 03 85
	bmi  64.b		; 30 40
	ora $84.b,S		; 03 84
	cli		; 58
	.db $42, $03		; 42 03
	.db $82, $70, $43		; 82 70 43
	ora $04.b,S		; 03 04
	clc		; 18
	mvp $01,$03		; 44 03 01
	pha		; 48
	mvp $8F,$03		; 44 03 8F
	pha		; 48
	jmp $8B03.w		; 4C 03 8B
	plp		; 28
	eor ($03.b)		; 52 03
	stx $60.b		; 86 60
	eor $03.b,X		; 55 03
	sty $88.b		; 84 88
	eor [$03.b],Y		; 57 03
	cop $E0.b		; 02 E0
	eor [$03.b],Y		; 57 03
	sta $5ED0.w		; 8D D0 5E
	ora $8A.b,S		; 03 8A
	plp		; 28
	stz $03.b		; 64 03
	stx $60.b		; 86 60
	adc [$03.b]		; 67 03
	sta $00.b,S		; 83 00
	adc #$0203.w		; 69 03 02
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sed		; F8
	ora [$F4.b]		; 07 F4
	cop $FA.b		; 02 FA
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	pea $01FF.w		; F4 FF 01
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFFC.l,X		; FF FC FF 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	jsr ($03FF.w,X)		; FC FF 03
	tsb $0000.w		; 0C 00 00
	brk $02.b		; 00 02
	brk $12.b		; 00 12
	php		; 08
	ora ($08.b)		; 12 08
	ora ($05.b)		; 12 05
	inc A		; 1A
	eor $8A.b		; 45 8A
	bit $4B.b		; 24 4B
	trb $2B.b		; 14 2B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	php		; 08
	bmi  24.b		; 30 18
	jsr $2018.w		; 20 18 20
	clc		; 18
	jsr $209C.w		; 20 9C 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$E8.b]		; 07 E8
	ora [$78.b]		; 07 78
	cop $3D.b		; 02 3D
	sbc ($0E.b),Y		; F1 0E
	trb $0303.w		; 1C 03 03
	brk $BF.b		; 00 BF
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	lda $A70000.l,X		; BF 00 00 A7
	cli		; 58
	sta [$78.b]		; 87 78
	ldx $6E50.w		; AE 50 6E
	bcc  78.b		; 90 4E
	bcs  12.b		; B0 0C
	beq  -3.b		; F0 FD
	ora $0000.w,X		; 1D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001D.w,X		; 1D 1D 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	tsb $F7.b		; 04 F7
	cop $FA.b		; 02 FA
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	tsb $2A.b		; 04 2A
	ora $0A.b,X		; 15 0A
	ora $1CC2.w,X		; 1D C2 1C
	sbc $E7.b,S		; E3 E7
	clc		; 18
	and ($0D.b)		; 32 0D
	tsb $7F03.w		; 0C 03 7F
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($607C.w,X)		; 7C 7C 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  64.b		; 80 40
	bra -64.b		; 80 C0
	cpy #$0000.w		; C0 00 00
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
	.db $82, $40, $82		; 82 40 82
	eor ($82.b,X)		; 41 82
	and ($C0.b,S),Y		; 33 C0
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
	jsr ($F903.w,X)		; FC 03 F9
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $01FF.w,X		; FD FF 01
	brk $01.b		; 00 01
	tsb $0000.w		; 0C 00 00
	brk $2A.b		; 00 2A
	ora ($2A.b,X)		; 01 2A
	ora ($2A.b),Y		; 11 2A
	ora ($4A.b),Y		; 11 4A
	and $3982.w,X		; 3D 82 39
	dec $D7.b		; C6 D7
	plp		; 28
	ora ($0C.b)		; 12 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($00E4.w,X)		; FC E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E4.b		; 00 E4
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	ora ($FC.b,X)		; 01 FC
	ora ($FD.b,X)		; 01 FD
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	brk $48.b		; 00 48
	plp		; 28
	rti		; 40

	sei		; 78
	brk $68.b		; 00 68
	bcc  72.b		; 90 48
	bmi  -8.b		; 30 F8
	inx		; E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	inx		; E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FF00.w,X		; FE 00 FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	cpy #$0080.w		; C0 80 00
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	ora #$03F5.w		; 09 F5 03
	xce		; FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	plx		; FA
	sbc $02FFFD.l,X		; FF FD FF 02
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	sbc $03FF.w,X		; FD FF 03
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	tsa		; 3B
	bpl  56.b		; 10 38
	jsr $507B.w		; 20 7B 50
	ror $7E1E.w,X		; 7E 1E 7E
	pla		; 68
	asl $3E1E.w,X		; 1E 1E 3E
	and ($00.b)		; 32 00
	ora $003F00.l,X		; 1F 00 3F 00
	and $007F00.l,X		; 3F 00 7F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	ora $6C7F0A.l,X		; 1F 0A 7F 6C
	inc $FEF2.w,X		; FE F2 FE
	cli		; 58
	jsr ($F830.w,X)		; FC 30 F8
	cpy #$637F.w		; C0 7F 63
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$63FF.w		; C0 FF 63
	adc $F00000.l,X		; 7F 00 00 F0
	rti		; 40

	sty $00.b,X		; 94 00
	ldx $B400.w,Y		; BE 00 B4
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	sbc $009292.l,X		; FF 92 92 00
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $9292FF.l,X		; FF FF 92 92
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	jsr ($F706.w,X)		; FC 06 F7
	cop $FC.b		; 02 FC
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	adc $1D70.w,X		; 7D 70 1D
	trb $0A3F.w		; 1C 3F 0A
	jsr ($F9D0.w,X)		; FC D0 F9
	inx		; E8
	beq  96.b		; F0 60
	sbc $83.b,S		; E3 83
	jsr ($00CC.w,X)		; FC CC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $83FF00.l,X		; FF 00 FF 83
	sbc $00FCCC.l,X		; FF CC FC 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	cpx #$A0A0.w		; E0 A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpx #$A0E0.w		; E0 E0 A0
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	pla		; 68
	brk $60.b		; 00 60
	rti		; 40

	sed		; F8
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $7E.b		; 00 7E
	brk $FE.b		; 00 FE
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $F904.w,X		; FD 04 F9
	ora ($FD.b,X)		; 01 FD
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $01FF.w,X		; FD FF 01
	brk $01.b		; 00 01
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	rts		; 60

	rti		; 40

	bvs  48.b		; 70 30
	bit $30.b,X		; 34 30
	ror $50.b,X		; 76 50
	sed		; F8
	ldy #$C0EC.w		; A0 EC C0
	cmp $38008F.l		; CF 8F 00 38
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta $99F9FF.l		; 8F FF F9 99
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00F9.w,Y		; 99 F9 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FC.b		; 02 FC
	ora ($FE.b,X)		; 01 FE
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	rts		; 60

	brk $E0.b		; 00 E0
	rts		; 60

	bvs  96.b		; 70 60
	inx		; E8
	cpy #$80C0.w		; C0 C0 80
	cpx #$00A0.w		; E0 A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	ldy #$00E0.w		; A0 E0 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	tsb $0000.w		; 0C 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora $F8.b,S		; 03 F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $000C01.l,X		; FF 01 0C 00
	brk $F8.b		; 00 F8
	sbc $020000.l,X		; FF 00 00 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0C.b,S		; 03 0C
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$04.b]		; 07 04
	ora $1A1F07.l		; 0F 07 1F 1A
	ora $2E3F07.l,X		; 1F 07 3F 2E
	adc $8BFF34.l,X		; 7F 34 FF 8B
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	cpx #$F0A0.w		; E0 A0 F0
	rti		; 40

	inc $20.b		; E6 20
	beq -32.b		; F0 E0
	jsr ($FEA8.w,X)		; FC A8 FE
	ldy #$78FC.w		; A0 FC 78
	inc $20.b,X		; F6 20
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	sbc $79F9AF.l,X		; FF AF F9 79
	jsr ($AF90.w,X)		; FC 90 AF
	lda $000000.l		; AF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00AFAF.l,X		; FF AF AF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	cmp ($E3.b,X)		; C1 E3
	sta $8D.b,S		; 83 8D
	sta $BEBE.w		; 8D BE BE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora $BEFD.w		; 0D FD BE
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	tsb $F9.b		; 04 F9
	cop $FA.b		; 02 FA
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	ora $1D3F1D.l,X		; 1F 1D 3F 1D
	adc $73FF59.l,X		; 7F 59 FF 73
	sbc $E4E75E.l,X		; FF 5E E7 E4
	beq  32.b		; F0 20
	eor $005D.w,X		; 5D 5D 00
	ora $003F00.l,X		; 1F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $605D5D.l,X		; FF 5D 5D 60
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	cpx #$00E0.w		; E0 E0 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	jsr $40E0.w		; 20 E0 40
	cpy #$E0E0.w		; C0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	plp		; 28
	jsr ($0090.w,X)		; FC 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FB03.w,X)		; FC 03 FB
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	trb $3D1C.w		; 1C 1C 3D
	bit $7E.b,X		; 34 7E
	rol $66FE.w,X		; 3E FE 66
	jsr ($EA38.w,X)		; FC 38 EA
	lsr A		; 4A
	and $00003F.l,X		; 3F 3F 00 00
	brk $1C.b		; 00 1C
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FE.b		; 02 FE
	and $00003F.l,X		; 3F 3F 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FD01.w,X		; FD 01 FD
	ora ($FD.b,X)		; 01 FD
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	bvs  64.b		; 70 40
	sei		; 78
	bvs  -8.b		; 70 F8
	bne -80.b		; D0 B0
	ldy #$F8F8.w		; A0 F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0C00FF.l,X		; FF FF 00 0C
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	ora [$F6.b]		; 07 F6
	ora ($F9.b,X)		; 01 F9
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFE.l,X		; FF FE FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	inc $03FF.w,X		; FE FF 03
	tsb $0000.w		; 0C 00 00
	cop $01.b		; 02 01
	ora $02.b		; 05 02
	tsb $02.b		; 04 02
	ror $00.b		; 66 00
	tsa		; 3B
	tsb $16.b		; 04 16
	ora #$136C.w		; 09 6C 13
	cmp $020220.l,X		; DF 20 02 02
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	stz $64.b		; 64 64
	ora $0619.w,Y		; 19 19 06
	asl $24.b		; 06 24
	bit $DA.b		; 24 DA
	phx		; DA
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $9840.w		; 8C 40 98
	brk $40.b		; 00 40
	bmi  20.b		; 30 14
	rts		; 60

	asl $00C0.w		; 0E C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	sty $10.b		; 84 10
	bpl  64.b		; 10 40
	rti		; 40

	brk $00.b		; 00 00
	php		; 08
	php		; 08
	tas		; 1B
	sty $EA.b		; 84 EA
	tsb $37.b		; 04 37
	php		; 08
	and $000035.l,X		; 3F 35 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	php		; 08
	php		; 08
	cop $02.b		; 02 02
	adc $75.b,X		; 75 75
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	ldy #$00A0.w		; A0 A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	ora $F8.b		; 05 F8
	brk $FB.b		; 00 FB
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sed		; F8
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FD.b		; 00 FD
	sbc $020000.l,X		; FF 00 00 02
	tsb $0000.w		; 0C 00 00
	trb $08.b		; 14 08
	bpl   8.b		; 10 08
	cld		; D8
	cop $3A.b		; 02 3A
	ora $D0.b		; 05 D0
	and $6942BC.l		; 2F BC 42 69
	tsb $17.b		; 04 17
	php		; 08
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bne -48.b		; D0 D0
	inc A		; 1A
	inc A		; 1A
	bvc  80.b		; 50 50
	tay		; A8
	tay		; A8
	ora #$0009.w		; 09 09 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($005C.w,X)		; 7C 5C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DC.b		; 00 DC
	jmp.w [$0000]		; DC 00 00
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
	bmi   0.b		; 30 00
	tax		; AA
	brk $60.b		; 00 60
	trb $A0.b		; 14 A0
	mvn $10,$2A		; 54 2A 10
	bit $3E00.w,X		; 3C 00 3E
	rol $00.b,X		; 36 00
	brk $20.b		; 00 20
	jsr $A8A8.w		; 20 A8 A8
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	php		; 08
	php		; 08
	ror $76.b,X		; 76 76
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	rti		; 40

	brk $40.b		; 00 40
	bmi  64.b		; 30 40
	ldy #$7070.w		; A0 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
	bra  64.b		; 80 40
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	bra  32.b		; 80 20
	brk $EB.b		; 00 EB
	ora ($D2.b),Y		; 11 D2
	ora $F3.b		; 05 F3
	sbc $00FFF6.l,X		; FF F6 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	inc $FF.b,X		; F6 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	xba		; EB
	sbc $04FFE6.l,X		; FF E6 FF 04
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $06FFE6.l,X		; FF E6 FF 06
	asl $0000.w		; 0E 00 00
	phd		; 0B
	brk $E6.b		; 00 E6
	sbc $000E08.l,X		; FF 08 0E 00
	brk $F5.b		; 00 F5
	sbc $0AFFD6.l,X		; FF D6 FF 0A
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	dec $FF.b,X		; D6 FF
	tsb $000E.w		; 0C 0E 00
	brk $FE.b		; 00 FE
	sbc $0EFFC6.l,X		; FF C6 FF 0E
	asl $0000.w		; 0E 00 00
	adc $3388.w,Y		; 79 88 33
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $71.b		; 00 71
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	tay		; A8
	bra -128.b		; 80 80
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	asl $00.b		; 06 00
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	rol $4538.w,X		; 3E 38 45
	eor ($00.b,X)		; 41 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	inc A		; 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $1E11.w,X		; 1E 11 1E
	ora $003838.l		; 0F 38 38 00
	brk $20.b		; 00 20
	brk $FC.b		; 00 FC
	mvp $0C,$1F		; 44 1F 0C
	brk $00.b		; 00 00
	tsb $1000.w		; 0C 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $B8.b		; 00 B8
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $6C.b		; 00 6C
	cpy #$88B1.w		; C0 B1 88
	sbc ($71.b,X)		; E1 71
	lsr $0E4E.w		; 4E 4E 0E
	asl $0505.w		; 0E 05 05
	ora $000000.l		; 0F 00 00 00
	jsr $3100.w		; 20 00 31
	asl $80.b		; 06 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $40.b		; 00 40
	rti		; 40

.ACCU 8
	sep #$E0		; E2 E0
	sbc $424241.l,X		; FF 41 42 42
	brk $00.b		; 00 00
	tda		; 7B
	eor $20F9.w,Y		; 59 F9 20
	cpy $00.b		; C4 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	jsl $06C004.l		; 22 04 C0 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $20E000.l,X		; 3F 00 E0 20
	tad		; 5B
	cli		; 58
	sbc [$E7.b]		; E7 E7
	cpy #$E0C0.w		; C0 C0 E0
	ldy #$001F.w		; A0 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $10.b		; 00 10
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	cpx #$3034.w		; E0 34 30
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
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
	brk $05.b		; 00 05
	ora ($0E.b,X)		; 01 0E
	cop $07.b		; 02 07
	ora $1D.b		; 05 1D
	ora $0000.w,X		; 1D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $0200.w		; 0C 00 02
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	php		; 08
	bpl   0.b		; 10 00
	bcs  16.b		; B0 10
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	rts		; 60

	brk $50.b		; 00 50
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $2020.w		; 20 20 20
	beq -16.b		; F0 F0
	cli		; 58
	cli		; 58
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	php		; 08
	lda $7F7FBF.l,X		; BF BF 7F 7F
	tas		; 1B
	tas		; 1B
	ora [$07.b]		; 07 07
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $1C.b		; 00 1C
	brk $7A.b		; 00 7A
	brk $E9.b		; 00 E9
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	cpx #$80FF.w		; E0 FF 80
	sbc $F3FF12.l,X		; FF 12 FF F3
	sbc $00BFBF.l,X		; FF BF BF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	iny		; C8
	adc $1FFD.w,X		; 7D FD 1F
	sbc $5CFDFD.l,X		; FF FD FD 5C
	jmp $000000.l		; 5C 00 00 00
	brk $00.b		; 00 00
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
	bra -16.b		; 80 F0
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $0F.b		; 00 0F
	asl $02.b		; 06 02
	ora ($0C.b,X)		; 01 0C
	brk $17.b		; 00 17
	ora $1A147C.l,X		; 1F 7C 14 1A
	asl A		; 0A
	bpl   0.b		; 10 00
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	pla		; 68
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	brk $F1.b		; 00 F1
	ora ($0F.b,X)		; 01 0F
	brk $03.b		; 00 03
	ora $06.b,S		; 03 06
	.db $42, $3E		; 42 3E
	tsb $03.b		; 04 03
	tsb $5F.b		; 04 5F
	cop $FE.b		; 02 FE
	rol $00.b		; 26 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	ldy #$8000.w		; A0 00 80
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	clc		; 18
	brk $79.b		; 00 79
	brk $8F.b		; 00 8F
	stx $5C.b		; 86 5C
	tsb $FC.b		; 04 FC
	cli		; 58
	and ($20.b,X)		; 21 20
	tya		; 98
	cld		; D8
	bvs -16.b		; 70 F0
	eor $0059.w,Y		; 59 59 00
	asl $08.b		; 06 08
	brk $58.b		; 00 58
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	asl $40.b		; 06 40
	asl $00.b		; 06 00
	cop $00.b		; 02 00
	asl $D8.b		; 06 D8
	cli		; 58
	jmp ($1B00.w,X)		; 7C 00 1B
	ora ($70.b),Y		; 11 70
	jsr $0C0C.w		; 20 0C 0C
	cmp [$07.b]		; C7 07
	eor ($41.b),Y		; 51 41
	and $0028.w,Y		; 39 28 00
	ora [$04.b]		; 07 04
	brk $0A.b		; 00 0A
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	cpy #$2000.w		; C0 00 20
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	stz $00.b		; 64 00
	rts		; 60

	rts		; 60

	sed		; F8
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra   6.b		; 80 06
	brk $24.b		; 00 24
	jsr $9804.w		; 20 04 98
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $06.b		; 00 06
	tsb $03.b		; 04 03
	ora $7E.b,S		; 03 7E
	bpl -48.b		; 10 D0
	rts		; 60

	rts		; 60

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $90.b		; 00 90
	ora $000220.l		; 0F 20 02 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $5F.b		; 00 5F
	ora #$4F.b		; 09 4F
	brk $A1.b		; 00 A1
	sta ($00.b,X)		; 81 00
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	asl $0800.w,X		; 1E 00 08
	asl $00.b,X		; 16 00
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $C8.b		; 00 C8
	brk $88.b		; 00 88
	rti		; 40

	php		; 08
	brk $00.b		; 00 00
	plp		; 28
	plp		; 28
	cpy #$3840.w		; C0 40 38
	plp		; 28
	ora $407007.l		; 0F 07 70 40
	jsr $2020.w		; 20 20 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	php		; 08
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $0000.w		; 20 00 00
	bne  80.b		; D0 50
	bmi  48.b		; 30 30
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
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	beq  14.b		; F0 0E
	cmp $F004.w,X		; DD 04 F0
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $08FFD5.l,X		; FF D5 FF 08
	asl $0000.w		; 0E 00 00
	beq  32.b		; F0 20
	and ($00.b,X)		; 21 00
	ora $020108.l		; 0F 08 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne   0.b		; D0 00
	jsr $0400.w		; 20 00 04
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	jsl $F51FF7.l		; 22 F7 1F F5
	and $CA.b,X		; 35 CA
	lsr A		; 4A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	jsr $C000.w		; 20 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	ora $04.b,S		; 03 04
	brk $2E.b		; 00 2E
	rol A		; 2A
	ora $00000E.l		; 0F 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	brk $40.b		; 00 40
	tsb $C0.b		; 04 C0
	ora ($C0.b,X)		; 01 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	stx $80.b		; 86 80
	sty $10.b,X		; 94 10
	ply		; 7A
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $0027.w,Y		; 39 27 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	brk $11.b		; 00 11
	brk $0D.b		; 00 0D
	tsb $22FA.w		; 0C FA 22
	ldy #$03C0.w		; A0 C0 03
	cop $04.b		; 02 04
	tsb $6E.b		; 04 6E
	asl $0000.w		; 0E 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	cpy #$2000.w		; C0 00 20
	ora $000001.l,X		; 1F 01 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $73.b		; 02 73
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	tsb $02.b		; 04 02
	cop $00.b		; 02 00
	brk $4F.b		; 00 4F
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	rti		; 40

	ora ($80.b,X)		; 01 80
	brk $40.b		; 00 40
	ora $40.b,S		; 03 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	beq -32.b		; F0 E0
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bvs   0.b		; 70 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $DFFFF1.l,X		; FF F1 FF DF
	cmp $003B3B.l,X		; DF 3B 3B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora $FF47FF.l		; 0F FF 47 FF
	adc $E7E7FF.l,X		; 7F FF E7 E7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F0C0.w		; C0 C0 F0
	beq -64.b		; F0 C0
	cpy #$0000.w		; C0 00 00
	dec A		; 3A
	asl $0101.w,X		; 1E 01 01
	rti		; 40

	brk $F0.b		; 00 F0
	bra  60.b		; 80 3C
	bpl   8.b		; 10 08
	tsb $10.b		; 04 10
	brk $2C.b		; 00 2C
	and $0020.w,X		; 3D 20 00
	brk $00.b		; 00 00
	rti		; 40

	brk $70.b		; 00 70
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	ora $00.b,S		; 03 00
	asl $0200.w		; 0E 00 02
	sta $707044.l		; 8F 44 70 70
	adc [$75.b],Y		; 77 75
	and $007C22.l		; 2F 22 7C 00
	sei		; 78
	php		; 08
	ora $10.b,X		; 15 10
	and $308815.l,X		; 3F 15 88 30
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	bra   5.b		; 80 05
	brk $0A.b		; 00 0A
	brk $F8.b		; 00 F8
	plp		; 28
	ora $7019.w,Y		; 19 19 70
	bmi  56.b		; 30 38
	clc		; 18
	sta [$00.b]		; 87 00
	sbc $8486C0.l		; EF C0 86 84
	sty $0008.w		; 8C 08 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	cpy #$0004.w		; C0 04 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	rti		; 40

	brk $C0.b		; 00 C0
	bra 112.b		; 80 70
	bvs  20.b		; 70 14
	bpl -114.b		; 10 8E
	brk $30.b		; 00 30
	bmi  -8.b		; 30 F8
	cpy #$0000.w		; C0 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01.b		; 05 01
	ora $03.b,S		; 03 03
	cop $00.b		; 02 00
	asl A		; 0A
	cop $0A.b		; 02 0A
	brk $1A.b		; 00 1A
	bpl  52.b		; 10 34
	bpl -42.b		; 10 D6
	bne   4.b		; D0 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	php		; 08
	php		; 08
	trb $14.b		; 14 14
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	brk $40.b		; 00 40
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	pea $E60A.w		; F4 0A E6
	ora $F4.b,S		; 03 F4
	sbc $00FFE6.l,X		; FF E6 FF 00
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	inc $FF.b		; E6 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	inc $FF.b,X		; F6 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	inc $FF.b,X		; F6 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
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
	php		; 08
	php		; 08
	brk $28.b		; 00 28
	php		; 08
	plp		; 28
	brk $50.b		; 00 50
	brk $98.b		; 00 98
	bra -106.b		; 80 96
	asl $5F.b		; 06 5F
	tad		; 5B
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $40.b		; 00 40
	ora ($00.b,X)		; 01 00
	ora ($80.b,X)		; 01 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	iny		; C8
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $41.b		; 00 41
	ora ($A3.b,X)		; 01 A3
	sbc #$E1.b		; E9 E1
	.db $62, $3F, $23		; 62 3F 23
	tsb $0010.w		; 0C 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $1000.w,X		; 3E 00 10
	bra   0.b		; 80 00
	tsb $00.b		; 04 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	ora [$F2.b],Y		; 17 F2
	jsl $2BE9ED.l		; 22 ED E9 2B
	pld		; 2B
	cmp $C3.b,S		; C3 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $C0C0.w		; 20 C0 C0
	ora $1200.w		; 0D 00 12
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	sei		; 78
	rti		; 40

	bpl  16.b		; 10 10
	iny		; C8
	cpy #$1050.w		; C0 50 10
	ldy $000C.w,X		; BC 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0008.w		; C0 08 00
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
	ora $01.b,S		; 03 01
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	adc $4C.b,X		; 75 4C
	jmp ($0D66.w)		; 6C 66 0D
	ora $89E9.w		; 0D E9 89
	rol $021C.w,X		; 3E 1C 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	and $3D3B3B.l		; 2F 3B 3B 3D
	and $E2E3.w,X		; 3D E3 E2
	cpy #$B6C0.w		; C0 C0 B6
	stx $77.b,Y		; 96 77
	and ($3E.b,S),Y		; 33 3E
	trb $0000.w		; 1C 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $3F.b		; 00 3F
	jsr $4008.w		; 20 08 40
	php		; 08
	brk $00.b		; 00 00
	sec		; 38
	bmi -128.b		; 30 80
	bra -104.b		; 80 98
	bra -32.b		; 80 E0
	brk $A0.b		; 00 A0
	bra -72.b		; 80 B8
	clv		; B8
	pha		; 48
	pha		; 48
	cld		; D8
	bne   8.b		; D0 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $17.b		; 00 17
	ora [$05.b],Y		; 17 05
	ora $03.b		; 05 03
	ora $00.b,S		; 03 00
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
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl -125.b		; 10 83
	sbc $F9FFEF.l,X		; FF EF FF F9
	sbc $0000.w,Y		; F9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sed		; F8
	asl $EE.b		; 06 EE
	ora ($F9.b,X)		; 01 F9
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $F8.b		; 00 F8
	sbc $02FFF2.l,X		; FF F2 FF 02
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	ora $0E.b,S		; 03 0E
	brk $00.b		; 00 00
	sbc $EAFF.w,X		; FD FF EA
	sbc $000E04.l,X		; FF 04 0E 00
	brk $8A.b		; 00 8A
	stx $36.b		; 86 36
	asl $00.b,X		; 16 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($20.b,X)		; 01 20
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($3B.b,X)		; 01 3B
	and $E00B0B.l,X		; 3F 0B 0B E0
	bmi 120.b		; 30 78
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sed		; F8
	rts		; 60

	rts		; 60

	ora $04.b		; 05 04
	ora [$06.b]		; 07 06
	ora #$09.b		; 09 09
	ora $D2D30F.l		; 0F 0F D3 D2
	cmp $0073DF.l,X		; DF DF 73 00
	and [$77.b]		; 27 77
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $E0.b		; 00 E0
	cpx #$90D4.w		; E0 D4 90
	beq -16.b		; F0 F0
	cpy $A0C0.w		; CC C0 A0
	ldy #$4CCC.w		; A0 CC 4C
	ror $FE68.w		; 6E 68 FE
	lsr $0000.w,X		; 5E 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cop $90.b		; 02 90
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	bpl  32.b		; 10 20
	jsr $3838.w		; 20 38 38
	inc $C6.b		; E6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	bpl   2.b		; 10 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	cop $F7.b		; 02 F7
	brk $FC.b		; 00 FC
	sbc $00FFF7.l,X		; FF F7 FF 00
	asl $0000.w		; 0E 00 00
	inc $FFFF.w,X		; FE FF FF
	sbc $000E01.l,X		; FF 01 0E 00
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	bpl 124.b		; 10 7C
	sei		; 78
	bmi  40.b		; 30 28
	rol $3E.b		; 26 3E
	bit $5EFC.w,X		; 3C FC 5E
	php		; 08
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvp $00,$00		; 44 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F3.b		; 00 F3
	ora $F302E3.l		; 0F E3 02 F3
	sbc $00FFE3.l,X		; FF E3 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,S		; E3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc ($FF.b,S),Y		; F3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	tsb $06.b		; 04 06
	cop $02.b		; 02 02
	ora #$00.b		; 09 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $3F0E.w		; 0E 0E 3F
	tsa		; 3B
	cpx $E952.w		; EC 52 E9
	sta $D4.b		; 85 D4
	brk $1B.b		; 00 1B
	cpy #$4342.w		; C0 42 43
	dec $00DC.w,X		; DE DC 00
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	pld		; 2B
	brk $24.b		; 00 24
	brk $3C.b		; 00 3C
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	ldy #$6800.w		; A0 00 68
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	cpy #$E078.w		; C0 78 E0
	ror $006C.w,X		; 7E 6C 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	ora $1C2F.w,Y		; 19 2F 1C
	tsb $070F.w		; 0C 0F 07
	brk $21.b		; 00 21
	adc ($43.b,X)		; 61 43
	tda		; 7B
	bvs  99.b		; 70 63
	rol $00D7.w,X		; 3E D7 00
	brk $00.b		; 00 00
	rti		; 40

	brk $70.b		; 00 70
	brk $18.b		; 00 18
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	xce		; FB
	sta $0FF0.w,X		; 9D F0 0F
	stz $38E7.w		; 9C E7 38
	cpy #$81E6.w		; C0 E6 81
	sbc [$E7.b],Y		; F7 E7
	jsr ($28FF.w,X)		; FC FF 28
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	dec $7EF0.w		; CE F0 7E
	dec $4DEE.w,X		; DE EE 4D
	inc $69E0.w		; EE E0 69
	ldx $1F.b,Y		; B6 1F
	stx $1C.b		; 86 1C
	ora $1E20.w		; 0D 20 1E
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E2.b		; 00 E2
	brk $C0.b		; 00 C0
	sei		; 78
	brk $70.b		; 00 70
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	brk $70.b		; 00 70
	bra -32.b		; 80 E0
	cpx #$0018.w		; E0 18 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	asl A		; 0A
	and ($57.b),Y		; 31 57
	tad		; 5B
	adc $0660.w,Y		; 79 60 06
	brk $13.b		; 00 13
	ror $746F.w,X		; 7E 6F 74
	ora $03.b,S		; 03 03
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	sbc $0771CF.l		; EF CF 71 07
	jmp $4F4FF1.l		; 5C F1 4F 4F
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	jmp ($9FF4.w,X)		; 7C F4 9F
	stz $00.b		; 64 00
	bpl   0.b		; 10 00
	dey		; 88
	brk $02.b		; 00 02
	brk $B0.b		; 00 B0
	brk $C0.b		; 00 C0
	brk $C8.b		; 00 C8
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	dec $12CC.w,X		; DE CC 12
	cpy #$0007.w		; C0 07 00
	rol $20.b		; 26 20
	inc $3A74.w,X		; FE 74 3A
	dec A		; 3A
	ora $9C04.w,X		; 1D 04 9C
	adc $00.b		; 65 00
	jsr $2000.w		; 20 00 20
	brk $E8.b		; 00 E8
	brk $C9.b		; 00 C9
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bne   0.b		; D0 00
	rti		; 40

	jsr $C038.w		; 20 38 C0
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0A0C.w,X		; 1E 0C 0A
	asl $0403.w		; 0E 03 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $C0.b		; 00 C0
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $02.b		; 00 02
	cop $01.b		; 02 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $DB06.w,X		; 7E 06 DB
	and $01CF0C.l		; 2F 0C CF 01
	bpl   1.b		; 10 01
	php		; 08
	ora #$C4.b		; 09 C4
	ora ($44.b,X)		; 01 44
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	bpl -52.b		; 10 CC
	php		; 08
	ror $C4.b		; 66 C4
	and ($44.b)		; 32 44
	dec A		; 3A
	brk $00.b		; 00 00
	sbc $8CCC.w,X		; FD CC 8C
	cpy $60.b		; C4 60
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	sec		; 38
	bra  96.b		; 80 60
	ora $00FF00.l,X		; 1F 00 FF 00
	brk $02.b		; 00 02
	brk $10.b		; 00 10
	brk $14.b		; 00 14
	brk $12.b		; 00 12
	sec		; 38
	tsb $60.b		; 04 60
	bpl   0.b		; 10 00
	cpx #$0000.w		; E0 00 00
	sed		; F8
	brk $E0.b		; 00 E0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	inc $0B.b,X		; F6 0B
	sbc #$01.b		; E9 01
	inc $FF.b,X		; F6 FF
	sbc #$FF.b		; E9 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc #$FF.b		; E9 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	sbc $04FF.w,Y		; F9 FF 04
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	sbc $06FF.w,Y		; F9 FF 06
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	ora [$04.b]		; 07 04
	ora [$06.b]		; 07 06
	bpl  26.b		; 10 1A
	php		; 08
	php		; 08
	asl $02.b		; 06 02
	ora [$02.b],Y		; 17 02
	ldy $00AF.w,X		; BC AF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $0800.w,Y		; 19 00 08
	brk $00.b		; 00 00
	sed		; F8
	beq  69.b		; F0 45
	ldy #$1056.w		; A0 56 10
	sed		; F8
	tsb $3C27.w		; 0C 27 3C
	sbc [$C5.b]		; E7 C5
	adc $90C07D.l,X		; 7F 7D C0 90
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $2D.b		; 00 2D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $8F.b		; 00 8F
	sbc $39BF79.l		; EF 79 BF 39
	bpl  10.b		; 10 0A
	ora $120C.w,Y		; 19 0C 12
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $61.b		; 00 61
	php		; 08
	ora $06.b		; 05 06
	ora ($00.b,X)		; 01 00
	ora ($B3.b,X)		; 01 B3
	sec		; 38
	rti		; 40

	cmp $EF.b,S		; C3 EF
	and $7CF9.w		; 2D F9 7C
	mvp $10,$78		; 44 78 10
	eor $58.b,S		; 43 58
	tsb $13.b		; 04 13
	brk $00.b		; 00 00
	mvp $1C,$00		; 44 00 1C
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $82.b		; 00 82
	eor $20.b,S		; 43 20
	tsb $A2.b		; 04 A2
	brk $EC.b		; 00 EC
	cld		; D8
	ldy #$8004.w		; A0 04 80
	jsr ($B880.w,X)		; FC 80 B8
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
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
	brk $E4.b		; 00 E4
	cpy #$0119.w		; C0 19 01
	cmp $0EF3.w,X		; DD F3 0E
	ora $262F.w		; 0D 2F 26
	eor $021D30.l,X		; 5F 30 1D 02
	eor [$C6.b]		; 47 C6
	brk $03.b		; 00 03
	brk $26.b		; 00 26
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $18.b		; 00 18
	bvs 112.b		; 70 70
	lda $80C3B6.l,X		; BF B6 C3 80
	xce		; FB
	tsb $FD.b		; 04 FD
	dec $7F87.w,X		; DE 87 7F
	cmp $250C.w		; CD 0C 25
	inc A		; 1A
	brk $8D.b		; 00 8D
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	ldy #$B000.w		; A0 00 B0
	bra -52.b		; 80 CC
	bcs -72.b		; B0 B8
	beq -100.b		; F0 9C
	brk $98.b		; 00 98
	bcc -128.b		; 90 80
	brk $68.b		; 00 68
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F9.b		; 00 F9
	ora #$EF.b		; 09 EF
	ora ($F9.b,X)		; 01 F9
	sbc $00FFEF.l,X		; FF EF FF 00
	asl $0000.w		; 0E 00 00
	ora #$00.b		; 09 00
	sbc $0E02FF.l		; EF FF 02 0E
	brk $00.b		; 00 00
	sbc $FFFF.w,X		; FD FF FF
	sbc $000E04.l,X		; FF 04 0E 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	brk $10.b		; 00 10
	bpl  45.b		; 10 2D
	ora #$13.b		; 09 13
	asl $81C1.w,X		; 1E C1 81
	lsr $76.b,X		; 56 76
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $12.b		; 00 12
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $08.b		; 00 08
	cpy #$8080.w		; C0 80 80
	bra -64.b		; 80 C0
	rti		; 40

	bmi -32.b		; 30 E0
	cld		; D8
	cld		; D8
	tsb $A880.w		; 0C 80 A8
	ldy #$B1B2.w		; A0 B2 B1
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $72.b		; 00 72
	brk $54.b		; 00 54
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	ora $5E.b,X		; 15 5E
	phk		; 4B
	pld		; 2B
	and $880D.w,X		; 3D 0D 88
	ora $BE340D.l		; 0F 0D 34 BE
	inc A		; 1A
	adc $01.b,X		; 75 01
	and ($00.b,X)		; 21 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$3200.w		; C0 00 32
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	stp		; DB
	rol $E0DB.w		; 2E DB E0
	ply		; 7A
	stz $E835.w		; 9C 35 E8
	txy		; 9B
	iny		; C8
	rol $18.b		; 26 18
	stp		; DB
	dex		; CA
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	xce		; FB
	tsb $F5.b		; 04 F5
	brk $FB.b		; 00 FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	jsr ($FDFF.w,X)		; FC FF FD
	sbc $000E02.l,X		; FF 02 0E 00
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $2A.b		; 00 2A
	asl A		; 0A
	pha		; 48
	trb $36.b		; 14 36
	dec $2D.b,X		; D6 2D
	tda		; 7B
	lsr A		; 4A
	jmp ($BD3D.w,X)		; 7C 3D BD
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $42.b		; 00 42
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $E2.b		; A4 E2
	mvn $08,$18		; 54 18 08
	bpl 127.b		; 10 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $20.b		; 00 20
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FB02.w,X		; FE 02 FB
	brk $FE.b		; 00 FE
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	jsr $1000.w		; 20 00 10
	rts		; 60

	bmi  80.b		; 30 50
	sei		; 78
	bvs   0.b		; 70 00
	ldy #$0070.w		; A0 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $58.b		; 00 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3480.w		; 0D 80 34
	brk $EC.b		; 00 EC
	ora $B6.b,X		; 15 B6
	ora $F4.b		; 05 F4
	sbc $00FFB6.l,X		; FF B6 FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	ldx $FF.b,Y		; B6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	dec $FF.b		; C6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	dec $FF.b		; C6 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	dec $FF.b		; C6 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	cpx $D6FF.w		; EC FF D6
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $FC.b		; 00 FC
	sbc $0CFFD6.l,X		; FF D6 FF 0C
	tsb $0000.w		; 0C 00 00
	tsb $D600.w		; 0C 00 D6
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EC.b		; 00 EC
	sbc $20FFE6.l,X		; FF E6 FF 20
	tsb $0000.w		; 0C 00 00
	jsr ($E6FF.w,X)		; FC FF E6
	sbc $000C22.l,X		; FF 22 0C 00
	brk $0C.b		; 00 0C
	brk $E6.b		; 00 E6
	sbc $000C24.l,X		; FF 24 0C 00
	brk $F2.b		; 00 F2
	sbc $26FFF6.l,X		; FF F6 FF 26
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	inc $FF.b,X		; F6 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	ora ($01.b,X)		; 01 01
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2437.w		; 20 37 24
	and [$3A.b]		; 27 3A
	and $001818.l,X		; 3F 18 18 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $80.b		; 00 80
	bra -127.b		; 80 81
	sta ($04.b,X)		; 81 04
	adc [$01.b]		; 67 01
	adc $18801B.l,X		; 7F 1B 80 18
	sbc ($81.b,X)		; E1 81
	ror $81.b,X		; 76 81
	sta $000000.l		; 8F 00 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	trb $1E00.w		; 1C 00 1E
	php		; 08
	sta ($70.b,X)		; 81 70
	brk $40.b		; 00 40
	rts		; 60

	cpy #$E0E0.w		; C0 E0 E0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	bit $FC00.w,X		; 3C 00 FC
	bra 124.b		; 80 7C
	brk $F8.b		; 00 F8
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
	ora $1F1C1F.l,X		; 1F 1F 1C 1F
	brk $1F.b		; 00 1F
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	asl $0018.w,X		; 1E 18 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	brk $18.b		; 00 18
	brk $E1.b		; 00 E1
	asl $3E.b		; 06 3E
	ora $FFFC.w,X		; 1D FC FF
	sbc [$0F.b],Y		; F7 0F
	trb $7FDD.w		; 1C DD 7F
	sta ($3B.b),Y		; 91 3B
	mvp $70,$0F		; 44 0F 70
	rti		; 40

	bcs -64.b		; B0 C0
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	jsl $806E00.l		; 22 00 6E 80
	tsa		; 3B
	bra  15.b		; 80 0F
	brk $4F.b		; 00 4F
	ror $E0FF.w,X		; 7E FF E0
	sbc $7EF08F.l,X		; FF 8F F0 7E
	bra  32.b		; 80 20
	ora [$80.b]		; 07 80
	and $3D82.w,Y		; 39 82 3D
	cpy #$0001.w		; C0 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $187900.l		; 0F 00 79 18
	cpy #$C006.w		; C0 06 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	cpy #$8030.w		; C0 30 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$0C00.w		; E0 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	ora $063F3B.l		; 0F 3B 3F 06
	inc $0000.w,X		; FE 00 00
	brk $03.b		; 00 03
	brk $0E.b		; 00 0E
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	cpy #$0000.w		; C0 00 00
	ora ($07.b,X)		; 01 07
	php		; 08
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc $3C0C03.l		; EF 03 0C 3C
	cpy #$8E81.w		; C0 81 8E
	sta ($FE.b,X)		; 81 FE
	rol $78.b		; 26 78
	bmi -49.b		; 30 CF
	bmi -49.b		; 30 CF
	bpl   0.b		; 10 00
	cpx #$0003.w		; E0 03 00
	and $003040.l,X		; 3F 40 30 00
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cpy $0F80.w		; CC 80 0F
	bpl -34.b		; 10 DE
	jmp.w [$1F1C]		; DC 1C 1F
	sta $004119.l,X		; 9F 19 41 00
	jsr ($7C80.w,X)		; FC 80 7C
	brk $33.b		; 00 33
	brk $F0.b		; 00 F0
	ora ($20.b,X)		; 01 20
	ora $20.b,S		; 03 20
	rts		; 60

	brk $80.b		; 00 80
	rol $0300.w,X		; 3E 00 03
	brk $83.b		; 00 83
	clc		; 18
	jsr $801D.w		; 20 1D 80
	ora $FC.b,S		; 03 FC
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	cpx #$F8E0.w		; E0 E0 F8
	ora [$C8.b],Y		; 17 C8
	lda [$07.b],Y		; B7 07
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	cpy #$001F.w		; C0 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -50.b		; 30 CE
	pla		; 68
	stx $60.b		; 86 60
	bra   0.b		; 80 00
	inc $7F00.w,X		; FE 00 7F
	adc $9F82.w,X		; 7D 82 9F
	brk $07.b		; 00 07
	cpx #$3000.w		; E0 00 30
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rts		; 60

	bra  24.b		; 80 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$4080.w		; C0 80 40
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
	ora [$07.b]		; 07 07
	brk $01.b		; 00 01
	asl $021E.w,X		; 1E 1E 02
	adc ($00.b)		; 72 00
	adc $100F.w,X		; 7D 0F 10
	brk $3F.b		; 00 3F
	brk $06.b		; 00 06
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $B9.b		; 00 B9
	brk $58.b		; 00 58
	eor ($3E.b),Y		; 51 3E
	sbc ($40.b),Y		; F1 40
	jmp ($7340.w,X)		; 7C 40 73
	adc ($8C.b),Y		; 71 8C
	sed		; F8
	tsb $3B.b		; 04 3B
	rti		; 40

	sec		; 38
	ora ($A0.b,X)		; 01 A0
	asl $0800.w		; 0E 00 08
	ora $00.b,S		; 03 00
	sty $0200.w		; 8C 00 02
	eor ($00.b),Y		; 51 00
	ora $00.b,S		; 03 00
	sty $1EC0.w		; 8C C0 1E
	bvs -128.b		; 70 80
	bra  12.b		; 80 0C
	brk $FC.b		; 00 FC
	tsb $C0F0.w		; 0C F0 C0
	ora $103F00.l		; 0F 00 3F 10
	inc $00C0.w		; EE C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
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
	cpy #$C700.w		; C0 00 C7
	brk $7F.b		; 00 7F
	asl $7F.b		; 06 7F
	asl $1F1F.w,X		; 1E 1F 1F
	brk $10.b		; 00 10
	ora ($00.b,X)		; 01 00
	ply		; 7A
	ora $3C.b,S		; 03 3C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	ora $00.b		; 05 00
	ora $641BB0.l		; 0F B0 1B 64
	pld		; 2B
	bne  99.b		; D0 63
	sty $1C.b		; 84 1C
	cpx #$0081.w		; E0 81 00
	ora $30.b,S		; 03 30
	cop $F9.b		; 02 F9
	brk $43.b		; 00 43
	bra   3.b		; 80 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora $1C.b,S		; 03 1C
	brk $FF.b		; 00 FF
	cpy #$0007.w		; C0 07 00
	asl $F1.b		; 06 F1
	cop $80.b		; 02 80
	bit $300F.w,X		; 3C 0F 30
	trb $7003.w		; 1C 03 70
	ora $00030C.l		; 0F 0C 03 00
	bit $10.b		; 24 10
	stx $F10C.w		; 8E 0C F1
	ora $C0.b,S		; 03 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra 112.b		; 80 70
	cpy #$183C.w		; C0 3C 18
	cmp $21.b,S		; C3 21
	rti		; 40

	bra  60.b		; 80 3C
	brk $F8.b		; 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	adc [$18.b]		; 67 18
	asl $99.b		; 06 99
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$6000.w		; E0 00 60
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	ora ($1D.b,X)		; 01 1D
	cmp ($F0.b,X)		; C1 F0
	ora [$06.b]		; 07 06
	ora $000E.w		; 0D 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $0E.b		; 00 0E
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $01.b		; 00 01
	ror $FD07.w		; 6E 07 FD
	ora $F13E98.l,X		; 1F 98 3E F1
	sed		; F8
	ora ($F8.b,X)		; 01 F8
	brk $9F.b		; 00 9F
	brk $EF.b		; 00 EF
	ora $000100.l,X		; 1F 00 01 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora $1FE000.l,X		; 1F 00 E0 1F
	cmp [$BC.b]		; C7 BC
	dec $FEFE.w,X		; DE FE FE
	eor $D4E7.w,Y		; 59 E7 D4
	bne  -3.b		; D0 FD
	lda $1014.w,Y		; B9 14 10
	trb $00C0.w		; 1C C0 00
	jsr $0100.w		; 20 00 01
	brk $01.b		; 00 01
	brk $08.b		; 00 08
	plp		; 28
	ora [$00.b]		; 07 00
	lsr $E0.b		; 46 E0
	ora $2F3F00.l		; 0F 00 3F 2F
	bvc  49.b		; 50 31
	lsr $E01D.w		; 4E 1D E0
	ora $7C03F0.l		; 0F F0 03 7C
	cpy #$62FF.w		; C0 FF 62
	.db $62, $3C, $3C		; 62 3C 3C
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora $0180.w,X		; 1D 80 01
	bra -20.b		; 80 EC
	cop $FC.b		; 02 FC
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpx #$F200.w		; E0 00 F2
	brk $3D.b		; 00 3D
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $C200.w		; 0C 00 C2
	brk $00.b		; 00 00
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
	inc $F7.b,X		; F6 F7
	cmp [$C7.b]		; C7 C7
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	trb $0600.w		; 1C 00 06
	ora $C70C04.l		; 0F 04 0C C7
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	cmp $00.b,S		; C3 00
	bmi   7.b		; 30 07
	brk $FE.b		; 00 FE
	sta [$FF.b],Y		; 97 FF
	sta $7B.b		; 85 7B
	brk $7B.b		; 00 7B
	ora [$0F.b]		; 07 0F
	ora $181F8C.l		; 0F 8C 1F 18
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $00.b		; 84 00
	sty $20.b		; 84 20
	bpl   0.b		; 10 00
	bvs -32.b		; 70 E0
	ora $00.b,S		; 03 00
	sbc $FCF4BC.l,X		; FF BC F4 FC
	sed		; F8
	stz $60.b		; 64 60
	ora $80788C.l		; 0F 8C 78 80
	sbc $DC01.w,Y		; F9 01 DC
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	phd		; 0B
	brk $07.b		; 00 07
	brk $9F.b		; 00 9F
	brk $73.b		; 00 73
	brk $3F.b		; 00 3F
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $F3.b,S		; 03 F3
	asl $01FF.w		; 0E FF 01
	ora $FF3C1B.l		; 0F 1B 3C FF
	beq  40.b		; F0 28
	jsr $000E.w		; 20 0E 00
	adc $0012.w		; 6D 12 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	ora [$70.b],Y		; 17 70
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ora $38E600.l		; 0F 00 E6 38
	cpy #$10E0.w		; C0 E0 10
	cpx #$0310.w		; E0 10 03
	ora $7C.b,S		; 03 7C
	jmp ($0000.w,X)		; 7C 00 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	ora $161F16.l,X		; 1F 16 1F 16
	ora $141F16.l,X		; 1F 16 1F 14
	ora $141F14.l,X		; 1F 14 1F 14
	ora $101E14.l,X		; 1F 14 1E 10
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
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
	stz $75.b,X		; 74 75
	rol $3F.b		; 26 3F
	ora $001F.w,Y		; 19 1F 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	stz $F807.w,X		; 9E 07 F8
	ora $FD.b,S		; 03 FD
	ora $07042B.l		; 0F 2B 04 07
	bvs 126.b		; 70 7E
	cpy #$00F8.w		; C0 F8 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne   0.b		; D0 00
	sei		; 78
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $F8.b		; 00 F8
	brk $70.b		; 00 70
	bra 120.b		; 80 78
	brk $7C.b		; 00 7C
	php		; 08
	jmp ($7C08.w,X)		; 7C 08 7C
	clc		; 18
	jmp ($0058.w,X)		; 7C 58 00
	eor $0C3E01.l,X		; 5F 01 3E 0C
	eor ($07.b,S),Y		; 53 07
	sei		; 78
	brk $7F.b		; 00 7F
	ora ($7E.b,X)		; 01 7E
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	beq  15.b		; F0 0F
	sei		; 78
	ora $07.b,S		; 03 07
	bra  31.b		; 80 1F
	rts		; 60

	ora $4C.b,S		; 03 4C
	brk $23.b		; 00 23
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	bvs  15.b		; 70 0F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  56.b		; 80 38
	cpy #$02E5.w		; C0 E5 02
	jsr ($E000.w,X)		; FC 00 E0
	trb $8070.w		; 1C 70 80
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
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
	and $80802F.l		; 2F 2F 80 80
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $87802F.l		; 2F 2F 80 87
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	asl $1E10.w,X		; 1E 10 1E
	tsb $FE.b		; 04 FE
	sty $FE.b		; 84 FE
	sty $02.b		; 84 02
	brk $FC.b		; 00 FC
	jsr ($1E1E.w,X)		; FC 1E 1E
	ora ($01.b,X)		; 01 01
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	jsr ($1EFF.w,X)		; FC FF 1E
	ora $000101.l,X		; 1F 01 01 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	asl $0404.w,X		; 1E 04 04
	ora ($01.b,X)		; 01 01
	adc $C0C07F.l,X		; 7F 7F C0 C0
	bra -128.b		; 80 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	asl $04FE.w,X		; 1E FE 04
	jsr ($FF01.w,X)		; FC 01 FF
	adc $C0C0FF.l,X		; 7F FF C0 C0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stx $96.b,Y		; 96 96
	xba		; EB
	xba		; EB
	beq -16.b		; F0 F0
	plx		; FA
	plx		; FA
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $96.b		; 00 96
	stx $EB.b,Y		; 96 EB
	xba		; EB
	beq -16.b		; F0 F0
	plx		; FA
	plx		; FA
	jsr $0020.w		; 20 20 00
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $F0.b		; 00 F0
	bpl -59.b		; 10 C5
	tsb $F0.b		; 04 F0
	sbc $00FFC5.l,X		; FF C5 FF 00
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	cmp $FF.b,X		; D5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $FF.b		; E5 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $FF.b,X		; F5 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $FF.b		; C5 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	cmp $FF.b,X		; D5 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc $FF.b		; E5 FF
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $10.b		; 00 10
	brk $E1.b		; 00 E1
	sbc $000C20.l,X		; FF 20 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
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
	brk $08.b		; 00 08
	php		; 08
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	ora ($B8.b,X)		; 01 B8
	iny		; C8
	inc $C8.b,X		; F6 C8
	cmp #$35.b		; C9 35
	bit $03.b,X		; 34 03
	asl $0010.w,X		; 1E 10 00
	clc		; 18
	brk $08.b		; 00 08
	brk $44.b		; 00 44
	ora ($01.b,X)		; 01 01
	php		; 08
	rol $00.b,X		; 36 00
	lsr A		; 4A
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	cop $06.b		; 02 06
	clc		; 18
	brk $0F.b		; 00 0F
	ora ($0F.b,X)		; 01 0F
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	trb $0001.w		; 1C 01 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $5D.b,S		; 03 5D
	.db $42, $C7		; 42 C7
	cld		; D8
	bra  56.b		; 80 38
	ora [$38.b]		; 07 38
	ora $E8.b,X		; 15 E8
	sta ($E2.b),Y		; 91 E2
	stx $E1F0.w		; 8E F0 E1
	brk $A0.b		; 00 A0
	ora $0720.w,X		; 1D 20 07
	rti		; 40

	sta [$C0.b]		; 87 C0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	asl $FF00.w		; 0E 00 FF
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	ora ($1F.b,X)		; 01 1F
	ora [$34.b]		; 07 34
	asl $1718.w,X		; 1E 18 17
	clc		; 18
	sed		; F8
	sbc $009F9E.l,X		; FF 9E 9F 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $3B.b		; 00 3B
	sbc $CFFF.w,X		; FD FF CF
	sbc $9E.b		; E5 9E
	cpy $F01C.w		; CC 1C F0
	brk $71.b		; 00 71
	jsr ($EE0B.w,X)		; FC 0B EE
	lda $0000FF.l,X		; BF FF 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	and $00.b,S		; 23 00
	asl $00F1.w		; 0E F1 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	ora ($1E.b,X)		; 01 1E
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	sbc ($07.b,X)		; E1 07
	cmp ($07.b,X)		; C1 07
	ora $07.b		; 05 07
	ora $07.b		; 05 07
	ora $07.b		; 05 07
	tsb $07.b		; 04 07
	tsb $07.b		; 04 07
	tsb $00.b		; 04 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$30.b]		; 07 30
	sec		; 38
	tya		; 98
	cpx #$E030.w		; E0 30 E0
	rts		; 60

	asl $DE20.w		; 0E 20 DE
	jsr $1CFC.w		; 20 FC 1C
	jsr $22C0.w		; 20 C0 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
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
	.db $82, $30, $84		; 82 30 84
	tsa		; 3B
	cpy #$E200.w		; C0 00 E2
	tsb $1F.b		; 04 1F
	jsr $0619.w		; 20 19 06
	rts		; 60

	ora $0C0718.l,X		; 1F 18 07 0C
	cpy #$C000.w		; C0 00 C0
	ora $C0.b,S		; 03 C0
	ora $00E2.w,Y		; 19 E2 00
	cpy #$E000.w		; C0 00 E0
	bra  96.b		; 80 60
	cpy #$0038.w		; C0 38 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr $E000.w		; 20 00 E0
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	cpx #$E018.w		; E0 18 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $C6D3.w		; 8C D3 C6
	cld		; D8
	and $FC.b,S		; 23 FC
	sta ($1E.b,X)		; 81 1E
	sta $8E19.w,Y		; 99 19 8E
	asl $9D81.w		; 0E 81 9D
	sta $1F.b,S		; 83 1F
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	asl $E0.b		; 06 E0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	jsr ($F800.w,X)		; FC 00 F8
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	and $008F80.l,X		; 3F 80 8F 00
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ora #$80.b		; 09 80
	trb $0C80.w		; 1C 80 0C
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bmi -64.b		; 30 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bmi -64.b		; 30 C0
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $86.b		; 04 86
	asl $F9.b		; 06 F9
	adc $F40380.l,X		; 7F 80 03 F4
	dec $3ECF.w,X		; DE CF 3E
	sbc $0EC73B.l,X		; FF 3B C7 0E
	lda $000079.l		; AF 79 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora #$20.b		; 09 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $50.b		; 00 50
	brk $0E.b		; 00 0E
	brk $0B.b		; 00 0B
	brk $00.b		; 00 00
	ora ($1E.b,X)		; 01 1E
	inc A		; 1A
	xce		; FB
	ora ($01.b,X)		; 01 01
	ora ($0E.b,X)		; 01 0E
	ora ($1A.b,X)		; 01 1A
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	rts		; 60

	ora ($00.b,X)		; 01 00
	tsb $1E.b		; 04 1E
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $7D02.w,X		; BD 02 7D
	clc		; 18
	adc ($E0.b,X)		; 61 E0
	ora $E911.w		; 0D 11 E9
	and ($C4.b,X)		; 21 C4
	bra 127.b		; 80 7F
	dey		; 88
	adc [$40.b],Y		; 77 40
	cop $80.b		; 02 80
	cop $00.b		; 02 00
	asl $F200.w,X		; 1E 00 F2
	asl $00.b		; 06 00
	clc		; 18
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	php		; 08
	tsb $3001.w		; 0C 01 30
	brk $18.b		; 00 18
	asl $1010.w,X		; 1E 10 10
	beq -10.b		; F0 F6
	cli		; 58
	adc $003F24.l,X		; 7F 24 3F 00
	ora $0E00.w		; 0D 00 0E
	ora ($3C.b,X)		; 01 3C
	brk $01.b		; 00 01
	sta $010800.l		; 8F 00 08 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($D9.b,X)		; 01 D9
	and [$78.b],Y		; 37 78
	adc $C0FD60.l,X		; 7F 60 FD C0
	tas		; 1B
	cpx #$C03F.w		; E0 3F C0
	asl $F8.b,X		; 16 F8
	adc [$50.b],Y		; 77 50
	brk $26.b		; 00 26
	brk $83.b		; 00 83
	brk $87.b		; 00 87
	brk $1F.b		; 00 1F
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	ora ($04.b,X)		; 01 04
	bra   7.b		; 80 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$04.b]		; 07 04
	ora [$04.b]		; 07 04
	ora [$00.b]		; 07 00
	ora $000100.l,X		; 1F 00 01 00
	inc $07FE.w,X		; FE FE 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $FEFF00.l,X		; 1F 00 FF FE
	sbc $000707.l,X		; FF 07 07 00
	brk $02.b		; 00 02
	jmp ($8330.w,X)		; 7C 30 83
	brk $8F.b		; 00 8F
	stz $1B.b		; 64 1B
	jmp ($E0FF.w,X)		; 7C FF E0
	sbc $7EE09F.l,X		; FF 9F E0 7E
	bra -128.b		; 80 80
	cop $40.b		; 02 40
	bit $7000.w,X		; 3C 00 70
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $71.b		; 00 71
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
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
	brk $9E.b		; 00 9E
	tsb $88.b		; 04 88
	asl $E0.b		; 06 E0
	ora ($DE.b,X)		; 01 DE
	cpx #$38E3.w		; E0 E3 38
	sec		; 38
	trb $1087.w		; 1C 87 10
	sta $034120.l		; 8F 20 41 03
	rts		; 60

	ora ($00.b,X)		; 01 00
	jsr $0C00.w		; 20 00 0C
	bpl   7.b		; 10 07
	cpy #$6000.w		; C0 00 60
	brk $60.b		; 00 60
	bmi  76.b		; 30 4C
	bmi  76.b		; 30 4C
	tay		; A8
	mvp $40,$A0		; 44 A0 40
	brk $BF.b		; 00 BF
	and $805F40.l,X		; 3F 40 5F 80
	asl $E0.b		; 06 E0
	brk $80.b		; 00 80
	bra  48.b		; 80 30
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	rti		; 40

	brk $80.b		; 00 80
	brk $20.b		; 00 20
	rti		; 40

	clc		; 18
	brk $E5.b		; 00 E5
	stx $1C1F.w		; 8E 1F 1C
	plp		; 28
	plp		; 28
	sta $00.b,S		; 83 00
	jsr ($1C03.w,X)		; FC 03 1C
	ora ($03.b,X)		; 01 03
	brk $07.b		; 00 07
	clc		; 18
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	bpl -57.b		; 10 C7
	trb $00E0.w		; 1C E0 00
	cpx #$DC20.w		; E0 20 DC
	stz $E063.w		; 9C 63 E0
	brk $E0.b		; 00 E0
	bpl -32.b		; 10 E0
	bpl   2.b		; 10 02
	cop $3C.b		; 02 3C
	bit $C000.w,X		; 3C 00 C0
	sec		; 38
	cpy #$00E6.w		; C0 E6 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $031D.w,X		; 1D 1D 03
	ora $3F.b,S		; 03 3F
	and $C06060.l,X		; 3F 60 60 C0
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	ora $03FD.w,X		; 1D FD 03
	sbc $60FF3F.l,X		; FF 3F FF 60
	cpx #$C0C0.w		; E0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	cpy #$E8C0.w		; C0 C0 E8
	inx		; E8
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	cpy #$E8C0.w		; C0 C0 E8
	inx		; E8
	rti		; 40

	rti		; 40

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F4.b		; 00 F4
	phd		; 0B
	pei ($03.b)		; D4 03
	inc $FF.b,X		; F6 FF
	pei ($FF.b)		; D4 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	pei ($FF.b)		; D4 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	pea $E4FF.w		; F4 FF E4
	sbc $000C04.l,X		; FF 04 0C 00
	brk $04.b		; 00 04
	brk $E4.b		; 00 E4
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F4.b		; 00 F4
	sbc $08FFF4.l,X		; FF F4 FF 08
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	pea $0AFF.w		; F4 FF 0A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bpl  30.b		; 10 1E
	clc		; 18
	ora $000707.l,X		; 1F 07 07 00
	ora $01.b,S		; 03 01
	ora $0807.w,Y		; 19 07 08
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	clc		; 18
	beq 112.b		; F0 70
	asl $10.b		; 06 10
	ldx $104C.w		; AE 4C 10
	cpx #$0292.w		; E0 92 02
	ldy $07C0.w,X		; BC C0 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	bpl -128.b		; 10 80
	rts		; 60

	brk $40.b		; 00 40
	rti		; 40

	cop $00.b		; 02 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0F0F.w		; 0E 0F 0F
	brk $00.b		; 00 00
	tas		; 1B
	brk $01.b		; 00 01
	ora [$38.b]		; 07 38
	sec		; 38
	sbc $061906.l,X		; FF 06 19 06
	and $0000.w,Y		; 39 00 00
	brk $0F.b		; 00 0F
	tsb $00.b		; 04 00
	tsb $4000.w		; 0C 00 40
	ora [$00.b]		; 07 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $6C.b		; 00 6C
	sta $12.b,S		; 83 12
	ora ($00.b,X)		; 01 00
	cmp ($81.b,S),Y		; D3 81
	trb $5B00.w		; 1C 00 5B
	stz $031C.w		; 9C 1C 03
	sbc ($02.b),Y		; F1 02
	sbc ($10.b),Y		; F1 10
	jmp ($F608.w)		; 6C 08 F6
	tsb $28.b		; 04 28
	brk $E0.b		; 00 E0
	tsb $A0.b		; 04 A0
	adc ($02.b,X)		; 61 02
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $F0.b		; 00 F0
	php		; 08
	beq  24.b		; F0 18
	ldy $90.b		; A4 90
	bit $50.b		; 24 50
	ldy #$DF00.w		; A0 00 DF
	rol $06C1.w		; 2E C1 06
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	php		; 08
	brk $04.b		; 00 04
	jsr $1000.w		; 20 00 10
	jsr $0008.w		; 20 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $22.b,S		; 23 22
	cpx #$40EB.w		; E0 EB 40
	adc $061401.l,X		; 7F 01 14 06
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9C.b		; 00 9C
	brk $10.b		; 00 10
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	brk $BF.b		; 00 BF
	brk $E0.b		; 00 E0
	bra -15.b		; 80 F1
	.db $82, $70, $10		; 82 70 10
	bvs  81.b		; 70 51
	bvs  80.b		; 70 50
	bvs  80.b		; 70 50
	ora $FC.b,S		; 03 FC
	brk $5C.b		; 00 5C
	ora ($4C.b,S),Y		; 13 4C
	tsb $0670.w		; 0C 70 06
	sei		; 78
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	jmp.w [$001C]		; DC 1C 00
	cpx #$00F6.w		; E0 F6 00
	jsr ($1800.w,X)		; FC 00 18
	rts		; 60

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	tsa		; 3B
	and $3906.w,Y		; 39 06 39
	ora ($1D.b,X)		; 01 1D
	ora $00.b,S		; 03 00
	sec		; 38
	rol $21.b		; 26 21
	dec $03.b		; C6 03
	jmp ($0000.w,X)		; 7C 00 00
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	tsb $C003.w		; 0C 03 C0
	ora $3008.w,Y		; 19 08 30
	brk $00.b		; 00 00
	pea $BC0B.w		; F4 0B BC
	sbc $BEF0CF.l,X		; FF CF F0 BE
	cpy #$9842.w		; C0 42 98
	jsr $F200.w		; 20 00 F2
	tsb $4F.b		; 04 4F
	bpl   0.b		; 10 00
	rti		; 40

	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $39.b		; 00 39
	tsb $60.b		; 04 60
	ora $E0.b,S		; 03 E0
	ora #$72.b		; 09 72
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
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
	ora ($0F.b,X)		; 01 0F
	ora [$3E.b]		; 07 3E
	asl $3B60.w		; 0E 60 3B
	bmi -16.b		; 30 F0
	sbc $10BFBB.l,X		; FF BB BF 10
	asl $31.b		; 06 31
	and $0000.w,Y		; 39 00 00
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cpy #$0003.w		; C0 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0600.w,Y		; 19 00 06
	lda ($DA.b),Y		; B1 DA
	mvn $40,$EF		; 54 EF 40
	cmp $82.b,S		; C3 82
	cop $30.b		; 02 30
	adc $F0.b,S		; 63 F0
	sbc ($1D.b,S),Y		; F3 1D
	sta ($F4.b),Y		; 91 F4
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	bpl  48.b		; 10 30
	tsb $9C61.w		; 0C 61 9C
	brk $1C.b		; 00 1C
	brk $0C.b		; 00 0C
	brk $6C.b		; 00 6C
	cop $79.b		; 02 79
	bit $E0C0.w,X		; 3C C0 E0
	brk $60.b		; 00 60
	bra  64.b		; 80 40
	sei		; 78
	rti		; 40

	eor [$C0.b]		; 47 C0
	pea $8870.w		; F4 70 88
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $00.b		; 84 00
	clc		; 18
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  19.b		; 10 13
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs   0.b		; 70 00
	sbc ($03.b,S),Y		; F3 03
	bpl   0.b		; 10 00
	jmp ($087C.w,X)		; 7C 7C 08
	php		; 08
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	jmp ($087C.w,X)		; 7C 7C 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	cpx #$20E0.w		; E0 E0 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	cpx #$20E0.w		; E0 E0 20
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
	brk $00.b		; 00 00
	cop $80.b		; 02 80
	php		; 08
	brk $F8.b		; 00 F8
	ora [$E3.b]		; 07 E3
	cop $F8.b		; 02 F8
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	brk $02.b		; 00 02
	ora ($14.b),Y		; 11 14
	php		; 08
	ora #$01.b		; 09 01
	asl $02.b		; 06 02
	ora $1E01.w,X		; 1D 01 1E
	asl $1F.b,X		; 16 1F
	cop $13.b		; 02 13
	tsb $00.b		; 04 00
	asl A		; 0A
	ora ($06.b,X)		; 01 06
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	tsb $8040.w		; 0C 40 80
	bra  32.b		; 80 20
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	rti		; 40

	bpl -96.b		; 10 A0
	bvc -128.b		; 50 80
	sed		; F8
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	ora $663A2B.l		; 0F 2B 3A 66
	adc $674E.w,X		; 7D 4E 67
	adc $4F0C47.l,X		; 7F 47 0C 4F
	pha		; 48
	cmp [$F8.b]		; C7 F8
	ora $00103C.l		; 0F 3C 10 00
	ora ($00.b,X)		; 01 00
	bra  17.b		; 80 11
	brk $00.b		; 00 00
	bpl  97.b		; 10 61
	bmi   7.b		; 30 07
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	ldy $18C0.w		; AC C0 18
	rts		; 60

	jsr $1027.w		; 20 27 10
	ply		; 7A
	sei		; 78
	stz $16.b		; 64 16
	asl $64.b		; 06 64
	clc		; 18
	rol $0040.w,X		; 3E 40 00
	brk $00.b		; 00 00
	bra   8.b		; 80 08
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  96.b		; 80 60
	bra   0.b		; 80 00
	cpx $80.b		; E4 80
	brk $1B.b		; 00 1B
	trb $4423.w		; 1C 23 44
	ora $38.b,X		; 15 38
	ora $0000.w,Y		; 19 00 00
	ora $116318.l,X		; 1F 18 63 11
	inc A		; 1A
	bpl  79.b		; 10 4F
	brk $03.b		; 00 03
	php		; 08
	and ($00.b),Y		; 31 00
	ora ($00.b,X)		; 01 00
	ora $800020.l,X		; 1F 20 00 80
	trb $0164.w		; 1C 64 01
	brk $00.b		; 00 00
	jsr $8050.w		; 20 50 80
	plp		; 28
	cli		; 58
	jsr $3844.w		; 20 44 38
	bit $0A.b		; 24 0A
	bpl -24.b		; 10 E8
	eor [$48.b]		; 47 48
	.db $42, $38		; 42 38
	brk $80.b		; 00 80
	bvc -128.b		; 50 80
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	bpl -124.b		; 10 84
	brk $02.b		; 00 02
	bmi -128.b		; 30 80
	tsb $80.b		; 04 80
	adc $79.b,S		; 63 79
	ora $03.b,S		; 03 03
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora [$00.b]		; 07 00
	asl $001E.w,X		; 1E 1E 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$1E.b]		; 07 1E
	ora $000000.l,X		; 1F 00 00 00
	pla		; 68
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $74.b,X		; 74 74
	sei		; 78
	sei		; 78
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	stz $F4.b,X		; 74 F4
	sei		; 78
	sed		; F8
	bra -128.b		; 80 80
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	jsr ($F202.w,X)		; FC 02 F2
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $40.b		; 00 40
	pla		; 68
	bpl  32.b		; 10 20
	brk $68.b		; 00 68
	php		; 08
	bvc  16.b		; 50 10
	ldy $48.b		; A4 48
	tsb $44.b		; 04 44
	tya		; 98
	.db $42, $BC		; 42 BC
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	php		; 08
	bvc  16.b		; 50 10
	pla		; 68
	brk $62.b		; 00 62
	brk $00.b		; 00 00
	mvn $B0,$A8		; 54 A8 B0
	inc $82B2.w		; EE B2 82
	rol $68.b		; 26 68
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	plp		; 28
	php		; 08
	bpl  16.b		; 10 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	pha		; 48
	bmi  16.b		; 30 10
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   8.b		; 10 08
	sec		; 38
	bpl  16.b		; 10 10
	ora ($80.b,S),Y		; 13 80
	jmp $E100.w		; 4C 00 E1
	ora $EA06B2.l,X		; 1F B2 06 EA
	sbc $00FFF7.l,X		; FF F7 FF 00
	asl $0000.w		; 0E 00 00
	plx		; FA
	sbc $02FFF7.l,X		; FF F7 FF 02
	asl $0000.w		; 0E 00 00
	asl A		; 0A
	brk $F7.b		; 00 F7
	sbc $000E04.l,X		; FF 04 0E 00
	brk $E4.b		; 00 E4
	sbc $06FFE7.l,X		; FF E7 FF 06
	asl $0000.w		; 0E 00 00
	pea $E7FF.w		; F4 FF E7
	sbc $000E08.l,X		; FF 08 0E 00
	brk $04.b		; 00 04
	brk $E7.b		; 00 E7
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $14.b		; 00 14
	brk $E7.b		; 00 E7
	sbc $000E0C.l,X		; FF 0C 0E 00
	brk $E1.b		; 00 E1
	sbc $0EFFD7.l,X		; FF D7 FF 0E
	asl $0000.w		; 0E 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b],Y		; D7 FF
	jsr $000E.w		; 20 0E 00
	brk $01.b		; 00 01
	brk $D7.b		; 00 D7
	sbc $000E22.l,X		; FF 22 0E 00
	brk $11.b		; 00 11
	brk $D7.b		; 00 D7
	sbc $000E24.l,X		; FF 24 0E 00
	brk $E6.b		; 00 E6
	sbc $26FFC7.l,X		; FF C7 FF 26
	asl $0000.w		; 0E 00 00
	inc $FF.b,X		; F6 FF
	cmp [$FF.b]		; C7 FF
	plp		; 28
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	cmp [$FF.b]		; C7 FF
	rol A		; 2A
	asl $0000.w		; 0E 00 00
	asl $00.b,X		; 16 00
	cmp [$FF.b]		; C7 FF
	bit $000E.w		; 2C 0E 00
	brk $ED.b		; 00 ED
	sbc $2EFFB7.l,X		; FF B7 FF 2E
	asl $0000.w		; 0E 00 00
	sbc $B7FF.w,X		; FD FF B7
	sbc $000E40.l,X		; FF 40 0E 00
	brk $0D.b		; 00 0D
	brk $B7.b		; 00 B7
	sbc $000E42.l,X		; FF 42 0E 00
	brk $F7.b		; 00 F7
	sbc $44FFA7.l,X		; FF A7 FF 44
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $0C3F00.l,X		; 3F 00 3F 0C
	and $3A3F38.l,X		; 3F 38 3F 3A
	and $343F32.l,X		; 3F 32 3F 34
	ora $161F14.l,X		; 1F 14 1F 16
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	bra  32.b		; 80 20
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $03FF60.l		; 0F 60 FF 03
	ora $0F601F.l		; 0F 1F 60 0F
	ora $0720.w,Y		; 19 20 07
	sec		; 38
	ora $0F.b,S		; 03 0F
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($1E.b),Y		; 71 1E
	cpx #$8361.w		; E0 61 83
	sta $F30E.w		; 8D 0E F3
	jmp ($F08C.w,X)		; 7C 8C F0
	sei		; 78
	cmp $83FFF0.l		; CF F0 FF 83
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora $08.b,S		; 03 08
	sbc $00CFC1.l,X		; FF C1 CF 00
	cmp [$00.b]		; C7 00
	ora [$03.b]		; 07 03
	brk $F3.b		; 00 F3
	trb $FFE0.w		; 1C E0 FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($78.b,X)		; 01 78
	ora [$F9.b]		; 07 F9
	cmp $FFF8E7.l,X		; DF E7 F8 FF
	rti		; 40

	sta $E76803.l,X		; 9F 03 68 E7
	php		; 08
	sta $870067.l,X		; 9F 67 00 87
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $97.b		; 00 97
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	cpx #$8010.w		; E0 10 80
	adc $FF00.w,X		; 7D 00 FF
	brk $3F.b		; 00 3F
	brk $07.b		; 00 07
	tsa		; 3B
	brk $FE.b		; 00 FE
	ora $FC93.w,X		; 1D 93 FC
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	beq   1.b		; F0 01
	asl $03E1.w,X		; 1E E1 03
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $1F.b,S		; E3 1F
	rts		; 60

	sta $00CF10.l,X		; 9F 10 CF 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $10.b		; 00 10
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rti		; 40

	bra -128.b		; 80 80
	bvs  12.b		; 70 0C
	beq  63.b		; F0 3F
	cpy #$FF60.w		; C0 60 FF
	rti		; 40

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
	bvs   0.b		; 70 00
	cpx #$0000.w		; E0 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	asl $01.b		; 06 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
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
	brk $04.b		; 00 04
	tas		; 1B
	.db $82, $05, $C3		; 82 05 C3
	eor ($C1.b,X)		; 41 C1
	sta $FD00.w,Y		; 99 00 FD
	brk $EC.b		; 00 EC
	brk $20.b		; 00 20
	brk $19.b		; 00 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $37FD.w,X		; FD FD 37
	and [$03.b],Y		; 37 03
	ora $00.b,S		; 03 00
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
	brk $57.b		; 00 57
	eor [$FC.b],Y		; 57 FC
	sbc $BFBF.w,X		; FD BF BF
	sbc $3FFD.w,X		; FD FD 3F
	and $1F0000.l,X		; 3F 00 00 1F
	asl $1A1F.w,X		; 1E 1F 1A
	adc $FCFF7A.l,X		; 7F 7A FF FC
	asl $060E.w		; 0E 0E 06
	asl $02.b		; 06 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora $801F00.l,X		; 1F 00 1F 80
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc $F8FFF8.l,X		; FF F8 FF F8
	plx		; FA
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	asl $FE.b		; 06 FE
	ora ($FF.b,X)		; 01 FF
	tda		; 7B
	xce		; FB
	xce		; FB
	xce		; FB
	sbc $80FD.w,X		; FD FD 80
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
	brk $DE.b		; 00 DE
	dec $AFAF.w,X		; DE AF AF
	adc $1C1C7F.l,X		; 7F 7F 1C 1C
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
	sei		; 78
	sei		; 78
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $01.b		; 00 01
	bit $3400.w,X		; 3C 00 34
	phd		; 0B
	ora [$00.b]		; 07 00
	ora $04.b,S		; 03 04
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
	sbc $FFFC2F.l,X		; FF 2F FC FF
	brk $02.b		; 00 02
	brk $0F.b		; 00 0F
	ora $FFF2.w		; 0D F2 FF
	ora [$00.b]		; 07 00
	sbc $007C00.l,X		; FF 00 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $F000.w,X		; 3D 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C7.b		; 00 C7
	ora ($7E.b,X)		; 01 7E
	jsr $EEDE.w		; 20 DE EE
	ror $FFBC.w,X		; 7E BC FF
	cpx #$80FF.w		; E0 FF 80
	sty $3900.w		; 8C 00 39
	brk $38.b		; 00 38
	brk $80.b		; 00 80
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($107D.w)		; 6C 7D 10
	sbc $F16D92.l		; EF 92 6D F1
	iny		; C8
	adc ($FF.b),Y		; 71 FF
	rol $3FD1.w,X		; 3E D1 3F
	ora [$7A.b]		; 07 7A
	brk $00.b		; 00 00
	.db $82, $00, $10		; 82 00 10
	brk $10.b		; 00 10
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	ora $E000E0.l,X		; 1F E0 00 E0
	rti		; 40

	jmp $003F40.l		; 5C 40 3F 00
	sta [$83.b]		; 87 83
	sei		; 78
	ora ($DE.b,X)		; 01 DE
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $A1.b		; 00 A1
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($0E.b,X)		; C1 0E
	ora [$00.b]		; 07 00
	inc $7C00.w,X		; FE 00 7C
	jmp ($FF06.w,X)		; 7C 06 FF
	cmp $C33E.w,X		; DD 3E C3
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($60.b,X)		; 81 60
	cmp [$38.b]		; C7 38
	asl $0460.w,X		; 1E 60 04
	sed		; F8
	cpy #$8030.w		; C0 30 80
	rti		; 40

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
	tsb $8F0D.w		; 0C 0D 8F
	sta $7CC3C0.l		; 8F C0 C3 7C
	sei		; 78
	asl $033C.w		; 0E 3C 03
	rol $1F00.w,X		; 3E 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $FE.b		; 00 FE
	tya		; 98
	sbc [$FF.b]		; E7 FF
	sed		; F8
	asl $00FD.w		; 0E FD 00
	adc ($80.b),Y		; 71 80
	ora $00CE03.l		; 0F 03 CE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	brk $FC.b		; 00 FC
	bra  30.b		; 80 1E
	cpy #$607F.w		; C0 7F 60
	sbc [$38.b],Y		; F7 38
	dey		; 88
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	tsb $B3.b		; 04 B3
	brk $3F.b		; 00 3F
	bcc  14.b		; 90 0E
	ora [$9F.b]		; 07 9F
	ora $011E9C.l		; 0F 9C 1E 01
	bpl  15.b		; 10 0F
	tsb $1B.b		; 04 1B
	brk $44.b		; 00 44
	brk $40.b		; 00 40
	brk $F1.b		; 00 F1
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $64.b		; 00 64
	cop $85.b		; 02 85
	.db $42, $6D		; 42 6D
	cpy #$C7BD.w		; C0 BD C7
	sec		; 38
	tsb $10C3.w		; 0C C3 10
	dec $E000.w		; CE 00 E0
	brk $7E.b		; 00 7E
	brk $70.b		; 00 70
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $1F.b		; 00 1F
	brk $80.b		; 00 80
	brk $DF.b		; 00 DF
	brk $BF.b		; 00 BF
	beq  61.b		; F0 3D
	cpx #$0078.w		; E0 78 00
	cpx #$CF00.w		; E0 00 CF
	brk $DF.b		; 00 DF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $0F.b		; 00 0F
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $30F9.w,X		; 1E F9 30
	adc $00FE10.l,X		; 7F 10 FE 00
	inc $00.b,X		; F6 00
	jsr ($F800.w,X)		; FC 00 F8
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
	ora ($00.b,X)		; 01 00
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	clc		; 18
	php		; 08
	clc		; 18
	php		; 08
	tsb $0E18.w		; 0C 18 0E
	asl $07.b		; 06 07
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq 113.b		; F0 71
	jmp ($5404.w,X)		; 7C 04 54
	lda $126816.l		; AF 16 68 12
	sbc $7F00.w		; ED 00 7F
	ora ($3F.b,X)		; 01 3F
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0ECC.w,X		; 1E CC 0E
	rol $0E.b,X		; 36 0E
	sbc ($16.b)		; F2 16
	pla		; 68
	tas		; 1B
	cpy $08.b		; C4 08
	sbc [$18.b],Y		; F7 18
	sbc [$1C.b]		; E7 1C
	sbc $00.b,S		; E3 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cmp $00DF00.l		; CF 00 DF 00
	and ($81.b,S),Y		; 33 81
	adc $5B4789.l		; 6F 89 47 5B
	sta $33.b,S		; 83 33
	dec $39C6.w		; CE C6 39
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
	cmp [$C8.b],Y		; D7 C8
	sbc [$C0.b],Y		; F7 C0
	sbc [$E4.b],Y		; F7 E4
	sta [$E4.b],Y		; 97 E4
	ora $4E1DEE.l,X		; 1F EE 1D 4E
	dey		; 88
	ldy $0012.w		; AC 12 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	ora $37C4.w,Y		; 19 C4 37
	dey		; 88
	pla		; 68
	stx $C4.b,Y		; 96 C4
	sec		; 38
	clc		; 18
	cpx #$C021.w		; E0 21 C0
	ora ($60.b,X)		; 01 60
	ora $60.b,S		; 03 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $05.b		; 00 05
	tsb $06.b		; 04 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	bit $45E2.w		; 2C E2 45
	cpy #$80B3.w		; C0 B3 80
	sbc ($80.b,S),Y		; F3 80
	adc $FF04.w,X		; 7D 04 FF
	stx $65.b		; 86 65
	asl $65.b		; 06 65
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $EF.b		; 00 EF
	brk $7B.b		; 00 7B
	and $E3C6.w,Y		; 39 C6 E3
	trb $F70F.w		; 1C 0F F7
	inc $3CF5.w,X		; FE F5 3C
	sbc $0080C0.l,X		; FF C0 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	ora $00.b,S		; 03 00
	and $CFF805.l,X		; 3F 05 F8 CF
	bcs  33.b		; B0 21
	sta $03B807.l,X		; 9F 07 B8 03
	lda $007708.l,X		; BF 08 77 00
	jmp ($4000.w,X)		; 7C 00 40
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $08.b		; 00 08
	rti		; 40

	and $439F40.l,X		; 3F 40 9F 43
	bra -35.b		; 80 DD
	brk $7F.b		; 00 7F
	sta [$FC.b]		; 87 FC
	sbc $03FFC0.l		; EF C0 FF 03
	cpx $C000.w		; EC 00 C0
	brk $60.b		; 00 60
	brk $73.b		; 00 73
	brk $26.b		; 00 26
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $7F.b		; 00 7F
	brk $7C.b		; 00 7C
	stz $7E60.w		; 9C 60 7E
	brk $E0.b		; 00 E0
	ora ($20.b),Y		; 11 20
	cmp $FF0F70.l,X		; DF 70 0F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	stx $00.b		; 86 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$80.b]		; E7 80
	ror $D8E9.w,X		; 7E E9 D8
	sbc $00F800.l,X		; FF 00 F8 00
	brk $00.b		; 00 00
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
	brk $C0.b		; 00 C0
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
	brk $13.b		; 00 13
	trb $0F10.w		; 1C 10 0F
	trb $9C0E.w		; 1C 0E 9C
	.db $82, $8F, $15		; 82 8F 15
	cmp [$18.b]		; C7 18
	eor ($CF.b,X)		; 41 CF
	rts		; 60

	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	adc [$63.b],Y		; 77 63
	stz $FD03.w,X		; 9E 03 FD
	ora $3C.b,S		; 03 3C
	ora ($1E.b,X)		; 01 1E
	sta ($06.b,X)		; 81 06
	cpy #$6083.w		; C0 83 60
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
	brk $18.b		; 00 18
	brk $2C.b		; 00 2C
	brk $1F.b		; 00 1F
	stx $82D1.w		; 8E D1 82
	sbc $1B80.w,X		; FD 80 1B
	bra 127.b		; 80 7F
	rti		; 40

	ldy $C308.w,X		; BC 08 C3
	bra  95.b		; 80 5F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00D3.w		; 0C D3 00
	cmp $C88B44.l		; CF 44 8B C8
	ora $10F9.w,X		; 1D F9 10
	plx		; FA
	sec		; 38
	dec $7C71.w		; CE 71 7C
	sta ($00.b,X)		; 81 00
	jsr $3000.w		; 20 00 30
	brk $70.b		; 00 70
	brk $E2.b		; 00 E2
	brk $C7.b		; 00 C7
	brk $C7.b		; 00 C7
	brk $02.b		; 00 02
	brk $46.b		; 00 46
	pha		; 48
	ora [$58.b],Y		; 17 58
	and [$24.b]		; 27 24
	cmp $0CFD0E.l,X		; DF 0E FD 0C
	cld		; D8
	trb $10E1.w		; 1C E1 10
	cpx #$CF30.w		; E0 30 CF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	asl $E1.b		; 06 E1
	tsb $30C3.w		; 0C C3 30
	stx $9E21.w		; 8E 21 9E
	adc $8C.b,S		; 63 8C
	tsb $00E3.w		; 0C E3 00
	ora $009F00.l,X		; 1F 00 9F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	cpx #$0000.w		; E0 00 00
	jsr $E000.w		; 20 00 E0
	brk $80.b		; 00 80
	rts		; 60

	bcc 104.b		; 90 68
	bpl -56.b		; 10 C8
	bmi -56.b		; 30 C8
	jsr $C018.w		; 20 18 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	tsb $07.b		; 04 07
	ora [$03.b]		; 07 03
	ora #$00.b		; 09 00
	ora #$00.b		; 09 00
	tsb $0F00.w		; 0C 00 0F
	bra -121.b		; 80 87
	cpx #$00E3.w		; E0 E3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	stz $03.b,X		; 74 03
	bcs -57.b		; B0 C7
	tsx		; BA
	ora $F8.b,S		; 03 F8
	ora $7C.b,S		; 03 7C
	asl A		; 0A
	bit $FC0C.w,X		; 3C 0C FC
	ora $00F6.w		; 0D F6 00
	php		; 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $1C.b		; 00 1C
	brk $77.b		; 00 77
	ora ($7F.b,X)		; 01 7F
	brk $FD.b		; 00 FD
	bpl  -1.b		; 10 FF
	bmi -82.b		; 30 AE
	sec		; 38
	inc $38.b		; E6 38
	cmp ($00.b,S),Y		; D3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -96.b		; 80 A0
	ldy #$B830.w		; A0 30 B8
	bvs  -8.b		; 70 F8
	bvs -56.b		; 70 C8
	adc $F9E0.w,Y		; 79 E0 F9
	lda ($00.b,X)		; A1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	lda [$11.b],Y		; B7 11
	inc $BC03.w,X		; FE 03 BC
	sta ($7C.b),Y		; 91 7C
	and ($FC.b)		; 32 FC
	bvs -20.b		; 70 EC
	stz $41.b,X		; 74 41
	cli		; 58
	and ($00.b,X)		; 21 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	stx $00.b		; 86 00
	sty $21D9.w		; 8C D9 21
	txy		; 9B
	.db $62, $13, $62		; 62 13 62
	asl $37.b		; 06 37
	asl $F5.b		; 06 F5
	ora [$C4.b]		; 07 C4
	ora $B2.b		; 05 B2
	asl $B9.b		; 06 B9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	cpx #$E002.w		; E0 02 E0
	tsb $C2.b		; 04 C2
	tsb $E2.b		; 04 E2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	clc		; 18
	sec		; 38
	brk $B0.b		; 00 B0
	ldy #$A0B0.w		; A0 B0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C080.w		; C0 80 C0
	brk $60.b		; 00 60
	jsr $7020.w		; 20 20 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $3880.w		; 0E 80 38
	brk $E8.b		; 00 E8
	ora $05C2.w,Y		; 19 C2 05
	sbc ($FF.b),Y		; F1 FF
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	xba		; EB
	sbc $04FFD2.l,X		; FF D2 FF 04
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $06FFD2.l,X		; FF D2 FF 06
	asl $0000.w		; 0E 00 00
	phd		; 0B
	brk $D2.b		; 00 D2
	sbc $000E08.l,X		; FF 08 0E 00
	brk $E8.b		; 00 E8
	sbc $0AFFE2.l,X		; FF E2 FF 0A
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $0CFFE2.l,X		; FF E2 FF 0C
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $E2.b		; 00 E2
	sbc $000E0E.l,X		; FF 0E 0E 00
	brk $18.b		; 00 18
	brk $E2.b		; 00 E2
	sbc $000E20.l,X		; FF 20 0E 00
	brk $EB.b		; 00 EB
	sbc $22FFF2.l,X		; FF F2 FF 22
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $24FFF2.l,X		; FF F2 FF 24
	asl $0000.w		; 0E 00 00
	phd		; 0B
	brk $F2.b		; 00 F2
	sbc $000E26.l,X		; FF 26 0E 00
	brk $F0.b		; 00 F0
	sbc $280002.l,X		; FF 02 00 28
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	rol A		; 2A
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	ora $02.b,S		; 03 02
	cop $03.b		; 02 03
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($32.b,S),Y		; 33 32
	and ($00.b,S),Y		; 33 00
	lda ($80.b,X)		; A1 80
	ldy #$9081.w		; A0 81 90
	pld		; 2B
	brk $DB.b		; 00 DB
	brk $DF.b		; 00 DF
	ora ($EF.b,X)		; 01 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bpl 112.b		; 10 70
	bit $F4.b,X		; 34 F4
	tsb $F6.b		; 04 F6
	tsb $00FE.w		; 0C FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	ora ($10.b),Y		; 11 10
	brk $08.b		; 00 08
	bpl  12.b		; 10 0C
	tsb $070E.w		; 0C 0E 07
	ora [$18.b],Y		; 17 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F0CE.w		; C0 CE F0
	ora ($50.b),Y		; 11 50
	lda $00A350.l,X		; BF 50 A3 00
	sbc $08FF08.l,X		; FF 08 FF 08
	sbc [$0C.b],Y		; F7 0C
	dec $0000.w,X		; DE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $C9.b		; E6 C9
	cpx #$E06B.w		; E0 6B E0
	rol $60.b		; 26 60
	sta $708B.w		; 8D 8B 70
	stx $79.b		; 86 79
	iny		; C8
	and [$E1.b],Y		; 37 E1
	inc A		; 1A
	brk $36.b		; 00 36
	brk $14.b		; 00 14
	brk $18.b		; 00 18
	brk $12.b		; 00 12
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	trb $FB.b		; 14 FB
	bit $FB.b,X		; 34 FB
	bmi  -5.b		; 30 FB
	adc ($EB.b)		; 72 EB
	sbc [$CE.b],Y		; F7 CE
	cmp [$A4.b],Y		; D7 A4
	ldx $49.b		; A6 49
	trb $CB.b		; 14 CB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	ora ($C8.b)		; 12 C8
	rol $6080.w,X		; 3E 80 60
	stz $30C9.w		; 9C C9 30
	and $C0.b,S		; 23 C0
	ora $60.b,S		; 03 60
	asl $60.b		; 06 60
	tsb $00E2.w		; 0C E2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $10.b		; 00 10
	ora [$1E.b],Y		; 17 1E
	ora $F08F83.l,X		; 1F 83 8F F0
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	inc $6903.w,X		; FE 03 69
	brk $0F.b		; 00 0F
	brk $DF.b		; 00 DF
	brk $E7.b		; 00 E7
	cmp $3C.b,S		; C3 3C
	inc $61C1.w,X		; FE C1 61
	inc $0000.w,X		; FE 00 00
	brk $14.b		; 00 14
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $E6.b,S		; 03 E6
	ora [$00.b]		; 07 00
	tsb $83.b		; 04 83
	brk $E7.b		; 00 E7
	brk $6F.b		; 00 6F
	jsr $73DE.w		; 20 DE 73
	sty $E7E8.w		; 8C E8 E7
	brk $18.b		; 00 18
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	sty $1063.w		; 8C 63 10
	sbc $00E100.l		; EF 00 E1 00
	lda $A3DE20.l,X		; BF 20 DE A3
	rti		; 40

	jsr ($BF00.w,X)		; FC 00 BF
	dec $00.b		; C6 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	asl $4000.w,X		; 1E 00 40
	brk $20.b		; 00 20
	brk $33.b		; 00 33
	brk $07.b		; 00 07
	brk $20.b		; 00 20
	brk $C3.b		; 00 C3
	brk $9F.b		; 00 9F
	brk $BE.b		; 00 BE
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bmi -64.b		; 30 C0
	sed		; F8
	brk $C3.b		; 00 C3
	rol $00.b		; 26 00
	trb $6000.w		; 1C 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	ora #$010C.w		; 09 0C 01
	tsb $0C09.w		; 0C 09 0C
	asl $1300.w		; 0E 00 13
	brk $19.b		; 00 19
	brk $1C.b		; 00 1C
	bra -113.b		; 80 8F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($AE.b,S),Y		; 33 AE
	and ($AD.b,S),Y		; 33 AD
	sec		; 38
	sbc [$19.b]		; E7 19
	cmp [$1D.b]		; C7 1D
	cmp $1B.b,S		; C3 1B
	sbc [$13.b]		; E7 13
	inc $23.b		; E6 23
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	stx $9E5C.w		; 8E 5C 9E
	bit $9A.b,X		; 34 9A
	stz $32.b		; 64 32
	cpy $C521.w		; CC 21 C5
	ora ($DD.b,X)		; 01 DD
	ora ($D9.b,X)		; 01 D9
	eor ($34.b,X)		; 41 34
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	rti		; 40

	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$A080.w		; C0 80 A0
	cpy #$7080.w		; C0 80 70
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	rti		; 40

	ldx #$0000.w		; A2 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	ora $8498.w		; 0D 98 84
	stx $CF1A.w		; 8E 1A CF
	bpl  96.b		; 10 60
	sta $30C661.l		; 8F 61 C6 30
	adc ($10.b,X)		; 61 10
	rts		; 60

	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0CF8.w		; 0C F8 0C
	sbc ($0A.b,S),Y		; F3 0A
	adc $08.b,X		; 75 08
	asl $80.b,X		; 16 80
	ora [$00.b]		; 07 00
	sbc ($00.b),Y		; F1 00
	jsr ($8EC0.w,X)		; FC C0 8E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $78.b		; 00 78
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	php		; 08
	lda ($09.b),Y		; B1 09
	sbc ($0F.b,S),Y		; F3 0F
	rep #$8F		; C2 8F
	and [$0F.b],Y		; 37 0F
	beq   0.b		; F0 00
	ror $7D01.w		; 6E 01 7D
	and $1A.b,S		; 23 1A
	brk $0E.b		; 00 0E
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $C8.b		; 00 C8
	brk $08.b		; 00 08
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $E4.b		; 00 E4
	cop $FF.b		; 02 FF
	ora [$7E.b]		; 07 7E
	lsr $3C.b		; 46 3C
	stx $0830.w		; 8E 30 08
	adc [$10.b],Y		; 77 10
	and $6B10.w		; 2D 10 6B
	ora $0000E3.l		; 0F E3 00 00
	brk $80.b		; 00 80
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	and ($8C.b),Y		; 31 8C
	and $9C.b,S		; 23 9C
	ror $89.b		; 66 89
	php		; 08
	sbc [$01.b]		; E7 01
	stz $FE07.w,X		; 9E 07 FE
	tsb $04EF.w		; 0C EF 04
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	rti		; 40

	ldy #$2040.w		; A0 40 20
	cpy #$0020.w		; C0 20 00
	cpy #$C000.w		; C0 00 C0
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
	asl $0078.w		; 0E 78 00
	rol $3E00.w,X		; 3E 00 3E
	ora [$10.b]		; 07 10
	ora [$0F.b]		; 07 0F
	bpl   7.b		; 10 07
	ora $0310.w		; 0D 10 03
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $7F.b,S		; 03 7F
	trb $6368.w		; 1C 68 63
	trb $63E0.w		; 1C E0 63
	trb $78E7.w		; 1C E7 78
	tya		; 98
	cpx #$DF70.w		; E0 70 DF
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sta ($EF.b,X)		; 81 EF
	cop $1D.b		; 02 1D
	cpx #$201B.w		; E0 1B 20
	sbc $021F07.l,X		; FF 07 1F 02
	ora $0218.w,X		; 1D 18 02
	dec $0060.w,X		; DE 60 00
	bpl   0.b		; 10 00
	cop $00.b		; 02 00
	bit $00.b		; 24 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sep #$00		; E2 00
	sbc $00.b		; E5 00
	ora ($E0.b,X)		; 01 E0
	inc $EC03.w,X		; FE 03 EC
	trb $7082.w		; 1C 82 70
	sta $00E780.l		; 8F 80 E7 00
	sbc ($26.b,X)		; E1 26
	bra 127.b		; 80 7F
	sta $00.b,S		; 83 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	adc ($00.b,X)		; 61 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	asl $7900.w,X		; 1E 00 79
	brk $00.b		; 00 00
.INDEX 8
	sep #$1F		; E2 1F
	jsr ($0003.w,X)		; FC 03 00
	ora ($38.b,X)		; 01 38
	eor ($01.b,X)		; 41 01
	inc $FF00.w,X		; FE 00 FF
	sbc ($0F.b),Y		; F1 0F
	bcc 111.b		; 90 6F
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $10.b		; 00 10
	cpy #$F0.b		; C0 F0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	ora $3FE0.w,Y		; 19 E0 3F
	cpy #$60.b		; C0 60
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F0701.l,X		; 1F 01 07 0F
	beq   0.b		; F0 00
	bne  40.b		; D0 28
	ora $1F0010.l		; 0F 10 00 1F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -8.b		; F0 F8
	cpy #$F8.b		; C0 F8
	brk $2F.b		; 00 2F
	tsb $FB.b		; 04 FB
	sbc [$7F.b],Y		; F7 7F
	tsb $00FF.w		; 0C FF 00
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $16.b		; 00 16
	asl $F708.w,X		; 1E 08 F7
	adc #$3896.w		; 69 96 38
	ldy $0F.b,X		; B4 0F
	sed		; F8
	ora $001DC3.l		; 0F C3 1D 00
	and $610000.l,X		; 3F 00 00 61
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $43.b		; 00 43
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	ora ($F0.b,X)		; 01 F0
	asl $01E0.w,X		; 1E E0 01
	cpx #$40.b		; E0 40
	cli		; 58
	ora ($8E.b,X)		; 01 8E
	sta [$70.b]		; 87 70
	cop $DC.b		; 02 DC
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $A3.b		; 00 A3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $1E33.w		; 0C 33 1E
	ora ($F0.b,X)		; 01 F0
	ora $F0.b,S		; 03 F0
	sbc [$7C.b],Y		; F7 7C
	sbc ($0C.b)		; F2 0C
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $70.b		; 00 70
	bra -32.b		; 80 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DD.b		; 00 DD
	cmp $1F1F.w,X		; DD 1F 1F
	ora ($01.b,X)		; 01 01
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
	inc $DEFF.w,X		; FE FF DE
	cmp $00FEFE.l,X		; DF FE FE 00
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
	brk $1D.b		; 00 1D
	sbc $FD3D.w,X		; FD 3D FD
	and $E0E0BF.l,X		; 3F BF E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $187E.w,X		; 7E 7E 18
	clc		; 18
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
	stp		; DB
	stp		; DB
	and $343F30.l,X		; 3F 30 3F 34
	and $383E34.l,X		; 3F 34 3E 38
	asl $1E1C.w,X		; 1E 1C 1E
	trb $141E.w		; 1C 1E 14
	adc $3F0074.l,X		; 7F 74 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	bra  -1.b		; 80 FF
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
	asl $F6.b,X		; 16 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $EE.b		; 00 EE
	ora ($D2.b),Y		; 11 D2
	tsb $F0.b		; 04 F0
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	sbc $FF.b,X		; F5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	inc $E5FF.w		; EE FF E5
	sbc $000E06.l,X		; FF 06 0E 00
	brk $FE.b		; 00 FE
	sbc $08FFE5.l,X		; FF E5 FF 08
	asl $0000.w		; 0E 00 00
	asl $E500.w		; 0E 00 E5
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $F2.b		; 00 F2
	sbc $0CFFD5.l,X		; FF D5 FF 0C
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	cmp $FF.b,X		; D5 FF
	asl $000E.w		; 0E 0E 00
	brk $FC.b		; 00 FC
	sbc $20FFC5.l,X		; FF C5 FF 20
	asl $0000.w		; 0E 00 00
	tsa		; 3B
	cpy $073F.w		; CC 3F 07
	cpx #$00.b		; E0 00
	cpx #$13.b		; E0 13
	ora $070021.l,X		; 1F 21 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $8210.w		; EE 10 82
	cmp $05.b,S		; C3 05
	ply		; 7A
	and $DA.b,S		; 23 DA
	lda ($FF.b),Y		; B1 FF
	ora $10.b,S		; 03 10
	ora $00.b,S		; 03 00
	ora $02.b,S		; 03 02
	brk $01.b		; 00 01
	brk $34.b		; 00 34
	brk $81.b		; 00 81
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	jmp ($818F.w,X)		; 7C 8F 81
	clv		; B8
	eor ($B0.b,X)		; 41 B0
	brk $8C.b		; 00 8C
	cmp ($26.b,X)		; C1 26
.ACCU 16
	rep #$2C		; C2 2C
	cpy #$20.b		; C0 20
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $0F.b		; 00 0F
	brk $73.b		; 00 73
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	sty $107F.w		; 8C 7F 10
	jmp ($0CE3.w)		; 6C E3 0C
	cpx #$EE.b		; E0 EE
	bvs -24.b		; 70 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	rol $0C.b		; 26 0C
	and [$08.b],Y		; 37 08
	bpl  39.b		; 10 27
	php		; 08
	ora ($08.b),Y		; 11 08
	bpl   0.b		; 10 00
	ora $000400.l		; 0F 00 04 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $10.b		; 00 10
	adc $802812.l		; 6F 12 28 80
	ora $C0F900.l		; 0F 00 F9 C0
	tya		; 98
	jsr $00EC.w		; 20 EC 00
	sei		; 78
	brk $FC.b		; 00 FC
	brk $80.b		; 00 80
	brk $43.b		; 00 43
	brk $70.b		; 00 70
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $87.b		; 00 87
	brk $03.b		; 00 03
	bvs   7.b		; 70 07
	adc $71B6.w,Y		; 79 B6 71
	stx $12.b		; 86 12
	sbc $11.b,X		; F5 11
	cpy $93E4.w		; CC E4 93
	brk $F1.b		; 00 F1
	brk $FF.b		; 00 FF
	brk $48.b		; 00 48
	brk $48.b		; 00 48
	brk $48.b		; 00 48
	brk $08.b		; 00 08
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	sta ($25.b)		; 92 25
	sty $33.b		; 84 33
	ora ($EE.b,X)		; 01 EE
	tsb $F7.b		; 04 F7
	cpy #$FF.b		; C0 FF
	brk $8F.b		; 00 8F
	brk $78.b		; 00 78
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra  64.b		; 80 40
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
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $03.b		; 02 03
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc -89.b		; 90 A7
	brk $DF.b		; 00 DF
	cop $EF.b		; 02 EF
	rol $AD.b,X		; 36 AD
	bmi -17.b		; 30 EF
	ora ($4F.b)		; 12 4F
	inc A		; 1A
	cmp [$16.b]		; C7 16
	adc $0000.w		; 6D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	jsr $60B0.w		; 20 B0 60
	beq 116.b		; F0 74
	rts		; 60

	mvn $9C,$A4		; 54 A4 9C
	pla		; 68
	txa		; 8A
	bit $420C.w		; 2C 0C 42
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
	brk $03.b		; 00 03
	ora $0B.b,S		; 03 0B
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $02.b,S		; 03 02
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $02.b,S		; 03 02
	ora [$06.b]		; 07 06
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	cld		; D8
	cmp $7E7F7E.l,X		; DF 7E 7F 7E
	ror $0000.w,X		; 7E 00 00
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	asl A		; 0A
	plx		; FA
	and [$F7.b],Y		; 37 F7
	jmp ($C0FC.w,X)		; 7C FC C0
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
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
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
	brk $20.b		; 00 20
	and $E19E8F.l		; 2F 8F 9E E1
	cmp $017118.l		; CF 18 71 01
	sei		; 78
	ora $1F0C21.l		; 0F 21 0C 1F
	ora [$21.b],Y		; 17 21
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $35.b		; 00 35
	inc $19.b		; E6 19
	ora $38EC.w,X		; 1D EC 38
	sbc $C33C.w,X		; FD 3C C3
	tsb $3F.b		; 04 3F
	cpy #$33.b		; C0 33
	ora $80.b,S		; 03 80
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	bpl -18.b		; 10 EE
	jsr ($3F00.w,X)		; FC 00 3F
	inc $70.b		; E6 70
	inc $E20C.w,X		; FE 0C E2
	clc		; 18
	sbc [$E0.b]		; E7 E0
	sbc [$16.b],Y		; F7 16
	ldy #$00.b		; A0 00
	bpl   0.b		; 10 00
	ora [$00.b]		; 07 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	php		; 08
	brk $59.b		; 00 59
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	sta $CA58.w		; 8D 58 CA
	and $600700.l,X		; 3F 00 07 60
	sta [$04.b]		; 87 04
	xce		; FB
	sbc $1E.b		; E5 1E
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $1C.b,S		; 03 1C
	ora $9B86.w		; 0D 86 9B
	stx $08.b		; 86 08
	rti		; 40

	sta $B13E61.l		; 8F 61 3E B1
	cmp $007FC1.l		; CF C1 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	cpx #$32.b		; E0 32
	lda $30.b,X		; B5 30
.INDEX 16
	rep #$10		; C2 10
	adc [$25.b]		; 67 25
	cld		; D8
	bit $CB.b,X		; 34 CB
	lda ($8C.b),Y		; B1 8C
	sty $29.b		; 84 29
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $46.b		; 00 46
	tsb $AA.b		; 04 AA
	jsr $61FE.w		; 20 FE 61
	inc $DD6A.w,X		; FE 6A DD
	sbc $C89A.w		; ED 9A C8
	ora $20.b,X		; 15 20
	sta $00FE09.l,X		; 9F 09 FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $6000.w		; 20 00 60
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	ldy #$0040.w		; A0 40 00
	cpy #$8050.w		; C0 50 80
	bmi   0.b		; 30 00
	plp		; 28
	brk $48.b		; 00 48
	jsr $4890.w		; 20 90 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	bne -120.b		; D0 88
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	pea $E10B.w		; F4 0B E1
	cop $F5.b		; 02 F5
	sbc $00FFE1.l,X		; FF E1 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	sbc ($FF.b,X)		; E1 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	pea $F1FF.w		; F4 FF F1
	sbc $000E04.l,X		; FF 04 0E 00
	brk $04.b		; 00 04
	brk $F1.b		; 00 F1
	sbc $000E06.l,X		; FF 06 0E 00
	brk $F9.b		; 00 F9
	sbc $080001.l,X		; FF 01 00 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	cop $01.b		; 02 01
	tsb $00.b		; 04 00
	tsb $07.b		; 04 07
	brk $05.b		; 00 05
	bpl  23.b		; 10 17
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$8000.w		; A0 00 80
	bpl  12.b		; 10 0C
	bit $FE04.w,X		; 3C 04 FE
	lda [$CD.b]		; A7 CD
	phd		; 0B
	stz $20.b,X		; 74 20
	sbc $B1.b,X		; F5 B1
	sty $0000.w		; 8C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $08.b		; 00 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($19.b,X)		; 01 19
	brk $0F.b		; 00 0F
	adc #$C976.w		; 69 76 C9
	stz $6806.w,X		; 9E 06 68
	sec		; 38
	eor #$344C.w		; 49 4C 34
	ora $060068.l,X		; 1F 68 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	bit $0B.b,X		; 34 0B
	brk $BF.b		; 00 BF
	phb		; 8B
	rts		; 60

	sta $5823B2.l		; 8F B2 23 58
	sty $20F3.w		; 8C F3 20
	eor $836F.w,Y		; 59 6F 83
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $1F.b		; 00 1F
	brk $48.b		; 00 48
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $A6.b		; 00 A6
	brk $10.b		; 00 10
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bit $C0A0.w		; 2C A0 C0
	bmi -64.b		; 30 C0
	clc		; 18
	ora $F8.b		; 05 F8
	php		; 08
	inc $8000.w,X		; FE 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
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
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01EF.w		; ED EF 01
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
	brk $A8.b		; 00 A8
	tay		; A8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0001.w		; 0C 01 00
	ora $2F22.w		; 0D 22 2F
	ora ($2A.b)		; 12 2A
	ldx #$B28D.w		; A2 8D B2
	brk $40.b		; 00 40
	sta $4A08.w,X		; 9D 08 4A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sty $3F.b		; 84 3F
	tsb $BB.b		; 04 BB
	sta $9478.w		; 8D 78 94
	rtl		; 6B

	and ($D6.b),Y		; 31 D6
	tsx		; BA
	mvn $23,$04		; 54 04 23
	ora ($69.b,S),Y		; 13 69
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $28.b		; 00 28
	brk $A9.b		; 00 A9
	brk $98.b		; 00 98
	brk $80.b		; 00 80
	rts		; 60

	brk $90.b		; 00 90
	rti		; 40

	bpl -128.b		; 10 80
	jsr $1880.w		; 20 80 18
	rts		; 60

	php		; 08
	bcs  48.b		; B0 30
	inx		; E8
	jsr $0070.w		; 20 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

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
	tsb $401F.w		; 0C 1F 40
	and [$01.b],Y		; 37 01
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $05.b		; 05 05
	ora ($6C.b,S),Y		; 13 6C
	bmi -29.b		; 30 E3
	trb $38CA.w		; 1C CA 38
	tsb $38.b		; 04 38
	jsr $3030.w		; 20 30 30
	bmi  48.b		; 30 30
	sec		; 38
	jsr $9300.w		; 20 00 93
	brk $0C.b		; 00 0C
	brk $30.b		; 00 30
	brk $38.b		; 00 38
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $38.b		; 00 38
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	rol $08.b,X		; 36 08
	stz $78.b		; 64 78
	bcc  96.b		; 90 60
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
	rti		; 40

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
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	plx		; FA
	tsb $F1.b		; 04 F1
	ora ($FA.b,X)		; 01 FA
	sbc $00FFF1.l,X		; FF F1 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc ($FF.b),Y		; F1 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $02FFF9.l,X		; FF F9 FF 02
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $03FF.w,Y		; F9 FF 03
	asl $0000.w		; 0E 00 00
	inc $01FF.w,X		; FE FF 01
	brk $04.b		; 00 04
	asl $0000.w		; 0E 00 00
	brk $0C.b		; 00 0C
	asl $1E.b		; 06 1E
	ora $0437.w		; 0D 37 04
	ora $770B.w,Y		; 19 0B 77
	clc		; 18
	adc ($C5.b),Y		; 71 C5
	asl $21.b,X		; 16 21
	adc ($00.b,S),Y		; 73 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	plp		; 28
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $25.b		; 00 25
	sta $934076.l,X		; 9F 76 40 93
	ply		; 7A
	ora $80.b		; 05 80
	rts		; 60

	tsb $0C00.w		; 0C 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phy		; 5A
	brk $08.b		; 00 08
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	eor ($7F.b,X)		; 41 7F
	brk $00.b		; 00 00
	rti		; 40

	bra   0.b		; 80 00
	rti		; 40

	rti		; 40

	cpx #$C080.w		; E0 80 C0
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
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	ora [$F6.b]		; 07 F6
	ora $F9.b,S		; 03 F9
	sbc $00FFF6.l,X		; FF F6 FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	sbc $FEFF.w,Y		; F9 FF FE
	sbc $000E02.l,X		; FF 02 0E 00
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	sbc $000E03.l,X		; FF 03 0E 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	tsb $01.b		; 04 01
	tsb $25.b		; 04 25
	cop $14.b		; 02 14
	ora $0E.b,S		; 03 0E
	ora ($CA.b,X)		; 01 CA
	and $01.b		; 25 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $25.b		; 00 25
	brk $14.b		; 00 14
	brk $0E.b		; 00 0E
	brk $CA.b		; 00 CA
	brk $00.b		; 00 00
	bpl  32.b		; 10 20
	bpl  32.b		; 10 20
	bpl  40.b		; 10 28
	bpl -88.b		; 10 A8
	bpl -80.b		; 10 B0
	php		; 08
	bcs   8.b		; B0 08
	bcs  72.b		; B0 48
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $28.b		; 00 28
	brk $A8.b		; 00 A8
	brk $B0.b		; 00 B0
	brk $B0.b		; 00 B0
	brk $B0.b		; 00 B0
	brk $3D.b		; 00 3D
	cop $0A.b		; 02 0A
	sbc $07.b,X		; F5 07
	clc		; 18
	ora ($06.b,X)		; 01 06
	brk $12.b		; 00 12
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $0A00.w,X		; 3D 00 0A
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $12.b		; 00 12
	ora ($01.b)		; 12 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	iny		; C8
	ldy #$A058.w		; A0 58 A0
	cli		; 58
	cpy #$003C.w		; C0 3C 00
	inc $1800.w		; EE 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	ldy #$A000.w		; A0 00 A0
	brk $CC.b		; 00 CC
	tsb $EEEE.w		; 0C EE EE
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	tsb $F8.b		; 04 F8
	cop $FA.b		; 02 FA
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sed		; F8
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FE.b		; 00 FE
	sbc $020000.l,X		; FF 00 00 02
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	rol A		; 2A
	tsb $1E.b		; 04 1E
	brk $D6.b		; 00 D6
	and #$0738.w		; 29 38 07
	asl $E9.b,X		; 16 E9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol A		; 2A
	brk $1E.b		; 00 1E
	brk $D6.b		; 00 D6
	brk $38.b		; 00 38
	brk $16.b		; 00 16
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	dec $7E00.w		; CE 00 7E
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $06.b,X		; 36 06
	ror $047E.w,X		; 7E 7E 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	ora $FA.b,S		; 03 FA
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	php		; 08
	cop $08.b		; 02 08
	cop $48.b		; 02 48
	ora ($32.b)		; 12 32
	php		; 08
	ror A		; 6A
	trb $30.b		; 14 30
	dec $130C.w		; CE 0C 13
	brk $0A.b		; 00 0A
	php		; 08
	brk $08.b		; 00 08
	brk $48.b		; 00 48
	brk $32.b		; 00 32
	brk $6A.b		; 00 6A
	brk $30.b		; 00 30
	brk $0D.b		; 00 0D
	ora ($0A.b,X)		; 01 0A
	asl A		; 0A
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FD01.w,X		; FD 01 FD
	brk $FD.b		; 00 FD
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	php		; 08
	jsr $18E0.w		; 20 E0 18
	rts		; 60

	tya		; 98
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $38.b		; 00 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0E00FF.l,X		; FF FF 00 0E
	brk $00.b		; 00 00
	bra  64.b		; 80 40
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	ora #$04F8.w		; 09 F8 04
	plx		; FA
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $01FF.w,X		; FD FF 01
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $02FFF5.l,X		; FF F5 FF 02
	asl $0000.w		; 0E 00 00
	asl $1E00.w		; 0E 00 1E
	brk $1E.b		; 00 1E
	cop $FC.b		; 02 FC
	brk $7F.b		; 00 7F
	tsb $3B.b		; 04 3B
	clc		; 18
	brk $05.b		; 00 05
	brk $10.b		; 00 10
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $FFFF.w,X		; FD FF FF
	sbc $E77CFB.l,X		; FF FB 7C E7
	bit $0505.w,X		; 3C 05 05
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	cpx #$40E0.w		; E0 E0 40
	brk $B8.b		; 00 B8
	sec		; 38
	clv		; B8
	bpl  88.b		; 10 58
	asl $00.b		; 06 00
	sbc $EA00.w,X		; FD 00 EA
	bra -128.b		; 80 80
	bpl -16.b		; 10 F0
	sed		; F8
	clv		; B8
	cpy #$C838.w		; C0 38 C8
	bpl -66.b		; 10 BE
	rol $FD.b		; 26 FD
	sbc $EAEA.w,X		; FD EA EA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	ora $3F3F3F.l,X		; 1F 3F 3F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $030003.l,X		; FF 03 00 03
	brk $FC.b		; 00 FC
	asl $FA.b		; 06 FA
	ora $FC.b,S		; 03 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	jsr ($01FF.w,X)		; FC FF 01
	asl $0000.w		; 0E 00 00
	inc $F4FF.w,X		; FE FF F4
	sbc $000E02.l,X		; FF 02 0E 00
	brk $60.b		; 00 60
	brk $18.b		; 00 18
	brk $3B.b		; 00 3B
	ora $3A.b,S		; 03 3A
	php		; 08
	sbc $6E10.w,X		; FD 10 6E
	jsr $1700.w		; 20 00 17
	brk $23.b		; 00 23
	jmp ($FC7C.w,X)		; 7C 7C FC
	jsr ($FFFC.w,X)		; FC FC FF
	sbc [$FD.b],Y		; F7 FD
	inc $DDF0.w		; EE F0 DD
	adc ($17.b),Y		; 71 17
	ora [$23.b],Y		; 17 23
	and $00.b,S		; 23 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	rts		; 60

	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	cpx #$C060.w		; E0 60 C0
	cpy #$2020.w		; C0 20 20
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
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FC04.w,X		; FD 04 FC
	cop $FD.b		; 02 FD
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $FE.b		; 00 FE
	jsr $3E00.w		; 20 00 3E
	brk $4F.b		; 00 4F
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sed		; F8
	sed		; F8
	inc $DAFE.w,X		; FE FE DA
	cpx #$3E3E.w		; E0 3E 3E
	eor $00004F.l		; 4F 4F 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FD02.w,X		; FE 02 FD
	ora ($FE.b,X)		; 01 FE
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	php		; 08
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	cpx #$F0E0.w		; E0 E0 F0
	beq  -8.b		; F0 F8
	cld		; D8
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0E00FF.l,X		; FF FF 00 0E
	brk $00.b		; 00 00
	cpy #$0040.w		; C0 40 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	ora [$F8.b]		; 07 F8
	cop $F8.b		; 02 F8
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	xce		; FB
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FE.b		; 00 FE
	sbc $02FFF3.l,X		; FF F3 FF 02
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	asl A		; 0A
	brk $7E.b		; 00 7E
	brk $F3.b		; 00 F3
	brk $DF.b		; 00 DF
	bpl -49.b		; 10 CF
	tsb $1F00.w		; 0C 00 1F
	brk $46.b		; 00 46
	ora $0F0F0F.l		; 0F 0F 0F 0F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFF3FF.l		; EF FF F3 FF
	ora $46461F.l,X		; 1F 1F 46 46
	clv		; B8
	sec		; 38
	cpx $FC0C.w		; EC 0C FC
	brk $C0.b		; 00 C0
	brk $8C.b		; 00 8C
	tsb $0604.w		; 0C 04 06
	brk $FD.b		; 00 FD
	brk $50.b		; 00 50
	cpy $FC.b		; C4 FC
	beq  -4.b		; F0 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCF0.w,X)		; FC F0 FC
	plx		; FA
	inc $FDFD.w,X		; FE FD FD
	bvc  80.b		; 50 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($FA00.w,X)		; 7C 00 FA
	cop $7E.b		; 02 7E
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($F87C.w,X)		; 7C 7C F8
	inc $FEF0.w,X		; FE F0 FE
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	plx		; FA
	tsb $FA.b		; 04 FA
	ora ($FA.b,X)		; 01 FA
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	ora ($0B.b,X)		; 01 0B
	brk $FB.b		; 00 FB
	brk $EE.b		; 00 EE
	brk $9C.b		; 00 9C
	bpl   0.b		; 10 00
	and $0F9A00.l,X		; 3F 00 9A 0F
	ora $1F0F0E.l		; 0F 0E 0F 1F
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $3FFFEF.l,X		; FF EF FF 3F
	and $009A9A.l,X		; 3F 9A 9A 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	cpy #$0000.w		; C0 00 00
	brk $40.b		; 00 40
	rts		; 60

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$E0A0.w		; C0 A0 E0
	cpy #$80C0.w		; C0 C0 80
	bra   1.b		; 80 01
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	asl $1E02.w,X		; 1E 02 1E
	asl $EE.b		; 06 EE
	brk $FA.b		; 00 FA
	.db $42, $00		; 42 00
	ror $A000.w,X		; 7E 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $381E.w		; 1C 1E 38
	rol $FEFE.w,X		; 3E FE FE
	ldy $7EFE.w,X		; BC FE 7E
	ror $A0A0.w,X		; 7E A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FD01.w,X		; FD 01 FD
	brk $FD.b		; 00 FD
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	bmi  16.b		; 30 10
	cld		; D8
	brk $68.b		; 00 68
	pha		; 48
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $F830.w		; 20 30 F8
	sed		; F8
	bcs  -8.b		; B0 F8
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0E00FF.l,X		; FF FF 00 0E
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	xce		; FB
	ora [$F6.b]		; 07 F6
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	sbc $FEFF.w,X		; FD FF FE
	sbc $000E02.l,X		; FF 02 0E 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000E03.l,X		; FF 03 0E 00
	brk $02.b		; 00 02
	cop $04.b		; 02 04
	tsb $05.b		; 04 05
	tsb $64.b		; 04 64
	stz $19.b		; 64 19
	ora $0606.w,Y		; 19 06 06
	and [$36.b],Y		; 37 36
	xce		; FB
	phx		; DA
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	rol $26.b		; 26 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$40C0.w		; C0 C0 40
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BA.b		; 00 BA
	bpl -54.b		; 10 CA
	php		; 08
	ror $BD00.w		; 6E 00 BD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	ora $F8.b,S		; 03 F8
	brk $FC.b		; 00 FC
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $00FF.w,X		; FD FF 00
	brk $01.b		; 00 01
	asl $0000.w		; 0E 00 00
	bpl  16.b		; 10 10
	trb $10.b		; 14 10
	cmp ($D2.b)		; D2 D2
	inc A		; 1A
	clc		; 18
	ror $EE78.w,X		; 7E 78 EE
	tay		; A8
	pla		; 68
	php		; 08
	and $0C00.w		; 2D 00 0C
	tsb $0808.w		; 0C 08 08
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FD.b		; 00 FD
	ora $FA.b,S		; 03 FA
	brk $FD.b		; 00 FD
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	jsr $A820.w		; 20 20 A8
	tay		; A8
	plp		; 28
	jsr $6070.w		; 20 70 60
	plp		; 28
	jsr $005C.w		; 20 5C 00
	rol $00.b,X		; 36 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	rts		; 60

	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$F040.w		; C0 40 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $000E00.l,X		; FF 00 0E 00
	brk $80.b		; 00 80
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
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $F3.b		; 00 F3
	ora $F304E3.l		; 0F E3 04 F3
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $D5FF.w,X		; FD FF D5
	sbc $000E08.l,X		; FF 08 0E 00
	brk $0C.b		; 00 0C
	jmp ($1800.w,X)		; 7C 00 18
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $EF.b		; 00 EF
	bra 127.b		; 80 7F
	eor $BC.b,S		; 43 BC
	and $5C.b,S		; 23 5C
	ora $0700.w		; 0D 00 07
	brk $79.b		; 00 79
	brk $7B.b		; 00 7B
	brk $63.b		; 00 63
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $2F.b		; 00 2F
	brk $F9.b		; 00 F9
	dec $58.b		; C6 58
	eor [$07.b]		; 47 07
	tya		; 98
	bpl -17.b		; 10 EF
	tsb $C0FF.w		; 0C FF C0
	and $06F8.w,X		; 3D F8 06
	beq  15.b		; F0 0F
	sbc $007800.l,X		; FF 00 78 00
	sbc [$00.b]		; E7 00
	sbc [$00.b],Y		; F7 00
	sbc $00F800.l,X		; FF 00 F8 00
	inc $FF00.w,X		; FE 00 FF
	brk $E0.b		; 00 E0
	eor $DFE0C0.l,X		; 5F C0 E0 DF
	ldy #$609F.w		; A0 9F 60
	trb $30E3.w		; 1C E3 30
.ACCU 16
.INDEX 16
	rep #$31		; C2 31
	rep #$02		; C2 02
	cmp ($EE.b),Y		; D1 EE
	brk $EE.b		; 00 EE
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $1C.b		; 00 1C
	brk $3C.b		; 00 3C
	brk $FD.b		; 00 FD
	brk $CE.b		; 00 CE
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	rts		; 60

	bcs  64.b		; B0 40
	bcc   0.b		; 90 00
	brk $80.b		; 00 80
	clc		; 18
	brk $D8.b		; 00 D8
	jsr $A040.w		; 20 40 A0
	rti		; 40

	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $18.b		; 00 18
	brk $D8.b		; 00 D8
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	asl $05.b		; 06 05
	cop $0F.b		; 02 0F
	bmi   1.b		; 30 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $3F.b		; 00 3F
	brk $0C.b		; 00 0C
	sbc ($0C.b,S),Y		; F3 0C
	sbc $D4.b,S		; E3 D4
	pld		; 2B
	tas		; 1B
	cpx $02.b		; E4 02
	jsr ($FC02.w,X)		; FC 02 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $ED00.w,X		; FE 00 ED
	brk $D4.b		; 00 D4
	brk $DB.b		; 00 DB
	brk $C2.b		; 00 C2
	brk $DE.b		; 00 DE
	brk $EF.b		; 00 EF
	brk $73.b		; 00 73
	brk $60.b		; 00 60
	bra 112.b		; 80 70
	bra  48.b		; 80 30
	bra   0.b		; 80 00
	cpy #$6018.w		; C0 18 60
	ora ($6C.b)		; 12 6C
	bpl -20.b		; 10 EC
	bpl -32.b		; 10 E0
	rts		; 60

	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	brk $78.b		; 00 78
	brk $7E.b		; 00 7E
	brk $DC.b		; 00 DC
	brk $D0.b		; 00 D0
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
	brk $0F.b		; 00 0F
	bmi   0.b		; 30 00
	asl $0101.w,X		; 1E 01 01
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	brk $45.b		; 00 45
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	ora ($02.b,X)		; 01 02
	brk $01.b		; 00 01
	ora $3F3F0F.l		; 0F 0F 3F 3F
	eor $45.b		; 45 45
	brk $00.b		; 00 00
	bra 126.b		; 80 7E
	cpy $66CC.w		; CC CC 66
	ror $3B.b		; 66 3B
	and ($3A.b)		; 32 3A
	tsx		; BA
	brk $E0.b		; 00 E0
	brk $BF.b		; 00 BF
	brk $02.b		; 00 02
	sta $10CD00.l		; 8F 00 CD 10
	adc [$08.b]		; 67 08
	tsa		; 3B
	cpy $BB.b		; C4 BB
	cpy $FF.b		; C4 FF
	cpx #$BFBF.w		; E0 BF BF
	cop $02.b		; 02 02
	ora $14.b,S		; 03 14
	asl $16.b		; 06 16
	tsb $B83C.w		; 0C 3C B8
	sei		; 78
	cpx #$00E0.w		; E0 E0 00
	ora [$00.b]		; 07 00
	lda $0000.w,X		; BD 00 00
	sbc $00.b,S		; E3 00
	dec $00.b		; C6 00
	tsb $B800.w		; 0C 00 B8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora [$BD.b]		; 07 BD
	lda $0000.w,X		; BD 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$20A0.w		; A0 A0 20
	jsr $0000.w		; 20 00 00
	tsb $7B.b		; 04 7B
	tsb $7B.b		; 04 7B
	tsb $1B.b		; 04 1B
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	clc		; 18
	adc [$20.b]		; 67 20
	eor $5839.w,X		; 5D 39 58
	adc $007F00.l,X		; 7F 00 7F 00
	asl $00.b		; 06 00
	adc $007F00.l,X		; 7F 00 7F 00
	ora $003F00.l,X		; 1F 00 3F 00
	tsa		; 3B
	brk $00.b		; 00 00
	sbc $0CEF00.l,X		; FF 00 EF 0C
	sbc ($34.b,S),Y		; F3 34
	xce		; FB
	clc		; 18
	sbc [$1B.b],Y		; F7 1B
	cpx $60.b		; E4 60
	sta $FD1FE0.l,X		; 9F E0 1F FD
	brk $4F.b		; 00 4F
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	inx		; E8
	asl $E9.b		; 06 E9
	stx $4270.w		; 8E 70 42
	ldx $07DC.w,Y		; BE DC 07
	tsb $08F7.w		; 0C F7 08
	inc $20.b,X		; F6 20
	cmp $260007.l,X		; DF 07 00 26
	brk $FE.b		; 00 FE
	brk $32.b		; 00 32
	brk $1D.b		; 00 1D
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	cpy #$0080.w		; C0 80 00
	brk $00.b		; 00 00
	rts		; 60

	brk $50.b		; 00 50
	bra  16.b		; 80 10
	bra  16.b		; 80 10
	bra  80.b		; 80 50
	cpy #$0000.w		; C0 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rts		; 60

	brk $D0.b		; 00 D0
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($FC02.w,X)		; 7C 02 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F6.b		; 00 F6
	phd		; 0B
	sbc #$F603.w		; E9 03 F6
	sbc $00FFE9.l,X		; FF E9 FF 00
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	sbc #$02FF.w		; E9 FF 02
	asl $0000.w		; 0E 00 00
	inc $FF.b,X		; F6 FF
	sbc $04FF.w,Y		; F9 FF 04
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	sbc $06FF.w,Y		; F9 FF 06
	asl $0000.w		; 0E 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	tsb $1B.b		; 04 1B
	trb $0B.b		; 14 0B
	bpl -17.b		; 10 EF
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	asl $1A00.w,X		; 1E 00 1A
	brk $06.b		; 00 06
	brk $17.b		; 00 17
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	beq  68.b		; F0 44
	clv		; B8
	lsr $38.b		; 46 38
	beq  12.b		; F0 0C
	and $C4.b,S		; 23 C4
	jsl $FD02C5.l		; 22 C5 02 FD
	brk $FD.b		; 00 FD
	sed		; F8
	brk $E4.b		; 00 E4
	brk $56.b		; 00 56
	brk $F8.b		; 00 F8
	brk $27.b		; 00 27
	brk $E7.b		; 00 E7
	brk $7F.b		; 00 7F
	brk $D0.b		; 00 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	sbc $02DF00.l,X		; FF 00 DF 02
	sbc $B04F.w,X		; FD 4F B0
	asl $0261.w,X		; 1E 61 02
	dec A		; 3A
	ora $05.b		; 05 05
	ora ($1F.b,X)		; 01 1F
	sbc $00CF00.l		; EF 00 CF 00
	sbc $005F00.l,X		; FF 00 5F 00
	asl $0200.w,X		; 1E 00 02
	brk $05.b		; 00 05
	php		; 08
	ora $748B1E.l,X		; 1F 1E 8B 74
	eor $FC.b,S		; 43 FC
	cop $DC.b		; 02 DC
	bra 126.b		; 80 7E
	brk $E2.b		; 00 E2
	rti		; 40

	.db $42, $21		; 42 21
	and $EC.b,S		; 23 EC
	cpx $00BB.w		; EC BB 00
	sbc ($00.b,S),Y		; F3 00
	cmp $00.b,S		; C3 00
	sbc $7C00.w,X		; FD 00 7C
	brk $5C.b		; 00 5C
	bra  49.b		; 80 31
	rti		; 40

	sbc $00E000.l,X		; FF 00 E0 00
	bra  96.b		; 80 60
	tsb $00.b		; 04 00
	bpl 104.b		; 10 68
	rti		; 40

	bcs -128.b		; B0 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $F8.b		; 00 F8
	brk $98.b		; 00 98
	brk $84.b		; 00 84
	brk $90.b		; 00 90
	brk $40.b		; 00 40
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
	brk $10.b		; 00 10
	sbc $052F10.l		; EF 10 2F 05
	xce		; FB
	jsr $41DF.w		; 20 DF 41
	ldx $67.b,Y		; B6 67
	ldy #$F213.w		; A0 13 F2
	brk $FE.b		; 00 FE
	jsr ($1900.w,X)		; FC 00 19
	brk $FD.b		; 00 FD
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $6F.b		; 00 6F
	brk $17.b		; 00 17
	brk $E7.b		; 00 E7
	brk $00.b		; 00 00
	adc $B649.w,X		; 7D 49 B6
	sty $FB.b		; 84 FB
	sbc ($0E.b),Y		; F1 0E
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	jmp.w [$3F27]		; DC 27 3F
	iny		; C8
	bvs   0.b		; 70 00
	lda $00B200.l,X		; BF 00 B2 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FD00.l,X		; FF 00 FD 00
	and $40A000.l,X		; 3F 00 A0 40
	bra   0.b		; 80 00
	clc		; 18
	bra -128.b		; 80 80
	cpx #$A000.w		; E0 00 A0
	bpl -16.b		; 10 F0
	bpl -32.b		; 10 E0
	inx		; E8
	bpl -96.b		; 10 A0
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	brk $F8.b		; 00 F8
	brk $98.b		; 00 98
	brk $98.b		; 00 98
	brk $90.b		; 00 90
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
	brk $00.b		; 00 00
	adc $009700.l,X		; 7F 00 97 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $009797.l,X		; 7F 97 97 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FBFB00.l,X		; FF 00 FB FB
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	brk $C8.b		; 00 C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	inx		; E8
	iny		; C8
	iny		; C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $F900.w		; 0C 00 F9
	ora #$01EF.w		; 09 EF 01
	sbc $EFFF.w,Y		; F9 FF EF
	sbc $000E00.l,X		; FF 00 0E 00
	brk $09.b		; 00 09
	brk $EF.b		; 00 EF
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F9.b		; 00 F9
	sbc $04FFFF.l,X		; FF FF FF 04
	asl $0000.w		; 0E 00 00
	brk $07.b		; 00 07
	ora ($0C.b,X)		; 01 0C
	cop $3D.b		; 02 3D
	brk $3F.b		; 00 3F
	jsr $201F.w		; 20 1F 20
	cmp $07DD20.l,X		; DF 20 DD 07
	inc $0007.w,X		; FE 07 00
	ora $3A00.w		; 0D 00 3A
	brk $38.b		; 00 38
	brk $2D.b		; 00 2D
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	brk $F6.b		; 00 F6
	brk $40.b		; 00 40
	bra  32.b		; 80 20
	cpy #$4080.w		; C0 80 40
	bpl  32.b		; 10 20
	brk $F8.b		; 00 F8
	tsb $08F2.w		; 0C F2 08
	pea $F803.w		; F4 03 F8
	cpy #$A000.w		; C0 00 A0
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	brk $D8.b		; 00 D8
	brk $8C.b		; 00 8C
	brk $A8.b		; 00 A8
	brk $A3.b		; 00 A3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	ora $06.b		; 05 06
	rol $AF00.w,X		; 3E 00 AF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $10.b		; 05 10
	rol $AF39.w,X		; 3E 39 AF
	lda $000000.l		; AF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	sec		; 38
	rts		; 60

	rts		; 60

	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $F8.b		; 00 F8
	brk $FD.b		; 00 FD
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $42, $BD		; 42 BD
	tsb $EB.b		; 04 EB
	rol $01E9.w		; 2E E9 01
	plx		; FA
	ora ($BF.b,X)		; 01 BF
	php		; 08
	sbc [$1E.b],Y		; F7 1E
	sbc ($09.b,X)		; E1 09
	adc $007F.w,Y		; 79 7F 00
	adc $002F00.l,X		; 7F 00 2F 00
	cmp $9F00.w		; CD 00 9F
	brk $FE.b		; 00 FE
	brk $3F.b		; 00 3F
	brk $09.b		; 00 09
	cop $98.b		; 02 98
	jmp ($E810.w)		; 6C 10 E8
.INDEX 8
	sep #$1C		; E2 1C
	cmp $1862.w,X		; DD 62 18
	cpx $20.b		; E4 20
	cpy #$02.b		; C0 02
	cmp $08.b		; C5 08
	php		; 08
	sbc $00FB00.l,X		; FF 00 FB 00
	plx		; FA
	brk $FD.b		; 00 FD
	brk $9B.b		; 00 9B
	brk $38.b		; 00 38
	brk $DA.b		; 00 DA
	brk $C8.b		; 00 C8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FB.b		; 00 FB
	tsb $F5.b		; 04 F5
	brk $FB.b		; 00 FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFD.l,X		; FF FD FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $03FF.w,X		; FD FF 03
	asl $0000.w		; 0E 00 00
	asl A		; 0A
	bit $04.b,X		; 34 04
	sei		; 78
	jsr $415B.w		; 20 5B 41
	ldx $D738.w,Y		; BE 38 D7
	ora $FB.b		; 05 FB
	lsr $C9.b,X		; 56 C9
	ora $3AE2.w		; 0D E2 3A
	brk $64.b		; 00 64
	brk $2B.b		; 00 2B
	brk $FD.b		; 00 FD
	brk $F6.b		; 00 F6
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $02.b		; 00 02
	jsr ($9960.w,X)		; FC 60 99
	and $003B.w,Y		; 39 3B 00
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $6E.b		; 00 6E
	brk $3D.b		; 00 3D
	brk $FF.b		; 00 FF
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FB.b		; 02 FB
	sbc $FBFFFE.l,X		; FF FE FF FB
	sbc $000E00.l,X		; FF 00 0E 00
	brk $20.b		; 00 20
	cpy #$90.b		; C0 90
	rts		; 60

	rti		; 40

	bcs  16.b		; B0 10
	cpx #$50.b		; E0 50
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $B0.b		; 00 B0
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $F7.b		; 00 F7
	asl A		; 0A
	phx		; DA
	tsb $F9.b		; 04 F9
	sbc $00FFDA.l,X		; FF DA FF 00
	asl $0000.w		; 0E 00 00
	sbc [$FF.b],Y		; F7 FF
	nop		; EA
	sbc $000E02.l,X		; FF 02 0E 00
	brk $07.b		; 00 07
	brk $EA.b		; 00 EA
	sbc $000E04.l,X		; FF 04 0E 00
	brk $F8.b		; 00 F8
	sbc $06FFFA.l,X		; FF FA FF 06
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $FA.b		; 00 FA
	sbc $000E08.l,X		; FF 08 0E 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $03.b		; 06 03
	ora $06.b,S		; 03 06
	ora [$02.b]		; 07 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	ora $001F00.l		; 0F 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	rti		; 40

	brk $60.b		; 00 60
	sty $30CC.w		; 8C CC 30
	sed		; F8
	php		; 08
	sed		; F8
	trb $00FC.w		; 1C FC 00
	beq 122.b		; F0 7A
	ldx $00.b		; A6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $B0.b		; 00 B0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	and $003E3E.l,X		; 3F 3E 3E 00
	ora [$27.b]		; 07 27
	and $0F7C7C.l,X		; 3F 7C 7C 0F
	ora $033F23.l		; 0F 23 3F 03
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $70.b		; 00 70
	stz $C7BC.w		; 9C BC C7
	lda ($CC.b,S),Y		; B3 CC
	ora $87FF.w		; 0D FF 87
	inc $7013.w,X		; FE 13 70
	jsr $8CFE.w		; 20 FE 8C
	sbc ($E0.b),Y		; F1 E0
	brk $38.b		; 00 38
	brk $3F.b		; 00 3F
	brk $32.b		; 00 32
	brk $19.b		; 00 19
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	cpy #$E0.b		; C0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
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
	brk $3F.b		; 00 3F
	and $000707.l,X		; 3F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	pld		; 2B
	sbc $4040FF.l,X		; FF FF 40 40
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	beq -11.b		; F0 F5
	cpy #$00.b		; C0 00
	rti		; 40

	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra -11.b		; 80 F5
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $1F00.w,X		; 3D 00 1F
	asl $3A3F.w		; 0E 3F 3A
	tsa		; 3B
	bpl  31.b		; 10 1F
	ora #$7E7F.w		; 09 7F 7E
	adc $00E1E0.l,X		; 7F E0 E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	dec $F000.w,X		; DE 00 F0
	.db $62, $FE, $3C		; 62 FE 3C
	cpy $F058.w		; CC 58 F0
	ldy $70FC.w		; AC FC 70
	sbc $60DF5F.l,X		; FF 5F DF 60
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $A8.b		; 00 A8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $033F00.l,X		; 1F 00 3F 03
	adc $010F0F.l,X		; 7F 0F 0F 01
	adc $0C3F3F.l,X		; 7F 3F 3F 0C
	cpy $7F7E.w		; CC 7E 7F
	brk $00.b		; 00 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $7E0A00.l,X		; 3F 00 0A 7E
	ora $FC.b,S		; 03 FC
	stx $7FEF.w		; 8E EF 7F
	sbc $32FEF0.l,X		; FF F0 FE 32
	adc $0ABF57.l,X		; 7F 57 BF 0A
	sbc $030034.l,X		; FF 34 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $E8.b		; 00 E8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	beq -64.b		; F0 C0
	cpy #$80.b		; C0 80
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
	brk $03.b		; 00 03
	lda ($00.b,S),Y		; B3 00
	eor $000B00.l,X		; 5F 00 0B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B3.b		; 00 B3
	ldy $5F5F.w,X		; BC 5F 5F
	phd		; 0B
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($00FF.w,X)		; FC FF 00
	tyx		; BB
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $BBBB03.l,X		; FF 03 BB BB
	lsr $46.b		; 46 46
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	ldy #$A0.b		; A0 A0
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
	ora $80.b,S		; 03 80
	tsb $F900.w		; 0C 00 F9
	ora [$E2.b]		; 07 E2
	ora $FA.b,S		; 03 FA
	sbc $00FFE2.l,X		; FF E2 FF 00
	asl $0000.w		; 0E 00 00
	sbc $F2FF.w,Y		; F9 FF F2
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FA.b		; 00 FA
	sbc $040002.l,X		; FF 02 00 04
	asl $0000.w		; 0E 00 00
	tsb $060D.w		; 0C 0D 06
	ora [$0C.b]		; 07 0C
	ora $000300.l		; 0F 00 03 00
	ora $383E01.l,X		; 1F 01 3E 38
	tsa		; 3B
	ora $003F.w,X		; 1D 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	jsr $C0C0.w		; 20 C0 C0
	rts		; 60

	cpx #$00.b		; E0 00
	cpy #$D0.b		; C0 D0
	bcs -16.b		; B0 F0
	bvs -112.b		; 70 90
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc ($1D.b),Y		; F1 1D
	ora $003D3C.l,X		; 1F 3C 3D 00
	adc $1DFF0E.l,X		; 7F 0E FF 1D
	ora $107D7D.l,X		; 1F 7D 7D 10
	sta ($00.b,S),Y		; 93 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $9E.b		; 00 9E
	stx $E000.w		; 8E 00 E0
	rti		; 40

	cpx #$1C.b		; E0 1C
	cpx $7E60.w		; EC 60 7E
	inc $80FE.w,X		; FE FE 80
	inc $FCBC.w,X		; FE BC FC
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	lda $2E00.w,X		; BD 00 2E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $2EBD.w,X		; BD BD 2E
	rol $0000.w		; 2E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	plp		; 28
	plp		; 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $37.b,X		; 34 37
	and ($3F.b,X)		; 21 3F
	ora ($7F.b)		; 12 7F
	cmp ($C3.b,X)		; C1 C3
	ora $1D.b,S		; 03 1D
	ora $F4F7FC.l		; 0F FC F7 F4
	ldy $01FF.w,X		; BC FF 01
	brk $1E.b		; 00 1E
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $33.b		; 00 33
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $E0.b		; 00 E0
	jsr $C040.w		; 20 40 C0
	ldy #$E0.b		; A0 E0
	sei		; 78
	sei		; 78
	brk $C0.b		; 00 C0
	cpy #$78.b		; C0 78
	sec		; 38
	cld		; D8
	rts		; 60

	cld		; D8
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	ldy #$00.b		; A0 00
	sed		; F8
	sbc $013F3F.l,X		; FF 3F 3F 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	and ($07.b),Y		; 31 07
	lda [$7F.b]		; A7 7F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $31.b		; 00 31
	rol $A7.b,X		; 36 A7
	clv		; B8
	pha		; 48
	inc $F8F8.w,X		; FE F8 F8
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C8.b		; C0 C8
	cpx #$FE.b		; E0 FE
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	iny		; C8
	php		; 08
	inc $001E.w,X		; FE 1E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $EA.b		; 05 EA
	cop $FC.b		; 02 FC
	sbc $00FFEA.l,X		; FF EA FF 00
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $02FFFA.l,X		; FF FA FF 02
	asl $0000.w		; 0E 00 00
	bpl  20.b		; 10 14
	ora ($1E.b)		; 12 1E
	ora $0F.b,S		; 03 0F
	brk $3E.b		; 00 3E
	adc $6F.b,S		; 63 6F
	bit $7F.b,X		; 34 7F
	lsr $7E.b		; 46 7E
	and #$00FF.w		; 29 FF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $30.b		; 00 30
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $76.b		; 00 76
	adc [$23.b],Y		; 77 23
	lda $067F7F.l		; AF 7F 7F 06
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	ror $00.b		; 66 00
	tsa		; 3B
	ora ($00.b,X)		; 01 00
	tsb $1C00.w		; 0C 00 1C
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $66.b		; 00 66
	pla		; 68
	tsa		; 3B
	tsa		; 3B
	brk $E0.b		; 00 E0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
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
	cpy #$C0.b		; C0 C0
	sta [$8F.b]		; 87 8F
	asl $FDF3.w,X		; 1E F3 FD
	sbc ($73.b)		; F2 73
	inc $7E68.w,X		; FE 68 7E
	cpx #$EE.b		; E0 EE
	ora ($FE.b,X)		; 01 FE
	adc $00007F.l		; 6F 7F 00 00
	jmp ($0F00.w)		; 6C 00 0F
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $002C.w		; 2C 2C 00
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
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FD.b		; 00 FD
	ora $F1.b,S		; 03 F1
	ora ($FD.b,X)		; 01 FD
	sbc $00FFF1.l,X		; FF F1 FF 00
	asl $0000.w		; 0E 00 00
	sbc $F9FF.w,X		; FD FF F9
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FE.b		; 00 FE
	sbc $020001.l,X		; FF 01 00 02
	asl $0000.w		; 0E 00 00
	trb $14.b		; 14 14
	tsb $081C.w		; 0C 1C 08
	stz $20.b,X		; 74 20
	jmp ($7848.w,X)		; 7C 48 78
	sty $389C.w		; 8C 9C 38
	cpx $F8EC.w		; EC EC F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $04.b		; 00 04
	brk $70.b		; 00 70
	sei		; 78
	tsb $F8.b		; 04 F8
	ror $4C7E.w,X		; 7E 7E 4C
	jmp $107C7C.l		; 5C 7C 7C 10
	bpl  16.b		; 10 10
	bpl  56.b		; 10 38
	rol $0000.w,X		; 3E 00 00
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	rol $0046.w,X		; 3E 46 00
	inx		; E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	inx		; E8
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
	sbc $FF00.w,Y		; F9 00 FF
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	brk $40.b		; 00 40
	rti		; 40

	cpy #$40.b		; C0 40
	rti		; 40

	cpx #$E0.b		; E0 E0
	brk $A0.b		; 00 A0
	cpy #$C0.b		; C0 C0
	rti		; 40

	rti		; 40

	brk $A0.b		; 00 A0
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	ldy #$0E.b		; A0 0E
	bra  56.b		; 80 38
	brk $EB.b		; 00 EB
	ora $B7.b,X		; 15 B7
	asl $F5.b		; 06 F5
	sbc $00FFB7.l,X		; FF B7 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	lda [$FF.b],Y		; B7 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b]		; C7 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp [$FF.b]		; C7 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp [$FF.b]		; C7 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	xba		; EB
	sbc $0AFFD7.l,X		; FF D7 FF 0A
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $0CFFD7.l,X		; FF D7 FF 0C
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $D7.b		; 00 D7
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EB.b		; 00 EB
	sbc $20FFE7.l,X		; FF E7 FF 20
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $22FFE7.l,X		; FF E7 FF 22
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $E7.b		; 00 E7
	sbc $000C24.l,X		; FF 24 0C 00
	brk $EE.b		; 00 EE
	sbc $26FFF7.l,X		; FF F7 FF 26
	tsb $0000.w		; 0C 00 00
	inc $F7FF.w,X		; FE FF F7
	sbc $000C28.l,X		; FF 28 0C 00
	brk $0E.b		; 00 0E
	brk $F7.b		; 00 F7
	sbc $000C2A.l,X		; FF 2A 0C 00
	brk $00.b		; 00 00
	ora $04.b,S		; 03 04
	ora [$04.b]		; 07 04
	ora [$01.b]		; 07 01
	ora ($3F.b,X)		; 01 3F
	adc $0E7F3F.l,X		; 7F 3F 7F 0E
	ror $3E00.w,X		; 7E 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	cmp $FCFFCF.l		; CF CF FF FC
	stx $CF88.w		; 8E 88 CF
	cmp $5FFCFC.l		; CF FC FC 5F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bmi  12.b		; 30 0C
	bmi   0.b		; 30 00
	ora $02.b,S		; 03 02
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $80.b		; 00 80
	brk $78.b		; 00 78
	sei		; 78
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	ora $1F.b,S		; 03 1F
	ora $07071F.l,X		; 1F 1F 07 07
	asl $06.b		; 06 06
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	ora ($F9.b,X)		; 01 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	adc ($9D.b,X)		; 61 9D
	ora $FF.b,S		; 03 FF
	php		; 08
	ora $EEFFE3.l		; 0F E3 FF EE
	bcc  -3.b		; 90 FD
	cmp $F1.b		; C5 F1
	sbc ($BF.b),Y		; F1 BF
	lda $000200.l,X		; BF 00 02 00
	brk $00.b		; 00 00
	beq  34.b		; F0 22
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	asl $400F.w		; 0E 0F 40
	sta ($FF.b,X)		; 81 FF
	ora $F070FF.l,X		; 1F FF 70 F0
	sta [$81.b]		; 87 81
	sbc $FFFFC7.l,X		; FF C7 FF FF
	sbc $C1C1FD.l,X		; FF FD C1 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora ($78.b,X)		; 01 78
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq  48.b		; F0 30
	bmi -64.b		; 30 C0
	rti		; 40

	bra -128.b		; 80 80
	bra   0.b		; 80 00
	cpx #$E0.b		; E0 E0
	cpx $00EC.w		; EC EC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$40.b		; C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	ora [$02.b]		; 07 02
	sbc $06FFFC.l,X		; FF FC FF 06
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $E16666.l,X		; FF 66 66 E1
	sbc ($1F.b,X)		; E1 1F
	sbc $6FFFBF.l,X		; FF BF FF 6F
	jsr ($E7FF.w,X)		; FC FF E7
	adc $000067.l,X		; 7F 67 00 00
	brk $01.b		; 00 01
	ora ($1E.b,X)		; 01 1E
	clc		; 18
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	sbc [$3F.b]		; E7 3F
	and $F1FFF7.l,X		; 3F F7 FF F1
	ora $F37FF0.l,X		; 1F F0 7F F3
	sbc ($FF.b,S),Y		; F3 FF
	sbc $01BFBF.l,X		; FF BF BF 01
	clc		; 18
	sec		; 38
	cpy #$90.b		; C0 90
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $13.b		; 00 13
	tsb $0001.w		; 0C 01 00
	ora ($40.b,X)		; 01 40
	sta $C0CF91.l,X		; 9F 91 CF C0
	sbc $FFFFFE.l,X		; FF FE FF FF
	adc $FE0CFF.l,X		; 7F FF 0C FE
	sbc [$8B.b],Y		; F7 8B
	lda $0080DB.l,X		; BF DB 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	brk $01.b		; 00 01
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sbc [$E7.b]		; E7 E7
	xce		; FB
	phk		; 4B
	inc $46.b,X		; F6 46
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $80BF41.l,X		; 7F 41 BF 80
	sbc [$F4.b],Y		; F7 F4
	brk $18.b		; 00 18
	php		; 08
	tsb $06.b		; 04 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $03.b,S		; 03 03
	brk $3C.b		; 00 3C
	beq  -1.b		; F0 FF
	sbc $203BFF.l,X		; FF FF 3B 20
	adc $7C7F7F.l,X		; 7F 7F 7F 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $E28FEF.l		; 0F EF 8F E2
	adc $FF7FFF.l,X		; 7F FF 7F FF
	cli		; 58
	clc		; 18
	sbc $89EF0F.l,X		; FF 0F EF 89
	cmp $100C0E.l		; CF 0E 0C 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A7.b		; 00 A7
	ora [$00.b]		; 07 00
	php		; 08
	bpl  12.b		; 10 0C
	bmi -32.b		; 30 E0
	brk $18.b		; 00 18
	clc		; 18
	sed		; F8
	sed		; F8
	cpx #$E0.b		; E0 E0
	ror $FE7E.w,X		; 7E 7E FE
	inc $DCFC.w,X		; FE FC DC
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	rts		; 60

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
	brk $C7.b		; 00 C7
	cmp [$FF.b]		; C7 FF
	sbc $797F7F.l,X		; FF 7F 7F 79
	adc $001F01.l,X		; 7F 01 1F 00
	brk $0F.b		; 00 0F
	ora $067F7F.l		; 0F 7F 7F 06
	sec		; 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00100E.l,X		; 1F 0E 10 00
	brk $FC.b		; 00 FC
	beq  -4.b		; F0 FC
	cpx $F8.b		; E4 F8
	bne -28.b		; D0 E4
	sty $E0.b		; 84 E0
	cpx #$7E.b		; E0 7E
	ror $B4B4.w,X		; 7E B4 B4
	sbc $40FD.w,X		; FD FD 40
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $04817E.l,X		; 1F 7E 81 04
	ora $04.b,S		; 03 04
	cop $CE.b		; 02 CE
	dec $7F7F.w		; CE 7F 7F
	sbc $E3FFF0.l,X		; FF F0 FF E3
	ora $F3F30F.l		; 0F 0F F3 F3
	sbc $EFFFFF.l,X		; FF FF FF EF
	brk $31.b		; 00 31
	eor ($80.b,X)		; 41 80
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	brk $F0.b		; 00 F0
	beq  12.b		; F0 0C
	cmp $00.b,S		; C3 00
	rti		; 40

	brk $7C.b		; 00 7C
	jmp ($F8F8.w,X)		; 7C F8 F8
	beq   0.b		; F0 00
	beq -128.b		; F0 80
	jsr ($FFFC.w,X)		; FC FC FF
	jsr ($989F.w,X)		; FC 9F 98
	sbc $8000F9.l,X		; FF F9 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  96.b		; 80 60
	rts		; 60

	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($03.b,X)		; 01 03
	ora $0F.b,S		; 03 0F
	ora $007F1C.l		; 0F 1C 7F 00
	sbc $003F01.l,X		; FF 01 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	and [$FD.b],Y		; 37 FD
	inc $FCF3.w,X		; FE F3 FC
	sbc [$F8.b]		; E7 F8
	ror $FD80.w,X		; 7E 80 FD
	ora ($C0.b,X)		; 01 C0
	brk $8F.b		; 00 8F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $7C7007.l		; 0F 07 70 7C
	adc ($31.b,S),Y		; 73 31
	sbc $DB7F80.l		; EF 80 7F DB
	sbc ($81.b,S),Y		; F3 81
	sbc $DD01.w,Y		; F9 01 DD
	and $3D.b,X		; 35 3D
	sbc ($F1.b),Y		; F1 F1
	bpl -128.b		; 10 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($06.b,X)		; 01 06
	ora ($22.b,X)		; 01 22
	and $C2.b,X		; 35 C2
	sta ($0E.b),Y		; 91 0E
	adc $E7FFE8.l,X		; 7F E8 FF E7
	inc $7FF0.w,X		; FE F0 7F
	sed		; F8
	sbc $FF1FFE.l,X		; FF FE 1F FF
	dec $FF.b		; C6 FF
	cpy #$DE.b		; C0 DE
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	beq  -1.b		; F0 FF
	sbc $00DFDF.l,X		; FF DF DF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	tsb $07.b		; 04 07
	tsb $67.b		; 04 67
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	sbc $FF34FF.l,X		; FF FF 34 FF
	and $7F3D.w,X		; 3D 3D 7F
	adc $C19F9C.l,X		; 7F 9C 9F C1
	inc $EC12.w,X		; FE 12 EC
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	.db $42, $80		; 42 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $7B21F0.l		; 0F F0 21 7B
	ora ($FD.b,X)		; 01 FD
	eor $F8FD.w		; 4D FD F8
	inc $C363.w,X		; FE 63 C3
	cmp $03.b,S		; C3 03
	ora ($11.b),Y		; 11 11
	sbc ($F1.b),Y		; F1 F1
	ora ($04.b,X)		; 01 04
	ora ($02.b,X)		; 01 02
	eor $3802.w		; 4D 02 38
	ora ($03.b,X)		; 01 03
	trb $3C03.w		; 1C 03 3C
	ora ($EE.b),Y		; 11 EE
	sbc ($0E.b),Y		; F1 0E
	sbc $FFF9.w,Y		; F9 F9 FF
	sbc $53FFFF.l,X		; FF FF FF 53
	lsr $F887.w,X		; 5E 87 F8
	ora $D0FFFB.l		; 0F FB FF D0
	sbc $0081C9.l,X		; FF C9 81 00
	sta [$00.b]		; 87 00
	sed		; F8
	brk $40.b		; 00 40
	bra -128.b		; 80 80
	brk $0B.b		; 00 0B
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $1F.b		; 00 1F
	sta $7CF3F3.l,X		; 9F F3 F3 7C
	cpx #$F8.b		; E0 F8
	php		; 08
	sed		; F8
	php		; 08
	cmp ($C1.b,X)		; C1 C1
	rol $803E.w,X		; 3E 3E 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($0E.b,X)		; 01 0E
	asl $0E0E.w		; 0E 0E 0E
	asl $0E0E.w		; 0E 0E 0E
	asl $0E0E.w		; 0E 0E 0E
	asl $0E0E.w		; 0E 0E 0E
	asl $1E1E.w		; 0E 1E 1E
	asl $0EF0.w		; 0E F0 0E
	beq  14.b		; F0 0E
	beq  14.b		; F0 0E
	beq  14.b		; F0 0E
	beq  14.b		; F0 0E
	beq  14.b		; F0 0E
	beq  30.b		; F0 1E
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
	and $031F0C.l,X		; 3F 0C 1F 03
	ora $000101.l		; 0F 01 01 00
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
	brk $FF.b		; 00 FF
	sbc $7FFCFF.l,X		; FF FF FC 7F
	inc $F5FA.w,X		; FE FA F5
	ora ($1F.b,X)		; 01 1F
	ora [$7F.b]		; 07 7F
	trb $00FC.w		; 1C FC 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	jsr $03E3.w		; 20 E3 03
	eor ($C3.b,S),Y		; 53 C3
	ora ($81.b,X)		; 01 81
	sta ($81.b,X)		; 81 81
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	jsr $030F.w		; 20 0F 03
	trb $2C03.w		; 1C 03 2C
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	and $C1C107.l,X		; 3F 07 C1 C1
	jsr ($FFFC.w,X)		; FC FC FF
	beq -25.b		; F0 E7
	inc $F1.b		; E6 F1
	sbc ($F8.b),Y		; F1 F8
	sed		; F8
	cld		; D8
	cld		; D8
	brk $C0.b		; 00 C0
	cpy #$3C.b		; C0 3C
	jsr ($C003.w,X)		; FC 03 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
	cpx #$0F.b		; E0 0F
	ora $00FE.w		; 0D FE 00
	inc $F80E.w,X		; FE 0E F8
	cpy #$60.b		; C0 60
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	tsb $00F0.w		; 0C F0 00
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
	brk $07.b		; 00 07
	ora [$BB.b]		; 07 BB
	tyx		; BB
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $BB.b		; 00 BB
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $DFDF7F.l,X		; 7F 7F DF DF
	sbc $E1E1FF.l,X		; FF FF E1 E1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	adc $DF0000.l,X		; 7F 00 00 DF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	asl $1E1E.w,X		; 1E 1E 1E
	asl $1E1E.w,X		; 1E 1E 1E
	ora $DFDF1F.l,X		; 1F 1F DF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ror $1E7E.w,X		; 7E 7E 1E
	cpx #$1E.b		; E0 1E
	cpx #$1E.b		; E0 1E
	cpx #$1F.b		; E0 1F
	cpx #$DF.b		; E0 DF
	jsr $C738.w		; 20 38 C7
	clc		; 18
	sbc [$08.b]		; E7 08
	ror $00.b,X		; 76 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -12.b		; 80 F4
	pea $FDFD.w		; F4 FD FD
	sbc $7575EF.l		; EF EF 75 75
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   4.b		; F0 04
	brk $FD.b		; 00 FD
	brk $EF.b		; 00 EF
	brk $75.b		; 00 75
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
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
	ora #$2480.w		; 09 80 24
	brk $F0.b		; 00 F0
	ora ($C6.b),Y		; 11 C6
	ora $F0.b		; 05 F0
	sbc $00FFC6.l,X		; FF C6 FF 00
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	dec $FF.b,X		; D6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	inc $FF.b		; E6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	inc $FF.b,X		; F6 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $FF.b		; E6 FF
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $10.b		; 00 10
	brk $E2.b		; 00 E2
	sbc $000C20.l,X		; FF 20 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	trb $1E12.w		; 1C 12 1E
	ora [$07.b]		; 07 07
	ror $1BFE.w,X		; 7E FE 1B
	xce		; FB
	brk $79.b		; 00 79
	brk $3F.b		; 00 3F
	asl $000F.w		; 0E 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $070C0C.l		; 0F 0C 0C 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($1E.b,X)		; 01 1E
	bmi  28.b		; 30 1C
	jsr ($2F2F.w,X)		; FC 2F 2F
	inc $FEFC.w,X		; FE FC FE
	pea $E038.w		; F4 38 E0
	sec		; 38
	sed		; F8
	ora $01001F.l,X		; 1F 1F 00 01
	brk $03.b		; 00 03
	ora $D0.b,S		; 03 D0
	bne   1.b		; D0 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	ora $0303E0.l,X		; 1F E0 03 03
	ora [$07.b]		; 07 07
	ora $1E1D0F.l		; 0F 0F 1D 1E
	cop $FC.b		; 02 FC
	asl $7C.b		; 06 7C
	ora $EF.b,S		; 03 EF
	ora ($CF.b,X)		; 01 CF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($EF.b)		; F2 EF
	tya		; 98
	sbc [$3D.b]		; E7 3D
	dec $0FE8.w		; CE E8 0F
	cop $03.b		; 02 03
	ror $F27E.w,X		; 7E 7E F2
	sbc [$A0.b],Y		; F7 A0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	jmp ($8138.w,X)		; 7C 38 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -16.b		; 30 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	trb $7C1C.w		; 1C 1C 7C
	bvs  -8.b		; 70 F8
	cpx #$67.b		; E0 67
	eor [$EF.b]		; 47 EF
	sbc $7CFEFE.l		; EF FE FE 7C
	bvs 115.b		; 70 73
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	brk $60.b		; 00 60
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
	brk $FF.b		; 00 FF
	inc $FFFF.w,X		; FE FF FF
	sbc $E3.b,S		; E3 E3
	jmp ($7F6C.w)		; 6C 6C 7F
	bvs 127.b		; 70 7F
	adc $0F.b,S		; 63 0F
	ora $207373.l		; 0F 73 73 20
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sta ($60.b,S),Y		; 93 60
	bra  96.b		; 80 60
	bra   0.b		; 80 00
	beq 112.b		; F0 70
	sty $0000.w		; 8C 00 00
	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	beq -16.b		; F0 F0
	jsr ($00F0.w,X)		; FC F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	xce		; FB
	ora $7C7FFC.l,X		; 1F FC 7F 7C
	and $BFB33F.l,X		; 3F 3F B3 BF
	bmi  55.b		; 30 37
	bit $3F7C.w,X		; 3C 7C 3F
	lda $000010.l,X		; BF 10 00 00
	brk $00.b		; 00 00
	bra  48.b		; 80 30
	cpy #$B0.b		; C0 B0
	rti		; 40

	bmi -64.b		; 30 C0
	jsr $2380.w		; 20 80 23
	rti		; 40

	jsr ($7C80.w,X)		; FC 80 7C
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $7E.b		; 00 7E
	inc $5F5F.w,X		; FE 5F 5F
	sta $F2F2DF.l,X		; 9F DF F2 F2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bit $3C3C.w,X		; 3C 3C 3C
	bit $3434.w,X		; 3C 34 34
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	sed		; F8
	cpy #$20.b		; C0 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc $6FFCFC.l,X		; FF FC FC 6F
	rti		; 40

	sbc $E618FE.l,X		; FF FE 18 E6
	adc ($FF.b,X)		; 61 FF
.ACCU 8
	sep #$E3		; E2 E3
	sbc $00FF.w,Y		; F9 FF 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	bpl   4.b		; 10 04
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	trb $0029.w		; 1C 29 00
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora ($01.b,X)		; 01 01
	ora $FFF31F.l,X		; 1F 1F F3 FF
	ora $1F1F.w,Y		; 19 1F 1F
	ora $001D1D.l,X		; 1F 1D 1D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	and $23.b,S		; 23 23
	asl $FE1F.w,X		; 1E 1F FE
	sbc [$7E.b],Y		; F7 7E
	inc $3FFF.w		; EE FF 3F
	xce		; FB
	tsa		; 3B
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora $1C.b,S		; 03 1C
	clc		; 18
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	tsb $01.b		; 04 01
	ora ($06.b,X)		; 01 06
	asl $12.b		; 06 12
	ora $03DF10.l,X		; 1F 10 DF 03
	adc $0D3F13.l,X		; 7F 13 3F 0D
	ora $000707.l,X		; 1F 07 07 00
	asl $06.b		; 06 06
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCE6FF.l,X		; FF FF E6 FC
	trb $80E0.w		; 1C E0 80
	rts		; 60

	inc $FEF2.w,X		; FE F2 FE
	cpx #$F4.b		; E0 F4
	cpx $B8C0.w		; EC C0 B8
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	.db $82, $01, $00		; 82 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $3D.b,S		; 03 3D
	and $0000.w,X		; 3D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $3D.b		; 00 3D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $DFDF7F.l,X		; 7F 7F DF DF
	sbc $E3E3FF.l,X		; FF FF E3 E3
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	adc $DF0000.l,X		; 7F 00 00 DF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	jsr ($C7FC.w,X)		; FC FC C7
	cmp [$FF.b]		; C7 FF
	adc $C35F7F.l,X		; 7F 7F 5F C3
	sbc $30FF9F.l,X		; FF 9F FF 30
	beq -57.b		; F0 C7
	rep #$00		; C2 00
	ora $04.b,S		; 03 04
	sec		; 38
	sec		; 38
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003802.l		; 0F 02 38 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	cpy #$40.b		; C0 40
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	sbc $E4E7EF.l,X		; FF EF E7 E4
	sbc ($F0.b,S),Y		; F3 F0
	sbc $FF1FFF.l,X		; FF FF 1F FF
	.db $62, $7F, $FF		; 62 7F FF
	sbc ($EF.b,X)		; E1 EF
	sbc $20.b,X		; F5 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $60.b		; 00 60
	bra  32.b		; 80 20
	brk $20.b		; 00 20
	brk $FE.b		; 00 FE
	inc $E6.b		; E6 E6
	inc $FA.b		; E6 FA
	asl A		; 0A
	pea $FF04.w		; F4 04 FF
	sbc $FF023F.l,X		; FF 3F 02 FF
	cpy #$F7.b		; C0 F7
	pea $00C0.w		; F4 C0 00
	brk $18.b		; 00 18
	php		; 08
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	php		; 08
	ora $D7.b,X		; 15 D7
	adc $7C.b,S		; 63 7C
	adc $7D.b,S		; 63 7D
	and $030F34.l,X		; 3F 34 0F 03
	bvs 112.b		; 70 70
	ror $3F7E.w,X		; 7E 7E 3F
	bit $2010.w,X		; 3C 10 20
	rts		; 60

	bra  97.b		; 80 61
	bra  48.b		; 80 30
	cpy #$00.b		; C0 00
	beq 112.b		; F0 70
	stx $817E.w		; 8E 7E 81
	bmi -64.b		; 30 C0
	sed		; F8
	php		; 08
	sed		; F8
	php		; 08
	cmp $C3.b,S		; C3 C3
	ldy $C03C.w,X		; BC 3C C0
	cpy #$E0.b		; C0 E0
	cpx #$0F.b		; E0 0F
	asl $00FC.w		; 0E FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00.b,S		; C3 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	trb $F00C.w		; 1C 0C F0
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	adc $FFFF7F.l,X		; 7F 7F FF FF
	inc $F3FE.w,X		; FE FE F3
	sbc ($70.b,S),Y		; F3 70
	bra 112.b		; 80 70
	bra 112.b		; 80 70
	bra 112.b		; 80 70
	bra 127.b		; 80 7F
	bra -32.b		; 80 E0
	ora $209E60.l,X		; 1F 60 9E 20
	cmp ($00.b,S),Y		; D3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	pea $E0F4.w		; F4 F4 E0
	cpx #$70.b		; E0 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $F4.b		; 00 F4
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	cpy #$C0.b		; C0 C0
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F4.b		; 00 F4
	tsb $04D5.w		; 0C D5 04
	sbc [$FF.b],Y		; F7 FF
	cmp $FF.b,X		; D5 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cmp $FF.b,X		; D5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	pea $E5FF.w		; F4 FF E5
	sbc $000C04.l,X		; FF 04 0C 00
	brk $04.b		; 00 04
	brk $E5.b		; 00 E5
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F4.b		; 00 F4
	sbc $08FFF5.l,X		; FF F5 FF 08
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	sbc $FF.b,X		; F5 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	tsb $06.b		; 04 06
	ora $03.b,S		; 03 03
	ora $1D051F.l		; 0F 1F 05 1D
	brk $0F.b		; 00 0F
	ora $03.b,S		; 03 03
	sec		; 38
	and $00000B.l,X		; 3F 0B 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $18.b		; 04 18
	clc		; 18
	beq -32.b		; F0 E0
	ror $EE4E.w		; 6E 4E EE
	inc $F078.w		; EE 78 F0
	ror $86.b,X		; 76 86
	sed		; F8
	sed		; F8
	sbc $00007F.l,X		; FF 7F 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra   0.b		; 80 00
	bpl  96.b		; 10 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $30.b		; 06 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora [$00.b]		; 07 00
	brk $0F.b		; 00 0F
	ora $3C0505.l		; 0F 05 05 3C
	bit $FFEF.w,X		; 3C EF FF
	and $35373D.l,X		; 3F 3D 37 35
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	sta ($FE.b,X)		; 81 FE
	inc $EDEF.w,X		; FE EF ED
	rol $EF3E.w,X		; 3E 3E EF
	sbc $FFFFE3.l,X		; FF E3 FF FF
	jsr ($BFBD.w,X)		; FC BD BF
	brk $7E.b		; 00 7E
	inc $0401.w,X		; FE 01 04
	bpl  48.b		; 10 30
	cpy #$80.b		; C0 80
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	rti		; 40

	sed		; F8
	sed		; F8
	jsr ($FEF8.w,X)		; FC F8 FE
	inc $FA.b,X		; F6 FA
	cop $FC.b		; 02 FC
	cpy $FF.b		; C4 FF
	sbc $FE60FF.l,X		; FF FF 60 FE
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $22.b		; 00 22
	lda $7F0F.w,X		; BD 0F 7F
	ora [$3F.b],Y		; 17 3F
	asl $010F.w		; 0E 0F 01
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$E1.b]		; 07 E1
	ldy #$CF.b		; A0 CF
	eor $878707.l		; 4F 07 87 87
	sta [$07.b]		; 87 07
	ora [$06.b]		; 07 06
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	sed		; F8
	jsr $0F1E.w		; 20 1E 0F
	bmi   6.b		; 30 06
	sec		; 38
	asl $38.b		; 06 38
	asl $38.b		; 06 38
	asl $38.b		; 06 38
	asl $38.b		; 06 38
	jmp.w [$E01C]		; DC 1C E0
	cpx #$86.b		; E0 86
	stx $FC.b		; 86 FC
	brk $38.b		; 00 38
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0000.w		; 1C 00 00
	brk $84.b		; 00 84
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
	ora $3B041F.l,X		; 1F 1F 04 3B
	and $1C39.w,Y		; 39 39 1C
	ora $0B0C07.l,X		; 1F 07 0C 0B
	xba		; EB
	sta $7E7F9E.l,X		; 9F 9E 7F 7E
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	php		; 08
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	trb $14.b		; 14 14
	rts		; 60

	brk $00.b		; 00 00
	inc $475E.w,X		; FE 5E 47
	adc $CEF131.l,X		; 7F 31 F1 CE
	cpy $7E.b		; C4 7E
	jmp ($E7E7.w,X)		; 7C E7 E7
	adc #$69.b		; 69 69
	adc $004070.l,X		; 7F 70 40 00
	brk $80.b		; 00 80
	brk $0E.b		; 00 0E
	sty $30.b		; 84 30
	jsr $8080.w		; 20 80 80
	brk $00.b		; 00 00
	stx $60.b,Y		; 96 60
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $371E1D.l		; 0F 1D 1E 37
	sec		; 38
	php		; 08
	beq  15.b		; F0 0F
	cmp $079F07.l,X		; DF 07 9F 07
	ora [$28.b]		; 07 28
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	lda [$7E.b]		; A7 7E
	cmp $77076F.l,X		; DF 6F 07 77
	rol $37.b		; 26 37
	lda [$FF.b]		; A7 FF
	ora [$F7.b]		; 07 F7
	sbc ($FB.b,S),Y		; F3 FB
	cpy $020F.w		; CC 0F 02
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	php		; 08
	rol $C8.b		; 26 C8
	tsb $00.b		; 04 00
	tsb $08.b		; 04 08
	and ($04.b)		; 32 04
	tsb $FC30.w		; 0C 30 FC
	cpy #$F0.b		; C0 F0
	brk $F0.b		; 00 F0
	cpy #$FE.b		; C0 FE
	inc $2F0F.w,X		; FE 0F 2F
	plx		; FA
	plx		; FA
	sei		; 78
	cpy #$E2.b		; C0 E2
	.db $62, $00, $00		; 62 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	.db $62, $00, $00		; 62 00 00
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
	brk $0D.b		; 00 0D
	ora $0303.w		; 0D 03 03
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($0C.b,X)		; 01 0C
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	asl $0E0E.w		; 0E 0E 0E
	asl $0E0E.w		; 0E 0E 0E
	sbc $FFFFFF.l,X		; FF FF FF FF
	rol $063E.w,X		; 3E 3E 06
	sec		; 38
	asl $38.b		; 06 38
	asl $0E30.w		; 0E 30 0E
	bmi  14.b		; 30 0E
	bvs  -1.b		; 70 FF
	brk $0C.b		; 00 0C
	sbc ($04.b,S),Y		; F3 04
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	bcs -80.b		; B0 B0
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$20.b		; C0 20
	brk $B0.b		; 00 B0
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
	ora $80.b,S		; 03 80
	tsb $F800.w		; 0C 00 F8
	php		; 08
	sbc $02.b,S		; E3 02
	sbc $E3FF.w,Y		; F9 FF E3
	sbc $000C00.l,X		; FF 00 0C 00
	brk $F8.b		; 00 F8
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F3.b		; 00 F3
	sbc $000C04.l,X		; FF 04 0C 00
	brk $09.b		; 00 09
	ora $1D1D.w		; 0D 1D 1D
	ora ($1B.b,X)		; 01 1B
	ora $06.b		; 05 06
	and $1F3D.w,X		; 3D 3D 1F
	ora $3F12.w,X		; 1D 12 3F
	tas		; 1B
	ora $010000.l,X		; 1F 00 00 01
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	cop $05.b		; 02 05
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $C0.b		; 00 C0
	bra  96.b		; 80 60
	rts		; 60

	cpy #$C0.b		; C0 C0
	ldy #$20.b		; A0 20
	bvs 112.b		; 70 70
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  52.b		; 80 34
	tsa		; 3B
	sei		; 78
	adc $2E.b,S		; 63 2E
	inc $BF10.w		; EE 10 BF
	rol A		; 2A
	rol $F840.w		; 2E 40 F8
	lsr $3878.w,X		; 5E 78 38
	bit $00.b,X		; 34 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($00.b),Y		; 11 00
	brk $20.b		; 00 20
	eor ($00.b,X)		; 41 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	ora ($7E.b,X)		; 01 7E
	cpx #$78.b		; E0 78
	bvs  79.b		; 70 4F
	adc $9C7C7C.l,X		; 7F 7C 7C 9C
	cpx #$76.b		; E0 76
	ror $C8.b		; 66 C8
	iny		; C8
	ror $0060.w,X		; 7E 60 00
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  16.b		; 80 10
	bra -128.b		; 80 80
	brk $46.b		; 00 46
	bra -64.b		; 80 C0
	rol $40.b		; 26 40
	bra   0.b		; 80 00
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
	brk $0D.b		; 00 0D
	and $5D5D.w,X		; 3D 5D 5D
	adc #$71.b		; 69 71
	ora $7D7D0F.l		; 0F 0F 7D 7D
	sbc $BDEF.w		; ED EF BD
	sbc $FB.b,X		; F5 FB
	xba		; EB
	brk $02.b		; 00 02
	clc		; 18
	jsl $0F0201.l		; 22 01 02 0F
	bmi   0.b		; 30 00
	cop $08.b		; 02 08
	bpl -127.b		; 10 81
	cop $00.b		; 02 00
	tsb $F0.b		; 04 F0
	beq  88.b		; F0 58
	cli		; 58
	beq  32.b		; F0 20
	ldy $74B8.w,X		; BC B8 74
	mvn $E4,$FC		; 54 FC E4
	ora $FC7EE1.l		; 0F E1 7E FC
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $08.b		; 00 08
	tsb $00.b		; 04 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	php		; 08
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $09097F.l,X		; 7F 7F 09 09
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	brk $09.b		; 00 09
	rts		; 60

	rts		; 60

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	inc $DCFE.w,X		; FE FE DC
	jmp.w [$8040]		; DC 40 80
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	ror $DC00.w,X		; 7E 00 DC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	jsr ($F202.w,X)		; FC 02 F2
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $20.b		; 00 20
	jsr $0000.w		; 20 00 00
	bit $342C.w		; 2C 2C 34
	bit $2C.b,X		; 34 2C
	bit $2426.w		; 2C 26 24
	inc $FEFA.w,X		; FE FA FE
	inc $00.b,X		; F6 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   4.b		; 10 04
	php		; 08
	jsr $2050.w		; 20 50 20
	cli		; 58
	jsl $000000.l		; 22 00 00 00
	cpy $4C88.w		; CC 88 4C
	jmp ($C28E.w,X)		; 7C 8E C2
	lsr $0068.w		; 4E 68 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   0.b		; 10 00
	bpl   4.b		; 10 04
	brk $02.b		; 00 02
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl  10.b		; 10 0A
	bra  40.b		; 80 28
	brk $ED.b		; 00 ED
	ora ($C7.b),Y		; 11 C7
	ora [$EF.b]		; 07 EF
	sbc $00FFC7.l,X		; FF C7 FF 00
	asl $0000.w		; 0E 00 00
	sbc $FFC7FF.l,X		; FF FF C7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $D7FF.w		; ED FF D7
	sbc $000E04.l,X		; FF 04 0E 00
	brk $FD.b		; 00 FD
	sbc $06FFD7.l,X		; FF D7 FF 06
	asl $0000.w		; 0E 00 00
	ora $D700.w		; 0D 00 D7
	sbc $000E08.l,X		; FF 08 0E 00
	brk $F1.b		; 00 F1
	sbc $0AFFE7.l,X		; FF E7 FF 0A
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sbc [$FF.b]		; E7 FF
	tsb $000E.w		; 0C 0E 00
	brk $F6.b		; 00 F6
	sbc $0EFFF7.l,X		; FF F7 FF 0E
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	sbc [$FF.b],Y		; F7 FF
	jsr $000E.w		; 20 0E 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $22.b		; 00 22
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora ($0E.b,X)		; 01 0E
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $D0.b		; 00 D0
	asl $FF.b		; 06 FF
	tsb $04F3.w		; 0C F3 04
	xce		; FB
	cop $FC.b		; 02 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $D0.b		; 00 D0
	ora ($F8.b,X)		; 01 F8
	ora $F00FF0.l		; 0F F0 0F F0
	.db $42, $BD		; 42 BD
	adc $9C.b,S		; 63 9C
	trb $1F00.w		; 1C 00 1F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	cpx #$1E.b		; E0 1E
	cpx #$0E.b		; E0 0E
	rts		; 60

	adc $7100.w		; 6D 00 71
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $9E.b		; 00 9E
	rts		; 60

	asl $6DF0.w		; 0E F0 6D
	sta ($71.b)		; 92 71
	txa		; 8A
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $EC.b		; 00 EC
	rti		; 40

	clc		; 18
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $AC.b		; 00 AC
	brk $18.b		; 00 18
	brk $F0.b		; 00 F0
	brk $01.b		; 00 01
	asl $9CA2.w,X		; 1E A2 9C
	ldy #$9F.b		; A0 9F
	bvs 127.b		; 70 7F
	adc ($6F.b,X)		; 61 6F
	cmp [$FF.b]		; C7 FF
	jmp.w [$78FF]		; DC FF 78
	tda		; 7B
	ora ($0E.b),Y		; 11 0E
	and ($0D.b)		; 32 0D
	and ($0C.b,S),Y		; 33 0C
	ora $000E00.l		; 0F 00 0E 00
	sec		; 38
	brk $23.b		; 00 23
	brk $03.b		; 00 03
	brk $D7.b		; 00 D7
	tsb $C1.b		; 04 C1
	brk $41.b		; 00 41
	bra   0.b		; 80 00
	bra -125.b		; 80 83
	sta $81.b,S		; 83 81
	bra   0.b		; 80 00
	brk $06.b		; 00 06
	asl $D3.b		; 06 D3
	php		; 08
	cmp $18.b,S		; C3 18
	cmp $10EF00.l		; CF 00 EF 10
	bvs  12.b		; 70 0C
	and [$48.b],Y		; 37 48
	dec $09.b		; C6 09
	cpy #$29.b		; C0 29
	tay		; A8
	brk $A4.b		; 00 A4
	jsr $00CE.w		; 20 CE 00
	ldy $F00B.w		; AC 0B F0
	ora $8817E0.l		; 0F E0 17 88
	adc $BFCF30.l,X		; 7F 30 CF BF
	rti		; 40

	sta $00FE40.l,X		; 9F 40 FE 00
	pea $F003.w		; F4 03 F0
	ora $F007F8.l		; 0F F8 07 F0
	ora [$FC.b]		; 07 FC
	ora $07.b,S		; 03 07
	ora [$2F.b]		; 07 2F
	and $686F68.l		; 2F 68 6F 68
	adc $07FF00.l		; 6F 00 FF 07
	xce		; FB
	ora [$E7.b]		; 07 E7
	tsb $E4.b		; 04 E4
	cpy #$08.b		; C0 08
	cpy #$10.b		; C0 10
	asl $91.b		; 06 91
	ora [$90.b]		; 07 90
	cmp $F00E20.l,X		; DF 20 0E F0
	eor $E01FA0.l,X		; 5F A0 1F E0
	bra -128.b		; 80 80
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpx #$60.b		; E0 60
	sei		; 78
	sei		; 78
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	bvs -128.b		; 70 80
	brk $C0.b		; 00 C0
	rts		; 60

	bra  32.b		; 80 20
	brk $80.b		; 00 80
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
	brk $E2.b		; 00 E2
	cpy #$E7.b		; C0 E7
	cpx #$33.b		; E0 33
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	brk $1F.b		; 00 1F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	and ($C0.b),Y		; 31 C0
	and ($D3.b),Y		; 31 D3
	bpl -39.b		; 10 D9
	ora $05C5.w,Y		; 19 C5 05
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	cpy $04.b		; C4 04
	and $00FF40.l,X		; 3F 40 FF 00
	cmp $20DF00.l,X		; DF 00 DF 20
	cmp $08.b		; C5 08
	tsb $09.b		; 04 09
	tsb $09.b		; 04 09
	cpy $09.b		; C4 09
	adc $7BC0.w,Y		; 79 C0 7B
	cpx #$FF.b		; E0 FF
	rts		; 60

	sbc $E5E0.w		; ED E0 E5
	sed		; F8
	sbc [$F8.b]		; E7 F8
	sbc $C0CCE0.l,X		; FF E0 CC C0
	sbc $FB06.w,Y		; F9 06 FB
	brk $FF.b		; 00 FF
	brk $ED.b		; 00 ED
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $CC.b		; 00 CC
	bpl   0.b		; 10 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0306.w		; 0E 06 03
	ora $01.b,S		; 03 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($C8.b,X)		; 01 C8
	iny		; C8
	inx		; E8
	inx		; E8
	inx		; E8
	inx		; E8
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	iny		; C8
	bpl -24.b		; 10 E8
	bpl -24.b		; 10 E8
	bpl 104.b		; 10 68
	bcc 104.b		; 90 68
	bcc 104.b		; 90 68
	bcc 104.b		; 90 68
	bcc 104.b		; 90 68
	bcc   0.b		; 90 00
	adc $007D00.l,X		; 7F 00 7D 00
	ora $00.b,S		; 03 00
	ora $7B.b,S		; 03 7B
	brk $79.b		; 00 79
	brk $15.b		; 00 15
	inx		; E8
	cop $FC.b		; 02 FC
	asl $79.b		; 06 79
	tsb $79.b		; 04 79
	ora $04.b,S		; 03 04
	ora $00.b,S		; 03 00
	tda		; 7B
	brk $79.b		; 00 79
	cop $95.b		; 02 95
	pla		; 68
	.db $82, $7C, $08		; 82 7C 08
	lda [$00.b],Y		; B7 00
	sbc $86EF10.l		; EF 10 EF 86
	sei		; 78
	cpy #$1E.b		; C0 1E
	sta ($0E.b),Y		; 91 0E
	cmp $00FD06.l,X		; DF 06 FD 00
	sec		; 38
	sta [$68.b]		; 87 68
	sta [$F8.b]		; 87 F8
	ora [$E6.b]		; 07 E6
	ora $39C6.w,Y		; 19 C6 39
	sta $20D920.l,X		; 9F 20 D9 20
	sbc $7F02.w,X		; FD 02 7F
	sta $318E7F.l		; 8F 7F 8E 31
	asl $30.b		; 06 30
	ora [$70.b]		; 07 70
	ora $F75CF3.l		; 0F F3 5C F7
	mvn $04,$F4		; 54 F4 04
	beq   0.b		; F0 00
	sbc ($00.b),Y		; F1 00
	and [$80.b],Y		; 37 80
	and [$88.b],Y		; 37 88
	adc $00AF00.l,X		; 7F 00 AF 00
	lda $08.b,S		; A3 08
	sbc ($08.b,S),Y		; F3 08
	bit $38C0.w,X		; 3C C0 38
	cpy #$FC.b		; C0 FC
	tsb $CE.b		; 04 CE
	cop $CC.b		; 02 CC
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $3C.b		; 00 3C
	cpy #$38.b		; C0 38
	cpy #$F8.b		; C0 F8
	brk $CC.b		; 00 CC
	jsr $20CC.w		; 20 CC 20
	cpx #$02.b		; E0 02
	cpx #$04.b		; E0 04
	cpy #$38.b		; C0 38
	jmp ($0C7C.w,X)		; 7C 7C 0C
	tsb $0000.w		; 0C 00 00
	asl $0E01.w		; 0E 01 0E
	ora ($1E.b,X)		; 01 1E
	brk $7F.b		; 00 7F
	brk $67.b		; 00 67
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($1E.b,X)		; 01 1E
	ora ($7F.b,X)		; 01 7F
	brk $67.b		; 00 67
	brk $03.b		; 00 03
	ora $67.b,S		; 03 67
	ora [$66.b]		; 07 66
	asl $0C.b		; 06 0C
	bra   4.b		; 80 04
	sed		; F8
	brk $FE.b		; 00 FE
	and ($C6.b),Y		; 31 C6
	and ($00.b),Y		; 31 00
	brk $18.b		; 00 18
	rts		; 60

	clc		; 18
	adc ($88.b,X)		; 61 88
	ora $0FE0.w		; 0D E0 0F
	beq -113.b		; F0 8F
	bvs  -9.b		; 70 F7
	php		; 08
	sbc ($06.b),Y		; F1 06
	cpy #$FF.b		; C0 FF
	rti		; 40

	adc $0A0E11.l,X		; 7F 11 0E 0A
	pla		; 68
	ora $B9BB6C.l		; 0F 6C BB B9
	stz $F904.w		; 9C 04 F9
	brk $CF.b		; 00 CF
	bmi  65.b		; 30 41
	ldx $4E91.w,Y		; BE 91 4E
	sta $609F60.l,X		; 9F 60 9F 60
	asl A		; 0A
	mvp $40,$BF		; 44 BF 40
	sbc $F01000.l,X		; FF 00 10 F0
	jsr $F0C0.w		; 20 C0 F0
	brk $71.b		; 00 71
	eor ($39.b),Y		; 51 39
	and $1A1A.w,Y		; 39 1A 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00EC60.l,X		; 9F 60 EC 00
	jsr ($EC00.w,X)		; FC 00 EC
	brk $E0.b		; 00 E0
	cop $C1.b		; 02 C1
	bit $0F.b		; 24 0F
	bvs  15.b		; 70 0F
	rts		; 60

	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	brk $03.b		; 00 03
	tsb $03.b		; 04 03
	asl $01.b		; 06 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	asl $01.b		; 06 01
	brk $01.b		; 00 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	cpx $04.b		; E4 04
	cpx #$00.b		; E0 00
	sec		; 38
	cpy #$3C.b		; C0 3C
	cpy #$6C.b		; C0 6C
	dey		; 88
	ror $FE9E.w,X		; 7E 9E FE
	rol $72F2.w		; 2E F2 72
	cpx $09.b		; E4 09
	cpx #$05.b		; E0 05
	sed		; F8
	ora $7C.b		; 05 7C
	sta ($64.b,X)		; 81 64
	sta ($E2.b,X)		; 81 E2
	ora ($D6.b,X)		; 01 D6
	ora ($82.b,X)		; 01 82
	tsb $CC.b		; 04 CC
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$E0.b		; C0 E0
	cpx #$D0.b		; E0 D0
	bne -128.b		; D0 80
	bra  64.b		; 80 40
	rti		; 40

	cpy $C000.w		; CC 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
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
	asl $3B00.w		; 0E 00 3B
	brk $E7.b		; 00 E7
	brk $6B.b		; 00 6B
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $3B0F.w		; 0E 0F 3B
	tsa		; 3B
	sbc [$E7.b]		; E7 E7
	rtl		; 6B

	rtl		; 6B

	ora $05.b		; 05 05
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	jmp ($0C6C.w)		; 6C 6C 0C
	ora $000F08.l		; 0F 08 0F 00
	and $00F100.l,X		; 3F 00 F1 00
	bit $9068.w		; 2C 68 90
	pla		; 68
	bcc 108.b		; 90 6C
	bcc  15.b		; 90 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc [$3F.b],Y		; F7 3F
	sbc $2CF1F1.l,X		; FF F1 F1 2C
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $70.b		; 00 70
	brk $A9.b		; 00 A9
	brk $D8.b		; 00 D8
	brk $B4.b		; 00 B4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$A0.b		; A0 A0
	bvs 112.b		; 70 70
	lda #$A9.b		; A9 A9
	cld		; D8
	cld		; D8
	ldy $B4.b,X		; B4 B4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$80.b]		; 07 80
	trb $F100.w		; 1C 00 F1
	ora $06D3.w		; 0D D3 06
	sbc ($FF.b),Y		; F1 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp ($FF.b,S),Y		; D3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	sbc $FF.b,S		; E3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $FF.b,S		; E3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFF3.l,X		; FF F3 FF 08
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $0A0003.l,X		; FF 03 00 0A
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	asl $0000.w		; 0E 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3D.b		; 00 3D
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	asl $39.b		; 06 39
	tsb $39.b		; 04 39
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	php		; 08
	sbc $09EF10.l,X		; FF 10 EF 09
	beq   1.b		; F0 01
	jsr ($6E11.w,X)		; FC 11 6E
	ora ($DE.b,X)		; 01 DE
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	ora [$F0.b]		; 07 F0
	asl $89E1.w,X		; 1E E1 89
	ror $CD.b,X		; 76 CD
	and ($73.b)		; 32 73
	tsb $0CD3.w		; 0C D3 0C
	pea $7400.w		; F4 00 74
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $61.b		; 00 61
	brk $8F.b		; 00 8F
	brk $F3.b		; 00 F3
	jmp ($7CF3.w,X)		; 7C F3 7C
	pea $7400.w		; F4 00 74
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $61.b		; 00 61
	bcc -113.b		; 90 8F
	bvc -125.b		; 50 83
	tsb $0C83.w		; 0C 83 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	stx $B0FE.w		; 8E FE B0
	jsr ($FCF0.w,X)		; FC F0 FC
	beq -16.b		; F0 F0
	ora ($00.b,X)		; 01 00
	clc		; 18
	asl $18.b		; 06 18
	ora [$38.b]		; 07 38
	ora $70.b,S		; 03 70
	ora ($4F.b,X)		; 01 4F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $18.b		; 06 18
	ora [$18.b]		; 07 18
	ora [$3A.b]		; 07 3A
	ora $0E.b		; 05 0E
	ora ($08.b,X)		; 01 08
	ora [$33.b]		; 07 33
	bit $1F1C.w,X		; 3C 1C 1F
	and ($30.b),Y		; 31 30
	rts		; 60

	asl $20.b		; 06 20
	dec $0B.b		; C6 0B
	xce		; FB
	lda $403F40.l,X		; BF 40 3F 40
	ora $C30C40.l		; 0F 40 0C C3
	ora #$44.b		; 09 44
	adc #$06.b		; 69 06
	adc $7086.w,Y		; 79 86 70
	sty $01.b		; 84 01
	inc $F901.w,X		; FE 01 F9
	ora ($F9.b,X)		; 01 F9
	tsb $FC.b		; 04 FC
	bit $4CC0.w,X		; 3C C0 4C
	tsb $EE.b		; 04 EE
	stx $2666.w		; 8E 66 26
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	sta [$78.b]		; 87 78
	sbc [$08.b],Y		; F7 08
	and $00FBC0.l,X		; 3F C0 FB 00
	sed		; F8
	brk $50.b		; 00 50
	bit #$F0.b		; 89 F0
	bcs -72.b		; B0 B8
	clv		; B8
	php		; 08
	php		; 08
	sec		; 38
	sec		; 38
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	jsr $4020.w		; 20 20 40
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $38.b		; 00 38
	rti		; 40

	sty $8E70.w		; 8C 70 8E
	bvs  30.b		; 70 1E
	stz $3F.b		; 64 3F
	eor $1B1939.l		; 4F 39 19 1B
	phd		; 0B
	ora [$07.b]		; 07 07
	sei		; 78
	cop $FC.b		; 02 FC
	cop $9E.b		; 02 9E
	rts		; 60

	inc A		; 1A
	rts		; 60

	adc ($00.b,S),Y		; 73 00
	and ($02.b,X)		; 21 02
	ora ($00.b,S),Y		; 13 00
	ora [$00.b]		; 07 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$C0.b		; C0 C0
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra 112.b		; 80 70
	bra  96.b		; 80 60
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy $5700.w		; CC 00 57
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $57CF.w		; CC CF 57
	eor [$0C.b],Y		; 57 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	brk $8D.b		; 00 8D
	brk $E3.b		; 00 E3
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plx		; FA
	plx		; FA
	sta $E38D.w		; 8D 8D E3
	sbc $04.b,S		; E3 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	ldy #$80.b		; A0 80
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
	ora $3B.b,S		; 03 3B
	brk $39.b		; 00 39
	brk $05.b		; 00 05
	sei		; 78
	ora [$38.b]		; 07 38
	phk		; 4B
	bmi  65.b		; 30 41
	rol $FEE0.w,X		; 3E E0 FE
	ora $00.b,S		; 03 00
	tsa		; 3B
	brk $39.b		; 00 39
	cop $45.b		; 02 45
	sec		; 38
	and [$18.b]		; 27 18
	rtl		; 6B

	trb $6F.b		; 14 6F
	bpl  31.b		; 10 1F
	brk $08.b		; 00 08
	beq -127.b		; F0 81
	sec		; 38
	and [$19.b]		; 27 19
	lda $20BA09.l,X		; BF 09 BA 20
	asl A		; 0A
	cop $0C.b		; 02 0C
	brk $0A.b		; 00 0A
	brk $C8.b		; 00 C8
	rol $89.b,X		; 36 89
	stz $3E.b,X		; 74 3E
	rti		; 40

	ldx $40.b,Y		; B6 40
	txy		; 9B
	mvp $C4,$19		; 44 19 C4
	adc $807F00.l,X		; 7F 00 7F 80
	sty $8C30.w		; 8C 30 8C
	bvs -112.b		; 70 90
	cpx $ACB0.w		; EC B0 AC
	ora ($01.b,X)		; 01 01
	phb		; 8B
	phd		; 0B
	dex		; CA
	phd		; 0B
	txa		; 8A
	rtl		; 6B

	ldy $FC42.w,X		; BC 42 FC
	cop $7E.b		; 02 7E
	brk $1E.b		; 00 1E
	rti		; 40

	beq   2.b		; F0 02
	beq   4.b		; F0 04
	cmp ($14.b,X)		; C1 14
	sta ($74.b,X)		; 81 74
	cpy #$40.b		; C0 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bra -16.b		; 80 F0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bmi  64.b		; 30 40
	brk $E0.b		; 00 E0
	bcs  64.b		; B0 40
	cpy $1800.w		; CC 00 18
	bpl  25.b		; 10 19
	clc		; 18
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $08.b		; 00 08
	ora ($E0.b),Y		; 11 E0
	ora ($E3.b),Y		; 11 E3
	brk $65.b		; 00 65
	ora $04.b		; 05 04
	tsb $04.b		; 04 04
	tsb $64.b		; 04 64
	tsb $8F.b		; 04 8F
	bmi  31.b		; 30 1F
	jsr $00FF.w		; 20 FF 00
	sbc $086500.l		; EF 00 65 08
	tsb $09.b		; 04 09
	tsb $09.b		; 04 09
	stz $09.b		; 64 09
	jsr $F400.w		; 20 00 F4
	bra  -2.b		; 80 FE
	cpy #$FE.b		; C0 FE
	cpy #$C7.b		; C0 C7
	beq -50.b		; F0 CE
	beq  -4.b		; F0 FC
	cpy #$90.b		; C0 90
	bra -29.b		; 80 E3
	php		; 08
	pea $FE08.w		; F4 08 FE
	ora ($FE.b,X)		; 01 FE
	brk $F7.b		; 00 F7
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $90.b		; 00 90
	jsr $4040.w		; 20 40 40
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
	ora $05.b		; 05 05
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $18.b		; 00 18
	ora $02.b		; 05 02
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($06.b,X)		; 01 06
	clc		; 18
	ora $C0C0C0.l,X		; 1F C0 C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$E0.b		; C0 E0
	cpx #$60.b		; E0 60
	ply		; 7A
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	ply		; 7A
	txs		; 9A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $0A.b,X		; F5 0A
	dec $F504.w,X		; DE 04 F5
	sbc $00FFDE.l,X		; FF DE FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	dec $02FF.w,X		; DE FF 02
	asl $0000.w		; 0E 00 00
	sbc $FF.b,X		; F5 FF
	inc $04FF.w		; EE FF 04
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	inc $06FF.w		; EE FF 06
	asl $0000.w		; 0E 00 00
	plx		; FA
	sbc $08FFFE.l,X		; FF FE FF 08
	asl $0000.w		; 0E 00 00
	brk $06.b		; 00 06
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	brk $7D.b		; 00 7D
	brk $76.b		; 00 76
	brk $0F.b		; 00 0F
	adc $00.b,X		; 75 00
	brk $06.b		; 00 06
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	cop $7D.b		; 02 7D
	ora #$74.b		; 09 74
	cop $74.b		; 02 74
	asl $7501.w		; 0E 01 75
	php		; 08
	asl $4F00.w		; 0E 00 4F
	beq -113.b		; F0 8F
	bvs  84.b		; 70 54
	bra -98.b		; 80 9E
	adc [$1E.b]		; 67 1E
	sbc [$49.b]		; E7 49
	stx $3A.b		; 86 3A
	cmp $000E.w,X		; DD 0E 00
	and $10EF80.l,X		; 3F 80 EF 10
	mvn $B8,$AA		; 54 AA B8
	eor ($B8.b,X)		; 41 B8
	eor ($4F.b,X)		; 41 4F
	ldy #$E7.b		; A0 E7
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
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
	brk $31.b		; 00 31
	asl $0F70.w		; 0E 70 0F
	sta ($00.b)		; 92 00
	and [$30.b],Y		; 37 30
	ora ($10.b,S),Y		; 13 10
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	and ($0E.b),Y		; 31 0E
	adc $9E06.w,Y		; 79 06 9E
	ora ($0F.b,X)		; 01 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0D.b		; 00 0D
	and #$74.b		; 29 74
	pea $0074.w		; F4 74 00
	ora $083F98.l		; 0F 98 3F 08
	clc		; 18
	asl $080F.w,X		; 1E 0F 08
	asl A		; 0A
	php		; 08
	cmp $098220.l,X		; DF 20 82 09
	jmp ($FF81.w,X)		; 7C 81 FF
	brk $7F.b		; 00 7F
	brk $1E.b		; 00 1E
	rti		; 40

	ora $540A50.l		; 0F 50 0A 54
	ldy #$A0.b		; A0 A0
	bcc -112.b		; 90 90
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E040.w		; 20 40 E0
	brk $80.b		; 00 80
	rti		; 40

	bra   0.b		; 80 00
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
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora ($31.b,X)		; 01 31
	brk $DB.b		; 00 DB
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora [$00.b]		; 07 00
	ora [$08.b]		; 07 08
	and ($3E.b),Y		; 31 3E
	stp		; DB
	cmp $001B1B.l,X		; DF 1B 1B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	iny		; C8
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	iny		; C8
	iny		; C8
	bpl  16.b		; 10 10
	jsr $0020.w		; 20 20 00
	brk $07.b		; 00 07
	bvs  15.b		; 70 0F
	adc ($04.b),Y		; 71 04
	sei		; 78
	cpy #$F8.b		; C0 F8
	tya		; 98
	sed		; F8
	sbc ($F1.b,X)		; E1 F1
	cpx #$E0.b		; E0 E0
	ora $01.b		; 05 01
	ora [$70.b]		; 07 70
	lsr $5D30.w		; 4E 30 5D
	jsr $023D.w		; 20 3D 02
	adc $04.b,S		; 63 04
	trb $0000.w		; 1C 00 00
	cop $04.b		; 02 04
	php		; 08
	inc $E05D.w,X		; FE 5D E0
	brk $49.b		; 00 49
	ora ($69.b,X)		; 01 69
	ora $60.b		; 05 60
	ora $C0CFB0.l,X		; 1F B0 CF C0
	sbc $A38897.l,X		; FF 97 88 A3
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	cop $F8.b		; 02 F8
	asl $F0.b		; 06 F0
	ora $4E0778.l		; 0F 78 07 4E
	and ($57.b),Y		; 31 57
	php		; 08
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	bra -16.b		; 80 F0
	bra  -8.b		; 80 F8
	sei		; 78
	clv		; B8
	mvp $1C,$44		; 44 44 1C
	trb $0000.w		; 1C 00 00
	bra  32.b		; 80 20
	brk $80.b		; 00 80
	rti		; 40

	bmi 120.b		; 30 78
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $04.b		; 02 04
	ora $01.b,S		; 03 01
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $05.b		; 00 05
	cop $01.b		; 02 01
	cop $03.b		; 02 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $88.b		; 00 88
	php		; 08
	iny		; C8
	php		; 08
	iny		; C8
	pha		; 48
	cpx #$E0.b		; E0 E0
	tay		; A8
	tay		; A8
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sec		; 38
	sec		; 38
	dey		; 88
	bpl -56.b		; 10 C8
	bpl -120.b		; 10 88
	bpl  44.b		; 10 2C
	bpl  40.b		; 10 28
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $38.b		; 00 38
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
	brk $00.b		; 00 00
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
	brk $F9.b		; 00 F9
	asl $EA.b		; 06 EA
	cop $F9.b		; 02 F9
	sbc $00FFEA.l,X		; FF EA FF 00
	asl $0000.w		; 0E 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000E02.l,X		; FF 02 0E 00
	brk $00.b		; 00 00
	bmi   4.b		; 30 04
	phd		; 0B
	ora ($FE.b,X)		; 01 FE
	ora ($7E.b,X)		; 01 7E
	eor ($04.b),Y		; 51 04
	and [$C1.b],Y		; 37 C1
	bcc  64.b		; 90 40
	bra -32.b		; 80 E0
	brk $30.b		; 00 30
	asl $09.b		; 06 09
	phd		; 0B
	pea $522D.w		; F4 2D 52
	eor ($0E.b),Y		; 51 0E
	ldx $48.b,Y		; B6 48
	sta $6A.b,X		; 95 6A
	adc $00E000.l,X		; 7F 00 E0 00
	beq   0.b		; F0 00
	bmi   0.b		; 30 00
	bne -32.b		; D0 E0
	jsr $40C0.w		; 20 C0 40
	jsr $1C10.w		; 20 10 1C
	brk $9C.b		; 00 9C
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	bmi -64.b		; 30 C0
	bpl  32.b		; 10 20
	cpx #$00.b		; E0 00
	rts		; 60

	bra -60.b		; 80 C4
	plp		; 28
	trb $E8.b		; 14 E8
	ldy #$40.b		; A0 40
	bit $44.b,X		; 34 44
	rts		; 60

	jsr $1818.w		; 20 18 18
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	tsb $27.b		; 04 27
	cpx #$18.b		; E0 18
	bmi  72.b		; 30 48
	mvp $18,$10		; 44 10 18
	brk $08.b		; 00 08
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl  39.b		; 10 27
	tsa		; 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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

	sbc $C6.b,S		; E3 C6
	cmp [$48.b]		; C7 48
	jsl $401D41.l		; 22 41 1D 40
	eor $29.b		; 45 29
	jsr $0202.w		; 20 02 02
	asl A		; 0A
	cop $B7.b		; 02 B7
	php		; 08
	cop $09.b		; 02 09
	eor #$32.b		; 49 32
	jmp $3732.w		; 4C 32 37
	brk $0B.b		; 00 0B
	brk $02.b		; 00 02
	ora ($0A.b,X)		; 01 0A
	ora ($14.b,X)		; 01 14
	pei ($24.b)		; D4 24
	cpx $A8.b		; E4 A8
	plp		; 28
	ldy #$20.b		; A0 20
	cpx #$00.b		; E0 00
	cpx #$80.b		; E0 80
	ldy #$C0.b		; A0 C0
	rti		; 40

	brk $38.b		; 00 38
	cpy #$F8.b		; C0 F8
	brk $D0.b		; 00 D0
	brk $C8.b		; 00 C8
	bpl -32.b		; 10 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	inc A		; 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	inc A		; 1A
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
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $F503.w,X		; FD 03 F5
	brk $FD.b		; 00 FD
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	sbc $FFFDFF.l,X		; FF FF FD FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	bit $1C10.w		; 2C 10 1C
	inx		; E8
	sei		; 78
	bcc   0.b		; 90 00
	stx $A2.b		; 86 A2
	tsx		; BA
	bcc 112.b		; 90 70
	clc		; 18
	brk $08.b		; 00 08
	brk $2C.b		; 00 2C
	bpl  52.b		; 10 34
	cpy #$68.b		; C0 68
	bra -10.b		; 80 F6
	php		; 08
	tsb $A810.w		; 0C 10 A8
	mvp $00,$18		; 44 18 00
	php		; 08
	bpl -128.b		; 10 80
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	rti		; 40

	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	ora [$F4.b]		; 07 F4
	cop $FB.b		; 02 FB
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	pea $01FF.w		; F4 FF 01
	asl $0000.w		; 0E 00 00
	sbc $FCFF.w,Y		; F9 FF FC
	sbc $000E02.l,X		; FF 02 0E 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $000E03.l,X		; FF 03 0E 00
	brk $00.b		; 00 00
	tsb $0400.w		; 0C 00 04
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	ora $88.b		; 05 88
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	bra   4.b		; 80 04
	rti		; 40

	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	jsr $4000.w		; 20 00 40
	brk $80.b		; 00 80
	ora ($1E.b,X)		; 01 1E
	ora ($80.b,X)		; 01 80
	ora $F0.b,S		; 03 F0
	ora $20.b,S		; 03 20
	ora $0022.w,X		; 1D 22 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $0004.w,X		; 1D 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cld		; D8
	jsr $0000.w		; 20 00 00
	cpx #$10.b		; E0 10
	bra   2.b		; 80 02
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cop $80.b		; 02 80
	sei		; 78
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	tsb $F8.b		; 04 F8
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sed		; F8
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FC.b		; 00 FC
	sbc $020000.l,X		; FF 00 00 02
	asl $0000.w		; 0E 00 00
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	tsb $01.b		; 04 01
	ora [$48.b]		; 07 48
	asl $01.b		; 06 01
	tsb $00E0.w		; 0C E0 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $40.b		; 04 40
	tsb $20.b		; 04 20
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	asl $0081.w,X		; 1E 81 00
	and $000000.l		; 2F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0027.w,X		; 1E 27 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FA04.w,X		; FD 04 FA
	ora ($FD.b,X)		; 01 FD
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	brk $10.b		; 00 10
	bpl   2.b		; 10 02
	cop $10.b		; 02 10
	trb $00.b		; 14 00
	clc		; 18
	rts		; 60

	bpl -64.b		; 10 C0
	sei		; 78
	ora ($00.b,X)		; 01 00
	php		; 08
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $12.b		; 00 12
	rti		; 40

	trb $00.b		; 14 00
	clc		; 18
	brk $10.b		; 00 10
	ora ($78.b,X)		; 01 78
	php		; 08
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($FC.b,X)		; 01 FC
	brk $FE.b		; 00 FE
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	jsr $0000.w		; 20 00 00
	jsr $8030.w		; 20 30 80
	jsr $0080.w		; 20 80 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$FE.b]		; 07 FE
	ora ($FD.b,X)		; 01 FD
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sbc $0D.b,X		; F5 0D
	sed		; F8
	ora $F5.b,S		; 03 F5
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	sbc $FCFF.w,X		; FD FF FC
	sbc $000E01.l,X		; FF 01 0E 00
	brk $05.b		; 00 05
	brk $FC.b		; 00 FC
	sbc $000E02.l,X		; FF 02 0E 00
	brk $0D.b		; 00 0D
	brk $FC.b		; 00 FC
	sbc $000E03.l,X		; FF 03 0E 00
	brk $F7.b		; 00 F7
	sbc $04FFF4.l,X		; FF F4 FF 04
	asl $0000.w		; 0E 00 00
	sbc $FFF4FF.l,X		; FF FF F4 FF
	ora $0E.b		; 05 0E
	brk $00.b		; 00 00
	tsb $2A0C.w		; 0C 0C 2A
	rol A		; 2A
	ora [$17.b],Y		; 17 17
	cop $02.b		; 02 02
	ora ($01.b,X)		; 01 01
	plp		; 28
	adc $008A00.l,X		; 7F 00 8A 00
	brk $0C.b		; 00 0C
	and ($2A.b,S),Y		; 33 2A
	ora $17.b,X		; 15 17
	plp		; 28
	cop $7D.b		; 02 7D
	ora ($7E.b,X)		; 01 7E
	adc $008A00.l,X		; 7F 00 8A 00
	brk $00.b		; 00 00
	sec		; 38
	rol $EFE9.w,X		; 3E E9 EF
	txs		; 9A
	stz $AEAA.w,X		; 9E AA AE
	cmp ($DF.b,S),Y		; D3 DF
	brk $FE.b		; 00 FE
	bit $66.b		; 24 66
	brk $00.b		; 00 00
	rol $EFC0.w,X		; 3E C0 EF
	bpl -98.b		; 10 9E
	adc ($AE.b,X)		; 61 AE
	eor ($DF.b),Y		; 51 DF
	jsr $01FE.w		; 20 FE 01
	ror $00.b		; 66 00
	brk $00.b		; 00 00
	bne -40.b		; D0 D8
	clv		; B8
	ldy $1E18.w,X		; BC 18 1E
	bvc  86.b		; 50 56
	bit $603F.w,X		; 3C 3F 60
	adc [$F0.b]		; 67 F0
	plx		; FA
	jsr $D820.w		; 20 20 D8
	jsr $40BC.w		; 20 BC 40
	asl $56E0.w,X		; 1E E0 56
	tay		; A8
	and $9867C0.l,X		; 3F C0 67 98
	plx		; FA
	brk $20.b		; 00 20
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($15.b,X)		; 01 15
	ora $03.b,X		; 15 03
	ora $2A.b,S		; 03 2A
	rol A		; 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($1E.b,X)		; 01 1E
	ora $6A.b,X		; 15 6A
	ora $7C.b,S		; 03 7C
	rol A		; 2A
	cmp $00.b,X		; D5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpx #$E0.b		; E0 E0
	beq -32.b		; F0 E0
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $F7.b		; 00 F7
	asl A		; 0A
	plx		; FA
	cop $03.b		; 02 03
	brk $FD.b		; 00 FD
	sbc $000E00.l,X		; FF 00 0E 00
	brk $FB.b		; 00 FB
	sbc $01FFFA.l,X		; FF FA FF 01
	asl $0000.w		; 0E 00 00
	sbc ($FF.b,S),Y		; F3 FF
	plx		; FA
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F8.b		; 00 F8
	sed		; F8
	clc		; 18
	trb $1410.w		; 1C 10 14
	jsr $7027.w		; 20 27 70
	jmp ($2020.w,X)		; 7C 20 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $1C.b		; 00 1C
	cpx #$14.b		; E0 14
	inx		; E8
	and [$D8.b]		; 27 D8
	jmp ($2000.w,X)		; 7C 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	ldy $1E1C.w,X		; BC 1C 1E
	jmp $584F.w		; 4C 4F 58
	tad		; 5B
	sbc $E7.b		; E5 E7
	eor #$4B.b		; 49 4B
	brk $FF.b		; 00 FF
	asl A		; 0A
	tad		; 5B
	ldy $1E40.w,X		; BC 40 1E
	cpx #$4F.b		; E0 4F
	bcs  91.b		; B0 5B
	ldy $E7.b		; A4 E7
	clc		; 18
	phk		; 4B
	ldy $FF.b,X		; B4 FF
	brk $5B.b		; 00 5B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora [$00.b]		; 07 00
	ora #$00.b		; 09 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$07.b]		; 07 07
	brk $09.b		; 00 09
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $F9.b		; 00 F9
	asl $FC.b		; 06 FC
	ora ($F9.b,X)		; 01 F9
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	jsr ($01FF.w,X)		; FC FF 01
	asl $0000.w		; 0E 00 00
	asl $231F.w,X		; 1E 1F 23
	and $67.b,S		; 23 67
	adc [$19.b]		; 67 19
	ora $0D0C.w,Y		; 19 0C 0D
	cop $A6.b		; 02 A6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $5C2320.l,X		; 1F 20 23 5C
	adc [$18.b]		; 67 18
	ora $0D66.w,Y		; 19 66 0D
	adc ($A6.b)		; 72 A6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  88.b		; 80 58
	cld		; D8
	tya		; 98
	stz $DCD8.w		; 9C D8 DC
	bmi -68.b		; 30 BC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cld		; D8
	jsr $609C.w		; 20 9C 60
	jmp.w [$BC20]		; DC 20 BC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	tsb $FD.b		; 04 FD
	sbc $FDFFFC.l,X		; FF FC FF FD
	sbc $000E00.l,X		; FF 00 0E 00
	brk $04.b		; 00 04
	brk $FD.b		; 00 FD
	sbc $000E01.l,X		; FF 01 0E 00
	brk $18.b		; 00 18
	clc		; 18
	adc $157D.w,Y		; 79 7D 15
	ora $0000.w,X		; 1D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	rts		; 60

	adc $1D02.w,X		; 7D 02 1D
	sep #$00		; E2 00
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($00.b,X)		; 01 00
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $000E00.l,X		; FF 00 0E 00
	brk $D0.b		; 00 D0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	ora $04F4.w		; 0D F4 04
	asl $00.b		; 06 00
	sbc $FF.b,X		; F5 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc $01FF.w,X		; FD FF 01
	asl $0000.w		; 0E 00 00
	inc $F5FF.w,X		; FE FF F5
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FE.b		; 00 FE
	sbc $03FFFD.l,X		; FF FD FF 03
	asl $0000.w		; 0E 00 00
	inc $FF.b,X		; F6 FF
	pea $04FF.w		; F4 FF 04
	asl $0000.w		; 0E 00 00
	inc $FF.b,X		; F6 FF
	jsr ($05FF.w,X)		; FC FF 05
	asl $0000.w		; 0E 00 00
	inc $FFFF.w		; EE FF FF
	sbc $000E06.l,X		; FF 06 0E 00
	brk $40.b		; 00 40
	rti		; 40

	rts		; 60

	rts		; 60

	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	bne -48.b		; D0 D0
	rts		; 60

	rts		; 60

	bvs 112.b		; 70 70
	sei		; 78
	sei		; 78
	rti		; 40

	bra  96.b		; 80 60
	bra 112.b		; 80 70
	bra 112.b		; 80 70
	bra -48.b		; 80 D0
	jsr $9060.w		; 20 60 90
	bvs -128.b		; 70 80
	sei		; 78
	bra 104.b		; 80 68
	pla		; 68
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	sei		; 78
	sei		; 78
	cpx #$E0.b		; E0 E0
	ora ($FD.b,X)		; 01 FD
	brk $E4.b		; 00 E4
	brk $90.b		; 00 90
	pla		; 68
	bcc  -8.b		; 90 F8
	brk $70.b		; 00 70
	dey		; 88
	sei		; 78
	bra -32.b		; 80 E0
	clc		; 18
	sbc $E400.w,X		; FD 00 E4
	brk $90.b		; 00 90
	brk $C0.b		; 00 C0
	cpy #$C3.b		; C0 C3
	cmp $41.b,S		; C3 41
	eor ($C3.b,X)		; 41 C3
	cmp $E1.b,S		; C3 E1
	sbc ($A0.b,X)		; E1 A0
	ldy #$EC.b		; A0 EC
	cpx $E8E8.w		; EC E8 E8
	cpy #$03.b		; C0 03
	cmp $04.b,S		; C3 04
	eor ($86.b,X)		; 41 86
	cmp $04.b,S		; C3 04
	sbc ($06.b,X)		; E1 06
	ldy #$4F.b		; A0 4F
	cpx $E803.w		; EC 03 E8
	ora [$99.b]		; 07 99
	sta $F515.w,Y		; 99 15 F5
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	ora ($01.b,X)		; 01 01
	brk $1F.b		; 00 1F
	tsb $2C.b		; 04 2C
	sta $F566.w,Y		; 99 66 F5
	asl A		; 0A
	cpx #$1F.b		; E0 1F
	rti		; 40

	ora $011F20.l,X		; 1F 20 1F 01
	asl $001F.w,X		; 1E 1F 00
	bit $0100.w		; 2C 00 01
	ora ($05.b,X)		; 01 05
	ora $0D.b		; 05 0D
	ora $0707.w		; 0D 07 07
	adc ($71.b),Y		; 71 71
	adc ($61.b,X)		; 61 61
	sbc $E5.b		; E5 E5
	sta [$97.b],Y		; 97 97
	ora ($0E.b,X)		; 01 0E
	ora $1A.b		; 05 1A
	ora $0732.w		; 0D 32 07
	sec		; 38
	adc ($0E.b),Y		; 71 0E
	adc ($1E.b,X)		; 61 1E
	sbc $1A.b		; E5 1A
	sta [$68.b],Y		; 97 68
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	tsb $07.b		; 04 07
	cpy #$FE.b		; C0 FE
	ora [$1F.b]		; 07 1F
	brk $09.b		; 00 09
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	inc $1F00.w,X		; FE 00 1F
	brk $09.b		; 00 09
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
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
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
	asl A		; 0A
	sed		; F8
	tsb $F8.b		; 04 F8
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc $01FF.w,X		; FD FF 01
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $FD.b		; 00 FD
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F8.b		; 00 F8
	sbc $03FFF5.l,X		; FF F5 FF 03
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	sta $06068F.l		; 8F 8F 06 06
	php		; 08
	ora $00FDC0.l		; 0F C0 FD 00
	ora ($00.b)		; 12 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	bvs   6.b		; 70 06
	sbc $F00F.w,Y		; F9 0F F0
	sbc $1200.w,X		; FD 00 12
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A3.b		; 00 A3
	lda $4A.b,S		; A3 4A
	lsr A		; 4A
	adc $8303EF.l		; 6F EF 03 83
	asl $86.b		; 06 86
	php		; 08
	ora $207E00.l		; 0F 00 7E 20
	lda $A3.b		; A5 A3
	trb $B54A.w		; 1C 4A B5
	sbc $7C8310.l		; EF 10 83 7C
	stx $79.b		; 86 79
	ora $007E70.l		; 0F 70 7E 00
	lda $00.b		; A5 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $00A0.w		; 20 A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -96.b		; 80 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	phd		; 0B
	tas		; 1B
	tas		; 1B
	ora $63630F.l		; 0F 0F 63 63
	nop		; EA
	nop		; EA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	trb $1B.b		; 14 1B
	bit $0F.b		; 24 0F
	bmi  99.b		; 30 63
	trb $15EA.w		; 1C EA 15
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	inc A		; 1A
	phd		; 0B
	phd		; 0B
	sta $828D.w		; 8D 8D 82
	.db $82, $00, $00		; 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	inc A		; 1A
	bit $0B.b		; 24 0B
	bit $8D.b,X		; 34 8D
	and ($82.b)		; 32 82
	and $FFFF.w,X		; 3D FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 097FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 097FFF. Skipping.
.ENDS
