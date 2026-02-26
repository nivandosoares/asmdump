.BANK 2 SLOT 0
.ORG $0000

.SECTION "Bank2" FORCE

	lda $00AF00.l		; AF 00 AF 00
	lda $00AF00.l		; AF 00 AF 00
	lda $C300.w,Y		; B9 00 C3
	brk $D2.b		; 00 D2
	brk $E1.b		; 00 E1
	brk $EB.b		; 00 EB
	brk $F5.b		; 00 F5
	brk $04.b		; 00 04
	ora ($0E.b,X)		; 01 0E
	ora ($1D.b,X)		; 01 1D
	ora ($2C.b,X)		; 01 2C
	ora ($3B.b,X)		; 01 3B
	ora ($4A.b,X)		; 01 4A
	ora ($59.b,X)		; 01 59
	ora ($68.b,X)		; 01 68
	ora ($77.b,X)		; 01 77
	ora ($86.b,X)		; 01 86
	ora ($90.b,X)		; 01 90
	ora ($9A.b,X)		; 01 9A
	ora ($A4.b,X)		; 01 A4
	ora ($A9.b,X)		; 01 A9
	ora ($A8.b,X)		; 01 A8
	ora ($A7.b,X)		; 01 A7
	ora ($A6.b,X)		; 01 A6
	ora ($A5.b,X)		; 01 A5
	ora ($A3.b,X)		; 01 A3
	ora ($A2.b,X)		; 01 A2
	ora ($A1.b,X)		; 01 A1
	ora ($9F.b,X)		; 01 9F
	ora ($9D.b,X)		; 01 9D
	ora ($9B.b,X)		; 01 9B
	ora ($99.b,X)		; 01 99
	ora ($96.b,X)		; 01 96
	ora ($93.b,X)		; 01 93
	ora ($91.b,X)		; 01 91
	ora ($8E.b,X)		; 01 8E
	ora ($8B.b,X)		; 01 8B
	ora ($86.b,X)		; 01 86
	ora ($81.b,X)		; 01 81
	ora ($7C.b,X)		; 01 7C
	ora ($77.b,X)		; 01 77
	ora ($6D.b,X)		; 01 6D
	ora ($63.b,X)		; 01 63
	ora ($59.b,X)		; 01 59
	ora ($4F.b,X)		; 01 4F
	ora ($40.b,X)		; 01 40
	ora ($31.b,X)		; 01 31
	ora ($22.b,X)		; 01 22
	ora ($13.b,X)		; 01 13
	ora ($04.b,X)		; 01 04
	ora ($F0.b,X)		; 01 F0
	brk $DC.b		; 00 DC
	brk $C8.b		; 00 C8
	brk $B4.b		; 00 B4
	brk $A0.b		; 00 A0
	brk $8C.b		; 00 8C
	brk $78.b		; 00 78
	brk $64.b		; 00 64
	brk $50.b		; 00 50
	brk $46.b		; 00 46
	brk $3C.b		; 00 3C
	brk $32.b		; 00 32
	brk $28.b		; 00 28
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	plp		; 28
	jsr ($DC21.w,X)		; FC 21 DC
	asl $1194.w,X		; 1E 94 11
	and $0000.w,X		; 3D 00 00
	asl $0080.w,X		; 1E 80 00
	and ($00.b)		; 32 00
	asl $1400.w,X		; 1E 00 14
	brk $00.b		; 00 00
	tsb $0080.w		; 0C 80 00
	ora $000000.l		; 0F 00 00 00
	ldx #$F680.w		; A2 80 F6
	eor $803904.l		; 4F 04 39 80
	bit $2376.w		; 2C 76 23
	brk $00.b		; 00 00
	jmp.w [$D400]		; DC 00 D4
	brk $DC.b		; 00 DC
	brk $DC.b		; 00 DC
	brk $E4.b		; 00 E4
	brk $E4.b		; 00 E4
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $CD.b		; 00 CD
	brk $B5.b		; 00 B5
	brk $CD.b		; 00 CD
	brk $B5.b		; 00 B5
	brk $CD.b		; 00 CD
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	cop $72.b		; 02 72
	ora ($A0.b,X)		; 01 A0
	brk $F3.b		; 00 F3
	brk $CC.b		; 00 CC
	brk $99.b		; 00 99
	brk $69.b		; 00 69
	brk $A1.b		; 00 A1
	brk $40.b		; 00 40
	brk $A1.b		; 00 A1
	brk $54.b		; 00 54
	brk $CF.b		; 00 CF
	brk $B7.b		; 00 B7
	and $2DB6.w		; 2D B6 2D
	lda $2D.b,X		; B5 2D
	ldx $2D.b,Y		; B6 2D
	clv		; B8
	and $2DB9.w		; 2D B9 2D
	clv		; B8
	and $2DBA.w		; 2D BA 2D
	clv		; B8
	and $2DBB.w		; 2D BB 2D
	plx		; FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $FA.b		; 00 FA
	brk $0E.b		; 00 0E
	ora ($18.b,X)		; 01 18
	ora ($18.b,X)		; 01 18
	ora ($22.b,X)		; 01 22
	ora ($2C.b,X)		; 01 2C
	ora ($2F.b,X)		; 01 2F
	ora ($32.b,X)		; 01 32
	ora ($35.b,X)		; 01 35
	ora ($38.b,X)		; 01 38
	ora ($3B.b,X)		; 01 3B
	ora ($3E.b,X)		; 01 3E
	ora ($41.b,X)		; 01 41
	ora ($44.b,X)		; 01 44
	ora ($47.b,X)		; 01 47
	ora ($4A.b,X)		; 01 4A
	ora ($4D.b,X)		; 01 4D
	ora ($50.b,X)		; 01 50
	ora ($53.b,X)		; 01 53
	ora ($56.b,X)		; 01 56
	ora ($59.b,X)		; 01 59
	ora ($5C.b,X)		; 01 5C
	ora ($5F.b,X)		; 01 5F
	ora ($62.b,X)		; 01 62
	ora ($65.b,X)		; 01 65
	ora ($68.b,X)		; 01 68
	ora ($6D.b,X)		; 01 6D
	ora ($6D.b,X)		; 01 6D
	ora ($71.b,X)		; 01 71
	ora ($71.b,X)		; 01 71
	ora ($71.b,X)		; 01 71
	ora ($71.b,X)		; 01 71
	ora ($71.b,X)		; 01 71
	ora ($6D.b,X)		; 01 6D
	ora ($6D.b,X)		; 01 6D
	ora ($68.b,X)		; 01 68
	ora ($68.b,X)		; 01 68
	ora ($63.b,X)		; 01 63
	ora ($5E.b,X)		; 01 5E
	ora ($54.b,X)		; 01 54
	ora ($4A.b,X)		; 01 4A
	ora ($40.b,X)		; 01 40
	ora ($36.b,X)		; 01 36
	ora ($2C.b,X)		; 01 2C
	ora ($22.b,X)		; 01 22
	ora ($18.b,X)		; 01 18
	ora ($04.b,X)		; 01 04
	ora ($F0.b,X)		; 01 F0
	brk $DC.b		; 00 DC
	brk $C8.b		; 00 C8
	brk $B4.b		; 00 B4
	brk $A0.b		; 00 A0
	brk $8C.b		; 00 8C
	brk $78.b		; 00 78
	brk $64.b		; 00 64
	brk $50.b		; 00 50
	brk $46.b		; 00 46
	brk $3C.b		; 00 3C
	brk $32.b		; 00 32
	brk $28.b		; 00 28
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	plp		; 28
	jmp ($4C20.w)		; 6C 20 4C
	ora $0FA0.w,X		; 1D A0 0F
	eor ($00.b,X)		; 41 00
	inc $001B.w		; EE 1B 00
	ora ($1E.b,X)		; 01 1E
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $00.b		; 00 00
	tsb $0080.w		; 0C 80 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	cpx #$E0C4.w		; E0 C4 E0
	adc ($50.b,S),Y		; 73 50
	eor $903A80.l		; 4F 80 3A 90
	and $2400.w		; 2D 00 24
	pei ($00.b)		; D4 00
	cpy $00.b		; C4 00
	cpy $00.b		; C4 00
	pei ($00.b)		; D4 00
	pei ($00.b)		; D4 00
	cpx $00.b		; E4 00
	cpx $00.b		; E4 00
	stz $9000.w		; 9C 00 90
	brk $A8.b		; 00 A8
	brk $90.b		; 00 90
	brk $A8.b		; 00 A8
	brk $90.b		; 00 90
	brk $A8.b		; 00 A8
	brk $BC.b		; 00 BC
	cop $7C.b		; 02 7C
	ora ($BE.b,X)		; 01 BE
	brk $F3.b		; 00 F3
	brk $E6.b		; 00 E6
	brk $CC.b		; 00 CC
	brk $59.b		; 00 59
	brk $A4.b		; 00 A4
	brk $81.b		; 00 81
	brk $A4.b		; 00 A4
	brk $64.b		; 00 64
	brk $CF.b		; 00 CF
	brk $C5.b		; 00 C5
	and #$29C4.w		; 29 C4 29
	cmp $29.b,S		; C3 29
	cpy $29.b		; C4 29
	cmp $29.b,S		; C3 29
	dec $29.b		; C6 29
	cmp $29.b,S		; C3 29
	cmp [$29.b]		; C7 29
	cmp $29.b,S		; C3 29
	iny		; C8
	and #$010E.w		; 29 0E 01
	asl $0E01.w		; 0E 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($0E.b,X)		; 01 0E
	ora ($13.b,X)		; 01 13
	ora ($18.b,X)		; 01 18
	ora ($1D.b,X)		; 01 1D
	ora ($22.b,X)		; 01 22
	ora ($27.b,X)		; 01 27
	ora ($2C.b,X)		; 01 2C
	ora ($2F.b,X)		; 01 2F
	ora ($32.b,X)		; 01 32
	ora ($35.b,X)		; 01 35
	ora ($36.b,X)		; 01 36
	ora ($36.b,X)		; 01 36
	ora ($3B.b,X)		; 01 3B
	ora ($40.b,X)		; 01 40
	ora ($45.b,X)		; 01 45
	ora ($4A.b,X)		; 01 4A
	ora ($4F.b,X)		; 01 4F
	ora ($54.b,X)		; 01 54
	ora ($5E.b,X)		; 01 5E
	ora ($72.b,X)		; 01 72
	ora ($81.b,X)		; 01 81
	ora ($90.b,X)		; 01 90
	ora ($9A.b,X)		; 01 9A
	ora ($A4.b,X)		; 01 A4
	ora ($A8.b,X)		; 01 A8
	ora ($AA.b,X)		; 01 AA
	ora ($AC.b,X)		; 01 AC
	ora ($AC.b,X)		; 01 AC
	ora ($AB.b,X)		; 01 AB
	ora ($A9.b,X)		; 01 A9
	ora ($A4.b,X)		; 01 A4
	ora ($9A.b,X)		; 01 9A
	ora ($90.b,X)		; 01 90
	ora ($8B.b,X)		; 01 8B
	ora ($86.b,X)		; 01 86
	ora ($81.b,X)		; 01 81
	ora ($7C.b,X)		; 01 7C
	ora ($77.b,X)		; 01 77
	ora ($72.b,X)		; 01 72
	ora ($68.b,X)		; 01 68
	ora ($5E.b,X)		; 01 5E
	ora ($54.b,X)		; 01 54
	ora ($4A.b,X)		; 01 4A
	ora ($45.b,X)		; 01 45
	ora ($36.b,X)		; 01 36
	ora ($27.b,X)		; 01 27
	ora ($18.b,X)		; 01 18
	ora ($04.b,X)		; 01 04
	ora ($F0.b,X)		; 01 F0
	brk $DC.b		; 00 DC
	brk $C8.b		; 00 C8
	brk $B4.b		; 00 B4
	brk $A0.b		; 00 A0
	brk $8C.b		; 00 8C
	brk $78.b		; 00 78
	brk $64.b		; 00 64
	brk $50.b		; 00 50
	brk $46.b		; 00 46
	brk $3C.b		; 00 3C
	brk $32.b		; 00 32
	brk $28.b		; 00 28
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	plp		; 28
	bit $21.b,X		; 34 21
	trb $1E.b		; 14 1E
	sed		; F8
	ora ($3C.b),Y		; 11 3C
	brk $37.b		; 00 37
	trb $0000.w		; 1C 00 00
	plp		; 28
	brk $1E.b		; 00 1E
	brk $14.b		; 00 14
	brk $00.b		; 00 00
	tsb $0080.w		; 0C 80 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	and $76.b,X		; 35 76
	iny		; C8
	eor $39D3.w		; 4D D3 39
	phb		; 8B
	and $22CC.w		; 2D CC 22
	brk $00.b		; 00 00
	cpx #$D800.w		; E0 00 D8
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E8.b		; 00 E8
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $A8.b		; 00 A8
	brk $B4.b		; 00 B4
	brk $9C.b		; 00 9C
	brk $B4.b		; 00 B4
	brk $9C.b		; 00 9C
	brk $B4.b		; 00 B4
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $68.b,S		; 03 68
	ora ($AD.b,X)		; 01 AD
	brk $F3.b		; 00 F3
	brk $CC.b		; 00 CC
	brk $99.b		; 00 99
	brk $98.b		; 00 98
	brk $9A.b		; 00 9A
	brk $29.b		; 00 29
	brk $9A.b		; 00 9A
	brk $60.b		; 00 60
	brk $E9.b		; 00 E9
	brk $B6.b		; 00 B6
	and #$29B5.w		; 29 B5 29
	ldy $29.b,X		; B4 29
	lda $29.b,X		; B5 29
	lda [$29.b],Y		; B7 29
	clv		; B8
	and #$29B7.w		; 29 B7 29
	lda $B729.w,Y		; B9 29 B7
	and #$29BA.w		; 29 BA 29
	brk $80.b		; 00 80
	cop $81.b		; 02 81
	tsb $82.b		; 04 82
	bcc -128.b		; 90 80
	sta ($81.b)		; 92 81
	sty $82.b,X		; 94 82
	ora $000E00.l		; 0F 00 0E 00
	asl $0D00.w		; 0E 00 0D
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $1E.b		; 00 1E
	brk $1C.b		; 00 1C
	brk $1A.b		; 00 1A
	brk $19.b		; 00 19
	brk $18.b		; 00 18
	brk $16.b		; 00 16
	brk $15.b		; 00 15
	brk $14.b		; 00 14
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $12.b		; 00 12
	brk $11.b		; 00 11
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $15.b		; 00 15
	brk $14.b		; 00 14
	brk $13.b		; 00 13
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $11.b		; 00 11
	brk $11.b		; 00 11
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	asl A		; 0A
	phd		; 0B
	tsb $0E0C.w		; 0C 0C 0E
	bpl  18.b		; 10 12
	trb $16.b		; 14 16
	ora [$18.b],Y		; 17 18
	ora $1E1B.w,Y		; 19 1B 1E
	jsr $3232.w		; 20 32 32
	and ($32.b)		; 32 32
	bit $463C.w,X		; 3C 3C 46
	bvc 100.b		; 50 64
	sei		; 78
	sty $AAA0.w		; 8C A0 AA
	ldy $BE.b,X		; B4 BE
	iny		; C8
	tsb $05.b		; 04 05
	asl $07.b		; 06 07
	php		; 08
	asl A		; 0A
	phd		; 0B
	ora $1210.w		; 0D 10 12
	ora $17.b,X		; 15 17
	inc A		; 1A
	trb $201F.w		; 1C 1F 20
	clv		; B8
	brk $7A.b		; 00 7A
	brk $5C.b		; 00 5C
	brk $49.b		; 00 49
	brk $3D.b		; 00 3D
	brk $34.b		; 00 34
	brk $2E.b		; 00 2E
	brk $28.b		; 00 28
	brk $24.b		; 00 24
	brk $21.b		; 00 21
	brk $1E.b		; 00 1E
	brk $1C.b		; 00 1C
	brk $1A.b		; 00 1A
	brk $18.b		; 00 18
	brk $17.b		; 00 17
	brk $15.b		; 00 15
	brk $14.b		; 00 14
	brk $13.b		; 00 13
	brk $12.b		; 00 12
	brk $11.b		; 00 11
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $08.b		; 00 08
	brk $70.b		; 00 70
	ora ($F5.b,X)		; 01 F5
	brk $B8.b		; 00 B8
	brk $93.b		; 00 93
	brk $7A.b		; 00 7A
	brk $69.b		; 00 69
	brk $5C.b		; 00 5C
	brk $51.b		; 00 51
	brk $49.b		; 00 49
	brk $42.b		; 00 42
	brk $3D.b		; 00 3D
	brk $38.b		; 00 38
	brk $34.b		; 00 34
	brk $31.b		; 00 31
	brk $2E.b		; 00 2E
	brk $2B.b		; 00 2B
	brk $28.b		; 00 28
	brk $26.b		; 00 26
	brk $24.b		; 00 24
	brk $23.b		; 00 23
	brk $21.b		; 00 21
	brk $20.b		; 00 20
	brk $1E.b		; 00 1E
	brk $1D.b		; 00 1D
	brk $1C.b		; 00 1C
	brk $1B.b		; 00 1B
	brk $1A.b		; 00 1A
	brk $19.b		; 00 19
	brk $18.b		; 00 18
	brk $17.b		; 00 17
	brk $17.b		; 00 17
	brk $16.b		; 00 16
	brk $15.b		; 00 15
	brk $15.b		; 00 15
	brk $14.b		; 00 14
	brk $13.b		; 00 13
	brk $13.b		; 00 13
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $11.b		; 00 11
	brk $20.b		; 00 20
	cop $6A.b		; 02 6A
	ora ($10.b,X)		; 01 10
	ora ($D9.b,X)		; 01 D9
	brk $B5.b		; 00 B5
	brk $9B.b		; 00 9B
	brk $88.b		; 00 88
	brk $78.b		; 00 78
	brk $6C.b		; 00 6C
	brk $62.b		; 00 62
	brk $5A.b		; 00 5A
	brk $53.b		; 00 53
	brk $4D.b		; 00 4D
	brk $48.b		; 00 48
	brk $44.b		; 00 44
	brk $40.b		; 00 40
	brk $3C.b		; 00 3C
	brk $39.b		; 00 39
	brk $36.b		; 00 36
	brk $33.b		; 00 33
	brk $31.b		; 00 31
	brk $2F.b		; 00 2F
	brk $2D.b		; 00 2D
	brk $2B.b		; 00 2B
	brk $29.b		; 00 29
	brk $28.b		; 00 28
	brk $26.b		; 00 26
	brk $25.b		; 00 25
	brk $24.b		; 00 24
	brk $23.b		; 00 23
	brk $22.b		; 00 22
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $1D.b		; 00 1D
	brk $1C.b		; 00 1C
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1A.b		; 00 1A
	brk $42.b		; 00 42
	and $32383C.l,X		; 3F 3C 38 32
	pld		; 2B
	bit $1E.b		; 24 1E
	inc A		; 1A
	ora [$15.b],Y		; 17 15
	trb $14.b		; 14 14
	trb $14.b		; 14 14
	trb $0E.b		; 14 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $23.b		; 00 23
	brk $23.b		; 00 23
	brk $27.b		; 00 27
	brk $39.b		; 00 39
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $1C.b		; 00 1C
	brk $13.b		; 00 13
	brk $28.b		; 00 28
	brk $23.b		; 00 23
	brk $0E.b		; 00 0E
	brk $17.b		; 00 17
	brk $15.b		; 00 15
	brk $0E.b		; 00 0E
	brk $23.b		; 00 23
	brk $23.b		; 00 23
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0A.b		; 00 0A
	brk $23.b		; 00 23
	brk $1C.b		; 00 1C
	brk $2A.b		; 00 2A
	brk $4E.b		; 00 4E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $08.b		; 00 08
	brk $1C.b		; 00 1C
	brk $23.b		; 00 23
	brk $2A.b		; 00 2A
	brk $28.b		; 00 28
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0A.b		; 00 0A
	brk $2B.b		; 00 2B
	brk $1C.b		; 00 1C
	brk $28.b		; 00 28
	brk $38.b		; 00 38
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0A.b		; 00 0A
	brk $1C.b		; 00 1C
	brk $23.b		; 00 23
	brk $2A.b		; 00 2A
	brk $4E.b		; 00 4E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0A.b		; 00 0A
	brk $1A.b		; 00 1A
	brk $1A.b		; 00 1A
	brk $2A.b		; 00 2A
	brk $28.b		; 00 28
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	.db $00		; Opcode overrunning section
L01070A:
	lda $0F77.w
	beq L010719.b
	rts

L010710:
.ACCU 16
	rep #$20
	lda #$00FF.w
	sta $10B3.w
	rts

L010719:
	ldx $11B9.w
	beq L010710.b
	stz $0C.b
.ACCU 8
	sep #$20
	lda $124C.w,X
	sta $14.b
	lda $1239.w,X
	sta $15.b
	lda $123A.w,X
	beq L010741.b
	cmp #$FF.b
	bne L010710.b
.ACCU 16
	rep #$20
	inc $0C.b
	lda #$0000.w
	sec		; Set carry
	sbc $14.b
	sta $14.b
L010741:
.ACCU 16
	rep #$20
	lda $11CD.w
	lsr A
	sta $10.b
	lda $11CD.w,X
	lsr A
	sta $12.b
	cpx #$000C.w
	bcs L01075B.b
	lda $10.b
	sec		; Set carry
	sbc $12.b
	bra L010760.b
L01075B:
	lda $12.b
	clc		; Clear carry
	adc $10.b
L010760:
	ldy $0C.b
	beq L010768.b
	eor #$FFFF.w
	inc A
L010768:
	sta $16.b
	cmp #$0000.w
	bpl L010773.b
	eor #$FFFF.w
	inc A
L010773:
	nop
	lsr A
	lsr A
	lsr A
	cmp #$0400.w
	bcc L01077F.b
	lda #$0400.w
L01077F:
	sta $0E.b
	lda #$0F00.w
	sec		; Set carry
	sbc $14.b
	bcc L010710.b
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	lda $0E.b
	clc		; Clear carry
	adc #$0100.w
	lsr A
	lsr A
	lsr A
	lsr A
	jsr L0133C1.w
	sta $10B3.w
	ldx $0E.b
	lda $14.b
	lsr A
	lsr A
	lsr A
	lsr A
	jsr L013321.w
	ldy $16.b
	bpl L0107B1.b
	eor #$FFFF.w
	inc A
L0107B1:
	clc		; Clear carry
	adc #$0500.w
	sta $10C3.w
	lda $0994.w
	bne L010810.b
	ldx $11B9.w
	lda $11DF.w,X
	sec		; Set carry
	sbc $11DF.w
	sta $16.b
	bpl L0107CF.b
	eor #$FFFF.w
	inc A
L0107CF:
	sta $0E.b
	lsr A
	lsr A
	sta $0C.b
	lda $14.b
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	cmp $0C.b
	bcs L0107F9.b
	ldx #$0060.w
	jsr L0133C1.w
	tax
	lda $0C.b
	jsr L0133EF.w
	ldy #$0060.w
	ldx $16.b
	bpl L0107FF.b
	tay
	lda #$0060.w
	bra L0107FF.b
L0107F9:
	lda #$0060.w
	ldy #$0060.w
L0107FF:
.ACCU 8
	sep #$20
	ldx #$0003.w
	dec $0F70.w
	jsl L00151C.l
	inc $0F70.w
.ACCU 16
	rep #$20
L010810:
	rts

L010811:
	lda $1CE4.w
	beq L010825.b
	inc A
	sta $1CE4.w
	cmp #$0004.w
	bne L01082A.b
	lda #$0001.w
	sta $1CE4.w
L010825:
	lda $1CE2.w
	bne L01082B.b
L01082A:
	rts

L01082B:
	dec A
	asl A
	tay
L01082E:
	lda $13BC.w,Y
	tax
	lda #$0000.w
	sta $7E7D00.l,X
	jsl L00042C.l
	and #$03FE.w
	cmp #$0300.w
	bcs L01086E.b
	sta $13BC.w,Y
	tax
	lda $1CE4.w
	beq L01085F.b
	jsl L00042C.l
	and #$0003.w
	clc		; Clear carry
	adc #$32F9.w
	sta $7E7D00.l,X
	bra L01086E.b
L01085F:
	jsl L00042C.l
	and #$0007.w
	clc		; Clear carry
	adc #$32F1.w
	sta $7E7D00.l,X
L01086E:
	dey
	dey
	bpl L01082E.b
	lda #$7E7D.w
	sta $0D.b
	lda #$7D00.w
	sta $0C.b
	lda #$0300.w
	ldx #$0060.w
	jsl L0006ED.l
	rts

	asl $030A.w,X		; 1E 0A 03
	.db $00		; Opcode overrunning section
L01088B:
	jsl L00042C.l
	and #$01FF.w
	cmp #$0060.w
	bcc L0108E7.b
	cmp #$01E0.w
	bcs L0108E7.b
	sta $137A.w
	lda #$32EC.w
	sta $1376.w
	lda #$0001.w
	sta $1374.w
	bra L0108B2.b
L0108AD:
	dec $1378.w
	bne L0108E7.b
L0108B2:
	inc $1376.w
.INDEX 8
	sep #$10
	ldx $54.b
	lda $137A.w
	sta $0602.w,X
	lda $1376.w
	sta $0604.w,X
.ACCU 8
	sep #$20
	lda #$FF.b
	sta $0600.w,X
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
.ACCU 16
.INDEX 16
	rep #$30
	ldx $1374.w
	lda $028886.l,X
	and #$00FF.w
	beq L0108E8.b
	sta $1378.w
	inx
	stx $1374.w
L0108E7:
	rts

L0108E8:
	sta $1374.w
	sta $1378.w
	rts

L0108EF:
	lda $11F1.w
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$1000.w
	clc		; Clear carry
	adc #$0008.w
	sta $072C.w
	lda $1C76.w
	beq L010916.b
	lda $11F3.w
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$1200.w
	clc		; Clear carry
	adc #$0008.w
	sta $0730.w
L010916:
	lda #$E100.w
	ldx $12A9.w
	beq L01092C.b
	lda $11F5.w
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$1000.w
	clc		; Clear carry
	adc #$0008.w
L01092C:
	sta $0734.w
	rts

L010930:
	lda $0964.w
	and #$0020.w
	bne L01093B.b
	jmp L0109CD.w
L01093B:
	lda $12AB.w
	cmp #$0001.w
	beq L010946.b
	jmp L0109CA.w
L010946:
	lda $11F1.w
	sec		; Set carry
	sbc $11F5.w
	bpl L010964.b
	pha
	lda #$0019.w
	jsl L0021C6.l
	pla
	lsr A
	lsr A
	lsr A
	and #$FFFC.w
	clc		; Clear carry
	adc #$0014.w
	bra L0109CD.b
L010964:
	lda $11CD.w
	sbc #$4100.w
	bcc L0109C7.b
	lda $0F77.w
	bne L010981.b
	jsl L00042C.l
	cmp #$6000.w
	bcs L010981.b
	lda #$001F.w
	jsl L002212.l
L010981:
	lda #$001A.w
	jsl L002212.l
	jsr L011B84.w
.ACCU 8
.INDEX 8
	sep #$30
	stz $12B9.w
	lda $11CE.w
	cmp #$64.b
	bcc L0109A5.b
	sbc #$64.b
	inc $12B9.w
	cmp #$64.b
	bcc L0109A5.b
	sbc #$64.b
	inc $12B9.w
L0109A5:
	tax
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	sta $12BA.w
	lda $0082BE.l,X
	and #$0F.b
	sta $12BB.w
.ACCU 16
.INDEX 16
	rep #$30
	jsr L012171.w
	jsr L011D79.w
	jsr L0121E7.w
	bra L0109CA.b
L0109C7:
	stz $12AB.w
L0109CA:
	lda #$0004.w
L0109CD:
	cmp $1E22.w
	beq L0109FC.b
	sta $1E22.w
	tay
.INDEX 8
	sep #$10
	ldx $54.b
	lda #$FFFE.w
	sta $0600.w,X
	lda #$0022.w
	sta $0602.w,X
	lda $145A.w,Y
	sta $0604.w,X
	lda $145C.w,Y
	sta $0606.w,X
.ACCU 8
	sep #$20
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
.ACCU 16
.INDEX 16
	rep #$30
L0109FC:
	rtl

L0109FD:
	lda $118F.w
	beq L010A05.b
	jmp L010AB4.w
L010A05:
	lda $12A7.w
	cmp $0964.w
	bne L010A10.b
	jmp L010AB4.w
L010A10:
	lda $1CB0.w
	bne L010A45.b
	lda $0996.w
	beq L010A45.b
	lda $12AB.w
	cmp #$0003.w
	bcs L010A38.b
	lda $11CD.w
	pha
	jsr L012266.w
	ldy #$0000.w
	jsr L012298.w
	pla
	cmp $11CD.w
	bcc L010A3D.b
	sta $11CD.w
L010A38:
	lda $1C92.w
	bra L010A50.b
L010A3D:
	sta $11CD.w
	lda $1C94.w
	bra L010A50.b
L010A45:
	lda $12A7.w
	and #$0007.w
	asl A
	tax
	lda $11BD.w,X
L010A50:
	ldy $1191.w
	beq L010A66.b
	cpy #$0006.w
	beq L010A66.b
	lda $1C94.w
	eor #$FFFF.w
	and $11BD.w,X
	ora $1C92.w
L010A66:
	sta $137E.w
	bit $1C96.w
	beq L010A8A.b
	lda #$0018.w
	jsl L0021C6.l
	lda #$7000.w
	sta $10AD.w
	lda #$0002.w
	sta $108D.w
.ACCU 8
	sep #$20
	lda #$01.b
	sta $1065.w
.ACCU 16
	rep #$20
L010A8A:
	jsr L01397E.w
	jsr L013CD9.w
	lda $1191.w
	bne L010AC5.b
	lda $12AB.w
	cmp #$0003.w
	bcc L010AC5.b
	lda $11DF.w
	cmp $12AD.w
	beq L010B1C.b
	bcs L010AB5.b
	adc #$0004.w
	cmp $12AD.w
	bcs L010ABD.b
	sta $11DF.w
	bra L010B1C.b
L010AB4:
	rts

L010AB5:
	sbc #$0004.w
	cmp $12AD.w
	bcs L010AC0.b
L010ABD:
	lda $12AD.w
L010AC0:
	sta $11DF.w
	bra L010B1C.b
L010AC5:
	lda $0996.w
	beq L010ACD.b
	jmp L010B77.w
L010ACD:
	lda $D0.b
	cmp #$8000.w
	rol A
	cmp #$8000.w
	rol A
	xba
	jsr L013261.w
	tax
	lda $11CE.w
	and #$00FF.w
	jsr L01339B.w
	cmp #$8000.w
	ror A
	xba
	sta $00.b
	and #$FF00.w
	clc		; Clear carry
	adc $1392.w
	sta $1392.w
	php
	lda $00.b
	and #$00FF.w
	cmp #$0080.w
	bcc L010B04.b
	ora #$FF00.w
L010B04:
	plp
	adc $11DF.w
	bpl L010B0F.b
	lda #$0000.w
	bra L010B17.b
L010B0F:
	cmp $1CC6.w
	bcc L010B17.b
	lda $1CC6.w
L010B17:
	sta $11DF.w
	bra L010B1C.b
L010B1C:
	lda $1396.w
	beq L010B72.b
	lda $11DF.w
	cmp $19FE.w
	bcc L010B35.b
	lda $1CC6.w
	clc		; Clear carry
	sbc $19FE.w
	cmp $11DF.w
	bcs L010B77.b
L010B35:
	jmp L010D10.w
L010B38:
	lda $11DF.w
	cmp $19FE.w
	bcc L010B35.b
	lda $1CC6.w
	sec		; Set carry
	sbc #$0030.w
	cmp $11DF.w
	bcs L010B77.b
	lda $1394.w
	bne L010B77.b
	lda #$0006.w
	sta $1191.w
	lda $1193.w
	bne L010B65.b
	inc $12D8.w
	inc $1193.w
	dec $1C86.w
L010B65:
	lda $D0.b
	clc		; Clear carry
	adc $D2.b
	sta $D0.b
	stz $D2.b
	stz $D4.b
	bra L010B77.b
L010B72:
	lda $1CEA.w
	bmi L010B38.b
L010B77:
	lda $11F1.w
	cmp $1CE8.w
	bcc L010B82.b
	sta $11A7.w
L010B82:
	lda $1191.w
	cmp #$0006.w
	bne L010BC9.b
	lda $D0.b
	cmp #$1EFF.w
	bmi L010BC6.b
	lda $11B1.w
	clc		; Clear carry
	adc #$000C.w
	sta $11B1.w
	clc		; Clear carry
	adc $11AF.w
	sta $11AF.w
	cmp #$BDD8.w
	bcc L010BB0.b
	lda #$0004.w
	sta $118F.w
	jsr L0119AD.w
L010BB0:
	lda $11AF.w
	xba
	and #$00FF.w
	cmp #$007F.w
	bcc L010BBF.b
	lda #$007F.w
L010BBF:
	sec		; Set carry
	sbc #$0038.w
	sta $1E1A.w
L010BC6:
	jmp L010EFB.w
L010BC9:
	lda $11CD.w
	bne L010BEA.b
	ldx $11A7.w
	beq L010BED.b
	lda $1CC6.w
	sec		; Set carry
	sbc #$00C4.w
	cmp $11DF.w
	bcs L010BED.b
	bra L010BE1.b
L010BE1:
	lda #$0001.w
	sta $118F.w
L010BE7:
	jmp L010E18.w
L010BEA:
	sta $12A1.w
L010BED:
	lda $11CD.w
	lsr A
	clc		; Clear carry
	adc $1203.w
	sta $1203.w
	bcc L010BE7.b
	lda $12AB.w
	bne L010C17.b
	lda $1CC0.w
	beq L010C0A.b
	dec A
	sta $1CC0.w
	bra L010C17.b
L010C0A:
	inc $12AB.w
	lda $11F1.w
	clc		; Clear carry
	adc #$007F.w
	sta $11F5.w
L010C17:
	lda $11F1.w
	inc A
	sta $11F1.w
	lda $1CE8.w
	clc		; Clear carry
	adc #$0028.w
	cmp $11F1.w
	bcs L010C41.b
	lda #$0002.w
	sta $1191.w
	inc $1195.w
	lda $1193.w
	bne L010C41.b
	inc $1193.w
	dec $1C86.w
	inc $12E0.w
L010C41:
	lda $117D.w
	cmp #$1800.w
	bcs L010C4E.b
	lda $1396.w
	beq L010C51.b
L010C4E:
	jmp L010D69.w
L010C51:
	lda $11F1.w
	bit #$0007.w
	bne L010C8D.b
	and #$0008.w
	beq L010C68.b
	lda $11DF.w
	cmp $19FE.w
	bcc L010C74.b
	bra L010C8D.b
L010C68:
	lda $1CC6.w
	sec		; Set carry
	sbc $19FE.w
	cmp $11DF.w
	bcs L010C8D.b
L010C74:
	lda $11CD.w
	sec		; Set carry
	sbc #$0200.w
	bcs L010C80.b
	lda #$0000.w
L010C80:
	sta $11CD.w
	lda #$001E.w
	jsl L002212.l
	inc $11A5.w
L010C8D:
	bit $1CEA.w
	bpl L010C95.b
	jmp L010D69.w
L010C95:
	lda $1396.w
	beq L010C9D.b
	jmp L010D69.w
L010C9D:
	lda $11F1.w
	inc A
	and #$001F.w
	asl A
	asl A
	tax
	lda $12F2.w,X
	bne L010CAF.b
	jmp L010D69.w
L010CAF:
	cmp #$0040.w
	bcc L010CB7.b
	jmp L010D69.w
L010CB7:
	and #$001F.w
	tay
	lda $12F4.w,X
	bit #$0080.w
	bne L010CCB.b
	and #$007F.w
	asl A
	asl A
	asl A
	bra L010CD5.b
L010CCB:
	and #$007F.w
	asl A
	asl A
	asl A
	eor #$FFFF.w
	inc A
L010CD5:
	clc		; Clear carry
	adc $1CC4.w
	sta $14.b
	tya
	dec A
	cmp #$0008.w
	bcs L010CE8.b
	clc		; Clear carry
	adc $1CB4.w
	bra L010CEC.b
L010CE8:
	clc		; Clear carry
	adc #$0038.w
