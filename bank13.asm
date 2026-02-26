.BANK 13 SLOT 0
.ORG $0000

.SECTION "Bank13" FORCE

	rol $FB.b		; 26 FB
	brk $07.b		; 00 07
	asl $05.b		; 06 05
	brk $E1.b		; 00 E1
	lsr $4BF6.w,X		; 5E F6 4B
	plx		; FA
	phk		; 4B
	sec		; 38
	ora ($A1.b),Y		; 11 A1
	rol A		; 2A
	asl $8501.w		; 0E 01 85
	and ($35.b,X)		; 21 35
	adc $2C.b,X		; 75 2C
	ora ($A1.b),Y		; 11 A1
	ora ($09.b,S),Y		; 13 09
	lda $90.b		; A5 90
	plp		; 28
	jmp $0749.w		; 4C 49 07
	phd		; 0B
	ora ($EE.b,S),Y		; 13 EE
	sbc $96.b		; E5 96
	inc $AF.b,X		; F6 AF
	sty $91.b		; 84 91
	ora ($C9.b,S),Y		; 13 C9
	adc ($B1.b,X)		; 61 B1
	eor $9A24.w,Y		; 59 24 9A
	adc #$24.b		; 69 24
	sta ($69.b)		; 92 69
	rol $92.b		; 26 92
	eor #$15.b		; 49 15
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($52.b),Y		; 91 52
	eor #$24.b		; 49 24
	sta ($49.b,S),Y		; 93 49
	ora ($24.b),Y		; 11 24
	sta ($44.b)		; 92 44
	eor #$34.b		; 49 34
	sta ($49.b)		; 92 49
	bit $64.b		; 24 64
	cmp ($49.b)		; D2 49
	bit $91.b		; 24 91
	ora ($49.b,S),Y		; 13 49
	bit $92.b		; 24 92
	eor #$34.b		; 49 34
	sta ($45.b)		; 92 45
	eor #$15.b		; 49 15
	bit $93.b		; 24 93
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $93.b,X		; 34 93
	eor [$49.b]		; 47 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $C2.b		; 24 C2
	eor $F02CB4.l,X		; 5F B4 2C F0
	and ($9A.b),Y		; 31 9A
	lda $3C.b,S		; A3 3C
	eor ($AA.b),Y		; 51 AA
	lda ($CC.b,S),Y		; B3 CC
	ror A		; 6A
	cmp $5703.w		; CD 03 57
	rtl		; 6B

	asl A		; 0A
	sta $2A.b,X		; 95 2A
	mvn $52,$A9		; 54 A9 52
	lda $4A.b		; A5 4A
	sta $2A.b,X		; 95 2A
	mvn $52,$A9		; 54 A9 52
	lda $4D.b		; A5 4D
	ora $59.b,S		; 03 59
	tda		; 7B
	ldx $79.b		; A6 79
	adc $9AD676.l		; 6F 76 D6 9A
	stp		; DB
	dec $562B.w,X		; DE 2B 56
	lda $B55A.w		; AD 5A B5
	ror A		; 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $B5.b,X		; D5 B5
	ldx $B6.b		; A6 B6
	sbc [$AC.b],Y		; F7 AC
	sbc ($DA.b)		; F2 DA
	asl $B8.b,X		; 16 B8
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($63.b),Y		; B1 63
	eor $CD6B.w,X		; 5D 6B CD
	adc $5B9E.w,X		; 7D 9E 5B
	rts		; 60

	jmp ($892D.w)		; 6C 2D 89
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	ldx #$5F.b		; A2 5F
	and $F5EBD7.l		; 2F D7 EB F5
	xce		; FB
	adc $5F.b,S		; 63 5F
	and $2D2D.w		; 2D 2D 2D
	and $4C34.w		; 2D 34 4C
	asl $0B.b		; 06 0B
	bit $12C6.w,X		; 3C C6 12
	stp		; DB
	cmp $46FB3D.l,X		; DF 3D FB 46
	cmp $361A.w,Y		; D9 1A 36
	dex		; CA
	ldx $CD6C.w,Y		; BE 6C CD
	sta $1FF0.w,X		; 9D F0 1F
	ora $B4.b		; 05 B4
	rol $96.b,X		; 36 96
	pei ($D1.b)		; D4 D1
	ldx $B6.b,Y		; B6 B6
	cld		; D8
	stp		; DB
	cli		; 58
	tsb $7916.w		; 0C 16 79
	sty $B625.w		; 8C 25 B6
	jmp.w [$4FF8]		; DC F8 4F
	stx $F8.b		; 86 F8
	dey		; 88
	jmp ($F355.w,X)		; 7C 55 F3
	sbc $3E.b,S		; E3 3E
	tsa		; 3B
	adc $C50D6E.l		; 6F 6E 0D C5
	lda $3437.w,Y		; B9 37 34
	and [$46.b],Y		; 37 46
	nop		; EA
	cmp $0C98.w,X		; DD 98 0C
	asl $EE.b,X		; 16 EE
	dec $CB1B.w,X		; DE 1B CB
	ply		; 7A
	brk $06.b		; 00 06
	ora ($DB.b)		; 12 DB
	ror $6D6F.w		; 6E 6F 6D
	sbc ($F2.b),Y		; F1 F2
	ora $97F225.l,X		; 1F 25 F2 97
	cmp $8FF996.l		; CF 96 F9 8F
	txs		; 9A
	cmp $7FF35B.l,X		; DF 5B F3 7F
	bvs  14.b		; 70 0E
	ora $C1.b		; 05 C1
	sec		; 38
	and [$08.b],Y		; 37 08
	cpy #$60.b		; C0 60
	clv		; B8
	eor [$0C.b],Y		; 57 0C
	sbc $9ECF.w,Y		; F9 CF 9E
	brk $0C.b		; 00 0C
	and $B7.b		; 25 B7
	asl $1CE2.w		; 0E E2 1C
	phk		; 4B
	txa		; 8A
	adc $D107.w,X		; 7D 07 D1
	adc $D327.w,X		; 7D 27 D3
	adc ($6E.b),Y		; 71 6E
	and ($C6.b),Y		; 31 C6
	clv		; B8
	sbc [$1E.b]		; E7 1E
	cpx $1C.b		; E4 1C
	phb		; 8B
	sta ($7D.b)		; 92 7D
	eor [$D5.b]		; 47 D5
	rts		; 60

	bmi  90.b		; 30 5A
	eor [$D6.b]		; 47 D6
	adc $2677.w,X		; 7D 77 26
	cmp $61.b,S		; C3 61
	bcs -40.b		; B0 D8
	jmp ($2346.w)		; 6C 46 23
	sty $5B.b,X		; 94 5B
	adc ($AC.b)		; 72 AC
	lsr $2B.b,X		; 56 2B
	stx $62.b,Y		; 96 62
	lda ($5F.b),Y		; B1 5F
	adc ($F6.b,X)		; 61 F6
	jmp $7398BB.l		; 5C BB 98 73
	rol $CD69.w		; 2E 69 CD
	lda $3AC7.w,Y		; B9 C7 3A
	sbc [$9C.b]		; E7 9C
	xce		; FB
	ldy #$7D.b		; A0 7D
	ldx $33.b		; A6 33
	sbc $E3BE.w		; ED BE E3
	inc $F3BE.w		; EE BE F3
	ora ($88.b),Y		; 11 88
	cpy $62.b		; C4 62
	and ($D8.b),Y		; 31 D8
	sbc $FCB6BE.l		; EF BE B6 FC
	ora $5DE8C2.l		; 0F C2 E8 5D
	ora ($F1.b,S),Y		; 13 F1
	and $E84A1B.l,X		; 3F 1B 4A E8
	cmp $A523.w,X		; DD 23 A5
	stz $CE.b,X		; 74 CE
	sta $3AD4.w,X		; 9D D4 3A
	sta [$54.b],Y		; 97 54
	nop		; EA
	cmp $F263.w,X		; DD 63 F2
	bit $CC.b,X		; 34 CC
	adc [$E5.b]		; 67 E5
	ror $E767.w,X		; 7E 67 E7
	adc $AC.b,X		; 75 AC
	ror $3B.b,X		; 76 3B
	ora $C88E.w,X		; 1D 8E C8
	stz $3A.b		; 64 3A
	sbc $B7.b		; E5 B7
	inx		; E8
	ror $5E97.w,X		; 7E 97 5E
	cpx $8B1D.w		; EC 1D 8B
	lda ($69.b)		; B2 69
	eor $B49B.w,X		; 5D 9B B4
	ror $AD.b,X		; 76 AD
	dec A		; 3A
.ACCU 8
	sep #$E3		; E2 E3
	ldx $76.b,Y		; B6 76
	xba		; EB
	phb		; 8B
	sta $4C43.w		; 8D 43 4C
	dec $77.b		; C6 77
	asl $DDE5.w		; 0E E5 DD
	and $902153.l,X		; 3F 53 21 90
	iny		; C8
	stz $32.b		; 64 32
	eor $D62F.w,Y		; 59 2F D6
	ldx $EE.b,Y		; B6 EE
	cmp $BDE3.w,X		; DD E3 BD
	adc [$CE.b],Y		; 77 CE
	sbc $34E0.w,X		; FD E0 34
	lda $AFFDD8.l		; AF D8 FD AF
	jmp.w [$AED3]		; DC D3 AE
	rol $7B3F.w		; 2E 3F 7B
	sed		; F8
	rol $352E.w		; 2E 2E 35
	ora $69C6E2.l		; 0F E2 C6 69
	asl $E30A.w,X		; 1E 0A E3
.ACCU 16
	rep #$64		; C2 64
	lda ($59.b)		; B2 59
	bit $5396.w		; 2C 96 53
	and #$BCE1.w		; 29 E1 BC
	eor [$F2.b]		; 47 F2
	adc $B2.b		; 65 B2
	cmp $B66C.w,Y		; D9 6C B6
	tad		; 5B
	lsr A		; 4A
	inc $E86F.w,X		; FE 6F E8
	inc $3AAD.w,X		; FE AD 3A
.ACCU 8
	sep #$E3		; E2 E3
	xce		; FB
	and $E3E2BA.l,X		; 3F BA E2 E3
	bvc -15.b		; 50 F1
	lsr $C733.w,X		; 5E 33 C7
	adc $8F0B.w,Y		; 79 0B 8F
	and $94.b		; 25 94
	dex		; CA
	adc $32.b		; 65 32
	sta $C78C.w,Y		; 99 8C C7
	sty $FF.b,X		; 94 FF
	ora $66CDF2.l		; 0F F2 CD 66
	lda ($59.b,S),Y		; B3 59
	ldy $96D7.w		; AC D7 96
	sbc ($1E.b,S),Y		; F3 1E
	rtl		; 6B

	dec $EF79.w		; CE 79 EF
	eor ($E8.b,X)		; 41 E8
	lda $A627.w,X		; BD 27 A6
	sbc $1E.b,X		; F5 1E
	plb		; AB
	dec $7F.b,X		; D6 7F
	lda [$FB.b]		; A7 FB
	ply		; 7A
	sbc $524B.w		; ED 4B 52
	inc $1E.b,X		; F6 1E
	wai		; CB
	and ($98.b),Y		; 31 98
	cpy $3367.w		; CC 67 33
	stz $FED3.w,X		; 9E D3 FE
	rol $AEAE.w		; 2E AE AE
	ldx $AEAE.w		; AE AE AE
	lda $5EDBEB.l,X		; BF EB DB 5E
	lsr $5E5E.w,X		; 5E 5E 5E
	lsr $5E5E.w,X		; 5E 5E 5E
	lsr $5E5E.w,X		; 5E 5E 5E
	lsr $8F7B.w,X		; 5E 7B 8F
	jsr ($BABA.w,X)		; FC BA BA
	tsx		; BA
	sbc $73E6EC.l,X		; FF EC E6 73
	and $9224.w,Y		; 39 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $D3.b,X		; 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $1445.w		; 4D 45 14
	eor ($45.b),Y		; 51 45
	trb $51.b		; 14 51
	eor $14.b		; 45 14
	eor ($45.b),Y		; 51 45
	trb $51.b		; 14 51
	eor $14.b		; 45 14
	eor ($45.b),Y		; 51 45
	trb $51.b		; 14 51
	eor $14.b		; 45 14
	eor ($45.b),Y		; 51 45
	trb $51.b		; 14 51
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	sta $FB4220.l,X		; 9F 20 42 FB
	brk $3D.b		; 00 3D
	cpy #$E3.b		; C0 E3
	brk $3D.b		; 00 3D
	cpy #$16.b		; C0 16
	lda $0023.w		; AD 23 00
	brk $25.b		; 00 25
	sbc $232DFF.l,X		; FF FF 2D 23
	and $3A.b,S		; 23 3A
	and $25.b		; 25 25
	tsa		; 3B
	and $422D.w		; 2D 2D 42
	sbc $3A4600.l,X		; FF 00 46 3A
	dec A		; 3A
	eor [$42.b]		; 47 42
	.db $42, $4A		; 42 4A
	tsa		; 3B
	tsa		; 3B
	eor $0F0F.w		; 4D 0F 0F
	lsr $0F.b,X		; 56 0F
	sbc $474758.l,X		; FF 58 47 47
	eor $F9F9.w,Y		; 59 F9 F9
	jmp $694646.l		; 5C 46 46 69
	eor $6A4D.w		; 4D 4D 6A
	inc $6D01.w,X		; FE 01 6D
	and $00.b,S		; 23 00
	ror $4AFF.w		; 6E FF 4A
	ror $56.b,X		; 76 56
	lsr $89.b,X		; 56 89
	ora $F38B00.l		; 0F 00 8B F3
	sbc ($8C.b,S),Y		; F3 8C
	sbc $F08DF8.l,X		; FF F8 8D F0
	brk $8E.b		; 00 8E
	ror A		; 6A
	ror A		; 6A
	sta $89.b,X		; 95 89
	bit #$96.b		; 89 96
	ora $FC.b,S		; 03 FC
	txs		; 9A
	eor $9B59.w,Y		; 59 59 9B
	inc $9DFE.w,X		; FE FE 9D
	sty $A18C.w		; 8C 8C A1
	beq  -1.b		; F0 FF
	ldx #$FC.b		; A2 FC
	sed		; F8
	lda $00.b,S		; A3 00
	asl $A9.b		; 06 A9
	and $AC23.w		; 2D 23 AC
	jmp $8DB14A.l		; 5C 4A B1 8D
	sta $76B2.w		; 8D B2 76
	ror $B4.b,X		; 76 B4
	cli		; 58
	eor [$B5.b]		; 47 B5
	sbc ($F1.b),Y		; F1 F1
	ldx $96.b,Y		; B6 96
	stx $B8.b,Y		; 96 B8
	adc #$69.b		; 69 69
	lda $F70F.w,Y		; B9 0F F7
	cmp $3A.b		; C5 3A
	and $C8.b		; 25 C8
	cpy #$FF.b		; C0 FF
	wai		; CB
	ora ($00.b,X)		; 01 00
	cmp ($A2.b)		; D2 A2
	ldx #$D4.b		; A2 D4
	lda $A3.b,S		; A3 A3
	dec $A1.b,X		; D6 A1
	lda ($DA.b,X)		; A1 DA
	sed		; F8
	sed		; F8
	stp		; DB
	jmp $46DE6E.l		; 5C 6E DE 46
	and $13.b		; 25 13
	phb		; 8B
	phb		; 8B
	ora $E7E7.w,X		; 1D E7 E7
	and ($07.b,X)		; 21 07
	ora [$29.b]		; 07 29
	sbc $E3.b,S		; E3 E3
	pld		; 2B
	bpl  16.b		; 10 10
	bit $2D3B.w		; 2C 3B 2D
	bit $B9.b,X		; 34 B9
	lda $FF37.w,Y		; B9 37 FF
	adc $00FE3D.l,X		; 7F 3D FE 00
	jmp $C8C8.w		; 4C C8 C8
	lsr $CBCB.w		; 4E CB CB
	eor ($DC.b)		; 52 DC
	tsb $0C5A.w		; 0C 5A 0C
	brk $5B.b		; 00 5B
	sbc $375DF1.l,X		; FF F1 5D 37
	and [$5E.b],Y		; 37 5E
	and $613D.w,X		; 3D 3D 61
	ldy $42.b,X		; B4 42
	.db $62, $8F, $8F		; 62 8F 8F
	stz $D3.b		; 64 D3
	jsr ($E065.w,X)		; FC 65 E0
	cpx #$66.b		; E0 66
	cpy #$00.b		; C0 00
	rtl		; 6B

	phy		; 5A
	phy		; 5A
	adc ($FF.b)		; 72 FF
	inc $5274.w,X		; FE 74 52
	eor ($7A.b)		; 52 7A
	beq -16.b		; F0 F0
	bcc -128.b		; 90 80
	brk $91.b		; 00 91
	sbc $6692FC.l,X		; FF FC 92 66
	ror $99.b		; 66 99
	inc $A641.w,X		; FE 41 A6
	and $46A7D0.l		; 2F D0 A7 46
	dec A		; 3A
	lda $5B5B.w		; AD 5B 5B
	lda ($64.b,S),Y		; B3 64
	stz $B7.b		; 64 B7
	adc ($72.b)		; 72 72
	lda $0004.w,X		; BD 04 00
	ldx $FF42.w,Y		; BE 42 FF
	dec $90.b		; C6 90
	bcc -51.b		; 90 CD
	sta $D79D.w,X		; 9D 9D D7
	cmp ($D2.b)		; D2 D2
	cmp $0018.w,Y		; D9 18 00
	sbc #$1F.b		; E9 1F
	sbc $BDBDEA.l,X		; FF EA BD BD
	sbc ($00.b)		; F2 00
	sed		; F8
	trb $8F.b		; 14 8F
	sbc $A93B22.l,X		; FF 22 3B A9
	rol $8E.b		; 26 8E
	stx $9135.w		; 8E 35 91
	sta ($43.b),Y		; 91 43
	txs		; 9A
	txs		; 9A
	pha		; 48
	sbc $954B10.l		; EF 10 4B 95
	sta $51.b,X		; 95 51
	txy		; 9B
	txy		; 9B
	eor ($07.b,S),Y		; 53 07
	sbc [$63.b],Y		; F7 63
	ora #$F9.b		; 09 F9
	jmp ($1F1F.w)		; 6C 1F 1F
	adc $46.b,X		; 75 46
	cmp $7B.b		; C5 7B
	lsr A		; 4A
	lsr A		; 4A
	adc $9999.w,X		; 7D 99 99
	sta $B6.b		; 85 B6
	ldx $8A.b,Y		; B6 8A
	brk $70.b		; 00 70
	sty $FF.b,X		; 94 FF
	jsr $F29C.w		; 20 9C F2
	sbc ($9E.b)		; F2 9E
	sed		; F8
	beq -91.b		; F0 A5
	cmp $AED9.w,Y		; D9 D9 AE
	sbc #$E9.b		; E9 E9
	ldy $3F03.w,X		; BC 03 3F
	cmp #$4C.b		; C9 4C
	jmp $B1CA.w		; 4C CA B1
	lda ($CE.b),Y		; B1 CE
	brk $07.b		; 00 07
	pea $8A8A.w		; F4 8A 8A
	ora ($FF.b)		; 12 FF
	adc $9415.w		; 6D 15 94
	sty $3C.b,X		; 94 3C
	and $0E443F.l,X		; 3F 3F 44 0E
	sbc [$45.b],Y		; F7 45
	trb $14.b		; 14 14
	eor $606E42.l		; 4F 42 6E 60
	pei ($D4.b)		; D4 D4
	pla		; 68
	brk $30.b		; 00 30
	jmp ($FFC7.w,X)		; 7C C7 FF
	ldy $07.b		; A4 07
	and $0101BB.l,X		; 3F BB 01 01
	cld		; D8
	ora $E51D.w,X		; 1D 1D E5
	pha		; 48
	pha		; 48
	xba		; EB
	adc $63.b,S		; 63 63
	sbc $9E9E.w		; ED 9E 9E
	ora $B5B5.w		; 0D B5 B5
	inc A		; 1A
	cpy #$C0.b		; C0 C0
	bit $E8.b		; 24 E8
	inx		; E8
	and [$25.b]		; 27 25
	brk $2A.b		; 00 2A
	pla		; 68
	pla		; 68
	eor #$E7.b		; 49 E7
	sbc $C03F73.l,X		; FF 73 3F C0
	sta ($06.b,S),Y		; 93 06
	ora ($A8.b,X)		; 01 A8
	beq  -5.b		; F0 FB
	bcs  19.b		; B0 13
	ora ($BA.b,S),Y		; 13 BA
	and $3A.b,S		; 23 3A
	cpy $34.b		; C4 34
	bit $D5.b,X		; 34 D5
	.db $62, $62, $EC		; 62 62 EC
	cmp [$00.b]		; C7 00
	inc $F7.b,X		; F6 F7
	sbc $49490B.l,X		; FF 0B 49 49
	plp		; 28
	jmp ($547C.w,X)		; 7C 7C 54
	sta [$77.b]		; 87 77
	eor [$BC.b],Y		; 57 BC
	ldy $DA78.w,X		; BC 78 DA
	phx		; DA
	sty $F1.b		; 84 F1
	sed		; F8
	sta $ABF008.l,X		; 9F 08 F0 AB
	and #$29.b		; 29 29
	plx		; FA
	cpx #$00.b		; E0 00
	asl A		; 0A
	and $FF.b		; 25 FF
	ora ($EC.b),Y		; 11 EC
	cpx $F61B.w		; EC 1B F6
	inc $39.b,X		; F6 39
	adc ($00.b),Y		; 71 00
	stx $DF.b		; 86 DF
	sbc $FAFACC.l,X		; FF CC FA FA
	inc $007F.w		; EE 7F 00
	trb $23FF.w		; 1C FF 23
	and ($39.b)		; 32 39
	and $F936.w,Y		; 39 36 F9
	brk $6F.b		; 00 6F
	sbc $009701.l,X		; FF 01 97 00
	eor [$DD.b]		; 47 DD
	sbc $36E6E0.l,X		; FF E0 E6 36
	rol $F5.b,X		; 36 F5
	php		; 08
	brk $7B.b		; 00 7B
	tda		; 7B
	jsl $6D2CC0.l		; 22 C0 2C 6D
	cpy #$2C.b		; C0 2C
	adc $4A1A.w		; 6D 1A 4A
	jsl $6D2C80.l		; 22 80 2C 6D
	bra  44.b		; 80 2C
	adc $8080.w		; 6D 80 80
	lsr A		; 4A
	bit $80EE.w		; 2C EE 80
	bit $FF6D.w		; 2C 6D FF
	jsl $A96EEE.l		; 22 EE 6E A9
	wai		; CB
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	sbc $171807.l,X		; FF 07 18 17
	and $CB00.w		; 2D 00 CB
	ora $CE.b,S		; 03 CE
	brk $21.b		; 00 21
	brk $F0.b		; 00 F0
	ora $03BB2D.l		; 0F 2D BB 03
	ora $21.b,S		; 03 21
	and ($07.b,X)		; 21 07
	sbc $806E1F.l,X		; FF 1F 6E 80
	rti		; 40

	bra  64.b		; 80 40
	cpy #$80.b		; C0 80
	ldy #$00.b		; A0 00
	asl $B0.b,X		; 16 B0
	jsr $B016.w		; 20 16 B0
	jsr $C0FF.w		; 20 FF C0
	asl $BC.b,X		; 16 BC
	and ($C6.b,S),Y		; 33 C6
	ror $20.b		; 66 20
	cpy #$30.b		; C0 30
	cpy #$30.b		; C0 30
	cpy #$8D.b		; C0 8D
	asl $3C.b,X		; 16 3C
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	cpy #$65.b		; C0 65
	ply		; 7A
	ply		; 7A
	lda ($FC.b,X)		; A1 FC
	ror $1C2C.w		; 6E 2C 1C
	cpy #$22.b		; C0 22
	and $2C4F22.l,X		; 3F 22 4F 2C
	ror $FF00.w		; 6E 00 FF
	jsl $C0C64F.l		; 22 4F C6 C0
	bra -96.b		; 80 A0
	brk $16.b		; 00 16
	bcs  32.b		; B0 20
	asl $B0.b,X		; 16 B0
	jsr $C0FF.w		; 20 FF C0
	asl $BC.b,X		; 16 BC
	and ($C6.b,S),Y		; 33 C6
	ror $20.b		; 66 20
	cpy #$30.b		; C0 30
	cpy #$30.b		; C0 30
	cpy #$8D.b		; C0 8D
	asl $3C.b,X		; 16 3C
	cpy #$80.b		; C0 80
	bra -128.b		; 80 80
	bra  26.b		; 80 1A
	adc $7A.b		; 65 7A
	ply		; 7A
	lda ($FC.b,X)		; A1 FC
	ror $C02C.w		; 6E 2C C0
	and $E0.b,S		; 23 E0
	lsr A		; 4A
	bit $6600.w		; 2C 00 66
	cpx #$4A.b		; E0 4A
	eor $375D.w,X		; 5D 5D 37
	inc $3790.w		; EE 90 37
	dec $C6.b		; C6 C6
	bra 109.b		; 80 6D
	.db $42, $80		; 42 80
	and $58.b,S		; 23 58
	.db $42, $EE		; 42 EE
	eor $16FBE4.l		; 4F E4 FB 16
	cpx $16D3.w		; EC D3 16
	cld		; D8
	asl $A7.b,X		; 16 A7
	beq -116.b		; F0 8C
	and $6D.b		; 25 6D
	and $16.b		; 25 16
	bit $1F.b		; 24 1F
	asl $4C.b,X		; 16 4C
	and $A97F18.l,X		; 3F 18 7F A9
	ora ($3F.b)		; 12 3F
	eor $4F58.w,X		; 5D 58 4F
	asl $BE.b,X		; 16 BE
	asl $3D.b,X		; 16 3D
	lda $38BF3E.l,X		; BF 3E BF 38
	brk $42.b		; 00 42
	and $6D.b		; 25 6D
	and $3E.b		; 25 3E
	cpy #$73.b		; C0 73
	adc ($A9.b,S),Y		; 73 A9
	ora ($FE.b)		; 12 FE
	dec A		; 3A
	cli		; 58
	eor $0776AE.l		; 4F AE 76 07
	and $6D.b		; 25 6D
	and $2C.b		; 25 2C
	sbc $6E612D.l,X		; FF 2D 61 6E
	dec $2512.w,X		; DE 12 25
	bit $2DFF.w		; 2C FF 2D
	adc ($6E.b,X)		; 61 6E
	brk $CC.b		; 00 CC
	cpy $C0E0.w		; CC E0 C0
	and $20.b,S		; 23 20
	cpy #$E0.b		; C0 E0
	bit $2DC0.w		; 2C C0 2D
	cpy $FACC.w		; CC CC FA
	ror $FA.b		; 66 FA
	cpx #$4A.b		; E0 4A
	eor $375D.w,X		; 5D 5D 37
	brk $95.b		; 00 95
	tsb $C6C6.w		; 0C C6 C6
	bra  35.b		; 80 23
	ora $0C0F08.l		; 0F 08 0F 0C
	bit #$58.b		; 89 58
	sbc $4A4D69.l,X		; FF 69 4D 4A
	dec $6E47.w,X		; DE 47 6E
	and $58.b,S		; 23 58
	cmp $6E.b		; C5 6E
	dec $FF97.w,X		; DE 97 FF
	tsa		; 3B
	adc $C561.w		; 6D 61 C5
	ror $01DE.w		; 6E DE 01
	stx $3BFE.w		; 8E FE 3B
	adc $3D5E.w		; 6D 5E 3D
	cli		; 58
	cmp $6E.b		; C5 6E
	dec $998E.w,X		; DE 8E 99
	tsa		; 3B
	adc $01CB.w		; 6D CB 01
	cpx #$CB.b		; E0 CB
	cli		; 58
	cmp $6E.b		; C5 6E
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	lsr A		; 4A
	and $CC6D.w		; 2D 6D CC
	cpy $4AE0.w		; CC E0 4A
	and $4B6D.w		; 2D 6D 4B
	sta $89.b,X		; 95 89
	ora $B8B80E.l		; 0F 0E B8 B8
	clv		; B8
	adc #$4D.b		; 69 4D
	ora $15154A.l		; 0F 4A 15 15
	ora $15.b,X		; 15 15
	bvs   0.b		; 70 00
	and ($32.b)		; 32 32
	and ($39.b)		; 32 39
	ldy $B400.w		; AC 00 B4
	ora ($61.b)		; 12 61
	stp		; DB
	brk $B4.b		; 00 B4
	ora ($B4.b)		; 12 B4
	and [$75.b]		; 27 75
	lsr A		; 4A
	trb $CB61.w		; 1C 61 CB
	ldy $FF.b,X		; B4 FF
	ror A		; 6A
	adc $BB.b,X		; 75 BB
	jsl $5823FE.l		; 22 FE 23 58
	cli		; 58
	adc ($DB.b,X)		; 61 DB
	brk $B4.b		; 00 B4
	and $23.b		; 25 23
	ldy $5C.b,X		; B4 5C
	and $6E.b		; 25 6E
	brk $B4.b		; 00 B4
	sbc $B4006A.l,X		; FF 6A 00 B4
	adc ($DB.b)		; 72 DB
	ora ($26.b,X)		; 01 26
	stx $5E6A.w		; 8E 6A 5E
	lsr $5E5E.w,X		; 5E 5E 5E
	inc $7DAC.w,X		; FE AC 7D
	adc $7D7D.w,X		; 7D 7D 7D
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	sep #$01		; E2 01
	ldy $4B00.w		; AC 00 4B
	sta $89.b,X		; 95 89
	clv		; B8
	clv		; B8
	clv		; B8
	clv		; B8
	ora $15154A.l		; 0F 4A 15 15
	ora $15.b,X		; 15 15
	and ($32.b)		; 32 32
	and ($32.b)		; 32 32
	ldy $BF00.w		; AC 00 BF
	sta [$8D.b],Y		; 97 8D
	lsr $FE3D.w,X		; 5E 3D FE
	bra -35.b		; 80 DD
	sbc $B7FCD6.l,X		; FF D6 FC B7
	adc ($DB.b)		; 72 DB
	adc $2A3F.w		; 6D 3F 2A
	rol A		; 2A
	pea $9242.w		; F4 42 92
	ora ($EC.b),Y		; 11 EC
	cmp $00.b,S		; C3 00
	cmp ($2D.b,X)		; C1 2D
	brk $B8.b		; 00 B8
	adc #$47.b		; 69 47
	dex		; CA
	sta $2DF0.w		; 8D F0 2D
	sbc $2DFF2C.l,X		; FF 2C FF 2D
	brk $58.b		; 00 58
	sbc $A7002D.l,X		; FF 2D 00 A7
	eor $EA00F7.l		; 4F F7 00 EA
	nop		; EA
	lda $4204.w,X		; BD 04 42
	sbc $F5.b,X		; F5 F5
	inc $E6.b		; E6 E6
	sbc $002D.w,Y		; F9 2D 00
	bcs  19.b		; B0 13
	eor [$6B.b]		; 47 6B
	rtl		; 6B

	phy		; 5A
	tsb $CB23.w		; 0C 23 CB
	rol $4E.b,X		; 36 4E
	lsr $01CB.w		; 4E CB 01
	ror A		; 6A
	sta ($93.b,S),Y		; 93 93
	rol $6A.b		; 26 6A
	tyx		; BB
	tyx		; BB
	eor $9A.b,S		; 43 9A
	and $60FE.w,X		; 3D FE 60
	pei ($00.b)		; D4 00
	.db $42, $66		; 42 66
	cmp $0FDF00.l,X		; DF 00 DF 0F
	stz $74.b,X		; 74 74
	and $C8.b		; 25 C8
	stx $D0.b		; 86 D0
	sbc $ACB3B3.l,X		; FF B3 B3 AC
	ora ($42.b)		; 12 42
	and $6D.b		; 25 6D
	ora ($2D.b,X)		; 01 2D
	and [$25.b]		; 27 25
	.db $42, $27		; 42 27
	.db $42, $FD		; 42 FD
	cop $FB.b		; 02 FB
	tsb $AC.b		; 04 AC
	ora ($42.b)		; 12 42
	and $10.b		; 25 10
	asl $92.b,X		; 16 92
	bpl  22.b		; 10 16
	ora ($2B.b),Y		; 11 2B
	pld		; 2B
	and [$25.b]		; 27 25
	ldx $E5E5.w,Y		; BE E5 E5
	ldy HVBJOY.w		; AC 12 42
	and $3B.b		; 25 3B
	and [$25.b]		; 27 25
	.db $42, $27		; 42 27
	.db $42, $7F		; 42 7F
	bra -65.b		; 80 BF
	rti		; 40

	ldy $936A.w		; AC 6A 93
	cpx #$10.b		; E0 10
	bra -33.b		; 80 DF
	brk $3F.b		; 00 3F
	brk $EE.b		; 00 EE
	inc $FEAA.w		; EE AA FE
	sbc $16FF06.l,X		; FF 06 FF 16
	cpx $FF94.w		; EC 94 FF
	cpy #$7F.b		; C0 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	adc [$88.b],Y		; 77 88
	adc $FF.b,X		; 75 FF
	dey		; 88
	jsl $472377.l		; 22 77 23 47
	inc $9F16.w		; EE 16 9F
	brk $EF.b		; 00 EF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $16.b		; 00 16
	plb		; AB
	brk $B4.b		; 00 B4
	sbc $758F70.l,X		; FF 70 8F 75
	sbc $70228F.l,X		; FF 8F 22 70
	and $2A3F.w		; 2D 3F 2A
	rol A		; 2A
	rol A		; 2A
	.db $42, $92		; 42 92
	ora ($11.b),Y		; 11 11
	cmp [$2D.b]		; C7 2D
	brk $B8.b		; 00 B8
	adc #$47.b		; 69 47
	dex		; CA
	sta $2DF0.w		; 8D F0 2D
	sbc [$00.b],Y		; F7 00
	lda $0005.w,X		; BD 05 00
	ora $CE.b,S		; 03 CE
	dec $1600.w		; CE 00 16
	asl A		; 0A
	.db $42, $F5		; 42 F5
	asl $0B.b,X		; 16 0B
	brk $16.b		; 00 16
	plx		; FA
	stx $07.b,Y		; 96 07
	sed		; F8
	ora [$F8.b]		; 07 F8
	lda $2D08.w,Y		; B9 08 2D
	ora ($F7.b,S),Y		; 13 F7
	sbc [$F7.b],Y		; F7 F7
	sbc [$25.b],Y		; F7 25
	sty $6B47.w		; 8C 47 6B
	sbc $08.b,X		; F5 08
	adc $2D07.w		; 6D 07 2D
	ora ($FC.b)		; 12 FC
	brk $5E.b		; 00 5E
	.db $42, $AA		; 42 AA
	ora ($16.b)		; 12 16
	cpy $F8.b		; C4 F8
	ora ($3D.b,X)		; 01 3D
	eor [$FF.b]		; 47 FF
	adc [$88.b],Y		; 77 88
	and $FFDE.w		; 2D DE FF
	dey		; 88
	ldx $6D3B.w,Y		; BE 3B 6D
	adc [$23.b],Y		; 77 23
	wai		; CB
	rol $4E.b,X		; 36 4E
	lsr $81CB.w		; 4E CB 81
	ror A		; 6A
	sta ($93.b,S),Y		; 93 93
	stx $7E6A.w		; 8E 6A 7E
	sta ($7E.b,X)		; 81 7E
	sta ($BB.b,X)		; 81 BB
	tyx		; BB
	eor $9A.b,S		; 43 9A
	and $60FE.w,X		; 3D FE 60
	pei ($23.b)		; D4 23
	lsr $5E5E.w,X		; 5E 5E 5E
	and $B79B.w,X		; 3D 9B B7
	lda [$B7.b],Y		; B7 B7
	adc ($DB.b)		; 72 DB
	pea $F4F4.w		; F4 F4 F4
	pea $9292.w		; F4 92 92
	sta ($92.b)		; 92 92
	clv		; B8
	clv		; B8
	dex		; CA
	lda ($8D.b),Y		; B1 8D
	beq  74.b		; F0 4A
	brk $42.b		; 00 42
	inc $003F.w		; EE 3F 00
	ora $0300CE.l,X		; 1F CE 00 03
	brk $01.b		; 00 01
	adc $00AC.w		; 6D AC 00
	nop		; EA
	nop		; EA
	nop		; EA
	lda $E604.w,X		; BD 04 E6
	inc $E6.b		; E6 E6
	inc $B0.b		; E6 B0
	bcs 107.b		; B0 6B
	rtl		; 6B

	rtl		; 6B

	phy		; 5A
	tsb $004A.w		; 0C 4A 00
	cli		; 58
	cli		; 58
	ldy $4E00.w		; AC 00 4E
	lsr $CB4E.w		; 4E 4E CB
	ora ($26.b,X)		; 01 26
	rol $43.b		; 26 43
	eor $06.b,S		; 43 06
	rts		; 60

	pei ($A3.b)		; D4 A3
	brk $74.b		; 00 74
	stz $74.b,X		; 74 74
	stz $B3.b,X		; 74 B3
	lda ($B3.b,S),Y		; B3 B3
	lda ($AC.b,S),Y		; B3 AC
	tsa		; 3B
	phy		; 5A
	asl $12.b,X		; 16 12
	brk $16.b		; 00 16
	ora ($00.b)		; 12 00
	asl $12.b,X		; 16 12
	brk $F7.b		; 00 F7
	php		; 08
	pha		; 48
	eor [$F3.b]		; 47 F3
	brk $16.b		; 00 16
	sbc $1600.w		; ED 00 16
	sbc $1600.w		; ED 00 16
	sbc $2500.w		; ED 00 25
	adc ($FF.b)		; 72 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	jmp $23C0.w		; 4C C0 23
	wai		; CB
	inc $EEEE.w		; EE EE EE
	and $003F00.l,X		; 3F 00 3F 00
	and $102B00.l,X		; 3F 00 2B 10
	clc		; 18
	bpl  24.b		; 10 18
	inc $9810.w,X		; FE 10 98
	bpl  22.b		; 10 16
	stz $1630.w		; 9C 30 16
	cld		; D8
	bmi  22.b		; 30 16
	stz $4810.w,X		; 9E 10 48
	sbc [$10.b]		; E7 10
	sbc [$10.b]		; E7 10
	ora ($10.b,X)		; 01 10
	adc [$10.b]		; 67 10
	asl $43.b,X		; 16 43
	bpl   7.b		; 10 07
	bpl  22.b		; 10 16
	adc ($10.b,X)		; 61 10
	sta ($FF.b),Y		; 91 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl   3.b		; 10 03
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	and $FA00.w		; 2D 00 FA
	ldy #$00.b		; A0 00
	ldy #$00.b		; A0 00
	ldy #$00.b		; A0 00
	ldy #$6D.b		; A0 6D
	adc $011F6F.l		; 6F 6F 1F 01
	eor $015F01.l,X		; 5F 01 5F 01
	eor $005F00.l,X		; 5F 00 5F 00
	ldx $76B2.w,Y		; BE B2 76
	lsr $07.b,X		; 56 07
	dex		; CA
	lda ($8D.b),Y		; B1 8D
	sed		; F8
	and $47.b,S		; 23 47
	cmp $00AF97.l,X		; DF 97 AF 00
	inc $557F.w		; EE 7F 55
	tax		; AA
	asl $45.b,X		; 16 45
	asl $BA.b,X		; 16 BA
	adc [$88.b],Y		; 77 88
	eor $AA.b,X		; 55 AA
	eor $AA.b,X		; 55 AA
	asl $75.b,X		; 16 75
	asl $8A.b,X		; 16 8A
	bra  -1.b		; 80 FF
	bra 127.b		; 80 7F
	sbc $16FFAA.l,X		; FF AA FF 16
	tsx		; BA
	sbc $AAFF88.l,X		; FF 88 FF AA
	sbc $16FFAA.l,X		; FF AA FF 16
	txa		; 8A
	dec A		; 3A
	eor $00.b,X		; 55 00
	asl $45.b,X		; 16 45
	brk $77.b		; 00 77
	brk $55.b		; 00 55
	brk $55.b		; 00 55
	brk $16.b		; 00 16
	adc $A9.b,X		; 75 A9
	xce		; FB
	brk $FB.b		; 00 FB
	brk $16.b		; 00 16
	plb		; AB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $16.b		; 00 16
	xba		; EB
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	bvc -81.b		; 50 AF
	rti		; 40

	lda $108F70.l,X		; BF 70 8F 10
	sbc $70AF50.l		; EF 50 AF 70
	sta $254200.l		; 8F 00 42 25
	lda $FFBFFF.l		; AF FF BF FF
	trb $EF.b		; 14 EF
	sbc $8FFFAF.l,X		; FF AF FF 8F
	dec A		; 3A
	bvc   0.b		; 50 00
	rti		; 40

	txa		; 8A
	brk $10.b		; 00 10
	brk $50.b		; 00 50
	txa		; 8A
	lda #$30.b		; A9 30
	rol A		; 2A
	rol A		; 2A
	rol A		; 2A
	pla		; 68
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	clv		; B8
	clv		; B8
	dex		; CA
	lda ($8D.b),Y		; B1 8D
	beq  35.b		; F0 23
	sta $16.b,X		; 95 16
	ora $9500.w		; 0D 00 95
	asl $0A.b,X		; 16 0A
	dec $16CE.w		; CE CE 16
	sbc $16.b,X		; F5 16
	inc A		; 1A
	asl $F4.b,X		; 16 F4
	asl $1B.b,X		; 16 1B
	sbc [$18.b],Y		; F7 18
	asl $F5.b,X		; 16 F5
	asl $1A.b,X		; 16 1A
	asl $F5.b,X		; 16 F5
	asl $1A.b,X		; 16 1A
	sbc [$08.b],Y		; F7 08
	sed		; F8
	ora $FF07F8.l		; 0F F8 07 FF
	asl $FA.b,X		; 16 FA
	sbc $FF8CFB.l,X		; FF FB 8C FF
	asl $FA.b,X		; 16 FA
	sbc $8CFA16.l,X		; FF 16 FA 8C
	and $F7.b		; 25 F7
	sbc [$05.b],Y		; F7 05
	brk $BD.b		; 00 BD
	ora [$00.b]		; 07 00
	ora $00.b		; 05 00
	ora $CE.b		; 05 CE
	adc $2308.w		; 6D 08 23
	eor [$16.b]		; 47 16
	plx		; FA
	sta [$3D.b],Y		; 97 3D
	ldx $AA55.w,Y		; BE 55 AA
	asl $54.b,X		; 16 54
	asl $AB.b,X		; 16 AB
	adc [$88.b],Y		; 77 88
	asl $51.b,X		; 16 51
	asl $AE.b,X		; 16 AE
	eor $AA.b,X		; 55 AA
	asl $57.b,X		; 16 57
	asl $A8.b,X		; 16 A8
	brk $42.b		; 00 42
	and $AA.b		; 25 AA
	sbc $FFAB16.l,X		; FF 16 AB FF
	dey		; 88
	sbc $FFAE16.l,X		; FF 16 AE FF
	tax		; AA
	sbc $3AA816.l,X		; FF 16 A8 3A
	eor $00.b,X		; 55 00
	asl $54.b,X		; 16 54
	brk $77.b		; 00 77
	brk $16.b		; 00 16
	eor ($00.b),Y		; 51 00
	eor $00.b,X		; 55 00
	asl $57.b,X		; 16 57
	lda #$81.b		; A9 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $CB.b		; 00 CB
	ora ($3E.b,X)		; 01 3E
	cmp ($3E.b,X)		; C1 3E
	cmp ($3E.b,X)		; C1 3E
	cmp ($3E.b,X)		; C1 3E
	cmp ($3E.b,X)		; C1 3E
	cmp ($7E.b,X)		; C1 7E
	sta ($7E.b,X)		; 81 7E
	sta ($6A.b,X)		; 81 6A
	eor $43.b,S		; 43 43
	asl $60.b		; 06 60
	pei ($A3.b)		; D4 A3
	and $026D.w		; 2D 6D 02
	ora ($16.b,X)		; 01 16
	ora $3302.w		; 0D 02 33
	asl $0D.b,X		; 16 0D
	asl $6F.b,X		; 16 6F
	ora [$EF.b],Y		; 17 EF
	ora [$3B.b],Y		; 17 3B
	ora ($A3.b,X)		; 01 A3
	brk $F5.b		; 00 F5
	clc		; 18
	tsa		; 3B
	ora $00.b,S		; 03 00
	bit #$3F.b		; 89 3F
	brk $EE.b		; 00 EE
	ror $CFA9.w		; 6E A9 CF
	and $F0A946.l,X		; 3F 46 A9 F0
	lsr A		; 4A
	cli		; 58
	ror $DDA9.w		; 6E A9 DD
	adc ($C5.b)		; 72 C5
	lda #$1F.b		; A9 1F
	brk $01.b		; 00 01
	jsl $3B6E58.l		; 22 58 6E 3B
	ror $E0.b		; 66 E0
	bra -16.b		; 80 F0
	cpy #$F8.b		; C0 F8
	cpx #$3B.b		; E0 3B
	ror $16.b		; 66 16
	rts		; 60

	pla		; 68
	brk $18.b		; 00 18
	tsa		; 3B
	and $66.b,S		; 23 66
	plx		; FA
	sta $4AF8.w		; 8D F8 4A
	brk $7F.b		; 00 7F
	pea $F4F4.w		; F4 F4 F4
	txa		; 8A
	.db $42, $92		; 42 92
	sta ($92.b)		; 92 92
	cpy #$6D.b		; C0 6D
	clv		; B8
	adc #$4D.b		; 69 4D
	.db $42, $CA		; 42 CA
	lda ($F0.b),Y		; B1 F0
	and $FF.b,S		; 23 FF
	jsl $75006E.l		; 22 6E 00 75
	ror $8416.w		; 6E 16 84
	brk $04.b		; 00 04
	bpl -22.b		; 10 EA
	rtl		; 6B

	phy		; 5A
	tsb $00FB.w		; 0C FB 00
	sbc $19.b,X		; F5 19
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $08.b		; 00 08
	adc $13B0.w		; 6D B0 13
	phb		; 8B
	.db $42, $6B		; 42 6B
	rtl		; 6B

	rtl		; 6B

	tsb $004A.w		; 0C 4A 00
	ora ($58.b)		; 12 58
	ldx $756D.w,Y		; BE 6D 75
	ror $4E4E.w		; 6E 4E 4E
	lsr $01CB.w		; 4E CB 01
	ror A		; 6A
	sta ($26.b,S),Y		; 93 26
	stx $43BB.w		; 8E BB 43
	txs		; 9A
	eor $60FE.w,Y		; 59 FE 60
	pei ($A3.b)		; D4 A3
	brk $DF.b		; 00 DF
	ora $747474.l		; 0F 74 74 74
	eor ($D0.b)		; 52 D0
	sbc $B3B3B3.l,X		; FF B3 B3 B3
	stz $AC.b		; 64 AC
	and [$3F.b]		; 27 3F
	bit $FF00.w		; 2C 00 FF
	ror $B4.b		; 66 B4
	asl A		; 0A
	iny		; C8
	cpy #$DE.b		; C0 DE
	and $3F.b,S		; 23 3F
	brk $3F.b		; 00 3F
	tsa		; 3B
	adc $1025.w		; 6D 25 10
	inc $2B2B.w,X		; FE 2B 2B
	pld		; 2B
	pld		; 2B
	pld		; 2B
	pld		; 2B
	php		; 08
	sbc [$01.b],Y		; F7 01
	bpl -27.b		; 10 E5
	sbc $E5.b		; E5 E5
	asl A		; 0A
	asl $11.b,X		; 16 11
	and [$DE.b],Y		; 37 DE
	and $16.b,S		; 23 16
	inc $8000.w		; EE 00 80
	tsa		; 3B
	adc $3B25.w		; 6D 25 3B
	bmi  15.b		; 30 0F
	adc $0037BF.l,X		; 7F BF 37 00
	and [$47.b]		; 27 47
	.db $42, $8D		; 42 8D
	rti		; 40

	brk $90.b		; 00 90
	dec $47C0.w,X		; DE C0 47
	ror $BF00.w		; 6E 00 BF
	brk $1F.b		; 00 1F
	jsr $3830.w		; 20 30 38
	asl $28.b,X		; 16 28
	sec		; 38
	rol $3A00.w		; 2E 00 3A
	sbc $3FDD40.l,X		; FF 40 DD 3F
	asl $CE.b,X		; 16 CE
	and $D03FD0.l,X		; 3F D0 3F D0
	and $97DEA9.l,X		; 3F A9 DE 97
	ror $EF00.w		; 6E 00 EF
	brk $16.b		; 00 16
	sta $47EE00.l,X		; 9F 00 EE 47
	dec A		; 3A
	cli		; 58
	ldx $DEA9.w,Y		; BE A9 DE
	sta [$6E.b],Y		; 97 6E
	adc $2A30.w		; 6D 30 2A
	pla		; 68
	brk $8D.b		; 00 8D
	beq -64.b		; F0 C0
	beq  66.b		; F0 42
	ror $11.b		; 66 11
	cmp [$CE.b]		; C7 CE
	dec $6DCE.w		; CE CE 6D
	clv		; B8
	ora $0F56CF.l		; 0F CF 56 0F
	and [$CA.b]		; 27 CA
	bmi  44.b		; 30 2C
	adc $CE03.w		; 6D 03 CE
	asl $0B.b,X		; 16 0B
	ora $581207.l		; 0F 07 12 58
	asl $F4.b,X		; 16 F4
	sbc ($6D.b)		; F2 6D
	lsr $FC.b		; 46 FC
	sbc $25F0A1.l,X		; FF A1 F0 25
	lsr A		; 4A
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	nop		; EA
	lda $913A.w,X		; BD 3A 91
	ora [$16.b]		; 07 16
	asl A		; 0A
	ora $E6.b,S		; 03 E6
	sbc $6D2D.w,Y		; F9 2D 6D
	and ($B0.b,X)		; 21 B0
	sta [$8C.b],Y		; 97 8C
	brk $6B.b		; 00 6B
	phy		; 5A
	tsb $3D3B.w		; 0C 3B 3D
	jsr ($002D.w,X)		; FC 2D 00
	asl $60.b,X		; 16 60
	brk $3A.b		; 00 3A
	eor [$FE.b]		; 47 FE
	sbc [$F8.b]		; E7 F8
	sta $708F70.l		; 8F 70 8F 70
	lda #$DE.b		; A9 DE
	sta [$6E.b],Y		; 97 6E
	brk $4E.b		; 00 4E
	lsr $FDCB.w		; 4E CB FD
	lda ($FC.b,X)		; A1 FC
	sbc $8E936A.l,X		; FF 6A 93 8E
	ror A		; 6A
	cop $01.b		; 02 01
	and $43BB.w		; 2D BB 43
	ora ($FD.b,X)		; 01 FD
	brk $42.b		; 00 42
	adc ($60.b)		; 72 60
	brk $02.b		; 00 02
	and $CF00.w		; 2D 00 CF
	and $DF2FDF.l,X		; 3F DF 2F DF
	ldx $16.b		; A6 16
	plp		; 28
	bne -90.b		; D0 A6
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	ora $18A500.l,X		; 1F 00 A5 18
	ora ($19.b,X)		; 01 19
	and $47.b,S		; 23 47
	sbc $4A56B2.l,X		; FF B2 56 4A
	cmp $21.b		; C5 21
	eor ($07.b,S),Y		; 53 07
	sbc [$87.b]		; E7 87
	adc [$87.b]		; 67 87
	adc [$A9.b]		; 67 A9
	sed		; F8
	brk $D9.b		; 00 D9
	php		; 08
	bpl -120.b		; 10 88
	bpl -120.b		; 10 88
	bpl -105.b		; 10 97
	cmp $6E8C.w		; CD 8C 6E
	asl A		; 0A
	lda ($E0.b,X)		; A1 E0
	sbc $FFE616.l,X		; FF 16 E6 FF
	asl $C6.b,X		; 16 C6
	sbc $CFFFCF.l,X		; FF CF FF CF
	sbc $23CC16.l,X		; FF 16 CC 23
	eor $196C.w		; 4D 6C 19
	ora $3916.w,Y		; 19 16 39
	asl $39.b,X		; 16 39
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	and ($33.b,S),Y		; 33 33
	brk $FF.b		; 00 FF
	lsr $E9.b,X		; 56 E9
	ora $16FF.w,Y		; 19 FF 16
	and $30FF.w,Y		; 39 FF 30
	sbc $33FF30.l,X		; FF 30 FF 33
	ror $FC9E.w		; 6E 9E FC
	beq  -4.b		; F0 FC
	asl $78.b,X		; 16 78
	jsr ($7816.w,X)		; FC 16 78
	cmp [$F5.b],Y		; D7 F5
	phy		; 5A
	asl $84.b,X		; 16 84
	bra  22.b		; 80 16
	sty $80.b		; 84 80
	nop		; EA
	lda $2304.w,X		; BD 04 23
	sed		; F8
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
	bra  -4.b		; 80 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	lsr A		; 4A
	brk $5E.b		; 00 5E
	lsr $FE5E.w,X		; 5E 5E FE
	ora [$B7.b]		; 07 B7
	lda [$B7.b],Y		; B7 B7
	adc ($8C.b)		; 72 8C
	stp		; DB
	pea $F4F4.w		; F4 F4 F4
	brk $7F.b		; 00 7F
	and $92.b		; 25 92
	sta ($92.b)		; 92 92
	trb $B8FF.w		; 1C FF B8
	adc #$23.b		; 69 23
	and $CA.b		; 25 CA
	lda ($6E.b),Y		; B1 6E
	asl A		; 0A
	bit $A71C.w		; 2C 1C A7
	trb $2C25.w		; 1C 25 2C
	sbc $6B6B2D.l,X		; FF 2D 6B 6B
	rtl		; 6B

	asl A		; 0A
	sbc $F5.b,X		; F5 F5
	sbc $F5.b,X		; F5 F5
	sbc $F5.b,X		; F5 F5
	trb $B0FF.w		; 1C FF B0
	ora ($23.b,S),Y		; 13 23
	and $6B.b		; 25 6B
	rtl		; 6B

	rtl		; 6B

	ror $3F0A.w		; 6E 0A 3F
	brk $1F.b		; 00 1F
	brk $89.b		; 00 89
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	wai		; CB
	trb $1CA7.w		; 1C A7 1C
	and $2C.b		; 25 2C
	sbc $4E4E2D.l,X		; FF 2D 4E 4E
	lsr $25C1.w		; 4E C1 25
	rol $8E.b		; 26 8E
	ror A		; 6A
	brk $FF.b		; 00 FF
	eor $9A.b,S		; 43 9A
	tyx		; BB
	and $06.b		; 25 06
	rts		; 60

	lda $00.b,S		; A3 00
	inc $B42D.w,X		; FE 2D B4
	sty $5858.w		; 8C 58 58
	stp		; DB
	stz $74.b,X		; 74 74
	eor ($DF.b)		; 52 DF
	ora $DF00DF.l		; 0F DF 00 DF
	brk $D3.b		; 00 D3
	sbc $FDD3.w,X		; FD D3 FD
	cmp ($FD.b,S),Y		; D3 FD
	lda ($D0.b,S),Y		; B3 D0
	sbc $DBDF86.l,X		; FF 86 DF DB
	and $2DDA.w		; 2D DA 2D
	and $47.b		; 25 47
	sbc $079104.l,X		; FF 04 91 07
	jsr ($BABE.w,X)		; FC BE BA
	sbc $212521.l,X		; FF 21 25 21
	dec $6DF8.w,X		; DE F8 6D
	sed		; F8
	tsa		; 3B
	adc $2B2B.w		; 6D 2B 2B
	pld		; 2B
	pld		; 2B
	bpl  23.b		; 10 17
	sed		; F8
	cmp $F8.b,S		; C3 F8
	ora $F8.b,S		; 03 F8
	ora $E5.b,S		; 03 E5
	sbc $E7.b		; E5 E7
	clc		; 18
	ora $16.b,S		; 03 16
	cpy $83.b		; C4 83
	asl $84.b,X		; 16 84
	ora $04.b,S		; 03 04
	ldy $E037.w		; AC 37 E0
	adc $E17EE1.l,X		; 7F E1 7E E1
	ror $7EE7.w,X		; 7E E7 7E
	sbc [$7E.b]		; E7 7E
	sbc [$7F.b]		; E7 7F
	sbc [$7F.b]		; E7 7F
	bcc -128.b		; 90 80
	ora $801E80.l,X		; 1F 80 1E 80
	asl $8616.w,X		; 1E 16 86
	asl $8616.w,X		; 1E 16 86
	asl $1F87.w,X		; 1E 87 1F
	sta [$1F.b]		; 87 1F
	brk $FF.b		; 00 FF
	ldx $AEAE.w		; AE AE AE
	ora $27276E.l,X		; 1F 6E 27 27
	ldx $2416.w,Y		; BE 16 24
	.db $42, $3A		; 42 3A
	adc $1612.w		; 6D 12 16
	stz $16.b,X		; 74 16
	bit $16.b		; 24 16
	bit $BA.b		; 24 BA
	brk $75.b		; 00 75
	ror $9127.w		; 6E 27 91
	stx $03.b,Y		; 96 03
	sbc $FF9316.l,X		; FF 16 93 FF
	ora $3A.b,S		; 03 3A
	adc $0342.w		; 6D 42 03
	brk $16.b		; 00 16
	lda ($16.b,S),Y		; B3 16
	sta ($16.b,S),Y		; 93 16
	sta ($03.b,S),Y		; 93 03
	ora $3A.b,S		; 03 3A
	brk $75.b		; 00 75
	ror $F0C0.w		; 6E C0 F0
	rti		; 40

	beq  64.b		; F0 40
	beq  64.b		; F0 40
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -56.b		; F0 C8
	ora [$CE.b]		; 07 CE
	bra   7.b		; 80 07
	bra   7.b		; 80 07
	bra -121.b		; 80 87
	bra -128.b		; 80 80
	bra -113.b		; 80 8F
	bra -113.b		; 80 8F
	bra  86.b		; 80 56
	eor $45.b		; 45 45
	trb $80.b		; 14 80
	beq -128.b		; F0 80
	beq  44.b		; F0 2C
	sta $0F.b,X		; 95 0F
	ora [$0E.b]		; 07 0E
	ora [$0E.b]		; 07 0E
	ora [$0E.b]		; 07 0E
	ora [$0E.b]		; 07 0E
	ora [$0E.b]		; 07 0E
	ora [$0E.b]		; 07 0E
	ora [$44.b]		; 07 44
	sed		; F8
	sbc ($01.b)		; F2 01
	sed		; F8
	ora ($F8.b,X)		; 01 F8
	ora ($F8.b,X)		; 01 F8
	ora ($08.b,X)		; 01 08
	ora ($F8.b,X)		; 01 F8
	ora ($F8.b,X)		; 01 F8
	ora ($A1.b,X)		; 01 A1
	sbc ($AD.b),Y		; F1 AD
	lda $0F6F.w		; AD 6F 0F
	ora ($0F.b,X)		; 01 0F
	bit $27B1.w		; 2C B1 27
	sbc $1FE01F.l,X		; FF 1F E0 1F
	cpx #$7F.b		; E0 7F
.ACCU 8
.INDEX 8
	sep #$7F		; E2 7F
	cpx #$7F.b		; E0 7F
	and [$12.b],Y		; 37 12
	.db $42, $FA		; 42 FA
	sbc [$16.b]		; E7 16
	.db $62, $E2, $16		; 62 E2 16
	rts		; 60

	cpx #$7F.b		; E0 7F
	and [$42.b],Y		; 37 42
	adc $6E.b,X		; 75 6E
	and [$27.b]		; 27 27
	ldx $4916.w,Y		; BE 16 49
	.db $42, $3A		; 42 3A
	adc $1612.w		; 6D 12 16
	phk		; 4B
	asl $49.b,X		; 16 49
	asl $49.b,X		; 16 49
	tsx		; BA
	brk $75.b		; 00 75
	ror $FFFC.w		; 6E FC FF
	tsb $FF.b		; 04 FF
	asl $C4.b,X		; 16 C4
	and $3FC416.l,X		; 3F 16 C4 3F
	jsr ($FC3F.w,X)		; FC 3F FC
	and $1291FC.l,X		; 3F FC 91 12
	sed		; F8
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sei		; 78
	brk $CD.b		; 00 CD
	sta $6E8C.w,X		; 9D 8C 6E
	bne -90.b		; D0 A6
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	bne -90.b		; D0 A6
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	lda $18.b		; A5 18
	ora ($19.b,X)		; 01 19
	brk $A5.b		; 00 A5
	clc		; 18
	ora ($19.b,X)		; 01 19
	brk $B2.b		; 00 B2
	lda ($4A.b)		; B2 4A
	eor ($53.b,S),Y		; 53 53
	mvn $53,$54		; 54 54 53
	eor ($54.b,S),Y		; 53 54
	sta [$67.b]		; 87 67
	lda $98.b		; A5 98
	brk $98.b		; 00 98
	brk $A5.b		; 00 A5
	tya		; 98
	brk $88.b		; 00 88
	bpl  -8.b		; 10 F8
	cmp $8C9D.w		; CD 9D 8C
	ror $C8FF.w		; 6E FF C8
	sbc ($25.b,X)		; E1 25
	lda ($FE.b,X)		; A1 FE
	cmp $FF.b		; C5 FF
	bit $1E1E.w,X		; 3C 1E 1E
	and $4D.b,S		; 23 4D
	jmp ($1919.w)		; 6C 19 19
	asl $39.b,X		; 16 39
	asl $39.b,X		; 16 39
	and ($31.b),Y		; 31 31
	and $BE1EFF.l,X		; 3F FF 1E BE
	lsr $E9.b,X		; 56 E9
	ora $16FF.w,Y		; 19 FF 16
	and $31FF.w,Y		; 39 FF 31
	ror $16D7.w		; 6E D7 16
	jmp ($16F8.w,X)		; 7C F8 16
	jmp ($D2F8.w,X)		; 7C F8 D2
	nop		; EA
	nop		; EA
	asl $84.b,X		; 16 84
	bra -121.b		; 80 87
	sta $87.b,S		; 83 87
	sta $87.b,S		; 83 87
	sta $00.b,S		; 83 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
	sta $FC.b,S		; 83 FC
	sta $FC.b,S		; 83 FC
	sta $FC.b,S		; 83 FC
	tda		; 7B
	tsa		; 3B
	tsx		; BA
	asl $57.b,X		; 16 57
	sbc $47233B.l,X		; FF 3B 23 47
	ror $004A.w		; 6E 4A 00
	and $55.b		; 25 55
	sbc $FFBB16.l,X		; FF 16 BB FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $55BE55.l,X		; FF 55 BE 55
	and [$B4.b]		; 27 B4
	ror $4B23.w		; 6E 23 4B
	sta $89.b,X		; 95 89
	ora $FF5F25.l		; 0F 25 5F FF
	lda $FF5FFF.l,X		; BF FF 5F FF
	lda $FF5FFF.l		; AF FF 5F FF
	lsr $5F.b,X		; 56 5F
	and $B2.b		; 25 B2
	ror $56.b,X		; 76 56
	ora $9C9C4A.l		; 0F 4A 9C 9C
	sbc ($00.b)		; F2 00
	.db $42, $F8		; 42 F8
	sbc ($DE.b)		; F2 DE
	sty $3A5C.w		; 8C 5C 3A
	lsr A		; 4A
	lsr $6D.b		; 46 6D
	jmp $3A5C00.l		; 5C 00 5C 3A
	lsr A		; 4A
	cmp $C3.b		; C5 C3
	cmp $6D.b,S		; C3 6D
	jmp $3A5C00.l		; 5C 00 5C 3A
	lsr A		; 4A
	sei		; 78
	phx		; DA
	sed		; F8
	and $0B16.w,X		; 3D 16 0B
	brk $FB.b		; 00 FB
	tay		; A8
	tay		; A8
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	asl $F5.b,X		; 16 F5
	xce		; FB
	sed		; F8
	sbc [$F8.b],Y		; F7 F8
	ora [$A1.b]		; 07 A1
	beq -37.b		; F0 DB
	cmp $1FDF1F.l,X		; DF 1F DF 1F
	cmp $1FDF1F.l,X		; DF 1F DF 1F
	cmp $1FDF1F.l,X		; DF 1F DF 1F
	eor $1F5F1F.l,X		; 5F 1F 5F 1F
	stx $86.b		; 86 86
	stx $86.b		; 86 86
	stx $86.b		; 86 86
	stx $DF.b		; 86 DF
	stp		; DB
	lda [$35.b],Y		; B7 35
	sta $51AD.w,X		; 9D AD 51
	jsr ($FCFC.w,X)		; FC FC FC
	ldx #$DA.b		; A2 DA
	sed		; F8
	ora $F8AC.w		; 0D AC F8
	asl $0B.b,X		; 16 0B
	inc $FC3E.w,X		; FE 3E FC
	asl $7D.b,X		; 16 7D
	sed		; F8
	asl $7B.b,X		; 16 7B
	sbc ($F7.b),Y		; F1 F7
	sbc $EF.b,S		; E3 EF
	cmp [$DF.b]		; C7 DF
	asl $CE.b,X		; 16 CE
	sbc $0C0B16.l,X		; FF 16 0B 0C
	rol $163F.w,X		; 3E 3F 16
	adc $167E.w,X		; 7D 7E 16
	tda		; 7B
	asl $7C.b,X		; 16 7C
	asl $F6.b,X		; 16 F6
	sed		; F8
	asl $EC.b,X		; 16 EC
	beq  22.b		; F0 16
	cld		; D8
	cpx #$F1.b		; E0 F1
	cpy #$AC.b		; C0 AC
	sbc $77EF70.l		; EF 70 EF 77
	sbc $70EF77.l		; EF 77 EF 70
	sbc [$7F.b]		; E7 7F
	sbc [$7F.b]		; E7 7F
	sbc $77EF70.l		; EF 70 EF 77
	bra  16.b		; 80 10
	sta [$10.b]		; 87 10
	sta [$16.b]		; 87 16
	ora $80.b,X		; 15 80
	bpl -121.b		; 10 87
	ora $801F87.l,X		; 1F 87 1F 80
	bpl -121.b		; 10 87
	bpl -82.b		; 10 AE
	ldx $E9AE.w		; AE AE E9
	ora $3A426E.l,X		; 1F 6E 42 3A
	.db $42, $3A		; 42 3A
	.db $42, $25		; 42 25
	and $BE.b,S		; 23 BE
	asl $A6.b,X		; 16 A6
	tsx		; BA
	and $42.b,S		; 23 42
	ldy $B742.w		; AC 42 B7
	.db $42, $3A		; 42 3A
	.db $42, $72		; 42 72
	and $3D.b,S		; 23 3D
	inc $6416.w,X		; FE 16 64
	tsx		; BA
	and $3D.b,S		; 23 3D
	ldy $F0C0.w		; AC C0 F0
	cmp #$4C.b		; C9 4C
	iny		; C8
	bra -43.b		; 80 D5
	cmp $D5.b,X		; D5 D5
	cmp $FF.b,X		; D5 FF
	eor $45.b		; 45 45
	eor $8F.b		; 45 8F
	ror $070E.w		; 6E 0E 07
	mvp $44,$44		; 44 44 44
	mvp $44,$44		; 44 44 44
	mvp $84,$08		; 44 08 84
	sty $84.b		; 84 84
	sty $84.b		; 84 84
	sty $84.b		; 84 84
	lda $AD.b,X		; B5 AD
	lda $5BAD.w		; AD AD 5B
	ror $5D42.w		; 6E 42 5D
	.db $42, $7F		; 42 7F
	and [$27.b],Y		; 37 27
	and [$23.b],Y		; 37 23
	inc $167F.w		; EE 7F 16
	phy		; 5A
	and $7F.b,S		; 23 7F
	and [$1C.b],Y		; 37 1C
	inc $42AC.w		; EE AC 42
	dec A		; 3A
	.db $42, $3A		; 42 3A
	.db $42, $25		; 42 25
	and $BE.b,S		; 23 BE
	asl $66.b,X		; 16 66
	tsx		; BA
	and $42.b,S		; 23 42
	ldy $0FFC.w		; AC FC 0F
	jsr ($FCEF.w,X)		; FC EF FC
	sbc $FC0FFC.l		; EF FC 0F FC
	and $0F.b,X		; 35 0F
	jsr ($08EF.w,X)		; FC EF 08
	php		; 08
	inx		; E8
	php		; 08
	inx		; E8
	asl $48.b,X		; 16 48
	php		; 08
	php		; 08
	sei		; 78
	php		; 08
	php		; 08
	inx		; E8
	php		; 08
	sed		; F8
	cmp $8C9D.w		; CD 9D 8C
	ror $2601.w		; 6E 01 26
	stx $3D6A.w		; 8E 6A 3D
	eor ($51.b),Y		; 51 51
	eor ($9B.b),Y		; 51 9B
	inc $7DAC.w,X		; FE AC 7D
	adc $7D7D.w,X		; 7D 7D 7D
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	sbc $01.b,S		; E3 01
	ldy $A6D0.w		; AC D0 A6
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	bne  22.b		; D0 16
	and [$D0.b]		; 27 D0
	asl $27.b,X		; 16 27
	bne  22.b		; D0 16
	rol $D1.b		; 26 D1
	rol $18A5.w		; 2E A5 18
	ora ($19.b,X)		; 01 19
	brk $10.b		; 00 10
	php		; 08
	bpl   8.b		; 10 08
	bpl   9.b		; 10 09
	ora $B200.w,Y		; 19 00 B2
	lda ($4A.b)		; B2 4A
	eor ($53.b,S),Y		; 53 53
	mvn $17,$54		; 54 54 17
	sbc [$17.b],Y		; F7 17
	sbc [$16.b],Y		; F7 16
	sta [$77.b],Y		; 97 77
	asl $97.b,X		; 16 97
	adc [$A5.b],Y		; 77 A5
	tya		; 98
	brk $98.b		; 00 98
	brk $A5.b		; 00 A5
	tya		; 98
	brk $98.b		; 00 98
	sbc ($CD.b)		; F2 CD
	sta $6E8C.w,X		; 9D 8C 6E
	dec $7C49.w,X		; DE 49 7C
	cmp $3131FF.l		; CF FF 31 31
	and ($31.b),Y		; 31 31
	and ($33.b,S),Y		; 33 33
	asl $231E.w,X		; 1E 1E 23
	clc		; 18
	clc		; 18
	sec		; 38
	sec		; 38
	bmi  48.b		; 30 30
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b,S),Y		; 33 FF
	asl $18BE.w,X		; 1E BE 18
	sbc $30FF38.l,X		; FF 38 FF 30
	ror $D7D7.w		; 6E D7 D7
	sta [$83.b]		; 87 83
	ora $03.b		; 05 03
	ora [$03.b]		; 07 03
	ora $03.b		; 05 03
	asl $03.b		; 06 03
	ora $03.b		; 05 03
	tsb $03.b		; 04 03
	ora $03.b		; 05 03
	sta $FC.b,S		; 83 FC
	sta $B6.b		; 85 B6
	stx $7B.b,Y		; 96 7B
	brk $FF.b		; 00 FF
	asl $44.b,X		; 16 44
	eor [$BE.b]		; 47 BE
	asl $22.b,X		; 16 22
	asl $DD.b,X		; 16 DD
	brk $FF.b		; 00 FF
	tax		; AA
	eor $61.b,X		; 55 61
	ror $4B23.w		; 6E 23 4B
	sta $89.b,X		; 95 89
	eor $16FF.w		; 4D FF 16
	eor $5676FF.l		; 4F FF 76 56
	and $AF56DF.l		; 2F DF 56 AF
	eor $76B2FF.l,X		; 5F FF B2 76
	lsr $0F.b,X		; 56 0F
	lsr A		; 4A
	stz $9C9C.w		; 9C 9C 9C
	stz $AC5C.w		; 9C 5C AC
	lda [$EF.b]		; A7 EF
	sbc $DEEFEF.l		; EF EF EF DE
	lda ($F7.b,X)		; A1 F7
	jmp $5C6E25.l		; 5C 25 6E 5C
	lda [$16.b]		; A7 16
	sei		; 78
	sbc $DB7316.l,X		; FF 16 73 DB
	jmp $FF07DE.l		; 5C DE 07 FF
	asl $73.b,X		; 16 73
	sta ($DB.b),Y		; 91 DB
	jmp $49A1DE.l		; 5C DE A1 49
	jmp.w [$5CDB]		; DC DB 5C
	dec $49E9.w,X		; DE E9 49
	adc [$DB.b],Y		; 77 DB
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	dec $D6.b,X		; D6 D6
	dec $A1.b,X		; D6 A1
	beq -37.b		; F0 DB
	jmp ($6C6C.w)		; 6C 6C 6C
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F0F3F.l		; 0F 3F 0F 3F
	ldy $86.b		; A4 86
	stx $86.b		; 86 86
	stx $86.b		; 86 86
	cmp $FFCFFF.l		; CF FF CF FF
	cmp [$DB.b]		; C7 DB
	tad		; 5B
	sbc $E3FFE3.l,X		; FF E3 FF E3
	sbc [$E3.b],Y		; F7 E3
	sbc $E2FFE2.l,X		; FF E2 FF E2
	cmp $B5DD.w,X		; DD DD B5
	plb		; AB
	sbc $16.b,S		; E3 16
	xba		; EB
.ACCU 8
	sep #$E2		; E2 E2
.ACCU 8
	sep #$E2		; E2 E2
	adc $65.b		; 65 65
	ldy $CC16.w		; AC 16 CC
	asl $9F.b,X		; 16 9F
	sbc $9F16.w,Y		; F9 16 9F
	sbc $0F.b,S		; E3 0F
	cmp [$1F.b]		; C7 1F
	cmp $7FDF3F.l		; CF 3F DF 7F
	cmp $16257F.l,X		; DF 7F 25 16
	sta ($A0.b,S),Y		; 93 A0
	asl $86.b,X		; 16 86
	bra  22.b		; 80 16
	ora $1601.w		; 0D 01 16
	tas		; 1B
	ora $16.b,S		; 03 16
	and [$07.b],Y		; 37 07
	asl $6F.b,X		; 16 6F
	asl $4F.b,X		; 16 4F
	asl $6F.b,X		; 16 6F
	asl $4F.b,X		; 16 4F
	sbc $EFACEF.l		; EF EF AC EF
	adc [$EF.b],Y		; 77 EF
	bvs -25.b		; 70 E7
	adc $5D7FE7.l,X		; 7F E7 7F 5D
	eor $1687.w,X		; 5D 87 16
	ora ($80.b,S),Y		; 13 80
	bpl -121.b		; 10 87
	ora $C61F87.l,X		; 1F 87 1F C6
	dec $AE.b		; C6 AE
	sbc #$1F.b		; E9 1F
	cli		; 58
	ror $4225.w		; 6E 25 42
	lda [$FF.b]		; A7 FF
	asl $65.b,X		; 16 65
	tsx		; BA
	tsa		; 3B
	lsr $97.b		; 46 97
	eor $A74272.l		; 4F 72 42 A7
	inc $3416.w,X		; FE 16 34
	tsx		; BA
	tsa		; 3B
	lsr $97.b		; 46 97
	eor $D5C9C9.l		; 4F C9 C9 D5
	cmp $B8.b,X		; D5 B8
	eor $45.b		; 45 45
	lda ($4A.b)		; B2 4A
	mvp $44,$44		; 44 44 44
	mvp $F8,$C4		; 44 C4 F8
	sty $84.b		; 84 84
	sty $F1.b		; 84 F1
	sbc $F1ED.w		; ED ED F1
	lda $FF5B.w		; AD 5B FF
	dec $A1.b,X		; D6 A1
	beq 110.b		; F0 6E
	and [$42.b],Y		; 37 42
	adc $374637.l,X		; 7F 37 46 37
	asl $36.b,X		; 16 36
	and $7F.b,S		; 23 7F
	and [$FF.b],Y		; 37 FF
	tsa		; 3B
	lsr $97.b		; 46 97
	eor $A74225.l		; 4F 25 42 A7
	sbc $BA5316.l,X		; FF 16 53 BA
	tsa		; 3B
	lsr $97.b		; 46 97
	eor $FCEFFC.l		; 4F FC EF FC
	ora $3535FC.l		; 0F FC 35 35
	sta ($FF.b),Y		; 91 FF
	inx		; E8
	asl $48.b,X		; 16 48
	php		; 08
	php		; 08
	sei		; 78
	tsa		; 3B
	sed		; F8
	sta $588C.w,X		; 9D 8C 58
	ror $2601.w		; 6E 01 26
	stx $516A.w		; 8E 6A 51
	eor ($51.b),Y		; 51 51
	eor ($FE.b),Y		; 51 FE
	ldy $16D0.w		; AC D0 16
	and [$D0.b]		; 27 D0
	ldx $2E.b		; A6 2E
	cmp ($16.b),Y		; D1 16
	rol $D0.b		; 26 D0
	ldx $A6.b		; A6 A6
	rol $2ED1.w		; 2E D1 2E
	bpl   8.b		; 10 08
	cmp $0118.w,Y		; D9 18 01
	asl $11.b,X		; 16 11
	php		; 08
	lda $18.b		; A5 18
	ora ($19.b,X)		; 01 19
	brk $B2.b		; 00 B2
	lda ($4A.b)		; B2 4A
	ora [$E7.b]		; 07 E7
	ora [$E7.b]		; 07 E7
	sta [$67.b]		; 87 67
	mvn $53,$53		; 54 53 53
	asl $97.b,X		; 16 97
	adc [$16.b]		; 67 16
	sta [$67.b],Y		; 97 67
	clc		; 18
	bpl  24.b		; 10 18
	bpl -104.b		; 10 98
	bpl -120.b		; 10 88
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl -120.b		; 10 88
	bpl -120.b		; 10 88
	bpl  -8.b		; 10 F8
	cmp $8C9D.w		; CD 9D 8C
	ror $EFDF.w		; 6E DF EF
	cmp $EFDFEF.l,X		; DF EF DF EF
	sbc $FFCC16.l,X		; FF 16 CC FF
	iny		; C8
	cmp ($25.b,X)		; C1 25
	tad		; 5B
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	and ($33.b,S),Y		; 33 33
	bit $3E3E.w,X		; 3C 3E 3E
	and $0E.b,S		; 23 0E
	asl $FF30.w		; 0E 30 FF
	bmi  -1.b		; 30 FF
	bmi  -1.b		; 30 FF
	and ($FF.b,S),Y		; 33 FF
	and $BE3EFF.l,X		; 3F FF 3E BE
	asl $D76E.w		; 0E 6E D7
	cmp [$04.b],Y		; D7 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $93.b,S		; 03 93
	tsb $03.b		; 04 03
	sta ($85.b,S),Y		; 93 85
	sta $7B.b		; 85 7B
	asl $11.b,X		; 16 11
	asl $EE.b,X		; 16 EE
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $77.b,X		; 55 77
	dey		; 88
	tax		; AA
	eor $42.b,X		; 55 42
	ror A		; 6A
	adc ($6E.b,X)		; 61 6E
	and $4B.b,S		; 23 4B
	sta $89.b,X		; 95 89
	ora $AFEF1F.l		; 0F 1F EF AF
	eor $AFAF5F.l,X		; 5F 5F AF AF
	eor $AF8F7F.l,X		; 5F 7F 8F AF
	eor $B2B2FF.l,X		; 5F FF B2 B2
	lsr $0F.b,X		; 56 0F
	lsr A		; 4A
	stz $08F2.w		; 9C F2 08
	sed		; F8
	xba		; EB
	xba		; EB
	cmp $1B.b		; C5 1B
	tas		; 1B
	sbc [$DB.b],Y		; F7 DB
	sbc $EFEFEF.l		; EF EF EF EF
	asl $EE.b,X		; 16 EE
	sbc $F0EFE8.l		; EF E8 EF F0
	sed		; F8
	ply		; 7A
	ply		; 7A
	ply		; 7A
	asl $F6.b,X		; 16 F6
	sbc $FEF1A1.l,X		; FF A1 F1 FE
	sbc [$F8.b],Y		; F7 F8
	sbc $F0A1D6.l,X		; FF D6 A1 F0
	lsr $DA.b		; 46 DA
	ply		; 7A
	ply		; 7A
	ply		; 7A
	tsa		; 3B
	ora [$00.b]		; 07 00
	sta $89.b,X		; 95 89
	and $16.b		; 25 16
	adc $6C16FF.l		; 6F FF 16 6C
	tad		; 5B
	sbc $0D0D.w,X		; FD 0D 0D
	asl $6F.b,X		; 16 6F
	sty $6F16.w		; 8C 16 6F
	sbc ($16.b,S),Y		; F3 16
	jmp ($ADAD.w)		; 6C AD AD
	tad		; 5B
	cmp $FD.b		; C5 FD
	sbc $0D0D.w,X		; FD 0D 0D
	lda #$02.b		; A9 02
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $25.b		; 00 25
	trb $16.b		; 14 16
	adc ($8C.b,S),Y		; 73 8C
	sed		; F8
	eor $06C5.w,Y		; 59 C5 06
	sbc $8F7216.l,X		; FF 16 72 8F
	jsr ($7316.w,X)		; FC 16 73
	sty $F9FF.w		; 8C FF F9
	dec A		; 3A
	beq -59.b		; F0 C5
	sty $59F8.w		; 8C F8 59
	cmp $A9.b		; C5 A9
	ora [$A3.b]		; 07 A3
	and $FE6D.w		; 2D 6D FE
	sty $C1FE.w		; 8C FE C1
	sbc $F9E1.w,X		; FD E1 F9
	adc $65.b		; 65 65
	adc $65.b		; 65 65
	asl $D9.b,X		; 16 D9
	inc $F8C7.w,X		; FE C7 F8
	sbc $E1FFC1.l,X		; FF C1 FF E1
	cmp $DDDD.w,X		; DD DD DD
	cmp $9B25.w,X		; DD 25 9B
	sbc $59FD.w,X		; FD FD 59
	adc $65.b		; 65 65
	adc $65.b		; 65 65
	and $CB.b,S		; 23 CB
	cop $A3.b		; 02 A3
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $77.b		; 00 77
	sbc $3A7707.l,X		; FF 07 77 3A
	and ($21.b,X)		; 21 21
	and ($21.b,X)		; 21 21
	sta $07FF77.l		; 8F 77 FF 07
	dec A		; 3A
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	and $77.b		; 25 77
	adc [$3A.b],Y		; 77 3A
	and ($21.b,X)		; 21 21
	and ($21.b,X)		; 21 21
	and $88.b,S		; 23 88
	and $9C9C.w		; 2D 9C 9C
	dec $A43F.w		; CE 3F A4
	ldy $A4.b		; A4 A4
	ldy $A4.b		; A4 A4
	ldy $A4.b		; A4 A4
	plp		; 28
	plp		; 28
	plp		; 28
	jmp ($DBC7.w,X)		; 7C C7 DB
	cmp $FB5B.w,X		; DD 5B FB
	sbc ($5B.b),Y		; F1 5B
	sbc $FEE0A1.l,X		; FF A1 E0 FE
	cpx $FF.b		; E4 FF
	cpx $65.b		; E4 65
	lda $F1.b,X		; B5 F1
	asl $F5.b,X		; 16 F5
	lda $7A.b,X		; B5 7A
	adc $E4.b		; 65 E4
	asl $E5.b,X		; 16 E5
	cpx $E4.b		; E4 E4
	ldy $3775.w		; AC 75 37
	adc $7F.b,X		; 75 7F
	adc $5D5DAC.l,X		; 7F AC 5D 5D
	eor $C65D.w,X		; 5D 5D C6
	dec $C6.b		; C6 C6
	bcc -128.b		; 90 80
	and $61.b,S		; 23 61
	ror $00AC.w		; 6E AC 00
	adc ($6E.b,X)		; 61 6E
	cmp #$C9.b		; C9 C9
	clv		; B8
	clv		; B8
	lda ($B2.b)		; B2 B2
	lsr A		; 4A
	cpy $C4.b		; C4 C4
	sbc $EDED.w		; ED ED ED
	sbc $D6D6.w		; ED D6 D6
	dec $A1.b,X		; D6 A1
	beq 110.b		; F0 6E
	jsr ($3535.w,X)		; FC 35 35
	and $91.b,X		; 35 91
	ror $6100.w		; 6E 00 61
	ror $A6D0.w		; 6E D0 A6
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	bne  22.b		; D0 16
	and [$D0.b]		; 27 D0
	ldx $2E.b		; A6 2E
	cmp ($2E.b),Y		; D1 2E
	lda $18.b		; A5 18
	ora ($19.b,X)		; 01 19
	brk $10.b		; 00 10
	php		; 08
	cmp $0118.w,Y		; D9 18 01
	ora $B200.w,Y		; 19 00 B2
	lda ($4A.b)		; B2 4A
	ora [$E7.b],Y		; 17 E7
	ora [$F7.b],Y		; 17 F7
	asl $97.b,X		; 16 97
	adc [$16.b],Y		; 77 16
	sta [$77.b],Y		; 97 77
	ora [$F7.b],Y		; 17 F7
	ora [$F7.b],Y		; 17 F7
	mvn $08,$54		; 54 54 08
	bpl -39.b		; 10 D9
	tya		; 98
	brk $98.b		; 00 98
	brk $A5.b		; 00 A5
	tya		; 98
	brk $98.b		; 00 98
	sbc ($CD.b)		; F2 CD
	sta $6E8C.w,X		; 9D 8C 6E
	cmp $E4FF.w,X		; DD FF E4
	sbc $FFCC16.l,X		; FF 16 CC FF
	jmp $CC16.w		; 4C 16 CC
	sbc $FFC916.l,X		; FF 16 C9 FF
	asl $C9.b,X		; 16 C9
	jmp ($1B16.w)		; 6C 16 1B
	asl $1B.b,X		; 16 1B
	and ($33.b,S),Y		; 33 33
	bit $333C.w,X		; 3C 3C 33
	and ($16.b,S),Y		; 33 16
	rol $16.b,X		; 36 16
	rol $16.b,X		; 36 16
	rol $16.b,X		; 36 16
	rol $E9.b,X		; 36 E9
	asl $1B.b,X		; 16 1B
	sbc $3FFF33.l,X		; FF 33 FF 3F
	sbc $33FF3F.l,X		; FF 3F FF 33
	sbc $FF3616.l,X		; FF 16 36 FF
	asl $36.b,X		; 16 36
	ror $D7D7.w		; 6E D7 D7
	ora $02.b		; 05 02
	sta ($05.b,S),Y		; 93 05
	cop $93.b		; 02 93
	ora [$A3.b]		; 07 A3
	ora ($07.b,X)		; 01 07
	lda $01.b,S		; A3 01
	sta $85.b		; 85 85
	tda		; 7B
	.db $42, $16		; 42 16
	cmp $4200.w,X		; DD 00 42
	eor $00.b,X		; 55 00
	sbc $005500.l		; EF 00 55 00
	tax		; AA
	brk $55.b		; 00 55
	brk $61.b		; 00 61
	ror $4B23.w		; 6E 23 4B
	sta $89.b,X		; 95 89
	lsr $0F.b,X		; 56 0F
	cmp $5F0F56.l,X		; DF 56 0F 5F
	ora $5F0FEF.l		; 0F EF 0F 5F
	ora $5F0FAF.l		; 0F AF 0F 5F
	lda ($B2.b)		; B2 B2
	ora $EBEB4A.l		; 0F 4A EB EB
	xba		; EB
	xba		; EB
	tas		; 1B
	tas		; 1B
	tas		; 1B
	inc $F7.b,X		; F6 F7
	stp		; DB
	ply		; 7A
	bit $24.b		; 24 24
	bit $24.b		; 24 24
	bit $24.b		; 24 24
	asl A		; 0A
	beq -51.b		; F0 CD
	sta $7A25.w,X		; 9D 25 7A
	sei		; 78
	sei		; 78
	sei		; 78
	and $89.b		; 25 89
	ora [$CE.b]		; 07 CE
	dec $CECE.w		; CE CE CE
	dec $0D6D.w		; CE 6D 0D
	lda $F8.b,X		; B5 F8
	sbc $FCDA.w,Y		; F9 DA FC
	jsr ($AD3A.w,X)		; FC 3A AD
	inc $9DF1.w,X		; FE F1 9D
	sta ($3A.b),Y		; 91 3A
	ora $59B5.w		; 0D B5 59
	phx		; DA
	jsr ($3AFC.w,X)		; FC FC 3A
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	lda $CE.b,S		; A3 CE
	brk $03.b		; 00 03
	and $FE00.w		; 2D 00 FE
	lda [$FF.b],Y		; B7 FF
	adc $796F.w,Y		; 79 6F 79
	ora $03.b,S		; 03 03
	eor $E725.w		; 4D 25 E7
	inc $FE1F.w,X		; FE 1F FE
	adc ($FE.b),Y		; 71 FE
	sta [$79.b]		; 87 79
	adc $FF03FF.l		; 6F FF 03 FF
	ora $7979DE.l		; 0F DE 79 79
	ora $03.b,S		; 03 03
	eor $3B25.w		; 4D 25 3B
	asl $86.b,X		; 16 86
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	adc $29AB.w		; 6D AB 29
	sbc $E0.b,S		; E3 E0
	sbc $E1.b,S		; E3 E1
	sbc ($E2.b,X)		; E1 E2
	cpx #$E3.b		; E0 E3
	asl A		; 0A
	sbc $FF.b,S		; E3 FF
	sbc $FF.b,S		; E3 FF
	sbc $FC.b,S		; E3 FC
	sbc $FD.b,S		; E3 FD
	sbc $FE.b,S		; E3 FE
	sbc ($DD.b,X)		; E1 DD
	and $AB.b		; 25 AB
	plb		; AB
	plb		; AB
	and #$25.b		; 29 25
	asl $1C.b,X		; 16 1C
	brk $16.b		; 00 16
	trb $1600.w		; 1C 00 16
	trb $1600.w		; 1C 00 16
	trb $1600.w		; 1C 00 16
	trb $1600.w		; 1C 00 16
	trb $1600.w		; 1C 00 16
	trb $3A6D.w		; 1C 6D 3A
	sbc $FF7714.l,X		; FF 14 77 FF
	sbc [$C7.b]		; E7 C7
	lda $C5E707.l,X		; BF 07 E7 C5
	trb $77.b		; 14 77
	sbc $7CBF49.l,X		; FF 49 BF 7C
	ora [$75.b]		; 07 75
	ora $2C25.w,X		; 1D 25 2C
	clc		; 18
	adc $A4A4.w		; 6D A4 A4
	ldy $A4.b		; A4 A4
	eor [$57.b],Y		; 57 57
	plp		; 28
	plp		; 28
	cmp $FF.b,S		; C3 FF
	cmp $FF.b,S		; C3 FF
	cmp $FF.b,S		; C3 FF
	cmp $DB.b,S		; C3 DB
	sbc $FFE616.l,X		; FF 16 E6 FF
	asl $E6.b,X		; 16 E6
	sbc $490B0B.l,X		; FF 0B 0B 49
	sbc [$16.b]		; E7 16
	inc $16.b		; E6 16
	inc $16.b		; E6 16
	inc $16.b		; E6 16
	inc $D8.b		; E6 D8
	cld		; D8
	cld		; D8
	ldy $BF37.w		; AC 37 BF
	and $EF1FFF.l,X		; 3F FF 1F EF
	sta $E77CF7.l		; 8F F7 7C E7
	xce		; FB
	sbc $FF.b,S		; E3 FF
	sbc ($7F.b,S),Y		; F3 7F
	adc $6C7F3F.l,X		; 7F 3F 7F 6C
	sta $C79F16.l		; 8F 16 9F C7
	cmp $E7E31D.l		; CF 1D E3 E7
	phb		; 8B
	ldy $C9C9.w		; AC C9 C9
	adc #$08.b		; 69 08
	phk		; 4B
	bit #$4D.b		; 89 4D
	sbc $5676B2.l,X		; FF B2 76 56
	lsr A		; 4A
	cpy $C4.b		; C4 C4
	sbc $7816.w		; ED 16 78
	beq  24.b		; F0 18
	beq  24.b		; F0 18
	beq -98.b		; F0 9E
	clc		; 18
	beq -97.b		; F0 9F
	dec $D6.b,X		; D6 D6
	dec $A1.b,X		; D6 A1
	beq 110.b		; F0 6E
	ora ($26.b,X)		; 01 26
	stx $516A.w		; 8E 6A 51
	inc $8616.w,X		; FE 16 86
	lsr $06FE.w,X		; 5E FE 06
	lsr $ACFE.w,X		; 5E FE AC
	eor ($53.b,S),Y		; 53 53
	mvn $53,$54		; 54 54 53
	eor ($87.b,S),Y		; 53 87
	adc [$87.b]		; 67 87
	adc [$A5.b]		; 67 A5
	tya		; 98
	brk $98.b		; 00 98
	brk $A5.b		; 00 A5
	dey		; 88
	bpl -120.b		; 10 88
	bpl  -8.b		; 10 F8
	cmp $8C9D.w		; CD 9D 8C
	ror $D7D7.w		; 6E D7 D7
	ora [$00.b]		; 07 00
	ora $CE.b		; 05 CE
	brk $05.b		; 00 05
	dec $0500.w		; CE 00 05
	lda $00.b,S		; A3 00
	ora $00.b		; 05 00
	sta $85.b		; 85 85
	tda		; 7B
	dey		; 88
	brk $55.b		; 00 55
	adc $6D55.w		; 6D 55 6D
	asl $44.b,X		; 16 44
	and $6100.w		; 2D 00 61
	ror $8923.w		; 6E 23 89
	ora $010E01.l		; 0F 01 0E 01
	asl $0E01.w		; 0E 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	sta $0F5F0F.l		; 8F 0F 5F 0F
	asl $160F.w		; 0E 0F 16
	lsr $0E0F.w,X		; 5E 0F 0E
	ora $0F4E16.l		; 0F 16 4E 0F
	asl $0E0F.w		; 0E 0F 0E
	lda ($B2.b)		; B2 B2
	ora $16944A.l		; 0F 4A 94 16
	sbc ($02.b)		; F2 02
	ora $1941.w,Y		; 19 41 19
	eor ($19.b,X)		; 41 19
	eor ($19.b,X)		; 41 19
	eor ($19.b,X)		; 41 19
	eor ($19.b,X)		; 41 19
	eor ($39.b,X)		; 41 39
	cop $FD.b		; 02 FD
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	ldy $09EB.w		; AC EB 09
	adc $7909.w,Y		; 79 09 79
	ora #$79.b		; 09 79
	ora #$79.b		; 09 79
	ora #$79.b		; 09 79
	ora #$79.b		; 09 79
	tas		; 1B
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc [$FF.b],Y		; 77 FF
	adc [$DB.b],Y		; 77 DB
	jmp $57AC5C.l		; 5C 5C AC 57
	eor [$57.b],Y		; 57 57
	eor [$C3.b],Y		; 57 C3
	sbc $C3FFC3.l,X		; FF C3 FF C3
	sbc $C3FFC3.l,X		; FF C3 FF C3
	sbc $C3FFC3.l,X		; FF C3 FF C3
	sbc $FFDBC3.l,X		; FF C3 DB FF
	phd		; 0B
	phd		; 0B
	phd		; 0B
	eor #$E3.b		; 49 E3
	cld		; D8
	cld		; D8
	cld		; D8
	ora $AC29.w,X		; 1D 29 AC
	sbc $FDF1.w,X		; FD F1 FD
	sbc $F9FF.w,Y		; F9 FF F9
	sbc $F9FFF9.l,X		; FF F9 FF F9
	sbc $F9FFF9.l,X		; FF F9 FF F9
	sbc $F9F3B5.l,X		; FF B5 F3 F9
	xce		; FB
	eor $59.b,S		; 43 59
	lda $AC.b,X		; B5 AC
	cmp #$4C.b		; C9 4C
	iny		; C8
	cpy #$42.b		; C0 42
	phk		; 4B
	sta $89.b,X		; 95 89
	eor $B2FF.w		; 4D FF B2
	ror $56.b,X		; 76 56
	lsr A		; 4A
	cpy $C4.b		; C4 C4
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	dec $D6.b,X		; D6 D6
	dec $A1.b,X		; D6 A1
	beq 110.b		; F0 6E
	ora ($6A.b,X)		; 01 6A
	inc $FC02.w,X		; FE 02 FC
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	brk $3D.b		; 00 3D
	adc $6F6F6F.l		; 6F 6F 6F 6F
	adc $99DB6F.l		; 6F 6F DB 99
	cpx $05.b		; E4 05
	asl $32.b,X		; 16 32
	.db $82, $16, $32		; 82 16 32
	.db $82, $16, $32		; 82 16 32
	.db $82, $16, $32		; 82 16 32
	.db $82, $16, $32		; 82 16 32
	.db $82, $16, $32		; 82 16 32
	.db $82, $E3, $01		; 82 E3 01
	ora $FB.b		; 05 FB
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	ldy $A6D0.w		; AC D0 A6
	ldx $16.b		; A6 16
	plp		; 28
	cmp $2FDF2F.l,X		; DF 2F DF 2F
	cmp $2FDF2F.l,X		; DF 2F DF 2F
	cmp $1FA52F.l,X		; DF 2F A5 1F
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $76.b		; 00 76
	ora $074F58.l		; 0F 58 4F 07
	sbc [$53.b]		; E7 53
	and ($DE.b,X)		; 21 DE
	php		; 08
	bpl -39.b		; 10 D9
	sed		; F8
	tsa		; 3B
	adc $9DF8.w		; 6D F8 9D
	cli		; 58
	eor $BDD7D7.l		; 4F D7 D7 BD
	ora $00.b		; 05 00
	lda $0005.w,X		; BD 05 00
	nop		; EA
	nop		; EA
	sta $85.b		; 85 85
	tda		; 7B
	and $16.b,S		; 23 16
	rol A		; 2A
	asl $2A.b,X		; 16 2A
	and $AA.b,S		; 23 AA
	tax		; AA
	asl $11.b,X		; 16 11
	asl $11.b,X		; 16 11
	tax		; AA
	tax		; AA
	asl $D5.b,X		; 16 D5
	asl $D5.b,X		; 16 D5
	tax		; AA
	tax		; AA
	.db $42, $16		; 42 16
	cmp $00.b,X		; D5 00
	.db $42, $55		; 42 55
	brk $16.b		; 00 16
	inc $5500.w		; EE 00 55
	brk $16.b		; 00 16
	rol A		; 2A
	brk $55.b		; 00 55
	lsr A		; 4A
	brk $01.b		; 00 01
	asl $021F.w		; 0E 1F 02
	and $050507.l,X		; 3F 07 05 05
	brk $16.b		; 00 16
	bit $1605.w		; 2C 05 16
	ora $16.b,X		; 15 16
	asl A		; 0A
	rol $0C00.w		; 2E 00 0C
	asl $160F.w		; 0E 0F 16
	bit $2116.w,X		; 3C 16 21
	sec		; 38
	brk $16.b		; 00 16
	sta $16.b		; 85 16
	tsx		; BA
	brk $3F.b		; 00 3F
	asl $85.b,X		; 16 85
	asl $BA.b,X		; 16 BA
	asl $CA.b,X		; 16 CA
	asl $F5.b,X		; 16 F5
	bra -65.b		; 80 BF
	sbc $E9DF0F.l,X		; FF 0F DF E9
	and $FF3F7F.l,X		; 3F 7F 3F FF
	and $3F3C7F.l,X		; 3F 7F 3C 3F
	adc $194A3F.l,X		; 7F 3F 4A 19
	eor ($19.b,X)		; 41 19
	eor ($16.b,X)		; 41 16
	inc A		; 1A
	asl $43.b,X		; 16 43
	lda $7F25BF.l,X		; BF BF 25 7F
	adc $25BFBF.l,X		; 7F BF BF 25
	sbc ($FE.b,X)		; E1 FE
	sbc ($FE.b,X)		; E1 FE
	sbc $FC.b,S		; E3 FC
	lda $7F4240.l,X		; BF 40 42 7F
	bra -65.b		; 80 BF
	rti		; 40

	.db $42, $AC		; 42 AC
	ora #$F879.w		; 09 79 F8
	asl $78.b,X		; 16 78
	and [$DE.b],Y		; 37 DE
	adc [$FF.b],Y		; 77 FF
	bra   7.b		; 80 07
	bcc  88.b		; 90 58
	.db $42, $AC		; 42 AC
	and $23.b		; 25 23
	adc $00.b,X		; 75 00
	trb $4258.w		; 1C 58 42
	ldy $07A8.w		; AC A8 07
	asl $FF.b		; 06 FF
	asl $F6.b,X		; 16 F6
	dec A		; 3A
	inc $E4.b,X		; F6 E4
	xce		; FB
	asl $EA.b,X		; 16 EA
	sbc $F801A1.l		; EF A1 01 F8
	ora #$F097.w		; 09 97 F0
	ora $E01FE0.l		; 0F E0 1F E0
	ora $0ABCAC.l,X		; 1F AC BC 0A
	asl $63.b,X		; 16 63
	cmp $C0.b		; C5 C0
	ora $73.b		; 05 73
	cmp $1C.b,S		; C3 1C
	asl $9C.b,X		; 16 9C
	brk $BE.b		; 00 BE
	and $47.b,S		; 23 47
	stp		; DB
	sbc $16FFE3.l,X		; FF E3 FF 16
	adc $5B.b,S		; 63 5B
	sbc $918CF0.l,X		; FF F0 8C 91
	brk $16.b		; 00 16
	and #$2942.w		; 29 42 29
	bra 109.b		; 80 6D
	sta $23F8.w		; 8D F8 23
	jsr ($4200.w,X)		; FC 00 42
	stp		; DB
	tad		; 5B
	sbc $C3FFE3.l,X		; FF E3 FF C3
	sbc $F907.w,Y		; F9 07 F9
	ora [$F3.b]		; 07 F3
	ora $00.b,S		; 03 00
	asl $14.b,X		; 16 14
	.db $42, $B5		; 42 B5
	and $CE07.w		; 2D 07 CE
	and $89.b,S		; 23 89
	.db $42, $DB		; 42 DB
	eor $5D5D.w,X		; 5D 5D 5D
	brk $E4.b		; 00 E4
	.db $42, $C6		; 42 C6
	dec $90.b		; C6 90
	bra  35.b		; 80 23
	adc ($3A.b,X)		; 61 3A
	ror $00A7.w		; 6E A7 00
	asl $52.b,X		; 16 52
	sbc $3A6122.l,X		; FF 22 61 3A
	ror $00A7.w		; 6E A7 00
	asl $91.b,X		; 16 91
	sbc $3A6122.l,X		; FF 22 61 3A
	ror $CFC8.w		; 6E C8 CF
	sbc $28FFCF.l,X		; FF CF FF 28
	cmp $F3.b,S		; C3 F3
	brk $16.b		; 00 16
	eor #$0F1C.w		; 49 1C 0F
	and $0F89.w		; 2D 89 0F
	and $89.b,S		; 23 89
	ldx $56B2.w,Y		; BE B2 56
	ora $B96E3A.l		; 0F 3A 6E B9
	sbc $B9F7F6.l,X		; FF F6 F7 B9
	cmp $00F7F6.l		; CF F6 F7 00
	asl $22.b,X		; 16 22
	.db $42, $18		; 42 18
	beq -11.b		; F0 F5
	php		; 08
	stz $0800.w		; 9C 00 08
	sta $D6BE.w		; 8D BE D6
	dec $A1.b,X		; D6 A1
	beq  58.b		; F0 3A
	ror $00A7.w		; 6E A7 00
	asl $99.b,X		; 16 99
	sbc $3A6122.l,X		; FF 22 61 3A
	ror $00A7.w		; 6E A7 00
	asl $14.b,X		; 16 14
	sbc $3A6122.l,X		; FF 22 61 3A
	ror $35FC.w		; 6E FC 35
	and $91.b,X		; 35 91
	.db $42, $16		; 42 16
	ldy $FF.b		; A4 FF
	jsl $6E3A61.l		; 22 61 3A 6E
	cop $FC.b		; 02 FC
	inc $FEFC.w,X		; FE FC FE
	jsr ($3C3A.w,X)		; FC 3A 3C
	brk $16.b		; 00 16
	lda $42.b		; A5 42
	ora ($6F.b,X)		; 01 6F
	ora $03.b,S		; 03 03
	ora ($BE.b,X)		; 01 BE
	and $47.b,S		; 23 47
	stp		; DB
	asl $32.b,X		; 16 32
	.db $82, $33, $82		; 82 33 82
	asl $35.b,X		; 16 35
	asl $86.b,X		; 16 86
	cmp $19.b		; C5 19
	ora [$E2.b]		; 07 E2
	ora $C3FDC2.l,X		; 1F C2 FD C3
	jsr ($F8C7.w,X)		; FC C7 F8
	ldx $4723.w,Y		; BE 23 47
	stp		; DB
	cmp $A0DF2F.l,X		; DF 2F DF A0
	lsr $3F.b		; 46 3F
	sbc $10BFBF.l,X		; FF BF BF 10
	brk $1F.b		; 00 1F
	adc $7F47.w		; 6D 47 7F
	bra 115.b		; 80 73
	and $80FF66.l,X		; 3F 66 FF 80
	lda [$6E.b]		; A7 6E
	and $42.b		; 25 42
	lda [$23.b]		; A7 23
	ora ($58.b)		; 12 58
	trb $A742.w		; 1C 42 A7
	ror $FFA2.w		; 6E A2 FF
	ora $A7.b,S		; 03 A7
	lda $6DFC.w,X		; BD FC 6D
	cli		; 58
	.db $42, $96		; 42 96
	ora $A7.b,S		; 03 A7
	ror $FC23.w		; 6E 23 FC
	jsr ($169B.w,X)		; FC 9B 16
	pla		; 68
	asl $68.b,X		; 16 68
	cpy #$CD16.w		; C0 16 CD
	asl $A8.b,X		; 16 A8
	tax		; AA
	asl $54.b,X		; 16 54
	asl $5D.b,X		; 16 5D
	cpy #$CC16.w		; C0 16 CC
	and $02.b,S		; 23 02
	cop $23.b		; 02 23
	asl $68.b,X		; 16 68
	asl $97.b,X		; 16 97
	cpy #$163F.w		; C0 3F 16
	tay		; A8
	asl $57.b,X		; 16 57
	asl $54.b,X		; 16 54
	asl $AB.b,X		; 16 AB
	cpy #$423F.w		; C0 3F 42
	sbc $72FC.w,X		; FD FC 72
	dec $7F7B.w,X		; DE 7B 7F
	adc $16BB16.l,X		; 7F 16 BB 16
	tyx		; BB
	cmp $16.b		; C5 16
	cmp $550A.w,X		; DD 0A 55
	sbc $441690.l,X		; FF 90 16 44
	lsr A		; 4A
	bit $0500.w		; 2C 00 05
	asl $35.b,X		; 16 35
	cop $16.b		; 02 16
	rol A		; 2A
	asl $0A.b,X		; 16 0A
	asl $1602.w,X		; 1E 02 16
	asl A		; 0A
	ora #$A909.w		; 09 09 A9
	asl $45.b,X		; 16 45
	asl $7A.b,X		; 16 7A
	.db $82, $16, $BD		; 82 16 BD
	asl $CA.b,X		; 16 CA
	asl $F5.b,X		; 16 F5
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	asl $E9.b,X		; 16 E9
	asl $F6.b,X		; 16 F6
	asl $DD.b,X		; 16 DD
	asl A		; 0A
	eor $FF.b,X		; 55 FF
	lda $3C7F3F.l,X		; BF 3F 7F 3C
	bit $6C3F.w,X		; 3C 3F 6C
	lsr A		; 4A
	lda #$253C.w		; A9 3C 25
	adc $BFBF7F.l,X		; 7F 7F BF BF
	adc $73A97F.l,X		; 7F 7F A9 73
	.db $42, $7F		; 42 7F
	bra -65.b		; 80 BF
	rti		; 40

	adc $DD1680.l,X		; 7F 80 16 DD
	asl A		; 0A
	eor $DE.b,X		; 55 DE
	ror $DEA9.w		; 6E A9 DE
	lda #$4258.w		; A9 58 42
	asl $DD.b,X		; 16 DD
	asl A		; 0A
	eor $DE.b,X		; 55 DE
	ror $E7A9.w		; 6E A9 E7
	inc $EE16.w,X		; FE 16 EE
	sbc $FFEC16.l		; EF 16 EC FF
	sbc $E516EF.l		; EF EF 16 E5
	sbc $071F08.l		; EF 08 1F 07
	asl $0605.w		; 0E 05 06
	cpx #$E01F.w		; E0 1F E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $C81FE0.l,X		; 1F E0 1F C8
	cpx #$50FF.w		; E0 FF 50
	dec $6CFF.w,X		; DE FF 6C
	jmp ($4A4D.w)		; 6C 4D 4A
	asl $6F.b,X		; 16 6F
	asl $90.b,X		; 16 90
	lda $1F7340.l,X		; BF 40 73 1F
	cpx #$50AF.w		; E0 AF 50
	adc ($AF.b,S),Y		; 73 AF
	bvc  63.b		; 50 3F
	ror $61.b		; 66 61
	stp		; DB
	adc ($1C.b,X)		; 61 1C
	adc ($DB.b,X)		; 61 DB
	asl $B7.b,X		; 16 B7
	asl $4B.b,X		; 16 4B
	asl $EB.b,X		; 16 EB
	ora [$E1.b],Y		; 17 E1
	ora $163FC7.l,X		; 1F C7 3F 16
	lda $5716.w		; AD 16 57
	cpx #$AF1F.w		; E0 1F AF
	asl $53.b,X		; 16 53
	asl $E5.b,X		; 16 E5
	asl $1B.b,X		; 16 1B
	brk $61.b		; 00 61
	stp		; DB
	and $BFBFFF.l,X		; 3F FF BF BF
	lda $BFBFFF.l,X		; BF FF BF BF
	and $6680BF.l,X		; 3F BF 80 66
	bra  35.b		; 80 23
	adc ($73.b,S),Y		; 73 73
	adc ($73.b,S),Y		; 73 73
	adc ($16.b,S),Y		; 73 16
	ora $3FFF.w,X		; 1D FF 3F
	sbc $FFDE55.l,X		; FF 55 DE FF
	inc A		; 1A
	inc A		; 1A
	bra -128.b		; 80 80
	lsr A		; 4A
	asl $28.b,X		; 16 28
	asl $2B.b,X		; 16 2B
	bne  22.b		; D0 16
	cmp $16.b,X		; D5 16
	sty $16.b,X		; 94 16
	stz $1650.w,X		; 9E 50 16
	mvn $A4,$16		; 54 16 A4
	asl $A4.b,X		; 16 A4
	lda #$2816.w		; A9 16 28
	asl $D7.b,X		; 16 D7
	bne  47.b		; D0 2F
	asl $94.b,X		; 16 94
	asl $6B.b,X		; 16 6B
	bvc -81.b		; 50 AF
	asl $A5.b,X		; 16 A5
	asl $5B.b,X		; 16 5B
	asl $DD.b,X		; 16 DD
	asl A		; 0A
	eor $46.b,X		; 55 46
	sbc $A97B9B.l,X		; FF 9B 7B A9
	asl $EE.b,X		; 16 EE
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $16BE55.l,X		; FF 55 BE 16
	ora $6E.b,X		; 15 6E
	tda		; 7B
	brk $FF.b		; 00 FF
	rti		; 40

	ldx $7788.w,Y		; BE 88 77
	brk $FF.b		; 00 FF
	tax		; AA
	eor $40.b,X		; 55 40
	lda $7B55AA.l,X		; BF AA 55 7B
	lsr A		; 4A
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $DF.b,X		; 55 DF
	jsr $55AA.w		; 20 AA 55
	eor [$BE.b]		; 47 BE
	tsa		; 3B
	brk $46.b		; 00 46
	bit $166D.w		; 2C 6D 16
	brk $00.b		; 00 00
	pld		; 2B
	lsr $7C1F.w,X		; 5E 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	plb		; AB
	and ($1F.b,S),Y		; 33 1F
	jmp ($7C1F.w,X)		; 7C 1F 7C
	ora $27277C.l,X		; 1F 7C 27 27
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $1EA57C.l,X		; 1F 7C A5 1E
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $12437C.l,X		; 1F 7C 43 12
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $09C17C.l,X		; 1F 7C C1 09
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $05607C.l,X		; 1F 7C 60 05
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $00E07C.l,X		; 1F 7C E0 00
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7EEF7C.l,X		; 1F 7C EF 7E
	php		; 08
	brk $0C.b		; 00 0C
	brk $11.b		; 00 11
	brk $16.b		; 00 16
	brk $B8.b		; 00 B8
	trb $BA.b		; 14 BA
	and $BD.b,X		; 35 BD
	lsr $1F.b,X		; 56 1F
	brk $1F.b		; 00 1F
	jmp ($7C1F.w,X)		; 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $18C67C.l,X		; 1F 7C C6 18
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
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $00007C.l,X		; 1F 7C 00 00
	rol $FB.b		; 26 FB
	brk $55.b		; 00 55
	inx		; E8
	tsb $00.b		; 04 00
	asl A		; 0A
	lda $7395.w,X		; BD 95 73
	eor #$C39A.w		; 49 9A C3
	lda [$C6.b]		; A7 C6
	sbc $31.b,S		; E3 31
	phk		; 4B
	cmp #$2040.w		; C9 40 20
	rti		; 40

	ldx $1030.w		; AE 30 10
	tay		; A8
	jsr ($C021.w,X)		; FC 21 C0
	rep #$4D		; C2 4D
	sbc $1A.b,X		; F5 1A
.ACCU 8
	sep #$67		; E2 67
	ora ($2A.b,X)		; 01 2A
	rol A		; 2A
	eor $3E43.w		; 4D 43 3E
	and [$97.b]		; 27 97
	mvp $DF,$84		; 44 84 DF
	adc ($B4.b,X)		; 61 B4
	dey		; 88
	inc $3888.w		; EE 88 38
	cmp $7B.b		; C5 7B
	stp		; DB
	adc $785B.w,Y		; 79 5B 78
	sta ($E8.b),Y		; 91 E8
	sty $6C.b		; 84 6C
	ora $FE29.w,Y		; 19 29 FE
	cli		; 58
	phx		; DA
	sty $C8.b,X		; 94 C8
	plx		; FA
	lda $24B2.w,Y		; B9 B2 24
	sta ($09.b),Y		; 91 09
	and ($2A.b,X)		; 21 2A
	and $9E.b		; 25 9E
	adc $BE2C.w,Y		; 79 2C BE
	cpy $6C.b		; C4 6C
	jsr ($909B.w,X)		; FC 9B 90
	lda $29.b		; A5 29
	sta ($C9.b,S),Y		; 93 C9
	ora [$6E.b],Y		; 17 6E
	ldx $CB.b,Y		; B6 CB
	ldy $D2.b		; A4 D2
	adc $B3C8E6.l		; 6F E6 C8 B3
	rol $EBF4.w,X		; 3E F4 EB
	adc [$97.b],Y		; 77 97
	jsl $9AFC5D.l		; 22 5D FC 9A
	eor $F266.w,Y		; 59 66 F2
	eor $9324.w,Y		; 59 24 93
	eor #$11.b		; 49 11
	ldy $DD.b		; A4 DD
	eor $66F9B3.l		; 4F B3 F9 66
	stz $896C.w,X		; 9E 6C 89
	sty $45.b,X		; 94 45
	and ($12.b),Y		; 31 12
	phk		; 4B
	rol A		; 2A
	ldx $B789.w		; AE 89 B7
	bit $39.b		; 24 39
	rol $2966.w,X		; 3E 66 29
	sbc $65.b		; E5 65
	adc $E4A90F.l		; 6F 0F A9 E4
	cpx $1E.b		; E4 1E
	adc $23FF1B.l		; 6F 1B FF 23
	plx		; FA
	sbc $C40E.w,X		; FD 0E C4
	sbc ($38.b,S),Y		; F3 38
	jmp.w [$CD23]		; DC 23 CD
	dec $07F9.w		; CE F9 07
	sta ($8D.b,S),Y		; 93 8D
	lsr $51.b		; 46 51
	cld		; D8
	pla		; 68
	ror $2C07.w,X		; 7E 07 2C
	jsr ($6C09.w,X)		; FC 09 6C
	rol $F831.w,X		; 3E 31 F8
	ora $B0D5.w,X		; 1D D5 B0
	sbc $F0F3.w,X		; FD F3 F0
	sec		; 38
	stx $C3.b,Y		; 96 C3
	tsx		; BA
	and $6C8B03.l,X		; 3F 03 8B 6C
	sec		; 38
	lda [$E0.b]		; A7 E0
	adc [$76.b],Y		; 77 76
	cmp $B0.b,S		; C3 B0
	dec A		; 3A
	and $61BB.w		; 2D BB 61
	sbc ($4E.b),Y		; F1 4E
	phb		; 8B
	adc ($D8.b)		; 72 D8
	jmp ($A2A3.w,X)		; 7C A3 A2
	sbc $5B.b,S		; E3 5B
	ora $179DF8.l		; 0F F8 9D 17
	rol $D8.b		; 26 D8
	adc $5F74EE.l,X		; 7F EE 74 5F
	tda		; 7B
	jmp ($643F.w)		; 6C 3F 64
	sbc $6C7F57.l,X		; FF 57 7F 6C
	sec		; 38
	adc [$FA.b]		; 67 FA
	lda $B06D.w,X		; BD 6D B0
	sbc $FA87.w,Y		; F9 87 FA
	tyx		; BB
	xce		; FB
	adc ($FC.b,X)		; 61 FC
	cmp [$FA.b]		; C7 FA
	lda $B26D.w,X		; BD 6D B2
	ora $5DB494.l		; 0F 94 B4 5D
	bcc -127.b		; 90 81
	ora $0B00.w,Y		; 19 00 0B
	lda [$85.b]		; A7 85
	tyx		; BB
	plb		; AB
	adc [$56.b],Y		; 77 56
	sbc $B6783A.l		; EF 3A 78 B6
	phb		; 8B
	eor $A2.b		; 45 A2
	cmp ($68.b),Y		; D1 68
	ldy $2034.w,X		; BC 34 20
	ora $67.b		; 05 67
	eor ($12.b,S),Y		; 53 12
	jmp $247149.l		; 5C 49 71 24
	eor [$09.b]		; 47 09
	sty $C2.b		; 84 C2
	adc ($30.b,X)		; 61 30
	stx $08.b,Y		; 96 08
	bcc  85.b		; 90 55
	tsb $4A.b		; 04 4A
	sta $E98A32.l		; 8F 32 8A E9
	jsr $73FA.w		; 20 FA 73
	lda #$20.b		; A9 20
	bit $B490.w		; 2C 90 B4
	adc $17.b,S		; 63 17
	lda $20.b		; A5 20
	sbc $9424.w,Y		; F9 24 94
	brk $BC.b		; 00 BC
	stz $B7.b,X		; 74 B7
	sty $EF.b,X		; 94 EF
	and #$DE.b		; 29 DE
	eor $A1.b		; 45 A1
	tsx		; BA
	eor $972E.w,X		; 5D 2E 97
	phk		; 4B
	ldy $C2.b		; A4 C2
	jsr $1306.w		; 20 06 13
	phx		; DA
	cmp $DDDA.w,X		; DD DA DD
	phx		; DA
	cmp $C8CA.w,X		; DD CA C8
	pei ($54.b)		; D4 54
	mvn $54,$54		; 54 54 54
	lsr $22.b,X		; 56 22
	eor ($94.b,X)		; 41 94
	trb $99.b		; 14 99
	lsr $18.b		; 46 18
	bcc 124.b		; 90 7C
	adc ($88.b,X)		; 61 88
	ora #$34.b		; 09 34
	and $D83B7E.l		; 2F 7E 3B D8
	ror $C3.b		; 66 C3
	and $53.b,X		; 35 53
	eor $35.b,X		; 55 35
	and ($53.b,S),Y		; 33 53
	and $E2.b,X		; 35 E2
	jmp ($8999.w)		; 6C 99 89
	bit #$89.b		; 89 89
	bit #$89.b		; 89 89
	sta ($11.b,X)		; 81 11
	ora ($11.b),Y		; 11 11
	ora $37FF.w,X		; 1D FF 37
	adc $F3DFCD.l,X		; 7F CD DF F3
	adc ($3A.b),Y		; 71 3A
	stz $1D37.w,X		; 9E 37 1D
	and $F659.w,Y		; 39 59 F6
	bcs -120.b		; B0 88
	dey		; 88
	dey		; 88
	dey		; 88
	sbc $FF3D.w,Y		; F9 3D FF
	sta [$DE.b],Y		; 97 DE
	sbc $F65D.w,Y		; F9 5D F6
	sbc ($A5.b,S),Y		; F3 A5
	adc $251161.l,X		; 7F 61 11 25
	adc $64.b		; 65 64
	stz $44.b		; 64 44
	mvp $8F,$7B		; 44 7B 8F
	eor $06.b,S		; 43 06
	eor [$71.b],Y		; 57 71
	inx		; E8
	adc [$1E.b],Y		; 77 1E
	stx $0C.b		; 86 0C
	ldy $C1.b		; A4 C1
	sta $83.b,X		; 95 83
	rol A		; 2A
	txs		; 9A
	and $6EA3FC.l,X		; 3F FC A3 6E
	tsa		; 3B
	adc ($DB.b),Y		; 71 DB
	stx $7CDC.w		; 8E DC 7C
	php		; 08
	sed		; F8
	ora ($A0.b),Y		; 11 A0
	sta $48240A.l		; 8F 0A 24 48
	sta ($22.b),Y		; 91 22
	mvp $37,$C3		; 44 C3 37
	lda $35.b		; A5 35
	eor ($D5.b,S),Y		; 53 D5
	and $D333.w,X		; 3D 33 D3
	bit $8C67.w,X		; 3C 67 8C
	sbc $68B2.w,Y		; F9 B2 68
	jsr ($194D.w,X)		; FC 4D 19
	bit $64.b,X		; 34 64
	stz $9C9C.w		; 9C 9C 9C
	cmp ($92.b),Y		; D1 92
	pea $ADB7.w		; F4 B7 AD
	ror $A9D5.w,X		; 7E D5 A9
	inc $7ACF.w		; EE CF 7A
	wai		; CB
	cmp $73F58E.l,X		; DF 8E F5 73
	lsr A		; 4A
	phy		; 5A
	rol $EEEE.w		; 2E EE EE
	sta [$8D.b],Y		; 97 8D
	pea $BF99.w		; F4 99 BF
	inc $92CD.w		; EE CD 92
	and $080D.w		; 2D 0D 08
	dey		; 88
	dey		; 88
	cpx #$C1CA.w		; E0 CA C1
	sta $83.b,X		; 95 83
	pld		; 2B
	pea $47BF.w		; F4 BF 47
	sbc #$7E.b		; E9 7E
	stx $D1DB.w		; 8E DB D1
	sbc $1EBD.w		; ED BD 1E
	stp		; DB
	cmp ($11.b),Y		; D1 11
	ora ($11.b),Y		; 11 11
	ora ($44.b),Y		; 11 44
	lsr $99BF.w		; 4E BF 99
	sta ($CE.b,S),Y		; 93 CE
	cmp $FC77F3.l,X		; DF F3 77 FC
	jmp.w [$759E]		; DC 9E 75
	sta $68.b,X		; 95 68
	sbc ($FE.b,X)		; E1 FE
	jmp ($5733.w,X)		; 7C 33 57
	and $97.b,X		; 35 97
	ldy $B2C6.w		; AC C6 B2
	xba		; EB
	cpx $E7.b		; E4 E7
	adc $DE99.w,Y		; 79 99 DE
	adc $E7E677.l		; 6F 77 E6 E7
	adc $EF5C.w,X		; 7D 5C EF
	plb		; AB
	sta $FCA9.w,X		; 9D A9 FC
	tsx		; BA
	sta $01C0.w,Y		; 99 C0 01
	eor ($41.b,X)		; 41 41
	tax		; AA
	ror A		; 6A
	txs		; 9A
	ldy $0A.b		; A4 0A
	eor $6B6A.w		; 4D 6A 6B
	lda $DBFD.w,X		; BD FD DB
	and $733559.l		; 2F 59 35 73
	ply		; 7A
	eor ($61.b,S),Y		; 53 61
	stz $74D1.w,X		; 9E D1 74
	lda $DFBC.w,X		; BD BC DF
	eor #$9B.b		; 49 9B
	rol $64.b		; 26 64
	tsx		; BA
	ora $5A421B.l,X		; 1F 1B 42 5A
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	pei ($CE.b)		; D4 CE
	pei ($CE.b)		; D4 CE
	pei ($CE.b)		; D4 CE
	nop		; EA
	sbc $F9573F.l,X		; FF 3F 57 F9
	jsr ($FBAE.w,X)		; FC AE FB
	dex		; CA
	sbc $FAAEBC.l		; EF BC AE FA
	mvp $44,$44		; 44 44 44
	mvp $13,$51		; 44 51 13
	tsx		; BA
	sbc ($7E.b,S),Y		; F3 7E
	and [$DC.b]		; 27 DC
	sbc $1EBD.w		; ED BD 1E
	stp		; DB
	cmp ($F8.b),Y		; D1 F8
	sta $6BBA72.l,X		; 9F 72 BA 6B
	plb		; AB
	pea $3E55.w		; F4 55 3E
	ora $9AEB.w,Y		; 19 EB 9A
	lda $EB5D79.l,X		; BF 79 5D EB
	and ($63.b)		; 32 63
	sta $1B.b,X		; 95 1B
	sbc $73FC7A.l,X		; FF 7A FC 73
	and $99.b,S		; 23 99
	trb $53DF.w		; 1C DF 53
	rol $24.b,X		; 36 24
	tas		; 1B
	eor ($41.b,X)		; 41 41
	eor ($02.b,X)		; 41 02
	sta ($9A.b),Y		; 91 9A
	and ($51.b,S),Y		; 33 51
	and $3939.w,Y		; 39 39 39
	and $3439.w,Y		; 39 39 34
	cpy $C4.b		; C4 C4
	cmp $8B37.w,Y		; D9 37 8B
	cmp $ED.b		; C5 ED
	sbc $D2.b		; E5 D2
	inx		; E8
	jsl $232222.l		; 22 22 22 23
	sbc $6616BF.l		; EF BF 16 66
	ldx $66.b,Y		; B6 66
	lda $CE.b,X		; B5 CE
	sta $9ECE.w,X		; 9D CE 9E
	ror $B6.b		; 66 B6
	ror $B6.b		; 66 B6
	ror $B0.b		; 66 B0
	dey		; 88
	dey		; 88
	dey		; 88
	txa		; 8A
	adc $E79D.w,Y		; 79 9D E7
	sta ($DF.b,S),Y		; 93 DF
	sbc $F75D.w,Y		; F9 5D F7
	sta $DF.b,X		; 95 DF
	adc $FF3D.w,Y		; 79 3D FF
	sta ($DF.b,S),Y		; 93 DF
	sbc $E87D.w,Y		; F9 7D E8
	dey		; 88
	dey		; 88
	dey		; 88
	stx $AC0C.w		; 8E 0C AC
	ora $C75D.w,Y		; 19 5D C7
	lda ($DC.b,X)		; A1 DC
	ply		; 7A
	ora $A1C7.w,X		; 1D C7 A1
	jmp.w [$1D7A]		; DC 7A 1D
	cmp [$A1.b]		; C7 A1
	sta $2B.b,S		; 83 2B
	lda $1E5F8F.l		; AF 8F 5F 1E
	tax		; AA
	sta ($92.b)		; 92 92
	sta ($92.b)		; 92 92
	sta ($31.b)		; 92 31
	jsl $418547.l		; 22 47 85 41
	eor ($45.b,X)		; 41 45
	brk $14.b		; 00 14
	eor $22E244.l		; 4F 44 E2 22
	jsl $26A34F.l		; 22 4F A3 26
	sty $3F9A.w		; 8C 9A 3F
	ora ($36.b,S),Y		; 13 36
	jmp $33D9.w		; 4C D9 33
	adc $93BEDD.l,X		; 7F DD BE 93
	adc $8820.w,X		; 7D 20 88
	dey		; 88
	dey		; 88
	sta $F6E86D.l		; 8F 6D E8 F6
	dec $6D8F.w,X		; DE 8F 6D
	inx		; E8
	inc $ABFD.w		; EE FD AB
	sta $BD34.w,X		; 9D 34 BD
	eor $84DA.w		; 4D DA 84
	mvp $44,$44		; 44 44 44
	adc ($79.b)		; 72 79
	dec $F1FB.w,X		; DE FB F1
	adc $3CB9F9.l		; 6F F9 B9 3C
	sbc $889203.l		; EF 03 92 88
	stx $9B.b,Y		; 96 9B
	jmp $ACAC.w		; 4C AC AC
	sty $8E88.w		; 8C 88 8E
	ldx $76.b		; A6 76
	ldx $76.b		; A6 76
	ldx $76.b		; A6 76
	ldx $76.b		; A6 76
	ldx $72.b		; A6 72
	ror A		; 6A
	adc [$6A.b]		; 67 6A
	adc [$44.b]		; 67 44
	dec $A229.w		; CE 29 A2
	txs		; 9A
	and #$A2.b		; 29 A2
	txs		; 9A
	and #$A2.b		; 29 A2
	txs		; 9A
	cop $88.b		; 02 88
	.db $62, $82, $82		; 62 82 82
	.db $82, $82, $80		; 82 82 80
	eor #$C9.b		; 49 C9
	bit #$8B.b		; 89 8B
	cmp $D2.b		; C5 D2
	cmp ($2E.b),Y		; D1 2E
	mvp $1D,$B9		; 44 B9 1D
	adc $C9.b		; 65 C9
	adc $9212.w		; 6D 12 92
	pha		; 48
	brk $22.b		; 00 22
	jsl $EC2322.l		; 22 22 23 EC
	inc $579D.w,X		; FE 9D 57
	bvs -38.b		; 70 DA
	mvp $CB,$49		; 44 49 CB
	stp		; DB
	cmp ($11.b,X)		; C1 11
	ora ($11.b),Y		; 11 11
	asl $D1DB.w,X		; 1E DB D1
	sed		; F8
	sta $90A173.l,X		; 9F 73 A1 90
	dey		; 88
	stx $18.b,Y		; 96 18
	adc [$62.b],Y		; 77 62
	cli		; 58
	lsr $56.b,X		; 56 56
	adc ($2A.b,X)		; 61 2A
	and #$28.b		; 29 28
	lda $7BFF1B.l,X		; BF 1B FF 7B
	rol A		; 2A
	bit $91.b,X		; 34 91
	plp		; 28
	ldy #$4400.w		; A0 00 44
	mvp $47,$44		; 44 44 47
	clv		; B8
	pea $FE38.w		; F4 38 FE
	and [$1F.b],Y		; 37 1F
	dec $F7.b		; C6 F7
	adc $FEDD93.l,X		; 7F 93 DD FE
	lsr $8D3F.w		; 4E 3F 8D
	cmp [$F1.b]		; C7 F1
	clv		; B8
	inc $8830.w,X		; FE 30 88
	dey		; 88
	dey		; 88
	txa		; 8A
	adc $FC.b,X		; 75 FC
	cpy $769E.w		; CC 9E 76
	sbc $E6BF9B.l,X		; FF 9B BF E6
	cpx $F3.b		; E4 F3
	lda ($79.b)		; B2 79
	dec $F1FB.w,X		; DE FB F1
	php		; 08
	dey		; 88
	dey		; 88
	dey		; 88
	nop		; EA
	adc [$6A.b]		; 67 6A
	adc [$6A.b]		; 67 6A
	adc [$6A.b]		; 67 6A
	adc [$6A.b]		; 67 6A
	adc [$6A.b]		; 67 6A
	adc $CED52F.l,X		; 7F 2F D5 CE
	plx		; FA
	lda $D4D9.w,Y		; B9 D9 D4
	adc [$51.b]		; 67 51
	sta ($12.b,S),Y		; 93 12
	bit $48.b		; 24 48
	sta ($28.b),Y		; 91 28
	ldy #$A2A0.w		; A0 A0 A2
	.db $82, $0D, $96		; 82 0D 96
	eor $2024.w,Y		; 59 24 20
	eor [$74.b]		; 47 74
	lsr A		; 4A
	lsr A		; 4A
	eor ($AC.b,X)		; 41 AC
	jmp $F7FBFC.l		; 5C FC FB F7
	iny		; C8
	rol $8282.w,X		; 3E 82 82
	tsb $B491.w		; 0C 91 B4
	cpx $64.b		; E4 64
	eor $F241BE.l,X		; 5F BE 41 F2
	sta ($90.b)		; 92 90
	adc $14.b		; 65 14
	bpl  39.b		; 10 27
	eor ($41.b,X)		; 41 41
	eor ($06.b,X)		; 41 06
	adc $74.b,X		; 75 74
	ror $A6.b,X		; 76 A6
	lsr $96.b,X		; 56 96
	tyx		; BB
	sty $54.b,X		; 94 54
	stx $C3.b,Y		; 96 C3
	sty $54.b		; 84 54
	inc $87AD.w		; EE AD 87
	inc $3895.w		; EE 95 38
	stx $C3.b,Y		; 96 C3
	sec		; 38
	lda #$C5.b		; A9 C5
	ldx $19.b,Y		; B6 19
	sbc $4E.b		; E5 4E
	inc $50D8.w		; EE D8 50
	mvn $B6,$DB		; 54 DB B6
	ora $2D85.w,Y		; 19 85 2D
	wai		; CB
	adc ($F1.b,X)		; 61 F1
	dex		; CA
	jmp $F3616B.l		; 5C 6B 61 F3
	lsr A		; 4A
	jmp $DE619B.l		; 5C 9B 61 DE
	sty $BE.b,X		; 94 BE
	inc $D8.b,X		; F6 D8
	ror $1E.b		; 66 1E
	plb		; AB
	lda $1C1FB6.l,X		; BF B6 1F 1C
	sbc $5E.b,X		; F5 5E
	ldx $D8.b,Y		; B6 D8
	jmp ($D5D3.w,X)		; 7C D3 D5
	ply		; 7A
	xba		; EB
	adc ($DE.b,X)		; 61 DE
	stz $EFAB.w,X		; 9E AB EF
	sbc $6186.w		; ED 86 61
	ora [$E0.b],Y		; 17 E0
	tad		; 5B
	ora $F8458E.l		; 0F 8E 45 F8
	rol $C3.b,X		; 36 C3
	inc $91.b		; E6 91
	sei		; 78
	lsr $C3.b,X		; 56 C3
	lda $FC22.w,X		; BD 22 FC
	tad		; 5B
	stz $08.b		; 64 08
	stz $EE.b		; 64 EE
	sed		; F8
	cmp $9095.w,Y		; D9 95 90
	ror $49.b,X		; 76 49
	dec $DD.b		; C6 DD
	eor [$89.b],Y		; 57 89
	adc ($12.b,S),Y		; 73 12
	inc $25.b		; E6 25
	cpy $984B.w		; CC 4B 98
	sta [$31.b],Y		; 97 31
	rol $5C62.w		; 2E 62 5C
	cmp $CB62.w,X		; DD 62 CB
	cop $32.b		; 02 32
	eor #$90.b		; 49 90
	stz $19.b		; 64 19
	asl $41.b		; 06 41
	bcc  94.b		; 90 5E
	and $844E17.l		; 2F 17 4E 84
	tas		; 1B
	jmp $553D.w		; 4C 3D 55
	adc ($4E.b),Y		; 71 4E
	and #$C5.b		; 29 C5
	sec		; 38
	lda [$14.b]		; A7 14
.INDEX 8
	sep #$9C		; E2 9C
	eor ($8A.b,S),Y		; 53 8A
	adc ($20.b)		; 72 20
	eor $7FFBB3.l		; 4F B3 FB 7F
	jsr ($BFFB.w,X)		; FC FB BF
	lda $DB27.w,Y		; B9 27 DB
	rol $F7D9.w,X		; 3E D9 F7
	eor $1D6ABA.l		; 4F BA 6A 1D
	stz $C21B.w		; 9C 1B C2
	sta [$CE.b]		; 87 CE
	dec $B1BF.w		; CE BF B1
	adc $C5FE62.l,X		; 7F 62 FE C5
	sbc $C58F.w,X		; FD 8F C5
	rtl		; 6B

	sta [$2E.b],Y		; 97 2E
	cmp ($E3.b,X)		; C1 E3
	sta [$E0.b],Y		; 97 E0
	eor [$8D.b]		; 47 8D
	phd		; 0B
	wai		; CB
	cpx #$F2.b		; E0 F2
	sed		; F8
	bit $0FBE.w,X		; 3C BE 0F
	and $E0CB83.l		; 2F 83 CB E0
	sbc ($F8.b)		; F2 F8
	bit $0EBE.w,X		; 3C BE 0E
	sbc $81CB7B.l,X		; FF 7B CB 81
	rol $A71F.w,X		; 3E 1F A7
	cmp $F4.b,S		; C3 F4
	sed		; F8
	ror $0F9F.w,X		; 7E 9F 0F
	cmp ($E1.b,S),Y		; D3 E1
	plx		; FA
	jmp ($4F3F.w,X)		; 7C 3F 4F
	sta [$E9.b]		; 87 E9
	beq  -3.b		; F0 FD
	rol $091C.w,X		; 3E 1C 09
	sbc $171F.w,X		; FD 1F 17
	inx		; E8
	sed		; F8
	lda $FAC547.l,X		; BF 47 C5 FA
	rol $D12F.w,X		; 3E 2F D1
	sbc ($7E.b),Y		; F1 7E
	sta $7CF48B.l		; 8F 8B F4 7C
	eor $A77FFD.l,X		; 5F FD 7F A7
	sta $3902.w		; 8D 02 39
	sbc $1DE4.w,Y		; F9 E4 1D
	rol $25.b		; 26 25
	plb		; AB
	lda [$48.b],Y		; B7 48
	dec A		; 3A
	.db $42, $D6		; 42 D6
	sbc ($E9.b)		; F2 E9
	cop $14.b		; 02 14
	ora ($20.b),Y		; 11 20
	.db $42, $82		; 42 82
	bit $04.b		; 24 04
	ply		; 7A
	dec A		; 3A
	tsx		; BA
	dec A		; 3A
	tsx		; BA
	dec A		; 3A
	tsx		; BA
	dec A		; 3A
	tsx		; BA
	dec A		; 3A
	tsx		; BA
	dec A		; 3A
	ldy $8E6D.w,X		; BC 6D 8E
	rol $C6.b,X		; 36 C6
	jmp ($7E1F.w)		; 6C 1F 7E
	php		; 08
	cld		; D8
	lda $627FB1.l,X		; BF B1 7F 62
	inc $FDC5.w,X		; FE C5 FD
	phb		; 8B
	xce		; FB
	tas		; 1B
	lda $ED776B.l,X		; BF 6B 77 ED
	eor $70F783.l,X		; 5F 83 F7 70
	inx		; E8
	dey		; 88
	dey		; 88
	tya		; 98
	stp		; DB
	sei		; 78
	sta $0F46.w,X		; 9D 46 0F
	dec $C6.b		; C6 C6
	cpy $C4.b		; C4 C4
	mvp $44,$44		; 44 44 44
	lda $86.b,X		; B5 86
	phy		; 5A
	cld		; D8
	rol $A9D5.w,X		; 3E D5 A9
	adc $BF.b		; 65 BF
	sty $CA.b		; 84 CA
	sta ($F4.b,S),Y		; 93 F4
	phb		; 8B
	ldx $39.b		; A6 39
	stx $1965.w		; 8E 65 19
	stx $B0.b,Y		; 96 B0
	cmp $C5CA.w,X		; DD CA C5
	sbc $E922.w,X		; FD 22 E9
	stx $9963.w		; 8E 63 99
	lsr $66.b		; 46 66
	xba		; EB
	ora [$9F.b],Y		; 17 9F
	bne -85.b		; D0 AB
	adc ($38.b)		; 72 38
	lsr A		; 4A
	sty $0DE0.w		; 8C E0 0D
	and #$0A.b		; 29 0A
	jmp $1226.w		; 4C 26 12
	lda $38.b,S		; A3 38
	brk $28.b		; 00 28
	ldx #$74.b		; A2 74
	sta $AB1F17.l,X		; 9F 17 1F AB
	iny		; C8
	cmp [$DF.b]		; C7 DF
	stz $6F.b		; 64 6F
	stx $79.b,Y		; 96 79
	cpy #$0D.b		; C0 0D
	sbc ($BE.b),Y		; F1 BE
	and [$C6.b],Y		; 37 C6
	sed		; F8
	ora ($47.b,X)		; 01 47
	adc [$95.b],Y		; 77 95
	bit #$8F.b		; 89 8F
	sty $155A.w		; 8C 5A 15
	rti		; 40

	phd		; 0B
	inc $41.b		; E6 41
	sty $005A.w		; 8C 5A 00
	eor ($24.b),Y		; 51 24
	cpy $DD.b		; C4 DD
	adc $99.b,S		; 63 99
.ACCU 16
	rep #$A8		; C2 A8
	ora ($21.b,X)		; 01 21
	txa		; 8A
	adc $99.b,S		; 63 99
	cpy #$0A.b		; C0 0A
	and [$A1.b]		; 27 A1
	bit #$94BB.w		; 89 BB 94
	ora $50.b		; 05 50
	ora $D0.b,S		; 03 D0
	rol $8412.w		; 2E 12 84
	ldy #$28.b		; A0 28
	inc $C4A4.w		; EE A4 C4
	sta [$18.b],Y		; 97 18
	jsr ($A862.w,X)		; FC 62 A8
	ora ($29.b,X)		; 01 29
	pla		; 68
	dec $3F.b		; C6 3F
	inc A		; 1A
	lsr $5455.w		; 4E 55 54
	ldx $8D3F.w		; AE 3F 8D
	cmp $E3.b,X		; D5 E3
	.db $62, $EF, $B1		; 62 EF B1
	lda [$CA.b],Y		; B7 CA
	lda [$6E.b],Y		; B7 6E
	sta ($F5.b,X)		; 81 F5
	eor $BEF1.w		; 4D F1 BE
	and [$DF.b],Y		; 37 DF
	sbc #$FFBB.w		; E9 BB FF
	sbc $AA.b,S		; E3 AA
	inc $CABB.w		; EE BB CA
	bit $5272.w,X		; 3C 72 52
	rti		; 40

	asl A		; 0A
	tax		; AA
	lda [$9F.b]		; A7 9F
	eor [$8E.b]		; 47 8E
	phy		; 5A
	and $24.b		; 25 24
	brk $B5.b		; 00 B5
	ror A		; 6A
	dec A		; 3A
	pei ($F4.b)		; D4 F4
	adc $59.b,S		; 63 59
	ldx $C478.w		; AE 78 C4
	lda $DE.b		; A5 DE
	and $AC.b,X		; 35 AC
	cmp $7E6C.w		; CD 6C 7E
	bit #$AE59.w		; 89 59 AE
	sei		; 78
	cpy $A5.b		; C4 A5
	cmp ($24.b)		; D2 24
	ora #$8044.w		; 09 44 80
	cmp [$8D.b]		; C7 8D
	lda ($A3.b),Y		; B1 A3
	plb		; AB
	sbc ($75.b)		; F2 75
	sei		; 78
	phy		; 5A
	lda $123F12.l,X		; BF 12 3F 12
	and $123F12.l,X		; 3F 12 3F 12
	and [$EF.b],Y		; 37 EF
	inc $C0.b		; E6 C0
	stx $DAEF.w		; 8E EF DA
	lda $627FB1.l,X		; BF B1 7F 62
	inc $A5C7.w,X		; FE C7 A5
	phx		; DA
	adc $5AEB.w,X		; 7D EB 5A
	sbc ($6C.b)		; F2 6C
	tas		; 1B
	clv		; B8
	tad		; 5B
	beq  35.b		; F0 23
	bit #$E5D4.w		; 89 D4 E5
	beq 121.b		; F0 79
	jmp ($5F1E.w,X)		; 7C 1E 5F
	ora [$97.b]		; 07 97
	cmp ($E5.b,X)		; C1 E5
	beq 121.b		; F0 79
	jmp ($1F1E.w,X)		; 7C 1E 1F
	ora [$13.b]		; 07 13
	ora ($97.b,S),Y		; 13 97
	cop $32.b		; 02 32
	cmp [$DD.b],Y		; D7 DD
	adc $D7BD.w,Y		; 79 BD D7
	txy		; 9B
	cmp $BD79.w,X		; DD 79 BD
	cmp [$9B.b],Y		; D7 9B
	and $D772.w		; 2D 72 D7
	and $CB12.w,X		; 3D 12 CB
	cmp $7241.w,X		; DD 41 72
	cmp $CF.b,S		; C3 CF
	and $953F2B.l,X		; 3F 2B 3F 95
	sta $E5CFCA.l,X		; 9F CA CF E5
	adc [$F2.b]		; 67 F2
	lda ($F9.b,S),Y		; B3 F9
	eor $4FF4.w,Y		; 59 F4 4F
	mvp $A8,$FC		; 44 FC A8
	rol $7E88.w,X		; 3E 88 7E
	eor $C19707.l,X		; 5F 07 97 C1
	sbc $F0.b		; E5 F0
	adc $1A7C.w,Y		; 79 7C 1A
	sbc $AE.b		; E5 AE
	lsr $075F.w,X		; 5E 5F 07
	sta [$E9.b]		; 87 E9
	sbc ($E0.b)		; F2 E0
	tsx		; BA
	sbc ($F9.b,X)		; E1 F9
	bvs -68.b		; 70 BC
	sec		; 38
	eor $EEFCFC.l,X		; 5F FC FC EE
	cmp [$D0.b],Y		; D7 D0
	sbc ($7A.b,X)		; E1 7A
	jmp $874B3F.l		; 5C 3F 4B 87
	sbc #$7E76.w		; E9 76 7E
	sta [$67.b],Y		; 97 67
	sbc #$9E76.w		; E9 76 9E
	sta [$69.b],Y		; 97 69
	cop $74.b		; 02 74
	lsr $88.b		; 46 88
	cmp ($1A.b),Y		; D1 1A
	and $44.b,S		; 23 44
	pla		; 68
	sta $A211.w		; 8D 11 A2
	bit $09.b		; 24 09
	cmp $3CE319.l		; CF 19 E3 3C
	stz $35.b,X		; 74 35
	lda [$8C.b]		; A7 8C
	sbc ($9E.b),Y		; F1 9E
	and ($C6.b,S),Y		; 33 C6
	pla		; 68
	and [$33.b]		; 27 33
	and ($68.b)		; 32 68
	and $9FFEC2.l		; 2F C2 FE 9F
	phd		; 0B
	plx		; FA
	jmp ($E92F.w,X)		; 7C 2F E9
	nop		; EA
	lda $078F.w,X		; BD 8F 07
	iny		; C8
	beq 124.b		; F0 7C
	sta $F0C807.l		; 8F 07 C8 F0
	jmp ($0A8F.w,X)		; 7C 8F 0A
	ora #$A1EA.w		; 09 EA A1
	jmp ($2E18.w,X)		; 7C 18 2E
	lda $966B.w,Y		; B9 6B 96
	lda $7276.w,Y		; B9 76 72
	inc $EED7.w,X		; FE D7 EE
	adc $DCAF.w,X		; 7D AF DC
	xce		; FB
	eor $FFE2B9.l,X		; 5F B9 E2 FF
	and $4E70.w,X		; 3D 70 4E
	dec $DACF.w		; CE CF DA
	.db $82, $7C, $58		; 82 7C 58
	eor $37FF.w,X		; 5D FF 37
	lda $BD.b,S		; A3 BD
	inx		; E8
	sbc $DE3B7A.l		; EF 7A 3B DE
	stx $A3F7.w		; 8E F7 A3
	lda $EFE8.w,X		; BD E8 EF
	ply		; 7A
	tsa		; 3B
	cmp $2FFC.w,X		; DD FC 2F
	lsr $04.b		; 46 04
	stz $B4.b,X		; 74 B4
	bit $F7BE.w,X		; 3C BE F7
	wai		; CB
	sbc $FBAE7C.l		; EF 7C AE FB
	dex		; CA
	sbc $A73FBC.l		; EF BC 3F A7
	sbc ($FD.b,X)		; E1 FD
	and $BEFCAB.l,X		; 3F AB FC BE
	trb $952F.w		; 1C 2F 95
	ora $F8.b		; 05 F8
	bvs  -1.b		; 70 FF
	lsr $16.b,X		; 56 16
	.db $82, $82, $83		; 82 82 83
	jmp $7DFF.w		; 4C FF 7D
	ora $DB8F3E.l,X		; 1F 3E 8F DB
	sbc ($BB.b,S),Y		; F3 BB
	sta $27783A.l,X		; 9F 3A 78 27
	bit #$FC0B.w		; 89 0B FC
	bvc  88.b		; 50 58
	brk $44.b		; 00 44
	cmp #$4C32.w		; C9 32 4C
	sta ($24.b,S),Y		; 93 24
	eor $59.b,X		; 55 59
	ldx $E7.b		; A6 E7
	eor ($74.b,X)		; 41 74
	lsr $88.b		; 46 88
	cmp ($1A.b),Y		; D1 1A
	and $44.b,S		; 23 44
	pla		; 68
	sta $A211.w		; 8D 11 A2
	bit $04.b		; 24 04
	asl $AD.b,X		; 16 AD
	lsr $2020.w,X		; 5E 20 20
	mvn $81,$80		; 54 80 81
	eor ($02.b)		; 52 02
	ora $48.b		; 05 48
	ora ($A2.b,S),Y		; 13 A2
	ror $1747.w,X		; 7E 47 17
	sta ($C5.b),Y		; 91 C5
	cpx $71.b		; E4 71
	adc $5E1C.w,Y		; 79 1C 5E
	eor [$17.b]		; 47 17
	sta ($C5.b),Y		; 91 C5
	cpx $71.b		; E4 71
	pla		; 68
	lda $91.b,S		; A3 91
	cop $3C.b		; 02 3C
	and $E9874F.l,X		; 3F 4F 87 E9
	beq  -3.b		; F0 FD
	rol $A71F.w,X		; 3E 1F A7
	cmp $F4.b,S		; C3 F4
	sed		; F8
	ror $0F9F.w,X		; 7E 9F 0F
	cmp ($E1.b,S),Y		; D3 E1
	plx		; FA
	jmp ($1338.w,X)		; 7C 38 13
	sbc $2E3D.w		; ED 3D 2E
	cmp ($D2.b,S),Y		; D3 D2
	sbc $2E3D.w		; ED 3D 2E
	cmp ($D2.b,S),Y		; D3 D2
	sbc $2E3D.w		; ED 3D 2E
	cmp ($D2.b,S),Y		; D3 D2
	sbc $2E3D.w		; ED 3D 2E
	cmp ($D2.b,S),Y		; D3 D2
	sbc $4E20.w		; ED 20 4E
	dey		; 88
	stz $8523.w		; 9C 23 85
	ora [$05.b]		; 07 05
	bpl  35.b		; 10 23
	bit $8C67.w,X		; 3C 67 8C
	sbc ($9E.b),Y		; F1 9E
	and ($C6.b,S),Y		; 33 C6
	sei		; 78
	cmp $34E319.l		; CF 19 E3 34
	ora #$3EF8.w		; 09 F8 3E
	eor [$83.b]		; 47 83
	cpx $78.b		; E4 78
	rol $8347.w,X		; 3E 47 83
	cpx $78.b		; E4 78
	rol $8347.w,X		; 3E 47 83
	cpx $78.b		; E4 78
	rol $7842.w,X		; 3E 42 78
	bmi  34.b		; 30 22
	lda $BFF1DB.l,X		; BF DB F1 BF
	lda [$E3.b],Y		; B7 E3
	adc $FEC66F.l,X		; 7F 6F C6 FE
	cmp $BFF68D.l,X		; DF 8D F6 BF
	adc ($ED.b,S),Y		; 73 ED
	ror $CEE6.w,X		; 7E E6 CE
	phy		; 5A
	adc $F6176C.l,X		; 7F 6C 17 F6
	lda ($F6.b,X)		; A1 F6
	ror $57.b,X		; 76 57
	lda $BD.b,S		; A3 BD
	inx		; E8
	sbc $DE3B7A.l		; EF 7A 3B DE
	stx $9BF6.w		; 8E F6 9B
	pei ($DE.b)		; D4 DE
	stp		; DB
	dec $4E.b		; C6 4E
	sty $4C17.w		; 8C 17 4C
	rol $DADE.w,X		; 3E DE DA
	sbc $F75D.w,Y		; F9 5D F7
	sta $DF.b,X		; 95 DF
	adc $F75D.w,Y		; 79 5D F7
	sta $DF.b,X		; 95 DF
	sei		; 78
	adc $FAC34F.l,X		; 7F 4F C3 FA
	ply		; 7A
	jsr ($F204.w,X)		; FC 04 F2
	ldy #$BF.b		; A0 BF
	asl $5F1F.w		; 0E 1F 5F
	eor $9F7B.w,X		; 5D 7B 9F
	tsa		; 3B
	sed		; F8
	jsr ($FDEF.w,X)		; FC EF FD
	rol $CCB7.w,X		; 3E B7 CC
	plx		; FA
	cmp $9FFDC5.l,X		; DF C5 FD 9F
	cmp $FD.b		; C5 FD
	stz $344D.w		; 9C 4D 34
	inc $3F28.w,X		; FE 28 3F
	bit #$B90A.w		; 89 0A B9
	rol $49.b		; 26 49
	sta ($64.b)		; 92 64
	sta $9C27.w,Y		; 99 27 9C
	adc $4EC4.w,Y		; 79 C4 4E
	stz $08.b,X		; 74 08
	lda $A211.w		; AD 11 A2
	bit $46.b,X		; 34 46
	dey		; 88
	cmp ($1A.b),Y		; D1 1A
	and $44.b,S		; 23 44
	pla		; 68
	bit #$7702.w		; 89 02 77
	lda $369DCD.l		; AF CD 9D 36
	stz $F1.b,X		; 74 F1
	stz $C633.w,X		; 9E 33 C6
	sei		; 78
	cmp $AF561B.l		; CF 1B 56 AF
	eor $CD.b,S		; 43 CD
	asl $A2.b		; 06 A2
	jsl $852722.l		; 22 22 27 85
	sbc $082C.w,X		; FD 2C 08
	sed		; F8
	bvc -87.b		; 50 A9
	stz $95.b		; 64 95
	wai		; CB
	jmp $5CCBB5.l		; 5C B5 CB 5C
	lda $CB.b,X		; B5 CB
	jmp $9565AB.l		; 5C AB 65 95
	cmp ($F6.b,X)		; C1 F6
	ora ($46.b,S),Y		; 13 46
	pla		; 68
	cmp $4D14.w		; CD 14 4D
	sbc $CD7F37.l,X		; FF 37 7F CD
	eor $95A0.w,Y		; 59 A0 95
	eor $39FC.w,X		; 5D FC 39
	cop $0A.b		; 02 0A
	bcc  16.b		; 90 10
	rol A		; 2A
	rti		; 40

	eor ($87.b,X)		; 41 87
	ora $0684.w		; 0D 84 06
	lda ($1A.b)		; B2 1A
	lsr $A9.b		; 46 A9
	tax		; AA
	adc ($CF.b,S),Y		; 73 CF
	sbc $8EFECA.l		; EF CA FE 8E
	and ($D9.b)		; 32 D9
	asl $EB.b		; 06 EB
	xba		; EB
	sed		; F8
	bvs -95.b		; 70 A1
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	rti		; 40

	lda ($C0.b,S),Y		; B3 C0
	stx $A92D.w		; 8E 2D A9
	and ($C8.b,X)		; 21 C8
	and [$0E.b],Y		; 37 0E
	tas		; 1B
	and ($D8.b,X)		; 21 D8
	bit $0A.b,X		; 34 0A
	asl A		; 0A
	plp		; 28
	sta $A211.w		; 8D 11 A2
	bit $46.b,X		; 34 46
	dey		; 88
	bcc  39.b		; 90 27
	lda $E6A3.w,X		; BD A3 E6
	sta $FFE6A9.l,X		; 9F A9 E6 FF
	jsr ($A1FE.w,X)		; FC FE A1
	eor ($5B.b)		; 52 5B
	ora $53F9.w		; 0D F9 53
	tsx		; BA
	ldx $1F.b,Y		; B6 1F
	lda ($54.b)		; B2 54
.INDEX 8
	sep #$5B		; E2 5B
	asl $5319.w		; 0E 19 53
	phb		; 8B
	jmp ($803F.w)		; 6C 3F 80
	lda #$DBDD.w		; A9 DD DB
	asl $A9EC.w		; 0E EC A9
	lda [$6C.b],Y		; B7 6C
	rol $5389.w,X		; 3E 89 53
	adc ($D8.b)		; 72 D8
	sei		; 78
	lda $4E.b		; A5 4E
	and $B0.b,X		; 35 B0
	sbc $9353A1.l,X		; FF A1 53 93
	jmp ($503F.w)		; 6C 3F 50
	lda $F7.b		; A5 F7
	ldx $C3.b,Y		; B6 C3
	ror $EF52.w,X		; 7E 52 EF
	sbc $EC87.w		; ED 87 EC
	sty $BD.b,X		; 94 BD
	adc $E1B0.w		; 6D B0 E1
	sty $BD.b,X		; 94 BD
	adc $B0.b,X		; 75 B0
	inc $9702.w,X		; FE 02 97
	cmp $EC0EDB.l,X		; DF DB 0E EC
	lda $F8.b		; A5 F8
	asl $C3.b,X		; 16 C3
	inx		; E8
	sty $BF.b,X		; 94 BF
	asl $D8.b		; 06 D8
	sei		; 78
	lda $2F.b		; A5 2F
	asl A		; 0A
	cld		; D8
	adc $F8A5D0.l,X		; 7F D0 A5 F8
	ldx $C3.b,Y		; B6 C3
	sbc $0F.b,X		; F5 0F
	eor $E1.b,X		; 55 E1
	stp		; DB
	ora $EAF9.w		; 0D F9 EA
	lda $B09D.w,X		; BD 9D B0
	sbc $D593.w,X		; FD 93 D5
	tda		; 7B
	tsa		; 3B
	adc ($C3.b,X)		; 61 C3
	and $B557.w,X		; 3D 57 B5
	ldx $1F.b,Y		; B6 1F
	cpy #$7A.b		; C0 7A
	lda $3F6C6F.l		; AF 6F 6C 3F
	tay		; A8
	sbc $5E.b,X		; F5 5E
	ora $4C1F6E.l,X		; 1F 6E 1F 4C
	sbc $5E.b,X		; F5 5E
	dec $77D8.w		; CE D8 77
	cmp [$AA.b]		; C7 AA
	inc $76.b,X		; F6 76
	cmp $F8.b,S		; C3 F8
	cmp $F6F855.l		; CF 55 F8 F6
.ACCU 16
	rep #$68		; C2 68
	cmp $A319.w		; CD 19 A3
	bit $66.b,X		; 34 66
	sty $CDD1.w		; 8C D1 CD
	cmp $CD.b,X		; D5 CD
	cmp $9A.b,X		; D5 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A319.w		; CD 19 A3
	bit $73.b,X		; 34 73
	adc $9B.b,S		; 63 9B
	ora $FB8B.w,X		; 1D 8B FB
	ora [$F9.b],Y		; 17 F9
	trb $275A.w		; 1C 5A 27
	lda $EA4D.w,X		; BD 4D EA
	ror $8C.b		; 66 8C
	cmp ($D8.b),Y		; D1 D8
	rol $0E.b,X		; 36 0E
	eor ($41.b,X)		; 41 41
	sei		; 78
	ldy $4C4C.w,X		; BC 4C 4C
	rtl		; 6B

	beq  57.b		; F0 39
	rol $6507.w,X		; 3E 07 65
	ldy $D4CB.w		; AC CB D4
	sta [$A1.b],Y		; 97 A1
	rol $B4B4.w		; 2E B4 B4
	inc A		; 1A
	sbc [$24.b]		; E7 24
	cpx $4484.w		; EC 84 44
	mvp $A6,$C9		; 44 C9 A6
	ror $88.b,X		; 76 88
	and [$4B.b]		; 27 4B
	phk		; 4B
	asl $0A.b		; 06 0A
	xba		; EB
	tya		; 98
	stz $4444.w		; 9C 44 44
	mvp $42,$E0		; 44 E0 42
	sbc $CBED.w		; ED ED CB
	ora $C6D66A.l		; 0F 6A D6 C6
	dec $36.b		; C6 36
	and $AB.b,X		; 35 AB
	pha		; 48
	dey		; 88
	dey		; 88
	dey		; 88
	sta ($87.b),Y		; 91 87
	cmp ($87.b)		; D2 87
	stx $1F.b,Y		; 96 1F
	rtl		; 6B

	rtl		; 6B

	adc $61.b,S		; 63 61
	ora ($11.b),Y		; 11 11
	ora ($12.b),Y		; 11 12
	tya		; 98
	sei		; 78
	cmp $D1.b,S		; C3 D1
	asl $8800.w		; 0E 00 88
	dey		; 88
	dey		; 88
	bit #$0F91.w		; 89 91 0F
	ror $CC0B.w,X		; 7E 0B CC
	cpy $75BB.w		; CC BB 75
	ora ($11.b),Y		; 11 11
	ora ($12.b),Y		; 11 12
	cli		; 58
	tda		; 7B
	bvc  -7.b		; 50 F9
	bpl -11.b		; 10 F5
	eor $18.b,X		; 55 18
	ldx #$22.b		; A2 22
	jsl $617222.l		; 22 22 72 61
	sbc ($21.b)		; F2 21
	sbc $50F8C3.l		; EF C3 F8 50
	lda $A8B9.w,Y		; B9 B9 A8
	dey		; 88
	dey		; 88
	dey		; 88
	sta $F710.w,Y		; 99 10 F7
	cpx #$BC.b		; E0 BC
	cpy $B7CB.w		; CC CB B7
	eor ($11.b),Y		; 51 11
	ora ($11.b),Y		; 11 11
	and $87.b		; 25 87
	lda $0F.b,X		; B5 0F
	sta ($0F.b),Y		; 91 0F
	eor $51.b,X		; 55 51
	txa		; 8A
	jsl $272222.l		; 22 22 22 27
	lda $0F.b		; A5 0F
	cmp ($87.b,X)		; C1 87
	cmp $BF87.w		; CD 87 BF
	asl $8888.w		; 0E 88 88
	dey		; 88
	bit #$434F.w		; 89 4F 43
	cmp [$E8.b],Y		; D7 E8
	stz $A1.b,X		; 74 A1
	adc $5C88.w,X		; 7D 88 5C
	bmi -12.b		; 30 F4
	cmp $D6.b,S		; C3 D6
	cli		; 58
	jsl $712222.l		; 22 22 22 71
	ldy $377E.w,X		; BC 7E 37
	sta $D78DB7.l		; 8F B7 8D D7
	sbc $4B.b,S		; E3 4B
	sta ($BD.b),Y		; 91 BD
	iny		; C8
	txy		; 9B
	and ($81.b,S),Y		; 33 81
	adc $8D718C.l,X		; 7F 8C 71 8D
	lda ($6C.b,S),Y		; B3 6C
	inx		; E8
	ora $1241.w,X		; 1D 41 12
	cmp #$922C.w		; C9 2C 92
	lda $976B.w,Y		; B9 6B 97
	ora $36AC.w		; 0D AC 36
	ldx $F1.b,Y		; B6 F1
	ldx $F1.b,Y		; B6 F1
	ldy $2B2C.w		; AC 2C 2B
	pld		; 2B
	bmi -104.b		; 30 98
	eor $6CB3.w		; 4D B3 6C
	txs		; 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	dey		; 88
	bra   4.b		; 80 04
	cmp ($9A.b),Y		; D1 9A
	and ($44.b,S),Y		; 33 44
	mvp $2C,$00		; 44 00 2C
	pld		; 2B
	bmi -105.b		; 30 97
	lda #$389A.w		; A9 9A 38
	inc $41.b		; E6 41
	bcc  34.b		; 90 22
	and $E6.b		; 25 E6
	stz $BC.b		; 64 BC
	lsr $002F.w,X		; 5E 2F 00
	cop $24.b		; 02 24
	trb $88.b		; 14 88
	txa		; 8A
	ldx $41.b		; A6 41
	sty $005A.w		; 8C 5A 00
	tsb $48.b		; 04 48
	and #$1511.w		; 29 11 15
	jmp $1883.w		; 4C 83 18
	ldy $00.b,X		; B4 00
	php		; 08
	bcc  82.b		; 90 52
	jsl $7A902A.l		; 22 2A 90 7A
	bit $14.b		; 24 14
	dey		; 88
	txa		; 8A
	ldy $1E.b		; A4 1E
	bit #$2205.w		; 89 05 22
	jsl $A207A9.l		; 22 A9 07 A2
	eor ($48.b,X)		; 41 48
	dey		; 88
	tax		; AA
	eor ($E8.b,X)		; 41 E8
	bcc  82.b		; 90 52
	jsl $7A902A.l		; 22 2A 90 7A
	bit $14.b		; 24 14
	dey		; 88
	txa		; 8A
	ldy $1E.b		; A4 1E
	bit #$2205.w		; 89 05 22
	jsl $A207A9.l		; 22 A9 07 A2
	eor ($48.b,X)		; 41 48
	dey		; 88
	tax		; AA
	eor ($E8.b,X)		; 41 E8
	bcc  82.b		; 90 52
	jsl $7A902A.l		; 22 2A 90 7A
	bit $14.b		; 24 14
	dey		; 88
	txa		; 8A
	lda $F3.b		; A5 F3
	bit $00A4.w,X		; 3C A4 00
	ora ($20.b),Y		; 11 20
	ldy $44.b		; A4 44
	eor $2F.b,X		; 55 2F
	sta $33E5.w,Y		; 99 E5 33
	sta ($17.b,S),Y		; 93 17
	sty $AB36.w		; 8C 36 AB
	sta [$1C.b],Y		; 97 1C
	ldx $115F.w,Y		; BE 5F 11
	ora ($0B.b,S),Y		; 13 0B
	phy		; 5A
	adc ($30.b,X)		; 61 30
	tya		; 98
	adc ($75.b,S),Y		; 73 75
	adc ($75.b,S),Y		; 73 75
	stz $74.b,X		; 74 74
	ldy $74.b,X		; B4 74
	ldy $C992.w		; AC 92 C9
	bit $C992.w		; 2C 92 C9
	and ($64.b,S),Y		; 33 64
	cmp $4693.w		; CD 93 46
	eor $2C19.w		; 4D 19 2C
	sta ($C9.b)		; 92 C9
	bit $C992.w		; 2C 92 C9
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	rol $8C.b		; 26 8C
	cmp ($9A.b),Y		; D1 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A319.w		; CD 19 A3
	bit $66.b,X		; 34 66
	sty $9AD1.w		; 8C D1 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A319.w		; CD 19 A3
	bit $51.b,X		; 34 51
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	bit $2B2C.w		; 2C 2C 2B
	pld		; 2B
	and [$0C.b],Y		; 37 0C
	jsl $232323.l		; 22 23 23 23
	pld		; 2B
	pld		; 2B
	txa		; 8A
	phx		; DA
	tya		; 98
	tya		; 98
	cmp ($34.b),Y		; D1 34
	tsb $E126.w		; 0C 26 E1
	cmp ($31.b,S),Y		; D3 31
	sbc $62.b		; E5 62
	cmp $D2.b		; C5 D2
	jmp ($D346.w,X)		; 7C 46 D3
	txa		; 8A
	jmp.w [$AC76]		; DC 76 AC
	pld		; 2B
	and [$72.b],Y		; 37 72
	eor ($D6.b,S),Y		; 53 D6
	ora $0774.w,Y		; 19 74 07
	jmp ($226C.w,X)		; 7C 6C 22
	tsa		; 3B
	adc $D1F458.l		; 6F 58 F4 D1
	sbc $D1829D.l		; EF 9D 82 D1
	pla		; 68
	cmp [$3B.b],Y		; D7 3B
	cmp ($48.b,S),Y		; D3 48
	cmp $3C.b,X		; D5 3C
	.db $42, $56		; 42 56
	cmp ($69.b,S),Y		; D3 69
	cmp [$7B.b],Y		; D7 7B
	cmp [$49.b],Y		; D7 49
	cmp $7C.b,X		; D5 7C
	lsr $53.b		; 46 53
	mvp $35,$CE		; 44 CE 35
	jmp $9126.w		; 4C 26 91
	ldy $4A.b		; A4 4A
	lsr A		; 4A
	inx		; E8
	lda $ABCE.w,Y		; B9 CE AB
	sta $D2.b		; 85 D2
	stz $99.b,X		; 74 99
	eor $604F.w,Y		; 59 4F 60
	cmp $36.b		; C5 36
	eor $4C93.w		; 4D 93 4C
	cmp ($32.b,S),Y		; D3 32
	cpy $D8B7.w		; CC B7 D8
	adc ($5D.b),Y		; 71 5D
	sta [$65.b],Y		; 97 65
	cmp ($74.b,S),Y		; D3 74
	jmp.w [$2CB7]		; DC B7 2C
	inc $0C.b,X		; F6 0C
	sbc $FC.b,S		; E3 FC
	sta $501FFB.l		; 8F FB 1F 50
	plx		; FA
	sta [$62.b]		; 87 62
	ror $2F.b,X		; 76 2F
	bcs -25.b		; B0 E7
	and $D9FFE4.l,X		; 3F E4 FF D9
	plx		; FA
	sta $177BD4.l		; 8F D4 7B 17
	lda ($00.b),Y		; B1 00
	bmi -97.b		; 30 9F
	pei ($6F.b)		; D4 6F
	eor $D8E9.w		; 4D E9 D8
	sta $8E68.w,Y		; 99 68 8E
	ora [$FA.b],Y		; 17 FA
	sta $BDEB.w,X		; 9D EB BD
	tda		; 7B
	ora [$2D.b],Y		; 17 2D
	and [$25.b]		; 27 25
	stx $8BEA.w		; 8E EA 8B
	cli		; 58
	inc $B1.b,X		; F6 B1
	cpx $CA.b		; E4 CA
	rol A		; 2A
	mvp $7F,$6B		; 44 6B 7F
	lda #$71C7.w		; A9 C7 71
	jmp.w [$ABA6]		; DC A6 AB
	cmp $E3.b		; C5 E3
	lda $A0B33B.l		; AF 3B B3 A0
	ror $591E.w		; 6E 1E 59
	phx		; DA
	ora $2F2D.w		; 0D 2D 2F
	and ($FA.b),Y		; 31 FA
	stx $8A43.w		; 8E 43 8A
	sbc [$AD.b],Y		; F7 AD
	pea $4444.w		; F4 44 44
	mvp $44,$44		; 44 44 44
	mvp $4B,$44		; 44 44 4B
	bit $B2.b		; 24 B2
	phk		; 4B
	bit $11.b		; 24 11
	brk $0B.b		; 00 0B
	bit $B2.b		; 24 B2
	phk		; 4B
	bit $11.b		; 24 11
	jsr $0AAA.w		; 20 AA 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	php		; 08
	rol A		; 2A
	.db $82, $82, $82		; 82 82 82
	.db $82, $80, $00		; 82 80 00
	txs		; 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A319.w		; CD 19 A3
	bit $66.b,X		; 34 66
	sty $9AD1.w		; 8C D1 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A319.w		; CD 19 A3
	bit $66.b,X		; 34 66
	sty $4AD1.w		; 8C D1 4A
	sbc $C3.b		; E5 C3
	rtl		; 6B

	ora $BCAD.w		; 0D AD BC
	adc $6EBC.w		; 6D BC 6E
	stx $47.b		; 86 47
	eor $21.b,S		; 43 21
	pld		; 2B
	bmi -104.b		; 30 98
	eor $6CB3.w		; 4D B3 6C
	inx		; E8
	ora $2D01.w,X		; 1D 01 2D
	adc ($D6.b,X)		; 61 D6
	cpy $C6DB.w		; CC DB C6
	stp		; DB
	dec $DB.b		; C6 DB
	dec $E8.b		; C6 E8
	stz $74.b		; 64 74
	and ($12.b)		; 32 12
	cmp ($AC.b),Y		; D1 AC
	adc $669B.w		; 6D 9B 66
	cmp $3AD0.w,Y		; D9 D0 3A
	cop $22.b		; 02 22
	rol $E5.b		; 26 E5
	lda $E27D5F.l		; AF 5F 7D E2
	sbc $331F.w,X		; FD 1F 33
	sty $8988.w		; 8C 88 89
	clv		; B8
	stz $0E.b,X		; 74 0E
	eor ($A8.b),Y		; 51 A8
	adc ($29.b,X)		; 61 29
	jsl $4F5350.l		; 22 50 53 4F
	inc A		; 1A
	asl $FC.b,X		; 16 FC
	dec A		; 3A
	jsl $202222.l		; 22 22 22 20
	ora $F8.b		; 05 F8
	tda		; 7B
	bit $CFCF.w		; 2C CF CF
	ldx $1D.b		; A6 1D
	ora ($11.b),Y		; 11 11
	ora ($12.b),Y		; 11 12
	tsb $6C9A.w		; 0C 9A 6C
	jmp.w [$34DE]		; DC DE 34
	rol $7A7E.w		; 2E 7E 7A
	jsl $242222.l		; 22 22 22 24
	ora $3E4D.w,Y		; 19 4D 3E
	tsb $2D.b		; 04 2D
	tay		; A8
	stz $44.b,X		; 74 44
	mvp $48,$44		; 44 44 48
	and ($47.b,S),Y		; 33 47
	eor [$6B.b]		; 47 6B
	ror A		; 6A
	cli		; 58
	stz $44.b,X		; 74 44
	mvp $40,$44		; 44 44 40
	ora #$ED21.w		; 09 21 ED
	phy		; 5A
	sbc ($21.b),Y		; F1 21
	jmp ($7478.w,X)		; 7C 78 74
	mvp $44,$44		; 44 44 44
	rti		; 40

	and $1E46.w		; 2D 46 1E
	tax		; AA
	ldy $B4.b,X		; B4 B4
	lda $A343.w		; AD 43 A3
	adc #$1111.w		; 69 11 11
	bpl -50.b		; 10 CE
	jsl $A3A301.l		; 22 01 A3 A3
	lda $B5.b,X		; B5 B5
	bit $9C3B.w		; 2C 3B 9C
	cmp $11.b		; C5 11
	ora ($12.b),Y		; 11 12
	sbc ($74.b),Y		; F1 74
	ldy $48.b,X		; B4 48
	eor $41E9BF.l,X		; 5F BF E9 41
	plp		; 28
	dey		; 88
	dey		; 88
	dey		; 88
	dey		; 88
	dey		; 88
	sta [$A9.b],Y		; 97 A9
	sbc [$52.b]		; E7 52
	cmp ($D2.b,S),Y		; D3 D2
	lda $11.b		; A5 11
	ora ($F1.b)		; 12 F1
	dec $1111.w		; CE 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($2C.b),Y		; 11 2C
	sta ($C9.b)		; 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	bit $C992.w		; 2C 92 C9
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	php		; 08
	cop $B6.b		; 02 B6
	sbc #$BB74.w		; E9 74 BB
	stz $82.b,X		; 74 82
	ldx $4B97.w		; AE 97 4B
	lda $DB.b		; A5 DB
	ldy $1C.b		; A4 1C
	dey		; 88
	ldy $14.b		; A4 14
	dey		; 88
	txa		; 8A
	eor ($D4.b,X)		; 41 D4
	sty $94.b,X		; 94 94
	cmp ($41.b)		; D2 41
	mvn $94,$94		; 54 94 94
	sty $D2.b,X		; 94 D2
	eor ($D1.b,X)		; 41 D1
	jsl $152446.l		; 22 46 24 15
	ora ($24.b)		; 12 24
	pha		; 48
	cpy $80.b		; C4 80
	sta ($11.b),Y		; 91 11
	ora ($5F.b,S),Y		; 13 5F
	sta ($AF.b,X)		; 81 AF
	cpy #$C8.b		; C0 C8
	inx		; E8
	stz $74.b		; 64 74
	ora ($11.b),Y		; 11 11
	and $CD.b,X		; 35 CD
	adc ($20.b,S),Y		; 73 20
	iny		; C8
	ora ($11.b),Y		; 11 11
	and ($79.b)		; 32 79
	cld		; D8
	sta $DD4C.w,X		; 9D 4C DD
	eor $44E8.w,Y		; 59 E8 44
	mvp $31,$C9		; 44 C9 31
	tsb $72D2.w		; 0C D2 72
	cmp #$922C.w		; C9 2C 92
	cmp #$922C.w		; C9 2C 92
	cmp #$7533.w		; C9 33 75
	adc ($75.b,S),Y		; 73 75
	adc [$DC.b],Y		; 77 DC
	xce		; FB
	bit $B2.b		; 24 B2
	phk		; 4B
	bit $B2.b		; 24 B2
	phk		; 4B
	bit $CD.b		; 24 CD
	sta ($36.b,S),Y		; 93 36
	eor $85F4.w		; 4D F4 85
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $05.b		; 05 05
	ora $04.b		; 05 04
	clc		; 18
	sty $9AD1.w		; 8C D1 9A
	bit $18.b		; 24 18
	sty $9AD1.w		; 8C D1 9A
	bit $18.b		; 24 18
	txa		; 8A
	bit $1A.b		; 24 1A
	txa		; 8A
	bit $1A.b		; 24 1A
	txa		; 8A
	bit $1A.b		; 24 1A
	txa		; 8A
	bit $1A.b		; 24 1A
	txa		; 8A
	bit $1A.b		; 24 1A
	txa		; 8A
	bit $19.b		; 24 19
	rtl		; 6B

	ora $62EA.w		; 0D EA 62
	bvc  65.b		; 50 41
	stx $9B.b,Y		; 96 9B
	dex		; CA
	and $D8.b		; 25 D8
	.db $62, $E8, $15		; 62 E8 15
	php		; 08
	ora ($74.b,X)		; 01 74
	rol $4B97.w		; 2E 97 4B
	lda $2A.b,X		; B5 2A
	dey		; 88
	tay		; A8
	bra   8.b		; 80 08
	asl $7A.b		; 06 7A
	php		; 08
	dey		; 88
	tax		; AA
	and $C3F4.w,Y		; 39 F4 C3
	trb $81.b		; 14 81
	sei		; 78
	rti		; 40

	and $1452.w		; 2D 52 14
	sty $94.b,X		; 94 94
	dec $1B55.w,X		; DE 55 1B
	eor ($86.b),Y		; 51 86
	jsl $01C204.l		; 22 04 C2 01
	sta $8910.w		; 8D 10 89
	ora ($33.b)		; 12 33
	rol A		; 2A
	stx $0531.w		; 8E 31 05
	cmp ($3D.b),Y		; D1 3D
	and [$AE.b],Y		; 37 AE
	stx $88.b,Y		; 96 88
	and ($86.b)		; 32 86
	sta $13.b,X		; 95 13
	jsl $4FF28C.l		; 22 8C F2 4F
	cpx $9FF5.w		; EC F5 9F
	xba		; EB
	and $872DC5.l,X		; 3F C5 2D 87
	sbc $9F.b,X		; F5 9F
	sed		; F8
	adc [$56.b],Y		; 77 56
	cmp $FA.b,S		; C3 FA
	cmp $B6C46D.l		; CF 6D C4 B6
	asl $F831.w,X		; 1E 31 F8
	jmp.w [$615B]		; DC 5B 61
	sbc $1F.b,S		; E3 1F
	sta $DBDD.w,Y		; 99 DD DB
	ora $9BF504.l		; 0F 04 F5 9B
	ror $C3.b,X		; 76 C3
	cmp ($36.b,X)		; C1 36
	txy		; 9B
	stx $C3.b,Y		; 96 C3
	cmp ($3D.b,X)		; C1 3D
	lda [$1A.b]		; A7 1A
	cld		; D8
	adc ($0F.b),Y		; 71 0F
	eor $B6C9.w,Y		; 59 C9 B6
	trb $6943.w		; 1C 43 69
	sbc [$B6.b],Y		; F7 B6
	cmp $88.b,S		; C3 88
	tda		; 7B
	lsr $D8FE.w		; 4E FE D8
	adc $2FFE09.l,X		; 7F 09 FE 2F
	tad		; 5B
	jmp ($843F.w)		; 6C 3F 84
	sbc $5BD7C3.l,X		; FF C3 D7 5B
	ora $B73DE1.l		; 0F E1 3D B7
	cmp $CC0EDB.l,X		; DF DB 0E CC
	sbc $9F.b,X		; F5 9F
	sta ($6C.b,X)		; 81 6C
	tsa		; 3B
	and ($69.b,S),Y		; 33 69
	sed		; F8
	rol $C3.b,X		; 36 C3
	lda ($3D.b,S),Y		; B3 3D
	lda [$85.b]		; A7 85
	jmp ($133B.w)		; 6C 3B 13
	dec $7E.b,X		; D6 7E
	and $ECB0.w		; 2D B0 EC
	eor $87A7.w		; 4D A7 87
	jmp ($133B.w)		; 6C 3B 13
	phx		; DA
	tda		; 7B
	tsa		; 3B
	adc ($D6.b,X)		; 61 D6
	stz $DAB3.w,X		; 9E B3 DA
	stp		; DB
	asl $DAB4.w		; 0E B4 DA
	tda		; 7B
	tda		; 7B
	adc ($D6.b,X)		; 61 D6
	stz $F1D3.w,X		; 9E D3 F1
	sbc $EA87.w		; ED 87 EA
	stz $E4E7.w		; 9C E7 E4
	stp		; DB
	ora $4E3AD5.l		; 0F D5 3A 4E
	adc $B0.b,X		; 75 B0
	cmp $39.b		; C5 39
	cmp $866DFC.l		; CF FC 6D 86
	and #$7BD2.w		; 29 D2 7B
	tyx		; BB
	adc ($FA.b,X)		; 61 FA
	ora $5BE25D.l,X		; 1F 5D E2 5B
	tsb $D6DC.w		; 0C DC D6
	phd		; 0B
	nop		; EA
	cmp $2EFB45.l,X		; DF 45 FB 2E
	pla		; 68
	dey		; 88
	bit #$FED5.w		; 89 D5 FE
	adc $FBB647.l,X		; 7F 47 B6 FB
	and $A22820.l,X		; 3F 20 28 A2
	and ($A6.b),Y		; 31 A6
	txs		; 9A
	tax		; AA
	sbc $61.b,S		; E3 61
	stx $F9.b		; 86 F9
	lda $85.b,X		; B5 85
	tsb $4A.b		; 04 4A
	lsr A		; 4A
	stx $1835.w		; 8E 35 18
	eor $2FE79B.l		; 4F 9B E7 2F
	lsr $FA.b,X		; 56 FA
	and $177DD9.l		; 2F D9 7D 17
	cpx $F5AB.w		; EC AB F5
	sty $EA.b,X		; 94 EA
	sbc $DBA33F.l,X		; FF 3F A3 DB
	adc $919F.w,X		; 7D 9F 91
	inx		; E8
	inc $DF.b,X		; F6 DF
	adc [$E4.b]		; 67 E4
	and [$D6.b]		; 27 D6
	sbc $3A8B.w,Y		; F9 8B 3A
	lda $D55939.l,X		; BF 39 59 D5
	lda ($C4.b)		; B2 C4
	stz $F984.w,X		; 9E 84 F9
	dec $4F72.w,X		; DE 72 4F
	.db $42, $58		; 42 58
	rol A		; 2A
	inc $E6.b		; E6 E6
	bcc 106.b		; 90 6A
	rol $69.b		; 26 69
	ora [$46.b]		; 07 46
	bit $50.b,X		; 34 50
	eor ($F1.b,X)		; 41 F1
	plp		; 28
	jsr $9230.w		; 20 30 92
	eor #$B565.w		; 49 65 B5
	ror A		; 6A
	cpx $BC3F.w		; EC 3F BC
	lda $340D.w,X		; BD 0D 34
	cmp ($12.b)		; D2 12
	stx $8B.b,Y		; 96 8B
	lda $D3.b		; A5 D3
	dec $AF6E.w,X		; DE 6E AF
	ora ($10.b,S),Y		; 13 10
	and ($C2.b,X)		; 21 C2
	sta $BF.b		; 85 BF
	jmp ($F883.w,X)		; 7C 83 F8
	eor $F2.b		; 45 F2
	adc $9CFE.w,Y		; 79 FE 9C
	beq  86.b		; F0 56
	jmp ($B3D9.w)		; 6C D9 B3
	adc $CF69C2.l,X		; 7F C2 69 CF
	lda [$BA.b]		; A7 BA
	stz $9C9C.w		; 9C 9C 9C
	cmp $3693.w		; CD 93 36
	eor $A07BF8.l		; 4F F8 7B A0
	tsb $44.b		; 04 44
	brk $DA.b		; 00 DA
	mvp $44,$44		; 44 44 44
	mvp $28,$00		; 44 00 28
	pld		; 2B
	pld		; 2B
	bit $0D.b,X		; 34 0D
	cop $B8.b		; 02 B8
	sty $14.b,X		; 94 14
	trb $68.b		; 14 68
	eor ($A1.b),Y		; 51 A1
	lsr $85.b		; 46 85
	inc A		; 1A
	trb $66.b		; 14 66
	asl $B2CB.w		; 0E CB B2
	sbc $38.b,S		; E3 38
	dec $0307.w		; CE 07 03
	sta ($C0.b,X)		; 81 C0
	rti		; 40

	sta $DA70.w,X		; 9D 70 DA
	ora $E8.b,X		; 15 E8
	eor [$99.b],Y		; 57 99
	lsr $7965.w,X		; 5E 65 79
	ora $F9.b,X		; 15 F9
	lda $F2.b,X		; B5 F2
	php		; 08
	ora ($60.b,S),Y		; 13 60
	cmp ($05.b)		; D2 05
	sec		; 38
	lda [$40.b]		; A7 40
	dec $AE.b,X		; D6 AE
	ora $E20C.w		; 0D 0C E2
	sta ($0F.b)		; 92 0F
	ldy $A4.b		; A4 A4
	lda [$D1.b]		; A7 D1
	ror $BFCA.w,X		; 7E CA BF
	eor $DDF3.w,Y		; 59 F3 DD
	xce		; FB
	sbc [$BF.b]		; E7 BF
	eor $7BF4.w,Y		; 59 F4 7B
	adc $13F2B3.l		; 6F B3 F2 13
	xba		; EB
	jmp ($3FCF.w,X)		; 7C CF 3F
	sbc $6F.b		; E5 6F
	sbc $7FBE.w,Y		; F9 BE 7F
	dex		; CA
	plx		; FA
	cmp $F4BA32.l,X		; DF 32 BA F4
	jmp ($1782.w)		; 6C 82 17
	inc $B5AA.w		; EE AA B5
	txs		; 9A
	bit $58.b,X		; 34 58
	cli		; 58
	and [$DD.b]		; 27 DD
	sbc ($22.b,X)		; E1 22
	adc $FDEE.w,Y		; 79 EE FD
	sbc ($DF.b,S),Y		; F3 DF
	ldy $9EC1.w		; AC C1 9E
	adc $F3DFCA.l,X		; 7F CA DF F3
	jmp ($95FF.w,X)		; 7C FF 95
	sbc $BE.b,X		; F5 BE
	.db $62, $22, $25		; 62 22 25
	stx $7D.b,Y		; 96 7D
	wai		; CB
	pld		; 2B
	sta [$C3.b]		; 87 C3
	ora $D35455.l		; 0F 55 54 D3
	adc ($F7.b,X)		; 61 F7
	sec		; 38
	eor $95.b,X		; 55 95
	tya		; 98
	jmp $4525.w		; 4C 25 45
	bit $03.b		; 24 03
	bit $D3.b		; 24 D3
	ror $CD.b		; 66 CD
	lda $3F.b,S		; A3 3F
	jsr ($D1A7.w,X)		; FC A7 D1
	sta $227846.l,X		; 9F 46 78 22
	adc $36.b,S		; 63 36
	eor $3F19.w		; 4D 19 3F
	sbc $EE.b		; E5 EE
	ldy $64.b,X		; B4 64
	cmp ($92.b),Y		; D1 92
	adc ($72.b)		; 72 72
	sbc $EB.b,X		; F5 EB
	lda [$64.b],Y		; B7 64
	bcc -125.b		; 90 83
	adc $084917.l		; 6F 17 49 08
	dec A		; 3A
	dec $C5.b		; C6 C5
	ror $B5DD.w		; 6E DD B5
	ror A		; 6A
	eor $9064.w,Y		; 59 64 90
	bit $C992.w		; 2C 92 C9
	ora ($E9.b)		; 12 E9
	pla		; 68
	sty $90.b,X		; 94 90
	ora $5967.w		; 0D 67 59
	dec $76.b,X		; D6 76
	sta [$7C.b],Y		; 97 7C
	jmp.w [$5D76]		; DC 76 5D
	sta ($04.b)		; 92 04
	xba		; EB
	ldx $BA.b		; A6 BA
	plb		; AB
	cmp $5C.b,S		; C3 5C
	rol $45.b,X		; 36 45
	adc [$2B.b],Y		; 77 2B
	cmp $BCAE.w,Y		; D9 AE BC
	.db $82, $E1, $88		; 82 E1 88
	eor ($D6.b,X)		; 41 D6
	rts		; 60

	lda ($03.b,S),Y		; B3 03
	lda ($E2.b)		; B2 E2
	and $AA6A.w,X		; 3D 6A AA
	bcc  39.b		; 90 27
	lda ($B3.b,X)		; A1 B3
	lda ($B3.b,X)		; A1 B3
	lsr $77CD.w,X		; 5E CD 77
	pld		; 2B
	iny		; C8
	ldx $2009.w		; AE 09 20
	bit $F1.b		; 24 F1
	php		; 08
	ora ($A4.b),Y		; 11 A4
	sta ($3A.b,X)		; 81 3A
	pha		; 48
	ora $98.b,X		; 15 98
	mvp $11,$89		; 44 89 11
	tya		; 98
	tya		; 98
	tya		; 98
	txs		; 9A
	and ($46.b,S),Y		; 33 46
	pla		; 68
	cmp $A219.w		; CD 19 A2
	brk $22.b		; 00 22
	jsr $8802.w		; 20 02 88
	dey		; 88
	dey		; 88
	dey		; 88
	and $B5.b,X		; 35 B5
	lda $B5.b,X		; B5 B5
	lda $B5.b,X		; B5 B5
	cpx #$AF.b		; E0 AF
	cmp [$AC.b]		; C7 AC
	sta ($37.b,X)		; 81 37
	ora $81.b,S		; 03 81
	inc $3B.b		; E6 3B
	rol $B2CB.w		; 2E CB B2
	cpx $24BB.w		; EC BB 24
	ora #$AAB5.w		; 09 B5 AA
	lda $0369.w		; AD 69 03
	ora ($37.b)		; 12 37
	cli		; 58
	bit $4C81.w		; 2C 81 4C
	sbc ($93.b)		; F2 93
	eor $11.b,X		; 55 11
	ora ($12.b),Y		; 11 12
	adc ($71.b)		; 72 71
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora ($73.b,S),Y		; 13 73
	ora [$72.b],Y		; 17 72
	cmp ($22.b)		; D2 22
	jsl $84E126.l		; 22 26 E1 84
	pei ($FE.b)		; D4 FE
	eor $FB4F.w,X		; 5D 4F FB
	sbc ($BE.b,S),Y		; F3 BE
	stp		; DB
	ldx $E9.b		; A6 E9
	tsx		; BA
	ror $A79B.w		; 6E 9B A7
	inc $1B.b		; E6 1B
	rep #$04		; C2 04
	ora $4D37.w,X		; 1D 37 4D
	cmp ($74.b,S),Y		; D3 74
	cmp $4D37.w,X		; DD 37 4D
	cmp ($74.b,S),Y		; D3 74
	iny		; C8
	ora ($55.b,S),Y		; 13 55
	jsr $547D.w		; 20 7D 54
	bra -114.b		; 80 8E
	lda ($12.b,X)		; A1 12
	sbc #$B374.w		; E9 74 B3
	jmp ($A8A8.w)		; 6C A8 A8
	tax		; AA
	sbc $6A57.w		; ED 57 6A
	tyx		; BB
	eor $DA.b,X		; 55 DA
	lda ($88.b),Y		; B1 88
	and #$1211.w		; 29 11 12
	ply		; 7A
	brk $01.b		; 00 01
	ora ($12.b),Y		; 11 12
	adc ($EC.b),Y		; 71 EC
	asl $ECC1.w,X		; 1E C1 EC
	asl $ECC1.w,X		; 1E C1 EC
	asl $ECC1.w,X		; 1E C1 EC
	asl $81C0.w,X		; 1E C0 81
	dec A		; 3A
	xce		; FB
	tax		; AA
	xce		; FB
	wai		; CB
	rol $DD7B.w,X		; 3E 7B DD
	lda $DDDB.w,X		; BD DB DD
	lda $DDDB.w,X		; BD DB DD
.INDEX 8
	sep #$10		; E2 10
	and $CE.b		; 25 CE
	sta $AC82.w,X		; 9D 82 AC
	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	ldy #$81.b		; A0 81
	and $70.b		; 25 70
	sec		; 38
	asl $BE93.w,X		; 1E 93 BE
	ror $2E3B.w		; 6E 3B 2E
	cop $04.b		; 02 04
	jsr ($FC7A.w,X)		; FC 7A FC
	ply		; 7A
	beq  86.b		; F0 56
	cld		; D8
	dec $D6.b,X		; D6 D6
	inc $843B.w		; EE 3B 84
	ora #$2EBB.w		; 09 BB 2E
	wai		; CB
	adc ($C8.b),Y		; 71 C8
	jmp ($BB6E.w)		; 6C 6E BB
	lsr $01D1.w		; 4E D1 01
	bit $A4.b		; 24 A4
	tsb $5E.b		; 04 5E
	and ($02.b,X)		; 21 02
	and ($9E.b,S),Y		; 33 9E
	eor $A3A57B.l,X		; 5F 7B A5 A3
	lda [$C4.b]		; A7 C4
	cmp ($E2.b,S),Y		; D3 E2
	adc #$34F1.w		; 69 F1 34
	xce		; FB
	cmp $D3F3A9.l		; CF A9 F3 D3
	wai		; CB
	bit $8D.b,X		; 34 8D
	and ($4C.b,S),Y		; 33 4C
	cmp ($3C.b,S),Y		; D3 3C
	cmp $CC.b,S		; C3 CC
	ora $3836.w,Y		; 19 36 38
	bit $3EAE.w,X		; 3C AE 3E
	lda [$1D.b]		; A7 1D
	sbc [$6E.b],Y		; F7 6E
	txy		; 9B
	ldx $E9.b		; A6 E9
	dec $44.b,X		; D6 44
	ldy #$A0.b		; A0 A0
	ldy #$82.b		; A0 82
	sta $4D37.w,X		; 9D 37 4D
	sta $C8.b,S		; 83 C8
	ora ($75.b,S),Y		; 13 75
	lda [$D4.b]		; A7 D4
	stz $9C.b,X		; 74 9C
	cmp [$31.b]		; C7 31
	cmp ($55.b)		; D2 55
	jsr $EC14.w		; 20 14 EC
	jmp.w [$6EB3]		; DC B3 6E
	dec $ED9B.w		; CE 9B ED
	ldx $D833.w,Y		; BE 33 D8
	and $D883.w,X		; 3D 83 D8
	.db $62, $9B, $A2		; 62 9B A2
	tsb $34.b		; 04 34
	bit $374E.w,X		; 3C 4E 37
	bit #$A3C6.w		; 89 C6 A3
	sta $2347.w		; 8D 47 23
	phb		; 8B
	wai		; CB
	cpx #$F4.b		; E0 F4
	adc $7FFD9F.l,X		; 7F 9F FD 7F
	txy		; 9B
	rti		; 40

	bne  39.b		; D0 27
	and [$2E.b]		; 27 2E
	clc		; 18
	stx $21.b		; 86 21
	dey		; 88
	and $D883.w,X		; 3D 83 D8
	and $E383.w,X		; 3D 83 E3
	tda		; 7B
	sta $CBB5.w,Y		; 99 B5 CB
	adc [$1E.b]		; 67 1E
	dec $0239.w		; CE 39 02
	adc $6FF776.l		; 6F 76 F7 6F
	ror $F7.b,X		; 76 F7
	adc $3B3B77.l		; 6F 77 3B 3B
	dec A		; 3A
	rti		; 40

	sta $B072.w,X		; 9D 72 B0
	eor $2C03.w,Y		; 59 03 2C
	inc A		; 1A
	rti		; 40

	nop		; EA
	jsl $882800.l		; 22 00 28 88
	dey		; 88
	dey		; 88
	bra   2.b		; 80 02
	jsl $882800.l		; 22 00 28 88
	dey		; 88
	dey		; 88
	stx $0E.b		; 86 0E
	stz $9B0E.w,X		; 9E 0E 9B
.ACCU 8
.INDEX 8
	sep #$32		; E2 32
	lda $5B6E.w,Y		; B9 6E 5B
	stx $E5.b,Y		; 96 E5
	bcc  38.b		; 90 26
	sbc $B9.b		; E5 B9
	ror $965B.w		; 6E 5B 96
	sbc $B9.b		; E5 B9
	ror $965B.w		; 6E 5B 96
	rti		; 40

	stz $18CC.w		; 9C CC 18
	rti		; 40

	lda $F3.b		; A5 F3
	jsr $60C6.w		; 20 C6 60
	cmp ($05.b)		; D2 05
	and $310699.l		; 2F 99 06 31
	ora ($3D.b,X)		; 01 3D
	lda ($13.b,X)		; A1 13
	ora #$84.b		; 09 84
	adc $8B16.w		; 6D 16 8B
	eor $AC.b		; 45 AC
	rol $B0.b,X		; 36 B0
	phx		; DA
	cmp $6B.b,S		; C3 6B
	ora $25AC.w		; 0D AC 25
	bvs  -8.b		; 70 F8
	bvs -43.b		; 70 D5
	eor $34.b,X		; 55 34
	dec $20.b		; C6 20
	ora $95.b,X		; 15 95
	tya		; 98
	lsr A		; 4A
	txa		; 8A
	pha		; 48
	bra  14.b		; 80 0E
	ora [$03.b]		; 07 03
	sta ($C0.b,X)		; 81 C0
	cpx #$70.b		; E0 70
	sec		; 38
	trb $0604.w		; 1C 04 06
	jmp ($181A.w)		; 6C 1A 18
	inc $41.b		; E6 41
	ora [$DE.b]		; 07 DE
	and $379817.l		; 2F 17 98 37
	sta $21F6.w,X		; 9D F6 21
	eor $44443D.l,X		; 5F 3D 44 44
	eor [$3D.b]		; 47 3D
	sbc $E5D7.w,X		; FD D7 E5
	asl $1C.b		; 06 1C
	bit $E717.w		; 2C 17 E7
	xce		; FB
	adc $220C5D.l,X		; 7F 5D 0C 22
	jsl $DEF223.l		; 22 23 F2 DE
	cpx $80.b		; E4 80
	eor $60.b,S		; 43 60
	cmp $CB951D.l		; CF 1D 95 CB
	sbc #$74.b		; E9 74
	iny		; C8
	ora ($60.b,S),Y		; 13 60
	cpy $2DB7.w		; CC B7 2D
	wai		; CB
	adc ($C8.b)		; 72 C8
	ora ($72.b,S),Y		; 13 72
	jmp.w [$2DB7]		; DC B7 2D
	sta ($F2.b),Y		; 91 F2
	ora $66.b,X		; 15 66
	pha		; 48
	ora ($72.b,S),Y		; 13 72
	jmp.w [$2DB7]		; DC B7 2D
	sta ($F2.b),Y		; 91 F2
	ora $B1.b,X		; 15 B1
	bcs -128.b		; B0 80
	sta ($D1.b)		; 92 D1
	ora ($15.b,X)		; 01 15
	ldx #$05.b		; A2 05
	sbc $1A.b,S		; E3 1A
	adc #$AA.b		; 69 AA
	ldy $6B38.w		; AC 38 6B
	ldy $2200.w		; AC 00 22
	eor ($54.b)		; 52 54
	adc ($2B.b,X)		; 61 2B
	tas		; 1B
	ldy $84EF.w,X		; BC EF 84
	cmp $877B.w,X		; DD 7B 87
	ora $81.b,S		; 03 81
	cpy #$E0.b		; C0 E0
	tay		; A8
	bit #$12.b		; 89 12
	.db $82, $02, $C7		; 82 02 C7
	ora $81.b,S		; 03 81
	cpy #$EA.b		; C0 EA
	tsx		; BA
	tax		; AA
	tax		; AA
	rti		; 40

	adc [$90.b]		; 67 90
	rti		; 40

	sta $04E2.w,X		; 9D E2 04
	ror $CEC3.w,X		; 7E C3 CE
	xce		; FB
	tsb $7E08.w		; 0C 08 7E
	xba		; EB
	stz $8888.w,X		; 9E 88 88
	bit #$FF.b		; 89 FF
	and [$EB.b],Y		; 37 EB
	ldx $B67F.w,Y		; BE 7F B6
	cmp ($78.b,X)		; C1 78
	bvs -65.b		; 70 BF
	eor #$EE.b		; 49 EE
	eor $898896.l,X		; 5F 96 88 89
	sty $5A.b		; 84 5A
	tax		; AA
	cmp $86.b,S		; C3 86
	wai		; CB
	and $40925E.l		; 2F 5E 92 40
	tsb $A8.b		; 04 A8
.INDEX 16
	rep #$58		; C2 58
	lsr $2024.w,X		; 5E 24 20
	.db $42, $8A		; 42 8A
	bmi -31.b		; 30 E1
	jsr $0CFA.w		; 20 FA 0C
	bit $15.b		; 24 15
	ror $EC.b,X		; 76 EC
	sbc ($AA.b,S),Y		; F3 AA
	lda $8FFDF8.l		; AF F8 FD 8F
	ldx $D285.w		; AE 85 D2
	adc ($11.b),Y		; 71 11
	ora $33F7A4.l,X		; 1F A4 F7 33
	dec $7EC1.w		; CE C1 7E
	stp		; DB
	sbc $89BF.w		; ED BF 89
	stz $4444.w		; 9C 44 44
	adc $EED3.w,X		; 7D D3 EE
	sta $47407C.l,X		; 9F 7C 40 47
	bit $ADF6.w,X		; 3C F6 AD
	phk		; 4B
	and #$06.b		; 29 06
	dec $255A.w		; CE 5A 25
	jsr $922E.w		; 20 2E 92
	eor #$65.b		; 49 65
	lda $6A.b,X		; B5 6A
	sbc $D0DB.w		; ED DB D0
	eor $B2DB.w		; 4D DB B2
	ora ($96.b)		; 12 96
	phb		; 8B
	lda $E2.b		; A5 E2
	sbc ($78.b),Y		; F1 78
	tsx		; BA
	rti		; 40

	jsl $FDF47F.l		; 22 7F F4 FD
	adc [$FC.b],Y		; 77 FC
	ror $AAC2.w,X		; 7E C2 AA
	cmp $AFDB3D.l		; CF 3D DB AF
	wai		; CB
	tda		; 7B
	sta [$E9.b],Y		; 97 E9
	jsl $D3E524.l		; 22 24 E5 D3
	stp		; DB
	adc $04B6.w,X		; 7D B6 04
	adc $EED3.w,X		; 7D D3 EE
	sta ($11.b),Y		; 91 11
	ora ($20.b),Y		; 11 20
	ora $5A2D.w,Y		; 19 2D 5A
	stx $59.b,Y		; 96 59
	bit $20.b		; 24 20
	stp		; DB
	mvp $84,$A4		; 44 A4 84
	ora $B4FA.w,X		; 1D FA B4
	adc $F9F001.l,X		; 7F 01 F0 F9
	asl $F0A3.w,X		; 1E A3 F0
	cmp $872D51.l		; CF 51 2D 87
	sbc $A39E.w		; ED 9E A3
	tsx		; BA
	ldx $1D.b,Y		; B6 1D
	cmp #$EA.b		; C9 EA
	sec		; 38
	stx $C3.b,Y		; 96 C3
	sbc $4ED463.l,X		; FF 63 D4 4E
	jmp.w [$883F]		; DC 3F 88
	sbc $1C.b,X		; F5 1C
	tad		; 5B
	adc ($F0.b,X)		; 61 F0
	cmp $7677F0.l		; CF F0 77 76
	cmp $F6.b,S		; C3 F6
	cmp $DB6DF0.l		; CF F0 6D DB
	asl $FFE4.w		; 0E E4 FF
	asl $E5.b		; 06 E5
	bcs  -7.b		; B0 F9
	sbc [$F8.b]		; E7 F8
	sec		; 38
	dec $C3.b,X		; D6 C3
	sbc #$1F.b		; E9 1F
	cpx #$DBE4.w		; E0 E4 DB
	ora $EF7A86.l		; 0F 86 7A EF
	lda $1FB6.w,X		; BD B6 1F
	ldx $7A.b,Y		; B6 7A
	inc $D8FE.w		; EE FE D8
	adc [$27.b],Y		; 77 27
	ldx $B6F5.w		; AE F5 B6
	cmp $E7.b,S		; C3 E7
	stz $D7BB.w,X		; 9E BB D7
	tad		; 5B
	ora $EF7AA4.l		; 0F A4 7A EF
	lda $D01FB6.l,X		; BF B6 1F D0
	ply		; 7A
	sbc $1FB6C0.l		; EF C0 B6 1F
	tsb $5FF6.w		; 0C F6 5F
	sta $6C.b,S		; 83 6C
	and $5EF66C.l,X		; 3F 6C F6 5E
	ora $B0.b,X		; 15 B0
	inc $654F.w		; EE 4F 65
	sed		; F8
	ldx $C3.b,Y		; B6 C3
	sbc [$9E.b]		; E7 9E
	wai		; CB
	cmp $B6.b,S		; C3 B6
	ora $5EF648.l,X		; 1F 48 F6 5E
	dec $7FD8.w		; CE D8 7F
	eor ($EC.b,X)		; 41 EC
	lda $B2AD.w,X		; BD AD B2
	tsb $D2.b		; 04 D2
	tsb $D2.b		; 04 D2
	tsb $52.b		; 04 52
	tsb $D2.b		; 04 D2
	tsb $52.b		; 04 52
	tsb $D2.b		; 04 D2
	asl A		; 0A
	stz $709E.w		; 9C 9E 70
	plp		; 28
	jsr $C9A9.w		; 20 A9 C9
	cmp #$C9.b		; C9 C9
	cmp #$C2.b		; C9 C2
	tay		; A8
	.db $62, $A1, $14		; 62 A1 14
	brk $A8.b		; 00 A8
	tay		; A8
	tay		; A8
	mvp $48,$44		; 44 44 48
	rol $9A92.w		; 2E 92 9A
	rti		; 40

	ldy $5441.w,X		; BC 41 54
	sty $94.b,X		; 94 94
	sty $94.b,X		; 94 94
	cmp $AA20.w,X		; DD 20 AA
	dex		; CA
	xba		; EB
	cop $52.b		; 02 52
	asl A		; 0A
	ldy $ACAC.w		; AC AC AC
	ldy $42AE.w		; AC AE 42
	tsb $52.b		; 04 52
	tsb $D4.b		; 04 D4
	mvp $6B,$C3		; 44 C3 6B
	jmp.w [$7BDD]		; DC DD 7B
	txy		; 9B
	tax		; AA
	sbc $F7.b		; E5 F7
	and [$57.b],Y		; 37 57
	lda #$BD.b		; A9 BD
	eor $71EA.w		; 4D EA 71
	inc $BD.b,X		; F6 BD
	sbc [$AF.b]		; E7 AF
	sbc $8E7C3D.l		; EF 3D 7C 8E
	sta [$BC.b]		; 87 BC
	sbc $EC.b,X		; F5 EC
	pld		; 2B
	bmi -101.b		; 30 9B
	cmp $5D8FF4.l		; CF F4 8F 5D
	ora $FE9385.l,X		; 1F 85 93 FE
	stx $ED.b		; 86 ED
	ora ($3F.b),Y		; 11 3F
	phy		; 5A
	sta $D5275B.l,X		; 9F 5B 27 D5
	and $688F5A.l,X		; 3F 5A 8F 68
	.db $82, $FF, $54		; 82 FF 54
	cmp $F651.w,X		; DD 51 F6
	eor $91F228.l		; 4F 28 F2 91
	ora ($FE.b,S),Y		; 13 FE
	sbc [$B8.b]		; E7 B8
	jmp ($BE83.w,X)		; 7C 83 BE
	tsa		; 3B
.ACCU 8
.INDEX 8
	sep #$72		; E2 72
	sbc ($28.b),Y		; F1 28
	lsr A		; 4A
	pha		; 48
	eor #$BA.b		; 49 BA
	sta ($16.b,S),Y		; 93 16
	lsr A		; 4A
	asl A		; 0A
	lsr A		; 4A
	dex		; CA
	wai		; CB
	phd		; 0B
	asl A		; 0A
	cpy $2222.w		; CC 22 22
	lsr $BFA7.w,X		; 5E A7 BF
	dec $DF7F.w,X		; DE 7F DF
	sbc $7D.b,X		; F5 7D
	sbc [$AF.b]		; E7 AF
	inc $F45E.w,X		; FE 5E F4
	.db $82, $E8, $20		; 82 E8 20
	ldy $44.b		; A4 44
	mvp $7B,$F2		; 44 F2 7B
	inc $FF6E.w,X		; FE 6E FF
	txy		; 9B
	lda $604F20.l,X		; BF 20 4F 60
	inx		; E8
	trb $92F2.w		; 1C F2 92
	sta ($85.b,S),Y		; 93 85
	sbc [$3C.b],Y		; F7 3C
	sbc $BFF3DE.l		; EF DE F3 BF
	ply		; 7A
	.db $62, $F1, $78		; 62 F1 78
	ldy $245E.w,X		; BC 5E 24
	and ($8C.b),Y		; 31 8C
	adc ($11.b,X)		; 61 11
	rol $0AEF.w,X		; 3E EF 0A
	ror $4F16.w		; 6E 16 4F
	dec $BCBB.w		; CE BB BC
	and $DD2722.l		; 2F 22 27 DD
	sbc ($7D.b,X)		; E1 7D
	dec $9D17.w,X		; DE 17 9D
	adc [$A5.b],Y		; 77 A5
	ldy $F2A6.w,X		; BC A6 F2
	jsl $202222.l		; 22 22 22 20
	sta $6FEA.w		; 8D EA 6F
	eor ($7A.b,S),Y		; 53 7A
	txy		; 9B
	pei ($DE.b)		; D4 DE
	ldx $F5.b		; A6 F5
	plp		; 28
	dey		; 88
	dey		; 88
	dey		; 88
	.db $82, $28, $88		; 82 28 88
	dey		; 88
	dey		; 88
	tya		; 98
	lsr A		; 4A
	txa		; 8A
	pha		; 48
	sty $00.b,X		; 94 00
	cli		; 58
	lsr $88.b,X		; 56 88
	dey		; 88
	dey		; 88
	sty $4E.b,X		; 94 4E
	lsr $7741.w		; 4E 41 77
	eor #$C9.b		; 49 C9
	cpy $44.b		; C4 44
	mvp $41,$A8		; 44 A8 41
	bpl  11.b		; 10 0B
	ldx #$22.b		; A2 22
	jsl $005422.l		; 22 22 54 00
	and $EA.b		; 25 EA
	stz $A6.b		; 64 A6
	inx		; E8
	dey		; 88
	bit #$4D.b		; 89 4D
	tax		; AA
	adc $4A.b		; 65 4A
	dey		; 88
	and ($25.b),Y		; 31 25
	ldy $42AE.w		; AC AE 42
	beq -120.b		; F0 88
	sta $95.b,X		; 95 95
	bit #$61.b		; 89 61
	eor #$05.b		; 49 05
	jsl $27224C.l		; 22 4C 22 27
	bvc -36.b		; 50 DC
	tsb $9D.b		; 04 9D
	and $DA63.w		; 2D 63 DA
	cmp $2DDA.w,X		; DD DA 2D
	asl $8A.b,X		; 16 8A
	sbc [$55.b],Y		; F7 55
	wai		; CB
	sty $A8.b		; 84 A8
	ldy $A4.b		; A4 A4
	ldy $A4.b		; A4 A4
	sbc [$9E.b],Y		; F7 9E
	ldx $3745.w,Y		; BE 45 37
	lda #$C7.b		; A9 C7
	phx		; DA
	cmp [$DA.b]		; C7 DA
	lda $D41B.w,X		; BD 1B D4
	lsr $D90D.w,X		; 5E 0D D9
	sbc $DA3F08.l		; EF 08 3F DA
	and $0471.w,X		; 3D 71 04
	eor ($10.b),Y		; 51 10
	sbc ($84.b)		; F2 84
	brk $24.b		; 00 24
	and $2D.b		; 25 2D
	ora $08F0.w,X		; 1D F0 08
	and $61.b,S		; 23 61
	eor $DF84.w,Y		; 59 84 DF
	eor #$99.b		; 49 99
	bit $02E0.w		; 2C E0 02
	jsl $A04452.l		; 22 52 44 A0
	ora ($00.b),Y		; 11 00
	ora $F6D5CF.l		; 0F CF D5 F6
	adc $11006D.l,X		; 7F 6D 00 11
	ora ($0B.b)		; 12 0B
	mvp $39,$00		; 44 00 39
	tyx		; BB
	sbc $B5DF.w,X		; FD DF B5
	lda [$89.b],Y		; B7 89
	ldy $DEC6.w,X		; BC C6 DE
	trb $94.b		; 14 94
	sty $80.b,X		; 94 80
	asl $C9.b,X		; 16 C9
	and #$BB.b		; 29 BB
	eor $F1E2.w		; 4D E2 F1
	sei		; 78
	sbc ($BF.b,S),Y		; F3 BF
	tda		; 7B
	tsa		; 3B
	nop		; EA
	cmp ($BC.b,S),Y		; D3 BC
	sta $31FE.w		; 8D FE 31
	stx $6300.w		; 8E 00 63
	ora ($17.b)		; 12 17
	jmp $7C49.w		; 4C 49 7C
	eor $8476.w,Y		; 59 76 84
	jmp $0B59.w		; 4C 59 0B
	cmp ($10.b)		; D2 10
	adc $92.b,X		; 75 92
	eor ($BA.b,S),Y		; 53 BA
	eor ($14.b,X)		; 41 14
	mvp $61,$C2		; 44 C2 61
	bmi -104.b		; 30 98
	jmp $1326.w		; 4C 26 13
	ora #$84.b		; 09 84
	sta $DFF8.w		; 8D F8 DF
	sta $DFF8.w		; 8D F8 DF
	sta $DFF8.w		; 8D F8 DF
	sta $DFF8.w		; 8D F8 DF
	jsr $A423.w		; 20 23 A4
	ldy $A4.b		; A4 A4
	ldy $A4.b		; A4 A4
	ldy $A4.b		; A4 A4
	ldy $BC.b		; A4 BC
	lsr $D237.w,X		; 5E 37 D2
	adc $DA.b,S		; 63 DA
	sbc [$78.b],Y		; F7 78
	lda $3756.w,X		; BD 56 37
	eor $AC73.w,Y		; 59 73 AC
	clv		; B8
	rti		; 40

	txs		; 9A
	bit $D1.b		; 24 D1
	tyx		; BB
	lsr $0C.b,X		; 56 0C
	ldy $4919.w		; AC 19 49
	stz $96.b		; 64 96
	phb		; 8B
	lda $D2.b		; A5 D2
	sbc ($78.b),Y		; F1 78
	tya		; 98
	tya		; 98
	iny		; C8
	bmi -107.b		; 30 95
	ora $14.b,X		; 15 14
	sty $91.b,X		; 94 91
	jsl $4F041D.l		; 22 1D 04 4F
	bvs -62.b		; 70 C2
	adc ($2C.b,X)		; 61 2C
	and $70C2.w,X		; 3D C2 70
	brk $DD.b		; 00 DD
	asl $8B.b,X		; 16 8B
	mvp $E8,$86		; 44 86 E8
	lda ($11.b,X)		; A1 11
	ora ($11.b),Y		; 11 11
	and $3F815C.l,X		; 3F 5C 81 3F
	cmp [$49.b]		; C7 49
	ora ($24.b)		; 12 24
	pha		; 48
	sta ($22.b),Y		; 91 22
	mvp $4C,$BC		; 44 BC 4C
	jmp $C966.w		; 4C 66 C9
	txy		; 9B
	rol $64.b		; 26 64
	lda $E692.w,Y		; B9 92 E6
	lsr A		; 4A
	rti		; 40

	txs		; 9A
	and [$2B.b]		; 27 2B
	rol $F85A.w,X		; 3E 5A F8
	ldy $2F8E.w,X		; BC 8E 2F
	and ($12.b,X)		; 21 12
	ora $11.b		; 05 11
	ora ($11.b),Y		; 11 11
	ora ($5B.b,S),Y		; 13 5B
	and ($F9.b)		; 32 F9
	jmp ($5FBE.w,X)		; 7C BE 5F
	jsr $44AB.w		; 20 AB 44
	pha		; 48
	sta ($22.b),Y		; 91 22
	lsr $68.b		; 46 68
	cmp $A319.w		; CD 19 A3
	jmp ($7283.w,X)		; 7C 83 72
	rti		; 40

	sbc $7083EC.l,X		; FF EC 83 70
	stz $3FE1.w		; 9C E1 3F
	sei		; 78
	sta $67.b,S		; 83 67
	sta [$FF.b]		; 87 FF
	lda $7290EB.l		; AF EB 90 72
	and $027236.l,X		; 3F 36 72 02
	dec A		; 3A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr $E7B2.w		; 4E B2 E7
	eor $8D.b,X		; 55 8D
	inc $71F1.w		; EE F1 71
	sbc $A46F.w		; ED 6F A4
	ldy $2F5E.w,X		; BC 5E 2F
	bpl  41.b		; 10 29
	cmp ($DE.b),Y		; D1 DE
	sbc ($F8.b)		; F2 F8
	tsa		; 3B
	and $3A77.w,Y		; 39 77 3A
	adc $A8BA.w,Y		; 79 BA A8
	bit #$84.b		; 89 84
.ACCU 16
	rep #$61		; C2 61
	bmi -100.b		; 30 9C
	.db $62, $F9, $7C		; 62 F9 7C
	ldx $FC46.w,Y		; BE 46 FC
	adc $6FFCC6.l		; 6F C6 FC 6F
	dec $FC.b		; C6 FC
	adc $3B1EC7.l		; 6F C7 1E 3B
	lda ($02.b)		; B2 02
	dec A		; 3A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr A		; 4A
	lsr $E7B2.w		; 4E B2 E7
	eor $AC73.w,Y		; 59 73 AC
	lda $5CD6.w,Y		; B9 D6 5C
	xba		; EB
	rol $9775.w		; 2E 75 97
	dec A		; 3A
	wai		; CB
	sta $C265.w,X		; 9D 65 C2
	tsb $EB.b		; 04 EB
	stx $B9.b,Y		; 96 B9
	rtl		; 6B

	sta [$62.b],Y		; 97 62
	inc $03BF.w,X		; FE BF 03
	lda $BD.b,S		; A3 BD
	inx		; E8
	sbc $DD3B7A.l		; EF 7A 3B DD
	cmp $1DDB.w,Y		; D9 DB 1D
	lda ($FD.b),Y		; B1 FD
	inc $EC.b		; E6 EC
	clv		; B8
	adc ($0C.b,S),Y		; 73 0C
	ora ($ED.b,X)		; 01 ED
	eor ($D8.b),Y		; 51 D8
	cmp ($D8.b),Y		; D1 D8
	sta $ED89.w,X		; 9D 89 ED
	ora $AF33.w,X		; 1D 33 AF
	and ($A6.b)		; 32 A6
	rol $26.b		; 26 26
	ora ($70.b,S),Y		; 13 70
	dec $0800.w		; CE 00 08
	sta ($22.b),Y		; 91 22
	clc		; 18
	lda $EA.b		; A5 EA
	rol $8C.b		; 26 8C
	cmp ($90.b),Y		; D1 90
	sbc [$67.b],Y		; F7 67
	brk $E0.b		; 00 E0
	trb $8003.w		; 1C 03 80
	bvs  14.b		; 70 0E
	brk $58.b		; 00 58
	ror $5C43.w,X		; 7E 43 5C
	cmp [$35.b],Y		; D7 35
	cmp $5C73.w		; CD 73 5C
	cmp [$A4.b],Y		; D7 A4
	ldy $A4.b		; A4 A4
	ldy $A8.b		; A4 A8
	tay		; A8
	tay		; A8
.ACCU 16
	rep #$64		; C2 64
	phk		; 4B
	sta ($2E.b),Y		; 91 2E
	mvp $12,$B9		; 44 B9 12
	jmp.w [$E496]		; DC 96 E4
	lda [$25.b],Y		; B7 25
	cpy $94.b		; C4 94
	sta ($34.b,X)		; 81 34
	mvp $C6,$DB		; 44 DB C6
	stp		; DB
	dec $DC.b		; C6 DC
	cmp $DC.b		; C5 DC
	cmp $DC.b		; C5 DC
	cmp $90.b		; C5 90
	bcc  12.b		; 90 0C
	eor $10.b,S		; 43 10
	cpy $31.b		; C4 31
	tsb $4B43.w		; 0C 43 4B
	eor [$4F.b]		; 47 4F
	bit #$B58F.w		; 89 8F B5
	sta $99AD.w,Y		; 99 AD 99
	lda $AD99.w		; AD 99 AD
	sta $99AD.w,Y		; 99 AD 99
	lda $36CB.w		; AD CB 36
	php		; 08
	txy		; 9B
	tsb $4D.b		; 04 4D
	eor ($D4.b,S),Y		; 53 D4
	and $3C42.w,X		; 3D 42 3C
	clc		; 18
	cmp $BFD18C.l,X		; DF 8C D1 BF
	ora $9BA3.w,Y		; 19 A3 9B
	asl $3DCA.w,X		; 1E CA 3D
	sta [$BF.b],Y		; 97 BF
	rol $F5B9.w,X		; 3E B9 F5
	cmp $4C04AE.l		; CF AE 04 4C
	sta ($24.b,S),Y		; 93 24
	and $9DDC09.l,X		; 3F 09 DC 9D
	cmp #$89DC.w		; C9 DC 89
	and ($CE.b),Y		; 31 CE
	and $97DF.w,Y		; 39 DF 97
	sbc $1DBA.w,Y		; F9 BA 1D
	cmp [$4B.b],Y		; D7 4B
	lda $EBAFFF.l,X		; BF FF AF EB
	cmp $A4FE05.l		; CF 05 FE A4
	sbc $EF13.w,Y		; F9 13 EF
	and [$F9.b]		; 27 F9
	lda ($88.b,S),Y		; B3 88
	dey		; 88
	bcc  17.b		; 90 11
	ldx #$21.b		; A2 21
	bit $84.b		; 24 84
	sty $1D.b		; 84 1D
	and ($21.b,X)		; 21 21
	jsr $8800.w		; 20 00 88
	stx $C9.b		; 86 C9
	lda $20C647.l		; AF 47 C6 20
	cmp $5C93.w,X		; DD 93 5C
	dec $00.b,X		; D6 00
	and $C986.w,Y		; 39 86 C9
	sbc [$8D.b],Y		; F7 8D
	cld		; D8
	ora $14.b,X		; 15 14
	sty $92.b,X		; 94 92
	adc $4B.b		; 65 4B
	sta $27.b,X		; 95 27
	.db $62, $7B, $57		; 62 7B 57
	dec A		; 3A
	adc [$4B.b],Y		; 77 4B
	cmp $E2.b		; C5 E2
	ora $26.b		; 05 26
	sty $9AD1.w		; 8C D1 9A
	and ($46.b,S),Y		; 33 46
	ply		; 7A
	ora ($13.b),Y		; 11 13
	cmp $1292.w,X		; DD 92 12
	ora ($10.b)		; 12 10
	ror $4E.b		; 66 4E
	lda $7BFD.w,X		; BD FD 7B
	plx		; FA
	sbc [$F5.b],Y		; F7 F5
	sed		; F8
	inc A		; 1A
	inx		; E8
	bit #$AC84.w		; 89 84 AC
	ldy $9CB0.w		; AC B0 9C
	ldy $245A.w,X		; BC 5A 24
	and ($25.b),Y		; 31 25
	and $DD.b		; 25 DD
	pha		; 48
	eor #$4941.w		; 49 41 49
	sty $B0.b		; 84 B0
	sta ($0A.b,X)		; 81 0A
	php		; 08
	txy		; 9B
	tya		; 98
	ldx $2707.w,Y		; BE 07 27
	phb		; 8B
	iny		; C8
	stx $BE.b,Y		; 96 BE
	lsr $7A.b,X		; 56 7A
	lsr $624C.w		; 4E 4C 62
	ora ($21.b,X)		; 01 21
	and ($29.b,X)		; 21 29
	and #$2929.w		; 29 29 29
	sta $8FAD.w,Y		; 99 AD 8F
	lda $A7.b,X		; B5 A7
	cpy $D2.b		; C4 D2
	cmp ($D6.b),Y		; D1 D6
	cpy $4F44.w		; CC 44 4F
	bvc -43.b		; 50 D5
	and $D443.w,X		; 3D 43 D4
	and $5443.w,X		; 3D 43 54
	bit #$3D12.w		; 89 12 3D
	sty $73.b,X		; 94 73
	adc $D9.b,S		; 63 D9
	eor [$B2.b]		; 47 B2
	sta $D81C65.l		; 8F 65 1C D8
	cmp $BA19.w		; CD 19 BA
	cmp ($FF.b,S),Y		; D3 FF
	cmp ($DF.b,S),Y		; D3 DF
	stz $FFFC.w,X		; 9E FC FF
	adc $0010.w,Y		; 79 10 00
	sbc $67F8FC.l,X		; FF FC F8 67
	sbc ($3F.b,X)		; E1 3F
	ora #$24FE.w		; 09 FE 24
.ACCU 16
.INDEX 16
	rep #$3F		; C2 3F
	adc $E1.b,S		; 63 E1
	ply		; 7A
	cmp $F9D62F.l,X		; DF 2F D6 F9
	ror $CBB7.w,X		; 7E B7 CB
	sbc $BE.b,X		; F5 BE
	jmp $28FCF0.l		; 5C F0 FC 28
	eor $AE9FDD.l,X		; 5F DD 9F AE
	sta $AE9FAE.l,X		; 9F AE 9F AE
	sta $449CAE.l,X		; 9F AE 9C 44
	bit #$1A01.w		; 89 01 1A
	jsl $22F240.l		; 22 40 F2 22
	ora $7146.w,Y		; 19 46 71
	ora ($0D.b)		; 12 0D
	dex		; CA
	and ($88.b,S),Y		; 33 88
	bra   8.b		; 80 08
	bit #$C803.w		; 89 03 C8
	dey		; 88
	adc [$19.b]		; 67 19
	lsr $39.b		; 46 39
	asl $E7.b		; 06 E7
	ora $3846.w,Y		; 19 46 38
	brk $88.b		; 00 88
	bra  72.b		; 80 48
	lsr A		; 4A
	eor ($F2.b,X)		; 41 F2
	ora ($80.b)		; 12 80
	php		; 08
	dey		; 88
	adc ($37.b,S),Y		; 73 37
	jmp $D85D8C.l		; 5C 8C 5D D8
	ora ($21.b,X)		; 01 21
	and ($27.b,X)		; 21 27
	bmi -28.b		; 30 E4
	tya		; 98
	cpy #$4C04.w		; C0 04 4C
	rol $12.b		; 26 12
	ora $12264C.l		; 0F 4C 26 12
	asl $5AB4.w		; 0E B4 5A
	and $8B49.w		; 2D 49 8B
	rol $2C.b		; 26 2C
	tya		; 98
	ldy #$8B16.w		; A0 16 8B
	eor $A2.b		; 45 A2
	cmp ($68.b),Y		; D1 68
	ldy $00.b,X		; B4 00
	ora ($23.b),Y		; 11 23
	eor [$0A.b]		; 47 0A
	stx $1C15.w		; 8E 15 1C
	rol A		; 2A
	sec		; 38
	rti		; 40

	ora ($22.b),Y		; 11 22
	mvp $12,$89		; 44 89 12
	bit $05.b		; 24 05
	clc		; 18
	pea $A776.w		; F4 76 A7
	cpx $7A78.w		; EC 78 7A
	sbc $2515EC.l		; EF EC 15 25
	bcs -20.b		; B0 EC
	txa		; 8A
	sta $B0D5.w,X		; 9D D5 B0
	sbc $4E05.w,Y		; F9 05 4E
	and $B0.b		; 25 B0
.INDEX 8
	sep #$95		; E2 95
	sec		; 38
	ldx $C3.b,Y		; B6 C3
	tsx		; BA
	rol A		; 2A
	adc [$5D.b],Y		; 77 5D
	clv		; B8
	ror $53F9.w,X		; 7E F9 53
	bit #$87DB.w		; 89 DB 87
	cpx $BB14.w		; EC 14 BB
	tyx		; BB
	adc ($D9.b,X)		; 61 D9
	trb $B6.b		; 14 B6
	sbc $C887.w		; ED 87 C8
	and #$5B6E.w		; 29 6E 5B
	ora $7129E3.l		; 0F E3 29 71
	lda $7C87.w		; AD 87 7C
	eor ($E4.b)		; 52 E4
	stp		; DB
	ora $FB52A6.l		; 0F A6 52 FB
	stp		; DB
	adc ($FB.b,X)		; 61 FB
	ora [$AA.b]		; 07 AA
	sbc $6487ED.l		; EF ED 87 64
	ply		; 7A
	lda $3E6C5B.l		; AF 5B 6C 3E
	eor ($EA.b,X)		; 41 EA
	lda $B075.w,X		; BD 75 B0
.INDEX 8
	sep #$9E		; E2 9E
	plb		; AB
	sbc $7487ED.l		; EF ED 87 74
	ply		; 7A
	lda $87DB5B.l		; AF 5B DB 87
	sbc $F0AB9E.l		; EF 9E AB F0
	and $EC87.w		; 2D 87 EC
	ora ($7E.b),Y		; 11 7E
	ora $ECB0.w		; 0D B0 EC
	dey		; 88
	ldy $612B.w,X		; BC 2B 61
	sbc ($08.b)		; F2 08
	lda $71D816.l,X		; BF 16 D8 71
	pha		; 48
	lda $0EB707.l,X		; BF 07 B7 0E
	inx		; E8
	phb		; 8B
.ACCU 16
	rep #$ED		; C2 ED
	cmp $F7.b,S		; C3 F7
	iny		; C8
	lda $0EB717.l,X		; BF 17 B7 0E
	stz $79.b,X		; 74 79
	cmp ($E7.b),Y		; D1 E7
	eor [$9D.b]		; 47 9D
	asl $7974.w,X		; 1E 74 79
	cmp ($62.b),Y		; D1 62
	cmp [$26.b]		; C7 26
	ora $444400.l		; 0F 00 44 44
	mvp $81,$44		; 44 44 81
	mvp $44,$44		; 44 44 44
	mvp $14,$48		; 44 48 14
	lda ($4B.b)		; B2 4B
	bit $B2.b		; 24 B2
	lsr A		; 4A
	sbc $AE.b		; E5 AE
	phy		; 5A
	sbc $C3.b		; E5 C3
	rtl		; 6B

	ora $05A2.w		; 0D A2 05
	ora ($92.b),Y		; 11 92
	cmp #$BB6B.w		; C9 6B BB
	eor $EA.b,X		; 55 EA
	ror $8A.b		; 66 8A
	rti		; 40

	ldx $56.b		; A6 56
	asl $8F37.w		; 0E 37 8F
	stz $88.b		; 64 88
	dey		; 88
	bit #$8802.w		; 89 02 88
	dey		; 88
	dey		; 88
	dey		; 88
	bcc  41.b		; 90 29
	pei ($97.b)		; D4 97
	lda #$522F.w		; A9 2F 52
	lsr $BDA4.w,X		; 5E A4 BD
	eor #$927A.w		; 49 7A 92
	sbc $25.b,X		; F5 25
	nop		; EA
	phk		; 4B
	bit #$7A02.w		; 89 02 7A
	lda ($D5.b),Y		; B1 D5
	stx $75B4.w		; 8E B4 75
	lda $AD.b,S		; A3 AD
	ora $EC88.w,X		; 1D 88 EC
	eor [$62.b]		; 47 62
	and $F9B0.w,Y		; 39 B0 F9
	bcc  77.b		; 90 4D
	sed		; F8
	and $11.b		; 25 11
	ora ($11.b),Y		; 11 11
	ora ($34.b,S),Y		; 13 34
	dec $8C33.w		; CE 33 8C
	sbc $38.b,S		; E3 38
	dec $8F33.w		; CE 33 8F
	ldy #$22.b		; A0 22
	jsl $412222.l		; 22 22 22 41
	cli		; 58
	jmp $E927.w		; 4C 27 E9
	sta $1E68A6.l,X		; 9F A6 68 1E
	bit $13FB.w,X		; 3C FB 13
	ply		; 7A
	sbc [$BD.b],Y		; F7 BD
	tyx		; BB
	lsr $ABDD.w,X		; 5E DD AB
	and $B2.b		; 25 B2
	mvp $16,$2D		; 44 2D 16
	sta $1DD6.w		; 8D D6 1D
	dec $1D.b,X		; D6 1D
	cmp $1B.b,X		; D5 1B
	tax		; AA
	asl $2298.w		; 0E 98 22
	jsl $412222.l		; 22 22 22 41
	eor $6186.w,Y		; 59 86 61
	cpy $38.b		; C4 38
	sta [$13.b]		; 87 13
	ora $6B1F6B.l,X		; 1F 6B 1F 6B
	ora $6B1F6B.l,X		; 1F 6B 1F 6B
	ora $6B1F6B.l,X		; 1F 6B 1F 6B
	ora $7BF16B.l,X		; 1F 6B F1 7B
	cpx $1C73.w		; EC 73 1C
	cmp [$31.b]		; C7 31
	cpy $1C73.w		; CC 73 1C
	cmp [$3F.b]		; C7 3F
	ora ($2B.b),Y		; 11 2B
	pld		; 2B
	and $7B.b,S		; 23 7B
	sta $979F7B.l,X		; 9F 7B 9F 97
	lda ($97.b,S),Y		; B3 97
	lda ($34.b,S),Y		; B3 34
	eor #$4949.w		; 49 49 49
	and [$D2.b],Y		; 37 D2
	adc $32CBA4.l		; 6F A4 CB 32
	cmp #$1F8F.w		; C9 8F 1F
	ora $D4AB2A.l		; 0F 2A AB D4
	cmp $22F444.l		; CF 44 F4 22
	and ($41.b,X)		; 21 41
	rti		; 40

	pla		; 68
	inc A		; 1A
	ora [$10.b]		; 07 10
.INDEX 8
	sep #$1C		; E2 1C
	eor ($8B.b,X)		; 41 8B
	asl $2C.b,X		; 16 2C
	eor $48.b,X		; 55 48
	ora [$44.b],Y		; 17 44
	mvp $C7,$55		; 44 55 C7
	and ($C8.b),Y		; 31 C8
	ora ($CD.b),Y		; 11 CD
	and ($51.b,S),Y		; 33 51
	ora ($15.b),Y		; 11 15
	pha		; 48
	trb $C7.b		; 14 C7
	rol $E36D.w		; 2E 6D E3
	stz $EE.b,X		; 74 EE
	jsl $29902A.l		; 22 2A 90 29
	stx $445C.w		; 8E 5C 44
	mvp $20,$55		; 44 55 20
	eor $1111.w,X		; 5D 11 11
	mvn $74,$81		; 54 81 74
	mvp $5C,$45		; 44 45 5C
	adc ($1C.b,S),Y		; 73 1C
	sta ($1D.b,X)		; 81 1D
	ora $43.b,S		; 03 43
	lda #$522F.w		; A9 2F 52
	lsr $BDA4.w,X		; 5E A4 BD
	eor #$4055.w		; 49 55 40
	and ($20.b),Y		; 31 20
	lda ($0B.b)		; B2 0B
	cld		; D8
	stx $70C4.w		; 8E C4 70
	eor [$04.b]		; 47 04
	bvs  71.b		; 70 47
	tsb $70.b		; 04 70
	eor [$04.b]		; 47 04
	adc $41E5C3.l		; 6F C3 E5 41
	inx		; E8
	dey		; 88
	dey		; 88
	dey		; 88
	sta $1CE240.l,X		; 9F 40 E2 1C
	eor $34.b,S		; 43 34
	cmp $A420.w		; CD 20 A4
	mvp $44,$44		; 44 44 44
	eor $6403.w		; 4D 03 64
	cmp $993E.w,Y		; D9 3E 99
	pea $29C8.w		; F4 C8 29
	ora ($11.b),Y		; 11 11
	ora ($2C.b),Y		; 11 2C
	sta ($A6.b,S),Y		; 93 A6
	adc $98.b,S		; 63 98
	sbc $45.b		; E5 45
	mvp $44,$15		; 44 15 44
	pea $444F.w		; F4 4F 44
.ACCU 8
	sep #$22		; E2 22
	jsl $210E71.l		; 22 71 0E 21
	cpy $33.b		; C4 33
	tsb $00C0.w		; 0C C0 00
	jsr ($FB5E.w,X)		; FC 5E FB
	ora $6A1F6B.l,X		; 1F 6B 1F 6A
	sbc $37.b,X		; F5 37
	lda #$11.b		; A9 11
	ora $9863C4.l,X		; 1F C4 63 98
	sbc $E2.b		; E5 E2
	sbc ($05.b),Y		; F1 05
	eor $DA1F.w		; 4D 1F DA
	xce		; FB
	cmp $B5F7B5.l,X		; DF B5 F7 B5
	and ($B5.b,S),Y		; 33 B5
	and ($A5.b,S),Y		; 33 A5
	ldx $E45A.w		; AE 5A E4
	lda ($63.b)		; B2 63
	plp		; 28
	dex		; CA
	and $0D.b,X		; 35 0D
	.db $42, $0A		; 42 0A
	mvp $44,$44		; 44 44 44
	mvp $1C,$E2		; 44 E2 1C
	eor $88.b,S		; 43 88
	adc ($0E.b),Y		; 71 0E
	and ($05.b,X)		; 21 05
	jsl $222222.l		; 22 22 22 22
	lsr A		; 4A
	lsr A		; 4A
	pha		; 48
	adc ($30.b,X)		; 61 30
	sta [$0B.b],Y		; 97 0B
	stx $81.b		; 86 81
	adc ($60.b,X)		; 61 60
	dey		; 88
	dey		; 88
	bit #$24.b		; 89 24
	sec		; 38
	pla		; 68
	inc A		; 1A
	tsb $48.b		; 04 48
	stz $E462.w		; 9C 62 E4
	tas		; 1B
	iny		; C8
	lda $B9C8.w,Y		; B9 C8 B9
	iny		; C8
	lda $1B54.w,Y		; B9 54 1B
	sta $119004.l,X		; 9F 04 90 11
	dec $04.b		; C6 04
	inc $81.b		; E6 81
	tsa		; 3B
	eor $A2.b		; 45 A2
	sbc #$74.b		; E9 74
	ldy $265E.w,X		; BC 5E 26
	rol $30.b		; 26 30
	cmp $D5.b,S		; C3 D5
	ora $613C4C.l		; 0F 4C 3C 61
	cpx $112C.w		; EC 2C 11
	ora ($11.b),Y		; 11 11
	bit $87.b		; 24 87
	jsr $825E.w		; 20 5E 82
	.db $82, $24, $46		; 82 24 46
	phd		; 0B
	stz $681E.w,X		; 9E 1E 68
	adc $4B49.w,Y		; 79 49 4B
	eor $A2.b		; 45 A2
	sbc #$74.b		; E9 74
	ldy $A46F.w,X		; BC 6F A4
	ldx $0C1F.w		; AE 1F 0C
	and $F450.w,X		; 3D 50 F4
	cmp $E0.b,S		; C3 E0
	dex		; CA
	sbc ($F8.b),Y		; F1 F8
	dec $1B3F.w,X		; DE 3F 1B
	cmp [$E3.b]		; C7 E3
	phk		; 4B
	jmp $5CCBB5.l		; 5C B5 CB 5C
	stx $10.b,Y		; 96 10
	and [$49.b]		; 27 49
	eor #$51.b		; 49 51
	eor ($84.b),Y		; 51 84
.INDEX 16
	rep #$56		; C2 56
	lsr $5E.b,X		; 56 5E
	sta [$BB.b]		; 87 BB
	ora $581E6A.l		; 0F 6A 1E 58
	ora [$AE.b],Y		; 17 AE
	tsb $FA.b		; 04 FA
	adc [$39.b],Y		; 77 39
	xce		; FB
	inc $FB7E.w		; EE 7E FB
	sta $D18CBE.l,X		; 9F BE 8C D1
	txs		; 9A
	and ($51.b,S),Y		; 33 51
	and $7102.w,Y		; 39 02 71
	jsl $545252.l		; 22 52 52 54
	mvn $38,$61		; 54 61 38
	pei ($4D.b)		; D4 4D
	ora $EC1E7A.l		; 0F 7A 1E EC
	and $72A8.w,X		; 3D A8 72
	ora ($0D.b,X)		; 01 0D
	ora ($11.b),Y		; 11 11
	ora ($13.b),Y		; 11 13
	rti		; 40

	cmp $4D36.w,Y		; D9 36 4D
	ora $40.b,S		; 03 40
	.db $82, $91, $11		; 82 91 11
	ora ($11.b),Y		; 11 11
	sec		; 38
	cmp $C2.b		; C5 C2
	sbc ($84.b,X)		; E1 84
	rep #$41		; C2 41
	jmp $8B9C8B.l		; 5C 8B 9C 8B
	txy		; 9B
	and [$36.b],Y		; 37 36
	ror $DC6C.w		; 6E 6C DC
	cmp $B3B9.w,Y		; D9 B9 B3
	adc ($66.b,S),Y		; 73 66
	inc $7C.b		; E6 7C
	rol $1E54.w,X		; 3E 54 1E
	rti		; 40

	eor [$18.b]		; 47 18
	and $B13A56.l,X		; 3F 56 3A B1
	txs		; 9A
	ora $9C87CD.l		; 0F CD 87 9C
	stz $449C.w		; 9C 9C 44
	mvp $20,$4A		; 44 4A 20
	sta ($0B.b)		; 92 0B
	cmp $1111.w		; CD 11 11
	ora ($B9.b)		; 12 B9
	jmp ($2091.w)		; 6C 91 20
	eor ($92.b)		; 52 92
	sta ($92.b)		; 92 92
	ldx #$EBA2.w		; A2 A2 EB
	adc #$B4.b		; 69 B4
	dec $6E82.w,X		; DE 82 6E
	cmp $97.b,S		; C3 97
	phk		; 4B
	eor $AC.b		; 45 AC
	cmp $6433.w,Y		; D9 33 64
	cpy $4297.w		; CC 97 42
	eor $6809.w,X		; 5D 09 68
	mvp $04,$63		; 44 63 04
	cmp ($0E.b),Y		; D1 0E
	bvc   1.b		; 50 01
	and $92.b		; 25 92
	cli		; 58
	jsl $FB3822.l		; 22 22 38 FB
	mvp $E3,$08		; 44 08 E3
	stx $16.b,Y		; 96 16
	asl $08.b,X		; 16 08
	dey		; 88
	bit #$24.b		; 89 24
	ora ($41.b)		; 12 41
	lda ($C1.b)		; B2 C1
	inc $BE24.w,X		; FE 24 BE
	bit $B5.b		; 24 B5
	cmp ($FA.b,X)		; C1 FA
	bpl -12.b		; 10 F4
	eor $22E244.l		; 4F 44 E2 22
	and $8B.b,S		; 23 8B
	clv		; B8
	rti		; 40

	stx $A129.w		; 8E 29 A1
	lsr $85.b		; 46 85
	ora $CD91.w,Y		; 19 91 CD
	stx $646C.w		; 8E 6C 64
	mvp $82,$65		; 44 65 82
	stz $87.b		; 64 87
	bit $20.b		; 24 20
	cmp $58.b,X		; D5 58
	cmp ($24.b,X)		; C1 24
	trb $93.b		; 14 93
	cmp $8004.w		; CD 04 80
	ora $90.b		; 05 90
	sbc ($BA.b,X)		; E1 BA
	and $00.b		; 25 00
	ora #$04.b		; 09 04
	jmp ($F76B.w)		; 6C 6B F7
	pld		; 2B
	ldy $8380.w		; AC 80 83
	sec		; 38
	tay		; A8
	bra  96.b		; 80 60
	dex		; CA
	sec		; 38
	cpy #$DE01.w		; C0 01 DE
	phy		; 5A
	sbc $1D672D.l		; EF 2D 67 1D
	cmp $5458.w,Y		; D9 58 54
	mvn $11,$61		; 54 61 11
	ldy $CB.b,X		; B4 CB
	pei ($96.b)		; D4 96
	bvc   0.b		; 50 00
	eor $20.b,X		; 55 20
	eor ($18.b,X)		; 41 18
	plp		; 28
	brk $15.b		; 00 15
	.db $42, $42		; 42 42
	.db $42, $0B		; 42 0B
	eor $6C.b		; 45 6C
	sta [$00.b]		; 87 00
	tsb $72B9.w		; 0C B9 72
	sbc $CA.b		; E5 CA
	tsa		; 3B
	ora $99.b,S		; 03 99
	sty $71.b,X		; 94 71
	stx $5831.w		; 8E 31 58
	sty $9EAC.w		; 8C AC 9E
	cpx $92.b		; E4 92
	stz $51.b		; 64 51
	stz $FF5E.w		; 9C 5E FF
	sta $1F6FDF.l,X		; 9F DF 6F 1F
	adc $872D.w,X		; 7D 2D 87
.ACCU 16
.INDEX 16
	rep #$3E		; C2 3E
	xce		; FB
	tsx		; BA
	ldx $13.b,Y		; B6 13
	ora $B6C47D.l,X		; 1F 7D C4 B6
	ora $F7C1.w,X		; 1D C1 F7
	jmp.w [$615B]		; DC 5B 61
	sbc ($8F.b,S),Y		; F3 8F
	ldx $EDEE.w,Y		; BE EE ED
	sta [$7E.b]		; 87 7E
	adc $DDF6.w,X		; 7D F6 DD
	bcs -100.b		; B0 9C
	xce		; FB
	sbc $61CB.w		; ED CB 61
	sei		; 78
	inc $B8.b		; E6 B8
	dec $C3.b,X		; D6 C3
	sbc ($1C.b,X)		; E1 1C
	cmp [$26.b],Y		; D7 26
	cld		; D8
	jmp $5F73.w		; 4C 73 5F
	tda		; 7B
	jmp ($833B.w)		; 6C 3B 83
	txs		; 9A
	sbc $CE87ED.l		; EF ED 87 CE
	and $5BAF.w,Y		; 39 AF 5B
	jmp ($F33B.w)		; 6C 3B F3
	txs		; 9A
	sbc $D6.b,X		; F5 D6
.ACCU 16
.INDEX 16
	rep #$73		; C2 73
	txs		; 9A
	xce		; FB
	xce		; FB
	adc ($78.b,X)		; 61 78
	jsr ($C0AF.w,X)		; FC AF C0
	ldx $1F.b,Y		; B6 1F
	php		; 08
	jsr ($C1AF.w,X)		; FC AF C1
	ldx $13.b,Y		; B6 13
	ora $5BE195.l,X		; 1F 95 E1 5B
	asl $FCE0.w		; 0E E0 FC
	lda $1FB6C5.l		; AF C5 B6 1F
	sec		; 38
	jsr ($0EAF.w,X)		; FC AF 0E
	cld		; D8
	adc [$E7.b],Y		; 77 E7
	sbc $7B.b		; E5 7B
	tsa		; 3B
	adc ($39.b,X)		; 61 39
	sbc $D65E.w,Y		; F9 5E D6
	cld		; D8
	lsr $8F3A.w,X		; 5E 3A 8F
	adc $113E6C.l		; 6F 6C 3E 11
	pei ($7E.b)		; D4 7E
	and $98B0.w,X		; 3D B0 98
	nop		; EA
	and $77D826.l,X		; 3F 26 D8 77
	ora [$51.b]		; 07 51
	sbc $C336.w,Y		; F9 36 C3
	sbc $A3CE.w,Y		; F9 CE A3
	stp		; DB
	rep #$87		; C2 87
	sbc ($1D.b,S),Y		; F3 1D
	eor [$E3.b]		; 47 E3
	inc $E1.b,X		; F6 E1
	sbc ($0E.b,S),Y		; F3 0E
	lda $F2.b,S		; A3 F2
	adc $0280.w		; 6D 80 02
	jsl $9B7A53.l		; 22 53 7A 9B
	pei ($DE.b)		; D4 DE
	brk $60.b		; 00 60
	beq   4.b		; F0 04
	mvp $10,$11		; 44 11 10
	asl $0F.b		; 06 0F
	ldy $5A.b,X		; B4 5A
	bmi -38.b		; 30 DA
	inc $AD.b,X		; F6 AD
	tda		; 7B
	lsr $B1.b,X		; 56 B1
	stp		; DB
	cld		; D8
	ror $C2.b		; 66 C2
	phy		; 5A
	and $7061.w		; 2D 61 70
	clv		; B8
	phy		; 5A
	phy		; 5A
	cli		; 58
	tay		; A8
	.db $82, $AA, $28		; 82 AA 28
	.db $82, $22, $22		; 82 22 22
	jsl $254C38.l		; 22 38 4C 25
	ldy $4C3D.w		; AC 3D 4C
	and $384C.w,X		; 3D 4C 38
	lda $9B96.w		; AD 96 9B
	lsr $13.b		; 46 13
	ora $D3A6.w		; 0D A6 D3
	adc #$9191.w		; 69 91 91
	bpl   4.b		; 10 04
	mvp $10,$11		; 44 11 10
	asl $0F.b		; 06 0F
	brk $44.b		; 00 44
	eor ($11.b,X)		; 41 11
	brk $60.b		; 00 60
	beq   4.b		; F0 04
	mvp $10,$11		; 44 11 10
	asl $0F.b		; 06 0F
	bcc -112.b		; 90 90
	lda ($4F.b)		; B2 4F
	adc ($4F.b)		; 72 4F
	adc ($4C.b)		; 72 4C
	lsr $D5.b,X		; 56 D5
	sta [$6C.b],Y		; 97 6C
	bit $24.b		; 24 24
	lda ($B1.b),Y		; B1 B1
	lda ($C2.b),Y		; B1 C2
	sbc ($6A.b,X)		; E1 6A
	eor ($05.b),Y		; 51 05
	mvn $04,$51		; 54 51 04
	mvp $44,$44		; 44 44 44
	eor ($05.b),Y		; 51 05
	mvn $04,$51		; 54 51 04
	mvp $44,$44		; 44 44 44
	rti		; 40

	ora ($72.b)		; 12 72
	adc ($2C.b)		; 72 2C
	phy		; 5A
	bvc   5.b		; 50 05
	eor $99.b,X		; 55 99
	sta $80BC.w,Y		; 99 BC 80
	jsl $808820.l		; 22 20 88 80
	bmi 120.b		; 30 78
	ora $45.b		; 05 45
	eor $46.b		; 45 46
	adc $F419.w,X		; 7D 19 F4
	adc [$D0.b]		; 67 D0
	ora ($54.b,X)		; 01 54
	ora $5E75EC.l,X		; 1F EC 75 5E
	cmp [$55.b]		; C7 55
	cmp ($DE.b)		; D2 DE
	stz $B7.b,X		; 74 B7
	sta $E72D.w,X		; 9D 2D E7
	phk		; 4B
	adc $DED2.w,Y		; 79 D2 DE
	stz $B7.b,X		; 74 B7
	stx $B6DB.w		; 8E DB B6
	pei ($D4.b)		; D4 D4
	pei ($D4.b)		; D4 D4
	pei ($D5.b)		; D4 D5
	rol $09.b,X		; 36 09
	bcs  77.b		; B0 4D
	dec $9D9B.w		; CE 9B 9D
	and ($3A.b,S),Y		; 33 3A
	dec $6CB5.w		; CE B5 6C
	cmp $B3.b,X		; D5 B3
	lsr $3FCD.w		; 4E CD 3F
	ply		; 7A
	and $BD8F7A.l,X		; 3F 7A 8F BD
	eor [$6A.b]		; 47 6A
	ror $B4.b,X		; 76 B4
	dec $F5A6.w,X		; DE A6 F5
	and [$BF.b],Y		; 37 BF
	and [$59.b],Y		; 37 59
	sbc $CFBA.w,Y		; F9 BA CF
	cmp $7BD6.w		; CD D6 7B
	ora $B157.w,X		; 1D 57 B1
	cmp $30.b,X		; D5 30
	eor [$4D.b],Y		; 57 4D
	sbc #$37BD.w		; E9 BD 37
	adc $11DB.w		; 6D DB 11
	trb $1DAC.w		; 1C AC 1D
	ror $BC0C.w,X		; 7E 0C BC
	ora $3F78.w,Y		; 19 78 3F
	rtl		; 6B

	ora $05.b,S		; 03 05
	rts		; 60

	lda ($99.b,S),Y		; B3 99
	eor $9CBD32.l,X		; 5F 32 BD 9C
	tsa		; 3B
	and ($33.b,S),Y		; 33 33
	bcs  33.b		; B0 21
	asl $84.b,X		; 16 84
	phk		; 4B
	cmp $D2.b		; C5 D2
	sbc #$1DDA.w		; E9 DA 1D
	lda $02.b,S		; A3 02
	.db $62, $22, $62		; 62 22 62
	tya		; 98
	ldx $29.b		; A6 29
	ldy $6D.b,X		; B4 6D
	bmi  38.b		; 30 26
	jsl $E9D225.l		; 22 25 D2 E9
	stz $C0.b,X		; 74 C0
	rts		; 60

	inc A		; 1A
	clc		; 18
	lda ($69.b),Y		; B1 69
	ror A		; 6A
	ror A		; 6A
	bvs -85.b		; 70 AB
	tsa		; 3B
	and ($34.b,S),Y		; 33 34
	cmp [$A6.b],Y		; D7 A6
	tyx		; BB
	and $D9.b,X		; 35 D9
	lda $224C.w		; AD 4C 22
	dec A		; 3A
	dec A		; 3A
	phy		; 5A
	dec A		; 3A
	phy		; 5A
	dec A		; 3A
	eor $99DA.w,Y		; 59 DA 99
	phx		; DA
	sty $A415.w		; 8C 15 A4
	sbc #$4E3A.w		; E9 3A 4E
	lda $A8.b,S		; A3 A8
	jsl $D99A39.l		; 22 39 9A D9
	txs		; 9A
	phx		; DA
	dec A		; 3A
	jmp $F33E4D.l		; 5C 4D 3E F3
	eor $B582.w		; 4D 82 B5
	sta $4967.w,X		; 9D 67 49
	cmp ($B3.b,S),Y		; D3 B3
	lsr $97ED.w		; 4E ED 97
	plb		; AB
	txs		; 9A
	lda $9EAB.w,Y		; B9 AB 9E
	ldx $B7.b,Y		; B6 B7
	adc ($DC.b),Y		; 71 DC
	tax		; AA
	dex		; CA
	rtl		; 6B

	sta $AE71.w		; 8D 71 AE
	txa		; 8A
	dex		; CA
	cmp $71C3.w		; CD C3 71
	sta $1281.w,X		; 9D 81 12
	adc ($12.b),Y		; 71 12
	cmp ($68.b),Y		; D1 68
	sty $CB.b,X		; 94 CB
	and ($D8.b)		; 32 D8
	ora ($11.b,S),Y		; 13 11
	ora ($C2.b)		; 12 C2
	rep #$C2		; C2 C2
	rep #$CA		; C2 CA
	phy		; 5A
	stz $9B2D.w		; 9C 2D 9B
	stx $7B.b,Y		; 96 7B
	stx $36.b,Y		; 96 36
	pld		; 2B
	adc $DABA.w,Y		; 79 BA DA
	adc $E571.w		; 6D 71 E5
	sbc $C9.b,S		; E3 C9
	cmp [$93.b]		; C7 93
	stx $C471.w		; 8E 71 C4
	eor [$33.b]		; 47 33
	tad		; 5B
	and ($5B.b,S),Y		; 33 5B
	eor [$4B.b]		; 47 4B
	bit #$C4A7.w		; 89 A7 C4
	cmp ($60.b,S),Y		; D3 60
	lda $5967.w		; AD 67 59
	cmp ($74.b)		; D2 74
	cmp $FA3C.w,X		; DD 3C FA
	and ($E8.b,S),Y		; 33 E8
	cmp $8C3EA3.l		; CF A3 3E 8C
	plx		; FA
	and ($E8.b,S),Y		; 33 E8
	cmp $8A3EA3.l		; CF A3 3E 8A
	ldy #$F34F.w		; A0 4F F3
	sbc $7F.b,X		; F5 7F
	sta $75E9AC.l,X		; 9F AC E9 75
	sta $B32E.w,X		; 9D 2E B3
	lda $FA.b		; A5 FA
	cmp $DD2B.w,X		; DD 2B DD
	pld		; 2B
	cmp $D9E7.w		; CD E7 D9
	lda ($D9.b,S),Y		; B3 D9
	lda $D9AFD9.l		; AF D9 AF D9
	cmp $EC.b,S		; C3 EC
	cmp $D3.b,X		; D5 D3
	plb		; AB
	lda [$4F.b]		; A7 4F
	eor $3381.w		; 4D 81 33
	lda $3B.b,X		; B5 3B
	eor ($B5.b,S),Y		; 53 B5
	and [$66.b],Y		; 37 66
	cpx $97DD.w		; EC DD 97
	phd		; 0B
	sty $9B09.w		; 8C 09 9B
	lsr $D1.b		; 46 D1
	ldy $74.b,X		; B4 74
	asl $D081.w		; 0E 81 D0
	dec A		; 3A
	ora [$41.b]		; 07 41
	sta ($33.b,X)		; 81 33
	pla		; 68
	cld		; D8
	rol $0C.b,X		; 36 0C
	asl $03.b		; 06 03
	sty $72.b,X		; 94 72
	stx $0253.w		; 8E 53 02
	ror $03.b		; 66 03
	sty $72.b,X		; 94 72
	sta $5043.w		; 8D 43 50
	ldy $2F5E.w,X		; BC 5E 2F
	lsr $D6.b,X		; 56 D6
	cld		; D8
	cld		; D8
	cmp ($92.b,X)		; C1 92
	cmp $D22C.w		; CD 2C D2
	eor $C424.w		; 4D 24 C4
	cpy $C4.b		; C4 C4
	cpy $D9.b		; C4 D9
	phx		; DA
	sta $99DA.w,Y		; 99 DA 99
	phx		; DA
	sta $99DA.w,Y		; 99 DA 99
	phx		; DA
	sty $EA.b,X		; 94 EA
	eor [$E2.b],Y		; 57 E2
	eor [$AC.b],Y		; 57 AC
	nop		; EA
	dec A		; 3A
	stx $A8A3.w		; 8E A3 A8
	nop		; EA
	eor $893FA9.l		; 4F A9 3F 89
	and [$89.b],Y		; 37 89
	lda $BD.b,X		; B5 BD
	inx		; E8
	lsr $BDDA.w,X		; 5E DA BD
	sbc $9F5D.w		; ED 5D 9F
	sta $3E.b,X		; 95 3E
	ldy $DC.b		; A4 DC
	sbc #$FD9A.w		; E9 9A FD
	cmp $B077.w,X		; DD 77 B0
	dec $76C3.w,X		; DE C3 76
	ldx $3E55.w		; AE 55 3E
	and $113B.w,X		; 3D 3B 11
	dec $77.b,X		; D6 77
	ora $71C7.w,X		; 1D C7 71
	jmp.w [$1D77]		; DC 77 1D
	cmp [$71.b]		; C7 71
	jmp.w [$0D37]		; DC 37 0D
	cmp $70.b,S		; C3 70
	jmp.w [$0D37]		; DC 37 0D
	cmp $FB.b,S		; C3 FB
	cmp $4C60EF.l		; CF EF 60 4C
	cpx #$031C.w		; E0 1C 03
	bra 112.b		; 80 70
	asl $CBBC.w		; 0E BC CB
	and $25.b		; 25 25
	rts		; 60

	jmp $B0B0.w		; 4C B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	inc $1C.b		; E6 1C
	dec $04.b		; C6 04
	dec $C739.w		; CE 39 C7
	sec		; 38
	sbc [$1C.b]		; E7 1C
	sbc $9C.b,S		; E3 9C
	adc ($8E.b,S),Y		; 73 8E
	adc ($FF.b),Y		; 71 FF
	rol $9D.b		; 26 9D
	dec A		; 3A
	sty $F3.b,X		; 94 F3
	tax		; AA
	cmp ($57.b,X)		; C1 57
	lsr A		; 4A
	lda [$0F.b]		; A7 0F
	lda $85.b,X		; B5 85
	sta $7ACFDD.l,X		; 9F DD CF 7A
	rtl		; 6B

	cmp ($5D.b,S),Y		; D3 5D
	lda $BBCA.w,X		; BD CA BB
	dex		; CA
	tyx		; BB
	lda ($6B.b),Y		; B1 6B
	adc $3E.b,S		; 63 3E
	sty $33FA.w		; 8C FA 33
	inx		; E8
	cmp $8C3EA3.l		; CF A3 3E 8C
	plx		; FA
	and ($E8.b,S),Y		; 33 E8
	cmp $13A8A2.l		; CF A2 A8 13
	sbc [$5E.b]		; E7 5E
	sbc [$5E.b]		; E7 5E
	pei ($BD.b)		; D4 BD
	lda #$0A7A.w		; A9 7A 0A
	dec $D342.w,X		; DE 42 D3
	cmp ($A7.b,S),Y		; D3 A7
	lda [$4F.b]		; A7 4F
	lsr $9D9E.w		; 4E 9E 9D
	and $5A3A.w,X		; 3D 3A 5A
	lsr $0293.w,X		; 5E 93 02
	rti		; 40

	jmp $240739.l		; 5C 39 07 24
	cpx $9C.b		; E4 9C
	lda ($18.b,X)		; A1 18
	trb $03.b		; 14 03
	ldy $3B.b,X		; B4 3B
	.db $42, $E9		; 42 E9
	stz $BC.b,X		; 74 BC
	and $02.b,S		; 23 02
	bra 102.b		; 80 66
	sta $29A6.w,Y		; 99 A6 29
	txa		; 8A
	.db $62, $88, $C0		; 62 88 C0
	lda ($D0.b),Y		; B1 D0
	dec A		; 3A
	ora [$40.b]		; 07 40
	inx		; E8
	ora $A003.w,X		; 1D 03 A0
	adc $4C1B.w		; 6D 1B 4C
	ora #$869A.w		; 09 9A 86
	lda ($A8.b,X)		; A1 A8
	ror A		; 6A
	tas		; 1B
	sbc $7C.b,S		; E3 7C
	adc $04D68C.l		; 6F 8C D6 04
	cmp #$8989.w		; C9 89 89
	bit #$8989.w		; 89 89 89
	bit #$D889.w		; 89 89 D8
	ora ($26.b,S),Y		; 13 26
	rol $26.b		; 26 26
	rol $26.b		; 26 26
	rol $26.b		; 26 26
	rol $AF.b		; 26 AF
	lda ($4B.b,X)		; A1 4B
	eor ($53.b,S),Y		; 53 53
	clv		; B8
	inc $8A3B.w		; EE 3B 8A
	dec $2FF1.w,X		; DE F1 2F
	ror A		; 6A
	eor $BBD4.w,X		; 5D D4 BB
	lda #$A98B.w		; A9 8B A9
	phb		; 8B
	lda #$A88B.w		; A9 8B A8
	ror A		; 6A
	lsr $C0CE.w		; 4E CE C0
	sta $1D.b		; 85 1D
	asl A		; 0A
	and $D9E6.w,Y		; 39 E6 D9
	ldx $61.b,Y		; B6 61
	bmi -104.b		; 30 98
	eor $BDE931.l		; 4F 31 E9 BD
	and [$A6.b],Y		; 37 A6
	sbc ($DE.b,S),Y		; F3 DE
	tda		; 7B
	asl $2D.b,X		; 16 2D
	asl $B1.b		; 06 B1
	ldy $CE74.w		; AC 74 CE
	adc $22CF.w,Y		; 79 CF 22
	mvp $81,$A1		; 44 A1 81
	rol $6871.w		; 2E 71 68
	sbc [$C7.b],Y		; F7 C7
	xba		; EB
	sta $9965AE.l,X		; 9F AE 65 99
	adc [$5E.b]		; 67 5E
	adc $4C.b,X		; 75 4C
	ora #$C39C.w		; 09 9C C3
	tya		; 98
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	cpy #$C799.w		; C0 99 C7
	sec		; 38
	sbc [$1C.b]		; E7 1C
	sbc $9C.b,S		; E3 9C
	adc ($8E.b,S),Y		; 73 8E
	adc ($CE.b),Y		; 71 CE
	and $6D6D.w,X		; 3D 6D 6D
	sta $198C.w		; 8D 8C 19
	and $845E42.l		; 2F 42 5E 84
	txy		; 9B
	adc ($6D.b)		; 72 6D
	tya		; 98
	jmp $1326.w		; 4C 26 13
	cpy $A3CF.w		; CC CF A3
	rol $FA8C.w,X		; 3E 8C FA
	and ($E8.b,S),Y		; 33 E8
	cmp $2AAAA2.l		; CF A2 AA 2A
	lda $D0.b,S		; A3 D0
	ldx #$37A8.w		; A2 A8 37
	rol $FAAC.w,X		; 3E AC FA
	lda ($EA.b,S),Y		; B3 EA
	dec $DE42.w,X		; DE 42 DE
	sta $C3.b,S		; 83 C3
	ldy $D2.b		; A4 D2
	cmp ($D2.b)		; D2 D2
	cmp ($D2.b)		; D2 D2
	cmp ($A8.b)		; D2 A8
	bmi 120.b		; 30 78
	plp		; 28
	dey		; 88
	dey		; 88
	txa		; 8A
	sta $07.b,S		; 83 07
	.db $82, $88, $88		; 82 88 88
	dey		; 88
	tay		; A8
	bmi 120.b		; 30 78
	plp		; 28
	dey		; 88
	dey		; 88
	sty $010A.w		; 8C 0A 01
	and $7439.w,Y		; 39 39 74
	tsx		; BA
	eor $8111.w,X		; 5D 11 81
	rti		; 40

	rol $26.b		; 26 26
	and $25.b		; 25 25
	and $11.b		; 25 11
	sta ($40.b,X)		; 81 40
	and $0D.b,X		; 35 0D
	eor $48.b,S		; 43 48
	cmp ($34.b)		; D2 34
	sty $60.b		; 84 60
	eor ($49.b)		; 52 49
	ora $4C33.w		; 0D 33 4C
	cmp ($35.b)		; D2 35
	sta $1B61.w		; 8D 61 1B
	asl $87.b,X		; 16 87
	eor #$74D2.w		; 49 D2 74
	sta $4927.w,X		; 9D 27 49
	cmp ($74.b)		; D2 74
	txa		; 8A
	ora $4823.w		; 0D 23 48
	cmp ($34.b)		; D2 34
	sta $4823.w		; 8D 23 48
	cmp ($70.b)		; D2 70
	tsa		; 3B
	asl $B4D3.w		; 0E D3 B4
	sbc $E33D.w		; ED 3D E3
	dec $C459.w,X		; DE 59 C4
	and $C99048.l,X		; 3F 48 90 C9
	and ($4C.b)		; 32 4C
	sta ($BC.b,S),Y		; 93 BC
	tsa		; 3B
	cmp #$C63B.w		; C9 3B C6
	tsb $40.b		; 04 40
	bcs -80.b		; B0 B0
	bcs  68.b		; B0 44
	lsr $05.b		; 46 05
	brk $E3.b		; 00 E3
	sta $D779.w,X		; 9D 79 D7
	sta ($92.b)		; 92 92
	dey		; 88
	cpy #$1AA0.w		; C0 A0 1A
	ror $99.b		; 66 99
	ldy $6B.b		; A4 6B
	inc A		; 1A
.ACCU 16
	rep #$2B		; C2 2B
	cpx $D1.b		; E4 D1
	cpx $D1.b		; E4 D1
	cop $19.b		; 02 19
	sbc $67.b,X		; F5 67
	cmp $9F.b,X		; D5 9F
	lsr $7D.b,X		; 56 7D
	eor $67F5.w,Y		; 59 F5 67
	cmp $9F.b,X		; D5 9F
	lsr $7D.b,X		; 56 7D
	rti		; 40

	asl $E8.b		; 06 E8
	sty $94.b,X		; 94 94
	brk $15.b		; 00 15
	eor #$4949.w		; 49 49 49
	pha		; 48
	ora ($A0.b)		; 12 A0
	brk $15.b		; 00 15
	eor $2462.w		; 4D 62 24
	pha		; 48
	ora $2955.w,Y		; 19 55 29
	bmi -103.b		; 30 99
	ldy $0C.b		; A4 0C
	tax		; AA
	tya		; 98
	inc $51.b		; E6 51
	stz $CA40.w		; 9C 40 CA
	lda #$EA03.w		; A9 03 EA
	ldy $08.b		; A4 08
	bcs 120.b		; B0 78
	plp		; 28
	dey		; 88
	dey		; 88
	txa		; 8A
	sta $07.b,S		; 83 07
	.db $82, $88, $88		; 82 88 88
	dey		; 88
	tay		; A8
	bmi 120.b		; 30 78
	plp		; 28
	dey		; 88
	dey		; 88
	txa		; 8A
	cmp #$0723.w		; C9 23 07
	sta $88.b		; 85 88
	dey		; 88
	dey		; 88
	txa		; 8A
	tsx		; BA
	lsr $A493.w		; 4E 93 A4
	bne -48.b		; D0 D0
	bne -96.b		; D0 A0
	adc #$461A.w		; 69 1A 46
	sta ($41.b),Y		; 91 41
	eor ($40.b,X)		; 41 40
	lda $479C.w		; AD 9C 47
	ldy $1B76.w,X		; BC 76 1B
	lda $50E5.w		; AD E5 50
	sta ($BC.b,S),Y		; 93 BC
	tsa		; 3B
	cmp $60.b,S		; C3 60
	tsx		; BA
	lsr $5011.w,X		; 5E 11 50
	rts		; 60

	beq  81.b		; F0 51
	ora ($11.b),Y		; 11 11
	ora $06.b,X		; 15 06
	ora $111105.l		; 0F 05 11 11
	ora ($50.b),Y		; 11 50
	rts		; 60

	beq  81.b		; F0 51
	ora ($11.b),Y		; 11 11
	ora $A2.b,X		; 15 A2
	tsb $43.b		; 04 43
	rol $FAAC.w,X		; 3E AC FA
	lda ($EA.b,S),Y		; B3 EA
	cmp $AC3EAB.l		; CF AB 3E AC
	plx		; FA
	lda ($EA.b,S),Y		; B3 EA
	stx $20.b		; 86 20
	tsb $E53D.w		; 0C 3D E5
	trb $3723.w		; 1C 23 37
	phb		; 8B
	sbc $69CE.w,X		; FD CE 69
	sbc $6CC9.w,X		; FD C9 6C
	rol $FD49.w,X		; 3E 49 FD
	dec $D8EA.w		; CE EA D8
	adc $CEFD21.l,X		; 7F 21 FD CE
	and $B0.b		; 25 B0
	plx		; FA
	ora [$F7.b]		; 07 F7
	sec		; 38
	ldx $C3.b,Y		; B6 C3
	bit $FC.b,X		; 34 FC
	rol $D8EE.w		; 2E EE D8
	jmp ($F093.w,X)		; 7C 93 F0
	ldx $ED.b,Y		; B6 ED
	sta [$F2.b]		; 87 F2
	ora $6CB985.l,X		; 1F 85 B9 6C
	rol $F881.w,X		; 3E 81 F8
	jmp $9A616B.l		; 5C 6B 61 9A
	adc $6C939B.l,X		; 7F 9B 93 6C
	rol $FE49.w,X		; 3E 49 FE
	adc $1FB6BD.l		; 6F BD B6 1F
	iny		; C8
	adc $B6BF9B.l,X		; 7F 9B BF B6
	ora $37FF40.l,X		; 1F 40 FF 37
	lda $19B6.w		; AD B6 19
	lda [$FB.b]		; A7 FB
	and $B075.w,X		; 3D 75 B0
	sbc $FB27.w,Y		; F9 27 FB
	rol $D8FE.w,X		; 3E FE D8
	adc $CFFE21.l,X		; 7F 21 FE CF
	cpy #$1FB6.w		; C0 B6 1F
	rti		; 40

	sbc $DBE067.l,X		; FF 67 E0 DB
	jsr $0DB6.w		; 20 B6 0D
	brk $05.b		; 00 05
	cli		; 58
	lda ($70.b),Y		; B1 70
	jsr $5B01.w		; 20 01 5B
	tad		; 5B
	stx $08.b		; 86 08
	jmp.w [$0600]		; DC 00 06
	ldx $BB.b,Y		; B6 BB
	eor $62A7.w		; 4D A7 62
.ACCU 16
	rep #$62		; C2 62
	pla		; 68
	stz $49.b,X		; 74 49
	bra -40.b		; 80 D8
	brk $08.b		; 00 08
	sta ($23.b),Y		; 91 23
	ora $6F.b,X		; 15 6F
	dey		; 88
	tax		; AA
	dey		; 88
	sta ($7C.b,X)		; 81 7C
	sta $D5.b,S		; 83 D5
	cld		; D8
	jsl $591B46.l		; 22 46 1B 59
	sta $93.b,X		; 95 93
	lsr $48.b,X		; 56 48
	rtl		; 6B

	ldy #$3101.w		; A0 01 31
	and ($9B.b),Y		; 31 9B
	and $8D.b,X		; 35 8D
	txy		; 9B
	rts		; 60

	brk $C1.b		; 00 C1
	ldy #$8800.w		; A0 00 88
	and $A3.b,S		; 23 A3
	ldy $00.b		; A4 00
	ora $C1.b,X		; 15 C1
	ldy #$5901.w		; A0 01 59
	eor $AB72.w,Y		; 59 72 AB
	sta $5C.b,X		; 95 5C
	tay		; A8
	bra -115.b		; 80 8D
	sta ($3E.b,X)		; 81 3E
	adc $CC.b,S		; 63 CC
	adc $318F.w,Y		; 79 8F 31
	inc $3C.b		; E6 3C
	cmp [$98.b]		; C7 98
	cpx #$DC69.w		; E0 69 DC
	stx $77E4.w		; 8E E4 77
	and $B9.b,S		; 23 B9
	ora $3ECA.w,X		; 1D CA 3E
	cmp $741B.w,X		; DD 1B 74
	adc $F9CD.w		; 6D CD F9
	rol $D7.b		; 26 D7
	txy		; 9B
	lsr $796D.w,X		; 5E 6D 79
	lda $E7.b,X		; B5 E7
	cmp [$9F.b],Y		; D7 9F
	sta ($F2.b)		; 92 F2
	eor $6083.w		; 4D 83 60
	cld		; D8
	rol $0D.b,X		; 36 0D
	sta $60.b,S		; 83 60
	cld		; D8
	rol $1B.b,X		; 36 1B
	sbc $FBF6.w		; ED F6 FB
	adc $DFBE.w,X		; 7D BE DF
	adc $C3CCB7.l		; 6F B7 CC C3
	bit $CD.b,X		; 34 CD
	and ($4C.b,S),Y		; 33 4C
	cmp ($34.b,S),Y		; D3 34
	tya		; 98
	sta $75D6.w,Y		; 99 D6 75
	eor $5557.w,X		; 5D 57 55
	cmp $75.b,X		; D5 75
	cli		; 58
	lda ($37.b),Y		; B1 37
	dec $69.b		; C6 69
	txs		; 9A
	ror $99.b		; 66 99
	ldx $69.b		; A6 69
	ldx #$BC68.w		; A2 68 BC
	sbc [$55.b],Y		; F7 55
	cmp $75.b,X		; D5 75
	eor $5557.w,X		; 5D 57 55
	cmp ($74.b)		; D2 74
	lda [$9E.b]		; A7 9E
	adc #$9EE6.w		; 69 E6 9E
	adc #$9EE6.w		; 69 E6 9E
	pea $A7F7.w		; F4 F7 A7
	lda $DF3E.w,X		; BD 3E DF
	and [$6F.b]		; 27 6F
	sta ($B7.b,S),Y		; 93 B7
	cmp #$E4DB.w		; C9 DB E4
	sbc $76F2.w		; ED F2 76
	sbc $3E3D.w,Y		; F9 3D 3E
	eor $45.b,S		; 43 45
	bvs  39.b		; 70 27
	lda ($95.b,S),Y		; B3 95
	lda ($95.b,S),Y		; B3 95
	lda ($95.b,S),Y		; B3 95
	lda ($95.b,S),Y		; B3 95
	lda ($95.b,S),Y		; B3 95
	lda ($95.b,S),Y		; B3 95
	iny		; C8
	cmp $9067E4.l		; CF E4 67 90
	ora ($B0.b),Y		; 11 B0
	and [$81.b]		; 27 81
	cpy #$79E0.w		; C0 E0 79
	sta $3CE631.l		; 8F 31 E6 3C
	cmp [$98.b]		; C7 98
	sbc ($DC.b,X)		; E1 DC
	plb		; AB
	ror $BAAD.w		; 6E AD BA
	lda [$2A.b],Y		; B7 2A
	jmp.w [$72A7]		; DC A7 72
	sta $77CA.w,X		; 9D CA 77
	rol $AC.b,X		; 36 AC
	jmp ($9F6C.w)		; 6C 6C 9F
	pea $FA4D.w		; F4 4D FA
	rol $FC.b		; 26 FC
	sta ($7E.b,S),Y		; 93 7E
	eor #$21BF.w		; 49 BF 21
	bcs 108.b		; B0 6C
	tas		; 1B
	asl $C1.b		; 06 C1
	bcs 108.b		; B0 6C
	tas		; 1B
	asl $C3.b		; 06 C3
	adc $DFBE.w,X		; 7D BE DF
	adc $EDDBB7.l		; 6F B7 DB ED
	inc $F9.b,X		; F6 F9
	jmp ($5FBE.w,X)		; 7C BE 5F
	and ($0C.b,S),Y		; 33 0C
	cmp $30.b,S		; C3 30
	cpy $1D33.w		; CC 33 1D
	sta [$61.b]		; 87 61
	cld		; D8
	adc $9D.b,X		; 75 9D
	adc [$59.b]		; 67 59
	dec $75.b,X		; D6 75
	ldy $BA.b		; A4 BA
	adc $18.b,S		; 63 18
	dec $F8.b		; C6 F8
	cmp $7CE31B.l,X		; DF 1B E3 7C
	adc $76DBAC.l		; 6F AC DB 76
	cmp $9EB7.w,X		; DD B7 9E
	sbc ($DE.b,S),Y		; F3 DE
	tda		; 7B
	cmp $1BEC79.l		; CF 79 EC 1B
	bit $4415.w,X		; 3C 15 44
	pea $474F.w		; F4 4F 47
	ora [$91.b],Y		; 17 91
	cpx #$7672.w		; E0 72 76
	sbc $7C3B.w,Y		; F9 3B 7C
	sta $4DBE.w,X		; 9D BE 4D
	bvs  39.b		; 70 27
	adc ($AE.b)		; 72 AE
	lsr $7F.b		; 46 7F
	and $3F.b,S		; 23 3F
	adc [$2B.b]		; 67 2B
	adc [$2B.b]		; 67 2B
	adc [$2B.b]		; 67 2B
	adc [$2B.b]		; 67 2B
	adc [$28.b]		; 67 28
	bra -115.b		; 80 8D
	sta $6C.b,S		; 83 6C
	.db $82, $70, $38		; 82 70 38
	trb $310F.w		; 1C 0F 31
	inc $38.b		; E6 38
	trb $060E.w		; 1C 0E 06
	sta $9EB3.w		; 8D B3 9E
	ror A		; 6A
	sta ($12.b)		; 92 12
	ora ($12.b)		; 12 12
	ora ($3C.b)		; 12 3C
	sta [$7C.b],Y		; 97 7C
	inc $B6.b		; E6 B6
	rol $36.b,X		; 36 36
	rol $36.b,X		; 36 36
	tas		; 1B
	asl $C1.b		; 06 C1
	bcs 108.b		; B0 6C
	tas		; 1B
	asl $C1.b		; 06 C1
	bcs 108.b		; B0 6C
	and [$DB.b],Y		; 37 DB
	sbc $FBF6.w		; ED F6 FB
	adc $DFBE.w,X		; 7D BE DF
	adc $131393.l		; 6F 93 13 13
	ora ($1C.b,S),Y		; 13 1C
	ora ($82.b,S),Y		; 13 82
	bvs  78.b		; 70 4E
	phd		; 0B
	asl $2C.b,X		; 16 2C
	cli		; 58
	ldy $96B7.w,X		; BC B7 96
	sbc ($DE.b)		; F2 DE
	eor $68A2.w,Y		; 59 A2 68
	txs		; 9A
	and $87.b		; 25 87
	bcs 123.b		; B0 7B
	ora [$B0.b]		; 07 B0
	tda		; 7B
	asl $A493.w		; 0E 93 A4
	sbc #$3D32.w		; E9 32 3D
	eor ($D5.b,S),Y		; 53 D5
	and $D553.w,X		; 3D 53 D5
	lsr $EC9E.w,X		; 5E 9E EC
	sbc [$67.b],Y		; F7 67
	tyx		; BB
	and $EDD9.w,X		; 3D D9 ED
	sei		; 78
	lsr $BC.b,X		; 56 BC
	pld		; 2B
	lsr $4313.w,X		; 5E 13 43
	eor $9A.b		; 45 9A
	eor $72.b,X		; 55 72
	tax		; AA
	sbc $61.b		; E5 61
	sbc $61.b		; E5 61
	sbc $61.b		; E5 61
	sbc $57.b		; E5 57
	cop $7C.b		; 02 7C
	sty $95FB.w		; 8C FB 95
	jmp $57E5AA.l		; 5C AA E5 57
	rol A		; 2A
	lda $CA55.w,Y		; B9 55 CA
	ldx $4054.w		; AE 54 40
	eor [$64.b]		; 47 64
	and $5776.w,X		; 3D 76 57
	adc $76.b		; 65 76
	eor [$66.b],Y		; 57 66
	tas		; 1B
	bmi -39.b		; 30 D9
	sta ($C0.b,X)		; 81 C0
	cpx #$30F7.w		; E0 F7 30
	tda		; 7B
	tya		; 98
	and $1ECC.w,X		; 3D CC 1E
	inc $0D.b		; E6 0D
	cpy $841B.w		; CC 1B 84
	sty $84.b		; 84 84
	sty $84.b		; 84 84
	asl $D8.b,X		; 16 D8
	cld		; D8
	cld		; D8
	cld		; D8
	cmp ($66.b,X)		; C1 66
	cmp ($B0.b,X)		; C1 B0
	jmp ($221D.w)		; 6C 1D 22
	rep #$C3		; C2 C3
	rti		; 40

	ldx $6FDF.w,Y		; BE DF 6F
	lda [$DD.b],Y		; B7 DD
	sbc $23.b,S		; E3 23
	and $E2.b,S		; 23 E2
	tsa		; 3B
	ora [$00.b]		; 07 00
	cpx #$031C.w		; E0 1C 03
	bra 112.b		; 80 70
	asl $7C01.w		; 0E 01 7C
	ldx $BAEB.w,Y		; BE EB BA
	inc $AEBB.w		; EE BB AE
	xba		; EB
	tsx		; BA
	inc $B0C3.w		; EE C3 B0
	adc ($0E.b,S),Y		; 73 0E
	adc ($CC.b,X)		; 61 CC
	and $3087.w,Y		; 39 87 30
	inc $1C.b		; E6 1C
	sta ($92.b,S),Y		; 93 92
	sbc $EF.b,X		; F5 EF
	lsr $EFF5.w,X		; 5E F5 EF
	lsr $EFF5.w,X		; 5E F5 EF
	lsr $0FF8.w,X		; 5E F8 0F
	sta ($6B.b,X)		; 81 6B
.ACCU 16
.INDEX 16
	rep #$B5		; C2 B5
	sbc ($4B.b,X)		; E1 4B
	cmp $97.b		; C5 97
	phb		; 8B
	and $2C5E16.l		; 2F 16 5E 2C
	stz $9E04.w,X		; 9E 04 9E
	asl $1E.b		; 06 1E
	lsr $1E.b,X		; 56 1E
	eor $7C.b,X		; 55 7C
	tax		; AA
	sbc $F255.w,Y		; F9 55 F2
	plb		; AB
	sbc $59.b		; E5 59
	dex		; CA
	lda ($95.b,S),Y		; B3 95
	jmp $AADC09.l		; 5C 09 DC AA
	sbc $57.b		; E5 57
	rol A		; 2A
	lda $CA55.w,Y		; B9 55 CA
	ldx $7255.w		; AE 55 72
	plb		; AB
	sta $10.b,X		; 95 10
	ora ($D3.b),Y		; 11 D3
	bne -89.b		; D0 A7
	sta $EA581D.l,X		; 9F 1D 58 EA
	cmp [$56.b]		; C7 56
	dec A		; 3A
	ldy $46.b,X		; B4 46
	sta [$9D.b]		; 87 9D
	eor $C6C63A.l,X		; 5F 3A C6 C6
	dec $C6.b		; C6 C6
	cmp [$EE.b]		; C7 EE
	ldy $1D.b,X		; B4 1D
	ora $58.b,S		; 03 58
	dec $35.b,X		; D6 35
	eor $2052.w		; 4D 52 20
	rol $9843.w		; 2E 43 98
	inc $39.b		; E6 39
	ldx $326B.w		; AE 6B 32
	lda ($8A.b,X)		; A1 8A
	.db $62, $98, $A7		; 62 98 A7
	jsr $CFAC.w		; 20 AC CF
	ora ($77.b,X)		; 01 77
	ora $71C7.w,X		; 1D C7 71
.ACCU 8
.INDEX 8
	sep #$B2		; E2 B2
	ldy $43A5.w,X		; BC A5 43
	jmp $CF35D7.l		; 5C D7 35 CF
	rts		; 60

	bne  47.b		; D0 2F
	bra -68.b		; 80 BC
	ora [$80.b]		; 07 80
	beq  30.b		; F0 1E
	lda #$F1.b		; A9 F1
	ora $4285.w,X		; 1D 85 42
	sbc ($70.b,X)		; E1 70
	clv		; B8
	adc $16.b,S		; 63 16
	bit #$40.b		; 89 40
	lsr $D39B.w,X		; 5E 9B D3
	ply		; 7A
	ror $85DB.w		; 6E DB 85
	lda $EF50.w		; AD 50 EF
	dec $EFF4.w		; CE F4 EF
	eor $9C6CCC.l		; 4F CC 6C 9C
	bra  23.b		; 80 17
	cmp #$7C.b		; C9 7C
	lda [$CB.b],Y		; B7 CB
	ply		; 7A
	cmp [$2D.b]		; C7 2D
.ACCU 8
	sep #$AA		; E2 AA
	pla		; 68
	eor [$A1.b],Y		; 57 A1
	lda ($99.b,X)		; A1 99
	ora $E4.b		; 05 E4
	eor $57.b,S		; 43 57
	iny		; C8
	cmp $B355E4.l		; CF E4 55 B3
	lsr $CD.b,X		; 56 CD
	tad		; 5B
	and $6C.b,X		; 35 6C
	cmp $F9.b,X		; D5 F9
	tax		; AA
	ldy $9380.w		; AC 80 93
	tsb $563D.w		; 0C 3D 56
	eor $65.b,X		; 55 65
	eor $D1AFA2.l,X		; 5F A2 AF D1
	lsr $3DD5.w		; 4E D5 3D
	ora $6187.w		; 0D 87 61
	cmp ($B7.b,X)		; C1 B7
	sta $6F.b,S		; 83 6F
	asl $E6.b		; 06 E6
	ora $76CE.w		; 0D CE 76
	asl $6075.w,X		; 1E 75 60
	ora $F3.b		; 05 F3
	bra 117.b		; 80 75
	inc $59.b		; E6 59
	cmp $3B.b		; C5 3B
	lda $57.b		; A5 57
	adc ($D7.b,X)		; 61 D7
	adc $CB8E.w,Y		; 79 8E CB
	iny		; C8
	jmp ($03D0.w,X)		; 7C D0 03
	bit $E4AC.w,X		; 3C AC E4
	clc		; 18
	ldx $29.b		; A6 29
	txa		; 8A
	tax		; AA
	sbc ($99.b)		; F2 99
	lsr $B82B.w,X		; 5E 2B B8
	inc $803B.w		; EE 3B 80
	asl $B9.b		; 06 B9
	ldx $9A6B.w		; AE 6B 9A
	inc $B9.b		; E6 B9
	ldx $F0AA.w		; AE AA F0
	asl $C003.w,X		; 1E 03 C0
	sei		; 78
	ora $00E001.l		; 0F 01 E0 00
	ora [$0B.b],Y		; 17 0B
	sta $C2.b		; 85 C2
	sbc ($70.b,X)		; E1 70
	clv		; B8
	tax		; AA
	pea $9BDE.w		; F4 DE 9B
	cmp ($7A.b,S),Y		; D3 7A
	adc $C9E94D.l		; 6F 4D E9 C9
	asl $E777.w		; 0E 77 E7
	ror $A777.w,X		; 7E 77 A7
	ply		; 7A
	adc [$A7.b],Y		; 77 A7
	adc $F96263.l,X		; 7F 63 62 F9
	and $6FF992.l		; 2F 92 F9 6F
	stx $F9.b,Y		; 96 F9
	adc $1B5C93.l		; 6F 93 5C 1B
	lda ($5E.b,X)		; A1 5E
	sta $7A.b		; 85 7A
	ora $DC.b,X		; 15 DC
	tax		; AA
	sbc $5C.b		; E5 5C
	txa		; 8A
	ldx $6A.b,Y		; B6 6A
	cmp $67AB.w,Y		; D9 AB 67
	and $673F67.l,X		; 3F 67 3F 67
	bit $8E80.w,X		; 3C 80 8E
	sty $81.b		; 84 81
	asl $82.b,X		; 16 82
	tsb $9C.b		; 04 9C
	sbc $ED0C.w		; ED 0C ED
	cop $0D.b		; 02 0D
	pha		; 48
	ora ($4B.b,S),Y		; 13 4B
	inc $41.b		; E6 41
	asl $A4.b		; 06 A4
	ora #$A4.b		; 09 A4
	php		; 08
	ldy $09.b		; A4 09
	ldx $79.b		; A6 79
	eor #$06.b		; 49 06
	ldy $09.b		; A4 09
	clv		; B8
	sed		; F8
	adc ($F0.b),Y		; 71 F0
	bcc 106.b		; 90 6A
	rti		; 40

	stx $45.b,Y		; 96 45
	stz $08.b		; 64 08
	dec $40.b,X		; D6 40
	rts		; 60

	bpl -112.b		; 10 90
	.db $42, $FB		; 42 FB
	brk $07.b		; 00 07
	asl $94.b		; 06 94
	brk $07.b		; 00 07
	asl $09.b		; 06 09
	ora $0C000A.l,X		; 1F 0A 00 0C
	phd		; 0B
	asl A		; 0A
	asl A		; 0A
	ora $0C04.w		; 0D 04 0C
	asl $0D0D.w		; 0E 0D 0D
	ora $100B0B.l		; 0F 0B 0B 10
	asl $110E.w		; 0E 0E 11
	ora $10120F.l		; 0F 0F 12 10
	bpl  19.b		; 10 13
	ora ($11.b),Y		; 11 11
	trb $02.b		; 14 02
	tsb $0515.w		; 0C 15 05
	tsb $1416.w		; 0C 16 14
	trb $17.b		; 14 17
	ora $15.b,X		; 15 15
	clc		; 18
	ora ($13.b,S),Y		; 13 13
	ora $1212.w,Y		; 19 12 12
	inc A		; 1A
	asl $16.b,X		; 16 16
	tas		; 1B
	ora [$17.b],Y		; 17 17
	ora $0B0F.w,X		; 1D 0F 0B
	asl $0C03.w,X		; 1E 03 0C
	ora $211D0C.l,X		; 1F 0C 1D 21
	ora ($06.b)		; 12 06
	jsl $231818.l		; 22 18 18 23
	asl $2419.w,X		; 1E 19 24
	inc A		; 1A
	inc A		; 1A
	and $1B.b		; 25 1B
	tas		; 1B
	rol $21.b		; 26 21
	ora $262327.l,X		; 1F 27 23 26
	plp		; 28
	and [$27.b]		; 27 27
	and #$22.b		; 29 22
	jsl $24242A.l		; 22 2A 24 24
	pld		; 2B
	and $25.b		; 25 25
	jsr $1C00.w		; 20 00 1C
	brk $08.b		; 00 08
	ora $22.b,S		; 03 22
	phd		; 0B
	asl A		; 0A
	ora ($0C.b,X)		; 01 0C
	rol A		; 2A
	bit $01.b		; 24 01
	jmp $281D.w		; 4C 1D 28
	plp		; 28
	and [$01.b]		; 27 01
	sty $252B.w		; 8C 2B 25
	ora [$1F.b]		; 07 1F
	ora ($0C.b,X)		; 01 0C
	rol A		; 2A
	bit $01.b		; 24 01
	jmp $281D.w		; 4C 1D 28
	plp		; 28
	plp		; 28
	ora ($8C.b,X)		; 01 8C
	pld		; 2B
	and $07.b		; 25 07
	tsb $2929.w		; 0C 29 29
	jsl $000B18.l		; 22 18 0B 00
	ora #$0C.b		; 09 0C
	brk $26.b		; 00 26
	xce		; FB
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	cop $08.b		; 02 08
	and ($6D.b,X)		; 21 6D
	bne   8.b		; D0 08
	ora ($28.b),Y		; 11 28
	asl $0A37.w		; 0E 37 0A
	sbc ($33.b,S),Y		; F3 33
	brk $33.b		; 00 33
	and ($00.b,S),Y		; 33 00
	bit $90.b		; 24 90
	cop $49.b		; 02 49
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $90.b		; 24 90
	cop $49.b		; 02 49
	ora ($4B.b)		; 12 4B
	dec $BDF7.w,X		; DE F7 BD
	sbc $EFF77B.l		; EF 7B F7 EF
	cmp $FD7EBF.l,X		; DF BF 7E FD
	xce		; FB
	dec $80F7.w,X		; DE F7 80
	and $F9FD7E.l,X		; 3F 7E FD F9
	bit $BA.b		; 24 BA
	rti		; 40

	.db $42, $FB		; 42 FB
	brk $07.b		; 00 07
	asl $EA.b		; 06 EA
	brk $07.b		; 00 07
	asl $01.b		; 06 01
	trb $02.b		; 14 02
	brk $2C.b		; 00 2C
	ora $02.b		; 05 02
	cop $06.b		; 02 06
	ora $05.b		; 05 05
	ora [$06.b]		; 07 06
	asl $08.b		; 06 08
	ora [$07.b]		; 07 07
	ora #$08.b		; 09 08
	php		; 08
	asl A		; 0A
	ora #$09.b		; 09 09
	phd		; 0B
	bit $0C65.w		; 2C 65 0C
	phd		; 0B
	bit $060D.w		; 2C 0D 06
	ora $0E.b		; 05 0E
	asl A		; 0A
	asl A		; 0A
	ora $102C3A.l		; 0F 3A 2C 10
	ora $2C1108.l		; 0F 08 11 2C
	adc $2C1112.l		; 6F 12 11 2C
	ora ($20.b,S),Y		; 13 20
	bit $2C14.w		; 2C 14 2C
	bpl  21.b		; 10 15
	bit $1613.w		; 2C 13 16
	bit $1769.w		; 2C 69 17
	eor ($2C.b,S),Y		; 53 2C
	jsr $1C00.w		; 20 00 1C
	brk $04.b		; 00 04
	ora $0A.b,S		; 03 0A
	ora #$06.b		; 09 06
	eor ($0C.b,S),Y		; 53 0C
	adc $2C.b,S		; 63 2C
	stz $16.b,X		; 74 16
	ora ($6E.b)		; 12 6E
	trb $07.b		; 14 07
	mvp $2C,$16		; 44 16 2C
	adc ($2C.b,S),Y		; 73 2C
	stz $2C.b,X		; 74 2C
	adc ($2C.b,X)		; 61 2C
	ror $632C.w		; 6E 2C 63
	tsb $2813.w		; 0C 13 28
	bit $166D.w		; 2C 6D 16
	bit $0C6C.w		; 2C 6C 0C
	adc ($2C.b,S),Y		; 73 2C
	and #$2C.b		; 29 2C
	ora $0D070A.l		; 0F 0A 07 0D
	cop $50.b		; 02 50
	plp		; 28
	adc ($28.b)		; 72 28
	adc $28.b		; 65 28
	adc ($28.b,S),Y		; 73 28
	adc ($28.b,S),Y		; 73 28
	jsr $6128.w		; 20 28 61
	plp		; 28
	ror $7928.w		; 6E 28 79
	plp		; 28
	jsr $6228.w		; 20 28 62
	plp		; 28
	adc $28.b,X		; 75 28
	stz $28.b,X		; 74 28
	stz $28.b,X		; 74 28
	adc $286E28.l		; 6F 28 6E 28
	rol $0A28.w		; 2E 28 0A
	ora [$0D.b]		; 07 0D
	cop $59.b		; 02 59
	ora ($75.b)		; 12 75
	bit $1572.w		; 2C 72 15
	mvn $2C,$16		; 54 16 2C
	adc $100C.w		; 6D 0C 10
	ora $0C50.w		; 0D 50 0C
	ror $612C.w		; 6E 2C 61
	bit $2C6C.w		; 2C 6C 2C
	stz $2C.b,X		; 74 2C
	adc $0714.w,Y		; 79 14 07
	mvn $70,$12		; 54 12 70
	ora $17.b,X		; 15 17
	bvs  11.b		; 70 0B
	tsb $1464.w		; 0C 64 14
	ora $2C41.w		; 0D 41 2C
	ror $2C.b,X		; 76 2C
	adc [$15.b]		; 67 15
	ora [$70.b],Y		; 17 70
	phd		; 0B
	tsb $1464.w		; 0C 64 14
	ora $6317.w		; 0D 17 63
	ora ($72.b)		; 12 72
	tsb $0710.w		; 0C 10 07
	ora $54.b		; 05 54
	ora ($74.b)		; 12 74
	bit $2C61.w		; 2C 61 2C
	jmp ($1715.w)		; 6C 15 17
	adc $12.b,S		; 63 12
	adc ($0C.b)		; 72 0C
	ora $0E0E0E.l		; 0F 0E 0E 0E
	ora [$0D.b]		; 07 0D
	cop $00.b		; 02 00
	ora ($2C.b,X)		; 01 2C
	brk $00.b		; 00 00
	brk $8D.b		; 00 8D
	tsb $B9.b		; 04 B9
	ora ($00.b),Y		; 11 00
	jmp ($2529.w,X)		; 7C 29 25
	dec $5A.b,X		; D6 5A
	txs		; 9A
	ora $5F1D.w,Y		; 19 1D 5F
	lda $14.b		; A5 14
	brk $42.b		; 00 42
	rts		; 60

	adc $A57FFF.l		; 6F FF 7F A5
	trb $A5.b		; 14 A5
	trb $B5.b		; 14 B5
	lsr $FF.b,X		; 56 FF
	adc $FF6E24.l,X		; 7F 24 6E FF
	ora $7B.b,S		; 03 7B
	ora $F7.b,S		; 03 F7
	cop $73.b		; 02 73
	cop $EF.b		; 02 EF
	ora ($6B.b,X)		; 01 6B
	ora ($00.b,X)		; 01 00
	brk $A5.b		; 00 A5
	trb $4A.b		; 14 4A
	and #$EF.b		; 29 EF
	and $5294.w,X		; 3D 94 52
	phy		; 5A
	rtl		; 6B

	sbc $00407F.l,X		; FF 7F 40 00
	tsb $01.b		; 04 01
	bit $6E.b		; 24 6E
	sbc $735A7F.l,X		; FF 7F 5A 73
	lda $66.b,X		; B5 66
	bmi  90.b		; 30 5A
	ldy $294D.w		; AC 4D 29
	eor ($E6.b,X)		; 41 E6
	bit $84.b,X		; 34 84
	plp		; 28
	dec $7D.b,X		; D6 7D
	bpl 124.b		; 10 7C
	asl A		; 0A
	rts		; 60

	brk $00.b		; 00 00
	cmp $182351.l		; CF 51 23 18
	ldx $28.b		; A6 28
	bit $6E.b		; 24 6E
	brk $00.b		; 00 00
	cmp $0E3812.l,X		; DF 12 38 0E
	lda ($09.b)		; B2 09
	tsb $8505.w		; 0C 05 85
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $DF011F.l,X		; 7F 1F 01 DF
	ora ($DF.b)		; 12 DF
	ora ($B2.b)		; 12 B2
	ora #$B2.b		; 09 B2
	ora #$FF.b		; 09 FF
	adc $247FFF.l,X		; 7F FF 7F 24
	ror $6120.w		; 6E 20 61
	sbc $12DF7F.l,X		; FF 7F DF 12
	brk $00.b		; 00 00
	lda $51E902.l,X		; BF 02 E9 51
	bra  32.b		; 80 20
	rti		; 40

	bpl  -1.b		; 10 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $606E24.l,X		; 7F 24 6E 60
	brk $C0.b		; 00 C0
	ora ($00.b,X)		; 01 00
	brk $04.b		; 00 04
	ora ($4D.b,X)		; 01 4D
	and [$FF.b],Y		; 37 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $247FFF.l,X		; 7F FF 7F 24
	ror $00AC.w		; 6E AC 00
	ora $000001.l,X		; 1F 01 00 00
	tad		; 5B
	rol $6FBF.w		; 2E BF 6F
	lsr $00.b		; 46 00
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FB267F.l,X		; FF 7F 26 FB
	brk $0F.b		; 00 0F
	ldy #$04.b		; A0 04
	brk $7D.b		; 00 7D
	and $0D.b		; 25 0D
	sta ($AB.b,S),Y		; 93 AB
	and $0B.b		; 25 0B
	bit $69.b		; 24 69
	ora ($02.b)		; 12 02
	php		; 08
	pha		; 48
	clc		; 18
	lda $183159.l		; AF 59 31 18
	dec A		; 3A
	sta ($20.b,X)		; 81 20
	bpl -22.b		; 10 EA
	trb $0112.w		; 1C 12 01
	lsr $A3.b,X		; 56 A3
	ldy #$A6.b		; A0 A6
	ora ($22.b)		; 12 22
	bpl  19.b		; 10 13
	sta $4851C3.l		; 8F C3 51 48
	sta $18BB.w,Y		; 99 BB 18
	sbc ($06.b,S),Y		; F3 06
	stx $22.b		; 86 22
	bit $F13C.w,X		; 3C 3C F1
	php		; 08
	ldy $53.b		; A4 53
	mvn $46,$B1		; 54 B1 46
	lda ($AD.b,S),Y		; B3 AD
	sep #$81		; E2 81
	ora [$2C.b]		; 07 2C
	and ($C7.b,X)		; 21 C7
	tsb $47A8.w		; 0C A8 47
	php		; 08
	jsl $ECB5D0.l		; 22 D0 B5 EC
	ldx $082F.w,Y		; BE 2F 08
	asl $17.b,X		; 16 17
	clc		; 18
	and $2A.b		; 25 2A
	and $58E7AD.l,X		; 3F AD E7 58
	cmp $6BF1.w		; CD F1 6B
	cmp $90.b		; C5 90
	sta $C232.w		; 8D 32 C2
	xba		; EB
	and ($45.b,X)		; 21 45
	lda $44.b		; A5 44
	ldy $04.b		; A4 04
	and $B73DD3.l		; 2F D3 3D B7
	cmp $60.b,S		; C3 60
	.db $42, $EC		; 42 EC
	ldx $2F.b,Y		; B6 2F
	jmp ($DFF6.w)		; 6C F6 DF
	asl $2E40.w		; 0E 40 2E
	wai		; CB
	ror A		; 6A
	adc $F1.b,X		; 75 F1
	jmp ($175F.w,X)		; 7C 5F 17
.ACCU 16
	rep #$EB		; C2 EB
	ldx $D7BD.w		; AE BD D7
	eor $0470.w,X		; 5D 70 04
	phy		; 5A
	bit $0084.w		; 2C 84 00
	.db $42, $14		; 42 14
	phy		; 5A
	eor #$B7DC.w		; 49 DC B7
	lda $2381.w		; AD 81 23
	adc $46.b,S		; 63 46
	and ($86.b,S),Y		; 33 86
	adc $96.b,X		; 75 96
	lda [$A6.b],Y		; B7 A6
	sbc [$66.b]		; E7 66
	lsr $86.b		; 46 86
	cpy $93.b		; C4 93
	lda $DF6F.w,Y		; B9 6F DF
	tyx		; BB
	xce		; FB
	sbc ($FB.b,S),Y		; F3 FB
	ora $93F1.w,X		; 1D F1 93
	adc $DE.b,S		; 63 DE
	tyx		; BB
	and $0B.b,S		; 23 0B
	dec $7A.b		; C6 7A
	sbc $40C2BB.l		; EF BB C2 40
	tyx		; BB
	and $F2A9.w		; 2D A9 F2
	lda ($0D.b,X)		; A1 0D
	lda $F6DA6B.l		; AF 6B DA F6
	tsx		; BA
	wai		; CB
	bit $96B5.w		; 2C B5 96
	eor $0360.w,Y		; 59 60 03
	eor $38D3.w,Y		; 59 D3 38
	wai		; CB
	ora [$C2.b],Y		; 17 C2
	inc $B9.b,X		; F6 B9
	sta ($81.b),Y		; 91 81
	adc ($61.b),Y		; 71 61
	tsb $5A.b		; 04 5A
	asl $BD.b,X		; 16 BD
	sta [$C5.b],Y		; 97 C5
	iny		; C8
	asl $17.b,X		; 16 17
	clc		; 18
	eor ($1E.b),Y		; 51 1E
	sta $283B.w,X		; 9D 3B 28
	sta $FC1045.l		; 8F 45 10 FC
	adc [$8E.b],Y		; 77 8E
	trb $FF.b		; 14 FF
	cmp $85.b		; C5 85
	rol $D622.w,X		; 3E 22 D6
	tsx		; BA
	sta $8C2F0B.l,X		; 9F 0B 2F 8C
	adc [$3A.b]		; 67 3A
	dec $F7.b,X		; D6 F7
	and ($0B.b)		; 32 0B
	bcs -53.b		; B0 CB
	eor $11A4.w		; 4D A4 11
	pla		; 68
	ldy $5A.b,X		; B4 5A
	bit $2184.w		; 2C 84 21
	bpl -124.b		; 10 84
	jsr $B400.w		; 20 00 B4
	eor $0008.w,Y		; 59 08 00
	and ($47.b,X)		; 21 47
	adc ($ED.b,X)		; 61 ED
	eor ($4C.b),Y		; 51 4C
	adc [$0C.b]		; 67 0C
	xba		; EB
	and $263C.w		; 2D 3C 26
	adc $D0C8FC.l,X		; 7F FC C8 D0
	ora #$FD53.w		; 09 53 FD
	sta [$F4.b],Y		; 97 F4
	cmp [$2A.b],Y		; D7 2A
	adc $08DA.w,X		; 7D DA 08
	stx $4EAF.w		; 8E AF 4E
	and $2000.w,Y		; 39 00 20
	bvs   3.b		; 70 03
	ora $538987.l,X		; 1F 87 89 53
	beq -16.b		; F0 F0
	ldx #$17.b		; A2 17
	cmp $AA.b,S		; C3 AA
	brk $0B.b		; 00 0B
	tay		; A8
	ldy $B7.b,X		; B4 B7
	and $8CF1.w,Y		; 39 F1 8C
	tyx		; BB
	eor $82.b		; 45 82
	tad		; 5B
	adc $81.b		; 65 81
	php		; 08
	lda $AF.b,X		; B5 AF
	jmp ($3963.w,X)		; 7C 63 39
	dec $B7.b,X		; D6 B7
	lda $2C94.w,Y		; B9 94 2C
	tyx		; BB
	tsb $DAB4.w		; 0C B4 DA
	eor $4C67.w		; 4D 67 4C
	sbc $2C.b,S		; E3 2C
	tsa		; 3B
	adc $F5.b,S		; 63 F5
	adc $323A.w,X		; 7D 3A 32
	bmi  12.b		; 30 0C
	rol $1395.w,X		; 3E 95 13
	sbc $51.b,X		; F5 51
	inc $F396.w		; EE 96 F3
	sbc $B34FE1.l		; EF E1 4F B3
	clv		; B8
	asl $BDCE.w,X		; 1E CE BD
	sbc ($EB.b,S),Y		; F3 EB
	dex		; CA
	sta $97D5.w,X		; 9D D5 97
	jsr $C7EB.w		; 20 EB C7
	trb $9DCA.w		; 1C CA 9D
	cmp $C2.b,X		; D5 C2
	mvn $64,$FF		; 54 FF 64
	plp		; 28
	sty $28.b,X		; 94 28
	sta $EE3ECB.l,X		; 9F CB 3E EE
	txa		; 8A
	and ($97.b,X)		; 21 97
	eor $13.b		; 45 13
	sbc [$7F.b]		; E7 7F
	sbc $8A7E.w,Y		; F9 7E 8A
	ror $51D7.w,X		; 7E D7 51
	and $AF1F5F.l,X		; 3F 5F 1F AF
	ldy $FE29.w		; AC 29 FE
	ora $D649.w,X		; 1D 49 D6
	sbc ($AB.b,S),Y		; F3 AB
	sbc [$B5.b],Y		; F7 B5
	cmp $D300.w,X		; DD 00 D3
	pld		; 2B
	ldy $B1A2.w		; AC A2 B1
	xce		; FB
	sbc $FED5AF.l,X		; FF AF D5 FE
	pei ($FF.b)		; D4 FF
	dec $94FA.w,X		; DE FA 94
	eor $2054FF.l		; 4F FF 54 20
	inc $CB9F.w,X		; FE 9F CB
	xce		; FB
	tay		; A8
	sta $B153F2.l		; 8F F2 53 B1
	sbc ($FF.b)		; F2 FF
	ora $009D.w,X		; 1D 9D 00
	tsb $C03F.w		; 0C 3F C0
	tsb $45.b		; 04 45
	lda $7C77.w		; AD 77 7C
	xba		; EB
	tad		; 5B
	cop $16.b		; 02 16
	ora $E668.w,Y		; 19 68 E6
	eor ($A2.b)		; 52 A2
	ora ($95.b)		; 12 95
	tsa		; 3B
	stz $FAFD.w,X		; 9E FD FA
	phx		; DA
	brk $0E.b		; 00 0E
	eor $51D6.w,X		; 5D D6 51
	rol $E379.w,X		; 3E 79 E3
	rol $B0DE.w,X		; 3E DE B0
	brk $72.b		; 00 72
	wai		; CB
	tax		; AA
	bit #$FECC.w		; 89 CC FE
	trb $5376.w		; 1C 76 53
	sbc $C1.b		; E5 C1
	ora ($ED.b),Y		; 11 ED
	sbc $B9C6.w		; ED C6 B9
	bcc   4.b		; 90 04
	tsa		; 3B
	bit $90.b,X		; 34 90
	tas		; 1B
	sta $11.b,X		; 95 11
	phx		; DA
	bit #$EB6F.w		; 89 6F EB
	tsx		; BA
	dey		; 88
	adc $1375.w		; 6D 75 13
	sbc $DD6F.w,Y		; F9 6F DD
	adc $10.b,X		; 75 10
	phx		; DA
	cpx #$04.b		; E0 04
	eor $AD.b		; 45 AD
	tda		; 7B
	sbc $5886CF.l,X		; FF CF 86 58
	lsr $422C.w,X		; 5E 2C 42
	wai		; CB
	ldx $8700.w,Y		; BE 00 87
	cmp [$BC.b]		; C7 BC
	adc $42.b,X		; 75 42
	bpl -124.b		; 10 84
	and $E2.b,S		; 23 E2
	sta $12.b		; 85 12
	sta $F2CF77.l,X		; 9F 77 CF F2
	sty $A5.b,X		; 94 A5
	and #$F912.w		; 29 12 F9
	cmp ($94.b)		; D2 94
	lda $27.b		; A5 27
	cmp [$F4.b],Y		; D7 F4
	ply		; 7A
	dex		; CA
	dey		; 88
	adc $5309.w,X		; 7D 09 53
	ldx $54CE.w,Y		; BE CE 54
	.db $42, $3E		; 42 3E
	cmp $13.b		; C5 13
	dec $33.b		; C6 33
	sta $5A67.w,X		; 9D 67 5A
	stp		; DB
	tda		; 7B
	sta $6518.w,Y		; 99 18 65
	stx $86.b,Y		; 96 86
	cmp ($D7.b)		; D2 D7
	sec		; 38
.INDEX 8
	sep #$DD		; E2 DD
	sta $3400.w,X		; 9D 00 34
	rep #$CA		; C2 CA
	and #$732D.w		; 29 2D 73
	stx $D92D.w		; 8E 2D D9
	bne   9.b		; D0 09
	adc #$8085.w		; 69 85 80
	dey		; 88
	xba		; EB
	jmp ($3963.w,X)		; 7C 63 39
	dec $B7.b,X		; D6 B7
	lda $5D08.w,Y		; B9 08 5D
	stx $5A.b		; 86 5A
	adc $95B9.w		; 6D B9 95
	bpl -38.b		; 10 DA
	mvn $FD,$42		; 54 42 FD
	and ($44.b,X)		; 21 44
	rol $1385.w		; 2E 85 13
	sbc $F1.b,X		; F5 F1
	cmp $006D1D.l,X		; DF 1D 6D 00
	ora [$86.b]		; 07 86
	asl $51.b,X		; 16 51
	stz $5214.w,X		; 9E 14 52
	brk $11.b		; 00 11
	asl $B5.b,X		; 16 B5
	pei ($F8.b)		; D4 F8
	cli		; 58
	sbc #$7FF7.w		; E9 F7 7F
	stz $BAFE.w,X		; 9E FE BA
	dec $40E6.w,X		; DE E6 40
	adc $EDCE.w,X		; 7D CE ED
	rol $90.b,X		; 36 90
	jsl $DA6B2D.l		; 22 2D 6B DA
	sbc [$C3.b],Y		; F7 C3
	clc		; 18
	dec $4274.w		; CE 74 42
	wai		; CB
	rol $C830.w		; 2E 30 C8
	ora $73.b,S		; 03 73
	sta $1DEF17.l,X		; 9F 17 EF 1D
	rti		; 40

	rol $CA.b,X		; 36 CA
	inx		; E8
	eor ($18.b),Y		; 51 18
	phb		; 8B
	plp		; 28
	sty $2D1D.w		; 8C 1D 2D
	tda		; 7B
	sbc $19.b,S		; E3 19
	dec $CCB5.w		; CE B5 CC
	.db $82, $CB, $B0		; 82 CB B0
	wai		; CB
	eor #$8800.w		; 49 00 88
	lda ($B6.b,S),Y		; B3 B6
	and ($9D.b,S),Y		; 33 9D
	rtl		; 6B

	rts		; 60

	rti		; 40

	cmp $2D.b,S		; C3 2D
	and $FC.b,X		; 35 FC
	ror $EDFF.w,X		; 7E FF ED
	sbc ($40.b),Y		; F1 40
	ora $4F.b,S		; 03 4F
	lda $42F1.w,X		; BD F1 42
	dey		; 88
	sbc ($3C.b,S),Y		; F3 3C
	sei		; 78
	sbc $A7DF.w		; ED DF A7
	mvn $97,$00		; 54 00 97
	sta [$77.b]		; 87 77
	mvn $8F,$28		; 54 28 8F
	and ($C2.b,S),Y		; 33 C2
	dey		; 88
	cmp #$E72D.w		; C9 2D E7
	cli		; 58
	cmp $6BFE.w		; CD FE 6B
	ror $B288.w,X		; 7E 88 B2
	ora $2C.b,S		; 03 2C
	rol $06B2.w		; 2E B2 06
	adc $AD.b,X		; 75 AD
	inc $3277.w		; EE 77 32
	sta ($2C.b),Y		; 91 2C
	ldy $DB.b,X		; B4 DB
	adc #$9648.w		; 69 48 96
	sbc [$3E.b]		; E7 3E
	and $A03ADE.l		; 2F DE 3A A0
	dec A		; 3A
	rol $CA.b,X		; 36 CA
	inx		; E8
	ora ($D0.b,X)		; 01 D0
	ora ($B9.b,X)		; 01 B9
	cmp $7F7EFF.l		; CF FF 7E 7F
	lda $80FE.w,Y		; B9 FE 80
	rol $CB.b,X		; 36 CB
	sbc ($16.b,S),Y		; F3 16
	lda $8EF1.w,X		; BD F1 8E
	and ($BF.b,S),Y		; 33 BF
	ora ($20.b,S),Y		; 13 20
	lda ($EC.b)		; B2 EC
	and ($F0.b)		; 32 F0
	bcc   8.b		; 90 08
	phb		; 8B
	phy		; 5A
	sbc [$C6.b],Y		; F7 C6
	and ($9D.b,S),Y		; 33 9D
	rtl		; 6B

	bcc -123.b		; 90 85
	sta [$61.b],Y		; 97 61
	stx $9E.b,Y		; 96 9E
	tsa		; 3B
	adc $A5.b,S		; 63 A5
	sty $EF.b,X		; 94 EF
	tsb $A22C.w		; 0C 2C A2
	jmp ($C7F3.w,X)		; 7C F3 C7
	ora $74BB.w,X		; 1D BB 74
	inx		; E8
	brk $E5.b		; 00 E5
	cmp $B3.b,S		; C3 B3
	ldx #$88.b		; A2 88
	cpy $7E.b		; C4 7E
	eor $7E.b,X		; 55 7E
	cmp $3E.b,X		; D5 3E
	ora $D10290.l,X		; 1F 90 02 D1
	stx $C6B9.w		; 8E B9 C6
	sed		; F8
	brk $B3.b		; 00 B3
	tsb $BFB6.w		; 0C B6 BF
	jmp $F1F6.w		; 4C F6 F1
	sta $90F0.w,Y		; 99 F0 90
	rol $C2CB.w		; 2E CB C2
	mvn $58,$42		; 54 42 58
	sbc $B547.w,Y		; F9 47 B5
	brk $12.b		; 00 12
.INDEX 16
	rep #$14		; C2 14
	eor ($5C.b,S),Y		; 53 5C
	cmp $00ECD1.l,X		; DF D1 EC 00
	bit $B8.b,X		; 34 B8
	mvp $D7,$5A		; 44 5A D7
	ldx $9C31.w,Y		; BE 31 9C
	xba		; EB
	tad		; 5B
	jmp.w [$B290]		; DC 90 B2
	cpx $D332.w		; EC 32 D3
	ror $4B54.w		; 6E 54 4B
	sta $12.b,X		; 95 12
	sbc ($C2.b)		; F2 C2
	dey		; 88
	sbc $9628.w,Y		; F9 28 96
	lda [$9D.b],Y		; B7 9D
	adc $37.b,S		; 63 37
	cmp $BB.b		; C5 BB
	jmp ($A7DF.w,X)		; 7C DF A7
	rol $6FFD.w,X		; 3E FD 6F
	jmp $BAB0.w		; 4C B0 BA
	cmp $949699.l		; CF 99 96 94
	sed		; F8
	lda $D9B3.w,X		; BD B3 D9
	eor $3A28BB.l		; 4F BB 28 3A
	.db $62, $FA, $EF		; 62 FA EF
	rol $1012.w,X		; 3E 12 10
	bmi -46.b		; 30 D2
	rti		; 40

	and $8750.w,Y		; 39 50 87
	rol $F3B6.w,X		; 3E B6 F3
	stz $00.b,X		; 74 00
	and ($B2.b)		; 32 B2
	txa		; 8A
	rtl		; 6B

	txy		; 9B
	plx		; FA
	and $0680.w,X		; 3D 80 06
	sta [$51.b],Y		; 97 51
	eor #$D667.w		; 49 67 D6
	dec $806E.w,X		; DE 6E 80
	ora ($CA.b)		; 12 CA
	cpy #$5A44.w		; C0 44 5A
	cmp [$BE.b],Y		; D7 BE
	and ($C6.b),Y		; 31 C6
	lda [$B9.b],Y		; B7 B9
	php		; 08
	eor $1A76.w,Y		; 59 76 1A
	adc $E7AD.w		; 6D AD E7
	lsr $BAF8.w		; 4E F8 BA
	dec $80.b,X		; D6 80
	cmp ($23.b,S),Y		; D3 23
	cop $C0.b		; 02 C0
	phd		; 0B
	lsr $3A.b		; 46 3A
	xba		; EB
	tyx		; BB
.ACCU 16
	rep #$67		; C2 67
	adc ($66.b,X)		; 61 66
	inc A		; 1A
	tsb $B7.b		; 04 B7
	cmp $95.b,S		; C3 95
	and $8F256A.l,X		; 3F 6A 25 8F
	cmp ($EE.b,X)		; C1 EE
	eor ($F0.b,S),Y		; 53 F0
	ldx #$CF92.w		; A2 92 CF
	lda $DDBC.w		; AD BC DD
	bpl -124.b		; 10 84
	ora ($CA.b)		; 12 CA
	dex		; CA
	and $4A29.w		; 2D 29 4A
	sta $4829.w,X		; 9D 29 48
	tsb $22.b		; 04 22
	and $DF6B.w		; 2D 6B DF
	brk $04.b		; 00 04
	bit $ADB9.w		; 2C B9 AD
	adc $762A73.l		; 6F 73 2A 76
	txy		; 9B
	lsr A		; 4A
	sty $58.b		; 84 58
	eor ($4F.b),Y		; 51 4F
	rol A		; 2A
	tax		; AA
	and $E6.b,S		; 23 E6
	ldx #$C798.w		; A2 98 C7
	sta $3B5595.l,X		; 9F 95 55 3B
	clc		; 18
	sbc ($C7.b,S),Y		; F3 C7
	sta $51.b,X		; 95 51
	lda ($E8.b,X)		; A1 E8
	tyx		; BB
	tsx		; BA
	cpx $C39A.w		; EC 9A C3
	sbc $DFF4.w		; ED F4 DF
	sta [$A6.b],Y		; 97 A6
	adc ($DB.b),Y		; 71 DB
	ora $B625.w,Y		; 19 25 B6
	sta $D961.w,Y		; 99 61 D9
	cmp $D1.b,X		; D5 D1
	eor $B2.b		; 45 B2
	cmp $B3.b,S		; C3 B3
	tay		; A8
	asl $58.b		; 06 58
	ror $75.b,X		; 76 75
	eor ($B4.b,S),Y		; 53 B4
	wai		; CB
	asl A		; 0A
	ror $99.b,X		; 76 99
	adc ($44.b,X)		; 61 44
	lda $B6.b		; A5 B6
	sta $4B00.w,Y		; 99 00 4B
	adc $A232.w		; 6D 32 A2
	tyx		; BB
	adc #$B8C3.w		; 69 C3 B8
	ora $D6.b		; 05 D6
	eor ($0B.b),Y		; 51 0B
	dec $51D6.w,X		; DE D6 51
	sta $446D.w,Y		; 99 6D 44
	rol $77.b		; 26 77
	bcs  18.b		; B0 12
	stp		; DB
	lsr $2500.w		; 4E 00 25
	ldx $9C.b,Y		; B6 9C
	brk $1C.b		; 00 1C
	sec		; 38
	bvc -125.b		; 50 83
	ora $F3E6B1.l		; 0F B1 E6 F3
	adc $288C.w,X		; 7D 8C 28
	lda [$C1.b],Y		; B7 C1
	cmp $FE.b,S		; C3 FE
	clv		; B8
	jmp ($6B14.w,X)		; 7C 14 6B
	sbc $1F3D7A.l		; EF 7A 3D 1F
	cmp $07E4.w		; CD E4 07
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	ldy $7F.b,X		; B4 7F
	ora [$97.b]		; 07 97
	jmp.w [$2015]		; DC 15 20
	ora ($7E.b)		; 12 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $7A03.w,X		; 1E 03 7A
	cop $C6.b		; 02 C6
	jsr $2908.w		; 20 08 29
	lsr A		; 4A
	and ($AD.b),Y		; 31 AD
	and $4610.w,X		; 3D 10 46
	eor ($4E.b)		; 52 4E
	sty $5A.b,X		; 94 5A
	sbc [$62.b],Y		; F7 62
	and $9C6B.w,Y		; 39 6B 9C
	adc [$FF.b],Y		; 77 FF
	adc $DB7FF8.l,X		; 7F F8 7F DB
	brk $12.b		; 00 12
	ror $00DB.w,X		; 7E DB 00
	lda $DB77.w,X		; BD 77 DB
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	and ($DB.b),Y		; 31 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $12.b		; 00 12
	ror $00DB.w,X		; 7E DB 00
	lda $DB77.w,X		; BD 77 DB
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	and ($5A.b),Y		; 31 5A
	rtl		; 6B

	clc		; 18
	adc $B5.b,S		; 63 B5
	lsr $B0.b,X		; 56 B0
	brk $B4.b		; 00 B4
	brk $77.b		; 00 77
	ora ($7A.b,X)		; 01 7A
	cop $29.b		; 02 29
	and $AC.b		; 25 AC
	brk $84.b		; 00 84
	bpl   0.b		; 10 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($81.b)		; 32 81
	and ($82.b)		; 32 82
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($83.b)		; 32 83
	and ($84.b)		; 32 84
	and ($84.b)		; 32 84
	adc ($85.b)		; 72 85
	and ($86.b)		; 32 86
	and ($87.b)		; 32 87
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($88.b)		; 32 88
	and ($89.b)		; 32 89
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8A.b)		; 32 8A
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8B.b)		; 32 8B
	and ($8C.b)		; 32 8C
	and ($8D.b)		; 32 8D
	and ($80.b)		; 32 80
	and ($8E.b)		; 32 8E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8F.b)		; 32 8F
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($90.b)		; 32 90
	and ($82.b)		; 32 82
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($95.b)		; 32 95
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($96.b)		; 32 96
	and ($89.b)		; 32 89
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($97.b)		; 32 97
	and ($98.b)		; 32 98
	and ($99.b)		; 32 99
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($9E.b)		; F2 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9F.b)		; 32 9F
	and ($A0.b)		; 32 A0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A1.b)		; 32 A1
	and ($A2.b)		; 32 A2
	and ($A3.b)		; 32 A3
	and ($A4.b)		; 32 A4
	and ($A5.b)		; 32 A5
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($AD.b)		; 32 AD
	and ($AE.b)		; 32 AE
	and ($AF.b)		; 32 AF
	and ($B0.b)		; 32 B0
	and ($B1.b)		; 32 B1
	and ($80.b)		; 32 80
	and ($B2.b)		; 32 B2
	and ($B3.b)		; 32 B3
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C0.b)		; 32 C0
	and ($C1.b)		; 32 C1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C2.b)		; 32 C2
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C7.b)		; 32 C7
	and ($C8.b)		; 32 C8
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C9.b)		; 32 C9
	and ($CA.b)		; 32 CA
	and ($CB.b)		; 32 CB
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CF.b)		; 72 CF
	and ($D0.b)		; 32 D0
	and ($D1.b)		; 32 D1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D2.b)		; 32 D2
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($D7.b)		; 32 D7
	and ($8D.b)		; 32 8D
	adc ($99.b)		; 72 99
	lda ($D8.b)		; B2 D8
	and ($D9.b)		; 32 D9
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($DB.b)		; 32 DB
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E1.b)		; 32 E1
	and ($E2.b)		; 32 E2
	and ($E3.b)		; 32 E3
	and ($B3.b)		; 32 B3
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E4.b)		; 32 E4
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E8.b)		; 32 E8
	and ($E9.b)		; 32 E9
	and ($EA.b)		; 32 EA
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($EB.b)		; 32 EB
	and ($EC.b)		; 32 EC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8E.b)		; 32 8E
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($84.b)		; 32 84
	and ($84.b)		; 32 84
	adc ($85.b)		; 72 85
	and ($86.b)		; 32 86
	and ($87.b)		; 32 87
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8A.b)		; 32 8A
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8B.b)		; 32 8B
	and ($8C.b)		; 32 8C
	and ($8D.b)		; 32 8D
	and ($80.b)		; 32 80
	and ($8E.b)		; 32 8E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($90.b)		; 32 90
	and ($82.b)		; 32 82
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($95.b)		; 32 95
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($96.b)		; 32 96
	and ($89.b)		; 32 89
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($97.b)		; 32 97
	and ($98.b)		; 32 98
	and ($99.b)		; 32 99
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($9E.b)		; F2 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9F.b)		; 32 9F
	and ($A0.b)		; 32 A0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A2.b)		; 32 A2
	and ($A3.b)		; 32 A3
	and ($A4.b)		; 32 A4
	and ($A5.b)		; 32 A5
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($AD.b)		; 32 AD
	and ($AE.b)		; 32 AE
	and ($AF.b)		; 32 AF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C2.b)		; 32 C2
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C7.b)		; 32 C7
	and ($C8.b)		; 32 C8
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C9.b)		; 32 C9
	and ($CA.b)		; 32 CA
	and ($CB.b)		; 32 CB
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CF.b)		; 72 CF
	and ($D0.b)		; 32 D0
	and ($D1.b)		; 32 D1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D2.b)		; 32 D2
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($D7.b)		; 32 D7
	and ($8D.b)		; 32 8D
	adc ($99.b)		; 72 99
	lda ($D8.b)		; B2 D8
	and ($D9.b)		; 32 D9
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DB.b)		; 32 DB
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E1.b)		; 32 E1
	and ($E2.b)		; 32 E2
	and ($E3.b)		; 32 E3
	and ($B3.b)		; 32 B3
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E4.b)		; 32 E4
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8B.b)		; 32 8B
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($97.b)		; 32 97
	and ($98.b)		; 32 98
	and ($99.b)		; 32 99
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($9E.b)		; F2 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A3.b)		; 32 A3
	and ($A4.b)		; 32 A4
	and ($A5.b)		; 32 A5
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($AD.b)		; 32 AD
	and ($AE.b)		; 32 AE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C2.b)		; 32 C2
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C7.b)		; 32 C7
	and ($C8.b)		; 32 C8
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($CA.b)		; 32 CA
	and ($CB.b)		; 32 CB
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CF.b)		; 72 CF
	and ($D0.b)		; 32 D0
	and ($D1.b)		; 32 D1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($D7.b)		; 32 D7
	and ($8D.b)		; 32 8D
	adc ($99.b)		; 72 99
	lda ($D8.b)		; B2 D8
	and ($D9.b)		; 32 D9
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E1.b)		; 32 E1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($99.b)		; 32 99
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($80.b)		; F2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A4.b)		; 32 A4
	and ($A5.b)		; 32 A5
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($CB.b)		; 32 CB
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CF.b)		; 72 CF
	and ($D0.b)		; 32 D0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($D7.b)		; 32 D7
	and ($8D.b)		; 32 8D
	adc ($99.b)		; 72 99
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($80.b)		; F2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($80.b)		; 72 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($80.b)		; F2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($80.b)		; 72 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($42.b)		; 32 42
	xce		; FB
	brk $0F.b		; 00 0F
	jsr $00F3.w		; 20 F3 00
	ora $710B20.l		; 0F 20 0B 71
	ora $FFFF.w		; 0D FF FF
	ora ($FF.b),Y		; 11 FF
	brk $16.b		; 00 16
	ora $190D.w		; 0D 0D 19
	ora ($11.b),Y		; 11 11
	inc A		; 1A
	brk $00.b		; 00 00
	ora $1A1A.w,X		; 1D 1A 1A
	jsl $251919.l		; 22 19 19 25
	asl $16.b,X		; 16 16
	plp		; 28
	inc $29FE.w,X		; FE FE 29
	inc $2A01.w,X		; FE 01 2A
	ora $2B1D.w,X		; 1D 1D 2B
	sbc $2C02.w,X		; FD 02 2C
	adc $FB2D80.l,X		; 7F 80 2D FB
	tsb $2E.b		; 04 2E
	sbc [$08.b],Y		; F7 08
	and $3140BF.l		; 2F BF 40 31
	sbc $22327F.l,X		; FF 7F 32 22
	ora $DF33.w,Y		; 19 33 DF
	jsr $2535.w		; 20 35 25
	asl $36.b,X		; 16 36
	sbc $FD3710.l		; EF 10 37 FD
	jsr ($3F3B.w,X)		; FC 3B 3F
	cpy #$FB3E.w		; C0 3E FB
	sbc $F741.w,Y		; F9 41 F7
	sbc ($42.b,S),Y		; F3 42
	lda $28439F.l,X		; BF 9F 43 28
	plp		; 28
	mvp $29,$29		; 44 29 29
	eor $CF.b		; 45 CF
	bmi  70.b		; 30 46
	cmp $FC47CF.l,X		; DF CF 47 FC
	ora $48.b,S		; 03 48
	jsl $254911.l		; 22 11 49 25
	ora $7F4A.w		; 0D 4A 7F
	and $E7EF4B.l,X		; 3F 4B EF E7
	eor $0CF3.w		; 4D F3 0C
	lsr $FBFB.w		; 4E FB FB
	bvc  -3.b		; 50 FD
	sbc $2B51.w,X		; FD 51 2B
	and $3652.w		; 2D 52 36
	and ($53.b,S),Y		; 33 53
	sbc $5406.w,Y		; F9 06 54
	plp		; 28
	and [$55.b],Y		; 37 55
	and $00562C.l		; 2F 2C 56 00
	jsr $1F57.w		; 20 57 1F
	cpx #$1958.w		; E0 58 19
	ora ($59.b),Y		; 11 59
	adc $E75A7F.l,X		; 7F 7F 5A E7
	clc		; 18
	tad		; 5B
	jsr ($5CFC.w,X)		; FC FC 5C
	asl $0D.b,X		; 16 0D
	eor $3F3F.w,X		; 5D 3F 3F
	lsr $464B.w,X		; 5E 4B 46
	eor $62609F.l,X		; 5F 9F 60 62
	and #$6451.w		; 29 51 64
	pld		; 2B
	pld		; 2B
	adc $2E.b		; 65 2E
	eor ($66.b)		; 52 66
	and ($31.b),Y		; 31 31
	adc [$3E.b]		; 67 3E
	eor ($68.b,X)		; 41 68
	.db $42, $4A		; 42 4A
	adc #$0056.w		; 69 56 00
	ror A		; 6A
	lda $F76BBF.l,X		; BF BF 6B F7
	sbc [$6C.b],Y		; F7 6C
	ora $326DF0.l		; 0F F0 6D 32
	ora ($6E.b),Y		; 11 6E
	and $0D.b,X		; 35 0D
	adc $711F3F.l		; 6F 3F 1F 71
	brk $08.b		; 00 08
	adc ($2D.b)		; 72 2D
	and $FF73.w		; 2D 73 FF
	inc $2A74.w,X		; FE 74 2A
	ora $2E75.w,X		; 1D 75 2E
	rol $0076.w		; 2E 76 00
	rti		; 40

	ply		; 7A
	tsa		; 3B
	eor $7B.b		; 45 7B
	eor $7E47.w		; 4D 47 7E
	cmp $EF84DF.l,X		; DF DF 84 EF
	sbc $711085.l		; EF 85 10 71
	stx $29.b		; 86 29
	eor ($89.b,S),Y		; 53 89
	rol A		; 2A
	inc A		; 1A
	txa		; 8A
	bit $8B2F.w		; 2C 2F 8B
	and ($36.b,S),Y		; 33 36
	sty $3E54.w		; 8C 54 3E
	sta $C7CF.w		; 8D CF C7
	bcc  -8.b		; 90 F8
	ora [$91.b]		; 07 91
	inc $92FC.w,X		; FE FC 92
	asl $48.b,X		; 16 48
	sty $1F.b,X		; 94 1F
	ora $222295.l		; 0F 95 22 22
	stx $37.b,Y		; 96 37
	and [$97.b],Y		; 37 97
	.db $42, $46		; 42 46
	tya		; 98
	lsr $9968.w,X		; 5E 68 99
	adc $55.b		; 65 55
	txs		; 9A
	sbc $1C.b,S		; E3 1C
	txy		; 9B
	bra 118.b		; 80 76
	sta $535A.w,X		; 9D 5A 53
	lda ($F8.b,X)		; A1 F8
	sed		; F8
	ldx #$1619.w		; A2 19 16
	lda $45.b,S		; A3 45
	tsa		; 3B
	ldy $5D.b		; A4 5D
	cmp $2C5FA5.l		; CF A5 5F 2C
	ldx $74.b		; A6 74
	inc A		; 1A
	tay		; A8
	ply		; 7A
	tda		; 7B
	lda #$38C7.w		; A9 C7 38
	tax		; AA
	sbc $E1.b,S		; E3 E1
	plb		; AB
	beq  15.b		; F0 0F
	ldy $0EF1.w		; AC F1 0E
	lda $F3FB.w		; AD FB F3
	ldx $F9FD.w		; AE FD F9
	lda ($9B.b),Y		; B1 9B
	adc #$F9B2.w		; 69 B2 F9
	sed		; F8
	ldy $CF.b,X		; B4 CF
	sta $E3F3B5.l		; 8F B5 F3 E3
	ldx $FC.b,Y		; B6 FC
	sed		; F8
	sta $25.b,X		; 95 25
	and $19.b		; 25 19
	mvp $51,$2B		; 44 2B 51
	and $FF73.w		; 2D 73 FF
	eor $FC.b,S		; 43 FC
	bvc -82.b		; 50 AE
	lsr $2CAD.w		; 4E AD 2C
	bit $5932.w		; 2C 32 59
	eor $2F35.w,Y		; 59 35 2F
	phb		; 8B
	rol $2B2D.w		; 2E 2D 2B
	mvp $4B,$97		; 44 97 4B
	eor ($3E.b,X)		; 41 3E
	and [$43.b],Y		; 37 43
	sta $6E.b,X		; 95 6E
	and ($22.b),Y		; 31 22
	eor [$4D.b]		; 47 4D
	eor $2F.b		; 45 2F
	jmp $B5B673.l		; 5C 73 B6 B5
	ldy $6A.b,X		; B4 6A
	pld		; 2B
	eor $22A3.w		; 4D A3 22
	ldx $B4B5.w		; AE B5 B4
	eor $7525.w,X		; 5D 25 75
	adc $72.b,X		; 75 72
	adc ($41.b)		; 72 41
	eor ($41.b,X)		; 41 41
	eor ($4E.b,X)		; 41 4E
	lsr $4E4E.w		; 4E 4E 4E
	stz $44.b		; 64 44
	jsl $254396.l		; 22 96 43 25
	jsl $2F8A2C.l		; 22 2C 8A 2F
	jmp $4A5931.l		; 5C 31 59 4A
	ror A		; 6A
	.db $42, $75		; 42 75
	rol $52.b,X		; 36 52
	and ($2F.b,S),Y		; 33 2F
	and $E7F76B.l		; 2F 6B F7 E7
	sty $EF.b		; 84 EF
	cmp $9FDF7E.l		; CF 7E DF 9F
	ror A		; 6A
	lda $8A2C3F.l,X		; BF 3F 2C 8A
	and $D921DE.l		; 2F DE 21 D9
	rol $5A.b		; 26 5A
	rol $59.b,X		; 36 59
	lsr A		; 4A
	ror A		; 6A
	lda $DADE9E.l,X		; BF 9E DE DA
	cmp $E7C9.w,Y		; D9 C9 E7
	sbc [$4B.b]		; E7 4B
	stx $5A.b		; 86 5A
	lda $58.b		; A5 58
	inc $F9FA.w,X		; FE FA F9
	sbc #$A7E7.w		; E9 E7 A7
	sta $5C599F.l,X		; 9F 9F 59 5C
	bit $596D.w		; 2C 6D 59
	ror $7272.w		; 6E 72 72
	stz $64.b		; 64 64
	rol $3E3E.w,X		; 3E 3E 3E
	rol $5050.w,X		; 3E 50 50
	bvc  80.b		; 50 50
	and ($8B.b,S),Y		; 33 8B
	rol $75.b,X		; 36 75
	adc ($7E.b)		; 72 7E
	lsr $84.b		; 46 84
	phk		; 4B
	rtl		; 6B

	eor ($4E.b,X)		; 41 4E
	rol $4419.w,X		; 3E 19 44
	pld		; 2B
	eor ($2D.b),Y		; 51 2D
	ora $43FF.w		; 0D FF 43
	jsr ($AE50.w,X)		; FC 50 AE
	lsr $32AD.w		; 4E AD 32
	eor [$4D.b]		; 47 4D
	and $5B.b,X		; 35 5B
	sbc ($F0.b,S),Y		; F3 F0
	and ($2F.b)		; 32 2F
	eor $35.b		; 45 35
	lda $488D1F.l,X		; BF 1F 8D 48
	.db $62, $49, $8C		; 62 49 8C
	sta $4158.w,Y		; 99 58 41
	tya		; 98
	and ($16.b),Y		; 31 16
	stz $64.b		; 64 64
	mvp $96,$44		; 44 44 96
	stx $43.b,Y		; 96 43
	eor $64.b,S		; 43 64
	mvp $50,$22		; 44 22 50
	and [$43.b],Y		; 37 43
	and $32.b		; 25 32
	and #$35AC.w		; 29 AC 35
	plp		; 28
	sbc ($F1.b),Y		; F1 F1
	adc $36.b,X		; 75 36
	eor ($A5.b)		; 52 A5
	sta [$78.b]		; 87 78
	rtl		; 6B

	sbc [$E7.b],Y		; F7 E7
	sty $EF.b		; 84 EF
	cmp $9F9F7E.l		; CF 7E 9F 9F
	eor $0787.w,Y		; 59 87 07
	pha		; 48
	bcc -87.b		; 90 A9
	tsa		; 3B
	eor #$C7A1.w		; 49 A1 C7
	cmp $6F.b,S		; C3 6F
	ora ($86.b),Y		; 11 86
	lda #$583B.w		; A9 3B 58
	ora $B228.w		; 0D 28 B2
	cmp [$C7.b]		; C7 C7
	and $8F5C0F.l,X		; 3F 0F 5C 8F
	bvs  44.b		; 70 2C
	and ($8F.b)		; 32 8F
	sta [$7F.b]		; 87 7F
	ora $532E35.l,X		; 1F 35 2E 53
	and #$4148.w		; 29 48 41
	sbc $28F9.w,Y		; F9 F9 28
	eor #$2C58.w		; 49 58 2C
	eor $2B4D36.l,X		; 5F 36 4D 2B
	asl $31.b,X		; 16 31
	lsr A		; 4A
	sta $F34B8F.l,X		; 9F 8F 4B F3
	sbc ($37.b,S),Y		; F3 37
	eor ($99.b),Y		; 51 99
	ora ($37.b),Y		; 11 37
	adc [$98.b]		; 67 98
	and ($33.b),Y		; 31 33
	phb		; 8B
	rol $2E.b,X		; 36 2E
	eor $13EC.w		; 4D EC 13
	and ($7E.b,S),Y		; 33 7E
	lsr $84.b		; 46 84
	phk		; 4B
	sbc [$41.b],Y		; F7 41
	sbc ($EC.b,S),Y		; F3 EC
	cpx $DF.b		; E4 DF
	cmp #$576D.w		; C9 6D 57
	ror $1F1F.w		; 6E 1F 1F
	pha		; 48
	eor [$9A.b]		; 47 9A
	eor $AA5B49.l,X		; 5F 49 5B AA
	sta $901987.l,X		; 9F 87 19 90
	phy		; 5A
	eor [$58.b],Y		; 57 58
	asl $A1.b,X		; 16 A1
	sbc [$E1.b]		; E7 E1
	sty $FF.b,X		; 94 FF
	and $32A316.l,X		; 3F 16 A3 32
	cmp $0F3FC9.l		; CF C9 3F 0F
	and ($49.b),Y		; 31 49
	bcc 109.b		; 90 6D
	lda ($73.b,X)		; A1 73
	and $11.b,X		; 35 11
	jmp ($48AB.w)		; 6C AB 48
	ora $6C0F.w		; 0D 0F 6C
	cpx #$FCFF.w		; E0 FF FC
	and $58.b		; 25 58
	tsa		; 3B
	cmp $3C.b,S		; C3 3C
	eor [$19.b]		; 47 19
	jmp $83C35D.l		; 5C 5D C3 83
	ldx $92.b,Y		; B6 92
	eor [$E1.b],Y		; 57 E1
	asl $4929.w,X		; 1E 29 49
	ora $81E11F.l,X		; 1F 1F E1 81
	inc $8AF8.w,X		; FE F8 8A
	and ($5A.b,S),Y		; 33 5A
	and $1947.w		; 2D 47 19
	eor $E797.w,Y		; 59 97 E7
	sbc $3E.b,S		; E3 3E
	tad		; 5B
	sta ($29.b)		; 92 29
	adc $1B82.w,X		; 7D 82 1B
	cpx $49.b		; E4 49
	plp		; 28
	adc $1B3C.w,X		; 7D 3C 1B
	ora ($6D.b,X)		; 01 6D
	cpy #$6E3F.w		; C0 3F 6E
	cpy #$32C0.w		; C0 C0 32
	bra 127.b		; 80 7F
	adc [$88.b],Y		; 77 88
	and $80.b,X		; 35 80
	bra 119.b		; 80 77
	and $48.b,S		; 23 48
	jmp ($497B.w)		; 6C 7B 49
	ora $63F307.l		; 0F 07 F3 63
	tad		; 5B
	ora $5A62.w,Y		; 19 62 5A
	and ($2F.b,S),Y		; 33 2F
	asl $8C.b,X		; 16 8C
	sbc [$E7.b]		; E7 E7
	lsr $42.b		; 46 42
	tsa		; 3B
	adc $665D.w		; 6D 5D 66
	eor #$299D.w		; 49 9D 29
	pha		; 48
	sbc [$27.b]		; E7 27
	sbc $91E1.w,Y		; F9 E1 91
	eor #$7A19.w		; 49 19 7A
	ldy $A229.w		; AC 29 A2
	ldy $0F.b		; A4 0F
	sbc ($E1.b),Y		; F1 E1
	inc $92F8.w,X		; FE F8 92
	bit $708F.w		; 2C 8F 70
	eor $5949.w		; 4D 49 59
	sta $C3F30F.l		; 8F 0F F3 C3
	and #$A3AC.w		; 29 AC A3
	jsl $F0F128.l		; 22 28 F1 F0
	cmp $316FC3.l		; CF C3 6F 31
	jmp $4A6D2C.l		; 5C 2C 6D 4A
	ror $1FE0.w		; 6E E0 1F
	adc $A0E0.w		; 6D E0 A0
	sbc $1135FB.l,X		; FF FB 35 11
	jmp ($48AB.w)		; 6C AB 48
	ora $6C0F.w		; 0D 0F 6C
	bcs  -1.b		; B0 FF
	xce		; FB
	and $62.b		; 25 62
	ora [$E8.b],Y		; 17 E8
	rol $2E.b,X		; 36 2E
	and $8C2B.w		; 2D 2B 8C
	ora [$13.b],Y		; 17 13
	sbc $4E6BA7.l		; EF A7 6B 4E
	and [$9D.b],Y		; 37 9D
	mvp $44,$44		; 44 44 44
	sbc [$61.b]		; E7 61
	lda ($43.b)		; B2 43
	eor $43.b,S		; 43 43
	ora ($AB.b),Y		; 11 AB
	jmp ($0D48.w)		; 6C 48 0D
	beq 112.b		; F0 70
	ora $666605.l		; 0F 05 66 66
	and ($E0.b),Y		; 31 E0
	ora $E03257.l,X		; 1F 57 32 E0
	cpx #$0A1F.w		; E0 1F 0A
	and ($49.b),Y		; 31 49
	tsa		; 3B
	and ($29.b)		; 32 29
	and $283515.l,X		; 3F 15 35 28
	adc $33.b		; 65 33
	and $6B1155.l		; 2F 55 11 6B
	lsr $4246.w,X		; 5E 46 42
	ror A		; 6A
	lsr A		; 4A
	and ($A8.b),Y		; 31 A8
	jsl $F38D6F.l		; 22 6F 8D F3
	sbc ($5B.b),Y		; F1 5B
	and $22.b		; 25 22
	tay		; A8
	jmp $8D6F31.l		; 5C 31 6F 8D
	sbc ($F1.b,S),Y		; F3 F1
	tad		; 5B
	ora ($86.b),Y		; 11 86
	sta $280D.w,Y		; 99 0D 28
	lda ($41.b)		; B2 41
	tya		; 98
	bit $4A6D.w		; 2C 6D 4A
	and ($35.b),Y		; 31 35
	eor [$6D.b]		; 47 6D
	ldx $73.b,Y		; B6 73
	and $11.b,X		; 35 11
	eor [$9D.b],Y		; 57 9D
	and #$0D58.w		; 29 58 0D
	ora $87E71F.l,X		; 1F 1F E7 87
	sbc $91F1.w,Y		; F9 F1 91
	jmp $6E456D.l		; 5C 6D 45 6E
	cmp $2229CF.l		; CF CF 29 22
	.db $62, $28, $25		; 62 28 25
	sty $6347.w		; 8C 47 63
	stz $5557.w		; 9C 57 55
	cli		; 58
	tad		; 5B
	adc $21.b,S		; 63 21
	ora $316807.l,X		; 1F 07 68 31
	asl $62.b,X		; 16 62
	and $652E.w		; 2D 2E 65
	sty $6B67.w		; 8C 67 6B
	lsr $2C22.w,X		; 5E 22 2C
	eor $4A259D.l,X		; 5F 9D 25 4A
	sta $E3E78F.l,X		; 9F 8F E7 E3
	lda ($32.b)		; B2 32
	and #$352B.w		; 29 2B 35
	mvn $2D,$47		; 54 47 2D
	adc $3B.b		; 65 3B
	ora $675B.w,Y		; 19 5B 67
	lsr $316F.w,X		; 5E 6F 31
	ora $2919.w		; 0D 19 29
	pld		; 2B
	eor $2F52.w		; 4D 52 2F
	asl $54.b,X		; 16 54
	sbc ($F3.b,S),Y		; F3 F3
	lsr $B342.w,X		; 5E 42 B3
	jmp $837C.w		; 4C 7C 83
	and ($B3.b)		; 32 B3
	sta ($7C.b,S),Y		; 93 7C
	bit $FF.b		; 24 FF
	adc $2573.w,Y		; 79 73 25
	ora $A2A8.w,Y		; 19 A8 A2
	ldy $4F.b		; A4 4F
	sbc ($93.b,S),Y		; F3 93
	jsr ($FFE4.w,X)		; FC E4 FF
	sbc $3273.w,Y		; F9 73 32
	ply		; 7A
	and $A4.b,X		; 35 A4
	eor $F68B8A.l		; 4F 8A 8B F6
	ora #$05FA.w		; 09 FA 05
	pld		; 2B
	and #$6A59.w		; 29 59 6A
	lsr $4B.b		; 46 4B
	inc $F2.b,X		; F6 F2
	plx		; FA
	sed		; F8
	and [$28.b],Y		; 37 28
	and ($55.b,S),Y		; 33 55
	bit $4622.w		; 2C 22 46
	pla		; 68
	lsr A		; 4A
	ror $0D.b		; 66 0D
	and ($2C.b),Y		; 31 2C
	eor $58299D.l,X		; 5F 9D 29 58
	lsr A		; 4A
	sta $E3E78F.l,X		; 9F 8F E7 E3
	lda ($28.b)		; B2 28
	asl $FF.b,X		; 16 FF
	jsr ($2C22.w,X)		; FC 22 2C
	stz $C561.w,X		; 9E 61 C5
	dec A		; 3A
	and $25C6.w,Y		; 39 C6 25
	lsr A		; 4A
	stz $C58E.w,X		; 9E 8E C5
	brk $39.b		; 00 39
	and $2E2D.w,Y		; 39 2D 2E
	eor $55.b		; 45 55
	cli		; 58
	adc [$8D.b]		; 67 8D
	lda $1F7FAF.l,X		; BF AF 7F 1F
	and ($16.b),Y		; 31 16
	ora ($62.b),Y		; 11 62
	adc $3B.b		; 65 3B
	ora $6754.w		; 0D 54 67
	lsr $7B6F.w,X		; 5E 6F 7B
	and ($F3.b)		; 32 F3
	sta ($FC.b,S),Y		; 93 FC
	pea $FDFF.w		; F4 FF FD
	eor #$A819.w		; 49 19 A8
	ldx #$0FA4.w		; A2 A4 0F
	sbc ($C3.b,S),Y		; F3 C3
	jsr ($FFF0.w,X)		; FC F0 FF
	jsr ($480D.w,X)		; FC 0D 48
	and #$C23D.w		; 29 3D C2
	wai		; CB
	bit $49.b,X		; 34 49
	plp		; 28
	and $CB3C.w,X		; 3D 3C CB
	ora #$8622.w		; 09 22 86
	rol $2545.w		; 2E 45 25
	sta ($F9.b),Y		; 91 F9
	sbc ($F7.b),Y		; F1 F7
	sbc [$B4.b]		; E7 B4
	eor [$4D.b]		; 47 4D
	rol $A5.b,X		; 36 A5
	cli		; 58
	ldx $B5.b,Y		; B6 B5
	sbc $1F9F8F.l		; EF 8F 9F 1F
	eor $585C.w,Y		; 59 5C 58
	jmp ($29AC.w)		; 6C AC 29
	ldx #$0F31.w		; A2 31 0F
	ora [$F1.b]		; 07 F1
	beq  40.b		; F0 28
	sta ($3B.b)		; 92 3B
	lda #$4990.w		; A9 90 49
	adc $A1C3C7.l		; 6F C7 C3 A1
	.db $62, $99, $54		; 62 99 54
	adc [$98.b]		; 67 98
	sta $FF.b,X		; 95 FF
	and $6D2E6E.l,X		; 3F 6E 2E 6D
	sbc [$E3.b],Y		; F7 E3
	ror $8B2F.w		; 6E 2F 8B
	rol $ED4D.w		; 2E 4D ED
	ora ($DE.b)		; 12 DE
	and ($2F.b,X)		; 21 2F
	sta [$4B.b],Y		; 97 4B
	eor ($F3.b,X)		; 41 F3
	sbc ($ED.b),Y		; F1 ED
	cpx $DE.b		; E4 DE
	dec $4842.w		; CE 42 48
	and #$4D2B.w		; 29 2B 4D
	eor #$AE28.w		; 49 28 AE
	lda $11.b,X		; B5 11
	eor [$2D.b]		; 47 2D
	phy		; 5A
	lda $19.b		; A5 19
	adc ($5B.b,S),Y		; 73 5B
	lda $C7E7.w		; AD E7 C7
	sta $16591F.l,X		; 9F 1F 59 16
	tsa		; 3B
	adc $6E5D.w		; 6D 5D 6E
	eor [$9A.b],Y		; 57 9A
	eor [$48.b]		; 47 48
	sty $AA.b,X		; 94 AA
	tad		; 5B
	eor #$3B19.w		; 49 19 3B
	lda #$5890.w		; A9 90 58
	asl $6F.b,X		; 16 6F
	cmp [$C3.b]		; C7 C3
	lda ($5C.b,X)		; A1 5C
	pha		; 48
	eor [$9A.b],Y		; 57 9A
	eor [$25.b]		; 47 25
	and ($94.b),Y		; 31 94
	tax		; AA
	tad		; 5B
	ora ($62.b),Y		; 11 62
	rol $5545.w		; 2E 45 55
	ora $6754.w		; 0D 54 67
	sta $2F68.w		; 8D 68 2F
	and ($5A.b,S),Y		; 33 5A
	and $292B.w		; 2D 2B 29
	ora $E797.w,Y		; 19 97 E7
	sbc [$AD.b]		; E7 AD
	bvc -111.b		; 50 91
	asl $19.b,X		; 16 19
	stx $5A.b		; 86 5A
	eor $91168A.l,X		; 5F 8A 16 91
	sbc $E7F1.w,Y		; F9 F1 E7
	cmp [$9F.b]		; C7 9F
	sta $3FBF59.l,X		; 9F 59 BF 3F
	lda $32.b,S		; A3 32
	ldy $5D.b,X		; B4 5D
	and $8F.b,X		; 35 8F
	bvs -85.b		; 70 AB
	and ($8F.b)		; 32 8F
	sta [$F0.b]		; 87 F0
	beq  53.b		; F0 35
	ora $9A57.w,Y		; 19 57 9A
	eor [$44.b]		; 47 44
	and #$310D.w		; 29 0D 31
	sty $AA.b,X		; 94 AA
	tad		; 5B
	eor $28.b,S		; 43 28
	sta $49.b,X		; 95 49
	ror $31.b		; 66 31
	cli		; 58
	mvp $2E,$51		; 44 51 2E
	jmp $673743.l		; 5C 43 37 67
	and ($55.b,S),Y		; 33 55
	pha		; 48
	ror $3168.w,X		; 7E 68 31
	and $2A.b		; 25 2A
	ldx $08.b		; A6 08
	rol A		; 2A
	rol A		; 2A
	brk $14.b		; 00 14
	trb $A6.b		; 14 A6
	trb $2A2A.w		; 1C 2A 2A
	adc ($08.b),Y		; 71 08
	trb $1414.w		; 1C 14 14
	bit #$0871.w		; 89 71 08
	trb $1408.w		; 1C 08 14
	trb $1A.b		; 14 1A
	lsr $1A.b,X		; 56 1A
	brk $38.b		; 00 38
	brk $04.b		; 00 04
	brk $18.b		; 00 18
	brk $04.b		; 00 04
	brk $10.b		; 00 10
	inc A		; 1A
	jsr $0008.w		; 20 08 00
	bit $38.b,X		; 34 38
	rti		; 40

	trb $38.b		; 14 38
	bpl   8.b		; 10 08
	tsb $1008.w		; 0C 08 10
	inc A		; 1A
	lda ($85.b),Y		; B1 85
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	rol A		; 2A
	bit #$8500.w		; 89 00 85
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	rol A		; 2A
	sta $00.b		; 85 00
	tsb $0600.w		; 0C 00 06
	bit #$8569.w		; 89 69 85
	bit #$8569.w		; 89 69 85
	ldx $00.b		; A6 00
	lda ($10.b),Y		; B1 10
	rol A		; 2A
	brk $B1.b		; 00 B1
	bpl  42.b		; 10 2A
	bit #$6940.w		; 89 40 69
	bmi   0.b		; 30 00
	clc		; 18
	rol A		; 2A
	tsb $00.b		; 04 00
	cop $74.b		; 02 74
	brk $04.b		; 00 04
	tsb $02.b		; 04 02
	cop $2A.b		; 02 2A
	ldx $9B.b		; A6 9B
	stz $00.b,X		; 74 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	ora $001A.w,X		; 1D 1A 00
	lda ($30.b),Y		; B1 30
	rol A		; 2A
	lda ($30.b),Y		; B1 30
	ora $000B.w,X		; 1D 0B 00
	brk $12.b		; 00 12
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $7A03.w,X		; 1E 03 7A
	cop $C6.b		; 02 C6
	jsr $2908.w		; 20 08 29
	lsr A		; 4A
	and ($AD.b),Y		; 31 AD
	and $4610.w,X		; 3D 10 46
	eor ($4E.b)		; 52 4E
	sty $5A.b,X		; 94 5A
	sbc [$62.b],Y		; F7 62
	and $9C6B.w,Y		; 39 6B 9C
	adc [$FF.b],Y		; 77 FF
	adc $DB7FF8.l,X		; 7F F8 7F DB
	brk $12.b		; 00 12
	ror $00DB.w,X		; 7E DB 00
	lda $DB77.w,X		; BD 77 DB
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	and ($DB.b),Y		; 31 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	ora $7A.b,S		; 03 7A
	cop $C6.b		; 02 C6
	jsr $2908.w		; 20 08 29
	lsr A		; 4A
	and ($AD.b),Y		; 31 AD
	and $4610.w,X		; 3D 10 46
	eor ($4E.b)		; 52 4E
	sty $5A.b,X		; 94 5A
	sbc [$62.b],Y		; F7 62
	and $9C6B.w,Y		; 39 6B 9C
	adc [$FF.b],Y		; 77 FF
	adc $DB7FF8.l,X		; 7F F8 7F DB
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $80.b,S		; 03 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($81.b)		; 32 81
	and ($82.b)		; 32 82
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($83.b)		; 32 83
	and ($84.b)		; 32 84
	and ($84.b)		; 32 84
	adc ($85.b)		; 72 85
	and ($86.b)		; 32 86
	and ($87.b)		; 32 87
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($88.b)		; 32 88
	and ($89.b)		; 32 89
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8A.b)		; 32 8A
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8B.b)		; 32 8B
	and ($8C.b)		; 32 8C
	and ($8D.b)		; 32 8D
	and ($80.b)		; 32 80
	and ($8E.b)		; 32 8E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8F.b)		; 32 8F
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($90.b)		; 32 90
	and ($82.b)		; 32 82
	and ($80.b)		; 32 80
	and ($91.b)		; 32 91
	and ($92.b)		; 32 92
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($95.b)		; 32 95
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($96.b)		; 32 96
	and ($89.b)		; 32 89
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($97.b)		; 32 97
	and ($98.b)		; 32 98
	and ($99.b)		; 32 99
	and ($9A.b)		; 32 9A
	and ($9B.b)		; 32 9B
	and ($9C.b)		; 32 9C
	and ($9D.b)		; 32 9D
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	sbc ($9E.b)		; F2 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($9F.b)		; 32 9F
	and ($A0.b)		; 32 A0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($A1.b)		; 32 A1
	and ($A2.b)		; 32 A2
	and ($A3.b)		; 32 A3
	and ($A4.b)		; 32 A4
	and ($A5.b)		; 32 A5
	and ($A6.b)		; 32 A6
	and ($A7.b)		; 32 A7
	and ($A0.b)		; 32 A0
	and ($8D.b)		; 32 8D
	adc ($A8.b)		; 72 A8
	and ($A9.b)		; 32 A9
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($AA.b)		; 32 AA
	and ($AB.b)		; 32 AB
	and ($AC.b)		; 32 AC
	and ($9E.b)		; 32 9E
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($AD.b)		; 32 AD
	and ($AE.b)		; 32 AE
	and ($AF.b)		; 32 AF
	and ($B0.b)		; 32 B0
	and ($B1.b)		; 32 B1
	and ($80.b)		; 32 80
	and ($B2.b)		; 32 B2
	and ($B3.b)		; 32 B3
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($B4.b)		; 32 B4
	and ($B5.b)		; 32 B5
	and ($B6.b)		; 32 B6
	and ($B7.b)		; 32 B7
	and ($B8.b)		; 32 B8
	and ($B9.b)		; 32 B9
	and ($BA.b)		; 32 BA
	and ($BB.b)		; 32 BB
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($BD.b)		; 32 BD
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C0.b)		; 32 C0
	and ($C1.b)		; 32 C1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C2.b)		; 32 C2
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C3.b)		; 32 C3
	and ($C4.b)		; 32 C4
	and ($9E.b)		; 32 9E
	lda ($80.b)		; B2 80
	and ($C5.b)		; 32 C5
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BC.b)		; 32 BC
	and ($C6.b)		; 32 C6
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C7.b)		; 32 C7
	and ($C8.b)		; 32 C8
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($C9.b)		; 32 C9
	and ($CA.b)		; 32 CA
	and ($CB.b)		; 32 CB
	and ($CC.b)		; 32 CC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($93.b)		; 32 93
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CD.b)		; 72 CD
	and ($CE.b)		; 32 CE
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8D.b)		; 32 8D
	adc ($CF.b)		; 72 CF
	and ($D0.b)		; 32 D0
	and ($D1.b)		; 32 D1
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D2.b)		; 32 D2
	and ($BF.b)		; 32 BF
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D3.b)		; 32 D3
	and ($D4.b)		; 32 D4
	and ($D5.b)		; 32 D5
	and ($94.b)		; 32 94
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($BE.b)		; 32 BE
	lda ($BF.b)		; B2 BF
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($D6.b)		; 32 D6
	and ($D7.b)		; 32 D7
	and ($8D.b)		; 32 8D
	adc ($99.b)		; 72 99
	lda ($D8.b)		; B2 D8
	and ($D9.b)		; 32 D9
	and ($84.b)		; 32 84
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($DB.b)		; 32 DB
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DC.b)		; 32 DC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DD.b)		; 32 DD
	and ($BF.b)		; 32 BF
	lda ($80.b)		; B2 80
	and ($DE.b)		; 32 DE
	and ($DF.b)		; 32 DF
	and ($E0.b)		; 32 E0
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E1.b)		; 32 E1
	and ($E2.b)		; 32 E2
	and ($E3.b)		; 32 E3
	and ($B3.b)		; 32 B3
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E4.b)		; 32 E4
	and ($BF.b)		; 32 BF
	and ($E5.b)		; 32 E5
	and ($E6.b)		; 32 E6
	and ($E7.b)		; 32 E7
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($E8.b)		; 32 E8
	and ($E9.b)		; 32 E9
	and ($EA.b)		; 32 EA
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($DA.b)		; 32 DA
	and ($84.b)		; 32 84
	lda ($80.b)		; B2 80
	and ($EB.b)		; 32 EB
	and ($EC.b)		; 32 EC
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($80.b)		; 32 80
	and ($8E.b)		; 32 8E
	and ($80.b)		; 32 80
	and ($20.b)		; 32 20
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	ora $D0.b,S		; 03 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D1.b),Y		; 11 D1
	ora ($D2.b),Y		; 11 D2
	ora ($D2.b),Y		; 11 D2
	ora ($D3.b),Y		; 11 D3
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D4.b),Y		; 11 D4
	ora ($D5.b),Y		; 11 D5
	ora ($D6.b),Y		; 11 D6
	ora ($D7.b),Y		; 11 D7
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D9.b),Y		; 11 D9
	ora ($DA.b),Y		; 11 DA
	ora ($DB.b),Y		; 11 DB
	ora ($DB.b),Y		; 11 DB
	eor ($DA.b),Y		; 51 DA
	eor ($D9.b),Y		; 51 D9
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D7.b),Y		; 51 D7
	eor ($D6.b),Y		; 51 D6
	eor ($D5.b),Y		; 51 D5
	eor ($D4.b),Y		; 51 D4
	eor ($D0.b),Y		; 51 D0
	eor ($D0.b),Y		; 51 D0
	eor ($D0.b),Y		; 51 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($DC.b),Y		; 11 DC
	ora ($DD.b),Y		; 11 DD
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($DD.b),Y		; 51 DD
	eor ($DC.b),Y		; 51 DC
	eor ($D0.b),Y		; 51 D0
	eor ($D0.b),Y		; 51 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($E0.b),Y		; 11 E0
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($E0.b),Y		; 51 E0
	eor ($D0.b),Y		; 51 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($E3.b),Y		; 11 E3
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($E3.b),Y		; 51 E3
	eor ($D0.b),Y		; 51 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($E5.b),Y		; 11 E5
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	ora ($D8.b),Y		; 11 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($D8.b),Y		; 51 D8
	eor ($E5.b),Y		; 51 E5
	eor ($D0.b),Y		; 51 D0
	ora ($D0.b),Y		; 11 D0
	ora ($D0.b),Y		; 11 D0
	ora ($26.b),Y		; 11 26
	xce		; FB
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	ora ($82.b,X)		; 01 82
	rti		; 40

	cmp $996A.w,Y		; D9 6A 99
	brk $81.b		; 00 81
	ora $8C.b,S		; 03 8C
	mvp $62,$93		; 44 93 62
	bmi -118.b		; 30 8A
	ora $8C837B.l,X		; 1F 7B 83 8C
	php		; 08
	eor $25.b,S		; 43 25
	ldx #$2222.w		; A2 22 22
	jsl $A26822.l		; 22 22 68 A2
	jsl $932222.l		; 22 22 22 93
	mvp $A2,$6A		; 44 6A A2
	jsl $9A2022.l		; 22 22 20 9A
	jsl $444444.l		; 22 44 44 44
	lsr $53.b		; 46 53
	mvp $98,$73		; 44 73 98
	dey		; 88
	dey		; 88
	sta $34A9.w		; 8D A9 34
	sbc $AAEE.w,X		; FD EE AA
	jsl $13A036.l		; 22 36 A0 13
	eor #$EADE.w		; 49 DE EA
	bra -115.b		; 80 8D
	tyx		; BB
	brk $12.b		; 00 12
	adc $00F67D.l		; 6F 7D F6 00
	eor ($44.b,S),Y		; 53 44
	tax		; AA
	txs		; 9A
	clc		; 18
	sbc $60.b		; E5 60
	brk $67.b		; 00 67
	rol $B3.b,X		; 36 B3
	eor $60E588.l		; 4F 88 E5 60
	tsb $D7.b		; 04 D7
	sbc [$9B.b]		; E7 9B
	cli		; 58
	cop $22.b		; 02 22
	and $2B.b,S		; 23 2B
	ldy $9726.w		; AC 26 97
	stz $F6DE.w		; 9C DE F6
	lda ($11.b),Y		; B1 11
	lda [$CA.b],Y		; B7 CA
	sei		; 78
	cpx $7D4D.w		; EC 4D 7D
	sbc $BCAAEF.l		; EF EF AA BC
	sbc ($BE.b,S),Y		; F3 BE
	dec $25DA.w		; CE DA 25
	cmp $E5116D.l,X		; DF 6D 11 E5
	adc $80.b,X		; 75 80
	ora [$3C.b]		; 07 3C
	dec $B0F6.w,X		; DE F6 B0
	ora ($11.b,X)		; 01 11
	ora ($96.b),Y		; 11 96
	trb $9AAE.w		; 1C AE 9A
	lsr $8C73.w,X		; 5E 73 8C
	adc ($CD.b,S),Y		; 73 CD
	sbc $9F6FFB.l		; EF FB 6F 9F
	and $9452.w,X		; 3D 52 94
	sbc $EDEFFD.l,X		; FF FD EF ED
	adc $27AD7D.l,X		; 7F 7D AD 27
	sta $80.b		; 85 80
	ora ($C7.b,X)		; 01 C7
	asl $B3.b,X		; 16 B3
	eor $E98888.l		; 4F 88 88 E9
	stx $59.b,Y		; 96 59
	eor $AE2F.w		; 4D 2F AE
	lda ($A4.b,S),Y		; B3 A4
	sed		; F8
	sbc ($E3.b),Y		; F1 E3
	cmp [$8F.b]		; C7 8F
	asl $E629.w,X		; 1E 29 E6
	dey		; 88
	cmp $61.b,X		; D5 61
	stx $18.b		; 86 18
	adc ($86.b,X)		; 61 86
	ora $4463.w,Y		; 19 63 44
	adc ($9A.b,S),Y		; 73 9A
	eor ($D7.b,S),Y		; 53 D7
	cmp $8A7E9B.l		; CF 9B 7E 8A
	cmp [$F7.b],Y		; D7 F7
	cmp $BFF7B5.l,X		; DF B5 F7 BF
	sbc $B30090.l,X		; FF 90 00 B3
	sta $C0.b		; 85 C0
	ora $AD.b		; 05 AD
	cmp [$17.b]		; C7 17
	ldx $7459.w,Y		; BE 59 74
	dey		; 88
	dey		; 88
	sty $F5EB.w		; 8C EB F5
	pei ($D2.b)		; D4 D2
	cpx $D4.b		; E4 D4
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 06FFFF. Skipping.
.ENDS
