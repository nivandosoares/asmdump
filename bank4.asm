.BANK 4 SLOT 0
.ORG $0000

.SECTION "Bank4" FORCE

	.db $42, $FB		; 42 FB
	brk $07.b		; 00 07
	asl $99.b		; 06 99
	brk $07.b		; 00 07
	asl $01.b		; 06 01
	and [$02.b]		; 27 02
	jsr $0510.w		; 20 10 05
	cop $02.b		; 02 02
	asl $05.b		; 06 05
	ora $07.b		; 05 07
	asl $06.b		; 06 06
	php		; 08
	ora [$07.b]		; 07 07
	ora #$0808.w		; 09 08 08
	asl A		; 0A
	bpl   2.b		; 10 02
	phd		; 0B
	bpl 101.b		; 10 65
	tsb $0909.w		; 0C 09 09
	ora $100B.w		; 0D 0B 10
	asl $6314.w		; 0E 14 63
	ora $116910.l		; 0F 10 69 11
	trb $6E.b		; 14 6E
	ora ($06.b)		; 12 06
	ora $13.b		; 05 13
	ora $141510.l		; 0F 10 15 14
	adc #$1016.w		; 69 16 10
	adc ($17.b)		; 72 17
	trb $74.b		; 14 74
	clc		; 18
	ora ($0E.b),Y		; 11 0E
	ora $0A0B.w,Y		; 19 0B 0A
	inc A		; 1A
	tsb $1B0C.w		; 0C 0C 1B
	adc $141D10.l		; 6F 10 1D 14
	adc $1E.b		; 65 1E
	ora ($67.b,S),Y		; 13 67
	ora $211517.l,X		; 1F 17 15 21
	stz $0A.b		; 64 0A
	jsl $237410.l		; 22 10 74 23
	trb $20.b		; 14 20
	bit $10.b		; 24 10
	tas		; 1B
	and $23.b		; 25 23
	trb $26.b		; 14 26
	bpl  97.b		; 10 61
	and [$14.b]		; 27 14
	adc $251D28.l		; 6F 28 1D 25
	and #$0710.w		; 29 10 07
	rol A		; 2A
	and [$14.b]		; 27 14
	pld		; 2B
	bpl  57.b		; 10 39
	and $6810.w		; 2D 10 68
	and $306C10.l		; 2F 10 6C 30
	bpl 121.b		; 10 79
	jsr $1C00.w		; 20 00 1C
	brk $04.b		; 00 04
	ora $1A.b,S		; 03 1A
	tsb $0509.w		; 0C 09 05
	eor $131E16.l		; 4F 16 1E 13
	ror $2F26.w		; 6E 26 2F
	asl A		; 0A
	lsr $0D.b,X		; 56 0D
	adc ($10.b)		; 72 10
	adc ($13.b,S),Y		; 73 13
	tas		; 1B
	ror $1B0A.w		; 6E 0A 1B
	ror $29.b		; 66 29
	asl $02.b		; 06 02
	mvn $19,$2D		; 54 2D 19
	mvp $75,$10		; 44 10 75
	ora $106C.w		; 0D 6C 10
	dec A		; 3A
	bpl   5.b		; 10 05
	mvn $73,$0D		; 54 0D 73
	jsl $16440A.l		; 22 0A 44 16
	ora ($76.b,S),Y		; 13 76
	ora $1049.w,Y		; 19 49 10
	eor #$6429.w		; 49 29 64
	ora $1E73.w		; 0D 73 1E
	bpl 110.b		; 10 6E
	ora $6121.w		; 0D 21 61
	bpl 110.b		; 10 6E
	bpl  33.b		; 10 21
	stz $0D.b		; 64 0D
	ror $0D.b,X		; 76 0D
	jmp ($7024.w)		; 6C 24 70
	ora $6221.w		; 0D 21 62
	bmi  16.b		; 30 10
	ora ($02.b)		; 12 02
	mvp $14,$15		; 44 15 14
	adc ($1F.b,S),Y		; 73 1F
	clc		; 18
	ora $287614.l,X		; 1F 14 76 28
	eor ($2A.b,S),Y		; 53 2A
	ror $17.b		; 66 17
	trb $77.b		; 14 77
	trb $61.b		; 14 61
	trb $72.b		; 14 72
	plp		; 28
	eor #$1418.w		; 49 18 14
	rol $0914.w		; 2E 14 09
	ora ($02.b)		; 12 02
	eor ($24.b,S),Y		; 53 24
	ror $22.b		; 66 22
	bpl 119.b		; 10 77
	rol $16.b		; 26 16
	ora $134C.w,Y		; 19 4C 13
	.db $62, $16, $26		; 62 16 26
	asl $0F.b,X		; 16 0F
	ora $2973.w		; 0D 73 29
	ora ($63.b)		; 12 63
	bit $70.b		; 24 70
	bmi  22.b		; 30 16
	asl $222D.w,X		; 1E 2D 22
	asl A		; 0A
	ror $310A.w,X		; 7E 0A 31
	pld		; 2B
	pld		; 2B
	bpl  50.b		; 10 32
	bpl   8.b		; 10 08
	mvp $14,$15		; 44 15 14
	adc ($1F.b,S),Y		; 73 1F
	clc		; 18
	ora $287614.l,X		; 1F 14 76 28
	eor ($2A.b,S),Y		; 53 2A
	ror $17.b		; 66 17
	trb $77.b		; 14 77
	trb $61.b		; 14 61
	trb $72.b		; 14 72
	plp		; 28
	eor #$1418.w		; 49 18 14
	rol $0914.w		; 2E 14 09
	ora ($02.b)		; 12 02
	eor ($2F.b,X)		; 41 2F
	and $741B0A.l		; 2F 0A 1B 74
	and $720D.w		; 2D 0D 72
	asl A		; 0A
	adc ($24.b,S),Y		; 73 24
	ror $22.b		; 66 22
	bpl 119.b		; 10 77
	rol $16.b		; 26 16
	ora $1061.w,Y		; 19 61 10
	ror $6410.w		; 6E 10 64
	and #$6D05.w		; 29 05 6D
	rol $22.b		; 26 22
	ora $1372.w		; 0D 72 13
	adc ($2F.b,X)		; 61 2F
	bpl 115.b		; 10 73
	asl A		; 0A
	adc $24.b,S		; 63 24
	bvs  48.b		; 70 30
	asl $1E.b,X		; 16 1E
	and $0A22.w		; 2D 22 0A
	ror $310A.w,X		; 7E 0A 31
	pld		; 2B
	pld		; 2B
	bpl  50.b		; 10 32
	bpl  18.b		; 10 12
	eor ($0E.b,X)		; 41 0E
	asl $6C2A.w		; 0E 2A 6C
	trb $61.b		; 14 61
	trb $64.b		; 14 64
	ora $2C14.w,X		; 1D 14 2C
	and $49.b		; 25 49
	clc		; 18
	trb $2E.b		; 14 2E
	trb $09.b		; 14 09
	php		; 08
	ora $4C.b		; 05 4C
	ora ($63.b,S),Y		; 13 63
	ora $106E.w		; 0D 6E 10
	adc ($0D.b,S),Y		; 73 0D
	and ($62.b,X)		; 21 62
	bmi  10.b		; 30 0A
	lsr $1115.w		; 4E 15 11
	ora [$1D.b],Y		; 17 1D
	ora ($14.b),Y		; 11 14
	stz $2A.b		; 64 2A
	inc A		; 1A
	tsb $0709.w		; 0C 09 07
	cop $20.b		; 02 20
	ora ($10.b,X)		; 01 10
	brk $42.b		; 00 42
	xce		; FB
	brk $07.b		; 00 07
	asl $11.b		; 06 11
	brk $07.b		; 00 07
	asl $01.b		; 06 01
	tas		; 1B
	cop $20.b		; 02 20
	trb $05.b		; 14 05
	cop $02.b		; 02 02
	asl $05.b		; 06 05
	ora $07.b		; 05 07
	asl $06.b		; 06 06
	php		; 08
	ora [$07.b]		; 07 07
	ora #$0808.w		; 09 08 08
	asl A		; 0A
	trb $69.b		; 14 69
	phd		; 0B
	ora #$0C09.w		; 09 09 0C
	php		; 08
	asl $0D.b		; 06 0D
	asl A		; 0A
	trb $0E.b		; 14 0E
	trb $02.b		; 14 02
	ora $111020.l		; 0F 20 10 11
	phd		; 0B
	phd		; 0B
	ora ($14.b)		; 12 14
	adc ($13.b,X)		; 61 13
	ora $101562.l		; 0F 62 15 10
	tsb $6516.w		; 0C 16 65
	trb $17.b		; 14 17
	bpl  19.b		; 10 13
	clc		; 18
	adc $1915.w,Y		; 79 15 19
	adc ($14.b,S),Y		; 73 14
	inc A		; 1A
	bpl  24.b		; 10 18
	tas		; 1B
	bpl 114.b		; 10 72
	ora $1412.w,X		; 1D 12 14
	asl $1A17.w,X		; 1E 17 1A
	ora $211614.l,X		; 1F 14 16 21
	tas		; 1B
	bpl  34.b		; 10 22
	ror $2014.w		; 6E 14 20
	brk $1C.b		; 00 1C
	brk $04.b		; 00 04
	ora $09.b,S		; 03 09
	ora [$06.b]		; 07 06
	ora $0F.b		; 05 0F
	ora #$0708.w		; 09 08 07
	ora $02.b		; 05 02
	bvc  33.b		; 50 21
	adc $216710.l		; 6F 10 67 21
	adc ($10.b,X)		; 61 10
	adc $6D10.w		; 6D 10 6D
	bpl 101.b		; 10 65
	bpl 100.b		; 10 64
	asl $1441.w,X		; 1E 41 14
	adc $6F14.w		; 6D 14 6F
	trb $72.b		; 14 72
	trb $79.b		; 14 79
	asl $1457.w		; 0E 57 14
	adc $672214.l		; 6F 14 22 67
	trb $0C.b		; 14 0C
	ora $02.b		; 05 02
	eor $14.b		; 45 14
	adc ($0D.b)		; 72 0D
	rtl		; 6B

	asl $0D4B.w		; 0E 4B 0D
	ora $0919.w,Y		; 19 19 09
	php		; 08
	ora [$41.b]		; 07 41
	and ($74.b,X)		; 21 74
	asl $4A05.w,X		; 1E 05 4A
	ora $1463.w,X		; 1D 63 14
	rtl		; 6B

	ora $0E65.w		; 0D 65 0E
	eor ($0D.b)		; 52 0D
	stz $14.b,X		; 74 14
	adc $14.b,S		; 63 14
	pla		; 68
	ora $0916.w		; 0D 16 09
	tsb $4D02.w		; 0C 02 4D
	bpl 117.b		; 10 75
	bpl 115.b		; 10 73
	bpl 105.b		; 10 69
	bpl  99.b		; 10 63
	asl $4B05.w,X		; 1E 05 4B
	trb $72.b		; 14 72
	ora $0E73.w		; 0D 73 0E
	pha		; 48
	ora $1474.w,X		; 1D 74 14
	jmp ($6C1F.w)		; 6C 1F 6C
	ora $1464.w		; 0D 64 14
	php		; 08
	ora $41.b		; 05 41
	trb $6C.b		; 14 6C
	ora $7419.w		; 0D 19 74
	ora ($0D.b)		; 12 0D
	adc ($0E.b)		; 72 0E
	pha		; 48
	ora $1472.w		; 0D 72 14
	ora $1474.w,Y		; 19 74 14
	ora #$500C.w		; 09 0C 50
	and ($6F.b,X)		; 21 6F
	bpl 100.b		; 10 64
	bpl 117.b		; 10 75
	bpl  99.b		; 10 63
	bpl 101.b		; 10 65
	bpl 100.b		; 10 64
	asl $4802.w,X		; 1E 02 48
	ora $2222.w,X		; 1D 22 22
	adc $1F4C0E.l		; 6F 0E 4C 1F
	adc $6B14.w		; 6D 14 6B
	ora $50020C.l,X		; 1F 0C 02 50
	ora $0E6D.w,X		; 1D 6D 0E
	jmp $761F.w		; 4C 1F 76
	ora $1922.w		; 0D 22 19
	ora ($11.b),Y		; 11 11
	phd		; 0B
	ora #$0507.w		; 09 07 05
	jsr $1401.w		; 20 01 14
	brk $42.b		; 00 42
	xce		; FB
	brk $07.b		; 00 07
	asl $CD.b		; 06 CD
	brk $07.b		; 00 07
	asl $28.b		; 06 28
	bpl  41.b		; 10 29
	ora ($00.b,X)		; 01 00
	rol A		; 2A
	and #$2B29.w		; 29 29 2B
	rol A		; 2A
	rol A		; 2A
	bit $2B2B.w		; 2C 2B 2B
	and $2C2C.w		; 2D 2C 2C
	rol $08E7.w		; 2E E7 08
	and $302D00.l		; 2F 00 2D 30
	rol $01.b		; 26 01
	and ($30.b),Y		; 31 30
	bmi  50.b		; 30 32
	rol $332E.w		; 2E 2E 33
	and $2A3429.l		; 2F 29 34 2A
	and #$3135.w		; 29 35 31
	and ($36.b),Y		; 31 36
	sbc $003733.l		; EF 33 37 00
	and #$2F38.w		; 29 38 2F
	bit $20.b,X		; 34 20
	brk $1C.b		; 00 1C
	brk $01.b		; 00 01
	ora ($2D.b,X)		; 01 2D
	and $2B2C.w		; 2D 2C 2B
	cop $2F.b		; 02 2F
	bit $2A2B.w		; 2C 2B 2A
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	rol A		; 2A
	asl $2F.b		; 06 2F
	bit $0734.w		; 2C 34 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	and [$0A.b],Y		; 37 0A
	brk $0B.b		; 00 0B
	and [$0C.b],Y		; 37 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	and $10292B.l		; 2F 2B 29 10
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
	sec		; 38
	tas		; 1B
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
	sec		; 38
	and [$00.b]		; 27 00
	plp		; 28
	plp		; 28
	brk $28.b		; 00 28
	and #$2800.w		; 29 00 28
	rol A		; 2A
	brk $28.b		; 00 28
	pld		; 2B
	brk $28.b		; 00 28
	bit $2800.w		; 2C 00 28
	and $2800.w		; 2D 00 28
	rol $2800.w		; 2E 00 28
	and $302800.l		; 2F 00 28 30
	brk $28.b		; 00 28
	and ($00.b),Y		; 31 00
	plp		; 28
	and ($00.b)		; 32 00
	plp		; 28
	and ($2F.b,S),Y		; 33 2F
	pld		; 2B
	and #$3428.w		; 29 28 34
	brk $28.b		; 00 28
	and $00.b,X		; 35 00
	plp		; 28
	rol $00.b,X		; 36 00
	plp		; 28
	and [$00.b],Y		; 37 00
	plp		; 28
	sec		; 38
	brk $39.b		; 00 39
	brk $3A.b		; 00 3A
	brk $3B.b		; 00 3B
	brk $3C.b		; 00 3C
	brk $3D.b		; 00 3D
	brk $3E.b		; 00 3E
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $27.b		; 00 27
	cpy #$2D.b		; C0 2D
	and #$0041.w		; 29 41 00
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
	and ($4F.b,S),Y		; 33 4F
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
	sec		; 38
	eor $5E00.w,X		; 5D 00 5E
	brk $5F.b		; 00 5F
	brk $60.b		; 00 60
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
	and $006B2A.l		; 2F 2A 6B 00
	jmp ($6D00.w)		; 6C 00 6D
	brk $6E.b		; 00 6E
	brk $6F.b		; 00 6F
	and [$70.b],Y		; 37 70
	brk $71.b		; 00 71
	brk $72.b		; 00 72
	brk $73.b		; 00 73
	brk $74.b		; 00 74
	brk $75.b		; 00 75
	brk $76.b		; 00 76
	brk $77.b		; 00 77
	and $790078.l		; 2F 78 00 79
	brk $7A.b		; 00 7A
	brk $7B.b		; 00 7B
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	and [$7E.b],Y		; 37 7E
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	and ($86.b,S),Y		; 33 86
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
	sec		; 38
	sta $00.b,X		; 95 00
	stx $00.b,Y		; 96 00
	sta [$00.b],Y		; 97 00
	tya		; 98
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	and $00A12B.l		; 2F 2B A1 00
	ldx #$00.b		; A2 00
	lda $00.b,S		; A3 00
	ldy $00.b		; A4 00
	lda $00.b		; A5 00
	ldx $00.b		; A6 00
	lda [$00.b]		; A7 00
	tay		; A8
	brk $A9.b		; 00 A9
	brk $AA.b		; 00 AA
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	sec		; 38
	ldx $AF00.w		; AE 00 AF
	brk $B0.b		; 00 B0
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
	brk $BB.b		; 00 BB
	and ($BC.b,S),Y		; 33 BC
	brk $BD.b		; 00 BD
	and [$BE.b],Y		; 37 BE
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
	and $00C92A.l		; 2F 2A C9 00
	ora $CA80.w		; 0D 80 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $D3.b		; 00 D3
	and $D42A2B.l		; 2F 2B 2A D4
	brk $D5.b		; 00 D5
	brk $D6.b		; 00 D6
	brk $D7.b		; 00 D7
	brk $D8.b		; 00 D8
	brk $D9.b		; 00 D9
	brk $DA.b		; 00 DA
	brk $DB.b		; 00 DB
	and [$DC.b],Y		; 37 DC
	brk $DD.b		; 00 DD
	and $00DE2C.l		; 2F 2C DE 00
	cmp $00E000.l,X		; DF 00 E0 00
	sbc ($00.b,X)		; E1 00
	sbc ($40.b,X)		; E1 40
	and $342B.w		; 2D 2B 34
	sep #$08		; E2 08
	sbc $08.b,S		; E3 08
	cpx $08.b		; E4 08
	sbc $08.b		; E5 08
	inc $08.b		; E6 08
	rol $08E8.w		; 2E E8 08
	sbc #$EA08.w		; E9 08 EA
	php		; 08
	xba		; EB
	php		; 08
	cpx $2E08.w		; EC 08 2E
	sbc $EE08.w		; ED 08 EE
	php		; 08
	rol $F0.b,X		; 36 F0
	php		; 08
	sbc ($08.b),Y		; F1 08
	sbc ($08.b)		; F2 08
	sbc ($08.b,S),Y		; F3 08
	pea $F508.w		; F4 08 F5
	php		; 08
	inc $08.b,X		; F6 08
	sbc [$08.b],Y		; F7 08
	sed		; F8
	php		; 08
	sbc $FA08.w,Y		; F9 08 FA
	php		; 08
	xce		; FB
	php		; 08
	jsr ($FD08.w,X)		; FC 08 FD
	php		; 08
	rol $FE.b,X		; 36 FE
	php		; 08
	sbc $090008.l,X		; FF 08 00 09
	ora ($09.b,X)		; 01 09
	cop $09.b		; 02 09
	ora $09.b,S		; 03 09
	tsb $09.b		; 04 09
	ora $09.b		; 05 09
	asl $09.b		; 06 09
	ora [$09.b]		; 07 09
	php		; 08
	ora #$0909.w		; 09 09 09
	asl A		; 0A
	ora #$362E.w		; 09 2E 36
	phd		; 0B
	ora #$090C.w		; 09 0C 09
	ora $0E09.w		; 0D 09 0E
	ora #$090F.w		; 09 0F 09
	bpl   9.b		; 10 09
	ora ($09.b),Y		; 11 09
	ora ($09.b)		; 12 09
	ora ($09.b,S),Y		; 13 09
	trb $09.b		; 14 09
	ora $09.b,X		; 15 09
	asl $09.b,X		; 16 09
	and ($36.b)		; 32 36
	and ($17.b)		; 32 17
	ora #$0918.w		; 09 18 09
	ora $1A09.w,Y		; 19 09 1A
	ora #$091B.w		; 09 1B 09
	trb $1D09.w		; 1C 09 1D
	ora #$091E.w		; 09 1E 09
	and ($32.b)		; 32 32
	rol $32.b,X		; 36 32
	ora $092009.l,X		; 1F 09 20 09
	and ($09.b,X)		; 21 09
	jsl $092109.l		; 22 09 21 09
	and $09.b,S		; 23 09
	bit $09.b		; 24 09
	and $09.b		; 25 09
	and ($32.b)		; 32 32
	rol $35.b,X		; 36 35
	and $35.b,X		; 35 35
	and ($27.b),Y		; 31 27
	ora ($2B.b,X)		; 01 2B
	rol A		; 2A
	ora ($28.b,X)		; 01 28
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $25.b		; 00 25
	brk $05.b		; 00 05
	brk $12.b		; 00 12
	.db $82, $76, $4B		; 82 76 4B
	ror $24.b		; 66 24
	rti		; 40

	lsr $1220.w		; 4E 20 12
	bit #$0B8C.w		; 89 8C 0B
	jsr $2810.w		; 20 10 28
	tsb $02.b		; 04 02
	sbc $93.b,X		; F5 93
	ora ($84.b),Y		; 11 84
	sec		; 38
	bpl -60.b		; 10 C4
	adc $4CF2EB.l		; 6F EB F2 4C
	sec		; 38
	bmi -48.b		; 30 D0
	tya		; 98
	rts		; 60

	mvp $5A,$45		; 44 45 5A
	phk		; 4B
	sbc [$9B.b]		; E7 9B
	sbc $93.b		; E5 93
	sbc $7D.b		; E5 7D
	rol $FB.b,X		; 36 FB
	tsx		; BA
	dex		; CA
	ora ($2B.b),Y		; 11 2B
	dec $57.b,X		; D6 57
	sbc #$D6AD.w		; E9 AD D6
	and $0D.b		; 25 0D
	sbc ($F0.b),Y		; F1 F0
	sbc #$7354.w		; E9 54 73
	sbc $65.b,X		; F5 65
	bit $7F.b		; 24 7F
	sta $35.b,X		; 95 35
	tas		; 1B
	lda #$A5FE.w		; A9 FE A5
	ora ($CC.b),Y		; 11 CC
	stx $2C.b		; 86 2C
	sta ($FE.b)		; 92 FE
	lsr A		; 4A
	phk		; 4B
	lda $544354.l,X		; BF 54 43 54
	lda #$2722.w		; A9 22 27
	eor ($E5.b)		; 52 E5
	sta $19.b,X		; 95 19
	rol $55.b,X		; 36 55
	and [$6B.b]		; 27 6B
	.db $62, $3A, $11		; 62 3A 11
	pha		; 48
	jsl $CC12A9.l		; 22 A9 12 CC
	cmp ($3B.b)		; D2 3B
	jsl $2959C4.l		; 22 C4 59 29
	tsb $4296.w		; 0C 96 42
	ora ($5A.b)		; 12 5A
	sta $B624.w,Y		; 99 24 B6
	cmp #$B234.w		; C9 34 B2
	cmp $B124.w,Y		; D9 24 B1
	inc A		; 1A
	cmp $9E64.w,Y		; D9 64 9E
	.db $62, $51, $1A		; 62 51 1A
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	mvp $10,$A5		; 44 A5 10
	sty $21.b		; 84 21
	php		; 08
	beq -101.b		; F0 9B
	cpx $A4.b		; E4 A4
	bmi 112.b		; 30 70
	bvs -16.b		; 70 F0
	bne -124.b		; D0 84
	and ($31.b,X)		; 21 31
	ldx #$11.b		; A2 11
	pld		; 2B
	eor $002E.w,Y		; 59 2E 00
	sbc $2FBE1B.l		; EF 1B BE 2F
	lda [$81.b]		; A7 81
	ror A		; 6A
	dec $7E.b,X		; D6 7E
	adc $96AA57.l,X		; 7F 57 AA 96
	ldx $27BF.w,Y		; BE BF 27
	sta ($8D.b,S),Y		; 93 8D
	ora [$9F.b]		; 07 9F
	ora $ED85.w		; 0D 85 ED
	bit $2CE4.w		; 2C E4 2C
	pei ($84.b)		; D4 84
	and ($08.b,X)		; 21 08
	eor ($28.b),Y		; 51 28
	sty $44.b,X		; 94 44
	ldx $8888.w		; AE 88 88
	bit #$4208.w		; 89 08 42
	bpl -124.b		; 10 84
	eor ($E1.b)		; 52 E1
	and #$1427.w		; 29 27 14
	bit $C0.b,X		; 34 C0
	ldy #$E1.b		; A0 E1
	adc $70AF.w,X		; 7D AF 70
	lda $B43B.w,X		; BD 3B B4
	clv		; B8
	.db $42, $40		; 42 40
	rti		; 40

	rol $3C3C.w,X		; 3E 3C 3C
	dec A		; 3A
	sec		; 38
	ldx #$86.b		; A2 86
	pld		; 2B
	adc ($C3.b),Y		; 71 C3
	ora $E1B8.w,X		; 1D B8 E1
	sta $1FF9.w		; 8D F9 1F
	bcc -120.b		; 90 88
	dey		; 88
	sty $8C8C.w		; 8C 8C 8C
	sty $9190.w		; 8C 90 91
	php		; 08
	.db $42, $10		; 42 10
	sta $3EFC.w		; 8D FC 3E
	ldx $2971.w		; AE 71 29
	tsb $4A33.w		; 0C 33 4A
	sta [$29.b]		; 87 29
	adc ($87.b)		; 72 87
	plp		; 28
	adc ($87.b)		; 72 87
	inc A		; 1A
	dex		; CA
	trb $076B.w		; 1C 6B 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$2D.b]		; 07 2D
	cmp #$3B9F.w		; C9 9F 3B
	lda ($BF.b,S),Y		; B3 BF
	and ($D3.b,S),Y		; 33 D3
	adc ($FB.b)		; 72 FB
	and $B96E4D.l		; 2F 4D 6E B9
	and ($39.b,X)		; 21 39
	and $3131.w,Y		; 39 31 31
	and ($31.b),Y		; 31 31
	jsl $218410.l		; 22 10 84 21
	ora $6162.w		; 0D 62 61
	and #$0C06.w		; 29 06 0C
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	bpl -60.b		; 10 C4
	lsr A		; 4A
	lsr A		; 4A
	bit $21.b		; 24 21
	php		; 08
	eor $38.b,X		; 55 38
	tax		; AA
	and [$9B.b]		; 27 9B
	stx $4A.b		; 86 4A
	dex		; CA
	tya		; 98
	asl $318F.w		; 0E 8F 31
	cpx $21.b		; E4 21
	php		; 08
	.db $42, $14		; 42 14
	lsr $E2.b,X		; 56 E2
	and $21.b		; 25 21
	ora $78.b,X		; 15 78
	inx		; E8
	adc ($AC.b),Y		; 71 AC
	rtl		; 6B

	bpl -124.b		; 10 84
	and ($03.b,X)		; 21 03
	sta $06.b,S		; 83 06
	ora ($B5.b)		; 12 B5
	sbc $8D20.w,Y		; F9 20 8D
	sbc #$F3B5.w		; E9 B5 F3
	ply		; 7A
	jmp ($7CFD.w,X)		; 7C FD 7C
	pei ($5D.b)		; D4 5D
	cpy $24.b		; C4 24
	bit $26.b		; 24 26
	rol $34.b		; 26 34
	ora $9803.w		; 0D 03 98
	adc $FF.b,S		; 63 FF
	tyx		; BB
	sbc $D87B.w,X		; FD 7B D8
	lda $17BF.w,X		; BD BF 17
	tda		; 7B
	ora $17.b,X		; 15 17
	nop		; EA
	ldx #$F0.b		; A2 F0
	adc #$D31C.w		; 69 1C D3
	txs		; 9A
	adc ($4E.b,S),Y		; 73 4E
	eor #$1FC9.w		; 49 C9 1F
	asl $1042.w,X		; 1E 42 10
	sty $21.b		; 84 21
	trb $92.b		; 14 92
	lda $C1C1.w,X		; BD C1 C1
	dex		; CA
	ror A		; 6A
	and $88.b,X		; 35 88
	rtl		; 6B

	bpl -124.b		; 10 84
	stz $81.b,X		; 74 81
	cmp ($C1.b,X)		; C1 C1
	cmp ($C1.b,X)		; C1 C1
	cmp $4C.b,S		; C3 4C
	cmp ($34.b,S),Y		; D3 34
	cmp $7BDD92.l,X		; DF 92 DD 7B
	sta $EB36.w,Y		; 99 36 EB
	lda ($08.b,X)		; A1 08
	sty $24.b		; 84 24
	bit $24.b		; 24 24
	and $23.b,S		; 23 23
	and $22.b,S		; 23 22
	jsl $BD1142.l		; 22 42 11 BD
	phb		; 8B
	ply		; 7A
	ldx $EE.b,Y		; B6 EE
	and ($10.b)		; 32 10
	brk $62.b		; 00 62
	ora $2407.w,Y		; 19 07 24
	jmp ($9CE6.w,X)		; 7C E6 9C
	phx		; DA
	trb $CAA1.w		; 1C A1 CA
	trb $C0E2.w		; 1C E2 C0
	sta $2CDE.w,X		; 9D DE 2C
	ora $C58D8F.l		; 0F 8F 8D C5
	bra  56.b		; 80 38
	sec		; 38
	sec		; 38
	dec A		; 3A
	dec A		; 3A
	dec A		; 3A
	bit $043D.w,X		; 3C 3D 04
	ror $64.b,X		; 76 64
	ply		; 7A
	adc [$E4.b]		; 67 E4
	.db $82, $3B, $75		; 82 3B 75
	sbc ($89.b,X)		; E1 89
	ldy $2423.w		; AC 23 24
	rol $24.b		; 26 24
	and $23.b,S		; 23 23
	jsl $E19F18.l		; 22 18 9F E1
	adc $DB41.w,X		; 7D 41 DB
	sta $57.b,S		; 83 57
	phk		; 4B
	lda $ECA2.w,Y		; B9 A2 EC
	sbc $3E3ECC.l		; EF CC 3E 3E
	rti		; 40

	rti		; 40

	adc #$241A.w		; 69 1A 24
	cpx $CA.b		; E4 CA
	phk		; 4B
	adc ($28.b),Y		; 71 28
	bcc -124.b		; 90 84
	and ($04.b,X)		; 21 04
	sta $E3.b,X		; 95 E3
	jsl $106A25.l		; 22 25 6A 10
	sty $21.b		; 84 21
	ora [$AB.b],Y		; 17 AB
	adc $909262.l		; 6F 62 92 90
	ldy $2164.w		; AC 64 21
	php		; 08
	.db $42, $10		; 42 10
	sty $4A.b		; 84 4A
	dec $0E.b,X		; D6 0E
	asl $218E.w		; 0E 8E 21
	php		; 08
	cmp [$CD.b],Y		; D7 CD
	eor $C1.b		; 45 C1
	ora $19E0.w,Y		; 19 E0 19
	and [$3C.b]		; 27 3C
	tya		; 98
	tya		; 98
	tya		; 98
	stz $089D.w		; 9C 9D 08
	.db $42, $10		; 42 10
	sty $20.b		; 84 20
	cmp [$2B.b]		; C7 2B
	ora ($BD.b)		; 12 BD
	lda [$09.b]		; A7 09
	cpy $52.b		; C4 52
	lsr $5050.w		; 4E 50 50
	jmp ($F060.w,X)		; 7C 60 F0
	beq -24.b		; F0 E8
	inx		; E8
	inx		; E8
	cpx #$E1.b		; E0 E1
	dec $68.b		; C6 68
	sta $1BEE90.l		; 8F 90 EE 1B
	rol $C9.b		; 26 C9
	ldx $7F.b,Y		; B6 7F
	ora $61.b		; 05 61
	sta $0F.b,S		; 83 0F
	sty $7C.b,X		; 94 7C
	sbc ($2C.b,S),Y		; F3 2C
	cpy $2B32.w		; CC 32 2B
	adc $48A7C1.l,X		; 7F C1 A7 48
	beq  29.b		; F0 1D
	and $F8.b,S		; 23 F8
	eor $511EF5.l		; 4F F5 1E 51
	lda $58.b,X		; B5 58
	cmp ($34.b,S),Y		; D3 34
	cmp $137EC2.l		; CF C2 7E 13
	beq -97.b		; F0 9F
	sbc $DCDA3D.l		; EF 3D DA DC
	cpy $21.b		; C4 21
	ora [$8D.b],Y		; 17 8D
	sbc $70.b,S		; E3 70
	stp		; DB
	rol $C2.b,X		; 36 C2
	jsr $2003.w		; 20 03 20
	iny		; C8
	and ($0C.b)		; 32 0C
	sta $21.b,S		; 83 21
	ora [$04.b],Y		; 17 04
	adc [$0D.b],Y		; 77 0D
	ldx #$E1.b		; A2 E1
	cmp ($3F.b,S),Y		; D3 3F
	bpl 102.b		; 10 66
	ora $5986.w,Y		; 19 86 59
	stx $73.b,Y		; 96 73
	ora $9E03.w		; 0D 03 9E
	adc $D52F0A.l,X		; 7F 0A 2F D5
	.db $42, $11		; 42 11
	bvs -74.b		; 70 B6
	jsr $9CE4.w		; 20 E4 9C
	sta ($20.b,S),Y		; 93 20
	wai		; CB
	and $3087.w,Y		; 39 87 30
	sbc [$95.b]		; E7 95
	phx		; DA
	dec $B2.b		; C6 B2
	sta [$38.b]		; 87 38
	bcs  47.b		; B0 2F
	lsr $BF.b,X		; 56 BF
	eor $08.b,X		; 55 08
	clc		; 18
	sec		; 38
	sec		; 38
	dec A		; 3A
	adc ($9C.b,X)		; 61 9C
	adc ($1C.b,S),Y		; 73 1C
	cpy $7E.b		; C4 7E
	pha		; 48
	and $86.b,S		; 23 86
	bit $21.b		; 24 21
	php		; 08
	eor ($21.b,X)		; 41 21
	ora $2B11.w,Y		; 19 11 2B
	bvc -122.b		; 50 86
	lda ($08.b),Y		; B1 08
	.db $42, $10		; 42 10
	brk $30.b		; 00 30
	sta $BF.b,X		; 95 BF
	phb		; 8B
	sbc [$F9.b],Y		; F7 F9
	eor $47AE.w,X		; 5D AE 47
	ror $84D5.w,X		; 7E D5 84
	adc $06A162.l		; 6F 62 A1 06
	dey		; 88
	cmp ($08.b),Y		; D1 08
	bra 124.b		; 80 7C
	stz $62.b,X		; 74 62
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	lda ($0C.b)		; B2 0C
	and $54.b		; 25 54
	mvp $84,$64		; 44 64 84
	sta [$4C.b],Y		; 97 4C
	sbc ($D8.b,S),Y		; F3 D8
	tsa		; 3B
	stx $D9.b		; 86 D9
.ACCU 16
.INDEX 16
	rep #$78		; C2 78
	eor $50.b		; 45 50
	stz $D19C.w		; 9C 9C D1
	and ($0C.b,S),Y		; 33 0C
	sta $0C.b,S		; 83 0C
	cmp ($A8.b,X)		; C1 A8
	and ($17.b,X)		; 21 17
	eor $DAAA.w		; 4D AA DA
	stx $F6.b		; 86 F6
	lsr $CD.b,X		; 56 CD
	eor $14EF.w,X		; 5D EF 14
	brk $C4.b		; 00 C4
	lda $3ACC.w		; AD CC 3A
	and $B558.w,Y		; 39 58 B5
	adc ($FC.b)		; 72 FC
	jmp $F9905F.l		; 5C 5F 90 F9
	ora $F1AD92.l		; 0F 92 AD F1
	eor $BF.b,X		; 55 BF
	eor ($60.b),Y		; 51 60
	ldy $E513.w		; AC 13 E5
	ora $CAAF2A.l,X		; 1F 2A AF CA
	rol A		; 2A
	cmp $2A.b,X		; D5 2A
	eor $C1.b,X		; 55 C1
	bmi  79.b		; 30 4F
	lda ($6F.b)		; B2 6F
	ply		; 7A
	sta $7B1773.l,X		; 9F 73 17 7B
	pei ($F3.b)		; D4 F3
	ldx $F75E.w,Y		; BE 5E F7
	ora $9F3E.w,Y		; 19 3E 9F
	and $8BA91F.l,X		; 3F 1F A9 8B
	phb		; 8B
	nop		; EA
	phk		; 4B
	adc ($7E.b),Y		; 71 7E
	eor $62E3DE.l,X		; 5F DE E3 62
	ldx $6C3E.w,Y		; BE 3E 6C
	sta [$72.b],Y		; 97 72
	tyx		; BB
	tya		; 98
	sta [$72.b],Y		; 97 72
	lda $CB5B68.l		; AF 68 5B CB
	eor $3915.w,X		; 5D 15 39
	sta [$95.b],Y		; 97 95
	bit #$9589.w		; 89 89 95
	sta $89.b,X		; 95 89
	lda ($5B.b,X)		; A1 5B
	rol $44BF.w		; 2E BF 44
	stz $37D8.w		; 9C D8 37
	lda ($B6.b)		; B2 B6
	ror A		; 6A
	sbc $72.b,X		; F5 72
	lda $57177F.l		; AF 7F 17 57
	and #$AD68.w		; 29 68 AD
	ora ($33.b,S),Y		; 13 33
	pld		; 2B
	asl $AE.b,X		; 16 AE
	lsr $7756.w,X		; 5E 56 77
	sbc ($56.b),Y		; F1 56
	dex		; CA
	dec $34D1.w		; CE D1 34
	eor $36DB70.l		; 4F 70 DB 36
	phd		; 0B
	lda $CC5D.w,Y		; B9 5D CC
	eor $FF276F.l		; 4F 6F 27 FF
	sbc $7EBD.w,Y		; F9 BD 7E
	lda ($F5.b,X)		; A1 F5
	tsb $3383.w		; 0C 83 33
	pld		; 2B
	ora ($13.b,S),Y		; 13 13
	pld		; 2B
	and [$CB.b]		; 27 CB
	cmp $D7FE.w		; CD FE D7
	eor ($9C.b,S),Y		; 53 9C
	sty $74.b		; 84 74
	cmp [$C8.b]		; C7 C8
	phd		; 0B
	adc ($42.b),Y		; 71 42
	plp		; 28
	bra  14.b		; 80 0E
	adc $1C21.w,Y		; 79 21 1C
	eor $C8.b,X		; 55 C8
	ldx #$8410.w		; A2 10 84
	and ($08.b,X)		; 21 08
	.db $42, $0C		; 42 0C
	sta ($52.b)		; 92 52
	plp		; 28
	.db $42, $10		; 42 10
	sty $22.b		; 84 22
	ora ($52.b)		; 12 52
	adc ($5D.b),Y		; 71 5D
	tsa		; 3B
	stx $E1.b		; 86 E1
	jmp ($1042.w,X)		; 7C 42 10
	.db $82, $63, $2C		; 82 63 2C
	cmp [$2A.b]		; C7 2A
	sta ($AD.b)		; 92 AD
	bpl  29.b		; 10 1D
	and ($EE.b)		; 32 EE
	eor $EC.b,X		; 55 EC
	tad		; 5B
	sed		; F8
	eor #$E8E4.w		; 49 E4 E8
	ora ($9C.b),Y		; 11 9C
	jsr ($4CAC.w,X)		; FC AC 4C
	phy		; 5A
	cld		; D8
	eor $5E.b,X		; 55 5E
	ora $7C2F.w,X		; 1D 2F 7C
	lda $32EE.w,X		; BD EE 32
	adc $9E3C.w,Y		; 79 3C 9E
	lda $D5.b		; A5 D5
	lda #$CF4E.w		; A9 4E CF
	wai		; CB
	lda $C5C6.w		; AD C6 C5
	sei		; 78
	sei		; 78
	sei		; 78
	stz $D4.b,X		; 74 D4
	rol $44.b,X		; 36 44
	sbc $272E.w		; ED 2E 27
	and #$6ED3.w		; 29 D3 6E
	sta $AF634B.l,X		; 9F 4B 63 AF
	cld		; D8
	sta [$B0.b]		; 87 B0
	inx		; E8
	cpx #$A6E1.w		; E0 E1 A6
	adc #$079B.w		; 69 9B 07
	rts		; 60

	cpx $EE09.w		; EC 09 EE
	ora [$AF.b],Y		; 17 AF
	nop		; EA
	sbc $59CD.w,X		; FD CD 59
	sbc $7E.b,X		; F5 7E
	inc $D7.b		; E6 D7
	and ($6B.b,S),Y		; 33 6B
	eor $69.b,S		; 43 69
	sbc ($E3.b,X)		; E1 E3
	mvn $35,$D5		; 54 D5 35
	eor $68A3.w		; 4D A3 68
	phx		; DA
	trb $F9.b		; 14 F9
	sbc ($A9.b,S),Y		; F3 A9
	sbc ($E7.b,S),Y		; F3 E7
	cmp $9F.b,X		; D5 9F
	and $E183C3.l,X		; 3F C3 83 E1
	cpy #$39BF.w		; C0 BF 39
	and $3939.w,Y		; 39 39 39
	and $3CE1.w,Y		; 39 E1 3C
	and $F1.b		; 25 F1
	eor ($72.b,S),Y		; 53 72
	sty $AC.b,X		; 94 AC
	and $55586D.l		; 2F 6D 58 55
	ora $85.b,X		; 15 85
	eor #$8448.w		; 49 48 84
	and ($08.b,X)		; 21 08
	.db $42, $DC		; 42 DC
	sbc [$7A.b],Y		; F7 7A
	phb		; 8B
	rtl		; 6B

	phk		; 4B
	pea $BF2E.w		; F4 2E BF
	sta $B7D7.w,Y		; 99 D7 B7
	lda $DC.b,S		; A3 DC
	cmp ($DC.b),Y		; D1 DC
	dec A		; 3A
	stz $D156.w,X		; 9E 56 D1
	plx		; FA
	ora $3AD7.w,Y		; 19 D7 3A
	inc $89.b		; E6 89
	ldx #$2142.w		; A2 42 21
	ora $9C13.w		; 0D 13 9C
	eor $13.b,X		; 55 13
	cmp $91E4.w		; CD E4 91
	brk $0C.b		; 00 0C
	bvs -87.b		; 70 A9
	bra -15.b		; 80 F1
	cmp #$4B63.w		; C9 63 4B
	ror $41.b		; 66 41
	sbc $B135.w,Y		; F9 35 B1
	ora $26F5FA.l		; 0F FA F5 26
	sta $0CEAAB.l		; 8F AB EA 0C
	and $DEC6.w,Y		; 39 C6 DE
	ldx $79.b,Y		; B6 79
	adc [$A9.b],Y		; 77 A9
	inc $DE38.w,X		; FE 38 DE
	sbc $33.b,X		; F5 33
	sta ($64.b),Y		; 91 64
	sbc $99.b		; E5 99
	sbc $C4.b,S		; E3 C4
	jsl $484610.l		; 22 10 46 48
	jmp $4C4E.w		; 4C 4E 4C
	lsr $00.b		; 46 00
	sty $21.b		; 84 21
	php		; 08
	rtl		; 6B

	bpl -42.b		; 10 D6
	ora ($B9.b)		; 12 B9
	cmp ($D1.b,X)		; C1 D1
	xba		; EB
	sbc $78.b,X		; F5 78
	bvs  -5.b		; 70 FB
	trb $5EDF.w		; 1C DF 5E
	iny		; C8
	lda $AC.b,X		; B5 AC
	inc $39.b,X		; F6 39
	tsx		; BA
	sbc $53A5.w,Y		; F9 A5 53
	tsb $90E6.w		; 0C E6 90
	dey		; 88
	eor $49.b,S		; 43 49
	bne -124.b		; D0 84
	and ($A3.b,X)		; 21 A3
	ror A		; 6A
	lsr $9534.w		; 4E 34 95
	ldy $C1A8.w		; AC A8 C1
	cmp ($88.b),Y		; D1 88
	adc #$384B.w		; 69 4B 38
	tax		; AA
	adc $FBCE.w,Y		; 79 CE FB
	phx		; DA
	ror $7E.b,X		; 76 7E
	stx $BF.b,Y		; 96 BF
	cpx $01.b		; E4 01
	sty $53A9.w		; 8C A9 53
	ora ($DF.b,X)		; 01 DF
	lda $E4A7.w,X		; BD A7 E4
	sbc $6F2D.w,X		; FD 2D 6F
	cmp #$9C9A.w		; C9 9A 9C
	jmp $2951.w		; 4C 51 29
	trb $DD.b		; 14 DD
	cmp #$B6EF.w		; C9 EF B6
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	adc ($11.b,X)		; 61 11
	and ($31.b,X)		; 21 31
	sec		; 38
	cmp ($0D.b),Y		; D1 0D
	stp		; DB
	lda ($7F.b),Y		; B1 7F
	eor $E176.w,Y		; 59 76 E1
	stx $FD0F.w		; 8E 0F FD
	eor ($23.b,X)		; 41 23
	sbc $6DEC17.l,X		; FF 17 EC 6D
	sta [$C4.b],Y		; 97 C4
	.db $42, $40		; 42 40
	rti		; 40

	rol $7A3C.w,X		; 3E 3C 7A
	cmp $37EF.w,X		; DD EF 37
	lda $BE87.w,X		; BD 87 BE
	pea $CFCE.w		; F4 CE CF
	wai		; CB
	cpx $3FBB.w		; EC BB 3F
	eor [$3B.b],Y		; 57 3B
	ldy $8D77.w,X		; BC 77 8D
	sbc ($62.b)		; F2 62
	adc ($72.b)		; 72 72
	.db $82, $83, $12		; 82 83 12
	sbc $B1F991.l		; EF 91 F9 B1
	sbc [$2D.b],Y		; F7 2D
	cli		; 58
	sbc ($3F.b),Y		; F1 3F
	eor $AB.b,X		; 55 AB
	asl $75.b,X		; 16 75
	lda $BA58.w		; AD 58 BA
	ror $851B.w		; 6E 1B 85
.ACCU 8
.INDEX 8
	sep #$F1		; E2 F1
	sei		; 78
	.db $42, $2A		; 42 2A
	cmp $D1BDF9.l,X		; DF F9 BD D1
	phy		; 5A
	lda ($E5.b),Y		; B1 E5
	xce		; FB
	ror $AC.b,X		; 76 AC
	eor ($52.b,S),Y		; 53 52
	cmp $8B.b,X		; D5 8B
.INDEX 8
	sep #$10		; E2 10
	sty $21.b		; 84 21
	php		; 08
	ora $54.b,X		; 15 54
	and $123F6B.l		; 2F 6B 3F 12
	sbc $1DAB.w		; ED AB 1D
	ldx $AB55.w		; AE 55 AB
	php		; 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	ora $F98C7E.l,X		; 1F 7E 8C F9
	cmp $919F.w,X		; DD 9F 91
	rol $FF1E.w,X		; 3E 1E FF
	dec $32F8.w		; CE F8 32
	rol $FF.b,X		; 36 FF
	lda [$E9.b]		; A7 E9
	bne  78.b		; D0 4E
	lsr $6F4E.w		; 4E 4E 6F
	stz $D906.w		; 9C 06 D9
	clv		; B8
	plp		; 28
	rol $6E41.w		; 2E 41 6E
	tas		; 1B
	ora $6ED7.w		; 0D D7 6E
	adc $6A1C.w,X		; 7D 1C 6A
	and $181E.w,Y		; 39 1E 18
	php		; 08
	php		; 08
	lsr $8D.b		; 46 8D
	plp		; 28
	plp		; 28
	bit $EF25.w,X		; 3C 25 EF
	inc $51.b		; E6 51
	and ($09.b,X)		; 21 09
	inc TSW.w		; EE 2F 21
	pld		; 2B
	and $6AFE.w		; 2D FE 6A
	cmp ($00.b),Y		; D1 00
	ora $02461E.l		; 0F 1E 46 02
	inc A		; 1A
	and ($08.b,X)		; 21 08
	lsr $88.b		; 46 88
	ldx #$42.b		; A2 42
	and $5B.b		; 25 5B
	ora $8038.w		; 0D 38 80
	tsb $5C.b		; 04 5C
	and $8890.w		; 2D 90 88
	.db $42, $10		; 42 10
	rol $1369.w,X		; 3E 69 13
	sta ($92.b),Y		; 91 92
	ldx $9018.w		; AE 18 90
	sty $21.b		; 84 21
	php		; 08
	eor ($19.b,X)		; 41 19
	and #$14.b		; 29 14
	eor ($4E.b)		; 52 4E
	bvs -109.b		; 70 93
	sta $803819.l,X		; 9F 19 38 80
	rol A		; 2A
	asl $0F8F.w		; 0E 8F 0F
	ora $11828E.l		; 0F 8E 82 11
	ora #$00.b		; 09 00
	sbc ($CA.b),Y		; F1 CA
	dex		; CA
	adc [$06.b],Y		; 77 06
	cmp $A0.b,X		; D5 A0
	cop $22.b		; 02 22
	and ($6C.b)		; 32 6C
	ldx $0CD6.w		; AE D6 0C
	inc $AC.b,X		; F6 AC
	and $701A.w		; 2D 1A 70
	cmp ($97.b,S),Y		; D3 97
	lda ($DB.b),Y		; B1 DB
	ora $30.b		; 05 30
	and $EA.b,X		; 35 EA
	stz $F4.b,X		; 74 F4
	jmp $C331.w		; 4C 31 C3
	trb $8080.w		; 1C 80 80
	sei		; 78
	cmp ($3B.b,S),Y		; D3 3B
	xba		; EB
	lda $04.b,X		; B5 04
	sta $FAFCCC.l		; 8F CC FC FA
	stz $7B6F.w,X		; 9E 6F 7B
	ora [$C3.b]		; 07 C3
	pea $4469.w		; F4 69 44
	ora $E3.b,S		; 03 E3
	inc $A1.b		; E6 A1
	ldx $78.b,Y		; B6 78
	mvp $1F,$7F		; 44 7F 1F
	sbc ($79.b)		; F2 79
	ora $3EF69B.l,X		; 1F 9B F6 3E
	and $BEFEDB.l		; 2F DB FE BE
	eor [$7E.b]		; 47 7E
	cmp $8B.b,X		; D5 8B
	dec A		; 3A
	cmp $ED5C.w,X		; DD 5C ED
	eor $70.b,S		; 43 70
	cpx #$2F.b		; E0 2F
	sty $88.b,X		; 94 88
	.db $42, $39		; 42 39
	ora $AEFE.w,X		; 1D FE AE
	stz $31.b,X		; 74 31
	rtl		; 6B

	inc $A3.b		; E6 A3
	lda $1D5D.w		; AD 5D 1D
	lda ($A3.b),Y		; B1 A3
	mvp $08,$21		; 44 21 08
	eor $44.b,S		; 43 44
	tad		; 5B
	ldx $138E.w		; AE 8E 13
	cpy #$58.b		; C0 58
	and $B11D.w		; 2D 1D B1
	bpl -112.b		; 10 90
	bcc -120.b		; 90 88
	.db $42, $20		; 42 20
	bpl -124.b		; 10 84
	cli		; 58
	rol $619E.w		; 2E 9E 61
	pla		; 68
	sbc ($04.b,S),Y		; F3 04
	and ($08.b,X)		; 21 08
	eor $E2.b		; 45 E2
	sbc ($78.b),Y		; F1 78
	lda $DD5B.w,X		; BD 5B DD
	sbc ($91.b)		; F2 91
	ldy $C4.b		; A4 C4
	adc $B285.w,Y		; 79 85 B2
	cpy #$84.b		; C0 84
	and ($08.b,X)		; 21 08
	.db $42, $11		; 42 11
	bit #$76.b		; 89 76
	cmp $8E.b,X		; D5 8E
	cmp [$2A.b],Y		; D7 2A
	cmp $8E.b,X		; D5 8E
	trb $772F.w		; 1C 2F 77
	dex		; CA
	ldx $A7.b		; A6 A7
	sta $B87481.l,X		; 9F 81 74 B8
	and ($08.b,X)		; 21 08
	.db $42, $10		; 42 10
	bit $2F04.w		; 2C 04 2F
	lsr $11.b		; 46 11
	ply		; 7A
	inc $3B6F.w,X		; FE 6F 3B
	lda $849AAF.l		; AF AF 9A 84
	and ($08.b,X)		; 21 08
	pla		; 68
	cmp ($71.b)		; D2 71
	eor $726B66.l		; 4F 66 6B 72
	eor $1A.b,S		; 43 1A
	adc ($85.b,S),Y		; 73 85
	xba		; EB
	lda $F399.w,Y		; B9 99 F3
	dec $484C.w		; CE 4C 48
	lsr $38.b		; 46 38
	bit $1366.w,X		; 3C 66 13
	dey		; 88
	.db $42, $3A		; 42 3A
	plx		; FA
	cmp ($C7.b,S),Y		; D3 C7
	cmp $85.b		; C5 85
	lsr $67.b		; 46 67
	beq 110.b		; F0 6E
	bra   6.b		; 80 06
	lda [$3A.b],Y		; B7 3A
	and [$70.b],Y		; 37 70
	bcs  51.b		; B0 33
	trb $C5DD.w		; 1C DD C5
	.db $42, $35		; 42 35
	ora $0D13C5.l		; 0F C5 13 0D
	pha		; 48
	ldy #$10.b		; A0 10
	asl $21.b		; 06 21
	cmp ($8B.b),Y		; D1 8B
	mvp $5D,$6C		; 44 6C 5D
	ora ($30.b)		; 12 30
	lda $4EC8.w,X		; BD C8 4E
	and ($09.b,X)		; 21 09
	bit #$90.b		; 89 90
	lda ($DE.b)		; B2 DE
	lda [$22.b],Y		; B7 22
	lda ($80.b,S),Y		; B3 80
	ora $06.b,S		; 03 06
	tsb $5A8B.w		; 0C 8B 5A
	tsx		; BA
	stx $D7E4.w		; 8E E4 D7
	pea $7078.w		; F4 78 70
	pei ($7D.b)		; D4 7D
	ldx $C8.b,Y		; B6 C8
	tyx		; BB
	bvc -58.b		; 50 C6
	jmp $9868.w		; 4C 68 98
	stz $63.b		; 64 63
	mvp $7A,$42		; 44 42 7A
	and $CFFF.w		; 2D FF CF
	sbc [$F8.b],Y		; F7 F8
	bvs -102.b		; 70 9A
	cpy $21.b		; C4 21
	sbc #$AD.b		; E9 AD
	cli		; 58
	mvp $C3,$03		; 44 03 C3
	bra   4.b		; 80 04
.ACCU 16
	rep #$21		; C2 21
	phb		; 8B
	sbc ($E6.b)		; F2 E6
	cmp $17.b,S		; C3 17
	phy		; 5A
	tyx		; BB
	lsr A		; 4A
	lsr $94.b		; 46 94
	dey		; 88
	.db $42, $10		; 42 10
	dey		; 88
	ora [$0D.b]		; 07 0D
	and ($E9.b)		; 32 E9
	bvs  69.b		; 70 45
	.db $82, $23, $38		; 82 23 38
	dey		; 88
	plx		; FA
	ldy $E4.b		; A4 E4
	cpy $82.b		; C4 82
	bpl -124.b		; 10 84
	jmp $504C.w		; 4C 4C 50
	pha		; 48
	ora $0E.b,S		; 03 0E
	lsr $54.b,X		; 56 54
	cop $1E.b		; 02 1E
	ora $101F.w,X		; 1D 1F 10
	cmp ($B4.b,S),Y		; D3 B4
	lsr $06.b		; 46 06
	and $CCF5.w,Y		; 39 F5 CC
	lda ($78.b)		; B2 78
	lda [$38.b]		; A7 38
	tax		; AA
	eor ($57.b),Y		; 51 57
	txa		; 8A
	ldx $E1.b		; A6 E1
	clv		; B8
	jmp ($8E8E.w)		; 6C 8E 8E
	tya		; 98
	ora $86.b,S		; 03 86
	ora ($EA.b,X)		; 01 EA
	stx $0A.b,Y		; 96 0A
	stx $30.b		; 86 30
	ora $0FC9DB.l,X		; 1F DB C9 0F
	cmp #$21ED.w		; C9 ED 21
	php		; 08
	.db $42, $2E		; 42 2E
	php		; 08
	cmp $466411.l		; CF 11 64 46
	adc $58AE.w,Y		; 79 AE 58
	and $8165.w,Y		; 39 65 81
	php		; 08
	.db $42, $10		; 42 10
	sty $23.b		; 84 23
	xba		; EB
	xce		; FB
	asl $95EF.w,X		; 1E EF 95
	phx		; DA
	sbc $75.b		; E5 75
	adc ($AF.b,S),Y		; 73 AF
	lsr $B7.b,X		; 56 B7
	lsr $3787.w,X		; 5E 87 37
	adc ($B6.b),Y		; 71 B6
	cmp $D9A2.w		; CD A2 D9
	eor ($39.b,X)		; 41 39
	and ($B2.b,X)		; 21 B2
	rti		; 40

	and $6CE9DE.l,X		; 3F DE E9 6C
	sbc $6EF2.w		; ED F2 6E
	sei		; 78
	cmp ($3D.b,S),Y		; D3 3D
	sbc #$51C3.w		; E9 C3 51
	ply		; 7A
	bvs  -9.b		; 70 F7
	sta $9293.w		; 8D 93 92
	sei		; 78
	cmp $C4.b,S		; C3 C4
	jsl $51A610.l		; 22 10 A6 51
	ldy $428F.w		; AC 8F 42
	adc $45.b,X		; 75 45
	sta $90D4.w,Y		; 99 D4 90
	cmp $31.b		; C5 31
	ora $4F90.w,Y		; 19 90 4F
	lsr $82.b,X		; 56 82
	adc ($42.b)		; 72 42
	and ($08.b,X)		; 21 08
	.db $42, $10		; 42 10
	stx $9F.b		; 86 9F
	ldx $29B1.w		; AE B1 29
	asl $56.b		; 06 56
	cpx $21.b		; E4 21
	php		; 08
	.db $42, $11		; 42 11
	ora #$2909.w		; 09 09 29
	clc		; 18
	dey		; 88
	lda ($D1.b,X)		; A1 D1
	jsr ($F0BA.w,X)		; FC BA F0
	cmp $F9.b,S		; C3 F9
	adc $E1.b,X		; 75 E1
	cmp ($42.b),Y		; D1 42
	.db $62, $66, $8C		; 62 66 8C
	phy		; 5A
	sbc $C5B0.w,Y		; F9 B0 C5
	lda $10A39B.l		; AF 9B A3 10
	bmi  97.b		; 30 61
	tsa		; 3B
	lda $B965.w		; AD 65 B9
	and ($E7.b,S),Y		; 33 E7
	.db $42, $35		; 42 35
	stx $6A.b,Y		; 96 6A
	stz $61.b,X		; 74 61
	and ($38.b,X)		; 21 38
	brk $84.b		; 00 84
	adc ($3B.b)		; 72 3B
	jsr ($D7AE.w,X)		; FC AE D7
	eor $8ABD9F.l		; 4F 9F BD 8A
	stx $75AE.w		; 8E AE 75
	sta $7C6D.w,X		; 9D 6D 7C
	pei ($22.b)		; D4 22
	ora ($F1.b),Y		; 11 F1
	.db $82, $10, $8A		; 82 10 8A
	asl $49E9.w		; 0E E9 49
	cmp $972E.w,X		; DD 2E 97
	phd		; 0B
	lda $93.b		; A5 93
	bra -32.b		; 80 E0
	rol $E223.w,X		; 3E 23 E2
	rol $26.b		; 26 26
	rol $26.b		; 26 26
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	.db $42, $22		; 42 22
	and $24.b		; 25 24
	sta $A8E2.w,X		; 9D E2 A8
	sta $0A6E.w,X		; 9D 6E 0A
	ror $97.b,X		; 76 97
	eor ($BD.b,S),Y		; 53 BD
	and $C040.w		; 2D 40 C0
	ora ($84.b,X)		; 01 84
	ldx $6BB5.w		; AE B5 6B
	lda ($D9.b,S),Y		; B3 D9
	lda $6A.b,X		; B5 6A
	adc #$5AAD.w		; 69 AD 5A
	ldx #$8D.b		; A2 8D
	cmp $58D4.w,X		; DD D4 58
	and $8165.w,Y		; 39 65 81
	sep #$C0		; E2 C0
	sbc ($8C.b,X)		; E1 8C
	bit $1C58.w,X		; 3C 58 1C
	and ($8A.b),Y		; 31 8A
	stx $01.b		; 86 01
	bvc -12.b		; 50 F4
	sep #$42		; E2 42
	bpl -124.b		; 10 84
	and ($10.b,X)		; 21 10
	dey		; 88
	sep #$C0		; E2 C0
	ldx $A7.b		; A6 A7
	sta $AD8F80.l,X		; 9F 80 8F AD
	bra -113.b		; 80 8F
	and $88.b,X		; 35 88
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	tsb $F36F.w		; 0C 6F F3
	inc $F2EB.w,X		; FE EB F2
	jsr $CD5E.w		; 20 5E CD
	txs		; 9A
	inc $FD.b,X		; F6 FD
	tda		; 7B
	and $2427.w		; 2D 27 24
	jsl $218410.l		; 22 10 84 21
	and ($3A.b),Y		; 31 3A
	sty $5B.b		; 84 5B
	stx $81CA.w		; 8E CA 81
	adc $1DAC95.l,X		; 7F 95 AC 1D
	brk $23.b		; 00 23
	bpl -122.b		; 10 86
	lda ($37.b,S),Y		; B3 37
	rol $D5.b,X		; 36 D5
	tay		; A8
	sbc $A0.b,S		; E3 A0
	.db $42, $10		; 42 10
	sty $7BDD.w		; 8C DD 7B
	lsr $23.b,X		; 56 23
	bra 112.b		; 80 70
	sta $70.b,X		; 95 70
	bcc -112.b		; 90 90
	bcc -120.b		; 90 88
	.db $42, $10		; 42 10
	mvp $44,$44		; 44 44 44
	mvp $B4,$4A		; 44 4A B4
	and ($14.b,X)		; 21 14
	sta $1A29.w		; 8D 29 1A
	eor ($4A.b)		; 52 4A
	lda [$07.b],Y		; B7 07
	ora [$07.b]		; 07 07
	ora [$10.b]		; 07 10
	sty $23.b		; 84 23
	mvn $35,$FA		; 54 FA 35
	clc		; 18
	cmp $1261F1.l		; CF F1 61 12
	lda ($6A.b)		; B2 6A
	sty $B1.b,X		; 94 B1
	clv		; B8
	jmp $62622D.l		; 5C 2D 62 62
	.db $62, $10, $85		; 62 10 85
	jsl $068389.l		; 22 89 83 06
	ora ($AA.b)		; 12 AA
	.db $42, $22		; 42 22
	and $FB.b		; 25 FB
	sty $C4.b,X		; 94 C4
	ldx $EC2F.w,Y		; BE 2F EC
	and ($08.b,X)		; 21 08
	rtl		; 6B

	bpl -124.b		; 10 84
	rol $A64A.w,X		; 3E 4A A6
	ora $CED5C9.l		; 0F C9 D5 CE
	lda ($AD.b,S),Y		; B3 AD
	lda $23849A.l		; AF 9A 84 23
	eor $420835.l,X		; 5F 35 08 42
	jsr $1F1C.w		; 20 1C 1F
	ora ($74.b),Y		; 11 74
	clv		; B8
	ror $E619.w		; 6E 19 E6
	sbc ($9C.b),Y		; F1 9C
	rtl		; 6B

	ora $C4C4.w,Y		; 19 C4 C4
	cpy $E4.b		; C4 E4
	sbc $02.b		; E5 02
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	.db $42, $11		; 42 11
	adc ($24.b,S),Y		; 73 24
	sty $9E.b,X		; 94 9E
	tax		; AA
	sbc $B6C3.w		; ED C3 B6
	sbc $F12E.w,X		; FD 2E F1
	tsa		; 3B
	phk		; 4B
	ldy $580F.w,X		; BC 0F 58
	mvp $E9,$A4		; 44 A4 E9
	lda [$8B.b]		; A7 8B
	txa		; 8A
	txs		; 9A
	ror $EAD6.w,X		; 7E D6 EA
	lsr $157F.w,X		; 5E 7F 15
	bit $FD.b,X		; 34 FD
	lda $86DA.w		; AD DA 86
	ora ($50.b,X)		; 01 50
	dec $03.b		; C6 03
	brk $A8.b		; 00 A8
	adc $01.b,S		; 63 01
	cpx $07EB.w		; EC EB 07
	lda [$10.b]		; A7 10
	tda		; 7B
	dec A		; 3A
	cmp ($E9.b,X)		; C1 E9
	cpy $8B.b		; C4 8B
	jsl $641121.l		; 22 21 11 64
	mvp $3E,$22		; 44 22 3E
	ldx $02.b,Y		; B6 02
	bit $FF88.w		; 2C 88 FF
	and $675B.w,X		; 3D 5B 67
	txs		; 9A
	cpy $21.b		; C4 21
	ora ($13.b)		; 12 13
	sta $8110.w		; 8D 10 81
	rtl		; 6B

	eor $2442.w,Y		; 59 42 24
	ror $5A77.w,X		; 7E 77 5A
	wai		; CB
	adc $D0.b,X		; 75 D0
	bra   7.b		; 80 07
	cmp [$46.b]		; C7 46
	ora ($9A.b),Y		; 11 9A
	nop		; EA
	cpy $4688.w		; CC 88 46
	tsx		; BA
	cmp $FE2F50.l		; CF 50 2F FE
	sbc #$4022.w		; E9 22 40
	ora ($08.b,X)		; 01 08
	lsr $93.b		; 46 93
	bpl -124.b		; 10 84
	jsl $5AAD69.l		; 22 69 AD 5A
	cpx $7DF6.w		; EC F6 7D
	lda #$2A69.w		; A9 69 2A
	inc $7A.b		; E6 7A
	cmp $8E.b,X		; D5 8E
	cmp $CFDA2F.l		; CF 2F DA CF
	adc #$8448.w		; 69 48 84
	and ($08.b,X)		; 21 08
	rti		; 40

	cpx #$E1.b		; E0 E1
	pld		; 2B
	sbc $08.b,X		; F5 08
	mvp $08,$21		; 44 21 08
	.db $42, $09		; 42 09
	iny		; C8
	bit #$845E.w		; 89 5E 84
	cpy $C4.b		; C4 C4
	cpy $C4.b		; C4 C4
	and ($00.b,X)		; 21 00
	cmp ($83.b,X)		; C1 83
	asl $12.b		; 06 12
	tax		; AA
	sec		; 38
	and $659D72.l,X		; 3F 72 9D 65
	txs		; 9A
	ldy $E8.b,X		; B4 E8
	.db $42, $33		; 42 33
	sty $02.b,X		; 94 02
	bpl -118.b		; 10 8A
	brk $04.b		; 00 04
	and $3A5727.l,X		; 3F 27 57 3A
	dec $BEB6.w		; CE B6 BE
	ror A		; 6A
	bpl -117.b		; 10 8B
	lsr $10.b,X		; 56 10
	sty $20.b		; 84 20
	ora ($F1.b,X)		; 01 F1
	ora $B4F3.w,X		; 1D F3 B4
	pha		; 48
	.db $42, $21		; 42 21
	ora $1029.w		; 0D 29 10
	sty $46.b		; 84 46
	ora $0D.b,S		; 03 0D
	and ($D1.b),Y		; 31 D1
	php		; 08
	.db $42, $10		; 42 10
	dey		; 88
	pha		; 48
	ora #$4448.w		; 09 48 44
	lsr $36.b		; 46 36
	asl $0BDC.w		; 0E DC 0B
	and $4208.w		; 2D 08 42
	ora ($29.b),Y		; 11 29
	eor $9854.w		; 4D 54 98
	sty $27.b		; 84 27
	sbc $1B0AFA.l		; EF FA 0A 1B
	lsr $2B29.w,X		; 5E 29 2B
	ror A		; 6A
	sta ($60.b,X)		; 81 60
	ldx $9B.b		; A6 9B
	lsr $A8.b,X		; 56 A8
	cmp ($B5.b),Y		; D1 B5
	sep #$CD		; E2 CD
	and $AB.b,X		; 35 AB
	eor $CF9E.w,X		; 5D 9E CF
	lda $2D.b,X		; B5 2D
	tay		; A8
	cli		; 58
	trb $0F2C.w		; 1C 2C 0F
	asl $0E.b,X		; 16 0E
	eor $079E.w,Y		; 59 9E 07
	lda [$15.b]		; A7 15
	eor $FE.b,S		; 43 FE
	and ($54.b),Y		; 31 54
	bmi   7.b		; 30 07
	tsb $1061.w		; 0C 61 10
	dey		; 88
	sty $42.b		; 84 42
	bpl -124.b		; 10 84
	adc $046C.w,X		; 7D 6C 04
	adc #$1F31.w		; 69 31 1F
	tad		; 5B
	cop $9A.b		; 02 9A
	sta $08196B.l,X		; 9F 6B 19 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	sbc #$8FBD.w		; E9 BD 8F
	lda $AFDF5E.l		; AF 5E DF AF
	stz $5E.b		; 64 5E
	cmp $7B91.w		; CD 91 7B
	rol $66.b,X		; 36 66
	plp		; 28
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	tsx		; BA
	plx		; FA
	adc $32.b,X		; 75 32
	clc		; 18
	lda $66C9.w		; AD C9 66
	tda		; 7B
	adc $43B3.w		; 6D B3 43
	sbc $A3.b,S		; E3 A3
	php		; 08
	bit #$C609.w		; 89 09 C6
	sty $13.b,X		; 94 13
	eor $D76A.w		; 4D 6A D7
	adc [$B3.b]		; 67 B3
	sbc $4C65.w		; ED 65 4C
	rol $A2.b,X		; 36 A2
	ora ($33.b),Y		; 11 33
	dec $AC.b,X		; D6 AC
	ror $79.b,X		; 76 79
	adc $E359.w,Y		; 79 59 E3
	cmp $18.b,X		; D5 18
	brk $A0.b		; 00 A0
	sbc $A47C.w,X		; FD 7C A4
	sbc $AFD7.w,X		; FD D7 AF
	tsa		; 3B
	adc $E29D8C.l,X		; 7F 8C 9D E2
	lda #$CA01.w		; A9 01 CA
	cmp $7C.b		; C5 7C
	tda		; 7B
	ora ($DA.b),Y		; 11 DA
	jmp.w [$AE6A]		; DC 6A AE
	sta $30.b,X		; 95 30
	bit $59.b		; 24 59
	dex		; CA
	eor $9C.b		; 45 9C
	tyx		; BB
	xba		; EB
	ldy $B8.b,X		; B4 B8
	sta [$6D.b],Y		; 97 6D
	tay		; A8
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	lda [$23.b]		; A7 23
	lda $3DEDCA.l,X		; BF CA ED 3D
	bit $11.b,X		; 34 11
	cmp ($1F.b,X)		; C1 1F
	sta $E1EFE9.l,X		; 9F E9 EF E1
	inc $34E3.w		; EE E3 34
	ldy #$98.b		; A0 98
	bcc -20.b		; 90 EC
	inc A		; 1A
	sta $C3.b,S		; 83 C3
	sbc $07.b		; E5 07
	jmp ($C269.w)		; 6C 69 C2
	bit $EB.b,X		; 34 EB
	eor [$45.b],Y		; 57 45
	jmp.w [$C847]		; DC 47 C8
	php		; 08
	mvp $E9,$22		; 44 22 E9
	bvs -128.b		; 70 80
	ldx $59.b,Y		; B6 59
	and $4C.b,X		; 35 4C
	sbc ($4C.b,S),Y		; F3 4C
	cmp $C9B23D.l		; CF 3D B2 C9
	ora $3121.w,Y		; 19 21 31
	and $4141.w,Y		; 39 41 41
	sbc ($37.b,X)		; E1 37
	cpy $21.b		; C4 21
	php		; 08
	.db $42, $11		; 42 11
	ora #$2829.w		; 09 29 28
	cpy $EB.b		; C4 EB
	mvp $08,$21		; 44 21 08
	.db $42, $01		; 42 01
	sty $A4.b		; 84 A4
	lda $B5.b,X		; B5 B5
	sta $D1.b,S		; 83 D1
	jsl $E9313F.l		; 22 3F 31 E9
	ora $16B1.w,X		; 1D B1 16
	mvp $42,$42		; 44 42 42
	.db $42, $42		; 42 42
	.db $42, $3C		; 42 3C
	cli		; 58
	and $8365.w,Y		; 39 65 83
	jmp $3C5BB2.l		; 5C B2 5B 3C
	dec $21.b,X		; D6 21
	php		; 08
	.db $42, $10		; 42 10
	sty $23.b		; 84 23
	adc [$1A.b],Y		; 77 1A
	sta [$1A.b]		; 87 1A
	cpy $6B.b		; C4 6B
	inc $FC.b		; E6 FC
	ora $9DAB3B.l,X		; 1F 3B AB 9D
	brk $F9.b		; 00 F9
	lda ($76.b)		; B2 76
	ora #$CA09.w		; 09 09 CA
	asl $9C.b		; 06 9C
	cmp $5CAA.w		; CD AA 5C
	.db $82, $3E, $9F		; 82 3E 9F
	and $B3A353.l,X		; 3F 53 A3 B3
	sta $87C1.w,Y		; 99 C1 87
	phk		; 4B
	tyx		; BB
	lsr $99.b		; 46 99
	ora $D121.w,Y		; 19 21 D1
	and ($0C.b,S),Y		; 33 0C
	and ($D1.b),Y		; 31 D1
	eor ($66.b),Y		; 51 66
	adc $35.b,X		; 75 35
	cpy $4394.w		; CC 94 43
	inc A		; 1A
	inx		; E8
	sbc ($79.b),Y		; F1 79
	trb $13.b		; 14 13
	sta ($19.b,S),Y		; 93 19
	jsr $7446.w		; 20 46 74
	eor $380123.l		; 4F 23 01 38
	stz $684C.w		; 9C 4C 68
	sty $21.b		; 84 21
	asl $0C0E.w		; 0E 0E 0C
	asl $12.b		; 06 12
	ldx $17FD.w		; AE FD 17
	rol $6F.b		; 26 6F
	ply		; 7A
	sta $EA86.w,X		; 9D 86 EA
	eor ($F2.b)		; 52 F2
	cmp ($45.b,X)		; C1 45
	tsb $C7.b		; 04 C7
	sei		; 78
	cld		; D8
	and $07.b,X		; 35 07
	sty $3B10.w		; 8C 10 3B
	trb $9EDD.w		; 1C DD 9E
	phb		; 8B
	cmp ($79.b,S),Y		; D3 79
	lda $34EA.w,X		; BD EA 34
	inx		; E8
	ror $67.b,X		; 76 67
	clv		; B8
	eor $129DE6.l,X		; 5F E6 9D 12
	adc $BC.b,S		; 63 BC
	adc #$8F8E.w		; 69 8E 8F
	ora $E7EA88.l		; 0F 88 EA E7
	eor $B5D6.w,Y		; 59 D6 B5
	adc $91.b,S		; 63 91
	cmp $9D76E5.l,X		; DF E5 76 9D
	sta $A1E9.w,X		; 9D E9 A1
	and ($10.b,X)		; 21 10
	sty $34.b		; 84 34
	ldy #$9C.b		; A0 9C
	adc #$11DD.w		; 69 DD 11
	pha		; 48
	phb		; 8B
	sbc $51.b,X		; F5 51
	tyx		; BB
	sta $6DB6.w		; 8D B6 6D
	txy		; 9B
	rol $A0.b		; 26 A0
	beq -16.b		; F0 F0
	sed		; F8
	sbc $67AA.w,Y		; F9 AA 67
	stx $8B.b,Y		; 96 8B
	ora [$80.b]		; 07 80
	inc $4488.w		; EE 88 44
	cmp $02.b		; C5 02
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	eor $4E.b,S		; 43 4E
	sta ($74.b),Y		; 91 74
	sbc ($04.b,S),Y		; F3 04
	jsr $8601.w		; 20 01 86
	cmp ($C0.b,X)		; C1 C0
	bvs  28.b		; 70 1C
	asl $D9.b		; 06 D9
	nop		; EA
	stx $0B.b,Y		; 96 0B
	ror $78.b		; 66 78
	sta $1B55D3.l		; 8F D3 55 1B
	clv		; B8
	bne -120.b		; D0 88
	ldy $A0.b		; A4 A0
	pla		; 68
	cmp ($08.b),Y		; D1 08
	eor [$16.b]		; 47 16
	cop $37.b		; 02 37
	adc ($B8.b),Y		; 71 B8
	bvs -73.b		; 70 B7
	adc ($BE.b),Y		; 71 BE
	rol $1637.w,X		; 3E 37 16
	cop $10.b		; 02 10
	sty $42.b		; 84 42
	rti		; 40

	rol $663C.w,X		; 3E 3C 66
	xba		; EB
	phx		; DA
	lda ($5E.b),Y		; B1 5E
	cmp $17CFE4.l,X		; DF E4 CF 17
	sbc $AEBE.w,X		; FD BE AE
	lsr $DF.b		; 46 DF
	eor $08A1ED.l		; 4F ED A1 08
	.db $42, $2E		; 42 2E
	txy		; 9B
	ror $F8.b		; 66 F8
	sta $5F0C.w,Y		; 99 0C 5F
	eor $DF.b,S		; 43 DF
	sbc ($36.b,S),Y		; F3 36
	sbc $F7.b,X		; F5 F7
	sbc ($E7.b,S),Y		; F3 E7
	lda [$46.b],Y		; B7 46
	tda		; 7B
	cli		; 58
	mvp $E6,$7B		; 44 7B E6
	cmp $4EBE.w,Y		; D9 BE 4E
	bvc  52.b		; 50 34
	tad		; 5B
	jmp $D1BC5F.l		; 5C 5F BC D1
	asl A		; 0A
	and $6E7D.w,X		; 3D 7D 6E
	inc $26.b		; E6 26
	inc $16.b,X		; F6 16
	cmp ($FB.b),Y		; D1 FB
	cld		; D8
	ora $02.b,S		; 03 02
	and ($5B.b,S),Y		; 33 5B
	and [$13.b],Y		; 37 13
	pld		; 2B
	phd		; 0B
	ora $E3.b,X		; 15 E3
	sbc $9EF5.w,Y		; F9 F5 9E
	dec A		; 3A
	adc ($5C.b),Y		; 71 5C
	bpl -124.b		; 10 84
	ora ($6B.b,S),Y		; 13 6B
	ror $34E9.w,X		; 7E E9 34
	phy		; 5A
	asl $48.b		; 06 48
	brk $21.b		; 00 21
	php		; 08
	eor $4A.b,S		; 43 4A
	ora #$8C8F.w		; 09 8F 8C
	sta $AC.b,X		; 95 AC
	trb $1F1E.w		; 1C 1E 1F
	eor $DA.b		; 45 DA
	cmp [$31.b],Y		; D7 31
	and $BEE4.w		; 2D E4 BE
	rti		; 40

	.db $42, $20		; 42 20
	pld		; 2B
	.db $62, $62, $64		; 62 62 64
	cpx $D7.b		; E4 D7
	bit $23.b		; 24 23
	jsl $FDFB0E.l		; 22 0E FB FD
	clv		; B8
	sec		; 38
	lda ($E1.b,X)		; A1 E1
	eor $685D.w		; 4D 5D 68
	trb $0B.b		; 14 0B
	sta ($F9.b)		; 92 F9
	ora ($08.b,X)		; 01 08
	sty $41.b		; 84 41
	lsr $9203.w,X		; 5E 03 92
	tsa		; 3B
	and $F999D5.l,X		; 3F D5 99 F9
	and ($8E.b,X)		; 21 8E
	sbc $5BBDDD.l,X		; FF DD BD 5B
	cmp ($E2.b,X)		; C1 E2
	jmp $26A7F1.l		; 5C F1 A7 26
	bit $23.b		; 24 23
	rol $58E9.w,X		; 3E E9 58
	sbc ($0F.b),Y		; F1 0F
	clc		; 18
	inc $6E65.w		; EE 65 6E
	sbc $7A.b,S		; E3 7A
	ror $577F.w,X		; 7E 7F 57
	and $FA8D.w,Y		; 39 8D FA
	mvn $3D,$3B		; 54 3B 3D
	sta $20A0.w,Y		; 99 A0 20
	and ($34.b,X)		; 21 34
	stx $94.b		; 86 94
	ora ($93.b,S),Y		; 13 93
	php		; 08
	dec $B9C5.w,X		; DE C5 B9
	sta ($BB.b,S),Y		; 93 BB
	sta $7FFD.w		; 8D FD 7F
	lda [$6A.b],Y		; B7 6A
	cpy $50.b		; C4 50
	cmp $0D.b		; C5 0D
	cmp $A6.b,S		; C3 A6
	rti		; 40

	rti		; 40

	rti		; 40

	.db $42, $42		; 42 42
	.db $42, $23		; 42 23
	lda $5F47CE.l		; AF CE 47 5F
	sta $F4D2.w,X		; 9D D2 F4
	lda $2FBF.w,X		; BD BF 2F
	sbc [$7C.b]		; E7 7C
	ora $DBC79F.l,X		; 1F 9F C7 DB
	rol $CD.b,X		; 36 CD
	lda ($60.b,S),Y		; B3 60
	sed		; F8
	ora $0FF880.l		; 0F 80 F8 0F
	bvs -67.b		; 70 BD
	phy		; 5A
	cmp $8C.b,X		; D5 8C
	inc $B7AF.w		; EE AF B7
	sbc $E2.b		; E5 E2
	sbc $FCD37F.l		; EF 7F D3 FC
	dec $ECCE.w		; CE CE EC
	inx		; E8
	.db $42, $2F		; 42 2F
	sta [$CF.b],Y		; 97 CF
	ora #$3939.w		; 09 39 39
	cmp ($D4.b),Y		; D1 D4
	rtl		; 6B

	and $8BBD.w,Y		; 39 BD 8B
	adc $E0.b,X		; 75 E0
	stx $8FCC.w		; 8E CC 8F
	eor $6D66.w		; 4D 66 6D
	eor $4C.b,S		; 43 4C
	cpx $9111.w		; EC 11 91
	sta ($13.b)		; 92 13
	ora ($0E.b,S),Y		; 13 0E
	cmp $1A3F9F.l		; CF 9F 3F 1A
	phb		; 8B
	ora $D2D7.w		; 0D D7 D2
	sbc $9FC0.w		; ED C0 9F
	sbc $E730.w,Y		; F9 30 E7
	and [$28.b]		; 27 28
	inc A		; 1A
	adc #$0F10.w		; 69 10 0F
	tya		; 98
	jmp ($DF50.w)		; 6C 50 DF
	sbc $8E8B.w,Y		; F9 8B 8E
	plb		; AB
	lda $B90B.w		; AD 0B B9
	mvn $6E,$E6		; 54 E6 6E
	plx		; FA
	bcc -97.b		; 90 9F
	and ($AF.b)		; 32 AF
	trb $68AE.w		; 1C AE 68
	ora $9958.w,Y		; 19 58 99
	sta $3D.b,X		; 95 3D
	jmp $8E69.w		; 4C 69 8E
	rol A		; 2A
	sty $08.b,X		; 94 08
	.db $42, $10		; 42 10
	sta ($EA.b,X)		; 81 EA
	tya		; 98
	ora $83.b,S		; 03 83
	ora #$0157.w		; 09 57 01
	stz $E5.b		; 64 E5
	sta $A9E6.w,Y		; 99 E6 A9
	stp		; DB
	ora ($F2.b),Y		; 11 F2
	bmi -116.b		; 30 8C
	bcc -100.b		; 90 9C
	ldy #$84.b		; A0 84
	bra 124.b		; 80 7C
	adc $4208.w,Y		; 79 08 42
	bpl -124.b		; 10 84
	jsl $00C457.l		; 22 57 C4 00
	sty $22.b		; 84 22
	sbc $D55B.w,X		; FD 5B D5
	lda [$B1.b],Y		; B7 B1
	adc $EEEF17.l,X		; 7F 17 EF EE
	sbc $00.b,S		; E3 00
	asl $8F0E.w		; 0E 0E 8F
	bpl  16.b		; 10 10
	bcc 126.b		; 90 7E
	lda ($B6.b,S),Y		; B3 B6
	eor $2E823B.l,X		; 5F 3B 82 2E
	php		; 08
	eor ($CD.b,X)		; 41 CD
	inc A		; 1A
	bvc  78.b		; 50 4E
	jmp $4648.w		; 4C 48 46
	lsr $B8.b		; 46 B8
	inx		; E8
	jmp $446D.w		; 4C 6D 44
	sbc $1C4E15.l		; EF 15 4E 1C
	ora $2EDC.w		; 0D DC 2E
	sec		; 38
	tsb $312A.w		; 0C 2A 31
	cmp ($A6.b)		; D2 A6
	asl $06.b		; 06 06
	asl $16.b,X		; 16 16
	and [$83.b],Y		; 37 83
	lda ($DD.b,X)		; A1 DD
	stp		; DB
	tad		; 5B
	sty $EC.b,X		; 94 EC
	lda $FFAB.w		; AD AB FF
	adc $DB7A.w,X		; 7D 7A DB
	cld		; D8
	eor $6C03.w,X		; 5D 03 6C
	jmp.w [$4D36]		; DC 36 4D
	lda $EF.b,S		; A3 EF
	cmp $F5.b,X		; D5 F5
	sty $5D2C.w		; 8C 2C 5D
	eor $C9AC.w,Y		; 59 AC C9
	inc $6FFE.w		; EE FE 6F
	tsa		; 3B
	plx		; FA
	txy		; 9B
	jsr ($3FBC.w,X)		; FC BC 3F
	ldy $BE.b,X		; B4 BE
	.db $82, $F1, $E6		; 82 F1 E6
	bit $3F.b		; 24 3F
	and ($FD.b),Y		; 31 FD
	eor [$F2.b]		; 47 F2
	sta $037DB4.l,X		; 9F B4 7D 03
	cmp [$05.b]		; C7 05
	cpx $AC.b		; E4 AC
	phk		; 4B
	ldx $2E.b,Y		; B6 2E
	sbc $DCD74E.l,X		; FF 4E D7 DC
	phx		; DA
	phy		; 5A
	lda $42D573.l,X		; BF 73 D5 42
	rol $4D97.w		; 2E 97 4D
	lda $68.b,S		; A3 68
	cmp $3D.b,X		; D5 3D
	eor ($EA.b,S),Y		; 53 EA
	tda		; 7B
	sta $FADC53.l,X		; 9F 53 DC FA
	stz $77E7.w,X		; 9E E7 77
	cmp [$FC.b]		; C7 FC
	ora $EF0E.w,X		; 1D 0E EF
	.db $42, $DF		; 42 DF
	eor $BB.b,S		; 43 BB
	bne  -9.b		; D0 F7
	ora $0FF770.l		; 0F 70 F7 0F
	trb $1DE8.w		; 1C E8 1D
	ora $A0.b,S		; 03 A0
	stz $07.b,X		; 74 07
	ldx $B3.b		; A6 B3
	and ($D3.b,S),Y		; 33 D3
	eor $5E9B.w,Y		; 59 9B 5E
	rtl		; 6B

	and ($2D.b,S),Y		; 33 2D
	xce		; FB
	tsa		; 3B
	sbc ($13.b,S),Y		; F3 13
	ora ($13.b,S),Y		; 13 13
	ora ($13.b,S),Y		; 13 13
	tas		; 1B
	inc $F9.b		; E6 F9
	plb		; AB
	lda ($DC.b,X)		; A1 DC
	inx		; E8
	ldy $E6BE.w		; AC BE E6
	.db $62, $C8, $BF		; 62 C8 BF
	sbc ($16.b,S),Y		; F3 16
	ora $811616.l,X		; 1F 16 16 81
	cmp ($32.b),Y		; D1 32
	cpy $20C3.w		; CC C3 20
	sbc $7095.w,Y		; F9 95 70
	cpy $042C.w		; CC 2C 04
	xba		; EB
	ror A		; 6A
	rol $2C.b		; 26 2C
	sta $CC.b,X		; 95 CC
	tyx		; BB
	phy		; 5A
	inc $2D.b,X		; F6 2D
	jsr ($4A27.w,X)		; FC 27 4A
	sty $9261.w		; 8C 61 92
	adc ($0A.b,S),Y		; 73 0A
	cld		; D8
	tya		; 98
	lda $B0.b,X		; B5 B0
	tax		; AA
	cmp $BB1F.w		; CD 1F BB
	sbc #$9468.w		; E9 68 94
	ora $8410.w		; 0D 10 84
	lsr $F7.b		; 46 F7
	lda $E5.b		; A5 E5
	inc A		; 1A
	adc $83.b,S		; 63 83
	brk $02.b		; 00 02
	cop $C9.b		; 02 C9
	ora ($08.b,X)		; 01 08
	sty $21.b		; 84 21
	tsb $64.b		; 04 64
	sty $64.b		; 84 64
	mvp $42,$AB		; 44 AB 42
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	rol A		; 2A
	ora ($91.b)		; 12 91
	lda $8B5B.w,X		; BD 5B 8B
	cop $9A.b		; 02 9A
	dey		; 88
	.db $42, $10		; 42 10
	sta ($F1.b,X)		; 81 F1
	cmp ($A1.b)		; D2 A1
	pld		; 2B
	bvc -124.b		; 50 84
	and ($A5.b,X)		; 21 A5
	jsl $5B2529.l		; 22 29 25 5B
	ora [$07.b]		; 07 07
	eor [$87.b]		; 47 87
	xce		; FB
	asl $C5.b		; 06 C5
	eor [$0F.b]		; 47 0F
	sbc ($1A.b)		; F2 1A
	stx $79.b		; 86 79
	ldx $0E59.w		; AE 59 0E
	adc $124D.w		; 6D 4D 12
	.db $82, $82, $72		; 82 82 72
	adc ($62.b)		; 72 62
	rtl		; 6B

	cmp $50.b,X		; D5 50
	stx $89.b		; 86 89
	sta $39A9.w		; 8D A9 39
	and $B056.w,Y		; 39 56 B0
	brk $C6.b		; 00 C6
	ora $18.b,X		; 15 18
	dec A		; 3A
	dec A		; 3A
	ldy $7BEF.w,X		; BC EF 7B
	cld		; D8
	lda ($F4.b,S),Y		; B3 F4
	sbc $5FEB.w,X		; FD EB 5F
	dec $B7C1.w,X		; DE C1 B7
	trb $04.b		; 14 04
	and [$9C.b]		; 27 9C
	tda		; 7B
	asl $D34F.w,X		; 1E 4F D3
	dec $B5.b,X		; D6 B5
	cpx $E0.b		; E4 E0
	sbc $E42AEE.l,X		; FF EE 2A E4
	stz $4B.b		; 64 4B
	cmp $A7.b,X		; D5 A7
	ora $DF61.w		; 0D 61 DF
	lda $AF7A.w		; AD 7A AF
	lda $F55A.w,X		; BD 5A F5
	ror $DEBF.w,X		; 7E BF DE
	sbc $4C.b,X		; F5 4C
	and ($0C.b,S),Y		; 33 0C
	lda $AD56.w		; AD 56 AD
	ror A		; 6A
	dec $7A4D.w,X		; DE 4D 7A
	cmp $BA9C7B.l,X		; DF 7B 9C BA
	phd		; 0B
	sta ($70.b,X)		; 81 70
	tda		; 7B
	adc $7A48.w,X		; 7D 48 7A
	asl $53DF.w,X		; 1E DF 53
	cpy $FDF2.w		; CC F2 FD
	ldx $40A7.w,Y		; BE A7 40
	cpx #$38.b		; E0 38
	asl $97A7.w		; 0E A7 97
	bne -117.b		; D0 8B
	lda #$CBE5.w		; A9 E5 CB
	ply		; 7A
	sta $2D4F.w,X		; 9D 4F 2D
	adc $85FEDB.l		; 6F DB FE 85
	dec $EBEB.w,X		; DE EB EB
	eor $F6.b,S		; 43 F6
	dec A		; 3A
	plx		; FA
	dec $7E6D.w,X		; DE 6D 7E
	ldx $F9B6.w,Y		; BE B6 F9
	sbc $FB15.w,X		; FD 15 FB
	dec $B7.b		; C6 B7
	tsa		; 3B
	cpx $AD45.w		; EC 45 AD
	dec $EBAF.w		; CE AF EB
	xba		; EB
	adc ($96.b,S),Y		; 73 96
	lda $FF.b		; A5 FF
	eor #$6E47.w		; 49 47 6E
	and [$CB.b]		; 27 CB
	ply		; 7A
	cmp $6AB11A.l		; CF 1A B1 6A
	asl $5895.w,X		; 1E 95 58
	iny		; C8
	plb		; AB
	sta ($6B.b)		; 92 6B
	eor [$26.b],Y		; 57 26
	phb		; 8B
	.db $42, $63		; 42 63
	txa		; 8A
	ldy $E5.b		; A4 E5
	and $02.b		; 25 02
	inc A		; 1A
	jsr $A67A.w		; 20 7A A6
	brk $E8.b		; 00 E8
	cpx #$E0.b		; E0 E0
	cmp ($83.b,X)		; C1 83
	ora ($09.b),Y		; 11 09
	ora ($64.b,X)		; 01 64
	cmp $33.b,X		; D5 33
	wai		; CB
	ror $78.b		; 66 78
	tsb $44.b		; 04 44
	stz $84.b		; 64 84
	cpy $E5.b		; C4 E5
	ora $51.b,S		; 03 51
	ror $1AAA.w,X		; 7E AA 1A
	cpy $21.b		; C4 21
	php		; 08
	asl $1C1D.w,X		; 1E 1D 1C
	clc		; 18
	lsr A		; 4A
	ldy $5C.b,X		; B4 5C
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	bit $24.b		; 24 24
	and $23.b,S		; 23 23
	jsl $8F0900.l		; 22 00 09 8F
	sty $ED90.w		; 8C 90 ED
	dey		; 88
	ldy $42.b		; A4 42
	ora [$87.b]		; 07 87
	cmp [$C8.b]		; C7 C8
	tsb $A032.w		; 0C 32 A0
	tsb $23.b		; 04 23
	lsr $94.b		; 46 94
	sty $14.b,X		; 94 14
	stz $0847.w		; 9C 47 08
	mvp $60,$30		; 44 30 60
	cpx #$E0.b		; E0 E0
	inx		; E8
	inx		; E8
	sbc [$F7.b],Y		; F7 F7
	lsr $CD69.w		; 4E 69 CD
	bit $8C.b,X		; 34 8C
	cmp $A4.b,S		; C3 A4
	bit $E9.b,X		; 34 E9
	ora [$FF.b]		; 07 FF
	asl $D8C1.w		; 0E C1 D8
	tsa		; 3B
	asl $C1.b		; 06 C1
	ldx $69.b		; A6 69
	txs		; 9A
	adc $97BC1C.l		; 6F 1C BC 97
	sta [$C7.b]		; 87 C7
	phb		; 8B
	and [$2C.b]		; 27 2C
	lda ($13.b)		; B2 13
	stz $F6.b		; 64 F6
	eor #$8989.w		; 49 89 89
	bit #$8989.w		; 89 89 89
	txs		; 9A
	bit $68.b,X		; 34 68
	stx $88.b		; 86 88
	.db $42, $06		; 42 06
	tsb $3018.w		; 0C 18 30
	rts		; 60

	cmp ($83.b,X)		; C1 83
	ora $983E.w,X		; 1D 3E 98
	sbc ($9E.b,X)		; E1 9E
	ror A		; 6A
	stx $0B.b,Y		; 96 0B
	adc $90.b		; 65 90
	stz $A09C.w		; 9C 9C A0
	ldy #$68.b		; A0 68
	cmp ($72.b)		; D2 72
	mvp $9A,$7E		; 44 7E 9A
	tay		; A8
	cmp $BDC6.w,X		; DD C6 BD
	tad		; 5B
	tda		; 7B
	asl $F5.b,X		; 16 F5
	rtl		; 6B

	clv		; B8
	.db $82, $11, $09		; 82 11 09
	ora #$CD01.w		; 09 01 CD
	and ($CC.b),Y		; 31 CC
	mvp $08,$21		; 44 21 08
	.db $42, $10		; 42 10
	bra  34.b		; 80 22
	and $22.b,S		; 23 22
	and $5B.b		; 25 5B
	lsr A		; 4A
	mvp $08,$21		; 44 21 08
	.db $42, $07		; 42 07
	sta [$C7.b]		; 87 C7
	cmp [$86.b]		; C7 86
	brk $07.b		; 00 07
	ora ($48.b),Y		; 11 48
	sty $21.b		; 84 21
	php		; 08
	eor ($A8.b,X)		; 41 A8
	ror A		; 6A
	ora ($11.b),Y		; 11 11
	ora ($00.b),Y		; 11 00
	ora $B1.b		; 05 B1
	php		; 08
	.db $42, $10		; 42 10
	sty $13.b		; 84 13
	ora ($12.b),Y		; 11 12
	lda $4208.w,X		; BD 08 42
	bpl -124.b		; 10 84
	jsr $2961.w		; 20 61 29
	ora $2B.b,X		; 15 2B
	txs		; 9A
	txs		; 9A
	sta ($2B.b),Y		; 91 2B
	cli		; 58
	bmi   4.b		; 30 04
	txy		; 9B
	sbc ($6F.b,X)		; E1 6F
	sta $BB.b		; 85 BB
	pea $21F0.w		; F4 F0 21
	trb $ED.b		; 14 ED
	stx $09.b		; 86 09
	.db $82, $61, $9C		; 82 61 9C
	adc ($08.b),Y		; 71 08
	iny		; C8
	trb $AD.b		; 14 AD
	tsx		; BA
	sbc $AFE7.w,X		; FD E7 AF
	bit $D94A.w,X		; 3C 4A D9
	ora #$8589.w		; 09 89 85
	pld		; 2B
	inc A		; 1A
	tay		; A8
	eor ($A9.b,S),Y		; 53 A9
	cmp #$C156.w		; C9 56 C1
	cmp ($D1.b,X)		; C1 D1
	cmp ($4A.b),Y		; D1 4A
	clv		; B8
	eor $B8.b,X		; 55 B8
	adc $6EC3.w		; 6D C3 6E
	ora ($56.b)		; 12 56
	cpy $44.b		; C4 44
	mvp $49,$29		; 44 29 49
	sta ($93.b)		; 92 93
	eor ($A6.b)		; 52 A6
	sbc $DB.b,X		; F5 DB
	xce		; FB
	and [$B6.b],Y		; 37 B6
	lda $E9DD6A.l		; AF 6A DD E9
	bra   6.b		; 80 06
	and ($96.b,X)		; 21 96
	adc ($0D.b,S),Y		; 73 0D
	ora $9E.b,S		; 03 9E
	and #$DE48.w		; 29 48 DE
	tsx		; BA
	lsr A		; 4A
	eor [$10.b]		; 47 10
	eor ($B9.b)		; 52 B9
	lda #$82AA.w		; A9 AA 82
	lsr $B0.b,X		; 56 B0
	rts		; 60

	cpx #$A5.b		; E0 A5
	jmp ($422D.w)		; 6C 2D 42
	and $73.b		; 25 73
	tsb $21.b		; 04 21
	lsr A		; 4A
	dec $B1.b,X		; D6 B1
	ldy $C2A5.w		; AC A5 C2
	lsr $B4.b,X		; 56 B4
	adc #$A540.w		; 69 40 A5
	adc $0DDF0B.l		; 6F 0B DF 0D
	and $4AD4.w,X		; 3D D4 4A
	cmp $808A.w,Y		; D9 8A 80
	and #$715B.w		; 29 5B 71
	jmp $1265B7.l		; 5C B7 65 12
	ldx $08B8.w,Y		; BE B8 08
	.db $42, $10		; 42 10
	sty $21.b		; 84 21
	ora ($94.b)		; 12 94
	eor ($B9.b)		; 52 B9
	tax		; AA
	adc $31.b,X		; 75 31
	pld		; 2B
	cli		; 58
	dec A		; 3A
	bit $DA5E.w,X		; 3C 5E DA
	lda $D4F9.w,X		; BD F9 D4
	lsr A		; 4A
	rol $FA.b		; 26 FA
	and [$DD.b],Y		; 37 DD
	.db $42, $39		; 42 39
	sta [$8E.b]		; 87 8E
	.db $42, $42		; 42 42
	adc #$8813.w		; 69 13 88
	eor $ED.b		; 45 ED
	tad		; 5B
	bcc  92.b		; 90 5C
	.db $82, $15, $2A		; 82 15 2A
	and $5CE9.w		; 2D E9 5C
	cpy $23D0.w		; CC D0 23
	and $25.b,S		; 23 25
	eor [$A2.b],Y		; 57 A2
	jmp ($650A.w)		; 6C 0A 65
	and $EF.b		; 25 EF
	cmp $5EFE77.l		; CF 77 FE 5E
	ora $3FFCF9.l		; 0F F9 FC 3F
	rol $84DE.w,X		; 3E DE 84
	and ($3C.b)		; 32 3C
	rol $E778.w,X		; 3E 78 E7
	plx		; FA
	eor $F91EF4.l		; 4F F4 1E F9
	tax		; AA
	rol $A142.w,X		; 3E 42 A1
	jmp ($862D.w)		; 6C 2D 86
	sta $42.b		; 85 42
	stz $5FE6.w,X		; 9E E6 5F
	eor $0683ED.l,X		; 5F ED 83 06
	asl $0E0E.w		; 0E 0E 0E
	txy		; 9B
	and [$AA.b]		; 27 AA
	eor $E77E.w,X		; 5D 7E E7
	rol $E7.b,X		; 36 E7
	rol $DE.b,X		; 36 DE
	sta $8CBE.w		; 8D BE 8C
	and ($E9.b,S),Y		; 33 E9
	adc $21C1D3.l		; 6F D3 C1 21
	cld		; D8
	tsa		; 3B
	asl $99.b		; 06 99
	tay		; A8
	dec A		; 3A
	adc ($9C.b,X)		; 61 9C
	adc ($EB.b)		; 72 EB
	sbc [$20.b],Y		; F7 20
	lda [$0D.b],Y		; B7 0D
	clv		; B8
	adc ($50.b,X)		; 61 50
	ldy $93.b		; A4 93
	stz $23.b		; 64 23
	jsl $532522.l		; 22 22 25 53
	asl A		; 0A
	ror $EF.b,X		; 76 EF
	inc $F75F.w		; EE 5F F7
	sbc $DF0B7E.l		; EF 7E 0B DF
	sta $C1.b,S		; 83 C1
.ACCU 8
.INDEX 8
	sep #$78		; E2 78
	bit $994B.w,X		; 3C 4B 99
	adc $3906.w,Y		; 79 06 39
	sbc ($CE.b,S),Y		; F3 CE
	sta ($D0.b,X)		; 81 D0
	and $8DFA51.l,X		; 3F 51 FA 8D
	sta ($51.b),Y		; 91 51
	tda		; 7B
	lsr $97.b,X		; 56 97
	and #$73.b		; 29 73
	lda $7D.b		; A5 7D
	bit $A1.b		; 24 A1
	lsr $051A.w		; 4E 1A 05
	ora $05.b		; 05 05
	eor ($55.b)		; 52 55
	jsl $FBBB9D.l		; 22 9D BB FB
	sta [$F6.b],Y		; 97 F6
	adc $D55E6D.l		; 6F 6D 5E D5
	tyx		; BB
	xba		; EB
	eor $A3E4.w,X		; 5D E4 A3
	jsr $32C7.w		; 20 C7 32
	dec $A061.w		; CE 61 A0
	adc $BC83.w,X		; 7D 83 BC
	jmp $AE2481.l		; 5C 81 24 AE
	adc $EE.b,X		; 75 EE
	cpx $5C.b		; E4 5C
	inc $7C.b		; E6 7C
	rol $5B37.w,X		; 3E 37 5B
	cpx $00C6.w		; EC C6 00
	adc ($8D.b,S),Y		; 73 8D
	lda ($68.b,S),Y		; B3 68
	sbc $E307.w,X		; FD 07 E3
	trb $A9.b		; 14 A9
	ldy $2EF5.w,X		; BC F5 2E
	adc #$77.b		; 69 77
	lda #$E0.b		; A9 E0
	pha		; 48
	brk $26.b		; 00 26
	plp		; 28
	and $1C27.w,Y		; 39 27 1C
	asl $EEEA.w		; 0E EA EE
	lda #$48.b		; A9 48
	ora ($93.b)		; 12 93
	clv		; B8
	ldx $4829.w		; AE 29 48
	ora ($93.b)		; 12 93
	eor ($26.b,S),Y		; 53 26
	tax		; AA
	ora $0A.b,X		; 15 0A
	adc $3A.b,X		; 75 3A
	sta $F04C.w,Y		; 99 4C F0
	cmp ($C1.b,X)		; C1 C1
	cmp ($D1.b,X)		; C1 D1
	cmp ($E1.b),Y		; D1 E1
	sbc ($16.b,X)		; E1 16
	pea $E8AD.w		; F4 AD E8
	cmp $3E.b,S		; C3 3E
	sta [$7A.b],Y		; 97 7A
	sta [$2F.b],Y		; 97 2F
	and $0472.w,X		; 3D 72 04
	ply		; 7A
	rol $98.b		; 26 98
	sbc #$C9.b		; E9 C9
	plp		; 28
	rol $23.b		; 26 23
	rol $DC65.w		; 2E 65 DC
	wai		; CB
	lda $EBCC.w,Y		; B9 CC EB
	adc $769A.w,X		; 7D 9A 76
	and $D55EEA.l		; 2F EA 5E D5
	tsx		; BA
	inc $B2C9.w,X		; FE C9 B2
	adc $8C1F.w		; 6D 1F 8C
	cpy $263A.w		; CC 3A 26
	sta ($20.b,X)		; 81 20
	dec $52.b,X		; D6 52
	sbc [$A1.b]		; E7 A1
	lda $727F.w,Y		; B9 7F 72
	inc $FDE5.w,X		; FE E5 FD
	txy		; 9B
	xce		; FB
	and [$B6.b],Y		; 37 B6
	txs		; 9A
	bvc  99.b		; 50 63
	tya		; 98
	inc $39.b		; E6 39
	stx $65.b,Y		; 96 65
	stz $9EC2.w		; 9C C2 9E
	asl A		; 0A
	ror $EF.b,X		; 76 EF
	inc $D95F.w		; EE 5F D9
	lda $77AB.w,X		; BD AB 77
	lda [$75.b]		; A7 75
	xce		; FB
	lda $83CCF1.l		; AF F1 CC 83
	trb $34CB.w		; 1C CB 34
	asl $2179.w		; 0E 79 21
	and ($4E.b,X)		; 21 4E
	cmp $95FD.w,X		; DD FD 95
	inc A		; 1A
	bit #$44.b		; 89 44
	dec $5C.b,X		; D6 5C
	sta ($2C.b,X)		; 81 2C
	sta $2C.b,S		; 83 2C
	bra -124.b		; 80 84
	sty $69.b		; 84 69
	clc		; 18
	ora #$AA.b		; 09 AA
	phb		; 8B
	lda $7117.w,Y		; B9 17 71
	jsr ($231E.w,X)		; FC 1E 23
	jmp ($F034.w,X)		; 7C 34 F0
	eor ($C0.b,S),Y		; 53 C0
	cmp ($C3.b,X)		; C1 C3
	jmp ($3FDC.w)		; 6C DC 3F
	eor ($82.b),Y		; 51 82
	adc ($CE.b),Y		; 71 CE
	and $A36F.w,Y		; 39 6F A3
	adc $211A46.l		; 6F 46 1A 21
	lda ($35.b,X)		; A1 35
	bit $AF.b		; 24 AF
	adc ($EA.b,X)		; 61 EA
	inc A		; 1A
	adc $83.b,S		; 63 83
	sta $00.b,S		; 83 00
	ora $15F2.w		; 0D F2 15
	adc $95DE4A.l		; 6F 4A DE 95
	cpy $B9CB.w		; CC CB B9
	ora [$BF.b],Y		; 17 BF
	ora [$C9.b]		; 07 C9
	inc $91DF.w,X		; FE DF 91
	cpx #$F4.b		; E0 F4
	eor $36D844.l		; 4F 44 D8 36
	dec $FE81.w		; CE 81 FE
.ACCU 16
	rep #$62		; C2 62
	inc $65.b		; E6 65
	cpy $BFCE.w		; CC CE BF
	sbc ($F5.b),Y		; F1 F5
	inc $4BDF.w,X		; FE DF 4B
	sta $D0.b,S		; 83 D0
	jmp.w [$B9BF]		; DC BF B9
	tda		; 7B
	rtl		; 6B

	rts		; 60

	cld		; D8
	and $4EF590.l,X		; 3F 90 F5 4E
	and $638E.w,Y		; 39 8E 63
	stz $ADC3.w		; 9C C3 AD
	inc $7D.b,X		; F6 7D
	ora $FBCB.w		; 0D CB FB
	and [$F6.b],Y		; 37 F6
	adc #$6FDB.w		; 69 DB 6F
	adc $A74C.w,Y		; 79 4C A7
	jsr ($3966.w,X)		; FC 66 39
	stx $65.b,Y		; 96 65
	sta $2407.w,Y		; 99 07 24
	sei		; 78
	stz $52.b,X		; 74 52
	tsx		; BA
	ror $B2.b,X		; 76 B2
	sta [$09.b],Y		; 97 09
	phy		; 5A
	inx		; E8
	cmp ($81.b)		; D2 81
	lsr A		; 4A
	stp		; DB
	bvs -92.b		; 70 A4
	sta ($2B.b),Y		; 91 2B
	.db $62, $00, $14		; 62 00 14
	sty $EC.b,X		; 94 EC
	eor ($B0.b,S),Y		; 53 B0
	lda $6B.b		; A5 6B
	inc $61.b		; E6 61
	tya		; 98
	lsr A		; 4A
	xba		; EB
	ply		; 7A
	lsr A		; 4A
	eor ($3E.b)		; 52 3E
	bit #$2B29.w		; 89 29 2B
	lda $A5B6DC.l		; AF DC B6 A5
	jmp ($7285.w,X)		; 7C 85 72
	eor ($17.b)		; 52 17
	lda $BE5B.w,X		; BD 5B BE
	lda ($A1.b)		; B2 A1
	bvc -89.b		; 50 A7
	eor ($B7.b,S),Y		; 53 B7
	ror $FF9B.w,X		; 7E 9B FF
	jmp ($03FB.w)		; 6C FB 03
	sta $83.b,S		; 83 83
	lda $A6.b,S		; A3 A6
	ora $B954.w,Y		; 19 54 B9
	ora $BE.b		; 05 BE
	txa		; 8A
	ora ($79.b),Y		; 11 79
	inx		; E8
	mvn $8C,$A8		; 54 A8 8C
	pei ($10.b)		; D4 10
	bit #$5489.w		; 89 89 54
	sta $C8.b,X		; 95 C8
	rol $0441.w		; 2E 41 04
	rol A		; 2A
	eor $84.b,X		; 55 84
	stz $64.b		; 64 64
	mvp $BF,$AC		; 44 AC BF
	adc $464A.w,Y		; 79 4A 46
	lda ($29.b),Y		; B1 29
	bit $28.b		; 24 28
	stp		; DB
	sbc ($52.b,X)		; E1 52
	clv		; B8
	bra -63.b		; 80 C1
	and $75.b		; 25 75
	cmp [$ED.b],Y		; D7 ED
.ACCU 16
	rep #$A5		; C2 A5
	jmp ($4484.w,X)		; 7C 84 44
	ldy $2F.b		; A4 2F
	adc $E95D.w		; 6D 5D E9
	lda #$CC5F.w		; A9 5F CC
	and $A4E4.w,Y		; 39 E4 A4
	ora $0A.b,X		; 15 0A
	eor ($2E.b)		; 52 2E
	ora ($92.b)		; 12 92
	lda $9402.w,Y		; B9 02 94
	sty $A464.w		; 8C 64 A4
	sty $AA.b,X		; 94 AA
	sta ($F7.b)		; 92 F7
	sta $C1.b,S		; 83 C1
	cmp $62A7.w,X		; DD A7 62
	sbc $B0.b		; E5 B0
	brk $7C.b		; 00 7C
	sbc $E693.w,X		; FD 93 E6
	sta $7185.w,Y		; 99 85 71
	lsr A		; 4A
	lda #$EF3C.w		; A9 3C EF
	ora [$83.b]		; 07 83
	tyx		; BB
	lsr $EDC5.w		; 4E C5 ED
	bvc   0.b		; 50 00
	jmp ($93FD.w,X)		; 7C FD 93
	inc $99.b		; E6 99
	stx $80.b		; 86 80
	lda $54.b		; A5 54
	stz $DB75.w,X		; 9E 75 DB
	lda [$29.b],Y		; B7 29
	cld		; D8
	lda $006C.w,Y		; B9 6C 00
	ora $930C31.l,X		; 1F 31 0C 93
	bmi -82.b		; 30 AE
	and #$0C53.w		; 29 53 0C
	cmp [$AE.b],Y		; D7 AE
	cmp $4EB9.w,X		; DD B9 4E
	cmp $C037.w,X		; DD 37 C0
	ora ($E3.b,X)		; 01 E3
	bpl -55.b		; 10 C9
	and ($0A.b)		; 32 0A
	ldx #$95.b		; A2 95
	bmi -55.b		; 30 C9
	ply		; 7A
	sbc $94DB.w		; ED DB 94
	cpx $B65C.w		; EC 5C B6
	brk $0F.b		; 00 0F
	tya		; 98
	stx $49.b		; 86 49
	tya		; 98
	eor [$14.b],Y		; 57 14
	lda #$AEF3.w		; A9 F3 AE
	cmp $EFBFDC.l,X		; DF DC BF EF
	cmp $F7FF.w,X		; DD FF F7
	cmp $FF.b,S		; C3 FF
	bra   0.b		; 80 00
	cpy $31.b		; C4 31
	cmp $707F9E.l		; CF 9E 7F 70
	sbc $4DA500.l,X		; FF 00 A5 4D
	ldx $5B7F.w,Y		; BE 7F 5B
	bne -106.b		; D0 96
	dec $2FF4.w,X		; DE F4 2F
	lsr $00BA.w,X		; 5E BA 00
	ora $EE33.w,X		; 1D 33 EE
	sta $8A.b,X		; 95 8A
	dec $20.b		; C6 20
	lda $4E.b		; A5 4E
	sta [$7A.b],Y		; 97 7A
	sbc $96CB.w		; ED CB 96
	sbc $BCDFEC.l		; EF EC DF BC
	brk $1C.b		; 00 1C
	sta ($24.b,S),Y		; 93 24
	ldx $9565.w		; AE 65 95
	phb		; 8B
	stx $ED.b,Y		; 96 ED
.ACCU 16
	rep #$A5		; C2 A5
	adc $2272.w,X		; 7D 72 22
	eor ($1F.b)		; 52 1F
	lda [$FE.b]		; A7 FE
	inc $9CF7.w,X		; FE F7 9C
	lda $7F.b		; A5 7F
	sed		; F8
	eor $424ABC.l		; 4F BC 4A 42
	sbc $BB.b		; E5 BB
	inc $5FA9.w		; EE A9 5F
	jmp $85949C.l		; 5C 9C 94 85
	and [$EF.b],Y		; 37 EF
	bit $7DA5.w,X		; 3C A5 7D
	eor ($62.b)		; 52 62
	eor ($1F.b)		; 52 1F
	ora $E8AD5B.l		; 0F 5B AD E8
	and #$F45F.w		; 29 5F F4
	eor $424ABA.l		; 4F BA 4A 42
	sbc $DB.b,X		; F5 DB
	lda $F8950A.l,X		; BF 0A 95 F8
	sta [$F6.b]		; 87 F6
	eor #$5F48.w		; 49 48 5F
	lda $F575.w,X		; BD 75 F5
	pld		; 2B
	xba		; EB
	ora ($12.b)		; 12 12
	bcc  66.b		; 90 42
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	sty $A2.b,X		; 94 A2
	bpl -124.b		; 10 84
	and ($08.b,X)		; 21 08
	mvp $82,$A4		; 44 A4 82
	eor $FF00.w,Y		; 59 00 FF
	adc $1F0000.l,X		; 7F 00 00 1F
	brk $1F.b		; 00 1F
	bit $7C1F.w,X		; 3C 1F 7C
	ora $7C007C.l		; 0F 7C 00 7C
	rts		; 60

	adc $76E0.w,Y		; 79 E0 76
	bra  91.b		; 80 5B
	rts		; 60

	pld		; 2B
	rti		; 40

	ora $6D.b,S		; 03 6D
	ora $BD.b,S		; 03 BD
	ora $DE.b,S		; 03 DE
	ora ($1F.b,X)		; 01 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	bit $7C1F.w,X		; 3C 1F 7C
	ora $7C007C.l		; 0F 7C 00 7C
	rts		; 60

	adc $76E0.w,Y		; 79 E0 76
	bra  91.b		; 80 5B
	rts		; 60

	pld		; 2B
	rti		; 40

	ora $6D.b,S		; 03 6D
	ora $BD.b,S		; 03 BD
	ora $DE.b,S		; 03 DE
	ora ($1F.b,X)		; 01 1F
	brk $1E.b		; 00 1E
	bit $2C1E.w		; 2C 1E 2C
	brk $00.b		; 00 00
	sbc $7C1F7F.l,X		; FF 7F 1F 7C
	brk $00.b		; 00 00
	ora $401E54.l,X		; 1F 54 1E 40
	asl $1E2C.w,X		; 1E 2C 1E
	bit $2C1E.w		; 2C 1E 2C
	asl $1E2C.w,X		; 1E 2C 1E
	bit $2C1E.w		; 2C 1E 2C
	asl $1E2C.w,X		; 1E 2C 1E
	bit $2C1E.w		; 2C 1E 2C
	asl $002C.w,X		; 1E 2C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	xce		; FB
	brk $03.b		; 00 03
	stx $82.b		; 86 82
	brk $03.b		; 00 03
	stx $AF.b		; 86 AF
	ora #$00B0.w		; 09 B0 00
	brk $B1.b		; 00 B1
	bcs -80.b		; B0 B0
	lda ($B1.b)		; B2 B1
	lda ($B3.b),Y		; B1 B3
	lda ($B2.b)		; B2 B2
	ldy $B3.b,X		; B4 B3
	lda ($B5.b,S),Y		; B3 B5
	ldy $B4.b,X		; B4 B4
	ldx $B1.b,Y		; B6 B1
	bcs -73.b		; B0 B7
	lda $B5.b,X		; B5 B5
	clv		; B8
	ldx $00.b,Y		; B6 00
	jsr $1C00.w		; 20 00 1C
	brk $10.b		; 00 10
	lda [$B7.b],Y		; B7 B7
	ldx $01.b,Y		; B6 01
	cop $03.b		; 02 03
	tsb $05.b		; 04 05
	lda ($00.b),Y		; B1 00
	asl $07.b		; 06 07
	php		; 08
	ora #$0AB3.w		; 09 B3 0A
	phd		; 0B
	tsb $0E0D.w		; 0C 0D 0E
	ora $00B010.l		; 0F 10 B0 00
	ora ($12.b),Y		; 11 12
	ora ($14.b,S),Y		; 13 14
	ora $16.b,X		; 15 16
	ora [$B6.b],Y		; 17 B6
	clc		; 18
	ora $B61A.w,Y		; 19 1A B6
	tas		; 1B
	trb $1E1D.w		; 1C 1D 1E
	ora $002120.l,X		; 1F 20 21 00
	jsl $230009.l		; 22 09 00 23
	bit $25.b		; 24 25
	rol $27.b		; 26 27
	plp		; 28
	ldx $29.b,Y		; B6 29
	rol A		; 2A
	pld		; 2B
	ldx $2C.b,Y		; B6 2C
	and $2F2E.w		; 2D 2E 2F
	bmi  49.b		; 30 31
	and ($33.b)		; 32 33
	bit $35.b,X		; 34 35
	rol $00.b,X		; 36 00
	and [$38.b],Y		; 37 38
	and $3B3A.w,Y		; 39 3A 3B
	bit $3E3D.w,X		; 3C 3D 3E
	and $424140.l,X		; 3F 40 41 42
	eor $44.b,S		; 43 44
	clv		; B8
	eor $46.b		; 45 46
	eor [$48.b]		; 47 48
	eor #$4B4A.w		; 49 4A 4B
	jmp $4E4D.w		; 4C 4D 4E
	eor $525150.l		; 4F 50 51 52
	eor ($54.b,S),Y		; 53 54
	eor $56.b,X		; 55 56
	eor [$58.b],Y		; 57 58
	eor $5B5A.w,Y		; 59 5A 5B
	jmp $5EB85D.l		; 5C 5D B8 5E
	eor $626160.l,X		; 5F 60 61 62
	adc $64.b,S		; 63 64
	adc $66.b		; 65 66
	adc [$68.b]		; 67 68
	adc #$6B6A.w		; 69 6A 6B
	jmp ($6E6D.w)		; 6C 6D 6E
	adc $727170.l		; 6F 70 71 72
	adc ($74.b,S),Y		; 73 74
	adc $76.b,X		; 75 76
	clv		; B8
	adc [$78.b],Y		; 77 78
	brk $79.b		; 00 79
	brk $7A.b		; 00 7A
	tda		; 7B
	jmp ($7E7D.w,X)		; 7C 7D 7E
	adc $828180.l,X		; 7F 80 81 82
	ror $8483.w,X		; 7E 83 84
	sta $86.b		; 85 86
	sta [$88.b]		; 87 88
	bit #$8B8A.w		; 89 8A 8B
	sty $B8B4.w		; 8C B4 B8
	sta $8F8E.w		; 8D 8E 8F
	bcc   0.b		; 90 00
	sta ($92.b),Y		; 91 92
	sta ($94.b,S),Y		; 93 94
	brk $95.b		; 00 95
	stx $00.b,Y		; 96 00
	sta [$98.b],Y		; 97 98
	sta $9A00.w,Y		; 99 00 9A
	txy		; 9B
	stz $9E9D.w		; 9C 9D 9E
	sta $A2A1A0.l,X		; 9F A0 A1 A2
	clv		; B8
	lda $00.b,S		; A3 00
	ldy $00.b		; A4 00
	lda $A6.b		; A5 A6
	lda [$B0.b]		; A7 B0
	tay		; A8
	lda #$AA00.w		; A9 00 AA
	plb		; AB
	lda [$00.b]		; A7 00
	lda [$5D.b]		; A7 5D
	tay		; A8
	ldy $AD00.w		; AC 00 AD
	ldx $B7B7.w		; AE B7 B7
	lda $B0.b,X		; B5 B0
	brk $AF.b		; 00 AF
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $2B.b		; 00 2B
	cpy #$04.b		; C0 04
	brk $15.b		; 00 15
	sep #$08		; E2 08
	eor $8AF4.w		; 4D F4 8A
	mvn $C2,$07		; 54 07 C2
	jmp $1908.w		; 4C 08 19
	tsb $E93B.w		; 0C 3B E9
	cop $48.b		; 02 48
	adc ($84.b,X)		; 61 84
	bcc  36.b		; 90 24
	sta $5C6F.w,X		; 9D 6F 5C
	lda $1E.b,S		; A3 1E
	txy		; 9B
	sta ($4E.b)		; 92 4E
	lda [$A7.b],Y		; B7 A7
	jmp $94B89E.l		; 5C 9E B8 94
	bmi -82.b		; 30 AE
	ora $C150.w,Y		; 19 50 C1
	dec A		; 3A
	ror $1461.w		; 6E 61 14
	and ($64.b)		; 32 64
	brk $24.b		; 00 24
	cpx #$09.b		; E0 09
	dec A		; 3A
	sbc [$5C.b],Y		; F7 5C
	sta ($1B.b,S),Y		; 93 1B
	inc $0580.w		; EE 80 05
	lda $2D00.w,X		; BD 00 2D
	inx		; E8
	ora ($6C.b,X)		; 01 6C
	brk $2E.b		; 00 2E
	eor $E40E43.l		; 4F 43 0E E4
	bmi  69.b		; 30 45
	sta ($A9.b,S),Y		; 93 A9
	sty $50.b		; 84 50
	cop $49.b		; 02 49
	cmp ($27.b,X)		; C1 27
	tad		; 5B
	stz $EB.b		; 64 EB
	sta $C9D0.w,X		; 9D D0 C9
	stz $4900.w		; 9C 00 49
	rti		; 40

	bit $EB.b		; 24 EB
	dec A		; 3A
	sbc ($0C.b,X)		; E1 0C
	and [$5B.b]		; 27 5B
	adc $9B.b		; 65 9B
	cmp $AEFB.w,X		; DD FB AE
	pld		; 2B
	cmp ($5B.b)		; D2 5B
	cmp ($40.b)		; D2 40
	sbc #$5815.w		; E9 15 58
	asl A		; 0A
	tay		; A8
	and $1837.w,Y		; 39 37 18
	sbc #$88B9.w		; E9 B9 88
	rti		; 40

	eor $63.b,X		; 55 63
	sta ($39.b,S),Y		; 93 39
	eor $9D.b,X		; 55 9D
	adc ($BA.b)		; 72 BA
	jmp $904B98.l		; 5C 98 4B 90
	lda ($EF.b)		; B2 EF
	ora [$AD.b],Y		; 17 AD
	lda $EF16.w,X		; BD 16 EF
	ora $B6.b,X		; 15 B6
	pea $DE56.w		; F4 56 DE
	txa		; 8A
	ldx $5A.b		; A6 5A
	tay		; A8
	cop $AA.b		; 02 AA
	ora $92.b,S		; 03 92
	asl $2A48.w		; 0E 48 2A
	ldy #$2A.b		; A0 2A
	ldy #$2A.b		; A0 2A
	tya		; 98
	eor $57C6.w		; 4D C6 57
	ora $C650.w,Y		; 19 50 C6
	ldy #$04.b		; A0 04
	sta ($89.b,S),Y		; 93 89
	and $C5.b		; 25 C5
	tyx		; BB
	adc #$6296.w		; 69 96 62
	and ($7E.b,S),Y		; 33 7E
	clv		; B8
	cmp [$74.b],Y		; D7 74
	wai		; CB
	and ($15.b),Y		; 31 15
	eor ($CA.b),Y		; 51 CA
	clv		; B8
	jmp.w [$AD93]		; DC 93 AD
	ldy $AD13.w,X		; BC 13 AD
	bcs 101.b		; B0 65
	lda [$A3.b],Y		; B7 A3
	dec A		; 3A
	stp		; DB
	ora $D8D6.w,Y		; 19 D6 D8
	lda [$1B.b],Y		; B7 1B
	sta $D41D.w,Y		; 99 1D D4
	eor $92.b,X		; 55 92
	sec		; 38
	cmp $00E9.w,X		; DD E9 00
	and $00BD.w		; 2D BD 00
	lda $2E10.w,Y		; B9 10 2E
	eor $23D749.l		; 4F 49 D7 23
	sta $EE3A.w,Y		; 99 3A EE
	ldy $6AEB.w		; AC EB 6A
	ldy $98B6.w		; AC B6 98
	eor [$0C.b]		; 47 0C
	ldx $A932.w		; AE 32 A9
	sta $61.b,X		; 95 61
	sta [$10.b]		; 87 10
	dex		; CA
	bra   4.b		; 80 04
	nop		; EA
	brk $49.b		; 00 49
	brk $27.b		; 00 27
	lsr $2E09.w,X		; 5E 09 2E
	sbc ($AE.b,S),Y		; F3 AE
	eor $31225C.l		; 4F 5C 22 31
	sec		; 38
	adc $43.b		; 65 43
	rol A		; 2A
	ora $CA50.w,Y		; 19 50 CA
	.db $82, $A0, $0A		; 82 A0 0A
	ldy #$04.b		; A0 04
	sta [$72.b],Y		; 97 72
	adc $C8.b,X		; 75 C8
	sta $E977.w,X		; 9D 77 E9
	dec A		; 3A
	cmp $8D21.w,Y		; D9 21 8D
	ldx $4A.b		; A6 4A
	cmp $85E4.w,X		; DD E4 85
	sbc #$2400.w		; E9 00 24
	and ($04.b),Y		; 31 04
	brk $54.b		; 00 54
	adc ($98.b),Y		; 71 98
	ora ($DB.b)		; 12 DB
	bne -99.b		; D0 9D
	adc $2D89.w		; 6D 89 2D
	lda $D619.w,X		; BD 19 D6
	cld		; D8
	lda ($EF.b)		; B2 EF
	ora [$AE.b],Y		; 17 AE
	inx		; E8
	jmp.w [$6E80]		; DC 80 6E
	rti		; 40

	lda $85.b,S		; A3 85
	brk $AA.b		; 00 AA
	bra -86.b		; 80 AA
	bra -86.b		; 80 AA
	brk $AA.b		; 00 AA
	wai		; CB
	eor $5E.b,X		; 55 5E
	lda $50.b,X		; B5 50
	ldx $80.b,Y		; B6 80
	phk		; 4B
	pla		; 68
	ora ($AD.b,S),Y		; 13 AD
	ldy #$4B.b		; A0 4B
	clv		; B8
	lsr $F0B6.w		; 4E B6 F0
	phk		; 4B
	ldy $2AB6.w,X		; BC B6 2A
	lda [$A0.b],Y		; B7 A0
	pld		; 2B
	rts		; 60

	rol A		; 2A
	cld		; D8
	asl A		; 0A
	ldy $AC0A.w,X		; BC 0A AC
	trb $2A98.w		; 1C 98 2A
	bcs  21.b		; B0 15
	adc [$2A.b]		; 67 2A
	brk $2A.b		; 00 2A
	brk $2A.b		; 00 2A
	brk $29.b		; 00 29
	sta ($A6.b)		; 92 A6
	lsr A		; 4A
	eor $4BC2.w		; 4D C2 4B
	adc $30C905.l		; 6F 05 C9 30
	mvp $4A,$86		; 44 86 4A
	bra  42.b		; 80 2A
	bra  42.b		; 80 2A
	bra  42.b		; 80 2A
	bra  10.b		; 80 0A
	adc $8E.b,S		; 63 8E
	bpl   4.b		; 10 04
	and ($67.b)		; 32 67
	ora $8032.w,Y		; 19 32 80
	ora ($A8.b,S),Y		; 13 A8
	ora ($2D.b,X)		; 01 2D
	stx $DE.b,Y		; 96 DE
	phb		; 8B
	dec $D8.b,X		; D6 D8
	lda $03DE.w		; AD DE 03
	adc [$80.b],Y		; 77 80
	cmp $6DC1.w,X		; DD C1 6D
	ldy $6D2B.w,X		; BC 2B 6D
	.db $82, $B6, $F4		; 82 B6 F4
	trb $056C.w		; 1C 6C 05
	mvn $50,$05		; 54 05 50
	ora $40.b		; 05 40
	ora $40.b		; 05 40
	ora $32.b		; 05 32
	eor $65.b,X		; 55 65
	lda $55.b,X		; B5 55
	ldx $82.b,Y		; B6 82
	ldx $D0.b,Y		; B6 D0
	cop $DA.b		; 02 DA
	brk $5B.b		; 00 5B
	rti		; 40

	phd		; 0B
	pla		; 68
	tsb $B6.b		; 04 B6
	bra  75.b		; 80 4B
	ldy $0B40.w,X		; BC 40 0B
	cmp ($40.b),Y		; D1 40
	lda $0B15.w,X		; BD 15 0B
	.db $62, $A1, $6C		; 62 A1 6C
	mvn $8A,$2D		; 54 2D 8A
	lda $B1.b		; A5 B1
	mvn $2A,$B6		; 54 B6 2A
	ldy #$13.b		; A0 13
	lda $9600.w		; AD 00 96
	bne  14.b		; D0 0E
	lda [$80.b],Y		; B7 80
	stx $F4.b,Y		; 96 F4
	ora #$406F.w		; 09 6F 40
	sta $047A.w,X		; 9D 7A 04
	xba		; EB
	rts		; 60

	ora ($DB.b)		; 12 DB
	brk $BD.b		; 00 BD
	and $DE.b		; 25 DE
	.db $42, $5D		; 42 5D
.ACCU 16
.INDEX 16
	rep #$75		; C2 75
	lda [$82.b],Y		; B7 82
	eor $3AE1.w,X		; 5D E1 3A
	stp		; DB
	ora ($5B.b)		; 12 5B
	ply		; 7A
	and ($AD.b,S),Y		; 33 AD
	lda ($65.b),Y		; B1 65
	lda [$A2.b],Y		; B7 A2
	and $E420.w,Y		; 39 20 E4
	sta $92.b,S		; 83 92
	asl $3948.w		; 0E 48 39
	jsr $80AA.w		; 20 AA 80
	tax		; AA
	bra -86.b		; 80 AA
	sta $806A.w,Y		; 99 6A 80
	asl A		; 0A
	tya		; 98
	ror $E5.b		; 66 E5
	eor $50.b		; 45 50
	stz $CA64.w		; 9C 64 CA
	brk $4E.b		; 00 4E
	ldy #$B404.w		; A0 04 B4
	cop $75.b		; 02 75
	ldy #$DA12.w		; A0 12 DA
	ora ($2E.b,X)		; 01 2E
	mvn $EF,$16		; 54 16 EF
	ora $BB.b,X		; 15 BB
	cmp $6D.b		; C5 6D
	lda $B615.w,X		; BD 15 B6
	cmp ($5B.b,X)		; C1 5B
	jmp ($B755.w)		; 6C 55 B7
	ldx #$B1AD.w		; A2 AD B1
	cpy $5400.w		; CC 00 54
	brk $54.b		; 00 54
	brk $53.b		; 00 53
	and $4C.b		; 25 4C
	sta $32.b,X		; 95 32
	mvn $8A,$00		; 54 00 8A
	brk $42.b		; 00 42
	eor $4BE0.w,X		; 5D E0 4B
	adc $6CEB40.l		; 6F 40 EB 6C
	cop $EF.b		; 02 EF
	cop $5D.b		; 02 5D
	rep #$4B		; C2 4B
	adc $DBBA13.l		; 6F 13 BA DB
	and [$5D.b]		; 27 5D
	plx		; FA
	phk		; 4B
	eor ($93.b,X)		; 41 93
	lda $D719.w		; AD 19 D7
	ror $75.b,X		; 76 75
	iny		; C8
	ply		; 7A
	cpx $F5.b		; E4 F5
	cmp $E877A1.l,X		; DF A1 77 E8
	asl $F4.b,X		; 16 F4
	bra  94.b		; 80 5E
	dey		; 88
	ora ($E4.b)		; 12 E4
.ACCU 16
	rep #$E4		; C2 E4
.ACCU 16
	rep #$E4		; C2 E4
.ACCU 16
	rep #$E4		; C2 E4
	dec $75.b		; C6 75
	lda [$96.b],Y		; B7 96
	eor $CBE2.w,X		; 5D E2 CB
	adc $6CEB45.l		; 6F 45 EB 6C
	mvn $A2,$C6		; 54 C6 A2
	ldy #$544E.w		; A0 4E 54
	sta ($D5.b)		; 92 D5
	eor #$566D.w		; 49 6D 56
	adc $BC.b,X		; 75 BC
	lda ($AD.b,S),Y		; B3 AD
	inx		; E8
	ora ($75.b)		; 12 75
	ldx $4E.b,Y		; B6 4E
	lda $711D.w,Y		; B9 1D 71
	lsr $7780.w		; 4E 80 77
	pha		; 48
	ora ($60.b,X)		; 01 60
	ora ($28.b,X)		; 01 28
	ora ($3A.b,X)		; 01 3A
	sbc $BD2D00.l		; EF 00 2D BD
	brk $BB.b		; 00 BB
	cpy #$F02E.w		; C0 2E F0
	phd		; 0B
	adc $B12D40.l		; 6F 40 2D B1
	eor ($DB.b)		; 52 DB
	ora $6D.b,X		; 15 6D
	sbc $54.b		; E5 54
	cmp $34.b,S		; C3 34
	dex		; CA
	eor ($36.b,S),Y		; 53 36
	tad		; 5B
	rti		; 40

	and $B4.b		; 25 B4
	ora $AD.b,S		; 03 AD
	ldy #$7017.w		; A0 17 70
	and $DC.b		; 25 DC
	and [$5D.b]		; 27 5D
.INDEX 16
	rep #$5C		; C2 5C
	.db $82, $75, $CA		; 82 75 CA
	bra -83.b		; 80 AD
	inx		; E8
	rol A		; 2A
	cld		; D8
	rol A		; 2A
	ldx $0A.b,Y		; B6 0A
	ldy $981C.w		; AC 1C 98
	and $CA31.w,Y		; 39 31 CA
	trb $25C3.w		; 1C C3 25
	jmp $CA94.w		; 4C 94 CA
	jmp $CAA4.w		; 4C A4 CA
	jmp $7576.w		; 4C 76 75
	ldy $09.b,X		; B4 09
	adc [$02.b],Y		; 77 02
	eor $75C2.w,X		; 5D C2 75
	jmp.w [$C825]		; DC 25 C8
	and [$5C.b]		; 27 5C
	sta $AE.b,S		; 83 AE
	eor [$17.b]		; 47 17
	rol $5E.b		; 26 5E
	txa		; 8A
	lda ($C5.b)		; B2 C5
	eor $2BD6.w,Y		; 59 D6 2B
	dec A		; 3A
	cld		; D8
	ldy $95B7.w		; AC B7 95
	stx $D8.b,Y		; 96 D8
	ldy $C5B6.w		; AC B6 C5
	sta $566D.w,X		; 9D 6D 56
	eor $8CFB.w,X		; 5D FB 8C
	txy		; 9B
	rts		; 60

	ora ($6C.b,X)		; 01 6C
	brk $2D.b		; 00 2D
	bra   5.b		; 80 05
	ldx $4D.b		; A6 4D
	sbc $26.b,S		; E3 26
	cpy #$E854.w		; C0 54 E8
	rol A		; 2A
	ldx $2F.b		; A6 2F
	bit $00.b		; 24 00
	sta $047A.w,X		; 9D 7A 04
	xba		; EB
	clv		; B8
	phk		; 4B
	lda $E05D07.l,X		; BF 07 5D E0
	eor $18FA.w,X		; 5D FA 18
	eor [$0C.b]		; 47 0C
	tay		; A8
	stz $C3.b		; 64 C3
	rol $43.b		; 26 43
	rol $71.b		; 26 71
	bit #$0940.w		; 89 40 09
	dec A		; 3A
	sta ($3A.b,X)		; 81 3A
	stp		; DB
	and $C9.b		; 25 C9
	sta [$23.b],Y		; 97 23
	lda $DF.b		; A5 DF
	ldy $2D.b		; A4 2D
	lda ($00.b)		; B2 00
	eor #$2700.w		; 49 00 27
	adc $5C20.w		; 6D 20 5C
	stx $C985.w		; 8E 85 C9
.ACCU 8
	sep #$E5		; E2 E5
	ora ($75.b)		; 12 75
	jmp.w [$5B27]		; DC 27 5B
	adc $DE25.w,Y		; 79 25 DE
	rol $54.b		; 26 54
	and ($B8.b)		; 32 B8
	dex		; CA
	ldx $4C.b		; A6 4C
	ldx $4C.b		; A6 4C
	ldy #$EA04.w		; A0 04 EA
	bra  75.b		; 80 4B
	eor $09.b,X		; 55 09
	adc ($20.b)		; 72 20
	ora $BD.b		; 05 BD
	brk $96.b		; 00 96
	cpy #$B624.w		; C0 24 B6
	ora ($2D.b,X)		; 01 2D
	sta ($3A.b,X)		; 81 3A
	stp		; DB
	ora $AD.b,S		; 03 AD
	lda $7709.w,X		; BD 09 77
	sty $EB.b		; 84 EB
	sta [$01.b],Y		; 97 01
	tyx		; BB
	ldy #$78DB.w		; A0 DB 78
	asl $DB.b,X		; 16 DB
	ora ($6F.b,X)		; 01 6F
	rti		; 40

	lsr $C0.b,X		; 56 C0
	ora $90.b,X		; 15 90
	ora $60.b		; 05 60
	asl $0A60.w		; 0E 60 0A
	tay		; A8
	asl A		; 0A
	ldy #$A00A.w		; A0 0A A0
	asl A		; 0A
	bra  10.b		; 80 0A
	bra  10.b		; 80 0A
	stz $A6.b		; 64 A6
	adc [$5B.b],Y		; 77 5B
	rti		; 40

	rol $17E0.w		; 2E E0 17
	bvs  37.b		; 70 25
	jmp.w [$7709]		; DC 09 77
	cop $5D.b		; 02 5D
.ACCU 16
.INDEX 16
	rep #$75		; C2 75
	jmp.w [$CA25]		; DC 25 CA
	txa		; 8A
	lda $AAE8.w		; AD E8 AA
	cld		; D8
	cpx $D8.b		; E4 D8
	cpx $D8.b		; E4 D8
	cpx $F4.b		; E4 F4
	adc ($63.b)		; 72 63
	sta $1C.b,X		; 95 1C
	cpy #$CA09.w		; C0 09 CA
	ora ($2A.b,X)		; 01 2A
	brk $4A.b		; 00 4A
	bra  78.b		; 80 4E
	tay		; A8
	tsb $B4.b		; 04 B4
	brk $EB.b		; 00 EB
	rti		; 40

	phd		; 0B
	pla		; 68
	ora ($72.b,X)		; 01 72
	stz $B9.b		; 64 B9
	and $F5D6.w,X		; 3D D6 F5
	cmp #$72E9.w		; C9 E9 72
	dec A		; 3A
	and [$22.b],Y		; 37 22
	and $95DF.w		; 2D DF 95
	tyx		; BB
	cmp $6D.b		; C5 6D
	lda $E515.w,X		; BD 15 E5
	ora ($91.b,X)		; 01 91
	rti		; 40

	.db $62, $82, $CE		; 62 82 CE
	eor ($59.b),Y		; 51 59
	jmp $995C99.l		; 5C 99 5C 99
	jmp $4DAE9E.l		; 5C 9E AE 4D
	iny		; C8
	txa		; 8A
	ldx $D8.b,Y		; B6 D8
	plb		; AB
	adc $605B41.l		; 6F 41 5B 60
	pld		; 2B
	jmp ($6D05.w)		; 6C 05 6D
	ora $5B.b		; 05 5B
	eor ($59.b,X)		; 41 59
	pla		; 68
	pld		; 2B
	ora [$AD.b],Y		; 17 AD
	bcs  91.b		; B0 5B
	clv		; B8
	and ($EE.b)		; 32 EE
	tsb $F0B6.w		; 0C B6 F0
	lsr $F4B6.w		; 4E B6 F4
	sta ($E5.b)		; 92 E5
	adc $C9.b,X		; 75 C9
	xba		; EB
	sta ($D0.b,S),Y		; 93 D0
	ora #$D0D6.w		; 09 D6 D0
	dec A		; 3A
	stp		; DB
	cpy $97.b		; C4 97
	adc $DB3A.w,Y		; 79 3A DB
	cmp ($EB.b),Y		; D1 EB
	adc $14BD40.l		; 6F 40 BD 14
	ora #$0114.w		; 09 14 01
	bvc   3.b		; 50 03
	lda $93.b,S		; A3 93
	trb $15B0.w		; 1C B0 15
	rti		; 40

	ora $40.b,X		; 15 40
	eor $42.b,X		; 55 42
	adc $BC.b,X		; 75 BC
	lda ($AE.b,S),Y		; B3 AE
	sbc ($75.b)		; F2 75
	iny		; C8
	txa		; 8A
	stz $A9.b		; 64 A9
	sta ($A6.b)		; 92 A6
	lsr A		; 4A
	adc $26.b		; 65 26
	asl A		; 0A
	bmi -55.b		; 30 C9
	stz $CA64.w		; 9C 64 CA
	phk		; 4B
	sta ($27.b),Y		; 91 27
	jmp $472E89.l		; 5C 89 2E 47
	lsr $11B9.w		; 4E B9 11
	lda $1B1D.w,Y		; B9 1D 1B
	lda $FD2E49.l,X		; BF 49 2E FD
	dec A		; 3A
	inc $0E.b		; E6 0E
	pha		; 48
	and $9223.w,Y		; 39 23 92
	asl $3948.w		; 0E 48 39
	and ($7A.b,X)		; 21 7A
	plp		; 28
	asl $C5.b,X		; 16 C5
	cop $F4.b		; 02 F4
	eor ($36.b,S),Y		; 53 36
	ora $C950.w,Y		; 19 50 C9
	stz $4E00.w		; 9C 00 4E
	ldy #$5A07.w		; A0 07 5A
	ora ($75.b)		; 12 75
	ldy $92.b,X		; B4 92
	cpx $4E.b		; E4 4E
	lda $EF32.w,Y		; B9 32 EF
	bne -71.b		; D0 B9
	bpl 110.b		; 10 6E
	mvp $BF,$1B		; 44 1B BF
	phd		; 0B
	adc $2DE8.w		; 6D E8 2D
	inx		; E8
	cop $D8.b		; 02 D8
	asl A		; 0A
	ldy $B102.w,X		; BC 02 B1
	adc $DF.b		; 65 DF
	sta $78D7.w,Y		; 99 D7 78
	wai		; CB
	sta ($1E.b),Y		; 91 1E
	tyx		; BB
	pea $446E.w		; F4 6E 44
	and $DF.b		; 25 DF
	lda ($2E.b,X)		; A1 2E
	beq 122.b		; F0 7A
	sbc $480E16.l		; EF 16 0E 48
	and $9223.w,Y		; 39 23 92
	asl $724C.w		; 0E 4C 72
	lda $93.b,S		; A3 93
	cmp $56.b,X		; D5 56
	phk		; 4B
	eor $9D.b,X		; 55 9D
	adc $DE25.w		; 6D 25 DE
	ora ($AE.b,S),Y		; 13 AE
	sbc ($2E.b,X)		; E1 2E
	rti		; 40

	sbc $DF.b,X		; F5 DF
	stx $E4.b		; 86 E4
	eor ($B9.b,X)		; 41 B9
	bpl 110.b		; 10 6E
	sbc $EF16.w,X		; FD 16 EF
	ora $15.b,X		; 15 15
	and $AA.b		; 25 AA
	ldy $56B5.w		; AC B5 56
	adc $AA.b,X		; 75 AA
	lda ($DA.b)		; B2 DA
	ldy $6AEB.w		; AC EB 6A
	dec $ACBB.w		; CE BB AC
	lda $2E0B.w,Y		; B9 0B 2E
	eor $600940.l		; 4F 40 09 60
	ora ($DD.b,X)		; 01 DD
	brk $65.b		; 00 65
	bra  51.b		; 80 33
	ldy $3A09.w		; AC 09 3A
	cmp $DE25.w,Y		; D9 25 DE
	adc [$5B.b],Y		; 77 5B
	ply		; 7A
	rol $DE.b,X		; 36 DE
	sta ($3A.b),Y		; 91 3A
	stp		; DB
	cmp ($6D.b),Y		; D1 6D
	lda $B615.w,X		; BD 15 B6
	cmp $5B.b		; C5 5B
	adc $BD55.w,Y		; 79 55 BD
	bpl  85.b		; 10 55
	brk $50.b		; 00 50
	ora $50.b		; 05 50
	ora $62.b		; 05 62
	ldy $55EB.w		; AC EB 55
	adc $B5.b		; 65 B5
	lsr $5B.b,X		; 56 5B
	eor $9D.b,X		; 55 9D
	adc $5D56.w		; 6D 56 5D
	cmp $442E.w,Y		; D9 2E 44
	xba		; EB
	sta ($D7.b,S),Y		; 93 D7
	pld		; 2B
	tsx		; BA
	sbc $74E4D2.l		; EF D2 E4 74
	ror $12FD.w		; 6E FD 12
	sbc $F2B614.l		; EF 14 B6 F2
	lda $E8.b		; A5 E8
	tay		; A8
	cld		; D8
	cpx $DE.b		; E4 DE
	txa		; 8A
	tay		; A8
	asl A		; 0A
	tay		; A8
	asl A		; 0A
	tay		; A8
	sbc $0E.b		; E5 0E
	pha		; 48
	sbc $0E.b		; E5 0E
	pha		; 48
	rol A		; 2A
	ldy #$802A.w		; A0 2A 80
	rol $52.b		; 26 52
	adc ($E4.b,X)		; 61 E4
	lda $EB04.w,Y		; B9 04 EB
	bcc  75.b		; 90 4B
	sta ($4B.b)		; 92 4B
	sta ($4B.b)		; 92 4B
	sta ($2E.b,S),Y		; 93 2E
	jmp $2397.w		; 4C 97 23
	ldy $EB.b		; A4 EB
	adc $233946.l		; 6F 46 39 23
	sty $39.b,X		; 94 39
	eor $94.b,S		; 43 94
	and $E420.w,Y		; 39 20 E4
	sta $92.b,S		; 83 92
	asl A		; 0A
	lda #$6D97.w		; A9 97 6D
	brk $96.b		; 00 96
	bne   9.b		; D0 09
	adc $9600.w		; 6D 00 96
	bne   9.b		; D0 09
	adc $3A00.w		; 6D 00 3A
	bne   2.b		; D0 02
	pha		; 48
	adc $DB.b		; 65 DB
	.db $62, $AD, $B1		; 62 AD B1
	eor $BD.b,X		; 55 BD
	ora $5B.b,X		; 15 5B
	trb $1C9B.w		; 1C 9B 1C
	stz $981C.w,X		; 9E 1C 98
	and $9E23.w,Y		; 39 23 9E
	phy		; 5A
	tax		; AA
	ora $0255.w,X		; 1D 55 02
	eor $00.b,X		; 55 00
	stz $04A0.w		; 9C A0 04
	eor ($25.b,S),Y		; 53 25
	and ($2B.b),Y		; 31 2B
	eor $93.b		; 45 93
	ldx $D725.w		; AE 25 D7
	rol $4E.b		; 26 4E
	ldx $F4.b,Y		; B6 F4
	rti		; 40

	ora $40.b,X		; 15 40
	ora $40.b,X		; 15 40
	ora $5B.b,X		; 15 5B
	sta ($1E.b,S),Y		; 93 1E
	xba		; EB
	ldy $BB64.w,X		; BC 64 BB
	pea $B90E.w		; F4 0E B9
	ora ($3A.b,X)		; 01 3A
	inc $2501.w		; EE 01 25
	ldy #$23AB.w		; A0 AB 23
	stz $1603.w		; 9C 03 16
	lsr $C9B6.w		; 4E B6 C9
	cmp [$17.b],Y		; D7 17
	xba		; EB
	ply		; 7A
	pha		; 48
	ora ($28.b)		; 12 28
	cop $A8.b		; 02 A8
	ora $2E8E5C.l		; 0F 5C 8E 2E
	sbc $DB02.w,X		; FD 02 DB
	jsr $A017.w		; 20 17 A0
	ora $20.b,S		; 03 20
	cop $80.b		; 02 80
	asl A		; 0A
	bra  57.b		; 80 39
	inc $36.b		; E6 36
	tax		; AA
	brk $AA.b		; 00 AA
	sty $55.b		; 84 55
	eor $95.b,S		; 43 95
	rti		; 40

	txa		; 8A
	sta $A8B3.w,Y		; 99 B3 A8
	ora ($AD.b,S),Y		; 13 AD
	ldy $9D.b		; A4 9D
	adc [$9D.b],Y		; 77 9D
	adc ($7A.b)		; 72 7A
	sbc $BE5CD2.l		; EF D2 5C BE
	lda $AE53.w,Y		; B9 53 AE
	pld		; 2B
	bit $6E.b		; 24 6E
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	dec $3A59.w,X		; DE 59 3A
	pea $AE93.w		; F4 93 AE
	and ($DD.b),Y		; 31 DD
	and [$54.b],Y		; 37 54
	sta ($59.b),Y		; 91 59
	dec $D9.b,X		; D6 D9
	and [$5D.b]		; 27 5D
	plx		; FA
.ACCU 8
.INDEX 8
	sep #$3D		; E2 3D
	adc $49AF48.l		; 6F 48 AF 49
	ora $22.b,X		; 15 22
	ldy #$17.b		; A0 17
	and [$A5.b]		; 27 A5
	cmp $D25BA0.l,X		; DF A0 5B D2
	ora ($D2.b,X)		; 01 D2
	brk $30.b		; 00 30
	brk $50.b		; 00 50
	ora ($50.b,X)		; 01 50
	trb $0242.w		; 1C 42 02
	ldy $5905.w		; AC 05 59
	cpy #$AB.b		; C0 AB
	pld		; 2B
	sta ($2B.b,S),Y		; 93 2B
	sta ($39.b,S),Y		; 93 39
	cmp #$23.b		; C9 23
	sta ($0A.b)		; 92 0A
	bra  23.b		; 80 17
	jsl $92C82D.l		; 22 2D C8 92
	jmp $54AE6F.l		; 5C 6F AE 54
	xba		; EB
	adc $854C48.l		; 6F 48 4C 85
	eor $DED6.w,Y		; 59 D6 DE
	xba		; EB
	sta ($0B.b),Y		; 91 0B
	sta ($C1.b),Y		; 91 C1
	adc [$E8.b],Y		; 77 E8
	asl $DE.b,X		; 16 DE
	bra 116.b		; 80 74
	rti		; 40

	php		; 08
	ldy #$0E.b		; A0 0E
	adc [$5B.b]		; 67 5B
	.db $62, $B2, $DB		; 62 B2 DB
	cmp ($65.b),Y		; D1 65
	dec $7532.w,X		; DE 32 75
	lda [$A7.b],Y		; B7 A7
	ora ($E4.b)		; 12 E4
	lda $64F95D.l		; AF 5D F9 64
	inc $5691.w		; EE 91 56
	eor $5E.b		; 45 5E
	lda $B90C.w,Y		; B9 0C B9
	and ($AE.b,S),Y		; 33 AE
	eor $93C975.l,X		; 5F 75 C9 93
	lda $01B2.w		; AD B2 01
	and $0E50.w		; 2D 50 0E
	tax		; AA
	sta ($25.b,X)		; 81 25
	lda $2415.w,X		; BD 15 24
	eor $08.b,X		; 55 08
	tax		; AA
	sta ($A2.b,S),Y		; 93 A2
	cmp #$3A.b		; C9 3A
	pea $719D.w		; F4 9D 71
	lsr $6FEB.w,X		; 5E EB 6F
	eor #$00.b		; 49 00
	eor $2529.w,Y		; 59 29 25
	iny		; C8
	sta $0E71.w,X		; 9D 71 0E
	lda $2D3D.w,Y		; B9 3D 2D
	inx		; E8
	ora ($24.b,X)		; 01 24
	and ($96.b,S),Y		; 33 96
	sbc [$49.b]		; E7 49
	dec A		; 3A
	dec $4B80.w,X		; DE 80 4B
	jsr $A004.w		; 20 04 A0
	cop $F0.b		; 02 F0
	cop $A8.b		; 02 A8
	sec		; 38
	sta $55B1.w		; 8D B1 55
	ldx $F2.b,Y		; B6 F2
	lda $45DE.w		; AD DE 45
	lda $251D.w,Y		; B9 1D 25
	dex		; CA
	sbc #$3A.b		; E9 3A
	cpx $2C.b		; E4 2C
	sta $556D.w,X		; 9D 6D 55
	stz $8A.b		; 64 8A
	bra  10.b		; 80 0A
	stz $A6.b		; 64 A6
	jmp $9200.w		; 4C 00 92
	stz $DF.b,X		; 74 DF
	ldx $D327.w		; AE 27 D3
	bmi -59.b		; 30 C5
	and ($95.b,X)		; 21 95
	bne -55.b		; D0 C9
	lda $0E00.w,X		; BD 00 0E
	stx $4C.b		; 86 4C
	and ($39.b),Y		; 31 39
	dec $45.b,X		; D6 45
	and ($54.b)		; 32 54
	cmp #$50.b		; C9 50
	ora ($50.b,X)		; 01 50
	ora ($50.b,X)		; 01 50
	ora ($53.b,X)		; 01 53
	and $4C.b		; 25 4C
	lda $54.b,X		; B5 54
	ora $54.b		; 05 54
	ora $54.b		; 05 54
	ora $54.b		; 05 54
	ora $54.b		; 05 54
	ora $50.b		; 05 50
	ora $4C.b		; 05 4C
	eor $CA.b		; 45 CA
	trb $7290.w		; 1C 90 72
	rti		; 40

	eor $00.b,X		; 55 00
	eor $30.b,X		; 55 30
	sta ($55.b,X)		; 81 55
	ora ($55.b,X)		; 01 55
	brk $55.b		; 00 55
	bmi -83.b		; 30 AD
	cpy $01.b		; C4 01
	mvn $30,$01		; 54 01 30
	lda $C7C6.w		; AD C6 C7
	plp		; 28
	ora $53.b		; 05 53
	trb $A171.w		; 1C 71 A1
	eor ($0A.b,S),Y		; 53 0A
	trb $C1.b		; 14 C1
	asl A		; 0A
	eor #$77.b		; 49 77
	brk $9B.b		; 00 9B
	bra  42.b		; 80 2A
	bra  42.b		; 80 2A
	bra  42.b		; 80 2A
	bra  10.b		; 80 0A
	sta $652A.w,Y		; 99 2A 65
	sbc [$4D.b],Y		; F7 4D
	dec $38.b,X		; D6 38
	stz $2A.b		; 64 2A
	ldy #$80.b		; A0 80
	rol A		; 2A
	sta $84.b,S		; 83 84
	cpy #$A9.b		; C0 A9
	dey		; 88
	sec		; 38
	iny		; C8
	and #$92.b		; 29 92
	tya		; 98
	lsr A		; 4A
	tax		; AA
	bra -86.b		; 80 AA
	bra -86.b		; 80 AA
	bra  42.b		; 80 2A
	bra  10.b		; 80 0A
	sta $622A.w,Y		; 99 2A 62
	ror $0E11.w		; 6E 11 0E
	pha		; 48
	rol A		; 2A
	adc $0A.b,S		; 63 0A
	sta $92.b,S		; 83 92
	asl A		; 0A
	tay		; A8
	cop $99.b		; 02 99
	eor #$94.b		; 49 94
	tya		; 98
	phx		; DA
	lda $8F.b,S		; A3 8F
	asl A		; 0A
	tay		; A8
	cop $98.b		; 02 98
	cpy $DD.b		; C4 DD
	eor ($CA.b,X)		; 41 CA
	trb $72B0.w		; 1C B0 72
	rti		; 40

	eor $40.b,X		; 55 40
	eor $40.b,X		; 55 40
	ora $4C.b		; 05 4C
	sbc $51.b,X		; F5 51
.ACCU 16
.INDEX 16
	rep #$70		; C2 70
	ora ($12.b,S),Y		; 13 12
	adc ($21.b),Y		; 71 21
	eor $01.b,X		; 55 01
	bmi -75.b		; 30 B5
	eor $01.b,X		; 55 01
	eor $00.b,X		; 55 00
	eor $00.b,X		; 55 00
	ora $32.b,X		; 15 32
	sta ($1B.b,S),Y		; 93 1B
	mvn $55,$00		; 54 00 55
	rti		; 40

	adc ($B0.b),Y		; 71 B0
	adc ($4C.b)		; 72 4C
	eor $7240.w,X		; 5D 40 72
	eor [$12.b]		; 47 12
	trb $5590.w		; 1C 90 55
	bmi -117.b		; 30 8B
	sbc ($0C.b)		; F2 0C
	sta $FF01F0.l,X		; 9F F0 01 FF
	and ($7F.b)		; 32 7F
	cpy $F39F.w		; CC 9F F3
	and [$FC.b]		; 27 FC
	cmp #$32FF.w		; C9 FF 32
	sbc $551063.l,X		; FF 63 10 55
	rti		; 40

	eor ($25.b,S),Y		; 53 25
	jmp $3295.w		; 4C 95 32
	mvn $FF,$C5		; 54 C5 FF
	cpy $F39F.w		; CC 9F F3
	and [$FC.b]		; 27 FC
	cmp #$32FF.w		; C9 FF 32
	adc $F39FCC.l,X		; 7F CC 9F F3
	and [$FC.b]		; 27 FC
	wai		; CB
	sbc $F7CC.w,X		; FD CC F7
	bit $3F.b		; 24 3F
	bvs   5.b		; 70 05
	and ($5C.b)		; 32 5C
	bcc  -3.b		; 90 FD
	cpy $F243.w		; CC 43 F2
	ora $FC.b,S		; 03 FC
	ora $55FCF3.l		; 0F F3 FC 55
	eor $5310C8.l		; 4F C8 10 53
	jsr ($17FF.w,X)		; FC FF 17
	sbc $203F.w,X		; FD 3F 20
	jmp $4C23.w		; 4C 23 4C
	adc #$3F31.w		; 69 31 3F
	dex		; CA
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	sbc $00.b,X		; F5 00
	sbc $F50F50.l,X		; FF 50 0F F5
	brk $FF.b		; 00 FF
	bvc  15.b		; 50 0F
	sbc $32.b,X		; F5 32
	jsr ($95C4.w,X)		; FC C4 95
	bmi -41.b		; 30 D7
	inc $00.b,X		; F6 00
	and $F49FCC.l,X		; 3F CC 9F F4
	brk $FF.b		; 00 FF
	rti		; 40

	ora $FF00F4.l		; 0F F4 00 FF
	rti		; 40

	ora $FDCBD8.l		; 0F D8 CB FD
	cpy $F0AF.w		; CC AF F0
	ora $FF.b,X		; 15 FF
	eor ($0F.b,X)		; 41 0F
	sbc $10.b,X		; F5 10
	sbc $F50F51.l,X		; FF 51 0F F5
	and $DF4C71.l,X		; 3F 71 4C DF
	dex		; CA
	and $FF3CC0.l,X		; 3F C0 3C FF
	eor $F3.b,X		; 55 F3
	sbc ($8F.b)		; F2 8F
	sbc $3F.b,X		; F5 3F
	cmp $3F5FF5.l		; CF F5 5F 3F
	pei ($3C.b)		; D4 3C
	cpy $FC.b		; C4 FC
	dex		; CA
	pea $50CA.w		; F4 CA 50
	ora $D4.b,S		; 03 D4
	brk $F4.b		; 00 F4
	cmp #$31F5.w		; C9 F5 31
	eor $FC27F3.l		; 4F F3 27 FC
	cmp #$50FF.w		; C9 FF 50
	ora $FF00F5.l		; 0F F5 00 FF
	bvc  15.b		; 50 0F
	sbc $00.b,X		; F5 00
	sbc $FC3753.l,X		; FF 53 37 FC
	ora $3CF00F.l		; 0F 0F F0 3C
	and $3FF0D4.l,X		; 3F D4 F0 3F
	cmp $DF3FF0.l,X		; DF F0 3F DF
	beq  15.b		; F0 0F
	cld		; D8
	brk $FD.b		; 00 FD
	sty $32CF.w		; 8C CF 32
	ldy $F5CA.w,X		; BC CA F5
	and ($54.b)		; 32 54
	cmp #$0150.w		; C9 50 01
	jmp $3195.w		; 4C 95 31
	adc $FF00D8.l		; 6F D8 00 FF
	and ($7F.b)		; 32 7F
	bne   3.b		; D0 03
	inc $00.b,X		; F6 00
	and $FD03D0.l,X		; 3F D0 03 FD
	brk $3F.b		; 00 3F
	adc $2F.b,S		; 63 2F
	sbc [$33.b],Y		; F7 33
	jmp.w [$FD90]		; DC 90 FD
	cpy #$2913.w		; C0 13 29
	cmp #$DC0F.w		; C9 0F DC
	cmp $BC.b		; C5 BC
	cmp $2F.b,S		; C3 2F
	and ($FF.b)		; 32 FF
	bit $0FFF.w		; 2C FF 0F
	beq  -1.b		; F0 FF
	eor $5FFFF4.l,X		; 5F F4 FF 5F
	pea $5FFF.w		; F4 FF 5F
	pea $5FFF.w		; F4 FF 5F
	sbc [$F2.b],Y		; F7 F2
	cpy $00BF.w		; CC BF 00
	and $54AFCC.l,X		; 3F CC AF 54
	ora $D3.b,S		; 03 D3
	and #$9332.w		; 29 32 93
	pld		; 2B
	cpy $CF4B.w		; CC 4B CF
	iny		; C8
	ora $CF.b,S		; 03 CF
	bit $175F.w,X		; 3C 5F 17
	cmp ($04.b),Y		; D1 04
	eor ($04.b,X)		; 41 04
.ACCU 16
	rep #$E4		; C2 E4
	dex		; CA
	jmp $C6A4.w		; 4C A4 C6
	sty $C9.b,X		; 94 C9
	eor ($0E.b,S),Y		; 53 0E
	mvn $72,$C9		; 54 C9 72
	jmp $5037.w		; 4C 37 50
	bpl  21.b		; 10 15
	eor ($0C.b,S),Y		; 53 0C
	cmp ($04.b,S),Y		; D3 04
	sta $32.b		; 85 32
	mvn $A4,$C3		; 54 C3 A4
	dex		; CA
	jmp $4033.w		; 4C 33 40
	trb $72.b		; 14 72
	jmp $5338.w		; 4C 38 53
	and $4C.b		; 25 4C
	and [$53.b],Y		; 37 53
	and $4C.b		; 25 4C
	sec		; 38
	jmp $24A7.w		; 4C A7 24
	cmp $85.b,S		; C3 85
	tsb $72.b		; 04 72
	sty $4C33.w		; 8C 33 4C
	lda $4C.b		; A5 4C
	rol $0D.b,X		; 36 0D
	jsr $4542.w		; 20 42 45
	brk $54.b		; 00 54
	ldy #$A002.w		; A0 02 A0
	lsr $15.b,X		; 56 15
	brk $15.b		; 00 15
	mvn $01,$55		; 54 55 01
	sbc [$5E.b],Y		; F7 5E
	lda $4A35.w		; AD 35 4A
	adc $2BEA.w,X		; 7D EA 2B
	nop		; EA
	adc $5F295F.l,X		; 7F 5F 29 5F
	adc $2BFF.w,X		; 7D FF 2B
	sbc $2FDF7F.l,X		; FF 7F DF 2F
	cmp $03DF17.l,X		; DF 17 DF 03
	adc $3B03.w,X		; 7D 03 3B
	ora $F9.b,S		; 03 F9
	cop $B7.b		; 02 B7
	cop $76.b		; 02 76
	cop $1F.b		; 02 1F
	and $7F2EDF.l,X		; 3F DF 2E 7F
	asl $121F.w,X		; 1E 1F 12
	lda $019C01.l,X		; BF 01 9C 01
	adc $5701.w,Y		; 79 01 57
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0050.w		; E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $000E.w		; 0C 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($3D.b)		; 12 3D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b]		; 07 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b]		; 07 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b]		; 07 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	adc $080000.l		; 6F 00 00 08
	clc		; 18
	ora $7EFF3F.l,X		; 1F 3F FF 7E
	brk $00.b		; 00 00
	php		; 08
	clc		; 18
	ora $7EFF3F.l,X		; 1F 3F FF 7E
	brk $00.b		; 00 00
	php		; 08
	clc		; 18
	ora $7EFF3F.l,X		; 1F 3F FF 7E
	brk $00.b		; 00 00
	rol $2F.b,X		; 36 2F
	adc $FF5F.w,Y		; 79 5F FF
	adc $0000.w,X		; 7D 00 00
	ora $7FFF7F.l		; 0F 7F FF 7F
	cpy #$0000.w		; C0 00 00
	brk $0F.b		; 00 0F
	adc $C07FFF.l,X		; 7F FF 7F C0
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	adc $C07FFF.l,X		; 7F FF 7F C0
	brk $00.b		; 00 00
	ora $77.b,S		; 03 77
	adc $BC7FFF.l,X		; 7F FF 7F BC
	rti		; 40

	ora $7FFF7F.l		; 0F 7F FF 7F
	sbc $0F0747.l,X		; FF 47 07 0F
	ora $7FFF7F.l		; 0F 7F FF 7F
	sbc $0F0747.l,X		; FF 47 07 0F
	ora $7FFF7F.l		; 0F 7F FF 7F
	sbc $0F0747.l,X		; FF 47 07 0F
	adc [$3F.b],Y		; 77 3F
	sbc $3FFF7F.l,X		; FF 7F FF 3F
	ora $000017.l		; 0F 17 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $FB.b		; 26 FB
	brk $22.b		; 00 22
	tsb $0005.w		; 0C 05 00
	ora ($08.b),Y		; 11 08
	mvp $25,$CB		; 44 CB 25
	jsr $4868.w		; 20 68 48
	ora ($42.b,S),Y		; 13 42
	dey		; 88
	sta $013A.w		; 8D 3A 01
	cop $92.b		; 02 92
	eor $B116.w		; 4D 16 B1
	cli		; 58
	eor $60.b,S		; 43 60
	inx		; E8
	and ($49.b,X)		; 21 49
	and $9A95.w		; 2D 95 9A
	ora ($5A.b,S),Y		; 13 5A
	sty $64.b		; 84 64
	cmp #$1206.w		; C9 06 12
	rtl		; 6B

	inc $49.b,X		; F6 49
	rol $92.b		; 26 92
	eor #$E590.w		; 49 90 E5
	eor ($50.b)		; 52 50
	eor ($CA.b,S),Y		; 53 CA
	ora ($A4.b),Y		; 11 A4
	cmp #$F368.w		; C9 68 F3
	eor $3395.w		; 4D 95 33
	phk		; 4B
	cpx $92.b		; E4 92
	cmp #$972D.w		; C9 2D 97
	dec $59D5.w		; CE D5 59
	ldy $9B.b		; A4 9B
	adc $49.b		; 65 49
	bit $9A.b		; 24 9A
	jmp ($74BF.w)		; 6C BF 74
	inc $92E9.w		; EE E9 92
	tax		; AA
	tax		; AA
	adc $A964.w,X		; 7D 64 A9
	sta ($E9.b)		; 92 E9
	bit $92.b		; 24 92
	cmp #$9624.w		; C9 24 96
	adc #$9225.w		; 69 25 92
	eor $962C.w,Y		; 59 2C 96
	phk		; 4B
	and [$9E.b]		; 27 9E
	cmp $92A5.w,Y		; D9 A5 92
	pha		; 48
	plb		; AB
	ldx $49B2.w		; AE B2 49
	stz $92.b		; 64 92
	eor #$9225.w		; 49 25 92
	stp		; DB
	bit $92.b		; 24 92
	eor #$92A4.w		; 49 A4 92
	eor #$B225.w		; 49 25 B2
	adc #$9224.w		; 69 24 92
	cmp #$9224.w		; C9 24 92
	eor #$C66C.w		; 49 6C C6
	sty $35.b		; 84 35
	mvn $F0,$21		; 54 21 F0
	dec $F710.w,X		; DE 10 F7
	pld		; 2B
	bcc -10.b		; 90 F6
	bit $84.b,X		; 34 84
	rol $09EE.w,X		; 3E EE 09
	asl $98CA.w		; 0E CA 98
	sta [$51.b]		; 87 51
	bvc  67.b		; 50 43
	plx		; FA
	sbc ($24.b),Y		; F1 24
	tsa		; 3B
	nop		; EA
	ldx #$D21E.w		; A2 1E D2
	and ($8B.b,X)		; 21 8B
	stx $43.b		; 86 43
	php		; 08
	tay		; A8
	lda $14C704.l		; AF 04 C7 14
	jsr ($0048.w,X)		; FC 48 00
	stx $26.b		; 86 26
	brk $55.b		; 00 55
	txa		; 8A
	brk $B8.b		; 00 B8
	sty $2A.b		; 84 2A
	cop $E2.b		; 02 E2
	cmp $C0.b,S		; C3 C0
	ora [$21.b],Y		; 17 21
	ora $A95C40.l		; 0F 40 5C A9
	asl $01.b,X		; 16 01
	adc ($28.b)		; 72 28
	clv		; B8
	tsb HDMATBL0L.w		; 0C 08 43
	cpx #$1618.w		; E0 18 16
	ora $08C180.l,X		; 1F 80 C1 08
	ldy $01.b		; A4 01
	.db $82, $A4, $80		; 82 A4 80
	ora $04.b,S		; 03 04
	eor ($94.b)		; 52 94
	asl $44.b		; 06 44
	iny		; C8
	jsr $3F32.w		; 20 32 3F
	and ($00.b,X)		; 21 00
	cmp #$600C.w		; C9 0C 60
	asl $4A.b		; 06 4A
	lda ($98.b)		; B2 98
	tsb $C5.b		; 04 C5
	trb $7A.b		; 14 7A
	sbc $F3.b,X		; F5 F3
	nop		; EA
	dex		; CA
	lsr A		; 4A
	ply		; 7A
	jmp ($DD62.w,X)		; 7C 62 DD
	and ($95.b,S),Y		; 33 95
	eor $05.b		; 45 05
	ora $88.b		; 05 88
	bit $2244.w		; 2C 44 22
	lsr $90.b		; 46 90
	cli		; 58
	inx		; E8
	lda ($9A.b),Y		; B1 9A
	adc $6B36.w		; 6D 36 6B
	and $69.b,X		; 35 69
	adc #$B4C0.w		; 69 C0 B4
	cpx #$705A.w		; E0 5A 70
	and $8C3D.w		; 2D 3D 8C
	cmp ($56.b,S),Y		; D3 56
	cpy $B2.b		; C4 B2
	cld		; D8
	stx $DC.b,Y		; 96 DC
	inc $E7.b		; E6 E7
	and [$39.b],Y		; 37 39
	lda $C6FE.w,Y		; B9 FE C6
	rtl		; 6B

	sta ($69.b,X)		; 81 69
	dec $D0.b		; C6 D0
	ror $73.b		; 66 73
	and $A7CB8D.l,X		; 3F 8D CB A7
	cmp #$8F47.w		; C9 47 8F
	and ($96.b,X)		; 21 96
	sbc [$B7.b]		; E7 B7
	and $05BA.w,Y		; 39 BA 05
	lda $B5E1.w,Y		; B9 E1 B5
	ror $8D49.w		; 6E 49 8D
	rol $43.b		; 26 43
	and ($22.b),Y		; 31 22
	eor ($82.b,X)		; 41 82
	lda ($99.b,S),Y		; B3 99
	eor $12.b		; 45 12
	pha		; 48
	php		; 08
	cmp ($48.b)		; D2 48
	ldy $21.b		; A4 21
	adc $56.b		; 65 56
	eor $9244.w		; 4D 44 92
	tsb $88.b		; 04 88
	tax		; AA
	lsr $8BAA.w		; 4E AA 8B
	sbc $4C.b		; E5 4C
	lda [$47.b],Y		; B7 47
	phx		; DA
	txa		; 8A
	php		; 08
	stz $5492.w		; 9C 92 54
	sbc ($3F.b),Y		; F1 3F
	adc $369A20.l		; 6F 20 9A 36
	brk $08.b		; 00 08
	cpx $A3.b		; E4 A3
	ora #$E41C.w		; 09 1C E4
	adc ($A3.b,X)		; 61 A3
	ldy #$1187.w		; A0 87 11
	mvp $9A,$70		; 44 70 9A
	plp		; 28
	ldx #$8A8B.w		; A2 8B 8A
	eor $14.b		; 45 14
	adc $F928.w,X		; 7D 28 F9
	bra  18.b		; 80 12
	ora ($12.b)		; 12 12
	trb $3952.w		; 1C 52 39
	txy		; 9B
	lda $4DDB.w,X		; BD DB 4D
	rol $D8.b,X		; 36 D8
	rol $ADBD.w		; 2E BD AD
	lda $000A.w		; AD 0A 00
	ror $0B.b		; 66 0B
.ACCU 16
	rep #$60		; C2 60
	sta ($02.b,X)		; 81 02
	tsb $73.b		; 04 73
	sbc $46E8.w,Y		; F9 E8 46
	dec $4F.b,X		; D6 4F
	eor $05.b		; 45 05
	adc ($C5.b,X)		; 61 C5
	ldy #$A843.w		; A0 43 A8
	sta $806525.l		; 8F 25 65 80
	ora ($82.b,X)		; 01 82
	and [$0B.b]		; 27 0B
	tad		; 5B
	ldy $BD9C.w		; AC 9C BD
	trb $90.b		; 14 90
	adc ($84.b,S),Y		; 73 84
	ora ($A7.b,S),Y		; 13 A7
	rtl		; 6B

	lda $98D2.w		; AD D2 98
	tsx		; BA
	cmp #$F000.w		; C9 00 F0
	asl $8280.w		; 0E 80 82
	dey		; 88
	sta $9C.b,S		; 83 9C
	and ($DF.b,X)		; 21 DF
	ldx $6F.b		; A6 6F
	tsb $4C.b		; 04 4C
	tsb $80.b		; 04 80
	sei		; 78
	asl $20.b		; 06 20
	bcs  45.b		; B0 2D
	lda [$D2.b],Y		; B7 D2
	ora [$C2.b],Y		; 17 C2
	inc $EC.b		; E6 EC
	and $C6FDCC.l,X		; 3F CC FD C6
	xba		; EB
	cmp $DC.b,X		; D5 DC
	beq  -8.b		; F0 F8
	jsr ($B37E.w,X)		; FC 7E B3
	bmi -22.b		; 30 EA
	cmp $D03367.l,X		; DF 67 33 D0
	sbc $1F5B.w,X		; FD 5B 1F
	ora ($D9.b,S),Y		; 13 D9
	sbc ($35.b),Y		; F1 35
	phx		; DA
	sbc $D58373.l,X		; FF 73 83 D5
	cmp $1F7A75.l,X		; DF 75 7A 1F
	lda $70DC95.l		; AF 95 DC 70
	sbc ($99.b,S),Y		; F3 99
	cmp [$D0.b]		; C7 D0
	dec A		; 3A
	stp		; DB
	asl $37BB.w		; 0E BB 37
	stz $FCFC.w		; 9C FC FC
	ldx $95CF.w		; AE CF 95
	cmp $79FD.w,Y		; D9 FD 79
	lda $072F.w		; AD 2F 07
	eor #$75E3.w		; 49 E3 75
	dec $7D37.w,X		; DE 37 7D
	sbc $42.b,S		; E3 42
	xba		; EB
	cmp ($F1.b),Y		; D1 F1
	plx		; FA
	sta ($AE.b,S),Y		; 93 AE
	ora [$19.b]		; 07 19
	ldx $B8.b		; A6 B8
	lda ($DE.b,S),Y		; B3 DE
	adc $3D.b		; 65 3D
	cmp $8773.w,Y		; D9 73 87
	asl $DB.b,X		; 16 DB
	adc $DD34.w		; 6D 34 DD
	cmp ($B1.b,S),Y		; D3 B1
	bcs  26.b		; B0 1A
	sty $BF.b,X		; 94 BF
	ora $088C.w,X		; 1D 8C 08
	sta $63.b,S		; 83 63
	lda $8ECA.w		; AD CA 8E
	dec $6D.b		; C6 6D
	stx $D9.b,Y		; 96 D9
	tay		; A8
	bra -60.b		; 80 C4
	ora $F4D2.w		; 0D D2 F4
	jsr $8351.w		; 20 51 83
	nop		; EA
	cmp ($E3.b,X)		; C1 E3
.ACCU 8
	sep #$6B		; E2 6B
	ldy $3DFB.w		; AC FB 3D
	eor [$B7.b],Y		; 57 B7
	adc ($D4.b)		; 72 D4
	tsb $E0.b		; 04 E0
	bcc  90.b		; 90 5A
	sta $89.b,S		; 83 89
	eor $71D8B4.l,X		; 5F B4 D8 71
	tsa		; 3B
	asl $9B07.w		; 0E 07 9B
	cpy #$2FF9.w		; C0 F9 2F
	adc $E591D7.l,X		; 7F D7 91 E5
	tda		; 7B
	stz $0FEC.w,X		; 9E EC 0F
	asl $CE.b,X		; 16 CE
	cmp $35EE.w,X		; DD EE 35
	stx $7D.b,Y		; 96 7D
	lda $E6813F.l,X		; BF 3F 81 E6
	jsr ($7B9B.w,X)		; FC 9B 7B
	sbc $CBAB53.l		; EF 53 AB CB
	ror $BEEA.w,X		; 7E EA BE
	lda ($CA.b,S),Y		; B3 CA
	lda ($BE.b)		; B2 BE
	cmp ($E7.b)		; D2 E7
	adc $5F.b		; 65 5F
	inc $5AA7.w		; EE A7 5A
	cmp $B675.w		; CD 75 B6
	dec $C0.b		; C6 C0
	lda ($BE.b)		; B2 BE
	cmp $E766.w,X		; DD 66 E7
	lda $A98B39.l		; AF 39 8B A9
	eor $DB3A.w		; 4D 3A DB
	adc ($0C.b,X)		; 61 0C
	stx $11.b		; 86 11
	lsr A		; 4A
	beq  76.b		; F0 4C
	adc ($4F.b),Y		; 71 4F
	cpy $80.b		; C4 80
	php		; 08
	.db $62, $60, $05		; 62 60 05
	cli		; 58
	ldy #$800B.w		; A0 0B 80
	tay		; A8
	phd		; 0B
	phb		; 8B
	sta $605C00.l		; 8F 00 5C 60
	ply		; 7A
	cop $E3.b		; 02 E3
	jsl $462EC0.l		; 22 C0 2E 46
	ora [$01.b],Y		; 17 01
	bra  31.b		; 80 1F
	brk $C0.b		; 00 C0
	clv		; B8
	jsr ($0606.w,X)		; FC 06 06
	asl A		; 0A
	rti		; 40

	clc		; 18
	ora $0020.w,Y		; 19 20 00
	cmp ($18.b,X)		; C1 18
	lda $01.b		; A5 01
	sta ($32.b),Y		; 91 32
	php		; 08
	tsb $C88F.w		; 0C 8F C8
	rti		; 40

	and ($43.b)		; 32 43
	clc		; 18
	ora ($92.b,X)		; 01 92
	ldy $00A6.w		; AC A6 00
	trb $49.b		; 14 49
	sep #$4F		; E2 4F
	sta ($8B.b)		; 92 8B
	asl A		; 0A
	stz $189F.w,X		; 9E 9F 18
	ldx $43.b,Y		; B6 43
	asl $4992.w,X		; 1E 92 49
	tay		; A8
	plb		; AB
	cmp $E0.b,X		; D5 E0
	bcs -55.b		; B0 C9
	ora ($34.b)		; 12 34
	.db $82, $3C, $28		; 82 3C 28
	lsr $96.b,X		; 56 96
	sta $F5EC.w,Y		; 99 EC F5
	lda $A7.b		; A5 A7
	ora ($3D.b,S),Y		; 13 3D
	lda ($85.b)		; B2 85
	lda $8B.b,X		; B5 8B
	lda $8A.b,X		; B5 8A
	eor [$25.b]		; 47 25
	sta ($89.b)		; 92 89
	adc $6ECD.w		; 6D CD 6E
	adc ($73.b,S),Y		; 73 73
	tad		; 5B
	txy		; 9B
	cpy #$D9B4.w		; C0 B4 D9
	.db $42, $E2		; 42 E2
	adc [$AD.b]		; 67 AD
	and $4E34.w		; 2D 34 4E
	adc $7E0D.w		; 6D 0D 7E
	and ($23.b,S),Y		; 33 23
	sta ($6E.b),Y		; 91 6E
	adc ($73.b,S),Y		; 73 73
	txy		; 9B
	txs		; 9A
	phk		; 4B
	and $658B.w		; 2D 8B 65
	stz $16.b		; 64 16
	adc $681A.w,Y		; 79 1A 68
	sta ($22.b),Y		; 91 22
	rep #$84		; C2 84
	ldy $25.b,X		; B4 25
	sty $49.b,X		; 94 49
	eor ($22.b,X)		; 41 22
	bit $92.b,X		; 34 92
	pld		; 2B
	ora ($57.b),Y		; 11 57
	sty $BC.b		; 84 BC
	bit $D4.b		; 24 D4
	adc ($24.b,S),Y		; 73 24
	sta ($85.b)		; 92 85
	ldy $03.b,X		; B4 03
	sbc ($93.b,X)		; E1 93
	and $5013.w		; 2D 13 50
	nop		; EA
	rol $D290.w		; 2E 90 D2
	plb		; AB
	adc [$34.b]		; 67 34
	sbc $F097.w,X		; FD 97 F0
	adc #$B1.b		; 69 B1
	cmp $A2.b		; C5 A2
	sbc #$0D.b		; E9 0D
	ldx #$0DFD.w		; A2 FD 0D
	jsl $A813E9.l		; 22 E9 13 A8
	bne -93.b		; D0 A3
	sec		; 38
	adc ($E9.b),Y		; 71 E9
	ora #$14.b		; 09 14
	and [$23.b]		; 27 23
	phb		; 8B
	inc $4D.b,X		; F6 4D
.ACCU 8
	sep #$23		; E2 23
	inc $F7.b		; E6 F7
	ldx $8BEF.w,Y		; BE EF 8B
	ora $E7C3C9.l		; 0F C9 C3 E7
	plp		; 28
	tsb $12.b		; 04 12
	bit $955C.w		; 2C 5C 95
	and $55.b,X		; 35 55
	and ($2C.b,S),Y		; 33 2C
	eor ($31.b,S),Y		; 53 31
	sta ($9C.b,X)		; 81 9C
	cpx $FA.b		; E4 FA
	phd		; 0B
	ldx $F6ED.w		; AE ED F6
	adc ($AF.b,S),Y		; 73 AF
	lda $FC78F8.l,X		; BF F8 78 FC
	adc $FAFC.w,Y		; 79 FC FA
	cmp [$F5.b],Y		; D7 F5
	lda $D773E0.l		; AF E0 73 D7
	cmp ($83.b,X)		; C1 83
	inc $A7.b,X		; F6 A7
	cmp $CD7B.w		; CD 7B CD
	lsr A		; 4A
	.db $82, $28, $A2		; 82 28 A2
	dec $2ADE.w		; CE DE 2A
	sbc $8C.b,S		; E3 8C
	eor ($86.b)		; 52 86
	sbc ($8C.b)		; F2 8C
	lda #$90.b		; A9 90
	lda ($0E.b,X)		; A1 0E
	and $503961.l		; 2F 61 39 50
	eor $EC7DFC.l		; 4F FC 7D EC
	sec		; 38
	and $517F12.l,X		; 3F 12 7F 51
	stp		; DB
	txy		; 9B
	phd		; 0B
	stz $E8.b		; 64 E8
	lda #$D0.b		; A9 D0
	inx		; E8
	lda ($2B.b),Y		; B1 2B
	lda $D2.b		; A5 D2
	sta $06.b,X		; 95 06
	jmp.w [$8FFB]		; DC FB 8F
	rti		; 40

	xce		; FB
	sta $98E740.l		; 8F 40 E7 98
	sbc ($26.b,S),Y		; F3 26
	.db $42, $75		; 42 75
	adc ($B1.b,S),Y		; 73 B1
	ora [$3B.b],Y		; 17 3B
	ora ($53.b),Y		; 11 53
	dec $A23D.w,X		; DE 3D A2
	and $FDB9.w,Y		; 39 B9 FD
	tyx		; BB
	inx		; E8
	bcs -74.b		; B0 B6
	eor $BDCC0F.l,X		; 5F 0F CC BD
	eor $86.b,X		; 55 86
	sbc $61.b,S		; E3 61
	lda ($D8.b),Y		; B1 D8
	xce		; FB
	stz $F106.w		; 9C 06 F1
	and $D726.w,X		; 3D 26 D7
	eor #$71.b		; 49 71
	cmp ($EC.b,S),Y		; D3 EC
	and $5F5725.l,X		; 3F 25 57 5F
	ldy $FA.b,X		; B4 FA
	clv		; B8
	adc $F2D9C3.l,X		; 7F C3 D9 F2
	lda $969D.w,X		; BD 9D 96
	lda $995E5E.l		; AF 5E 5E 99
	sta [$79.b]		; 87 79
	phd		; 0B
	eor ($AF.b),Y		; 51 AF
	cmp #$DC.b		; C9 DC
	sbc $BBF8F7.l,X		; FF F7 F8 BB
	sbc $FF.b,X		; F5 FF
	lda ($76.b)		; B2 76
	eor $F2D9.w		; 4D D9 F2
	sbc $257D.w		; ED 7D 25
	stz $D7.b,X		; 74 D7
	ora $370A46.l,X		; 1F 46 0A 37
	eor $8E6D5B.l,X		; 5F 5B 6D 8E
	and ($63.b)		; 32 63
	jmp ($B6D5.w,X)		; 7C D5 B6
	stx $ED.b,Y		; 96 ED
	ldx $38.b,Y		; B6 38
	ldx $C6.b,Y		; B6 C6
	txy		; 9B
	txs		; 9A
	cmp $D8FC.w,X		; DD FC D8
	cmp [$FE.b],Y		; D7 FE
	wai		; CB
	stx $45.b,Y		; 96 45
	dec $7617.w,X		; DE 17 76
	stp		; DB
	adc $753B.w		; 6D 3B 75
	rol A		; 2A
	dec $3B.b,X		; D6 3B
	lda ($E3.b),Y		; B1 E3
	lda ($71.b,S),Y		; B3 71
	txy		; 9B
	adc [$39.b]		; 67 39
	ldy $6F.b,X		; B4 6F
	pei ($B1.b)		; D4 B1
	rtl		; 6B

	tda		; 7B
	adc ($E7.b,X)		; 61 E7
	eor [$79.b],Y		; 57 79
	eor $DE7F.w,Y		; 59 7F DE
	sbc ($1E.b)		; F2 1E
	tsa		; 3B
	pei ($6F.b)		; D4 6F
	lsr A		; 4A
	sbc $FCB143.l,X		; FF 43 B1 FC
	phx		; DA
	sbc $F0ACCD.l		; EF CD AC F0
	adc $1767AE.l,X		; 7F AE 67 17
	sbc $F9F9.w		; ED F9 F9
	stz $5246.w		; 9C 46 52
	lda [$2D.b],Y		; B7 2D
	dey		; 88
	cmp $B3C0.w,X		; DD C0 B3
	eor [$2D.b],Y		; 57 2D
	sta $D28D.w		; 8D 8D D2
	cld		; D8
	adc [$73.b]		; 67 73
	lda $FEB7D7.l,X		; BF D7 B7 FE
	lda $FF97F7.l,X		; BF F7 97 FF
	lda $55BF.w,X		; BD BF 55
	adc ($BE.b,X)		; 61 BE
	sbc #$F7.b		; E9 F7
	dec $7B.b,X		; D6 7B
	xba		; EB
	pld		; 2B
	inc $1B.b		; E6 1B
	sta $76617F.l		; 8F 7F 61 76
	cpx $9D66.w		; EC 66 9D
	adc $0FB0.w		; 6D B0 0F
	sbc $9C.b,S		; E3 9C
	stz $03BE.w,X		; 9E BE 03
	and ($D8.b)		; 32 D8
	txy		; 9B
	ora $9BD6.w,Y		; 19 D6 9B
	jmp ($9021.w)		; 6C 21 90
	cpy $A2.b		; C4 A2
	ldx #$21BD.w		; A2 BD 21
	bmi   1.b		; 30 01
	and ($F8.b,X)		; 21 F8
	bcc   9.b		; 90 09
	bpl -60.b		; 10 C4
	cpy #$AB48.w		; C0 48 AB
	trb $01.b		; 14 01
	beq -124.b		; F0 84
	rol A		; 2A
	ora $E1.b,S		; 03 E1
	adc ($E0.b,X)		; 61 E0
	ora $D04388.l		; 0F 88 43 D0
	ora $C02215.l,X		; 1F 15 22 C0
	rol $8B22.w,X		; 3E 22 8B
	sta ($4C.b,X)		; 81 4C
	and ($0F.b,X)		; 21 0F
	bra -90.b		; 80 A6
	asl $1F.b,X		; 16 1F
	sta ($4C.b,X)		; 81 4C
	.db $42, $29		; 42 29
	brk $A6.b		; 00 A6
	rol A		; 2A
	pha		; 48
	brk $53.b		; 00 53
	ora ($4A.b),Y		; 11 4A
	bvc  42.b		; 50 2A
	sty $C8.b		; 84 C8
	jsr $0F55.w		; 20 55 0F
	iny		; C8
	rti		; 40

	eor $10.b,X		; 55 10
	dec $00.b		; C6 00
	tax		; AA
	rol A		; 2A
	dex		; CA
	rts		; 60

	ora ($13.b,S),Y		; 13 13
	eor $1F45.w		; 4D 45 1F
	eor ($54.b)		; 52 54
	pei ($F4.b)		; D4 F4
	bne 113.b		; D0 71
	tya		; 98
	tay		; A8
	bvc  84.b		; 50 54
	bvc  80.b		; 50 50
	eor $38.b,X		; 55 38
	ora $38.b,S		; 03 38
	tay		; A8
	cpx $82.b		; E4 82
	rol $3B7B.w,X		; 3E 7B 3B
	phx		; DA
	sbc [$31.b],Y		; F7 31
	ror A		; 6A
	lda $AD7A.w,Y		; B9 7A AD
	ldx $C9D7.w		; AE D7 C9
	adc ($ED.b)		; 72 ED
	rtl		; 6B

	ldx $5E.b,Y		; B6 5E
	and #$29.b		; 29 29
	adc $AB44.w,Y		; 79 44 AB
	sta [$49.b]		; 87 49
	ldx $03.b		; A6 03
	adc ($49.b,S),Y		; 73 49
	stp		; DB
	tad		; 5B
	sta $6EA5.w,X		; 9D A5 6E
	dec $B3.b,X		; D6 B3
	jmp.w [$FBEB]		; DC EB FB
	and [$2F.b]		; 27 2F
	sbc $DA75.w,X		; FD 75 DA
	trb $6E9C.w		; 1C 9C 6E
	bcc -101.b		; 90 9B
	ldy $AD9B.w		; AC 9B AD
	sbc $6A.b,S		; E3 6A
	sbc [$29.b]		; E7 29
	lda $79.b,S		; A3 79
	cmp $D6E8DA.l,X		; DF DA E8 D6
	sta ($D4.b),Y		; 91 D4
	eor $45.b,X		; 55 45
	adc ($42.b,S),Y		; 73 42
	eor $A2CC.w,Y		; 59 CC A2
	bit #$24.b		; 89 24
	ora [$45.b]		; 07 45
	ror $45.b		; 66 45
	.db $62, $28, $B2		; 62 28 B2
	plb		; AB
	rol $A2.b		; 26 A2
	eor #$02.b		; 49 02
	mvp $25,$55		; 44 55 25
	cmp [$69.b]		; C7 69
	dec $064F.w,X		; DE 4F 06
	adc $7D.b,S		; 63 7D
	ora $9E.b,S		; 03 9E
	bit $95.b		; 24 95
	bit $BE4B.w,X		; 3C 4B BE
	ora $73.b,S		; 03 73
	and ($8D.b,X)		; 21 8D
	bit #$8A.b		; 89 8A
	sty $0C.b,X		; 94 0C
	and ($9E.b,S),Y		; 33 9E
	eor ($39.b),Y		; 51 39
	sbc [$40.b]		; E7 40
	cmp $3E.b,S		; C3 3E
	lda ($41.b),Y		; B1 41
	beq -88.b		; F0 A8
	bcc -88.b		; 90 A8
	tya		; 98
	sed		; F8
	lda [$39.b]		; A7 39
	phx		; DA
	ldx $CD19.w,Y		; BE 19 CD
	adc $8D.b,S		; 63 8D
	ldx $E8.b,Y		; B6 E8
	inc $038F.w,X		; FE 8F 03
	sta ($CC.b),Y		; 91 CC
	stp		; DB
	jmp ($65FB.w,X)		; 7C FB 65
	lsr A		; 4A
	sbc ($87.b),Y		; F1 87
	tax		; AA
	lsr $F4.b,X		; 56 F4
	sta $7A.b,X		; 95 7A
	rol $A7F3.w		; 2E F3 A7
	cmp [$E4.b]		; C7 E4
	adc ($DE.b),Y		; 71 DE
	sbc [$7F.b],Y		; F7 7F
	sbc $D6.b,S		; E3 D6
	and ($91.b),Y		; 31 91
	rol $B933.w		; 2E 33 B9
	cmp $C676.w		; CD 76 C6
	sbc #$CD.b		; E9 CD
	inc $D6D3.w		; EE D3 D6
	sbc $3D.b,X		; F5 3D
	stz $B4EB.w,X		; 9E EB B4
	eor $E9C345.l,X		; 5F 45 C3 E9
	lda $5F5AB2.l		; AF B2 5A 5F
	ora $28FFA3.l,X		; 1F A3 FF 28
	inc $E1.b		; E6 E1
	pea $1835.w		; F4 35 18
	sta $BD8B.w,Y		; 99 8B BD
	trb $5356.w		; 1C 56 53
	jsr ($7156.w,X)		; FC 56 71
	sbc ($FA.b,S),Y		; F3 FA
	sta $1E73.w,Y		; 99 73 1E
	lda $0B00.w,X		; BD 00 0B
	eor ($1B.b,S),Y		; 53 1B
.ACCU 16
	rep #$AC		; C2 AC
	cpy $BF.b		; C4 BF
	sta [$C9.b]		; 87 C9
	sbc $1DEE99.l,X		; FF 99 EE 1D
	phd		; 0B
	inc A		; 1A
	sbc $67.b		; E5 67
	lsr $5BD7.w		; 4E D7 5B
.ACCU 8
.INDEX 8
	sep #$3E		; E2 3E
	tax		; AA
	sbc $3FB4F6.l		; EF F6 B4 3F
	cmp ($D1.b,S),Y		; D3 D1
	plp		; 28
	sta [$CE.b],Y		; 97 CE
	ror $F0DE.w		; 6E DE F0
	rts		; 60

	sbc #$E9.b		; E9 E9
	and $DDE7.w,X		; 3D E7 DD
	cmp ($57.b)		; D2 57
	rtl		; 6B

	phx		; DA
	sta ($CC.b),Y		; 91 CC
	cmp ($60.b,X)		; C1 60
	jmp ($B015.w)		; 6C 15 B0
	tda		; 7B
	adc ($07.b),Y		; 71 07
	rol $B5.b,X		; 36 B5
	pei ($27.b)		; D4 27
	adc ($5C.b,X)		; 61 5C
	adc $636B23.l		; 6F 23 6B 63
	adc $77BE.w		; 6D BE 77
	and $53F645.l		; 2F 45 F6 53
	cpx $A9.b		; E4 A9
	xba		; EB
	rol $DB.b,X		; 36 DB
	adc $6AC537.l		; 6F 37 C5 6A
	bit $A8.b		; 24 A8
	tya		; 98
	bit $369E.w,X		; 3C 9E 36
	dec A		; 3A
	sta $7EEAE6.l,X		; 9F E6 EA 7E
	bit $5C97.w		; 2C 97 5C
	ldx $AD.b		; A6 AD
	eor [$36.b]		; 47 36
	stp		; DB
	dec $C1.b		; C6 C1
	adc [$F0.b]		; 67 F0
	cpy $90.b		; C4 90
	sta [$EC.b],Y		; 97 EC
	sbc $AFE6BF.l		; EF BF E6 AF
	eor ($AD.b,S),Y		; 53 AD
	pei ($E8.b)		; D4 E8
	pld		; 2B
	jmp ($1E68.w,X)		; 7C 68 1E
	ora $37F5FE.l,X		; 1F FE F5 37
	xce		; FB
	and #$5D.b		; 29 5D
	ldy $776F.w,X		; BC 6F 77
	ldx $FEB3.w,Y		; BE B3 FE
	lsr $FD1D.w,X		; 5E 1D FD
	cpy #$E3.b		; C0 E3
	bpl  33.b		; 10 21
	bit $3238.w		; 2C 38 32
	sbc [$0E.b]		; E7 0E
	and $A6B1.w		; 2D B1 A6
	ldx $AEAE.w		; AE AE AE
	inc A		; 1A
	jmp ($E6D1.w)		; 6C D1 E6
	xce		; FB
	stx $6C.b		; 86 6C
	adc $C7B6F5.l,X		; 7F F5 B6 C7
	tad		; 5B
	sta $7F.b,X		; 95 7F
	ora $B7DB.w,X		; 1D DB B7
	ror $7C.b,X		; 76 7C
	jmp ($ACE4.w,X)		; 7C E4 AC
	sbc [$56.b]		; E7 56
	lda $E95FEF.l		; AF EF 5F E9
	inc $BC.b,X		; F6 BC
	lda $F4EF.w		; AD EF F4
	dec $7C.b,X		; D6 7C
	adc $7BB4A7.l,X		; 7F A7 B4 7B
	dec $65.b,X		; D6 65
	rol $BEF4.w		; 2E F4 BE
	ora [$49.b]		; 07 49
	and $291B43.l		; 2F 43 1B 29
	txy		; 9B
	dex		; CA
	pha		; 48
	sta [$23.b]		; 87 23
	dec $67.b		; C6 67
	dec $EB.b		; C6 EB
	and $E95537.l,X		; 3F 37 55 E9
	inc $3F4C.w,X		; FE 4C 3F
	adc $A7EF15.l,X		; 7F 15 EF A7
	sbc $3A2F.w		; ED 2F 3A
	asl $E6.b		; 06 E6
	and $3E.b,S		; 23 3E
	rol $D2.b,X		; 36 D2
	asl $A7EB.w,X		; 1E EB A7
	ldx $2387.w		; AE 87 23
	ora ($96.b,S),Y		; 13 96
	cpy $D8.b		; C4 D8
	mvn $71,$67		; 54 67 71
	eor [$EC.b],Y		; 57 EC
	inc $EE.b		; E6 EE
	bmi  24.b		; 30 18
	clv		; B8
	tsx		; BA
	tsx		; BA
	pla		; 68
	adc $25B0.w		; 6D B0 25
	cld		; D8
	eor $DA5EB0.l		; 4F B0 5E DA
	adc $AC.b,X		; 75 AC
	adc #$AD.b		; 69 AD
	dec A		; 3A
	stp		; DB
	adc ($0C.b,X)		; 61 0C
	stx $15.b		; 86 15
	iny		; C8
	lda $14C704.l		; AF 04 C7 14
	jsr ($0048.w,X)		; FC 48 00
	stx $26.b		; 86 26
	brk $55.b		; 00 55
	txa		; 8A
	brk $B8.b		; 00 B8
	asl A		; 0A
	bra -72.b		; 80 B8
	clv		; B8
	beq   5.b		; F0 05
	dec $07.b		; C6 07
	ldy #$2E.b		; A0 2E
	and ($2C.b)		; 32 2C
	cop $E4.b		; 02 E4
	adc ($70.b,X)		; 61 70
	clc		; 18
	bpl -121.b		; 10 87
	cpy #$30.b		; C0 30
	bit $013F.w		; 2C 3F 01
	.db $82, $11, $48		; 82 11 48
	ora $05.b,S		; 03 05
	eor #$00.b		; 49 00
	asl $08.b		; 06 08
	lda $28.b		; A5 28
	tsb $9089.w		; 0C 89 90
	rti		; 40

	stz $7E.b		; 64 7E
	.db $42, $01		; 42 01
	sta ($18.b)		; 92 18
	cpy #$0C.b		; C0 0C
	sta $65.b,X		; 95 65
	bmi   9.b		; 30 09
	sta $B38253.l		; 8F 53 82 B3
	inx		; E8
	sec		; 38
	sty $904A.w		; 8C 4A 90
	and ($12.b)		; 32 12
	and ($4B.b,S),Y		; 33 4B
	tay		; A8
	ldx #$AB.b		; A2 AB
	rol $F580.w,X		; 3E 80 F5
	stz $D9.b,X		; 74 D9
	bra -61.b		; 80 C3
	ora ($B3.b),Y		; 11 B3
	adc ($ED.b)		; 72 ED
	and ($BA.b,S),Y		; 33 BA
	pld		; 2B
	pla		; 68
	lda ($F6.b),Y		; B1 F6
	jmp $3B7A.w		; 4C 7A 3B
	lda $CFAE.w		; AD AE CF
	cmp #$D9.b		; C9 D9
	jmp.w [$31DC]		; DC DC 31
	and #$96.b		; 29 96
	lda $35.b,S		; A3 35
	adc ($35.b),Y		; 71 35
	sta [$49.b]		; 87 49
	plb		; AB
	cmp $6E4A.w		; CD 4A 6E
	dex		; CA
.ACCU 8
	sep #$E6		; E2 E6
	sbc $B8.b		; E5 B8
	phx		; DA
	ldy $0B5F.w,X		; BC 5F 0B
	ldy $B4B5.w,X		; BC B5 B4
	jsr ($7B51.w,X)		; FC 51 7B
	dec $899D.w		; CE 9D 89
	lda [$1B.b]		; A7 1B
	cmp $BD.b,X		; D5 BD
	sbc $37.b,X		; F5 37
	txy		; 9B
	sta $6CE5.w,X		; 9D E5 6C
	lda $B72BC3.l		; AF C3 2B B7
	inc $49E4.w		; EE E4 49
	lda #$83.b		; A9 83
	ora ($A6.b)		; 12 A6
	ora ($D4.b)		; 12 D4
	lda #$A6.b		; A9 A6
	ldx #$40.b		; A2 40
	and $55C4B1.l,X		; 3F B1 C4 55
	cpy #$AC.b		; C0 AC
	adc $10024B.l,X		; 7F 4B 02 10
	ldx #$49.b		; A2 49
	ora $49.b		; 05 49
	dec A		; 3A
	tay		; A8
	adc $B624.w		; 6D 24 B6
	phy		; 5A
	ror $277D.w		; 6E 7D 27
	and $E64F.w		; 2D 4F E6
	and ($17.b,S),Y		; 33 17
	inc $F2.b,X		; F6 F2
	tsb $14.b		; 04 14
	adc $30.b		; 65 30
	rol A		; 2A
	cmp ($D7.b,X)		; C1 D7
	sta $1CF341.l,X		; 9F 41 F3 1C
	lda ($FA.b,S),Y		; B3 FA
	stz $BDA4.w		; 9C A4 BD
	mvp $69,$B8		; 44 B8 69
	ror $9371.w,X		; 7E 71 93
	lda $18.b,S		; A3 18
	and $7D4C01.l,X		; 3F 01 4C 7D
	sbc ($BC.b)		; F2 BC
	cld		; D8
	trb $F8B4.w		; 1C B4 F8
	ror A		; 6A
	and $551381.l		; 2F 81 13 55
	adc $E0.b,S		; 63 E0
	sbc $7B.b,X		; F5 7B
	inc $ACAB.w		; EE AB AC
	sta $0C5F.w		; 8D 5F 0C
	lda $DCAD27.l		; AF 27 AD DC
	sbc $7E96.w,Y		; F9 96 7E
	adc $67F11F.l,X		; 7F 1F F1 67
	inc $C75F.w,X		; FE 5F C7
	tsx		; BA
	sta [$2E.b],Y		; 97 2E
	bit $A9.b,X		; 34 A9
	adc ($9B.b,S),Y		; 73 9B
	tay		; A8
	eor $6E.b,X		; 55 6E
	ror $4A.b		; 66 4A
	sbc $F293D5.l,X		; FF D5 93 F2
	wai		; CB
	pea $FA65.w		; F4 65 FA
	tsa		; 3B
	ldx $CAD7.w		; AE D7 CA
	inc $D6B5.w		; EE B5 D6
	stp		; DB
	stp		; DB
	and $9127.w		; 2D 27 91
	stx $F1F7.w		; 8E F7 F1
	trb $13FF.w		; 1C FF 13
	and [$F7.b]		; 27 F7
	stz $0ED2.w,X		; 9E D2 0E
	and ($A7.b)		; 32 A7
	cop $F6.b		; 02 F6
	sty $79.b		; 84 79
	bmi -95.b		; 30 A1
	asl $D22D.w		; 0E 2D D2
	sty $8F.b		; 84 8F
	cmp $37EFD2.l,X		; DF D2 EF 37
	txy		; 9B
	and $173367.l,X		; 3F 67 33 17
	phx		; DA
.ACCU 8
	sep #$E0		; E2 E0
	sbc $D3.b,X		; F5 D3
	ror $F5.b		; 66 F5
	ror $DEAC.w,X		; 7E AC DE
	inc $76.b		; E6 76
	.db $42, $46		; 42 46
	and ($C6.b)		; 32 C6
.ACCU 8
	sep #$A2		; E2 A2
	lda #$95.b		; A9 95
	plx		; FA
	asl $27F7.w,X		; 1E F7 27
	eor $6D69E0.l		; 4F E0 69 6D
	pea $4E99.w		; F4 99 4E
	ldx #$C7.b		; A2 C7
	lda [$AA.b]		; A7 AA
	cpy $DC.b		; C4 DC
	inc $55.b,X		; F6 55
	adc ($15.b),Y		; 71 15
	bra -74.b		; 80 B6
	tsx		; BA
	ora $FA9E8A.l		; 0F 8A 9E FA
	asl $F5.b,X		; 16 F5
	rol $6B36.w,X		; 3E 36 6B
	ora $B169.w,Y		; 19 69 B1
	sbc $6FBD.w		; ED BD 6F
	cmp $A4.b,X		; D5 A4
	bcs -46.b		; B0 D2
	adc $72.b,S		; 63 72
	lsr $5D.b,X		; 56 5D
	eor $72EFE4.l		; 4F E4 EF 72
	ora $99F7.w,Y		; 19 F7 99
	lsr $4589.w,X		; 5E 89 45
	lda #$B1.b		; A9 B1
	sta $F3BFCF.l,X		; 9F CF BF F3
	tda		; 7B
	sbc $B64F37.l,X		; FF 37 4F B6
	cmp ($ED.b,S),Y		; D3 ED
	lda ($FA.b),Y		; B1 FA
	php		; 08
	and $3928.w,Y		; 39 28 39
	plp		; 28
	sty $F1.b,X		; 94 F1
	and #$E1.b		; 29 E1
	jmp $3D5B7D.l		; 5C 7D 5B 3D
	and $46.b,X		; 35 46
	sta $EAA56C.l,X		; 9F 6C A5 EA
	sta [$B9.b],Y		; 97 B9
	ora $EF237B.l,X		; 1F 7B 23 EF
	adc $1BB3.w		; 6D B3 1B
	ora $36.b,X		; 15 36
	nop		; EA
	adc [$DD.b],Y		; 77 DD
	trb $CD.b		; 14 CD
	ora $085F0E.l,X		; 1F 0E 5F 08
	adc ($9F.b),Y		; 71 9F
	sbc $D87A4E.l,X		; FF 4E 7A D8
	bvs 100.b		; 70 64
	eor $635B1C.l		; 4F 1C 5B 63
	mvp $E1,$62		; 44 62 E1
	tyx		; BB
	phb		; 8B
	sta $7DCF65.l		; 8F 65 CF 7D
	jmp ($6DDB.w,X)		; 7C DB 6D
	tsa		; 3B
	inc A		; 1A
	rtl		; 6B

	ora ($C9.b)		; 12 C9
	stz $82.b		; 64 82
	eor ($65.b,X)		; 41 65
	beq -71.b		; F0 B9
	adc [$AD.b],Y		; 77 AD
	adc ($73.b),Y		; 71 73
	sbc $2EFE.w,Y		; F9 FE 2E
	adc $CFE68A.l,X		; 7F 8A E6 CF
	sbc $A3D2.w,Y		; F9 D2 A3
	clc		; 18
	pei ($EC.b)		; D4 EC
	dex		; CA
.ACCU 8
.INDEX 8
	sep #$B8		; E2 B8
	ldx $E46E.w		; AE 6E E4
	ldx $BB6E.w		; AE 6E BB
	dec $F9E8.w		; CE E8 F9
	bcc  -1.b		; 90 FF
	adc ($DF.b,S),Y		; 73 DF
	eor $AAFB29.l		; 4F 29 FB AA
	plp		; 28
	cpy $FE.b		; C4 FE
	tsa		; 3B
	phk		; 4B
	inx		; E8
	inc $37D7.w		; EE D7 37
	ora $DA.b		; 05 DA
	inc $BC.b		; E6 BC
	eor $B20E7E.l,X		; 5F 7E 0E B2
	ora $0DFC.w		; 0D FC 0D
	cpy $660F.w		; CC 0F 66
	lsr $6E.b		; 46 6E
	tsa		; 3B
	adc ($EE.b)		; 72 EE
	rol $DD.b		; 26 DD
	dec A		; 3A
	cmp ($6D.b,S),Y		; D3 6D
	sta ($76.b,X)		; 81 76
	ldx $79E9.w,Y		; BE E9 79
	ldy $624E.w		; AC 4E 62
	jmp ($5A67.w)		; 6C 67 5A
	adc $86B0.w		; 6D B0 86
	eor $08.b,S		; 43 08
	tay		; A8
	lda $008854.l		; AF 54 88 00
	rti		; 40

	jsl $500109.l		; 22 09 01 50
	mvp $00,$13		; 44 13 00
	rol A		; 2A
	ora $00.b		; 05 00
	jmp $0115A8.l		; 5C A8 15 01
	.db $82, $A0, $78		; 82 A0 78
	ora $25.b,S		; 03 25
	rti		; 40

	pea $8000.w		; F4 00 80
	bit $E402.w		; 2C 02 E4
	ora ($70.b,X)		; 01 70
	clc		; 18
	jsr $800F.w		; 20 0F 80
	stz $80.b		; 64 80
	and $522101.l,X		; 3F 01 21 52
	bcc   7.b		; 90 07
.ACCU 16
	rep #$A4		; C2 A4
	brk $29.b		; 00 29
	sta $4A.b		; 85 4A
	bvc  42.b		; 50 2A
	sta $48.b		; 85 48
	jsr $283D.w		; 20 3D 28
	jsl $4A1010.l		; 22 10 10 4A
	php		; 08
	rts		; 60

	tsb $4149.w		; 0C 49 41
	trb $C0.b		; 14 C0
	sei		; 78
	ora $DC77DB.l,X		; 1F DB 77 DC
	phy		; 5A
	eor #$45D0.w		; 49 D0 45
	sbc #$5FE9.w		; E9 E9 5F
	rol $98.b		; 26 98
	phd		; 0B
	eor $CCD0D6.l		; 4F D6 D0 CC
	ror A		; 6A
	lda ($FA.b,S),Y		; B3 FA
	tya		; 98
	sbc ($60.b)		; F2 60
	.db $42, $51		; 42 51
	rti		; 40

	bit #$CF0F.w		; 89 0F CF
	clv		; B8
	cmp $B5.b		; C5 B5
	cmp ($CF.b,X)		; C1 CF
	sbc $3D.b,S		; E3 3D
	rol $FA5F.w,X		; 3E 5F FA
	lda [$B8.b],Y		; B7 B8
	txs		; 9A
	stz $7D.b		; 64 7D
	sbc $F998D5.l		; EF D5 98 F9
	ora ($E7.b)		; 12 E7
	and $AA.b		; 25 AA
	cmp $D1.b,X		; D5 D1
	lsr A		; 4A
	ora $DF6C2A.l,X		; 1F 2A 6C DF
	lda $9153.w,X		; BD 53 91
	.db $82, $C5, $94		; 82 C5 94
	stp		; DB
	rtl		; 6B

	sbc $0D57.w,Y		; F9 57 0D
	brk $7C.b		; 00 7C
	dec A		; 3A
	dec $AE06.w,X		; DE 06 AE
	stx $DFB2.w		; 8E B2 DF
	eor $D9A3.w,X		; 5D A3 D9
	cmp [$9C.b]		; C7 9C
	ora ($E5.b,X)		; 01 E5
	dec $69.b,X		; D6 69
	pld		; 2B
	and ($D6.b)		; 32 D6
	cmp $B4.b,X		; D5 B4
	ldx $B2.b,Y		; B6 B2
	adc #$F872.w		; 69 72 F8
	plx		; FA
	sbc $9F.b		; E5 9F
	xba		; EB
	eor ($8B.b),Y		; 51 8B
	dec $3AE5.w		; CE E5 3A
	dec $49D3.w,X		; DE D3 49
	cld		; D8
	adc #$2C69.w		; 69 69 2C
	ply		; 7A
	rtl		; 6B

	inc A		; 1A
	ror A		; 6A
	sbc $BFCB61.l		; EF 61 CB BF
	cmp $4EBEFF.l,X		; DF FF BE 4E
	adc [$D8.b]		; 67 D8
	eor ($AA.b,S),Y		; 53 AA
	sbc ($1C.b)		; F2 1C
	lda $5957.w,X		; BD 57 59
	adc ($DE.b,X)		; 61 DE
	xce		; FB
	tyx		; BB
	sta $950B77.l,X		; 9F 77 0B 95
	cmp $7B71.w,Y		; D9 71 7B
	ror $CA93.w		; 6E 93 CA
	tad		; 5B
	stz $39B7.w		; 9C B7 39
	stp		; DB
	pld		; 2B
	cmp $F7C6C3.l,X		; DF C3 C6 F7
	sbc $E26187.l,X		; FF 87 61 E2
	eor $F1.b,S		; 43 F1
	and [$3E.b],Y		; 37 3E
	cmp $3F8F.w,X		; DD 8F 3F
	ora $C6.b,X		; 15 C6
	bcs -16.b		; B0 F0
	adc $F7.b		; 65 F7
	ora ($EC.b)		; 12 EC
	tya		; 98
	lda [$62.b],Y		; B7 62
	cmp $96.b,X		; D5 96
	ora $228F.w,Y		; 19 8F 22
	dec $40.b		; C6 40
	rol $9E.b		; 26 9E
	lda ($59.b,S),Y		; B3 59
	plx		; FA
	eor $FD.b,X		; 55 FD
	rol A		; 2A
	sbc $7B38.w		; ED 38 7B
	jmp $77EE.w		; 4C EE 77
	ror $51.b		; 66 51
	plp		; 28
	txs		; 9A
	ldy $F5.b		; A4 F5
	eor #$9AEA.w		; 49 EA 9A
	lda ($EA.b)		; B2 EA
	cpx $919B.w		; EC 9B 91
	adc #$152E.w		; 69 2E 15
	stx $36D6.w		; 8E D6 36
	dex		; CA
	lsr $D6.b		; 46 D6
	rol $D6.b,X		; 36 D6
	cmp $C5.b,S		; C3 C5
	sta $1D99AB.l		; 8F AB 99 1D
	plb		; AB
	asl $AE.b,X		; 16 AE
	sta $3BDD.w,X		; 9D DD 3B
	stz $EE.b,X		; 74 EE
	sbc ($DF.b,X)		; E1 DF
	inc $EA.b		; E6 EA
	tas		; 1B
	cpx $3D.b		; E4 3D
	cmp ($C3.b,S),Y		; D3 C3
	sbc $74.b,S		; E3 74
	adc $7883.w,Y		; 79 83 78
	adc $1DFF12.l		; 6F 12 FF 1D
	adc ($C5.b,S),Y		; 73 C5
	sta ($65.b)		; 92 65
	clv		; B8
	sta ($A2.b),Y		; 91 A2
	and [$66.b],Y		; 37 66
	eor $7996.w,Y		; 59 96 79
	ldx $0E9E.w,Y		; BE 9E 0E
	ora $77.b,X		; 15 77
	plx		; FA
	eor [$93.b]		; 47 93
	ldx $FCF4.w,Y		; BE F4 FC
	sta $A77F.w,X		; 9D 7F A7
	adc ($17.b,S),Y		; 73 17
	eor $BD0B.w		; 4D 0B BD
	sbc $F6.b		; E5 F6
	sbc ($FB.b)		; F2 FB
	sbc $B7D3.w,Y		; F9 D3 B7
	ora $A9FB3C.l,X		; 1F 3C FB A9
	dec $E26E.w,X		; DE 6E E2
	lsr $EA.b		; 46 EA
	eor $B5.b		; 45 B5
	lda [$F4.b],Y		; B7 F4
	adc ($FC.b)		; 72 FC
	rol $FE5F.w		; 2E 5F FE
	jmp.w [$1676]		; DC 76 16
	ldx $DF7E.w,Y		; BE 7E DF
	bcs 114.b		; B0 72
	ldx $CD5F.w,Y		; BE 5F CD
	tsx		; BA
	dec A		; 3A
	sbc ($A5.b,S),Y		; F3 A5
	phk		; 4B
	lda $4B.b,X		; B5 4B
	cmp ($4B.b),Y		; D1 4B
	lda [$3D.b],Y		; B7 3D
	trb $BE.b		; 14 BE
	cpx $B3.b		; E4 B3
	bne  32.b		; D0 20
	and ($5D.b),Y		; 31 5D
	sty $215F.w		; 8C 5F 21
	adc $69.b,S		; 63 69
	ora $EDE039.l,X		; 1F 39 E0 ED
	adc $5C.b		; 65 5C
	cmp $A090.w,X		; DD 90 A0
	cmp ($58.b,S),Y		; D3 58
	eor [$A8.b]		; 47 A8
	sta $AC2D.w		; 8D 2D AC
	plb		; AB
	eor ($5B.b,S),Y		; 53 5B
	iny		; C8
	tyx		; BB
	bcc -58.b		; 90 C6
	inc $DD.b,X		; F6 DD
	cmp [$87.b]		; C7 87
	tay		; A8
	plx		; FA
	sbc $13.b,X		; F5 13
	rol A		; 2A
	inx		; E8
	cmp [$7A.b],Y		; D7 7A
	cmp $DE.b,X		; D5 DE
	inc $35.b		; E6 35
	sbc $B22D05.l		; EF 05 2D B2
	phx		; DA
	tsx		; BA
	stz $B5.b		; 64 B5
	tax		; AA
	and $4A9A.w,Y		; 39 9A 4A
	lda $CA8F.w,X		; BD 8F CA
	sbc $D4.b		; E5 D4
	pea $3E35.w		; F4 35 3E
	lda $E4.b,X		; B5 E4
	txy		; 9B
	tda		; 7B
	tda		; 7B
	cpy $6FF5.w		; CC F5 6F
	sta $D1DC.w,Y		; 99 DC D1
	adc $98F8.w		; 6D F8 98
	txy		; 9B
	lda $B7.b,S		; A3 B7
	lda $37B7.w		; AD B7 37
	cli		; 58
	inc $A6AD.w		; EE AD A6
	lda $35.b		; A5 35
	ror A		; 6A
	cmp $DD.b,X		; D5 DD
	dec $EBE2.w,X		; DE E2 EB
	tsa		; 3B
	sta $77BE.w,X		; 9D BE 77
	adc ($B9.b,S),Y		; 73 B9
	ora $748D.w,X		; 1D 8D 74
	cmp $D9.b		; C5 D9
	ror A		; 6A
	ldx $DC74.w,Y		; BE 74 DC
	pld		; 2B
	stz $67.b		; 64 67
	ora [$16.b]		; 07 16
	lda #$7A8E.w		; A9 8E 7A
	stx $45.b,Y		; 96 45
	cmp $E2E0.w,X		; DD E0 E2
	dec $5B.b,X		; D6 5B
	pld		; 2B
	and $31.b,S		; 23 31
	tax		; AA
	lsr A		; 4A
	dey		; 88
	brk $58.b		; 00 58
	txs		; 9A
	pld		; 2B
	bit $4EC2.w,X		; 3C C2 4E
	tya		; 98
	sta $1600CA.l		; 8F CA 00 16
	lsr $5F.b,X		; 56 5F
	ror $C9.b		; 66 C9
	stp		; DB
	iny		; C8
	jmp.w [$7F47]		; DC 47 7F
	brk $E3.b		; 00 E3
	eor $346E.w,X		; 5D 6E 34
	rtl		; 6B

	tad		; 5B
	eor ($C6.b),Y		; 51 C6
	ldy $E9.b,X		; B4 E9
	bit $BB.b,X		; 34 BB
	stx $43.b		; 86 43
	php		; 08
	tay		; A8
	lda $14C704.l		; AF 04 C7 14
	jsr ($0048.w,X)		; FC 48 00
	stx $26.b		; 86 26
	brk $55.b		; 00 55
	txa		; 8A
	brk $B8.b		; 00 B8
	asl A		; 0A
	bra -72.b		; 80 B8
	clv		; B8
	beq   5.b		; F0 05
	dec $07.b		; C6 07
	ldy #$2E.b		; A0 2E
	and ($2C.b)		; 32 2C
	cop $E4.b		; 02 E4
	adc ($70.b,X)		; 61 70
	clc		; 18
	bpl -121.b		; 10 87
	cpy #$30.b		; C0 30
	bit $013F.w		; 2C 3F 01
	.db $82, $11, $48		; 82 11 48
	ora $05.b,S		; 03 05
	eor #$0600.w		; 49 00 06
	php		; 08
	lda $28.b		; A5 28
	tsb $9089.w		; 0C 89 90
	rti		; 40

	stz $7E.b		; 64 7E
	.db $42, $01		; 42 01
	sta ($18.b)		; 92 18
	cpy #$0C.b		; C0 0C
	sta $65.b,X		; 95 65
	bmi   0.b		; 30 00
	ldx #$8F.b		; A2 8F
	lsr $80C0.w,X		; 5E C0 80
.ACCU 16
	rep #$E4		; C2 E4
	jmp $6475.w		; 4C 75 64
	rol A		; 2A
	sty $92.b		; 84 92
	trb $16.b		; 14 16
	and ($33.b,X)		; 21 33
	eor ($02.b,S),Y		; 53 02
	sta $A21A2D.l,X		; 9F 2D 1A A2
	rol $7A.b,X		; 36 7A
	and $AEA473.l,X		; 3F 73 A4 AE
	cmp ($D6.b),Y		; D1 D6
	sbc #$CDFC.w		; E9 FC CD
	ora $CF.b		; 05 CF
	adc $77E6.w,Y		; 79 E6 77
	inc $8A5E.w,X		; FE 5E 8A
	tad		; 5B
	eor $0CAB79.l,X		; 5F 79 AB 0C
	cmp [$80.b]		; C7 80
	sta [$17.b],Y		; 97 17
	eor [$81.b],Y		; 57 81
	lda $AD9D.w		; AD 9D AD
	sbc $EB.b,S		; E3 EB
	ror $1E.b,X		; 76 1E
	ora $FDDE95.l		; 0F 95 DE FD
	tsx		; BA
	lsr $D92A.w,X		; 5E 2A D9
	ror $29A9.w		; 6E A9 29
	and $5ECD.w,X		; 3D CD 5E
	eor [$21.b],Y		; 57 21
	sta $AD.b		; 85 AD
	sbc $C8A59F.l,X		; FF 9F A5 C8
	bit #$F9C3.w		; 89 C3 F9
	clv		; B8
	bcs  52.b		; B0 34
	sbc $8557.w,X		; FD 57 85
	sbc $8FB4.w,Y		; F9 B4 8F
	ply		; 7A
	sty $5A64.w		; 8C 64 5A
	eor $A2.b		; 45 A2
	cmp ($3C.b)		; D2 3C
	eor $8FEA.w,Y		; 59 EA 8F
	mvp $8D,$C0		; 44 C0 8D
	and $88.b		; 25 88
	bcs -21.b		; B0 EB
	eor $675541.l,X		; 5F 41 55 67
	and ($8A.b)		; 32 8A
	tsb $54.b		; 04 54
	lda [$4A.b],Y		; B7 4A
	lda ($C7.b,S),Y		; B3 C7
	sbc $BD.b,X		; F5 BD
	asl A		; 0A
	ldy $E9.b,X		; B4 E9
	trb $F8.b		; 14 F8
	and $D78E.w,X		; 3D 8E D7
	and $55.b,X		; 35 55
	eor $CF7D.w,X		; 5D 7D CF
	cmp ($F8.b)		; D2 F8
	sed		; F8
	cmp $FE157F.l,X		; DF 7F 15 FE
	jmp ($5678.w)		; 6C 78 56
	tsb $76E3.w		; 0C E3 76
	stz $4F1E.w		; 9C 1E 4F
	cmp ($BF.b,X)		; C1 BF
	sbc [$B7.b],Y		; F7 B7
	sbc $F8F817.l,X		; FF 17 F8 F8
	clv		; B8
	ora $A7CB47.l,X		; 1F 47 CB A7
	sbc $5DB5.w		; ED B5 5D
	sty $9608.w		; 8C 08 96
	tsb $97E5.w		; 0C E5 97
	lda ($5E.b,S),Y		; B3 5E
	cmp #$F077.w		; C9 77 F0
	rtl		; 6B

	ldx $DC62.w		; AE 62 DC
	cmp [$C4.b]		; C7 C4
	iny		; C8
	cmp #$FFFE.w		; C9 FE FF
	phy		; 5A
	lda $F2E617.l,X		; BF 17 E6 F2
	eor ($FF.b),Y		; 51 FF
	and $E15F.w,X		; 3D 5F E1
	sta ($F0.b,S),Y		; 93 F0
	xba		; EB
	sei		; 78
	sei		; 78
	stz $1B1C.w,X		; 9E 1C 1B
	sbc $C13533.l		; EF 33 35 C1
	cmp [$F0.b],Y		; D7 F0
	rol $5E.b,X		; 36 5E
	cmp [$8B.b],Y		; D7 8B
	lda $E2DE4F.l		; AF 4F DE E2
	cpy $F8.b		; C4 F8
	jsr ($BFCD.w,X)		; FC CD BF
	cmp #$FBF3.w		; C9 F3 FB
	txy		; 9B
	cmp $1F2E.w		; CD 2E 1F
	inc $F84A.w,X		; FE 4A F8
	sbc $AC9C.w,Y		; F9 9C AC
	cmp $CD96FF.l		; CF FF 96 CD
	rtl		; 6B

	sbc ($5A.b,S),Y		; F3 5A
	ldy $F396.w,X		; BC 96 F3
	ora [$BC.b],Y		; 17 BC
	sbc $33.b,X		; F5 33
	inc A		; 1A
	stx $F1.b		; 86 F1
	dec $931F.w,X		; DE 1F 93
	bcc -92.b		; 90 A4
	sei		; 78
	jsr ($9771.w,X)		; FC 71 97
	stx $27F0.w		; 8E F0 27
	stz $6C.b		; 64 6C
	cpx #$C1.b		; E0 C1
	trb $F95D.w		; 1C 5D F9
	ldy $9E.b,X		; B4 9E
	sta ($02.b),Y		; 91 02
	ora [$6A.b]		; 07 6A
	sbc $42.b		; E5 42
	and $B47C.w,Y		; 39 7C B4
	jsl $EBEB74.l		; 22 74 EB EB
	bit $90.b		; 24 90
	rts		; 60

	txy		; 9B
	bra  24.b		; 80 18
	tsb $38.b		; 04 38
	dec $1127.w,X		; DE 27 11
	asl $2369.w		; 0E 69 23
	stx $018C.w		; 8E 8C 01
	cmp ($39.b,S),Y		; D3 39
	jmp ($F9EC.w)		; 6C EC F9
	adc $B50F.w,Y		; 79 0F B5
	wai		; CB
	pea $7EB9.w		; F4 B9 7E
	ldx $0B9B.w		; AE 9B 0B
	cmp ($D3.b,X)		; C1 D3
	cmp ($BB.b,S),Y		; D3 BB
	bvc -22.b		; 50 EA
	eor $03.b,S		; 43 03
	sbc ($10.b,S),Y		; F3 10
	mvn $8D,$14		; 54 14 8D
	cpy #$D1.b		; C0 D1
	sbc [$67.b]		; E7 67
	inc $EC27.w		; EE 27 EC
	and [$EB.b]		; 27 EB
	ldy $DDD3.w		; AC D3 DD
	lda $94.b		; A5 94
	sbc $F2EEAF.l,X		; FF AF EE F2
	sbc ($66.b,X)		; E1 66
	sbc $ED.b,X		; F5 ED
	xba		; EB
	sbc $DA.b,X		; F5 DA
	cmp [$52.b],Y		; D7 52
	dec $231E.w,X		; DE 1E 23
	ror $7ABB.w,X		; 7E BB 7A
	tad		; 5B
	cmp $EB1F0B.l		; CF 0B 1F EB
	eor [$E1.b]		; 47 E1
	asl $0D31.w		; 0E 31 0D
	sbc $9FE62D.l,X		; FF 2D E6 9F
	sta ($6D.b,X)		; 81 6D
	bit $6D71.w,X		; 3C 71 6D
	ldx $D3.b,Y		; B6 D3
	eor ($66.b,S),Y		; 53 66
	cmp $60DD.w,X		; DD DD 60
	eor $3F9F.w		; 4D 9F 3F
	xba		; EB
	cpy #$A1.b		; C0 A1
	rti		; 40

	jmp ($8C74.w)		; 6C 74 8C
	cmp $AA.b		; C5 AA
	cpx $AB8B.w		; EC 8B AB
	bvc  43.b		; 50 2B
	cpy $CE9D.w		; CC 9D CE
	sbc [$51.b]		; E7 51
	lda $85.b,S		; A3 85
	sta $D0.b		; 85 D0
	lda ($F6.b,X)		; A1 F6
	sbc ($7C.b,X)		; E1 7C
	lda $84DB27.l,X		; BF 27 DB 84
	stz $E811.w		; 9C 11 E8
	tya		; 98
	sbc $1225.w,X		; FD 25 12
	ldy $4B.b		; A4 4B
	asl $95.b,X		; 16 95
	and [$61.b]		; 27 61
	rtl		; 6B

	cmp #$FCFA.w		; C9 FA FC
	adc $9F3F1B.l,X		; 7F 1B 3F 9F
	stx $C7.b		; 86 C7
	eor $C1D5.w,Y		; 59 D5 C1
	bra -26.b		; 80 E6
	phk		; 4B
	cmp ($4A.b),Y		; D1 4A
	sta $312D.w,X		; 9D 2D 31
	adc ($9F.b)		; 72 9F
	and #$DA3D.w		; 29 3D DA
	stz $4A.b,X		; 74 4A
	tsb $22B3.w		; 0C B3 22
	mvp $D2,$E9		; 44 E9 D2
	sbc $4A.b		; E5 4A
	stz $6C.b,X		; 74 6C
	brk $9E.b		; 00 9E
	eor $3A3127.l		; 4F 27 31 3A
	nop		; EA
	eor ($AD.b,S),Y		; 53 AD
	rol $D8.b,X		; 36 D8
	eor $21.b,S		; 43 21
	bit #$4545.w		; 89 45 45
	ply		; 7A
	.db $42, $40		; 42 40
	cop $43.b		; 02 43
	sbc ($20.b,X)		; E1 20
	ora ($29.b)		; 12 29
	sty $C0.b		; 84 C0
	pha		; 48
	tax		; AA
	trb $01.b		; 14 01
	beq -124.b		; F0 84
	rol A		; 2A
	ora $E1.b,S		; 03 E1
	adc ($E0.b,X)		; 61 E0
	ora $D04388.l		; 0F 88 43 D0
	ora $C02215.l,X		; 1F 15 22 C0
	rol $8B22.w,X		; 3E 22 8B
	sta ($4C.b,X)		; 81 4C
	and ($0F.b,X)		; 21 0F
	bra -90.b		; 80 A6
	asl $1F.b,X		; 16 1F
	sta ($4C.b,X)		; 81 4C
	.db $42, $29		; 42 29
	brk $A6.b		; 00 A6
	rol A		; 2A
	pha		; 48
	brk $53.b		; 00 53
	ora ($4A.b),Y		; 11 4A
	bvc  42.b		; 50 2A
	sty $C8.b		; 84 C8
	jsr $0F55.w		; 20 55 0F
	iny		; C8
	rti		; 40

	eor $10.b,X		; 55 10
	dec $00.b		; C6 00
	tax		; AA
	rol A		; 2A
	dex		; CA
	rts		; 60

	ora ($13.b)		; 12 13
	eor #$94EA.w		; 49 EA 94
	tax		; AA
	cmp $3F.b,X		; D5 3F
	sta [$0E.b]		; 87 0E
	tsa		; 3B
	ora $7A.b		; 05 7A
	eor #$A326.w		; 49 26 A3
	cmp [$AF.b]		; C7 AF
	ldy #$C3.b		; A0 C3
	lda $B652.w		; AD 52 B6
	lda $56D12F.l,X		; BF 2F D1 56
	sbc $72.b,X		; F5 72
	jmp ($3B35.w)		; 6C 35 3B
	ora $8B4F.w		; 0D 4F 8B
	ldy $DA.b		; A4 DA
	stz $2A.b,X		; 74 2A
	bmi  98.b		; 30 62
	adc ($E3.b,S),Y		; 73 E3
	sbc $16DE.w,X		; FD DE 16
	adc $2B.b,S		; 63 2B
	tya		; 98
	xce		; FB
	lda $7C.b,X		; B5 7C
	adc $FDA2D7.l		; 6F D7 A2 FD
	adc $EDD7.w,X		; 7D D7 ED
	inc $5FBF.w		; EE BF 5F
	cmp $5CD9FE.l,X		; DF FE D9 5C
	and $1CDD.w,X		; 3D DD 1C
	lda $861E.w,X		; BD 1E 86
	lda [$C3.b]		; A7 C3
	sta $74D47B.l		; 8F 7B D4 74
	sbc $3A.b,X		; F5 3A
	ldy $67A6.w		; AC A6 67
	xce		; FB
	inc $7F.b		; E6 7F
	tyx		; BB
	eor $9BCBDB.l,X		; 5F DB CB 9B
	xce		; FB
	sei		; 78
	plx		; FA
	lda $2F39B7.l,X		; BF B7 39 2F
	ldx $CCB5.w,Y		; BE B5 CC
	eor $D7.b,X		; 55 D7
	eor $75.b,X		; 55 75
	sec		; 38
	dey		; 88
	ldy $B8.b,X		; B4 B8
	sta [$B4.b]		; 87 B4
	txa		; 8A
	rol A		; 2A
	sta ($66.b)		; 92 66
	stx $DB.b		; 86 DB
	ora [$23.b],Y		; 17 23
	lda $B2.b		; A5 B2
	lda [$89.b]		; A7 89
	eor $5D.b,X		; 55 5D
	phk		; 4B
	ora $EA.b		; 05 EA
	dex		; CA
	plp		; 28
	sta ($09.b),Y		; 91 09
	pha		; 48
	cmp ($DD.b),Y		; D1 DD
	trb $53.b		; 14 53
	ldx $AB.b,Y		; B6 AB
	sbc $E9.b		; E5 E9
	sta ($25.b),Y		; 91 25
	bit $A9.b		; 24 A9
	sep #$4E		; E2 4E
	cpx #$08.b		; E0 08
	adc [$D5.b],Y		; 77 D5
	adc [$CF.b],Y		; 77 CF
	ror A		; 6A
	sbc ($B1.b,X)		; E1 B1
	ora ($26.b,S),Y		; 13 26
	eor #$7999.w		; 49 99 79
	and ($F2.b)		; 32 F2
	stz $99.b		; 64 99
	sta [$92.b],Y		; 97 92
	stz $FF.b		; 64 FF
	jmp ($A3B3.w,X)		; 7C B3 A3
	rts		; 60

	ora $60.b,S		; 03 60
	dec A		; 3A
	dec A		; 3A
	ldx $CEEE.w		; AE EE CE
	sbc ($DF.b)		; F2 DF
	sta $FBF3E1.l,X		; 9F E1 F3 FB
	ror $E287.w,X		; 7E 87 E2
	plb		; AB
	sbc ($BF.b)		; F2 BF
	ora [$99.b],Y		; 17 99
	lda #$BBFE.w		; A9 FE BB
	cpy #$6D.b		; C0 6D
	plb		; AB
	sbc [$6F.b]		; E7 6F
	sta $CDDE.w,X		; 9D DE CD
	sbc $7513.w,X		; FD 13 75
	sta [$5C.b],Y		; 97 5C
	tad		; 5B
	jmp ($CE55.w,X)		; 7C 55 CE
	adc $61F821.l,X		; 7F 21 F8 61
	jmp $CA465A.l		; 5C 5A 46 CA
	xce		; FB
	phy		; 5A
	pld		; 2B
	sbc $377B5B.l,X		; FF 5B 7B 37
	sty $62EE.w		; 8C EE 62
	rtl		; 6B

	eor ($A5.b)		; 52 A5
	eor $BACA.w,X		; 5D CA BA
	sta $368C3D.l		; 8F 3D 8C 36
	eor ($F3.b),Y		; 51 F3
	inc $DF.b,X		; F6 DF
	adc [$51.b]		; 67 51
	dec $AA.b,X		; D6 AA
	wai		; CB
	cmp ($C5.b),Y		; D1 C5
	stz $17.b,X		; 74 17
	jsr ($1DFB.w,X)		; FC FB 1D
	stx $1D.b,Y		; 96 1D
	jmp ($AF97.w,X)		; 7C 97 AF
	eor [$17.b]		; 47 17
	lda $C0.b		; A5 C0
	ldx $D5AE.w		; AE AE D5
	ror A		; 6A
	bcc -30.b		; 90 E2
	inc $CD.b		; E6 CD
	cmp [$5B.b],Y		; D7 5B
	stz $5653.w		; 9C 53 56
	sec		; 38
	ldy $38.b,X		; B4 38
	lsr A		; 4A
	pha		; 48
	sbc ($39.b,X)		; E1 39
	sta [$93.b],Y		; 97 93
	bit $A2.b		; 24 A2
	.db $62, $1C, $F7		; 62 1C F7
	sta [$9A.b],Y		; 97 9A
	adc $6E37.w		; 6D 37 6E
	sbc $06.b		; E5 06
	cmp [$16.b]		; C7 16
	cmp ($70.b),Y		; D1 70
	adc $07FD.w		; 6D FD 07
	rol $152B.w		; 2E 2B 15
	asl $3618.w		; 0E 18 36
	dec A		; 3A
	jmp ($DAF4.w,X)		; 7C F4 DA
	sta $D8B1.w		; 8D B1 D8
	sta $10C929.l,X		; 9F 29 C9 10
	jmp $B124.w		; 4C 24 B1
	asl A		; 0A
	sbc #$166E.w		; E9 6E 16
	txy		; 9B
	eor $EA.b,S		; 43 EA
	plx		; FA
	sta ($6E.b,S),Y		; 93 6E
	sta [$19.b]		; 87 19
	sbc $F512.w,Y		; F9 12 F5
	sty $E4.b,X		; 94 E4
	eor [$4A.b],Y		; 57 4A
	txs		; 9A
	sec		; 38
	ldx $C6.b,Y		; B6 C6
	phb		; 8B
	ldx $DD.b		; A6 DD
	ror $74.b,X		; 76 74
	cpx $EE09.w		; EC 09 EE
	jmp ($CD29.w)		; 6C 29 CD
	ldx $D3.b,Y		; B6 D3
	lda ($A5.b),Y		; B1 A5
	ora ($86.b),Y		; 11 86
	clc		; 18
	jmp $14585D.l		; 5C 5D 58 14
	plp		; 28
	lsr $CE9D.w		; 4E 9D CE
	sta $3A8F46.l,X		; 9F 46 8F 3A
	adc $141A.w,X		; 7D 1A 14
	plp		; 28
	bne -94.b		; D0 A2
	rol A		; 2A
	rti		; 40

	eor $98E8.w		; 4D E8 98
	pea $4C4C.w		; F4 4C 4C
	lsr $2A7F.w		; 4E 7F 2A
	adc $5D17.w,X		; 7D 17 5D
.ACCU 8
.INDEX 8
	sep #$F1		; E2 F1
	sbc $637306.l,X		; FF 06 73 63
	lda ($D9.b),Y		; B1 D9
	cpx $32E2.w		; EC E2 32
	tax		; AA
	ror A		; 6A
	ldx $9D.b		; A6 9D
	txs		; 9A
	adc $C9.b,X		; 75 C9
	inc $75CB.w		; EE CB 75
	adc $A1D5.w		; 6D D5 A1
	jsl $B9B445.l		; 22 45 B4 B9
	cmp ($67.b,S),Y		; D3 67
	tsa		; 3B
	and $D6.b,X		; 35 D6
	jmp.w [$13C0]		; DC C0 13
	cmp [$9E.b],Y		; D7 9E
	cpy $E8.b		; C4 E8
	sbc ($A3.b,S),Y		; F3 A3
	eor $731B.w		; 4D 1B 73
	tsb $32.b		; 04 32
	clc		; 18
	eor $47.b		; 45 47
	lsr $09.b		; 46 09
	stx $F829.w		; 8E 29 F8
	bcc   1.b		; 90 01
	tsb $004C.w		; 0C 4C 00
	plb		; AB
	trb $01.b		; 14 01
	adc ($08.b),Y		; 71 08
	mvn $C5,$05		; 54 05 C5
	sta [$80.b]		; 87 80
	rol $1E42.w		; 2E 42 1E
	bra -71.b		; 80 B9
	eor ($2C.b)		; 52 2C
	cop $E4.b		; 02 E4
	eor ($70.b),Y		; 51 70
	clc		; 18
	bpl -121.b		; 10 87
	cpy #$30.b		; C0 30
	bit $013F.w		; 2C 3F 01
	.db $82, $11, $48		; 82 11 48
	ora $05.b,S		; 03 05
	eor #$00.b		; 49 00
	asl $08.b		; 06 08
	lda $28.b		; A5 28
	tsb $9089.w		; 0C 89 90
	rti		; 40

	stz $7E.b		; 64 7E
	.db $42, $01		; 42 01
	sta ($18.b)		; 92 18
	cpy #$0C.b		; C0 0C
	sta $65.b,X		; 95 65
	bmi  10.b		; 30 0A
	ora $3F1E13.l		; 0F 13 1E 3F
	sta $0D.b,S		; 83 0D
	jmp ($38B3.w,X)		; 7C B3 38
	nop		; EA
	inc $22EB.w,X		; FE EB 22
	txs		; 9A
	txa		; 8A
	ldy $D4A3.w		; AC A3 D4
	sbc #$71.b		; E9 71
	and $B8.b,X		; 35 B8
	jmp.w [$D99B]		; DC 9B D9
	ora $79C7.w,X		; 1D C7 79
	stp		; DB
	cmp ($D6.b,S),Y		; D3 D6
	ror $69.b		; 66 69
	sbc ($3F.b,S),Y		; F3 3F
	asl $67.b		; 06 67
	cpx #$D0.b		; E0 D0
	jmp ($7F1A.w,X)		; 7C 1A 7F
	sta $33.b,S		; 83 33
	sbc ($AD.b)		; F2 AD
	jmp.w [$E268]		; DC 68 E2
	pla		; 68
.ACCU 8
	sep #$68		; E2 68
	inc $33.b,X		; F6 33
	sbc $D50B8F.l,X		; FF 8F 0B D5
	inc $76.b,X		; F6 76
	tya		; 98
	trb $0F2C.w		; 1C 2C 0F
	.db $82, $D3, $07		; 82 D3 07
	eor #$C4.b		; 49 C4
	phk		; 4B
	ora ($DF.b),Y		; 11 DF
	ldx $E9C8.w,Y		; BE C8 E9
	and ($36.b),Y		; 31 36
	sta $F6.b,X		; 95 F6
	and $1B78B6.l		; 2F B6 78 1B
	jmp $1E0E.w		; 4C 0E 1E
	ora $5E.b		; 05 5E
	sta [$B4.b],Y		; 97 B4
	cmp ($F7.b)		; D2 F7
	ora $A7DD.w,X		; 1D DD A7
	sta $D2.b,S		; 83 D2
	sbc $31.b		; E5 31
	bvs -45.b		; 70 D3
	bra -92.b		; 80 A4
	inc A		; 1A
	mvn $26,$DE		; 54 DE 26
	bit $90.b		; 24 90
	clc		; 18
	cpy $22B6.w		; CC B6 22
	lda ($4A.b),Y		; B1 4A
	eor [$F4.b],Y		; 57 F4
	tax		; AA
	ldy $899A.w		; AC 9A 89
	bit $01.b		; 24 01
	sta $09535A.l		; 8F 5A 53 09
	ror A		; 6A
	dec $5A.b,X		; D6 5A
	trb $29.b		; 14 29
	and ($79.b)		; 32 79
	jmp ($92B4.w,X)		; 7C B4 92
	dex		; CA
	iny		; C8
	clv		; B8
	sbc $94.b		; E5 94
	eor #$E4.b		; 49 E4
	sbc ($D1.b,X)		; E1 D1
	bit #$93.b		; 89 93
	sec		; 38
	stz $2244.w		; 9C 44 22
	sbc ($F3.b)		; F2 F3
	bit #$C4.b		; 89 C4
	sta $F232.w,Y		; 99 32 F2
	sbc ($66.b)		; F2 66
	tay		; A8
	jmp ($038C.w)		; 6C 8C 03
	mvp $B1,$61		; 44 61 B1
	lda ($BB.b,X)		; A1 BB
	cmp $7BDE.w		; CD DE 7B
	lda $2793.w,Y		; B9 93 27
	and $ED9E.w,X		; 3D 9E ED
	jmp $870CB9.l		; 5C B9 0C 87
	cpx $F872.w		; EC 72 F8
	stx $A251.w		; 8E 51 A2
	inx		; E8
	stz $BA.b,X		; 74 BA
	and [$05.b],Y		; 37 05
	sbc $1EDE.w,Y		; F9 DE 1E
	ora $DEE5AE.l		; 0F AE E5 DE
	sbc $5F.b,X		; F5 5F
	and $AB359B.l,X		; 3F 9B 35 AB
	ldx $BE.b,Y		; B6 BE
	tyx		; BB
	asl $A5CB.w,X		; 1E CB A5
	sbc $B14C6C.l		; EF 6C 4C B1
	sta [$2B.b],Y		; 97 2B
	dey		; 88
	ldx $B8C2.w		; AE C2 B8
	eor ($E9.b,S),Y		; 53 E9
	cmp $EE.b,X		; D5 EE
	eor $93BB.w,X		; 5D BB 93
	ora $190389.l		; 0F 89 03 19
	sta ($1C.b),Y		; 91 1C
	stz $C7.b		; 64 C7
	stz $CD.b		; 64 CD
	sbc $AC6D.w		; ED 6D AC
	cpx $8E.b		; E4 8E
	rol $C4D4.w		; 2E D4 C4
	pei ($6A.b)		; D4 6A
	ror $51.b		; 66 51
	eor $9E.b,S		; 43 9E
	txa		; 8A
	trb $73F7.w		; 1C F7 73
	sta ($E5.b,S),Y		; 93 E5
	and [$AB.b]		; 27 AB
	pha		; 48
	adc ($88.b),Y		; 71 88
	bvs -108.b		; 70 94
	sta ($C2.b),Y		; 91 C2
	adc [$97.b],Y		; 77 97
	sta ($24.b,S),Y		; 93 24
	ldx #$F1.b		; A2 F1
	asl $D635.w		; 0E 35 D6
	stp		; DB
	trb $AA21.w		; 1C 21 AA
	cmp $7F.b,X		; D5 7F
	lda [$2D.b]		; A7 2D
	sta $85.b		; 85 85
	lda $26A8.w		; AD A8 26
	txy		; 9B
	cmp [$94.b]		; C7 94
	stz $AB21.w,X		; 9E 21 AB
	dec A		; 3A
	and $82.b,S		; 23 82
	ply		; 7A
	jsl $6E0804.l		; 22 04 08 6E
	adc [$02.b]		; 67 02
	adc [$F2.b]		; 67 F2
	lda $E0.b,S		; A3 E0
	rts		; 60

	lsr $1C.b		; 46 1C
	stz $B8.b		; 64 B8
	pha		; 48
	phk		; 4B
	sta ($5D.b),Y		; 91 5D
	rol $68.b,X		; 36 68
	sbc $9D.b,S		; E3 9D
	ror $6D.b,X		; 76 6D
	sbc $04DE.w,X		; FD DE 04
	lda $ACBB.w,Y		; B9 BB AC
	rol $F914.w		; 2E 14 F9
	sbc $6E.b,S		; E3 6E
	sty $68.b		; 84 68
	cpy $BB32.w		; CC 32 BB
	bit $05.b		; 24 05
	eor $79.b		; 45 79
	pei ($39.b)		; D4 39
	pei ($68.b)		; D4 68
	adc ($B9.b,S),Y		; 73 B9
	pei ($79.b)		; D4 79
	tya		; 98
	jmp ($C8E9.w,X)		; 7C E9 C8
	cmp $E7.b,S		; C3 E7
	sbc ($5E.b),Y		; F1 5E
	ldx $AA.b		; A6 AA
	.db $62, $6A, $A6		; 62 6A A6
	jsr ($2C7A.w,X)		; FC 7A 2C
	sta ($C9.b)		; 92 C9
	adc ($7B.b,S),Y		; 73 7B
	inc A		; 1A
	bit $1FAA.w,X		; 3C AA 1F
	tsx		; BA
	ora $F5.b,S		; 03 F5
	cmp $7E.b,X		; D5 7E
	plb		; AB
	and ($31.b),Y		; 31 31
	lda ($16.b)		; B2 16
	lsr A		; 4A
	php		; 08
	tax		; AA
	rtl		; 6B

	sbc ($C1.b,X)		; E1 C1
	inc $3F.b		; E6 3F
	cmp $5F.b,S		; C3 5F
	asl A		; 0A
	and [$1E.b]		; 27 1E
	cmp [$3B.b],Y		; D7 3B
	jsl $9DB333.l		; 22 33 B3 9D
	txy		; 9B
	and $B6.b,X		; 35 B6
	txy		; 9B
	jmp ($3006.w)		; 6C 06 30
	ora [$9E.b],Y		; 17 9E
	lsr $C626.w		; 4E 26 C6
	txs		; 9A
	cmp ($AD.b,S),Y		; D3 AD
	ldx $10.b,Y		; B6 10
	iny		; C8
	adc ($15.b,X)		; 61 15
	ora $2618.w,X		; 1D 18 26
	sec		; 38
	lda [$E2.b]		; A7 E2
	rti		; 40

	tsb $31.b		; 04 31
	bmi   2.b		; 30 02
	ldy $0550.w		; AC 50 05
	cpy $21.b		; C4 21
	bvc  23.b		; 50 17
	asl $1E.b,X		; 16 1E
	brk $B9.b		; 00 B9
	php		; 08
	ply		; 7A
	cop $E5.b		; 02 E5
	pha		; 48
	bcs  11.b		; B0 0B
	sta ($45.b),Y		; 91 45
	cpy #$60.b		; C0 60
	.db $42, $1F		; 42 1F
	brk $C0.b		; 00 C0
	bcs  -4.b		; B0 FC
	asl $08.b		; 06 08
	eor $20.b		; 45 20
	tsb $2415.w		; 0C 15 24
	brk $18.b		; 00 18
	jsl $32A094.l		; 22 94 A0 32
	rol $41.b		; 26 41
	ora ($91.b,X)		; 01 91
	sbc $0608.w,Y		; F9 08 06
	pha		; 48
	adc $00.b,S		; 63 00
	and ($55.b)		; 32 55
	sty $C0.b,X		; 94 C0
	cop $4A.b		; 02 4A
	rol $98.b		; 26 98
	plb		; AB
	phd		; 0B
	phb		; 8B
	cpx $52.b		; E4 52
	adc $4988.w,Y		; 79 88 49
	and ($45.b,X)		; 21 45
	lsr $5E.b,X		; 56 5E
	ora ($11.b,S),Y		; 13 11
	eor $8DA9.w,Y		; 59 A9 8D
	adc [$1B.b]		; 67 1B
	and $43D5.w		; 2D D5 43
	eor $EB9E.w,X		; 5D 9E EB
	and ($D4.b),Y		; 31 D4
	dec $5D.b,X		; D6 5D
	lsr $FE.b		; 46 FE
	bcc -10.b		; 90 F6
	sed		; F8
	lda $9791E7.l		; AF E7 91 97
	cmp $1AD14B.l,X		; DF 4B D1 1A
	ldx $BB.b		; A6 BB
	lda $47BC.w,Y		; B9 BC 47
	adc $7E33.w,Y		; 79 33 7E
	eor $EDBE.w,Y		; 59 BE ED
	cmp ($91.b),Y		; D1 91
	cpx $3023.w		; EC 23 30
	phy		; 5A
	cmp $B544.w,Y		; D9 44 B5
	adc ($8B.b,X)		; 61 8B
	php		; 08
	bcc  29.b		; 90 1D
	eor ($F9.b,X)		; 41 F9
	and $D174.w		; 2D 74 D1
	pea $F4D2.w		; F4 D2 F4
	eor ($F4.b)		; 52 F4
	wai		; CB
	sbc $64.b		; E5 64
	stz $AC.b		; 64 AC
	asl $78C0.w,X		; 1E C0 78
	rep #$CF		; C2 CF
	cmp ($7A.b)		; D2 7A
	sta ($D1.b,S),Y		; 93 D1
	jsr $9D32.w		; 20 32 9D
	eor $6D.b		; 45 6D
	eor $4A64.w,X		; 5D 64 4A
	cli		; 58
	pld		; 2B
	and $6459.w,X		; 3D 59 64
	sta ($04.b)		; 92 04
	dey		; 88
	lsr A		; 4A
	adc #$2A.b		; 69 2A
	lda $FA.b,X		; B5 FA
	sbc $CA96.w,X		; FD 96 CA
	bit $9359.w		; 2C 59 93
	and $4A122F.l		; 2F 2F 12 4A
	stz $C725.w,X		; 9E 25 C7
	plp		; 28
	stz $264E.w,X		; 9E 4E 26
	sta $218D.w		; 8D 8D 21
	ora ($26.b,S),Y		; 13 26
	and ($C7.b,X)		; 21 C7
	eor ($01.b),Y		; 51 01
	lda ($C7.b),Y		; B1 C7
	ldx #$8A.b		; A2 8A
	plp		; 28
	lda ($17.b,X)		; A1 17
	sta [$93.b],Y		; 97 93
	rol $5E.b		; 26 5E
	lsr $B367.w,X		; 5E 67 B3
	cmp [$97.b],Y		; D7 97
	sta $8A.b,S		; 83 8A
	pla		; 68
	jmp ($BA68.w)		; 6C 68 BA
	inc A		; 1A
	eor $F66C.w,Y		; 59 6C F6
	adc $1745.w,Y		; 79 45 17
	eor $6339F4.l,X		; 5F F4 39 63
	eor $9B2F.w,X		; 5D 2F 9B
	eor [$08.b],Y		; 57 08
	stz $145D.w,X		; 9E 5D 14
	ora $37E7B8.l		; 0F B8 E7 37
	and ($AB.b),Y		; 31 AB
	cmp #$D0.b		; C9 D0
	sta ($E8.b)		; 92 E8
	and [$31.b]		; 27 31
	tay		; A8
	ldx $C103.w,Y		; BE 03 C1
	cmp $DB.b		; C5 DB
	xba		; EB
	adc $4BD31D.l		; 6F 1D D3 4B
	ldx $98.b,Y		; B6 98
	sec		; 38
	ldx $07.b,Y		; B6 07
	tyx		; BB
	adc $7E14B1.l,X		; 7F B1 14 7E
	ldy $61.b		; A4 61
	and $9A.b,S		; 23 9A
	sta $091DA5.l		; 8F A5 1D 09
	cmp ($BC.b,S),Y		; D3 BC
	inc $0AE6.w		; EE E6 0A
	eor #$0E.b		; 49 0E
	and ($18.b),Y		; 31 18
	pha		; 48
	adc ($73.b,S),Y		; 73 73
	bne -29.b		; D0 E3
	bit $8E.b		; 24 8E
	ora ($93.b,S),Y		; 13 93
	lda $93.b,X		; B5 93
	and $0E.b		; 25 0E
	ror $3882.w		; 6E 82 38
	plp		; 28
	sbc [$23.b]		; E7 23
	lda ($85.b,X)		; A1 85
	sty $D0.b		; 84 D0
	inx		; E8
	sbc $E9.b,S		; E3 E9
	and [$4E.b]		; 27 4E
	cpy #$C0.b		; C0 C0
	lda $B06DBF.l,X		; BF BF 6D B0
	ora [$8F.b]		; 07 8F
	and ($99.b)		; 32 99
	.db $42, $11		; 42 11
	eor ($64.b)		; 52 64
	ora #$82.b		; 09 82
	tsb $08.b		; 04 08
	ora ($F2.b),Y		; 11 F2
	jsr ($7C89.w,X)		; FC 89 7C
	ror $F8A5.w,X		; 7E A5 F8
	sbc $90.b,S		; E3 90
	cpx $8F9F.w		; EC 9F 8F
	ora $E36836.l,X		; 1F 36 68 E3
	tas		; 1B
	sty $B1EB.w		; 8C EB B1
	txy		; 9B
	sta [$35.b],Y		; 97 35
	bit #$DB.b		; 89 DB
	tsb $6C2C.w		; 0C 2C 6C
	sbc $6473.w,X		; FD 73 64
	cld		; D8
	cmp ($89.b),Y		; D1 89
	jmp $BA32.w		; 4C 32 BA
.ACCU 8
	sep #$EA		; E2 EA
	tax		; AA
	eor ($E3.b),Y		; 51 E3
	bne -30.b		; D0 E2
	cmp $3D73DF.l		; CF DF 73 3D
	dec $FB86.w,X		; DE 86 FB
	sta $C747.w,Y		; 99 47 C7
	sbc $79.b		; E5 79
	rol $D49B.w,X		; 3E 9B D4
	cpy $DE.b		; C4 DE
	bcc  19.b		; 90 13
	eor ($E6.b),Y		; 51 E6
	sta $95ACF2.l,X		; 9F F2 AC 95
	ldx #$5E.b		; A2 5E
	lsr $C753.w		; 4E 53 C7
	pea $56FF.w		; F4 FF 56
	cmp $5D8A7B.l,X		; DF 7B 8A 5D
	sec		; 38
	rol A		; 2A
	sbc $D5.b,S		; E3 D5
	tay		; A8
	lda ($B4.b)		; B2 B4
	lsr A		; 4A
	cmp ($2C.b),Y		; D1 2C
	cpx $35.b		; E4 35
	sbc ($3A.b),Y		; F1 3A
	and $F2BC23.l,X		; 3F 23 BC F2
	tsa		; 3B
	cmp $C65E22.l		; CF 22 5E C6
	ldx #$44.b		; A2 44
	tda		; 7B
	lda $F3B7.w,Y		; B9 B7 F3
	txs		; 9A
	adc $C6D6.w		; 6D D6 C6
	cpy #$F0.b		; C0 F0
	ror $3C.b,X		; 76 3C
	pld		; 2B
	ora [$63.b]		; 07 63
	jmp.w [$BA4B]		; DC 4B BA
	sty $D3.b,X		; 94 D3
	lda $10B6.w		; AD B6 10
	iny		; C8
	.db $62, $51, $51		; 62 51 51
	cmp ($A4.b),Y		; D1 A4
	bit $00.b		; 24 00
	bit $3E.b		; 24 3E
	ora ($01.b)		; 12 01
	jsl $044C98.l		; 22 98 4C 04
	txa		; 8A
	lda ($40.b,X)		; A1 40
	ora $A04208.l,X		; 1F 08 42 A0
	rol $1E16.w,X		; 3E 16 1E
	brk $F8.b		; 00 F8
	sty $3D.b		; 84 3D
	ora ($F1.b,X)		; 01 F1
	eor ($2C.b)		; 52 2C
	ora $E2.b,S		; 03 E2
	plp		; 28
	clv		; B8
	trb $C2.b		; 14 C2
	bpl  -8.b		; 10 F8
	asl A		; 0A
	adc ($61.b,X)		; 61 61
	sed		; F8
	trb $C4.b		; 14 C4
	jsl $620A90.l		; 22 90 0A 62
	ldy $80.b		; A4 80
	ora $31.b		; 05 31
	trb $A5.b		; 14 A5
	cop $A8.b		; 02 A8
	jmp $0582.w		; 4C 82 05
	bvc  -4.b		; 50 FC
	sty $05.b		; 84 05
	eor ($0C.b),Y		; 51 0C
	rts		; 60

	asl A		; 0A
	ldx #$AC.b		; A2 AC
	ldx $01.b		; A6 01
	and ($45.b),Y		; 31 45
	asl $81BD.w,X		; 1E BD 81
	cop $AA.b		; 02 AA
	plb		; AB
	and $4F.b		; 25 4F
	sta ($C9.b)		; 92 C9
	pla		; 68
	pld		; 2B
	pei ($50.b)		; D4 50
	bvc  88.b		; 50 58
	sty $57.b		; 84 57
	lsr $B2.b		; 46 B2
	bit $B79A.w		; 2C 9A B7
	cmp $AD66.w		; CD 66 AD
	and $AA35.w		; 2D 35 AA
	phy		; 5A
	phy		; 5A
	rtl		; 6B

	sbc $FE.b,X		; F5 FE
	stp		; DB
	stx $D3.b,Y		; 96 D3
	sta ($99.b,X)		; 81 99
	cpy $C496.w		; CC 96 C4
	ldx $E8.b,Y		; B6 E8
	and [$38.b],Y		; 37 38
	stz $1361.w,X		; 9E 61 13
	txa		; 8A
	asl $97C3.w,X		; 1E C3 97
	stp		; DB
	adc ($FA.b)		; 72 FA
	inc $E95E.w		; EE 5E E9
	wai		; CB
	dec $D0.b		; C6 D0
	eor $F695.w		; 4D 95 F6
	adc [$F2.b],Y		; 77 F2
	bit $13.b		; 24 13
	cpy $9C23.w		; CC 23 9C
	cmp $E816.w,X		; DD 16 E8
	rol $86.b,X		; 36 86
	inx		; E8
	lda $32.b,X		; B5 32
	phx		; DA
	mvp $98,$48		; 44 48 98
	plx		; FA
	nop		; EA
	sta $94.b,X		; 95 94
	eor $A257.w,Y		; 59 57 A2
	eor #$0D.b		; 49 0D
	jmp $268D.w		; 4C 8D 26
	bit $96.b,X		; 34 96
	jsl $5908AF.l		; 22 AF 08 59
	and $12.b,X		; 35 12
	eor #$42.b		; 49 42
	phx		; DA
	tyx		; BB
	cmp ($D3.b),Y		; D1 D3
	eor #$B3.b		; 49 B3
	sta $0E31.w,Y		; 99 31 0E
	ror A		; 6A
	plp		; 28
	.db $42, $AB		; 42 AB
	adc [$3D.b],Y		; 77 3D
	cmp ($57.b,S),Y		; D3 57
	adc $A3.b,S		; 63 A3
	rts		; 60

	brk $87.b		; 00 87
	ora ($45.b),Y		; 11 45
	asl $8A2A.w		; 0E 2A 8A
	plp		; 28
	stx $A313.w		; 8E 13 A3
	eor ($14.b,X)		; 41 14
	bpl -30.b		; 10 E2
	plp		; 28
	lda $9E.b,S		; A3 9E
	txa		; 8A
	plp		; 28
	.db $42, $43		; 42 43
	sty $AD.b		; 84 AD
	sbc $C7FC.w		; ED FC C7
	rol $1B37.w		; 2E 37 1B
	asl $0638.w,X		; 1E 38 06
	sbc [$7B.b],Y		; F7 7B
	sbc ($39.b),Y		; F1 39
	eor $9F69.w		; 4D 69 9F
	rol $8003.w,X		; 3E 03 80
	jsr $8140.w		; 20 40 81
	ora ($6F.b)		; 12 6F
	trb $E7.b		; 14 E7
	jsr ($63F2.w,X)		; FC F2 63
	stx $B931.w		; 8E 31 B9
	sta ($F8.b),Y		; 91 F8
	ora [$B4.b],Y		; 17 B4
	bit $C9.b		; 24 C9
	trb $CE5E.w		; 1C 5E CE
	mvn $1F,$08		; 54 08 1F
	ror $C6.b		; 66 C6
	sta $D08660.l		; 8F 60 86 D0
	cmp ($1B.b)		; D2 1B
	eor $AB.b		; 45 AB
	and ($CA.b,S),Y		; 33 CA
	trb $AA.b		; 14 AA
	bit $38.b		; 24 38
	cpy $34.b		; C4 34
	phb		; 8B
	pea $225D.w		; F4 5D 22
	.db $82, $28, $D1		; 82 28 D1
	ldy #$8B.b		; A0 8B
	adc #$9E.b		; 69 9E
	bpl -29.b		; 10 E3
	eor ($01.b)		; 52 01
	lda ($DB.b)		; B2 DB
	adc $C8D0.w		; 6D D0 C8
	adc ($F5.b,S),Y		; 73 F5
	cli		; 58
	bit $BAAF.w,X		; 3C AF BA
	sbc ($0F.b,S),Y		; F3 0F
	sta $61E485.l		; 8F 85 E4 61
	ror $8A.b,X		; 76 8A
	sty $B4.b,X		; 94 B4
	plb		; AB
	ldx $AB0A.w		; AE 0A AB
	ora ($E4.b,X)		; 01 E4
	ora [$90.b],Y		; 17 90
	lsr $8340.w,X		; 5E 40 83
	ora ($BA.b)		; 12 BA
	tsb $28.b		; 04 28
	ora $BE521F.l		; 0F 1F 52 BE
	sta ($4A.b,X)		; 81 4A
	lda $41CFE2.l,X		; BF E2 CF 41
	xce		; FB
	rts		; 60

	sbc $4F58B8.l,X		; FF B8 58 4F
	bmi -33.b		; 30 DF
	adc ($1F.b,S),Y		; 73 1F
	adc ($29.b,S),Y		; 73 29
	adc $A790.w,Y		; 79 90 A7
	ply		; 7A
	tsa		; 3B
	ror $FF4C.w,X		; 7E 4C FF
	lda $C7D6.w		; AD D6 C7
	ora $0603.w,Y		; 19 03 06
	sta ($EE.b,S),Y		; 93 EE
	sbc ($D9.b,X)		; E1 D9
	rol $D8.b,X		; 36 D8
.INDEX 8
	sep #$DB		; E2 DB
	adc $5DA7.w		; 6D A7 5D
	ror $54FE.w		; 6E FE 54
	dec $27.b,X		; D6 27
	dec $9C.b		; C6 9C
	ldx $8015.w,Y		; BE 15 80
	stp		; DB
	adc $465D.w		; 6D 5D 46
	stx $C3.b,Y		; 96 C3
	ora $82.b		; 05 82
	xba		; EB
	tya		; 98
	cmp $68.b,X		; D5 68
	tas		; 1B
	tax		; AA
	bit #$E6.b		; 89 E6
	inc $CB.b,X		; F6 CB
	eor $54B4.w,Y		; 59 B4 54
	cmp $B8EF70.l,X		; DF 70 EF B8
	ror A		; 6A
	plb		; AB
	ror A		; 6A
	tay		; A8
	ldx $EE59.w		; AE 59 EE
	and [$3F.b]		; 27 3F
	adc ($9F.b,S),Y		; 73 9F
	sbc [$7C.b],Y		; F7 7C
	sbc $EFF7.w		; ED F7 EF
	ldx $EBE1.w,Y		; BE E1 EB
	rol $3D.b,X		; 36 3D
	adc [$C2.b]		; 67 C2
	sbc [$63.b],Y		; F7 63
	jmp.w [$8E7B]		; DC 7B 8E
	eor [$6C.b],Y		; 57 6C
	lda [$C6.b]		; A7 C6
	cmp $BE7B.w,X		; DD 7B BE
	adc [$BF.b],Y		; 77 BF
	jsr ($ACBA.w,X)		; FC BA AC
	adc $CE8F63.l,X		; 7F 63 8F CE
.ACCU 8
.INDEX 8
	sep #$BD		; E2 BD
	cmp $72CE.w		; CD CE 72
	cpy $B6.b		; C4 B6
	cmp $BACB.w		; CD CB BA
	lda $B5.b,X		; B5 B5
	txy		; 9B
	and #$B6.b		; 29 B6
	cmp [$15.b]		; C7 15
	clv		; B8
	dec $1EBB.w		; CE BB 1E
	inc $693C.w,X		; FE 3C 69
	lda $DB3A.w		; AD 3A DB
	rts		; 60

	clc		; 18
	lda ($A3.b,S),Y		; B3 A3
	asl $6576.w,X		; 1E 76 65
	adc $C1.b,S		; 63 C1
	cmp $3C.b		; C5 3C
	ora [$12.b],Y		; 17 12
	ora ($E0.b,X)		; 01 E0
	cpy #$98.b		; C0 98
	ora $004506.l		; 0F 06 45 00
	lda $2A.b		; A5 2A
	ora $40.b		; 05 40
	lda $20.b		; A5 20
	ora $15A500.l		; 0F 00 A5 15
	ora ($74.b,S),Y		; 13 74
	and #$4A.b		; 29 4A
	php		; 08
	ply		; 7A
	asl $20.b		; 06 20
	ora $80.b		; 05 80
	cpy $0B.b		; C4 0B
	phb		; 8B
	sta ($88.b,X)		; 81 88
	clc		; 18
	ora $198801.l,X		; 1F 01 88 19
	ora $055A81.l,X		; 1F 81 5A 05
	jsr $A215.w		; 20 15 A2
	cpx $00.b		; E4 00
	pld		; 2B
	lsr $0A.b		; 46 0A
	bvc  43.b		; 50 2B
	lsr $48.b		; 46 48
	jsr $C062.w		; 20 62 C0
	sty $06.b		; 84 06
	bit $605C.w		; 2C 5C 60
	tsb $C158.w		; 0C 58 C1
	jmp $2C06.w		; 4C 06 2C
	stz $86.b		; 64 86
	asl $38.b		; 06 38
	asl A		; 0A
	bvs  49.b		; 70 31
.ACCU 16
	rep #$E5		; C2 E5
	rti		; 40

	clc		; 18
	sbc ($83.b,X)		; E1 83
	bpl   6.b		; 10 06
	sec		; 38
	stz $C4.b		; 64 C4
	sta ($93.b,X)		; 81 93
	cop $A4.b		; 02 A4
	tsb $B898.w		; 0C 98 B8
	iny		; C8
	ora $8231.w,Y		; 19 31 82
	tay		; A8
	tsb $C998.w		; 0C 98 C9
	lsr $06.b,X		; 56 06
	jmp $32C00A.l		; 5C 0A C0 32
.ACCU 8
	sep #$E4		; E2 E4
	rti		; 40

	and ($E3.b)		; 32 E3
	ora $68.b		; 05 68
	ora $9271.w,Y		; 19 71 92
	clv		; B8
	ora $2942BE.l		; 0F BE 42 29
	brk $FB.b		; 00 FB
	sbc $49.b		; E5 49
	trb $0E.b		; 14 0E
	clv		; B8
	sty $46.b		; 84 46
	ora $AE.b,S		; 03 AE
	rol A		; 2A
	php		; 08
	cmp $6687.w		; CD 87 66
	eor $9D.b,X		; 55 9D
	bpl  28.b		; 10 1C
	dec $FD6E.w,X		; DE 6E FD
.ACCU 16
.INDEX 16
	rep #$3C		; C2 3C
	dec $FD6E.w,X		; DE 6E FD
	cmp $3C.b,S		; C3 3C
	dec $0568.w,X		; DE 68 05
	lda $B6.b,X		; B5 B6
	sbc $F3C5.w,X		; FD C5 F3
	adc $16A0.w,Y		; 79 A0 16
	dec $DB.b,X		; D6 DB
	sbc [$13.b],Y		; F7 13
	ldy $F873.w,X		; BC 73 F8
	lsr $575A.w		; 4E 5A 57
	rol $C4FD.w,X		; 3E FD C4
	sbc $13FE1C.l		; EF 1C FE 13
	stx $95.b,Y		; 96 95
	cmp $3671BF.l		; CF BF 71 36
	dec $C3.b,X		; D6 C3
	phb		; 8B
	cmp $6B9BB8.l,X		; DF B8 9B 6B
	adc ($C5.b,X)		; 61 C5
	sbc $116E.w,Y		; F9 6E 11
	cmp ($C1.b,X)		; C1 C1
	sbc ($DC.b)		; F2 DC
	and $83.b,S		; 23 83
	sta $73.b,S		; 83 73
	adc ($01.b)		; 72 01
	sta $83.b,S		; 83 83
	sbc $B8.b		; E5 B8
	tyx		; BB
	txy		; 9B
	bcc  12.b		; 90 0C
	trb $2D1F.w		; 1C 1F 2D
	cmp $8E.b		; C5 8E
	rol $E7E6.w		; 2E E6 E7
	cmp ($71.b)		; D2 71
	and $8B.b,S		; 23 8B
	lda $F4B9.w,Y		; B9 B9 F4
	stz $114A.w		; 9C 4A 11
	sta ($70.b)		; 92 70
	txa		; 8A
	ora ($92.b),Y		; 11 92
	bvs -40.b		; 70 D8
	cop $11.b		; 02 11
	sta ($71.b)		; 92 71
	ldy #$4308.w		; A0 08 43
	cmp [$1B.b],Y		; D7 1B
	iny		; C8
	cpx $3D.b		; E4 3D
	bvs -113.b		; 70 8F
	and $90.b,S		; 23 90
	sbc $C7.b,X		; F5 C7
	stx $EB2D.w		; 8E 2D EB
	phb		; 8B
	trb $835E.w		; 1C 5E 83
	eor ($A7.b,X)		; 41 A7
	adc ($3A.b),Y		; 71 3A
	sta $7A47.w		; 8D 47 7A
	sbc [$D3.b]		; E7 D3
	adc #$1AB4.w		; 69 B4 1A
	ora $893B.w		; 0D 3B 89
	pei ($6A.b)		; D4 6A
	tsa		; 3B
	cmp [$3E.b],Y		; D7 3E
	txy		; 9B
	eor $71A2.w		; 4D A2 71
	dec A		; 3A
	ora [$38.b]		; 07 38
	tsb $E9.b		; 04 E9
	phx		; DA
	and [$13.b]		; 27 13
	ldy #$8073.w		; A0 73 80
	lsr $1E9D.w		; 4E 9D 1E
	rol $CF45.w,X		; 3E 45 CF
	mvn $AC,$E7		; 54 E7 AC
	ldy $73AB.w		; AC AB 73
	cmp [$8F.b]		; C7 8F
	sta ($73.b),Y		; 91 73
	cmp $39.b,X		; D5 39
	xba		; EB
	pld		; 2B
	rol A		; 2A
	jmp.w [$60F0]		; DC F0 60
	cpy #$2371.w		; C0 71 23
	phb		; 8B
	sta $06.b,S		; 83 06
	ora $89.b,S		; 03 89
	trb $5F5E.w		; 1C 5E 5F
	and $3271A1.l		; 2F A1 71 32
	stz $5F5E.w		; 9C 5E 5F
	and $3271A1.l		; 2F A1 71 32
	stz $856E.w		; 9C 6E 85
	cpy $D9.b		; C4 D9
	eor $6B00.w,Y		; 59 00 6B
	lda $D2.b,X		; B5 D2
	lda $68.b		; A5 68
	jmp $90954D.l		; 5C 4D 95 90
	asl $B9.b		; 06 B9
	cmp $DFE77C.l		; CF 7C E7 DF
	sbc $2ED7FA.l		; EF FA D7 2E
	sta ($C4.b),Y		; 91 C4
	xba		; EB
	lda $D7.b,X		; B5 D7
	dec $FE7D.w		; CE 7D FE
	sbc $E972AD.l,X		; FF AD 72 E9
	trb $A34E.w		; 1C 4E A3
	eor ($92.b),Y		; 51 92
	adc ($23.b),Y		; 71 23
	phb		; 8B
	pei ($6A.b)		; D4 6A
	and ($4E.b)		; 32 4E
	bit $71.b		; 24 71
	stz $68.b,X		; 74 68
	inx		; E8
	jmp $8E4623.l		; 5C 23 46 8E
	sta $C3.b		; 85 C3
	rts		; 60

	ora [$B7.b],Y		; 17 B7
	tsx		; BA
	ora [$1A.b],Y		; 17 1A
	ora ($7A.b,X)		; 01 7A
	sbc [$E3.b]		; E7 E3
	and $CEF6.w,Y		; 39 F6 CE
	adc $E3CB49.l,X		; 7F 49 CB E3
	lda $6FEF.w,Y		; B9 EF 6F
	sei		; 78
	dec $B37D.w		; CE 7D B3
	sta $F872D2.l,X		; 9F D2 72 F8
	inc $1C7C.w		; EE 7C 1C
	inc A		; 1A
	dex		; CA
	dex		; CA
	eor [$38.b]		; 47 38
.ACCU 8
.INDEX 8
	sep #$F0		; E2 F0
	bvs 107.b		; 70 6B
	pld		; 2B
	and #$1C.b		; 29 1C
	sbc $8B.b,S		; E3 8B
	lda $DEBD.w,X		; BD BD DE
	lda $F9F3.w,Y		; B9 F3 F9
	sbc $870E.w,X		; FD 0E 87
	tyx		; BB
	adc ($D8.b,S),Y		; 73 D8
	cld		; D8
	dec $EFDE.w,X		; DE DE EF
	jmp $FEFCF9.l		; 5C F9 FC FE
	sta [$43.b]		; 87 43
	cmp $ECB9.w,X		; DD B9 EC
	jmp ($9C6C.w)		; 6C 6C 9C
	sbc ($24.b)		; F2 24
	and ($E7.b)		; 32 E7
	brk $FA.b		; 00 FA
	trb $4EB6.w		; 1C B6 4E
	adc $1912.w,Y		; 79 12 19
	adc ($80.b,S),Y		; 73 80
	adc $5C0E.w,X		; 7D 0E 5C
	lda $8D.b,S		; A3 8D
	dex		; CA
	sbc $79.b		; E5 79
	trb $A38C.w		; 1C 8C A3
	sta $79E5CA.l		; 8F CA E5 79
	trb $A38C.w		; 1C 8C A3
	phb		; 8B
	dex		; CA
	sbc $47.b		; E5 47
	ora [$94.b],Y		; 17 94
	adc ($39.b),Y		; 71 39
	jmp $E7E2A8.l		; 5C A8 E2 E7
	cmp $CEC675.l		; CF 75 C6 CE
	stz $B3EB.w		; 9C EB B3
	sbc [$BA.b]		; E7 BA
	sbc $67.b,S		; E3 67
	lsr $C675.w		; 4E 75 C6
	cmp $7B019E.l		; CF 9E 01 7B
	ply		; 7A
	xba		; EB
	phb		; 8B
	sta $F6023C.l,X		; 9F 3C 02 F6
	sbc $47.b,X		; F5 47
	tas		; 1B
	lda $A8D6.w		; AD D6 A8
	sbc ($1D.b,X)		; E1 1D
	ror $47B5.w		; 6E B5 47
	tas		; 1B
	tda		; 7B
	ply		; 7A
	sec		; 38
	lda $1C.b,X		; B5 1C
	eor $E8ED.w		; 4D ED E8
.ACCU 8
.INDEX 8
	sep #$F4		; E2 F4
	lsr $4027.w		; 4E 27 40
	sbc [$00.b]		; E7 00
	ora $8913.w		; 0D 13 89
	bne  57.b		; D0 39
	cpy #$02.b		; C0 02
	dex		; CA
	wai		; CB
	.db $42, $E2		; 42 E2
	adc $38.b		; 65 38
	tyx		; BB
	pld		; 2B
	and $890B.w		; 2D 0B 89
	sty $E2.b,X		; 94 E2
	cmp $8E73.w,X		; DD 73 8E
	and $38D7.w,X		; 3D D7 38
	sbc $41.b,S		; E3 41
	cmp #$00.b		; C9 00
	brk $00.b		; 00 00
	php		; 08
	adc $737B.w,X		; 7D 7B 73
	brk $70.b		; 00 70
	lda $6A.b,X		; B5 6A
	adc ($4E.b,S),Y		; 73 4E
	dec $4C.b		; C6 4C
	rtl		; 6B

	eor #$00.b		; 49 00
	mvp $31,$6B		; 44 6B 31
	dec $30.b		; C6 30
	brk $2C.b		; 00 2C
	dec $18.b		; C6 18
	and ($08.b,X)		; 21 08
	brk $00.b		; 00 00
	sbc $FB267F.l,X		; FF 7F 26 FB
	brk $07.b		; 00 07
	asl $05.b		; 06 05
	brk $E1.b		; 00 E1
	lsr $B2.b,X		; 56 B2
	xba		; EB
	mvn $12,$8E		; 54 8E 12
	cmp $48.b,S		; C3 48
	lsr $20.b		; 46 20
	tsb $00.b		; 04 00
	tsa		; 3B
	.db $82, $40, $7E		; 82 40 7E
	ora $B610.w		; 0D 10 B6
	inc $B8.b,X		; F6 B8
	lsr $14.b		; 46 14
	sty $13.b,X		; 94 13
	asl $A43B.w,X		; 1E 3B A4
	.db $82, $74, $B6		; 82 74 B6
.INDEX 16
	rep #$12		; C2 12
	cmp ($44.b)		; D2 44
	pha		; 48
	sta $92.b,X		; 95 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	ldy $9A.b		; A4 9A
	eor #$24.b		; 49 24
	cmp ($49.b)		; D2 49
	bit $93.b		; 24 93
	eor #$24.b		; 49 24
	sta ($4B.b,S),Y		; 93 4B
	rol $9A.b		; 26 9A
	eor $831E.w		; 4D 1E 83
	.db $82, $99, $24		; 82 99 24
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
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor $B0.b		; 45 B0
	tya		; 98
	sta ($92.b,X)		; 81 92
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
	bit $92.b		; 24 92
	sbc $DDBE76.l,X		; FF 76 BE DD
	lda $B98B57.l		; AF 57 8B B9
	adc [$37.b],Y		; 77 37
	ldx #$6FF0.w		; A2 F0 6F
	adc $82.b		; 65 82
	sbc ($6F.b)		; F2 6F
	sta $E8.b		; 85 E8
	eor $EC.b		; 45 EC
	cmp $7E8340.l,X		; DF 40 83 7E
	bit $F99B.w		; 2C 9B F9
	cpy #$091C.w		; C0 1C 09
	cmp ($1C.b,X)		; C1 1C
	ora $1CC2.w,Y		; 19 C2 1C
	and #$C3.b		; 29 C3
	trb $C439.w		; 1C 39 C4
	ora [$C2.b],Y		; 17 C2
	.db $62, $FA, $71		; 62 FA 71
	and $DC.b		; 25 DC
	tyx		; BB
	sta [$E3.b],Y		; 97 E3
	txa		; 8A
	and $7116E7.l		; 2F E7 16 71
	sta [$1A.b]		; 87 1A
	adc ($C7.b),Y		; 71 C7
	asl $0772.w,X		; 1E 72 07
	jsl $264772.l		; 22 72 47 26
	adc ($87.b)		; 72 87
	rol A		; 2A
	adc ($C7.b)		; 72 C7
	rol $0673.w		; 2E 73 06
	brk $E6.b		; 00 E6
	lsr $E668.w		; 4E 68 E6
	dec $E770.w		; CE 70 E7
	lsr $E778.w		; 4E 78 E7
	dec $E880.w		; CE 80 E8
	lsr $E888.w		; 4E 88 E8
	dec $E990.w		; CE 90 E9
	phk		; 4B
	sbc ($81.b),Y		; F1 81
	bmi  38.b		; 30 26
	tsb $C0.b		; 04 C0
	sta $D331.w,X		; 9D 31 D3
	sta $D441.w,X		; 9D 41 D4
	sta $D551.w,X		; 9D 51 D5
	sta $D661.w,X		; 9D 61 D6
	sta $D771.w,X		; 9D 71 D7
	sta $2381.w,X		; 9D 81 23
	lda ($3B.b),Y		; B1 3B
	and $04.b,S		; 23 04
	ror $67.b,X		; 76 67
	pla		; 68
	ror $A7.b,X		; 76 A7
	jmp ($E776.w)		; 6C 76 E7
	bvs 119.b		; 70 77
	and [$74.b]		; 27 74
	adc [$67.b],Y		; 77 67
	sei		; 78
	adc [$A7.b],Y		; 77 A7
	jmp ($E577.w,X)		; 7C 77 E5
	ldx #$68D1.w		; A2 D1 68
	ldy $5A.b,X		; B4 5A
	and $8B16.w		; 2D 16 8B
	eor $A2.b		; 45 A2
	cmp ($68.b),Y		; D1 68
	ldy $5A.b,X		; B4 5A
	and $011E.w		; 2D 1E 01
	cpx #$119E.w		; E0 9E 11
	sbc ($98.b,X)		; E1 98
	and ($C1.b)		; 32 C1
	rts		; 60

	bcs  88.b		; B0 58
	bit $0B16.w		; 2C 16 0B
	cmp #$84.b		; C9 84
	bmi -90.b		; 30 A6
	clc		; 18
	cmp $98.b,S		; C3 98
	sta $12.b,S		; 83 12
	tad		; 5B
	and $CB96.w		; 2D 96 CB
	adc $B2.b		; 65 B2
	cmp $B66C.w,Y		; D9 6C B6
	tad		; 5B
	and $CB96.w		; 2D 96 CB
	adc $B2.b		; 65 B2
	cmp $318A.w,Y		; D9 8A 31
	ror $30.b		; 66 30
	dec $96.b		; C6 96
	phd		; 0B
	ora $83.b		; 05 83
	trb $CC63.w		; 1C 63 CC
	sta ($E2.b,X)		; 81 E2
	asl $9129.w,X		; 1E 29 91
	and ($46.b)		; 32 46
	jmp $16CA.w		; 4C CA 16
	wai		; CB
	stz $E4.b		; 64 E4
	cpx $E4.b		; E4 E4
	cpx $E4.b		; E4 E4
	cpx $E4.b		; E4 E4
	cpx $E4.b		; E4 E4
	cpx $E4.b		; E4 E4
	cpx $E4.b		; E4 E4
	sbc [$8C.b]		; E7 8C
	sei		; 78
	inc $54.b		; E6 54
	wai		; CB
	ora $3073.w,Y		; 19 73 30
	ror $4C.b		; 66 4C
	cmp ($9B.b),Y		; D1 9B
	ora $1EE4.w,Y		; 19 E4 1E
	eor #$39.b		; 49 39
	and $3939.w,Y		; 39 39 39
	and $4139.w,Y		; 39 39 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	eor ($41.b,X)		; 41 41
	stz $A633.w		; 9C 33 A6
	sei		; 78
	cmp $42039A.l		; CF 9A 03 42
	pla		; 68
	sta $A419.w		; 8D 19 A4
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	plp		; 28
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$34.b		; 29 34
	lda [$94.b]		; A7 94
	adc $9866.w,Y		; 79 66 98
	cmp ($9A.b,S),Y		; D3 9A
	sta $52.b,S		; 83 52
	ror A		; 6A
	sta $AC59.w		; 8D 59 AC
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	and #$2A.b		; 29 2A
	rol A		; 2A
	rol A		; 2A
	rol A		; 2A
	rol A		; 2A
	rol A		; 2A
	rol A		; 2A
	and $A7.b,X		; 35 A7
	tya		; 98
	adc $B8A6.w,Y		; 79 A6 B8
	cmp [$9E.b],Y		; D7 9E
	adc ($B0.b),Y		; 71 B0
	rol $26.b,X		; 36 26
	iny		; C8
	sbc ($CF.b,S),Y		; F3 CF
	rti		; 40

	cmp $1595.w,Y		; D9 95 15
	ora $15.b,X		; 15 15
	ora $15.b,X		; 15 15
	ora $15.b,X		; 15 15
	ora $15.b,X		; 15 15
	ora $15.b,X		; 15 15
	ora $17.b,X		; 15 17
	ora $C1.b		; 05 C1
	bvs  92.b		; 70 5C
	tas		; 1B
	.db $42, $E4		; 42 E4
	lda $133D.w,Y		; B9 3D 13
	cmp ($36.b)		; D2 36
	ldx $D8.b		; A6 D8
	stp		; DB
	stz $EA99.w,X		; 9E 99 EA
	tas		; 1B
	sta $72.b,S		; 83 72
	jmp $AA2797.l		; 5C 97 27 AA
	ply		; 7A
	cmp [$AE.b]		; C7 AE
	jmp $C92597.l		; 5C 97 25 C9
	adc ($5C.b)		; 72 5C
	stz $ECC1.w,X		; 9E C1 EC
	sta [$05.b],Y		; 97 05
	cmp ($70.b,X)		; C1 70
	jmp $D14517.l		; 5C 17 45 D1
	stz $5D.b,X		; 74 5D
	asl $5AD4.w,X		; 1E D4 5A
	sta $9E.b,X		; 95 9E
	sed		; F8
	ldy $ACAC.w		; AC AC AC
	ldy $E7F7.w		; AC F7 E7
	cpy #$3E2B.w		; C0 2B 3E
	ora #$F0.b		; 09 F0
	txa		; 8A
	dex		; CA
	cmp $F0D1.w		; CD D1 F0
	cmp $7B5688.l		; CF 88 56 7B
	adc [$C5.b]		; 67 C5
	and $15BC.w,X		; 3D BC 15
	ror $EC.b		; 66 EC
	sed		; F8
	cmp $D1.b		; C5 D1
	stz $5D.b,X		; 74 5D
	ora [$47.b],Y		; 17 47
	cmp [$3E.b]		; C7 3E
	eor ($F2.b,X)		; 41 F2
	eor $B27C94.l		; 4F 94 7C B2
	lda ($E6.b,S),Y		; B3 E6
	asl $F3E1.w,X		; 1E E1 F3
	eor $7C569C.l		; 4F 9C 56 7C
	sbc ($E8.b,S),Y		; F3 E8
	ora $9F.b,X		; 15 9F
	mvp $47,$FA		; 44 FA 47
	cmp ($2B.b,S),Y		; D3 2B
	and [$47.b],Y		; 37 47
	pei ($3E.b)		; D4 3E
	lda #$59.b		; A9 59
	sbc $8F.b,X		; F5 8F
	ldx $827D.w		; AE 7D 82
	lda ($76.b,S),Y		; B3 76
	adc $ED93.w,X		; 7D 93 ED
	ora $4FF76C.l,X		; 1F 6C F7 4F
	stz $DE.b,X		; 74 DE
	tas		; 1B
	cmp $EE.b,S		; C3 EE
	ora $C7FB74.l,X		; 1F 74 FB C7
	cmp $F8013F.l,X		; DF 3F 01 F8
	eor $337EC4.l		; 4F C4 7E 33
	sbc ($1F.b)		; F2 1F
	sty $FC.b,X		; 94 FC
	cmp $67.b		; C5 67
	sbc [$3F.b]		; E7 3F
	eor ($FA.b,X)		; 41 FA
	lsr A		; 4A
	cmp $FAD1.w		; CD D1 FA
	sta $7E56D6.l		; 8F D6 56 7E
	cmp $F6.b,S		; C3 F6
	sta $E6FDB8.l,X		; 9F B8 FD E6
	cpx $07FE.w		; EC FE 07
	sbc ($3F.b),Y		; F1 3F
	sta ($BC.b),Y		; 91 BC
	and [$87.b],Y		; 37 87
	sbc ($3F.b,S),Y		; F3 3F
	lda ($FD.b,X)		; A1 FD
	eor $737FEC.l		; 4F EC 7F 73
	dec $C13F.w,X		; DE 3F C1
	inc $F44F.w,X		; FE 4F F4
	adc $C1DEB3.l,X		; 7F B3 DE C1
	adc $95FEC3.l,X		; 7F C3 FE 95
	sta $E5FFF8.l,X		; 9F F8 FF E5
	phx		; DA
	pld		; 2B
	and [$45.b],Y		; 37 45
	dec $A837.w,X		; DE 37 A8
	ldy $46BC.w		; AC BC 46
	sbc [$16.b],Y		; F7 16
	jsl $B31BF3.l		; 22 F3 1B B3
	jmp ($D48B.w,X)		; 7C 8B D4
	plp		; 28
	lda $EEC5.w,X		; BD C5 EE
	and [$D8.b],Y		; 37 D8
	jsr $2282.w		; 20 82 22
	and [$E8.b],Y		; 37 E8
	lda ($16.b,S),Y		; B3 16
	.db $62, $CC, $59		; 62 CC 59
	sta $38FE.w		; 8D FE 38
	php		; 08
	cpx #$8263.w		; E0 63 82
	phb		; 8B
	and ($66.b),Y		; 31 66
	bit $98C5.w		; 2C C5 98
	cpx #$84E3.w		; E0 E3 84
	stx $3816.w		; 8E 16 38
	pla		; 68
	lda ($16.b,S),Y		; B3 16
	.db $62, $CC, $59		; 62 CC 59
	stx $381E.w		; 8E 1E 38
	dey		; 88
	ldx $F245.w,Y		; BE 45 F2
	and $897C91.l		; 2F 91 7C 89
	ldx #$1CFB.w		; A2 FB 1C
	jmp $134D.w		; 4C 4D 13
	mvp $34,$D1		; 44 D1 34
	eor $4413.w		; 4D 13 44
	cmp ($34.b),Y		; D1 34
	eor $4413.w		; 4D 13 44
	cmp ($34.b),Y		; D1 34
	eor $4413.w		; 4D 13 44
	cmp ($34.b),Y		; D1 34
	eor $4413.w		; 4D 13 44
	cmp ($34.b),Y		; D1 34
	eor $4413.w		; 4D 13 44
	cmp ($34.b),Y		; D1 34
	eor $E817.w		; 4D 17 E8
.ACCU 8
	sep #$A2		; E2 A2
	sbc $174713.l,X		; FF 13 47 17
	trb $7164.w		; 1C 64 71
	lda ($C7.b),Y		; B1 C7
	eor [$1F.b]		; 47 1F
	trb $7284.w		; 1C 84 72
	and ($C9.b),Y		; 31 C9
	eor [$27.b]		; 47 27
	trb $72A4.w		; 1C A4 72
	lda ($CB.b),Y		; B1 CB
	eor [$2F.b]		; 47 2F
	trb $60C4.w		; 1C C4 60
	and $01.b,S		; 23 01
	trb $73CC.w		; 1C CC 73
	eor ($80.b),Y		; 51 80
	stx $396E.w		; 8E 6E 39
	iny		; C8
	sbc [$63.b]		; E7 63
	stz $7E8E.w,X		; 9E 8E 7E
	dec A		; 3A
	php		; 08
	inx		; E8
	adc $A2.b,S		; 63 A2
	stx $3A8E.w		; 8E 8E 3A
	pha		; 48
	sbc #$63.b		; E9 63
	ora $1D.b,S		; 03 1D
	bit $74.b,X		; 34 74
	sbc ($D4.b),Y		; F1 D4
	eor [$53.b]		; 47 53
	ora $7554.w,X		; 1D 54 75
	adc ($D6.b),Y		; 71 D6
	eor [$5B.b]		; 47 5B
	ora $7574.w,X		; 1D 74 75
	sbc ($D8.b),Y		; F1 D8
	mvp $B1,$A3		; 44 A3 B1
	stx $30CA.w		; 8E CA 30
	eor ($D9.b),Y		; 51 D9
	cmp [$69.b]		; C7 69
	ora $76AC.w,X		; 1D AC 76
	cmp ($DB.b),Y		; D1 DB
	cmp [$71.b]		; C7 71
	ora $77CC.w,X		; 1D CC 77
	eor ($DD.b),Y		; 51 DD
	cmp [$79.b]		; C7 79
	ora $77EC.w,X		; 1D EC 77
	cmp ($DF.b),Y		; D1 DF
	cmp $A8.b		; C5 A8
	beq  35.b		; F0 23
	cmp ($8F.b,X)		; C1 8F
	asl A		; 0A
	bit $C138.w,X		; 3C 38 C1
	ldy $C222.w		; AC 22 C2
	ldy $C332.w		; AC 32 C3
	ldy $C442.w		; AC 42 C4
	plb		; AB
	rtl		; 6B

	trb $B1.b		; 14 B1
	rtl		; 6B

	clc		; 18
	lda ($AB.b),Y		; B1 AB
	trb $EBB1.w		; 1C B1 EB
	jsr $45BC.w		; 20 BC 45
.ACCU 8
	sep #$AC		; E2 AC
	sty $B1.b		; 84 B1
	sbc ($C7.b)		; F2 C7
	phk		; 4B
	tas		; 1B
	bit $B164.w		; 2C 64 B1
	adc ($C5.b)		; 72 C5
	lsr A		; 4A
	jmp.w [$32B1]		; DC B1 32
	cpy $4B.b		; C4 4B
	ora $B0342C.l		; 0F 2C 34 B0
	lda ($C2.b)		; B2 C2
	phk		; 4B
	ora [$2C.b]		; 07 2C
	txa		; 8A
	cmp #$2C.b		; C9 2C
	txs		; 9A
	dex		; CA
	and #$D7.b		; 29 D7
	sty $75BC.w		; 8C BC 75
	sta $59.b,X		; 95 59
	adc $97.b		; 65 97
	eor $9985.w,Y		; 59 85 99
	eor $9BA5.w,Y		; 59 A5 9B
	eor $0B79.w		; 4D 79 0B
	cmp #$4D.b		; C9 4D
	ror $E5.b		; 66 E5
	txs		; 9A
	stx $66.b,Y		; 96 66
	eor $6589.w,Y		; 59 89 65
	sbc $96.b		; E5 96
	stx $56.b,Y		; 96 56
	lsr $BC3C.w,X		; 5E 3C BC
	adc #$4F.b		; 69 4F
	bit $B2A4.w		; 2C A4 B2
	adc ($C9.b)		; 72 C9
	phk		; 4B
	and $2A.b,S		; 23 2A
	asl $71.b,X		; 16 71
	adc [$56.b]		; 67 56
	adc $D667.w,Y		; 79 67 D6
	sta ($68.b,X)		; 81 68
	lsr $89.b,X		; 56 89
	pla		; 68
	dec $91.b,X		; D6 91
	eor ($B4.b)		; 52 B4
	lda #$A6.b		; A9 A6
	txs		; 9A
	sbc ($97.b)		; F2 97
	stx $9A.b,Y		; 96 9A
	adc #$AD.b		; 69 AD
	bit $96A9.w		; 2C A9 96
	sta ($5A.b)		; 92 5A
	and $A568.w,Y		; 39 68 A5
	lda ($96.b,X)		; A1 96
	.db $82, $59, $F9		; 82 59 F9
	adc [$A5.b]		; 67 A5
	sta $7296.w,X		; 9D 96 72
	mvn $4C,$4B		; 54 4B 4C
	ldy $EB.b,X		; B4 EB
	bvc -75.b		; 50 B5
	pld		; 2B
	mvn $6B,$B5		; 54 B5 6B
	cli		; 58
	tax		; AA
	phy		; 5A
	cmp $57.b,X		; D5 57
	clv		; B8
	cmp ($4D.b,S),Y		; D3 4D
	bit $D7.b,X		; 34 D7
	tya		; 98
	ldy $D3D4.w,X		; BC D4 D3
	eor $D534.w		; 4D 34 D5
	phy		; 5A
	and $AA6C.w,X		; 3D 6C AA
	stx $B2.b,Y		; 96 B2
	phy		; 5A
	lda $A56A.w,Y		; B9 6A A5
	lda #$96.b		; A9 96
	ldx #$795A.w		; A2 5A 79
	adc #$A5.b		; 69 A5
	ldx $F55A.w		; AE 5A F5
	sbc [$2D.b]		; E7 2D
	.db $82, $6A, $A5		; 82 6A A5
	lda ($5B.b),Y		; B1 5B
	bit $D3.b		; 24 D3
	eor $D334.w		; 4D 34 D3
	eor $EB79.w		; 4D 79 EB
	bne  77.b		; D0 4D
	bit $D3.b,X		; 34 D3
	eor $D634.w		; 4D 34 D6
	dex		; CA
	tad		; 5B
	ora $2655.w,Y		; 19 55 26
	ldx $12.b,Y		; B6 12
	sbc ($A5.b,S),Y		; F3 A5
	lda $5BBA96.l		; AF 96 BA 5B
	bit $D3.b,X		; 34 D3
	eor $2B.b,X		; 55 2B
	sta $B4.b		; 85 B4
	eor [$29.b],Y		; 57 29
	ldx $9A.b		; A6 9A
	adc #$A6.b		; 69 A6
	txs		; 9A
	rtl		; 6B

	cmp ($5E.b),Y		; D1 5E
	sta ($69.b)		; 92 69
	ldx $9A.b		; A6 9A
	adc #$A6.b		; 69 A6
	txs		; 9A
	lda $D296.w,Y		; B9 96 D2
	eor [$12.b],Y		; 57 12
	tax		; AA
	eor $B335.w		; 4D 35 B3
	sta ($55.b,S),Y		; 93 55
	and $DBAA.w		; 2D AA DB
	and $69BA.w		; 2D BA 69
	ldx $9A.b		; A6 9A
	adc #$A6.b		; 69 A6
	txs		; 9A
	adc #$AF.b		; 69 AF
	eor $897A.w		; 4D 7A 89
	ldx $9A.b		; A6 9A
	adc #$A6.b		; 69 A6
	txs		; 9A
	adc #$A6.b		; 69 A6
	ldx $F2.b,Y		; B6 F2
	stp		; DB
	phk		; 4B
	rtl		; 6B

	rol A		; 2A
	ldy $D6.b		; A4 D6
	sbc ($6E.b,X)		; E1 6E
	lsr $6D.b,X		; 56 6D
	bit $D3.b,X		; 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $AB7A.w		; 4D 7A AB
	dec $4D.b,X		; D6 4D
	bit $D3.b,X		; 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $6EB9.w,Y		; 59 B9 6E
	adc $B8.b		; 65 B8
	stx $95.b,Y		; 96 95
	bit $D3.b,X		; 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D734.w		; 4D 34 D7
	ldx $84BD.w		; AE BD 84
	cmp ($4D.b,S),Y		; D3 4D
	bit $D3.b,X		; 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	phy		; 5A
	eor $D334.w,Y		; 59 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	lsr $BACA.w,X		; 5E CA BA
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D334.w		; 4D 34 D3
	eor $D734.w		; 4D 34 D7
	lda $20.b,X		; B5 20
	rol $FB.b		; 26 FB
	brk $36.b		; 00 36
	ldy #$0004.w		; A0 04 00
	tas		; 1B
	eor ($5C.b)		; 52 5C
	cmp $2224.w		; CD 24 22
	cmp ($02.b,S),Y		; D3 02
	ora ($60.b),Y		; 11 60
	phy		; 5A
	ora ($95.b,S),Y		; 13 95
	bne   8.b		; D0 08
	trb $22.b		; 14 22
	jmp $6446.w		; 4C 46 64
	tad		; 5B
	ora $A4.b		; 05 A4
	sty $23.b,X		; 94 23
	bpl  73.b		; 10 49
	sec		; 38
	cpx $3E.b		; E4 3E
	sty $3C95.w		; 8C 95 3C
	cmp $08.b,X		; D5 08
	pla		; 68
	sty $AA.b,X		; 94 AA
	sbc ($A1.b,X)		; E1 A1
	eor ($7B.b,S),Y		; 53 7B
	sty $75.b		; 84 75
	tay		; A8
	stz $F2.b		; 64 F2
	mvp $AC,$A6		; 44 A6 AC
	sty $30.b		; 84 30
	bit $51.b,X		; 34 51
	and $BD.b,X		; 35 BD
	ora ($BD.b)		; 12 BD
	bit $82.b,X		; 34 82
	adc [$B2.b]		; 67 B2
	jsl $3EB5E8.l		; 22 E8 B5 3E
	.db $62, $2A, $B2		; 62 2A B2
	rol $1221.w,X		; 3E 21 12
	eor #$24.b		; 49 24
	cmp $F3.b		; C5 F3
	ora $1DF1.w,Y		; 19 F1 1D
	sta ($74.b,S),Y		; 93 74
	cmp ($49.b)		; D2 49
	bit $D2.b		; 24 D2
	eor $F264.w		; 4D 64 F2
	eor #$24.b		; 49 24
	lda ($4F.b)		; B2 4F
	stz $96.b		; 64 96
	tad		; 5B
	ldx $92.b		; A6 92
	eor $B664.w		; 4D 64 B6
	eor $B26C.w,X		; 5D 6C B2
	eor $116A.w,X		; 5D 6A 11
	bit $92.b		; 24 92
	pha		; 48
	bit #$13.b		; 89 13
	bit $B2.b,X		; 34 B2
	eor #$2C.b		; 49 2C
	mvp $4D,$D2		; 44 D2 4D
	and $D2.b		; 25 D2
	rtl		; 6B

	bit $F2.b,X		; 34 F2
	eor #$24.b		; 49 24
	ldx $59.b,Y		; B6 59
	rol $92.b		; 26 92
	phk		; 4B
	bit $92.b		; 24 92
	eor #$2C.b		; 49 2C
	mvp $11,$28		; 44 28 11
	ldx $A6.b		; A6 A6
	.db $62, $73, $37		; 62 73 37
	ora #$A5.b		; 09 A5
	dec $24.b,X		; D6 24
	sbc ($14.b)		; F2 14
	ora ($4D.b,S),Y		; 13 4D
	jmp $6CCD.w		; 4C CD 6C
	ldy $44.b,X		; B4 44
	lda $4B77.w,X		; BD 77 4B
	ldy $660B.w		; AC 0B 66
	nop		; EA
	cop $2C.b		; 02 2C
	clv		; B8
	tsx		; BA
	dey		; 88
	ply		; 7A
	jmp $0478.w		; 4C 78 04
	mvp $44,$44		; 44 44 44
	pha		; 48
	tsb $11.b		; 04 11
	ora ($A6.b),Y		; 11 A6
	dec A		; 3A
	adc $44.b,S		; 63 44
	mvp $44,$44		; 44 44 44
	lda $88D20C.l,X		; BF 0C D2 88
	dey		; 88
	dey		; 88
	ldx #$2222.w		; A2 22 22
	jsl $888808.l		; 22 08 88 88
	dey		; 88
	ldx #$2222.w		; A2 22 22
	rol $20.b		; 26 20
	mvp $44,$44		; 44 44 44
	eor $11.b		; 45 11
	ora ($F9.b)		; 12 F9
	jmp ($00C2.w,X)		; 7C C2 00
	dey		; 88
	dey		; 88
	dey		; 88
	txa		; 8A
	jsl $CB0A25.l		; 22 25 0A CB
	wai		; CB
	ora ($11.b),Y		; 11 11
	ora ($1C.b),Y		; 11 1C
	lda $4464.w,X		; BD 64 44
	bcs -95.b		; B0 A1
	tay		; A8
	dey		; 88
	dey		; 88
	dey		; 88
	ldx #$4577.w		; A2 77 45
	ora $444444.l		; 0F 44 44 44
	eor $11.b		; 45 11
	plp		; 28
	ply		; 7A
	jsl $282222.l		; 22 22 22 28
	tya		; 98
	lsr A		; 4A
	ora $A11F.w,Y		; 19 1F A1
	ora ($11.b),Y		; 11 11
	ora ($18.b),Y		; 11 18
	sbc #$44.b		; E9 44
	lda ($9E.b,X)		; A1 9E
	adc $22BC2D.l,X		; 7F 2D BC 22
	jsl $E19723.l		; 22 23 97 E1
	ldx #$E826.w		; A2 26 E8
	brk $80.b		; 00 80
	.db $62, $7F, $CC		; 62 7F CC
	mvp $60,$44		; 44 44 60
	lda ($84.b,S),Y		; B3 84
	lsr $22.b,X		; 56 22
	bvc -81.b		; 50 AF
.ACCU 8
	sep #$A2		; E2 A2
	xba		; EB
	sei		; 78
	sta $8808FA.l		; 8F FA 08 88
	sta $D77FF1.l		; 8F F1 7F D7
	tad		; 5B
	and $2811.w		; 2D 11 28
	lsr $B7.b,X		; 56 B7
	and #$AB.b		; 29 AB
	cmp [$CA.b]		; C7 CA
	ora ($11.b),Y		; 11 11
	ora $BE6C.w,X		; 1D 6C BE
	eor $88E2.w,Y		; 59 E2 88
	bra  17.b		; 80 11
	adc $32.b,S		; 63 32
	ldx $C7.b		; A6 C7
	ror A		; 6A
	jsl $528D23.l		; 22 23 8D 52
	adc ($36.b,X)		; 61 36
	phd		; 0B
	phd		; 0B
	cpx #$714B.w		; E0 4B 71
	sta ($E7.b,X)		; 81 E7
	plb		; AB
	phx		; DA
	dey		; 88
	sty $5EB3.w		; 8C B3 5E
	ora ($11.b),Y		; 11 11
	ora $2F.b,S		; 03 2F
	and $4DC8.w		; 2D C8 4D
	rol $F0B1.w		; 2E B1 F0
	sbc $819B.w,Y		; F9 9B 81
	trb $68BD.w		; 1C BD 68
	sta $FC0408.l		; 8F 08 04 FC
	ldx #$225A.w		; A2 5A 22
	ora $9EEF90.l,X		; 1F 90 EF 9E
	cmp #$27.b		; C9 27
	bcc  74.b		; 90 4A
	dex		; CA
	sta ($25.b),Y		; 91 25
	ora ($61.b)		; 12 61
	cop $F0.b		; 02 F0
	dey		; 88
	bit #$3C.b		; 89 3C
	.db $82, $31, $5D		; 82 31 5D
	jmp $5D42.w		; 4C 42 5D
	ora ($22.b,X)		; 01 22
	ora ($13.b),Y		; 11 13
	cmp [$E8.b]		; C7 E8
	cmp ($79.b)		; D2 79
	rol $8A61.w		; 2E 61 8A
	ldy $BC.b		; A4 BC
	tad		; 5B
	and #$00.b		; 29 00
	ora ($12.b),Y		; 11 12
	iny		; C8
	ora ($4A.b,S),Y		; 13 4A
	mvp $17,$FA		; 44 FA 17
	eor ($12.b),Y		; 51 12
	rep #$C2		; C2 C2
	brk $20.b		; 00 20
	cmp $2222.w,X		; DD 22 22
	tsa		; 3B
	eor $FC99A1.l		; 4F A1 99 FC
	cpx $C2.b		; E4 C2
	cli		; 58
	tda		; 7B
	eor ($36.b,X)		; 41 36
	sty $1E.b		; 84 1E
	rtl		; 6B

	dec $CAFF.w		; CE FF CA
	adc #$53.b		; 69 53
	eor ($32.b,S),Y		; 53 32
	eor ($79.b,S),Y		; 53 79
	asl $89.b		; 06 89
	cmp ($2A.b,X)		; C1 2A
	jsr $8130.w		; 20 30 81
	xce		; FB
	cmp ($65.b,S),Y		; D3 65
	sbc $C19D91.l,X		; FF 91 9D C1
	cpx $8AAA.w		; EC AA 8A
	phd		; 0B
	ora ($53.b,S),Y		; 13 53
	and ($36.b),Y		; 31 36
	ldy $67.b		; A4 67
	sta ($65.b)		; 92 65
	sty $C0.b		; 84 C0
	asl $C658.w,X		; 1E 58 C6
	sbc ($4A.b)		; F2 4A
	jmp ($AE9D.w,X)		; 7C 9D AE
	lsr $D2B4.w,X		; 5E B4 D2
	ldx $A6.b		; A6 A6
	.db $62, $73, $37		; 62 73 37
	ora #$DD.b		; 09 DD
	sta $6C31.w,X		; 9D 31 6C
	brk $BA.b		; 00 BA
	eor ($63.b)		; 52 63
	ora $69DF.w,X		; 1D DF 69
	cmp ($7E.b,S),Y		; D3 7E
	tsa		; 3B
	sei		; 78
	sta ($53.b,S),Y		; 93 53
	and ($39.b),Y		; 31 39
	txy		; 9B
	sty $98.b		; 84 98
	ora $50948D.l		; 0F 8D 94 50
	tyx		; BB
	eor ($28.b,X)		; 41 28
	cmp $9A9E.w		; CD 9E 9A
	sta $CC89.w,Y		; 99 89 CC
	jmp.w [$9527]		; DC 27 95
	dec $4E.b		; C6 4E
	sta $79A124.l,X		; 9F 24 A1 79
	adc ($7C.b,X)		; 61 7C
	ora $81430B.l		; 0F 0B 43 81
	bit $4F92.w,X		; 3C 92 4F
	bit $8E9B.w,X		; 3C 9B 8E
	stz $F2.b		; 64 F2
	adc $6C.b,S		; 63 6C
	cmp $3D4121.l		; CF 21 41 3D
	asl $0F07.w		; 0E 07 0F
	rol $49.b,X		; 36 49
	sbc [$93.b]		; E7 93
	adc ($CC.b),Y		; 71 CC
	stz $6D4C.w,X		; 9E 4C 6D
	sta $28E4.w,Y		; 99 E4 28
	and [$D9.b]		; 27 D9
	bvs 124.b		; 70 7C
	lda $3FF6E9.l		; AF E9 F6 3F
	lsr $B5F7.w,X		; 5E F7 B5
	phb		; 8B
	pea $9B4F.w		; F4 4F 9B
	sta $3CB3.w		; 8D B3 3C
	bra  91.b		; 80 5B
	phx		; DA
	stp		; DB
	jmp.w [$DBDC]		; DC DC DB
	phy		; 5A
	ldy $00.b,X		; B4 00
	phk		; 4B
	and ($22.b)		; 32 22
	rol A		; 2A
	ldy $F2.b		; A4 F2
	ora ($88.b)		; 12 88
	txa		; 8A
	jsl $052202.l		; 22 02 22 05
	eor $37.b,X		; 55 37
	sbc ($5B.b),Y		; F1 5B
	stz $1141.w,X		; 9E 41 11
	inc A		; 1A
	ldx #$204C.w		; A2 4C 20
	and $45.b		; 25 45
	jsr $8405.w		; 20 05 84
	sec		; 38
	and $44EDF7.l,X		; 3F F7 ED 44
	mvp $C8,$46		; 44 46 C8
	and ($2E.b,X)		; 21 2E
	ora $14.b,X		; 15 14
	pld		; 2B
	bne  81.b		; D0 51
	adc $B3C55E.l		; 6F 5E C5 B3
	sbc $90DE.w,X		; FD DE 90
	mvp $D0,$47		; 44 47 D0
	adc $B8EB8D.l,X		; 7F 8D EB B8
	lsr A		; 4A
	lsr A		; 4A
	ora $76.b,X		; 15 76
	sbc $D78A17.l		; EF 17 8A D7
	ora $4A.b,X		; 15 4A
	jsl $716F37.l		; 22 37 6F 71
	ply		; 7A
	ldy $88.b		; A4 88
	lsr A		; 4A
	ora $72.b,X		; 15 72
	cpx $B2.b		; E4 B2
	pea $D23E.w		; F4 3E D2
	tay		; A8
	dey		; 88
	jmp.w [$2CC3]		; DC C3 2C
	cmp $1001.w,X		; DD 01 10
	and ($F2.b)		; 32 F2
	plx		; FA
	txa		; 8A
	rol A		; 2A
	sed		; F8
	sed		; F8
	cmp [$A1.b],Y		; D7 A1
	lda ($9E.b,S),Y		; B3 9E
.INDEX 8
	sep #$1C		; E2 1C
	lda $A36E.w,X		; BD 6E A3
	bcc -98.b		; 90 9E
	rol $EB4D.w,X		; 3E 4D EB
	ldx $15.b,Y		; B6 15
	sta ($6A.b,X)		; 81 6A
	cmp $CB.b,X		; D5 CB
	phb		; 8B
	cmp ($73.b)		; D2 73
	asl $17.b,X		; 16 17
	phb		; 8B
	stp		; DB
	ora $EEAA.w		; 0D AA EE
	adc ($4E.b,X)		; 61 4E
	dey		; 88
	pha		; 48
	lsr $DC29.w		; 4E 29 DC
	cmp ($7C.b),Y		; D1 7C
	ply		; 7A
	and $5F9FA4.l		; 2F A4 9F 5F
	sta $FEE8.w,X		; 9D E8 FE
	sbc ($7D.b,S),Y		; F3 7D
	eor ($B9.b,S),Y		; 53 B9
	sbc $7EBC.w		; ED BC 7E
	sta $47ED2E.l		; 8F 2E ED 47
	bvc  34.b		; 50 22
	lsr A		; 4A
	adc $B4.b,X		; 75 B4
	phy		; 5A
	xba		; EB
	sta ($74.b)		; 92 74
	sbc $D7BDC7.l,X		; FF C7 BD D7
	dex		; CA
	mvn $7B,$EB		; 54 EB 7B
	nop		; EA
	sbc $7902.w		; ED 02 79
	.db $62, $91, $13		; 62 91 13
	ora [$95.b]		; 07 95
	cmp $CD7A.w,Y		; D9 7A CD
	and $5A4F.w		; 2D 4F 5A
	wai		; CB
	lda [$BF.b]		; A7 BF
	lsr $2E.b,X		; 56 2E
	inx		; E8
	cmp $A503.w,Y		; D9 03 A5
	ora ($E0.b)		; 12 E0
	dey		; 88
	sbc ($58.b,X)		; E1 58
	sbc $F8873B.l,X		; FF 3B 87 F8
	sbc $199B.w,Y		; F9 9B 19
	bit $0D8C.w,X		; 3C 8C 0D
	cli		; 58
	sty $EA.b		; 84 EA
	lsr A		; 4A
	cmp #$8E.b		; C9 8E
	adc ($C8.b,X)		; 61 C8
	ora ($43.b,S),Y		; 13 43
.ACCU 8
	sep #$AE		; E2 AE
	sta [$03.b]		; 87 03
	eor $E3177F.l		; 4F 7F 17 E3
	cld		; D8
	cmp #$6F.b		; C9 6F
	ldy $02.b		; A4 02
	ror $09CE.w		; 6E CE 09
	ora ($C8.b),Y		; 11 C8
	rol $44.b,X		; 36 44
	cpy #$B7.b		; C0 B7
	lda $E1.b		; A5 E1
	adc ($73.b),Y		; 71 73
	txy		; 9B
	sbc $B2FF.w,X		; FD FF B2
	lda ($0F.b)		; B2 0F
	cmp $488093.l		; CF 93 80 48
	cmp $B709FD.l		; CF FD 09 B7
	bit $ED3D.w		; 2C 3D ED
	lda [$C3.b],Y		; B7 C3
	cmp [$F9.b],Y		; D7 F9
	adc $2EFD.w		; 6D FD 2E
	lda ($27.b),Y		; B1 27
	sta ($3E.b,S),Y		; 93 3E
	rts		; 60

	cpy $54.b		; C4 54
	cli		; 58
	tad		; 5B
	bmi  29.b		; 30 1D
	sbc ($9F.b),Y		; F1 9F
	bpl -72.b		; 10 B8
	sbc ($C9.b,S),Y		; F3 C9
	inc $A99F.w,X		; FE 9F A9
	bne -38.b		; D0 DA
	adc $F84F.w,X		; 7D 4F F8
	cmp $264020.l		; CF 20 40 26
	and $8CF7.w,Y		; 39 F7 8C
	and [$D4.b]		; 27 D4
	sec		; 38
	brk $8E.b		; 00 8E
	sta [$03.b]		; 87 03
	cpy #$EA.b		; C0 EA
	pea $1F38.w		; F4 38 1F
	cmp $2E77.w		; CD 77 2E
	adc #$8F.b		; 69 8F
	lsr $74.b,X		; 56 74
	inc $79.b		; E6 79
	sta ($6F.b)		; 92 6F
	eor $B2E9E6.l		; 4F E6 E9 B2
	sbc ($89.b,S),Y		; F3 89
	mvp $38,$74		; 44 74 38
	ora $B2FF.w,X		; 1D FF B2
	jsr ($629C.w,X)		; FC 9C 62
	sta $DD.b		; 85 DD
	ora $18.b,S		; 03 18
	jsr ($689E.w,X)		; FC 9E 68
	mvp $74,$44		; 44 44 74
	sec		; 38
	ora ($C9.b,S),Y		; 13 C9
	cmp #$D7.b		; C9 D7
.ACCU 8
.INDEX 8
	sep #$F5		; E2 F5
	tad		; 5B
	sta $DC6E7F.l		; 8F 7F 6E DC
	stz $06.b		; 64 06
	adc $4931.w,Y		; 79 31 49
	tsx		; BA
	jsr $DE9A.w		; 20 9A DE
	plp		; 28
	sbc #$82.b		; E9 82
	cmp $F23483.l		; CF 83 34 F2
	adc $FA75F4.l		; 6F F4 75 FA
	and $8DD7.w,X		; 3D D7 8D
	lda $92.b,S		; A3 92
	stx $6E.b,Y		; 96 6E
	eor $301928.l		; 4F 28 19 30
	sbc $F0.b,X		; F5 F0
	ror $3DA0.w		; 6E A0 3D
	txa		; 8A
	eor $FA06.w,Y		; 59 06 FA
	rts		; 60

	ldx $64.b,Y		; B6 64
	ora $E365.w,Y		; 19 65 E3
	lsr $D0.b		; 46 D0
	adc $DB68BD.l		; 6F BD 68 DB
	cmp $91.b		; C5 91
	dec $D6CB.w		; CE CB D6
	lda $4777.w,X		; BD 77 47
	lda $0210.w		; AD 10 02
	ora $75.b,S		; 03 75
	eor ($56.b),Y		; 51 56
	inx		; E8
	inx		; E8
	cpy $18B1.w		; CC B1 18
	bit $78DD.w		; 2C DD 78
	lda $45.b,X		; B5 45
	stz $1D.b		; 64 1D
	ora $AC978F.l,X		; 1F 8F 97 AC
	stz $50.b,X		; 74 50
	asl $AA.b,X		; 16 AA
	ora $A6.b,S		; 03 A6
	jmp.w [$F8F9]		; DC F9 F8
	and $3A5C.w		; 2D 5C 3A
	rol $FE78.w		; 2E 78 FE
	and $373D36.l		; 2F 36 3D 37
	sbc $8E.b,S		; E3 8E
	txy		; 9B
	eor $88.b,X		; 55 88
	phy		; 5A
	dec $00.b		; C6 00
	jsr $FC0E.w		; 20 0E FC
	cmp [$07.b],Y		; D7 07
	ldx #$E7.b		; A2 E7
	dey		; 88
	cmp ($60.b,X)		; C1 60
	dey		; 88
	inc $D3.b,X		; F6 D3
	brk $5C.b		; 00 5C
	pld		; 2B
	cop $62.b		; 02 62
	rtl		; 6B

	sta $DA.b,X		; 95 DA
	ora ($B9.b),Y		; 11 B9
	stx $BB.b		; 86 BB
	.db $42, $37		; 42 37
	bmi -44.b		; 30 D4
	asl $D2.b		; 06 D2
	pei ($45.b)		; D4 45
	jsr $8D10.w		; 20 10 8D
	eor ($09.b),Y		; 51 09
	stx $2A.b		; 86 2A
	lda #$8C.b		; A9 8C
	adc ($BE.b,X)		; 61 BE
	sta ($8F.b,X)		; 81 8F
	clv		; B8
	sta ($7F.b)		; 92 7F
	ora $AB.b,S		; 03 AB
	sed		; F8
	adc $B517.w,X		; 7D 17 B5
	sbc $22052E.l		; EF 2E 05 22
	ror $EA50.w,X		; 7E 50 EA
	ora $873785.l		; 0F 85 37 87
	sta [$73.b],Y		; 97 73
	ora $E831.w		; 0D 31 E8
	adc $EF.b,S		; 63 EF
	bit $92.b		; 24 92
	adc $DCE4.w,Y		; 79 E4 DC
	adc ($27.b,S),Y		; 73 27
	sta ($1B.b,S),Y		; 93 1B
	ror $79.b		; 66 79
	ora #$89.b		; 09 89
	txa		; 8A
	tas		; 1B
	bmi  59.b		; 30 3B
	lda $1151.w,X		; BD 51 11
	tsx		; BA
	stx $504A.w		; 8E 4A 50
	lsr $7EDD.w		; 4E DD 7E
	phb		; 8B
	sbc $D48D88.l		; EF 88 8D D4
	adc ($5B.b)		; 72 5B
	stz $25.b		; 64 25
	tsb $2A.b		; 04 2A
	dec $96.b,X		; D6 96
	beq -114.b		; F0 8E
	sbc [$EE.b],Y		; F7 EE
	eor $2547.w,X		; 5D 47 25
	tay		; A8
	sty $00.b,X		; 94 00
	dec $2A94.w,X		; DE 94 2A
	ora $2A4625.l,X		; 1F 25 46 2A
	sta ($EA.b)		; 92 EA
	and $222C.w,Y		; 39 2C 22
	tsb $42.b		; 04 42
	bvc -90.b		; 50 A6
	plb		; AB
	and $ACA8C2.l,X		; 3F C2 A8 AC
	.db $82, $FC, $37		; 82 FC 37
	eor ($C9.b),Y		; 51 C9
	eor ($11.b,S),Y		; 53 11
	eor ($61.b),Y		; 51 61
	jmp ($56A1.w,X)		; 7C A1 56
	eor ($BB.b,X)		; 41 BB
	cmp $DB.b,X		; D5 DB
	sbc ($52.b,S),Y		; F3 52
	sbc $DB.b,X		; F5 DB
	tay		; A8
	cpx $B6.b		; E4 B6
	ora ($B7.b,X)		; 01 B7
	ora ($F1.b)		; 12 F1
	.db $42, $A3		; 42 A3
	sbc $7B.b,S		; E3 7B
	lda $97289A.l		; AF 9A 28 97
	eor ($C9.b),Y		; 51 C9
	adc $3F.b,S		; 63 3F
	stz $04.b,X		; 74 04
	lsr A		; 4A
	trb $D4.b		; 14 D4
	bcc -33.b		; 90 DF
	sbc $75.b,S		; E3 75
	and #$75.b		; 29 75
	trb $1295.w		; 1C 95 12
	ora ($8C.b,S),Y		; 13 8C
	and $0A.b		; 25 0A
	phk		; 4B
	jsr $C844.w		; 20 44 C8
	sbc [$5D.b]		; E7 5D
	eor [$25.b]		; 47 25
	jmp $2642.w		; 4C 42 26
	eor ($42.b,X)		; 41 42
	tax		; AA
	phb		; 8B
	sed		; F8
	rol $4D22.w,X		; 3E 22 4D
	plp		; 28
	cmp $2547.w,X		; DD 47 25
	tay		; A8
	sed		; F8
	.db $42, $4C		; 42 4C
	bvc -52.b		; 50 CC
	and [$37.b],Y		; 37 37
	ply		; 7A
	ldy $C6.b,X		; B4 C6
	and $75.b,S		; 23 75
	trb $0897.w		; 1C 97 08
	trb $94.b		; 14 94
	tsa		; 3B
	ora $54EF06.l,X		; 1F 06 EF 54
	mvp $A3,$6E		; 44 6E A3
	sta ($E3.b)		; 92 E3
	sty $12.b,X		; 94 12
	cmp [$C1.b]		; C7 C1
	tyx		; BB
	cmp $11.b,X		; D5 11
	tas		; 1B
	tay		; A8
	stx HDMATBL3H.w		; 8E 39 43
	ldy #$21.b		; A0 21
	asl $5E7E.w		; 0E 7E 5E
	bcs -120.b		; B0 88
	cmp $274C.w,X		; DD 4C 27
	adc $E6.b		; 65 E6
	ply		; 7A
	plp		; 28
	lsr A		; 4A
	ora $01.b,X		; 15 01
	ldx $D9B9.w,Y		; BE B9 D9
	bvs  75.b		; 70 4B
	xce		; FB
	lda $B551.w,X		; BD 51 B5
	eor $4CDC65.l,X		; 5F 65 DC 4C
	adc $53.b		; 65 53
	and ($7E.b),Y		; 31 7E
	bpl -128.b		; 10 80
	clv		; B8
	ror $DEFE.w,X		; 7E FE DE
	adc #$69.b		; 69 69
	sty $E17C.w		; 8C 7C E1
	sbc #$29.b		; E9 29
	sbc $88AEFA.l		; EF FA AE 88
	lda [$77.b],Y		; B7 77
	rtl		; 6B

	and [$E6.b],Y		; 37 E6
	and ($8C.b)		; 32 8C
	lda $2F62.w,X		; BD 62 2F
	ora [$74.b],Y		; 17 74
	and [$6F.b],Y		; 37 6F
	eor $8D28.w		; 4D 28 8D
	lda $DB.b,S		; A3 DB
	tya		; 98
	mvp $44,$94		; 44 94 44
	eor ($11.b,X)		; 41 11
	ora ($11.b),Y		; 11 11
	asl $4A98.w,X		; 1E 98 4A
	cmp $617DBC.l		; CF BC 7D 61
	ora ($04.b),Y		; 11 04
	mvp $44,$44		; 44 44 44
	eor $A8.b,S		; 43 A8
	rol $3F.b		; 26 3F
	pla		; 68
	cpx #$88.b		; E0 88
	dey		; 88
	jsl $232222.l		; 22 22 22 23
	sta ($07.b)		; 92 07
	sta $25.b,X		; 95 25
	and $11.b		; 25 11
	bpl  68.b		; 10 44
	mvp $44,$44		; 44 44 44
	and ($CF.b)		; 32 CF
	dec $11.b,X		; D6 11
	ora ($10.b),Y		; 11 10
	mvp $44,$44		; 44 44 44
	lsr $D9.b		; 46 D9
	cmp ($1F.b)		; D2 1F
	sei		; 78
	mvp $41,$44		; 44 44 41
	ora ($11.b),Y		; 11 11
	ora ($1F.b),Y		; 11 1F
	tsx		; BA
	and $D2.b		; 25 D2
	cmp ($11.b,X)		; C1 11
	bpl  68.b		; 10 44
	mvp $45,$44		; 44 44 45
	and ($01.b),Y		; 31 01
	wai		; CB
	ora ($10.b,S),Y		; 13 10
	dey		; 88
	jsl $232222.l		; 22 22 22 23
	bvc   1.b		; 50 01
	cmp ($1B.b,S),Y		; D3 1B
	adc $11.b,S		; 63 11
	adc ($88.b,X)		; 61 88
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	plp		; 28
	eor $0921.w,X		; 5D 21 09
	lda $813A.w,X		; BD 3A 81
	ora ($11.b),Y		; 11 11
	stx $FE.b		; 86 FE
	plx		; FA
	tya		; 98
	sbc #$26.b		; E9 26
	lda [$8C.b],Y		; B7 8C
	stz $C1.b		; 64 C1
	sbc #$F1.b		; E9 F1
	sbc $22A4.w,Y		; F9 A4 22
	ror $53.b,X		; 76 53
	phk		; 4B
	adc ($0E.b,S),Y		; 73 0E
	lsr $A8C7.w		; 4E C7 A8
	beq 108.b		; F0 6C
	and $29C181.l		; 2F 81 C1 29
	sta $BB79F1.l		; 8F F1 79 BB
	lda ($92.b),Y		; B1 92
	dey		; 88
	sta $10.b,X		; 95 10
	cmp ($52.b)		; D2 52
	eor $609A.w,X		; 5D 9A 60
	cop $21.b		; 02 21
	ora [$77.b]		; 07 77
	tax		; AA
	jsl $3A5B22.l		; 22 22 5B 3A
	sep #$87		; E2 87
	lda [$8B.b]		; A7 8B
	tsx		; BA
	trb $64C4.w		; 1C C4 64
	sei		; 78
	tsb $EC8C.w		; 0C 8C EC
	bit #$41.b		; 89 41
	lsr $EA.b		; 46 EA
	.db $62, $3E, $39		; 62 3E 39
	sbc $4D50.w,X		; FD 50 4D
	jmp.w [$BE7D]		; DC 7D BE
	plb		; AB
	sbc $C385.w		; ED 85 C3
	lda $B7.b,X		; B5 B7
	sbc ($FE.b),Y		; F1 FE
	ora [$F5.b]		; 07 F5
	tda		; 7B
	ora #$A5.b		; 09 A5
	inx		; E8
	lda $4537.w,X		; BD 37 45
	sbc #$8B.b		; E9 8B
	cpx $D6.b		; E4 D6
	iny		; C8
	iny		; C8
	sty $44.b		; 84 44
	cpx $9AA1.w		; EC A1 9A
	eor ($11.b),Y		; 51 11
	ora ($10.b),Y		; 11 10
	sbc ($62.b,S),Y		; F3 62
	jsl $882022.l		; 22 22 20 88
	dey		; 88
	dey		; 88
	dey		; 88
	jsl $202222.l		; 22 22 22 20
	dey		; 88
	dey		; 88
	dey		; 88
	sty $22A2.w		; 8C A2 22
	jsl $880822.l		; 22 22 08 88
	dey		; 88
	dey		; 88
	ldx #$22.b		; A2 22
	jsl $A00E62.l		; 22 62 0E A0
	mvp $44,$44		; 44 44 44
	ply		; 7A
	stx $1146.w		; 8E 46 11
	ora ($13.b),Y		; 11 13
	php		; 08
	phy		; 5A
	and ($08.b),Y		; 31 08
	dey		; 88
	dey		; 88
	phx		; DA
	lda $A2B315.l		; AF 15 B3 A2
	tay		; A8
.INDEX 16
	rep #$5F		; C2 5F
	brk $B7.b		; 00 B7
	adc $7D166B.l		; 6F 6B 16 7D
	cpy $2222.w		; CC 22 22
	rol $F1.b,X		; 36 F1
	eor $7E.b,S		; 43 7E
	eor $858B.w,Y		; 59 8B 85
	asl A		; 0A
	nop		; EA
	adc $A6.b,S		; 63 A6
	iny		; C8
	and $20D1.w,Y		; 39 D1 20
	dey		; 88
	sbc $3C.b,X		; F5 3C
	stz $B0.b		; 64 B0
	tay		; A8
	and $1BE0.w,Y		; 39 E0 1B
	eor ($7D.b,S),Y		; 53 7D
	xba		; EB
	adc $CED0.w,Y		; 79 D0 CE
	iny		; C8
	sbc ($FA.b,S),Y		; F3 FA
	and ($18.b,X)		; 21 18
	adc $AF29FC.l		; 6F FC 29 AF
	bra   7.b		; 80 07
	clc		; 18
	ldx $43.b,Y		; B6 43
	ldy $B9.b,X		; B4 B9
	jsr ($E457.w,X)		; FC 57 E4
	lda ($76.b)		; B2 76
	eor [$8D.b]		; 47 8D
	pei ($DB.b)		; D4 DB
	cmp $B5.b		; C5 B5
	lda $808484.l,X		; BF 84 84 80
	brk $E6.b		; 00 E6
	and ($3A.b)		; 32 3A
	sty $F28A.w		; 8C 8A F2
	eor $C0.b,X		; 55 C0
	sty $13.b,X		; 94 13
	stx $98.b		; 86 98
	adc #$86.b		; 69 86
	tya		; 98
	adc #$E0.b		; 69 E0
	cmp ($C7.b,S),Y		; D3 C7
	tax		; AA
	plb		; AB
	pea $BBE0.w		; F4 E0 BB
	ora $E9D8.w,X		; 1D D8 E9
	stx $EE98.w		; 8E 98 EE
	cmp [$97.b]		; C7 97
	asl $4C.b,X		; 16 4C
	tsa		; 3B
	jmp.w [$4474]		; DC 74 44
	mvp $02,$AC		; 44 AC 02
	lda ($11.b,X)		; A1 11
	ora ($11.b),Y		; 11 11
	tax		; AA
	bit $D9.b		; 24 D9
	rol $0E.b,X		; 36 0E
	adc $10C5.w,Y		; 79 C5 10
	cmp #$34.b		; C9 34
	mvp $44,$44		; 44 44 44
	adc ($76.b)		; 72 76
	bit $73.b,X		; 34 73
	sta ($51.b)		; 92 51
	and $99.b		; 25 99
	ora ($4C.b,S),Y		; 13 4C
	dey		; 88
	ora ($19.b),Y		; 11 19
	lda $11.b		; A5 11
	ora ($44.b),Y		; 11 44
	mvp $91,$4D		; 44 4D 91
	bit $4404.w		; 2C 04 44
	mvp $51,$44		; 44 44 51
	ora ($12.b),Y		; 11 12
	sbc #$55.b		; E9 55
	lda $11A0.w,Y		; B9 A0 11
	ora ($11.b),Y		; 11 11
	lda [$8A.b],Y		; B7 8A
	phd		; 0B
	ora ($01.b,S),Y		; 13 01
	sbc $1F.b,S		; E3 1F
	inx		; E8
	brk $17.b		; 00 17
	sty $44.b		; 84 44
	mvp $F5,$46		; 44 46 F5
	pei ($B3.b)		; D4 B3
	tas		; 1B
	lda ($00.b)		; B2 00
	php		; 08
	tsb $B0.b		; 04 B0
	inc $B6B1.w		; EE B1 B6
	mvp $0B,$46		; 44 46 0B
	ora ($C8.b)		; 12 C8
	tsa		; 3B
	ldx $3CD7.w		; AE D7 3C
	brk $2D.b		; 00 2D
	txs		; 9A
	cmp $07.b,S		; C3 07
	ror $2276.w		; 6E 76 22
	and $6F.b,S		; 23 6F
	asl $B6.b,X		; 16 B6
	phy		; 5A
	phk		; 4B
	and [$63.b],Y		; 37 63
	sbc ($0C.b)		; F2 0C
	lda ($44.b,S),Y		; B3 44
	phx		; DA
	ora ($DC.b),Y		; 11 DC
	cmp $2C.b,S		; C3 2C
	tsb $0E5A.w		; 0C 5A 0E
	lsr $8EB6.w,X		; 5E B6 8E
	ror $D3.b,X		; 76 D3
	lda ($1D.b,X)		; A1 1D
	and #$DB.b		; 29 DB
	cmp $3051.w		; CD 51 30
	tad		; 5B
	lda [$DA.b],Y		; B7 DA
	wai		; CB
	wai		; CB
	sbc [$71.b],Y		; F7 71
	and ($EB.b)		; 32 EB
	plb		; AB
	sta ($B7.b,X)		; 81 B7
	txa		; 8A
	eor $99B0.w,Y		; 59 B0 99
	sbc ($4C.b,S),Y		; F3 4C
	bvc -83.b		; 50 AD
	cmp [$75.b],Y		; D7 75
	cmp #$97.b		; C9 97
	eor ($9D.b),Y		; 51 9D
	eor $7075.w,X		; 5D 75 70
	sec		; 38
	bit #$8A.b		; 89 8A
	php		; 08
	eor $23B1.w,Y		; 59 B1 23
	tay		; A8
	sbc ($55.b)		; F2 55
	cpx $AB.b		; E4 AB
	sta ($C9.b,X)		; 81 C9
	plp		; 28
	bit $D0.b		; 24 D0
	cmp $454D.w,X		; DD 4D 45
	stz $8672.w,X		; 9E 72 86
	inc $01.b		; E6 01
	and ($4B.b,X)		; 21 4B
	eor ($7D.b,S),Y		; 53 7D
	eor $D4.b,X		; 55 D4
	pei ($59.b)		; D4 59
	sbc [$8C.b]		; E7 8C
	dey		; 88
	sty $00.b		; 84 00
	cpy $4002.w		; CC 02 40
	eor $BB6D.w		; 4D 6D BB
	.db $62, $BF, $5B		; 62 BF 5B
	phb		; 8B
	bit #$EF.b		; 89 EF
	inx		; E8
	lda #$AD.b		; A9 AD
	sta [$CD.b],Y		; 97 CD
	jsr $D603.w		; 20 03 D6
	eor ($6C.b,X)		; 41 6C
	inc $44.b,X		; F6 44
	cmp $2B61D4.l,X		; DF D4 61 2B
	tsa		; 3B
	adc $6A93.w,Y		; 79 93 6A
	bvs -90.b		; 70 A6
	adc $30ECDF.l,X		; 7F DF EC 30
	jmp.w [$D7AE]		; DC AE D7
	adc $6D4ADC.l		; 6F DC 4A 6D
	jmp ($169E.w,X)		; 7C 9E 16
	jmp ($A4A4.w,X)		; 7C A4 A4
	stz $13.b		; 64 13
	eor ($E3.b,X)		; 41 E3
	ora ($1D.b,S),Y		; 13 1D
	sei		; 78
	dey		; 88
	sty $F8D2.w		; 8C D2 F8
	cmp $D224.w,X		; DD 24 D2
	sbc $FD.b,X		; F5 FD
	nop		; EA
	jsl $A4F426.l		; 22 26 F4 A4
	brk $13.b		; 00 13
	inc $08.b		; E6 08
	dey		; 88
	dey		; 88
	lda [$CC.b]		; A7 CC
	sbc $4FE4.w,X		; FD E4 4F
	php		; 08
	phx		; DA
	bra   2.b		; 80 02
	adc $888878.l,X		; 7F 78 88 88
	txa		; 8A
	adc $A2EB7F.l,X		; 7F 7F EB A2
	adc ($CC.b,S),Y		; 73 CC
	rts		; 60

	asl $CF59.w		; 0E 59 CF
	ora ($11.b),Y		; 11 11
	ora ($E5.b),Y		; 11 E5
	inc $FD79.w		; EE 79 FD
	ora ($58.b)		; 12 58
	and [$8C.b]		; 27 8C
	eor $CB80.w,X		; 5D 80 CB
	clc		; 18
	and $B5.b		; 25 B5
	bne  17.b		; D0 11
	clc		; 18
	bit $D6CB.w		; 2C CB D6
	lsr $6ADE.w		; 4E DE 6A
	rep #$09		; C2 09
	lda $9191.w		; AD 91 91
	rti		; 40

	plx		; FA
	sta $9E45.w		; 8D 45 9E
	sei		; 78
	bit $8AB7.w		; 2C B7 8A
	dec A		; 3A
	.db $62, $AA, $C3		; 62 AA C3
	cmp ($02.b,X)		; C1 02
	rti		; 40

	bcs 118.b		; B0 76
	ldx $5DE9.w		; AE E9 5D
	eor $9E45.w		; 4D 45 9E
	tda		; 7B
	jsr $244F.w		; 20 4F 24
	sbc ($40.b),Y		; F1 40
	cpy $4002.w		; CC 02 40
	lsr $6DD8.w		; 4E D8 6D
	plb		; AB
	lda #$A8.b		; A9 A8
	lda ($CE.b,S),Y		; B3 CE
	sta $72B7.w,X		; 9D B7 72
	tya		; 98
	bra -52.b		; 80 CC
	cop $42.b		; 02 42
	stp		; DB
	tas		; 1B
	rol A		; 2A
	plb		; AB
	lda #$A8.b		; A9 A8
	lda ($CF.b,S),Y		; B3 CF
	dey		; 88
	ldy $98.b		; A4 98
	brk $CC.b		; 00 CC
	cop $43.b		; 02 43
	eor $42.b,S		; 43 42
	adc $92E4.w,Y		; 79 E4 92
	adc $B2F2.w,Y		; 79 F2 B2
	lda [$9F.b]		; A7 9F
	and ($32.b,S),Y		; 33 32
	adc $04F8.w,Y		; 79 F8 04
	sty $E4.b		; 84 E4
	stx $B9.b		; 86 B9
	and ($A8.b,X)		; 21 A8
	pha		; 48
	pla		; 68
	pla		; 68
	eor $4F923C.l		; 4F 3C 92 4F
	rol $5456.w,X		; 3E 56 54
	sbc ($E6.b,S),Y		; F3 E6
	ror $78.b		; 66 78
	ora ($F0.b,S),Y		; 13 F0
	ora #$09.b		; 09 09
	cmp #$0D.b		; C9 0D
	adc ($43.b)		; 72 43
	bvc -112.b		; 50 90
	bne -48.b		; D0 D0
	stz $2479.w,X		; 9E 79 24
	stz $AC7C.w,X		; 9E 7C AC
	lda #$E7.b		; A9 E7
	cpy $9FFD.w		; CC FD 9F
	asl $011E.w,X		; 1E 1E 01
	and ($39.b,X)		; 21 39
	and ($AE.b,X)		; 21 AE
	pha		; 48
	ror A		; 6A
	trb $43E3.w		; 1C E3 43
	.db $42, $79		; 42 79
	cpx $92.b		; E4 92
	adc $B2F2.w,Y		; 79 F2 B2
	ldy $A7.b,X		; B4 A7
	cmp $37CDDF.l		; CF DF CD 37
	brk $90.b		; 00 90
	stz $D790.w		; 9C 90 D7
	bit $3E.b		; 24 3E
	lda $C9.b,X		; B5 C9
	lda $BB.b		; A5 BB
	cld		; D8
	eor ($AD.b,S),Y		; 53 AD
	bit $93.b		; 24 93
	cmp $67D1D1.l		; CF D1 D1 67
	inc $2648.w		; EE 48 26
	txy		; 9B
	sbc $68BA.w,Y		; F9 BA 68
	cmp #$C9.b		; C9 C9
	ora $3B78.w		; 0D 78 3B
	cli		; 58
	bit $FBA7.w,X		; 3C A7 FB
	eor $DA29.w		; 4D 29 DA
	asl $37FF.w		; 0E FF 37
	sta [$C3.b]		; 87 C3
	jsr $A736.w		; 20 36 A7
	cmp #$2D.b		; C9 2D
	ror $9D.b,X		; 76 9D
	phx		; DA
	adc #$9B.b		; 69 9B
	xce		; FB
	sta $1757.w,X		; 9D 57 17
	rtl		; 6B

	cpx $FC.b		; E4 FC
	sta $B36A7D.l,X		; 9F 7D 6A B3
	bpl -19.b		; 10 ED
	rol $F3A4.w,X		; 3E A4 F3
	sbc $65.b		; E5 65
	ply		; 7A
	jmp ($6C8C.w,X)		; 7C 8C 6C
	cmp $156B4F.l		; CF 4F 6B 15
	ldy $F0.b,X		; B4 F0
	rol $7BC8.w		; 2E C8 7B
	lda $25BD.w,Y		; B9 BD 25
	rol $47DF.w,X		; 3E DF 47
	cmp $53.b,X		; D5 53
	ora $BC.b,S		; 03 BC
	stz $2749.w,X		; 9E 49 27
	sta $792A2B.l,X		; 9F 2B 2A 79
	sbc ($33.b,S),Y		; F3 33
	and [$9E.b]		; 27 9E
	cmp $92.b,S		; C3 92
	lsr $6B48.w		; 4E 48 6B
	sta ($1A.b)		; 92 1A
	sty $85.b		; 84 85
	cmp $9E67.w,Y		; D9 67 9E
	eor #$27.b		; 49 27
	sta $792A2B.l,X		; 9F 2B 2A 79
	sbc ($33.b,S),Y		; F3 33
	and [$9E.b]		; 27 9E
	sbc ($21.b),Y		; F1 21
	and $AE21.w,Y		; 39 21 AE
	pha		; 48
	ror A		; 6A
	ora ($1B.b)		; 12 1B
	jmp.w [$CF13]		; DC 13 CF
	bit $93.b		; 24 93
	cmp $3C9595.l		; CF 95 95 3C
	sbc $9399.w,Y		; F9 99 93
	cmp $0909F7.l		; CF F7 09 09
	cmp #$0D.b		; C9 0D
	adc ($43.b)		; 72 43
	bvc -112.b		; 50 90
	cmp #$C9.b		; C9 C9
	stz $E070.w,X		; 9E 70 E0
	bvs   2.b		; 70 02
	cmp $A0.b,X		; D5 A0
	ora $4182.w		; 0D 82 41
	bit $04.b,X		; 34 04
	ldy $C944.w		; AC 44 C9
	cmp #$9E.b		; C9 9E
	bvs  -8.b		; 70 F8
	ldy $58.b,X		; B4 58
	jsr $68B5.w		; 20 B5 68
	rol $FB.b,X		; 36 FB
	adc $4182.w,X		; 7D 82 41
	bit $04.b,X		; 34 04
	ldy $204B.w		; AC 4B 20
	cmp #$C9.b		; C9 C9
	txs		; 9A
	sbc $4837.w,Y		; F9 37 48
	phy		; 5A
	sec		; 38
	stz $CA4E.w		; 9C 4E CA
	txa		; 8A
	tas		; 1B
	ora [$65.b]		; 07 65
	tsb $E7D9.w		; 0C D9 E7
	cpy $D234.w		; CC 34 D2
	jsr ($E927.w,X)		; FC 27 E9
	jmp.w [$7079]		; DC 79 70
	sty $D9.b		; 84 D9
	rol $3C.b		; 26 3C
	lsr A		; 4A
	adc $A6.b,X		; 75 A6
	eor $4980.w		; 4D 80 49
	mvp $8E,$69		; 44 69 8E
	adc #$47.b		; 69 47
	sbc $E8E3DF.l,X		; FF DF E3 E8
	adc $F617.w,X		; 7D 17 F6
	ror $AEBF.w,X		; 7E BF AE
	cmp [$E9.b]		; C7 E9
	tsb $44.b		; 04 44
	cld		; D8
	and [$B4.b],Y		; 37 B4
	plx		; FA
	stz $C0E8.w,X		; 9E E8 C0
	rtl		; 6B

	php		; 08
	sta $DA440B.l		; 8F 0B 44 DA
	tsb $A2.b		; 04 A2
	jsl $D70B73.l		; 22 73 0B D7
	ror $9D.b,X		; 76 9D
	cop $C1.b		; 02 C1
	ora ($13.b),Y		; 11 13
	sta $E74E.w,Y		; 99 4E E7
	sta $B6E14D.l,X		; 9F 4D E1 B6
	stz $F923.w		; 9C 23 F9
	lsr A		; 4A
	cpy $2937.w		; CC 37 29
	sty $E26D.w		; 8C 6D E2
	ora ($84.b,S),Y		; 13 84
	adc $395E29.l,X		; 7F 29 5E 39
	cpy $8F0A.w		; CC 0A 8F
	wai		; CB
	iny		; C8
	rol $F081.w,X		; 3E 81 F0
	lsr A		; 4A
	eor ($1A.b,X)		; 41 1A
	lda [$5F.b],Y		; B7 5F
	sta [$CC.b],Y		; 97 CC
	stz $FF83.w		; 9C 83 FF
	stz $A3.b		; 64 A3
	adc [$67.b],Y		; 77 67
	ora $8916CA.l,X		; 1F CA 16 89
	ldx $30F9.w,Y		; BE F9 30
	phy		; 5A
	rol $E3EC.w		; 2E EC E3
	adc $4B4F.w,Y		; 79 4F 4B
	ror A		; 6A
	lda $0EB4.w,Y		; B9 B4 0E
	eor ($B1.b),Y		; 51 B1
	ror A		; 6A
	tyx		; BB
	lda [$8F.b],Y		; B7 8F
	clc		; 18
	ora $D50204.l		; 0F 04 02 D5
	ldy $7C7C.w		; AC 7C 7C
	jsr ($CDFF.w,X)		; FC FF CD
	inc $07.b		; E6 07
	cmp ($F5.b,X)		; C1 F5
	ora $E6.b,S		; 03 E6
	adc $75622D.l,X		; 7F 2D 62 75
	cmp $C9C9FA.l,X		; DF FA C9 C9
	stz $E070.w,X		; 9E 70 E0
	bvs   2.b		; 70 02
	cmp $A0.b,X		; D5 A0
	nop		; EA
	ora $4282.w		; 0D 82 42
	dec A		; 3A
	stz $04.b,X		; 74 04
	ldy $E948.w		; AC 48 E9
	tsb $24C0.w		; 0C C0 24
	rol $24.b		; 26 24
	tsa		; 3B
	sep #$41		; E2 41
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	and ($08.b,S),Y		; 33 08
	jsr $E5DF.w		; 20 DF E5
	sbc $64D609.l,X		; FF 09 D6 64
	beq -15.b		; F0 F1
	sbc $3AB6.w,X		; FD B6 3A
	jsl $56B961.l		; 22 61 B9 56
	nop		; EA
	inc $C6D7.w,X		; FE D7 C6
	sbc ($1E.b,S),Y		; F3 1E
	ora $AA0E9F.l,X		; 1F 9F 0E AA
	ora $1E1D.w		; 0D 1D 1E
	bcc  68.b		; 90 44
	cpx #$37ED.w		; E0 ED 37
	sbc $781A.w,X		; FD 1A 78
	tyx		; BB
	lda $701F.w		; AD 1F 70
	jmp ($1DC1.w,X)		; 7C C1 1D
	lda [$81.b]		; A7 81
	cmp ($F8.b),Y		; D1 F8
	sbc $F2F4D3.l,X		; FF D3 F4 F2
	sty $2BE1.w		; 8C E1 2B
	rol $4F.b,X		; 36 4F
	ror $41.b		; 66 41
	dec $BF.b		; C6 BF
	ora #$CE.b		; 09 CE
	and ($84.b,S),Y		; 33 84
	ldy $8D47.w		; AC 47 8D
	pei ($DC.b)		; D4 DC
	ora ($B3.b)		; 12 B3
	rts		; 60

	inx		; E8
	ora $7180.w,Y		; 19 80 71
	clv		; B8
	cmp [$78.b]		; C7 78
	and $66.b		; 25 66
	cpy #$E29E.w		; C0 9E E2
	phd		; 0B
	sec		; 38
	cmp $254A.w,X		; DD 4A 25
	ror $13.b		; 66 13
	ora ($F1.b),Y		; 11 F1
	ora #$A6.b		; 09 A6
	ldx $91.b		; A6 91
	ora ($B1.b)		; 12 B1
	pld		; 2B
	ora $A6A5.w,Y		; 19 A5 A6
	bit $EC.b,X		; 34 EC
	stx $7401.w		; 8E 01 74
	cpx $0880.w		; EC 80 08
	rol $9A80.w,X		; 3E 80 9A
	cop $6C.b		; 02 6C
	inc A		; 1A
	asl $C0.b		; 06 C0
	sbc $710F.w,X		; FD 0F 71
	cmp $33.b		; C5 33
	cmp #$88.b		; C9 88
	jsr $EDDA.w		; 20 DA ED
	ply		; 7A
	wai		; CB
	lda [$EF.b],Y		; B7 EF
	cmp ($01.b,X)		; C1 01
	cmp $33.b		; C5 33
	cmp $2C88.w		; CD 88 2C
	stx $FF.b		; 86 FF
	rtl		; 6B

	cmp $B961.w,X		; DD 61 B9
	ora $9E.b		; 05 9E
	rti		; 40

	ora $3F39.w,Y		; 19 39 3F
	adc $779BC1.l,X		; 7F C1 9B 77
	brk $16.b		; 00 16
	sbc $499E.w		; ED 9E 49
	sta $7ED3.w,X		; 9D D3 7E
	bit $EC56.w,X		; 3C 56 EC
	.db $82, $DE, $21		; 82 DE 21
	lda [$8A.b],Y		; B7 8A
	inc $03D4.w		; EE D4 03
	lda $26.b,S		; A3 26
	txy		; 9B
	sec		; 38
	ora $7C6D2E.l		; 0F 2E 6D 7C
	sta ($C6.b),Y		; 91 C6
	cmp $BFE9.w,Y		; D9 E9 BF
	ora $BAEB.w,X		; 1D EB BA
	cmp $E563.w,Y		; D9 63 E5
	sbc $FA6338.l,X		; FF 38 63 FA
	tas		; 1B
	lda $93F2.w,Y		; B9 F2 93
	trb $BE93.w		; 1C 93 BE
	bit $07.b		; 24 07
	bne  -1.b		; D0 FF
	stx $7F.b		; 86 7F
	ora #$11.b		; 09 11
	ora ($2D.b),Y		; 11 2D
	phy		; 5A
	dec $36.b		; C6 36
	ldy $84.b		; A4 84
	cpy $87.b		; C4 87
	jmp ($5B48.w,X)		; 7C 48 5B
	cmp $73.b		; C5 73
	tsb $A274.w		; 0C 74 A2
	jsl $602625.l		; 22 25 26 60
	ora ($13.b)		; 12 13
	ora ($1D.b)		; 12 1D
	sbc ($20.b),Y		; F1 20
	dey		; 88
	dey		; 88
	dey		; 88
	bit #$39.b		; 89 39
	and ($A4.b,X)		; 21 A4
	pha		; 48
	adc ($09.b,S),Y		; 73 09
	tsb $EC.b		; 04 EC
	cpy $44.b		; C4 44
	mvp $49,$44		; 44 44 49
	cmp #$0D.b		; C9 0D
	and $3A.b,S		; 23 3A
	ora $7388.w,X		; 1D 88 73
	ldx $AE.b,Y		; B6 AE
	phx		; DA
	eor $22B2.w,X		; 5D B2 22
	bmi -80.b		; 30 B0
	bcs -80.b		; B0 B0
	bcs -50.b		; B0 CE
	pha		; 48
	adc #$0A.b		; 69 0A
	tay		; A8
	tax		; AA
	dey		; 88
	sta $FA0D.w		; 8D 0D FA
	and [$33.b],Y		; 37 33
	and ($74.b)		; 32 74
	sta $54.b		; 85 54
	eor $C1.b,X		; 55 C1
	sta $34DA8A.l		; 8F 8A DA 34
	bit $CA.b,X		; 34 CA
	and $FD74.w		; 2D 74 FD
	dex		; CA
	tax		; AA
	rol A		; 2A
	sbc $6B.b		; E5 6B
	inc $6CF5.w		; EE F5 6C
	sta ($A1.b,X)		; 81 A1
	lda $1219.w,Y		; B9 19 12
	asl $FA.b,X		; 16 FA
	adc $54.b,X		; 75 54
	eor $E9.b,X		; 55 E9
	adc $A359D6.l,X		; 7F D6 59 A3
	lda $A1.b		; A5 A1
	lda ($B9.b,X)		; A1 B9
	cmp [$98.b]		; C7 98
	eor $45.b,X		; 55 45
	eor ($DC.b),Y		; 51 DC
	sbc ($E9.b)		; F2 E9
	sta $BBA1.w		; 8D A1 BB
	ldy $B0BE.w,X		; BC BE B0
	ora $BFFEC9.l		; 0F C9 FE BF
	stz $76AE.w,X		; 9E AE 76
	tda		; 7B
	sta $F3CFCE.l,X		; 9F CE CF F3
	inc $2B1E.w,X		; FE 1E 2B
	adc $CB.b,S		; 63 CB
	cmp $5F.b,S		; C3 5F
.ACCU 8
	sep #$6A		; E2 6A
	ror A		; 6A
	ror A		; 6A
	nop		; EA
	rol $6146.w,X		; 3E 46 61
	tyx		; BB
	lda $9D.b,X		; B5 9D
	trb $71.b		; 14 71
	phk		; 4B
	ldx $597A.w,Y		; BE 7A 59
	ply		; 7A
	lsr $DF6E.w,X		; 5E 6E DF
	sbc $6FFA.w		; ED FA 6F
	and $18F8.w,X		; 3D F8 18
	lda $D6.b,S		; A3 D6
	.db $62, $62, $62		; 62 62 62
	sta $F3BF81.l,X		; 9F 81 BF F3
	tya		; 98
	cld		; D8
	dex		; CA
	tay		; A8
	tax		; AA
	sta $71BF.w,X		; 9D BF 71
	sta $D0B2.w		; 8D B2 D0
	bne -36.b		; D0 DC
	ror $95CE.w,X		; 7E CE 95
	cmp $54.b,X		; D5 54
	eor $1C.b,X		; 55 1C
	sbc $6814.w		; ED 14 68
	jmp ($24E7.w)		; 6C E7 24
	cmp ($15.b)		; D2 15
	eor ($55.b),Y		; 51 55
	ora ($1A.b),Y		; 11 1A
	tas		; 1B
	and $A421.w,Y		; 39 21 A4
	rol A		; 2A
	lda $63.b,S		; A3 63
	.db $62, $22, $34		; 62 22 34
	rol $72.b,X		; 36 72
	eor $48.b,S		; 43 48
	cpx $D3.b		; E4 D3
	cpy $93A7.w		; CC A7 93
	phk		; 4B
	eor $44943A.l		; 4F 3A 94 44
	adc #$69.b		; 69 69
	adc #$69.b		; 69 69
	adc #$9C.b		; 69 9C
	bcc -46.b		; 90 D2
	and $8D.b		; 25 8D
	stx $A15E.w		; 8E 5E A1
	dec $BDCB.w,X		; DE CB BD
	mvp $36,$46		; 44 46 36
	rol $36.b,X		; 36 36
	rol $39.b,X		; 36 39
	cmp #$0D.b		; C9 0D
	and ($55.b,X)		; 21 55
	sta ($AD.b,X)		; 81 AD
	lda $1A11.w		; AD 11 1A
	tas		; 1B
	and $A421.w,Y		; 39 21 A4
	adc ($66.b)		; 72 66
	inc $4D.b		; E6 4D
	cmp #$99.b		; C9 99
	txy		; 9B
	sta $2232.w,X		; 9D 32 22
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($26.b,S),Y		; 33 26
	tay		; A8
	dey		; 88
	txs		; 9A
	sta $3C89.w,Y		; 99 89 3C
	dey		; 88
	dey		; 88
	dey		; 88
	dey		; 88
	stx $5BDB.w		; 8E DB 5B
	jmp ($9DED.w)		; 6C ED 9D
	lda ($B6.b,S),Y		; B3 B6
	lda $1DEC.w,X		; BD EC 1D
	ldx $9F.b,Y		; B6 9F
	phy		; 5A
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	rep #$C2		; C2 C2
	bne  47.b		; D0 2F
	pei ($F0.b)		; D4 F0
	tyx		; BB
	adc $8246.w		; 6D 46 82
	sta $E7F5.w,Y		; 99 F5 E7
	lda $7BEE.w,Y		; B9 EE 7B
	sta $8EFBB3.l,X		; 9F B3 FB 8E
	ror $66BF.w,X		; 7E BF 66
	pei ($D4.b)		; D4 D4
	pei ($D4.b)		; D4 D4
	pei ($D4.b)		; D4 D4
	pei ($D4.b)		; D4 D4
	pea $DDBA.w		; F4 BA DD
	pld		; 2B
	cmp ($BD.b)		; D2 BD
	pld		; 2B
	cmp ($DE.b)		; D2 DE
	inc $EF.b,X		; F6 EF
	phk		; 4B
	tda		; 7B
	stp		; DB
	lda ($31.b),Y		; B1 31
	and ($31.b),Y		; 31 31
	and ($31.b),Y		; 31 31
	and ($31.b),Y		; 31 31
	bit $10.b,X		; 34 10
	ldx $68E0.w,Y		; BE E0 68
	and $9CB32E.l,X		; 3F 2E B3 9C
	bne  82.b		; D0 52
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	.db $82, $94, $EA		; 82 94 EA
	cmp ($D2.b)		; D2 D2
	cmp ($D3.b)		; D2 D3
	lda ($E0.b,S),Y		; B3 E0
	ldy $EB.b,X		; B4 EB
	sbc ($5A.b)		; F2 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	phy		; 5A
	eor $BDEB.w,X		; 5D EB BD
	adc [$AE.b],Y		; 77 AE
	sbc $DE.b,X		; F5 DE
	dec $77D0.w,X		; DE D0 77
	lda [$B4.b],Y		; B7 B4
	clc		; 18
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	phx		; DA
	php		; 08
	rts		; 60

	bvs  52.b		; 70 34
	php		; 08
	tsa		; 3B
	asl $56.b,X		; 16 56
	.db $82, $95, $B5		; 82 95 B5
	lda $B5.b,X		; B5 B5
	lda $B5.b,X		; B5 B5
	lda $B5.b,X		; B5 B5
	ldy $14.b,X		; B4 14
	txy		; 9B
	lsr $66.b,X		; 56 66
	ror $66.b		; 66 66
	adc $054F.w		; 6D 4F 05
	txs		; 9A
	ror $334B.w,X		; 7E 4B 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	bit $D2.b,X		; 34 D2
	lda ($CD.b)		; B2 CD
	bit $93D2.w		; 2C D2 93
	eor $E05727.l		; 4F 27 57 E0
	eor $CDD224.l		; 4F 24 D2 CD
	bit $CDD2.w		; 2C D2 CD
	pld		; 2B
	rol A		; 2A
	jsl $84880A.l		; 22 0A 88 84
	sbc ($75.b)		; F2 75
	ror $F204.w,X		; 7E 04 F2
	php		; 08
	dey		; 88
	tax		; AA
	jsl $96880A.l		; 22 0A 88 96
	sed		; F8
	ror $EED2.w,X		; 7E D2 EE
	lda [$0F.b]		; A7 0F
	phx		; DA
	php		; 08
	dey		; 88
.ACCU 8
.INDEX 8
	sep #$71		; E2 71
	jmp $1573C5.l		; 5C C5 73 15
	cmp ($51.b,X)		; C1 51
	bpl -34.b		; 10 DE
	jmp ($A7BD.w,X)		; 7C BD A7
	sbc ($C8.b,X)		; E1 C8
	sbc $11D1.w,X		; FD D1 11
	ora $96.b,X		; 15 96
	tya		; 98
	nop		; EA
	sbc ($5F.b,X)		; E1 5F
	stx $B6.b		; 86 B6
	clv		; B8
	rtl		; 6B

	stx $B8.b		; 86 B8
	ror $DA.b,X		; 76 DA
	ror $D8C3.w,X		; 7E C3 D8
	sbc [$BC.b],Y		; F7 BC
	ora $0B0B55.l,X		; 1F 55 0B 0B
	phd		; 0B
	asl A		; 0A
	ldy $115B.w		; AC 5B 11
	sbc ($25.b)		; F2 25
	tda		; 7B
	ror $57.b		; 66 57
	sbc ($BD.b,X)		; E1 BD
	ldy $BF.b,X		; B4 BF
	.db $62, $8B, $C7		; 62 8B C7
	pla		; 68
	and $67FFA1.l		; 2F A1 FF 67
	inc $7CB6.w,X		; FE B6 7C
	eor [$B3.b]		; 47 B3
	tda		; 7B
	and $237E.w,Y		; 39 7E 23
	eor ($7D.b,X)		; 41 7D
	eor $EE7ED6.l,X		; 5F D6 7E EE
	dec $AB.b		; C6 AB
	tax		; AA
	nop		; EA
	tsx		; BA
	lda $F405.w		; AD 05 F4
	sec		; 38
	rol $7183.w		; 2E 83 71
	sta $D0.b,X		; 95 D0
	bne -32.b		; D0 E0
	ldy $17.b,X		; B4 17
	cmp ($FB.b,X)		; C1 FB
	cmp $75.b,X		; D5 75
	dec $5D2F.w,X		; DE 2F 5D
	eor [$5D.b],Y		; 57 5D
	eor [$5D.b],Y		; 57 5D
	lsr $7F.b,X		; 56 7F
	cpx $F7.b		; E4 F7
	adc $5AF78B.l,X		; 7F 8B F7 5A
	ldy $6C6C.w		; AC 6C 6C
	jmp ($BE55.w)		; 6C 55 BE
	sbc ($7A.b,X)		; E1 7A
	cli		; 58
	ldx $5D.b,Y		; B6 5D
	tya		; 98
	ldx $62.b,Y		; B6 62
	cmp $A58B.w,Y		; D9 8B A5
	dec $BDD4.w		; CE D4 BD
	sbc $A2D8.w		; ED D8 A2
	.db $62, $62, $62		; 62 62 62
	eor $89.b,X		; 55 89
	bit #$C0.b		; 89 C0
	cpx #$6F.b		; E0 6F
	clv		; B8
	trb $060E.w		; 1C 0E 06
	.db $82, $F8, $3D		; 82 F8 3D
	plb		; AB
	txy		; 9B
	and $9EF286.l		; 2F 86 F2 9E
	lsr $0F.b,X		; 56 0F
	ora $BCA0.w		; 0D A0 BC
	tsx		; BA
	lda $AFF55A.l		; AF 5A F5 AF
	phy		; 5A
	sbc $BA.b,X		; F5 BA
	cmp $5D73.w,X		; DD 73 5D
	adc $9EA08D.l,X		; 7F 8D A0 9E
	ora $1E4FB9.l		; 0F B9 4F 1E
	sta $1E4F.w		; 8D 4F 1E
	stz $343D.w,X		; 9E 3D 34
	sbc $C3AF.w,X		; FD AF C3
	sbc $69DF.w,X		; FD DF 69
	lda [$13.b]		; A7 13
	bit #$C4.b		; 89 C4
.INDEX 8
	sep #$55		; E2 55
	lda #$BE.b		; A9 BE
	sbc $E0C063.l		; EF 63 C0 E0
	sta $237804.l		; 8F 04 78 23
	dec $C4CB.w,X		; DE CB C4
	lda $C7A0.w,X		; BD A0 C7
	tas		; 1B
	tas		; 1B
	tas		; 1B
	inc A		; 1A
	ldy $6E6C.w		; AC 6C 6E
	asl $FB.b		; 06 FB
	sta ($C0.b,X)		; 81 C0
	cpx #$70.b		; E0 70
	bit $17.b,X		; 34 17
	cmp $AFF7.w,Y		; D9 F7 AF
	ldy $E37D.w,X		; BC 7D E3
	sbc $B3791F.l		; EF 1F 79 B3
	sbc $D0C455.l		; EF 55 C4 D0
	eor $3DD78B.l		; 4F 8B D7 3D
	xce		; FB
	cmp $DFFBBD.l,X		; DF BD FB DF
	ldx $BC85.w,Y		; BE 85 BC
	dex		; CA
	bne  79.b		; D0 4F
	ora [$02.b]		; 07 02
	ror $8DF2.w		; 6E F2 8D
	and [$79.b],Y		; 37 79
	and [$79.b],Y		; 37 79
	bit $DF.b,X		; 34 DF
	ora ($C0.b,S),Y		; 13 C0
	sed		; F8
	cmp $0B9B2D.l,X		; DF 2D 9B 0B
	sta $C2.b		; 85 C2
	sbc ($55.b,X)		; E1 55
	lda $AB.b		; A5 AB
	asl $38.b		; 06 38
	tay		; A8
	bit #$D1.b		; 89 D1
	eor $E6EF.w,X		; 5D EF E6
	sbc [$08.b],Y		; F7 08
	jsl $79CF23.l		; 22 23 CF 79
	lda ($78.b),Y		; B1 78
	lda ($E0.b),Y		; B1 E0
	cmp [$15.b]		; C7 15
	ora ($0E.b),Y		; 11 0E
	lda $24EFD3.l		; AF D3 EF 24
	eor ($11.b,X)		; 41 11
	ora $66.b,X		; 15 66
	ror $C1.b		; 66 C1
	stx $222A.w		; 8E 2A 22
	ora $815F.w,X		; 1D 5F 81
	bit $2288.w,X		; 3C 88 22
	jsl $8E9BA8.l		; 22 A8 9B 8E
	stz $F2.b		; 64 F2
	tsb $0EF2.w		; 0C F2 0E
	sbc $114554.l		; EF 54 45 11
	ora ($11.b),Y		; 11 11
	ora ($27.b,S),Y		; 13 27
	cmp [$E1.b]		; C7 E1
	xce		; FB
	eor $67.b,S		; 43 67
	sta [$ED.b]		; 87 ED
	ora $BF9C.w		; 0D 9C BF
	bpl -39.b		; 10 D9
	rol $71.b,X		; 36 71
	jmp $1573C5.l		; 5C C5 73 15
	cpy $3157.w		; CC 57 31
	jmp $1573C5.l		; 5C C5 73 15
	cpy $2057.w		; CC 57 20
	pea $B7B6.w		; F4 B6 B7
	and [$B0.b]		; 27 B0
	wai		; CB
	sbc $A7.b,X		; F5 A7
	sbc $FD32.w,X		; FD 32 FD
	adc #$EC.b		; 69 EC
	ora $C3C835.l		; 0F 35 C8 C3
	wai		; CB
	lda $87BDC8.l		; AF C8 BD 87
	sta $5F.b		; 85 5F
	ora [$0F.b]		; 07 0F
	phd		; 0B
	iny		; C8
	lda $AECB.w,X		; BD CB AE
	ora $DD0F7D.l,X		; 1F 7D 0F DD
	sta [$BD.b]		; 87 BD
	pea $6E5E.w		; F4 5E 6E
	asl $D1DB.w,X		; 1E DB D1
	adc $7BB8.w,Y		; 79 B8 7B
	cld		; D8
	ror $09EF.w,X		; 7E EF 09
	sta $6197.w		; 8D 97 61
	cpx $3C.b		; E4 3C
	ora [$91.b],Y		; 17 91
	rol $6AC4.w		; 2E C4 6A
	cmp [$66.b],Y		; D7 66
	cmp $CB6E.w		; CD 6E CB
	lda ($EC.b)		; B2 EC
	tyx		; BB
	tsa		; 3B
	and $B4.b,X		; 35 B4
	ora $D6.b,X		; 15 D6
	sta $F15963.l		; 8F 63 59 F1
	sta $DFF11D.l,X		; 9F 1D F1 DF
	ora $68C463.l,X		; 1F 63 C4 68
	and $C181.w		; 2D 81 C1
	tda		; 7B
	bcs 120.b		; B0 78
	sta $3CE211.l		; 8F 11 E2 3C
	lsr $82.b		; 46 82
	cmp ($AE.b)		; D2 AE
	lda $AFF560.l		; AF 60 F5 AF
	phy		; 5A
	sbc $AF.b,X		; F5 AF
	phy		; 5A
	bne 103.b		; D0 67
	sta $4FFB.w,X		; 9D FB 4F
	ldy $FB.b		; A4 FB
	ora $7BD005.l,X		; 1F 05 D0 7B
	rol $83.b,X		; 36 83
	and [$A5.b],Y		; 37 A5
	adc $9BB732.l		; 6F 32 B7 9B
	cmp $FC04.w		; CD 04 FC
	lsr $AEBE.w,X		; 5E BE AE
	tsx		; BA
	ldy $BFFA.w		; AC FA BF
	ror $87AF.w,X		; 7E AF 87
	eor [$6D.b],Y		; 57 6D
	eor [$C3.b],Y		; 57 C3
	plb		; AB
	sbc [$DC.b],Y		; F7 DC
	eor $668B.w		; 4D 8B 66
	cmp $9C.b		; C5 9C
	tyx		; BB
	and $BB9C1D.l,X		; 3F 1D 9C BB
	rol $22.b,X		; 36 22
	cmp $7BE1.w,Y		; D9 E1 7B
	sei		; 78
	lda $22.b,X		; B5 22
	sbc $F122.w		; ED 22 F1
	jsl $78F1F9.l		; 22 F9 F1 78
	sta ($76.b),Y		; 91 76
	sty $7A4C.w		; 8C 4C 7A
	cmp ($F0.b)		; D2 F0
	tya		; 98
	cmp $DE58.w,Y		; D9 58 DE
	ora ($AD.b)		; 12 AD
	inc $B6.b,X		; F6 B6
	ldx $B6.b,Y		; B6 B6
	ldx $B6.b,Y		; B6 B6
	ldx $82.b,Y		; B6 82
	tyx		; BB
	rol $BFB6.w,X		; 3E B6 BF
	ora ($D5.b),Y		; 11 D5
	adc $5D.b,X		; 75 5D
	eor [$56.b],Y		; 57 56
	lda $B7A011.l,X		; BF 11 A0 B7
	stz $F2.b,X		; 74 F2
	stz $CA53.w,X		; 9E 53 CA
	adc $294F.w,Y		; 79 4F 29
	sbc $34.b		; E5 34
	ora ($E3.b,S),Y		; 13 E3
	adc $B3BF.w,X		; 7D BF B3
	dec $A7.b		; C6 A7
	sta $D957.w		; 8D 57 D9
	lda [$C9.b]		; A7 C9
	plb		; AB
	cpy $A7.b		; C4 A7
	cmp #$A7.b		; C9 A7
	sbc ($38.b),Y		; F1 38
	jmp $EB954D.l		; 5C 4D 95 EB
	.db $62, $E4, $62		; 62 E4 62
	beq -79.b		; F0 B1
	adc ($2B.b)		; 72 2B
	dec $8F.b,X		; D6 8F
	ora $ED.b		; 05 ED
	cpx $117A.w		; EC 7A 11
	cpx #$8F.b		; E0 8F
	bit #$1E.b		; 89 1E
	inc $3E.b,X		; F6 3E
	bit $78.b		; 24 78
	clc		; 18
	cmp $316F.w,Y		; D9 6F 31
	lda ($AB.b)		; B2 AB
	pld		; 2B
	inc A		; 1A
	tsx		; BA
	trb RDMPYH.w		; 1C 17 42
	ldx $5EDE.w,Y		; BE DE 5E
	sbc [$5B.b],Y		; F7 5B
	pea $E73C.w		; F4 3C E7
	lda ($68.b,S),Y		; B3 68
	and ($CA.b,S),Y		; 33 CA
	cmp $03A73C.l,X		; DF 3C A7 03
	sta ($E5.b,X)		; 81 E5
	bit $19.b,X		; 34 19
	sbc $C5FF.w		; ED FF C5
	sbc $8FAD.w,X		; FD AD 8F
	bvs  -5.b		; 70 FB
	sta [$DC.b]		; 87 DC
	bit $19.b,X		; 34 19
	cld		; D8
	bit #$D8.b		; 89 D8
	adc ($57.b,X)		; 61 57
	adc ($A0.b,X)		; 61 A0
	sta $7EFF71.l,X		; 9F 71 FF 7E
	sbc [$E2.b]		; E7 E2
	eor $CDDC.w		; 4D DC CD
	inc $A6.b,X		; F6 A6
	sbc $E8.b		; E5 E8
	sbc $2E37FF.l,X		; FF FF 37 2E
	adc $70DFB4.l		; 6F B4 DF 70
	lda $F4.b,X		; B5 F4
	and $73E161.l		; 2F 61 E1 73
	sed		; F8
	sec		; 38
	sei		; 78
	eor $C70B.w,X		; 5D 0B C7
	cmp $3D.b,X		; D5 3D
	cmp #$F6.b		; C9 F6
	cmp $2E3DE4.l		; CF E4 3D 2E
	eor $949EED.l,X		; 5F ED 9E 94
	inc $ED4F.w,X		; FE 4F ED
	sta [$E7.b],Y		; 97 E7
	rol $F899.w,X		; 3E 99 F8
	tda		; 7B
	trb $47FE.w		; 1C FE 47
	and $E4CF83.l,X		; 3F 83 CF E4
	jmp ($8D3D.w,X)		; 7C 3D 8D
	cmp [$BF.b]		; C7 BF
	dec $4B48.w,X		; DE 48 4B
	ldy $9790.w,X		; BC 90 97
	adc [$D6.b],Y		; 77 D6
	sta ($92.b)		; 92 92
	lda ($33.b,S),Y		; B3 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	asl $3262.w		; 0E 62 32
	and ($24.b,S),Y		; 33 24
	cmp ($A2.b)		; D2 A2
	dey		; 88
	dey		; 88
	sty $4BB3.w		; 8C B3 4B
	bit $A3.b,X		; 34 A3
	tya		; 98
	sty $C88C.w		; 8C 8C C8
	plp		; 28
	ldx #$22.b		; A2 22
	jsl $379B88.l		; 22 88 9B 37
	ror $4D.b,X		; 76 4D
	sta $CCFE.w,X		; 9D FE CC
	stp		; DB
	and $BC.b		; 25 BC
	pha		; 48
.ACCU 8
.INDEX 8
	sep #$B9		; E2 B9
	txa		; 8A
	inc $2B.b		; E6 2B
	tya		; 98
	ldx $B962.w		; AE 62 B9
	bit #$11.b		; 89 11
	and [$B8.b],Y		; 37 B8
	cmp $AD89.w,X		; DD 89 AD
	sta $78.b,X		; 95 78
	sty $14.b,X		; 94 14
	adc $7818.w,Y		; 79 18 78
	eor [$E3.b],Y		; 57 E3
	tax		; AA
	phy		; 5A
	eor $4694.w,Y		; 59 94 46
	ora $D80F7D.l,X		; 1F 7D 0F D8
	sta [$57.b]		; 87 57
	cld		; D8
	inc $0D8E.w,X		; FE 8E 0D
	bvs -19.b		; 70 ED
	lda ($DB.b,X)		; A1 DB
	eor $B6.b,S		; 43 B6
	sbc ($3C.b,X)		; E1 3C
	bit #$76.b		; 89 76
	and $62.b,S		; 23 62
	adc ($55.b,X)		; 61 55
	phy		; 5A
	cpx $1068.w		; EC 68 10
	xba		; EB
	adc $65979D.l		; 6F 9D 97 65
	ldy #$EF.b		; A0 EF
	ora ($E1.b,S),Y		; 13 E1
	ldy $08.b,X		; B4 08
	adc $7B.b,X		; 75 7B
	asl $81.b		; 06 81
	ora $057F.w		; 0D 7F 05
	ldy #$43.b		; A0 43
	lsr $7D.b,X		; 56 7D
	eor $5D75.w,X		; 5D 75 5D
	sta [$2F.b]		; 87 2F
	and $CFFFF2.l,X		; 3F F2 FF CF
	sta $592D.w,X		; 9D 2D 59
	inc $5C2F.w,X		; FE 2F 5C
	lda $2C8E.w		; AD 8E 2C
	and $9AFD3F.l		; 2F 3F FD 9A
	stx $C6.b,Y		; 96 C6
	and $EF4C.w		; 2D 4C EF
	ora ($2D.b)		; 12 2D
	stz $D3EE.w		; 9C EE D3
	sta $DA.b		; 85 DA
	eor [$F3.b]		; 47 F3
.ACCU 8
	sep #$E9		; E2 E9
	eor $699D.w,X		; 5D 9D 69
	cli		; 58
	cld		; D8
	lda $8A.b		; A5 8A
	lsr $0A17.w,X		; 5E 17 0A
	and $89.b,X		; 35 89
	rtl		; 6B

	pla		; 68
	bpl -20.b		; 10 EC
	sed		; F8
	eor $2E02.w		; 4D 02 2E
	sbc #$A0.b		; E9 A0
	eor $4F.b,S		; 43 4F
	inc A		; 1A
	stz $3E3D.w,X		; 9E 3D 3E
	ora [$DA.b],Y		; 17 DA
	cpx $53.b		; E4 53
	lda $69C9.w		; AD C9 69
	lda [$8F.b]		; A7 8F
	cmp [$6C.b]		; C7 6C
	adc ($38.b),Y		; 71 38
	tad		; 5B
	sbc $2B4D.w		; ED 4D 2B
	bit #$8F.b		; 89 8F
	.db $42, $3E		; 42 3E
	bit $78.b		; 24 78
	and $C1.b		; 25 C1
	tda		; 7B
	tsb $B8.b		; 04 B8
	and $DE.b,S		; 23 DE
	clv		; B8
	and $6CAC2C.l		; 2F 2C AC 6C
	jmp ($6B6C.w)		; 6C 6C 6B
	tas		; 1B
	cmp $DDFF.w,Y		; D9 FF DD
	ldy #$43.b		; A0 43
	dex		; CA
	cmp $7B0834.l,X		; DF 34 08 7B
	adc $8166.w,X		; 7D 66 81
	asl $4DC4.w		; 0E C4 4D
	cop $19.b		; 02 19
	tyx		; BB
	stz $BCEF.w,X		; 9E EF BC
	txy		; 9B
	sta $F2.b,S		; 83 F2
	sed		; F8
	eor ($5E.b,S),Y		; 53 5E
	cpx $B3.b		; E4 B3
	eor $51DE.w		; 4D DE 51
	phy		; 5A
	jmp.w [$F62D]		; DC 2D F6
	ldx $96.b		; A6 96
	adc $C2.b		; 65 C2
	sta $27F76C.l,X		; 9F 6C F7 27
	cmp $BB.b,X		; D5 BB
	inc $7393.w,X		; FE 93 73
	and [$FF.b],Y		; 37 FF
	cpx $5C74.w		; EC 74 5C
	sbc [$D3.b],Y		; F7 D3
	and $D9FE39.l,X		; 3F 39 FE D9
	jmp ($F958.w,X)		; 7C 58 F9
	lda ($73.b),Y		; B1 73
	sbc ($E7.b,X)		; E1 E7
	ldx #$4B.b		; A2 4B
	sta $2C29.w,Y		; 99 29 2C
	sta ($92.b)		; 92 92
	cmp #$28.b		; C9 28
	pld		; 2B
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($32.b,S),Y		; 33 32
	dey		; 88
	inc $23.b		; E6 23
	and $33.b,S		; 23 33
	jsl $88880A.l		; 22 0A 88 88
	dey		; 88
	lda $32.b,S		; A3 32
	eor $233B.w		; 4D 3B 23
	cpy $5664.w		; CC 64 56
	lsr $69.b		; 46 69
	eor $1151.w,Y		; 59 51 11
	ora ($04.b),Y		; 11 04
	and [$64.b]		; 27 64
	adc $8A8C.w,Y		; 79 8C 8A
	iny		; C8
	txa		; 8A
	ldx #$22.b		; A2 22
	jsl $87B643.l		; 22 43 B6 87
	adc $8BA7.w		; 6D A7 8B
	and $32E6.w,Y		; 39 E6 32
	pld		; 2B
	jsl $C2C2AA.l		; 22 AA C2 C2
	dey		; 88
	dey		; 88
	plb		; AB
	jmp $AF77.w		; 4C 77 AF
	eor $DA35.w		; 4D 35 DA
	lsr $45.b,X		; 56 45
	lsr $96.b,X		; 56 96
	sta $95.b,X		; 95 95
	sta $5411.w		; 8D 11 54
	mvn $64,$01		; 54 01 64
	eor $44.b,X		; 55 44
	eor $51.b,X		; 55 51
	ora $6E.b,X		; 15 6E
	adc ($58.b,X)		; 61 58
	adc ($DA.b,X)		; 61 DA
	phy		; 5A
	eor $5B15.w,Y		; 59 15 5B
	sty $F42A.w		; 8C 2A F4
	pld		; 2B
	mvp $AE,$AB		; 44 AB AE
	plb		; AB
	ldx $3FAB.w		; AE AB 3F
	ror $AB.b		; 66 AB
	rol $30.b,X		; 36 30
	phx		; DA
	eor $1B1B.w,Y		; 59 1B 1B
	ora $AB.b,X		; 15 AB
	adc [$62.b]		; 67 62
	sbc $28AC.w,X		; FD AC 28
	sta ($6C.b),Y		; 91 6C
	cmp $B3.b		; C5 B3
	asl $E7.b,X		; 16 E7
	and $D6D6.w,Y		; 39 D6 D6
	nop		; EA
	inc $16.b,X		; F6 16
	lsr $26.b		; 46 26
	and $58.b		; 25 58
	lda $A2.b,X		; B5 A2
	cld		; D8
	ora ($15.b),Y		; 11 15
	ror $96.b		; 66 96
	sty $CB04.w		; 8C 04 CB
	jsl $3233AB.l		; 22 AB 33 32
	ldy $8DA8.w		; AC A8 8D
	sta $DF90.w		; 8D 90 DF
	cli		; 58
	ldx #$DA.b		; A2 DA
	.db $42, $B2		; 42 B2
	rol A		; 2A
	bcs -79.b		; B0 B1
	rol A		; 2A
	cmp $8FA744.l,X		; DF 44 A7 8F
	eor $799A1E.l		; 4F 1E 9A 79
	and $599131.l		; 2F 31 91 59
	trb $254E.w		; 1C 4E 25
	phy		; 5A
	phy		; 5A
	eor ($12.b),Y		; 51 12
	bit $E011.w,X		; 3C 11 E0
	sta $5995A8.l		; 8F A8 95 59
	ora $91.b,X		; 15 91
	sta $568D.w		; 8D 8D 56
	rol $34.b,X		; 36 34
	mvp $15,$55		; 44 55 15
	txs		; 9A
	rts		; 60

	eor $5115.w,Y		; 59 15 51
	sta $4455.w,Y		; 99 55 44
	rtl		; 6B

	rtl		; 6B

	phb		; 8B
	cmp $D8.b		; C5 D8
	cld		; D8
	stx $1C.b		; 86 1C
	tay		; A8
	stx $45.b,Y		; 96 45
	lsr $26.b,X		; 56 26
	and $5A.b		; 25 5A
	sta ($26.b),Y		; 91 26
	sbc $26EF26.l		; EF 26 EF 26
	txy		; 9B
	sta ($FB.b)		; 92 FB
	sbc $5664.w,Y		; F9 64 56
	eor [$0B.b]		; 47 0B
	sta $56.b		; 85 56
	ror $64.b		; 66 64
	mvp $09,$11		; 44 11 09
	asl $2263.w,X		; 1E 63 22
	lda ($22.b)		; B2 22
	rol A		; 2A
	dey		; 88
	dey		; 88
	phb		; 8B
	tax		; AA
	bne -83.b		; D0 AD
	eor $9E45.w		; 4D 45 9E
	stz $44.b,X		; 74 44
	mvp $CC,$D4		; 44 D4 CC
	eor #$E4.b		; 49 E4
	eor $8556.w,X		; 5D 56 85
	ror A		; 6A
	ror A		; 6A
	.db $62, $78, $7A		; 62 78 7A
	pla		; 68
	dey		; 88
	bit #$A9.b		; 89 A9
	sta $DF8A.w,Y		; 99 8A DF
	ora $5A7535.l		; 0F 35 75 5A
	ora $A9.b,X		; 15 A9
	lda #$73.b		; A9 73
	sta [$E5.b],Y		; 97 E5
	ldy $4484.w,X		; BC 84 44
	mvp $CC,$D4		; 44 D4 CC
	phb		; 8B
	asl $6B45.w		; 0E 45 6B
	tax		; AA
	bne -81.b		; D0 AF
	ora $53.b,S		; 03 53
	ora ($A3.b,S),Y		; 13 A3
	ldx $88.b		; A6 88
	dey		; 88
	stz $5707.w,X		; 9E 07 57
	txa		; 8A
	dec $728E.w,X		; DE 8E 72
	nop		; EA
	ldy $2B.b,X		; B4 2B
	pei ($6A.b)		; D4 6A
	tda		; 7B
	sta $BC6B.w		; 8D 6B BC
	stz $44.b,X		; 74 44
	mvp $3C,$ED		; 44 ED 3C
	asl $C5A7.w,X		; 1E A7 C5
	cmp $D0AA2B.l,X		; DF 2B AA D0
	ldx $F1EB.w		; AE EB F1
	xce		; FB
	adc $AE9D.w,X		; 7D 9D AE
	bit $44.b		; 24 44
	mvp $FD,$F9		; 44 F9 FD
	lda $56CC.w		; AD CC 56
	sta $9E.b,X		; 95 9E
	ply		; 7A
	xba		; EB
	lda $F6.b,X		; B5 F6
	ror $3787.w,X		; 7E 87 37
	adc ($87.b,S),Y		; 73 87
	txy		; 9B
	cmp $A9E2.w		; CD E2 A9
	bit $DA95.w,X		; 3C 95 DA
	pea $C3F5.w		; F4 F5 C3
	adc $C7.b		; 65 C7
	ror $908F.w		; 6E 8F 90
	sbc $3F1D.w,X		; FD 1D 3F
	ora $B7F9.w,Y		; 19 F9 B7
	lda ($25.b,S),Y		; B3 25
	cmp ($7D.b),Y		; D1 7D
	adc $EA.b,S		; 63 EA
	txy		; 9B
	beq -24.b		; F0 E8
	sbc [$55.b]		; E7 55
	trb $D2.b		; 14 D2
	cmp $34BD.w,X		; DD BD 34
	ldx #$3F.b		; A2 3F
	sed		; F8
	sbc ($6A.b)		; F2 6A
	lda $CBE1D3.l,X		; BF D3 E1 CB
	cmp $D3.b,S		; C3 D3
	sbc ($CF.b,X)		; E1 CF
	cmp $76.b,S		; C3 76
	jsr ($E1D7.w,X)		; FC D7 E1
	cmp $B7.b		; C5 B7
	ror $1B37.w		; 6E 37 1B
	sta $16C6.w		; 8D C6 16
	ora $67.b,X		; 15 67
	stz $F7BA.w,X		; 9E BA F7
	txy		; 9B
	dec $8B92.w		; CE 92 8B
	sta ($91.b),Y		; 91 91
	ldy $DA.b,X		; B4 DA
	phy		; 5A
	ldy $93.b,X		; B4 93
	cmp #$5D.b		; C9 5D
	lda $4E7E.w		; AD 7E 4E
	ora $CEA11B.l		; 0F 1B A1 CE
	sbc [$74.b]		; E7 74
	dec A		; 3A
	ora $AC.b,X		; 15 AC
	sbc ($D7.b,S),Y		; F3 D7
	jmp $665DFA.l		; 5C FA 5D 66
	adc $D94F0F.l		; 6F 0F 4F D9
	inc $E8.b		; E6 E8
	sbc #$A4.b		; E9 A4
	sbc ($57.b)		; F2 57
	ror A		; 6A
	adc $CD3A.w,Y		; 79 3A CD
	rol $6E1E.w		; 2E 1E 6E
	sbc $39474F.l,X		; FF 4F 47 39
	adc [$9E.b]		; 67 9E
	tsx		; BA
	sbc ($3F.b)		; F2 3F
	tyx		; BB
	bit #$83.b		; 89 83
	plx		; FA
	ldy $478F.w,X		; BC 8F 47
	cmp $7FFF.w		; CD FF 7F
	bcc -109.b		; 90 93
	cmp #$5D.b		; C9 5D
	lda $87CE4F.l		; AF 4F CE 87
	asl $7B45.w		; 0E 45 7B
	rtl		; 6B

	rol $F5.b,X		; 36 F5
	ldy $D7F3.w		; AC F3 D7
	jmp $E6E6F3.l		; 5C F3 E6 E6
	cmp $9B9BA5.l		; CF A5 9B 9B
	sbc $4F9AF6.l,X		; FF F6 9A 4F
	and $76.b		; 25 76
	lda [$93.b]		; A7 93
	and [$87.b],Y		; 37 87
	bit $669D.w,X		; 3C 9D 66
	stx $8E.b,Y		; 96 8E
	adc ($CF.b)		; 72 CF
	and $CF75.w,X		; 3D 75 CF
	and $BFC7.w,X		; 3D C7 BF
	lda ($17.b)		; B2 17
.INDEX 16
	rep #$52		; C2 52
	adc $B52B.w,Y		; 79 2B B5
	bit $3097.w,X		; 3C 97 30
	phx		; DA
	ldy $6745.w		; AC 45 67
	stz $E7BA.w,X		; 9E BA E7
	sta $793637.l,X		; 9F 37 36 79
	cpx $93.b		; E4 93
	adc $49BC.w,Y		; 79 BC 49
	cpx $AE.b		; E4 AE
	pei ($F2.b)		; D4 F2
	ror $F0.b		; 66 F0
	sbc [$92.b]		; E7 92
	eor #$E7.b		; 49 E7
	cpx $AC.b		; E4 AC
	sbc ($D7.b,S),Y		; F3 D7
	lsr $9F96.w,X		; 5E 96 9F
	lda ($CE.b)		; B2 CE
	inc $DD8B.w,X		; FE 8B DD
	lsr $77.b,X		; 56 77
	adc [$79.b],Y		; 77 79
	and [$92.b]		; 27 92
	tyx		; BB
	jmp $FEDD3C.l		; 5C 3C DD FE
	stz $758E.w,X		; 9E 8E 75
	stp		; DB
	cmp ($4A.b,S),Y		; D3 4A
	lda ($CF.b,S),Y		; B3 CF
	eor $CD7B.w,X		; 5D 7B CD
	sbc [$CC.b]		; E7 CC
	ldx #$64E4.w		; A2 E4 64
	adc $9D36.w		; 6D 36 9D
	cmp $2715.w		; CD 15 27
	sta ($BB.b)		; 92 BB
	eor ($F2.b,S),Y		; 53 F2
	adc ($7C.b,S),Y		; 73 7C
	adc $777E.w		; 6D 7E 77
	tsa		; 3B
	lda ($FC.b,X)		; A1 FC
	ora $AC.b,X		; 15 AC
	sbc ($D7.b,S),Y		; F3 D7
	jmp $E6E6F3.l		; 5C F3 E6 E6
	cmp $69923C.l		; CF 3C 92 69
	adc #$24.b		; 69 24
	sbc ($57.b)		; F2 57
	ror A		; 6A
	adc $7833.w,Y		; 79 33 78
	adc ($C9.b,S),Y		; 73 C9
	bit $F3.b		; 24 F3
	iny		; C8
	lda ($CF.b,S),Y		; B3 CF
	eor $CF73.w,X		; 5D 73 CF
	sbc $BB73.w		; ED 73 BB
	xba		; EB
	dec $F70B.w,X		; DE 0B F7
	trb $9E.b		; 14 9E
	lsr A		; 4A
	sbc $254F.w		; ED 4F 25
	stp		; DB
	cmp ($4A.b,S),Y		; D3 4A
	jsl $5DCFB3.l		; 22 B3 CF 5D
	adc ($CF.b,S),Y		; 73 CF
	adc ($C2.b,S),Y		; 73 C2
	jsr ($0F3D.w,X)		; FC 3D 0F
	sta [$CF.b]		; 87 CF
	cmp #$BE.b		; C9 BE
	sta ($C9.b,S),Y		; 93 C9
	eor $E4A9.w,X		; 5D A9 E4
	sta $5D450F.l		; 8F 0F 45 5D
	wai		; CB
	rol $EA.b,X		; 36 EA
	cmp $CF753D.l		; CF 3D 75 CF
	rol $6C6E.w,X		; 3E 6E 6C
	sbc ($C9.b,S),Y		; F3 C9
	bit $F3.b		; 24 F3
	ldy $F2.b		; A4 F2
	eor [$6A.b],Y		; 57 6A
	adc $7833.w,Y		; 79 33 78
	adc ($C9.b,S),Y		; 73 C9
	bit $F3.b		; 24 F3
	iny		; C8
	lda ($CF.b,S),Y		; B3 CF
	eor $3A7A.w,X		; 5D 7A 3A
	ror $3BCB.w,X		; 7E CB 3B
	tyx		; BB
	lda $4BD5.w,X		; BD D5 4B
	sbc ($94.b,S),Y		; F3 94
	stz $ED4A.w,X		; 9E 4A ED
	pla		; 68
	sbc [$5D.b]		; E7 5D
	lda $B734.w,X		; BD 34 B7
	adc $CF2A4D.l		; 6F 4D 2A CF
	and $EF75.w,X		; 3D 75 EF
	and [$99.b],Y		; 37 99
	lda $CFB3.w,Y		; B9 B3 CF
	cmp #$E4.b		; C9 E4
	jsr ($2A6A.w,X)		; FC 6A 2A
	eor $A77625.l		; 4F 25 76 A7
	cpx $F2.b		; E4 F2
	clv		; B8
	ror $93EF.w,X		; 7E EF 93
	sbc #$35.b		; E9 35
	sbc $39DF.w,X		; FD DF 39
	adc [$9F.b]		; 67 9F
	ora $73.b,X		; 15 73
	sbc #$75.b		; E9 75
	sta $3DBC.w,Y		; 99 BC 3D
	and $FC9D67.l,X		; 3F 67 9D FC
	sbc [$92.b],Y		; F7 92
	adc $5B31.w,Y		; 79 31 5B
	stz $B34E.w,X		; 9E 4E B3
	phk		; 4B
	sta [$9B.b]		; 87 9B
	lda $CED1D3.l,X		; BF D3 D1 CE
	inc $BB39.w		; EE 39 BB
	tyx		; BB
	and $9ECD.w,X		; 3D CD 9E
	sta $14.b,S		; 83 14
	cld		; D8
	ror $1E46.w,X		; 7E 46 1E
	wai		; CB
	ora $C1C3D6.l		; 0F D6 C3 C1
	sbc $60E0.w		; ED E0 60
	adc $1BB7.w		; 6D B7 1B
	sta $E2C6.w		; 8D C6 E2
	lda ($CF.b,S),Y		; B3 CF
	stp		; DB
	eor ($77.b),Y		; 51 77
	txy		; 9B
	dec $8B92.w		; CE 92 8B
	sta ($91.b),Y		; 91 91
	ldy $DA.b,X		; B4 DA
	stz $64.b		; 64 64
	bit $F2.b		; 24 F2
	eor [$DC.b],Y		; 57 DC
	cmp $78E5C9.l		; CF C9 E5 78
	phx		; DA
	jsr ($77EE.w,X)		; FC EE 77
	eor $A1.b,S		; 43 A1
	dec $E759.w		; CE 59 E7
	ldx $E7B9.w		; AE B9 E7
	cmp $9FCD.w		; CD CD 9F
	phk		; 4B
	ldy $E1CD.w		; AC CD E1
	sbc #$24.b		; E9 24
	sbc ($57.b)		; F2 57
	ror A		; 6A
	adc $7833.w,Y		; 79 33 78
	adc ($C9.b,S),Y		; 73 C9
	dec $69.b,X		; D6 69
	bvs -13.b		; 70 F3
	eor [$BE.b],Y		; 57 BE
	beq  56.b		; F0 38
	cmp $F0.b,X		; D5 F0
	and ($18.b),Y		; 31 18
	sty $6C57.w		; 8C 57 6C
	xba		; EB
	bit $A54F.w		; 2C 4F A5
	dec $F1.b,X		; D6 F1
	plx		; FA
	stz $5BEA.w,X		; 9E EA 5B
	adc $06B6.w		; 6D B6 06
	ora $67.b		; 05 67
	stz $E7BA.w,X		; 9E BA E7
	sta $793737.l,X		; 9F 37 37 79
	ldy $CACA.w,X		; BC CA CA
	iny		; C8
	iny		; C8
	eor #$E4.b		; 49 E4
	ldx $F2D4.w		; AE D4 F2
	adc ($B8.b)		; 72 B8
	ply		; 7A
	jsr ($4E9E.w,X)		; FC 9E 4E
	ldx $39BF.w,Y		; BE BF 39
	adc [$9F.b]		; 67 9F
	sta $D15F.w,X		; 9D 5F D1
	plx		; FA
	inc $DCB3.w,X		; FE B3 DC
	adc [$3C.b],Y		; 77 3C
	eor $962F2B.l,X		; 5F 2B 2F 96
	lda ($27.b),Y		; B1 27
	sta ($9B.b,S),Y		; 93 9B
	lda [$EF.b],Y		; B7 EF
	lda ($BA.b,S),Y		; B3 BA
	plb		; AB
	cmp $A3C4.w,X		; DD C4 A3
	cop $B3.b		; 02 B3
	cmp $CF735D.l		; CF 5D 73 CF
	txy		; 9B
	txy		; 9B
	bit $49F2.w,X		; 3C F2 49
	ldy $24DE.w,X		; BC DE 24
	sbc ($57.b)		; F2 57
	ror A		; 6A
	adc $7833.w,Y		; 79 33 78
	adc ($C9.b,S),Y		; 73 C9
	cmp #$9F.b		; C9 9F
	eor $CFB392.l,X		; 5F 92 B3 CF
	eor $CF73.w,X		; 5D 73 CF
	txy		; 9B
	txy		; 9B
	lda $A5.b		; A5 A5
	sta $7A9D.w,X		; 9D 9D 7A
	sbc ($4F.b)		; F2 4F
	and $76.b		; 25 76
	lda [$93.b]		; A7 93
	inc $FF.b,X		; F6 FF
	sbc $CDC3.w,Y		; F9 C3 CD
	cmp $E7E8E9.l,X		; DF E9 E8 E7
	mvn $DE,$E8		; 54 E8 DE
	xce		; FB
	lda $23FF72.l		; AF 72 FF 23
	phx		; DA
	pld		; 2B
	eor $4575.w,X		; 5D 75 45
	bit $B3.b,X		; 34 B3
	lsr A		; 4A
	jsl $FF6923.l		; 22 23 69 FF
	sta [$1F.b]		; 87 1F
	sbc $3C.b,X		; F5 3C
	eor $2FCD47.l,X		; 5F 47 CD 2F
	sbc $F7FB.w,X		; FD FB F7
	ror A		; 6A
	xce		; FB
	pea $F550.w		; F4 50 F5
	rol $DBE9.w		; 2E E9 DB
	bcs -80.b		; B0 B0
	lda ($3E.b),Y		; B1 3E
	bit #$5F.b		; 89 5F
	and $2667.w,X		; 3D 67 26
	lda $8759FF.l,X		; BF FF 59 87
	ora [$6B.b],Y		; 17 6B
	eor $F5.b		; 45 F5
	bit $7D.b,X		; 34 7D
	ldx $06DE.w,Y		; BE DE 06
	cmp ($03.b,S),Y		; D3 03
	adc $9EEE.w		; 6D EE 9E
	tsa		; 3B
	cmp [$79.b]		; C7 79
	tax		; AA
	sbc $AA9E37.l		; EF 37 9E AA
	phb		; 8B
	sta ($91.b),Y		; 91 91
	adc ($E5.b)		; 72 E5
	plb		; AB
	bvc  64.b		; 50 40
	ora #$3F.b		; 09 3F
	rol $BF.b		; 26 BF
	lda ($AF.b,S),Y		; B3 AF
	dec $86C1.w		; CE C1 86
	dex		; CA
	stp		; DB
	ora [$13.b],Y		; 17 13
	sta $F2.b		; 85 F2
	ora $8F8D.w,X		; 1D 8D 8F
	tyx		; BB
	lda $8F7A.w		; AD 7A 8F
	bit $23A2.w		; 2C A2 23
	sta ($E5.b)		; 92 E5
	lda [$5B.b],Y		; B7 5B
	ldy $CFCF.w		; AC CF CF
	adc $A1A1BF.l		; 6F BF A1 A1
	eor $D7.b,X		; 55 D7
	adc $82.b		; 65 82
	jsl $983622.l		; 22 22 36 98
	trb $FDBB.w		; 1C BB FD
	eor $F9.b		; 45 F9
	lda $6DFCF0.l		; AF F0 FC 6D
	dec $A7E7.w		; CE E7 A7
	ldx #$E7E7.w		; A2 E7 E7
	sty $2C.b		; 84 2C
	bit $482F.w		; 2C 2F 48
	sbc ($DE.b)		; F2 DE
	eor ($C2.b,S),Y		; 53 C2
	lsr $08.b,X		; 56 08
	asl A		; 0A
	php		; 08
	cmp [$65.b],Y		; D7 65
	sta $0E8D.w		; 8D 8D 0E
	lda [$17.b],Y		; B7 17
	cmp ($BD.b),Y		; D1 BD
	cmp ($C7.b)		; D2 C7
	sbc $AF.b,X		; F5 AF
	adc $31.b,X		; 75 31
	wai		; CB
	eor [$51.b]		; 47 51
	cmp ($CE.b),Y		; D1 CE
	ora $A5A5.w,Y		; 19 A5 A5
	sta $1E99.w,Y		; 99 99 1E
	tyx		; BB
	cmp $CB.b		; C5 CB
	tax		; AA
	sta $B0F5.w		; 8D F5 B0
	cpx $DF.b		; E4 DF
	plx		; FA
	adc [$FE.b],Y		; 77 FE
	sta $AAFA.w,X		; 9D FA AA
	txa		; 8A
	iny		; C8
	tya		; 98
	txy		; 9B
	sty $2C2C.w		; 8C 2C 2C
	bit $994F.w		; 2C 4F 99
	phb		; 8B
	lsr $F7.b		; 46 F7
	adc $6D2F.w		; 6D 2F 6D
	and $3A1A.w		; 2D 1A 3A
	bit $0C51.w,X		; 3C 51 0C
	cmp ($8C.b)		; D2 8C
	cpy $2DCD.w		; CC CD 2D
	and $954F.w		; 2D 4F 95
	adc $2DEE.w,X		; 7D EE 2D
	inc $1B.b,X		; F6 1B
	sbc [$E9.b],Y		; F7 E9
	ldx $AA.b		; A6 AA
	lda #$A3.b		; A9 A3
	sta $E3B6.w		; 8D B6 E3
	phd		; 0B
	tas		; 1B
	ora ($1B.b,S),Y		; 13 1B
	tas		; 1B
	clv		; B8
	jmp.w [$6464]		; DC 64 64
	ora $BB.b		; 05 BB
	bvs  65.b		; 70 41
	ror $728F.w		; 6E 8F 72
	sbc [$F8.b]		; E7 F8
	adc ($3A.b,S),Y		; 73 3A
	trb $2DEC.w		; 1C EC 2D
	sta $D8.b,X		; 95 D8
.ACCU 8
.INDEX 8
	sep #$71		; E2 71
	sec		; 38
	eor $D92F77.l,X		; 5F 77 2F D9
	ror $AEFB.w,X		; 7E FB AE
	xba		; EB
	lda $CCB299.l,X		; BF 99 B2 CC
	cli		; 58
	sty $44.b		; 84 44
	mvp $6D,$60		; 44 60 6D
	lda $17C5.w,X		; BD C5 17
	lda $CDA2.w,Y		; B9 A2 CD
	.db $42, $40		; 42 40
	ora $B6.b,S		; 03 B6
	lda ($B7.b,S),Y		; B3 B7
	lda $6565B7.l		; AF B7 65 65
	pla		; 68
	eor [$97.b],Y		; 57 97
	ldx #$F7.b		; A2 F7
	plx		; FA
	bvs -61.b		; 70 C3
	cmp $BD.b		; C5 BD
	trb $4571.w		; 1C 71 45
	adc ($E5.b)		; 72 E5
	tyx		; BB
	adc $1C3B.w,Y		; 79 3B 1C
	bit $D1D1.w,X		; 3C D1 D1
	dec $A9A5.w		; CE A5 A9
.ACCU 16
	rep #$E2		; C2 E2
	ply		; 7A
	eor [$88.b],Y		; 57 88
	sbc $AD7973.l,X		; FF 73 79 AD
	lda ($CE.b)		; B2 CE
	sta [$42.b]		; 87 42
	sbc $11F1.w,X		; FD F1 11
	ora ($81.b),Y		; 11 81
	phx		; DA
	bmi -67.b		; 30 BD
	sta $FF.b,X		; 95 FF
	lda [$7F.b]		; A7 7F
	adc ($86.b,S),Y		; 73 86
	tax		; AA
	ldy $74.b,X		; B4 74
	.db $42, $69		; 42 69
	.db $82, $16, $16		; 82 16 16
	sbc $13.b,S		; E3 13
	stz $AAAC.w		; 9C AC AA
	inc $1B37.w		; EE 37 1B
	cmp $6FE0.w		; CD E0 6F
	and [$81.b],Y		; 37 81
	ror A		; 6A
	bne   6.b		; D0 06
	sbc $99.b,S		; E3 99
	and $5F6726.l,X		; 3F 26 67 5F
	sta ($53.b,S),Y		; 93 53
	cpx $57.b		; E4 57
	adc $EEC2.w,X		; 7D C2 EE
	and [$1A.b],Y		; 37 1A
	phy		; 5A
	bvc  65.b		; 50 41
	lda $A5.b		; A5 A5
	adc ($E6.b)		; 72 E6
	stz $549C.w,X		; 9E 9C 54
	adc $32C7.w,X		; 7D C7 32
	adc $8707.w,Y		; 79 07 87
	txs		; 9A
	dec A		; 3A
	and $3EC2.w,Y		; 39 C2 3E
	adc $F6.b		; 65 F6
	sta $67FE56.l		; 8F 56 FE 67
	lsr $C5CF.w,X		; 5E CF C5
	adc [$E9.b]		; 67 E9
	ldx #$F8.b		; A2 F8
	mvn $11,$51		; 54 51 11
	clc		; 18
	clc		; 18
	ora $98EF2A.l,X		; 1F 2A EF 98
	jsr $68B5.w		; 20 B5 68
	lda ($FC.b,X)		; A1 FC
	stp		; DB
	dec A		; 3A
	ora $E2.b,X		; 15 E2
	jmp ($6668.w)		; 6C 68 66
	sbc $71.b,S		; E3 71
	bit $3CE1.w,X		; 3C E1 3C
	beq  65.b		; F0 41
	plx		; FA
	ldy $5B.b,X		; B4 5B
	ror $EE.b,X		; 76 EE
	jmp $2773DC.l		; 5C DC 73 27
	bcc 103.b		; 90 67
	bcc 119.b		; 90 77
	ply		; 7A
	lda ($34.b,S),Y		; B3 34
	lda $7F51.w,Y		; B9 51 7F
	and $EC.b,X		; 35 EC
	cmp $267C.w,Y		; D9 7C 26
	and $71.b,X		; 35 71
	eor ($C6.b),Y		; 51 C6
	adc #$4444.w		; 69 44 44
	adc $DAB6.w		; 6D B6 DA
	tax		; AA
	ldx $9F.b		; A6 9F
	txy		; 9B
	eor $CF.b		; 45 CF
	cmp $E47FBF.l		; CF BF 7F E4
	eor ($69.b),Y		; 51 69
	lda [$2F.b]		; A7 2F
	rol $3726.w		; 2E 26 37
	cmp $263C.w,X		; DD 3C 26
	ora [$B1.b],Y		; 17 B1
	adc $75.b,S		; 63 75
	tya		; 98
	jsr $68B5.w		; 20 B5 68
	lda ($FC.b,X)		; A1 FC
	xce		; FB
	bit $C6AE.w		; 2C AE C6
	dec $86.b		; C6 86
	adc $936E.w,Y		; 79 6E 93
	inx		; E8
	sbc #$48F9.w		; E9 F9 48
	lda $8F965E.l		; AF 5E 96 8F
	trb $4571.w		; 1C 71 45
	sta ($B1.b,S),Y		; 93 B1
	lda $9C.b,S		; A3 9C
	and ($4A.b,S),Y		; 33 4A
	and ($34.b,S),Y		; 33 34
	lda $3F.b,X		; B5 3F
	cpx $FF.b		; E4 FF
	ora $629E.w		; 0D 9E 62
	cmp $FD8BCF.l		; CF CF 8B FD
	adc ($7E.b),Y		; 71 7E
	stz $A34A.w		; 9C 4A A3
	ora $03.b,S		; 03 03
	adc $DBB6.w		; 6D B6 DB
	mvp $82,$60		; 44 60 82
	cmp $97BB.w,X		; DD BB 97
	jsl $D5388A.l		; 22 8A 38 D5
	eor [$9B.b],Y		; 57 9B
	adc [$42.b]		; 67 42
	ldy $4D2D.w,X		; BC 2D 4D
	plp		; 28
	dey		; 88
	xce		; FB
	lda [$E4.b]		; A7 E4
	cmp $1587.w,Y		; D9 87 15
	jsr ($6255.w,X)		; FC 55 62
	jsr ($B0F8.w,X)		; FC F8 B0
	sbc ($C5.b,X)		; E1 C5
	dey		; 88
	rts		; 60

	adc $DBB6.w		; 6D B6 DB
	adc $E3B6.w		; 6D B6 E3
	adc $6EDC.w		; 6D DC 6E
	and ($32.b)		; 32 32
	cop $DD.b		; 02 DD
	clv		; B8
	plp		; 28
	cpx #$1C.b		; E0 1C
	dec $4367.w,X		; DE 67 43
	sta $E885.w,X		; 9D 85 E8
	eor [$63.b],Y		; 57 63
	.db $62, $AB, $1C		; 62 AB 1C
	adc $960F.w		; 6D 0F 96
	eor ($9A.b),Y		; 51 9A
	eor ($11.b),Y		; 51 11
	ora ($99.b),Y		; 11 99
	ldx $2CBB.w		; AE BB 2C
	ldx $28BB.w		; AE BB 28
	sbc $D1.b,X		; F5 D1
	cpx $D3B2.w		; EC B2 D3
	ora $69.b,S		; 03 69
	sta ($81.b,X)		; 81 81
	ldy $DA.b,X		; B4 DA
	rts		; 60

	adc ($F3.b,S),Y		; 73 F3
	sbc ($F2.b)		; F2 F2
	dex		; CA
	ora $9A75C2.l,X		; 1F C2 75 9A
	php		; 08
	eor ($47.b,X)		; 41 47
	plp		; 28
	adc $8D8D.w,X		; 7D 8D 8D
	tsb $02.b		; 04 02
	adc #$A7A9.w		; 69 A9 A7
	and $6BA13C.l,X		; 3F 3C A1 6B
	pld		; 2B
	tas		; 1B
.ACCU 16
	rep #$68		; C2 68
	adc $68E75B.l		; 6F 5B E7 68
	lda $D427.w,Y		; B9 27 D4
	and $9B.b,S		; 23 9B
	cmp $5F9F7C.l,X		; DF 7C 9F 5F
	sbc $78.b,X		; F5 78
	inc $3CA5.w,X		; FE A5 3C
	sbc $1111E1.l		; EF E1 11 11
	ora ($FA.b),Y		; 11 FA
	xce		; FB
	inc $8BEE.w		; EE EE 8B
	sbc $C8.b		; E5 C8
	lda ($FE.b)		; B2 FE
	tsb $D71E.w		; 0C 1E D7
	cmp $F6C7FE.l		; CF FE C7 F6
	ply		; 7A
	lda $FFF5B1.l,X		; BF B1 F5 FF
	sbc ($DD.b,X)		; E1 DD
	inc $82.b,X		; F6 82
	jsl $3B3F22.l		; 22 22 3F 3B
	dex		; CA
	adc [$D6.b],Y		; 77 D6
	lda $59F1.w,X		; BD F1 59
	dec $FEC8.w		; CE C8 FE
	cmp $3EF9D8.l		; CF D8 F9 3E
	xce		; FB
	eor $FECC2B.l,X		; 5F 2B CC FE
	tad		; 5B
	eor $88.b,X		; 55 88
	dey		; 88
	dey		; 88
	sbc [$FF.b],Y		; F7 FF
	phk		; 4B
	plx		; FA
	ror $F8.b		; 66 F8
	eor [$B4.b]		; 47 B4
	wai		; CB
	sbc $F7FE7A.l		; EF 7A FE F7
	lda $4FDCF5.l		; AF F5 DC 4F
	sta $FDD9.w		; 8D D9 FD
	and $A2346D.l		; 2F 6D 34 A2
	jsl $573F22.l		; 22 22 3F 57
	sed		; F8
	ror $CAA7.w,X		; 7E A7 CA
	sbc ($C7.b,S),Y		; F3 C7
	sbc ($39.b,X)		; E1 39
	txy		; 9B
	sta $BEEDA5.l		; 8F A5 ED BE
	sta $5EFAB7.l		; 8F B7 FA 5E
	stp		; DB
	nop		; EA
	plx		; FA
	sbc $04EF95.l,X		; FF 95 EF 04
	mvp $7B,$44		; 44 44 7B
	nop		; EA
	and $034DFC.l		; 2F FC 4D 03
	cpy $F3.b		; C4 F3
	sta $FEDC3B.l,X		; 9F 3B DC FE
	adc $B8EB2F.l,X		; 7F 2F EB B8
	stz $FACF.w,X		; 9E CF FA
	tsa		; 3B
	inc $44B4.w		; EE B4 44
	mvp $7E,$44		; 44 44 7E
	lda $0FF07D.l		; AF 7D F0 0F
	sbc ($3B.b)		; F2 3B
	adc #$DFBD.w		; 69 BD DF
	wai		; CB
	xce		; FB
	dec $578F.w,X		; DE 8F 57
	adc [$FF.b],Y		; 77 FF
	cmp $BEFADB.l		; CF DB FA BE
	ldy $4444.w,X		; BC 44 44
	mvp $AA,$7A		; 44 7A AA
	and $433CA0.l		; 2F A0 3C 43
	eor $81.b,S		; 43 81
	cmp $6FFC.w,Y		; D9 FC 6F
	adc $BAF4.w		; 6D F4 BA
	cmp $BD2C.w		; CD 2C BD
	ror $8AAB.w		; 6E AB 8A
	jsl $3F2222.l		; 22 22 22 3F
	ora $FE.b,S		; 03 FE
	sta [$72.b]		; 87 72
	adc ($87.b)		; 72 87
	and [$63.b]		; 27 63
	sbc [$7B.b]		; E7 7B
	sta $EED891.l,X		; 9F 91 D8 EE
	cmp $C4F181.l,X		; DF 81 F1 C4
	mvp $47,$44		; 44 44 47
	cmp [$51.b],Y		; D7 51
	eor $9AB1.w		; 4D B1 9A
	and ($4B.b,S),Y		; 33 4B
	bit $B8.b,X		; 34 B8
	sbc $777DAA.l		; EF AA 7D 77
	bpl  68.b		; 10 44
	mvp $7C,$44		; 44 44 7C
	cmp $14.b		; C5 14
	cpx $6E44.w		; EC 44 6E
	ldx $F7B9.w,Y		; BE B9 F7
	stx $AFAE.w		; 8E AE AF
	tya		; 98
	jsr ($22C2.w,X)		; FC C2 22
	jsl $F4B43B.l		; 22 3B B4 F4
	eor $8F.b,S		; 43 8F
	sta $19.b,S		; 83 19
	sed		; F8
	stx $87B3.w		; 8E B3 87
	asl $888E.w		; 0E 8E 88
	dey		; 88
	dey		; 88
	sta $39C7.w		; 8D C7 39
	clc		; 18
	ora $47FF5E.l,X		; 1F 5E FF 47
	cld		; D8
	inc $283A.w,X		; FE 3A 28
	jmp $F81EB9.l		; 5C B9 1E F8
	mvp $5B,$7D		; 44 7D 5B
	sbc $86C3D5.l		; EF D5 C3 86
	txs		; 9A
	adc $75FF51.l,X		; 7F 51 FF 75
	adc $3B9F.w,X		; 7D 9F 3B
	sta $8FC6.w		; 8D C6 8F
	adc $8F8B.w,X		; 7D 8B 8F
	cmp $F8DB.w		; CD DB F8
	tad		; 5B
	sbc ($B4.b,X)		; E1 B4
	cpx $3D.b		; E4 3D
	eor $D294.w		; 4D 94 D2
	brk $1A.b		; 00 1A
	clc		; 18
	and $F75BCF.l,X		; 3F CF 5B F7
	sbc $85FF.w,X		; FD FF 85
	ldx $A98A.w,Y		; BE 8A A9
	ror $44.b		; 66 44
	cmp [$C5.b]		; C7 C5
	sta [$54.b],Y		; 97 54
	cmp ($14.b,S),Y		; D3 14
	rol $3E.b,X		; 36 3E
	bit $BD.b,X		; 34 BD
	cmp $03.b,S		; C3 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $05.b		; 05 05
	and ($77.b),Y		; 31 77
	lsr $77.b,X		; 56 77
	tsb $CCCC.w		; 0C CC CC
	cpy $D2CC.w		; CC CC D2
	cmp $4F41.w		; CD 41 4F
	sbc [$FF.b]		; E7 FF
	stx $8E.b,Y		; 96 8E
	lda [$0F.b],Y		; B7 0F
	sta $F9.b,X		; 95 F9
	clv		; B8
	sta $A42ED3.l,X		; 9F D3 2E A4
	lda $B1A1D7.l,X		; BF D7 A1 B1
	cld		; D8
	dey		; 88
	dey		; 88
	dey		; 88
	sbc $B9.b,S		; E3 B9
	and $9FFC9A.l		; 2F 9A FC 9F
	cmp $FFFD.w,Y		; D9 FD FF
	pld		; 2B
	cmp [$FE.b]		; C7 FE
	lsr $F277.w,X		; 5E 77 F2
	cmp [$F3.b],Y		; D7 F3
	eor $94FAAE.l,X		; 5F AE FA 94
	mvp $44,$44		; 44 44 44
	eor [$AF.b]		; 47 AF
	sbc $E1EF7C.l		; EF 7C EF E1
	sed		; F8
	sta $F0BF.w,X		; 9D BF F0
	wai		; CB
	sbc [$9F.b]		; E7 9F
	stz $EC.b,X		; 74 EC
	bit $44C4.w,X		; 3C C4 44
	mvp $47,$44		; 44 44 47
	cmp ($FF.b)		; D2 FF
	ror $CF36.w		; 6E 36 CF
	plb		; AB
	xce		; FB
	trb $7D09.w		; 1C 09 7D
	ora $EF.b,S		; 03 EF
	cmp $FCD9E0.l,X		; DF E0 D9 FC
	trb $51.b		; 14 51
	ora ($11.b),Y		; 11 11
	trb $CF67.w		; 1C 67 CF
	and $FA2F.w,X		; 3D 2F FA
	phx		; DA
	adc $EB5B.w,X		; 7D 5B EB
	ora $3FEC74.l,X		; 1F 74 EC 3F
	ldx #$BF.b		; A2 BF
	cmp ($45.b,X)		; C1 45
	ora ($11.b),Y		; 11 11
	ora ($B4.b),Y		; 11 B4
	sbc $D4E7.w,Y		; F9 E7 D4
	adc $67BF.w,X		; 7D BF 67
	lda ($EB.b),Y		; B1 EB
	ora $3DECCA.l,X		; 1F CA EC 3D
	sbc $DE8D16.l,X		; FF 16 8D DE
	cmp ($44.b),Y		; D1 44
	mvp $AA,$47		; 44 47 AA
	ply		; 7A
	lda [$AF.b]		; A7 AF
	adc ($2B.b)		; 72 2B
	cpx #$3F.b		; E0 3F
	inc $75.b,X		; F6 75
	jmp $9A3C18.l		; 5C 18 3C 9A
	and $B5455F.l		; 2F 5F 45 B5
	pla		; 68
	mvp $1D,$47		; 44 47 1D
	phx		; DA
	lda $5BEB.w,X		; BD EB 5B
	stx $5FF0.w		; 8E F0 5F
	ora ($66.b,S),Y		; 13 66
	sta $28F0.w		; 8D F0 28
	lda $1785.w,X		; BD 85 17
	lda $E388A3.l		; AF A3 88 E3
	sec		; 38
	cmp $F27FC7.l		; CF C7 7F F2
	sbc [$AF.b],Y		; F7 AF
	ply		; 7A
	xce		; FB
	stx $4D.b,Y		; 96 4D
	phy		; 5A
	and [$C5.b],Y		; 37 C5
	ldx #$F9.b		; A2 F9
	lsr A		; 4A
	rol $4746.w		; 2E 46 47
	txs		; 9A
	ldx #$E4.b		; A2 E4
	cpx $8E.b		; E4 8E
	sbc $BFDD.w		; ED DD BF
	ora $FF.b		; 05 FF
	adc [$9C.b]		; 67 9C
	inc $6147.w,X		; FE 47 61
	dec $3EF1.w,X		; DE F1 3E
	eor $17.b,X		; 55 17
	cmp $E57C51.l		; CF 51 7C E5
	ora $E52E2F.l,X		; 1F 2F 2E E5
	iny		; C8
	lda [$3E.b],Y		; B7 3E
	lda $8FF7.w,Y		; B9 F7 8F
	cpx #$7C.b		; E0 7C
	eor [$C4.b]		; 47 C4
	adc $9C.b,X		; 75 9C
	sec		; 38
	ror A		; 6A
	plb		; AB
	ora $51CB1F.l,X		; 1F 1F CB 51
	adc [$3B.b],Y		; 77 3B
	stz $8BEA.w,X		; 9E EA 8B
	ora [$4C.b],Y		; 17 4C
	pei ($89.b)		; D4 89
	sta ($FD.b,X)		; 81 FD
	ora $71ED2D.l		; 0F 2D ED 71
	eor $50.b,X		; 55 50
	brk $41.b		; 00 41
	tsb $3B.b		; 04 3B
	adc $267B.w,Y		; 79 7B 26
	stz $C5.b		; 64 C5
	ror $3CFC.w		; 6E FC 3C
	ror $CBA6.w		; 6E A6 CB
	and $629ADF.l		; 2F DF 9A 62
	stx $B4.b		; 86 B4
.ACCU 8
.INDEX 8
	sep #$B7		; E2 B7
	ror $3F1E.w,X		; 7E 1E 3F
	lda #$86.b		; A9 86
	jsr ($CB74.w,X)		; FC 74 CB
	and ($50.b)		; 32 50
	eor ($1B.b)		; 52 1B
	sbc ($D2.b),Y		; F1 D2
	dey		; 88
	dey		; 88
	bit #$41.b		; 89 41
	mvp $44,$44		; 44 44 44
	mvp $0A,$4A		; 44 4A 0A
	bmi  87.b		; 30 57
	adc $5DB7.w		; 6D B7 5D
	tyx		; BB
	and $6DD7.w		; 2D D7 6D
	lda [$5D.b],Y		; B7 5D
	clv		; B8
	jsr $41B7.w		; 20 B7 41
	asl $66.b,X		; 16 66
	stx $99.b,Y		; 96 99
	adc #$69.b		; 69 69
	stx $9B.b,Y		; 96 9B
	pei ($CB.b)		; D4 CB
	jmp $53D3.w		; 4C D3 53
	eor ($1F.b,X)		; 41 1F
	cld		; D8
	inc $5FFF.w,X		; FE FF 5F
	sbc $6FBE.w,X		; FD BE 6F
	lda $CDFF.w,X		; BD FF CD
	ora #$E9.b		; 09 E9
	tay		; A8
	tyx		; BB
	sta $EBCF.w,X		; 9D CF EB
	ldx $EB95.w,Y		; BE 95 EB
	dec $ECC1.w,X		; DE C1 EC
	asl $FCC1.w,X		; 1E C1 FC
	adc $38F82D.l		; 6F 2D F8 38
	bit $30.b,X		; 34 30
	ror $3F5A.w,X		; 7E 5A 3F
	sta $45.b,S		; 83 45
	sbc $139A.w,X		; FD 9A 13
	stx $BEE3.w		; 8E E3 BE
	adc $F3.b		; 65 F3
	and $AD7FA8.l		; 2F A8 7F AD
	inc $FAB7.w,X		; FE B7 FA
	jmp.w [$3B18]		; DC 18 3B
	ora $C78E.w,X		; 1D 8E C7
	adc $EF.b,S		; 63 EF
	eor ($FC.b),Y		; 51 FC
	inc A		; 1A
	rol $1F65.w		; 2E 65 1F
	ora $72C9.w,X		; 1D C9 72
	eor $37FA46.l,X		; 5F 46 FA 37
	pei ($3A.b)		; D4 3A
	stx $ABA3.w		; 8E A3 AB
	plb		; AB
	sbc $772FDA.l,X		; FF DA 2F 77
	eor [$C6.b]		; 47 C6
	lda ($3B.b,X)		; A1 3B
	eor $EDAE.w,X		; 5D AE ED
	sbc $B467.w,X		; FD 67 B4
	tda		; 7B
	eor [$65.b]		; 47 65
	cmp $5F76.w,Y		; D9 76 5F
	and $F0.b		; 25 F0
	inx		; E8
	lda $C08B22.l,X		; BF 22 8B C0
	cpx #$63.b		; E0 63
	bne -67.b		; D0 BD
	dec $CFE7.w		; CE E7 CF
	lda $A08B.w,X		; BD 8B A0
	cpx #$70.b		; E0 70
	sec		; 38
	trb $2D0F.w		; 1C 0F 2D
	sed		; F8
	pea $B95F.w		; F4 5F B9
	.db $42, $7D		; 42 7D
	adc $1F.b,X		; 75 1F
	and ($32.b,S),Y		; 33 32
	sbc $80DF.w		; ED DF 80
	sbc $BDEB5D.l		; EF 5D EB BD
	sei		; 78
	sta $6FD411.l		; 8F 11 D4 6F
	and $0F.b		; 25 0F
	lda [$6E.b],Y		; B7 6E
	rol $A199.w		; 2E 99 A1
	sed		; F8
	lda ($55.b),Y		; B1 55
	eor [$EA.b],Y		; 57 EA
	cmp ($77.b),Y		; D1 77
	tda		; 7B
	ldy $B8BC.w,X		; BC BC B8
	jsr $6F87.w		; 20 87 6F
	and $9FCC64.l		; 2F 64 CC 9F
	inc $EA.b		; E6 EA
	tsx		; BA
	cmp $5F96.w		; CD 96 5F
	lda $01C034.l,X		; BF 34 C0 01
	adc ($E4.b)		; 72 E4
	tad		; 5B
	stx $94.b,Y		; 96 94
	mvp $C3,$45		; 44 45 C3
	stx $AA.b		; 86 AA
	txa		; 8A
	inc A		; 1A
	pei ($88.b)		; D4 88
	bit #$8A.b		; 89 8A
	cmp $69F8.w,X		; DD F8 69
	sty $9AA0.w		; 8C A0 9A
	.db $62, $B7, $7E		; 62 B7 7E
	asl $5337.w,X		; 1E 37 53
	adc ($0C.b,S),Y		; 73 0C
	and [$E3.b],Y		; 37 E3
	lda $28.b		; A5 28
	and #$73.b		; 29 73
	tsb $4B55.w		; 0C 55 4B
	and ($22.b)		; 32 22
	jsl $CB5250.l		; 22 50 52 CB
	adc $DB.b,X		; 75 DB
	lda ($DD.b)		; B2 DD
	ror $EC.b,X		; 76 EC
	lda [$5D.b],Y		; B7 5D
	tyx		; BB
	and $6ED7.w		; 2D D7 6E
	.db $82, $8D, $32		; 82 8D 32
	cmp ($7A.b,S),Y		; D3 7A
	sta $BD69.w,Y		; 99 69 BD
	jmp $DEB4.w		; 4C B4 DE
	ldx $5A.b		; A6 5A
	pla		; 68
	and #$B9.b		; 29 B9
	jmp.w [$D0E3]		; DC E3 D0
	sta $D7AE.w,X		; 9D AE D7
	tas		; 1B
	tas		; 1B
	tyx		; BB
	lda $F2.b,S		; A3 F2
	jmp.w [$070E]		; DC 0E 07
	ora $E4.b,S		; 03 E4
	tyx		; BB
	and $8FF668.l		; 2F 68 F6 8F
	inc $7C51.w		; EE 51 7C
	sbc $1F.b		; E5 1F
	bne  81.b		; D0 51
	ply		; 7A
	ply		; 7A
	ora [$F3.b],Y		; 17 F3
	cmp $1FF111.l,X		; DF 11 F1 1F
	sbc ($79.b),Y		; F1 79
	eor $3CE529.l		; 4F 29 E5 3C
	ldx $ED.b		; A6 ED
	phd		; 0B
	cmp $A3CBCF.l		; CF CF CB A3
	sta $E6.b		; 85 E6
	sbc ($79.b,S),Y		; F3 79
	ldy $9DF0.w,X		; BC F0 9D
	adc [$59.b]		; 67 59
	jmp $D73E7A.l		; 5C 7A 3E D7
	rtl		; 6B

	sta $018C.w		; 8D 8C 01
	tsb $10.b		; 04 10
	cmp $81.b,S		; C3 81
	cpy #$F9.b		; C0 F9
	rol $ABCA.w		; 2E CA AB
	adc $97.b		; 65 97
	sbc $C0D1E4.l		; EF E4 D1 C0
	rol $8F5C.w		; 2E 5C 8F
	jmp ($9BD2.w,X)		; 7C D2 9B
	asl $ABC2.w		; 0E C2 AB
	sta [$0D.b]		; 87 0D
	bit $80.b,X		; 34 80
	eor $72BB.w,X		; 5D BB 72
	cpx $5B.b		; E4 5B
	stx $A4.b,Y		; 96 A4
	mvp $CE,$4B		; 44 4B CE
	trb $5435.w		; 1C 35 54
	bvc -42.b		; 50 D6
	ldy $44.b		; A4 44
	mvp $A0,$44		; 44 44 A0
	ldx #$22.b		; A2 22
	jsl $7EB762.l		; 22 62 B7 7E
	inc A		; 1A
	adc $28.b,S		; 63 28
	rol $98.b		; 26 98
	lda $86DF.w		; AD DF 86
	tya		; 98
	cpx #$B2.b		; E0 B2
	inc $18.b		; E6 18
	tax		; AA
	stx $62.b,Y		; 96 62
	.db $82, $78, $AD		; 82 78 AD
	cmp [$73.b],Y		; D7 73
	ora $EECA.w		; 0D CA EE
	adc ($B9.b,X)		; 61 B9
	eor $37CC.w,X		; 5D CC 37
	pld		; 2B
	lda $DD6E.w,Y		; B9 6E DD
	dex		; CA
	php		; 08
	dec $3AA7.w,X		; DE A7 3A
	tay		; A8
	nop		; EA
	dec $85AB.w		; CE AB 85
	lsr $75.b,X		; 56 75
	eor ($55.b),Y		; 51 55
	sta $3455.w,X		; 9D 55 34
	cmp $41.b,X		; D5 41
	ora $D7AE.w,X		; 1D AE D7
	adc $C8C8B7.l		; 6F B7 C8 C8
	cmp [$A3.b]		; C7 A3
	bra  92.b		; 80 5C
	lda $BCE4.w,Y		; B9 E4 BC
	cmp [$9C.b],Y		; D7 9C
	cpx #$70.b		; E0 70
	rol A		; 2A
	clv		; B8
	bvs -12.b		; 70 F4
	pea $BC5C.w		; F4 5C BC
	tyx		; BB
	lda [$42.b],Y		; B7 42
	cmp $B7B8.w,X		; DD B8 B7
	eor $6EF6.w		; 4D F6 6E
	eor ($AC.b,S),Y		; 53 AC
	dec $1657.w,X		; DE 57 16
	rol A		; 2A
	tax		; AA
	brk $0B.b		; 00 0B
	ror $E2.b,X		; 76 E2
	cmp $D937.w,X		; DD 37 D9
	sta ($11.b),Y		; 91 11
	adc ($62.b),Y		; 71 62
	tax		; AA
	ldx #$86.b		; A2 86
	wai		; CB
	beq -102.b		; F0 9A
	eor ($11.b),Y		; 51 11
	ora ($26.b),Y		; 11 26
	tya		; 98
	ldy #$8A.b		; A0 8A
	.db $62, $B7, $7E		; 62 B7 7E
	inc A		; 1A
	adc $1B.b,S		; 63 1B
	sei		; 78
	lda ($BF.b,X)		; A1 BF
	ora $0425.w,X		; 1D 25 04
	cpx #$B2.b		; E0 B2
	inc $18.b		; E6 18
	tax		; AA
	stx $4494.w		; 8E 94 44
	lsr A		; 4A
	asl A		; 0A
	adc ($B9.b,X)		; 61 B9
	txa		; 8A
	inc $1B.b		; E6 1B
	tya		; 98
	ror $B961.w		; 6E 61 B9
	txa		; 8A
	inc $1B.b		; E6 1B
	tya		; 98
	ror $5250.w		; 6E 50 52
	rol A		; 2A
	lda ($AA.b,S),Y		; B3 AA
	txa		; 8A
	tay		; A8
	tax		; AA
	txa		; 8A
	ldy $A2EA.w		; AC EA A2
	tax		; AA
	rol A		; 2A
	tay		; A8
	and #$1E.b		; 29 1E
	sbc $11A9.w,Y		; F9 A9 11
	ora ($12.b),Y		; 11 12
	txs		; 9A
	lsr A		; 4A
	php		; 08
	ldx $2B.b		; A6 2B
	adc [$E1.b],Y		; 77 E1
	ldx $31.b		; A6 31
	.db $82, $CB, $78		; 82 CB 78
	lda ($BE.b,X)		; A1 BE
	bvc  81.b		; 50 51
	.db $82, $CB, $98		; 82 CB 98
	.db $62, $AA, $59		; 62 AA 59
	sta ($12.b),Y		; 91 12
	.db $82, $92, $CC		; 82 92 CC
	dey		; 88
	dey		; 88
	dey		; 88
	sty $14.b,X		; 94 14
	cmp $73.b,S		; C3 73
	iny		; C8
	stp		; DB
	eor $CB0D87.l,X		; 5F 87 0D CB
	beq  -7.b		; F0 F9
	tas		; 1B
	rtl		; 6B

	beq -12.b		; F0 F4
	rol $97.b,X		; 36 97
	rol $4143.w		; 2E 43 41
	clc		; 18
	tax		; AA
	stx $FC.b		; 86 FC
	and [$E1.b],Y		; 37 E1
	lda $45FF0D.l,X		; BF 0D FF 45
	sbc [$E1.b],Y		; F7 E1
	lda $AABFA7.l,X		; BF A7 BF AA
	plb		; AB
	pea $4C11.w		; F4 11 4C
	lsr $EF.b,X		; 56 EF
	cmp $4C.b,S		; C3 4C
	.db $62, $30, $59		; 62 30 59
	adc ($09.b,S),Y		; 73 09
	eor ($44.b,X)		; 41 44
	adc $B9E2.w		; 6D E2 B9
	stx $2A.b		; 86 2A
	lda $99.b		; A5 99
	ora ($82.b)		; 12 82
	sta ($D2.b),Y		; 91 D2
	dey		; 88
	dey		; 88
	dey		; 88
	sty $14.b,X		; 94 14
	lda $69430F.l,X		; BF 0F 43 69
	ror $861E.w,X		; 7E 1E 86
	cmp ($9B.b,S),Y		; D3 9B
	lda [$E8.b],Y		; B7 E8
	adc $4F3F.w		; 6D 3F 4F
	sta $E8.b,X		; 95 E8
	adc $A021.w		; 6D 21 A0
	lda $FF.b		; A5 FF
	eor $F7.b		; 45 F7
	sbc ($BF.b,X)		; E1 BF
	lda [$BF.b]		; A7 BF
	txa		; 8A
	lda $FF3D.w		; AD 3D FF
	lda ($FA.b),Y		; B1 FA
	ply		; 7A
	tda		; 7B
	xce		; FB
	pea $4C13.w		; F4 13 4C
	lsr $EF.b,X		; 56 EF
	cmp $4C.b,S		; C3 4C
	.db $62, $23, $05		; 62 23 05
	sta $05.b		; 85 05
	ora ($1B.b),Y		; 11 1B
	sei		; 78
	lda ($BF.b,X)		; A1 BF
	ora $CC32.w,X		; 1D 32 CC
	sty $14.b,X		; 94 14
	inc $ED.b		; E6 ED
	plx		; FA
	tas		; 1B
	lsr $4776.w		; 4E 76 47
	eor $69.b,S		; 43 69
	dec $D7C8.w		; CE C8 D7
	dex		; CA
	sbc [$64.b]		; E7 64
	rtl		; 6B

	sbc $43.b		; E5 43
	.db $42, $E2		; 42 E2
	lda ($95.b,X)		; A1 95
	adc #$EF.b		; 69 EF
	sbc ($B4.b,S),Y		; F3 B4
	stz $F7.b,X		; 74 F7
	sbc $3DBC.w,Y		; F9 BC 3D
	and $6FFE.w,X		; 3D FE 6F
	ora $7E7F4F.l		; 0F 4F 7F 7E
	sta $E1.b		; 85 E1
	lda ($78.b,X)		; A1 78
	and ($F5.b),Y		; 31 F5
	sbc ($93.b)		; F2 93
	eor $3E062B.l,X		; 5F 2B 06 3E
	ldx $6B52.w,Y		; BE 52 6B
	sbc $45.b		; E5 45
	eor ($3D.b,X)		; 41 3D
	asl $9E06.w		; 0E 06 9E
	sbc $4F2F5B.l,X		; FF 5B 2F 4F
	adc $4F1F83.l,X		; 7F 83 1F 4F
	ror $7B9A.w,X		; 7E 9A 7B
	jsr ($1334.w,X)		; FC 34 13
	eor $649C.w		; 4D 9C 64
	cld		; D8
	cmp #$4D.b		; C9 4D
	stz $4864.w		; 9C 64 48
	tay		; A8
	rol $97.b		; 26 97
	ldx $C6A6.w		; AE A6 C6
	lsr A		; 4A
	lsr $89BA.w,X		; 5E BA 89
	stx $82.b		; 86 82
	sec		; 38
	bvs -47.b		; 70 D1
	jsr $7FFF.w		; 20 FF 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $10.b		; 84 10
	lsr A		; 4A
	and #$21.b		; 29 21
	tsb $EF.b		; 04 EF
	and $226E.w,X		; 3D 6E 22
	jmp $2A1A.w		; 4C 1A 2A
	ora ($06.b)		; 12 06
	asl $05C4.w		; 0E C4 05
	.db $82, $01, $00		; 82 01 00
	ora ($C0.b,X)		; 01 C0
	brk $D8.b		; 00 D8
	cop $75.b		; 02 75
	cop $AE.b		; 02 AE
	ora ($00.b,X)		; 01 00
	brk $D0.b		; 00 D0
	ror $6ED2.w		; 6E D2 6E
	sbc ($72.b,S),Y		; F3 72
	ora $73.b,X		; 15 73
	rol $77.b,X		; 36 77
	cli		; 58
	adc [$7A.b],Y		; 77 7A
	tda		; 7B
	ldy $FF7B.w,X		; BC 7B FF
	adc $526318.l,X		; 7F 18 63 52
	lsr A		; 4A
	rtl		; 6B

	and $55F0.w		; 2D F0 55
	rol A		; 2A
	and $2886.w,X		; 3D 86 28
	brk $00.b		; 00 00
	ldy $007B.w,X		; BC 7B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc $E71084.l,X		; 7F 84 10 E7
	trb $2D6B.w		; 1C 6B 2D
	sbc $52943D.l		; EF 3D 94 52
	phy		; 5A
	rtl		; 6B

	sbc $73567F.l,X		; FF 7F 56 73
	ldx $0866.w		; AE 66 08
	phy		; 5A
	sta $4D.b,S		; 83 4D
	jsr $F041.w		; 20 41 F0
	eor $2A.b,X		; 55 2A
	and $2886.w,X		; 3D 86 28
	brk $00.b		; 00 00
	sty $10.b		; 84 10
	sbc [$1C.b]		; E7 1C
	rtl		; 6B

	and $3DEF.w		; 2D EF 3D
	sty $52.b,X		; 94 52
	phy		; 5A
	rtl		; 6B

	dec A		; 3A
	eor $8F36F5.l		; 4F F5 36 8F
	jsl $C4122A.l		; 22 2A 12 C4
	ora $60.b		; 05 60
	ora ($95.b,X)		; 01 95
	cop $31.b		; 02 31
	cop $AE.b		; 02 AE
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
	brk $FA.b		; 00 FA
	adc ($8F.b)		; 72 8F
	eor $30C8.w		; 4D C8 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $42, $FB		; 42 FB
	brk $07.b		; 00 07
	asl $14.b		; 06 14
	brk $07.b		; 00 07
	asl $E6.b		; 06 E6
	ora $0000E7.l,X		; 1F E7 00 00
	inx		; E8
	sbc [$E7.b]		; E7 E7
	sbc #$26.b		; E9 26
	tsb $EA.b		; 04 EA
	inx		; E8
	inx		; E8
	xba		; EB
	sbc #$E9.b		; E9 E9
	cpx $EAEA.w		; EC EA EA
	sbc $EBEB.w		; ED EB EB
	inc $0826.w		; EE 26 08
	sbc $F0EEEE.l		; EF EE EE F0
	tsb $62.b		; 04 62
	sbc ($04.b),Y		; F1 04
	sta $F0F2.w,X		; 9D F2 F0
	beq -13.b		; F0 F3
	and $44.b		; 25 44
	pea $ECEC.w		; F4 EC EC
	sbc $EF.b,X		; F5 EF
	sbc $EDEDF6.l		; EF F6 ED ED
	sbc [$04.b],Y		; F7 04
	lda $F8.b		; A5 F8
	sbc ($F1.b),Y		; F1 F1
	sbc $F7F7.w,Y		; F9 F7 F7
	plx		; FA
	and $04.b		; 25 04
	xce		; FB
	sbc #$F3.b		; E9 F3
	jsr ($F2F2.w,X)		; FC F2 F2
	sbc $1804.w,X		; FD 04 18
	inc $F8F8.w,X		; FE F8 F8
	sbc $01F9F9.l,X		; FF F9 F9 01
	nop		; EA
	inx		; E8
	cop $EC.b		; 02 EC
	plx		; FA
	ora $FD.b		; 05 FD
	sbc $0406.w,X		; FD 06 04
	inc $07.b,X		; F6 07
	brk $FA.b		; 00 FA
	ora #$ED.b		; 09 ED
	xba		; EB
	jsr $1C00.w		; 20 00 1C
	brk $08.b		; 00 08
	ora $F4.b,S		; 03 F4
	pea $F4F4.w		; F4 F4 F4
	pea $E7EC.w		; F4 EC E7
	inc $01.b		; E6 01
	brk $E6.b		; 00 E6
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	inc $05.b		; E6 05
	brk $E6.b		; 00 E6
	asl $00.b		; 06 00
	inc $07.b		; E6 07
	pea $E7E8.w		; F4 E8 E7
	brk $08.b		; 00 08
	brk $E6.b		; 00 E6
	ora #$00.b		; 09 00
	asl A		; 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	pea $00E8.w		; F4 E8 00
	ora $001000.l		; 0F 00 10 00
	ora ($00.b),Y		; 11 00
	ora ($00.b)		; 12 00
	ora ($00.b,S),Y		; 13 00
	trb $00.b		; 14 00
	ora $00.b,X		; 15 00
	asl $F4.b,X		; 16 F4
	brk $17.b		; 00 17
	ora $05.b		; 05 05
	sbc $1904.w,X		; FD 04 19
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
	ora $05.b		; 05 05
	sbc $1704.w,X		; FD 04 17
	mvp $ED,$02		; 44 02 ED
	sbc #$27.b		; E9 27
	tsb $28.b		; 04 28
	tsb $29.b		; 04 29
	tsb $2A.b		; 04 2A
	tsb $2B.b		; 04 2B
	tsb $2C.b		; 04 2C
	tsb $2D.b		; 04 2D
	tsb $2E.b		; 04 2E
	tsb $2F.b		; 04 2F
	tsb $30.b		; 04 30
	tsb $31.b		; 04 31
	tsb $32.b		; 04 32
	tsb $ED.b		; 04 ED
	xce		; FB
	cop $E9.b		; 02 E9
	and ($04.b,S),Y		; 33 04
	bit $04.b,X		; 34 04
	and $04.b,X		; 35 04
	rol $04.b,X		; 36 04
	and [$04.b],Y		; 37 04
	sec		; 38
	tsb $39.b		; 04 39
	tsb $3A.b		; 04 3A
	tsb $34.b		; 04 34
	tsb $3B.b		; 04 3B
	asl $EB.b		; 06 EB
	xce		; FB
	cop $E9.b		; 02 E9
	bit $3D04.w,X		; 3C 04 3D
	tsb $3D.b		; 04 3D
	tsb $3D.b		; 04 3D
	tsb $3D.b		; 04 3D
	tsb $3E.b		; 04 3E
	tsb $3F.b		; 04 3F
	tsb $3F.b		; 04 3F
	tsb $3F.b		; 04 3F
	tsb $3F.b		; 04 3F
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $40.b		; 04 40
	tsb $41.b		; 04 41
	tsb $42.b		; 04 42
	tsb $42.b		; 04 42
	tsb $42.b		; 04 42
	tsb $42.b		; 04 42
	tsb $43.b		; 04 43
	tsb $FB.b		; 04 FB
	cop $FB.b		; 02 FB
	mvp $44,$04		; 44 04 44
	tsb $44.b		; 04 44
	tsb $44.b		; 04 44
	tsb $45.b		; 04 45
	tsb $46.b		; 04 46
	tsb $46.b		; 04 46
	tsb $46.b		; 04 46
	tsb $46.b		; 04 46
	tsb $47.b		; 04 47
	tsb $47.b		; 04 47
	tsb $47.b		; 04 47
	tsb $47.b		; 04 47
	tsb $48.b		; 04 48
	tsb $49.b		; 04 49
	tsb $49.b		; 04 49
	tsb $49.b		; 04 49
	tsb $49.b		; 04 49
	tsb $FA.b		; 04 FA
	xce		; FB
	ora ($4A.b,X)		; 01 4A
	brk $4B.b		; 00 4B
	ora [$E9.b]		; 07 E9
	jmp $4D04.w		; 4C 04 4D
	tsb $4D.b		; 04 4D
	tsb $4D.b		; 04 4D
	tsb $4D.b		; 04 4D
	tsb $4E.b		; 04 4E
	tsb $4F.b		; 04 4F
	tsb $4F.b		; 04 4F
	tsb $4F.b		; 04 4F
	tsb $4F.b		; 04 4F
	tsb $50.b		; 04 50
	tsb $50.b		; 04 50
	tsb $50.b		; 04 50
	tsb $50.b		; 04 50
	tsb $51.b		; 04 51
	tsb $52.b		; 04 52
	tsb $52.b		; 04 52
	tsb $52.b		; 04 52
	tsb $52.b		; 04 52
	tsb $4C.b		; 04 4C
	mvp $01,$FB		; 44 FB 01
	eor ($00.b,S),Y		; 53 00
	mvn $EB,$07		; 54 07 EB
	eor $04.b,X		; 55 04
	lsr $04.b,X		; 56 04
	eor [$04.b],Y		; 57 04
	cli		; 58
	tsb $59.b		; 04 59
	asl $EB.b		; 06 EB
	phy		; 5A
	tsb $5B.b		; 04 5B
	tsb $5C.b		; 04 5C
	tsb $5D.b		; 04 5D
	tsb $FB.b		; 04 FB
	nop		; EA
	sbc [$5E.b]		; E7 5E
	brk $5F.b		; 00 5F
	brk $60.b		; 00 60
	brk $61.b		; 00 61
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($F2FC.w,X)		; FC FC F2
	tsb $61.b		; 04 61
	mvp $E7,$EA		; 44 EA E7
	adc $00.b,S		; 63 00
	stz $E7.b		; 64 E7
	ora [$F6.b]		; 07 F6
	adc $04.b		; 65 04
	ror $04.b		; 66 04
	adc [$04.b]		; 67 04
	pla		; 68
	tsb $69.b		; 04 69
	tsb $6A.b		; 04 6A
	asl $F3.b		; 06 F3
	nop		; EA
	sbc [$6B.b]		; E7 6B
	brk $6C.b		; 00 6C
	sbc [$07.b]		; E7 07
	inc $6D.b,X		; F6 6D
	tsb $6E.b		; 04 6E
	tsb $6F.b		; 04 6F
	tsb $70.b		; 04 70
	tsb $71.b		; 04 71
	tsb $72.b		; 04 72
	asl $F3.b		; 06 F3
	nop		; EA
	sbc [$73.b]		; E7 73
	brk $74.b		; 00 74
	brk $75.b		; 00 75
	brk $25.b		; 00 25
	php		; 08
	sbc $EF.b,X		; F5 EF
	inc $0876.w		; EE 76 08
	adc [$08.b],Y		; 77 08
	sei		; 78
	php		; 08
	adc $7A08.w,Y		; 79 08 7A
	php		; 08
	tda		; 7B
	php		; 08
	jmp ($7D08.w,X)		; 7C 08 7D
	php		; 08
	inc $F309.w		; EE 09 F3
	ora ($7E.b,X)		; 01 7E
	brk $7F.b		; 00 7F
	brk $25.b		; 00 25
	php		; 08
	sbc $EF.b,X		; F5 EF
	inc $0880.w		; EE 80 08
	sta ($08.b,X)		; 81 08
	.db $82, $08, $83		; 82 08 83
	php		; 08
	sty $08.b		; 84 08
	sta $08.b		; 85 08
	stx $08.b		; 86 08
	sta [$08.b]		; 87 08
	inc $F309.w		; EE 09 F3
	ora ($88.b,X)		; 01 88
	brk $89.b		; 00 89
	brk $25.b		; 00 25
	php		; 08
	sbc $EF.b,X		; F5 EF
	inc $088A.w		; EE 8A 08
	phb		; 8B
	php		; 08
	sty $8D08.w		; 8C 08 8D
	php		; 08
	stx $8F08.w		; 8E 08 8F
	php		; 08
	bcc   8.b		; 90 08
	sta ($08.b),Y		; 91 08
	inc $F309.w		; EE 09 F3
	ora ($E7.b,X)		; 01 E7
	sta ($00.b)		; 92 00
	and $08.b		; 25 08
	sbc $EF.b,X		; F5 EF
	inc $0893.w		; EE 93 08
	sty $08.b,X		; 94 08
	sta $08.b,X		; 95 08
	stx $08.b,Y		; 96 08
	sta [$08.b],Y		; 97 08
	tya		; 98
	php		; 08
	sta $9A08.w,Y		; 99 08 9A
	php		; 08
	inc $F309.w		; EE 09 F3
	ora ($E7.b,X)		; 01 E7
	txy		; 9B
	ora [$09.b]		; 07 09
	sbc #$F5.b		; E9 F5
	sbc $F5.b,X		; F5 F5
	xba		; EB
	xce		; FB
	cpx $FE9C.w		; EC 9C FE
	inc $FEFE.w,X		; FE FE FE
	inc $04F8.w,X		; FE F8 04
	stz $0244.w		; 9C 44 02
	sbc #$9E.b		; E9 9E
	tsb $9F.b		; 04 9F
	tsb $A0.b		; 04 A0
	tsb $A1.b		; 04 A1
	asl $F6.b		; 06 F6
	xce		; FB
	cop $E9.b		; 02 E9
	ldx #$04.b		; A2 04
	lda $04.b,S		; A3 04
	adc ($04.b),Y		; 71 04
	adc ($06.b)		; 72 06
	inc $FB.b,X		; F6 FB
	cpx $FFA4.w		; EC A4 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $A404.w,Y		; F9 04 A4
	mvp $01,$EC		; 44 EC 01
	sbc [$A6.b]		; E7 A6
	brk $A7.b		; 00 A7
	brk $A8.b		; 00 A8
	brk $A9.b		; 00 A9
	brk $AA.b		; 00 AA
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B0.b		; 00 B0
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
	cpx $0001.w		; EC 01 00
	tyx		; BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	brk $BE.b		; 00 BE
	brk $BF.b		; 00 BF
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	brk $C2.b		; 00 C2
	brk $C3.b		; 00 C3
	brk $9B.b		; 00 9B
	cpy #$E7.b		; C0 E7
	cpy $00.b		; C4 00
	cmp $00.b		; C5 00
	dec $00.b		; C6 00
	cmp [$00.b]		; C7 00
	iny		; C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	pea $CB00.w		; F4 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CE.b		; 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $D3.b		; 00 D3
	brk $D4.b		; 00 D4
	brk $D5.b		; 00 D5
	brk $D6.b		; 00 D6
	inx		; E8
	brk $D7.b		; 00 D7
	brk $D8.b		; 00 D8
	pea $E7E8.w		; F4 E8 E7
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
	brk $E3.b		; 00 E3
	brk $E4.b		; 00 E4
	brk $E5.b		; 00 E5
	inc $00.b		; E6 00
	brk $26.b		; 00 26
	xce		; FB
	brk $1C.b		; 00 1C
	cpy #$04.b		; C0 04
	brk $39.b		; 00 39
	dey		; 88
	lda [$34.b]		; A7 34
	sta $0864.w,Y		; 99 64 08
	sty $6107.w		; 8C 07 61
	bit $4D.b,X		; 34 4D
	brk $81.b		; 00 81
	rti		; 40

	tax		; AA
	phd		; 0B
	asl $E5B0.w		; 0E B0 E5
	ora $99.b,S		; 03 99
	ora $E52C.w,Y		; 19 2C E5
	rts		; 60

	sty $0710.w		; 8C 10 07
	bcc 105.b		; 90 69
	plp		; 28
	phb		; 8B
	sbc #$79.b		; E9 79
	and ($90.b,X)		; 21 90
	bvc  16.b		; 50 10
	stz $7B96.w		; 9C 96 7B
	adc $4A6E2B.l		; 6F 2B 6E 4A
	ora $2245.w		; 0D 45 22
	ldx $2F.b		; A6 2F
	adc $4829A1.l,X		; 7F A1 29 48
	sta ($4A.b)		; 92 4A
	adc #$4E.b		; 69 4E
	sta $9236.w,Y		; 99 36 92
	cmp #$26.b		; C9 26
	txa		; 8A
	sta ($53.b),Y		; 91 53
	jsl $57AB4C.l		; 22 4C AB 57
	xba		; EB
	adc [$B6.b],Y		; 77 B6
	eor #$B4.b		; 49 B4
	tax		; AA
	lda $6C2E.w,X		; BD 2E 6C
	cmp $1611.w,Y		; D9 11 16
	cmp #$10.b		; C9 10
	bit #$EC.b		; 89 EC
	stx $49.b,Y		; 96 49
	stz $92.b		; 64 92
	eor #$24.b		; 49 24
	sta ($48.b)		; 92 48
	sta $D9B72C.l,X		; 9F 2C B7 D9
	and $4992.w		; 2D 92 49
	rol $6996.w		; 2E 96 69
	stz $DB.b		; 64 DB
	wai		; CB
	bit $B2.b		; 24 B2
	sbc $96E4.w		; ED E4 96
	tad		; 5B
	ldy $96.b,X		; B4 96
	eor #$6C.b		; 49 6C
	sta ($49.b,S),Y		; 93 49
	bit $92.b		; 24 92
	phk		; 4B
	and $B2.b		; 25 B2
	cmp $1161.w,Y		; D9 61 11
	sty $2225.w		; 8C 25 22
	jsr $1F9B.w		; 20 9B 1F
	ora #$13.b		; 09 13
	ldx $AD.b,Y		; B6 AD
	sed		; F8
	pea $3B91.w		; F4 91 3B
	dec $764F.w		; CE 4F 76
	sbc ($13.b),Y		; F1 13
	bvs -109.b		; 70 93
	cpy $AA.b		; C4 AA
	txa		; 8A
	php		; 08
	txy		; 9B
	sty $B4.b		; 84 B4
	pla		; 68
	ora ($3B.b),Y		; 11 3B
	ror A		; 6A
	cmp $48DA.w,X		; DD DA 48
	txa		; 8A
	xba		; EB
	eor #$89.b		; 49 89
	inc $9108.w		; EE 08 91
	xce		; FB
	cpx $5D.b		; E4 5D
	ora #$7A.b		; 09 7A
	inx		; E8
	phx		; DA
	plp		; 28
	jsl $22F2FF.l		; 22 FF F2 22
	xba		; EB
	rol $BA.b,X		; 36 BA
	lda $17A1.w,X		; BD A1 17
	iny		; C8
	ror $BA08.w		; 6E 08 BA
	sbc [$B6.b]		; E7 B6
	tyx		; BB
	sbc $11.b		; E5 11
	adc $E162.w,X		; 7D 62 E1
	ora [$59.b],Y		; 17 59
	sbc $E0AE.w		; ED AE E0
	jsl $7411F8.l		; 22 F8 11 74
	and $B9.b,S		; 23 B9
	ora $04.b		; 05 04
	eor $85448C.l,X		; 5F 8C 44 85
	inc A		; 1A
	tsb $47.b		; 04 47
	sbc ($91.b)		; F2 91
	stz $21.b,X		; 74 21
	cmp ($C6.b)		; D2 C6
	sta ($23.b),Y		; 91 23
	dec $1A.b,X		; D6 1A
	tsb $59.b		; 04 59
	bit $9D.b		; 24 9D
	stz $6E.b		; 64 6E
	inc $8B34.w		; EE 34 8B
	inc $AFD9.w,X		; FE D9 AF
	jsl $368EEE.l		; 22 EE 8E 36
	sbc $2DD2.w		; ED D2 2D
	sty $FF.b,X		; 94 FF
	cmp $7A.b,S		; C3 7A
	eor $98.b		; 45 98
	sta ($E4.b),Y		; 91 E4
	eor $223DA3.l,X		; 5F A3 3D 22
	rol $C7C7.w		; 2E C7 C7
	dec $C6.b		; C6 C6
	jsl $F488FE.l		; 22 FE 88 F4
	php		; 08
	tyx		; BB
	ldy $8D.b,X		; B4 8D
	dec $EB.b		; C6 EB
	pha		; 48
	lda $48F010.l,X		; BF 10 F0 48
	bcc -71.b		; 90 B9
	bvs -119.b		; 70 89
	tas		; 1B
	cpy $49.b		; C4 49
	eor $393939.l		; 4F 39 39 39
	and $3939.w,Y		; 39 39 39
	and $123B.w,Y		; 39 3B 12
	ldx #$22.b		; A2 22
	jsl $C21223.l		; 22 23 12 C2
	and $45.b		; 25 45
	eor $45.b		; 45 45
	eor $4C.b		; 45 4C
	lsr A		; 4A
	dey		; 88
	dey		; 88
	stz $94C3.w		; 9C C3 94
	eor ($C4.b)		; 52 C4
	tay		; A8
	dey		; 88
	bit #$F8.b		; 89 F8
	ora $2C79BE.l		; 0F BE 79 2C
	lsr A		; 4A
	dey		; 88
	stz $3C93.w		; 9C 93 3C
	dec $17.b,X		; D6 17
	dec $8985.w		; CE 85 89
	eor ($11.b),Y		; 51 11
	ora ($92.b,S),Y		; 13 92
	adc ($8E.b),Y		; 71 8E
	and ($12.b,S),Y		; 33 12
	ldx #$27.b		; A2 27
	tsb $2DCD.w		; 0C CD 2D
	sta $6BA6.w,Y		; 99 A6 6B
	ora ($A2.b)		; 12 A2
	rol $A0.b		; 26 A0
	cmp $999D.w,Y		; D9 9D 99
	ldy $36.b,X		; B4 36
	sty $884A.w		; 8C 4A 88
	stz $8E93.w		; 9C 93 8E
	ror $8E33.w,X		; 7E 33 8E
	adc ($D8.b),Y		; 71 D8
	sta $11.b,X		; 95 11
	and $9D80.w,X		; 3D 80 9D
	adc ($C6.b,X)		; 61 C6
	sec		; 38
	cpy $884A.w		; CC 4A 88
	dey		; 88
	txy		; 9B
	eor $EE.b,S		; 43 EE
	trb $25A6.w		; 1C A6 25
	mvp $A8,$4F		; 44 4F A8
	adc $94A7.w,Y		; 79 A7 94
	adc $9AA7.w,Y		; 79 A7 9A
	cpy $A8.b		; C4 A8
	dey		; 88
	bit #$7C.b		; 89 7C
	ldx $625F.w,Y		; BE 5F 62
	jmp $9C9C.w		; 4C 9C 9C
	stz $9C9C.w		; 9C 9C 9C
	stz $9D9C.w		; 9C 9C 9D
	bit #$31.b		; 89 31
	ora ($11.b),Y		; 11 11
	ora ($18.b),Y		; 11 18
	sty $2A.b,X		; 94 2A
	rol A		; 2A
	rol A		; 2A
	ora ($11.b),Y		; 11 11
	clc		; 18
	sty $39.b,X		; 94 39
	adc [$28.b]		; 67 28
	cmp ($88.b,S),Y		; D3 88
	dey		; 88
	sty $1E4A.w		; 8C 4A 1E
	eor #$C7.b		; 49 C7
	and $2202.w,Y		; 39 02 22
	and $12.b,S		; 23 12
	stx $79.b		; 86 79
	jmp ($08D6.w,X)		; 7C D6 08
	dey		; 88
	sty $1C4A.w		; 8C 4A 1C
	adc $8C.b,S		; 63 8C
	adc ($44.b)		; 72 44
	mvp $25,$46		; 44 46 25
	tsb $34D3.w		; 0C D3 34
	cmp $1111.w		; CD 11 11
	clc		; 18
	sty $36.b,X		; 94 36
	sta [$C5.b]		; 87 C5
	and $02.b,X		; 35 02
	jsl $871223.l		; 22 23 12 87
	trb $9CE3.w		; 1C E3 9C
	adc ($11.b),Y		; 71 11
	ora ($89.b),Y		; 11 89
	eor $8C.b,S		; 43 8C
	adc ($8E.b),Y		; 71 8E
	sec		; 38
	dey		; 88
	dey		; 88
	cpy $A1.b		; C4 A1
	dex		; CA
	rol $F2E1.w,X		; 3E E1 F2
	tsb $44.b		; 04 44
	lsr $25.b		; 46 25
	ora $4FF334.l		; 0F 34 F3 4F
	sec		; 38
	mvp $62,$44		; 44 44 62
	bvc -66.b		; 50 BE
	eor $798638.l,X		; 5F 38 86 79
	cmp $11.b		; C5 11
	clc		; 18
	sty $85.b,X		; 94 85
	bvc -86.b		; 50 AA
	ora $42.b,X		; 15 42
	tay		; A8
	eor $0A.b,X		; 55 0A
	lda ($54.b,X)		; A1 54
	rol A		; 2A
	bit #$44.b		; 89 44
	ora ($11.b),Y		; 11 11
	ora ($12.b),Y		; 11 12
	bit $D0.b		; 24 D0
	mvp $4A,$44		; 44 44 4A
	sty $8B.b		; 84 8B
	cpx #$02.b		; E0 02
	php		; 08
	txs		; 9A
	lda $C9.b,S		; A3 C9
	bit $C7.b,X		; 34 C7
	sta ($63.b)		; 92 63
	bra   7.b		; 80 07
	sty $8774.w		; 8C 74 87
	cpx HDMACNT3.w		; EC 3A 43
	txa		; 8A
	and ($9C.b,X)		; 21 9C
	adc [$1B.b]		; 67 1B
	sta ($F9.b)		; 92 F9
	jmp ($7ABE.w,X)		; 7C BE 7A
	ora ($70.b,X)		; 01 70
	clv		; B8
	jmp ($2473.w,X)		; 7C 73 24
	cmp #$32.b		; C9 32
	lsr $427C.w		; 4E 7C 42
	ldx #$A3.b		; A2 A3
	pea $049F.w		; F4 9F 04
	sed		; F8
	adc [$68.b]		; 67 68
	adc $8140C0.l,X		; 7F C0 40 81
	sbc #$CF.b		; E9 CF
	brk $EF.b		; 00 EF
	stx $F6E4.w		; 8E E4 F6
	.db $62, $19, $E2		; 62 19 E2
	stz $C5.b,X		; 74 C5
	sbc ($F9.b)		; F2 F9
	jmp ($15BE.w,X)		; 7C BE 15
	cpy #$E1.b		; C0 E1
	ora $4926.w,Y		; 19 26 49
	sta ($64.b)		; 92 64
	dey		; 88
	adc $6A13.w,X		; 7D 13 6A
	ply		; 7A
	sta ($6A.b,S),Y		; 93 6A
	adc $A94D.w		; 6D 4D A9
	sbc ($43.b)		; F2 43
	.db $62, $6E, $0F		; 62 6E 0F
	bmi -36.b		; 30 DC
	tas		; 1B
	sta $70.b,S		; 83 70
	adc $85C4.w		; 6D C4 85
	bvc -86.b		; 50 AA
	ora $42.b,X		; 15 42
	tay		; A8
	eor $0A.b,X		; 55 0A
	lda ($51.b,X)		; A1 51
	ora ($70.b)		; 12 70
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tay		; A8
	tax		; AA
	and $2089.w,Y		; 39 89 20
	clc		; 18
	ldy $4414.w,X		; BC 14 44
	mvp $01,$45		; 44 45 01
	phb		; 8B
	cmp ($66.b,X)		; C1 66
	ldx $6A.b		; A6 6A
	ror $A6.b		; 66 A6
	ror A		; 6A
	ror $A6.b		; 66 A6
	ror A		; 6A
	bvc  24.b		; 50 18
	ldy $1115.w,X		; BC 15 11
	ora ($10.b),Y		; 11 10
	rti		; 40

	mvp $45,$44		; 44 44 45
	eor $11.b,X		; 55 11
	ora ($10.b),Y		; 11 10
	rti		; 40

	mvp $45,$44		; 44 44 45
	lsr $92.b,X		; 56 92
	sta ($92.b)		; 92 92
	sta ($92.b)		; 92 92
	bcc  64.b		; 90 40
	mvp $45,$44		; 44 44 45
	mvn $04,$89		; 54 89 04
	stz $9C9C.w		; 9C 9C 9C
	stz $9C9C.w		; 9C 9C 9C
	sta $8C88.w,X		; 9D 88 8C
	mvp $44,$44		; 44 44 44
	lsr $25.b		; 46 25
	rol $A6.b		; 26 A6
	ror A		; 6A
	ror $A6.b		; 66 A6
	ror A		; 6A
	ror $A6.b		; 66 A6
	ror A		; 6A
	ror $A6.b		; 66 A6
	ror A		; 6A
	cli		; 58
	sty $11.b,X		; 94 11
	ora ($11.b),Y		; 11 11
	bpl  68.b		; 10 44
	mvp $45,$44		; 44 44 45
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	mvp $44,$44		; 44 44 44
	lsr $92.b		; 46 92
	sta ($92.b)		; 92 92
	sta ($92.b)		; 92 92
	sta ($92.b)		; 92 92
	bcc  68.b		; 90 44
	mvp $44,$44		; 44 44 44
	dey		; 88
	stx $10.b		; 86 10
	jsl $B50452.l		; 22 52 04 B5
	lda ($71.b),Y		; B1 71
	lda ($2C.b)		; B2 2C
	nop		; EA
	inc $50F6.w		; EE F6 50
	sep #$43		; E2 43
	.db $82, $44, $A5		; 82 44 A5
	eor $45.b		; 45 45
	eor $45.b		; 45 45
	eor $50.b		; 45 50
	lsr $22.b		; 46 22
	and ($11.b,X)		; 21 11
	ora ($11.b),Y		; 11 11
	bit #$61.b		; 89 61
	txs		; 9A
	sta $9AA9.w,Y		; 99 A9 9A
	sta $9AA9.w,Y		; 99 A9 9A
	sta $62A9.w,Y		; 99 A9 62
	mvn $11,$51		; 54 51 11
	ora ($15.b),Y		; 11 15
	mvp $44,$44		; 44 44 44
	mvn $11,$51		; 54 51 11
	ora ($15.b),Y		; 11 15
	mvp $44,$44		; 44 44 44
	mvn $29,$69		; 54 69 29
	and #$29.b		; 29 29
	and #$29.b		; 29 29
	ora $44.b,X		; 15 44
	mvp $54,$44		; 44 44 54
	pha		; 48
	lda $9254.w,X		; BD 54 92
	ora ($DA.b)		; 12 DA
	txy		; 9B
	eor [$8B.b]		; 47 8B
	sta $32A5.w		; 8D A5 32
	and ($CF.b,X)		; 21 CF
	ora $1529.w,X		; 1D 29 15
	cmp $A303.w,Y		; D9 03 A3
	cop $8E.b		; 02 8E
	sbc ($BE.b)		; F2 BE
	lsr $AE.b		; 46 AE
	and [$63.b],Y		; 37 63
	sbc ($0C.b)		; F2 0C
	cmp $05.b,S		; C3 05
	cpx $6F17.w		; EC 17 6F
	ora ($27.b),Y		; 11 27
	sta $E6.b		; 85 E6
	ldy $9A27.w,X		; BC 27 9A
	sbc ($1E.b,S),Y		; F3 1E
	ora ($C2.b,S),Y		; 13 C2
	adc $9E122B.l,X		; 7F 2B 12 9E
	phb		; 8B
	stz $EFF7.w,X		; 9E F7 EF
	ror $EFF7.w,X		; 7E F7 EF
	ror $BEE7.w,X		; 7E E7 BE
	phb		; 8B
	ora ($9E.b)		; 12 9E
	tda		; 7B
	dex		; CA
	ply		; 7A
	adc [$A7.b],Y		; 77 A7
	ply		; 7A
	adc [$55.b],Y		; 77 55
	eor [$29.b],Y		; 57 29
	sbc ($D8.b,S),Y		; F3 D8
	tsx		; BA
	lda $57.b		; A5 57
	stz $F0.b		; 64 F0
	lda ($BB.b,S),Y		; B3 BB
	ldy $76DE.w,X		; BC DE 76
	ror $E1ED.w,X		; 7E ED E1
	tsa		; 3B
	and #$FD.b		; 29 FD
	ror $6A.b,X		; 76 6A
	sbc [$39.b]		; E7 39
	ldy $ACEA.w		; AC EA AC
	inc $4B6B.w		; EE 6B 4B
	phk		; 4B
	eor $81.b,S		; 43 81
	cpy #$D0.b		; C0 D0
	cmp ($D2.b)		; D2 D2
	cpy $A4.b		; C4 A4
	ldy $86AD.w		; AC AD 86
	lsr $56.b,X		; 56 56
	cmp $61.b,S		; C3 61
	bcs -60.b		; B0 C4
	lda [$0D.b]		; A7 0D
	cpx $3F.b		; E4 3F
	cmp ($F2.b)		; D2 F2
	asl $CE1B.w,X		; 1E 1B CE
	ldx $9B.b,Y		; B6 9B
	jmp $6E4A.w		; 4C 4A 6E
	stz $F3E7.w		; 9C E7 F3
	lda $9EEF9D.l,X		; BF 9D EF 9E
	sbc $78CE.w,Y		; F9 CE 78
	jmp ($0D4A.w)		; 6C 4A 0D
	ora $0D0D.w		; 0D 0D 0D
	ora $080D.w		; 0D 0D 08
	cpy $A1.b		; C4 A1
	ora [$40.b],Y		; 17 40
	pld		; 2B
	pha		; 48
	eor $F2.b		; 45 F2
	brk $76.b		; 00 76
	tsa		; 3B
	asl $EFC6.w		; 0E C6 EF
	adc $B6.b,S		; 63 B6
	sbc $7D97.w,Y		; F9 97 7D
	dec $8B27.w		; CE 27 8B
	tad		; 5B
	ldy $5E3E.w,X		; BC 3E 5E
	bmi  20.b		; 30 14
	ora [$4A.b],Y		; 17 4A
	asl A		; 0A
	cpy #$59.b		; C0 59
	and $0A285E.l		; 2F 5E 28 0A
	plp		; 28
	jsl $BE08FA.l		; 22 FA 08 BE
	adc ($72.b)		; 72 72
	adc ($72.b)		; 72 72
	bvs -98.b		; 70 9E
	adc ($76.b)		; 72 76
	and $1151A1.l		; 2F A1 51 11
	ora ($05.b),Y		; 11 05
	clc		; 18
	bcc  21.b		; 90 15
	pld		; 2B
	.db $42, $3A		; 42 3A
	phk		; 4B
	ora ($C2.b)		; 12 C2
	cli		; 58
	phk		; 4B
	lsr $23BC.w,X		; 5E BC 23
	txa		; 8A
	cmp $72.b		; C5 72
	rol A		; 2A
	bcc -80.b		; 90 B0
	jmp ($DAB8.w,X)		; 7C B8 DA
	plp		; 28
	lda $D96390.l		; AF 90 63 D9
	cmp [$AF.b]		; C7 AF
	sta $96D66A.l		; 8F 6A D6 96
	rol $C9.b,X		; 36 C9
	tay		; A8
	cop $B9.b		; 02 B9
	jmp $1663AE.l		; 5C AE 63 16
	eor ($30.b,X)		; 41 30
	stz $96B3.w		; 9C B3 96
	adc ($CE.b)		; 72 CE
	eor $39CB.w,Y		; 59 CB 39
	jmp ($8849.w)		; 6C 49 88
	sta ($9C.b,S),Y		; 93 9C
	eor ($F9.b)		; 52 F9
	jmp ($75BE.w,X)		; 7C BE 75
	cpx $8949.w		; EC 49 89
	cmp $A639.w		; CD 39 A6
	and $36B2.w,Y		; 39 B2 36
	lsr $C8.b		; 46 C8
	cmp $2631.w,Y		; D9 31 26
	jsl $3FE627.l		; 22 27 E6 3F
	inx		; E8
	sbc ($8F.b,S),Y		; F3 8F
	sec		; 38
	sbc ($98.b,S),Y		; F3 98
	sta ($13.b,S),Y		; 93 13
	sta ($67.b)		; 92 67
	txs		; 9A
.ACCU 16
.INDEX 16
	rep #$F9		; C2 F9
	jmp ($5FBE.w,X)		; 7C BE 5F
	.db $62, $4C, $44		; 62 4C 44
	eor $B3E1.w		; 4D E1 B3
	and [$87.b],Y		; 37 87
	jsr $B1D9.w		; 20 D9 B1
	and [$5A.b]		; 27 5A
	lda ($5C.b),Y		; B1 5C
	sta $8B.b		; 85 8B
	bpl -110.b		; 10 92
	lda $6C.b,X		; B5 6C
	phk		; 4B
	ora $8C.b,X		; 15 8C
	.db $42, $42		; 42 42
	cmp ($02.b,X)		; C1 02
	lda $4088.w,Y		; B9 88 40
	sty $C7.b,X		; 94 C7
	cmp [$C8.b]		; C7 C8
	ldy $59.b,X		; B4 59
	lda $6B.b,X		; B5 6B
	eor ($5F.b),Y		; 51 5F
	eor $161A.w		; 4D 1A 16
	ldy $31D7.w		; AC D7 31
	sta $A429.w		; 8D 29 A4
	dec A		; 3A
	cop $C9.b		; 02 C9
	and ($28.b),Y		; 31 28
	adc ($11.b,X)		; 61 11
	ora ($11.b),Y		; 11 11
	clc		; 18
	sty $38.b,X		; 94 38
	ldx #$2222.w		; A2 22 22
	and $12.b,S		; 23 12
	sta [$C5.b]		; 87 C5
	ora ($11.b),Y		; 11 11
	ora ($18.b),Y		; 11 18
	sty $33.b,X		; 94 33
	sty $44.b		; 84 44
	mvp $25,$46		; 44 46 25
	ora $8860.w		; 0D 60 88
	dey		; 88
	dey		; 88
	cpy $A1.b		; C4 A1
	ldy $1111.w,X		; BC 11 11
	ora ($18.b),Y		; 11 18
	sty $AE.b,X		; 94 AE
	lsr $8E.b,X		; 56 8E
	bit $8F.b		; 24 8F
	sty $02.b		; 84 02
	tsb $A4.b		; 04 A4
	ora #$AA08.w		; 09 08 AA
	tsb $0D.b		; 04 0D
	cmp [$73.b],Y		; D7 73
	lda $ED8D.w,Y		; B9 8D ED
	sbc $68.b,S		; E3 68
	ldx #$8807.w		; A2 07 88
	lsr $BDBB.w,X		; 5E BB BD
	lda $46.b,S		; A3 46
	pha		; 48
	.db $62, $12, $9F		; 62 12 9F
	dey		; 88
	jsr ($8047.w,X)		; FC 47 80
	jmp ($A000.w)		; 6C 00 A0
	ldx #$B78B.w		; A2 8B B7
	eor $76.b,S		; 43 76
	ror $EDCD.w		; 6E CD ED
	cpy #$0AA0.w		; C0 A0 0A
	tsb $2505.w		; 0C 05 25
	and [$94.b]		; 27 94
	php		; 08
	stz $95D3.w		; 9C D3 95
	lda [$FD.b]		; A7 FD
	sta $9D47.w,X		; 9D 47 9D
	plb		; AB
	cmp $99.b,S		; C3 99
	lda $43AB55.l,X		; BF 55 AB 43
	sta $2B4F.w,Y		; 99 4F 2B
	ora [$E8.b]		; 07 E8
	lda $BDC1.w,X		; BD C1 BD
	cmp $A0.b,S		; C3 A0
	mvp $40,$41		; 44 41 40
	ora ($54.b,X)		; 01 54
	bpl  17.b		; 10 11
	bpl  70.b		; 10 46
	lda ($41.b)		; B2 41
	rti		; 40

	ora ($56.b,X)		; 01 56
	bpl -88.b		; 10 A8
	tsb $44.b		; 04 44
	ora ($11.b),Y		; 11 11
	bvc -23.b		; 50 E9
	bit $DA.b,X		; 34 DA
	eor $A0AA5C.l		; 4F 5C AA A0
	php		; 08
	dey		; 88
	jsl $AEA122.l		; 22 22 A1 AE
	beq -66.b		; F0 BE
	stx $C5.b		; 86 C5
	eor $40.b,X		; 55 40
	ora ($10.b),Y		; 11 10
	lsr $84.b		; 46 84
	trb $09.b		; 14 09
	ora #$4195.w		; 09 95 41
	ora ($11.b,X)		; 01 11
	tsb $44.b		; 04 44
	trb $0C.b		; 14 0C
	and $4A.b		; 25 4A
	ldy #$8880.w		; A0 80 88
	.db $82, $24, $E6		; 82 24 E6
	ror $57.b,X		; 76 57
	bcs -61.b		; B0 C3
	wai		; CB
	cmp $E5.b,X		; D5 E5
	cpx $74.b		; E4 74
	rol A		; 2A
	ldy $76F9.w		; AC F9 76
	sbc ($A6.b,S),Y		; F3 A6
	txs		; 9A
	lsr $BC0C.w,X		; 5E 0C BC
	eor $7B3C.w,Y		; 59 3C 7B
	stp		; DB
	sed		; F8
	jmp.w [$4A3F]		; DC 3F 4A
	cmp $299D.w		; CD 9D 29
	xba		; EB
	bit $1CE5.w		; 2C E5 1C
	jsr ($8B32.w,X)		; FC 32 8B
	ldx $BC.b		; A6 BC
	cpy $533B.w		; CC 3B 53
	mvn $06,$75		; 54 75 06
	ldy #$F1EC.w		; A0 EC F1
	lda $68D9.w,X		; BD D9 68
	inc $05.b,X		; F6 05
	sta $4C.b,S		; 83 4C
	pla		; 68
	bit #$404F.w		; 89 4F 40
	sbc $CC89.w		; ED 89 CC
	lda ($D9.b)		; B2 D9
	jmp ($9498.w)		; 6C 98 94
	cmp [$E0.b],Y		; D7 E0
	cmp [$E0.b],Y		; D7 E0
	nop		; EA
	adc $566F6B.l		; 6F 6B 6F 56
	ldx #$1BC5.w		; A2 C5 1B
	adc ($72.b,S),Y		; 73 72
	adc $51DE28.l		; 6F 28 DE 51
	txy		; 9B
	lsr $6D.b		; 46 6D
	php		; 08
	dey		; 88
	sta $0266.w,Y		; 99 66 02
	.db $82, $2E, $44		; 82 2E 44
	jmp $F016.w		; 4C 16 F0
	tad		; 5B
	cmp ($6F.b,X)		; C1 6F
	ora $B1.b		; 05 B1
	ldy #$65C0.w		; A0 C0 65
	clc		; 18
	sbc $92.b		; E5 92
	cmp ($5C.b),Y		; D1 5C
	bcs  34.b		; B0 22
	jsl $BC2522.l		; 22 22 25 BC
	ora ($A6.b,X)		; 01 A6
	sbc #$BD08.w		; E9 08 BD
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	and $DE.b,X		; 35 DE
	ora ($16.b),Y		; 11 16
	rti		; 40

	.db $82, $22, $22		; 82 22 22
	jsl $769621.l		; 22 21 96 76
	cmp [$CA.b]		; C7 CA
	and $A690.w,Y		; 39 90 A6
	clc		; 18
	pld		; 2B
	sbc $BB58.w,Y		; F9 58 BB
	pea $8A4A.w		; F4 4A 8A
	txa		; 8A
	ldy #$4A9C.w		; A0 9C 4A
	jsr ($520C.w,X)		; FC 0C 52
	cmp $1ECE.w,X		; DD CE 1E
	adc [$CC.b]		; 67 CC
	ldx $5A.b		; A6 5A
	adc $A6.b		; 65 A6
	jmp ($0619.w)		; 6C 19 06
	lda ($2D.b),Y		; B1 2D
	jmp.w [$329B]		; DC 9B 32
	ror A		; 6A
	ror $A6.b		; 66 A6
	dec $D004.w,X		; DE 04 D0
	sta ($D6.b)		; 92 D6
	nop		; EA
	cmp [$0E.b],Y		; D7 0E
	lda $14BF06.l,X		; BF 06 BF 14
.INDEX 8
	sep #$1C		; E2 1C
	lsr A		; 4A
	cmp $6F97.w,X		; DD 97 6F
	inc $F9.b,X		; F6 F9
	and ($72.b)		; 32 72
	stz $CF.b		; 64 CF
	sta ($3E.b,S),Y		; 93 3E
	lsr $0C.b		; 46 0C
	clc		; 18
	eor $5EB1B6.l		; 4F B6 B1 5E
	eor ($06.b)		; 52 06
	and $79.b		; 25 79
	php		; 08
	plb		; AB
	lda ($26.b,X)		; A1 26
	and $24.b		; 25 24
	bit $24.b		; 24 24
	jsr $8404.w		; 20 04 84
	phd		; 0B
	lda $D2.b		; A5 D2
	sbc ($74.b,X)		; E1 74
	xba		; EB
	lsr $90D4.w		; 4E D4 90
	stp		; DB
	ora [$8B.b],Y		; 17 8B
	dec $02.b		; C6 02
	sta ($09.b,S),Y		; 93 09
	ldy #$6E.b		; A0 6E
	ora $B9C1.w		; 0D C1 B9
	pld		; 2B
	cmp ($62.b),Y		; D1 62
	txa		; 8A
	pei ($6B.b)		; D4 6B
	adc $22F242.l		; 6F 42 F2 22
	jsl $373434.l		; 22 34 34 37
	dey		; 88
	sta ($A0.b),Y		; 91 A0
	ora ($1C.b),Y		; 11 1C
	asl $F0.b,X		; 16 F0
	tad		; 5B
	cmp ($6F.b,X)		; C1 6F
	ora $B4.b		; 05 B4
	ldy $2C56.w		; AC 56 2C
	ora $CB.b,X		; 15 CB
	eor $93.b		; 45 93
	trb $2DCA.w		; 1C CA 2D
	cpx #$B7.b		; E0 B7
	.db $82, $DE, $04		; 82 DE 04
	mvp $02,$44		; 44 44 02
	lda $5DAB.w,X		; BD AB 5D
	asl $3E.b		; 06 3E
	lda [$2A.b]		; A7 2A
	cmp $C0DC.w		; CD DC C0
	ora ($FF.b,S),Y		; 13 FF
	pea $6D7C.w		; F4 7C 6D
	and $FC.b		; 25 FC
	sta $E1AEBB.l,X		; 9F BB AE E1
	sbc $22.b		; E5 22
	bpl  49.b		; 10 31
	and ($F4.b),Y		; 31 F4
	plx		; FA
	stz $6397.w,X		; 9E 97 63
	lda $00A3C6.l		; AF C6 A3 00
	ora #$C7C5.w		; 09 C5 C7
	lda $75F793.l,X		; BF 93 F7 75
	stp		; DB
	and $F3DE.w,X		; 3D DE F3
	lsr $A889.w,X		; 5E 89 A8
	dec $14F5.w,X		; DE F5 14
	adc $1C.b,X		; 75 1C
	tsb $208E.w		; 0C 8E 20
	sta $15.b,X		; 95 15
	ora $03B7.w,X		; 1D B7 03
	eor ($C0.b),Y		; 51 C0
	nop		; EA
	sec		; 38
	sta $8808.w,Y		; 99 08 88
	bit #$AC0D.w		; 89 0D AC
	stz $7859.w		; 9C 59 78
	and ($F7.b)		; 32 F7
	trb $66FE.w		; 1C FE 66
	lda $E6C80F.l		; AF 0F C8 E6
	adc ($CF.b,X)		; 61 CF
	cmp $2E.b,S		; C3 2E
	ora $CB70.w,Y		; 19 70 CB
	lda ($26.b,X)		; A1 26
	xba		; EB
	and ($5C.b)		; 32 5C
	and ($E1.b)		; 32 E1
	sta [$0F.b],Y		; 97 0F
	bit #$78E4.w		; 89 E4 78
	stz $8947.w,X		; 9E 47 89
	cpx $5E.b		; E4 5E
	sbc $133B5A.l,X		; FF 5A 3B 13
	bit #$8B5F.w		; 89 5F 8B
	adc [$83.b]		; 67 83
	sta [$C0.b],Y		; 97 C0
	wai		; CB
	cpx #$65.b		; E0 65
	beq  39.b		; F0 27
	stp		; DB
	bmi 100.b		; 30 64
	stz $65.b		; 64 65
	beq  77.b		; F0 4D
	sta ($96.b,X)		; 81 96
	adc #$074B.w		; 69 4B 07
	sec		; 38
	pha		; 48
	rti		; 40

	tay		; A8
	stz $2DCB.w		; 9C CB 2D
	sta ($13.b,S),Y		; 93 13
	ora ($92.b)		; 12 92
	ora [$2F.b],Y		; 17 2F
	adc $60.b		; 65 60
	lda ($4D.b,S),Y		; B3 4D
	jmp ($E832.w,X)		; 7C 32 E8
	php		; 08
	phb		; 8B
	adc $E0BC.w,Y		; 79 BC E0
	adc #$AA70.w		; 69 70 AA
	ldx $2C03.w		; AE 03 2C
	txa		; 8A
	bcs  80.b		; B0 50
	jsl $888888.l		; 22 88 88 88
	plb		; AB
	bra -96.b		; 80 A0
	sta ($2C.b,X)		; 81 2C
	and ($25.b)		; 32 25
	cmp ($96.b,X)		; C1 96
	jsl $C88888.l		; 22 88 88 C8
	stp		; DB
	eor $04.b,X		; 55 04
	lda ($11.b,X)		; A1 11
	ora ($14.b),Y		; 11 14
	lsr $76.b		; 46 76
	and $890A.w		; 2D 0A 89
	rol A		; 2A
	.db $82, $22, $22		; 82 22 22
	dey		; 88
	inx		; E8
	and $31.b,X		; 35 31
	eor $9639.w,Y		; 59 39 96
	eor $4C7A.w		; 4D 7A 4C
	wai		; CB
	cld		; D8
	clv		; B8
	mvp $11,$51		; 44 51 11
	inc A		; 1A
	inc A		; 1A
	eor $70.b,X		; 55 70
	sbc $3773.w		; ED 73 37
	eor $46.b		; 45 46
	clc		; 18
	clc		; 18
	lda ($08.b)		; B2 08
	inc $11B3.w		; EE B3 11
	ora ($18.b),Y		; 11 18
	rol A		; 2A
	cmp $E3E0.w,Y		; D9 E0 E3
	inc $5BAE.w		; EE AE 5B
	tyx		; BB
	sta [$7A.b],Y		; 97 7A
	adc ($11.b),Y		; 71 11
	adc $65.b		; 65 65
	ror $6D.b		; 66 6D
	lda $AB6A.w,Y		; B9 6A AB
	cop $24.b		; 02 24
	ldy #$44.b		; A0 44
	stz $E1E4.w		; 9C E4 E1
	bit $E4E4.w,X		; 3C E4 E4
	cpx $E4.b		; E4 E4
	nop		; EA
	plb		; AB
	eor $16.b,S		; 43 16
	php		; 08
	.db $82, $88, $88		; 82 88 88
	cmp $43.b		; C5 43
	asl $09.b,X		; 16 09
	sbc ($9F.b,X)		; E1 9F
	jmp $27FB.w		; 4C FB 27
	jmp.w [$333C]		; DC 3C 33
	cmp $3C.b,S		; C3 3C
	rol $24.b,X		; 36 24
	cpy $44.b		; C4 44
	ldx $6579.w,Y		; BE 79 65
	sbc ($F9.b)		; F2 F9
	sbc $B1.b		; E5 B1
	rol $26.b		; 26 26
	sei		; 78
	stz $BEC4.w,X		; 9E C4 BE
	rtl		; 6B

	phd		; 0B
	sbc $F6.b		; E5 F6
	bit $C4.b		; 24 C4
	mvp $1B,$DE		; 44 DE 1B
	and ($72.b)		; 32 72
	adc ($66.b,S),Y		; 73 66
	cpy $99.b		; C4 99
	sbc ($88.b,X)		; E1 88
	dey		; 88
	dey		; 88
	sty $1C4A.w		; 8C 4A 1C
	eor ($11.b,X)		; 41 11
	ora ($11.b),Y		; 11 11
	bit #$7242.w		; 89 42 72
	adc ($72.b)		; 72 72
	adc ($72.b)		; 72 72
	adc ($70.b)		; 72 70
	.db $62, $4C, $44		; 62 4C 44
	mvp $41,$44		; 44 44 41
	bit #$C43A.w		; 89 3A C4
	eor #$404A.w		; 49 4A 40
	bit #$630C.w		; 89 0C 63
	adc [$73.b],Y		; 77 73
	rts		; 60

	lsr A		; 4A
	lsr $22.b,X		; 56 22
	ldy $49.b		; A4 49
	cmp #$0889.w		; C9 89 08
	plb		; AB
	cmp $1F14.w,X		; DD 14 1F
	bvc -46.b		; 50 D2
	sta $ECD2A0.l,X		; 9F A0 D2 EC
	bit $55.b,X		; 34 55
	txa		; 8A
	iny		; C8
	dey		; 88
	bit #$6C39.w		; 89 39 6C
	sty $FC.b,X		; 94 FC
	asl $F8.b		; 06 F8
	lda $6C76.w,Y		; B9 76 6C
	lda $77.b,S		; A3 77
	ldy $DB.b		; A4 DB
	inc $1EBB.w,X		; FE BB 1E
	plx		; FA
	lda ($22.b)		; B2 22
	jsl $F82622.l		; 22 22 26 F8
	cmp ($96.b),Y		; D1 96
	ora $75C0.w		; 0D C0 75
	and $FFDECD.l,X		; 3F CD DE FF
	cmp $3E9E.w,X		; DD 9E 3E
	and ($22.b)		; 32 22
	jsl $052522.l		; 22 22 25 05
	ora [$00.b]		; 07 00
	dec $3C.b		; C6 3C
	jsl $0A9FB5.l		; 22 B5 9F 0A
	lda $17.b,X		; B5 17
	bmi  26.b		; 30 1A
	cop $22.b		; 02 22
	jsl $415524.l		; 22 24 55 41
	xce		; FB
	cmp [$77.b]		; C7 77
	adc ($D4.b,S),Y		; 73 D4
	phy		; 5A
	nop		; EA
	adc ($40.b)		; 72 40
	plp		; 28
	and #$112A.w		; 29 2A 11
	ora ($24.b)		; 12 24
	and $36.b,X		; 35 36
	stz $B8.b		; 64 B8
	eor $B7.b		; 45 B7
	sta $2201.w		; 8D 01 22
	lsr A		; 4A
	.db $82, $24, $AF		; 82 24 AF
	trb $12E9.w		; 1C E9 12
	eor ($11.b,S),Y		; 53 11
	and $F6.b		; 25 F6
	rol $D5F5.w		; 2E F5 D5
	xba		; EB
	dec $22.b,X		; D6 22
	pei ($49.b)		; D4 49
	pha		; 48
	tyx		; BB
	xce		; FB
	inc $A3D7.w		; EE D7 A3
	and [$76.b]		; 27 76
	eor $A8.b		; 45 A8
	bit #$4096.w		; 89 96 40
	txa		; 8A
	lda $A6.b,X		; B5 A6
	tax		; AA
	sbc $3131BC.l		; EF BC 31 31
	xce		; FB
	xba		; EB
	sta $B4.b,X		; 95 B4
	rti		; 40

	php		; 08
	dey		; 88
	bit #$006C.w		; 89 6C 00
	inc $BCE3.w,X		; FE E3 BC
	and $26.b,X		; 35 26
	eor #$3DC5.w		; 49 C5 3D
	sta $BEEC55.l,X		; 9F 55 EC BE
	jmp ($5131.w)		; 6C 31 51
	ora ($11.b),Y		; 11 11
	ora ($63.b)		; 12 63
	cmp $F956.w,X		; DD 56 F9
	inc $DB.b		; E6 DB
	tas		; 1B
	cmp [$B1.b]		; C7 B1
	cld		; D8
	inc A		; 1A
	jmp ($5D9F.w,X)		; 7C 9F 5D
.ACCU 8
	sep #$69		; E2 69
	jsr ($44F4.w,X)		; FC F4 44
	mvp $4D,$44		; 44 44 4D
	adc $9C9F.w,X		; 7D 9F 9C
	ror A		; 6A
	jmp ($6DFC.w)		; 6C FC 6D
	ora [$DB.b],Y		; 17 DB
	lda ($ED.b,S),Y		; B3 ED
	and $D6BF.w,X		; 3D BF D6
	and ($B5.b)		; 32 B5
	tay		; A8
	dey		; 88
	dey		; 88
	dey		; 88
	stz $DEAC.w,X		; 9E AC DE
	cpx $57.b		; E4 57
	lda $EDD6.w		; AD D6 ED
	xce		; FB
	cop $1A.b		; 02 1A
	stx $DADF.w		; 8E DF DA
	sbc $4494BA.l		; EF BA 94 44
	mvp $40,$44		; 44 44 40
	lda $B463.w,X		; BD 63 B4
	ldx #$CC.b		; A2 CC
	plp		; 28
	cpy $BD.b		; C4 BD
	cpx $7DB4.w		; EC B4 7D
	ror $5BFF.w		; 6E FF 5B
	eor ($50.b,X)		; 41 50
	dey		; 88
	dey		; 88
	dey		; 88
	ora ($7B.b,X)		; 01 7B
	tas		; 1B
	tda		; 7B
	sbc $7DE5FD.l		; EF FD E5 7D
	eor $9D7F56.l,X		; 5F 56 7F 9D
	sta $2900.w,Y		; 99 00 29
	ora ($11.b),Y		; 11 11
	ora ($2C.b)		; 12 2C
	lda $E9E5.w,Y		; B9 E5 E9
	bcs 119.b		; B0 77
	phy		; 5A
	eor $661F.w		; 4D 1F 66
	brk $14.b		; 00 14
	ora $08.b,X		; 15 08
	bit #$17.b		; 89 17
	eor $7F3B.w,X		; 5D 3B 7F
	sbc [$FF.b]		; E7 FF
	lsr $8BB4.w		; 4E B4 8B
	bvs -120.b		; 70 88
	sta $A5496B.l,X		; 9F 6B 49 A5
	cmp ($92.b),Y		; D1 92
	cpy #$8B.b		; C0 8B
	ora ($2C.b,S),Y		; 13 2C
	sty $81.b,X		; 94 81
	asl $7D.b,X		; 16 7D
	stx $F5AB.w		; 8E AB F5
	eor $B4F1.w,Y		; 59 F1 B4
	sta ($6A.b)		; 92 6A
	adc $6C.b,S		; 63 6C
	sta $C8.b,X		; 95 C8
	cop $22.b		; 02 22
	bit $E4.b		; 24 E4
	cpy $00.b		; C4 00
	cmp ($74.b,S),Y		; D3 74
	sta $93BE9E.l,X		; 9F 9E BE 93
	dec $DA.b,X		; D6 DA
	cld		; D8
	ror $56.b,X		; 76 56
	adc $B66D5D.l,X		; 7F 5D 6D B6
	tax		; AA
	cmp $88883E.l		; CF 3E 88 88
	dey		; 88
	sta $B767.w,Y		; 99 67 B7
	sbc [$B6.b]		; E7 B6
	sbc $F61F.w,X		; FD 1F F6
	rtl		; 6B

	lda $FA9345.l,X		; BF 45 93 FA
	and [$DF.b],Y		; 37 DF
	wai		; CB
	ldx #$FD.b		; A2 FD
	stp		; DB
	ora $1151.w,Y		; 19 51 11
	ora ($11.b),Y		; 11 11
	tsa		; 3B
	pld		; 2B
	tsa		; 3B
	ply		; 7A
	pei ($6C.b)		; D4 6C
	jmp ($BDF2.w)		; 6C F2 BD
	sta [$BB.b],Y		; 97 BB
	cmp [$7F.b],Y		; D7 7F
	lsr $E0FB.w,X		; 5E FB E0
	ror $4CFF.w,X		; 7E FF 4C
	dey		; 88
	dey		; 88
	dey		; 88
	bit #$5F.b		; 89 5F
	eor $ADB8.w,X		; 5D B8 AD
	lda $EA.b		; A5 EA
	tyx		; BB
	sta $3619.w,X		; 9D 19 36
	sta $FAF57D.l,X		; 9F 7D F5 FA
	cmp $D0A90F.l,X		; DF 0F A9 D0
	ora ($11.b),Y		; 11 11
	ora ($10.b),Y		; 11 10
	asl A		; 0A
	and ($AC.b),Y		; 31 AC
	xce		; FB
	cpy $17AF.w		; CC AF 17
	tas		; 1B
	jsr ($FA6E.w,X)		; FC 6E FA
	sta $FDF3A5.l		; 8F A5 F3 FD
	clv		; B8
	bvc  97.b		; 50 61
	ora ($11.b),Y		; 11 11
	ora ($2A.b)		; 12 2A
	ldy #$BD.b		; A0 BD
	adc [$EC.b]		; 67 EC
	cmp $45.b,S		; C3 45
	beq -67.b		; F0 BD
	tas		; 1B
	jsr $4101.w		; 20 01 41
	sty $44.b		; 84 44
	pha		; 48
	sta ($F0.b),Y		; 91 F0
	ply		; 7A
	and $F08B1C.l,X		; 3F 1C 8B F0
	bit #$8F.b		; 89 8F
	cpy $AF.b		; C4 AF
	and ($17.b,X)		; 21 17
	ldy $C4.b		; A4 C4
	pha		; 48
	cli		; 58
	cpx $55BD.w		; EC BD 55
	stz $2687.w,X		; 9E 87 26
	ldy $08.b,X		; B4 08
	lda $7212.w		; AD 12 72
	.db $42, $2C		; 42 2C
	sbc $68.b		; E5 68
	lda $C1.b		; A5 C1
	lda $FF.b		; A5 FF
	sta $68DD87.l,X		; 9F 87 DD 68
	lda $44.b,X		; B5 44
	brk $11.b		; 00 11
	ora ($32.b),Y		; 11 32
	iny		; C8
	brk $1B.b		; 00 1B
	ldx $27C7.w,Y		; BE C7 27
	lda $F7DAE4.l		; AF E4 DA F7
	ora $7DD7DB.l,X		; 1F DB D7 7D
	ldx $B5E3.w		; AE E3 B5
	stx $28.b		; 86 28
	jsl $4C2222.l		; 22 22 22 4C
	asl $9F.b		; 06 9F
	sbc ($FA.b,X)		; E1 FA
	cli		; 58
	txs		; 9A
	lda $F8BB1B.l		; AF 1B BB F8
	cmp $D3D6.w,X		; DD D6 D3
	phx		; DA
	sei		; 78
	lda $AF9B.w,Y		; B9 9B AF
	eor $51EF.w,Y		; 59 EF 51
	ora ($11.b),Y		; 11 11
	ora ($72.b)		; 12 72
	sbc [$8F.b]		; E7 8F
	tad		; 5B
	bne  -6.b		; D0 FA
	tsa		; 3B
	asl $F29F.w,X		; 1E 9F F2
	adc $7EFA.w,Y		; 79 FA 7E
	ora [$4D.b],Y		; 17 4D
	inc $DE7F.w		; EE 7F DE
	bit #$D1.b		; 89 D1
	ora ($11.b),Y		; 11 11
	ora ($2C.b),Y		; 11 2C
	sbc $33DF.w,X		; FD DF 33
	pei ($9D.b)		; D4 9D
	ora [$CE.b],Y		; 17 CE
	cpx $DDFB.w		; EC FB DD
	sta [$E9.b],Y		; 97 E9
	pea $DEFB.w		; F4 FB DE
.ACCU 16
	rep #$EE		; C2 EE
	ror A		; 6A
	jsl $242222.l		; 22 22 22 24
	sta $C8.b,X		; 95 C8
	sta ($94.b),Y		; 91 94
	bit #$6D2F.w		; 89 2F 6D
	cmp $6C.b,X		; D5 6C
	tsa		; 3B
	wai		; CB
	jmp $1168F5.l		; 5C F5 68 11
	phy		; 5A
	and $B2.b		; 25 B2
	.db $42, $2C		; 42 2C
	lda $AE7CFB.l		; AF FB 7C AE
	phb		; 8B
	tsx		; BA
	phx		; DA
	cli		; 58
	inc $6B.b		; E6 6B
	sbc $16C3.w		; ED C3 16
	brk $22.b		; 00 22
	jsl $404C4E.l		; 22 4E 4C 40
	phd		; 0B
	jmp.w [$2FFE]		; DC FE 2F
	sta ($EB.b,X)		; 81 EB
	jsr ($A38F.w,X)		; FC 8F A3
	adc ($CA.b,S),Y		; 73 CA
	inx		; E8
	tyx		; BB
	adc $C88D95.l,X		; 7F 95 8D C8
	sbc $5D.b,X		; F5 5D
	cop $22.b		; 02 22
	jsl $9E6522.l		; 22 22 65 9E
	lda $1F74DF.l		; AF DF 74 1F
	eor [$5B.b],Y		; 57 5B
	sed		; F8
	ply		; 7A
	sbc $7EEFAB.l,X		; FF AB EF 7E
	cmp $5ADC6B.l		; CF 6B DC 5A
	cpx $FA.b		; E4 FA
	cmp $8888CC.l,X		; DF CC 88 88
	dey		; 88
	bit #$B147.w		; 89 47 B1
	inc $ACFA.w		; EE FA AC
	eor $DA6D4B.l		; 4F 4B 6D DA
	inc $6B2F.w,X		; FE 2F 6B
	sbc $D3B7FE.l		; EF FE B7 D3
	cpx $3872.w		; EC 72 38
	dey		; 88
	dey		; 88
	dey		; 88
	dey		; 88
	txy		; 9B
	sta $3FE7EA.l		; 8F EA E7 3F
	stz $B8.b,X		; 74 B8
	ror $810F.w,X		; 7E 0F 81
	sta ($D7.b,S),Y		; 93 D7
	cmp #$F1A1.w		; C9 A1 F1
	ror $F87F.w,X		; 7E 7F F8
	tda		; 7B
	cpx $44.b		; E4 44
	mvp $43,$44		; 44 44 43
	sbc [$62.b],Y		; F7 62
	adc $2D7E.w,Y		; 79 7E 2D
	sta $E16F.w,X		; 9D 6F E1
	cmp $F2.b		; C5 F2
	and #$F59B.w		; 29 9B F5
	plx		; FA
	adc $DAFE77.l		; 6F 77 FE DA
	cop $22.b		; 02 22
	jsl $7B0122.l		; 22 22 01 7B
	inc $FC.b		; E6 FC
	and $BDAB99.l		; 2F 99 AB BD
	cmp ($7A.b),Y		; D1 7A
	adc $BDFFD3.l,X		; 7F D3 FF BD
	asl $9F.b		; 06 9F
	cmp $42C50B.l		; CF 0B C5 42
	jsl $784522.l		; 22 22 45 78
	and ($BE.b),Y		; 31 BE
	and [$8B.b]		; 27 8B
	cmp ($74.b,S),Y		; D3 74
	sec		; 38
	dec A		; 3A
	lda $1800BC.l,X		; BF BC 00 18
	tsb $44.b		; 04 44
	pha		; 48
	tyx		; BB
	eor $F8BE8D.l,X		; 5F 8D BE F8
	clc		; 18
	ldx $1689.w,Y		; BE 89 16
	cmp ($22.b)		; D2 22
	mvp $05,$85		; 44 85 05
	txs		; 9A
	pha		; 48
	ldx $0983.w,Y		; BE 83 09
	cmp $FAEC71.l		; CF 71 EC FA
	.db $62, $2F, $4B		; 62 2F 4B
	stz $48.b		; 64 48
	ror $6E.b		; 66 6E
	ldx $5167.w		; AE 67 51
	and $1521.w,Y		; 39 21 15
	ldx #$24.b		; A2 24
	sty $5B.b		; 84 5B
	and #$2F02.w		; 29 02 2F
	sty $81.b,X		; 94 81
	ora ($1F.b)		; 12 1F
	phd		; 0B
	lda $86CDAD.l,X		; BF AD CD 86
	ldx #$B4.b		; A2 B4
	php		; 08
	lda $D912.w		; AD 12 D9
	and ($16.b,X)		; 21 16
	adc $BF1E.w,Y		; 79 1E BF
	bne -25.b		; D0 E7
	plx		; FA
	sbc $C33FB4.l		; EF B4 3F C3
	xba		; EB
	cpx $00CA.w		; EC CA 00
	dey		; 88
	bit #$3039.w		; 89 39 30
	ora ($F9.b,X)		; 01 F9
	adc $AF8E.w,X		; 7D 8E AF
	.db $82, $3F, $63		; 82 3F 63
	sed		; F8
	lda ($56.b,X)		; A1 56
	ror $EA.b		; 66 EA
	inc $71.b		; E6 71
	and ($22.b)		; 32 22
	jsl $784C22.l		; 22 22 4C 78
	ora $F17307.l,X		; 1F 07 73 F1
	xba		; EB
	adc ($6F.b,S),Y		; 73 6F
	adc $8E.b		; 65 8E
	sta [$F6.b],Y		; 97 F6
	sta $E4CC.w		; 8D CC E4
	mvp $44,$44		; 44 44 44
	phk		; 4B
	trb $DCCA.w		; 1C CA DC
	cmp ($B3.b),Y		; D1 B3
	wai		; CB
	ora ($DB.b),Y		; 11 DB
	jsr ($4491.w,X)		; FC 91 44
	mvp $44,$44		; 44 44 44
	dex		; CA
	sbc ($F4.b,X)		; E1 F4
	and $FEC1AB.l,X		; 3F AB C1 FE
	rol $65F7.w,X		; 3E F7 65
	sbc ($F7.b),Y		; F1 F7
	and $B3B33B.l,X		; 3F 3B B3 B3
	wai		; CB
	xce		; FB
	cmp $225A.w,X		; DD 5A 22
	jsl $A92722.l		; 22 22 27 A9
	sbc ($36.b,S),Y		; F3 36
	cmp $6BB7.w,X		; DD B7 6B
	jmp.w [$4D0F]		; DC 0F 4D
.ACCU 16
.INDEX 16
	rep #$B1		; C2 B1
	cpy $9DFC.w		; CC FC 9D
	rol $C6AB.w,X		; 3E AB C6
	mvp $44,$44		; 44 44 44
	mvp $E5,$E1		; 44 E1 E5
	.db $62, $7A, $5B		; 62 7A 5B
	sta $A3AF.w		; 8D AF A3
	phb		; 8B
	lda ($EF.b)		; B2 EF
	adc ($3D.b),Y		; 71 3D
	bit $456E.w		; 2C 6E 45
	jmp.w [$44D4]		; DC D4 44
	mvp $4A,$44		; 44 44 4A
	rol $60E4.w		; 2E E4 60
	sta [$0F.b],Y		; 97 0F
	ldy $F1.b,X		; B4 F1
	tda		; 7B
	lsr $E2E7.w		; 4E E7 E2
	adc $990B.w,X		; 7D 0B 99
	cmp [$73.b],Y		; D7 73
	adc $22021A.l		; 6F 1A 02 22
	jsl $820120.l		; 22 20 01 82
	cmp [$FF.b],Y		; D7 FF
	adc $E47F.w,X		; 7D 7F E4
	cmp $B807FF.l,X		; DF FF 07 B8
	xce		; FB
	sbc $F3.b,X		; F5 F3
	cpy #$1530.w		; C0 30 15
	php		; 08
	dey		; 88
	sta ($65.b),Y		; 91 65
	cmp $F85933.l		; CF 33 59 F8
	sbc ($B9.b),Y		; F1 B9
	tas		; 1B
	dec $8AC0.w,X		; DE C0 8A
	pea $4404.w		; F4 04 44
	phb		; 8B
	bcs  99.b		; B0 63
	ror $653D.w,X		; 7E 3D 65
	jmp ($2DF2.w,X)		; 7C F2 2D
	ldy $44.b		; A4 44
	sty $0080.w		; 8C 80 00
	brk $A5.b		; 00 A5
	brk $29.b		; 00 29
	ora ($AD.b,X)		; 01 AD
	ora ($52.b,X)		; 01 52
	cop $D6.b		; 02 D6
	cop $7B.b		; 02 7B
	ora $86.b,S		; 03 86
	plp		; 28
	rol A		; 2A
	and $55F0.w,X		; 3D F0 55
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	cpx #$2103.w		; E0 03 21
	plp		; 28
	and ($40.b,X)		; 21 40
	dex		; CA
	adc ($B0.b,X)		; 61 B0
	adc ($D0.b)		; 72 D0
	.db $42, $CA		; 42 CA
	adc ($74.b,X)		; 61 74
	ror A		; 6A
	cmp $352A51.l		; CF 51 2A 35
	ldx $28.b		; A6 28
	adc $20.b		; 65 20
	and $18.b,S		; 23 18
	cmp [$30.b]		; C7 30
	rol A		; 2A
	and $55F0.w,X		; 3D F0 55
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

	and $18.b,S		; 23 18
	cmp [$30.b]		; C7 30
	rol A		; 2A
	and $55F0.w,X		; 3D F0 55
	bit $6E.b		; 24 6E
	lda $00.b		; A5 00
	and #$8C01.w		; 29 01 8C
	ora ($EF.b,X)		; 01 EF
	ora $52.b		; 05 52
	asl A		; 0A
	dec $12.b,X		; D6 12
	and $9C1B.w,Y		; 39 1B 9C
	and [$BD.b]		; 27 BD
	eor $DE.b,S		; 43 DE
	eor $247FFF.l,X		; 5F FF 7F 24
	ror $6E24.w		; 6E 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 027FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 027FFF. Skipping.
.ENDS