L010CEC:
	asl A
	tax
	lda $0285E6.l,X
	clc		; Clear carry
	adc $19FE.w
	sta $16.b
	lda $11DF.w
	sec		; Set carry
	sbc $14.b
	bpl L010D04.b
	eor #$FFFF.w
	inc A
L010D04:
	cmp $16.b
	bcs L010D69.b
	lda $028678.l,X
	beq L010D50.b
	bmi L010D1B.b
L010D10:
	jsr L0119AD.w
	lda #$0004.w
	sta $118F.w
	bra L010D69.b
L010D1B:
	lda $11A5.w
	clc		; Clear carry
	adc #$0004.w
	sta $11A5.w
	cmp #$0032.w
	bcc L010D33.b
	jsl L00042C.l
	cmp #$4000.w
	bcc L010D10.b
L010D33:
	lda $11CD.w
	sec		; Set carry
	sbc #$0400.w
	bcs L010D3F.b
	lda #$0000.w
L010D3F:
	sta $11CD.w
	cpx #$0058.w
	bne L010D62.b
	lda #$0027.w
	jsl L002212.l
	bra L010D69.b
L010D50:
	inc $11A5.w
	lda $11CD.w
	sec		; Set carry
	sbc #$0200.w
	bcs L010D5F.b
	lda #$0000.w
L010D5F:
	sta $11CD.w
L010D62:
	lda #$001E.w
	jsl L002212.l
L010D69:
	lda $11F1.w
	tay
	lsr A
	and #$FFFE.w
	tax
	lda $1CEC.w
	beq L010D7E.b
	lda $7E6000.l,X
	and #$8000.w
L010D7E:
	sta $1396.w
	lda $7E6000.l,X
	tya
	and #$0003.w
	cmp #$0001.w
	bne L010DFA.b
	tya
	clc		; Clear carry
	adc #$001F.w
	lsr A
	tax
	lda $7E6000.l,X
	beq L010DFA.b
	tay
	cmp #$4000.w
	bcs L010DF2.b
	and #$1F00.w
	bit $1CEA.w
	bmi L010DAE.b
	cmp #$0F00.w
	beq L010DFA.b
L010DAE:
	bit $1CEA.w
	bvs L010DB8.b
	cmp #$0E00.w
	beq L010DFA.b
L010DB8:
	txa
	asl A
	and #$001F.w
	asl A
	asl A
	tax
	phy
	lda $12F2.w,X
	cmp #$0009.w
	bcc L010DCE.b
	lda $1372.w
	bra L010DDC.b
L010DCE:
	tay
	lda $9249.w,Y
	sec		; Set carry
	eor #$FFFF.w
	adc $1372.w
	sta $1372.w
L010DDC:
	ply
	tya
	and #$00BF.w
	clc		; Clear carry
	adc $1CB6.w
	sta $12F4.w,X
	tya
	xba
	and #$00FF.w
	sta $12F2.w,X
	bra L010E02.b
L010DF2:
	bne L010DFA.b
	lda #$0001.w
	sta $1394.w
L010DFA:
	tya
	clc		; Clear carry
	adc #$001F.w
	jsr L011252.w
L010E02:
	bit $1CEA.w
	bmi L010E31.b
	lda $CE.b
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	clc		; Clear carry
	adc $138E.w
	sta $138E.w
L010E18:
	bit $1CEA.w
	bmi L010E31.b
	lda $D0.b
	clc		; Clear carry
	adc $D2.b
	clc		; Clear carry
	adc $138C.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	and #$01FF.w
	sta $1E18.w
L010E31:
	lda $1CEA.w
	bpl L010E43.b
	lda #$FFC8.w
	ldx $1394.w
	beq L010E48.b
	lda #$FFFB.w
	bra L010E48.b
L010E43:
	lda $138E.w
	lsr A
	lsr A
L010E48:
	adc #$0014.w
	and #$01FF.w
	sta $1E1A.w
	lda $CE.b
	jsr L013261.w
	beq L010E6F.b
	bmi L010E6F.b
.ACCU 8
.INDEX 8
	sep #$30
	ldx $11CE.w
	jsr L0133C1.w
.ACCU 16
.INDEX 16
	rep #$30
	xba
	and #$00FF.w
	clc		; Clear carry
	adc $1183.w
	sta $1183.w
L010E6F:
	lda $1183.w
	ora $117D.w
	beq L010EED.b
	lda #$000A.w
	sta $1189.w
	lda $1183.w
	sec		; Set carry
	sbc #$0017.w
	sta $1183.w
	bmi L010E95.b
	lda $117D.w
	clc		; Clear carry
	adc $1183.w
	sta $117D.w
	bra L010EED.b
L010E95:
	lda $0F77.w
	bne L010EBF.b
	lda $1183.w
	cmp #$FFE9.w
	bcs L010EBF.b
	cmp #$FFD2.w
	bcc L010EBF.b
	lda $117D.w
	cmp #$3800.w
	bcc L010EBF.b
	jsl L00042C.l
	cmp #$6000.w
	bcs L010EBF.b
	lda #$0020.w
	jsl L0021C6.l
L010EBF:
	lda $117D.w
	clc		; Clear carry
	adc $1183.w
	bcs L010EEA.b
	lda #$0000.w
	sec		; Set carry
	sbc $1183.w
	cmp #$0064.w
	bcc L010EE4.b
	lsr A
	sta $1183.w
	lda #$001D.w
	jsl L0021C6.l
	lda #$0000.w
	bra L010EEA.b
L010EE4:
	lda #$0000.w
	sta $1183.w
L010EEA:
	sta $117D.w
L010EED:
	lda $0996.w
	beq L010EFB.b
	stz $D0.b
	lda $CC.b
	asl A
	asl A
	asl A
	sta $D6.b
L010EFB:
	lda $12A1.w
	beq L010F2B.b
	jsr L011A51.w
	jsr L011C2B.w
	jsr L012171.w
	jsr L011D79.w
	lda $12AB.w
	bpl L010F15.b
	jsl L011BD0.l
L010F15:
	jsr L0121E7.w
	jsr L0127B9.w
	jsr L0125F3.w
	inc $12A3.w
	lda $12E8.w
	bne L010F34.b
	inc $12A5.w
	bra L010F34.b
L010F2B:
	jsr L012171.w
	jsr L011D79.w
	jsr L0121E7.w
L010F34:
	inc $B4.b
	inc $12A7.w
	jmp L0109FD.w
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $1E20.w		; AD 20 1E
	beq  90.b		; F0 5A
	lda #$0200.w		; A9 00 02
	cmp $1E15.w		; CD 15 1E
	bne   3.b		; D0 03
	lda #$0400.w		; A9 00 04
	sta $1E15.w		; 8D 15 1E
	lda $B6.b		; A5 B6
	eor #$0200.w		; 49 00 02
	sta $B6.b		; 85 B6
	lda $1398.w		; AD 98 13
	sta $13A4.w		; 8D A4 13
	lda $139A.w		; AD 9A 13
	sta $13A6.w		; 8D A6 13
	lda $139C.w		; AD 9C 13
	sta $13A8.w		; 8D A8 13
	lda $139E.w		; AD 9E 13
	sta $13AA.w		; 8D AA 13
	lda $13A0.w		; AD A0 13
	sta $13AC.w		; 8D AC 13
	lda $13A2.w		; AD A2 13
	sta $13AE.w		; 8D AE 13
	lda $13B0.w		; AD B0 13
	sta $13B4.w		; 8D B4 13
	lda $13B2.w		; AD B2 13
	sta $13B6.w		; 8D B6 13
	lda $13B8.w		; AD B8 13
	sta $13BA.w		; 8D BA 13
	lda $1E18.w		; AD 18 1E
	sta $1E1C.w		; 8D 1C 1E
	lda $1E1A.w		; AD 1A 1E
	sta $1E1E.w		; 8D 1E 1E
	stz $1E20.w		; 9C 20 1E
	lda $12B7.w		; AD B7 12
	bmi  39.b		; 30 27
	bne   1.b		; D0 01
	rtl		; 6B

	lda $0C.b		; A5 0C
	pha		; 48
	lda $0E.b		; A5 0E
	pha		; 48
	lda #$05E9.w		; A9 E9 05
	sta $0D.b		; 85 0D
	lda #$E910.w		; A9 10 E9
	sta $0C.b		; 85 0C
	lda #$00C0.w		; A9 C0 00
	ldx #$0020.w		; A2 20 00
	jsl L000583.l		; 22 83 85 00
	pla		; 68
	sta $0E.b		; 85 0E
	pla		; 68
	sta $0E.b		; 85 0E
	stz $12B7.w		; 9C B7 12
	rtl		; 6B

	inc $12B7.w		; EE B7 12
	bne -42.b		; D0 D6
	lda $0C.b		; A5 0C
	pha		; 48
	lda $0E.b		; A5 0E
	pha		; 48
	lda $1CCE.w		; AD CE 1C
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	lda $01836C.l,X		; BF 6C 83 01
	sta $0C.b		; 85 0C
	lda $01836E.l,X		; BF 6E 83 01
	sta $0E.b		; 85 0E
	lda #$00C0.w		; A9 C0 00
	ldx #$0010.w		; A2 10 00
	jsl L000583.l		; 22 83 85 00
	lda $1CD0.w		; AD D0 1C
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	lda $01836C.l,X		; BF 6C 83 01
	sta $0C.b		; 85 0C
	lda $01836E.l,X		; BF 6E 83 01
	sta $0E.b		; 85 0E
	lda #$00D0.w		; A9 D0 00
	ldx #$0010.w		; A2 10 00
	jsl L000583.l		; 22 83 85 00
	pla		; 68
	sta $0E.b		; 85 0E
	pla		; 68
	sta $0E.b		; 85 0E
	stz $12B7.w		; 9C B7 12
	rtl		; 6B

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $0996.w		; AD 96 09
	beq  15.b		; F0 0F
	lda $0960.w		; AD 60 09
	beq   9.b		; F0 09
	lda #$FFFF.w		; A9 FF FF
	sta $118F.w		; 8D 8F 11
	stz $0996.w		; 9C 96 09
	rtl		; 6B

	lda $118F.w		; AD 8F 11
	bne  33.b		; D0 21
	lda $0998.w		; AD 98 09
	beq  50.b		; F0 32
	and #$0001.w		; 29 01 00
	bne  24.b		; D0 18
	lda $0960.w		; AD 60 09
	cmp #$2040.w		; C9 40 20
	bne   7.b		; D0 07
	lda #$FFFF.w		; A9 FF FF
	sta $118F.w		; 8D 8F 11
	rtl		; 6B

	and #$1000.w		; 29 00 10
	beq   3.b		; F0 03
	dec $0998.w		; CE 98 09
	rtl		; 6B

	lda $0960.w		; AD 60 09
	and #$1000.w		; 29 00 10
	bne  -9.b		; D0 F7
	dec $0998.w		; CE 98 09
	bne   7.b		; D0 07
.ACCU 8
	sep #$20		; E2 20
	stz $0F76.w		; 9C 76 0F
.ACCU 16
	rep #$20		; C2 20
	rtl		; 6B

	lda $1CEA.w		; AD EA 1C
	bmi  27.b		; 30 1B
	lda $0962.w		; AD 62 09
	and #$0080.w		; 29 80 00
	beq  19.b		; F0 13
	lda $117D.w		; AD 7D 11
	bne  14.b		; D0 0E
	lda $11CD.w		; AD CD 11
	cmp #$2800.w		; C9 00 28
	bcc   6.b		; 90 06
	lda #$04C3.w		; A9 C3 04
	sta $1183.w		; 8D 83 11
	lda $0964.w		; AD 64 09
	dec A		; 3A
	and #$0007.w		; 29 07 00
	asl A		; 0A
	tax		; AA
	lda $0960.w		; AD 60 09
	sta $11BD.w,X		; 9D BD 11
	and #$1000.w		; 29 00 10
	beq  21.b		; F0 15
	lda $118F.w		; AD 8F 11
	ora $1191.w		; 0D 91 11
	bne  13.b		; D0 0D
	lda #$0003.w		; A9 03 00
	sta $0998.w		; 8D 98 09
.ACCU 8
	sep #$20		; E2 20
	inc $0F76.w		; EE 76 0F
.ACCU 16
	rep #$20		; C2 20
	rtl		; 6B

L0110B2:
	php
	phb
	phk
	plb
.ACCU 16
.INDEX 16
	rep #$30
	jsr L011551.w
	plb
	plp
	rtl

L0110BE:
	phk
	plb
	stz $30.b
	stz $34.b
	lda #$00E0.w
	sta $32.b
	sta $36.b
	lda $1C86.w
	bne L0110EE.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0047.w
	sta $00.b
	ldx #$0080.w
	ldy #$0032.w
	lda #$3000.w
	jsl L00179B.l
	bra L01114F.b
L0110EE:
	tax
	lda $118F.w
	cmp #$0007.w
	beq L01114F.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $0082BE.l,X
	and #$00FF.w
	lsr A
	lsr A
	lsr A
	lsr A
	beq L011123.b
	phx
	clc		; Clear carry
	adc #$004B.w
	sta $00.b
	ldx #$00A5.w
	ldy #$0032.w
	lda #$3000.w
	jsl L00179B.l
	plx
L011123:
	lda $0082BE.l,X
	and #$000F.w
	clc		; Clear carry
	adc #$004B.w
	sta $00.b
	ldx #$00AB.w
	ldy #$0032.w
	lda #$3000.w
	jsl L00179B.l
	lda #$004A.w
	sta $00.b
	ldx #$0080.w
	ldy #$0035.w
	lda #$3000.w
	jsl L00179B.l
L01114F:
	lda $096A.w
	bne L01114F.b
	jsr L012F48.w
	jsr L01318D.w
	jsr L01070A.w
	jsr L0108EF.w
	jsl L0015BD.l
	rtl

L011165:
	php
	phb
	phk
	plb
.ACCU 16
.INDEX 16
	rep #$30
L01116B:
	lda $1E20.w
	bne L01116B.b
	jsr L01340E.w
	jsr L013927.w
L011176:
	lda $096A.w
	bne L011176.b
	jsl L00158F.l
	lda $0998.w
	beq L0111AB.b
	stz $30.b
	stz $34.b
	lda #$00E0.w
	sta $32.b
	sta $36.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0046.w
	sta $00.b
	ldx #$0080.w
	ldy #$003C.w
	lda #$3000.w
	jsl L00179B.l
L0111AB:
	lda $11A7.w
	beq L0111DA.b
	lda $0964.w
	and #$0020.w
	beq L0111DA.b
	lda #$0048.w
	ldx $11CD.w
	beq L0111C1.b
	inc A
L0111C1:
	sta $00.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	ldx #$0080.w
	ldy #$0032.w
	lda #$3000.w
	jsl L00179B.l
L0111DA:
	jsr L012F48.w
	jsr L01318D.w
	jsr L01070A.w
	jsr L0108EF.w
	lda $1191.w
	cmp #$0004.w
	beq L011221.b
	lda $0998.w
	bne L011221.b
	jsr L010811.w
	lda $1CE2.w
	ora $1CE6.w
	bne L011221.b
	lda $1CEA.w
	bmi L011221.b
	lda $1374.w
	bne L01121E.b
	lda $11CD.w
	cmp #$2800.w
	bcc L011221.b
	jsl L00042C.l
	cmp $1CB8.w
	bcs L011221.b
	jsr L01088B.w
	bra L011221.b
L01121E:
	jsr L0108AD.w
L011221:
	jsl L010930.l
	lda #$0001.w
	sta $1E20.w
	jsr L0109FD.w
	lda $11CD.w
	cmp $12E4.w
	bcc L011239.b
	sta $12E4.w
L011239:
	lda $11CF.w
	cmp $12E6.w
	bcc L011244.b
	sta $12E6.w
L011244:
	inc $B2.b
	plb
	plp
	rtl

	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($04.b,X)		; 01 04
	tsb $06.b		; 04 06
	.db $06		; Opcode overrunning section
L011252:
.ACCU 16
.INDEX 16
	rep #$30
	sta $24.b
	and #$001F.w
.ACCU 8
.INDEX 8
	sep #$30
	asl A
	asl A
	tax
	lda $12F2.w,X
	cmp #$09.b
	bcc L01126A.b
	lda $1372.w
	bra L011277.b
L01126A:
	tay
	lda $9249.w,Y
	sec		; Set carry
	eor #$FF.b
	adc $1372.w
	sta $1372.w
L011277:
	cmp #$1D.b
	bcs L0112D6.b
.ACCU 16
.INDEX 16
	rep #$30
	lda $1CE8.w
	sec		; Set carry
	sbc #$003C.w
	cmp $11F1.w
	bmi L0112D6.b
	phx
	lda $24.b
	lsr A
	and #$FFFE.w
	tax
	lda $7E6000.l,X
	plx
	and #$8000.w
	bne L0112D6.b
	jsl L00042C.l
.ACCU 8
.INDEX 8
	sep #$30
	ldy #$00.b
	cmp $1CE0.w
	bcs L0112D6.b
	ldy #$08.b
	cmp $1CDE.w
	bcs L0112DA.b
	dey
	cmp $1CDC.w
	bcs L0112DA.b
	dey
	cmp $1CDA.w
	bcs L0112DA.b
	dey
	cmp $1CD8.w
	bcs L0112DA.b
	dey
	cmp $1CD6.w
	bcs L0112DA.b
	dey
	cmp $1CD4.w
	bcs L0112DA.b
	dey
	cmp $1CD2.w
	bcs L0112DA.b
	dey
	bra L0112DA.b
L0112D6:
.ACCU 8
.INDEX 8
	sep #$30
	ldy #$00.b
L0112DA:
	tya
	sta $12F2.w,X
	tay
	lda $9249.w,Y
	beq L0112F7.b
	clc		; Clear carry
	adc $1372.w
	sta $1372.w
	xba
	and #$9F.b
	clc		; Clear carry
	adc $1CB6.w
	adc #$08.b
	sta $12F4.w,X
L0112F7:
.ACCU 16
.INDEX 16
	rep #$30
	rts

L0112FA:
.ACCU 16
.INDEX 16
	rep #$30
	phk
	plb
	lda #$0100.w
	ldx $1D1C.w
	beq L011309.b
	lda $1446.w,X
L011309:
	sta $1D1E.w
	ldx #$0000.w
	txy
L011310:
	stx $14.b
	lda $0284B6.l,X
	and #$00FF.w
	ldx $1444.w
	jsr L01335D.w
	ldx $1D1E.w
	jsl L000926.l
	lda $09.b
	sta $149C.w,Y
	ldx $14.b
	lda $0284C6.l,X
	and #$00FF.w
	ldx $1446.w
	jsr L01335D.w
	ldx $1D1E.w
	jsl L000926.l
	lda $09.b
	sta $147C.w,Y
	ldx $14.b
	lda $0284D6.l,X
	and #$00FF.w
	ldx $1446.w
	jsr L01335D.w
	ldx $1D1E.w
	jsl L000926.l
	lda $09.b
	sta $14BC.w,Y
	iny
	iny
	ldx $14.b
	inx
	cpx #$0010.w
	bne L011310.b
	lda #$00FF.w
	sta $14.b
L011370:
	lda $14.b
	tax
	jsr L0133C1.w
	tax
	lda $14.b
	jsl L0008CB.l
	lda $1442.w
	sta $04.b
	jsl L000A49.l
	lda $14.b
	asl A
	tax
	lda $00.b
	cmp #$0078.w
	bcs L011394.b
	lda #$0078.w
L011394:
	sta $17FE.w,X
	dec $14.b
	bpl L011370.b
	lda $1408.w
	ldx $1D1E.w
	jsl L000926.l
	lda $09.b
	sta $0D.b
	lda $08.b
	sta $0C.b
	lda #$00FF.w
	sta $14.b
L0113B2:
	lda $14.b
	tax
	jsr L0133C1.w
	sta $04.b
	stz $08.b
	lda $0D.b
	sta $09.b
	jsl L000A49.l
	lda $14.b
	asl A
	tax
	cpx #$0050.w
	bcc L0113D4.b
	lda $00.b
	cmp #$7FFC.w
	bcc L0113D7.b
L0113D4:
	lda #$7FFC.w
L0113D7:
	sta $15FE.w,X
	dec $14.b
	bpl L0113B2.b
	rtl

L0113DF:
.ACCU 16
.INDEX 16
	rep #$30
	phk
	plb
	lda $1CFA.w
	asl A
	asl A
	asl A
	tax
	lda $0186B8.l,X
	sec		; Set carry
	sbc $0186B4.l,X
	sta $1CE8.w
	lsr A
	lsr A
	sta $14.b
	lda $0186B4.l,X
	sta $10.b
	lda $0186B6.l,X
	sta $12.b
	ldx #$0000.w
	txy
L01140A:
	lda [$10.b],Y
	sta $7E2000.l,X
	iny
	iny
	lda [$10.b],Y
	sta $7E6000.l,X
	iny
	iny
	inx
	inx
	dec $14.b
	bne L01140A.b
	ldy #$0064.w
	lda #$0000.w
	sta $7E2000.l,X
	sta $7E4000.l,X
	sta $7E6000.l,X
	sta $7E2002.l,X
	sta $7E4002.l,X
	lda #$1208.w
	sta $7E6000.l,X
	lda #$1110.w
	sta $7E6002.l,X
	lda #$0000.w
L01144B:
	sta $7E2004.l,X
	sta $7E4004.l,X
	sta $7E6004.l,X
	inx
	inx
	dey
	bne L01144B.b
	ldx #$02FE.w
L01145F:
	sta $7E7D00.l,X
	dex
	dex
	bpl L01145F.b
	lda $1CE8.w
	lsr A
	lsr A
	inc A
	tay
	ldx #$0000.w
L011471:
	stx $1C.b
.ACCU 8
	sep #$20
	lda #$00.b
L011477:
	cmp $7E2000.l,X
	bne L011482.b
	inx
	inx
	dey
	bne L011477.b
L011482:
.ACCU 16
	rep #$20
	txa
	sec		; Set carry
	sbc $1C.b
	ldx $1C.b
L01148A:
	sta $7E4000.l,X
	inx
	inx
	dec A
	dec A
	bpl L01148A.b
	dey
	cpy #$0001.w
	bpl L011471.b
	lda #$FFFF.w
	sta $1E22.w
	jsl L010930.l
	ldx #$0012.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$0000.w
L0114B2:
	pha
	jsr L011252.w
	pla
	inc A
	cmp #$0020.w
	bne L0114B2.b
	stz $B6.b
	stz $13B0.w
	stz $1E20.w
	stz $B2.b
	stz $B4.b
	ldx #$0000.w
	lda #$FFFF.w
L0114CF:
	stz $0200.w,X
	sta $0202.w,X
	stz $0400.w,X
	sta $0402.w,X
	dec A
	inx
	inx
	inx
	inx
	cpx #$0200.w
	bne L0114CF.b
	lda #$00FF.w
	sta $1E14.w
	stz $1E16.w
	lda #$0400.w
	sta $1E15.w
.ACCU 8
	sep #$20
	lda #$43.b
	sta DMAP7.w		; DMA 7 Control
	lda #$0F.b
	sta DMADEST7.w		; DMA 7 Destination Register
	ldx #$1E14.w
	stx DMASRC7L.w		; DMA 7 Source Adress Low Byte
	stz DMASRC7B.w		; DMA 7 Source Address Bank
	stz DMALEN7B.w		; DMA 7 Transfer Bank
	lda #$80.b
	sta HDMAEN.w		; HDMA Channel Enable
.ACCU 16
	rep #$20
	lda #$0080.w
	sta $1E2A.w
	lda $1CC4.w
	asl A
	sta $1CC6.w
	lda #$0014.w
	sta $1E1A.w
	lda #$007F.w
	sta $1E10.w
	sta $1E12.w
	lda #$0000.w
	sec		; Set carry
	sbc $1412.w
	sta $1D02.w
	lda $0964.w
	sta $12A7.w
	jsr L012171.w
	jsr L011D79.w
	jsr L0121E7.w
	rtl

	bra -39.b		; 80 D9
	sta $6400.w,Y		; 99 00 64
	tax		; AA
	sei		; 78
	plx		; FA
L011551:
	stz $1CFE.w
	lda $1C7A.w
	asl A
	tax
	lda $028306.l,X
	tax
	ldy #$0000.w
L011561:
	lda $0000.w,X
	sta $14DC.w,Y
	iny
	iny
	sta $14DC.w,Y
	cmp $1CFE.w
	bcc L011574.b
	sta $1CFE.w
L011574:
	iny
	iny
	inx
	inx
	cpy #$0120.w
	bne L011561.b
	lda $1C7A.w
	asl A
	tax
	lda $02830C.l,X
	tax
	ldy #$0000.w
L01158A:
	lda $0000.w,X
	sta $13FC.w,Y
	inx
	inx
	iny
	iny
	cpy #$0072.w
	bne L01158A.b
	jsr L013400.w
	lda #$0001.w
	sta $137C.w
	lda #$0400.w
	sta $1C9C.w
	lda $1426.w
	sta $1C9E.w
	sta $1CA2.w
	lda $1434.w
	sta $1CA0.w
	sta $1CA4.w
	lda $141A.w
	sta $1CA6.w
	lda $1C74.w
	pha
	lda #$0001.w
	sta $1C74.w
	jsl L0112FA.l
	lda $09.b
	sta $1CF4.w
	lda $1C94.w
	sta $137E.w
	ldx #$01FE.w
L0115DC:
	stz $1A28.w,X
	dex
	dex
	bpl L0115DC.b
L0115E3:
	lda $11CD.w
	sta $11D1.w
	inc $12A3.w
	jsr L01397E.w
	lda $11D4.w
	cmp $11CE.w
	bcs L011633.b
	lda $11CD.w
	sec		; Set carry
	sbc $11D3.w
	asl A
	sta $08.b
	stz $0A.b
	lda $12A3.w
	sec		; Set carry
	sbc $12A5.w
	sta $04.b
	jsl L000A49.l
	lda $11D4.w
	tax
	asl A
	tay
	lda $00.b
	lsr A
	adc #$0000.w
L01161C:
	sta $1A28.w,Y
	iny
	iny
	inx
	cpx $11CE.w
	bne L01161C.b
	lda $12A3.w
	sta $12A5.w
	lda $11CD.w
	sta $11D3.w
L011633:
	lda $137C.w
	cmp $13FC.w
	bne L0115E3.b
	lda $118B.w
	bne L0115E3.b
	lda $11CD.w
	cmp $11D1.w
	bne L0115E3.b
	lda $11CD.w
	sta $1CF0.w
	lda $149A.w
	sta $1CF2.w
	pla
	sta $1C74.w
	ldx $1C6C.w
	lda $0996.w
	beq L011663.b
	ldx #$0003.w
L011663:
	lda $02954D.l,X
	and #$00FF.w
	xba
	sta $1C6E.w
	lda $029549.l,X
	and #$00FF.w
	beq L01168F.b
	sta $20.b
	ldy #$0000.w
L01167C:
	lda $1A28.w,Y
	tax
	lda $20.b
	jsr L01335D.w
	sta $1A28.w,Y
	iny
	iny
	cpy #$0200.w
	bne L01167C.b
L01168F:
	stz $1CFE.w
	lda $1C78.w
	asl A
	tax
	lda $028306.l,X
	tax
	ldy #$0000.w
L01169F:
	lda $0000.w,X
	sta $14DC.w,Y
	iny
	iny
	sta $14DC.w,Y
	cmp $1CFE.w
	bcc L0116B2.b
	sta $1CFE.w
L0116B2:
	iny
	iny
	inx
	inx
	cpy #$0120.w
	bne L01169F.b
	lda $1C78.w
	asl A
	tax
	lda $02830C.l,X
	tax
	ldy #$0000.w
L0116C8:
	lda $0000.w,X
	sta $13FC.w,Y
	inx
	inx
	iny
	iny
	cpy #$0072.w
	bne L0116C8.b
	lda $146E.w
	bne L011705.b
	lda $1406.w
	sta $1470.w
	lda $1444.w
	sta $1472.w
	lda $1446.w
	sta $1474.w
	lda $1408.w
	sta $1476.w
	lda $1442.w
	sta $1478.w
	lda $1416.w
	sta $147A.w
	inc $146E.w
	bra L011729.b
L011705:
	lda $1470.w
	sta $1406.w
	lda $1472.w
	sta $1444.w
	lda $1474.w
	sta $1446.w
	lda $1476.w
	sta $1408.w
	lda $1478.w
	sta $1442.w
	lda $147A.w
	sta $1416.w
L011729:
	jsl L0117FE.l
	jsr L013400.w
	lda #$0400.w
	sta $1C9C.w
	lda #$001E.w
	sta $1390.w
	lda $1426.w
	sta $1C9E.w
	sta $1CA2.w
	lda $1434.w
	sta $1CA0.w
	sta $1CA4.w
	lda $1418.w
	sta $1CA6.w
	lda #$002D.w
	sta $11F1.w
	stz $D0.b
	stz $D2.b
	stz $D6.b
	stz $D4.b
	lda #$000A.w
	sta $1CFC.w
	lda #$FFFF.w
	ldx $1CCA.w
	beq L011771.b
	inc A
L011771:
	sta $1CC8.w
	lda $1CC8.w
	beq L01179C.b
	lda #$0080.w
	sta $1CF6.w
	lda #$0280.w
	sta $1CF8.w
	sta $11DF.w
	lda #$0200.w
	sta $1CC4.w
	lda #$0380.w
	sta $12AD.w
	lda #$0040.w
	sta $1CB6.w
	bra L0117BA.b
L01179C:
	lda #$0100.w
	sta $1CC4.w
	lda #$0080.w
	sta $1CF6.w
	lda #$0180.w
	sta $1CF8.w
	sta $11DF.w
	sta $12AD.w
	lda #$0020.w
	sta $1CB6.w
L0117BA:
	lda #$0001.w
	sta $129B.w
	lda #$FFFE.w
	sta $125D.w
	lda $1C76.w
	beq L0117F1.b
	inc $129B.w
	lda #$0002.w
	sta $1283.w
	lda $11DF.w
	sec		; Set carry
	sbc #$00C0.w
	sta $11E1.w
	lda $11F1.w
	dec A
	sta $11F3.w
	lda #$FFFE.w
	sta $125F.w
	lda #$0002.w
	sta $1271.w
L0117F1:
	lda #$0080.w
	sta $1D00.w
	lda $0964.w
	sta $12A7.w
	rts

L0117FE:
.ACCU 16
.INDEX 16
	rep #$30
	jsl L0112FA.l
	lda $137C.w
	sta $0200.w
	lda $1C9C.w
	sta $0202.w
	lda $1CA2.w
	sta $0204.w
	lda $1CA4.w
	sta $0206.w
	lda $1C9E.w
	sta $0208.w
	lda $1CA0.w
	sta $020A.w
	lda $1C74.w
	sta $020C.w
	lda $1CA6.w
	sta $020E.w
	lda $118B.w
	sta $0210.w
	lda $11CD.w
	sta $0212.w
	lda $11CF.w
	sta $0214.w
	lda $12A3.w
	sta $0216.w
	lda $11F1.w
	sta $0218.w
	lda $1203.w
	sta $021A.w
	lda $12A1.w
	sta $021C.w
	lda $118D.w
	sta $021E.w
	lda $1388.w
	sta $0220.w
	lda $138A.w
	sta $0222.w
	lda $1386.w
	sta $0224.w
	lda #$0001.w
	sta $137C.w
	lda #$0400.w
	sta $1C9C.w
	lda $1426.w
	sta $1C9E.w
	sta $1CA2.w
	lda $1434.w
	sta $1CA0.w
	sta $1CA4.w
	lda $141A.w
	sta $1CA6.w
	lda #$0001.w
	sta $1C74.w
	stz $1EEE.w
	stz $1EEA.w
	stz $1EEC.w
	stz $118B.w
	stz $11CD.w
	stz $1203.w
	stz $11F1.w
	stz $12A3.w
	lda $1C94.w
	sta $137E.w
L0118BE:
	lda $11CD.w
	sta $11CF.w
	inc $12A3.w
	jsr L01397E.w
	lda $1EEE.w
	bne L0118F3.b
	lda $11CD.w
	clc		; Clear carry
	adc $1203.w
	sta $1203.w
	bcc L0118F3.b
	lda $11F1.w
	inc A
	cmp #$00D3.w
	bcc L0118F0.b
	lda $12A3.w
	sta $1EEE.w
	lda $11CD.w
	sta $1EF0.w
L0118F0:
	sta $11F1.w
L0118F3:
	lda $1EEA.w
	bne L011906.b
	lda $11CD.w
	cmp #$3C00.w
	bcc L011906.b
	lda $12A3.w
	sta $1EEA.w
L011906:
	lda $1EEC.w
	bne L011919.b
	lda $11CD.w
	cmp #$6400.w
	bcc L011919.b
	lda $12A3.w
	sta $1EEC.w
L011919:
	lda $137C.w
	cmp $13FC.w
	bne L0118BE.b
	lda $118B.w
	bne L0118BE.b
	lda $11CD.w
	cmp $11CF.w
	bne L0118BE.b
	lda $12A3.w
	sta $1EF2.w
	lda $11CD.w
	sta $1CEE.w
	lda $0200.w
	sta $137C.w
	lda $0202.w
	sta $1C9C.w
	lda $0204.w
	sta $1CA2.w
	lda $0206.w
	sta $1CA4.w
	lda $0208.w
	sta $1C9E.w
	lda $020A.w
	sta $1CA0.w
	lda $020C.w
	sta $1C74.w
	lda $020E.w
	sta $1CA6.w
	lda $0210.w
	sta $118B.w
	lda $0212.w
	sta $11CD.w
	lda $0214.w
	sta $11CF.w
	lda $0216.w
	sta $12A3.w
	lda $0218.w
	sta $11F1.w
	lda $021A.w
	sta $1203.w
	lda $021C.w
	sta $12A1.w
	lda $021E.w
	sta $118D.w
	lda $0220.w
	sta $1388.w
	lda $0222.w
	sta $138A.w
	lda $0224.w
	sta $1386.w
	rtl

L0119AD:
	lda #$0004.w
	sta $1191.w
	inc $1195.w
	lda $1193.w
	bne L0119C4.b
	inc $1193.w
	dec $1C86.w
	inc $12D8.w
L0119C4:
	lda #$0016.w
	jsl L002212.l
	stz $1199.w
	stz $1CC2.w
	jsl L00042C.l
	sta $11A1.w
	lda $117D.w
	bne L0119E3.b
	inc $119F.w
	stz $1183.w
L0119E3:
	lda $D0.b
	clc		; Clear carry
	adc $D2.b
	sta $11A3.w
	lda $D2.b
	beq L0119F2.b
	sta $11A1.w
L0119F2:
	lda $1CE6.w
	bne L011A03.b
	lda $1CEA.w
	bmi L011A00.b
	stz $1197.w
	rts

L011A00:
	stz $1CEA.w
L011A03:
	lda #$000E.w
	sta $1197.w
	rts

L011A0A:
	lda $12E8.w
	bne L011A28.b
	lda $12EA.w
	bne L011A27.b
	jsl L00042C.l
	sta $12EE.w
	inc $12DA.w
	lda #$00B4.w
	sta $12EA.w
	stz $12EC.w
L011A27:
	rts

L011A28:
	stz $11CF.w
	rts

L011A2C:
	lda #$0028.w
L011A2F:
	clc		; Clear carry
	adc $11F1.w
	sta $11F1.w,X
	stz $1203.w,X
	lda $1CC2.w
	sta $11CD.w,X
	lda $1CC8.w
	beq L011A50.b
	jsl L00042C.l
	and #$0100.w
	beq L011A50.b
	inc $11E0.w,X
L011A50:
	rts

L011A51:
.ACCU 16
.INDEX 16
	rep #$30
	lda $12AB.w
	cmp #$0003.w
	bcs L011AB9.b
	lda $129D.w
	cmp #$0002.w
	beq L011ABC.b
	asl A
	tay
	jsl L00042C.l
	cmp $1CBC.w
	bcs L011ABC.b
	and #$0003.w
	cmp #$0003.w
	bne L011A77.b
	dec A
L011A77:
	asl A
	adc #$000C.w
	cpy #$0000.w
	beq L011AA9.b
	ldx $1CD0.w
	cpx #$0005.w
	bne L011A9A.b
	cmp #$0010.w
	beq L011ABC.b
	ldx #$0010.w
	cpx $128B.w
	beq L011ABC.b
	cmp $128B.w
	beq L011ABC.b
