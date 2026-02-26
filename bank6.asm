.BANK 6 SLOT 0
.ORG $0000

.SECTION "Bank6" FORCE

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FFEAFF.l,X		; FF FF EA FF
	cpx #$FF.b		; E0 FF
	eor $5F.b		; 45 5F
	ldx #$BA.b		; A2 BA
	eor [$4F.b]		; 47 4F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $EAFFFF.l,X		; FF FF FF EA
	sbc $E05FE0.l,X		; FF E0 5F E0
	tsx		; BA
	sbc $4F.b		; E5 4F
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $FFFF55.l,X		; FF 55 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFAAFF.l,X		; FF FF AA FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $FFFF55.l,X		; FF 55 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFAAFF.l,X		; FF FF AA FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $FEFF55.l,X		; FF 55 FF FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $AAFFFF.l,X		; FF FF FF AA
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $7F01.w,X		; FE 01 7F
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $AAFF55.l,X		; FF 55 FF AA
	tax		; AA
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $55AA00.l,X		; FF 00 AA 55
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	tax		; AA
	sbc $57FF00.l,X		; FF 00 FF 57
	sbc $FCAEA0.l,X		; FF A0 AE FC
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFAA.l,X		; FF AA FF 00
	sbc $51AE03.l,X		; FF 03 AE 51
	jsr ($FF07.w,X)		; FC 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBEEEE.l,X		; FF EE EE FB
	xce		; FB
	cmp $D5.b,X		; D5 D5
	tax		; AA
	tax		; AA
	mvp $FF,$44		; 44 44 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFEE.l,X		; FF EE FF FB
	sbc $AAFFD5.l,X		; FF D5 FF AA
	sbc $FFFF44.l,X		; FF 44 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BBEEEE.l,X		; FF EE EE BB
	tyx		; BB
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	mvp $FF,$44		; 44 44 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $FFFF44.l,X		; FF 44 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BAEFEF.l,X		; FF EF EF BA
	tyx		; BB
	mvn $AB,$55		; 54 55 AB
	plb		; AB
	lsr $46.b		; 46 46
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFEFFF.l,X		; FF FF EF FF
	tyx		; BB
	inc $FE55.w,X		; FE 55 FE
	plb		; AB
	jsr ($FD46.w,X)		; FC 46 FD
	sbc $FFE0FF.l,X		; FF FF E0 FF
	sta $C05FFF.l,X		; 9F FF 5F C0
	lda $30709F.l,X		; BF 9F 70 30
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $3FC080.l,X		; FF 80 C0 3F
	sta $C03060.l,X		; 9F 60 30 C0
	rti		; 40

	bra  64.b		; 80 40
	bra  -1.b		; 80 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7BEEEE.l,X		; FF EE EE 7B
	xce		; FB
	adc $F5.b,X		; 75 F5
	tax		; AA
	nop		; EA
	ldy $E4.b		; A4 E4
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFEEFF.l,X		; FF FF EE FF
	xce		; FB
	and $EA5FF5.l,X		; 3F F5 5F EA
	and $001FE4.l,X		; 3F E4 1F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $060000.l,X		; FF 00 00 06
	ora ($BD.b,X)		; 01 BD
	rti		; 40

	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FD.b		; 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00FD00.l		; 0F 00 FD 00
	sbc ($00.b),Y		; F1 00
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
	ora $FBE2.w,X		; 1D E2 FB
	tsb $DC.b		; 04 DC
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $DBF807.l,X		; FF 07 F8 DB
	bit $DC.b		; 24 DC
	brk $AA.b		; 00 AA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $B242BD.l,X		; FF BD 42 B2
	brk $CD.b		; 00 CD
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8A04FB.l,X		; FF FB 04 8A
	brk $16.b		; 00 16
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $2014AA.l,X		; FF AA 14 20
	php		; 08
	ora ($01.b)		; 12 01
	jsr $1510.w		; 20 10 15
	trb $00.b		; 14 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  -2.b		; F0 FE
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0020DF.l,X		; FF DF 20 00
	asl A		; 0A
	ora ($80.b,X)		; 01 80
	php		; 08
	bpl  68.b		; 10 44
	and $00.b		; 25 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $05FF00.l,X		; FF 00 FF 05
	plx		; FA
	ror $E581.w,X		; 7E 81 E5
	inc A		; 1A
	lda $FF0040.l,X		; BF 40 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $800000.l,X		; FF 00 00 80
	brk $00.b		; 00 00
	clc		; 18
	bpl  64.b		; 10 40
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $00FF80.l,X		; 7F 80 FF 00
	ldy $4B.b,X		; B4 4B
	xce		; FB
	tsb $00.b		; 04 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	eor ($00.b,S),Y		; 53 00
	bpl  18.b		; 10 12
	brk $5B.b		; 00 5B
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $EF53AC.l,X		; FF AC 53 EF
	bpl -19.b		; 10 ED
	ora ($BF.b)		; 12 BF
	rti		; 40

	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	pea $FF0B.w		; F4 0B FF
	brk $03.b		; 00 03
	bvc -124.b		; 50 84
	ora ($20.b,X)		; 01 20
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7A53AC.l,X		; FF AC 53 7A
	sta $0F.b		; 85 0F
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FD.b		; 00 FD
	cop $02.b		; 02 02
	brk $10.b		; 00 10
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00.b,X		; 55 00
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
	brk $00.b		; 00 00
	sbc $006700.l,X		; FF 00 67 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	ora ($11.b),Y		; 11 11
	brk $00.b		; 00 00
	dey		; 88
	dey		; 88
	eor $55.b,X		; 55 55
	inc $BBEE.w		; EE EE BB
	tyx		; BB
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($FF.b),Y		; 11 FF
	brk $FF.b		; 00 FF
	dey		; 88
	adc [$55.b],Y		; 77 55
	tax		; AA
	inc $BB11.w		; EE 11 BB
	mvp $00,$FF		; 44 FF 00
	sbc $1F1F00.l,X		; FF 00 1F 1F
	and $BB3C.w,X		; 3D 3C BB
	lda $F9797A.l,X		; BF 7A 79 F9
	sbc $B9B9.w,Y		; F9 B9 B9
	pei ($CC.b)		; D4 CC
	jsr ($16FC.w,X)		; FC FC 16
	cpx #$24.b		; E0 24
	cmp $87.b,S		; C3 87
	rti		; 40

	rti		; 40

	sta [$C2.b]		; 87 C2
	tsb $82.b		; 04 82
	mvp $3A,$C1		; 44 C1 3A
	sbc ($02.b,X)		; E1 02
	sbc ($F1.b),Y		; F1 F1
	sei		; 78
	sei		; 78
	clv		; B8
	sed		; F8
	lda $3E3D.w,X		; BD 3D 3E
	rol $3B3B.w,X		; 3E 3B 3B
	eor [$67.b]		; 47 67
	adc $0FD17F.l,X		; 7F 7F D1 0F
	pha		; 48
	sta [$C0.b]		; 87 C0
	ora [$05.b]		; 07 05
	rep #$86		; C2 86
	eor ($83.b,X)		; 41 83
	mvp $B8,$07		; 44 07 B8
	ora $121280.l		; 0F 80 12 12
	cop $02.b		; 02 02
	txa		; 8A
	txa		; 8A
	lsr $56.b,X		; 56 56
	cpx $B8EC.w		; EC EC B8
	clv		; B8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FD12.w,X)		; FC 12 FD
	cop $FD.b		; 02 FD
	txa		; 8A
	adc $56.b,X		; 75 56
	lda #$EC.b		; A9 EC
	ora ($B8.b,S),Y		; 13 B8
	eor [$FC.b]		; 47 FC
	ora $FC.b,S		; 03 FC
	ora $80.b,S		; 03 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  49.b		; 80 31
	adc ($20.b),Y		; 71 20
	rts		; 60

	plp		; 28
	pla		; 68
	and $65.b		; 25 65
	rol $6B6E.w		; 2E 6E 6B
	rtl		; 6B

	adc $6F6F6F.l		; 6F 6F 6F 6F
	adc ($9F.b),Y		; 71 9F
	rts		; 60

	sta $659768.l,X		; 9F 68 97 65
	txs		; 9A
	ror $6B91.w		; 6E 91 6B
	sty $6F.b,X		; 94 6F
	bcc 111.b		; 90 6F
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $20.b,S		; 03 20
	cli		; 58
	bra   0.b		; 80 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	adc $48B780.l,X		; 7F 80 B7 48
	sbc $0006.w,Y		; F9 06 00
	brk $00.b		; 00 00
	brk $34.b		; 00 34
	phd		; 0B
	brk $C0.b		; 00 C0
	tsb $20.b		; 04 20
	bpl  64.b		; 10 40
	tsb $04.b		; 04 04
	pld		; 2B
	pld		; 2B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $24DBC0.l,X		; 3F C0 DB 24
	ldx #$5D.b		; A2 5D
	mvp $2B,$BB		; 44 BB 2B
	pei ($00.b)		; D4 00
	ora $C0.b,S		; 03 C0
	dec A		; 3A
	brk $80.b		; 00 80
	ora ($50.b,X)		; 01 50
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	eor [$57.b],Y		; 57 57
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora $FA.b		; 05 FA
	ror $A481.w,X		; 7E 81 A4
	tad		; 5B
	ldy #$5F.b		; A0 5F
	ora ($FE.b,X)		; 01 FE
	eor [$A8.b],Y		; 57 A8
	sbc $D00900.l,X		; FF 00 09 D0
	tsb $0A00.w		; 0C 00 0A
	brk $50.b		; 00 50
	brk $01.b		; 00 01
	ora ($AE.b,X)		; 01 AE
	ldx $7777.w		; AE 77 77
	sbc $D926FF.l,X		; FF FF 26 D9
	beq  15.b		; F0 0F
	ldy #$5F.b		; A0 5F
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ldx $7751.w		; AE 51 77
	dey		; 88
	sbc $007800.l,X		; FF 00 78 00
	mvn $88,$00		; 54 00 88
	brk $03.b		; 00 03
	ora $57.b,S		; 03 57
	eor [$FB.b],Y		; 57 FB
	xce		; FB
	adc $FFFE7F.l,X		; 7F 7F FE FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	eor [$A8.b],Y		; 57 A8
	xce		; FB
	tsb $7F.b		; 04 7F
	bra  -1.b		; 80 FF
	brk $A8.b		; 00 A8
	brk $10.b		; 00 10
	brk $05.b		; 00 05
	ora $EA.b		; 05 EA
	nop		; EA
	adc [$77.b],Y		; 77 77
	sbc $FFFEFF.l,X		; FF FF FE FF
	plb		; AB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $EAFA05.l,X		; FF 05 FA EA
	ora $77.b,X		; 15 77
	dey		; 88
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00A000.l,X		; FF 00 A0 00
	cop $02.b		; 02 02
	eor [$57.b],Y		; 57 57
	xce		; FB
	xce		; FB
	adc [$77.b],Y		; 77 77
	sbc $FFD4FF.l,X		; FF FF D4 FF
	jsl $FF00FF.l		; 22 FF 00 FF
	cop $FD.b		; 02 FD
	eor [$A8.b],Y		; 57 A8
	xce		; FB
	tsb $77.b		; 04 77
	dey		; 88
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	nop		; EA
	nop		; EA
	adc [$77.b],Y		; 77 77
	sbc $FFFFFF.l,X		; FF FF FF FF
	plx		; FA
	sbc $29FD52.l,X		; FF 52 FD 29
	sbc $FF00.w,X		; FD 00 FF
	nop		; EA
	ora $77.b,X		; 15 77
	dey		; 88
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FC00.l,X		; FF 00 FC 03
	sbc $9506.w,Y		; F9 06 95
	sta $EA.b,X		; 95 EA
	nop		; EA
	jmp ($F17A.w,X)		; 7C 7A F1
	sbc #$C6.b		; E9 C6
	cmp $99.b,S		; C3 99
	and $F5776A.l		; 2F 6A 77 F5
	sta $EA6A95.l,X		; 9F 95 6A EA
	ora $79.b,X		; 15 79
	stx $E7.b		; 86 E7
	clc		; 18
	xce		; FB
	tsb $4F.b		; 04 4F
	bcs  -9.b		; B0 F7
	php		; 08
	sta $506261.l,X		; 9F 61 62 50
	phd		; 0B
	ldy #$7A.b		; A0 7A
	and [$91.b]		; 27 91
	adc $A9FF64.l,X		; 7F 64 FF A9
	sbc $55FF27.l,X		; FF 27 FF 55
	sbc $54B24D.l,X		; FF 4D B2 54
	plb		; AB
	lda [$58.b]		; A7 58
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $27FF01.l,X		; FF 01 FF 27
	sbc $297F55.l,X		; FF 55 7F 29
	rol $77.b,X		; 36 77
	jsl $FF8AFF.l		; 22 FF 8A FF
	bcs  -1.b		; B0 FF
	cmp $FF7FFF.l		; CF FF 7F FF
	sbc $56A9FF.l,X		; FF FF A9 56
	adc [$88.b],Y		; 77 88
	sbc $02FF00.l,X		; FF 00 FF 02
	sbc $CFFF30.l,X		; FF 30 FF CF
	sbc [$77.b],Y		; F7 77
	sbc $63FD.w,X		; FD FD 63
	lda $44FF88.l,X		; BF 88 FF 44
	sbc $DDFF71.l,X		; FF 71 FF DD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BFFFFF.l,X		; FF FF FF BF
	rti		; 40

	sbc $44FF00.l,X		; FF 00 FF 44
	sbc $DDFF71.l,X		; FF 71 FF DD
	sbc $EEEEFF.l,X		; FF FF EE EE
	lda ($B1.b),Y		; B1 B1
	pha		; 48
	sbc $77FFA1.l,X		; FF A1 FF 77
	sbc $FFFF37.l,X		; FF 37 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc [$FF.b],Y		; 77 FF
	and [$FF.b],Y		; 37 FF
	sbc $EBFFFF.l,X		; FF FF FF EB
	xba		; EB
	eor [$57.b],Y		; 57 57
	ldx $FC.b,Y		; B6 FC
	rol $FF.b		; 26 FF
	bit $FF.b,X		; 34 FF
	sbc $FFFDFF.l,X		; FF FF FD FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FCFF.l,X		; FF FF FC 03
	sbc $24FF04.l,X		; FF 04 FF 24
	sbc $FDFFEF.l,X		; FF EF FF FD
	sbc $DFDFFF.l,X		; FF FF DF DF
	sbc [$F7.b],Y		; F7 F7
.ACCU 8
.INDEX 8
	sep #$70		; E2 70
	bcc  -1.b		; 90 FF
	jmp $C0FF.w		; 4C FF C0
	sbc $DFFFFE.l,X		; FF FE FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF8F70.l,X		; FF 70 8F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	inc $DFFF.w,X		; FE FF DF
	sbc [$F7.b],Y		; F7 F7
	sbc $4442FF.l,X		; FF FF 42 44
	pha		; 48
	dey		; 88
	lsr $0FE1.w,X		; 5E E1 0F
	inc $FF8B.w,X		; FE 8B FF
	bne  -1.b		; D0 FF
	adc ($FF.b)		; 72 FF
	cmp $FF.b,X		; D5 FF
	sed		; F8
	ora [$9F.b]		; 07 9F
	rts		; 60

	cpx #$1F.b		; E0 1F
	inc $FF01.w,X		; FE 01 FF
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	adc ($FF.b)		; 72 FF
	cmp $00.b,X		; D5 00
	brk $D0.b		; 00 D0
	bne  58.b		; D0 3A
	inc A		; 1A
	cpy $F364.w		; CC 64 F3
	lda $D9F8.w		; AD F8 D9
	pld		; 2B
	sbc $57.b,X		; F5 57
	inc $FF00.w,X		; FE 00 FF
	bne  47.b		; D0 2F
	phx		; DA
	and $54.b		; 25 54
	plb		; AB
	lda ($5E.b,X)		; A1 5E
	phx		; DA
	and $F5.b		; 25 F5
	asl A		; 0A
	inc $8A41.w,X		; FE 41 8A
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	jsr $5454.w		; 20 54 54
	pla		; 68
	pla		; 68
	inc $377E.w,X		; FE 7E 37
	eor $0097CA.l,X		; 5F CA 97 00
	sbc $20FF00.l,X		; FF 00 FF 20
	cmp $68AB54.l,X		; DF 54 AB 68
	sta [$7E.b],Y		; 97 7E
	sta ($9F.b,X)		; 81 9F
	rts		; 60

	lda [$58.b]		; A7 58
	sbc $004500.l		; EF 00 45 00
	cop $00.b		; 02 00
	rti		; 40

	rti		; 40

	tax		; AA
	tax		; AA
	cmp $FFD9.w,Y		; D9 D9 FF
	sbc $00FFAE.l,X		; FF AE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $AABF40.l,X		; FF 40 BF AA
	eor $D9.b,X		; 55 D9
	rol $FF.b		; 26 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	brk $36.b		; 00 36
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $54.b		; 00 54
	mvn $E2,$E2		; 54 E2 E2
	inc $00FE.w,X		; FE FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E2AB54.l,X		; FF 54 AB E2
	ora $01FE.w,X		; 1D FE 01
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	cmp $081720.l,X		; DF 20 17 08
	jsl $000000.l		; 22 00 00 00
	bne -48.b		; D0 D0
	lda $B5.b,X		; B5 B5
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FA.b		; 05 FA
	brk $FF.b		; 00 FF
	bne  47.b		; D0 2F
	lda $4A.b,X		; B5 4A
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	rol A		; 2A
	sbc $8F01.w,X		; FD 01 8F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AA.b		; 00 AA
	eor $55.b,X		; 55 55
	tax		; AA
	rol A		; 2A
	cmp $01.b,X		; D5 01
	inc $8F70.w,X		; FE 70 8F
	lsr $17A1.w,X		; 5E A1 17
	inx		; E8
	brk $FF.b		; 00 FF
	tay		; A8
	tay		; A8
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	nop		; EA
	rol A		; 2A
	adc $AF05.w,X		; 7D 05 AF
	brk $11.b		; 00 11
	asl $A8.b		; 06 A8
	eor [$55.b],Y		; 57 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	rol A		; 2A
	cmp $85.b,X		; D5 85
	ply		; 7A
	bvc -81.b		; 50 AF
	inx		; E8
	ora [$00.b],Y		; 17 00
	brk $50.b		; 00 50
	bvc -86.b		; 50 AA
	tax		; AA
	eor $54.b,X		; 55 54
	tay		; A8
	lda [$50.b]		; A7 50
	eor $F1ACB2.l,X		; 5F B2 AC F1
	tsb $FF00.w		; 0C 00 FF
	bvc -81.b		; 50 AF
	tax		; AA
	eor $54.b,X		; 55 54
	plb		; AB
	ldy #$5F.b		; A0 5F
	bvc -81.b		; 50 AF
	ldy #$5F.b		; A0 5F
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$A0.b		; A0 A0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor $00FF80.l,X		; 5F 80 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	ldy #$5F.b		; A0 5F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$1F.b		; E0 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	adc $FF0080.l,X		; 7F 80 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	bra 127.b		; 80 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sed		; F8
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $07.b		; 00 07
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $807F00.l,X		; FF 00 7F 80
	adc $FF0080.l,X		; 7F 80 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	bra   8.b		; 80 08
	beq   5.b		; F0 05
	sbc $1BA7.w,X		; FD A7 1B
	cmp [$1B.b]		; C7 1B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FA.b		; 05 FA
	sta $7C.b,S		; 83 7C
	cmp $3C.b,S		; C3 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $55.b,X		; 55 55
	nop		; EA
	nop		; EA
	sbc $F5.b,X		; F5 F5
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor $AA.b,X		; 55 AA
	nop		; EA
	ora $F5.b,X		; 15 F5
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tax		; AA
	tax		; AA
	mvn $00,$54		; 54 54 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $AAFF00.l,X		; FF 00 FF AA
	eor $54.b,X		; 55 54
	plb		; AB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $E0EE.w,X		; FE EE E0
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E000FF.l,X		; FF FF 00 E0
	ora ($E0.b),Y		; 11 E0
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8000FF.l,X		; FF FF 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	jsr ($0000.w,X)		; FC 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	cop $01.b		; 02 01
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0F0F.l		; EF 0F 0F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0F00FF.l,X		; FF FF 00 0F
	bpl  15.b		; 10 0F
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FC00.l,X		; FF 00 FC 03
	jsr ($FC03.w,X)		; FC 03 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $1F.b		; 00 1F
	brk $80.b		; 00 80
	ldy #$FF.b		; A0 FF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpx #$80.b		; E0 80
	adc $FF3FC0.l,X		; 7F C0 3F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $05.b		; 00 05
	brk $FB.b		; 00 FB
	ora ($0B.b,X)		; 01 0B
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	inc $FC03.w,X		; FE 03 FC
	sbc $6F6F00.l,X		; FF 00 6F 6F
	adc $6F6F6F.l		; 6F 6F 6F 6F
	adc $EFEF6F.l		; 6F 6F EF EF
	cmp $BFBFDF.l,X		; DF DF BF BF
	sbc $906F00.l,X		; FF 00 6F 90
	adc $906F90.l		; 6F 90 6F 90
	adc $10EF90.l		; 6F 90 EF 10
	cmp $40BF20.l,X		; DF 20 BF 40
	sbc $8A8A00.l,X		; FF 00 8A 8A
	adc [$77.b],Y		; 77 77
	xce		; FB
	xce		; FB
	sbc $FFD5FF.l,X		; FF FF D5 FF
	plp		; 28
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $F725DA.l,X		; FF DA 25 F7
	php		; 08
	xce		; FB
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF7F7F.l,X		; FF 7F 7F FF
	sbc $04FFA8.l,X		; FF A8 FF 04
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $5CFFFF.l,X		; FF FF FF 5C
	sbc $00FF88.l,X		; FF 88 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFF807.l,X		; FF 07 F8 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $54FFEC.l,X		; FF EC FF 54
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  -1.b		; F0 FF
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $80FF75.l		; 0F 75 FF 80
	sbc $00FF40.l,X		; FF 40 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  -1.b		; F0 FF
	ora $FFFFFF.l		; 0F FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $11FFFF.l		; 0F FF FF 11
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $07FF00.l,X		; FF 00 FF 07
	sed		; F8
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $FF10FF.l,X		; FF FF 10 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $FBFF00.l,X		; FF 00 FF FB
	sbc $EFFDF7.l,X		; FF F7 FD EF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	jsr ($FB03.w,X)		; FC 03 FB
	jsr ($F8F7.w,X)		; FC F7 F8
	sbc $E915F0.l		; EF F0 15 E9
	ora $A7.b		; 05 A7
	ror $B527.w		; 6E 27 B5
	and $52DFF8.l,X		; 3F F8 DF 52
	sbc $4AFF81.l,X		; FF 81 FF 4A
	sbc $871EE1.l,X		; FF E1 1E 87
	sei		; 78
	and [$D8.b]		; 27 D8
	and $20DFC0.l,X		; 3F C0 DF 20
	sbc $01FF02.l,X		; FF 02 FF 01
	sbc $FFA80A.l,X		; FF 0A A8 FF
	phy		; 5A
	sbc $2AFF11.l,X		; FF 11 FF 2A
	sbc $AFFF17.l,X		; FF 17 FF AF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cop $FF.b		; 02 FF
	ora ($FF.b,X)		; 01 FF
	rol A		; 2A
	sbc $ADFD17.l,X		; FF 17 FD AD
	inc $D0FE.w,X		; FE FE D0
	bne  15.b		; D0 0F
	sbc $FFFFAF.l,X		; FF AF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $CFFFF3.l,X		; FF F3 FF CF
	sbc $FFFF3F.l,X		; FF 3F FF FF
	ora $FEADFD.l		; 0F FD AD FE
	inc $D4D4.w,X		; FE D4 D4
	sta $80.b,S		; 83 80
	eor $0F3F43.l		; 4F 43 3F 0F
	sbc $FFFF3F.l,X		; FF 3F FF FF
	sbc $FFF0FF.l,X		; FF FF F0 FF
	sta $FF7FFF.l		; 8F FF 7F FF
	sed		; F8
	jsr ($EFE7.w,X)		; FC E7 EF
	sta $FAFAF8.l,X		; 9F F8 FA FA
	rti		; 40

	rti		; 40

	ora $0F7F00.l		; 0F 00 7F 0F
	sbc $FCFB7F.l,X		; FF 7F FB FC
	sbc [$E8.b],Y		; F7 E8
	sta $FFFFE0.l,X		; 9F E0 FF FF
	inc $01FF.w,X		; FE FF 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FC5303.l,X		; FF 03 53 FC
	sbc $03FF.w,X		; FD FF 03
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $53AFFF.l,X		; FF FF AF 53
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00BF3F.l,X		; FF 3F BF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFBF7F.l,X		; FF 7F BF FF
	sbc $F0FF0F.l,X		; FF 0F FF F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FF07.l,X		; FF 07 FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01EFEF.l,X		; FF EF EF 01
	ora ($F8.b,X)		; 01 F8
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $F9FFE7.l,X		; FF E7 FF F9
	sbc $FFFFFE.l,X		; FF FE FF FF
	sed		; F8
	eor $3F3F5A.l,X		; 5F 5A 3F 3F
	ora $15.b,X		; 15 15
	cpx #$00.b		; E0 00
	sbc $FEE1.w,Y		; F9 E1 FE
	sed		; F8
	sbc $FF0AFE.l,X		; FF FE 0A FF
	lda $C4FF.w		; AD FF C4
	sbc $F4FFAA.l,X		; FF AA FF F4
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $FFFF7F.l,X		; FF 7F FF FF
	brk $FF.b		; 00 FF
	ldy #$FF.b		; A0 FF
	cpy #$FF.b		; C0 FF
	tax		; AA
	sbc $5A5FF4.l,X		; FF F4 5F 5A
	and $05853F.l,X		; 3F 3F 85 05
	pei ($0B.b)		; D4 0B
	cli		; 58
	nop		; EA
	and $FF57F2.l,X		; 3F F2 57 FF
	ora $FFA5FF.l		; 0F FF A5 FF
	cpy #$FF.b		; C0 FF
	lda #$FF.b		; A9 FF
	ora $FC.b,S		; 03 FC
	cpx $F213.w		; EC 13 F2
	ora $00FF.w		; 0D FF 00
	sbc $A0FF00.l,X		; FF 00 FF A0
	sbc $A8FFC0.l,X		; FF C0 FF A8
	cmp ($FF.b,S),Y		; D3 FF
	ora ($FF.b),Y		; 11 FF
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	cpx #$9F.b		; E0 9F
	bvs -17.b		; 70 EF
	sbc $FB5FF0.l,X		; FF F0 5F FB
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $C03F80.l,X		; 7F 80 3F C0
	sta $10EF60.l,X		; 9F 60 EF 10
	sbc [$08.b],Y		; F7 08
	xce		; FB
	ora [$FF.b]		; 07 FF
	sbc $0DFF57.l,X		; FF 57 FF 0D
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $FFC0FF.l,X		; 3F FF C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FD.b		; C0 FD
	sbc $FFFF.w,X		; FD FF FF
	eor [$FF.b],Y		; 57 FF
	phd		; 0B
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF02FD.l,X		; FF FD 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $A8.b		; 00 A8
	tay		; A8
	sbc $FEED.w		; ED ED FE
	inc $FFBF.w,X		; FE BF FF
	eor $1AFF.w		; 4D FF 1A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $ED57A8.l,X		; FF A8 57 ED
	ora ($FE.b)		; 12 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	rti		; 40

	bcc -112.b		; 90 90
	beq -16.b		; F0 F0
	sbc $BFFD.w,X		; FD FD BF
	sbc $2AFF5F.l,X		; FF 5F FF 2A
	sbc $57C23D.l,X		; FF 3D C2 57
	tay		; A8
	sta $6A.b,X		; 95 6A
	sbc ($0E.b),Y		; F1 0E
	sbc $FF02.w,X		; FD 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $23.b		; 00 23
	stz $1807.w		; 9C 07 18
	and $08.b,S		; 23 08
	ora [$18.b]		; 07 18
	ora [$18.b]		; 07 18
	lda [$B8.b]		; A7 B8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	eor $BC.b,S		; 43 BC
	sbc $1C.b,S		; E3 1C
	cmp ($2C.b,S),Y		; D3 2C
	sbc [$18.b]		; E7 18
	eor [$B8.b]		; 47 B8
	lda [$58.b]		; A7 58
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	inc $F801.w,X		; FE 01 F8
	ora [$E0.b]		; 07 E0
	ora $C31FE0.l,X		; 1F E0 1F C3
	bit $38C6.w,X		; 3C C6 38
	cpy $FF30.w		; CC 30 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	ora [$F0.b]		; 07 F0
	ora $0300FF.l		; 0F FF 00 03
	jsr ($C33C.w,X)		; FC 3C C3
	cpx #$18.b		; E0 18
	cpx #$18.b		; E0 18
	dey		; 88
	ora ($10.b),Y		; 11 10
	adc $00.b,S		; 63 00
	sbc [$80.b],Y		; F7 80
	adc ($FC.b),Y		; 71 FC
	ora $C0.b,S		; 03 C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $43FE01.l,X		; FF 01 FE 43
	ldy $18E7.w,X		; BC E7 18
	sbc ($0E.b),Y		; F1 0E
	cpx $0010.w		; EC 10 00
	ora $00.b,S		; 03 00
	bvs   0.b		; 70 00
	bvs   5.b		; 70 05
.INDEX 16
	rep #$18		; C2 18
	stx $18.b		; 86 18
	adc [$A7.b]		; 67 A7
	cli		; 58
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	bvs -113.b		; 70 8F
	bvs -113.b		; 70 8F
	cpy #$823F.w		; C0 3F 82
	adc $F807.w,X		; 7D 07 F8
	clc		; 18
	sbc [$1C.b]		; E7 1C
	ora $01.b,S		; 03 01
	inc $7C03.w,X		; FE 03 7C
	ora [$78.b]		; 07 78
	tsb $0C83.w		; 0C 83 0C
	adc ($0E.b,S),Y		; 73 0E
	sbc ($F4.b),Y		; F1 F4
	phd		; 0B
	ora $FC.b,S		; 03 FC
	sbc $807F00.l,X		; FF 00 7F 80
	adc $F00F80.l,X		; 7F 80 0F F0
	tda		; 7B
	sty $FD.b		; 84 FD
	cop $0F.b		; 02 0F
	beq  -1.b		; F0 FF
	brk $8F.b		; 00 8F
	bvs  67.b		; 70 43
	ldy $BC43.w,X		; BC 43 BC
	adc ($1E.b,X)		; 61 1E
	and $0202.w,X		; 3D 02 02
	cmp $07.b		; C5 07
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	lda $F00F40.l,X		; BF 40 0F F0
	ora $FC.b,S		; 03 FC
	cmp ($3E.b,X)		; C1 3E
	beq  15.b		; F0 0F
	sbc $1F.b,S		; E3 1F
	sbc ($0F.b,S),Y		; F3 0F
	sbc $0F.b,S		; E3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	beq  12.b		; F0 0C
	adc ($8F.b,S),Y		; 73 8F
	sbc $1F.b,S		; E3 1F
	sbc $1F.b,S		; E3 1F
	sbc $1F.b,S		; E3 1F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	beq  15.b		; F0 0F
	sbc ($0C.b,S),Y		; F3 0C
	plx		; FA
	plx		; FA
	sbc $FEFD.w,X		; FD FD FE
	inc $FDFD.w,X		; FE FD FD
	inc $FDFE.w,X		; FE FE FD
	sbc $0003.w,X		; FD 03 00
	jsr ($FAFC.w,X)		; FC FC FA
	sbc $FEFD.w,X		; FD FD FE
	inc $FDFD.w,X		; FE FD FD
	inc $FDFE.w,X		; FE FE FD
	sbc $00FE.w,X		; FD FE 00
	sbc $AA03FC.l,X		; FF FC 03 AA
	tax		; AA
	mvn $AA,$54		; 54 54 AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	sbc $000100.l,X		; FF 00 01 00
	tax		; AA
	eor $54.b,X		; 55 54
	plb		; AB
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	ora $9F7FE3.l,X		; 1F E3 7F 9F
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF03.l,X		; FF 03 FF 1F
	sbc $FFFF7F.l,X		; FF 7F FF FF
	inc $01FF.w,X		; FE FF 01
	inc $C13F.w,X		; FE 3F C1
	sbc $FFFF3F.l,X		; FF 3F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $FFFF3F.l,X		; FF 3F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	rol $FFC1.w,X		; 3E C1 FF
	ora [$FF.b]		; 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $FF07FF.l,X		; 3F FF 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $FFFFF4.l,X		; FF F4 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FBFF.w,X)		; FC FF FB
	jsr ($F8F7.w,X)		; FC F7 F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C6FFF8.l,X		; FF F8 FF C6
	sbc $9BFF21.l,X		; FF 21 FF 9B
	inc $FD77.w,X		; FE 77 FD
	sbc $FFFFFF.l		; EF FF FF FF
	sbc $C4FFF8.l,X		; FF F8 FF C4
	sbc $C23D.w,Y		; F9 3D C2
	xce		; FB
	trb $78F7.w		; 1C F7 78
	sbc $DFFEF0.l		; EF F0 FE DF
	sbc $BF.b,X		; F5 BF
	jsr ($D47F.w,X)		; FC 7F D4
	sbc $52FFA1.l,X		; FF A1 FF 52
	sbc $4BFF87.l,X		; FF 87 FF 4B
	sbc $BFE0DF.l,X		; FF DF E0 BF
	cpy #$807F.w		; C0 7F 80
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $07FF02.l,X		; FF 02 FF 07
	sbc $FF070B.l,X		; FF 0B 07 FF
	and $FF5FFF.l		; 2F FF 5F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	inc $FDFF.w,X		; FE FF FD
	sbc $FFFDF3.l,X		; FF F3 FD FF
	ora [$FF.b]		; 07 FF
	and $F55EFE.l		; 2F FE 5E F5
	and $D0.b,X		; 35 D0
	bpl -15.b		; 10 F1
	beq -29.b		; F0 E3
	sbc ($4D.b,X)		; E1 4D
	eor $FC.b,S		; 43 FC
	sbc $E7FFFB.l,X		; FF FB FF E7
	sbc $3FFFDF.l,X		; FF DF FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C3FFFF.l,X		; FF FF FF C3
	cpy #$8387.w		; C0 87 83
	ora $1F3F07.l,X		; 1F 07 3F 1F
	sbc $FFFF3F.l,X		; FF 3F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FDFF.w,X		; FE FF FD
	sbc $F7FFFB.l,X		; FF FB FF F7
	sbc $FFFBEB.l,X		; FF EB FB FF
	cmp $E9DFFF.l,X		; DF FF DF E9
	lda #$FE.b		; A9 FE
	sbc $FBFEFD.l,X		; FF FD FE FB
	sbc $FBF7.w,X		; FD F7 FB
	sbc $EFDFF3.l		; EF F3 DF EF
	cmp $C9BFFF.l,X		; DF FF BF C9
	adc $FFFFFF.l,X		; 7F FF FF FF
	adc $EBFF6F.l,X		; 7F 6F FF EB
	sbc ($E1.b,X)		; E1 E1
	xce		; FB
	xce		; FB
	xce		; FB
	xce		; FB
	sbc $AF7FFF.l,X		; FF FF 7F AF
	sbc $7FEFFF.l,X		; FF FF EF 7F
	xba		; EB
	sbc $FFE1FF.l,X		; FF FF E1 FF
	xce		; FB
	sbc $FFFFFB.l,X		; FF FB FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F7FFF0.l,X		; FF F0 FF F7
	sed		; F8
	sbc $FEFE.w,Y		; F9 FE FE
	beq -15.b		; F0 F1
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $FFF0FF.l,X		; FF FF F0 FF
	sbc [$FF.b],Y		; F7 FF
	sbc $FEFFF8.l,X		; FF F8 FF FE
	sbc $FFFFF0.l,X		; FF F0 FF FF
	cmp $FFF7EF.l		; CF EF F7 FF
	stp		; DB
	stp		; DB
	sbc $F6FF.w,X		; FD FF F6
	inc $FF.b,X		; F6 FF
	sbc $E2FFFF.l,X		; FF FF FF E2
	sbc ($DF.b)		; F2 DF
	lda $FFEFF7.l		; AF F7 EF FF
	cmp ($FD.b,S),Y		; D3 FD
	xce		; FB
	sbc $FEFFF4.l,X		; FF F4 FF FE
	sbc $E2FFFF.l,X		; FF FF FF E2
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $BFBF7F.l,X		; FF 7F BF BF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	adc $3FFFFF.l,X		; 7F FF FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFDFF.l,X		; FF FF FD FC
	xce		; FB
	xce		; FB
	sbc [$FF.b],Y		; F7 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FDFEFF.l,X		; FF FF FE FD
	sbc $FBF7F8.l,X		; FF F8 F7 FB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc ($F2.b),Y		; F1 F2
	cmp $3F7FD3.l		; CF D3 7F 3F
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($E3F3.w,X)		; FC F3 E3
	jmp.w [$47BF]		; DC BF 47
	plx		; FA
	and $FFFFFA.l,X		; 3F FA FF FF
	plx		; FA
	sta $FFEFFF.l,X		; 9F FF EF FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $BEFF.w,X		; FD FF BE
	sbc $AB2723.l,X		; FF 23 27 AB
	plb		; AB
	pld		; 2B
	pld		; 2B
	sbc $EFFF9F.l,X		; FF 9F FF EF
	sbc $01FF03.l,X		; FF 03 FF 01
	sbc $FB27BE.l,X		; FF BE 27 FB
	tyx		; BB
	sbc $F02BFF.l		; EF FF 2B F0
	sbc $FDFFFA.l,X		; FF FA FF FD
	sbc $7EFFFE.l,X		; FF FE FF 7E
	sbc $DFFFBF.l,X		; FF BF FF DF
	sbc $FFFFE7.l,X		; FF E7 FF FF
	beq  -1.b		; F0 FF
	plx		; FA
	sbc $FEFFFD.l,X		; FF FD FF FE
	sbc $BFFF7E.l,X		; FF 7E FF BF
	sbc $E7FFDF.l,X		; FF DF FF E7
	and $FE57FD.l,X		; 3F FD 57 FE
	ora $FF15FF.l,X		; 1F FF 15 FF
	.db $42, $FF		; 42 FF
	lda $FF.b		; A5 FF
	beq  -1.b		; F0 FF
	sbc #$FF.b		; E9 FF
	sbc $FE03.w,X		; FD 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	sbc $F0FFA0.l,X		; FF A0 FF F0
	sbc $FFFFE8.l,X		; FF E8 FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $DFFFBF.l,X		; FF BF FF DF
	adc $F7BFEF.l,X		; 7F EF BF F7
	eor $FFFFFB.l,X		; 5F FB FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	lda $3FDF7F.l,X		; BF 7F DF 3F
	sbc $0FF71F.l		; EF 1F F7 0F
	xce		; FB
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FFE0.l,X		; FF E0 FF 80
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$8FFF.w		; E0 FF 8F
	beq   0.b		; F0 00
	sbc $F83FC0.l,X		; FF C0 3F F8
	cmp [$FF.b]		; C7 FF
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FCF3F.l,X		; FF 3F CF 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8FFC0.l,X		; FF C0 FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $7F8FFF.l,X		; 3F FF 8F 7F
	ora $FF02FF.l		; 0F FF 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F03F.w		; C0 3F F0
	cmp $FEF3FC.l		; CF FC F3 FE
	sbc $00FF.w,X		; FD FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $F867FC.l,X		; FF FC 67 F8
	sta [$F8.b]		; 87 F8
	sbc [$F8.b]		; E7 F8
	eor [$F8.b]		; 47 F8
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	ldx $9E41.w,Y		; BE 41 9E
	adc ($21.b,X)		; 61 21
	dex		; CA
	jsr $00CC.w		; 20 CC 00
	sbc $0E8C63.l,X		; FF 63 8C 0E
	sta ($0E.b),Y		; 91 0E
	sta ($E1.b),Y		; 91 E1
	asl $1EE1.w,X		; 1E E1 1E
	cpy #$CC3F.w		; C0 3F CC
	and ($FF.b,S),Y		; 33 FF
	brk $8C.b		; 00 8C
	adc ($90.b,S),Y		; 73 90
	adc $E06F90.l		; 6F 90 6F E0
	ora $C930.w,Y		; 19 30 C9
	sed		; F8
	tsb $38.b		; 04 38
	eor [$0D.b]		; 47 0D
	jsl $076087.l		; 22 87 60 07
	jsr $2007.w		; 20 07 20
	sbc $F906.w,Y		; F9 06 F9
	asl $1C.b		; 06 1C
	sbc $0F.b,S		; E3 0F
	beq  14.b		; F0 0E
	sbc ($03.b),Y		; F1 03
	jsr ($DE21.w,X)		; FC 21 DE
	and ($DE.b,X)		; 21 DE
	eor ($BE.b,X)		; 41 BE
	eor ($BE.b,X)		; 41 BE
	plp		; 28
	eor [$14.b],Y		; 57 14
	adc $BB.b,S		; 63 BB
	mvp $CC,$33		; 44 33 CC
	clc		; 18
	sbc [$18.b]		; E7 18
	sbc [$9E.b]		; E7 9E
	adc ($9E.b,X)		; 61 9E
	adc ($47.b,X)		; 61 47
	clv		; B8
	rtl		; 6B

	sty $40.b,X		; 94 40
	lda $E13FC0.l,X		; BF C0 3F E1
	asl $1EE1.w,X		; 1E E1 1E
	jsr ($F803.w,X)		; FC 03 F8
	ora [$38.b]		; 07 38
	cpy $40.b		; C4 40
	lda $32C5.w,Y		; B9 C5 32
	cpx $E903.w		; EC 03 E9
	asl $C9.b		; 06 C9
	rol $0F.b		; 26 0F
	beq  15.b		; F0 0F
	beq  -4.b		; F0 FC
	ora $F8.b,S		; 03 F8
	ora [$70.b]		; 07 70
	sta $609F60.l		; 8F 60 9F 60
	sta $019F60.l,X		; 9F 60 9F 01
	sbc ($01.b)		; F2 01
	sbc ($03.b)		; F2 03
	sec		; 38
	ora ($C8.b,X)		; 01 C8
	eor ($A4.b),Y		; 51 A4
	eor $8780.w		; 4D 80 87
	sec		; 38
	sta [$38.b]		; 87 38
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sec		; 38
	cmp [$08.b]		; C7 08
	sbc [$04.b],Y		; F7 04
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc ($8F.b,S),Y		; 73 8F
	adc ($8F.b,S),Y		; 73 8F
	adc ($8F.b,S),Y		; 73 8F
	and ($CF.b,S),Y		; 33 CF
	and ($CF.b,S),Y		; 33 CF
	and ($CF.b,S),Y		; 33 CF
	adc ($8F.b,S),Y		; 73 8F
	adc ($8F.b,S),Y		; 73 8F
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	adc ($8F.b,S),Y		; 73 8F
	and ($CF.b,S),Y		; 33 CF
	and ($CF.b,S),Y		; 33 CF
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FCFF.l,X		; FF FF FC 03
	jsr ($FF03.w,X)		; FC 03 FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E1FFF8.l,X		; FF F8 FF E1
	sbc $8FFFC7.l,X		; FF C7 FF 8F
	sbc $33FF1F.l,X		; FF 1F FF 33
	sbc $5DFF25.l,X		; FF 25 FF 5D
	sbc $E7FE.w,Y		; F9 FE E7
	sbc $E7DF.w,Y		; F9 DF E7
	lda $9F7FCF.l,X		; BF CF 7F 9F
	sbc ($3F.b,S),Y		; F3 3F
	sbc ($3B.b,X)		; E1 3B
	cmp ($63.b,X)		; C1 63
	sbc $FFFF3E.l,X		; FF 3E FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF3E.l,X		; FF 3E FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C3FF0F.l,X		; FF 0F FF C3
	sbc $FCFFF1.l,X		; FF F1 FF FC
	sbc $E7E7FE.l,X		; FF FE E7 E7
	cmp ($D3.b,S),Y		; D3 D3
	cmp $CFDD.w,X		; DD DD CF
	and $FDCFF3.l,X		; 3F F3 CF FD
	sbc ($FE.b,S),Y		; F3 FE
	sbc $FEFF.w,X		; FD FF FE
	sbc [$FF.b]		; E7 FF
	cmp $EF.b,S		; C3 EF
	cmp ($E3.b,X)		; C1 E3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFF7F.l,X		; FF 7F FF 3F
	sbc $9EFFBF.l,X		; FF BF FF 9E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $7FBFFF.l,X		; 7F FF BF 7F
	lda $BFDEFF.l,X		; BF FF DE BF
	sbc $D3FFE9.l,X		; FF E9 FF D3
	sbc $AFFFC7.l,X		; FF C7 FF AF
	sbc $5DFF8E.l,X		; FF 8E FF 5D
	sbc $9BFF1D.l,X		; FF 1D FF 9B
	sbc $E3DFF1.l		; EF F1 DF E3
	cmp $CFBFE7.l,X		; DF E7 BF CF
	ldx $7DCF.w,Y		; BE CF 7D
	stz $9E7D.w,X		; 9E 7D 9E
	xce		; FB
	trb $DFF8.w		; 1C F8 DF
	sbc $BF.b,X		; F5 BF
	sed		; F8
	lda $F17FF4.l,X		; BF F4 7F F1
	sbc $E1FFDA.l,X		; FF DA FF E1
	sbc $DFFF43.l,X		; FF 43 FF DF
	cpx #$C0BF.w		; E0 BF C0
	lda $807FC0.l,X		; BF C0 7F 80
	sbc $02FF01.l,X		; FF 01 FF 02
	sbc $03FF01.l,X		; FF 01 FF 03
	ora $FF2FFF.l,X		; 1F FF 2F FF
	adc $FFBFFF.l,X		; 7F FF BF FF
	ror $FEFF.w,X		; 7E FF FE
	sbc $FBFFFD.l,X		; FF FD FF FB
	sbc $1FFF.w,X		; FD FF 1F
	sbc $FE2D.w,X		; FD 2D FE
	ror $B4F4.w,X		; 7E F4 B4
	sbc $D178.w,Y		; F9 78 D1
	bne -30.b		; D0 E2
	cpx #$4244.w		; E0 44 42
	sbc [$FA.b]		; E7 FA
	cmp $DCBFF9.l,X		; DF F9 BF DC
	adc $F6FFEE.l,X		; 7F EE FF F6
	cmp $DBFFD7.l,X		; DF D7 FF DB
	cmp $819E9B.l,X		; DF 9B 9E 81
	and $3C5F18.l,X		; 3F 18 5F 3C
	sta $0E071E.l		; 8F 1E 07 0E
	and [$0F.b]		; 27 0F
	and $27.b,S		; 23 27
	adc $67.b,S		; 63 67
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	sbc $FEBF7F.l,X		; FF 7F BF FE
	sbc $5EDF3E.l,X		; FF 3E DF 5E
	sbc $BCEF1D.l,X		; FF 1D EF BC
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $7FBEFF.l,X		; 7F FF BE 7F
	ldx $FE7F.w,Y		; BE 7F FE
	ora $ED3EDD.l,X		; 1F DD 3E ED
	stz $B6F6.w,X		; 9E F6 B6
	sbc $B67D.w,X		; FD 7D B6
	rol $F9.b,X		; 36 F9
	sbc $FFFF.w,Y		; F9 FF FF
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $D6BFFF.l,X		; FF FF BF D6
	adc $B67FBD.l,X		; 7F BD 7F B6
	sbc $FFFF79.l,X		; FF 79 FF FF
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $FF.b,X		; 95 FF
	ora $0F0A9F.l		; 0F 9F 0A 0F
	sta $90.b,X		; 95 90
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFF0.l,X		; FF F0 FF FF
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $FFFFFF.l,X		; BF FF FF FF
	lda $FF.b		; A5 FF
	inc $92FF.w,X		; FE FF 92
	inc $016D.w,X		; FE 6D 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFBF.l,X		; FF BF FF FF
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $FF0101.l,X		; FF 01 01 FF
	sbc $EFEFFF.l,X		; FF FF EF EF
	sbc ($E3.b,X)		; E1 E3
	sbc $21ED.w		; ED ED 21
	sbc ($1F.b,S),Y		; F3 1F
	and $3F1F1F.l,X		; 3F 1F 1F 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FFE1FF.l		; EF FF E1 FF
	sbc $E1FF.w		; ED FF E1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFDFBF.l,X		; FF BF DF DF
	lda $EFEF9F.l,X		; BF 9F EF EF
	sbc $CFDFEF.l,X		; FF EF DF CF
	sbc [$F7.b],Y		; F7 F7
	sbc $FFBFF7.l,X		; FF F7 BF FF
	sbc $BFDF9F.l,X		; FF 9F DF BF
	sbc $FFEFCF.l,X		; FF CF EF FF
	sbc $E7FFDF.l		; EF DF FF E7
	sbc [$FF.b],Y		; F7 FF
	xba		; EB
	xba		; EB
	cmp $DFFFDF.l,X		; DF DF FF DF
	tsx		; BA
	tsx		; BA
	xce		; FB
	tyx		; BB
	xce		; FB
	tda		; 7B
	ply		; 7A
	ply		; 7A
	plx		; FA
	ply		; 7A
	sbc $CFFFE3.l,X		; FF E3 FF CF
	cmp $9AFFFF.l,X		; DF FF FF 9A
	lda $BB7FFB.l,X		; BF FB 7F BB
	sbc $FA7F7A.l,X		; FF 7A 7F FA
	plx		; FA
	plx		; FA
	plx		; FA
	plx		; FA
	sbc $2337FF.l,X		; FF FF 37 23
	plb		; AB
	plb		; AB
	rtl		; 6B

	rtl		; 6B

	xba		; EB
	xba		; EB
	and [$23.b],Y		; 37 23
	sbc $FAFFFA.l,X		; FF FA FF FA
	sbc $77ABFF.l,X		; FF FF AB 77
	sbc $6BFFAB.l,X		; FF AB FF 6B
	sbc $37EBEB.l,X		; FF EB EB 37
	plb		; AB
	plb		; AB
	and [$23.b],Y		; 37 23
	sbc $F1F3FF.l,X		; FF FF F3 F1
	sbc $FBFD.w,X		; FD FD FB
	xce		; FB
	sbc [$F7.b],Y		; F7 F7
	sbc ($F1.b),Y		; F1 F1
	sbc $37EBAB.l,X		; FF AB EB 37
	sbc $F3FDFF.l,X		; FF FF FD F3
	sbc $FBFFFD.l,X		; FF FD FF FB
	sbc $F1FFF7.l,X		; FF F7 FF F1
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FEFF.w,X		; FD FF FE
	sbc $54717B.l,X		; FF 7B 71 54
	eor $55.b,X		; 55 55
	eor $15.b,X		; 55 15
	ora $DB.b,X		; 15 DB
	cmp ($FF.b),Y		; D1 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FEFF.w,X		; FD FF FE
	sbc $7B.b,X		; F5 7B
	sbc $55FF54.l,X		; FF 54 FF 55
	sbc $DBF515.l,X		; FF 15 F5 DB
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $7EFFFF.l,X		; FF FF FF 7E
	sbc $BFFFBF.l,X		; FF BF FF BF
	sbc $EFFFDF.l,X		; FF DF FF EF
	sbc $FFFCFF.l,X		; FF FF FC FF
	plx		; FA
	sbc $7EFFFF.l,X		; FF FF FF 7E
	sbc $BFFFBF.l,X		; FF BF FF BF
	sbc $CFFFDF.l,X		; FF DF FF CF
	ora $FE57FC.l		; 0F FC 57 FE
	ora $FF97FE.l		; 0F FE 97 FF
	eor [$FF.b]		; 47 FF
	lda $C3FF.w		; AD FF C3
	sbc $FCFFE1.l,X		; FF E1 FF FC
	ora $FE.b,S		; 03 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	bra  -1.b		; 80 FF
	rti		; 40

	sbc $C0FFA0.l,X		; FF A0 FF C0
	adc $00FF60.l,X		; 7F 60 FF 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	sei		; 78
	sbc $DFFFB8.l,X		; FF B8 FF DF
	sbc $EF7FDF.l,X		; FF DF 7F EF
	adc $07FF80.l,X		; 7F 80 FF 07
	sbc $FF7F07.l,X		; FF 07 7F FF
	sta $3FDF5F.l,X		; 9F 5F DF 3F
	cmp $1FE82F.l		; CF 2F E8 1F
	xce		; FB
	ora [$FC.b]		; 07 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sbc $FFF9FF.l,X		; FF FF F9 FF
	pea $F7FF.w		; F4 FF F7
	sbc ($0F.b,S),Y		; F3 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sbc $F0FFF9.l,X		; FF F9 FF F0
	xce		; FB
	beq  -8.b		; F0 F8
	sbc $FFFFFE.l,X		; FF FE FF FF
	adc $7FBFFF.l,X		; 7F FF BF 7F
	cmp $BFEF3F.l,X		; DF 3F EF BF
	sbc $57F7DF.l		; EF DF F7 57
	sbc $FFFFFE.l,X		; FF FE FF FF
	adc $7FBFFF.l,X		; 7F FF BF 7F
	cmp $9FCF3F.l,X		; DF 3F CF 9F
	sbc $C76FDF.l		; EF DF 6F C7
	asl $F9.b		; 06 F9
	sty $7B.b		; 84 7B
	cpy $BB.b		; C4 BB
	cpy $BB.b		; C4 BB
	cpx $DB.b		; E4 DB
	cpx $DB.b		; E4 DB
	cpx $FB.b		; E4 FB
	cpx $FB.b		; E4 FB
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc [$98.b]		; E7 98
	sbc [$98.b]		; E7 98
	sbc [$D8.b]		; E7 D8
	sbc [$D8.b]		; E7 D8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	asl $04B0.w		; 0E B0 04
	plx		; FA
	mvp $C0,$B8		; 44 B8 C0
	bit $1FA0.w,X		; 3C A0 1F
	ldy #$801F.w		; A0 1F 80
	and $B09E40.l,X		; 3F 40 9E B0
	eor $B807F8.l		; 4F F8 07 B8
	eor [$3C.b]		; 47 3C
	cmp $1F.b,S		; C3 1F
	cpx #$E01F.w		; E0 1F E0
	and $E11EC0.l,X		; 3F C0 1E E1
	ora [$78.b]		; 07 78
	ora $EA.b,X		; 15 EA
	and ($DE.b,X)		; 21 DE
	sec		; 38
	cmp [$0E.b]		; C7 0E
	beq  14.b		; F0 0E
	beq   8.b		; F0 08
	sbc [$25.b],Y		; F7 25
	phy		; 5A
	adc $C386.w,Y		; 79 86 C3
	bit $7C83.w,X		; 3C 83 7C
	sta ($7E.b,X)		; 81 7E
	cmp ($2E.b),Y		; D1 2E
	cmp ($2E.b),Y		; D1 2E
	bne  47.b		; D0 2F
	pha		; 48
	lda [$35.b],Y		; B7 35
	iny		; C8
	and $D4.b,S		; 23 D4
	sbc ($16.b,X)		; E1 16
	sbc $9006.w,Y		; F9 06 90
	adc $3D6F90.l		; 6F 90 6F 3D
	.db $82, $1A, $A5		; 82 1A A5
	cmp $3C.b,S		; C3 3C
	cmp #$36.b		; C9 36
	txy		; 9B
	stz $FF.b		; 64 FF
	brk $6F.b		; 00 6F
	bcc 111.b		; 90 6F
	bcc -49.b		; 90 CF
	bmi  93.b		; 30 5D
	ldx #$0CC3.w		; A2 C3 0C
	asl $D0.b		; 06 D0
	jmp $4893.w		; 4C 93 48
	lda [$00.b],Y		; B7 00
	sbc $81FF00.l,X		; FF 00 FF 81
	ror $00FF.w,X		; 7E FF 00
	cpy #$C83F.w		; C0 3F C8
	and [$A3.b],Y		; 37 A3
	jmp $FC7986.l		; 5C 86 79 FC
	ora $FC.b,S		; 03 FC
	ora $F0.b,S		; 03 F0
	ora $9B03FC.l		; 0F FC 03 9B
	rts		; 60

	ora $2862.w,Y		; 19 62 28
	cmp $20.b,X		; D5 20
	jmp.w [$5EA0]		; DC A0 5E
	ldy #$905E.w		; A0 5E 90
	ror $6E90.w		; 6E 90 6E
	rti		; 40

	lda $44BF40.l,X		; BF 40 BF 44
	tyx		; BB
	jmp $4EB3.w		; 4C B3 4E
	lda ($4E.b),Y		; B1 4E
	lda ($4E.b),Y		; B1 4E
	lda ($4E.b),Y		; B1 4E
	lda ($F3.b),Y		; B1 F3
	ora $F38F73.l		; 0F 73 8F F3
	ora $F30FF3.l		; 0F F3 0F F3
	ora $B30FF3.l		; 0F F3 0F B3
	eor $330FF3.l		; 4F F3 0F 33
	cmp $33CF33.l		; CF 33 CF 33
	cmp $33CF33.l		; CF 33 CF 33
	cmp $33CF33.l		; CF 33 CF 33
	cmp $FFCF33.l		; CF 33 CF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $F3FFF3.l,X		; FF F3 FF F3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	xce		; FB
	phy		; 5A
	sbc $BFFFBA.l,X		; FF BA FF BF
	sbc $6EFF6F.l,X		; FF 6F FF 6E
	sbc $7DFF7E.l,X		; FF 7E FF 7D
	cmp $65C05D.l,X		; DF 5D C0 65
	bra -59.b		; 80 C5
	bra -64.b		; 80 C0
	brk $90.b		; 00 90
	brk $91.b		; 00 91
	brk $81.b		; 00 81
	ora ($83.b,X)		; 01 83
	ora ($A3.b,X)		; 01 A3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $5DFFFF.l,X		; FF FF FF 5D
	sbc $1E5FBE.l,X		; FF BE 5F 1E
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $BF5DFF.l,X		; FF FF 5D BF
	ldx $1E5F.w,Y		; BE 5F 1E
	sbc $BEB5B5.l,X		; FF B5 B5 BE
	ldx $7E.b,Y		; B6 7E
	ror $7B7B.w,X		; 7E 7B 7B
	lda $3FBFBB.l,X		; BF BB BF 3F
	cmp $C1DFDF.l,X		; DF DF DF C1
	sta ($CB.b,X)		; 81 CB
	bra -55.b		; 80 C9
	brk $81.b		; 00 81
	brk $84.b		; 00 84
	bra -60.b		; 80 C4
	brk $C0.b		; 00 C0
	cpy #$DEE0.w		; C0 E0 DE
	inc $DEFF.w,X		; FE FF DE
	sbc $EEFFCE.l,X		; FF CE FF EE
	adc $647F65.l,X		; 7F 65 7F 64
	adc $747F64.l,X		; 7F 64 7F 74
	adc $FFDE74.l,X		; 7F 74 DE FF
	inc $EEDF.w		; EE DF EE
	sbc $75EE75.l,X		; FF 75 EE 75
	inc $EE75.w		; EE 75 EE
	adc $FE.b,X		; 75 FE
	adc $FE.b,X		; 75 FE
	sbc $37FD33.l,X		; FF 33 FD 37
	inc $F56F.w,X		; FE 6F F5
	eor $F45FF8.l,X		; 5F F8 5F F4
	and $543FF8.l,X		; 3F F8 3F 54
	adc $F73CF3.l,X		; 7F F3 3C F7
	sec		; 38
	sbc $60DF70.l		; EF 70 DF 60
	cmp $40BF60.l,X		; DF 60 BF 40
	lda $807F40.l,X		; BF 40 7F 80
	sta [$FF.b]		; 87 FF
	and $FF1FFF.l		; 2F FF 1F FF
	and $FF7FFF.l		; 2F FF 7F FF
	lda $FF7EFF.l,X		; BF FF 7E FF
	ldx $FFFF.w,Y		; BE FF FF
	ora [$FD.b]		; 07 FD
	and $1FFF.w		; 2D FF 1F
	sbc [$27.b],Y		; F7 27
	inc $FC6E.w		; EE 6E FC
	ldy $74F5.w,X		; BC F5 74
	sbc $F7B8.w,Y		; F9 B8 F7
	xce		; FB
	sbc $FCDEFA.l		; EF FA DE FC
	cmp $FEBFFD.l,X		; DF FD BF FE
	adc $FEFFFE.l,X		; 7F FE FF FE
	sbc $C4C8FE.l,X		; FF FE C8 C4
	sta $BD8D.w,Y		; 99 8D BD
	sta $7E1E3C.l,X		; 9F 3C 1E 7E
	and $FE7FFE.l,X		; 3F FE 7F FE
	sbc $BFFFFE.l,X		; FF FE FF BF
	and $7577.w,X		; 3D 77 75
	sbc [$F5.b],Y		; F7 F5
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FAFBFE.l,X		; FF FE FB FA
	xce		; FB
	plx		; FA
	cmp ($C3.b,X)		; C1 C3
	bit #$83.b		; 89 83
	ora ($0B.b,X)		; 01 0B
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	tsb $01.b		; 04 01
	brk $05.b		; 00 05
	sbc $CCFE8C.l		; EF 8C FE CC
	inc $F7CC.w,X		; FE CC F7
	cpy $E4F7.w		; CC F7 E4
	inc $EC.b,X		; F6 EC
	sbc $E4FFE4.l,X		; FF E4 FF E4
	sbc $ED8E.w,X		; FD 8E ED
	dec $DFEC.w,X		; DE EC DF
	sbc $CE.b,X		; F5 CE
	sbc $F5E6.w,X		; FD E6 F5
	inc $EEF5.w		; EE F5 EE
	sbc $EE.b,X		; F5 EE
	sbc [$E7.b]		; E7 E7
	stp		; DB
	stp		; DB
	sbc [$F7.b],Y		; F7 F7
	sbc $C3C3EF.l		; EF EF C3 C3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E7FFFF.l,X		; FF FF FF E7
	sbc $F7FFDB.l,X		; FF DB FF F7
	sbc $C3FFEF.l,X		; FF EF FF C3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8F8FF.l,X		; FF FF F8 F8
	sbc $FEFEFF.l,X		; FF FF FE FE
	jsr ($FDFD.w,X)		; FC FD FD
	sbc $FFFF.w,X		; FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $FFFFFD.l,X		; FF FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc [$76.b],Y		; 77 76
	ror $6F66.w		; 6E 66 6F
	inc $FF.b		; E6 FF
	sbc $FF.b,X		; F5 FF
	sbc $EF.b,X		; F5 EF
	sbc $FF.b		; E5 FF
	sbc $FF.b,X		; F5 FF
	sbc $FE.b,X		; F5 FE
	adc [$F7.b],Y		; 77 F7
	ror $7FE6.w		; 6E E6 7F
	sbc $FF.b,X		; F5 FF
	sbc $FF.b,X		; F5 FF
	sbc $EF.b,X		; F5 EF
	sbc $FF.b,X		; F5 FF
	sbc $FF.b,X		; F5 FF
	sbc $BFBFFF.l,X		; FF FF BF BF
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	sbc ($F1.b,S),Y		; F3 F1
	sbc $F5.b,X		; F5 F5
	xce		; FB
	sbc ($FF.b),Y		; F1 FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	lda $FFF7FF.l,X		; BF FF F7 FF
	sbc [$FD.b],Y		; F7 FD
	sbc ($FF.b,S),Y		; F3 FF
	sbc $F5.b,X		; F5 F5
	xce		; FB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FBFFF.l,X		; FF FF BF 1F
	eor $5F5F5F.l,X		; 5F 5F 5F 5F
	eor $1FBF5F.l,X		; 5F 5F BF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BF5FFF.l,X		; FF FF 5F BF
	sbc $5FFF5F.l,X		; FF 5F FF 5F
	sbc $BF5F5F.l,X		; FF 5F 5F BF
	sbc $FF9FFF.l,X		; FF FF 9F FF
	sta $F8F99F.l,X		; 9F 9F F9 F8
	inc $FCFE.w,X		; FE FE FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $FFF8.w,Y		; F9 F8 FF
	sbc $FF9FFF.l,X		; FF FF 9F FF
	sta $FFF9FE.l,X		; 9F FE F9 FF
	inc $FCFF.w,X		; FE FF FC
	sbc $F9FEFE.l,X		; FF FE FE F9
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $88D9FF.l,X		; FF FF D9 88
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	cmp $FF88.w,X		; DD 88 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFDDAA.l,X		; FF AA DD FF
	tax		; AA
	sbc $AAFFAA.l,X		; FF AA FF AA
	tax		; AA
	cmp $FFFF.w,X		; DD FF FF
	sbc [$FF.b],Y		; F7 FF
	tyx		; BB
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FFFDFE.l,X		; FF FE FD FF
	sbc $FDFF.w,X		; FD FF FD
	sbc $E7FFFD.l,X		; FF FD FF E7
	sbc $EDFFAB.l,X		; FF AB FF ED
	sbc $F6FDF5.l,X		; FF F5 FD F6
	sbc $FDF7.w,X		; FD F7 FD
	sbc [$FD.b],Y		; F7 FD
	sbc [$F0.b],Y		; F7 F0
	sbc $FCFFFA.l,X		; FF FA FF FC
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $BFFF7E.l,X		; FF 7E FF BF
	sbc $FFFFBE.l,X		; FF BE FF FF
	beq -33.b		; F0 DF
	phx		; DA
	sbc $7277FC.l,X		; FF FC 77 72
	tsa		; 3B
	tsa		; 3B
	sta $97D71E.l,X		; 9F 1E D7 97
	cmp $E0FF8E.l		; CF 8E FF E0
	eor $FB3FF0.l,X		; 5F F0 3F FB
	eor [$FD.b],Y		; 57 FD
	ora $FE97FD.l		; 0F FD 97 FE
	ora $FF95FE.l		; 0F FE 95 FF
	cpx #$F018.w		; E0 18 F0
	tsb $07FB.w		; 0C FB 07
	sbc $FD03.w,X		; FD 03 FD
	ora $FE.b,S		; 03 FE
	sta ($FE.b,X)		; 81 FE
	ora ($FF.b,X)		; 01 FF
	bra  -1.b		; 80 FF
	sbc $EFFF.w		; ED FF EF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $707FF7.l,X		; FF F7 7F 70
	cpx #$E0F2.w		; E0 F2 E0
	beq -64.b		; F0 C0
	cpx #$E0C0.w		; E0 C0 E0
	cpx #$E0F0.w		; E0 F0 E0
	beq -16.b		; F0 F0
	sed		; F8
	adc [$FF.b],Y		; 77 FF
	sbc [$6F.b],Y		; F7 6F
	xce		; FB
	lda $FB.b,S		; A3 FB
	lda [$FD.b],Y		; B7 FD
	eor ($FD.b),Y		; 51 FD
	cmp $DBFD.w,Y		; D9 FD DB
	sbc $FDD9.w,X		; FD D9 FD
	tad		; 5B
	adc [$EF.b],Y		; 77 EF
	and $773B63.l,X		; 3F 63 3B 77
	ora $391FB1.l,X		; 1F B1 1F 39
	ora $1F3B.w,X		; 1D 3B 1F
	and $BB1D.w,Y		; 39 1D BB
	cpx $FB.b		; E4 FB
	cpx $FB.b		; E4 FB
	inc $F9.b		; E6 F9
	inc $F9.b		; E6 F9
	inc $F9.b		; E6 F9
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	cpy #$401E.w		; C0 1E 40
	sta $9843.w,Y		; 99 43 98
	eor $98.b,S		; 43 98
	eor ($8C.b,X)		; 41 8C
	jsr $30C4.w		; 20 C4 30
	dec $11.b		; C6 11
.INDEX 8
	sep #$1E		; E2 1E
	sbc ($19.b,X)		; E1 19
	inc $98.b		; E6 98
	adc [$98.b]		; 67 98
	adc [$0C.b]		; 67 0C
	sbc ($84.b,S),Y		; F3 84
	tda		; 7B
	stx $79.b		; 86 79
.ACCU 16
.INDEX 16
	rep #$3D		; C2 3D
	cpx #$781F.w		; E0 1F 78
	sta [$6B.b]		; 87 6B
	sty $6B.b,X		; 94 6B
	sty $C2.b,X		; 94 C2
	and $249B.w,X		; 3D 9B 24
	ora [$C8.b]		; 07 C8
	bra  99.b		; 80 63
	asl $87F1.w		; 0E F1 87
	sei		; 78
	bcc 111.b		; 90 6F
	bcc 111.b		; 90 6F
	bit $04C3.w,X		; 3C C3 04
	xce		; FB
	rti		; 40

	lda $329F60.l,X		; BF 60 9F 32
	cmp $C035.w		; CD 35 C0
	trb $E3.b		; 14 E3
	trb $E3.b		; 14 E3
	lda ($41.b)		; B2 41
	adc ($9C.b,X)		; 61 9C
	cpy #$403D.w		; C0 3D 40
	lda $E21D.w,X		; BD 1D E2
	cmp ($2D.b)		; D2 2D
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	bvs -113.b		; 70 8F
	jmp ($7D83.w,X)		; 7C 83 7D
	.db $82, $FC, $03		; 82 FC 03
	ora [$F8.b]		; 07 F8
	ora [$E8.b],Y		; 17 E8
	stx $61.b		; 86 61
	stx $61.b		; 86 61
	ora [$78.b]		; 07 78
	bcc 111.b		; 90 6F
	rti		; 40

	lda $FC5EA1.l,X		; BF A1 5E FC
	ora $C6.b,S		; 03 C6
	and $E41B.w,Y		; 39 1B E4
	tas		; 1B
	cpx $A3.b		; E4 A3
	jmp $0EB847.l		; 5C 47 B8 0E
	sbc ($18.b),Y		; F1 18
	sbc [$10.b]		; E7 10
	inc $CC30.w		; EE 30 CC
	jsr $20DC.w		; 20 DC 20
	jmp.w [$3DC0]		; DC C0 3D
	sei		; 78
	sta ($7D.b,X)		; 81 7D
	.db $82, $C4, $38		; 82 C4 38
	dec $8C31.w		; CE 31 8C
	adc ($DC.b,S),Y		; 73 DC
	and $DC.b,S		; 23 DC
	and $FC.b,S		; 23 FC
	ora $F8.b,S		; 03 F8
	ora [$1C.b]		; 07 1C
	sbc $3C.b,S		; E3 3C
	cmp $F3.b,S		; C3 F3
	ora $330FF3.l		; 0F F3 0F 33
	cmp $B3CF33.l		; CF 33 CF B3
	eor $B34FB3.l		; 4F B3 4F B3
	eor $33CF33.l		; 4F 33 CF 33
	cmp $73CF33.l		; CF 33 CF 73
	sta $738F73.l		; 8F 73 8F 73
	sta $738F73.l		; 8F 73 8F 73
	sta $FF0FF3.l		; 8F F3 0F FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FFF3FF.l,X		; FF FF F3 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc $FFFBFF.l,X		; FF FF FB FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FFF3FF.l,X		; FF FF F3 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc $FFFBFF.l,X		; FF FF FB FF
	sbc ($FF.b,S),Y		; F3 FF
	eor ($F3.b),Y		; 51 F3
	.db $42, $CF		; 42 CF
	lsr $6FEF.w		; 4E EF 6F
	sbc $BEFFAF.l,X		; FF AF FF BE
	sbc $59FF5A.l,X		; FF 5A FF 59
	ora $3CAF.w		; 0D AF 3C
	lda $B130.w,X		; BD 30 B1
	brk $90.b		; 00 90
	bra -48.b		; 80 D0
	bra -63.b		; 80 C1
	cpy #$C165.w		; C0 65 C1
	adc [$BF.b]		; 67 BF
	ora $FFFF.w,X		; 1D FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FFFF.w,X		; 1D FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BF41C1.l,X		; FF C1 41 BF
	lda $7BBFBF.l,X		; BF BF BF 7B
	tda		; 7B
	ror $BE7A.w,X		; 7E 7A BE
	ldx $ADAD.w,Y		; BE AD AD
	cmp $5ECD.w,X		; DD CD 5E
	inc $C080.w,X		; FE 80 C0
	bra -64.b		; 80 C0
	brk $84.b		; 00 84
	brk $85.b		; 00 85
	bra -63.b		; 80 C1
	sta ($D3.b,X)		; 81 D3
	cmp ($F3.b,X)		; C1 F3
	adc $767E76.l,X		; 7F 76 7E 76
	ror $7D66.w,X		; 7E 66 7D
	adc $FD.b		; 65 FD
	sbc $CBFB.w		; ED FB CB
	xce		; FB
	stp		; DB
	xce		; FB
	txy		; 9B
	ror $FF.b,X		; 76 FF
	ror $FF.b,X		; 76 FF
	ror $EF.b,X		; 76 EF
	adc $EE.b,X		; 75 EE
	sbc $EBFE.w		; ED FE EB
	jmp.w [$FCDB]		; DC DB FC
	stp		; DB
	ldy $7F78.w,X		; BC 78 7F
	cmp ($FF.b)		; D2 FF
	sbc ($FF.b),Y		; F1 FF
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	lda $FF.b,S		; A3 FF
	cmp $FF.b,S		; C3 FF
	sta $FF.b		; 85 FF
	phd		; 0B
	sbc $FF807F.l,X		; FF 7F 80 FF
	cop $FF.b		; 02 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b		; 05 FF
	phd		; 0B
	adc $FDFF.w,X		; 7D FF FD
	sbc $F7FFFB.l,X		; FF FB FF F7
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $DFFFDF.l,X		; FF DF FF DF
	inc $79FB.w,X		; FE FB 79
	sbc ($F1.b,S),Y		; F3 F1
	sbc [$E3.b]		; E7 E3
	sbc $CFDFE7.l		; EF E7 DF CF
	eor $9FBF4F.l,X		; 5F 4F BF 9F
	ldx $FF9F.w,Y		; BE 9F FF
	sbc $FDFF.w,X		; FD FF FD
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $BDFFFD.l,X		; FF FD FF BD
	sbc $EEFF5E.l,X		; FF 5E FF EE
	jsr ($FCFE.w,X)		; FC FE FC
	inc $FCF8.w,X		; FE F8 FC
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	ldy $5EFE.w,X		; BC FE 5E
	sbc $FFFFEE.l,X		; FF EE FF FF
	inc $FEFF.w,X		; FE FF FE
	sbc [$F5.b],Y		; F7 F5
	sbc [$F5.b],Y		; F7 F5
	sbc $FBFFFB.l,X		; FF FB FF FB
	cmp $D7DFD7.l,X		; DF D7 DF D7
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora #$0103.w		; 09 03 01
	phd		; 0B
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	and [$0F.b]		; 27 0F
	ora [$2F.b]		; 07 2F
	sbc $DEEFCC.l,X		; FF CC EF DE
	sbc $AEEFCE.l,X		; FF CE EF AE
	sbc $BFDF9F.l,X		; FF 9F DF BF
	sbc $3FFF5F.l,X		; FF 5F FF 3F
	sbc $EEDE.w		; ED DE EE
	cmp $FEDFEE.l,X		; DF EE DF FE
	sta $DFBFDF.l		; 8F DF BF DF
	lda $BF3FDF.l,X		; BF DF 3F BF
	adc $73FBF3.l,X		; 7F F3 FB 73
	adc ($FB.b,S),Y		; 73 FB
	xce		; FB
	xce		; FB
	xce		; FB
	tyx		; BB
	tsa		; 3B
	sbc $BFFF7F.l,X		; FF 7F FF BF
	sbc $F3FFAF.l		; EF AF FF F3
	sbc $FBFF73.l,X		; FF 73 FF FB
	sbc $BB7FFB.l,X		; FF FB 7F BB
	adc $FFBFFF.l,X		; 7F FF BF FF
	lda $FFFFCF.l,X		; BF CF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	sbc $FFFF.w,Y		; F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FFF3FF.l		; 0F FF F3 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $E1FFF3.l,X		; FF F3 FF E1
	sbc $FFED.w		; ED ED FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $E1FF.w		; ED FF E1
	sbc $FFFF.w		; ED FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $EEDFF6.l,X		; DF F6 DF EE
	lda $EEBFEE.l,X		; BF EE BF EE
	adc $7F5FDF.l,X		; 7F DF 5F 7F
	sbc $FFBFBF.l,X		; FF BF BF FF
	inc $FF.b,X		; F6 FF
	inc $EEFF.w		; EE FF EE
	sbc $DFFFEE.l,X		; FF EE FF DF
	sbc $BFFFDF.l,X		; FF DF FF BF
	sbc $FF7FBF.l,X		; FF BF 7F FF
	sbc $F5F1FB.l,X		; FF FB F1 F5
	sbc $F5.b,X		; F5 F5
	sbc $D5.b,X		; F5 D5
	eor $FB.b,X		; 55 FB
	adc ($FF.b),Y		; 71 FF
	adc $FFBFFF.l,X		; 7F FF BF FF
	sbc $FFFBF5.l,X		; FF F5 FB FF
	sbc $FF.b,X		; F5 FF
	adc $7F.b,X		; 75 7F
	cmp $75.b,X		; D5 75
	xce		; FB
	adc $FFBFBF.l,X		; 7F BF BF FF
	sbc $F1F3FF.l,X		; FF FF F3 F1
	sbc $F9FD.w,X		; FD FD F9
	sbc $FDFD.w,Y		; F9 FD FD
	sbc ($F1.b,S),Y		; F3 F1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F3FDFF.l,X		; FF FF FD F3
	sbc $F9FFFD.l,X		; FF FD FF F9
	sbc $F3FDFD.l,X		; FF FD FD F3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $717BFF.l,X		; FF FF 7B 71
	adc $75.b,X		; 75 75
	and $15.b,X		; 35 15
	eor $55.b,X		; 55 55
	tyx		; BB
	ora ($FF.b),Y		; 11 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7BF5.l,X		; FF F5 7B FF
	adc $DF.b,X		; 75 DF
	and $FF.b,X		; 35 FF
	eor $55.b,X		; 55 55
	tyx		; BB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	adc $FEFF7E.l,X		; 7F 7E FF FE
	sbc $BFFFDF.l,X		; FF DF FF BF
	sbc $FDEF.w,X		; FD EF FD
	sbc $FDEFFD.l		; EF FD EF FD
	cmp $FE5FFE.l		; CF FE 5F FE
	cmp $BFBFDF.l,X		; DF DF BF BF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $FFFFEF.l,X		; FF EF FF FF
	adc [$FF.b],Y		; 77 FF
	adc ($FB.b,S),Y		; 73 FB
	and [$F9.b],Y		; 37 F9
	and [$FB.b],Y		; 37 FB
	ora [$EF.b],Y		; 17 EF
	cmp $F7C7E7.l		; CF E7 C7 F7
	sbc [$FB.b]		; E7 FB
	adc ($FF.b,S),Y		; 73 FF
	adc ($FF.b,S),Y		; 73 FF
	and ($7D.b,S),Y		; 33 7D
	lda ($7F.b,S),Y		; B3 7F
	sta ($4F.b,S),Y		; 93 4F
	sbc $47FF85.l,X		; FF 85 FF 47
	sbc $C2FF81.l,X		; FF 81 FF C2
	sbc $C0FFA1.l,X		; FF A1 FF C0
	sbc $FFFFA0.l,X		; FF A0 FF FF
	rti		; 40

	sbc $40FF80.l,X		; FF 80 FF 40
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $C0FFA0.l,X		; FF A0 FF C0
	sbc $3078A0.l,X		; FF A0 78 30
	lda $AFBFAF.l,X		; BF AF BF AF
	cmp $DFDFDF.l,X		; DF DF DF DF
	sbc $EDEFEF.l		; EF EF EF ED
	adc $FF37E7.l		; 6F E7 37 FF
	ldy #$A070.w		; A0 70 A0
	bvs -64.b		; 70 C0
	jsr $20C0.w		; 20 C0 20
	cpx #$E010.w		; E0 10 E0
	ora ($E0.b)		; 12 E0
	clc		; 18
	sbc $FDD9.w,X		; FD D9 FD
	stp		; DB
	sbc $51FFD9.l,X		; FF D9 FF 51
	xce		; FB
	lda ($FB.b,S),Y		; B3 FB
	lda [$F7.b]		; A7 F7
	adc $1F47F7.l		; 6F F7 47 1F
	and $3B1D.w,Y		; 39 1D 3B
	ora $1D3B.w,X		; 1D 3B 1D
	lda ($3F.b,S),Y		; B3 3F
	adc ($3B.b,S),Y		; 73 3B
	adc [$77.b]		; 67 77
	sbc $E7C77F.l		; EF 7F C7 E7
	sed		; F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc $F8.b,S		; E3 F8
	sbc [$F8.b]		; E7 F8
	sbc $FC.b,S		; E3 FC
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc $FC.b,S		; E3 FC
	sbc $FC.b,S		; E3 FC
	sbc $FC.b,S		; E3 FC
	clc		; 18
	sbc ($18.b,X)		; E1 18
	sbc ($88.b,X)		; E1 88
	adc [$E0.b],Y		; 77 E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $E0.b,S		; 03 E0
	ora $F11FE0.l,X		; 1F E0 1F F1
	asl $00FF.w		; 0E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FD.b		; 00 FD
	jsr $B0C7.w		; 20 C7 B0
	eor $29.b,S		; 43 29
	bne   5.b		; D0 05
	sed		; F8
	ora $F8.b		; 05 F8
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sbc $C702.w,X		; FD 02 C7
	sec		; 38
	ora $FC.b,S		; 03 FC
	cmp ($3E.b,X)		; C1 3E
	sbc ($0E.b),Y		; F1 0E
	sbc ($0E.b),Y		; F1 0E
	eor ($A0.b,S),Y		; 53 A0
	eor ($A0.b,S),Y		; 53 A0
	cpy $3B.b		; C4 3B
	iny		; C8
	ora [$87.b]		; 07 87
	rts		; 60

	sta ($70.b,X)		; 81 70
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	cpx #$E01F.w		; E0 1F E0
	ora $C007F8.l,X		; 1F F8 07 C0
	and $F01FE0.l,X		; 3F E0 1F F0
	ora $7C837C.l		; 0F 7C 83 7C
	sta $87.b,S		; 83 87
	sei		; 78
	sta [$78.b]		; 87 78
	ora [$F8.b]		; 07 F8
	cop $FD.b		; 02 FD
	bmi -49.b		; 30 CF
	sed		; F8
	ora [$70.b]		; 07 70
	ora $100F70.l		; 0F 70 0F 10
	sbc $30EF10.l		; EF 10 EF 30
	cmp $0333CC.l		; CF CC 33 03
	jsr ($FC03.w,X)		; FC 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	asl $0E71.w		; 0E 71 0E
	adc ($1F.b),Y		; 71 1F
	brk $C3.b		; 00 C3
	trb $FE01.w		; 1C 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	adc [$88.b],Y		; 77 88
	adc [$88.b],Y		; 77 88
	ora $FC.b,S		; 03 FC
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $CF3300.l,X		; FF 00 33 CF
	and ($CF.b,S),Y		; 33 CF
	adc ($8F.b,S),Y		; 73 8F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc $1F.b,S		; E3 1F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc ($0F.b,S),Y		; F3 0F
	sbc $1F.b,S		; E3 1F
	sbc $1F.b,S		; E3 1F
	sbc $33FF25.l,X		; FF 25 FF 33
	sbc $8FFF1F.l,X		; FF 1F FF 8F
	sbc $E1FFC7.l,X		; FF C7 FF E1
	sbc $FEFFF8.l,X		; FF F8 FF FE
	sbc ($3B.b,X)		; E1 3B
	sbc ($3F.b,S),Y		; F3 3F
	adc $CFBF9F.l,X		; 7F 9F BF CF
	cmp $F9E7E7.l,X		; DF E7 E7 F9
	sbc $FEFE.w,Y		; F9 FE FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E3.b,S		; E3 E3
	cmp ($FF.b,X)		; C1 FF
	cmp $E3FF.w,X		; DD FF E3
	sbc $3EFFFF.l,X		; FF FF FF 3E
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF.b,S		; E3 FF
	cmp ($FF.b,X)		; C1 FF
	cmp ($E3.b,X)		; C1 E3
	sbc $FF.b,S		; E3 FF
	sbc $3EFFFF.l,X		; FF FF FF 3E
	rol $D3C1.w,X		; 3E C1 D3
	cmp ($E7.b,S),Y		; D3 E7
	sbc [$FF.b]		; E7 FF
	inc $FCFF.w,X		; FE FF FC
	sbc $C3FFF1.l,X		; FF F1 FF C3
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	cmp $EF.b,S		; C3 EF
	sbc [$FF.b]		; E7 FF
	sbc $FDFEFE.l,X		; FF FE FE FD
	sbc $F3F3.w,X		; FD F3 F3
	cmp $3F3FCF.l		; CF CF 3F 3F
	sbc $F5B5F7.l,X		; FF F7 B5 F5
	and [$EE.b],Y		; 37 EE
	adc $EEEFED.l		; 6F ED EF EE
	sbc $DAD7DC.l		; EF DC D7 DA
	cmp $B5DFD4.l,X		; DF D4 DF B5
	plx		; FA
	lda [$78.b],Y		; B7 78
	adc $F0EFF0.l		; 6F F0 EF F0
	sbc $E8D7F0.l		; EF F0 D7 E8
	cmp $E0DFE0.l,X		; DF E0 DF E0
	sta [$FF.b]		; 87 FF
	adc $FF17FF.l		; 6F FF 17 FF
	and $FF1EFF.l		; 2F FF 1E FF
	ldx $1EFF.w		; AE FF 1E
	sbc $FFFFBD.l,X		; FF BD FF FF
	ora [$FD.b]		; 07 FD
	adc $16FE.w		; 6D FE 16
	jsr ($FD2C.w,X)		; FC 2C FD
	trb $A4F5.w		; 1C F5 A4
	sbc $F318.w,Y		; F9 18 F3
	lda ($BF.b),Y		; B1 BF
	sbc $7FFEBF.l,X		; FF BF FE 7F
	sbc $FFFF7F.l,X		; FF 7F FF FF
	inc $7FFF.w,X		; FE FF 7F
	sbc $30FF07.l,X		; FF 07 FF 30
	adc $3F7E3F.l,X		; 7F 3F 7E 3F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	inc $FFFF.w,X		; FE FF FF
	adc $3F07FF.l,X		; 7F FF 07 3F
	cpy #$FFFF.w		; C0 FF FF
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $EFFF1F.l,X		; FF 1F FF EF
	sbc $FCFF1F.l,X		; FF 1F FF FC
	sbc $FFFF01.l,X		; FF 01 FF FF
	ora $FFFFFF.l		; 0F FF FF FF
	ora $1F0FFF.l,X		; 1F FF 0F 1F
	ora $FCFFFF.l,X		; 1F FF FF FC
	sbc $6EFF00.l,X		; FF 00 FF 6E
	sbc $B9FF1C.l,X		; FF 1C FF B9
	sbc $E7FDF2.l,X		; FF F2 FD E7
	sbc $37EF8B.l,X		; FF 8B EF 37
	sbc $9E0F9F.l,X		; FF 9F 0F 9E
	ora $F8BFFC.l,X		; 1F FC BF F8
	inc $FDF1.w,X		; FE F1 FD
	sbc $FB.b,S		; E3 FB
	sta [$E7.b]		; 87 E7
	ora $BF7F9F.l,X		; 1F 9F 7F BF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BFFFFF.l,X		; FF FF FF BF
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp [$FB.b]		; C7 FB
	cmp ($FF.b,S),Y		; D3 FF
	sbc #$F4FE.w		; E9 FE F4
	sbc $FDFFFA.l,X		; FF FA FF FD
	sbc $FFFFFE.l,X		; FF FE FF FF
	cmp $E3DFE7.l,X		; DF E7 DF E3
	sbc $F8F7F1.l		; EF F1 F7 F8
	xce		; FB
	jsr ($FEFD.w,X)		; FC FD FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FDE7FF.l,X		; FF FF E7 FD
	cmp $BDFD.w,X		; DD FD BD
	sbc [$B7.b],Y		; F7 B7
	sbc [$57.b],Y		; F7 57
	sbc $41FF07.l,X		; FF 07 FF 41
	sbc $F8E09E.l,X		; FF 9E E0 F8
.ACCU 16
	rep #$E0		; C2 E0
	bra -62.b		; 80 C2
	dey		; 88
	cpy #$68C0.w		; C0 C0 68
	cpx #$7818.w		; E0 18 78
	stx $98.b		; 86 98
	sbc ($BF.b,X)		; E1 BF
	ldy $B3B7.w,X		; BC B7 B3
	xce		; FB
	sbc ($F5.b,S),Y		; F3 F5
	sbc $ED.b		; E5 ED
	cmp $9CDF.w		; CD DF 9C
	sbc $0FFFF0.l,X		; FF F0 FF 0F
	rti		; 40

	ora $0C.b,S		; 03 0C
	mvp $0C,$0C		; 44 0C 0C
	inc A		; 1A
	clc		; 18
	bmi  50.b		; 30 32
	rts		; 60

	adc $03.b,S		; 63 03
	tsb $F003.w		; 0C 03 F0
	sbc $79FFFC.l,X		; FF FC FF 79
	sbc $A7FDB2.l,X		; FF B2 FD A7
	sbc $17FF4B.l,X		; FF 4B FF 17
	sbc $7FBF4F.l,X		; FF 4F BF 7F
	sbc $F87FFC.l,X		; FF FC 7F F8
	rol $3D71.w,X		; 3E 71 3D
	adc $7B.b,S		; 63 7B
	cmp [$F7.b]		; C7 F7
	ora $3F3FCF.l		; 0F CF 3F 3F
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFAFFF.l,X		; FF FF AF FF
	cmp [$FF.b]		; C7 FF
	cmp ($FF.b,S),Y		; D3 FF
	sbc #$F4FF.w		; E9 FF F4
	sbc $FEFDFA.l,X		; FF FA FD FE
	sbc $CFBFFF.l,X		; FF FF BF CF
	cmp $E3DFE7.l,X		; DF E7 DF E3
	sbc $F8F7F1.l		; EF F1 F7 F8
	xce		; FB
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF.b,X		; F5 FF
	nop		; EA
	cpx #$FFFF.w		; E0 FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $B87FC3.l,X		; FF C3 7F B8
	sbc $E0FFFF.l,X		; FF FF FF E0
	cpx #$FFFF.w		; E0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $3F03FF.l,X		; 1F FF 03 3F
	cpy #$FFFF.w		; C0 FF FF
	eor #$B6FF.w		; 49 FF B6
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $F9FFFC.l,X		; FF FC FF F9
	sbc $E5FFF2.l,X		; FF F2 FF E5
	sbc $07F808.l,X		; FF 08 F8 07
	bra 122.b		; 80 7A
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F1FEF8.l,X		; FF F8 FE F1
	sbc $FFE3.w,X		; FD E3 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$FF.b]		; 07 FF
	lda $FF7FFF.l,X		; BF FF 7F FF
	adc $F8F8FF.l,X		; 7F FF F8 F8
	sta [$80.b]		; 87 80
	sei		; 78
	ora ($80.b,S),Y		; 13 80
	pld		; 2B
	ora ($BF.b,X)		; 01 BF
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $FFF8FF.l,X		; FF FF F8 FF
	bra  -8.b		; 80 F8
	ora [$80.b]		; 07 80
	adc $F3FE01.l,X		; 7F 01 FE F3
	bit #$93E2.w		; 89 E2 93
	cpy $20.b		; C4 20
	asl A		; 0A
	cpy #$030A.w		; C0 0A 03
	ldx $CC0B.w,Y		; BE 0B CC
	sta [$DA.b]		; 87 DA
	and $B3C7B9.l,X		; 3F B9 C7 B3
	cpy $1FE0.w		; CC E0 1F
	cpy #$033F.w		; C0 3F 03
	jsr ($F40B.w,X)		; FC 0B F4
	sta [$78.b]		; 87 78
	and $FF40C8.l,X		; 3F C8 40 FF
	ldy #$00FF.w		; A0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	rti		; 40

	sbc $00FFA0.l,X		; FF A0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $D4F700.l,X		; FF 00 F7 D4
	eor [$F1.b],Y		; 57 F1
	tsa		; 3B
	xce		; FB
	tad		; 5B
	plx		; FA
	tsa		; 3B
	sed		; F8
	ora $2DF4.w,X		; 1D F4 2D
	sbc $FD15.w,X		; FD 15 FD
	bne  43.b		; D0 2B
	sbc ($0F.b),Y		; F1 0F
	xce		; FB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	tsb $F4.b		; 04 F4
	phd		; 0B
	sbc $FD03.w,X		; FD 03 FD
	ora $EF.b,S		; 03 EF
	cmp $DF8FEF.l,X		; DF EF 8F DF
	ora $FF7FBF.l,X		; 1F BF 7F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $EFFFFF.l,X		; FF FF FF EF
	cmp $FF8FFF.l,X		; DF FF 8F FF
	ora $7F7FBF.l,X		; 1F BF 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F1FFFF.l,X		; FF FF FF F1
	cpx $ECF2.w		; EC F2 EC
	beq  -1.b		; F0 FF
	sed		; F8
	sbc [$F3.b],Y		; F7 F3
	cpx $EFF1.w		; EC F1 EF
.INDEX 8
	sep #$DF		; E2 DF
	cmp $BF.b		; C5 BF
	sbc ($FE.b,X)		; E1 FE
	cpx #$FF.b		; E0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	jsr ($FFE3.w,X)		; FC E3 FF
	cpx #$FF.b		; E0 FF
	cpy #$FF.b		; C0 FF
	bra  -2.b		; 80 FE
	ora ($FF.b,X)		; 01 FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $57FF00.l,X		; FF 00 FF 57
	sbc $FBFF77.l,X		; FF 77 FF FB
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $05.b,S		; 03 05
	plx		; FA
	sta ($7E.b,X)		; 81 7E
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FBFF.l,X		; FF FF FB 04
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0380FF.l,X		; FF FF 80 03
	bvc -81.b		; 50 AF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sta ($7E.b,X)		; 81 7E
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F80FF.l,X		; FF FF 80 7F
	ora $00FFE0.l,X		; 1F E0 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F807FF.l,X		; FF FF 07 F8
	sbc $00FD00.l,X		; FF 00 FD 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $03FC00.l,X		; FF 00 FC 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1BC7FF.l,X		; FF FF C7 1B
	lda [$1B.b]		; A7 1B
	ora [$FF.b]		; 07 FF
	ora $9F7FF7.l		; 0F F7 7F 9F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FC3FF.l,X		; FF FF C3 3F
	sta $7F.b,S		; 83 7F
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFF3.l,X		; FF F3 FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $F3FFFB.l,X		; FF FB FF F3
	sbc $FFF8FB.l,X		; FF FB F8 FF
	sbc $FBFFF3.l,X		; FF F3 FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $F3FFFB.l,X		; FF FB FF F3
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $9F7F7F.l,X		; FF 7F 7F 9F
	ora $F807E7.l,X		; 1F E7 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	ldy #$FF.b		; A0 FF
	sbc $1FFF7F.l,X		; FF 7F FF 1F
	sbc $00FF07.l,X		; FF 07 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFC1.l,X		; FF C1 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E11F1F.l,X		; FF 1F 1F E1
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	cmp ($FF.b,X)		; C1 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	and $FFFFC0.l,X		; 3F C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $AFB800.l,X		; FF 00 B8 AF
	sty $9F.b,X		; 94 9F
	tay		; A8
	lda $389F94.l		; AF 94 9F 38
	ora $407F50.l,X		; 1F 50 7F 40
	ora $AF3F50.l,X		; 1F 50 3F AF
	bne -97.b		; D0 9F
	cpx #$AF.b		; E0 AF
	bne -97.b		; D0 9F
	cpx #$1F.b		; E0 1F
	cpx #$7F.b		; E0 7F
	bra  31.b		; 80 1F
	cpx #$3F.b		; E0 3F
	cpy #$5D.b		; C0 5D
	sbc $5BFF3D.l,X		; FF 3D FF 5B
	sbc $7BFF3B.l,X		; FF 3B FF 7B
	sbc $37FF37.l,X		; FF 37 FF 37
	sbc $FBBF37.l,X		; FF 37 BF FB
	eor $31F3.w,Y		; 59 F3 31
	sbc [$53.b],Y		; F7 53
	sbc [$33.b],Y		; F7 33
	sbc [$73.b],Y		; F7 73
	sbc $27EF27.l		; EF 27 EF 27
	lda $C6FF67.l		; AF 67 FF C6
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8C7FF.l,X		; FF FF C7 F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0CFF.l,X		; FF FF 0C FF
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	ora $03.b,S		; 03 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBF7EF.l,X		; FF EF F7 FB
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8E7FF.l,X		; FF FF E7 F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $A7FCFF.l,X		; FF FF FC A7
	tad		; 5B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($0303.w,X)		; FC 03 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF0FF.l,X		; FF FF F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F0F0FF.l,X		; FF FF F0 F0
	ora $FFF200.l		; 0F 00 F2 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF0FF.l,X		; FF FF F0 FF
	brk $F0.b		; 00 F0
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq -16.b		; F0 F0
	ora $4BF004.l		; 0F 04 F0 4B
	brk $D4.b		; 00 D4
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF0FF.l,X		; FF FF F0 FF
	brk $F0.b		; 00 F0
	ora $00FF00.l		; 0F 00 FF 00
	sbc $FFE7DF.l,X		; FF DF E7 FF
	beq -16.b		; F0 F0
	ora $ABF005.l		; 0F 05 F0 AB
	brk $66.b		; 00 66
	rti		; 40

	stz $5F0F.w		; 9C 0F 5F
	adc $FFF8C7.l,X		; 7F C7 F8 FF
	beq  -1.b		; F0 FF
	brk $F0.b		; 00 F0
	ora $40FF00.l		; 0F 00 FF 40
	lda $7FF00F.l,X		; BF 0F F0 7F
	bit #$87F8.w		; 89 F8 87
	sta ($78.b,X)		; 81 78
	ora [$80.b]		; 07 80
	cmp $6E00.w,X		; DD 00 6E
	ora [$D7.b]		; 07 D7
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $F800FF.l,X		; FF FF 00 F8
	ora [$80.b]		; 07 80
	adc $07FF00.l,X		; 7F 00 FF 07
	sed		; F8
	adc $2BFF80.l,X		; 7F 80 FF 2B
	sbc $80131D.l,X		; FF 1D 13 80
	ora $00.b,X		; 15 00
	lda $7FFB07.l		; AF 07 FB 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	adc $55FF83.l,X		; 7F 83 FF 55
	sbc $AFFF9A.l,X		; FF 9A FF AF
	sbc $004DFF.l,X		; FF FF 4D 00
	sbc $D73F.w		; ED 3F D7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00F0FF.l,X		; FF FF F0 00
	sbc $FFC43F.l,X		; FF 3F C4 FF
	cmp ($FF.b)		; D2 FF
	adc $B7FF.w,X		; 7D FF B7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF6CF0.l,X		; FF F0 6C FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C3FFFF.l,X		; FF FF FF C3
	sbc $28FF00.l,X		; FF 00 FF 28
	sbc $D7FF7A.l,X		; FF 7A FF D7
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $C3FFFF.l,X		; FF FF FF C3
	sbc $FF5000.l,X		; FF 00 50 FF
	tay		; A8
	sbc $EAFFD4.l,X		; FF D4 FF EA
	sbc $FAFFF4.l,X		; FF F4 FF FA
	sbc $FAFFFD.l,X		; FF FD FF FA
	adc $FF50FF.l,X		; 7F FF 50 FF
	tay		; A8
	sbc $EAFF54.l,X		; FF 54 FF EA
	sbc $FAFFF4.l,X		; FF F4 FF FA
	sbc $7AFFFD.l,X		; FF FD FF 7A
	asl $14FA.w		; 0E FA 14
	jsr ($FA0A.w,X)		; FC 0A FA
	trb $FC.b		; 14 FC
	asl $05FC.w		; 0E FC 05
	sbc $85FF03.l,X		; FF 03 FF 85
	sbc $FC05FA.l,X		; FF FA 05 FC
	ora $FA.b,S		; 03 FA
	ora $FC.b		; 05 FC
	ora $FC.b,S		; 03 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	sbc $E7F8.w,Y		; F9 F8 E7
	rts		; 60

	ora $047F00.l,X		; 1F 00 7F 04
	adc $FF7F10.l,X		; 7F 10 7F FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	sed		; F8
	sbc $807FE0.l,X		; FF E0 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $7F8080.l,X		; 7F 80 80 7F
	ora $FF.b,X		; 15 FF
	ora ($FF.b,X)		; 01 FF
	and $FF07FF.l		; 2F FF 07 FF
	sta $FF5FFF.l,X		; 9F FF 5F FF
	sta $00FFFF.l		; 8F FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFF900.l,X		; FF 00 F9 FF
	ror $FFFF.w,X		; 7E FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFC.l,X		; FF FC FF FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8BFFDD.l,X		; FF DD FF 8B
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	sbc $FFFF1F.l,X		; FF 1F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8EFF8D.l,X		; FF 8D FF 8E
	sbc $FFFF00.l,X		; FF 00 FF FF
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F2.b		; 00 F2
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $6FFF3F.l,X		; FF 3F FF 6F
	sbc $FFFF0D.l,X		; FF 0D FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $EDFF50.l,X		; FF 50 FF ED
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FEA0.w,X		; FE A0 FE
	asl A		; 0A
	inc $FE04.w,X		; FE 04 FE
	rol A		; 2A
	inc $FEFF.w,X		; FE FF FE
	inc $FEFE.w,X		; FE FE FE
	inc $01FE.w,X		; FE FE 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($40.b,X)		; 01 40
	eor $A0BFD0.l,X		; 5F D0 BF A0
	and $603F10.l,X		; 3F 10 3F 60
	adc $607F50.l,X		; 7F 50 7F 60
	adc $5F7F50.l,X		; 7F 50 7F 5F
	ldy #$BF.b		; A0 BF
	rti		; 40

	and $C03FC0.l,X		; 3F C0 3F C0
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc [$CF.b],Y		; 77 CF
	ora [$E8.b],Y		; 17 E8
	bcs -49.b		; B0 CF
	bvc -17.b		; 50 EF
	ldx $CF.b,Y		; B6 CF
	eor [$EF.b],Y		; 57 EF
	sbc [$CF.b],Y		; F7 CF
	cmp [$EF.b],Y		; D7 EF
	sbc $00FF07.l,X		; FF 07 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	plp		; 28
	sbc $FFFF9F.l,X		; FF 9F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $E1FF00.l,X		; FF 00 FF E1
	inc $E15E.w,X		; FE 5E E1
	cpx #$1E.b		; E0 1E
	ora ($E0.b,X)		; 01 E0
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $E001.w,X		; FE 01 E0
	ora $FFFFFF.l,X		; 1F FF FF FF
	brk $01.b		; 00 01
	inc $E11E.w,X		; FE 1E E1
	cpx #$1E.b		; E0 1E
	ora ($E0.b,X)		; 01 E0
	rol $00.b,X		; 36 00
	bit #$FF01.w		; 89 01 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($E0.b,X)		; 01 E0
	ora $01FF00.l,X		; 1F 00 FF 01
	inc $FEFF.w,X		; FE FF FE
	inc $E001.w,X		; FE 01 E0
	asl $E005.w,X		; 1E 05 E0
	asl $4704.w,X		; 1E 04 47
	cop $BA.b		; 02 BA
	phd		; 0B
	iny		; C8
	eor $FFFEFF.l,X		; 5F FF FE FF
	brk $FE.b		; 00 FE
	ora ($E0.b,X)		; 01 E0
	ora $02FB04.l,X		; 1F 04 FB 02
	sbc $F40B.w,X		; FD 0B F4
	eor $0FF0A0.l,X		; 5F A0 F0 0F
	asl A		; 0A
	sed		; F8
	and $00.b		; 25 00
	lsr $C602.w,X		; 5E 02 C6
	tsb $19.b		; 04 19
	and $F7FFBD.l,X		; 3F BD FF F7
	sbc $F800FF.l,X		; FF FF 00 F8
	ora [$00.b]		; 07 00
	sbc $04FD02.l,X		; FF 02 FD 04
	xce		; FB
	and $2DFFC0.l,X		; 3F C0 FF 2D
	sbc $0016D2.l,X		; FF D2 16 00
	lda $8300.w		; AD 00 83
	cop $22.b		; 02 22
	ora $3FFFD7.l		; 0F D7 FF 3F
	lda $FFFFFF.l,X		; BF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFD02.l,X		; FF 02 FD 0F
	beq  -1.b		; F0 FF
	stx $BF.b		; 86 BF
	tda		; 7B
	sbc $BFFF4F.l,X		; FF 4F FF BF
	sbc $4A23.w,Y		; F9 23 4A
	ora $FDFF6B.l,X		; 1F 6B FF FD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFF.l,X		; FF FF FC FF
	cmp $23.b,S		; C3 23
	jmp.w [$EA1F]		; DC 1F EA
	sbc $BCFF03.l,X		; FF 03 FF BC
	sbc $5FFFEF.l,X		; FF EF FF 5F
	sbc $C3FFFC.l,X		; FF FC FF C3
	and [$BF.b],Y		; 37 BF
	lda $FFFFFF.l,X		; BF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $3FFFC1.l,X		; FF C1 FF 3F
	sbc ($FF.b),Y		; F1 FF
	lda $B6FF45.l,X		; BF 45 FF B6
	sbc $FFFF5B.l,X		; FF 5B FF FF
	sbc $C1FFFC.l,X		; FF FC FF C1
	sbc $F0FF3F.l,X		; FF 3F FF F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E1FEFE.l,X		; FF FE FE E1
	sbc $FFFF00.l,X		; FF 00 FF FF
	sta $906DF4.l		; 8F F4 6D 90
	sbc $FFFFDF.l,X		; FF DF FF FF
	sbc $E0FFFE.l,X		; FF FE FF E0
	sbc $FFFF00.l,X		; FF 00 FF FF
	pea $908B.w		; F4 8B 90
	adc $FFFEFF.l		; 6F FF FE FF
	cpx #$E0.b		; E0 E0
	ora $E2FF04.l,X		; 1F 04 FF E2
	ora $FBCFF7.l,X		; 1F F7 CF FB
	adc [$BB.b]		; 67 BB
	adc [$FF.b],Y		; 77 FF
	inc $E0FF.w,X		; FE FF E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	adc $B07FE0.l,X		; 7F E0 7F B0
	sbc $0FF000.l,X		; FF 00 F0 0F
	brk $FF.b		; 00 FF
	and $FF54FF.l		; 2F FF 54 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FF.b,X)		; 01 FF
	dey		; 88
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7D.b		; 00 7D
	sbc $3DFF3E.l,X		; FF 3E FF 3D
	sbc $FFFF5E.l,X		; FF 5E FF FF
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $3EFF.w,X		; 7D FF 3E
	sbc $1EFF3D.l,X		; FF 3D FF 1E
	sbc $1EFF1F.l,X		; FF 1F FF 1E
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	ora $FF.b,S		; 03 FF
	sta $FF.b		; 85 FF
	ora $FF.b,S		; 03 FF
	sta $FF.b		; 85 FF
	eor $FF.b,S		; 43 FF
	sta $FF.b		; 85 FF
	eor $FF.b,S		; 43 FF
	sta $FF.b		; 85 FF
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $80FF40.l,X		; FF 40 FF 80
	sbc $80FF40.l,X		; FF 40 FF 80
	eor $7F.b		; 45 7F
	ldx #$BF.b		; A2 BF
	sta $BF.b,S		; 83 BF
	lda $BF.b,S		; A3 BF
	sta $BFBFBF.l		; 8F BF BF BF
	lda $BFBFBF.l,X		; BF BF BF BF
	adc $40BF80.l,X		; 7F 80 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFDFF.l,X		; FF FF FD FF
	jsr ($E9FF.w,X)		; FC FF E9
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F4.b		; 00 F4
	sbc $E5FFE0.l,X		; FF E0 FF E5
	sbc $83FFA0.l,X		; FF A0 FF 83
	sbc $5FFF0F.l,X		; FF 0F FF 5F
	sbc $FFFF3F.l,X		; FF 3F FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $3FFF41.l,X		; FF 41 FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc $FCFFC0.l,X		; FF C0 FF FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B3.b		; 00 B3
	sbc $00FF11.l,X		; FF 11 FF 00
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	jsr ($FC0A.w,X)		; FC 0A FC
	cop $FC.b		; 02 FC
	brk $FD.b		; 00 FD
	xce		; FB
	jsr ($FFFC.w,X)		; FC FC FF
	inc $FDFD.w,X		; FE FD FD
	inc $03FC.w,X		; FE FC 03
	jsr ($FC03.w,X)		; FC 03 FC
	ora $FC.b,S		; 03 FC
	ora $04.b,S		; 03 04
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $42.b,S		; 03 42
	sbc $827FC1.l,X		; FF C1 7F 82
	sbc $02FF41.l,X		; FF 41 FF 02
	adc $02FF41.l,X		; 7F 41 FF 02
	adc $7FFF41.l,X		; 7F 41 FF 7F
	.db $82, $7F, $81		; 82 7F 81
	sbc $01FF02.l,X		; FF 02 FF 01
	adc $01FF82.l,X		; 7F 82 FF 01
	adc $01FF82.l,X		; 7F 82 FF 01
	adc [$EF.b],Y		; 77 EF
	tax		; AA
	sbc [$69.b],Y		; F7 69
	sbc [$E4.b],Y		; F7 E4
	xce		; FB
	adc ($DD.b)		; 72 DD
	sbc $78E2.w,Y		; F9 E2 78
	sbc #$F03C.w		; E9 3C F0
	sbc $00FF20.l,X		; FF 20 FF 00
	sbc $00FF20.l,X		; FF 20 FF 00
	cmp $1CE320.l,X		; DF 20 E3 1C
	sbc #$F016.w		; E9 16 F0
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $FCFC13.l,X		; FF 13 FC FC
	ora $00.b,S		; 03 00
	jsr ($C003.w,X)		; FC 03 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($C003.w,X)		; FC 03 C0
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FCFCFF.l,X		; FF FF FC FC
	cmp $C1.b,S		; C3 C1
	bit $C001.w,X		; 3C 01 C0
	asl $C000.w,X		; 1E 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $C0.b,S		; 03 C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $FCFCFF.l,X		; FF FF FC FC
	cmp $C2.b,S		; C3 C2
	sec		; 38
	brk $C0.b		; 00 C0
	rol $00.b,X		; 36 00
	lda ($12.b)		; B2 12
	adc #$4B29.w		; 69 29 4B
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $F8.b		; 00 F8
	ora [$C0.b]		; 07 C0
	and $12FF00.l,X		; 3F 00 FF 12
	sbc $D729.w		; ED 29 D7
	adc $1EE082.l,X		; 7F 82 E0 1E
	ora $E0.b		; 05 E0
	inc A		; 1A
	brk $33.b		; 00 33
	ora ($89.b),Y		; 11 89
	phb		; 8B
	ror A		; 6A
	adc $FFFF3F.l,X		; 7F 3F FF FF
	sbc $E001FE.l,X		; FF FE 01 E0
	ora $11FF00.l,X		; 1F 00 FF 11
	inc $748B.w		; EE 8B 74
	adc $15FFA8.l,X		; 7F A8 FF 15
	sbc $0095BB.l,X		; FF BB 95 00
	ldy $8704.w		; AC 04 87
	sta $86FF24.l		; 8F 24 FF 86
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $8FFB04.l,X		; FF 04 FB 8F
	adc ($FF.b),Y		; 71 FF
	tsb $FF.b		; 04 FF
	cop $FF.b		; 02 FF
	lda $F7FF.w,X		; BD FF F7
	sbc $0745FF.l,X		; FF FF 45 07
	mvn $98,$6F		; 54 6F 98
	sbc $FFFF6B.l,X		; FF 6B FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq  -1.b		; F0 FF
	ora $6FF807.l		; 0F 07 F8 6F
	sty $FF.b,X		; 94 FF
	clc		; 18
	sbc $FFFF49.l,X		; FF 49 FF FF
	sbc $F0FF7F.l,X		; FF 7F FF F0
	sbc $FFA70F.l,X		; FF 0F A7 FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $FFFC0F.l,X		; FF 0F FC FF
	cmp ($FE.b,X)		; C1 FE
	sbc $5FFFA5.l,X		; FF A5 FF 5F
	sbc $FFFFB7.l,X		; FF B7 FF FF
	sbc $0FFFF0.l,X		; FF F0 FF 0F
	sbc $C1FEFC.l,X		; FF FC FE C1
	sbc $83FFFC.l,X		; FF FC FF 83
	sbc $FFE17F.l,X		; FF 7F E1 FF
	plp		; 28
	sbc [$C9.b],Y		; F7 C9
	and $3D3D.w,Y		; 39 3D 3D
	plb		; AB
	plb		; AB
	sbc $83FFFC.l,X		; FF FC FF 83
	sbc $E0FF7F.l,X		; FF 7F FF E0
	pea $090B.w		; F4 0B 09
	inc $3D.b,X		; F6 3D
.ACCU 16
	rep #$AB		; C2 AB
	mvn $3F,$FF		; 54 FF 3F
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	asl $EFF9.w		; 0E F9 EF
	and ($EE.b,S),Y		; 33 EE
	rol $D7D7.w		; 2E D7 D7
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	sbc $E1FE3F.l,X		; FF 3F FE E1
	sed		; F8
	ora [$23.b]		; 07 23
	jmp.w [$D12E]		; DC 2E D1
	cmp [$28.b],Y		; D7 28
	sbc $C47F02.l,X		; FF 02 7F C4
	and $B6D3.w,X		; 3D D3 B6
	cpy $BD7D.w		; CC 7D BD
	eor $55.b,X		; 55 55
	lda $FFFFBF.l,X		; BF BF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp ($2E.b),Y		; D1 2E
	cpy $3B.b		; C4 3B
	and $55C2.w,X		; 3D C2 55
	tax		; AA
	lda $00FF50.l,X		; BF 50 FF 00
	sbc $65FF12.l,X		; FF 12 FF 65
	inc $A524.w,X		; FE 24 A5
	lda $FF.b		; A5 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $24FFFF.l,X		; FF FF FF 24
	stp		; DB
	lda $5B.b		; A5 5B
	sbc $00FF14.l,X		; FF 14 FF 00
	sbc $2EFF82.l,X		; FF 82 FF 2E
	sbc $DEFFDA.l,X		; FF DA FF DE
	cmp $7B7FF3.l,X		; DF F3 7F 7B
	sbc $F9DFFB.l		; EF FB DF F9
	sbc $FDFEFD.l		; EF FD FE FD
	sbc $FEFBFE.l,X		; FF FE FB FE
	sbc $987F90.l,X		; FF 90 7F 98
	sbc $08FF88.l,X		; FF 88 FF 08
	sbc $6CFFC4.l,X		; FF C4 FF 6C
	sbc $DAFFBE.l,X		; FF BE FF DA
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $B9FF.w		; 6D FF B9
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $9FFFFF.l,X		; FF FF FF 9F
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$07.b]		; 07 07
	ora [$41.b]		; 07 41
	sbc $C1FFA1.l,X		; FF A1 FF C1
	inc $FFA3.w,X		; FE A3 FF
	bne  -1.b		; D0 FF
	lda ($FF.b,X)		; A1 FF
	cmp ($FE.b,X)		; C1 FE
	ldy #$FE.b		; A0 FE
	sbc $A0FF40.l,X		; FF 40 FF A0
	inc $FFC1.w,X		; FE C1 FF
	ldy #$FF.b		; A0 FF
	bne  -1.b		; D0 FF
	ldy #$FE.b		; A0 FE
	cmp ($FE.b,X)		; C1 FE
	lda ($DF.b,X)		; A1 DF
	cmp $D9DFDF.l,X		; DF DF DF D9
	cmp $C1DF40.l,X		; DF 40 DF C1
	cmp $DFDF5F.l,X		; DF 5F DF DF
	cmp $DFDF5F.l,X		; DF 5F DF DF
	jsr $20DF.w		; 20 DF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	dec $C020.w,X		; DE 20 C0
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	ldy #$FF.b		; A0 FF
	sta ($FF.b,X)		; 81 FF
	ora [$FF.b]		; 07 FF
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	inc $F800.w,X		; FE 00 F8
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $FD.b		; 00 FD
	inc $FFFC.w,X		; FE FC FF
	sbc $FEFC.w,X		; FD FC FE
	jsr ($FCFF.w,X)		; FC FF FC
	jsr ($FFFE.w,X)		; FC FE FF
	jsr ($FCFD.w,X)		; FC FD FC
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	bra 127.b		; 80 7F
	cpy #$7F.b		; C0 7F
	brk $7F.b		; 00 7F
	rti		; 40

	adc $C0FF80.l,X		; 7F 80 FF C0
	adc $407F80.l,X		; 7F 80 7F 40
	adc $7F807F.l,X		; 7F 7F 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra  93.b		; 80 5D
	sed		; F8
	and $FF0FFE.l		; 2F FE 0F FF
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	ora $FF.b,X		; 15 FF
	pld		; 2B
	sbc $FE07F8.l,X		; FF F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	ora $FF.b,X		; 15 FF
	pld		; 2B
	phk		; 4B
	brk $DE.b		; 00 DE
	cop $FB.b		; 02 FB
	sbc $55FFAA.l,X		; FF AA FF 55
	sbc $7FFFAF.l,X		; FF AF FF 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFD02.l,X		; FF 02 FD FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	ora $FF.b		; 05 FF
	lda $FF7FFF.l		; AF FF 7F FF
	sbc $AA15D5.l,X		; FF D5 15 AA
	sbc $FFFF75.l,X		; FF 75 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFEA15.l,X		; FF 15 EA FF
	brk $FF.b		; 00 FF
	and ($FF.b,X)		; 21 FF
	inc $DFFF.w,X		; FE FF DF
	sbc $FEFEFF.l,X		; FF FF FE FE
	cpy #$C0.b		; C0 C0
	eor $FF.b,X		; 55 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $FFFC1F.l,X		; FF 1F FC FF
	nop		; EA
	sbc $41FF.w,X		; FD FF 41
	sbc $FFFF9D.l,X		; FF 9D FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $7C7F1F.l,X		; FF 1F 7F 7C
	jmp ($FF6B.w,X)		; 7C 6B FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	sbc ($FF.b),Y		; F1 FF
	ora $C1FFFC.l		; 0F FC FF C1
	inc $E699.w,X		; FE 99 E6
	tya		; 98
	pla		; 68
	sbc $FEFF5F.l,X		; FF 5F FF FE
	sbc $0FFFF1.l,X		; FF F1 FF 0F
	sbc $C1FEFC.l,X		; FF FC FE C1
	cpx #$1F.b		; E0 1F
	php		; 08
	sbc [$FF.b],Y		; F7 FF
	beq  -1.b		; F0 FF
	ora $86FFF8.l		; 0F F8 FF 86
	sbc $EC33.w,X		; FD 33 EC
	jmp ($D18C.w,X)		; 7C 8C D1
	eor ($47.b),Y		; 51 47
	eor [$FF.b]		; 47 FF
	beq  -1.b		; F0 FF
	ora $FDF8FF.l		; 0F FF F8 FD
	.db $82, $E0, $1F		; 82 E0 1F
	tsb $51F3.w		; 0C F3 51
	ldx $B847.w		; AE 47 B8
	sbc $C7FF.w,X		; FD FF C7
	inc $F638.w,X		; FE 38 F6
	lda [$4F.b],Y		; B7 4F
	bvc -48.b		; 50 D0
	ora $7F7F0F.l		; 0F 0F 7F 7F
	sbc $FCFFFF.l,X		; FF FF FF FC
	inc $F0C1.w,X		; FE C1 F0
	ora $50F807.l		; 0F 07 F8 50
	lda $7FF00F.l		; AF 0F F0 7F
	bra  -1.b		; 80 FF
	eor $3B.b		; 45 3B
	cmp $3A.b		; C5 3A
	jmp.w [$69E9]		; DC E9 69
	tas		; 1B
	tas		; 1B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp ($3E.b,X)		; C1 3E
	tya		; 98
	adc [$69.b]		; 67 69
	stx $1B.b,Y		; 96 1B
	cpx $FF.b		; E4 FF
	brk $FF.b		; 00 FF
	.db $82, $FF, $4D		; 82 FF 4D
	sbc $6AEAB6.l,X		; FF B6 EA 6A
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $956AFF.l,X		; FF FF 6A 95
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $2DFF04.l,X		; FF 04 FF 2D
	sbc $5FFFDA.l,X		; FF DA FF 5F
	sbc $FFFFB5.l,X		; FF B5 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $ADFFFF.l,X		; FF FF FF AD
	sbc $FFFF76.l,X		; FF 76 FF FF
	sbc $DFFF7D.l,X		; FF 7D FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FFFF0F.l		; 0F 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0F.b,X)		; 01 0F
	ora $FFFFFF.l		; 0F FF FF FF
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FFFF.w,X		; FE FF FF
	sbc $D4FFFA.l,X		; FF FA FF D4
	sbc $07FFA0.l,X		; FF A0 FF 07
	ora [$0F.b]		; 07 0F
	ora $3F0F0F.l		; 0F 0F 0F 3F
	rol $FFFF.w,X		; 3E FF FF
	sbc $D4FFFA.l,X		; FF FA FF D4
	sbc $FFC0A0.l,X		; FF A0 C0 FF
	ldy #$FE.b		; A0 FE
	rti		; 40

	sbc $41FF83.l,X		; FF 83 FF 41
	inc $FE00.w,X		; FE 00 FE
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	sbc $A1FEC0.l,X		; FF C0 FE A1
	sbc $80FF40.l,X		; FF 40 FF 80
	inc $FE41.w,X		; FE 41 FE
	ora ($FD.b,X)		; 01 FD
	cop $FE.b		; 02 FE
	ora ($5F.b,X)		; 01 5F
	ora $DF5F5F.l,X		; 1F 5F 5F DF
	ora $DF1F9F.l,X		; 1F 9F 1F DF
	cmp $FF9F5F.l,X		; DF 5F 9F FF
	ora $009F5F.l,X		; 1F 5F 9F 00
	cpx #$40.b		; E0 40
	ldy #$00.b		; A0 00
	cpx #$00.b		; E0 00
	cpx #$C0.b		; E0 C0
	jsr $6080.w		; 20 80 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	jsr ($FDFC.w,X)		; FC FC FD
	jsr ($FCFC.w,X)		; FC FC FC
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $0300.w,X		; FE 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	bra  -1.b		; 80 FF
	bne  -1.b		; D0 FF
	brk $7F.b		; 00 7F
	bne  -1.b		; D0 FF
	sbc ($FF.b,X)		; E1 FF
	bvc 127.b		; 50 7F
	sbc ($FF.b,X)		; E1 FF
	bne 127.b		; D0 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $807F01.l,X		; FF 01 7F 80
	sbc $807F01.l,X		; FF 01 7F 80
	eor [$FF.b],Y		; 57 FF
	lda $FF7FFF.l,X		; BF FF 7F FF
	lda $FF7FFF.l,X		; BF FF 7F FF
	lda $FF7FFF.l,X		; BF FF 7F FF
	lda $57FFFF.l,X		; BF FF FF 57
	sbc $7FFFBF.l,X		; FF BF FF 7F
	inc $FEBE.w,X		; FE BE FE
	ror $BCFC.w,X		; 7E FC BC
	jsr ($FE7C.w,X)		; FC 7C FE
	ldx $FFFF.w,Y		; BE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFCFF.l,X		; FF FF FC FC
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $EEF3.w,X		; FD F3 EE
	beq -28.b		; F0 E4
	plx		; FA
	sbc $FFEFFB.l,X		; FF FB EF FF
	sbc $FFFF.w,X		; FD FF FF
	sbc $31FFFF.l,X		; FF FF FF 31
	rol $2F30.w,X		; 3E 30 2F
	dec A		; 3A
	and $3B.b		; 25 3B
	bit $3F.b,X		; 34 3F
	rol A		; 2A
	ora $1F1F19.l,X		; 1F 19 1F 1F
	ora $41C10F.l		; 0F 0F C1 41
	tsa		; 3B
	tsa		; 3B
	lda $FFFFBF.l,X		; BF BF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	eor ($BE.b,X)		; 41 BE
	tsa		; 3B
	cmp $BF.b		; C5 BF
	rtl		; 6B

	sbc $FAFF8F.l,X		; FF 8F FF FA
	sbc $FFFFEF.l,X		; FF EF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $16FFFF.l,X		; FF FF FF 16
	sbc $FBFF55.l,X		; FF 55 FF FB
	sbc $FFFF5D.l,X		; FF 5D FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $87FFFF.l,X		; FF FF FF 87
	sbc $FFFFFD.l,X		; FF FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $7FFF87.l,X		; FF 87 FF 7F
	plx		; FA
	sbc $A0FFD4.l,X		; FF D4 FF A0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sta [$FF.b]		; 87 FF
	adc $FFFAFF.l,X		; 7F FF FA FF
	pei ($FF.b)		; D4 FF
	ldy #$FF.b		; A0 FF
	beq  -1.b		; F0 FF
	sta $FE7FFF.l		; 8F FF 7F FE
	sbc $A8FFF5.l,X		; FF F5 FF A8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	sta $FF7FFF.l		; 8F FF 7F FF
	inc $F5FF.w,X		; FE FF F5
	sbc $00FFA8.l,X		; FF A8 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	inc $F5FF.w,X		; FE FF F5
	sbc $00FFA8.l,X		; FF A8 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF02.l,X		; FF 02 FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	sbc $FF.b,X		; F5 FF
	tay		; A8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $02FF00.l,X		; FF 00 FF 02
	sbc $FF.b,X		; F5 FF
	tay		; A8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0AFF00.l,X		; FF 00 FF 0A
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $FFF5FF.l,X		; FF FF F5 FF
	tay		; A8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0AFF00.l,X		; FF 00 FF 0A
	sbc $AAFF55.l,X		; FF 55 FF AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $FFFF5D.l,X		; FF 5D FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $FFFF5D.l,X		; FF 5D FF FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	sbc $01FE00.l,X		; FF 00 FE 01
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE01.w,X		; FE 01 FE
	ora ($FD.b,X)		; 01 FD
	cop $FE.b		; 02 FE
	ora ($7F.b,X)		; 01 7F
	sta $9F9F5F.l,X		; 9F 5F 9F 9F
	ora $3FBF3F.l,X		; 1F 3F BF 3F
	and $BFBF3F.l,X		; 3F 3F BF BF
	and $003FBF.l,X		; 3F BF 3F 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$DF.b		; C0 DF
	sbc $EFFFDF.l,X		; FF DF FF EF
	sbc $F37FF7.l,X		; FF F7 7F F3
	adc $F93FFB.l,X		; 7F FB 3F F9
	and $EF1FFD.l,X		; 3F FD 1F EF
	cmp $F3C7E7.l		; CF E7 C7 F3
	sbc $FB.b,S		; E3 FB
	adc ($FD.b,S),Y		; 73 FD
	adc ($FD.b),Y		; 71 FD
	and $B87E.w,Y		; 39 7E B8
	ror $0F9C.w,X		; 7E 9C 0F
	sbc $C7FFA5.l,X		; FF A5 FF C7
	sbc $E2FFA1.l,X		; FF A1 FF E2
	sbc $D0FFE1.l,X		; FF E1 FF D0
	sbc $FFFFE8.l,X		; FF E8 FF FF
	brk $FF.b		; 00 FF
	ldy #$FF.b		; A0 FF
	cpy #$FF.b		; C0 FF
	ldy #$FF.b		; A0 FF
	cpx #$7F.b		; E0 7F
	rts		; 60

	sbc $E8FFD0.l,X		; FF D0 FF E8
	sei		; 78
	adc $F1FFD2.l,X		; 7F D2 FF F1
	sbc $A3FFC2.l,X		; FF C2 FF A3
	sbc $03FF85.l,X		; FF 85 FF 03
	sbc $7FFF05.l,X		; FF 05 FF 7F
	bra  -1.b		; 80 FF
	cop $FF.b		; 02 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b		; 05 FF
	ora $FF.b,S		; 03 FF
	ora $7D.b		; 05 7D
	sbc $FBFFFD.l,X		; FF FD FF FB
	sbc $EFFFF7.l,X		; FF F7 FF EF
	sbc $DFEFDF.l,X		; FF DF EF DF
	lda $FBEEDF.l		; AF DF EE FB
	adc $F1F3.w,Y		; 79 F3 F1
	sbc [$E3.b]		; E7 E3
	sbc $CFDFE7.l		; EF E7 DF CF
	sbc $CFBFCF.l,X		; FF CF BF CF
	inc $87CF.w,X		; FE CF 87
	sbc $17FF0F.l,X		; FF 0F FF 17
	sbc $1EFF0F.l,X		; FF 0F FF 1E
	sbc $1EFF2E.l,X		; FF 2E FF 1E
	sbc $FFFF3D.l,X		; FF 3D FF FF
	ora [$FD.b]		; 07 FD
	ora $16FE.w		; 0D FE 16
	jsr ($FD0C.w,X)		; FC 0C FD
	trb $24F5.w		; 1C F5 24
	sbc $F318.w,Y		; F9 18 F3
	and ($FF.b),Y		; 31 FF
	sbc $B6FF49.l,X		; FF 49 FF B6
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	ora $FF.b,S		; 03 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $F9FFFC.l,X		; FF FC FF F9
	sbc $E5FFF2.l,X		; FF F2 FF E5
	sbc $67FF0B.l,X		; FF 0B FF 67
	sbc $FEFF9F.l,X		; FF 9F FF FE
	sbc $F8FFFC.l,X		; FF FC FF F8
	inc $FDF1.w,X		; FE F1 FD
	sbc $FB.b,S		; E3 FB
	ora [$E7.b]		; 07 E7
	ora $FF7F9F.l,X		; 1F 9F 7F FF
	lda $FF7FFF.l,X		; BF FF 7F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BFFFFF.l,X		; FF FF FF BF
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sta $FE8FFE.l,X		; 9F FE 8F FE
	cmp [$FF.b]		; C7 FF
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $FFFFFE.l,X		; FF FE FF FF
	lda $CEBFDC.l,X		; BF DC BF CE
	cmp $F3EFE6.l,X		; DF E6 EF F3
	sbc [$F8.b],Y		; F7 F8
	sbc $FEFE.w,Y		; F9 FE FE
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $74FFFB.l,X		; FF FB FF 74
	sbc $3CFF7A.l,X		; FF 7A FF 3C
	sbc $BC7FBA.l,X		; FF BA 7F BC
	adc $7FFFDE.l,X		; 7F DE FF 7F
	bvs  95.b		; 70 5F
	tad		; 5B
	lda $1A9F34.l,X		; BF 34 9F 1A
	cmp $12D71C.l,X		; DF 1C D7 12
	eor $C6E78C.l		; 4F 8C E7 C6
	sbc [$D4.b],Y		; F7 D4
	eor [$F1.b],Y		; 57 F1
	tsa		; 3B
	xce		; FB
	tad		; 5B
	plx		; FA
	tsa		; 3B
	sed		; F8
	sta $2DF4.w,X		; 9D F4 2D
	sbc $FD95.w,X		; FD 95 FD
	bne  43.b		; D0 2B
	sbc ($0F.b),Y		; F1 0F
	xce		; FB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	tsb $F4.b		; 04 F4
	phb		; 8B
	sbc $FD03.w,X		; FD 03 FD
	sta $CF.b,S		; 83 CF
	sta [$47.b],Y		; 97 47
	dex		; CA
	and $04.b,S		; 23 04
	bvc   3.b		; 50 03
	stz $C0.b,X		; 74 C0
	tda		; 7B
	bne  59.b		; D0 3B
	sbc ($5B.b,X)		; E1 5B
	jsr ($E79F.w,X)		; FC 9F E7
	dec $0733.w		; CE 33 07
	sed		; F8
	ora $FC.b,S		; 03 FC
	cpy #$3F.b		; C0 3F
	bne  47.b		; D0 2F
	sbc ($1E.b,X)		; E1 1E
	jsr ($FF13.w,X)		; FC 13 FF
	sbc $FF0FFF.l,X		; FF FF 0F FF
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	sbc ($01.b,X)		; E1 01
	asl $01C8.w,X		; 1E C8 01
	pei ($80.b)		; D4 80
	sbc $FF0FFF.l,X		; FF FF 0F FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $E01F01.l,X		; FF 01 1F E0
	ora ($FE.b,X)		; 01 FE
	bra 127.b		; 80 7F
	sbc $1CFF6E.l,X		; FF 6E FF 1C
	sbc $F2FFB9.l,X		; FF B9 FF F2
	sbc $FFE7.w,X		; FD E7 FF
	phd		; 0B
	ora $5E01E1.l,X		; 1F E1 01 5E
	ora $FC1F9E.l		; 0F 9E 1F FC
	lda $F1FEF8.l,X		; BF F8 FE F1
	sbc $FBE3.w,X		; FD E3 FB
	ora [$FF.b]		; 07 FF
	ora ($1F.b,X)		; 01 1F
	cpx #$5D.b		; E0 5D
	sbc $5BFF3D.l,X		; FF 3D FF 5B
	sbc $7BFF3B.l,X		; FF 3B FF 7B
	sbc $31FF31.l,X		; FF 31 FF 31
	sbc $FBBF20.l,X		; FF 20 BF FB
	eor $31F3.w,Y		; 59 F3 31
	sbc [$53.b],Y		; F7 53
	sbc [$33.b],Y		; F7 33
	sbc [$73.b],Y		; F7 73
	sbc $31FF31.l,X		; FF 31 FF 31
	lda $E7DF60.l,X		; BF 60 DF E7
	sbc $FFFE.w,Y		; F9 FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C7FFFF.l,X		; FF FF FF C7
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F7FDFE.l,X		; FF FE FD F7
	phd		; 0B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($0303.w,X)		; FC 03 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DEFFDD.l,X		; FF DD FF DE
	sbc $EEFFED.l,X		; FF ED FF EE
	sbc $C6FFEF.l,X		; FF EF FF C6
	sbc $82FFC6.l,X		; FF C6 FF 82
	inc $CDEF.w,X		; FE EF CD
	sbc [$C6.b]		; E7 C6
	sbc [$E5.b],Y		; F7 E5
	sbc [$E6.b],Y		; F7 E6
	sbc [$E7.b],Y		; F7 E7
	sbc $C6FFC6.l,X		; FF C6 FF C6
	inc $0E83.w,X		; FE 83 0E
	plx		; FA
	trb $FC.b		; 14 FC
	asl A		; 0A
	plx		; FA
	trb $FC.b		; 14 FC
	asl $05FC.w		; 0E FC 05
	sbc $05FF03.l,X		; FF 03 FF 05
	sbc $FC05FA.l,X		; FF FA 05 FC
	ora $FA.b,S		; 03 FA
	ora $FC.b		; 05 FC
	ora $FC.b,S		; 03 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $36.b		; 00 36
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $FF.b,S		; C3 FF
	bit $14FF.w,X		; 3C FF 14
	sbc $EBFF5E.l,X		; FF 5E FF EB
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $C3FFFF.l,X		; FF FF FF C3
	sbc $E11F3C.l,X		; FF 3C 1F E1
	sta ($1E.b,X)		; 81 1E
	cpx #$01.b		; E0 01
	ldx $00.b,Y		; B6 00
	rtl		; 6B

	cpx #$EB.b		; E0 EB
	inc $FFFE.w,X		; FE FE FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora $FE01E0.l,X		; 1F E0 01 FE
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	inc $FF01.w,X		; FE 01 FF
	pei ($FF.b)		; D4 FF
	clv		; B8
	sbc $0FFFFF.l,X		; FF FF FF 0F
	ora $0FA0F0.l		; 0F F0 A0 0F
	lda $00.b		; A5 00
	inc A		; 1A
	cop $39.b		; 02 39
	beq  -6.b		; F0 FA
	inc $FFFF.w,X		; FE FF FF
	sbc $00FF0F.l,X		; FF 0F FF 00
	ora $FF00F0.l		; 0F F0 00 FF
	cop $FD.b		; 02 FD
	beq  15.b		; F0 0F
	inc $EF91.w,X		; FE 91 EF
	sbc [$FB.b],Y		; F7 FB
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $F00F0F.l,X		; FF 0F 0F F0
	jsr $920F.w		; 20 0F 92
	brk $29.b		; 00 29
	brk $E7.b		; 00 E7
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $0F00FF.l		; 0F FF 00 0F
	beq   0.b		; F0 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	jsr ($5BA7.w,X)		; FC A7 5B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	ora $4F00F0.l		; 0F F0 00 4F
	jsr ($0303.w,X)		; FC 03 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $0F00FF.l		; 0F FF 00 0F
	beq -35.b		; F0 DD
	sbc $EDFFDE.l,X		; FF DE FF ED
	sbc $EFFFEE.l,X		; FF EE FF EF
	sbc $ECFFEE.l,X		; FF EE FF EC
	sbc $EFFFEC.l,X		; FF EC FF EF
	cmp $C6E7.w		; CD E7 C6
	sbc [$E5.b],Y		; F7 E5
	sbc [$E6.b],Y		; F7 E6
	sbc [$E7.b],Y		; F7 E7
	sbc [$E6.b],Y		; F7 E6
	sbc [$E4.b],Y		; F7 E4
	sbc [$E4.b],Y		; F7 E4
	rti		; 40

	lda [$20.b]		; A7 20
	cmp ($11.b,S),Y		; D3 11
	sbc #$0F.b		; E9 0F
	sep #$0B		; E2 0B
	sbc $02FF21.l		; EF 21 FF 02
	sbc $A7FF10.l,X		; FF 10 FF A7
	cli		; 58
	cmp ($2C.b,S),Y		; D3 2C
	sbc #$16.b		; E9 16
.INDEX 8
	sep #$1D		; E2 1D
	sbc $00FF10.l		; EF 10 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $F807FF.l,X		; 3F FF 07 F8
	brk $6F.b		; 00 6F
	brk $01.b		; 00 01
	dec $00.b,X		; D6 00
	sbc $9AE8.w,Y		; F9 E8 9A
	sbc $FFFF21.l,X		; FF 21 FF FF
	and $6F00FF.l,X		; 3F FF 00 6F
	bcc   1.b		; 90 01
	inc $FF00.w,X		; FE 00 FF
	inx		; E8
	ora [$FF.b],Y		; 17 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $D36801.l,X		; FF 01 68 D3
	lda $00EF.w		; AD EF 00
	and [$8E.b]		; 27 8E
	pha		; 48
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $68.b		; 00 68
	sta [$AD.b],Y		; 97 AD
	eor ($00.b)		; 52 00
	sbc $FF718E.l,X		; FF 8E 71 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $ED0005.l,X		; FF 05 00 ED
	brk $A6.b		; 00 A6
	brk $1E.b		; 00 1E
	phb		; 8B
	ora ($FE.b,X)		; 01 FE
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	phb		; 8B
	stz $FE.b,X		; 74 FE
	ora ($FF.b,X)		; 01 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $540808.l,X		; FF 08 08 54
	brk $AB.b		; 00 AB
	brk $55.b		; 00 55
	and ($80.b,X)		; 21 80
	eor ($FF.b,S),Y		; 53 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	sbc $21FF00.l,X		; FF 00 FF 21
	dec $AC53.w,X		; DE 53 AC
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	asl A		; 0A
	brk $DB.b		; 00 DB
	bra -83.b		; 80 AD
	brk $9F.b		; 00 9F
	eor $00.b		; 45 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $FFBA45.l,X		; FF 45 BA FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $5F0444.l,X		; FF 44 04 5F
	brk $EE.b		; 00 EE
	brk $49.b		; 00 49
	bcc -64.b		; 90 C0
	and #$FF.b		; 29 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $04.b		; 00 04
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bcc 111.b		; 90 6F
	and #$D6.b		; 29 D6
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sta $00.b		; 85 00
	ldx $00.b,Y		; B6 00
	lda $00.b,X		; B5 00
	asl $250A.w,X		; 1E 0A 25
	eor $FF.b,X		; 55 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $55F50A.l,X		; FF 0A F5 55
	ldx $FFFF.w		; AE FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	eor $00.b		; 45 00
	ldx $04.b,Y		; B6 04
	eor $A7F500.l		; 4F 00 F5 A7
	cmp ($7F.b,X)		; C1 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	lda [$58.b]		; A7 58
	adc $FFFF80.l,X		; 7F 80 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	cmp $00.b		; C5 00
	rol $00.b		; 26 00
	mvn $5B,$00		; 54 00 5B
	stx $99.b,Y		; 96 99
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF6996.l,X		; FF 96 69 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $ED8200.l,X		; FF 00 82 ED
	.db $42, $DE		; 42 DE
	tsb $D6.b		; 04 D6
	sbc $FFFF77.l,X		; FF 77 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $82.b		; 00 82
	adc $BD42.w,X		; 7D 42 BD
	tsb $FB.b		; 04 FB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	jsr $C50B.w		; 20 0B C5
	dec A		; 3A
	xba		; EB
	cpy #$72.b		; C0 72
	sei		; 78
	and #$FF.b		; 29 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $F40B00.l,X		; FF 00 0B F4
	dec A		; 3A
	cmp $C0.b		; C5 C0
	and $FF8778.l,X		; 3F 78 87 FF
	brk $FE.b		; 00 FE
	sbc $000FF0.l,X		; FF F0 0F 00
	xce		; FB
	brk $40.b		; 00 40
	lda $80.b,X		; B5 80
	cmp $FF2C0B.l		; CF 0B 2C FF
	.db $42, $FF		; 42 FF
	sbc $00FFFE.l,X		; FF FE FF 00
	xce		; FB
	tsb $40.b		; 04 40
	lda $0B7F80.l,X		; BF 80 7F 0B
	pea $00FF.w		; F4 FF 00
	sbc $F20100.l,X		; FF 00 01 F2
	cop $E5.b		; 02 E5
	mvp $78,$4B		; 44 4B 78
	and $E8.b,S		; 23 E8
	tda		; 7B
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	ldy #$04FF.w		; A0 FF 04
	sbc $E50DF2.l,X		; FF F2 0D E5
	inc A		; 1A
	phk		; 4B
	ldy $23.b,X		; B4 23
	jmp.w [$847B]		; DC 7B 84
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0300.l,X		; FF 00 03 FF
	ora $FF.b		; 05 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b		; 05 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b		; 05 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b		; 05 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	eor $A0BFD0.l,X		; 5F D0 BF A0
	and $603F11.l,X		; 3F 11 3F 60
	adc $627F51.l,X		; 7F 51 7F 62
	adc $5F7F51.l,X		; 7F 51 7F 5F
	ldy #$40BF.w		; A0 BF 40
	and $C13FC0.l,X		; 3F C0 3F C1
	adc $817F80.l,X		; 7F 80 7F 81
	adc $817F82.l,X		; 7F 82 7F 81
	lda $FC7FFF.l,X		; BF FF 7F FC
	ldy $78FF.w,X		; BC FF 78
	sbc $7FFFFE.l,X		; FF FE FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFBFFF.l,X		; FF FF BF FF
	jmp ($BCFF.w,X)		; 7C FF BC
	sbc $F8FF78.l,X		; FF 78 FF F8
	sbc $F8FF78.l,X		; FF 78 FF F8
	sbc $7FFFF0.l,X		; FF F0 FF 7F
	sbc $F80707.l,X		; FF 07 07 F8
	brk $FF.b		; 00 FF
	and $F3FFF8.l,X		; 3F F8 FF F3
	sbc $EEFDE6.l,X		; FF E6 FD EE
	sbc $07FF7F.l,X		; FF 7F FF 07
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	inc $FE07.w,X		; FE 07 FE
	ora $7FFF.w		; 0D FF 7F
	adc $780787.l,X		; 7F 87 07 78
	ldy #$6807.w		; A0 07 68
	jsr $40E6.w		; 20 E6 40
	eor $13D0.w,X		; 5D D0 13
	plx		; FA
	sbc $07FF7F.l,X		; FF 7F FF 07
	adc $F80780.l,X		; 7F 80 07 F8
	jsr $40DF.w		; 20 DF 40
	lda $FA2FD0.l,X		; BF D0 2F FA
	ora $FF.b		; 05 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $78.b		; 00 78
	sta [$07.b]		; 87 07
	sei		; 78
	bra   7.b		; 80 07
	ldy $9300.w,X		; BC 00 93
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra   7.b		; 80 07
	sed		; F8
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	bra 127.b		; 80 7F
	sei		; 78
	sta [$07.b]		; 87 07
	sei		; 78
	cpy #$FF07.w		; C0 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra   7.b		; 80 07
	sed		; F8
	cpx $2C1F.w		; EC 1F 2C
	sbc [$2D.b],Y		; F7 2D
	sbc [$4E.b],Y		; F7 4E
	sbc [$ED.b],Y		; F7 ED
	sbc [$EE.b],Y		; F7 EE
	sbc [$EF.b],Y		; F7 EF
	sbc [$EF.b],Y		; F7 EF
	sbc [$F7.b],Y		; F7 F7
	tsb $FF.b		; 04 FF
	bit $FF.b		; 24 FF
	bit $FF.b		; 24 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $00.b		; 04 00
	sbc $27FF0A.l,X		; FF 0A FF 27
	sbc $7FFFBF.l,X		; FF BF FF 7F
	sbc $FCFF7C.l,X		; FF 7C FF FC
	sbc $FFFF7F.l,X		; FF 7F FF FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $BFFF27.l,X		; FF 27 FF BF
	jsr ($FB7C.w,X)		; FC 7C FB
	sei		; 78
	xce		; FB
	sed		; F8
	sed		; F8
	sei		; 78
	eor $2FFF.w		; 4D FF 2F
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FFEB.w		; C0 EB FF
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF2F.l,X		; FF 2F FF FF
	sbc $003FC0.l,X		; FF C0 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	and $FFFF.w		; 2D FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $EE.b		; 00 EE
	sbc $09FFFF.l,X		; FF FF FF 09
	sbc $FFFF00.l,X		; FF 00 FF FF
	bit $BDFF.w		; 2C FF BD
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $7FFF.w		; AD FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $40.b		; 00 40
	sbc $70FFDF.l,X		; FF DF FF 70
	sbc $FFFF47.l,X		; FF 47 FF FF
	bit #$56FF.w		; 89 FF 56
	sbc $00FFEE.l,X		; FF EE FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	sta $40FF10.l,X		; 9F 10 FF 40
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bpl  -1.b		; 10 FF
	pha		; 48
	dec $52FF.w,X		; DE FF 52
	sbc $D6FFA9.l,X		; FF A9 FF D6
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	dec $DF21.w,X		; DE 21 DF
	sbc $FFFFEF.l,X		; FF EF FF FF
	sbc $8B80FF.l,X		; FF FF 80 8B
	sbc $07FFFE.l,X		; FF FE FF 07
	sbc $FF7F71.l,X		; FF 71 7F FF
	eor $FF.b		; 45 FF
	cmp $FFFF.w		; CD FF FF
	sbc $007F80.l,X		; FF 80 7F 00
	sta $80.b,S		; 83 80
	jsr ($7F04.w,X)		; FC 04 7F
	sta ($59.b,X)		; 81 59
	sbc $FFFFFA.l,X		; FF FA FF FF
	sbc $EB01FF.l,X		; FF FF 01 EB
	sbc $89FFF4.l,X		; FF F4 FF 89
	sbc $FFFFA0.l,X		; FF A0 FF FF
	brk $FF.b		; 00 FF
	plx		; FA
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F2FF28.l,X		; FF 28 FF F2
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $1FFF5F.l,X		; FF 5F FF 1F
	sbc $FFFF0F.l,X		; FF 0F FF FF
	brk $FF.b		; 00 FF
	plp		; 28
	sbc $FEFFF2.l,X		; FF F2 FF FE
	ora $0FEF1F.l,X		; 1F 1F EF 0F
	sbc $07F70F.l		; EF 0F F7 07
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FE.b,X)		; 01 FE
	sta $FF.b,S		; 83 FF
	bvc  -1.b		; 50 FF
	lda #$D1FF.w		; A9 FF D1
	inc $FEA8.w,X		; FE A8 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF01.w,X		; FE 01 FF
	bra  -1.b		; 80 FF
	bvc  -1.b		; 50 FF
	tay		; A8
	inc $FED1.w,X		; FE D1 FE
	lda #$FFFF.w		; A9 FF FF
	sbc $FFFAFF.l,X		; FF FF FA FF
	sbc ($FF.b)		; F2 FF
	cpx #$FFFF.w		; E0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF0FF.l,X		; FF FF F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$FFFF.w		; E0 FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	cpy #$FFFF.w		; C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc $00FF0C.l,X		; FF 0C FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	cmp $37DEFE.l		; CF FE DE 37
	cmp $77DF3B.l,X		; DF 3B DF 77
	lda $FFBFFF.l,X		; BF FF BF FF
	adc $FF7FDF.l,X		; 7F DF 7F FF
	ora #$19FE.w		; 09 FE 19
	sbc $10FF11.l,X		; FF 11 FF 10
	sbc $367F23.l,X		; FF 23 7F 36
	sbc $5BFF7D.l,X		; FF 7D FF 5B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F0FF0F.l,X		; FF 0F FF F0
	and $FF43FF.l,X		; 3F FF 43 FF
	lda ($4F.b)		; B2 4F
	plp		; 28
	and [$FF.b]		; 27 FF
	sbc $FFFF.w		; ED FF FF
	sbc $F0FF0F.l,X		; FF 0F FF F0
	sbc $03FF3F.l,X		; FF 3F FF 03
	ora $DE21F0.l		; 0F F0 21 DE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03F3F.l,X		; FF 3F 3F C0
	brk $3F.b		; 00 3F
	cpy #$FF03.w		; C0 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$FC03.w		; C0 03 FC
	inc $D5F7.w		; EE F7 D5
	sbc $A7EFD6.l		; EF D6 EF A7
	cmp $9FBBCE.l,X		; DF CE BB 9F
	eor [$1E.b]		; 47 1E
	sta [$3C.b],Y		; 97 3C
	ora $FF04FF.l		; 0F FF 04 FF
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	brk $FB.b		; 00 FB
	tsb $C7.b		; 04 C7
	sec		; 38
	sta [$68.b],Y		; 97 68
	ora $FF81F0.l		; 0F F0 81 FF
	ora ($FF.b,X)		; 01 FF
	sta ($FE.b,X)		; 81 FE
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -32.b		; F0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$E8F5.w		; E0 F5 E8
	sbc $FF97F3.l		; EF F3 97 FF
	sbc [$EF.b],Y		; F7 EF
	sbc $FF9FFF.l		; EF FF 9F FF
	sta $FFDFFF.l		; 8F FF DF FF
	pla		; 68
	eor [$F3.b],Y		; 57 F3
	sty $82FF.w		; 8C FF 82
	sbc $8CFF94.l		; EF 94 FF 8C
	sbc $8BFF86.l,X		; FF 86 FF 8B
	sbc $A8D29F.l,X		; FF 9F D2 A8
	eor ($53.b,S),Y		; 53 53
	cmp $FFFFEF.l		; CF EF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra 127.b		; 80 7F
	eor ($AE.b,S),Y		; 53 AE
	sbc $98FFD6.l		; EF D6 FF 98
	sbc $BFFFED.l,X		; FF ED FF BF
	sbc $FFFFFD.l,X		; FF FD FF FF
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $007FFF.l,X		; FF FF 7F 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $07FFFF.l,X		; FF FF FF 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$B8FF.w		; C0 FF B8
	sbc $FDFFF7.l,X		; FF F7 FF FD
	sbc $FFFFAF.l,X		; FF AF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta ($FF.b,X)		; 81 FF
	bne  -1.b		; D0 FF
	ora ($7F.b,X)		; 01 7F
	cmp ($FF.b)		; D2 FF
	sbc ($FF.b,X)		; E1 FF
	eor ($7F.b)		; 52 7F
	sbc ($FF.b,X)		; E1 FF
	cmp ($7F.b)		; D2 7F
	sbc $00FF01.l,X		; FF 01 FF 00
	adc $02FF81.l,X		; 7F 81 FF 02
	sbc $827F01.l,X		; FF 01 7F 82
	sbc $827F01.l,X		; FF 01 7F 82
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFEF.l,X		; FF EF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF8FFF.l,X		; FF FF 8F FF
	sbc $7FAFFF.l,X		; FF FF AF 7F
	adc $1F7F7F.l,X		; 7F 7F 7F 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sbc $FAFFFF.l,X		; FF FF FF FA
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FFFF.l,X		; FF FF FF 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $07FFFE.l,X		; FF FE FF 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$0F.b]		; 07 0F
	ora $1F0F0F.l		; 0F 0F 0F 1F
	ora $BFFEFF.l,X		; 1F FF FE BF
	dec $0F77.w		; CE 77 0F
	and [$5F.b]		; 27 5F
	sbc $FFF7DF.l,X		; FF DF F7 FF
	lda $FFFFFF.l,X		; BF FF FF FF
	sbc $7C8DFF.l,X		; FF FF 8D 7C
	tsb $5CF4.w		; 0C F4 5C
	ldy $DC.b		; A4 DC
	bit $54FC.w		; 2C FC 54
	sed		; F8
	tya		; 98
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	ora $63.b,S		; 03 63
	ora $63.b,S		; 03 63
	ora $63.b,S		; 03 63
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEFE.w,X		; FE FE FE
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	inc $FE3E.w,X		; FE 3E FE
	rol $0000.w,X		; 3E 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	cpy #$C1C0.w		; C0 C0 C1
	cpy #$C0C1.w		; C0 C1 C0
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	inc $FE0E.w,X		; FE 0E FE
	asl $0000.w		; 0E 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	sbc ($F0.b),Y		; F1 F0
	sbc ($F0.b),Y		; F1 F0
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FE00.w,X		; FE 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FE0000.l,X		; FF 00 00 FE
	inc $FEFF.w,X		; FE FF FE
	sbc $0000FE.l,X		; FF FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F8000.l,X		; FF 00 80 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	ora $1CE2E0.l,X		; 1F E0 E2 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	cpx #$FF1F.w		; E0 1F FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000080.l,X		; FF 80 00 00
	adc $FFEF0F.l,X		; 7F 0F EF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $F0807F.l,X		; FF 7F 80 F0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFEFE.l,X		; FF FE FE FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0100FF.l,X		; FF FF 00 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $1F003F.l,X		; FF 3F 00 1F
	cpy #$E708.w		; C0 08 E7
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	cpy #$E03F.w		; C0 3F E0
	ora $0000FF.l,X		; 1F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0500FF.l,X		; FF FF 00 05
	plx		; FA
	ora $FE.b,S		; 03 FE
	ora $F8FF1C.l,X		; 1F 1C FF F8
	sbc [$18.b]		; E7 18
	ora $807FF0.l		; 0F F0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E21D00.l,X		; FF 00 1D E2
	xce		; FB
	tsb $07.b		; 04 07
	sed		; F8
	ora $807FF0.l		; 0F F0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sed		; F8
	clc		; 18
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
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
	brk $F5.b		; 00 F5
	tsb $08F0.w		; 0C F0 08
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F803.w,X)		; FC 03 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
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
	brk $F1.b		; 00 F1
	ora ($83.b,X)		; 01 83
	ora $07.b,S		; 03 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora ($FC.b,X)		; 01 FC
	ora $F8.b,S		; 03 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	and $FFFCFF.l,X		; 3F FF FC FF
	beq  -1.b		; F0 FF
	cpy #$82FF.w		; C0 FF 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7FFF0F.l,X		; FF 0F FF 7F
	sbc $C0FFFC.l,X		; FF FC FF C0
	sbc $34FF03.l,X		; FF 03 FF 34
	jsr ($C343.w,X)		; FC 43 C3
	bit $0F00.w,X		; 3C 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	and [$FC.b],Y		; 37 FC
	adc $FFFFC3.l,X		; 7F C3 FF FF
	sbc $00FFFC.l,X		; FF FC FF 00
	sbc $38FF01.l,X		; FF 01 FF 38
	jsr ($0303.w,X)		; FC 03 03
	jsr ($00FF.w,X)		; FC FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	tsa		; 3B
	jsr ($03FD.w,X)		; FC FD 03
	sec		; 38
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	dec $00FF.w		; CE FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	dec $FFFF.w		; CE FF FF
	brk $CE.b		; 00 CE
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	stz $00FF.w		; 9C FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	stz $FFFF.w		; 9C FF FF
	brk $9C.b		; 00 9C
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc [$FF.b]		; E7 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E7FF00.l,X		; FF 00 FF E7
	sbc $E700FF.l,X		; FF FF 00 E7
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0FFF.l,X		; FF FF 0F FF
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $F80F0B.l,X		; FF 0B 0F F8
	beq  15.b		; F0 0F
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bmi  -1.b		; 30 FF
	sbc ($0F.b,S),Y		; F3 0F
	and $FF03F0.l,X		; 3F F0 03 FF
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $00FF0F.l,X		; FF 0F FF 00
	sbc $0BFF30.l,X		; FF 30 FF 0B
	ora $0FF0F0.l		; 0F F0 F0 0F
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bmi  -1.b		; 30 FF
	xce		; FB
	ora $FFF03F.l		; 0F 3F F0 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sed		; F8
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $80FF03.l,X		; FF 03 FF 80
	sbc $000010.l,X		; FF 10 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0E3C0.l,X		; FF C0 E3 E0
	beq -16.b		; F0 F0
	sed		; F8
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ora $F00FE0.l,X		; 1F E0 0F F0
	ora [$F8.b]		; 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jmp.w [$F723]		; DC 23 F7
	php		; 08
	lda [$58.b]		; A7 58
	stz $8B.b,X		; 74 8B
	cop $FD.b		; 02 FD
	bmi -49.b		; 30 CF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	lda [$27.b]		; A7 27
	pla		; 68
	adc [$F0.b]		; 67 F0
	beq  -8.b		; F0 F8
	sbc $F7E7F7.l		; EF F7 E7 F7
	sbc [$5B.b]		; E7 5B
	cmp ($7B.b,S),Y		; D3 7B
	adc ($D8.b,S),Y		; 73 D8
	brk $9F.b		; 00 9F
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	ora [$18.b]		; 07 18
	php		; 08
	clc		; 18
	php		; 08
	cpy $8C24.w		; CC 24 8C
	tsb $BF.b		; 04 BF
	bra -36.b		; 80 DC
	cmp $F7.b,S		; C3 F7
	inx		; E8
	sbc [$F8.b]		; E7 F8
	pea $E2EB.w		; F4 EB E2
	sbc $6F50.w,X		; FD 50 6F
	cpy #$7FDF.w		; C0 DF 7F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EB.b		; 00 EB
	trb $46.b		; 14 46
	lda $3DC2.w,Y		; B9 C2 3D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $22DD00.l,X		; FF 00 DD 22
	sbc [$08.b],Y		; F7 08
	lda [$58.b]		; A7 58
	stz $8B.b,X		; 74 8B
	cop $FD.b		; 02 FD
	bmi -49.b		; 30 CF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $46B900.l,X		; FF 00 B9 46
	sbc $B04F10.l		; EF 10 4F B0
	sbc #$0416.w		; E9 16 04
	xce		; FB
	rts		; 60

	sta $FFFF00.l,X		; 9F 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	bpl -16.b		; 10 F0
	bpl -16.b		; 10 F0
	bmi -32.b		; 30 E0
	jsr $20E0.w		; 20 E0 20
	cpx #$E020.w		; E0 20 E0
	jsr $A060.w		; 20 60 A0
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $0E.b		; 00 0E
	ora #$080F.w		; 09 0F 08
	ora $05060C.l		; 0F 0C 06 05
	ora [$04.b]		; 07 04
	ora [$04.b]		; 07 04
	ora [$04.b]		; 07 04
	asl $05.b		; 06 05
	ora $000F00.l		; 0F 00 0F 00
	ora $000700.l		; 0F 00 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	sbc $23DC00.l,X		; FF 00 DC 23
	sbc [$08.b],Y		; F7 08
	lda [$58.b]		; A7 58
	pea $020B.w		; F4 0B 02
	sbc $4FB0.w,X		; FD B0 4F
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEEE.w,X		; FE EE FE
	tsx		; BA
	sbc $FF55.w,X		; FD 55 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	bpl -69.b		; 10 BB
	mvp $A9,$56		; 44 56 A9
	ora $FCFF0F.l		; 0F 0F FF FC
	sbc $B0BFF8.l,X		; FF F8 BF B0
	adc $E1FF70.l,X		; 7F 70 FF E1
	sbc $81FEC0.l,X		; FF C0 FE 81
	beq  15.b		; F0 0F
	brk $1F.b		; 00 1F
	cpy #$C03F.w		; C0 3F C0
	and $007F80.l,X		; 3F 80 7F 00
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $05FE.w,X		; FE FE 05
	sbc $F312.w,X		; FD 12 F3
	and $16EF.w		; 2D EF 16
	cmp $78BFAC.l,X		; DF AC BF 78
	adc $62FFB1.l,X		; 7F B1 FF 62
	ora $FE.b,S		; 03 FE
	ora [$FD.b]		; 07 FD
	ora $E83FF2.l,X		; 1F F2 3F E8
	and $80FFD0.l,X		; 3F D0 FF 80
	inc $FD40.w,X		; FE 40 FD
	bra  63.b		; 80 3F
	cmp $FFE0FF.l		; CF FF E0 FF
	sta ($FF.b,X)		; 81 FF
	asl A		; 0A
	sbc $AFFF55.l,X		; FF 55 FF AF
	inc $FF79.w,X		; FE 79 FF
	cpx #$30FF.w		; E0 FF 30
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00.b,X		; F5 00
	tax		; AA
	brk $50.b		; 00 50
	brk $87.b		; 00 87
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	cpx #$6310.w		; E0 10 63
	adc $FF.b,S		; 63 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FF.b		; 00 FF
	brk $7C.b		; 00 7C
	bra  -1.b		; 80 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	brk $07.b		; 00 07
	inc $FFFF.w,X		; FE FF FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	inc $BF11.w		; EE 11 BF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $44FFFF.l,X		; FF FF FF 44
	inc $FF11.w		; EE 11 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	inc $F810.w		; EE 10 F8
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FE.b		; 00 FE
	ora ($FB.b,X)		; 01 FB
	tsb $FF.b		; 04 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	asl $E1.b		; 06 E1
	adc ($24.b,X)		; 61 24
	sbc $00FF00.l,X		; FF 00 FF 00
	tax		; AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $E7.b		; 00 E7
	clc		; 18
	cmp $FF02.w,X		; DD 02 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $44FFFF.l,X		; FF FF FF 44
	sbc $00FE10.l		; EF 10 FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tax		; AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	cop $FF.b		; 02 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $04FFFF.l,X		; FF FF FF 04
	inc $0F01.w,X		; FE 01 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $0F.b		; 00 0F
	beq  -9.b		; F0 F7
	php		; 08
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $44FFFF.l,X		; FF FF FF 44
	bne  16.b		; D0 10
	adc $00FF7F.l,X		; 7F 7F FF 00
	sbc $00AA00.l,X		; FF 00 AA 00
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	tyx		; BB
	brk $DF.b		; 00 DF
	jsr $8040.w		; 20 40 80
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $44FFFF.l,X		; FF FF FF 44
	phd		; 0B
	clc		; 18
	sbc ($F1.b),Y		; F1 F1
	sbc $00FF00.l,X		; FF 00 FF 00
	tax		; AA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $FB.b		; 00 FB
	tsb $0F.b		; 04 0F
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $43FF0F.l,X		; FF 0F FF 43
	sbc $EAFFB4.l,X		; FF B4 FF EA
	sbc $17EF5D.l,X		; FF 5D EF 17
	lda $07FB81.l,X		; BF 81 FB 07
	sbc $00BF00.l,X		; FF 00 BF 00
	phk		; 4B
	brk $15.b		; 00 15
	brk $A2.b		; 00 A2
	brk $F8.b		; 00 F8
	brk $BE.b		; 00 BE
	rti		; 40

	ora $92EFE8.l,X		; 1F E8 EF 92
	sbc ($ED.b,S),Y		; F3 ED
	sbc $FE72.w,X		; FD 72 FE
	lda $4EFF.w,X		; BD FF 4E
	sbc $D3FFA7.l,X		; FF A7 FF D3
	beq  31.b		; F0 1F
	clv		; B8
	adc $F713FE.l		; 6F FE 13 F7
	ora $027F.w		; 0D 7F 02
	ldx $5F01.w,Y		; BE 01 5F
	brk $2F.b		; 00 2F
	brk $FC.b		; 00 FC
	bit $0FFF.w,X		; 3C FF 0F
	sbc $03FF07.l,X		; FF 07 FF 03
	sbc $A17F43.l,X		; FF 43 7F A1
	lda $A0DF40.l,X		; BF 40 DF A0
	ora $FC.b,S		; 03 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$E07F.w		; C0 7F E0
	lda $005FE0.l,X		; BF E0 5F 00
	brk $FF.b		; 00 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $DFBFBF.l,X		; 7F BF BF DF
	dec $DBDF.w		; CE DF DB
	sbc $00FF6D.l		; EF 6D FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $D12E80.l,X		; 7F 80 2E D1
	tsa		; 3B
	cpy $1D.b		; C4 1D
	sep #$00		; E2 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $BBFF.w		; EE FF BB
	sbc $00FF55.l,X		; FF 55 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $11EE00.l,X		; FF 00 EE 11
	tyx		; BB
	mvp $AA,$55		; 44 55 AA
	bra  -1.b		; 80 FF
	ldy $FF.b,X		; B4 FF
	jsr $1AFF.w		; 20 FF 1A
	sbc $FEFFB2.l,X		; FF B2 FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3D.b		; 00 3D
	lda $807C.w,Y		; B9 7C 80
	dec $FF.b		; C6 FF
	jsl $FFCDFF.l		; 22 FF CD FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $02C6FF.l,X		; FF FF C6 02
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	jsr $1AFF.w		; 20 FF 1A
	sbc $FEFFB2.l,X		; FF B2 FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc ($07.b,S),Y		; F3 07
	brk $C6.b		; 00 C6
	sbc $CDFF22.l,X		; FF 22 FF CD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0CFFFF.l,X		; FF FF FF 0C
	php		; 08
	sbc $00FFF8.l,X		; FF F8 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra -65.b		; 80 BF
	pea $203F.w		; F4 3F 20
	sbc $B2FF1A.l,X		; FF 1A FF B2
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C6FF20.l,X		; FF 20 FF C6
	sbc $CDFF22.l,X		; FF 22 FF CD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	rts		; 60

	cpy #$C040.w		; C0 40 C0
	rti		; 40

	cpy #$E040.w		; C0 40 E0
	rts		; 60

	adc $C03FBF.l,X		; 7F BF 3F C0
	sbc $00E0FF.l,X		; FF FF E0 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	ora ($AB.b,X)		; 01 AB
	ora $FB.b,S		; 03 FB
	ora $F3.b,S		; 03 F3
	cop $F7.b		; 02 F7
	ldx $F7.b		; A6 F7
	ror $F7.b,X		; 76 F7
	pei ($F7.b)		; D4 F7
	pea $F9A6.w		; F4 A6 F9
	mvn $04,$FB		; 54 FB 04
	xce		; FB
	tsb $A8F3.w		; 0C F3 A8
	eor [$78.b],Y		; 57 78
	sta [$D8.b]		; 87 D8
	and [$F8.b]		; 27 F8
	ora [$FD.b]		; 07 FD
	sta $FD.b,S		; 83 FD
	ora $FB.b,S		; 03 FB
	ora $FB.b		; 05 FB
	ora [$F7.b]		; 07 F7
	ora $EF0EF7.l		; 0F F7 0E EF
	asl $EF.b,X		; 16 EF
	asl $FC03.w,X		; 1E 03 FC
	ora [$FC.b]		; 07 FC
	ora $F807FA.l		; 0F FA 07 F8
	ora $F01FF0.l		; 0F F0 1F F0
	and $E03FE8.l,X		; 3F E8 3F E0
	sbc $8BFFC5.l,X		; FF C5 FF 8B
	sbc $0EFF97.l,X		; FF 97 FF 0E
	sbc $2CFF14.l,X		; FF 14 FF 2C
	inc $FE59.w,X		; FE 59 FE
	sec		; 38
	plx		; FA
	brk $F4.b		; 00 F4
	brk $E8.b		; 00 E8
	brk $F1.b		; 00 F1
	brk $EB.b		; 00 EB
	brk $D3.b		; 00 D3
	brk $A7.b		; 00 A7
	brk $C6.b		; 00 C6
	ora ($FE.b,X)		; 01 FE
	cpy #$82F8.w		; C0 F8 82
	sbc $03.b,S		; E3 03
	cmp $04.b,X		; D5 04
	plb		; AB
	php		; 08
	adc [$50.b],Y		; 77 50
	sta $A06FD0.l,X		; 9F D0 6F A0
	rol $7B01.w,X		; 3E 01 7B
	tsb $E4.b		; 04 E4
	clc		; 18
	stp		; DB
	jsr $40B7.w		; 20 B7 40
	adc $0BEF80.l		; 6F 80 EF 0B
	cmp $203F08.l,X		; DF 08 3F 20
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $05DE00.l,X		; FF 00 DE 05
	adc $05FF05.l,X		; 7F 05 FF 05
	sbc $05FE05.l,X		; FF 05 FE 05
	sbc $B85700.l,X		; FF 00 57 B8
	sbc $01DDA8.l,X		; FF A8 DD 01
	jsr ($FF00.w,X)		; FC 00 FF
	rti		; 40

	sbc $40FF00.l,X		; FF 00 FF 40
	sbc $05FF00.l,X		; FF 00 FF 05
	sbc $9CEA00.l,X		; FF 00 EA 9C
	sbc $94FF14.l,X		; FF 14 FF 94
	sbc $9CEB54.l,X		; FF 54 EB 9C
	sbc $18FF00.l,X		; FF 00 FF 18
	sbc $A4AB05.l,X		; FF 05 AB A4
	and [$30.b],Y		; 37 30
	tsb $C40D.w		; 0C 0D C4
	tsb $F2.b		; 04 F2
	cop $F9.b		; 02 F9
	ora ($FF.b,X)		; 01 FF
	eor ($FE.b,X)		; 41 FE
	brk $6F.b		; 00 6F
	bpl -57.b		; 10 C7
	php		; 08
	sbc $02.b,X		; F5 02
	plx		; FA
	ora ($FD.b,X)		; 01 FD
	brk $FE.b		; 00 FE
	brk $EA.b		; 00 EA
	stz $54FF.w		; 9C FF 54
	tyx		; BB
	mvp $00,$FF		; 44 FF 00
	inc $FF11.w		; EE 11 FF
	brk $3B.b		; 00 3B
	mvp $40,$7F		; 44 7F 40
	dec $FBD1.w		; CE D1 FB
	cpx $FF.b		; E4 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $1F.b		; 00 1F
	jsr $003F.w		; 20 3F 00
	lda ($40.b),Y		; B1 40
	sbc ($00.b,X)		; E1 00
	cpx $10.b		; E4 10
	cpy $02.b		; C4 02
	sta $60.b,S		; 83 60
	sta ($08.b,S),Y		; 93 08
	cmp [$48.b],Y		; D7 48
	cmp $08F744.l,X		; DF 44 F7 08
	sbc $03FD12.l		; EF 12 FD 03
	jmp.w [$F729]		; DC 29 F7
	tsb $44B3.w		; 0C B3 44
	sbc $00.b,X		; F5 00
	sbc $B800.w,Y		; F9 00 B8
	asl A		; 0A
	trb $A5.b		; 14 A5
	inc $02.b		; E6 02
	inx		; E8
	tsb $FF.b		; 04 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	ora ($F6.b,X)		; 01 F6
	eor ($5B.b,X)		; 41 5B
	pha		; 48
	sbc $18.b,X		; F5 18
	xba		; EB
	ora ($FC.b)		; 12 FC
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $BB.b		; 00 BB
	mvp $00,$FF		; 44 FF 00
	ror $7F11.w		; 6E 11 7F
	bra  59.b		; 80 3B
	cpy $3F.b		; C4 3F
	brk $6E.b		; 00 6E
	eor ($3B.b),Y		; 51 3B
	mvp $00,$FF		; 44 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $40BF00.l,X		; FF 00 BF 40
	lda $00FF40.l,X		; BF 40 FF 00
	lda $41BD40.l,X		; BF 40 BD 41
	xce		; FB
	cop $EB.b		; 02 EB
	bpl  -9.b		; 10 F7
	tsb $B7.b		; 04 B7
	mvp $04,$F7		; 44 F7 04
	sbc [$04.b],Y		; F7 04
	lda [$44.b],Y		; B7 44
	plx		; FA
	tsb $F5.b		; 04 F5
	php		; 08
	sbc [$08.b],Y		; F7 08
	xba		; EB
	bpl -21.b		; 10 EB
	bpl -21.b		; 10 EB
	bpl -21.b		; 10 EB
	bpl -21.b		; 10 EB
	bpl  -9.b		; 10 F7
	bpl  -5.b		; 10 FB
	php		; 08
	plx		; FA
	ora ($FD.b,X)		; 01 FD
	tsb $FD.b		; 04 FD
	tsb $FD.b		; 04 FD
	tsb $FD.b		; 04 FD
	tsb $FD.b		; 04 FD
	tsb $EB.b		; 04 EB
	tsb $F5.b		; 04 F5
	cop $FD.b		; 02 FD
	cop $FA.b		; 02 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($BB.b,X)		; 01 BB
	mvp $00,$FF		; 44 FF 00
	inc $FF11.w		; EE 11 FF
	brk $BB.b		; 00 BB
	mvp $00,$FF		; 44 FF 00
	inc $BB11.w		; EE 11 BB
	mvp $00,$FF		; 44 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40B100.l,X		; FF 00 B1 40
	sbc ($00.b,X)		; E1 00
	cpx $10.b		; E4 10
	rep #$04		; C2 04
	sta $60.b,S		; 83 60
	sta ($08.b,S),Y		; 93 08
	cmp [$48.b],Y		; D7 48
	cmp $08F744.l,X		; DF 44 F7 08
	sbc $03FD12.l		; EF 12 FD 03
	phx		; DA
	and #$0CF7.w		; 29 F7 0C
	lda ($44.b,S),Y		; B3 44
	sbc $00.b,X		; F5 00
	sbc $BB00.w,Y		; F9 00 BB
	mvp $00,$FF		; 44 FF 00
	ror $7F11.w		; 6E 11 7F
	bra  59.b		; 80 3B
	cpy $3F.b		; C4 3F
	brk $6E.b		; 00 6E
	bvc  59.b		; 50 3B
	eor $FF.b		; 45 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $BF.b		; 00 BF
	rti		; 40

	lda $01FE40.l,X		; BF 40 FE 01
	lda $45B940.l,X		; BF 40 B9 45
	sbc ($01.b),Y		; F1 01
	inx		; E8
	php		; 08
	iny		; C8
	php		; 08
	bcc  16.b		; 90 10
	ldy #$E1A0.w		; A0 A0 E1
	cpx #$C4DF.w		; E0 DF C4
	sbc $FA02.w,X		; FD 02 FA
	tsb $EF.b		; 04 EF
	bpl -41.b		; 10 D7
	jsr $40AF.w		; 20 AF 40
	cmp $001F00.l,X		; DF 00 1F 00
	rol $6019.w,X		; 3E 19 60
	rts		; 60

	sta $009B00.l		; 8F 00 9B 00
	tyx		; BB
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $F5.b		; 00 F5
	stx $8AFF.w		; 8E FF 8A
	sbc $EAFFAA.l,X		; FF AA FF EA
	sbc $2E.b,X		; F5 2E
	sbc $C0BF00.l,X		; FF 00 BF C0
	sbc $00FF01.l,X		; FF 01 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	tsa		; 3B
	sbc $3AF722.l,X		; FF 22 F7 3A
	sbc $3BF50A.l,X		; FF 0A F5 3B
	sbc $01FE00.l,X		; FF 00 FE 01
	tsa		; 3B
	bit $C7.b		; 24 C7
	bvc -11.b		; 50 F5
	bit $EA.b,X		; 34 EA
	asl A		; 0A
	sbc $05.b,X		; F5 05
	xce		; FB
	cop $FE.b		; 02 FE
	cop $FD.b		; 02 FD
	ora ($FF.b,X)		; 01 FF
	brk $37.b		; 00 37
	dey		; 88
	cmp #$F482.w		; C9 82 F4
	sta ($FA.b,X)		; 81 FA
	bra 125.b		; 80 7D
	bra  -3.b		; 80 FD
	brk $EA.b		; 00 EA
	stz $E9FF.w		; 9C FF E9
	sbc $3AFF74.l,X		; FF 74 FF 3A
	sbc $0A7F1C.l,X		; FF 1C 7F 0A
	lda $D66F8D.l,X		; BF 8D 6F D6
	sta $001747.l,X		; 9F 47 17 00
	phb		; 8B
	brk $C5.b		; 00 C5
	brk $E3.b		; 00 E3
	brk $75.b		; 00 75
	bra -78.b		; 80 B2
	rti		; 40

	sbc $D800.w,Y		; F9 00 D8
	jsr $90EF.w		; 20 EF 90
	sbc $E8F7D0.l		; EF D0 F7 E8
	sbc [$68.b],Y		; F7 68
	xce		; FB
	stz $FB.b,X		; 74 FB
	bit $FD.b,X		; 34 FD
	tsx		; BA
	sbc $901A.w,X		; FD 1A 90
	adc $FC2FD8.l		; 6F D8 2F FC
	ora [$E8.b],Y		; 17 E8
	ora [$F4.b],Y		; 17 F4
	phd		; 0B
	inc $0B.b,X		; F6 0B
	adc $05FB05.l,X		; 7F 05 FB 05
	sbc $60.b		; E5 60
	sbc ($70.b)		; F2 70
	sbc [$30.b],Y		; F7 30
	sbc [$30.b],Y		; F7 30
	xce		; FB
	inc A		; 1A
	xce		; FB
	tas		; 1B
	xce		; FB
	tas		; 1B
	xce		; FB
	phd		; 0B
	inc A		; 1A
	sbc [$0D.b]		; E7 0D
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$06.b],Y		; F7 06
	sbc $F807.w,Y		; F9 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	eor $00.b,X		; 55 00
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tax		; AA
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $FFAAFF.l,X		; FF FF AA FF
	eor $FF.b,X		; 55 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tax		; AA
	eor $77.b,X		; 55 77
	dey		; 88
	cmp $FF22.w,X		; DD 22 FF
	brk $AF.b		; 00 AF
	cpx $E8EF.w		; EC EF E8
	sbc $E8EFE8.l		; EF E8 EF E8
	lda $E8EFE8.l		; AF E8 EF E8
	cmp $D0DFD8.l,X		; DF D8 DF D0
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	cpx #$E11F.w		; E0 1F E1
	ora $DF3CDF.l,X		; 1F DF 3C DF
	bit $3CDF.w,X		; 3C DF 3C
	lda $79BF5C.l,X		; BF 5C BF 79
	lda $79BF78.l,X		; BF 78 BF 79
	adc $C03FB8.l,X		; 7F B8 3F C0
	and $C07FC0.l,X		; 3F C0 7F C0
	sbc $80FEA0.l,X		; FF A0 FE 80
	adc $807E80.l,X		; 7F 80 7E 80
	sbc $51FF40.l,X		; FF 40 FF 51
	sed		; F8
	lda $FE.b,X		; B5 FE
	adc ($FD.b,S),Y		; 73 FD
	ldx #$62F9.w		; A2 F9 62
	sbc $FEA2.w,Y		; F9 A2 FE
	stz $F6.b		; 64 F6
	cpx $AF.b		; E4 AF
	brk $4D.b		; 00 4D
	cop $8F.b		; 02 8F
	brk $5B.b		; 00 5B
	tsb $9B.b		; 04 9B
	tsb $5B.b		; 04 5B
	tsb $9F.b		; 04 9F
	brk $17.b		; 00 17
	php		; 08
	and $40DFA0.l,X		; 3F A0 DF 40
	sbc $407F40.l,X		; FF 40 7F 40
	lda $80FF80.l,X		; BF 80 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	cmp $0ABF09.l,X		; DF 09 BF 0A
	lda $00BF0B.l,X		; BF 0B BF 00
	adc $772A00.l,X		; 7F 00 2A 77
	adc $752F55.l,X		; 7F 55 2F 75
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $28FFA8.l,X		; 7F A8 FF 28
	cmp [$B8.b],Y		; D7 B8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $09FF00.l,X		; FF 00 FF 09
	sbc $1CFF11.l,X		; FF 11 FF 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $00FE01.l,X		; FF 01 FE 00
	inc $FE00.w,X		; FE 00 FE
	mvn $00,$FE		; 54 FE 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $90FF00.l,X		; FF 00 FF 90
	sbc $54FF54.l,X		; FF 54 FF 54
	sbc $00FF88.l,X		; FF 88 FF 00
	sbc $23FD00.l,X		; FF 00 FD 23
	sbc $2AFFA2.l,X		; FF A2 FF 2A
	inc $6BE1.w		; EE E1 6B
	stz $7E.b,X		; 74 7E
	adc ($33.b),Y		; 71 33
	bit $3E.b,X		; 34 3E
	and $1C9B.w,Y		; 39 9B 1C
	sta $9C1E.w,X		; 9D 1E 9C
	ora $9F100F.l,X		; 1F 0F 10 9F
	brk $9F.b		; 00 9F
	brk $C7.b		; 00 C7
	php		; 08
	cmp $806700.l		; CF 00 67 80
	sbc [$80.b]		; E7 80
	sbc [$80.b]		; E7 80
	cmp $029F46.l,X		; DF 46 9F 02
	sta $419F43.l,X		; 9F 43 9F 41
	sbc $608F31.l,X		; FF 31 8F 60
	ora $B647E9.l		; 0F E9 47 B6
	sed		; F8
	brk $BC.b		; 00 BC
	rti		; 40

	ldy $BE40.w,X		; BC 40 BE
	rti		; 40

	inc $DF00.w		; EE 00 DF
	jsr $10E6.w		; 20 E6 10
	inx		; E8
	ora ($FD.b),Y		; 11 FD
	ora ($FD.b,X)		; 01 FD
	ora ($F9.b,X)		; 01 F9
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	sta [$E0.b]		; 87 E0
	sty $F4.b		; 84 F4
	sbc $786C.w,X		; FD 6C 78
	inc $FE00.w,X		; FE 00 FE
	brk $7C.b		; 00 7C
	cop $7F.b		; 02 7F
	cop $3F.b		; 02 3F
	asl $37.b		; 06 37
	tsb $090A.w		; 0C 0A 09
	adc $83.b,X		; 75 83
	rol $3B11.w		; 2E 11 3B
	tsb $2E.b		; 04 2E
	eor ($3B.b),Y		; 51 3B
	tsb $6E.b		; 04 6E
	sta ($BB.b),Y		; 91 BB
	cpy $11.b		; C4 11
	inc $BB44.w		; EE 44 BB
	sbc $40BF40.l,X		; FF 40 BF 40
	lda $C07F40.l,X		; BF 40 7F C0
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$04.b],Y		; F7 04
	lda [$44.b],Y		; B7 44
	xba		; EB
	ora ($B9.b)		; 12 B9
	eor ($EC.b,X)		; 41 EC
	bpl -70.b		; 10 BA
	mvp $EE,$11		; 44 11 EE
	php		; 08
	bra -21.b		; 80 EB
	bpl -21.b		; 10 EB
	bpl -11.b		; 10 F5
	php		; 08
	inc $08.b,X		; F6 08
	xce		; FB
	tsb $FD.b		; 04 FD
	cop $FE.b		; 02 FE
	ora ($FF.b,X)		; 01 FF
	adc $FD04FD.l,X		; 7F FD 04 FD
	tsb $FA.b		; 04 FA
	ora #$10F3.w		; 09 F3 10
	inc $E1.b		; E6 E1
	phd		; 0B
	tsb $F1.b		; 04 F1
	asl $0001.w		; 0E 01 00
	plx		; FA
	ora ($FA.b,X)		; 01 FA
	ora ($F5.b,X)		; 01 F5
	cop $ED.b		; 02 ED
	cop $1B.b		; 02 1B
	tsb $F7.b		; 04 F7
	php		; 08
	ora $FFFFF0.l		; 0F F0 FF FF
	inc $BB11.w		; EE 11 BB
	mvp $11,$EE		; 44 EE 11
	tyx		; BB
	mvp $11,$EE		; 44 EE 11
	tyx		; BB
	mvp $EE,$11		; 44 11 EE
	mvp $FF,$3B		; 44 3B FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -3.b		; 80 FD
	ora ($FD.b,X)		; 01 FD
	ora ($F9.b,X)		; 01 F9
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	sta [$F0.b]		; 87 F0
	sty $F4.b		; 84 F4
	sbc $786C.w,X		; FD 6C 78
	inc $FE00.w,X		; FE 00 FE
	brk $7C.b		; 00 7C
	cop $7F.b		; 02 7F
	cop $3F.b		; 02 3F
	asl $37.b		; 06 37
	tsb $090A.w		; 0C 0A 09
	adc $83.b,X		; 75 83
	and $3811.w		; 2D 11 38
	asl $2F.b		; 06 2F
	eor ($3B.b,S),Y		; 53 3B
	ora $6D.b,S		; 03 6D
	sta $BE.b,X		; 95 BE
	dec $1E.b		; C6 1E
	inc $BE4E.w		; EE 4E BE
	jsr ($BF42.w,X)		; FC 42 BF
	rti		; 40

	ldx $7840.w,Y		; BE 40 78
	cpy $7E.b		; C4 7E
	bra 121.b		; 80 79
	bra  -7.b		; 80 F9
	brk $F9.b		; 00 F9
	brk $C7.b		; 00 C7
	cpy #$000F.w		; C0 0F 00
	sta [$80.b]		; 87 80
	ora $000F05.l,X		; 1F 05 0F 00
	ora $20FF00.l,X		; 1F 00 FF 20
	tsa		; 3B
	brk $3F.b		; 00 3F
	ora $FF.b		; 05 FF
	ora $057F.w		; 0D 7F 05
	sbc $00FF18.l,X		; FF 18 FF 00
	sbc $CEF500.l,X		; FF 00 F5 CE
	sbc $007F2A.l,X		; FF 2A 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	sbc $40FF40.l,X		; FF 40 FF 40
	lda $00FFC0.l,X		; BF C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	ora ($F6.b,X)		; 01 F6
	rti		; 40

	sbc [$00.b],Y		; F7 00
	sbc $00FF54.l,X		; FF 54 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	trb $FF.b		; 14 FF
	sty $FF.b,X		; 94 FF
	mvn $88,$FF		; 54 FF 88
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF3B.w,X		; FD 3B FF
	asl A		; 0A
	and $A7CB62.l,X		; 3F 62 CB A7
	cmp $95ABB3.l,X		; DF B3 AB 95
	adc [$51.b]		; 67 51
	sbc $55.b,S		; E3 55
	cmp $DB4B.w,X		; DD 4B DB
	eor #$00FD.w		; 49 FD 00
	jmp ($7C10.w)		; 6C 10 7C
	brk $76.b		; 00 76
	php		; 08
	ldx $08.b,Y		; B6 08
	ldx $08.b,Y		; B6 08
	rol $BA80.w,X		; 3E 80 BA
	sty $FE.b		; 84 FE
	sta $5DFE.w,X		; 9D FE 5D
	inc $FF8D.w,X		; FE 8D FF
	lsr $AEFF.w		; 4E FF AE
	sbc $A6FF4E.l,X		; FF 4E FF A6
	sbc $027DC7.l,X		; FF C7 7D 02
	lda $7D02.w,X		; BD 02 7D
	cop $BF.b		; 02 BF
	ora ($5E.b,X)		; 01 5E
	ora ($BE.b,X)		; 01 BE
	ora ($5E.b,X)		; 01 5E
	ora ($3F.b,X)		; 01 3F
	brk $FD.b		; 00 FD
	ora $0DFD.w		; 0D FD 0D
	sbc $7D0D.w,X		; FD 0D 7D
	sta $7D.b		; 85 7D
	sta $7D.b		; 85 7D
	sta $7E.b		; 85 7E
	stx $BE.b		; 86 BE
	lsr $03.b		; 46 03
	jsr ($FC03.w,X)		; FC 03 FC
	sta $FC.b,S		; 83 FC
	cmp $7C.b,S		; C3 7C
	cmp $7C.b,S		; C3 7C
	sta $7C.b,S		; 83 7C
	sta ($7E.b,X)		; 81 7E
	sbc ($BE.b,X)		; E1 BE
	tyx		; BB
	sbc $EEFFFF.l,X		; FF FF FF EE
	sbc $BBFFFF.l,X		; FF FF FF BB
	sbc $EEFFFF.l,X		; FF FF FF EE
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	sed		; F8
	jsr ($F0E3.w,X)		; FC E3 F0
	sbc $A0CFF0.l		; EF F0 CF A0
	cmp $E0DFE0.l,X		; DF E0 DF E0
	cmp $FFDFE0.l,X		; DF E0 DF FF
	ora [$FC.b]		; 07 FC
	ora $F01FF0.l,X		; 1F F0 1F F0
	and $E03FE0.l,X		; 3F E0 3F E0
	and $E03FE0.l,X		; 3F E0 3F E0
	and $0000FF.l,X		; 3F FF 00 00
	sbc $00F800.l,X		; FF 00 F8 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FF00F.l,X		; FF 0F F0 3F
	cpy #$807F.w		; C0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $3F.b		; 00 3F
	ora #$23F6.w		; 09 F6 23
	jmp.w [$FA05]		; DC 05 FA
	pld		; 2B
	pei ($17.b)		; D4 17
	inx		; E8
	sta $FFFF70.l		; 8F 70 FF FF
	brk $FF.b		; 00 FF
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $07F800.l,X		; FF 00 F8 07
	sbc $FC0000.l,X		; FF 00 00 FC
	sed		; F8
	ora [$DF.b]		; 07 DF
	jsr $44BB.w		; 20 BB 44
	eor $BC.b,S		; 43 BC
	sbc #$F016.w		; E9 16 F0
	ora $00FFFF.l		; 0F FF FF 00
	sbc $FF07F8.l,X		; FF F8 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	cpx #$00FF.w		; E0 FF 00
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc ($0D.b)		; F2 0D
	trb $EEE3.w		; 1C E3 EE
	ora ($FB.b),Y		; 11 FB
	tsb $FF.b		; 04 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	ora $FE03FC.l		; 0F FC 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FB.b		; 00 FB
	ora $0EC73F.l,X		; 1F 3F C7 0E
	sbc [$0F.b],Y		; F7 0F
	sbc ($07.b,S),Y		; F3 07
	xce		; FB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	sbc $F83FE0.l,X		; FF E0 3F F8
	ora $FC0FF8.l		; 0F F8 0F FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	sta $C0DFD0.l,X		; 9F D0 DF C0
	cmp $C1DEC0.l,X		; DF C0 DE C1
	stz $DEC1.w,X		; 9E C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($E1.b,X)		; C1 E1
	ora $E01FE1.l,X		; 1F E1 1F E0
	ora $E31EE1.l,X		; 1F E1 1E E3
	asl $1EE3.w,X		; 1E E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	adc $F07FF9.l,X		; 7F F9 7F F0
	adc $70FFF1.l,X		; 7F F1 FF 70
	sbc $70FF71.l,X		; FF 71 FF 70
	sbc $70FF71.l,X		; FF 71 FF 70
	inc $FF00.w,X		; FE 00 FF
	brk $FE.b		; 00 FE
	brk $7F.b		; 00 7F
	bra  -2.b		; 80 FE
	bra  -1.b		; 80 FF
	bra 126.b		; 80 7E
	bra 127.b		; 80 7F
	bra -57.b		; 80 C7
	adc $C3.b,X		; 75 C3
	sbc $CB.b,X		; F5 CB
	adc $C3.b,X		; 75 C3
	sbc $CF.b,X		; F5 CF
	adc [$C4.b],Y		; 77 C4
	inc $C0.b,X		; F6 C0
	ply		; 7A
	cmp ($FA.b,X)		; C1 FA
	ldx $08.b,Y		; B6 08
	rol $08.b,X		; 36 08
	ldx $08.b,Y		; B6 08
	rol $08.b,X		; 36 08
	ldx $08.b,Y		; B6 08
	and $04BB08.l,X		; 3F 08 BB 04
	tsa		; 3B
	tsb $7F.b		; 04 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	ldy #$80FF.w		; A0 FF 80
	sbc $77AA55.l,X		; FF 55 AA 77
	sbc $00FF00.l,X		; FF 00 FF 00
	plx		; FA
	eor [$7F.b]		; 47 7F
	eor $7F.b		; 45 7F
	eor $7F.b,X		; 55 7F
	adc $FF.b,X		; 75 FF
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $5F.b		; 00 5F
	cpx #$50EF.w		; E0 EF 50
	sbc $10EFB0.l,X		; FF B0 EF 10
	eor $E0EFF0.l,X		; 5F F0 EF E0
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $E31F02.l,X		; FF 02 1F E3
	eor $E01FE0.l,X		; 5F E0 1F E0
	sbc $001F03.l		; EF 03 1F 00
	sbc $02FF01.l,X		; FF 01 FF 02
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $8BFD3A.l,X		; FF 3A FD 8B
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $3B.b,X		; D5 3B
	sbc $3AD7AA.l,X		; FF AA D7 3A
	sbc $1F9C2A.l,X		; FF 2A 9C 1F
	sta $1C1E.w,X		; 9D 1E 1C
	ora $9D1F1C.l,X		; 1F 1C 1F 9D
	asl $1F9C.w,X		; 1E 9C 1F
	stz $9A1F.w		; 9C 1F 9A
	ora $6780E7.l,X		; 1F E7 80 67
	bra -25.b		; 80 E7
	brk $E7.b		; 00 E7
	brk $67.b		; 00 67
	bra -25.b		; 80 E7
	bra -25.b		; 80 E7
	bra -17.b		; 80 EF
	bra   6.b		; 80 06
	inc $EF12.w,X		; FE 12 EF
	mvp $00,$BB		; 44 BB 00
	sbc $06EE11.l,X		; FF 11 EE 06
	sed		; F8
	ora $62E0.w,Y		; 19 E0 62
	bit #$09F2.w		; 89 F2 09
	xce		; FB
	tsb $FE.b		; 04 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora [$FE.b]		; 07 FE
	ora $027FF4.l,X		; 1F F4 7F 02
	sbc ($C9.b,S),Y		; F3 C9
	asl A		; 0A
	lda ($A0.b,X)		; A1 A0
	asl $F980.w		; 0E 80 F9
	ora $09.b,S		; 03 09
	ora $FC1F.w,X		; 1D 1F FC
	adc [$F9.b],Y		; 77 F9
	sbc ($0E.b),Y		; F1 0E
	cmp [$3C.b]		; C7 3C
	cmp $7FFF7F.l		; CF 7F FF 7F
	sbc $A9FE.w,Y		; F9 FE A9
	inc $1F.b,X		; F6 1F
	cpx #$807F.w		; E0 7F 80
	brk $F0.b		; 00 F0
	and $0A.b,X		; 35 0A
	sbc $00.b		; E5 00
	asl $BB.b,X		; 16 BB
	and $63A6.w,X		; 3D A6 63
	sbc $817FC8.l,X		; FF C8 7F 81
	inc $0FFF.w,X		; FE FF 0F
	sbc $FF.b,X		; F5 FF
	plx		; FA
	sbc $24ED52.l,X		; FF 52 ED 24
	stp		; DB
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FB00.l,X		; FF 00 FB 00
	tsb $20.b		; 04 20
	brk $BF.b		; 00 BF
	txa		; 8A
	sbc [$F1.b],Y		; F7 F1
	sbc $3FFF03.l,X		; FF 03 FF 3F
	cpy #$10EF.w		; C0 EF 10
	sbc $FFDBFF.l,X		; FF FF DB FF
	rti		; 40

	sbc $FF7D82.l,X		; FF 82 7D FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $E3FB14.l,X		; FF 14 FB E3
	sbc $FFFFF0.l,X		; FF F0 FF FF
	brk $FD.b		; 00 FD
	cop $FF.b		; 02 FF
	sbc $00FFF7.l,X		; FF F7 FF 00
	sbc $FFEF10.l,X		; FF 10 EF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora $EB.b,S		; 03 EB
	trb $3A.b		; 14 3A
	eor ($5A.b,X)		; 41 5A
	sbc [$EF.b],Y		; F7 EF
	cmp $FF31.w,Y		; D9 31 FF
	tsb $FF.b		; 04 FF
	cpx #$FF1F.w		; E0 1F FF
	jsr ($FFEB.w,X)		; FC EB FF
	ldx $FF.b,Y		; B6 FF
	eor ($AD.b)		; 52 AD
	cmp #$FF36.w		; C9 36 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	inc $2F92.w,X		; FE 92 2F
	sed		; F8
	ora $1F.b,S		; 03 1F
	rti		; 40

	and ($72.b,X)		; 21 72
	ldy $EE.b		; A4 EE
	inc $7B8F.w,X		; FE 8F 7B
	sbc [$F2.b]		; E7 F2
	ora #$C4FB.w		; 09 FB C4
	inc $BFFD.w,X		; FE FD BF
	sbc $A5DF25.l,X		; FF 25 DF A5
	tad		; 5B
	inc $FF01.w,X		; FE 01 FF
	brk $02.b		; 00 02
	sbc ($C9.b,S),Y		; F3 C9
	asl A		; 0A
	ldy $AB.b		; A4 AB
	brk $7F.b		; 00 7F
	eor ($0E.b),Y		; 51 0E
	bmi   7.b		; 30 07
	bmi -63.b		; 30 C1
	bcc -28.b		; 90 E4
	sbc ($0E.b),Y		; F1 0E
	cmp [$3C.b]		; C7 3C
	cmp $80FF70.l		; CF 70 FF 80
	sbc $F87FE0.l,X		; FF E0 7F F8
	ora $7F8BFE.l,X		; 1F FE 8B 7F
	asl A		; 0A
	plx		; FA
	inc A		; 1A
	nop		; EA
	lsr A		; 4A
	tsx		; BA
	asl A		; 0A
	plx		; FA
	inc A		; 1A
	nop		; EA
	asl $0EFE.w		; 0E FE 0E
	inc $7E26.w,X		; FE 26 7E
	sbc $FD00.w,X		; FD 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $FD.b		; 00 FD
	bra  -5.b		; 80 FB
	jsr $00FF.w		; 20 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	ora $003F00.l,X		; 1F 00 3F 00
	and $3D00.w,X		; 3D 00 3D
	brk $FF.b		; 00 FF
	lsr A		; 4A
	sbc $EEF58A.l,X		; FF 8A F5 EE
	sbc $00FF00.l,X		; FF 00 FF 00
	plx		; FA
	and [$FF.b]		; 27 FF
	and $FF.b		; 25 FF
	and $FE.b		; 25 FE
	ora ($FD.b,X)		; 01 FD
	cop $FF.b		; 02 FF
	ora $FD.b,S		; 03 FD
	cop $FE.b		; 02 FE
	ora $FD.b,S		; 03 FD
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FD.b,X)		; 01 FD
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	cpy #$A0DF.w		; C0 DF A0
	cmp $20DF40.l,X		; DF 40 DF 20
	lda $C0DFE0.l,X		; BF E0 DF C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $C03F00.l,X		; FF 00 3F C0
	sta $C03FE0.l,X		; 9F E0 3F C0
	cmp $003F00.l,X		; DF 00 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc [$FD.b],Y		; 77 FD
	adc $FD.b,X		; 75 FD
	adc $FF.b,X		; 75 FF
	asl A		; 0A
	sbc $0BFD0A.l,X		; FF 0A FD 0B
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $55DF77.l,X		; FF 77 DF 55
	sbc $2BB875.l,X		; FF 75 B8 2B
	sbc ($2A.b),Y		; F1 2A
	pea $F02B.w		; F4 2B F0
	pld		; 2B
	sbc $C83A.w,X		; FD 3A C8
	tad		; 5B
	cpy #$E257.w		; C0 57 E2
	eor [$DB.b],Y		; 57 DB
	sty $DB.b		; 84 DB
	sty $5B.b		; 84 5B
	sty $DB.b		; 84 DB
	tsb $DB.b		; 04 DB
	tsb $BF.b		; 04 BF
	tsb $B7.b		; 04 B7
	php		; 08
	lda [$08.b],Y		; B7 08
	sbc $C7FFA7.l,X		; FF A7 FF C7
	sbc $C7FFA7.l,X		; FF A7 FF C7
	sbc $C3FFA3.l,X		; FF A3 FF C3
	sbc $C3FFA3.l,X		; FF A3 FF C3
	eor $003F00.l,X		; 5F 00 3F 00
	eor $003F00.l,X		; 5F 00 3F 00
	eor $003F00.l,X		; 5F 00 3F 00
	eor $003F00.l,X		; 5F 00 3F 00
	ldx $BE42.w,Y		; BE 42 BE
	.db $42, $BE		; 42 BE
	.db $42, $DE		; 42 DE
	jsr $A0DE.w		; 20 DE A0
	dec $DEA0.w,X		; DE A0 DE
	ldy #$A0DE.w		; A0 DE A0
	adc ($BE.b,X)		; 61 BE
	adc ($BE.b,X)		; 61 BE
	eor ($BE.b,X)		; 41 BE
	and ($DE.b,X)		; 21 DE
	sbc ($5E.b),Y		; F1 5E
	sbc ($5E.b),Y		; F1 5E
	lda ($5E.b),Y		; B1 5E
	lda ($5E.b,X)		; A1 5E
	ldy #$E0DF.w		; A0 DF E0
	cmp $E0DFE0.l,X		; DF E0 DF E0
	cmp $E0DFA0.l,X		; DF A0 DF E0
	cmp $E8DFE0.l,X		; DF E0 DF E8
	cmp [$E1.b],Y		; D7 E1
	rol $3CE3.w,X		; 3E E3 3C
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc $30EF30.l		; EF 30 EF 30
	sbc $FF0030.l		; EF 30 00 FF
	cop $FD.b		; 02 FD
	asl $F9.b		; 06 F9
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	jsr ($FC03.w,X)		; FC 03 FC
	ora $F8.b,S		; 03 F8
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	rts		; 60

	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $31FF31.l,X		; FF 31 FF 31
	sbc $31FF31.l,X		; FF 31 FF 31
	sbc $1FE031.l,X		; FF 31 E0 1F
	bra 127.b		; 80 7F
	and ($FF.b),Y		; 31 FF
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $06FF.w		; CE FF 06
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $F8078C.l,X		; FF 8C 07 F8
	ora ($FE.b,X)		; 01 FE
	sty $52FF.w		; 8C FF 52
	adc ($52.b,S),Y		; 73 52
	adc ($52.b,S),Y		; 73 52
	adc ($52.b,S),Y		; 73 52
	adc ($52.b,S),Y		; 73 52
	adc ($FE.b,S),Y		; 73 FE
	ora ($56.b,X)		; 01 56
	lda #$956A.w		; A9 6A 95
	cmp ($3E.b,X)		; C1 3E
	cpx $E013.w		; EC 13 E0
	ora $EC1FE0.l,X		; 1F E0 1F EC
	ora ($FF.b,S),Y		; 13 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	cpy #$C03F.w		; C0 3F C0
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora [$FB.b]		; 07 FB
	sta [$7B.b]		; 87 7B
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	sta [$7B.b]		; 87 7B
	asl $FB.b		; 06 FB
	sta [$7B.b]		; 87 7B
	sta [$7C.b]		; 87 7C
	cmp [$3C.b]		; C7 3C
	sbc [$1C.b]		; E7 1C
	sbc [$1C.b]		; E7 1C
	sbc [$1C.b]		; E7 1C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	stz $DEC1.w,X		; 9E C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($E1.b,X)		; C1 E1
	asl $1EE3.w,X		; 1E E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $70FF71.l,X		; FF 71 FF 70
	sbc $70FF71.l,X		; FF 71 FF 70
	sbc $70FF71.l,X		; FF 71 FF 70
	sbc $70FF71.l,X		; FF 71 FF 70
	ror $FF80.w,X		; 7E 80 FF
	bra  -2.b		; 80 FE
	bra  -1.b		; 80 FF
	bra 126.b		; 80 7E
	bra 127.b		; 80 7F
	bra  -2.b		; 80 FE
	bra  -1.b		; 80 FF
	bra -57.b		; 80 C7
	ror $FAC3.w,X		; 7E C3 FA
	cmp ($7C.b,X)		; C1 7C
	cmp $FF.b,S		; C3 FF
	cmp $FE.b,S		; C3 FE
	sta ($FF.b,X)		; 81 FF
	bra  -2.b		; 80 FE
	bra  -1.b		; 80 FF
	tyx		; BB
	tsb $3F.b		; 04 3F
	tsb $BD.b		; 04 BD
	cop $3D.b		; 02 3D
	cop $3C.b		; 02 3C
	ora $7E.b,S		; 03 7E
	ora ($7F.b,X)		; 01 7F
	ora ($7F.b,X)		; 01 7F
	brk $BF.b		; 00 BF
	sta $7F.b		; 85 7F
	rti		; 40

	adc $45DF40.l,X		; 7F 40 DF 45
	lda $20EF20.l,X		; BF 20 EF 20
	cmp $557710.l,X		; DF 10 77 55
	adc $00BF12.l,X		; 7F 12 BF 00
	lda $02BF00.l,X		; BF 00 BF 02
	cmp $05DF05.l,X		; DF 05 DF 05
	adc $826F85.l		; 6F 85 6F 82
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FF00.l,X		; FF 00 FF 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FF00.l,X		; FF 00 FF 08
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $33FF00.l,X		; FF 00 FF 33
	sbc $19FF08.l,X		; FF 08 FF 19
	sbc $33FF0A.l,X		; FF 0A FF 33
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $D5.b		; 00 D5
	tyx		; BB
	sbc $00FF00.l,X		; FF 00 FF 00
	eor [$B8.b],Y		; 57 B8
	sbc $A87FA8.l,X		; FF A8 7F A8
	sbc $BBD729.l,X		; FF 29 D7 BB
	clv		; B8
	and $343C39.l,X		; 3F 39 3C 34
	and ($68.b)		; 32 68
	adc ($21.b,X)		; 61 21
	ora [$1B.b],Y		; 17 1B
	ora $7F3E0F.l		; 0F 0F 3E 7F
	adc ($4F.b),Y		; 71 4F
	bra -49.b		; 80 CF
	ora $DD.b,S		; 03 DD
	ora $E11F9E.l		; 0F 9E 1F E1
	ror $F4EB.w,X		; 7E EB F4
	cmp $80FFF0.l		; CF F0 FF 80
	eor $0F.b,X		; 55 0F
	ora $7E5F5E.l		; 0F 5E 5F 7E
	adc $EFF0F0.l,X		; 7F F0 F0 EF
	inc $19.b,X		; F6 19
	adc $5792.w		; 6D 92 57
	tay		; A8
	sbc $FA.b		; E5 FA
	lda $A0DFF0.l		; AF F0 DF A0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E3FC00.l,X		; FF 00 FC E3
	sbc [$08.b],Y		; F7 08
	wai		; CB
	bit $3F.b,X		; 34 3F
	cpy #$00FF.w		; C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $09.b,X		; F6 09
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tsa		; 3B
	cpy $DF.b		; C4 DF
	jsr $00FF.w		; 20 FF 00
	sbc $CF02.w,X		; FD 02 CF
	bmi  56.b		; 30 38
	cmp [$E0.b]		; C7 E0
	asl $F000.w,X		; 1E 00 F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp [$38.b]		; C7 38
	and [$C8.b],Y		; 37 C8
	stp		; DB
	bit $00.b		; 24 00
	sbc $7F0000.l,X		; FF 00 00 7F
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
	ora [$3B.b]		; 07 3B
	cpy $F6.b		; C4 F6
	ora #$FF00.w		; 09 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08F700.l,X		; FF 00 F7 08
	inc $FF01.w,X		; FE 01 FF
	brk $2F.b		; 00 2F
	bne  -4.b		; D0 FC
	ora $07.b,S		; 03 07
	sed		; F8
	ora ($1E.b,X)		; 01 1E
	bra   3.b		; 80 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $04FBF1.l		; 0F F1 FB 04
	pea $FF0B.w		; F4 0B FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$00FF.w		; C0 FF 00
	tas		; 1B
	cpx $FF.b		; E4 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EA.b		; 00 EA
	jsr ($1EFC.w,X)		; FC FC 1E
	inc $3F1F.w,X		; FE 1F 3F
	cmp $C3.b,S		; C3 C3
	and $26DB.w,X		; 3D DB 26
	sbc $FA12.w		; ED 12 FA
	ora $E9.b		; 05 E9
	ora [$FD.b],Y		; 17 FD
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $05.b		; 00 05
	and $8F07.w,X		; 3D 07 8F
	sta $93.b,S		; 83 93
	bra -32.b		; 80 E0
	cpx #$F6FA.w		; E0 FA F6
	bit $5FBC.w,X		; 3C BC 5F
	lda $C0FE63.l,X		; BF 63 FE C0
	jmp ($EEF0.w,X)		; 7C F0 EE
	jmp ($7E9F.w,X)		; 7C 9F 7E
	sbc ($1F.b,X)		; E1 1F
	sbc $0B.b,X		; F5 0B
	jsr ($FF03.w,X)		; FC 03 FF
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	bra  15.b		; 80 0F
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $86.b		; 00 86
	bra  -1.b		; 80 FF
	and $FA.b		; 25 FA
	and [$FF.b]		; 27 FF
	brk $7F.b		; 00 7F
	brk $FD.b		; 00 FD
	sta $FF.b,S		; 83 FF
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	adc ($FF.b)		; 72 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	cop $FF.b		; 02 FF
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	eor $FF.b,X		; 55 FF
	adc [$FF.b],Y		; 77 FF
	brk $F2.b		; 00 F2
	tsb $BDFB.w		; 0C FB BD
	sbc $EEA9.w		; ED A9 EE
	tax		; AA
	plb		; AB
	nop		; EA
	sbc $77FF55.l,X		; FF 55 FF 77
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FEB8.w,X		; FE B8 FE
	tay		; A8
	sbc $FDA8.w,X		; FD A8 FD
	inx		; E8
	sei		; 78
	eor $A897B0.l,X		; 5F B0 97 A8
	sta $72BFF0.l		; 8F F0 BF 72
	ora $C83FE0.l,X		; 1F E0 3F C8
	ora $B7BF80.l,X		; 1F 80 BF B7
	php		; 08
	adc $106F08.l,X		; 7F 08 6F 10
	adc $30CF10.l		; 6F 10 CF 30
	cmp $60BF20.l,X		; DF 20 BF 60
	lda $A3FF40.l,X		; BF 40 FF A3
	sbc $A3FFC3.l,X		; FF C3 FF A3
	sbc $E3FFC3.l,X		; FF C3 FF E3
	adc $E3FFC3.l,X		; 7F C3 FF E3
	adc $005FC3.l,X		; 7F C3 5F 00
	and $005F00.l,X		; 3F 00 5F 00
	and $001F00.l,X		; 3F 00 1F 00
	lda $009F00.l,X		; BF 00 9F 00
	lda $A0DE00.l,X		; BF 00 DE A0
	dec $DEA0.w,X		; DE A0 DE
	ldy #$DE.b		; A0 DE
	ldy #$DE.b		; A0 DE
	ldy #$DE.b		; A0 DE
	ldy #$DE.b		; A0 DE
	ldy #$DE.b		; A0 DE
	ldy #$A1.b		; A0 A1
	lsr $5EF1.w,X		; 5E F1 5E
	sbc ($5E.b),Y		; F1 5E
	sbc ($5E.b),Y		; F1 5E
	lda ($5E.b,X)		; A1 5E
	lda ($5E.b,X)		; A1 5E
	sbc ($5E.b),Y		; F1 5E
	sbc ($5E.b),Y		; F1 5E
	tay		; A8
	cmp [$E0.b],Y		; D7 E0
	cmp $E0DFE0.l,X		; DF E0 DF E0
	cmp $E8DBA4.l,X		; DF A4 DB E8
	cmp [$E2.b]		; C7 E2
	cmp $DDE2.w,X		; DD E2 DD
	sbc $30EF30.l		; EF 30 EF 30
	sbc $30EF30.l		; EF 30 EF 30
	sbc $30EF30.l		; EF 30 EF 30
	sbc $38E730.l		; EF 30 E7 38
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	eor $F00FB0.l		; 4F B0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$F0.b]		; 07 F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $FF0FF0.l		; 0F F0 0F FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($4A.b),Y		; 31 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4E.w		; CE 4E CE
	cpx #$1F.b		; E0 1F
	cpx $1B.b		; E4 1B
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sbc ($0D.b)		; F2 0D
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	and [$DB.b]		; 27 DB
	ora [$E3.b],Y		; 17 E3
	lsr $BB.b		; 46 BB
	ora [$FB.b]		; 07 FB
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$0C.b],Y		; F7 0C
	sbc [$1C.b]		; E7 1C
	stz $DEC1.w,X		; 9E C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($E3.b,X)		; C1 E3
	asl $1EE1.w,X		; 1E E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $30FF71.l,X		; FF 71 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	inc $3F80.w,X		; FE 80 3F
	cpy #$3E.b		; C0 3E
	cpy #$BF.b		; C0 BF
	cpy #$BE.b		; C0 BE
	cpy #$BF.b		; C0 BF
	cpy #$3E.b		; C0 3E
	cpy #$3F.b		; C0 3F
	cpy #$80.b		; C0 80
	sbc $9FFF80.l,X		; FF 80 FF 9F
	sbc ($BF.b),Y		; F1 BF
	inc $D1F1.w		; EE F1 D1
	lda $D1.b,X		; B5 D1
	inc $EEA0.w		; EE A0 EE
	cpx #$7F.b		; E0 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $71.b		; 00 71
	brk $6E.b		; 00 6E
	brk $6E.b		; 00 6E
	brk $1F.b		; 00 1F
	rti		; 40

	eor $88FF00.l,X		; 5F 00 FF 88
	eor $EA3FC4.l,X		; 5F C4 3F EA
	lda [$E5.b]		; A7 E5
	cmp ($72.b,S),Y		; D3 72
	ldx $7E.b,Y		; B6 7E
	cmp $F7BF.w,X		; DD BF F7
	lda $9BC037.l,X		; BF 37 C0 9B
	rts		; 60

	cmp $F630.w		; CD 30 F6
	clc		; 18
	xce		; FB
	tsb $03FC.w		; 0C FC 03
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80BF00.l,X		; FF 00 BF 80
	beq 112.b		; F0 70
	sbc $001F8F.l		; EF 8F 1F 00
	adc $00FFFC.l,X		; 7F FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $008F00.l,X		; 7F 00 8F 00
	beq   0.b		; F0 00
	sta $1FE0E0.l,X		; 9F E0 E0 1F
	sbc $03FE00.l,X		; FF 00 FE 03
	sbc $F83E.w,Y		; F9 3E F8
	brk $03.b		; 00 03
	ora $FC.b,S		; 03 FC
	jsr ($02E3.w,X)		; FC E3 02
	inc $FF03.w,X		; FE 03 FF
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	asl $FF.b		; 06 FF
	brk $FC.b		; 00 FC
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	ora ($02.b,X)		; 01 02
	sbc $E191.w,X		; FD 91 E1
	brk $C3.b		; 00 C3
	ora ($1F.b,X)		; 01 1F
	lsr A		; 4A
	adc $1FFC87.l		; 6F 87 FC 1F
	plx		; FA
	ora $36DE.w		; 0D DE 36
	lda $66BF.w,Y		; B9 BF 66
	ldx $E1CD.w,Y		; BE CD E1
	asl $349B.w,X		; 1E 9B 34
	ora [$78.b]		; 07 78
	ora $F00FE0.l,X		; 1F E0 0F F0
	and $7FE4C0.l,X		; 3F C0 E4 7F
	sbc $CC73D0.l,X		; FF D0 73 CC
	xce		; FB
	bit $FF.b		; 24 FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -65.b		; 80 BF
	rti		; 40

	jsr ($FB03.w,X)		; FC 03 FB
	tsb $F0.b		; 04 F0
	ora $E11CE0.l		; 0F E0 1C E1
	ora ($07.b),Y		; 11 07
	sbc [$FF.b]		; E7 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $B8.b		; 00 B8
	eor [$E0.b]		; 47 E0
	trb $31C0.w		; 1C C0 31
	ora [$C7.b]		; 07 C7
	ora $771F.w,X		; 1D 1F 77
	adc $77FFDD.l,X		; 7F DD FF 77
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	bra  63.b		; 80 3F
	and $80007F.l,X		; 3F 7F 00 80
	bra -35.b		; 80 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $FFFF77.l,X		; FF 77 FF FF
	brk $C0.b		; 00 C0
	brk $7F.b		; 00 7F
	bra -128.b		; 80 80
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $DD.b		; 00 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $FFFF77.l,X		; FF 77 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $DD.b		; 00 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $FFFF77.l,X		; FF 77 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	sei		; 78
	ora ($0E.b,X)		; 01 0E
	bra  35.b		; 80 23
	bvs 120.b		; 70 78
	jmp.w [$77FE]		; DC FE 77
	sbc $77FFDD.l,X		; FF DD FF 77
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $30CF00.l,X		; FF 00 CF 30
	and [$C8.b],Y		; 37 C8
	ora $3C.b,S		; 03 3C
	ora ($8E.b,X)		; 01 8E
	cmp ($E2.b,X)		; C1 E2
	bvs  -7.b		; 70 F9
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bit #$7F.b		; 89 7F
	adc $0CF382.l,X		; 7F 82 F3 0C
	sbc [$09.b],Y		; F7 09
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C03F00.l,X		; FF 00 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $A0.b,S		; E3 A0
	cpy #$F0.b		; C0 F0
	ldy #$FE.b		; A0 FE
	pei ($3D.b)		; D4 3D
	sed		; F8
	cmp $EC17FE.l		; CF FE 17 EC
	asl $679B.w,X		; 1E 9B 67
	lda $DF5B.w,X		; BD 5B DF
	bit $1EE1.w		; 2C E1 1E
	inc $0B.b,X		; F6 0B
	sed		; F8
	ora [$FE.b]		; 07 FE
	ora ($FC.b,X)		; 01 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $83.b		; 00 83
	bra 112.b		; 80 70
	beq  15.b		; F0 0F
	cmp $1FD031.l		; CF 31 D0 1F
	bvs 127.b		; 70 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $0F.b		; 00 0F
	bra  48.b		; 80 30
	cpy #$0F.b		; C0 0F
	cpx #$10.b		; E0 10
	sbc $E807FB.l		; EF FB 07 E8
	ora $FF6FB2.l,X		; 1F B2 6F FF
	brk $0F.b		; 00 0F
	ora $FD.b,S		; 03 FD
	jsr ($00FE.w,X)		; FC FE 00
	sbc $03FF0F.l,X		; FF 0F FF 03
	plx		; FA
	ora [$EB.b]		; 07 EB
	trb $00FF.w		; 1C FF 00
	jsr ($0300.w,X)		; FC 00 03
	brk $FE.b		; 00 FE
	ora ($01.b,X)		; 01 01
	inc $BCBF.w,X		; FE BF BC
	ldx $FFC8.w,Y		; BE C8 FF
	ora $79.b,X		; 15 79
	adc #$F1.b		; 69 F1
	sta ($D7.b,S),Y		; 93 D7
	eor $773F1D.l,X		; 5F 1D 3F 77
	sbc $F6F8BB.l,X		; FF BB F8 F6
	ora ($EC.b,X)		; 01 EC
	ora $9B.b,S		; 03 9B
	asl $77.b		; 06 77
	tsb $30CF.w		; 0C CF 30
	adc $00FFC0.l,X		; 7F C0 FF 00
.ACCU 8
.INDEX 8
	sep #$7F		; E2 7F
	bra  -1.b		; 80 FF
	rol $7FE3.w,X		; 3E E3 7F
	cmp $A2E3.w,X		; DD E3 A2
	rtl		; 6B

	ldx #$DD.b		; A2 DD
	eor ($DD.b,X)		; 41 DD
	eor ($3F.b,X)		; 41 3F
	cpy #$7F.b		; C0 7F
	bra  -1.b		; 80 FF
	brk $E3.b		; 00 E3
	brk $DD.b		; 00 DD
	brk $DD.b		; 00 DD
	brk $BE.b		; 00 BE
	brk $BE.b		; 00 BE
	brk $7F.b		; 00 7F
	sbc $7F.b,S		; E3 7F
	cmp $7F.b,S		; C3 7F
	sbc $7F.b,S		; E3 7F
	cmp $FF.b,S		; C3 FF
	sbc $7F.b,S		; E3 7F
	cmp $FF.b,S		; C3 FF
	adc $FF.b,S		; 63 FF
	cmp $9F.b,S		; C3 9F
	brk $BF.b		; 00 BF
	brk $9F.b		; 00 9F
	brk $BF.b		; 00 BF
	brk $9F.b		; 00 9F
	brk $BF.b		; 00 BF
	brk $1F.b		; 00 1F
	bra -65.b		; 80 BF
	brk $DE.b		; 00 DE
	ldy #$DE.b		; A0 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $5EF1.w		; 20 F1 5E
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	ldy #$DF.b		; A0 DF
	sbc [$D0.b]		; E7 D0
	cpx $DB.b		; E4 DB
	cpx $DB.b		; E4 DB
	lda $DC.b,S		; A3 DC
.INDEX 8
	sep #$DD		; E2 DD
	sbc ($DC.b,X)		; E1 DC
	sbc ($DE.b,X)		; E1 DE
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc $3C.b,S		; E3 3C
	sbc $3C.b,S		; E3 3C
	sbc ($3E.b,X)		; E1 3E
	sbc ($3E.b,X)		; E1 3E
	ora $F00FF0.l		; 0F F0 0F F0
	ora $708FF0.l		; 0F F0 8F 70
	ora $58A7F0.l		; 0F F0 A7 58
	lda [$58.b]		; A7 58
	lda [$48.b],Y		; B7 48
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF31FF.l,X		; 3F FF 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($40.b),Y		; 31 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$4E.b		; C0 4E
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $0FF0.w		; CE F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sbc ($0E.b),Y		; F1 0E
	beq  15.b		; F0 0F
	cpx $1B.b		; E4 1B
	sbc ($1E.b,X)		; E1 1E
	inx		; E8
	ora [$0F.b],Y		; 17 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  31.b		; F0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$07.b		; E0 07
	xce		; FB
	sta [$6B.b]		; 87 6B
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	ora [$FB.b]		; 07 FB
	asl $BB.b		; 06 BB
	ora [$FB.b]		; 07 FB
	sbc [$1C.b]		; E7 1C
	sbc [$1C.b]		; E7 1C
	sbc [$1C.b]		; E7 1C
	sbc [$1C.b]		; E7 1C
	cmp [$3C.b]		; C7 3C
	cmp [$3C.b]		; C7 3C
	sta [$7C.b]		; 87 7C
	sta [$7C.b]		; 87 7C
	stz $DEC1.w,X		; 9E C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($DE.b,X)		; C1 DE
	cmp ($E3.b,X)		; C1 E3
	asl $1EE3.w,X		; 1E E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $30FF31.l,X		; FF 31 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	sbc $30FF31.l,X		; FF 31 FF 30
	ldx $BFC0.w,Y		; BE C0 BF
	cpy #$BE.b		; C0 BE
	cpy #$3F.b		; C0 3F
	cpy #$3E.b		; C0 3E
	cpy #$BF.b		; C0 BF
	cpy #$BE.b		; C0 BE
	cpy #$BF.b		; C0 BF
	cpy #$EE.b		; C0 EE
	cpx #$EE.b		; E0 EE
	ldy #$F5.b		; A0 F5
	sbc ($B1.b),Y		; F1 B1
	cmp ($FF.b),Y		; D1 FF
	inc $F5BF.w		; EE BF F5
	sbc $EEFF7F.l,X		; FF 7F FF EE
	eor $401F00.l,X		; 5F 00 1F 40
	ror $4E00.w		; 6E 00 4E
	jsr $1069.w		; 20 69 10
	adc [$08.b],Y		; 77 08
	bra   0.b		; 80 00
	ora ($00.b),Y		; 11 00
	cmp $F7BF.w,X		; DD BF F7
	lda $B77FDD.l,X		; BF DD 7F B7
	and [$DD.b],Y		; 37 DD
	cmp $B7B7.w,X		; DD B7 B7
	sbc $44FFFF.l,X		; FF FF FF 44
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $48FF00.l,X		; FF 00 FF 48
	sbc $48FF22.l,X		; FF 22 FF 48
	brk $00.b		; 00 00
	tyx		; BB
	brk $DF.b		; 00 DF
	sbc $DFFF77.l,X		; FF 77 FF DF
	sbc $DD7777.l,X		; FF 77 77 DD
	cmp $7777.w,X		; DD 77 77
	sbc $44FFFF.l,X		; FF FF FF 44
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $88FF00.l,X		; FF 00 FF 88
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	tyx		; BB
	brk $FC.b		; 00 FC
	sbc $F8FF74.l,X		; FF 74 FF F8
	inc $FF72.w,X		; FE 72 FF
	cmp $DF.b,S		; C3 DF
	adc [$7E.b]		; 67 7E
	cmp $7C97FE.l		; CF FE 97 7C
	jsr ($FC03.w,X)		; FC 03 FC
	ora $F8.b,S		; 03 F8
	ora [$F2.b]		; 07 F2
	ora $3CE3.w		; 0D E3 3C
	sbc [$98.b]		; E7 98
	ora $689730.l		; 0F 30 97 68
	rol $E971.w		; 2E 71 E9
	inc $FB.b,X		; F6 FB
	cpx $BF.b		; E4 BF
	cpy #$FF.b		; C0 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $3F.b		; 00 3F
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($F8.b,X)		; 01 F8
	ora [$F0.b]		; 07 F0
	tsb $39C1.w		; 0C C1 39
	cmp ($31.b,X)		; C1 31
	eor [$A7.b]		; 47 A7
	ora $841FCF.l		; 0F CF 1F 84
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF02.l,X		; FF 02 FF 00
	beq   0.b		; F0 00
	xce		; FB
	brk $0D.b		; 00 0D
	sta $5D3F37.l		; 8F 37 3F 5D
	adc $DD7F77.l,X		; 7F 77 7F DD
	cmp $7777.w,X		; DD 77 77
	sbc $44FFFF.l,X		; FF FF FF 44
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	tyx		; BB
	brk $DD.b		; 00 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $DD7777.l,X		; FF 77 77 DD
	cmp $7777.w,X		; DD 77 77
	sbc $44FFFF.l,X		; FF FF FF 44
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $88FF00.l,X		; FF 00 FF 88
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	tyx		; BB
	brk $DD.b		; 00 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $DD7F77.l,X		; FF 77 7F DD
	cmp $7777.w,X		; DD 77 77
	sbc $44FFFF.l,X		; FF FF FF 44
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	tyx		; BB
	brk $DD.b		; 00 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $DD7F77.l,X		; FF 77 7F DD
	cmp $7777.w,X		; DD 77 77
	sbc $04FFFF.l,X		; FF FF FF 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	xce		; FB
	brk $DC.b		; 00 DC
	jsr ($FF77.w,X)		; FC 77 FF
	cmp $77FF.w,X		; DD FF 77
	adc $77DDDD.l,X		; 7F DD DD 77
	adc [$FF.b],Y		; 77 FF
	sbc $FF44FF.l,X		; FF FF 44 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	jsl $0088FF.l		; 22 FF 88 00
	brk $BB.b		; 00 BB
	brk $1F.b		; 00 1F
	rts		; 60

	ora [$38.b]		; 07 38
	sta $8C.b,S		; 83 8C
	rts		; 60

	adc [$D0.b]		; 67 D0
	cmp ($70.b,S),Y		; D3 70
	adc ($FC.b),Y		; 71 FC
	jsr ($44FE.w,X)		; FC FE 44
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $88FF20.l,X		; FF 20 FF 88
	ora $00.b,S		; 03 00
	tyx		; BB
	brk $DD.b		; 00 DD
	and $E5.b,S		; 23 E5
	tas		; 1B
	sbc [$09.b],Y		; F7 09
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $C03F40.l,X		; BF 40 3F C0
	and $00FF40.l,X		; 3F 40 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $BF0D00.l,X		; FF 00 0D BF
	cmp [$FF.b]		; C7 FF
	cmp $DF.b		; C5 DF
	eor ($FF.b,S),Y		; 53 FF
	sbc ($3F.b),Y		; F1 3F
	lda $BC5F.w,Y		; B9 5F BC
	eor $0F0FFA.l,X		; 5F FA 0F 0F
	beq -49.b		; F0 CF
	bmi -57.b		; 30 C7
	sec		; 38
	cmp ($2C.b,S),Y		; D3 2C
	sbc ($0E.b),Y		; F1 0E
	sbc $FC06.w,Y		; F9 06 FC
	ora $FA.b,S		; 03 FA
	ora $DD.b		; 05 DD
	sbc $DDFF77.l,X		; FF 77 FF DD
	sbc $DD7777.l,X		; FF 77 77 DD
	cmp $7777.w,X		; DD 77 77
	sbc $C47FFF.l,X		; FF FF 7F C4
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $88FF00.l,X		; FF 00 FF 88
	sbc $88FF22.l,X		; FF 22 FF 88
	brk $00.b		; 00 00
	tsa		; 3B
	bra -35.b		; 80 DD
	eor ($DD.b,X)		; 41 DD
	eor ($EB.b,X)		; 41 EB
	lda $63.b,S		; A3 63
	jsl $7FDDFF.l		; 22 FF DD 7F
	rtl		; 6B

	sbc $45FFFF.l,X		; FF FF FF 45
	ldx $BE00.w,Y		; BE 00 BE
	brk $DD.b		; 00 DD
	brk $DC.b		; 00 DC
	sta ($E5.b,X)		; 81 E5
	cop $FB.b		; 02 FB
	sty $00.b		; 84 00
	brk $BA.b		; 00 BA
	brk $FF.b		; 00 FF
	sbc $FF.b,S		; E3 FF
	eor $FF.b,S		; 43 FF
	sbc $7F.b,S		; E3 7F
	cmp $FF.b,S		; C3 FF
	sbc $7F.b,S		; E3 7F
	cmp $FF.b,S		; C3 FF
	sbc $FF.b,S		; E3 FF
	sta $9F.b,S		; 83 9F
	brk $3F.b		; 00 3F
	bra -97.b		; 80 9F
	brk $BF.b		; 00 BF
	brk $9F.b		; 00 9F
	brk $BF.b		; 00 BF
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $DE.b		; 00 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	lda ($DC.b,X)		; A1 DC
	cpx #$D6.b		; E0 D6
	cpx #$D7.b		; E0 D7
	cpx #$DE.b		; E0 DE
	ldy #$DD.b		; A0 DD
	cpx #$DF.b		; E0 DF
	cpx #$DF.b		; E0 DF
	cpx #$D7.b		; E0 D7
	sbc ($3E.b,X)		; E1 3E
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	eor $28D7A0.l,X		; 5F A0 D7 28
	cmp $40BF20.l,X		; DF 20 BF 40
	eor $A45BB0.l		; 4F B0 5B A4
	and [$D8.b]		; 27 D8
	and $0A.b,X		; 35 0A
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $7E.b,S		; 03 7E
	sta ($7E.b,X)		; 81 7E
	sta ($3F.b,X)		; 81 3F
	cpy #$3F.b		; C0 3F
	cpy #$FF.b		; C0 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	brk $4A.b		; 00 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $CE4A.w		; CE 4A CE
	lsr A		; 4A
	dec $7FB1.w		; CE B1 7F
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $01FE8C.l,X		; FF 8C FE 01
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	eor ($73.b)		; 52 73
	sta $E6FE.w		; 8D FE E6
	ora $17E8.w,Y		; 19 E8 17
	cld		; D8
	and [$F4.b]		; 27 F4
	phd		; 0B
	sta ($6D.b)		; 92 6D
	sed		; F8
	ora [$A0.b]		; 07 A0
	eor $1F34C8.l,X		; 5F C8 34 1F
	cpx #$1F.b		; E0 1F
	cpx #$3F.b		; E0 3F
	cpy #$3F.b		; C0 3F
	cpy #$7E.b		; C0 7E
	sta ($7E.b,X)		; 81 7E
	sta ($FC.b,X)		; 81 FC
	ora $FC.b,S		; 03 FC
	ora $07.b,S		; 03 07
	tyx		; BB
	ora [$6B.b]		; 07 6B
	asl $EB.b		; 06 EB
	ora [$7B.b]		; 07 7B
	ora [$BB.b]		; 07 BB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	ora [$EB.b]		; 07 EB
	sta [$7C.b]		; 87 7C
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	dec $9EC1.w,X		; DE C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($E1.b,X)		; C1 E1
	asl $1EE1.w,X		; 1E E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	and $C03FC0.l,X		; 3F C0 3F C0
	lda $C0BFC0.l,X		; BF C0 BF C0
	lda $C03FC0.l,X		; BF C0 3F C0
	and $C0BFC0.l,X		; 3F C0 BF C0
	sbc $F1EE78.l,X		; FF 78 EE F1
	sbc $E4FB60.l,X		; FF 60 FB E4
	sbc $F1EE60.l,X		; FF 60 EE F1
	xce		; FB
	stz $EE.b		; 64 EE
	sbc ($87.b),Y		; F1 87
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	dey		; 88
	sed		; F8
	plp		; 28
	cmp [$31.b],Y		; D7 31
	ldx $ED62.w		; AE 62 ED
	bit $ED.b		; 24 ED
	bit $AD.b		; 24 AD
	stz $ED.b		; 64 ED
	bit $77.b		; 24 77
	brk $D0.b		; 00 D0
	ora $CD18E6.l		; 0F E6 18 CD
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi  -1.b		; 30 FF
	dey		; 88
	brk $00.b		; 00 00
	sbc $0100FF.l,X		; FF FF 00 01
	inc $FC01.w,X		; FE 01 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	sbc $FE0000.l,X		; FF 00 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FC.b,X)		; 01 FC
	ora $FC.b,S		; 03 FC
	ora $F8.b,S		; 03 F8
	ora [$9E.b]		; 07 9E
	sbc $D81F.w,Y		; F9 1F D8
	and $F42BB0.l,X		; 3F B0 2B F4
	tda		; 7B
	stz $7F.b		; 64 7F
	rts		; 60

	sbc $90EFE0.l,X		; FF E0 EF 90
	ora $E01F60.l,X		; 1F 60 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FA03.w,X)		; FC 03 FA
	tsb $F2.b		; 04 F2
	tsb $1CE0.w		; 0C E0 1C
	sbc ($18.b,X)		; E1 18
	sta $78.b,S		; 83 78
	lda $50.b,S		; A3 50
	and [$C0.b]		; 27 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $010611.l,X		; 3F 11 06 01
	xce		; FB
	beq  13.b		; F0 0D
	php		; 08
	sbc $FC04.w,X		; FD 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $EE.b		; 05 EE
	brk $87.b		; 00 87
	sei		; 78
	phd		; 0B
	tsb $F5.b		; 04 F5
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $FF.b		; 02 FF
	ora ($EE.b),Y		; 11 EE
	ora ($FE.b),Y		; 11 FE
	brk $B8.b		; 00 B8
	eor $FC.b		; 45 FC
	cop $E9.b		; 02 E9
	ora ($B8.b),Y		; 11 B8
	mvp $1E,$E2		; 44 E2 1E
	inc $FF00.w		; EE 00 FF
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	cop $FF.b		; 02 FF
	brk $FA.b		; 00 FA
	tsb $FF.b		; 04 FF
	ora ($F4.b,X)		; 01 F4
	ora #$FF.b		; 09 FF
	ora ($80.b),Y		; 11 80
	ora $9118.w,X		; 1D 18 91
	ror $40.b,X		; 76 40
	ldx #$94.b		; A2 94
	stz $DF00.w		; 9C 00 DF
	brk $7F.b		; 00 7F
	brk $EE.b		; 00 EE
	brk $9D.b		; 00 9D
	.db $62, $EF, $00		; 62 EF 00
	lda $496B08.l,X		; BF 08 6B 49
	ldx $DF63.w,Y		; BE 63 DF
	jsr $80FF.w		; 20 FF 80
	sbc $11EE11.l,X		; FF 11 EE 11
	adc $043B00.l,X		; 7F 00 3B 04
	ora $318E00.l,X		; 1F 00 8E 31
	phd		; 0B
	sty $0E.b		; 84 0E
	ora ($EE.b),Y		; 11 EE
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -65.b		; 80 BF
	rti		; 40

	cmp $00FF20.l,X		; DF 20 FF 00
	adc $C0BF50.l		; 6F 50 BF C0
	sbc $11EC11.l,X		; FF 11 EC 11
	beq   4.b		; F0 04
	lda $40.b,S		; A3 40
	dec $00.b		; C6 00
	dec $8F20.w		; CE 20 8F
	brk $87.b		; 00 87
	rti		; 40

	inc $FD00.w		; EE 00 FD
	cop $F7.b		; 02 F7
	php		; 08
	sbc $21DE10.l		; EF 10 DE 21
	inc $BF01.w,X		; FE 01 BF
	bvc -17.b		; 50 EF
	clc		; 18
	sbc $C10E11.l,X		; FF 11 0E C1
	cmp $48.b,S		; C3 48
	adc ($14.b),Y		; 71 14
	and $3C0A.w,Y		; 39 0A 3C
	tsb $78.b		; 04 78
	ora ($F2.b,X)		; 01 F2
	ora $EE.b,S		; 03 EE
	brk $CF.b		; 00 CF
	bmi -69.b		; 30 BB
	tsb $ED.b		; 04 ED
	.db $82, $B7, $C0		; 82 B7 C0
	tsx		; BA
	cmp ($FF.b,X)		; C1 FF
	sty $F9.b		; 84 F9
	tsb $11FF.w		; 0C FF 11
	inc $FF11.w		; EE 11 FF
	brk $BB.b		; 00 BB
	mvp $00,$FE		; 44 FE 00
	inc $B811.w		; EE 11 B8
	mvp $92,$6C		; 44 6C 92
	inc $FF00.w		; EE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FD.b		; 00 FD
	cop $7F.b		; 02 7F
	bra  -1.b		; 80 FF
	ora ($E0.b),Y		; 11 E0
	asl $2286.w		; 0E 86 22
	tas		; 1B
	brk $1B.b		; 00 1B
	brk $4E.b		; 00 4E
	brk $6E.b		; 00 6E
	brk $3F.b		; 00 3F
	brk $EE.b		; 00 EE
	brk $EE.b		; 00 EE
	ora ($BD.b),Y		; 11 BD
	rti		; 40

	adc $24FF84.l,X		; 7F 84 FF 24
	cmp $91EE31.l,X		; DF 31 EE 91
	adc $11FFC0.l,X		; 7F C0 FF 11
	ror $1F11.w		; 6E 11 1F
	rti		; 40

	phb		; 8B
	ldy $4F.b		; A4 4F
	bvc 102.b		; 50 66
	and ($C3.b,X)		; 21 C3
	tsb $1DF2.w		; 0C F2 1D
	inc $7F00.w		; EE 00 7F
	bra -33.b		; 80 DF
	jsr $106F.w		; 20 6F 10
	lda $885780.l,X		; BF 80 57 88
	sbc $04EB20.l,X		; FF 20 EB 04
	jsr ($FB10.w,X)		; FC 10 FB
	ora ($F6.b,X)		; 01 F6
	cop $B7.b		; 02 B7
	mvp $04,$F7		; 44 F7 04
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	cpx $FA03.w		; EC 03 FA
	tsb $F5.b		; 04 F5
	php		; 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	ora $889730.l		; 0F 30 97 88
	ora ($0C.b,S),Y		; 13 0C
	cmp ($0E.b,X)		; C1 0E
	sbc ($06.b,X)		; E1 06
	beq   7.b		; F0 07
	sbc ($02.b),Y		; F1 02
	sbc $FF00.w,Y		; F9 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DE.b		; 00 DE
	and [$FE.b]		; 27 FE
	asl $FF.b		; 06 FF
	ora $F5.b,S		; 03 F5
	phd		; 0B
	sbc [$09.b],Y		; F7 09
	adc $817F81.l,X		; 7F 81 7F 81
	and $FEC2.w,X		; 3D C2 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	bra  63.b		; 80 3F
	sbc $1F4000.l,X		; FF 00 40 1F
	cpx #$9F.b		; E0 9F
	ldy #$8F.b		; A0 8F
	bra -49.b		; 80 CF
	cpy #$C7.b		; C0 C7
	rti		; 40

	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	and $E01FC0.l,X		; 3F C0 1F E0
	sta $708F60.l,X		; 9F 60 8F 70
	cmp $38C730.l		; CF 30 C7 38
	ora $02.b,S		; 03 02
	sbc $0EF1.w,X		; FD F1 0E
	php		; 08
	inc $04.b,X		; F6 04
	inc $04.b,X		; F6 04
	inc $04.b,X		; F6 04
	inc $04.b,X		; F6 04
	inc $04.b,X		; F6 04
	ora ($FE.b,X)		; 01 FE
	tsb $F603.w		; 0C 03 F6
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FF.b,X)		; 01 FF
	sta ($6F.b),Y		; 91 6F
	sta ($FF.b),Y		; 91 FF
	sta ($BB.b,X)		; 81 BB
	cmp $FF.b		; C5 FF
	sta ($EF.b,X)		; 81 EF
	sta ($BB.b),Y		; 91 BB
	cmp $EF.b		; C5 EF
	sta ($6E.b),Y		; 91 6E
	brk $FE.b		; 00 FE
	brk $7E.b		; 00 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra  -1.b		; 80 FF
	cmp $FF.b,S		; C3 FF
	sta $FF.b,S		; 83 FF
	cmp $FF.b,S		; C3 FF
	sta $FF.b,S		; 83 FF
	cmp $FF.b,S		; C3 FF
	sta $FF.b,S		; 83 FF
	cmp $FF.b,S		; C3 FF
	sta $3F.b,S		; 83 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $DE.b		; 00 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	adc ($DE.b),Y		; 71 DE
	inc $BBFF.w		; EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cmp $E0DDA0.l,X		; DF A0 DD E0
	cmp $E0DFA0.l,X		; DF A0 DF E0
	cmp $F0DFA0.l,X		; DF A0 DF F0
	cmp $E0EFB0.l		; CF B0 EF E0
	and $E03FE0.l,X		; 3F E0 3F E0
	and $E03FE0.l,X		; 3F E0 3F E0
	and $F03FE0.l,X		; 3F E0 3F F0
	and $1E1FF0.l,X		; 3F F0 1F 1E
	sbc ($19.b,X)		; E1 19
	ldx $0F.b		; A6 0F
	cpx #$04.b		; E0 04
	xce		; FB
	ora $DC.b,S		; 03 DC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $F807F0.l		; 0F F0 07 F8
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $A05F00.l,X		; FF 00 5F A0
	adc $659A80.l,X		; 7F 80 9A 65
	sec		; 38
	sta [$00.b]		; 87 00
	sbc [$C0.b],Y		; F7 C0
	and $FF0FF0.l,X		; 3F F0 0F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	ora $1E.b		; 05 1E
	sbc ($A8.b,X)		; E1 A8
	eor [$00.b],Y		; 57 00
	sbc $EF00.w,X		; FD 00 EF
	ora $FC.b,S		; 03 FC
	ora $00FFF0.l		; 0F F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FC00.l,X		; FF 00 FC 03
	brk $FF.b		; 00 FF
	sei		; 78
	sta [$90.b]		; 87 90
	adc $9760.w		; 6D 60 97
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$F0.b]		; 07 F0
	ora $C01FE0.l		; 0F E0 1F C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $06FF00.l,X		; FF 00 FF 06
	xce		; FB
	ora [$BB.b]		; 07 BB
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	asl $FB.b		; 06 FB
	ora [$FB.b]		; 07 FB
	asl $0BF3.w		; 0E F3 0B
	sbc [$07.b],Y		; F7 07
	jsr ($FC07.w,X)		; FC 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora $F80FFC.l		; 0F FC 0F F8
	dec $9EC1.w,X		; DE C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($E3.b,X)		; C1 E3
	asl $1EE3.w,X		; 1E E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($1E.b,X)		; E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	sbc $30FF30.l,X		; FF 30 FF 30
	lda $C0BFC0.l,X		; BF C0 BF C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C0BFC0.l,X		; 3F C0 BF C0
	lda $C0BFC0.l,X		; BF C0 BF C0
	xce		; FB
	stz $EE.b		; 64 EE
	sbc ($FB.b),Y		; F1 FB
	stz $EE.b		; 64 EE
	adc ($FB.b),Y		; 71 FB
	cpx $EE.b		; E4 EE
	adc ($FB.b),Y		; 71 FB
	cpx $EE.b		; E4 EE
	adc ($9F.b),Y		; 71 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $AD.b		; 00 AD
	stz $ED.b		; 64 ED
	bit $AD.b		; 24 AD
	stz $ED.b		; 64 ED
	bit $AD.b		; 24 AD
	stz $ED.b		; 64 ED
	bit $AD.b		; 24 AD
	stz $ED.b		; 64 ED
	bit $CB.b		; 24 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi  -7.b		; 30 F9
	ora ($F1.b,X)		; 01 F1
	ora ($F3.b,X)		; 01 F3
	ora $E3.b,S		; 03 E3
	cop $E7.b		; 02 E7
	asl $EF.b		; 06 EF
	asl $06C7.w		; 0E C7 06
	cmp $06F90C.l		; CF 0C F9 06
	sbc ($0E.b),Y		; F1 0E
	sbc ($0C.b,S),Y		; F3 0C
	sbc $1C.b,S		; E3 1C
	sbc [$18.b]		; E7 18
	sbc $38C710.l		; EF 10 C7 38
	cmp $91EE30.l		; CF 30 EE 91
	plx		; FA
	sta $BC.b		; 85 BC
	eor $3E.b,S		; 43 3E
	cmp ($36.b,X)		; C1 36
	cmp #$F4.b		; C9 F4
	phd		; 0B
	pea $EC0B.w		; F4 0B EC
	ora ($FF.b,S),Y		; 13 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	cpx #$CF.b		; E0 CF
	brk $5F.b		; 00 5F
	bra  31.b		; 80 1F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $F9.b		; 05 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $B3.b		; 02 B3
	.db $42, $EB		; 42 EB
	tas		; 1B
	lda ($4B.b,S),Y		; B3 4B
	sbc $12.b,S		; E3 12
	lda ($42.b,S),Y		; B3 42
	sbc $1A.b,S		; E3 1A
	lda ($42.b,S),Y		; B3 42
	xba		; EB
	asl $F5.b,X		; 16 F5
	php		; 08
	jsr ($F400.w,X)		; FC 00 F4
	php		; 08
	sbc $F508.w,X		; FD 08 F5
	php		; 08
	sbc $08.b,X		; F5 08
	sbc $F90C.w,Y		; F9 0C F9
	tsb $7F.b		; 04 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	rti		; 40

	sbc $20FF60.l,X		; FF 60 FF 20
	sbc $807F30.l,X		; FF 30 7F 80
	lda $003F00.l,X		; BF 00 3F 00
	ora $009F00.l,X		; 1F 00 9F 00
	sta $00CF00.l		; 8F 00 CF 00
	cmp [$00.b]		; C7 00
	adc $04.b,S		; 63 04
	inc $EB09.w		; EE 09 EB
	tsb $09EE.w		; 0C EE 09
	sbc $04.b,S		; E3 04
	inc $09.b		; E6 09
	lda $0C.b,S		; A3 0C
	ldx $7771.w,Y		; BE 71 77
	dey		; 88
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08F700.l,X		; FF 00 F7 08
	sbc [$08.b],Y		; F7 08
	lda [$48.b],Y		; B7 48
	cmp $003340.l,X		; DF 40 33 00
	lda $88BF80.l,X		; BF 80 BF 88
	lda $043F8C.l,X		; BF 8C 3F 04
	and $823F86.l,X		; 3F 86 3F 82
	sbc $8C7763.l,X		; FF 63 77 8C
	xce		; FB
	brk $F3.b		; 00 F3
	brk $F1.b		; 00 F1
	brk $79.b		; 00 79
	bra 120.b		; 80 78
	bra 124.b		; 80 7C
	bra -36.b		; 80 DC
	brk $E6.b		; 00 E6
	cop $EE.b		; 02 EE
	cop $FE.b		; 02 FE
	cop $FA.b		; 02 FA
	cop $FA.b		; 02 FA
	cop $F2.b		; 02 F2
	cop $F0.b		; 02 F0
	asl $E0.b		; 06 E0
	ora $ED18F5.l		; 0F F5 18 ED
	bpl  -3.b		; 10 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $F9.b		; 00 F9
	tsb $FE.b		; 04 FE
	ora $7E.b		; 05 7E
	ora $4039.w		; 0D 39 40
	sbc $3D94.w		; ED 94 3D
	cpy $6D.b		; C4 6D
	trb $39.b		; 14 39
	rti		; 40

	adc #$94.b		; 69 94
	and $EF44.w,Y		; 39 44 EF
	ora ($7B.b,S),Y		; 13 7B
	sty $FF.b		; 84 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	bra 123.b		; 80 7B
	sty $7B.b		; 84 7B
	sty $FB.b		; 84 FB
	sty $FE.b		; 84 FE
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	sbc $20FF60.l,X		; FF 60 FF 20
	sbc $10FF30.l,X		; FF 30 FF 10
	sbc $40BF18.l,X		; FF 18 BF 40
	cmp $009F00.l,X		; DF 00 9F 00
	sta $00CF00.l		; 8F 00 CF 00
	cmp [$00.b]		; C7 00
	sbc [$00.b]		; E7 00
	sbc $00.b,S		; E3 00
	sbc ($10.b,S),Y		; F3 10
	inc $05.b,X		; F6 05
	sbc ($14.b,S),Y		; F3 14
	cmp ($11.b)		; D2 11
	sta ($10.b,S),Y		; 93 10
	sta ($15.b)		; 92 15
	ora $30.b,S		; 03 30
	asl $79.b		; 06 79
	xba		; EB
	tsb $FF.b		; 04 FF
	brk $EB.b		; 00 EB
	tsb $EF.b		; 04 EF
	tsb $EB.b		; 04 EB
	tsb $CB.b		; 04 CB
	bit $F7.b		; 24 F7
	bit $68F7.w		; 2C F7 68
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	jsr ($FC01.w,X)		; FC 01 FC
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	brk $1D.b		; 00 1D
.INDEX 8
	sep #$D7		; E2 D7
	plp		; 28
	sta $601F70.l		; 8F 70 1F 60
	tas		; 1B
	stz $0B.b		; 64 0B
	stz $0B.b,X		; 74 0B
	bit $8D.b,X		; 34 8D
	and ($FF.b)		; 32 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	rts		; 60

	sbc $60.b,S		; E3 60
	adc ($B0.b,S),Y		; 73 B0
	and ($D0.b),Y		; 31 D0
	and $FDD8.w,Y		; 39 D8 FD
	trb $18F8.w		; 1C F8 18
	jsr ($E70C.w,X)		; FC 0C E7
	clc		; 18
	sbc $1C.b,S		; E3 1C
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($0E.b),Y		; F1 0E
	sbc $FD06.w,Y		; F9 06 FD
	cop $F8.b		; 02 F8
	ora [$FC.b]		; 07 FC
	ora $F6.b,S		; 03 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $FA.b		; 04 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($BB.b,X)		; 01 BB
	cmp $EF.b		; C5 EF
	sta ($BB.b),Y		; 91 BB
	cmp $EF.b		; C5 EF
	sta ($BB.b),Y		; 91 BB
	cmp $EF.b		; C5 EF
	sta ($BB.b),Y		; 91 BB
	cmp $EF.b		; C5 EF
	sta ($7E.b),Y		; 91 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra -34.b		; 80 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	and ($DE.b,X)		; 21 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	jsr ($BFE3.w,X)		; FC E3 BF
	sed		; F8
	inc $BBFF.w		; EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $FF1FFC.l,X		; FF FC 1F FF
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $EE00FF.l,X		; FF FF 00 EE
	sbc $EEFFBB.l,X		; FF BB FF EE
	sbc $EEFFBB.l,X		; FF BB FF EE
	sbc $00FFBB.l,X		; FF BB FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cmp $EE00FF.l,X		; DF FF 00 EE
	sbc $EEFFBB.l,X		; FF BB FF EE
	sbc $EEFFBB.l,X		; FF BB FF EE
	sbc $00FFBB.l,X		; FF BB FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	xce		; FB
	sbc $FFEE00.l,X		; FF 00 EE FF
	tyx		; BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3E.b		; 00 3E
	cmp [$FB.b]		; C7 FB
	ora $BBFFEE.l,X		; 1F EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $FFF83F.l,X		; FF 3F F8 FF
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DE.b		; 00 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($DE.b,X)		; C1 DE
	cmp ($9E.b,X)		; C1 9E
	cmp ($4E.b,X)		; C1 4E
	cmp ($8E.b),Y		; D1 8E
	eor ($E1.b),Y		; 51 E1
	asl $1EE1.w,X		; 1E E1 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc $1E.b,S		; E3 1E
	sbc ($1E.b,X)		; E1 1E
	sbc ($0E.b),Y		; F1 0E
	sbc ($0E.b,S),Y		; F3 0E
	sbc $38FF30.l,X		; FF 30 FF 38
	sbc $38FF38.l,X		; FF 38 FF 38
	sbc $38FF38.l,X		; FF 38 FF 38
	sbc $38FF38.l,X		; FF 38 FF 38
	and $C03FC0.l,X		; 3F C0 3F C0
	lda $C0BFC0.l,X		; BF C0 BF C0
	lda $C03FC0.l,X		; BF C0 3F C0
	and $C0BFC0.l,X		; 3F C0 BF C0
	xce		; FB
	cpx $EE.b		; E4 EE
	adc ($FB.b),Y		; 71 FB
	cpx $EE.b		; E4 EE
	adc ($F1.b),Y		; 71 F1
	inc $7BF4.w		; EE F4 7B
	sbc ($BE.b),Y		; F1 BE
	pea $1F7B.w		; F4 7B 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $8F.b		; 00 8F
	brk $4F.b		; 00 4F
	brk $8F.b		; 00 8F
	brk $AD.b		; 00 AD
	stz $CD.b		; 64 CD
	tsb $8D.b		; 04 8D
	mvp $04,$CD		; 44 CD 04
	and $6DE4.w		; 2D E4 6D
	ldy $0D.b		; A4 0D
	cpy $4D.b		; C4 4D
	sty $CB.b		; 84 CB
	bmi -21.b		; 30 EB
	bmi -21.b		; 30 EB
	bmi -21.b		; 30 EB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -21.b		; 30 EB
	bmi -21.b		; 30 EB
	bmi -51.b		; 30 CD
	asl $1E99.w		; 0E 99 1E
	txs		; 9A
	ora $199E.w,X		; 1D 9E 19
	ldx $1439.w,Y		; BE 39 14
	tas		; 1B
	and [$38.b],Y		; 37 38
	and $30CF30.l,X		; 3F 30 CF 30
	sta $609F60.l,X		; 9F 60 9F 60
	sta $40BF60.l,X		; 9F 60 BF 40
	ora $C03FE0.l,X		; 1F E0 3F C0
	and $12ECC0.l,X		; 3F C0 EC 12
	rts		; 60

	stz $0EF0.w,X		; 9E F0 0E
	beq  14.b		; F0 0E
	bne  44.b		; D0 2C
	sbc ($1C.b,X)		; E1 1C
	cmp $C124.w,Y		; D9 24 C1
	bit $00FF.w,X		; 3C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $44BD00.l,X		; FF 00 BD 44
	sbc $B813.w		; ED 13 B8
	mvp $11,$EF		; 44 EF 11
	ora ($EE.b),Y		; 11 EE
	mvp $11,$BB		; 44 BB 11
	inc $BB44.w		; EE 44 BB
	xce		; FB
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl  -2.b		; 10 FE
	and $81FBD8.l,X		; 3F D8 FB 81
	lda $434D.w,Y		; B9 4D 43
	mvn $11,$97		; 54 97 11
	inc $BB44.w		; EE 44 BB
	sbc [$00.b]		; E7 00
	cmp ($01.b,X)		; C1 01
	dec A		; 3A
	ora [$39.b]		; 07 39
	lsr $8F.b		; 46 8F
	beq -51.b		; F0 CD
	dec A		; 3A
	sbc $00FF00.l,X		; FF 00 FF 00
	phd		; 0B
	pei ($4E.b)		; D4 4E
	cmp ($9B.b),Y		; D1 9B
	ldy $AE.b		; A4 AE
	cmp ($11.b),Y		; D1 11
	inc $B844.w		; EE 44 B8
	ora ($E1.b,X)		; 01 E1
	ora $D0EF0F.l		; 0F 0F EF D0
	sta $205FA0.l,X		; 9F A0 5F 20
	and $807F40.l,X		; 3F 40 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $419F00.l,X		; FF 00 9F 41
	cmp $6C8E13.l,X		; DF 13 8E 6C
	cpx $031C.w		; EC 1C 03
	sta $7F.b,S		; 83 7F
	adc $44C0C0.l,X		; 7F C0 C0 44
	mvp $40,$BE		; 44 BE 40
	cpy $D020.w		; CC 20 D0
	and $E7.b,S		; 23 E7
	bpl  -1.b		; 10 FF
	brk $FF.b		; 00 FF
	brk $D1.b		; 00 D1
	and $C1BB67.l,X		; 3F 67 BB C1
	ora #$E8.b		; 09 E8
	xce		; FB
	cpy #$C0.b		; C0 C0
	and $FEFE3F.l,X		; 3F 3F FE FE
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	ror $0519.w		; 6E 19 05
	ora ($FF.b)		; 12 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($A1.b,X)		; 01 A1
	sbc $FFF71B.l,X		; FF 1B F7 FF
	sbc $EE46B8.l,X		; FF B8 46 EE
	bpl   0.b		; 10 00
	brk $FE.b		; 00 FE
	sbc $82B8B8.l,X		; FF B8 B8 82
	.db $82, $40, $40		; 82 40 40
	php		; 08
	php		; 08
	sbc $FE02.w,X		; FD 02 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	eor [$A6.b]		; 47 A6
	adc $BFDE.w,X		; 7D DE BF
	stz $FEF7.w,X		; 9E F7 FE
	php		; 08
	sbc $07169F.l,X		; FF 9F 16 07
	bra -32.b		; 80 E0
	clv		; B8
	lda $002323.l,X		; BF 23 23 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $60.b		; 00 60
	brk $E7.b		; 00 E7
	clc		; 18
	sbc $40BF00.l,X		; FF 00 BF 40
	lda $DC.b,S		; A3 DC
	sty $FF.b,X		; 94 FF
	cmp #$FF.b		; C9 FF
	phd		; 0B
	jmp $D14E.w		; 4C 4E D1
	wai		; CB
	sty $2E.b		; 84 2E
	and ($01.b),Y		; 31 01
	asl $A0.b		; 06 A0
	clv		; B8
	jmp ($267E.w,X)		; 7C 7E 26
	rol $77.b		; 26 77
	iny		; C8
	and $305F90.l		; 2F 90 5F 30
	ora $00FFE0.l,X		; 1F E0 FF 00
	lda $807F40.l,X		; BF 40 7F 80
	adc [$D8.b]		; 67 D8
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	ora [$E4.b],Y		; 17 E4
	eor [$B4.b]		; 47 B4
	ora [$E4.b],Y		; 17 E4
	sbc [$F4.b]		; E7 F4
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	ora ($08.b,S),Y		; 13 08
	sta $C112.w		; 8D 12 C1
	asl $1CC3.w,X		; 1E C3 1C
	cmp $1C.b,S		; C3 1C
	rep #$0D		; C2 0D
	sbc [$08.b]		; E7 08
	inc $09.b		; E6 09
	cpx $0B.b		; E4 0B
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx $A61C.w		; EC 1C A6
	lsr $2ED6.w,X		; 5E D6 2E
	dec $DF26.w,X		; DE 26 DF
	and [$CA.b]		; 27 CA
	rol $FB.b,X		; 36 FB
	ora [$FF.b]		; 07 FF
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $F6.b		; 00 F6
	tsb $76.b		; 04 76
	tsb $76.b		; 04 76
	tsb $76.b		; 04 76
	tsb $76.b		; 04 76
	tsb $36.b		; 04 36
	tsb $36.b		; 04 36
	tsb $36.b		; 04 36
	tsb $FA.b		; 04 FA
	ora ($7A.b,X)		; 01 7A
	sta ($7A.b,X)		; 81 7A
	sta ($7A.b,X)		; 81 7A
	sta ($7A.b,X)		; 81 7A
	sta ($3A.b,X)		; 81 3A
	cmp ($3A.b,X)		; C1 3A
	cmp ($3A.b,X)		; C1 3A
	cmp ($3B.b,X)		; C1 3B
	eor $6F.b		; 45 6F
	ora ($3B.b),Y		; 11 3B
	eor $EF.b		; 45 EF
	sta ($93.b),Y		; 91 93
	sbc $3B47.w		; ED 47 3B
	ora ($6F.b,S),Y		; 13 6F
	eor [$3B.b]		; 47 3B
	inc $FE80.w,X		; FE 80 FE
	bra  -2.b		; 80 FE
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra  -4.b		; 80 FC
	bra  -4.b		; 80 FC
	bra  -4.b		; 80 FC
	bra  -1.b		; 80 FF
	cmp $FF.b,S		; C3 FF
	sta [$FF.b]		; 87 FF
	cmp [$FF.b]		; C7 FF
	sta [$FF.b]		; 87 FF
	cmp [$FF.b]		; C7 FF
	sta [$FF.b]		; 87 FF
	eor [$FF.b]		; 47 FF
	sta [$3F.b]		; 87 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $BF.b		; 00 BF
	brk $7F.b		; 00 7F
	brk $DE.b		; 00 DE
	jsr $20DE.w		; 20 DE 20
	dec $DE20.w,X		; DE 20 DE
	jsr $20DE.w		; 20 DE 20
	dec $DC20.w,X		; DE 20 DC
	jsl $2122DC.l		; 22 DC 22 21
	dec $DE21.w,X		; DE 21 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	adc ($DE.b),Y		; 71 DE
	and ($DE.b,X)		; 21 DE
	and $DC.b,S		; 23 DC
	adc ($DC.b,S),Y		; 73 DC
	inc $BBFF.w		; EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $BBFFEE.l,X		; FF EE FF BB
	sbc $AAFF55.l,X		; FF 55 FF AA
	eor $FF.b,X		; 55 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $4E.b		; 00 4E
	sta ($CE.b),Y		; 91 CE
	ora ($4E.b),Y		; 11 4E
	sta ($CE.b),Y		; 91 CE
	ora ($46.b),Y		; 11 46
	sta $19C4.w,Y		; 99 C4 19
	lsr $99.b		; 46 99
	dec $19.b		; C6 19
	sbc ($0E.b,S),Y		; F3 0E
	sbc ($0E.b,S),Y		; F3 0E
	sbc ($0E.b),Y		; F1 0E
	sbc ($0E.b),Y		; F1 0E
	xce		; FB
	asl $FB.b		; 06 FB
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $FF.b		; 06 FF
	sec		; 38
	sbc $38FF38.l,X		; FF 38 FF 38
	sbc $1CFF3C.l,X		; FF 3C FF 1C
	adc $1C7F1C.l,X		; 7F 1C 7F 1C
	sbc $C0BF1C.l,X		; FF 1C BF C0
	lda $C03FC0.l,X		; BF C0 3F C0
	and $E09FC0.l,X		; 3F C0 9F E0
	sta $E09FE0.l,X		; 9F E0 9F E0
	ora $BEF1E0.l,X		; 1F E0 F1 BE
	pea $F17B.w		; F4 7B F1
	ldx $5BF4.w,Y		; BE F4 5B
	sbc ($3E.b),Y		; F1 3E
	pea $F85B.w		; F4 5B F8
	and $4F1BFC.l,X		; 3F FC 1B 4F
	brk $8F.b		; 00 8F
	brk $4F.b		; 00 4F
	brk $AF.b		; 00 AF
	brk $CF.b		; 00 CF
	brk $AF.b		; 00 AF
	brk $C7.b		; 00 C7
	brk $E7.b		; 00 E7
	brk $0D.b		; 00 0D
	cpy $4C.b		; C4 4C
	sty $0E.b		; 84 0E
	dec $66.b		; C6 66
	.db $82, $08, $F8		; 82 08 F8
	mvp $00,$BA		; 44 BA 00
	jsr ($B844.w,X)		; FC 44 B8
	xba		; EB
	bmi -22.b		; 30 EA
	and ($E8.b),Y		; 31 E8
	and ($F4.b),Y		; 31 F4
	ora $0FF4.w,Y		; 19 F4 0F
	inc $FC01.w,X		; FE 01 FC
	ora $FC.b,S		; 03 FC
	ora $2B.b,S		; 03 2B
	bit $67.b,X		; 34 67
	sei		; 78
	rtl		; 6B

	stz $6B.b,X		; 74 6B
	stz $CF.b,X		; 74 CF
	beq  31.b		; F0 1F
	rts		; 60

	cmp $E0BFE0.l,X		; DF E0 BF E0
	and $807FC0.l,X		; 3F C0 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc #$14.b		; E9 14
	lda ($4C.b),Y		; B1 4C
	bit #$74.b		; 89 74
	sbc $F005.w,Y		; F9 05 F0
	tsb $05F8.w		; 0C F8 05
	sed		; F8
	ora $F0.b		; 05 F0
	ora $00FF.w		; 0D FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $440000.l,X		; FF 00 00 44
	tyx		; BB
	brk $FF.b		; 00 FF
	mvp $FF,$BB		; 44 BB FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FBF8.w		; 0C F8 FB
	ora ($06.b,X)		; 01 06
	mvp $00,$BB		; 44 BB 00
	sbc $F9BB44.l,X		; FF 44 BB F9
	cop $F9.b		; 02 F9
	cop $F1.b		; 02 F1
	cop $03.b		; 02 03
	tsb $07.b		; 04 07
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $EE1100.l,X		; FF 00 11 EE
	mvp $11,$BB		; 44 BB 11
	inc $BB44.w		; EE 44 BB
	ora ($EE.b),Y		; 11 EE
	mvp $00,$B8		; 44 B8 00
	sbc $B341.w,Y		; F9 41 B3
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bpl -20.b		; 10 EC
	eor ($B1.b,X)		; 41 B1
	ora [$E7.b]		; 07 E7
	tsb $388C.w		; 0C 8C 38
	sec		; 38
	tsb $04.b		; 04 04
	bne -48.b		; D0 D0
	bra -128.b		; 80 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FC00.l,X		; FF 00 FC 03
	plx		; FA
	ora [$85.b]		; 07 85
	tda		; 7B
	sbc ($2F.b)		; F2 2F
	jmp.w [$707F]		; DC 7F 70
	bvs  72.b		; 70 48
	pha		; 48
	trb $14.b		; 14 14
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	asl A		; 0A
	ora $03.b,S		; 03 03
	beq  15.b		; F0 0F
	lsr $7EB7.w		; 4E B7 7E
	xba		; EB
	bit $FF.b,X		; 34 FF
	inc $FF.b,X		; F6 FF
	cpx #$FF.b		; E0 FF
	txa		; 8A
	sbc $03.b,X		; F5 03
	jsr ($4040.w,X)		; FC 40 40
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	ror A		; 6A
	ror A		; 6A
	tay		; A8
	tay		; A8
	brk $00.b		; 00 00
	adc [$BF.b],Y		; 77 BF
	plx		; FA
	adc $C3FF00.l,X		; 7F 00 FF C3
	jsr ($FD02.w,X)		; FC 02 FD
	ror A		; 6A
	sta $A8.b,X		; 95 A8
	eor [$00.b],Y		; 57 00
	sbc $000000.l,X		; FF 00 00 00
	brk $ED.b		; 00 ED
	sbc $6C6C.w		; ED 6C 6C
	php		; 08
	php		; 08
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $FF.b		; 14 FF
	brk $FF.b		; 00 FF
	sbc $6C12.w		; ED 12 6C
	sta ($08.b,S),Y		; 93 08
	sbc [$A0.b],Y		; F7 A0
	eor $00FF00.l,X		; 5F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $55.b		; 00 55
	eor $15.b,X		; 55 15
	ora $D8.b,X		; 15 D8
	cld		; D8
	and ($21.b,X)		; 21 21
	jsr $0020.w		; 20 20 00
	brk $22.b		; 00 22
	sbc $55FF08.l,X		; FF 08 FF 55
	tax		; AA
	ora $EA.b,X		; 15 EA
	cld		; D8
	and [$21.b]		; 27 21
	dec $DF20.w,X		; DE 20 DF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc  80.b		; 50 50
	ror A		; 6A
	ror A		; 6A
	bmi  48.b		; 30 30
	phb		; 8B
	phb		; 8B
	tsb $000C.w		; 0C 0C 00
	brk $0E.b		; 00 0E
	sbc $51FF22.l,X		; FF 22 FF 51
	lda $30956A.l		; AF 6A 95 30
	cmp $0C748B.l		; CF 8B 74 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $040202.l,X		; FF 02 02 04
	tsb $01.b		; 04 01
	brk $80.b		; 00 80
	sta ($04.b,X)		; 81 04
	ora $04.b		; 05 04
	ora [$8E.b]		; 07 8E
	sta $0F08.w		; 8D 08 0F
	sbc ($FC.b,S),Y		; F3 FC
	sta $03FA.w,X		; 9D FA 03
	jsr ($7C93.w,X)		; FC 93 7C
	and $F8.b,S		; 23 F8
	ora $F8.b,S		; 03 F8
	sta $70.b,S		; 83 70
	ora [$F0.b]		; 07 F0
	and $FF07FC.l,X		; 3F FC 07 FF
	ora ($DF.b,X)		; 01 DF
	brk $9F.b		; 00 9F
	brk $B5.b		; 00 B5
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	cmp $00.b,S		; C3 00
	sed		; F8
	brk $DE.b		; 00 DE
	jsr $609F.w		; 20 9F 60
	lda $4A.b,X		; B5 4A
	jsr ($FD03.w,X)		; FC 03 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $3DE060.l,X		; FF 60 E0 3D
	inc $FF07.w,X		; FE 07 FF
	brk $1F.b		; 00 1F
	brk $D3.b		; 00 D3
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra  31.b		; 80 1F
	cmp $00.b,S		; C3 00
	sed		; F8
	brk $1F.b		; 00 1F
	cpx #$D3.b		; E0 D3
	bit $0EE1.w		; 2C E1 0E
	sbc $0A.b		; E5 0A
	cpx #$EF.b		; E0 EF
	ora $0C.b,S		; 03 0C
	clc		; 18
	sbc [$C9.b],Y		; F7 C9
	inc $63.b		; E6 63
	cpx $E52A.w		; EC 2A E5
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $E01F00.l,X		; 1F 00 1F E0
	sbc $003F00.l		; EF 00 3F 00
	sta $00DF00.l,X		; 9F 00 DF 00
	sbc $0B.b,X		; F5 0B
	adc $7587.w,Y		; 79 87 75
	phb		; 8B
	sbc $0B.b,X		; F5 0B
	jmp ($FE83.w,X)		; 7C 83 FE
	ora ($7E.b,X)		; 01 7E
	sta ($7F.b,X)		; 81 7F
	sta ($FF.b,X)		; 81 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $36.b		; 00 36
	tsb $9E.b		; 04 9E
	sty $989C.w		; 8C 9C 98
	.db $82, $83, $D1		; 82 83 D1
	dec $9B04.w		; CE 04 9B
	cpy #$CF.b		; C0 CF
	mvp $3A,$CB		; 44 CB 3A
	cmp ($92.b,X)		; C1 92
	adc ($85.b,X)		; 61 85
	adc $85.b,S		; 63 85
	ror $20DF.w,X		; 7E DF 20
	sta $30CF60.l,X		; 9F 60 CF 30
	cmp $6F1330.l		; CF 30 13 6F
	eor [$3B.b]		; 47 3B
	sta ($6F.b,S),Y		; 93 6F
	eor [$BA.b]		; 47 BA
	ora ($EF.b,S),Y		; 13 EF
	eor [$BA.b]		; 47 BA
	ora [$FF.b]		; 07 FF
	eor [$BE.b]		; 47 BE
	jsr ($FC80.w,X)		; FC 80 FC
	bra  -4.b		; 80 FC
	brk $FD.b		; 00 FD
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	eor [$FF.b]		; 47 FF
	sta [$FF.b]		; 87 FF
	eor [$FF.b]		; 47 FF
	sta $FF0EFF.l		; 8F FF 0E FF
	stx $0EFF.w		; 8E FF 0E
	sbc $00BF0E.l,X		; FF 0E BF 00
	adc $00BF00.l,X		; 7F 00 BF 00
	adc $01FE00.l,X		; 7F 00 FE 01
	ror $FE01.w,X		; 7E 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($DC.b,X)		; 01 DC
	jsl $DC22DC.l		; 22 DC 22 DC
	jsl $D822DC.l		; 22 DC 22 D8
	rol $88.b		; 26 88
	rol $98.b		; 26 98
	rol $D8.b		; 26 D8
	rol $73.b		; 26 73
	jmp.w [$DC73]		; DC 73 DC
	and $DC.b,S		; 23 DC
	and $DC.b,S		; 23 DC
	adc [$D8.b],Y		; 77 D8
	adc [$D8.b],Y		; 77 D8
	adc [$D8.b]		; 67 D8
	and [$D8.b]		; 27 D8
	adc [$88.b],Y		; 77 88
	cmp $7722.w,X		; DD 22 77
	dey		; 88
	cmp $7722.w,X		; DD 22 77
	dey		; 88
	cmp $7722.w,X		; DD 22 77
	dey		; 88
	cmp $FF22.w,X		; DD 22 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $44.b		; 00 44
	sta $19C4.w,Y		; 99 C4 19
	lsr $99.b		; 46 99
	dec $19.b,X		; D6 19
	eor ($9D.b)		; 52 9D
	cmp ($1D.b)		; D2 1D
	eor ($9D.b)		; 52 9D
	cmp ($1D.b)		; D2 1D
	xce		; FB
	asl $FB.b		; 06 FB
	asl $F9.b		; 06 F9
	asl $E9.b		; 06 E9
	asl $ED.b		; 06 ED
	cop $ED.b		; 02 ED
	cop $ED.b		; 02 ED
	cop $ED.b		; 02 ED
	cop $FF.b		; 02 FF
	asl $0EFF.w,X		; 1E FF 0E
	sbc $0FFF0E.l,X		; FF 0E FF 0F
	sbc $83FF83.l,X		; FF 83 FF 83
	sbc $03FF03.l,X		; FF 03 FF 03
	ora $F00FE0.l,X		; 1F E0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	jsr ($FD2F.w,X)		; FC 2F FD
	asl $2BFF.w,X		; 1E FF 2B
	sbc $82FF15.l,X		; FF 15 FF 82
	sbc $F8FFC0.l,X		; FF C0 FF F8
	sbc $00D3FF.l,X		; FF FF D3 00
	sbc $00.b,S		; E3 00
	pei ($00.b)		; D4 00
	nop		; EA
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($EC10.w,X)		; FC 10 EC
	sbc $FCFD.w,X		; FD FD FC
	jsr ($B9F9.w,X)		; FC F9 B9
	sbc $F901.w,Y		; F9 01 F9
	ora ($F9.b,X)		; 01 F9
	sbc $03FC.w,Y		; F9 FC 03
	jsr ($7D03.w,X)		; FC 03 7D
	cop $0C.b		; 02 0C
	ora $41.b,S		; 03 41
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $BF.b		; 06 BF
	cpx #$BF.b		; E0 BF
	cpx #$BF.b		; E0 BF
	cpx #$BE.b		; E0 BE
	cmp ($3F.b,X)		; C1 3F
	cpy #$BF.b		; C0 BF
	cpy #$BF.b		; C0 BF
	cpy #$DF.b		; C0 DF
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora $E9.b		; 05 E9
	trb $F1.b		; 14 F1
	ora $05F9.w		; 0D F9 05
	sbc ($0D.b),Y		; F1 0D
	sbc $F105.w,Y		; F9 05 F1
	ora $05F9.w		; 0D F9 05
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	ora ($EE.b),Y		; 11 EE
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $DDFFFF.l,X		; FF FF FF DD
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	ora ($EE.b),Y		; 11 EE
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $DFFEFF.l,X		; FF FF FE DF
	jsr ($B8FF.w,X)		; FC FF B8
	ror $00FF.w,X		; 7E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FC00.w,X		; FE 00 FC
	brk $F9.b		; 00 F9
	brk $E3.b		; 00 E3
	brk $C6.b		; 00 C6
	ora ($00.b,X)		; 01 00
	cpx $18.b		; E4 18
	sed		; F8
	beq  -8.b		; F0 F8
	cpy $04FC.w		; CC FC 04
	jsr ($EF03.w,X)		; FC 03 EF
	ora ($8F.b,X)		; 01 8F
	brk $DD.b		; 00 DD
	sbc $E403.w,X		; FD 03 E4
	ora [$08.b]		; 07 08
	ora [$30.b]		; 07 30
	ora $FA.b,S		; 03 FA
	ora ($EC.b,X)		; 01 EC
	bpl -114.b		; 10 8E
	bvs -35.b		; 70 DD
	jsl $0A0000.l		; 22 00 00 0A
	asl A		; 0A
	cop $02.b		; 02 02
	sta ($93.b,S),Y		; 93 93
	rti		; 40

	rti		; 40

	ora #$09.b		; 09 09
	bra -64.b		; 80 C0
	cpy #$E0.b		; C0 E0
	bit $FF.b		; 24 FF
	tax		; AA
	sbc $22.b,X		; F5 22
	sbc $6C93.w,X		; FD 93 6C
	rti		; 40

	lda $40F609.l,X		; BF 09 F6 40
	and $541F20.l,X		; 3F 20 1F 54
	mvn $00,$00		; 54 00 00
	bcc -112.b		; 90 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvn $00,$AB		; 54 AB 00
	sbc $006F90.l,X		; FF 90 6F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $82FF00.l,X		; FF 00 FF 82
	.db $82, $00, $00		; 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $7D, $00		; 82 7D 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FF00.l,X		; FF 00 FF 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $4A1B0C.l,X		; FF 0C 1B 4A
	eor $1718.w,X		; 5D 18 17
	bpl  31.b		; 10 1F
	trb $1B.b		; 14 1B
	bmi  63.b		; 30 3F
	clc		; 18
	ora $171F08.l,X		; 1F 08 1F 17
	cpx #$57.b		; E0 57
	ldy #$0F.b		; A0 0F
	cpx #$0F.b		; E0 0F
	cpx #$0F.b		; E0 0F
	cpx #$2F.b		; E0 2F
	cpy #$07.b		; C0 07
	cpx #$17.b		; E0 17
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	xce		; FB
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $28.b		; 00 28
	eor [$01.b]		; 47 01
	inc $E50A.w		; EE 0A E5
	ora ($EE.b,X)		; 01 EE
	ora $EC.b,S		; 03 EC
	and ($DC.b,S),Y		; 33 DC
	brk $DF.b		; 00 DF
	ora ($CE.b),Y		; 11 CE
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00EF00.l,X		; FF 00 EF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $01FF81.l,X		; 7F 81 FF 01
	adc $00FF81.l,X		; 7F 81 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	cmp $6FCE41.l		; CF 41 CE 6F
	sbc $27CF4F.l		; EF 4F CF 27
	sbc [$07.b]		; E7 07
	cpy #$07.b		; C0 07
	cpy #$27.b		; C0 27
	sbc [$CF.b]		; E7 CF
	bmi -49.b		; 30 CF
	bmi -17.b		; 30 EF
	bpl -50.b		; 10 CE
	bmi -32.b		; 30 E0
	clc		; 18
	cmp [$38.b]		; C7 38
	cmp [$38.b]		; C7 38
	sbc [$18.b]		; E7 18
	ora $EE1FFD.l		; 0F FD 1F EE
	sbc $EAFFF5.l,X		; FF F5 FF EA
	sbc $00FF50.l,X		; FF 50 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc ($00.b)		; F2 00
	sbc ($00.b),Y		; F1 00
	dex		; CA
	brk $15.b		; 00 15
	brk $AF.b		; 00 AF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl $1CFF.w,X		; 1E FF 1C
	sbc $3CFF1C.l,X		; FF 1C FF 3C
	sbc $70FF30.l,X		; FF 30 FF 70
	sbc $F0FFF0.l,X		; FF F0 FF F0
	inc $FC01.w,X		; FE 01 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $F0.b,S		; 03 F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C80FF0.l		; 0F F0 0F C8
	rol $C8.b		; 26 C8
	rol $D8.b		; 26 D8
	rol $DA.b		; 26 DA
	rol $D2.b		; 26 D2
	ror $2FD3.w		; 6E D3 2F
	cmp ($2F.b,S),Y		; D3 2F
	cmp ($2F.b,S),Y		; D3 2F
	and [$D8.b],Y		; 37 D8
	and [$D8.b],Y		; 37 D8
	and [$D8.b]		; 27 D8
	and $D8.b		; 25 D8
	and $2CD0.w		; 2D D0 2C
	bne  44.b		; D0 2C
	bne  44.b		; D0 2C
	bne  -9.b		; D0 F7
	tsb $B7.b		; 04 B7
	mvp $12,$EB		; 44 EB 12
	lda $EC41.w,Y		; B9 41 EC
	bpl -70.b		; 10 BA
	mvp $EE,$11		; 44 11 EE
	jsr $EB80.w		; 20 80 EB
	bpl -21.b		; 10 EB
	bpl -11.b		; 10 F5
	php		; 08
	inc $08.b,X		; F6 08
	xce		; FB
	tsb $FD.b		; 04 FD
	cop $FE.b		; 02 FE
	ora ($FF.b,X)		; 01 FF
	adc $FD04FD.l,X		; 7F FD 04 FD
	tsb $FA.b		; 04 FA
	ora #$F3.b		; 09 F3
	bpl -26.b		; 10 E6
	sbc ($0B.b,X)		; E1 0B
	tsb $F1.b		; 04 F1
	asl $0004.w		; 0E 04 00
	plx		; FA
	ora ($FA.b,X)		; 01 FA
	ora ($F5.b,X)		; 01 F5
	cop $ED.b		; 02 ED
	cop $1B.b		; 02 1B
	tsb $F7.b		; 04 F7
	php		; 08
	ora $FFFFF0.l		; 0F F0 FF FF
	cpx $6012.w		; EC 12 60
	stz $0EF0.w,X		; 9E F0 0E
	beq  14.b		; F0 0E
	bne  44.b		; D0 2C
	sbc $D904.w,Y		; F9 04 D9
	bit $C9.b		; 24 C9
	bit $FF.b,X		; 34 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl  -2.b		; 10 FE
	and $81FBD8.l,X		; 3F D8 FB 81
	lda $434D.w,Y		; B9 4D 43
	mvn $01,$94		; 54 94 01
	sbc ($0F.b,X)		; E1 0F
	ora $C100E7.l		; 0F E7 00 C1
	ora ($3A.b,X)		; 01 3A
	ora [$39.b]		; 07 39
	lsr $8F.b		; 46 8F
	beq -49.b		; F0 CF
	sec		; 38
	sbc $00FF00.l,X		; FF 00 FF 00
	phd		; 0B
	pei ($4E.b)		; D4 4E
	cmp ($9B.b),Y		; D1 9B
	ldy $AE.b		; A4 AE
	bne   0.b		; D0 00
	cpy #$1F.b		; C0 1F
	ora $584040.l,X		; 1F 40 40 58
	cli		; 58
	sbc $A09FD0.l		; EF D0 9F A0
	eor $403F20.l,X		; 5F 20 3F 40
	adc $00FF80.l,X		; 7F 80 FF 00
	rti		; 40

	lda $9FA75E.l,X		; BF 5E A7 9F
	eor ($DF.b,X)		; 41 DF
	ora ($8E.b,S),Y		; 13 8E
	jmp ($0000.w)		; 6C 00 00
	sbc $4040FF.l,X		; FF FF 40 40
	mvp $80,$44		; 44 44 80
	bra -66.b		; 80 BE
	rti		; 40

	cpy $D020.w		; CC 20 D0
	and $FF.b,S		; 23 FF
	brk $FF.b		; 00 FF
	brk $41.b		; 00 41
	lda $FFBB67.l,X		; BF 67 BB FF
	adc $E809C1.l,X		; 7F C1 09 E8
	xce		; FB
	cmp $00F0.w,Y		; D9 F0 00
	brk $FF.b		; 00 FF
	sbc $080000.l,X		; FF 00 00 08
	php		; 08
	brk $00.b		; 00 00
	ror $0519.w		; 6E 19 05
	ora ($EB.b)		; 12 EB
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	sbc $FFF7F9.l,X		; FF F9 F7 FF
	sbc $EE46B8.l,X		; FF B8 46 EE
	bpl -70.b		; 10 BA
	eor $0E.b		; 45 0E
	ora ($C0.b),Y		; 11 C0
	cpy #$BE.b		; C0 BE
	ldx $8080.w,Y		; BE 80 80
	lsr $46.b		; 46 46
	sbc $FE02.w,X		; FD 02 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	bra 127.b		; 80 7F
	dec $FEB9.w,X		; DE B9 FE
	php		; 08
	sbc $67769F.l,X		; FF 9F 76 67
	rts		; 60

	sbc $0AF02C.l		; EF 2C F0 0A
	asl A		; 0A
	lda ($A0.b,X)		; A1 A0
	ldy $F3AC.w		; AC AC F3
	brk $60.b		; 00 60
	brk $87.b		; 00 87
	clc		; 18
	and $43BC90.l		; 2F 90 BC 43
	jsr ($BF07.w,X)		; FC 07 BF
	rti		; 40

	lda $4C0B50.l,X		; BF 50 0B 4C
	lsr $CBD1.w		; 4E D1 CB
	sty $2E.b		; 84 2E
	and ($91.b),Y		; 31 91
	ldx $BB44.w		; AE 44 BB
	ora ($EE.b),Y		; 11 EE
	tsb $3B.b		; 04 3B
	adc [$C8.b],Y		; 77 C8
	and $305F90.l		; 2F 90 5F 30
	ora $C07FE0.l,X		; 1F E0 7F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $44B700.l,X		; FF 00 B7 44
	sbc [$14.b]		; E7 14
	lda [$44.b],Y		; B7 44
	sbc [$14.b]		; E7 14
	ora [$E4.b],Y		; 17 E4
	eor [$B4.b]		; 47 B4
	ora [$E4.b],Y		; 17 E4
	eor [$B4.b]		; 47 B4
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sbc ($08.b,S),Y		; F3 08
	sta $C112.w		; 8D 12 C1
	asl $1CC3.w,X		; 1E C3 1C
	cmp $1C.b,S		; C3 1C
	rep #$0D		; C2 0D
	sbc [$08.b]		; E7 08
	sep #$0D		; E2 0D
	cpx #$0F.b		; E0 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FC04.w,X		; FD 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FD.b		; 04 FD
	ora $F9.b		; 05 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F8.b		; 02 F8
	cop $BD.b		; 02 BD
	mvp $13,$ED		; 44 ED 13
	clv		; B8
	mvp $11,$EF		; 44 EF 11
	bpl -24.b		; 10 E8
	eor ($87.b,X)		; 41 87
	ora $D9D9DF.l		; 0F DF D9 D9
	xce		; FB
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $39.b		; 00 39
	asl $FF.b		; 06 FF
	bpl  -2.b		; 10 FE
	and $80FAD8.l,X		; 3F D8 FA 80
	sta ($07.b,X)		; 81 07
	and $807171.l,X		; 3F 71 71 80
	bra   0.b		; 80 00
	brk $E7.b		; 00 E7
	brk $C1.b		; 00 C1
	ora ($3B.b,X)		; 01 3B
	asl $3F.b		; 06 3F
	rti		; 40

	sbc $8E7100.l,X		; FF 00 71 8E
	txa		; 8A
	adc $0BFFA4.l,X		; 7F A4 FF 0B
	pei ($4E.b)		; D4 4E
	cmp ($00.b),Y		; D1 00
	brk $5F.b		; 00 5F
	sbc $104747.l,X		; FF 47 47 10
	bpl   0.b		; 10 00
	brk $04.b		; 00 04
	tsb $EF.b		; 04 EF
	bne -97.b		; D0 9F
	ldy #$FF.b		; A0 FF
	brk $FF.b		; 00 FF
	brk $47.b		; 00 47
	clv		; B8
	eor $5EEF.w,Y		; 59 EF 5E
	sbc $9FFBDE.l,X		; FF DE FB 9F
	eor ($DF.b,X)		; 41 DF
	ora ($00.b,S),Y		; 13 00
	brk $FF.b		; 00 FF
	sbc $405F5F.l,X		; FF 5F 5F 40
	rti		; 40

	sty $84.b		; 84 84
	brk $00.b		; 00 00
	ldx $CC40.w,Y		; BE 40 CC
	jsr $00FF.w		; 20 FF 00
	sbc $A0DF00.l,X		; FF 00 DF A0
	adc ($BF.b,X)		; 61 BF
	inc $7B.b,X		; F6 7B
	adc $09C1FF.l,X		; 7F FF C1 09
	inx		; E8
	xce		; FB
	cmp $06F0.w,Y		; D9 F0 06
	ora $F0.b		; 05 F0
	beq  63.b		; F0 3F
	and $080000.l,X		; 3F 00 00 08
	php		; 08
	ror $0519.w		; 6E 19 05
	ora ($EB.b)		; 12 EB
	asl $F3.b		; 06 F3
	tsb $00FF.w		; 0C FF 00
	adc $FF22C0.l,X		; 7F C0 22 FF
	sbc $B8F7.w,Y		; F9 F7 B8
	lsr $EE.b		; 46 EE
	bpl -70.b		; 10 BA
	eor $EE.b		; 45 EE
	ora ($11.b),Y		; 11 11
	ror $8B84.w		; 6E 84 8B
	sbc ($E0.b,X)		; E1 E0
	ldy $FDBC.w,X		; BC BC FD
	cop $FE.b		; 02 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	inc $FF08.w,X		; FE 08 FF
	sta $606776.l,X		; 9F 76 67 60
	sbc $4AF02C.l		; EF 2C F0 4A
	tsx		; BA
	ora ($EE.b),Y		; 11 EE
	tsb $3B.b		; 04 3B
	sbc ($00.b,S),Y		; F3 00
	rts		; 60

	brk $87.b		; 00 87
	clc		; 18
	and $43BC90.l		; 2F 90 BC 43
	cpx $FF17.w		; EC 17 FF
	brk $FF.b		; 00 FF
	brk $0B.b		; 00 0B
	jmp $D14E.w		; 4C 4E D1
	wai		; CB
	sty $2E.b		; 84 2E
	and ($91.b),Y		; 31 91
	ldx $BB44.w		; AE 44 BB
	ora ($EE.b),Y		; 11 EE
	mvp $77,$BB		; 44 BB 77
	iny		; C8
	and $305F90.l		; 2F 90 5F 30
	ora $C07FE0.l,X		; 1F E0 7F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $128D00.l,X		; FF 00 8D 12
	cmp ($1E.b,X)		; C1 1E
	cmp $1C.b,S		; C3 1C
	cmp $1C.b,S		; C3 1C
	rep #$0D		; C2 0D
	sbc ($0E.b,X)		; E1 0E
	inc $09.b		; E6 09
	cpx #$0F.b		; E0 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $B904.w,Y		; F9 04 B9
	mvp $44,$B9		; 44 B9 44
	sbc $F805.w,Y		; F9 05 F8
	tsb $F8.b		; 04 F8
	ora $F8.b		; 05 F8
	ora $F0.b		; 05 F0
	ora $00FF.w		; 0D FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	tsb $FC.b		; 04 FC
	ora $FD.b		; 05 FD
	tsb $FBF8.w		; 0C F8 FB
	ora ($07.b,X)		; 01 07
	lsr $BF.b		; 46 BF
	php		; 08
	sbc $F9BC50.l,X		; FF 50 BC F9
	cop $F9.b		; 02 F9
	cop $F1.b		; 02 F1
	cop $03.b		; 02 03
	tsb $06.b		; 04 06
	sed		; F8
	sbc $F700.w,Y		; F9 00 F7
	brk $EF.b		; 00 EF
	ora $10.b,S		; 03 10
	inx		; E8
	eor $A3.b,S		; 43 A3
	ora $B9398F.l		; 0F 8F 39 B9
	bne -48.b		; D0 D0
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $10.b		; 00 10
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $06FF00.l,X		; FF 00 FF 06
	and $0FFF0F.l,X		; 3F 0F FF 0F
	sbc $E79A87.l,X		; FF 87 9A E7
	bvs 112.b		; 70 70
	php		; 08
	php		; 08
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	asl A		; 0A
	eor $E25D.w,X		; 5D 5D E2
.ACCU 8
.INDEX 8
	sep #$F0		; E2 F0
	ora $E7F70F.l		; 0F 0F F7 E7
	eor $E8FFFD.l,X		; 5F FD FF E8
	sbc $5DF55A.l,X		; FF 5A F5 5D
	ldx #$E2.b		; A2 E2
	ora $0404.w,X		; 1D 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	asl A		; 0A
	trb $A21C.w		; 1C 1C A2
	ldx #$13.b		; A2 13
	ora ($D0.b,S),Y		; 13 D0
	bne 126.b		; D0 7E
	xce		; FB
	sbc $DCFF.w,X		; FD FF DC
	sbc $1CF50A.l,X		; FF 0A F5 1C
	sbc $A2.b,S		; E3 A2
	eor $EC13.w,X		; 5D 13 EC
	bne  47.b		; D0 2F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	sty $94.b,X		; 94 94
	ora $DFDF0F.l		; 0F 0F DF DF
	and ($32.b)		; 32 32
	brk $00.b		; 00 00
	plx		; FA
	sbc $06FFA0.l,X		; FF A0 FF 06
	sbc $6B94.w,Y		; F9 94 6B
	ora $20DFF0.l		; 0F F0 DF 20
	and ($CD.b)		; 32 CD
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	cld		; D8
	cmp #$C9.b		; C9 C9
	cpx #$E0.b		; E0 E0
	inc $07FE.w,X		; FE FE 07
	ora [$04.b]		; 07 04
	tsb $17.b		; 04 17
	sbc $D8FF01.l,X		; FF 01 FF D8
	and [$C9.b]		; 27 C9
	rol $E0.b,X		; 36 E0
	ora $0701FE.l,X		; 1F FE 01 07
	sed		; F8
	tsb $FB.b		; 04 FB
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvn $0E,$54		; 54 54 0E
	asl $D1D1.w		; 0E D1 D1
	and ($32.b)		; 32 32
	cop $02.b		; 02 02
	cmp $FF6FF7.l,X		; DF F7 6F FF
	asl $54FF.w		; 0E FF 54
	plb		; AB
	asl $D1F1.w		; 0E F1 D1
	rol $CD32.w		; 2E 32 CD
	cop $FD.b		; 02 FD
	ora $03.b,S		; 03 03
	tsb $04.b		; 04 04
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvn $2E,$54		; 54 54 2E
	rol $D1D1.w		; 2E D1 D1
	sta $FC.b,S		; 83 FC
	inc $F9FB.w,X		; FE FB F9
	inc $FF2F.w,X		; FE 2F FF
	ora $FF.b		; 05 FF
	lsr $AB.b,X		; 56 AB
	rol $D1D1.w		; 2E D1 D1
	rol $8681.w		; 2E 81 86
	bmi  49.b		; 30 31
	jmp ($277C.w,X)		; 7C 7C 27
	and [$02.b]		; 27 02
	cop $00.b		; 02 00
	brk $80.b		; 00 80
	sta $C0.b,S		; 83 C0
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	brk $3F.b		; 00 3F
	cpy #$80FF.w		; C0 FF 80
	sbc $FCFFD8.l,X		; FF D8 FF FC
	sta $789FFC.l		; 8F FC 9F 78
	dec $39.b,X		; D6 39
	ora [$E4.b],Y		; 17 E4
	eor [$B6.b]		; 47 B6
	ora ($6B.b,S),Y		; 13 6B
	rti		; 40

	bit $EEF1.w,X		; 3C F1 EE
	trb $04FB.w		; 1C FB 04
	lda $F30F02.l,X		; BF 02 0F F3
	php		; 08
	sbc ($08.b),Y		; F1 08
	sed		; F8
	tsb $FC.b		; 04 FC
	ora $1F.b,S		; 03 1F
	brk $E7.b		; 00 E7
	brk $FB.b		; 00 FB
	rti		; 40

	adc $FFF0.w,X		; 7D F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $110000.l,X		; FF 00 00 11
	inc $BB44.w		; EE 44 BB
	brk $FF.b		; 00 FF
	mvp $FF,$BB		; 44 BB FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E5.b		; 00 E5
	asl A		; 0A
	sbc [$08.b]		; E7 08
.ACCU 8
	sep #$ED		; E2 ED
	ora $0A.b		; 05 0A
	ora $EC.b,S		; 03 EC
	mvp $07,$AB		; 44 AB 07
	inx		; E8
	.db $42, $AD		; 42 AD
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $E01F00.l,X		; 1F 00 1F E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0B.b,X		; F5 0B
	adc $7587.w,Y		; 79 87 75
	phb		; 8B
	sbc $0B.b,X		; F5 0B
	jsr ($FE03.w,X)		; FC 03 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	trb $54A9.w		; 1C A9 54
	sta ($7C.b,X)		; 81 7C
	sbc ($0D.b),Y		; F1 0D
	stx $7A.b		; 86 7A
	cpx $19.b		; E4 19
	lda ($4D.b),Y		; B1 4D
	sta $69.b,X		; 95 69
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	jsr ($FF01.w,X)		; FC 01 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F80F0F.l,X		; FF 0F 0F F8
	sbc $00FE80.l,X		; FF 80 FE 00
	sbc ($FF.b)		; F2 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   7.b		; F0 07
	brk $7E.b		; 00 7E
	ora ($F2.b,X)		; 01 F2
	ora $0FFF.w		; 0D FF 0F
	sed		; F8
	and $80FEE0.l,X		; 3F E0 FE 80
	inc $EB00.w,X		; FE 00 EB
	brk $CF.b		; 00 CF
	brk $2F.b		; 00 2F
	brk $FF.b		; 00 FF
	beq   0.b		; F0 00
	cmp [$00.b]		; C7 00
	asl $7E01.w,X		; 1E 01 7E
	ora ($EB.b,X)		; 01 EB
	trb $CF.b		; 14 CF
	bmi  47.b		; 30 2F
	bne  -1.b		; D0 FF
	brk $10.b		; 00 10
	bne   8.b		; D0 08
	iny		; C8
	jsr $00C0.w		; 20 C0 00
	rts		; 60

	php		; 08
	pla		; 68
	php		; 08
	sed		; F8
	trb $04EC.w		; 1C EC 04
	jsr ($0FF3.w,X)		; FC F3 0F
	inc $F017.w		; EE 17 F0
	ora $718F72.l		; 0F 72 8F 71
	sta [$F0.b]		; 87 F0
	ora [$F0.b]		; 07 F0
	ora $F8.b,S		; 03 F8
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $55.b		; 02 55
	eor $03.b,X		; 55 03
	ora $34.b,S		; 03 34
	bit $4C.b,X		; 34 4C
	jmp $0000.w		; 4C 00 00
	jmp.w [$51FF]		; DC FF 51
	sbc $55FD22.l,X		; FF 22 FD 55
	tax		; AA
	ora $FC.b,S		; 03 FC
	bit $CB.b,X		; 34 CB
	jmp $00B3.w		; 4C B3 00
	sbc $000000.l,X		; FF 00 00 00
	brk $AA.b		; 00 AA
	tax		; AA
	tax		; AA
	tax		; AA
	asl $06.b		; 06 06
	adc ($61.b,X)		; 61 61
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	ora ($FF.b),Y		; 11 FF
	tsb $FF.b		; 04 FF
	tax		; AA
	eor $AA.b,X		; 55 AA
	eor $06.b,X		; 55 06
	sbc $9E61.w,Y		; F9 61 9E
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $0DAD.w		; AD AD 0D
	ora $C4C4.w		; 0D C4 C4
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	sbc $ADFF00.l,X		; FF 00 FF AD
	eor ($0D.b)		; 52 0D
	sbc ($C4.b)		; F2 C4
	tsa		; 3B
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$B0C0.w		; C0 C0 B0
	bcs  16.b		; B0 10
	bpl  85.b		; 10 55
	eor $05.b,X		; 55 05
	ora $00.b		; 05 00
	brk $3B.b		; 00 3B
	sbc $C0FF17.l,X		; FF 17 FF C0
	and $104FB0.l,X		; 3F B0 4F 10
	sbc $05AA55.l		; EF 55 AA 05
	plx		; FA
	brk $FF.b		; 00 FF
	sta $83.b,S		; 83 83
	mvp $0A,$44		; 44 44 0A
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	mvn $30,$54		; 54 54 30
	bmi -125.b		; 30 83
	jmp ($BBDC.w,X)		; 7C DC BB
	ora $FFCBF5.l,X		; 1F F5 CB FF
	tas		; 1B
	sbc $547F81.l,X		; FF 81 7F 54
	plb		; AB
	bmi -49.b		; 30 CF
	sta ($8E.b,X)		; 81 8E
	ldy #$39A3.w		; A0 A3 39
	sec		; 38
	tsb $070C.w		; 0C 0C 07
	ora [$08.b]		; 07 08
	php		; 08
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	sbc $40BF00.l,X		; FF 00 BF 40
	lda $F00FC0.l,X		; BF C0 0F F0
	cmp [$F8.b],Y		; D7 F8
	inx		; E8
	sbc [$53.b],Y		; F7 53
	sbc $FF0E.w,X		; FD 0E FF
	ora ($EE.b),Y		; 11 EE
	mvp $11,$BB		; 44 BB 11
	inc $3B44.w		; EE 44 3B
	ora ($2E.b),Y		; 11 2E
	tsb $0B.b		; 04 0B
	cpy #$60E7.w		; C0 E7 60
	adc ($FF.b,S),Y		; 73 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	bra  23.b		; 80 17
	cpx $47.b		; E4 47
	ldx $13.b,Y		; B6 13
	xba		; EB
	rti		; 40

	ldy $EE11.w,X		; BC 11 EE
	mvp $00,$BB		; 44 BB 00
	sbc $F3BB44.l,X		; FF 44 BB F3
	php		; 08
	sbc ($08.b),Y		; F1 08
	sed		; F8
	tsb $FC.b		; 04 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E5.b		; 00 E5
	asl A		; 0A
	sbc $0C.b,S		; E3 0C
	cpx $EB.b		; E4 EB
	ora [$08.b]		; 07 08
	ora $EC.b,S		; 03 EC
	eor [$A8.b]		; 47 A8
	ora [$E8.b]		; 07 E8
	eor $AC.b,S		; 43 AC
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $E01F00.l,X		; 1F 00 1F E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	ora $E9.b		; 05 E9
	trb $F1.b		; 14 F1
	ora $0DF1.w		; 0D F1 0D
	sbc ($0D.b),Y		; F1 0D
	sbc ($0D.b),Y		; F1 0D
	sbc ($0C.b),Y		; F1 0C
	sbc $FF04.w,Y		; F9 04 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FEEF11.l,X		; FF 11 EF FE
	sbc $E07FF8.l,X		; FF F8 7F E0
	jsr ($6A80.w,X)		; FC 80 6A
	brk $DF.b		; 00 DF
	bra 127.b		; 80 7F
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $E700.w,Y		; F9 00 E7
	brk $1F.b		; 00 1F
	ora $EE.b,S		; 03 EE
	ora $DF.b,X		; 15 DF
	jsr $00FF.w		; 20 FF 00
	rts		; 60

	plx		; FA
	bra  -6.b		; 80 FA
	brk $E1.b		; 00 E1
	brk $57.b		; 00 57
	brk $2D.b		; 00 2D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta $057E05.l,X		; 9F 05 7E 05
	sbc $FF1E.w,X		; FD 1E FF
	tay		; A8
	adc $FFD2.w		; 6D D2 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $04.b		; 00 04
	ldy $04.b,X		; B4 04
	trb $7E02.w		; 1C 02 7E
	cop $FE.b		; 02 FE
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	eor $B8.b,S		; 43 B8
	sbc $7C.b,S		; E3 7C
	sta ($FC.b,X)		; 81 FC
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $17.b		; 00 17
	ora [$99.b],Y		; 17 99
	sta $0000.w,Y		; 99 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	ora [$E8.b],Y		; 17 E8
	sta $0066.w,Y		; 99 66 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F708.l,X		; FF 08 F7 00
	adc $B87F00.l,X		; 7F 00 7F B8
	clv		; B8
	iny		; C8
	iny		; C8
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clv		; B8
	eor [$C8.b]		; 47 C8
	and [$40.b],Y		; 37 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20FF00.l,X		; FF 00 FF 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $00DF.w		; 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $040707.l,X		; FF 07 07 04
	tsb $00.b		; 04 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	sed		; F8
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ply		; 7A
	ply		; 7A
	inc $E6.b		; E6 E6
	sta ($81.b,X)		; 81 81
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ply		; 7A
	sta $E6.b		; 85 E6
	ora $7E81.w,Y		; 19 81 7E
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	cop $FD.b		; 02 FD
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	php		; 08
	phd		; 0B
	pha		; 48
	lsr $9B94.w		; 4E 94 9B
	sei		; 78
	adc [$20.b],Y		; 77 20
	and $406F70.l,X		; 3F 70 6F 40
	adc $47EFD0.l,X		; 7F D0 EF 47
	beq  71.b		; F0 47
	lda ($8F.b),Y		; B1 8F
	rts		; 60

	adc $C01F80.l		; 6F 80 1F C0
	eor $803F80.l,X		; 5F 80 3F 80
	lda $570100.l,X		; BF 00 01 57
	brk $17.b		; 00 17
	brk $A1.b		; 00 A1
	brk $FA.b		; 00 FA
	brk $ED.b		; 00 ED
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $5FA8.w,X		; FE A8 5F
	inx		; E8
	lda $05FF5E.l		; AF 5E FF 05
	sbc $FF12.w		; ED 12 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	sbc $1FEE71.l,X		; FF 71 EE 1F
	sbc $01BF07.l,X		; FF 07 BF 01
	ora $00D500.l		; 0F 00 D5 00
	inc $FF00.w,X		; FE 00 FF
	adc $009F00.l,X		; 7F 00 9F 00
	sbc [$00.b]		; E7 00
	sbc $BE40.w,Y		; F9 40 BE
	beq -35.b		; F0 DD
	rol A		; 2A
	inc $FF01.w,X		; FE 01 FF
	brk $06.b		; 00 06
	sbc #$05.b		; E9 05
	nop		; EA
	sbc $EC.b,S		; E3 EC
	cpx #$E3AF.w		; E0 AF E3
	cpx $BC73.w		; EC 73 BC
	and ($DE.b),Y		; 31 DE
	adc ($8C.b,S),Y		; 73 8C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $00CF00.l,X		; 3F 00 CF 00
	sbc $00FF00.l		; EF 00 FF 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $20DF01.l,X		; FF 01 DF 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FC.b		; 00 FC
	bpl -20.b		; 10 EC
	sbc $FCFD.w,X		; FD FD FC
	jsr ($B9F9.w,X)		; FC F9 B9
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	sbc $03FC.w,Y		; F9 FC 03
	jsr ($7D03.w,X)		; FC 03 7D
	cop $0C.b		; 02 0C
	ora $41.b,S		; 03 41
	asl $F8.b		; 06 F8
	ora [$F8.b]		; 07 F8
	ora [$F9.b]		; 07 F9
	asl $BF.b		; 06 BF
	cpx #$E0BF.w		; E0 BF E0
	lda $C0BFE0.l,X		; BF E0 BF C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $78.b		; 85 78
	cpx #$941D.w		; E0 1D 94
	adc #$E0.b		; 69 E0
	ora $0DF0.w,X		; 1D F0 0D
	sbc ($0E.b,S),Y		; F3 0E
	cpy #$E23E.w		; C0 3E E2
	trb $00FF.w		; 1C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00.w,X		; FD 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	lda [$00.b],Y		; B7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF48B7.l,X		; FF B7 48 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	inc $14.b,X		; F6 14
	inc $FA06.w		; EE 06 FA
	cop $FE.b		; 02 FE
	asl A		; 0A
	inc $03.b,X		; F6 03
	sbc $04FE06.l,X		; FF 06 FE 04
	inc $01FA.w,X		; FE FA 01
	plx		; FA
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FD.b,X)		; 01 FD
	brk $F8.b		; 00 F8
	ora ($FA.b,X)		; 01 FA
	ora ($04.b,X)		; 01 04
	tsb $80.b		; 04 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	xce		; FB
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl -17.b		; 10 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -17.b		; 10 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	asl A		; 0A
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	sbc $00.b,X		; F5 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $40FF00.l,X		; FF 00 FF 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $148080.l,X		; FF 80 80 14
	trb $50.b		; 14 50
	bvc  50.b		; 50 32
	and ($00.b)		; 32 00
	brk $24.b		; 00 24
	bit $00.b		; 24 00
	brk $00.b		; 00 00
	ora ($89.b,X)		; 01 89
	adc $51EB15.l,X		; 7F 15 EB 51
	lda $00CD32.l		; AF 32 CD 00
	sbc $00DB24.l,X		; FF 24 DB 00
	sbc $00FE01.l,X		; FF 01 FE 00
	ora #$07.b		; 09 07
	asl $03.b		; 06 03
	ora [$4C.b]		; 07 4C
	eor $308F88.l		; 4F 88 8F 30
	and $FC60.w,X		; 3D 60 FC
	cpy #$2FEE.w		; C0 EE 2F
	beq  73.b		; F0 49
	sed		; F8
	tsb $F8.b		; 04 F8
	eor $B0.b,S		; 43 B0
	sta [$60.b],Y		; 97 60
	ora $9CC2.w		; 0D C2 9C
	ora $2E.b,S		; 03 2E
	ora ($00.b),Y		; 11 00
	sbc $FFEE11.l,X		; FF 11 EE FF
	sbc $3FFBFF.l,X		; FF FF FB 3F
	sbc $0FFE1F.l,X		; FF 1F FE 0F
	adc $FFDF07.l,X		; 7F 07 DF FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $CF.b		; 00 CF
	brk $E7.b		; 00 E7
	brk $71.b		; 00 71
	bra -40.b		; 80 D8
	jsr $FF00.w		; 20 00 FF
	ora ($EE.b),Y		; 11 EE
	sbc $BBFFFF.l,X		; FF FF FF BB
	sbc $EEFFFF.l,X		; FF FF FF EE
	sbc $BB7FFF.l,X		; FF FF 7F BB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$E8.b]		; 07 E8
	ora $EA.b		; 05 EA
	sbc $EC.b,S		; E3 EC
	sbc [$A8.b]		; E7 A8
	sbc $EC.b,S		; E3 EC
	sbc [$E8.b]		; E7 E8
	sbc $EC.b,S		; E3 EC
	sbc [$A8.b]		; E7 A8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $20DF01.l,X		; FF 01 DF 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	cmp $6FCE41.l		; CF 41 CE 6F
	sbc $27CF4F.l		; EF 4F CF 27
	sbc [$67.b]		; E7 67
	cpx #$E067.w		; E0 67 E0
	sbc [$E7.b]		; E7 E7
	cmp $30CF30.l		; CF 30 CF 30
	sbc $30CE10.l		; EF 10 CE 30
	cpx #$E718.w		; E0 18 E7
	clc		; 18
	sbc [$18.b]		; E7 18
	sbc [$18.b]		; E7 18
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	jsr ($02FC.w,X)		; FC FC 02
	jsr ($0101.w,X)		; FC 01 01
	ora $FE.b,S		; 03 FE
	sbc $FDFC.w,X		; FD FC FD
	jsr ($F9FB.w,X)		; FC FB F9
	xce		; FB
	sbc $0003.w,Y		; F9 03 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	jsr ($02FC.w,X)		; FC FC 02
	jsr ($0101.w,X)		; FC 01 01
	ora $FE.b,S		; 03 FE
	sbc $FDFC.w,X		; FD FC FD
	jsr ($F9FB.w,X)		; FC FB F9
	xce		; FB
	sbc $0003.w,Y		; F9 03 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	sta $82.b,S		; 83 82
	stx $84.b		; 86 84
	stx $84.b		; 86 84
	jsr ($02FC.w,X)		; FC FC 02
	jsr ($0101.w,X)		; FC 01 01
	ora $FE.b,S		; 03 FE
	sbc $FDFC.w,X		; FD FC FD
	jsr ($F9FB.w,X)		; FC FB F9
	xce		; FB
	sbc $0003.w,Y		; F9 03 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	sbc $E2.b,S		; E3 E2
	inc $E4.b		; E6 E4
	inc $E4.b		; E6 E4
	jsr ($02FC.w,X)		; FC FC 02
	jsr ($0101.w,X)		; FC 01 01
	ora $FE.b,S		; 03 FE
	sbc $FDFC.w,X		; FD FC FD
	jsr ($F9FB.w,X)		; FC FB F9
	xce		; FB
	sbc $0003.w,Y		; F9 03 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	xce		; FB
	plx		; FA
	inc $FEFC.w,X		; FE FC FE
	jsr ($7F05.w,X)		; FC 05 7F
	.db $42, $14		; 42 14
	and #$39.b		; 29 39
	and $C57F.w,Y		; 39 7F C5
	ora ($60.b)		; 12 60
	ora ($A0.b,X)		; 01 A0
	brk $40.b		; 00 40
	brk $83.b		; 00 83
	asl $1442.w		; 0E 42 14
	and #$39.b		; 29 39
	sta $4220.w,Y		; 99 20 42
	asl A		; 0A
	.db $42, $14		; 42 14
	and #$39.b		; 29 39
	lda $012A.w,Y		; B9 2A 01
	asl $8C.b		; 06 8C
	and ($7B.b),Y		; 31 7B
	adc $C00025.l		; 6F 25 00 C0
	ora ($ED.b,X)		; 01 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $A00180.l,X		; 3F 80 01 A0
	brk $60.b		; 00 60
	ora ($FF.b,X)		; 01 FF
	and [$60.b]		; 27 60
	ora ($08.b,X)		; 01 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $002863.l,X		; 7F 63 28 00
	brk $00.b		; 00 00
	trb $10.b		; 14 10
	phy		; 5A
	ldy #$4001.w		; A0 01 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	trb $10.b		; 14 10
	brk $20.b		; 00 20
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	trb $90.b		; 14 90
	ora $E0.b		; 05 E0
	brk $8C.b		; 00 8C
	and ($7B.b),Y		; 31 7B
	adc $A00025.l		; 6F 25 00 A0
	brk $ED.b		; 00 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $A00060.l,X		; 3F 60 00 A0
	brk $60.b		; 00 60
	ora ($FF.b,X)		; 01 FF
	and [$40.b]		; 27 40
	brk $08.b		; 00 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $423DEF.l,X		; 7F EF 3D 42
	trb $E7.b		; 14 E7
	plp		; 28
	sty $66.b,X		; 94 66
	stz $0E.b		; 64 0E
	jsr $8001.w		; 20 01 80
	brk $40.b		; 00 40
	brk $23.b		; 00 23
	asl $1442.w		; 0E 42 14
	sbc [$2C.b]		; E7 2C
	stz $18.b,X		; 74 18
	sep #$09		; E2 09
	.db $42, $14		; 42 14
	php		; 08
	and ($14.b),Y		; 31 14
	asl $05A1.w,X		; 1E A1 05
	sty $7B31.w		; 8C 31 7B
	adc $600025.l		; 6F 25 00 60
	ora ($ED.b,X)		; 01 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $A00120.l,X		; 3F 20 01 A0
	brk $20.b		; 00 20
	ora ($39.b,X)		; 01 39
	ora $A50100.l,X		; 1F 00 01 A5
	trb $EF.b		; 14 EF
	and $6739.w,X		; 3D 39 67
	mvp $A0,$7D		; 44 7D A0
	brk $00.b		; 00 00
	ora ($60.b,X)		; 01 60
	ora ($00.b,X)		; 01 00
	ora ($A0.b,X)		; 01 A0
	brk $00.b		; 00 00
	ora ($40.b,X)		; 01 40
	ora ($40.b,X)		; 01 40
	ora ($AD.b,X)		; 01 AD
	cop $00.b		; 02 00
	ora ($60.b,X)		; 01 60
	ora ($80.b,X)		; 01 80
	ora ($B4.b,X)		; 01 B4
	asl $1E0E.w		; 0E 0E 1E
	sbc $05C17F.l,X		; FF 7F C1 05
	lda $7B35.w		; AD 35 7B
	adc $020046.l		; 6F 46 00 02
	asl A		; 0A
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $0E437F.l,X		; FF 7F 43 0E
	rep #$09		; C2 09
	brk $01.b		; 00 01
	sbc $16852B.l,X		; FF 2B 85 16
	php		; 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $002442.l,X		; 7F 42 24 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $84.b		; 00 84
	ora ($00.b,X)		; 01 00
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $E6.b		; 00 E6
	brk $E5.b		; 00 E5
	brk $D6.b		; 00 D6
	phy		; 5A
	ldy #$AD00.w		; A0 00 AD
	and $7B.b,X		; 35 7B
	adc $E00046.l		; 6F 46 00 E0
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C20120.l,X		; 7F 20 01 C2
	ora #$00.b		; 09 00
	ora ($FF.b,X)		; 01 FF
	pld		; 2B
	rts		; 60

	ora ($08.b,X)		; 01 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $803DEF.l,X		; 7F EF 3D 80
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	ora ($C0.b,X)		; 01 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($4A.b,X)		; 01 4A
	cop $C0.b		; 02 C0
	brk $20.b		; 00 20
	ora ($40.b,X)		; 01 40
	ora ($51.b,X)		; 01 51
	asl $19AB.w		; 0E AB 19
	and $8167.w,Y		; 39 67 81
	ora $AD.b		; 05 AD
	and $7B.b,X		; 35 7B
	adc $C20046.l		; 6F 46 00 C2
	ora #$FF.b		; 09 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $620E03.l,X		; 7F 03 0E 62
	ora #$C0.b		; 09 C0
	brk $39.b		; 00 39
	ora $A51645.l,X		; 1F 45 16 A5
	trb $EF.b		; 14 EF
	and $6739.w,X		; 3D 39 67
	mvp $16,$7D		; 44 7D 16
	inc A		; 1A
	eor $3AFD09.l		; 4F 09 FD 3A
	tay		; A8
	brk $16.b		; 00 16
	inc A		; 1A
	eor $00A809.l		; 4F 09 A8 00
	phd		; 0B
	ora #$16.b		; 09 16
	inc A		; 1A
	eor $00A809.l		; 4F 09 A8 00
	adc $094F11.l		; 6F 11 4F 09
	asl $1A.b,X		; 16 1A
	tay		; A8
	brk $D2.b		; 00 D2
	ora $35AD.w,X		; 1D AD 35
	tda		; 7B
	adc $360045.l		; 6F 45 00 36
	rol $00.b		; 26 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	bvc -103.b		; 50 99
	rol $090B.w		; 2E 0B 09
	sbc $FF3A.w,X		; FD 3A FF
	pld		; 2B
	sbc $283A.w,X		; FD 3A 28
	and $B4.b		; 25 B4
	lsr $FF.b,X		; 56 FF
	adc $367EE6.l,X		; 7F E6 7E 36
	adc [$81.b],Y		; 77 81
	jsr $61CB.w		; 20 CB 61
	and ($46.b),Y		; 31 46
	rol $59.b		; 26 59
	sta ($20.b,X)		; 81 20
	cmp ($3C.b,X)		; C1 3C
	sbc $7FFF3D.l		; EF 3D FF 7F
	and ($46.b),Y		; 31 46
	sbc [$1C.b]		; E7 1C
	lda $1F35.w		; AD 35 1F
	trb $81.b		; 14 81
	jsr $08CF.w		; 20 CF 08
	sty $AD31.w		; 8C 31 AD
	and $7B.b,X		; 35 7B
	adc $4A0046.l		; 6F 46 00 4A
	and #$FF.b		; 29 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $6B2108.l,X		; 7F 08 21 6B
	and $1CE7.w		; 2D E7 1C
	sbc $1CE72B.l,X		; FF 2B E7 1C
	php		; 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $B23DEF.l,X		; 7F EF 3D B2
	ror $61.b		; 66 61
	trb $5169.w		; 1C 69 51
	sbc $48E43D.l		; EF 3D E4 48
	adc ($18.b,X)		; 61 18
	lda ($30.b,X)		; A1 30
	lda $3935.w		; AD 35 39
	adc [$CE.b]		; 67 CE
	and $14A5.w,Y		; 39 A5 14
	rtl		; 6B

	and $1019.w		; 2D 19 10
	adc ($18.b,X)		; 61 18
	ldy $4A08.w		; AC 08 4A
	and #$AD.b		; 29 AD
	and $7B.b,X		; 35 7B
	adc $080046.l		; 6F 46 00 08
	and ($FF.b,X)		; 21 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $0818C6.l,X		; 7F C6 18 08
	and ($A5.b,X)		; 21 A5
	trb $39.b		; 14 39
	ora $A514A5.l,X		; 1F A5 14 A5
	trb $EF.b		; 14 EF
	and $6739.w,X		; 3D 39 67
	mvp $81,$7D		; 44 7D 81
	tsb $E2.b		; 04 E2
	php		; 08
	mvp $C5,$0D		; 44 0D C5
	ora ($8A.b)		; 12 8A
	ora $E2.b		; 05 E2
	php		; 08
	mvp $83,$0D		; 44 0D 83
	asl $058A.w		; 0E 8A 05
	sbc $36.b,X		; F5 36
	cpy JOY1H.w		; CC 19 42
	asl A		; 0A
	mvp $E2,$0D		; 44 0D E2
	php		; 08
	cpy $0119.w		; CC 19 01
	asl $8C.b		; 06 8C
	and ($7B.b),Y		; 31 7B
	adc $C03825.l		; 6F 25 38 C0
	ora ($ED.b,X)		; 01 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $A00180.l,X		; 3F 80 01 A0
	brk $60.b		; 00 60
	ora ($FF.b,X)		; 01 FF
	and [$60.b]		; 27 60
	ora ($08.b,X)		; 01 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $003821.l,X		; 7F 21 38 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	ora ($61.b,X)		; 01 61
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	ora ($61.b,X)		; 01 61
	brk $CC.b		; 00 CC
	ora ($A3.b),Y		; 11 A3
	brk $20.b		; 00 20
	ora ($20.b,X)		; 01 20
	brk $00.b		; 00 00
	brk $A3.b		; 00 A3
	brk $E0.b		; 00 E0
	brk $8C.b		; 00 8C
	and ($7B.b),Y		; 31 7B
	adc $A00025.l		; 6F 25 00 A0
	brk $ED.b		; 00 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $A00060.l,X		; 3F 60 00 A0
	brk $60.b		; 00 60
	ora ($FF.b,X)		; 01 FF
	and [$40.b]		; 27 40
	brk $08.b		; 00 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $287F35.l,X		; 7F 35 7F 28
	and ($8B.b,X)		; 21 8B
	and $39EE.w		; 2D EE 39
	clc		; 18
	adc $30.b,S		; 63 30
	.db $42, $8B		; 42 8B
	and $39EE.w		; 2D EE 39
	dec $5A.b,X		; D6 5A
	bmi  66.b		; 30 42
	txy		; 9B
	adc $944A72.l		; 6F 72 4A 94
	eor ($EE.b)		; 52 EE
	and $2D8B.w,Y		; 39 8B 2D
	adc ($4A.b)		; 72 4A
	eor ($4A.b)		; 52 4A
	sty $7B31.w		; 8C 31 7B
	adc $100025.l		; 6F 25 00 10
	.db $42, $ED		; 42 ED
	and $ED3FED.l,X		; 3F ED 3F ED
	and $D639CE.l,X		; 3F CE 39 D6
	phy		; 5A
	and ($46.b),Y		; 31 46
	sbc $35AD3B.l,X		; FF 3B AD 35
	sbc $52943D.l		; EF 3D 94 52
	sbc $7FF87F.l,X		; FF 7F F8 7F
	rol $29.b		; 26 29
	and $779B4E.l		; 2F 4E 9B 77
	dec $1E.b		; C6 1E
	rol $29.b		; 26 29
	ora $29.b		; 05 29
	rti		; 40

	ora ($84.b),Y		; 11 84
	asl $C6.b,X		; 16 C6
	brk $C6.b		; 00 C6
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	ora ($26.b)		; 12 26
	and #$C6.b		; 29 C6
	brk $00.b		; 00 00
	brk $22.b		; 00 22
	asl $35AD.w		; 0E AD 35
	tda		; 7B
	adc $E13846.l		; 6F 46 38 E1
	ora #$20.b		; 09 20
	ora ($80.b),Y		; 11 80
	ora $C0.b		; 05 C0
	tsb $A0.b		; 04 A0
	ora $80.b		; 05 80
	asl A		; 0A
	bra   5.b		; 80 05
	sbc $05802B.l,X		; FF 2B 80 05
	php		; 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $6B7FF8.l,X		; 7F F8 7F 6B
	and ($2F.b),Y		; 31 2F
	lsr $779B.w		; 4E 9B 77
	clc		; 18
	adc $26.b,S		; 63 26
	and #$05.b		; 29 05
	and #$40.b		; 29 40
	ora ($D6.b),Y		; 11 D6
	phy		; 5A
	dec $00.b		; C6 00
	dec $00.b		; C6 00
	brk $00.b		; 00 00
	sty $52.b,X		; 94 52
	sty $0831.w		; 8C 31 08
	and ($00.b,X)		; 21 00
	brk $52.b		; 00 52
	lsr A		; 4A
	lda $7B35.w		; AD 35 7B
	adc $100046.l		; 6F 46 00 10
	.db $42, $20		; 42 20
	ora ($80.b),Y		; 11 80
	ora $C0.b		; 05 C0
	tsb $CE.b		; 04 CE
	and $5AD6.w,Y		; 39 D6 5A
	and ($46.b),Y		; 31 46
	sbc $35AD3B.l,X		; FF 3B AD 35
	sbc $63183D.l		; EF 3D 18 63
	sbc $7E007F.l,X		; FF 7F 00 7E
	bra   0.b		; 80 00
	cpy #$4000.w		; C0 00 40
	ora ($60.b,X)		; 01 60
	cop $80.b		; 02 80
	brk $08.b		; 00 08
	and ($84.b,X)		; 21 84
	bpl  96.b		; 10 60
	cop $00.b		; 02 00
	brk $08.b		; 00 08
	and ($84.b,X)		; 21 84
	bpl  32.b		; 10 20
	cop $E0.b		; 02 E0
	ror $08.b,X		; 76 08
	and ($84.b,X)		; 21 84
	bpl -32.b		; 10 E0
	ora ($AD.b,X)		; 01 AD
	and $7B.b,X		; 35 7B
	adc $A00046.l		; 6F 46 00 A0
	ora ($FF.b,X)		; 01 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C00160.l,X		; 7F 60 01 C0
	brk $40.b		; 00 40
	ora ($FF.b,X)		; 01 FF
	pld		; 2B
	rti		; 40

	ora ($08.b,X)		; 01 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $877A6A.l,X		; 7F 6A 7A 87
	and ($2E.b),Y		; 31 2E
	lsr $E2.b		; 46 E2
	jsr $0260.w		; 20 60 02
	sta [$31.b]		; 87 31
.ACCU 8
	sep #$20		; E2 20
	ldy #$6000.w		; A0 00 60
	cop $87.b		; 02 87
	and ($43.b),Y		; 31 43
	ora ($A0.b,X)		; 01 A0
	brk $20.b		; 00 20
	cop $27.b		; 02 27
	cop $43.b		; 02 43
	ora ($A0.b,X)		; 01 A0
	brk $E0.b		; 00 E0
	ora ($AD.b,X)		; 01 AD
	and $7B.b,X		; 35 7B
	adc $A00046.l		; 6F 46 00 A0
	ora ($FF.b,X)		; 01 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C00160.l,X		; 7F 60 01 C0
	brk $40.b		; 00 40
	ora ($FF.b,X)		; 01 FF
	pld		; 2B
	rti		; 40

	ora ($08.b,X)		; 01 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $602863.l,X		; 7F 63 28 60
	tsb BGMODE.w		; 0C 05 21
	brk $00.b		; 00 00
	bra   1.b		; 80 01
	rts		; 60

	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	rti		; 40

	ora ($60.b,X)		; 01 60
	tsb $0020.w		; 0C 20 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	jsr $0000.w		; 20 00 00
	brk $C0.b		; 00 C0
	brk $AD.b		; 00 AD
	and $7B.b,X		; 35 7B
	adc $800046.l		; 6F 46 00 80
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C00040.l,X		; 7F 40 00 C0
	brk $40.b		; 00 40
	ora ($FF.b,X)		; 01 FF
	pld		; 2B
	jsr $0800.w		; 20 00 08
	and ($94.b,X)		; 21 94
	eor ($FF.b)		; 52 FF
	adc $463DEF.l,X		; 7F EF 3D 46
	and #$CC.b		; 29 CC
	and $18A2.w,Y		; 39 A2 18
	rts		; 60

	cop $46.b		; 02 46
	and #$A2.b		; 29 A2
	clc		; 18
	bra   0.b		; 80 00
	jsr $4602.w		; 20 02 46
	and #$02.b		; 29 02
	ora ($A0.b,X)		; 01 A0
	brk $E0.b		; 00 E0
	ora ($C5.b,X)		; 01 C5
	ora ($02.b,X)		; 01 02
	ora ($80.b,X)		; 01 80
	brk $A0.b		; 00 A0
	ora ($AD.b,X)		; 01 AD
	and $7B.b,X		; 35 7B
	adc $604400.l		; 6F 00 44 60
	ora ($FF.b,X)		; 01 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $A00140.l,X		; 7F 40 01 A0
	brk $00.b		; 00 00
	ora ($39.b,X)		; 01 39
	ora $A50100.l,X		; 1F 00 01 A5
	trb $EF.b		; 14 EF
	and $6739.w,X		; 3D 39 67
	inc $987E.w		; EE 7E 98
	ora ($90.b,X)		; 01 90
	brk $9F.b		; 00 9F
	jsl $980198.l		; 22 98 01 98
	ora ($90.b,X)		; 01 90
	brk $08.b		; 00 08
	brk $56.b		; 00 56
	ora ($98.b,X)		; 01 98
	ora ($90.b,X)		; 01 90
	brk $08.b		; 00 08
	brk $35.b		; 00 35
	ora ($90.b,X)		; 01 90
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	brk $AD.b		; 00 AD
	and $7B.b,X		; 35 7B
	adc $D20045.l		; 6F 45 00 D2
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	bvc -79.b		; 50 B1
	brk $AB.b		; 00 AB
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	pld		; 2B
	bcc   0.b		; 90 00
	plp		; 28
	and $B4.b		; 25 B4
	lsr $FF.b,X		; 56 FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 037FFF. Skipping.
.ENDS
