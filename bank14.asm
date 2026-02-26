.BANK 14 SLOT 0
.ORG $0000

.SECTION "Bank14" FORCE

	rol $FB.b		; 26 FB
	brk $41.b		; 00 41
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	jsr $168A.w		; 20 8A 16
	phk		; 4B
	lsr $E3.b,X		; 56 E3
	cop $41.b		; 02 41
	dey		; 88
	cpx #$80F1.w		; E0 F1 80
	jsr $2970.w		; 20 70 29
	sta $44.b,S		; 83 44
	bmi -64.b		; 30 C0
	sty $23.b		; 84 23
	and [$FC.b],Y		; 37 FC
	eor #$B2A0.w		; 49 A0 B2
	ora ($0E.b,S),Y		; 13 0E
	sty $7C.b,X		; 94 7C
	sei		; 78
	cpy $44.b		; C4 44
	inc $5194.w,X		; FE 94 51
	dex		; CA
	lsr $DDFB.w		; 4E FB DD
	jsl $941326.l		; 22 26 13 94
	sed		; F8
	cmp $22.b,X		; D5 22
	lda #$C2C8.w		; A9 C8 C2
	ror $88CB.w		; 6E CB 88
	stx $B5.b,Y		; 96 B5
	eor ($56.b,S),Y		; 53 56
	phk		; 4B
	adc $E496.w		; 6D 96 E4
	lsr A		; 4A
	stx $3E.b		; 86 3E
	ldx #$9778.w		; A2 78 97
	lda $F45D45.l		; AF 45 5D F4
	sbc ($58.b)		; F2 58
	eor $922D.w,X		; 5D 2D 92
	adc $32.b,X		; 75 32
	phk		; 4B
	pea $59B7.w		; F4 B7 59
	jmp ($4991.w)		; 6C 91 49
	phb		; 8B
	sta ($AC.b),Y		; 91 AC
	lda ($C9.b,S),Y		; B3 C9
	adc ($65.b)		; 72 65
	lda [$E9.b],Y		; B7 E9
	ora #$2D49.w		; 09 49 2D
	dec $4D.b,X		; D6 4D
	ldy $EB92.w		; AC 92 EB
	jsl $6B2495.l		; 22 95 24 6B
	jmp ($C5BE.w)		; 6C BE C5
	wai		; CB
	.db $62, $37, $EA		; 62 37 EA
	eor $A5CAB2.l		; 4F B2 CA A5
	cmp $A722.w,X		; DD 22 A7
	sta ($44.b)		; 92 44
	sty $8C.b		; 84 8C
	sta [$03.b],Y		; 97 03
	rtl		; 6B

	cmp ($E8.b,X)		; C1 E8
	sed		; F8
	and $D71D.w,X		; 3D 1D D7
	lda #$72DF.w		; A9 DF 72
	xce		; FB
	inc $F558.w		; EE 58 F5
	rol $BE.b,X		; 36 BE
	lda $D18947.l		; AF 47 89 D1
.ACCU 8
.INDEX 8
	sep #$7A		; E2 7A
	sty $F2.b,X		; 94 F2
	sbc #$E5.b		; E9 E5
	cmp ($02.b,S),Y		; D3 02
	bit $99.b		; 24 99
	sbc [$01.b]		; E7 01
	bpl -124.b		; 10 84
	and [$04.b]		; 27 04
	php		; 08
	sta ($40.b)		; 92 40
	ora ($08.b),Y		; 11 08
	rti		; 40

	ora $FDDD.w		; 0D DD FD
	cmp $DDFD.w,X		; DD FD DD
	sbc $FDDD.w,X		; FD DD FD
	cmp $DDFD.w,X		; DD FD DD
	sbc $FDDD.w,X		; FD DD FD
	cmp $F4FB.w,X		; DD FB F4
	cmp $37FDA6.l,X		; DF A6 FD 37
	sbc #$BF.b		; E9 BF
	eor $6FFA.w		; 4D FA 6F
	cmp ($7E.b,S),Y		; D3 7E
	sty $84.b,X		; 94 84
	ply		; 7A
	sbc ($26.b)		; F2 26
	phx		; DA
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $C4.b,X		; D5 C4
	sta $DE.b,X		; 95 DE
	cpy $D1.b		; C4 D1
	bit $4D.b,X		; 34 4D
	ora $7240EE.l,X		; 1F EE 40 72
	sbc $6A.b		; E5 6A
	sta ($6F.b)		; 92 6F
	cmp $FA3B89.l,X		; DF 89 3B FA
	adc $FA.b,S		; 63 FA
	sbc $AE.b,S		; E3 AE
	bra  15.b		; 80 0F
	dec A		; 3A
	eor [$E9.b],Y		; 57 E9
	dex		; CA
	inc $32.b,X		; F6 32
	lda ($27.b),Y		; B1 27
	adc ($E3.b,S),Y		; 73 E3
	lda [$8F.b],Y		; B7 8F
	ply		; 7A
	bra  15.b		; 80 0F
	cpx #$95.b		; E0 95
	inc $A5.b,X		; F6 A5
	bvs -31.b		; 70 E1
	bit #$3B.b		; 89 3B
	pea $BFC7.w		; F4 C7 BF
	sta $0F80DA.l		; 8F DA 80 0F
	cmp $92FD95.l,X		; DF 95 FD 92
	lda $AC9C.w,X		; BD 9C AC
	eor #$53.b		; 49 53
	mvp $F6,$47		; 44 47 F6
	cpy $D1.b		; C4 D1
	and ($02.b)		; 32 02
	tax		; AA
	sty $AAAC.w		; 8C AC AA
	lda $E2.b		; A5 E2
	lsr A		; 4A
	sbc ($E3.b),Y		; F1 E3
	adc $1B.b,X		; 75 1B
	tay		; A8
	cmp $01C7.w,X		; DD C7 01
	ora ($E4.b,X)		; 01 E4
	lsr A		; 4A
	cmp ($2F.b,S),Y		; D3 2F
	sbc #$CA.b		; E9 CA
	sbc $5859.w,X		; FD 59 58
	sta ($3D.b,S),Y		; 93 3D
	pei ($77.b)		; D4 77
	ora ($E7.b),Y		; 11 E7
	cmp [$7A.b]		; C7 7A
	bra  44.b		; 80 2C
	lda ($4F.b,S),Y		; B3 4F
	eor $CB2B79.l		; 4F 79 2B CB
	sta $89.b,X		; 95 89
	and ($C5.b,S),Y		; 33 C5
	sta $A83C2A.l		; 8F 2A 3C A8
	sbc ($90.b)		; F2 90
	ora [$0E.b]		; 07 0E
	lsr $F4.b,X		; 56 F4
	sta ($76.b,S),Y		; 93 76
	tad		; 5B
	rol $EE.b		; 26 EE
	eor $9BDC.w		; 4D DC 9B
	lda $7237.w,Y		; B9 37 72
	ror $DDE4.w		; 6E E4 DD
	cmp #$64.b		; C9 64
	bra -43.b		; 80 D5
	ror A		; 6A
	lda $5A.b,X		; B5 5A
	ldx $36.b		; A6 36
	rol $36.b,X		; 36 36
	rol $36.b,X		; 36 36
	rol $34.b,X		; 36 34
	phb		; 8B
	eor $7461.w,X		; 5D 61 74
	sta $C5BA.w,X		; 9D BA C5
	phb		; 8B
	ora ($35.b)		; 12 35
	sbc ($DD.b,S),Y		; F3 DD
	ora $F5.b		; 05 F5
	eor $5F2369.l		; 4F 69 23 5F
	ora ($5B.b,X)		; 01 5B
	ldy $3B6A.w,X		; BC 6A 3B
	sty $8B.b,X		; 94 8B
	cli		; 58
	bcs  99.b		; B0 63
	adc $63.b,S		; 63 63
	pha		; 48
	cmp $4A.b		; C5 4A
	sta $9EBB.w,X		; 9D BB 9E
	sbc [$B9.b]		; E7 B9
	inc $23DD.w		; EE DD 23
	jmp $CE39A7.l		; 5C A7 39 CE
	stz $DD.b,X		; 74 DD
	bit $8B.b,X		; 34 8B
	adc $63.b,S		; 63 63
	bvs -36.b		; 70 DC
	sta [$21.b]		; 87 21
	iny		; C8
	adc ($12.b)		; 72 12
	and $B1B6.w		; 2D B6 B1
	bcs -79.b		; B0 B1
	.db $62, $C5, $89		; 62 C5 89
	inc A		; 1A
	sbc $B2E8C3.l,X		; FF C3 E8 B2
	cmp $B46F.w,Y		; D9 6F B4
	sta ($AE.b),Y		; 91 AE
	cop $C5.b		; 02 C5
	phb		; 8B
	asl $24.b,X		; 16 24
	rtl		; 6B

	sbc $D9B2.w		; ED B2 D9
	jmp ($88B7.w)		; 6C B7 88
	sta ($AF.b),Y		; 91 AF
	dec $57FE.w		; CE FE 57
	cmp $D57C.w		; CD 7C D5
	eor #$1A.b		; 49 1A
	sbc $8C2E55.l		; EF 55 2E 8C
	sty $8B.b,X		; 94 8B
	lsr $DE3F.w		; 4E 3F DE
	dec $8D37.w,X		; DE 37 8D
	sbc $78.b,S		; E3 78
	sta ($6E.b),Y		; 91 6E
	jsl $DF7477.l		; 22 77 74 DF
	and [$CD.b],Y		; 37 CD
	sbc ($C6.b,S),Y		; F3 C6
	pha		; 48
	ldx $BC.b		; A6 BC
	sta $2B58.w,X		; 9D 58 2B
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda ($8D.b),Y		; B1 8D
	stx $8926.w		; 8E 26 89
	ldx #$68.b		; A2 68
	sta ($01.b)		; 92 01
	mvn $02,$92		; 54 92 02
	ora ($1F.b),Y		; 11 1F
	cmp $1E.b,X		; D5 1E
	stz $7F.b		; 64 7F
	jmp $0049.w		; 4C 49 00
	cmp $CDCDCF.l		; CF CF CD CD
	sbc ($A5.b,S),Y		; F3 A5
	rti		; 40

	.db $42, $23		; 42 23
	ldy $8E.b,X		; B4 8E
	cmp ($3D.b)		; D2 3D
	cpx $0049.w		; EC 49 00
	dec $97.b,X		; D6 97
	cmp $84.b,S		; C3 84
	tsb $22.b		; 04 22
	tsa		; 3B
	pla		; 68
	sbc $F6A3.w		; ED A3 F6
	cpy $90.b		; C4 90
	asl $BF9C.w		; 0E 9C BF
	adc [$2A.b]		; 67 2A
	cop $11.b		; 02 11
	tas		; 1B
	tay		; A8
	cmp $EA46.w,X		; DD 46 EA
	bit $80.b		; 24 80
	eor ($24.b,S),Y		; 53 24
	bra -124.b		; 80 84
	eor [$95.b]		; 47 95
	asl $7854.w,X		; 1E 54 78
	lda ($24.b),Y		; B1 24
	cop $F4.b		; 02 F4
	lda $04540E.l,X		; BF 0E 54 04
	jsl $DC4DEE.l		; 22 EE 4D DC
	txy		; 9B
	lda $7237.w,Y		; B9 37 72
	ror $DDE4.w		; 6E E4 DD
	tay		; A8
	inc A		; 1A
	lda $AB56.w		; AD 56 AB
	eor $AA.b,X		; 55 AA
	cmp $76.b,X		; D5 76
	asl $22C1.w		; 0E C1 22
	bit $A4.b,X		; 34 A4
	and $C6.b		; 25 C6
	dec $91.b		; C6 91
	cmp $42C8.w,Y		; D9 C8 42
	.db $42, $08		; 42 08
	.db $42, $47		; 42 47
	adc $1072.w,X		; 7D 72 10
	sta ($BC.b),Y		; 91 BC
	eor $10A2.w		; 4D A2 10
	sta ($DD.b),Y		; 91 DD
	eor ($B0.b,S),Y		; 53 B0
	ror $09.b,X		; 76 09
	ora $A4E6.w,X		; 1D E6 A4
	jsl $4548C9.l		; 22 C9 48 45
	rep #$48		; C2 48
	eor $DD.b		; 45 DD
	ldy $53.b		; A4 53
	adc [$7F.b],Y		; 77 7F
	adc [$7F.b],Y		; 77 7F
	adc [$7F.b],Y		; 77 7F
	cpx $DF.b		; E4 DF
	sbc $FE37.w,Y		; F9 37 FE
	eor $DDFD.w		; 4D FD DD
	sbc $FBDD.w,X		; FD DD FB
	pea $A6DF.w		; F4 DF A6
	sbc $E937.w,X		; FD 37 E9
	lda $6FFA4D.l,X		; BF 4D FA 6F
	cmp ($7E.b,S),Y		; D3 7E
	txs		; 9A
	eor $1D6FF4.l,X		; 5F F4 6F 1D
	txy		; 9B
	ldx $FD.b		; A6 FD
	rtl		; 6B

	asl $24.b,X		; 16 24
	tad		; 5B
	sbc ($3E.b),Y		; F1 3E
	adc $E6.b,S		; 63 E6
	rol $F163.w,X		; 3E 63 F1
	rol A		; 2A
	mvn $6F,$91		; 54 91 6F
	xce		; FB
	lda [$ED.b],Y		; B7 ED
	stx $CB.b,Y		; 96 CB
	jmp.w [$D748]		; DC 48 D7
	ldy $D2.b		; A4 D2
	adc ($69.b,X)		; 61 69
	bit $52.b,X		; 34 52
	and $F2.b,X		; 35 F2
	txy		; 9B
	dec $F1.b		; C6 F1
	ldy $126F.w,X		; BC 6F 12
	and $ED.b,X		; 35 ED
	and ($9E.b,S),Y		; 33 9E
	ora ($78.b,S),Y		; 13 78
	beq -110.b		; F0 92
	and ($3B.b),Y		; 31 3B
	tsx		; BA
	adc $98399F.l		; 6F 9F 39 98
	xce		; FB
	sbc #$18.b		; E9 18
	dec $6B.b,X		; D6 6B
	and $1676.w,X		; 3D 76 16
	asl $14.b,X		; 16 14
	sta $EF79.w		; 8D 79 EF
	jsr ($4EB9.w,X)		; FC B9 4E
	eor ($94.b,S),Y		; 53 94
	sta ($AE.b),Y		; 91 AE
	rtl		; 6B

	eor ($E9.b,X)		; 41 E9
	ldy $1C.b,X		; B4 1C
	pei ($8D.b)		; D4 8D
	adc [$29.b]		; 67 29
	stz $8C.b		; 64 8C
	cpx $8C.b		; E4 8C
	adc $9D.b,X		; 75 9D
	ror $D3.b		; 66 D3
	ora ($AC.b,S),Y		; 13 AC
	phx		; DA
	.db $62, $48, $B6		; 62 48 B6
	sbc $89.b,X		; F5 89
	.db $62, $F3, $31		; 62 F3 31
	wai		; CB
	pha		; 48
	cmp [$25.b]		; C7 25
	stz $C6FD.w,X		; 9E FD C6
	rtl		; 6B

	and $C2.b,X		; 35 C2
	pha		; 48
	cmp $4A.b		; C5 4A
	sta $2A.b,X		; 95 2A
	mvn $0C,$F9		; 54 F9 0C
	phk		; 4B
	ora ($29.b)		; 12 29
	txs		; 9A
	cmp $B366.w		; CD 66 B3
	eor $12AE.w,Y		; 59 AE 12
	lsr $34.b		; 46 34
	txs		; 9A
	eor $9326.w		; 4D 26 93
	eor #$DD.b		; 49 DD
	ldy $62.b		; A4 62
	stz $E9.b,X		; 74 E9
	cmp ($A7.b,S),Y		; D3 A7
	pha		; 48
	eor $D1.b		; 45 D1
	sta ($C0.b)		; 92 C0
	inc A		; 1A
	cpx $2C2C.w		; EC 2C 2C
	jsr $2411.w		; 20 11 24
	stp		; DB
	ldx $00.b,Y		; B6 00
	bra -60.b		; 80 C4
	brk $89.b		; 00 89
	and [$5B.b]		; 27 5B
	cli		; 58
	ora ($01.b,X)		; 01 01
	phx		; DA
	brk $22.b		; 00 22
	phk		; 4B
	brk $42.b		; 00 42
	mvp $25,$72		; 44 72 25
	ldx $5DE4.w		; AE E4 5D
	iny		; C8
	tsx		; BA
	brk $BA.b		; 00 BA
	ora $2C80.w		; 0D 80 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	cpy $8F.b		; C4 8F
	tda		; 7B
	lsr $D8BB.w		; 4E BB D8
	pha		; 48
	sbc [$FA.b],Y		; F7 FA
	ldy $DA.b,X		; B4 DA
	adc #$1E.b		; 69 1E
	inx		; E8
	and [$8D.b],Y		; 37 8D
	sep #$46		; E2 46
	lda [$4E.b]		; A7 4E
	jmp.w [$4EA7]		; DC A7 4E
	sta ($ED.b),Y		; 91 ED
	stx $CB.b		; 86 CB
	adc $23.b		; 65 23
	lsr $0E.b,X		; 56 0E
	sbc #$D0.b		; E9 D0
	stz $12.b,X		; 74 12
	and $52.b,X		; 35 52
	lda $D6.b		; A5 D6
	lda $51.b,S		; A3 51
	and $DD.b,S		; 23 DD
	wai		; CB
	stz $E9F7.w,X		; 9E F7 E9
	inc A		; 1A
	dec $39.b		; C6 39
	stx $8E3B.w		; 8E 3B 8E
	sta ($EE.b),Y		; 91 EE
	ora ($41.b,S),Y		; 13 41
	sed		; F8
	ora ($3D.b)		; 12 3D
	dec A		; 3A
	stx $4A.b,Y		; 96 4A
	eor $3A.b		; 45 3A
	and ($26.b)		; 32 26
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
.INDEX 16
	rep #$D6		; C2 D6
	lda [$25.b],Y		; B7 25
	cpy $97.b		; C4 97
	bit #$89.b		; 89 89
	bit #$88.b		; 89 88
	cop $D7.b		; 02 D7
	asl $49.b,X		; 16 49
	dec $D6.b,X		; D6 D6
	bit #$2F.b		; 89 2F
	cpy #$0F78.w		; C0 78 0F
	ora ($DA.b,X)		; 01 DA
	brk $22.b		; 00 22
	lsr $3C79.w,X		; 5E 79 3C
	trb $28.b		; 14 28
	bvc -95.b		; 50 A1
	.db $42, $88		; 42 88
	sta [$AA.b],Y		; 97 AA
	eor $93C904.l		; 4F 04 C9 93
	rol $4C.b		; 26 4C
	txs		; 9A
	and $F5.b		; 25 F5
	sbc $FFFFF5.l,X		; FF F5 FF FF
	lda $E2AF.w,X		; BD AF E2
	cmp [$7A.b],Y		; D7 7A
	tyx		; BB
	cmp $DE.b,X		; D5 DE
	adc $EB3A.w		; 6D 3A EB
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	sta ($2F.b),Y		; 91 2F
	xce		; FB
	and $FF.b		; 25 FF
	tsx		; BA
	eor [$14.b],Y		; 57 14
	sta ($D5.b)		; 92 D5
	stz $D6.b,X		; 74 D6
	dec $D6.b,X		; D6 D6
	dec $D6.b,X		; D6 D6
	dec $E2.b,X		; D6 E2
	eor $9022.w,X		; 5D 22 90
	sty $21.b		; 84 21
	php		; 08
	iny		; C8
	tyx		; BB
	sta ($77.b),Y		; 91 77
	jsl $DC45EE.l		; 22 EE 45 DC
	phb		; 8B
	lda $7217.w,Y		; B9 17 72
	rol $5DE4.w		; 2E E4 5D
	jmp ($1B36.w)		; 6C 36 1B
	ora $C386.w		; 0D 86 C3
	adc ($B0.b,X)		; 61 B0
	cld		; D8
	lda ($B4.b),Y		; B1 B4
	bcc -125.b		; 90 83
	ldy #$92F0.w		; A0 F0 92
	bpl 105.b		; 10 69
	ldx $A612.w,Y		; BE 12 A6
	lsr A		; 4A
	eor [$37.b]		; 47 37
	sta $8454.w		; 8D 54 84
	ora ($B4.b,S),Y		; 13 B4
	eor ($10.b)		; 52 10
	jmp ($40B6.w)		; 6C B6 40
	ora [$ED.b]		; 07 ED
	pha		; 48
	lda [$41.b]		; A7 41
	ldx $00.b		; A6 00
	and $14A9.w,Y		; 39 A9 14
	pei ($5D.b)		; D4 5D
	brk $1F.b		; 00 1F
	eor $22.b		; 45 22
	txy		; 9B
	and $1800E2.l		; 2F E2 00 18
	eor ($29.b)		; 52 29
	cmp [$7E.b]		; C7 7E
	and $6F.b		; 25 6F
	cli		; 58
	adc ($61.b,X)		; 61 61
	adc $34457A.l,X		; 7F 7A 45 34
	trb $0170.w		; 1C 70 01
	inc $D2.b,X		; F6 D2
	and $B19C.w		; 2D 9C B1
	cli		; 58
	sbc $98.b,X		; F5 98
	cli		; 58
	eor ($3D.b)		; 52 3D
	sta $85.b		; 85 85
	inc $24.b		; E6 24
	tda		; 7B
	php		; 08
	sbc $2F4292.l,X		; FF 92 42 2F
	ldx $4E91.w,Y		; BE 91 4E
	sty $B589.w		; 8C 89 B5
	txs		; 9A
	cmp $B366.w		; CD 66 B3
	eor $D6AC.w,Y		; 59 AC D6
	rtl		; 6B

	mvp $02,$BF		; 44 BF 02
	eor [$C9.b],Y		; 57 C9
	sta $88.b,X		; 95 88
	stp		; DB
	stp		; DB
	txs		; 9A
	adc $B5BD.w		; 6D BD B5
	lda $A5.b		; A5 A5
	lda $A5.b		; A5 A5
	lda $A5.b		; A5 A5
	lda $A8.b		; A5 A8
	sta $6E6D.w		; 8D 6D 6E
	bit $4AAF.w		; 2C AF 4A
	eor [$71.b],Y		; 57 71
	pld		; 2B
	lda $12AD.w		; AD AD 12
	sbc [$68.b]		; E7 68
	beq  30.b		; F0 1E
	sbc $76CE.w,Y		; F9 CE 76
	bra -98.b		; 80 9E
	eor #$88.b		; 49 88
	stz $504B.w,X		; 9E 4B 50
	lda ($42.b,X)		; A1 42
	adc $0A.b,X		; 75 0A
	trb $28.b		; 14 28
	plb		; AB
	eor ($AD.b)		; 52 AD
	lsr A		; 4A
	lda $2D.b,X		; B5 2D
	eor $58.b		; 45 58
	rol A		; 2A
	cmp ($56.b,X)		; C1 56
	asl A		; 0A
	bcs  38.b		; B0 26
	jmp $8D99.w		; 4C 99 8D
	and ($64.b)		; 32 64
	cmp #$AB.b		; C9 AB
	sta ($62.b)		; 92 62
	pld		; 2B
	sta ($D7.b)		; 92 D7
	ora [$17.b],Y		; 17 17
	ora $C5.b		; 05 C5
	cmp $C5.b		; C5 C5
	cpy $4C52.w		; CC 52 4C
	lsr $29.b		; 46 29
	and $6D6D.w		; 2D 6D 6D
	jmp ($5B5B.w)		; 6C 5B 5B
	tad		; 5B
	tad		; 5B
	cop $20.b		; 02 20
	ora ($08.b,X)		; 01 08
	rti		; 40

	sty $21.b		; 84 21
	ora $6A55.w,X		; 1D 55 6A
	cmp $A4.b,X		; D5 A4
	adc ($90.b,S),Y		; 73 90
	plx		; FA
	stx $9A4B.w		; 8E 4B 9A
	sta ($CF.b),Y		; 91 CF
	sbc ($7C.b),Y		; F1 7C
	adc [$F9.b]		; 67 F9
	rol $4732.w,X		; 3E 32 47
	dec A		; 3A
	dec $AEB3.w		; CE B3 AE
	xba		; EB
	ldy $73.b		; A4 73
	jmp ($3ADF.w,X)		; 7C DF 3A
	stx $47A2.w		; 8E A2 47
	and ($D7.b)		; 32 D7
	ora $B6CF.w,Y		; 19 CF B6
	sta ($CC.b),Y		; 91 CC
	dec $63.b		; C6 63
	phd		; 0B
	asl A		; 0A
	eor [$3E.b]		; 47 3E
	phb		; 8B
	and $FE96.w		; 2D 96 FE
	ldy $8E.b,X		; B4 8E
	adc $1D.b,X		; 75 1D
	lsr $B3.b		; 46 B3
	eor $9B23.w,Y		; 59 23 9B
	sbc [$CE.b]		; E7 CE
	adc ($75.b,X)		; 61 75
	eor ($39.b)		; 52 39
	ora ($E0.b),Y		; 11 E0
	dex		; CA
	sbc $5D69.w,X		; FD 69 5D
	lda $8DB8.w,X		; BD B8 8D
	lda $28BA.w,X		; BD BA 28
	sbc ($E5.b),Y		; F1 E5
	lsr $96.b,X		; 56 96
	stx $96.b,Y		; 96 96
	stx $96.b,Y		; 96 96
	stx $96.b,Y		; 96 96
	ldx #$D649.w		; A2 49 D6
	dec $E2.b,X		; D6 E2
	dex		; CA
	pea $78A5.w		; F4 A5 78
	lda ($BA.b)		; B2 BA
	phx		; DA
	cpy #$8F76.w		; C0 76 8F
	ora ($EF.b,X)		; 01 EF
	stz $B403.w,X		; 9E 03 B4
	eor $4FC426.l		; 4F 26 C4 4F
	rol $42A1.w		; 2E A1 42
	sta $0A.b		; 85 0A
	ora ($A8.b,S),Y		; 13 A8
	eor ($56.b),Y		; 51 56
	asl A		; 0A
	ldy $EA.b,X		; B4 EA
	cmp ($AB.b,S),Y		; D3 AB
	lsr $3FAD.w		; 4E AD 3F
	adc $15.b,X		; 75 15
	adc #$55.b		; 69 55
	ldy $99.b		; A4 99
	and ($64.b)		; 32 64
	cmp #$96.b		; C9 96
	rol $4D.b		; 26 4D
	jmp $5C119B.l		; 5C 9B 11 5C
	tsx		; BA
.ACCU 8
	sep #$E2		; E2 E2
.ACCU 8
	sep #$E2		; E2 E2
	cpx #$B9B8.w		; E0 B8 B9
	txa		; 8A
	eor $C588.w		; 4D 88 C5
	rol $B6B6.w		; 2E B6 B6
	ldx $B6.b,Y		; B6 B6
	ldx $2D.b,Y		; B6 2D
	lda $1180.w		; AD 80 11
	brk $84.b		; 00 84
	and ($08.b,X)		; 21 08
	bpl -125.b		; 10 83
	adc $8989.w		; 6D 89 89
	ldx $C4.b,Y		; B6 C4
	cpy $DB.b		; C4 DB
	pha		; 48
	ldx $48.b,Y		; B6 48
	cmp $6F.b,X		; D5 6F
	sta $5147.w,X		; 9D 47 51
	inc $8BD4.w,X		; FE D4 8B
	.db $62, $1E, $5B		; 62 1E 5B
	jmp ($37DF.w,X)		; 7C DF 37
	cmp $5F2339.l		; CF 39 23 5F
	ora #$96.b		; 09 96
	plx		; FA
	tsb $88B7.w		; 0C B7 88
	sta ($6D.b),Y		; 91 6D
	ldx $36.b		; A6 36
	and [$05.b],Y		; 37 05
	cmp ($63.b,X)		; C1 63
	adc $48.b,S		; 63 48
	ldx $48.b,Y		; B6 48
	nop		; EA
	dec A		; 3A
	stx $A8A3.w		; 8E A3 A8
	cld		; D8
	pha		; 48
	cmp [$09.b],Y		; D7 09
	ldy #$0DFC.w		; A0 FC 0D
	ora [$09.b]		; 07 09
	and $59.b,S		; 23 59
	dex		; CA
	eor $3923.w,Y		; 59 23 39
	jsl $950DDB.l		; 22 DB 0D 95
	ror A		; 6A
	cmp $B6.b,X		; D5 B6
	tad		; 5B
	ora #$16.b		; 09 16
	cmp $60.b,X		; D5 60
	adc $F5D65B.l		; 6F 5B D6 F5
	sta ($AA.b,X)		; 81 AA
	sta ($6D.b),Y		; 91 6D
	xce		; FB
	and $9A.b,X		; 35 9A
	cpx $AC59.w		; EC 59 AC
	dec $FD.b,X		; D6 FD
	jsl $A0EADD.l		; 22 DD EA A0
	inc A		; 1A
	sty $8B94.w		; 8C 94 8B
	tda		; 7B
	dec $9A.b		; C6 9A
	sta $D6.b,X		; 95 D6
	lda ($A8.b,S),Y		; B3 A8
	sed		; F8
	ora #$16.b		; 09 16
	sta $924B.w,X		; 9D 4B 92
	cpx #$8CB1.w		; E0 B1 8C
	sty $8D.b,X		; 94 8D
	ror $2987.w,X		; 7E 87 29
	sbc $C0FDB6.l,X		; FF B6 FD C0
	pha		; 48
	lda [$11.b],Y		; B7 11
	eor ($49.b,S),Y		; 53 49
	bne 116.b		; D0 74
	clc		; 18
	clc		; 18
	ora ($35.b)		; 12 35
	sbc ($DA.b,S),Y		; F3 DA
	rtl		; 6B

	nop		; EA
	sta $9422A9.l,X		; 9F A9 22 94
	eor ($B7.b),Y		; 51 B7
	lda [$11.b],Y		; B7 11
	cpx $CA.b		; E4 CA
	beq  37.b		; F0 25
	.db $62, $49, $5A		; 62 49 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	bit #$37.b		; 89 37
	cmp $DC95.w,Y		; D9 95 DC
	phk		; 4B
	bra  31.b		; 80 1F
	ora $CE.b		; 05 CE
	adc ($93.b,S),Y		; 73 93
	iny		; C8
	sty $8542.w		; 8C 42 85
	asl A		; 0A
	trb $28.b		; 14 28
	bvc -95.b		; 50 A1
	and $555A.w,X		; 3D 5A 55
	adc #$55.b		; 69 55
	lda $57.b		; A5 57
	lda $AD57.w		; AD 57 AD
	eor [$AD.b],Y		; 57 AD
	eor [$AD.b],Y		; 57 AD
	sbc $643261.l		; EF 61 32 64
	cmp #$93.b		; C9 93
	rol $4C.b		; 26 4C
	cmp $5C.b,S		; C3 5C
	dey		; 88
	cpy $2E.b		; C4 2E
	rol $2E2E.w		; 2E 2E 2E
	rol $2E2E.w		; 2E 2E 2E
	clc		; 18
	ldy $46.b		; A4 46
	and ($6D.b,X)		; 21 6D
	adc $6D6D.w		; 6D 6D 6D
	adc $6D6D.w		; 6D 6D 6D
	jsl $420871.l		; 22 71 08 42
	bpl -124.b		; 10 84
	jsr $E2C2.w		; 20 C2 E2
	bit $20.b		; 24 20
	cpy $EA.b		; C4 EA
	ldy $20.b		; A4 20
	lda $4A.b		; A5 4A
	.db $42, $6B		; 42 6B
	asl $36.b,X		; 16 36
	asl $2C.b,X		; 16 2C
	pha		; 48
	inc $7B.b,X		; F6 7B
	bne 122.b		; D0 7A
	ora #$1A.b		; 09 1A
	ldy $7F.b		; A4 7F
	lda ($C6.b),Y		; B1 C6
	adc ($92.b),Y		; 71 92
	and $5A.b,X		; 35 5A
	lda [$B0.b],Y		; B7 B0
	cmp $A46C.w,Y		; D9 6C A4
	tda		; 7B
	sbc $D2CEAF.l,X		; FF AF CE D2
	pha		; 48
	cmp $2A.b,X		; D5 2A
	jmp $418326.l		; 5C 26 83 41
	and $D3.b,S		; 23 D3
	lda #$52.b		; A9 52
	sta ($4A.b),Y		; 91 4A
	eor ($A4.b,S),Y		; 53 A4
	jsr $4AE0.w		; 20 E0 4A
	sbc $BB32.w,Y		; F9 32 BB
	tda		; 7B
	adc ($1E.b),Y		; 71 1E
	jmp ($DEBE.w,X)		; 7C BE DE
	jmp.w [$D242]		; DC 42 D2
	cmp ($D2.b)		; D2 D2
	cmp ($D2.b)		; D2 D2
	cmp ($D2.b)		; D2 D2
	dec $E2.b,X		; D6 E2
	eor [$B8.b],Y		; 57 B8
	sta $89.b,X		; 95 89
	and [$C3.b],Y		; 37 C3
	sta $E7.b,X		; 95 E7
	bit $C0.b,X		; 34 C0
	ora [$DA.b]		; 07 DA
	eor $146A22.l		; 4F 22 6A 14
	plp		; 28
	bvc -95.b		; 50 A1
	.db $42, $85		; 42 85
	asl A		; 0A
	sta $2A.b,X		; 95 2A
	mvn $55,$A9		; 54 A9 55
	jmp $88B84A.l		; 5C 4A B8 88
	.db $42, $10		; 42 10
	sty $26.b		; 84 26
	eor $885C.w		; 4D 5C 88
	inc $D2.b,X		; F6 D2
	plb		; AB
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	tya		; 98
	ldy $47.b		; A4 47
	and $6D6D3D.l,X		; 3F 3D 6D 6D
	adc $6D6D.w		; 6D 6D 6D
	adc $6D6D.w		; 6D 6D 6D
	jsl $218490.l		; 22 90 84 21
	php		; 08
	.db $42, $2C		; 42 2C
	.db $62, $01, $5A		; 62 01 5A
	lda $69.b,X		; B5 69
	trb $D2.b		; 14 D2
	adc #$00.b		; 69 00
	beq -101.b		; F0 9B
	dec $F5.b,X		; D6 F5
	jsl $19679C.l		; 22 9C 67 19
	and ($06.b,X)		; 21 06
	dex		; CA
	cpy $84.b		; C4 84
	inc A		; 1A
	eor $4148DE.l		; 4F DE 48 41
	ldy #$24E1.w		; A0 E1 24
	jsr $E5F3.w		; 20 F3 E5
	inc $F6.b,X		; F6 F6
.ACCU 8
.INDEX 8
	sep #$3C		; E2 3C
	ora $AD5F.w,Y		; 19 5F AD
	pld		; 2B
	lda [$B7.b],Y		; B7 B7
	bpl -76.b		; 10 B4
	ldy $B4.b,X		; B4 B4
	ldy $B4.b,X		; B4 B4
	ldy $B4.b,X		; B4 B4
	lda $E6.b,X		; B5 E6
	lsr A		; 4A
	pea $78A5.w		; F4 A5 78
	lda ($BF.b)		; B2 BF
	rol A		; 2A
	lsr $24.b,X		; 56 24
	ldy $BED7.w,X		; BC D7 BE
	sei		; 78
	ora $0410.w		; 0D 10 04
	sbc ($C4.b,S),Y		; F3 C4
	eor $4EA827.l		; 4F 27 A8 4E
	lda ($42.b,X)		; A1 42
	sta $0A.b		; 85 0A
	trb $55.b		; 14 55
	cpy $DD.b		; C4 DD
	eor $5C.b		; 45 5C
	lsr A		; 4A
	lda ($AA.b)		; B2 AA
	dex		; CA
	plb		; AB
	rol A		; 2A
	ldy $B2AA.w		; AC AA B2
	sta ($29.b,S),Y		; 93 29
	jmp $3299.w		; 4C 99 32
	stz $C9.b		; 64 C9
	lda $B1D2.w,Y		; B9 D2 B1
	inc A		; 1A
	phy		; 5A
	eor $ADB4.w,X		; 5D B4 AD
	adc ($5A.b)		; 72 5A
	sbc $E1.b,S		; E3 E1
	rol $7121.w		; 2E 21 71
	adc ($71.b),Y		; 71 71
	adc ($3F.b,S),Y		; 73 3F
	rol $3E23.w,X		; 3E 23 3E
	eor $B69614.l,X		; 5F 14 96 B6
	sta $6D6D.w,X		; 9D 6D 6D
	adc $6D6D.w		; 6D 6D 6D
	jmp ($0088.w)		; 6C 88 00
	tsb $08.b		; 04 08
	.db $42, $10		; 42 10
	sty $75.b		; 84 75
	cmp $2676.w,X		; DD 76 26
	bit $8E.b		; 24 8E
	ror A		; 6A
	bcs  48.b		; B0 30
	and $52.b,X		; 35 52
	and $91D1.w,Y		; 39 D1 91
	rol $B3.b,X		; 36 B3
	eor $D6AC.w,Y		; 59 AC D6
	rtl		; 6B

	and $9A.b,X		; 35 9A
	cpy $FC3D.w		; CC 3D FC
	lda $F395D8.l		; AF D8 95 F3
	sbc $7B.b		; E5 7B
	sbc $9258.w,Y		; F9 58 92
	dec $96.b,X		; D6 96
	stx $96.b,Y		; 96 96
	stx $96.b,Y		; 96 96
	stx $88.b,Y		; 96 88
	sta $CC5766.l		; 8F 66 57 CC
	sta $FC.b,X		; 95 FC
	adc ($BB.b)		; 72 BB
	bit #$5E.b		; 89 5E
	stz $AC.b		; 64 AC
	phk		; 4B
	sta $FE9A05.l,X		; 9F 05 9A FE
	ora [$39.b],Y		; 17 39
	lda $F204.w,Y		; B9 04 F2
	eor [$06.b]		; 47 06
	pei ($4F.b)		; D4 4F
	cmp ($9F.b,X)		; C1 9F
	sta $3F.b,S		; 83 3F
	asl $7E.b		; 06 7E
	asl A		; 0A
	sta $0A.b		; 85 0A
	trb $0A15.w		; 1C 15 0A
	trb $28.b		; 14 28
	plb		; AB
	rol A		; 2A
	ldy $AAAA.w		; AC AA AA
	dey		; 88
	tax		; AA
	phk		; 4B
	jmp $3099.w		; 4C 99 30
	sta $6432.w,Y		; 99 32 64
	cmp [$C4.b]		; C7 C4
	ror $3E.b		; 66 3E
	txy		; 9B
	ror $BEDF.w,X		; 7E DF BE
	sta ($E2.b,S),Y		; 93 E2
	bit $6B.b		; 24 6B
	tya		; 98
	cpx $BF.b		; E4 BF
	pld		; 2B
	ldy $52F3.w		; AC F3 52
	and $95FA.w		; 2D FA 95
	lda [$EE.b],Y		; B7 EE
	eor $8E.b,S		; 43 8E
	bne 111.b		; D0 6F
	cmp ($35.b)		; D2 35
	sbc $38.b,S		; E3 38
	cmp $3BE38C.l		; CF 8C E3 3B
	ldy $8D.b		; A4 8D
	adc $5B96.w,X		; 7D 96 5B
	lda ($67.b,S),Y		; B3 67
	rol $46D2.w,X		; 3E D2 46
	ldx $2DDB.w,Y		; BE DB 2D
	pea $6F19.w		; F4 19 6F
	ora ($23.b),Y		; 11 23
	eor $6FBC89.l,X		; 5F 89 BC 6F
	inc A		; 1A
	adc $8B34.w		; 6D 34 8B
	lsr $B99D.w		; 4E 9D B9
	lsr $3B9D.w		; 4E 9D 3B
	eor $22.b		; 45 22
	stp		; DB
	lsr A		; 4A
	dec $36.b		; C6 36
	and $8D.b		; 25 8D
	stz $8B.b,X		; 74 8B
	ror A		; 6A
	lda [$AD.b],Y		; B7 AD
	xba		; EB
	cmp [$62.b],Y		; D7 62
	cli		; 58
	sbc $16E9.w,Y		; F9 E9 16
	cpx $CC9A.w		; EC 9A CC
	ora $66D635.l		; 0F 35 D6 66
	clv		; B8
	eor #$16.b		; 49 16
	cmp #$07.b		; C9 07
	ply		; 7A
	pei ($6A.b)		; D4 6A
	and ($52.b)		; 32 52
	and $DE.b,X		; 35 DE
	and $DCEA.w,Y		; 39 EA DC
	sbc [$78.b],Y		; F7 78
	sta ($4E.b),Y		; 91 4E
	sty $B089.w		; 8C 89 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -60.b		; B0 C4
	bit #$A4.b		; 89 A4
	lsr $9F24.w		; 4E 24 9F
	rol $8B57.w,X		; 3E 57 8B
	pld		; 2B
	cmp ($95.b)		; D2 95
	jmp.w [$F74A]		; DC 4A F7
	ora ($A0.b)		; 12 A0
	adc $DF031E.l		; 6F 1E 03 DF
	and $34CD.w,Y		; 39 CD 34
	sbc $E7F3.w,Y		; F9 F3 E7
	cmp $7C3E9F.l		; CF 9F 3E 7C
	sbc $E2F6.w,Y		; F9 F6 E2
	jmp ($F3E9.w,X)		; 7C E9 F3
	sty $28.b,X		; 94 28
	bvc -95.b		; 50 A1
	eor $3D.b,S		; 43 3D
	.db $42, $8A		; 42 8A
	ldy $D8.b		; A4 D8
	txa		; 8A
	lda $D3.b		; A5 D3
	rol $4C.b		; 26 4C
	sta $9930.w,Y		; 99 30 99
	bmi   1.b		; 30 01
	tax		; AA
	cpy #$A9.b		; C0 A9
	jsl L801898.l		; 22 98 98 80
	ora [$D9.b]		; 07 D9
	pha		; 48
	eor $F6.b		; 45 F6
	eor ($11.b)		; 52 11
	ror $8F74.w,X		; 7E 74 8F
	adc $1C.b,S		; 63 1C
	cpy $84.b		; C4 84
	eor $162191.l,X		; 5F 91 21 16
	adc ($47.b)		; 72 47
	lda $C6.b,X		; B5 C6
	bit $8F.b,X		; 34 8F
	sei		; 78
	cpx $89E5.w		; EC E5 89
	asl $4B9D.w,X		; 1E 9D 4B
	eor $23.b		; 45 23
	pei ($B2.b)		; D4 B2
	mvn $52,$A4		; 54 A4 52
	bit $DE.b		; 24 DE
	stz $AE.b		; 64 AE
.INDEX 8
	sep #$57		; E2 57
	sbc ($CA.b),Y		; F1 CA
	bra  27.b		; 80 1B
	sta [$39.b],Y		; 97 39
	jsr ($F329.w,X)		; FC 29 F3
	lda [$CE.b]		; A7 CE
	sta $E97C3A.l,X		; 9F 3A 7C E9
	sbc ($A7.b,S),Y		; F3 A7
	lda $EB3D.w,X		; BD 3D EB
	bcc -95.b		; 90 A1
	.db $42, $85		; 42 85
	asl A		; 0A
	trb $28.b		; 14 28
	lsr $44AA.w,X		; 5E AA 44
	.db $62, $13, $26		; 62 13 26
	jmp $3299.w		; 4C 99 32
	stz $C5.b		; 64 C5
	lsr A		; 4A
	tya		; 98
	inc A		; 1A
	lda #$1C.b		; A9 1C
	wai		; CB
	adc $B2.b		; 65 B2
	cmp $992369.l,X		; DF 69 23 99
	jmp ($5BB6.w)		; 6C B6 5B
	inx		; E8
	bit $9158.w		; 2C 58 91
	sta $D77CE5.l		; 8F E5 7C D7
	cmp $9154.w		; CD 54 91
	cmp $6E27.w		; CD 27 6E
	dec $EE.b		; C6 EE
	eor ($39.b)		; 52 39
	dex		; CA
	adc ($5B.b,S),Y		; 73 5B
	rol $4712.w		; 2E 12 47
	bit $1A.b,X		; 34 1A
	ora $E507.w		; 0D 07 E5
	pha		; 48
	sbc $2A.b		; E5 2A
	mvn $52,$B4		; 54 B4 52
	and $898D.w,Y		; 39 8D 89
	bit #$89.b		; 89 89
	and $9B.b,S		; 23 9B
	rtl		; 6B

	asl $3D.b,X		; 16 3D
	ldy $8E.b,X		; B4 8E
	lsr $4BA5.w		; 4E A5 4B
	and $9423.w,Y		; 39 23 94
	lda #$52.b		; A9 52
	lda $23.b		; A5 23
	txy		; 9B
	bit #$5E.b		; 89 5E
	stz $AC.b		; 64 AC
	eor #$BC.b		; 49 BC
	cmp #$5E.b		; C9 5E
	adc ($72.b,S),Y		; 73 72
	brk $37.b		; 00 37
	and #$EF.b		; 29 EF
	eor $D37B7A.l		; 4F 7A 7B D3
	dec $F49E.w,X		; DE 9E F4
	sbc $E693.w,Y		; F9 93 E6
	eor $42A198.l		; 4F 98 A1 42
	sta $0A.b		; 85 0A
	trb $28.b		; 14 28
	eor ($54.b),Y		; 51 54
	bit #$A6.b		; 89 A6
	jmp $3299.w		; 4C 99 32
	stz $C9.b		; 64 C9
	sta ($57.b,S),Y		; 93 57
	jsl $8B8B6B.l		; 22 6B 8B 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	tya		; 98
	ldy $4D.b		; A4 4D
	adc $6D6D.w		; 6D 6D 6D
	adc $6D6D.w		; 6D 6D 6D
	adc $FE6C.w		; 6D 6C FE
	rol $93.b,X		; 36 93
	eor #$F1.b		; 49 F1
	phx		; DA
	eor $F127.w		; 4D 27 F1
	ldy $5B.b		; A4 5B
	ror $DE.b,X		; 76 DE
	lda [$AD.b],Y		; B7 AD
	stp		; DB
	and #$94.b		; 29 94
	dex		; CA
	pha		; 48
	dec $36.b		; C6 36
	bmi  99.b		; 30 63
	mvn $6B,$91		; 54 91 6B
	ldy $6F2C.w		; AC 2C 6F
	dey		; 88
	inc $DD.b,X		; F6 DD
	eor [$C3.b]		; 47 C3
	pha		; 48
	lda [$8A.b],Y		; B7 8A
	ldy $3EE4.w,X		; BC E4 3E
	xba		; EB
	sbc [$9A.b],Y		; F7 9A
	eor $6E91CC.l		; 4F CC 91 6E
	plb		; AB
	tax		; AA
	xba		; EB
	dec A		; 3A
	cmp $CA96.w		; CD 96 CA
	ldy $8B.b,X		; B4 8B
	lsr $FC9D.w		; 4E 9D FC
	sbc $76E3.w		; ED E3 76
	dex		; CA
	jmp ($8BF4.w,X)		; 7C F4 8B
	adc $6D.b,S		; 63 6D
	tsx		; BA
	sbc $BB96.w		; ED 96 BB
	tas		; 1B
	inc A		; 1A
	eor $B9.b		; 45 B9
	jmp ($164B.w)		; 6C 4B 16
	and $91562B.l		; 2F 2B 56 91
	ror $F21A.w		; 6E 1A F2
	sbc ($86.b,S),Y		; F3 86
	ldy $E1BC.w,X		; BC BC E1
	ldy $5B.b		; A4 5B
	eor $81.b,X		; 55 81
	sbc [$9C.b],Y		; F7 9C
	eor [$15.b],Y		; 57 15
	sbc [$55.b],Y		; F7 55
	bit $5B.b		; 24 5B
	jmp $626363.l		; 5C 63 63 62
	.db $62, $62, $48		; 62 62 48
	lda [$84.b],Y		; B7 84
	dec $30B0.w,X		; DE B0 30
	bmi  48.b		; 30 30
	and $52.b,X		; 35 52
	and $66C2.w		; 2D C2 66
	lda ($59.b,S),Y		; B3 59
	ldy $6BD6.w		; AC D6 6B
	sty $91.b		; 84 91
	jmp ($4D95.w)		; 6C 95 4D
	lsr $A3.b		; 46 A3
	eor ($A8.b),Y		; 51 A8
	sbc $FD3552.l		; EF 52 35 FD
	sta $65FB.w		; 8D FB 65
	lda ($D8.b)		; B2 D8
	pha		; 48
	cmp [$96.b],Y		; D7 96
	sbc $B8.b,S		; E3 B8
	inc $8E3B.w		; EE 3B 8E
	sta ($4D.b),Y		; 91 4D
	adc $4813.w,Y		; 79 13 48
	stz $57E2.w,X		; 9E E2 57
	plx		; FA
	and $7C.b		; 25 7C
	cmp #$5F.b		; C9 5F
	ror $56.b		; 66 56
	bit $BE.b		; 24 BE
	adc ($FE.b,S),Y		; 73 FE
	cpy $C1D7.w		; CC D7 C1
	brk $4F.b		; 00 4F
	sta $62EF.w,Y		; 99 EF 62
	jmp ($F3C9.w,X)		; 7C C9 F3
	and [$CC.b]		; 27 CC
	sta $A97C2A.l,X		; 9F 2A 7C A9
	sbc ($94.b)		; F2 94
	and ($14.b,S),Y		; 33 14
	plp		; 28
	bvc -95.b		; 50 A1
	.db $42, $8A		; 42 8A
	tax		; AA
	dey		; 88
	tax		; AA
	eor $4C264C.l		; 4F 4C 26 4C
	sta $6432.w,Y		; 99 32 64
	cmp $D7.b,X		; D5 D7
	ora ($5C.b),Y		; 11 5C
	stz $2EB8.w,X		; 9E B8 2E
	rol $2E2E.w		; 2E 2E 2E
	rol $622E.w		; 2E 2E 62
	cmp $11.b		; C5 11
	txa		; 8A
	eor $D6165B.l		; 4F 5B 16 D6
	dec $D6.b,X		; D6 D6
	dec $D6.b,X		; D6 D6
	cpy #$0C.b		; C0 0C
	adc #$08.b		; 69 08
	lda ($14.b)		; B2 14
	lda $8A34.w,X		; BD 34 8A
	mvn $00,$A4		; 54 A4 00
	tda		; 7B
	pea $5E84.w		; F4 84 5E
	lda ($47.b)		; B2 47
	lda $26C6.w,X		; BD C6 26
	bit $8F.b		; 24 8F
	lsr $759D.w		; 4E 9D 75
	and $94.b,S		; 23 94
	lda $E715.w,X		; BD 15 E7
	sbc ($24.b,S),Y		; F3 24
	ply		; 7A
	stz $ED.b,X		; 74 ED
	dex		; CA
	eor [$B1.b]		; 47 B1
	ldx $DD.b,Y		; B6 DD
	stz $8F.b,X		; 74 8F
	ror A		; 6A
	bcs  49.b		; B0 31
	bit $7B.b		; 24 7B
	lda ($4E.b)		; B2 4E
	iny		; C8
	pha		; 48
	ldx $A8.b		; A6 A8
	ora $55.b,S		; 03 55
	sta ($F7.b,X)		; 81 F7
	sta ($3D.b)		; 92 3D
	tax		; AA
	cpy #$C0.b		; C0 C0
	sta ($EE.b),Y		; 91 EE
	ora ($35.b,S),Y		; 13 35
	txs		; 9A
	sta ($EC.b),Y		; 91 EC
	sta $4D.b,X		; 95 4D
	mvp $56,$8A		; 44 8A 56
	ldy $7F00.w		; AC 00 7F
	.db $62, $42, $2F		; 62 42 2F
	and $9A22.w		; 2D 22 9A
	sbc ($4F.b)		; F2 4F
	lsr $57.b		; 46 57
	lsr $014B.w,X		; 5E 4B 01
	sty $02.b		; 84 02
	and $B8.b,S		; 23 B8
	sta $DC.b,X		; 95 DC
	eor #$3D.b		; 49 3D
	cpy $AC.b		; C4 AC
	phk		; 4B
	txs		; 9A
	ror $9C73.w		; 6E 73 9C
	sbc [$34.b]		; E7 34
	cmp ($3E.b,X)		; C1 3E
	mvn $53,$F9		; 54 F9 53
	sbc $4D.b		; E5 4D
	ora ($E5.b,S),Y		; 13 E5
	eor $4C3E95.l		; 4F 95 3E 4C
	sbc $142A.w,Y		; F9 2A 14
	plp		; 28
	adc $28.b		; 65 28
	bvc -95.b		; 50 A1
	eor $52.b		; 45 52
	jmp $5545.w		; 4C 45 55
	ply		; 7A
	lda ($BD.b)		; B2 BD
	ora #$74.b		; 09 74
	cmp #$93.b		; C9 93
	ora #$93.b		; 09 93
	and ($15.b,X)		; 21 15
	cmp #$31.b		; C9 31
	ora $D7.b,X		; 15 D7
	jmp.w [$F3CA]		; DC CA F3
	sbc $6B.b		; E5 6B
	lda $7171.w		; AD 71 71
	bvs  92.b		; 70 5C
	jmp $493142.l		; 5C 42 31 49
	and ($18.b),Y		; 31 18
	lda ($79.b),Y		; B1 79
	adc ($BE.b)		; 72 BE
	sty $97AF.w		; 8C AF 97
	rol A		; 2A
	ldx $B6.b,Y		; B6 B6
	ldx $2D.b,Y		; B6 2D
	lda $ADAD.w		; AD AD AD
	inx		; E8
	ldy $5A.b,X		; B4 5A
	and $9C234D.l		; 2F 4D 23 9C
	sbc [$3D.b],Y		; F7 3D
	cmp $4A057C.l		; CF 7C 05 4A
	sta ($31.b)		; 92 31
	iny		; C8
	adc $2F55.w,X		; 7D 55 2F
	cli		; 58
	adc $48.b,S		; 63 48
	dec $26.b		; C6 26
	rol $26.b		; 26 26
	ply		; 7A
	stz $8D.b,X		; 74 8D
	adc $D227.w,X		; 7D 27 D2
	adc $230D9F.l		; 6F 9F 0D 23
	sta $AB.b,X		; 95 AB
	lsr $AD.b,X		; 56 AD
	and $93.b,S		; 23 93
	lda [$4E.b]		; A7 4E
	cmp ($48.b),Y		; D1 48
	inc $CB.b		; E6 CB
	eor $8D8D.w,X		; 5D 8D 8D
	and $96.b,S		; 23 96
	and $69B930.l		; 2F 30 B9 69
	trb $5AAD.w		; 1C AD 5A
	sbc ($86.b,S),Y		; F3 86
	sta ($CE.b),Y		; 91 CE
	pld		; 2B
	txa		; 8A
	xce		; FB
	tax		; AA
	txs		; 9A
	lda #$1A.b		; A9 1A
	cpy #$DE.b		; C0 DE
	bcs  53.b		; B0 35
	eor ($39.b)		; 52 39
	txs		; 9A
	cmp $B866.w		; CD 66 B8
	eor #$1C.b		; 49 1C
	pei ($6A.b)		; D4 6A
	and $1D.b,X		; 35 1D
	nop		; EA
	eor [$37.b]		; 47 37
	sbc $CB96.w		; ED 96 CB
	adc ($5A.b,X)		; 61 5A
	ldy $8C.b,X		; B4 8C
	adc ($DC.b),Y		; 71 DC
	adc [$1D.b],Y		; 77 1D
	cmp [$48.b]		; C7 48
	inc $BC.b		; E6 BC
	sta $0097D1.l,X		; 9F D1 97 00
	asl $16.b		; 06 16
	ora $67F2.w,Y		; 19 F2 67
	cmp #$9F.b		; C9 9F
	rol $7C.b		; 26 7C
	sta $62F2.w,Y		; 99 F2 62
	eor $A12A75.l,X		; 5F 75 2A A1
	.db $42, $85		; 42 85
	asl A		; 0A
	trb $94.b		; 14 94
	lda $42AF0C.l,X		; BF 0C AF 42
	eor [$4F.b],Y		; 57 4F
	lsr $78A9.w		; 4E A9 78
	sta [$EE.b],Y		; 97 EE
	sbc $50.b		; E5 50
	sty $26.b		; 84 26
	jmp $7AC2.w		; 4C C2 7A
	tax		; AA
	xba		; EB
	sbc [$CA.b]		; E7 CA
	sbc [$32.b],Y		; F7 32
	lda $CB.b,X		; B5 CB
	cpy $BF.b		; C4 BF
	rtl		; 6B

	rol A		; 2A
	sty $2E.b		; 84 2E
	rol $2C2E.w		; 2E 2E 2C
	dec A		; 3A
	sta $CA5F46.l		; 8F 46 5F CA
	sta $C5.b,X		; 95 C5
	and $8CFD12.l		; 2F 12 FD 8C
	tax		; AA
	phx		; DA
	phx		; DA
	asl $D6.b,X		; 16 D6
	cld		; D8
	dec $00B8.w		; CE B8 00
	bit #$7F.b		; 89 7F
	eor ($55.b)		; 52 55
	php		; 08
	.db $42, $10		; 42 10
	ora $1A23.w,Y		; 19 23 1A
	.db $42, $2C		; 42 2C
	sta $2F.b		; 85 2F
	eor #$E8.b		; 49 E8
	ldy $5A.b,X		; B4 5A
	and $8D14.w		; 2D 14 8D
	adc $F6AE3B.l,X		; 7F 3B AE F6
	ora $B007.w,X		; 1D 07 B0
	sta ($AE.b),Y		; 91 AE
	sbc $FDA4.w		; ED A4 FD
	ora $FA47.w		; 0D 47 FA
	bit $5A.b		; 24 5A
	lda ($F6.b,X)		; A1 F6
	phy		; 5A
	eor $7FD4D0.l		; 4F D0 D4 7F
	ldx #$45.b		; A2 45
	lda ($8E.b),Y		; B1 8E
	adc $94.b,S		; 63 94
	inc $B6.b		; E6 B6
	jmp $7E8D24.l		; 5C 24 8D 7E
	lsr $83.b		; 46 83
	eor ($A0.b,X)		; 41 A0
	jsr ($1AA9.w,X)		; FC A9 1A
	dec $A552.w		; CE 52 A5
	phk		; 4B
	eor $22.b		; 45 22
	phx		; DA
	nop		; EA
	phx		; DA
	cpx #$AD.b		; E0 AD
	ldy $91.b,X		; B4 91
	adc #$C6.b		; 69 C6
	stp		; DB
	and $A7E3.w,Y		; 39 E3 A7
	adc $6B24.w		; 6D 24 6B
	inc $830E.w,X		; FE 0E 83
	ldy #$F9.b		; A0 F9
	sta $5D2355.l		; 8F 55 23 5D
	sbc $9E.b,S		; E3 9E
	sbc [$AA.b],Y		; F7 AA
	cmp $45E2.w,X		; DD E2 45
	plb		; AB
	lsr $F5.b,X		; 56 F5
	jmp $C82187.l		; 5C 87 21 C8
	ply		; 7A
	lda #$1A.b		; A9 1A
	jsr ($B38E.w,X)		; FC 8E B3
	jsr ($0FDA.w,X)		; FC DA 0F
	sbc ($48.b,S),Y		; F3 48
	dec $F9.b,X		; D6 F9
	dec $71.b		; C6 71
	stz $DD67.w		; 9C 67 DD
	pha		; 48
	lda [$B8.b],Y		; B7 B8
	cpy $FB.b		; C4 FB
	stx $CEA3.w		; 8E A3 CE
	adc $45729E.l		; 6F 9E 72 45
	and $DD49B6.l,X		; 3F B6 49 DD
	lsr A		; 4A
	cpy $BF.b		; C4 BF
	sbc ($4A.b)		; F2 4A
	inc $B2.b,X		; F6 B2
	lda $A64C.w,Y		; B9 4C A6
	eor ($90.b)		; 52 90
	lda ($42.b,X)		; A1 42
	bit #$A6.b		; 89 A6
	inc $6EE5.w		; EE E5 6E
	jmp $B1F2F8.l		; 5C F8 F2 B1
	and $C5A7A7.l		; 2F A7 A7 C5
	sta $A9.b,X		; 95 A9
	nop		; EA
	plb		; AB
	ply		; 7A
	cmp ($08.b,X)		; C1 08
	eor [$BE.b]		; 47 BE
	sta ($7B.b)		; 92 7B
	eor $9758.w,Y		; 59 58 97
	sbc ($65.b)		; F2 65
	adc $AFDC.w,X		; 7D DC AF
	eor #$D2.b		; 49 D2
	stz $9D.b,X		; 74 9D
	rti		; 40

	sty $23.b		; 84 23
	lda ($97.b),Y		; B1 97
	sbc [$52.b],Y		; F7 52
	lda $AC8C.w,X		; BD 8C AC
	phk		; 4B
	sbc ($65.b,S),Y		; F3 65
	ror $AF2C.w,X		; 7E 2C AF
	eor $58D7.w,X		; 5D D7 58
	xba		; EB
	sty $21.b		; 84 21
	ora ($1E.b),Y		; 11 1E
	ldy $AE.b		; A4 AE
	nop		; EA
	lsr $8A.b,X		; 56 8A
	jsl $95C35F.l		; 22 5F C3 95
	plx		; FA
	sbc ($A6.b)		; F2 A6
	lsr A		; 4A
	sty $E1.b,X		; 94 E1
	php		; 08
	rti		; 40

	ora ($D1.b,X)		; 01 D1
	cli		; 58
	lda ($23.b),Y		; B1 23
	cmp $0F.b,X		; D5 0F
	bcs -112.b		; B0 90
	phb		; 8B
	adc ($91.b)		; 72 91
	sbc $6A75.w		; ED 75 6A
	cmp ($3D.b)		; D2 3D
	sta $3B.b		; 85 3B
	inc $1429.w,X		; FE 29 14
	lda #$50.b		; A9 50
	tsb $E763.w		; 0C 63 E7
	ldy $7B.b		; A4 7B
	inc $C76C.w,X		; FE 6C C7
	cmp ($48.b),Y		; D1 48
	sbc [$AE.b],Y		; F7 AE
	dec $6B.b,X		; D6 6B
	bit $7A.b		; 24 7A
	nop		; EA
	lda [$A2.b]		; A7 A2
	bcc -117.b		; 90 8B
	jsr ($1112.w,X)		; FC 12 11
	lsr $4E91.w		; 4E 91 4E
	sty $6189.w		; 8C 89 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc ($22.b,X)		; 61 22
	mvp $29,$92		; 44 92 29
	phx		; DA
	cmp #$71.b		; C9 71
	and $14.b		; 25 14
	plp		; 28
	bvc -95.b		; 50 A1
	rti		; 40

	asl $AF84.w,X		; 1E 84 AF
	asl $5F.b,X		; 16 5F
	bne -107.b		; D0 95
	bit #$28.b		; 89 28
	sty $21.b		; 84 21
	php		; 08
	ora $CA.b,S		; 03 CA
	sta $B9.b,X		; 95 B9
	adc ($DD.b,S),Y		; 73 DD
	dex		; CA
	sbc $B132.w,Y		; F9 32 B1
	and $10.b		; 25 10
	sty $21.b		; 84 21
	brk $70.b		; 00 70
	lda $7B.b		; A5 7B
	sbc $8B5F.w,Y		; F9 5F 8B
	pld		; 2B
	cmp $8995.w		; CD 95 89
	plp		; 28
	sty $21.b		; 84 21
	php		; 08
	ora $FA.b,S		; 03 FA
	lda $FE.b		; A5 FE
	ldy $87AF.w,X		; BC AF 87
	pld		; 2B
	ora ($51.b)		; 12 51
	php		; 08
	.db $42, $10		; 42 10
	asl $45.b		; 06 45
	jmp.w [$B98B]		; DC 8B B9
	ora [$72.b],Y		; 17 72
	rol $5DE4.w		; 2E E4 5D
	iny		; C8
	tyx		; BB
	sta ($77.b),Y		; 91 77
	and $0B.b,S		; 23 0B
	adc ($B0.b,X)		; 61 B0
	cld		; D8
	jmp ($1B36.w)		; 6C 36 1B
	ora $C586.w		; 0D 86 C5
	phb		; 8B
	asl $2C.b,X		; 16 2C
	pha		; 48
	sbc [$E7.b]		; E7 E7
	adc #$34.b		; 69 34
	txs		; 9A
	eor #$1C.b		; 49 1C
	bne 125.b		; D0 7D
	eor $2F.b		; 45 2F
	iny		; C8
	sta ($E9.b),Y		; 91 E9
	pei ($B3.b)		; D4 B3
	sta ($39.b)		; 92 39
	ldx $5AAD.w		; AE AD 5A
	bcs  27.b		; B0 1B
	eor #$14.b		; 49 14
	sbc $9B8E.w,X		; FD 8E 9B
	ldx $E9.b		; A6 E9
	bra -79.b		; 80 B1
	jsl $EA6B9A.l		; 22 9A 6B EA
	sta $6407A8.l,X		; 9F A8 07 64
	sta ($4D.b),Y		; 91 4D
	sbc ($7C.b,S),Y		; F3 7C
	cmp $A9C037.l,X		; DF 37 C0 A9
	tay		; A8
	sta ($4F.b),Y		; 91 4F
	eor $8585.w,X		; 5D 85 85
	sty $06.b		; 84 06
	tax		; AA
	eor $B1.b		; 45 B1
	lda ($B5.b),Y		; B1 B5
	brk $7A.b		; 00 7A
	sbc #$14.b		; E9 14
	cmp $BBD5B5.l,X		; DF B5 D5 BB
	bvs  25.b		; 70 19
	ora #$14.b		; 09 14
	xce		; FB
	stx $924B.w		; 8E 4B 92
	sbc $00.b		; E5 00
	lda ($22.b),Y		; B1 22
	sty $A9.b,X		; 94 A9
	eor ($9C.b)		; 52 9C
	ora [$90.b]		; 07 90
	bcc -126.b		; 90 82
	ldx $14.b,Y		; B6 14
	sty $15.b		; 84 15
	rol $B631.w,X		; 3E 31 B6
	stp		; DB
	adc $D2B6.w		; 6D B6 D2
	and $4208.w,Y		; 39 08 42
	ora ($39.b)		; 12 39
	adc #$69.b		; 69 69
	adc #$68.b		; 69 68
	cop $B1.b		; 02 B1
	sta $6389.w		; 8D 89 63
	eor $1E23.w,X		; 5D 23 1E
	and ($2D.b,S),Y		; 33 2D
	ldx $E5.b		; A6 E5
	ldy $2467.w		; AC 67 24
	.db $62, $76, $42		; 62 76 42
	lda $6D.b,X		; B5 6D
	xce		; FB
	sty $91.b		; 84 91
	sta $37E94D.l		; 8F 4D E9 37
	sbc $8D8D15.l		; EF 15 8D 8D
	and $18.b,S		; 23 18
	clc		; 18
	clc		; 18
	tas		; 1B
	dec $06.b,X		; D6 06
	tax		; AA
	lsr $31.b		; 46 31
	bit $C256.w		; 2C 56 C2
.ACCU 16
.INDEX 16
	rep #$F5		; C2 F5
	cmp ($31.b)		; D2 31
	adc $EF79.w,Y		; 79 79 EF
	ora $C54C.w,Y		; 19 4C C5
	cpx $8C.b		; E4 8C
	adc $56.b,X		; 75 56
	and [$2B.b],Y		; 37 2B
	asl $2C.b,X		; 16 2C
	pha		; 48
	cmp $8A.b		; C5 8A
	cmp $B0.b,X		; D5 B0
	bcs -80.b		; B0 B0
	ldy $63.b		; A4 63
	eor ($FE.b),Y		; 51 FE
	lda $A346.w		; AD 46 A3
	eor ($AC.b),Y		; 51 AC
	lda $D522.w		; AD 22 D5
	lda $AD562B.l		; AF 2B 56 AD
	sta $52.b		; 85 52
	lsr $35.b		; 46 35
	cld		; D8
	cld		; D8
	txy		; 9B
	.db $42, $B6		; 42 B6
	cmp ($45.b)		; D2 45
	tyx		; BB
	sbc $8A.b		; E5 8A
	phx		; DA
	ldy $F5F6.w		; AC F6 F5
	tax		; AA
	sta ($6E.b),Y		; 91 6E
	cmp #$213B.w		; C9 3B 21
	phy		; 5A
	ldx $FD.b,Y		; B6 FD
	rep #$48		; C2 48
	lda $4F.b		; A5 4F
	cpy $39E5.w		; CC E5 39
	rol $7502.w		; 2E 02 75
	adc $8BA4.w		; 6D A4 8B
	adc [$CA.b],Y		; 77 CA
	sta [$D8.b],Y		; 97 D8
	sta $EBED.w,Y		; 99 ED EB
	eor $22.b,X		; 55 22
	dec $12BB.w,X		; DE BB 12
	cmp $6C.b		; C5 6C
	bit $5D2F.w		; 2C 2F 5D
	jsl $CB0BD9.l		; 22 D9 0B CB
	cmp $66CA78.l		; CF 78 CA 66
	and $C75A24.l		; 2F 24 5A C7
	eor $63.b,X		; 55 63
	adc ($B1.b)		; 72 B1
	.db $62, $C4, $8B		; 62 C4 8B
	adc $150B.w,Y		; 79 0B 15
	plb		; AB
	adc ($61.b,X)		; 61 61
	adc ($48.b,X)		; 61 48
	lda $6C.b		; A5 6C
	rol A		; 2A
	tya		; 98
	ora $C0C0EA.l,X		; 1F EA C0 C0
	nop		; EA
	bit $53.b		; 24 53
	asl A		; 0A
	lda $8D.b,X		; B5 8D
	dex		; CA
	cmp $8B.b		; C5 8B
	ora $A4.b,X		; 15 A4
	adc ($21.b,S),Y		; 73 21
	adc $F79A.w,Y		; 79 9A F7
	bit #$3B08.w		; 89 08 3B
	ldx $24.b		; A6 24
	stx $A767.w		; 8E 67 A7
	adc $F516.w,X		; 7D 16 F5
	and ($07.b,X)		; 21 07
.ACCU 16
	rep #$65		; C2 65
	ldy $73.b		; A4 73
	tas		; 1B
	ora ($80.b,S),Y		; 13 80
	cmp $E3E448.l		; CF 48 E4 E3
	jsr ($711F.w,X)		; FC 1F 71
	and ($07.b,X)		; 21 07
	sbc ($38.b,S),Y		; F3 38
	cmp #$AD14.w		; C9 14 AD
	and ($16.b,X)		; 21 16
	rtl		; 6B

	and $FB.b,X		; 35 FB
	bit #$D81E.w		; 89 1E D8
	adc $1B.b,X		; 75 1B
	ora #$F91E.w		; 09 1E F9
	ora $7CEB.w		; 0D EB 7C
	sta ($EC.b),Y		; 91 EC
	ldx $5B.b,Y		; B6 5B
	cpy $1B.b		; C4 1B
	adc $55.b,S		; 63 55
	sta ($22.b,X)		; 81 22
	sta $F6EC.w,Y		; 99 EC F6
	ply		; 7A
	bvs 112.b		; 70 70
	cmp [$92.b],Y		; D7 92
	and #$72C9.w		; 29 C9 72
	jmp $718FA4.l		; 5C A4 8F 71
	stz $F866.w		; 9C 66 F8
	asl $26.b		; 06 26
	bit $8A.b		; 24 8A
	eor ($A5.b)		; 52 A5
	lsr A		; 4A
	.db $42, $AD		; 42 AD
	lda $69.b		; A5 69
	php		; 08
	and $A46C.w,Y		; 39 6C A4
	sty $1C.b		; 84 1C
	and $E4.b,X		; 35 E4
	sty $1F.b		; 84 1F
	lda $81.b		; A5 81
	jsl $AC1A98.l		; 22 98 1A AC
	tsb $540D.w		; 0C 0D 54
	sta $5E5E.w		; 8D 5E 5E
	lsr $705E.w,X		; 5E 5E 70
	cmp ($35.b)		; D2 35
	sbc $B8.b		; E5 B8
	inc $8E3B.w		; EE 3B 8E
	sbc $A4.b,S		; E3 A4
	rtl		; 6B

	cmp $3468.w		; CD 68 34
	inc A		; 1A
	ora $944A39.l		; 0F 39 4A 94
	phb		; 8B
	adc [$29.b]		; 67 29
	eor ($A5.b)		; 52 A5
	ldx #$CC91.w		; A2 91 CC
	jmp ($1A4B.w)		; 6C 4B 1A
	sbc #$DD1A.w		; E9 1A DD
	lda ($31.b),Y		; B1 31
	bmi  60.b		; 30 3C
	bit $8D.b		; 24 8D
	adc $0C4C.w,Y		; 79 4C 0C
	tsb $440D.w		; 0C 0D 44
	sty $D8.b		; 84 D8
	cld		; D8
	cmp ($3D.b)		; D2 3D
	adc $85.b,X		; 75 85
	sta $23.b		; 85 23
	cmp $1556.w,X		; DD 56 15
	eor #$E11E.w		; 49 1E E1
	lda $7B242F.l		; AF 2F 24 7B
	ora ($13.b,S),Y		; 13 13
	cmp $F648.w		; CD 48 F6
	tyx		; BB
	tas		; 1B
	ora ($47.b)		; 12 47
	ldy $8B75.w,X		; BC 75 8B
	ora ($3D.b)		; 12 3D
	dec A		; 3A
	sta [$29.b],Y		; 97 29
	jsl $D8D898.l		; 22 98 D8 D8
	cmp ($3D.b)		; D2 3D
	plx		; FA
	cld		; D8
	cli		; 58
	eor [$52.b],Y		; 57 52
	and $60BB.w,Y		; 39 BB 60
	rts		; 60

	ror A		; 6A
	ldy $72.b		; A4 72
	sbc ($F2.b)		; F2 F2
	sbc ($86.b,S),Y		; F3 86
	sta ($CD.b),Y		; 91 CD
	asl $83.b		; 06 83
	eor ($E7.b,X)		; 41 E7
	and #$9152.w		; 29 52 91
	sta $5BA1.w		; 8D A1 5B
	adc #$9B23.w		; 69 23 9B
	adc #$BDD3.w		; 69 D3 BD
	ldy $8E.b,X		; B4 8E
	jmp ($2987.w,X)		; 7C 87 29
	tsa		; 3B
	adc $D323.w		; 6D 23 D3
	lda #$914E.w		; A9 4E 91
	sbc $D1A255.l		; EF 55 A2 D1
	ply		; 7A
	eor $8B16.w		; 4D 16 8B
	cmp $48.b,X		; D5 48
	ldx $27.b,Y		; B6 27
	clv		; B8
	cpy $F8.b		; C4 F8
	jmp ($4C4C.w)		; 6C 4C 4C
	eor #$D516.w		; 49 16 D5
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	ror A		; 6A
	ldy $5B.b		; A4 5B
	stx $BC.b		; 86 BC
	ldy $BCBC.w,X		; BC BC BC
	ldy $A4E1.w,X		; BC E1 A4
	tad		; 5B
	ora ($13.b,S),Y		; 13 13
	cmp $3468.w		; CD 68 34
	inc A		; 1A
	ora $DB2239.l		; 0F 39 22 DB
	lsr A		; 4A
	cmp $B6.b,X		; D5 B6
	sta $AB.b,X		; 95 AB
	adc $5B24.w		; 6D 24 5B
	adc $CE9C.w		; 6D 9C CE
	cli		; 58
	dec $3D67.w		; CE 67 3D
	ldy $8B.b,X		; B4 8B
	lsr $CAA5.w		; 4E A5 CA
	adc ($5C.b)		; 72 5C
	lda $2F.b		; A5 2F
	ora $5923.w,X		; 1D 23 59
	jsl $D22975.l		; 22 75 29 D2
	ora ($78.b),Y		; 11 78
	bit #$BF08.w		; 89 08 BF
	sed		; F8
	sta ($E9.b),Y		; 91 E9
	cmp ($BB.b,S),Y		; D3 BB
	ldy $84.b		; A4 84
	eor $17212D.l,X		; 5F 2D 21 17
	inc $52A4.w		; EE A4 52
	sta $20.b,X		; 95 20
	and $F85BC5.l,X		; 3F C5 5B F8
	sta ($3D.b)		; 92 3D
	adc $AA.b,S		; 63 AA
	lda ($21.b),Y		; B1 21
	asl $C2.b,X		; 16 C2
	eor [$B6.b]		; 47 B6
	sta $BD.b,X		; 95 BD
	ldy $84.b,X		; B4 84
	trb $2915.w		; 1C 15 29
	asl $2FE0.w,X		; 1E E0 2F
	and [$48.b]		; 27 48
	sbc $8F.b,X		; F5 8F
	ora $9096.w,Y		; 19 96 90
	phb		; 8B
	cld		; D8
	pha		; 48
	eor $E1.b		; 45 E1
	bit $53.b		; 24 53
	ora $03.b,S		; 03 03
	stz $58D5.w		; 9C D5 58
	sta ($AC.b),Y		; 91 AC
	cmp [$88.b]		; C7 88
	wai		; CB
	adc $1CA9.w,Y		; 79 A9 1C
	sbc $A66C.w,Y		; F9 6C A6
	eor ($29.b,S),Y		; 53 29
	and $9B.b,S		; 23 9B
	sbc [$CE.b]		; E7 CE
	ror $3E.b		; 66 3E
	plx		; FA
	eor [$32.b]		; 47 32
	eor ($A7.b,S),Y		; 53 A7
	lsr $CD91.w		; 4E 91 CD
	ora [$E0.b]		; 07 E0
	pla		; 68
	sec		; 38
	sbc #$A51C.w		; E9 1C A5
	sta ($33.b)		; 92 33
	sta ($39.b)		; 92 39
	tad		; 5B
	asl A		; 0A
	lda [$90.b]		; A7 90
	sta ($CC.b),Y		; 91 CC
	tsb $0F0C.w		; 0C 0C 0F
	ora #$9823.w		; 09 23 98
	eor $2656.w,X		; 5D 56 26
	tax		; AA
	eor [$3A.b]		; 47 3A
	lsr $DB93.w		; 4E 93 DB
	lsr $DA.b,X		; 56 DA
	pha		; 48
	cmp [$05.b],Y		; D7 05
	stz $78CE.w,X		; 9E CE 78
	lda #$D31C.w		; A9 1C D3
	adc ($D6.b)		; 72 D6
	and ($92.b,S),Y		; 33 92
	and $75D4.w,Y		; 39 D4 75
	ora $5147.w,X		; 1D 47 51
	and $9C.b,S		; 23 9C
	adc [$19.b]		; 67 19
	dec $7F.b		; C6 7F
	tda		; 7B
	phd		; 0B
	asl A		; 0A
	lsr $33.b		; 46 33
	ora $C68C.w,Y		; 19 8C C6
	.db $62, $47, $B2		; 62 47 B2
	trb $BD.b		; 14 BD
	rol $8B.b,X		; 36 8B
	eor $A2.b		; 45 A2
	pea $35D2.w		; F4 D2 35
	nop		; EA
	lda [$8D.b],Y		; B7 8D
	sbc $78.b,S		; E3 78
	sbc $52.b,X		; F5 52
	and $EC.b,X		; 35 EC
	and $1E.b,X		; 35 1E
	cmp ($AE.b,S),Y		; D3 AE
	jsr ($1A49.w,X)		; FC 49 1A
	sbc $E6F71C.l		; EF 1C F7 E6
	adc #$C43B.w		; 69 3B C4
	sta $5A73.w		; 8D 73 5A
	ora $2EB9FA.l		; 0F FA B9 2E
	ror A		; 6A
	eor $A9.b		; 45 A9
	eor ($DC.b)		; 52 DC
	lda #$A552.w		; A9 52 A5
	lda $B648.w,Y		; B9 48 B6
	plb		; AB
	ply		; 7A
	dec $30B0.w,X		; DE B0 30
	bmi  60.b		; 30 3C
	bit $8B.b		; 24 8B
	mvn $2A,$E2		; 54 E2 2A
	mvn $52,$A9		; 54 A9 52
	ldy $8D.b		; A4 8D
	lsr $4AA5.w		; 4E A5 4A
	sta $29.b,X		; 95 29
	trb $A9.b		; 14 A9
	bvc  15.b		; 50 0F
	cmp ($EB.b)		; D2 EB
	and $31456A.l,X		; 3F 6A 45 31
	lda ($83.b),Y		; B1 83
	tas		; 1B
	tas		; 1B
	ora ($3D.b,S),Y		; 13 3D
	and $DF.b,S		; 23 DF
	eor ($E9.b),Y		; 51 E9
	and $8F24.w,X		; 3D 24 8F
	ror $4DB7.w,X		; 7E B7 4D
	cmp ($48.b,S),Y		; D3 48
	inc $BA.b,X		; F6 BA
	ldx $BA.b,Y		; B6 BA
	eor [$B8.b]		; 47 B8
	and $34B6.w		; 2D B6 34
	txa		; 8A
	adc $9D.b,X		; 75 9D
	adc [$59.b]		; 67 59
	xce		; FB
	eor ($39.b)		; 52 39
	ldx #$72D1.w		; A2 D1 72
	ora [$92.b],Y		; 17 92
	and $1EF5.w,Y		; 39 F5 1E
	sta ($D2.b,S),Y		; 93 D2
	adc $8E44.w,X		; 7D 44 8E
	jmp $37DD74.l		; 5C 74 DD 37
	eor $9323.w		; 4D 23 93
	.db $82, $C4, $84		; 82 C4 84
	ora $B6.b,X		; 15 B6
	sta ($39.b)		; 92 39
	cmp ($70.b,X)		; C1 70
	jmp L423216.l		; 5C 16 B2 42
	and $B48D71.l		; 2F 71 8D B4
	cmp $047C.w,Y		; D9 7C 04
	phb		; 8B
	mvn $E6,$A9		; 54 A9 E6
	ldy $DF.b,X		; B4 DF
	inc $BD69.w,X		; FE 69 BD
	ldy $8D.b,X		; B4 8D
	ror $CB77.w,X		; 7E 77 CB
	adc $35.b		; 65 35
	ora $24.b,X		; 15 24
	tad		; 5B
	tax		; AA
	lda ($B9.b),Y		; B1 B9
	adc #$0BBE.w		; 69 BE 0B
	eor $52F0.w		; 4D F0 52
	and $C762.w		; 2D 62 C7
	eor $74D6.w,Y		; 59 D6 74
	phy		; 5A
	cmp $8D64.w		; CD 64 8D
	adc ($5A.b,S),Y		; 73 5A
	asl $414B.w		; 0E 4B 41
	cmp $D748.w		; CD 48 D7
	sty $3DE3.w		; 8C E3 3D
	adc [$F9.b],Y		; 77 F9
	bit $8B64.w,X		; 3C 64 8B
	stz $A9.b		; 64 A9
	pla		; 68
	lda #$A552.w		; A9 52 A5
	ldx #$6D91.w		; A2 91 6D
	lda $6A.b		; A5 6A
	cmp $AB.b,X		; D5 AB
	lsr $DA.b,X		; 56 DA
	pha		; 48
	ldx $DB.b,Y		; B6 DB
	and $F19C.w,Y		; 39 9C F1
	cmp $E7CC.w,Y		; D9 CC E7
	ldx $91.b,Y		; B6 91
	adc $72CA05.l		; 6F 05 CA 72
	eor $16ED.w,Y		; 59 ED 16
	phb		; 8B
	and $5B23.w,Y		; 39 23 5B
	eor $CB96.w		; 4D 96 CB
	adc $B4.b		; 65 B4
	sta ($4D.b),Y		; 91 4D
	cmp $DDFD.w,X		; DD FD DD
	sbc $FEDD.w,X		; FD DD FE
	xce		; FB
	sta [$DF.b],Y		; 97 DF
	adc ($F7.b)		; 72 F7
	lsr $83A7.w,X		; 5E A7 83
	cmp ($F0.b),Y		; D1 F0
	ply		; 7A
	and [$E9.b],Y		; 37 E9
	lda $79FA4D.l,X		; BF 4D FA 79
	stz $F2.b,X		; 74 F2
	sbc #$29F5.w		; E9 F5 29
	inx		; E8
	sbc ($3A.b),Y		; F1 3A
	bit $0240.w,X		; 3C 40 02
	adc $5CE2.w,Y		; 79 E2 5C
	brk $9D.b		; 00 9D
	php		; 08
	brk $04.b		; 00 04
	phk		; 4B
	ldy $F8.b		; A4 F8
	eor $1B.b,S		; 43 1B
	jmp.w [$4400]		; DC 00 44
	tsx		; BA
	eor $0D3F84.l		; 4F 84 3F 0D
	sbc $F07FC3.l,X		; FF C3 7F F0
	cmp $FB25F2.l,X		; DF F2 25 FB
	ora #$CA5E.w		; 09 5E CA
	lsr $2BFE.w,X		; 5E FE 2B
	sed		; F8
	lda $36F2E2.l		; AF E2 F2 36
	jsr ($BE8D.w,X)		; FC 8D BE
	cmp $6F.b,S		; C3 6F
	lda ($DA.b)		; B2 DA
	cpx $B8B6.w		; EC B6 B8
	tas		; 1B
	eor $4228.w,Y		; 59 28 42
	bpl -124.b		; 10 84
	rol $BE.b,X		; 36 BE
	plb		; AB
	pei ($49.b)		; D4 49
	sbc ($04.b),Y		; F1 04
	and ($08.b,X)		; 21 08
	.db $42, $10		; 42 10
	.db $42, $4F		; 42 4F
	tyx		; BB
	adc [$6D.b],Y		; 77 6D
	php		; 08
	.db $42, $10		; 42 10
	sta $DE.b		; 85 DE
	phb		; 8B
	bcs   0.b		; B0 00
	ora #$2648.w		; 09 48 26
	xce		; FB
	brk $41.b		; 00 41
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	jsr $3689.w		; 20 89 36
	phk		; 4B
	mvn $C0,$40		; 54 40 C0
	bcc 108.b		; 90 6C
	rol $7836.w		; 2E 36 78
	php		; 08
	trb $8309.w		; 1C 09 83
	tya		; 98
	bpl -124.b		; 10 84
	ror $FF.b		; 66 FF
	bit #$0435.w		; 89 35 04
	rti		; 40

	sta $3A.b,S		; 83 3A
	lsr $3C3E.w		; 4E 3E 3C
	pla		; 68
	rtl		; 6B

	lda $D1B7.w,X		; BD B7 D1
	dex		; CA
	adc ($AF.b),Y		; 71 AF
	tda		; 7B
	cmp ($30.b),Y		; D1 30
	stz $1095.w		; 9C 95 10
	sta ($A9.b),Y		; 91 A9
	eor ($12.b,X)		; 41 12
	stx $9BCB.w		; 8E CB 9B
	stp		; DB
	ora $13.b,X		; 15 13
	and $64.b,X		; 35 64
	sta ($5B.b)		; 92 5B
	ldy $AB.b		; A4 AB
	sta $52.b,X		; 95 52
	inc $AFA8.w,X		; FE A8 AF
	rol $CF.b		; 26 CF
	lsr $D1.b		; 46 D1
	pha		; 48
	tyx		; BB
	cmp $9065.w,Y		; D9 65 90
	tsx		; BA
	bvc -103.b		; 50 99
	and ($39.b,X)		; 21 39
	and $4B2692.l,X		; 3F 92 26 4B
	and $7D.b		; 25 7D
	jmp $92BC5B.l		; 5C 5B BC 92
	cmp $DB.b		; C5 DB
	adc $DB9096.l		; 6F 96 90 DB
	cmp $D336.w,Y		; D9 36 D3
	cli		; 58
	lsr $CA.b,X		; 56 CA
	lda $D9.b		; A5 D9
	bit $4A4E.w		; 2C 4E 4A
	cmp ($24.b,S),Y		; D3 24
	inx		; E8
	sbc ($5A.b)		; F2 5A
	lda $E55224.l		; AF 24 52 E5
	txs		; 9A
	cmp #$6435.w		; C9 35 64
	sta ($24.b)		; 92 24
	bit $5D.b		; 24 5D
	adc $5E7B.w,Y		; 79 7B 5E
	and [$43.b],Y		; 37 43
	dec $E8.b		; C6 E8
	sei		; 78
	asl $83D7.w,X		; 1E D7 83
	cmp [$F0.b]		; C7 F0
	sei		; 78
	sbc $DA.b,S		; E3 DA
	phx		; DA
	sbc ($FA.b,S),Y		; F3 FA
	trb $871E.w		; 1C 1E 87
	ora [$DA.b]		; 07 DA
	lda $8F.b,S		; A3 8F
	eor [$1E.b]		; 47 1E
	dey		; 88
	ora ($24.b),Y		; 11 24
	cmp $0830.w		; CD 30 08
	sty $21.b		; 84 21
	bmi  32.b		; 30 20
	mvp $00,$92		; 44 92 00
	dey		; 88
	.db $42, $00		; 42 00
	stz $DE.b		; 64 DE
	cmp #$93BD.w		; C9 BD 93
	tda		; 7B
	rol $F6.b		; 26 F6
	eor $9BEC.w		; 4D EC 9B
	cmp $B237.w,Y		; D9 37 B2
	adc $F5A25E.l		; 6F 5E A2 F5
	ora [$A8.b],Y		; 17 A8
	lda $EA45.w,X		; BD 45 EA
	and $8B7A51.l		; 2F 51 7A 8B
	pei ($24.b)		; D4 24
	and $EA.b,S		; 23 EA
	iny		; C8
	txy		; 9B
	adc #$A552.w		; 69 52 A5
	lsr A		; 4A
	sta $2A.b,X		; 95 2A
	eor $12.b,X		; 55 12
	eor [$7F.b],Y		; 57 7F
	ora $76A4.w,X		; 1D A4 76
	sta ($DA.b),Y		; 91 DA
	eor [$72.b]		; 47 72
	bra -29.b		; 80 E3
	dex		; CA
	cpx #$7D92.w		; E0 92 7D
	cmp #$9358.w		; C9 58 93
	lda [$31.b],Y		; B7 31
	sbc ($47.b,X)		; E1 47
	sty $80.b		; 84 80
	asl $AF4C.w		; 0E 4C AF
	inc A		; 1A
	lsr $EF24.w,X		; 5E 24 EF
	lda [$1E.b]		; A7 1E
	sty $7C.b		; 84 7C
	mvp $7D,$00		; 44 00 7D
	sbc $F45D.w,Y		; F9 5D F4
	lda $122BC1.l		; AF C1 2B 12
	eor $88.b,X		; 55 88
	lda ($1B.b),Y		; B1 1B
	tya		; 98
	beq -93.b		; F0 A3
	cmp ($40.b,X)		; C1 40
	adc $97.b,S		; 63 97
	cpx $CA.b		; E4 CA
	sbc ($A5.b),Y		; F1 A5
	stz $F4.b,X		; 74 F4
	sep #$4E		; E2 4E
	cmp [$8E.b],Y		; D7 8E
	phx		; DA
	rol $004A.w,X		; 3E 4A 00
	tsa		; 3B
	bit #$945E.w		; 89 5E 94
	lda $122BBF.l		; AF BF 2B 12
	adc $88.b		; 65 88
	inc $F998.w,X		; FE 98 F9
	sbc ($C7.b),Y		; F1 C7
	rti		; 40

	clc		; 18
	sbc ($E8.b),Y		; F1 E8
	pla		; 68
	tda		; 7B
	and ($BD.b)		; 32 BD
	jsr ($49AC.w,X)		; FC AC 49
	stz $EEC8.w		; 9C C8 EE
	sbc $BB.b,S		; E3 BB
	sty $0308.w		; 8C 08 03
	ldy $D495.w,X		; BC 95 D4
	sta [$ED.b],Y		; 97 ED
	and $62.b		; 25 62
	jmp $A3EF.w		; 4C EF A3
	inx		; E8
	eor [$D0.b]		; 47 D0
	sta $0EA0F6.l		; 8F F6 A0 0E
	mvn $94,$AE		; 54 AE 94
	lda $D6EB.w,X		; BD EB D6
	sbc $AE.b		; E5 AE
	stp		; DB
	tyx		; BB
	ror $BBED.w		; 6E ED BB
	ldx $EE.b,Y		; B6 EE
	stp		; DB
	tyx		; BB
	ror $E8EA.w		; 6E EA E8
	ora $BB76.w		; 0D 76 BB
	eor $63AE.w,X		; 5D AE 63
	adc $63.b,S		; 63 63
	adc $63.b,S		; 63 63
	adc $63.b,S		; 63 63
	pha		; 48
	lda $B6.b,X		; B5 B6
	ora [$45.b],Y		; 17 45
	sbc ($D5.b)		; F2 D5
	plb		; AB
	lsr $91.b,X		; 56 91
	lda $AFE7A8.l		; AF A8 E7 AF
	and #$B47E.w		; 29 7E B4
	sta $A57C.w		; 8D 7C A5
	eor $59CB.w		; 4D CB 59
	dec $5AA4.w,X		; DE A4 5A
	lda $63.b,X		; B5 63
	tas		; 1B
	tas		; 1B
	inc A		; 1A
	lsr $29.b		; 46 29
	eor ($F9.b)		; 52 F9
	ror $9C73.w		; 6E 73 9C
	sbc [$3E.b]		; E7 3E
	phy		; 5A
	lsr $B4.b		; 46 B4
	jmp.w [$35D7]		; DC D7 35
	cmp ($74.b)		; D2 74
	sta ($2D.b)		; 92 2D
	sta $EA8D.w		; 8D 8D EA
	sec		; 38
	ldx $8A2B.w		; AE 2B 8A
.ACCU 8
	sep #$A4		; E2 A4
	tad		; 5B
	adc $615B.w		; 6D 5B 61
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp ($35.b)		; D2 35
	sbc $66D677.l,X		; FF 77 D6 66
	and ($1F.b,S),Y		; 33 1F
	sta ($23.b,X)		; 81 23
	lsr $B55A.w,X		; 5E 5A B5
	ror A		; 6A
	cmp $A4.b,X		; D5 A4
	rtl		; 6B

	plx		; FA
	cmp $C68C.w,Y		; D9 8C C6
	adc $C9.b,S		; 63 C9
	pha		; 48
	cmp [$E9.b],Y		; D7 E9
	adc $3EE913.l,X		; 7F 13 E9 3E
	sta ($94.b)		; 92 94
	sta $EA77.w		; 8D 77 EA
	lsr $C5.b,X		; 56 C5
	pei ($8B.b)		; D4 8B
	jmp $DC3F.w		; 4C 3F DC
	dex		; CA
	adc $32.b		; 65 32
	sta $1649.w,Y		; 99 49 16
	cpx #$7CA6.w		; E0 A6 7C
	inc $F1.b		; E6 F1
	ldy $1E6F.w,X		; BC 6F 1E
	eor ($45.b)		; 52 45
	dec A		; 3A
	lda ($75.b)		; B2 75
	rti		; 40

	lda #$52.b		; A9 52
	lda $4A.b		; A5 4A
	stx $36.b		; 86 36
	sec		; 38
	sed		; F8
	cmp ($F1.b),Y		; D1 F1
	lda $E3.b,S		; A3 E3
	mvp $0C,$90		; 44 90 0C
	and ($48.b)		; 32 48
	php		; 08
	mvp $51,$78		; 44 78 51
	sbc ($46.b,X)		; E1 46
	inc $24.b		; E6 24
	bra 113.b		; 80 71
	lda $F9.b		; A5 F9
	and ($A0.b)		; 32 A0
	and ($11.b,X)		; 21 11
	.db $62, $3E, $2C		; 62 3E 2C
	jmp ($9248.w,X)		; 7C 48 92
	ora ($8F.b,X)		; 01 8F
	asl $CFCE.w,X		; 1E CE CF
	cmp ($2A.b,X)		; C1 2A
	cop $11.b		; 02 11
	asl $780C.w,X		; 1E 0C 78
	eor ($B9.b),Y		; 51 B9
	bit #$20.b		; 89 20
	inc A		; 1A
	ply		; 7A
	jmp ($5E69.w,X)		; 7C 69 5E
	jmp $08A8.w		; 4C A8 08
	mvp $D1,$76		; 44 76 D1
	stp		; DB
	eor [$C7.b]		; 47 C7
	bit #$20.b		; 89 20
	ora $7E29.w,X		; 1D 29 7E
	stz $08A8.w		; 9C A8 08
	mvp $81,$BF		; 44 BF 81
	ora $2089F3.l,X		; 1F F3 89 20
	ora $14.b		; 05 14
	adc $4240E5.l		; 6F E5 40 42
	and $FD.b,S		; 23 FD
	and ($E0.b),Y		; 31 E0
	cmp [$02.b]		; C7 02
	bit $80.b		; 24 80
	rtl		; 6B

	rtl		; 6B

	adc #$E9.b		; 69 E9
	sbc $08A844.l,X		; FF 44 A8 08
	mvp $31,$76		; 44 76 31
	ror A		; 6A
	tsa		; 3B
	iny		; C8
	sta ($01.b)		; 92 01
	eor $5575.w,X		; 5D 75 55
	cpy $0195.w		; CC 95 01
	php		; 08
	lda [$76.b],Y		; B7 76
	cmp $77DB.w,X		; DD DB 77
	adc $B7DD.w		; 6D DD B7
	ror $DD.b,X		; 76 DD
	jsr $6BD7.w		; 20 D7 6B
	lda $DA.b,X		; B5 DA
	sbc $BB76.w		; ED 76 BB
	bcs 118.b		; B0 76
	ora #$11.b		; 09 11
	lda ($21.b,X)		; A1 21
	rol $3436.w		; 2E 36 34
	stx $42CC.w		; 8E CC 42
	ora ($10.b)		; 12 10
	.db $42, $12		; 42 12
	tsa		; 3B
	inc $8410.w		; EE 10 84
	sta $6DE2.w		; 8D E2 6D
	bpl -124.b		; 10 84
	stx $9DEB.w		; 8E EB 9D
	sta $B0.b,S		; 83 B0
	pha		; 48
	sbc $4548C4.l		; EF C4 48 45
	adc $21.b,X		; 75 21
	ora [$01.b],Y		; 17 01
	and ($17.b,X)		; 21 17
	jmp ($4C91.w,X)		; 7C 91 4C
	txy		; 9B
	cmp $B237.w,Y		; D9 37 B2
	adc $DFFB7C.l		; 6F 7C FB DF
	rol $CFF7.w,X		; 3E F7 CF
	lda $7B93.w,X		; BD 93 7B
	rol $F5.b		; 26 F5
	nop		; EA
	and $8B7A51.l		; 2F 51 7A 8B
	pei ($5E.b)		; D4 5E
	ldx #$17F5.w		; A2 F5 17
	tay		; A8
	lda $0F45.w,X		; BD 45 0F
	sbc $65.b,S		; E3 65
	and $7BD271.l,X		; 3F 71 D2 7B
	nop		; EA
	cmp $A4.b,X		; D5 A4
	tad		; 5B
	sta ($F1.b)		; 92 F1
	lsr $C52B.w,X		; 5E 2B C5
	adc ($54.b)		; 72 54
	lda #$48.b		; A9 48
	lda [$DF.b],Y		; B7 DF
	adc $972D9B.l		; 6F 9B 2D 97
	cpy #$AE91.w		; C0 91 AE
	and ($51.b,S),Y		; 33 51
	sta $A8.b		; 85 A8
	cmp ($48.b)		; D2 48
	cmp [$D0.b],Y		; D7 D0
	adc $32.b		; 65 32
	sta $A44C.w,Y		; 99 4C A4
	sta $B67E.w		; 8D 7E B6
	tda		; 7B
	cmp [$65.b]		; C7 65
	bit $8C74.w,X		; 3C 74 8C
	jmp $CDF9.w		; 4C F9 CD
	sbc $F9.b,S		; E3 F9
	tad		; 5B
	cmp [$E3.b],Y		; D7 E3
	pha		; 48
	dec $06.b		; C6 06
	ora [$B8.b]		; 07 B8
	rep #$C2		; C2 C2
.INDEX 16
	rep #$91		; C2 91
	lda $86FF55.l		; AF 55 FF 86
	txy		; 9B
	eor $91A6.w		; 4D A6 91
	ldx $455B.w		; AE 5B 45
	cpx $5C34.w		; EC 34 5C
	ldy $8D.b,X		; B4 8D
	adc [$A8.b]		; 67 A8
	eor $E919.w,X		; 5D 19 E9
	clc		; 18
	xba		; EB
	tsx		; BA
	sbc $27A6.w		; ED A6 27
	eor $C4B4.w,X		; 5D B4 C4
	sta ($6D.b),Y		; 91 6D
	stp		; DB
	ora ($B6.b)		; 12 B6
	adc ($7A.b,S),Y		; 73 7A
	sbc $A4.b,S		; E3 A4
	adc $A8.b,S		; 63 A8
	ldx $DDF4.w,Y		; BE F4 DD
	ror $6B.b,X		; 76 6B
	bra -111.b		; 80 91
	txa		; 8A
	mvn $52,$A9		; 54 A9 52
	lda $FC.b		; A5 FC
	bit $D24A.w		; 2C 4A D2
	and #$9A.b		; 29 9A
	cmp $B366.w		; CD 66 B3
	eor $02AE.w,Y		; 59 AE 02
	lsr $35.b		; 46 35
	inc A		; 1A
	sta $A346.w		; 8D 46 A3
	eor ($DF.b),Y		; 51 DF
	bit $62.b		; 24 62
	stz $C9.b		; 64 C9
	sta ($26.b,S),Y		; 93 26
	pha		; 48
	eor $D0.b		; 45 D0
	sta ($C0.b)		; 92 C0
	ora $1656.w,X		; 1D 56 16
	asl $10.b,X		; 16 10
	php		; 08
	sta ($6C.b)		; 92 6C
	cmp $4000.w,Y		; D9 00 40
	.db $62, $00, $44		; 62 00 44
	sta ($83.b,S),Y		; 93 83
	brk $02.b		; 00 02
	ora $B4.b,S		; 03 B4
	brk $44.b		; 00 44
	stx $00.b,Y		; 96 00
	sty $88.b		; 84 88
	cpx $4B.b		; E4 4B
	tad		; 5B
	iny		; C8
	lda [$91.b],Y		; B7 91
	jmp ($6C01.w)		; 6C 01 6C
	tas		; 1B
	brk $56.b		; 00 56
	lda $B55A.w		; AD 5A B5
	adc #$1E.b		; 69 1E
	sbc $856F.w,X		; FD 6F 85
	inc $7BA4.w		; EE A4 7B
	sbc $AA56ED.l,X		; FF ED 56 AA
	eor [$B9.b]		; 47 B9
	cpx $52A6.w		; EC A6 52
	lsr $A6.b		; 46 A6
	jmp $26DD.w		; 4C DD 26
	jmp $EF91.w		; 4C 91 EF
	phx		; DA
	xba		; EB
	rol A		; 2A
	pha		; 48
	sbc [$2D.b],Y		; F7 2D
	cmp $79.b		; C5 79
	cmp #$1E.b		; C9 1E
	plx		; FA
	cmp $D47CEC.l		; CF EC 7C D4
	sta $479D75.l		; 8F 75 9D 47
	clv		; B8
	sta ($EE.b),Y		; 91 EE
	sbc ($98.b,X)		; E1 98
	cpy $D648.w		; CC 48 D6
	ora ($E1.b),Y		; 11 E1
	lda ($19.b,S),Y		; B3 19
	bit #$1E.b		; 89 1E
	sbc $A68C.w,X		; FD 8C A6
	lsr A		; 4A
	eor $3A.b		; 45 3A
	ora ($26.b)		; 12 26
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C1		; C2 C1
	ror $4B.b		; 66 4B
	bit #$2F.b		; 89 2F
	ora ($13.b,S),Y		; 13 13
	ora ($10.b,S),Y		; 13 10
	ora $8E.b		; 05 8E
	trb $93.b		; 14 93
	sta $04.b,S		; 83 04
	eor #$7E.b		; 49 7E
	and $C4.b,S		; 23 C4
	sei		; 78
	stx $01D0.w		; 8E D0 01
	ora ($F3.b)		; 12 F3
	eor #$E0.b		; 49 E0
	sta $743A.w,X		; 9D 3A 74
	sbc #$D3.b		; E9 D3
	cpy $BD.b		; C4 BD
	and ($78.b)		; 32 78
	rol $2E2E.w		; 2E 2E 2E
	rol $2E2E.w		; 2E 2E 2E
	mvp $5A,$BD		; 44 BD 5A
	sta $6A.b,X		; 95 6A
	eor $C5.b,X		; 55 C5
	plb		; AB
	phb		; 8B
	eor [$16.b],Y		; 57 16
	ldy $5AE0.w		; AC E0 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	bit #$7E.b		; 89 7E
.INDEX 8
	sep #$57		; E2 57
	sbc $7B25.w,Y		; F9 25 7B
	adc #$5C.b		; 69 5C
	eor ($4B.b)		; 52 4B
	clv		; B8
	ror $B0D0.w		; 6E D0 B0
	sta $95.b		; 85 95
	sta $98.b,X		; 95 98
	sta [$9A.b],Y		; 97 9A
	eor #$01.b		; 49 01
	and ($64.b)		; 32 64
	and ($08.b,X)		; 21 08
	.db $42, $32		; 42 32
	and $5BE4.w		; 2D E4 5B
	iny		; C8
	lda [$91.b],Y		; B7 91
	adc $45DE22.l		; 6F 22 DE 45
	ldy $798B.w,X		; BC 8B 79
	asl $DB.b,X		; 16 DB
	ora $C386.w		; 0D 86 C3
	adc ($B0.b,X)		; 61 B0
	cld		; D8
	jmp ($2B36.w)		; 6C 36 2B
	adc $2024.w		; 6D 24 20
	sbc [$BC.b]		; E7 BC
	stz $84.b,X		; 74 84
	inc A		; 1A
	ldx $4AE1.w		; AE E1 4A
	nop		; EA
	eor [$32.b]		; 47 32
	txs		; 9A
	sbc #$08.b		; E9 08
	rol $69.b		; 26 69
	bit $20.b		; 24 20
	lda #$50.b		; A9 50
	tsb $B76D.w		; 0C 6D B7
.INDEX 16
	rep #$91		; C2 91
	eor $00CB65.l		; 4F 65 CB 00
	ora $A4.b,X		; 15 A4
	eor ($F1.b,S),Y		; 53 F1
	rol $0A68.w,X		; 3E 68 0A
	cmp $BD.b,X		; D5 BD
	pea $618A.w		; F4 8A 61
	adc $80.b,X		; 75 80
	ora [$EC.b]		; 07 EC
	pha		; 48
	ldx $63.b		; A6 63
	cmp #$1B.b		; C9 1B
	adc $AC.b,S		; 63 AC
	lda $48BA.w		; AD BA 48
	ldx $63.b		; A6 63
	and ($30.b),Y		; 31 30
	pld		; 2B
	lsr $F7.b,X		; 56 F7
	eor ($29.b)		; 52 29
	stx $FA.b,Y		; 96 FA
	bra  43.b		; 80 2B
	ora $D42271.l,X		; 1F 71 22 D4
	plp		; 28
	jmp $A603.w		; 4C 03 A6
	sta ($4E.b),Y		; 91 4E
	sty $89.b		; 84 89
	bcs  48.b		; B0 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	mvp $97,$BF		; 44 BF 97
	pld		; 2B
	inc $CA.b		; E6 CA
	cpy $6D.b		; C4 6D
	sbc $B9DC.w		; ED DC B9
	lda [$B6.b],Y		; B7 B6
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -79.b		; B0 B1
	ora ($83.b),Y		; 11 83
	ora [$0A.b]		; 07 0A
	eor [$A3.b],Y		; 57 A3
	pld		; 2B
	clv		; B8
	sta $C1.b,X		; 95 C1
	.db $82, $25, $CE		; 82 25 CE
	cmp ($E2.b),Y		; D1 E2
	rol $9A43.w,X		; 3E 43 9A
	sbc $3401.w		; ED 01 34
	sta ($11.b,S),Y		; 93 11
	bit $96.b,X		; 34 96
	sta $743A.w,X		; 9D 3A 74
	cmp #$D3.b		; C9 D3
	lda [$4F.b]		; A7 4F
	jmp $AD91.w		; 4C 91 AD
	.db $62, $29, $D6		; 62 29 D6
	lda [$5A.b]		; A7 5A
	txy		; 9B
	pea $5CDF.w		; F4 DF 5C
	jmp $5C635C.l		; 5C 5C 63 5C
	jmp $AB5C5C.l		; 5C 5C 5C AB
	dec A		; 3A
	ldy $AAEA.w		; AC EA AA
	dey		; 88
	tax		; AA
	phk		; 4B
	phy		; 5A
	phy		; 5A
	phy		; 5A
	asl $96.b,X		; 16 96
	stx $96.b,Y		; 96 96
	lda ($49.b),Y		; B1 49
	and ($18.b),Y		; 31 18
	ldy $B5.b		; A4 B5
	sta $95.b,X		; 95 95
	sta ($65.b),Y		; 91 65
	adc $65.b		; 65 65
	stz $08.b		; 64 08
	bra   4.b		; 80 04
	and ($02.b,X)		; 21 02
	bpl -124.b		; 10 84
	jmp ($ACBA.w)		; 6C BA AC
	jmp ($1C69.w)		; 6C 69 1C
	cpy $D0.b		; C4 D0
	adc $63.b,S		; 63 63
	pha		; 48
	inc $53.b		; E6 53
	and #$A4.b		; 29 A4
	cmp ($48.b)		; D2 48
	sbc [$8A.b]		; E7 8A
	sbc $A4EF.w,Y		; F9 EF A4
	plx		; FA
	bit #$1C.b		; 89 1C
	cmp $76.b,X		; D5 76
	nop		; EA
	stp		; DB
	ldy $8E.b		; A4 8E
	adc ($DC.b,S),Y		; 73 DC
	sbc [$3D.b],Y		; F7 3D
	inc $73A4.w		; EE A4 73
	and $B55A.w,X		; 3D 5A B5
	adc #$1C.b		; 69 1C
	dex		; CA
	adc $EC491B.l,X		; 7F 1B 49 EC
	bit $72.b		; 24 72
	stz $C9.b		; 64 C9
	php		; 08
	jsl $5F693C.l		; 22 3C 69 5F
	lda [$2B.b],Y		; B7 2B
	lda [$B7.b],Y		; B7 B7
	ora ($B7.b),Y		; 11 B7
	lda [$3C.b],Y		; B7 3C
	inc $AA64.w,X		; FE 64 AA
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C4		; C2 C4
	eor #$38.b		; 49 38
	bmi 112.b		; 30 70
	lda $7A.b		; A5 7A
	and ($BC.b)		; 32 BC
	and #$5C.b		; 29 5C
	clc		; 18
	brk $ED.b		; 00 ED
	asl $E423.w,X		; 1E 23 E4
	bit $6847.w,X		; 3C 47 68
	txs		; 9A
	eor $9A88.w		; 4D 88 9A
	eor $743A.w,X		; 5D 3A 74
	sbc #$D3.b		; E9 D3
	ldx $4E.b		; A6 4E
	stz $F49B.w,X		; 9E 9B F4
	cmp $9D56A7.l,X		; DF A7 56 9D
	phy		; 5A
	adc $7B.b,X		; 75 7B
	clc		; 18
	lda [$52.b]		; A7 52
	sta $C545.w,X		; 9D 45 C5
	cmp $C5.b		; C5 C5
	cmp $C5.b		; C5 C5
	rtl		; 6B

	phb		; 8B
	sta $49.b,X		; 95 49
	lda ($15.b),Y		; B1 15
	phk		; 4B
	lda $2D2D.w		; AD 2D 2D
	and $0B2D.w		; 2D 2D 0B
	phk		; 4B
	cli		; 58
	ldy $D8.b		; A4 D8
	sty $EB52.w		; 8C 52 EB
	pld		; 2B
	pld		; 2B
	pld		; 2B
	pld		; 2B
	jsl $01C8CA.l		; 22 CA C8 01
	bpl   8.b		; 10 08
	.db $42, $10		; 42 10
	sta ($08.b,X)		; 81 08
	rol $D8.b,X		; 36 D8
	tya		; 98
	txy		; 9B
	jmp ($4D4C.w)		; 6C 4C 4D
	ldy $8B.b,X		; B4 8B
	eor $ED1A.w,X		; 5D 1A ED
	sbc $A8.b,S		; E3 A8
	nop		; EA
	and $6C91D6.l,X		; 3F D6 91 6C
	eor $D0.b,S		; 43 D0
	adc $F1C61B.l		; 6F 1B C6 F1
	sbc #$A4.b		; E9 A4
	rtl		; 6B

	clv		; B8
	ror $3E.b		; 66 3E
	plb		; AB
	and ($E4.b),Y		; 31 E4
	ldy $5B.b		; A4 5B
	adc #$8D.b		; 69 8D
	sta $6FBF.w		; 8D BF 6F
	cld		; D8
	cld		; D8
	cmp ($2D.b)		; D2 2D
	stz $75.b,X		; 74 75
	ora $5147.w,X		; 1D 47 51
	pei ($6C.b)		; D4 6C
	bit $6B.b		; 24 6B
	bra -47.b		; 80 D1
	adc $C04573.l,X		; 7F 73 45 C0
	pha		; 48
	dec $7A.b,X		; D6 7A
	sta $D1.b		; 85 D1
	stz $6D91.w,X		; 9E 91 6D
	stx $CA.b		; 86 CA
	lda $4A.b		; A5 4A
	txy		; 9B
	and $8B84.w		; 2D 84 8B
	rtl		; 6B

	lda $DB6DB7.l		; AF B7 6D DB
	ror $BE.b,X		; 76 BE
	cmp [$48.b],Y		; D7 48
	ldx $F9.b,Y		; B6 F9
	txs		; 9A
	cmp $4C76.w		; CD 76 4C
	dec $6B.b,X		; D6 6B
	jmp ($6B91.w,X)		; 7C 91 6B
	lda $1460.w		; AD 60 14
	tyx		; BB
	pea $5B8B.w		; F4 8B 5B
	rts		; 60

	adc $1A.b,X		; 75 1A
	lda $C84CEF.l		; AF EF 4C C8
	pha		; 48
	ldy $C9.b,X		; B4 C9
	txs		; 9A
	ora $BFFB.w		; 0D FB BF
	jmp $2399.w		; 4C 99 23
	eor $FEA6A9.l,X		; 5F A9 A6 FE
	inc $F9.b,X		; F6 F9
	sbc $A4.b		; E5 A4
	tad		; 5B
	.db $82, $A5, $A8		; 82 A5 A8
	sbc [$B9.b]		; E7 B9
	xba		; EB
	xba		; EB
	sbc #$1A.b		; E9 1A
	plx		; FA
	sta $E555.w		; 8D 55 E5
	and $4991D8.l		; 2F D8 91 49
	sbc [$DB.b]		; E7 DB
	stp		; DB
	dey		; 88
	sbc ($65.b,S),Y		; F3 65
	jmp ($58B9.w,X)		; 7C B9 58
	sta ($56.b)		; 92 56
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	asl $22.b,X		; 16 22
	eor $A5F7.w		; 4D F7 A5
	adc [$12.b],Y		; 77 12
	cpx #$6E07.w		; E0 07 6E
	inc $B9.b		; E6 B9
	lda #$A4.b		; A9 A4
	lsr $21.b		; 46 21
	dec A		; 3A
	stz $E9.b,X		; 74 E9
	cmp ($A7.b,S),Y		; D3 A7
	lsr $9D9A.w		; 4E 9A 9D
	lsr A		; 4A
	adc $29.b,X		; 75 29
	inc $53.b		; E6 53
	cpy $99A7.w		; CC A7 99
	eor $659E32.l		; 4F 32 9E 65
	iny		; C8
	jmp $5C5C5C.l		; 5C 5C 5C 5C
	jmp $535C5C.l		; 5C 5C 5C 53
	mvn $C4,$88		; 54 88 C4
	and $2D2D.w		; 2D 2D 2D
	and $2D2D.w		; 2D 2D 2D
	and $A418.w		; 2D 18 A4
	lsr $21.b		; 46 21
	adc $65.b		; 65 65
	adc $65.b		; 65 65
	adc $65.b		; 65 65
	adc $22.b		; 65 22
	adc ($08.b),Y		; 71 08
	.db $42, $10		; 42 10
	sty $20.b		; 84 20
.ACCU 16
	rep #$E0		; C2 E0
	ldy $20.b		; A4 20
	cpy $EB.b		; C4 EB
	bit $20.b		; 24 20
	lda ($42.b,X)		; A1 42
	.db $42, $6A		; 42 6A
	cmp $B6.b,X		; D5 B6
	ora $AB.b,X		; 15 AB
	pha		; 48
	inc $83.b,X		; F6 83
	dec $7A.b,X		; D6 7A
	cmp #$A01A.w		; C9 1A A0
	adc $70C3A9.l,X		; 7F A9 C3 70
	cmp ($35.b)		; D2 35
	eor ($A7.b)		; 52 A7
	tsx		; BA
	cmp $A46C.w,Y		; D9 6C A4
	tda		; 7B
	sbc $D4D2AF.l,X		; FF AF D2 D4
	pha		; 48
	cmp $0A.b,X		; D5 0A
	trb $8B06.w		; 1C 06 8B
	eor $23.b		; 45 23
	cmp ($28.b,S),Y		; D3 28
	bvc -111.b		; 50 91
	lsr A		; 4A
	ora ($24.b,S),Y		; 13 24
	jsr $E5F2.w		; 20 F2 E5
	jmp ($5DD9.w,X)		; 7C D9 5D
	lda $8FB8.w,X		; BD B8 8F
	lsr $5F.b,X		; 56 5F
	adc $61216E.l		; 6F 6E 21 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc $71.b,S		; 63 71
	pld		; 2B
	cmp $C44A.w,X		; DD 4A C4
	txy		; 9B
	cpx $4A.b		; E4 4A
	sbc ($5A.b,S),Y		; F3 5A
	ldy #$F003.w		; A0 03 F0
	rol $91.b		; 26 91
	bit $E9.b,X		; 34 E9
	cmp ($A7.b,S),Y		; D3 A7
	lsr $3A9D.w		; 4E 9D 3A
	adc $2A.b,X		; 75 2A
	mvn $A7,$A9		; 54 A9 A7
	sta $4F.b,S		; 83 4F
	asl $9E.b		; 06 9E
	ora $143C.w		; 0D 3C 14
	and ($08.b,X)		; 21 08
	jmp $5C5C5C.l		; 5C 5C 5C 5C
	tax		; AA
	mvp $69,$7B		; 44 7B 69
	eor $A5.b,X		; 55 A5
	lda $A5.b		; A5 A5
	lda $A5.b		; A5 A5
	lda $A5.b		; A5 A5
	ldy $2352.w		; AC 52 23
	lda ($A0.b,X)		; A1 A0
	lda ($B2.b)		; B2 B2
	lda ($B2.b)		; B2 B2
	lda ($B2.b)		; B2 B2
	lda ($B2.b)		; B2 B2
	sta ($48.b),Y		; 91 48
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	ora $B1.b,X		; 15 B1
	brk $DB.b		; 00 DB
	lsr $D8.b,X		; 56 D8
	pha		; 48
	ldx $A3.b		; A6 A3
	bvc   5.b		; 50 05
	cmp $0F.b,X		; D5 0F
	dec $91.b		; C6 91
	lsr $861B.w		; 4E 1B 86
	cop $85.b		; 02 85
	asl $22E5.w		; 0E E5 22
	txy		; 9B
	rol A		; 2A
	cpy #$5370.w		; C0 70 53
	bit $5B.b		; 24 5B
	eor ($F2.b),Y		; 51 F2
	eor ($10.b)		; 52 10
	pla		; 68
	clv		; B8
	ora #$3D08.w		; 09 08 3D
	eor $BD7D.w,Y		; 59 7D BD
	clv		; B8
	sta $ED571A.l		; 8F 1A 57 ED
	dex		; CA
	sbc $C4ED.w		; ED ED C4
	bit $2C2C.w		; 2C 2C 2C
	bit $2C2C.w		; 2C 2C 2C
	bit $7A2C.w		; 2C 2C 7A
	and ($BD.b)		; 32 BD
	ora $145E.w,Y		; 19 5E 14
	lda $8995D0.l		; AF D0 95 89
	and $1EF235.l		; 2F 35 F2 1E
	and $48.b,S		; 23 48
	ora ($34.b,X)		; 01 34
	cmp ($13.b),Y		; D1 13
	eor #$F4DB.w		; 49 DB F4
	sbc #$A793.w		; E9 93 A7
	lsr $3A9D.w		; 4E 9D 3A
	ply		; 7A
	sei		; 78
	and ($C5.b,S),Y		; 33 C5
	and $E574.w,Y		; 39 74 E5
	cmp ($97.b,S),Y		; D3 97
	lsr $395D.w		; 4E 5D 39
	stz $D2.b,X		; 74 D2
	clv		; B8
	sta $7171.w,Y		; 99 71 71
	adc ($71.b),Y		; 71 71
	adc ($73.b),Y		; 71 73
	txy		; 9B
	pld		; 2B
	ora ($CD.b),Y		; 11 CD
	sta $ED.b,X		; 95 ED
	lda $6A.b		; A5 6A
	sta ($D6.b)		; 92 D6
	sta $D2C2.w,X		; 9D C2 D2
	asl $96.b,X		; 16 96
	stx $96.b,Y		; 96 96
	lda ($62.b),Y		; B1 62
	dey		; 88
	bne -105.b		; D0 97
	cmp $25.b		; C5 25
	ldy $59A6.w		; AC A6 59
	eor $5959.w,Y		; 59 59 59
	eor $2259.w,Y		; 59 59 22
	brk $01.b		; 00 01
	cop $10.b		; 02 10
	sty $21.b		; 84 21
	ora $AB.b,X		; 15 AB
	lsr $AD.b,X		; 56 AD
	and $9E.b,S		; 23 9E
	wai		; CB
	cmp [$70.b],Y		; D7 70
	dec $47BA.w,X		; DE BA 47
	bit $DA.b,X		; 34 DA
	adc $2935.w		; 6D 35 29
	trb $C2B6.w		; 1C B6 C2
.ACCU 16
.INDEX 16
	rep #$B6		; C2 B6
	sta ($CE.b),Y		; 91 CE
	sty $89.b		; 84 89
	bcs  48.b		; B0 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	sed		; F8
	adc ($BF.b)		; 72 BF
	ror $57.b,X		; 76 57
	cmp $95.b,X		; D5 95
	beq -27.b		; F0 E5
	.db $62, $4B, $58		; 62 4B 58
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	cli		; 58
	jsl $5FE93D.l		; 22 3D E9 5F
	lsr $57.b		; 46 57
	sbc ($CA.b)		; F2 CA
	inc $7925.w		; EE 25 79
	ora ($B1.b)		; 12 B1
	rol $EC76.w		; 2E 76 EC
	cmp [$EF.b],Y		; D7 EF
	and $D0AD.w,Y		; 39 AD D0
	rol $DF.b		; 26 DF
	cmp $9BBF.w		; CD BF 9B
	adc $D02662.l,X		; 7F 62 26 D0
	txy		; 9B
	.db $42, $6D		; 42 6D
	ora #$13B4.w		; 09 B4 13
	lda [$4E.b]		; A7 4E
	cmp $9D4EA7.l,X		; DF A7 4E 9D
	and $4C32.w,X		; 3D 32 4C
	eor $32.b		; 45 32
	phy		; 5A
.ACCU 8
	sep #$E2		; E2 E2
	cpx #$B8B8.w		; E0 B8 B8
	clv		; B8
	lda $9354.w,Y		; B9 54 93
	ora ($54.b),Y		; 11 54
	stx $B4.b,Y		; 96 B4
	ldy $B4.b,X		; B4 B4
	and $2D2D.w		; 2D 2D 2D
	and $CB1D.w		; 2D 1D CB
	ply		; 7A
	sbc $DF7C8B.l,X		; FF 8B 7C DF
	rol $B9BB.w,X		; 3E BB B9
	pha		; 48
	cmp [$21.b],Y		; D7 21
	cpx $3BBF.w		; EC BF 3B
	ldx $92F4.w		; AE F4 92
	and $15FB.w		; 2D FB 15
	and [$CE.b],Y		; 37 CE
	pld		; 2B
	dey		; 88
	cmp ($6F.b),Y		; D1 6F
	sta ($35.b)		; 92 35
	sbc $38.b		; E5 38
	adc $BEE19A.l		; 6F 9A E1 BE
	adc ($46.b)		; 72 46
	ldx $31F3.w,Y		; BE F3 31
	xce		; FB
	sty $E0F7.w		; 8C F7 E0
	pha		; 48
	cmp [$F5.b],Y		; D7 F5
	lda ($1F.b,S),Y		; B3 1F
	eor $98.b,X		; 55 98
	sbc ($52.b)		; F2 52
	and $C9.b,X		; 35 C9
	adc $32.b		; 65 32
	txs		; 9A
	lda $8B54.w		; AD 54 8B
	jmp $BA99.w		; 4C 99 BA
	jmp $3399.w		; 4C 99 33
	eor #$22.b		; 49 22
	stp		; DB
	lsr A		; 4A
	stx $36.b		; 86 36
	and $6E.b		; 25 6E
	tax		; AA
	eor $B5.b		; 45 B5
	stp		; DB
	ldx $ED.b,Y		; B6 ED
	ldx $BEBE.w		; AE BE BE
	sbc ($D2.b),Y		; F1 D2
	and $F981.w		; 2D 81 F9
	jmp.w [$D737]		; DC 37 D7
	ror $6C.b,X		; 76 6C
	bit $1609.w		; 2C 09 16
	tsx		; BA
	lda $4B.b		; A5 4B
	lda $346B.w,Y		; B9 6B 34
	cmp ($24.b,S),Y		; D3 24
	rtl		; 6B

	adc ($E7.b)		; 72 E7
	rol A		; 2A
	adc ($9B.b,S),Y		; 73 9B
	sty $8A.b,X		; 94 8A
	stz $24.b,X		; 74 24
	eor $8585.w		; 4D 85 85
	sta $85.b		; 85 85
	sta $85.b		; 85 85
	sta $86.b		; 85 86
	bit $4D.b		; 24 4D
	jsl $FA2471.l		; 22 71 24 FA
	lda ($BC.b)		; B2 BC
	and #$5E.b		; 29 5E
	sty $E2AE.w		; 8C AE E2
	eor [$BA.b],Y		; 57 BA
	sta $03.b,X		; 95 03
	and #$E2.b		; 29 E2
	rol $9A43.w,X		; 3E 43 9A
	cmp $4D.b,X		; D5 4D
	lda ($36.b,X)		; A1 36
	sty $DA.b		; 84 DA
	ora ($67.b,S),Y		; 13 67
	cmp $D89F.w		; CD 9F D8
	cpy $D9.b		; C4 D9
	sbc ($67.b,S),Y		; F3 67
	lda [$4E.b]		; A7 4E
	sta $763A.w,X		; 9D 3A 76
	ply		; 7A
	stz $F4.b,X		; 74 F4
	cmp #$B1.b		; C9 B1
	trb $CB.b		; 14 CB
	ldx $2E2E.w		; AE 2E 2E
	rol $0B2E.w		; 2E 2E 0B
	phb		; 8B
	bra   6.b		; 80 06
	tsx		; BA
	plx		; FA
	sty $8A.b,X		; 94 8A
	.db $62, $62, $00		; 62 62 00
	ora $172179.l,X		; 1F 79 21 17
	dec $4548.w,X		; DE 48 45
	plx		; FA
	eor ($3D.b)		; 52 3D
	sty $1272.w		; 8C 72 12
	ora ($7E.b),Y		; 11 7E
	stz $84.b		; 64 84
	eor $1EE9.w,Y		; 59 E9 1E
	phx		; DA
	mvn $23,$A9		; 54 A9 23
	stp		; DB
	eor #$9B.b		; 49 9B
	pea $5D8F.w		; F4 8F 5D
	jmp $23AD.w		; 4C AD 23
	pei ($2E.b)		; D4 2E
	tay		; A8
	pha		; 48
	ldy $49.b		; A4 49
	ldy $5D89.w,X		; BC 89 5D
	cpy $AF.b		; C4 AF
	sbc $95.b		; E5 95
	brk $37.b		; 00 37
	lsr $F76B.w		; 4E 6B F7
	sta ($67.b,S),Y		; 93 67
	cmp $369D.w		; CD 9D 36
	stz $D9.b,X		; 74 D9
	cmp ($67.b,S),Y		; D3 67
	eor $369D.w		; 4D 9D 36
	adc $A8.b,X		; 75 A8
	lsr $3A9D.w		; 4E 9D 3A
	stz $E9.b,X		; 74 E9
	cmp ($B3.b,S),Y		; D3 B3
	lda #$91.b		; A9 91
	clc		; 18
	sta $C5.b		; 85 C5
	cmp $C5.b		; C5 C5
	cmp $C5.b		; C5 C5
	cmp $C2.b		; C5 C2
	sta $2B.b,X		; 95 2B
	sbc $8E74.w		; ED 74 8E
	ror $33.b		; 66 33
	ora $C08F.w,Y		; 19 8F C0
	sta ($CC.b),Y		; 91 CC
	dec $63.b		; C6 63
	and ($F5.b),Y		; 31 F5
	eor $AB.b,X		; 55 AB
	pha		; 48
	cmp [$F1.b]		; C7 F1
	rol $E993.w,X		; 3E 93 E9
	and #$48.b		; 29 48
	inc $A3.b		; E6 A3
	sbc $B1.b		; E5 B1
	tyx		; BB
	pei ($8E.b)		; D4 8E
	adc #$B9.b		; 69 B9
	adc $0197.w		; 6D 97 01
	and $9A.b,S		; 23 9A
	and $8B16.w		; 2D 16 8B
	sbc ($A4.b,S),Y		; F3 A4
	adc ($85.b)		; 72 85
	asl A		; 0A
	inc A		; 1A
	eor #$1C.b		; 49 1C
	stp		; DB
	jmp $74CF.w		; 4C CF 74
	cmp ($39.b)		; D2 39
	and ($85.b)		; 32 85
	tsb $8EF4.w		; 0C F4 8E
	bvc -95.b		; 50 A1
	.db $42, $84		; 42 84
	stx $256E.w		; 8E 6E 25
	adc $B112.w,Y		; 79 12 B1
	rol $F2.b		; 26 F2
	and $79.b		; 25 79
	lda $00D0.w		; AD D0 00
	cmp $DE26.w,X		; DD 26 DE
	cmp $9BBD.w		; CD BD 9B
	tda		; 7B
	rol $F6.b,X		; 36 F6
	adc $DBEC.w		; 6D EC DB
	cmp $B3B7.w,Y		; D9 B7 B3
	adc $4EA753.l		; 6F 53 A7 4E
	sta $743A.w,X		; 9D 3A 74
	sbc #$E9.b		; E9 E9
	sta ($35.b),Y		; 91 35
	cmp $C5.b		; C5 C5
	cmp $C5.b		; C5 C5
	cmp $C5.b		; C5 C5
	cmp $CA.b		; C5 CA
	ldy $4D.b		; A4 4D
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	adc #$6B.b		; 69 6B
	trb $89.b		; 14 89
	ldy $ACAC.w		; AC AC AC
	ldy $ACAC.w		; AC AC AC
	ldy $9FAC.w		; AC AC 9F
	ldx $6AD4.w,Y		; BE D4 6A
	tsa		; 3B
	dec $A3.b		; C6 A3
	eor ($FB.b),Y		; 51 FB
	sbc #$16.b		; E9 16
	cmp #$6E.b		; C9 6E
	stp		; DB
	ldx $4B.b,Y		; B6 4B
	and $CB96.w		; 2D 96 CB
	pha		; 48
	dec $36.b		; C6 36
	bmi  99.b		; 30 63
	eor ($91.b)		; 52 91
	rtl		; 6B

	jmp ($6E2C.w)		; 6C 2C 6E
	sbc $D3.b		; E5 D3
	adc $1F.b,X		; 75 1F
	and ($22.b),Y		; 31 22
	cmp $E29C61.l,X		; DF 61 9C E2
	lda $C977.w,X		; BD 77 C9
	ror A		; 6A
	and $BA4542.l,X		; 3F 42 45 BA
	dec $AEB3.w		; CE B3 AE
	xba		; EB
	ldx $5B.b,Y		; B6 5B
	rol A		; 2A
	sta ($2D.b)		; 92 2D
	and ($67.b)		; 32 67
	cmp ($65.b,S),Y		; D3 65
	and ($59.b)		; 32 59
	adc $6C91A8.l		; 6F A8 91 6C
	adc $C2B7.w		; 6D B7 C2
	cmp $5875.w,Y		; D9 75 58
	cld		; D8
	cmp ($2D.b)		; D2 2D
	tad		; 5B
	ldy $35E9.w		; AC E9 35
	lsr $B50A.w,X		; 5E 0A B5
	adc #$16.b		; 69 16
.ACCU 16
	rep #$E6		; C2 E6
	and $EC7A13.l,X		; 3F 13 7A EC
	cld		; D8
	cli		; 58
	eor ($2D.b)		; 52 2D
	ldx $FEBE.w		; AE BE FE
	cmp [$09.b],Y		; D7 09
.ACCU 16
.INDEX 16
	rep #$7A		; C2 7A
	nop		; EA
	eor ($2D.b)		; 52 2D
	ldx $AD.b,Y		; B6 AD
	eor ($AA.b,S),Y		; 53 AA
	lda #$6953.w		; A9 53 69
	jsl $2B75DC.l		; 22 DC 75 2B
	cpy $064D.w		; CC 4D 06
	sbc $91AE.w		; ED AE 91
	ror $3503.w		; 6E 03 35
	txs		; 9A
	cmp $B366.w		; CD 66 B3
	jmp $5D8B04.l		; 5C 04 8B 5D
	eor ($D6.b)		; 52 D6
	rtl		; 6B

	and $9A.b,X		; 35 9A
	dec $23FD.w		; CE FD 23
	eor $36DFD4.l,X		; 5F D4 DF 36
	tad		; 5B
	and $8D84.w		; 2D 84 8D
	ply		; 7A
	asl $8823.w		; 0E 23 88
.ACCU 8
.INDEX 8
	sep #$38		; E2 38
	bit #$14.b		; 89 14
	jmp.w [$FF4A]		; DC 4A FF
	bit $A3AF.w,X		; 3C AF A3
	pld		; 2B
	sbc $97C44A.l		; EF 4A C4 97
	cmp $D57F.w		; CD 7F D5
	txs		; 9A
	sbc $13C0.w		; ED C0 13
	adc $D9446E.l		; 6F 6E 44 D9
	adc ($65.b,S),Y		; 73 65
	cmp $3697.w		; CD 97 36
	jmp $6573D9.l		; 5C D9 73 65
	lda [$65.b]		; A7 65
	lda [$4E.b]		; A7 4E
	sta $743A.w,X		; 9D 3A 74
	pea $11D3.w		; F4 D3 11
	jmp $B89E.w		; 4C 9E B8
	rol $2E2E.w		; 2E 2E 2E
	rol $2E2E.w		; 2E 2E 2E
	eor $54.b,X		; 55 54
	eor $52.b		; 45 52
	ply		; 7A
	bne -76.b		; D0 B4
	ldy $B4.b,X		; B4 B4
	ldy $B4.b,X		; B4 B4
	lda $8B.b,X		; B5 8B
	trb $46.b		; 14 46
	and #$3D.b		; 29 3D
	stz $59.b		; 64 59
	eor $5959.w,Y		; 59 59 59
	eor $0059.w,Y		; 59 59 00
	and ($A4.b),Y		; 31 A4
	jsl $F650C8.l		; 22 C8 50 F6
	ora ($29.b)		; 12 29
	lsr A		; 4A
	bra   1.b		; 80 01
	inc $8484.w,X		; FE 84 84
	jmp $7C8FC4.l		; 5C C4 8F 7C
	tsb $494C.w		; 0C 4C 49
	asl $3299.w,X		; 1E 99 32
	phx		; DA
	eor [$28.b]		; 47 28
	ror $7346.w,X		; 7E 46 73
	sbc $3D92.w,Y		; F9 92 3D
	and ($66.b)		; 32 66
	sbc #$23.b		; E9 23
	cmp $3656.w,X		; DD 56 36
	bit $8F.b		; 24 8F
	adc $2A4C.w,Y		; 79 4C 2A
	eor ($3D.b)		; 52 3D
	nop		; EA
	and ($99.b,S),Y		; 33 99
	cmp #$14.b		; C9 14
	cmp [$00.b],Y		; D7 00
	rtl		; 6B

	lda $23B5BF.l		; AF BF B5 23
	cmp $4E55.w,X		; DD 55 4E
	tax		; AA
	eor [$BC.b]		; 47 BC
	ora $2B.b,X		; 15 2B
	cmp #$1E.b		; C9 1E
	cpx #$33.b		; E0 33
	eor $1EA9.w,Y		; 59 A9 1E
	tsx		; BA
	lda $AC.b		; A5 AC
	sta ($4A.b),Y		; 91 4A
	sta $00.b,X		; 95 00
	ora $4548EA.l		; 0F EA 48 45
	inx		; E8
	bit $52.b		; 24 52
	and $BA.b,S		; 23 BA
	sta $DC.b,X		; 95 DC
	eor #$3D.b		; 49 3D
	pei ($AC.b)		; D4 AC
	phk		; 4B
	txs		; 9A
	ldx $9A6B.w		; AE 6B 9A
	inc $A9.b		; E6 A9
	ldy $CB26.w		; AC 26 CB
	txy		; 9B
	rol $BF6C.w		; 2E 6C BF
	cop $26.b		; 02 26
	tyx		; BB
	and $D9.b,X		; 35 D9
	ldx $75CD.w		; AE CD 75
	dec A		; 3A
	stz $EB.b,X		; 74 EB
	lda #$D3.b		; A9 D3
	lda [$4F.b]		; A7 4F
	jmp $1193.w		; 4C 93 11
	eor $A93C.w		; 4D 3C A9
	lsr $BA7C.w,X		; 5E 7C BA
.ACCU 8
	sep #$E2		; E2 E2
	cpx #$B8.b		; E0 B8
	clv		; B8
	sty $55.b		; 84 55
	bit $C4.b		; 24 C4
	eor $57.b,X		; 55 57
	tda		; 7B
	pld		; 2B
	dec $AA95.w		; CE 95 AA
	lda $A5.b		; A5 A5
	lda $A1.b		; A5 A1
	adc #$69.b		; 69 69
	php		; 08
	cmp $24.b		; C5 24
	cpy $62.b		; C4 62
	cmp $E8.b		; C5 E8
	lsr A		; 4A
	inc $5F49.w,X		; FE 49 5F
	.db $42, $55		; 42 55
	adc $65.b		; 65 65
	stz $59.b		; 64 59
	eor $5959.w,Y		; 59 59 59
	cmp ($69.b)		; D2 69
	bit $9E.b,X		; 34 9E
	rep #$47		; C2 47
	and $73CE.w,Y		; 39 CE 73
	stz $4AF9.w		; 9C F9 4A
	mvn $63,$A4		; 54 A4 63
	txa		; 8A
	sbc ($D4.b,S),Y		; F3 D4
	and $1A83.w,Y		; 39 83 1A
	lsr $31.b		; 46 31
	and ($31.b),Y		; 31 31
	bit $13.b,X		; 34 13
	bit $6B.b		; 24 6B
	xba		; EB
	ldx $78BB.w,Y		; BE BB 78
	sbc $1C89.w,Y		; F9 89 1C
	lda #$52.b		; A9 52
	lda $49.b		; A5 49
	trb $3299.w		; 1C 99 32
	ror $92.b		; 66 92
	eor [$36.b]		; 47 36
	sta $4D.b		; 85 4D
	ldy $8E.b		; A4 8E
	lsr $DB6E.w,X		; 5E 6E DB
	ldx $BA.b,Y		; B6 BA
	eor [$3C.b]		; 47 3C
	sbc $4C.b,X		; F5 4C
	rol $470A.w		; 2E 0A 47
	sec		; 38
	lsr $D713.w		; 4E 13 D7
	eor ($D7.b)		; 52 D7
	pha		; 48
	sbc $4D.b,X		; F5 4D
	ldy $8E.b		; A4 8E
	pla		; 68
	bit $1B.b,X		; 34 1B
	ldx $BA.b,Y		; B6 BA
	eor [$33.b]		; 47 33
	eor $D7AC.w,Y		; 59 AC D7
	ora ($23.b,X)		; 01 23
	txs		; 9A
	cmp $B366.w		; CD 66 B3
	lda $F9E648.l,X		; BF 48 E6 F9
	lda ($D9.b)		; B2 D9
	jmp ($542A.w)		; 6C 2A 54
	sta ($8E.b),Y		; 91 8E
	and $88.b,S		; 23 88
.ACCU 8
.INDEX 8
	sep #$38		; E2 38
	bit #$1C.b		; 89 1C
	txs		; 9A
	cpx $66D7.w		; EC D7 66
	tyx		; BB
	and $D9.b,X		; 35 D9
	ldx $BFC4.w		; AE C4 BF
	sta ($2A.b,X)		; 81 2A
	sta $743A.w,X		; 9D 3A 74
	sbc #$D4.b		; E9 D4
	trb $3D.b		; 14 3D
	lda $7C5E.w,Y		; B9 5E 7C
	ldx $ADAE.w		; AE AE AD
	and ($F1.b)		; 32 F1
	and $A14ADF.l		; 2F DF 4A A1
	php		; 08
	jmp $39615C.l		; 5C 5C 61 39
	lsr A		; 4A
	tax		; AA
	sbc [$4A.b]		; E7 4A
	sbc [$B2.b],Y		; F7 B2
	lda $4B.b,X		; B5 4B
	cpy $BF.b		; C4 BF
	rtl		; 6B

	rol A		; 2A
	sty $2D.b		; 84 2D
	and $2B2D.w		; 2D 2D 2B
	dec A		; 3A
	sta $F62FC9.l		; 8F C9 2F F6
	lda $71.b		; A5 71
	phk		; 4B
	cpy $BF.b		; C4 BF
	adc $2A.b		; 65 2A
	lda ($B2.b)		; B2 B2
	sta $95.b		; 85 95
	stx $33.b,Y		; 96 33
	sbc ($00.b,X)		; E1 00
	ora ($2F.b),Y		; 11 2F
	sbc $A14A.w		; ED 4A A1
	php		; 08
	.db $42, $02		; 42 02
	inx		; E8
	dec $90.b		; C6 90
	phb		; 8B
	and ($43.b,X)		; 21 43
	sty $8DFC.w		; 8C FC 8D
	rol $93.b		; 26 93
	eor #$23.b		; 49 23
	eor $BDF04D.l,X		; 5F 4D F0 BD
	cmp [$3D.b],Y		; D7 3D
	inc $6BA4.w		; EE A4 6B
	ldx $3F6A.w,Y		; BE 6A 3F
	eor ($59.b,S),Y		; 53 59
	inc $1629.w,X		; FE 29 16
	ldy $7D.b		; A4 7D
	inc $A3.b		; E6 A3
	sbc $35.b,X		; F5 35
	sta $6C91E2.l,X		; 9F E2 91 6C
	adc $90.b,S		; 63 90
	cmp ($72.b,S),Y		; D3 72
	stp		; DB
	rol $4602.w		; 2E 02 46
	lda $A24533.l,X		; BF 33 45 A2
	cmp ($7E.b),Y		; D1 7E
	stz $8D.b,X		; 74 8D
	adc [$A8.b]		; 67 A8
	bvc -95.b		; 50 A1
	ldy $91.b		; A4 91
	lda $6FB5.w		; AD B5 6F
	and ($33.b),Y		; 31 33
	adc #$23.b		; 69 23
	eor $DC73EF.l,X		; 5F EF 73 DC
	sbc [$8A.b],Y		; F7 8A
	sbc $24.b		; E5 24
	rtl		; 6B

	adc ($E7.b)		; 72 E7
	rol $A632.w,X		; 3E 32 A6
	sbc $22.b		; E5 22
	cmp $2A.b,X		; D5 2A
	adc ($9C.b)		; 72 9C
	eor [$15.b],Y		; 57 15
	cmp $72.b		; C5 72
	sta ($35.b)		; 92 35
	sbc $779D.w,Y		; F9 9D 77
	sed		; F8
	bit $5F.b,X		; 34 5F
	cpx #$91.b		; E0 91
	lda $86E3.w		; AD E3 86
	sbc ($B8.b,X)		; E1 B8
	adc $DF225D.l		; 6F 5D 22 DF
	ora $13.b,S		; 03 13
	beq -70.b		; F0 BA
	sta $7ABC4D.l		; 8F 4D BC 7A
	adc #$14.b		; 69 14
	sbc $E093CC.l,X		; FF CC 93 E0
	lsr A		; 4A
	cpy $BF.b		; C4 BF
	beq  74.b		; F0 4A
	inc $B2.b,X		; F6 B2
	lda $B66C.w,Y		; B9 6C B6
	phy		; 5A
	bra -99.b		; 80 9D
	dec A		; 3A
	tda		; 7B
	sta [$3B.b],Y		; 97 3B
	sbc #$5B.b		; E9 5B
	lsr $BB.b,X		; 56 BB
	cmp #$58.b		; C9 58
	sta [$D5.b],Y		; 97 D5
	cmp $E1.b,X		; D5 E1
	lsr A		; 4A
	cmp ($E5.b)		; D2 E5
	rol A		; 2A
	adc ($02.b,S),Y		; 73 02
	bpl -113.b		; 10 8F
	sta ($24.b),Y		; 91 24
	inc $B2.b,X		; F6 B2
	lda ($2F.b),Y		; B1 2F
	inc $CA.b		; E6 CA
	jsr ($5E59.w,X)		; FC 59 5E
	phb		; 8B
	ldx #$E8.b		; A2 E8
	tsx		; BA
	sta ($08.b,X)		; 81 08
	eor [$65.b]		; 47 65
	and $F6CAD8.l		; 2F D8 CA F6
	eor ($B1.b)		; 52 B1
	and $EE95CB.l		; 2F CB 95 EE
	sbc $7E.b		; E5 7E
	ora [$C2.b],Y		; 17 C2
	lda $84F0.w		; AD F0 84
	and ($11.b,X)		; 21 11
	asl $AFD4.w,X		; 1E D4 AF
	sta ($2B.b,X)		; 81 2B
	bit $2FF1.w,X		; 3C F1 2F
	cpx $4A.b		; E4 4A
	sbc $52C9.w,X		; FD C9 52
	nop		; EA
	sty $C1.b		; 84 C1
	php		; 08
	rti		; 40

	ora ($D0.b,X)		; 01 D0
	lsr $AD.b,X		; 56 AD
	and $D4.b,S		; 23 D4
	sta $8B90BA.l		; 8F BA 90 8B
	stx $90.b,Y		; 96 90
	phb		; 8B
	stz $91.b,X		; 74 91
	inc $A5AA.w		; EE AA A5
	eor #$08.b		; 49 08
	rol $7F.b		; 26 7F
	cmp ($22.b,X)		; C1 22
	sty $A9.b,X		; 94 A9
	ora ($9E.b,X)		; 01 9E
	lda $A4E3.w		; AD E3 A4
	tda		; 7B
	tas		; 1B
	tas		; 1B
	bcc -112.b		; 90 90
	phb		; 8B
	sbc #$A4.b		; E9 A4
	jsl $7BA4DC.l		; 22 DC A4 7B
	stp		; DB
	adc $B2.b		; 65 B2
	cmp ($3D.b)		; D2 3D
	inc $4D77.w,X		; FE 77 4D
	ldy $4E91.w		; AC 91 4E
	sty $89.b		; 84 89
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	jsl $299244.l		; 22 44 92 29
	phx		; DA
	cmp #$71.b		; C9 71
	and $13.b		; 25 13
	lda [$4E.b]		; A7 4E
	sta $1E38.w,X		; 9D 38 1E
	ldy $AF.b,X		; B4 AF
	asl A		; 0A
	eor $8995D6.l,X		; 5F D6 95 89
	plp		; 28
	sty $21.b		; 84 21
	php		; 08
	ora $ED.b,S		; 03 ED
	lsr A		; 4A
	phx		; DA
	lda $F1.b,X		; B5 F1
	adc $7C.b		; 65 7C
	cmp $9258.w,Y		; D9 58 92
	dey		; 88
	.db $42, $10		; 42 10
	bra  56.b		; 80 38
	ora ($BE.b)		; 12 BE
	trb $77AF.w		; 1C AF 77
	pld		; 2B
	wai		; CB
	sta $89.b,X		; 95 89
	plp		; 28
	sty $21.b		; 84 21
	php		; 08
	ora $FA.b,S		; 03 FA
	adc $FE.b		; 65 FE
	cpx $AF.b		; E4 AF
	sta ($2B.b),Y		; 91 2B
	ora ($51.b)		; 12 51
	php		; 08
	.db $42, $10		; 42 10
	asl $45.b		; 06 45
	ldy $798B.w,X		; BC 8B 79
	asl $F2.b,X		; 16 F2
	and $5BE4.w		; 2D E4 5B
	iny		; C8
	lda [$91.b],Y		; B7 91
	adc $610B23.l		; 6F 23 0B 61
	bcs -40.b		; B0 D8
	jmp ($1B36.w)		; 6C 36 1B
	ora $C786.w		; 0D 86 C7
	sbc #$6A.b		; E9 6A
	and $1A.b,X		; 35 1A
	bit #$1C.b		; 89 1C
	cmp ($79.b),Y		; D1 79
	dex		; CA
	ora $D32399.l,X		; 1F 99 23 D3
	plp		; 28
	adc [$A4.b]		; 67 A4
	adc ($AA.b,S),Y		; 73 AA
	lda #$53.b		; A9 53
	tax		; AA
	ora $69.b,S		; 03 69
	jsl $5BC69C.l		; 22 9C C6 5B
	and $0E48.w		; 2D 48 0E
	dec A		; 3A
	eor $3C.b		; 45 3C
	eor [$8A.b],Y		; 57 8A
	sbc ($5E.b),Y		; F1 5E
	sec		; 38
	asl $22CD.w		; 0E CD 22
	stz $E8E7.w		; 9C E7 E8
	ror A		; 6A
	rol $955A.w,X		; 3E 5A 95
	cmp $2D.b,X		; D5 2D
	stz $8A.b		; 64 8A
	adc #$B9.b		; 69 B9
	adc $A897.w		; 6D 97 A8
	ora $8E.b,S		; 03 8E
	sta ($4E.b),Y		; 91 4E
	tda		; 7B
	stz $BEE7.w,X		; 9E E7 BE
	tya		; 98
	tsb $1409.w		; 0C 09 14
	sbc [$3F.b]		; E7 3F
	eor $51.b,S		; 43 51
	plx		; FA
	bra 121.b		; 80 79
	sbc #$14.b		; E9 14
	nop		; EA
	tsx		; BA
	sbc $4095.w		; ED 95 40
	and ($24.b),Y		; 31 24
	eor ($94.b,S),Y		; 53 94
	lda $4B.b		; A5 4B
	bit $07.b		; 24 07
	ora $9A22.w,X		; 1D 22 9A
	cmp $9B36.w		; CD 36 9B
	jmp $AA15.w		; 4C 15 AA
	pha		; 48
	eor ($85.b,X)		; 41 85
	sbc $B66D63.l,X		; FF 63 6D B6
	stp		; DB
	adc $72A4.w		; 6D A4 72
	bpl -124.b		; 10 84
	bit $72.b		; 24 72
	rep #$C2		; C2 C2
	rep #$C0		; C2 C0
	ora $43.b		; 05 43
	tas		; 1B
	ora ($B7.b)		; 12 B7
	eor $23.b,X		; 55 23
	ora $E6EC.w,Y		; 19 EC E6
	tyx		; BB
	ora ($FB.b)		; 12 FB
	cmp [$48.b]		; C7 48
	cpy $CC.b		; C4 CC
	sta $4A.b		; 85 4A
	txy		; 9B
	sbc [$01.b]		; E7 01
	and $1E.b,S		; 23 1E
	cmp $8C.b,S		; C3 8C
	cmp $1BC33E.l,X		; DF 3E C3 1B
	inc A		; 1A
	lsr $29.b		; 46 29
	lsr $6862.w,X		; 5E 62 68
	and $31D2B5.l		; 2F B5 D2 31
	sta ($81.b,X)		; 81 81
	cmp [$75.b],Y		; D7 75
	cmp $AB.b,X		; D5 AB
	pha		; 48
	dec $93.b		; C6 93
	eor #$E7.b		; 49 E7
	and $D28A13.l,X		; 3F 13 8A D2
	pha		; 48
	cmp [$C0.b]		; C7 C0
	cpy $F9.b		; C4 F9
	sty $4C4C.w		; 8C 4C 4C
	eor #$18.b		; 49 18
	cpy $AD.b		; C4 AD
	phy		; 5A
	lda $4A.b		; A5 4A
	sta ($31.b)		; 92 31
	sta $81.b		; 85 81
	sta $85.b		; 85 85
	sta $52.b		; 85 52
	ldy $8B.b,X		; B4 8B
	adc [$B7.b]		; 67 B7
	jmp $7BF6.w		; 4C F6 7B
	and $C29C.w,X		; 3D 9C C2
	sta ($8E.b),Y		; 91 8E
	tsa		; 3B
	and $C492.w		; 2D 92 C4
	cpy $BE.b		; C4 BE
	sbc ($D2.b),Y		; F1 D2
	and $A6D9.w		; 2D D9 A6
	stz $2A.b		; 64 2A
	mvn $38,$DF		; 54 DF 38
	ora #$14.b		; 09 14
	lda $AC.b		; A5 AC
	inc $1C.b,X		; F6 1C
	ror $F9.b		; 66 F9
	inc $18.b,X		; F6 18
	cld		; D8
	cmp ($2D.b)		; D2 2D
	ldx $BEBE.w		; AE BE BE
	ldx $AFDD.w,Y		; BE DD AF
	lda $D2.b,X		; B5 D2
	and $8181.w		; 2D 81 81
	sta ($D7.b,X)		; 81 D7
	adc $D5.b,X		; 75 D5
	plb		; AB
	pha		; 48
	lda [$9E.b],Y		; B7 9E
	cmp ($69.b)		; D2 69
	bit $E2E7.w,X		; 3C E7 E2
	adc ($5A.b),Y		; 71 5A
	eor #$16.b		; 49 16
	cpy $F8.b		; C4 F8
	clc		; 18
	sta $898931.l,X		; 9F 31 89 89
	bit #$22.b		; 89 22
	jmp.w [$2576]		; DC 76 25
	ror A		; 6A
	cmp $2A.b,X		; D5 2A
	mvn $4A,$91		; 54 91 4A
	cmp $30.b,X		; D5 30
	bcs  48.b		; B0 30
	bmi  48.b		; 30 30
	rol $52.b,X		; 36 52
	and #$52.b		; 29 52
	ldx $27.b,Y		; B6 27
	sbc ($68.b,X)		; E1 68
	and ($31.b),Y		; 31 31
	pld		; 2B
	pha		; 48
	inc $43.b		; E6 43
	and $FD9A.w,Y		; 39 9A FD
	pei ($84.b)		; D4 84
	ora $238939.l,X		; 1F 39 89 23
	txs		; 9A
	ora #$9F.b		; 09 9F
	eor $48BB.w,Y		; 59 BB 48
	eor ($DC.b,X)		; 41 DC
	and ($12.b,S),Y		; 33 12
	and $898D.w,Y		; 39 8D 89
	sbc $B4.b		; E5 B4
	ora ($39.b)		; 12 39
	bmi  -1.b		; 30 FF
	stp		; DB
	beq -92.b		; F0 A4
	jsr $67FE.w		; 20 FE 67
	ora $9522.w		; 0D 22 95
	ldy $22.b		; A4 22
	lda #$21.b		; A9 21
	asl $6B.b,X		; 16 6B
	and $FE.b,X		; 35 FE
	stz $8F.b		; 64 8F
	jmp ($8D3A.w)		; 6C 3A 8D
	sty $8F.b		; 84 8F
	adc $DE760B.l,X		; 7F 0B 76 DE
	bit $7B.b		; 24 7B
	and ($98.b),Y		; 31 98
	sbc ($46.b)		; F2 46
	cld		; D8
	cmp [$5F.b],Y		; D7 5F
	pha		; 48
	ldx $83.b		; A6 83
	eor ($A0.b,X)		; 41 A0
	tya		; 98
	asl $39A3.w,X		; 1E A3 39
	jsl $D9CB9E.l		; 22 9E CB D9
	adc #$A4.b		; 69 A4
	tda		; 7B
	stx $E1.b		; 86 E1
	lda [$80.b],Y		; B7 80
	and ($31.b),Y		; 31 31
	bit $52.b		; 24 52
	sta $0A.b		; 85 0A
	ora ($15.b)		; 12 15
	adc $482A.w		; 6D 2A 48
	eor ($5B.b,X)		; 41 5B
	dex		; CA
	pha		; 48
	eor ($D9.b,X)		; 41 D9
	ldx $48.b		; A6 48
	eor ($FE.b,X)		; 41 FE
	phk		; 4B
	sbc #$14.b		; E9 14
	ldx $5FD7.w,Y		; BE D7 5F
	eor $6BA46B.l,X		; 5F 6B A4 6B
	and $CE9C.w,Y		; 39 9C CE
	adc [$3D.b]		; 67 3D
	mvp $7A,$8D		; 44 8D 7A
	asl $8823.w		; 0E 23 88
.ACCU 8
.INDEX 8
	sep #$38		; E2 38
	bit #$1A.b		; 89 1A
	pea $2D9A.w		; F4 9A 2D
	asl $8B.b,X		; 16 8B
	cmp ($50.b,S),Y		; D3 50
	lda ($22.b,X)		; A1 22
	cmp $14EA.w,Y		; D9 EA 14
	plp		; 28
	adc #$24.b		; 69 24
	adc ($1B.b,S),Y		; 73 1B
	ora ($B7.b)		; 12 B7
	eor $23.b,X		; 55 23
	eor $578D.w,Y		; 59 8D 57
	ora $3D5B.w,X		; 1D 5B 3D
	and $59.b,S		; 23 59
	asl A		; 0A
	sta $33.b,X		; 95 33
	stz $46A2.w,X		; 9E A2 46
	ldx $FAD2.w,Y		; BE D2 FA
	plx		; FA
	xce		; FB
	eor $2721.w,Y		; 59 21 27
	eor $4A85.w,Y		; 59 85 4A
	eor [$B1.b]		; 47 B1
	and ($3D.b),Y		; 31 3D
	bit $8F.b		; 24 8F
	adc $A495D8.l		; 6F D8 95 A4
	ply		; 7A
	adc ($8D.b,X)		; 61 8D
	jsl $D8D898.l		; 22 98 D8 D8
	cmp ($3D.b)		; D2 3D
	sbc $ADB0B0.l		; EF B0 B0 AD
	ldy $73.b		; A4 73
	and $7D.b		; 25 7D
	adc $91AE.w,X		; 7D AE 91
	cpy $73E6.w		; CC E6 73
	and $24EA.w,Y		; 39 EA 24
	adc ($45.b,S),Y		; 73 45
	ldx #$D1.b		; A2 D1
	ply		; 7A
	ror A		; 6A
	trb $24.b		; 14 24
	adc $69.b,S		; 63 69
	stz $74CF.w,X		; 9E CF 74
	cmp ($39.b)		; D2 39
	ldy #$D3.b		; A0 D3
	bvc -13.b		; 50 F3
	ora ($3D.b)		; 12 3D
	and ($84.b)		; 32 84
	cmp #$1E.b		; C9 1E
	sbc $34.b		; E5 34
	txs		; 9A
	lsr $4933.w		; 4E 33 49
	ldy $E5.b		; A4 E5
	bit $5B.b		; 24 5B
	eor $7D7D.w,X		; 5D 7D 7D
	adc $7D7D.w,X		; 7D 7D 7D
	ldx $6F91.w		; AE 91 6F
	eor ($9C.b),Y		; 51 9C
	dec $3367.w		; CE 67 33
	sta $51CF.w,Y		; 99 CF 51
	jsl $9E98D8.l		; 22 D8 98 9E
	sta ($45.b,S),Y		; 93 45
	ldx #$D1.b		; A2 D1
	ply		; 7A
	adc #$16.b		; 69 16
	phx		; DA
	mvn $B4,$A9		; 54 A9 B4
	lda #$53.b		; A9 53
	adc #$22.b		; 69 22
	stp		; DB
	jmp ($7BF6.w)		; 6C F6 7B
	adc $CF9E.w		; 6D 9E CF
	stz $D2.b,X		; 74 D2
	and $8632.w		; 2D 32 86
	txy		; 9B
	eor ($A6.b,X)		; 41 A6
	lda ($E6.b,X)		; A1 E6
	bit $6A.b		; 24 6A
	inx		; E8
	sta $6442.w,Y		; 99 42 64
	sta $AFAF6B.l		; 8F 6B AF AF
	ldy $22.b		; A4 22
	sbc ($52.b)		; F2 52
	ora ($7F.b),Y		; 11 7F
	sbc ($23.b),Y		; F1 23
	cmp ($26.b,S),Y		; D3 26
	jmp ($84E4.w,X)		; 7C E4 84
	eor $172145.l,X		; 5F 45 21 17
	cmp [$48.b]		; C7 48
	lda $0A.b		; A5 0A
	brk $7F.b		; 00 7F
	.db $62, $A7, $FB		; 62 A7 FB
	ora ($3D.b)		; 12 3D
	tad		; 5B
	ldy $21AD.w		; AC AD 21
	asl $C2.b,X		; 16 C2
	eor [$B6.b]		; 47 B6
	sta $3A.b,X		; 95 3A
	adc #$08.b		; 69 08
	and [$EA.b],Y		; 37 EA
	ora ($3D.b)		; 12 3D
	ldy #$FF.b		; A0 FF
	sta ($41.b,S),Y		; 93 41
	and ($17.b,X)		; 21 17
	tsx		; BA
	bcc -117.b		; 90 8B
	cmp [$48.b]		; C7 48
	lda $F5.b		; A5 F5
	sbc [$35.b],Y		; F7 35
	ldx $23AD.w		; AE AD 23
	tad		; 5B
	cmp [$92.b],Y		; D7 92
	cpy $497A.w		; CC 7A 49
	trb $2CFA.w		; 1C FA 2C
	ldx $5B.b,Y		; B6 5B
	and $9B23.w		; 2D 23 9B
	cmp [$F2.b]		; C7 F2
	lda [$AF.b],Y		; B7 AF
	dec $91.b		; C6 91
	wai		; CB
	lda #$93.b		; A9 93
	rol $48.b		; 26 48
	inc $8B.b		; E6 8B
	xce		; FB
	txs		; 9A
	rol $4722.w		; 2E 22 47
	plp		; 28
	eor $E919.w,X		; 5D 19 E9
	trb $85A9.w		; 1C A9 85
	phk		; 4B
	cpx $72A4.w		; EC A4 72
	plx		; FA
	plx		; FA
	xce		; FB
	cmp [$48.b]		; C7 48
	inc $17.b		; E6 17
	eor $AE89.w,Y		; 59 89 AE
	sta ($CE.b),Y		; 91 CE
	phb		; 8B
	ldx #$E9.b		; A2 E9
	tax		; AA
	adc $6B24.w		; 6D 24 6B
	eor ($A0.b,X)		; 41 A0
	bne 104.b		; D0 68
	bit $72.b		; 24 72
	sbc ($FA.b)		; F2 FA
	xce		; FB
	eor $9D23.w,X		; 5D 23 9D
	eor [$51.b]		; 47 51
	pei ($75.b)		; D4 75
	ora ($39.b)		; 12 39
	cmp $70.b,S		; C3 70
	jmp.w [$FE37]		; DC 37 FE
	tya		; 98
	cli		; 58
	eor ($31.b)		; 52 31
	lda $5B6F.w,X		; BD 6F 5B
	dec $F5.b,X		; D6 F5
	and $D9.b,S		; 23 D9
	asl A		; 0A
	asl $49C3.w,X		; 1E C3 49
	ldy $D2.b		; A4 D2
	tda		; 7B
	ora #$1A.b		; 09 1A
	sbc $32.b		; E5 32
	sta $A74C.w,Y		; 99 4C A7
	and #$23.b		; 29 23
	lsr $59EB.w,X		; 5E EB 59
	plx		; FA
	cmp $91920B.l,X		; DF 0B 92 91
	lda $9CCB.w		; AD CB 9C
	sbc $460D.w,X		; FD 0D 46
	sbc $23.b		; E5 23
	jmp $FE8BB6.l		; 5C B6 8B FE
	sta $48CB65.l		; 8F 65 CB 48
	lda $0A.b,X		; B5 0A
	tas		; 1B
	lda $0A.b		; A5 0A
	trb $37.b		; 14 37
	eor #$16.b		; 49 16
	lda $56D6.w		; AD D6 56
	lda $B55A.w		; AD 5A B5
	adc #$16.b		; 69 16
	cpx $B4.b		; E4 B4
	txs		; 9A
	phk		; 4B
	dex		; CA
	cmp $39.b,X		; D5 39
	bit #$16.b		; 89 16
	iny		; C8
	adc ($52.b,X)		; 61 52
	lda $42.b		; A5 42
	sta $09.b		; 85 09
	inc A		; 1A
	sed		; F8
	sbc $78E3.w		; ED E3 78
	dec $8937.w,X		; DE 37 89
	asl $AD.b,X		; 16 AD
	tad		; 5B
	sbc $33.b		; E5 33
	ora $C78C.w,Y		; 19 8C C7
	ror $C991.w		; 6E 91 C9
	sta ($26.b,S),Y		; 93 26
	jmp $4A91.w		; 4C 91 4A
	mvn $FF,$80		; 54 80 FF
	and [$5D.b]		; 27 5D
	xce		; FB
	eor ($29.b)		; 52 29
	sta $188C.w		; 8D 8C 18
	cld		; D8
	cld		; D8
	txs		; 9A
	ora #$1E.b		; 09 1E
	sbc ($9C.b,S),Y		; F3 9C
	adc [$19.b]		; 67 19
	and $DE.b,S		; 23 DE
	xce		; FB
	ldy $E9.b		; A4 E9
	bit $7A.b		; 24 7A
	adc $0D.b		; 65 0D
	bit $8F.b		; 24 8F
	adc $54AB.w		; 6D AB 54
	sta ($ED.b),Y		; 91 ED
	ldy $84.b		; A4 84
	eor [$54.b],Y		; 57 54
	rol $48.b		; 26 48
	lda [$5D.b]		; A7 5D
	cmp [$75.b],Y		; D7 75
	cmp $9A23B5.l,X		; DF B5 23 9A
	eor $1527.w		; 4D 27 15
	stz $CF91.w		; 9C 91 CF
	and $71C6.w,Y		; 39 C6 71
	stz $4772.w,X		; 9E 72 47
	and $4E3A.w		; 2D 3A 4E
	sta ($A4.b,S),Y		; 93 A4
	sta ($C9.b),Y		; 91 C9
	sta ($5A.b,X)		; 81 5A
	eor [$3A.b]		; 47 3A
	tax		; AA
	sta $36.b,X		; 95 36
	sta ($3D.b)		; 92 3D
	lda $12D86F.l,X		; BF 6F D8 12
	and $4232.w,Y		; 39 32 42
	sta $B48D81.l		; 8F 81 8D B4
	cmp $A47C.w,Y		; D9 7C A4
	phb		; 8B
	eor ($A5.b)		; 52 A5
	sbc #$35.b		; E9 35
	eor $BA6AFE.l,X		; 5F FE 6A BA
	adc #$1A.b		; 69 1A
	sbc $A22F.w,X		; FD 2F A2
	wai		; CB
	rtl		; 6B

	and #$48.b		; 29 48
	lda [$59.b],Y		; B7 59
	tad		; 5B
	stz $D5.b,X		; 74 D5
	ror $ED.b,X		; 76 ED
	eor [$6E.b],Y		; 57 6E
	sta ($6A.b),Y		; 91 6A
	cmp $BA.b,X		; D5 BA
	inc $A0BB.w		; EE BB A0
	cpy #$C0.b		; C0 C0
	sta ($AE.b),Y		; 91 AE
	tad		; 5B
	eor $EC.b		; 45 EC
	ldy $5C.b,X		; B4 5C
	ldy $8D.b,X		; B4 8D
	adc $1B4E.w,Y		; 79 4E 1B
	jmp.w [$277E]		; DC 7E 27
	sty $91.b,X		; 94 91
	rtl		; 6B

	tax		; AA
	inc A		; 1A
	lsr A		; 4A
	trb $28.b		; 14 28
	adc #$24.b		; 69 24
	tad		; 5B
	adc #$52.b		; 69 52
	lda $4A.b		; A5 4A
	sta $36.b,X		; 95 36
	sta ($2D.b)		; 92 2D
	ldx $CF.b,Y		; B6 CF
	adc [$BC.b]		; 67 BC
	dec $7B.b		; C6 7B
	and $48D3.w,X		; 3D D3 48
	lda [$8C.b],Y		; B7 8C
	cmp ($7B.b,S),Y		; D3 7B
	and $9306.w		; 2D 06 93
	eor #$9E.b		; 49 9E
	sta ($AD.b),Y		; 91 AD
	ldx $CB.b		; A6 CB
	adc $B2.b		; 65 B2
	phx		; DA
	pha		; 48
	ldx $4D.b		; A6 4D
	cpx $D99B.w		; EC 9B D9
	and [$BC.b],Y		; 37 BC
	asl $833F.w,X		; 1E 3F 83
	cmp [$F0.b]		; C7 F0
	and $1BAF.w,X		; 3D AF 1B
	lda ($E3.b,X)		; A1 E3
	stz $2F.b,X		; 74 2F
	eor ($7A.b),Y		; 51 7A
	phb		; 8B
	pei ($71.b)		; D4 71
	inx		; E8
	sbc $D1.b,S		; E3 D1
	sbc $D051.w		; ED 51 D0
	cpx #$F4.b		; E0 F4
	sec		; 38
	jsr $D304.w		; 20 04 D3
	mvp $01,$B8		; 44 B8 01
	and ($10.b)		; 32 10
	brk $08.b		; 00 08
	sta [$49.b],Y		; 97 49
	beq -122.b		; F0 86
	and [$C0.b],Y		; 37 C0
	brk $89.b		; 00 89
	stz $9F.b,X		; 74 9F
	php		; 08
	tda		; 7B
	adc [$BD.b],Y		; 77 BD
	tyx		; BB
	dec $EFDD.w,X		; DE DD EF
	lda ($2F.b,S),Y		; B3 2F
	cld		; D8
	lsr A		; 4A
	inc $72.b,X		; F6 72
	sbc [$B1.b],Y		; F7 B1
	lsr $7BC5.w,X		; 5E C5 7B
	ora [$D9.b],Y		; 17 D9
	stp		; DB
	xce		; FB
	tsa		; 3B
	adc $DF86.w,X		; 7D 86 DF
	adc [$B5.b]		; 67 B5
	cmp $79ED.w,Y		; D9 ED 79
	tda		; 7B
	eor [$50.b],Y		; 57 50
	sty $21.b		; 84 21
	php		; 08
	adc $EF79.w		; 6D 79 EF
	adc #$27.b		; 69 27
	cpy $10.b		; C4 10
	sty $21.b		; 84 21
	php		; 08
	eor ($09.b,X)		; 41 09
	rol $BDDD.w,X		; 3E DD BD
	ldy $21.b,X		; B4 21
	php		; 08
	.db $42, $16		; 42 16
	plx		; FA
	asl $00C0.w		; 0E C0 00
	and $20.b		; 25 20
	rol $FB.b		; 26 FB
	brk $42.b		; 00 42
	bra   5.b		; 80 05
	brk $08.b		; 00 08
	bvc -108.b		; 50 94
	rol $4B.b,X		; 36 4B
	mvn $42,$E3		; 54 E3 42
	sta ($80.b,X)		; 81 80
	beq -71.b		; F0 B9
	cpx #$20.b		; E0 20
	bvs  20.b		; 70 14
	bra -33.b		; 80 DF
	sta ($04.b,X)		; 81 04
	lsr $6F.b		; 46 6F
	sed		; F8
	sta ($61.b,S),Y		; 93 61
	pla		; 68
	and $9D.b		; 25 9D
	plp		; 28
	sed		; F8
	sbc ($62.b)		; F2 62
	and ($1B.b,X)		; 21 1B
	phx		; DA
	.db $82, $A2, $8B		; 82 A2 8B
	dec $DBFB.w		; CE FB DB
	bit $44.b		; 24 44
	cpy $21.b		; C4 21
	sta ($8A.b)		; 92 8A
	and [$48.b],Y		; 37 48
	pei ($CF.b)		; D4 CF
	asl $92.b,X		; 16 92
	adc $D6CB.w		; 6D CB D6
	eor $9532.w,Y		; 59 32 95
	and $8B.b,X		; 35 8B
	txs		; 9A
	sbc $D95B.w,Y		; F9 5B D9
	cmp [$51.b],Y		; D7 51
	ora ($2C.b),Y		; 11 2C
	cpy $11.b		; C4 11
	ldy $52.b,X		; B4 52
	ora $2D.b,X		; 15 2D
	stx $3D.b,Y		; 96 3D
	lsr $A94C.w		; 4E 4C A9
	sta $2DE9D4.l,X		; 9F D4 E9 2D
	stx $5D.b,Y		; 96 5D
	stz $8F.b		; 64 8F
	dey		; 88
	cmp ($2E.b)		; D2 2E
	lsr $4D.b,X		; 56 4D
	bit $B3.b		; 24 B3
	adc $54FB6D.l		; 6F 6D FB 54
	cmp $BE2C.w,Y		; D9 2C BE
	cpy $49.b		; C4 49
	bit $D3.b		; 24 D3
	cmp ($12.b)		; D2 12
	.db $42, $B7		; 42 B7
	rol $25.b		; 26 25
	asl $514F.w,X		; 1E 4F 51
	and $FA.b		; 25 FA
	adc $32BA.w,Y		; 79 BA 32
	bit $9A.b		; 24 9A
	eor $926D.w		; 4D 6D 92
	bit $24.b		; 24 24
	adc $37.b,S		; 63 37
	stp		; DB
	asl $4B17.w,X		; 1E 17 4B
.ACCU 16
	rep #$E9		; C2 E9
	adc [$7E.b],Y		; 77 7E
	sta [$79.b],Y		; 97 79
	dex		; CA
	sbc $D24339.l		; EF 39 43 D2
	cld		; D8
	plx		; FA
	sbc $1F2E.w,X		; FD 2E 1F
	phk		; 4B
	sta [$E9.b]		; 87 E9
	eor ($CA.b),Y		; 51 CA
	lda $95.b,S		; A3 95
	mvp $92,$08		; 44 08 92
	ror $98.b		; 66 98
	tsb $42.b		; 04 42
	bpl -104.b		; 10 98
	bpl  34.b		; 10 22
	eor #$4400.w		; 49 00 44
	and ($00.b,X)		; 21 00
	and [$17.b],Y		; 37 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	adc [$17.b],Y		; 77 17
	ror $76D1.w		; 6E D1 76
	phb		; 8B
	ldy $5D.b,X		; B4 5D
	ldx #$ED.b		; A2 ED
	ora [$68.b],Y		; 17 68
	tyx		; BB
	eor $DA.b		; 45 DA
	ora ($11.b)		; 12 11
	cmp $677025.l		; CF 25 70 67
	cpx #$CF.b		; E0 CF
	cmp ($9F.b,X)		; C1 9F
	sta $3F.b,S		; 83 3F
	ora $E9.b		; 05 E9
	plp		; 28
	eor ($56.b),Y		; 51 56
	adc $B559.w		; 6D 59 B5
	ror $D5.b		; 66 D5
	txy		; 9B
	lsr $6C.b,X		; 56 6C
	eor #$D4DD.w		; 49 DD D4
	adc [$D1.b],Y		; 77 D1
	sbc ($D0.b),Y		; F1 D0
	ora ($E9.b,X)		; 01 E9
	dex		; CA
	sbc ($E5.b),Y		; F1 E5
	adc $B172.w,Y		; 79 72 B1
	and [$78.b]		; 27 78
	lda ($F6.b),Y		; B1 F6
	adc $6A.b,S		; 63 6A
	bra  15.b		; 80 0F
	xba		; EB
	sta $DD.b,X		; 95 DD
	dex		; CA
	sbc #$C4E9.w		; E9 E9 C4
	sta $3C.b,X		; 95 3C
	eor $E5D11A.l		; 4F 1A D1 E5
	cmp [$96.b]		; C7 96
	bra -102.b		; 80 9A
	eor $E44ADE.l,X		; 5F DE 4A E4
	wai		; CB
	cpy $9D.b		; C4 9D
	sbc $5CFFD8.l,X		; FF D8 FF 5C
	ror $C8.b,X		; 76 C8
	brk $FE.b		; 00 FE
	and $5A5F.w,Y		; 39 5F 5A
	eor [$3F.b],Y		; 57 3F
	rol $AB24.w,X		; 3E 24 AB
	ora ($62.b),Y		; 11 62
	rol $773C.w,X		; 3E 3C 77
	cmp ($DF.b),Y		; D1 DF
	jsr $CB30.w		; 20 30 CB
	sbc ($E5.b)		; F2 E5
	sei		; 78
	sbc ($F1.b)		; F2 F1
	and $76.b		; 25 76
	ora ($11.b),Y		; 11 11
	plx		; FA
	sbc $B3.b,S		; E3 B3
	stx $01CD.w		; 8E CD 01
	eor $F167.w,X		; 5D 67 F1
	lsr A		; 4A
	sbc $25.b,X		; F5 25
	sep #$4A		; E2 4A
	cpx $2322.w		; EC 22 23
	cpy $8F.b		; C4 8F
	lda $1E.b,X		; B5 1E
	sbc $5D01.w,Y		; F9 01 5D
	adc [$9D.b]		; 67 9D
	pld		; 2B
	sta ($91.b),Y		; 91 91
	cmp $95.b,X		; D5 95
	bit #$E12B.w		; 89 2B E1
	dec $D2.b		; C6 D2
	rol $91.b,X		; 36 91
	ldy $8D.b,X		; B4 8D
	ldx #$03.b		; A2 03
	lda [$2B.b]		; A7 2B
	lda #$C425.w		; A9 25 C4
	sta $DD.b,X		; 95 DD
	cpy $47.b		; C4 47
	dex		; CA
	sta $2D1F99.l		; 8F 99 1F 2D
	ora ($45.b,X)		; 01 45
	ora [$A1.b]		; 07 A1
	pld		; 2B
	sed		; F8
	and $7F.b		; 25 7F
	trb $AC.b		; 14 AC
	eor #$E45D.w		; 49 5D E4
	adc [$91.b],Y		; 77 91
	sbc $DF31.w,X		; FD 31 DF
	eor [$7C.b]		; 47 7C
	bra -28.b		; 80 E4
	wai		; CB
	sbc $BC32.w,Y		; F9 32 BC
	adc $9378.w,Y		; 79 78 93
	tyx		; BB
	tya		; 98
	sbc $40BD63.l		; EF 63 BD 40
	ora [$36.b]		; 07 36
	eor [$3A.b],Y		; 57 3A
	lsr $6469.w,X		; 5E 69 64
	cmp #$2693.w		; C9 93 26
	jmp $0098.w		; 4C 98 00
	wai		; CB
	adc $B2.b		; 65 B2
	cmp $1666.w,Y		; D9 66 16
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	asl $14.b,X		; 16 14
	phb		; 8B
	.db $62, $AF, $BA		; 62 AF BA
	stx $5AD1.w		; 8E D1 5A
	lda $69.b,X		; B5 69
	inc A		; 1A
	plx		; FA
	asl $EA8A.w		; 0E 8A EA
	sta [$EC.b],Y		; 97 EC
	pha		; 48
	cmp [$BF.b],Y		; D7 BF
	mvn $9A,$EE		; 54 EE 9A
	rol $22DD.w		; 2E DD 22
	cmp $AB.b,X		; D5 AB
	clc		; 18
	cli		; 58
	cli		; 58
	eor ($31.b)		; 52 31
	lsr A		; 4A
	sta [$68.b],Y		; 97 68
	inx		; E8
	dec A		; 3A
	asl $B483.w		; 0E 83 B4
	pha		; 48
	cmp [$25.b],Y		; D7 25
	cmp $57DD73.l		; CF 73 DD 57
	eor $22.b,X		; 55 22
	cld		; D8
	cli		; 58
	eor $D66C.w,Y		; 59 6C D6
	rtl		; 6B

	and $9A.b,X		; 35 9A
	sta ($6D.b),Y		; 91 6D
	sta $6D.b,X		; 95 6D
	adc $6A.b		; 65 6A
	cmp $AB.b,X		; D5 AB
	pha		; 48
	cmp [$FE.b],Y		; D7 FE
	ora $C89049.l,X		; 1F 49 90 C8
	adc $1AC9.w,Y		; 79 C9 1A
	cmp $AD562B.l,X		; DF 2B 56 AD
	phy		; 5A
	lsr $BE.b		; 46 BE
	sbc $21.b,S		; E3 21
	bcc -56.b		; 90 C8
	sei		; 78
	lda #$F51A.w		; A9 1A F5
	sta $5FF329.l,X		; 9F 29 F3 5F
	and $4A.b,X		; 35 4A
	lsr $BE.b		; 46 BE
	.db $42, $96		; 42 96
	plp		; 28
	dec $48.b		; C6 48
	ldy $C3.b,X		; B4 C3
	sbc $CBAD.w,X		; FD AD CB
	adc ($DC.b)		; 72 DC
	lda [$29.b],Y		; B7 29
	asl $E1.b,X		; 16 E1
	ldx $77.b		; A6 77
	ora $76DB.w		; 0D DB 76
	cmp $64BC.w,X		; DD BC 64
	txa		; 8A
	eor $839FC1.l		; 4F C1 9F 83
	rol $F25C.w,X		; 3E 5C F2
	eor $01.b		; 45 01
	lsr $6D.b,X		; 56 6D
	eor $BFBA.w,Y		; 59 BA BF
	bit #$8142.w		; 89 42 81
	tax		; AA
	cmp $8E.b,X		; D5 8E
	plx		; FA
	tsa		; 3B
	inx		; E8
	cpx $44.b		; E4 44
	bcc  14.b		; 90 0E
	bit $C9BF.w,X		; 3C BF C9
	sta $01.b,X		; 95 01
	php		; 08
	sta $6DAC.w		; 8D AC 6D
	adc $6B.b,S		; 63 6B
	ora ($40.b)		; 12 40
	bit $E4.b,X		; 34 E4
	bcc  16.b		; 90 10
	dey		; 88
	sbc ($E3.b)		; F2 E3
	wai		; CB
	sta $9268.w		; 8D 68 92
	ora ($93.b,X)		; 01 93
	and $4025EF.l		; 2F EF 25 40
	.db $42, $23		; 42 23
	ldx $8E.b,Y		; B6 8E
	phx		; DA
	and $4012F9.l,X		; 3F F9 12 40
	and ($E5.b,S),Y		; 33 E5
	inc $A834.w,X		; FE 34 A8
	php		; 08
	mvp $D1,$77		; 44 77 D1
	cmp $8EC747.l,X		; DF 47 C7 8E
.ACCU 16
.INDEX 16
	rep #$3B		; C2 3B
	tya		; 98
	ora [$1E.b]		; 07 1E
	eor $5D2B97.l,X		; 5F 97 2B 5D
	jmp ($51D9.w,X)		; 7C D9 51
	php		; 08
	stx $3BCE.w		; 8E CE 3B
	sec		; 38
	cpx $48E2.w		; EC E2 48
	ora [$52.b]		; 07 52
	eor #$0801.w		; 49 01 08
	sta $FA1E7D.l		; 8F 7D 1E FA
	and $49F4.w,X		; 3D F4 49
	brk $EA.b		; 00 EA
	cmp #$2120.w		; C9 20 21
	ora ($B4.b),Y		; 11 B4
	sta $7CA4.w		; 8D A4 7C
	sec		; 38
	sta ($01.b)		; 92 01
	lda #$D32F.w		; A9 2F D3
	sta $01.b,X		; 95 01
	php		; 08
	sta $321F99.l		; 8F 99 1F 32
	rol $495C.w,X		; 3E 5C 49
	brk $FC.b		; 00 FC
	ora ($FF.b)		; 12 FF
	txa		; 8A
	mvn $22,$04		; 54 04 22
	tsa		; 3B
	inx		; E8
	sbc $62FAA3.l		; EF A3 FA 62
	pha		; 48
	ora [$1E.b]		; 07 1E
	eor $0195C9.l,X		; 5F C9 95 01
	php		; 08
	stx $3BF6.w		; 8E F6 3B
	cld		; D8
	inc $4862.w		; EE 62 48
	asl $74.b		; 06 74
	lda $045436.l,X		; BF 36 54 04
	jsl $93C964.l		; 22 64 C9 93
	rol $4D.b		; 26 4D
	bmi  50.b		; 30 32
	cmp $B66C.w,Y		; D9 6C B6
	tad		; 5B
	and $C496.w		; 2D 96 C4
	.db $62, $24, $46		; 62 24 46
	sty $84.b		; 84 84
	tsx		; BA
	lda $8454.w		; AD 54 84
	bpl -124.b		; 10 84
	stx $42CC.w		; 8E CC 42
	ora ($3B.b)		; 12 3B
	cmp ($21.b,S),Y		; D3 21
	ora #$C01B.w		; 09 1B C0
	cld		; D8
	and ($09.b,X)		; 21 09
	ora $21D2.w,X		; 1D D2 21
	ora #$FE1D.w		; 09 1D FE
	ora $11.b,S		; 03 11
	dey		; 88
	sta ($DC.b),Y		; 91 DC
	stz $84.b		; 64 84
	jmp $5D8424.l		; 5C 24 84 5D
	dex		; CA
	eor $37.b		; 45 37
	ora [$77.b],Y		; 17 77
	ora [$77.b],Y		; 17 77
	ora [$7E.b],Y		; 17 7E
	eor $93DF.w		; 4D DF 93
	adc [$E4.b],Y		; 77 E4
	cmp $5DDC.w,X		; DD DC 5D
	jmp.w [$BB5D]		; DC 5D BB
	eor $DA.b		; 45 DA
	rol $76D1.w		; 2E D1 76
	phb		; 8B
	ldy $5D.b,X		; B4 5D
	ldx #$17ED.w		; A2 ED 17
	pla		; 68
	lda ($FF.b,X)		; A1 FF
	asl $E5.b,X		; 16 E5
	inc $579D.w		; EE 9D 57
	inc $AD56.w		; EE 56 AD
	jsl LC19BDE.l		; 22 DE 9B C1
	sei		; 78
	and $A9E905.l		; 2F 05 E9 A9
	eor ($91.b)		; 52 91
	adc $ADB7FB.l		; 6F FB B7 AD
	ror $BB.b,X		; 76 BB
	phx		; DA
	pha		; 48
	cmp [$1D.b],Y		; D7 1D
	stz $CFBE.w,X		; 9E BE CF
	adc [$24.b]		; 67 24
	rtl		; 6B

	lda $5B6E.w,X		; BD 6E 5B
	stx $E5.b,Y		; 96 E5
	lda $D748.w,Y		; B9 48 D7
	cpx $3C65.w		; EC 65 3C
	rol $E5.b,X		; 36 E5
	sbc ($A4.b,X)		; E1 A4
	.db $62, $67, $70		; 62 67 70
	cmp $73BE.w,X		; DD BE 73
	sei		; 78
	jsr ($1869.w,X)		; FC 69 18
	pei ($6A.b)		; D4 6A
	dec A		; 3A
	rtl		; 6B

	xba		; EB
	xba		; EB
	sbc #$F31A.w		; E9 1A F3
	cmp $5C72F9.l,X		; DF F9 72 5C
	sta [$25.b],Y		; 97 25
	and $5C.b,S		; 23 5C
	inc $63.b		; E6 63
	cmp ($66.b),Y		; D1 66
	and $1AC9.w,Y		; 39 C9 1A
	dex		; CA
	bvc -58.b		; 50 C6
	ora $1849.w,Y		; 19 49 18
	xba		; EB
	tsx		; BA
	sbc $0786.w		; ED 86 07
	eor $C0B0.w,X		; 5D B0 C0
	sta ($6D.b),Y		; 91 6D
	cmp ($02.b,S),Y		; D3 02
	lda $C6.b,X		; B5 C6
	sbc ($CA.b),Y		; F1 CA
	pha		; 48
	dec $9A.b		; C6 9A
	sbc ($84.b,S),Y		; F3 84
	lda #$C271.w		; A9 71 C2
	pha		; 48
	cmp $2A.b		; C5 2A
	cli		; 58
	tax		; AA
	mvn $EC,$37		; 54 37 EC
	asl A		; 0A
	cmp ($29.b)		; D2 29
	sta ($C9.b)		; 92 C9
	stz $B2.b		; 64 B2
	eor $122E.w,Y		; 59 2E 12
	lsr $33.b		; 46 33
	cmp $F6EC.w,Y		; D9 EC F6
	tda		; 7B
	and $A4DC.w,X		; 3D DC A4
	.db $62, $64, $C9		; 62 64 C9
	sta ($26.b,S),Y		; 93 26
	pha		; 48
	eor $D2.b		; 45 D2
	sta ($C0.b)		; 92 C0
	inc A		; 1A
	plb		; AB
	xba		; EB
	xba		; EB
	cpx #$2411.w		; E0 11 24
	cmp $00B2.w,Y		; D9 B2 00
	bra -64.b		; 80 C0
	brk $89.b		; 00 89
	and [$53.b]		; 27 53
	bvc   1.b		; 50 01
	ora ($B4.b,X)		; 01 B4
	brk $44.b		; 00 44
	stx $00.b,Y		; 96 00
	sty $88.b		; 84 88
	sep #$4B		; E2 4B
	.db $62, $E2, $62		; 62 E2 62
.ACCU 8
	sep #$62		; E2 62
	bra  49.b		; 80 31
	eor ($AC.b,X)		; 41 AC
	ora $6A.b		; 05 6A
	cmp $AB.b,X		; D5 AB
	lsr $91.b,X		; 56 91
	sbc $DFF6D8.l		; EF D8 F6 DF
	lda #$23.b		; A9 23
	dec $41BB.w,X		; DE BB 41
	ldy #$EE91.w		; A0 91 EE
	phb		; 8B
	adc ($DC.b)		; 72 DC
	ldy $6A.b		; A4 6A
	stz $CD.b		; 64 CD
	tsx		; BA
	stz $C9.b		; 64 C9
	asl $6BD6.w,X		; 1E D6 6B
	lda $D2.b,X		; B5 D2
	and $58.b,X		; 35 58
	inc $171D.w		; EE 1D 17
	eor $23.b		; 45 23
	mvn $62,$A9		; 54 A9 62
	ldy $5A.b,X		; B4 5A
	and #$1E.b		; 29 1E
	sbc $07DD.w		; ED DD 07
	beq -92.b		; F0 A4
	rtl		; 6B

	php		; 08
	inc $38.b		; E6 38
	dec $4732.w		; CE 32 47
	clv		; B8
	jmp $E4C7.w		; 4C C7 E4
	pha		; 48
	pea $18CA.w		; F4 CA 18
	cmp #$14.b		; C9 14
	sbc #$48.b		; E9 48
	txs		; 9A
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	xce		; FB
	eor ($CC.b)		; 52 CC
	sta [$12.b],Y		; 97 12
	lsr $0606.w,X		; 5E 06 06
	asl $00.b		; 06 00
	phd		; 0B
	trb $2749.w		; 1C 49 27
	eor ($52.b,S),Y		; 53 52
	bit $BF.b		; 24 BF
	ora ($E0.b,X)		; 01 E0
	bit $D006.w,X		; 3C 06 D0
	ora ($12.b,X)		; 01 12
	sbc ($49.b,S),Y		; F3 49
	cpx #$3A9D.w		; E0 9D 3A
	stz $E9.b,X		; 74 E9
	cmp ($C4.b,S),Y		; D3 C4
	lda $7832.w,X		; BD 32 78
	and $ADAD.w		; 2D AD AD
	lda $ADAD.w		; AD AD AD
	cpy $BD.b		; C4 BD
	phy		; 5A
	sbc $75.b,X		; F5 75
	nop		; EA
	xba		; EB
	cmp $D6.b,X		; D5 D6
	plb		; AB
	ldy $16A8.w		; AC A8 16
	stx $96.b,Y		; 96 96
	stx $96.b,Y		; 96 96
	sta ($24.b),Y		; 91 24
	adc $EE5FEE.l,X		; 7F EE 5F EE
	dex		; CA
	cpx #$5F92.w		; E0 92 5F
	adc $D6F7.w,Y		; 79 F7 D6
	lsr $56.b,X		; 56 56
	lsr $56.b,X		; 56 56
	lsr $62.b,X		; 56 62
	eor $F02F2F.l,X		; 5F 2F 2F F0
	dex		; CA
	sbc $E5.b		; E5 E5
	bra -53.b		; 80 CB
	ror $2114.w,X		; 7E 14 21
	php		; 08
	.db $42, $31		; 42 31
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($5A.b),Y		; 31 5A
	cmp $B366.w		; CD 66 B3
	eor $D6AC.w,Y		; 59 AC D6
	rtl		; 6B

	and $AB.b,X		; 35 AB
	jmp ($2024.w)		; 6C 24 20
	inx		; E8
	ldy $8434.w,X		; BC 34 84
	inc A		; 1A
	ora $8CA582.l		; 0F 82 A5 8C
	sta ($CD.b),Y		; 91 CD
	wai		; CB
	eor #$21.b		; 49 21
	tsb $CC.b		; 04 CC
	cpx $84.b		; E4 84
	inc A		; 1A
	sbc $0170.w		; ED 70 01
	xce		; FB
	cmp ($29.b)		; D2 29
	cmp ($68.b),Y		; D1 68
	brk $0E.b		; 00 0E
	adc ($45.b)		; 72 45
	bit $58.b,X		; 34 58
	ldy #$E903.w		; A0 03 E9
	bit $53.b		; 24 53
	eor $A0FC.w,X		; 5D FC A0
	cop $FA.b		; 02 FA
	eor $38.b		; 45 38
	cmp $D5534D.l		; CF 4D 53 D5
	ora [$D7.b],Y		; 17 D7
	cmp $992279.l,X		; DF 79 22 99
	stx $0030.w		; 8E 30 00
	xce		; FB
	bit #$16.b		; 89 16
	dex		; CA
	lsr $A8.b,X		; 56 A8
	ply		; 7A
	plb		; AB
	xba		; EB
	sbc #$1E.b		; E9 1E
	ldx $F2BE.w,Y		; BE BE F2
	cmp ($3D.b)		; D2 3D
	jmp ($BD7F.w,X)		; 7C 7F BD
	and ($17.b,X)		; 21 17
	sbc $48.b,S		; E3 48
	lda [$4A.b]		; A7 4A
	mvp $8D,$DA		; 44 DA 8D
	lsr $A3.b		; 46 A3
	eor ($A8.b),Y		; 51 A8
	pei ($6A.b)		; D4 6A
	and $22.b,X		; 35 22
	eor $E42B7D.l,X		; 5F 7D 2B E4
	lsr A		; 4A
	cpy $6C.b		; C4 6C
	cpx $B7DB.w		; EC DB B7
	lda ($B2.b,S),Y		; B3 B2
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -79.b		; B0 B1
	ora ($A9.b),Y		; 11 A9
	lda #$C4.b		; A9 C4
	sta $EA.b,X		; 95 EA
	lsr A		; 4A
	sbc $75A5.w		; ED A5 75
	and $22.b,X		; 35 22
	jmp $073CDA.l		; 5C DA 3C 07
	ror $E7.b		; 66 E7
	ldx $80.b,Y		; B6 80
	txs		; 9A
	eor #$88.b		; 49 88
	txs		; 9A
	phk		; 4B
	lsr $3A9D.w		; 4E 9D 3A
	stz $E9.b		; 64 E9
	cmp ($A7.b,S),Y		; D3 A7
	ldx $49.b		; A6 49
	dey		; 88
	ldx $4B.b		; A6 4B
	tad		; 5B
	tad		; 5B
	tad		; 5B
	asl $D6.b,X		; 16 D6
	dec $D6.b,X		; D6 D6
	cmp $2A.b,X		; D5 2A
	plb		; AB
	inc $FB.b,X		; F6 FB
	cld		; D8
	plb		; AB
	rol $FAAC.w,X		; 3E AC FA
	lda ($EA.b,S),Y		; B3 EA
	cmp $1642.w		; CD 42 16
	sta [$D6.b],Y		; 97 D6
	stx $96.b,Y		; 96 96
	stx $B0.b,Y		; 96 B0
	eor #$31.b		; 49 31
	clc		; 18
	bit $B5.b		; 24 B5
	sta $95.b,X		; 95 95
	sta ($65.b),Y		; 91 65
	adc $65.b		; 65 65
	stz $08.b		; 64 08
	bra   4.b		; 80 04
	and ($02.b,X)		; 21 02
	bpl -124.b		; 10 84
	adc $95.b,X		; 75 95
	rol A		; 2A
	mvn $CC,$91		; 54 91 CC
	cmp [$92.b],Y		; D7 92
	cpx $39.b		; E4 39
	cmp #$1C.b		; C9 1C
	inc $C4D7.w,X		; FE D7 C4
	ror $C417.w,X		; 7E 17 C4
	pha		; 48
	sbc [$5D.b]		; E7 5D
	cmp [$7B.b],Y		; D7 7B
	adc $9B236D.l		; 6F 6D 23 9B
	ldx $ED.b,Y		; B6 ED
	ldx $D3.b		; A6 D3
	pha		; 48
	inc $42.b		; E6 42
	cmp ($29.b,S),Y		; D3 29
	sbc [$12.b],Y		; F7 12
	and $6FBC.w,Y		; 39 BC 6F
	ora [$D7.b],Y		; 17 D7
	cmp ($39.b)		; D2 39
	pea $0C99.w		; F4 99 0C
	sta [$FD.b]		; 87 FD
	eor ($39.b)		; 52 39
	ldx $D3.b		; A6 D3
	ror A		; 6A
	and $12.b,X		; 35 12
	and $7CBB.w,Y		; 39 BB 7C
	sbc $F7.b		; E5 F7
	eor $9123.w,Y		; 59 23 91
	asl $AF14.w,X		; 1E 14 AF
	cld		; D8
	sta $D9.b,X		; 95 D9
	cmp $D988.w,Y		; D9 88 D9
	cmp $7F9E.w,Y		; D9 9E 7F
	lda $B02A.w		; AD 2A B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	lda ($12.b),Y		; B1 12
	lsr $A7A6.w		; 4E A6 A7
	ora ($57.b)		; 12 57
	lda #$2B.b		; A9 2B
	cpy $95.b		; C4 95
	pei ($D4.b)		; D4 D4
	ora $68.b,S		; 03 68
	beq  29.b		; F0 1D
	txy		; 9B
	cpy #$136D.w		; C0 6D 13
	eor #$B1.b		; 49 B1
	ora ($4B.b,S),Y		; 13 4B
	lda [$4E.b]		; A7 4E
	sta $743A.w,X		; 9D 3A 74
	cmp #$D3.b		; C9 D3
	cmp ($26.b,S),Y		; D3 26
	cld		; D8
	txa		; 8A
	stz $69.b,X		; 74 69
	cmp ($5B.b),Y		; D1 5B
	tad		; 5B
	tad		; 5B
	tad		; 5B
	tad		; 5B
	adc ($5B.b,X)		; 61 5B
	tad		; 5B
	plb		; AB
	rol $AC.b,X		; 36 AC
	phx		; DA
	ldx $7255.w		; AE 55 72
	plb		; AB
	sta ($C5.b,S),Y		; 93 C5
	eor ($EB.b)		; 52 EB
	phk		; 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	eor #$96.b		; 49 96
	stx $B0.b,Y		; 96 B0
	eor #$B1.b		; 49 B1
	clc		; 18
	and $D6.b		; 25 D6
	lsr $56.b,X		; 56 56
	lsr $56.b,X		; 56 56
	eor $95.b		; 45 95
	bcc   2.b		; 90 02
	jsr $8410.w		; 20 10 84
	and ($02.b,X)		; 21 02
	bpl 108.b		; 10 6C
	bcs  48.b		; B0 30
	rol $58.b,X		; 36 58
	clc		; 18
	tas		; 1B
	and #$16.b		; 29 16
	dec $1A.b		; C6 1A
	eor $4DDB.w		; 4D DB 4D
	ldx $FF.b		; A6 FF
	.db $62, $45, $B0		; 62 45 B0
	ora $6EBB29.l		; 0F 29 BB 6E
	stp		; DB
	lda [$9A.b],Y		; B7 9A
	sta ($AF.b),Y		; 91 AF
	.db $82, $C8, $7D		; 82 C8 7D
	asl $43.b,X		; 16 43
	cmp $48.b		; C5 48
	ldx $C3.b,Y		; B6 C3
	phd		; 0B
	phd		; 0B
	bra -32.b		; 80 E0
	bmi -80.b		; 30 B0
	ldy $5B.b		; A4 5B
	clc		; 18
	adc #$B4.b		; 69 B4
	phx		; DA
	adc $B236.w		; 6D 36 B2
	lsr $B8.b		; 46 B8
	jmp $E4C7.w		; 4C C7 E4
	ror $38.b		; 66 38
	eor #$1A.b		; 49 1A
	dex		; CA
	bvc -58.b		; 50 C6
	ora $1649.w,Y		; 19 49 16
	dec $6B.b,X		; D6 6B
	tax		; AA
	mvn $AE,$A9		; 54 A9 AE
	dec $48.b,X		; D6 48
	ldx $92.b,Y		; B6 92
	sbc ($74.b,S),Y		; F3 74
	cmp $4B37.w,X		; DD 37 4B
	cmp $8B24.w		; CD 24 8B
	adc $972C59.l		; 6F 59 2C 97
	.db $62, $C9, $64		; 62 C9 64
	lda [$A9.b],Y		; B7 A9
	asl $C6.b,X		; 16 C6
	eor ($30.b)		; 52 30
	bcs -87.b		; B0 A9
	adc $24.b,S		; 63 24
	tad		; 5B
	cmp [$79.b],Y		; D7 79
	cmp $D7CB.w		; CD CB D7
	tda		; 7B
	ldx $83.b		; A6 83
	cmp [$48.b],Y		; D7 48
	ldy $CA.b,X		; B4 CA
	trb $0187.w		; 1C 87 01
	cmp #$50.b		; C9 50
	sta $5F23.w,Y		; 99 23 5F
	lda $C9.b		; A5 C9
	adc $DF7A7B.l,X		; 7F 7B 7A DF
	bit $5B.b		; 24 5B
	stx $A5.b		; 86 A5
	stz $BAE8.w,X		; 9E E8 BA
	pld		; 2B
	wai		; CB
	cmp #$1A.b		; C9 1A
	plx		; FA
	ora $D505.w		; 0D 05 D5
	and $4991DA.l		; 2F DA 91 49
	sbc [$D9.b]		; E7 D9
	cmp $F288.w,Y		; D9 88 F2
	and $77.b		; 25 77
	cmp ($B1.b)		; D2 B1
	bit $AC.b		; 24 AC
	bit $2C2C.w		; 2C 2C 2C
	bit $2C2C.w		; 2C 2C 2C
	bit $9B44.w		; 2C 44 9B
	cpx $ED4A.w		; EC 4A ED
	lda $C0.b		; A5 C0
	ora $B9E780.l		; 0F 80 E7 B9
	sbc #$A4.b		; E9 A4
	lsr $21.b		; 46 21
	dec A		; 3A
	stz $E9.b,X		; 74 E9
	cmp ($A7.b,S),Y		; D3 A7
	lsr $9D9A.w		; 4E 9A 9D
	inc A		; 1A
	adc $9B7A53.l		; 6F 53 7A 9B
	pei ($DE.b)		; D4 DE
	lda [$42.b]		; A7 42
	sta $C20E.w,X		; 9D 0E C2
	asl $D6.b,X		; 16 D6
	dec $D6.b,X		; D6 D6
	dec $D6.b,X		; D6 D6
	dec $D5.b,X		; D6 D5
	cmp $22.b,X		; D5 22
	and ($0B.b),Y		; 31 0B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	lsr $09.b		; 46 09
	ora ($88.b),Y		; 11 88
	eor $5959.w,Y		; 59 59 59
	eor $5959.w,Y		; 59 59 59
	eor $9C48.w,Y		; 59 48 9C
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	and $0869B8.l		; 2F B8 69 08
	bmi  58.b		; 30 3A
	cmp #$08.b		; C9 08
	plp		; 28
	bvc -112.b		; 50 90
	plb		; AB
	pei ($7E.b)		; D4 7E
	lsr $62.b		; 46 62
	eor [$BF.b]		; 47 BF
	cmp ($D3.b)		; D2 D3
	adc #$A4.b		; 69 A4
	tda		; 7B
	dec $72.b		; C6 72
	asl $4682.w,X		; 1E 82 46
	lda $66CDD4.l,X		; BF D4 CD 66
	and ($19.b,S),Y		; 33 19
	bit #$1E.b		; 89 1E
	lda ($42.b,X)		; A1 42
	sty $8A.b		; 84 8A
	bvc -103.b		; 50 99
	and ($06.b,X)		; 21 06
	plx		; FA
	eor [$C8.b],Y		; 57 C8
	sta $D9.b,X		; 95 D9
	cmp $F388.w,Y		; D9 88 F3
	sbc $F6.b		; E5 F6
	ror $62.b,X		; 76 62
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	asl $16.b,X		; 16 16
	rol $D2.b,X		; 36 D2
	lda $ACAC.w,X		; BD AC AC
	eor #$BE.b		; 49 BE
	bit $AF.b		; 24 AF
	and $00A0.w,X		; 3D A0 00
	bit $D2E4.w,X		; 3C E4 D2
	rol $9D.b		; 26 9D
	dec A		; 3A
	stz $E9.b,X		; 74 E9
	cmp ($A7.b,S),Y		; D3 A7
	eor $39854E.l		; 4F 4E 85 39
	pea $D3E7.w		; F4 E7 D3
	sta $397D4E.l,X		; 9F 4E 7D 39
	pea $B4FA.w		; F4 FA B4
	plx		; FA
	plb		; AB
	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	adc $48.b,X		; 75 48
	sta $5A95D5.l		; 8F D5 95 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	cmp ($22.b,X)		; C1 22
	tsa		; 3B
	sbc $9555.w,Y		; F9 55 95
	sta $95.b,X		; 95 95
	sta $95.b,X		; 95 95
	sta $95.b,X		; 95 95
	sty $8A.b,X		; 94 8A
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	php		; 08
	cmp [$6B.b],Y		; D7 6B
	bra  15.b		; 80 0F
	adc #$22.b		; 69 22
	sta $508F.w,Y		; 99 8F 50
	brk $73.b		; 00 73
	ora ($29.b)		; 12 29
	ldx $D3.b		; A6 D3
	ora ($50.b,X)		; 01 50
	sbc $384592.l,X		; FF 92 45 38
	lda $770040.l		; AF 40 00 77
	ora #$14.b		; 09 14
	cpy $8671.w		; CC 71 86
	ora ($42.b),Y		; 11 42
	sta [$68.b]		; 87 68
	sta ($4A.b),Y		; 91 4A
	clc		; 18
	dex		; CA
	ora ($0A.b,S),Y		; 13 0A
	sta $39.b,X		; 95 39
	lda #$1E.b		; A9 1E
	dec $3367.w		; CE 67 33
	sta ($3D.b)		; 92 3D
	inx		; E8
	ldx $EA.b,Y		; B6 EA
	ora ($3D.b)		; 12 3D
	and ($85.b)		; 32 85
	ora #$14.b		; 09 14
	sbc ($E5.b,S),Y		; F3 E5
	inc $76.b,X		; F6 76
	.db $62, $3C, $29		; 62 3C 29
	eor $B32BB1.l,X		; 5F B1 2B B3
	lda ($10.b,S),Y		; B3 10
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -80.b		; B0 B0
	bcs -79.b		; B0 B1
	sbc $CA.b		; E5 CA
	sbc $25.b,X		; F5 25
	sei		; 78
	sta ($BD.b)		; 92 BD
	cpx $49AC.w		; EC AC 49
	adc $CD2E.w,Y		; 79 2E CD
	cpx #$8033.w		; E0 33 80
	ora ($4D.b,S),Y		; 13 4D
	ora ($34.b),Y		; 11 34
	stz $329D.w,X		; 9E 9D 32
	stz $E9.b,X		; 74 E9
	cmp ($A7.b,S),Y		; D3 A7
	eor $6EAB4F.l		; 4F 4F AB 6E
	trb $A9.b		; 14 A9
	eor ($A6.b)		; 52 A6
	stz $3C1D.w,X		; 9E 1D 3C
	and $B5.b,X		; 35 B5
	plp		; 28
	.db $42, $10		; 42 10
	ldx $B7.b,Y		; B6 B7
	cpx #$C44A.w		; E0 4A C4
	adc [$E7.b]		; 67 E7
	sbc $52AD94.l,X		; FF 94 AD 52
	phy		; 5A
	cmp ($E0.b,S),Y		; D3 E0
	lda $6921.w		; AD 21 69
	adc #$69.b		; 69 69
	rtl		; 6B

	asl $08.b		; 06 08
	sta $BEFC.w		; 8D FC BE
	ora #$2D.b		; 09 2D
	adc $32.b		; 65 32
	dex		; CA
	dex		; CA
	dex		; CA
	dex		; CA
	dex		; CA
	cmp #$10.b		; C9 10
	brk $08.b		; 00 08
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
.INDEX 16
	rep #$D8		; C2 D8
	rtl		; 6B

	ldx $12.b,Y		; B6 12
	and $7AC8.w,Y		; 39 C8 7A
	stx $CCBB.w		; 8E BB CC
	rts		; 60

	rts		; 60

	pha		; 48
	cmp [$E4.b]		; C7 E4
	ror $33.b		; 66 33
	ora $1C29.w,Y		; 19 29 1C
	cpy #$69D6.w		; C0 D6 69
	lda $92.b,X		; B5 92
	and $7EC6.w,Y		; 39 C6 7E
	rol $6B.b		; 26 6B
	pea $73A4.w		; F4 A4 73
	and $9A.b,X		; 35 9A
	cmp $5273.w		; CD 73 52
	and $CF9E.w,Y		; 39 9E CF
	eor $E5485F.l,X		; 5F 5F 48 E5
	asl $904B.w		; 0E 4B 90
	inc $8EF4.w,X		; FE F4 8E
	jmp $640C.w		; 4C 0C 64
	stx $A474.w		; 8E 74 A4
	eor $D4A8.w		; 4D A8 D4
	ror A		; 6A
	and $1A.b,X		; 35 1A
	sta $A246.w		; 8D 46 A2
	sbc $F62B7F.l,X		; FF 7F 2B F6
	lda $7C.b		; A5 7C
	sbc $FE5E.w,Y		; F9 5E FE
	lsr $24.b,X		; 56 24
	lda $85.b,X		; B5 85
	sta $85.b		; 85 85
	sta $85.b		; 85 85
	sta $82.b		; 85 82
	and $D8.b,S		; 23 D8
	sta $F2.b,X		; 95 F2
	sbc $7F.b		; E5 7F
	bit $AE.b,X		; 34 AE
	phx		; DA
	eor [$99.b],Y		; 57 99
	pld		; 2B
	ora ($E7.b)		; 12 E7
	cpy #$BF64.w		; C0 64 BF
	sta ($CF.b),Y		; 91 CF
	adc $4FC1.w		; 6D C1 4F
	asl $1D9E.w		; 0E 9E 1D
	bit $EE3E.w,X		; 3C 3E EE
	and #$E1.b		; 29 E1
	cmp ($8F.b,S),Y		; D3 8F
	lsr $383D.w		; 4E 3D 38
	xba		; EB
	rtl		; 6B

	rtl		; 6B

	ror A		; 6A
	asl $D6.b,X		; 16 D6
	dec $D6.b,X		; D6 D6
	nop		; EA
	sta ($62.b)		; 92 62
	rol A		; 2A
	sta ($D6.b)		; 92 D6
	stx $96.b,Y		; 96 96
	sta $A5.b		; 85 A5
	lda $A5.b		; A5 A5
	lda $E1.b,S		; A3 E1
	lda [$8F.b],Y		; B7 8F
	tax		; AA
	dec $AFB7.w,X		; DE B7 AF
	ldx $F8.b		; A6 F8
	adc #$1A.b		; 69 1A
	inc $39.b		; E6 39
	ora $79D751.l		; 0F 51 D7 79
	bit #$16.b		; 89 16
	sbc $9BAA.w,X		; FD AA 9B
	dec $6B.b,X		; D6 6B
	sty $6FCC.w		; 8C CC 6F
	eor ($35.b)		; 52 35
	sbc $38.b,S		; E3 38
	lda $BBE288.l		; AF 88 E2 BB
	sty $8D.b		; 84 8D
	adc $43B6.w,X		; 7D B6 43
	cmp $9E32.w,X		; DD 32 9E
	adc ($46.b)		; 72 46
	ldx $21E3.w,Y		; BE E3 21
	pea $0F59.w		; F4 59 0F
	ora $23.b,X		; 15 23
	lsr $729B.w,X		; 5E 9B 72
	jmp.w [$1AB4]		; DC B4 1A
	ora #$16.b		; 09 16
	sta $6E33.w,Y		; 99 33 6E
	sta $6632.w,Y		; 99 32 66
	adc ($45.b)		; 72 45
	lda $55.b,X		; B5 55
	and $41.b,X		; 35 41
	eor ($61.b,S),Y		; 53 61
	jsl $02E3DD.l		; 22 DD E3 02
	ldx $52.b,Y		; B6 52
.ACCU 8
	sep #$E2		; E2 E2
	ldy $8B.b		; A4 8B
	adc $8B8B.w,Y		; 79 8B 8B
	phb		; 8B
	phb		; 8B
	phb		; 8B
	sty $8BB4.w		; 8C B4 8B
	.db $62, $A9, $50		; 62 A9 50
	cpx $B8.b		; E4 B8
	asl $6402.w		; 0E 02 64
	sta $4E77.w		; 8D 77 4E
	.db $82, $A7, $41		; 82 A7 41
	cmp $5324.w,X		; DD 24 53
	lda $22.b		; A5 22
	rtl		; 6B

	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	sbc ($22.b),Y		; F1 22
	adc #$13.b		; 69 13
	bit #$27.b		; 89 27
	cmp $4AE295.l		; CF 95 E2 4A
	sbc $25.b,X		; F5 25
	ror $D2.b,X		; 76 D2
	lda $A8AC.w,X		; BD AC A8
	tas		; 1B
	sta [$80.b],Y		; 97 80
	cpx $F6DC.w		; EC DC F6
	.db $82, $69, $36		; 82 69 36
	cpy $4D.b		; C4 4D
	cpy #$809B.w		; C0 9B 80
	sta $743A.w,X		; 9D 3A 74
	sbc #$DC.b		; E9 DC
	tsb $E9.b		; 04 E9
	sbc #$C7.b		; E9 C7
	lda [$1E.b]		; A7 1E
	stz $717A.w		; 9C 7A 71
	sbc #$C7.b		; E9 C7
	dey		; 88
	ldx $5D.b		; A6 5D
	adc $6D6D.w		; 6D 6D 6D
	adc $5B6C.w		; 6D 6C 5B
	tad		; 5B
	tax		; AA
	eor $AA88.w		; 4D 88 AA
	eor $6969.w,X		; 5D 69 69
	adc #$69.b		; 69 69
	pla		; 68
	phy		; 5A
	phy		; 5A
	brk $34.b		; 00 34
	sta [$94.b],Y		; 97 94
	ldy $53.b		; A4 53
	ora $00.b,S		; 03 00
	brk $FB.b		; 00 FB
	adc #$08.b		; 69 08
	ldx $42DA.w,Y		; BE DA 42
	and $D82359.l		; 2F 59 23 D8
	eor [$31.b]		; 47 31
	and ($17.b,X)		; 21 17
	sbc [$48.b]		; E7 48
	eor $94.b		; 45 94
	sta ($EA.b),Y		; 91 EA
	cmp $6965.w,X		; DD 65 69
	asl $B3E6.w,X		; 1E E6 B3
	sta $1EC9.w,Y		; 99 C9 1E
	cpy #$97F6.w		; C0 F6 97
	sta ($29.b)		; 92 29
	ora ($6F.b)		; 12 6F
	and ($57.b)		; 32 57
	adc $F92B.w		; 6D 2B F9
	lda $40.b		; A5 40
	ora $9EBB.w		; 0D BB 9E
	inc $DC44.w,X		; FE 44 DC
	ora #$B8.b		; 09 B8
	ora ($70.b,S),Y		; 13 70
	rol $E0.b		; 26 E0
	eor $9BBF.w		; 4D BF 9B
	adc $CCFE36.l,X		; 7F 36 FE CC
	and [$4E.b]		; 27 4E
	sta $743A.w,X		; 9D 3A 74
	sbc #$DB.b		; E9 DB
	plx		; FA
	stz $46.b		; 64 46
	and ($6D.b,X)		; 21 6D
	adc $6D6D.w		; 6D 6D 6D
	adc $6C6D.w		; 6D 6D 6C
	lda $4A.b		; A5 4A
	sbc ($49.b,S),Y		; F3 49
	and $99.b,S		; 23 99
	tsb $4386.w		; 0C 86 43
	dec $E648.w		; CE 48 E6
	eor $21.b,S		; 43 21
	bcc  -6.b		; 90 FA
	rol A		; 2A
	cmp $A4.b,X		; D5 A4
	adc $E5.b,S		; 63 E5
	rol $E66B.w,X		; 3E 6B E6
	lda #$48.b		; A9 48
	inc $7B.b		; E6 7B
	ldy $61.b,X		; B4 61
	ror $E9.b,X		; 76 E9
	trb $B9E4.w		; 1C E4 B9
	cmp $0977.w		; CD 77 09
	and $99.b,S		; 23 99
	sty $63C6.w		; 8C C6 63
	pei ($48.b)		; D4 48
	sbc $0A.b		; E5 0A
	trb $33.b		; 14 33
	sta ($39.b)		; 92 39
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp ($39.b)		; D2 39
	stz $67CE.w		; 9C CE 67
	and $1CA9.w,Y		; 39 A9 1C
	ldy $BCBC.w,X		; BC BC BC
	beq -46.b		; F0 D2
	and $95B6.w,Y		; 39 B6 95
	inc $4A.b		; E6 4A
	cpy $9B.b		; C4 9B
	cpy $E795.w		; CC 95 E7
	ldx $E0.b,Y		; B6 E0
	ora $6E.b,S		; 03 6E
	txy		; 9B
	adc $6CFE36.l,X		; 7F 36 FE 6C
	lda #$B2.b		; A9 B2
	ldx $CA.b		; A6 CA
	txy		; 9B
	rol A		; 2A
	jmp ($B2A9.w)		; 6C A9 B2
	sta ($A7.b,S),Y		; 93 A7
	lsr $3A9D.w		; 4E 9D 3A
	stz $E9.b,X		; 74 E9
	sbc #$91.b		; E9 91
	and $B5.b,X		; 35 B5
	lda $B5.b,X		; B5 B5
	lda $B5.b,X		; B5 B5
	lda $B5.b,X		; B5 B5
	tsx		; BA
	ldy $4D.b		; A4 4D
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	adc #$6B.b		; 69 6B
	tsb $89.b		; 04 89
	ldy $ACAC.w		; AC AC AC
	ldy $ACAC.w		; AC AC AC
	ldy $9FAC.w		; AC AC 9F
	ora $CF9E.w,Y		; 19 9E CF
	jmp ($7B56.w,X)		; 7C 56 7B
	and $92F1.w,X		; 3D F1 92
	and $6EB8.w		; 2D B8 6E
	txy		; 9B
	ldx $E1.b		; A6 E1
	stx $63C7.w		; 8E C7 63
	ldy $63.b		; A4 63
	phd		; 0B
	php		; 08
	bmi -87.b		; 30 A9
	pha		; 48
	ldx $2A.b,Y		; B6 2A
	xce		; FB
	phd		; 0B
	sbc ($BD.b,X)		; E1 BD
	stx $9B.b,Y		; 96 9B
	sbc ($24.b,X)		; E1 24
	tad		; 5B
	nop		; EA
	rol $5E33.w		; 2E 33 5E
	sta $FD.b,S		; 83 FD
	tsb $E8F7.w		; 0C F7 E8
	pha		; 48
	lda [$59.b],Y		; B7 59
	dec $75.b,X		; D6 75
	cmp $BB76.w,X		; DD 76 BB
	eor $4552.w,X		; 5D 52 45
	ldx $4C.b		; A6 4C
	sbc $CBED.w,Y		; F9 ED CB
	bvs -57.b		; 70 C7
	adc $8B04.w,X		; 7D 04 8B
	adc ($6C.b,X)		; 61 6C
	lda $BBB6.w,X		; BD B6 BB
	eor $85.b,X		; 55 85
	sta $22.b		; 85 22
	phx		; DA
	phk		; 4B
	wai		; CB
	dec $7E9B.w		; CE 9B 7E
	lda $52FB.w		; AD FB 52
	and $B896.w		; 2D 96 B8
	lda #$7D.b		; A9 7D
	lsr A		; 4A
	sta [$64.b]		; 87 64
	sta ($6D.b),Y		; 91 6D
	and $E7.b		; 25 E7
	sbc [$38.b],Y		; F7 38
	stx $D023.w		; 8E 23 D0
	eor ($91.b)		; 52 91
	adc $6A95.w		; 6D 95 6A
	txs		; 9A
	tax		; AA
	sta $36.b,X		; 95 36
	ora ($2D.b)		; 12 2D
	ldy $BC.b		; A4 BC
	ldy $6ED2.w,X		; BC D2 6E
	txy		; 9B
	ldx $92.b		; A6 92
	eor $B8.b		; 45 B8
	jmp $4B96.w		; 4C 96 4B
	and $92.b		; 25 92
	cmp #$70.b		; C9 70
	sta ($2D.b)		; 92 2D
	sty $A2A5.w		; 8C A5 A2
	cmp ($68.b),Y		; D1 68
	ldy $5F.b,X		; B4 5F
	and ($23.b,X)		; 21 23
	eor $B5DED4.l,X		; 5F D4 DE B5
	phx		; DA
	sbc $8D64.w		; ED 64 8D
	adc $334E.w,Y		; 79 4E 33
	sty $38E3.w		; 8C E3 38
	cmp #$14.b		; C9 14
	stp		; DB
	lsr A		; 4A
	sbc $97AF44.l,X		; FF 44 AF 97
	pld		; 2B
	cpx $C44A.w		; EC 4A C4
	sta [$CF.b],Y		; 97 CF
	adc $F892D9.l,X		; 7F D9 92 F8
	brk $09.b		; 00 09
	ldx $895A.w		; AE 5A 89
	ldx $724D.w		; AE 4D 72
	rtl		; 6B

	sta ($5C.b,S),Y		; 93 5C
	txy		; 9B
	adc $F136.w,Y		; 79 36 F1
	dec A		; 3A
.ACCU 8
.INDEX 8
	sep #$74		; E2 74
	sbc #$D3.b		; E9 D3
	lda [$4F.b]		; A7 4F
	eor $1431.w		; 4D 31 14
	cmp #$EB.b		; C9 EB
	.db $62, $DA, $DA		; 62 DA DA
	phx		; DA
	phx		; DA
	phx		; DA
	cmp $4455.w,X		; DD 55 44
	eor $27.b,X		; 55 27
	lda $4B0B.w		; AD 0B 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	cli		; 58
	bmi  68.b		; 30 44
	rts		; 60

	sta ($D6.b,S),Y		; 93 D6
	eor $95.b		; 45 95
	sta $95.b,X		; 95 95
	sta $95.b,X		; 95 95
	bcc   3.b		; 90 03
	asl A		; 0A
	.db $42, $2C		; 42 2C
	eor $0F.b		; 45 0F
	eor $22.b		; 45 22
	sty $A8.b,X		; 94 A8
	brk $1F.b		; 00 1F
.INDEX 16
	rep #$90		; C2 90
	phb		; 8B
	cmp $48.b,X		; D5 48
	sbc [$B4.b],Y		; F7 B4
	cpy #$91C0.w		; C0 C0 91
	sbc #$93.b		; E9 93
	and ($52.b),Y		; 31 52
	and $F243.w,Y		; 39 43 F2
	ldx $9D3F.w		; AE 3F 9D
	and $D3.b,S		; 23 D3
	rol $6D.b		; 26 6D
	cmp ($3D.b)		; D2 3D
	sta $B2.b		; 85 B2
	inc $D2.b,X		; F6 D2
	and $BCA4.w,X		; 3D A4 BC
	cpy #$EC91.w		; C0 91 EC
	lda $C5.b,X		; B5 C5
	cpy $8A.b		; C4 8A
	adc #$00.b		; 69 00
	bit $97.b,X		; 34 97
	sta $ED91DC.l,X		; 9F DC 91 ED
	eor $4D.b,X		; 55 4D
	mvn $78,$8F		; 54 8F 78
	rtl		; 6B

	cpy $1E09.w		; CC 09 1E
	sbc ($32.b,X)		; E1 32
	eor $1E29.w,Y		; 59 29 1E
	dec $52.b		; C6 52
	cmp ($48.b),Y		; D1 48
	lda $4A.b		; A5 4A
	bra   7.b		; 80 07
	sbc $24.b,X		; F5 24
	jsl $2992F2.l		; 22 F2 92 29
	ora ($DA.b),Y		; 11 DA
	dex		; CA
	sbc $9EA4.w		; ED A4 9E
	dec $56.b,X		; D6 56
	and $CD.b		; 25 CD
	ora [$3D.b]		; 07 3D
	cmp $00DA73.l		; CF 73 DA 00
	txy		; 9B
	adc $F236.w,Y		; 79 36 F2
	adc $BDE7.w		; 6D E7 BD
	bit #$B1.b		; 89 B1
	inc $C7.b		; E6 C7
	txy		; 9B
	asl $746C.w,X		; 1E 6C 74
	sbc #$D3.b		; E9 D3
	lda [$89.b],Y		; B7 89
	cmp ($A7.b,S),Y		; D3 A7
	eor $11934C.l		; 4F 4C 93 11
	eor $D93C.w		; 4D 3C D9
	lsr $BA8C.w,X		; 5E 8C BA
	phx		; DA
	phx		; DA
	cld		; D8
	ldx $B6.b,Y		; B6 B6
	sty $55.b		; 84 55
	bit $C4.b		; 24 C4
	eor $57.b,X		; 55 57
	adc $95D02B.l		; 6F 2B D0 95
	tax		; AA
	lda $A5.b		; A5 A5
	lda $A1.b		; A5 A1
	adc #$69.b		; 69 69
	php		; 08
	cmp ($24.b,X)		; C1 24
	cpy $60.b		; C4 60
	cmp ($E5.b,X)		; C1 E5
	lsr A		; 4A
	inc $5F59.w,X		; FE 59 5F
	rol A		; 2A
	eor $65.b,X		; 55 65
	adc $64.b		; 65 64
	eor $5959.w,Y		; 59 59 59
	eor $67CE.w,Y		; 59 CE 67
	and ($9E.b,S),Y		; 33 9E
	txa		; 8A
	eor [$3A.b]		; 47 3A
	asl $A083.w		; 0E 83 A0
	sbc [$EA.b],Y		; F7 EA
	mvn $63,$A4		; 54 A4 63
	and $F5.b,X		; 35 F5
	pei ($3D.b)		; D4 3D
	eor ($85.b),Y		; 51 85
	and $18.b,S		; 23 18
	clc		; 18
	clc		; 18
	tas		; 1B
	pea $1AC9.w		; F4 C9 1A
	plx		; FA
	adc $BEDDA6.l		; 6F A6 DD BE
	ora ($47.b)		; 12 47
	rol A		; 2A
	mvn $52,$A9		; 54 A9 52
	eor [$26.b]		; 47 26
	jmp $9C99.w		; 4C 99 9C
	sta ($CD.b),Y		; 91 CD
	ror $AB.b,X		; 76 AB
	phd		; 0B
	asl A		; 0A
	eor [$2B.b]		; 47 2B
	jmp $92725F.l		; 5C 5F 72 92
	and $B896.w,Y		; 39 96 B8
	clv		; B8
	wai		; CB
	pha		; 48
	sbc [$11.b]		; E7 11
	cpy $7A.b		; C4 7A
	asl A		; 0A
	phy		; 5A
	eor #$1E.b		; 49 1E
	lda #$B0.b		; A9 B0
	sta ($CC.b),Y		; 91 CC
	lda $C6.b		; A5 C6
	sbc ($CA.b),Y		; F1 CA
	pha		; 48
	inc $4B.b		; E6 4B
	and $92.b		; 25 92
	sbc ($24.b,X)		; E1 24
	adc ($45.b,S),Y		; 73 45
	ldx #$7CD1.w		; A2 D1 7C
	sty $8E.b		; 84 8E
	adc $76ED5A.l		; 6F 5A ED 76
	lda ($A5.b)		; B2 A5
	eor #$18.b		; 49 18
	sbc $38.b,S		; E3 38
	dec $8C33.w		; CE 33 8C
	sta ($C9.b),Y		; 91 C9
	lda ($E6.b),Y		; B1 E6
	cmp [$9B.b]		; C7 9B
	inc A		; 1A
	jmp ($B169.w)		; 6C 69 B1
	ldx #$BB5F.w		; A2 5F BB
	sta $4E.b,X		; 95 4E
	sta $743A.w,X		; 9D 3A 74
	nop		; EA
	asl A		; 0A
	trb $5EB9.w		; 1C B9 5E
	sty $86AE.w		; 8C AE 86
	sta $32.b		; 85 32
	sbc ($2F.b),Y		; F1 2F
	jmp.w [$A1CA]		; DC CA A1
	php		; 08
	tad		; 5B
	tad		; 5B
	eor $AAAA39.l,X		; 5F 39 AA AA
	inx		; E8
	lsr A		; 4A
	inc $F2.b,X		; F6 F2
	lda $4B.b,X		; B5 4B
	cpy $BE.b		; C4 BE
	dec $55.b,X		; D6 55
	php		; 08
	phy		; 5A
	phy		; 5A
	phy		; 5A
	lsr $69.b,X		; 56 69
	lda $06BF2C.l,X		; BF 2C BF 06
	eor [$04.b],Y		; 57 04
	ldy $F64B.w,X		; BC 4B F6
	and ($AB.b)		; 32 AB
	pld		; 2B
	plp		; 28
	eor $6159.w,Y		; 59 59 61
	and $01B0.w,X		; 3D B0 01
	ora ($FE.b)		; 12 FE
	sty $AA.b,X		; 94 AA
	bpl -124.b		; 10 84
	jsr $8631.w		; 20 31 86
	trb $84.b		; 14 84
	cli		; 58
	txa		; 8A
	trb $E577.w		; 1C 77 E5
	adc [$33.b]		; 67 33
	sta $1AC9.w,Y		; 99 C9 1A
	sbc $6DEF.w,Y		; F9 EF 6D
	plx		; FA
	sta $EA17.w,X		; 9D 17 EA
	pha		; 48
	cmp [$72.b],Y		; D7 72
	cmp $8B967E.l		; CF 7E 96 8B
	jsr ($2D52.w,X)		; FC 52 2D
	pha		; 48
	xce		; FB
	jmp ($E9F7.w)		; 6C F7 E9
	pla		; 68
	lda $D822C5.l,X		; BF C5 22 D8
	eor [$31.b]		; 47 31
	cmp #$73.b		; C9 73
	txs		; 9A
	inc $4612.w		; EE 12 46
	lda $98313B.l,X		; BF 3B 31 98
	cpy $897A.w		; CC 7A 89
	inc A		; 1A
	dex		; CA
	bvc -95.b		; 50 A1
	eor $39.b,S		; 43 39
	jsl $960DD3.l		; 22 D3 0D 96
	eor ($EB.b,S),Y		; 53 EB
	rol $6C.b		; 26 6C
	bit $6B.b		; 24 6B
	sbc $8BCE.w,X		; FD CE 8B
	ldx #$5CF0.w		; A2 F0 5C
	pei ($8D.b)		; D4 8D
	adc [$4E.b],Y		; 77 4E
	sta $DE.b,S		; 83 DE
	tax		; AA
	adc [$49.b],Y		; 77 49
	asl $A9.b,X		; 16 A9
	eor ($9A.b,S),Y		; 53 9A
	cmp $B366.w		; CD 66 B3
	jmp $7E8DD4.l		; 5C D4 8D 7E
	adc [$5D.b],Y		; 77 5D
	inc $C70C.w,X		; FE 0C C7
	sed		; F8
	bit $6B.b		; 24 6B
	ror $E2.b,X		; 76 E2
	clv		; B8
	ldx $D02B.w		; AE 2B D0
	pha		; 48
	lda [$B4.b],Y		; B7 B4
	cpy #$C6FE.w		; C0 FE C6
	txy		; 9B
	cmp $DE6E.w		; CD 6E DE
	ror A		; 6A
	eor $3E.b		; 45 3E
	cpx $DD93.w		; EC 93 DD
	dex		; CA
	cpy $BF.b		; C4 BF
	sbc ($4A.b,S),Y		; F3 4A
	sbc $7165.w		; ED 65 71
	cld		; D8
	cpx $0175.w		; EC 75 01
	dec A		; 3A
	stz $F6.b,X		; 74 F6
	sbc $32F7.w		; ED F7 32
	ldx $AD.b,Y		; B6 AD
	jmp ($5859.w,X)		; 7C 59 58
	sta [$D0.b],Y		; 97 D0
	bne -30.b		; D0 E2
	lsr A		; 4A
	cmp ($E6.b)		; D2 E6
	tax		; AA
	ply		; 7A
	lda ($08.b,X)		; A1 08
	eor [$67.b]		; 47 67
	bit $ED.b		; 24 ED
	adc $62.b		; 65 62
	eor $F795C8.l,X		; 5F C8 95 F7
	and ($BD.b)		; 32 BD
	eor [$51.b]		; 47 51
	pei ($69.b)		; D4 69
	sty $21.b		; 84 21
	ora $BF8C.w,X		; 1D 8C BF
	adc ($2B.b,X)		; 61 2B
	cld		; D8
	dex		; CA
	cpy $BF.b		; C4 BF
	dec A		; 3A
	eor [$B6.b],Y		; 57 B6
	sta $F6.b,X		; 95 F6
	dec $B7DA.w,X		; DE DA B7
	ldx $10.b,Y		; B6 10
	sty $44.b		; 84 44
	ply		; 7A
	eor ($BD.b)		; 52 BD
	jmp.w [$F3AC]		; DC AC F3
	cpy $BF.b		; C4 BF
	bit #$2B.b		; 89 2B
	inc $65.b,X		; F6 65
	jmp $0965.w		; 4C 65 09
	.db $82, $10, $80		; 82 10 80
	ora $A4.b,S		; 03 A4
	lda $475A.w		; AD 5A 47
	lda #$1F.b		; A9 1F
	adc #$21.b		; 69 21
	ora [$39.b],Y		; 17 39
	and ($16.b,X)		; 21 16
	cmp $DA23.w,X		; DD 23 DA
	tax		; AA
	sta $24.b,X		; 95 24
	jsr $FF99.w		; 20 99 FF
	tsb $8A.b		; 04 8A
	eor ($A4.b)		; 52 A4
	asl $52.b		; 06 52
	lda [$86.b],Y		; B7 86
	sta ($EC.b),Y		; 91 EC
	bit $622E.w		; 2C 2E 62
	.db $42, $2F		; 42 2F
	stz $8B90.w,X		; 9E 90 8B
	tsx		; BA
	pha		; 48
	sbc [$2D.b],Y		; F7 2D
	stx $48C7.w		; 8E C7 48
	sbc [$BC.b],Y		; F7 BC
	tda		; 7B
	and $8A14.w		; 2D 14 8A
	stz $A4.b,X		; 74 A4
	lsr A		; 4A
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	sbc $2412.w,Y		; F9 12 24
	sta ($4D.b),Y		; 91 4D
	ldy $1297.w		; AC 97 12
	eor ($3A.b),Y		; 51 3A
	stz $E9.b,X		; 74 E9
	cmp ($81.b,S),Y		; D3 81
	sbc [$E5.b],Y		; F7 E5
	sei		; 78
	sta ($FF.b)		; 92 FF
	ror $2456.w,X		; 7E 56 24
	ldx #$8410.w		; A2 10 84
	jsr $0C0E.w		; 20 0E 0C
	lda $5EAB.w		; AD AB 5E
	inc $57.b		; E6 57
	iny		; C8
	sta $89.b,X		; 95 89
	plp		; 28
	sty $21.b		; 84 21
	php		; 08
	ora $85.b,S		; 03 85
	pld		; 2B
	cmp $D2F6CA.l,X		; DF CA F6 D2
	ldy $58E9.w,X		; BC E9 58
	sta ($88.b)		; 92 88
	.db $42, $10		; 42 10
	bra  63.b		; 80 3F
	sbc [$2F.b]		; E7 2F
	inc $65.b,X		; F6 65
	jmp ($5849.w,X)		; 7C 49 58
	sta ($88.b)		; 92 88
	.db $42, $10		; 42 10
	bra  49.b		; 80 31
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and ($71.b),Y		; 31 71
	and $CD9AB5.l		; 2F B5 9A CD
	ror $B3.b		; 66 B3
	eor $D6AC.w,Y		; 59 AC D6
	rtl		; 6B

	ply		; 7A
	cpy $7BF6.w		; CC F6 7B
	and $9923.w,X		; 3D 23 99
	sta $F34325.l		; 8F 25 43 F3
	ldy $7A.b		; A4 7A
	adc $0C.b		; 65 0C
	ldy $8E.b		; A4 8E
	ror A		; 6A
	tax		; AA
	mvn $01,$D5		; 54 D5 01
	bcs -111.b		; B0 91
	eor $C78E55.l		; 4F 55 8E C7
	eor ($02.b)		; 52 02
	ldy $8A.b,X		; B4 8A
	sei		; 78
	and $BCE005.l		; 2F 05 E0 BC
	bmi  29.b		; 30 1D
	sta ($45.b)		; 92 45
	dec A		; 3A
	ora $76CFD0.l		; 0F D0 CF 76
	txa		; 8A
	cli		; 58
	dex		; CA
	phy		; 5A
	and #$14.b		; 29 14
	cpx $B9.b		; E4 B9
	cmp $5876.w		; CD 76 58
	ora $8A24.w		; 0D 24 8A
	stz $5D.b,X		; 74 5D
	ora [$45.b],Y		; 17 45
	sbc ($C0.b,S),Y		; F3 C0
	stz $D2.b,X		; 74 D2
	and #$D0.b		; 29 D0
	ror $7B86.w,X		; 7E 86 7B
	pea $C480.w		; F4 80 C4
	pha		; 48
	ldx $AB.b		; A6 AB
	ldx $54D7.w		; AE D7 54
	cop $B4.b		; 02 B4
	txa		; 8A
	adc ($54.b,S),Y		; 73 54
	lda #$6E.b		; A9 6E
	brk $78.b		; 00 78
	sbc #$14.b		; E9 14
	cmp ($72.b),Y		; D1 72
	jmp $152497.l		; 5C 97 24 15
	and $A520A4.l		; 2F A4 20 A5
	sbc ($0D.b),Y		; F1 0D
	stx $CB.b,Y		; 96 CB
	adc $B2.b		; 65 B2
	sta ($C8.b),Y		; 91 C8
	.db $42, $10		; 42 10
	sta ($CB.b),Y		; 91 CB
	phd		; 0B
	phd		; 0B
	phd		; 0B
	brk $15.b		; 00 15
	tsb $0A2C.w		; 0C 2C 0A
	phx		; DA
	lda #$18.b		; A9 18
	sbc ($99.b),Y		; F1 99
	ora $2907.w		; 0D 07 29
	tad		; 5B
	and #$23.b		; 29 23
	ora ($31.b,S),Y		; 13 31
	ora $2A.b,X		; 15 2A
	adc $8C245C.l		; 6F 5C 24 8C
	ply		; 7A
	rol $7A3B.w		; 2E 3B 7A
	plx		; FA
	sty $292C.w		; 8C 2C 29
	clc		; 18
	ldy $BCBC.w,X		; BC BC BC
	cmp $342F.w,X		; DD 2F 34
	sta ($31.b)		; 92 31
	sta ($5A.b,X)		; 81 5A
	lda $F5.b		; A5 F5
	sbc [$4D.b],Y		; F7 4D
	and $17.b,S		; 23 17
	ora [$1E.b],Y		; 17 1E
	sbc $DE8E.w		; ED 8E DE
	rol $6324.w		; 2E 24 63
	ldy $B7AD.w		; AC AD B7
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lsr $2B.b		; 46 2B
	mvn $7D,$A9		; 54 A9 7D
	adc $237D.w,X		; 7D 7D 23
	inc A		; 1A
	and $D1A25D.l		; 2F 5D A2 D1
	pla		; 68
	lda $15.b,X		; B5 15
	bit $5A.b		; 24 5A
	lda $C5.b		; A5 C5
	lsr A		; 4A
	sta $2F.b,X		; 95 2F
	lda #$48.b		; A9 48
	dec $AB.b		; C6 AB
	phd		; 0B
	ora $60.b,S		; 03 60
	mvn $48,$D8		; 54 D8 48
	lda [$78.b],Y		; B7 78
	lda $4953.w		; AD 53 49
	lda $499A6E.l,X		; BF 6E 9A 49
	asl $EC.b,X		; 16 EC
	sta ($31.b,S),Y		; 93 31
	ora $2A.b,X		; 15 2A
	adc $8A245C.l		; 6F 5C 24 8A
	eor ($FD.b)		; 52 FD
	asl $904B.w		; 0E 4B 90
	cmp $D85426.l,X		; DF 26 54 D8
	pha		; 48
	lda [$78.b],Y		; B7 78
	lda $75.b		; A5 75
	sta ($BF.b,X)		; 81 BF
	ror $499A.w		; 6E 9A 49
	asl $E9.b,X		; 16 E9
	bcs  43.b		; B0 2B
	mvn $BE,$BE		; 54 BE BE
	sbc #$A4.b		; E9 A4
	tad		; 5B
	ora ($71.b),Y		; 11 71
	adc ($EE.b),Y		; 71 EE
	cld		; D8
	sbc $E2E2.w		; ED E2 E2
	eor $AB.b		; 45 AB
	adc $95.b,X		; 75 95
	ldx $EA.b,Y		; B6 EA
	cmp $AB.b,X		; D5 AB
	pha		; 48
	lda [$8E.b],Y		; B7 8E
	lda $A552.w		; AD 52 A5
	sbc $F5.b,X		; F5 F5
	pea $548A.w		; F4 8A 54
	ldx $79A5.w,Y		; BE A5 79
	xba		; EB
	lda $D2342F.l		; AF 2F 34 D2
	and #$7D.b		; 29 7D
	eor ($B6.b)		; 52 B6
	cmp $B55A.w,X		; DD 5A B5
	ror A		; 6A
	sta ($39.b)		; 92 39
	dey		; 88
	clv		; B8
	cmp #$7B.b		; C9 7B
	ldy $84.b,X		; B4 84
	ora $02C3.w,X		; 1D C3 02
	eor [$37.b]		; 47 37
	sbc #$9F.b		; E9 9F
	eor #$BA.b		; 49 BA
	pha		; 48
	eor ($F0.b,X)		; 41 F0
	eor $1C09.w,Y		; 59 09 1C
	rep #$C0		; C2 C0
	cmp $1CE937.l,X		; DF 37 E9 1C
	tya		; 98
	adc $89FDE9.l,X		; 7F E9 FD 89
	php		; 08
	and $48C59D.l,X		; 3F 9D C5 48
	lda $49.b		; A5 49
	php		; 08
	lda ($59.b)		; B2 59
	and $7B24F3.l		; 2F F3 24 7B
	eor $D6A6.w,Y		; 59 A6 D6
	pha		; 48
	sbc [$C7.b],Y		; F7 C7
	ror $B49B.w		; 6E 9B B4
	sta $1E3264.l		; 8F 64 32 1E
	plp		; 28
	cmp $4B1A.w,Y		; D9 1A 4B
	cmp #$14.b		; C9 14
	cmp $FAEDB7.l,X		; DF B7 ED FA
	rts		; 60

	adc $AE.b		; 65 AE
	bit $53.b		; 24 53
	bcc -28.b		; 90 E4
	and $1E29.w,Y		; 39 29 1E
.ACCU 8
.INDEX 8
	sep #$B8		; E2 B8
	lda $0CD8.w		; AD D8 0C
	tsb $0809.w		; 0C 09 08
	rol $15.b,X		; 36 15
	bit $20.b		; 24 20
	lda $24E3.w		; AD E3 24
	jsr $95EC.w		; 20 EC 95
	bit $20.b		; 24 20
	sbc $C96B.w,X		; FD 6B C9
	trb $BC.b		; 14 BC
	cmp ($5E.b)		; D2 5E
	lsr $2469.w,X		; 5E 69 24
	ror A		; 6A
.ACCU 8
	sep #$E2		; E2 E2
.ACCU 8
	sep #$E3		; E2 E3
	and $5E23.w		; 2D 23 5E
	eor ($8C.b,S),Y		; 53 8C
	sbc $38.b,S		; E3 38
	dec $4632.w		; CE 32 46
	ldy $63C6.w,X		; BC C6 63
	and ($98.b),Y		; 31 98
	sbc ($54.b,S),Y		; F3 54
	plp		; 28
	pha		; 48
	ldx $52.b,Y		; B6 52
	sta $0A.b		; 85 0A
	ora $1CC9.w,Y		; 19 C9 1C
	rep #$C0		; C2 C0
	lda $91AA.w		; AD AA 91
	ldy $8386.w		; AC 86 83
	sty $AD.b,X		; 94 AD
	sty $91.b,X		; 94 91
	plb		; AB
	xba		; EB
	nop		; EA
	mvn $48,$A9		; 54 A9 48
	cmp [$05.b],Y		; D7 05
	adc $7979.w,Y		; 79 79 79
	ldx #$90.b		; A2 90
	txy		; 9B
	phd		; 0B
	asl A		; 0A
	eor [$B1.b]		; 47 B1
	eor [$D7.b],Y		; 57 D7
	cmp ($3D.b)		; D2 3D
	dec $5F.b,X		; D6 5F
	eor ($91.b)		; 52 91
	cpx $0F0C.w		; EC 0C 0F
	and ($23.b),Y		; 31 23
	stp		; DB
	asl A		; 0A
	stp		; DB
	ora #$1E.b		; 09 1E
	dec $1C.b		; C6 1C
	tsb $8A.b		; 04 8A
	adc ($61.b,X)		; 61 61
	adc ($48.b,X)		; 61 48
	sbc [$EE.b],Y		; F7 EE
	eor $A4625F.l,X		; 5F 5F 62 A4
	adc ($70.b,S),Y		; 73 70
	ldy $D2BC.w,X		; BC BC D2
	pha		; 48
	sbc $C5.b		; E5 C5
	cmp $C6.b		; C5 C6
	phy		; 5A
	eor [$33.b]		; 47 33
	ora $C78C.w,Y		; 19 8C C7
	txs		; 9A
	lda ($42.b,X)		; A1 42
	lsr $A6.b		; 46 A6
	lsr $F6.b,X		; 56 F6
	eor ($39.b)		; 52 39
	iny		; C8
	adc ($54.b)		; 72 54
	rol $47B2.w,X		; 3E B2 47
	ldx $50.b		; A6 50
	sta $DC23.w,Y		; 99 23 DC
	dec $73.b,X		; D6 73
	and $67C7.w,Y		; 39 C7 67
	and ($9C.b,S),Y		; 33 9C
	pei ($8B.b)		; D4 8B
	rts		; 60

	tda		; 7B
	jmp $840F.w		; 4C 0F 84
	cpy #$C0.b		; C0 C0
	cpy #$91.b		; C0 91
	adc $E525.w		; 6D 25 E5
	sbc $E5.b		; E5 E5
	sbc $E6.b		; E5 E6
	sta ($45.b)		; 92 45
	lda ($D7.b)		; B2 D7
	ora [$17.b],Y		; 17 17
	ora [$17.b],Y		; 17 17
	ora $1669.w,Y		; 19 69 16
	cpy #$C0.b		; C0 C0
	sbc ($19.b,S),Y		; F3 19
	sty $63C6.w		; 8C C6 63
	cmp $B548.w		; CD 48 B5
	ror $B5B2.w		; 6E B2 B5
	ror A		; 6A
	cmp $AB.b,X		; D5 AB
	pha		; 48
	ldx $92.b,Y		; B6 92
	sbc ($F3.b)		; F2 F3
	eor #$79.b		; 49 79
	adc $A4E1.w,Y		; 79 E1 A4
	rtl		; 6B

	eor $D67D.w,Y		; 59 7D D6
	rts		; 60

	adc #$24.b		; 69 24
	jsl $1152F1.l		; 22 F1 52 11
	adc $D323F9.l,X		; 7F F9 23 D3
	rol $77.b		; 26 77
	ora #$08.b		; 09 08
	ldx $425A.w,Y		; BE 5A 42
	and $52A4F3.l		; 2F F3 A4 52
	sta $00.b		; 85 00
	and $F953B5.l,X		; 3F B5 53 F9
	eor ($3D.b)		; 52 3D
	tad		; 5B
	ldy $A4EA.w		; AC EA A4
	jsl $F648D6.l		; 22 D6 48 F6
.ACCU 16
	rep #$A7		; C2 A7
	lda ($90.b)		; B2 90
	sta $80.b,S		; 83 80
	lda ($23.b,X)		; A1 23
	stp		; DB
	sbc $C4.b		; E5 C4
	cmp #$E51E.w		; C9 1E E5
	and ($97.b)		; 32 97
	ora ($11.b)		; 12 11
	ror $84A4.w,X		; 7E A4 84
	lsr $451A.w,X		; 5E 1A 45
	and $ED392F.l		; 2F 2F 39 ED
	and $69.b		; 25 69
	inc A		; 1A
	dec $563C.w,X		; DE 3C 56
	eor $CC.b,S		; 43 CC
	pha		; 48
	sbc [$CB.b]		; E7 CB
	adc $B1.b,S		; 63 B1
	cld		; D8
	sbc #$DD1C.w		; E9 1C DD
	ldx $7873.w,Y		; BE 73 78
	jsr ($1C69.w,X)		; FC 69 1C
	dec $4C.b		; C6 4C
	sta $4732.w,Y		; 99 32 47
	and ($1F.b,S),Y		; 33 1F
	sta ($98.b),Y		; 91 98
	sbc $24.b,S		; E3 24
	adc ($86.b)		; 72 86
	bmi -54.b		; 30 CA
	pha		; 48
	sbc $4B.b		; E5 4B
	nop		; EA
	lsr $473A.w,X		; 5E 3A 47
	bit $1C.b,X		; 34 1C
	lda $6C.b		; A5 6C
	ldy $8E.b		; A4 8E
	eor $1A9875.l,X		; 5F 75 98 1A
	eor #$EA1C.w		; 49 1C EA
	dec A		; 3A
	sta $615365.l		; 8F 65 53 61
	and $5C.b,S		; 23 5C
	asl $FD.b		; 06 FD
	sty $FA.b,X		; 94 FA
	bit #$D21C.w		; 89 1C D2
	rts		; 60

	lsr $6978.w,X		; 5E 78 69
	trb $69D3.w		; 1C D3 69
	ldy $DA.b,X		; B4 DA
	adc #$E21C.w		; 69 1C E2
	clv		; B8
	ldx $EF2B.w		; AE 2B EF
	and $63A4AF.l		; 2F AF A4 63
	sei		; 78
	dec $8D37.w,X		; DE 37 8D
	sep #$47		; E2 47
	lda ($14.b),Y		; B1 14
	and $7316.w,X		; 3D 16 73
	and $F49C.w,Y		; 39 9C F4
	eor ($35.b)		; 52 35
	cmp $5B6E.w		; CD 6E 5B
	stx $E5.b,Y		; 96 E5
	cmp $D748.w		; CD 48 D7
	nop		; EA
	pla		; 68
	lda $7ADB63.l,X		; BF 63 DB 7A
	adc #$EE1A.w		; 69 1A EE
	sta $E807.w,X		; 9D 07 E8
	adc [$BB.b]		; 67 BB
	ldy $8D.b		; A4 8D
	adc ($99.b,S),Y		; 73 99
	sta $0E39FA.l		; 8F FA 39 0E
	adc ($45.b)		; 72 45
	tay		; A8
	bvc -37.b		; 50 DB
	tay		; A8
	bvc -95.b		; 50 A1
	lda [$48.b],Y		; B7 48
	ldx $C2.b,Y		; B6 C2
	lda ($85.b,X)		; A1 85
	sta ($5B.b,X)		; 81 5B
	eor $22.b,X		; 55 22
	phx		; DA
	eor $74D3.w		; 4D D3 74
	ldy $BCBC.w,X		; BC BC BC
	beq -46.b		; F0 D2
	and $32.b,X		; 35 32
	sta $0A.b		; 85 0A
	trb $24.b		; 14 24
	eor ($95.b)		; 52 95
	jsr $5B3F.w		; 20 3F 5B
	ldx $E9FD.w		; AE FD E9
	trb $C2.b		; 14 C2
	rep #$0C		; C2 0C
	bit $0D2C.w		; 2C 2C 0D
	plx		; FA
	eor [$BC.b]		; 47 BC
	sta [$1D.b],Y		; 97 1D
	cmp [$48.b]		; C7 48
	sbc [$EE.b],Y		; F7 EE
	adc $5D.b,X		; 75 5D
	mvn $4C,$8F		; 54 8F 4C
	lda ($9C.b,X)		; A1 9C
	sta ($ED.b),Y		; 91 ED
	eor ($85.b),Y		; 51 85
	and $DB.b,S		; 23 DB
	cpx $CC.b		; E4 CC
	and #$C61E.w		; 29 1E C6
	jmp $6E91.w		; 4C 91 6E
	tyx		; BB
	ldx $BFEB.w		; AE EB BF
	ply		; 7A
	eor [$33.b]		; 47 33
	sta $D5CC.w,Y		; 99 CC D5
	cpy $8E.b		; C4 8E
	adc $3B2E.w,Y		; 79 2E 3B
	stx $52F2.w		; 8E F2 52
	and $D569.w,Y		; 39 69 D5
	adc $5D.b,X		; 75 5D
	mvn $4C,$8E		; 54 8E 4C
	asl A		; 0A
	cmp ($39.b)		; D2 39
	sta $81.b		; 85 81
	sta ($81.b,X)		; 81 81
	and $9B.b,S		; 23 9B
	jsl $91B2B7.l		; 22 B7 B2 91
	cmp #$2894.w		; C9 94 28
	jmp $8B90.w		; 4C 90 8B
	phx		; DA
	adc ($6C.b,X)		; 61 6C
	and $DE.b,X		; 35 DE
	sbc $D422.w,X		; FD 22 D4
	lda #$8D79.w		; A9 79 8D
	ora [$FF.b]		; 07 FF
	phx		; DA
	ora $5E2365.l		; 0F 65 23 5E
	lda ($E5.b,S),Y		; B3 E5
	lda ($DA.b),Y		; B1 DA
	rol A		; 2A
	eor ($2D.b)		; 52 2D
	dec $56.b,X		; D6 56
	stp		; DB
	ldy $1F.b,X		; B4 1F
	ora ($A0.b,X)		; 01 A0
	sed		; F8
	ora #$AD16.w		; 09 16 AD
	tad		; 5B
	ldx $BAEB.w		; AE EB BA
	eor $A246.w		; 4D 46 A2
	lsr $B9.b		; 46 B9
	cpy $21C7.w		; CC C7 21
	tya		; 98
	sbc [$24.b]		; E7 24
	rtl		; 6B

	dec $71.b		; C6 71
	eor $E137.w,X		; 5D 37 E1
	sei		; 78
	cmp #$C616.w		; C9 16 C6
	bvc -50.b		; 50 CE
	bvc -95.b		; 50 A1
	eor $39.b,S		; 43 39
	jsl $950ADB.l		; 22 DB 0A 95
	rol A		; 2A
	mvn $B0,$A9		; 54 A9 B0
	sta ($6D.b),Y		; 91 6D
	stx $53.b,Y		; 96 53
	and #$93F5.w		; 29 F5 93
	rol $7B.b		; 26 7B
	and #$CA16.w		; 29 16 CA
	ror $7336.w,X		; 7E 36 73
	ror $65CE.w		; 6E CE 65
	pld		; 2B
	pha		; 48
	dec $C3.b,X		; D6 C3
	eor $D7AE.w,X		; 5D AE D7
	jmp ($5324.w)		; 6C 24 53
	adc ($77.b),Y		; 71 77
	adc ($77.b),Y		; 71 77
	adc ($77.b),Y		; 71 77
	ldy $77E5.w,X		; BC E5 77
	stz $EFAE.w		; 9C AE EF
	cmp ($F0.b)		; D2 F0
	tsx		; BA
	lsr $4A17.w,X		; 5E 17 4A
	sbc $6817.w		; ED 17 68
	tyx		; BB
	eor [$2A.b]		; 47 2A
	stx $1E55.w		; 8E 55 1E
	sta $1D.b,X		; 95 1D
	rol $4B1F.w		; 2E 1F 4B
	stx $00.b		; 86 00
	eor $4B34.w		; 4D 34 4B
	bra  19.b		; 80 13
	and ($00.b,X)		; 21 00
	brk $89.b		; 00 89
	stz $9F.b,X		; 74 9F
	php		; 08
	adc ($7B.b,X)		; 61 7B
	rti		; 40

	php		; 08
	sta [$49.b],Y		; 97 49
	beq -121.b		; F0 87
	rol $2EEF.w		; 2E EF 2E
	sbc $8FEF2E.l		; EF 2E EF 8F
	and $7B25EE.l		; 2F EE 25 7B
	and #$B87B.w		; 29 7B B8
	rol $BBE0.w		; 2E E0 BB
	sta $C7.b,S		; 83 C7
	cmp $F6F1.w,Y		; D9 F1 F6
	adc $CFC6.w,X		; 7D C6 CF
	adc $B1.b		; 65 B1
	cmp $6F6C.w,Y		; D9 6C 6F
	ldx $31.b,Y		; B6 31
	bcc -124.b		; 90 84
	and ($08.b,X)		; 21 08
	jmp ($777D.w)		; 6C 7D 77
	ldy $93.b		; A4 93
	sep #$08		; E2 08
	.db $42, $10		; 42 10
	sty $20.b		; 84 20
	sty $9F.b		; 84 9F
	phb		; 8B
	phb		; 8B
	lda ($84.b)		; B2 84
	and ($08.b,X)		; 21 08
	eor $17.b,S		; 43 17
	ldy $F7.b		; A4 F7
	brk $01.b		; 00 01
	and #$4200.w		; 29 00 42
	xce		; FB
	brk $07.b		; 00 07
	asl $6F.b		; 06 6F
	brk $07.b		; 00 07
	asl $68.b		; 06 68
	ora $69.b,X		; 15 69
	brk $1C.b		; 00 1C
	ror A		; 6A
	adc #$6B69.w		; 69 69 6B
	ror A		; 6A
	ror A		; 6A
	jmp ($6B6B.w)		; 6C 6B 6B
	adc $6C6C.w		; 6D 6C 6C
	ror $6D6D.w		; 6E 6D 6D
	adc $706E6E.l		; 6F 6E 6E 70
	trb $715B.w		; 1C 5B 71
	rtl		; 6B

	ror A		; 6A
	adc ($70.b)		; 72 70
	bvs 115.b		; 70 73
	trb $746C.w		; 1C 6C 74
	adc $73756F.l		; 6F 6F 75 73
	adc ($76.b),Y		; 71 76
	trb $7721.w		; 1C 21 77
	adc ($72.b)		; 72 72
	sei		; 78
	trb $794F.w		; 1C 4F 79
	ror $76.b,X		; 76 76
	ply		; 7A
	trb $7B2F.w		; 1C 2F 7B
	sei		; 78
	sei		; 78
	jmp ($471C.w,X)		; 7C 1C 47
	adc $521C.w,X		; 7D 1C 52
	jsr $0069.w		; 20 69 00
	php		; 08
	ora $74.b,S		; 03 74
	stz $74.b,X		; 74 74
	jmp ($696A.w)		; 6C 6A 69
	ora ($1C.b,X)		; 01 1C
	cop $1C.b		; 02 1C
	ora $1C.b,S		; 03 1C
	tsb $1C.b		; 04 1C
	ora $1C.b		; 05 1C
	ora $1C.b		; 05 1C
	tsb $5C.b		; 04 5C
	ora $5C.b,S		; 03 5C
	cop $5C.b		; 02 5C
	ora ($5C.b,X)		; 01 5C
	adc $696A.w		; 6D 6A 69
	asl $1C.b		; 06 1C
	ora [$1C.b]		; 07 1C
	php		; 08
	trb $1C09.w		; 1C 09 1C
	asl A		; 0A
	trb $1C0B.w		; 1C 0B 1C
	tsb $0D1C.w		; 0C 1C 0D
	trb $5C0D.w		; 1C 0D 5C
	tsb $0B5C.w		; 0C 5C 0B
	trb $1C0E.w		; 1C 0E 1C
	ora $5C081C.l		; 0F 1C 08 5C
	ora [$5C.b]		; 07 5C
	asl $5C.b		; 06 5C
	jmp ($6971.w)		; 6C 71 69
	bpl  28.b		; 10 1C
	ora ($1C.b),Y		; 11 1C
	ora ($1C.b)		; 12 1C
	ora ($1C.b,S),Y		; 13 1C
	trb $1C.b		; 14 1C
	ora $1C.b,X		; 15 1C
	asl $1C.b,X		; 16 1C
	ora [$1C.b],Y		; 17 1C
	clc		; 18
	trb $5C18.w		; 1C 18 5C
	ora [$5C.b],Y		; 17 5C
	asl $1C.b,X		; 16 1C
	ora $5C.b,X		; 15 5C
	ora $131C.w,Y		; 19 1C 13
	jmp $115C12.l		; 5C 12 5C 11
	jmp $1B751A.l		; 5C 1A 75 1B
	trb $1C1C.w		; 1C 1C 1C
	ora $1E1C.w,X		; 1D 1C 1E
	trb $1C1F.w		; 1C 1F 1C
	jsr $7979.w		; 20 79 79
	adc $221C.w,Y		; 79 1C 22
	trb $1C23.w		; 1C 23 1C
	bit $1C.b		; 24 1C
	and $1C.b		; 25 1C
	rol $1C.b		; 26 1C
	and [$75.b]		; 27 75
	plp		; 28
	trb $1C29.w		; 1C 29 1C
	rol A		; 2A
	trb $1C2B.w		; 1C 2B 1C
	bit $2D1C.w		; 2C 1C 2D
	trb $7A2E.w		; 1C 2E 7A
	ply		; 7A
	ply		; 7A
	ply		; 7A
	trb $5C2E.w		; 1C 2E 5C
	and $2C5C.w		; 2D 5C 2C
	jmp $311C30.l		; 5C 30 1C 31
	trb $1C32.w		; 1C 32 1C
	and ($75.b,S),Y		; 33 75
	bit $1C.b,X		; 34 1C
	and $1C.b,X		; 35 1C
	rol $1C.b,X		; 36 1C
	and [$1C.b],Y		; 37 1C
	sec		; 38
	trb $1C39.w		; 1C 39 1C
	dec A		; 3A
	trb $1C3B.w		; 1C 3B 1C
	bit $3C1C.w,X		; 3C 1C 3C
	trb $1C3D.w		; 1C 3D 1C
	dec A		; 3A
	jmp $385C39.l		; 5C 39 5C 38
	jmp $361C3E.l		; 5C 3E 1C 36
	trb $5C35.w		; 1C 35 5C
	and $1C4075.l,X		; 3F 75 40 1C
	eor ($1C.b,X)		; 41 1C
	.db $42, $1C		; 42 1C
	eor $1C.b,S		; 43 1C
	mvp $45,$1C		; 44 1C 45
	trb $7C46.w		; 1C 46 7C
	jmp ($7C7C.w,X)		; 7C 7C 7C
	trb $1C48.w		; 1C 48 1C
	eor #$441C.w		; 49 1C 44
	jmp $4B1C4A.l		; 5C 4A 1C 4B
	trb $5C41.w		; 1C 41 5C
	jmp $4D75.w		; 4C 75 4D
	trb $7B4E.w		; 1C 4E 7B
	sei		; 78
	trb $1C50.w		; 1C 50 1C
	eor ($7D.b),Y		; 51 7D
	adc $7D7D.w,X		; 7D 7D 7D
	trb $1C53.w		; 1C 53 1C
	mvn $78,$7B		; 54 7B 78
	trb $1C55.w		; 1C 55 1C
	lsr $75.b,X		; 56 75
	eor [$1C.b],Y		; 57 1C
	cli		; 58
	trb $1C59.w		; 1C 59 1C
	phy		; 5A
	adc [$77.b],Y		; 77 77
	adc ($1C.b)		; 72 1C
	jmp $1C5D1C.l		; 5C 1C 5D 1C
	lsr $5F1C.w,X		; 5E 1C 5F
	adc $60.b,X		; 75 60
	trb $1C61.w		; 1C 61 1C
	.db $62, $1C, $63		; 62 1C 63
	adc ($6A.b,S),Y		; 73 6A
	stz $1C.b		; 64 1C
	adc $1C.b		; 65 1C
	ror $1C.b		; 66 1C
	adc [$1C.b]		; 67 1C
	stz $6F.b,X		; 74 6F
	adc ($00.b),Y		; 71 00
	pla		; 68
	trb $2600.w		; 1C 00 26
	xce		; FB
	brk $0D.b		; 00 0D
	brk $04.b		; 00 04
	brk $68.b		; 00 68
	bit $B4.b		; 24 B4
	cmp ($66.b)		; D2 66
	ora ($24.b),Y		; 11 24
	and ($18.b)		; 32 18
	sty $10A0.w		; 8C A0 10
	jsr $0241.w		; 20 41 02
	asl A		; 0A
	lsr $083B.w,X		; 5E 3B 08
	ror $45.b		; 66 45
	lda $FB.b,S		; A3 FB
	sta [$16.b],Y		; 97 16
	ldx #$84.b		; A2 84
	sta ($0A.b,X)		; 81 0A
	stz $9A.b,X		; 74 9A
	jsr ($E9A2.w,X)		; FC A2 E9
	sty $B8.b		; 84 B8
	sta ($0E.b,X)		; 81 0E
	and #$281B.w		; 29 1B 28
	ldy $CBB6.w		; AC B6 CB
	sbc $8CB0.w		; ED B0 8C
	dey		; 88
	tsx		; BA
	asl $85.b,X		; 16 85
	dey		; 88
	eor $BA24.w		; 4D 24 BA
	lda ($E2.b,X)		; A1 E2
	eor $5465.w,Y		; 59 65 54
	phk		; 4B
	ror $4F55.w		; 6E 55 4F
	sta [$CD.b],Y		; 97 CD
	plx		; FA
	and $B892.w		; 2D 92 B8
	ldx #$3C.b		; A2 3C
	sta ($54.b)		; 92 54
	mvp $39,$A1		; 44 A1 39
	adc ($23.b)		; 72 23
	pld		; 2B
	sep #$09		; E2 09
	eor $45D3.w		; 4D D3 45
	eor $92A5.w		; 4D A5 92
	lda $16.b		; A5 16
	rol A		; 2A
	cmp #$92B7.w		; C9 B7 92
	eor $2473.w,Y		; 59 73 24
	phb		; 8B
	.db $42, $13		; 42 13
	rol $A8.b		; 26 A8
	cmp ($4B.b)		; D2 4B
	asl A		; 0A
	eor $F2.b		; 45 F2
	sta ($4A.b,S),Y		; 93 4A
	eor ($F9.b)		; 52 F9
	jmp $92A2.w		; 4C A2 92
	ora $29A5.w		; 0D A5 29
	ror $A820.w,X		; 7E 20 A8
	lda $EA.b		; A5 EA
	lda $2D.b		; A5 2D
	tsx		; BA
	eor ($51.b)		; 52 51
	mvn $A8,$A5		; 54 A5 A8
	ora $A2.b		; 05 A2
	sta [$AA.b],Y		; 97 AA
	sty $B5.b,X		; 94 B5
	brk $4A.b		; 00 4A
	pha		; 48
	dex		; CA
	eor ($4A.b)		; 52 4A
	eor ($97.b)		; 52 97
	lsr A		; 4A
	eor $4B392B.l		; 4F 2B 39 4B
	adc $33.b		; 65 33
	txa		; 8A
	txa		; 8A
	eor $29.b,X		; 55 29
	bit $EAAC.w,X		; 3C AC EA
	ldy #$01.b		; A0 01
	and #$549C.w		; 29 9C 54
	brk $5A.b		; 00 5A
	txs		; 9A
	sbc $5DA8.w		; ED A8 5D
	rts		; 60

	ldx $5D47.w		; AE 47 5D
	plx		; FA
	and ($E4.b)		; 32 E4
	lda [$26.b],Y		; B7 26
	adc $328A.w,X		; 7D 8A 32
	ldy $D8.b		; A4 D8
	ora $3676.w,Y		; 19 76 36
	ldx $36.b,Y		; B6 36
	phb		; 8B
	clc		; 18
	cmp [$4B.b],Y		; D7 4B
	sbc [$53.b],Y		; F7 53
	beq 127.b		; F0 7F
	ora [$91.b]		; 07 91
	ora $5636.w		; 0D 36 56
	lsr $C4.b,X		; 56 C4
	jmp ($4A45.w)		; 6C 45 4A
	eor #$B834.w		; 49 34 B8
	ora $1E.b,S		; 03 1E
	and ($92.b)		; 32 92
	and ($34.b,S),Y		; 33 34
	lda ($31.b)		; B2 31
	and #$D22E.w		; 29 2E D2
	lda $9265.w,Y		; B9 65 92
	phk		; 4B
	lda [$67.b],Y		; B7 67
	sta $0961.w,X		; 9D 61 09
	sbc #$8E79.w		; E9 79 8E
	txa		; 8A
	nop		; EA
	ldx $D4A8.w		; AE A8 D4
	pei ($DF.b)		; D4 DF
	sta $F8.b		; 85 F8
	.db $62, $C3, $8F		; 62 C3 8F
	trb $71.b		; 14 71
	lda ($69.b),Y		; B1 69
	eor $32BA.w,X		; 5D BA 32
	inx		; E8
	lda ($7E.b,S),Y		; B3 7E
	eor $BAD1.w		; 4D D1 BA
	and $C39C.w		; 2D 9C C3
	cpx #$09.b		; E0 09
	lsr $B5F4.w		; 4E F4 B5
	bit $D6.b,X		; 34 D6
	inc $B7.b		; E6 B7
	and $E9.b,X		; 35 E9
	lda $CCA604.l		; AF 04 A6 CC
	lda $35.b,X		; B5 35
.ACCU 16
	rep #$E1		; C2 E1
	tya		; 98
	ror $13.b		; 66 13
	dex		; CA
	dec $4C55.w,X		; DE 55 4C
	rol $A9.b		; 26 A9
	cpx $336E.w		; EC 6E 33
	txa		; 8A
	sta $50.b		; 85 50
	tyx		; BB
	ror $79.b,X		; 76 79
	sbc ($05.b,X)		; E1 05
	eor $54.b		; 45 54
	tsb $20.b		; 04 20
	brk $AA.b		; 00 AA
	ora $152C.w		; 0D 2C 15
	eor ($42.b)		; 52 42
	and $8D.b		; 25 8D
	cpy #$02.b		; C0 02
	tay		; A8
	lsr $2A.b		; 46 2A
	lda $2ADE75.l		; AF 75 DE 2A
	ldx $B613.w,Y		; BE 13 B6
	ror $AE.b,X		; 76 AE
	lsr $8557.w,X		; 5E 57 85
	sta [$E1.b],Y		; 97 E1
	jsr ($DF3D.w,X)		; FC 3D DF
	sta $3C.b		; 85 3C
	trb $B5AD.w		; 1C AD B5
	sta $97A9.w		; 8D A9 97
	eor $243B.w,X		; 5D 3B 24
	jmp $A1754F.l		; 5C 4F 75 A1
	mvn $19,$B1		; 54 B1 19
	adc $24.b,S		; 63 24
	jmp $7447.w		; 4C 47 74
	ldy #$40.b		; A0 40
	ora $45.b		; 05 45
	eor $50.b		; 45 50
	bpl  64.b		; 10 40
	rti		; 40

	rti		; 40

	asl $28.b		; 06 28
	tay		; A8
	tax		; AA
	cop $49.b		; 02 49
	bpl  16.b		; 10 10
	ora ($96.b)		; 12 96
	bvc  80.b		; 50 50
	rol A		; 2A
	sta ($D3.b,S),Y		; 93 D3
	cpx $92.b		; E4 92
	trb $F0.b		; 14 F0
	bpl  87.b		; 10 57
	sbc $BD2A.w,X		; FD 2A BD
	and [$E0.b],Y		; 37 E0
	adc $B38D.w,Y		; 79 8D B3
	ldx $7F.b		; A6 7F
	ldx $EFFD.w		; AE FD EF
	cmp ($A6.b,S),Y		; D3 A6
	jmp ($3007.w,X)		; 7C 07 30
	ldx $15.b,Y		; B6 15
	asl $8BE1.w,X		; 1E E1 8B
	asl $1933.w		; 0E 33 19
	eor $1558.w,Y		; 59 58 15
	inc A		; 1A
	rol $2C.b		; 26 2C
	and [$0B.b],Y		; 37 0B
	stx $C8.b		; 86 C8
	cmp $6C1B.w,Y		; D9 1B 6C
	sbc $7FB6.w,X		; FD B6 7F
	phb		; 8B
	adc $7D7F7D.l,X		; 7F 7D 7F 7D
	adc $DD5FEA.l,X		; 7F EA 5F DD
	cmp $E2DFDD.l,X		; DF DD DF E2
	stz $8A53.w		; 9C 53 8A
	adc ($A4.b),Y		; 71 A4
	sbc $49.b,S		; E3 49
	dec $93.b		; C6 93
	dec $CE93.w		; CE 93 CE
	sta ($C7.b,S),Y		; 93 C7
	cmp $7EF2.w		; CD F2 7E
	lda $79F68F.l,X		; BF 8F F6 79
	jmp ($6F4E.w,X)		; 7C 4E 6F
	sta [$CB.b],Y		; 97 CB
	sbc ($39.b,S),Y		; F3 39
	lsr $2F8F.w,X		; 5E 8F 2F
	cmp $152169.l		; CF 69 21 15
	lda $81.b,S		; A3 81
	adc $E0BFD7.l,X		; 7F D7 BF E0
	ror $39.b,X		; 76 39
	lda $6F8E.w,X		; BD 8E 6F
	sbc ($D8.b,X)		; E1 D8
	cmp $E0.b,X		; D5 E0
	eor $58D5F5.l,X		; 5F F5 D5 58
	and ($62.b),Y		; 31 62
	sbc ($15.b)		; F2 15
	stz $ED.b		; 64 ED
	sbc ($7D.b)		; F2 7D
	rol $FB8E.w		; 2E 8E FB
	lda $EEB7.w,Y		; B9 B7 EE
	adc $F8F0.w		; 6D F0 F8
	stz $6D.b,X		; 74 6D
	lda $923E.w,Y		; B9 3E 92
	bcs -43.b		; B0 D5
	tsx		; BA
	cmp $BB6E.w,X		; DD 6E BB
	lda [$72.b],Y		; B7 72
	sbc ($21.b)		; F2 21
	lsr $2D3F.w		; 4E 3F 2D
	lda $8F2D.w		; AD 2D 8F
	inc $EF.b		; E6 EF
	adc $DEC79E.l,X		; 7F 9E C7 DE
	sbc $AA957F.l		; EF 7F 95 AA
	inc A		; 1A
	and #$EFDC.w		; 29 DC EF
	eor ($9D.b,S),Y		; 53 9D
	nop		; EA
	adc ($BA.b,S),Y		; 73 BA
	sta $A76E.w,X		; 9D 6E A7
	phy		; 5A
	ldx $A2B2.w		; AE B2 A2
	beq -67.b		; F0 BD
	lda $C28767.l		; AF 67 87 C2
	inc $BD.b,X		; F6 BD
	stz $881A.w,X		; 9E 1A 88
	tsb $B158.w		; 0C 58 B1
	.db $62, $8A, $A2		; 62 8A A2
	bra -128.b		; 80 80
	tay		; A8
	bra -88.b		; 80 A8
	tay		; A8
	txa		; 8A
	ldx #$CF.b		; A2 CF
	lda #$AD3F.w		; A9 3F AD
	rol $FEA4.w,X		; 3E A4 FE
	lda ($88.b)		; B2 88
	ora $C3AF13.l		; 0F 13 AF C3
	sed		; F8
	sed		; F8
	sta $1F7E.w,X		; 9D 7E 1F
	dec $31.b		; C6 31
	lda [$1D.b]		; A7 1D
	ldy $F751.w,X		; BC 51 F7
	and $E5.b,S		; 23 E5
	stz $F7.b		; 64 F7
	and ($79.b)		; 32 79
	eor $8C14FB.l,X		; 5F FB 14 8C
	sty $EE.b,X		; 94 EE
	sbc [$ED.b]		; E7 ED
	xce		; FB
	stz $E31F.w		; 9C 1F E3
	xce		; FB
	inc $91EF.w,X		; FE EF 91
	inc $F3CB.w		; EE CB F3
	adc ($FC.b)		; 72 FC
	inc $976F.w,X		; FE 6F 97
	plx		; FA
	sec		; 38
	sta $EB87A7.l,X		; 9F A7 87 EB
	adc $8FBD.w,X		; 7D BD 8F
	sed		; F8
	cld		; D8
	adc $FB8FCD.l,X		; 7F CD 8F FB
	eor $62.b,X		; 55 62
	tax		; AA
	cmp $C8.b		; C5 C8
	ldx $97.b		; A6 97
	and [$7F.b]		; 27 7F
	cmp #$F4DF.w		; C9 DF F4
	tyx		; BB
	inc $7D97.w		; EE 97 7D
	cmp ($EF.b)		; D2 EF
	lda $FE3B.w,Y		; B9 3B FE
	lsr $58FD.w		; 4E FD 58
	lda ($6B.b),Y		; B1 6B
	rtl		; 6B

	rtl		; 6B

	.db $62, $C6, $C7		; 62 C6 C7
	sbc $F2B1.w,Y		; F9 B1 F2
	adc ($BF.b)		; 72 BF
	and [$63.b]		; 27 63
	adc $DFD8.w,X		; 7D D8 DF
	stz $7E.b,X		; 74 7E
	pea $B99B.w		; F4 9B B9
	ror $5E45.w,X		; 7E 45 5E
	sty $EF.b		; 84 EF
	sty $CFF8.w		; 8C F8 CF
	cmp $24677C.l,X		; DF 7C 67 24
	pha		; 48
	sta ($39.b),Y		; 91 39
	asl $91.b		; 06 91
	ldy $69.b		; A4 69
	inc A		; 1A
	eor $92.b		; 45 92
	cmp #$E560.w		; C9 60 E5
	eor ($A7.b),Y		; 51 A7
	lsr $9D.b		; 46 9D
	inc A		; 1A
	stz $69.b,X		; 74 69
	cmp ($BB.b),Y		; D1 BB
	plb		; AB
	adc $F256.w,Y		; 79 56 F2
	lda $5BE5.w		; AD E5 5B
	dex		; CA
	lda [$9D.b],Y		; B7 9D
	ora $3EFDAD.l,X		; 1F AD FD 3E
	sta $5D.b,X		; 95 5D
	cmp #$1831.w		; C9 31 18
	sty $2346.w		; 8C 46 23
	lda $CC27.w,Y		; B9 27 CC
	and [$2B.b]		; 27 2B
	sta $3B7F.w		; 8D 7F 3B
	ldy #$54.b		; A0 54
	jsl $7DD193.l		; 22 93 D1 7D
	lsr $10.b,X		; 56 10
	stz $5470.w,X		; 9E 70 54
	adc [$A3.b]		; 67 A3
	bra  65.b		; 80 41
	ora ($14.b,X)		; 01 14
	eor ($A5.b,X)		; 41 A5
	rts		; 60

	tay		; A8
	lda ($7F.b)		; B2 7F
	sbc $E8B6.w,Y		; F9 B6 E8
	php		; 08
	ldx #$11.b		; A2 11
	lda $547127.l		; AF 27 71 54
	ora $17.b,X		; 15 17
	ldy #$74.b		; A0 74
	asl $F084.w		; 0E 84 F0
	cmp $9637.w,X		; DD 37 96
	ror $DBEC.w		; 6E EC DB
	ror A		; 6A
	lda #$4743.w		; A9 43 47
	lda ($6E.b),Y		; B1 6E
	inc $AB.b,X		; F6 AB
	sty $85C7.w		; 8C C7 85
	ora ($51.b),Y		; 11 51
	txs		; 9A
	lda $7A7D.w,X		; BD 7D 7A
	sbc $EB.b,X		; F5 EB
	brk $10.b		; 00 10
	txs		; 9A
	adc [$1C.b]		; 67 1C
	cpy $C2.b		; C4 C2
	jsl $4F8AA2.l		; 22 A2 8A 4F
	sec		; 38
	brk $82.b		; 00 82
	ldx #$54.b		; A2 54
	jsl $A2282A.l		; 22 2A 28 A2
	bra   8.b		; 80 08
	rol A		; 2A
	jsr $3E6C.w		; 20 6C 3E
	eor ($1A.b,S),Y		; 53 1A
	cop $28.b		; 02 28
	sta $4A.b,S		; 83 4A
	cmp ($51.b,X)		; C1 51
	eor $2822.w		; 4D 22 28
	php		; 08
	ldx #$0D.b		; A2 0D
	pld		; 2B
	ora $45.b		; 05 45
	sta [$E2.b],Y		; 97 E2
	cmp $99F8.w,Y		; D9 F8 99
	ora #$5944.w		; 09 44 59
	adc ($49.b)		; 72 49
	adc $27.b,S		; 63 27
	cmp ($AF.b),Y		; D1 AF
	cmp $6B8C.w,Y		; D9 8C 6B
	ldy $2316.w		; AC 16 23
	lsr $9091.w,X		; 5E 91 90
	iny		; C8
	stz $32.b		; 64 32
	ora $C92A.w,Y		; 19 2A C9
	sta [$26.b]		; 87 26
	and $253A.w		; 2D 3A 25
	and $25.b		; 25 25
	and $3A.b		; 25 3A
	eor $68.b,X		; 55 68
	adc [$FD.b]		; 67 FD
	phb		; 8B
	dec $5E0D.w,X		; DE 0D 5E
	and $D553.w		; 2D 53 D5
	and $D553.w,X		; 3D 53 D5
	cpy #$E8.b		; C0 E8
	beq  58.b		; F0 3A
	rol A		; 2A
	dey		; 88
	dey		; 88
	dey		; 88
	sta $04.b,S		; 83 04
	ldx #$09.b		; A2 09
	mvp $88,$12		; 44 12 88
	bit $53.b,X		; 34 53
	ldy #$C2.b		; A0 C2
	dey		; 88
	bmi -94.b		; 30 A2
	tsb $8428.w		; 0C 28 84
	ora $05.b,X		; 15 05
	ora $05.b		; 05 05
	ora ($51.b,X)		; 01 51
	eor ($51.b),Y		; 51 51
	eor $05.b,X		; 55 05
	ora $05.b		; 05 05
	sty $05.b		; 84 05
	eor $45.b		; 45 45
	lsr $87.b		; 46 87
	asl $DE22.w		; 0E 22 DE
	trb $AF56.w		; 1C 56 AF
	ror A		; 6A
	sbc ($BB.b,X)		; E1 BB
	tsx		; BA
	cmp $C2.b,X		; D5 C2
	lda [$70.b],Y		; B7 70
	clv		; B8
	ror $6AE1.w		; 6E E1 6A
	stz $A9A6.w,X		; 9E A6 A9
	nop		; EA
	ora $A472.w,Y		; 19 72 A4
	lda ($4D.b)		; B2 4D
	stx $736C.w		; 8E 6C 73
	adc $9B.b,S		; 63 9B
	trb $88CA.w		; 1C CA 88
	dey		; 88
	dey		; 88
	sta $EA.b,S		; 83 EA
	eor $8850.w		; 4D 50 88
	jsl $448C2B.l		; 22 2B 8C 44
	mvp $15,$44		; 44 44 15
	tsb $4D62.w		; 0C 62 4D
	sty $4145.w		; 8C 45 41
	ora ($11.b),Y		; 11 11
	bpl  84.b		; 10 54
	ora ($10.b,X)		; 01 10
	eor $41.b		; 45 41
	ora ($11.b),Y		; 11 11
	bpl  84.b		; 10 54
	and $8A09.w		; 2D 09 8A
	bne -118.b		; D0 8A
	.db $82, $22, $22		; 82 22 22
	jsr $28A8.w		; 20 A8 28
	plp		; 28
	and $0A14.w		; 2D 14 0A
	txa		; 8A
	txa		; 8A
	sty $981C.w		; 8C 1C 98
	lda ($68.b)		; B2 68
	cpx $D1.b		; E4 D1
	cmp #$257B.w		; C9 7B 25
	sbc $572F.w		; ED 2F 57
	phk		; 4B
	cmp $5D.b,X		; D5 5D
	lda $D9BF.w		; AD BF D9
	adc $1DE94C.l		; 6F 4C E9 1D
	and $B2.b,S		; 23 B2
	ror $41.b,X		; 76 41
	sta $ECEC14.l,X		; 9F 14 EC EC
	sbc $5AA8.w		; ED A8 5A
	sta $A8.b		; 85 A8
	eor $ED0F.w		; 4D 0F ED
	adc $5AEF56.l		; 6F 56 EF 5A
	cmp $46.b,X		; D5 46
	bit #$68A2.w		; 89 A2 68
	stz $1A51.w		; 9C 51 1A
	eor $2A108B.l,X		; 5F 8B 10 2A
	sty $AE.b,X		; 94 AE
	bne -117.b		; D0 8B
	mvp $FA,$3A		; 44 3A FA
	txs		; 9A
	sta $BE7E.w,X		; 9D 7E BE
	ldx $A7.b		; A6 A7
	eor $2A80.w,X		; 5D 80 2A
	bit $B2.b,X		; 34 B2
	php		; 08
	bcs 103.b		; B0 67
	ply		; 7A
	bpl -99.b		; 10 9D
	plp		; 28
	brk $5E.b		; 00 5E
	sty $F5.b		; 84 F5
	eor ($55.b),Y		; 51 55
	ora $50.b,X		; 15 50
	dey		; 88
	sta $A22B.w		; 8D 2B A2
	bra   0.b		; 80 00
	eor $00.b,X		; 55 00
	bra -120.b		; 80 88
	txa		; 8A
	plb		; AB
	sbc $3E7A.w,X		; FD 7A 3E
	rol $CF.b		; 26 CF
	adc $B4.b,X		; 75 B4
	cmp $375401.l		; CF 01 54 37
	tyx		; BB
	bit $7A37.w,X		; 3C 37 7A
	lda ($EA.b,S),Y		; B3 EA
	dec $AB8A.w		; CE 8A AB
.ACCU 8
	sep #$65		; E2 65
	adc $4F7A7F.l,X		; 7F 7F 7A 4F
	lda $CA.b,X		; B5 CA
	bcc  21.b		; 90 15
	eor $A9.b,S		; 43 A9
	sta $C7A7.w,Y		; 99 A7 C7
	cmp $948E.w		; CD 8E 94
	eor ($55.b),Y		; 51 55
	eor ($10.b,X)		; 41 10
	eor ($54.b,X)		; 41 54
	ora ($11.b),Y		; 11 11
	ora ($55.b),Y		; 11 55
	ror $F6.b,X		; 76 F6
	and $5781EF.l,X		; 3F EF 81 57
	cmp ($E0.b,S),Y		; D3 E0
	bne  10.b		; D0 0A
	lda ($D9.b,X)		; A1 D9
	jmp.w [$7874]		; DC 74 78
	trb $7BF8.w		; 1C F8 7B
	beq  69.b		; F0 45
	eor $F3.b,X		; 55 F3
	tsa		; 3B
	cmp $9CE8E1.l		; CF E1 E8 9C
	wai		; CB
	jsr $872A.w		; 20 2A 87
	nop		; EA
	cmp ($9B.b),Y		; D1 9B
	ora $BD5EA1.l,X		; 1F A1 5E BD
	pla		; 68
	lda ($58.b),Y		; B1 58
	cmp $63.b		; C5 63
	bit $80.b		; 24 80
	phd		; 0B
	sta ($B9.b)		; 92 B9
	adc #$4B.b		; 69 4B
	jsl $1EC922.l		; 22 22 C9 1E
	ora [$B7.b],Y		; 17 B7
	lda #$C3.b		; A9 C3
	sbc ($7B.b,X)		; E1 7B
	ply		; 7A
	stz $2036.w		; 9C 36 20
	tay		; A8
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	adc ($6C.b)		; 72 6C
	lda ($56.b)		; B2 56
	dec $E3.b,X		; D6 E3
	stx $E338.w		; 8E 38 E3
	stx $FE2A.w		; 8E 2A FE
	lsr $2FF3.w,X		; 5E F3 2F
	eor $14731F.l,X		; 5F 1F 73 14
	sta $82.b		; 85 82
	cmp ($60.b,X)		; C1 60
	lda ($59.b)		; B2 59
	cpx #$65.b		; E0 65
	adc [$19.b]		; 67 19
	stx $E0.b		; 86 E0
	tsx		; BA
	eor $162D.w,X		; 5D 2D 16
	clv		; B8
	cmp [$FF.b],Y		; D7 FF
	and $5FF8.w,X		; 3D F8 5F
	stx $7C.b		; 86 7C
	and ($E1.b,S),Y		; 33 E1
	sta $68180D.l,X		; 9F 0D 18 68
	bra  76.b		; 80 4C
	lsr $8808.w		; 4E 08 88
	ldx #$22.b		; A2 22
	jsl $220022.l		; 22 22 00 22
	php		; 08
	dey		; 88
	ldx #$22.b		; A2 22
	jsl $996722.l		; 22 22 67 99
	xce		; FB
	lsr $D5C7.w		; 4E C7 D5
	sbc [$7C.b],Y		; F7 7C
	sbc #$D9.b		; E9 D9
	cmp $3ACA.w,X		; DD CA 3A
	lda ($F5.b,S),Y		; B3 F5
	adc [$E9.b]		; 67 E9
	cmp $4FF554.l		; CF 54 F5 4F
	mvn $8D,$FD		; 54 FD 8D
	dex		; CA
	adc ($A4.b)		; 72 A4
	sbc $79.b		; E5 79
	rol $B79F.w,X		; 3E 9F B7
	cmp $EA.b,X		; D5 EA
	eor $E3.b		; 45 E3
	lda $E988.w,Y		; B9 88 E9
	eor [$36.b]		; 47 36
	tsa		; 3B
	pha		; 48
	cmp #$19.b		; C9 19
	and $A7.b,S		; 23 A7
	cmp [$EA.b]		; C7 EA
	ror $20.b		; 66 20
	dey		; 88
	dey		; 88
	dey		; 88
	txa		; 8A
	jsl $272222.l		; 22 22 22 27
	asl $8E.b		; 06 8E
	ora $3AF2EE.l		; 0F EE F2 3A
	sbc $07B38F.l,X		; FF 8F B3 07
	bcc -25.b		; 90 E7
	and $EF.b,S		; 23 EF
	cmp $9F.b,S		; C3 9F
	asl $2864.w		; 0E 64 28
	sta $10.b		; 85 10
	cpx $F2.b		; E4 F2
	dec A		; 3A
	eor $64C9.w,Y		; 59 C9 64
	lda ($CC.b,S),Y		; B3 CC
	lda $C2.b,X		; B5 C2
	sbc $FF.b,X		; F5 FF
	eor $376E.w,X		; 5D 6E 37
	eor $1D.b		; 45 1D
	ply		; 7A
	sbc $FC0A.w,X		; FD 0A FC
	inc A		; 1A
	sbc $AE.b		; E5 AE
	phy		; 5A
	inc $C7.b		; E6 C7
	dec $40D1.w		; CE D1 40
	tsb $6625.w		; 0C 25 66
	sbc [$0C.b]		; E7 0C
	cld		; D8
	sbc $AE.b		; E5 AE
	phy		; 5A
	cmp ($11.b),Y		; D1 11
	ora ($11.b),Y		; 11 11
	sec		; 38
	plx		; FA
	and $AED7.w,Y		; 39 D7 AE
	adc $5C.b		; 65 5C
	rol $F216.w		; 2E 16 F2
	sbc $4ECF16.l		; EF 16 CF 4E
	dec $0B.b		; C6 0B
	ora $1DAB.w,X		; 1D AB 1D
	tyx		; BB
	and $31BB.w,X		; 3D BB 31
	lda ($F1.b,S),Y		; B3 F1
	jmp ($B3E3.w)		; 6C E3 B3
	and $1213.w		; 2D 13 12
	ora $BA.b		; 05 BA
	ror $9FE2.w,X		; 7E E2 9F
	ora $7118.w		; 0D 18 71
	adc ($C8.b,X)		; 61 C8
	sty $3C.b		; 84 3C
	cld		; D8
	adc $D0B0.w,Y		; 79 B0 D0
	stx $84.b		; 86 84
	tsb $46.b		; 04 46
	ora $2A.b		; 05 2A
	sbc $226B.w		; ED 6B 22
	and $42.b,S		; 23 42
	tax		; AA
	jmp.w [$4544]		; DC 44 45
	and #$56.b		; 29 56
	sbc [$35.b],Y		; F7 35
	ora ($11.b),Y		; 11 11
	eor $70.b,X		; 55 70
	jsl $AE9422.l		; 22 22 94 AE
	sty $44.b		; 84 44
	jmp $A734.w		; 4C 34 A7
	and $A58808.l,X		; 3F 08 88 A5
	bit $4444.w		; 2C 44 44
	lda $A8.b		; A5 A8
	txa		; 8A
	eor ($A9.b)		; 52 A9
	bit $44.b		; 24 44
	mvp $94,$9A		; 44 9A 94
	cmp $4498.w,Y		; D9 98 44
	eor ($95.b)		; 52 95
	adc ($F9.b,S),Y		; 73 F9
	inx		; E8
	dey		; 88
	txa		; 8A
	plb		; AB
	ldy #$C9.b		; A0 C9
	ora $2D23.w,Y		; 19 23 2D
	adc ($29.b),Y		; 71 29
	lsr $0D.b,X		; 56 0D
	stz $44.b		; 64 44
	stz $55.b		; 64 55
	tad		; 5B
	sta $EA16.w		; 8D 16 EA
	cmp $0150.w,X		; DD 50 01
	stx $65.b,Y		; 96 65
	dec $BDCC.w,X		; DE CC BD
	sta $9C1D.w,Y		; 99 1D 9C
	adc [$31.b],Y		; 77 31
	cpx $46.b		; E4 46
	and $787E3C.l,X		; 3F 3C 7E 78
	cpx #$8E.b		; E0 8E
	php		; 08
	inc $FB29.w		; EE 29 FB
	and $4B91.w		; 2D 91 4B
	stz $21.b,X		; 74 21
	lda ($0F.b,X)		; A1 0F
	.db $42, $13		; 42 13
	cmp $ABED76.l		; CF 76 ED AB
	rti		; 40

	ora $6EAD.w,X		; 1D AD 6E
	dec $B7.b,X		; D6 B7
	rtl		; 6B

	tad		; 5B
	sbc ($68.b),Y		; F1 68
	trb $AE.b		; 14 AE
	sbc $71.b,S		; E3 71
	clv		; B8
	sbc ($D5.b,S),Y		; F3 D5
	bvc  13.b		; 50 0D
	inc $F76E.w		; EE 6E F7
	and [$7B.b],Y		; 37 7B
	txy		; 9B
	ror $4AE1.w		; 6E E1 4A
	beq  56.b		; F0 38
	trb $B20E.w		; 1C 0E B2
	tax		; AA
	brk $50.b		; 00 50
	bvc  82.b		; 50 52
	jsr ($39FC.w,X)		; FC FC 39
	sed		; F8
	adc #$D5.b		; 69 D5
	eor $45.b,X		; 55 45
	brk $01.b		; 00 01
	and $3C.b		; 25 3C
	lda $F6.b		; A5 F6
	ror $B3.b		; 66 B3
	and $3A.b,X		; 35 3A
	eor $9064.w,Y		; 59 64 90
	brk $39.b		; 00 39
	pea $65A7.w		; F4 A7 65
	lda ($29.b)		; B2 29
	lsr $A083.w,X		; 5E 83 A0
	inx		; E8
	and $01AA32.l,X		; 3F 32 AA 01
	sta $5B.b,S		; 83 5B
	asl $B6.b		; 06 B6
	ora $186C.w		; 0D 6C 18
	asl A		; 0A
	eor [$71.b],Y		; 57 71
	clv		; B8
	jmp.w [$5573]		; DC 73 55
	bvc  11.b		; 50 0B
	cmp $B397.w,Y		; D9 97 B3
	and $6E295E.l		; 2F 5E 29 6E
	php		; 08
	cpx #$8F.b		; E0 8F
	lsr $35.b,X		; 56 35
	cmp [$8F.b],Y		; D7 8F
	asl $402C.w,X		; 1E 2C 40
	trb $C8.b		; 14 C8
	brk $00.b		; 00 00
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $7C1F7C.l,X		; 1F 7C 1F 7C
	ora $00007C.l,X		; 1F 7C 00 00
	eor $271F33.l,X		; 5F 33 1F 27
	cmp $1A9C1A.l,X		; DF 1A 9C 1A
	sbc $7511.w,Y		; F9 11 75
	ora $FF.b		; 05 FF
	adc $345319.l,X		; 7F 19 53 34
	rol $156E.w		; 2E 6E 15
	iny		; C8
	tsb $43.b		; 04 43
	brk $59.b		; 00 59
	ora $0015.w,Y		; 19 15 00
	sbc $00004F.l,X		; FF 4F 00 00
	eor $271F33.l,X		; 5F 33 1F 27
	cmp $1A9C1A.l,X		; DF 1A 9C 1A
	sbc $7511.w,Y		; F9 11 75
	ora $FF.b		; 05 FF
	adc $345319.l,X		; 7F 19 53 34
	rol $156E.w		; 2E 6E 15
	iny		; C8
	tsb $43.b		; 04 43
	brk $59.b		; 00 59
	ora $0015.w,Y		; 19 15 00
	sbc $621F4F.l,X		; FF 4F 1F 62
	cmp $51BE59.l,X		; DF 59 BE 51
	sta $5D49.w,X		; 9D 49 5D
	eor ($3C.b,X)		; 41 3C
	and $2D1C.w,Y		; 39 1C 2D
	xce		; FB
	bit $DB.b		; 24 DB
	trb $14BA.w		; 1C BA 14
	tsx		; BA
	bpl -71.b		; 10 B9
	tsb $08B9.w		; 0C B9 08
	cld		; D8
	tsb $D8.b		; 04 D8
	brk $F7.b		; 00 F7
	brk $9F.b		; 00 9F
	tsa		; 3B
	adc $177F27.l,X		; 7F 27 7F 17
	eor $02FD03.l,X		; 5F 03 FD 02
	txy		; 9B
	cop $78.b		; 02 78
	cop $36.b		; 02 36
	cop $DF.b		; 02 DF
	dec A		; 3A
	adc $1E1F2E.l,X		; 7F 2E 1F 1E
	lda $015F0D.l,X		; BF 0D 5F 01
	trb $F901.w		; 1C 01 F9
	brk $D7.b		; 00 D7
	brk $9F.b		; 00 9F
	tsa		; 3B
	adc $11F927.l,X		; 7F 27 F9 11
	adc $05.b,X		; 75 05
	ora ($01.b),Y		; 11 01
	tda		; 7B
	cop $38.b		; 02 38
	cop $16.b		; 02 16
	cop $BF.b		; 02 BF
	dec A		; 3A
	eor $1DFF2E.l,X		; 5F 2E FF 1D
	sta $011F0D.l,X		; 9F 0D 1F 01
	jmp.w [$D900]		; DC 00 D9
	brk $B7.b		; 00 B7
	brk $7F.b		; 00 7F
	and [$3F.b],Y		; 37 3F
	and [$1F.b]		; 27 1F
	ora ($FF.b,S),Y		; 13 FF
	cop $9D.b		; 02 9D
	cop $5B.b		; 02 5B
	cop $18.b		; 02 18
	cop $F6.b		; 02 F6
	ora ($9F.b,X)		; 01 9F
	dec A		; 3A
	and $1DDF2E.l,X		; 3F 2E DF 1D
	adc $011F0D.l,X		; 7F 0D 1F 01
	jmp.w [$D900]		; DC 00 D9
	brk $B7.b		; 00 B7
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	and ($1F.b,S),Y		; 33 1F
	and [$DF.b]		; 27 DF
	inc A		; 1A
	stz $F91A.w		; 9C 1A F9
	ora ($75.b),Y		; 11 75
	ora $FF.b		; 05 FF
	adc $345319.l,X		; 7F 19 53 34
	rol $156E.w		; 2E 6E 15
	iny		; C8
	tsb $43.b		; 04 43
	brk $59.b		; 00 59
	ora $0015.w,Y		; 19 15 00
	sbc $FB424F.l,X		; FF 4F 42 FB
	brk $2A.b		; 00 2A
	cpy #$A4.b		; C0 A4
	brk $2A.b		; 00 2A
	cpy #$0D.b		; C0 0D
	ply		; 7A
	ora ($00.b)		; 12 00
	brk $25.b		; 00 25
	ora ($12.b)		; 12 12
	and $FF00.w		; 2D 00 FF
	and $FFFF.w,X		; 3D FF FF
	lsr A		; 4A
	and $4D2D.w		; 2D 2D 4D
	and $25.b		; 25 25
	eor ($3D.b)		; 52 3D
	and $4A5A.w,X		; 3D 5A 4A
	lsr A		; 4A
	.db $62, $4D, $4D		; 62 4D 4D
	ror $52.b		; 66 52
	eor ($69.b)		; 52 69
	.db $62, $5A, $6A		; 62 5A 6A
	sbc $4A6D0F.l,X		; FF 0F 6D 4A
	and $256E.w		; 2D 6E 25
	ora ($74.b)		; 12 74
	ora $FC.b,S		; 03 FC
	adc $FE.b,X		; 75 FE
	inc $698B.w,X		; FE 8B 69
	phy		; 5A
	sta $6A6A.w		; 8D 6A 6A
	sta ($00.b)		; 92 00
	ora $FF3D96.l		; 0F 96 3D FF
	sta $F8FC.w,X		; 9D FC F8
	ldx #$74.b		; A2 74
	stz $A3.b,X		; 74 A3
	cpx #$E0.b		; E0 E0
	lda [$F1.b]		; A7 F1
	sbc ($A9.b),Y		; F1 A9
	.db $62, $12, $AC		; 62 12 AC
	sed		; F8
	sbc $9D9DAD.l,X		; FF AD 9D 9D
	ldx $FE00.w		; AE 00 FE
	lda ($3F.b)		; B2 3F
	and $55AAB5.l,X		; 3F B5 AA 55
	lda $E3E3.w,Y		; B9 E3 E3
	cmp #$5A.b		; C9 5A
	and $F0CB.w		; 2D CB F0
	beq -46.b		; F0 D2
	ora ($01.b,X)		; 01 01
	pei ($66.b)		; D4 66
	eor ($DA.b)		; 52 DA
	ora $FD.b,S		; 03 FD
	nop		; EA
	eor $EB25.w		; 4D 25 EB
	sta $ED8D.w		; 8D 8D ED
	sta ($92.b)		; 92 92
	asl $FF.b,X		; 16 FF
	and $001A.w		; 2D 1A 00
	ora [$22.b]		; 07 22
	sed		; F8
	sed		; F8
	bit $5A.b		; 24 5A
	adc $AC26.w		; 6D 26 AC
	ldy $012B.w		; AC 2B 01
	inc $092C.w,X		; FE 2C 09
	sbc $4D31.w,Y		; F9 31 4D
	ora ($32.b)		; 12 32
	ror $66.b		; 66 66
	rol $C0.b,X		; 36 C0
	sbc $1F003A.l,X		; FF 3A 00 1F
	eor $07.b		; 45 07
	ora [$46.b]		; 07 46
	phy		; 5A
	lsr A		; 4A
	eor #$2B.b		; 49 2B
	pld		; 2B
	phk		; 4B
	eor ($3D.b)		; 52 3D
	jmp $7575.w		; 4C 75 75
	lsr $A2A2.w		; 4E A2 A2
	eor ($AD.b),Y		; 51 AD
	lda $F058.w		; AD 58 F0
	sbc $3F0059.l,X		; FF 59 00 3F
	tad		; 5B
	brk $80.b		; 00 80
	jmp $5D7FFF.l		; 5C FF 7F 5D
	ora [$3F.b]		; 07 3F
	adc $58.b		; 65 58
	cli		; 58
	rtl		; 6B

	ora ($02.b,X)		; 01 02
	ror $0F.b,X		; 76 0F
	ora $2C2C8A.l		; 0F 8A 2C 2C
	sta ($4D.b),Y		; 91 4D
	ror $AE93.w		; 6E 93 AE
	ldx $E899.w		; AE 99 E8
	inx		; E8
	txs		; 9A
	brk $7F.b		; 00 7F
	stz $FF12.w		; 9C 12 FF
	stz $3636.w,X		; 9E 36 36
	lda $A7.b		; A5 A7
	lda [$AB.b]		; A7 AB
	brk $C0.b		; 00 C0
	lda ($FC.b,S),Y		; B3 FC
	sbc $2D12B4.l,X		; FF B4 12 2D
	clv		; B8
	eor $BD5D.w,X		; 5D 5D BD
	stz $BE8B.w		; 9C 8B BE
	lda $A3.b,S		; A3 A3
	cmp $D0.b		; C5 D0
	and $DADAD3.l		; 2F D3 DA DA
	stp		; DB
	sbc ($FE.b,X)		; E1 FE
	trb $00.b		; 14 00
	ora ($1D.b,X)		; 01 1D
	sbc [$FF.b],Y		; F7 FF
	and #$B3.b		; 29 B3
	lda ($3B.b,S),Y		; B3 3B
	cpy #$3F.b		; C0 3F
	.db $42, $00		; 42 00
	sed		; F8
	eor $FF.b,S		; 43 FF
	bit $53.b		; 24 53
	ora $5E1D.w,X		; 1D 1D 5E
	brk $03.b		; 00 03
	stz $FF.b		; 64 FF
	sbc ($72.b),Y		; F1 72
	ora $7A41.w,Y		; 19 41 7A
	rti		; 40

	lda $5C5C89.l,X		; BF 89 5C 5C
	sty $7F7F.w		; 8C 7F 7F
	sty $B9.b,X		; 94 B9
	lda $C09B.w,Y		; B9 9B C0
	cpy #$A6.b		; C0 A6
	brk $E0.b		; 00 E0
	lda ($C7.b),Y		; B1 C7
	sbc $B57AB6.l,X		; FF B6 7A B5
	tsx		; BA
	brk $F0.b		; 00 F0
	tyx		; BB
	sbc $B1BC62.l,X		; FF 62 BC B1
	lda ($C2.b),Y		; B1 C2
	lda $B6.b,X		; B5 B6
	dec $18.b		; C6 18
	brk $C8.b		; 00 C8
	sbc $06CAE0.l,X		; FF E0 CA 06
	ora ($D6.b,X)		; 01 D6
	ora #$79.b		; 09 79
	jmp.w [$0810]		; DC 10 08
	sbc #$2D.b		; E9 2D
.ACCU 16
	rep #$EC		; C2 EC
	stz $64.b		; 64 64
	and ($8F.b,X)		; 21 8F
	sta $43A935.l		; 8F 35 A9 43
	mvp $FC,$00		; 44 00 FC
	adc ($77.b,X)		; 61 77
	sbc $05008E.l,X		; FF 8E 00 05
	sta $30.b,X		; 95 30
	sbc $5500D7.l,X		; FF D7 00 55
	cld		; D8
	sbc $FFD98B.l,X		; FF 8B D9 FF
	adc $00DE.w		; 6D DE 00
	trb $2DE5.w		; 1C E5 2D
	brk $EF.b		; 00 EF
	adc [$EF.b],Y		; 77 EF
	bvs -25.b		; 70 E7
	adc $897FE7.l,X		; 7F E7 7F 89
	bit #$1387.w		; 89 87 13
	bra  16.b		; 80 10
	sta [$1F.b]		; 87 1F
	sta [$1F.b]		; 87 1F
	bra  91.b		; 80 5B
	tad		; 5B
	tad		; 5B
	dec A		; 3A
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $5AFF1F.l,X		; FF 1F FF 5A
	.db $62, $96, $2D		; 62 96 2D
	pei ($0D.b)		; D4 0D
	adc $12.b		; 65 12
	eor ($4D.b)		; 52 4D
	ror $5A.b		; 66 5A
	.db $62, $FF, $FE		; 62 FF FE
	asl $66.b,X		; 16 66
	stx $FE.b,Y		; 96 FE
	bit $12.b,X		; 34 12
	eor ($4D.b)		; 52 4D
	ror $5A.b		; 66 5A
	.db $62, $9E, $9E		; 62 9E 9E
	stz $219E.w,X		; 9E 9E 21
	and ($21.b,X)		; 21 21
	and ($76.b,X)		; 21 76
	ror $76.b,X		; 76 76
	ror $8F.b,X		; 76 8F
	sbc $8FFF8F.l,X		; FF 8F FF 8F
	sbc $BBEB8F.l,X		; FF 8F EB BB
	asl $0EF7.w		; 0E F7 0E
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
	cpx $FF64.w		; EC 64 FF
	adc $65.b		; 65 65
	.db $62, $5C, $FF		; 62 5C FF
	txs		; 9A
	jmp $0D5C66.l		; 5C 66 5C 0D
	rol $12.b,X		; 36 12
	adc $4DFF5C.l,X		; 7F 5C FF 4D
	ror $5A.b		; 66 5A
	.db $62, $96, $2D		; 62 96 2D
	pei ($0D.b)		; D4 0D
	eor ($12.b,S),Y		; 53 12
	eor ($4D.b)		; 52 4D
	ror $5A.b		; 66 5A
	.db $62, $FC, $EF		; 62 FC EF
	jsr ($290F.w,X)		; FC 0F 29
	and #$E829.w		; 29 29 E8
	pha		; 48
	php		; 08
	php		; 08
	jsl $264D22.l		; 22 22 4D 26
	rol $5A.b		; 26 5A
	.db $62, $49, $49		; 62 49 49
	eor #$012B.w		; 49 2B 01
	jmp $4C4C.w		; 4C 4C 4C
	jmp $32FE.w		; 4C FE 32
	.db $62, $D0, $27		; 62 D0 27
	cmp $D0.b		; C5 D0
	rol $0DD1.w		; 2E D1 0D
	rol $C5.b		; 26 C5
	cmp $D0.b		; C5 D0
	rol $2ED1.w		; 2E D1 2E
	jmp.w [$18C6]		; DC C6 18
	ora ($11.b,X)		; 01 11
	php		; 08
	dec $C6.b		; C6 C6
	clc		; 18
	ora ($19.b,X)		; 01 19
	sta ($EB.b)		; 92 EB
	sta $BB6A.w		; 8D 6A BB
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
	jmp.w [$10DC]		; DC DC 10
	dey		; 88
	bpl -120.b		; 10 88
	bpl  38.b		; 10 26
	rol $26.b		; 26 26
	rol $62.b		; 26 62
	cmp $EFDFEF.l,X		; DF EF DF EF
	cmp $CCFFEF.l,X		; DF EF FF CC
	sbc $96C136.l,X		; FF 36 C1 96
	sbc ($30.b),Y		; F1 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  51.b		; 30 33
	and ($B2.b,S),Y		; 33 B2
	rol $123E.w,X		; 3E 3E 12
	asl $950E.w		; 0E 0E 95
	sta $95.b,X		; 95 95
	and ($FF.b,S),Y		; 33 FF
	and $163EFF.l,X		; 3F FF 3E 16
	asl $51BB.w		; 0E BB 51
	eor ($04.b),Y		; 51 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $CA.b,S		; 03 CA
	tsb $03.b		; 04 03
	dex		; CA
	lsr $624E.w		; 4E 4E 62
	.db $62, $11, $EE		; 62 11 EE
	lda $55.b,X		; B5 55
	tax		; AA
	lda $77.b,X		; B5 77
	dey		; 88
	lda $FF.b,X		; B5 FF
	ldx DMADEST0.w		; AE 01 43
	lda #$ED0F.w		; A9 0F ED
	sbc $92ED.w		; ED ED 92
	ora $5FAFEF.l,X		; 1F EF AF 5F
	eor $5FAFAF.l,X		; 5F AF AF 5F
	adc $5FAF8F.l,X		; 7F 8F AF 5F
	xba		; EB
	xba		; EB
	sta $4262.w		; 8D 62 42
	.db $42, $42		; 42 42
	php		; 08
	sed		; F8
	txa		; 8A
	txa		; 8A
	phk		; 4B
	eor ($53.b,S),Y		; 53 53
	sbc [$32.b],Y		; F7 32
	tyx		; BB
	sbc $EFEFEF.l		; EF EF EF EF
	inc $E8EF.w		; EE EF E8
	sbc $CBF8F0.l		; EF F0 F8 CB
	wai		; CB
	wai		; CB
	inc $FF.b,X		; F6 FF
	cli		; 58
	sbc ($FE.b),Y		; F1 FE
	sbc [$AC.b],Y		; F7 AC
	adc $58.b		; 65 58
	beq 102.b		; F0 66
	jsl $CBCBCB.l		; 22 CB CB CB
	eor $ED07.w		; 4D 07 ED
	sta ($2D.b)		; 92 2D
	sbc $6CFF6F.l,X		; FF 6F FF 6C
	stz $FD.b		; 64 FD
	lda $A5.b		; A5 A5
	adc $6FF8FF.l		; 6F FF F8 6F
	sbc ($6C.b,S),Y		; F3 6C
	cpx $64EC.w		; EC EC 64
	phk		; 4B
	sbc $A5FD.w,X		; FD FD A5
	lda $6E.b		; A5 6E
	cop $00.b		; 02 00
	asl $0E00.w		; 0E 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	and $8FFF.w		; 2D FF 8F
	sbc $22FF73.l,X		; FF 73 FF 22
	sbc $4BF9.w,Y		; F9 F9 4B
	asl $FF.b		; 06 FF
	ora $8F72.w		; 0D 72 8F
	jsr ($FF73.w,X)		; FC 73 FF
	ldy $52F9.w		; AC F9 52
	beq  82.b		; F0 52
	stx $22.b,Y		; 96 22
	sbc $4BF9.w,Y		; F9 F9 4B
	ror $0007.w		; 6E 07 00
	asl $6E.b		; 06 6E
	ldx $F8FF.w		; AE FF F8
	inc $FDC1.w,X		; FE C1 FD
	sbc ($F9.b,X)		; E1 F9
	ldx $0DBE.w,Y		; BE BE 0D
	cmp $C7FE.w,Y		; D9 FE C7
	ldy $FFC1.w		; AC C1 FF
	sbc ($C8.b,X)		; E1 C8
	iny		; C8
	iny		; C8
	iny		; C8
	and $FD75.w,X		; 3D 75 FD
	sbc $F9F9.w,X		; FD F9 F9
	ldx $12BE.w,Y		; BE BE 12
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	asl $3A.b		; 06 3A
	dec A		; 3A
	dec A		; 3A
	dec A		; 3A
	brk $61.b		; 00 61
	ora [$77.b]		; 07 77
	eor ($45.b)		; 52 45
	eor $45.b		; 45 45
	eor $8F.b		; 45 8F
	adc ($07.b,X)		; 61 07
	eor ($FF.b)		; 52 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$3D.b]		; 07 3D
	adc [$77.b],Y		; 77 77
	eor ($45.b)		; 52 45
	eor $45.b		; 45 45
	eor $12.b		; 45 12
	dey		; 88
	and $42.b		; 25 42
	.db $42, $42		; 42 42
	.db $42, $1A		; 42 1A
	and $B8B8B8.l,X		; 3F B8 B8 B8
	eor $BCBC.w,X		; 5D BC BC
	ldy $C7B1.w,X		; BC B1 C7
	and ($BB.b)		; 32 BB
	iny		; C8
	stz $FB.b		; 64 FB
	sbc ($64.b),Y		; F1 64
	sbc $FEE058.l,X		; FF 58 E0 FE
	cpx $FF.b		; E4 FF
	cpx $A3.b		; E4 A3
	lda [$F1.b]		; A7 F1
	sbc $A7.b,X		; F5 A7
	wai		; CB
	lda $E4.b,S		; A3 E4
	ora $E4E5.w		; 0D E5 E4
	cpx $32.b		; E4 32
	.db $62, $D4, $FE		; 62 D4 FE
	sed		; F8
	sbc $D463.w,Y		; F9 63 D4
	ldy $7E63.w		; AC 63 7E
	pei ($22.b)		; D4 22
	lda $EA.b,S		; A3 EA
	inc A		; 1A
	dec A		; 3A
	bit #$FC5C.w		; 89 5C FC
	adc $0DF1.w,Y		; 79 F1 0D
	stz $86.b		; 64 86
	and ($0D.b,S),Y		; 33 0D
	eor ($CE.b,S),Y		; 53 CE
	eor $803A0D.l,X		; 5F 0D 3A 80
	tad		; 5B
	tad		; 5B
	brk $81.b		; 00 81
	ora [$87.b]		; 07 87
	asl $FA3F.w,X		; 1E 3F FA
	pea $F3A8.w		; F4 A8 F3
	ora $6D91.w		; 0D 91 6D
	.db $42, $A6		; 42 A6
	nop		; EA
	inc A		; 1A
	dec A		; 3A
	adc $C33D.w		; 6D 3D C3
	cmp $470F90.l		; CF 90 0F 47
	bit $F31F.w,X		; 3C 1F F3
	sbc [$A4.b],Y		; F7 A4
	sbc $07EF88.l,X		; FF 88 EF 07
	ora ($0D.b)		; 12 0D
	tsa		; 3B
	eor $F8E0.w,X		; 5D E0 F8
	.db $82, $E3, $0C		; 82 E3 0C
	and $57CF0B.l		; 2F 0B CF 57
	ora $0DD8.w		; 0D D8 0D
	cld		; D8
	and $25AB.w		; 2D AB 25
	ora $ED.b,S		; 03 ED
	brk $18.b		; 00 18
	ora [$12.b]		; 07 12
	eor $42C9.w,Y		; 59 C9 42
	eor ($2D.b)		; 52 2D
	asl $3D.b,X		; 16 3D
	lsr A		; 4A
	sbc $129612.l,X		; FF 12 96 12
	lsr A		; 4A
	stx $B4.b,Y		; 96 B4
	ror $4AFF.w		; 6E FF 4A
	stz $4612.w		; 9C 12 46
	ora ($36.b)		; 12 36
	inc $E716.w,X		; FE 16 E7
	and [$F8.b]		; 27 F8
	jsr ($3C16.w,X)		; FC 16 3C
	sbc $FE76BF.l,X		; FF BF 76 FE
	sbc $180FF0.l,X		; FF F0 0F 18
	jsr $07FF.w		; 20 FF 07
	stx $C3.b,Y		; 96 C3
	adc $FF0F40.l,X		; 7F 40 0F FF
	ror $4AFF.w		; 6E FF 4A
	txs		; 9A
	bra  18.b		; 80 12
	lsr $9A.b		; 46 9A
	ora $F804F7.l		; 0F F7 04 F8
	and $0D3B.w		; 2D 3B 0D
	ror $05.b,X		; 76 05
	sbc $30.b,S		; E3 30
	xce		; FB
	ora #$C0FB.w		; 09 FB C0
	sed		; F8
	beq  55.b		; F0 37
	cpy #$2D.b		; C0 2D
	inc $0B01.w,X		; FE 01 0B
	bra -16.b		; 80 F0
	ora $F9DC.w		; 0D DC F9
	pea $3FF9.w		; F4 F9 3F
	cli		; 58
	ror $4480.w		; 6E 80 44
	mvp $25,$44		; 44 44 25
	sbc $275246.l,X		; FF 46 52 27
	cmp [$04.b]		; C7 04
	sed		; F8
	stz $40.b,X		; 74 40
	and $0DC334.l,X		; 3F 34 C3 0D
	dec $70.b		; C6 70
	and $F8.b		; 25 F8
	dec A		; 3A
	cpx #$E7.b		; E0 E7
	clc		; 18
	jsr ($CF03.w,X)		; FC 03 CF
	cpx #$F1.b		; E0 F1
	ora $4ABC.w		; 0D BC 4A
	inc A		; 1A
	sta ($42.b),Y		; 91 42
	cmp #$8C4B.w		; C9 4B 8C
	ora $0689.w		; 0D 89 06
	ora $9858.w		; 0D 58 98
	phd		; 0B
	cpx $84.b		; E4 84
	adc ($6E.b,S),Y		; 73 6E
	bra   0.b		; 80 00
	inc $0F.b,X		; F6 0F
	inc $01.b		; E6 01
	and $20DFC0.l,X		; 3F C0 DF 20
	adc $919A.w		; 6D 9A 91
	tad		; 5B
	phy		; 5A
	and #$B329.w		; 29 29 B3
	trb $06E7.w		; 1C E7 06
	ora $318741.l,X		; 1F 41 87 31
	cpx #$F8.b		; E0 F8
	sta $0EF779.l,X		; 9F 79 F7 0E
	cmp #$911A.w		; C9 1A 91
	.db $42, $4A		; 42 4A
	eor #$4949.w		; 49 49 49
	ora $1E61.w		; 0D 61 1E
	cmp $4CF2.w		; CD F2 4C
	jmp $1E4C.w		; 4C 4C 1E
	inc $3EF2.w,X		; FE F2 3E
	pei ($1F.b)		; D4 1F
	ora $EA0303.l,X		; 1F 03 03 EA
	ldx $44.b		; A6 44
	cmp $C5.b		; C5 C5
	bne  46.b		; D0 2E
	cmp ($2E.b),Y		; D1 2E
	bne  39.b		; D0 27
	cmp $D0.b		; C5 D0
	rol $2ED1.w		; 2E D1 2E
	dec $C6.b		; C6 C6
	clc		; 18
	ora ($19.b,X)		; 01 19
	brk $DC.b		; 00 DC
	dec $18.b		; C6 18
	ora ($19.b,X)		; 01 19
	sta ($EB.b)		; 92 EB
	sta $BB6A.w		; 8D 6A BB
	ora [$E7.b],Y		; 17 E7
	ora [$F7.b],Y		; 17 F7
	sta [$77.b],Y		; 97 77
	sta [$77.b],Y		; 97 77
	ora [$F7.b],Y		; 17 F7
	clc		; 18
	sbc $807F90.l,X		; FF 90 7F 80
	adc $C61008.l,X		; 7F 08 10 C6
	tya		; 98
	brk $98.b		; 00 98
	brk $C6.b		; 00 C6
	ora $0014.w		; 0D 14 00
	dey		; 88
	brk $90.b		; 00 90
	brk $26.b		; 00 26
	rol $AC.b		; 26 AC
	wai		; CB
	ldx $9231.w,Y		; BE 31 92
	dec A		; 3A
	dec A		; 3A
	iny		; C8
	sbc $CCFFE4.l,X		; FF E4 FF CC
	sbc $47C036.l,X		; FF 36 C0 47
	lda $1F1FD3.l,X		; BF D3 1F 1F
	tas		; 1B
	tas		; 1B
	and ($33.b,S),Y		; 33 33
	lda ($B2.b)		; B2 B2
	rti		; 40

	rtl		; 6B

	rtl		; 6B

	ora ($1F.b,X)		; 01 1F
	sbc $33FF1B.l,X		; FF 1B FF 33
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	tyx		; BB
	adc $5151.w		; 6D 51 51
	ora $02.b		; 05 02
	dex		; CA
	ora $02.b		; 05 02
	dex		; CA
	ora [$00.b]		; 07 00
	dex		; CA
	ora [$00.b]		; 07 00
	dex		; CA
	lsr $624E.w		; 4E 4E 62
	.db $62, $FF, $00		; 62 FF 00
	cmp $D72D.w,X		; DD 2D D7
	brk $EF.b		; 00 EF
	cmp [$00.b],Y		; D7 00
	tax		; AA
	cmp [$5A.b],Y		; D7 5A
	phy		; 5A
	lda #$ED0F.w		; A9 0F ED
	sbc $92ED.w		; ED ED 92
	ror A		; 6A
	cmp $5F6A0F.l,X		; DF 0F 6A 5F
	ora $5F0FEF.l		; 0F EF 0F 5F
	ora $5F0FAF.l		; 0F AF 0F 5F
	ora $62EBEB.l		; 0F EB EB 62
	txa		; 8A
	txa		; 8A
	txa		; 8A
	txa		; 8A
	eor ($53.b,S),Y		; 53 53
	eor ($1D.b,S),Y		; 53 1D
	sbc [$32.b],Y		; F7 32
	tyx		; BB
	wai		; CB
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	stx $58.b,Y		; 96 58
	rol $26.b		; 26 26
	ldy $3DF8.w		; AC F8 3D
	wai		; CB
	jsl $222222.l		; 22 22 22 22
	jsl $0F3D22.l		; 22 22 3D 0F
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	inc A		; 1A
	ora ($00.b)		; 12 00
	lda $A7.b		; A5 A7
	sed		; F8
	sbc $FC22.w,Y		; F9 22 FC
	jsr ($EC52.w,X)		; FC 52 EC
	inc $FFF1.w,X		; FE F1 FF
	rol $FC.b		; 26 FC
	eor ($A5.b)		; 52 A5
	lda [$F9.b]		; A7 F9
	sbc $FC22.w,Y		; F9 22 FC
	jsr ($0E52.w,X)		; FC 52 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	inc A		; 1A
	lsr $AE25.w,X		; 5E 25 AE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $01FF79.l,X		; FF 79 FF 01
	adc $0303.w,Y		; 79 03 03
	ror $3D.b,X		; 76 3D
	sbc [$FE.b]		; E7 FE
	ora $FE71FE.l,X		; 1F FE 71 FE
	sta [$79.b]		; 87 79
	sbc $03FF01.l,X		; FF 01 FF 03
	ror A		; 6A
	ror $3D.b		; 66 3D
	adc $0379.w,Y		; 79 79 03
	ora $76.b,S		; 03 76
	and $864D.w,X		; 3D 4D 86
	mvp $12,$BA		; 44 BA 12
	brk $94.b		; 00 94
	lda $E0E3.w,Y		; B9 E3 E0
	sbc $E1.b,S		; E3 E1
	sbc ($E2.b,X)		; E1 E2
	cpx #$E3.b		; E0 E3
	stx $E3.b,Y		; 96 E3
	sbc $E3FFE3.l,X		; FF E3 FF E3
	jsr ($FDE3.w,X)		; FC E3 FD
	sbc $FE.b,S		; E3 FE
	sbc ($C8.b,X)		; E1 C8
	and $9494.w,X		; 3D 94 94
	sty $B9.b,X		; 94 B9
	and $DE1C.w,X		; 3D 1C DE
	dec $DEDE.w,X		; DE DE DE
	dec $B4DE.w,X		; DE DE B4
	eor ($8F.b)		; 52 8F
	sbc $C7E761.l,X		; FF 61 E7 C7
	lda $4BE707.l,X		; BF 07 E7 4B
	sta $E761FF.l		; 8F FF 61 E7
	sbc $07B1BF.l,X		; FF BF B1 07
	pei ($3D.b)		; D4 3D
	sbc [$E7.b]		; E7 E7
	and $18EA.w,X		; 3D EA 18
	ora ($BA.b)		; 12 BA
	xce		; FB
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	beq  -5.b		; F0 FB
	jsr ($65FC.w,X)		; FC FC 65
	adc $65.b		; 65 65
	cli		; 58
	sbc ($FC.b,S),Y		; F3 FC
	pei ($3D.b)		; D4 3D
	wai		; CB
	sta ($92.b),Y		; 91 92
	clv		; B8
	clv		; B8
	ora $3F.b,S		; 03 3F
	ora $3E.b,S		; 03 3E
	cpy $F8.b		; C4 F8
	ora $23B1.w		; 0D B1 23
	ldy $C3BC.w,X		; BC BC C3
	sbc $FFC20D.l,X		; FF 0D C2 FF
	ora ($FF.b,X)		; 01 FF
	cmp [$3E.b]		; C7 3E
	ror $3D.b		; 66 3D
	adc $38.b,X		; 75 38
	sec		; 38
	nop		; EA
	trb $00.b		; 14 00
	cmp [$2D.b]		; C7 2D
	sbc $E6FFE6.l,X		; FF E6 FF E6
	inc $F9E0.w,X		; FE E0 F9
	sbc $E6.b,S		; E3 E6
	sta $3C1D0D.l		; 8F 0D 1D 3C
	ora $F972.w		; 0D 72 F9
	cpx $F7.b		; E4 F7
	inc $E6.b		; E6 E6
	inc $E7.b		; E6 E7
	cpx #$E7.b		; E0 E7
	sbc $FE.b,S		; E3 FE
	sta $E27FF9.l		; 8F F9 7F E2
	sbc $F98C0D.l,X		; FF 0D 8C F9
	clc		; 18
	and $2275.w,X		; 3D 75 22
	lda $80.b,S		; A3 80
	bra  77.b		; 80 4D
	trb $1A.b		; 14 1A
	dec A		; 3A
	txs		; 9A
	adc $0EE4.w		; 6D E4 0E
	ora $399B.w		; 0D 9B 39
	adc [$F3.b]		; 67 F3
	ora $CE9B.w		; 0D 9B CE
	ora $3C46.w		; 0D 46 3C
	bit $30F0.w,X		; 3C F0 30
	cpx #$20.b		; E0 20
	cpx #$0F.b		; E0 0F
	tda		; 7B
	and $FEE50D.l,X		; 3F 0D E5 FE
	ora $FC9A.w		; 0D 9A FC
	pla		; 68
	sed		; F8
	sta ($A1.b,X)		; 81 A1
	adc $A0.b,S		; 63 A0
	adc $807FA0.l		; 6F A0 7F 80
	bra -111.b		; 80 91
	txs		; 9A
	bit $BF.b		; 24 BF
	ora $6F64.w		; 0D 64 6F
	cmp $013EDF.l,X		; DF DF 3E 01
	ror $FC02.w,X		; 7E 02 FC
	tsb $01.b		; 04 01
	ora #$0905.w		; 09 05 09
	ora $C7.b		; 05 C7
	ora $9F.b,S		; 03 9F
	bpl  62.b		; 10 3E
	jsr $FE7E.w		; 20 7E FE
	sbc $FBFD.w,X		; FD FD FB
	xce		; FB
	ora ($F6.b,X)		; 01 F6
	ora ($F6.b,X)		; 01 F6
	eor $5E01.w		; 4D 01 5E
	inc A		; 1A
	inc A		; 1A
	stz $DF24.w		; 9C 24 DF
	ora $7F1FBF.l		; 0F BF 1F 7F
	and $B0668C.l,X		; 3F 8C 66 B0
	bcs  96.b		; B0 60
	rts		; 60

	txy		; 9B
	cpy #$80.b		; C0 80
	bra  37.b		; 80 25
	sbc $30.b		; E5 30
	ora $3B1F60.l		; 0F 60 1F 3B
	tsa		; 3B
	bra 127.b		; 80 7F
	lsr A		; 4A
	cpx #$12.b		; E0 12
	beq -90.b		; F0 A6
	plb		; AB
	plb		; AB
	tad		; 5B
	and $2D.b		; 25 2D
	eor ($FF.b)		; 52 FF
	inc $FE3D.w,X		; FE 3D FE
	sbc $FBFEFC.l,X		; FF FC FE FB
	sbc $25FCFD.l,X		; FF FD FC 25
	cmp ($01.b)		; D2 01
	lsr $0301.w,X		; 5E 01 03
	ora $07.b,S		; 03 07
	tsb $FC.b		; 04 FC
	ora $4A.b,S		; 03 4A
	eor #$07A2.w		; 49 A2 07
	sed		; F8
	asl $016E.w,X		; 1E 6E 01
	trb $5E.b		; 14 5E
	lsr $2D1A.w,X		; 5E 1A 2D
	bit #$FFFE.w		; 89 FE FF
	sta ($12.b,S),Y		; 93 12
	stx $2D.b,Y		; 96 2D
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	ora ($52.b,X)		; 01 52
	jsr ($123D.w,X)		; FC 3D 12
	ldy $2546.w		; AC 46 25
	eor $F5.b,S		; 43 F5
	sed		; F8
	ora $F135.w		; 0D 35 F1
	ora $F135.w		; 0D 35 F1
	php		; 08
	and ($18.b,S),Y		; 33 18
	adc $C6.b,S		; 63 C6
	cmp $07F4E0.l,X		; DF E0 F4 07
	xce		; FB
	ora $F3CEF3.l		; 0F F3 CE F3
	dec $E71D.w		; CE 1D E7
	sbc $3FC860.l,X		; FF 60 C8 3F
	php		; 08
	ora ($F8.b),Y		; 11 F8
	tsx		; BA
	tsx		; BA
	tsx		; BA
	ldx $A6.b		; A6 A6
	ldx $25.b		; A6 25
	eor $F2.b,S		; 43 F2
	clc		; 18
	sed		; F8
	sty $FC.b		; 84 FC
	sbc $02.b,S		; E3 02
	asl $07.b,X		; 16 07
	mvp $3D,$07		; 44 07 3D
	sed		; F8
	sbc $1FFF5C.l		; EF 5C FF 1F
	sbc $2D3DFD.l,X		; FF FD 3D 2D
	ora ($80.b,X)		; 01 80
	and $A18B.w,X		; 3D 8B A1
	clc		; 18
	pla		; 68
	asl $0D.b		; 06 0D
	and ($01.b)		; 32 01
	ora $801D.w		; 0D 1D 80
	asl $FF80.w		; 0E 80 FF
	txs		; 9A
	stx $6F.b,Y		; 96 6F
	bpl  31.b		; 10 1F
	bra -113.b		; 80 8F
	cpx #$83.b		; E0 83
	beq -127.b		; F0 81
	sed		; F8
	plb		; AB
	adc $188B96.l,X		; 7F 96 8B 18
	cpx #$83.b		; E0 83
	adc $3F40.w,X		; 7D 40 3F
	jsr $989F.w		; 20 9F 98
	eor [$0D.b]		; 47 0D
	eor ($3F.b),Y		; 51 3F
	and $3DE7.w,X		; 3D E7 3D
	pld		; 2B
	lsr A		; 4A
	brk $0D.b		; 00 0D
	clv		; B8
	brk $E1.b		; 00 E1
	ora $FFEFEF.l		; 0F EF EF FF
	sbc [$8B.b]		; E7 8B
	sec		; 38
	jsr ($1F0F.w,X)		; FC 0F 1F
	ora $8361.w		; 0D 61 83
	trb $2DE4.w		; 1C E4 2D
	phk		; 4B
	inc $DFC7.w,X		; FE C7 DF
	bmi  -5.b		; 30 FB
	asl $FB.b		; 06 FB
	ldy $52.b,X		; B4 52
	cld		; D8
	ror $8601.w,X		; 7E 01 86
	cmp ($F0.b,X)		; C1 F0
	jsr ($12B2.w,X)		; FC B2 12
	eor ($2D.b)		; 52 2D
	and $C1.b,S		; 23 C1
	sbc $7D.b,S		; E3 7D
	inc $7F0F.w,X		; FE 0F 7F
	cpy #$80.b		; C0 80
	adc $B22D52.l,X		; 7F 52 2D B2
	ora $03.b,S		; 03 03
	nop		; EA
	plb		; AB
	mvp $C5,$46		; 44 46 C5
	cmp $D0.b		; C5 D0
	rol $0E11.w		; 2E 11 0E
	ora ($52.b)		; 12 52
	and $C6C6.w		; 2D C6 C6
	clc		; 18
	sta ($0D.b,X)		; 81 0D
	sbc #$2DF0.w		; E9 F0 2D
	eor ($FE.b)		; 52 FE
	sta ($8D.b)		; 92 8D
	adc $5BEA76.l,X		; 7F 76 EA 5B
	tsx		; BA
	phy		; 5A
	asl $08F1.w		; 0E F1 08
	sbc [$0D.b],Y		; F7 0D
	stx $8871.w		; 8E 71 88
	eor [$40.b],Y		; 57 40
	adc $1E4A36.l,X		; 7F 36 4A 1E
	brk $C6.b		; 00 C6
	ora $008E.w		; 0D 8E 00
	tay		; A8
	tad		; 5B
	plb		; AB
	cpx #$5B.b		; E0 5B
	ora ($BE.b)		; 12 BE
	lda $9B.b,S		; A3 9B
	eor $3A3A.w		; 4D 3A 3A
	dec A		; 3A
	eor $DF5A.w,Y		; 59 5A DF
	ora $0D21.w		; 0D 21 0D
	cmp [$0D.b],Y		; D7 0D
	and #$D70D.w		; 29 0D D7
	ora $5F29.w		; 0D 29 5F
	lda ($D3.b,X)		; A1 D3
	cmp ($0D.b,S),Y		; D3 0D
	dec $0D01.w,X		; DE 01 0D
	dec $01.b,X		; D6 01
	ora $01D6.w		; 0D D6 01
	ora $6B5E.w		; 0D 5E 6B
	rtl		; 6B

	rtl		; 6B

	rtl		; 6B

	ora ($8B.b,X)		; 01 8B
	eor ($51.b),Y		; 51 51
	ora [$8E.b]		; 07 8E
	inc A		; 1A
	stx $8E1A.w		; 8E 1A 8E
	brk $06.b		; 00 06
	stx $4E00.w		; 8E 00 4E
	lsr $6262.w		; 4E 62 62
	dey		; 88
	cmp [$12.b],Y		; D7 12
	cmp [$12.b],Y		; D7 12
	brk $0D.b		; 00 0D
	mvp $5A,$25		; 44 25 5A
	phy		; 5A
	lda #$920F.w		; A9 0F 92
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	sta $0F5F0F.l		; 8F 0F 5F 0F
	asl $0D0F.w		; 0E 0F 0D
	lsr $0E0F.w,X		; 5E 0F 0E
	ora $0F4E0D.l		; 0F 0D 4E 0F
	asl $0E0F.w		; 0E 0F 0E
	ora $62EBEB.l		; 0F EB EB 62
	sbc $02F220.l,X		; FF 20 F2 02
	adc ($72.b)		; 72 72
	adc ($72.b)		; 72 72
	adc ($72.b)		; 72 72
	adc ($00.b),Y		; 71 00
	cop $FD.b		; 02 FD
	stp		; DB
	stp		; DB
	stp		; DB
	stp		; DB
	stp		; DB
	stp		; DB
	and ($62.b)		; 32 62
	txa		; 8A
	dec $D6.b,X		; D6 D6
	dec $D6.b,X		; D6 D6
	dec $D6.b,X		; D6 D6
	eor ($61.b,S),Y		; 53 61
	adc ($61.b,X)		; 61 61
	adc ($61.b,X)		; 61 61
	adc [$32.b],Y		; 77 32
	tyx		; BB
	and ($32.b)		; 32 32
	and ($62.b)		; 32 62
	and ($D4.b)		; 32 D4
	and $D4FE.w,X		; 3D FE D4
	stx $75.b,Y		; 96 75
	sta ($14.b),Y		; 91 14
	ror $96.b		; 66 96
	sbc $EFF7.w,X		; FD F7 EF
	ora $7F9C.w		; 0D 9C 7F
	ror $FE.b		; 66 FE
	sbc $97FDF3.l,X		; FF F3 FD 97
	sbc $5FBC0D.l		; EF 0D BC 5F
	ror $75.b		; 66 75
	wai		; CB
	bra -128.b		; 80 80
	and ($14.b),Y		; 31 14
	sta ($9A.b)		; 92 9A
	and $FD4B.w		; 2D 4B FD
	sbc ($6F.b,S),Y		; F3 6F
	ora $C60D3D.l,X		; 1F 3D 0D C6
	plx		; FA
	ora [$F0.b]		; 07 F0
	eor ($B3.b)		; 52 B3
	cmp $EFF3.w		; CD F3 EF
	ora $C0FD3D.l,X		; 1F 3D FD C0
	php		; 08
	bra  82.b		; 80 52
	jsr ($9BFC.w,X)		; FC FC 9B
	nop		; EA
	lsr $5A59.w,X		; 5E 59 5A
	stx $FC.b,Y		; 96 FC
	sbc ($8F.b,S),Y		; F3 8F
	eor ($FD.b)		; 52 FD
	adc $FF01FD.l,X		; 7F FD 01 FF
	ldx $E3FF.w		; AE FF E3
	jsr ($8F73.w,X)		; FC 73 8F
	eor ($83.b)		; 52 83
	rtl		; 6B

	ora ($FC.b)		; 12 FC
	adc $A3.b,X		; 75 A3
	nop		; EA
	trb $3A.b		; 14 3A
	lsr $0D.b		; 46 0D
	jmp.w [$CFC3]		; DC C3 CF
	and $E03652.l,X		; 3F 52 36 E0
	sbc $A07F80.l,X		; FF 80 7F A0
	and $CFC33C.l,X		; 3F 3C C3 CF
	and $E03652.l,X		; 3F 52 36 E0
	iny		; C8
	ora $8B0F50.l,X		; 1F 50 0F 8B
	ora [$F7.b],Y		; 17 F7
	cmp $68FF52.l		; CF 52 FF 68
	sta [$48.b],Y		; 97 48
	lda [$68.b],Y		; B7 68
	lda [$0D.b],Y		; B7 0D
	adc ($DF.b,X)		; 61 DF
	ora $CFD80D.l		; 0F 0D D8 CF
	eor ($FF.b)		; 52 FF
	sei		; 78
	sbc $78FF78.l,X		; FF 78 FF 78
	cmp $0DD871.l,X		; DF 71 D8 0D
	txa		; 8A
	sbc $EFFBC3.l		; EF C3 FB EF
	sbc $A0FFD0.l,X		; FF D0 FF A0
	sbc $FF4036.l,X		; FF 36 40 FF
	bra  -1.b		; 80 FF
	sed		; F8
	jmp ($F8C4.w,X)		; 7C C4 F8
	cpx #$F0.b		; E0 F0
	cpy $E8.b		; C4 E8
	bra -49.b		; 80 CF
	bcc -113.b		; 90 8F
	ora $351F80.l,X		; 1F 80 1F 35
	ldx $9F.b		; A6 9F
	bra  61.b		; 80 3D
	cmp #$609A.w		; C9 9A 60
	txs		; 9A
	adc $164A3A.l,X		; 7F 3A 4A 16
	and $13.b,X		; 35 13
	php		; 08
	inc $3D03.w,X		; FE 03 3D
	cmp #$EF00.w		; C9 00 EF
	ora ($3D.b)		; 12 3D
	lsr A		; 4A
	rol $FEC0.w,X		; 3E C0 FE
	sbc $0C.b		; E5 0C
	.db $62, $43, $FF		; 62 43 FF
	txs		; 9A
	stx $2D.b,Y		; 96 2D
	ora $7F5AF0.l		; 0F F0 5A 7F
	stx $2D.b,Y		; 96 2D
	cmp $034425.l		; CF 25 44 03
	phb		; 8B
	inc $5203.w,X		; FE 03 52
	and $3FFF.w		; 2D FF 3F
	adc $525B.w		; 6D 5B 52
	jmp ($C080.w,X)		; 7C 80 C0
	and $59.b		; 25 59
	cpy #$8B.b		; C0 8B
	adc $60C852.l,X		; 7F 52 C8 60
	and $5C6D.w,X		; 3D 6D 5C
	eor ($9F.b)		; 52 9F
	ror $35BA.w		; 6E BA 35
	stx $F7.b,Y		; 96 F7
	ora $FFC8.w		; 0D C8 FF
	ora ($3D.b)		; 12 3D
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	sbc [$1D.b],Y		; F7 1D
	sbc [$C1.b],Y		; F7 C1
	inc $FF.b,X		; F6 FF
	ora ($10.b)		; 12 10
	.db $62, $6E, $5A		; 62 6E 5A
	phy		; 5A
	and $16F0.w,X		; 3D F0 16
	jsr $A03F.w		; 20 3F A0
	lda $E0BFA0.l,X		; BF A0 BF E0
	iny		; C8
	stx $F7.b,Y		; 96 F7
	jsl $4000AB.l		; 22 AB 00 40
	bmi  64.b		; 30 40
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi -117.b		; 30 8B
	and $9624.w,X		; 3D 24 96
	.db $62, $91, $43		; 62 91 43
	php		; 08
	sbc $04F902.l,X		; FF 02 F9 04
	sbc $4AAE.w,Y		; F9 AE 4A
	phx		; DA
	ora [$FA.b]		; 07 FA
	and ($C0.b,S),Y		; 33 C0
	ora $0016.w		; 0D 16 00
	asl $14.b		; 06 14
	and $00.b		; 25 00
	cop $01.b		; 02 01
	tsb $02.b		; 04 02
	phb		; 8B
	adc $F010.w		; 6D 10 F0
	eor $16C02D.l		; 4F 2D C0 16
	ldx $9225.w		; AE 25 92
	tsx		; BA
	ora ($C0.b)		; 12 C0
	.db $62, $25, $5A		; 62 25 5A
	bit $23.b		; 24 23
	and $FF3FF8.l,X		; 3F F8 3F FF
	asl $02FE.w		; 0E FE 02
	sbc $C7006E.l,X		; FF 6E 00 C7
	ora $00.b,S		; 03 00
	and ($01.b,S),Y		; 33 01
	tsb $A96B.w		; 0C 6B A9
	phy		; 5A
	bit $F0.b		; 24 F0
	asl $16.b,X		; 16 16
	bra  -1.b		; 80 FF
	cpy #$25.b		; C0 25
	inc $FEBA.w,X		; FE BA FE
	clc		; 18
	cpx #$FF.b		; E0 FF
	txs		; 9A
	eor $8B80.w,Y		; 59 80 8B
	adc $FF0A.w		; 6D 0A FF
	ora $FF.b		; 05 FF
	sbc $0F.b,X		; F5 0F
	sbc $0F.b,X		; F5 0F
	beq  15.b		; F0 0F
	ror $058E.w		; 6E 8E 05
	ora $F5.b		; 05 F5
	ora $F5.b		; 05 F5
	ora $F0.b		; 05 F0
	ora $8B.b		; 05 8B
	cmp ($DA.b,S),Y		; D3 DA
	sbc $FD57FD.l,X		; FF FD 57 FD
	eor [$FD.b],Y		; 57 FD
	eor [$FD.b],Y		; 57 FD
	phx		; DA
	cop $6B.b		; 02 6B
	rtl		; 6B

	ora ($56.b,X)		; 01 56
	eor $56.b,X		; 55 56
	eor $56.b,X		; 55 56
	eor $56.b,X		; 55 56
	eor $02.b,X		; 55 02
	eor $8B.b,X		; 55 8B
	eor ($51.b),Y		; 51 51
	tsb $8E.b		; 04 8E
	brk $04.b		; 00 04
	stx $0400.w		; 8E 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $4E.b		; 00 4E
	lsr $A962.w		; 4E 62 A9
	rol A		; 2A
	rol A		; 2A
	ora ($AA.b)		; 12 AA
	tax		; AA
	ora ($11.b),Y		; 11 11
	tax		; AA
	tax		; AA
	cmp $D5.b,X		; D5 D5
	tax		; AA
	tax		; AA
	sbc $2DD500.l,X		; FF 00 D5 2D
	cmp [$00.b],Y		; D7 00
	inc $00D7.w		; EE D7 00
	rol A		; 2A
	cmp [$62.b],Y		; D7 62
	trb $0E.b		; 14 0E
	ora $073F02.l,X		; 1F 02 3F 07
	ora $05.b		; 05 05
	brk $0D.b		; 00 0D
	bit $1505.w		; 2C 05 15
	asl A		; 0A
	rol $0C00.w		; 2E 00 0C
	asl $3C0F.w		; 0E 0F 3C
	ora $3821.w		; 0D 21 38
	brk $85.b		; 00 85
	ora $59BA.w		; 0D BA 59
	sta $0D.b		; 85 0D
	tsx		; BA
	ora $F5CA.w		; 0D CA F5
	bra -65.b		; 80 BF
	ror A		; 6A
	cmp $3FFF1F.l,X		; DF 1F FF 3F
	adc $3FFF3F.l,X		; 7F 3F FF 3F
	adc $7F3FB2.l,X		; 7F B2 3F 7F
	and $727262.l,X		; 3F 62 72 72
	ora $0D1A.w		; 0D 1A 0D
	eor $BF.b,S		; 43 BF
	lda $BF8C3D.l,X		; BF 3D 8C BF
	lda $DBDB3D.l,X		; BF 3D DB DB
	sbc $FC.b,S		; E3 FC
	lda $9AFF40.l,X		; BF 40 FF 9A
	bra -65.b		; 80 BF
	rti		; 40

	asl $D4.b,X		; 16 D4
	stx $62.b,Y		; 96 62
	dec $F8.b,X		; D6 F8
	sei		; 78
	jmp $613D66.l		; 5C 66 3D 61
	bra   7.b		; 80 07
	bra  70.b		; 80 46
	pei ($96.b)		; D4 96
	.db $62, $3D, $12		; 62 3D 12
	eor ($FA.b)		; 52 FA
	sbc $F3FF.w,Y		; F9 FF F3
	inc $A8E7.w,X		; FE E7 A8
	sta $122D3D.l,X		; 9F 3D 2D 12
	jsr ($F603.w,X)		; FC 03 F6
	ora #$13EF.w		; 09 EF 13
	ora $27DE.w		; 0D DE 27
	inx		; E8
	asl $FC4B.w,X		; 1E 4B FC
	jsr ($A3CB.w,X)		; FC CB A3
	txy		; 9B
	bra -128.b		; 80 80
	ror $925E.w		; 6E 5E 92
	dec A		; 3A
	eor $FE9A.w,Y		; 59 9A FE
	sbc $3739.w,X		; FD 39 37
	ora $9FEC.w		; 0D EC 9F
	ldy #$7F.b		; A0 7F
	rol $6D.b,X		; 36 6D
	sbc ($FD.b)		; F2 FD
	ora #$6CF7.w		; 09 F7 6C
	sta $C07EA0.l,X		; 9F A0 7E C0
	beq -85.b		; F0 AB
	and $CB.b		; 25 CB
	txy		; 9B
	nop		; EA
	sta ($59.b)		; 92 59
	lsr $70.b		; 46 70
	sbc $DA16C0.l,X		; FF C0 16 DA
	ora $FF.b,S		; 03 FF
	ora [$FE.b]		; 07 FE
	eor [$FE.b]		; 47 FE
	sbc [$FC.b]		; E7 FC
	bvs  -6.b		; 70 FA
	cpy #$F0.b		; C0 F0
	tad		; 5B
	cop $12.b		; 02 12
	ora ($00.b,X)		; 01 00
	ora $4042.w		; 0D 42 40
	sep #$40		; E2 40
	ora $8B44.w		; 0D 44 8B
	and $367FE0.l,X		; 3F E0 7F 36
	bra  -8.b		; 80 F8
	bra -16.b		; 80 F0
	ldx $00.b		; A6 00
	cmp ($00.b,X)		; C1 00
	cmp $12.b,S		; C3 12
	and $00.b,S		; 23 00
	ora $004C.w		; 0D 4C 00
	ora [$03.b],Y		; 17 03
	lda $085F04.l		; AF 04 5F 08
	and $7F140D.l,X		; 3F 0D 14 7F
	ora $7F24.w		; 0D 24 7F
	phb		; 8B
	asl $5E.b,X		; 16 5E
	and $00.b		; 25 00
	sty $00.b		; 84 00
	stx $00.b		; 86 00
	sta [$78.b]		; 87 78
	sbc $FD.b		; E5 FD
	lda ($03.b,S),Y		; B3 03
	asl $95.b,X		; 16 95
	sta $78.b,X		; 95 78
	cld		; D8
	beq  31.b		; F0 1F
	sed		; F8
	ora $7C05FE.l		; 0F FE 05 7C
	ora ($3E.b,X)		; 01 3E
	dec A		; 3A
	ora ($0F.b,X)		; 01 0F
	sta ($00.b)		; 92 00
	tsb $0713.w		; 0C 13 07
	ora $02C8.w		; 0D C8 02
	cpx $02.b		; E4 02
	bne -127.b		; D0 81
	inx		; E8
	rti		; 40

	sbc $A0.b,X		; F5 A0
	sed		; F8
	bcc  -8.b		; 90 F8
	phb		; 8B
	and $9516.w,Y		; 39 16 95
	sta $80.b,X		; 95 80
	eor $FFB0EF.l		; 4F EF B0 FF
	bcs -106.b		; B0 96
	and $01FE.w,Y		; 39 FE 01
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	bcc  48.b		; 90 30
	adc $B04F10.l,X		; 7F 10 4F B0
	and $E08B.w		; 2D 8B E0
	sta $9EFF3B.l,X		; 9F 3B FF 9E
	stz $3DC0.w,X		; 9E C0 3D
	rts		; 60

	plb		; AB
	eor $5959.w,Y		; 59 59 59
	eor $BD59.w,Y		; 59 59 BD
	lsr A		; 4A
	sbc $25FFC9.l,X		; FF C9 FF 25
	sbc $4ABD5A.l,X		; FF 5A BD 4A
	sbc $03FFC9.l,X		; FF C9 FF 03
	ora ($C9.b)		; 12 C9
	lda $FF4A.w,X		; BD 4A FF
	cmp #$123D.w		; C9 3D 12
	cmp #$4ABD.w		; C9 BD 4A
	sbc $3BFFC9.l,X		; FF C9 FF 3B
	ora ($C9.b,X)		; 01 C9
	lda $102D.w,X		; BD 2D 10
	and $5CC9.w,X		; 3D C9 5C
	bra  13.b		; 80 0D
	sta ($7C.b,S),Y		; 93 7C
	sbc $10BD5A.l,X		; FF 5A BD 10
	asl $C7.b,X		; 16 C7
	and $DF00FF.l,X		; 3F FF 00 DF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	and $EFFF.w		; 2D FF EF
	brk $EF.b		; 00 EF
	brk $E7.b		; 00 E7
	ora $60BDD9.l,X		; 1F D9 BD 60
	lda $8FBF60.l,X		; BF 60 BF 8F
	cli		; 58
	phy		; 5A
	sbc $C030C0.l,X		; FF C0 30 C0
	bmi -81.b		; 30 AF
	rol $6D.b,X		; 36 6D
	lda $FF4A.w,X		; BD 4A FF
	lsr A		; 4A
	tad		; 5B
	lsr A		; 4A
	sbc $4AFF25.l,X		; FF 25 FF 4A
	brk $C1.b		; 00 C1
	rol $BDFF.w,X		; 3E FF BD
	ora $E81FF4.l		; 0F F4 1F E8
	sbc $10DF30.l,X		; FF 30 DF 10
	sbc $BE0D60.l,X		; FF 60 0D BE
	jsr $40FC.w		; 20 FC 40
	jsr ($08C0.w,X)		; FC C0 08
	tsb $DC.b		; 04 DC
	cpy #$10.b		; C0 10
	cpx #$10.b		; E0 10
	bra  13.b		; 80 0D
	and ($C0.b,X)		; 21 C0
	and $81.b,S		; 23 81
	eor [$02.b]		; 47 02
	cmp [$8B.b]		; C7 8B
	asl $BA.b,X		; 16 BA
	tad		; 5B
	ora ($00.b)		; 12 00
	php		; 08
	brk $C6.b		; 00 C6
	sec		; 38
	ora [$12.b]		; 07 12
	sta ($0F.b)		; 92 0F
	adc $FF4095.l,X		; 7F 95 40 FF
	sta $FF.b,S		; 83 FF
	ora $FF43.w		; 0D 43 FF
	eor [$D8.b]		; 47 D8
	asl $59.b,X		; 16 59
	inc A		; 1A
	lsr $4100.w,X		; 5E 00 41
	brk $60.b		; 00 60
	brk $70.b		; 00 70
	bra  18.b		; 80 12
	plb		; AB
	cpy #$F8.b		; C0 F8
	bmi  -4.b		; 30 FC
	php		; 08
	inc $FF04.w,X		; FE 04 FF
	asl A		; 0A
	sbc $D8890D.l,X		; FF 0D 89 D8
	sbc $95FF60.l,X		; FF 60 FF 95
	ora $8D17F7.l,X		; 1F F7 17 8D
	xce		; FB
	phd		; 0B
	sbc $401F07.l,X		; FF 07 1F 40
	ora $DC0020.l		; 0F 20 00 DC
	bpl   0.b		; 10 00
	php		; 08
	brk $08.b		; 00 08
	tsb $88.b		; 04 88
	brk $87.b		; 00 87
	phb		; 8B
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	adc $F5.b		; 65 F5
	eor ($96.b)		; 52 96
	beq   5.b		; F0 05
	beq   5.b		; F0 05
	stx $008E.w		; 8E 8E 00
	asl A		; 0A
	and $2D.b		; 25 2D
	phb		; 8B
	cmp ($D3.b,S),Y		; D3 D3
	eor [$FD.b],Y		; 57 FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	and $5502.w,X		; 3D 02 55
	cop $55.b		; 02 55
	cop $55.b		; 02 55
	cop $55.b		; 02 55
	cop $A1.b		; 02 A1
	cop $6B.b		; 02 6B
	cmp ($FE.b)		; D2 FE
	sta ($D2.b),Y		; 91 D2
	bit $AE.b		; 24 AE
	sta $03FF.w,X		; 9D FF 03
	pei ($04.b)		; D4 04
	mvp $C9,$12		; 44 12 C9
	brk $74.b		; 00 74
	ora $D4.b,S		; 03 D4
	sbc $FCFCA9.l,X		; FF A9 FC FC
	adc $68.b,X		; 75 68
	pla		; 68
	cpy #$CD.b		; C0 CD
	tay		; A8
	tax		; AA
	mvn $5D,$0D		; 54 0D 5D
	cpy #$CC.b		; C0 CC
	ora ($02.b)		; 12 02
	cop $12.b		; 02 12
	pla		; 68
	sta [$3B.b],Y		; 97 3B
	tay		; A8
	eor [$54.b],Y		; 57 54
	ora $3BAB.w		; 0D AB 3B
	sbc $B3FD00.l,X		; FF 00 FD B3
	inc $3D66.w,X		; FE 66 3D
	.db $62, $62, $8C		; 62 62 8C
	ora $0DBB.w		; 0D BB 0D
	tyx		; BB
	phk		; 4B
	cmp $5596.w,X		; DD 96 55
	sbc $0D0080.l,X		; FF 80 00 0D
	mvp $EA,$62		; 44 62 EA
	stx $350D.w		; 8E 0D 35
	cop $2A.b		; 02 2A
	asl A		; 0A
	asl $0A02.w,X		; 1E 02 0A
	ora #$6E09.w		; 09 09 6E
	ora $0D45.w		; 0D 45 0D
	ply		; 7A
	.db $82, $0D, $BD		; 82 0D BD
	ora $F5CA.w		; 0D CA F5
	ora $FDC2.w		; 0D C2 FD
	ora $F6E9.w		; 0D E9 F6
	cmp $5596.w,X		; DD 96 55
	sbc $7F3FBF.l,X		; FF BF 3F 7F
	lda ($B2.b)		; B2 B2
	and $621F1F.l,X		; 3F 1F 1F 62
	ror $3DB2.w		; 6E B2 3D
	sty $BFBF.w		; 8C BF BF
	sty $3F6E.w		; 8C 6E 3F
	rol $9A.b,X		; 36 9A
	bra -65.b		; 80 BF
	rti		; 40

	adc $96DD80.l,X		; 7F 80 DD 96
	eor $66.b,X		; 55 66
	stx $62.b,Y		; 96 62
	ror $3D66.w		; 6E 66 3D
	ror $5AFF.w		; 6E FF 5A
	brk $DD.b		; 00 DD
	stx $55.b,Y		; 96 55
	ror $96.b		; 66 96
	.db $62, $6E, $80		; 62 6E 80
	adc $F9F92D.l,X		; 7F 2D F9 F9
	sbc [$F5.b],Y		; F7 F5
	cpx #$FF.b		; E0 FF
	rol $7F.b,X		; 36 7F
	rti		; 40

	adc $6080FF.l,X		; 7F FF 80 60
	tad		; 5B
	dex		; CA
	asl A		; 0A
	beq  18.b		; F0 12
	tad		; 5B
	lda $8B8012.l,X		; BF 12 80 8B
	and $FC02.w		; 2D 02 FC
	sbc $6DFC.w,X		; FD FC 6D
	asl $FF.b,X		; 16 FF
	ora ($03.b)		; 12 03
	brk $74.b		; 00 74
	ror $25BB.w		; 6E BB 25
	eor $0F.b,S		; 43 0F
	ldy $0FF8.w		; AC F8 0F
	sed		; F8
	ora $F80FF8.l		; 0F F8 0F F8
	ora [$58.b]		; 07 58
	clc		; 18
	sbc [$F0.b],Y		; F7 F0
	ora ($42.b)		; 12 42
	trb $14.b		; 14 14
	trb $08.b		; 14 08
	ora ($E0.b,X)		; 01 E0
	ora #$0800.w		; 09 00 08
	phb		; 8B
	sta $08.b,S		; 83 08
	stx $19.b		; 86 19
	ora $1F8C.w		; 0D 8C 1F
	ora [$37.b]		; 07 37
	ora ($0D.b,X)		; 01 0D
	and ($84.b),Y		; 31 84
	adc ($0D.b),Y		; 71 0D
	ldx $50.b		; A6 50
	ora $11A6.w		; 0D A6 11
	plp		; 28
	sbc $5FFF39.l,X		; FF 39 FF 5F
	sbc ($7F.b,S),Y		; F3 7F
	sed		; F8
	adc ($FE.b,S),Y		; 73 FE
	adc ($FF.b),Y		; 71 FF
	adc ($FF.b),Y		; 71 FF
	adc ($D8.b),Y		; 71 D8
	tda		; 7B
	jsr ($FE79.w,X)		; FC 79 FE
	cpy $B7FF.w		; CC FF B7
	sbc $EEB60D.l,X		; FF 0D B6 EE
	ora $CEB4.w		; 0D B4 CE
	cmp $FD78.w		; CD 78 FD
	cop $FC.b		; 02 FC
	sta [$FE.b]		; 87 FE
	sta [$FF.b]		; 87 FF
	and ($FF.b,S),Y		; 33 FF
	pha		; 48
	sbc $FE590D.l,X		; FF 0D 59 FE
	tda		; 7B
	inc $FEB7.w,X		; FE B7 FE
	cld		; D8
	ora [$40.b]		; 07 40
	sta [$60.b]		; 87 60
	cmp [$E0.b]		; C7 E0
	sta $B0.b,S		; 83 B0
	ora $30.b,S		; 03 30
	sta [$38.b]		; 87 38
	sta [$28.b],Y		; 97 28
	sta [$20.b],Y		; 97 20
	bvc  -4.b		; 50 FC
	bvs  -4.b		; 70 FC
	inx		; E8
	rol $7EF8.w,X		; 3E F8 7E
	sec		; 38
	inc $FE38.w,X		; FE 38 FE
	sec		; 38
	inc $FC38.w,X		; FE 38 FC
	phb		; 8B
	bit #$BF5C.w		; 89 5C BF
	and $BF3FBF.l,X		; 3F BF 3F BF
	and $40C05C.l,X		; 3F 5C C0 40
	ror $0040.w		; 6E 40 00
	rti		; 40

	brk $40.b		; 00 40
	ora ($40.b)		; 12 40
	and $B28B40.l,X		; 3F 40 8B B2
	lda ($B2.b)		; B2 B2
	lda ($3F.b)		; B2 3F
	ora $1F0F3F.l,X		; 1F 3F 0F 1F
	ora [$9F.b]		; 07 9F
	bra -64.b		; 80 C0
	plb		; AB
	plb		; AB
	plb		; AB
	ldx $BA.b		; A6 BA
	.db $42, $9A		; 42 9A
	bra -117.b		; 80 8B
	pei ($96.b)		; D4 96
	sta ($2D.b),Y		; 91 2D
	and $D4.b,X		; 35 D4
	adc $FB.b,X		; 75 FB
	php		; 08
	nop		; EA
	ora ($00.b,X)		; 01 00
	sbc [$35.b],Y		; F7 35
	lda $BFBFBF.l,X		; BF BF BF BF
	lda ($8C.b)		; B2 8C
	ror $B97E.w,X		; 7E 7E B9
	stz $4000.w		; 9C 00 40
	brk $40.b		; 00 40
	plb		; AB
	tad		; 5B
	brk $81.b		; 00 81
	dec $1603.w,X		; DE 03 16
	and $4B.b,X		; 35 4B
	cmp [$C7.b]		; C7 C7
	sty $E1E1.w		; 8C E1 E1
	cmp ($07.b)		; D2 07
	xce		; FB
	ror $0738.w		; 6E 38 07
	bra 127.b		; 80 7F
	asl $01DB.w,X		; 1E DB 01
	jsr ($8B01.w,X)		; FC 01 8B
	pei ($96.b)		; D4 96
	bra 110.b		; 80 6E
	tad		; 5B
	tad		; 5B
	tad		; 5B
	tad		; 5B
	adc $788B80.l,X		; 7F 80 8B 78
	brk $78.b		; 00 78
	ora ($78.b,X)		; 01 78
	ora ($70.b,X)		; 01 70
	ora $F0.b,S		; 03 F0
	sta $F8.b,S		; 83 F8
	sta [$FA.b]		; 87 FA
	sta $0D.b		; 85 0D
	ply		; 7A
	ora ($82.b,X)		; 01 82
	ora $850F83.l		; 0F 83 0F 85
	ora $071F87.l,X		; 1F 87 1F 07
	sta $079F07.l,X		; 9F 07 9F 07
	sta $8B8F07.l,X		; 9F 07 8F 8B
	and [$8F.b],Y		; 37 8F
	adc [$9F.b]		; 67 9F
	cpy $7BFF.w		; CC FF 7B
	adc $0D1E1B.l,X		; 7F 1B 1E 0D
	phk		; 4B
	trb $076C.w		; 1C 6C 07
	adc $F88F10.l		; 6F 10 8F F8
	sta $FF33AC.l,X		; 9F AC 33 FF
	sty $3F.b		; 84 3F
	ora $1FE5.w		; 0D E5 1F
	sbc [$1F.b],Y		; F7 1F
	xce		; FB
	ora $C4B0D8.l,X		; 1F D8 B0 C4
	tya		; 98
	inc $CC.b		; E6 CC
	inc $FB78.w,X		; FE 78 FB
	rts		; 60

	sbc $48.b,S		; E3 48
	sbc $0D.b,S		; E3 0D
	cmp $0D82.w,Y		; D9 82 0D
	cmp $220D.w,Y		; D9 0D 22
	ora $7FC5.w		; 0D C5 7F
	sbc [$7F.b]		; E7 7F
	inc $FF33.w,X		; FE 33 FF
	sta [$F3.b]		; 87 F3
	sta $E3BFE3.l,X		; 9F E3 BF E3
	adc $7FD8E3.l,X		; 7F E3 D8 7F
	ora [$7F.b]		; 07 7F
	ora [$7D.b]		; 07 7D
	ora $3F.b		; 05 3F
	ora $3E.b,S		; 03 3E
	cop $7C.b		; 02 7C
	bra 125.b		; 80 7D
	sta ($7D.b,X)		; 81 7D
	ora ($00.b,X)		; 01 00
	cpy $00.b		; C4 00
	cpy $82.b		; C4 82
	cpx $80.b		; E4 80
	sep #$81		; E2 81
	sep #$81		; E2 81
	sep #$80		; E2 80
	sbc $80.b,S		; E3 80
	cmp $8B.b,S		; C3 8B
	phk		; 4B
	adc $91.b,X		; 75 91
	ora ($5A.b,X)		; 01 5A
	and $FD.b,X		; 35 FD
	sbc $FDFD.w,X		; FD FD FD
	lda [$D2.b]		; A7 D2
	cmp ($25.b)		; D2 25
	cop $02.b		; 02 02
	ora $5E.b,S		; 03 5E
	sta ($6D.b)		; 92 6D
	ora ($FF.b,X)		; 01 FF
	ora ($FD.b,X)		; 01 FD
	ora $D2.b,S		; 03 D2
	cmp ($D2.b)		; D2 D2
	cmp ($D2.b)		; D2 D2
	ror $9393.w		; 6E 93 93
	sta ($93.b,S),Y		; 93 93
	plp		; 28
	ora $D02B.w		; 0D 2B D0
	cmp $0D.b,X		; D5 0D
	sty $0D.b,X		; 94 0D
	stz $5450.w,X		; 9E 50 54
	ldy $A4.b		; A4 A4
	ror $0D28.w		; 6E 28 0D
	cmp [$C5.b],Y		; D7 C5
	ora $0D94.w		; 0D 94 0D
	rtl		; 6B

	bvc -81.b		; 50 AF
	ora $0DA5.w		; 0D A5 0D
	tad		; 5B
	cmp $5596.w,X		; DD 96 55
	ror $FF.b		; 66 FF
	adc $62.b,X		; 75 62
	.db $62, $6E, $EE		; 62 6E EE
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $151655.l,X		; FF 55 16 15
	tyx		; BB
	.db $62, $7F, $FF		; 62 7F FF
	rti		; 40

	txy		; 9B
	cpy #$12.b		; C0 12
	rti		; 40

	rti		; 40

	and $07.b		; 25 07
	ora ($80.b)		; 12 80
	lda $BFE559.l,X		; BF 59 E5 BF
	cpy #$55.b		; C0 55
	asl $10.b,X		; 16 10
	sed		; F8
	adc #$259A.w		; 69 9A 25
	inc A		; 1A
	and $FFEA.w,X		; 3D EA FF
	ora ($5A.b)		; 12 5A
	cmp [$16.b],Y		; D7 16
	lda #$25C9.w		; A9 C9 25
	and $E0E7.w		; 2D E7 E0
	ora [$5E.b]		; 07 5E
	lsr $1414.w,X		; 5E 14 14
	ldy $00.b,X		; B4 00
	jmp.w [$08F0]		; DC F0 08
	beq  12.b		; F0 0C
	pea $F00C.w		; F4 0C F0
	asl $FE54.w		; 0E 54 FE
	and $6DA9.w		; 2D A9 6D
	brk $FB.b		; 00 FB
	brk $F9.b		; 00 F9
	trb $B4.b		; 14 B4
	ora $0BB1.w		; 0D B1 0B
	ora $2AD3.w		; 0D D3 2A
	cmp $0BE610.l		; CF 10 E6 0B
	sbc ($0E.b),Y		; F1 0E
	sbc $FE03.w,Y		; F9 03 FE
	sbc $0D.b		; E5 0D
	tsa		; 3B
	inc $FD3F.w,X		; FE 3F FD
	and $7D1F7F.l,X		; 3F 7F 1F 7D
	ora $1E033F.l		; 0F 3F 03 1E
	sta ($5E.b)		; 92 5E
	phb		; 8B
	inc $CF33.w,X		; FE 33 CF
	ora $3349.w		; 0D 49 33
	sty $79.b		; 84 79
	ora $02.b,S		; 03 02
	sta $FE.b		; 85 FE
	ora $79.b,S		; 03 79
	jsr ($2D03.w,X)		; FC 03 2D
	cmp $0DFF.w		; CD FF 0D
	ldx $CF.b,Y		; B6 CF
	sbc $CFFE03.l,X		; FF 03 FE CF
	and $FCFD.w,X		; 3D FD FC
	sta [$2D.b]		; 87 2D
	phb		; 8B
	and [$40.b],Y		; 37 40
	and $20CF50.l		; 2F 50 CF 20
	sta $C03F40.l,X		; 9F 40 3F C0
	ror $E5AE.w,X		; 7E AE E5
	bvs  -4.b		; 70 FC
	beq  -4.b		; F0 FC
	beq  -8.b		; F0 F8
	cpx #$F8.b		; E0 F8
	cpy #$F0.b		; C0 F0
	ora ($E1.b,X)		; 01 E1
	brk $C1.b		; 00 C1
	lda #$93C9.w		; A9 C9 93
	and $40C0.w		; 2D C0 40
	bra   0.b		; 80 00
	ldy #$20.b		; A0 20
	jsr $2020.w		; 20 20 20
	jsr $1010.w		; 20 10 10
	stz $4059.w		; 9C 59 40
	and $601F40.l,X		; 3F 40 1F 60
	ora $E09FE0.l,X		; 1F E0 9F E0
	eor $A92DF0.l		; 4F F0 2D A9
	adc $9A9A.w		; 6D 9A 9A
	dec A		; 3A
	ldy $40.b,X		; B4 40
	eor $FF31B2.l		; 4F B2 31 FF
	brk $B0.b		; 00 B0
	rti		; 40

	tsa		; 3B
	cmp $A99C.w,Y		; D9 9C A9
	lsr $12.b		; 46 12
	lsr A		; 4A
	and $FF31.w,X		; 3D 31 FF
	and $3D.b		; 25 3D
	adc $A99C.w		; 6D 9C A9
	lsr $B4.b		; 46 B4
	bit $C7.b,X		; 34 C7
	wai		; CB
	and ($FF.b),Y		; 31 FF
	brk $38.b		; 00 38
	sta ($58.b)		; 92 58
	adc $A99C.w		; 6D 9C A9
	lsr $12.b		; 46 12
	lsr A		; 4A
	nop		; EA
	sbc $9CC912.l,X		; FF 12 C9 9C
	lda #$1246.w		; A9 46 12
	lsr A		; 4A
	nop		; EA
	sbc $9CC992.l,X		; FF 92 C9 9C
	lda #$B446.w		; A9 46 B4
	stz $EA.b,X		; 74 EA
	sbc $C98300.l,X		; FF 00 83 C9
	stz $46A9.w		; 9C A9 46
	ldy $7B.b,X		; B4 7B
	brk $7D.b		; 00 7D
	cop $3C.b		; 02 3C
	ora ($3E.b,X)		; 01 3E
	dec A		; 3A
	sta ($1A.b)		; 92 1A
	and $8F5E.w		; 2D 5E 8F
	ora $8F.b,S		; 03 8F
	ora $C7.b,S		; 03 C7
	eor ($C7.b,X)		; 41 C7
	brk $E3.b		; 00 E3
	bvc -15.b		; 50 F1
	.db $42, $A9		; 42 A9
	lsr A		; 4A
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $9F.b		; 00 9F
	sta ($1A.b)		; 92 1A
	and $0D1F.w		; 2D 1F 0D
	lda ($3C.b,S),Y		; B3 3C
	ldy $F3.b		; A4 F3
	php		; 08
	adc [$B0.b]		; 67 B0
	bpl -24.b		; 10 E8
	sta $0FE730.l,X		; 9F 30 E7 0F
	beq   0.b		; F0 00
	lda $FFEC0D.l,X		; BF 0D EC FF
	ora $B3DB.w		; 0D DB B3
	beq -33.b		; F0 DF
	lda ($3F.b,S),Y		; B3 3F
	sbc $59F80F.l		; EF 0F F8 59
	phb		; 8B
	sbc $34.b,S		; E3 34
	sbc ($0D.b)		; F2 0D
	sta $3C.b,X		; 95 3C
	ora $0D42.w		; 0D 42 0D
	sta $2334.w,Y		; 99 34 23
	ora $E75C.w		; 0D 5C E7
	bmi -97.b		; 30 9F
	tsa		; 3B
	brk $F7.b		; 00 F7
	cmp $3D6FFF.l,X		; DF FF 6F 3D
	rol $B3EF.w,X		; 3E EF B3
	beq  13.b		; F0 0D
	dec $7CC0.w,X		; DE C0 7C
	tsx		; BA
	phb		; 8B
	adc $F901.w,X		; 7D 01 F9
	ora ($FB.b,X)		; 01 FB
	ora $F0.b,S		; 03 F0
	tsx		; BA
	ldx $AB.b		; A6 AB
	and $C312.w		; 2D 12 C3
	tsb $C7.b		; 04 C7
	brk $87.b		; 00 87
	ora $0D.b		; 05 0D
	stx $0F08.w		; 8E 08 0F
	ora $1F.b,X		; 15 1F
	eor $E5A9.w,Y		; 59 A9 E5
	xce		; FB
	brk $FB.b		; 00 FB
	brk $F1.b		; 00 F1
	tsx		; BA
	ldx $AB.b		; A6 AB
	and $0225.w		; 2D 25 02
	cop $60.b		; 02 60
	rts		; 60

	ror $4AFF.w		; 6E FF 4A
	mvp $0D,$03		; 44 03 0D
	sta $7F.b,X		; 95 7F
	dey		; 88
	sbc $A91655.l,X		; FF 55 16 A9
	lsr A		; 4A
	ldx $6EA6.w		; AE A6 6E
	and $0404.w		; 2D 04 04
	rts		; 60

	rts		; 60

	and ($E0.b),Y		; 31 E0
	brk $FA.b		; 00 FA
	ora [$0D.b]		; 07 0D
	sta $7F.b,X		; 95 7F
	tax		; AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $151655.l,X		; FF 55 16 15
	ora $A64462.l,X		; 1F 62 44 A6
	and ($A6.b),Y		; 31 A6
	.db $62, $2D, $40		; 62 2D 40
	asl $88.b,X		; 16 88
	adc [$E9.b],Y		; 77 E9
	.db $62, $62, $1F		; 62 62 1F
	eor $3A59.w,Y		; 59 59 3A
	and ($E0.b),Y		; 31 E0
	rti		; 40

	cpy #$AB.b		; C0 AB
	bra  96.b		; 80 60
	sbc #$3A62.w		; E9 62 3A
	eor $3A59.w,Y		; 59 59 3A
	eor $A9D9.w		; 4D D9 A9
	sbc $4D69C2.l,X		; FF C2 69 4D
	cmp $0131.w,Y		; D9 31 01
	ror $69E9.w		; 6E E9 69
	eor $31D9.w		; 4D D9 31
	inc $E96E.w,X		; FE 6E E9
	adc #$D94D.w		; 69 4D D9
	and ($1F.b),Y		; 31 1F
	ror $69E9.w		; 6E E9 69
	eor $31D9.w		; 4D D9 31
	cpx #$6E.b		; E0 6E
	sbc #$4D69.w		; E9 69 4D
	jsr ($4293.w,X)		; FC 93 42
	and ($03.b),Y		; 31 03
	trb $14.b		; 14 14
	inc A		; 1A
	sbc #$4462.w		; E9 62 44
	sta ($42.b,S),Y		; 93 42
	.db $62, $4D, $55		; 62 4D 55
	tax		; AA
	lda $DF.b,X		; B5 DF
	jsr $D9B5.w		; 20 B5 D9
	eor $522D.w		; 4D 2D 52
	stx $91.b,Y		; 96 91
	brk $0D.b		; 00 0D
	brk $00.b		; 00 00
	.db $42, $FB		; 42 FB
	brk $28.b		; 00 28
	rti		; 40

	stz $2800.w,X		; 9E 00 28
	rti		; 40

	ora ($8C.b)		; 12 8C
	and #$0000.w		; 29 00 00
	and ($29.b)		; 32 29
	and #$FF42.w		; 29 42 FF
	sbc $FF0049.l,X		; FF 49 00 FF
	phk		; 4B
	and ($32.b)		; 32 32
	jmp $4242.w		; 4C 42 42
	phy		; 5A
	eor #$5C49.w		; 49 49 5C
	phy		; 5A
	phy		; 5A
	ror $4B.b		; 66 4B
	phk		; 4B
	adc #$4C4C.w		; 69 4C 4C
	ror $FF0F.w		; 6E 0F FF
	stz $49.b,X		; 74 49
	brk $89.b		; 00 89
	ror $5C.b		; 66 5C
	txa		; 8A
	and $FE8B3F.l,X		; 3F 3F 8B FE
	inc $0396.w,X		; FE 96 03
	jsr ($329D.w,X)		; FC 9D 32
	and #$4CA2.w		; 29 A2 4C
	.db $42, $A6		; 42 A6
	cpx #$E0.b		; E0 E0
	lda #$FFF8.w		; A9 F8 FF
	lda $6E6E.w		; AD 6E 6E
	ldx $0F00.w		; AE 00 0F
	ldy $96.b,X		; B4 96
	stx $B5.b,Y		; 96 B5
	sbc ($F1.b),Y		; F1 F1
	cmp $5A.b		; C5 5A
	eor #$66CE.w		; 49 CE 66
	and #$89D6.w		; 29 D6 89
	jmp $0707DA.l		; 5C DA 07 07
	trb $AA.b		; 14 AA
	eor $21.b,X		; 55 21
	beq -16.b		; F0 F0
	jsl $256969.l		; 22 69 69 25
	jsr ($26F8.w,X)		; FC F8 26
	.db $42, $FF		; 42 FF
	and $A9A9.w		; 2D A9 A9
	and ($0F.b),Y		; 31 0F
	ora $C00035.l		; 0F 35 00 C0
	and $745A.w,Y		; 39 5A 74
	tsa		; 3B
	jmp $E343C5.l		; 5C C5 43 E3
	sbc $45.b,S		; E3 45
	ora ($FE.b,X)		; 01 FE
	lsr $AD.b		; 46 AD
	lda $254A.w		; AD 4A 25
	and $4D.b		; 25 4D
	cpy #$FF.b		; C0 FF
	eor $51F8F8.l		; 4F F8 F8 51
	clc		; 18
	brk $52.b		; 00 52
	jsr ($53FC.w,X)		; FC FC 53
	bra -128.b		; 80 80
	lsr $09.b,X		; 56 09
	sbc $FF58.w,Y		; F9 58 FF
	brk $59.b		; 00 59
	and $35.b,X		; 35 35
	eor $324B.w,X		; 5D 4B 32
	adc $7F.b		; 65 7F
	adc $3F076B.l,X		; 7F 6B 07 3F
	adc ($AE.b)		; 72 AE
	ldx $1F7D.w		; AE 7D 1F
	ora $4A4A8D.l,X		; 1F 8D 4A 4A
	sta ($4D.b,S),Y		; 93 4D
	eor $8A95.w		; 4D 95 8A
	txa		; 8A
	sta $B4B4.w,Y		; 99 B4 B4
	txs		; 9A
	cpy #$C0.b		; C0 C0
	stz $FF4C.w		; 9C 4C FF
	lda ($5A.b,X)		; A1 5A
	brk $A3.b		; 00 A3
	dec $ACFF.w		; CE FF AC
	brk $1F.b		; 00 1F
	bcs  86.b		; B0 56
	lsr $B1.b,X		; 56 B1
	bit #$B239.w		; 89 39 B2
	phb		; 8B
	phb		; 8B
	lda ($E8.b,S),Y		; B3 E8
	inx		; E8
	lda $4014.w,Y		; B9 14 40
	lda $FFF0.w,X		; BD F0 FF
	dec $00.b		; C6 00
	adc $3BA3CB.l,X		; 7F CB A3 3B
	cmp ($66.b,S),Y		; D3 66
	sta $6BDC.w,X		; 9D DC 6B
	rtl		; 6B

	plx		; FA
	lda $B5.b,X		; B5 B5
	phd		; 0B
	lda $0DBF.w,Y		; B9 BF 0D
	bne  47.b		; D0 2F
	asl $FC.b,X		; 16 FC
	sbc $01001D.l,X		; FF 1D 00 01
	and [$0B.b]		; 27 0B
	trb $2C.b		; 14 2C
	and $372D.w		; 2D 2D 37
	bmi  48.b		; 30 30
	dec A		; 3A
	eor $45.b		; 45 45
	and $9D4B.w,X		; 3D 4B 9D
	mvp $60,$60		; 44 60 60
	eor [$7F.b]		; 47 7F
	sbc $FC0048.l,X		; FF 48 00 FC
	lsr $1616.w		; 4E 16 16
	lsr $FFF7.w,X		; 5E F7 FF
	.db $62, $00, $07		; 62 00 07
	stz $03.b		; 64 03
	ora $6A.b,S		; 03 6A
	asl $750F.w		; 0E 0F 75
	ora $7A41.w,Y		; 19 41 7A
	and ($31.b),Y		; 31 31
	sty $43.b		; 84 43
	eor $91.b,S		; 43 91
	adc #$9442.w		; 69 42 94
	lda $9BBD.w,X		; BD BD 9B
	sbc ($FE.b,X)		; E1 FE
	lda $F1.b		; A5 F1
	sbc $3F00A7.l,X		; FF A7 00 3F
	plb		; AB
	lsr $B65E.w,X		; 5E 5E B6
	inc $D2FF.w,X		; FE FF D2
	brk $E0.b		; 00 E0
	cld		; D8
	ora ($01.b,X)		; 01 01
	nop		; EA
	tsb $03.b		; 04 03
	xba		; EB
	ora #$F479.w		; 09 79 F4
	and [$89.b]		; 27 89
	asl A		; 0A
	eor ($51.b),Y		; 51 51
	ora ($5C.b,S),Y		; 13 5C
	stz $1A.b,X		; 74 1A
	ror $66.b		; 66 66
	plp		; 28
	adc $203480.l,X		; 7F 80 34 20
	sbc $000E50.l,X		; FF 50 0E 00
	eor [$8F.b],Y		; 57 8F
	sta $A5A55B.l		; 8F 5B A5 A5
	adc ($A6.b,X)		; 61 A6
	ldx $63.b		; A6 63
	phx		; DA
	phx		; DA
	pla		; 68
	beq  -5.b		; F0 FB
	adc ($F4.b),Y		; 71 F4
	phk		; 4B
	ror $C7.b,X		; 76 C7
	sbc $030085.l,X		; FF 85 00 03
	stx $5050.w		; 8E 50 50
	bcc  52.b		; 90 34
	bit $A8.b,X		; 34 A8
	brk $80.b		; 00 80
	clv		; B8
	ldx #$FF.b		; A2 FF
	tsx		; BA
	ror $76.b,X		; 76 76
	tyx		; BB
	brk $F8.b		; 00 F8
	ldy $FF77.w,X		; BC 77 FF
.ACCU 16
	rep #$29		; C2 29
	brk $CA.b		; 00 CA
	cpx #$FF.b		; E0 FF
	pei ($00.b)		; D4 00
	php		; 08
	cmp [$01.b],Y		; D7 01
	sbc $4200D9.l,X		; FF D9 00 42
	dec $FF1F.w,X		; DE 1F FF
	sbc #$F000.w		; E9 00 F0
	tas		; 1B
	eor $FF.b,X		; 55 FF
	bit $04.b		; 24 04
	brk $38.b		; 00 38
	jsl $3F6CFF.l		; 22 FF 6C 3F
	sbc $FF696D.l,X		; FF 6D 69 FF
	sbc $70EF77.l		; EF 77 EF 70
	sbc [$7F.b]		; E7 7F
	sbc [$47.b]		; E7 47
	adc $E57EFD.l,X		; 7F FD 7E E5
	tda		; 7B
	iny		; C8
	adc $131287.l		; 6F 87 12 13
	bra  16.b		; 80 10
	sta [$1F.b]		; 87 1F
	sta [$1F.b]		; 87 1F
	sta $03.b,S		; 83 03
	sta [$07.b]		; 87 07
	sty $120F.w		; 8C 0F 12
	bcc   3.b		; 90 03
	dec $DEDE.w,X		; DE DE DE
	ora $BBFC58.l,X		; 1F 58 FC BB
	cmp ($35.b)		; D2 35
	phk		; 4B
	sta $62.b		; 85 62
	ldy $26A7.w		; AC A7 26
	brk $B8.b		; 00 B8
	adc $12D9A9.l,X		; 7F A9 D9 12
	adc $29.b		; 65 29
	ldx #$80.b		; A2 80
	sbc $666D74.l,X		; FF 74 6D 66
	and $FE42.w,Y		; 39 42 FE
	cli		; 58
	adc #$496E.w		; 69 6E 49
	inc $3412.w,X		; FE 12 34
	and #$A1A2.w		; 29 A2 A1
	adc $9389.w		; 6D 89 93
	sta ($CA.b,S),Y		; 93 CA
	ldy $DF.b		; A4 DF
	ldx $49.b,Y		; B6 49
	eor [$57.b],Y		; 57 57
	eor [$57.b],Y		; 57 57
	sbc $5A6CEF.l		; EF EF 6C 5A
	sta $FF8FFF.l		; 8F FF 8F FF
	sta $FF8FFF.l		; 8F FF 8F FF
	ora $5D641F.l		; 0F 1F 64 5D
	cmp ($48.b)		; D2 48
	phy		; 5A
	asl $0EF7.w		; 0E F7 0E
	sbc [$0E.b],Y		; F7 0E
	sbc [$0E.b],Y		; F7 0E
	sbc [$0F.b],Y		; F7 0F
	sbc [$0F.b],Y		; F7 0F
	sbc [$6F.b],Y		; F7 6F
	lda [$7E.b],Y		; B7 7E
	sbc $F1F8.w,X		; FD F8 F1
	sed		; F8
	sbc ($F8.b),Y		; F1 F8
	sbc ($F8.b),Y		; F1 F8
	sbc ($F8.b),Y		; F1 F8
	beq  -8.b		; F0 F8
	beq 120.b		; F0 78
	beq   3.b		; F0 03
	sbc $945B5B.l,X		; FF 5B 5B 94
	bpl  31.b		; 10 1F
	and $D9D2.w,X		; 3D D2 D9
	adc $7F4758.l,X		; 7F 58 47 7F
	adc $367F.w		; 6D 7F 36
	and #$4747.w		; 29 47 47
	sta $6953.w,X		; 9D 53 69
	and $3D7F.w,Y		; 39 7F 3D
	tay		; A8
	rol $00.b		; 26 00
	adc #$129C.w		; 69 9C 12
	eor ($29.b,S),Y		; 53 29
	jmp $694B.w		; 4C 4B 69
	jmp $EFFC66.l		; 5C 66 FC EF
	jsr ($4E0F.w,X)		; FC 0F 4E
	lsr $E84E.w		; 4E 4E E8
	ora ($48.b)		; 12 48
	php		; 08
	php		; 08
	eor $2C4B4F.l		; 4F 4F 4B 2C
	jmp $3A3A66.l		; 5C 66 3A 3A
	dec A		; 3A
	eor $01.b		; 45 01
	lda ($B2.b)		; B2 B2
	lda ($B2.b)		; B2 B2
	inc $6622.w,X		; FE 22 66
	bne  18.b		; D0 12
	and [$0D.b]		; 27 0D
	bne  46.b		; D0 2E
	cmp ($12.b),Y		; D1 12
	rol $0D.b		; 26 0D
	ora $2ED0.w		; 0D D0 2E
	cmp ($2E.b),Y		; D1 2E
	bpl   8.b		; 10 08
	eor ($18.b),Y		; 51 18
	ora ($11.b,X)		; 01 11
	php		; 08
	asl A		; 0A
	clc		; 18
	ora ($19.b,X)		; 01 19
	brk $46.b		; 00 46
	lsr $66.b		; 46 66
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
	bpl  44.b		; 10 2C
	bit $DF66.w		; 2C 66 DF
	sbc $DFEFDF.l		; EF DF EF DF
	sbc $FFCCFF.l		; EF FF CC FF
	eor $26C1.w		; 4D C1 26
	sbc ($37.b),Y		; F1 37
	and [$37.b],Y		; 37 37
	and ($33.b,S),Y		; 33 33
	txa		; 8A
	rol $293E.w,X		; 3E 3E 29
	asl $300E.w		; 0E 0E 30
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $6CFF33.l,X		; FF 33 FF 6C
	rol $49FF.w,X		; 3E FF 49
	asl $66FF.w		; 0E FF 66
	sta $EA8D.w		; 8D 8D EA
	nop		; EA
	nop		; EA
	nop		; EA
	nop		; EA
	asl $01.b		; 06 01
	nop		; EA
	asl $01.b		; 06 01
	sta $1A99.w,Y		; 99 99 1A
	ora ($EE.b),Y		; 11 EE
	trb $55.b		; 14 55
	tax		; AA
	trb $77.b		; 14 77
	dey		; 88
	trb $58.b		; 14 58
	inc $3BD7.w,X		; FE D7 3B
	dec $720F.w		; CE 0F 72
	adc ($72.b)		; 72 72
	ldx $EF1F.w		; AE 1F EF
	lda $AF5F5F.l		; AF 5F 5F AF
	lda $8F7F5F.l		; AF 5F 7F 8F
	lda $46FF5F.l		; AF 5F FF 46
	lsr $6E.b		; 46 6E
	ora $BBBB66.l		; 0F 66 BB BB
	tyx		; BB
	php		; 08
	sed		; F8
	bcs -80.b		; B0 B0
	ldx #$AB.b		; A2 AB
	plb		; AB
	sbc [$38.b],Y		; F7 38
	ror $EF.b		; 66 EF
	sbc $EEEFEF.l		; EF EF EF EE
	sbc $F0EFE8.l		; EF E8 EF F0
	sed		; F8
	and ($21.b,X)		; 21 21
	and ($F6.b,X)		; 21 F6
	sbc $FEF1BD.l,X		; FF BD F1 FE
	sbc [$A9.b],Y		; F7 A9
	sty $BD.b,X		; 94 BD
	beq 105.b		; F0 69
	eor $212121.l		; 4F 21 21 21
	phk		; 4B
	ora [$72.b]		; 07 72
	ldx $6FD9.w		; AE D9 6F
	sbc $FF6C12.l,X		; FF 12 6C FF
	sbc ($FD.b),Y		; F1 FD
	plx		; FA
	plx		; FA
	adc $6FF8FF.l		; 6F FF F8 6F
	sbc ($12.b,S),Y		; F3 12
	jmp ($5BFF.w)		; 6C FF 5B
	tad		; 5B
	sbc ($A2.b),Y		; F1 A2
	sbc $FAFD.w,X		; FD FD FA
	plx		; FA
	sta $0002.w,X		; 9D 02 00
	stx $428E.w		; 8E 8E 42
	sta $FF73FF.l		; 8F FF 73 FF
	eor $A2F9F9.l		; 4F F9 F9 A2
	asl $FF.b		; 06 FF
	ora ($72.b)		; 12 72
	sta $FF73FC.l		; 8F FC 73 FF
	lda #$4CF9.w		; A9 F9 4C
	beq -72.b		; F0 B8
	eor $A2F9F9.l		; 4F F9 F9 A2
	sta $0007.w,X		; 9D 07 00
	asl $9D.b		; 06 9D
	brk $B6.b		; 00 B6
	sed		; F8
	inc $FDC1.w,X		; FE C1 FD
	sbc ($F9.b,X)		; E1 F9
	adc ($61.b,X)		; 61 61
	ora ($D9.b)		; 12 D9
	inc $A9C7.w,X		; FE C7 A9
	cmp ($FF.b,X)		; C1 FF
	sbc ($FF.b,X)		; E1 FF
	dex		; CA
	dex		; CA
	dex		; CA
	cpx #$42.b		; E0 42
	phb		; 8B
	sbc $F9FD.w,X		; FD FD F9
	sbc $6161.w,Y		; F9 61 61
	and #$0001.w		; 29 01 00
	cop $00.b		; 02 00
	asl $AC.b		; 06 AC
	ldy $ACAC.w		; AC AC AC
	brk $BC.b		; 00 BC
	ora [$77.b]		; 07 77
	jmp $6363.w		; 4C 63 63
	sta $9C07BC.l		; 8F BC 07 9C
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$42.b]		; 07 42
	adc [$77.b],Y		; 77 77
	jmp $6363.w		; 4C 63 63
	and #$3288.w		; 29 88 32
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	brk $DC.b		; 00 DC
	jmp.w [$DCDC]		; DC DC DC
	tsx		; BA
	tsx		; BA
	tsx		; BA
	ror $C7.b,X		; 76 C7
	sec		; 38
	ror $FF.b		; 66 FF
	dex		; CA
	sbc ($FB.b),Y		; F1 FB
	tad		; 5B
	lda $FEE0.w,X		; BD E0 FE
	sbc $FC.b		; E5 FC
	inc $A6.b		; E6 A6
	lda $F1.b,X		; B5 F1
	sbc $B5.b,X		; F5 B5
	and ($A6.b,X)		; 21 A6
	cpx $E4.b		; E4 E4
	sbc $E4.b		; E5 E4
	adc #$8B4C.w		; 69 4C 8B
	eor ($5D.b)		; 52 5D
	ora $4285.w,X		; 1D 85 42
	ldx $FB.b,Y		; B6 FB
	inc $F8F7.w,X		; FE F7 F8
	cmp $C09EF0.l,X		; DF F0 9E C0
	sed		; F8
	bra -13.b		; 80 F3
	ora ($42.b,X)		; 01 42
	phb		; 8B
	sbc $F7F8.w,Y		; F9 F8 F7
	beq -49.b		; F0 CF
	cpy #$BF.b		; C0 BF
	bra 127.b		; 80 7F
	brk $FE.b		; 00 FE
	cmp $4F8B.w,Y		; D9 8B 4F
	and ($9A.b,X)		; 21 9A
	eor ($9D.b,S),Y		; 53 9D
	ora $AE62.w,X		; 1D 62 AE
	lda [$C6.b]		; A7 C6
	phy		; 5A
	sei		; 78
	cmp $78.b,S		; C3 78
	ora $E0.b,S		; 03 E0
	ora [$12.b]		; 07 12
	sta ($1E.b),Y		; 91 1E
	and $12.b,S		; 23 12
	and $4712.w,X		; 3D 12 47
	tda		; 7B
	sta $EF1FF7.l		; 8F F7 1F EF
	bit $0345.w,X		; 3C 45 03
	sed		; F8
	ora $E1.b,S		; 03 E1
	ora [$C3.b]		; 07 C3
	ora $0C1E86.l		; 0F 86 1E 0C
	bit $7818.w,X		; 3C 18 78
	phk		; 4B
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	nop		; EA
	php		; 08
	ora [$13.b]		; 07 13
	inc $BB48.w,X		; FE 48 BB
	jsr $47DF.w		; 20 DF 47
	lda $EFEF40.l,X		; BF 40 EF EF
	sbc $F7F7EF.l,X		; FF EF F7 F7
	cmp $DFFFDF.l,X		; DF DF FF DF
	jmp ($267F.w)		; 6C 7F 26
	tya		; 98
	tya		; 98
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	and [$37.b],Y		; 37 37
	and ($7F.b)		; 32 7F
	brk $98.b		; 00 98
	adc [$18.b]		; 67 18
	sbc [$18.b]		; E7 18
	sbc [$30.b]		; E7 30
	cmp $39CF30.l		; CF 30 CF 39
	tya		; 98
	brk $0A.b		; 00 0A
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	jmp $2200.w		; 4C 00 22
	and $29FF.w,X		; 3D FF 29
	sbc $294B3B.l,X		; FF 3B 4B 29
	cpy #$3F.b		; C0 3F
	sbc ($FE.b),Y		; F1 FE
	cmp $FCC03F.l		; CF 3F C0 FC
	sta ($12.b,S),Y		; 93 12
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	cpy $FB.b		; C4 FB
	cpy #$7A9C.w		; C0 9C 7A
	ply		; 7A
	and ($32.b),Y		; 31 32
	beq -82.b		; F0 AE
	jsr ($FD0F.w,X)		; FC 0F FD
	ora $F90FFD.l		; 0F FD 0F F9
	ora $0339F9.l		; 0F F9 39 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	ora $FF.b,S		; 03 FF
	bra 127.b		; 80 7F
	inx		; E8
	sbc [$1F.b],Y		; F7 1F
	adc $FF0D12.l,X		; 7F 12 0D FF
	tsb $10FE.w		; 0C FE 10
	ora ($F4.b)		; 12 F4
	bpl  18.b		; 10 12
	pea $8049.w		; F4 49 80
	sbc $F926F8.l,X		; FF F8 26 F9
	sbc $F8F9.w,Y		; F9 F9 F8
	xce		; FB
	pla		; 68
	beq -99.b		; F0 9D
	cpx #$E0BB.w		; E0 BB E0
	sed		; F8
	cpx #$E0F0.w		; E0 F0 E0
	beq -32.b		; F0 E0
	jmp $ACACAC.l		; 5C AC AC AC
	ldy $DFFF.w		; AC FF DF
	sbc $FE1FFB.l,X		; FF FB 1F FE
	sta ($7E.b,X)		; 81 7E
	beq -17.b		; F0 EF
	bit $5E7B.w,X		; 3C 7B 5E
	rol $303F.w,X		; 3E 3F 30
	beq   6.b		; F0 06
	inc $81D7.w,X		; FE D7 81
	sbc $BC12BD.l,X		; FF BD 12 BC
	and $29C0DA.l,X		; 3F DA C0 29
	ora $E95D1D.l		; 0F 1D 5D E9
	brk $FE.b		; 00 FE
	ora ($B8.b,S),Y		; 13 B8
	cmp $1267EF.l,X		; DF EF 67 12
	tyx		; BB
	ora $86EE.w,Y		; 19 EE 86
	tda		; 7B
	sbc ($12.b,X)		; E1 12
	dec $539D.w,X		; DE 9D 53
	rts		; 60

	cpx #$F010.w		; E0 10 F0
	stx $FE.b		; 86 FE
	sbc ($FF.b,X)		; E1 FF
	and $850F.w,Y		; 39 0F 85
	eor $48E9.w,X		; 5D E9 48
	cmp $4E.b		; C5 4E
	lsr $7C4E.w		; 4E 4E 7C
	lda $EF9C12.l,X		; BF 12 9C EF
	and $5C53.w,X		; 3D 53 5C
	lda ($3F.b,X)		; A1 3F
	ldx $355D.w		; AE 5D 35
	sbc #$0D0D.w		; E9 0D 0D
	bne  46.b		; D0 2E
	cmp ($2E.b),Y		; D1 2E
	bne  18.b		; D0 12
	and [$0D.b]		; 27 0D
	bne  46.b		; D0 2E
	cmp ($2E.b),Y		; D1 2E
	asl A		; 0A
	clc		; 18
	ora ($19.b,X)		; 01 19
	brk $10.b		; 00 10
	php		; 08
	eor ($18.b),Y		; 51 18
	ora ($19.b,X)		; 01 19
	brk $46.b		; 00 46
	lsr $66.b		; 46 66
	ora [$E7.b],Y		; 17 E7
	ora [$F7.b],Y		; 17 F7
	sta [$77.b],Y		; 97 77
	sta [$77.b],Y		; 97 77
	ora [$F7.b],Y		; 17 F7
	ora [$F7.b],Y		; 17 F7
	sta [$77.b]		; 87 77
	sta [$77.b]		; 87 77
	php		; 08
	bpl  81.b		; 10 51
	tya		; 98
	brk $98.b		; 00 98
	brk $0A.b		; 00 0A
	tya		; 98
	brk $98.b		; 00 98
	brk $2C.b		; 00 2C
	bit $FF66.w		; 2C 66 FF
	dex		; CA
	cpx $FF.b		; E4 FF
	cpy $93FF.w		; CC FF 93
	cpy $C9FF.w		; CC FF C9
	sbc $127DC9.l,X		; FF C9 7D 12
	tas		; 1B
	ora ($1B.b)		; 12 1B
	and ($33.b,S),Y		; 33 33
	sta $33.b,X		; 95 33
	and ($36.b,S),Y		; 33 36
	rol $36.b,X		; 36 36
	rol $DE.b,X		; 36 DE
	ora ($1B.b)		; 12 1B
	sbc $6CFF33.l,X		; FF 33 FF 6C
	jmp ($FF33.w)		; 6C 33 FF
	rol $FF.b,X		; 36 FF
	rol $FF.b,X		; 36 FF
	ror $8D.b		; 66 8D
	sta $0205.w		; 8D 05 02
	asl $01.b		; 06 01
	ora $02.b		; 05 02
	asl $01.b		; 06 01
	ora [$00.b]		; 07 00
	asl $01.b		; 06 01
	ora [$00.b]		; 07 00
	asl $01.b		; 06 01
	sta $1A99.w,Y		; 99 99 1A
	cli		; 58
	cmp $5574.w,X		; DD 74 55
	brk $EF.b		; 00 EF
	brk $55.b		; 00 55
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	jmp $0FCE5C.l		; 5C 5C CE 0F
	adc ($72.b)		; 72 72
	adc ($00.b)		; 72 00
	ror $DF0F.w		; 6E 0F DF
	ror $5F0F.w		; 6E 0F 5F
	ora $5F0FEF.l		; 0F EF 0F 5F
	ora $5F0FAF.l		; 0F AF 0F 5F
	lsr $46.b		; 46 46
	ora $B0B066.l		; 0F 66 B0 B0
	bcs -80.b		; B0 B0
	plb		; AB
	plb		; AB
	plb		; AB
	lsr $38F7.w,X		; 5E F7 38
	ror $21.b		; 66 21
	lda ($B3.b,S),Y		; B3 B3
	lda ($B3.b,S),Y		; B3 B3
	lda ($B3.b,S),Y		; B3 B3
	rol $BD.b		; 26 BD
	bit $F8A9.w		; 2C A9 F8
	.db $42, $21		; 42 21
	eor $4F4F4F.l		; 4F 4F 4F 4F
	eor $0F424F.l		; 4F 4F 42 0F
	.db $62, $62, $62		; 62 62 62
	.db $62, $62, $62		; 62 62 62
.ACCU 16
.INDEX 16
	rep #$FA		; C2 FA
	lda $F8.b,X		; B5 F8
	sbc $524F.w,Y		; F9 4F 52
	stz $F1A5.w		; 9C A5 F1
	inc $2DA5.w,X		; FE A5 2D
	jsr ($FA4C.w,X)		; FC 4C FA
	lda $F9.b,X		; B5 F9
	sbc $524F.w,Y		; F9 4F 52
	jmp $508E.w		; 4C 8E 50
	asl $62.b		; 06 62
	sta $32.b		; 85 32
	brk $B6.b		; 00 B6
	ldx $B6.b,Y		; B6 B6
	adc $01FF.w,Y		; 79 FF 01
	adc $3164.w,Y		; 79 64 31
	.db $42, $E7		; 42 E7
	inc $FE1F.w,X		; FE 1F FE
	ora ($71.b)		; 12 71
	inc $7987.w,X		; FE 87 79
	sbc $FF03D7.l,X		; FF D7 03 FF
	ora $797991.l		; 0F 91 79 79
	stz $31.b		; 64 31
	.db $42, $4B		; 42 4B
	stx $48.b		; 86 48
	sbc #$84C2.w		; E9 C2 84
	eor $E3.b,S		; 43 E3
	cpx #$E1E3.w		; E0 E3 E1
	sbc ($E2.b,X)		; E1 E2
	cpx #$26E3.w		; E0 E3 26
	sbc $FF.b,S		; E3 FF
	sbc $FF.b,S		; E3 FF
	sbc $FC.b,S		; E3 FC
	sbc $FD.b,S		; E3 FD
	sbc $FE.b,S		; E3 FE
	sbc ($FF.b,X)		; E1 FF
	cpx #$8442.w		; E0 42 84
	sty $84.b		; 84 84
	eor $42.b,S		; 43 42
	trb $1C00.w		; 1C 00 1C
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
.INDEX 16
	rep #$9C		; C2 9C
	sta $E7BCFF.l		; 8F FF BC E7
	cmp [$BF.b]		; C7 BF
	ora [$E7.b]		; 07 E7
	ldx #$FF8F.w		; A2 8F FF
	ldy $FFE7.w,X		; BC E7 FF
	lda $690776.l,X		; BF 76 07 69
	ldx #$E7E7.w		; A2 E7 E7
	.db $42, $5D		; 42 5D
	clc		; 18
.ACCU 16
	rep #$68		; C2 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	pla		; 68
	sbc ($FB.b,S),Y		; F3 FB
	ora ($D8.b)		; 12 D8
	sbc [$94.b]		; E7 94
	sty $94.b,X		; 94 94
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	adc #$529C.w		; 69 9C 52
	and $4985.w,X		; 3D 85 49
	jmp.w [$A7DC]		; DC DC A7
	ora #$123F.w		; 09 3F 12
	eor $47BE.w		; 4D BE 47
	tsx		; BA
	tsx		; BA
	cpy #$C8FC.w		; C0 FC C8
	sed		; F8
	cmp ($58.b,X)		; C1 58
	adc $2152.w		; 6D 52 21
	eor $AE85.w,X		; 5D 85 AE
	phy		; 5A
	sbc $EC.b,X		; F5 EC
	sbc [$F0.b]		; E7 F0
	lda $5E12E0.l		; AF E0 12 5E
	cpy #$E008.w		; C0 08 E0
	sta $83.b,S		; 83 83
	ora ($38.b)		; 12 38
	sbc $E1DE12.l,X		; FF 12 DE E1
	sbc $E0.b,S		; E3 E0
	sbc $809FE0.l		; EF E0 9F 80
	and $7C00AC.l,X		; 3F AC 00 7C
.INDEX 16
	rep #$11		; C2 11
	sbc ($21.b),Y		; F1 21
	ldx $53.b		; A6 53
	phk		; 4B
	and #$ACAE.w		; 29 AE AC
	dec $5C.b		; C6 5C
	eor #$03E7.w		; 49 E7 03
	ora ($CA.b)		; 12 CA
	ora $1E1412.l		; 0F 12 14 1E
	ora ($6A.b)		; 12 6A
	rol $7FC1.w,X		; 3E C1 7F
	eor #$FF05.w		; 49 05 FF
	ora ($1D.b)		; 12 1D
	sbc $FD.b,S		; E3 FD
	ora ($F2.b,X)		; 01 F2
	ora $E5.b,S		; 03 E5
	ora [$C9.b]		; 07 C9
	ora $170F80.l		; 0F 80 0F 17
	ora $5F7F07.l,X		; 1F 07 7F 5F
	sbc $DF42B1.l,X		; FF B1 42 DF
	lda $7F1FFF.l,X		; BF FF 1F 7F
	eor $FF9F7F.l,X		; 5F 7F 9F FF
	ora $20219C.l,X		; 1F 9C 21 20
	cpx #$E0A0.w		; E0 A0 E0
	ldy #$20E0.w		; A0 E0 20
	cpx #$4C21.w		; E0 21 4C
	bpl  15.b		; 10 0F
	jsr $201F.w		; 20 1F 20
	ora $201F20.l,X		; 1F 20 1F 20
	ora $1F0F30.l,X		; 1F 30 0F 1F
	and ($F0.b)		; 32 F0
	cmp ($D2.b)		; D2 D2
	cmp ($D2.b)		; D2 D2
	sbc #$EF5A.w		; E9 5A EF
	.db $42, $BF		; 42 BF
	lda $FFDFFF.l,X		; BF FF DF FF
	cmp $9CDFFF.l,X		; DF FF DF 9C
	and [$44.b],Y		; 37 44
	mvp $44,$44		; 44 44 44
	mvp $30,$4C		; 44 4C 30
	cmp $609F60.l		; CF 60 9F 60
	sta $609F60.l,X		; 9F 60 9F 60
	sta $FF9F60.l,X		; 9F 60 9F FF
	and ($30.b)		; 32 30
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	stz $38.b,X		; 74 38
	eor $134C.w,X		; 5D 4C 13
	.db $42, $66		; 42 66
	sbc $C84D49.l,X		; FF 49 4D C8
	sbc [$93.b],Y		; F7 93
	eor $9CC0.w		; 4D C0 9C
	ply		; 7A
	ror A		; 6A
	ror A		; 6A
	ror A		; 6A
	ror A		; 6A
	jmp $F10F.w		; 4C 0F F1
	ora $F10FF1.l		; 0F F1 0F F1
	ora $F10FF1.l		; 0F F1 0F F1
	ora $8E32A5.l		; 0F A5 32 8E
	stx $0E50.w		; 8E 50 0E
	phy		; 5A
	clc		; 18
	jsr ($FF2B.w,X)		; FC 2B FF
	and $EF.b,S		; 23 EF
	jsr $30EF.w		; 20 EF 30
	sbc $FF5012.l,X		; FF 12 50 FF
	cmp $12CFD0.l		; CF D0 CF 12
	bcc -13.b		; 90 F3
	beq -90.b		; F0 A6
	bvs -32.b		; 70 E0
	bmi -32.b		; 30 E0
	jsr $9AE0.w		; 20 E0 9A
	cpx #$A0C0.w		; E0 C0 A0
	bra -16.b		; 80 F0
	ldx $C0.b		; A6 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpy #$9AE0.w		; C0 E0 9A
	bra -64.b		; 80 C0
	and ($1F.b)		; 32 1F
	lda [$A7.b]		; A7 A7
	lda [$A7.b]		; A7 A7
	dec $5A.b		; C6 5A
	phx		; DA
	jmp $42A1.w		; 4C A1 42
	stz $F8.b,X		; 74 F8
	inc A		; 1A
	sbc $B8123B.l,X		; FF 3B 12 B8
	sbc [$EC.b],Y		; F7 EC
	xce		; FB
	cop $FF.b		; 02 FF
	ora ($58.b,X)		; 01 58
	.db $42, $49		; 42 49
	cmp [$3E.b],Y		; D7 3E
	ora ($38.b)		; 12 38
	and $640F0C.l,X		; 3F 0C 0F 64
	cld		; D8
	and ($D8.b)		; 32 D8
	txa		; 8A
	dec $12.b,X		; D6 12
	jmp ($B312.w)		; 6C 12 B3
	ora ($13.b)		; 12 13
	jsr ($3FC0.w,X)		; FC C0 3F
	ora ($71.b)		; 12 71
	ora ($8E.b)		; 12 8E
	ora ($BC.b)		; 12 BC
	cmp $BF.b,S		; C3 BF
	eor $5880.w		; 4D 80 58
	rts		; 60

	cpx #$F010.w		; E0 10 F0
	cpy #$A5FC.w		; C0 FC A5
	jsr ($58A2.w,X)		; FC A2 58
	ora $3D.b,S		; 03 3D
	pha		; 48
	tsa		; 3B
	dec A		; 3A
	cmp ($3E.b,X)		; C1 3E
	ora ($A1.b)		; 12 A1
	ora ($DE.b)		; 12 DE
	ora ($59.b)		; 12 59
	inc $E912.w,X		; FE 12 E9
	asl $0FFE.w,X		; 1E FE 0F
	sbc ($1F.b,S),Y		; F3 1F
	lda ($06.b)		; B2 06
	rol $9E80.w,X		; 3E 80 9E
	clc		; 18
	inc $FEE6.w,X		; FE E6 FE
	lda #$9CF0.w		; A9 F0 9C
	txa		; 8A
	adc $64DA.w,X		; 7D DA 64
	phk		; 4B
	and $D2.b,X		; 35 D2
	tyx		; BB
	pha		; 48
	phy		; 5A
	inc $FE41.w,X		; FE 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($FE.b,X)		; 41 FE
	eor ($7E.b,X)		; 41 7E
	cmp ($BE.b,X)		; C1 BE
	sbc ($E3.b,X)		; E1 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	ora ($E3.b,X)		; 01 E3
	sta ($12.b,X)		; 81 12
	adc $E1.b,S		; 63 E1
	adc #$654C.w		; 69 4C 65
	adc $A85D.w,X		; 7D 5D A8
	cmp ($0D.b)		; D2 0D
	ora $2ED0.w		; 0D D0 2E
	cmp ($2E.b),Y		; D1 2E
	ora $D712.w		; 0D 12 D7
	rol $30C0.w		; 2E C0 30
	sta $180AEF.l		; 8F EF 0A 18
	ora ($19.b,X)		; 01 19
	brk $51.b		; 00 51
	ora $7D0F.w,Y		; 19 0F 7D
	bne  -1.b		; D0 FF
	lsr $6E.b		; 46 6E
	sbc #$5DD2.w		; E9 D2 5D
	ldx $49AC.w		; AE AC 49
	ora [$F7.b]		; 07 F7
	ora [$F7.b]		; 07 F7
	sta [$77.b]		; 87 77
	sta [$77.b]		; 87 77
	ora [$F7.b]		; 07 F7
	ora ($A7.b)		; 12 A7
	adc [$F7.b],Y		; 77 F7
	sed		; F8
	ora $980A.w,X		; 1D 0A 98
	brk $98.b		; 00 98
	brk $51.b		; 00 51
	sed		; F8
	cpx #$FF07.w		; E0 07 FF
	ldx $2C.b,Y		; B6 2C
	lda #$1F18.w		; A9 18 1F
	and $74D2.w,X		; 3D D2 74
	adc #$7F9C.w		; 69 9C 7F
	.db $42, $7F		; 42 7F
	eor $539A.w,X		; 5D 9A 53
	jmp $C63FA1.l		; 5C A1 3F C6
	eor $A835.w,X		; 5D 35 A8
	sta $078D.w		; 8D 8D 07
	brk $05.b		; 00 05
	.db $62, $00, $05		; 62 00 05
	.db $62, $00, $05		; 62 00 05
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $99.b		; 00 99
	sta $881A.w,Y		; 99 1A 88
	brk $55.b		; 00 55
.INDEX 16
	rep #$55		; C2 55
.INDEX 16
	rep #$12		; C2 12
	mvp $5C,$32		; 44 32 5C
	jmp $AE0FCE.l		; 5C CE 0F AE
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	sta $0F5F0F.l		; 8F 0F 5F 0F
	ror A		; 6A
	ora ($5E.b)		; 12 5E
	ora $4E126A.l		; 0F 6A 12 4E
	ora $460E6A.l		; 0F 6A 0E 46
	lsr $0F.b		; 46 0F
	ror $FF.b		; 66 FF
	jsr $02F2.w		; 20 F2 02
	adc $75.b,X		; 75 75
	adc $75.b,X		; 75 75
	adc $75.b,X		; 75 75
	ora ($71.b)		; 12 71
	brk $02.b		; 00 02
	sbc $9B9B.w,X		; FD 9B 9B
	txy		; 9B
	txy		; 9B
	txy		; 9B
	txy		; 9B
	jsl $EBB066.l		; 22 66 B0 EB
	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	xba		; EB
	plb		; AB
	ldy $BCBC.w,X		; BC BC BC
	ldy $77BC.w,X		; BC BC 77
	sec		; 38
	ror $22.b		; 66 22
	jsl $6D6622.l		; 22 22 66 6D
	sbc $F7FC.w,X		; FD FC F7
.ACCU 8
.INDEX 8
	sep #$FE		; E2 FE
	ora ($C6.b)		; 12 C6
	adc $A9B6.w		; 6D B6 A9
	cmp ($DF.b,X)		; C1 DF
	bra -65.b		; 80 BF
	ldx #$8B.b		; A2 8B
	eor $539AA6.l		; 4F A6 9A 53
	sta $621D.w,X		; 9D 1D 62
	ldy $C6A7.w		; AC A7 C6
	jmp $F9F6.w		; 4C F6 F9
	sbc $875A9F.l,X		; FF 9F 5A 87
	sed		; F8
	sei		; 78
	sta [$4C.b]		; 87 4C
	ldx $CA.b,Y		; B6 CA
	phy		; 5A
	ora [$FF.b]		; 07 FF
	adc $9A5226.l,X		; 7F 26 52 9A
	eor $A785.w,X		; 5D 85 A7
	jmp $7F2600.l		; 5C 00 26 7F
	sta $D94516.l		; 8F 16 45 D9
	.db $62, $F8, $70		; 62 F8 70
	sta $49BD42.l		; 8F 42 BD 49
	ora ($58.b,X)		; 01 58
	stz $8BBD.w		; 9C BD 8B
	and $3B1D.w,X		; 3D 1D 3B
	inc $F9.b		; E6 F9
	.db $42, $D9		; 42 D9
	ldy $E7E0.w		; AC E0 E7
	clc		; 18
	ora [$F8.b]		; 07 F8
	bra 127.b		; 80 7F
	ldx $74.b,Y		; B6 74
	rol $DE.b		; 26 DE
	sbc [$FF.b]		; E7 FF
	ora [$26.b]		; 07 26
	dec $DE.b,X		; D6 DE
	dex		; CA
	ora [$A9.b]		; 07 A9
	and $E01F.w,Y		; 39 1F E0
	phy		; 5A
	ora [$69.b]		; 07 69
	rol $D6.b		; 26 D6
	lda $BD0F.w,X		; BD 0F BD
	lda ($F7.b,X)		; A1 F7
	ora $F708F8.l		; 0F F8 08 F7
	php		; 08
	eor #$0F.b		; 49 0F
	adc $D62D.w		; 6D 2D D6
	asl $F9.b		; 06 F9
	sbc $20DFA1.l,X		; FF A1 DF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	bit $06.b,X		; 34 06
	adc #$B8.b		; 69 B8
	lda ($4C.b),Y		; B1 4C
	jmp $582949.l		; 5C 49 29 58
	adc #$B8.b		; 69 B8
	lda ($4C.b),Y		; B1 4C
	stz $E6.b,X		; 74 E6
	ora $F219E6.l,X		; 1F E6 19 F2
	ora ($0D.b)		; 12 0D
	sbc $7403.w,X		; FD 03 74
	adc #$B8.b		; 69 B8
	dec $DF.b,X		; D6 DF
	sbc $1049FF.l		; EF FF 49 10
	adc $12FFD0.l,X		; 7F D0 FF 12
	bcc  -2.b		; 90 FE
	cmp ($98.b),Y		; D1 98
	sbc [$34.b],Y		; F7 34
	bpl -72.b		; 10 B8
	lda $B1A2BF.l,X		; BF BF A2 B1
	jmp $F074.w		; 4C 74 F0
	ora $7F9A12.l		; 0F 12 9A 7F
	ror $FC04.w		; 6E 04 FC
	tsb $FC.b		; 04 FC
	brk $9C.b		; 00 9C
	lda $FCA9.w,X		; BD A9 FC
	stz $4CB1.w		; 9C B1 4C
	ora $58.b,S		; 03 58
	and $4D49C0.l,X		; 3F C0 49 4D
	ora ($39.b)		; 12 39
	rol $12EC.w,X		; 3E EC 12
	xba		; EB
	eor #$FC.b		; 49 FC
	rol $6C.b		; 26 6C
	phy		; 5A
	cmp ($FF.b,X)		; C1 FF
	ora [$FF.b],Y		; 17 FF
	lda ($42.b),Y		; B1 42
	pha		; 48
	.db $42, $74		; 42 74
	plp		; 28
	cmp $FE00.w,Y		; D9 00 FE
	rol $00.b		; 26 00
	stz $587F.w		; 9C 7F 58
	stz $42B1.w		; 9C B1 42
	jsr $FE49.w		; 20 49 FE
	cmp [$74.b],Y		; D7 74
	plp		; 28
	ora [$F8.b]		; 07 F8
	brk $26.b		; 00 26
	asl $B8.b		; 06 B8
	eor [$07.b]		; 47 07
	rol $D6.b		; 26 D6
	stx $7F.b		; 86 7F
	eor $58.b		; 45 58
	plp		; 28
	lda $60DF40.l,X		; BF 40 DF 60
	lda $9FDE70.l		; AF 70 DE 9F
	sbc $9C6901.l,X		; FF 01 69 9C
	dec $5F.b,X		; D6 5F
	cmp $4213FF.l,X		; DF FF 13 42
	jsr $B869.w		; 20 69 B8
	lda ($42.b),Y		; B1 42
	ldx $D7.b,Y		; B6 D7
	ora ($FD.b,X)		; 01 FD
	ora $FD.b,S		; 03 FD
	ora $F9.b,S		; 03 F9
	ora [$F1.b]		; 07 F1
	ora $9C0142.l		; 0F 42 01 9C
	lda ($A2.b)		; B2 A2
	sta $1D1D.w,X		; 9D 1D 1D
	sta $FE39.w,X		; 9D 39 FE
	brk $FE.b		; 00 FE
	lda ($69.b,X)		; A1 69
	rol $47.b		; 26 47
	adc $4B5326.l,X		; 7F 26 53 4B
	and #$53.b		; 29 53
	and #$C6.b		; 29 C6
	jmp $74C6C6.l		; 5C C6 C6 74
	bra  75.b		; 80 4B
	tay		; A8
	tay		; A8
	and #$8D.b		; 29 8D
	sta $0524.w		; 8D 24 05
	brk $24.b		; 00 24
	ora $00.b		; 05 00
	bit $24.b		; 24 24
	bit $24.b		; 24 24
	sta $6699.w,Y		; 99 99 66
	dec $2A2A.w		; CE 2A 2A
	and #$AA.b		; 29 AA
	tax		; AA
	ora ($11.b),Y		; 11 11
	tax		; AA
	tax		; AA
	cmp $D5.b,X		; D5 D5
	tax		; AA
	tax		; AA
	cli		; 58
	cmp $74.b,X		; D5 74
	eor $00.b,X		; 55 00
	inc $5500.w		; EE 00 55
	brk $2A.b		; 00 2A
	brk $55.b		; 00 55
	ror $1D.b		; 66 1D
	asl $021F.w		; 0E 1F 02
	and $050507.l,X		; 3F 07 05 05
	brk $12.b		; 00 12
	bit $1505.w		; 2C 05 15
	ora ($0A.b)		; 12 0A
	rol $0C00.w		; 2E 00 0C
	ror A		; 6A
	bit $2112.w,X		; 3C 12 21
	ora ($38.b)		; 12 38
	brk $12.b		; 00 12
	sta $12.b		; 85 12
	tsx		; BA
	lda [$12.b]		; A7 12
	sta $12.b		; 85 12
	tsx		; BA
	ora ($CA.b)		; 12 CA
	sbc $80.b,X		; F5 80
	lda $DF0FFF.l,X		; BF FF 0F DF
	dec $7F3F.w,X		; DE 3F 7F
	jmp ($7F3F.w)		; 6C 3F 7F
	txa		; 8A
	and $663F7F.l,X		; 3F 7F 3F 66
	adc $75.b,X		; 75 75
	ora ($1A.b)		; 12 1A
	ora ($43.b)		; 12 43
	lda $6542BF.l,X		; BF BF 42 65
	lda $9B42BF.l,X		; BF BF 42 9B
	txy		; 9B
	sbc $FC.b,S		; E3 FC
	lda $285840.l,X		; BF 40 58 28
	lda $225840.l,X		; BF 40 58 22
	ror $EB.b		; 66 EB
	sed		; F8
	sei		; 78
	sbc $BC917F.l,X		; FF 7F 91 BC
	bra   7.b		; 80 07
	bra  19.b		; 80 13
	jsl $024266.l		; 22 66 42 02
	ora $FD.b,S		; 03 FD
	inc $FCFB.w,X		; FE FB FC
	inc $F9.b,X		; F6 F9
	inx		; E8
	ora ($D7.b)		; 12 D7
	bne -81.b		; D0 AF
	cpx #$1F.b		; E0 1F
	phb		; 8B
	brk $FD.b		; 00 FD
	ora ($03.b,X)		; 01 03
	sbc ($07.b,S),Y		; F3 07
	sbc [$0F.b]		; E7 0F
	lda $7F5F3F.l		; AF 3F 5F 7F
	.db $42, $8B		; 42 8B
	jsr ($F825.w,X)		; FC 25 F8
	and ($A6.b,X)		; 21 A6
	eor ($32.b,S),Y		; 53 32
	ora $6285.w,X		; 1D 85 62
	ldx $C6AC.w		; AE AC C6
	phy		; 5A
	jmp ($F083.w,X)		; 7C 83 F0
	ora $833FC0.l		; 0F C0 3F 83
	jmp ($F00F.w,X)		; 7C 0F F0
	cmp $7F.b		; C5 7F
	adc #$B8.b		; 69 B8
	dec $07.b,X		; D6 07
	sed		; F8
	ora $4574CA.l,X		; 1F CA 74 45
	lda ($38.b,X)		; A1 38
	dec $09.b,X		; D6 09
	sbc [$F7.b],Y		; F7 F7
	asl $18EF.w		; 0E EF 18
	cmp $BC1230.l,X		; DF 30 12 BC
	ora ($63.b)		; 12 63
	adc $12E6.w,Y		; 79 E6 12
	ror $C9.b,X		; 76 C9
	cpx $6E92.w		; EC 92 6E
	phb		; 8B
	eor $9A6121.l		; 4F 21 61 9A
	sta ($80.b,X)		; 81 80
	lda ($42.b),Y		; B1 42
	bra  88.b		; 80 58
	cpx #$3F.b		; E0 3F
	eor #$28.b		; 49 28
	ora ($B2.b)		; 12 B2
	adc ($1E.b,S),Y		; 73 1E
	stz $E6D5.w,X		; 9E D5 E6
	eor ($4B.b,S),Y		; 53 4B
	tsb $1200.w		; 0C 00 12
	adc ($D4.b,X)		; 61 D4
	wai		; CB
	sbc ($3E.b,X)		; E1 3E
	jsr ($FE0F.w,X)		; FC 0F FE
	ora $3F.b,S		; 03 3F
	cmp ($8F.b,X)		; C1 8F
	bvs 103.b		; 70 67
	tya		; 98
	ora ($5B.b)		; 12 5B
	ora ($64.b)		; 12 64
	cmp $D212.w		; CD 12 D2
	txa		; 8A
	and ($64.b),Y		; 31 64
	cld		; D8
	and ($80.b)		; 32 80
	brk $20.b		; 00 20
	lda $5C.b,S		; A3 5C
	lda ($42.b,X)		; A1 42
	brk $7E.b		; 00 7E
	sta ($7E.b,X)		; 81 7E
	sta ($1E.b,X)		; 81 1E
	sbc ($8F.b,X)		; E1 8F
	beq -57.b		; F0 C7
	sed		; F8
	sbc $7C.b,S		; E3 7C
	sbc ($3E.b,X)		; E1 3E
	adc #$4C.b		; 69 4C
	adc $8A.b		; 65 8A
	dec $90.b,X		; D6 90
	bcc -112.b		; 90 90
	bit $A0.b,X		; 34 A0
	adc $5CD622.l,X		; 7F 22 D6 5C
	and $D638.w,Y		; 39 38 D6
	bcc  52.b		; 90 34
	rti		; 40

	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $81FF40.l,X		; FF 40 FF 81
	inc $D622.w,X		; FE 22 D6
	clc		; 18
	jsr ($F919.w,X)		; FC 19 F9
	rol $12DF.w		; 2E DF 12
	adc $12.b,X		; 75 12
	stx $7A12.w		; 8E 12 7A
	ora ($85.b)		; 12 85
	inc $09.b,X		; F6 09
	ora ($D4.b)		; 12 D4
	pld		; 2B
	ora ($8D.b)		; 12 8D
	adc ($42.b,S),Y		; 73 42
	ldx $CA.b,Y		; B6 CA
	lda $FB.b		; A5 FB
	sbc $FFEFAB.l,X		; FF AB EF FF
	dec $F3.b,X		; D6 F3
	sbc $124F12.l		; EF 12 4F 12
	clv		; B8
	sta $E13E70.l,X		; 9F 70 3E E1
	sei		; 78
	cmp [$F3.b]		; C7 F3
	sty $12EC.w		; 8C EC 12
	sta ($12.b,S),Y		; 93 12
	cmp $2512.w,Y		; D9 12 25
	dec $F878.w,X		; DE 78 F8
	and ($A6.b,X)		; 21 A6
	txs		; 9A
	eor ($53.b,S),Y		; 53 53
	cop $A3.b		; 02 A3
	jmp $7442A1.l		; 5C A1 42 74
	sta ($7E.b,X)		; 81 7E
	cmp $1200.w,Y		; D9 00 12
	stz $E7.b		; 64 E7
	bit $123C.w,X		; 3C 3C 12
	plb		; AB
	cmp $294B.w		; CD 4B 29
	eor ($C3.b),Y		; 51 C3
	brk $10.b		; 00 10
	wai		; CB
	sbc [$F8.b]		; E7 F8
	sbc $FC3E.w,Y		; F9 3E FC
	ora $1F877E.l		; 0F 7E 87 1F
	sbc $CF.b,S		; E3 CF
	ora ($31.b)		; 12 31
	lda [$C9.b],Y		; B7 C9
	ora ($9B.b)		; 12 9B
	ldy $42.b		; A4 42
	txa		; 8A
	and ($DA.b),Y		; 31 DA
	stz $D8.b		; 64 D8
	cld		; D8
	rti		; 40

	lda $5C.b,S		; A3 5C
	lda ($42.b,X)		; A1 42
	phy		; 5A
	and #$FF.b		; 29 FF
	phy		; 5A
	bra  -1.b		; 80 FF
	bra  56.b		; 80 38
	lda ($42.b),Y		; B1 42
	stz $FE.b,X		; 74 FE
	ora ($49.b,X)		; 01 49
	stx $49.b,Y		; 96 49
	stx $45.b,Y		; 96 45
	sta ($B6.b),Y		; 91 B6
	phb		; 8B
	sbc $D6FF.w,X		; FD FF D6
	sbc $1281.w,X		; FD 81 12
	cmp $DF81.w,Y		; D9 81 DF
	sta ($F9.b,X)		; 81 F9
	sta ($80.b,X)		; 81 80
	adc $80.b		; 65 80
	inc $5807.w,X		; FE 07 58
	sta ($FE.b,X)		; 81 FE
	sta ($FE.b,X)		; 81 FE
	sta ($FE.b,X)		; 81 FE
	sta ($FE.b,X)		; 81 FE
	bra  -1.b		; 80 FF
	eor [$DA.b]		; 47 DA
	.db $42, $B1		; 42 B1
	jmp $4CC0.w		; 4C C0 4C
	adc $3FFFBF.l,X		; 7F BF FF 3F
	eor [$47.b]		; 47 47
	cpy #$4D.b		; C0 4D
	txs		; 9A
	eor $7FC0.w		; 4D C0 7F
	sta ($4D.b,S),Y		; 93 4D
	cpy #$A7.b		; C0 A7
	brk $95.b		; 00 95
	sta $95.b,X		; 95 95
	and $595959.l,X		; 3F 59 59 59
	eor $A9FC.w,Y		; 59 FC A9
	ora $69.b,S		; 03 69
	jmp $4804.w		; 4C 04 48
	and #$13.b		; 29 13
	stx $03.b,Y		; 96 03
	adc #$9C.b		; 69 9C
	dec $8B52.w		; CE 52 8B
	ora ($68.b)		; 12 68
	ora ($68.b)		; 12 68
	cpy #$CD.b		; C0 CD
	ora ($A8.b)		; 12 A8
	tax		; AA
	mvn $5D,$12		; 54 12 5D
	cpy #$CC.b		; C0 CC
	and #$02.b		; 29 02
	cop $29.b		; 02 29
	ora ($68.b)		; 12 68
	sta [$C0.b],Y		; 97 C0
	and $12A812.l,X		; 3F 12 A8 12
	eor [$54.b],Y		; 57 54
	ora ($AB.b)		; 12 AB
	cpy #$3F.b		; C0 3F
	cli		; 58
	sbc $FE16.w,X		; FD 16 FE
	sta ($1A.b),Y		; 91 1A
	adc $12.b		; 65 12
	tyx		; BB
	ora ($BB.b)		; 12 BB
	ldx #$DD.b		; A2 DD
	rol $1B.b		; 26 1B
	bra   0.b		; 80 00
	ora ($44.b)		; 12 44
	ror $5D.b		; 66 5D
	brk $05.b		; 00 05
	ora ($35.b)		; 12 35
	cop $2A.b		; 02 2A
	ora ($0A.b)		; 12 0A
	asl $1202.w,X		; 1E 02 12
	asl A		; 0A
	ora #$09.b		; 09 09
	sta $4512.w,X		; 9D 12 45
	ora ($7A.b)		; 12 7A
	.db $82, $12, $BD		; 82 12 BD
	ora ($CA.b)		; 12 CA
	sbc $12.b,X		; F5 12
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	ora ($E9.b)		; 12 E9
	inc $DD.b,X		; F6 DD
	rol $1B.b		; 26 1B
	lda $957F3F.l,X		; BF 3F 7F 95
	and $8AD37D.l,X		; 3F 7D D3 8A
	.db $42, $65		; 42 65
	lda $9D65BF.l,X		; BF BF 65 9D
	and $80C64D.l,X		; 3F 4D C6 80
	lda $DD2840.l,X		; BF 40 28 DD
	rol $55.b		; 26 55
	adc #$D326.w		; 69 26 D3
	sta ($9D.b),Y		; 91 9D
	sbc $DD005C.l,X		; FF 5C 00 DD
	rol $55.b		; 26 55
	adc #$D326.w		; 69 26 D3
	cpx #$4C1F.w		; E0 1F 4C
	lda $E31C01.l,X		; BF 01 1C E3
	jsr $603F.w		; 20 3F 60
	sta $9C3F30.l,X		; 9F 30 3F 9C
	ora ($81.b,X)		; 01 81
	clv		; B8
	eor [$89.b]		; 47 89
	stz $3F.b,X		; 74 3F
	stz $3F.b,X		; 74 3F
	brk $26.b		; 00 26
	ldx $7FC1.w,Y		; BE C1 7F
	ldy #$4E12.w		; A0 12 4E
	ora ($B1.b)		; 12 B1
	adc $D12EA0.l,X		; 7F A0 2E D1
	and $A6A2C0.l,X		; 3F C0 A2 A6
	.db $42, $A6		; 42 A6
	.db $42, $A6		; 42 A6
	dec $00.b,X		; D6 00
	rol $49.b		; 26 49
	sbc $1203.w,X		; FD 03 12
	and $6B42.w,X		; 3D 42 6B
	.db $42, $06		; 42 06
	ldx #$4264.w		; A2 64 42
	phx		; DA
	.db $42, $06		; 42 06
	asl $D6.b		; 06 D6
	ora ($E9.b)		; 12 E9
	ora ($95.b)		; 12 95
	stp		; DB
	and $F6.b,S		; 23 F6
	ror $120F.w		; 6E 0F 12
	lda $54.b		; A5 54
	ora ($B6.b)		; 12 B6
	ora ($56.b)		; 12 56
	inc $11.b,X		; F6 11
	inc $11.b,X		; F6 11
	.db $82, $80, $04		; 82 80 04
	and ($00.b)		; 32 00
	ora ($0B.b)		; 12 0B
	brk $09.b		; 00 09
	pei ($D4.b)		; D4 D4
	wai		; CB
	adc $C482.w,Y		; 79 82 C4
	and ($86.b,S),Y		; 33 86
	ora ($63.b)		; 12 63
	ora ($2C.b)		; 12 2C
	sbc ($3F.b,X)		; E1 3F
	brk $ED.b		; 00 ED
	tsb $B612.w		; 0C 12 B6
	sta ($3E.b)		; 92 3E
	sta ($0C.b)		; 92 0C
	brk $0C.b		; 00 0C
	brk $1C.b		; 00 1C
	brk $1E.b		; 00 1E
	stz $F3.b,X		; 74 F3
	brk $12.b		; 00 12
	adc $1200.w		; 6D 00 12
	adc $E5CB.w		; 6D CB E5
	rol A		; 2A
	ora ($76.b)		; 12 76
	ora ($91.b)		; 12 91
	ora ($3A.b)		; 12 3A
	cmp $FC3F.w,X		; DD 3F FC
	ora $1A12.w,Y		; 19 12 1A
	xce		; FB
	ora ($1A.b)		; 12 1A
	ora ($5B.b)		; 12 5B
	ora ($62.b)		; 12 62
	ora ($1B.b)		; 12 1B
	ora ($62.b)		; 12 62
	bpl -44.b		; 10 D4
	and ($00.b)		; 32 00
	cpx $00.b		; E4 00
	cpx $00.b		; E4 00
	ora ($84.b)		; 12 84
	brk $12.b		; 00 12
	sty $CB.b		; 84 CB
	beq  63.b		; F0 3F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	sed		; F8
	ora $788F78.l		; 0F 78 8F 78
	sta $8A0FF8.l		; 8F F8 0F 8A
	adc $7D7D.w,X		; 7D 7D 7D
	ply		; 7A
	ply		; 7A
	dec $34.b,X		; D6 34
	cpy #$E03F.w		; C0 3F E0
	ora $F71FE8.l,X		; 1F E8 1F F7
	ror $80C6.w		; 6E C6 80
	and $D622C0.l,X		; 3F C0 22 D6
	and $A14C.w,Y		; 39 4C A1
	jsl $02D7D6.l		; 22 D6 D7 02
	sbc $04FF02.l,X		; FF 02 FF 04
	sbc $07F8A9.l,X		; FF A9 F8 07
	sbc $F89174.l,X		; FF 74 91 F8
	stz $45D6.w		; 9C D6 45
	ldy $0E.b,X		; B4 0E
	sbc ($3F.b),Y		; F1 3F
	cpy #$F00F.w		; C0 0F F0
	sbc [$1E.b]		; E7 1E
	sbc $9103.w,X		; FD 03 91
	ror $FFE1.w		; 6E E1 FF
	asl $D6.b,X		; 16 D6
	ora ($B9.b)		; 12 B9
	ora ($47.b)		; 12 47
	ora ($3B.b)		; 12 3B
	cmp [$73.b]		; C7 73
	ora ($8E.b)		; 12 8E
	sbc ($0E.b,S),Y		; F3 0E
	sbc $1E.b,S		; E3 1E
	sbc $1C.b,S		; E3 1C
	sbc $1C.b,S		; E3 1C
	ora [$FC.b]		; 07 FC
	jmp $8BB2.w		; 4C B2 8B
	eor ($52.b)		; 52 52
	bit $D6FC.w,X		; 3C FC D6
	ora ($D2.b)		; 12 D2
	pld		; 2B
	lda [$12.b],Y		; B7 12
	lsr $ED.b		; 46 ED
	asl $1FFE.w,X		; 1E FE 1F
	ora ($4A.b)		; 12 4A
	ora ($A8.b)		; 12 A8
	ora ($6D.b)		; 12 6D
	ora ($AC.b)		; 12 AC
	sbc $EC23.w		; ED 23 EC
	and $04.b,S		; 23 04
	pei ($32.b)		; D4 32
	brk $17.b		; 00 17
	brk $12.b		; 00 12
	ora ($00.b,S),Y		; 13 00
	bpl   0.b		; 10 00
	bpl -53.b		; 10 CB
	sbc ($04.b,S),Y		; F3 04
	dey		; 88
	adc [$0C.b]		; 67 0C
	cmp [$12.b]		; C7 12
	cli		; 58
	cmp $7E.b,S		; C3 7E
	brk $DB.b		; 00 DB
	clc		; 18
	ora ($6C.b)		; 12 6C
	ora ($24.b)		; 12 24
	jmp ($2412.w,X)		; 7C 12 24
	asl A		; 0A
	ora ($38.b)		; 12 38
	brk $3C.b		; 00 3C
	stz $E7.b,X		; 74 E7
	brk $DB.b		; 00 DB
	brk $DB.b		; 00 DB
	wai		; CB
	ora ($CB.b)		; 12 CB
	mvn $12,$ED		; 54 ED 12
	jsl $127512.l		; 22 12 75 12
	tsx		; BA
	adc $1233F8.l,X		; 7F F8 33 12
	bit $F7.b,X		; 34 F7
	ora ($34.b)		; 12 34
	lda [$C4.b],Y		; B7 C4
	ora ($37.b)		; 12 37
	cpy $20.b		; C4 20
	brk $10.b		; 00 10
	and ($00.b)		; 32 00
	iny		; C8
	brk $C8.b		; 00 C8
	pei ($D4.b)		; D4 D4
	wai		; CB
	bra  -1.b		; 80 FF
	eor $7FC0.w		; 4D C0 7F
	cpy #$E07F.w		; C0 7F E0
	adc $6C47F0.l,X		; 7F F0 47 6C
	and $65654C.l,X		; 3F 4C 65 65
	adc $65.b		; 65 65
	sta $D6.b,X		; 95 D6
	dec A		; 3A
	eor $B4.b		; 45 B4
	ora ($8B.b,X)		; 01 8B
	rol $FC.b		; 26 FC
	inc $FEFC.w,X		; FE FC FE
	sbc $8BFF.w,X		; FD FF 8B
	.db $42, $8B		; 42 8B
	jmp $FED6.w		; 4C D6 FE
	ora [$FE.b]		; 07 FE
	ora [$58.b]		; 07 58
	inc $E007.w,X		; FE 07 E0
	ora $070FF9.l,X		; 1F F9 0F 07
	sbc $426316.l,X		; FF 16 63 42
	phx		; DA
	.db $42, $31		; 42 31
	phb		; 8B
	eor ($D6.b)		; 52 D6
	eor [$47.b]		; 47 47
	eor [$7F.b]		; 47 7F
	rol $9A.b		; 26 9A
	txs		; 9A
	and $FF.b,X		; 35 FF
	sta ($93.b,S),Y		; 93 93
	cpy #$FFDD.w		; C0 DD FF
	txa		; 8A
	ora $95.b,X		; 15 95
	sta $8A.b,X		; 95 8A
	and $59599D.l,X		; 3F 9D 59 59
	eor $1259.w,Y		; 59 59 12
	plp		; 28
	pld		; 2B
	bne -43.b		; D0 D5
	ora ($94.b)		; 12 94
	stz $5012.w,X		; 9E 12 50
	mvn $A4,$A4		; 54 A4 A4
	sta $2812.w,X		; 9D 12 28
	ora ($D7.b)		; 12 D7
	ora $9412.w		; 0D 12 94
	ora ($6B.b)		; 12 6B
	ora ($50.b)		; 12 50
	lda $12A512.l		; AF 12 A5 12
	tad		; 5B
	cmp $5526.w,X		; DD 26 55
	adc $668B.w		; 6D 8B 66
	cmp ($EE.b,S),Y		; D3 EE
	sbc $FFAA1B.l,X		; FF 1B AA FF
	tas		; 1B
	dey		; 88
	sbc $15491B.l,X		; FF 1B 49 15
	sbc $28121A.l,X		; FF 1A 12 28
	eor $311F1C.l,X		; 5F 1C 1F 31
	cld		; D8
	and ($0F.b)		; 32 0F
	ldy $5FD9.w		; AC D9 5F
	sbc $1BFFAF.l,X		; FF AF FF 1B
	dey		; 88
	sbc $F05855.l,X		; FF 55 58 F0
	cmp ($66.b)		; D2 66
	dec $AC.b		; C6 AC
	ldx $321D.w		; AE 1D 32
	ldx $7D00.w		; AE 00 7D
	cpx #$F10E.w		; E0 0E F1
	jsr ($DA26.w,X)		; FC 26 DA
	adc $A221A1.l,X		; 7F A1 21 A2
	sta $668058.l		; 8F 58 80 66
	and ($5C.b)		; 32 5C
	.db $62, $C6, $5A		; 62 C6 5A
	sep #$06		; E2 06
	ora ($3A.b)		; 12 3A
	inc $6A12.w,X		; FE 12 6A
	inc $FE86.w		; EE 86 FE
	eor ($FF.b)		; 52 FF
	lda ($0E.b,X)		; A1 0E
	ora $26EE42.l,X		; 1F 42 EE 26
	asl $D3.b,X		; 16 D3
	brk $E6.b		; 00 E6
	brk $FE.b		; 00 FE
	brk $EE.b		; 00 EE
	brk $FE.b		; 00 FE
	pha		; 48
	cmp $F2.b		; C5 F2
	ora $E2.b,X		; 15 E2
	ora $ED.b,X		; 15 ED
	ora ($16.b)		; 12 16
	inc $1F.b		; E6 1F
	sbc [$12.b],Y		; F7 12
	phd		; 0B
	inc $0E.b,X		; F6 0E
	xce		; FB
	asl $FC.b		; 06 FC
	ora $08.b,S		; 03 08
	pei ($D4.b)		; D4 D4
	rep #$04		; C2 04
	ora $661D.w,X		; 1D 1D 66
	and ($FF.b)		; 32 FF
	tsa		; 3B
	pld		; 2B
	.db $82, $1F, $8C		; 82 1F 8C
	eor ($92.b,S),Y		; 53 92
	stz $6112.w,X		; 9E 12 61
	adc $BEE1DF.l,X		; 7F DF E1 BE
	rol $6D12.w,X		; 3E 12 6D
	tsb $7D12.w		; 0C 12 7D
	brk $73.b		; 00 73
	dec $00.b		; C6 00
	ora ($61.b)		; 12 61
	tay		; A8
	rep #$C1		; C2 C1
	brk $F3.b		; 00 F3
	wai		; CB
	ora ($9B.b)		; 12 9B
	ora ($EA.b)		; 12 EA
	ora ($99.b)		; 12 99
	ora ($EA.b)		; 12 EA
	sbc $12.b,X		; F5 12
	eor ($12.b)		; 52 12
	eor ($12.b),Y		; 51 12
	ror $2B.b,X		; 76 2B
	ora ($24.b)		; 12 24
	ora ($D3.b)		; 12 D3
	ora ($DC.b)		; 12 DC
	adc [$18.b]		; 67 18
	lda $242430.l		; AF 30 24 24
	sty $8800.w		; 8C 00 88
	brk $12.b		; 00 12
	cld		; D8
	brk $20.b		; 00 20
	cmp ($35.b)		; D2 35
	wai		; CB
	jsr ($EE0F.w,X)		; FC 0F EE
	ora $C307E7.l		; 0F E7 07 C3
	ora $C1.b,S		; 03 C1
	cmp [$5A.b],Y		; D7 5A
	ldx $7D0F.w		; AE 0F 7D
	ora $3F171F.l		; 0F 1F 17 3F
	ora #$D33F.w		; 09 3F D3
	stz $EF.b,X		; 74 EF
	brk $E7.b		; 00 E7
	brk $C3.b		; 00 C3
	brk $C1.b		; 00 C1
	ora ($A2.b,S),Y		; 13 A2
	lda ($91.b,X)		; A1 91
	cmp ($5C.b,S),Y		; D3 5C
	jmp $07FC07.l		; 5C 07 FC 07
	jsr ($1607.w,X)		; FC 07 16
	jsr ($16FD.w,X)		; FC FD 16
	lda ($52.b,X)		; A1 52
	eor ($52.b)		; 52 52
	eor ($FC.b)		; 52 FC
	inc $5CD3.w,X		; FE D3 5C
	brk $FD.b		; 00 FD
	cmp $E4.b		; C5 E4
	pld		; 2B
	cpy $2B.b		; C4 2B
	stp		; DB
	ora ($2D.b)		; 12 2D
	cmp $EE3F.w		; CD 3F EE
	ora ($16.b)		; 12 16
	sbc $1D12.w		; ED 12 1D
	sbc [$0C.b],Y		; F7 0C
	sed		; F8
	asl $10.b		; 06 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	rep #$09		; C2 09
	brk $02.b		; 00 02
	sta $1D.b		; 85 1D
	wai		; CB
	ora ($57.b)		; 12 57
	ora $3F.b		; 05 3F
	ora $0001.w,Y		; 19 01 00
	ora ($24.b)		; 12 24
	bit $C212.w,X		; 3C 12 C2
	inc $C3BF.w,X		; FE BF C3
	jmp ($DB7C.w,X)		; 7C 7C DB
	clc		; 18
	ora ($FA.b)		; 12 FA
	brk $E6.b		; 00 E6
	stz $C3.b,X		; 74 C3
	ora $83C2.w,X		; 1D C2 83
	brk $E7.b		; 00 E7
	wai		; CB
	ora ($37.b)		; 12 37
	ora ($D4.b)		; 12 D4
	and ($12.b,S),Y		; 33 12
	pei ($12.b)		; D4 12
	xba		; EB
	ldy $12.b		; A4 12
	lda $EC.b,S		; A3 EC
	ora ($57.b)		; 12 57
	ora ($48.b)		; 12 48
	ora ($A7.b)		; 12 A7
	ora ($B8.b)		; 12 B8
	cmp $605F30.l		; CF 30 5F 60
	php		; 08
	pei ($00.b)		; D4 00
	eor ($10.b),Y		; 51 10
	brk $12.b		; 00 12
	bcs   0.b		; B0 00
	rti		; 40

	and $A8.b,X		; 35 A8
	wai		; CB
	cmp $0FCF1F.l,X		; DF 1F CF 0F
	sta [$07.b]		; 87 07
	bra -88.b		; 80 A8
	and $1F8A.w,Y		; 39 8A 1F
	and $557F2F.l,X		; 3F 2F 7F 55
	adc $D37F08.l,X		; 7F 08 7F D3
	brk $DF.b		; 00 DF
	brk $CF.b		; 00 CF
	brk $87.b		; 00 87
	tay		; A8
	tay		; A8
	lda ($9C.b,X)		; A1 9C
	eor ($32.b)		; 52 32
	sbc $B64CA1.l,X		; FF A1 4C B6
	tas		; 1B
	dey		; 88
	sbc $FCA1D3.l,X		; FF D3 A1 FC
	and ($C5.b)		; 32 C5
	lda $4B4F.w,X		; BD 4F 4B
	beq  72.b		; F0 48
	brk $21.b		; 00 21
	sbc $AAFF.w,X		; FD FF AA
	sbc $FF881B.l,X		; FF 1B 88 FF
	tas		; 1B
	ldx $0301.w		; AE 01 03
	ror $74.b		; 66 74
	sed		; F8
	phk		; 4B
	sbc #$6648.w		; E9 48 66
	eor #$FF40.w		; 49 40 FF
	eor #$7788.w		; 49 88 77
	eor #$1A27.w		; 49 27 1A
	and $AEA7C6.l,X		; 3F C6 A7 AE
	phk		; 4B
	and #$A8C0.w		; 29 C0 A8
	and $80.b,X		; 35 80
	bvs  73.b		; 70 49
	and [$66.b]		; 27 66
	lda [$C6.b]		; A7 C6
	lda [$AE.b]		; A7 AE
	phk		; 4B
	sbc $71A3C5.l,X		; FF C5 A3 71
	inc $5AD7.w,X		; FE D7 5A
	lda $71.b,S		; A3 71
	eor $4780C1.l,X		; 5F C1 80 47
	eor #$004B.w		; 49 4B 00
	rol $FF4B.w,X		; 3E 4B FF
	adc ($9F.b),Y		; 71 9F
	cpx #$FF28.w		; E0 28 FF
	eor #$71A3.w		; 49 A3 71
	jsr ($FF03.w,X)		; FC 03 FF
	phy		; 5A
	lda $71.b,S		; A3 71
	lda $49D983.l,X		; BF 83 D9 49
	phk		; 4B
	brk $7C.b		; 00 7C
	phk		; 4B
	sbc $4D3F71.l,X		; FF 71 3F 4D
	phy		; 5A
	lda $71.b,S		; A3 71
	jsr ($4848.w,X)		; FC 48 48
	sbc #$294B.w		; E9 4B 29
	ora $85.b,S		; 03 85
	sta $08.b		; 85 08
	ora [$49.b]		; 07 49
	and [$66.b]		; 27 66
	pha		; 48
	pha		; 48
	pha		; 48
	sbc #$4B66.w		; E9 66 4B
	eor $AA.b,X		; 55 AA
	trb $DF.b		; 14 DF
	jsr $FF14.w		; 20 14 FF
	cmp $4B.b		; C5 4B
	brk $69.b		; 00 69
	and $1200.w,X		; 3D 00 12
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $07.b		; 00 07
	asl $05.b		; 06 05
	brk $E1.b		; 00 E1
	eor [$D6.b],Y		; 57 D6
	eor #$0925.w		; 49 25 09
	sta ($B6.b,X)		; 81 B6
	bpl  96.b		; 10 60
	eor $05.b,S		; 43 05
	cpx $91.b		; E4 91
	lsr $45.b,X		; 56 45
	eor #$9EAC.w		; 49 AC 9E
	adc #$67A3.w		; 69 A3 67
	txs		; 9A
	cmp #$3422.w		; C9 22 34
	jmp $F354.w		; 4C 54 F3
	cmp #$9224.w		; C9 24 92
	pha		; 48
	ldy $D9.b,X		; B4 D9
	bit $AD.b		; 24 AD
	sta ($C8.b)		; 92 C8
	tya		; 98
	dey		; 88
	sty $40.b		; 84 40
	lda [$24.b]		; A7 24
	sta ($49.b)		; 92 49
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
	phk		; 4B
	bit $92.b		; 24 92
	pha		; 48
	trb $24.b		; 14 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	ora $DC48.w,Y		; 19 48 DC
	ldx #$0912.w		; A2 12 09
	asl $84.b		; 06 84
	.db $42, $B2		; 42 B2
	ldy $2EB3.w		; AC B3 2E
	and ($0C.b,S),Y		; 33 0C
	wai		; CB
	bit $86.b,X		; 34 86
	ror $D0.b		; 66 D0
	pha		; 48
	bit $22.b,X		; 34 22
	ora $95.b,X		; 15 95
	adc $99.b		; 65 99
	adc ($98.b),Y		; 71 98
	ror $59.b		; 66 59
	ldy $33.b		; A4 33
	rol $82.b,X		; 36 82
	eor ($A1.b,X)		; 41 A1
	bpl -84.b		; 10 AC
	plb		; AB
	bit $4487.w		; 2C 87 44
	jsl $75C659.l		; 22 59 C6 75
	stz $DA67.w,X		; 9E 67 DA
	asl $85.b		; 06 85
	trb $8B.b		; 14 8B
	lsr $34.b		; 46 34
	pha		; 48
	stz $42.b,X		; 74 42
	and $9C.b		; 25 9C
	adc [$59.b]		; 67 59
	inc $7D.b		; E6 7D
	ldy #$5168.w		; A0 68 51
	pha		; 48
	ldy $63.b,X		; B4 63
	mvp $44,$87		; 44 87 44
	jsl $75C659.l		; 22 59 C6 75
	stz $D168.w,X		; 9E 68 D1
	lda $3922.w		; AD 22 39
	asl $6990.w,X		; 1E 90 69
	phy		; 5A
	ror $9D.b		; 66 9D
	jsl $1A6A92.l		; 22 92 6A 1A
	stx $8D.b,Y		; 96 8D
	inc A		; 1A
	cmp ($23.b)		; D2 23
	sta ($E9.b),Y		; 91 E9
	asl $95.b		; 06 95
	ldx $69.b		; A6 69
	cmp ($29.b)		; D2 29
	rol $A1.b		; 26 A1
	lda #$D168.w		; A9 68 D1
	lda $3922.w		; AD 22 39
	asl $4990.w,X		; 1E 90 49
	lda $1A.b		; A5 1A
	ldx $AD.b		; A6 AD
	rol A		; 2A
	stx $6B.b,Y		; 96 6B
	inc A		; 1A
	dec $B9.b,X		; D6 B9
	lda $161B6C.l		; AF 6C 1B 16
	cmp #$9426.w		; C9 26 94
	ror A		; 6A
	txs		; 9A
	ldy $AA.b,X		; B4 AA
	eor $6BAC.w,Y		; 59 AC 6B
	phy		; 5A
	inc $BD.b		; E6 BD
	bcs 108.b		; B0 6C
	tad		; 5B
	bit $9A.b		; 24 9A
	eor ($AA.b),Y		; 51 AA
	ror A		; 6A
	cmp ($A9.b)		; D2 A9
	ror $CD.b		; 66 CD
	ldy $4B.b,X		; B4 4B
	ldx $1B.b		; A6 1B
	lsr $D9.b,X		; 56 D9
	lda [$4C.b],Y		; B7 4C
	ldx $9B.b		; A6 9B
	stx $E5.b		; 86 E5
	rol $DD.b,X		; 36 DD
	rol $6D.b,X		; 36 6D
	ldx #$305D.w		; A2 5D 30
	phx		; DA
	ldx $CD.b,Y		; B6 CD
	tsx		; BA
	adc $34.b		; 65 34
	jmp.w [$2937]		; DC 37 29
	ldx $E9.b,Y		; B6 E9
	lda ($6D.b,S),Y		; B3 6D
	ora ($E9.b)		; 12 E9
	stx $D5.b		; 86 D5
	ldx $4E.b,Y		; B6 4E
	and [$53.b]		; 27 53
	cmp #$03F5.w		; C9 F5 03
	ror $80.b,X		; 76 80
	dec $AD37.w,X		; DE 37 AD
	sbc ($85.b)		; F2 85
	lda $891370.l,X		; BF 70 13 89
	pei ($F2.b)		; D4 F2
	adc $DD40.w,X		; 7D 40 DD
	ldy #$8D37.w		; A0 37 8D
	xba		; EB
	jmp ($6FA1.w,X)		; 7C A1 6F
	jmp.w [$E204]		; DC 04 E2
	adc $3C.b,X		; 75 3C
	sta $6A3750.l,X		; 9F 50 37 6A
	and $1B.b		; 25 1B
	.db $82, $E1, $38		; 82 E1 38
	ror $8A23.w		; 6E 23 8A
	ldy $52.b		; A4 52
	clv		; B8
	dec $903B.w		; CE 3B 90
	cpx $A8.b		; E4 A8
	sty $6E.b,X		; 94 6E
	phd		; 0B
	sty $E1.b		; 84 E1
	clv		; B8
	stx $912A.w		; 8E 2A 91
	lsr A		; 4A
	sbc $38.b,S		; E3 38
	inc $9243.w		; EE 43 92
	ldx #$B851.w		; A2 51 B8
	rol $8613.w		; 2E 13 86
.ACCU 8
.INDEX 8
	sep #$39		; E2 39
	lsr $995A.w		; 4E 5A 99
	lsr $39E6.w		; 4E E6 39
	ldx $A172.w		; AE 72 A1
	eor ($E7.b)		; 52 E7
	tsx		; BA
	asl A		; 0A
	tas		; 1B
	dec $948B.w		; CE 8B 94
	sbc $A9.b		; E5 A9
	sty $EE.b,X		; 94 EE
	adc $9A.b,S		; 63 9A
	sbc [$2A.b]		; E7 2A
	ora $2E.b,X		; 15 2E
	tda		; 7B
	ldy #$A1.b		; A0 A1
	ldy $B9E8.w,X		; BC E8 B9
	lsr $995A.w		; 4E 5A 99
	lsr $39E6.w		; 4E E6 39
	tax		; AA
	lda $5A.b		; A5 5A
	lda ($5A.b),Y		; B1 5A
	ldx $AC57.w		; AE 57 AC
	asl $2B.b,X		; 16 2B
	and $9A.b		; 25 9A
	cmp ($D2.b),Y		; D1 D2
	stz $D5.b,X		; 74 D5
	lsr A		; 4A
	lda $62.b,X		; B5 62
	lda $5C.b,X		; B5 5C
	lda $562C58.l		; AF 58 2C 56
	phk		; 4B
	and $A3.b,X		; 35 A3
	ldy $E9.b		; A4 E9
	tax		; AA
	sta $6A.b,X		; 95 6A
	cmp $6A.b		; C5 6A
	lda $EA5E.w,Y		; B9 5E EA
	dec A		; 3A
	ldx $AEB3.w		; AE B3 AE
	cpx $5D2D.w		; EC 2D 5D
	sta [$69.b],Y		; 97 69
	stp		; DB
	adc [$1D.b],Y		; 77 1D
	cmp $B3.b,X		; D5 B3
	ldy $3AEA.w,X		; BC EA 3A
	ldx $AEB3.w		; AE B3 AE
	cpx $5D2D.w		; EC 2D 5D
	sta [$69.b],Y		; 97 69
	stp		; DB
	adc [$1D.b],Y		; 77 1D
	cmp $B3.b,X		; D5 B3
	ldy $3AEA.w,X		; BC EA 3A
	ldx $AEB3.w		; AE B3 AE
	cpx $562D.w		; EC 2D 56
	xba		; EB
	sta $CA.b		; 85 CA
	sbc #$76.b		; E9 76
	sbc $071EAF.l		; EF AF 1E 07
	sta $E2.b		; 85 E2
	sei		; 78
	dec $9547.w,X		; DE 47 95
	ror $5CB8.w		; 6E B8 5C
	ldx $6E97.w		; AE 97 6E
	plx		; FA
	sbc ($E0.b),Y		; F1 E0
	sei		; 78
	lsr $8D27.w,X		; 5E 27 8D
	cpx $79.b		; E4 79
	lsr $EB.b,X		; 56 EB
	sta $CA.b		; 85 CA
	sbc #$76.b		; E9 76
	sbc $3BCFBC.l		; EF BC CF 3B
	bne -67.b		; D0 BD
	eor $96DE2F.l,X		; 5F 2F DE 96
	ora $05.b,S		; 03 05
	sty $F5.b		; 84 F5
	and $636F.w,X		; 3D 6F 63
	cpy $BDF3.w		; CC F3 BD
	phd		; 0B
	cmp $F2.b,X		; D5 F2
	sbc $60E9.w,X		; FD E9 60
	bmi  88.b		; 30 58
	eor $F6D653.l		; 4F 53 D6 F6
	bit $3BCF.w,X		; 3C CF 3B
	bne -67.b		; D0 BD
	eor $D7DE2F.l,X		; 5F 2F DE D7
	lda $C486.w,Y		; B9 86 C4
	tda		; 7B
	cmp $C50704.l,X		; DF 04 07 C5
	sbc ($62.b)		; F2 62
	ldy #$31.b		; A0 31
	sta $EEB537.l,X		; 9F 37 B5 EE
	adc ($B1.b,X)		; 61 B1
	asl $C1F7.w,X		; 1E F7 C1
	ora ($F1.b,X)		; 01 F1
	jmp ($A898.w,X)		; 7C 98 A8
	tsb $CD67.w		; 0C 67 CD
	sbc $987B.w		; ED 7B 98
	jmp ($BD47.w)		; 6C 47 BD
	beq 127.b		; F0 7F
	eor [$D1.b]		; 47 D1
	sbc $63.b,X		; F5 63
	ldx $BBCF.w,Y		; BE CF BB
	beq  -4.b		; F0 FC
	ldy #$32.b		; A0 32
	ora $D32F.w,Y		; 19 2F D3
	inc $FE.b,X		; F6 FE
	rol $AB8F.w,X		; 3E 8F AB
	ora $7DF6.w,X		; 1D F6 7D
	cmp $01E587.l,X		; DF 87 E5 01
	bcc -55.b		; 90 C9
	ror $B79F.w,X		; 7E 9F B7
	sbc ($F4.b),Y		; F1 F4
	adc $EF58.w,X		; 7D 58 EF
	lda ($EE.b,S),Y		; B3 EE
	inc $30A3.w,X		; FE A3 30
	cpy $48B3.w		; CC B3 48
	ror $6D.b		; 66 6D
	tsb $83.b		; 04 83
	.db $42, $21		; 42 21
	eor $5956.w,Y		; 59 56 59
	sta [$19.b],Y		; 97 19
	stx $65.b		; 86 65
	txs		; 9A
	eor $33.b,S		; 43 33
	pla		; 68
	bit $1A.b		; 24 1A
	ora ($0A.b),Y		; 11 0A
	dex		; CA
	lda ($CC.b)		; B2 CC
	clv		; B8
	cpy $2C33.w		; CC 33 2C
	cmp ($19.b)		; D2 19
	sta $141A68.l,X		; 9F 68 1A 14
	eor ($2D.b)		; 52 2D
	clc		; 18
	cmp ($21.b),Y		; D1 21
	cmp ($08.b),Y		; D1 08
	stx $71.b,Y		; 96 71
	sta $9967.w,X		; 9D 67 99
	inc $81.b,X		; F6 81
	lda ($45.b,X)		; A1 45
	jsl $128DD1.l		; 22 D1 8D 12
	ora $8910.w,X		; 1D 10 89
	adc [$19.b]		; 67 19
	dec $79.b,X		; D6 79
	sta $141A68.l,X		; 9F 68 1A 14
	eor ($2D.b)		; 52 2D
	clc		; 18
	inc $33CD.w,X		; FE CD 33
	lsr $4991.w		; 4E 91 49
	and $0D.b,X		; 35 0D
	phk		; 4B
	lsr $8D.b		; 46 8D
	adc #$11.b		; 69 11
	iny		; C8
	pea $4A83.w		; F4 83 4A
	cmp ($34.b,S),Y		; D3 34
	sbc #$14.b		; E9 14
	sta ($50.b,S),Y		; 93 50
	pei ($B4.b)		; D4 B4
	pla		; 68
	dec $91.b,X		; D6 91
	trb $488F.w		; 1C 8F 48
	bit $AD.b,X		; 34 AD
	and ($4E.b,S),Y		; 33 4E
	sta ($49.b),Y		; 91 49
	and $0F.b,X		; 35 0F
	inc $B5D6.w		; EE D6 B5
	cmp $607B.w		; CD 7B 60
	cld		; D8
	ldx $49.b,Y		; B6 49
	bit $A3.b,X		; 34 A3
	mvn $A5,$D5		; 54 D5 A5
	eor ($CD.b)		; 52 CD
	adc $5A.b,S		; 63 5A
	cmp [$35.b],Y		; D7 35
	sbc $6283.w		; ED 83 62
	cmp $D224.w,Y		; D9 24 D2
	sta $5653.w		; 8D 53 56
	sta $4B.b,X		; 95 4B
	and $8D.b,X		; 35 8D
	rtl		; 6B

	jmp $0DB6D7.l		; 5C D7 B6 0D
	phb		; 8B
	jsr ($5326.w,X)		; FC 26 53
	eor $72C3.w		; 4D C3 72
	txy		; 9B
	ror $369B.w		; 6E 9B 36
	cmp ($2E.b),Y		; D1 2E
	tya		; 98
	adc $665B.w		; 6D 5B 66
	cmp $9A32.w,X		; DD 32 9A
	ror $941B.w		; 6E 1B 94
	stp		; DB
	stz $D9.b,X		; 74 D9
	ldx $89.b,Y		; B6 89
	stz $C3.b,X		; 74 C3
	ror A		; 6A
	stp		; DB
	rol $E9.b,X		; 36 E9
	sty $D3.b,X		; 94 D3
	bvs -36.b		; 70 DC
	ldx $DC.b		; A6 DC
	asl $F1.b		; 06 F1
	lda $946F.w,X		; BD 6F 94
	and $80FB.w		; 2D FB 80
	stz $A74E.w		; 9C 4E A7
	sta ($EA.b,S),Y		; 93 EA
	asl $ED.b		; 06 ED
	ora ($BC.b,X)		; 01 BC
	adc $0BE55B.l		; 6F 5B E5 0B
	ror $27E0.w,X		; 7E E0 27
	ora ($A9.b,S),Y		; 13 A9
	cpx $FA.b		; E4 FA
	sta ($BB.b,X)		; 81 BB
	rti		; 40

	adc $F9D61B.l		; 6F 1B D6 F9
	.db $42, $DF		; 42 DF
	lda $4A91CA.l,X		; BF CA 91 4A
	sbc $38.b,S		; E3 38
	inc $9243.w		; EE 43 92
	ldx #$51.b		; A2 51
	clv		; B8
	rol $8613.w		; 2E 13 86
.ACCU 8
.INDEX 8
	sep #$38		; E2 38
	tax		; AA
	eor $2B.b		; 45 2B
	sty $B9E3.w		; 8C E3 B9
	asl $894A.w		; 0E 4A 89
	lsr $E0.b		; 46 E0
	clv		; B8
	lsr $881B.w		; 4E 1B 88
.ACCU 8
	sep #$A9		; E2 A9
	trb $AE.b		; 14 AE
	and ($8E.b,S),Y		; 33 8E
	cpx $3F.b		; E4 3F
	cmp ($A1.b)		; D2 A1
	eor ($E7.b)		; 52 E7
	tsx		; BA
	asl A		; 0A
	tas		; 1B
	dec $948B.w		; CE 8B 94
	sbc $A9.b		; E5 A9
	sty $EE.b,X		; 94 EE
	adc $9A.b,S		; 63 9A
	sbc [$2A.b]		; E7 2A
	ora $2E.b,X		; 15 2E
	tda		; 7B
	ldy #$A1.b		; A0 A1
	ldy $B9E8.w,X		; BC E8 B9
	lsr $995A.w		; 4E 5A 99
	lsr $39E6.w		; 4E E6 39
	ldx $A172.w		; AE 72 A1
	eor ($E7.b)		; 52 E7
	tsx		; BA
	asl A		; 0A
	tas		; 1B
	wai		; CB
	ora $8A.b		; 05 8A
	cmp #$66.b		; C9 66
	ldy $74.b,X		; B4 74
	sta $5235.w,X		; 9D 35 52
	lda $AD58.w		; AD 58 AD
	eor [$2B.b],Y		; 57 2B
	dec $0B.b,X		; D6 0B
	ora $92.b,X		; 15 92
	cmp $E968.w		; CD 68 E9
	dec A		; 3A
	ror A		; 6A
	lda $5A.b		; A5 5A
	lda ($5A.b),Y		; B1 5A
	ldx $AC57.w		; AE 57 AC
	asl $2B.b,X		; 16 2B
	and $9A.b		; 25 9A
	cmp ($D2.b),Y		; D1 D2
	adc $DB69B7.l,X		; 7F B7 69 DB
	adc [$1D.b],Y		; 77 1D
	cmp $B3.b,X		; D5 B3
	ldy $3AEA.w,X		; BC EA 3A
	ldx $AEB3.w		; AE B3 AE
	cpx $5D2D.w		; EC 2D 5D
	sta [$69.b],Y		; 97 69
	stp		; DB
	adc [$1D.b],Y		; 77 1D
	cmp $B3.b,X		; D5 B3
	ldy $3AEA.w,X		; BC EA 3A
	ldx $AEB3.w		; AE B3 AE
	cpx $5D2D.w		; EC 2D 5D
	sta [$69.b],Y		; 97 69
	stp		; DB
	adc [$1D.b],Y		; 77 1D
	cmp $B3.b,X		; D5 B3
	inc $0F3C.w,X		; FE 3C 0F
	phd		; 0B
	cpy $F1.b		; C4 F1
	ldy $2A8F.w,X		; BC 8F 2A
	cmp $B970.w,X		; DD 70 B9
	eor $DD2E.w,X		; 5D 2E DD
	sbc $E3.b,X		; F5 E3
	cpy #$F0.b		; C0 F0
	ldy $1B4F.w,X		; BC 4F 1B
	iny		; C8
	sbc ($AD.b)		; F2 AD
	cmp [$0B.b],Y		; D7 0B
	sta $D2.b,X		; 95 D2
	sbc $5EDF.w		; ED DF 5E
	bit $0B0F.w,X		; 3C 0F 0B
	cpy $F1.b		; C4 F1
	ldy $FA8F.w,X		; BC 8F FA
	cpy #$60.b		; C0 60
	bcs -98.b		; B0 9E
	lda [$AD.b]		; A7 AD
	cpx $9E79.w		; EC 79 9E
	adc [$A1.b],Y		; 77 A1
	ply		; 7A
	ldx $BD5F.w,Y		; BE 5F BD
	bit $0B06.w		; 2C 06 0B
	ora #$EA.b		; 09 EA
	ply		; 7A
	dec $99C7.w,X		; DE C7 99
	sbc [$7A.b]		; E7 7A
	ora [$AB.b],Y		; 17 AB
	sbc $FB.b		; E5 FB
	cmp ($C0.b)		; D2 C0
	rts		; 60

	bcs -98.b		; B0 9E
	lda [$AD.b]		; A7 AD
	sbc ($7C.b,S),Y		; F3 7C
	eor $032A26.l,X		; 5F 26 2A 03
	ora $7BF3.w,Y		; 19 F3 7B
	lsr $1BE6.w,X		; 5E E6 1B
	ora ($EF.b),Y		; 11 EF
	jmp ($1F10.w,X)		; 7C 10 1F
	ora [$C9.b],Y		; 17 C9
	txa		; 8A
	bra -58.b		; 80 C6
	jmp ($D7DE.w,X)		; 7C DE D7
	lda $C486.w,Y		; B9 86 C4
	tda		; 7B
	cmp $C50704.l,X		; DF 04 07 C5
	sbc ($62.b)		; F2 62
	ldy #$31.b		; A0 31
	sta $40F9F9.l,X		; 9F F9 F9 40
	stz $32.b		; 64 32
	eor $FCEDA7.l,X		; 5F A7 ED FC
	adc $561F.w,X		; 7D 1F 56
	tsa		; 3B
	cpx $BFFB.w		; EC FB BF
	ora $2103CA.l		; 0F CA 03 21
	sta ($FD.b)		; 92 FD
	and $E8E36F.l,X		; 3F 6F E3 E8
	plx		; FA
	lda ($DF.b),Y		; B1 DF
	adc [$DD.b]		; 67 DD
	sed		; F8
	ror $1950.w,X		; 7E 50 19
	tsb $E997.w		; 0C 97 E9
	sbc $FB26E4.l,X		; FF E4 26 FB
	brk $17.b		; 00 17
	cpy #$04.b		; C0 04
	brk $2F.b		; 00 2F
	bit #$D3.b		; 89 D3
	bit $95.b,X		; 34 95
	mvp $8C,$4D		; 44 4D 8C
.INDEX 16
	rep #$10		; C2 10
	bne  73.b		; D0 49
	brk $81.b		; 00 81
	ora $B0.b,S		; 03 B0
	ora ($E1.b)		; 12 E1
	cmp #$7E.b		; C9 7E
	cmp #$4F.b		; C9 4F
	dey		; 88
.INDEX 16
	rep #$18		; C2 18
	.db $42, $82		; 42 82
	plp		; 28
	ldy $F5.b		; A4 F5
	eor #$A7.b		; 49 A7
	cmp ($28.b)		; D2 28
	cmp ($D4.b)		; D2 D4
	dec A		; 3A
	eor #$32.b		; 49 32
	.db $62, $25, $2C		; 62 25 2C
	bit #$04.b		; 89 04
	cpy $4FA4.w		; CC A4 4F
	bit $86EE.w		; 2C EE 86
	cmp #$CC.b		; C9 CC
	sta $26.b,X		; 95 26
	adc #$24.b		; 69 24
	eor #$0F.b		; 49 0F
	lsr A		; 4A
	cmp $74.b		; C5 74
	ldx $36.b		; A6 36
	adc #$51.b		; 69 51
	ldy $F2.b		; A4 F2
	eor #$34.b		; 49 34
	sta $65DFD2.l		; 8F D2 DF 65
	stx $5A.b,Y		; 96 5A
	stz $3C9B.w		; 9C 9B 3C
	lda ($A7.b)		; B2 A7
	rtl		; 6B

	ldy $CC.b		; A4 CC
	ldx $4F.b,Y		; B6 4F
	rol A		; 2A
	ror A		; 6A
	ldy $FB96.w		; AC 96 FB
	ror $DF.b		; 66 DF
	jsl $BF24D9.l		; 22 D9 24 BF
	jsl $962449.l		; 22 49 24 96
	pei ($22.b)		; D4 22
	eor $4588E4.l		; 4F E4 88 45
	ldx $49.b,Y		; B6 49
	bit $F9.b		; 24 F9
	ora ($59.b)		; 12 59
	lda [$D6.b]		; A7 D6
	eor $B624.w,Y		; 59 24 B6
	lsr A		; 4A
	phb		; 8B
	and $B2.b		; 25 B2
	eor #$25.b		; 49 25
	phx		; DA
	bpl  17.b		; 10 11
	tax		; AA
	cmp $12.b		; C5 12
	tax		; AA
	sbc ($BE.b,S),Y		; F3 BE
	mvp $70,$7E		; 44 7E 70
	ora $42.b		; 05 42
	asl A		; 0A
	sbc $7247.w,X		; FD 47 72
	bit $19BA.w		; 2C BA 19
	and $19.b,X		; 35 19
	eor $B664.w,Y		; 59 64 B6
	iny		; C8
	iny		; C8
	inc A		; 1A
	jsl $BBEC22.l		; 22 22 EC BB
	and $F4D28B.l		; 2F 8B D2 F4
	eor $AB.b,X		; 55 AB
	eor $AE4A5D.l		; 4F 5D 4A AE
	phk		; 4B
	eor $37F7.w,X		; 5D F7 37
	dec $0520.w,X		; DE 20 05
	.db $62, $C1, $AF		; 62 C1 AF
	bit $E7.b,X		; 34 E7
	bvc 120.b		; 50 78
	eor $07.b,S		; 43 07
	eor $EAF5C5.l		; 4F C5 F5 EA
	sbc $D00699.l,X		; FF 99 06 D0
	dec A		; 3A
	cmp ($FB.b,S),Y		; D3 FB
	ora $5C.b		; 05 5C
	stz $A998.w		; 9C 98 A9
	dec A		; 3A
	inc $BD.b		; E6 BD
	jmp ($A998.w,X)		; 7C 98 A9
	bra 107.b		; 80 6B
	wai		; CB
	ora [$98.b]		; 07 98
	adc #$CD.b		; 69 CD
	adc $5558.w,Y		; 79 58 55
	stz $CA7C.w,X		; 9E 7C CA
	cpy $DCF3.w		; CC F3 DC
	ror $66.b		; 66 66
	brk $A0.b		; 00 A0
	eor ($28.b,S),Y		; 53 28
	trb $4B.b		; 14 4B
	ldx #$55E8.w		; A2 E8 55
	sta ($F1.b)		; 92 F1
	sta $3C8E.w		; 8D 8E 3C
	cmp [$D6.b]		; C7 D6
	sta $6780F5.l,X		; 9F F5 80 67
	tya		; 98
	asl $01.b		; 06 01
	stx $75.b		; 86 75
	sbc [$C6.b]		; E7 C6
	ora $74.b,X		; 15 74
	and ($D5.b,S),Y		; 33 D5
	eor [$5D.b],Y		; 57 5D
	eor #$D7.b		; 49 D7
	brk $5E.b		; 00 5E
	bpl  85.b		; 10 55
	sta $CC.b,S		; 83 CC
	asl $AE.b,X		; 16 AE
	jmp $79B4.w		; 4C B4 79
	dec $BE8C.w,X		; DE 8C BE
	sty $5F.b,X		; 94 5F
	dex		; CA
	sbc $F4.b,S		; E3 F4
	rol $81.b,X		; 36 81
	lda $B11D2E.l		; AF 2E 1D B1
	phx		; DA
	ora $4F6EF4.l,X		; 1F F4 6E 4F
	trb $60.b		; 14 60
	sbc $BABF.w,Y		; F9 BF BA
	eor $0789.w,X		; 5D 89 07
	sbc $15BB89.l,X		; FF 89 BB 15
	stz $34.b,X		; 74 34
	bit $F7.b		; 24 F7
	dec $CD73.w,X		; DE 73 CD
	cmp [$D8.b]		; C7 D8
	cmp #$FC.b		; C9 FC
	cpx #$231A.w		; E0 1A 23
	lda $3A.b		; A5 3A
	eor $A6.b,S		; 43 A6
	and [$67.b],Y		; 37 67
	jsr ($AB0A.w,X)		; FC 0A AB
	adc ($E3.b)		; 72 E3
	ora $80.b		; 05 80
	ora $12.b		; 05 12
	tsb $8E55.w		; 0C 55 8E
	cmp $D2.b,S		; C3 D2
	ldx $AD.b,Y		; B6 AD
	adc ($1E.b),Y		; 71 1E
	eor $9A.b,S		; 43 9A
	ora ($48.b,X)		; 01 48
	sbc [$CC.b],Y		; F7 CC
	ora ($56.b,S),Y		; 13 56
	ror A		; 6A
	eor $3741.w		; 4D 41 37
	sty $F1F9.w		; 8C F9 F1
	sbc $EC06A3.l,X		; FF A3 06 EC
	dec $FEE0.w		; CE E0 FE
	lda ($0E.b)		; B2 0E
	stx $F6CC.w		; 8E CC F6
	ldy $B1.b		; A4 B1
	lsr $82F1.w		; 4E F1 82
	beq -116.b		; F0 8C
	ora ($91.b)		; 12 91
	stz $9841.w,X		; 9E 41 98
	sbc $BD4C.w,X		; FD 4C BD
	xce		; FB
	xce		; FB
	clc		; 18
	and [$DB.b],Y		; 37 DB
	bit $E183.w,X		; 3C 83 E1
	bcc 119.b		; 90 77
	and $0B8BCD.l,X		; 3F CD 8B 0B
	sta $74.b,S		; 83 74
	cmp ($BD.b,X)		; C1 BD
	cmp ($64.b),Y		; D1 64
	tya		; 98
	sta $98.b,S		; 83 98
	stx $CD.b,Y		; 96 CD
	sbc $05.b,S		; E3 05
	cmp $A072.w		; CD 72 A0
	ora $19E4.w,Y		; 19 E4 19
	mvp $9B,$66		; 44 66 9B
	eor ($95.b,X)		; 41 95
	sta $6E.b,S		; 83 6E
	sta $7611.w		; 8D 11 76
	eor ($CF.b,X)		; 41 CF
	inc A		; 1A
	ldx $7FF2.w,Y		; BE F2 7F
	sbc $DD60.w,Y		; F9 60 DD
	eor ($DE.b),Y		; 51 DE
	sta $DE41CC.l,X		; 9F CC 41 DE
	sbc $DDED96.l		; EF 96 ED DD
	and $BC.b,X		; 35 BC
	inc $0B.b		; E6 0B
	inc $C1CD.w		; EE CD C1
	cmp #$2F.b		; C9 2F
	iny		; C8
	and ($4F.b)		; 32 4F
	lda ($1F.b),Y		; B1 1F
	rol A		; 2A
	rol $8995.w		; 2E 95 89
	.db $82, $FE, $D1		; 82 FE D1
	ldy $3D.b		; A4 3D
	sbc ($A1.b)		; F2 A1
	asl $57.b		; 06 57
	sbc $E206CE.l,X		; FF CE 06 E2
	eor $063B.w,X		; 5D 3B 06
	sbc $2BB719.l,X		; FF 19 B7 2B
	bcc 119.b		; 90 77
	sta ($F2.b,X)		; 81 F2
	stz $AD8C.w		; 9C 8C AD
	tsa		; 3B
	asl $FE.b		; 06 FE
	sta $64.b,S		; 83 64
	eor [$20.b],Y		; 57 20
	sbc $58.b		; E5 58
	ldx #$BA60.w		; A2 60 BA
	sbc $1580.w,Y		; F9 80 15
	php		; 08
	and ($0C.b,S),Y		; 33 0C
	adc ($73.b,S),Y		; 73 73
	jmp ($8297.w,X)		; 7C 97 82
	cmp ($BA.b,X)		; C1 BA
	sta $BE.b,S		; 83 BE
	tsa		; 3B
	and ($0E.b)		; 32 0E
	lda $5C72.w,Y		; B9 72 5C
	sbc [$A0.b],Y		; F7 A0
	sbc ($F2.b,S),Y		; F3 F2
	lda $92.b,X		; B5 92
	inc $060E.w,X		; FE 0E 06
	lda $CB.b		; A5 CB
	ldx #$1D5E.w		; A2 5E 1D
	ora ($D1.b),Y		; 11 D1
	stz $E933.w		; 9C 33 E9
	stz $1083.w		; 9C 83 10
	eor $60E7.w,Y		; 59 E7 60
	beq -96.b		; F0 A0
	rti		; 40

	sty $99.b		; 84 99
	cmp ($5E.b),Y		; D1 5E
	and ($49.b)		; 32 49
	dex		; CA
	adc $9B36.w		; 6D 36 9B
	lsr $B8.b,X		; 56 B8
	sta [$E6.b],Y		; 97 E6
	adc $697A.w,Y		; 79 7A 69
	tsb $0413.w		; 0C 13 04
	cmp ($35.b,X)		; C1 35
	adc $5A.b		; 65 5A
	jmp ($504C.w)		; 6C 4C 50
	cmp $290C.w,X		; DD 0C 29
	and $F8A9.w,X		; 3D A9 F8
	eor $A858B7.l		; 4F B7 58 A8
	mvn $16,$2A		; 54 2A 16
	lsr $EBA8.w		; 4E A8 EB
	stx $CCA4.w		; 8E A4 CC
	ldy $CDCC.w		; AC CC CD
	rol $2B83.w		; 2E 83 2B
	bit $D996.w		; 2C 96 D9
	and #$97.b		; 29 97
	eor $D1.b		; 45 D1
	ldx #$CB2E.w		; A2 2E CB
	lda ($F8.b)		; B2 F8
	lda $D22B.w,X		; BD 2B D2
	cmp $CC5764.l,X		; DF 64 57 CC
	adc $79.b,S		; 63 79
	jmp ($5B5F.w,X)		; 7C 5F 5B
	pld		; 2B
	adc [$8F.b],Y		; 77 8F
	ldy $6CB0.w		; AC B0 6C
	sty $0033.w		; 8C 33 00
	sbc #$CE.b		; E9 CE
	ldy $9CD8.w,X		; BC D8 9C
	and ($82.b),Y		; 31 82
	sbc $0A7B.w,Y		; F9 7B 0A
	sbc $DE5E32.l,X		; FF 32 5E DE
	lda $05F1.w		; AD F1 05
	sbc $7ACC4F.l		; EF 4F CC 7A
	ora $B3.b		; 05 B3
	and ($32.b,S),Y		; 33 32
	ldx $BE43.w		; AE 43 BE
	jmp ($F508.w,X)		; 7C 08 F5
	lda $72.b,X		; B5 72
	.db $62, $A6, $C5		; 62 A6 C5
	stx $6C.b		; 86 6C
	sta $C37DA0.l		; 8F A0 7D C3
	ror $CA6B.w,X		; 7E 6B CA
	cmp $41.b		; C5 41
	jmp ($56D8.w)		; 6C D8 56
	ror $76.b,X		; 76 76
	ror $79.b,X		; 76 79
	inc $2005.w		; EE 05 20
	plp		; 28
	trb $0A.b		; 14 0A
	ora $02.b		; 05 02
	bit #$B5.b		; 89 B5
	ldx #$38E3.w		; A2 E3 38
	cld		; D8
	cmp $BCE455.l,X		; DF 55 E4 BC
	cmp [$99.b],Y		; D7 99
	ora $DD70B1.l,X		; 1F B1 70 DD
	tas		; 1B
	lda $EF.b,S		; A3 EF
	inc A		; 1A
	adc $A6.b,S		; 63 A6
	bit $67.b,X		; 34 67
	cli		; 58
	jmp $BBAAB8.l		; 5C B8 AA BB
	cpx $BA88.w		; EC 88 BA
	clv		; B8
	sbc $AD.b,X		; F5 AD
	dec A		; 3A
	bit $15.b		; 24 15
	lda ($3D.b)		; B2 3D
	sta ($7E.b,S),Y		; 93 7E
	lsr $26.b,X		; 56 26
	lda ($D0.b,X)		; A1 D0
	sbc $4D.b,S		; E3 4D
	iny		; C8
	plb		; AB
	sbc $B9.b		; E5 B9
	eor ($7A.b,S),Y		; 53 7A
	tda		; 7B
	lsr $4FB6.w,X		; 5E B6 4F
	asl $73.b		; 06 73
	mvn $4E,$6A		; 54 6A 4E
	cpx $4EEC.w		; EC EC 4E
	iny		; C8
	sbc $CF.b,X		; F5 CF
	trb $B960.w		; 1C 60 B9
	sbc $B23E3E.l,X		; FF 3E 3E B2
	rol $8FF7.w,X		; 3E F7 8F
	txa		; 8A
	eor ($7F.b,X)		; 41 7F
	bit $9BE1.w		; 2C E1 9B
.ACCU 16
	rep #$A9		; C2 A9
	eor $6A8301.l,X		; 5F 01 83 6A
	cmp ($62.b,S),Y		; D3 62
	sty $AB83.w		; 8C 83 AB
	ora $0A.b,X		; 15 0A
	stz $D8.b,X		; 74 D8
	rol $996B.w		; 2E 6B 99
	sta $99.b,X		; 95 99
	plb		; AB
	bpl 101.b		; 10 65
	ora ($99.b)		; 12 99
	stz $39.b,X		; 74 39
	ldy $5E1B.w		; AC 1B 5E
	stx $FB.b,Y		; 96 FB
	and $50.b,S		; 23 50
	eor ($D6.b,X)		; 41 D6
	ora $2791.w		; 0D 91 27
	lda ($C0.b)		; B2 C0
	sta $944056.l		; 8F 56 40 94
	lda $3ED9.w,Y		; B9 D9 3E
	tas		; 1B
	ora $E6.b		; 05 E6
	ror $55.b		; 66 55
	iny		; C8
	lda $19C436.l,X		; BF 36 C4 19
	stx $6C.b		; 86 6C
	sta [$EB.b]		; 87 EB
	bcs 125.b		; B0 7D
	txy		; 9B
	ora $0A816C.l,X		; 1F 6C 81 0A
	lsr $6D.b		; 46 6D
	asl $0D.b		; 06 0D
	phx		; DA
	cmp ($71.b),Y		; D1 71
	lda [$20.b]		; A7 20
	xba		; EB
	stx $E8.b		; 86 E8
	lda [$45.b],Y		; B7 45
	sta $6E.b,S		; 83 6E
	jmp $1D845B.l		; 5C 5B 84 1D
	mvp $66,$06		; 44 06 66
	phd		; 0B
	lda $0E3599.l		; AF 99 35 0E
	sta [$1A.b]		; 87 1A
	inx		; E8
	sta $30.b,S		; 83 30
	cmp #$50CD.w		; C9 CD 50
	inc $B0.b		; E6 B0
	and $A8.b,S		; 23 A8
	jsr $2B4A.w		; 20 4A 2B
	sbc $F60C.w,X		; FD 0C F6
	phd		; 0B
	lda $5C72.w,Y		; B9 72 5C
	jsr ($F0E2.w,X)		; FC E2 F0
	sta $28.b,S		; 83 28
	sta [$85.b],Y		; 97 85
	tad		; 5B
	dec $9B.b		; C6 9B
	asl $CF.b		; 06 CF
	rol $5879.w,X		; 3E 79 58
	sta $A8.b,S		; 83 A8
	ora ($60.b,S),Y		; 13 60
	bmi 108.b		; 30 6C
	sta $5ED1.w,Y		; 99 D1 5E
	lsr $41.b		; 46 41
	cmp [$E6.b],Y		; D7 E6
	sei		; 78
	cmp $0D.b		; C5 0D
	bne -62.b		; D0 C2
	sta ($DA.b,S),Y		; 93 DA
	sta $72FB84.l,X		; 9F 84 FB 72
	tda		; 7B
	pld		; 2B
	bvc -88.b		; 50 A8
	eor $A33A.w,Y		; 59 3A A3
	ldx $933A.w		; AE 3A 93
	plb		; AB
	ora ($9A.b,X)		; 01 9A
	eor $5606.w,X		; 5D 06 56
	eor $B22D.w,Y		; 59 2D B2
	phk		; 4B
	sta $E193.w,X		; 9D 93 E1
	cmp $221A.w,X		; DD 1A 22
	cpx $2FBB.w		; EC BB 2F
	phb		; 8B
	cmp ($FC.b)		; D2 FC
	stp		; DB
	ora $F3.b,X		; 15 F3
	clc		; 18
	dec $175F.w,X		; DE 5F 17
	dec $CA.b,X		; D6 CA
	cmp $EBE3.w,X		; DD E3 EB
	ora $66B8AE.l,X		; 1F AE B8 66
	ora ($D3.b,X)		; 01 D3
	sta $B179.w,X		; 9D 79 B1
	sec		; 38
	adc [$DB.b]		; 67 DB
	ora ($57.b,X)		; 01 57
	sta [$B0.b],Y		; 97 B0
	lda $ED25F3.l		; AF F3 25 ED
	nop		; EA
	cmp $50D066.l,X		; DF 66 D0 50
	ora $F9E9.w		; 0D E9 F9
	sta $4EB640.l		; 8F 40 B6 4E
	ora $BE.b,S		; 03 BE
	jmp ($F508.w,X)		; 7C 08 F5
	lda $72.b,X		; B5 72
	.db $62, $A6, $C5		; 62 A6 C5
	ror $FD8A.w		; 6E 8A FD
	ora $EE.b,S		; 03 EE
	tas		; 1B
	sbc ($5E.b,S),Y		; F3 5E
	lsr $2A.b,X		; 56 2A
	ora [$00.b],Y		; 17 00
	lsr $76.b,X		; 56 76
	ror $76.b,X		; 76 76
	adc $33EE.w,Y		; 79 EE 33
	plp		; 28
	bvc  40.b		; 50 28
	trb $0A.b		; 14 0A
	ora $12.b		; 05 12
	inx		; E8
	ora [$1B.b]		; 07 1B
	tas		; 1B
	nop		; EA
	ldy $9A97.w,X		; BC 97 9A
	sbc ($23.b,S),Y		; F3 23
	inc $1C.b,X		; F6 1C
	cmp $DD.b,X		; D5 DD
	ora $1DD378.l,X		; 1F 78 D3 1D
	and ($A3.b),Y		; 31 A3
	dec A		; 3A
	cmp $50.b,S		; C3 50
	cop $AE.b		; 02 AE
	xce		; FB
	jsl $3DAE2E.l		; 22 2E AE 3D
	rtl		; 6B

	lsr $FD2B.w		; 4E 2B FD
	tsb $0DF0.w		; 0C F0 0D
	sta ($EC.b),Y		; 91 EC
	txy		; 9B
	sbc ($B1.b)		; F2 B1
	stz $135E.w		; 9C 5E 13
	adc ($2A.b)		; 72 2A
	sbc $546E.w,Y		; F9 6E 54
	dec $D79E.w,X		; DE 9E D7
	lda $C193.w		; AD 93 C1
	plb		; AB
	sei		; 78
	cmp ($D4.b,S),Y		; D3 D4
	sta $D8D9.w,X		; 9D D9 D8
	sta $EB91.w,X		; 9D 91 EB
	stz $9E39.w,X		; 9E 39 9E
	lsr $15.b,X		; 56 15
	adc [$FC.b]		; 67 FC
	sed		; F8
	plx		; FA
	iny		; C8
	xce		; FB
	dec $2C3E.w,X		; DE 3E 2C
	cld		; D8
	asl A		; 0A
	ora ($F2.b,X)		; 01 F2
	dec $BC19.w		; CE 19 BC
	rol A		; 2A
	sta ($80.b),Y		; 91 80
	pea $7E1E.w		; F4 1E 7E
	lsr $B2.b,X		; 56 B2
	eor $D4C0C1.l,X		; 5F C1 C0 D4
	lda $F075.w,Y		; B9 75 F0
	ora [$A2.b],Y		; 17 A2
	dec A		; 3A
	and ($86.b,S),Y		; 33 86
	adc $9033.w,X		; 7D 33 90
	.db $62, $11, $80		; 62 11 80
	cmp ($F4.b,X)		; C1 F4
	sbc #$07A9.w		; E9 A9 07
	dec $01.b,X		; D6 01
	sta ($4E.b)		; 92 4E
	eor ($69.b,S),Y		; 53 69
	ldy $DA.b,X		; B4 DA
	lda $C4.b,X		; B5 C4
	adc ($56.b,S),Y		; 73 56
	pea $18D2.w		; F4 D2 18
	rol $09.b		; 26 09
	.db $82, $6A, $CD		; 82 6A CD
	rti		; 40

	tsb $3C17.w		; 0C 17 3C
	sbc ($5C.b,S),Y		; F3 5C
	ror $65.b		; 66 65
	jsr $05BA.w		; 20 BA 05
	ora ($E8.b)		; 12 E8
	tyx		; BB
	clc		; 18
	rol $9828.w		; 2E 28 98
	tya		; 98
	tya		; 98
	dey		; 88
	rol $50A1.w		; 2E A1 50
	tay		; A8
	mvn $2E,$18		; 54 18 2E
	jmp $5974FA.l		; 5C FA 74 59
	adc $B6.b		; 65 B6
	eor ($77.b,X)		; 41 77
	sta $C2.b		; 85 C2
	cpx $18BE.w		; EC BE 18
	rol $26BD.w		; 2E BD 26
	plb		; AB
	lsr $AD.b,X		; 56 AD
	and ($0B.b)		; 32 0B
	bcs  98.b		; B0 62
	tya		; 98
	lda $61.b		; A5 61
	eor $67.b,X		; 55 67
	stz $86CD.w,X		; 9E CD 86
	ror $79.b,X		; 76 79
	ldx $0500.w		; AE 00 05
	cop $91.b		; 02 91
	rti		; 40

	ldy #$1851.w		; A0 51 18
	rol A		; 2A
	plp		; 28
	sbc $71B9F8.l		; EF F8 B9 71
	cmp $0064.w,Y		; D9 64 00
	asl A		; 0A
	stx $71.b		; 86 71
	dey		; 88
	adc ($17.b,X)		; 61 17
	lda $02.b,S		; A3 02
	stz $09.b		; 64 09
	bcs  93.b		; B0 5D
	txy		; 9B
	and $F2.b,X		; 35 F2
	dec $C02B.w,X		; DE 2B C0
	jsr $23BC.w		; 20 BC 23
	bpl  -8.b		; 10 F8
	sbc [$6A.b]		; E7 6A
	bmi 109.b		; 30 6D
	ldy $52E5.w,X		; BC E5 52
	ora $00BF.w		; 0D BF 00
	clc		; 18
	and $3DDCD4.l		; 2F D4 DC 3D
	adc ($C1.b,S),Y		; 73 C1
	sta $D5.b		; 85 D5
	bcc  94.b		; 90 5E
	jmp.w [$1DE1]		; DC E1 1D
	sta $18C4.w,Y		; 99 C4 18
	rol $D579.w		; 2E 79 D5
	mvn $E8,$82		; 54 82 E8
	bpl  82.b		; 10 52
	tax		; AA
	cmp [$67.b]		; C7 67
	ror $CC4D.w		; 6E 4D CC
	stz $7CD5.w,X		; 9E D5 7C
	cpy #$C200.w		; C0 00 C2
	ora ($46.b,S),Y		; 13 46
	rts		; 60

	tya		; 98
	adc $06.b,S		; 63 06
	cmp $13.b		; C5 13
	ora ($11.b,S),Y		; 13 11
	asl $D4.b		; 06 D4
	rol A		; 2A
	ora $0D.b,X		; 15 0D
	ror $96.b,X		; 76 96
	adc $FBC7A5.l		; 6F A5 C7 FB
	ldx $3BC2.w		; AE C2 3B
	cmp $55.b,X		; D5 55
	sbc [$8F.b],Y		; F7 8F
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
	adc $7A.b,S		; 63 7A
	pha		; 48
	eor ($51.b,X)		; 41 51
	mvp $B9,$AA		; 44 AA B9
	bit $95.b,X		; 34 95
	lsr $A1.b,X		; 56 A1
	ora $58.b		; 05 58
	jsr $46A6.w		; 20 A6 46
	lsr $49.b		; 46 49
	and $A54D.w,Y		; 39 4D A5
	eor $BD.b,X		; 55 BD
	and $48D34B.l		; 2F 4B D3 48
	rts		; 60

	bcc  84.b		; 90 54
	cmp [$D2.b],Y		; D7 D2
	cpx $F25E.w		; EC 5E F2
	and $BF8C.w		; 2D 8C BF
	lda $6D55.w,Y		; B9 55 6D
	txy		; 9B
	lda ($CA.b,S),Y		; B3 CA
	and [$67.b],Y		; 37 67
	cmp ($20.b,X)		; C1 20
	tay		; A8
	lda ($DC.b),Y		; B1 DC
	adc $84AF.w,X		; 7D AF 84
	wai		; CB
	rol $D3.b,X		; 36 D3
	and ($D5.b,S),Y		; 33 D5
	eor $DC.b,X		; 55 DC
	txy		; 9B
	sta ($C4.b,S),Y		; 93 C4
	rol $14CF.w		; 2E CF 14
	cpx $0700.w		; EC 00 07
	sta $E4CB.w,X		; 9D CB E4
	cmp [$E1.b],Y		; D7 E1
	sbc $6F.b		; E5 6F
	trb $5545.w		; 1C 45 55
	sbc #$310D.w		; E9 0D 31
	ldy $D33B.w		; AC 3B D3
	bit $B982.w		; 2C 82 B9
	dec $7E8C.w,X		; DE 8C 7E
	ror $3F.b,X		; 76 3F
	eor ($5F.b),Y		; 51 5F
	eor $6A.b		; 45 6A
	ldx #$F6AA.w		; A2 AA F6
	cmp [$72.b]		; C7 72
	tda		; 7B
	stx $81.b		; 86 81
	ora ($05.b),Y		; 11 05
	eor #$D7E7.w		; 49 E7 D7
	dec $D5.b,X		; D6 D5
	ldy $D3.b		; A4 D3
	bne -36.b		; D0 DC
	rol A		; 2A
	lda $CB6F70.l		; AF 70 6F CB
	ora $63.b		; 05 63
	ror $4C41.w		; 6E 41 4C
	ora $3B.b,X		; 15 3B
	dec A		; 3A
	tax		; AA
	bra   5.b		; 80 05
	cop $81.b		; 02 81
	ora $3B.b		; 05 3B
	and [$66.b]		; 27 66
	cpx $BBF1.w		; EC F1 BB
	inc $D2.b		; E6 D2
	tax		; AA
	cpx $1E.b		; E4 1E
	and ($E3.b),Y		; 31 E3
	asl $8249.w,X		; 1E 49 82
	eor ($5C.b,X)		; 41 5C
	jmp $44BEBA.l		; 5C BA BE 44
	txs		; 9A
	lda [$26.b]		; A7 26
	lda $E2728B.l		; AF 8B 72 E2
	ldx $DF21.w		; AE 21 DF
	stz $5E63.w		; 9C 63 5E
	adc $200A.w		; 6D 0A 20
	ora $5E.b,S		; 03 5E
	adc $DED477.l,X		; 7F 77 D4 DE
	wai		; CB
	sbc #$F057.w		; E9 57 F0
	phx		; DA
	lsr A		; 4A
	tsx		; BA
	adc ($E2.b,S),Y		; 73 E2
	tas		; 1B
	ora $B4.b,S		; 03 B4
	rol $C5.b,X		; 36 C5
	bra   1.b		; 80 01
	inc $B4B2.w		; EE B2 B4
	lda ($7E.b)		; B2 7E
	rol $996F.w,X		; 3E 6F 99
	rol $55E9.w,X		; 3E E9 55
	jmp ($DED3.w,X)		; 7C D3 DE
	rol $AE79.w,X		; 3E 79 AE
	and ($88.b),Y		; 31 88
	and #$AD56.w		; 29 56 AD
	rol $26.b,X		; 36 26
	plp		; 28
	ror $1486.w		; 6E 86 14
	stz $05D0.w,X		; 9E D0 05
	.db $62, $A1, $50		; 62 A1 50
	tay		; A8
	eor $A13A.w,Y		; 59 3A A1
	ror $B9.b		; 66 B9
	sta $9959.w,Y		; 99 59 99
	txs		; 9A
	eor $5606.w,X		; 5D 06 56
	bvc -94.b		; 50 A2
	eor ($2E.b,S),Y		; 53 2E
	phb		; 8B
	lda $44.b,S		; A3 44
	eor $6297.w,X		; 5D 97 62
	lda $5B7A.w		; AD 7A 5B
	cpx $F98A.w		; EC 8A F9
	sty $2F6F.w		; 8C 6F 2F
	phb		; 8B
	xba		; EB
	brk $58.b		; 00 58
	rol $46.b,X		; 36 46
	ora $7480.w,Y		; 19 80 74
	sbc [$5E.b]		; E7 5E
	bmi 127.b		; 30 7F
	and $E65F61.l		; 2F 61 5F E6
	bpl 126.b		; 10 7E
	pea $C2FC.w		; F4 FC C2
	ldx $6566.w		; AE 66 65
	jmp $F87C87.l		; 5C 87 7C F8
	ora ($EB.b),Y		; 11 EB
	ror A		; 6A
	cpx $80.b		; E4 80
	adc ($9B.b,X)		; 61 9B
	and $E8.b,S		; 23 E8
	ora $9ADF70.l,X		; 1F 70 DF 9A
	sbc ($55.b),Y		; F1 55
	jmp ($56D8.w)		; 6C D8 56
	ror $76.b,X		; 76 76
	bvs   0.b		; 70 00
	ldy $05.b		; A4 05
	cop $81.b		; 02 81
	rti		; 40

	eor $DA.b,X		; 55 DA
	cmp ($71.b),Y		; D1 71
	stz $6F6C.w		; 9C 6C 6F
	tax		; AA
	sbc ($5E.b)		; F2 5E
	pla		; 68
	ora $C3.b		; 05 C3
	stz $6E.b,X		; 74 6E
	sta $8E69BC.l		; 8F BC 69 8E
	tya		; 98
	eor $B9.b,X		; 55 B9
	adc ($55.b),Y		; 71 55
	adc [$D9.b],Y		; 77 D9
	ora ($75.b),Y		; 11 75
	rts		; 60

	trb $48.b		; 14 48
	pld		; 2B
	stz $7B.b		; 64 7B
	jsl $9ACCD7.l		; 22 D7 CC 9A
	sta [$43.b]		; 87 43
	sta $2237.w		; 8D 37 22
	lda $4DE596.l		; AF 96 E5 4D
	sbc #$1986.w		; E9 86 19
	and $35AA.w,Y		; 39 AA 35
	and [$76.b]		; 27 76
	ror $27.b,X		; 76 27
	stz $30.b		; 64 30
	jmp ($9FFF.w,X)		; 7C FF 9F
	ora $FF4158.l,X		; 1F 58 41 FF
	bit $8AE1.w		; 2C E1 8A
	lda [$2E.b],Y		; B7 2E
	phk		; 4B
	stz $1EF4.w,X		; 9E F4 1E
	ror $B256.w,X		; 7E 56 B2
	eor $4401C0.l,X		; 5F C0 01 44
	ldy $233A.w,X		; BC 3A 23
	lda $38.b,S		; A3 38
	adc [$D3.b]		; 67 D3
	ora $64.b,X		; 15 64
	dec $F18A.w		; CE 8A F1
	sta ($4E.b)		; 92 4E
	eor ($69.b,S),Y		; 53 69
	ldy $01.b,X		; B4 01
	ror $9767.w,X		; 7E 67 97
	ldx $90.b		; A6 90
	cmp ($30.b,X)		; C1 30
	eor #$4FF8.w		; 49 F8 4F
	lda [$27.b],Y		; B7 27
	lda ($C1.b)		; B2 C1
	lda $D471.w,X		; BD 71 D4
	sta $0759.w,X		; 9D 59 07
	eor #$926D.w		; 49 6D 92
	jmp $0D9FEC.l		; 5C EC 9F 0D
	.db $82, $EF, $8B		; 82 EF 8B
	cmp ($FC.b)		; D2 FC
	stp		; DB
	bpl 102.b		; 10 66
	lsr $EF.b,X		; 56 EF
	ora $76FD58.l,X		; 1F 58 FD 76
	ora $9CD8.w		; 0D D8 9C
	and ($ED.b,S),Y		; 33 ED
	bcc 116.b		; 90 74
	lda $5BBD.w,X		; BD BD 5B
	cpx $0CDA.w		; EC DA 0C
	tas		; 1B
	inx		; E8
	asl $C9.b,X		; 16 C9
	iny		; C8
	dec A		; 3A
	rol A		; 2A
	jmp ($E856.w)		; 6C 56 E8
	bcs  92.b		; B0 5C
	sbc ($D6.b,S),Y		; F3 D6
	rol A		; 2A
	ora [$08.b],Y		; 17 08
	and ($80.b)		; 32 80
	cmp $66C63D.l		; CF 3D C6 66
	tsb $818A.w		; 0C 8A 81
	mvp $20,$BA		; 44 BA 20
	dex		; CA
	sta $CC.b,S		; 83 CC
	sta $5873D8.l		; 8F D8 73 58
	and [$46.b],Y		; 37 46
	adc $86.b,X		; 75 86
	ldy #$A383.w		; A0 83 A3
	dec $B4.b,X		; D6 B4
.ACCU 8
.INDEX 8
	sep #$BF		; E2 BF
	bne -49.b		; D0 CF
	rts		; 60

	lda $58F9.w,X		; BD F9 58
	dec $082F.w		; CE 2F 08
	and ($6B.b,S),Y		; 33 6B
	dec $C9.b,X		; D6 C9
	cpx #$D5.b		; E0 D5
	ldy $B069.w,X		; BC 69 B0
	eor $E678AE.l,X		; 5F AE 78 E6
	adc $8358.w,Y		; 79 58 83
	and $EF.b,S		; 23 EF
	sei		; 78
	sed		; F8
	lda ($60.b,S),Y		; B3 60
	bmi 110.b		; 30 6E
	beq -86.b		; F0 AA
	lsr $41.b		; 46 41
	jmp.w [$4B0D]		; DC 0D 4B
	sta [$5F.b],Y		; 97 5F
	ora ($83.b,X)		; 01 83
	adc $2106.w,Y		; 79 06 21
	ora $2A07.w,Y		; 19 07 2A
	cmp ($A6.b,S),Y		; D3 A6
	cmp ($71.b,X)		; C1 71
	cmp $AC00.w,Y		; D9 00 AC
	eor ($98.b,X)		; 41 98
	eor $6A.b,S		; 43 6A
	cmp [$11.b],Y		; D7 11
	cmp $DC60.w		; CD 60 DC
	ora ($56.b,S),Y		; 13 56
	ror A		; 6A
	php		; 08
	dec A		; 3A
	adc $B8E6.w,Y		; 79 E6 B8
	cpy $AECB.w		; CC CB AE
	cmp ($CD.b)		; D2 CD
	pea $FFB8.w		; F4 B8 FF
	adc $D8.b,X		; 75 D8
	bvc  40.b		; 50 28
	sta [$45.b],Y		; 97 45
	cmp $1FEF.w,Y		; D9 EF 1F
	sty $FA.b		; 84 FA
	dec $F4.b		; C6 F4
	txa		; 8A
	rol $26.b		; 26 26
	rol $28.b		; 26 28
	adc $55.b		; 65 55
	tay		; A8
	mvn $15,$2A		; 54 2A 15
	asl A		; 0A
	sty $15.b		; 84 15
	rol $3A7D.w		; 2E 7D 3A
	bit $DBB2.w		; 2C B2 DB
	stz $64.b		; 64 64
	stz $93.b		; 64 93
	sta $78.b,X		; 95 78
	jmp $E2CB2E.l		; 5C 2E CB E2
	pea $2FBD.w		; F4 BD 2F
	eor $5E21.w		; 4D 21 5E
	sta ($55.b,S),Y		; 93 55
	plb		; AB
	lsr $9C.b,X		; 56 9C
	cmp [$D2.b],Y		; D7 D2
	cpx $F25E.w		; EC 5E F2
	and $838D.w		; 2D 8D 83
	trb $C5.b		; 14 C5
	pld		; 2B
	asl $CD.b,X		; 16 CD
	cmp $1BE5.w,Y		; D9 E5 1B
	lda ($CD.b)		; B2 CD
	stx $76.b		; 86 76
	adc $45AE.w,Y		; 79 AE 45
	stx $EDE3.w		; 8E E3 ED
	jmp ($5A26.w,X)		; 7C 26 5A
	eor $02.b		; 45 02
	sta ($44.b,X)		; 81 44
	jmp.w [$939B]		; DC 9B 93
	cpy $2E.b		; C4 2E
	iny		; C8
	sbc $71B9F8.l		; EF F8 B9 71
	cmp $7964.w,Y		; D9 64 79
	jmp.w [$4DBE]		; DC BE 4D
	ror $561E.w,X		; 7E 1E 56
	sbc ($38.b,S),Y		; F3 38
	cpy $30.b		; C4 30
	phb		; 8B
	cmp ($A4.b,S),Y		; D3 A4
	bit $C6.b,X		; 34 C6
	bcs -17.b		; B0 EF
	lsr $0B.b		; 46 0B
	sbc [$7A.b]		; E7 7A
	and ($F9.b),Y		; 31 F9
	cld		; D8
	sbc $7D45.w,X		; FD 45 7D
	ora ($05.b),Y		; 11 05
	inc $C7.b,X		; F6 C7
	adc ($7B.b)		; 72 7B
	stx $81.b		; 86 81
	ror $CD.b		; 66 CD
	jmp ($8AB7.w,X)		; 7C B7 8A
	beq  36.b		; F0 24
	sbc ($EB.b,S),Y		; F3 EB
	xba		; EB
	ror A		; 6A
	cmp ($69.b)		; D2 69
	sbc ($18.b,X)		; E1 18
	sta [$C7.b]		; 87 C7
	tsa		; 3B
	eor ($B8.b,S),Y		; 53 B8
	and [$E5.b],Y		; 37 E5
	.db $82, $B0, $B6		; 82 B0 B6
	sbc ($98.b,S),Y		; F3 98
	dec A		; 3A
	bvs -65.b		; 70 BF
	jsr $07EA.w		; 20 EA 07
	lda #$B8.b		; A9 B8
	ply		; 7A
	sbc [$83.b]		; E7 83
	phd		; 0B
	plb		; AB
	ror $4E.b,X		; 76 4E
	cmp $E3D9.w		; CD D9 E3
	adc [$DB.b],Y		; 77 DB
	adc ($84.b,S),Y		; 73 84
	ror $67.b,X		; 76 67
	bpl -56.b		; 10 C8
	bit $C663.w,X		; 3C 63 C6
	bit $7992.w,X		; 3C 92 79
	cmp $57.b,X		; D5 57
	phb		; 8B
	sta [$57.b],Y		; 97 57
	iny		; C8
	sta ($54.b,S),Y		; 93 54
	cpx $D0.b		; E4 D0
	jsr $43AC.w		; 20 AC 43
	lda $BCC638.l,X		; BF 38 C6 BC
	stp		; DB
	sta ($73.b,S),Y		; 93 73
	and [$B5.b]		; 27 B5
	eor $3FAF31.l,X		; 5F 31 AF 3F
	tyx		; BB
	nop		; EA
	adc $93F465.l		; 6F 65 F4 93
	lsr $60.b		; 46 60
	tya		; 98
	ror $9C.b		; 66 9C
	sed		; F8
	stx $C0.b		; 86 C0
	sbc $8A05.w		; ED 05 8A
	rol $26.b		; 26 26
	and [$BA.b]		; 27 BA
	dex		; CA
	cmp ($C9.b)		; D2 C9
	sed		; F8
	sbc $60BE.w,Y		; F9 BE 60
	mvn $15,$2A		; 54 2A 15
	ora $8FF734.l		; 0F 34 F7 8F
	stz $886B.w,X		; 9E 6B 88
	sbc $BD3658.l		; EF 58 36 BD
	rol $AC.b		; 26 AC
	sty $1D.b		; 84 1D
	rts		; 60

	cmp $32.b		; C5 32
	adc #$30.b		; 69 30
	jmp $B0D9F3.l		; 5C F3 D9 B0
	cmp $288360.l		; CF 60 83 28
	trb $8A.b		; 14 8A
	ora $69.b,S		; 03 69
	sta $22.b,S		; 83 22
	stx $8BFF.w		; 8E FF 8B
	sta [$82.b],Y		; 97 82
	eor ($95.b,X)		; 41 95
	tsb $10E3.w		; 0C E3 10
	sta [$F7.b],Y		; 97 F7
	bmi  35.b		; 30 23
	beq  72.b		; F0 48
	ora ($9B.b)		; 12 9B
	adc #$99.b		; 69 99
	nop		; EA
	bcs  93.b		; B0 5D
	txy		; 9B
	and $F2.b,X		; 35 F2
	jsr ($B053.w,X)		; FC 53 B0
	jsr $23CC.w		; 20 CC 23
	bpl 113.b		; 10 71
	clc		; 18
	rol $76DE.w,X		; 3E DE 76
	eor $1702.w,Y		; 59 02 17
	sbc $AA.b		; E5 AA
	sty $EA1B.w		; 8C 1B EA
	ror $BA1E.w		; 6E 1E BA
	jsl $9CDB0E.l		; 22 0E DB 9C
	and $43.b,S		; 23 43
	bvs -63.b		; 70 C1
	lda ($CE.b,S),Y		; B3 CE
	tyx		; BB
	adc ($0E.b)		; 72 0E
	ldy #$03.b		; A0 03
	tsa		; 3B
	ora $C7.b		; 05 C7
	adc [$6E.b]		; 67 6E
	eor $A0CC.w		; 4D CC A0
	eor ($98.b,X)		; 41 98
	.db $42, $68		; 42 68
	dec $D3.b		; C6 D3
	ora [$C5.b]		; 07 C5
	asl $09.b,X		; 16 09
	cop $15.b		; 02 15
	asl A		; 0A
	ldx $CB2D.w,Y		; BE 2D CB
	sty $3C17.w		; 8C 17 3C
	sbc ($5C.b,S),Y		; F3 5C
	phx		; DA
	trb $48.b		; 14 48
	and ($81.b)		; 32 81
	mvp $E1,$AF		; 44 AF E1
	ldy $98.b,X		; B4 98
	rol $9828.w		; 2E 28 98
	ldx $C5.b,Y		; B6 C5
	.db $82, $0C, $A8		; 82 0C A8
	mvn $DD,$27		; 54 27 DD
	bmi 108.b		; 30 6C
	lda $E8F4.w,Y		; B9 F4 E8
	sbc $10.b,S		; E3 10
	adc $E1.b,X		; 75 E1
	bvs 106.b		; 70 6A
	cmp $A7.b,X		; D5 A7
	and $F4.b,X		; 35 F4
	tyx		; BB
	ora [$BC.b],Y		; 17 BC
	phb		; 8B
	adc $2F.b,S		; 63 2F
	inc $525C.w		; EE 5C 52
	lda ($6C.b),Y		; B1 6C
	cmp $519E.w,X		; DD 9E 51
	tyx		; BB
	rol $0C08.w,X		; 3E 08 0C
	sbc ($5C.b,S),Y		; F3 5C
	phb		; 8B
	ora $DAC7.w,X		; 1D C7 DA
	sed		; F8
	jmp $6DB3.w		; 4C B3 6D
	and ($3D.b,S),Y		; 33 3D
	phy		; 5A
	ora $13.b		; 05 13
	adc ($6E.b)		; 72 6E
	eor $3CBB10.l		; 4F 10 BB 3C
	eor ($B0.b,S),Y		; 53 B0
	and $B2.b,S		; 23 B2
	iny		; C8
	sbc ($B9.b,S),Y		; F3 B9
	jmp ($FC9A.w,X)		; 7C 9A FC
	bit $E3AD.w,X		; 3C AD E3
	dey		; 88
	clv		; B8
	eor $E9.b		; 45 E9
	cmp ($1A.b)		; D2 1A
	adc $58.b,S		; 63 58
	adc [$A6.b],Y		; 77 A6
	cli		; 58
	asl A		; 0A
	ldy $46EF.w,X		; BC EF 46
	and $A81F3B.l,X		; 3F 3B 1F A8
	lda $51B5A2.l		; AF A2 B5 51
	rti		; 40

	tsa		; 3B
	adc $B9.b,S		; 63 B9
	and $40C3.w,X		; 3D C3 40
	dey		; 88
	ora [$8A.b]		; 07 8A
	beq  36.b		; F0 24
	sbc ($EB.b,S),Y		; F3 EB
	xba		; EB
	ror A		; 6A
	cmp ($69.b)		; D2 69
	inx		; E8
	ror $E317.w		; 6E 17 E3
	sta $DCA9.w,X		; 9D A9 DC
	tas		; 1B
	sbc ($C1.b)		; F2 C1
	cli		; 58
	stp		; DB
	bra -63.b		; 80 C1
	cmp ($B3.b,S),Y		; D3 B3
	lda #$06.b		; A9 06
	bne  40.b		; D0 28
	brk $F0.b		; 00 F0
	adc ($75.b,X)		; 61 75
	ror $D9C9.w		; 6E C9 D9
	tyx		; BB
	bit $F96E.w,X		; 3C 6E F9
	ldy $BD.b,X		; B4 BD
	sta $32C4.w,Y		; 99 C4 32
	ora $8FF118.l		; 0F 18 F1 8F
	bit $C1.b		; 24 C1
	ora ($57.b,X)		; 01 57
	phb		; 8B
	sta [$57.b],Y		; 97 57
	iny		; C8
	sta ($54.b,S),Y		; 93 54
	cpx $D5.b		; E4 D5
	sbc ($6E.b),Y		; F1 6E
	jmp $3BC400.l		; 5C 00 C4 3B
	sbc ($8C.b,S),Y		; F3 8C
	rtl		; 6B

	cmp $44A1.w		; CD A1 44
	stz $7CD5.w,X		; 9E D5 7C
	dec $BC.b		; C6 BC
	inc $A9EF.w,X		; FE EF A9
	lda $D297.w,X		; BD 97 D2
	lda $B0B4E1.l		; AF E1 B4 B0
	jmp $4E33.w		; 4C 33 4E
	jmp ($6043.w,X)		; 7C 43 60
	ror $86.b,X		; 76 86
	cld		; D8
	bcs  49.b		; B0 31
	and ($3D.b),Y		; 31 3D
	dec $56.b,X		; D6 56
	stx $4F.b,Y		; 96 4F
	cmp [$CD.b]		; C7 CD
	sbc ($27.b,S),Y		; F3 27
	cmp $422D.w,X		; DD 2D 42
	lda ($E6.b,X)		; A1 E6
	stz $F3F1.w,X		; 9E F1 F3
	cmp $8C71.w		; CD 71 8C
	ora $33.b,S		; 03 33
	rol $4BBB.w		; 2E BB 4B
	and [$D2.b],Y		; 37 D2
	sbc $FD.b,S		; E3 FD
	cmp [$61.b],Y		; D7 61
	ora $DDEA.w,X		; 1D EA DD
	ora [$67.b],Y		; 17 67
	ldy $137E.w,X		; BC 7E 13
	xba		; EB
	tas		; 1B
	cmp ($40.b)		; D2 40
	clc		; 18
	tya		; 98
	lda ($95.b,X)		; A1 95
	eor [$26.b],Y		; 57 26
	sta ($D4.b)		; 92 D4
	rol A		; 2A
	ora $08.b,X		; 15 08
	rol A		; 2A
	cpy #$0C.b		; C0 0C
	lda ($DB.b)		; B2 DB
	stz $64.b		; 64 64
	stz $93.b		; 64 93
	sty $DA.b,X		; 94 DA
	tad		; 5B
	lda ($F8.b)		; B2 F8
	lda $4B2F.w,X		; BD 2F 4B
	cmp ($48.b,S),Y		; D3 48
	rts		; 60

	bra -63.b		; 80 C1
	lda ($CE.b,S),Y		; B3 CE
	dec $41CC.w		; CE CC 41
	ldy $0A.b,X		; B4 0A
	ora $D0.b		; 05 D0
	cmp ($74.b,X)		; C1 74
	sbc #$B4.b		; E9 B4
	phx		; DA
	lda $0B52.w		; AD 52 0B
	ldy $3156.w		; AC 56 31
	jmp $8251.w		; 4C 51 82
	inc $B9.b		; E6 B9
	sta ($B8.b,S),Y		; 93 B8
	ror $9B.b		; 66 9B
	rti		; 40

	.db $82, $E8, $9B		; 82 E8 9B
	adc ($E8.b)		; 72 E8
	cmp ($0C.b),Y		; D1 0C
	ora [$1D.b],Y		; 17 1D
	xce		; FB
	eor $5FAF.w,X		; 5D AF 5F
	bit $82.b		; 24 82
	sbc ($8D.b,S),Y		; F3 8D
	and $35A7.w,Y		; 39 A7 35
	sbc $05.b,S		; E3 05
	stp		; DB
	dec $9E55.w		; CE 55 9E
	adc ($0B.b)		; 72 0B
	lda $0A2800.l,X		; BF 00 28 0A
	plb		; AB
	ora $39.b,X		; 15 39
	and $097B39.l		; 2F 39 7B 09
	bit $6A17.w,X		; 3C 17 6A
	brk $15.b		; 00 15
	sty $7AF3.w		; 8C F3 7A
	sei		; 78
	sbc [$D9.b]		; E7 D9
	clc		; 18
	rol $B8DD.w		; 2E DD B8
	sbc $78CB6B.l,X		; FF 6B CB 78
	cpx $17.b		; E4 17
	jmp ($237C.w,X)		; 7C 7C 23
	lda [$3E.b]		; A7 3E
	plp		; 28
	cmp ($BA.b,X)		; C1 BA
	ora $A4EA.w,Y		; 19 EA A4
	tas		; 1B
	sei		; 78
	brk $30.b		; 00 30
	eor $F859BB.l,X		; 5F BB 59 F8
	ror $6F6E.w		; 6E 6E 6F
	sta ($41.b)		; 92 41
	stz $CF.b,X		; 74 CF
	cld		; D8
	ror A		; 6A
	asl $55F8.w		; 0E F8 55
	eor $D32D.w,Y		; 59 2D D3
	and [$E7.b]		; 27 E7
	lda ($47.b)		; B2 47
	stz $00.b		; 64 00
	and $CBE884.l		; 2F 84 E8 CB
	cmp ($08.b,S),Y		; D3 08
	rts		; 60

	clv		; B8
	ldx #$AB.b		; A2 AB
	lsr $6D2A.w		; 4E 2A 6D
	eor ($0B.b)		; 52 0B
	tay		; A8
	lsr $2B.b,X		; 56 2B
	clc		; 18
	ldx $FB.b		; A6 FB
	sbc $FE4F.w		; ED 4F FE
	jsr ($D2DF.w,X)		; FC DF D2
	plx		; FA
	and ($7D.b)		; 32 7D
	sta $55.b,X		; 95 55
	xce		; FB
	ora [$F4.b]		; 07 F4
	ora $8DED24.l,X		; 1F 24 ED 8D
	lda #$05.b		; A9 05
	eor $A6.b,X		; 55 A6
	cpy $AB.b		; C4 AB
	sta $AA7E.w,Y		; 99 7E AA
	lda $8A.b,X		; B5 8A
	bra   6.b		; 80 06
	adc ($05.b),Y		; 71 05
	and ($B2.b)		; 32 B2
	lda ($CB.b)		; B2 CB
	adc $5591.w		; 6D 91 55
	ror $B2CB.w		; 6E CB B2
	cpx $2FBE.w		; EC BE 2F
	pha		; 48
	rol A		; 2A
	adc $CA6F12.l,X		; 7F 12 6F CA
	plx		; FA
	and $75.b,X		; 35 75
	sta ($7F.b,S),Y		; 93 7F
	ply		; 7A
	tax		; AA
	sed		; F8
	eor [$CD.b]		; 47 CD
	tsa		; 3B
	adc $86.b,S		; 63 86
	adc $550581.l,X		; 7F 81 05 55
	cpx $AF1C.w		; EC 1C AF
	eor ($AF.b,S),Y		; 53 AF
	ror $9F.b		; 66 9F
	lda $5761B3.l		; AF B3 61 57
	cmp $3B.b,X		; D5 3B
	ora ($D6.b,S),Y		; 13 D6
	rol $588F.w		; 2E 8F 58
	ldy $00.b		; A4 00
	and $760E.w,X		; 3D 0E 76
	stz $7E.b,X		; 74 7E
	sbc $7F.b,X		; F5 7F
	adc ($F8.b,X)		; 61 F8
	lsr A		; 4A
	plb		; AB
	cmp ($17.b),Y		; D1 17
	inc $94.b		; E6 94
	xba		; EB
	ora $5D41DA.l		; 0F DA 41 5D
	asl $9E34.w		; 0E 34 9E
	dec $57.b,X		; D6 57
	sbc $1478.w,Y		; F9 78 14
	stz $C5.b		; 64 C5
	eor $5D.b,X		; 55 5D
	eor ($D5.b),Y		; 51 D5
	ora $2A5CDA.l,X		; 1F DA 5C 2A
	bcc  84.b		; 90 54
	ldx $7EDC.w,Y		; BE DC 7E
	adc $867C.w,X		; 7D 7C 86
	stx $DB.b,Y		; 96 DB
	ora $55.b,X		; 15 55
	ply		; 7A
	sta ($B8.b,S),Y		; 93 B8
	rol $45.b,X		; 36 45
	.db $82, $A9, $05		; 82 A9 05
	and $BCE0A1.l,X		; 3F A1 E0 BC
	clc		; 18
	eor $8C5B.w,X		; 5D 5B 8C
	tax		; AA
	lda $CEEC28.l,X		; BF 28 EC CE
	cpy $1BE2.w		; CC E2 1B
	ldx #$0A.b		; A2 0A
	sbc $EC.b		; E5 EC
	pld		; 2B
	jsr ($74D9.w,X)		; FC D9 74
	ror $BFB6.w		; 6E B6 BF
	adc $3C.b		; 65 3C
	nop		; EA
	tyx		; BB
	cmp ($F2.b,S),Y		; D3 F2
	stz $7EC3.w		; 9C C3 7E
	ply		; 7A
	adc $00.b		; 65 00
	ora ($8D.b,X)		; 01 8D
	sta $53FDDD.l		; 8F DD FD 53
	adc ($23.b)		; 72 23
	sbc $62.b,X		; F5 62
	lda $30C055.l,X		; BF 55 C0 30
	ora $4E6A90.l		; 0F 90 6A 4E
	cpy #$CE.b		; C0 CE
	brk $1F.b		; 00 1F
	eor $5D.b,S		; 43 5D
	jsr ($FD32.w,X)		; FC 32 FD
	lsr $B27F.w		; 4E 7F B2
	beq -107.b		; F0 95
	eor [$B7.b],Y		; 57 B7
	and $E7FBF8.l,X		; 3F F8 FB E7
	lsr $75.b,X		; 56 75
	cpy $15.b		; C4 15
	ldx $5BFB.w,Y		; BE FB 5B
	adc $F6E6E2.l,X		; 7F E2 E6 F6
	lda $BBC6C8.l		; AF C8 C6 BB
	eor $5F.b,X		; 55 5F
	bcs 127.b		; B0 7F
	sbc #$C0.b		; E9 C0
	and $052951.l,X		; 3F 51 29 05
	rol A		; 2A
	cmp $DFB2.w,Y		; D9 B2 DF
	lda ($C7.b),Y		; B1 C7
	tya		; 98
	xce		; FB
	adc ($FE.b,S),Y		; 73 FE
	bcs  12.b		; B0 0C
	and $38.b,S		; 23 38
	cpy #$30.b		; C0 30
	dec $F8A4.w		; CE A4 F8
	cmp $05.b,S		; C3 05
	wai		; CB
	sbc $FE22.w,Y		; F9 22 FE
	lsr $795F.w		; 4E 5F 79
	eor $5F10E7.l,X		; 5F E7 10 5F
	dec $EC3F.w		; CE 3F EC
	sbc ($8F.b)		; F2 8F
	iny		; C8
	eor $C182.w		; 4D 82 C1
	lda ($DB.b)		; B2 DB
	txa		; 8A
	sbc ($D1.b)		; F2 D1
	ora [$5F.b]		; 07 5F
	ora $24E3.w,Y		; 19 E3 24
	stx $5E.b,Y		; 96 5E
	phk		; 4B
	cmp $9179.w		; CD 79 91
	xce		; FB
	asl $DE6A.w		; 0E 6A DE
	tya		; 98
	lsr $98.b		; 46 98
	sbc #$8D.b		; E9 8D
	ora $1AD6.w,Y		; 19 D6 1A
	bra  57.b		; 80 39
	cmp $C0AF46.l,X		; DF 46 AF C0
	txy		; 9B
	cmp ($8F.b)		; D2 8F
	sbc $5551CF.l		; EF CF 51 55
	adc $CEFB11.l,X		; 7F 11 FB CE
	bne  -6.b		; D0 FA
	sty $44.b		; 84 44
	trb $AB.b		; 14 AB
	and $AFB8.w		; 2D B8 AF
	ora $B224.w,Y		; 19 24 B2
	sbc ($5E.b)		; F2 5E
	pla		; 68
	ora $F1.b		; 05 F1
	stz $985E.w,X		; 9E 5E 98
	lsr $98.b		; 46 98
	sbc #$85.b		; E9 85
	txa		; 8A
	rol $26.b		; 26 26
	rol $D177.w		; 2E 77 D1
	plb		; AB
	beq  38.b		; F0 26
	pea $FBA3.w		; F4 A3 FB
	sbc ($50.b,X)		; E1 50
	tay		; A8
	mvn $11,$3F		; 54 3F 11
	xce		; FB
	dec $FAD0.w		; CE D0 FA
	sty $F5.b		; 84 F5
	clc		; 18
	rol $6F.b,X		; 36 6F
	ror $F09F.w,X		; 7E 9F F0
	mvp $DD,$41		; 44 41 DD
	and #$FF.b		; 29 FF
	sbc $2C.b,S		; E3 2C
	ldx $DC.b,Y		; B6 DC
	sbc [$9E.b]		; E7 9E
	sbc ($E4.b,S),Y		; F3 E4
	sbc $36.b		; E5 36
	stx $EC.b,Y		; 96 EC
	ldx $CE2F.w,Y		; BE 2F CE
	sty $CDE8.w		; 8C E8 CD
	and ($82.b,X)		; 21 82
	ora [$43.b]		; 07 43
	sbc $DDB5.w,X		; FD B5 DD
	bit $FF.b		; 24 FF
	pei ($F1.b)		; D4 F1
	cmp $BFAAD2.l,X		; DF D2 AA BF
	cmp ($73.b)		; D2 73
	sta $293EF5.l		; 8F F5 3E 29
	sbc ($40.b)		; F2 40
	brk $84.b		; 00 84
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $F1.b,X		; 74 F1
	eor $6B1A.w,Y		; 59 1A 6B
	sta $20.b		; 85 20
	inx		; E8
	bmi   9.b		; 30 09
	and $51F1.w,Y		; 39 F1 51
	tsb $14.b		; 04 14
	cmp [$28.b]		; C7 28
	rol A		; 2A
	and $2CC7.w,X		; 3D C7 2C
	lda $1C.b		; A5 1C
	ldx $DF49.w		; AE 49 DF
	and $E56440.l		; 2F 40 64 E5
	adc $037D.w,X		; 7D 7D 03
	tsa		; 3B
	ora $CE.b,S		; 03 CE
	and $7FFF.w,Y		; 39 FF 7F
	ror $02.b,X		; 76 02
	ora $0E443F.l,X		; 1F 3F 44 0E
	rts		; 60

	ora $1F.b,S		; 03 1F
	ora ($BF.b)		; 12 BF
	ora ($9C.b,X)		; 01 9C
	ora ($79.b,X)		; 01 79
	ora ($57.b,X)		; 01 57
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	mvn $18,$63		; 54 63 18
	.db $42, $45		; 42 45
	stz $49.b		; 64 49
	lda [$51.b]		; A7 51
	rol A		; 2A
	and $456C.w,X		; 3D 6C 45
	brk $7C.b		; 00 7C
	inx		; E8
	bmi  10.b		; 30 0A
	and $49AE.w,Y		; 39 AE 49
	sbc ($51.b),Y		; F1 51
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 077FFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 077FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 077FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 077FFF. Skipping.
.ENDS