L011A9A:
	cmp $128B.w
	bne L011AA9.b
	inc A
	inc A
	cmp #$0012.w
	bne L011AA9.b
	lda #$000C.w
L011AA9:
	sta $128B.w,Y
	tax
	lda $1CF6.w
	sta $11DF.w,X
	inc $129D.w
	jmp L011A2C.w
L011AB9:
	jmp L011B83.w
L011ABC:
	lda $129F.w
	cmp #$0002.w
	beq L011AB9.b
	jsl L00042C.l
	cmp $1CBA.w
	bcs L011AB9.b
	and #$0003.w
	cmp #$0003.w
	bne L011AD6.b
	dec A
L011AD6:
	asl A
	adc #$0006.w
	ldx $129F.w
	cpx #$0000.w
	beq L011B2A.b
	ldx $1CD0.w
	cpx #$0005.w
	bne L011B0E.b
	cmp #$000A.w
	beq L011AB9.b
	sta $14.b
	ldy $129B.w
	ldx #$0000.w
L011AF7:
	lda $1281.w,X
	cmp $14.b
	beq L011B0C.b
	cmp #$000A.w
	beq L011B0C.b
	inx
	inx
	dey
	bne L011AF7.b
	lda $14.b
	bra L011B2A.b
L011B0C:
	bra L011B83.b
L011B0E:
	ldy $129B.w
	ldx #$0000.w
L011B14:
	cmp $1281.w,X
	beq L011B20.b
	inx
	inx
	dey
	bne L011B14.b
	bra L011B2A.b
L011B20:
	inc A
	inc A
	cmp #$000C.w
	bne L011B2A.b
	lda #$0006.w
L011B2A:
	tax
	lda $129B.w
	asl A
	tay
	lda $11CD.w
	cmp $1CC2.w
	bcc L011B4B.b
	txa
	sta $1281.w,Y
	lda $1CF8.w
	sta $11DF.w,X
	inc $129F.w
	inc $129B.w
	jmp L011A2C.w
L011B4B:
	phx
	ldx $129B.w
L011B4F:
	lda $127F.w,Y
	sta $1281.w,Y
	dey
	dey
	dex
	bne L011B4F.b
	plx
	txa
	sta $1281.w,Y
	lda $1CF8.w
	sta $11DF.w,X
	inc $129F.w
	inc $129B.w
	inc $126F.w
	inc $126F.w
	inc $1271.w
	inc $1271.w
	inc $1273.w
	inc $1273.w
	lda #$FFDD.w
	jmp L011A2F.w
L011B83:
	rts

L011B84:
	lda $129B.w
	asl A
	tay
	ldx $129B.w
	stz $12B5.w
L011B8F:
	lda $127F.w,Y
	sta $1281.w,Y
	dey
	dey
	dex
	bne L011B8F.b
	lda #$0004.w
	tax
	sta $12A9.w
	sta $1281.w,Y
	lda $1CF8.w
	sta $11DF.w,X
	inc $129B.w
	inc $126F.w
	inc $126F.w
	inc $1271.w
	inc $1271.w
	stz $1273.w
	inc $12AB.w
	lda #$FFDD.w
	jsr L011A2F.w
	lda $11CD.w
	sec		; Set carry
	sbc #$0A00.w
	sta $11D1.w
	rts

L011BD0:
	phx
	phy
	lda $12AB.w
	cmp #$0002.w
	bcs L011BDD.b
	jmp L011C1C.w
L011BDD:
	lda #$001A.w
	jsl L0022B4.l
	ldy $129B.w
	ldx #$0000.w
L011BEA:
	lda $1281.w,X
	cmp #$0004.w
	beq L011BF7.b
	inx
	inx
	dey
	bra L011BEA.b
L011BF7:
	dec $129B.w
L011BFA:
	dey
	beq L011C1C.b
	lda $1283.w,X
	sta $1281.w,X
	bne L011C0D.b
	dec $126F.w
	dec $126F.w
	bra L011C18.b
L011C0D:
	cmp #$0002.w
	bne L011C18.b
	dec $1271.w
	dec $1271.w
L011C18:
	inx
	inx
	bra L011BFA.b
L011C1C:
	stz $12A9.w
	stz $12AB.w
	lda $1CBE.w
	sta $1CC0.w
	ply
	plx
	rtl

L011C2B:
	lda #$0005.w
	sta $12.b
	lda #$8000.w
	sta $10.b
	lda $129D.w
	sta $20.b
	bne L011C3F.b
	jmp L011CAC.w
L011C3F:
	ldy #$0000.w
L011C42:
	lda $128B.w,Y
	tax
	lda $11CD.w,X
	lsr A
	sec		; Set carry
	eor #$FFFF.w
	adc $1203.w,X
	sta $1203.w,X
	bcs L011C59.b
	dec $11F1.w,X
L011C59:
	lda $11CD.w,X
	cmp $1CC2.w
	beq L011C7B.b
	bcc L011C6D.b
	sbc #$0030.w
	cmp $1CC2.w
	bcs L011C78.b
	bra L011C75.b
L011C6D:
	adc #$0030.w
	cmp $1CC2.w
	bcc L011C78.b
L011C75:
	lda $1CC2.w
L011C78:
	sta $11CD.w,X
L011C7B:
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w
	sta $124B.w,X
	lda $11F1.w,X
	sbc $11F1.w
	sta $1239.w,X
	iny
	iny
	dec $20.b
	bne L011C42.b
	ldx $128B.w
	lda $1239.w,X
	bpl L011CAC.b
	cmp #$FFD8.w
	bcs L011CAC.b
	dec $129D.w
	beq L011CAC.b
	lda $128D.w
	sta $128B.w
L011CAC:
	lda $129B.w
	sta $20.b
	ldy #$0000.w
L011CB4:
	lda $1281.w,Y
	bne L011CBC.b
L011CB9:
	jmp L011D6F.w
L011CBC:
	tax
	lda $11CD.w,X
	lsr A
	clc		; Clear carry
	adc $1203.w,X
	sta $1203.w,X
	bcc L011CCD.b
	inc $11F1.w,X
L011CCD:
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w
	sta $124B.w,X
	lda $11F1.w,X
	sbc $11F1.w
	sta $1239.w,X
	cpx #$0002.w
	beq L011CB9.b
	cpx #$0004.w
	bne L011D1B.b
	lda $1239.w,X
	bmi L011CF4.b
	cmp #$0032.w
	bcs L011D13.b
L011CF4:
	lda $1239.w,X
	bpl L011CB9.b
	cmp #$FFC9.w
	bcs L011CB9.b
	lda $0F77.w
	bne L011D13.b
	jsl L00042C.l
	cmp #$6000.w
	bcs L011D13.b
	lda #$0024.w
	jsl L002212.l
L011D13:
	jsl L011BD0.l
	dey
	dey
	bra L011D6F.b
L011D1B:
	lda $1239.w,X
	bmi L011D25.b
	cmp #$0032.w
	bcs L011D2F.b
L011D25:
	lda $1239.w,X
	bpl L011CB9.b
	cmp #$FFD8.w
	bcs L011CB9.b
L011D2F:
	dec $129F.w
	phy
	dec $129B.w
	lda $20.b
	pha
L011D39:
	dec $20.b
	beq L011D69.b
	lda $1283.w,Y
	sta $1281.w,Y
	bne L011D4D.b
	dec $126F.w
	dec $126F.w
	bra L011D65.b
L011D4D:
	cmp #$0002.w
	bne L011D5A.b
	dec $1271.w
	dec $1271.w
	bra L011D65.b
L011D5A:
	cmp #$0004.w
	bne L011D65.b
	dec $1273.w
	dec $1273.w
L011D65:
	iny
	iny
	bra L011D39.b
L011D69:
	pla
	sta $20.b
	ply
	dey
	dey
L011D6F:
	iny
	iny
	dec $20.b
	beq L011D78.b
	jmp L011CB4.w
L011D78:
	rts

L011D79:
	lda $129D.w
	dec A
	bmi L011DEC.b
	beq L011DEC.b
	sta $14.b
	ldy #$0000.w
L011D86:
	phy
	lda $128B.w,Y
	tax
	lda $128D.w,Y
	tay
	lda $1203.w,Y
	sec		; Set carry
	sbc $1203.w,X
	sta $1227.w,Y
	lda $11F1.w,Y
	sbc $11F1.w,X
	sta $1215.w,Y
	bmi L011DAE.b
	bne L011E1A.b
	lda $1227.w,Y
	cmp #$8000.w
	bcs L011E1A.b
L011DAE:
	lda $19FE.w,Y
	clc		; Clear carry
	adc $19FE.w,X
	sta $20.b
	lda $11DF.w,Y
	sec		; Set carry
	sbc $11DF.w,X
	cmp $20.b
	bcs L011DEE.b
L011DC2:
	lda $1203.w,X
	clc		; Clear carry
	adc #$8000.w
	sta $1203.w,Y
	lda $11F1.w,X
	adc #$0000.w
	sta $11F1.w,Y
	lda $11CD.w,Y
	cmp $11CD.w,X
	bcc L011E1A.b
	sta $16.b
	lda $11CD.w,X
	sta $11CD.w,Y
	lda $16.b
	sta $11CD.w,X
	bra L011E1A.b
L011DEC:
	bra L011E24.b
L011DEE:
	eor #$FFFF.w
	inc A
	cmp $20.b
	bcc L011DC2.b
	lda $1215.w,Y
	bpl L011E1A.b
	lda #$0000.w
	sec		; Set carry
	sbc $1227.w,Y
	sta $1227.w,Y
	lda #$0000.w
	sbc $1215.w,Y
	sta $1215.w,Y
	lda $128B.w
	ldx $128D.w
	sta $128D.w
	stx $128B.w
L011E1A:
	ply
	iny
	iny
	dec $14.b
	beq L011E24.b
	jmp L011D86.w
L011E24:
	lda $129B.w
	dec A
	bmi L011E5E.b
	beq L011E5E.b
	sta $14.b
	ldy #$0000.w
L011E31:
	phy
	lda $1281.w,Y
	tax
	lda $1283.w,Y
	tay
	lda $1203.w,Y
	sec		; Set carry
	sbc $1203.w,X
	sta $1227.w,Y
	lda $11F1.w,Y
	sbc $11F1.w,X
	sta $1215.w,Y
	bmi L011E61.b
	bne L011E5B.b
	lda $1227.w,Y
	cmp #$8000.w
	bcs L011E5B.b
	bra L011E66.b
L011E5B:
	jmp L011FD9.w
L011E5E:
	jmp L011FE3.w
L011E61:
	cmp #$FFFD.w
	bmi L011E85.b
L011E66:
	lda $12AB.w
	cmp #$0003.w
	bcc L011E88.b
	cpy #$0004.w
	beq L011E80.b
	cpx #$0004.w
	bne L011E88.b
	cpy #$0006.w
	bcc L011E88.b
	jmp L011F4E.w
L011E80:
	cpx #$0006.w
	bcc L011E88.b
L011E85:
	jmp L011F4E.w
L011E88:
	lda $19FE.w,Y
	clc		; Clear carry
	adc $19FE.w,X
	sta $20.b
	lda $11DF.w,Y
	sec		; Set carry
	sbc $11DF.w,X
	cmp $20.b
	bcc L011E9F.b
	jmp L011F43.w
L011E9F:
	cpx #$0000.w
	beq L011EA9.b
	cpy #$0000.w
	bne L011EB4.b
L011EA9:
	lda $117D.w
	cmp #$4000.w
	bcc L011EB4.b
	jmp L011F4E.w
L011EB4:
	stz $16.b
	lda $11CD.w,Y
	cmp $11CD.w,X
	bcs L011ED3.b
	pha
	lda $11CD.w,X
	sec		; Set carry
	sbc $11CD.w,Y
	sta $16.b
	lsr A
	adc $11CD.w,Y
	sta $11CD.w,Y
	pla
	sta $11CD.w,X
L011ED3:
	lda $1203.w,X
	clc		; Clear carry
	adc #$8000.w
	sta $1203.w,Y
	lda $11F1.w,X
	adc #$0000.w
	sta $11F1.w,Y
	cpy #$0004.w
	beq L011EF0.b
	cpx #$0004.w
	bne L011F05.b
L011EF0:
	lda $16.b
	cmp #$3200.w
	bcc L011F05.b
	lda $11F5.w
	cmp $11F1.w
	bcs L011F05.b
	lda #$FFFF.w
	sta $12AB.w
L011F05:
	cpy #$0002.w
	beq L011F0F.b
	cpx #$0002.w
	bne L011F19.b
L011F0F:
	lda $16.b
	cmp #$3200.w
	bcc L011F19.b
	jsr L011A0A.w
L011F19:
	cpx #$0000.w
	beq L011F21.b
	jmp L011FD9.w
L011F21:
	lda #$0017.w
	jsl L0021C6.l
	lda $16.b
	cmp #$3200.w
	bcs L011F32.b
	jmp L011FD9.w
L011F32:
	cpy #$0004.w
	bne L011F3D.b
	lda #$0001.w
	sta $1C86.w
L011F3D:
	jsr L0119AD.w
	jmp L011FD9.w
L011F43:
	eor #$FFFF.w
	inc A
	cmp $20.b
	bcs L011F4E.b
	jmp L011E9F.w
L011F4E:
	lda $1215.w,Y
	bmi L011F56.b
	jmp L011FD9.w
L011F56:
	lda $12AB.w
	cmp #$0002.w
	bcc L011FA1.b
	cpx #$0004.w
	bne L011FA1.b
	cpy #$0000.w
	beq L011FA1.b
	cpy #$0002.w
	beq L011FA1.b
	lda $11F5.w
	cmp $11F1.w
	bcc L011FA1.b
	lda $1203.w,X
	clc		; Clear carry
	adc #$8000.w
	sta $1203.w,Y
	lda $11F1.w,X
	adc #$0000.w
	sta $11F1.w,Y
	lda #$8000.w
	sta $1227.w,Y
	lda #$0000.w
	sta $1215.w,Y
	lda $11D1.w
	clc		; Clear carry
	adc #$0A00.w
	sta $11CD.w,Y
	jmp L011FD9.w
L011FA1:
	lda $12AB.w
	cmp #$0003.w
	bne L011FB6.b
	cpy #$0004.w
	bne L011FB6.b
	cpx #$0000.w
	bne L011FB6.b
	jmp L011EB4.w
L011FB6:
	lda #$0000.w
	sec		; Set carry
	sbc $1227.w,Y
	sta $1227.w,Y
	lda #$0000.w
	sbc $1215.w,Y
	sta $1215.w,Y
	ply
	phy
	lda $1281.w,Y
	tax
	lda $1283.w,Y
	sta $1281.w,Y
	txa
	sta $1283.w,Y
L011FD9:
	ply
	iny
	iny
	dec $14.b
	beq L011FE3.b
	jmp L011E31.w
L011FE3:
	rts

L011FE4:
	ldx #$FFFE.w
	lda $129D.w
	sta $14.b
	beq L01200E.b
L011FEE:
	inx
	inx
	phx
	lda $128B.w,X
	tax
	lda $1203.w,Y
	sec		; Set carry
	sbc $1203.w,X
	lda $11F1.w,Y
	sbc $11F1.w,X
	bmi L01200D.b
	plx
	dec $14.b
	bne L011FEE.b
	inx
	inx
	bra L01200E.b
L01200D:
	plx
L01200E:
	rts

L01200F:
	ldx #$0000.w
L012012:
	cmp $1281.w,X
	beq L01201B.b
	inx
	inx
	bne L012012.b
L01201B:
	rts

L01201C:
	stx $14.b
	bpl L012023.b
	jmp L0120C3.w
L012023:
	lda $125D.w,Y
	bpl L01202B.b
	jmp L0120C1.w
L01202B:
	cmp $12D6.w
	bne L012033.b
	jmp L0120C1.w
L012033:
	tax
	lda $128B.w,X
	tax
	lda $11F1.w,Y
	sec		; Set carry
	sbc $11F1.w,X
	cmp #$0003.w
	bcs L0120C1.b
	lda $19FE.w,Y
	clc		; Clear carry
	adc $19FE.w,X
	sta $20.b
	lda $11DF.w,Y
	sec		; Set carry
	sbc $11DF.w,X
	cmp $20.b
	bcs L0120B9.b
L012058:
	lda $1203.w,Y
	clc		; Clear carry
	adc #$8000.w
	sta $1203.w,X
	lda $11F1.w,Y
	adc #$0000.w
	sta $11F1.w,X
	cpy #$0004.w
	bne L01208D.b
	inc $12B5.w
	stz $11D1.w
	lda $12AB.w
	cmp #$0003.w
	bcc L012084.b
	lda #$0002.w
	sta $12AB.w
L012084:
	lda #$001A.w
	jsl L0022B4.l
	bra L0120B4.b
L01208D:
	cpy #$0002.w
	bne L01209A.b
	jsr L011A0A.w
	stz $11CF.w
	bra L0120B4.b
L01209A:
	cpy #$0000.w
	bne L0120B4.b
	lda #$0004.w
	sta $118F.w
	jsr L0119AD.w
	lda #$0000.w
	sta $1239.w,X
	lda #$8000.w
	sta $124B.w,X
L0120B4:
	lda $125D.w,Y
	tax
	rts

L0120B9:
	eor #$FFFF.w
	inc A
	cmp $20.b
	bcc L012058.b
L0120C1:
	ldx $14.b
L0120C3:
	rts

L0120C4:
	lda $125D.w,Y
	bpl L0120CC.b
	jmp L012170.w
L0120CC:
	cmp $12D6.w
	bne L0120D4.b
	jmp L012170.w
L0120D4:
	tax
	lda $128B.w,X
	tax
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w,Y
	sta $16.b
	lda $11F1.w,X
	sbc $11F1.w,Y
	cmp #$0000.w
	beq L0120F0.b
	jmp L012170.w
L0120F0:
	lda $16.b
	cmp #$8000.w
	bcs L012170.b
	lda $19FE.w,Y
	clc		; Clear carry
	adc $19FE.w,X
	sta $20.b
	lda $11DF.w,Y
	sec		; Set carry
	sbc $11DF.w,X
	cmp $20.b
	bcs L012168.b
L01210B:
	lda $1203.w,Y
	clc		; Clear carry
	adc #$8000.w
	sta $1203.w,X
	lda $11F1.w,Y
	adc #$0000.w
	sta $11F1.w,X
	cpy #$0004.w
	bne L012140.b
	inc $12B5.w
	stz $11D1.w
	lda $12AB.w
	cmp #$0003.w
	bcc L012137.b
	lda #$0002.w
	sta $12AB.w
L012137:
	lda #$001A.w
	jsl L0022B4.l
	bra L012167.b
L012140:
	cpy #$0002.w
	bne L01214D.b
	jsr L011A0A.w
	stz $11CF.w
	bra L012167.b
L01214D:
	cpy #$0000.w
	bne L012167.b
	lda #$0004.w
	sta $118F.w
	jsr L0119AD.w
	lda #$0000.w
	sta $1239.w,X
	lda #$8000.w
	sta $124B.w,X
L012167:
	rts

L012168:
	eor #$FFFF.w
	inc A
	cmp $20.b
	bcc L01210B.b
L012170:
	rts

L012171:
	lda $129B.w
	asl A
	sta $12D4.w
	lda $129D.w
	asl A
	sta $12D6.w
	ldy #$0000.w
	jsr L011FE4.w
	lda $117D.w
	cmp #$4000.w
	bcs L01219C.b
	cpx $125D.w
	beq L012197.b
	jsr L01201C.w
	bra L01219C.b
L012197:
	jsr L0120C4.w
	bra L01219F.b
L01219C:
	stx $125D.w
L01219F:
	lda #$0000.w
	jsr L01200F.w
	stx $126F.w
	lda $1C76.w
	beq L0121C7.b
	ldy #$0002.w
	jsr L011FE4.w
	cpx $125F.w
	beq L0121BB.b
	jsr L01201C.w
L0121BB:
	stx $125F.w
	lda #$0002.w
	jsr L01200F.w
	stx $1271.w
L0121C7:
	lda $12A9.w
	beq L0121E6.b
	ldy #$0004.w
	jsr L011FE4.w
	cpx $1261.w
	beq L0121DA.b
	jsr L01201C.w
L0121DA:
	stx $1261.w
	lda #$0004.w
	jsr L01200F.w
	stx $1273.w
L0121E6:
	rts

L0121E7:
	stz $11B9.w
	lda #$FFFF.w
	sta $11BB.w
	ldy #$0000.w
	lda $129D.w
	sta $14.b
	beq L012228.b
L0121FA:
	lda $128B.w,Y
	tax
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w
	sta $124B.w,X
	lda $11F1.w,X
	sbc $11F1.w
	sta $1239.w,X
	bpl L012217.b
	eor #$FFFF.w
	inc A
L012217:
	cmp $11BB.w
	bcs L012222.b
	sta $11BB.w
	stx $11B9.w
L012222:
	iny
	iny
	dec $14.b
	bne L0121FA.b
L012228:
	ldy #$0000.w
	lda $129B.w
	sta $14.b
	beq L012265.b
L012232:
	lda $1281.w,Y
	tax
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w
	sta $124B.w,X
	lda $11F1.w,X
	sbc $11F1.w
	sta $1239.w,X
	bpl L01224F.b
	eor #$FFFF.w
	inc A
L01224F:
	cpx #$0000.w
	beq L01225F.b
	cmp $11BB.w
	bcs L01225F.b
	sta $11BB.w
	stx $11B9.w
L01225F:
	iny
	iny
	dec $14.b
	bne L012232.b
L012265:
	rts

L012266:
	stz $12CA.w
	stz $12CC.w
	stz $12CE.w
	stz $12D0.w
	lda #$00FF.w
	ldx $1CC8.w
	bne L012288.b
	sta $12C0.w
	dec A
	sta $12BE.w
	stz $12C2.w
	stz $12C4.w
	rts

L012288:
	sta $12C4.w
	dec A
	sta $12C2.w
	dec A
	sta $12C0.w
	dec A
	sta $12BE.w
	rts

L012298:
	lda $12EA.w
	beq L0122C5.b
	cpy #$0002.w
	bne L0122C5.b
	lda $11CF.w
	bne L0122B7.b
	lda $1CF8.w
	sta $11E1.w
	lda $12EA.w
	dec A
	sta $12EA.w
	bne L0122B6.b
L0122B6:
	rts

L0122B7:
	lsr A
	lsr A
	lsr A
	lsr A
	clc		; Clear carry
	adc $12EC.w
	sta $12EC.w
	jmp L0124E7.w
L0122C5:
	lda $125D.w,Y
	bmi L012330.b
L0122CA:
	cmp $12D6.w
	beq L012330.b
	sta $22.b
	tax
	lda $128B.w,X
	tax
	sta $1C.b
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w,Y
	sta $00.b
	lda $11F1.w,X
	sbc $11F1.w,Y
	cmp #$0080.w
	bcs L01232A.b
	lsr A
	sta $02.b
	ror $00.b
	lda $11CD.w,X
	clc		; Clear carry
	adc $11CD.w,Y
	ror A
	sta $08.b
	xba
	ldx $01.b
	jsr L0133EF.w
	cmp #$00FE.w
	bcs L01232A.b
	pha
	ldx $1C.b
	lda $11DF.w,X
	xba
	and #$0003.w
	asl A
	tax
	pla
	cmp $12BE.w,X
	bcs L01231B.b
	sta $12BE.w,X
L01231B:
	phx
	ldx $08.b
	jsr L0133EF.w
	plx
	cmp $1CF2.w
	bcc L01232A.b
	inc $12CA.w,X
L01232A:
	lda $22.b
	inc A
	inc A
	bra L0122CA.b
L012330:
	lda $126F.w,Y
	inc A
	inc A
L012335:
	cmp $12D4.w
	bne L01233D.b
	jmp L0123C2.w
L01233D:
	sta $22.b
	tax
	lda $1281.w,X
	tax
	sta $1C.b
	lda $1203.w,X
	sec		; Set carry
	sbc $1203.w,Y
	sta $00.b
	lda $11F1.w,X
	sbc $11F1.w,Y
	sbc #$0003.w
	bcs L012371.b
	ldx $1C.b
	lda $11DF.w,X
	xba
	and #$0003.w
	asl A
	tax
	lda #$000A.w
	sta $12BE.w,X
	inc $12CA.w,X
	jmp L0123BB.w
L012371:
	cmp #$0080.w
	bcs L0123BB.b
	lsr A
	sta $02.b
	ror $00.b
	lda $11CD.w,Y
	sec		; Set carry
	sbc $11CD.w,X
	bcc L0123BB.b
	lsr A
	cmp #$0100.w
	bcc L0123BB.b
	sta $08.b
	xba
	ldx $01.b
	jsr L0133EF.w
	cmp #$00FE.w
	bcs L0123BB.b
	pha
	ldx $1C.b
	lda $11DF.w,X
	xba
	and #$0003.w
	asl A
	tax
	pla
	cmp $12BE.w,X
	bcs L0123AC.b
	sta $12BE.w,X
L0123AC:
	phx
	ldx $08.b
	jsr L0133EF.w
	plx
	cmp $1CF2.w
	bcc L0123BB.b
	inc $12CA.w,X
L0123BB:
	lda $22.b
	inc A
	inc A
	jmp L012335.w
L0123C2:
	ldx #$0000.w
	lda $12BE.w
	stx $14.b
L0123CA:
	inx
	inx
	cpx #$0008.w
	beq L0123DD.b
	cmp $12BE.w,X
	bcs L0123CA.b
	stx $14.b
	lda $12BE.w,X
	bra L0123CA.b
L0123DD:
	cpy #$0004.w
	beq L0123FE.b
	lda $1CE8.w
	sec		; Set carry
	sbc #$001E.w
	cmp $11F1.w,Y
	bpl L0123FE.b
	lda #$0000.w
	sta $1295.w,Y
	lda $11DF.w,Y
	cmp $1CC6.w
	bmi L01245D.b
	bra L01246A.b
L0123FE:
	lda $11DF.w,Y
	xba
	and #$0003.w
	asl A
	tax
	sta $1C.b
	sec		; Set carry
	sbc $14.b
	beq L012440.b
	bcs L012429.b
	cmp #$FFFE.w
	beq L012440.b
	lda $12BE.w,X
	cmp $12C0.w,X
	bcc L012440.b
	lda $12C0.w,X
	cmp #$0064.w
	bcs L012440.b
	stx $14.b
	bra L012440.b
L012429:
	cmp #$0002.w
	beq L012440.b
	lda $12BE.w,X
	cmp $12BC.w,X
	bcc L012440.b
	lda $12BC.w,X
	cmp #$0064.w
	bcs L012440.b
	stx $14.b
L012440:
	lda $14.b
	lsr A
	xba
	adc #$0080.w
	cmp $11DF.w,Y
	beq L01246A.b
	bcs L01245D.b
	lda #$FFFC.w
	sta $1295.w,Y
	clc		; Clear carry
	adc $11DF.w,Y
	sta $11DF.w,Y
	bra L01246A.b
L01245D:
	lda #$0004.w
	sta $1295.w,Y
	clc		; Clear carry
	adc $11DF.w,Y
	sta $11DF.w,Y
L01246A:
	lda $11F1.w,Y
	lsr A
	and #$FFFE.w
	tax
	lda $7E2001.l,X
	and #$00FF.w
	cmp #$0080.w
	bcc L012481.b
	ora #$FF00.w
L012481:
	sta $12F0.w
	stx $14.b
	ldx $1C.b
	lda $12CA.w,X
	bne L0124E7.b
	ldx $14.b
	lda $7E4000.l,X
	sta $22.b
	clc		; Clear carry
	adc $14.b
	tax
	stz $00.b
	lda $7E2000.l,X
	and #$00FF.w
	beq L0124BA.b
	cmp #$0080.w
	bcc L0124AD.b
	eor #$00FF.w
	inc A
L0124AD:
	sta $04.b
	stz $08.b
	lda $1CF4.w
	sta $09.b
	jsl L000A49.l
L0124BA:
	lda $22.b
	asl A
	asl A
	tax
	lda $1CF2.w
	jsr L01337A.w
	lda $0A.b
	bne L012521.b
	lda $08.b
	clc		; Clear carry
	adc $00.b
	bcs L012521.b
	sta $00.b
	lda $11CE.w,Y
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	nop
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	cmp $00.b
	bcc L012521.b
L0124E7:
	lda $117D.w,Y
	bne L012500.b
	lda #$000A.w
	sta $128F.w,Y
	lda $11CD.w,Y
	cmp $1CF2.w
	bcc L012501.b
	sbc $1CF2.w
	sta $11CD.w,Y
L012500:
	rts

L012501:
	cpy #$0002.w
	bne L01251A.b
	lda $11F3.w
	cmp $1CE8.w
	bcc L01251A.b
	lda #$0002.w
	sta $12E8.w
	lda #$0000.w
	sta $1295.w,Y
L01251A:
	lda #$0000.w
	sta $11CD.w,Y
	rts

L012521:
	lda $117D.w,Y
	bne L012540.b
	lda $11CE.w,Y
	and #$00FF.w
	asl A
	tax
	lda $1A28.w,X
	clc		; Clear carry
	adc $11CD.w,Y
	cmp $1C6E.w
	bcc L01253D.b
	lda $1C6E.w
L01253D:
	sta $11CD.w,Y
L012540:
	rts

L012541:
	lda $12F0.w
	jsr L013261.w
	beq L012561.b
	bmi L012561.b
.ACCU 8
.INDEX 8
	sep #$30
	tax
	lda $11CE.w,Y
	jsr L0133C1.w
.ACCU 16
.INDEX 16
	rep #$30
	xba
	and #$00FF.w
	clc		; Clear carry
	adc $1183.w,Y
	sta $1183.w,Y
L012561:
	lda $1183.w,Y
	ora $117D.w,Y
	beq L0125A8.b
	lda $1183.w,Y
	sec		; Set carry
	sbc #$0017.w
	sta $1183.w,Y
	bmi L012581.b
	lda $117D.w,Y
	clc		; Clear carry
	adc $1183.w,Y
	sta $117D.w,Y
	bra L0125A8.b
L012581:
	lda $117D.w,Y
	clc		; Clear carry
	adc $1183.w,Y
	bcs L0125A5.b
	lda #$0000.w
	sec		; Set carry
	sbc $1183.w,Y
	cmp #$0064.w
	bcc L01259F.b
	lsr A
	sta $1183.w,Y
	lda #$0000.w
	bra L0125A5.b
L01259F:
	lda #$0000.w
	sta $1183.w,Y
L0125A5:
	sta $117D.w,Y
L0125A8:
	rts

	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $1E.b		; 00 1E
	brk $3C.b		; 00 3C
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $B4.b		; 00 B4
	brk $B4.b		; 00 B4
	.db $00		; Opcode overrunning section
L0125F3:
	lda $1C76.w
	beq L012612.b
	jsr L012266.w
	stz $1297.w
	lda $1291.w
	beq L012606.b
	dec $1291.w
L012606:
	stz $12F0.w
	ldy #$0002.w
	jsr L012298.w
	jsr L012541.w
L012612:
	lda $12A9.w
	bne L01261A.b
	jmp L0127B8.w
L01261A:
	lda $12B5.w
	beq L012622.b
	jmp L0127B8.w
L012622:
	lda $1293.w
	beq L01262A.b
	dec $1293.w
L01262A:
	lda $12AB.w
	cmp #$0004.w
	bcs L01264B.b
	lda $11F1.w
	sec		; Set carry
	sbc $11F5.w
	bmi L01263F.b
	eor #$FFFF.w
	inc A
L01263F:
	xba
	and #$FF00.w
	asl A
	clc		; Clear carry
	adc #$7800.w
	sta $10B7.w
L01264B:
	lda $1191.w
	beq L012653.b
	jmp L012768.w
L012653:
	lda $12AB.w
	cmp #$0003.w
	beq L01265E.b
	jmp L012710.w
L01265E:
	stz $1181.w
	stz $1187.w
	lda #$000A.w
	sta $1293.w
	lda $11E3.w
	cmp $12AD.w
	beq L01267C.b
	bcc L012679.b
	sbc #$0004.w
	bra L01267C.b
L012679:
	adc #$0004.w
L01267C:
	sta $11E3.w
	lda $11D1.w
	beq L0126B7.b
	lda $1CF2.w
	lsr A
	cmp $11D1.w
	bcc L012697.b
L01268D:
	stz $11D1.w
	stz $D0.b
	stz $D2.b
	jmp L0127B8.w
L012697:
	eor #$FFFF.w
	inc A
	clc		; Clear carry
	adc $11D1.w
	ldx $123D.w
	cpx #$000A.w
	bcc L0126B1.b
	cmp $11CD.w
	bcc L0126B1.b
	lda $11CD.w
	beq L01268D.b
L0126B1:
	sta $11D1.w
	jmp L0127B8.w
L0126B7:
	lda #$001A.w
	jsl L0022B4.l
	stz $11CD.w
	stz $11D1.w
	lda $1207.w
	sec		; Set carry
	sbc $1203.w
	lda $11F5.w
	sbc $11F1.w
	beq L0126E9.b
	lda $1207.w
	sec		; Set carry
	sbc #$0500.w
	sta $1207.w
	lda $11F5.w
	sbc #$0000.w
	sta $11F5.w
	jmp L0127B8.w
L0126E9:
	lda $0F77.w
	bne L0126FE.b
	jsl L00042C.l
	cmp #$6000.w
	bcs L0126FE.b
	lda #$0025.w
	jsl L002212.l
L0126FE:
	stz $12AF.w
	stz $12B1.w
	stz $12B3.w
	inc $12B7.w
	inc $12AB.w
	jmp L0127B8.w
L012710:
	cmp #$0004.w
	bne L012768.b
	stz $11CD.w
	stz $11D1.w
	lda $12B1.w
	asl A
	tax
	lda $12AF.w
	inc A
	sta $12AF.w
	cmp $02A5D9.l,X
	bcs L012730.b
	jmp L0127B8.w
L012730:
	lda $02A5C1.l,X
	beq L01273D.b
	lda #$001C.w
	jsl L002212.l
L01273D:
	stz $12AF.w
	lda $12B1.w
	inc A
	cmp #$000C.w
	beq L012757.b
	sta $12B1.w
	asl A
	tax
	lda $02A5A9.l,X
	sta $12B3.w
	bra L0127B8.b
L012757:
	stz $12AF.w
	lda #$FFFD.w
	sta $12B7.w
	inc $12AB.w
	inc $12DE.w
	bra L0127B8.b
L012768:
	jsr L012266.w
	stz $12F0.w
	ldy #$0004.w
	jsr L012298.w
	jsr L012541.w
	lda $12AB.w
	cmp #$0005.w
	bne L012794.b
L01277F:
	lda #$0000.w
	sta $128F.w,Y
	lda $11CD.w,Y
	clc		; Clear carry
	adc $1CF2.w
	sta $11CD.w,Y
	jsr L012521.w
	bra L0127B8.b
L012794:
	cmp #$0002.w
	bne L0127B8.b
	lda $1CE8.w
	sec		; Set carry
	sbc #$0014.w
	cmp $11F5.w
	bmi L01277F.b
	lda $123D.w
	bmi L0127B8.b
	cmp #$000A.w
	bcc L0127B8.b
	inc $12AB.w
	lda $11CD.w
	sta $11D1.w
L0127B8:
	rts

L0127B9:
	lda $129B.w
	sta $20.b
	ldy #$0000.w
L0127C1:
	lda $1281.w,Y
	beq L0127D0.b
	cmp #$0002.w
	beq L0127D0.b
	cmp #$0004.w
	bne L0127D7.b
L0127D0:
	iny
	iny
	dec $20.b
	bne L0127C1.b
	rts

L0127D7:
	phy
	tax
	stx $04.b
	lda $12AB.w
	cmp #$0003.w
	bcc L0127F6.b
	lda $1239.w,X
	bpl L0127F6.b
	lda $11CD.w,X
	sec		; Set carry
	sbc #$0060.w
	bcs L01281C.b
	lda #$0000.w
	bra L01281C.b
L0127F6:
	lda $20.b
	dec A
	sta $22.b
	bne L012823.b
L0127FD:
	lda $11CD.w,X
	cmp $1CC2.w
	beq L01281F.b
	bcc L012811.b
	sbc #$0030.w
	cmp $1CC2.w
	bcs L01281C.b
	bra L012819.b
