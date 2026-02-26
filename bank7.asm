.BANK 7 SLOT 0
.ORG $0000

.SECTION "Bank7" FORCE

	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $74.b		; 06 74
	brk $10.b		; 00 10
	asl $87.b		; 06 87
	ora ($89.b)		; 12 89
	brk $00.b		; 00 00
	txa		; 8A
	bit #$89.b		; 89 89
	phb		; 8B
	tsb $86.b		; 04 86
	sty $8B8B.w		; 8C 8B 8B
	sta $8A8A.w		; 8D 8A 8A
	stx $8C8C.w		; 8E 8C 8C
	sta $908D8D.l		; 8F 8D 8D 90
	stx $918E.w		; 8E 8E 91
	sta $90928F.l		; 8F 8F 92 90
	bcc -109.b		; 90 93
	sta ($91.b),Y		; 91 91
	sty $92.b,X		; 94 92
	sta ($95.b)		; 92 95
	sta ($93.b,S),Y		; 93 93
	stx $94.b,Y		; 96 94
	sty $97.b,X		; 94 97
	sta $95.b,X		; 95 95
	tya		; 98
	stx $96.b,Y		; 96 96
	sta $9898.w,Y		; 99 98 98
	txs		; 9A
	sta [$97.b],Y		; 97 97
	rti		; 40

	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $9A.b,S		; 03 9A
	sta [$95.b],Y		; 97 95
	sta ($8F.b,S),Y		; 93 8F
	txa		; 8A
	ora ($0C.b,X)		; 01 0C
	cop $91.b		; 02 91
	sta $00898D.l		; 8F 8D 89 00
	ora $00.b,S		; 03 00
	tsb $91.b		; 04 91
	sta $00898A.l		; 8F 8A 89 00
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora [$08.b]		; 07 08
	php		; 08
	tsb $0C09.w		; 0C 09 0C
	asl A		; 0A
	tsb $0C0B.w		; 0C 0B 0C
	tsb $0D00.w		; 0C 00 0D
	php		; 08
	asl $0F00.w		; 0E 00 0F
	php		; 08
	bpl   8.b		; 10 08
	ora ($00.b),Y		; 11 00
	ora ($08.b)		; 12 08
	ora ($08.b,S),Y		; 13 08
	sta $14898A.l		; 8F 8A 89 14
	tsb $15.b		; 04 15
	tsb $16.b		; 04 16
	tsb $17.b		; 04 17
	tsb $18.b		; 04 18
	tsb $19.b		; 04 19
	tsb $1A.b		; 04 1A
	tsb $1B.b		; 04 1B
	tsb $89.b		; 04 89
	trb $1D00.w		; 1C 00 1D
	sta $041E00.l		; 8F 00 1E 04
	ora $042004.l,X		; 1F 04 20 04
	and ($04.b,X)		; 21 04
	jsl $238A04.l		; 22 04 8A 23
	tsb $24.b		; 04 24
	tsb $25.b		; 04 25
	tsb $26.b		; 04 26
	tsb $27.b		; 04 27
	tsb $28.b		; 04 28
	tsb $29.b		; 04 29
	tsb $89.b		; 04 89
	rol A		; 2A
	brk $2B.b		; 00 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	tsb $002E.w		; 0C 2E 00
	and $083000.l		; 2F 00 30 08
	and ($0C.b),Y		; 31 0C
	and ($08.b)		; 32 08
	and ($0C.b,S),Y		; 33 0C
	bit $00.b,X		; 34 00
	and $00.b,X		; 35 00
	rol $00.b,X		; 36 00
	and [$0C.b],Y		; 37 0C
	sec		; 38
	tsb $0839.w		; 0C 39 08
	dec A		; 3A
	brk $3B.b		; 00 3B
	php		; 08
	bit $3D08.w,X		; 3C 08 3D
	brk $3E.b		; 00 3E
	tsb $003F.w		; 0C 3F 00
	rti		; 40

	php		; 08
	bit #$41.b		; 89 41
	tsb $42.b		; 04 42
	tsb $43.b		; 04 43
	tsb $44.b		; 04 44
	tsb $45.b		; 04 45
	tsb $46.b		; 04 46
	tsb $47.b		; 04 47
	tsb $48.b		; 04 48
	tsb $49.b		; 04 49
	tsb $4A.b		; 04 4A
	tsb $4B.b		; 04 4B
	tsb $4C.b		; 04 4C
	tsb $4D.b		; 04 4D
	tsb $4E.b		; 04 4E
	brk $4F.b		; 00 4F
	brk $50.b		; 00 50
	brk $51.b		; 00 51
	brk $52.b		; 00 52
	brk $53.b		; 00 53
	tsb $54.b		; 04 54
	tsb $55.b		; 04 55
	tsb $56.b		; 04 56
	tsb $57.b		; 04 57
	tsb $58.b		; 04 58
	tsb $59.b		; 04 59
	tsb $5A.b		; 04 5A
	tsb $5B.b		; 04 5B
	tsb $5C.b		; 04 5C
	tsb $5D.b		; 04 5D
	tsb $5E.b		; 04 5E
	tsb $5F.b		; 04 5F
	tsb $60.b		; 04 60
	tsb $61.b		; 04 61
	tsb $62.b		; 04 62
	tsb $63.b		; 04 63
	tsb $64.b		; 04 64
	tsb $65.b		; 04 65
	tsb $66.b		; 04 66
	tsb $67.b		; 04 67
	tsb $68.b		; 04 68
	tsb $0C69.w		; 0C 69 0C
	ror A		; 6A
	brk $6B.b		; 00 6B
	brk $6C.b		; 00 6C
	tsb $006D.w		; 0C 6D 00
	ror $6F00.w		; 6E 00 6F
	php		; 08
	bvs  12.b		; 70 0C
	and ($88.b)		; 32 88
	adc ($0C.b),Y		; 71 0C
	adc ($00.b)		; 72 00
	adc ($00.b,S),Y		; 73 00
	stz $00.b,X		; 74 00
	adc $0C.b,X		; 75 0C
	ror $0C.b,X		; 76 0C
	adc [$0C.b],Y		; 77 0C
	sei		; 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	tsb $007D.w		; 0C 7D 00
	ror $7F00.w,X		; 7E 00 7F
	tsb $80.b		; 04 80
	tsb $81.b		; 04 81
	tsb $82.b		; 04 82
	tsb $83.b		; 04 83
	tsb $84.b		; 04 84
	tsb $85.b		; 04 85
	sta $9999.w,Y		; 99 99 99
	stx $04.b,Y		; 96 04
	txs		; 9A
	sta [$95.b],Y		; 97 95
	sta ($91.b,S),Y		; 93 91
	sta $898A8D.l		; 8F 8D 8A 89
	brk $87.b		; 00 87
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $08.b		; 00 08
	bvs   4.b		; 70 04
	brk $43.b		; 00 43
	lda $24.b,S		; A3 24
	txs		; 9A
	ror $08.b,X		; 76 08
	tsb $C1.b		; 04 C1
	bpl  -8.b		; 10 F8
	plx		; FA
	ora ($02.b,X)		; 01 02
	sbc ($8C.b,X)		; E1 8C
	beq  33.b		; F0 21
	sec		; 38
	eor ($16.b),Y		; 51 16
	phd		; 0B
	.db $42, $42		; 42 42
.ACCU 8
	sep #$AC		; E2 AC
	txa		; 8A
	sty $A4.b		; 84 A4
	.db $62, $49, $D3		; 62 49 D3
	cpx $C8.b		; E4 C8
	sta ($26.b)		; 92 26
	adc $2802.w,Y		; 79 02 28
	eor #$72.b		; 49 72
	eor #$3D.b		; 49 3D
	ora ($29.b,S),Y		; 13 29
	bit $5E44.w		; 2C 44 5E
	and [$E4.b]		; 27 E4
	stz $244A.w,X		; 9E 4A 24
	cmp $9E.b,X		; D5 9E
	jsr $6D9D.w		; 20 9D 6D
	lda $4DD2.w,Y		; B9 D2 4D
	and $BA44.w		; 2D 44 BA
	eor $44A5.w,X		; 5D A5 44
	ldx $4E.b,Y		; B6 4E
	jmp.w [$6D96]		; DC 96 6D
	bit $45B2.w		; 2C B2 45
	eor $DB.b,X		; 55 DB
	rol A		; 2A
	mvn $72,$AB		; 54 AB 72
	bit $7DB6.w		; 2C B6 7D
	ror $F3.b		; 66 F3
	ora ($A9.b)		; 12 A9
	plb		; AB
	lda ($A2.b)		; B2 A2
	jmp $949EBE.l		; 5C BE 9E 94
	cli		; 58
	dec $4DE4.w		; CE E4 4D
	and $59B2.w		; 2D B2 59
	bit $B6.b		; 24 B6
	eor #$2D.b		; 49 2D
	sta ($49.b)		; 92 49
	rol $D2.b		; 26 D2
	adc #$2C.b		; 69 2C
	sta ($27.b)		; 92 27
	phk		; 4B
	rol $93.b		; 26 93
	wai		; CB
	bit $59B6.w		; 2C B6 59
	cop $4A.b		; 02 4A
	lda ($F4.b,X)		; A1 F4
	and ($65.b,X)		; 21 65
	ora ($F2.b,X)		; 01 F2
	ora $1FF221.l,X		; 1F 21 F2 1F
	jsr $B227.w		; 20 27 B2
	ora ($69.b)		; 12 69
	stz $2C.b		; 64 2C
	bra -107.b		; 80 95
	cmp $8F.b,S		; C3 8F
	asl $493C.w		; 0E 3C 49
	ora ($24.b),Y		; 11 24
	tsb $B1.b		; 04 B1
	adc ($00.b),Y		; 71 00
	rti		; 40

	cmp ($20.b,S),Y		; D3 20
	and $CC.b		; 25 CC
	stx $59.b		; 86 59
	ora #$65.b		; 09 65
	cpy $347A.w		; CC 7A 34
	ldy #$EFD1.w		; A0 D1 EF
	cmp ($09.b)		; D2 09
	rtl		; 6B

	cmp [$CA.b]		; C7 CA
	lsr $F98A.w		; 4E 8A F9
	ora $100191.l		; 0F 91 01 10
	ora ($01.b),Y		; 11 01
	ora ($11.b,S),Y		; 13 11
	cld		; D8
	eor [$61.b]		; 47 61
	ora ($3D.b,X)		; 01 3D
	rts		; 60

	sbc $01E4.w,Y		; F9 E4 01
	php		; 08
	and #$57.b		; 29 57
	lsr A		; 4A
	ora #$63.b		; 09 63
	jsl $73A578.l		; 22 78 A5 73
	cmp #$12.b		; C9 12
	ldx $447E.w		; AE 7E 44
	plb		; AB
	asl $2F22.w,X		; 1E 22 2F
	cmp $F8.b		; C5 F8
	lda ($55.b,S),Y		; B3 55
	inc $08A0.w,X		; FE A0 08
	bmi 108.b		; 30 6C
	inc $B6.b,X		; F6 B6
	tda		; 7B
	tad		; 5B
	sbc $5F.b,X		; F5 5F
	tay		; A8
	asl $0011.w,X		; 1E 11 00
	and ($27.b)		; 32 27
	bit #$E2.b		; 89 E2
	dey		; 88
	ldx #$0E1D.w		; A2 1D 0E
	sty $AD.b		; 84 AD
	plx		; FA
	sbc $0383D7.l		; EF D7 83 03
	eor ($A5.b,S),Y		; 53 A5
	ora #$20.b		; 09 20
	dex		; CA
	sta $4C09.w,Y		; 99 09 4C
	and ($2A.b),Y		; 31 2A
	tsb $D178.w		; 0C 78 D1
	ldx $A571.w		; AE 71 A5
	tsb $AE.b		; 04 AE
	cmp $6B.b		; C5 6B
	tas		; 1B
	phd		; 0B
	php		; 08
	phy		; 5A
	tyx		; BB
	brk $97.b		; 00 97
	and ($9C.b)		; 32 9C
	ora $2109.w,Y		; 19 09 21
	lda $D01A.w		; AD 1A D0
	stx $C7.b,Y		; 96 C7
	ora ($D1.b),Y		; 11 D1
	dec $4A40.w,X		; DE 40 4A
	dec $2B0E.w,X		; DE 0E 2B
	jsr ($FD07.w,X)		; FC 07 FD
	and $0B58.w,X		; 3D 58 0B
	ora $A0.b		; 05 A0
	lda $3D6B05.l		; AF 05 6B 3D
	rol $64A6.w		; 2E A6 64
	lda $9427.w		; AD 27 94
	ora ($85.b)		; 12 85
	sta $1C79EB.l,X		; 9F EB 79 1C
	rol $A467.w,X		; 3E 67 A4
	sbc $7FCB.w,X		; FD CB 7F
	stz $25.b		; 64 25
	bmi  68.b		; 30 44
	ora ($66.b),Y		; 11 66
	jsr $BFC0.w		; 20 C0 BF
	bcs   9.b		; B0 09
	phy		; 5A
	and $A2.b,S		; 23 A2
	sta $6497.w		; 8D 97 64
	eor $09.b,X		; 55 09
	adc ($22.b,S),Y		; 73 22
	sei		; 78
	adc $64.b		; 65 64
	bit $9085.w		; 2C 85 90
	lda ($16.b)		; B2 16
	.db $42, $C8		; 42 C8
	eor $220B.w,Y		; 59 0B 22
	bit $88.b		; 24 88
	sta ($22.b)		; 92 22
	pha		; 48
	bit #$22.b		; 89 22
	bit $88.b		; 24 88
	sta ($22.b)		; 92 22
	pha		; 48
	bit #$20.b		; 89 20
	bit $8A.b		; 24 8A
	.db $82, $48, $11		; 82 48 11
	eor $9760.w,Y		; 59 60 97
	bcc  66.b		; 90 42
	pha		; 48
	eor [$1F.b],Y		; 57 1F
	sbc ($F0.b)		; F2 F0
	bit $95.b		; 24 95
	bvc -107.b		; 50 95
	ldy $1F0F.w,X		; BC 0F 1F
	cld		; D8
	ror A		; 6A
	dec $90.b		; C6 90
	and $90.b		; 25 90
	eor $9B.b		; 45 9B
	and ($5E.b)		; 32 5E
	eor [$09.b],Y		; 57 09
	.db $42, $D1		; 42 D1
	dec $8E.b,X		; D6 8E
	lda $F86879.l,X		; BF 79 68 F8
	ror $0434.w,X		; 7E 34 04
	sbc [$E3.b],Y		; F7 E3
	cmp $87.b,X		; D5 87
	and ($57.b)		; 32 57
	sbc $FA.b,X		; F5 FA
	sec		; 38
	jmp ($B54F.w,X)		; 7C 4F B5
	dey		; 88
	cop $C1.b		; 02 C1
	bvs -73.b		; 70 B7
	inc $F9.b		; E6 F9
	jsr ($7FAE.w,X)		; FC AE 7F
	lda $5D.b,S		; A3 5D
	sbc [$3F.b]		; E7 3F
	cmp ($09.b),Y		; D1 09
	lsr $B4.b		; 46 B4
	ply		; 7A
	sta ($FC.b,S),Y		; 93 FC
	sta $E7CAC3.l		; 8F C3 CA E7
	eor #$EE.b		; 49 EE
	xba		; EB
.INDEX 16
	rep #$53		; C2 53
	trb $C76E.w		; 1C 6E C7
	bra 123.b		; 80 7B
	cmp $C1.b,S		; C3 C1
	tsb $25.b		; 04 25
	inc $51.b,X		; F6 51
	lda [$01.b],Y		; B7 01
	bit $2386.w		; 2C 86 23
	eor [$F3.b]		; 47 F3
	adc $6E.b		; 65 6E
	and $84.b,S		; 23 84
	sbc [$CB.b],Y		; F7 CB
	ldx $6E31.w		; AE 31 6E
	rol $183A.w		; 2E 3A 18
	lda [$17.b],Y		; B7 17
	ora $1700.w,X		; 1D 00 17
	adc $C281.w,X		; 7D 81 C2
	adc ($F6.b),Y		; 71 F6
	ora [$09.b]		; 07 09
	cmp [$D8.b]		; C7 D8
	trb $AD22.w		; 1C 22 AD
	and ($04.b)		; 32 04
	phd		; 0B
	cpx $EC1B.w		; EC 1B EC
	ora $2F53.w,Y		; 19 53 2F
	bcs 111.b		; B0 6F
	bcs 101.b		; B0 65
	jmp $08E7.w		; 4C E7 08
	sed		; F8
	cmp ($E3.b,S),Y		; D3 E3
	eor $1B1F8D.l		; 4F 8D 1F 1B
	lda $AD1B.w		; AD 1B AD
	tas		; 1B
	adc $D2.b,X		; 75 D2
	cmp $51.b,X		; D5 51
	adc $59C8.w		; 6D C8 59
	cmp $0BB9.w		; CD B9 0B
	and $21B7.w,Y		; 39 B7 21
	adc [$36.b]		; 67 36
.INDEX 8
	sep #$93		; E2 93
	ldx #$98.b		; A2 98
	lda $46.b		; A5 46
	and #$8A.b		; 29 8A
	mvn $99,$62		; 54 62 99
	jmp ($95A9.w)		; 6C A9 95
	ora $A96C.w,Y		; 19 6C A9
	sta $19.b,X		; 95 19
	jmp ($A6AB.w)		; 6C AB A6
	ldx $98.b		; A6 98
	adc #$86.b		; 69 86
	sty $D3.b,X		; 94 D3
	ora $A629.w		; 0D 29 A6
	inc A		; 1A
	adc $81.b,S		; 63 81
	cmp #$A6.b		; C9 A6
	inc $9B.b,X		; F6 9B
	dec $BAE6.w,X		; DE E6 BA
	txy		; 9B
	dec $BAE6.w,X		; DE E6 BA
	txy		; 9B
	phx		; DA
	adc $F1696B.l		; 6F 6B 69 F1
	sbc $D6.b		; E5 D6
	cmp ($D6.b,S),Y		; D3 D6
	cmp ($E3.b,S),Y		; D3 E3
	wai		; CB
	bmi 112.b		; 30 70
	sed		; F8
	tya		; 98
	jmp ($1F47.w,X)		; 7C 47 1F
.ACCU 16
	rep #$A3		; C2 A3
	lsr A		; 4A
	asl $F5.b		; 06 F5
	tyx		; BB
	ror $F7.b		; 66 F7
	lda $37DB.w		; AD DB 37
	lda $DE6F.w,X		; BD 6F DE
	sta [$85.b]		; 87 85
	adc $8B2F.w,X		; 7D 2F 8B
	rtl		; 6B

	sta $6B8F6F.l		; 8F 6F 8F 6B
	sta $6B8F6F.l		; 8F 6F 8F 6B
	tsa		; 3B
	eor ($A5.b,S),Y		; 53 A5
	sty $DE.b,X		; 94 DE
	lda [$42.b]		; A7 42
	sbc $770B42.l		; EF 42 0B 77
	ply		; 7A
	inc A		; 1A
	sta $4D07.w,X		; 9D 07 4D
	inc $9912.w		; EE 12 99
	lda $53C2.w,X		; BD C2 53
	and [$B8.b],Y		; 37 B8
	lsr A		; 4A
	ror $F7.b		; 66 F7
	ora #$CF4C.w		; 09 4C CF
	sta $2A8D.w		; 8D 8D 2A
	jmp ($6B6C.w,X)		; 7C 6C 6B
	stz $5369.w		; 9C 69 53
	sbc $74.b,S		; E3 74
	adc $75.b		; 65 75
	inc $73.b,X		; F6 73
	ror $5499.w		; 6E 99 54
	stp		; DB
	ldx $D665.w		; AE 65 D6
	cop $B9.b		; 02 B9
	sta [$53.b],Y		; 97 53
	ror $D0A1.w		; 6E A1 D0
	adc $94.b		; 65 94
	rts		; 60

	adc ($D4.b,X)		; 61 D4
	cld		; D8
	inc $B0.b,X		; F6 B0
	nop		; EA
	jmp ($587B.w)		; 6C 7B 58
	adc $36.b,X		; 75 36
	and $9FA0.w,X		; 3D A0 9F
	lda [$DF.b]		; A7 DF
	wai		; CB
	inc A		; 1A
	sta $86FA.w		; 8D FA 86
	lda $7E.b,S		; A3 7E
	.db $42, $58		; 42 58
	xba		; EB
	ldx $CE.b,Y		; B6 CE
	sta [$6E.b],Y		; 97 6E
	ora $5C09.w,X		; 1D 09 5C
	sei		; 78
	.db $62, $57, $8E		; 62 57 8E
	rol $04.b,X		; 36 04
	ldy #$92.b		; A0 92
	trb $68.b		; 14 68
	sty $92.b		; 84 92
	bcs   9.b		; B0 09
	eor ($E3.b)		; 52 E3
	stz $3C.b		; 64 3C
	sty $70.b,X		; 94 70
	jmp ($1D7E.w)		; 6C 7E 1D
	bmi  74.b		; 30 4A
	adc [$87.b]		; 67 87
	eor $68.b		; 45 68
	stz $7F.b		; 64 7F
	ora $BB12AC.l,X		; 1F AC 12 BB
	adc ($E9.b,X)		; 61 E9
	ora $644B88.l		; 0F 88 4B 64
	bit $83.b		; 24 83
	cpy #$F4.b		; C0 F4
	and $CC.b		; 25 CC
	stx $9DC8.w		; 8E C8 9D
	adc ($AA.b,S),Y		; 73 AA
	dey		; 88
	ldx $E7.b,Y		; B6 E7
	and $F5.b,S		; 23 F5
	stp		; DB
	jmp.w [$F4CD]		; DC CD F4
	trb $6B.b		; 14 6B
	sta ($E6.b,S),Y		; 93 E6
	and $3DF5.w		; 2D F5 3D
	sta $5F9F0E.l		; 8F 0E 9F 5F
	sbc $CE3C.w,X		; FD 3C CE
	stx $D0C0.w		; 8E C0 D0
	ldy $164E.w		; AC 4E 16
	sta [$D8.b],Y		; 97 D8
	pea $DD3D.w		; F4 3D DD
	lsr $E7.b,X		; 56 E7
	and $F8.b,S		; 23 F8
	eor $282A6E.l,X		; 5F 6E 2A 28
	sta ($B5.b)		; 92 B5
	pla		; 68
	sbc [$99.b]		; E7 99
	cmp $E0.b,S		; C3 E0
	asl $BBFA.w,X		; 1E FA BB
	ora $28.b		; 05 28
	sed		; F8
	and $1E.b,X		; 35 1E
	adc $D246B9.l,X		; 7F B9 46 D2
	eor ($C9.b,X)		; 41 C9
	and $1BA5FC.l,X		; 3F FC A5 1B
	lsr $A7B5.w		; 4E B5 A7
	eor $6777.w		; 4D 77 67
	sta $7F55.w,X		; 9D 55 7F
	cld		; D8
	tda		; 7B
	ldy $9C.b		; A4 9C
	cmp [$74.b]		; C7 74
	pld		; 2B
	eor $F4FB.w		; 4D FB F4
	ldx $2237.w,Y		; BE 37 22
	sbc [$FB.b],Y		; F7 FB
	tyx		; BB
	inc $2289.w,X		; FE 89 22
	dey		; 88
	stz $068E.w,X		; 9E 8E 06
	sta ($AE.b,S),Y		; 93 AE
	bit #$9597.w		; 89 97 95
	sbc $AED149.l,X		; FF 49 D1 AE
	tsb $15.b		; 04 15
	tda		; 7B
	and ($F9.b)		; 32 F9
	rol A		; 2A
	cpy $57.b		; C4 57
	and #$8A58.w		; 29 58 8A
	sbc $29.b		; E5 29
	stz $71.b		; 64 71
	sta ($C6.b),Y		; 91 C6
	eor [$19.b]		; 47 19
	adc ($5A.b)		; 72 5A
	bit $B4.b		; 24 B4
	.db $62, $48, $89		; 62 48 89
	and $C8.b,S		; 23 C8
	lda $68.b,X		; B5 68
	sta ($D1.b)		; 92 D1
	and $A2.b		; 25 A2
	ora ($E7.b,S),Y		; 13 E7
	tyx		; BB
	stp		; DB
	sbc [$E7.b],Y		; F7 E7
	stz $09BD.w		; 9C BD 09
	sbc [$2F.b]		; E7 2F
	rti		; 40

	and $76.b		; 25 76
	cop $10.b		; 02 10
	jsr ($7F6B.w,X)		; FC 6B 7F
	adc $9512A0.l		; 6F A0 12 95
	cmp ($15.b,X)		; C1 15
	dec $8750.w,X		; DE 50 87
	sbc $F5.b		; E5 F5
	.db $42, $52		; 42 52
	eor $5B.b		; 45 5B
	ora #$0F3D.w		; 09 3D 0F
	rtl		; 6B

	pei ($CC.b)		; D4 CC
	stz $8B12.w		; 9C 12 8B
	lsr $DFD6.w		; 4E D6 DF
	sbc ($4B.b)		; F2 4B
	sbc $2E3E.w,Y		; F9 3E 2E
.ACCU 16
.INDEX 16
	rep #$BD		; C2 BD
.INDEX 8
	sep #$12		; E2 12
	sta $EB.b,S		; 83 EB
	eor $FB.b,X		; 55 FB
	sec		; 38
	ldx $9C1A.w,Y		; BE 1A 9C
	eor ($40.b,S),Y		; 53 40
	sty $A6.b		; 84 A6
	ora ($6E.b,X)		; 01 6E
	lda $B54A.w,X		; BD 4A B5
	ror A		; 6A
	stz $7F.b		; 64 7F
	stp		; DB
	ora ($00.b,X)		; 01 00
	phy		; 5A
	asl A		; 0A
	tya		; 98
	and $CDA106.l,X		; 3F 06 A1 CD
	cmp $93C8E0.l,X		; DF E0 C8 93
	beq -24.b		; F0 E8
	ldx $D9EA.w,Y		; BE EA D9
	cpx $C8.b		; E4 C8
	cmp #$FEDC.w		; C9 DC FE
	cmp $4DDEB8.l,X		; DF B8 DE 4D
	adc $36816F.l,X		; 7F 6F 81 36
	ldx #$3C.b		; A2 3C
	tad		; 5B
	tsa		; 3B
	ldx $C565.w		; AE 65 C5
	eor $E99F0F.l		; 4F 0F 9F E9
	sbc $FE.b,S		; E3 FE
	sbc #$9724.w		; E9 24 97
	stz $1BFA.w		; 9C FA 1B
	jmp ($97A9.w)		; 6C A9 97
	adc [$BF.b],Y		; 77 BF
	plb		; AB
	bmi  -6.b		; 30 FA
	cpx $D7.b		; E4 D7
	cmp $AB.b,S		; C3 AB
	phd		; 0B
	sbc $73FA.w,X		; FD FA 73
	adc ($CF.b,S),Y		; 73 CF
	cmp [$AA.b],Y		; D7 AA
	pla		; 68
	inx		; E8
	ldx $C1BE.w,Y		; BE BE C1
	plb		; AB
	eor ($B1.b)		; 52 B1
	sbc $D184.w,Y		; F9 84 D1
	adc ($FF.b),Y		; 71 FF
	sed		; F8
	sbc $DDDD.w,Y		; F9 DD DD
	adc $104B.w,X		; 7D 4B 10
	and [$CF.b]		; 27 CF
	lda $3C.b,S		; A3 3C
	sta $38F6DF.l		; 8F DF F6 38
	ora $799A.w,X		; 1D 9A 79
	cli		; 58
	tsb $25.b		; 04 25
	bit $87.b,X		; 34 87
	stz $2A67.w		; 9C 67 2A
	stx $4E.b		; 86 4E
	adc $CD5E.w,Y		; 79 5E CD
	adc $F162.w		; 6D 62 F1
	stx $B1.b		; 86 B1
	sta $BD5356.l,X		; 9F 56 53 BD
	adc ($4F.b)		; 72 4F
	dec $C9D1.w,X		; DE D1 C9
	plb		; AB
	cld		; D8
	dec $E2.b		; C6 E2
	adc ($CC.b,X)		; 61 CC
	sbc ($FD.b),Y		; F1 FD
	cmp ($DD.b,S),Y		; D3 DD
	bit $EF.b		; 24 EF
	lda $FDBD.w,Y		; B9 BD FD
	rts		; 60

	and $1FDE28.l,X		; 3F 28 DE 1F
	bit $24D0.w		; 2C D0 24
	sbc $6CAB3F.l,X		; FF 3F AB 6C
	dec $3FD7.w,X		; DE D7 3F
	sbc #$A719.w		; E9 19 A7
	sbc ($14.b),Y		; F1 14
	lda $85.b,S		; A3 85
	sbc $5062.w,Y		; F9 62 50
	ldx $F6.b		; A6 F6
	stx $6E.b		; 86 6E
	adc ($FC.b,X)		; 61 FC
	inc $D0.b		; E6 D0
	sta ($0E.b,S),Y		; 93 0E
	stx $09.b		; 86 09
	sbc $AC07.w,X		; FD 07 AC
	ror $94.b		; 66 94
	plb		; AB
	cmp $C2C6.w		; CD C6 C2
	ror $05.b,X		; 76 05
	bit $6DAA.w		; 2C AA 6D
	sbc $9BD1ED.l,X		; FF ED D1 9B
	jmp $5DC095.l		; 5C 95 C0 5D
	sta $D3.b,X		; 95 D3
	ldy #$39.b		; A0 39
	bne 115.b		; D0 73
	sbc $01B9.w		; ED B9 01
	cmp $65.b,S		; C3 65
	mvp $88,$F8		; 44 F8 88
	rol $47.b,X		; 36 47
	lda $BA5D.w,X		; BD 5D BA
	xba		; EB
	tyx		; BB
	inc $F6F0.w		; EE F0 F6
	cmp $B75B.w,Y		; D9 5B B7
	rol $D9.b,X		; 36 D9
	tad		; 5B
	lda [$36.b],Y		; B7 36
	cmp $B75B.w,Y		; D9 5B B7
	bit $B8FA.w		; 2C FA B8
	lda [$19.b],Y		; B7 19
	txy		; 9B
	tsb $8C5B.w		; 0C 5B 8C
	cmp $2D86.w		; CD 86 2D
	dec $66.b		; C6 66
	cmp $16.b,S		; C3 16
	sbc $B7.b,S		; E3 B7
	cpx $E5.b		; E4 E5
	plb		; AB
	and $5945.w		; 2D 45 59
	ror A		; 6A
	wai		; CB
	eor ($56.b),Y		; 51 56
	phy		; 5A
	lda ($D5.b)		; B2 D5
	adc $2A83.w,X		; 7D 83 2A
	.db $62, $A6, $DD		; 62 A6 DD
	cmp $9ABB.w		; CD BB 9A
	lda #$73B7.w		; A9 B7 73
	ror $F5E6.w		; 6E E6 F5
	rol $FC.b,X		; 36 FC
	cmp $59.b,X		; D5 59
	tas		; 1B
	dec $E33B.w		; CE 3B E3
	adc $7CC7.w,Y		; 79 C7 7C
	adc $B3F038.l		; 6F 38 F0 B3
	txy		; 9B
	adc ($16.b)		; 72 16
	adc ($6E.b,S),Y		; 73 6E
	.db $42, $CE		; 42 CE
	adc $59C8.w		; 6D C8 59
	cmp $46FC.w		; CD FC 46
	and #$8A51.w		; 29 51 8A
	.db $62, $95, $18		; 62 95 18
	ldx $29.b		; A6 29
	sbc ($9A.b)		; F2 9A
	eor ($4C.b,S),Y		; 53 4C
	bit $A6.b,X		; 34 A6
	tya		; 98
	adc #$9486.w		; 69 86 94
	cmp ($0D.b,S),Y		; D3 0D
	pld		; 2B
	lda $A6AE.w,Y		; B9 AE A6
	sbc [$B9.b],Y		; F7 B9
	ldx $F6A6.w		; AE A6 F6
	txy		; 9B
	dec $BAE6.w,X		; DE E6 BA
	txy		; 9B
	phx		; DA
	bpl -14.b		; 10 F2
	mvn $9A,$D2		; 54 D2 9A
	lsr $4A.b,X		; 56 4A
	txs		; 9A
	eor ($4A.b,S),Y		; 53 4A
	cmp #$4C53.w		; C9 53 4C
	eor ($6F.b)		; 52 6F
	ora $9BA53F.l,X		; 1F 3F A5 9B
	tad		; 5B
	and [$A5.b],Y		; 37 A5
	txy		; 9B
	inc $D566.w		; EE 66 D5
	cmp $6EE9.w		; CD E9 6E
	lda $5AE7.w		; AD E7 5A
	dec $9DB7.w		; CE B7 9D
	rtl		; 6B

	dec A		; 3A
	dec $AC75.w,X		; DE 75 AC
	xba		; EB
	adc $B3D6.w,Y		; 79 D6 B3
	lda $75AA.w,X		; BD AA 75
	lda #$1AE2.w		; A9 E2 1A
	adc [$10.b]		; 67 10
	cmp ($38.b,S),Y		; D3 38
	stx $99.b		; 86 99
	lda $53C2.w,X		; BD C2 53
	bit $F0.b,X		; 34 F0
	ldx $D1.b		; A6 D1
	sbc $E7.b		; E5 E7
	adc ($7B.b,S),Y		; 73 7B
	jmp.w [$EEBC]		; DC BC EE
	lsr $4676.w,X		; 5E 76 46
	xce		; FB
	ldx #$AE.b		; A2 AE
	lda $A5.b		; A5 A5
	eor $04A7.w,X		; 5D A7 04
	cmp $26F8F8.l,X		; DF F8 F8 26
	sbc $EAB7C7.l,X		; FF C7 B7 EA
	lsr $CF.b,X		; 56 CF
	cmp $FACC3A.l		; CF 3A CC FA
	cmp $9AEB.w,Y		; D9 EB 9A
	cmp $A8F0.w,Y		; D9 F0 A8
	ldx #$A3.b		; A2 A3
	tsb $96.b		; 04 96
	phd		; 0B
	tsb $96.b		; 04 96
	ora $EB910F.l		; 0F 0F 91 EB
	adc $34D2E4.l		; 6F E4 D2 34
	ldy $D2.b		; A4 D2
	sta ($48.b,S),Y		; 93 48
	cmp ($93.b)		; D2 93
	eor #$BA4C.w		; 49 4C BA
	adc [$95.b],Y		; 77 95
	eor $CA3B.w,X		; 5D 3B CA
	ldx $E59D.w		; AE 9D E5
	eor [$4E.b],Y		; 57 4E
	sbc ($A9.b)		; F2 A9
	sta $5132.w		; 8D 32 51
	sta $5132.w		; 8D 32 51
	cmp $E0CC.w,Y		; D9 CC E0
	cmp [$DA.b],Y		; D7 DA
	adc $F6.b,X		; 75 F6
	sta $6DB9.w,X		; 9D B9 6D
	phk		; 4B
	sbc $C4CB.w		; ED CB C4
	sta [$C5.b],Y		; 97 C5
	lda $2C5896.l		; AF 96 58 2C
	bpl -97.b		; 10 9F
	rts		; 60

	trb $DE15.w		; 1C 15 DE
	cmp #$4C32.w		; C9 32 4C
	sta ($B8.b)		; 92 B8
	inx		; E8
	lda $BD.b,S		; A3 BD
	sbc ($DE.b)		; F2 DE
	ora [$E7.b],Y		; 17 E7
	sbc #$A394.w		; E9 94 A3
	eor $F7.b		; 45 F7
	sbc $72D9.w,Y		; F9 D9 72
	trb $CA.b		; 14 CA
	ldy #$68.b		; A0 68
	cpy $41A5.w		; CC A5 41
	cmp ($5F.b)		; D2 5F
	lda $3FBE.w,Y		; B9 BE 3F
	bit $FB.b,X		; 34 FB
	sbc $C3.b		; E5 C3
	sta ($A3.b)		; 92 A3
	pla		; 68
	eor $AA.b,X		; 55 AA
	beq  68.b		; F0 44
	lda $8D31B9.l		; AF B9 31 8D
	eor $96.b,S		; 43 96
	adc ($4B.b,S),Y		; 73 4B
	sty $79.b		; 84 79
	wai		; CB
	lsr $99.b,X		; 56 99
	lsr A		; 4A
	eor $C7A73A.l		; 4F 3A A7 C7
	lda ($91.b,X)		; A1 91
	brk $CD.b		; 00 CD
	and ($FD.b),Y		; 31 FD
	ply		; 7A
	bmi -83.b		; 30 AD
	lda $E5BF.w,X		; BD BF E5
	rtl		; 6B

	eor ($64.b,S),Y		; 53 64
	mvn $DA,$53		; 54 53 DA
	adc ($86.b,X)		; 61 86
	txs		; 9A
	adc ($86.b,X)		; 61 86
	txs		; 9A
	adc ($86.b,X)		; 61 86
	txs		; 9A
	adc ($86.b,X)		; 61 86
	sta ($20.b,S),Y		; 93 20
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $79.b		; 06 79
	brk $10.b		; 00 10
	asl $8F.b		; 06 8F
	ora ($90.b)		; 12 90
	brk $00.b		; 00 00
	sta ($90.b),Y		; 91 90
	bcc -110.b		; 90 92
	brk $8E.b		; 00 8E
	sta ($92.b,S),Y		; 93 92
	sta ($94.b)		; 92 94
	sta ($91.b),Y		; 91 91
	sta $93.b,X		; 95 93
	sta ($96.b,S),Y		; 93 96
	sty $94.b,X		; 94 94
	sta [$95.b],Y		; 97 95
	sta $98.b,X		; 95 98
	stx $96.b,Y		; 96 96
	sta $9797.w,Y		; 99 97 97
	txs		; 9A
	tya		; 98
	tya		; 98
	txy		; 9B
	sta $9C99.w,Y		; 99 99 9C
	txs		; 9A
	txs		; 9A
	sta $9B9B.w,X		; 9D 9B 9B
	stz $9C9C.w,X		; 9E 9C 9C
	sta $A09D9D.l,X		; 9F 9D 9D A0
	stz $A19E.w,X		; 9E 9E A1
	sta $00409F.l,X		; 9F 9F 40 00
	jsr $0400.w		; 20 00 04
	ora $A0.b,S		; 03 A0
	stz $989C.w,X		; 9E 9C 98
	stx $94.b,Y		; 96 94
	bcc   1.b		; 90 01
	txs		; 9A
	tya		; 98
	sta ($00.b),Y		; 91 00
	cop $04.b		; 02 04
	ora $04.b,S		; 03 04
	tsb $04.b		; 04 04
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	php		; 08
	ora $001000.l		; 0F 00 10 00
	ora ($94.b),Y		; 11 94
	brk $12.b		; 00 12
	brk $13.b		; 00 13
	tya		; 98
	stx $91.b,Y		; 96 91
	brk $14.b		; 00 14
	brk $15.b		; 00 15
	php		; 08
	asl $00.b,X		; 16 00
	ora [$00.b],Y		; 17 00
	clc		; 18
	php		; 08
	ora $1A08.w,Y		; 19 08 1A
	brk $1B.b		; 00 1B
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	brk $1E.b		; 00 1E
	php		; 08
	ora $002000.l,X		; 1F 00 20 00
	and ($00.b,X)		; 21 00
	jsl $042300.l		; 22 00 23 04
	bit $04.b		; 24 04
	and $04.b		; 25 04
	rol $04.b		; 26 04
	and [$04.b]		; 27 04
	plp		; 28
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2B.b		; 00 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2E.b		; 00 2E
	brk $2F.b		; 00 2F
	php		; 08
	bmi   8.b		; 30 08
	and ($08.b),Y		; 31 08
	and ($00.b)		; 32 00
	and ($00.b,S),Y		; 33 00
	bit $00.b,X		; 34 00
	and $00.b,X		; 35 00
	rol $00.b,X		; 36 00
	and [$00.b],Y		; 37 00
	sec		; 38
	php		; 08
	and $3A08.w,Y		; 39 08 3A
	brk $3B.b		; 00 3B
	tsb $3C.b		; 04 3C
	tsb $3D.b		; 04 3D
	tsb $3E.b		; 04 3E
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	tsb $41.b		; 04 41
	tsb $41.b		; 04 41
	mvp $08,$42		; 44 42 08
	eor $08.b,S		; 43 08
	mvp $45,$00		; 44 00 45
	brk $45.b		; 00 45
	brk $45.b		; 00 45
	sta ($90.b),Y		; 91 90
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	php		; 08
	pha		; 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4B.b		; 00 4B
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
	brk $57.b		; 00 57
	brk $58.b		; 00 58
	brk $59.b		; 00 59
	brk $5A.b		; 00 5A
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	brk $5D.b		; 00 5D
	brk $5E.b		; 00 5E
	brk $5F.b		; 00 5F
	tsb $60.b		; 04 60
	tsb $61.b		; 04 61
	tsb $62.b		; 04 62
	tsb $63.b		; 04 63
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
	php		; 08
	adc $00.b,X		; 75 00
	ror $04.b,X		; 76 04
	adc [$04.b],Y		; 77 04
	sei		; 78
	tsb $79.b		; 04 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	php		; 08
	ror $7F08.w,X		; 7E 08 7F
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	brk $88.b		; 00 88
	brk $89.b		; 00 89
	brk $8A.b		; 00 8A
	brk $8B.b		; 00 8B
	php		; 08
	sty $8D00.w		; 8C 00 8D
	lda ($A1.b,X)		; A1 A1
	lda ($9D.b,X)		; A1 9D
	ldy #$A0.b		; A0 A0
	sta $260000.l		; 8F 00 00 26
	xce		; FB
	brk $08.b		; 00 08
	beq   4.b		; F0 04
	brk $47.b		; 00 47
	lda $5C.b		; A5 5C
	ldx $65.b,Y		; B6 65
	asl $36.b,X		; 16 36
	ora $02.b,X		; 15 02
	php		; 08
	iny		; C8
	php		; 08
	trb $1004.w		; 1C 04 10
	jsr $41A0.w		; 20 A0 41
	php		; 08
	.db $62, $E0, $A1		; 62 E0 A1
	sbc [$59.b],Y		; F7 59
	and ($61.b)		; 32 61
	cpy #$45.b		; C0 45
	tsb $50.b		; 04 50
	sty $4C.b,X		; 94 4C
	sta ($49.b)		; 92 49
	bit $58ED.w		; 2C ED 58
	sta $8F.b		; 85 8F
	jmp ($6424.w)		; 6C 24 64
	lsr A		; 4A
	stz $83.b		; 64 83
	sta ($EA.b,S),Y		; 93 EA
	ror $C992.w		; 6E 92 C9
	rol $5B9B.w		; 2E 9B 5B
	cpx $28D1.w		; EC D1 28
	txa		; 8A
	sta $39.b,X		; 95 39
	eor #$9B74.w		; 49 74 9B
	iny		; C8
	sta $6323.w,Y		; 99 23 63
	cpx $91.b		; E4 91
	pha		; 48
	bit #$C9B6.w		; 89 B6 C9
	and $B3.b		; 25 B3
	adc $93A4.w,Y		; 79 A4 93
	sbc $9265.w,Y		; F9 65 92
	eor #$9327.w		; 49 27 93
	phk		; 4B
	bit $4C.b		; 24 4C
	txs		; 9A
	eor #$8C2E.w		; 49 2E 8C
	plx		; FA
	tad		; 5B
	rol $96.b		; 26 96
	eor #$24A2.w		; 49 A2 24
	lda $D6E549.l,X		; BF 49 E5 D6
	wai		; CB
	rol $6BB6.w,X		; 3E B6 6B
	bit $96.b		; 24 96
	eor $926C.w,Y		; 59 6C 92
	cmp #$B364.w		; C9 64 B3
	eor #$922C.w		; 49 2C 92
	eor #$92AD.w		; 49 AD 92
	wai		; CB
	and $91.b		; 25 91
	rol $EB21.w,X		; 3E 21 EB
	and ($09.b,S),Y		; 33 09
	sbc $B8.b,X		; F5 B8
	cpx $68.b		; E4 68
	cmp ($DF.b),Y		; D1 DF
	sbc #$E362.w		; E9 62 E3
	inc $9D.b		; E6 9D
	adc $07.b,S		; 63 07
	dec $97.b,X		; D6 97
	lda ($3F.b,X)		; A1 3F
	sbc $C1.b,X		; F5 C1
	inc $DFD5.w		; EE D5 DF
	and [$72.b],Y		; 37 72
	adc $684E.w		; 6D 4E 68
	sta $5DCA53.l,X		; 9F 53 CA 5D
	ldx $CBBE.w,Y		; BE BE CB
	sta $F6.b,X		; 95 F6
	sec		; 38
	eor #$3FF2.w		; 49 F2 3F
	adc $4B3E.w,X		; 7D 3E 4B
	rts		; 60

	sta $4FA625.l,X		; 9F 25 A6 4F
	sta ($CC.b)		; 92 CC
	sec		; 38
	sta $4FCB25.l,X		; 9F 25 CB 4F
	sta ($96.b)		; 92 96
	sta $3E1923.l,X		; 9F 23 19 3E
	lda [$15.b]		; A7 15
	adc ($98.b,S),Y		; 73 98
	lda [$21.b]		; A7 21
	bit #$5118.w		; 89 18 51
	and ($D8.b),Y		; 31 D8
	tda		; 7B
	jmp $2A7DB7.l		; 5C B7 7D 2A
	adc [$6B.b]		; 67 6B
	rol A		; 2A
	ora $8E.b,S		; 03 8E
	eor $DD3CEB.l,X		; 5F EB 3C DD
	adc $4FF5.w,Y		; 79 F5 4F
	dey		; 88
	stp		; DB
	sta $8542.w,X		; 9D 42 85
	ldy $32.b,X		; B4 32
	sta ($BC.b)		; 92 BC
	lda ($C7.b)		; B2 C7
	cmp $9FB0.w		; CD B0 9F
	sty $BC.b,X		; 94 BC
	cmp [$FF.b]		; C7 FF
	plx		; FA
	dex		; CA
	lda [$30.b],Y		; B7 30
	and [$C8.b]		; 27 C8
	wai		; CB
	eor $158992.l		; 4F 92 89 15
	rol $5C46.w,X		; 3E 46 5C
	ora #$B5F7.w		; 09 F7 B5
	dec $D4.b		; C6 D4
	eor #$D82A.w		; 49 2A D8
	sta $B11E.w,Y		; 99 1E B1
	stx $35.b,Y		; 96 35
	stz $E3.b,X		; 74 E3
	bit $42.b,X		; 34 42
	adc $280F.w,X		; 7D 0F 28
	lsr $B96D.w,X		; 5E 6D B9
	tyx		; BB
	and #$F789.w		; 29 89 F7
	bit $0BE6.w,X		; 3C E6 0B
	.db $82, $7D, $6E		; 82 7D 6E
	sec		; 38
	xba		; EB
	ldy $D096.w,X		; BC 96 D0
	ora ($E9.b,S),Y		; 13 E9
	cmp $71BA.w		; CD BA 71
	and ($95.b,X)		; 21 95
	eor [$6C.b],Y		; 57 6C
	stp		; DB
	pei ($AC.b)		; D4 AC
	lda $1B.b,X		; B5 1B
	ply		; 7A
	sta $1CD04C.l,X		; 9F 4C D0 1C
	and $6A.b,S		; 23 6A
	adc $873E61.l,X		; 7F 61 3E 87
	stz $A696.w,X		; 9E 96 A6
	lda #$E0F2.w		; A9 F2 E0
	dex		; CA
	.db $42, $9F		; 42 9F
	bit $E2.b		; 24 E2
	adc $6B11.w,X		; 7D 11 6B
	adc $D7.b,S		; 63 D7
	tyx		; BB
	ora $99.b,X		; 15 99
	and $C8.b,S		; 23 C8
	ora ($4C.b)		; 12 4C
	xce		; FB
	eor $3B.b		; 45 3B
	xce		; FB
	lda ($AB.b,S),Y		; B3 AB
	pea $147C.w		; F4 7C 14
	ora $F212.w,X		; 1D 12 F2
	lsr $84B4.w		; 4E B4 84
	ldy #$34.b		; A0 34
	asl $89.b		; 06 89
	and #$A6FA.w		; 29 FA A6
	sbc $76E8.w,X		; FD E8 76
	sta $CEF0.w		; 8D F0 CE
	and $4F38.w,Y		; 39 38 4F
	lda [$67.b]		; A7 67
	cpx #$EF.b		; E0 EF
	ror $FD.b		; 66 FD
	tas		; 1B
	lda $3F1D.w,Y		; B9 1D 3F
	stx $AA.b,Y		; 96 AA
	adc $D7B2.w,X		; 7D B2 D7
	adc $66DB2E.l		; 6F 2E DB 66
	sta ($4E.b)		; 92 4E
	and $2512.w,Y		; 39 12 25
	stz $55.b,X		; 74 55
	asl $B2.b,X		; 16 B2
	and $758A6D.l,X		; 3F 6D 8A 75
	dec $30.b,X		; D6 30
	and [$A6.b],Y		; 37 A6
	dex		; CA
	adc $85.b,X		; 75 85
	asl $FFBE.w,X		; 1E BE FF
	lda $5C1FBF.l		; AF BF 1F 5C
.ACCU 8
.INDEX 8
	sep #$73		; E2 73
	and [$3B.b]		; 27 3B
	cpx #$7B.b		; E0 7B
	sbc $A253.w,X		; FD 53 A2
	adc $0B.b,X		; 75 0B
	cmp ($04.b,S),Y		; D3 04
	ldy #$50.b		; A0 50
	rol A		; 2A
	ora $660E.w,Y		; 19 0E 66
	asl $8D83.w,X		; 1E 83 8D
	ldx $B8FF.w,Y		; BE FF B8
	dec $FD.b		; C6 FD
	sei		; 78
	jmp ($A1CE.w)		; 6C CE A1
	eor $0B.b,X		; 55 0B
	cmp #$F4.b		; C9 F4
	lda ($FC.b)		; B2 FC
	jmp $0ADFFE.l		; 5C FE DF 0A
	cmp $2B.b,S		; C3 2B
	cmp [$F1.b]		; C7 F1
	lda $2DC48C.l,X		; BF 8C C4 2D
	asl $C5.b,X		; 16 C5
	ora ($63.b,S),Y		; 13 63
	nop		; EA
	rol $4E7F.w		; 2E 7F 4E
	tyx		; BB
	stx $E8.b		; 86 E8
	sty $E9.b		; 84 E9
	jsr $9BDE.w		; 20 DE 9B
.INDEX 16
	rep #$99		; C2 99
	ora ($3E.b,X)		; 01 3E
	bit $F8.b		; 24 F8
	phx		; DA
	sbc ($68.b,S),Y		; F3 68
	cld		; D8
	bcs  98.b		; B0 62
	sbc [$62.b]		; E7 62
	bvs -83.b		; 70 AD
	and [$16.b],Y		; 37 16
	lsr $7A.b		; 46 7A
	sta $F4C52B.l		; 8F 2B C5 F4
	pea $B79D.w		; F4 9D B7
	xce		; FB
	sbc ($B6.b),Y		; F1 B6
	eor $EEE6.w,X		; 5D E6 EE
	sbc [$51.b]		; E7 51
	and $5032.w		; 2D 32 50
	inx		; E8
	dec $B2.b		; C6 B2
	asl $42.b,X		; 16 42
	dec $88.b		; C6 88
	sty $0A.b		; 84 0A
	and $02.b		; 25 02
	sta $4F.b		; 85 4F
	ora ($A5.b)		; 12 A5
	jmp.w [$9A31]		; DC 31 9A
	inx		; E8
	bit $02.b,X		; 34 02
	adc ($70.b),Y		; 71 70
	adc [$C3.b]		; 67 C3
	ror $1B5C.w,X		; 7E 5C 1B
	lda ($99.b)		; B2 99
	pha		; 48
	pla		; 68
	tsb $16.b		; 04 16
	rol $B8.b		; 26 B8
	sta ($7E.b)		; 92 7E
	and $BD.b,S		; 23 BD
	bit $64.b,X		; 34 64
	brk $F1.b		; 00 F1
	ldy $6C.b,X		; B4 6C
	cmp ($E1.b,S),Y		; D3 E1
	adc [$50.b]		; 67 50
	ldy #$4A75.w		; A0 75 4A
	ldy $B7.b		; A4 B7
	tay		; A8
	ror $51.b,X		; 76 51
	eor [$0C.b]		; 47 0C
	cmp $0AC30E.l		; CF 0E C3 0A
	bit $4908.w		; 2C 08 49
	and #$72.b		; 29 72
	inc $CD.b		; E6 CD
	lda [$9B.b],Y		; B7 9B
	adc [$3D.b]		; 67 3D
	sbc $812A.w		; ED 2A 81
	rol $2446.w,X		; 3E 46 24
	mvp $1C,$FA		; 44 FA 1C
	phb		; 8B
	asl $24.b,X		; 16 24
	eor $EE8F29.l,X		; 5F 29 8F EE
	cli		; 58
	cpx $5C.b		; E4 5C
	mvn $4E,$6B		; 54 6B 4E
	and [$B2.b]		; 27 B2
	eor $01801D.l,X		; 5F 1D 80 01
	lda ($93.b)		; B2 93
	adc ($3A.b)		; 72 3A
	cmp $9090.w,Y		; D9 90 90
	adc $7E9B.w		; 6D 9B 7E
	stp		; DB
	.db $82, $69, $2C		; 82 69 2C
	tyx		; BB
	and #$49.b		; 29 49
	sta [$3E.b]		; 87 3E
	cmp $27FF5C.l,X		; DF 5C FF 27
	ora $BA3C.w,Y		; 19 3C BA
	asl A		; 0A
	ora [$89.b],Y		; 17 89
	ldy $F1.b		; A4 F1
	sbc $96.b,S		; E3 96
	bit $94.b		; 24 94
	cli		; 58
	lda $6B97.w,Y		; B9 97 6B
	asl $83DF.w		; 0E DF 83
	sty $E4.b,X		; 94 E4
	inc $69AA.w,X		; FE AA 69
	and $01.b		; 25 01
	plp		; 28
	ora #$84.b		; 09 84
	adc $12.b,S		; 63 12
	bit $95.b		; 24 95
	stz $18.b,X		; 74 18
	bvc -51.b		; 50 CD
	jsr $8D29.w		; 20 29 8D
	ora ($4A.b)		; 12 4A
	cmp $B173.w		; CD 73 B1
	adc $91D0A3.l,X		; 7F A3 D0 91
	adc $A686.w,Y		; 79 86 A6
	sty $FA.b		; 84 FA
	sbc $A6.b,S		; E3 A6
	rol A		; 2A
	nop		; EA
	jmp $9214EB.l		; 5C EB 14 92
	cmp $26.b		; C5 26
	and ($09.b,X)		; 21 09
	php		; 08
	eor #$2E.b		; 49 2E
	cmp $4254.w,Y		; D9 54 42
	ora ($10.b)		; 12 10
	sta ($51.b)		; 92 51
	jsl $C5A361.l		; 22 61 A3 C5
	cmp $D4C7.w		; CD C7 D4
	stz $75A6.w		; 9C A6 75
	eor ($49.b)		; 52 49
	sbc $D8BC.w		; ED BC D8
	ror $9B.b		; 66 9B
	inc $60.b		; E6 60
	lda ($A8.b,S),Y		; B3 A8
	and [$DD.b]		; 27 DD
	and $DB4F.w		; 2D 4F DB
	adc ($27.b,X)		; 61 27
	iny		; C8
	.db $82, $7C, $84		; 82 7C 84
	adc [$23.b]		; 67 23
	lda $12.b		; A5 12
	rol $43.b		; 26 43
	jsr $68EE.w		; 20 EE 68
	sbc [$9A.b]		; E7 9A
	lda ($62.b,S),Y		; B3 62
	stz $D2.b,X		; 74 D2
	adc $B0E9.w,Y		; 79 E9 B0
	rti		; 40

	cld		; D8
	brk $AA.b		; 00 AA
	lsr $EA13.w		; 4E 13 EA
	cmp ($A8.b)		; D2 A8
	trb $18.b		; 14 18
	lda ($72.b,S),Y		; B3 72
	and [$C8.b]		; 27 C8
	and $B36D.w,X		; 3D 6D B3
	eor $C7C4BD.l		; 4F BD C4 C7
	sta ($EF.b,S),Y		; 93 EF
	plb		; AB
	eor $B8AF.w,Y		; 59 AF B8
	eor $75AEBD.l		; 4F BD AE 75
	cmp $4B.b		; C5 4B
	plx		; FA
	adc ($70.b)		; 72 70
	ora $25F2.w,X		; 1D F2 25
	pla		; 68
	cpx $C7.b		; E4 C7
	ldx $43D6.w,Y		; BE D6 43
	bit $ED.b,X		; 34 ED
	ora $4465DA.l		; 0F DA 65 44
	ror $108E.w		; 6E 8E 10
	cld		; D8
	sbc $EE1B.w,Y		; F9 1B EE
	eor ($9C.b,X)		; 41 9C
	and $CB8B80.l,X		; 3F 80 8B CB
	sta $A91F.w		; 8D 1F A9
	sbc ($F6.b)		; F2 F6
	and $6B.b,X		; 35 6B
	bit $59CD.w		; 2C CD 59
	ply		; 7A
	bit $CB70.w,X		; 3C 70 CB
	and ($60.b,S),Y		; 33 60
	cmp $B9FB.w		; CD FB B9
	adc ($0E.b,S),Y		; 73 0E
	ror A		; 6A
	cmp $3947CF.l		; CF CF 47 39
	eor ($EB.b,S),Y		; 53 EB
	eor ($B8.b,X)		; 41 B8
	cpy #$4FD7.w		; C0 D7 4F
	plp		; 28
	sed		; F8
	ora $B9.b		; 05 B9
	cmp $F36B67.l		; CF 67 6B F3
	adc $3416.w,X		; 7D 16 34
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	rol $D4.b		; 26 D4
	sbc $EFC8E6.l,X		; FF E6 C8 EF
	eor $5FFD.w		; 4D FD 5F
	bit $13E7.w,X		; 3C E7 13
	and ($76.b,S),Y		; 33 76
	sbc $B6C4.w		; ED C4 B6
	iny		; C8
	cpx $60.b		; E4 60
	adc $7A.b,S		; 63 7A
	clc		; 18
	cpx $6B0F.w		; EC 0F 6B
	beq -15.b		; F0 F1
	rol $EA.b,X		; 36 EA
	and $5C.b,S		; 23 5C
	plb		; AB
	cli		; 58
	cmp [$37.b],Y		; D7 37
	lda $1ED3.w,X		; BD D3 1E
	bpl -92.b		; 10 A4
	ora $E63113.l,X		; 1F 13 31 E6
	cmp [$F0.b],Y		; D7 F0
	adc $79.b		; 65 79
	sec		; 38
	clc		; 18
	xba		; EB
	jmp.w [$479F]		; DC 9F 47
	lda $9CCA.w		; AD CA 9C
	sbc ($E3.b),Y		; F1 E3
	cld		; D8
	plb		; AB
	cmp $A752.w,Y		; D9 52 A7
	sbc $C1A2.w,Y		; F9 A2 C1
	tda		; 7B
	sta ($E8.b,S),Y		; 93 E8
	sta $2D1F.w,X		; 9D 1F 2D
	ora $D6671E.l,X		; 1F 1E 67 D6
	sbc ($7D.b),Y		; F1 7D
	and $4B27.w,X		; 3D 27 4B
	ora $C9CB.w,Y		; 19 CB C9
	stz $CE.b,X		; 74 CE
	dey		; 88
	and ($A9.b)		; 32 A9
	bmi  -9.b		; 30 F7
	sta $854F12.l		; 8F 12 4F 85
	cpx $EDFC.w		; EC FC ED
	cpy $19.b		; C4 19
	lda ($88.b,S),Y		; B3 88
	rts		; 60

	stz $CFA3.w		; 9C A3 CF
	trb $3D3C.w		; 1C 3C 3D
	sta ($AD.b,X)		; 81 AD
	dec $74.b		; C6 74
	ldy $7EAA.w,X		; BC AA 7E
	sta $14.b		; 85 14
	bit $E67A.w,X		; 3C 7A E6
	ldx #$E7.b		; A2 E7
	cmp $0AD6.w		; CD D6 0A
	eor $E7.b		; 45 E7
	adc $C4B9.w,X		; 7D B9 C4
	adc $7B.b,X		; 75 7B
	stz $F405.w,X		; 9E 05 F4
	and $FBDD33.l		; 2F 33 DD FB
	sta $4F6927.l,X		; 9F 27 69 4F
	tsb $18D7.w		; 0C D7 18
	sbc [$13.b],Y		; F7 13
	bmi -57.b		; 30 C7
	ldy $9E.b,X		; B4 9E
	inc $0A5F.w,X		; FE 5F 0A
	tsx		; BA
	lda [$A5.b]		; A7 A5
	ldx $F5.b		; A6 F5
	rol $C627.w		; 2E 27 C6
	lda #$5A.b		; A9 5A
	rol A		; 2A
	lda $22.b		; A5 22
	ora [$74.b]		; 07 74
	sbc $FD3FB3.l,X		; FF B3 3F FD
	inc $486A.w		; EE 6A 48
	sta $3CEFDD.l,X		; 9F DD EF 3C
	ora ($28.b,S),Y		; 13 28
	adc $4C.b		; 65 4C
	sbc #$FF.b		; E9 FF
	sta $28C148.l		; 8F 48 C1 28
	and ($41.b,S),Y		; 33 41
	inc $7E67.w		; EE 67 7E
	tsb $0F56.w		; 0C 56 0F
	adc ($4D.b)		; 72 4D
	jsl $1C4614.l		; 22 14 46 1C
	sta [$65.b],Y		; 97 65
	asl $719E.w		; 0E 9E 71
	ora #$09.b		; 09 09
	php		; 08
	phx		; DA
	ldy $7C63.w,X		; BC 63 7C
	jmp.w [$6B63]		; DC 63 6B
	lda #$56.b		; A9 56
	pei ($ED.b)		; D4 ED
	ror $6D4D.w,X		; 7E 4D 6D
	eor #$96.b		; 49 96
	eor $87AF.w,Y		; 59 AF 87
	cpy $F5.b		; C4 F5
	stp		; DB
	jmp.w [$6868]		; DC 68 68
	sbc $38BA.w,X		; FD BA 38
	lda $1BDA.w,Y		; B9 DA 1B
	sbc $8B8E.w,X		; FD 8E 8B
	cmp ($F2.b),Y		; D1 F2
	cpx $4F.b		; E4 4F
	sbc ($39.b,S),Y		; F3 39
	lda ($B0.b),Y		; B1 B0
	ror $4869.w		; 6E 69 48
	sep #$C9		; E2 C9
	ldx $FB9D.w,Y		; BE 9D FB
	sbc ($21.b,X)		; E1 21
	and ($1A.b,X)		; 21 1A
	trb $AF.b		; 14 AF
	adc $A495.w,Y		; 79 95 A4
	sbc ($C6.b)		; F2 C6
	ora $5C5D.w		; 0D 5D 5C
	adc $2B.b,X		; 75 2B
	adc ($E6.b,S),Y		; 73 E6
	jsr ($FAAD.w,X)		; FC AD FA
	sta $A6.b		; 85 A6
	eor $99.b,S		; 43 99
	inc A		; 1A
	stx $7646.w		; 8E 46 76
	ror $A5.b,X		; 76 A5
	adc $841E.w,X		; 7D 1E 84
	lda $BCB88B.l		; AF 8B B8 BC
	stp		; DB
	ora $EC.b,X		; 15 EC
	bit $E7.b,X		; 34 E7
	cmp $AE38.w,X		; DD 38 AE
	dec $B548.w,X		; DE 48 B5
	adc $9EFEE3.l		; 6F E3 FE 9E
	adc [$B1.b],Y		; 77 B1
	jmp ($2D4C.w)		; 6C 4C 2D
	lda [$47.b]		; A7 47
	lda $1A9DB1.l,X		; BF B1 9D 1A
	sty $2C8E.w		; 8C 8E 2C
	cmp $11A615.l		; CF 15 A6 11
	php		; 08
	plx		; FA
	tay		; A8
	ora ($4F.b,S),Y		; 13 4F
	inc $6D.b		; E6 6D
	tsb $7831.w		; 0C 31 78
	bvc  26.b		; 50 1A
	pha		; 48
	and $5913.w,X		; 3D 13 59
	asl $1CB2.w		; 0E B2 1C
	sta $5B60.w,Y		; 99 60 5B
	txs		; 9A
	cpx #$00.b		; E0 00
	sty $C833.w		; 8C 33 C8
	and ($06.b,S),Y		; 33 06
	jmp $13DF.w		; 4C DF 13
	iny		; C8
	pha		; 48
	asl A		; 0A
	lda [$AC.b]		; A7 AC
	eor [$98.b],Y		; 57 98
	sbc ($C6.b),Y		; F1 C6
	cmp $3629.w		; CD 29 36
	lda ($48.b,X)		; A1 48
	sbc $AFA886.l,X		; FF 86 A8 AF
	lda $DD.b,S		; A3 DD
	sbc $2FF430.l		; EF 30 F4 2F
	adc ($7D.b)		; 72 7D
	sbc $18DE.w,Y		; F9 DE 18
	sta ($C2.b,X)		; 81 C2
	dex		; CA
	ror $4B.b		; 66 4B
	sta [$69.b],Y		; 97 69
	clv		; B8
	sbc ($FD.b),Y		; F1 FD
	eor ($93.b)		; 52 93
	ora [$5A.b]		; 07 5A
	sbc #$96.b		; E9 96
	bit $3A79.w,X		; 3C 79 3A
	adc #$3A.b		; 69 3A
	adc #$5F.b		; 69 5F
	tsa		; 3B
	lda $0C56EA.l,X		; BF EA 56 0C
	ror $F0.b,X		; 76 F0
	jmp $7410.w		; 4C 10 74
	pei ($9A.b)		; D4 9A
	ldx $E1.b		; A6 E1
	phx		; DA
	sbc ($C2.b),Y		; F1 C2
	rol $90.b		; 26 90
	bcc  30.b		; 90 1E
	cmp #$A2.b		; C9 A2
	sta ($61.b,S),Y		; 93 61
	sta $DF.b		; 85 DF
	xce		; FB
	dec $94.b,X		; D6 94
	jsl $35AD43.l		; 22 43 AD 35
	and $42.b		; 25 42
	ora $60.b,S		; 03 60
	eor ($34.b),Y		; 51 34
	lda ($73.b)		; B2 73
	and ($32.b,S),Y		; 33 32
	and [$CE.b],Y		; 37 CE
	and [$28.b],Y		; 37 28
	sec		; 38
	pei ($59.b)		; D4 59
	php		; 08
	cpy $C9CC.w		; CC CC C9
	dec $9AFB.w,X		; DE FB 9A
	tsb $DFDD.w		; 0C DD DF
	cmp $49E1.w,Y		; D9 E1 49
	lda [$FA.b],Y		; B7 FA
	jmp $761EFB.l		; 5C FB 1E 76
	tad		; 5B
	sta $E396.w		; 8D 96 E3
	and ($D0.b,X)		; 21 D0
	jmp $1679.w		; 4C 79 16
	adc ($B0.b)		; 72 B0
	adc $D6.b,S		; 63 D6
	stx $2880.w		; 8E 80 28
	jsl $EC83A1.l		; 22 A1 83 EC
	inc $47.b		; E6 47
	dec $97.b		; C6 97
	tsx		; BA
	eor #$1D.b		; 49 1D
	jmp $3835.w		; 4C 35 38
	.db $62, $10, $83		; 62 10 83
	and #$10.b		; 29 10
	bcs  55.b		; B0 37
	ldy $7BDB.w		; AC DB 7B
	lsr $C4.b,X		; 56 C4
	adc $E8C0F1.l,X		; 7F F1 C0 E8
	tsa		; 3B
	tsb $7A.b		; 04 7A
	lda [$03.b],Y		; B7 03
	inc A		; 1A
	brk $34.b		; 00 34
	inc $FB9B.w		; EE 9B FB
	txy		; 9B
	bit $3FB7.w,X		; 3C B7 3F
	and ($CF.b,X)		; 21 CF
	bit $EC22.w,X		; 3C 22 EC
	clc		; 18
	cmp [$99.b]		; C7 99
	lda ($F3.b,S),Y		; B3 F3
	and $BA.b,X		; 35 BA
	asl $B26B.w,X		; 1E 6B B2
	jsr ($577F.w,X)		; FC 7F 57
	eor ($D0.b)		; 52 D0
	bpl -122.b		; 10 86
	asl $54B2.w		; 0E B2 54
	ldx $0C.b		; A6 0C
	ora ($82.b,X)		; 01 82
	sty $7C.b		; 84 7C
	txa		; 8A
	eor [$B6.b]		; 47 B6
	jmp.w [$F521]		; DC 21 F5
	cmp ($10.b)		; D2 10
	lda $DA.b,X		; B5 DA
	tad		; 5B
	lsr A		; 4A
	ora $50ADD6.l,X		; 1F D6 AD 50
	eor $8373.w		; 4D 73 83
	stp		; DB
	pea $A231.w		; F4 31 A2
	ror $5C.b,X		; 76 5C
	phb		; 8B
	cmp $76916F.l		; CF 6F 91 76
	inc $5076.w		; EE 76 50
	adc [$33.b],Y		; 77 33
	rol $37.b,X		; 36 37
	ora $4C7E.w,Y		; 19 7E 4C
	ora ($60.b),Y		; 11 60
	phb		; 8B
	sbc ($9D.b),Y		; F1 9D
	inc A		; 1A
	and $F0C6.w,Y		; 39 C6 F0
	tas		; 1B
	cmp $DFD0.w,Y		; D9 D0 DF
	and [$9B.b],Y		; 37 9B
	cmp [$76.b],Y		; D7 76
	jmp ($C489.w,X)		; 7C 89 C4
	sbc $BE.b,S		; E3 BE
	lda #$9C.b		; A9 9C
	cmp $3965.w,X		; DD 65 39
	and $D6CD.w,Y		; 39 CD D6
	asl $67.b		; 06 67
	lda ($F9.b),Y		; B1 F9
	adc [$05.b],Y		; 77 05
	sbc $F644.w,Y		; F9 44 F6
	lda $99977F.l		; AF 7F 97 99
	adc $44D8.w,X		; 7D D8 44
	sta [$DF.b]		; 87 DF
	cmp $9A3964.l		; CF 64 39 9A
	lda $7C.b,S		; A3 7C
	eor $8027.w		; 4D 27 80
	ora $A8.b,S		; 03 A8
	cpy #$2E.b		; C0 2E
	asl A		; 0A
	cmp ($14.b,X)		; C1 14
	adc [$2D.b],Y		; 77 2D
	sbc $BC3A1B.l		; EF 1B 3A BC
	ldx #$4A.b		; A2 4A
	inc A		; 1A
	mvp $BA,$86		; 44 86 BA
	sta ($C2.b,S),Y		; 93 C2
	sec		; 38
	jsr $7A06.w		; 20 06 7A
	sta $67194B.l		; 8F 4B 19 67
	pld		; 2B
	bit $46.b,X		; 34 46
	rol $6DAD.w		; 2E AD 6D
	ror $ADAE.w		; 6E AE AD
	adc $AE6E.w		; 6D 6E AE
	lda $6E6D.w		; AD 6D 6E
	ldx $6DAD.w		; AE AD 6D
	ror $909F.w		; 6E 9F 90
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $3A.b		; 06 3A
	brk $10.b		; 00 10
	asl $DD.b		; 06 DD
	tas		; 1B
	dec $0000.w,X		; DE 00 00
	cmp $E0DEDE.l,X		; DF DE DE E0
	jmp.w [$E10C]		; DC 0C E1
	cpx #$E0.b		; E0 E0
.INDEX 8
	sep #$DF		; E2 DF
	cmp $E1E1E3.l,X		; DF E3 E1 E1
	cpx $E2.b		; E4 E2
.ACCU 8
	sep #$E5		; E2 E5
	sbc $E3.b,S		; E3 E3
	inc $E4.b		; E6 E4
	cpx $E7.b		; E4 E7
	sbc $E5.b		; E5 E5
	inx		; E8
	tsb $DB.b		; 04 DB
	sbc #$E6.b		; E9 E6
	inc $EA.b		; E6 EA
	inx		; E8
	inx		; E8
	xba		; EB
	sbc [$E7.b]		; E7 E7
	cpx $EAEA.w		; EC EA EA
	sbc $E9E9.w		; ED E9 E9
	inc $EBEB.w		; EE EB EB
	sbc $F0ECEC.l		; EF EC EC F0
	sbc $F1ED.w		; ED ED F1
	inc $F2EE.w		; EE EE F2
	sbc $30F3EF.l		; EF EF F3 30
	brk $F4.b		; 00 F4
	sbc ($F1.b),Y		; F1 F1
	sbc $04.b,X		; F5 04
	dec $E2F6.w,X		; DE F6 E2
	cmp $F0F0F7.l,X		; DF F7 F0 F0
	sed		; F8
	sep #$00		; E2 00
	rti		; 40

	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $F7.b,S		; 03 F7
	beq -26.b		; F0 E6
	inc $DE.b,X		; F6 DE
	ora ($E6.b,X)		; 01 E6
	inc $DE.b,X		; F6 DE
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	cpx $F6.b		; E4 F6
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	cpx $F8.b		; E4 F8
	tsb $0D00.w		; 0C 00 0D
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	brk $11.b		; 00 11
	tsb $12.b		; 04 12
	cmp $001300.l,X		; DF 00 13 00
	trb $00.b		; 14 00
	ora $00.b,X		; 15 00
	asl $00.b,X		; 16 00
	ora [$00.b],Y		; 17 00
	clc		; 18
	brk $19.b		; 00 19
	brk $1A.b		; 00 1A
	sed		; F8
	tas		; 1B
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	brk $1E.b		; 00 1E
	tsb $1F.b		; 04 1F
	cmp $002000.l,X		; DF 00 20 00
	and ($04.b,X)		; 21 04
	jsl $F52304.l		; 22 04 23 F5
	bit $00.b		; 24 00
	and $00.b		; 25 00
	rol $00.b		; 26 00
	and [$00.b]		; 27 00
	plp		; 28
	cmp $002900.l,X		; DF 00 29 00
	rol A		; 2A
	brk $2B.b		; 00 2B
	dec $2C00.w,X		; DE 00 2C
	brk $2D.b		; 00 2D
	tsb $2E.b		; 04 2E
	tsb $2F.b		; 04 2F
	tsb $F3.b		; 04 F3
	sbc ($31.b,S),Y		; F3 31
	brk $32.b		; 00 32
	brk $33.b		; 00 33
	brk $34.b		; 00 34
	brk $35.b		; 00 35
	brk $36.b		; 00 36
	brk $37.b		; 00 37
	brk $38.b		; 00 38
	brk $39.b		; 00 39
	sed		; F8
	dec A		; 3A
	brk $3B.b		; 00 3B
	brk $3C.b		; 00 3C
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $41.b		; 00 41
	sbc $42.b,X		; F5 42
	brk $43.b		; 00 43
	tsb $44.b		; 04 44
	brk $45.b		; 00 45
	brk $46.b		; 00 46
	tsb $47.b		; 04 47
	tsb $48.b		; 04 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	sed		; F8
	phk		; 4B
	brk $4C.b		; 00 4C
	tsb $4D.b		; 04 4D
	tsb $4E.b		; 04 4E
	tsb $4F.b		; 04 4F
	tsb $50.b		; 04 50
	tsb $51.b		; 04 51
	brk $52.b		; 00 52
	brk $53.b		; 00 53
	brk $54.b		; 00 54
	tsb $55.b		; 04 55
	sbc $56.b,X		; F5 56
	tsb $57.b		; 04 57
	tsb $58.b		; 04 58
	tsb $59.b		; 04 59
	tsb $5A.b		; 04 5A
	brk $1B.b		; 00 1B
	rti		; 40

	dec $005B.w,X		; DE 5B 00
	jmp $F55D04.l		; 5C 04 5D F5
	lsr $5F04.w,X		; 5E 04 5F
	tsb $60.b		; 04 60
	tsb $60.b		; 04 60
	tsb $61.b		; 04 61
	tsb $62.b		; 04 62
	tsb $63.b		; 04 63
	tsb $64.b		; 04 64
	tsb $65.b		; 04 65
	tsb $66.b		; 04 66
	tsb $67.b		; 04 67
	tsb $68.b		; 04 68
	tsb $69.b		; 04 69
	tsb $6A.b		; 04 6A
	tsb $6B.b		; 04 6B
	tsb $6C.b		; 04 6C
	tsb $6D.b		; 04 6D
	tsb $6E.b		; 04 6E
	tsb $6F.b		; 04 6F
	brk $70.b		; 00 70
	brk $71.b		; 00 71
	brk $72.b		; 00 72
	brk $73.b		; 00 73
	tsb $74.b		; 04 74
	tsb $F3.b		; 04 F3
	sbc ($75.b,S),Y		; F3 75
	tsb $76.b		; 04 76
	brk $77.b		; 00 77
	tsb $78.b		; 04 78
	tsb $79.b		; 04 79
	tsb $F3.b		; 04 F3
	ply		; 7A
	tsb $7B.b		; 04 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	tsb $80.b		; 04 80
	tsb $81.b		; 04 81
	tsb $82.b		; 04 82
	tsb $83.b		; 04 83
	tsb $84.b		; 04 84
	tsb $85.b		; 04 85
	tsb $86.b		; 04 86
	tsb $87.b		; 04 87
	tsb $88.b		; 04 88
	tsb $89.b		; 04 89
	tsb $8A.b		; 04 8A
	tsb $8B.b		; 04 8B
	tsb $8C.b		; 04 8C
	tsb $8D.b		; 04 8D
	tsb $8E.b		; 04 8E
	tsb $8F.b		; 04 8F
	tsb $90.b		; 04 90
	tsb $91.b		; 04 91
	tsb $92.b		; 04 92
	tsb $93.b		; 04 93
	tsb $94.b		; 04 94
	tsb $95.b		; 04 95
	brk $96.b		; 00 96
	brk $97.b		; 00 97
	tsb $98.b		; 04 98
	tsb $99.b		; 04 99
	tsb $9A.b		; 04 9A
	tsb $9B.b		; 04 9B
	tsb $9C.b		; 04 9C
	tsb $9D.b		; 04 9D
	tsb $9E.b		; 04 9E
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	tsb $A1.b		; 04 A1
	tsb $A2.b		; 04 A2
	tsb $A3.b		; 04 A3
	tsb $A4.b		; 04 A4
	tsb $A5.b		; 04 A5
	tsb $A6.b		; 04 A6
	tsb $A7.b		; 04 A7
	tsb $A8.b		; 04 A8
	tsb $A9.b		; 04 A9
	tsb $AA.b		; 04 AA
	tsb $AB.b		; 04 AB
	tsb $AC.b		; 04 AC
	tsb $AD.b		; 04 AD
	tsb $AE.b		; 04 AE
	tsb $AF.b		; 04 AF
	tsb $B0.b		; 04 B0
	tsb $B1.b		; 04 B1
	tsb $B2.b		; 04 B2
	tsb $B3.b		; 04 B3
	tsb $B4.b		; 04 B4
	tsb $B5.b		; 04 B5
	tsb $B6.b		; 04 B6
	tsb $B7.b		; 04 B7
	tsb $B8.b		; 04 B8
	tsb $B9.b		; 04 B9
	tsb $BA.b		; 04 BA
	tsb $BB.b		; 04 BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	tsb $BE.b		; 04 BE
	tsb $BF.b		; 04 BF
	tsb $C0.b		; 04 C0
	tsb $C1.b		; 04 C1
	tsb $C2.b		; 04 C2
	tsb $C3.b		; 04 C3
	tsb $C4.b		; 04 C4
	tsb $C5.b		; 04 C5
	tsb $C6.b		; 04 C6
	tsb $C7.b		; 04 C7
	tsb $C8.b		; 04 C8
	tsb $C9.b		; 04 C9
	tsb $CA.b		; 04 CA
	tsb $CB.b		; 04 CB
	tsb $CC.b		; 04 CC
	brk $CD.b		; 00 CD
	tsb $CE.b		; 04 CE
	tsb $CF.b		; 04 CF
	tsb $D0.b		; 04 D0
	tsb $D1.b		; 04 D1
	tsb $D2.b		; 04 D2
	tsb $D3.b		; 04 D3
	tsb $D4.b		; 04 D4
	tsb $D5.b		; 04 D5
	tsb $D6.b		; 04 D6
	brk $D7.b		; 00 D7
	tsb $D8.b		; 04 D8
	tsb $D9.b		; 04 D9
	tsb $DA.b		; 04 DA
	sbc ($F2.b)		; F2 F2
	sbc ($F2.b)		; F2 F2
	tsb $F4.b		; 04 F4
	pea $F7F4.w		; F4 F4 F7
	beq -19.b		; F0 ED
	sbc #$E6.b		; E9 E6
	cpx $F6.b		; E4 F6
	dec $DD00.w,X		; DE 00 DD
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $0D.b		; 00 0D
	bne   4.b		; D0 04
	brk $6E.b		; 00 6E
	ldy $E4.b		; A4 E4
	cmp ($46.b)		; D2 46
	sta ($2C.b)		; 92 2C
	and $912209.l		; 2F 09 22 91
	stz $02.b,X		; 74 02
	ora $28.b		; 05 28
	adc $C3C487.l,X		; 7F 87 C4 C3
	cmp $245C67.l		; CF 67 5C 24
	and $81.b,S		; 23 81
	jsr ($0945.w,X)		; FC 45 09
	lsr $C9.b		; 46 C9
	bit $A5.b		; 24 A5
	stx $74.b,Y		; 96 74
	lda $4D.b,S		; A3 4D
.ACCU 16
	rep #$26		; C2 26
	adc $45.b,S		; 63 45
	cmp [$D1.b]		; C7 D1
	rol A		; 2A
	jmp ($ECAD.w,X)		; 7C AD EC
	cmp $6B.b,X		; D5 6B
	ldx $CD.b,Y		; B6 CD
	cmp #$D946.w		; C9 46 D9
	ora ($12.b),Y		; 11 12
	adc $29.b		; 65 29
	lda $1573A5.l,X		; BF A5 73 15
	adc $D2.b		; 65 D2
	phk		; 4B
	bit $9A.b		; 24 9A
	lda $4877.w		; AD 77 48
	plb		; AB
	bit $88.b		; 24 88
	stz $C464.w,X		; 9E 64 C4
	phk		; 4B
	eor $B124.w,Y		; 59 24 B1
	ora ($13.b),Y		; 11 13
	tad		; 5B
	ldy $49BE.w		; AC BE 49
	cmp $9335.w,Y		; D9 35 93
	tax		; AA
	adc #$B224.w		; 69 24 B2
	eor #$B7A6.w		; 49 A6 B7
	wai		; CB
	adc $E9B3.w		; 6D B3 E9
	lda ($5E.b)		; B2 5E
	stp		; DB
	lda $47.b		; A5 47
	ldx $69.b,Y		; B6 69
	bit $92.b		; 24 92
	phx		; DA
	sta $9264.w,Y		; 99 64 92
	cmp #$B625.w		; C9 25 B6
	adc $9224.w		; 6D 24 92
	stp		; DB
	bit $C892.w		; 2C 92 C8
	pha		; 48
	and ($D4.b,X)		; 21 D4
	jsr ($4672.w,X)		; FC 72 46
	cmp $0D.b,S		; C3 0D
	and $1136.w,Y		; 39 36 11
	and $57.b,S		; 23 57
	cmp $72E6.w,X		; DD E6 72
	ror $3612.w		; 6E 12 36
	sbc $B9DC.w		; ED DC B9
	lda $B3.b,X		; B5 B3
	ora ($2D.b)		; 12 2D
	lda ($52.b),Y		; B1 52
	sbc $84EEF2.l		; EF F2 EE 84
	brk $2B.b		; 00 2B
	cmp [$76.b],Y		; D7 76
	trb $20CD.w		; 1C CD 20
	dey		; 88
	brk $2A.b		; 00 2A
	adc $CFCDFB.l		; 6F FB CD CF
	brk $40.b		; 00 40
	ora ($5C.b,X)		; 01 5C
	ora $D6AB4F.l,X		; 1F 4F AB D6
	sbc ($E0.b),Y		; F1 E0
	ldy #$91.b		; A0 91
	ror A		; 6A
	txs		; 9A
	adc $FBD0D5.l		; 6F D5 D0 FB
	ldy $8B.b		; A4 8B
	tyx		; BB
	adc $AF.b,X		; 75 AF
	sta $BF.b,X		; 95 BF
	xce		; FB
	lsr $2319.w,X		; 5E 19 23
	inc $67EE.w		; EE EE 67
	bit $21.b		; 24 21
	eor ($A3.b)		; 52 A3
	stz $91.b,X		; 74 91
	nop		; EA
	sta ($39.b)		; 92 39
	tad		; 5B
	tsa		; 3B
	cpx $46B2.w		; EC B2 46
	ldx #$7C.b		; A2 7C
	sta $FAA967.l,X		; 9F 67 A9 FA
	ora $7BAF.w,X		; 1D AF 7B
	inc $FB.b,X		; F6 FB
	sbc $F6D89D.l		; EF 9D D8 F6
	txs		; 9A
	nop		; EA
	lda [$27.b],Y		; B7 27
	sta [$37.b]		; 87 37
	ror $6404.w		; 6E 04 64
	adc ($6B.b)		; 72 6B
	stz $4E.b,X		; 74 4E
	cpy $11C7.w		; CC C7 11
	and $AC.b,S		; 23 AC
	stx $EE.b,Y		; 96 EE
	sta ($2A.b)		; 92 2A
	ldx $AA.b,Y		; B6 AA
	lda [$C6.b],Y		; B7 C6
	nop		; EA
	inc $4D7F.w,X		; FE 7F 4D
	xce		; FB
	cpy $40.b		; C4 40
	brk $C7.b		; 00 C7
	cpy $56D2.w		; CC D2 56
	lda [$85.b],Y		; B7 85
	sbc ($08.b),Y		; F1 08
	tsb $51.b		; 04 51
	rol $EC05.w,X		; 3E 05 EC
	ora $88D2D1.l		; 0F D1 D2 88
	bra  42.b		; 80 2A
	and [$43.b]		; 27 43
	inc $ADDB.w		; EE DB AD
	lsr A		; 4A
	sed		; F8
	ora $14.b		; 05 14
	bit $4BFB.w,X		; 3C FB 4B
	adc $B997.w,X		; 7D 97 B9
	cpx #$6C.b		; E0 6C
	ldy $00B0.w,X		; BC B0 00
	lsr $FA.b,X		; 56 FA
	stz $FE.b,X		; 74 FE
	cmp [$8F.b],Y		; D7 8F
	phx		; DA
	brk $05.b		; 00 05
	tyx		; BB
	adc ($FF.b,S),Y		; 73 FF
	lda $BB1B.w		; AD 1B BB
	sta $62.b,X		; 95 62
	sty $F191.w		; 8C 91 F1
	sta ($92.b),Y		; 91 92
	ora ($80.b)		; 12 80
	sta ($95.b),Y		; 91 95
	plb		; AB
	and $BBBB3B.l		; 2F 3B BB BB
	cpy #$24.b		; C0 24
	phy		; 5A
	inc $700D.w,X		; FE 0D 70
	bit #$E522.w		; 89 22 E5
	stx $BF.b,Y		; 96 BF
	and $19.b,S		; 23 19
	cmp ($49.b,X)		; C1 49
	ora [$C9.b],Y		; 17 C9
	tyx		; BB
	phb		; 8B
	adc [$A5.b],Y		; 77 A5
	txy		; 9B
	asl $7E6E.w		; 0E 6E 7E
	ldx $AB.b		; A6 AB
	phk		; 4B
	tax		; AA
	.db $82, $B1, $AA		; 82 B1 AA
	sta $55.b,S		; 83 55
	ora $73.b		; 05 73
	inc $7A.b,X		; F6 7A
	and ($11.b),Y		; 31 11
	sta ($DE.b,X)		; 81 DE
	cpy $35.b		; C4 35
	ror $1647.w		; 6E 47 16
	ldx $7F.b		; A6 7F
	lda $8FAA46.l		; AF 46 AA 8F
	lda $ACA146.l		; AF 46 A1 AC
	pei ($6A.b)		; D4 6A
	bit $8F.b		; 24 8F
	stx $363B.w		; 8E 3B 36
	eor #$041F.w		; 49 1F 04
	stz $7291.w		; 9C 91 72
	ldx $18.b,Y		; B6 18
	cmp ($24.b),Y		; D1 24
	eor $5EAB.w,X		; 5D AB 5E
	stx $BC.b,Y		; 96 BC
	mvp $6B,$91		; 44 91 6B
	eor $CE8391.l,X		; 5F 91 83 CE
	ora ($45.b)		; 12 45
	cmp [$1D.b]		; C7 1D
	cmp $B935.w,Y		; D9 35 B9
	tax		; AA
	sta ($3E.b)		; 92 3E
	ldy $9C.b,X		; B4 9C
	sta ($F4.b),Y		; 91 F4
	eor $0439F3.l,X		; 5F F3 39 04
	sta $0827B7.l		; 8F B7 27 08
	adc ($A7.b,X)		; 61 A7
	rol $C2.b		; 26 C2
	lda #$4F87.w		; A9 87 4F
	lda $2B.b		; A5 2B
	ora $84.b,X		; 15 84
	mvp $A3,$6A		; 44 6A A3
	stx $84FC.w		; 8E FC 84
	mvp $AA,$46		; 44 46 AA
	sec		; 38
	inc $222A.w		; EE 2A 22
	bit $9A.b,X		; 34 9A
	pha		; 48
.ACCU 8
.INDEX 8
	sep #$35		; E2 35
	eor ($11.b),Y		; 51 11
	ora ($11.b),Y		; 11 11
	clc		; 18
	lda $8A.b,S		; A3 8A
	and $D4A6D5.l,X		; 3F D5 A6 D4
	xce		; FB
	stz $E6.b,X		; 74 E6
	ora ($14.b),Y		; 11 14
	lsr $3E2E.w		; 4E 2E 3E
	lsr $7F.b		; 46 7F
	sta ($B6.b),Y		; 91 B6
	lda [$58.b],Y		; B7 58
	lsr $32.b		; 46 32
	.db $62, $83, $27		; 62 83 27
	tsa		; 3B
	eor $72D6CB.l		; 4F CB D6 72
	mvp $02,$40		; 44 40 02
	sbc #$14.b		; E9 14
	adc #$F2.b		; 69 F2
	adc $2491.w,X		; 7D 91 24
	phy		; 5A
	bit $B6.b		; 24 B6
	and $24B3C7.l,X		; 3F C7 B3 24
	eor $22B1.w,X		; 5D B1 22
	sta $F2FDC5.l		; 8F C5 FD F2
	lsr $C6.b		; 46 C6
	jsl $284148.l		; 22 48 41 28
	bra -112.b		; 80 90
	sta $E188.w		; 8D 88 E1
	sta ($10.b,S),Y		; 93 10
	bcc  82.b		; 90 52
	sty $A6.b		; 84 A6
	eor ($29.b,S),Y		; 53 29
	stz $4FD7.w,X		; 9E D7 4F
	sbc $EC.b		; E5 EC
	lda $C6A336.l,X		; BF 36 A3 C6
	sbc $9BF8.w		; ED F8 9B
	asl $87BB.w		; 0E BB 87
	lda $73E0.w,Y		; B9 E0 73
	bit $95.b,X		; 34 95
	ror $3D78.w		; 6E 78 3D
	dec $CF.b,X		; D6 CF
	dex		; CA
	cmp $779DF7.l,X		; DF F7 9D 77
	tsb $DC6A.w		; 0C 6A DC
	cpy #$BD.b		; C0 BD
	lda $8EE3.w		; AD E3 8E
	and $B7AA.w		; 2D AA B7
	jsr $0FA3.w		; 20 A3 0F
	eor [$79.b]		; 47 79
	tyx		; BB
	ora $B64F.w,X		; 1D 4F B6
	jsl $302222.l		; 22 22 22 30
	eor ($A4.b),Y		; 51 A4
	inc $08.b		; E6 08
	dey		; 88
	dey		; 88
	sbc $B7EA7B.l		; EF 7B EA B7
	tsb $44.b		; 04 44
	mvp $F4,$6D		; 44 6D F4
	ldy $C4.b		; A4 C4
	cpy $C4.b		; C4 C4
	cpy $E5.b		; C4 E5
	asl $12.b,X		; 16 12
	.db $42, $10		; 42 10
	bpl  17.b		; 10 11
	ora ($11.b),Y		; 11 11
	ora ($60.b),Y		; 11 60
	mvp $38,$22		; 44 22 38
	ldx $84.b,Y		; B6 84
	mvp $46,$44		; 44 44 46
	cmp $1171.w		; CD 71 11
	ora ($11.b),Y		; 11 11
	.db $82, $81, $1A		; 82 81 1A
	eor [$C4.b],Y		; 57 C4
	bvs -81.b		; 70 AF
	sta $E32B.w		; 8D 2B E3
	bit #$CD.b		; 89 CD
	lda $7E.b		; A5 7E
	asl A		; 0A
	tsa		; 3B
	tda		; 7B
	cli		; 58
	ora [$A0.b],Y		; 17 A0
	lda $F6.b,S		; A3 F6
	and $0E7E.w,X		; 3D 7E 0E
	cmp ($E9.b,S),Y		; D3 E9
	sbc $B6F8.w,Y		; F9 F8 B6
	ldx $9DA7.w,Y		; BE A7 9D
	ora $18.b		; 05 18
	ldx $A9.b,Y		; B6 A9
	cmp $8DA1.w		; CD A1 8D
	txy		; 9B
	lda [$FB.b],Y		; B7 FB
	ora $4D9CDA.l,X		; 1F DA 9C 4D
	sta [$D4.b]		; 87 D4
	sbc ($B5.b,S),Y		; F3 B5
	cmp $322B83.l,X		; DF 83 2B 32
	and ($30.b)		; 32 30
	stx $3232.w		; 8E 32 32
	cmp #$64.b		; C9 64
	lda ($40.b)		; B2 40
	rti		; 40

	rti		; 40

	.db $42, $42		; 42 42
	adc ($41.b,X)		; 61 41
	bvc -23.b		; 50 E9
	lda #$4D.b		; A9 4D
	lsr $766A.w		; 4E 6A 76
	xba		; EB
	jmp $652FAD.l		; 5C AD 2F 65
	cmp $AFC8C5.l,X		; DF C5 C8 AF
	cmp $2C5DC5.l,X		; DF C5 5D 2C
	stx $63.b,Y		; 96 63
	sty $2300.w		; 8C 00 23
	stx $52EB.w		; 8E EB 52
	ldx $0D.b		; A6 0D
	and ($12.b)		; 32 12
	ora ($02.b)		; 12 02
	cop $0C.b		; 02 0C
	cmp #$BD.b		; C9 BD
	eor #$BF.b		; 49 BF
.ACCU 16
.INDEX 16
	rep #$7E		; C2 7E
	jmp $47E9FF.l		; 5C FF E9 47
	ldx #$37F7.w		; A2 F7 37
	ldx $77.b,Y		; B6 77
	bit #$1C1B.w		; 89 1B 1C
	ror $6C.b,X		; 76 6C
	cpx $926E.w		; EC 6E 92
	rol $9402.w,X		; 3E 02 94
	ora $750743.l,X		; 1F 43 07 75
	asl $F6CB.w		; 0E CB F6
	ldy $97BD.w,X		; BC BD 97
	lda $3EF4A5.l,X		; BF A5 F4 3E
	sta $E6D79B.l		; 8F 9B D7 E6
	adc $47.b		; 65 47
	trb $71.b		; 14 71
	.db $62, $DA, $B1		; 62 DA B1
	rol $4876.w		; 2E 76 48
	dey		; 88
	jsr ($B2D7.w,X)		; FC D7 B2
	adc $4EF7.w,Y		; 79 F7 4E
	pei ($75.b)		; D4 75
	sbc $EE67.w		; ED 67 EE
	cmp $66.b		; C5 66
	dec $B975.w		; CE 75 B9
	ora $EC76.w,Y		; 19 76 EC
	sbc ($C1.b,S),Y		; F3 C1
	and [$86.b]		; 27 86
	clc		; 18
	and ($C2.b,X)		; 21 C2
	lda [$A7.b]		; A7 A7
	lda $D7AE.w		; AD AE D7
	sbc $F5EB.w,X		; FD EB F5
	phy		; 5A
	sbc $73A3D6.l		; EF D6 A3 73
	and $4C7E26.l,X		; 3F 26 7E 4C
	stp		; DB
	adc $A6B3.w,Y		; 79 B3 A6
	eor ($42.b)		; 52 42
	bit $206A.w,X		; 3C 6A 20
	xba		; EB
	asl A		; 0A
	sbc $AB.b,X		; F5 AB
	mvn $4E,$A9		; 54 A9 4E
	ldy $9B.b		; A4 9B
	eor $63625A.l		; 4F 5A 62 63
	rol $D43D.w		; 2E 3D D4
	ror $2FCE.w,X		; 7E CE 2F
	eor #$AFCB.w		; 49 CB AF
	adc [$51.b]		; 67 51
	sbc $6AAB.w,Y		; F9 AB 6A
	dec A		; 3A
	txa		; 8A
	sbc $567D.w,Y		; F9 7D 56
	cmp $87BA57.l		; CF 57 BA 87
	rtl		; 6B

	sbc ($FB.b)		; F2 FB
	jmp.w [$031F]		; DC 1F 03
	adc ($62.b),Y		; 71 62
	eor ($81.b),Y		; 51 81
	trb $4C17.w		; 1C 17 4C
	sbc ($A3.b,X)		; E1 A3
	ror $E6DE.w		; 6E DE E6
	inc $DA5C.w		; EE 5C DA
	cmp $E6B2.w,Y		; D9 B2 E6
	dec $CD.b,X		; D6 CD
	jsr ($F633.w,X)		; FC 33 F6
	sta ($95.b,S),Y		; 93 95
	txa		; 8A
	bne  86.b		; D0 56
	pld		; 2B
	sta $C8.b,X		; 95 C8
	lda #$2322.w		; A9 22 23
	dey		; 88
	cmp $44.b,X		; D5 44
	adc ($D1.b),Y		; 71 D1
	ora ($11.b),Y		; 11 11
	ora ($C7.b),Y		; 11 C7
	mvp $44,$44		; 44 44 44
	adc ($1D.b),Y		; 71 1D
	cpy $ED.b		; C4 ED
	cmp ($11.b),Y		; D1 11
	tas		; 1B
	eor ($31.b,S),Y		; 53 31
	ldx #$8C08.w		; A2 08 8C
	eor ($DF.b),Y		; 51 DF
	lda $CB.b		; A5 CB
	cmp ($EE.b,S),Y		; D3 EE
	adc $A26F.w		; 6D 6F A2
	ora ($AF.b),Y		; 11 AF
	ror $78.b		; 66 78
	lsr $07.b		; 46 07
	inc $B2.b		; E6 B2
	ldx #$EB36.w		; A2 36 EB
	adc ($38.b,X)		; 61 38
	sta $5FB462.l		; 8F 62 B4 5F
	dec $8B88.w,X		; DE 88 8B
	ldx $4EDC.w,Y		; BE DC 4E
	cmp $3CEACA.l		; CF CA EA 3C
	sbc $F84AA7.l,X		; FF A7 4A F8
	stx $D67A.w		; 8E 7A D6
	lsr $C6DF.w		; 4E DF C6
	cpy $C3CA.w		; CC CA C3
	cmp ($11.b),Y		; D1 11
	sta $E6FF.w		; 8D FF E6
	and [$71.b]		; 27 71
	txy		; 9B
	cpy #$E1CA.w		; C0 CA E1
	sbc $C2.b,X		; F5 C2
	and $8A.b,S		; 23 8A
	beq -43.b		; F0 D5
	lsr $D30E.w,X		; 5E 0E D3
	ora $374644.l		; 0F 44 46 37
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
	ror $87.b		; 66 87
	eor #$C177.w		; 49 77 C1
	inc $9CA1.w		; EE A1 9C
	eor [$39.b]		; 47 39
	sbc [$3C.b]		; E7 3C
	pei ($39.b)		; D4 39
	sbc $E46D87.l		; EF 87 6D E4
	php		; 08
	sty $C06F.w		; 8C 6F C0
	sbc $9B.b		; E5 9B
	tay		; A8
	pea $BC31.w		; F4 31 BC
	lda $149C.w		; AD 9C 14
	rts		; 60

	lsr $6A1D.w,X		; 5E 1D 6A
	ora ($64.b,X)		; 01 64
	tsx		; BA
	and [$0B.b]		; 27 0B
	adc $F4.b,S		; 63 F4
	adc $220F.w,X		; 7D 0F 22
	sbc ($22.b),Y		; F1 22
	cpx #$DA3F.w		; E0 3F DA
	ora #$DEE1.w		; 09 E1 DE
	ror $08FA.w		; 6E FA 08
	rol A		; 2A
	ora $1A04.w,X		; 1D 04 1A
	ldx $9B8B.w,Y		; BE 8B 9B
	bit #$75EA.w		; 89 EA 75
	eor $A75F.w,X		; 5D 5F A7
	lda ($E1.b),Y		; B1 E1
	adc $F1.b,S		; 63 F1
	ror $89CF.w,X		; 7E CF 89
	ror $A0.b,X		; 76 A0
	beq 118.b		; F0 76
	sta $64DCD9.l,X		; 9F D9 DC 64
	adc [$F8.b]		; 67 F8
	sta $470F67.l,X		; 9F 67 0F 47
	adc $CCBB.w,Y		; 79 BB CC
	dex		; CA
	pei ($FB.b)		; D4 FB
	ror $25.b,X		; 76 25
	jsr ($4F5D.w,X)		; FC 5D 4F
	and [$59.b]		; 27 59
	ldy $88DD.w,X		; BC DD 88
	dey		; 88
	cld		; D8
	stx $0A.b,Y		; 96 0A
	ora [$B3.b]		; 07 B3
	mvp $6C,$44		; 44 44 6C
	phk		; 4B
	.db $62, $5F, $E6		; 62 5F E6
	lda $6B8D.w,X		; BD 8D 6B
	ora ($11.b,X)		; 01 11
	ora ($11.b),Y		; 11 11
	bpl   2.b		; 10 02
	and ($32.b)		; 32 32
	cmp #$B664.w		; C9 64 B6
	tad		; 5B
	and ($21.b,X)		; 21 21
	and ($29.b,X)		; 21 29
	sty $CA.b,X		; 94 CA
	bvs  83.b		; 70 53
	and #$688C.w		; 29 8C 68
	cmp ($70.b)		; D2 70
	cmp ($11.b),Y		; D1 11
	ora ($CC.b),Y		; 11 CC
	jmp ($0838.w)		; 6C 38 08
	cpx #$2322.w		; E0 22 23
	cmp ($38.b),Y		; D1 38
	ldy $0814.w		; AC 14 08
	cmp ($BE.b)		; D2 BE
	and $4A.b,S		; 23 4A
	sed		; F8
	dey		; 88
	jsr ($C9CF.w,X)		; FC CF C9
	ora $18.b		; 05 18
	phx		; DA
	asl $25.b,X		; 16 25
	cmp ($E7.b,X)		; C1 E7
	adc $F1.b,S		; 63 F1
	adc $B7BD9F.l,X		; 7F 9F BD B7
	phy		; 5A
	cpy $BD.b		; C4 BD
	sta $D8C499.l		; 8F 99 C4 D8
	adc $B7CDFB.l		; 6F FB CD B7
	sta ($AF.b),Y		; 91 AF
	pea $5FA9.w		; F4 A9 5F
	stx $7D.b		; 86 7D
	eor $4B36AA.l,X		; 5F AA 36 4B
	adc $B2.b		; 65 B2
	cmp $DB74.w,Y		; D9 74 DB
	adc [$4F.b]		; 67 4F
	ora $80E65F.l		; 0F 5F E6 80
	ora $42.b		; 05 42
	plp		; 28
	adc [$F9.b],Y		; 77 F9
	tad		; 5B
	sbc [$84.b]		; E7 84
	bra  35.b		; 80 23
	ora [$70.b],Y		; 17 70
	sed		; F8
	dex		; CA
	tay		; A8
	ora $03.b		; 05 03
	dec A		; 3A
	lda $F2A6.w		; AD A6 F2
	ora ($00.b,X)		; 01 00
	sty $5971.w		; 8C 71 59
	lda $8D.b,S		; A3 8D
	adc $C3D57B.l,X		; 7F 7B D5 C3
	sbc $1F9E54.l		; EF 54 9E 1F
	ora [$71.b]		; 07 71
	sta $BD93.w,X		; 9D 93 BD
	phb		; 8B
	ora $D3.b		; 05 D3
	dec A		; 3A
	cmp [$DA.b]		; C7 DA
	adc [$0E.b],Y		; 77 0E
	phk		; 4B
	clv		; B8
	ror $BB3E.w		; 6E 3E BB
	ora ($1D.b,S),Y		; 13 1D
	tya		; 98
	cpx $B7DB.w		; EC DB B7
	eor $1E.b		; 45 1E
	sta $71.b,S		; 83 71
	sta $BE.b,X		; 95 BE
	bcc   0.b		; 90 00
	bpl  -5.b		; 10 FB
	cpy $0DED.w		; CC ED 0D
	sbc [$EF.b]		; E7 EF
	eor $FD2FE9.l,X		; 5F E9 2F FD
	dex		; CA
	tsa		; 3B
	cmp [$5A.b]		; C7 5A
	plx		; FA
	lda $5CF235.l		; AF 35 F2 5C
	adc #$A3BF.w		; 69 BF A3
	adc [$EE.b],Y		; 77 EE
	eor [$CC.b],Y		; 57 CC
	dex		; CA
	dec $7C.b		; C6 7C
	eor [$C6.b]		; 47 C6
	lsr $10.b,X		; 56 10
	lda #$A3C6.w		; A9 C6 A3
	cpy #$6D44.w		; C0 44 6D
	phk		; 4B
	eor $F4.b,S		; 43 F4
	ldx $CBFE.w,Y		; BE FE CB
	wai		; CB
	sbc $FB7F.w,X		; FD 7F FB
	phx		; DA
	sbc $7A38.w,Y		; F9 38 7A
	and $F9.b,S		; 23 F9
	cli		; 58
	cmp ($11.b),Y		; D1 11
	sta ($C0.b,X)		; 81 C0
	adc #$473B.w		; 69 3B 47
	cli		; 58
	cpx $BF.b		; E4 BF
	eor $E7.b,X		; 55 E7
	tya		; 98
	sta $5EC3.w,X		; 9D C3 5E
	txa		; 8A
	sec		; 38
	dec $7FF7.w,X		; DE F7 7F
	bit $49F4.w,X		; 3C F4 49
	phx		; DA
	tas		; 1B
	and $6D1716.l,X		; 3F 16 17 6D
	txy		; 9B
	plb		; AB
	rts		; 60

	sta $0A.b,S		; 83 0A
	stz $BFBE.w,X		; 9E BE BF
	sta $BB.b,S		; 83 BB
	dec $8845.w,X		; DE 45 88
	sbc [$D6.b],Y		; F7 D6
	sta [$1E.b],Y		; 97 1E
	sbc [$49.b],Y		; F7 49
	inc $CE7D.w		; EE 7D CE
	and $AD7349.l,X		; 3F 49 73 AD
	jmp ($C527.w,X)		; 7C 27 C5
	pla		; 68
	ror $33.b,X		; 76 33
	eor [$76.b]		; 47 76
	cmp $73DB.w,X		; DD DB 73
	plx		; FA
	sta $BDE89A.l		; 8F 9A E8 BD
	tax		; AA
	brk $14.b		; 00 14
	sbc #$55DE.w		; E9 DE 55
	adc $EAAB35.l		; 6F 35 AB EA
	pld		; 2B
	cmp $12.b		; C5 12
	phx		; DA
	.db $62, $7D, $75		; 62 7D 75
	adc $3D7F76.l,X		; 7F 76 7F 3D
	sbc $E0A7.w		; ED A7 E0
	tyx		; BB
	adc [$F9.b],Y		; 77 F9
	ora $DBF2BE.l,X		; 1F BE F2 DB
	and $D2.b		; 25 D2
	adc $37.b,S		; 63 37
	adc $5A9D93.l		; 6F 93 9D 5A
	cmp $BF39.w,X		; DD 39 BF
	lda [$E0.b]		; A7 E0
	brk $08.b		; 00 08
	iny		; C8
	cmp $1E0F4A.l		; CF 4A 0F 1E
	cmp [$30.b]		; C7 30
	stz $FC1C.w,X		; 9E 1C FC
	sta $DEFAD3.l		; 8F D3 FA DE
	inc $6197.w,X		; FE 97 61
	cpy $E1.b		; C4 E1
	sbc $DF.b,X		; F5 DF
	phb		; 8B
	lda #$FDE9.w		; A9 E9 FD
	plb		; AB
	ora ($88.b)		; 12 88
	cpy #$10C7.w		; C0 C7 10
	cmp [$10.b]		; C7 10
	sbc $94.b,X		; F5 94
	eor [$62.b],Y		; 57 62
	ply		; 7A
	cmp [$58.b]		; C7 58
	cpx $B5.b		; E4 B5
	cmp $4862.w,X		; DD 62 48
	cmp $BAC8C7.l,X		; DF C7 C8 BA
	dec $C0.b		; C6 C0
	stx $A60B.w		; 8E 0B A6
	bvs -47.b		; 70 D1
	clc		; 18
	asl $9233.w,X		; 1E 33 92
	lda $5FAC.w		; AD AC 5F
	sta $EC.b,X		; 95 EC
	asl $3B63.w		; 0E 63 3B
	cmp ($B9.b),Y		; D1 B9
	plb		; AB
	inc $FFE9.w,X		; FE E9 FF
	ora $706338.l,X		; 1F 38 63 70
	jmp.w [$B2D5]		; DC D5 B2
	sta [$E9.b],Y		; 97 E9
	eor ($05.b),Y		; 51 05
	pld		; 2B
.ACCU 8
	sep #$28		; E2 28
	sta $BFFA6F.l,X		; 9F 6F FA BF
	sta $FA.b,S		; 83 FA
	inc $B157.w,X		; FE 57 B1
	lsr $E0.b,X		; 56 E0
	sta $67CFC3.l		; 8F C3 CF 67
	stz $C7.b		; 64 C7
	bpl -115.b		; 10 8D
	bit #$44.b		; 89 44
	adc $F4C63F.l,X		; 7F 3F C6 F4
	ply		; 7A
	cmp $ABB90B.l,X		; DF 0B B9 AB
	bvs 112.b		; 70 70
	sta $571E45.l,X		; 9F 45 1E 57
	eor ($FE.b),Y		; 51 FE
	adc $7184.w,X		; 7D 84 71
	ora $4FFC4C.l		; 0F 4C FC 4F
	eor [$FF.b]		; 47 FF
	sed		; F8
	sbc ($ED.b)		; F2 ED
	jmp ($8F9D.w,X)		; 7C 9D 8F
	asl A		; 0A
	sta ($D3.b,S),Y		; 93 D3
	rol $1F.b,X		; 36 1F
	tyx		; BB
	cmp $2FB1.w		; CD B1 2F
	rts		; 60

	cmp $B8.b,X		; D5 B8
	and $942D.w,Y		; 39 2D 94
	adc $88CE.w,X		; 7D CE 88
	.db $62, $47, $11		; 62 47 11
	eor ($ED.b),Y		; 51 ED
	bit $8971.w,X		; 3C 71 89
	jmp $4527D6.l		; 5C D6 27 45
	inc $5AE7.w,X		; FE E7 5A
	iny		; C8
	.db $42, $5F		; 42 5F
	dex		; CA
	rol $59.b,X		; 36 59
	ora $BA2D.w,X		; 1D 2D BA
	lda [$3E.b],Y		; B7 3E
	tsa		; 3B
	jsl $DAA5ED.l		; 22 ED A5 DA
	tya		; 98
	jsr ($DB58.w,X)		; FC 58 DB
	nop		; EA
	plb		; AB
	ora [$E1.b],Y		; 17 E1
	nop		; EA
	ldy $224A.w		; AC 4A 22
	plb		; AB
	cmp $9A2B.w,X		; DD 2B 9A
	dey		; 88
	txa		; 8A
	dec $577D.w,X		; DE 7D 57
	inc $189A.w,X		; FE 9A 18
	tya		; 98
	ora ($55.b),Y		; 11 55
	cmp $D1.b,S		; C3 D1
	cpx #$7AE8.w		; E0 E8 7A
	cpy $C18E.w		; CC 8E C1
	sbc [$6A.b]		; E7 6A
	inx		; E8
	pei ($68.b)		; D4 68
	phx		; DA
	adc $2FBAAA.l		; 6F AA BA 2F
	cpy $9FFC.w		; CC FC 9F
	cmp $C0.b		; C5 C0
	cmp ($CD.b,S),Y		; D3 CD
	adc $3ED98F.l,X		; 7F 8F D9 3E
	eor ($B1.b)		; 52 B1
	dec A		; 3A
	lda $51D3FD.l		; AF FD D3 51
	sbc $0D3D9A.l,X		; FF 9A 3D 0D
	wai		; CB
	eor ($72.b),Y		; 51 72
	phx		; DA
	ora $EB.b,X		; 15 EB
	jmp $3FE4C7.l		; 5C C7 E4 3F
	dec $EFF9.w,X		; DE F9 EF
	sbc #$78.b		; E9 78
	lsr A		; 4A
	cmp $B37E.w,Y		; D9 7E B3
	sbc $5F.b,X		; F5 5F
	ldy $CA.b		; A4 CA
	inc $0C.b,X		; F6 0C
	lsr A		; 4A
	sta $D79525.l		; 8F 25 95 D7
	rol $96C3.w,X		; 3E C3 96
	inx		; E8
	bit $47D4.w,X		; 3C D4 47
	and #$F5.b		; 29 F5
	ora $777CDC.l,X		; 1F DC 7C 77
	beq -79.b		; F0 B1
	sec		; 38
	adc $6FF676.l		; 6F 76 F6 6F
	stz $2FF7.w		; 9C F7 2F
	bvs  -2.b		; 70 FE
	stp		; DB
	ldy #$35C7.w		; A0 C7 35
	eor $B3B6.w,Y		; 59 B6 B3
	cli		; 58
	sta $BB3F67.l,X		; 9F 67 3F BB
	rol $6EDE.w,X		; 3E DE 6E
	ldx $9972.w,Y		; BE 72 99
	jmp $4AA9.w		; 4C A9 4A
	ldx $05.b		; A6 05
	lsr $2FDA.w		; 4E DA 2F
	lda ($16.b),Y		; B1 16
	rtl		; 6B

	eor $11.b,X		; 55 11
	sbc $7CAD27.l,X		; FF 27 AD 7C
	cmp [$B5.b]		; C7 B5
	sei		; 78
	sta $BAE344.l		; 8F 44 E3 BA
	mvn $D8,$71		; 54 71 D8
	cld		; D8
	cmp ($11.b),Y		; D1 11
	bcs -30.b		; B0 E2
	ldx #$2222.w		; A2 22 22
	jsl $E6A838.l		; 22 38 A8 E6
	and $0C.b,S		; 23 0C
	sbc $05.b,S		; E3 05
	cop $34.b		; 02 34
	lda $5EE088.l		; AF 88 E0 5E
	nop		; EA
	and $3842.w,Y		; 39 42 38
	phx		; DA
	cop $23.b		; 02 23
	ora $03.b		; 05 03
	ror $B8.b		; 66 B8
	cmp ($BE.b)		; D2 BE
	bmi  35.b		; 30 23
	xba		; EB
	ror A		; 6A
	inc $C6D4.w		; EE D4 C6
	bne -50.b		; D0 CE
	cmp #$DE.b		; C9 DE
	eor $4D.b		; 45 4D
	tay		; A8
	pei ($78.b)		; D4 78
	ldx $A253.w		; AE 53 A2
	lda $5B8915.l		; AF 15 89 5B
	sty $DEAA.w		; 8C AA DE
	lsr $D3.b,X		; 56 D3
	and ($A9.b,X)		; 21 A9
	sbc $733F.w,X		; FD 3F 73
	cpy $E5.b		; C4 E5
	bvs -72.b		; 70 B8
	sbc ($CB.b)		; F2 CB
	ror A		; 6A
	cmp $7C.b,X		; D5 7C
	cmp $7F.b,X		; D5 7F
	eor $FF.b,S		; 43 FF
	rol A		; 2A
	jsr ($4D2C.w,X)		; FC 2C 4D
	ldx $F2.b		; A6 F2
	plb		; AB
	adc $9B58.w,Y		; 79 58 9B
	cpx $2584.w		; EC 84 25
	stz $65.b		; 64 65
	lda $74.b		; A5 74
	eor $5D1D.w,Y		; 59 1D 5D
	bit #$90.b		; 89 90
	sta $A6.b,X		; 95 A6
	plx		; FA
	lda [$D9.b],Y		; B7 D9
	ora $957D.w,X		; 1D 7D 95
	eor $66.b,X		; 55 66
	adc $5DEF.w		; 6D EF 5D
	sbc $B8.b,S		; E3 B8
	eor $B6.b,X		; 55 B6
	cmp [$44.b]		; C7 44
	ora $3C1316.l,X		; 1F 16 13 3C
	eor ($51.b,S),Y		; 53 51
	dec $63.b		; C6 63
	inc $E2.b		; E6 E2
	adc ($75.b)		; 72 75
	sta $36D9.w,Y		; 99 D9 36
	and $B7.b		; 25 B7
	tad		; 5B
	cmp $AED9D2.l,X		; DF D2 D9 AE
	jsl $1D3522.l		; 22 22 35 1D
	adc ($D8.b,S),Y		; 73 D8
	lda $9C.b,X		; B5 9C
	asl $16.b,X		; 16 16
	asl $15.b		; 06 15
	eor [$8A.b],Y		; 57 8A
	phx		; DA
	adc $563232.l		; 6F 32 32 56
	.db $42, $1C		; 42 1C
	stx $E3.b		; 86 E3
	eor $23.b,S		; 43 23
	lda $64.b		; A5 64
	and #$7D.b		; 29 7D
	tad		; 5B
	eor $45E6.w		; 4D E6 45
	bvc  -4.b		; 50 FC
	asl A		; 0A
	inc $5675.w,X		; FE 75 56
	plx		; FA
	lda $A13FC7.l,X		; BF C7 3F A1
	dec $A19D.w		; CE 9D A1
	clv		; B8
	dex		; CA
	tax		; AA
	cmp ($CF.b),Y		; D1 CF
	adc $5E78.w		; 6D 78 5E
	and $70DF77.l		; 2F 77 DF 70
	rol $0A3A.w		; 2E 3A 0A
	lda $F8F9E3.l		; AF E3 F9 F8
	phx		; DA
	clc		; 18
	ldx $B0.b,Y		; B6 B0
	and $9E386C.l		; 2F 6C 38 9E
	ora $E6DBDA.l,X		; 1F DA DB E6
.INDEX 8
	sep #$DA		; E2 DA
	ora ($A5.b),Y		; 11 A5
	jmp ($4760.w,X)		; 7C 60 47
	ora $D3.b		; 05 D3
	and ($3A.b),Y		; 31 3A
	adc [$56.b],Y		; 77 56
	sbc $B31D.w		; ED 1D B3
	sbc ($D5.b)		; F2 D5
	sta $99.b,X		; 95 99
	bcc -106.b		; 90 96
	ora $EB.b,X		; 15 EB
	and $C3B7.w		; 2D B7 C3
	adc $C04F.w,Y		; 79 4F C0
	lda $7B0E.w		; AD 0E 7B
	bcc -25.b		; 90 E7
	lda $7B0E.w,Y		; B9 0E 7B
	bcc -25.b		; 90 E7
	lda $460E.w,Y		; B9 0E 46
	ror $467E.w,X		; 7E 7E 46
	lsr $7E.b		; 46 7E
	ror $4646.w,X		; 7E 46 46
	ror $467E.w,X		; 7E 7E 46
	lsr $7E.b		; 46 7E
	ror $9244.w,X		; 7E 44 92
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $D1.b		; 06 D1
	brk $10.b		; 00 10
	asl $9D.b		; 06 9D
	ora $00009E.l,X		; 1F 9E 00 00
	sta $A0089B.l,X		; 9F 9B 08 A0
	sta $9EA19F.l,X		; 9F 9F A1 9E
	stz $00A2.w,X		; 9E A2 00
	stz $A2A3.w		; 9C A3 A2
	ldx #$A4.b		; A2 A4
	ldy #$A0.b		; A0 A0
	lda $A1.b		; A5 A1
	lda ($A6.b,X)		; A1 A6
	lda $A3.b,S		; A3 A3
	lda [$A4.b]		; A7 A4
	ldy $A8.b		; A4 A8
	lda $A5.b		; A5 A5
	lda #$A6.b		; A9 A6
	ldx $AA.b		; A6 AA
	lda [$A7.b]		; A7 A7
	plb		; AB
	tay		; A8
	tay		; A8
	ldy $A9A9.w		; AC A9 A9
	lda $AAAA.w		; AD AA AA
	ldx $ABAB.w		; AE AB AB
	lda $B0ACAC.l		; AF AC AC B0
	lda $B1AD.w		; AD AD B1
	dec A		; 3A
	brk $B2.b		; 00 B2
	ror A		; 6A
	brk $B3.b		; 00 B3
	lda ($B1.b),Y		; B1 B1
	ldy $AE.b,X		; B4 AE
	ldx $AFB5.w		; AE B5 AF
	lda $B0B0B6.l		; AF B6 B0 B0
	lda [$B2.b],Y		; B7 B2
	lda ($B8.b)		; B2 B8
	lda ($B3.b,S),Y		; B3 B3
	lda $B4B4.w,Y		; B9 B4 B4
	tsx		; BA
	lda $B5.b,X		; B5 B5
	tyx		; BB
	ldx $B6.b,Y		; B6 B6
	ldy $B7B7.w,X		; BC B7 B7
	rti		; 40

	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $B9.b,S		; 03 B9
	lda $ABB9.w,Y		; B9 B9 AB
	tay		; A8
	lda $9E.b		; A5 9E
	ora ($0C.b,X)		; 01 0C
	ldx $A5A8.w		; AE A8 A5
	cop $04.b		; 02 04
	ora $04.b,S		; 03 04
	tsb $04.b		; 04 04
	ora $04.b		; 05 04
	asl $04.b		; 06 04
	lda $07.b		; A5 07
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	tsb $0A.b		; 04 0A
	tsb $A5.b		; 04 A5
	phd		; 0B
	php		; 08
	tsb $AB08.w		; 0C 08 AB
	stz $040D.w,X		; 9E 0D 04
	asl $0F04.w		; 0E 04 0F
	tsb $08.b		; 04 08
	plb		; AB
	lda ($9E.b,X)		; A1 9E
	brk $10.b		; 00 10
	tsb $11.b		; 04 11
	tsb $12.b		; 04 12
	tsb $13.b		; 04 13
	tsb $14.b		; 04 14
	tsb $15.b		; 04 15
	tsb $16.b		; 04 16
	tsb $17.b		; 04 17
	tsb $18.b		; 04 18
	tsb $19.b		; 04 19
	tsb $1A.b		; 04 1A
	tsb $1B.b		; 04 1B
	tsb $1C.b		; 04 1C
	tsb $1D.b		; 04 1D
	tsb $1E.b		; 04 1E
	tsb $1F.b		; 04 1F
	tsb $20.b		; 04 20
	tsb $21.b		; 04 21
	tsb $22.b		; 04 22
	tsb $23.b		; 04 23
	tsb $24.b		; 04 24
	tsb $25.b		; 04 25
	tsb $26.b		; 04 26
	tsb $27.b		; 04 27
	php		; 08
	plp		; 28
	php		; 08
	and #$04.b		; 29 04
	rol A		; 2A
	tsb $A8.b		; 04 A8
	lda $9E.b		; A5 9E
	pld		; 2B
	tsb $2C.b		; 04 2C
	tsb $2D.b		; 04 2D
	tsb $2E.b		; 04 2E
	tsb $2F.b		; 04 2F
	tsb $30.b		; 04 30
	tsb $31.b		; 04 31
	tsb $32.b		; 04 32
	tsb $33.b		; 04 33
	tsb $34.b		; 04 34
	tsb $35.b		; 04 35
	tsb $36.b		; 04 36
	tsb $37.b		; 04 37
	tsb $38.b		; 04 38
	tsb $39.b		; 04 39
	lda ($9E.b,X)		; A1 9E
	brk $B8.b		; 00 B8
	tsa		; 3B
	tsb $3C.b		; 04 3C
	tsb $3D.b		; 04 3D
	tsb $3E.b		; 04 3E
	tsb $3F.b		; 04 3F
	tsb $40.b		; 04 40
	tsb $41.b		; 04 41
	tsb $42.b		; 04 42
	tsb $43.b		; 04 43
	tsb $44.b		; 04 44
	tsb $45.b		; 04 45
	tsb $46.b		; 04 46
	tsb $47.b		; 04 47
	tsb $48.b		; 04 48
	tsb $49.b		; 04 49
	tsb $4A.b		; 04 4A
	tsb $4B.b		; 04 4B
	tsb $4C.b		; 04 4C
	tsb $4D.b		; 04 4D
	tsb $4E.b		; 04 4E
	tsb $4F.b		; 04 4F
	tsb $50.b		; 04 50
	tsb $51.b		; 04 51
	tsb $52.b		; 04 52
	tsb $53.b		; 04 53
	tsb $54.b		; 04 54
	tsb $55.b		; 04 55
	tsb $56.b		; 04 56
	tsb $57.b		; 04 57
	tsb $58.b		; 04 58
	tsb $B8.b		; 04 B8
	clv		; B8
	lda ($B1.b,S),Y		; B3 B1
	eor $5A04.w,Y		; 59 04 5A
	tsb $5B.b		; 04 5B
	tsb $5C.b		; 04 5C
	tsb $5D.b		; 04 5D
	tsb $5E.b		; 04 5E
	tsb $5F.b		; 04 5F
	tsb $60.b		; 04 60
	tsb $61.b		; 04 61
	tsb $62.b		; 04 62
	tsb $63.b		; 04 63
	tsb $64.b		; 04 64
	tsb $65.b		; 04 65
	tsb $66.b		; 04 66
	tsb $67.b		; 04 67
	tsb $68.b		; 04 68
	tsb $69.b		; 04 69
	tsb $B3.b		; 04 B3
	lda [$B2.b],Y		; B7 B2
	rtl		; 6B

	tsb $6C.b		; 04 6C
	tsb $6D.b		; 04 6D
	tsb $6E.b		; 04 6E
	tsb $6F.b		; 04 6F
	tsb $70.b		; 04 70
	tsb $71.b		; 04 71
	tsb $72.b		; 04 72
	tsb $73.b		; 04 73
	tsb $74.b		; 04 74
	tsb $75.b		; 04 75
	tsb $76.b		; 04 76
	tsb $77.b		; 04 77
	tsb $78.b		; 04 78
	tsb $79.b		; 04 79
	tsb $7A.b		; 04 7A
	tsb $7B.b		; 04 7B
	tsb $7C.b		; 04 7C
	tsb $7D.b		; 04 7D
	tsb $7E.b		; 04 7E
	tsb $7F.b		; 04 7F
	tsb $80.b		; 04 80
	tsb $81.b		; 04 81
	tsb $82.b		; 04 82
	tsb $83.b		; 04 83
	tsb $84.b		; 04 84
	tsb $85.b		; 04 85
	tsb $86.b		; 04 86
	tsb $87.b		; 04 87
	tsb $88.b		; 04 88
	tsb $89.b		; 04 89
	tsb $BC.b		; 04 BC
	ldy $B2B7.w,X		; BC B7 B2
	txa		; 8A
	tsb $8B.b		; 04 8B
	tsb $8C.b		; 04 8C
	tsb $8D.b		; 04 8D
	tsb $8E.b		; 04 8E
	tsb $8F.b		; 04 8F
	tsb $90.b		; 04 90
	tsb $91.b		; 04 91
	tsb $92.b		; 04 92
	tsb $93.b		; 04 93
	tsb $94.b		; 04 94
	tsb $95.b		; 04 95
	tsb $96.b		; 04 96
	tsb $97.b		; 04 97
	tsb $98.b		; 04 98
	tsb $99.b		; 04 99
	tsb $9A.b		; 04 9A
	tsb $B7.b		; 04 B7
	tyx		; BB
	tyx		; BB
	tyx		; BB
	bcs -100.b		; B0 9C
	tsx		; BA
	tsx		; BA
	tsx		; BA
	lda $A6A9AC.l		; AF AC A9 A6
	lda $A2.b,S		; A3 A2
	ldy $9D.b,X		; B4 9D
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $09.b		; 00 09
	bne   4.b		; D0 04
	brk $4E.b		; 00 4E
	lda $0C.b		; A5 0C
	lda ($E7.b)		; B2 E7
	sta $16.b,X		; 95 16
	tsb $0042.w		; 0C 42 00
	ldy #$08.b		; A0 08
	trb $1004.w		; 1C 04 10
	jsr $1FA5.w		; 20 A5 1F
	stx $41.b		; 86 41
	tsb $1311.w		; 0C 11 13
	jmp $6A58E9.l		; 5C E9 58 6A
	plx		; FA
	ora ($17.b)		; 12 17
	ora $23.b,X		; 15 23
	mvn $93,$A9		; 54 A9 93
	bit $92.b		; 24 92
	pld		; 2B
	dec A		; 3A
	trb $74.b		; 14 74
	sty $54.b,X		; 94 54
	tay		; A8
	lda $7A2E04.l		; AF 04 2E 7A
	bit $4A.b		; 24 4A
	rol A		; 2A
	adc $B2ED.w		; 6D ED B2
	wai		; CB
	bit $A9.b,X		; 34 A9
	tay		; A8
	sta $12.b		; 85 12
	sta [$C4.b]		; 87 C4
	eor $C4.b,X		; 55 C4
	and $DD.b,S		; 23 DD
	bit $BD.b		; 24 BD
	ora $2A9F.w		; 0D 9F 2A
	sbc #$35.b		; E9 35
	mvn $67,$27		; 54 27 67
	eor $B2.b		; 45 B2
	cld		; D8
	sty $DD.b,X		; 94 DD
	bit $B6.b		; 24 B6
	eor $D94B.w,Y		; 59 4B D9
	lda $F2.b		; A5 F2
	cmp $36EA.w		; CD EA 36
	sta $49B2.w,Y		; 99 B2 49
	ldy $92.b		; A4 92
	eor $9265.w		; 4D 65 92
	eor #$2D.b		; 49 2D
	cmp ($5B.b)		; D2 5B
	tas		; 1B
	and $24CD9E.l		; 2F 9E CD 24
	cmp ($4D.b)		; D2 4D
	rol $92.b		; 26 92
	and $26.b,S		; 23 26
	pla		; 68
	sta $B399.w		; 8D 99 B3
	lda ($F0.b,S),Y		; B3 F0
	jmp ($35B0.w)		; 6C B0 35
	plb		; AB
	lda ($5D.b),Y		; B1 5D
	txa		; 8A
	rol $42.b,X		; 36 42
	bit $7F.b,X		; 34 7F
	and ($1B.b),Y		; 31 1B
	adc ($95.b)		; 72 95
	jsr ($B48B.w,X)		; FC 8B B4
	adc $B7C1.w		; 6D C1 B7
	sec		; 38
	tay		; A8
	stp		; DB
	sta [$A5.b],Y		; 97 A5
	tsx		; BA
	bne 113.b		; D0 71
	tas		; 1B
	and ($42.b,X)		; 21 42
	sbc $D968.w		; ED 68 D9
	rol $11.b		; 26 11
	lda ($42.b)		; B2 42
	rol $42.b,X		; 36 42
	and $8F.b,X		; 35 8F
	dec $8D.b,X		; D6 8D
	bcc 117.b		; 90 75
	cmp $368A.w,X		; DD 8A 36
	stx $2B.b,Y		; 96 2B
	sta ($B5.b),Y		; 91 B5
	cld		; D8
	ldx $D1FF.w		; AE FF D1
	lda $46EAE6.l,X		; BF E6 EA 46
	jsr ($FC2B.w,X)		; FC 2B FC
	sei		; 78
	cmp [$FC.b],Y		; D7 FC
	stp		; DB
	sbc $211B45.l,X		; FF 45 1B 21
	inc A		; 1A
	and $92.b,X		; 35 92
	rol $40.b,X		; 36 40
	pld		; 2B
	cmp ($B2.b),Y		; D1 B2
	bpl -62.b		; 10 C2
	ldy $6D.b		; A4 6D
	tsb $5C31.w		; 0C 31 5C
	cmp $73.b		; C5 73
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	stx $B6.b,Y		; 96 B6
	ldx $AE3C.w,Y		; BE 3C AE
	clc		; 18
	sta $6B.b,X		; 95 6B
	cpx #$D6.b		; E0 D6
	cmp ($AD.b,X)		; C1 AD
	adc $D546B7.l,X		; 7F B7 46 D5
	rol $D75E.w		; 2E 5E D7
	lda $F8.b		; A5 F8
	plp		; 28
	jmp.w [$823F]		; DC 3F 82
	sty $6BB3.w		; 8C B3 6B
	adc $69B1.w		; 6D B1 69
	cmp ($B4.b,S),Y		; D3 B4
	phb		; 8B
	bit #$57.b		; 89 57
	lda $A9A29D.l,X		; BF 9D A2 A9
	adc $79.b		; 65 79
	dex		; CA
	bit $E1CD.w		; 2C CD E1
	ror $AE.b,X		; 76 AE
	adc $9F.b,S		; 63 9F
	eor #$EB.b		; 49 EB
	stx $65.b,Y		; 96 65
	sta ($66.b,X)		; 81 66
	adc $7DD20F.l		; 6F 0F D2 7D
	cmp ($F2.b,X)		; C1 F2
	and $6B96.w,Y		; 39 96 6B
	ora $C9C8.w		; 0D C8 C9
	tsx		; BA
	ora $385800.l,X		; 1F 00 58 38
	brk $28.b		; 00 28
	jsl $4C6739.l		; 22 39 67 4C
	plx		; FA
	cmp $8FF158.l		; CF 58 F1 8F
	sed		; F8
	adc [$2F.b],Y		; 77 2F
	eor ($D7.b)		; 52 D7
	lda $A9.b,S		; A3 A9
	asl A		; 0A
	and $1E5994.l		; 2F 94 59 1E
	eor #$96.b		; 49 96
	tad		; 5B
	dey		; 88
	phx		; DA
	clc		; 18
	adc $CF.b,S		; 63 CF
	sta $46F5.w		; 8D F5 46
	sta [$59.b]		; 87 59
	lda $FB.b		; A5 FB
	xce		; FB
	php		; 08
	bit #$42.b		; 89 42
	sta $9D.b		; 85 9D
	tsa		; 3B
	plp		; 28
	rtl		; 6B

	inx		; E8
	tad		; 5B
	adc ($54.b)		; 72 54
	ldx $51.b,Y		; B6 51
	ora ($86.b),Y		; 11 86
	bit $6D63.w		; 2C 63 6D
	inc A		; 1A
	stz $B1.b,X		; 74 B1
	lsr $C61A.w,X		; 5E 1A C6
	bit $B126.w,X		; 3C 26 B1
	iny		; C8
	cmp ($7D.b),Y		; D1 7D
	phx		; DA
	stz $EA2C.w,X		; 9E 2C EA
	adc $213A.w		; 6D 3A 21
	adc ($39.b),Y		; 71 39
	tad		; 5B
	and $16DA.w,Y		; 39 DA 16
	txs		; 9A
	asl $99.b,X		; 16 99
	stp		; DB
	bit $93ED.w		; 2C ED 93
	stp		; DB
	and [$4F.b]		; 27 4F
	dey		; 88
	sbc $8B.b,X		; F5 8B
	lda ($62.b,S),Y		; B3 62
	ply		; 7A
	ora ($7E.b),Y		; 11 7E
	pha		; 48
	adc $D4.b,S		; 63 D4
	cmp [$68.b],Y		; D7 68
	phx		; DA
	sbc $7C.b,X		; F5 7C
	bit $DF7B.w		; 2C 7B DF
	eor $9D693B.l		; 4F 3B 69 9D
	dec $6FE3.w,X		; DE E3 6F
	sta [$8F.b],Y		; 97 8F
	.db $42, $DE		; 42 DE
	sta $52CC.w,X		; 9D CC 52
	sta [$6C.b],Y		; 97 6C
	bit $28.b,X		; 34 28
	eor ($1D.b),Y		; 51 1D
	and $C7.b,S		; 23 C7
	lda [$6B.b],Y		; B7 6B
	trb $56AE.w		; 1C AE 56
	asl $DA17.w,X		; 1E 17 DA
	sbc $8000.w,Y		; F9 00 80
	beq -96.b		; F0 A0
	trb $0400.w		; 1C 00 04
	ldy #$90.b		; A0 90
	sbc ($97.b)		; F2 97
	sbc ($1A.b),Y		; F1 1A
	stz $22.b		; 64 22
	cpy #$46.b		; C0 46
	cmp $2D.b,X		; D5 2D
	plp		; 28
	lsr $25.b		; 46 25
	stz $1BB1.w		; 9C B1 1B
	bvs -78.b		; 70 B2
	and $CD7F.w,Y		; 39 7F CD
	sta ($32.b),Y		; 91 32
	mvp $13,$C9		; 44 C9 13
	and $CC5FE6.l		; 2F E6 5F CC
	lda $F35FE7.l,X		; BF E7 5F F3
	sta ($3A.b),Y		; 91 3A
	adc ($79.b),Y		; 71 79
	wai		; CB
	bcs -85.b		; B0 AB
	ora $AAD746.l,X		; 1F 46 D7 AA
	cmp [$B8.b],Y		; D7 B8
	cmp [$B8.b],Y		; D7 B8
	sta $9ABA.w		; 8D BA 9A
	phd		; 0B
	ora ($B2.b),Y		; 11 B2
	asl $D0DD.w		; 0E DD D0
	lsr $DC.b		; 46 DC
	cmp $15.b,S		; C3 15
	cpy $C7D7.w		; CC D7 C7
	lda ($B5.b,S),Y		; B3 B5
	cmp $FE7D.w,Y		; D9 7D FE
.ACCU 8
	sep #$E3		; E2 E3
	sbc ($AB.b,S),Y		; F3 AB
	sta ($05.b,S),Y		; 93 05
	cmp $0C2E.w		; CD 2E 0C
	plx		; FA
	txa		; 8A
	stx $4B.b,Y		; 96 4B
	tda		; 7B
	.db $62, $E6, $ED		; 62 E6 ED
	eor $2533.w,X		; 5D 33 25
	ror $699D.w,X		; 7E 9D 69
	plb		; AB
	sbc $08C208.l		; EF 08 C2 08
	and ($76.b,X)		; 21 76
	phk		; 4B
	and $AA.b		; 25 AA
	lsr $E812.w,X		; 5E 12 E8
	bcc  -9.b		; 90 F7
	sty $C1.b		; 84 C1
	sta ($B2.b,S),Y		; 93 B2
	pld		; 2B
	sta ($28.b)		; 92 28
	sta $0004.w,Y		; 99 04 00
	bvc -15.b		; 50 F1
	lda $124244.l,X		; BF 44 42 12
	bmi   0.b		; 30 00
	bit $E87A.w,X		; 3C 7A E8
	dey		; 88
	jsr $7ADB.w		; 20 DB 7A
	dey		; 88
	dey		; 88
	jsr $E2DA.w		; 20 DA E2
	and #$A2.b		; 29 A2
	jsr $0380.w		; 20 80 03
	stp		; DB
	ora [$FF.b],Y		; 17 FF
	lsr $7C.b,X		; 56 7C
	pea $1844.w		; F4 44 18
	brk $88.b		; 00 88
	eor [$F3.b]		; 47 F3
	sta $4044CE.l,X		; 9F CE 44 40
	brk $4A.b		; 00 4A
	ldx $9E4C.w,Y		; BE 4C 9E
	ldy $BA9E.w,X		; BC 9E BA
	jsl $124B00.l		; 22 00 4B 12
	lsr $4C.b		; 46 4C
	sty $1999.w		; 8C 99 19
	plp		; 28
	bit #$42.b		; 89 42
	sta [$F5.b]		; 87 F5
	lda ($67.b,X)		; A1 67
	sbc $FB.b		; E5 FB
	ldx $BB5F.w,Y		; BE 5F BB
	cpy #$FA.b		; C0 FA
	and $C48B.w,X		; 3D 8B C4
	jmp ($D192.w)		; 6C 92 D1
	lda ($02.b)		; B2 02
	php		; 08
	stp		; DB
	inc A		; 1A
	ror A		; 6A
	sbc $6AFC07.l		; EF 07 FC 6A
	adc [$68.b],Y		; 77 68
	stp		; DB
	ora ($32.b,X)		; 01 32
	xce		; FB
	ldy $EABB.w,X		; BC BB EA
	xba		; EB
	asl A		; 0A
	xba		; EB
	asl A		; 0A
	xba		; EB
	asl A		; 0A
	xba		; EB
	asl A		; 0A
	nop		; EA
	phx		; DA
	ldx $1A.b,Y		; B6 1A
	lda [$5A.b],Y		; B7 5A
	clv		; B8
	and $EFCF5C.l		; 2F 5C CF EF
	ldx $F9.b		; A6 F9
	ora [$14.b],Y		; 17 14
	adc ($3F.b),Y		; 71 3F
	bit $ED.b,X		; 34 ED
	ldy $ED.b		; A4 ED
	stz $5063.w,X		; 9E 63 50
	eor $5442.w,X		; 5D 42 54
	txa		; 8A
	adc $37.b,X		; 75 37
	ora $DC71.w,X		; 1D 71 DC
	jmp ($1E7C.w)		; 6C 7C 1E
	and $58.b,S		; 23 58
	sbc $03.b,S		; E3 03
	asl A		; 0A
.ACCU 8
.INDEX 8
	sep #$39		; E2 39
	lda $6B.b,X		; B5 6B
	lda $99.b		; A5 99
	sta [$3A.b]		; 87 3A
	sbc ($CF.b,X)		; E1 CF
	sta ($E1.b),Y		; 91 E1
	sbc $C737.w		; ED 37 C7
	wai		; CB
	sbc ($A2.b,S),Y		; F3 A2
	lda $1BB1.w,Y		; B9 B1 1B
	lda $9612.w		; AD 12 96
	phb		; 8B
	pei ($1A.b)		; D4 1A
	ror $AD.b,X		; 76 AD
	ror $D72E.w,X		; 7E 2E D7
	tsa		; 3B
	lda $0114.w,X		; BD 14 01
	bra  77.b		; 80 4D
	cpy #$EA.b		; C0 EA
	rts		; 60

	pla		; 68
	lsr A		; 4A
	cmp ($5D.b,S),Y		; D3 5D
	pha		; 48
	lda [$53.b]		; A7 53
	tsx		; BA
	sbc #$56.b		; E9 56
	adc [$D8.b]		; 67 D8
	ldy $FDC4.w,X		; BC C4 FD
	cmp ($3C.b,S),Y		; D3 3C
	lda [$2E.b],Y		; B7 2E
	cmp $5AE8D7.l,X		; DF D7 E8 5A
	pla		; 68
	phy		; 5A
	eor ($D7.b)		; 52 D7
	ldy #$24.b		; A0 24
	jmp $8FAD.w		; 4C AD 8F
	jmp ($11EC.w,X)		; 7C EC 11
	ora $6A0992.l		; 0F 92 09 6A
	ora ($3D.b)		; 12 3D
	rol $8D6E.w,X		; 3E 6E 8D
	ldx $EA8E.w		; AE 8E EA
	trb $7823.w		; 1C 23 78
	jsr $9C23.w		; 20 23 9C
	ora ($98.b,X)		; 01 98
	sta $CCDF.w,Y		; 99 DF CC
	adc ($C3.b,S),Y		; 73 C3
	tda		; 7B
	sbc [$8F.b]		; E7 8F
	lda $4E.b,S		; A3 4E
	sec		; 38
	sta ($8C.b)		; 92 8C
	eor $CF.b,X		; 55 CF
	jmp $BEBEF5.l		; 5C F5 BE BE
	bra -54.b		; 80 CA
	plx		; FA
	txa		; 8A
	plb		; AB
	eor $FFB506.l,X		; 5F 06 B5 FF
	ldy $6EFF.w,X		; BC FF 6E
	sbc $BE.b,X		; F5 BE
	and [$8F.b],Y		; 37 8F
	pld		; 2B
	asl $3B56.w,X		; 1E 56 3B
	stz $9B1B.w,X		; 9E 1B 9B
	eor [$3F.b],Y		; 57 3F
	bit $9289.w		; 2C 89 92
	bvs -85.b		; 70 AB
	tad		; 5B
	lsr $69.b,X		; 56 69
	adc $755B.w		; 6D 5B 75
	ror $9F.b		; 66 9F
	cpx $F9.b		; E4 F9
	sta $4003.w		; 8D 03 40
	ldy $65.b		; A4 65
	ora ($B1.b)		; 12 B1
	sbc $63.b		; E5 63
	lda $357C1D.l		; AF 1D 7C 35
	beq -54.b		; F0 CA
	ora $32.b		; 05 32
	tya		; 98
	ldy $9676.w		; AC 76 96
	cmp ($1C.b),Y		; D1 1C
	stx $25A7.w		; 8E A7 25
	jmp $4CDF.w		; 4C DF 4C
	tax		; AA
	eor $35.b,X		; 55 35
	sty $D3.b		; 84 D3
	sbc $3E.b		; E5 3E
	cop $E0.b		; 02 E0
	tax		; AA
	rol $A8.b,X		; 36 A8
	lsr A		; 4A
	and ($76.b),Y		; 31 76
	phx		; DA
	clc		; 18
	sta $7C32.w,Y		; 99 32 7C
	beq   0.b		; F0 00
	rti		; 40

	adc $73.b		; 65 73
	and $4E.b		; 25 4E
	dec $55.b		; C6 55
	cmp $1DE9.w,Y		; D9 E9 1D
	adc $B5.b,S		; 63 B5
	rol $81A2.w,X		; 3E A2 81
	ldy $53.b		; A4 53
	and $8C.b,S		; 23 8C
	sta ($C4.b)		; 92 C4
	bpl  65.b		; 10 41
	.db $82, $38, $42		; 82 38 42
	phk		; 4B
	and #$B4.b		; 29 B4
	bit $34.b,X		; 34 34
	lda ($99.b)		; B2 99
	bit $0441.w		; 2C 41 04
	ora $121D.w,X		; 1D 1D 12
	ldx $B1.b,Y		; B6 B1
	tda		; 7B
	sta ($16.b,X)		; 81 16
.INDEX 16
	rep #$D8		; C2 D8
	ora ($A6.b)		; 12 A6
	tsx		; BA
	ldx $BE.b,Y		; B6 BE
	eor [$A1.b],Y		; 57 A1
	bit #$F0.b		; 89 F0
	sbc ($A9.b)		; F2 A9
	sbc $E5E1.w		; ED E1 E5
	cmp $FA.b		; C5 FA
	ora [$CB.b],Y		; 17 CB
	eor [$C9.b],Y		; 57 C9
	adc $D5.b,X		; 75 D5
	sbc $78.b,X		; F5 78
	eor $DB08.w,Y		; 59 08 DB
	and $CB.b		; 25 CB
	ror $EC.b,X		; 76 EC
	sbc $08.b		; E5 08
	cmp $8501.w,Y		; D9 01 85
	dec $B2.b		; C6 B2
	sta $47D9.w		; 8D D9 47
	ldy $B5.b,X		; B4 B5
	jsr ($5B57.w,X)		; FC 57 5B
	adc #$3E.b		; 69 3E
	ldy $2F17.w		; AC 17 2F
	cpx #$A355.w		; E0 55 A3
	asl $57.b		; 06 57
	stp		; DB
	sbc $7A29.w,X		; FD 29 7A
	sta ($EE.b,S),Y		; 93 EE
	rol A		; 2A
	sed		; F8
	bpl  94.b		; 10 5E
	lda $914DF3.l,X		; BF F3 4D 91
	and [$AF.b]		; 27 AF
	asl $4B.b		; 06 4B
	jsr ($BD97.w,X)		; FC 97 BD
	stz $FC5D.w		; 9C 5D FC
	txs		; 9A
	and ($32.b)		; 32 32
	sta [$DA.b],Y		; 97 DA
	lsr $D9.b,X		; 56 D9
	cmp $BC.b,X		; D5 BC
	sta $28.b,S		; 83 28
	sbc $3F.b,S		; E3 3F
	iny		; C8
	ply		; 7A
	cmp $D8CD.w,X		; DD CD D8
	.db $82, $08, $20		; 82 08 20
	.db $82, $44, $CD		; 82 44 CD
	phy		; 5A
	sbc ($BC.b)		; F2 BC
	eor ($04.b,X)		; 41 04
	ora $401A.w,Y		; 19 1A 40
	eor $34.b,S		; 43 34
	lda $C23518.l		; AF 18 35 C2
	iny		; C8
	sta $17.b,X		; 95 17
	lda [$24.b],Y		; B7 24
	sbc ($0B.b)		; F2 0B
	and ($BC.b)		; 32 BC
	eor ($04.b,X)		; 41 04
	rti		; 40

	lsr A		; 4A
	cpy $65D6.w		; CC D6 65
	ror $0B.b,X		; 76 0B
	tsx		; BA
	eor $F0D2.w,X		; 5D D2 F0
	adc $C5.b,S		; 63 C5
	asl $06.b		; 06 06
	jmp ($07FD.w,X)		; 7C FD 07
	ldy $E7.b,X		; B4 E7
	adc #$CE.b		; 69 CE
	cmp ($9D.b)		; D2 9D
	inc $3F.b		; E6 3F
.ACCU 16
	rep #$A3		; C2 A3
.ACCU 16
	rep #$A2		; C2 A2
	inc $F973.w,X		; FE 73 F9
	cmp $9541E7.l		; CF E7 41 95
	sta $314B.w,Y		; 99 4B 31
	jsr ($F3C7.w,X)		; FC C7 F3
	sbc ($24.b,S),Y		; F3 24
	cmp ($83.b,X)		; C1 83
	eor ($06.b,S),Y		; 53 06
	ldx $0D.b		; A6 0D
	jmp $981A.w		; 4C 1A 98
	tyx		; BB
	jsr ($0E6E.w,X)		; FC 6E 0E
	and [$07.b],Y		; 37 07
	ora ($F7.b)		; 12 F7
	ora ($F6.b)		; 12 F6
	adc $DBE4.w		; 6D E4 DB
	cmp #$3AB2.w		; C9 B2 3A
	tya		; 98
	sta $F42774.l		; 8F 74 27 F4
	and [$F7.b]		; 27 F7
	cmp ($F6.b,S),Y		; D3 F6
	stz $B6.b,X		; 74 B6
	trb $B6.b		; 14 B6
	ora $E320F2.l		; 0F F2 20 E3
	eor ($C6.b,X)		; 41 C6
	sta $26.b,S		; 83 26
	rol $65.b		; 26 65
	adc ($7F.b),Y		; 71 7F
	eor $9B9B43.l,X		; 5F 43 9B 9B
	lda $DCD0.w,Y		; B9 D0 DC
	lda $1A560E.l		; AF 0E 56 1A
	sta ($12.b),Y		; 91 12
	phy		; 5A
	tsa		; 3B
	rol $DF85.w		; 2E 85 DF
	and $F3F277.l,X		; 3F 77 F2 F3
	sbc $015FBE.l		; EF BE 5F 01
	tsb $10.b		; 04 10
	eor ($04.b,X)		; 41 04
	bpl  65.b		; 10 41
	tya		; 98
	lda $43.b,S		; A3 43
	asl $B79D.w,X		; 1E 9D B7
	eor $5E.b,X		; 55 5E
	adc ($60.b),Y		; 71 60
	.db $82, $15, $3C		; 82 15 3C
	ror A		; 6A
	sta $7DD4.w,Y		; 99 D4 7D
	ldy $17CC.w,X		; BC CC 17
	and $39.b,X		; 35 39
	cmp $50.b,X		; D5 50
	eor $A3.b,S		; 43 A3
	adc $6186.w,X		; 7D 86 61
	tya		; 98
	ror $F4.b		; 66 F4
	jmp.w [$8EAF]		; DC AF 8E
	ldy $3E.b,X		; B4 3E
	cpy $C61E.w		; CC 1E C6
	ora $9B81C7.l		; 0F C7 81 9B
	adc $BA79F6.l,X		; 7F F6 79 BA
	trb $252D.w		; 1C 2D 25
	and ($36.b,X)		; 21 36
	plx		; FA
	ldx $DB.b,Y		; B6 DB
	ora $8F.b,S		; 03 8F
	rol $62.b		; 26 62
	ldx $4A.b		; A6 4A
.ACCU 8
	sep #$AB		; E2 AB
	txa		; 8A
	sty $8F.b		; 84 8F
	lsr $FB.b		; 46 FB
	sta ($E2.b,S),Y		; 93 E2
	pea $A73B.w		; F4 3B A7
	ldy $71.b		; A4 71
	lda $6C.b,X		; B5 6C
	clc		; 18
	bpl -101.b		; 10 9B
	and $F8.b,S		; 23 F8
	jmp ($FF0F.w,X)		; 7C 0F FF
	jmp ($C52B.w)		; 6C 2B C5
	adc ($D6.b),Y		; 71 D6
	bne  33.b		; D0 21
	sta $EA0C.w,Y		; 99 0C EA
	adc $2B3B.w		; 6D 3B 2B
	stx $D3.b		; 86 D3
	lda ($29.b,S),Y		; B3 29
	phx		; DA
	eor $76.b		; 45 76
	eor ($ED.b)		; 52 ED
	ora $D941D8.l,X		; 1F D8 41 D9
	cmp $E2.b,X		; D5 E2
	cmp #$7B.b		; C9 7B
	sta ($AA.b)		; 92 AA
	lsr A		; 4A
	cmp ($6B.b)		; D2 6B
	ldx $CF6D.w		; AE 6D CF
	plx		; FA
	ldx $2279.w,Y		; BE 79 22
	ora $BD2C8E.l,X		; 1F 8E 2C BD
	eor $A9A8F5.l,X		; 5F F5 A8 A9
	.db $62, $08, $D3		; 62 08 D3
	ldx $A9B4.w		; AE B4 A9
	adc ($7C.b,S),Y		; 73 7C
	eor #$FD.b		; 49 FD
	dec $A4.b		; C6 A4
	jmp ($9A86.w)		; 6C 86 9A
	ldx $20.b		; A6 20
	sty $6C2D.w		; 8C 2D 6C
	cpy #$E568.w		; C0 68 E5
	and $488D.w		; 2D 8D 48
	bne 107.b		; D0 6B
	sta $3386B3.l,X		; 9F B3 86 33
	bit $42.b		; 24 42
	lda #$8E.b		; A9 8E
	sty $16.b,X		; 94 16
	cmp [$0D.b]		; C7 0D
	eor ($00.b)		; 52 00
	sty $693F.w		; 8C 3F 69
	sty $A5.b		; 84 A5
	ora ($00.b,X)		; 01 00
	sbc $CD48.w,Y		; F9 48 CD
	and $A2A3.w,X		; 3D A3 A2
	lda $A20B.w,Y		; B9 0B A2
	ldy $F7B5.w,X		; BC B5 F7
	adc $EB.b,S		; 63 EB
	sbc [$15.b]		; E7 15
	plb		; AB
	lda $D94F.w,X		; BD 4F D9
	sta $D6.b,S		; 83 D6
	plb		; AB
	jsr ($D76A.w,X)		; FC 6A D7
	cmp $AF.b,X		; D5 AF
	sta ($EF.b),Y		; 91 EF
	.db $62, $79, $45		; 62 79 45
	bcs -96.b		; B0 A0
	jmp ($52D1.w,X)		; 7C D1 52
	cmp $9A.b		; C5 9A
	rol $D8.b		; 26 D8
	sbc [$1C.b]		; E7 1C
.ACCU 8
.INDEX 8
	sep #$F8		; E2 F8
	ldy $0021.w,X		; BC 21 00
	and [$D4.b],Y		; 37 D4
	lda $AD.b,S		; A3 AD
	bvc -71.b		; 50 B9
	eor $88C8.w		; 4D C8 88
	eor $265C.w,Y		; 59 5C 26
	cmp $38C5.w,Y		; D9 C5 38
	ldy $6125.w		; AC 25 61
	rts		; 60

	jmp $8593.w		; 4C 93 85
	tyx		; BB
	rep #$8E		; C2 8E
	adc #$1F.b		; 69 1F
	ora #$34.b		; 09 34
	bcc  62.b		; 90 3E
	adc ($48.b),Y		; 71 48
	cpy $26.b		; C4 26
	stz $5CCD.w		; 9C CD 5C
	sta $355A.w		; 8D 5A 35
	tax		; AA
	lsr $A8.b,X		; 56 A8
	tsx		; BA
	txs		; 9A
	.db $82, $0F, $34		; 82 0F 34
	sbc $C001.w,Y		; F9 01 C0
	and ($8C.b),Y		; 31 8C
	cmp ($20.b,S),Y		; D3 20
	.db $42, $41		; 42 41
	jsr $30BC.w		; 20 BC 30
	sta $2C.b		; 85 2C
	sty $75.b		; 84 75
	ora ($65.b,X)		; 01 65
	ora $F9.b,S		; 03 F9
	cmp ($6D.b,X)		; C1 6D
	jmp.w [$919E]		; DC 9E 91
	and $A95D.w		; 2D 5D A9
	lsr $C7.b,X		; 56 C7
	sbc $CCC9.w,X		; FD C9 CC
	cmp $F9.b		; C5 F9
	cmp [$0E.b],Y		; D7 0E
	inc $B7.b		; E6 B7
	and ($0A.b),Y		; 31 0A
	cmp $B386.w,X		; DD 86 B3
	dec $6FF3.w,X		; DE F3 6F
	lda $3DAE.w,X		; BD AE 3D
	adc $F15682.l		; 6F 82 56 F1
	cpy $3C.b		; C4 3C
	sbc $D23D.w,Y		; F9 3D D2
	sbc $1EEFB9.l,X		; FF B9 EF 1E
	plx		; FA
	ldx $1D97.w,Y		; BE 97 1D
	eor [$82.b],Y		; 57 82
	dec A		; 3A
	dec $2F.b,X		; D6 2F
	cmp $7BBE8D.l		; CF 8D BE 7B
	cmp ($7F.b,X)		; C1 7F
	sta ($23.b,S),Y		; 93 23
	and #$08.b		; 29 08
	and #$21.b		; 29 21
	lda [$39.b],Y		; B7 39
	adc [$88.b]		; 67 88
	adc ($15.b)		; 72 15
	ror $5250.w		; 6E 50 52
	php		; 08
	and ($13.b,S),Y		; 33 13
	and ($46.b),Y		; 31 46
	pei ($8F.b)		; D4 8F
	eor ($0B.b),Y		; 51 0B
	phy		; 5A
	plp		; 28
	jsr $1E70.w		; 20 70 1E
	ldx $E5.b		; A6 E5
	ora $50.b		; 05 50
	ora $E940.w,X		; 1D 40 E9
	and ($9D.b,X)		; 21 9D
	cpx $D9CF.w		; EC CF D9
	lda $57BF.w,Y		; B9 BF 57
	cli		; 58
	sbc #$CA.b		; E9 CA
	sbc ($A0.b,X)		; E1 A0
	lda [$5F.b]		; A7 5F
	sbc $E49F.w,Y		; F9 9F E4
	and $C5B4.w,X		; 3D B4 C5
	cmp $06A3C9.l,X		; DF C9 A3 06
	mvn $A5,$78		; 54 78 A5
	sta ($BA.b)		; 92 BA
	lda $BA.b,X		; B5 BA
	cmp $7A.b,X		; D5 7A
	stz $79.b,X		; 74 79
	ora $DA9C6C.l		; 0F 6C 9C DA
	plb		; AB
	txa		; 8A
	sty $16.b		; 84 16
	bvc 108.b		; 50 6C
	ora $F67BB7.l,X		; 1F B7 7B F6
	lda $C491.w,Y		; B9 91 C4
	eor $0BF2B6.l,X		; 5F B6 F2 0B
	adc $50.b,S		; 63 50
	plx		; FA
	rol A		; 2A
	sbc ($06.b),Y		; F1 06
	stz $AE89.w,X		; 9E 89 AE
	sed		; F8
	adc ($7D.b,X)		; 61 7D
	pha		; 48
	tay		; A8
	cmp $3A.b,S		; C3 3A
	txy		; 9B
	stx $62AA.w		; 8E AA 62
	ldx $6B.b		; A6 6B
	plb		; AB
	eor ($68.b,S),Y		; 53 68
	stz $AE.b		; 64 AE
	ora $AC23.w,Y		; 19 23 AC
	cmp ($2C.b),Y		; D1 2C
	ldy #$43.b		; A0 43
	lda #$FF.b		; A9 FF
	jsr ($57AF.w,X)		; FC AF 57
	cmp ($3B.b)		; D2 3B
	adc $FF.b,S		; 63 FF
	ora $A699.w,X		; 1D 99 A6
	and ($C2.b,X)		; 21 C2
	lda $71.b,S		; A3 71
	lsr $EA.b		; 46 EA
	lda $D5.b		; A5 D5
	phk		; 4B
	tax		; AA
	sta [$35.b],Y		; 97 35
	and $5074.w		; 2D 74 50
	dec $6FE6.w,X		; DE E6 6F
	adc ($37.b,S),Y		; 73 37
	lda $6E9E.w,Y		; B9 9E 6E
	adc $D19F7F.l,X		; 7F 7F 9F D1
	cmp $ADBFE7.l		; CF E7 BF AD
	plb		; AB
	sta $C6C1.w		; 8D C1 C6
	cpx #$B9.b		; E0 B9
	bra -11.b		; 80 F5
	wai		; CB
	cmp [$2F.b],Y		; D7 2F
	jmp $C23FA1.l		; 5C A1 3F C2
	sta $569FD0.l,X		; 9F D0 9F 56
	sbc [$36.b],Y		; F7 36
	sbc [$36.b],Y		; F7 36
	sbc [$35.b],Y		; F7 35
	tsb $796F.w		; 0C 6F 79
	asl A		; 0A
	lda $7235.w,Y		; B9 35 72
	plb		; AB
	tda		; 7B
	sta $B2.b,X		; 95 B2
	and ($C8.b,X)		; 21 C8
	bcs  41.b		; B0 29
	ldx $5B86.w,Y		; BE 86 5B
	lsr $A1B5.w		; 4E B5 A1
	adc $D942.w		; 6D 42 D9
	ora $12DE.w		; 0D DE 12
	php		; 08
	bvc 106.b		; 50 6A
	cpy $A475.w		; CC 75 A4
	bpl  65.b		; 10 41
	tsb $37.b		; 04 37
	ora [$30.b]		; 07 30
	jmp.w [$C31C]		; DC 1C C3
	bvs 115.b		; 70 73
	ora $CCC1.w		; 0D C1 CC
	tas		; 1B
	bit $0D.b		; 24 0D
	iny		; C8
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $DF.b		; 06 DF
	brk $10.b		; 00 10
	asl $BC.b		; 06 BC
	ora ($BD.b,S),Y		; 13 BD
	brk $00.b		; 00 00
	ldx $BDBD.w,Y		; BE BD BD
	lda $C004BB.l,X		; BF BB 04 C0
	lda $BEC1BF.l,X		; BF BF C1 BE
	ldx $C0C2.w,Y		; BE C2 C0
	cpy #$C3.b		; C0 C3
	cmp ($C1.b,X)		; C1 C1
	cpy $C2.b		; C4 C2
	rep #$C5		; C2 C5
	cmp $C3.b,S		; C3 C3
	dec $C4.b		; C6 C4
	cpy $C7.b		; C4 C7
	cmp $C5.b		; C5 C5
	iny		; C8
	dec $C6.b		; C6 C6
	cmp #$C7.b		; C9 C7
	cmp [$CA.b]		; C7 CA
	iny		; C8
	iny		; C8
	wai		; CB
	dex		; CA
	dex		; CA
	cpy $C9C9.w		; CC C9 C9
	cmp $00BD.w		; CD BD 00
	dec $CBCB.w		; CE CB CB
	cmp $40CCCC.l		; CF CC CC 40
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $CF.b,S		; 03 CF
	cpy $C5C7.w		; CC C7 C5
	cmp $01.b,S		; C3 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	cmp $C1.b,S		; C3 C1
	ldx $07CD.w,Y		; BE CD 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	cmp $C3.b		; C5 C3
	brk $0E.b		; 00 0E
	php		; 08
	cmp $BE.b,S		; C3 BE
	ora $001000.l		; 0F 00 10 00
	ora ($00.b),Y		; 11 00
	ora ($00.b)		; 12 00
	ora ($00.b,S),Y		; 13 00
	trb $00.b		; 14 00
	ora $00.b,X		; 15 00
	asl $C1.b,X		; 16 C1
	cmp $0017.w		; CD 17 00
	clc		; 18
	brk $19.b		; 00 19
	brk $1A.b		; 00 1A
	brk $1B.b		; 00 1B
	ldx $1C00.w,Y		; BE 00 1C
	brk $1D.b		; 00 1D
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $23.b		; 00 23
	brk $24.b		; 00 24
	brk $25.b		; 00 25
	brk $26.b		; 00 26
	cmp $CD.b		; C5 CD
	and [$08.b]		; 27 08
	plp		; 28
	php		; 08
	and #$08.b		; 29 08
	rol A		; 2A
	php		; 08
	pld		; 2B
	php		; 08
	bit $2D08.w		; 2C 08 2D
	php		; 08
	rol $2F08.w		; 2E 08 2F
	php		; 08
	bmi   8.b		; 30 08
	and ($08.b),Y		; 31 08
	and ($08.b)		; 32 08
	and ($08.b,S),Y		; 33 08
	bit $08.b,X		; 34 08
	and $00.b,X		; 35 00
	rol $00.b,X		; 36 00
	and [$00.b],Y		; 37 00
	sec		; 38
	brk $39.b		; 00 39
	brk $3A.b		; 00 3A
	brk $3B.b		; 00 3B
	brk $3C.b		; 00 3C
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $3F.b		; 00 3F
	cmp $0040.w		; CD 40 00
	eor ($00.b,X)		; 41 00
	.db $42, $00		; 42 00
	eor $00.b,S		; 43 00
	mvp $45,$00		; 44 00 45
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	brk $48.b		; 00 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4B.b		; 00 4B
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
	brk $57.b		; 00 57
	brk $58.b		; 00 58
	brk $59.b		; 00 59
	tsb $5A.b		; 04 5A
	tsb $5B.b		; 04 5B
	tsb $5C.b		; 04 5C
	tsb $5D.b		; 04 5D
	brk $5E.b		; 00 5E
	brk $5F.b		; 00 5F
	brk $60.b		; 00 60
	brk $61.b		; 00 61
	brk $62.b		; 00 62
	brk $63.b		; 00 63
	brk $64.b		; 00 64
	brk $65.b		; 00 65
	brk $66.b		; 00 66
	php		; 08
	adc [$08.b]		; 67 08
	pla		; 68
	php		; 08
	adc #$08.b		; 69 08
	ror A		; 6A
	php		; 08
	rtl		; 6B

	php		; 08
	jmp ($6D08.w)		; 6C 08 6D
	php		; 08
	ror $6F08.w		; 6E 08 6F
	php		; 08
	bvs   8.b		; 70 08
	adc ($08.b),Y		; 71 08
	adc ($0C.b)		; 72 0C
	adc ($0C.b,S),Y		; 73 0C
	stz $0C.b,X		; 74 0C
	adc $00.b,X		; 75 00
	ror $00.b,X		; 76 00
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
	brk $81.b		; 00 81
	brk $11.b		; 00 11
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $87.b		; 00 87
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
	brk $98.b		; 00 98
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	brk $A1.b		; 00 A1
	brk $A2.b		; 00 A2
	brk $A3.b		; 00 A3
	brk $A4.b		; 00 A4
	brk $A5.b		; 00 A5
	tsb $0CA6.w		; 0C A6 0C
	lda [$08.b]		; A7 08
	tay		; A8
	php		; 08
	lda #$08.b		; A9 08
	tax		; AA
	php		; 08
	plb		; AB
	php		; 08
	ldy $AD08.w		; AC 08 AD
	tsb $0CAE.w		; 0C AE 0C
	lda $00B000.l		; AF 00 B0 00
	lda ($00.b),Y		; B1 00
	lda ($00.b)		; B2 00
	lda ($00.b,S),Y		; B3 00
	ldy $00.b,X		; B4 00
	lda $00.b,X		; B5 00
	sty $00.b		; 84 00
	sta $00.b		; 85 00
	ldx $00.b,Y		; B6 00
	lda [$00.b],Y		; B7 00
	clv		; B8
	brk $B9.b		; 00 B9
	brk $BA.b		; 00 BA
	brk $CE.b		; 00 CE
	dec $CACE.w		; CE CE CA
	cmp $C7C9CC.l		; CF CC C9 C7
	cmp $C3.b		; C5 C3
	cmp ($BE.b,X)		; C1 BE
	cmp $00BC.w		; CD BC 00
	brk $26.b		; 00 26
	xce		; FB
	brk $0B.b		; 00 0B
	cpy #$04.b		; C0 04
	brk $5E.b		; 00 5E
	bit $A4.b		; 24 A4
	ldx $66.b,Y		; B6 66
	bcc  17.b		; 90 11
	tsb $20.b		; 04 20
	stz $0228.w		; 9C 28 02
	ora [$01.b]		; 07 01
	tsb $08.b		; 04 08
	and #$5E.b		; 29 5E
	jmp $1046.w		; 4C 46 10
	wai		; CB
	phb		; 8B
	cpy $62.b		; C4 62
	pld		; 2B
	asl $31.b,X		; 16 31
	ora $BD18E3.l		; 0F E3 18 BD
	bit $92.b		; 24 92
	cmp ($95.b)		; D2 95
	pld		; 2B
	eor ($F6.b),Y		; 51 F6
	txy		; 9B
	bit $66.b		; 24 66
	ora ($10.b)		; 12 10
	cmp [$79.b]		; C7 79
	lda ($6C.b,S),Y		; B3 6C
	sta ($4B.b)		; 92 4B
	jsl $BA9766.l		; 22 66 97 BA
	eor $28B1.w		; 4D B1 28
	cmp $D6F1BF.l,X		; DF BF F1 D6
	eor #$EC.b		; 49 EC
	tay		; A8
	eor [$BF.b]		; 47 BF
	pei ($65.b)		; D4 65
	sbc $8CA6.w,X		; FD A6 8C
	cmp [$59.b],Y		; D7 59
	jmp ($5492.w)		; 6C 92 54
	eor #$A4.b		; 49 A4
	sbc ($A2.b,S),Y		; F3 A2
	phy		; 5A
	phb		; 8B
	and $4DB2.w		; 2D B2 4D
	ror $D3.b,X		; 76 D3
	eor $9224.w,Y		; 59 24 92
	mvn $11,$49		; 54 49 11
	bit $499A.w		; 2C 9A 49
	ldy $599E.w,X		; BC 9E 59
	bit $D2.b,X		; 34 D2
	eor #$2C.b		; 49 2C
	stx $49.b,Y		; 96 49
	and $44.b		; 25 44
	lda ($D9.b)		; B2 D9
	adc $69D2.w		; 6D D2 69
	bit $EB97.w		; 2C 97 EB
	rol $5893.w		; 2E 93 58
	ldx #$10.b		; A2 10
	tsx		; BA
	nop		; EA
	bit #$4F.b		; 89 4F
	adc [$A0.b]		; 67 A0
	sbc #$D9.b		; E9 D9
	stz $02.b,X		; 74 02
	eor #$7D.b		; 49 7D
	rol A		; 2A
	lda $6F66.w		; AD 66 6F
	sta ($AE.b,S),Y		; 93 AE
	cmp [$EF.b],Y		; D7 EF
	sed		; F8
	rol $4AFE.w,X		; 3E FE 4A
	eor #$32.b		; 49 32
	cmp $9E.b,S		; C3 9E
	jsr ($C78F.w,X)		; FC 8F C7
	tsb $70.b		; 04 70
	ror $70.b		; 66 70
	cmp ($48.b)		; D2 48
	eor [$B6.b],Y		; 57 B6
	sta $2DAC.w,Y		; 99 AC 2D
	ora $F20802.l,X		; 1F 02 08 F2
	rtl		; 6B

	mvn $85,$49		; 54 49 85
	pha		; 48
	lda $B1.b,S		; A3 B1
	sta ($51.b),Y		; 91 51
	eor ($12.b),Y		; 51 12
	ror $B5.b,X		; 76 B5
	mvp $75,$D9		; 44 D9 75
	cmp $AF1FF5.l		; CF F5 1F AF
	dec $51.b,X		; D6 51
	rol $D48E.w,X		; 3E 8E D4
	sta ($44.b),Y		; 91 44
	dec $77E7.w,X		; DE E7 77
	lsr $5C53.w		; 4E 53 5C
	eor ($36.b),Y		; 51 36
	and $3E.b,X		; 35 3E
	adc ($5C.b,S),Y		; 73 5C
	eor ($3E.b),Y		; 51 3E
	eor $81.b		; 45 81
	.db $62, $A2, $23		; 62 A2 23
	jsl $CF9388.l		; 22 88 93 CF
	bit $93.b		; 24 93
	stx $EC3A.w		; 8E 3A EC
	cmp #$8F.b		; C9 8F
	lda $630C04.l,X		; BF 04 0C 63
	cmp $110141.l		; CF 41 01 11
	sbc $27C7.w,X		; FD C7 27
	adc $C48D85.l,X		; 7F 85 8D C4
	tax		; AA
	phx		; DA
	lda $0A00.w		; AD 00 0A
	and $9C746F.l		; 2F 6F 74 9C
	ora $BF1E.w		; 0D 1E BF
	eor $6FAF.w,X		; 5D AF 6F
	cmp $56.b,X		; D5 56
	.db $42, $33		; 42 33
	asl $B4BB.w,X		; 1E BB B4
	cmp $DA3274.l,X		; DF 74 32 DA
	sta $1FC7.w		; 8D C7 1F
	tsa		; 3B
	adc $80.b,S		; 63 80
	sta $D53D.w		; 8D 3D D5
	ora $CD.b,X		; 15 CD
	txy		; 9B
	cmp $59F39B.l		; CF 9B F3 59
	sbc [$1B.b],Y		; F7 1B
	tyx		; BB
	tda		; 7B
	ldy $C3F7.w,X		; BC F7 C3
	cmp $26CAF9.l,X		; DF F9 CA 26
.ACCU 16
	rep #$A3		; C2 A3
	eor ($D8.b),Y		; 51 D8
	tay		; A8
	dey		; 88
	cmp ($02.b,X)		; C1 02
	bit #$A7AE.w		; 89 AE A7
	lda $EE2D.w		; AD 2D EE
	pei ($4D.b)		; D4 4D
	ldy $84.b		; A4 84
	plp		; 28
	dey		; 88
	pha		; 48
	sta $11.b		; 85 11
	plp		; 28
	mvn $1C,$44		; 54 44 1C
	adc ($F7.b),Y		; 71 F7
	pei ($4B.b)		; D4 4B
	.db $82, $06, $30		; 82 06 30
	cop $B6.b		; 02 B6
	lda $E32E2B.l,X		; BF 2B 2E E3
	iny		; C8
	lda $83C6.w,X		; BD C6 83
	stz $0579.w		; 9C 79 05
	bmi -126.b		; 30 82
	plx		; FA
	sbc ($B7.b,S),Y		; F3 B7
	sta $80C1D9.l,X		; 9F D9 C1 80
	cmp #$01E0.w		; C9 E0 01
	sta [$F3.b]		; 87 F3
	sbc ($F1.b,S),Y		; F3 F1
	and $D4D8.w,Y		; 39 D8 D4
	and #$2337.w		; 29 37 23
	txy		; 9B
	sta $EBA1B9.l		; 8F B9 A1 EB
	inc $43A6.w,X		; FE A6 43
	eor ($D8.b),Y		; 51 D8
	cpx #$85.b		; E0 85
	dey		; 88
	.db $42, $2D		; 42 2D
	and $ECBF45.l		; 2F 45 BF EC
	ror A		; 6A
	dec $62.b,X		; D6 62
	cli		; 58
	ror $70.b		; 66 70
	bne -124.b		; D0 84
	and ($19.b)		; 32 19
	sbc ($B9.b,S),Y		; F3 B9
	asl $5C.b,X		; 16 5C
	jsr ($10BA.w,X)		; FC BA 10
	sty $54.b		; 84 54
	eor $7958.w		; 4D 58 79
	stz $0A4B.w		; 9C 4B 0A
	dex		; CA
	tay		; A8
	adc ($AE.b),Y		; 71 AE
	pei ($49.b)		; D4 49
	and #$1515.w		; 29 15 15
	ldx $0F87.w		; AE 87 0F
	and ($BE.b,S),Y		; 33 BE
	sbc $5A38.w		; ED 38 5A
	ora $13.b,X		; 15 13
	adc $54.b,S		; 63 54
	eor [$BB.b],Y		; 57 BB
	and $1C27.w,Y		; 39 27 1C
	ldy $5476.w		; AC 76 54
	dex		; CA
	cmp $EF95.w,Y		; D9 95 EF
	and [$9C.b]		; 27 9C
	adc $4420.w,Y		; 79 20 44
	cmp ($7A.b,S),Y		; D3 7A
	ror $64.b,X		; 76 64
	sty $E1.b		; 84 E1
	rol $B5.b		; 26 B5
	cmp ($1D.b,X)		; C1 1D
	lda ($DC.b),Y		; B1 DC
	ora $C5.b,X		; 15 C5
	bcc -110.b		; 90 92
	eor $B3.b,X		; 55 B3
	ora ($D5.b),Y		; 11 D5
	asl $34A9.w,X		; 1E A9 34
	sty $24.b,X		; 94 24
	sty $E8.b,X		; 94 E8
	pea $7945.w		; F4 45 79
	xba		; EB
	ora $5A69.w,X		; 1D 69 5A
	eor $3F7D.w		; 4D 7D 3F
	lsr $9AFE.w,X		; 5E FE 9A
	cmp $4D9A08.l,X		; DF 08 9A 4D
	asl $8F23.w,X		; 1E 23 8F
	jmp $69C0DF.l		; 5C DF C0 69
	wai		; CB
	sbc ($33.b)		; F2 33
	stz $75.b		; 64 75
	.db $42, $89		; 42 89
	bit $68.b,X		; 34 68
	cld		; D8
	mvn $75,$98		; 54 98 75
	sta [$7E.b]		; 87 7E
	bit $E3.b		; 24 E3
	sty $D165.w		; 8C 65 D1
	tay		; A8
	rol $27.b,X		; 36 27
	dec $7D.b		; C6 7D
	tsb $10.b		; 04 10
	lsr A		; 4A
	pld		; 2B
	ora [$48.b]		; 07 48
	cmp $BDE9.w		; CD E9 BD
	rol $34CA.w		; 2E CA 34
	adc $224B.w		; 6D 4B 22
	sed		; F8
	sty $FF.b		; 84 FF
	stx $60.b		; 86 60
	dec $09.b,X		; D6 09
	plp		; 28
	pei ($6A.b)		; D4 6A
	and $1F.b,X		; 35 1F
	asl $4897.w		; 0E 97 48
	lsr A		; 4A
	trb $4F.b		; 14 4F
	jsr ($14C2.w,X)		; FC C2 14
	mvp $64,$6C		; 44 6C 64
	eor ($35.b),Y		; 51 35
	cmp [$1D.b]		; C7 1D
	ror $64.b,X		; 76 64
	cmp [$5D.b]		; C7 5D
	adc $DFE7.w,Y		; 79 E7 DF
	adc $08.b,S		; 63 08
	sty $80F2.w		; 8C F2 80
	ldy $74.b		; A4 74
	asl $94.b		; 06 94
	sty $3312.w		; 8C 12 33
	ldx $A31E.w,Y		; BE 1E A3
	sbc ($EC.b,X)		; E1 EC
	beq 115.b		; F0 73
	sta $511287.l,X		; 9F 87 12 51
	cpy #$63.b		; C0 63
	pei ($75.b)		; D4 75
	tyx		; BB
	jsr $1706.w		; 20 06 17
	stx $F6.b,Y		; 96 F6
	jmp ($536A.w,X)		; 7C 6A 53
	and [$38.b],Y		; 37 38
	and $8CDEEF.l,X		; 3F EF DE 8C
	sty $4284.w		; 8C 84 42
	and ($10.b,X)		; 21 10
	dey		; 88
	cli		; 58
	sty $21.b		; 84 21
	php		; 08
	.db $42, $2E		; 42 2E
	ror $6A1C.w		; 6E 1C 6A
	bpl -29.b		; 10 E3
	eor $EDA8.w,X		; 5D A8 ED
	lsr A		; 4A
	jmp.w [$2699]		; DC 99 26
	cmp ($4D.b),Y		; D1 4D
	lsr $618F.w,X		; 5E 8F 61
	sta $2F.b,S		; 83 2F
	sta ($2A.b,S),Y		; 93 2A
	and [$A3.b],Y		; 37 A3
	adc $D844.w,Y		; 79 44 D8
	mvn $35,$6A		; 54 6A 35
	ora ($07.b),Y		; 11 07
	cmp $69F4EB.l,X		; DF EB F4 69
	bit $EB.b		; 24 EB
	lda $BCFB3D.l		; AF 3D FB BC
	eor $D3E753.l		; 4F 53 E7 D3
	ror $4DBC.w		; 6E BC 4D
	tax		; AA
	eor $9F8C65.l		; 4F 65 8C 9F
	sbc ($FF.b),Y		; F1 FF
	adc ($58.b,S),Y		; 73 58
	sei		; 78
	bpl  64.b		; 10 40
	ora $7F.b,S		; 03 7F
	sbc $865D.w,X		; FD 5D 86
	sbc $B9F1B1.l,X		; FF B1 F1 B9
	mvn $89,$2F		; 54 2F 89
	tas		; 1B
	bne -87.b		; D0 A9
	dey		; 88
	iny		; C8
	adc $7DF9.w,Y		; 79 F9 7D
	ldx $D2A6.w,Y		; BE A6 D2
	inc $EE.b,X		; F6 EE
	dec $046D.w,X		; DE 6D 04
	jsr $2E5A.w		; 20 5A 2E
	asl $9763.w		; 0E 63 97
	tad		; 5B
	sta ($84.b)		; 92 84
	and ($02.b,X)		; 21 02
	.db $82, $3C, $0B		; 82 3C 0B
	ora $B5F3.w,Y		; 19 F3 B5
	tsa		; 3B
	adc $71CEB9.l,X		; 7F B9 CE 71
	tay		; A8
	tay		; A8
	sty $2B.b		; 84 2B
	phb		; 8B
	stx $43.b,Y		; 96 43
	lsr $A157.w		; 4E 57 A1
	dec $9BF6.w,X		; DE F6 9B
	cpx $A4.b		; E4 A4
	.db $42, $10		; 42 10
	sta $FC.b		; 85 FC
	bit $0BDC.w,X		; 3C DC 0B
	trb $92.b		; 14 92
	inc $086E.w,X		; FE 6E 08
	.db $42, $10		; 42 10
	tya		; 98
	cpy #$01.b		; C0 01
	sty $C1.b		; 84 C1
	cmp ($08.b),Y		; D1 08
	inc A		; 1A
	mvp $C7,$D7		; 44 D7 C7
	and [$D0.b]		; 27 D0
	stz $F2.b		; 64 F2
	and [$B4.b]		; 27 B4
	adc #$A64E.w		; 69 4E A6
	rol $414B.w		; 2E 4B 41
	ldy #$0D.b		; A0 0D
	cmp $DA64.w,Y		; D9 64 DA
	stp		; DB
	adc $535A28.l		; 6F 28 5A 53
	sbc $79F1.w		; ED F1 79
	tya		; 98
	ror $ABDE.w,X		; 7E DE AB
	sbc $FCBE.w		; ED BE FC
	eor ($3F.b)		; 52 3F
	trb $3B1C.w		; 1C 1C 3B
	eor $DAB267.l,X		; 5F 67 B2 DA
	sed		; F8
	bit $FF5C.w,X		; 3C 5C FF
	sta $42AB.w,X		; 9D AB 42
	bpl -124.b		; 10 84
	and ($F0.b,X)		; 21 F0
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	and ($4E.b),Y		; 31 4E
	eor $7ACA4D.l,X		; 5F 4D CA 7A
	sty $87BC.w		; 8C BC 87
	ror A		; 6A
	and ($02.b,X)		; 21 02
	ora [$87.b],Y		; 17 87
	lda ($D7.b,S),Y		; B3 D7
	rtl		; 6B

	sbc #$F0CA.w		; E9 CA F0
	rol $DD.b,X		; 36 DD
	lda $9332B1.l		; AF B1 32 93
	sta $9485.w		; 8D 85 94
	rol $DA.b		; 26 DA
	beq -10.b		; F0 F6
	stz $3616.w,X		; 9E 16 36
	bvc  66.b		; 50 42
	lda $BC73EA.l,X		; BF EA 73 BC
	adc $5513.w,Y		; 79 13 55
	inc $97.b		; E6 97
	lda $F4DD.w,Y		; B9 DD F4
	adc ($A2.b)		; 72 A2
	bpl -110.b		; 10 92
	lsr $A427.w		; 4E 27 A4
	ror $EEDE.w,X		; 7E DE EE
	sbc ($4B.b,S),Y		; F3 4B
	cpy $FFFB.w		; CC FB FF
	xce		; FB
	tay		; A8
	eor #$4208.w		; 49 08 42
	and ($64.b,X)		; 21 64
	sta $24BBF8.l		; 8F F8 BB 24
	lda ($8D.b,S),Y		; B3 8D
	stx $4B.b,Y		; 96 4B
	ora $1C1C.w,X		; 1D 1C 1C
	bpl -110.b		; 10 92
	eor $F256.w		; 4D 56 F2
	trb $7B.b		; 14 7B
	txs		; 9A
	sta $2C79.w,X		; 9D 79 2C
	eor ($26.b),Y		; 51 26
	mvp $0A,$21		; 44 21 0A
	jmp ($256A.w,X)		; 7C 6A 25
	dey		; 88
	.db $42, $A5		; 42 A5
	and ($44.b),Y		; 31 44
	lda ($0B.b),Y		; B1 0B
	dec $0083.w,X		; DE 83 00
	eor ($25.b),Y		; 51 25
	cmp [$09.b]		; C7 09
	cpx #$00.b		; E0 00
	sbc $8F.b,S		; E3 8F
	sbc [$18.b]		; E7 18
	cpy #$1A.b		; C0 1A
	.db $62, $18, $45		; 62 18 45
	eor $1FE4E5.l		; 4F E5 E4 1F
	and $FF5A.w		; 2D 5A FF
	ror $DA.b,X		; 76 DA
	lda $9B584A.l		; AF 4A 58 9B
	cmp $5B.b,S		; C3 5B
	cmp $B5.b,S		; C3 B5
	beq -74.b		; F0 B6
	sta $F7B7.w,X		; 9D B7 F7
	adc ($AE.b),Y		; 71 AE
	rol $74.b,X		; 36 74
	sbc $E346.w,X		; FD 46 E3
	sta $F566.w		; 8D 66 F5
	trb $21.b		; 14 21
	asl $38.b,X		; 16 38
	ora ($68.b,S),Y		; 13 68
	adc #$A4EE.w		; 69 EE A4
	ror $D734.w,X		; 7E 34 D7
	and ($98.b)		; 32 98
	iny		; C8
	.db $42, $10		; 42 10
	sty $A8.b		; 84 A8
	eor $59E4.w		; 4D E4 59
	lsr $6C69.w,X		; 5E 69 6C
	sed		; F8
	cmp $2DAC.w,Y		; D9 AC 2D
	ora $D02D0B.l		; 0F 0B 2D D0
	lsr A		; 4A
	and $DD.b,X		; 35 DD
	eor $57E3.w,X		; 5D E3 57
	jmp ($EB39.w,X)		; 7C 39 EB
	phb		; 8B
	stz $D8D7.w,X		; 9E D7 D8
	dex		; CA
	adc $24.b,S		; 63 24
	sta ($91.b,S),Y		; 93 91
	adc $987B.w,X		; 7D 7B 98
	rol $2C72.w		; 2E 72 2C
	plb		; AB
	sbc ($6D.b),Y		; F1 6D
	jsr $8AF2.w		; 20 F2 8A
.INDEX 16
	rep #$59		; C2 59
	plp		; 28
	sbc #$59C8.w		; E9 C8 59
	and $F1.b,S		; 23 F1
	dey		; 88
	.db $42, $10		; 42 10
	sty $65.b		; 84 65
	cpy $21.b		; C4 21
	php		; 08
	eor $85.b,S		; 43 85
	bra -47.b		; 80 D1
	php		; 08
	.db $42, $10		; 42 10
	dey		; 88
	eor $AC7030.l		; 4F 30 70 AC
	ora $CA2B.w,X		; 1D 2B CA
	cmp ($59.b)		; D2 59
	bit $2296.w		; 2C 96 22
	ora ($08.b),Y		; 11 08
	sty $44.b		; 84 44
	and [$A4.b]		; 27 A4
	adc [$CC.b]		; 67 CC
	cpx #$2184.w		; E0 84 21
	php		; 08
	sty $4C.b,X		; 94 4C
	rol $BD93.w,X		; 3E 93 BD
	and ($62.b,S),Y		; 33 62
	bpl -119.b		; 10 89
	ldx $C4.b		; A6 C4
	cmp $9F.b,X		; D5 9F
	ldy $D1.b		; A4 D1
	php		; 08
	.db $42, $32		; 42 32
	stx $B0.b		; 86 B0
	ldx $C42E.w,Y		; BE 2E C4
	and ($08.b,X)		; 21 08
	lsr $9C.b		; 46 9C
	txs		; 9A
	eor [$12.b],Y		; 57 12
	bit #$9945.w		; 89 45 99
	sta $E15002.l,X		; 9F 02 50 E1
	phy		; 5A
	dec A		; 3A
	ror $0D.b		; 66 0D
	jsr $FC13.w		; 20 13 FC
	adc ($25.b)		; 72 25
	bit $C5.b,X		; 34 C5
	and $01C289.l		; 2F 89 C2 01
	ldx $11.b		; A6 11
	tyx		; BB
	bpl -124.b		; 10 84
	jsl $8E1E32.l		; 22 32 1E 8E
	eor [$1E.b],Y		; 57 1E
	clv		; B8
	.db $42, $10		; 42 10
	sta $EA.b,S		; 83 EA
	rol $D5.b,X		; 36 D5
	adc $F5FF.w,X		; 7D FF F5
	eor $4F850A.l		; 4F 0A 85 4F
	ldx $379E.w		; AE 9E 37
	bne -29.b		; D0 E3
	ror $D0.b		; 66 D0
	lda ($E3.b,S),Y		; B3 E3
	adc #$5BB7.w		; 69 B7 5B
	jmp ($6F3F.w,X)		; 7C 3F 6F
	sta $F7.b		; 85 F7
	ldx $1FC9.w,Y		; BE C9 1F
	ror $E34F.w,X		; 7E 4F E3
	sbc $9833.w,X		; FD 33 98
	bmi  71.b		; 30 47
	sbc $F9.b,S		; E3 F9
	jmp $D6BBDF.l		; 5C DF BB D6
	jsr ($F252.w,X)		; FC 52 F2
	rol A		; 2A
	tyx		; BB
	lda ($F1.b)		; B2 F1
	jmp ($3670.w)		; 6C 70 36
	dec A		; 3A
	jmp.w [$17FF]		; DC FF 17
	bit #$D0A0.w		; 89 A0 D0
	adc ($11.b),Y		; 71 11
	sbc ($50.b)		; F2 50
	ora ($21.b,S),Y		; 13 21
	ror $D64C.w,X		; 7E 4C D6
	ora $ED.b,X		; 15 ED
	lda [$B9.b]		; A7 B9
	cld		; D8
	adc $7A.b		; 65 7A
	plp		; 28
	sta $92.b		; 85 92
	rol $19D7.w,X		; 3E D7 19
	php		; 08
	sty $24.b		; 84 24
	and ($08.b,X)		; 21 08
	lda $30.b		; A5 30
	.db $42, $13		; 42 13
	lda $2C.b,X		; B5 2C
	dec A		; 3A
	and $2CB9.w,Y		; 39 B9 2C
	sbc $FB9AB5.l		; EF B5 9A FB
	sta $2965.w,X		; 9D 65 29
	.db $42, $57		; 42 57
	eor #$4488.w		; 49 88 44
	bvs 107.b		; 70 6B
	bit $63BD.w,X		; 3C BD 63
	stp		; DB
	eor $1505.w		; 4D 05 15
	sta $4393.w,Y		; 99 93 43
	asl $4D66.w,X		; 1E 66 4D
	trb $6A79.w		; 1C 79 6A
	and $95.b,X		; 35 95
	and $D2.b		; 25 D2
	eor #$C7F7.w		; 49 F7 C7
	iny		; C8
	txy		; 9B
	phb		; 8B
	cpy $3EFB.w		; CC FB 3E
	jmp ($716E.w)		; 6C 6E 71
	ora ($79.b,S),Y		; 13 79
	ora $D35D.w,X		; 1D 5D D3
	php		; 08
	sta $9E1257.l,X		; 9F 57 12 9E
	and $468342.l,X		; 3F 42 83 46
	sta ($29.b),Y		; 91 29
	php		; 08
	.db $42, $10		; 42 10
	sty $42.b		; 84 42
	and ($08.b,X)		; 21 08
	.db $42, $10		; 42 10
	sty $56.b		; 84 56
	eor $42.b,X		; 55 42
	bpl -124.b		; 10 84
	and ($1A.b,X)		; 21 1A
	lda $DBC033.l,X		; BF 33 C0 DB
	adc [$F8.b]		; 67 F8
	ldx $61E7.w,Y		; BE E7 61
	ldx $E9D7.w		; AE D7 E9
	lda [$4F.b],Y		; B7 4F
	iny		; C8
	sbc $1A.b,X		; F5 1A
	lda $9C.b,X		; B5 9C
	eor $A706.w		; 4D 06 A7
	adc $F4C36B.l		; 6F 6B C3 F4
	tsa		; 3B
	cmp $82AF.w,X		; DD AF 82
	sty $0A.b		; 84 0A
	jmp ($72E1.w,X)		; 7C E1 72
	tsx		; BA
	adc $995F.w		; 6D 5F 99
	sta ($63.b,X)		; 81 63
	sta $FDB95D.l		; 8F 5D B9 FD
	.db $82, $10, $99		; 82 10 99
	tsb $CCF9.w		; 0C F9 CC
	stx $F6.b		; 86 F6
	cmp ($0F.b,S),Y		; D3 0F
	and ($02.b)		; 32 02
	bpl -124.b		; 10 84
	cmp [$38.b],Y		; D7 38
	sta $B9558F.l,X		; 9F 8F 55 B9
	adc #$928F.w		; 69 8F 92
	cmp $A47D1B.l,X		; DF 1B 7D A4
	cld		; D8
	sbc $7E3E.w,Y		; F9 3E 7E
	asl $DBA7.w,X		; 1E A7 DB
	sbc ($FE.b,S),Y		; F3 FE
	lda $B2F797.l,X		; BF 97 F7 B2
	inx		; E8
	adc $C7.b		; 65 C7
	sta [$7F.b],Y		; 97 7F
	ora [$9B.b]		; 07 9B
	ldx $72DC.w		; AE DC 72
	jmp ($19B9.w)		; 6C B9 19
	ror $FD85.w		; 6E 85 FD
	ldy $06F0.w		; AC F0 06
	ora [$5F.b]		; 07 5F
	beq 115.b		; F0 73
	sbc ($E3.b)		; F2 E3
	php		; 08
	sta [$55.b],Y		; 97 55
	lda $DD3B6D.l,X		; BF 6D 3B DD
	ror $3E.b		; 66 3E
	phk		; 4B
	lsr A		; 4A
	ldx $05.b		; A6 05
	ora #$ECF7.w		; 09 F7 EC
	cmp $2C72.w,Y		; D9 72 2C
	lda $CAAE.w,X		; BD AE CA
	jmp ($D6EC.w,X)		; 7C EC D6
	trb $AA.b		; 14 AA
	jmp ($FA06.w,X)		; 7C 06 FA
	eor $70.b,X		; 55 70
	tad		; 5B
	ror $59.b,X		; 76 59
	sty $5E.b,X		; 94 5E
	sbc $531F3D.l		; EF 3D 1F 53
	tsx		; BA
	lda ($34.b,X)		; A1 34
	tad		; 5B
	sta $5B47.w		; 8D 47 5B
	sbc ($71.b),Y		; F1 71
	sbc ($B9.b,S),Y		; F3 B9
	sbc $A18587.l		; EF 87 85 A1
	jsr ($079F.w,X)		; FC 9F 07
	sbc $E05AE9.l,X		; FF E9 5A E0
	lda $17B734.l		; AF 34 B7 17
	bit $F985.w		; 2C 85 F9
	rol $3A.b,X		; 36 3A
	dec $6E4E.w,X		; DE 4E 6E
	jmp ($08E1.w,X)		; 7C E1 08
	eor $A235.w,Y		; 59 35 A2
	sta $E9EC3B.l,X		; 9F 3B EC E9
	bmi -91.b		; 30 A5
	eor ($42.b),Y		; 51 42
	ora [$F5.b],Y		; 17 F5
	sbc $DD7FA4.l		; EF A4 7F DD
	jsr ($4FBE.w,X)		; FC BE 4F
	sbc $7DF5.w		; ED F5 7D
	adc [$10.b],Y		; 77 10
	sty $8E.b		; 84 8E
	lsr $B863.w,X		; 5E 63 B8
	sbc $59.b,X		; F5 59
	phd		; 0B
	jmp $4234A1.l		; 5C A1 34 42
	.db $42, $11		; 42 11
	and $F4.b,S		; 23 F4
	ldx $33.b		; A6 33
	adc $43.b		; 65 43
	bmi  61.b		; 30 3D
	cmp ($9E.b,S),Y		; D3 9E
	sbc ($7C.b,X)		; E1 7C
	bmi -119.b		; 30 89
	dey		; 88
	cmp $18.b,S		; C3 18
	mvp $08,$E8		; 44 E8 08
	sta $831BB4.l		; 8F B4 1B 83
	sta ($F5.b,S),Y		; 93 F5
	stz $1AFF.w,X		; 9E FF 1A
	sbc ($E9.b)		; F2 E9
	sta $18.b,S		; 83 18
	ora $1B.b,S		; 03 1B
	rol $54A1.w,X		; 3E A1 54
	bit #$4FBB.w		; 89 BB 4F
	phd		; 0B
	adc [$E1.b]		; 67 E1
	iny		; C8
	dex		; CA
	sta $9F8C.w,Y		; 99 8C 9F
	eor ($17.b,S),Y		; 53 17
	bit #$BACD.w		; 89 CD BA
	jmp ($BBFB.w)		; 6C FB BB
	adc $D43D.w,X		; 7D 3D D4
	sbc #$42E8.w		; E9 E8 42
	and ($10.b,X)		; 21 10
	bit #$0E79.w		; 89 79 0E
	pei ($7A.b)		; D4 7A
	sty $4ECA.w		; 8C CA 4E
	pei ($97.b)		; D4 97
	bcc -19.b		; 90 ED
	phk		; 4B
	tsb $7949.w		; 0C 49 79
	inc A		; 1A
	sta $59C7.w		; 8D C7 59
	sbc ($D0.b),Y		; F1 D0
	txy		; 9B
	adc ($73.b),Y		; 71 73
	cmp $B8E8CB.l		; CF CB E8 B8
	plp		; 28
	mvp $68,$70		; 44 70 68
	sei		; 78
	eor $A7DF.w,X		; 5D DF A7
	dex		; CA
	sbc #$4CA9.w		; E9 A9 4C
	xba		; EB
	lda $1BE7.w,X		; BD E7 1B
	eor $1656.w,Y		; 59 56 16
	and ($08.b,X)		; 21 08
	eor [$7F.b]		; 47 7F
	sbc [$0B.b]		; E7 0B
	sta $EDD49D.l		; 8F 9D D4 ED
	bne -29.b		; D0 E3
	bvc -124.b		; 50 84
	inc A		; 1A
	sta ($28.b,S),Y		; 93 28
	cmp $A080.w		; CD 80 A0
	sta $33F9.w		; 8D F9 33
	jsr ($5459.w,X)		; FC 59 54
	cpy #$1BCC.w		; C0 CC 1B
	ora ($50.b)		; 12 50
	cpx $F9.b		; E4 F9
	cld		; D8
	asl $3E.b,X		; 16 3E
	lsr $B1C3.w		; 4E C3 B1
	tsa		; 3B
	lda ($D1.b,S),Y		; B3 D1
	asl $8637.w,X		; 1E 37 86
	tsa		; 3B
	tas		; 1B
	asl $1B.b		; 06 1B
	inc $C5.b,X		; F6 C5
	lda ($F9.b),Y		; B1 F9
	cmp $DE51.w		; CD 51 DE
	asl $7E39.w,X		; 1E 39 7E
	ror A		; 6A
	sta $9BD064.l		; 8F 64 D0 9B
	ldx #$FE81.w		; A2 81 FE
	lsr $1C20.w		; 4E 20 1C
	adc $86.b,S		; 63 86
	eor $3F309B.l,X		; 5F 9B 30 3F
	lda ($12.b),Y		; B1 12
	clv		; B8
	cpx #$915F.w		; E0 5F 91
	tsa		; 3B
	cmp $0E30.w,Y		; D9 30 0E
	adc ($11.b,X)		; 61 11
	phy		; 5A
	lda $C8C5.w		; AD C5 C8
	dec $C1.b		; C6 C1
	plx		; FA
	adc $0559.w,Y		; 79 59 05
	lsr A		; 4A
	lda $F034.w,Y		; B9 34 F0
	lda #$D7F5.w		; A9 F5 D7
	ora [$37.b],Y		; 17 37
	tyx		; BB
	cmp ($68.b),Y		; D1 68
	sed		; F8
	tsb $4B.b		; 04 4B
	sbc $9E.b		; E5 9E
	sta $5D.b,X		; 95 5D
	ora [$07.b],Y		; 17 07
	lda $F6.b,X		; B5 F6
	brk $31.b		; 00 31
	eor #$2BC2.w		; 49 C2 2B
	rol A		; 2A
	tyx		; BB
	eor ($C0.b,S),Y		; 53 C0
	stp		; DB
	brk $4F.b		; 00 4F
	ora ($FA.b),Y		; 11 FA
	and $A6AE.w,X		; 3D AE A6
	sbc $566B87.l,X		; FF 87 6B 56
	bcs   0.b		; B0 00
	and [$95.b]		; 27 95
	lda [$A7.b]		; A7 A7
	adc $7375F2.l		; 6F F2 75 73
	sbc [$34.b]		; E7 34
	tax		; AA
	brk $34.b		; 00 34
	asl A		; 0A
	ora $91.b		; 05 91
	lda $42D2.w,X		; BD D2 42
	iny		; C8
	cli		; 58
	bit #$6CC4.w		; 89 C4 6C
	lda $B7C9.w		; AD C9 B7
	tyx		; BB
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	trb $5E.b		; 14 5E
	lda $B8B4.w,X		; BD B4 B8
	lda $1042.w,Y		; B9 42 10
	sty $20.b		; 84 20
	.db $42, $64		; 42 64
	rol $0835.w		; 2E 35 08
	.db $42, $04		; 42 04
	and ($0A.b,X)		; 21 0A
	php		; 08
	jmp.w [$116A]		; DC 6A 11
	inc $F4.b,X		; F6 F4
	sty $E5.b,X		; 94 E5
	php		; 08
	.db $42, $13		; 42 13
	and ($7E.b,X)		; 21 7E
	eor $B786.w		; 4D 86 B7
	sta ($9B.b,S),Y		; 93 9B
	lda $30.b		; A5 30
	.db $42, $10		; 42 10
	sty $6F.b		; 84 6F
	phd		; 0B
	adc $78.b,S		; 63 78
	tad		; 5B
	tas		; 1B
.INDEX 16
	rep #$D8		; C2 D8
	dec $D116.w,X		; DE 16 D1
	pha		; 48
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $F4.b		; 06 F4
	brk $10.b		; 00 10
	asl $BB.b		; 06 BB
	inc A		; 1A
	ldy $0000.w,X		; BC 00 00
	lda $BCBC.w,X		; BD BC BC
	ldx $0CBA.w,Y		; BE BA 0C
	lda $C0BEBE.l,X		; BF BE BE C0
	lda $C1BD.w,X		; BD BD C1
	lda $C1C2BF.l,X		; BF BF C2 C1
	cmp ($C3.b,X)		; C1 C3
	cpy #$C4C0.w		; C0 C0 C4
	brk $5D.b		; 00 5D
	cmp $C4.b		; C5 C4
	cpy $C6.b		; C4 C6
	rep #$C2		; C2 C2
	cmp [$C3.b]		; C7 C3
	cmp $C8.b,S		; C3 C8
	cmp $C5.b		; C5 C5
	cmp #$C6C6.w		; C9 C6 C6
	dex		; CA
	cmp [$C7.b]		; C7 C7
	wai		; CB
	iny		; C8
	iny		; C8
	cpy $C9C9.w		; CC C9 C9
	cmp $CACA.w		; CD CA CA
	dec $CBCB.w		; CE CB CB
	cmp $D000BC.l		; CF BC 00 D0
	cpy $D1CC.w		; CC CC D1
	cmp $D2CD.w		; CD CD D2
	cpy $00.b		; C4 00
	cmp ($C0.b,S),Y		; D3 C0
	cmp $CECED4.l		; CF D4 CE CE
	cmp $D0.b,X		; D5 D0
	bne  64.b		; D0 40
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $D1.b,S		; 03 D1
	cmp ($CA.b),Y		; D1 CA
	cmp [$C3.b]		; C7 C3
	lda $01BC.w,X		; BD BC 01
	brk $02.b		; 00 02
	cmp ($03.b,S),Y		; D3 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	cmp ($06.b,S),Y		; D3 06
	brk $07.b		; 00 07
	cmp $090008.l		; CF 08 00 09
	cmp ($0A.b,S),Y		; D3 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	cmp $CF.b,S		; C3 CF
	ora $001000.l		; 0F 00 10 00
	ora ($00.b),Y		; 11 00
	ora ($D3.b)		; 12 D3
	ora ($00.b,S),Y		; 13 00
	trb $C3.b		; 14 C3
	brk $15.b		; 00 15
	cmp $170016.l		; CF 16 00 17
	brk $18.b		; 00 18
	brk $19.b		; 00 19
	brk $1A.b		; 00 1A
	brk $1B.b		; 00 1B
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	cmp $1F001E.l		; CF 1E 00 1F
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $23.b		; 00 23
	brk $24.b		; 00 24
	brk $25.b		; 00 25
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	brk $28.b		; 00 28
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2B.b		; 00 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2E.b		; 00 2E
	cmp $30002F.l		; CF 2F 00 30
	brk $31.b		; 00 31
	brk $32.b		; 00 32
	brk $33.b		; 00 33
	brk $34.b		; 00 34
	brk $35.b		; 00 35
	brk $36.b		; 00 36
	brk $37.b		; 00 37
	brk $38.b		; 00 38
	brk $39.b		; 00 39
	brk $3A.b		; 00 3A
	lda $3B00.w,X		; BD 00 3B
	brk $3C.b		; 00 3C
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $41.b		; 00 41
	brk $42.b		; 00 42
	brk $43.b		; 00 43
	cmp $450044.l		; CF 44 00 45
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	cmp ($48.b,S),Y		; D3 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4B.b		; 00 4B
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
	brk $57.b		; 00 57
	brk $58.b		; 00 58
	brk $59.b		; 00 59
	brk $5A.b		; 00 5A
	brk $5B.b		; 00 5B
	brk $5C.b		; 00 5C
	cmp $D2.b		; C5 D2
	lsr $5F00.w,X		; 5E 00 5F
	brk $60.b		; 00 60
	brk $61.b		; 00 61
	cmp $00.b		; C5 00
	.db $62, $00, $63		; 62 00 63
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
	brk $77.b		; 00 77
	brk $78.b		; 00 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	brk $86.b		; 00 86
	brk $87.b		; 00 87
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
	iny		; C8
	brk $94.b		; 00 94
	iny		; C8
	cmp ($95.b)		; D2 95
	brk $96.b		; 00 96
	iny		; C8
	brk $97.b		; 00 97
	brk $98.b		; 00 98
	cmp $00.b		; C5 00
	sta $9A00.w,Y		; 99 00 9A
	brk $9B.b		; 00 9B
	iny		; C8
	cmp ($9C.b)		; D2 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $96.b		; 00 96
	rti		; 40

	ldy #$A100.w		; A0 00 A1
	cmp $D2.b		; C5 D2
	ldx #$A300.w		; A2 00 A3
	brk $A4.b		; 00 A4
	brk $A5.b		; 00 A5
	cmp ($A6.b)		; D2 A6
	cmp ($A7.b)		; D2 A7
	brk $A8.b		; 00 A8
	brk $A9.b		; 00 A9
	brk $AA.b		; 00 AA
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	cmp ($AD.b)		; D2 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B0.b		; 00 B0
	brk $B1.b		; 00 B1
	brk $B2.b		; 00 B2
	brk $B3.b		; 00 B3
	brk $B4.b		; 00 B4
	brk $B5.b		; 00 B5
	pei ($CE.b)		; D4 CE
	wai		; CB
	brk $B6.b		; 00 B6
	brk $B7.b		; 00 B7
	brk $B8.b		; 00 B8
	iny		; C8
	brk $B9.b		; 00 B9
	pei ($D4.b)		; D4 D4
	brk $D5.b		; 00 D5
	cmp $D5.b,X		; D5 D5
	cpy $D1D1.w		; CC D1 D1
	cmp ($CD.b),Y		; D1 CD
	dex		; CA
	cmp [$C3.b]		; C7 C3
	cpy #$CFBD.w		; C0 BD CF
	tyx		; BB
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $0B.b		; 00 0B
	bcs   5.b		; B0 05
	brk $5D.b		; 00 5D
	lda $5C.b		; A5 5C
	ldx $52.b,Y		; B6 52
	eor $0D12.w		; 4D 12 0D
	sta [$E2.b]		; 87 E2
	sta ($C0.b,S),Y		; 93 C0
	rti		; 40

	cpx #$1910.w		; E0 10 19
	sei		; 78
	cpx $C021.w		; EC 21 C0
	sta $04.b		; 85 04
	stz $97.b		; 64 97
	bit $268E.w,X		; 3C 8E 26
	and $0D.b,S		; 23 0D
	sta $52.b,S		; 83 52
	eor $C232.w,Y		; 59 32 C2
	eor #$CD87.w		; 49 87 CD
	rol $12.b,X		; 36 12
	txa		; 8A
	stz $8B92.w,X		; 9E 92 8B
	mvn $36,$69		; 54 69 36
	ldy $579A.w		; AC 9A 57
	and $4996.w		; 2D 96 49
	bit $89.b		; 24 89
	sbc $A345C5.l,X		; FF C5 45 A3
	lda #$C905.w		; A9 05 C9
	cmp $42E6.w		; CD E6 42
	sbc ($08.b),Y		; F1 08
	tay		; A8
	bit #$A97D.w		; 89 7D A9
	eor [$B6.b]		; 47 B6
	and $C9.b,S		; 23 C9
	ora $24.b,X		; 15 24
	eor $DD9E.w		; 4D 9E DD
	bit $D7.b		; 24 D7
	and ($A3.b)		; 32 A3
	cmp #$D2F6.w		; C9 F6 D2
	eor #$B2A5.w		; 49 A5 B2
	eor $E996.w		; 4D 96 E9
	adc $BE.b		; 65 BE
	xba		; EB
	rol $D992.w		; 2E 92 D9
	ror $5997.w		; 6E 97 59
	and $48D2.w		; 2D D2 48
	plb		; AB
	bit $BA.b		; 24 BA
	pei ($A1.b)		; D4 A1
	lda ($6D.b)		; B2 6D
	ldx #$8A25.w		; A2 25 8A
	lda ($F9.b,S),Y		; B3 F9
	bit $F7.b		; 24 F7
	eor $9A2C.w,Y		; 59 2C 9A
	adc #$A822.w		; 69 22 A8
	adc $A6.b,X		; 75 A6
	txy		; 9B
	adc $0ACA.w		; 6D CA 0A
	ldx #$7EDF.w		; A2 DF 7E
	inc A		; 1A
	adc ($5D.b),Y		; 71 5D
	cmp $A832.w		; CD 32 A8
	inc $DB.b,X		; F6 DB
	adc $D5.b,X		; 75 D5
	eor ($36.b),Y		; 51 36
	stx $9B.b,Y		; 96 9B
	tsa		; 3B
	txa		; 8A
	cpy $9295.w		; CC 95 92
	txa		; 8A
	lda ($27.b,X)		; A1 27
	phx		; DA
	adc #$DCB6.w		; 69 B6 DC
	lda #$CABA.w		; A9 BA CA
	bit $74.b,X		; 34 74
	ldx $6B5C.w		; AE 5C 6B
	tsx		; BA
	stz $E107.w		; 9C 07 E1
	eor $AD.b,X		; 55 AD
	sbc $9DB6.w,Y		; F9 B6 9D
	eor $C4D29F.l		; 4F 9F D2 C4
	beq  -9.b		; F0 F7
	sbc $FADDDB.l,X		; FF DB DD FA
	sbc #$AA25.w		; E9 25 AA
	lda $B5.b,X		; B5 B5
	ror $D7.b,X		; 76 D7
	adc $80.b,S		; 63 80
	inc $EB.b,X		; F6 EB
	cpy #$C0E7.w		; C0 E7 C0
	tax		; AA
	and ($17.b)		; 32 17
	sbc #$A9A8.w		; E9 A8 A9
	sbc $2A.b,S		; E3 2A
	sty $5B.b		; 84 5B
	adc $4B54.w		; 6D 54 4B
	stx $A452.w		; 8E 52 A4
	xba		; EB
	ldy #$2409.w		; A0 09 24
	xce		; FB
	and [$73.b],Y		; 37 73
	adc $E34C.w,Y		; 79 4C E3
	lda ($12.b)		; B2 12
	ora ($54.b),Y		; 11 54
	eor $6A.b,X		; 55 6A
	bvs  99.b		; 70 63
	eor $3F79.w,X		; 5D 79 3F
	sbc ($75.b,X)		; E1 75
	sty $32AA.w		; 8C AA 32
	ora $15.b,X		; 15 15
	ldy $66BE.w		; AC BE 66
	asl A		; 0A
	tay		; A8
	inc $DB.b,X		; F6 DB
	adc ($C5.b),Y		; 71 C5
	eor ($34.b),Y		; 51 34
	and $F4.b,X		; 35 F4
	dec $B3FD.w,X		; DE FD B3
	pea $B60C.w		; F4 0C B6
	rol A		; 2A
	bit #$89BB.w		; 89 BB 89
	lda ($A3.b),Y		; B1 A3
	lda $7EE3.w,Y		; B9 E3 7E
	adc $A8CA.w,X		; 7D CA A8
	sbc [$D4.b]		; E7 D4
	eor #$A38A.w		; 49 8A A3
	phx		; DA
	adc #$D5B6.w		; 69 B6 D5
	eor [$C3.b]		; 47 C3
	asl $1F.b,X		; 16 1F
	iny		; C8
	tax		; AA
	rol $CBCA.w,X		; 3E CA CB
	eor ($A9.b,S),Y		; 53 A9
	eor $08.b,X		; 55 08
	ldy $D2.b,X		; B4 D2
	tay		; A8
	lda [$1C.b],Y		; B7 1C
	lda $6B.b		; A5 6B
	bmi   9.b		; 30 09
	eor ($A3.b),Y		; 51 A3
	lsr A		; 4A
	pei ($8B.b)		; D4 8B
	lda #$E9BE.w		; A9 BE E9
	rtl		; 6B

	and $9287B0.l		; 2F B0 87 92
	sta $9F78FC.l		; 8F FC 78 9F
	cmp ($F9.b,S),Y		; D3 F9
	sei		; 78
	and $5F4A.w,X		; 3D 4A 5F
	cmp #$AEDC.w		; C9 DC AE
	and [$4A.b]		; 27 4A
	jmp ($CC0B.w,X)		; 7C 0B CC
	stp		; DB
	ror $6C.b		; 66 6C
	adc $3F23EB.l,X		; 7F EB 23 3F
	cmp $7275D4.l		; CF D4 75 72
	rol $98.b		; 26 98
	stz $B1.b,X		; 74 B1
	and $8B.b		; 25 8B
	inc $C7E2.w		; EE E2 C7
	cmp [$35.b],Y		; D7 35
	ldx $2D.b,Y		; B6 2D
	lda [$D4.b]		; A7 D4
	bit #$714D.w		; 89 4D 71
	dec $FC.b		; C6 FC
	sec		; 38
	and $3DDA.w,Y		; 39 DA 3D
	phy		; 5A
	sbc ($DF.b),Y		; F1 DF
	tas		; 1B
	eor ($54.b,X)		; 41 54
	and $15.b,S		; 23 15
	tsx		; BA
	eor #$D959.w		; 49 59 D9
	ldy $FDEC.w,X		; BC EC FD
	clv		; B8
	sbc #$BA54.w		; E9 54 BA
	adc ($CB.b),Y		; 71 CB
	cmp [$A0.b]		; C7 A0
	plb		; AB
	eor $DA.b,X		; 55 DA
	sbc [$C6.b]		; E7 C6
	jmp ($66CC.w,X)		; 7C CC 66
	pla		; 68
	ora ($39.b,X)		; 01 39
	mvn $64,$D1		; 54 D1 64
	sta ($55.b,S),Y		; 93 55
	sta $03307F.l,X		; 9F 7F 30 03
	lda ($47.b)		; B2 47
	ora [$3D.b]		; 07 3D
	sbc #$13CC.w		; E9 CC 13
	ora $45.b		; 05 45
	asl $0ECF.w		; 0E CF 0E
	rol $994C.w,X		; 3E 4C 99
	ldy $AF96.w		; AC 96 AF
	sec		; 38
	sbc [$74.b]		; E7 74
	ora ($49.b)		; 12 49
	eor $77.b		; 45 77
	bit #$966D.w		; 89 6D 96
	cpx $B4.b		; E4 B4
	cpx #$46D5.w		; E0 D5 46
	tax		; AA
	and ($F7.b),Y		; 31 F7
	inc $5CFC.w		; EE FC 5C
	eor [$05.b],Y		; 57 05
	eor ($6D.b),Y		; 51 6D
	cmp $D951.w,Y		; D9 51 D9
	php		; 08
	mvn $D3,$1A		; 54 1A D3
	eor $4E52.w,Y		; 59 52 4E
	lda ($08.b,X)		; A1 08
	.db $42, $F1		; 42 F1
	adc $E809.w,X		; 7D 09 E8
	php		; 08
	.db $42, $10		; 42 10
	sta $9D.b		; 85 9D
	cmp $FEF8.w,Y		; D9 F8 FE
	ror $957E.w		; 6E 7E 95
	sta HTIMEH.w		; 8D 08 42
	ora ($73.b,S),Y		; 13 73
	and ($08.b,X)		; 21 08
	lda [$06.b]		; A7 06
	cmp $6BF285.l,X		; DF 85 F2 6B
	and $E4DA.w,Y		; 39 DA E4
	xce		; FB
	jmp ($0687.w,X)		; 7C 87 06
	sty $21.b		; 84 21
	php		; 08
	sbc #$9C12.w		; E9 12 9C
	sbc ($08.b,X)		; E1 08
	.db $42, $11		; 42 11
	adc [$87.b],Y		; 77 87
	eor $8B4F87.l		; 4F 87 4F 8B
	adc $33.b		; 65 33
	.db $42, $28		; 42 28
	dec $DF.b,X		; D6 DF
	ror $5165.w,X		; 7E 65 51
	ror $DF74.w,X		; 7E 74 DF
	mvn $B1,$99		; 54 99 B1
	mvn $F6,$7B		; 54 7B F6
	jsr ($EDDC.w,X)		; FC DC ED
	dec A		; 3A
	tay		; A8
	eor ($B4.b,X)		; 41 B4
	sep #$4D		; E2 4D
	and $46.b,X		; 35 46
	phb		; 8B
	cld		; D8
	ora ($74.b,S),Y		; 13 74
	rol $4D4F.w,X		; 3E 4F 4D
	ldx $37.b		; A6 37
	and $1A.b,X		; 35 1A
	and ($BC.b,X)		; 21 BC
	sta $4DC3.w,X		; 9D C3 4D
	and $65.b,S		; 23 65
	and #$D09E.w		; 29 9E D0
	brk $02.b		; 00 02
	lda #$0903.w		; A9 03 09
	bit #$4C88.w		; 89 88 4C
	ror A		; 6A
	clv		; B8
	adc ($BE.b),Y		; 71 BE
	ply		; 7A
	eor $94A42D.l,X		; 5F 2D A4 94
	and [$69.b]		; 27 69
	sta $AFDF.w,X		; 9D DF AF
	cld		; D8
	adc ($F5.b,S),Y		; 73 F5
	adc $ED3D.w,X		; 7D 3D ED
	sbc $95.b,X		; F5 95
	sta $D9F0A3.l		; 8F A3 F0 D9
	cli		; 58
	lda ($B1.b)		; B2 B1
	phd		; 0B
	lda $FE5D17.l,X		; BF 17 5D FE
	cmp $26F6.w,X		; DD F6 26
	sbc ($F7.b,X)		; E1 F7
	lda #$8DC1.w		; A9 C1 8D
	adc $B2.b,X		; 75 B2
	dex		; CA
	adc $A2F8.w,X		; 7D F8 A2
	cmp $D956.w,Y		; D9 56 D9
	wai		; CB
	rtl		; 6B

	rol $6B9E.w		; 2E 9E 6B
	lda $EADCD2.l		; AF D2 DC EA
	lda $E2.b,S		; A3 E2
	txa		; 8A
	eor $4255.w,Y		; 59 55 42
	bit $68.b,X		; 34 68
	tax		; AA
	bit #$D3B4.w		; 89 B4 D3
	xba		; EB
	adc $1DAE.w		; 6D AE 1D
	adc $56.b		; 65 56
	rti		; 40

	tax		; AA
	and $5AF5.w,Y		; 39 F5 5A
	sta $11AAB0.l,X		; 9F B0 AA 11
	adc #$92B4.w		; 69 B4 92
	adc #$34AA.w		; 69 AA 34
	adc #$7552.w		; 69 52 75
	cmp [$9E.b],Y		; D7 9E
	ora [$5D.b]		; 07 5D
	brk $01.b		; 00 01
	sta $59.b		; 85 59
	pea $6E6C.w		; F4 6C 6E
	plb		; AB
	eor $94.b,X		; 55 94
	sbc ($95.b,X)		; E1 95
	stz $56AC.w,X		; 9E AC 56
	and $25.b		; 25 25
	bit $D7BD.w,X		; 3C BD D7
	adc $EC.b,X		; 75 EC
	inc $0E0E.w,X		; FE 0E 0E
	dex		; CA
	tsa		; 3B
	eor $EF30.w,Y		; 59 30 EF
	tsa		; 3B
	lda $254B67.l,X		; BF 67 4B 25
	sec		; 38
	and $54CD.w		; 2D CD 54
	adc $17D4.w,X		; 7D D4 17
	sei		; 78
	ldx $B9.b,Y		; B6 B9
	stx $424B.w		; 8E 4B 42
	adc $0A.b,X		; 75 0A
	bit #$844A.w		; 89 4A 84
	ror A		; 6A
	lda $47.b,S		; A3 47
	lda $DB.b,X		; B5 DB
	tax		; AA
	bit #$0FA7.w		; 89 A7 0F
	adc ($9F.b),Y		; 71 9F
	phk		; 4B
.INDEX 8
	sep #$D7		; E2 D7
	cmp $ED.b,X		; D5 ED
	lda $D8A872.l,X		; BF 72 A8 D8
	adc ($E1.b,X)		; 61 E1
	dec $7AC3.w,X		; DE C3 7A
	cmp ($49.b,S),Y		; D3 49
	tax		; AA
	ora $EBD0.w		; 0D D0 EB
	bit $9FF4.w		; 2C F4 9F
	rol $C196.w,X		; 3E 96 C1
	cmp $1CE705.l,X		; DF 05 E7 1C
	cpx #$62.b		; E0 62
	lda ($EB.b),Y		; B1 EB
	iny		; C8
	rol $01.b		; 26 01
	sta [$18.b]		; 87 18
	lda $E8.b,X		; B5 E8
	sbc $BD89.w,X		; FD 89 BD
	eor $B97C.w,Y		; 59 7C B9
	pea $4DDD.w		; F4 DD 4D
	ldx $E447.w		; AE 47 E4
	cmp $A4ABF3.l		; CF F3 AB A4
	sty $2B.b,X		; 94 2B
	inc A		; 1A
	stz $1ADF.w,X		; 9E DF 1A
	lda ($F6.b)		; B2 F6
	and #$42DC.w		; 29 DC 42
	tax		; AA
	and $9CA6.w,X		; 3D A6 9C
	adc ($24.b),Y		; 71 24
	txs		; 9A
	adc #$A8B6.w		; 69 B6 A8
	cmp ($A5.b),Y		; D1 A5
	dec $CD.b,X		; D6 CD
	eor $9DEEFF.l,X		; 5F FF EE 9D
	adc $EE.b,X		; 75 EE
	plx		; FA
	lda $7207AB.l		; AF AB 07 72
	adc $BD.b		; 65 BD
	adc ($E0.b,X)		; 61 E0
	ora $40597E.l,X		; 1F 7E 59 40
	rol $7A.b		; 26 7A
	eor $9CA4.w		; 4D A4 9C
	eor ($45.b,S),Y		; 53 45
	sbc [$82.b]		; E7 82
	ora [$AA.b]		; 07 AA
	ldy $CC7D.w,X		; BC 7D CC
	tya		; 98
	bmi -98.b		; 30 9E
	ldx #$00.b		; A2 00
	tsb $E4.b		; 04 E4
	lda $63.b		; A5 63
	and $0791.w		; 2D 91 07
	php		; 08
	php		; 08
	cld		; D8
	bmi -40.b		; 30 D8
	txs		; 9A
	cmp $56.b,S		; C3 56
	jmp $3C4E.w		; 4C 4E 3C
	bvs -82.b		; 70 AE
	ldy $4D4F.w,X		; BC 4F 4D
	jmp.w [$CD92]		; DC 92 CD
	sbc $33833D.l		; EF 3D 83 33
	and $E6.b,S		; 23 E6
	adc ($56.b,X)		; 61 56
	plx		; FA
	cmp $F3D9F7.l,X		; DF F7 D9 F3
	rol $DC.b,X		; 36 DC
	lsr $E106.w		; 4E 06 E1
	dec $69.b		; C6 69
	ora $7C8468.l		; 0F 68 84 7C
	sta [$26.b],Y		; 97 26
	adc $CDDC.w		; 6D DC CD
	cmp ($30.b)		; D2 30
	stz $40E4.w,X		; 9E E4 40
	cmp ($6A.b),Y		; D1 6A
	adc $F408.w,X		; 7D 08 F4
	sbc $FD.b,X		; F5 FD
	lda $13FF5E.l,X		; BF 5E FF 13
	ora [$E3.b]		; 07 E3
	pld		; 2B
	txs		; 9A
	ora ($C1.b),Y		; 11 C1
	sbc [$78.b]		; E7 78
	cmp $F58B67.l,X		; DF 67 8B F5
	and $92C4.w,X		; 3D C4 92
	txa		; 8A
	and #$4C6D.w		; 29 6D 4C
	phy		; 5A
	cmp ($EC.b),Y		; D1 EC
	adc $C2.b		; 65 C2
	lda $37769F.l,X		; BF 9F 76 37
	tsa		; 3B
	ror $32.b,X		; 76 32
	jmp ($F275.w)		; 6C 75 F2
	adc $F20B3F.l,X		; 7F 3F 0B F2
	bcc -104.b		; 90 98
	jmp ($26F4.w)		; 6C F4 26
	pea $DF66.w		; F4 66 DF
	cli		; 58
	cmp #$BCB1.w		; C9 B1 BC
	lda ($BC.b),Y		; B1 BC
	lda $CFB995.l		; AF 95 B9 CF
	tda		; 7B
	sbc $3E.b		; E5 3E
	sbc $39CD.w,Y		; F9 CD 39
	and [$A0.b]		; 27 A0
	dec $23D3.w		; CE D3 23
	cmp $63.b,S		; C3 63
	cmp ($3A.b,S),Y		; D3 3A
	rts		; 60

	cmp $767AEB.l		; CF EB 7A 76
	ora $C14228.l		; 0F 28 42 C1
	sbc $CD.b,S		; E3 CD
	ldy $71AF.w,X		; BC AF 71
	lsr $EC.b,X		; 56 EC
	mvp $D0,$46		; 44 46 D0
	ror A		; 6A
	sbc $C9B379.l,X		; FF 79 B3 C9
	ror $456E.w		; 6E 6E 45
	dec $6E.b		; C6 6E
	lda [$42.b]		; A7 42
	dec $3B57.w		; CE 57 3B
	lda $AF.b,S		; A3 AF
	dec $E4BE.w		; CE BE E4
	stp		; DB
	ror $F3.b		; 66 F3
	xce		; FB
	asl A		; 0A
	pei ($66.b)		; D4 66
	adc $CDFFED.l		; 6F ED FF CD
	ora #$ADDE.w		; 09 DE AD
	lsr $6F.b		; 46 6F
	bcs -53.b		; B0 CB
	asl $4367.w,X		; 1E 67 43
	tad		; 5B
	sbc [$38.b],Y		; F7 38
	stz $A2.b,X		; 74 A2
	ror $11.b,X		; 76 11
	php		; 08
	.db $42, $10		; 42 10
	sty $2C.b		; 84 2C
	wai		; CB
	eor $242D.w,Y		; 59 2D 24
	ldy $9E.b,X		; B4 9E
	bra -124.b		; 80 84
	and ($23.b,X)		; 21 23
	inc A		; 1A
	xba		; EB
	sta $DA.b,X		; 95 DA
	sbc $5DB96F.l		; EF 6F B9 5D
	ldy $05F4.w		; AC F4 05
	and ($68.b,S),Y		; 33 68
	inc $D678.w		; EE 78 D6
	sta ($69.b)		; 92 69
	dec A		; 3A
	lda $FCFD7B.l,X		; BF 7B FD FC
	adc $6FF337.l,X		; 7F 37 F3 6F
	tyx		; BB
	lsr $F65D.w		; 4E 5D F6
	inc $0A.b,X		; F6 0A
	bvs  83.b		; 70 53
	bpl -124.b		; 10 84
	and ($42.b,X)		; 21 42
	sty $21.b		; 84 21
	php		; 08
	.db $42, $13		; 42 13
	phy		; 5A
	sta $A2FE.w,X		; 9D FE A2
	ror $FD.b		; 66 FD
	inc $42C4.w		; EE C4 42
	bpl -84.b		; 10 AC
	pea $7B1F.w		; F4 1F 7B
	stx $7AEC.w		; 8E EC 7A
	tsx		; BA
	tsx		; BA
	sep #$81		; E2 81
	stz $59.b		; 64 59
	ldy $2101.w,X		; BC 01 21
	cpy #$3F.b		; C0 3F
	cpy $1FDB.w		; CC DB 1F
	sei		; 78
	ror $5252.w,X		; 7E 52 52
	eor ($5D.b)		; 52 5D
	cmp $6B.b		; C5 6B
	ldy $24FF.w		; AC FF 24
	jmp ($21D5.w,X)		; 7C D5 21
	ldx $21.b		; A6 21
	asl $63F7.w,X		; 1E F7 63
	sta $10A8.w,X		; 9D A8 10
	tay		; A8
	eor $B460E5.l		; 4F E5 60 B4
	cpy $21.b		; C4 21
	php		; 08
	sbc ($F7.b)		; F2 F7
	tad		; 5B
	ora $D1AC7F.l		; 0F 7F AC D1
	eor $73.b,S		; 43 73
	adc $6C.b		; 65 6C
	tyx		; BB
	and $FCD6DF.l,X		; 3F DF D6 FC
	lsr $F5.b,X		; 56 F5
	adc $FF5E.w,X		; 7D 5E FF
	and [$B7.b]		; 27 B7
	sbc ($7F.b,X)		; E1 7F
	lsr $83.b,X		; 56 83
	stz $F91F.w,X		; 9E 1F F9
	jmp ($D22E.w,X)		; 7C 2E D2
	tsb $7D16.w		; 0C 16 7D
	lda ($B8.b)		; B2 B8
	tsb $482F.w		; 0C 2F 48
	sta [$C4.b]		; 87 C4
	xba		; EB
	ldx $64.b		; A6 64
	cpx $FF67.w		; EC 67 FF
	ora $940D.w		; 0D 0D 94
	ora $C6.b		; 05 C6
	clc		; 18
	inc $01.b,X		; F6 01
	and #$EA3F.w		; 29 3F EA
	lda $5608E7.l		; AF E7 08 56
	jsr ($49FB.w,X)		; FC FB 49
	bit $59AC.w		; 2C AC 59
	inx		; E8
	pla		; 68
	eor $4288.w,Y		; 59 88 42
	eor #$A23E.w		; 49 3E A2
	tyx		; BB
	cpy $C3.b		; C4 C3
	ldy $78F0.w,X		; BC F0 78
	asl $9B3F.w,X		; 1E 3F 9B
	pld		; 2B
	bit #$9A24.w		; 89 24 9A
	lsr $9F50.w		; 4E 50 9F
	lda $77E3.w,Y		; B9 E3 77
	stz $7A4B.w		; 9C 4B 7A
	ldx $F5BA.w		; AE BA F5
	jmp $3C3C.w		; 4C 3C 3C
	brk $3D.b		; 00 3D
	ora ($62.b,X)		; 01 62
	phk		; 4B
	ora $46922C.l,X		; 1F 2C 92 46
	lsr $06.b		; 46 06
	bit $2101.w		; 2C 01 21
	trb $9461.w		; 1C 61 94
	ora [$90.b]		; 07 90
	stz $A3.b,X		; 74 A3
	sta ($52.b)		; 92 52
	eor ($62.b)		; 52 62
	adc ($93.b,X)		; 61 93
	plx		; FA
	cmp ($FF.b,S),Y		; D3 FF
	lda ($D5.b,X)		; A1 D5
	cmp ($5A.b,S),Y		; D3 5A
	inc $69.b		; E6 69
	xba		; EB
	lda ($A6.b,X)		; A1 A6
	bvc -97.b		; 50 9F
	inc $C6FF.w		; EE FF C6
	lsr $D7.b		; 46 D7
	sbc #$EE7F.w		; E9 7F EE
	trb $DF7C.w		; 1C 7C DF
	eor [$BD.b],Y		; 57 BD
	lda $F5F7B0.l		; AF B0 F7 F5
	adc $D73D.w,X		; 7D 3D D7
	sta [$DF.b],Y		; 97 DF
	adc $BC13AF.l,X		; 7F AF 13 BC
	cpy #$DD.b		; C0 DD
	sbc #$F573.w		; E9 73 F5
	eor ($EC.b),Y		; 51 EC
	and $C6FD.w,X		; 3D FD C6
	jsr $7C9E.w		; 20 9E 7C
	phy		; 5A
	txy		; 9B
	ora $2BAF.w,X		; 1D AF 2B
	sbc $6DB4.w,Y		; F9 B4 6D
	nop		; EA
	pea $E97A.w		; F4 7A E9
	txy		; 9B
	bpl -65.b		; 10 BF
	ora $C8B5A5.l,X		; 1F A5 B5 C8
	dec $6FDF.w,X		; DE DF 6F
	adc $8EDDBD.l		; 6F BD DD 8E
	lda ($3A.b)		; B2 3A
	tyx		; BB
	ora ($24.b,X)		; 01 24
	cmp ($5B.b,S),Y		; D3 5B
	asl $D917.w,X		; 1E 17 D9
	and [$6F.b],Y		; 37 6F
	cli		; 58
	lda ($10.b)		; B2 10
	ldy $B897.w,X		; BC 97 B8
	sbc [$BA.b]		; E7 BA
	adc ($23.b,S),Y		; 73 23
	sed		; F8
	bit $E8.b		; 24 E8
	sbc $D2.b,X		; F5 D2
	lda $8B5A.w,Y		; B9 5A 8B
	cmp $C7.b,S		; C3 C7
	tay		; A8
	sei		; 78
	ora ($DB.b,S),Y		; 13 DB
	asl $FD49.w,X		; 1E 49 FD
	cpx $1DEA.w		; EC EA 1D
	sbc $7A98C7.l,X		; FF C7 98 7A
	sta [$F4.b]		; 87 F4
	stz $22.b		; 64 22
	cmp $D54943.l		; CF 43 49 D5
	ror $1D.b,X		; 76 1D
	sta $C792F0.l		; 8F F0 92 C7
	inx		; E8
	nop		; EA
	cmp $FD58.w,Y		; D9 58 FD
	txy		; 9B
	ror $6D4F.w		; 6E 4F 6D
	phy		; 5A
	phb		; 8B
	inc A		; 1A
	lsr A		; 4A
	tad		; 5B
	inc $1B5B.w,X		; FE 5B 1B
	tas		; 1B
	txy		; 9B
	sed		; F8
	sbc $0D0C.w,X		; FD 0C 0D
	stp		; DB
	bcs -92.b		; B0 A4
	sty $51.b,X		; 94 51
	eor #$4421.w		; 49 21 44
	ldy #$21.b		; A0 21
	mvn $30,$54		; 54 54 30
	cmp $F130.w		; CD 30 F1
	sbc ($1F.b,X)		; E1 1F
	and $9B24.w,Y		; 39 24 9B
	ror $178D.w		; 6E 8D 17
	eor $B124.w,X		; 5D 24 B1
	sta $F25E.w,Y		; 99 5E F2
	inc $DDEF.w		; EE EF DD
	cmp $802A.w		; CD 2A 80
	and ($42.b,S),Y		; 33 42
	ror $7A45.w		; 6E 45 7A
	and [$AF.b],Y		; 37 AF
	pha		; 48
	cpy $00C6.w		; CC C6 00
	inc $8B05.w		; EE 05 8B
	asl $89D9.w,X		; 1E D9 89
	trb $A003.w		; 1C 03 A0
	bmi -66.b		; 30 BE
	bmi -118.b		; 30 8A
	eor $B0.b		; 45 B0
	ora ($10.b)		; 12 10
	jmp $61F5.w		; 4C F5 61
	cmp ($76.b)		; D2 76
	eor [$64.b],Y		; 57 64
	cmp $F6682D.l,X		; DF 2D 68 F6
	adc $C0.b,S		; 63 C0
	bvs 115.b		; 70 73
	adc $C5B2.w		; 6D B2 C5
	pha		; 48
	tsx		; BA
	jsr $A161.w		; 20 61 A1
	bit $79.b		; 24 79
	lda ($FF.b),Y		; B1 FF
	stz $7F.b,X		; 74 7F
	ldx $18F2.w		; AE F2 18
	and $47.b,X		; 35 47
	sbc #$F4C0.w		; E9 C0 F4
	adc $D357B3.l,X		; 7F B3 57 D3
	sbc $FB.b,X		; F5 FB
	ldy $CB3B.w,X		; BC 3B CB
	jmp.w [$AE2D]		; DC 2D AE
	eor [$75.b]		; 47 75
	cpx $D5DB.w		; EC DB D5
	jsr ($98FB.w,X)		; FC FB 98
	eor $D4CE.w,X		; 5D CE D4
	ror $EA.b		; 66 EA
	rtl		; 6B

	eor ($9B.b),Y		; 51 9B
	phd		; 0B
	adc ($CE.b,S),Y		; 73 CE
	inc $FEB9.w,X		; FE B9 FE
	lda $648D.w		; AD 8D 64
	lda $52EAA1.l,X		; BF A1 EA 52
	sbc ($60.b,X)		; E1 60
	stz $BB.b		; 64 BB
	phx		; DA
	adc $78.b		; 65 78
	cld		; D8
	lsr $1536.w,X		; 5E 36 15
	ror A		; 6A
	and [$FB.b],Y		; 37 FB
	cpy $FC2B.w		; CC 2B FC
	sta [$66.b],Y		; 97 66
	adc $318D.w		; 6D 8D 31
	ldx $34.b		; A6 34
	and $5B2C4A.l,X		; 3F 4A 2C 5B
	cmp $CBC6B5.l,X		; DF B5 C6 CB
	cpx #$D6.b		; E0 D6
.INDEX 16
	rep #$97		; C2 97
	bit $89.b		; 24 89
	inx		; E8
	ldy #$82BD.w		; A0 BD 82
	inc $AE.b,X		; F6 AE
	dec $A1E3.w		; CE E3 A1
	inc $79.b		; E6 79
	trb $628F.w		; 1C 8F 62
	sta ($57.b),Y		; 91 57
	pla		; 68
	adc $D905.w,Y		; 79 05 D9
	adc [$93.b],Y		; 77 93
	adc ($F8.b),Y		; 71 F8
	clv		; B8
	and $50A6.w,X		; 3D A6 50
	eor $CE.b,X		; 55 CE
	ror $5E.b		; 66 5E
	xba		; EB
	sta ($B9.b),Y		; 91 B9
	cmp #$277A.w		; C9 7A 27
	rtl		; 6B

	adc ($5F.b,X)		; 61 5F
	inc $6B.b		; E6 6B
	cli		; 58
	bne -124.b		; D0 84
	jsl $41FBFE.l		; 22 FE FB 41
	cpx $CBDB.w		; EC DB CB
	clc		; 18
	jsr $2B84.w		; 20 84 2B
	trb $F1B8.w		; 1C B8 F1
	tsb $F638.w		; 0C 38 F6
	.db $42, $10		; 42 10
	sty $DC.b		; 84 DC
	stp		; DB
	ldy $0801.w,X		; BC 01 08
	.db $42, $10		; 42 10
	ldy $4B4F.w,X		; BC 4F 4B
	tsa		; 3B
	eor ($3D.b),Y		; 51 3D
	ora ($08.b,X)		; 01 08
	.db $42, $10		; 42 10
	stz $427C.w,X		; 9E 7C 42
	bpl -124.b		; 10 84
	jsl $4268C8.l		; 22 C8 68 42
	bpl -118.b		; 10 8A
	cop $36.b		; 02 36
	cmp $31.b		; C5 31
	ora $7C7C88.l		; 0F 88 7C 7C
	bvc -69.b		; 50 BB
	phy		; 5A
	sta $C64857.l		; 8F 57 48 C6
	sty $21.b		; 84 21
	phd		; 0B
	xba		; EB
	cpx $BC.b		; E4 BC
	sed		; F8
	sty $21.b		; 84 21
	php		; 08
	eor [$14.b]		; 47 14
	sty $42.b		; 84 42
	bpl -124.b		; 10 84
	bit $3E.b		; 24 3E
	sbc [$B9.b],Y		; F7 B9
	sbc $04.b,X		; F5 04
	and ($08.b,X)		; 21 08
	lsr $D58E.w		; 4E 8E D5
	lda $F2.b		; A5 F2
	.db $62, $DD, $88		; 62 DD 88
	.db $42, $10		; 42 10
	and ($4E.b)		; 32 4E
	eor ($BC.b,S),Y		; 53 BC
	adc $CDA7.w,X		; 7D A7 CD
	sbc ($A3.b,S),Y		; F3 A3
	cmp $08.b,X		; D5 08
	cli		; 58
	lda $2138.w,X		; BD 38 21
	bpl -124.b		; 10 84
	and ($0B.b,X)		; 21 0B
	sbc $98983E.l,X		; FF 3E 98 98
	bne -124.b		; D0 84
	and ($0B.b,X)		; 21 0B
	and $6B.b,S		; 23 6B
	cpy $A0EC.w		; CC EC A0
	lda [$C2.b]		; A7 C2
	stp		; DB
	txa		; 8A
	lda $84B8.w		; AD B8 84
	and ($31.b,X)		; 21 31
	lda ($09.b,X)		; A1 09
	sta $404F.w		; 8D 4F 40
	eor $BDBE06.l,X		; 5F 06 BE BD
	ora $3DDF6D.l,X		; 1F 6D DF 3D
	xba		; EB
	jmp ($9CFD.w)		; 6C FD 9C
	sta $FB.b,X		; 95 FB
	cmp ($73.b),Y		; D1 73
	mvp $FE,$6F		; 44 6F FE
	adc [$61.b]		; 67 61
	.db $82, $98, $9E		; 82 98 9E
	jmp ($5350.w,X)		; 7C 50 53
	adc $9FF7.w,Y		; 79 F7 9F
	bpl -124.b		; 10 84
	and ($41.b,X)		; 21 41
	jmp $1042.w		; 4C 42 10
	sty $21.b		; 84 21
	php		; 08
	adc #$318D.w		; 69 8D 31
	ldx $35.b		; A6 35
	and ($73.b,S),Y		; 33 73
	ldx $29.b,Y		; B6 29
	and $2E9E38.l		; 2F 38 9E 2E
	asl $E486.w		; 0E 86 E4
	sty $0126.w		; 8C 26 01
	eor [$6C.b]		; 47 6C
	phy		; 5A
	stz $2192.w		; 9C 92 21
	asl $8D00.w		; 0E 00 8D
	lda $D510.w,Y		; B9 10 D5
	ply		; 7A
	and $A4.b,S		; 23 A4
	cpy $42.b		; C4 42
	cmp ($EE.b),Y		; D1 EE
	and ($34.b,S),Y		; 33 34
	tda		; 7B
	sbc $897F8C.l,X		; FF 8C 7F 89
	dec $083B.w,X		; DE 3B 08
	sty $4B.b		; 84 4B
.INDEX 16
	rep #$DB		; C2 DB
	dey		; 88
	.db $42, $10		; 42 10
	sta $C0.b		; 85 C0
	tda		; 7B
	sbc [$76.b],Y		; F7 76
	cmp $65B4.w,Y		; D9 B4 65
	adc ($8D.b),Y		; 71 8D
	and ($A1.b),Y		; 31 A1
	phd		; 0B
	lda ($E6.b)		; B2 E6
	jmp $CDDC.w		; 4C DC CD
	cpy $3CDB.w		; CC DB 3C
	ldx $71.b		; A6 71
	beq 114.b		; F0 72
	beq -81.b		; F0 AF
	sbc $73.b		; E5 73
	and $70E153.l,X		; 3F 53 E1 70
	adc $CC4B3D.l		; 6F 3D 4B CC
	eor [$B1.b]		; 47 B1
	ora $DC95.w,X		; 1D 95 DC
	cmp $3B7F.w,X		; DD 7F 3B
	eor $E0D3.w,Y		; 59 D3 E0
	ror $1D3E.w		; 6E 3E 1D
	jmp ($D8ED.w,X)		; 7C ED D8
	adc ($4F.b)		; 72 4F
	adc ($15.b,S),Y		; 73 15
	sta $0E57.w,Y		; 99 57 0E
	dec $7A.b,X		; D6 7A
	and ($F6.b,X)		; 21 F6
	bit $38.b,X		; 34 38
	adc $FB04.w		; 6D 04 FB
	cpy $576A.w		; CC 6A 57
	and [$6F.b],Y		; 37 6F
	tsa		; 3B
	and ($58.b),Y		; 31 58
	.db $42, $CA		; 42 CA
	txy		; 9B
	jmp $F1011D.l		; 5C 1D 01 F1
	php		; 08
	.db $42, $2E		; 42 2E
	cmp $C591.w		; CD 91 C5
	adc [$C0.b]		; 67 C0
	ror $238A.w		; 6E 8A 23
	.db $62, $DC, $FB		; 62 DC FB
	adc [$82.b]		; 67 82
	sbc [$44.b],Y		; F7 44
	sbc $B3.b		; E5 B3
	jmp ($2C7A.w,X)		; 7C 7A 2C
	sbc [$CB.b],Y		; F7 CB
	jmp.w [$6DCD]		; DC CD 6D
	sta [$18.b]		; 87 18
	bne -124.b		; D0 84
	and ($0B.b,X)		; 21 0B
	adc $61.b,S		; 63 61
	cmp ($04.b,S),Y		; D3 04
	bpl -124.b		; 10 84
	and ($15.b,X)		; 21 15
	ldy #$4284.w		; A0 84 42
	bpl -124.b		; 10 84
	jsl $21A6EC.l		; 22 EC A6 21
	php		; 08
	.db $42, $15		; 42 15
	dec $3D3E.w		; CE 3E 3D
	cmp $3ECE.w		; CD CE 3E
	and $CECD.w,X		; 3D CD CE
	rol $CD3D.w,X		; 3E 3D CD
	dec $3D3E.w		; CE 3E 3D
	cmp $0049.w		; CD 49 00
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $9C.b		; 06 9C
	brk $10.b		; 00 10
	asl $94.b		; 06 94
	ora [$95.b],Y		; 17 95
	brk $00.b		; 00 00
	stx $95.b,Y		; 96 95
	sta $97.b,X		; 95 97
	brk $93.b		; 00 93
	tya		; 98
	sta [$97.b],Y		; 97 97
	sta $9696.w,Y		; 99 96 96
	txs		; 9A
	tya		; 98
	tya		; 98
	txy		; 9B
	sta $9C99.w,Y		; 99 99 9C
	txs		; 9A
	txs		; 9A
	sta $9B9B.w,X		; 9D 9B 9B
	stz $9C9C.w,X		; 9E 9C 9C
	sta $A09D9D.l,X		; 9F 9D 9D A0
	stz $A19E.w,X		; 9E 9E A1
	sta $A0A29F.l,X		; 9F 9F A2 A0
	ldy #$0CA3.w		; A0 A3 0C
	bra -92.b		; 80 A4
	lda $A3.b,S		; A3 A3
	lda $A1.b		; A5 A1
	lda ($A6.b,X)		; A1 A6
	ldx #$A7A2.w		; A2 A2 A7
	ldy $A4.b		; A4 A4
	tay		; A8
	stx $95.b,Y		; 96 95
	lda #$A5A5.w		; A9 A5 A5
	tax		; AA
	ldx $A6.b		; A6 A6
	plb		; AB
	php		; 08
	txy		; 9B
	rti		; 40

	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $A9.b,S		; 03 A9
	lda $99.b		; A5 99
	stx $01.b,Y		; 96 01
	brk $02.b		; 00 02
	sta $0096.w,Y		; 99 96 00
	ora $00.b,S		; 03 00
	tsb $9D.b		; 04 9D
	tay		; A8
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	sta $A89B.w,X		; 9D 9B A8
	brk $07.b		; 00 07
	sta $0800.w,Y		; 99 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	tsb $11.b		; 04 11
	php		; 08
	ora ($08.b)		; 12 08
	ora ($AB.b,S),Y		; 13 AB
	sta $1496.w,Y		; 99 96 14
	php		; 08
	ora $08.b,X		; 15 08
	asl $08.b,X		; 16 08
	ora [$04.b],Y		; 17 04
	clc		; 18
	brk $19.b		; 00 19
	sta $A89B.w,X		; 9D 9B A8
	brk $1A.b		; 00 1A
	brk $1B.b		; 00 1B
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $23.b		; 00 23
	brk $24.b		; 00 24
	brk $25.b		; 00 25
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	tsb $28.b		; 04 28
	tsb $29.b		; 04 29
	php		; 08
	rol A		; 2A
	php		; 08
	pld		; 2B
	php		; 08
	bit $2D08.w		; 2C 08 2D
	plb		; AB
	stx $2E.b,Y		; 96 2E
	php		; 08
	and $083008.l		; 2F 08 30 08
	and ($08.b),Y		; 31 08
	and ($04.b)		; 32 04
	and ($04.b,S),Y		; 33 04
	bit $08.b,X		; 34 08
	and $AB.b,X		; 35 AB
	tay		; A8
	rol $04.b,X		; 36 04
	and [$04.b],Y		; 37 04
	txy		; 9B
	sec		; 38
	php		; 08
	and $3A08.w,Y		; 39 08 3A
	brk $3B.b		; 00 3B
	brk $3C.b		; 00 3C
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $41.b		; 00 41
	brk $42.b		; 00 42
	brk $43.b		; 00 43
	brk $44.b		; 00 44
	brk $45.b		; 00 45
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	brk $48.b		; 00 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	tsb $4B.b		; 04 4B
	tsb $4C.b		; 04 4C
	php		; 08
	eor $4E08.w		; 4D 08 4E
	php		; 08
	eor $085008.l		; 4F 08 50 08
	eor ($08.b),Y		; 51 08
	sta $52.b,X		; 95 52
	tsb $53.b		; 04 53
	tsb $54.b		; 04 54
	tsb $99.b		; 04 99
	sta $55.b,X		; 95 55
	php		; 08
	lsr $08.b,X		; 56 08
	eor [$04.b],Y		; 57 04
	cli		; 58
	php		; 08
	eor $5A04.w,Y		; 59 04 5A
	php		; 08
	tad		; 5B
	php		; 08
	jmp $5DA8AB.l		; 5C AB A8 5D
	tsb $5E.b		; 04 5E
	tsb $5F.b		; 04 5F
	tsb $99.b		; 04 99
	sta $60.b,X		; 95 60
	php		; 08
	adc ($08.b,X)		; 61 08
	.db $62, $08, $63		; 62 08 63
	tsb $64.b		; 04 64
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
	tsb $75.b		; 04 75
	tsb $76.b		; 04 76
	tsb $0877.w		; 0C 77 08
	sei		; 78
	tsb $0C79.w		; 0C 79 0C
	ply		; 7A
	tsb $0C7B.w		; 0C 7B 0C
	jmp ($7D0C.w,X)		; 7C 0C 7D
	tsb $0C7E.w		; 0C 7E 0C
	adc $A77C0C.l,X		; 7F 0C 7C A7
	tsb $0C81.w		; 0C 81 0C
	.db $82, $0C, $83		; 82 0C 83
	tsb $0C84.w		; 0C 84 0C
	sta $0C.b		; 85 0C
	stx $0C.b		; 86 0C
	sta [$0C.b]		; 87 0C
	dey		; 88
	tsb $A789.w		; 0C 89 A7
	lda [$A4.b]		; A7 A4
	tsb $0C8A.w		; 0C 8A 0C
	phb		; 8B
	lda [$A4.b]		; A7 A4
	tsb $0C8C.w		; 0C 8C 0C
	sta $8E0C.w		; 8D 0C 8E
	php		; 08
	sta $089008.l		; 8F 08 90 08
	sta ($00.b),Y		; 91 00
	sta ($AA.b)		; 92 AA
	tax		; AA
	tax		; AA
	ldx #$A9A9.w		; A2 A9 A9
	sty $00.b,X		; 94 00
	brk $26.b		; 00 26
	xce		; FB
	brk $09.b		; 00 09
	rti		; 40

	tsb $00.b		; 04 00
	lsr A		; 4A
	jsl $55B64C.l		; 22 4C B6 55
	tya		; 98
	ora ($8F.b),Y		; 11 8F
	.db $82, $70, $C0		; 82 70 C0
	php		; 08
	trb $1004.w		; 1C 04 10
	and ($47.b,X)		; 21 47
	sbc $871C.w		; ED 1C 87
	sbc $1622.w,Y		; F9 22 16
	jmp $8820.w		; 4C 20 88
	lsr $64.b		; 46 64
	ldy $11.b		; A4 11
	.db $42, $16		; 42 16
	jsl $1324CB.l		; 22 CB 24 13
	sbc ($26.b)		; F2 26
	ror A		; 6A
	lda ($26.b,X)		; A1 26
	sbc ($14.b),Y		; F1 14
	eor [$E4.b],Y		; 57 E4
	trb $B5.b		; 14 B5
	tax		; AA
	eor $4D.b,X		; 55 4D
	stz $92.b		; 64 92
	xce		; FB
	ora ($64.b),Y		; 11 64
	sbc ($21.b)		; F2 21
	sta ($96.b),Y		; 91 96
	pha		; 48
	.db $42, $27		; 42 27
	dec A		; 3A
	and $1B6249.l		; 2F 49 62 1B
	ora $1BD5.w,X		; 1D D5 1B
	sbc ($25.b)		; F2 25
	cmp ($59.b)		; D2 59
	lda $F2.b,X		; B5 F2
	phk		; 4B
	cpx $46.b		; E4 46
	sta ($6F.b)		; 92 6F
	pea $499E.w		; F4 9E 49
	bit $69F6.w,X		; 3C F6 69
	jmp ($4DBA.w,X)		; 7C BA 4D
	ror $93.b		; 66 93
	wai		; CB
	stz $44.b		; 64 44
	dey		; 88
	sta ($C9.b)		; 92 C9
	bit $C992.w		; 2C 92 C9
	stz $B2.b,X		; 74 B2
	eor #$9225.w		; 49 25 92
	mvp $25,$49		; 44 49 25
	sta ($C9.b)		; 92 C9
	rol $B2.b		; 26 B2
	cmp #$9224.w		; C9 24 92
	eor $9624.w,Y		; 59 24 96
	tad		; 5B
	and $97.b		; 25 97
	lda [$04.b]		; A7 04
	eor $0927.w		; 4D 27 09
	adc $D3.b		; 65 D3
	stx $2CCD.w		; 8E CD 2C
	nop		; EA
	cmp ($A7.b,S),Y		; D3 A7
	php		; 08
	pla		; 68
	eor $A2.b,X		; 55 A2
	adc ($D9.b),Y		; 71 D9
	adc $97.b,X		; 75 97
	eor $E9.b,X		; 55 E9
	cmp [$3A.b]		; C7 3A
	sta $445C.w,X		; 9D 5C 44
	sbc $E8.b,S		; E3 E8
	bvc   4.b		; 50 04
	sbc $1A.b,S		; E3 1A
	bvc -109.b		; 50 93
	eor #$9426.w		; 49 26 94
	and $BE.b,X		; 35 BE
	eor ($15.b,S),Y		; 53 15
	and $87.b		; 25 87
	asl $BEFA.w		; 0E FA BE
	eor ($CB.b)		; 52 CB
	lda #$DDCA.w		; A9 CA DD
	lsr $6A5E.w		; 4E 5E 6A
	cpy $733E.w		; CC 3E 73
	tsb $E2.b		; 04 E2
	sta $2849.w,X		; 9D 49 28
	eor $2796C3.l,X		; 5F C3 96 27
	tas		; 1B
	asl $832C.w		; 0E 2C 83
.INDEX 8
	sep #$13		; E2 13
	sta $F480.w		; 8D 80 F4
	brk $4E.b		; 00 4E
	and [$BE.b],Y		; 37 BE
	ldy #$1E.b		; A0 1E
	cpy #$9C.b		; C0 9C
	and $E6.b,S		; 23 E6
	ldy $5C9C.w,X		; BC 9C 5C
	plp		; 28
	lsr $8C.b,X		; 56 8C
	cmp [$B3.b],Y		; D7 B3
	lsr $1DC5.w,X		; 5E C5 1D
	ora #$9EB5.w		; 09 B5 9E
	asl $8DCD.w,X		; 1E CD 8D
	ora $BC0B.w		; 0D 0B BC
	mvn $D5,$16		; 54 16 D5
	eor ($87.b,S),Y		; 53 87
	dec $5F3D.w,X		; DE 3D 5F
	lsr $3637.w		; 4E 37 36
	and ($71.b)		; 32 71
	tsx		; BA
	sta [$6D.b]		; 87 6D
	and $DA.b		; 25 DA
	phk		; 4B
	lsr $A525.w		; 4E 25 A5
	eor $BE09.w,Y		; 59 09 BE
	phb		; 8B
	adc $9F.b,S		; 63 9F
	sta $9260.w		; 8D 60 92
	mvn $9D,$15		; 54 15 9D
	asl A		; 0A
	sed		; F8
	pld		; 2B
	sta $895D8C.l,X		; 9F 8C 5D 89
	cmp $C0.b		; C5 C0
	dey		; 88
	adc [$24.b]		; 67 24
	tyx		; BB
	lsr $3734.w		; 4E 34 37
	stx $40.b		; 86 40
	txy		; 9B
	jmp $D353.w		; 4C 53 D3
	asl $7D.b,X		; 16 7D
	lda $4268.w,Y		; B9 68 42
	ldy #$A6.b		; A0 A6
	ldx $A042.w		; AE 42 A0
	lda $BC.b		; A5 BC
	sty $08.b,X		; 94 08
	sta $7B.b,S		; 83 7B
	bcs  -6.b		; B0 FA
	and [$3C.b],Y		; 37 3C
	ldx $F1.b,Y		; B6 F1
	sbc $75E7.w		; ED E7 75
	trb $268D.w		; 1C 8D 26
	tsb $9CCA.w		; 0C CA 9C
	stx $99F3.w		; 8E F3 99
	sta $A783.w,X		; 9D 83 A7
	sta $56B9FC.l		; 8F FC B9 56
	sbc $0E56.w,X		; FD 56 0E
	phb		; 8B
	cpx $F0.b		; E4 F0
	jmp ($BFE4.w,X)		; 7C E4 BF
	ldx $EABA.w,Y		; BE BA EA
	cmp $CFE9E5.l,X		; DF E5 E9 CF
	and [$B5.b]		; 27 B5
	pea $78A7.w		; F4 A7 78
	ora ($F5.b,S),Y		; 13 F5
	txa		; 8A
	trb $AD.b		; 14 AD
	tad		; 5B
	sbc $DF37.w,X		; FD 37 DF
	cmp ($E1.b,X)		; C1 E1
	sbc [$FD.b],Y		; F7 FD
	eor $EB6606.l,X		; 5F 06 66 EB
	ora $BD.b,S		; 03 BD
	bra 122.b		; 80 7A
	trb $5C8D.w		; 1C 8D 5C
	jsr ($3ED3.w,X)		; FC D3 3E
	ply		; 7A
	lda $6FC4.w,X		; BD C4 6F
	sbc ($DF.b)		; F2 DF
	lda $666E.w,Y		; B9 6E 66
	eor #$C50C.w		; 49 0C C5
	dec $8854.w		; CE 54 88
	xce		; FB
	eor $7E.b,X		; 55 7E
	dec $9B.b		; C6 9B
	cmp $FB61.w,X		; DD 61 FB
	sta $4A7FC5.l,X		; 9F C5 7F 4A
	stz $CA.b		; 64 CA
	bit #$EA93.w		; 89 93 EA
	dec $D5E3.w		; CE E3 D5
	bra -59.b		; 80 C5
	sta $515C.w,Y		; 99 5C 51
	bit #$9F9B.w		; 89 9B 9F
	sbc $52E5.w,Y		; F9 E5 52
	lda $F2E86F.l,X		; BF 6F E8 F2
	cmp #$77F2.w		; C9 F2 77
	bit $F7.b		; 24 F7
	lda $52BF0F.l,X		; BF 0F BF 52
	sep #$C2		; E2 C2
	sta [$2B.b],Y		; 97 2B
	eor $8D1DED.l,X		; 5F ED 1D 8D
	eor $FDA4.w,X		; 5D A4 FD
	sty $0D.b,X		; 94 0D
	txs		; 9A
	jmp ($B67A.w)		; 6C 7A B6
	tyx		; BB
	ora [$F6.b],Y		; 17 F6
	sta $50.b		; 85 50
	sty $A9F4.w		; 8C F4 A9
	eor ($E7.b),Y		; 51 E7
	lsr A		; 4A
	dec $D2.b,X		; D6 D2
	cpy #$C5.b		; C0 C5
	inc $D2C7.w,X		; FE C7 D2
	ror $95.b,X		; 76 95
	adc $76.b		; 65 76
	adc $D5DE52.l		; 6F 52 DE D5
	cmp $D8CA.w,Y		; D9 CA D8
	cmp $0FED.w,X		; DD ED 0F
	sei		; 78
	sta $02.b,S		; 83 02
	tda		; 7B
	sbc ($7F.b)		; F2 7F
	adc [$3B.b]		; 67 3B
	ora $06.b,S		; 03 06
	cmp [$F5.b],Y		; D7 F5
	jsr ($CD7F.w,X)		; FC 7F CD
	bcc  52.b		; 90 34
	sbc ($4F.b,S),Y		; F3 4F
	eor $7A.b,S		; 43 7A
	ora $9548.w,X		; 1D 48 95
	jsl $D08854.l		; 22 54 88 D0
	cmp ($9B.b),Y		; D1 9B
	and ($64.b,S),Y		; 33 64
	and $C2.b,S		; 23 C2
	bit $D321.w,X		; 3C 21 D3
	txy		; 9B
	tas		; 1B
	txy		; 9B
	asl $8F.b,X		; 16 8F
	pea $C2A5.w		; F4 A5 C2
	rol $C9.b		; 26 C9
	dec $94.b		; C6 94
	sbc $74.b,X		; F5 74
	inc A		; 1A
	lda $A9B9.w,Y		; B9 B9 A9
	tsx		; BA
	and $4DBD.w,Y		; 39 BD 4D
	ora $3BBD.w		; 0D BD 3B
	sbc [$FD.b]		; E7 FD
	eor ($E6.b,X)		; 41 E6
	cmp ($89.b,S),Y		; D3 89
	dey		; 88
	sta $66D9.w		; 8D D9 66
	ror $5D46.w,X		; 7E 46 5D
	lda [$12.b]		; A7 12
	rol $353B.w		; 2E 3B 35
	rol $A4.b		; 26 A4
	cmp $13.b,S		; C3 13
	bit #$5C75.w		; 89 75 5C
	wai		; CB
	ldy $97.b,X		; B4 97
	rol $5D.b,X		; 36 5D
	ldy $B4.b		; A4 B4
	sbc ($18.b,X)		; E1 18
	phk		; 4B
	adc $61.b,S		; 63 61
	and ($3C.b)		; 32 3C
	iny		; C8
	sbc $1336.w,Y		; F9 36 13
	and $E4.b,S		; 23 E4
	cld		; D8
	jmp $938F.w		; 4C 8F 93
	tda		; 7B
	bmi -82.b		; 30 AE
	.db $82, $BA, $08		; 82 BA 08
	cmp $DC.b		; C5 DC
	ora ($0A.b,S),Y		; 13 0A
	inx		; E8
	and $05.b,S		; 23 05
	cmp ($7E.b),Y		; D1 7E
	sei		; 78
	sbc [$64.b]		; E7 64
	adc $848F.w		; 6D 8F 84
	xce		; FB
	stx $DA.b		; 86 DA
	cpx $28C8.w		; EC C8 28
	sta [$66.b],Y		; 97 66
	eor ($88.b,X)		; 41 88
	eor ($31.b),Y		; 51 31
	ora $A159.w		; 0D 59 A1
	tsa		; 3B
	sta ($50.b,S),Y		; 93 50
	ror A		; 6A
	tsb $3A.b		; 04 3A
	jmp $9FCF9D.l		; 5C 9D CF 9F
	adc $5BE2.w		; 6D E2 5B
	eor $6065.w,X		; 5D 65 60
	adc $6D.b,S		; 63 6D
	sbc $E3AF.w		; ED AF E3
	iny		; C8
	cmp [$5C.b],Y		; D7 5C
	bit $EA.b		; 24 EA
	txy		; 9B
	rol $CD85.w		; 2E 85 CD
	ora #$EE74.w		; 09 74 EE
	adc #$A7CB.w		; 69 CB A7
	clv		; B8
	lsr $1232.w		; 4E 32 12
	adc #$B634.w		; 69 34 B6
	adc #$6EC4.w		; 69 C4 6E
	asl $E1.b,X		; 16 E1
	adc ($16.b)		; 72 16
	cmp $53.b,X		; D5 53
	tad		; 5B
	mvn $5A,$E2		; 54 E2 5A
	eor $90.b,X		; 55 90
	plb		; AB
	phy		; 5A
	lda $2C6B.w		; AD 6B 2C
	cmp ($71.b)		; D2 71
	and ($55.b,S),Y		; 33 55
	ora #$E6B4.w		; 09 B4 E6
	sbc $61.b		; E5 61
	tad		; 5B
	adc ($53.b),Y		; 71 53
	bit #$0B85.w		; 89 85 0B
	and $A30F.w		; 2D 0F A3
	adc $E36F34.l		; 6F 34 6F E3
	lda $09.b		; A5 09
	tay		; A8
	tsx		; BA
	asl $F9.b		; 06 F9
	phy		; 5A
	ror A		; 6A
	lda ($8C.b)		; B2 8C
	adc ($AF.b)		; 72 AF
	txy		; 9B
	jmp.w [$7469]		; DC 69 74
	adc ($FB.b,S),Y		; 73 FB
	rtl		; 6B

	dec $1F4C.w,X		; DE 4C 1F
	lsr $3B.b		; 46 3B
	jsr ($76FD.w,X)		; FC FD 76
	pea $77A3.w		; F4 A3 77
	eor #$EE9F.w		; 49 9F EE
	sta $7E7B90.l		; 8F 90 7B 7E
	cpy $34F8.w		; CC F8 34
	eor $36.b,X		; 55 36
	cmp [$BB.b],Y		; D7 BB
	ora [$EB.b]		; 07 EB
	and ($B2.b)		; 32 B2
	stz $55.b,X		; 74 55
	and ($BC.b)		; 32 BC
	sbc $EF05AF.l,X		; FF AF 05 EF
	cmp $B7.b		; C5 B7
	cmp #$DFD9.w		; C9 D9 DF
	jmp $4F9F7E.l		; 5C 7E 9F 4F
	lda $BFA199.l,X		; BF 99 A1 BF
	cmp $E762.w,Y		; D9 62 E7
	sbc $6A.b		; E5 6A
	ldy $F6.b		; A4 F6
	pea $9DB5.w		; F4 B5 9D
	ldx $EE.b,Y		; B6 EE
	xba		; EB
	adc [$CF.b]		; 67 CF
	jsr ($A006.w,X)		; FC 06 A0
	sta $7FDB.w,Y		; 99 DB 7F
	cpy $A8AF.w		; CC AF A8
	and [$27.b],Y		; 37 27
	jmp.w [$FEDE]		; DC DE FE
	and $FEF7.w,X		; 3D F7 FE
	adc [$97.b]		; 67 97
	cpx $5FDF.w		; EC DF 5F
	rol $15.b,X		; 36 15
	ora #$963A.w		; 09 3A 96
	tsa		; 3B
	stz $E3E6.w		; 9C E6 E3
	xce		; FB
	inc $B7.b,X		; F6 B7
	trb $CC.b		; 14 CC
	sta ($E3.b,X)		; 81 E3
	eor $AD992B.l,X		; 5F 2B 99 AD
	sta $0B41D6.l,X		; 9F D6 41 0B
	sbc $E0DFC1.l,X		; FF C1 DF E0
	sbc $7B15.w,Y		; F9 15 7B
	asl A		; 0A
	sta ($B9.b),Y		; 91 B9
	ror $BC.b,X		; 76 BC
	adc $81971A.l		; 6F 1A 97 81
	sbc $F5.b,S		; E3 F5
	trb $AD8B.w		; 1C 8B AD
	adc [$B1.b]		; 67 B1
	cmp ($93.b,X)		; C1 93
	lda #$C5B3.w		; A9 B3 C5
	sbc $57.b,S		; E3 57
	lda ($82.b,S),Y		; B3 82
	ror $C784.w		; 6E 84 C7
	ply		; 7A
	jmp $EB37.w		; 4C 37 EB
	dec A		; 3A
	dec $AD07.w		; CE 07 AD
	and ($39.b,S),Y		; 33 39
	tsa		; 3B
	and $93.b,S		; 23 93
	phb		; 8B
	cmp ($41.b)		; D2 41
	asl A		; 0A
	php		; 08
	.db $42, $D3		; 42 D3
	sbc ($F1.b,X)		; E1 F1
	xba		; EB
	inc $BAAD.w		; EE AD BA
	sbc $C3F6.w,X		; FD F6 C3
	cmp ($FA.b)		; D2 FA
	jmp.w [$4BFF]		; DC FF 4B
	lda $EA.b,X		; B5 EA
	sei		; 78
	cmp $F7CEEA.l,X		; DF EA CE F7
	adc $63.b		; 65 63
	bit #$35B8.w		; 89 B8 35
	lda [$5D.b],Y		; B7 5D
	lda $FFF62E.l,X		; BF 2E F6 FF
	tax		; AA
	sed		; F8
	ora $9DF7.w		; 0D F7 9D
	ldy $B1.b,X		; B4 B1
	cpy $67.b		; C4 67
	ora $B8.b,S		; 03 B8
	plb		; AB
	beq -73.b		; F0 B7
	sbc $1D76.w,X		; FD 76 1D
	sta $5CF4AC.l,X		; 9F AC F4 5C
	dey		; 88
	lda $E20D.w,Y		; B9 0D E2
	and [$8A.b],Y		; 37 8A
	jmp.w [$62F6]		; DC F6 62
	lda [$49.b],Y		; B7 49
	ldy $34.b,X		; B4 34
	adc [$47.b]		; 67 47
	eor $92D214.l		; 4F 14 D2 92
	lsr A		; 4A
	and $93.b		; 25 93
	sbc ($9F.b),Y		; F1 9F
	lda ($7E.b)		; B2 7E
	eor ($D6.b),Y		; 51 D6
	ora $C495.w		; 0D 95 C4
	adc ($F6.b,X)		; 61 F6
	adc $45E7F6.l,X		; 7F F6 E7 45
	plx		; FA
	.db $62, $64, $D7		; 62 64 D7
	pei ($89.b)		; D4 89
	ora [$60.b]		; 07 60
	adc ($B3.b,X)		; 61 B3
	ror $DF.b,X		; 76 DF
	ora $BF.b		; 05 BF
	adc ($BE.b),Y		; 71 BE
	trb $D159.w		; 1C 59 D1
	bvs -68.b		; 70 BC
	sec		; 38
	dec A		; 3A
	inx		; E8
	and $6356.w,X		; 3D 56 63
	lda ($83.b)		; B2 83
	and $1943.w,X		; 3D 43 19
	sty $D8.b,X		; 94 D8
	eor [$97.b],Y		; 57 97
	asl $92.b,X		; 16 92
	sbc $DE25.w		; ED 25 DE
	eor $9BBC.w		; 4D BC 9B
	cmp $D5A1.w		; CD A1 D5
	cmp ($74.b,S),Y		; D3 74
	txs		; 9A
	and [$1F.b]		; 27 1F
	pla		; 68
	sbc $38355B.l		; EF 5B 35 38
	eor $A6.b		; 45 A6
	sta ($8F.b,S),Y		; 93 8F
	lda [$4C.b]		; A7 4C
	ora ($84.b,S),Y		; 13 84
	eor $A475.w,X		; 5D 75 A4
	pei ($28.b)		; D4 28
	adc $90.b,X		; 75 90
	sbc ($66.b,X)		; E1 66
	phy		; 5A
	bne 116.b		; D0 74
	and $7AF8.w,Y		; 39 F8 7A
	ror $CF87.w,X		; 7E 87 CF
	ror $7944.w,X		; 7E 44 79
	and $A75A.w,Y		; 39 5A A7
	cpx $E5.b		; E4 E5
	eor #$8DCA.w		; 49 CA 8D
	eor [$07.b]		; 47 07
	inc A		; 1A
	and ($5C.b),Y		; 31 5C
	lsr $2B.b		; 46 2B
	cmp $C969.w		; CD 69 C9
	bit $1A.b		; 24 1A
	bne -53.b		; D0 CB
	tas		; 1B
	adc ($36.b,S),Y		; 73 36
	eor $224B2C.l		; 4F 2C 4B 22
	adc $5065.w,Y		; 79 65 50
	bra -88.b		; 80 A8
	bit $3155.w,X		; 3C 55 31
	eor [$CC.b]		; 47 CC
	eor ($D2.b),Y		; 51 D2
	adc #$C1D2.w		; 69 D2 C1
	jmp.w [$749D]		; DC 9D 74
	ora $D941.w		; 0D 41 D9
	asl $1824.w,X		; 1E 24 18
	cmp $46E1.w		; CD E1 46
	sbc [$65.b],Y		; F7 65
	bvs -103.b		; 70 99
	adc $E02A.w,X		; 7D 2A E0
	lda $718F22.l		; AF 22 8F 71
	asl $7BB9.w,X		; 1E B9 7B
	bra  -9.b		; 80 F7
	phb		; 8B
	ora [$1E.b]		; 07 1E
	ora $0EE828.l		; 0F 28 E8 0E
	dec A		; 3A
	.db $62, $6D, $36		; 62 6D 36
	txy		; 9B
	eor $AAA8.w		; 4D A8 AA
	rol A		; 2A
	adc $1071.w		; 6D 71 10
	sty $21.b		; 84 21
	asl A		; 0A
	ora $02.b		; 05 02
	eor #$EAD4.w		; 49 D4 EA
	adc $38.b,X		; 75 38
	sed		; F8
	lsr A		; 4A
	lda $AA.b,X		; B5 AA
	dec $AB.b,X		; D6 AB
	phy		; 5A
	lda $246A.w		; AD 6A 24
	bit $92.b,X		; 34 92
	adc $77.b,X		; 75 77
	cmp ($6C.b,S),Y		; D3 6C
	sbc #$A7C8.w		; E9 C8 A7
	adc $BF7F.w,Y		; 79 7F BF
	adc $9E87A2.l		; 6F A2 87 9E
	bit #$8BA6.w		; 89 A6 8B
	ldy $F46F.w		; AC 6F F4
	and [$F1.b],Y		; 37 F1
	lda [$BE.b],Y		; B7 BE
	sta $13EB21.l,X		; 9F 21 EB 13
	dec $6C0F.w,X		; DE 0F 6C
	ldy $0B2F.w,X		; BC 2F 0B
	sta ($43.b,S),Y		; 93 43
	ldx $3B.b,Y		; B6 3B
	ldx #$DB.b		; A2 DB
	ora [$4E.b]		; 07 4E
	tad		; 5B
	cmp $C5D5E7.l		; CF E7 D5 C5
	sta $1BDD4A.l		; 8F 4A DD 1B
	sta $AADA.w,Y		; 99 DA AA
	and $E87727.l,X		; 3F 27 77 E8
	adc ($A4.b)		; 72 A4
	and ($CC.b,S),Y		; 33 CC
	ldx $DB.b,Y		; B6 DB
	lda $74B5B9.l,X		; BF B9 B5 74
	beq -55.b		; F0 C9
	sta $AFBB14.l		; 8F 14 BB AF
	stx $26.b,Y		; 96 26
	eor [$C6.b]		; 47 C6
	cmp $E649.w,X		; DD 49 E6
	dec $7F.b,X		; D6 7F
	rtl		; 6B

	beq 125.b		; F0 7D
	and [$FE.b],Y		; 37 FE
	lda $BF.b		; A5 BF
	lda $459CC6.l		; AF C6 9C 45
	adc $C4.b		; 65 C4
	cpy $8D2E.w		; CC 2E 8D
	jsr ($D632.w,X)		; FC 32 D6
	rts		; 60

	eor $25.b,X		; 55 25
	ora $046692.l		; 0F 92 66 04
	ora $08.b,S		; 03 08
	brk $A2.b		; 00 A2
	tsb $06.b		; 04 06
	ora ($70.b,X)		; 01 70
	ply		; 7A
	sbc [$14.b]		; E7 14
	ldx #$61.b		; A2 61
	stx $67.b,Y		; 96 67
	sty $73.b,X		; 94 73
	sta $9FDD4C.l		; 8F 4C DD 9F
	stz $DC.b		; 64 DC
	cmp ($BC.b,X)		; C1 BC
	and $21A229.l,X		; 3F 29 A2 21
	cmp ($7D.b,X)		; C1 7D
	asl $90.b		; 06 90
	sbc #$078F.w		; E9 8F 07
	tda		; 7B
	sta ($CE.b,X)		; 81 CE
	jsr ($F7D3.w,X)		; FC D3 F7
	tsb $38C2.w		; 0C C2 38
	adc $B557.w,Y		; 79 57 B5
	and $13E756.l,X		; 3F 56 E7 13
	sbc ($E0.b,X)		; E1 E0
	jmp ($B4B3.w)		; 6C B3 B4
	lda $5F.b,X		; B5 5F
	sbc [$BD.b],Y		; F7 BD
	cpy #$D1.b		; C0 D1
	cpy $73CF.w		; CC CF 73
	and $993CEF.l		; 2F EF 3C 99
	cmp $5F7A.w,Y		; D9 7A 5F
	lda $BA6785.l,X		; BF 85 67 BA
	cmp [$79.b],Y		; D7 79
	dey		; 88
	sed		; F8
	rol $6DF5.w,X		; 3E F5 6D
	jmp $63072D.l		; 5C 2D 07 63
	sbc $5F7C.w		; ED 7C 5F
	ror $D1CB.w		; 6E CB D1
	bcs -33.b		; B0 DF
	cpx #$F4.b		; E0 F4
	lda [$5A.b],Y		; B7 5A
	dec $921E.w		; CE 1E 92
	cmp $7F.b,S		; C3 7F
	adc $D1D6.w,X		; 7D D6 D1
	inx		; E8
	ora $7F.b		; 05 7F
	lda $7E.b,S		; A3 7E
	lda ($35.b)		; B2 35
	cmp $61DAAB.l		; CF AB DA 61
	pea $5E96.w		; F4 96 5E
	phb		; 8B
	sbc $98.b,X		; F5 98
	phy		; 5A
	ora $F9B743.l		; 0F 43 B7 F9
	bit $42.b,X		; 34 42
	sbc $74.b		; E5 74
	cpy $6676.w		; CC 76 66
	sta [$7D.b]		; 87 7D
	cmp [$FD.b],Y		; D7 FD
	dec $1D2B.w,X		; DE 2B 1D
	adc $B5.b,S		; 63 B5
	lda $78.b,X		; B5 78
	adc $6757.w,X		; 7D 57 67
	xba		; EB
	php		; 08
	eor $6911.w,Y		; 59 11 69
	cmp $7A.b		; C5 7A
	pld		; 2B
	cmp ($5E.b),Y		; D1 5E
	sta [$04.b]		; 87 04
	and ($0B.b),Y		; 31 0B
	inc $91.b,X		; F6 91
	cmp #$8304.w		; C9 04 83
	lsr A		; 4A
	adc $6CA3.w,X		; 7D A3 6C
	ror $9B99.w		; 6E 99 9B
	and ($87.b,S),Y		; 33 87
	.db $42, $34		; 42 34
	pha		; 48
	plp		; 28
	txy		; 9B
	jsl $01C533.l		; 22 33 C5 01
	sbc $21.b,S		; E3 21
	sta $C913E0.l		; 8F E0 13 C9
	rti		; 40

	jmp $753B9F.l		; 5C 9F 3B 75
	ora $2852.w,Y		; 19 52 28
	eor ($30.b,X)		; 41 30
	.db $42, $6E		; 42 6E
	sty $3A.b		; 84 3A
	sta $163D.w		; 8D 3D 16
	rtl		; 6B

	eor $219A45.l		; 4F 45 9A 21
	adc ($8A.b,S),Y		; 73 8A
	lda ($44.b),Y		; B1 44
	and ($08.b,X)		; 21 08
	.db $42, $91		; 42 91
	ora [$08.b]		; 07 08
	bpl -124.b		; 10 84
	and ($09.b,X)		; 21 09
	and ($D1.b,X)		; 21 D1
	php		; 08
	.db $42, $10		; 42 10
	txy		; 9B
	jmp ($8460.w)		; 6C 60 84
	and ($08.b,X)		; 21 08
	rti		; 40

	cop $10.b		; 02 10
	sty $21.b		; 84 21
	eor ($00.b,X)		; 41 00
	php		; 08
	.db $42, $10		; 42 10
	sty $90.b		; 84 90
	sty $21.b		; 84 21
	php		; 08
	.db $42, $B0		; 42 B0
	sta [$52.b]		; 87 52
	and $16.b		; 25 16
	php		; 08
	.db $42, $10		; 42 10
	lda $9E72.w		; AD 72 9E
	cmp [$B0.b]		; C7 B0
	asl $E669.w,X		; 1E 69 E6
	stz $E669.w,X		; 9E 69 E6
	sty $D9.b		; 84 D9
	lda $241B.w		; AD 1B 24
	tas		; 1B
	rti		; 40

	.db $82, $64, $D1		; 82 64 D1
	ora ($CB.b,S),Y		; 13 CB
	jsl $880E78.l		; 22 78 0E 88
	.db $42, $7C		; 42 7C
	inc $8F.b		; E6 8F
	sta $851082.l		; 8F 82 10 85
	sta $0633.w,Y		; 99 33 06
	rts		; 60

	cmp $FE961C.l		; CF 1C 96 FE
	pla		; 68
	ldy $E1.b,X		; B4 E1
	phb		; 8B
	mvn $09,$FB		; 54 FB 09
	ora $6064F7.l		; 0F F7 64 60
	pld		; 2B
	cmp ($1A.b,X)		; C1 1A
	cop $F4.b		; 02 F4
	lda ($00.b,S),Y		; B3 00
	and #$C492.w		; 29 92 C4
	nop		; EA
	bpl -24.b		; 10 E8
	inx		; E8
	inx		; E8
	sty $24.b		; 84 24
	cld		; D8
	sty $21.b		; 84 21
	php		; 08
	.db $42, $40		; 42 40
	sty $21.b		; 84 21
	php		; 08
	.db $42, $CE		; 42 CE
	ror $39.b		; 66 39
	inc $DE.b,X		; F6 DE
	wai		; CB
	sec		; 38
	sta $D1FC.w		; 8D FC D1
	mvp $78,$21		; 44 21 78
	jmp ($A7FA.w)		; 6C FA A7
	lsr $7E.b,X		; 56 7E
	and $48.b,S		; 23 48
	sei		; 78
	cpy $2CFE.w		; CC FE 2C
	adc $D5A8.w,Y		; 79 A8 D5
	ora $944D.w,Y		; 19 4D 94
	sbc $63.b		; E5 63
	lsr A		; 4A
	dec $95.b		; C6 95
	sty $81C1.w		; 8C C1 81
	jmp $A487FC.l		; 5C FC 87 A4
	mvn $06,$65		; 54 65 06
	eor $65.b,X		; 55 65
	bpl   7.b		; 10 07
	lda $3C.b,S		; A3 3C
	cmp [$A5.b]		; C7 A5
	mvn $88,$95		; 54 95 88
	.db $62, $14, $49		; 62 14 49
	sta $74.b,X		; 95 74
	pea $7123.w		; F4 23 71
	rtl		; 6B

	jsr ($1D96.w,X)		; FC 96 1D
	eor $F256.w		; 4D 56 F2
	ldy $13.b,X		; B4 13
	ldy #$FF.b		; A0 FF
	trb $CEBC.w		; 1C BC CE
	and $1F7B81.l,X		; 3F 81 7B 1F
	ora ($CA.b,S),Y		; 13 CA
	lda $99.b,X		; B5 99
	xba		; EB
	cpx #$41.b		; E0 41
	lda $6299.w,X		; BD 99 62
	adc $78130B.l		; 6F 0B 13 78
	cli		; 58
	txy		; 9B
	rep #$C4		; C2 C4
	dec $480E.w,X		; DE 0E 48
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $C3.b		; 06 C3
	brk $10.b		; 00 10
	asl $B1.b		; 06 B1
	ora ($B2.b,S),Y		; 13 B2
	brk $00.b		; 00 00
	lda ($B2.b,S),Y		; B3 B2
	lda ($B4.b)		; B2 B4
	bcs   8.b		; B0 08
	lda $B4.b,X		; B5 B4
	ldy $B6.b,X		; B4 B6
	lda ($B3.b,S),Y		; B3 B3
	lda [$B5.b],Y		; B7 B5
	lda $B8.b,X		; B5 B8
	ldx $B6.b,Y		; B6 B6
	lda $B7B7.w,Y		; B9 B7 B7
	tsx		; BA
	clv		; B8
	clv		; B8
	tyx		; BB
	lda $BCB9.w,Y		; B9 B9 BC
	tsx		; BA
	tsx		; BA
	lda $BBBB.w,X		; BD BB BB
	ldx $BCBC.w,Y		; BE BC BC
	lda $C0BDBD.l,X		; BF BD BD C0
	lda $BEC1BF.l,X		; BF BF C1 BE
	ldx $B2C2.w,Y		; BE C2 B2
	brk $C3.b		; 00 C3
	cpy #$C0.b		; C0 C0
	cpy $C1.b		; C4 C1
	cmp ($40.b,X)		; C1 40
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $C4.b,S		; 03 C4
	cmp ($BC.b,X)		; C1 BC
	lda ($B2.b,S),Y		; B3 B2
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora $BC.b,S		; 03 BC
	clv		; B8
	rep #$04		; C2 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
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
	brk $15.b		; 00 15
	brk $16.b		; 00 16
	brk $17.b		; 00 17
	brk $18.b		; 00 18
	brk $19.b		; 00 19
	brk $1A.b		; 00 1A
	ldy $1BC2.w,X		; BC C2 1B
	tsb $081C.w		; 0C 1C 08
	ldx $B3.b,Y		; B6 B3
	ora $1E00.w,X		; 1D 00 1E
	brk $1F.b		; 00 1F
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $23.b		; 00 23
	brk $24.b		; 00 24
	brk $25.b		; 00 25
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	brk $28.b		; 00 28
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2B.b		; 00 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2E.b		; 00 2E
	brk $2F.b		; 00 2F
	brk $30.b		; 00 30
	brk $31.b		; 00 31
	brk $32.b		; 00 32
	brk $33.b		; 00 33
	clv		; B8
	ldx $C2.b,Y		; B6 C2
	bit $0C.b,X		; 34 0C
	and $0C.b,X		; 35 0C
	rol $0C.b,X		; 36 0C
	clv		; B8
	ldx $37.b,Y		; B6 37
	tsb $0C38.w		; 0C 38 0C
	and $3A0C.w,Y		; 39 0C 3A
	tsb $0C3B.w		; 0C 3B 0C
	bit $3D0C.w,X		; 3C 0C 3D
	tsb $0C3E.w		; 0C 3E 0C
	and $0C400C.l,X		; 3F 0C 40 0C
	eor ($0C.b,X)		; 41 0C
	.db $42, $0C		; 42 0C
	eor $00.b,S		; 43 00
	mvp $45,$00		; 44 00 45
	brk $46.b		; 00 46
	brk $47.b		; 00 47
	brk $48.b		; 00 48
	brk $49.b		; 00 49
	brk $4A.b		; 00 4A
	brk $4B.b		; 00 4B
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
	brk $57.b		; 00 57
	brk $58.b		; 00 58
	brk $59.b		; 00 59
	brk $5A.b		; 00 5A
	brk $5B.b		; 00 5B
.INDEX 16
	rep #$5C		; C2 5C
	tsb $0C5D.w		; 0C 5D 0C
	lsr $B30C.w,X		; 5E 0C B3
	eor $0C600C.l,X		; 5F 0C 60 0C
	adc ($0C.b,X)		; 61 0C
	.db $62, $0C, $63		; 62 0C 63
	tsb $0C64.w		; 0C 64 0C
	adc $0C.b		; 65 0C
	ror $0C.b		; 66 0C
	adc [$0C.b]		; 67 0C
	pla		; 68
	tsb $0869.w		; 0C 69 08
	lda ($6A.b)		; B2 6A
	brk $6B.b		; 00 6B
	tsb $0C6C.w		; 0C 6C 0C
	adc $6E0C.w		; 6D 0C 6E
	tsb $0C6F.w		; 0C 6F 0C
	lda ($70.b)		; B2 70
	tsb $0C71.w		; 0C 71 0C
	adc ($0C.b)		; 72 0C
	adc ($0C.b,S),Y		; 73 0C
	stz $0C.b,X		; 74 0C
	adc $0C.b,X		; 75 0C
	ror $0C.b,X		; 76 0C
	adc [$0C.b],Y		; 77 0C
	sei		; 78
	tsb $0C79.w		; 0C 79 0C
	ply		; 7A
	tsb $0C7B.w		; 0C 7B 0C
	jmp ($7D0C.w,X)		; 7C 0C 7D
	tsb $087E.w		; 0C 7E 08
	adc $048004.l,X		; 7F 04 80 04
	sta ($04.b,X)		; 81 04
	.db $82, $04, $83		; 82 04 83
	tsb $84.b		; 04 84
	tsb $85.b		; 04 85
	tsb $86.b		; 04 86
	tsb $87.b		; 04 87
	tsb $88.b		; 04 88
	tsb $89.b		; 04 89
	tsb $8A.b		; 04 8A
	tsb $8B.b		; 04 8B
	tsb $8C.b		; 04 8C
	tsb $8D.b		; 04 8D
	tsb $8E.b		; 04 8E
	tsb $8F.b		; 04 8F
	tsb $90.b		; 04 90
	tsb $91.b		; 04 91
	tsb $92.b		; 04 92
	tsb $93.b		; 04 93
	tsb $94.b		; 04 94
	tsb $95.b		; 04 95
	tsb $96.b		; 04 96
	tsb $97.b		; 04 97
	tsb $0C98.w		; 0C 98 0C
	sta $9A0C.w,Y		; 99 0C 9A
	tsb $089B.w		; 0C 9B 08
	stz $9D0C.w		; 9C 0C 9D
	tsb $0C9E.w		; 0C 9E 0C
	sta $08A00C.l,X		; 9F 0C A0 08
	lda ($08.b,X)		; A1 08
	ldx #$A30C.w		; A2 0C A3
	tsb $0CA4.w		; 0C A4 0C
	lda $0C.b		; A5 0C
	ldx $0C.b		; A6 0C
	lda [$08.b]		; A7 08
	tay		; A8
	tsb $0CA9.w		; 0C A9 0C
	tax		; AA
	tsb $0CAB.w		; 0C AB 0C
	ldy $AD0C.w		; AC 0C AD
	tsb $0CAE.w		; 0C AE 0C
	lda $C3C30C.l		; AF 0C C3 C3
	cmp $BF.b,S		; C3 BF
	cpy $C1.b		; C4 C1
	ldx $BABC.w,Y		; BE BC BA
	clv		; B8
	ldx $B3.b,Y		; B6 B3
.ACCU 16
.INDEX 16
	rep #$B1		; C2 B1
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $0B.b		; 00 0B
	bpl   4.b		; 10 04
	brk $58.b		; 00 58
	ldy $54.b		; A4 54
	stx $65.b,Y		; 96 65
	sta $0B.b,X		; 95 0B
	lda ($84.b,X)		; A1 84
	mvn $20,$C0		; 54 C0 20
	bvs  16.b		; 70 10
	lsr $081C.w		; 4E 1C 08
	cmp #$9290.w		; C9 90 92
	eor ($00.b,X)		; 41 00
	eor $26.b,S		; 43 26
	sbc $2204.w,X		; FD 04 22
	plp		; 28
	pla		; 68
	eor $24.b,S		; 43 24
	sta ($59.b)		; 92 59
	cpx $9489.w		; EC 89 94
	lda $93A9.w		; AD A9 93
	cmp $1921.w,Y		; D9 21 19
	ldx $52.b,Y		; B6 52
	lda $5D.b		; A5 5D
	lda ($49.b)		; B2 49
	bpl -35.b		; 10 DD
	inc $926E.w		; EE 6E 92
	cmp $922F.w		; CD 2F 92
	eor $96A7.w		; 4D A7 96
	stz $4B.b		; 64 4B
	stz $D6.b		; 64 D6
	eor #$B224.w		; 49 24 B2
	phk		; 4B
	bit $92.b		; 24 92
	eor #$D224.w		; 49 24 D2
	eor #$9624.w		; 49 24 96
	eor $4526.w,Y		; 59 26 45
	sta ($5B.b,S),Y		; 93 5B
	lda $93.b		; A5 93
	cmp #$9624.w		; C9 24 96
	adc $B225.w,Y		; 79 25 B2
	eor $59BE6C.l,X		; 5F 6C BE 59
	bit $B2.b		; 24 B2
	eor $499225.l		; 4F 25 92 49
	bit $C996.w		; 2C 96 C9
	bit $4992.w		; 2C 92 49
	bit $92.b		; 24 92
	cmp #$96A4.w		; C9 A4 96
	phk		; 4B
	bit $92.b		; 24 92
	eor #$9265.w		; 49 65 92
	eor #$922D.w		; 49 2D 92
	eor #$842C.w		; 49 2C 84
	bmi  -1.b		; 30 FF
	ldx $4B65.w,Y		; BE 65 4B
	brk $86.b		; 00 86
	and $829A35.l		; 2F 35 9A 82
	cmp ($42.b),Y		; D1 42
	sta $75.b,X		; 95 75
	cmp ($0C.b,X)		; C1 0C
	ply		; 7A
	cmp $AC.b,X		; D5 AC
	clc		; 18
	bpl -59.b		; 10 C5
	lda [$4C.b]		; A7 4C
	dec $92DD.w,X		; DE DD 92
	ror $E64E.w		; 6E 4E E6
	eor $12.b,S		; 43 12
	sta $B43D.w,Y		; 99 3D B4
	mvn $23,$6E		; 54 6E 23
	eor $64F7.w,X		; 5D F7 64
	ldy $31.b		; A4 31
	ora $5ED8.w		; 0D D8 5E
	ldx $CC.b		; A6 CC
	bne  40.b		; D0 28
	cmp ($22.b,S),Y		; D3 22
	pei ($84.b)		; D4 84
	.db $82, $38, $BC		; 82 38 BC
	rep #$CB		; C2 CB
	tas		; 1B
	lda $0E.b,X		; B5 0E
	rtl		; 6B

	stx $29.b,Y		; 96 29
	sta $6A9D21.l,X		; 9F 21 9D 6A
	dec $0C.b,X		; D6 0C
	bpl  64.b		; 10 40
	eor $35DC.w		; 4D DC 35
	adc $08.b		; 65 08
	eor $12.b,S		; 43 12
.ACCU 8
	sep #$E2		; E2 E2
	eor $63.b,X		; 55 63
	pei ($3C.b)		; D4 3C
	sty $1055.w		; 8C 55 10
	dec $F152.w		; CE 52 F1
	adc ($BC.b),Y		; 71 BC
	adc ($9F.b),Y		; 71 9F
	cpy $C47D.w		; CC 7D C4
	sta [$8B.b],Y		; 97 8B
	sei		; 78
	.db $42, $14		; 42 14
	lda $18.b,S		; A3 18
	ldy $E1.b,X		; B4 E1
	pei ($3D.b)		; D4 3D
	asl $78.b,X		; 16 78
	and $938910.l,X		; 3F 10 89 93
	adc $3FBC.w,X		; 7D BC 3F
	lsr A		; 4A
	ldy $39.b		; A4 39
	dey		; 88
	asl $EB8D.w,X		; 1E 8D EB
	and $1082.w,Y		; 39 82 10
	ora [$BF.b]		; 07 BF
	pld		; 2B
	ora [$B7.b],Y		; 17 B7
	tyx		; BB
	asl A		; 0A
	tya		; 98
	ora [$BB.b]		; 07 BB
	php		; 08
	adc $11C2.w,Y		; 79 C2 11
	sta $0B.b,S		; 83 0B
	adc $34.b,S		; 63 34
	phk		; 4B
	and ($34.b,S),Y		; 33 34
	.db $42, $13		; 42 13
	iny		; C8
	eor $4C26.w		; 4D 26 4C
	nop		; EA
	xba		; EB
	bcc 116.b		; 90 74
	iny		; C8
	lda $F2E6.w,Y		; B9 E6 F2
	ldx $6BB6.w,Y		; BE B6 6B
	jmp $ADF3.w		; 4C F3 AD
	stx $7E00.w		; 8E 00 7E
	.db $82, $B4, $57		; 82 B4 57
	php		; 08
	.db $82, $D5, $16		; 82 D5 16
	stz $DD.b,X		; 74 DD
	sta $0008.w,Y		; 99 08 00
	lda $0F.b		; A5 0F
	ora $D8.b,S		; 03 D8
	tas		; 1B
	lda ($02.b),Y		; B1 02
	ora $4488.w,X		; 1D 88 44
	bpl  16.b		; 10 10
	ldx #$71DC.w		; A2 DC 71
	eor [$EA.b]		; 47 EA
	and $A121.w,X		; 3D 21 A1
	php		; 08
	jmp.w [$4E66]		; DC 66 4E
	cpx #$75E3.w		; E0 E3 75
	adc ($8D.b,S),Y		; 73 8D
	asl $C939.w,X		; 1E 39 C9
	eor $C8.b,X		; 55 C8
	pha		; 48
	and ($FD.b,S),Y		; 33 FD
	asl A		; 0A
	jmp ($319F.w)		; 6C 9F 31
	eor $22A5.w,X		; 5D A5 22
	lda $7E.b		; A5 7E
	sta $4210.w,Y		; 99 10 42
	bit $0E58.w		; 2C 58 0E
	inc A		; 1A
	cpy #$01BC.w		; C0 BC 01
	cpy #$C418.w		; C0 18 C4
	and ($DB.b,S),Y		; 33 DB
	stp		; DB
	lda ($E1.b)		; B2 E1
	jsl $640ABD.l		; 22 BD 0A 64
	tas		; 1B
	bit $E5.b,X		; 34 E5
	rol $4C.b		; 26 4C
	jmp.w [$15DD]		; DC DD 15
	adc ($16.b)		; 72 16
	and $8A.b		; 25 8A
	stx $22E1.w		; 8E E1 22
	lda $BC.b		; A5 BC
	lda $DCA0A3.l		; AF A3 A0 DC
	and #$FE.b		; 29 FE
	ora [$2A.b],Y		; 17 2A
	dec $2F.b,X		; D6 2F
	eor $CA.b,X		; 55 CA
	eor ($7E.b),Y		; 51 7E
	ldx $74.b		; A6 74
	cmp $D3C1.w,X		; DD C1 D3
	dec $F7.b		; C6 F7
	dec $3B79.w		; CE 79 3B
	tay		; A8
	adc $D5E780.l		; 6F 80 E7 D5
	cmp $36084B.l,X		; DF 4B 08 36
	asl $22.b		; 06 22
	asl $26DA.w		; 0E DA 26
	cld		; D8
	cpy $73.b		; C4 73
	iny		; C8
	adc ($1C.b,X)		; 61 1C
	lda ($91.b,S),Y		; B3 91
	tsb $2D23.w		; 0C 23 2D
	sta $99.b,S		; 83 99
	adc $7A3ACA.l		; 6F CA 3A 7A
	inc $B459.w		; EE 59 B4
	sbc #$F3.b		; E9 F3
	adc $695F59.l		; 6F 59 5F 69
	stp		; DB
	rts		; 60

	inc $AE.b,X		; F6 AE
	adc #$A4.b		; 69 A4
	bit $A7.b		; 24 A7
	stx $4A.b,Y		; 96 4A
	cmp ($40.b)		; D2 40
	sbc $A414.w,Y		; F9 14 A4
	adc $EBCA.w,Y		; 79 CA EB
	eor ($D3.b)		; 52 D3
	sty $2644.w		; 8C 44 26
	cmp ($95.b)		; D2 95
	phk		; 4B
	ldx $83.b		; A6 83
	tax		; AA
	tad		; 5B
	ldy $6E.b,X		; B4 6E
	phk		; 4B
	cmp $EF82.w		; CD 82 EF
	dec A		; 3A
	sbc ($2A.b,X)		; E1 2A
	sta $A285.w,Y		; 99 85 A2
	eor $5924.w,X		; 5D 24 59
	sta $D1.b,X		; 95 D1
	adc [$59.b],Y		; 77 59
	lda $F8.b,S		; A3 F8
	asl $F2.b,X		; 16 F2
	adc $67BA.w		; 6D BA 67
	ldy $37.b		; A4 37
	sty $DB9C.w		; 8C 9C DB
	eor $8C.b,S		; 43 8C
	adc $CA.b,S		; 63 CA
	ora $8165.w		; 0D 65 81
	eor ($27.b,X)		; 41 27
	lsr $C069.w,X		; 5E 69 C0
	phy		; 5A
	sbc $F0CA.w,X		; FD CA F0
	eor $78.b,X		; 55 78
	lda [$9D.b],Y		; B7 9D
	ldy $9C.b		; A4 9C
	lda ($28.b),Y		; B1 28
	sbc $BE.b,X		; F5 BE
	ora $3D2A.w,X		; 1D 2A 3D
	lda ($CE.b)		; B2 CE
	ora $70D9.w		; 0D D9 70
	tsb $28.b		; 04 28
	clv		; B8
	tas		; 1B
	cpx #$6FE0.w		; E0 E0 6F
	cpy $A83A.w		; CC 3A A8
	eor $42A3.w		; 4D A3 42
	cmp ($BD.b)		; D2 BD
	asl $23.b,X		; 16 23
	tay		; A8
	sta $DF58.w		; 8D 58 DF
	and $FFE1.w,Y		; 39 E1 FF
	eor $D1D74E.l		; 4F 4E D7 D1
	eor ($3B.b,S),Y		; 53 3B
	inc A		; 1A
	ora $BDF4.w		; 0D F4 BD
	asl $BE.b,X		; 16 BE
	lda $2BFD.w		; AD FD 2B
	cmp $EB.b,X		; D5 EB
	trb $36.b		; 14 36
	lda [$2D.b]		; A7 2D
	ldx #$B5F6.w		; A2 F6 B5
	clc		; 18
	adc ($57.b,S),Y		; 73 57
	pea $9534.w		; F4 34 95
	phy		; 5A
	phd		; 0B
	rol $26B4.w,X		; 3E B4 26
	cmp [$A5.b],Y		; D7 A5
	cmp ($DA.b)		; D2 DA
	sbc ($63.b)		; F2 63
	and [$3C.b],Y		; 37 3C
	stp		; DB
	ora $BF11.w,X		; 1D 11 BF
	eor ($66.b,X)		; 41 66
	ldy #$2C91.w		; A0 91 2C
	cmp ($B2.b,X)		; C1 B2
	stx $EB.b		; 86 EB
	sty $D3.b,X		; 94 D3
	sta $139F.w,X		; 9D 9F 13
	ora $BE.b,S		; 03 BE
	ora $0C.b,X		; 15 0C
	sed		; F8
	pei ($02.b)		; D4 02
	plx		; FA
	stz $FF92.w,X		; 9E 92 FF
	sta ($70.b,X)		; 81 70
	stx $E315.w		; 8E 15 E3
	eor ($23.b)		; 52 23
	brk $97.b		; 00 97
	eor $DC.b,X		; 55 DC
	adc $464915.l,X		; 7F 15 49 46
	sta $41.b		; 85 41
	tay		; A8
	sta $644217.l,X		; 9F 17 42 64
	php		; 08
	phd		; 0B
	cmp ($DE.b)		; D2 DE
	pha		; 48
	sty $75.b		; 84 75
	cmp ($93.b)		; D2 93
	lda $A114.w		; AD 14 A1
	jmp ($518B.w,X)		; 7C 8B 51
	lsr $8331.w		; 4E 31 83
	cpx #$119B.w		; E0 9B 11
	sep #$00		; E2 00
	lda $6B80.w		; AD 80 6B
	eor [$6C.b]		; 47 6C
	and ($6F.b),Y		; 31 6F
	jmp ($F82F.w)		; 6C 2F F8
	cld		; D8
	adc $53CDC7.l,X		; 7F C7 CD 53
	eor $22FD3D.l		; 4F 3D FD 22
	plx		; FA
	sty $A0.b,X		; 94 A0
	dec $94.b		; C6 94
	sbc ($A1.b)		; F2 A1
	asl $1931.w,X		; 1E 31 19
	cmp $8F.b,X		; D5 8F
	sta $72.b,X		; 95 72
	cmp $5C.b		; C5 5C
	cmp $76.b,S		; C3 76
	inc $F7A0.w		; EE A0 F7
	adc $0C.b		; 65 0C
	lda $0D0B.w,Y		; B9 0B 0D
	phx		; DA
	txy		; 9B
	jmp $D3D973.l		; 5C 73 D9 D3
	jmp ($0A8E.w,X)		; 7C 8E 0A
	xba		; EB
	lda $B4.b,S		; A3 B4
	bcs  85.b		; B0 55
	phk		; 4B
	ldx $637B.w,Y		; BE 7B 63
	and [$3E.b],Y		; 37 3E
	phx		; DA
	and $9B.b		; 25 9B
	bit $27.b,X		; 34 27
	bcc -89.b		; 90 A7
	eor #$21.b		; 49 21
	mvp $1E,$43		; 44 43 1E
	tya		; 98
	stz $0CB1.w,X		; 9E B1 0C
	adc ($99.b,S),Y		; 73 99
	asl A		; 0A
	lsr $58.b		; 46 58
	sbc ($18.b)		; F2 18
	sbc $3081.w,X		; FD 81 30
	adc ($64.b)		; 72 64
	and ($FE.b),Y		; 31 FE
	dec $D762.w		; CE 62 D7
	ldx $43.b		; A6 43
	asl $E4.b,X		; 16 E4
	dec $DFFE.w,X		; DE FE DF
	sta $AFC5.w		; 8D C5 AF
	sta ($21.b,X)		; 81 21
	bit #$C8.b		; 89 C8
	sec		; 38
	sbc ($E4.b,X)		; E1 E4
	lda $1B815D.l		; AF 5D 81 1B
	and [$90.b],Y		; 37 90
	cmp $8DA165.l		; CF 65 A1 8D
	sbc $B1.b,S		; E3 B1
	cmp ($88.b),Y		; D1 88
	dec A		; 3A
	eor $0465.w,X		; 5D 65 04
	eor $71.b,S		; 43 71
	ora $BA.b,X		; 15 BA
	sed		; F8
	cpx #$7E55.w		; E0 55 7E
	lsr $71.b,X		; 56 71
	jmp $5B0B89.l		; 5C 89 0B 5B
	dec $1D76.w		; CE 76 1D
	cpx $BA75.w		; EC 75 BA
	inc $2215.w		; EE 15 22
	eor $DF0C.w,Y		; 59 0C DF
	sta $016543.l,X		; 9F 43 65 01
	cmp $D99A8A.l,X		; DF 8A 9A D9
	sta $ACC750.l,X		; 9F 50 C7 AC
	sta ($6A.b,S),Y		; 93 6A
	lda ($E0.b,S),Y		; B3 E0
	adc $85.b,S		; 63 85
	cmp $34.b,X		; D5 34
	adc [$94.b],Y		; 77 94
	sty $E7.b		; 84 E7
	cpy $A4.b		; C4 A4
	sta $23.b,X		; 95 23
	asl $BF58.w,X		; 1E 58 BF
	ror $0CBA.w,X		; 7E BA 0C
	lsr A		; 4A
	eor $13.b,S		; 43 13
	ora [$6D.b]		; 07 6D
	sbc $25CFE0.l		; EF E0 CF 25
	sty $8036.w		; 8C 36 80
	stx $37.b		; 86 37
	trb $8F9F.w		; 1C 9F 8F
	sta $7A.b,X		; 95 7A
	sbc ($10.b)		; F2 10
	cmp $DF.b		; C5 DF
	tyx		; BB
	sbc ($3A.b,X)		; E1 3A
	lsr $1D3F.w,X		; 5E 3F 1D
	ldy #$8B21.w		; A0 21 8B
	phy		; 5A
	ldx $5A.b,Y		; B6 5A
	inc $5F8B.w		; EE 8B 5F
	sbc ($7B.b,X)		; E1 7B
	and ($13.b,X)		; 21 13
	ora ($C1.b),Y		; 11 C1
	and ($7B.b,S),Y		; 33 7B
	adc ($AA.b,S),Y		; 73 AA
	.db $62, $90, $65		; 62 90 65
	eor $95.b,S		; 43 95
	stx $9E8B.w		; 8E 8B 9E
	lda [$D3.b]		; A7 D3
	xba		; EB
	rol $4AD6.w,X		; 3E D6 4A
	ror $A6C5.w,X		; 7E C5 A6
	lda [$DC.b],Y		; B7 DC
	and $86.b		; 25 86
	phx		; DA
	rtl		; 6B

	ora #$7E.b		; 09 7E
	ora $ED8EA5.l,X		; 1F A5 8E ED
	sta $99.b,X		; 95 99
	inc $CFE2.w,X		; FE E2 CF
	cmp $AC.b,X		; D5 AC
	tax		; AA
	ora $B014.w,X		; 1D 14 B0
	sta ($B9.b),Y		; 91 B9
	eor ($8E.b,X)		; 41 8E
	ora ($8F.b)		; 12 8F
	xba		; EB
	stp		; DB
	cpx $6F.b		; E4 6F
	cmp $9A91BF.l,X		; DF BF 91 9A
	.db $82, $B2, $53		; 82 B2 53
	lsr $59.b		; 46 59
	eor ($DA.b),Y		; 51 DA
	ora [$61.b]		; 07 61
	dec A		; 3A
	jmp $315BE6.l		; 5C E6 5B 31
	dec $47.b		; C6 47
	ora ($15.b)		; 12 15
	ldy $9B.b,X		; B4 9B
	rol $2F.b,X		; 36 2F
	sta $A962.w		; 8D 62 A9
	rtl		; 6B

	sta $5F1B3D.l,X		; 9F 3D 1B 5F
	cmp $13.b,S		; C3 13
	and $946B.w,X		; 3D 6B 94
	cpy #$E4FB.w		; C0 FB E4
	eor $79.b,X		; 55 79
	asl $1FD0.w		; 0E D0 1F
	wai		; CB
	eor $0D.b,S		; 43 0D
	adc $21.b		; 65 21
	tyx		; BB
	.db $62, $F2, $07		; 62 F2 07
	ora #$8B.b		; 09 8B
	cmp #$F3.b		; C9 F3
	ora [$E6.b]		; 07 E6
	sty $1E.b,X		; 94 1E
	rol $C3.b,X		; 36 C3
	cpy #$4624.w		; C0 24 46
	adc ($B7.b,X)		; 61 B7
	inc $8F.b,X		; F6 8F
	cop $ED.b		; 02 ED
	txa		; 8A
	ora [$0E.b]		; 07 0E
	inx		; E8
	sta $C214.w,Y		; 99 14 C2
	stz $085C.w		; 9C 5C 08
	eor ($F6.b,X)		; 41 F6
	sbc $AF.b		; E5 AF
	sta $D7B2FC.l		; 8F FC B2 D7
	sta $6BA5.w		; 8D A5 6B
	beq -82.b		; F0 AE
	ldy $0A7D.w		; AC 7D 0A
	sbc ($B4.b),Y		; F1 B4
	inc $7385.w,X		; FE 85 73
	ldx $EE2A.w,Y		; BE 2A EE
	ldy $5C.b,X		; B4 5C
	cmp $55.b		; C5 55
	and $95.b		; 25 95
	iny		; C8
	lda ($1C.b),Y		; B1 1C
	ora $2F64B1.l		; 0F B1 64 2F
	eor [$97.b],Y		; 57 97
	pea $FD78.w		; F4 78 FD
	ldx $8124.w		; AE 24 81
	lda $591524.l,X		; BF 24 15 59
	bcs -49.b		; B0 CF
	ror $BF37.w,X		; 7E 37 BF
	ora ($D9.b),Y		; 11 D9
	sbc ($F0.b)		; F2 F0
	cmp $8FD7.w		; CD D7 8F
	dey		; 88
	eor $0B.b,S		; 43 0B
	ror $95.b		; 66 95
	iny		; C8
	sbc $BC47.w		; ED 47 BC
	and $21.b,X		; 35 21
	pei ($30.b)		; D4 30
	ora $37F898.l,X		; 1F 98 F8 37
	ora $C1E1AF.l,X		; 1F AF E1 C1
.ACCU 16
.INDEX 16
	rep #$74		; C2 74
	ldy $E8.b,X		; B4 E8
	adc $3F92.w,Y		; 79 92 3F
	ora $27.b		; 05 27
	cmp ($D2.b,X)		; C1 D2
	eor ($6E.b),Y		; 51 6E
	ldy $D7.b		; A4 D7
	txy		; 9B
	eor ($F2.b,S),Y		; 53 F2
	sta $AA.b		; 85 AA
	trb $A9F1.w		; 1C F1 A9
	and $088CEC.l		; 2F EC 8C 08
	pea $4206.w		; F4 06 42
	tya		; 98
	eor $9D380E.l,X		; 5F 0E 38 9D
	tas		; 1B
	cpy $AA.b		; C4 AA
	ora [$B6.b]		; 07 B6
	cmp $2D4A.w		; CD 4A 2D
	bvc -77.b		; 50 B3
	adc #$65C2.w		; 69 C2 65
	wai		; CB
	rtl		; 6B

	cmp ($A9.b,S),Y		; D3 A9
	bra -54.b		; 80 CA
	rts		; 60

	lsr $72.b		; 46 72
	pla		; 68
	sbc $AD.b,X		; F5 AD
	sbc $A5A4.w		; ED A4 A5
	jmp ($BB1E.w)		; 6C 1E BB
	ora $122B12.l,X		; 1F 12 2B 12
	sty $59.b,X		; 94 59
	sty $8E.b		; 84 8E
	bne -87.b		; D0 A9
	phd		; 0B
	cmp ($D6.b)		; D2 D6
	lda $E6.b		; A5 E6
	eor ($7E.b),Y		; 51 7E
	ror $A5.b,X		; 76 A5
	eor ($E6.b,X)		; 41 E6
	sbc $E10D.w		; ED 0D E1
	ora [$A0.b]		; 07 A0
	pla		; 68
	lsr $76.b,X		; 56 76
	sty $54.b,X		; 94 54
	sta $411CCA.l,X		; 9F CA 1C 41
	asl A		; 0A
	and ($E9.b),Y		; 31 E9
	eor ($0E.b),Y		; 51 0E
	bcc -118.b		; 90 8A
	phd		; 0B
	.db $82, $02, $FC		; 82 02 FC
	rol A		; 2A
	trb $23.b		; 14 23
	nop		; EA
	and $5A8434.l		; 2F 34 84 5A
	lda $83.b,X		; B5 83
	phd		; 0B
	pla		; 68
	stz $3713.w		; 9C 13 37
	eor $9D.b,X		; 55 9D
	txa		; 8A
	ora $A4.b,X		; 15 A4
	bmi -114.b		; 30 8E
	lda $56.b,S		; A3 56
	eor $08.b,S		; 43 08
	cpx #$8865.w		; E0 65 88
	adc ($1E.b,X)		; 61 1E
	ldy $0C41.w		; AC 41 0C
	phy		; 5A
	adc ($39.b)		; 72 39
	sta ($7C.b,S),Y		; 93 7C
	sta $6262.w,X		; 9D 62 62
	ora $11D3.w,Y		; 19 D3 11
	cpy #$A490.w		; C0 90 A4
	adc $8F.b		; 65 8F
	adc [$BC.b],Y		; 77 BC
	ldy $217E.w		; AC 7E 21
	rol $2952.w,X		; 3E 52 29
	jsr $FE25.w		; 20 25 FE
	eor [$39.b],Y		; 57 39
	adc $35BA.w,Y		; 79 BA 35
	plx		; FA
	cpx $4D84.w		; EC 84 4D
	cmp $9E.b		; C5 9E
	lda ($E0.b,S),Y		; B3 E0
	ldx $AE.b,Y		; B6 AE
	cmp ($F2.b,S),Y		; D3 F2
	eor $C5.b,X		; 55 C5
	rol $B3.b,X		; 36 B3
	and #$F90C.w		; 29 0C F9
	dec $8B7C.w,X		; DE 7C 8B
	lsr $A5D9.w		; 4E D9 A5
	rol $A0.b,X		; 36 A0
	phk		; 4B
	.db $82, $19, $DB		; 82 19 DB
	dey		; 88
	stz $7F96.w		; 9C 96 7F
	sbc $CEEB.w,X		; FD EB CE
	sta $CA77AB.l		; 8F AB 77 CA
	dec $A626.w		; CE 26 A6
	adc $BA7190.l		; 6F 90 71 BA
	sei		; 78
	rol $0E.b,X		; 36 0E
	ora #$2387.w		; 09 87 23
	adc $51F6E5.l,X		; 7F E5 F6 51
	ror $D1B1.w		; 6E B1 D1
	adc $7DD4.w,Y		; 79 D4 7D
	and ($2F.b,S),Y		; 33 2F
	sec		; 38
	sty $2D75.w		; 8C 75 2D
	stz $BCFF.w		; 9C FF BC
	and $6FC443.l,X		; 3F 43 C4 6F
	and [$E0.b],Y		; 37 E0
	and [$42.b],Y		; 37 42
	ror $65.b,X		; 76 65
	sta [$A9.b],Y		; 97 A9
	clc		; 18
	pld		; 2B
	eor $8813.w,Y		; 59 13 88
	adc [$83.b]		; 67 83
	adc ($6D.b,X)		; 61 6D
	lda $79FFD1.l,X		; BF D1 FF 79
	sbc ($B1.b,S),Y		; F3 B1
	asl $085C.w		; 0E 5C 08
	adc $D6.b,S		; 63 D6
	sta $1098.w,Y		; 99 98 10
	cmp [$E4.b]		; C7 E4
	ora #$9840.w		; 09 40 98
	stx $2F.b		; 86 2F
	plp		; 28
	jmp $6DAA.w		; 4C AA 6D
	rtl		; 6B

	ldx $23.b,Y		; B6 23
	sta ($0C.b),Y		; 91 0C
	lsr $9BC0.w		; 4E C0 9B
	jsl $DCA835.l		; 22 35 A8 DC
	phx		; DA
	adc [$9F.b],Y		; 77 9F
	pha		; 48
	.db $62, $B7, $FB		; 62 B7 FB
	ora $A5.b		; 05 A5
	phy		; 5A
	ldx #$BFD8.w		; A2 D8 BF
	adc ($0C.b),Y		; 71 0C
	ror A		; 6A
	cmp [$89.b],Y		; D7 89
	jsr ($E39D.w,X)		; FC 9D E3
	lda $730C.w,Y		; B9 0C 73
	cop $2D.b		; 02 2D
	dec $21AD.w		; CE AD 21
	sta $DDA33A.l,X		; 9F 3A A3 DD
	eor $A0.b		; 45 A0
	mvn $4D,$31		; 54 31 4D
	mvp $1C,$AA		; 44 AA 1C
	and ($FA.b)		; 32 FA
	ora $2E1B.w,X		; 1D 1B 2E
	nop		; EA
	eor $245F47.l		; 4F 47 5F 24
	brk $14.b		; 00 14
	sta $73BE09.l,X		; 9F 09 BE 73
	tay		; A8
	adc $8D98.w,Y		; 79 98 8D
	ora [$D8.b],Y		; 17 D8
	sta $E3.b,S		; 83 E3
	sta ($68.b)		; 92 68
	jmp ($581B.w)		; 6C 1B 58
	xba		; EB
	ora [$A5.b]		; 07 A5
	xce		; FB
	lda $E5.b,S		; A3 E5
	ldx $13B5.w		; AE B5 13
	eor [$C8.b]		; 47 C8
	lda $4D.b		; A5 4D
	inx		; E8
	stp		; DB
	inc $3D.b,X		; F6 3D
	rol A		; 2A
	tda		; 7B
	rol A		; 2A
	sta $2F59F1.l,X		; 9F F1 59 2F
	jmp $AAB8DA.l		; 5C DA B8 AA
	adc $ADD978.l,X		; 7F 78 D9 AD
	lda $16.b,X		; B5 16
	txs		; 9A
	lda $1F55.w,X		; BD 55 1F
	lsr $F152.w,X		; 5E 52 F1
	lsr $2D.b		; 46 2D
	txs		; 9A
	sta $41C5.w,Y		; 99 C5 41
	sbc $BC1B.w,Y		; F9 1B BC
	lda ($FA.b)		; B2 FA
	stx $06.b,Y		; 96 06
	cmp ($CA.b)		; D2 CA
	and $1F.b,S		; 23 1F
	and [$10.b],Y		; 37 10
	sta $FE.b,S		; 83 FE
	bit #$3CAC.w		; 89 AC 3C
	nop		; EA
	cmp $CE3EB6.l		; CF B6 3E CE
	jmp $CCEF.w		; 4C EF CC
	lsr $23.b,X		; 56 23
	cmp ($1D.b)		; D2 1D
	cmp ($22.b),Y		; D1 22
	cmp #$D2FA.w		; C9 FA D2
	mvp $E9,$FD		; 44 FD E9
	ldx $3601.w,Y		; BE 01 36
	and [$46.b],Y		; 37 46
	lda $15.b,X		; B5 15
	sta $9B.b		; 85 9B
	eor ($5E.b,X)		; 41 5E
	and $D495.w		; 2D 95 D4
	bvc  98.b		; 50 62
	sty $6A.b,X		; 94 6A
	plp		; 28
	rol $C4.b,X		; 36 C4
	adc ($4B.b)		; 72 4B
	rol $A7BE.w,X		; 3E BE A7
	inc $69.b		; E6 69
	txa		; 8A
	adc [$7D.b],Y		; 77 7D
	sbc ($CF.b,S),Y		; F3 CF
	lda [$0D.b],Y		; B7 0D
.INDEX 16
	rep #$1A		; C2 1A
	txs		; 9A
	inx		; E8
	lda ($DE.b)		; B2 DE
	mvn $C4,$61		; 54 61 C4
	eor $07.b		; 45 07
	cmp $47.b,X		; D5 47
	lda $AB6DA1.l		; AF A1 6D AB
	dec A		; 3A
	and $B5.b		; 25 B5
	eor $AA.b		; 45 AA
	tay		; A8
	adc ($F4.b),Y		; 71 F4
	cmp ($76.b)		; D2 76
	and $D8.b,X		; 35 D8
	lda $9B.b,X		; B5 9B
	sbc ($BE.b,S),Y		; F3 BE
	tsx		; BA
	ora #$D121.w		; 09 21 D1
	bpl -31.b		; 10 E1
	and $A05231.l		; 2F 31 52 A0
	ora $2E71.w,Y		; 19 71 2E
	ora [$88.b],Y		; 17 88
	and ($0E.b,X)		; 21 0E
	tas		; 1B
	bcc -25.b		; 90 E7
	lda #$61C9.w		; A9 C9 61
	cpy $80DC.w		; CC DC 80
	eor ($D8.b),Y		; 51 D8
	brk $5A.b		; 00 5A
	tda		; 7B
	ora ($14.b)		; 12 14
	asl $FA.b,X		; 16 FA
	stz $E0FB.w,X		; 9E FB E0
	and ($7F.b),Y		; 31 7F
	eor [$FD.b],Y		; 57 FD
	cmp #$E961.w		; C9 61 E9
	jmp ($1C32.w,X)		; 7C 32 1C
	mvp $C1,$30		; 44 30 C1
	bit #$9295.w		; 89 95 92
	sed		; F8
	plx		; FA
	sbc ($FB.b)		; F2 FB
	cld		; D8
	ror $71A7.w		; 6E A7 71
	jsr ($9C18.w,X)		; FC 18 9C
	lda $F6CE.w,X		; BD CE F6
	eor $F3DD51.l,X		; 5F 51 DD F3
	adc [$1F.b]		; 67 1F
	nop		; EA
	cmp ($89.b,X)		; C1 89
	ldx $F8.b		; A6 F8
	and ($3A.b,X)		; 21 3A
	cmp $9F1456.l		; CF 56 14 9F
	php		; 08
	and ($7B.b),Y		; 31 7B
	stx $CB9F.w		; 8E 9F CB
	tsa		; 3B
	dec $D57D.w,X		; DE 7D D5
	eor ($83.b,S),Y		; 53 83
	ora [$FE.b],Y		; 17 FE
	eor [$BE.b],Y		; 57 BE
	sbc [$B6.b],Y		; F7 B6
	and ($FD.b,S),Y		; 33 FD
	pla		; 68
	mvp $03,$1B		; 44 1B 03
	ora ($37.b,S),Y		; 13 37
	ora ($35.b),Y		; 11 35
	tsx		; BA
	adc ($C4.b)		; 72 C4
	iny		; C8
.INDEX 8
	sep #$DE		; E2 DE
	tsa		; 3B
	sta $13.b,S		; 83 13
	cmp $85.b,X		; D5 85
	stx $EA.b		; 86 EA
	sec		; 38
	lda ($AD.b,S),Y		; B3 AD
	sbc [$B7.b],Y		; F7 B7
	jmp ($62A0.w,X)		; 7C A0 62
	ror $22.b		; 66 22
	cmp $8EF73B.l,X		; DF 3B F7 8E
	sbc ($CA.b)		; F2 CA
	tay		; A8
	adc $E0.b,X		; 75 E0
	cpy $CF.b		; C4 CF
	cpx $FB5F.w		; EC 5F FB
	sta $418BEE.l,X		; 9F EE 8B 41
	adc [$59.b]		; 67 59
	ldx $45.b		; A6 45
	jsr $EB00.w		; 20 00 EB
	jsr ($B976.w,X)		; FC 76 B9
	inc $E10F.w		; EE 0F E1
	phx		; DA
	sta ($F7.b,X)		; 81 F7
	jmp ($740C.w,X)		; 7C 0C 74
	rts		; 60

	ora ($78.b,X)		; 01 78
	inc $C7CD.w		; EE CD C7
	lda [$01.b],Y		; B7 01
	cmp ($DA.b,S),Y		; D3 DA
	jmp $F62766.l		; 5C 66 27 F6
	jsr $AA00.w		; 20 00 AA
	phy		; 5A
	tas		; 1B
	tay		; A8
	eor ($74.b,X)		; 41 74
	sbc ($AB.b),Y		; F1 AB
	lda $D8.b		; A5 D8
	cmp $03A0D4.l		; CF D4 A0 03
	sta $4D.b,S		; 83 4D
	cmp $298737.l		; CF 37 87 29
	ldy $F2.b		; A4 F2
	jmp $1ADCE5.l		; 5C E5 DC 1A
	adc ($63.b)		; 72 63
	brk $FA.b		; 00 FA
	sbc $66671D.l,X		; FF 1D 67 66
	sbc $31.b,S		; E3 31
	cld		; D8
	sed		; F8
	lda $EE7B.w,X		; BD 7B EE
	stx $DF.b		; 86 DF
	clv		; B8
	inc $CF06.w,X		; FE 06 CF
	inc $D5.b,X		; F6 D5
	eor ($FD.b,S),Y		; 53 FD
	dex		; CA
	dec $5C7C.w,X		; DE 7C 5C
	pla		; 68
	dec $26B4.w,X		; DE B4 26
	jmp $3CF0.w		; 4C F0 3C
	txs		; 9A
	eor $950D.w		; 4D 0D 95
	dec $E35B.w,X		; DE 5B E3
	xba		; EB
	cmp ($EA.b)		; D2 EA
	sed		; F8
	txa		; 8A
	sbc $94.b,X		; F5 94
	cpy #$6C.b		; C0 6C
	lda $64B17F.l,X		; BF 7F B1 64
	adc [$26.b]		; 67 26
	.db $62, $2E, $AB		; 62 2E AB
	lsr $4C0C.w		; 4E 0C 4C
	adc $393A19.l		; 6F 19 3A 39
	cmp ($B8.b,S),Y		; D3 B8
	cmp ($BA.b),Y		; D1 BA
	rol $20.b,X		; 36 20
	cpy $E8.b		; C4 E8
	bit $38F2.w		; 2C F2 38
	ldy $14.b		; A4 14
	plx		; FA
	lda $186C3E.l		; AF 3E 6C 18
	sta $0585.w,X		; 9D 85 05
	sbc $BC.b,S		; E3 BC
	ora $E47B6A.l		; 0F 6A 7B E4
	bit #$0C5C.w		; 89 5C 0C
	eor $B977.w		; 4D 77 B9
	cmp $93.b,S		; C3 93
	sta [$DE.b],Y		; 97 DE
	bne 108.b		; D0 6C
	rol $667E.w,X		; 3E 7E 66
	php		; 08
	and ($19.b),Y		; 31 19
	stx $F3.b,Y		; 96 F3
	sbc ($7F.b)		; F2 7F
	xce		; FB
	jmp $E36492.l		; 5C 92 64 E3
	dec A		; 3A
	tsb $BE45.w		; 0C 45 BE
	adc ($07.b)		; 72 07
	cmp ($4B.b,X)		; C1 4B
	lda ($4E.b)		; B2 4E
	php		; 08
	rol $88C1.w		; 2E C1 88
	ldy $A677.w,X		; BC 77 A6
	eor $E8B6.w,Y		; 59 B6 E8
	sbc $B807.w		; ED 07 B8
	tsa		; 3B
	sta ($00.b,X)		; 81 00
	asl $FC.b		; 06 FC
	inc $3838.w		; EE 38 38
	cmp $D220.w,X		; DD 20 D2
	ora $8045B0.l		; 0F B0 45 80
	and $066A96.l,X		; 3F 96 6A 06
	sei		; 78
	eor $0F.b,S		; 43 0F
	stz $76.b,X		; 74 76
	cpy $00.b		; C4 00
	ora $1C.b,S		; 03 1C
	lsr A		; 4A
	sbc $BE.b,X		; F5 BE
	bne 125.b		; D0 7D
	clc		; 18
	sbc ($91.b,X)		; E1 91
	ora ($C0.b,S),Y		; 13 C0
	asl $58.b		; 06 58
	inc $6E.b,X		; F6 6E
	dec A		; 3A
	sta ($F7.b,X)		; 81 F7
	sta $61.b		; 85 61
	cpx #$52.b		; E0 52
	brk $2C.b		; 00 2C
	ldy $52.b,X		; B4 52
	lda $C2.b,S		; A3 C2
	and ($62.b,S),Y		; 33 62
	rts		; 60

	lsr $02.b,X		; 56 02
	bra  35.b		; 80 23
	sed		; F8
	sbc ($47.b)		; F2 47
	nop		; EA
	.db $82, $22, $BC		; 82 22 BC
	adc #$4042.w		; 69 42 40
	lda $7C.b,S		; A3 7C
	dec A		; 3A
	brk $A2.b		; 00 A2
	bit $8A57.w		; 2C 57 8A
	bra -120.b		; 80 88
	cop $60.b		; 02 60
	eor $A2C086.l		; 4F 86 C0 A2
	ldy #$57.b		; A0 57
	txa		; 8A
	beq   5.b		; F0 05
	eor $86.b		; 45 86
	and [$F1.b],Y		; 37 F1
	and [$7D.b]		; 27 7D
	cmp $830D.w,Y		; D9 0D 83
	ora ($26.b),Y		; 11 26
	brk $E2.b		; 00 E2
	eor #$7345.w		; 49 45 73
	and [$23.b]		; 27 23
	ldy $E207.w		; AC 07 E2
	ora $3A0007.l		; 0F 07 00 3A
	beq -65.b		; F0 BF
	jmp ($0DA7.w,X)		; 7C A7 0D
	ora [$A1.b],Y		; 17 A1
	sty $0519.w		; 8C 19 05
	cpx #$0B.b		; E0 0B
	dec $3C.b,X		; D6 3C
	lda $4A.b,X		; B5 4A
	eor $012D64.l		; 4F 64 2D 01
	cmp $C0.b,S		; C3 C0
	brk $76.b		; 00 76
	ora ($26.b,X)		; 01 26
	adc [$3D.b]		; 67 3D
	bit $AC.b		; 24 AC
	rol $00.b,X		; 36 00
	inc A		; 1A
	bmi 112.b		; 30 70
	stz $6C.b,X		; 74 6C
	sed		; F8
	iny		; C8
	rol $88A4.w,X		; 3E A4 88
	ora ($78.b,X)		; 01 78
	ror $08.b		; 66 08
	mvp $4E,$C4		; 44 C4 4E
	xba		; EB
	tsb $9B.b		; 04 9B
	sbc $6040.w,X		; FD 40 60
	eor ($C5.b),Y		; 51 C5
	cpy $2B10.w		; CC 10 2B
	adc $CBF86C.l		; 6F 6C F8 CB
	and ($77.b,X)		; 21 77
	bmi -23.b		; 30 E9
	sta $D0.b		; 85 D0
	stp		; DB
	dec $B4EC.w		; CE EC B4
.ACCU 8
.INDEX 8
	sep #$36		; E2 36
	lda [$9B.b],Y		; B7 9B
	lda $DBA1.w,Y		; B9 A1 DB
	dec $C7.b,X		; D6 C7
	lda $8A74D6.l		; AF D6 74 8A
	eor ($44.b),Y		; 51 44
	eor $FB.b,X		; 55 FB
	tas		; 1B
	inc $5703.w,X		; FE 03 57
	cmp $FE7CF0.l		; CF F0 7C FE
	and $4649C3.l		; 2F C3 49 46
	rol $63.b,X		; 36 63
	sta $33.b		; 85 33
	jmp $C4ABF8.l		; 5C F8 AB C4
	beq -56.b		; F0 C8
	stz $5A.b,X		; 74 5A
	sec		; 38
	sbc [$82.b]		; E7 82
	ldx $2CBB.w,Y		; BE BB 2C
	ply		; 7A
	tsa		; 3B
	sta $222E.w,Y		; 99 2E 22
	sbc $D67C.w,X		; FD 7C D6
	inx		; E8
	sbc [$98.b]		; E7 98
	jmp.w [$E406]		; DC 06 E4
	txs		; 9A
	sta ($A6.b),Y		; 91 A6
	and $A4D5.w,X		; 3D D5 A4
	ldy $FD.b		; A4 FD
	cmp $9D94.w		; CD 94 9D
	adc $A3.b,S		; 63 A3
	stz $A0.b		; 64 A0
	and ($A4.b,S),Y		; 33 A4
	cmp ($25.b,X)		; C1 25
	adc #$23.b		; 69 23
	and $98.b		; 25 98
	inc $3CF2.w,X		; FE F2 3C
	sbc $B6A1.w		; ED A1 B6
	lda [$CE.b]		; A7 CE
	php		; 08
	adc ($38.b),Y		; 71 38
	and ($C4.b,X)		; 21 C4
	cpx #$87.b		; E0 87
	ora ($82.b,S),Y		; 13 82
	trb $2019.w		; 1C 19 20
	.db $42, $FB		; 42 FB
	brk $10.b		; 00 10
	asl $66.b		; 06 66
	brk $10.b		; 00 10
	asl $02.b		; 06 02
	clc		; 18
	ora $00.b		; 05 00
	brk $06.b		; 00 06
	ora ($24.b,X)		; 01 24
	ora [$06.b]		; 07 06
	asl $08.b		; 06 08
	ora $05.b		; 05 05
	ora #$07.b		; 09 07
	ora [$0A.b]		; 07 0A
	ora ($04.b,X)		; 01 04
	phd		; 0B
	php		; 08
	php		; 08
	tsb $0A0A.w		; 0C 0A 0A
	ora $0909.w		; 0D 09 09
	asl $0C0C.w		; 0E 0C 0C
	ora $100B0B.l		; 0F 0B 0B 10
	ora $110D.w		; 0D 0D 11
	asl $120E.w		; 0E 0E 12
	ora $11130F.l		; 0F 0F 13 11
	ora ($14.b),Y		; 11 14
	bpl  16.b		; 10 10
	ora $12.b,X		; 15 12
	ora ($16.b)		; 12 16
	ora ($13.b,S),Y		; 13 13
	ora [$14.b],Y		; 17 14
	ora $18.b,X		; 15 18
	ora [$17.b],Y		; 17 17
	ora $1614.w,Y		; 19 14 16
	inc A		; 1A
	ora $1B19.w,Y		; 19 19 1B
	clc		; 18
	clc		; 18
	trb $1A1A.w		; 1C 1A 1A
	rti		; 40

	brk $20.b		; 00 20
	brk $04.b		; 00 04
	ora $15.b,S		; 03 15
	tas		; 1B
	tas		; 1B
	clc		; 18
	trb $1C1C.w		; 1C 1C 1C
	ora $1B1B.w,Y		; 19 1B 1B
	bpl  13.b		; 10 0D
	ora #$07.b		; 09 07
	asl $01.b		; 06 01
	cop $24.b		; 02 24
	brk $26.b		; 00 26
	xce		; FB
	brk $00.b		; 00 00
	bmi   3.b		; 30 03
	inc A		; 1A
	brk $DD.b		; 00 DD
	jsr $1410.w		; 20 10 14
	eor $DBB689.l		; 4F 89 B6 DB
	adc $42D2.w		; 6D D2 42
	xce		; FB
	brk $10.b		; 00 10
	asl $83.b		; 06 83
	brk $10.b		; 00 10
	asl $01.b		; 06 01
	clc		; 18
	cop $D0.b		; 02 D0
	and ($04.b,X)		; 21 04
	cop $02.b		; 02 02
	ora $04.b		; 05 04
	tsb $06.b		; 04 06
	cmp ($35.b),Y		; D1 35
	ora [$06.b]		; 07 06
	asl $09.b		; 06 09
	ora $05.b		; 05 05
	asl A		; 0A
	ora [$07.b]		; 07 07
	phd		; 0B
	ora #$09.b		; 09 09
	tsb $0A0A.w		; 0C 0A 0A
	ora $0B0B.w		; 0D 0B 0B
	asl $0C0C.w		; 0E 0C 0C
	ora $100D0D.l		; 0F 0D 0D 10
	ora $110E.w		; 0D 0E 11
	asl A		; 0A
	ora [$12.b]		; 07 12
	ora $0C130F.l		; 0F 0F 13 0C
	ora ($14.b),Y		; 11 14
	bpl  14.b		; 10 0E
	ora $0D.b,X		; 15 0D
	cop $16.b		; 02 16
	trb $14.b		; 14 14
	ora [$0E.b],Y		; 17 0E
	ora ($18.b,S),Y		; 13 18
	and $15.b,X		; 35 15
	ora $1212.w,Y		; 19 12 12
	inc A		; 1A
	clc		; 18
	ora [$1B.b],Y		; 17 1B
	asl $16.b,X		; 16 16
	rti		; 40

	brk $20.b		; 00 20
	brk $08.b		; 00 08
	ora $17.b,S		; 03 17
	cmp ($1A.b,S),Y		; D3 1A
	pei ($1A.b)		; D4 1A
	cmp $1A.b,X		; D5 1A
	dec $1A.b,X		; D6 1A
	cmp [$1A.b],Y		; D7 1A
	cld		; D8
	inc A		; 1A
	cmp $DA35.w,Y		; D9 35 DA
	and $10.b,X		; 35 10
	ora ($06.b,S),Y		; 13 06
	stp		; DB
	and $10.b,X		; 35 10
	ora ($06.b,S),Y		; 13 06
	jmp.w [$1035]		; DC 35 10
	ora ($06.b,S),Y		; 13 06
	cmp $1935.w,X		; DD 35 19
	ora ($1B.b)		; 12 1B
	tas		; 1B
	asl $19.b,X		; 16 19
	ora ($0B.b)		; 12 0B
	ora #$05.b		; 09 05
	tsb $02.b		; 04 02
	bne   1.b		; D0 01
	and ($00.b,X)		; 21 00
	rol $FB.b		; 26 FB
	brk $01.b		; 00 01
	cpy #$04.b		; C0 04
	ora $88.b,S		; 03 88
	ora $65.b,S		; 03 65
	.db $42, $20		; 42 20
	jsr $06C1.w		; 20 C1 06
	asl $F813.w		; 0E 13 F8
	clc		; 18
	and $25.b,S		; 23 25
	lda ($42.b,X)		; A1 42
	and $5A6B.w,X		; 3D 6B 5A
	dec $B5.b,X		; D6 B5
	tax		; AA
	and $11.b,X		; 35 11
	ora ($14.b),Y		; 11 14
	eor ($22.b)		; 52 22
	jsl $8A2222.l		; 22 22 22 8A
	mvp $09,$45		; 44 45 09
	jsl $288E23.l		; 22 23 8E 28
	lda [$1C.b]		; A7 1C
	adc ($6B.b),Y		; 71 6B
	phy		; 5A
	dec $A2.b,X		; D6 A2
	stx $B5.b,Y		; 96 B5
	lda $BA6E.w		; AD 6E BA
	nop		; EA
	txa		; 8A
	adc $E7.b,X		; 75 E7
	sta $8C75.w,X		; 9D 75 8C
	.db $62, $8A, $7D		; 62 8A 7D
	sbc [$D8.b],Y		; F7 D8
	cmp [$DA.b]		; C7 DA
	cmp $08.b,X		; D5 08
	ldx #$8A.b		; A2 8A
	eor [$1C.b]		; 47 1C
	adc ($6B.b),Y		; 71 6B
	phy		; 5A
	pei ($52.b)		; D4 52
	dec $B5.b,X		; D6 B5
	tsx		; BA
	sbc ($CF.b,S),Y		; F3 CF
	plp		; 28
	lda [$98.b]		; A7 98
	dec $31.b		; C6 31
	sta $8A44B5.l		; 8F B5 44 8A
	bcc   0.b		; 90 00
	brk $08.b		; 00 08
	brk $A0.b		; 00 A0
	cop $A0.b		; 02 A0
	lsr $15.b,X		; 56 15
	brk $15.b		; 00 15
	mvn $01,$55		; 54 55 01
	lda $56.b,X		; B5 56
	lsr A		; 4A
	and #$4A.b		; 29 4A
	adc $2BEA.w,X		; 7D EA 2B
	nop		; EA
	adc $5F295F.l,X		; 7F 5F 29 5F
	adc $2BFF.w,X		; 7D FF 2B
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	tda		; 7B
	adc $186739.l		; 6F 39 67 18
	adc $D6.b,S		; 63 D6
	phy		; 5A
	sty $52.b,X		; 94 52
	adc ($4E.b,S),Y		; 73 4E
	and ($46.b),Y		; 31 46
	sbc $39CE3D.l		; EF 3D CE 39
	sty $4A31.w		; 8C 31 4A
	and #$29.b		; 29 29
	and $E7.b		; 25 E7
	trb $14A5.w		; 1C A5 14
	sty $10.b		; 84 10
	adc $5EFF6F.l,X		; 7F 6F FF 5E
	adc $3DFF4E.l,X		; 7F 4E FF 3D
	adc $211F2D.l,X		; 7F 2D 1F 21
	sta $001F10.l,X		; 9F 10 1F 00
	trb $1900.w		; 1C 00 19
	brk $16.b		; 00 16
	brk $13.b		; 00 13
	brk $10.b		; 00 10
	brk $0E.b		; 00 0E
	brk $0B.b		; 00 0B
	brk $08.b		; 00 08
	brk $BF.b		; 00 BF
	adc $5F637F.l		; 6F 7F 63 5F
	eor [$3F.b],Y		; 57 3F
	phk		; 4B
	ora $36FF43.l,X		; 1F 43 FF 36
	lda $1E9F2A.l,X		; BF 2A 9F 1E
	adc $123C16.l,X		; 7F 16 3C 12
	sed		; F8
	ora $0995.w		; 0D 95 09
	eor ($09.b)		; 52 09
	asl $CB05.w		; 0E 05 CB
	brk $88.b		; 00 88
	brk $FF.b		; 00 FF
	adc $FF0008.l		; 6F 08 00 FF
	eor $FF3FFF.l		; 4F FF 3F FF
	and $DF23DF.l		; 2F DF 23 DF
	ora ($DF.b,S),Y		; 13 DF
	ora $7C.b,S		; 03 7C
	ora $19.b,S		; 03 19
	ora $96.b,S		; 03 96
	cop $33.b		; 02 33
	cop $D0.b		; 02 D0
	ora ($6D.b,X)		; 01 6D
	ora ($0A.b,X)		; 01 0A
	ora ($A8.b,X)		; 01 A8
	brk $FF.b		; 00 FF
	adc $FD5FFE.l		; 6F FE 5F FD
	eor $FA3FFC.l		; 4F FC 3F FA
	and $F623F8.l		; 2F F8 23 F6
	ora ($F4.b,S),Y		; 13 F4
	ora $92.b,S		; 03 92
	ora $30.b,S		; 03 30
	ora $CE.b,S		; 03 CE
	cop $6C.b		; 02 6C
	cop $0A.b		; 02 0A
	cop $C8.b		; 02 C8
	ora ($66.b,X)		; 01 66
	ora ($05.b,X)		; 01 05
	ora ($FB.b,X)		; 01 FB
	adc $B24FF3.l		; 6F F3 4F B2
	phk		; 4B
	bcc  67.b		; 90 43
	eor $370E3F.l		; 4F 3F 0E 37
	cpx $AB32.w		; EC 32 AB
	rol $266A.w		; 2E 6A 26
	pha		; 48
	jsl $C51A07.l		; 22 07 1A C5
	ora $A4.b,X		; 15 A4
	ora ($63.b),Y		; 11 63
	ora #$21.b		; 09 21
	ora $00.b		; 05 00
	ora ($FB.b,X)		; 01 FB
	adc $F37FF7.l,X		; 7F F7 7F F3
	adc $EB7FEF.l,X		; 7F EF 7F EB
	adc $E47FE8.l,X		; 7F E8 7F E4
	adc $807FE0.l,X		; 7F E0 7F 80
	adc ($20.b,S),Y		; 73 20
	adc [$C0.b]		; 67 C0
	phy		; 5A
	rts		; 60

	lsr NMITIMEN.w		; 4E 00 42
	cpy #$39.b		; C0 39
	rts		; 60

	and $2100.w		; 2D 00 21
	rol $FB.b		; 26 FB
	brk $59.b		; 00 59
	jsr $0004.w		; 20 04 00
	phd		; 0B
	bit $8D.b		; 24 8D
	and ($48.b,S),Y		; 33 48
	.db $82, $15, $E7		; 82 15 E7
	cpy $A1.b		; C4 A1
	sec		; 38
	ror $21.b		; 66 21
	stz $02.b,X		; 74 02
	ora $83.b		; 05 83
	sed		; F8
	mvp $32,$08		; 44 08 32
	adc $93.b,X		; 75 93
	ora ($C0.b),Y		; 11 C0
	sty $18.b		; 84 18
	bit #$AF.b		; 89 AF
	stx $50.b		; 86 50
	pha		; 48
	sbc $12.b		; E5 12
	rol $08.b		; 26 08
	cmp ($11.b),Y		; D1 11
	plp		; 28
	cmp #$7D.b		; C9 7D
	eor $199138.l,X		; 5F 38 91 19
	and $FB.b		; 25 FB
	and $4A3159.l		; 2F 59 31 4A
	cmp #$DE.b		; C9 DE
	plb		; AB
	cpx $88.b		; E4 88
	tax		; AA
	lda $C8EE.w,Y		; B9 EE C8
	and [$F9.b]		; 27 F9
	ora [$47.b],Y		; 17 47
	trb $974A.w		; 1C 4A 97
	ply		; 7A
	bcc -108.b		; 90 94
	jsl $922CC9.l		; 22 C9 2C 92
	phk		; 4B
	jmp ($4C92.w,X)		; 7C 92 4C
	phb		; 8B
	ldy $B2.b		; A4 B2
	eor $BE2F.w,X		; 5D 2F BE
	and #$2E.b		; 29 2E
	tsx		; BA
	pla		; 68
	.db $82, $33, $F9		; 82 33 F9
	bit $4BF2.w		; 2C F2 4B
	bit $92.b		; 24 92
	phk		; 4B
	ora ($A5.b),Y		; 11 A5
	lda ($49.b)		; B2 49
	rol $D99A.w		; 2E 9A D9
	bit $49D2.w		; 2C D2 49
	bit $92.b,X		; 34 92
	and $5F.b,S		; 23 5F
	bit $92.b		; 24 92
	cmp $5627.w,Y		; D9 27 56
	stx $CB.b,Y		; 96 CB
	rol $44.b		; 26 44
	dec $C9.b,X		; D6 C9
	rol $D2.b		; 26 D2
	eor #$35.b		; 49 35
	lda ($49.b)		; B2 49
	stz $DA.b		; 64 DA
	eor $9A6C.w,Y		; 59 6C 9A
	cmp #$66.b		; C9 66
	stx $81.b		; 86 81
	inc A		; 1A
	jsl $262222.l		; 22 22 22 26
	.db $82, $88, $88		; 82 88 88
	dey		; 88
	bit #$99.b		; 89 99
	ldy #$94.b		; A0 94
	tsb $44.b		; 04 44
	mvp $89,$44		; 44 44 89
	ldy #$95.b		; A0 95
.ACCU 8
	sep #$22		; E2 22
	jsl $E37C22.l		; 22 22 7C E3
	eor ($2F.b,X)		; 41 2F
	lsr $6D.b,X		; 56 6D
	txy		; 9B
	ror $62.b		; 66 62
	rol $D9.b		; 26 D9
	tya		; 98
	txs		; 9A
	lsr $91.b		; 46 91
	brk $03.b		; 00 03
	pha		; 48
	bra  26.b		; 80 1A
	sbc [$44.b]		; E7 44
	sbc $F963.w,X		; FD 63 F9
	ora $193EE9.l		; 0F E9 3E 19
	xce		; FB
	.db $42, $5C		; 42 5C
	ror $F7CF.w		; 6E CF F7
	ora $697EA4.l,X		; 1F A4 7E 69
	sbc $FBC7.w,Y		; F9 C7 FB
	brk $D7.b		; 00 D7
	rol $F249.w,X		; 3E 49 F2
	asl $EFF0.w		; 0E F0 EF
	eor $917C90.l		; 4F 90 7C 91
	rol $283F.w		; 2E 3F 28
	sbc $C7.b,X		; F5 C7
	bcs  61.b		; B0 3D
	adc #$EB.b		; 69 EB
	sta $6702CA.l		; 8F CA 02 67
	inc $900F.w,X		; FE 0F 90
	jmp ($E7E3.w,X)		; 7C E3 E7
	ora $09E620.l,X		; 1F 20 E6 09
	eor ($E9.b,X)		; 41 E9
	eor $B37A5C.l		; 4F 5C 7A B3
	cmp $9E.b,X		; D5 9E
	clv		; B8
	dec $03.b,X		; D6 03
	bvs -18.b		; 70 EE
	ora $33C3.w		; 0D C3 33
	bvs -36.b		; 70 DC
	tsa		; 3B
	sta ($29.b,X)		; 81 29
	tsa		; 3B
	sta ($92.b)		; 92 92
	ora $25.b		; 05 25
	and [$72.b]		; 27 72
	asl $C1.b		; 06 C1
	sbc $CF.b,X		; F5 CF
	jsr ($989E.w,X)		; FC 9E 98
	sbc $E4B3.w,X		; FD B3 E4
	ora $534D5C.l,X		; 1F 5C 4D 53
	bne -97.b		; D0 9F
	sty $7D.b		; 84 7D
	and $DD.b,S		; 23 DD
	stz $F4B8.w,X		; 9E B8 F4
	jsr $D327.w		; 20 27 D3
	rol $FF39.w,X		; 3E 39 FF
	adc $E3.b,S		; 63 E3
	sta $22FA1C.l,X		; 9F 1C FA 22
	ora [$A4.b]		; 07 A4
	and $73FC2C.l,X		; 3F 2C FC 73
	sbc ($CF.b)		; F2 CF
	wai		; CB
	and $1F40.w,X		; 3D 40 1F
	bit $F5.b,X		; 34 F5
	eor [$CD.b]		; 47 CD
	rol $F369.w,X		; 3E 69 F3
	eor $04709A.l		; 4F 9A 70 04
	cpx $9E8F.w		; EC 8F 9E
	ror $47.b,X		; 76 47
	stz $76.b		; 64 76
	eor [$64.b]		; 47 64
	adc [$C0.b],Y		; 77 C0
	jmp ($331D.w)		; 6C 1D 33
	dex		; CA
	bit $CAA3.w,X		; 3C A3 CA
	and $817AF2.l,X		; 3F F2 7A 81
	and $4D.b,X		; 35 4D
	cmp ($E5.b),Y		; D1 E5
	sta $63792C.l		; 8F 2C 79 63
	beq -113.b		; F0 8F
	ldx #$02.b		; A2 02
	sei		; 78
	adc [$86.b]		; 67 86
	sei		; 78
	adc [$86.b]		; 67 86
	sei		; 78
	adc [$38.b]		; 67 38
	rti		; 40

	sbc ($E7.b,S),Y		; F3 E7
	sta $E7F93C.l,X		; 9F 3C F9 E7
	cmp $806F3E.l		; CF 3E 6F 80
	eor $493DCC.l		; 4F CC 3D 49
	cpy $22.b		; C4 22
	tda		; 7B
	sta $88.b,S		; 83 88
	jsr $537C.w		; 20 7C 53
	inx		; E8
	trb $F372.w		; 1C 72 F3
	jmp.w [$709C]		; DC 9C 70
	ora ($9E.b,S),Y		; 13 9E
	ror $A7.b,X		; 76 A7
	ror $C776.w,X		; 7E 76 C7
	ror A		; 6A
	adc ($C4.b,S),Y		; 73 C4
	ora $EFE9.w		; 0D E9 EF
	dec $F7C4.w		; CE C4 F7
	cmp [$BF.b]		; C7 BF
	and [$A0.b],Y		; 37 A0
	jsl $232222.l		; 22 22 22 23
	adc #$A0.b		; 69 A0
	sta $A2B6.w		; 8D B6 A2
	jsl $9A2222.l		; 22 22 22 9A
	php		; 08
	tax		; AA
	bit $34.b,X		; 34 34
	bmi  97.b		; 30 61
	sec		; 38
	lsr BG1HOFS.w		; 4E 0D 21
	lsr $8F.b		; 46 8F
	jmp $8529.w		; 4C 29 85
	bmi -90.b		; 30 A6
	bpl -91.b		; 10 A5
	eor $71.b,X		; 55 71
	adc $6F19.w,Y		; 79 19 6F
	sbc $B472.w,Y		; F9 72 B4
	stz $88.b		; 64 88
	sta $5B59.w		; 8D 59 5B
	bit $49.b		; 24 49
	cmp $C756.w		; CD 56 C7
	sta [$6F.b],Y		; 97 6F
	tay		; A8
	sbc $EE.b		; E5 EE
	tsx		; BA
	stz $4E.b,X		; 74 4E
	sta $26CA.w,X		; 9D CA 26
	and $2B.b,S		; 23 2B
	adc ($AA.b)		; 72 AA
	stz $20.b,X		; 74 20
	ora $F7.b		; 05 F7
	sbc ($86.b,X)		; E1 86
	adc $C5AA.w,Y		; 79 AA C5
	ora ($BE.b),Y		; 11 BE
	bit $571E.w,X		; 3C 1E 57
	adc $DF.b,S		; 63 DF
	cmp $9885.w,Y		; D9 85 98
	eor [$89.b],Y		; 57 89
	lda ($75.b,X)		; A1 75
	dec $AA.b,X		; D6 AA
	ldx #$22.b		; A2 22
	and $E2.b,X		; 35 E2
	dey		; 88
	bra  22.b		; 80 16
	cli		; 58
	plb		; AB
	phb		; 8B
	wai		; CB
	wai		; CB
	sed		; F8
	sbc $36C2.w,Y		; F9 C2 36
	rts		; 60

	dey		; 88
	dey		; 88
	sta ($9E.b,X)		; 81 9E
	ror A		; 6A
	bcs  71.b		; B0 47
	rol A		; 2A
	tax		; AA
	iny		; C8
	adc ($82.b,S),Y		; 73 82
	jsl $052022.l		; 22 22 20 05
	sbc [$E1.b],Y		; F7 E1
	stx $38.b		; 86 38
	sbc [$9C.b]		; E7 9C
	tad		; 5B
	eor ($1B.b),Y		; 51 1B
	sbc $85.b,S		; E3 85
	tya		; 98
	cmp [$9C.b],Y		; D7 9C
	ora ($34.b),Y		; 11 34
	and ($8A.b)		; 32 8A
	pld		; 2B
	lda $4454.w		; AD 54 44
	lsr $89.b		; 46 89
	cmp [$8A.b],Y		; D7 8A
	jsr $7505.w		; 20 05 75
	dec $2A.b		; C6 2A
	lda $22B9.w,Y		; B9 B9 22
	and $E3.b,X		; 35 E3
	tas		; 1B
	sbc ($AB.b)		; F2 AB
	phd		; 0B
	and $07338C.l		; 2F 8C 33 07
	ora [$C8.b],Y		; 17 C8
	jmp ($EF97.w,X)		; 7C 97 EF
	cmp [$F7.b],Y		; D7 F7
	xba		; EB
	sbc ($2B.b)		; F2 2B
	cpy $5A.b		; C4 5A
	sbc [$3C.b],Y		; F7 3C
	cmp $4FFDFD.l		; CF FD FD 4F
	sta [$EA.b],Y		; 97 EA
	adc $A77E.w,Y		; 79 7E A7
	adc ($FE.b),Y		; 71 FE
	dec $B0.b,X		; D6 B0
	eor [$D0.b]		; 47 D0
	lda $DBFEA0.l,X		; BF A0 FE DB
	sbc $B3CF.w,Y		; F9 CF B3
	eor ($5F.b,X)		; 41 5F
	lda $2DFCA2.l		; AF A2 FC 2D
	ora [$DD.b],Y		; 17 DD
	inx		; E8
	lda $F8450F.l,X		; BF 0F 45 F8
	dec A		; 3A
	rol A		; 2A
	sta $75.b		; 85 75
	stp		; DB
	ror A		; 6A
	tax		; AA
	cpx $726C.w		; EC 6C 72
	adc $5E23.w,Y		; 79 23 5E
	rol $C9.b,X		; 36 C9
	and [$46.b]		; 27 46
	eor $6A.b,X		; 55 6A
	cpx $B970.w		; EC 70 B9
	rol $CD86.w		; 2E 86 CD
	jmp.w [$4E9F]		; DC 9F 4E
	adc $8D55.w,Y		; 79 55 8D
	sei		; 78
	eor $447C.w,Y		; 59 7C 44
	pla		; 68
	sta $E813.w,X		; 9D 13 E8
	sbc [$CF.b]		; E7 CF
	wai		; CB
	sbc #$ED.b		; E9 ED
	adc $7F3B1F.l,X		; 7F 1F 3B 7F
	wai		; CB
	sbc ($72.b,X)		; E1 72
	bvs -78.b		; 70 B2
	lsr $C3.b,X		; 56 C3
	dec A		; 3A
	lda ($AF.b)		; B2 AF
	tas		; 1B
	bmi -74.b		; 30 B6
	eor ($BD.b),Y		; 51 BD
	bpl  68.b		; 10 44
	lsr $86.b		; 46 86
	lda #$D7.b		; A9 D7
	tsa		; 3B
	and [$23.b],Y		; 37 23
	ply		; 7A
	jsl $582222.l		; 22 22 22 58
	stp		; DB
	pei ($8E.b)		; D4 8E
	stp		; DB
	and $7E.b,X		; 35 7E
	eor ($B0.b,S),Y		; 53 B0
	xce		; FB
	pei ($44.b)		; D4 44
	mvp $46,$44		; 44 44 46
	adc $877BDE.l		; 6F DE 7B 87
	adc $DDED.w		; 6D ED DD
	cmp [$F5.b]		; C7 F5
	sta $11.b,X		; 95 11
	ora ($11.b),Y		; 11 11
	ora ($79.b)		; 12 79
	lda $76D955.l,X		; BF 55 D9 76
	cmp $F6.b,X		; D5 F6
	cmp $2777CE.l		; CF CE 77 27
	.db $42, $22		; 42 22
	jsl $6B6422.l		; 22 22 64 6B
	cmp $27EFD2.l,X		; DF D2 EF 27
	plx		; FA
	lda $E895FE.l		; AF FE 95 E8
	plp		; 28
	cmp $9D6B1C.l,X		; DF 1C 6B 9D
	php		; 08
	dey		; 88
	sta ($80.b,X)		; 81 80
	bit #$B1.b		; 89 B1
	ror $74DF.w,X		; 7E DF 74
	sbc $1D5B.w,Y		; F9 5B 1D
	eor ($11.b,X)		; 41 11
	ora $955B.w,Y		; 19 5B 95
	eor #$CA.b		; 49 CA
	cpx #$EE.b		; E0 EE
	cpy #$BC.b		; C0 BC
	mvp $CF,$47		; 44 47 CF
	and $E8BB93.l,X		; 3F 93 BB E8
	dey		; 88
	dey		; 88
	lda $7ED1DA.l		; AF DA D1 7E
	lsr $8A.b,X		; 56 8A
	sbc $EAA02F.l,X		; FF 2F A0 EA
	.db $82, $F3, $21		; 82 F3 21
	asl $720B.w,X		; 1E 0B 72
	ply		; 7A
	ora $3822B0.l		; 0F B0 22 38
	lda $2BD7.w,X		; BD D7 2B
	ldy $76D7.w,X		; BC D7 76
	adc $DC.b,S		; 63 DC
	ror $A3E7.w,X		; 7E E7 A3
	pei ($28.b)		; D4 28
	bit $1211.w		; 2C 11 12
	and [$FE.b],Y		; 37 FE
	sbc [$EE.b]		; E7 EE
	nop		; EA
	jmp ($8888.w)		; 6C 88 88
	lda $F9C7.w,X		; BD C7 F9
	xce		; FB
	jsr $DDD2.w		; 20 D2 DD
	ror $B76E.w		; 6E 6E B7
	and [$5B.b],Y		; 37 5B
	txy		; 9B
	lda $9F741B.l		; AF 1B 74 9F
	sbc [$FF.b]		; E7 FF
	beq  68.b		; F0 44
	mvp $FA,$74		; 44 74 FA
	jmp $BFFD.w		; 4C FD BF
	lda ($FF.b)		; B2 FF
	sbc [$DC.b],Y		; F7 DC
	cmp $F2E52B.l,X		; DF 2B E5 F2
	ldx $C87F.w,Y		; BE 7F C8
	beq  -2.b		; F0 FE
	eor [$86.b]		; 47 86
	stz $DDDF.w,X		; 9E DF DD
	ply		; 7A
	ora $2222AE.l,X		; 1F AE 22 22
	rol $F5C3.w		; 2E C3 F5
	ora $FADB6F.l,X		; 1F 6F DB FA
	cpx #$09.b		; E0 09
	php		; 08
	dey		; 88
	sta $74BF.w,X		; 9D BF 74
	jsl $77FB22.l		; 22 22 FB 77
	lda $497F.w,X		; BD 7F 49
	sbc $7F3C.w		; ED 3C 7F
	cmp ($00.b,S),Y		; D3 00
	mvp $4F,$44		; 44 44 4F
	ora $8B08CD.l,X		; 1F CD 08 8B
	lda ($FC.b)		; B2 FC
	lda [$A2.b],Y		; B7 A2
	sed		; F8
	adc ($ED.b),Y		; 71 ED
	and [$BB.b],Y		; 37 BB
	bne -68.b		; D0 BC
	mvp $8D,$44		; 44 44 8D
	xce		; FB
	dec $8B78.w,X		; DE 78 8B
	ldx $F7.b,Y		; B6 F7
	ora $777CD7.l		; 0F D7 7C 77
	lda $7D.b,X		; B5 7D
	lda $F8FEA6.l		; AF A6 FE F8
	jsl $7A2222.l		; 22 22 22 7A
	adc $492FA4.l		; 6F A4 2F 49
	cmp [$7C.b],Y		; D7 7C
	adc [$DB.b],Y		; 77 DB
	lda $B1EDD2.l,X		; BF D2 ED B1
	cpx #$7E.b		; E0 7E
	and $04.b,S		; 23 04
	mvp $4E,$44		; 44 44 4E
	ora [$7C.b]		; 07 7C
	sta $ECED.w		; 8D ED EC
	sta $3237.w,Y		; 99 37 32
	sta $7EC1.w		; 8D C1 7E
	sta $74A52B.l		; 8F 2B A5 74
	ldx $D795.w		; AE 95 D7
	lsr A		; 4A
	bvs -100.b		; 70 9C
	and [$09.b]		; 27 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	stz $0927.w		; 9C 27 09
.INDEX 16
	rep #$14		; C2 14
.INDEX 16
	rep #$98		; C2 98
	eor ($0A.b,S),Y		; 53 0A
	adc ($4C.b,X)		; 61 4C
	and #$3085.w		; 29 85 30
	bra -120.b		; 80 88
	dey		; 88
	pei ($EF.b)		; D4 EF
	eor $1155.w,X		; 5D 55 11
	plb		; AB
	and $1AEE.w		; 2D EE 1A
	lda ($BA.b)		; B2 BA
	xce		; FB
	cpy #$4444.w		; C0 44 44
	stz $EB.b		; 64 EB
	dec A		; 3A
	ror A		; 6A
	and $2B.b,S		; 23 2B
	adc $AB.b,X		; 75 AB
	cmp ($AB.b,S),Y		; D3 AB
	lsr A		; 4A
	trb $D1.b		; 14 D1
	lsr $BC.b		; 46 BC
	tda		; 7B
	adc $537F.w		; 6D 7F 53
	lda ($F8.b),Y		; B1 F8
	txy		; 9B
	asl $6773.w,X		; 1E 73 67
	cpy $B474.w		; CC 74 B4
	ldx $E9.b,Y		; B6 E9
	jmp.w [$F0E4]		; DC E4 F0
	lda $FE7B.w,Y		; B9 7B FE
	ror $9DF7.w,X		; 7E F7 9D
	ldx $BCC6.w,Y		; BE C6 BC
	tax		; AA
	dec $A213.w		; CE 13 A2
	ror $2B4B.w		; 6E 4B 2B
	jmp ($7F0B.w,X)		; 7C 0B 7F
	lda ($F0.b),Y		; B1 F0
	sta $A4DF0A.l,X		; 9F 0A DF A4
	dey		; 88
	stp		; DB
	cmp ($F4.b)		; D2 F4
	sbc $C50F.w,X		; FD 0F C5
	pea $2F7E.w		; F4 7E 2F
	lda $F1.b,S		; A3 F1
	adc $9537.w,X		; 7D 37 95
	lda $79F0E5.l,X		; BF E5 F0 79
	eor $3FC3.w,Y		; 59 C3 3F
	sep #$CF		; E2 CF
	sbc ($F7.b,S),Y		; F3 F7
	bit $FA39.w,X		; 3C 39 FA
	jsr ($54FB.w,X)		; FC FB 54
	eor [$73.b]		; 47 73
	sbc $34.b,X		; F5 34
	eor $7CD1E8.l,X		; 5F E8 D1 7C
	inc $F18B.w,X		; FE 8B F1
	ldy $5F.b,X		; B4 5F
	adc $8888A2.l,X		; 7F A2 88 88
	stx $ED2E.w		; 8E 2E ED
	lda $44.b		; A5 44
	adc ($AF.b),Y		; 71 AF
	adc [$0A.b],Y		; 77 0A
	pla		; 68
	ldy #$C303.w		; A0 03 C3
	sbc [$1B.b],Y		; F7 1B
	lsr $B593.w,X		; 5E 93 B5
	sbc $1D66.w,Y		; F9 66 1D
	eor $819134.l,X		; 5F 34 91 81
	and $B97B.w		; 2D 7B B9
	txs		; 9A
	jmp.w [$FEBD]		; DC BD FE
	dec $AC.b		; C6 AC
	inx		; E8
	lsr $F8.b		; 46 F8
	jmp.w [$5CE8]		; DC E8 5C
	dec $7824.w,X		; DE 24 78
	eor #$D119.w		; 49 19 D1
	stz $AB32.w		; 9C 32 AB
	phd		; 0B
	asl $F8.b		; 06 F8
	cmp ($3E.b),Y		; D1 3E
	eor [$0F.b]		; 47 0F
	asl $4D.b		; 06 4D
	inx		; E8
	dey		; 88
	bne -46.b		; D0 D2
	cmp $95.b,X		; D5 95
	sei		; 78
	cmp $BD85.w,Y		; D9 85 BD
	sbc [$17.b],Y		; F7 17
	lda $4BCF.w,Y		; B9 CF 4B
	and $753C.w		; 2D 3C 75
	tsb $44.b		; 04 44
	eor [$88.b]		; 47 88
	sbc ($D1.b),Y		; F1 D1
	mvp $9C,$78		; 44 78 9C
	ror $A139.w,X		; 7E 39 A1
	adc $22.b,X		; 75 22
	bit $C4.b		; 24 C4
	tya		; 98
	cmp #$BFBE.w		; C9 BE BF
	asl $B9.b		; 06 B9
	sbc $55D7.w,Y		; F9 D7 55
.INDEX 16
	rep #$DD		; C2 DD
	ror $FCC3.w		; 6E C3 FC
	rol $D08B.w,X		; 3E 8B D0
	cpx $556C.w		; EC 6C 55
	lsr $EF.b,X		; 56 EF
	sta ($45.b,S),Y		; 93 45
	and $44.b		; 25 44
	ora $BD82.w		; 0D 82 BD
	eor $AA8C.w,X		; 5D 8C AA
	sbc ($72.b,X)		; E1 72
	adc [$29.b],Y		; 77 29
	mvp $96,$4E		; 44 4E 96
	sta $793F3B.l,X		; 9F 3B 3F 79
	lda $BF.b,X		; B5 BF
	sbc $CA.b		; E5 CA
	cmp ($11.b),Y		; D1 11
	clc		; 18
	adc [$5E.b]		; 67 5E
	rol $C9.b,X		; 36 C9
	ora ($11.b),Y		; 11 11
	asl $86.b		; 06 86
	ora $6D4D.w		; 0D 4D 6D
	tyx		; BB
	adc ($DC.b),Y		; 71 DC
	mvn $44,$44		; 54 44 44
	mvp $BD,$48		; 44 48 BD
	and [$BD.b]		; 27 BD
	ror $F13B.w,X		; 7E 3B F1
	cmp $77FC8E.l,X		; DF 8E FC 77
	sbc $DECFA9.l		; EF A9 CF DE
	plx		; FA
	and $BFF3ED.l		; 2F ED F3 BF
	adc $BFFDCE.l		; 6F CE FD BF
	tsa		; 3B
	inc $FC.b,X		; F6 FC
	sbc $6FA2DB.l		; EF DB A2 6F
	stx $BA.b		; 86 BA
	sbc ($D7.b,S),Y		; F3 D7
	cmp $5D675F.l		; CF 5F 67 5D
	cmp [$9F.b],Y		; D7 9F
	xce		; FB
	inc $25A2.w,X		; FE A2 25
	lda ($B6.b)		; B2 B6
	lsr $CA.b,X		; 56 CA
	cmp $2E5B.w,Y		; D9 5B 2E
	lda ($C6.b,S),Y		; B3 C6
	jmp ($6E36.w,X)		; 7C 36 6E
	cmp $F2.b,S		; C3 F2
	sta $FD.b,X		; 95 FD
	adc [$6D.b],Y		; 77 6D
.ACCU 8
	sep #$22		; E2 22
	jsl $3D2222.l		; 22 22 22 3D
	xba		; EB
	and [$B8.b],Y		; 37 B8
	jmp ($EFA7.w,X)		; 7C A7 EF
	lda $D2B3.w,X		; BD B3 D2
	ror $D1.b,X		; 76 D1
	ora ($11.b),Y		; 11 11
	ora ($27.b),Y		; 11 27
	ora $4FEC.w,Y		; 19 EC 4F
	lda $3D.b		; A5 3D
	lda $65FD.w,Y		; B9 FD 65
	tda		; 7B
	eor $CE.b,X		; 55 CE
	ora $38C3.w,Y		; 19 C3 38
	adc [$0C.b]		; 67 0C
	sbc ($9C.b,X)		; E1 9C
	and [$44.b]		; 27 44
	inx		; E8
	cld		; D8
	ror $3A.b,X		; 76 3A
	tda		; 7B
	asl $DFC7.w		; 0E C7 DF
	plx		; FA
	sbc $A93F.w,X		; FD 3F A9
	lda $D9.b,X		; B5 D9
	sbc [$F6.b],Y		; F7 F6
	tda		; 7B
	dec $0757.w,X		; DE 57 07
	sta $C1.b,X		; 95 C1
	sbc $70.b		; E5 70
	adc $1F5C.w,Y		; 79 5C 1F
	sbc $A7FE.w,Y		; F9 FE A7
	eor $76E3.w,Y		; 59 E3 76
	adc $0F66D5.l,X		; 7F D5 66 0F
	pla		; 68
	xce		; FB
	and [$D0.b]		; 27 D0
	rol $4E.b		; 26 4E
	inc $C6.b		; E6 C6
	sbc $B8.b,S		; E3 B8
	jsr ($170D.w,X)		; FC 0D 17
	tyx		; BB
	inc $C6FE.w		; EE FE C6
	txa		; 8A
	lda $831B.w,Y		; B9 1B 83
	phk		; 4B
	lsr $FFDF.w		; 4E DF FF
	ora $D69FF8.l		; 0F F8 9F D6
	stz $3CEF.w,X		; 9E EF 3C
	sta $BD95.w,X		; 9D 95 BD
	inc $F91F.w,X		; FE 1F F9
	jmp ($3C78.w)		; 6C 78 3C
	ldx $7CEA.w		; AE EA 7C
	jmp.w [$88E0]		; DC E0 88
	cmp [$6C.b]		; C7 6C
	adc $21F046.l,X		; 7F 46 F0 21
	eor [$2B.b]		; 47 2B
	sta $BF.b,X		; 95 BF
	ldy $61.b,X		; B4 61
	txs		; 9A
	eor $7C8611.l,X		; 5F 11 86 7C
	ldx $BC0D.w		; AE 0D BC
	ldy $7DB2.w,X		; BC B2 7D
	bit $5CF9.w,X		; 3C F9 5C
	eor $BB386F.l,X		; 5F 6F 38 BB
	and ($44.b,S),Y		; 33 44
	adc ($AB.b)		; 72 AB
	sec		; 38
	adc ($38.b),Y		; 71 38
	sbc $1AC1.w,Y		; F9 C1 1A
	and [$30.b]		; 27 30
	sbc $FC0F.w,Y		; F9 0F FC
	adc $0B5C.w,Y		; 79 5C 0B
	adc $D38173.l,X		; 7F 73 81 D3
	jmp.w [$1F11]		; DC 11 1F
	and $9FFBE1.l,X		; 3F E1 FB 9F
	adc ($AB.b),Y		; 71 AB
	lda ($FB.b),Y		; B1 FB
	and $DEDAED.l,X		; 3F ED DA DE
	plp		; 28
	cop $74.b		; 02 74
	and #$B2.b		; 29 B2
	iny		; C8
	sbc [$0E.b],Y		; F7 0E
	cpy #$8F88.w		; C0 88 8F
	eor $AB.b,S		; 43 AB
	lda ($08.b,S),Y		; B3 08
	dec $008A.w,X		; DE 8A 00
	dey		; 88
	inc $379B.w,X		; FE 9B 37
	sbc $88D6.w		; ED D6 88
	dey		; 88
	ldx #$8D23.w		; A2 23 8D
	adc $82.b,X		; 75 82
	rol $BD.b		; 26 BD
	sbc ($FD.b,S),Y		; F3 FD
	sta [$ED.b],Y		; 97 ED
	and $8848.w		; 2D 48 88
	cmp $88D019.l,X		; DF 19 D0 88
	sbc $55.b		; E5 55
	eor ($81.b,X)		; 41 81
	sta ($33.b),Y		; 91 33
	adc [$0D.b]		; 67 0D
	cmp $D9ED72.l		; CF 72 ED D9
	and ($11.b),Y		; 31 11
	trb $CE2C.w		; 1C 2C CE
	php		; 08
	sbc ($D6.b,X)		; E1 D6
	cmp $7FEB.w,Y		; D9 EB 7F
	eor [$D6.b],Y		; 57 D6
	inc $ADAF.w,X		; FE AF AD
	sbc $035F.w,X		; FD 5F 03
	sbc $7A.b,X		; F5 7A
	jmp ($E94F.w,X)		; 7C 4F E9
	sbc $B7FF39.l		; EF 39 FF B7
	dec $78.b,X		; D6 78
.ACCU 16
	rep #$22		; C2 22
	and $7C.b,S		; 23 7C
	adc $F87B.w,Y		; 79 7B F8
	cmp $A31B.w,X		; DD 1B A3
	stz $6E.b,X		; 74 6E
	sta $CCCD.w		; 8D CD CC
	txy		; 9B
	ldx $D295.w		; AE 95 D2
	tsx		; BA
	eor [$4A.b],Y		; 57 4A
	sbc #$295D.w		; E9 5D 29
	eor $A72B.w,X		; 5D 2B A7
	ora #$83C1.w		; 09 C1 83
	ora #$70C2.w		; 09 C2 70
	stz $0A27.w		; 9C 27 0A
	stz $3E.b,X		; 74 3E
	bpl -123.b		; 10 85
	and [$37.b],Y		; 37 37
	ldx #$4C4C.w		; A2 4C 4C
	cmp #$D599.w		; C9 99 D5
	eor $9B.b,X		; 55 9B
	stp		; DB
	adc $63.b,X		; 75 63
	stz $6E.b,X		; 74 6E
	adc $D7D244.l		; 6F 44 D2 D7
	cmp ($B2.b)		; D2 B2
	sta $2B7A.w,X		; 9D 7A 2B
	bit $2B2A.w		; 2C 2A 2B
	rol A		; 2A
	sbc $18D8B8.l		; EF B8 D8 18
	nop		; EA
	adc $A7.b		; 65 A7
	stz $E994.w,X		; 9E 94 E9
	pla		; 68
	lsr A		; 4A
	rol $22.b		; 26 22
	and [$B7.b],Y		; 37 B7
	dec A		; 3A
	ldx $8DA2.w		; AE A2 8D
	sbc ($BA.b),Y		; F1 BA
	cmp $355B.w,X		; DD 5B 35
	pld		; 2B
	cmp $17C2.w,X		; DD C2 17
	dec $2282.w,X		; DE 82 22
	bit $34.b,X		; 34 34
	tsx		; BA
	phk		; 4B
	jmp ($89C6.w)		; 6C C6 89
	cmp ($9E.b,S),Y		; D3 9E
	stx $5B.b,Y		; 96 5B
	jmp.w [$0C30]		; DC 30 0C
	sbc ($A8.b,X)		; E1 A8
	nop		; EA
	lda [$22.b],Y		; B7 22
	rts		; 60

	adc [$C7.b],Y		; 77 C7
	ora $147273.l,X		; 1F 73 72 14
	cmp $A5.b,X		; D5 A5
	cmp #$5CF7.w		; C9 F7 5C
	ldx $5FEB.w		; AE EB 5F
	cmp $A16F32.l,X		; DF 32 6F A1
	ora ($11.b),Y		; 11 11
	ora ($1C.b),Y		; 11 1C
	adc ($CF.b),Y		; 71 CF
	adc [$3A.b],Y		; 77 3A
	adc [$4B.b]		; 67 4B
	.db $42, $22		; 42 22
	tas		; 1B
	adc [$ED.b],Y		; 77 ED
	dec $EADC.w,X		; DE DC EA
	tsx		; BA
	stx $A49B.w		; 8E 9B A4
	stp		; DB
	plb		; AB
	ror $9AAD.w		; 6E AD 9A
	sta $E9.b,X		; 95 E9
	cmp $A5.b,X		; D5 A5
	cmp [$E3.b]		; C7 E3
	dex		; CA
	cpx $4435.w		; EC 35 44
	mvp $46,$44		; 44 44 46
	sta $11.b		; 85 11
	ora ($A2.b),Y		; 11 A2
	tda		; 7B
	ldy $0DB2.w		; AC B2 0D
	and [$4D.b]		; 27 4D
	cmp ($75.b,S),Y		; D3 75
	ora $E656.w,X		; 1D 56 E6
	pea $D570.w		; F4 70 D5
	inc $F9.b		; E6 F9
	dec $B2FF.w,X		; DE FF B2
	sbc $F7.b,S		; E3 F7
	and $69.b,X		; 35 69
	eor [$A7.b],Y		; 57 A7
	ror $A5.b		; 66 A5
	tsx		; BA
	ldx #$2222.w		; A2 22 22
	jsl $234E3C.l		; 22 3C 4E 23
	cmp [$44.b]		; C7 44
	mvp $1D,$44		; 44 44 1D
	xba		; EB
	tsx		; BA
	pla		; 68
	mvp $0F,$46		; 44 46 0F
	sta $75D1.w,X		; 9D D1 75
	adc $70.b,X		; 75 70
	cmp ($B5.b),Y		; D1 B5
	adc ($D6.b),Y		; 71 D6
	sbc ($7F.b)		; F2 7F
	ora ($67.b,S),Y		; 13 67
	cmp ($BA.b)		; D2 BA
	ldx #$2335.w		; A2 35 23
	and [$59.b]		; 27 59
	lda $301B.w		; AD 1B 30
	adc $6E.b		; 65 6E
	inc $C0BA.w,X		; FE BA C0
	cop $52.b		; 02 52
	lda #$AB8A.w		; A9 8A AB
	.db $42, $23		; 42 23
	and $11.b,X		; 35 11
	ora ($9D.b),Y		; 11 9D
	trb $00.b		; 14 00
	tsa		; 3B
	ora $825E4D.l		; 0F 4D 5E 82
	dey		; 88
	txa		; 8A
	jsl $072822.l		; 22 22 28 07
	dec $E9.b,X		; D6 E9
	adc $7F1E.w,X		; 7D 1E 7F
	cmp ($D9.b,S),Y		; D3 D9
	stz $88CA.w,X		; 9E CA 88
	sta $FBDB75.l		; 8F 75 DB FB
	sta $CFFE71.l,X		; 9F 71 FE CF
	phx		; DA
	dec $A008.w		; CE 08 A0
	ora $39F7CF.l,X		; 1F CF F7 39
	bit $6D9B.w,X		; 3C 9B 6D
	sta $23A26E.l		; 8F 6E A2 23
	inx		; E8
	lda $C293B7.l,X		; BF B7 93 C2
	ldx $51.b,Y		; B6 51
	lda $0114.w,X		; BD 14 01
	xce		; FB
	dex		; CA
	cmp $D8F1.w		; CD F1 D8
	dey		; 88
	txa		; 8A
	jsl $032822.l		; 22 22 28 03
	sbc $95.b,X		; F5 95
	sbc #$8828.w		; E9 28 88
	tax		; AA
	jsl $038022.l		; 22 22 80 03
	cmp ($5C.b)		; D2 5C
	inc $44.b,X		; F6 44
	rts		; 60

	inc $8C.b		; E6 8C
	inx		; E8
	lsr $19.b		; 46 19
	inc $68.b		; E6 68
	eor $ACBC.w,X		; 5D BC AC
	eor ($1A.b),Y		; 51 1A
	jmp.w [$1B51]		; DC 51 1B
	stz $D7.b		; 64 D7
	stx $8526.w		; 8E 26 85
	cmp [$5C.b],Y		; D7 5C
	sta ($1F.b),Y		; 91 1F
	mvn $11,$C9		; 54 C9 11
	cpx $DB66.w		; EC 66 DB
	sbc ($F4.b,S),Y		; F3 F4
	phy		; 5A
	stz $2E.b,X		; 74 2E
	stp		; DB
	adc [$DF.b]		; 67 DF
	dey		; 88
	cmp $BD.b		; C5 BD
	lda $F3.b		; A5 F3
	eor $6E7FA6.l		; 4F A6 7F 6E
	and [$DE.b],Y		; 37 DE
	brk $04.b		; 00 04
	bit $BEFD.w,X		; 3C FD BE
	and [$87.b]		; 27 87
	plx		; FA
	adc $3935C4.l,X		; 7F C4 35 39
	jsl $3F6E35.l		; 22 35 6E 3F
	cmp ($DB.b,S),Y		; D3 DB
	inc $E6.b,X		; F6 E6
	sta $D5.b		; 85 D5
	eor ($92.b,S),Y		; 53 92
	ror $FD.b,X		; 76 FD
	cmp $0C.b,X		; D5 0C
	cmp ($1A.b),Y		; D1 1A
	ora [$65.b],Y		; 17 65
.ACCU 8
.INDEX 8
	sep #$BE		; E2 BE
	clc		; 18
	brk $51.b		; 00 51
	eor $34.b,S		; 43 34
	mvp $11,$51		; 44 51 11
	eor [$C3.b],Y		; 57 C3
	adc $40ED69.l,X		; 7F 69 ED 40
	ora ($51.b,X)		; 01 51
	ora ($14.b),Y		; 11 14
	mvp $F7,$55		; 44 55 F7
	ora $007ADA.l		; 0F DA 7A 00
	brk $A8.b		; 00 A8
	dey		; 88
	cmp ($83.b),Y		; D1 83
	.db $62, $23, $82		; 62 23 82
	cpx $002A.w		; EC 2A 00
	asl $18.b		; 06 18
	rol $22.b,X		; 36 22
	plp		; 28
	cpx $D4.b		; E4 D4
	dey		; 88
.ACCU 8
.INDEX 8
	sep #$BA		; E2 BA
	inc $D0F8.w		; EE F8 D0
	ldy $6B71.w,X		; BC 71 6B
	eor [$01.b]		; 47 01
	trb $111B.w		; 1C 1B 11
	ora $4A2F.w,Y		; 19 2F 4A
	wai		; CB
	ora $940B.w		; 0D 0B 94
	txy		; 9B
	eor ($DD.b)		; 52 DD
	lda ($19.b,X)		; A1 19
	rol $A2.b,X		; 36 A2
	and ($59.b)		; 32 59
	tad		; 5B
	adc #$A1.b		; 69 A1
	adc ($93.b)		; 72 93
	rtl		; 6B

	rol $51.b		; 26 51
	sty $65.b,X		; 94 65
	ora $8C32.w,Y		; 19 32 8C
	lda $29.b,S		; A3 29
	eor $A52B.w,X		; 5D 2B A5
	pld		; 2B
	ldy $36.b,X		; B4 36
	bvs -100.b		; 70 9C
	and [$09.b]		; 27 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	stz $5A1A.w		; 9C 1A 5A
	adc ($4C.b,X)		; 61 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
.INDEX 16
	rep #$98		; C2 98
	eor ($0A.b,S),Y		; 53 0A
	mvp $C7,$6B		; 44 6B C7
	adc $F2E0CB.l,X		; 7F CB E0 F2
	lda $F276.w,Y		; B9 76 F2
	adc $BD.b,S		; 63 BD
	cmp #$1111.w		; C9 11 11
	ora ($32.b),Y		; 11 32
	tay		; A8
	cmp [$35.b],Y		; D7 35
	beq -77.b		; F0 B3
	sta [$C8.b]		; 87 C8
	cmp $9BB773.l,X		; DF 73 B7 9B
	jmp $D9B9BC.l		; 5C BC B9 D9
	ldx #$2222.w		; A2 22 22
	jsl $22D86E.l		; 22 6E D8 22
	jsl $657C23.l		; 22 23 7C 65
	ror $1A.b,X		; 76 1A
	clv		; B8
	nop		; EA
	adc [$BB.b]		; 67 BB
	rts		; 60

	dey		; 88
	txy		; 9B
	cmp [$04.b],Y		; D7 04
	mvp $46,$44		; 44 44 46
	txa		; 8A
	and ($4D.b,X)		; 21 4D
	phy		; 5A
	lsr $6F.b,X		; 56 6F
	jmp $E61011.l		; 5C 11 10 E6
	trb $5CA3.w		; 1C A3 5C
	adc #$D2DC.w		; 69 DC D2
	stp		; DB
	dec $F5F3.w,X		; DE F3 F5
	ror $1B.b,X		; 76 1B
	stp		; DB
	stp		; DB
	cmp ($74.b)		; D2 74
	adc [$0E.b]		; 67 0E
	stz $9DEB.w,X		; 9E EB 9D
	ldx $1911.w,Y		; BE 11 19
	cmp ($56.b),Y		; D1 56
	jmp $AA8A37.l		; 5C 37 8A AA
	jsl $0D5925.l		; 22 25 59 0D
	sbc ($18.b),Y		; F1 18
	jsl $712B23.l		; 22 23 2B 71
	lda $FDEFB1.l		; AF B1 EF FD
	inc $D6.b		; E6 D6
	dec A		; 3A
	sta $E769.w,Y		; 99 69 E7
	ldy $C1.b		; A4 C1
	ora ($D9.b)		; 12 D9
	eor [$8E.b],Y		; 57 8E
	sbc #$13C9.w		; E9 C9 13
	bvs -56.b		; 70 C8
	jmp.w [$3231]		; DC 31 32
	brk $A2.b		; 00 A2
	txa		; 8A
	ldy $9C.b,X		; B4 9C
	sta ($10.b),Y		; 91 10
	cmp $6639.w,Y		; D9 39 66
	cmp #$39C7.w		; C9 C7 39
	adc $04.b		; 65 04
	asl A		; 0A
	and $73.b,S		; 23 73
	ply		; 7A
	jsl $882022.l		; 22 22 20 88
	sta $1A0C.w		; 8D 0C 1A
	txs		; 9A
	inc $88.b		; E6 88
	dey		; 88
	dey		; 88
	bit #$635B.w		; 89 5B 63
	ora $BFAA.w,Y		; 19 AA BF
	and $5F.b,X		; 35 5F
	ora $1111.w,X		; 1D 11 11
	ora ($12.b),Y		; 11 12
	lsr $AB2A.w		; 4E 2A AB
	cmp ($75.b)		; D2 75
	dec $B783.w,X		; DE 83 B7
	stx $5AB3.w		; 8E B3 5A
	jsl $082522.l		; 22 22 25 08
	sty $7BD5.w		; 8C D5 7B
	adc [$6D.b],Y		; 77 6D
	jmp.w [$9C00]		; DC 00 9C
	phx		; DA
	ora ($11.b),Y		; 11 11
	trb $F26B.w		; 1C 6B F2
	pld		; 2B
	sbc ($6B.b)		; F2 6B
	xce		; FB
	sbc $EA7FDF.l		; EF DF 7F EA
.ACCU 8
.INDEX 8
	sep #$B5		; E2 B5
	cmp [$E6.b],Y		; D7 E6
	stz $5F.b,X		; 74 5F
	and ($A2.b),Y		; 31 A2
	sbc $34.b,X		; F5 34
	adc $E6B92F.l		; 6F 2F B9 E6
	phy		; 5A
	cmp ($1F.b),Y		; D1 1F
	.db $42, $FE		; 42 FE
	sta $FB.b,S		; 83 FB
	adc $CF3EE7.l		; 6F E7 3E CF
	and ($FC.b)		; 32 FC
	eor [$EB.b],Y		; 57 EB
	inx		; E8
	lda $F7450B.l,X		; BF 0B 45 F7
	ply		; 7A
	and $7ED1C3.l		; 2F C3 D1 7E
	asl $9B8B.w		; 0E 8B 9B
	adc $226A.w,X		; 7D 6A 22
	pld		; 2B
	adc [$F8.b]		; 67 F8
	and $63EB.w		; 2D EB 63
	cpy #$00.b		; C0 00
	ora $4B.b		; 05 4B
	bmi -74.b		; 30 B6
	eor ($BD.b),Y		; 51 BD
	mvp $76,$68		; 44 68 76
	cmp $7DBD.w,X		; DD BD 7D
	lda [$6F.b],Y		; B7 6F
	rts		; 60

	brk $26.b		; 00 26
	sbc $671E.w,Y		; F9 1E 67
	iny		; C8
	sbc ($3E.b,S),Y		; F3 3E
	eor [$99.b]		; 47 99
	sbc ($3C.b)		; F2 3C
	iny		; C8
	dey		; 88
	cmp $8E.b		; C5 8E
	jmp.w [$117A]		; DC 7A 11
	nop		; EA
	ply		; 7A
	and $8C00E7.l		; 2F E7 00 8C
	adc $7C.b,S		; 63 7C
	adc $BFF18D.l		; 6F 8D F1 BF
	cmp ($7F.b),Y		; D1 7F
	pla		; 68
	cmp ($57.b,X)		; C1 57
	cmp $7D.b,S		; C3 7D
	xba		; EB
	bcs  -4.b		; B0 FC
	lda [$EC.b]		; A7 EC
	rep #$0E		; C2 0E
	pla		; 68
	dey		; 88
	dey		; 88
	sta $AE.b,X		; 95 AE
	stp		; DB
	cpy #$7C.b		; C0 7C
	and [$A8.b],Y		; 37 A8
	inc $D0BB.w,X		; FE BB D0
	ror $8A2B.w,X		; 7E 2B 8A
	jsl $672222.l		; 22 22 22 67
	bne 123.b		; D0 7B
	adc [$DC.b],Y		; 77 DC
	and $F7C3.w,X		; 3D C3 F7
	txy		; 9B
	lda [$3F.b],Y		; B7 3F
	sta [$5E.b]		; 87 5E
	sbc $11C1.w,Y		; F9 C1 11
	ora ($33.b),Y		; 11 33
	sta $F1.b		; 85 F1
	sbc ($B6.b)		; F2 B6
	and [$1E.b]		; 27 1E
	lda [$17.b]		; A7 17
	lda [$9B.b]		; A7 9B
	beq  -6.b		; F0 FA
	phy		; 5A
	cmp #$91.b		; C9 91
.ACCU 8
.INDEX 8
	sep #$75		; E2 75
	clv		; B8
	eor $79E4.w,Y		; 59 E4 79
	sta $E2AD.w,X		; 9D AD E2
	adc $58.b,S		; 63 58
	sta $ECFA33.l		; 8F 33 FA EC
	lda ($3F.b)		; B2 3F
	cpx $9F.b		; E4 9F
	cmp $13D9.w,X		; DD D9 13
	bpl  57.b		; 10 39
	txs		; 9A
	dec $61.b,X		; D6 61
	tas		; 1B
	sbc [$46.b]		; E7 46
	asl $08.b,X		; 16 08
	phb		; 8B
	clv		; B8
	sbc $D673C7.l,X		; FF C7 73 D6
	rol $25.b		; 26 25
	cpx #$02.b		; E0 02
	rol $70.b		; 26 70
	ora ($11.b),Y		; 11 11
	ora [$EB.b],Y		; 17 EB
	adc $33C9.w		; 6D C9 33
	brk $03.b		; 00 03
	cmp ($50.b)		; D2 50
	sta $2254.w,Y		; 99 54 22
	jsl $E9933E.l		; 22 3E 93 E9
	sbc $6AFE.w		; ED FE 6A
	ror $1414.w		; 6E 14 14
	ora $FE51.w,X		; 1D 51 FE
	and $F4.b,S		; 23 F4
	lda $AAD3C9.l,X		; BF C9 D3 AA
	stx $86.b		; 86 86
	stx $87.b		; 86 87
	tax		; AA
	stp		; DB
	sbc $DFFF17.l,X		; FF 17 FF DF
	lda $FC.b		; A5 FC
	sta $7D7FAC.l		; 8F AC 7F 7D
	sed		; F8
	sta $5AFE76.l		; 8F 76 FE 5A
	rtl		; 6B

	ror $5F2E.w,X		; 7E 2E 5F
	and ($E5.b,S),Y		; 33 E5
	inx		; E8
	ldx $45DB.w,Y		; BE DB 45
	inc $3A.b,X		; F6 3A
	and $7ED1B2.l		; 2F B2 D1 7E
	rol $BA8A.w,X		; 3E 8A BA
	cmp $50F6.w,X		; DD F6 50
	stz $DF.b		; 64 DF
	sty $B0.b		; 84 B0
	tyx		; BB
	ora #$79.b		; 09 79
	tsb $28.b		; 04 28
	tax		; AA
	lda $785B.w		; AD 5B 78
	and ($D5.b),Y		; 31 D5
	lda [$DF.b],Y		; B7 DF
	rtl		; 6B

	nop		; EA
	stp		; DB
	cpx $78.b		; E4 78
	beq -50.b		; F0 CE
	ldy $28B7.w		; AC B7 28
	rti		; 40

	brk $E3.b		; 00 E3
	inc A		; 1A
	sbc $95FECC.l,X		; FF CC FE 95
	ora ($11.b,S),Y		; 13 11
	ora ($E3.b),Y		; 11 E3
	adc ($75.b),Y		; 71 75
	inc $4845.w		; EE 45 48
	brk $01.b		; 00 01
.ACCU 8
	sep #$6A		; E2 6A
	sbc [$92.b]		; E7 92
	php		; 08
	dey		; 88
	sta $E7D689.l		; 8F 89 D6 E7
	php		; 08
	cmp #$93.b		; C9 93
	adc ($74.b,S),Y		; 73 74
	ror $CD8D.w		; 6E 8D CD
	cmp ($BA.b),Y		; D1 BA
	eor ($95.b)		; 52 95
	cmp [$4A.b],Y		; D7 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $2B.b		; A5 2B
	ldx $E194.w		; AE 94 E1
	sec		; 38
	lsr $8313.w		; 4E 13 83
	eor $42.b,S		; 43 42
	bit $29.b		; 24 29
	sta $30.b		; 85 30
	ldx $14.b		; A6 14
	cmp ($A3.b),Y		; D1 A3
	bra 107.b		; 80 6B
	adc $C1.b,S		; 63 C1
	cmp $83.b,S		; C3 83
	sty $B4.b		; 84 B4
	tda		; 7B
	sbc $719B94.l		; EF 94 9B 71
	lda $B2300B.l		; AF 0B 30 B2
	lsr $CA.b,X		; 56 CA
	stp		; DB
	sbc $26.b,S		; E3 26
	stp		; DB
	adc $0327.w,X		; 7D 27 03
	tda		; 7B
	ror $EE.b		; 66 EE
	lda $50D5.w,X		; BD D5 50
	bra   2.b		; 80 02
	stp		; DB
	pld		; 2B
	bmi -81.b		; 30 AF
	inc A		; 1A
	lda ($86.b)		; B2 86
	.db $62, $2B, $85		; 62 2B 85
	sta $D9C2.w,Y		; 99 C2 D9
	eor [$8D.b],Y		; 57 8D
	inc $B60D.w		; EE 0D B6
	tax		; AA
	jsl $B22522.l		; 22 22 25 B2
	eor ($A2.b),Y		; 51 A2
	adc ($A3.b,S),Y		; 73 A3
	phd		; 0B
	asl $0C.b		; 06 0C
	inc $A8.b		; E6 A8
	sta ($A3.b,S),Y		; 93 A3
	phd		; 0B
	ora ($27.b),Y		; 11 27
	.db $42, $F6		; 42 F6
	eor $F1DC3B.l,X		; 5F 3B DC F1
	bit $F2.b,X		; 34 F2
	dec $C2E5.w,X		; DE E5 C2
	dec $52.b		; C6 52
	ora $FA.b		; 05 FA
	rol $F8A3.w,X		; 3E A3 F8
	sbc $E5BFD1.l,X		; FF D1 BF E5
	sbc $56.b		; E5 56
	and $CA.b,X		; 35 CA
	cmp ($5B.b),Y		; D1 5B
	bit $A8AA.w		; 2C AA A8
	.db $42, $8A		; 42 8A
	brk $01.b		; 00 01
	mvp $44,$44		; 44 44 44
	eor $79.b		; 45 79
	sbc $7374.w,Y		; F9 74 73
	sbc #$CF.b		; E9 CF
	rol $6A.b,X		; 36 6A
	dec $2B.b		; C6 2B
	lsr $50.b,X		; 56 50
	dec $8889.w		; CE 89 88
	dey		; 88
	lda #$85.b		; A9 85
	jsr ($0C2C.w,X)		; FC 2C 0C
	jmp ($0FCF.w,X)		; 7C CF 0F
	sbc [$7B.b],Y		; F7 7B
	asl $95FF.w,X		; 1E FF 95
	.db $82, $A2, $22		; 82 A2 22
	lsr $FB.b		; 46 FB
	adc $66.b		; 65 66
	asl A		; 0A
	ror $07.b,X		; 76 07
	ror $225A.w		; 6E 5A 22
	jsl $8888A8.l		; 22 A8 88 88
	dey		; 88
	ldx $36.b,Y		; B6 36
	rol $ED.b,X		; 36 ED
	dec $71.b		; C6 71
	plx		; FA
	ror A		; 6A
	pea $1195.w		; F4 95 11
	ora ($11.b),Y		; 11 11
	ora $FB.b,X		; 15 FB
	cmp $D8CD86.l		; CF 86 CD D8
	ror $E453.w,X		; 7E 53 E4
	adc ($2E.b,S),Y		; 73 2E
	mvn $44,$44		; 54 44 44
	eor #$5A.b		; 49 5A
	ldy $B7DD.w		; AC DD B7
	adc ($ED.b,X)		; 61 ED
	ora $77E9E6.l,X		; 1F E6 E9 77
	dey		; 88
	tay		; A8
	dey		; 88
	bit #$8D.b		; 89 8D
	adc $A1.b,S		; 63 A1
	ror $FE3B.w,X		; 7E 3B FE
	adc [$BD.b]		; 67 BD
	mvp $44,$54		; 44 54 44
	mvp $57,$11		; 44 11 57
	lda $1F77.w,X		; BD 77 1F
	stz $67FB.w		; 9C FB 67
	sbc $1551.w,Y		; F9 51 15
	ora ($11.b),Y		; 11 11
	tsb $57.b		; 04 57
	nop		; EA
	ror $2FCF.w,X		; 7E CF 2F
	inc $39F3.w		; EE F3 39
	sbc $D1FB12.l		; EF 12 FB D1
	ora [$EA.b],Y		; 17 EA
	ror $FBF9.w		; 6E F9 FB
	sbc $649D.w,X		; FD 9D 64
	ldx $2A22.w,Y		; BE 22 2A
	pea $949F.w		; F4 9F 94
	sbc $0ABD.w		; ED BD 0A
	cpy $C4.b		; C4 C4
	mvn $41,$44		; 54 44 41
	ora ($56.b),Y		; 11 56
	and $3FCF.w,Y		; 39 CF 3F
	stp		; DB
	cmp $D5.b,X		; D5 D5
	mvp $C6,$05		; 44 05 C6
	ldy $CAAA.w,X		; BC AA CA
	lda $815D.w		; AD 5D 81
	ora ($5F.b),Y		; 11 5F
	adc ($FF.b,X)		; 61 FF
	tda		; 7B
	and [$DE.b],Y		; 37 DE
	eor $0044AC.l		; 4F AC 44 00
	eor $59DE61.l,X		; 5F 61 DE 59
	sta [$93.b]		; 87 93
	inc $04.b		; E6 04
	mvp $F6,$55		; 44 55 F6
	cmp $224A.w,Y		; D9 4A 22
	jmp $5400.w		; 4C 00 54
	dex		; CA
	lda ($11.b,X)		; A1 11
	ora ($5E.b),Y		; 11 5E
	ror $9909.w,X		; 7E 09 99
	bra   0.b		; 80 00
	phd		; 0B
	sta $82.b		; 85 82
	jsl $322B22.l		; 22 22 2B 32
	sbc ($43.b,S),Y		; F3 43
	sty $44.b,X		; 94 44
	mvp $54,$44		; 44 44 54
	bne -34.b		; D0 DE
	lda [$AD.b],Y		; B7 AD
	ora $11.b		; 05 11
	ora ($1E.b),Y		; 11 1E
	lda [$C4.b],Y		; B7 C4
	ora $00.b,X		; 15 00
	lda ($CD.b,S),Y		; B3 CD
	jmp ($EE4E.w,X)		; 7C 4E EE
	and $DB7B.w,X		; 3D 7B DB
	cpx $286C.w		; EC 6C 28
	sta $7C98.w		; 8D 98 7C
	eor $D31B63.l		; 4F 63 1B D3
	adc $55.b,S		; 63 55
	adc $0F.b,X		; 75 0F
	dex		; CA
	cpx $1F9B.w		; EC 9B 1F
	bvs -18.b		; 70 EE
	pld		; 2B
	ror A		; 6A
	nop		; EA
	jmp ($57FE.w)		; 6C FE 57
	cmp #$44.b		; C9 44
	mvp $F6,$45		; 44 45 F6
	asl $36BE.w,X		; 1E BE 36
	lda $DEF059.l,X		; BF 59 F0 DE
	phb		; 8B
	sbc ($D5.b)		; F2 D5
	adc $7987.w,X		; 7D 87 79
	tas		; 1B
	cmp ($11.b),Y		; D1 11
	ora ($6D.b),Y		; 11 6D
	lda $FA.b,X		; B5 FA
	cmp $5DF46A.l		; CF 6A F4 5D
	ldx $2A.b,Y		; B6 2A
	ldx $C9.b,Y		; B6 C9
	ora ($11.b),Y		; 11 11
	ora ($76.b),Y		; 11 76
	dec $E9A7.w,X		; DE A7 E9
	adc $E3.b		; 65 E3
	stz $FE.b,X		; 74 FE
	dec $DC.b,X		; D6 DC
	eor $E2.b,X		; 55 E2
	plb		; AB
	lda $3E.b		; A5 3E
	plb		; AB
	dec A		; 3A
	lda [$37.b],Y		; B7 37
	lsr $2292.w		; 4E 92 22
	stp		; DB
	cld		; D8
	eor [$D3.b]		; 47 D3
	ldy $E4F7.w,X		; BC F7 E4
	pld		; 2B
	ldx $AB.b,Y		; B6 AB
	jmp ($7AA3.w)		; 6C A3 7A
	jsl $FE2B22.l		; 22 22 2B FE
	adc [$B7.b]		; 67 B7
	adc $8E8F.w,Y		; 79 8F 8E
	ldx $AAC2.w		; AE C2 AA
	jsl $2B2222.l		; 22 22 22 2B
	inc $5D97.w,X		; FE 97 5D
.ACCU 8
.INDEX 8
	sep #$3B		; E2 3B
	ora $B95849.l		; 0F 49 58 B9
	ldx #$22.b		; A2 22
	jsl $36CF30.l		; 22 30 CF 36
	inc $4C.b		; E6 4C
	sta $B737.w,Y		; 99 37 B7
	ldx #$4A.b		; A2 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $75.b		; A5 75
	plx		; FA
	sec		; 38
	cop $22.b		; 02 22
	jsl $1A3422.l		; 22 22 34 1A
	php		; 08
	cmp ($42.b),Y		; D1 42
	jsl $B23622.l		; 22 22 36 B2
	eor $B60E.w		; 4D 0E B6
	cmp $8822.w,Y		; D9 22 88
	dey		; 88
	txa		; 8A
	bit #$A1.b		; 89 A1
	dex		; CA
	jsl $8A8888.l		; 22 88 88 8A
	bit #$A1.b		; 89 A1
	wai		; CB
	ldy $EF.b		; A4 EF
	trb $44.b		; 14 44
	mvp $4C,$5C		; 44 5C 4C
	sta $510E.w		; 8D 0E 51
	trb $44.b		; 14 44
	mvp $34,$55		; 44 55 34
	and $5150.w,X		; 3D 50 51
	ora ($11.b),Y		; 11 11
	lsr $10.b,X		; 56 10
	bit $35.b,X		; 34 35
	eor ($19.b)		; 52 19
	ldx #$22.b		; A2 22
	jsl $797EDF.l		; 22 DF 7E 79
	txs		; 9A
	inc A		; 1A
	lda [$C7.b],Y		; B7 C7
	sec		; 38
	jsl $862222.l		; 22 22 22 86
	lda ($A1.b,X)		; A1 A1
	dex		; CA
	dec A		; 3A
	txa		; 8A
	jsl $852D22.l		; 22 22 2D 85
	lsr $87.b		; 46 87
	plp		; 28
	txa		; 8A
	jsl $F12D22.l		; 22 22 2D F1
	rep #$C3		; C2 C3
	eor $54.b,S		; 43 54
	eor $11.b		; 45 11
	ora ($16.b),Y		; 11 16
	cmp $CD7E.w,Y		; D9 7E CD
	inc $86.b		; E6 86
	lda $644F.w		; AD 4F 64
	ldx #$22.b		; A2 22
	jsl $682084.l		; 22 84 20 68
	ror A		; 6A
	pei ($EE.b)		; D4 EE
	pei ($44.b)		; D4 44
	mvp $BD,$5F		; 44 5F BD
	ldx #$FF.b		; A2 FF
	stp		; DB
	eor $34.b		; 45 34
	and $7F.b,X		; 35 7F
	ldy $3AFE.w,X		; BC FE 3A
	dey		; 88
	dey		; 88
	phb		; 8B
	cpx $F9.b		; E4 F9
	and $344577.l,X		; 3F 77 45 34
	and $7C.b,X		; 35 7C
	cmp $F8.b,S		; C3 F8
	asl A		; 0A
	jsl $192E22.l		; 22 22 2E 19
	bvs 120.b		; 70 78
	ror $86.b		; 66 86
	ldx $6555.w		; AE 55 65
	iny		; C8
	mvp $41,$44		; 44 44 41
	eor $34.b,X		; 55 34
	and $06.b,X		; 35 06
	ldy $1151.w,X		; BC 51 11
	bpl 101.b		; 10 65
	bit $4353.w		; 2C 53 43
	eor ($D5.b)		; 52 D5
	ora ($11.b),Y		; 11 11
	bpl 120.b		; 10 78
	and ($E2.b),Y		; 31 E2
	ldx $86.b		; A6 86
	ldx $C7.b		; A6 C7
	ldx $B8EF.w,Y		; BE EF B8
	php		; 08
	dey		; 88
	dey		; 88
	rol $61.b,X		; 36 61
	adc [$88.b]		; 67 88
	pla		; 68
	ror A		; 6A
	rol $D8.b		; 26 D8
	dey		; 88
	dey		; 88
	sta $3A.b,S		; 83 3A
	and [$FE.b]		; 27 FE
	and ($43.b,S),Y		; 33 43
	eor ($3E.b),Y		; 51 3E
	plp		; 28
	dey		; 88
	dey		; 88
	.db $82, $22, $68		; 82 22 68
	ror A		; 6A
	jsl $A82322.l		; 22 22 23 A8
	sbc #$AF.b		; E9 AF
	sbc $3B.b		; E5 3B
	ldy $D0.b		; A4 D0
	dec $478F.w,X		; DE 8F 47
	cpx $9D.b		; E4 9D
	and ($11.b),Y		; 31 11
	ora ($D3.b),Y		; 11 D3
	eor ($D2.b),Y		; 51 D2
	eor $D80D.w		; 4D 0D D8
	cld		; D8
	eor $11B1.w		; 4D B1 11
	ora ($1C.b),Y		; 11 1C
	cpx #$89.b		; E0 89
	lda ($BF.b,X)		; A1 BF
	adc [$45.b]		; 67 45
	rts		; 60

	sta $A613.w		; 8D 13 A6
	stz $CE.b,X		; 74 CE
	sta $C1D2.w,Y		; 99 D2 C1
	sta $0A.b,S		; 83 0A
	plp		; 28
	ldx $14.b		; A6 14
.INDEX 16
	rep #$98		; C2 98
	eor ($08.b,S),Y		; 53 08
	eor ($0A.b,S),Y		; 53 0A
	adc ($4A.b,X)		; 61 4A
	and $A5.b		; 25 A5
	rts		; 60

	eor $9DC3C6.l,X		; 5F C6 C3 9D
	lda $E4.b,X		; B5 E4
	php		; 08
	dey		; 88
	sta $EB3C1A.l		; 8F 1A 3C EB
	dec A		; 3A
	and $A2.b,X		; 35 A2
	jsl $F30224.l		; 22 24 02 F3
	cpy #$1111.w		; C0 11 11
	ora ($BD.b),Y		; 11 BD
	beq  20.b		; F0 14
	mvp $4B,$44		; 44 44 4B
	eor $4440.w		; 4D 40 44
	mvp $1D,$75		; 44 75 1D
	xce		; FB
	tay		; A8
	ldx #$2222.w		; A2 22 22
	jsr $8808.w		; 20 08 88
	dey		; 88
	dey		; 88
	ldx #$2222.w		; A2 22 22
	ror $00.b		; 66 00
	dey		; 88
	dey		; 88
	dey		; 88
	txa		; 8A
	jsl $006422.l		; 22 22 64 00
	php		; 08
	dey		; 88
	dey		; 88
	dey		; 88
	ldx #$4C22.w		; A2 22 4C
	lda ($57.b,S),Y		; B3 57
	tax		; AA
	sbc ($79.b,X)		; E1 79
	sbc $6CD2D1.l,X		; FF D1 D2 6C
	adc [$8D.b],Y		; 77 8D
	ldx $B5F1.w		; AE F1 B5
	inc $CF.b,X		; F6 CF
	ora ($C8.b),Y		; 11 C8
	iny		; C8
	cpy $FE.b		; C4 FE
	eor $23.b,S		; 43 23
	inc $86.b,X		; F6 86
	ora $571DBC.l		; 0F BC 1D 57
	sty $FF.b		; 84 FF
	and $93.b,S		; 23 93
	xce		; FB
	phk		; 4B
	txy		; 9B
	xce		; FB
	ora [$18.b],Y		; 17 18
	ora [$18.b],Y		; 17 18
	stz $1ADA.w		; 9C DA 1A
	lda [$66.b]		; A7 66
	and $DC.b,X		; 35 DC
	cpx #$E2DC.w		; E0 DC E2
	sbc ($66.b,S),Y		; F3 66
	cpx $E0.b		; E4 E0
	sep #$00		; E2 00
	bpl -126.b		; 10 82
	inc $8C.b		; E6 8C
	ora ($11.b),Y		; 11 11
	stx $68.b		; 86 68
	dey		; 88
	stx $DB.b,Y		; 96 DB
	eor $5976.w,X		; 5D 76 59
	txy		; 9B
	phb		; 8B
	eor $52.b,S		; 43 52
	ldx $CA.b,Y		; B6 CA
	ldy $C16C.w,X		; BC 6C C1
	ora ($11.b),Y		; 11 11
	and ($93.b)		; 32 93
	bne 120.b		; D0 78
	inc $E8A7.w,X		; FE A7 E8
	and $27.b,S		; 23 27
	lda $6C7C.w,Y		; B9 7C 6C
	lda $B77A.w		; AD 7A B7
	dey		; 88
	plx		; FA
	sta $6D.b,X		; 95 6D
	tda		; 7B
	sta [$AC.b]		; 87 AC
	ldy $8F90.w,X		; BC 90 8F
	lsr $F9.b,X		; 56 F9
	sbc [$F0.b]		; E7 F0
	cmp $ABF946.l,X		; DF 46 F9 AB
	cmp $FD2D.w,Y		; D9 2D FD
	phd		; 0B
	inc $FFD5.w,X		; FE D5 FF
	lsr $FF.b,X		; 56 FF
	asl A		; 0A
	sbc $89F41E.l,X		; FF 1E F4 89
	cmp ($32.b,S),Y		; D3 32
	dec $7D.b,X		; D6 7D
	inc $EF5D.w,X		; FE 5D EF
	eor $7739FE.l		; 4F FE 39 77
	.db $82, $3D, $3A		; 82 3D 3A
	ldy $BB0A.w,X		; BC 0A BB
	pla		; 68
	tda		; 7B
	ora $B7.b,S		; 03 B7
	lda $D6.b,S		; A3 D6
	cmp $B2.b,X		; D5 B2
	adc ($C4.b)		; 72 C4
	adc [$A9.b],Y		; 77 A9
	sbc [$3F.b],Y		; F7 3F
	ora [$C8.b]		; 07 C8
	sbc ($3D.b,S),Y		; F3 3D
	sta $1B.b,X		; 95 1B
	and $CFAB66.l		; 2F 66 AB CF
	eor [$EE.b],Y		; 57 EE
	rol $E447.w,X		; 3E 47 E4
	eor $1B7EE1.l		; 4F E1 7E 1B
	lda ($D4.b)		; B2 D4
	cpx $EAB0.w		; EC B0 EA
	jmp ($96F9.w,X)		; 7C F9 96
	sbc ($FE.b)		; F2 FE
	rol $C6.b,X		; 36 C6
	rol $64.b,X		; 36 64
	sbc $66.b,S		; E3 66
	ror $AAE5.w		; 6E E5 AA
	sbc $2E5DFA.l		; EF FA 5D 2E
	adc $B32C37.l		; 6F 37 2C B3
	cmp ($E7.b),Y		; D1 E7
	and $8A8D.w,X		; 3D 8D 8A
	tax		; AA
	cmp ($7A.b,S),Y		; D3 7A
	inc $A6.b		; E6 A6
	tsb $1D1A.w		; 0C 1A 1D
	eor [$27.b],Y		; 57 27
	sbc [$B4.b],Y		; F7 B4
	eor $E9A2A7.l,X		; 5F A7 A2 E9
	adc #$6F.b		; 69 6F
	lda [$DA.b],Y		; B7 DA
	phy		; 5A
	eor $E84527.l,X		; 5F 27 45 E8
	inx		; E8
	sbc $237DEB.l,X		; FF EB 7D 23
	ldx $F3.b,Y		; B6 F3
	sta $B3B7.w,X		; 9D B7 B3
	sta $D779.w,X		; 9D 79 D7
	sta $C18707.l,X		; 9F 07 87 C1
	sbc ($F0.b,X)		; E1 F0
	sei		; 78
	adc ($CA.b)		; 72 CA
	eor $1B4B.w,Y		; 59 4B 1B
	beq  48.b		; F0 30
	wai		; CB
	sta ($97.b),Y		; 91 97
	and $2E.b,S		; 23 2E
	lsr $55.b		; 46 55
	adc $56.b		; 65 56
	and $E1.b,X		; 35 E1
	ror $16.b		; 66 16
	.db $42, $10		; 42 10
	sbc $F0.b,X		; F5 F0
	sty $3D.b		; 84 3D
	jmp ($0F21.w,X)		; 7C 21 0F
	eor $EE5308.l,X		; 5F 08 53 EE
	and ($9F.b,X)		; 21 9F
	lda $CFD0F8.l		; AF F8 D0 CF
	cmp [$FC.b],Y		; D7 FC
	pla		; 68
	adc [$EB.b]		; 67 EB
	inc $3334.w,X		; FE 34 33
	sbc [$1E.b],Y		; F7 1E
	sbc [$5B.b]		; E7 5B
	sta $AD.b		; 85 AD
	ora $176E.w,X		; 1D 6E 17
	lda $F6.b		; A5 F6
	plx		; FA
	cmp $3CF6FC.l,X		; DF FC F6 3C
	lsr $88C7.w,X		; 5E C7 88
	lda ($E4.b),Y		; B1 E4
	dec $F8.b		; C6 F8
	sbc ($63.b)		; F2 63
	inc $FFA3.w		; EE A3 FF
	pei ($78.b)		; D4 78
	cmp ($E3.b),Y		; D1 E3
	ldy $63.b		; A4 63
	asl $31.b,X		; 16 31
	eor $5BD5.w,X		; 5D D5 5B
	lda $ABBA89.l		; AF 89 BA AB
	adc $F1.b,X		; 75 F1
	and $AF.b		; 25 AF
	pld		; 2B
	adc $AE.b		; 65 AE
	stx $F653.w		; 8E 53 F6
	rol $F653.w		; 2E 53 F6
	and $2B3EF7.l		; 2F F7 3E 2B
.ACCU 8
.INDEX 8
	sep #$BE		; E2 BE
	and $98.b		; 25 98
	ror $69F4.w		; 6E F4 69
	inc $7EF7.w		; EE F7 7E
	adc ($0F.b,S),Y		; 73 0F
	and [$87.b],Y		; 37 87
	txy		; 9B
	cmp $6C.b,S		; C3 6C
	lsr A		; 4A
	plx		; FA
	and $F415.w		; 2D 15 F4
	adc [$F0.b]		; 67 F0
	adc [$E3.b]		; 67 E3
	cmp $F0A7F9.l		; CF F9 A7 F0
	phx		; DA
	bit $6D6D.w		; 2C 6D 6D
	lda [$B4.b],Y		; B7 B4
	dec A		; 3A
	cmp $B5.b,S		; C3 B5
	and $1A9D3C.l,X		; 3F 3C 9D 1A
	sta $F7.b,X		; 95 F7
	sta $E3.b,X		; 95 E3
	cmp #$13.b		; C9 13
	sta ($BA.b),Y		; 91 BA
	adc [$5C.b],Y		; 77 5C
	sta $7B7FDE.l		; 8F DE 7F 7B
	sta ($C8.b),Y		; 91 C8
	adc $841C.w,Y		; 79 1C 84
	sei		; 78
	pla		; 68
	beq -29.b		; F0 E3
	jmp ($E272.w,X)		; 7C 72 E2
	sbc ($B8.b),Y		; F1 B8
	lda $1131.w,X		; BD 31 11
	ora ($11.b),Y		; 11 11
	sta ($88.b)		; 92 88
	dey		; 88
	dey		; 88
	stx $CB.b,Y		; 96 CB
	eor $1111.w		; 4D 11 11
	ora ($1E.b),Y		; 11 1E
	bcc -120.b		; 90 88
	dey		; 88
	dey		; 88
	txy		; 9B
	cmp [$78.b]		; C7 78
	sbc $82FB9D.l		; EF 9D FB 82
	jsl $D1463B.l		; 22 3B 46 D1
	dec $6539.w		; CE 39 65
	.db $82, $22, $08		; 82 22 08
	sta ($D5.b,S),Y		; 93 D5
	cpy $C14D.w		; CC 4D C1
	and [$11.b],Y		; 37 11
	inc A		; 1A
	rol $20.b,X		; 36 20
	sta $D228.w		; 8D 28 D2
	adc ($44.b,S),Y		; 73 44
	jsr ($B302.w,X)		; FC 02 B3
	ldx $76.b		; A6 76
	ora [$4C.b]		; 07 4C
	cpx $BD39.w		; EC 39 BD
	adc ($74.b)		; 72 74
	inc $8FEB.w,X		; FE EB 8F
	eor $3DF874.l		; 4F 74 F8 3D
	and $E0D3.w,X		; 3D D3 E0
	lda [$C6.b],Y		; B7 C6
	eor ($94.b),Y		; 51 94
	adc $19.b		; 65 19
	lsr $51.b		; 46 51
	sty $65.b,X		; 94 65
	adc $BAF2.w,X		; 7D F2 BA
	eor [$4A.b],Y		; 57 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $74.b		; A5 74
	ldx $189C.w		; AE 9C 18
	bmi  96.b		; 30 60
	cmp ($84.b,X)		; C1 84
	sbc #$9C.b		; E9 9C
	and ($4C.b,X)		; 21 4C
	and #$85.b		; 29 85
	bmi -90.b		; 30 A6
	trb $C2.b		; 14 C2
	tya		; 98
	eor ($A3.b,S),Y		; 53 A3
	ror $F7C4.w,X		; 7E C4 F7
	sbc $4DED72.l		; EF 72 ED 4D
	txy		; 9B
	sec		; 38
	sbc ($6D.b),Y		; F1 6D
	cmp [$6B.b],Y		; D7 6B
	ror A		; 6A
	jmp ($53CB.w,X)		; 7C CB 53
	eor $43.b,S		; 43 43
	mvp $E6,$43		; 44 43 E6
	adc $F2CA87.l,X		; 7F 87 CA F2
	sbc $112A.w,X		; FD 2A 11
	beq  58.b		; F0 3A
	eor $7CE949.l		; 4F 49 E9 7C
	dec $7B.b		; C6 7B
	asl $37E3.w		; 0E E3 37
	lda [$78.b],Y		; B7 78
	asl $A79B.w		; 0E 9B A7
	jmp.w [$A01E]		; DC 1E A0
	eor [$E8.b]		; 47 E8
	lda $59CF.w,X		; BD CF 59
	bne -23.b		; D0 E9
	pea $9E1D.w		; F4 1D 9E
	sbc ($F5.b,X)		; E1 F5
	asl A		; 0A
	ldx $EEA1.w,Y		; BE A1 EE
	asl $EAAD.w,X		; 1E AD EA
	cmp $7D44.w,X		; DD 44 7D
	adc $FB.b,S		; 63 FB
	sbc $B77BC4.l		; EF C4 7B B7
	sbc ($D3.b)		; F2 D3
	ror A		; 6A
	adc #$F2.b		; 69 F2
	cmp $137B6C.l		; CF 6C 7B 13
	cmp $1C1F.w,Y		; D9 1F 1C
	eor $30AA.w		; 4D AA 30
	bmi -105.b		; 30 97
	and [$8C.b],Y		; 37 8C
	cpx $B63D.w		; EC 3D B6
	tas		; 1B
	tsb $F01A.w		; 0C 1A F0
	lda ($56.b,S),Y		; B3 56
	cmp $5AD769.l		; CF 69 D7 5A
	rtl		; 6B

	stx $8E.b,Y		; 96 8E
	sbc $A3C4.w,Y		; F9 C4 A3
	lsr $9A.b		; 46 9A
	lda [$B5.b],Y		; B7 B5
	tax		; AA
	ldy $34.b,X		; B4 34
	eor $11A1.w		; 4D A1 11
	ora ($3F.b),Y		; 11 3F
	ora $E7A662.l		; 0F 62 A6 E7
	dec $5BEC.w		; CE EC 5B
	bcs -20.b		; B0 EC
	tsa		; 3B
	asl A		; 0A
	sbc $4F2E.w,Y		; F9 2E 4F
	cpy $7572.w		; CC 72 75
	eor $5557.w,X		; 5D 57 55
	and ($AB.b,S),Y		; 33 AB
	eor [$62.b],Y		; 57 62
	cmp $6187.w,X		; DD 87 61
	eor [$3C.b],Y		; 57 3C
	beq -25.b		; F0 E7
	and $AE3A.w,Y		; 39 3A AE
	plb		; AB
	tax		; AA
	dey		; 88
	sta $6B97.w,Y		; 99 97 6B
	cmp [$5D.b]		; C7 5D
	cmp [$5C.b],Y		; D7 5C
	sbc ($BF.b,S),Y		; F3 BF
	stx $0B46.w		; 8E 46 0B
	adc ($73.b,S),Y		; 73 73
	adc ($26.b)		; 72 26
	adc $E0.b		; 65 E0
	rol A		; 2A
	ldx $9079.w		; AE 79 90
	clc		; 18
	and $88A8.w,Y		; 39 A8 88
	sta $0080.w,Y		; 99 80 00
	tax		; AA
	ldy #$22.b		; A0 22
	ldx #$88.b		; A2 88
	bit #$A1.b		; 89 A1
	stx $B2CB.w		; 8E CB B2
	ldy #$22.b		; A0 22
	ldx #$EA.b		; A2 EA
	dec A		; 3A
	dey		; 88
	txs		; 9A
	clc		; 18
	sta [$C2.b],Y		; 97 C2
	plx		; FA
	brk $CC.b		; 00 CC
	stz $A673.w,X		; 9E 73 A6
	adc $E7F7.w		; 6D F7 E7
	jmp ($29F7.w,X)		; 7C F7 29
	sta ($41.b,X)		; 81 41
	eor ($41.b,X)		; 41 41
	bcc  94.b		; 90 5E
	brk $06.b		; 00 06
	adc $9B.b,S		; 63 9B
	sta $44.b,X		; 95 44
	mvp $84,$73		; 44 73 84
	brk $0B.b		; 00 0B
	phb		; 8B
	sta $C00D.w		; 8D 0D C0
	sta $C8CD.w,X		; 9D CD C8
	dey		; 88
	sbc ($67.b,X)		; E1 67
	eor $0445.w,X		; 5D 45 04
	sei		; 78
	sbc $7A5D.w,X		; FD 5D 7A
	bcc -44.b		; 90 D4
	bit $31.b,X		; 34 31
.INDEX 8
	sep #$59		; E2 59
	sta $A29E59.l		; 8F 59 9E A2
	jsl $99B732.l		; 22 32 B7 99
	cpy $1BC7.w		; CC C7 1B
	inc A		; 1A
	sta ($D2.b)		; 92 D2
	ldy #$0C.b		; A0 0C
	adc $446B.w		; 6D 6B 44
	ldx $55.b,Y		; B6 55
	stz $23.b		; 64 23
	cpy $70E6.w		; CC E6 70
	and $CF47.w		; 2D 47 CF
	and $8FF692.l,X		; 3F 92 F6 8F
	lda ($7D.b)		; B2 7D
	ora $B8.b		; 05 B8
	lda ($4F.b)		; B2 4F
	ldy $7C.b,X		; B4 7C
	lda $E0.b,S		; A3 E0
	ora $F6D9.w,X		; 1D D9 F6
	cop $45.b		; 02 45
	sed		; F8
	tya		; 98
	beq 113.b		; F0 71
	tyx		; BB
	asl $3A0E.w,X		; 1E 0E 3A
	clv		; B8
	beq 101.b		; F0 65
	adc $C6F1.w		; 6D F1 C6
	ldx $BEEA.w,Y		; BE EA BE
	sbc ($BE.b)		; F2 BE
	nop		; EA
	lda $EABE06.l,X		; BF 06 BE EA
	lda [$41.b],Y		; B7 41
	and ($11.b),Y		; 31 11
	ora ($11.b),Y		; 11 11
	ora $5BD5.w,X		; 1D D5 5B
	lda $ABBA89.l		; AF 89 BA AB
	adc $F1.b,X		; 75 F1
	rol A		; 2A
	cmp ($BF.b),Y		; D1 BF
	lda $55.b		; A5 55
	dex		; CA
	ror $CAC5.w,X		; 7E C5 CA
	ror $7DC6.w,X		; 7E C6 7D
	bit $3CFF.w,X		; 3C FF 3C
	eor [$77.b]		; 47 77
	and $F2DE.w,X		; 3D DE F2
	ldx $BA.b,Y		; B6 BA
	cmp $73.b,X		; D5 73
	cmp $45730E.l		; CF 0E 73 45
	tda		; 7B
	eor $4FC3.w,Y		; 59 C3 4F
	ldy $23.b		; A4 23
	tsb $D8F7.w		; 0C F7 D8
	tad		; 5B
	lda $FABA6D.l		; AF 6D BA FA
	xba		; EB
	stz $EF72.w,X		; 9E 72 EF
	wai		; CB
	ror A		; 6A
	bvs -77.b		; 70 B3
	asl $DA55.w		; 0E 55 DA
	sbc $0C.b,S		; E3 0C
	xce		; FB
	ora $0E48.w,Y		; 19 48 0E
	eor $C8.b,S		; 43 C8
	sbc $C83C57.l		; EF 57 3C C8
	ora $4F4E.w		; 0D 4E 4F
	ora [$8D.b],Y		; 17 8D
	cmp $FA.b		; C5 FA
	eor $0C.b,S		; 43 0C
	sbc ($00.b,S),Y		; F3 00
	ora $17.b,S		; 03 17
	and $40.b,X		; 35 40
	eor $68.b		; 45 68
	sta $C378.w,X		; 9D 78 C3
	and ($40.b),Y		; 31 40
	brk $A0.b		; 00 A0
	ora ($10.b),Y		; 11 10
	ora ($54.b),Y		; 11 54
	mvp $AC,$44		; 44 44 AC
	bra   8.b		; 80 08
	jsl $C70C24.l		; 22 24 0C C7
	and [$9F.b]		; 27 9F
	.db $62, $22, $22		; 62 22 22
	and $46.b		; 25 46
	rti		; 40

	txy		; 9B
	.db $82, $24, $0C		; 82 24 0C
	cmp [$35.b]		; C7 35
	inc A		; 1A
	eor ($11.b),Y		; 51 11
	ora ($01.b)		; 12 01
	cmp ($3B.b,S),Y		; D3 3B
	ora ($11.b,X)		; 01 11
	bit $A439.w		; 2C 39 A4
	plx		; FA
	tda		; 7B
	lda [$C1.b]		; A7 C1
	mvp $44,$44		; 44 44 44
	sty $28A3.w		; 8C A3 28
	dex		; CA
	and ($8C.b)		; 32 8C
	lda $28.b,S		; A3 28
	dex		; CA
	and [$4A.b],Y		; 37 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $74.b		; A5 74
	ldx $D295.w		; AE 95 D2
	tsx		; BA
	eor [$4E.b],Y		; 57 4E
	tsb $0927.w		; 0C 27 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	sta $182C.w,X		; 9D 2C 18
	eor ($A1.b,S),Y		; 53 A1
	bcs -90.b		; B0 A6
	trb $C2.b		; 14 C2
	txs		; 9A
	lda $5266.w,Y		; B9 66 52
	adc $9A.b,X		; 75 9A
	cmp ($37.b)		; D2 37
	sbc ($71.b)		; F2 71
	dec $D2.b		; C6 D2
	ldy #$2F00.w		; A0 00 2F
	and ($11.b),Y		; 31 11
	sbc #$695B.w		; E9 5B 69
	and ($BD.b,X)		; 21 BD
	txa		; 8A
	bit $5D.b		; 24 5D
	bit $B4.b,X		; 34 B4
	bne -53.b		; D0 CB
	cmp $5B.b		; C5 5B
	adc $3224.w		; 6D 24 32
	adc $1145.w		; 6D 45 11
	and $3334.w		; 2D 34 33
	ror $797B.w		; 6E 7B 79
	plp		; 28
	php		; 08
	tay		; A8
	sbc $C1D0.w		; ED D0 C1
	ora ($43.b,S),Y		; 13 43
	clc		; 18
	tax		; AA
	bra -118.b		; 80 8A
	phb		; 8B
	ply		; 7A
	jsl $AC6268.l		; 22 68 62 AC
	ldy $5A.b		; A4 5A
	and ($6F.b),Y		; 31 6F
	eor $11.b		; 45 11
	bit $68.b		; 24 68
	stz $E7.b		; 64 E7
	rol $B6F8.w		; 2E F8 B6
	sta [$80.b]		; 87 80
	cmp #$8733.w		; C9 33 87
	ora $4826.w,X		; 1D 26 48
	brk $08.b		; 00 08
	ora ($0B.b),Y		; 11 0B
	jsr $2CF6.w		; 20 F6 2C
	sta ($2A.b,S),Y		; 93 2A
	lda $EB76.w,Y		; B9 76 EB
	rol $0046.w,X		; 3E 46 00
	brk $54.b		; 00 54
	phy		; 5A
	rol $E1.b		; 26 E1
	cpy $6F.b		; C4 6F
	jmp $A9AA.w		; 4C AA A9
	eor $1F.b,X		; 55 1F
	.db $42, $01		; 42 01
	bvc -120.b		; 50 88
	bit #$C1F5.w		; 89 F5 C1
	and ($AA.b)		; 32 AA
	lda $55.b		; A5 55
	cmp $82.b		; C5 82
	ora $08.b,X		; 15 08
	dey		; 88
	dey		; 88
	.db $82, $0B, $B6		; 82 0B B6
	sbc $4E3E.w		; ED 3E 4E
	dec $DE96.w,X		; DE 96 DE
	php		; 08
	jsl $F14E3A.l		; 22 3A 4E F1
	lda $36E0.w		; AD E0 36
	ror A		; 6A
	jmp ($CCEF.w)		; 6C EF CC
	bvs -50.b		; 70 CE
	jsr ($33A5.w,X)		; FC A5 33
	sta ($CB.b,X)		; 81 CB
.ACCU 8
.INDEX 8
	sep #$71		; E2 71
	sbc $35.b,X		; F5 35
	ora $36FE.w,X		; 1D FE 36
	adc [$1C.b]		; 67 1C
	lda $FF9A.w		; AD 9A FF
	eor ($C4.b,S),Y		; 53 C4
	rol $6E.b		; 26 6E
	sta $770C.w		; 8D 0C 77
	cmp $4C07.w		; CD 07 4C
	plb		; AB
	rol A		; 2A
	and [$44.b]		; 27 44
	cmp $12.b		; C5 12
	php		; 08
	sta $48.b,X		; 95 48
	ldy $F102.w,X		; BC 02 F1
	brk $C8.b		; 00 C8
	sbc $E5.b		; E5 E5
	ply		; 7A
	and [$C5.b],Y		; 37 C5
	bmi 122.b		; 30 7A
	inc $84.b		; E6 84
	ldy $81.b,X		; B4 81
	lda ($F2.b,X)		; A1 F2
	tsa		; 3B
	ora $3143.w,Y		; 19 43 31
	ora ($46.b)		; 12 46
	eor [$BC.b],Y		; 57 BC
	rol $A4.b,X		; 36 A4
	bit #$58.b		; 89 58
	adc $00A8EA.l		; 6F EA A8 00
	phd		; 0B
	dec $F515.w		; CE 15 F5
	sep #$00		; E2 00
	pha		; 48
	stz $DA.b		; 64 DA
	bit #$11.b		; 89 11
	sta $B6.b,X		; 95 B6
	txs		; 9A
	ora $8578.w,Y		; 19 78 85
	eor $24.b		; 45 24
	sta $6EC9.w		; 8D C9 6E
	ply		; 7A
	lda $71C3.w		; AD C3 71
	tsb $EAA5.w		; 0C A5 EA
	lda $2929.w		; AD 29 29
	and #$29.b		; 29 29
	and ($34.b),Y		; 31 34
	and $1C15.w		; 2D 15 1C
	rtl		; 6B

	ora ($4D.b),Y		; 11 4D
	ora $51.b		; 05 51
	eor ($11.b),Y		; 51 11
	trb $D0.b		; 14 D0
	pei ($44.b)		; D4 44
	lsr $D6.b		; 46 D6
	pha		; 48
	ldx #$36.b		; A2 36
	dex		; CA
	lsr $86.b		; 46 86
	jsl $063C34.l		; 22 34 3C 06
	pha		; 48
	phb		; 8B
	mvp $12,$F8		; 44 F8 12
	bcc   0.b		; 90 00
	.db $42, $11		; 42 11
	sep #$0C		; E2 0C
	ora $82F3.w,X		; 1D F3 82
	jsl $008623.l		; 22 23 86 00
	ora ($55.b,X)		; 01 55
	lsr $EF.b,X		; 56 EF
	cmp $0D27.w,Y		; D9 27 0D
	lda $AA32.w,X		; BD 32 AA
	lda $55.b		; A5 55
	stz $2AC0.w		; 9C C0 2A
	and ($A8.b)		; 32 A8
	lsr $89.b		; 46 89
	dey		; 88
	sta $5355.w,Y		; 99 55 53
	lda ($75.b,X)		; A1 75
	dec $15.b,X		; D6 15
	ora $2254.w,Y		; 19 54 22
	and $77C3.w,Y		; 39 C3 77
	cmp ($A2.b),Y		; D1 A2
	stz $0C.b,X		; 74 0C
	cmp $66B3.w,Y		; D9 B3 66
	plb		; AB
	rti		; 40

	sty $4E.b,X		; 94 4E
	bit #$D1.b		; 89 D1
	dec A		; 3A
	rol $22.b		; 26 22
	plx		; FA
	cmp [$F7.b]		; C7 F7
	cmp $6FF788.l,X		; DF 88 F7 6F
	sbc $A6.b		; E5 A6
	cmp ($D4.b,S),Y		; D3 D4
	sta $B13DCB.l,X		; 9F CB 3D B1
	cpx $644F.w		; EC 4F 64
	jmp ($0D71.w,X)		; 7C 71 0D
	tax		; AA
	rol $F0.b,X		; 36 F0
	cld		; D8
	cmp $91.b,S		; C3 91
	sta [$F6.b],Y		; 97 F6
	sbc [$DB.b]		; E7 DB
	eor $73B261.l		; 4F 61 B2 73
	sty $2D.b		; 84 2D
	jsl $EF2D7A.l		; 22 7A 2D EF
	sbc ($EF.b)		; F2 EF
	ldy $5DEF.w,X		; BC EF 5D
	sta $94.b		; 85 94
	tsa		; 3B
	sta ($82.b,S),Y		; 93 82
	bit $0C.b		; 24 0C
	cpy $4A.b		; C4 4A
	sbc $44CCDC.l		; EF DC CC 44
	mvp $16,$47		; 44 47 16
	stz $F31D.w		; 9C 1D F3
	tsb $B0.b		; 04 B0
	sbc [$99.b]		; E7 99
	php		; 08
	cld		; D8
	adc ($8C.b,S),Y		; 73 8C
	cpy $44.b		; C4 44
	mvp $A3,$8C		; 44 8C A3
	plp		; 28
	cmp #$94.b		; C9 94
	adc $19.b		; 65 19
	lsr $E8.b		; 46 E8
	dex		; CA
	eor [$4A.b],Y		; 57 4A
	sbc #$5D.b		; E9 5D
	lda $4A.b,S		; A3 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $73.b		; A5 73
	ora #$C2.b		; 09 C2
	bvs  96.b		; 70 60
	cmp ($84.b,X)		; C1 84
	sbc #$9D.b		; E9 9D
	bmi -90.b		; 30 A6
	trb $C2.b		; 14 C2
	tya		; 98
	eor ($0A.b,S),Y		; 53 0A
	adc ($4D.b,X)		; 61 4D
	bmi -90.b		; 30 A6
	phd		; 0B
	rtl		; 6B

	eor $7B.b,S		; 43 7B
	txs		; 9A
	ldx $DA.b,Y		; B6 DA
	php		; 08
	dey		; 88
	dey		; 88
	stx $C8.b,Y		; 96 C8
	adc $B456BD.l		; 6F BD 56 B4
	bvs  86.b		; 70 56
	and ($44.b),Y		; 31 44
	mvp $48,$44		; 44 44 48
	dec $FB46.w,X		; DE 46 FB
	cmp $62.b,X		; D5 62
	sta $DEEA.w		; 8D EA DE
	jsl $202222.l		; 22 22 22 20
	sta $A1.b,S		; 83 A1
	adc $24.b,S		; 63 24
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	ldx $5531.w,Y		; BE 31 55
	cmp $AB18.w		; CD 18 AB
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	and $15.b,S		; 23 15
	jmp $9C955A.l		; 5C 5A 95 9C
	beq -63.b		; F0 C1
	ora ($11.b),Y		; 11 11
	ora ($74.b)		; 12 74
	adc ($63.b,X)		; 61 63
	cpx $BF.b		; E4 BF
	adc $ECF793.l,X		; 7F 93 F7 EC
	sbc ($1C.b)		; F2 1C
	mvn $6C,$03		; 54 03 6C
	nop		; EA
	ora $7043.w,X		; 1D 43 70
	mvp $7F,$11		; 44 11 7F
	eor ($FD.b,X)		; 41 FD
	lda [$F3.b],Y		; B7 F3
	sta $BD9F66.l,X		; 9F 66 9F BD
	stx $57EF.w		; 8E EF 57
	ply		; 7A
	jmp ($DD23.w,X)		; 7C 23 DD
	sta $22F80C.l,X		; 9F 0C F8 22
	ror $7BF5.w,X		; 7E F5 7B
	lda $FE8D.w,X		; BD 8D FE
.ACCU 16
	rep #$E7		; C2 E7
	stz $8004.w,X		; 9E 04 80
	bcs -76.b		; B0 B4
	ldy $4C.b,X		; B4 4C
	sbc ($83.b,X)		; E1 83
	bit $44.b		; 24 44
	eor [$C0.b]		; 47 C0
	stz $BA.b,X		; 74 BA
	cmp $4823.w,X		; DD 23 48
	cmp ($31.b)		; D2 31
	ora ($1F.b),Y		; 11 1F
	eor $E9A463.l		; 4F 63 A4 E9
	dec A		; 3A
	pha		; 48
	dey		; 88
	beq -74.b		; F0 B6
	eor $7B9B.w,X		; 5D 9B 7B
	asl A		; 0A
	tax		; AA
	brk $0B.b		; 00 0B
	cmp [$BA.b]		; C7 BA
	adc $2D.b,X		; 75 2D
	beq 106.b		; F0 6A
	iny		; C8
	lsr $86.b		; 46 86
	sta $71.b		; 85 71
	dec $52.b		; C6 52
	asl A		; 0A
	xba		; EB
	cpx #$70.b		; E0 70
	and $31B6.w		; 2D B6 31
	jmp $956B.w		; 4C 6B 95
	ldx $3C.b,Y		; B6 3C
	and [$BE.b]		; 27 BE
	stz $DE.b		; 64 DE
	cpx $D7.b		; E4 D7
	jmp $174521.l		; 5C 21 45 17
	jmp $89271E.l		; 5C 1E 27 89
	and $78A5.w,Y		; 39 A5 78
	cmp $3E.b,S		; C3 3E
	jmp ($A9FF.w)		; 6C FF A9
	txy		; 9B
	dec $B4.b,X		; D6 B4
	rol $17.b		; 26 17
	sbc [$83.b]		; E7 83
	rol $31.b,X		; 36 31
	ldx $DA.b,Y		; B6 DA
	xba		; EB
	cpx $F2.b		; E4 F2
	bvs -77.b		; 70 B3
	sec		; 38
	jsl $65FB46.l		; 22 46 FB 65
	cpy $38C6.w		; CC C6 38
	bra  18.b		; 80 12
	and ($BE.b)		; 32 BE
	sei		; 78
	cmp $88E429.l		; CF 29 E4 88
	dex		; CA
	jmp.w [$9DAA]		; DC AA 9D
	ora ($A2.b,S),Y		; 13 A2
	stz $26.b,X		; 74 26
	.db $82, $91, $BC		; 82 91 BC
	mvp $44,$44		; 44 44 44
	lsr $28E0.w		; 4E E0 28
	plp		; 28
	bit $33.b,X		; 34 33
	lda $7C23.w,Y		; B9 23 7C
	and [$21.b],Y		; 37 21
	clv		; B8
	jsl $792122.l		; 22 22 21 79
	ldy #$82.b		; A0 82
	lsr $8888.w,X		; 5E 88 88
	dey		; 88
	txs		; 9A
	ora #$88A0.w		; 09 A0 88
	dey		; 88
	bit #$627C.w		; 89 7C 62
	tax		; AA
	lda $DB68.w,Y		; B9 68 DB
	sta $1265.w,Y		; 99 65 12
	sed		; F8
	dey		; 88
	cmp $95.b,X		; D5 95
	eor $4A5D.w		; 4D 5D 4A
	tya		; 98
	cmp $D0.b		; C5 D0
	tyx		; BB
	stz $68.b,X		; 74 68
	stp		; DB
	adc $11F1.w		; 6D F1 11
	trb $C76B.w		; 1C 6B C7
	sta $258F.w,Y		; 99 8F 25
	sta ($A1.b,S),Y		; 93 A1
	lda $3965.w,Y		; B9 65 39
	inc $42B7.w		; EE B7 42
	jsl $526535.l		; 22 35 65 52
	cmp ($57.b),Y		; D1 57
	lsr $F36A.w		; 4E 6A F3
	stz $6F.b,X		; 74 6F
	lda $EBE8D1.l,X		; BF D1 E8 EB
	ply		; 7A
	adc $8B6F.w		; 6D 6F 8B
	lda $28F2.w		; AD F2 28
	sta $5998.w,X		; 9D 98 59
	tsa		; 3B
	bit $7657.w,X		; 3C 57 76
	sbc $F327.w,X		; FD 27 F3
	ora $CA5B5D.l,X		; 1F 5D 5B CA
	sbc $5F.b		; E5 5F
	sta $FC.b		; 85 FC
	ldy $D671.w		; AC 71 D6
	cmp [$D6.b],Y		; D7 D6
	cmp [$5B.b]		; C7 5B
	eor $B87238.l,X		; 5F 38 72 B8
	and $AE9C.w		; 2D 9C AE
	phd		; 0B
	tad		; 5B
	adc ($5B.b,S),Y		; 73 5B
	adc ($A1.b,S),Y		; 73 A1
	jmp ($1B7D.w,X)		; 7C 7D 1B
	sbc ($72.b,X)		; E1 72
	and $FC17.w,Y		; 39 17 FC
	ora ($BE.b,X)		; 01 BE
	and [$C6.b],Y		; 37 C6
	stz $77.b,X		; 74 77
	and $77C7.w,X		; 3D C7 77
	cpx $1CB9.w		; EC B9 1C
	and $75DA81.l,X		; 3F 81 DA 75
	bit $11.b,X		; 34 11
	jsr ($177D.w,X)		; FC 7D 17
	tax		; AA
	stp		; DB
	nop		; EA
	ldx $FA.b,Y		; B6 FA
	lda $ABBE.w		; AD BE AB
	adc $EADBAA.l		; 6F AA DB EA
	ldx $FF.b,Y		; B6 FF
	sbc $077DEB.l,X		; FF EB 7D 07
	sta [$4F.b]		; 87 4F
	adc [$08.b],Y		; 77 08
	eor ($DD.b,S),Y		; 53 DD
	cmp $E1.b,S		; C3 E1
	eor ($4C.b,S),Y		; 53 4C
	rol $3D15.w,X		; 3E 15 3D
	jmp.w [$B921]		; DC 21 B9
	phx		; DA
	ror $734F.w		; 6E 4F 73
	ldy $DC.b,X		; B4 DC
	inc $7B.b,X		; F6 7B
	stx $B3E7.w		; 8E E7 B3
	jmp.w [$37ED]		; DC ED 37
	rol $57.b		; 26 57
	sta [$50.b]		; 87 50
	lda $5EA10E.l		; AF 0E A1 5E
	ora $BC42.w,X		; 1D 42 BC
	and [$1C.b],Y		; 37 1C
	lsr $C5A9.w,X		; 5E A9 C5
	nop		; EA
	stz $A95E.w		; 9C 5E A9
	cmp $A4.b		; C5 A4
	mvp $44,$44		; 44 44 44
	eor $11.b		; 45 11
	ora ($11.b),Y		; 11 11
	ora ($32.b)		; 12 32
	sty $28A3.w		; 8C A3 28
	dex		; CA
	and ($8C.b)		; 32 8C
	lda $28.b,S		; A3 28
	dex		; CA
	eor [$4A.b],Y		; 57 4A
	sbc #$2B5D.w		; E9 5D 2B
	lda $74.b		; A5 74
	ldx $D295.w		; AE 95 D2
	tsx		; BA
	stz $B4.b,X		; 74 B4
	ldy $34.b,X		; B4 34
	jsl $0A5322.l		; 22 22 53 0A
	adc ($46.b,X)		; 61 46
	stx $6E68.w		; 8E 68 6E
	jsl $D42623.l		; 22 23 26 D4
	eor ($11.b,X)		; 41 11
	ora $DA36.w,Y		; 19 36 DA
	ora ($45.b,X)		; 01 45
	ora ($79.b,X)		; 01 79
	and ($15.b),Y		; 31 15
	ora ($89.b)		; 12 89
	dey		; 88
	dey		; 88
	tay		; A8
	cop $D7.b		; 02 D7
	cli		; 58
	asl $02.b		; 06 02
	ldx #$25.b		; A2 25
	sei		; 78
	dey		; 88
	txa		; 8A
	bra  42.b		; 80 2A
	sbc ($78.b),Y		; F1 78
	lda ($45.b,X)		; A1 45
	asl A		; 0A
	dey		; 88
	bit #$E3C5.w		; 89 C5 E3
	ora $5013.w		; 0D 13 50
	ora $CF.b		; 05 CF
	dec A		; 3A
	plp		; 28
	ldx $B2BC.w		; AE BC B2
	mvn $CE,$44		; 54 44 CE
	trb $4E.b		; 14 4E
	ldy $A972.w,X		; BC 72 A9
	rti		; 40

	and [$3E.b]		; 27 3E
	and [$13.b]		; 27 13
	tsb $1500.w		; 0C 00 15
	ora ($74.b)		; 12 74
	adc ($38.b),Y		; 71 38
	sed		; F8
	cli		; 58
	jsl $D085A6.l		; 22 A6 85 D0
	mvn $54,$44		; 54 44 54
	eor ($11.b,X)		; 41 11
	ora ($50.b),Y		; 11 50
	brk $88.b		; 00 88
	stz $F4ED.w		; 9C ED F4
	lda $4154.w		; AD 54 41
	ora ($11.b),Y		; 11 11
	bvc  13.b		; 50 0D
	.db $42, $F3		; 42 F3
	ora ($33.b,S),Y		; 13 33
	and ($51.b),Y		; 31 51
	and $B6.b,X		; 35 B6
	tsb $44.b		; 04 44
	mvn $33,$01		; 54 01 33
	stx $55.b		; 86 55
	adc $57.b		; 65 57
	ora ($0A.b)		; 12 0A
	dey		; 88
	jsl $012A22.l		; 22 22 2A 01
	jmp ($C6AB.w)		; 6C AB C6
	ldy $CAAA.w		; AC AA CA
	ldy $1055.w,X		; BC 55 10
	mvp $54,$44		; 44 44 54
	cop $F2.b		; 02 F2
	mvp $18,$89		; 44 89 18
	asl A		; 0A
	bit #$4243.w		; 89 43 42
	jsl $FE012A.l		; 22 2A 01 FE
	lda $8317.w		; AD 17 83
	cmp ($F6.b,X)		; C1 F6
	phx		; DA
	and $BB68E3.l		; 2F E3 68 BB
	cmp $A2EA.w,X		; DD EA A2
	adc $3FE5C1.l,X		; 7F C1 E5 3F
	ldx $5BFF.w,Y		; BE FF 5B
	sbc $0055.w		; ED 55 00
	cli		; 58
	dec $DB.b		; C6 DB
	adc [$5B.b],Y		; 77 5B
	lda #$5149.w		; A9 49 51
	asl $F6.b		; 06 F6
	eor $50B54D.l		; 4F 4D B5 50
	ora $7CD1E5.l		; 0F E5 D1 7C
	and $73730F.l,X		; 3F 0F 73 73
	bit $B5F5.w,X		; 3C F5 B5
	sta $13.b,X		; 95 13
	ldx $CF.b,Y		; B6 CF
	cmp ($67.b),Y		; D1 67
	ora #$E6C1.w		; 09 C1 E6
	rol A		; 2A
	ora ($93.b,X)		; 01 93
	txy		; 9B
	txy		; 9B
	cmp $8A.b		; C5 8A
	tax		; AA
	jsl $A23722.l		; 22 22 37 A2
	txs		; 9A
	ora $0B23.w,Y		; 19 23 0B
	beq  84.b		; F0 54
	eor ($19.b,X)		; 41 19
	tad		; 5B
	sta $98.b		; 85 98
	cli		; 58
	ldy #$0E.b		; A0 0E
	.db $82, $02, $08		; 82 02 08
	dey		; 88
	txa		; 8A
	bra 101.b		; 80 65
	lda $8D96.w,Y		; B9 96 8D
	lda $8D96.w,Y		; B9 96 8D
	clv		; B8
	tay		; A8
	sta $75.b,X		; 95 75
	rol A		; 2A
	ror A		; 6A
	nop		; EA
	mvn $D4,$D5		; 54 D5 D4
	bvc  14.b		; 50 0E
	ldx $7E3D.w,Y		; BE 3D 7E
	sta $BF1E.w		; 8D 1E BF
	lsr $8A.b		; 46 8A
	ldx #$37.b		; A2 37
	lda $FBBD65.l,X		; BF 65 BD FB
	and $01EA.w		; 2D EA 01
	tsx		; BA
.ACCU 8
	sep #$EE		; E2 EE
	ldy $6E.b,X		; B4 6E
	rol $46EB.w		; 2E EB 46
	txa		; 8A
	ldx #$47.b		; A2 47
	sta $4E57.w		; 8D 57 4E
	bit $BA6A.w,X		; 3C 6A BA
	adc ($BD.b),Y		; 71 BD
	rti		; 40

	and $BD.b,X		; 35 BD
	and $BBF363.l		; 2F 63 F3 BB
	ora $C77E.w,X		; 1D 7E C7
	sta ($6D.b,X)		; 81 6D
	tax		; AA
	dey		; 88
	sbc $6DF5E1.l,X		; FF E1 F5 6D
	cmp $40C97C.l		; CF 7C C9 40
	and $B1.b,X		; 35 B1
	dec $D7.b,X		; D6 D7
	dec $C7.b,X		; D6 C7
	tad		; 5B
	sbc $2A.b,S		; E3 2A
	ldx #$35.b		; A2 35
	lda [$35.b],Y		; B7 35
	ldx $14BD.w,Y		; BE BD 14
	cop $FE.b		; 02 FE
	eor $FF.b		; 45 FF
	cop $FE.b		; 02 FE
	eor $FF.b		; 45 FF
	cop $FE.b		; 02 FE
	.db $42, $A2		; 42 A2
	adc ($38.b)		; 72 38
	adc $E4B403.l,X		; 7F 03 B4 E4
	bvs  -2.b		; 70 FE
	ora [$69.b]		; 07 69
	iny		; C8
	sbc ($A8.b,X)		; E1 A8
	ora $AD.b		; 05 AD
	tsx		; BA
	and ($6E.b,S),Y		; 33 6E
	sty $26AA.w		; 8C AA 26
	asl $6A.b,X		; 16 6A
	cpx $6661.w		; EC 61 66
	ldx $16C6.w		; AE C6 16
	plp		; 28
	ora $A1.b,S		; 03 A1
	adc $88AA.w,Y		; 79 AA 88
	jsl $D40C23.l		; 22 23 0C D4
	cop $4C.b		; 02 4C
	txy		; 9B
	cmp ($15.b),Y		; D1 15
	mvp $56,$B6		; 44 B6 56
	dex		; CA
	and [$A2.b],Y		; 37 A2
	plp		; 28
	brk $88.b		; 00 88
	sty $3417.w		; 8C 17 34
	mvp $46,$44		; 44 44 46
	ora $01E6.w,Y		; 19 E6 01
	ora $4D46.w,Y		; 19 46 4D
	sbc $88E8.w		; ED E8 88
	sta ($BA.b)		; 92 BA
	eor [$5F.b],Y		; 57 5F
	lda $9A.b,S		; A3 9A
	asl $88.b,X		; 16 88
	dey		; 88
	sta $130D.w		; 8D 0D 13
	sta ($A1.b,X)		; 81 A1
	ldy $68.b,X		; B4 68
	beq -91.b		; F0 A5
	ora ($1B.b),Y		; 11 1B
	lsr $73.b,X		; 56 73
	cmp $00B23C.l		; CF 3C B2 00
	phd		; 0B
	adc $2292.w		; 6D 92 22
	plp		; 28
	dey		; 88
	plb		; AB
	ora $731F.w,X		; 1D 1F 73
	bvs   0.b		; 70 00
	trb $6E.b		; 14 6E
	cmp [$E0.b],Y		; D7 E0
	sbc ($B6.b)		; F2 B6
	lda [$88.b],Y		; B7 88
	dey		; 88
	tyx		; BB
	tsa		; 3B
	bit $54AE.w,X		; 3C AE 54
	ror $007C.w		; 6E 7C 00
	brk $5D.b		; 00 5D
	rol $5D97.w,X		; 3E 97 5D
	cmp $FD8D.w		; CD 8D FD
	and ($11.b,X)		; 21 11
	ora $55.b,X		; 15 55
	sta $FC.b,S		; 83 FC
	rti		; 40

	brk $A2.b		; 00 A2
	and $F4C3.w,Y		; 39 C3 F4
	cpx #$88.b		; E0 88
	stx $8086.w		; 8E 86 80
	cop $88.b		; 02 88
	dey		; 88
	ldx #$23.b		; A2 23
	lda ($7E.b,X)		; A1 7E
	and ($00.b)		; 32 00
	asl A		; 0A
	dec A		; 3A
	tad		; 5B
	tda		; 7B
	cmp $30AB.w		; CD AB 30
	mvp $E7,$45		; 44 45 E7
	sbc ($F9.b,S),Y		; F3 F9
	stz $4FCE.w		; 9C CE 4F
	rol $AA.b		; 26 AA
	bra   1.b		; 80 01
	eor [$77.b]		; 47 77
	cmp ($DE.b),Y		; D1 DE
	adc $9255.w		; 6D 55 92
	jsl $A3472F.l		; 22 2F 47 A3
	cmp $FFFCE7.l		; CF E7 FC FF
	lda #$C7.b		; A9 C7
	inc $0020.w,X		; FE 20 00
	eor ($DD.b),Y		; 51 DD
	stz $FA.b,X		; 74 FA
	cmp $F1AD1B.l		; CF 1B AD F1
	ora ($11.b),Y		; 11 11
	bne -69.b		; D0 BB
	bvc   0.b		; 50 00
	phy		; 5A
	phy		; 5A
	dec $7644.w,X		; DE 44 76
	and $4744.w		; 2D 44 47
	eor $40.b,S		; 43 40
	ora ($46.b,X)		; 01 46
	pea $A264.w		; F4 64 A2
	and $A1.b,S		; 23 A1
	jmp ($0094.w,X)		; 7C 94 00
	trb $44.b		; 14 44
	eor $11.b		; 45 11
	ora [$3E.b],Y		; 17 3E
	adc ($92.b,S),Y		; 73 92
	tay		; A8
	brk $2D.b		; 00 2D
	sta $8A48.w		; 8D 48 8A
	jsl $FDA32E.l		; 22 2E A3 FD
	eor ($E8.b),Y		; 51 E8
	inc $980B.w,X		; FE 0B 98
	brk $3A.b		; 00 3A
	ora [$15.b],Y		; 17 15
	ora ($16.b),Y		; 11 16
	ldy $3BB9.w		; AC B9 3B
	tad		; 5B
	trb $92F7.w		; 1C F7 92
	brk $0A.b		; 00 0A
	lda ($72.b,S),Y		; B3 72
	adc ($51.b),Y		; 71 51
	ora ($D0.b),Y		; 11 D0
	bne   0.b		; D0 00
	eor ($11.b),Y		; 51 11
	.db $82, $88, $8E		; 82 88 8E
	stx $80.b		; 86 80
	cop $C1.b		; 02 C1
	lda $55.b,X		; B5 55
	mvp $43,$47		; 44 47 43
	rti		; 40

	ora ($D0.b,X)		; 01 D0
	sbc ($11.b,X)		; E1 11
	bne -48.b		; D0 D0
	brk $55.b		; 00 55
	jmp $4414DC.l		; 5C DC 14 44
	stz $34.b,X		; 74 34
	brk $15.b		; 00 15
	stz $88.b		; 64 88
	ldx #$22.b		; A2 22
	lda $E5B8.w,Y		; B9 B8 E5
	cmp ($CF.b)		; D2 CF
	ldx #$00.b		; A2 00
	phd		; 0B
	asl $B7.b		; 06 B7
	eor $68DE2D.l		; 4F 2D DE 68
	dey		; 88
	lda $D69F2F.l		; AF 2F 9F D6
	sbc [$FE.b],Y		; F7 FE
	plb		; AB
	lda $0040FB.l		; AF FB 40 00
	tyx		; BB
	sbc [$C4.b],Y		; F7 C4
	sbc [$FC.b]		; E7 FC
	inc $CFFF.w,X		; FE FF CF
	adc $E8.b,X		; 75 E8
	dey		; 88
	lda ($55.b,S),Y		; B3 55
	mvn $14,$00		; 54 00 14
	mvp $11,$45		; 44 45 11
	trb $7A.b		; 14 7A
	tas		; 1B
	tad		; 5B
	eor $E05A4E.l,X		; 5F 4E 5A E0
	brk $A3.b		; 00 A3
	ldy $267D.w,X		; BC 7D 26
	cmp $D2.b,X		; D5 D2
	mvp $1B,$45		; 44 45 1B
	adc $F4.b		; 65 F4
	adc $F145.w,X		; 7D 45 F1
	brk $05.b		; 00 05
	tas		; 1B
	eor $DFA2A3.l,X		; 5F A3 A2 DF
	ply		; 7A
	jsl $67552E.l		; 22 2E 55 67
	ora $3BF7.w		; 0D F7 3B
	adc $D3.b,X		; 75 D3
	brk $05.b		; 00 05
	eor [$1B.b]		; 47 1B
	and [$D5.b],Y		; 37 D5
	ror $1191.w		; 6E 91 11
	phk		; 4B
	wai		; CB
	cmp #$12.b		; C9 12
	brk $05.b		; 00 05
	ldx $C637.w,Y		; BE 37 C6
	lsr $CA.b,X		; 56 CA
	pei ($44.b)		; D4 44
	eor ($41.b,S),Y		; 53 41
	ora $11.b,X		; 15 11
	ora ($44.b),Y		; 11 44
	lsr $70.b		; 46 70
	sta ($A1.b,X)		; 81 A1
	sbc ($9C.b,S),Y		; F3 9C
	ora ($11.b),Y		; 11 11
	mvp $46,$44		; 44 44 46
	inc $F8.b,X		; F6 F8
	jmp.w [$6D68]		; DC 68 6D
	plx		; FA
	and $9CD2.w,X		; 3D D2 9C
	and [$09.b]		; 27 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	stz $3018.w		; 9C 18 30
	stz $4C21.w		; 9C 21 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
	cmp ($0A.b,S),Y		; D3 0A
	adc ($4C.b,X)		; 61 4C
	and ($CB.b)		; 32 CB
	asl $80A7.w		; 0E A7 80
	dec $DEDE.w,X		; DE DE DE
	cpx #$E9E6.w		; E0 E6 E9
	pea $C1BF.w		; F4 BF C1
	sbc $8DB2FD.l,X		; FF FD B2 8D
	sbc ($BE.b),Y		; F1 BE
	and [$D9.b],Y		; 37 D9
	sty $33.b		; 84 33
	sbc ($C7.b,X)		; E1 C7
	cpx $E8BF.w		; EC BF E8
	sta $B11E19.l		; 8F 19 1E B1
	lda $B5.b,X		; B5 B5
	sta $94EE.w		; 8D EE 94
	sei		; 78
	sbc $B909.w		; ED 09 B9
	dec $65.b,X		; D6 65
	adc $5FB7D4.l		; 6F D4 B7 5F
	xce		; FB
	and $A3F0.w		; 2D F0 A3
	sbc ($3F.b,X)		; E1 3F
	eor #$4E96.w		; 49 96 4E
	pei ($F6.b)		; D4 F6
	sbc ($E8.b,S),Y		; F3 E8
	asl $E229.w,X		; 1E 29 E2
	cmp $49E5.w,X		; DD E5 49
	stx $33.b,Y		; 96 33
	cmp ($C9.b,X)		; C1 C9
	adc $0D3F3F.l,X		; 7F 3F 3F 0D
	sbc $AF.b,X		; F5 AF
	inx		; E8
	lda $BF.b		; A5 BF
	adc $0F9F8B.l		; 6F 8B 9F 0F
	cmp ($7F.b)		; D2 7F
	mvp $FC,$3C		; 44 3C FC
	rol $3D34.w,X		; 3E 34 3D
	jsr ($8733.w,X)		; FC 33 87
	eor $716F.w,X		; 5D 6F 71
	cmp $F9.b		; C5 F9
	trb $D83B.w		; 1C 3B D8
	dec $9788.w,X		; DE 88 97
	sty $44.b		; 84 44
	mvp $63,$44		; 44 44 63
	adc $41E0.w,X		; 7D E0 41
	dec $B4.b		; C6 B4
	mvp $AB,$B0		; 44 B0 AB
	asl A		; 0A
	and ($11.b)		; 32 11
	ora ($1C.b),Y		; 11 1C
	bit $D5DE.w		; 2C DE D5
	tsx		; BA
	ldx #$F34D.w		; A2 4D F3
	sbc $C37FDA.l,X		; FF DA 7F C3
	ora $855B.w,Y		; 19 5B 85
	tya		; 98
	eor $6D2B.w,Y		; 59 2B 6D
	sta [$17.b],Y		; 97 17
	sta $FEE5.w		; 8D E5 FE
	sbc $5759.w,X		; FD 59 57
	sta $5998.w		; 8D 98 59
	sta $B2.b		; 85 B2
	xba		; EB
	dec A		; 3A
	cmp $FFA26B.l		; CF 6B A2 FF
	adc [$4B.b]		; 67 4B
	eor $F18D.w		; 4D 8D F1
	inc $FF08.w,X		; FE 08 FF
	cmp ($3F.b)		; D2 3F
	phd		; 0B
	ldy $BDF1.w		; AC F1 BD
	lda $B4F4F0.l		; AF F0 F4 B4
	cmp ($3A.b),Y		; D1 3A
	ora [$DA.b]		; 07 DA
	rol $DCA9.w,X		; 3E A9 DC
	lda [$3A.b],Y		; B7 3A
	dec $CEF5.w		; CE F5 CE
	lda #$7DFA.w		; A9 FA 7D
	lda $F1B77F.l,X		; BF 7F B7 F1
	sta ($B9.b),Y		; 91 B9
	dec $77.b,X		; D6 77
	ldx $3397.w		; AE 97 33
	adc $FE.b,X		; 75 FE
	cli		; 58
	ror $2C64.w,X		; 7E 64 2C
	rtl		; 6B

	adc #$EE7A.w		; 69 7A EE
	adc [$03.b],Y		; 77 03
	lda $7D4E44.l,X		; BF 44 4E 7D
	sta $457E.w		; 8D 7E 45
	adc $9FCF72.l,X		; 7F 72 CF 9F
	pla		; 68
	dey		; 88
	lda $C3E8.w		; AD E8 C3
	tsa		; 3B
	stz $88.b		; 64 88
	sta $7A.b,S		; 83 7A
	jsl $7A2322.l		; 22 22 23 7A
	and $9C.b,S		; 23 9C
	ora ($11.b),Y		; 11 11
	tsb $44.b		; 04 44
	mvp $55,$44		; 44 44 55
	rts		; 60

	sty $44E8.w		; 8C E8 44
	eor ($11.b,X)		; 41 11
	ora ($11.b),Y		; 11 11
	ora $55.b,X		; 15 55
	phb		; 8B
	dec $3D.b,X		; D6 3D
	pei ($7B.b)		; D4 7B
	tay		; A8
	sbc ($67.b,X)		; E1 67
	lda #$DA62.w		; A9 62 DA
	sbc [$0F.b],Y		; F7 0F
	cli		; 58
	nop		; EA
	dec A		; 3A
	dey		; 88
	inx		; E8
	adc [$25.b],Y		; 77 25
	cmp [$57.b],Y		; D7 57
	asl $4E.b		; 06 4E
	and $DEF37E.l		; 2F 7E F3 DE
	phk		; 4B
	ldx $2DE8.w		; AE E8 2D
	tad		; 5B
	ror A		; 6A
	lda $962E.w,X		; BD 2E 96
	dec $4FDF.w,X		; DE DF 4F
	lda [$F6.b]		; A7 F6
	stz $5C.b,X		; 74 5C
	sbc ($74.b,S),Y		; F3 74
	tas		; 1B
	stp		; DB
	stp		; DB
	cmp $5DD9.w,Y		; D9 D9 5D
	cmp $41C7.w		; CD C7 41
	tsb $9DDC.w		; 0C DC 9D
	ora $66C9CD.l		; 0F CD C9 66
	cmp $6C3EA7.l		; CF A7 3E 6C
	sed		; F8
	cmp ($44.b,S),Y		; D3 44
	lsr $6C.b		; 46 6C
	plx		; FA
	adc ($E6.b,S),Y		; 73 E6
	cmp $273A8D.l		; CF 8D 3A 27
	mvp $1F,$C5		; 44 C5 1F
	cli		; 58
	inc $F1FB.w,X		; FE FB F1
	asl $FCED.w,X		; 1E ED FC
	ldy $DA.b,X		; B4 DA
	dec $CB27.w,X		; DE 27 CB
	and $ECB1.w,X		; 3D B1 EC
	eor $717C64.l		; 4F 64 7C 71
	ora $AEA7.w		; 0D A7 AE
	xce		; FB
	lda $FEC45F.l,X		; BF 5F C4 FE
	and $78EC13.l		; 2F 13 EC 78
	sta $DCAF.w,X		; 9D AF DC
	xce		; FB
	eor #$9B33.w		; 49 33 9B
	adc [$A1.b]		; 67 A1
	xba		; EB
	lda $E87D4F.l,X		; BF 4F 7D E8
	and [$DE.b],Y		; 37 DE
	sbc $BAE77D.l,X		; FF 7D E7 BA
	inc $826D.w		; EE 6D 82
	txs		; 9A
	jmp.w [$3BC1]		; DC C1 3B
	adc ($CD.b,S),Y		; 73 CD
	ora $4895DD.l,X		; 1F DD 95 48
	tsx		; BA
	phx		; DA
	cmp ($DD.b,X)		; C1 DD
	asl $E739.w,X		; 1E 39 E7
	tsb $A9B2.w		; 0C B2 A9
	cpx $70.b		; E4 70
	sbc ($86.b,S),Y		; F3 86
	lda [$33.b],Y		; B7 33
	eor ($FA.b,S),Y		; 53 FA
	adc [$DD.b],Y		; 77 DD
	adc $D9FEA2.l,X		; 7F A2 FE D9
	tad		; 5B
	pld		; 2B
	adc $8C1C.w,Y		; 79 1C 8C
	sbc ($D6.b,S),Y		; F3 D6
	dec $FC.b,X		; D6 FC
	cmp $B34F.w,X		; DD 4F B3
	ldx $56F4.w,Y		; BE F4 56
	cmp #$2D16.w		; C9 16 2D
	lda ($D7.b),Y		; B1 D7
	sbc ($6B.b,X)		; E1 6B
	cmp $BD1111.l,X		; DF 11 11 BD
	sta ($74.b,S),Y		; 93 74
	ror $E88D.w		; 6E 8D E8
	dey		; 88
	wai		; CB
	inc $ED.b		; E6 ED
	jmp ($7BFF.w,X)		; 7C FF 7B
	cmp $1811.w		; CD 11 18
	adc [$6C.b]		; 67 6C
	tyx		; BB
	and #$AD7A.w		; 29 7A AD
	ldx $11B9.w		; AE B9 11
	ora ($13.b),Y		; 11 13
	plx		; FA
	cmp $CB2DB9.l		; CF B9 2D CB
	eor ($ED.b,S),Y		; 53 ED
	inc $3C.b,X		; F6 3C
	adc $F91FF5.l		; 6F F5 1F F9
	and $13FC18.l,X		; 3F 18 FC 13
	sbc [$CA.b]		; E7 CA
	pei ($44.b)		; D4 44
	lsr $9E.b		; 46 9E
	sta $3D.b,X		; 95 3D
	stz $753E.w		; 9C 3E 75
	adc $79ED.w,Y		; 79 ED 79
	lsr $C9.b		; 46 C9
	stp		; DB
	and [$98.b]		; 27 98
	lda [$E5.b]		; A7 E5
	cmp ($F9.b,S),Y		; D3 F9
	trb $D7.b		; 14 D7
	tyx		; BB
	phx		; DA
	iny		; C8
	cpy $98.b		; C4 98
	tya		; 98
	clc		; 18
	clc		; 18
	sbc ($BE.b,X)		; E1 BE
	dec $BB.b		; C6 BB
	stz $32.b		; 64 32
	lda [$0B.b],Y		; B7 0B
	bmi -77.b		; 30 B3
	inc A		; 1A
	sbc ($82.b,S),Y		; F3 82
	phy		; 5A
	ora ($80.b,X)		; 01 80
	ora $16.b,X		; 15 16
	eor [$C2.b],Y		; 57 C2
	cmp $B2F0F2.l,X		; DF F2 F0 B2
	ora $21DB.w,Y		; 19 DB 21
	plb		; AB
	pld		; 2B
	bmi -115.b		; 30 8D
	sbc $0418.w,Y		; F9 18 04
	phd		; 0B
	rti		; 40

	tsb $AD25.w		; 0C 25 AD
	cmp ($FE.b,X)		; C1 FE
	and $666E.w,X		; 3D 6E 66
	sbc [$9F.b],Y		; F7 9F
	cmp #$08E1.w		; C9 E1 08
	sbc ($66.b,X)		; E1 66
	and $F1.b,X		; 35 F1
	and ($69.b,X)		; 21 69
	adc ($5D.b,X)		; 61 5D
	sbc ($BA.b),Y		; F1 BA
	and [$46.b],Y		; 37 46
	inx		; E8
	cmp $A31B.w,X		; DD 1B A3
	plp		; 28
	cmp #$E9BA.w		; C9 BA E9
	eor $A52B.w,X		; 5D 2B A5
	stz $AE.b,X		; 74 AE
	sty $AE.b,X		; 94 AE
	sta $D2.b,X		; 95 D2
	tsx		; BA
	bvs 105.b		; 70 69
	adc #$6969.w		; 69 69 69
	sta $8433.w,X		; 9D 33 84
	sbc ($4C.b,X)		; E1 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
.INDEX 16
	rep #$14		; C2 14
	inx		; E8
	mvp $4C,$5E		; 44 5E 4C
	ply		; 7A
	and $E7.b,X		; 35 E7
	ora #$91D0.w		; 09 D0 91
	and $44BC.w		; 2D BC 44
	mvp $F8,$46		; 44 46 F8
	cmp $AA6A.w,X		; DD 6A AA
	sbc ($16.b),Y		; F1 16
	ror $A8A3.w		; 6E A3 A8
	sta $EAC3.w,X		; 9D C3 EA
	eor $46BC.w,Y		; 59 BC 46
	ror $A8A3.w		; 6E A3 A8
	sta $2E274B.l		; 8F 4B 27 2E
	stp		; DB
	php		; 08
	cmp #$6726.w		; C9 26 67
	lsr $50.b		; 46 50
	cmp $C9.b		; C5 C9
	lda $1AB9.w,Y		; B9 B9 1A
	and [$4E.b]		; 27 4E
	ply		; 7A
	eor $BD70.w,Y		; 59 70 BD
	lda $1FF6B4.l		; AF B4 F6 1F
	rol $73CF.w,X		; 3E CF 73
	ror $759C.w		; 6E 9C 75
	and ($EB.b,S),Y		; 33 EB
	sbc ($E5.b)		; F2 E5
	sbc $FD.b,S		; E3 FD
	jmp.w [$072F]		; DC 2F 07
	sta $AB.b,S		; 83 AB
	pld		; 2B
	lda $A581BC.l		; AF BC 81 A5
	ora $A23A.w		; 0D 3A A2
	lda $E7.b,S		; A3 E7
	sta $477BC9.l,X		; 9F C9 7B 47
	cmp $813E.w,Y		; D9 3E 81
	ora ($3E.b,X)		; 01 3E
	cmp ($F2.b),Y		; D1 F2
	sta $677780.l		; 8F 80 77 67
	cld		; D8
	ora ($09.b,S),Y		; 13 09
	sbc $5F.b		; E5 5F
	sta $DB.b,X		; 95 DB
	sbc $0C7B.w		; ED 7B 0C
	tda		; 7B
	jmp ($FC7A.w,X)		; 7C 7A FC
	sbc $CAA4.w,X		; FD A4 CA
	tsb $E84E.w		; 0C 4E E8
	sbc $FBE80E.l		; EF 0E E8 FB
	and [$FB.b]		; 27 FB
	lda [$7B.b],Y		; B7 7B
	tad		; 5B
	cpy $89AA.w		; CC AA 89
	adc $4BF6.w		; 6D F6 4B
	sta ($87.b,S),Y		; 93 87
	adc [$8F.b]		; 67 8F
	eor $9D5797.l,X		; 5F 97 57 9D
	eor $1B5F.w,Y		; 59 5F 1B
	lda $B3D5.w		; AD D5 B3
	eor ($BD.b)		; 52 BD
	dec A		; 3A
	ldy $A1.b,X		; B4 A1
	eor $EE11.w		; 4D 11 EE
	sbc $FE.b,S		; E3 FE
	cpx $CE.b		; E4 CE
	ora ($A2.b,S),Y		; 13 A2
	stz $C9.b		; 64 C9
	stz $E311.w,X		; 9E 11 E3
	sta ($BC.b),Y		; 91 BC
	cpy $139D.w		; CC 9D 13
	ldx #$4F74.w		; A2 74 4F
	adc $780FFE.l		; 6F FE 0F 78
	sta ($BD.b),Y		; 91 BD
.ACCU 8
.INDEX 8
	sep #$B9		; E2 B9
	ldy $5F16.w,X		; BC 16 5F
	plb		; AB
	ora $55565B.l		; 0F 5B 56 55
	ora ($E2.b),Y		; 11 E2
	lda $16BC.w,Y		; B9 BC 16
	lsr A		; 4A
	jsl $8CCE4C.l		; 22 4C CE 8C
	adc ($CD.b,X)		; 61 CD
	lda $44B0B9.l		; AF B9 B0 44
	pla		; 68
	sta $EE39.w,X		; 9D 39 EE
	sbc ($D4.b),Y		; F1 D4
	cmp $83.b,S		; C3 83
	ror $AA44.w,X		; 7E 44 AA
	and $DFA9.w		; 2D A9 DF
	lda ($4C.b)		; B2 4C
	sbc ($85.b,X)		; E1 85
	eor $E56F.w,Y		; 59 6F E5
	jsr $2000.w		; 20 00 20
	adc $2A02A0.l		; 6F A0 02 2A
	jsl $343151.l		; 22 51 31 34
	dec A		; 3A
	adc $13.b		; 65 13
	lsr A		; 4A
	iny		; C8
	.db $62, $67, $83		; 62 67 83
	lda $4D77.w,X		; BD 77 4D
	asl $0E.b,X		; 16 0E
	and $EE.b,X		; 35 EE
	sbc ($00.b,X)		; E1 00
	brk $30.b		; 00 30
	and ($83.b,S),Y		; 33 83
	eor $06.b,S		; 43 06
	plb		; AB
	rtl		; 6B

	lda $F4D267.l		; AF 67 D2 F4
	ror $6366.w,X		; 7E 66 63
	eor $06.b,S		; 43 06
	lda [$99.b]		; A7 99
	adc $DB95.w		; 6D 95 DB
	sbc #$6D.b		; E9 6D
	cpx $045D.w		; EC 5D 04
	jmp ($D0B1.w)		; 6C B1 D0
	lsr A		; 4A
	cmp [$41.b]		; C7 41
	trb $CB71.w		; 1C 71 CB
	eor [$DA.b]		; 47 DA
	phx		; DA
	sbc [$73.b]		; E7 73
	lda $953C.w,Y		; B9 3C 95
	eor [$15.b],Y		; 57 15
	eor $9C.b,X		; 55 9C
	plx		; FA
	adc $BB3F.w,X		; 7D 3F BB
	cmp $331BFC.l		; CF FC 1B 33
	eor $57.b,X		; 55 57
	adc [$A0.b]		; 67 A0
	pea $F7E7.w		; F4 E7 F7
	adc ($DF.b,S),Y		; 73 DF
	adc $93.b		; 65 93
	phb		; 8B
	stx $32.b		; 86 32
	pld		; 2B
	inc A		; 1A
	jmp.w [$C551]		; DC 51 C5
	cmp ($E6.b,X)		; C1 E6
	adc $89.b,S		; 63 89
	lda ($88.b,X)		; A1 88
	bra  34.b		; 80 22
	ldx #$22.b		; A2 22
	and #$A1.b		; 29 A1
	stp		; DB
	ply		; 7A
	tad		; 5B
	adc [$A9.b]		; 67 A9
	and ($23.b,X)		; 21 23
	and #$6D.b		; 29 6D
	sbc $B6E1F6.l		; EF F6 E1 B6
	adc $6DE9.w		; 6D E9 6D
	sbc $530F.w,X		; FD 0F 53
	cld		; D8
.ACCU 16
	rep #$A3		; C2 A3
	pha		; 48
	cmp ($34.b)		; D2 34
	sta $6FC3.w		; 8D C3 6F
	lda $786D.w		; AD 6D 78
	ldx $EA.b,Y		; B6 EA
	eor $23.b,X		; 55 23
	pld		; 2B
	cmp ($EB.b),Y		; D1 EB
	tad		; 5B
	lsr $E02B.w,X		; 5E 2B E0
	stp		; DB
	lda $36A0AA.l,X		; BF AA A0 36
	eor $B87EB7.l		; 4F B7 7E B8
	dey		; 88
	stx $06.b,Y		; 96 06
	ora $7A.b,S		; 03 7A
	jsl $968523.l		; 22 23 85 96
	trb $111B.w		; 1C 1B 11
	ora ($11.b),Y		; 11 11
	brk $44.b		; 00 44
	mvp $52,$44		; 44 44 52
	ora $22A2.w,Y		; 19 A2 22
	jsl $888800.l		; 22 00 88 88
	dey		; 88
	ldx #$22.b		; A2 22
	jsl $11E125.l		; 22 25 E1 11
	ora ($11.b),Y		; 11 11
	clc		; 18
	cmp $44F379.l,X		; DF 79 F3 44
	mvp $2B,$C4		; 44 C4 2B
	inc A		; 1A
	cmp ($11.b),Y		; D1 11
	inc A		; 1A
	sbc ($C4.b),Y		; F1 C4
	brk $44.b		; 00 44
	phk		; 4B
.ACCU 16
	rep #$23		; C2 23
	rtl		; 6B

	bit $44.b		; 24 44
	adc $7D.b,S		; 63 7D
	cpx #$00.b		; E0 00
	jsl $A80820.l		; 22 20 08 A8
	dey		; 88
	txa		; 8A
	pla		; 68
	stz $AD.b		; 64 AD
	rep #$C4		; C2 C4
	ldy $24.b,X		; B4 24
	and ($6D.b)		; 32 6D
	eor #$0C18.w		; 49 18 0C
	lda $00B4.w		; AD B4 00
	asl $E8.b		; 06 E8
	cmp #$BAB9.w		; C9 B9 BA
	and [$46.b],Y		; 37 46
	eor ($93.b),Y		; 51 93
	and #$A35D.w		; 29 5D A3
	dex		; CA
	sbc #$ED4A.w		; E9 4A ED
	asl A		; 0A
	adc ($38.b,X)		; 61 38
	lsr $A513.w		; 4E 13 A5
	lda $A5.b		; A5 A5
	lda $A7.b		; A5 A7
	.db $42, $A1		; 42 A1
	eor $A630.w		; 4D 30 A6
	trb $C2.b		; 14 C2
	tya		; 98
	eor $462E.w,Y		; 59 2E 46
	ora [$65.b],Y		; 17 65
	tax		; AA
	sbc $B6C863.l		; EF 63 C8 B6
	lsr $61.b,X		; 56 61
	lsr $AD.b,X		; 56 AD
	txy		; 9B
	phx		; DA
	tax		; AA
	cop $F2.b		; 02 F2
	xba		; EB
	sbc $65.b,X		; F5 65
	lda $12C1.w,X		; BD C1 12
	adc ($40.b,X)		; 61 40
	bne -51.b		; D0 CD
	ora ($1A.b),Y		; 11 1A
	and [$33.b]		; 27 33
	eor $36.b,S		; 43 36
	tax		; AA
	sbc $E9F5.w,Y		; F9 F5 E9
	tad		; 5B
	ldx $EB.b		; A6 EB
	eor $18CEBE.l		; 4F BE CE 18
	cmp [$2D.b],Y		; D7 2D
	bit $A575.w,X		; 3C 75 A5
	jsr $2928.w		; 20 28 29
	lda $77.b,S		; A3 77
	ora $EB6A.w		; 0D 6A EB
	rep #$C9		; C2 C9
	tad		; 5B
	jmp ($B961.w,X)		; 7C 61 B9
	cmp $74.b,X		; D5 74
	jsr ($D7B6.w,X)		; FC B6 D7
	eor [$DF.b],Y		; 57 DF
	eor ($A9.b),Y		; 51 A9
	lsr $97AD.w,X		; 5E AD 97
	tad		; 5B
	cmp [$E2.b]		; C7 E2
	adc $5D.b,X		; 75 5D
	eor $75E52D.l		; 4F 2D E5 75
	adc $270A.w,X		; 7D 0A 27
	sta $5B.b,X		; 95 5B
	sty $EE.b,X		; 94 EE
	trb $E75E.w		; 1C 5E E7
	inc $4B.b		; E6 4B
	bit $1CBC.w		; 2C BC 1C
	ldy $C37D.w,X		; BC 7D C3
	and $72.b,S		; 23 72
	sta $E7CE.w,X		; 9D CE E7
	clv		; B8
	sta $B9.b,X		; 95 B9
	ply		; 7A
	jmp ($E6BC.w,X)		; 7C BC E6
	sbc [$97.b]		; E7 97
	tda		; 7B
	ora [$84.b],Y		; 17 84
	dex		; CA
	cmp $C35E.w,X		; DD 5E C3
	tad		; 5B
	dec $796F.w		; CE 6F 79
	asl $5527.w,X		; 1E 27 55
	sbc [$7B.b],Y		; F7 7B
	ora [$84.b],Y		; 17 84
	cmp #$D8D5.w		; C9 D5 D8
	dec $E6.b,X		; D6 E6
	adc $27FE79.l		; 6F 79 FE 27
	tad		; 5B
	sbc [$7F.b],Y		; F7 7F
	ora $53.b,S		; 03 53
	phb		; 8B
	inc $FAAD.w		; EE AD FA
	asl $7D.b,X		; 16 7D
	dex		; CA
	inc $AA.b,X		; F6 AA
	dex		; CA
	ora $33D1.w,Y		; 19 D1 33
	sty $7E5D.w		; 8C 5D 7E
	ldy $30B5.w		; AC B5 30
	cmp ($C7.b,S),Y		; D3 C7
	phk		; 4B
	rol A		; 2A
	adc ($A2.b,S),Y		; 73 A2
	adc ($38.b,S),Y		; 73 38
	lda $77.b		; A5 77
	tya		; 98
	stx $890D.w		; 8E 0D 89
	inc A		; 1A
	and [$C6.b]		; 27 C6
.ACCU 8
.INDEX 8
	sep #$F0		; E2 F0
	plb		; AB
	ldy $0B00.w		; AC 00 0B
	dec $FC.b		; C6 FC
	cpy $5920.w		; CC 20 59
	ora [$7C.b]		; 07 7C
	cpx #$99.b		; E0 99
	dec $3DC3.w,X		; DE C3 3D
	inc $18.b,X		; F6 18
	brk $01.b		; 00 01
	ora $77.b,S		; 03 77
	ora $8347.w,X		; 1D 47 83
	rol $5536.w,X		; 3E 36 55
	adc $5C.b,S		; 63 5C
	lda $F012.w		; AD 12 F0
	plp		; 28
	and [$54.b],Y		; 37 54
	adc #$D5.b		; 69 D5
	lda $AD5C.w		; AD 5C AD
	tas		; 1B
	and $9B8E88.l		; 2F 88 8E 9B
	cmp $BE.b,X		; D5 BE
	adc $6FF3.w		; 6D F3 6F
	stx $E0.b,Y		; 96 E0
	cmp $6D7C.w,Y		; D9 7C 6D
	sta [$A7.b],Y		; 97 A7
	sta [$E2.b],Y		; 97 E2
	wai		; CB
	cmp ($CB.b),Y		; D1 CB
	cmp ($CB.b),Y		; D1 CB
	cmp ($49.b,S),Y		; D3 49
	inc A		; 1A
	clc		; 18
	and $3D7FF3.l,X		; 3F F3 7F 3D
	beq -33.b		; F0 DF
	lsr $A3F6.w,X		; 5E F6 A3
	.db $42, $C3		; 42 C3
	sbc $FE30.w,X		; FD 30 FE
	tya		; 98
	ply		; 7A
	plp		; 28
	adc [$B0.b],Y		; 77 B0
	inc $6178.w,X		; FE 78 61
	lsr $54.b,X		; 56 54
	lsr $64F4.w		; 4E F4 64
	dec $C9E1.w,X		; DE E1 C9
	cmp [$7B.b]		; C7 7B
	stx $EB.b		; 86 EB
	rol $C634.w		; 2E 34 C6
	eor $0DEE.w		; 4D EE 0D
	cpx $B158.w		; EC 58 B1
	sta $CF952B.l		; 8F 2B 95 CF
	sbc [$E5.b]		; E7 E5
	sta ($B1.b)		; 92 B1
	lda ($CF.b)		; B2 CF
	rtl		; 6B

	ldx #$E5.b		; A2 E5
	cmp $79.b,S		; C3 79
	eor $62C93D.l		; 4F 3D C9 62
	sbc ($83.b,X)		; E1 83
	lda ($71.b,X)		; A1 71
	sta $ABF7.w		; 8D F7 AB
	.db $82, $DB, $6C		; 82 DB 6C
	ldy $AC.b		; A4 AC
	tad		; 5B
	dec $BA.b,X		; D6 BA
	cmp $C70B.w,X		; DD 0B C7
	inc A		; 1A
	xba		; EB
	lsr $B5.b,X		; 56 B5
	cmp [$1A.b]		; C7 1A
	xba		; EB
	eor [$16.b],Y		; 57 16
	lda $C9.b,X		; B5 C9
	cmp $C3.b		; C5 C3
	rol $1676.w,X		; 3E 76 16
	asl $0E0E.w		; 0E 0E 0E
	inc A		; 1A
	rol $A6.b,X		; 36 A6
	lda [$3B.b]		; A7 3B
	tsb $D8F9.w		; 0C F9 D8
	eor $8383.w,Y		; 59 83 83
	.db $82, $63, $58		; 82 63 58
	dey		; 88
	dey		; 88
	bit #$59.b		; 89 59
	sta $2362.w		; 8D 62 23
	.db $42, $34		; 42 34
	jsr $8E88.w		; 20 88 8E
	plb		; AB
	tax		; AA
	dey		; 88
	sta $AA.b,S		; 83 AA
	beq -98.b		; F0 9E
	tas		; 1B
	cpx $B9.b		; E4 B9
	and $4C3D35.l,X		; 3F 35 3D 4C
	lda ($91.b,X)		; A1 91
	lda [$4E.b],Y		; B7 4E
	cld		; D8
	dey		; 88
	sta $65EC40.l,X		; 9F 40 EC 65
	lsr $5B.b,X		; 56 5B
	lda $2DBD.w		; AD BD 2D
	lda ($BD.b),Y		; B1 BD
	sta ($C2.b,S),Y		; 93 C2
	rtl		; 6B

	pha		; 48
	cmp $23225E.l,X		; DF 5E 22 23
	ldx $01.b		; A6 01
	adc $BEC2.w,Y		; 79 C2 BE
	ldy $DD74.w,X		; BC 74 DD
	sbc ($D7.b,S),Y		; F3 D7
	and $26.b,S		; 23 26
	pei ($4B.b)		; D4 4B
	stz $22.b		; 64 22
	pla		; 68
	stz $8B.b		; 64 8B
	stz $22.b		; 64 22
	jsl $8920A2.l		; 22 A2 20 89
	lda ($C9.b,X)		; A1 C9
	ldy $EF.b		; A4 EF
	ora ($8B.b),Y		; 11 8B
	ply		; 7A
	and $F1.b		; 25 F1
	ora ($A0.b),Y		; 11 A0
	bne -72.b		; D0 B8
	sta [$C6.b],Y		; 97 C6
	ldy $59B7.w		; AC B7 59
	.db $62, $89, $95		; 62 89 95
	.db $42, $22		; 42 22
	and $0560.w,X		; 3D 60 05
	lsr $55.b		; 46 55
	php		; 08
	lda [$8C.b]		; A7 8C
	ora #$85.b		; 09 85
	.db $82, $22, $22		; 82 22 22
	ora $86.b		; 05 86
	asl $08.b,X		; 16 08
	sta $BEF1.w		; 8D F1 BE
	jsl $888808.l		; 22 08 88 88
	bra -126.b		; 80 82
	jsl $1D2222.l		; 22 22 22 1D
	and $9C.b,S		; 23 9C
	adc ($8E.b,S),Y		; 73 8E
	ror $FB.b,X		; 76 FB
	sbc $9D7B7F.l		; EF 7F 7B 9D
	ldx $D304.w,Y		; BE 04 D3
	adc [$CE.b],Y		; 77 CE
	sbc $3BDF.w,Y		; F9 DF 3B
	sbc [$7C.b]		; E7 7C
	bit #$1B.b		; 89 1B
	cpy $44.b		; C4 44
	eor ($0B.b,X)		; 41 0B
	iny		; C8
	dec $2222.w,X		; DE 22 22
	ora ($94.b),Y		; 11 94
	adc $19.b		; 65 19
	lsr $E6.b		; 46 E6
	inc $E6.b		; E6 E6
	inx		; E8
	dex		; CA
	sbc $9509.w		; ED 09 95
	cmp [$4A.b],Y		; D7 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	ldx $6969.w		; AE 69 69
	stz $0927.w		; 9C 27 09
	cmp ($83.b,X)		; C1 83
	asl $14.b		; 06 14
.INDEX 16
	rep #$98		; C2 98
	eor ($0A.b,S),Y		; 53 0A
	adc ($4C.b,X)		; 61 4C
	and #$85.b		; 29 85
	bmi -90.b		; 30 A6
	ora $9608.w,Y		; 19 08 96
	dex		; CA
	ldy $F978.w,X		; BC 78 F9
	cpx #$D5E4.w		; E0 E4 D5
	bcc -120.b		; 90 88
	dey		; 88
	dey		; 88
	sta ($A0.b,S),Y		; 93 A0
	mvp $EB,$44		; 44 44 EB
	lda $41A3.w,Y		; B9 A3 41
	dec A		; 3A
	tsb $44.b		; 04 44
	mvp $11,$6D		; 44 6D 11
	and [$46.b]		; 27 46
	bvs -62.b		; 70 C2
	cmp ($59.b,X)		; C1 59
	phy		; 5A
	jsl $194E34.l		; 22 34 4E 19
	cmp $90.b,X		; D5 90
	sbc [$5A.b],Y		; F7 5A
	sta $428B73.l,X		; 9F 73 8B 42
	jsl $9B3A22.l		; 22 22 3A 9B
	bit $325E.w,X		; 3C 5E 32
	jsl $B32622.l		; 22 22 26 B3
	sed		; F8
	rol $6194.w		; 2E 94 61
	adc $8C08.w		; 6D 08 8C
	trb $74.b		; 14 74
	lda $7D.b,S		; A3 7D
	lda $42FB.w,X		; BD FB 42
	rol $70.b		; 26 70
	beq  93.b		; F0 5D
	tad		; 5B
	pha		; 48
	sta $ECED.w		; 8D ED EC
	eor $4B.b,X		; 55 4B
	adc $1B.b		; 65 1B
	cmp ($BD.b),Y		; D1 BD
	lda $6F8C08.l,X		; BF 08 8C 6F
	ldx $56.b,Y		; B6 56
	adc ($56.b,X)		; 61 56
	eor $E3.b,X		; 55 E3
	cmp ($CB.b)		; D2 CB
	ror A		; 6A
	adc $C6B7.w,Y		; 79 B7 C6
	lsr $E1.b,X		; 56 E1
	ror $55.b		; 66 55
	adc $58.b,S		; 63 58
	dey		; 88
	cmp $22225E.l,X		; DF 5E 22 22
	jsl $0A8759.l		; 22 59 87 0A
	plx		; FA
	sbc ($11.b),Y		; F1 11
	ora ($11.b),Y		; 11 11
	stx $16.b		; 86 16
	php		; 08
	dey		; 88
	bit #$85.b		; 89 85
	txy		; 9B
	inx		; E8
	adc ($60.b,X)		; 61 60
	dey		; 88
	dey		; 88
	txa		; 8A
	bit $E8.b		; 24 E8
	dex		; CA
	ldy $956B.w		; AC 6B 95
	lda $42.b,S		; A3 42
	jsl $222222.l		; 22 22 22 22
	sta [$C4.b],Y		; 97 C4
	mvp $6D,$6A		; 44 6A 6D
	lsr $D9.b,X		; 56 D9
	ora ($11.b,S),Y		; 13 11
	ora ($11.b),Y		; 11 11
	adc ($63.b,X)		; 61 63
	rtl		; 6B

	inc $63.b		; E6 63
	lda $858E.w,X		; BD 8E 85
	bmi -78.b		; 30 B2
	stp		; DB
	adc $FE.b,S		; 63 FE
	cld		; D8
	sbc $C87B0C.l,X		; FF 0C 7B C8
	sbc ($19.b,X)		; E1 19
	eor [$9D.b]		; 47 9D
	sta $08EE.w,X		; 9D EE 08
	dey		; 88
	cmp #$C9.b		; C9 C9
	cmp ($BD.b,X)		; C1 BD
	cmp ($11.b,X)		; C1 11
	ora ($16.b),Y		; 11 16
	bit $AF63.w		; 2C 63 AF
	rtl		; 6B

	rtl		; 6B

	adc $5B.b,S		; 63 5B
	eor ($16.b,S),Y		; 53 16
	and $ADAD.w		; 2D AD AD
	lda $6D8D.w		; AD 8D 6D
	phk		; 4B
	sta ($D3.b,S),Y		; 93 D3
	ply		; 7A
	sta $3DEA51.l		; 8F 51 EA 3D
	and [$25.b],Y		; 37 25
	adc ($9E.b)		; 72 9E
	tad		; 5B
	sta $656E.w,Y		; 99 6E 65
	lda $F294.w,Y		; B9 94 F2
	adc ($54.b)		; 72 54
	ply		; 7A
	cmp [$D1.b]		; C7 D1
	lda $2FF82D.l,X		; BF 2D F8 2F
	sbc ($A7.b,X)		; E1 A7
	and $184F.w		; 2D 4F 18
	beq -113.b		; F0 8F
	cli		; 58
	tda		; 7B
	and ($EA.b,S),Y		; 33 EA
	bit #$CB.b		; 89 CB
	sbc $BC.b		; E5 BC
	and [$84.b]		; 27 84
	beq -98.b		; F0 9E
	tas		; 1B
	cmp $78.b,S		; C3 78
	sta $8E7115.l		; 8F 15 71 8E
	and ($C6.b),Y		; 31 C6
	and $2847.w,Y		; 39 47 28
	sbc [$19.b]		; E7 19
	cmp $51.b		; C5 51
	ora ($13.b),Y		; 11 13
	inc A		; 1A
	cpy $44.b		; C4 44
	mvp $44,$44		; 44 44 44
	eor $5557.w,X		; 5D 57 55
	cmp $75.b,X		; D5 75
	eor ($89.b)		; 52 89
	dey		; 88
	pea $44DF.w		; F4 DF 44
	sbc $EF.b,X		; F5 EF
	lda ($60.b,X)		; A1 60
	dey		; 88
	phb		; 8B
	tda		; 7B
	ply		; 7A
	and $7B.b,S		; 23 7B
	adc $DC1B27.l,X		; 7F 27 1B DC
	ora $C5C105.l,X		; 1F 05 C1 C5
	cmp ($BD.b,X)		; C1 BD
	lda $74BD.w,X		; BD BD 74
	cmp ($1D.b),Y		; D1 1D
	and [$4D.b],Y		; 37 4D
	cmp ($74.b,S),Y		; D3 74
	cmp [$B8.b]		; C7 B8
	sei		; 78
	ora $1DF06E.l		; 0F 6E F0 1D
	and [$4D.b],Y		; 37 4D
	cmp ($45.b,S),Y		; D3 45
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	mvp $44,$44		; 44 44 44
	eor $D2.b		; 45 D2
	stz $91.b,X		; 74 91
	ora $4927.w,X		; 1D 27 49
	cmp ($74.b)		; D2 74
	plb		; AB
	sei		; 78
	ora $A78F.w		; 0D 8F A7
	jmp ($9D74.w)		; 6C 74 9D
	and [$49.b]		; 27 49
	mvp $44,$44		; 44 44 44
	mvp $D1,$1B		; 44 1B D1
	lda $1111.w,X		; BD 11 11
	adc #$69.b		; 69 69
	adc #$68.b		; 69 68
	eor #$D1.b		; 49 D1
	sta $92.b		; 85 92
	lda [$AA.b],Y		; B7 AA
	wai		; CB
	tax		; AA
	wai		; CB
	tax		; AA
	wai		; CB
	adc $95.b,X		; 75 95
	eor $8B08.w,Y		; 59 08 8B
	inx		; E8
	cmp $17FC96.l,X		; DF 96 FC 17
	beq -48.b		; F0 D0
	mvp $F0,$D9		; 44 D9 F0
	sta $337B58.l		; 8F 58 7B 33
	nop		; EA
	dey		; 88
	adc ($CD.b)		; 72 CD
	sta $944D.w,X		; 9D 4D 94
	jmp $95AA.w		; 4C AA 95
	lda [$C4.b],Y		; B7 C4
	lsr $F6.b		; 46 F6
	sed		; F8
	cmp $7FE31B.l,X		; DF 1B E3 7F
	asl $FE.b,X		; 16 FE
	and #$99.b		; 29 99
	sta $E894.w,Y		; 99 94 E8
	ora ($1A.b),Y		; 11 1A
	and [$66.b]		; 27 66
	inc A		; 1A
	txy		; 9B
	dec A		; 3A
	cmp $C0444C.l,X		; DF 4C 44 C0
	plp		; 28
	bit $382C.w		; 2C 2C 38
	trb $08.b		; 14 08
	sta $B3F296.l		; 8F 96 F2 B3
	sta ($99.b,X)		; 81 99
	bcc 111.b		; 90 6F
	lda ($E0.b,S),Y		; B3 E0
	pla		; 68
	inc $F0.b,X		; F6 F0
	ora ($38.b,S),Y		; 13 38
	adc $50.b		; 65 50
	sta $6398.w		; 8D 98 63
	eor $32FC.w,X		; 5D FC 32
	lsr $85.b		; 46 85
	cld		; D8
	rol $55.b		; 26 55
	lsr A		; 4A
	cmp ($11.b),Y		; D1 11
	sty $A39B.w		; 8C 9B A3
	plp		; 28
	cmp $A31B.w,X		; DD 1B A3
	stz $6E.b,X		; 74 6E
	sta $34DA.w		; 8D DA 34
	ldx $D795.w		; AE 95 D7
	lsr A		; 4A
	sbc #$5D.b		; E9 5D
	pld		; 2B
	lda $74.b		; A5 74
	txs		; 9A
	inc A		; 1A
	ora ($11.b),Y		; 11 11
	ora ($28.b),Y		; 11 28
	cmp ($CD.b),Y		; D1 CD
	ora $D45655.l		; 0F 55 56 D4
	mvp $19,$41		; 44 41 19
	rol $DA.b,X		; 36 DA
	pla		; 68
	eor $B1D035.l,X		; 5F 35 D0 B1
	ora ($04.b),Y		; 11 04
	eor $4D.b		; 45 4D
	phd		; 0B
	stz $30.b,X		; 74 30
	mvp $11,$41		; 44 41 11
	eor ($42.b,S),Y		; 53 42
	sbc ($73.b),Y		; F1 73
	eor $51.b,X		; 55 51
	ora ($2B.b),Y		; 11 2B
	dec $19.b		; C6 19
	txa		; 8A
	txs		; 9A
	ora [$63.b],Y		; 17 63
	lda ($62.b,X)		; A1 62
	jsl $8A6061.l		; 22 61 60 8A
	txs		; 9A
	ora [$9B.b],Y		; 17 9B
	lda ($62.b,X)		; A1 62
	jsl $9A8A08.l		; 22 08 8A 9A
	clc		; 18
	cmp #$55.b		; C9 55
	mvp $11,$44		; 44 44 11
	ora $34.b,X		; 15 34
	and ($15.b),Y		; 31 15
	mvn $41,$44		; 54 44 41
	ora ($53.b),Y		; 11 53
	.db $42, $E0		; 42 E0
	phx		; DA
	tax		; AA
	ldx #$0822.w		; A2 22 08
	txa		; 8A
	txs		; 9A
	ora [$18.b],Y		; 17 18
	tax		; AA
	tax		; AA
	jsl $11F125.l		; 22 25 F1 11
	eor ($42.b,S),Y		; 53 42
	inc $E8.b		; E6 E8
	cli		; 58
	dey		; 88
	.db $82, $22, $A6		; 82 22 A6
	sta $D0.b		; 85 D0
	sty $4495.w		; 8C 95 44
	mvp $11,$A1		; 44 A1 11
	eor ($42.b,S),Y		; 53 42
	cmp $6D.b,X		; D5 6D
	eor $11.b,X		; 55 11
	ora ($56.b),Y		; 11 56
	cmp $4D.b,X		; D5 4D
	phd		; 0B
	cmp $7676.w,Y		; D9 76 76
	eor $51.b,X		; 55 51
	ora ($36.b),Y		; 11 36
	ror $5D.b,X		; 76 5D
	sta $53.b,X		; 95 53
	.db $42, $DD		; 42 DD
	tsb $1111.w		; 0C 11 11
	bne -77.b		; D0 B3
	.db $42, $E4		; 42 E4
	pea $5495.w		; F4 95 54
	mvp $38,$49		; 44 49 38
	lda ($54.b,S),Y		; B3 54
	bne -57.b		; D0 C7
	and $55.b,X		; 35 55
	ora ($10.b),Y		; 11 10
	mvp $D0,$54		; 44 54 D0
	cpy $72.b		; C4 72
	eor $11.b,X		; 55 11
	bpl  68.b		; 10 44
	mvn $C4,$D0		; 54 D0 C4
	eor $51.b		; 45 51
	ora ($04.b),Y		; 11 04
	eor $4D.b		; 45 4D
	phd		; 0B
	eor ($15.b,X)		; 41 15
	mvp $11,$44		; 44 44 11
	ora $34.b,X		; 15 34
	rol $8856.w		; 2E 56 88
	tax		; AA
	jsl $A98820.l		; 22 20 88 A9
	lda ($75.b,X)		; A1 75
	cpx $9AC5.w		; EC C5 9A
	tay		; A8
	dey		; 88
	txs		; 9A
	txy		; 9B
	jsl $62682A.l		; 22 2A 68 62
	jsl $8688A8.l		; 22 A8 88 86
	lsr $04.b		; 46 04
	sty $D0.b,X		; 94 D0
	lda $B35F.w,X		; BD 5F B3
	cmp ($F7.b,X)		; C1 F7
	tsx		; BA
	jmp.w [$44C5]		; DC C5 44
	mvp $61,$EC		; 44 EC 61
	cmp $A2.b		; C5 A2
	cmp ($4D.b),Y		; D1 4D
	tsb $55.b		; 04 55
	ora ($10.b),Y		; 11 10
	mvp $D0,$54		; 44 54 D0
	sed		; F8
	eor ($CD.b,X)		; 41 CD
	ora ($10.b),Y		; 11 10
	lsr $0E.b		; 46 0E
	adc $169A.w,Y		; 79 9A 16
	dey		; 88
	sta $130D.w		; 8D 0D 13
	sty $E1.b		; 84 E1
	sec		; 38
	brk $05.b		; 00 05
	inc A		; 1A
	bit $8529.w,X		; 3C 29 85
	bmi -91.b		; 30 A5
	tas		; 1B
	eor $0D57.w,Y		; 59 57 0D
	cmp $757A.w,X		; DD 7A 75
	sbc #$EE.b		; E9 EE
	pea $81F7.w		; F4 F7 81
	adc $60B2.w		; 6D B2 60
	inc $D3F3.w		; EE F3 D3
	wai		; CB
	cpy $E565.w		; CC 65 E5
	lda ($45.b)		; B2 45
	eor $F6.b,X		; 55 F6
	dey		; 88
	txy		; 9B
	ora [$9F.b]		; 07 9F
	ora $15.b		; 05 15
	inc $9A.b,X		; F6 9A
	plp		; 28
	ror A		; 6A
	stz $8A18.w,X		; 9E 18 8A
	dey		; 88
	wai		; CB
	inc $B0.b,X		; F6 B0
	cmp $E0.b,X		; D5 E0
	nop		; EA
	beq  65.b		; F0 41
	mvp $F0,$64		; 44 64 F0
	adc $EF.b,S		; 63 EF
	lda $D6F7.w		; AD F7 D6
	ldx #$25A2.w		; A2 A2 25
	ldy #$2800.w		; A0 00 28
	dey		; 88
	dey		; 88
	txa		; 8A
	and $6CDED3.l		; 2F D3 DE 6C
	eor $67B1.w,Y		; 59 B1 67
	rol $F5AF.w,X		; 3E AF F5
	cmp ($BB.b),Y		; D1 BB
	ora ($7D.b,X)		; 01 7D
	and $AA.b,S		; 23 AA
	nop		; EA
	tyx		; BB
	cmp [$74.b],Y		; D7 74
	cmp ($45.b,X)		; C1 45
	lda ($CF.b)		; B2 CF
	sta $E7A2.w,X		; 9D A2 E7
	lda $AA.b,S		; A3 AA
	.db $82, $E0, $FA		; 82 E0 FA
	ldx $0C.b,Y		; B6 0C
	ora ($14.b),Y		; 11 14
	lsr $0307.w,X		; 5E 07 03
	phb		; 8B
	lda $F1.b,S		; A3 F1
	sec		; 38
	sta $7A1C.w,X		; 9D 1C 7A
	cli		; 58
	.db $82, $F7, $CF		; 82 F7 CF
	ora $3CE3.w,Y		; 19 E3 3C
	adc [$76.b],Y		; 77 76
	sbc #$A8.b		; E9 A8
	tay		; A8
	stz $8F48.w,X		; 9E 48 8F
	stz $247F.w,X		; 9E 7F 24
	trb $44.b		; 14 44
	eor ($ED.b,S),Y		; 53 ED
	ora $EF4528.l,X		; 1F 28 45 EF
	asl $0D08.w		; 0E 08 0D
	sei		; 78
	inc $F8.b,X		; F6 F8
	xce		; FB
	brk $51.b		; 00 51
	ora ($4E.b),Y		; 11 4E
	eor ($AE.b),Y		; 51 AE
	jsl $8CD4AA.l		; 22 AA D4 8C
	inx		; E8
	rti		; 40

	eor ($11.b),Y		; 51 11
	ora ($14.b),Y		; 11 14
	bvc   0.b		; 50 00
	sty $B0.b,X		; 94 B0
	cmp $85.b,S		; C3 85
	dey		; 88
	plp		; 28
	dey		; 88
	dex		; CA
	jmp.w [$C62C]		; DC 2C C6
	ldy $5D.b,X		; B4 5D
	lda $ADBD.w,X		; BD BD AD
	ldx $3B77.w		; AE 77 3B
	sbc $FF2F5A.l,X		; FF 5A 2F FF
	adc $D9C55B.l,X		; 7F 5B C5 D9
	ora $F2.b		; 05 F2
	sbc $E8AB7F.l,X		; FF 7F AB E8
	eor $3F.b,S		; 43 3F
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	cmp $3BF069.l		; CF 69 F0 3B
	ror $17E9.w,X		; 7E E9 17
	adc [$67.b]		; 67 67
	plx		; FA
	sbc $F79E.w,Y		; F9 9E F7
	sta $F5.b,X		; 95 F5
	ror $3E.b,X		; 76 3E
	sty $FD.b		; 84 FD
	plx		; FA
	phd		; 0B
	plb		; AB
	lda ($EB.b),Y		; B1 EB
	inc $BD3F.w,X		; FE 3F BD
	xce		; FB
	lda $F7F467.l,X		; BF 67 F4 F7
	bit $B3.b,X		; 34 B3
	sbc ($E8.b,S),Y		; F3 E8
	tax		; AA
	tsx		; BA
	iny		; C8
	sta $E6B9.w,X		; 9D B9 E6
	sta ($45.b,X)		; 81 45
	adc $B5.b,X		; 75 B5
	sta $BA.b,S		; 83 BA
	bit $1771.w,X		; 3C 71 17
	stz $FE.b,X		; 74 FE
	sbc ($CE.b,S),Y		; F3 CE
	adc $9B.b,X		; 75 9B
	tsa		; 3B
	wai		; CB
	and $81.b,X		; 35 81
	pla		; 68
	sta $3A781A.l,X		; 9F 1A 78 3A
	dec $FE.b,X		; D6 FE
	adc $0D9E.w		; 6D 9E 0D
	dey		; 88
	tyx		; BB
	cpx $6F.b		; E4 6F
	ror $ED.b		; 66 ED
	cmp $9C.b,X		; D5 9C
	ora ($51.b,X)		; 01 51
	and $7D.b,S		; 23 7D
	ora ($11.b,S),Y		; 13 11
	eor $BE.b		; 45 BE
	plx		; FA
	and $83BF.w,Y		; 39 BF 83
	lda $F6E5.w,Y		; B9 E5 F6
	stp		; DB
	cmp $BE05E0.l,X		; DF E0 05 BE
	bit $BBDE.w,X		; 3C DE BB
	adc ($9D.b)		; 72 9D
	lda $DF28.w,X		; BD 28 DF
	plx		; FA
	sbc [$A2.b],Y		; F7 A2
	sbc [$CD.b],Y		; F7 CD
	ora $4B0D.w		; 0D 0D 4B
	eor ($E9.b,S),Y		; 53 E9
	cmp ($67.b,X)		; C1 67
	mvp $9D,$E8		; 44 E8 9D
	ora $9555.w,Y		; 19 55 95
	lsr $4805.w,X		; 5E 05 48
	inx		; E8
	jmp $909CDC.l		; 5C DC 9C 90
	eor ($11.b),Y		; 51 11
	ora ($14.b),Y		; 11 14
	jmp $86D19B.l		; 5C 9B D1 86
	bvs -50.b		; 70 CE
	ldy $4441.w,X		; BC 41 44
	mvp $51,$44		; 44 44 51
	rtl		; 6B

	eor $11.b		; 45 11
	bpl  22.b		; 10 16
	ldy $44.b,X		; B4 44
	mvp $56,$51		; 44 51 56
	dec $87.b,X		; D6 87
	rol A		; 2A
	lda ($84.b,S),Y		; B3 84
	inx		; E8
	ora $5B.b		; 05 5B
	phy		; 5A
	ora ($11.b),Y		; 11 11
	eor [$42.b]		; 47 42
.INDEX 8
	sep #$D8		; E2 D8
	dec $83.b,X		; D6 83
	lda ($75.b,X)		; A1 75
	ldy $22.b,X		; B4 22
	stx $2082.w		; 8E 82 20
	inx		; E8
	jmp ($7454.w,X)		; 7C 54 74
	ora ($07.b),Y		; 11 07
	eor ($21.b,X)		; 41 21
	bne  68.b		; D0 44
	asl $6A.b,X		; 16 6A
	ldy $AF63.w		; AC 63 AF
	lda $5474EF.l		; AF EF 74 54
	eor $477CEE.l,X		; 5F EE 7C 47
	and $55.b,X		; 35 55
	eor ($6A.b,X)		; 41 6A
	wai		; CB
	sta $9A9B.w,X		; 9D 9B 9A
	xba		; EB
	xba		; EB
	dec $A068.w		; CE 68 A0
	lsr $9448.w,X		; 5E 48 94
	bcs -57.b		; B0 C7
	bpl  81.b		; 10 51
	ldx $B632.w,Y		; BE 32 B6
	lsr $E1.b,X		; 56 E1
	lda ($8A.b),Y		; B1 8A
	txa		; 8A
	pla		; 68
	jsl $2222A2.l		; 22 A2 22 22
	plp		; 28
	sbc [$08.b]		; E7 08
	inc A		; 1A
	ora $44709E.l,X		; 1F 9E 70 44
	mvp $11,$45		; 44 45 11
	tas		; 1B
	stp		; DB
	sbc $74.b,S		; E3 74
	ror $C08D.w		; 6E 8D C0
	ora ($7E.b,X)		; 01 7E
	sta $95AE74.l		; 8F 74 AE 95
	cmp ($9C.b)		; D2 9C
	and [$09.b]		; 27 09
	cmp ($A5.b,X)		; C1 A5
	lda $A6.b		; A5 A6
	stz $CE.b,X		; 74 CE
	tya		; 98
	eor ($0A.b,S),Y		; 53 0A
	adc ($4C.b,X)		; 61 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
.INDEX 16
	rep #$99		; C2 99
	plb		; AB
	lda $96B9.w,Y		; B9 B9 96
	cmp $B3D2.w,Y		; D9 D2 B3
	tsb $C4.b		; 04 C4
	cmp $084E.w,X		; DD 4E 08
	dey		; 88
	dey		; 88
	cmp [$8E.b],Y		; D7 8E
	ldx $4DD7.w		; AE D7 4D
	cmp $3ED9.w,Y		; D9 D9 3E
	cmp $62F3.w,Y		; D9 F3 62
	jsr $2E7E.w		; 20 7E 2E
	lda $5AA74F.l		; AF 4F A7 5A
	jsl $569122.l		; 22 22 91 56
	inx		; E8
	dey		; 88
	sbc [$04.b]		; E7 04
	ldy $C6E0.w		; AC E0 C6
	pha		; 48
	dey		; 88
	dey		; 88
	sbc $5A.b,S		; E3 5A
	cpx #$8888.w		; E0 88 88
	sbc $5C.b,S		; E3 5C
	inx		; E8
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	cmp $8B1C.w,X		; DD 1C 8B
	sbc $BC7C.w,Y		; F9 7C BC
	stz $7A5C.w		; 9C 5C 7A
	sei		; 78
	sbc [$9B.b]		; E7 9B
	eor $7C.b,S		; 43 7C
	adc $E576.w,Y		; 79 76 E5
	lda $53C7.w,X		; BD C7 53
	dex		; CA
	pei ($E8.b)		; D4 E8
	nop		; EA
	adc [$BB.b]		; 67 BB
	sty $AE6B.w		; 8C 6B AE
	adc ($EF.b,S),Y		; 73 EF
	cmp ($3E.b),Y		; D1 3E
	adc ($EB.b),Y		; 71 EB
	ror $5EE7.w		; 6E E7 5E
.ACCU 8
	sep #$AF		; E2 AF
	adc $AB87DF.l,X		; 7F DF 87 AB
	tsa		; 3B
	cmp ($FC.b,S),Y		; D3 FC
	lda [$79.b],Y		; B7 79
	cli		; 58
	sbc ($2F.b)		; F2 2F
	ldy $E4.b		; A4 E4
	cmp $6D97CB.l,X		; DF CB 97 6D
	rol $5CCE.w		; 2E CE 5C
	cmp #$79.b		; C9 79
	adc [$DB.b],Y		; 77 DB
	lda $BCE43D.l,X		; BF 3D E4 BC
	lda [$B6.b],Y		; B7 B6
	sta $621E67.l		; 8F 67 1E 62
	inc $8F.b,X		; F6 8F
	lda ($7D.b)		; B2 7D
	cop $6F.b		; 02 6F
	sbc $DFCE.w		; ED CE DF
	sbc $F1.b,X		; F5 F1
	dec A		; 3A
	jmp ($804F.w,X)		; 7C 4F 80
	adc [$67.b],Y		; 77 67
	cld		; D8
	ora ($7F.b,S),Y		; 13 7F
	and $47C9.w		; 2D C9 47
	sty $B1F1.w		; 8C F1 B1
	sbc $7F7C.w,X		; FD 7C 7F
	phd		; 0B
	ora $5DB56B.l,X		; 1F 6B B5 5D
	tsa		; 3B
	asl $DDE6.w,X		; 1E E6 DD
	rol $572F.w,X		; 3E 2F 57
	cpy $E5.b		; C4 E5
	ora $13FE6C.l,X		; 1F 6C FE 13
	ora ($02.b,S),Y		; 13 02
	eor [$F1.b],Y		; 57 F1
	stx $8AE6.w		; 8E E6 8A
	dex		; CA
	and ($27.b),Y		; 31 27
	phb		; 8B
	ldy $4A68.w,X		; BC 68 4A
	sbc ($86.b),Y		; F1 86
	and $EF.b,X		; 35 EF
	plp		; 28
	ldy #$0C00.w		; A0 00 0C
	eor $3DDE.w		; 4D DE 3D
	sbc $55BB.w,X		; FD BB 55
	sbc $57.b		; E5 57
	ora ($1D.b)		; 12 1D
	sta $72C91E.l		; 8F 1E C9 72
	bvs -28.b		; 70 E4
	cpx #$3722.w		; E0 22 37
	dec $EB.b		; C6 EB
	adc $6C.b,X		; 75 6C
	pei ($AF.b)		; D4 AF
	eor ($BA.b)		; 52 BA
	ora ($1E.b),Y		; 11 1E
	phd		; 0B
	asl $39.b,X		; 16 39
	eor $B3D3.w,Y		; 59 D3 B3
	tay		; A8
	bit #$1B.b		; 89 1B
	cpx $6BC0.w		; EC C0 6B
	wai		; CB
	adc $97.b,X		; 75 97
	cpx #$D6E5.w		; E0 E5 D6
	and $C5D480.l,X		; 3F 80 D4 C5
	mvn $C7,$7A		; 54 7A C7
	cmp ($BD.b),Y		; D1 BD
	adc $F8.b,S		; 63 F8
	ora $7C55.w,Y		; 19 55 7C
	eor $3C.b		; 45 3C
	adc $C2.b,S		; 63 C2
	and $32.b,X		; 35 32
	sbc ($5E.b)		; F2 5E
	tad		; 5B
	cpy $DEC7.w		; CC C7 DE
	adc $FC.b,S		; 63 FC
	ror $FAD3.w,X		; 7E D3 FA
	tyx		; BB
	and $1EF993.l		; 2F 93 F9 1E
	adc ($53.b,S),Y		; 73 53
	cmp #$CE.b		; C9 CE
	ldy $68.b		; A4 68
	sta $FDC473.l,X		; 9F 73 C4 FD
	dec $B91F.w,X		; DE 1F B9
	sbc ($EF.b,X)		; E1 EF
	sbc ($C3.b),Y		; F1 C3
	sta $51BD7E.l,X		; 9F 7E BD 51
	dec $5CEC.w,X		; DE EC 5C
	cmp $7A5895.l,X		; DF 95 58 7A
	adc $58FE.w,X		; 7D FE 58
	lsr A		; 4A
	xce		; FB
	cmp $2A50.w		; CD 50 2A
	and [$B5.b],Y		; 37 B5
	phy		; 5A
	eor $28.b,X		; 55 28
	adc $CD.b		; 65 CD
	cmp $263D7B.l		; CF 7B 3D 26
	txy		; 9B
	tda		; 7B
	nop		; EA
	sbc $6E.b		; E5 6E
	inc $28AD.w,X		; FE AD 28
	eor ($45.b,S),Y		; 53 45
	brk $48.b		; 00 48
	dec $94.b,X		; D6 94
	adc $841FE9.l,X		; 7F E9 1F 84
	plx		; FA
	and [$CD.b],Y		; 37 CD
	and [$0E.b]		; 27 0E
	ldx $8FC7.w		; AE C7 8F
	cpy #$FCBF.w		; C0 BF FC
	cmp [$FE.b],Y		; D7 FE
	sta $FE.b		; 85 FE
	dex		; CA
	sbc $37BED6.l,X		; FF D6 BE 37
	cmp $81BBC4.l,X		; DF C4 BB 81
	nop		; EA
	sed		; F8
	ora $EBBDF3.l		; 0F F3 BD EB
	sbc $7B9F2E.l,X		; FF 2E 9F 7B
	sta $5A.b,X		; 95 5A
	lda $5C1D.w,X		; BD 1D 5C
	lda [$AF.b],Y		; B7 AF
	inx		; E8
	cmp $EB.b,X		; D5 EB
	ror A		; 6A
	sbc $F5EA.w		; ED EA F5
	pei ($64.b)		; D4 64
	ror $0727.w,X		; 7E 27 07
	cmp ($61.b),Y		; D1 61
	lda $17CB.w,X		; BD CB 17
	ora [$37.b]		; 07 37
	bcc -48.b		; 90 D0
	sta $FCC1.w,X		; 9D C1 FC
	trb $586E.w		; 1C 6E 58
	stx $236F.w		; 8E 6F 23
	sta ($45.b),Y		; 91 45
	ora $FAC9.w,X		; 1D C9 FA
	sbc [$C9.b]		; E7 C9
	sbc $5B.b,S		; E3 5B
	plp		; 28
	cmp $B7F81B.l,X		; DF 1B F8 B7
	sbc [$C6.b]		; E7 C6
	wai		; CB
	sta $DAC8B5.l		; 8F B5 C8 DA
	cpx $08.b		; E4 08
	sta $EE13.w		; 8D 13 EE
	adc ($F7.b,S),Y		; 73 F7
	and $AC7B.w,Y		; 39 7B AC
	adc $38D6.w,X		; 7D D6 38
	sta [$D6.b],Y		; 97 D6
	lsr $B7.b		; 46 B7
	sty $DE.b		; 84 DE
	sta $2A55.w,Y		; 99 55 2A
	sbc ($E1.b),Y		; F1 E1
	eor $150078.l,X		; 5F 78 00 15
	tas		; 1B
	plx		; FA
	ldx #$7D57.w		; A2 57 7D
	cli		; 58
	sbc ($F2.b),Y		; F1 F2
	inc $99.b,X		; F6 99
	nop		; EA
	eor $B2D24D.l		; 4F 4D D2 B2
	sed		; F8
	beq -85.b		; F0 AB
	cmp ($AB.b,S),Y		; D3 AB
	lsr A		; 4A
	trb $D1.b		; 14 D1
	rti		; 40

	clc		; 18
	bpl 121.b		; 10 79
	jmp $D34917.l		; 5C 17 49 D3
	jmp ($E5BB.w,X)		; 7C BB E5
	sbc $A5.b,S		; E3 A5
	adc $66E3.w		; 6D E3 66
	ora $1E6E.w,X		; 1D 6E 1E
	adc ($0F.b,S),Y		; 73 0F
	and [$87.b],Y		; 37 87
	txy		; 9B
	cmp $F8.b,S		; C3 F8
	clv		; B8
	and $AAB6.w,X		; 3D B6 AA
	ldy $3F.b,X		; B4 3F
	sbc $7E.b,S		; E3 7E
	phd		; 0B
	sbc $BF.b,S		; E3 BF
	cpy $36FC.w		; CC FC 36
	phb		; 8B
	asl $8F.b,X		; 16 8F
	phb		; 8B
	eor [$69.b]		; 47 69
	eor [$59.b]		; 47 59
	eor [$6B.b]		; 47 6B
	eor [$E7.b]		; 47 E7
	bne -48.b		; D0 D0
	inx		; E8
	and [$B9.b]		; 27 B9
	clv		; B8
	tsx		; BA
	plx		; FA
	nop		; EA
	lda ($9E.b,S),Y		; B3 9E
	eor $0A3A.w,Y		; 59 3A 0A
	sbc ($34.b,S),Y		; F3 34
	ror $8F4E.w,X		; 7E 4E 8F
	adc $9C.b		; 65 9C
	asl $A003.w		; 0E 03 A0
	dec $C3C6.w		; CE C6 C3
	lda ($F9.b,X)		; A1 F9
	and $1DBA.w,Y		; 39 BA 1D
	stx $0E.b		; 86 0E
	lsr $7473.w		; 4E 73 74
	and [$00.b],Y		; 37 00
	rol $4F.b		; 26 4F
	rol $A6.b,X		; 36 A6
	sbc $BC.b,X		; F5 BC
	asl $74.b		; 06 74
	lsr $6688.w		; 4E 88 66
	and [$B7.b],Y		; 37 B7
	lda #$A1.b		; A9 A1
	adc [$99.b],Y		; 77 99
	dec $55E5.w,X		; DE E5 55
	rts		; 60

	dey		; 88
	cmp $1BE11C.l,X		; DF 1C E1 1B
	nop		; EA
	wai		; CB
	inc A		; 1A
	sbc $74.b,S		; E3 74
	ror $D18D.w		; 6E 8D D1
	tsx		; BA
	and [$46.b],Y		; 37 46
	eor ($93.b),Y		; 51 93
	adc $D2.b,X		; 75 D2
	tsx		; BA
	eor [$4A.b],Y		; 57 4A
	sbc #$5D.b		; E9 5D
	and #$5D.b		; 29 5D
	pld		; 2B
	ldx $E194.w		; AE 94 E1
	sec		; 38
	lsr $270C.w		; 4E 0C 27
	ora #$C2.b		; 09 C2
	bvs 105.b		; 70 69
	sty $29.b		; 84 29
	bne -40.b		; D0 D8
	.db $42, $14		; 42 14
	sta $8D.b,X		; 95 8D
	ror $9828.w		; 6E 28 98
	dec $26.b,X		; D6 26
	rol $86.b		; 26 86
	lsr $63.b,X		; 56 63
	cli		; 58
	dey		; 88
	tay		; A8
	dey		; 88
	jsl $0D7268.l		; 22 68 72 0D
	tya		; 98
	clc		; 18
	stx $682D.w		; 8E 2D 68
	sta $E2.b,X		; 95 E2
	and $66.b		; 25 66
	stx $62.b		; 86 62
	eor [$8C.b],Y		; 57 8C
	inx		; E8
	bit #$55.b		; 89 55
	inc $57.b		; E6 57
	ldy $A436.w,X		; BC 36 A4
	sta $5FF5.w		; 8D F5 5F
	asl $551D.w,X		; 1E 1D 55
	brk $01.b		; 00 01
	adc $BEC3.w,Y		; 79 C3 BE
	ldx $5D.b		; A6 5D
	stx $5B.b		; 86 5B
	lda $28574E.l		; AF 4E 57 28
	adc $2C.b,S		; 63 2C
	sbc $9A.b,X		; F5 9A
	sta ($19.b),Y		; 91 19
	tad		; 5B
	lda $EE5E.w		; AD 5E EE
	bpl   3.b		; 10 03
	nop		; EA
	jmp ($C875.w)		; 6C 75 C8
	dex		; CA
	cpy $EAAA.w		; CC AA EA
	eor ($12.b),Y		; 51 12
	plb		; AB
	inc $47A7.w,X		; FE A7 47
	ldx $4444.w		; AE 44 44
	adc $A90E8F.l		; 6F 8F 0E A9
	lda ($7F.b,S),Y		; B3 7F
	cmp $E8341E.l		; CF 1E 34 E8
	sta $4CB2.w,X		; 9D B2 4C
	lsr $A5E5.w		; 4E E5 A5
	lda $11.b		; A5 11
	ora ($AF.b),Y		; 11 AF
	asl $0DBB.w,X		; 1E BB 0D
	sbc [$37.b],Y		; F7 37
	sta [$C7.b]		; 87 C7
	dex		; CA
	tas		; 1B
	eor $77.b,X		; 55 77
	cmp $D3.b,X		; D5 D3
	ror $A2ED.w		; 6E ED A2
	stz $E7.b,X		; 74 E7
	lda $96.b		; A5 96
	stx $5A.b,Y		; 96 5A
	sei		; 78
	xba		; EB
	lsr A		; 4A
	rti		; 40

	adc $F9.b,X		; 75 F9
	ror $78.b,X		; 76 78
	sbc ($70.b)		; F2 70
	sbc [$9C.b],Y		; F7 9C
	cmp $7FF7.w,X		; DD F7 7F
	ldx $F7EF.w,Y		; BE EF F7
	jsr ($D988.w,X)		; FC 88 D9
	lda $0D.b		; A5 0D
	dec A		; 3A
	lda $2B.b,X		; B5 2B
	pei ($AF.b)		; D4 AF
	lsr $CD.b,X		; 56 CD
	tad		; 5B
	rol $95B7.w		; 2E B7 95
	trb $99E8.w		; 1C E8 99
	sbc $655538.l		; EF 38 55 65
	tsb $9DE1.w		; 0C E1 9D
	ora ($E9.b,S),Y		; 13 E9
	dec $E89C.w		; CE 9C E8
	sta $1113.w,X		; 9D 13 11
	ora ($C9.b),Y		; 11 C9
	cpx $EBF1.w		; EC F1 EB
	sbc ($EB.b)		; F2 EB
	sbc ($EB.b)		; F2 EB
	sec		; 38
	adc $135F.w,X		; 7D 5F 13
	cmp $3EF6.w,X		; DD F6 3E
	xba		; EB
	sta ($F4.b,X)		; 81 F4
	bit $ABD3.w		; 2C D3 AB
	lsr A		; 4A
	inc A		; 1A
	bvc  -9.b		; 50 F7
	bmi -18.b		; 30 EE
	pla		; 68
	cpx $DEB8.w		; EC B8 DE
	ldx $59FD.w		; AE FD 59
	adc ($7F.b)		; 72 7F
	adc ($5F.b,S),Y		; 73 5F
	sbc [$39.b],Y		; F7 39
	stz $63A3.w,X		; 9E A3 63
	adc $F12DF4.l,X		; 7F F4 2D F1
	bit $2CF1.w		; 2C F1 2C
	sbc ($57.b,X)		; E1 57
	inc $72.b		; E6 72
	sbc $59.b,X		; F5 59
	adc $2DB332.l		; 6F 32 B3 2D
	and [$49.b]		; 27 49
	cmp ($6F.b)		; D2 6F
	phb		; 8B
	sbc ($DF.b)		; F2 DF
	.db $82, $FE, $1A		; 82 FE 1A
	eor $72.b,S		; 43 72
	ora $0A5D.w		; 0D 5D 0A
	jsr ($586F.w,X)		; FC 6F 58
	tda		; 7B
	and ($EA.b,S),Y		; 33 EA
	bit #$47.b		; 89 47
	rol $3F1B.w		; 2E 1B 3F
	cmp $6CDFD9.l,X		; DF D9 DF 6C
	sbc $F755.w		; ED 55 F7
	pld		; 2B
	xce		; FB
	sta $8987.w,X		; 9D 87 89
	cld		; D8
	adc $570E.w,X		; 7D 0E 57
	sta ($D7.b,X)		; 81 D7
	tda		; 7B
	ldx $ABC7.w,Y		; BE C7 AB
.ACCU 8
.INDEX 8
	sep #$7B		; E2 7B
	ldx $7517.w		; AE 17 75
	cmp ($EF.b,X)		; C1 EF
	sec		; 38
	and $07E7.w,X		; 3D E7 07
	cmp $CBCE4B.l,X		; DF 4B CE CB
	lda ($E3.b)		; B2 E3
	adc [$34.b],Y		; 77 34
	eor $6F2B.w,Y		; 59 2B 6F
	bit #$12.b		; 89 12
	jsl $D7BC73.l		; 22 73 BC D7
	cmp $6CF5EB.l		; CF EB F5 6C
	tsx		; BA
	stp		; DB
	sbc $7C.b,S		; E3 7C
	adc $AFF988.l		; 6F 88 F9 AF
	ora $3BFBAF.l,X		; 1F AF FB 3B
	eor $65.b,X		; 55 65
	tsb $CEE8.w		; 0C E8 CE
	bit #$93.b		; 89 93
	ora ($34.b),Y		; 11 34
	sbc ($D2.b),Y		; F1 D2
	dex		; CA
	stz $CEE9.w		; 9C E9 CE
	bit #$D1.b		; 89 D1
	and ($1D.b),Y		; 31 1D
	cpx $BD.b		; E4 BD
	inc $1E.b		; E6 1E
	sbc ($0F.b,S),Y		; F3 0F
	dex		; CA
	cmp [$CF.b]		; C7 CF
	adc $D7.b		; 65 D7
	sbc $D5.b		; E5 D5
	sbc ($3D.b),Y		; F1 3D
	cmp [$03.b],Y		; D7 03
	cmp ($6F.b)		; D2 6F
	dec A		; 3A
	lda $57E7.w,X		; BD E7 57
	ldy $DBF2.w,X		; BC F2 DB
	ldx $9DAA.w		; AE AA 9D
	plp		; 28
	adc [$34.b],Y		; 77 34
	ply		; 7A
	tyx		; BB
	cpx $BA75.w		; EC 75 BA
	cli		; 58
	ror $F2.b,X		; 76 F2
	xce		; FB
	clc		; 18
	inc $42EF.w,X		; FE EF 42
	sty $4B.b		; 84 4B
	ora $8267.w,X		; 1D 67 82
	cmp #$BD.b		; C9 BD
	ora ($1E.b),Y		; 11 1E
	tda		; 7B
	nop		; EA
	ldx $3864.w,Y		; BE 64 38
	adc $78.b,X		; 75 78
	rol $7B.b,X		; 36 7B
	inx		; E8
	bit #$33.b		; 89 33
	sta $51ECCF.l,X		; 9F CF EC 51
	ora ($11.b),Y		; 11 11
	ldx #$7F.b		; A2 7F
	adc ($BF.b)		; 72 BF
	lda ($67.b,X)		; A1 67
	sta ($D7.b,X)		; 81 D7
	tda		; 7B
	ldx $F007.w		; AE 07 F0
	ror $3D.b,X		; 76 3D
	adc [$0F.b]		; 67 0F
	lda $2CFAE1.l		; AF E1 FA 2C
	adc $30.b,X		; 75 30
	cmp $97.b,X		; D5 97
	sta $AB97.w,X		; 9D 97 AB
	lda $7BE3B2.l,X		; BF B2 E3 7B
	tya		; 98
	tda		; 7B
	tya		; 98
	adc #$D5.b		; 69 D5
	adc $11F1.w		; 6D F1 11
	ora ($11.b),Y		; 11 11
	rol $F8B6.w		; 2E B6 F8
	dey		; 88
	dey		; 88
	dey		; 88
	sbc $F6CA.w,X		; FD CA F6
	tax		; AA
	dex		; CA
	ora $9DD1.w,Y		; 19 D1 9D
	ora ($11.b,S),Y		; 13 11
	and $30.b,X		; 35 30
	cmp ($C7.b,S),Y		; D3 C7
	phk		; 4B
	rol A		; 2A
	adc ($A7.b,S),Y		; 73 A7
	dec A		; 3A
	rol $23.b		; 26 23
	adc $4BF6.w		; 6D F6 4B
	sta ($87.b,S),Y		; 93 87
	adc [$8F.b]		; 67 8F
	eor $F7EAD3.l,X		; 5F D3 EA F7
	dec A		; 3A
	inc $BD2E.w		; EE 2E BD
	lda [$5B.b],Y		; B7 5B
	plb		; AB
	ror $A5.b		; 66 A5
	ply		; 7A
	adc $75.b,X		; 75 75
	bvc -123.b		; 50 85
	trb $E79D.w		; 1C 9D E7
	lda [$EF.b],Y		; B7 EF
	jmp ($D7D9.w)		; 6C D9 D7
	inc $1A.b,X		; F6 1A
	inc $31.b,X		; F6 31
	eor $8C.b,X		; 55 8C
	adc $8A1C.w,Y		; 79 1C 8A
	cpx $5FAF.w		; EC AF 5F
	ldx $D7.b,Y		; B6 D7
	txa		; 8A
	tax		; AA
	cmp $E4.b		; C5 E4
	dec A		; 3A
	ora $79F339.l,X		; 1F 39 F3 79
	ldx $1382.w		; AE 82 13
	adc $ABAA.w,Y		; 79 AA AB
	stx $5C.b,Y		; 96 5C
	inc $2B7F.w,X		; FE 7F 2B
	sta $18.b,X		; 95 18
	tsx		; BA
	ora $CF93.w,Y		; 19 93 CF
	adc $F159.w,Y		; 79 59 F1
	dec A		; 3A
	and $B21C.w,X		; 3D 1C B2
	sbc $F2.b		; E5 F2
	sbc $55B5.w		; ED B5 55
	adc [$3E.b]		; 67 3E
	xce		; FB
	ldx $7972.w,Y		; BE 72 79
	adc $65B9.w		; 6D B9 65
	wai		; CB
	sbc $DB.b		; E5 DB
	rtl		; 6B

	and [$BE.b],Y		; 37 BE
	lda ($C5.b)		; B2 C5
	eor $9B.b,X		; 55 9B
	stx $16.b		; 86 16
	adc $175B5C.l		; 6F 5C 5B 17
	tsb $B22C.w		; 0C 2C B2
	adc ($70.b,S),Y		; 73 70
	dex		; CA
	cpy $DB5B.w		; CC 5B DB
	cmp $BD.b,X		; D5 BD
	bpl  68.b		; 10 44
	lda $EF0B47.l,X		; BF 47 0B EF
	tsb $11.b		; 04 11
	sta $94D1.w		; 8D D1 94
	stz $CA.b		; 64 CA
	and ($8C.b)		; 32 8C
	lda $73.b,S		; A3 73
	stz $AE.b,X		; 74 AE
	bne -23.b		; D0 E9
	eor $9A74.w,X		; 5D 74 9A
	phy		; 5A
	phy		; 5A
	adc [$09.b]		; 67 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	stz $0827.w		; 9C 27 08
	eor ($0A.b,S),Y		; 53 0A
	adc ($4C.b,X)		; 61 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
.INDEX 16
	rep #$9C		; C2 9C
	rtl		; 6B

	tas		; 1B
	eor $59.b,X		; 55 59
	sei		; 78
	eor ($F0.b)		; 52 F0
	lda $21.b		; A5 21
	ora ($1B.b),Y		; 11 1B
	adc $6F.b		; 65 6F
	phb		; 8B
	adc $676B8B.l		; 6F 8B 6B 67
	bit #$F76F.w		; 89 6F F7
	rol $E22B.w,X		; 3E 2B E2
	cpx $0E7D.w		; EC 7D 0E
	stp		; DB
	sta $D9.b,S		; 83 D9
	inx		; E8
	cmp ($EB.b),Y		; D1 EB
	bvs -13.b		; 70 F3
	tya		; 98
	adc $3FBC.w,Y		; 79 BC 3F
	sbc [$96.b],Y		; F7 96
	dec $7CAB.w,X		; DE AB 7C
	inc $F84C.w,X		; FE 4C F8
	cmp $023FE6.l		; CF E6 3F 02
	ror $FF3C.w,X		; 7E 3C FF
	txs		; 9A
	adc $C7A20D.l,X		; 7F 0D A2 C7
	ldy $EB7F.w,X		; BC 7F EB
	eor [$B3.b]		; 47 B3
	lda $CD.b,S		; A3 CD
	eor ($FE.b),Y		; 51 FE
	lsr A		; 4A
	and $D0893A.l,X		; 3F 3A 89 D0
	eor $BE5E.w,Y		; 59 5E BE
	.db $42, $46		; 42 46
	plx		; FA
	lda ($19.b)		; B2 19
	sec		; 38
	and $BDE6.w,X		; 3D E6 BD
	eor $8808.w,Y		; 59 08 88
	dey		; 88
	wai		; CB
	eor $D9C276.l,X		; 5F 76 C2 D9
	eor [$8C.b],Y		; 57 8C
	and ($2D.b,S),Y		; 33 2D
	sta $78.b,X		; 95 78
	stp		; DB
	jsr $AD91.w		; 20 91 AD
	and $30DE.w		; 2D DE 30
	cpy $D946.w		; CC 46 D9
	ora $F05E.w,Y		; 19 5E F0
	phx		; DA
	sta ($37.b)		; 92 37
	cmp $90.b,X		; D5 90
	sta $00.b,X		; 95 00
	ora ($79.b,X)		; 01 79
	cmp $BE.b,S		; C3 BE
	ldy $86B3.w		; AC B3 86
	ldy $FB.b,X		; B4 FB
	cpx $8DE1.w		; EC E1 8D
	adc ($B4.b)		; 72 B4
	dec $DB1C.w		; CE 1C DB
	tsa		; 3B
	xce		; FB
	pla		; 68
	and #$77A3.w		; 29 A3 77
	ora $E56A.w		; 0D 6A E5
	pla		; 68
	cmp ($38.b),Y		; D1 38
	adc [$CE.b]		; 67 CE
	sty $2FA3.w		; 8C A3 2F
	pei ($97.b)		; D4 97
	cpx $4D7A.w		; EC 7A 4D
	tda		; 7B
	bit $9AA6.w		; 2C A6 9A
	dec A		; 3A
	lda $AE73F4.l,X		; BF F4 73 AE
	sta [$B1.b],Y		; 97 B1
	beq  59.b		; F0 3B
	and $4D7AFC.l		; 2F FC 7A 4D
	plb		; AB
	ora ($D4.b),Y		; 11 D4
	cmp $70AE.w,Y		; D9 AE 70
	pla		; 68
	stp		; DB
	lda $AF.b,S		; A3 AF
	sta [$27.b]		; 87 27
	sbc #$EEB9.w		; E9 B9 EE
	phk		; 4B
	ldx $57DE.w,Y		; BE DE 57
	php		; 08
	adc $54.b,X		; 75 54
	sei		; 78
	lsr $F25B.w,X		; 5E 5B F2
	and $D32F.w,X		; 3D 2F D3
	inc $70.b		; E6 70
	cmp ($FA.b),Y		; D1 FA
	asl $7D.b,X		; 16 7D
	dex		; CA
	inc $AA.b,X		; F6 AA
	phx		; DA
	plb		; AB
	adc $BDEFDF.l,X		; 7F DF EF BD
	ldx $F3.b		; A6 F3
	inc A		; 1A
	sbc ($D5.b),Y		; F1 D5
	stx $A6.b,Y		; 96 A6
	inc A		; 1A
	sei		; 78
	sbc #$A5E3.w		; E9 E3 A5
	sta $39.b,X		; 95 39
	cmp ($31.b),Y		; D1 31
	sep #$42		; E2 42
	stp		; DB
	cpx $3094.w		; EC 94 30
	lda $BE0B3E.l,X		; BF 3E 0B BE
	adc ($6D.b,X)		; 61 6D
	sbc ($BA.b),Y		; F1 BA
	cmp $375B.w,X		; DD 5B 37
	bne -128.b		; D0 80
	ora ($23.b,X)		; 01 23
	bcs -16.b		; B0 F0
	dec A		; 3A
	asl $74.b		; 06 74
	adc $0A.b,S		; 63 0A
	pld		; 2B
	lda $DF.b		; A5 DF
	sec		; 38
	tsa		; 3B
	cmp $AF9E.w,X		; DD 9E AF
	lda ($4E.b,X)		; A1 4E
	tda		; 7B
	ldy $0071.w,X		; BC 71 00
	ora $AF.b,S		; 03 AF
	sbc ($F5.b,X)		; E1 F5
	sbc $7876.w,Y		; F9 76 78
	sbc ($70.b)		; F2 70
	dec $7773.w,X		; DE 73 77
	cmp $FFFE.w,X		; DD FE FF
	sta ($C4.b),Y		; 91 C4
	sta [$B9.b]		; 87 B9
	stx $94.b		; 86 94
	bit $EA.b,X		; 34 EA
	pei ($AF.b)		; D4 AF
	plb		; AB
	dec $FB75.w,X		; DE 75 FB
	inc $7FCF.w		; EE CF 7F
	jmp ($F87B.w,X)		; 7C 7B F8
	adc $F45707.l,X		; 7F 07 57 F4
	tyx		; BB
	eor $4624.w,X		; 5D 24 46
	sty $9C.b		; 84 9C
	and ($EA.b,S),Y		; 33 EA
	plx		; FA
	ora $BFAF.w,X		; 1D AF BF
	mvp $E0,$44		; 44 44 E0
	adc [$D1.b],Y		; 77 D1
	lda $EAB96F.l,X		; BF 6F B9 EA
	inc $A8.b,X		; F6 A8
	inc $FB.b		; E6 FB
	ora $BFF4EC.l,X		; 1F EC F4 BF
	ora [$AB.b],Y		; 17 AB
	sbc $3F8D.w,X		; FD 8D 3F
	lda [$7C.b]		; A7 7C
	tda		; 7B
	stz $6BE3.w,X		; 9E E3 6B
	adc $EBCD.w,Y		; 79 CD EB
	lda $7EF1B3.l,X		; BF B3 F1 7E
	and $C77EE6.l		; 2F E6 7E C7
	ldy $7EFA.w,X		; BC FA 7E
	sta ($DD.b,S),Y		; 93 DD
	bvs  62.b		; 70 3E
	sta $9E.b		; 85 9E
	lda ($95.b,S),Y		; B3 95
	sbc [$39.b],Y		; F7 39
	and $F0CCC9.l,X		; 3F C9 CC F0
	adc $DBFF.w,Y		; 79 FF DB
	dec $98F9.w		; CE F9 98
	plx		; FA
	tyx		; BB
	sbc $65.b,X		; F5 65
	sbc $B8EEAE.l		; EF AE EE B8
	rol $AF0E.w,X		; 3E 0E AF
	sbc [$6A.b],Y		; F7 6A
	sei		; 78
	txy		; 9B
	dec $ED8E.w,X		; DE 8E ED
	jsl $527D5B.l		; 22 5B 7D 52
	and ($93.b)		; 32 93
	lda $F8466A.l,X		; BF 6A 46 F8
	cmp $FE6E.w,X		; DD 6E FE
	tax		; AA
	bra   0.b		; 80 00
	sta $199D.w,Y		; 99 9D 19
	eor $BE.b,S		; 43 BE
	tax		; AA
	txy		; 9B
	stz $9D.b,X		; 74 9D
	xce		; FB
	and #$3AD1.w		; 29 D1 3A
	adc ($D2.b,S),Y		; 73 D2
	wai		; CB
	adc $140029.l,X		; 7F 29 00 14
	ora $3D9E.w,X		; 1D 9E 3D
	stz $9C3C.w,X		; 9E 3C 9C
	bit $9295.w		; 2C 95 92
	ldx $F8.b,Y		; B6 F8
	sta $755A.w		; 8D 5A 75
	adc #$A9D5.w		; 69 D5 A9
	lsr $9AAD.w,X		; 5E AD 9A
	ldx $5D.b,Y		; B6 5D
	adc $A9F1.w		; 6D F1 A9
	mvp $68,$44		; 44 44 68
	rtl		; 6B

	.db $62, $A2, $22		; 62 A2 22
	bit $35.b,X		; 34 35
	lda ($77.b),Y		; B1 77
	and [$11.b],Y		; 37 11
	sta $5B.b,S		; 83 5B
	rtl		; 6B

	lda ($63.b,X)		; A1 63
	ora [$CC.b]		; 07 CC
	adc $ADFA.w		; 6D FA AD
	cpy $E8F3.w		; CC F3 E8
	stz $27.b,X		; 74 27
	bit $D8F3.w,X		; 3C F3 D8
	cld		; D8
	cmp $E9D9.w,Y		; D9 D9 E9
	stz $B6.b,X		; 74 B6
	inc $F3.b,X		; F6 F3
	cmp $7655.w		; CD 55 76
	jsr ($FC3C.w,X)		; FC 3C FC
	adc [$A5.b]		; 67 A5
	lda $E9D3.w,Y		; B9 D3 E9
	adc $8F31.w,Y		; 79 31 8F
	ora [$8B.b],Y		; 17 8B
	clc		; 18
	sbc $92.b		; E5 92
	tax		; AA
	dec $3C.b		; C6 3C
	stx $5946.w		; 8E 46 59
	pld		; 2B
	sty $63.b,X		; 94 63
	iny		; C8
	cpx $65.b		; E4 65
	sta [$4B.b],Y		; 97 4B
	stp		; DB
	ldy $2587.w,X		; BC 87 25
	lda ($C5.b)		; B2 C5
	eor $9C.b,X		; 55 9C
	sbc $DBBC.w,Y		; F9 BC DB
	bit $C956.w		; 2C 56 C9
	cmp $B2CD9B.l		; CF 9B CD B2
	dec $6F.b		; C6 6F
	and $B1.b,X		; 35 B1
	eor [$3C.b],Y		; 57 3C
	plx		; FA
	cli		; 58
	sbc ($3E.b,S),Y		; F3 3E
	sta $BF.b,X		; 95 BF
	stx $36F5.w		; 8E F5 36
	ply		; 7A
	stz $9FBE.w		; 9C BE 9F
	and ($99.b,S),Y		; 33 99
	adc $3FE362.l		; 6F 62 E3 3F
	ora $73.b,S		; 03 73
	adc $E696B9.l,X		; 7F B9 96 E6
	eor ($CA.b,S),Y		; 53 CA
	stp		; DB
	eor $1E.b,X		; 55 1E
	lda ($F4.b),Y		; B1 F4
	adc $0B7ECB.l		; 6F CB 7E 0B
	sed		; F8
	adc $9EAA.w		; 6D AA 9E
	and ($E1.b),Y		; 31 E1
	asl $F6B0.w,X		; 1E B0 F6
	adc [$D5.b]		; 67 D5
	trb $FA1B.w		; 1C 1B FA
	ora ($C2.b),Y		; 11 C2
	and [$F1.b],Y		; 37 F1
	adc $5EDEE0.l		; 6F E0 DE 5E
	rts		; 60

	dec $B8F1.w,X		; DE F1 B8
	ldy $0CAE.w,X		; BC AE 0C
	inx		; E8
	rep #$CB		; C2 CB
	sbc $7C.b,S		; E3 7C
	lsr $F4.b,X		; 56 F4
	jmp $0C0D.w		; 4C 0D 0C
	jmp ($30C1.w)		; 6C C1 30
	bcs  68.b		; B0 44
	eor [$04.b]		; 47 04
	eor $B30F.w		; 4D 0F B3
	tsb $11.b		; 04 11
	ora ($11.b),Y		; 11 11
	sty $28A3.w		; 8C A3 28
	cmp $A31B.w,X		; DD 1B A3
	stz $6E.b,X		; 74 6E
	sta $BAD1.w		; 8D D1 BA
	eor [$4A.b],Y		; 57 4A
	xba		; EB
	lda $74.b		; A5 74
	ldx $D295.w		; AE 95 D2
	tsx		; BA
	eor [$4A.b],Y		; 57 4A
	bvs -100.b		; 70 9C
	and [$09.b]		; 27 09
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	stz $1A1A.w		; 9C 1A 1A
	and ($4C.b,X)		; 21 4C
	and #$3085.w		; 29 85 30
	ldx $14.b		; A6 14
.INDEX 16
	rep #$9A		; C2 9A
	bit $79.b,X		; 34 79
	sei		; 78
	eor ($F0.b)		; 52 F0
	lda $29.b		; A5 29
	sei		; 78
	eor ($F0.b)		; 52 F0
	sta $56.b,X		; 95 56
	cmp $16DF16.l,X		; DF 16 DF 16
	dec $DF.b,X		; D6 DF
	asl $DF.b,X		; 16 DF
	trb $44.b		; 14 44
	tda		; 7B
	and $3D1A.w,X		; 3D 1A 3D
	stz $1E8D.w,X		; 9E 8D 1E
	cmp $FDE5B3.l		; CF B3 E5 FD
	adc $59.b		; 65 59
	jsr ($F199.w,X)		; FC 99 F1
	lda [$F2.b]		; A7 F2
	adc [$C6.b]		; 67 C6
	sta $7EECC9.l,X		; 9F C9 EC 7E
	beq -113.b		; F0 8F
	ldx $F8D7.w,Y		; BE D7 F8
	tsx		; BA
	sbc $C9AFCF.l,X		; FF CF AF C9
	cmp [$E5.b],Y		; D7 E5
	rtl		; 6B

	inx		; E8
	dex		; CA
	lda $BFB6.w,X		; BD B6 BF
	inc $6B.b		; E6 6B
	inc $BF8E.w,X		; FE 8E BF
	phd		; 0B
	eor $76AF83.l,X		; 5F 83 AF 76
	clv		; B8
	bit #$BAA1.w		; 89 A1 BA
	adc $62.b		; 65 62
	eor $111111.l,X		; 5F 11 11 11
	ora ($B7.b),Y		; 11 B7
	cpy #$FED7.w		; C0 D7 FE
	cmp [$C2.b]		; C7 C2
	jmp ($E927.w,X)		; 7C 27 E9
	and ($9A.b)		; 32 9A
	ldx $5F9E.w,Y		; BE 9E 5F
	phb		; 8B
	and $472F47.l		; 2F 47 2F 47
	and $642B4D.l		; 2F 4D 2B 64
	jmp $E15F.w		; 4C 5F E1
	jmp.w [$ECFC]		; DC FC EC
	jsr ($FD3C.w,X)		; FC 3C FD
	ror $AE7D.w,X		; 7E 7D AE
	bvs  30.b		; 70 1E
	lda $38FD.w,Y		; B9 FD 38
	adc $FC3C44.l,X		; 7F 44 3C FC
	rol $3D34.w,X		; 3E 34 3D
	jsr ($8133.w,X)		; FC 33 81
	adc $C6145D.l		; 6F 5D 14 C6
	lda ($11.b),Y		; B1 11
	inc A		; 1A
	tas		; 1B
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	inc A		; 1A
	inc A		; 1A
	ora ($1D.b),Y		; 11 1D
	stp		; DB
	ror A		; 6A
	plb		; AB
	tsb $CAEA.w		; 0C EA CA
	ldy $C66B.w,X		; BC 6B C6
	ora $8F88.w,Y		; 19 88 8F
	adc ($B3.b,S),Y		; 73 B3
	eor [$CE.b]		; 47 CE
	lda $6E.b,S		; A3 6E
	sta $2DCD.w,X		; 9D CD 2D
	ldy $599C.w,X		; BC 9C 59
	tyx		; BB
	dec A		; 3A
	sta $BDED3A.l,X		; 9F 3A ED BD
	and $6CC3.w		; 2D C3 6C
	plb		; AB
	rol A		; 2A
	sbc ($A2.b),Y		; F1 A2
	jmp ($DC3F.w,X)		; 7C 3F DC
	xce		; FB
	tad		; 5B
	ora $FEDE8D.l,X		; 1F 8D DE FE
	cmp $AB.b,S		; C3 AB
	stp		; DB
	nop		; EA
	dec A		; 3A
	pla		; 68
	inc $EEE7.w,X		; FE E7 EE
	cpx $F76A.w		; EC 6A F7
	ldx $3BB5.w,Y		; BE B5 3B
	ror $11E9.w,X		; 7E E9 11
	rol A		; 2A
	wai		; CB
	lda $CFBFCF.l,X		; BF CF BF CF
	.db $82, $EF, $DE		; 82 EF DE
	lda $31DE.w,Y		; B9 DE 31
	mvp $8D,$6F		; 44 6F 8D
	sbc ($95.b),Y		; F1 95
	clv		; B8
	eor $778D.w,Y		; 59 8D 77
	dec $56.b		; C6 56
	adc ($0C.b,X)		; 61 0C
	cpy $B6.b		; C4 B6
	eor $E3.b,X		; 55 E3
	lsr $AB23.w,X		; 5E 23 AB
	and $10F6.w		; 2D F6 10
	cpy $4444.w		; CC 44 44
	jmp $85E1.w		; 4C E1 85
	.db $82, $26, $70		; 82 26 70
	cpx $44.b		; E4 44
	rts		; 60

	adc $8285A1.l		; 6F A1 85 82
	jsl $57B723.l		; 22 23 B7 57
	lsr A		; 4A
	lda $359B.w,X		; BD 9B 35
	sbc $AF.b,S		; E3 AF
	ora $5D.b,X		; 15 5D
	stz $44.b,X		; 74 44
	mvp $46,$44		; 44 44 46
	sbc [$17.b],Y		; F7 17
	ora [$06.b],Y		; 17 06
	lsr A		; 4A
	lda $9D61DF.l		; AF DF 61 9D
	eor $8D57.w,Y		; 59 57 8D
	sei		; 78
	cmp $8880.w,Y		; D9 80 88
	xce		; FB
	ldx $A256.w,Y		; BE 56 A2
	jsl $792523.l		; 22 23 25 79
	jmp $444414.l		; 5C 14 44 44
	ora ($ED.b),Y		; 11 ED
	and ($F4.b)		; 32 F4
	eor $3A43.w,Y		; 59 43 3A
	and [$44.b]		; 27 44
	dec $A5.b		; C6 A5
	adc ($AB.b)		; 72 AB
	rol A		; 2A
	lda ($84.b,S),Y		; B3 84
	inx		; E8
	sta $C417.w,X		; 9D 17 C4
	rtl		; 6B

	phk		; 4B
	adc $56.b		; 65 56
	.db $42, $23		; 42 23
	eor ($AC.b)		; 52 AC
	sta $AAFC.w		; 8D FC AA
	iny		; C8
	lsr $A5.b		; 46 A5
	lsr $8C.b,X		; 56 8C
	tax		; AA
	sta $B5.b,X		; 95 B5
	rol $31.b,X		; 36 31
	eor $5D.b,X		; 55 5D
	cmp $1B.b,X		; D5 1B
	plx		; FA
	lda $D876.w,Y		; B9 76 D8
	cmp $D0.b		; C5 D0
	lda ($F3.b),Y		; B1 F3
	cmp $A3BDE4.l		; CF E4 BD A3
	cpx $409F.w		; EC 9F 40
	sta $F629.w,Y		; 99 29 F6
	sta $037C94.l		; 8F 94 7C 03
	tyx		; BB
	rol $99C0.w,X		; 3E C0 99
	stz $D6.b		; 64 D6
	inc $EF.b,X		; F6 EF
	bcs 123.b		; B0 7B
	adc [$B0.b],Y		; 77 B0
	tda		; 7B
	ror $B5.b,X		; 76 B5
	rtl		; 6B

	sbc $57.b		; E5 57
	lda $BD2A5F.l		; AF 5F 2A BD
	txa		; 8A
	sbc $B555.w,Y		; F9 55 B5
	tsx		; BA
	asl A		; 0A
	sbc [$9E.b]		; E7 9E
	eor $6D6D.w,Y		; 59 6D 6D
	adc ($F9.b)		; 72 F9
	ror $7183.w		; 6E 83 71
	txa		; 8A
	pea $4EBA.w		; F4 BA 4E
	sta ($9C.b,X)		; 81 9C
	jmp.w [$1B9C]		; DC 9C 1B
	cmp ($55.b),Y		; D1 55
	eor $38B9.w,Y		; 59 B9 38
	and [$A3.b],Y		; 37 A3
	cld		; D8
	adc $7B.b		; 65 7B
	cmp [$44.b]		; C7 44
	adc $DDCC4C.l		; 6F 4C CC DD
	inc $F56F.w,X		; FE 6F F5
	and ($7D.b,S),Y		; 33 7D
	lsr $CF71.w		; 4E 71 CF
	inc $7D.b		; E6 7D
	lsr $FB27.w		; 4E 27 FB
	bne -56.b		; D0 C8
	cpy #$90C0.w		; C0 C0 90
	brk $25.b		; 00 25
	jmp.w [$6B8C]		; DC 8C 6B
	dec $BF.b		; C6 BF
	ora [$B0.b]		; 07 B0
	pei ($D9.b)		; D4 D9
	pei ($D9.b)		; D4 D9
	pei ($D9.b)		; D4 D9
	ldy $4AD0.w,X		; BC D0 4A
	sed		; F8
	dey		; 88
	dey		; 88
	dey		; 88
	bit #$A2A0.w		; 89 A0 A2
	jsl $312222.l		; 22 22 22 31
	tsx		; BA
	and [$46.b],Y		; 37 46
	inx		; E8
	cmp $A31B.w,X		; DD 1B A3
	adc ($7B.b,S),Y		; 73 7B
	adc $BAD2.w,X		; 7D D2 BA
	eor [$4A.b],Y		; 57 4A
	sbc #$2B5D.w		; E9 5D 2B
	lda $7E.b		; A5 7E
	stx $A8AD.w		; 8E AD A8
	dey		; 88
	dey		; 88
	sta ($6D.b)		; 92 6D
	ldy $D0.b,X		; B4 D0
	eor ($54.b,X)		; 41 54
	mvp $41,$44		; 44 44 41
	eor ($43.b,S),Y		; 53 43
	xce		; FB
	clc		; 18
	tax		; AA
	jsl $CC2722.l		; 22 22 27 CC
	txa		; 8A
	txs		; 9A
	ora $88A86A.l,X		; 1F 6A A8 88
	dey		; 88
	.db $82, $A6, $87		; 82 A6 87
	dec $22AA.w,X		; DE AA 22
	jsl $A1A920.l		; 22 20 A9 A1
	sbc $A852.w,X		; FD 52 A8
	dey		; 88
	dey		; 88
	sty $2A.b,X		; 94 2A
	pla		; 68
	ply		; 7A
	tax		; AA
	jsl $A92222.l		; 22 22 22 A9
	lda ($FB.b,X)		; A1 FB
	txa		; 8A
	ldx #$2222.w		; A2 22 22
	ror $296E.w		; 6E 6E 29
	lda ($F9.b,X)		; A1 F9
	rol A		; 2A
	dey		; 88
	dey		; 88
	bit #$A692.w		; 89 92 A6
	.db $82, $19, $2A		; 82 19 2A
	jsl $5E2622.l		; 22 22 26 5E
	adc ($4D.b),Y		; 71 4D
	tsb $55.b		; 04 55
	ora ($11.b),Y		; 11 11
	ora ($53.b,S),Y		; 13 53
	adc $4D.b		; 65 4D
	tsb $55.b		; 04 55
	ora ($11.b),Y		; 11 11
	bpl  84.b		; 10 54
	bne  -8.b		; D0 F8
	eor ($CD.b,X)		; 41 CD
	ora ($11.b),Y		; 11 11
	ora ($0E.b)		; 12 0E
	adc $1A9A.w,Y		; 79 9A 1A
	inc A		; 1A
	bit $FF.b		; 24 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 03FFFF. Skipping.
.ENDS