L012811:
	adc #$0030.w
	cmp $1CC2.w
	bcc L01281C.b
L012819:
	lda $1CC2.w
L01281C:
	sta $11CD.w,X
L01281F:
	ply
	jmp L0127D0.w
L012823:
	sty $16.b
L012825:
	lda $1283.w,Y
	tay
	lda $11DF.w,X
	and #$0700.w
	sta $14.b
	lda $11DF.w,Y
	and #$0700.w
	cmp $14.b
	beq L012845.b
	dec $22.b
	beq L0127FD.b
	ldy $16.b
	iny
	iny
	bra L012825.b
L012845:
	lda $1203.w,Y
	sec		; Set carry
	sbc $1203.w,X
	sta $00.b
	lda $11F1.w,Y
	sbc $11F1.w,X
	sbc #$0003.w
	bcc L01288D.b
	cmp #$0080.w
	bcs L0127FD.b
	lsr A
	sta $02.b
	ror $00.b
	lda $11CD.w,X
	sec		; Set carry
	sbc $11CD.w,Y
	bcc L0127FD.b
	lsr A
	cmp #$0100.w
	bcc L0127FD.b
	sta $08.b
	xba
	ldx $01.b
	jsr L0133EF.w
	ldx $04.b
	cmp #$00FE.w
	bcs L0128A0.b
	ldx $08.b
	jsr L0133EF.w
	ldx $04.b
	cmp #$0030.w
	bcc L0128A0.b
L01288D:
	lda $11CD.w,X
	sec		; Set carry
	sbc #$0030.w
	bcs L012899.b
	lda #$0000.w
L012899:
	sta $11CD.w,X
	ply
	jmp L0127D0.w
L0128A0:
	jmp L0127FD.w
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $08.b		; 00 08
	brk $0A.b		; 00 0A
	brk $06.b		; 00 06
	brk $08.b		; 00 08
	brk $0A.b		; 00 0A
L0128B5:
	lda $1DD4.w,Y
	beq L0128F2.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $124C.w,X
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5C.w,Y
	sec		; Set carry
	sbc $14.b
	sta $1E.b
	asl A
	asl A
	clc		; Clear carry
	adc $B6.b
	tay
	lda $0200.w,Y
	sta $1C.b
	lda $0202.w,Y
	sec		; Set carry
	adc $1E.b
	and #$00FF.w
	sta $20.b
	bra L012901.b
L0128F2:
	lda $84E6.w,Y
	sta $20.b
	lda $1D5C.w,Y
	sta $1E.b
	lda $1D20.w,Y
	sta $1C.b
L012901:
	cpx #$0004.w
	beq L01290E.b
	cpx #$0002.w
	beq L01290E.b
L01290B:
	jmp L0129B9.w
L01290E:
	lda $117D.w,X
	beq L01290B.b
	lda $1E.b
	cmp #$0080.w
	bcs L01291D.b
	jmp L012999.w
L01291D:
	lda $98.b
	asl A
	tay
.ACCU 8
	sep #$20
	lda $124C.w,X
	sta WRMPYA.w		; Multiplicand A
	lda $1D5C.w,Y
	sec		; Set carry
	sbc $1D5E.w,Y
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5C.w,Y
	sec		; Set carry
	sbc $14.b
	sta $1E.b
	lda $1D20.w,Y
	sec		; Set carry
	sbc $1D22.w,Y
	pha
	bpl L012956.b
	eor #$FFFF.w
	inc A
L012956:
.ACCU 8
	sep #$20
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $16.b
	pla
	bmi L012973.b
	lda $1D20.w,Y
	sec		; Set carry
	sbc $16.b
	bra L012979.b
L012973:
	lda $1D20.w,Y
	clc		; Clear carry
	adc $16.b
L012979:
	sta $1C.b
	lda $84E6.w,Y
	sec		; Set carry
	sbc $84E8.w,Y
.ACCU 8
	sep #$20
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	sta $16.b
	lda $84E6.w,Y
	sec		; Set carry
	sbc $16.b
	sta $20.b
L012999:
	lda $117D.w,X
	asl A
	xba
	and #$00FF.w
	phx
	ldx $20.b
.ACCU 8
.INDEX 8
	sep #$30
	jsr L0133C1.w
.ACCU 16
.INDEX 16
	rep #$30
	xba
	and #$00FF.w
	sta $14.b
	lda $1E.b
	sec		; Set carry
	sbc $14.b
	sta $1E.b
	plx
L0129B9:
	lda $1E.b
	cmp #$0080.w
	bcs L0129EC.b
	lda $11DF.w,X
	sec		; Set carry
	sbc $1CC4.w
	tax
	lda $20.b
	jsr L013321.w
	clc		; Clear carry
	adc #$0080.w
	sec		; Set carry
	sbc $1C.b
	sta $1C.b
	bit $1CEA.w
	bmi L0129EE.b
	lda $98.b
	asl A
	tay
	lda #$2000.w
	cpy $AA.b
	beq L0129EB.b
	bcc L0129EB.b
	lda #$0000.w
L0129EB:
	rts

L0129EC:
	pla
	rts

L0129EE:
	lda $98.b
	asl A
	tay
	lda #$3000.w
	cpy $C0.b
	bcc L0129EB.b
	lda #$2000.w
	rts

L0129FD:
	sec		; Set carry
	sbc #$0008.w
	sta $22.b
	lda $1A10.w,X
	sta $10.b
	lda $1A22.w,X
	sta $12.b
	jsr L0128B5.w
	sta $18.b
	lda $12AB.w
	cmp #$0004.w
	beq L012A1D.b
	jmp L012AB7.w
L012A1D:
	lda $12B3.w
	cmp #$000B.w
	bne L012A83.b
	lda $12B9.w
	and #$00FF.w
	beq L012A43.b
	clc		; Clear carry
	adc #$0034.w
	sta $00.b
	lda $1C.b
	sec		; Set carry
	sbc #$0008.w
	tax
	ldy $1E.b
	lda #$3000.w
	jsl L00179B.l
L012A43:
	lda $12BB.w
	and #$00FF.w
	clc		; Clear carry
	adc #$0034.w
	sta $00.b
	lda $1C.b
	clc		; Clear carry
	adc #$000D.w
	tax
	ldy $1E.b
	lda #$3000.w
	jsl L00179B.l
	lda $12BA.w
	and #$00FF.w
	clc		; Clear carry
	adc #$0034.w
	sta $00.b
	lda $1C.b
	sec		; Set carry
	sbc #$0007.w
	tax
	ldy $1E.b
	lda #$3000.w
	jsl L00179B.l
	inc $1C.b
	inc $1C.b
	lda #$3000.w
	pha
L012A83:
	lda $12B3.w
	cmp #$0002.w
	bcc L012AA3.b
	cmp #$000B.w
	beq L012AA8.b
	clc		; Clear carry
	adc #$0028.w
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
	lda #$0001.w
L012AA3:
	tax
	lda $18.b
	pha
	txa
L012AA8:
	clc		; Clear carry
	adc #$0028.w
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	pla
	jsl L00179B.l
L012AB7:
	lda $1293.w
	beq L012ACE.b
	lda #$000A.w
	clc		; Clear carry
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
L012ACE:
	lda $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
	lda $0964.w
	and #$0020.w
	beq L012AE7.b
	lda #$000A.w
L012AE7:
	clc		; Clear carry
	adc #$0014.w
.BASE $C0
LC22AEB:
.BASE $00
L012AEB:
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
	rts

	brk $00.b		; 00 00
	lsr $00.b		; 46 00
	bit $3200.w,X		; 3C 00 32
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
L012B1A:
	sec		; Set carry
	sbc #$0008.w
	sta $22.b
	lda $1A12.w
	sta $10.b
	lda $1A24.w
	sta $12.b
	jsr L0128B5.w
	sta $18.b
	lda $12EA.w
	beq L012B6D.b
	lda $11CF.w
	beq L012B62.b
	lda $12EC.w
	ldx $12EE.w
	bpl L012B45.b
	eor #$FFFF.w
	inc A
L012B45:
	xba
	lsr A
	lsr A
	lsr A
	lsr A
	and #$000E.w
	tax
	lda $22.b
	clc		; Clear carry
	adc $02AAFA.l,X
	sta $00.b
	lda $18.b
	eor $02AB0A.l,X
	sta $18.b
	jmp L012BAE.w
L012B62:
	lda $22.b
	clc		; Clear carry
	adc #$0050.w
	sta $00.b
	jmp L012BAE.w
L012B6D:
	lda $1291.w
	beq L012B84.b
	lda #$000A.w
	clc		; Clear carry
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
L012B84:
	lda $0964.w
	and #$0010.w
	bne L012BAA.b
	lda $1297.w
	beq L012BAA.b
	bmi L012B98.b
	lda #$001E.w
	bra L012B9B.b
L012B98:
	lda #$0014.w
L012B9B:
	clc		; Clear carry
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L00179B.l
L012BAA:
	lda $22.b
	sta $00.b
L012BAE:
	ldx $1C.b
	ldy $1E.b
	lda $18.b
	jsl L001662.l
	rts

L012BB9:
	sta $22.b
	lda #$0F80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $02A8A3.l,X
	sta $18.b
	lda $22.b
	clc		; Clear carry
	adc $1A10.w,X
	sta $00.b
	jsr L0128B5.w
	clc		; Clear carry
	adc $18.b
	ldx $1C.b
	ldy $1E.b
	jsl L00179B.l
	rts

L012BE2:
	lda $1DD4.w,Y
	beq L012C28.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $1204.w
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5E.w,Y
	clc		; Clear carry
	adc $14.b
	cmp #$0080.w
	bcc L012C0E.b
	jmp L012CA7.w
L012C0E:
	sta $1E.b
	asl A
	asl A
	clc		; Clear carry
	adc $B6.b
	tay
	lda $0200.w,Y
	sta $1C.b
	lda $0202.w,Y
	sec		; Set carry
	adc $1E.b
	and #$00FF.w
	sta $20.b
	bra L012C3C.b
L012C28:
	lda $84E6.w,Y
	sta $20.b
	lda $1D5C.w,Y
	cmp #$0080.w
	bcs L012CA7.b
	sta $1E.b
	lda $1D20.w,Y
	sta $1C.b
L012C3C:
	lda $26.b
	and #$007F.w
	asl A
	asl A
	asl A
	sta $1A.b
	lda $26.b
	and #$0080.w
	beq L012C55.b
	lda #$0000.w
	sec		; Set carry
	sbc $1A.b
	sta $1A.b
L012C55:
	ldx $1A.b
	lda $20.b
	jsr L013321.w
	clc		; Clear carry
	adc #$0080.w
	sec		; Set carry
	sbc $1C.b
	tax
	lda $22.b
	sta $00.b
	lda #$000A.w
	sta $09A8.w
	lda $98.b
	asl A
	tay
	bit $1CEA.w
	bmi L012C85.b
	lda #$2000.w
	cpy $AA.b
	beq L012C99.b
	bcc L012C99.b
	lda #$0000.w
	bra L012C99.b
L012C85:
	lda $26.b
	and #$0080.w
	bne L012C8F.b
	dex
	dex
	dex
L012C8F:
	lda #$3000.w
	cpy $C0.b
	bcc L012C99.b
	lda #$2000.w
L012C99:
	eor $24.b
	ldy $1E.b
	jsl L001662.l
	lda #$0002.w
	sta $09A8.w
L012CA7:
	rts

L012CA8:
	lda $1DD4.w,Y
	beq L012CEE.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $1204.w
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5E.w,Y
	clc		; Clear carry
	adc $14.b
	cmp #$0080.w
	bcc L012CD4.b
	jmp L012D59.w
L012CD4:
	sta $1E.b
	asl A
	asl A
	clc		; Clear carry
	adc $B6.b
	tay
	lda $0200.w,Y
	sta $1C.b
	lda $0202.w,Y
	sec		; Set carry
	adc $1E.b
	and #$00FF.w
	sta $20.b
	bra L012D02.b
L012CEE:
	lda $84E6.w,Y
	sta $20.b
	lda $1D5C.w,Y
	cmp #$0080.w
	bcs L012D59.b
	sta $1E.b
	lda $1D20.w,Y
	sta $1C.b
L012D02:
	lda $26.b
	and #$000F.w
	asl A
	asl A
	sta $1A.b
	asl A
	adc $1A.b
	tax
	lda $20.b
	jsr L013321.w
	sta $1A.b
	lda $1E.b
	sec		; Set carry
	sbc $1A.b
	cmp #$002D.w
	bcc L012D59.b
	sta $1E.b
	lsr $1A.b
	lda #$0080.w
	sec		; Set carry
	sbc $20.b
	sec		; Set carry
	sbc $1A.b
	sec		; Set carry
	sbc #$0006.w
	sec		; Set carry
	sbc $1C.b
	tax
	lda $22.b
	sta $00.b
	lda #$000A.w
	sta $09A8.w
	lda $98.b
	asl A
	tay
	lda #$3000.w
	cpy $C0.b
	bcc L012D4D.b
	lda #$2000.w
L012D4D:
	ldy $1E.b
	jsl L001662.l
	lda #$0002.w
	sta $09A8.w
L012D59:
	rts

L012D5A:
	lda $1DD4.w,Y
	beq L012DA0.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $1204.w
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5E.w,Y
	clc		; Clear carry
	adc $14.b
	cmp #$0080.w
	bcc L012D86.b
	jmp L012DEB.w
L012D86:
	sta $1E.b
	asl A
	asl A
	clc		; Clear carry
	adc $B6.b
	tay
	lda $0200.w,Y
	sta $1C.b
	lda $0202.w,Y
	sec		; Set carry
	adc $1E.b
	and #$00FF.w
	sta $20.b
	bra L012DB4.b
L012DA0:
	lda $84E6.w,Y
	sta $20.b
	lda $1D5C.w,Y
	cmp #$0080.w
	bcs L012DEB.b
	sta $1E.b
	lda $1D20.w,Y
	sta $1C.b
L012DB4:
	lda $1E.b
	sec		; Set carry
	sbc $20.b
	cmp #$0018.w
	bcc L012DEB.b
	sta $1E.b
	lda #$0080.w
	sec		; Set carry
	sbc $1C.b
	tax
	lda $22.b
	sta $00.b
	lda #$000A.w
	sta $09A8.w
	lda $98.b
	asl A
	tay
	lda #$3000.w
	cpy $C0.b
	bcc L012DDF.b
	lda #$2000.w
L012DDF:
	ldy $1E.b
	jsl L001662.l
	lda #$0002.w
	sta $09A8.w
L012DEB:
	rts

L012DEC:
	sec		; Set carry
	sbc #$0008.w
	sta $22.b
	lda $1A10.w,X
	sta $10.b
	lda $1A22.w,X
	sta $12.b
	lda $847A.w,Y
	sta $1E.b
	lda $11DF.w,X
	sec		; Set carry
	sbc $11DF.w
	tax
	lda $843E.w,Y
	jsr L013321.w
	clc		; Clear carry
	adc #$00D0.w
	tax
	lda $22.b
	sta $00.b
	lda #$2000.w
	ldy $1E.b
	jsl L00179B.l
	lda $0964.w
	and #$0020.w
	beq L012E2C.b
	lda #$000A.w
L012E2C:
	clc		; Clear carry
	adc #$0014.w
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda #$2000.w
	jsl L00179B.l
	rts

	plp		; 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $46.b		; 00 46
	brk $3C.b		; 00 3C
	brk $32.b		; 00 32
	.db $00		; Opcode overrunning section
L012E50:
	sec		; Set carry
	sbc #$0008.w
	sta $22.b
	lda $1A10.w,X
	sta $10.b
	lda $1A22.w,X
	sta $12.b
	lda $847A.w,Y
	sta $1E.b
	lda $11DF.w,X
	sec		; Set carry
	sbc $11DF.w
	tax
	lda $843E.w,Y
	jsr L013321.w
	clc		; Clear carry
	adc #$00D0.w
	sta $1C.b
	lda $12EA.w
	beq L012EB1.b
	lda $11CF.w
	beq L012EB1.b
	lda $12EC.w
	ldx $12EE.w
	bpl L012E8F.b
	eor #$FFFF.w
	inc A
L012E8F:
	xba
	lsr A
	lsr A
	lsr A
	lsr A
	and #$000E.w
	tax
	lda $22.b
	clc		; Clear carry
	adc $02AE40.l,X
	sta $00.b
	lda #$2000.w
	eor $02AB0A.l,X
	ldx $1C.b
	ldy $1E.b
	jsl L001662.l
	rts

L012EB1:
	lda $0964.w
	and #$0010.w
	bne L012ED8.b
	lda $1297.w
	beq L012ED8.b
	bmi L012EC5.b
	lda #$001E.w
	bra L012EC8.b
L012EC5:
	lda #$0014.w
L012EC8:
	clc		; Clear carry
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda #$2000.w
	jsl L00179B.l
L012ED8:
	lda $22.b
	and #$0001.w
	beq L012EFA.b
	lda $0964.w
	and #$0010.w
	bne L012EFA.b
	lda #$000A.w
	clc		; Clear carry
	adc $22.b
	sta $00.b
	ldx $1C.b
	ldy $1E.b
	lda #$2000.w
	jsl L00179B.l
L012EFA:
	lda $22.b
	sta $00.b
	lda #$2000.w
	ldx $1C.b
	ldy $1E.b
	jsl L00179B.l
	rts

L012F0A:
	sta $22.b
	lda #$0F80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $02A8A3.l,X
	sta $18.b
	lda $22.b
	clc		; Clear carry
	adc $1A10.w,X
	sta $00.b
	lda $847A.w,Y
	sta $1E.b
	lda $11DF.w,X
	sec		; Set carry
	sbc $11DF.w
	tax
	lda $843E.w,Y
	jsr L013321.w
	clc		; Clear carry
	adc #$00D0.w
	tax
	lda #$2000.w
	ora $18.b
	ldy $1E.b
	jsl L00179B.l
	rts

L012F48:
.ACCU 16
.INDEX 16
	rep #$30
	lda $1396.w
	sta $BA.b
	lda $11F1.w
	sta $B0.b
	ldx #$0008.w
	stx $30.b
	ldx #$0008.w
	lda #$0068.w
	bit $1CEA.w
	bmi L012F6A.b
	ldx #$0008.w
	lda #$0078.w
L012F6A:
	stx $34.b
	sta $36.b
	lda #$0078.w
	sta $32.b
	lda #$1000.w
	sta $098E.w
	lda $1191.w
	cmp #$0004.w
	bne L012FA9.b
	ldx $1197.w
	cpx #$0010.w
	beq L012FA3.b
	lda $0191D1.l,X
	sta $0C.b
	inx
	inx
	stx $1197.w
	lda #$000D.w
	sta $0E.b
	lda #$0300.w
	ldx #$0060.w
	jsl L0006ED.l
L012FA3:
	lda $1CEC.w
	bpl L012FA9.b
L012FA8:
	rts

L012FA9:
	lda $11AF.w
	bne L012FA8.b
	lda $126F.w
	sta $92.b
	lda $125D.w
	sta $90.b
	lda $11F1.w
	inc A
	sta $9A.b
	lda $129B.w
	asl A
	sta $96.b
	lda $129D.w
	asl A
	sta $94.b
	stz $98.b
	phk
	plb
L012FCE:
	ldy $92.b
	cpy $96.b
	beq L013005.b
	lda $1281.w,Y
	tax
	beq L012FFF.b
	lda $1239.w,X
	cmp $98.b
	bne L013005.b
	lda $98.b
	asl A
	tay
	lda $8312.w,Y
	cpx #$0004.w
	beq L012FFC.b
	cpx #$0002.w
	beq L012FF7.b
	jsr L012BB9.w
	bra L012FFF.b
L012FF7:
	jsr L012B1A.w
	bra L012FFF.b
L012FFC:
	jsr L0129FD.w
L012FFF:
	inc $92.b
	inc $92.b
	bra L012FCE.b
L013005:
	ldy $90.b
	bmi L013028.b
	cpy $94.b
	beq L013028.b
	lda $128B.w,Y
	tax
	lda $1239.w,X
	cmp $98.b
	bne L013028.b
	lda $98.b
	asl A
	tay
	lda $834E.w,Y
	jsr L012BB9.w
	inc $90.b
	inc $90.b
	bra L013005.b
L013028:
	lda $BA.b
	beq L01302F.b
	jmp L0130CA.w
L01302F:
	lda $9A.b
	and #$001F.w
	asl A
	asl A
	tax
	lda $12F2.w,X
	bne L01303F.b
	jmp L0130CA.w
L01303F:
	dec A
	sta $22.b
	lda $12F4.w,X
	sta $26.b
	lda $98.b
	asl A
	tay
	lda $22.b
	cmp #$0008.w
	bcs L01309E.b
	bit $1CEA.w
	bmi L013073.b
	asl A
	asl A
	adc $22.b
	sta $22.b
	adc $1CB2.w
	adc $838A.w,Y
	sta $22.b
	stz $24.b
	lda #$1280.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	bra L0130C7.b
L013073:
	cpy #$001E.w
	bcs L0130CA.b
	cmp #$0001.w
	bne L01307F.b
	stz $26.b
L01307F:
	clc		; Clear carry
	adc #$000A.w
	sta $22.b
	asl A
	asl A
	adc $22.b
	clc		; Clear carry
	adc $838A.w,Y
	sta $22.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	jsr L012CA8.w
	bra L0130CA.b
L01309E:
	ldx #$0000.w
	sbc #$0008.w
	bit #$0020.w
	beq L0130AF.b
	and #$001F.w
	ldx #$4000.w
L0130AF:
	sta $22.b
	asl A
	asl A
	adc $22.b
	stx $24.b
	clc		; Clear carry
	adc $838A.w,Y
	sta $22.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
L0130C7:
	jsr L012BE2.w
L0130CA:
	bit $1CEA.w
	bvc L0130E1.b
	lda $BA.b
	beq L0130E1.b
	lda $9A.b
	bit #$0001.w
	bne L013137.b
	and #$0002.w
	beq L01311A.b
	bra L013112.b
L0130E1:
	lda $9A.b
	bit #$0007.w
	bne L013137.b
	bit $1CEA.w
	bpl L01310D.b
	ldx $BA.b
	beq L01310D.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $98.b
	asl A
	tay
	lda $838A.w,Y
	clc		; Clear carry
	adc #$0041.w
	sta $22.b
	jsr L012D5A.w
	bra L013137.b
L01310D:
	and #$0008.w
	beq L01311A.b
L013112:
	lda $1CB6.w
	ora #$0080.w
	bra L01311D.b
L01311A:
	lda $1CB6.w
L01311D:
	sta $26.b
	stz $24.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $98.b
	asl A
	tay
	lda $838A.w,Y
	sta $22.b
	jsr L012BE2.w
L013137:
	lda $1CEA.w
	bpl L013165.b
	lda $1396.w
	bmi L013165.b
	lda $98.b
	asl A
	cmp $B8.b
	bne L013165.b
	lda #$1D80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0055.w
	sta $00.b
	ldx $139A.w
	dex
	ldy #$0018.w
	lda #$0000.w
	jsl L00179B.l
L013165:
	lda $B0.b
	inc A
	sta $B0.b
	lsr A
	and #$FFFE.w
	tax
	lda $1CEA.w
	beq L01317D.b
	lda $7E6000.l,X
	and #$8000.w
	sta $BA.b
L01317D:
	inc $9A.b
	lda $98.b
	inc A
	sta $98.b
	cmp #$001E.w
	beq L01318C.b
	jmp L012FCE.w
L01318C:
	rts

L01318D:
.ACCU 16
.INDEX 16
	rep #$30
	lda #$FFF0.w
	sta $30.b
	sta $34.b
	lda #$0016.w
	sta $32.b
	sta $36.b
	lda $1191.w
	cmp #$0003.w
	bne L0131EC.b
	lda #$D610.w
	sta $10.b
	lda #$0005.w
	sta $12.b
	lda #$003C.w
	sta $09A8.w
	lda $1197.w
	sta $00.b
	ldx #$00CE.w
	ldy #$0016.w
	lda #$2000.w
	jsl L00179B.l
	lda #$0002.w
	sta $09A8.w
	lda $1199.w
	inc A
	cmp #$0008.w
	bne L0131E8.b
	lda $1197.w
	inc A
	cmp #$0006.w
	bne L0131E2.b
	lda #$0003.w
L0131E2:
	sta $1197.w
	lda #$0000.w
L0131E8:
	sta $1199.w
	rts

L0131EC:
	lda $126F.w
	dec A
	dec A
	sta $92.b
	lda $125D.w
	dec A
	dec A
	sta $90.b
	stz $9A.b
	stz $98.b
	phk
	plb
L013200:
	ldy $90.b
	bmi L01321F.b
	lda $128B.w,Y
	tax
	lda $1239.w,X
	cmp $98.b
	bne L01321F.b
	lda $9A.b
	asl A
	tay
	lda $83C6.w,Y
.BASE $40
L423216:
.BASE $00
L013216:
	jsr L012F0A.w
	dec $90.b
	dec $90.b
	bra L013200.b
L01321F:
	ldy $92.b
	bmi L013254.b
	lda $1281.w,Y
	tax
	beq L01324E.b
	lda $1239.w,X
	cmp $98.b
	bne L013254.b
	lda $9A.b
	asl A
	tay
	lda $8402.w,Y
	cpx #$0004.w
	beq L01324B.b
	cpx #$0002.w
	beq L013246.b
	jsr L012F0A.w
	bra L01324E.b
L013246:
	jsr L012E50.w
	bra L01324E.b
L01324B:
	jsr L012DEC.w
L01324E:
	dec $92.b
	dec $92.b
	bra L01321F.b
L013254:
	inc $9A.b
	lda $98.b
	dec A
	sta $98.b
	cmp #$FFE2.w
	bne L013200.b
	rts

L013261:
	and #$03FF.w
	cmp #$0200.w
	bcc L01327A.b
	eor #$FFFF.w
	adc #$0400.w
	asl A
	tax
	lda #$0000.w
	sec		; Set carry
	sbc $008B11.l,X
	rts

L01327A:
	asl A
	tax
	lda $008B11.l,X
	rts

L013281:
	ldy #$0000.w
	sta $00.b
	txa
	bpl L01328E.b
	eor #$FFFF.w
	inc A
	iny
L01328E:
	phy
	ldy $00.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	sty WRMPYB.w		; Multplier B
	stz $08.b
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $04.b
	sty WRMPYB.w		; Multplier B
	stz $0B.b
	ldy $01.b
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $09.b
	sty WRMPYB.w		; Multplier B
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $06.b
	sty WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	sta $09.b
	clc		; Clear carry
	adc $05.b
	ply
	rts

L0132CE:
	ldy #$0000.w
	sta $00.b
	txa
	bpl L0132DB.b
	eor #$FFFF.w
	inc A
	iny
L0132DB:
	phy
	ldy $00.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	sty WRMPYB.w		; Multplier B
	stz $08.b
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $04.b
	sty WRMPYB.w		; Multplier B
	stz $0B.b
	ldy $01.b
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $09.b
	sty WRMPYB.w		; Multplier B
	xba
	sta WRMPYA.w		; Multiplicand A
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $06.b
	sty WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	sta $09.b
	clc		; Clear carry
	adc $05.b
	ply
	beq L013320.b
	eor #$FFFF.w
	inc A
L013320:
	rts

L013321:
	ldy #$0000.w
	cmp #$0000.w
	beq L01335C.b
	sta WRMPYA.w		; Multiplicand A
	txa
	beq L01335C.b
	bpl L013336.b
	eor #$FFFF.w
	inc A
	dey
L013336:
.ACCU 8
	sep #$20
	sta WRMPYB.w		; Multplier B
	stz $0A.b
	xba
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $08.b
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	iny
	bne L013356.b
	lda #$0000.w
	sec		; Set carry
	sbc RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	sec		; Set carry
	sbc $09.b
	rts

L013356:
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	clc		; Clear carry
	adc $09.b
L01335C:
	rts

L01335D:
	sta WRMPYA.w		; Multiplicand A
	txa
.ACCU 8
	sep #$20
	sta WRMPYB.w		; Multplier B
	stz $0A.b
	xba
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $08.b
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	rts

L01337A:
	sta WRMPYA.w		; Multiplicand A
	txa
.ACCU 8
	sep #$20
	sta WRMPYB.w		; Multplier B
	xba
	stz $0A.b
	stz $0B.b
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	stx $08.b
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	lda $09.b
	clc		; Clear carry
	adc $4216.w
	sta $09.b
	rts

L01339B:
	ldy #$0000.w
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	txa
	cpx #$0000.w
	bpl L0133AD.b
	eor #$FF.b
	inc A
	dey
L0133AD:
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	iny
	bne L0133BD.b
	lda #$0000.w
	sec		; Set carry
	sbc RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	rts

L0133BD:
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	rts

L0133C1:
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	txa
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	nop
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	rts

.ACCU 8
	sep #$20		; E2 20
	stx WRDIVL.w		; 8E 04 42
	sta WRDIVB.w		; 8D 06 42
.ACCU 16
	rep #$20		; C2 20
	lda #$0000.w		; A9 00 00
	sec		; 38
	cpy #$00.b		; C0 00
	brk $D0.b		; 00 D0
	asl $EA.b		; 06 EA
	nop		; EA
	lda RDDIVL.w		; AD 14 42
	rts		; 60

	nop		; EA
	sbc RDDIVL.w		; ED 14 42
	rts		; 60

L0133EF:
.ACCU 8
	sep #$20
	stx WRDIVL.w		; Dividend Low Byte
	sta WRDIVB.w		; Divisor
	phx
	plx
.ACCU 16
	rep #$20
	nop
	lda RDDIVL.w		; Quotient of Divide Result Low Byte
	rts

L013400:
	ldx #$027E.w
.ACCU 8
	sep #$20
L013405:
	stz $117D.w,X
	dex
	bpl L013405.b
.ACCU 16
	rep #$20
	rts

L01340E:
	lda #$FFFF.w
	sta $B8.b
	lda $1396.w
	sta $BA.b
	lda $117E.w
	and #$00FF.w
	clc		; Clear carry
	adc $1406.w
	sta $A4.b
	lda $11DF.w
	sec		; Set carry
	sbc #$0012.w
	sec		; Set carry
	sbc $1CC4.w
	sta $A0.b
	lda #$0080.w
	sta $A6.b
	stz $A8.b
	lda $119F.w
	beq L013444.b
	lda $11A3.w
	sta $AC.b
	bra L01344B.b
L013444:
	lda $D0.b
	clc		; Clear carry
	adc $D2.b
	sta $AC.b
L01344B:
	stz $AE.b
	stz $BE.b
	stz $C6.b
	lda $11F1.w
	sta $B0.b
	stz $20.b
	lda $AC.b
	cmp #$8000.w
	rol A
	cmp #$8000.w
	rol A
	cmp #$8000.w
	rol A
	xba
	jsr L013261.w
	clc		; Clear carry
	adc $A0.b
	sta $A0.b
	jmp L0134ED.w
L013472:
	lda $B0.b
	inc A
	sta $B0.b
	lsr A
	and #$FFFE.w
	tax
	lda #$0000.w
	sec		; Set carry
	sbc $7E2000.l,X
	and #$00FF.w
	cmp #$0080.w
	bcc L01348F.b
	ora #$FF00.w
L01348F:
	asl A
	clc		; Clear carry
	adc $AC.b
	sta $AC.b
	cmp #$8000.w
	rol A
	cmp #$8000.w
	rol A
	xba
	phx
	jsr L013261.w
	plx
	clc		; Clear carry
	adc $A0.b
	sta $A0.b
	bit $1CEA.w
	bmi L0134D5.b
	lda $7E2001.l,X
	and #$00FF.w
	cmp #$0080.w
	bcc L0134BC.b
	ora #$FF00.w
L0134BC:
	asl A
	clc		; Clear carry
	adc $AE.b
	sta $AE.b
	cmp #$8000.w
	rol A
	cmp #$8000.w
	rol A
	xba
	phx
	jsr L013261.w
	plx
	clc		; Clear carry
	adc $A4.b
	sta $A4.b
L0134D5:
	lda $1CEA.w
	beq L0134ED.b
	lda $7E6000.l,X
	and #$8000.w
	cmp $BA.b
	beq L0134ED.b
	sta $BA.b
	lda $20.b
	dec A
	dec A
	sta $B8.b
L0134ED:
	ldx $20.b
	lda $028536.l,X
	ldx $A0.b
	jsr L0132CE.w
	ldx $20.b
	cmp #$8000.w
	ror A
	adc #$0000.w
	sta $1D20.w,X
	ldx $20.b
	lda $028586.l,X
	ldx $A4.b
	jsr L0132CE.w
	ldx $20.b
	cmp #$8000.w
	ror A
	adc #$0044.w
	sta $1D5C.w,X
	cmp $A6.b
	bcs L013527.b
	sta $A6.b
	stx $A8.b
	stx $AA.b
	bra L01352B.b
L013527:
	bne L01352B.b
	stx $AA.b
L01352B:
	bit $1CEA.w
	bpl L013560.b
	lda #$0080.w
	sec		; Set carry
	sbc $1D20.w,X
	pha
	clc		; Clear carry
	adc $0284E6.l,X
	cpx #$0000.w
	beq L013550.b
	cmp $CA.b
	beq L013550.b
	bmi L013550.b
	cmp $C6.b
	bmi L013550.b
	sta $C6.b
	stx $C8.b
L013550:
	sta $CA.b
	pla
	sec		; Set carry
	sbc $0284E6.l,X
	cmp $BE.b
	bmi L013560.b
	sta $BE.b
	stx $C0.b
L013560:
	stz $1DD4.w,X
	inx
	inx
	stx $20.b
	cpx #$003C.w
	beq L01356F.b
	jmp L013472.w
L01356F:
	lda #$0000.w
	bit $1CEA.w
	bvc L01357F.b
	lda $1396.w
	beq L01357F.b
	lda #$0002.w
L01357F:
	sta $BA.b
	lda $11F1.w
	sta $B0.b
	lda #$0080.w
	sta $A6.b
	lda #$01FC.w
	clc		; Clear carry
	adc $B6.b
	tay
	ldx #$0000.w
L013595:
	stx $20.b
	lda $BA.b
	sta $BC.b
	cpx $B8.b
	bne L0135A4.b
	eor #$0002.w
	sta $BA.b
L0135A4:
	lda $1D5E.w,X
	cmp $A6.b
	bcs L0135D6.b
	lda $1D5C.w,X
	sec		; Set carry
	sbc $1D5E.w,X
	cmp #$0001.w
	bne L0135DC.b
	dec $A6.b
	lda $1D22.w,X
	sta $0200.w,Y
	lda $B0.b
	and #$0001.w
	ora $BA.b
	xba
	clc		; Clear carry
	adc $0284E8.l,X
	clc		; Clear carry
	sbc $A6.b
	sta $0202.w,Y
	dey
	dey
	dey
	dey
L0135D6:
	jmp L013737.w
L0135D9:
	jmp L0136BE.w
L0135DC:
	sta $1A.b
	sta $1DD4.w,X
.ACCU 8
	sep #$20
	lda $1204.w
	sta WRMPYA.w		; Multiplicand A
	lda $1A.b
	sta WRMPYB.w		; Multplier B
	sec		; Set carry
	nop
	nop
	nop
	sbc RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
	stz $10.b
	stz $0C.b
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $B0.b
	and #$0001.w
	ora $BC.b
	xba
	sta $16.b
	lda $1D5C.w,X
	sec		; Set carry
	sbc $A6.b
	sta $18.b
	lda $0284E6.l,X
	sta $11.b
	sec		; Set carry
	sbc $0284E8.l,X
	xba
	sta $1E.b
	lda $1D20.w,X
	sta $0D.b
	sec		; Set carry
	sbc $1D22.w,X
	bpl L0135D9.b
	eor #$FFFF.w
	inc A
	xba
	tax
	lda $1A.b
	jsr L0133EF.w
	sta $1C.b
	lsr A
	sta $00.b
	ldx $1E.b
	lda $1A.b
	jsr L0133EF.w
	sta $1E.b
	lda $18.b
	beq L013677.b
	ldx $1C.b
	jsl L0008CB.l
	lda $0C.b
	clc		; Clear carry
	adc $08.b
	sta $0C.b
	lda $0E.b
	adc $0A.b
	sta $0E.b
	lda $18.b
	ldx $1E.b
	jsl L0008CB.l
	lda $10.b
	sec		; Set carry
	sbc $08.b
	sta $10.b
	lda $12.b
	sbc $0A.b
	sta $12.b
	lda $1A.b
	sec		; Set carry
	sbc $18.b
	sta $1A.b
L013677:
	lda $10.b
	sec		; Set carry
	sbc $1E.b
	sta $10.b
	bcs L013682.b
	dec $12.b
L013682:
	lda $0C.b
	clc		; Clear carry
	adc $1C.b
	sta $0C.b
	bcc L01368D.b
	inc $0E.b
L01368D:
	dec $A6.b
	lda $0D.b
	sta $0200.w,Y
	lda $11.b
	clc		; Clear carry
	adc $16.b
	clc		; Clear carry
	sbc $A6.b
	sta $0202.w,Y
	dec $14.b
	beq L0136AE.b
L0136A3:
	dey
	dey
	dey
	dey
	dec $1A.b
	bne L013677.b
	jmp L013737.w
L0136AE:
	lda $16.b
	eor #$0100.w
	xba
	and #$FFFD.w
	ora $BA.b
	xba
	sta $16.b
	bra L0136A3.b
L0136BE:
	xba
	tax
	lda $1A.b
	jsr L0133EF.w
	sta $1C.b
	ldx $1E.b
	lda $1A.b
	jsr L0133EF.w
	sta $1E.b
	lda $18.b
	beq L013703.b
	ldx $1C.b
	jsl L0008CB.l
	lda $0C.b
	sec		; Set carry
	sbc $08.b
	sta $0C.b
	lda $0E.b
	sbc $0A.b
	sta $0E.b
	lda $18.b
	ldx $1E.b
	jsl L0008CB.l
	lda $10.b
	sec		; Set carry
	sbc $08.b
	sta $10.b
	lda $12.b
	sbc $0A.b
	sta $12.b
	lda $1A.b
	sec		; Set carry
	sbc $18.b
	sta $1A.b
L013703:
	lda $10.b
	sec		; Set carry
	sbc $1E.b
	sta $10.b
	bcs L01370E.b
	dec $12.b
L01370E:
	lda $0C.b
	sec		; Set carry
	sbc $1C.b
	sta $0C.b
	bcs L013719.b
	dec $0E.b
L013719:
	dec $A6.b
	lda $0D.b
	sta $0200.w,Y
	lda $11.b
	clc		; Clear carry
	adc $16.b
	clc		; Clear carry
	sbc $A6.b
	sta $0202.w,Y
	dec $14.b
	beq L013744.b
L01372F:
	dey
	dey
	dey
	dey
	dec $1A.b
	bne L013703.b
L013737:
	inc $B0.b
	ldx $20.b
	inx
	inx
	cpx $A8.b
	beq L013754.b
	jmp L013595.w
L013744:
	lda $16.b
	eor #$0100.w
	xba
	and #$FFFD.w
	ora $BA.b
	xba
	sta $16.b
	bra L01372F.b
L013754:
	lda $A6.b
	sec		; Set carry
	sbc $1E12.w
	bcc L013778.b
	beq L013778.b
	tax
	lda #$0000.w
	sec		; Set carry
	sbc $A6.b
L013765:
	pha
	lda #$0000.w
	sta $0200.w,Y
	pla
	sta $0202.w,Y
	inc A
	dey
	dey
	dey
	dey
	dex
	bne L013765.b
L013778:
	lda $1E10.w
	sta $1E12.w
	lda $A6.b
	sta $1E10.w
	bit $1CEA.w
	bmi L01378B.b
	jmp L013926.w
L01378B:
	lda #$0006.w
	sta $13B8.w
	ldx $B8.b
	bpl L013798.b
	jmp L0138B0.w
L013798:
	cpx #$003A.w
	bcc L0137A0.b
	jmp L0138B0.w
L0137A0:
	lda $1DD4.w,X
	beq L0137DE.b
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $1204.w
	sta WRMPYB.w		; Multplier B
	nop
	nop
	nop
	nop
	lda RDMPYH.w		; Multiplication Product or Divide Remainder High Byte
.ACCU 16
	rep #$20
	and #$00FF.w
	sta $14.b
	lda $1D5E.w,X
	clc		; Clear carry
	adc $14.b
	sta $1E.b
	asl A
	asl A
	clc		; Clear carry
	adc $B6.b
	tay
	lda $0200.w,Y
	sta $1C.b
	lda $0202.w,Y
	sec		; Set carry
	adc $1E.b
	and #$00FF.w
	sta $20.b
	bra L0137ED.b
L0137DE:
	lda $84E6.w,X
	sta $20.b
	lda $1D5C.w,X
	sta $1E.b
	lda $1D20.w,X
	sta $1C.b
L0137ED:
	lda #$0030.w
	sta $13A0.w
	lda #$0010.w
	sta $13A2.w
	lda $1E.b
	sta $139E.w
	cmp #$0078.w
	bcc L013806.b
	jmp L0138A9.w
L013806:
	sec		; Set carry
	sbc $20.b
	sta $139C.w
	lda #$0080.w
	sec		; Set carry
	sbc $1C.b
	sta $1C.b
	lda $1C.b
	sec		; Set carry
	sbc $20.b
	bpl L01381E.b
	lda #$0000.w
L01381E:
	sta $1398.w
	lda $1C.b
	clc		; Clear carry
	adc $20.b
	bpl L01382B.b
	jmp L0138DE.w
L01382B:
	cmp #$00FF.w
	bmi L013833.b
	lda #$00FF.w
L013833:
	sta $139A.w
	eor #$FFFF.w
	inc A
	sta $13B0.w
	sta $1E18.w
	ldy $1396.w
	bpl L013870.b
	lda #$0000.w
	sta $13A0.w
	lda #$0020.w
L01384E:
	sta $13A2.w
	lda #$0007.w
	sta $13B8.w
	lda #$0100.w
	sta $13B0.w
	lda #$0100.w
	sec		; Set carry
	sbc $139A.w
	sta $1E18.w
	cpx $C0.b
	bcs L01386E.b
	jmp L0138FD.w
L01386E:
	bra L013877.b
L013870:
	cpx $C0.b
	bcc L013877.b
	jmp L0138FD.w
L013877:
	lda #$0007.w
	sta $13B8.w
	lda $BE.b
	cmp #$00FF.w
	bmi L013887.b
	lda #$00FF.w
L013887:
	sec		; Set carry
	eor #$FFFF.w
	adc #$0100.w
	sta $C2.b
	ldx $C0.b
	lda $1D5C.w,X
	cmp #$0078.w
	bmi L01389D.b
	lda #$0078.w
L01389D:
	sec		; Set carry
	eor #$FFFF.w
	adc #$01CF.w
	sta $C4.b
	jmp L013926.w
L0138A9:
	bit $1396.w
	bpl L0138B5.b
	bra L0138DE.b
L0138B0:
	bit $1396.w
	bpl L0138DE.b
L0138B5:
	stz $139C.w
	lda #$0078.w
	sta $139E.w
	lda #$0030.w
	sta $13A0.w
	lda #$0010.w
	sta $13A2.w
	lda #$00FF.w
	sta $139A.w
	stz $1398.w
	lda #$FF00.w
	sta $1E18.w
	sta $13B0.w
	bra L013877.b
L0138DE:
	stz $139E.w
	stz $13B0.w
	lda $C6.b
	cmp #$00FF.w
	bmi L0138EE.b
	lda #$00FF.w
L0138EE:
	eor #$FFFF.w
	inc A
	sta $1E18.w
	ldx $C8.b
	lda $1D5C.w,X
	sta $13B2.w
L0138FD:
	lda $BE.b
	cmp #$00FF.w
	bmi L013907.b
	lda #$00FF.w
L013907:
	sec		; Set carry
	eor #$FFFF.w
	adc #$0100.w
	sta $C2.b
	ldx $C0.b
	lda $1D5C.w,X
	cmp #$0078.w
	bmi L01391D.b
	lda #$0078.w
L01391D:
	sec		; Set carry
	eor #$FFFF.w
	adc #$014F.w
	sta $C4.b
L013926:
	rts

L013927:
	lda $11DF.w
	sec		; Set carry
	sbc $1CC4.w
	pha
	tax
	lda #$001E.w
	jsl L0008FC.l
	lda $08.b
	clc		; Clear carry
	adc #$8000.w
	sta $00.b
	plx
	lda #$0002.w
	jsl L0008FC.l
	lda #$0054.w
	clc		; Clear carry
	adc $B6.b
	tay
	lda #$0015.w
	sta $04.b
	ldx #$001E.w
L013956:
	lda $01.b
	and #$00FF.w
	sec		; Set carry
	sbc #$00D0.w
	sta $0200.w,Y
	txa
	clc		; Clear carry
	sbc $04.b
	sta $0202.w,Y
	lda $00.b
	sec		; Set carry
	sbc $08.b
	sta $00.b
	dey
	dey
	dey
	dey
	dec $04.b
	dex
	dex
	cpx #$000A.w
	bcs L013956.b
	rts

L01397E:
.ACCU 16
.INDEX 16
	rep #$30
	lda $1C9C.w
	lsr A
	lsr A
	sta $10CB.w
	sta $10CB.w
	lda #$6000.w
	ldx $1388.w
	bne L013996.b
	lda #$4000.w
L013996:
	cmp $10BB.w
	beq L0139A6.b
	bcs L0139A3.b
	lda $10BB.w
	sbc #$0100.w
L0139A3:
	sta $10BB.w
L0139A6:
	lda $118B.w
	beq L0139B4.b
	dec A
	sta $118B.w
	beq L0139B4.b
	jmp L013A83.w
L0139B4:
	ldy $1191.w
	cpy #$0006.w
	beq L0139E3.b
	ldy $117D.w
	bne L0139E3.b
	lda $137C.w
	beq L0139E3.b
	lda $1CA7.w
	ldx $11CD.w
	jsr L01335D.w
	sta $14.b
	cmp $1C9C.w
	bcs L0139EA.b
	lda $1C9C.w
	sec		; Set carry
	sbc #$0100.w
	cmp $14.b
	bcs L0139F7.b
	bra L0139F5.b
L0139E3:
	lda $1C9C.w
	sta $14.b
	bra L0139FA.b
L0139EA:
	lda $1C9C.w
	clc		; Clear carry
	adc #$0100.w
	cmp $14.b
	bcc L0139F7.b
L0139F5:
	lda $14.b
L0139F7:
	sta $1C9C.w
L0139FA:
	lda $1C9C.w
	cmp #$0400.w
	bcs L013A08.b
	lda #$0400.w
	sta $1C9C.w
L013A08:
	lda $14.b
	ldx $137C.w
	ldy $1C74.w
	beq L013A6A.b
	cmp $1402.w
	bcc L013A4B.b
	cpx $13FC.w
	beq L013A83.b
	lda $137E.w
	and $1C94.w
	beq L013A83.b
L013A24:
	inx
L013A25:
	stx $137C.w
	txa
	asl A
	tax
	lda #$0014.w
	sta $118B.w
	lda $1418.w,X
	sta $1CA6.w
	lda $1426.w,X
	sta $1C9E.w
	lda $1434.w,X
	sta $1CA0.w
	bra L013A83.b
L013A45:
	dey
	sty $1189.w
	bra L013A83.b
L013A4B:
	ldy $118F.w
	cpy #$0006.w
	beq L013A83.b
	ldy $117D.w
	bne L013A83.b
	ldy $1189.w
	bne L013A45.b
	cmp $1404.w
	bcs L013A83.b
	cpx #$0002.w
	bcc L013A83.b
L013A67:
	dex
	bra L013A25.b
L013A6A:
	lda $137E.w
	bit $1C98.w
	beq L013A79.b
	cpx $13FC.w
	bne L013A24.b
	bra L013A83.b
L013A79:
	bit $1C9A.w
	beq L013A83.b
	cpx #$0000.w
	bne L013A67.b
L013A83:
	ldx $1CA2.w
	ldy $1CA4.w
	cpx $1C9E.w
	bne L013AA7.b
	cpy $1CA0.w
	bne L013A95.b
	bra L013ABE.b
L013A95:
	bcs L013AA2.b
	tya
	inc A
	inc A
L013A9A:
	sta $1CA4.w
	sta $1E2A.w
	bra L013ABE.b
L013AA2:
	tya
	dec A
	dec A
	bne L013A9A.b
L013AA7:
	cpy $1434.w
	bne L013A95.b
	txa
	cmp $1C9E.w
	bcs L013AB6.b
	inc A
	inc A
	bne L013AB8.b
L013AB6:
	dec A
	dec A
L013AB8:
	sta $1CA2.w
	sta $1E2A.w
L013ABE:
	ldx $118D.w
	lda $1C9C.w
	cmp $1400.w
	bcc L013B0F.b
	cmp $13FE.w
	bcc L013AD4.b
	lda $13FE.w
	sta $1C9C.w
L013AD4:
	ldy $1C74.w
	bne L013B15.b
	inx
	cpx #$003C.w
	bcc L013B15.b
	lda $1191.w
	beq L013AE9.b
	cmp #$0007.w
	bne L013B15.b
L013AE9:
	lda $1193.w
	bne L013AF7.b
	inc $1193.w
	dec $1C86.w
	inc $12DC.w
L013AF7:
	lda #$001B.w
	jsl L002212.l
	lda #$0003.w
	sta $1191.w
	stz $1197.w
	stz $1199.w
	inc $1195.w
	bra L013B15.b
L013B0F:
	cpx #$0000.w
	beq L013B15.b
	dex
L013B15:
	stx $118D.w
	lda $11CE.w
	and #$00FF.w
	asl A
	tax
	lda $17FE.w,X
	sta $1382.w
	lda $118B.w
	bne L013B4E.b
	lda $1191.w
	cmp #$0006.w
	beq L013B3D.b
	lda $117D.w
	bne L013B3D.b
	lda $137C.w
	bne L013B78.b
L013B3D:
	lda $137E.w
	and $1C94.w
	beq L013B4E.b
	lda $1C9C.w
	clc		; Clear carry
	adc #$0078.w
	bne L013B5D.b
L013B4E:
	lda $1C9C.w
	sec		; Set carry
	sbc #$0032.w
	cmp #$0400.w
	bcs L013B5D.b
	lda #$0400.w
L013B5D:
	sta $1C9C.w
	lda $1191.w
	cmp #$0006.w
	beq L013B75.b
	lda $117D.w
	bne L013B75.b
	lda $137E.w
	and $1C92.w
	bne L013B80.b
L013B75:
	jmp L013CD8.w
L013B78:
	lda $137E.w
	and $1C92.w
	beq L013BD1.b
L013B80:
	stz $1388.w
	stz $138A.w
	lda $1386.w
	cmp #$001E.w
	beq L013B92.b
	inc A
	sta $1386.w
L013B92:
	lda #$001E.w
	and #$FFFE.w
	tax
	lda $11CD.w
	cmp $147C.w,X
	bcc L013BCB.b
	sbc $147C.w,X
	sta $11CD.w
	cpx #$001E.w
	bne L013BC8.b
	lda #$0028.w
	jsl L0021C6.l
.ACCU 8
	sep #$20
	lda #$01.b
	sta $1069.w
.ACCU 16
	rep #$20
	lda #$5000.w
	sta $10B5.w
	lda #$000A.w
	sta $1095.w
L013BC8:
	jmp L013CD8.w
L013BCB:
	stz $11CD.w
	jmp L013CD8.w
L013BD1:
	lda $137E.w
	and $1C94.w
	bne L013BDC.b
	jmp L013C80.w
L013BDC:
	lda $12AB.w
	cmp #$0003.w
	bcc L013BE7.b
	jmp L013C7D.w
L013BE7:
	stz $138A.w
	stz $1386.w
	lda $1388.w
	cmp #$0010.w
	beq L013BF9.b
	inc A
	sta $1388.w
L013BF9:
	ldx $11CD.w
	cpx #$1400.w
	bcs L013C06.b
	ldx $1CFE.w
	bne L013C16.b
L013C06:
	lda $1C9C.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	and #$FFFE.w
	tax
	lda $14BC.w,X
	tax
L013C16:
	lda $1CA7.w
	jsl L0008CB.l
	lda $08.b
	sec		; Set carry
	sbc $1382.w
	sta $1380.w
	lda $0A.b
	sbc #$0000.w
	bcc L013C83.b
	lsr A
	ror $1380.w
	lsr A
	ror $1380.w
	lda $1388.w
	asl A
	tax
	lda $149A.w,X
	ldx $1380.w
	jsr L01335D.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	clc		; Clear carry
	adc $11CD.w
	sta $11CD.w
	cmp #$1400.w
	bcs L013C7D.b
	lda $1CB0.w
	bne L013C7D.b
	lda $137C.w
	cmp #$0001.w
	bne L013C7D.b
	lda #$001D.w
	jsl L0021C6.l
.ACCU 8
	sep #$20
	lda #$01.b
	sta $1069.w
.ACCU 16
	rep #$20
	lda #$000A.w
	sta $1095.w
	lda #$7000.w
	sta $10B5.w
L013C7D:
	jmp L013CD8.w
L013C80:
	jmp L013CA6.w
L013C83:
	lda #$0000.w
	sec		; Set carry
	sbc $1380.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	sta $14.b
	lda $11CD.w
	cmp $14.b
	bcc L013CA0.b
	sbc $14.b
	sta $11CD.w
	jmp L013CD8.w
L013CA0:
	stz $11CD.w
	jmp L013CD8.w
L013CA6:
	stz $1386.w
	stz $1388.w
	lda $138A.w
	cmp #$003C.w
	beq L013CB8.b
	inc A
	sta $138A.w
L013CB8:
	lsr A
	and #$FFFE.w
	tax
	lda $14BC.w,X
	ldx $1382.w
	jsr L01335D.w
	lsr A
	lsr A
	sta $08.b
	cmp $11CD.w
	bcs L013CA0.b
	lda $11CD.w
	sec		; Set carry
	sbc $08.b
	sta $11CD.w
L013CD8:
	rts

L013CD9:
	lda $1CEA.w
	bmi L013D2F.b
	lda $11DF.w
	beq L013CF5.b
	cmp $1CC6.w
	bne L013D2F.b
	lda $D6.b
	dec A
	bpl L013CF9.b
L013CED:
	stz $11B3.w
	inc $11B5.w
	bra L013D35.b
L013CF5:
	lda $D6.b
	bpl L013CED.b
L013CF9:
	lda $11CD.w
	beq L013D2F.b
	stz $11B5.w
	inc $11B3.w
	lda $11B3.w
	cmp #$0078.w
	bcc L013D35.b
	lda $1191.w
	bne L013D35.b
	lda #$0007.w
	sta $1191.w
	inc $11B7.w
	inc $1195.w
	lda $D6.b
	sta $11A1.w
	inc $119F.w
	lda $D0.b
	clc		; Clear carry
	adc $D2.b
	sta $11A3.w
	bra L013D35.b
L013D2F:
	stz $11B3.w
	stz $11B5.w
L013D35:
	lda $11F1.w
	lsr A
	and #$FFFE.w
	tax
	lda $7E2000.l,X
	and #$00FF.w
	cmp #$0080.w
	bcc L013D4C.b
	ora #$FF00.w
L013D4C:
	sta $CC.b
	lda $7E2001.l,X
	and #$00FF.w
	cmp #$0080.w
	bcc L013D5D.b
	ora #$FF00.w
L013D5D:
	sta $CE.b
	lda $1191.w
	bne L013D71.b
	lda $12AB.w
	cmp #$0003.w
	bcc L013D71.b
	lda #$0040.w
	bra L013D84.b
L013D71:
	lda $137E.w
	bit #$0300.w
	beq L013D7C.b
	jmp L013E01.w
L013D7C:
	lda $11CE.w
	and #$00FF.w
	beq L013DFE.b
L013D84:
	clc		; Clear carry
	adc $1390.w
	ldx $D6.b
	beq L013DB3.b
	jsr L013281.w
	lsr A
	lsr A
	ldx $CC.b
	beq L013D96.b
	lsr A
L013D96:
	dey
	beq L013DA6.b
	sec		; Set carry
	eor #$FFFF.w
	adc $D6.b
	cmp #$0020.w
	bcs L013DB1.b
	bcc L013DAE.b
L013DA6:
	clc		; Clear carry
	adc $D6.b
	cmp #$FFE0.w
	bcc L013DB1.b
L013DAE:
	lda #$0000.w
L013DB1:
	sta $D6.b
L013DB3:
	lda $1191.w
	bne L013DFE.b
	ldx $D0.b
	beq L013DFE.b
	lda $11B5.w
	cmp #$003C.w
	bcs L013DCE.b
	lda $12AB.w
	cmp #$0003.w
	bcc L013DFE.b
	bra L013DD3.b
L013DCE:
	lda #$0010.w
	bra L013DDD.b
L013DD3:
	lda $11CE.w
	and #$00FF.w
	clc		; Clear carry
	adc #$0080.w
L013DDD:
	jsr L013281.w
	lsr A
	dey
	beq L013DF1.b
	sec		; Set carry
	eor #$FFFF.w
	adc $D0.b
	cmp #$0020.w
	bcs L013DFC.b
	bcc L013DF9.b
L013DF1:
	clc		; Clear carry
	adc $D0.b
	cmp #$FFE0.w
	bcc L013DFC.b
L013DF9:
	lda #$0000.w
L013DFC:
	sta $D0.b
L013DFE:
	jmp L013E69.w
L013E01:
	bit #$0200.w
	beq L013E39.b
	lda $11CE.w
	and #$00FF.w
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	lda $0285D6.l,X
	and #$00FF.w
	ldy $CC.b
	beq L013E1D.b
	lsr A
L013E1D:
	sta $00.b
	lda $D6.b
	sec		; Set carry
	sbc $00.b
	cmp #$F801.w
	bpl L013E2C.b
	lda #$F801.w
L013E2C:
	sta $D6.b
	cmp #$0000.w
	bmi L013E36.b
	jmp L013D7C.w
L013E36:
	jmp L013E69.w
L013E39:
	lda $11CE.w
	and #$00FF.w
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	lda $0285D6.l,X
	and #$00FF.w
	ldy $CC.b
	beq L013E50.b
	lsr A
L013E50:
	sta $00.b
	lda $00.b
	clc		; Clear carry
	adc $D6.b
	cmp #$07FF.w
	bmi L013E5F.b
	lda #$07FF.w
L013E5F:
	sta $D6.b
	cmp #$0000.w
	bpl L013E69.b
	jmp L013D7C.w
L013E69:
	stz $1D04.w
	lda $1191.w
	cmp #$0006.w
	beq L013ECF.b
	lda $117D.w
	bne L013ECC.b
	lda $119F.w
	beq L013EE1.b
	lda $11A1.w
	bpl L013EA9.b
	lda $11CD.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	sta $14.b
	lda $11A3.w
	sec		; Set carry
	sbc $14.b
	cmp #$E001.w
	bpl L013E9C.b
	clc		; Clear carry
	adc #$3FFE.w
L013E9C:
	sta $11A3.w
	lda #$0000.w
	sec		; Set carry
	sbc $14.b
	sta $14.b
	bra L013EC3.b
L013EA9:
	lda $11CD.w
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	sta $14.b
	clc		; Clear carry
	adc $11A3.w
	cmp #$1FFF.w
	bmi L013EC0.b
	sec		; Set carry
	sbc #$3FFE.w
L013EC0:
	sta $11A3.w
L013EC3:
	lda $138C.w
	clc		; Clear carry
	adc $14.b
	sta $138C.w
L013ECC:
	jmp L014015.w
L013ECF:
	lda $D0.b
	clc		; Clear carry
	adc #$0080.w
	cmp #$1FFF.w
	bmi L013EDD.b
	lda #$1FFF.w
L013EDD:
	sta $D0.b
	bra L013ECC.b
L013EE1:
	lda $D6.b
	clc		; Clear carry
	adc $D4.b
	bpl L013EEC.b
	eor #$FFFF.w
	inc A
L013EEC:
	sta $DC.b
	lda $11CE.w
	and #$00FF.w
	clc		; Clear carry
	adc $1D00.w
	sta $0C.b
	lda $11CE.w
	and #$00FF.w
	asl A
	tax
	lda $DC.b
	sec		; Set carry
	sbc $15FE.w,X
	bcs L013F0D.b
	jmp L013FE0.w
L013F0D:
	ldy $119D.w
	iny
	cpy $1CFC.w
	bcs L013F1C.b
	sty $119D.w
	jmp L013FE3.w
L013F1C:
	pha
	cmp #$07FF.w
	bcc L013F25.b
	lda #$07FF.w
L013F25:
	asl A
	xba
	and #$00FF.w
	sta $1D04.w
	lda $15FE.w,X
	ldx $D4.b
	bne L013F36.b
	ldx $D6.b
L013F36:
	bpl L013F3C.b
	eor #$FFFF.w
	inc A
L013F3C:
	sta $DA.b
	lda $11CE.w
	clc		; Clear carry
	adc $1414.w
	cmp #$00FF.w
	bcc L013F4D.b
	lda #$00FF.w
L013F4D:
.ACCU 8
	sep #$20
	sta WRMPYA.w		; Multiplicand A
	lda $1D04.w
	sta WRMPYB.w		; Multplier B
.ACCU 16
	rep #$20
	nop
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	tax
	lda $1416.w
	jsr L01335D.w
	sta $1D06.w
	pla
	cmp $140A.w
	bcc L013FDB.b
	lda $D6.b
	bmi L013F96.b
	lda $D4.b
	bmi L013FBE.b
	lda $137E.w
	and #$0100.w
	beq L013FBE.b
	lda $140C.w
	ldx $0C.b
	jsr L01335D.w
	clc		; Clear carry
	adc $D4.b
	cmp $1412.w
	bcc L013F91.b
	lda $1412.w
L013F91:
	sta $D4.b
	jmp L014015.w
L013F96:
	lda $D4.b
	beq L013F9C.b
	bpl L013FBE.b
L013F9C:
	lda $137E.w
	and #$0200.w
	beq L013FBE.b
	lda $140C.w
	ldx $0C.b
	jsr L01335D.w
	eor #$FFFF.w
	adc $D4.b
	cmp $1D02.w
	bcs L013FB9.b
	lda $1D02.w
L013FB9:
	sta $D4.b
	jmp L014015.w
L013FBE:
	lda $D4.b
	beq L014015.b
	bmi L013FCE.b
	lda $137E.w
	and #$0200.w
	beq L013FF6.b
	bra L013FD6.b
L013FCE:
	lda $137E.w
	and #$0100.w
	beq L013FF6.b
L013FD6:
	lda $140E.w
	bra L013FF9.b
L013FDB:
	lsr $1D06.w
	bra L013FEA.b
L013FE0:
	stz $119D.w
L013FE3:
	lda $D6.b
	sta $DA.b
	stz $1D06.w
L013FEA:
	lda $D4.b
	beq L014015.b
	lda $11CE.w
	and #$00FF.w
	beq L014015.b
L013FF6:
	lda $1410.w
L013FF9:
	ldx $0C.b
	jsr L01335D.w
	sta $08.b
	lda $D4.b
	bmi L01400B.b
	sec		; Set carry
	sbc $08.b
	bcc L014010.b
	bra L014013.b
L01400B:
	clc		; Clear carry
	adc $08.b
	bcc L014013.b
L014010:
	lda #$0000.w
L014013:
	sta $D4.b
L014015:
	lda $0998.w
	bne L014067.b
	lda $117D.w
	bne L014043.b
	lda $D4.b
	beq L014063.b
	lda $11CD.w
	lsr A
	lsr A
	sta $14.b
	lda $D4.b
	bpl L014048.b
	eor #$FFFF.w
	inc A
	cmp $14.b
	bcc L014053.b
	lda #$0000.w
	sec		; Set carry
	sbc $14.b
	sta $D4.b
	lsr $1D06.w
	bra L014053.b
L014043:
	lda #$0000.w
	bra L014067.b
L014048:
	cmp $14.b
	bcc L014053.b
	lda $14.b
	sta $D4.b
	lsr $1D06.w
L014053:
	lda $D4.b
	bpl L01405B.b
	eor #$FFFF.w
	inc A
L01405B:
	cmp #$07FF.w
	bcc L014063.b
	lda #$07FF.w
L014063:
	asl A
	asl A
	asl A
	asl A
L014067:
	sta $10B9.w
	lda $DA.b
	ldx $1191.w
	cpx #$0006.w
	beq L014079.b
	ldx $117D.w
	beq L01407C.b
L014079:
	lda #$0000.w
L01407C:
	sec		; Set carry
	sbc $CC.b
	sec		; Set carry
	sbc $CC.b
	tax
	lda $11CE.w
	and #$00FF.w
	jsr L013321.w
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	clc		; Clear carry
	adc $D0.b
	cmp #$1FFF.w
	bmi L0140A5.b
	lda #$1FFF.w
	bra L0140AD.b
L0140A5:
	cmp #$E001.w
	bpl L0140AD.b
	lda #$E001.w
L0140AD:
	sta $D0.b
	lda $D4.b
	sta $D2.b
	clc		; Clear carry
	adc $D0.b
	bmi L0140C8.b
	cmp #$1FFF.w
	bcc L0140D5.b
	lda #$1FFF.w
	sec		; Set carry
	sbc $D0.b
	sta $D2.b
	jmp L0140D5.w
L0140C8:
	cmp #$E001.w
	bcs L0140D5.b
	lda #$E001.w
	sec		; Set carry
	sbc $D0.b
	sta $D2.b
L0140D5:
	lda $11CD.w
	cmp $1D06.w
	bcs L0140E2.b
	lda #$0000.w
	bra L0140E5.b
L0140E2:
	sbc $1D06.w
L0140E5:
	sta $11CD.w
	ldx $CC.b
	lda $11CE.w
	and #$00FF.w
	jsr L013321.w
	cmp #$8000.w
	ror A
	clc		; Clear carry
	adc $138C.w
	sta $138C.w
	rts

	rol A		; 2A
	brk $56.b		; 00 56
	ora $7C.b		; 05 7C
	asl $98.b		; 06 98
	asl A		; 0A
	rep #$0C		; C2 0C
	cpx $960E.w		; EC 0E 96
	ora $E21024.l		; 0F 24 10 E2
	bpl  18.b		; 10 12
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bit $5254.w		; 2C 54 52
	eor ($4B.b,X)		; 41 4B
	brk $E7.b		; 00 E7
	ora $42.b		; 05 42
	adc ($73.b,X)		; 61 73
	adc ($00.b,S),Y		; 73 00
	brk $DC.b		; 00 DC
	ora $00.b		; 05 00
	cmp $003C07.l,X		; DF 07 3C 00
	stx $047F.w		; 8E 7F 04
	tsb $7F8E.w		; 0C 8E 7F
	ora #$900C.w		; 09 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C07.l,X		; 7F 07 0C 8E
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0A.l,X		; 7F 0A 0C 90
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $930C08.l,X		; 7F 08 0C 93
	adc $930C06.l,X		; 7F 06 0C 93
	adc $950C04.l,X		; 7F 04 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $930C06.l,X		; 7F 06 0C 93
	adc $950C04.l,X		; 7F 04 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960604.l,X		; 7F 04 06 96
	adc $930C0A.l,X		; 7F 0A 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $900C04.l,X		; 7F 04 0C 90
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C03.l,X		; 7F 03 0C 8E
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $950C03.l,X		; 7F 03 0C 95
	adc $95180F.l,X		; 7F 0F 18 95
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $950603.l,X		; 7F 03 06 95
	adc $931211.l,X		; 7F 11 12 93
	adc $950C03.l,X		; 7F 03 0C 95
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $930C06.l,X		; 7F 06 0C 93
	adc $930C05.l,X		; 7F 05 0C 93
	adc $950C05.l,X		; 7F 05 0C 95
	adc $930C09.l,X		; 7F 09 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C06.l,X		; 7F 06 0C 95
	adc $960604.l,X		; 7F 04 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $900C09.l,X		; 7F 09 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C07.l,X		; 7F 07 0C 8E
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0A.l,X		; 7F 0A 0C 90
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $930C08.l,X		; 7F 08 0C 93
	adc $930C06.l,X		; 7F 06 0C 93
	adc $950C04.l,X		; 7F 04 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $930C06.l,X		; 7F 06 0C 93
	adc $950C04.l,X		; 7F 04 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $960604.l,X		; 7F 04 06 96
	adc $930C0A.l,X		; 7F 0A 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $900C04.l,X		; 7F 04 0C 90
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C03.l,X		; 7F 03 0C 8E
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910605.l,X		; 7F 05 06 91
	adc $900C0B.l,X		; 7F 0B 0C 90
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $950C03.l,X		; 7F 03 0C 95
	adc $95180F.l,X		; 7F 0F 18 95
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $950603.l,X		; 7F 03 06 95
	adc $931211.l,X		; 7F 11 12 93
	adc $950C03.l,X		; 7F 03 0C 95
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $930C06.l,X		; 7F 06 0C 93
	adc $930C05.l,X		; 7F 05 0C 93
	adc $950C05.l,X		; 7F 05 0C 95
	adc $930C09.l,X		; 7F 09 0C 93
	adc $960605.l,X		; 7F 05 06 96
	adc $950C06.l,X		; 7F 06 0C 95
	adc $960604.l,X		; 7F 04 06 96
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C05.l,X		; 7F 05 0C 95
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E170A.l,X		; 7F 0A 17 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8E180D.l,X		; 7F 0D 18 8E
	adc $8E190D.l,X		; 7F 0D 19 8E
	adc $8E170B.l,X		; 7F 0B 17 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910B0B.l,X		; 7F 0B 0B 91
	adc $8E0D09.l,X		; 7F 09 0D 8E
	adc $8C0B0B.l,X		; 7F 0B 0B 8C
	adc $890C0C.l,X		; 7F 0C 0C 89
	adc $89190C.l,X		; 7F 0C 19 89
	adc $89180C.l,X		; 7F 0C 18 89
	adc $89190C.l,X		; 7F 0C 19 89
	adc $870B0A.l,X		; 7F 0A 0B 87
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $89180C.l,X		; 7F 0C 18 89
	adc $870B0A.l,X		; 7F 0A 0B 87
	adc $890C0C.l,X		; 7F 0C 0C 89
	adc $8C0D0B.l,X		; 7F 0B 0D 8C
	adc $890B0B.l,X		; 7F 0B 0B 89
	adc $8C0E0D.l,X		; 7F 0D 0E 8C
	adc $8E0B0B.l,X		; 7F 0B 0B 8E
	adc $8E190B.l,X		; 7F 0B 19 8E
	adc $8E190B.l,X		; 7F 0B 19 8E
	adc $8E1609.l,X		; 7F 09 16 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E1809.l,X		; 7F 09 18 8E
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910C09.l,X		; 7F 09 0C 91
	adc $8C0B0A.l,X		; 7F 0A 0B 8C
	adc $8E0B0A.l,X		; 7F 0A 0B 8E
	adc $930D0C.l,X		; 7F 0C 0D 93
	adc $93190B.l,X		; 7F 0B 19 93
	adc $93180B.l,X		; 7F 0B 18 93
	adc $93180B.l,X		; 7F 0B 18 93
	adc $91190D.l,X		; 7F 0D 19 91
	adc $91180B.l,X		; 7F 0B 18 91
	adc $91170A.l,X		; 7F 0A 17 91
	adc $91190B.l,X		; 7F 0B 19 91
	adc $8E170A.l,X		; 7F 0A 17 8E
	adc $8E0100.l,X		; 7F 00 01 8E
	adc $8E1709.l,X		; 7F 09 17 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8E180D.l,X		; 7F 0D 18 8E
	adc $8E190D.l,X		; 7F 0D 19 8E
	adc $8E170B.l,X		; 7F 0B 17 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910B0B.l,X		; 7F 0B 0B 91
	adc $8E0D09.l,X		; 7F 09 0D 8E
	adc $8C0B0B.l,X		; 7F 0B 0B 8C
	adc $890C0C.l,X		; 7F 0C 0C 89
	adc $89190C.l,X		; 7F 0C 19 89
	adc $89180C.l,X		; 7F 0C 18 89
	adc $89190C.l,X		; 7F 0C 19 89
	adc $870B0A.l,X		; 7F 0A 0B 87
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $89180C.l,X		; 7F 0C 18 89
	adc $870B0A.l,X		; 7F 0A 0B 87
	adc $890C0C.l,X		; 7F 0C 0C 89
	adc $8C0D0B.l,X		; 7F 0B 0D 8C
	adc $890B0B.l,X		; 7F 0B 0B 89
	adc $8C0E0D.l,X		; 7F 0D 0E 8C
	adc $8E0B0B.l,X		; 7F 0B 0B 8E
	adc $8E190B.l,X		; 7F 0B 19 8E
	adc $8E190B.l,X		; 7F 0B 19 8E
	adc $8E1609.l,X		; 7F 09 16 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E1809.l,X		; 7F 09 18 8E
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0B0A.l,X		; 7F 0A 0B 8C
	adc $8E0B0A.l,X		; 7F 0A 0B 8E
	adc $930D0C.l,X		; 7F 0C 0D 93
	adc $93190B.l,X		; 7F 0B 19 93
	adc $93180B.l,X		; 7F 0B 18 93
	adc $93180B.l,X		; 7F 0B 18 93
	adc $91190D.l,X		; 7F 0D 19 91
	adc $91180B.l,X		; 7F 0B 18 91
	adc $91170A.l,X		; 7F 0A 17 91
	adc $91190B.l,X		; 7F 0B 19 91
	adc $8E170A.l,X		; 7F 0A 17 8E
	adc $8E0100.l,X		; 7F 00 01 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $890C05.l,X		; 7F 05 0C 89
	adc $DB0C05.l,X		; 7F 05 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	brk $01.b		; 00 01
	rol $54.b		; 26 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl A		; 0A
	eor $7465.w		; 4D 65 74
	adc ($6C.b,X)		; 61 6C
	eor $7475.w		; 4D 75 74
	adc $00.b		; 65 00
	brk $DC.b		; 00 DC
	asl A		; 0A
	brk $DF.b		; 00 DF
	ora [$32.b]		; 07 32
	asl $A6.b,X		; 16 A6
	adc $A6240F.l,X		; 7F 0F 24 A6
	adc $A60B0F.l,X		; 7F 0F 0B A6
	adc $A60D03.l,X		; 7F 03 0D A6
	adc $A62402.l,X		; 7F 02 24 A6
	adc $A6240F.l,X		; 7F 0F 24 A6
	adc $A60B0F.l,X		; 7F 0F 0B A6
	adc $A60D03.l,X		; 7F 03 0D A6
	adc $AB2402.l,X		; 7F 02 24 AB
	adc $AB240F.l,X		; 7F 0F 24 AB
	adc $AB0B0F.l,X		; 7F 0F 0B AB
	adc $AB0C03.l,X		; 7F 03 0C AB
	adc $AB2503.l,X		; 7F 03 25 AB
	adc $AB240F.l,X		; 7F 0F 24 AB
	adc $AB0C0F.l,X		; 7F 0F 0C AB
	adc $AB0B02.l,X		; 7F 02 0B AB
	adc $A62503.l,X		; 7F 03 25 A6
	adc $A6260F.l,X		; 7F 0F 26 A6
	adc $A60A0F.l,X		; 7F 0F 0A A6
	adc $A60C04.l,X		; 7F 04 0C A6
	adc $A62402.l,X		; 7F 02 24 A6
	adc $A6240F.l,X		; 7F 0F 24 A6
	adc $A60B0F.l,X		; 7F 0F 0B A6
	adc $A60C03.l,X		; 7F 03 0C A6
	adc $AD2502.l,X		; 7F 02 25 AD
	adc $AD230F.l,X		; 7F 0F 23 AD
	adc $AD0C0F.l,X		; 7F 0F 0C AD
	adc $AD0C02.l,X		; 7F 02 0C AD
	adc $AB2502.l,X		; 7F 02 25 AB
	adc $AB240F.l,X		; 7F 0F 24 AB
	adc $AB0C0F.l,X		; 7F 0F 0C AB
	adc $AB0C02.l,X		; 7F 02 0C AB
	adc $A64903.l,X		; 7F 03 49 A6
	adc $A60C0F.l,X		; 7F 0F 0C A6
	adc $A60C03.l,X		; 7F 03 0C A6
	adc $A62403.l,X		; 7F 03 24 A6
	adc $A6230F.l,X		; 7F 0F 23 A6
	adc $A60C0F.l,X		; 7F 0F 0C A6
	adc $A60C03.l,X		; 7F 03 0C A6
	adc $AB2503.l,X		; 7F 03 25 AB
	adc $AB240F.l,X		; 7F 0F 24 AB
	adc $AB0B0F.l,X		; 7F 0F 0B AB
	adc $AB0D03.l,X		; 7F 03 0D AB
	adc $AB2502.l,X		; 7F 02 25 AB
	adc $AB230F.l,X		; 7F 0F 23 AB
	adc $AB0C0F.l,X		; 7F 0F 0C AB
	adc $AB0C02.l,X		; 7F 02 0C AB
	adc $A62403.l,X		; 7F 03 24 A6
	adc $A6230F.l,X		; 7F 0F 23 A6
	adc $A60B0F.l,X		; 7F 0F 0B A6
	adc $A60C03.l,X		; 7F 03 0C A6
	adc $A62503.l,X		; 7F 03 25 A6
	adc $A6240F.l,X		; 7F 0F 24 A6
	adc $A60C0F.l,X		; 7F 0F 0C A6
	adc $A60C03.l,X		; 7F 03 0C A6
	adc $AD2403.l,X		; 7F 03 24 AD
	adc $AD240F.l,X		; 7F 0F 24 AD
	adc $AD0C0F.l,X		; 7F 0F 0C AD
	adc $AD0D02.l,X		; 7F 02 0D AD
	adc $AB2302.l,X		; 7F 02 23 AB
	adc $AB250F.l,X		; 7F 0F 25 AB
	adc $AB0B0F.l,X		; 7F 0F 0B AB
	adc $AB0C03.l,X		; 7F 03 0C AB
	adc $0E9503.l,X		; 7F 03 95 0E
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $040000.l,X		; 7F 00 00 04
	trb $5254.w		; 1C 54 52
	eor ($4B.b,X)		; 41 4B
	brk $E7.b		; 00 E7
	ora $4C.b		; 05 4C
	adc $61.b		; 65 61
	stz $00.b		; 64 00
	brk $DC.b		; 00 DC
	ora [$00.b]		; 07 00
	cmp $002807.l,X		; DF 07 28 00
	lda $237F.w		; AD 7F 23
	and $AE.b,S		; 23 AE
	adc $AB0706.l,X		; 7F 06 07 AB
	adc $AD0606.l,X		; 7F 06 06 AD
	adc $AB5251.l,X		; 7F 51 52 AB
	adc $AD0605.l,X		; 7F 05 06 AD
	adc $AE0706.l,X		; 7F 06 07 AE
	adc $AB1818.l,X		; 7F 18 18 AB
	adc $AE1615.l,X		; 7F 15 16 AE
	adc $B05655.l,X		; 7F 55 56 B0
	adc $B20B0B.l,X		; 7F 0B 0B B2
	adc $AD2424.l,X		; 7F 24 24 AD
	adc $AE0D0D.l,X		; 7F 0D 0D AE
	adc $B01817.l,X		; 7F 17 18 B0
	adc $AD1716.l,X		; 7F 16 17 AD
	adc $AE5251.l,X		; 7F 51 52 AE
	adc $AB0706.l,X		; 7F 06 07 AB
	adc $AD0707.l,X		; 7F 07 07 AD
	adc $AB3E3D.l,X		; 7F 3D 3E AB
	adc $AD0505.l,X		; 7F 05 05 AD
	adc $AE0605.l,X		; 7F 05 06 AE
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $B00D0C.l,X		; 7F 0C 0D B0
	adc $B22222.l,X		; 7F 22 22 B2
	adc $B40C0B.l,X		; 7F 0B 0C B4
	adc $B5322D.l,X		; 7F 2D 32 B5
	adc $B22221.l,X		; 7F 21 22 B2
	adc $AE2322.l,X		; 7F 22 23 AE
	adc $AD1818.l,X		; 7F 18 18 AD
	adc $AE5554.l,X		; 7F 54 55 AE
	adc $AB0706.l,X		; 7F 06 07 AB
	adc $AD0706.l,X		; 7F 06 07 AD
	adc $AE3B3A.l,X		; 7F 3A 3B AE
	adc $AB0B0B.l,X		; 7F 0B 0B AB
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $AE0D0D.l,X		; 7F 0D 0D AE
	adc $B04040.l,X		; 7F 40 40 B0
	adc $B21212.l,X		; 7F 12 12 B2
	adc $AE0E0D.l,X		; 7F 0D 0E AE
	adc $AB2424.l,X		; 7F 24 24 AB
	adc $AE0C0B.l,X		; 7F 0B 0C AE
	adc $AB0D0D.l,X		; 7F 0D 0D AB
	adc $AE0B0B.l,X		; 7F 0B 0B AE
	adc $B00C0B.l,X		; 7F 0B 0C B0
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $AB5453.l,X		; 7F 53 54 AB
	adc $AE0706.l,X		; 7F 06 07 AE
	adc $AD0606.l,X		; 7F 06 06 AD
	adc $AE3C3B.l,X		; 7F 3B 3C AE
	adc $AB0B0B.l,X		; 7F 0B 0B AB
	adc $AE0D0C.l,X		; 7F 0C 0D AE
	adc $B00B0A.l,X		; 7F 0A 0B B0
	adc $AE0B0B.l,X		; 7F 0B 0B AE
	adc $B02524.l,X		; 7F 24 25 B0
	adc $B21817.l,X		; 7F 17 18 B2
	adc $B40C0C.l,X		; 7F 0C 0C B4
	adc $B50C07.l,X		; 7F 07 0C B5
	adc $B41111.l,X		; 7F 11 11 B4
	adc $B01312.l,X		; 7F 12 13 B0
	adc $B20C0C.l,X		; 7F 0C 0C B2
	adc $AD2423.l,X		; 7F 23 24 AD
	adc $DC0C0D.l,X		; 7F 0D 0C DC
	asl $00.b		; 06 00
	cmp $013207.l,X		; DF 07 32 01
	lda #$0B7F.w		; A9 7F 0B
	tsb $7FAD.w		; 0C AD 7F
	ora $0C.b		; 05 0C
	lda #$0A7F.w		; A9 7F 0A
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$0A7F.w		; A9 7F 0A
	tsb $7FAD.w		; 0C AD 7F
	asl $0C.b		; 06 0C
	lda #$097F.w		; A9 7F 09
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$077F.w		; A9 7F 07
	tsb $7FAD.w		; 0C AD 7F
	asl $0C.b		; 06 0C
	lda #$077F.w		; A9 7F 07
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$067F.w		; A9 7F 06
	tsb $7FAD.w		; 0C AD 7F
	ora [$0C.b]		; 07 0C
	lda #$087F.w		; A9 7F 08
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	tay		; A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AB0C07.l,X		; 7F 07 0C AB
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C07.l,X		; 7F 07 0C AB
	adc $A80C08.l,X		; 7F 08 0C A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C06.l,X		; 7F 06 0C AB
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AD0C06.l,X		; 7F 06 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C0A.l,X		; 7F 0A 0C AB
	adc $A60C07.l,X		; 7F 07 0C A6
	adc $AD0C07.l,X		; 7F 07 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C06.l,X		; 7F 06 0C AB
	adc $A60C07.l,X		; 7F 07 0C A6
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C06.l,X		; 7F 06 0C AB
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AD0C05.l,X		; 7F 05 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C05.l,X		; 7F 05 0C AB
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AD0C04.l,X		; 7F 04 0C AD
	adc $A60C05.l,X		; 7F 05 0C A6
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $DC0B06.l,X		; 7F 06 0B DC
	ora [$00.b]		; 07 00
	cmp $012307.l,X		; DF 07 23 01
	lda ($7F.b)		; B2 7F
	and $25.b		; 25 25
	bcs 127.b		; B0 7F
	tsb $04.b		; 04 04
	lda $067F.w		; AD 7F 06
	ora [$B2.b]		; 07 B2
	adc $B03C3C.l,X		; 7F 3C 3C B0
	adc $AD0504.l,X		; 7F 04 05 AD
	adc $B20605.l,X		; 7F 05 06 B2
	adc $B00E0D.l,X		; 7F 0D 0E B0
	adc $AD0A0A.l,X		; 7F 0A 0A AD
	adc $B00D0C.l,X		; 7F 0C 0D B0
	adc $B20C0A.l,X		; 7F 0A 0C B2
	adc $B00B0B.l,X		; 7F 0B 0B B0
	adc $B40C0A.l,X		; 7F 0A 0C B4
	adc $B02524.l,X		; 7F 24 25 B0
	adc $AD0B0A.l,X		; 7F 0A 0B AD
	adc $AB2424.l,X		; 7F 24 24 AB
	adc $AD0606.l,X		; 7F 06 06 AD
	adc $B00504.l,X		; 7F 04 05 B0
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $B00505.l,X		; 7F 05 05 B0
	adc $B20807.l,X		; 7F 07 08 B2
	adc $B00C0B.l,X		; 7F 0B 0C B0
	adc $B20606.l,X		; 7F 06 06 B2
	adc $B40605.l,X		; 7F 05 06 B4
	adc $B00D0C.l,X		; 7F 0C 0D B0
	adc $B20A0A.l,X		; 7F 0A 0A B2
	adc $B40C0B.l,X		; 7F 0B 0C B4
	adc $B20D0C.l,X		; 7F 0C 0D B2
	adc $B02322.l,X		; 7F 22 23 B0
	adc $AD0605.l,X		; 7F 05 06 AD
	adc $B20605.l,X		; 7F 05 06 B2
	adc $B03D3D.l,X		; 7F 3D 3D B0
	adc $B20504.l,X		; 7F 04 05 B2
	adc $B30606.l,X		; 7F 06 06 B3
	adc $B40100.l,X		; 7F 00 01 B4
	adc $B20B0B.l,X		; 7F 0B 0B B2
	adc $B50C0B.l,X		; 7F 0B 0C B5
	adc $B40D0C.l,X		; 7F 0C 0D B4
	adc $B00C0C.l,X		; 7F 0C 0C B0
	adc $B20C0B.l,X		; 7F 0B 0C B2
	adc $B70C0C.l,X		; 7F 0C 0C B7
	adc $B42322.l,X		; 7F 22 23 B4
	adc $B22525.l,X		; 7F 25 25 B2
	adc $B51715.l,X		; 7F 15 17 B5
	adc $B41918.l,X		; 7F 18 19 B4
	adc $B01818.l,X		; 7F 18 18 B0
	adc $B20C0A.l,X		; 7F 0A 0C B2
	adc $AD1817.l,X		; 7F 17 18 AD
	adc $B20B0A.l,X		; 7F 0A 0B B2
	adc $B02424.l,X		; 7F 24 24 B0
	adc $AD0606.l,X		; 7F 06 06 AD
	adc $B20706.l,X		; 7F 06 07 B2
	adc $B03C3C.l,X		; 7F 3C 3C B0
	adc $B20605.l,X		; 7F 05 06 B2
	adc $B40707.l,X		; 7F 07 07 B4
	adc $B50C0B.l,X		; 7F 0B 0C B5
	adc $B40C0A.l,X		; 7F 0A 0C B4
	adc $B51717.l,X		; 7F 17 17 B5
	adc $B71716.l,X		; 7F 16 17 B7
	adc $B91817.l,X		; 7F 17 18 B9
	adc $B40C0B.l,X		; 7F 0B 0C B4
	adc $B03130.l,X		; 7F 30 31 B0
	adc $B20706.l,X		; 7F 06 07 B2
	adc $B40606.l,X		; 7F 06 06 B4
	adc $B02322.l,X		; 7F 22 23 B0
	adc $B20A08.l,X		; 7F 08 0A B2
	adc $B50D0C.l,X		; 7F 0C 0D B5
	adc $B40E0D.l,X		; 7F 0D 0E B4
	adc $B00C0B.l,X		; 7F 0B 0C B0
	adc $B20D0D.l,X		; 7F 0D 0D B2
	adc $B02020.l,X		; 7F 20 20 B0
	adc $AD0706.l,X		; 7F 06 07 AD
	adc $B20606.l,X		; 7F 06 06 B2
	adc $AD3D3C.l,X		; 7F 3C 3D AD
	adc $B00504.l,X		; 7F 04 05 B0
	adc $B20504.l,X		; 7F 04 05 B2
	adc $B00E0E.l,X		; 7F 0E 0E B0
	adc $B20C0B.l,X		; 7F 0B 0C B2
	adc $B40B0B.l,X		; 7F 0B 0B B4
	adc $B50D0C.l,X		; 7F 0C 0D B5
	adc $B40C0A.l,X		; 7F 0A 0C B4
	adc $B70A0A.l,X		; 7F 0A 0A B7
	adc $B51817.l,X		; 7F 17 18 B5
	adc $B40C0C.l,X		; 7F 0C 0C B4
	adc $B21E1E.l,X		; 7F 1E 1E B2
	adc $B40807.l,X		; 7F 07 08 B4
	adc $B50B0B.l,X		; 7F 0B 0B B5
	adc $B90C0B.l,X		; 7F 0B 0C B9
	adc $B71813.l,X		; 7F 13 18 B7
	adc $B51918.l,X		; 7F 18 19 B5
	adc $B40C0B.l,X		; 7F 0B 0C B4
	adc $B01818.l,X		; 7F 18 18 B0
	adc $DC0C0B.l,X		; 7F 0B 0C DC
	asl $00.b		; 06 00
	cmp $013207.l,X		; DF 07 32 01
	lda #$0B7F.w		; A9 7F 0B
	tsb $7FAD.w		; 0C AD 7F
	ora $0C.b		; 05 0C
	lda #$0A7F.w		; A9 7F 0A
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$0A7F.w		; A9 7F 0A
	tsb $7FAD.w		; 0C AD 7F
	asl $0C.b		; 06 0C
	lda #$097F.w		; A9 7F 09
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$077F.w		; A9 7F 07
	tsb $7FAD.w		; 0C AD 7F
	asl $0C.b		; 06 0C
	lda #$077F.w		; A9 7F 07
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	lda #$0B7F.w		; A9 7F 0B
	tsb $7FAD.w		; 0C AD 7F
	ora [$0C.b]		; 07 0C
	lda #$087F.w		; A9 7F 08
	tsb $7FAB.w		; 0C AB 7F
	asl $0C.b		; 06 0C
	tay		; A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AB0C07.l,X		; 7F 07 0C AB
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C07.l,X		; 7F 07 0C AB
	adc $A80C08.l,X		; 7F 08 0C A8
	adc $AD0C06.l,X		; 7F 06 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $A80C06.l,X		; 7F 06 0C A8
	adc $AD0C06.l,X		; 7F 06 0C AD
	adc $A80C07.l,X		; 7F 07 0C A8
	adc $AB0C0A.l,X		; 7F 0A 0C AB
	adc $A60C07.l,X		; 7F 07 0C A6
	adc $AD0C07.l,X		; 7F 07 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C06.l,X		; 7F 06 0C AB
	adc $A60C07.l,X		; 7F 07 0C A6
	adc $AD0C06.l,X		; 7F 06 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C06.l,X		; 7F 06 0C AB
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AB0C05.l,X		; 7F 05 0C AB
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $AD0C0A.l,X		; 7F 0A 0C AD
	adc $A60C05.l,X		; 7F 05 0C A6
	adc $AB0C05.l,X		; 7F 05 0C AB
	adc $DB0C06.l,X		; 7F 06 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $2A.b		; 02 2A
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora #$6843.w		; 09 43 68
	adc $736472.l		; 6F 72 64 73
	jsr $0032.w		; 20 32 00
	bcc  63.b		; 90 3F
	jmp.w [$000C]		; DC 0C 00
	cmp $013207.l,X		; DF 07 32 01
	lda #$067F.w		; A9 7F 06
	phd		; 0B
	lda #$067F.w		; A9 7F 06
	tsb $7FA9.w		; 0C A9 7F
	asl $0C.b		; 06 0C
	lda #$057F.w		; A9 7F 05
	tsb $7FA9.w		; 0C A9 7F
	ora $0C.b		; 05 0C
	lda #$047F.w		; A9 7F 04
	tsb $7FA9.w		; 0C A9 7F
	tsb $0C.b		; 04 0C
	lda #$037F.w		; A9 7F 03
	tsb $7FA9.w		; 0C A9 7F
	tsb $0C.b		; 04 0C
	lda #$047F.w		; A9 7F 04
	tsb $7FA9.w		; 0C A9 7F
	tsb $0C.b		; 04 0C
	lda #$047F.w		; A9 7F 04
	tsb $7FA9.w		; 0C A9 7F
	tsb $0C.b		; 04 0C
	lda #$047F.w		; A9 7F 04
	tsb $7FA9.w		; 0C A9 7F
	tsb $0C.b		; 04 0C
	lda #$047F.w		; A9 7F 04
	tsb $7FA8.w		; 0C A8 7F
	tsb $0C.b		; 04 0C
	tay		; A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A80C02.l,X		; 7F 02 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C09.l,X		; 7F 09 0C A9
	adc $A90C06.l,X		; 7F 06 0C A9
	adc $A90C06.l,X		; 7F 06 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C02.l,X		; 7F 02 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A80C02.l,X		; 7F 02 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C04.l,X		; 7F 04 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A80C03.l,X		; 7F 03 0C A8
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A90C03.l,X		; 7F 03 0C A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $4D8404.l,X		; 7F 04 84 4D
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	cop $2A.b		; 02 2A
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora #$6843.w		; 09 43 68
	adc $736472.l		; 6F 72 64 73
	jsr $0033.w		; 20 33 00
	bcc  63.b		; 90 3F
	jmp.w [$0008]		; DC 08 00
	cmp $013207.l,X		; DF 07 32 01
	ldx $7F.b		; A6 7F
	tsb $0A.b		; 04 0A
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	asl $0C.b		; 06 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	asl $0C.b		; 06 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	asl $0C.b		; 06 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	ora $0C.b		; 05 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldx $7F.b		; A6 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	cop $0C.b		; 02 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $0C.b		; 04 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	ora $0C.b,S		; 03 0C
	ldy $7F.b		; A4 7F
	tsb $84.b		; 04 84
	lsr $00DB.w		; 4E DB 00
	cmp $0000.w,Y		; D9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $AA.b		; 00 AA
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl A		; 0A
	bvc 111.b		; 50 6F
	adc [$65.b],Y		; 77 65
	adc ($63.b)		; 72 63
	pla		; 68
	adc ($64.b)		; 72 64
	brk $00.b		; 00 00
	jmp.w [$000B]		; DC 0B 00
	cmp $003207.l,X		; DF 07 32 00
	ldx $7F.b		; A6 7F
	asl $A623.w		; 0E 23 A6
	adc $A63C0E.l,X		; 7F 0E 3C A6
	adc $A6240E.l,X		; 7F 0E 24 A6
	adc $AB3A0D.l,X		; 7F 0D 3A AB
	adc $AB250F.l,X		; 7F 0F 25 AB
	adc $AB3B0E.l,X		; 7F 0E 3B AB
	adc $AB250D.l,X		; 7F 0D 25 AB
	adc $A63B0D.l,X		; 7F 0D 3B A6
	adc $A6260E.l,X		; 7F 0E 26 A6
	adc $A63B0E.l,X		; 7F 0E 3B A6
	adc $A6250D.l,X		; 7F 0D 25 A6
	adc $AD3B0D.l,X		; 7F 0D 3B AD
	adc $AD240E.l,X		; 7F 0E 24 AD
	adc $AB3C0D.l,X		; 7F 0D 3C AB
	adc $AB240E.l,X		; 7F 0E 24 AB
	adc $A63C0D.l,X		; 7F 0D 3C A6
	adc $A6250D.l,X		; 7F 0D 25 A6
	adc $A63C0D.l,X		; 7F 0D 3C A6
	adc $A6240D.l,X		; 7F 0D 24 A6
	adc $AB3B0D.l,X		; 7F 0D 3B AB
	adc $AB250D.l,X		; 7F 0D 25 AB
	adc $AB3B0D.l,X		; 7F 0D 3B AB
	adc $AB260D.l,X		; 7F 0D 26 AB
	adc $A63B0B.l,X		; 7F 0B 3B A6
	adc $A6230C.l,X		; 7F 0C 23 A6
	adc $A63B0E.l,X		; 7F 0E 3B A6
	adc $A6250D.l,X		; 7F 0D 25 A6
	adc $AD3C0F.l,X		; 7F 0F 3C AD
	adc $AD230D.l,X		; 7F 0D 23 AD
	adc $AB3D0E.l,X		; 7F 0E 3D AB
	adc $AB240E.l,X		; 7F 0E 24 AB
	adc $3E950D.l,X		; 7F 0D 95 3E
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx $00.b		; A6 00
	brk $00.b		; 00 00
	stx $5254.w		; 8E 54 52
	eor ($4B.b,X)		; 41 4B
	brk $E7.b		; 00 E7
	ora $744D.w		; 0D 4D 74
	jmp ($754D.w)		; 6C 4D 75
	stz $65.b,X		; 74 65
	jsr $6843.w		; 20 43 68
	adc ($73.b)		; 72 73
	brk $8C.b		; 00 8C
	ora [$DC.b],Y		; 17 DC
	asl A		; 0A
	brk $DF.b		; 00 DF
	ora [$32.b]		; 07 32
	ora ($A6.b,X)		; 01 A6
	adc $A6240F.l,X		; 7F 0F 24 A6
	adc $A6250F.l,X		; 7F 0F 25 A6
	adc $A6230F.l,X		; 7F 0F 23 A6
	adc $A2540F.l,X		; 7F 0F 54 A2
	adc $A2240F.l,X		; 7F 0F 24 A2
	adc $A2250F.l,X		; 7F 0F 25 A2
	adc $A2240F.l,X		; 7F 0F 24 A2
	adc $A1520F.l,X		; 7F 0F 52 A1
	adc $A1260F.l,X		; 7F 0F 26 A1
	adc $A1240F.l,X		; 7F 0F 24 A1
	adc $A1220F.l,X		; 7F 0F 22 A1
	adc $558C0F.l,X		; 7F 0F 8C 55
	ldx $7F.b		; A6 7F
	ora $7FA624.l		; 0F 24 A6 7F
	ora $7FA625.l		; 0F 25 A6 7F
	ora $7FA623.l		; 0F 23 A6 7F
	ora $7FA254.l		; 0F 54 A2 7F
	ora $7FA224.l		; 0F 24 A2 7F
	ora $7FA225.l		; 0F 25 A2 7F
	ora $7FA224.l		; 0F 24 A2 7F
	ora $7FA152.l		; 0F 52 A1 7F
	ora $7FA126.l		; 0F 26 A1 7F
	ora $7FA124.l		; 0F 24 A1 7F
	ora $7FA122.l		; 0F 22 A1 7F
	ora $00DB3D.l		; 0F 3D DB 00
	cmp $0000.w,Y		; D9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $0000.w		; AD 00 00
	brk $BE.b		; 00 BE
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $7750.w		; 0D 50 77
	adc ($63.b)		; 72 63
	pla		; 68
	adc ($64.b)		; 72 64
	jsr $6843.w		; 20 43 68
	adc ($73.b)		; 72 73
	brk $8B.b		; 00 8B
	adc $000BDC.l,X		; 7F DC 0B 00
	cmp $003207.l,X		; DF 07 32 00
	ldx $7F.b		; A6 7F
	ora ($25.b),Y		; 11 25
	ldx $7F.b		; A6 7F
	ora ($25.b),Y		; 11 25
	ldx $7F.b		; A6 7F
	ora ($23.b),Y		; 11 23
	ldx $7F.b		; A6 7F
	ora $7FA624.l		; 0F 24 A6 7F
	ora $7FA618.l		; 0F 18 A6 7F
	ora $A217.w		; 0D 17 A2
	adc $A22410.l,X		; 7F 10 24 A2
	adc $A22512.l,X		; 7F 12 25 A2
	adc $A22412.l,X		; 7F 12 24 A2
	adc $A22412.l,X		; 7F 12 24 A2
	adc $A2170F.l,X		; 7F 0F 17 A2
	adc $A1180D.l,X		; 7F 0D 18 A1
	adc $A1240F.l,X		; 7F 0F 24 A1
	adc $A12512.l,X		; 7F 12 25 A1
	adc $A12411.l,X		; 7F 11 24 A1
	adc $A12210.l,X		; 7F 10 22 A1
	adc $A1190F.l,X		; 7F 0F 19 A1
	adc $188C0F.l,X		; 7F 0F 8C 18
	ldx $7F.b		; A6 7F
	ora ($25.b),Y		; 11 25
	ldx $7F.b		; A6 7F
	ora ($25.b),Y		; 11 25
	ldx $7F.b		; A6 7F
	ora ($23.b),Y		; 11 23
	ldx $7F.b		; A6 7F
	ora $7FA624.l		; 0F 24 A6 7F
	ora $7FA618.l		; 0F 18 A6 7F
	ora $A217.w		; 0D 17 A2
	adc $A22410.l,X		; 7F 10 24 A2
	adc $A22512.l,X		; 7F 12 25 A2
	adc $A22412.l,X		; 7F 12 24 A2
	adc $A22412.l,X		; 7F 12 24 A2
	adc $A2170F.l,X		; 7F 0F 17 A2
	adc $A1180D.l,X		; 7F 0D 18 A1
	adc $A1240F.l,X		; 7F 0F 24 A1
	adc $A12512.l,X		; 7F 12 25 A1
	adc $A12411.l,X		; 7F 11 24 A1
	adc $A12210.l,X		; 7F 10 22 A1
	adc $A1190F.l,X		; 7F 0F 19 A1
	adc $DB190F.l,X		; 7F 0F 19 DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx $00.b		; A6 00
	brk $02.b		; 00 02
	bmi  84.b		; 30 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl $53.b		; 06 53
	ror $7261.w		; 6E 61 72
	adc $00.b		; 65 00
	brk $DC.b		; 00 DC
	ora ($00.b,X)		; 01 00
	cmp $173C07.l,X		; DF 07 3C 17
	stx $047F.w		; 8E 7F 04
	bmi -114.b		; 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2401.l,X		; 7F 01 24 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E1E04.l,X		; 7F 04 1E 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2401.l,X		; 7F 01 24 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E1E04.l,X		; 7F 04 1E 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2401.l,X		; 7F 01 24 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E1E04.l,X		; 7F 04 1E 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2401.l,X		; 7F 01 24 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E1E04.l,X		; 7F 04 1E 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2401.l,X		; 7F 01 24 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0602.l,X		; 7F 02 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E1E04.l,X		; 7F 04 1E 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3004.l,X		; 7F 04 30 8E
	adc $8E3003.l,X		; 7F 03 30 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E1803.l,X		; 7F 03 18 8E
	adc $8E0604.l,X		; 7F 04 06 8E
	adc $DB0705.l,X		; 7F 05 07 DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $94.b,S		; 03 94
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $4B.b		; 05 4B
	adc #$6B63.w		; 69 63 6B
	brk $00.b		; 00 00
	jmp.w [$0000]		; DC 00 00
	cmp $001E07.l,X		; DF 07 1E 00
	sty $087F.w		; 8C 7F 08
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	tsb $18.b		; 04 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora ($30.b,X)		; 01 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	tsb $18.b		; 04 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora ($30.b,X)		; 01 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	tsb $18.b		; 04 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora ($30.b,X)		; 01 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	tsb $18.b		; 04 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora ($30.b,X)		; 01 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	tsb $18.b		; 04 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $037F.w		; 8C 7F 03
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	ora ($30.b,X)		; 01 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	asl $18.b		; 06 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $047F.w		; 8C 7F 04
	clc		; 18
	sty $037F.w		; 8C 7F 03
	tsb $7F8C.w		; 0C 8C 7F
	ora $0C.b,S		; 03 0C
	sty $027F.w		; 8C 7F 02
	clc		; 18
	sty $027F.w		; 8C 7F 02
	tsb $7F8C.w		; 0C 8C 7F
	tsb $30.b		; 04 30
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	rol A		; 2A
	brk $B6.b		; 00 B6
	ora $EA.b		; 05 EA
	ora #$0BD8.w		; 09 D8 0B
	ldx $0E.b,Y		; B6 0E
	tsx		; BA
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
	brk $91.b		; 00 91
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	sty $5254.w		; 8C 54 52
	eor ($4B.b,X)		; 41 4B
	brk $E7.b		; 00 E7
	ora $42.b		; 05 42
	adc ($73.b,X)		; 61 73
	adc ($00.b,S),Y		; 73 00
	brk $DC.b		; 00 DC
	ora $00.b		; 05 00
	cmp $003C07.l,X		; DF 07 3C 00
	sta ($7F.b),Y		; 91 7F
	asl $0C.b		; 06 0C
	sta ($7F.b),Y		; 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	asl A		; 0A
	tsb $7F8F.w		; 0C 8F 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	asl A		; 0A
	tsb $7F8F.w		; 0C 8F 7F
	phd		; 0B
	tsb $7F91.w		; 0C 91 7F
	ora [$18.b],Y		; 17 18
	sty $0B7F.w		; 8C 7F 0B
	tsb $7F8F.w		; 0C 8F 7F
	phd		; 0B
	tsb $7F8C.w		; 0C 8C 7F
	ora #$910C.w		; 09 0C 91
	adc $910C07.l,X		; 7F 07 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C06.l,X		; 7F 06 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C1817.l,X		; 7F 17 18 8C
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8F0C07.l,X		; 7F 07 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $920C0A.l,X		; 7F 0A 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $920605.l,X		; 7F 05 06 92
	adc $910605.l,X		; 7F 05 06 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $910605.l,X		; 7F 05 06 91
	adc $940605.l,X		; 7F 05 06 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $960C09.l,X		; 7F 09 0C 96
	adc $960C07.l,X		; 7F 07 0C 96
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $980C06.l,X		; 7F 06 0C 98
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C06.l,X		; 7F 06 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C1817.l,X		; 7F 17 18 8C
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $910C09.l,X		; 7F 09 0C 91
	adc $910C07.l,X		; 7F 07 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C06.l,X		; 7F 06 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C1817.l,X		; 7F 17 18 8C
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8F0C07.l,X		; 7F 07 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $920C0A.l,X		; 7F 0A 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $920605.l,X		; 7F 05 06 92
	adc $910605.l,X		; 7F 05 06 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $910605.l,X		; 7F 05 06 91
	adc $940605.l,X		; 7F 05 06 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $960C09.l,X		; 7F 09 0C 96
	adc $960C07.l,X		; 7F 07 0C 96
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $980C06.l,X		; 7F 06 0C 98
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C06.l,X		; 7F 06 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C1817.l,X		; 7F 17 18 8C
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $910C09.l,X		; 7F 09 0C 91
	adc $910C07.l,X		; 7F 07 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C06.l,X		; 7F 06 0C 8F
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C1817.l,X		; 7F 17 18 8C
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $8F0C07.l,X		; 7F 07 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $920C0A.l,X		; 7F 0A 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $920C0B.l,X		; 7F 0B 0C 92
	adc $8F0C09.l,X		; 7F 09 0C 8F
	adc $920605.l,X		; 7F 05 06 92
	adc $910605.l,X		; 7F 05 06 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $910605.l,X		; 7F 05 06 91
	adc $940605.l,X		; 7F 05 06 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $960C09.l,X		; 7F 09 0C 96
	adc $960C07.l,X		; 7F 07 0C 96
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $980C06.l,X		; 7F 06 0C 98
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180A.l,X		; 7F 0A 18 8C
	adc $8A0C0A.l,X		; 7F 0A 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $94180C.l,X		; 7F 0C 18 94
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $940C09.l,X		; 7F 09 0C 94
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $960C09.l,X		; 7F 09 0C 96
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F1809.l,X		; 7F 09 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8F180F.l,X		; 7F 0F 18 8F
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8A180D.l,X		; 7F 0D 18 8A
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180C.l,X		; 7F 0C 18 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8F1812.l,X		; 7F 12 18 8F
	adc $91180C.l,X		; 7F 0C 18 91
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $940C0A.l,X		; 7F 0A 0C 94
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180A.l,X		; 7F 0A 18 8C
	adc $8A0C0A.l,X		; 7F 0A 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $94180C.l,X		; 7F 0C 18 94
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $940C09.l,X		; 7F 09 0C 94
	adc $8F0C0A.l,X		; 7F 0A 0C 8F
	adc $940C0B.l,X		; 7F 0B 0C 94
	adc $960C09.l,X		; 7F 09 0C 96
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F1809.l,X		; 7F 09 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8F180F.l,X		; 7F 0F 18 8F
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8A180D.l,X		; 7F 0D 18 8A
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180D.l,X		; 7F 0D 18 8F
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $8F180C.l,X		; 7F 0C 18 8F
	adc $8F180B.l,X		; 7F 0B 18 8F
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8F1812.l,X		; 7F 12 18 8F
	adc $91180C.l,X		; 7F 0C 18 91
	adc $8F0C0B.l,X		; 7F 0B 0C 8F
	adc $940C0A.l,X		; 7F 0A 0C 94
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $DB0C0D.l,X		; 7F 0D 0C DB
	ora ($D9.b,X)		; 01 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $04.b		; 00 04
	bit $54.b,X		; 34 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	tsb $654C.w		; 0C 4C 65
	adc ($64.b,X)		; 61 64
	and $6F6863.l		; 2F 63 68 6F
	adc ($64.b)		; 72 64
	adc ($00.b,S),Y		; 73 00
	brk $DC.b		; 00 DC
	ora ($00.b)		; 12 00
	cmp $003207.l,X		; DF 07 32 00
	lda $7F.b,X		; B5 7F
	trb $B322.w		; 1C 22 B3
	adc $B5190F.l,X		; 7F 0F 19 B5
	adc $B31811.l,X		; 7F 11 18 B3
	adc $B50D05.l,X		; 7F 05 0D B5
	adc $B50C04.l,X		; 7F 04 0C B5
	adc $B30A04.l,X		; 7F 04 0A B3
	adc $B50D04.l,X		; 7F 04 0D B5
	adc $B53D30.l,X		; 7F 30 3D B5
	adc $B3241D.l,X		; 7F 1D 24 B3
	adc $B5180F.l,X		; 7F 0F 18 B5
	adc $B3170F.l,X		; 7F 0F 17 B3
	adc $B50C05.l,X		; 7F 05 0C B5
	adc $B50C05.l,X		; 7F 05 0C B5
	adc $B30B04.l,X		; 7F 04 0B B3
	adc $B50D05.l,X		; 7F 05 0D B5
	adc $B33B32.l,X		; 7F 32 3B B3
	adc $B3251B.l,X		; 7F 1B 25 B3
	adc $B3180E.l,X		; 7F 0E 18 B3
	adc $B31910.l,X		; 7F 10 19 B3
	adc $B60B03.l,X		; 7F 03 0B B6
	adc $B56258.l,X		; 7F 58 62 B5
	adc $B52217.l,X		; 7F 17 22 B5
	adc $B51910.l,X		; 7F 10 19 B5
	adc $B5180F.l,X		; 7F 0F 18 B5
	adc $B30C03.l,X		; 7F 03 0C B3
	adc $B52E26.l,X		; 7F 26 2E B5
	adc $B5322B.l,X		; 7F 2B 32 B5
	adc $B3221C.l,X		; 7F 1C 22 B3
	adc $B5190F.l,X		; 7F 0F 19 B5
	adc $B31811.l,X		; 7F 11 18 B3
	adc $B50D05.l,X		; 7F 05 0D B5
	adc $B50C04.l,X		; 7F 04 0C B5
	adc $B30A04.l,X		; 7F 04 0A B3
	adc $B50D04.l,X		; 7F 04 0D B5
	adc $B53D30.l,X		; 7F 30 3D B5
	adc $B3241D.l,X		; 7F 1D 24 B3
	adc $B5180F.l,X		; 7F 0F 18 B5
	adc $B3170F.l,X		; 7F 0F 17 B3
	adc $B50C05.l,X		; 7F 05 0C B5
	adc $B50C05.l,X		; 7F 05 0C B5
	adc $B30B04.l,X		; 7F 04 0B B3
	adc $B50D05.l,X		; 7F 05 0D B5
	adc $B33B32.l,X		; 7F 32 3B B3
	adc $B3251B.l,X		; 7F 1B 25 B3
	adc $B3180E.l,X		; 7F 0E 18 B3
	adc $B31910.l,X		; 7F 10 19 B3
	adc $B60B03.l,X		; 7F 03 0B B6
	adc $B56258.l,X		; 7F 58 62 B5
	adc $B52217.l,X		; 7F 17 22 B5
	adc $B51910.l,X		; 7F 10 19 B5
	adc $B5180F.l,X		; 7F 0F 18 B5
	adc $B30C03.l,X		; 7F 03 0C B3
	adc $B52E26.l,X		; 7F 26 2E B5
	adc $DC322B.l,X		; 7F 2B 32 DC
	ora [$00.b]		; 07 00
	cmp $003207.l,X		; DF 07 32 00
	lda [$7F.b]		; A7 7F
	and ($22.b,X)		; 21 22
	ldx $7F.b		; A6 7F
	tsb $04.b		; 04 04
	lda [$7F.b]		; A7 7F
	ora $04.b,S		; 03 04
	ldx $7F.b		; A6 7F
	asl $06.b		; 06 06
	ldy $7F.b		; A4 7F
	and $24.b,S		; 23 24
	ldx #$0B7F.w		; A2 7F 0B
	phd		; 0B
	ldy $7F.b		; A4 7F
	ora [$17.b],Y		; 17 17
	ldx #$0D7F.w		; A2 7F 0D
	asl $7FA4.w		; 0E A4 7F
	ora [$17.b],Y		; 17 17
	ldx $7F.b		; A6 7F
	ora [$18.b],Y		; 17 18
	ldx #$0B7F.w		; A2 7F 0B
	tsb $7FA7.w		; 0C A7 7F
	and ($22.b,X)		; 21 22
	ldx $7F.b		; A6 7F
	ora $05.b		; 05 05
	lda [$7F.b]		; A7 7F
	ora $04.b,S		; 03 04
	ldx $7F.b		; A6 7F
	ora $05.b		; 05 05
	ldy $7F.b		; A4 7F
	ora [$17.b],Y		; 17 17
	lda [$7F.b]		; A7 7F
	tsb $A90D.w		; 0C 0D A9
	adc $A71717.l,X		; 7F 17 17 A7
	adc $A91717.l,X		; 7F 17 17 A9
	adc $AB0E0D.l,X		; 7F 0D 0E AB
	adc $A71716.l,X		; 7F 16 17 A7
	adc $A60D0D.l,X		; 7F 0D 0D A6
	adc $A70C0C.l,X		; 7F 0C 0C A7
	adc $A62423.l,X		; 7F 23 24 A6
	adc $A70605.l,X		; 7F 05 06 A7
	adc $A60302.l,X		; 7F 02 03 A6
	adc $A40606.l,X		; 7F 06 06 A4
	adc $A22524.l,X		; 7F 24 25 A2
	adc $A40909.l,X		; 7F 09 09 A4
	adc $A61615.l,X		; 7F 15 16 A6
	adc $A70E0E.l,X		; 7F 0E 0E A7
	adc $A91716.l,X		; 7F 16 17 A9
	adc $A71716.l,X		; 7F 16 17 A7
	adc $AB0D0D.l,X		; 7F 0D 0D AB
	adc $A92423.l,X		; 7F 23 24 A9
	adc $AB0504.l,X		; 7F 04 05 AB
	adc $A90403.l,X		; 7F 03 04 A9
	adc $A70403.l,X		; 7F 03 04 A7
	adc $AB1818.l,X		; 7F 18 18 AB
	adc $AE1716.l,X		; 7F 16 17 AE
	adc $AE251A.l,X		; 7F 1A 25 AE
	adc $AE180B.l,X		; 7F 0B 18 AE
	adc $AE180C.l,X		; 7F 0C 18 AE
	adc $DC0C0B.l,X		; 7F 0B 0C DC
	asl $DF00.w		; 0E 00 DF
	ora [$32.b]		; 07 32
	brk $A9.b		; 00 A9
	adc $A7221C.l,X		; 7F 1C 22 A7
	adc $A9190F.l,X		; 7F 0F 19 A9
	adc $A71811.l,X		; 7F 11 18 A7
	adc $A90D05.l,X		; 7F 05 0D A9
	adc $A90C04.l,X		; 7F 04 0C A9
	adc $A70A04.l,X		; 7F 04 0A A7
	adc $A90D04.l,X		; 7F 04 0D A9
	adc $A93D30.l,X		; 7F 30 3D A9
	adc $A7241D.l,X		; 7F 1D 24 A7
	adc $A9180F.l,X		; 7F 0F 18 A9
	adc $A7170F.l,X		; 7F 0F 17 A7
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A90C05.l,X		; 7F 05 0C A9
	adc $A70B04.l,X		; 7F 04 0B A7
	adc $A90D05.l,X		; 7F 05 0D A9
	adc $A73B32.l,X		; 7F 32 3B A7
	adc $A7251B.l,X		; 7F 1B 25 A7
	adc $A7180E.l,X		; 7F 0E 18 A7
	adc $A71910.l,X		; 7F 10 19 A7
	adc $AA0B03.l,X		; 7F 03 0B AA
	adc $A96258.l,X		; 7F 58 62 A9
	adc $A92217.l,X		; 7F 17 22 A9
	adc $A91910.l,X		; 7F 10 19 A9
	adc $A9180F.l,X		; 7F 0F 18 A9
	adc $A70C03.l,X		; 7F 03 0C A7
	adc $A92E26.l,X		; 7F 26 2E A9
	adc $DC312B.l,X		; 7F 2B 31 DC
	ora $DF00.w		; 0D 00 DF
	ora [$32.b]		; 07 32
	ora ($B3.b,X)		; 01 B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C04.l,X		; 7F 04 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $B30C05.l,X		; 7F 05 0C B3
	adc $DB0C0A.l,X		; 7F 0A 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	ora ($EE.b,X)		; 01 EE
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora #$6843.w		; 09 43 68
	adc $736472.l		; 6F 72 64 73
	jsr $0032.w		; 20 32 00
	brk $DC.b		; 00 DC
	asl $DF00.w		; 0E 00 DF
	ora [$32.b]		; 07 32
	brk $AD.b		; 00 AD
	adc $AB231C.l,X		; 7F 1C 23 AB
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AB1811.l,X		; 7F 11 18 AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AD0C04.l,X		; 7F 04 0C AD
	adc $AB0A04.l,X		; 7F 04 0A AB
	adc $AD0E05.l,X		; 7F 05 0E AD
	adc $AD3B30.l,X		; 7F 30 3B AD
	adc $AB251D.l,X		; 7F 1D 25 AB
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AB160F.l,X		; 7F 0F 16 AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AD0C05.l,X		; 7F 05 0C AD
	adc $AB0B04.l,X		; 7F 04 0B AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AB3B32.l,X		; 7F 32 3B AB
	adc $AB251C.l,X		; 7F 1C 25 AB
	adc $AB180E.l,X		; 7F 0E 18 AB
	adc $AB1910.l,X		; 7F 10 19 AB
	adc $AE0B03.l,X		; 7F 03 0B AE
	adc $AD6257.l,X		; 7F 57 62 AD
	adc $AD2218.l,X		; 7F 18 22 AD
	adc $AD1910.l,X		; 7F 10 19 AD
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AC0C04.l,X		; 7F 04 0C AC
	adc $AE2E27.l,X		; 7F 27 2E AE
	adc $B9322C.l,X		; 7F 2C 32 B9
	adc $B7231C.l,X		; 7F 1C 23 B7
	adc $B91810.l,X		; 7F 10 18 B9
	adc $B71811.l,X		; 7F 11 18 B7
	adc $B90D05.l,X		; 7F 05 0D B9
	adc $B90C04.l,X		; 7F 04 0C B9
	adc $B70A04.l,X		; 7F 04 0A B7
	adc $B90E05.l,X		; 7F 05 0E B9
	adc $B93B30.l,X		; 7F 30 3B B9
	adc $B7251D.l,X		; 7F 1D 25 B7
	adc $B91810.l,X		; 7F 10 18 B9
	adc $B7160F.l,X		; 7F 0F 16 B7
	adc $B90D05.l,X		; 7F 05 0D B9
	adc $B90C05.l,X		; 7F 05 0C B9
	adc $B70B04.l,X		; 7F 04 0B B7
	adc $B90D05.l,X		; 7F 05 0D B9
	adc $B73B32.l,X		; 7F 32 3B B7
	adc $B7251C.l,X		; 7F 1C 25 B7
	adc $B7180E.l,X		; 7F 0E 18 B7
	adc $B71910.l,X		; 7F 10 19 B7
	adc $BA0B03.l,X		; 7F 03 0B BA
	adc $B96257.l,X		; 7F 57 62 B9
	adc $B92218.l,X		; 7F 18 22 B9
	adc $B91910.l,X		; 7F 10 19 B9
	adc $B91810.l,X		; 7F 10 18 B9
	adc $B80C04.l,X		; 7F 04 0C B8
	adc $BA2E27.l,X		; 7F 27 2E BA
	adc $DC322C.l,X		; 7F 2C 32 DC
	php		; 08
	brk $DF.b		; 00 DF
	ora [$1E.b]		; 07 1E
	brk $A7.b		; 00 A7
	adc $A4302F.l,X		; 7F 2F 30 A4
	adc $A2302F.l,X		; 7F 2F 30 A2
	adc $A7605D.l,X		; 7F 5D 60 A7
	adc $A42F2F.l,X		; 7F 2F 2F A4
	adc $A7302D.l,X		; 7F 2D 30 A7
	adc $A72F29.l,X		; 7F 29 2F A7
	adc $A71A15.l,X		; 7F 15 1A A7
	adc $A71811.l,X		; 7F 11 18 A7
	adc $A42F2E.l,X		; 7F 2E 2F A4
	adc $A2302C.l,X		; 7F 2C 30 A2
	adc $A7605B.l,X		; 7F 5B 60 A7
	adc $A4312F.l,X		; 7F 2F 31 A4
	adc $A72F2A.l,X		; 7F 2A 2F A7
	adc $A7251E.l,X		; 7F 1E 25 A7
	adc $A71817.l,X		; 7F 17 18 A7
	adc $A71815.l,X		; 7F 15 18 A7
	adc $DC0C09.l,X		; 7F 09 0C DC
	ora ($00.b,S),Y		; 13 00
	cmp $003207.l,X		; DF 07 32 00
	lda $1C7F.w		; AD 7F 1C
	and $AB.b,S		; 23 AB
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AB1811.l,X		; 7F 11 18 AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AD0C04.l,X		; 7F 04 0C AD
	adc $AB0A04.l,X		; 7F 04 0A AB
	adc $AD0E05.l,X		; 7F 05 0E AD
	adc $AD3B30.l,X		; 7F 30 3B AD
	adc $AB251D.l,X		; 7F 1D 25 AB
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AB160F.l,X		; 7F 0F 16 AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AD0C05.l,X		; 7F 05 0C AD
	adc $AB0B04.l,X		; 7F 04 0B AB
	adc $AD0D05.l,X		; 7F 05 0D AD
	adc $AB3B32.l,X		; 7F 32 3B AB
	adc $AB251C.l,X		; 7F 1C 25 AB
	adc $AB180E.l,X		; 7F 0E 18 AB
	adc $AB1910.l,X		; 7F 10 19 AB
	adc $AE0B03.l,X		; 7F 03 0B AE
	adc $AD6257.l,X		; 7F 57 62 AD
	adc $AD2218.l,X		; 7F 18 22 AD
	adc $AD1910.l,X		; 7F 10 19 AD
	adc $AD1810.l,X		; 7F 10 18 AD
	adc $AC0C04.l,X		; 7F 04 0C AC
	adc $AE2E27.l,X		; 7F 27 2E AE
	adc $49892C.l,X		; 7F 2C 89 49
	jmp.w [$000F]		; DC 0F 00
	cmp $001E07.l,X		; DF 07 1E 00
	tsx		; BA
	adc $B72625.l,X		; 7F 25 26 B7
	adc $B52221.l,X		; 7F 21 22 B5
	adc $B32524.l,X		; 7F 24 25 B3
	adc $B52323.l,X		; 7F 23 23 B5
	adc $B7321A.l,X		; 7F 1A 32 B7
	adc $B32421.l,X		; 7F 21 24 B3
	adc $B52221.l,X		; 7F 21 22 B5
	adc $B32524.l,X		; 7F 24 25 B3
	adc $AE2221.l,X		; 7F 21 22 AE
	adc $DB1A1A.l,X		; 7F 1A 1A DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda [$00.b]		; A7 00
	brk $02.b		; 00 02
	dec $5254.w,X		; DE 54 52
	eor ($4B.b,X)		; 41 4B
	brk $E7.b		; 00 E7
	ora #$6843.w		; 09 43 68
	adc $736472.l		; 6F 72 64 73
	jsr $0033.w		; 20 33 00
	brk $DC.b		; 00 DC
	ora ($00.b,S),Y		; 13 00
	cmp $003207.l,X		; DF 07 32 00
	bcs 127.b		; B0 7F
	trb $AE23.w		; 1C 23 AE
	adc $B01910.l,X		; 7F 10 19 B0
	adc $AE1811.l,X		; 7F 11 18 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B04.l,X		; 7F 04 0B AE
	adc $B00D04.l,X		; 7F 04 0D B0
	adc $B03C30.l,X		; 7F 30 3C B0
	adc $AE241D.l,X		; 7F 1D 24 AE
	adc $B0180F.l,X		; 7F 0F 18 B0
	adc $AE170E.l,X		; 7F 0E 17 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B05.l,X		; 7F 05 0B AE
	adc $B00D05.l,X		; 7F 05 0D B0
	adc $AE3B32.l,X		; 7F 32 3B AE
	adc $AE251B.l,X		; 7F 1B 25 AE
	adc $AE180E.l,X		; 7F 0E 18 AE
	adc $AE1910.l,X		; 7F 10 19 AE
	adc $B10B04.l,X		; 7F 04 0B B1
	adc $B06258.l,X		; 7F 58 62 B0
	adc $B02218.l,X		; 7F 18 22 B0
	adc $B01910.l,X		; 7F 10 19 B0
	adc $B01810.l,X		; 7F 10 18 B0
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B22E28.l,X		; 7F 28 2E B2
	adc $B0322C.l,X		; 7F 2C 32 B0
	adc $AE231C.l,X		; 7F 1C 23 AE
	adc $B01910.l,X		; 7F 10 19 B0
	adc $AE1811.l,X		; 7F 11 18 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B04.l,X		; 7F 04 0B AE
	adc $B00D04.l,X		; 7F 04 0D B0
	adc $B03C30.l,X		; 7F 30 3C B0
	adc $AE241D.l,X		; 7F 1D 24 AE
	adc $B0180F.l,X		; 7F 0F 18 B0
	adc $AE170E.l,X		; 7F 0E 17 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B05.l,X		; 7F 05 0B AE
	adc $B00D05.l,X		; 7F 05 0D B0
	adc $AE3B32.l,X		; 7F 32 3B AE
	adc $AE251B.l,X		; 7F 1B 25 AE
	adc $AE180E.l,X		; 7F 0E 18 AE
	adc $AE1910.l,X		; 7F 10 19 AE
	adc $B10B04.l,X		; 7F 04 0B B1
	adc $B06258.l,X		; 7F 58 62 B0
	adc $B02218.l,X		; 7F 18 22 B0
	adc $B01910.l,X		; 7F 10 19 B0
	adc $B01810.l,X		; 7F 10 18 B0
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B22E28.l,X		; 7F 28 2E B2
	adc $DC322C.l,X		; 7F 2C 32 DC
	tsb $DF00.w		; 0C 00 DF
	ora [$1E.b]		; 07 1E
	brk $AE.b		; 00 AE
	adc $AB302E.l,X		; 7F 2E 30 AB
	adc $A9302B.l,X		; 7F 2B 30 A9
	adc $AE5F5D.l,X		; 7F 5D 5F AE
	adc $AB302E.l,X		; 7F 2E 30 AB
	adc $AE302D.l,X		; 7F 2D 30 AE
	adc $AE2F2A.l,X		; 7F 2A 2F AE
	adc $AE1A15.l,X		; 7F 15 1A AE
	adc $AE1811.l,X		; 7F 11 18 AE
	adc $AB2F2E.l,X		; 7F 2E 2F AB
	adc $A9302A.l,X		; 7F 2A 30 A9
	adc $AE605A.l,X		; 7F 5A 60 AE
	adc $AB312D.l,X		; 7F 2D 31 AB
	adc $AE2F29.l,X		; 7F 29 2F AE
	adc $AE251E.l,X		; 7F 1E 25 AE
	adc $AE180C.l,X		; 7F 0C 18 AE
	adc $AE1815.l,X		; 7F 15 18 AE
	adc $DC0C03.l,X		; 7F 03 0C DC
	ora ($00.b)		; 12 00
	cmp $003207.l,X		; DF 07 32 00
	bcs 127.b		; B0 7F
	trb $AE23.w		; 1C 23 AE
	adc $B01910.l,X		; 7F 10 19 B0
	adc $AE1811.l,X		; 7F 11 18 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B04.l,X		; 7F 04 0B AE
	adc $B00D04.l,X		; 7F 04 0D B0
	adc $B03C30.l,X		; 7F 30 3C B0
	adc $AE241D.l,X		; 7F 1D 24 AE
	adc $B0180F.l,X		; 7F 0F 18 B0
	adc $AE170E.l,X		; 7F 0E 17 AE
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B00C04.l,X		; 7F 04 0C B0
	adc $AE0B05.l,X		; 7F 05 0B AE
	adc $B00D05.l,X		; 7F 05 0D B0
	adc $AE3B32.l,X		; 7F 32 3B AE
	adc $AE251B.l,X		; 7F 1B 25 AE
	adc $AE180E.l,X		; 7F 0E 18 AE
	adc $AE1910.l,X		; 7F 10 19 AE
	adc $B10B04.l,X		; 7F 04 0B B1
	adc $B06258.l,X		; 7F 58 62 B0
	adc $B02218.l,X		; 7F 18 22 B0
	adc $B01910.l,X		; 7F 10 19 B0
	adc $B01810.l,X		; 7F 10 18 B0
	adc $B00C05.l,X		; 7F 05 0C B0
	adc $B22E28.l,X		; 7F 28 2E B2
	adc $1A862C.l,X		; 7F 2C 86 1A
	jmp.w [$0007]		; DC 07 00
	cmp $183207.l,X		; DF 07 32 18
	lda [$7F.b]		; A7 7F
	ora $0A.b,S		; 03 0A
	lda [$7F.b]		; A7 7F
	tsb $07.b		; 04 07
	ldy $7F.b		; A4 7F
	asl $06.b		; 06 06
	lda [$7F.b]		; A7 7F
	tsb $0C.b		; 04 0C
	lda [$7F.b]		; A7 7F
	tsb $06.b		; 04 06
	ldy $7F.b		; A4 7F
	asl $07.b		; 06 07
	lda [$7F.b]		; A7 7F
	tsb $0C.b		; 04 0C
	lda [$7F.b]		; A7 7F
	tsb $05.b		; 04 05
	ldy $7F.b		; A4 7F
	asl $07.b		; 06 07
	lda [$7F.b]		; A7 7F
	tsb $A40C.w		; 0C 0C A4
	adc $A90D0A.l,X		; 7F 0A 0D A9
	adc $A70B0B.l,X		; 7F 0B 0B A7
	adc $A40C0B.l,X		; 7F 0B 0C A4
	adc $A90B0B.l,X		; 7F 0B 0B A9
	adc $A71817.l,X		; 7F 17 18 A7
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A20C0B.l,X		; 7F 0B 0C A2
	adc $A70E0E.l,X		; 7F 0E 0E A7
	adc $A70B04.l,X		; 7F 04 0B A7
	adc $A40605.l,X		; 7F 05 06 A4
	adc $A70707.l,X		; 7F 07 07 A7
	adc $A70C04.l,X		; 7F 04 0C A7
	adc $A40403.l,X		; 7F 03 04 A4
	adc $A70806.l,X		; 7F 06 08 A7
	adc $A40C0B.l,X		; 7F 0B 0C A4
	adc $A90D0B.l,X		; 7F 0B 0D A9
	adc $A70B0A.l,X		; 7F 0A 0B A7
	adc $A40B08.l,X		; 7F 08 0B A4
	adc $A70C0B.l,X		; 7F 0B 0C A7
	adc $A20C0B.l,X		; 7F 0B 0C A2
	adc $A70D0C.l,X		; 7F 0C 0D A7
	adc $A41615.l,X		; 7F 15 16 A4
	adc $A70C0B.l,X		; 7F 0B 0C A7
	adc $A90B0A.l,X		; 7F 0A 0B A9
	adc $A70E0A.l,X		; 7F 0A 0E A7
	adc $A70A03.l,X		; 7F 03 0A A7
	adc $A40704.l,X		; 7F 04 07 A4
	adc $A70606.l,X		; 7F 06 06 A7
	adc $A70C04.l,X		; 7F 04 0C A7
	adc $A40604.l,X		; 7F 04 06 A4
	adc $A70706.l,X		; 7F 06 07 A7
	adc $A70C04.l,X		; 7F 04 0C A7
	adc $A40504.l,X		; 7F 04 05 A4
	adc $A70706.l,X		; 7F 06 07 A7
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A90D0A.l,X		; 7F 0A 0D A9
	adc $A70B0B.l,X		; 7F 0B 0B A7
	adc $A40C0B.l,X		; 7F 0B 0C A4
	adc $A90B0B.l,X		; 7F 0B 0B A9
	adc $A71817.l,X		; 7F 17 18 A7
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A20C0B.l,X		; 7F 0B 0C A2
	adc $A70E0E.l,X		; 7F 0E 0E A7
	adc $A70B04.l,X		; 7F 04 0B A7
	adc $A40605.l,X		; 7F 05 06 A4
	adc $A70707.l,X		; 7F 07 07 A7
	adc $A70C04.l,X		; 7F 04 0C A7
	adc $A40403.l,X		; 7F 03 04 A4
	adc $A70806.l,X		; 7F 06 08 A7
	adc $A40C0B.l,X		; 7F 0B 0C A4
	adc $A90D0B.l,X		; 7F 0B 0D A9
	adc $A70B0A.l,X		; 7F 0A 0B A7
	adc $A40B08.l,X		; 7F 08 0B A4
	adc $A70C0B.l,X		; 7F 0B 0C A7
	adc $A20C0B.l,X		; 7F 0B 0C A2
	adc $A70D0C.l,X		; 7F 0C 0D A7
	adc $A41615.l,X		; 7F 15 16 A4
	adc $A70C0B.l,X		; 7F 0B 0C A7
	adc $A90B0A.l,X		; 7F 0A 0B A9
	adc $DB0E0D.l,X		; 7F 0D 0E DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $020000.l,X		; 7F 00 00 02
	tsb $54.b		; 04 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl $53.b		; 06 53
	ror $7261.w		; 6E 61 72
	adc $00.b		; 65 00
	brk $DC.b		; 00 DC
	ora ($00.b,X)		; 01 00
	cmp $185007.l,X		; DF 07 50 18
	stx $057F.w		; 8E 7F 05
	bmi -114.b		; 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $8E2404.l,X		; 7F 04 24 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E3005.l,X		; 7F 05 30 8E
	adc $8E2405.l,X		; 7F 05 24 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $8E0603.l,X		; 7F 03 06 8E
	adc $8E0605.l,X		; 7F 05 06 8E
	adc $DB0C04.l,X		; 7F 04 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $F4.b		; 02 F4
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $4B.b		; 05 4B
	adc #$6B63.w		; 69 63 6B
	brk $00.b		; 00 00
	jmp.w [$0000]		; DC 00 00
	cmp $003C07.l,X		; DF 07 3C 00
	sty $057F.w		; 8C 7F 05
	ora ($8C.b)		; 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2407.l,X		; 7F 07 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C3C05.l,X		; 7F 05 3C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1805.l,X		; 7F 05 18 8C
	adc $8C2405.l,X		; 7F 05 24 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $DB3C05.l,X		; 7F 05 3C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $002A.w		; 0C 2A 00
	adc ($00.b)		; 72 00
	ldx $0600.w,Y		; BE 00 06
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
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $52.b		; 05 52
	adc $00746F.l		; 6F 6F 74 00
	brk $DC.b		; 00 DC
	ora ($00.b)		; 12 00
	cmp $003207.l,X		; DF 07 32 00
	ldy $7F.b		; A4 7F
	trb $A628.w		; 1C 28 A6
	adc $A70909.l,X		; 7F 09 09 A7
	adc $A41711.l,X		; 7F 11 17 A4
	adc $A4780E.l,X		; 7F 0E 78 A4
	adc $A6251C.l,X		; 7F 1C 25 A6
	adc $A70A09.l,X		; 7F 09 0A A7
	adc $A4170E.l,X		; 7F 0E 17 A4
	adc $AA180F.l,X		; 7F 0F 18 AA
	adc $DA6260.l,X		; 7F 60 62 DA
	brk $00.b		; 00 00
	cmp $0000.w,Y		; D9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	tsb $634F.w		; 0C 4F 63
	stz $61.b,X		; 74 61
	ror $65.b,X		; 76 65
	jsr $6F44.w		; 20 44 6F
	adc [$6E.b],Y		; 77 6E
	brk $00.b		; 00 00
	jmp.w [$0005]		; DC 05 00
	cmp $003207.l,X		; DF 07 32 00
	sty $1C7F.w		; 8C 7F 1C
	plp		; 28
	stx $097F.w		; 8E 7F 09
	ora #$7F8F.w		; 09 8F 7F
	ora ($17.b),Y		; 11 17
	sty $0E7F.w		; 8C 7F 0E
	sei		; 78
	sty $1C7F.w		; 8C 7F 1C
	and $8E.b		; 25 8E
	adc $8F0A09.l,X		; 7F 09 0A 8F
	adc $8C170E.l,X		; 7F 0E 17 8C
	adc $92180F.l,X		; 7F 0F 18 92
	adc $D96160.l,X		; 7F 60 61 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	php		; 08
	bvc  52.b		; 50 34
	jsr $6F44.w		; 20 44 6F
	adc [$6E.b],Y		; 77 6E
	brk $00.b		; 00 00
	jmp.w [$000E]		; DC 0E 00
	cmp $003207.l,X		; DF 07 32 00
	sta $281C7F.l,X		; 9F 7F 1C 28
	lda ($7F.b,X)		; A1 7F
	ora #$A209.w		; 09 09 A2
	adc $9F1711.l,X		; 7F 11 17 9F
	adc $9F780E.l,X		; 7F 0E 78 9F
	adc $A1251C.l,X		; 7F 1C 25 A1
	adc $A20A09.l,X		; 7F 09 0A A2
	adc $9F170E.l,X		; 7F 0E 17 9F
	adc $A5180F.l,X		; 7F 0F 18 A5
	adc $D96160.l,X		; 7F 60 61 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $46.b		; 00 46
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl $50.b		; 06 50
	and $20.b,X		; 35 20
	eor $70.b,X		; 55 70
	brk $00.b		; 00 00
	jmp.w [$0013]		; DC 13 00
	cmp $003207.l,X		; DF 07 32 00
	plb		; AB
	adc $AD281C.l,X		; 7F 1C 28 AD
	adc $AE0909.l,X		; 7F 09 09 AE
	adc $AB1711.l,X		; 7F 11 17 AB
	adc $AB780E.l,X		; 7F 0E 78 AB
	adc $AD251C.l,X		; 7F 1C 25 AD
	adc $AE0A09.l,X		; 7F 09 0A AE
	adc $AB170E.l,X		; 7F 0E 17 AB
	adc $B1180F.l,X		; 7F 0F 18 B1
	adc $D96160.l,X		; 7F 60 61 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cli		; 58
	brk $88.b		; 00 88
	brk $B8.b		; 00 B8
	brk $E8.b		; 00 E8
	brk $18.b		; 00 18
	ora ($48.b,X)		; 01 48
	ora ($78.b,X)		; 01 78
	ora ($A8.b,X)		; 01 A8
	ora ($D8.b,X)		; 01 D8
	ora ($08.b,X)		; 01 08
	cop $38.b		; 02 38
	cop $68.b		; 02 68
	cop $98.b		; 02 98
	cop $C8.b		; 02 C8
	cop $F8.b		; 02 F8
	cop $28.b		; 02 28
	ora $58.b,S		; 03 58
	ora $88.b,S		; 03 88
	ora $B8.b,S		; 03 B8
	ora $E8.b,S		; 03 E8
	ora $18.b,S		; 03 18
	tsb $48.b		; 04 48
	tsb $78.b		; 04 78
	tsb $A8.b		; 04 A8
	tsb $D8.b		; 04 D8
	tsb $08.b		; 04 08
	ora $38.b		; 05 38
	ora $68.b		; 05 68
	ora $98.b		; 05 98
	ora $C8.b		; 05 C8
	ora $F8.b		; 05 F8
	ora $28.b		; 05 28
	asl $58.b		; 06 58
	asl $88.b		; 06 88
	asl $B8.b		; 06 B8
	asl $E8.b		; 06 E8
	asl $18.b		; 06 18
	ora [$48.b]		; 07 48
	ora [$78.b]		; 07 78
	ora [$A8.b]		; 07 A8
	ora [$D8.b]		; 07 D8
	ora [$08.b]		; 07 08
	php		; 08
	sec		; 38
	php		; 08
	pla		; 68
	php		; 08
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	lsr $00.b		; 46 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $64.b		; 00 64
	bvs  23.b		; 70 17
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bvc  80.b		; 50 50
	brk $AF.b		; 00 AF
	beq  80.b		; F0 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	lsr A		; 4A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bvc  80.b		; 50 50
	ora ($AF.b,X)		; 01 AF
	beq  80.b		; F0 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $70.b		; 64 70
	ora [$00.b],Y		; 17 00
	brk $00.b		; 00 00
	adc $023264.l,X		; 7F 64 32 02
	lda $0050F0.l		; AF F0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $10.b		; 64 10
	and [$B8.b]		; 27 B8
	phd		; 0B
	jsr L01384E.w		; 20 4E B8
	phd		; 0B
	bvc  80.b		; 50 50
	ora $EE.b,S		; 03 EE
	ldy #$0050.w		; A0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	jsr L01384E.w		; 20 4E B8
	phd		; 0B
	bvc  80.b		; 50 50
	tsb $EF.b		; 04 EF
	ldy #$0050.w		; A0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $10.b		; 64 10
	and [$98.b]		; 27 98
	dec A		; 3A
	bpl  39.b		; 10 27
	bvc  80.b		; 50 50
	ora $FF.b		; 05 FF
	rts		; 60

	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $64.b		; 64 64
	brk $10.b		; 00 10
	and [$C8.b]		; 27 C8
	brk $32.b		; 00 32
	stz $06.b		; 64 06
	sta $005060.l		; 8F 60 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $E8.b		; 64 E8
	ora $10.b,S		; 03 10
	and [$D0.b]		; 27 D0
	ora [$32.b]		; 07 32
	stz $07.b		; 64 07
	lda $005040.l		; AF 40 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $001E.w		; 0C 1E 00
	brk $00.b		; 00 00
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	stz $32.b		; 64 32
	php		; 08
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $3D.b		; 00 3D
	brk $00.b		; 00 00
	brk $98.b		; 00 98
	dec A		; 3A
	brk $64.b		; 00 64
	pea $6401.w		; F4 01 64
	brk $F4.b		; 00 F4
	ora ($46.b,X)		; 01 46
	phy		; 5A
	ora #$F0FF.w		; 09 FF F0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	jsr $E84E.w		; 20 4E E8
	ora $64.b,S		; 03 64
	and ($0A.b)		; 32 0A
	sbc $0050A0.l		; EF A0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	stz $32.b		; 64 32
	phd		; 0B
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	bvc  80.b		; 50 50
	php		; 08
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $10.b		; 64 10
	and [$98.b]		; 27 98
	dec A		; 3A
	bpl  39.b		; 10 27
	phy		; 5A
	lsr $0C.b		; 46 0C
	sbc $005060.l,X		; FF 60 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	bvc  80.b		; 50 50
	ora $E0FF.w		; 0D FF E0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	stz $32.b		; 64 32
	php		; 08
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $64.b		; 64 64
	brk $10.b		; 00 10
	and [$C8.b]		; 27 C8
	brk $5A.b		; 00 5A
	eor ($06.b,X)		; 41 06
	sta $005060.l		; 8F 60 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	and ($64.b)		; 32 64
	php		; 08
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	stz $32.b		; 64 32
	ora $E0FF.w		; 0D FF E0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $00.b		; 64 00
	stz $B8.b		; 64 B8
	phd		; 0B
	bmi 117.b		; 30 75
	clv		; B8
	phd		; 0B
	and ($64.b)		; 32 64
	ora $E0FF.w		; 0D FF E0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  88.b		; 70 58
	cli		; 58
	asl $0000.w		; 0E 00 00
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
	rti		; 40

	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	bvs  16.b		; 70 10
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
	brk $40.b		; 00 40
	brk $D6.b		; 00 D6
	asl $00.b		; 06 00
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	bvs  17.b		; 70 11
	sbc $0070E0.l,X		; FF E0 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  64.b		; 70 40
	rti		; 40

	ora ($FF.b)		; 12 FF
	cpx #$0040.w		; E0 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $52.b		; 00 52
	ora [$00.b]		; 07 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $7878.w		; 20 78 78
	ora $78E0FF.l		; 0F FF E0 78
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E800.w		; 20 00 E8
	ora $00.b,S		; 03 00
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $4868.w		; 20 68 48
	ora ($FF.b,S),Y		; 13 FF
	sbc ($68.b,S),Y		; F3 68
	brk $00.b		; 00 00
	asl $0000.w,X		; 1E 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $20.b		; 00 20
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $FF.b		; 00 FF
	sbc $007000.l,X		; FF 00 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $7070.w		; 20 70 70
	clc		; 18
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
	brk $80.b		; 00 80
	brk $E8.b		; 00 E8
	ora $00.b,S		; 03 00
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $7878.w		; 20 78 78
	trb $FF.b		; 14 FF
	inc $0078.w		; EE 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $60.b		; 00 60
	ora $00.b,S		; 03 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	ora $FF.b,X		; 15 FF
	cpx #$0078.w		; E0 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl 112.b		; 10 70
	bvs  22.b		; 70 16
	sbc $0070E0.l,X		; FF E0 70 00
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
	brk $01.b		; 00 01
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	bvs  23.b		; 70 17
	sbc $0070E0.l,X		; FF E0 70 00
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
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E8.b		; 00 E8
	ora $00.b,S		; 03 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	brk $FF.b		; 00 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E8.b		; 00 E8
	ora $00.b,S		; 03 00
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 120.b		; 70 78
	sei		; 78
	ora ($FF.b,X)		; 01 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	brk $FF.b		; 00 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	ora $FF.b		; 05 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	tsb $FF.b		; 04 FF
	cpx #$0078.w		; E0 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	ora $FF.b		; 05 FF
	cpx #$0078.w		; E0 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 120.b		; 70 78
	sei		; 78
	asl $FF.b		; 06 FF
	cpx #$0078.w		; E0 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 120.b		; 70 78
	sei		; 78
	asl $FF.b		; 06 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 120.b		; 70 78
	sei		; 78
	cop $FF.b		; 02 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  80.b		; 10 50
	bvc  22.b		; 50 16
	sbc $0050E0.l,X		; FF E0 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $DC.b		; 00 DC
	ora $00.b		; 05 00
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	ora [$FF.b]		; 07 FF
	cpx #$0078.w		; E0 78 00
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
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $5F.b		; 00 5F
	ora $00.b		; 05 00
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl 112.b		; 10 70
	bvs   8.b		; 70 08
	sbc $0070E0.l,X		; FF E0 70 00
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
	brk $08.b		; 00 08
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  96.b		; 70 60
	rts		; 60

	ora $00.b,S		; 03 00
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
	.db $42, $FB		; 42 FB
	brk $08.b		; 00 08
	brk $52.b		; 00 52
	brk $08.b		; 00 08
	brk $05.b		; 00 05
	eor [$07.b]		; 47 07
	brk $00.b		; 00 00
	asl A		; 0A
	ora [$07.b]		; 07 07
	phd		; 0B
	asl A		; 0A
	asl A		; 0A
	ora $CC22.w		; 0D 22 CC
	ora $130B0B.l		; 0F 0B 0B 13
	php		; 08
	bmi  20.b		; 30 14
	ora [$00.b]		; 07 00
	ora $32.b,X		; 15 32
	cpy $0F16.w		; CC 16 0F
	ora $0D0D17.l		; 0F 17 0D 0D
	inc A		; 1A
	tsb $78.b		; 04 78
	tas		; 1B
	ora ($13.b,S),Y		; 13 13
	ora $FC02.w,X		; 1D 02 FC
	ora $256010.l,X		; 1F 10 60 25
	stx $78.b		; 86 78
	and [$04.b]		; 27 04
	clc		; 18
	plp		; 28
	asl A		; 0A
	brk $2A.b		; 00 2A
	inc A		; 1A
	ora $2B.b,X		; 15 2B
	jsr $2CC0.w		; 20 C0 2C
	asl $16.b,X		; 16 16
	and $FFFF.w		; 2D FF FF
	and $33147C.l		; 2F 7C 14 33
	tsb $3430.w		; 0C 30 34
	ora $12351F.l,X		; 1F 1F 35 12
	jmp ($0436.w)		; 6C 36 04
	sed		; F8
	and [$0D.b],Y		; 37 0D
	and $3A.b		; 25 3A
	clc		; 18
	rts		; 60

	tsa		; 3B
	.db $82, $7C, $3D		; 82 7C 3D
	trb $2A.b		; 14 2A
	rti		; 40

	and [$27.b]		; 27 27
	eor [$02.b]		; 47 02
	tsb $1349.w		; 0C 49 13
	sec		; 38
	lsr A		; 4A
	ora $4BFE.w,X		; 1D FE 4B
	bit $4D2C.w		; 2C 2C 4D
	ora $17.b,X		; 15 17
	lsr $2B2B.w		; 4E 2B 2B
	eor $502D2D.l		; 4F 2D 2D 50
	bmi -64.b		; 30 C0
	eor ($06.b),Y		; 51 06
	sed		; F8
	eor ($02.b,S),Y		; 53 02
	jmp ($1554.w,X)		; 7C 54 15
	ora $3356.w		; 0D 56 33
	dec A		; 3A
	eor [$37.b],Y		; 57 37
	and $143858.l		; 2F 58 38 14
	eor $0C72.w,Y		; 59 72 0C
	phy		; 5A
	ora ($FE.b,X)		; 01 FE
	tad		; 5B
	tsa		; 3B
	ror $3E5C.w,X		; 7E 5C 3E
	cpy #$225E.w		; C0 5E 22
	jmp.w [$245F]		; DC 5F 24
	cld		; D8
	adc ($30.b,X)		; 61 30
	ora ($62.b,S),Y		; 13 62
	and $63C6.w,Y		; 39 C6 63
	eor #$6500.w		; 49 00 65
	clc		; 18
	lsr $67.b,X		; 56 67
	tas		; 1B
	cli		; 58
	pla		; 68
	bit $69C0.w,X		; 3C C0 69
	pha		; 48
	bmi 106.b		; 30 6A
	inc $6B14.w		; EE 14 6B
	tsb $38.b		; 04 38
	adc $060C.w		; 6D 0C 06
	ror $2517.w		; 6E 17 25
	adc $715C1D.l		; 6F 1D 5C 71
	and ($C6.b,X)		; 21 C6
	adc ($28.b,S),Y		; 73 28
	rol A		; 2A
	stz $3B.b,X		; 74 3B
	eor $5175.w,Y		; 59 75 51
	jsr ($9379.w,X)		; FC 79 93
	jmp ($247A.w)		; 6C 7A 24
	clc		; 18
	tda		; 7B
	jmp $7D30.w		; 4C 30 7D
	adc #$4B7A.w		; 69 7A 4B
	phk		; 4B
	phk		; 4B
	phk		; 4B
	ora $1A1A13.l		; 0F 13 1A 1A
	and ($63.b,S),Y		; 33 63
	adc $35.b,S		; 63 35
	and $35.b,X		; 35 35
	ror $000B.w,X		; 7E 0B 00
	and $35.b,X		; 35 35
	phy		; 5A
	adc $795A.w,Y		; 79 5A 79
	and $7E.b,X		; 35 7E
	brk $13.b		; 00 13
	eor ($5C.b,S),Y		; 53 5C
	sty $78.b		; 84 78
	eor $CC51.w,Y		; 59 51 CC
	bmi  88.b		; 30 58
	adc ($23.b),Y		; 71 23
	cpy $18E6.w		; CC E6 18
	and ($19.b,S),Y		; 33 19
	ror $31.b		; 66 31
	dec $E7.b		; C6 E7
	brk $6B.b		; 00 6B
	and $44.b,X		; 35 44
	sec		; 38
	ora #$5E76.w		; 09 76 5E
	ora $89.b,X		; 15 89
	ror $7F.b,X		; 76 7F
	brk $34.b		; 00 34
	bvc -32.b		; 50 E0
	phd		; 0B
	brk $27.b		; 00 27
	lsr $34.b,X		; 56 34
	adc $001C.w,X		; 7D 1C 00
	ora $56407D.l,X		; 1F 7D 40 56
	bvs  20.b		; 70 14
	ora ($66.b),Y		; 11 66
	eor $3C.b,S		; 43 3C
	brk $FF.b		; 00 FF
	cmp $3C.b,S		; C3 3C
	ora $7766.w,Y		; 19 66 77
	plp		; 28
	tas		; 1B
	ora $30CE.w,X		; 1D CE 30
	eor #$280B.w		; 49 0B 28
	tas		; 1B
	dec A		; 3A
	asl A		; 0A
	ora [$4A.b]		; 07 4A
	ora $381B00.l		; 0F 00 1B 38
	brk $01.b		; 00 01
	asl $03.b		; 06 03
	adc $5065.w		; 6D 65 50
	rts		; 60

	bra -64.b		; 80 C0
	and $5717.w,X		; 3D 17 57
	ora ($08.b,S),Y		; 13 08
	bvs 105.b		; 70 69
	tas		; 1B
	inc A		; 1A
	and $38C62A.l		; 2F 2A C6 38
	trb $5060.w		; 1C 60 50
	lsr A		; 4A
	and $38C6.w,X		; 3D C6 38
	and ($0C.b)		; 32 0C
	eor [$6B.b],Y		; 57 6B
	inc A		; 1A
	eor $18E61D.l,X		; 5F 1D E6 18
	and [$1C.b]		; 27 1C
	trb $6F.b		; 14 6F
	rol $F2.b,X		; 36 F2
	tsb $1A57.w		; 0C 57 1A
	pla		; 68
	rol $15.b,X		; 36 15
	eor [$1D.b],Y		; 57 1D
	sbc ($6D.b)		; F2 6D
	adc $1F.b		; 65 1F
	bvs  61.b		; 70 3D
	and $15.b		; 25 15
	eor [$2A.b],Y		; 57 2A
	ora $0674.w		; 0D 74 06
	sei		; 78
	and $676767.l		; 2F 67 67 67
	tas		; 1B
	dec A		; 3A
	and [$56.b]		; 27 56
	bvc -112.b		; 50 90
	rts		; 60

	adc $281C.w,X		; 7D 1C 28
	lsr A		; 4A
	trb $4A.b		; 14 4A
	trb $1F.b		; 14 1F
	adc $6D12.w,X		; 7D 12 6D
	adc $70.b		; 65 70
	brk $2A.b		; 00 2A
.ACCU 8
	sep #$6D		; E2 6D
	clc		; 18
	and ($38.b,S),Y		; 33 38
	brk $63.b		; 00 63
	eor ($62.b,S),Y		; 53 62
	eor $BA.b		; 45 BA
	eor $AA.b,X		; 55 AA
	eor ($BE.b,X)		; 41 BE
	and $7C83C0.l,X		; 3F C0 83 7C
	ror $0D3D.w,X		; 7E 3D 0D
	ora $6A54.w,X		; 1D 54 6A
	rol $15.b,X		; 36 15
	eor ($54.b),Y		; 51 54
	adc $3D.b,X		; 75 3D
	rol $2BC0.w		; 2E C0 2B
	eor [$36.b],Y		; 57 36
	eor $750D.w		; 4D 0D 75
	trb $6F.b		; 14 6F
	rol $68.b,X		; 36 68
	pld		; 2B
	lsr A		; 4A
	trb $6F.b		; 14 6F
	rol $68.b,X		; 36 68
	lsr $3DE0.w		; 4E E0 3D
	rol $5EC0.w		; 2E C0 5E
	ora $5B.b,X		; 15 5B
	trb $17.b		; 14 17
	ora $6A4D.w,X		; 1D 4D 6A
	inc A		; 1A
	tda		; 7B
	tas		; 1B
	ora ($1A.b,S),Y		; 13 1A
	and $263C02.l		; 2F 02 3C 26
	clc		; 18
	rti		; 40

	eor $78708C.l,X		; 5F 8C 70 78
	trb $0D.b		; 14 0D
	rol $D8.b		; 26 D8
	tsb $08F0.w		; 0C F0 08
	beq  95.b		; F0 5F
	ora $6A.b,X		; 15 6A
	bit $34.b,X		; 34 34
	ora $147E53.l,X		; 1F 53 7E 14
	lsr $1D5E.w,X		; 5E 5E 1D
	eor ($AC.b)		; 52 AC
	eor ($AC.b)		; 52 AC
	adc ($8C.b)		; 72 8C
	ror A		; 6A
	ora $EC12.w		; 0D 12 EC
	ora $545E.w,X		; 1D 5E 54
	inc $173D.w		; EE 3D 17
	eor [$36.b],Y		; 57 36
	mvn $68,$51		; 54 51 68
	pld		; 2B
	cpx #$173D.w		; E0 3D 17
	rol $D8.b		; 26 D8
	tad		; 5B
	trb $36.b		; 14 36
	mvn $54,$51		; 54 51 54
	inc $9E3D.w		; EE 3D 9E
	rts		; 60

	stz $18.b		; 64 18
	ora $25.b,X		; 15 25
	and $30CE1D.l		; 2F 1D CE 30
	tas		; 1B
	adc [$17.b]		; 67 17
	ora [$57.b],Y		; 17 57
	ora [$6E.b],Y		; 17 6E
	tda		; 7B
	cli		; 58
	.db $42, $8C		; 42 8C
	.db $42, $8C		; 42 8C
	eor ($AC.b)		; 52 AC
	ora $B61D.w,X		; 1D 1D B6
	pha		; 48
	jmp ($3714.w)		; 6C 14 37
	jmp $2A61.w		; 4C 61 2A
	ror A		; 6A
	ror $677B.w		; 6E 7B 67
	ora $65E6.w,X		; 1D E6 65
	bvc  74.b		; 50 4A
	brk $1A.b		; 00 1A
	trb $3460.w		; 1C 60 34
	bit $1A.b,X		; 34 1A
	jmp ($2B00.w,X)		; 7C 00 2B
	ora $472713.l,X		; 1F 13 27 47
	ora ($06.b,X)		; 01 06
	ora ($02.b,X)		; 01 02
	ora $00.b,S		; 03 00
	inc A		; 1A
	stz $18.b		; 64 18
	rti		; 40

	rti		; 40

	inc A		; 1A
	jmp ($0800.w,X)		; 7C 00 08
	bpl 107.b		; 10 6B
	and $71.b,X		; 35 71
	sbc [$0F.b]		; E7 0F
	asl A		; 0A
	and $3400.w		; 2D 00 34
	bvc -32.b		; 50 E0
	phd		; 0B
	plp		; 28
	inc A		; 1A
	eor $1553.w,Y		; 59 53 15
	tad		; 5B
	brk $4E.b		; 00 4E
	rol $4D.b,X		; 36 4D
	adc $73.b,X		; 75 73
	rol $37C0.w		; 2E C0 37
	jmp ($4700.w,X)		; 7C 00 47
	eor [$53.b]		; 47 53
	eor $735B.w		; 4D 5B 73
	adc $6B005B.l		; 6F 5B 00 6B
	and $1E.b,X		; 35 1E
	rts		; 60

	php		; 08
	beq -104.b		; F0 98
	rts		; 60

	bit $70.b,X		; 34 70
	adc ($15.b,S),Y		; 73 15
	stz $25.b,X		; 74 25
	lsr $125F.w		; 4E 5F 12
	cpx $EE4D.w		; EC 4D EE
	brk $63.b		; 00 63
	tas		; 1B
	tas		; 1B
	adc $47.b,S		; 63 47
	asl $4700.w		; 0E 00 47
	eor [$47.b]		; 47 47
	ror $0D4E.w		; 6E 4E 0D
	rol $D8.b		; 26 D8
	tsb $5FF0.w		; 0C F0 5F
	ora $EE.b,X		; 15 EE
	brk $1B.b		; 00 1B
	tas		; 1B
	tas		; 1B
	eor #$28.b		; 49 28
	ora $5A5A.w		; 0D 5A 5A
	and #$D6.b		; 29 D6
	.db $62, $E7, $28		; 62 E7 28
	rol $4D.b,X		; 36 4D
	ora $73EE.w		; 0D EE 73
	ror $287C.w		; 6E 7C 28
	rol $54.b,X		; 36 54
	eor ($68.b),Y		; 51 68
	pld		; 2B
	asl A		; 0A
	eor ($54.b,S),Y		; 53 54
	stz $47.b,X		; 74 47
	asl A		; 0A
	.db $42, $BC		; 42 BC
	asl $4EE0.w,X		; 1E E0 4E
	pld		; 2B
	cpx #$5328.w		; E0 28 53
	jmp $597884.l		; 5C 84 78 59
	adc $00.b,X		; 75 00
	tas		; 1B
	ora $30CE.w,X		; 1D CE 30
	tas		; 1B
	eor #$28.b		; 49 28
	ora [$17.b],Y		; 17 17
	tad		; 5B
	plp		; 28
	ora [$37.b],Y		; 17 37
	tda		; 7B
	sec		; 38
	plp		; 28
	adc ($29.b),Y		; 71 29
	dec $5A.b,X		; D6 5A
	phy		; 5A
	adc $287E.w,Y		; 79 7E 28
	adc ($79.b),Y		; 71 79
	lsr $38.b		; 46 38
	and $62.b,X		; 35 62
	sbc [$28.b]		; E7 28
	ora [$0D.b],Y		; 17 0D
	stz $25.b,X		; 74 25
	asl A		; 0A
	ora $65E6.w,X		; 1D E6 65
	lsr A		; 4A
	brk $02.b		; 00 02
	trb $610E.w		; 1C 0E 61
	clc		; 18
	cpx #$61C8.w		; E0 C8 61
	jsl $001E1C.l		; 22 1C 1E 00
	rti		; 40

	and [$1C.b]		; 27 1C
	brk $40.b		; 00 40
	and [$1C.b]		; 27 1C
	brk $10.b		; 00 10
	cpx #$61C8.w		; E0 C8 61
	jsl $610E1C.l		; 22 1C 0E 61
	clc		; 18
	cpx #$00F0.w		; E0 F0 00
	eor ($62.b,S),Y		; 53 62
	eor $BA.b		; 45 BA
	eor $45A2.w,X		; 5D A2 45
	tsx		; BA
	.db $62, $83, $7C		; 62 83 7C
	ror $4F00.w,X		; 7E 00 4F
	eor $FF2D4F.l		; 4F 4F 2D FF
	ora $FF.b		; 05 FF
	brk $42.b		; 00 42
	xce		; FB
	brk $08.b		; 00 08
	bpl  80.b		; 10 50
	brk $08.b		; 00 08
	bpl   2.b		; 10 02
	lsr $0004.w		; 4E 04 00
	brk $05.b		; 00 05
	tsb $04.b		; 04 04
	asl $FF.b		; 06 FF
	sbc $050508.l,X		; FF 08 05 05
	ora #$33.b		; 09 33
	cmp $060A.w,X		; DD 0A 06
	asl $0B.b		; 06 0B
	php		; 08
	php		; 08
	tsb $F7CF.w		; 0C CF F7
	asl $CD33.w		; 0E 33 CD
	bpl   9.b		; 10 09
	ora #$12.b		; 09 12
	phd		; 0B
	phd		; 0B
	trb $87.b		; 14 87
	xce		; FB
	ora $0C.b,X		; 15 0C
	tsb $0316.w		; 0C 16 03
	sbc $9F17.w,X		; FD 17 9F
	sbc $C7FF1A.l		; EF 1A FF C7
	tas		; 1B
	asl A		; 0A
	asl A		; 0A
	trb $DF3F.w		; 1C 3F DF
	asl $7987.w,X		; 1E 87 79
	jsr $FBE7.w		; 20 E7 FB
	and ($14.b,X)		; 21 14
	asl $FF22.w		; 0E 22 FF
	sta $24.b,S		; 83 24
	ora ($12.b)		; 12 12
	and $17.b		; 25 17
	ora [$26.b],Y		; 17 26
	cmp $9328F3.l		; CF F3 28 93
	sbc $072A.w		; ED 2A 07
	sbc $222B.w,Y		; F9 2B 22
	asl $2C.b		; 06 2C
	sbc $072D81.l,X		; FF 81 2D 07
	xce		; FB
	rol $1E09.w		; 2E 09 1E
	and $307D83.l		; 2F 83 7D 30
	sta $2032E7.l,X		; 9F E7 32 20
	jsr $0C34.w		; 20 34 0C
	inc A		; 1A
	and $F3.b,X		; 35 F3
	sbc $2436.w,X		; FD 36 24
	bit $38.b		; 24 38
	ora ($FE.b,X)		; 01 FE
	dec A		; 3A
	asl $3B10.w		; 0E 10 3B
	trb $3D1C.w		; 1C 1C 3D
	sbc $063E11.l,X		; FF 11 3E 06
	and ($40.b,X)		; 21 40
	asl $4209.w		; 0E 09 42
	rol $30.b		; 26 30
	mvp $2B,$2E		; 44 2E 2B
	lsr $83.b		; 46 83
	sbc $F347.w,X		; FD 47 F3
	sta $1548.w		; 8D 48 15
	inc A		; 1A
	lsr A		; 4A
	and $3F4B2C.l		; 2F 2C 4B 3F
	cmp ($4C.b,X)		; C1 4C
	and $DD.b,S		; 23 DD
	eor $DB27.w		; 4D 27 DB
	lsr $C639.w		; 4E 39 C6
	eor $50B3CF.l		; 4F CF B3 50
	asl $FF.b,X		; 16 FF
	eor ($3F.b),Y		; 51 3F
	cmp $063D52.l		; CF 52 3D 06
	mvn $21,$0A		; 54 0A 21
	lsr $10.b,X		; 56 10
	asl $2F57.w,X		; 1E 57 2F
	eor [$58.b]		; 47 58
	and $59DE.w,Y		; 39 DE 59
	rti		; 40

	rol A		; 2A
	phy		; 5A
	sta ($6C.b,S),Y		; 93 6C
	tad		; 5B
	lda [$E7.b],Y		; B7 E7
	jmp $5EFBC7.l		; 5C C7 FB 5E
	bvc   1.b		; 50 01
	eor $60C33F.l,X		; 5F 3F C3 60
	pha		; 48
	asl $62.b		; 06 62
	sbc $16631F.l,X		; FF 1F 63 16
	phk		; 4B
	stz $5B.b		; 64 5B
	stp		; DB
	adc $E7.b		; 65 E7
	ora $FF66.w,Y		; 19 66 FF
	sbc $68.b,S		; E3 68
	cmp $E76964.l		; CF 64 69 E7
	sbc $FF6A.w,Y		; F9 6A FF
	ora $6B.b,S		; 03 6B
	sbc $FF6D18.l,X		; FF 18 6D FF
	sta $363636.l		; 8F 36 36 36
	rol $1B.b,X		; 36 1B
	tas		; 1B
	tsb $1414.w		; 0C 14 14
	rol $34.b		; 26 34
	bit $28.b,X		; 34 28
	plp		; 28
	plp		; 28
	bit $281B.w		; 2C 1B 28
	plp		; 28
	sec		; 38
	phy		; 5A
	sec		; 38
	phy		; 5A
	plp		; 28
	bit $460C.w		; 2C 0C 46
	phk		; 4B
	sta [$7B.b]		; 87 7B
	eor [$2A.b]		; 47 2A
	cmp $061A33.l		; CF 33 1A 06
	cli		; 58
	and ($DC.b,S),Y		; 33 DC
	adc $26.b		; 65 26
	sta $39E6.w,Y		; 99 E6 39
	dec $5C6B.w		; CE 6B 5C
	plp		; 28
	cmp [$BB.b]		; C7 BB
	bit #$F6.b		; 89 F6
	jmp $890E.w		; 4C 0E 89
	ror $FF.b,X		; 76 FF
	bra  37.b		; 80 25
	eor ($62.b),Y		; 51 62
	tas		; 1B
	jsr $2542.w		; 20 42 25
	pla		; 68
	ror $17.b		; 66 17
	pla		; 68
	and ($42.b)		; 32 42
	adc $9906.w		; 6D 06 99
	inc $BCC3.w		; EE C3 BC
	brk $FF.b		; 00 FF
	cmp $3C.b,S		; C3 3C
	sta $FFE6.w,Y		; 99 E6 FF
	dey		; 88
	asl A		; 0A
	ora $16.b,X		; 15 16
	cmp $1B3431.l		; CF 31 34 1B
	asl A		; 0A
	ora $30.b,X		; 15 30
	asl A		; 0A
	asl $5E.b		; 06 5E
	tas		; 1B
	tas		; 1B
	pha		; 48
	sbc $F3FE.w,Y		; F9 FE F3
	jsr ($4269.w,X)		; FC 69 42
	eor ($7F.b),Y		; 51 7F
	sta $3E3FFF.l,X		; 9F FF 3F 3E
	bpl  68.b		; 10 44
	tsb $F78F.w		; 0C 8F F7
	cmp $1415B7.l		; CF B7 15 14
	pld		; 2B
	and ($C7.b,X)		; 21 C7
	and $E39F.w,Y		; 39 9F E3
	eor ($5E.b),Y		; 51 5E
	rol $39C7.w,X		; 3E C7 39
	sbc ($CD.b,S),Y		; F3 CD
	mvp $14,$5C		; 44 5C 14
	eor $6516.w		; 4D 16 65
	jsr $0666.w		; 20 66 06
	adc $2D.b,S		; 63 2D
	sbc ($0D.b,S),Y		; F3 0D
	mvp $5F,$14		; 44 14 5F
	and $440E.w		; 2D 0E 44
	asl $F3.b,X		; 16 F3
	ora $4269.w		; 0D 69 42
	ora [$6D.b],Y		; 17 6D
	rol $0E1E.w,X		; 3E 1E 0E
	mvp $09,$21		; 44 21 09
	eor [$87.b],Y		; 57 87
	sbc $602B.w,Y		; F9 2B 60
	rts		; 60

	rts		; 60

	ora $30.b,X		; 15 30
	jsr $5142.w		; 20 42 51
	sta $66686F.l,X		; 9F 6F 68 66
	asl A		; 0A
	lsr $5E06.w,X		; 5E 06 5E
	asl $17.b		; 06 17
	pla		; 68
	sbc ($ED.b,S),Y		; F3 ED
	adc #$42.b		; 69 42
	adc $F321.w		; 6D 21 F3
	ora $2669.w,X		; 1D 69 26
	inc A		; 1A
	bit $46.b,X		; 34 46
	lsr $BA45.w		; 4E 45 BA
	eor $AA.b,X		; 55 AA
	eor ($BE.b,X)		; 41 BE
	and $7C83C0.l,X		; 3F C0 83 7C
	bit $093E.w		; 2C 3E 09
	asl $40.b,X		; 16 40
	eor ($2D.b)		; 52 2D
	asl $592A.w		; 0E 2A 59
	ror A		; 6A
	rol $D13F.w,X		; 3E 3F D1
	trb $2D44.w		; 1C 44 2D
	dec A		; 3A
	ora #$2A.b		; 09 2A
	ror A		; 6A
	asl $63.b		; 06 63
	and $1C5F.w		; 2D 5F 1C
	lsr $6306.w,X		; 5E 06 63
	and $3B5F.w		; 2D 5F 3B
	.db $62, $3E, $3F		; 62 3E 3F
	cmp ($4C.b),Y		; D1 4C
	asl $064A.w		; 0E 4A 06
	bpl  22.b		; 10 16
	dec A		; 3A
	eor ($14.b)		; 52 14
	eor $140C15.l		; 4F 15 0C 14
	pld		; 2B
	cmp $FD.b,S		; C3 FD
	sbc [$D9.b]		; E7 D9
	and ($4D.b)		; 32 4D
	sta $87FF73.l		; 8F 73 FF 87
	asl $09.b		; 06 09
	and [$D9.b]		; 27 D9
	ora $F70FF3.l		; 0F F3 0F F7
	eor $520E.w		; 4D 0E 52
	and $25.b		; 25 25
	ora [$46.b],Y		; 17 46
	bit $4C06.w		; 2C 06 4C
	jmp $5316.w		; 4C 16 53
	lda $AD53.w		; AD 53 AD
	adc ($8D.b,S),Y		; 73 8D
	eor ($09.b)		; 52 09
	ora ($ED.b,S),Y		; 13 ED
	asl $4C.b,X		; 16 4C
	rti		; 40

	and $103E.w,X		; 3D 3E 10
	mvp $59,$2D		; 44 2D 59
	eor $3E621C.l,X		; 5F 1C 62 3E
	bpl  39.b		; 10 27
	cmp $064A.w,Y		; D9 4A 06
	and $4059.w		; 2D 59 40
	and $9F3E.w,X		; 3D 3E 9F
	adc ($E7.b,X)		; 61 E7
	txy		; 9B
	asl $2B1E.w		; 0E 1E 2B
	asl $CF.b,X		; 16 CF
	and ($15.b),Y		; 31 15
	rts		; 60

	bpl  16.b		; 10 10
	mvp $56,$10		; 44 10 56
	eor $73061A.l		; 4F 1A 06 73
	lda $BD73.w,X		; BD 73 BD
	eor ($AD.b,S),Y		; 53 AD
	asl $16.b,X		; 16 16
	lda [$49.b],Y		; B7 49
	sbc $2E0693.l,X		; FF 93 06 2E
	eor $52210C.l		; 4F 0C 21 52
	lsr $4F.b,X		; 56 4F
	rts		; 60

	asl $65.b,X		; 16 65
	.db $42, $51		; 42 51
	lsr $9F14.w,X		; 5E 14 9F
	sbc $25.b,S		; E3 25
	and $14.b		; 25 14
	jsl $0C171C.l		; 22 1C 17 0C
	jsr $F935.w		; 20 35 F9
	inc $FEFD.w,X		; FE FD FE
	sbc $E714FC.l,X		; FF FC 14 E7
	txy		; 9B
	and ($32.b)		; 32 32
	trb $22.b		; 14 22
	sbc $285CF7.l		; EF F7 5C 28
	cli		; 58
	rtl		; 6B

	tas		; 1B
	tas		; 1B
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	and $51.b		; 25 51
	.db $62, $1B, $0A		; 62 1B 0A
	trb $47.b		; 14 47
	lsr $0E.b		; 46 0E
	lsr A		; 4A
	tsa		; 3B
	and $2A3A.w		; 2D 3A 2A
	ror A		; 6A
	mvn $D1,$3F		; 54 3F D1
	rol $3522.w		; 2E 22 35
	and $46.b,X		; 35 46
	dec A		; 3A
	lsr A		; 4A
	mvn $4A,$63		; 54 63 4A
	jmp $E19F28.l		; 5C 28 9F E1
	ora $679FF7.l		; 0F F7 9F 67
	and $6D.b		; 25 6D
	mvn $57,$0E		; 54 0E 57
	asl $4D3B.w,X		; 1E 3B 4D
	ora ($ED.b,S),Y		; 13 ED
	dec A		; 3A
	and $1534.w,X		; 3D 34 15
	ora $34.b,X		; 15 34
	and $FF.b,X		; 35 FF
	sbc ($35.b),Y		; F1 35
	and $35.b,X		; 35 35
	lsr $3B.b,X		; 56 3B
	ora #$27.b		; 09 27
	cmp $F30F.w,Y		; D9 0F F3
	eor $3D0E.w		; 4D 0E 3D
	ora $15.b,X		; 15 15
	ora $34.b,X		; 15 34
	asl A		; 0A
	ora #$38.b		; 09 38
	sec		; 38
	and #$D6.b		; 29 D6
	lsr $0A6B.w		; 4E 6B 0A
	and $093A.w		; 2D 3A 09
	and $5654.w,X		; 3D 54 56
	jsl $592D0A.l		; 22 0A 2D 59
	eor $460A1C.l,X		; 5F 1C 0A 46
	rti		; 40

	eor [$35.b],Y		; 57 35
	asl A		; 0A
	eor $BD.b,S		; 43 BD
	ora $1C3BE1.l,X		; 1F E1 3B 1C
	.db $62, $0A, $46		; 62 0A 46
	phk		; 4B
	sta [$7B.b]		; 87 7B
	eor [$2A.b]		; 47 2A
	ror A		; 6A
	ora $16.b,X		; 15 16
	cmp $341531.l		; CF 31 15 34
	asl A		; 0A
	bpl  16.b		; 10 10
	lsr A		; 4A
	asl A		; 0A
	bpl  46.b		; 10 2E
	eor $580A1A.l		; 4F 1A 0A 58
	and #$D6.b		; 29 D6
	sec		; 38
	sec		; 38
	phy		; 5A
	bit $580A.w		; 2C 0A 58
	phy		; 5A
	cmp [$B9.b]		; C7 B9
	plp		; 28
	lsr $0A6B.w		; 4E 6B 0A
	bpl   9.b		; 10 09
	eor [$1E.b],Y		; 57 1E
	asl A		; 0A
	asl $65.b,X		; 16 65
	.db $42, $5E		; 42 5E
	sbc $FD.b,S		; E3 FD
	cmp $1F0CF1.l		; CF F1 0C 1F
	sbc [$CF.b]		; E7 CF
	and [$0C.b],Y		; 37 0C
	sbc $DD.b,S		; E3 DD
	sbc $2032E1.l,X		; FF E1 32 20
	ror $32.b		; 66 32
	jsr $1F66.w		; 20 66 1F
	sbc $0C37CF.l		; EF CF 37 0C
	sbc $DD.b,S		; E3 DD
	cmp $1F0CF1.l		; CF F1 0C 1F
	sbc [$FF.b]		; E7 FF
	ora $454E46.l		; 0F 46 4E 45
	tsx		; BA
	eor $45A2.w,X		; 5D A2 45
	tsx		; BA
	lsr $7C83.w		; 4E 83 7C
	bit $1B0B.w		; 2C 0B 1B
	asl A		; 0A
	asl $FF.b		; 06 FF
	cop $FF.b		; 02 FF
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	tsb $11B9.w		; 0C B9 11
	brk $7C.b		; 00 7C
	lda $14.b		; A5 14
	dec $5A.b,X		; D6 5A
	txs		; 9A
	ora $5F1D.w,Y		; 19 1D 5F
	lda $14.b		; A5 14
	dec $5A.b,X		; D6 5A
	dec $5A.b,X		; D6 5A
	lsr A		; 4A
	and #$A5.b		; 29 A5
	trb $4A.b		; 14 4A
	and #$10.b		; 29 10
	.db $42, $FF		; 42 FF
	adc $402FDF.l,X		; 7F DF 2F 40
	stz $E5.b		; 64 E5
	adc $037D.w,X		; 7D 7D 03
	tsa		; 3B
	ora $3A.b,S		; 03 3A
	brk $7F.b		; 00 7F
	and $0276.w		; 2D 76 02
	ora $0E443F.l,X		; 1F 3F 44 0E
	rts		; 60

	ora $1F.b,S		; 03 1F
	ora ($BF.b)		; 12 BF
	ora ($9C.b,X)		; 01 9C
	ora ($79.b,X)		; 01 79
	ora ($57.b,X)		; 01 57
	ora ($09.b,X)		; 01 09
	plp		; 28
	brk $30.b		; 00 30
	sty $10.b		; 84 10
	dec $7C.b		; C6 7C
	php		; 08
	brk $00.b		; 00 00
	brk $55.b		; 00 55
	ora ($B5.b,X)		; 01 B5
	lsr $4A.b,X		; 56 4A
	and #$4A.b		; 29 4A
	adc $3DEF.w,X		; 7D EF 3D
	cmp $295F18.l,X		; DF 18 5F 29
	phy		; 5A
	rtl		; 6B

	sbc $7FFF2B.l,X		; FF 2B FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 017FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 017FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 017FFF. Skipping.
.ENDS
