.BANK 11 SLOT 0
.ORG $0000

.SECTION "Bank11" FORCE

	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $36.b		; 00 36
	jsr $03E9.w		; 20 E9 03
	inc A		; 1A
	jsr $4554.w		; 20 54 45
	eor ($54.b,S),Y		; 53 54
	mvp $56,$52		; 44 52 56
	eor $2E.b		; 45 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($0D00.w)		; 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D9D4.w		; E9 D4 D9
	cmp $270DED.l,X		; DF ED 0D 27
	and #$101B.w		; 29 1B 10
	ora $F1.b,S		; 03 F1
	sbc ($02.b)		; F2 02
	ora #$FC02.w		; 09 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	cpx #$0E.b		; E0 0E
	eor [$A9.b]		; 47 A9
	cpx $A0E2.w		; EC E2 A0
	ora $006204.l		; 0F 04 62 00
	inc $20F2.w		; EE F2 20
	inc $DE84.w,X		; FE 84 DE
	bit $0C.b,X		; 34 0C
	trb $0E.b		; 14 0E
	bit $B1.b		; 24 B1
	lsr $EE84.w,X		; 5E 84 EE
	rol $0D.b,X		; 36 0D
	inc $20DE.w,X		; FE DE 20
	cmp $8446.w		; CD 46 84
	stp		; DB
	sbc ($43.b,S),Y		; F3 43
	cmp ($53.b)		; D2 53
	phd		; 0B
	lda ($5F.b,X)		; A1 5F
	bra -35.b		; 80 DD
	cop $2F.b		; 02 2F
	ora $57.b,S		; 03 57
	adc ($03.b,X)		; 61 03
	and ($84.b),Y		; 31 84
	sbc $BD24.w		; ED 24 BD
	sbc $DFE021.l,X		; FF 21 E0 DF
	asl $CF74.w,X		; 1E 74 CF
	trb $E3.b		; 14 E3
	jmp $955EA1.l		; 5C A1 5E 95
	lsr $4274.w,X		; 5E 74 42
	.db $42, $D4		; 42 D4
	eor $E31F23.l		; 4F 23 1F E3
	tas		; 1B
	sty $FF.b		; 84 FF
	dec $F221.w,X		; DE 21 F2
	mvp $3F,$F0		; 44 F0 3F
	jsl $C12F84.l		; 22 84 2F C1
	and $EDD0.w		; 2D D0 ED
	cmp ($FB.b),Y		; D1 FB
	cop $74.b		; 02 74
	lda ($3D.b),Y		; B1 3D
	and $30.b,X		; 35 30
	cpy #$54.b		; C0 54
	xba		; EB
	sbc $EAEE70.l		; EF 70 EE EA
	txs		; 9A
	cpy $C2A9.w		; CC A9 C2
	dex		; CA
	inc $EC80.w		; EE 80 EC
	cmp $DCBC.w,X		; DD BC DC
	cmp ($42.b)		; D2 42
	brk $11.b		; 00 11
	stz $11.b,X		; 74 11
	cpy #$66.b		; C0 66
	phx		; DA
	eor $BD4A93.l		; 4F 93 4A BD
	stz $2D.b,X		; 74 2D
	sbc $10.b,S		; E3 10
	bit $20.b,X		; 34 20
	and $806EA4.l		; 2F A4 6E 80
	mvp $63,$35		; 44 35 63
	ora ($25.b),Y		; 11 25
	eor $743015.l		; 4F 15 30 74
	ora $DFD3AA.l		; 0F AA D3 DF
	bvc  20.b		; 50 14
	lsr $80B2.w,X		; 5E B2 80
	and ($E0.b,X)		; 21 E0
	lsr $42.b,X		; 56 42
	and ($22.b,S),Y		; 33 22
	sbc $0C9057.l,X		; FF 57 90 0C
	cpy #$1F.b		; C0 1F
	cmp $120010.l,X		; DF 10 00 12
	brk $84.b		; 00 84
	jsl $F2FD10.l		; 22 10 FD F2
	jsr ($3DC1.w,X)		; FC C1 3D
	cmp $BB9B80.l,X		; DF 80 9B BB
	tyx		; BB
	cmp $BBA90E.l		; CF 0E A9 BB
	sbc $23BF84.l		; EF 84 BF 23
	sbc $FFF0.w,X		; FD F0 FF
	brk $00.b		; 00 00
	and $52CF84.l,X		; 3F 84 CF 52
	inc $0113.w		; EE 13 01
	jsr $4EF3.w		; 20 F3 4E
	stz $C2.b,X		; 74 C2
	adc $FD.b,S		; 63 FD
	sbc $2F.b,X		; F5 2F
	cmp $8444D2.l,X		; DF D2 44 84
	bpl   2.b		; 10 02
	rol $2FC0.w		; 2E C0 2F
	bne  48.b		; D0 30
	jsl $35FF84.l		; 22 84 FF 35
	sbc $D2EC.w,X		; FD EC D2
	ora $803D03.l		; 0F 03 3D 80
	trb $43.b		; 14 43
	eor $EB.b,S		; 43 EB
	cmp $FEBC.w		; CD BC FE
	bne -128.b		; D0 80
	and ($14.b)		; 32 14
	rol $F9E1.w,X		; 3E E1 F9
	txy		; 9B
	cpy $80D0.w		; CC D0 80
	and ($2F.b,S),Y		; 33 2F
	cmp $FA35.w		; CD 35 FA
	cmp $844513.l		; CF 13 45 84
	asl $BFDB.w,X		; 1E DB BF
	phd		; 0B
	ldx $4135.w,Y		; BE 35 41
	cmp $BB90.w,X		; DD 90 BB
	tyx		; BB
	tsx		; BA
	lda $EF0F.w		; AD 0F EF
	ora ($D9.b),Y		; 11 D9
	bcc -99.b		; 90 9D
	ora ($FD.b),Y		; 11 FD
	ora $31.b,S		; 03 31
	ora ($0F.b,X)		; 01 0F
	inc $1084.w		; EE 84 10
	cpx $16FF.w		; EC FF 16
	bvc -34.b		; 50 DE
	trb $5F.b		; 14 5F
	sty $DE.b,X		; 94 DE
	jsl $32F01E.l		; 22 1E F0 32
	jmp.w [$1E14]		; DC 14 1E
	bra -20.b		; 80 EC
	cmp ($40.b),Y		; D1 40
	txy		; 9B
	ora ($01.b)		; 12 01
	ora $0C9417.l,X		; 1F 17 94 0C
	ora $4E.b		; 05 4E
	bne  32.b		; D0 20
	cmp $2102.w,X		; DD 02 21
	sty $00.b,X		; 94 00
	ora ($1E.b)		; 12 1E
	cpx $42D0.w		; EC D0 42
	wai		; CB
	bit $84.b		; 24 84
	asl $2214.w,X		; 1E 14 22
	jsr $0E00.w		; 20 00 0E
	phx		; DA
	cmp ($84.b,X)		; C1 84
	bmi -36.b		; 30 DC
	trb $1B.b		; 14 1B
	stz $6314.w		; 9C 14 63
	and $94.b		; 25 94
	and ($02.b),Y		; 31 02
	asl $BCBC.w		; 0E BC BC
	cop $03.b		; 02 03
	eor ($94.b,S),Y		; 53 94
	jsl $0F9B3E.l		; 22 3E 9B 0F
	cpx #$33.b		; E0 33
	eor $2E.b,X		; 55 2E
	sty $03.b,X		; 94 03
	jsr ($EF0F.w,X)		; FC 0F EF
	and $CE3ED1.l,X		; 3F D1 3E CE
	sty $22.b,X		; 94 22
	brk $11.b		; 00 11
	and ($1D.b)		; 32 1D
	sbc ($0D.b,X)		; E1 0D
	ldx $2494.w,Y		; BE 94 24
	and $CD2FD1.l		; 2F D1 2F CD
	inc $20DF.w,X		; FE DF 20
	sty $E0.b,X		; 94 E0
	eor $2E.b		; 45 2E
	cpx $4D.b		; E4 4D
	bcs  66.b		; B0 42
	bmi -92.b		; 30 A4
	inc $4035.w,X		; FE 35 40
	cop $41.b		; 02 41
	cmp $FDDF.w,X		; DD DF FD
	sty $BD.b,X		; 94 BD
	ora $41.b,X		; 15 41
	inc $E912.w		; EE 12 E9
	ldx $8420.w		; AE 20 84
	plb		; AB
	rol $3D.b,X		; 36 3D
	dec $EB12.w		; CE 12 EB
	cpy #$2F.b		; C0 2F
	sty $DD.b,X		; 94 DD
	sbc $051C23.l		; EF 23 1C 05
	bmi -34.b		; 30 DE
	bit $A4.b		; 24 A4
	ora ($26.b),Y		; 11 26
	.db $62, $25, $41		; 62 25 41
	sbc $CCDC.w		; ED DC CC
	sty $CC.b,X		; 94 CC
	cmp $224313.l,X		; DF 13 43 22
	asl $DDDD.w		; 0E DD DD
	sty $CC.b		; 84 CC
	lda $3E35.w,X		; BD 35 3E
	pea $BA3F.w		; F4 3F BA
	cmp $EC84.w,X		; DD 84 EC
	plb		; AB
	ora $40.b		; 05 40
	sbc ($50.b)		; F2 50
	beq -53.b		; F0 CB
	ldy $00.b		; A4 00
	asl $53F2.w		; 0E F2 53
	bpl  53.b		; 10 35
	mvn $A4,$0F		; 54 0F A4
	ora ($1D.b,S),Y		; 13 1D
	ldy $FFEF.w		; AC EF FF
	inc $2F23.w		; EE 23 2F
	ldy #$FF.b		; A0 FF
	ora ($EA.b,X)		; 01 EA
	sta $A9BB.w,Y		; 99 BB A9
	lda $94FE.w,X		; BD FE 94
	dec $DC10.w		; CE 10 DC
	bne  33.b		; D0 21
	inc $1D02.w,X		; FE 02 1D
	cpy #$EE.b		; C0 EE
	beq  15.b		; F0 0F
	inc $00F0.w		; EE F0 00
	ora ($35.b,X)		; 01 35
	ldy $30.b		; A4 30
	and $30.b		; 25 30
	tsx		; BA
	dec $CFEC.w,X		; DE EC CF
	ora ($94.b,S),Y		; 13 94
	bmi  35.b		; 30 23
	bpl -36.b		; 10 DC
	cmp $EFDD.w		; CD DD EF
	and ($A0.b)		; 32 A0
	cpy $EEDE.w		; CC DE EE
	wai		; CB
	tax		; AA
	sta $BB99.w,Y		; 99 99 BB
	ldy #$BB.b		; A0 BB
	lda #$CD9A.w		; A9 9A CD
	dex		; CA
	ldy $2601.w		; AC 01 26
	ldy $64.b		; A4 64
	ora ($63.b,S),Y		; 13 63
	asl $EDED.w		; 0E ED ED
	cmp $94FF.w		; CD FF 94
	lda $021033.l		; AF 33 10 02
	asl $E0CC.w,X		; 1E CC E0
	sbc $23DF94.l,X		; FF 94 DF 23
	ora $DBFFF0.l,X		; 1F F0 FF DB
	sbc ($40.b,X)		; E1 40
	ldy $E0.b		; A4 E0
	ora ($0F.b,X)		; 01 0F
	beq  33.b		; F0 21
	inc $42F2.w,X		; FE F2 42
	ldy $E0.b		; A4 E0
	adc [$31.b]		; 67 31
	bit $30.b		; 24 30
	sbc $EDDD.w,X		; FD DD ED
	sty $AB.b,X		; 94 AB
	cpx #$20.b		; E0 20
	ora ($33.b,X)		; 01 33
	phx		; DA
	cmp ($1D.b),Y		; D1 1D
	sty $AB.b		; 84 AB
	pea $9C4E.w		; F4 4E 9C
	jsl $71B2C9.l		; 22 C9 B2 71
	sty $CD.b,X		; 94 CD
	ora ($FE.b),Y		; 11 FE
	ora ($1F.b)		; 12 1F
	cmp $A42C67.l,X		; DF 67 2C A4
	ora $53.b		; 05 53
	eor $22.b,S		; 43 22
	and $FB.b,S		; 23 FB
	cmp $94ED.w		; CD ED 94
	sta $40D3.w,Y		; 99 D3 40
	sbc ($51.b)		; F2 51
	cpx $FFDD.w		; EC DD FF
	sty $B9.b		; 84 B9
	tsb $1C.b		; 04 1C
	bcs  16.b		; B0 10
	tyx		; BB
	pea $944C.w		; F4 4C 94
	dec $E1F0.w		; CE F0 E1
	eor $DF.b,S		; 43 DF
	eor [$5C.b]		; 47 5C
	ldy $A4.b,X		; B4 A4
	adc $31.b		; 65 31
	trb $43.b		; 14 43
	ora $ECDE.w		; 0D DE EC
	lda $DF94.w,X		; BD 94 DF
	ora $1F44F2.l		; 0F F2 44 1F
	sbc $84FDFF.l		; EF FF FD 84
	plb		; AB
	ora $1FF1AB.l,X		; 1F AB F1 1F
	ora ($22.b),Y		; 11 22
	tas		; 1B
	ldy $FF.b		; A4 FF
	brk $FF.b		; 00 FF
	ora ($11.b)		; 12 11
	ora ($23.b),Y		; 11 23
	mvn $21,$94		; 54 94 21
	adc [$2D.b]		; 67 2D
	wai		; CB
	dec $9FDA.w,X		; DE DA 9F
	bpl -124.b		; 10 84
	lda $F2FD.w,X		; BD FD F2
	asl A		; 0A
	lda ($30.b),Y		; B1 30
	inc $B0DD.w		; EE DD B0
	inc $CCDC.w		; EE DC CC
	cmp $DDDE.w,X		; DD DE DD
	dec $A4EE.w,X		; DE EE A4
	jsr $02FE.w		; 20 FE 02
	and ($10.b),Y		; 31 10
	trb $41.b		; 14 41
	and $94.b,S		; 23 94
	.db $62, $11, $DB		; 62 11 DB
	ldy $BDB9.w,X		; BC B9 BD
	sbc $EE9423.l		; EF 23 94 EE
	and ($FE.b,S),Y		; 33 FE
	cpx #$01.b		; E0 01
	xce		; FB
	bne  46.b		; D0 2E
	sty $CD.b,X		; 94 CD
	cop $20.b		; 02 20
	inc $1F12.w		; EE 12 1F
	ora ($1F.b,X)		; 01 1F
	sty $FF.b,X		; 94 FF
	and ($31.b,S),Y		; 33 31
	asl $71.b,X		; 16 71
	and $41.b		; 25 41
	ora ($94.b,S),Y		; 13 94
	inc $DBFF.w,X		; FE FF DB
	wai		; CB
	dec $EFFF.w		; CE FF EF
	ora ($84.b),Y		; 11 84
	ora $51.b,S		; 03 51
	sbc $FAAEFB.l		; EF FB AE FA
	sta $1F8433.l,X		; 9F 33 84 1F
	dec $4046.w,X		; DE 46 40
	inc $6004.w,X		; FE 04 60
	dec $2594.w		; CE 94 25
	eor $FD.b,S		; 43 FD
	ora $42.b,X		; 15 42
	brk $22.b		; 00 22
	rol $BC94.w		; 2E 94 BC
	sbc $01BDDC.l,X		; FF DC BD 01
	bpl -17.b		; 10 EF
	jsl $ED2184.l		; 22 84 21 ED
	brk $FA.b		; 00 FA
	cmp $C0DC31.l		; CF 31 DC C0
	sty $36.b		; 84 36
	rol $3015.w		; 2E 15 30
	pea $2331.w		; F4 31 23
	ora ($84.b)		; 12 84
	.db $42, $EE		; 42 EE
	mvn $25,$00		; 54 00 25
	ora $84EFDD.l,X		; 1F DD EF 84
	inc $C1BB.w,X		; FE BB C1
	ora $10F1DE.l		; 0F DE F1 10
	inc $1284.w,X		; FE 84 12
	sbc $24CE.w,X		; FD CE 24
	phd		; 0B
	cmp ($31.b,X)		; C1 31
	dec $0284.w,X		; DE 84 02
	eor $FE.b,S		; 43 FE
	and ($31.b,S),Y		; 33 31
	ora $32.b,S		; 03 32
	inc $E374.w,X		; FE 74 E3
	and ($EB.b,X)		; 21 EB
	ora $21.b,S		; 03 21
	asl $3DF2.w,X		; 1E F2 3D
	stz $99.b		; 64 99
	cmp #$CABB.w		; C9 BB CA
	sbc ($2F.b)		; F2 2F
	sbc ($3F.b)		; F2 3F
	stz $E0.b,X		; 74 E0
	jmp.w [$EF11]		; DC 11 EF
	sbc ($2F.b),Y		; F1 2F
	and $00.b,S		; 23 00
	stz $74.b		; 64 74
	ora $01.b		; 05 01
	trb $51.b		; 14 51
	cmp ($55.b),Y		; D1 55
	lda #$4470.w		; A9 70 44
	jsr $99EA.w		; 20 EA 99
	ldy $CCAA.w		; AC AA CC
	inc $0E74.w		; EE 74 0E
	brk $10.b		; 00 10
	jsl $04E142.l		; 22 42 E1 04
	bpl 116.b		; 10 74
	ora ($01.b),Y		; 11 01
	ora $14.b,S		; 03 14
	ora ($13.b),Y		; 11 13
	and $1C7411.l,X		; 3F 11 74 1C
	sbc ($FC.b,X)		; E1 FC
	sbc ($E0.b)		; F2 E0
	ora $64CDAE.l		; 0F AE CD 64
	tsx		; BA
	ldx $EE1E.w		; AE 1E EE
	sbc ($2F.b,X)		; E1 2F
	rol $643B.w		; 2E 3B 64
	sbc $22FEEB.l		; EF EB FE 22
	xce		; FB
	adc $FC.b,S		; 63 FC
	sbc $CF3B64.l,X		; FF 64 3B CF
	sbc $FF.b,S		; E3 FF
	sbc [$30.b],Y		; F7 30
	bmi  12.b		; 30 0C
	rts		; 60

	cpy #$C9.b		; C0 C9
	sta $9999.w,Y		; 99 99 99
	sta $CCC0.w,Y		; 99 C0 CC
	bvc -112.b		; 50 90
	brk $77.b		; 00 77
	brk $77.b		; 00 77
	ora [$77.b]		; 07 77
	ora [$64.b]		; 07 64
	bpl   0.b		; 10 00
	pei ($04.b)		; D4 04
	ora $1004.w		; 0D 04 10
	stz $4064.w		; 9C 64 40
	brk $00.b		; 00 00
	rti		; 40

	brk $45.b		; 00 45
	jmp.w [$5010]		; DC 10 50
	adc [$70.b],Y		; 77 70
	brk $00.b		; 00 00
	bcc   9.b		; 90 09
	bcc   7.b		; 90 07
	rts		; 60

	cmp #$00CC.w		; C9 CC 00
	cpy #$04.b		; C0 04
	rti		; 40

	brk $0C.b		; 00 0C
	bvc -103.b		; 50 99
	bcc 112.b		; 90 70
	sta $7707.w,Y		; 99 07 77
	adc [$77.b],Y		; 77 77
	bvc 112.b		; 50 70
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	adc [$77.b],Y		; 77 77
	rts		; 60

	eor [$40.b]		; 47 40
	mvp $CC,$0C		; 44 0C CC
	cpy $00C0.w		; CC C0 00
	stz $00.b		; 64 00
	brk $CC.b		; 00 CC
	ora $0F0BC3.l		; 0F C3 0B 0F
	sbc ($60.b,S),Y		; F3 60
	cpy $CCCC.w		; CC CC CC
	cpy $9999.w		; CC 99 99
	stz $54C0.w		; 9C C0 54
	sta $00070F.l,X		; 9F 0F 07 00
	brk $71.b		; 00 71
	ora ($90.b,X)		; 01 90
	bvc   9.b		; 50 09
	sta $7090.w,Y		; 99 90 70
	brk $77.b		; 00 77
	ora [$77.b]		; 07 77
	stz $4D.b		; 64 4D
	brk $04.b		; 00 04
	trb $DD.b		; 14 DD
	cpy #$04.b		; C0 04
	cpy #$64.b		; C0 64
	tsb $DC.b		; 04 DC
	ora $00CC44.l		; 0F 44 CC 00
	tsb $64FC.w		; 0C FC 64
	beq  63.b		; F0 3F
	phd		; 0B
	ora $C3.b,S		; 03 C3
	jsr ($4CF3.w,X)		; FC F3 4C
	rts		; 60

	sta $C99C.w,Y		; 99 9C C9
	cpy $0CCC.w		; CC CC 0C
	cpy $500C.w		; CC 0C 50
	sta $9099.w,Y		; 99 99 90
	ora #$0090.w		; 09 90 00
	sta $6000.w,Y		; 99 00 60
	tsb $00.b		; 04 00
	adc [$77.b],Y		; 77 77
	eor [$74.b]		; 47 74
	adc [$44.b],Y		; 77 44
	rts		; 60

	eor [$40.b]		; 47 40
	eor [$44.b]		; 47 44
	rti		; 40

	cpy #$40.b		; C0 40
	brk $60.b		; 00 60
	tsb $0CCC.w		; 0C CC 0C
	stz $9C0C.w		; 9C 0C 9C
	cpy $70CC.w		; CC CC 70
	inc $CCCC.w		; EE CC CC
	cpy $CECA.w		; CC CA CE
	cmp #$60AA.w		; C9 AA 60
	stz $CC0C.w		; 9C 0C CC
	cpy #$00.b		; C0 00
	mvp $0C,$00		; 44 00 0C
	rts		; 60

	stz $0000.w		; 9C 00 00
	tsb $00.b		; 04 00
	tsb $009C.w		; 0C 9C 00
	bvc -103.b		; 50 99
	ora [$70.b]		; 07 70
	bcc 119.b		; 90 77
	bvs -103.b		; 70 99
	sta $0050.w,Y		; 99 50 00
	ora [$70.b]		; 07 70
	brk $09.b		; 00 09
	ora #$0090.w		; 09 90 00
	rts		; 60

	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	cpy #$CC.b		; C0 CC
	sta $6099.w,Y		; 99 99 60
	stz $9CC9.w		; 9C C9 9C
	cmp #$9CC9.w		; C9 C9 9C
	brk $0C.b		; 00 0C
	bvc -103.b		; 50 99
	sta $0099.w,Y		; 99 99 00
	brk $00.b		; 00 00
	ora #$5000.w		; 09 00 50
	ora #$0990.w		; 09 90 09
	sta $0099.w,Y		; 99 99 00
	brk $07.b		; 00 07
	rts		; 60

	rti		; 40

	tsb $74.b		; 04 74
	mvp $40,$04		; 44 04 40
	cpy $50C0.w		; CC C0 50
	brk $09.b		; 00 09
	bcc 112.b		; 90 70
	sta $0900.w,Y		; 99 00 09
	sta $0060.w,Y		; 99 60 00
	cpy $CC99.w		; CC 99 CC
	cpy $9999.w		; CC 99 99
	sta $F064.w,Y		; 99 64 F0
	ora $00060B.l		; 0F 0B 06 00
	and $00F0.w,X		; 3D F0 00
	rts		; 60

	cpy $0CC0.w		; CC C0 0C
	cpy $CC90.w		; CC 90 CC
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bcc 119.b		; 90 77
	bvs  96.b		; 70 60
	mvp $00,$00		; 44 00 00
	mvp $00,$44		; 44 44 00
	mvp $60,$74		; 44 74 60
	tsb $44.b		; 04 44
	cpy #$00.b		; C0 00
	cpy $C4C9.w		; CC C9 C4
	tsb $EE70.w		; 0C 70 EE
	asl $CCCC.w		; 0E CC CC
	inc $CCAA.w		; EE AA CC
	cpy $0F54.w		; CC 54 0F
	inc $70.b,X		; F6 70
	sta $0F9F70.l,X		; 9F 70 9F 0F
	ora [$60.b]		; 07 60
	cmp #$CC9C.w		; C9 9C CC
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	mvp $77,$50		; 44 50 77
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $09.b		; 00 09
	bcc  80.b		; 90 50
	sta $0077.w,Y		; 99 77 00
	brk $00.b		; 00 00
	sta $0900.w,Y		; 99 00 09
	stz $0C.b		; 64 0C
	bmi  48.b		; 30 30
	sta $C40C43.l,X		; 9F 43 0C C4
	beq  96.b		; F0 60
	tsb $CC99.w		; 0C 99 CC
	sta $C9CC.w,Y		; 99 CC C9
	sta $609C.w,Y		; 99 9C 60
	tsb $0C9C.w		; 0C 9C 0C
	cpy #$CC.b		; C0 CC
	tsb $0C.b		; 04 0C
	cpy #$50.b		; C0 50
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	bvs 119.b		; 70 77
	bvs   0.b		; 70 00
	bvc   7.b		; 50 07
	adc [$77.b],Y		; 77 77
	adc [$00.b],Y		; 77 00
	bvs -105.b		; 70 97
	bvs  80.b		; 70 50
	brk $70.b		; 00 70
	sta $0999.w,Y		; 99 99 09
	sta $0990.w,Y		; 99 90 09
	rts		; 60

	cpy #$00.b		; C0 00
	tsb $CCC0.w		; 0C C0 CC
	cmp #$999C.w		; C9 9C 99
	rts		; 60

	sta $99C9.w,Y		; 99 C9 99
	sta $9999.w,Y		; 99 99 99
	stz $50CC.w		; 9C CC 50
	sta $9990.w,Y		; 99 90 99
	ora #$0700.w		; 09 00 07
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $77.b		; 00 77
	ora [$70.b]		; 07 70
	adc [$70.b],Y		; 77 70
	adc [$50.b],Y		; 77 50
	adc [$00.b],Y		; 77 00
	bvs   0.b		; 70 00
	brk $09.b		; 00 09
	bcc -103.b		; 90 99
	rts		; 60

	brk $CC.b		; 00 CC
	tsb $CC00.w		; 0C 00 CC
	brk $CC.b		; 00 CC
	cmp #$F464.w		; C9 64 F4
	cmp $CC030F.l		; CF 0F 03 CC
	and ($0C.b,S),Y		; 33 0C
	bmi  96.b		; 30 60
	sta $9CCC.w,Y		; 99 CC 9C
	cpy $CCCC.w		; CC CC CC
	cpy $54CC.w		; CC CC 54
	ora [$9F.b]		; 07 9F
	adc $00F7.w,Y		; 79 F7 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ora [$77.b]		; 07 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	bvc 119.b		; 50 77
	adc [$07.b],Y		; 77 07
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	sta $CC60.w,Y		; 99 60 CC
	cpy $CCCC.w		; CC CC CC
	cpy $99CC.w		; CC CC 99
	sta $FF54.w,Y		; 99 54 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	ora $540F0F.l		; 0F 0F 0F 54
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $000070.l		; 0F 70 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc [$77.b],Y		; 77 77
	adc [$50.b],Y		; 77 50
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	sta $6099.w,Y		; 99 99 60
	cpy $CCCC.w		; CC CC CC
	cpy $C9CC.w		; CC CC C9
	sta $5499.w,Y		; 99 99 54
	adc $0F0F0F.l,X		; 7F 0F 0F 0F
	ora $700F0F.l		; 0F 0F 0F 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $CC60.w,Y		; 99 60 CC
	cpy $9999.w		; CC 99 99
	sta $99CC.w,Y		; 99 CC 99
	cpy $0F54.w		; CC 54 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	adc $F0F0.w,Y		; 79 F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ora [$77.b]		; 07 77
	adc [$77.b],Y		; 77 77
	adc [$70.b],Y		; 77 70
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $CC60.w,Y		; 99 60 CC
	cpy $99CC.w		; CC CC 99
	sta $9999.w,Y		; 99 99 99
	sta $FF54.w,Y		; 99 54 FF
	sbc $0F0F7F.l,X		; FF 7F 0F 0F
	ora $54000F.l		; 0F 0F 00 54
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $07.b		; 00 07
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl -112.b		; 10 90
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	cpy $CCCC.w		; CC CC CC
	cmp #$CE44.w		; C9 44 CE
	inc $EEEE.w		; EE EE EE
	inc $EEEF.w		; EE EF EE
	inc $7F54.w		; EE 54 7F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $540F0F.l		; 0F 0F 0F 54
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   6.b		; 70 06
	jmp ($2CA4.w,X)		; 7C A4 2C
	mvp $40,$CE		; 44 CE 40
.INDEX 8
	sep #$50		; E2 50
	adc $0077.w,Y		; 79 77 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bcc  80.b		; 90 50
	ora #$0990.w		; 09 90 09
	sta $9999.w,Y		; 99 99 99
	sta $6099.w,Y		; 99 99 60
	cmp #$999C.w		; C9 9C 99
	cmp #$C999.w		; C9 99 C9
	stz $54CC.w		; 9C CC 54
	beq  15.b		; F0 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $F75479.l		; 0F 79 54 F7
	ora #$1977.w		; 09 77 19
	adc ($01.b),Y		; 71 01
	ora ($01.b,X)		; 01 01
	mvn $01,$01		; 54 01 01
	ora ($00.b,X)		; 01 00
	ora $9071.w,Y		; 19 71 90
	brk $80.b		; 00 80
	brk $F1.b		; 00 F1
	eor ($BD.b),Y		; 51 BD
	asl $0DD0.w,X		; 1E D0 0D
	sbc ($70.b,X)		; E1 70
	cpx $CCE0.w		; EC E0 CC
	inc $ECCE.w		; EE CE EC
	cpx #$CA.b		; E0 CA
	bra   0.b		; 80 00
	dec $DE0E.w,X		; DE 0E DE
	ora $BE1FEF.l		; 0F EF 1F BE
	bra  33.b		; 80 21
	sbc $F012ED.l,X		; FF ED 12 F0
	trb $2BC4.w		; 1C C4 2B
	bcc   2.b		; 90 02
	ora $12FF22.l		; 0F 22 FF 12
	ora ($63.b)		; 12 63
	beq -108.b		; F0 94
	ora $0C12.w,X		; 1D 12 0C
	sbc ($40.b),Y		; F1 40
	lda $90B272.l		; AF 72 B2 90
	lsr $6FB3.w		; 4E B3 6F
	bne  17.b		; D0 11
	inc $BD21.w		; EE 21 BD
	bra  82.b		; 80 52
	cmp $C00E.w		; CD 0E C0
	pld		; 2B
	cpy $1A.b		; C4 1A
	cmp ($80.b,S),Y		; D3 80
	jsr ($CC13.w,X)		; FC 13 CC
	eor $DB.b,S		; 43 DB
.ACCU 8
	sep #$2E		; E2 2E
	cmp $001E80.l		; CF 80 1E 00
	stz $AC62.w		; 9C 62 AC
	and ($F0.b,X)		; 21 F0
	ora ($90.b,X)		; 01 90
	inc $BA35.w,X		; FE 35 BA
	mvp $0E,$FF		; 44 FF 0E
	ora $1C.b,X		; 15 1C
	sty $F6.b,X		; 94 F6
	rol $04EF.w		; 2E EF 04
	tas		; 1B
	pei ($21.b)		; D4 21
	jsr ($A580.w,X)		; FC 80 A5
	jmp ($0FB4.w,X)		; 7C B4 0F
	eor ($A9.b)		; 52 A9
	pea $900C.w		; F4 0C 90
	ora $C01906.l		; 0F 06 19 C0
	beq  15.b		; F0 0F
	and $12.b		; 25 12
	ldy $FB.b		; A4 FB
	ora [$0C.b],Y		; 17 0C
	inc $FC15.w,X		; FE 15 FC
	ora ($03.b,X)		; 01 03
	bcc  27.b		; 90 1B
	cmp $2B.b,X		; D5 2B
	pei ($6E.b)		; D4 6E
	ldy #$53.b		; A0 53
	trb $C390.w		; 1C 90 C3
	bvs -66.b		; 70 BE
	ora ($1B.b)		; 12 1B
	sbc $FA.b		; E5 FA
	sbc ($A4.b)		; F2 A4
	asl $32E1.w		; 0E E1 32
	nop		; EA
	ora [$4A.b]		; 07 4A
	lda ($32.b)		; B2 32
	ldy #$1E.b		; A0 1E
	ora ($DD.b,X)		; 01 DD
	and ($ED.b,S),Y		; 33 ED
	sbc $A0C934.l,X		; FF 34 C9 A0
	and [$1B.b],Y		; 37 1B
	lda $F3CA76.l		; AF 76 CA F3
	mvn $A4,$DB		; 54 DB A4
	eor ($FF.b,S),Y		; 53 FF
	dec $0D33.w,X		; DE 33 0D
	bne  51.b		; D0 33
	inc $EEA0.w,X		; FE A0 EE
	asl $5F.b,X		; 16 5F
	cmp ($41.b)		; D2 41
	jmp.w [$2D05]		; DC 05 2D
	ldy $05.b		; A4 05
	and $55BE.w		; 2D BE 55
	stp		; DB
	trb $2F.b		; 14 2F
	dec $F3A0.w,X		; DE A0 F3
	.db $62, $DC, $F4		; 62 DC F4
	eor $30F2AC.l		; 4F AC F2 30
	ldy #$CC.b		; A0 CC
	ora $2F.b,S		; 03 2F
	cmp $FEF0.w,X		; DD F0 FE
	sbc ($1F.b,X)		; E1 1F
	sty $B1.b,X		; 94 B1
	eor ($E1.b,X)		; 41 E1
	asl $2302.w		; 0E 02 23
	phx		; DA
	pea $3590.w		; F4 90 35
	trb $33C0.w		; 1C C0 33
	and $7E07A9.l		; 2F A9 07 7E
	ldy $D1.b		; A4 D1
	eor ($FD.b)		; 52 FD
	sbc ($32.b,X)		; E1 32
	ora $21E1.w		; 0D E1 21
	bcc  45.b		; 90 2D
	bne  15.b		; D0 0F
	sbc $10AEDA.l,X		; FF DA AE 10
	dex		; CA
	sty $37.b		; 84 37
	bvc -38.b		; 50 DA
	sbc $73.b,S		; E3 73
	ldy $F1F1.w,X		; BC F1 F1
	sty $00.b,X		; 94 00
	bpl  15.b		; 10 0F
	sbc ($22.b,X)		; E1 22
	tsb $64D1.w		; 0C D1 64
	bcc  77.b		; 90 4D
	stz $2E14.w		; 9C 14 2E
	ldy $6215.w,X		; BC 15 62
	cpx $F490.w		; EC 90 F4
	.db $62, $DB, $D0		; 62 DB D0
	and ($FB.b,S),Y		; 33 FB
	lda $1C8033.l,X		; BF 33 80 1C
	lda $1C03.w,X		; BD 03 1C
	txy		; 9B
	trb $1D.b		; 14 1D
	lda $3284.w,X		; BD 84 32
	ora $02EF.w		; 0D EF 02
	rol $CDEE.w		; 2E EE CD
	and $94.b,S		; 23 94
	asl $100F.w		; 0E 0F 10
	and ($00.b,X)		; 21 00
	brk $34.b		; 00 34
	jsr $E094.w		; 20 94 E0
	ora ($42.b,S),Y		; 13 42
	inc $32F1.w		; EE F1 32
	asl $84DE.w		; 0E DE 84
	cop $0C.b		; 02 0C
	plb		; AB
	dec $EDEF.w		; CE EF ED
	cmp $A0E2.w,X		; DD E2 A0
	cpy $CDDD.w		; CC DD CD
	sbc $FFFF0F.l		; EF 0F FF FF
	sbc $FEBA74.l,X		; FF 74 BA FE
	cmp $03E1.w,X		; DD E1 03
	ora $A4F4FE.l		; 0F FE F4 A4
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq  36.b		; F0 24
	lsr $30.b,X		; 56 30
	ldy $02.b		; A4 02
	mvn $CC,$2F		; 54 2F CC
	cmp $BCBBED.l,X		; DF ED BB BC
	ldy $E0.b		; A4 E0
	brk $FF.b		; 00 FF
	ora $44.b,S		; 03 44
	and ($11.b)		; 32 11
	and ($94.b,X)		; 21 94
	and ($EE.b),Y		; 31 EE
	cpy $EFCE.w		; CC CE EF
	cmp $13E0.w,X		; DD E0 13
	sty $45.b		; 84 45
	and ($33.b)		; 32 33
	and ($1D.b,S),Y		; 33 1D
	lda #$AD.b		; A9 AD
	jmp.w [$BB84]		; DC 84 BB
	ldy $3312.w,X		; BC 12 33
	and ($F1.b),Y		; 31 F1
	lsr $3F.b,X		; 56 3F
	ldy $00.b		; A4 00
	brk $FE.b		; 00 FE
	beq  53.b		; F0 35
	stz $30.b		; 64 30
	ora ($A4.b,S),Y		; 13 A4
	eor $0D.b		; 45 0D
	tyx		; BB
	lda $BAED.w,X		; BD ED BA
	lda $A4F0.w,X		; BD F0 A4
	and ($11.b,X)		; 21 11
	ora ($45.b,S),Y		; 13 45
	and ($01.b)		; 32 01
	cop $10.b		; 02 10
	sty $CC.b,X		; 94 CC
	jmp.w [$CEDC]		; DC DC CE
	ora $4214F1.l		; 0F F1 14 42
	sty $12.b,X		; 94 12
	jsl $EDED0F.l		; 22 0F ED ED
	wai		; CB
	bne  15.b		; D0 0F
	bcs -52.b		; B0 CC
	cmp $EEEF.w		; CD EF EE
	sbc $01F0FF.l		; EF FF F0 01
	ldy $FE.b		; A4 FE
	sbc ($34.b),Y		; F1 34
	eor $43.b,X		; 55 43
	jsr $2F13.w		; 20 13 2F
	ldy $D9.b		; A4 D9
	ldy $CCEE.w		; AC EE CC
	lda $2102.w,X		; BD 02 21
	jsl $454594.l		; 22 94 45 45
	eor ($0E.b,S),Y		; 53 0E
	dec $DDF0.w,X		; DE F0 DD
	inc $EE94.w		; EE 94 EE
	cpx #$24.b		; E0 24
	bmi -16.b		; 30 F0
	and $2F.b		; 25 2F
	dec $DD84.w,X		; DE 84 DD
	wai		; CB
	lda $CFCB.w,X		; BD CB CF
	eor [$2D.b],Y		; 57 2D
	lda $2C3494.l		; AF 94 34 2C
	tyx		; BB
	ora $43.b,S		; 03 43
	asl $13DF.w,X		; 1E DF 13
	ldy $22.b		; A4 22
	and ($56.b,S),Y		; 33 56
	.db $42, $00		; 42 00
	ora ($FC.b,X)		; 01 FC
	plb		; AB
	ldy $BD.b		; A4 BD
	dec $10DF.w,X		; DE DF 10
	ora ($23.b)		; 12 23
	and ($01.b,X)		; 21 01
	bcc  86.b		; 90 56
	eor ($EB.b)		; 52 EB
	ldy $CECB.w,X		; BC CB CE
	ora ($20.b)		; 12 20
	sty $15.b		; 84 15
	eor $F499.w		; 4D 99 F4
	and $E1AA.w,X		; 3D AA E1
	bpl -124.b		; 10 84
	cmp $E2DD.w,X		; DD DD E2
	mvn $AC,$FA		; 54 FA AC
	trb $1C.b		; 14 1C
	sty $99.b		; 84 99
	sbc $43.b,S		; E3 43
	and $66.b,X		; 35 66
	and ($F3.b),Y		; 31 F3
	eor $B4.b,X		; 55 B4
	ora ($33.b)		; 12 33
	bpl -32.b		; 10 E0
	ora ($0D.b),Y		; 11 0D
	lda $94F1.w,X		; BD F1 94
	ora $079A.w		; 0D 9A 07
	ror $4F.b,X		; 76 4F
	inc $2002.w		; EE 02 20
	ldy #$EB.b		; A0 EB
	txs		; 9A
	bne  14.b		; D0 0E
	sbc $1F7447.l		; EF 47 74 1F
	sty $04.b,X		; 94 04
	ora $E39B.w,X		; 1D 9B E3
	eor ($0D.b,S),Y		; 53 0D
	dec $9425.w		; CE 25 94
	bit $05AB.w		; 2C AB 05
	eor $52E499.l,X		; 5F 99 E4 52
	cmp $E494.w,Y		; D9 94 E4
	stz $20.b		; 64 20
	and $1F.b,S		; 23 1F
	dec $54F2.w,X		; DE F2 54
	ldy $34.b		; A4 34
	mvn $EF,$3F		; 54 3F EF
	asl $ADDB.w		; 0E DB AD
	sbc ($94.b,X)		; E1 94
	brk $F0.b		; 00 F0
	bit $43.b		; 24 43
	ora $FFCE.w		; 0D CE FF
	inc $E194.w,X		; FE 94 E1
	and ($32.b,S),Y		; 33 32
	bit $41.b,X		; 34 41
	xba		; EB
	lda $94EF.w,X		; BD EF 94
	sbc $6314EE.l,X		; FF EE 14 63
	xba		; EB
	bne  32.b		; D0 20
	stp		; DB
	sty $D0.b,X		; 94 D0
	and ($1F.b,X)		; 21 1F
	cmp $3103.w,X		; DD 03 31
	xba		; EB
	sbc ($A4.b),Y		; F1 A4
	ora ($00.b),Y		; 11 00
	ora ($11.b)		; 12 11
	inc $54F2.w,X		; FE F2 54
	and ($A4.b,X)		; 21 A4
	eor $41.b		; 45 41
	jmp.w [$EBEF]		; DC EF EB
	ldy $1100.w,X		; BC 00 11
	sty $23.b,X		; 94 23
	bpl  34.b		; 10 22
	sbc $01AB.w		; ED AB 01
	sbc $349402.l,X		; FF 02 94 34
	and $32.b,S		; 23 32
	beq  15.b		; F0 0F
	phx		; DA
	lda $ED8432.l,X		; BF 32 84 ED
	sbc $65.b,X		; F5 65
	asl $ADBA.w		; 0E BA AD
	sbc $C284B9.l,X		; FF B9 84 C2
	stz $0D.b,X		; 74 0D
	dec $0E12.w,X		; DE 12 0E
	phx		; DA
	sbc $A4.b		; E5 A4
	jsr $2210.w		; 20 10 22
	bpl -17.b		; 10 EF
	ora ($11.b)		; 12 11
	and $A4.b,X		; 35 A4
	stz $0D.b,X		; 74 0D
	sbc $CECBFD.l		; EF FD CB CE
	cop $32.b		; 02 32
	ldy $1F.b		; A4 1F
	beq  16.b		; F0 10
	cpx $12DE.w		; EC DE 12
	jsr $9410.w		; 20 10 94
	bit $52.b		; 24 52
	sbc $10F1.w,X		; FD F1 10
	stp		; DB
	lda $1E9414.l,X		; BF 14 94 1E
	cpx #$34.b		; E0 34
	jsr $C0BB.w		; 20 BB C0
	ora $E294EC.l,X		; 1F EC 94 E2
	stz $0C.b		; 64 0C
	cmp $AF0B23.l		; CF 23 0B AF
	mvp $00,$A4		; 44 A4 00
	tsb $52.b		; 04 52
	cpx $21EF.w		; EC EF 21
	jsl $54A445.l		; 22 45 A4 54
	asl $EEDE.w		; 0E DE EE
	wai		; CB
	bne  19.b		; D0 13
	and ($A4.b),Y		; 31 A4
	asl $10E0.w		; 0E E0 10
	jmp.w [$33D0]		; DC D0 33
	bpl -15.b		; 10 F1
	sty $55.b,X		; 94 55
	rol $0FEE.w		; 2E EE 0F
	inc $F3DE.w		; EE DE F3
	and ($84.b,X)		; 21 84
	sbc $2F03.w		; ED 03 2F
	dec $DECC.w,X		; DE CC DE
	cpx $84DE.w		; EC DE 84
	and ($32.b,S),Y		; 33 32
	tsb $11DF.w		; 0C DF 11
	phx		; DA
	sep #$0E		; E2 0E
	ldy $12.b		; A4 12
	.db $42, $1F		; 42 1F
	ora ($10.b,X)		; 01 10
	sbc $47E2.w		; ED E2 47
	ldy $72.b		; A4 72
	inc $0C01.w,X		; FE 01 0C
	tyx		; BB
	cmp $943012.l		; CF 12 30 94
	inc $1D24.w,X		; FE 24 1D
	tsx		; BA
	ldx $2F23.w,Y		; BE 23 2F
	ora ($94.b,S),Y		; 13 94
	mvn $11,$0F		; 54 0F 11
	inc $EEDE.w,X		; FE DE EE
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	sty $DD.b,X		; 94 DD
	sbc ($41.b,S),Y		; F3 41
	ora $F2CE.w		; 0D CE F2
	asl $94BC.w		; 0E BC 94
	sbc ($53.b)		; F2 53
	ora $11DF.w		; 0D DF 11
	and ($FB.b)		; 32 FB
	lda $3223A4.l,X		; BF A4 23 32
	ora $0F10F1.l		; 0F F1 10 0F
	beq  54.b		; F0 36
	cpy #$45.b		; C0 45
	mvn $21,$32		; 54 32 21
	bpl  -2.b		; 10 FE
	beq   1.b		; F0 01
	sty $DB.b,X		; 94 DB
	dec $DEFF.w,X		; DE FF DE
	inc $4123.w		; EE 23 41
	sbc $541384.l,X		; FF 84 13 54
	ora ($1F.b),Y		; 11 1F
	tsx		; BA
	ldy $34D1.w		; AC D1 34
	sty $0F.b		; 84 0F
	sbc ($41.b)		; F2 41
	phx		; DA
	tsx		; BA
	dec $EE11.w,X		; DE 11 EE
	sty $02.b		; 84 02
	eor ($FA.b,S),Y		; 53 FA
	plb		; AB
	trb $41.b		; 14 41
	nop		; EA
	cmp ($94.b,X)		; C1 94
	and $63.b,X		; 35 63
	sbc $3E05.w		; ED 05 3E
	cmp $4627.w		; CD 27 46
	ldy $54.b		; A4 54
	ora $DC0EE0.l		; 0F E0 0E DC
	dec $41F2.w,X		; DE F2 41
	sty $CA.b		; 84 CA
	cpx #$EA.b		; E0 EA
	cmp $E5CB.w		; CD CB E5
	eor $43.b,X		; 55 43
	sty $1F.b		; 84 1F
	sbc ($54.b,X)		; E1 54
	asl A		; 0A
	ldy $13F1.w		; AC F1 13
	asl $CE94.w,X		; 1E 94 CE
	ora ($10.b)		; 12 10
	inc $10F0.w,X		; FE F0 10
	sbc $84EF.w		; ED EF 84
	sbc ($43.b,X)		; E1 43
	and ($EC.b),Y		; 31 EC
	jmp.w [$4FF4]		; DC F4 4F
	cpy #$A4.b		; C0 A4
	and ($FF.b,X)		; 21 FF
	bit $20.b,X		; 34 20
	sbc $2F14DE.l,X		; FF DE 14 2F
	cpy #$01.b		; C0 01
	bit $54.b,X		; 34 54
	and ($10.b,X)		; 21 10
	ora ($0F.b),Y		; 11 0F
	sbc $31F3A0.l		; EF A0 F3 31
	cpx $DEBB.w		; EC BB DE
	stp		; DB
	plb		; AB
	cmp $EC0090.l,X		; DF 90 00 EC
	bne  54.b		; D0 36
	eor ($FD.b)		; 52 FD
	cpy $84CA.w		; CC CA 84
	ldx $6305.w,Y		; BE 05 63
	sbc $FEDF.w,X		; FD DF FE
	ldy $84D1.w,X		; BC D1 84
	ora ($01.b,X)		; 01 01
	ora ($1D.b),Y		; 11 1D
	ldy $44F1.w,X		; BC F1 44
	and $DDA0.w,X		; 3D A0 DD
	sbc ($67.b,S),Y		; F3 67
	eor ($33.b,S),Y		; 53 33
	jsl $A42044.l		; 22 44 20 A4
	tsb $55.b		; 04 55
	bpl  -2.b		; 10 FE
	brk $0E.b		; 00 0E
	jmp.w [$84F1]		; DC F1 84
	adc $40.b		; 65 40
	tsx		; BA
	cmp ($2D.b,X)		; C1 2D
	stz $13DF.w		; 9C DF 13
	sty $24.b		; 84 24
	and ($E1.b),Y		; 31 E1
	mvp $CB,$10		; 44 10 CB
	stz $8445.w,X		; 9E 45 84
	sbc $35A0.w,Y		; F9 A0 35
	and ($FB.b,X)		; 21 FB
	cmp $74DC2F.l		; CF 2F DC 74
	jmp.w [$40E4]		; DC E4 40
	lda ($43.b),Y		; B1 43
	lda #$E7.b		; A9 E7
	rti		; 40

	ldy #$FF.b		; A0 FF
	sbc $57C0.w,X		; FD C0 57
	eor ($12.b)		; 52 12
	eor $53.b		; 45 53
	ldy $DE.b		; A4 DE
	and $50.b		; 25 50
	beq  49.b		; F0 31
	brk $FE.b		; 00 FE
	ldx $3294.w,Y		; BE 94 32
	cpx $11E1.w		; EC E1 11
	jsl $00CEEA.l		; 22 EA CE 00
	sty $13.b,X		; 94 13
	asl $43E3.w,X		; 1E E3 43
	beq  30.b		; F0 1E
	cpy #$33.b		; C0 33
	sty $A9.b		; 84 A9
	cmp ($EE.b,X)		; C1 EE
	and $0D.b		; 25 0D
	cmp ($40.b,S),Y		; D3 40
	cmp $D984.w,X		; DD 84 D9
	lda $130F54.l,X		; BF 54 0F 13
	cpx $14DE.w		; EC DE 14
	ldy #$F0.b		; A0 F0
	inc $23F0.w,X		; FE F0 23
	and ($21.b,S),Y		; 33 21
	bit $44.b		; 24 44
	bcs  17.b		; B0 11
	bpl   1.b		; 10 01
	and ($10.b,S),Y		; 33 10
	ora ($55.b,S),Y		; 13 55
	mvn $7E,$90		; 54 90 7E
	cmp ($30.b),Y		; D1 30
	lda $C299.w,Y		; B9 99 C2
	rti		; 40

	lda #$94.b		; A9 94
	cop $10.b		; 02 10
	jsr ($75C1.w,X)		; FC C1 75
	sbc $94F2EF.l,X		; FF EF F2 94
	eor ($B9.b,X)		; 41 B9
	sbc $40.b,S		; E3 40
	inc $24EE.w,X		; FE EE 24
	rol $CD94.w,X		; 3E 94 CD
	ora ($0F.b),Y		; 11 0F
	inc $31F0.w,X		; FE F0 31
	ora $94EF.w		; 0D EF 94
	ora ($10.b)		; 12 10
	asl $63F2.w		; 0E F2 63
	ora $3102.w		; 0D 02 31
	ldy $0F.b		; A4 0F
	cpx #$02.b		; E0 02
	brk $0F.b		; 00 0F
	and ($24.b,X)		; 21 24
	and $FFCC94.l		; 2F 94 CC FF
	sbc $0FEE0F.l,X		; FF 0F EE 0F
	and ($1E.b,X)		; 21 1E
	sty $A9.b		; 84 A9
	ora $2F.b,X		; 15 2F
	wai		; CB
	cmp ($66.b,S),Y		; D3 66
	and $ED84F0.l,X		; 3F F0 84 ED
	ora $3C.b		; 05 3C
	tax		; AA
	cpy #$43.b		; C0 43
	xce		; FB
	sbc $84.b,S		; E3 84
	mvn $99,$2E		; 54 2E 99
	bcs  33.b		; B0 21
	sbc $8442F3.l		; EF F3 42 84
	xce		; FB
	ldx $2044.w,Y		; BE 44 20
	ora $3024DE.l		; 0F DE 24 30
	sty $14.b,X		; 94 14
	bvc -16.b		; 50 F0
	asl $1EE0.w		; 0E E0 1E
	lda $9437.w		; AD 37 94
	ror $63.b,X		; 76 63
	phx		; DA
	sbc ($DB.b),Y		; F1 DB
	cmp $45F1.w		; CD F1 45
	sty $6C.b		; 84 6C
	cpx $C199.w		; EC 99 C1
	eor ($AE.b),Y		; 51 AE
	eor $21.b,X		; 55 21
	sty $00.b		; 84 00
	phx		; DA
	and [$3C.b],Y		; 37 3C
	cmp $FBCE00.l		; CF 00 CE FB
	sty $D1.b		; 84 D1
	mvn $00,$20		; 54 20 00
	stp		; DB
	wai		; CB
	cmp $009057.l		; CF 57 90 00
	inc $99DB.w		; EE DB 99
	lda $ADCA.w,X		; BD CA AD
	trb $94.b		; 14 94
	asl $1F12.w		; 0E 12 1F
	cmp $0E2423.l,X		; DF 23 24 0E
	ldy $0394.w,X		; BC 94 03
	and ($43.b,S),Y		; 33 43
	and ($FF.b,X)		; 21 FF
	cop $DB.b		; 02 DB
	sbc $F1FE90.l		; EF 90 FE F1
	and ($12.b)		; 32 12
	and $A9BCA9.l		; 2F A9 BC A9
	sty $23.b,X		; 94 23
	cop $20.b		; 02 20
	inc $EF0F.w		; EE 0F EF
	bit $FA.b,X		; 34 FA
	sty $D2.b,X		; 94 D2
	ora $04FDF1.l,X		; 1F F1 FD 04
	eor $A0FECD.l		; 4F CD FE A0
	cpy $DDDE.w		; CC DE DD
	cpx #$10.b		; E0 10
	sbc $F0DE.w		; ED DE F0
	sty $EE.b,X		; 94 EE
	sbc ($65.b,S),Y		; F3 65
	phd		; 0B
	bcs 102.b		; B0 66
	phd		; 0B
	ldy $1494.w		; AC 94 14
	eor ($1E.b)		; 52 1E
	trb $52.b		; 14 52
	cpx $13F1.w		; EC F1 13
	sty $2C.b,X		; 94 2C
	ldx $3013.w		; AE 13 30
	sbc $2F02.w		; ED 02 2F
	jmp.w [$B184]		; DC 84 B1
	eor $FD.b		; 45 FD
	cmp ($32.b)		; D2 32
	ora ($1E.b),Y		; 11 1E
	jmp.w [$CF74]		; DC 74 CF
	and $1F12CB.l		; 2F CB 12 1F
	bpl -69.b		; 10 BB
	cmp ($90.b),Y		; D1 90
	tyx		; BB
	tyx		; BB
	lda #$99.b		; A9 99
	cmp $BCDC.w		; CD DC BC
	cmp $FF1F94.l,X		; DF 94 1F FF
	ora ($1F.b,X)		; 01 1F
	ora $ED5025.l		; 0F 25 50 ED
	sty $01.b,X		; 94 01
	brk $ED.b		; 00 ED
	cmp ($65.b),Y		; D1 65
	bpl -20.b		; 10 EC
	ora $94.b		; 05 94
	adc ($DD.b)		; 72 DD
	cpx #$15.b		; E0 15
	and $32BE.w,X		; 3D BE 32
	sbc $CD0E94.l		; EF 94 0E CD
	eor $ED.b,S		; 43 ED
	ora ($0E.b,X)		; 01 0E
	ora ($1F.b)		; 12 1F
	stz $91.b,X		; 74 91
	bpl -51.b		; 10 CD
	cmp $A00911.l,X		; DF 11 09 A0
	bit $74.b,X		; 34 74
	asl $BEDA.w,X		; 1E DA BE
	ora ($BA.b),Y		; 11 BA
	pea $3063.w		; F4 63 30
	bcc -36.b		; 90 DC
	cmp $BECB.w,X		; DD CB BE
	cop $31.b		; 02 31
	cpx $A0E3.w		; EC E3 A0
	mvp $33,$32		; 44 32 33
	bit $31.b,X		; 34 31
	stp		; DB
	cmp ($33.b),Y		; D1 33
	sty $10.b,X		; 94 10
	sbc ($41.b),Y		; F1 41
	jsr ($52D2.w,X)		; FC D2 52
	inc $84F0.w,X		; FE F0 84
	sbc ($31.b,X)		; E1 31
	jmp.w [$ECF1]		; DC F1 EC
	cpx #$E9.b		; E0 E9
	pea $5184.w		; F4 84 51
	ora ($21.b,X)		; 01 21
	cop $0B.b		; 02 0B
	plb		; AB
	tsb $1F.b		; 04 1F
	sty $EF.b		; 84 EF
	sbc ($32.b)		; F2 32
	cmp #$E2.b		; C9 E2
	and $84DFEC.l,X		; 3F EC DF 84
	and $3F.b,X		; 35 3F
	cmp $ACFC31.l,X		; DF 31 FC AC
	and [$40.b],Y		; 37 40
	sty $F1.b		; 84 F1
	and $2112F1.l		; 2F F1 12 21
	lsr $1B.b,X		; 56 1B
.INDEX 8
	sep #$94		; E2 94
	asl $2FE1.w,X		; 1E E1 2F
	bne  68.b		; D0 44
	cpx #$23.b		; E0 23
	sbc $EC0284.l,X		; FF 84 02 EC
	sbc ($ED.b,X)		; E1 ED
	and $2A.b		; 25 2A
.INDEX 16
	rep #$5F		; C2 5F
	sty $DF.b		; 84 DF
	sbc #$91.b		; E9 91
	.db $62, $BC, $45		; 62 BC 45
	eor $2D.b,S		; 43 2D
	sty $CE.b,X		; 94 CE
	ora ($FF.b),Y		; 11 FF
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	ora ($84.b,X)		; 01 84
	xba		; EB
	sbc ($30.b,X)		; E1 30
	cpy #$14F0.w		; C0 F0 14
	lsr $84C1.w		; 4E C1 84
	and ($DD.b,S),Y		; 33 DD
	sbc ($33.b)		; F2 33
	ora $52F3.w,X		; 1D F3 52
	jmp.w [$DF84]		; DC 84 DF
	and $53.b		; 25 53
	cmp #$F6.b		; C9 F6
	and $A021D0.l,X		; 3F D0 21 A0
	bit $42.b		; 24 42
	brk $23.b		; 00 23
	and ($32.b,S),Y		; 33 32
	ora ($11.b),Y		; 11 11
	sty $CC.b		; 84 CC
	brk $FE.b		; 00 FE
	sbc ($22.b)		; F2 22
	ora $80D0DD.l		; 0F DD D0 80
	txs		; 9A
	tax		; AA
	ldy $10E0.w,X		; BC E0 10
	nop		; EA
	txs		; 9A
	cmp $EFFD84.l,X		; DF 84 FD EF
	jsl $31CFFD.l		; 22 FD CF 31
	ora $74C0.w		; 0D C0 74
	and ($11.b,X)		; 21 11
	beq -11.b		; F0 F5
	bvc -18.b		; 50 EE
	inc $94F4.w		; EE F4 94
	bpl  -1.b		; 10 FF
	cop $32.b		; 02 32
	asl $66E1.w		; 0E E1 66
	rol A		; 2A
	ldy #$E1FD.w		; A0 FD E1
	and ($EE.b),Y		; 31 EE
	bit $53.b		; 24 53
	bpl  17.b		; 10 11
	bcc  50.b		; 90 32
	inc $5204.w,X		; FE 04 52
	ora ($32.b,X)		; 01 32
	ora $3484DD.l		; 0F DD 84 34
	ora $02BE.w,X		; 1D BE 02
	tsb $45F0.w		; 0C F0 45
	rti		; 40

	stz $EA.b,X		; 74 EA
	jmp.w [$CDEB]		; DC EB CD
	ora ($1F.b),Y		; 11 1F
	trb $1E.b		; 14 1E
	sty $EC.b		; 84 EC
	cmp ($00.b),Y		; D1 00
	cmp $FD4304.l		; CF 04 43 FD
	cpx #$CD80.w		; E0 80 CD
	cpy $F2CD.w		; CC CD F2
	.db $42, $12		; 42 12
	eor $0A.b,X		; 55 0A
	sty $FF.b,X		; 94 FF
	and ($20.b,S),Y		; 33 20
	ora $31.b,S		; 03 31
	cpy $12D0.w		; CC D0 12
	sty $0F.b,X		; 94 0F
	tsb $63.b		; 04 63
	ora $FDF0FE.l		; 0F FE F0 FD
	bne -124.b		; D0 84
	rti		; 40

	sbc ($42.b,S),Y		; F3 42
	beq  14.b		; F0 0E
	cmp $84B0FB.l,X		; DF FB B0 84
	eor $EF.b,S		; 43 EF
	eor ($1E.b,S),Y		; 53 1E
	inc $10E0.w		; EE E0 10
	jmp.w [$1584]		; DC 84 15
	trb $01C0.w		; 1C C0 01
	brk $FC.b		; 00 FC
	sbc ($1E.b)		; F2 1E
	sty $BE.b		; 84 BE
	and $20.b,S		; 23 20
	ora ($00.b),Y		; 11 00
	brk $1E.b		; 00 1E
	sbc ($80.b,S),Y		; F3 80
	jsl $306624.l		; 22 24 66 30
	ora ($2E.b)		; 12 2E
	ldy $8427.w		; AC 27 84
	sbc $1102.w		; ED 02 11
	and $0F.b,S		; 23 0F
	sbc ($44.b),Y		; F1 44
	ora $664490.l		; 0F 90 44 66
	and ($10.b),Y		; 31 10
	ora ($22.b)		; 12 22
	ora ($21.b),Y		; 11 21
	bcc   0.b		; 90 00
	brk $FD.b		; 00 FD
	cmp $FDFF.w		; CD FF FD
	cmp $BE8410.l,X		; DF 10 84 BE
	ora $05FE1F.l		; 0F 1F FE 05
	lsr $11BD.w		; 4E BD 11
	sty $FC.b		; 84 FC
	cmp $0E01.w,X		; DD 01 0E
	cmp ($32.b),Y		; D1 32
	ora ($02.b),Y		; 11 02
	stz $0E.b,X		; 74 0E
	inc $61D3.w		; EE D3 61
	bpl  36.b		; 10 24
	eor ($FC.b,X)		; 41 FC
	sty $E0.b		; 84 E0
	ora ($DD.b),Y		; 11 DD
	eor [$3E.b]		; 47 3E
	sbc ($21.b,X)		; E1 21
	sep #$84		; E2 84
	eor ($FE.b)		; 52 FE
	ora $41.b,S		; 03 41
	jmp.w [$55C0]		; DC C0 55
	sbc #$80.b		; E9 80
	cmp ($31.b,X)		; C1 31
	jmp.w [$15DE]		; DC DE 15
	bit $41BF.w,X		; 3C BF 41
	sty $AC.b		; 84 AC
	ora ($10.b),Y		; 11 10
	dec $2E13.w,X		; DE 13 2E
	dec $8422.w		; CE 22 84
	xba		; EB
	sbc $30.b,S		; E3 30
	sbc $DE10F1.l		; EF F1 10 DE
	sbc ($74.b),Y		; F1 74
	asl $43DF.w		; 0E DF 43
	rol $54F2.w		; 2E F2 54
	asl A		; 0A
	cmp ($74.b,S),Y		; D3 74
	stz $D1.b,X		; 74 D1
	mvp $01,$FF		; 44 FF 01
	sta $0016.w,Y		; 99 16 00
	sty $13.b,X		; 94 13
	ora $2100F0.l,X		; 1F F0 00 21
	sbc $903F15.l		; EF 15 3F 90
	.db $42, $37		; 42 37
	adc ($DD.b,X)		; 61 DD
	ora ($0F.b,X)		; 01 0F
	inc $8404.w		; EE 04 84
	pld		; 2B
	ldx #$9A50.w		; A2 50 9A
	cmp ($3F.b),Y		; D1 3F
	sbc $9003.w		; ED 03 90
	sbc $0FDFEC.l,X		; FF EC DF 0F
	jmp.w [$EDDE]		; DC DE ED
	ldy $3284.w,X		; BC 84 32
	sbc $1EF2.w,X		; FD F2 1E
	dec $2001.w		; CE 01 20
	ora ($80.b,X)		; 01 80
.INDEX 8
	sep #$54		; E2 54
	ora ($45.b),Y		; 11 45
	asl $53F4.w,X		; 1E F4 53
	jsl $204174.l		; 22 74 41 20
	stp		; DB
	sep #$4E		; E2 4E
	cpy #$42.b		; C0 42
	rti		; 40

	sty $F0.b		; 84 F0
	and $4F.b,X		; 35 4F
	bcs 100.b		; B0 64
	cpx $23DE.w		; EC DE 23
	stz $0C.b,X		; 74 0C
	ldx #$40.b		; A2 40
	jmp.w [$2E22]		; DC 22 2E
	stz $7411.w		; 9C 11 74
	cpx $F1CD.w		; EC CD F1
	ora $1E15FD.l,X		; 1F FD 15 1E
	ora ($64.b,X)		; 01 64
	beq -69.b		; F0 BB
	sbc $23EFBF.l,X		; FF BF EF 23
	xce		; FB
	sbc ($74.b,S),Y		; F3 74
	bmi -50.b		; 30 CE
	and ($40.b,S),Y		; 33 40
	brk $ED.b		; 00 ED
	beq -20.b		; F0 EC
	bra -103.b		; 80 99
	ldy $E1BB.w,X		; BC BB E1
	asl $20E0.w,X		; 1E E0 20
	dec $3690.w		; CE 90 36
	adc $44.b		; 65 44
	eor $0D.b,S		; 43 0D
	pea $4476.w		; F4 76 44
	sty $46.b		; 84 46
	ora $F1AD.w,X		; 1D AD F1
	tsb $35CE.w		; 0C CE 35
	and $74D184.l		; 2F 84 D1 74
	cmp #$D1.b		; C9 D1
	jsr $E4BB.w		; 20 BB E4
	and $759F74.l,X		; 3F 74 9F 75
	asl A		; 0A
	cmp $E3DC32.l		; CF 32 DC E3
	and ($74.b),Y		; 31 74
	ldx $0C15.w		; AE 15 0C
	cmp $0C31.w		; CD 31 0C
	cmp ($53.b),Y		; D1 53
	bvs -20.b		; 70 EC
	ldy $EA02.w		; AC 02 EA
	ldx $C00E.w		; AE 0E C0
	ror $80.b		; 66 80
	and $0CF2DD.l		; 2F DD F2 0C
	stz $0D23.w		; 9C 23 0D
	asl $84.b		; 06 84
	jsr $5103.w		; 20 03 51
	beq  49.b		; F0 31
	sbc $70EF0F.l		; EF 0F EF 70
	jsl $9CA90E.l		; 22 0E A9 9C
	cpy $0ECE.w		; CC CE 0E
	cop $64.b		; 02 64
	and $CBCD.w,X		; 3D CD CB
	wai		; CB
	lda $3F26BA.l,X		; BF BA 26 3F
	stz $FF.b		; 64 FF
	and ($FC.b,S),Y		; 33 FC
	jsr ($3BFB.w,X)		; FC FB 3B
	tyx		; BB
	jsl $BEFB64.l		; 22 64 FB BE
	and ($FF.b)		; 32 FF
	sbc [$7F.b]		; E7 7F
	brk $03.b		; 00 03
	bra  16.b		; 80 10
	sbc $FFDE.w		; ED DE FF
	sbc $434502.l,X		; FF 02 45 43
	bra  34.b		; 80 22
	jsl $000021.l		; 22 21 00 00
	ora ($67.b)		; 12 67
	adc [$84.b],Y		; 77 84
	ora $41.b,X		; 15 41
	inc $0E00.w		; EE 00 0E
	inc $01DF.w		; EE DF 01
	stz $FC.b		; 64 FC
	dec $30.b		; C6 30
	cpy #$F3.b		; C0 F3
	tsb $CF0F.w		; 0C 0F CF
	stz $CF.b		; 64 CF
	sbc $FFF2BB.l,X		; FF BB F2 FF
	sbc $64F2B2.l,X		; FF B2 F2 64
	sbc $BFBF30.l,X		; FF 30 BF BF
	sbc $3EE2BB.l,X		; FF BB E2 3E
	bra -70.b		; 80 BA
	txy		; 9B
	dec $FFFF.w,X		; DE FF FF
	ora ($44.b,S),Y		; 13 44
	eor $64.b,X		; 55 64
	ora $52.b,X		; 15 52
	and $2121.w		; 2D 21 21
	and #$AD.b		; 29 AD
	brk $64.b		; 00 64
	cmp ($41.b,S),Y		; D3 41
	bne   4.b		; D0 04
	eor $101C.w		; 4D 1C 10
	rti		; 40

	rts		; 60

	rti		; 40

	cpy $C9C0.w		; CC C0 C9
	sta $CCCC.w,Y		; 99 CC CC
	sta $FC64.w,Y		; 99 64 FC
	and $30CF0F.l,X		; 3F 0F CF 30
	bmi   0.b		; 30 00
	beq -128.b		; F0 80
	inc $00EF.w,X		; FE EF 00
	ora $ECEEEE.l		; 0F EE EE EC
	tyx		; BB
	stz $23.b		; 64 23
	jsr ($33FF.w,X)		; FC FF 33
	beq -49.b		; F0 CF
	and ($00.b,S),Y		; 33 00
	stz $00.b,X		; 74 00
	ora $202220.l		; 0F 20 22 20
	eor ($1F.b)		; 52 1F
	sbc $80.b,S		; E3 80
	mvn $22,$33		; 54 33 22
	jsl $FF0010.l		; 22 10 00 FF
	sbc $999960.l,X		; FF 60 99 99
	sta $CCCC.w,Y		; 99 CC CC
	cpy $4400.w		; CC 00 44
	rts		; 60

	tsb $44C0.w		; 0C C0 44
	ora #$9C.b		; 09 9C
	tsb $9999.w		; 0C 99 99
	stz $0C.b		; 64 0C
	sbc $30FFC3.l,X		; FF C3 FF 30
	beq -12.b		; F0 F4
	jsr ($9C60.w,X)		; FC 60 9C
	cpy #$00.b		; C0 00
	tsb $4404.w		; 0C 04 44
	brk $00.b		; 00 00
	bvc 119.b		; 50 77
	bvs   0.b		; 70 00
	adc [$00.b],Y		; 77 00
	brk $77.b		; 00 77
	adc [$54.b],Y		; 77 54
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora #$00.b		; 09 00
	ora #$F0.b		; 09 F0
	rts		; 60

	cpy $0C00.w		; CC 00 0C
	cpy $0C00.w		; CC 00 0C
	cmp #$9C.b		; C9 9C
	stz $00.b		; 64 00
	jsr ($330C.w,X)		; FC 0C 33
	tsb $33FC.w		; 0C FC 33
	tsb $CF64.w		; 0C 64 CF
	bmi  48.b		; 30 30
	cmp $000303.l		; CF 03 03 00
	cpy $50.b		; C4 50
	brk $00.b		; 00 00
	ora [$77.b]		; 07 77
	bvs   0.b		; 70 00
	ora [$77.b]		; 07 77
	bvc   0.b		; 50 00
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	brk $64.b		; 00 64
	brk $00.b		; 00 00
	tsb $0C04.w		; 0C 04 0C
	tsb $43B3.w		; 0C B3 43
	rts		; 60

	cmp #$99.b		; C9 99
	stz $99CC.w		; 9C CC 99
	sta $C99C.w,Y		; 99 9C C9
	stz $F0.b		; 64 F0
	jsr ($003F.w,X)		; FC 3F 00
	beq  48.b		; F0 30
	jsr ($6003.w,X)		; FC 03 60
	cpy $CCCC.w		; CC CC CC
	cpy $C9C0.w		; CC C0 C9
	cpy $6000.w		; CC 00 60
	brk $04.b		; 00 04
	eor [$74.b]		; 47 74
	eor [$77.b]		; 47 77
	adc [$44.b],Y		; 77 44
	stz $41.b		; 64 41
	ora $310D.w		; 0D 0D 31
	jmp $40D0.w		; 4C D0 40
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	cpy $CC00.w		; CC 00 CC
	cpy $C90C.w		; CC 0C C9
	stz $F0.b		; 64 F0
	bcs  63.b		; B0 3F
	ora $0C030F.l		; 0F 0F 03 0C
	sbc [$70.b],Y		; F7 70
	asl $CECA.w		; 0E CA CE
	inc $00EE.w		; EE EE 00
	cpx #$00.b		; E0 00
	bvc -103.b		; 50 99
	bcc   9.b		; 90 09
	sta $0090.w,Y		; 99 90 00
	ora #$90.b		; 09 90
	bra  15.b		; 80 0F
	sbc $63F2FF.l,X		; FF FF F2 63
	inc $1F01.w,X		; FE 01 1F
	rts		; 60

	cpy #$00.b		; C0 00
	rti		; 40

	cpy #$44.b		; C0 44
	rti		; 40

	eor [$0C.b]		; 47 0C
	rts		; 60

	brk $C0.b		; 00 C0
	tsb $C099.w		; 0C 99 C0
	tsb $C9C0.w		; 0C C0 C9
	stz $FF.b		; 64 FF
	bvs -100.b		; 70 9C
	and $03CF0F.l,X		; 3F 0F CF 03
	bvs  96.b		; 70 60
	cmp #$CC.b		; C9 CC
	cpy $C0CC.w		; CC CC C0
	rti		; 40

	tsb $74.b		; 04 74
	rts		; 60

	brk $00.b		; 00 00
	rti		; 40

	tsb $7407.w		; 0C 07 74
	tsb $60C0.w		; 0C C0 60
	stz $00.b,X		; 74 00
	mvp $9C,$0C		; 44 0C 9C
	tsb $74.b		; 04 74
	cpy $7064.w		; CC 64 70
	sty $00.b,X		; 94 00
	tsb $0CC7.w		; 0C C7 0C
	jmp $70C7.w		; 4C C7 70
	asl $AE0C.w		; 0E 0C AE
	cpx $9EEA.w		; EC EA 9E
	tsb $70EE.w		; 0C EE 70
.ACCU 8
	sep #$2E		; E2 2E
	cpy $EAAC.w		; CC AC EA
	txs		; 9A
	dex		; CA
	dec $EE70.w		; CE 70 EE
	dec $EE00.w		; CE 00 EE
	cop $26.b		; 02 26
	bvs   6.b		; 70 06
	bra  -2.b		; 80 FE
	asl $F0BE.w,X		; 1E BE F0
	ora $21D2.w,X		; 1D D2 21
	ora $42E070.l		; 0F 70 E0 42
	cpy #$22.b		; C0 22
	rti		; 40

	ldx #$72.b		; A2 72
	ror $80.b		; 66 80
	sbc $55F154.l		; EF 54 F1 55
	eor $0F.b,S		; 43 0F
	bit $10.b,X		; 34 10
	stz $0C.b,X		; 74 0C
	and $9A.b,S		; 23 9A
	and $00.b,X		; 35 00
	nop		; EA
	ora $0B.b,X		; 15 0B
	bvs -103.b		; 70 99
	dec $9CC9.w		; CE C9 9C
	inc $C0EC.w		; EE EC C0
	asl $9050.w		; 0E 50 90
	sta $9900.w,Y		; 99 00 99
	brk $99.b		; 00 99
	brk $70.b		; 00 70
	bvc -103.b		; 50 99
	sta $9900.w,Y		; 99 00 99
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	bvc   0.b		; 50 00
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $C960.w,Y		; 99 60 C9
	sta $9999.w,Y		; 99 99 99
	cpy $CCCC.w		; CC CC CC
	cpy #$60.b		; C0 60
	brk $00.b		; 00 00
	cmp #$99.b		; C9 99
	sta $CC99.w,Y		; 99 99 CC
	brk $60.b		; 00 60
	mvp $47,$44		; 44 44 47
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	ora ($11.b),Y		; 11 11
	sta ($01.b),Y		; 91 01
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	cpy $9999.w		; CC 99 99
	sta $6099.w,Y		; 99 99 60
	sta $9C99.w,Y		; 99 99 9C
	cpy $CCCC.w		; CC CC CC
	cmp #$99.b		; C9 99
	rts		; 60

	sta $9999.w,Y		; 99 99 99
	cpy $CCC9.w		; CC C9 CC
	cpy $54CC.w		; CC CC 54
	ora $00070F.l		; 0F 0F 07 00
	brk $00.b		; 00 00
	brk $71.b		; 00 71
	rts		; 60

	mvp $44,$44		; 44 44 44
	adc [$44.b],Y		; 77 44
	mvp $44,$44		; 44 44 44
	bvc 119.b		; 50 77
	adc [$70.b],Y		; 77 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$60.b		; 09 60
	cpy $CCCC.w		; CC CC CC
	cpy $C9CC.w		; CC CC C9
	sta $6099.w,Y		; 99 99 60
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	sbc [$F0.b]		; E7 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	adc [$50.b],Y		; 77 50
	adc [$77.b],Y		; 77 77
	brk $77.b		; 00 77
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	bit $9C.b		; 24 9C
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $C960.w		; CC 60 C9
	stz $9999.w		; 9C 99 99
	sta $9999.w,Y		; 99 99 99
	stz $0F54.w		; 9C 54 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $50070F.l		; 0F 0F 07 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$70.b]		; 07 70
	brk $07.b		; 00 07
	mvn $10,$10		; 54 10 10
	bpl  16.b		; 10 10
	bpl -112.b		; 10 90
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	sta $6099.w,Y		; 99 99 60
	cpy $CCCC.w		; CC CC CC
	cpy $99CC.w		; CC CC 99
	sta $5499.w,Y		; 99 99 54
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $F0000F.l,X		; 7F 0F 00 F0
	bvc -103.b		; 50 99
	sta $9099.w,Y		; 99 99 90
	brk $00.b		; 00 00
	ora [$77.b]		; 07 77
	bit $74.b		; 24 74
	mvp $44,$44		; 44 44 44
	mvp $44,$44		; 44 44 44
	mvp $77,$50		; 44 50 77
	adc [$00.b],Y		; 77 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	rts		; 60

	cmp #$99.b		; C9 99
	sta $9999.w,Y		; 99 99 99
	stz $CCCC.w		; 9C CC CC
	rts		; 60

	cpy $99CC.w		; CC CC 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	inc $0F.b,X		; F6 0F
	ora $000007.l		; 0F 07 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	ora [$77.b]		; 07 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$24.b],Y		; 77 24
	stz $44.b		; 64 44
	mvp $44,$44		; 44 44 44
	mvp $44,$44		; 44 44 44
	mvn $00,$09		; 54 09 00
	brk $09.b		; 00 09
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	stz $0F.b		; 64 0F
	brk $00.b		; 00 00
	beq -64.b		; F0 C0
	beq -16.b		; F0 F0
	jsr ($FE54.w,X)		; FC 54 FE
	adc $FFFFFF.l		; 6F FF FF FF
	sbc [$0F.b],Y		; F7 0F
	ora $0F0F54.l		; 0F 54 0F 0F
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	bvc   9.b		; 50 09
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $CC60.w,Y		; 99 60 CC
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $FF54.w,Y		; 99 54 FF
	sbc $F0600F.l,X		; FF 0F 60 F0
	beq  -9.b		; F0 F7
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	adc [$00.b],Y		; 77 00
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$A0.b]		; 07 A0
	eor $0F34CE.l		; 4F CE 34 0F
	sbc $0FF0.w,X		; FD F0 0F
	beq -128.b		; F0 80
	stp		; DB
	cmp ($5F.b,X)		; C1 5F
	lda $FF2E23.l		; AF 23 2E FF
	sbc ($94.b)		; F2 94
	bpl  85.b		; 10 55
	xba		; EB
	lda $F3DE.w,X		; BD DE F3
	ora $1F8410.l,X		; 1F 10 84 1F
	cmp ($54.b,X)		; C1 54
	and $F122F0.l,X		; 3F F0 22 F1
	brk $84.b		; 00 84
	and ($FD.b,X)		; 21 FD
	ora $55D400.l,X		; 1F 00 D4 55
	dex		; CA
	ora #$84.b		; 09 84
	lda ($EF.b,S),Y		; B3 EF
	brk $1C.b		; 00 1C
	pei ($3E.b)		; D4 3E
	ora $31.b,S		; 03 31
	bra   3.b		; 80 03
	eor ($43.b,X)		; 41 43
	mvp $5E,$06		; 44 06 5E
	brk $00.b		; 00 00
	bra -33.b		; 80 DF
	rti		; 40

	beq -35.b		; F0 DD
	sbc $541731.l,X		; FF 31 17 54
	bra  98.b		; 80 62
	adc $16.b		; 65 16
	adc $32.b,S		; 63 32
	bpl  -4.b		; 10 FC
	sbc $DEE180.l,X		; FF 80 E1 DE
	jsr ($BBEC.w,X)		; FC EC BB
	cpy $AFAC.w		; CC AC AF
	bvs -55.b		; 70 C9
	eor #$E7.b		; 49 E7
.ACCU 8
	sep #$E2		; E2 E2
	ror $67.b,X		; 76 67
	lsr $5580.w		; 4E 80 55
	ora ($03.b,X)		; 01 03
	phd		; 0B
	bpl -14.b		; 10 F2
	and ($EF.b,S),Y		; 33 EF
	stz $69.b,X		; 74 69
	ora ($20.b,X)		; 01 20
	tsb $03EE.w		; 0C EE 03
	dec $841F.w		; CE 1F 84
	tsa		; 3B
	cop $B1.b		; 02 B1
	phk		; 4B
	sbc $D0.b,X		; F5 D0
	and $704F.w		; 2D 4F 70
	sbc [$EE.b]		; E7 EE
	rti		; 40

	lsr $CAC4.w		; 4E C4 CA
	rol $8404.w		; 2E 04 84
	tsb $FF.b		; 04 FF
	eor $E602.w,X		; 5D 02 E6
	ora #$21.b		; 09 21
	brk $94.b		; 00 94
	bne  61.b		; D0 3D
	ora ($F0.b),Y		; 11 F0
	sbc ($3E.b),Y		; F1 3E
	pea $902E.w		; F4 2E 90
	bit $40.b		; 24 40
	sbc ($0C.b),Y		; F1 0C
	ldx $BFEB.w,Y		; BE EB BF
	jmp.w [$1080]		; DC 80 10
	stp		; DB
	sbc $EC.b		; E5 EC
	eor ($E0.b,X)		; 41 E0
	jmp.w [$80FD]		; DC FD 80
	eor $B1.b,S		; 43 B1
	asl $E12F.w,X		; 1E 2F E1
	cmp $80001D.l,X		; DF 1D 00 80
	cmp ($0E.b)		; D2 0E
	asl $BF01.w,X		; 1E 01 BF
	tsb $ED0F.w		; 0C 0F ED
	sty $F3.b,X		; 94 F3
	inc $2000.w,X		; FE 00 20
	cpy #$2D.b		; C0 2D
	ora ($B1.b)		; 12 B1
	bra -103.b		; 80 99
	xba		; EB
	sta ($1D.b)		; 92 1D
	xce		; FB
	sbc ($AC.b,X)		; E1 AC
	cmp #$90.b		; C9 90
	ora ($03.b,X)		; 01 03
	bpl  84.b		; 10 54
	jsl $553047.l		; 22 47 30 55
	bra  69.b		; 80 45
	lsr $4E.b		; 46 4E
	ror $BC.b		; 66 BC
	beq -22.b		; F0 EA
	cmp $529C80.l		; CF 80 9C 52
	and $2E1CE6.l		; 2F E6 1C 2E
	bcs -68.b		; B0 BC
	sty $3B.b		; 84 3B
	bmi -105.b		; 30 97
	rol A		; 2A
	and ($02.b),Y		; 31 02
	lda $05805D.l		; AF 5D 80 05
	inc $5343.w		; EE 43 53
	asl $1E.b,X		; 16 1E
	and $9E709B.l,X		; 3F 9B 70 9E
	asl A		; 0A
	cpx #$A4.b		; E0 A4
	and #$CE.b		; 29 CE
	dec $8499.w		; CE 99 84
	rti		; 40

	sbc $DF42E4.l		; EF E4 42 DF
	mvp $02,$0C		; 44 0C 02
	sty $FF.b,X		; 94 FF
	sbc ($FF.b),Y		; F1 FF
	jsr $42CE.w		; 20 CE 42
	dec $8022.w		; CE 22 80
	cmp #$9E.b		; C9 9E
	plx		; FA
	dec $54AF.w,X		; DE AF 54
	asl $8426.w,X		; 1E 26 84
	sbc ($12.b),Y		; F1 12
	tsb $E1BE.w		; 0C BE E1
	adc $23B2.w,X		; 7D B2 23
	bra  82.b		; 80 52
	and ($16.b)		; 32 16
	bit $2013.w,X		; 3C 13 20
.INDEX 8
	sep #$50		; E2 50
	bra  36.b		; 80 24
	dex		; CA
	wai		; CB
	xba		; EB
.ACCU 16
	rep #$EA		; C2 EA
	cpx #$1E.b		; E0 1E
	bra -62.b		; 80 C2
	ora #$EDAD.w		; 09 AD ED
	cmp ($64.b,X)		; C1 64
	eor $1090C2.l		; 4F C2 90 10
	sbc $FCE1.w,X		; FD E1 FC
	cmp $F0FE31.l		; CF 31 FE F0
	bra  17.b		; 80 11
	and $463016.l		; 2F 16 30 46
	eor ($DF.b),Y		; 51 DF
	pld		; 2B
	sty $E2.b,X		; 94 E2
	beq  16.b		; F0 10
	sbc $FD25.w		; ED 25 FD
	tsb $1F.b		; 04 1F
	sty $06.b		; 84 06
	bpl  29.b		; 10 1D
	ldy #$61.b		; A0 61
	tyx		; BB
	and ($CC.b),Y		; 31 CC
	bra -101.b		; 80 9B
	cmp $13FE44.l,X		; DF 44 FE 13
	and $740002.l		; 2F 02 00 74
	rti		; 40

	pei ($4E.b)		; D4 4E
	bpl  97.b		; 10 61
	stz $C30B.w,X		; 9E 0B C3
	sty $1F.b		; 84 1F
	sbc $ED24FF.l		; EF FF 24 ED
	pea $9D2D.w		; F4 2D 9D
	sty $24.b		; 84 24
	and $40D1.w		; 2D D1 40
	and $33C0.w		; 2D C0 33
	cmp $6784.w,X		; DD 84 67
	asl $1F01.w,X		; 1E 01 1F
	ora $CE2DD1.l		; 0F D1 2D CE
	bra -79.b		; 80 B1
	ora #$0F9D.w		; 09 9D 0F
	tyx		; BB
	cmp $802124.l,X		; DF 24 21 80
	eor [$61.b]		; 47 61
	sep #$44		; E2 44
	jsr $1102.w		; 20 02 11
	and $2BB574.l		; 2F 74 B5 2B
	cmp $4C.b,S		; C3 4C
	cmp ($4E.b,X)		; C1 4E
	sbc $FC7420.l		; EF 20 74 FC
	ora $EE.b		; 05 EE
	ora ($AC.b)		; 12 AC
	and ($AC.b,S),Y		; 33 AC
	eor ($80.b,S),Y		; 53 80
	cmp #$0F9D.w		; C9 9D 0F
	sbc $45AD.w,X		; FD AD 45
	sbc #$80C5.w		; E9 C5 80
	.db $62, $12, $67		; 62 12 67
	eor ($12.b)		; 52 12
	lsr $31.b,X		; 56 31
	ora $74.b,X		; 15 74
	tda		; 7B
	lda $EDEF35.l,X		; BF 35 EF ED
	cop $0E.b		; 02 0E
	dex		; CA
	sty $34.b		; 84 34
	asl $30E2.w		; 0E E2 30
	lda $1CE3.w,X		; BD E3 1C
	cmp ($80.b,X)		; C1 80
	lda $03EEFF.l,X		; BF FF EE 03
	ora $1FE1.w,X		; 1D E1 1F
	cmp $EE80.w,X		; DD 80 EE
	inc $E1DC.w		; EE DC E1
	ora $23AC.w		; 0D AC 23
	ora $D280.w		; 0D 80 D2
	ror $0B.b		; 66 0B
	cpy #$0C.b		; C0 0C
	tsx		; BA
	lda $D2840C.l		; AF 0C 84 D2
	eor ($DF.b)		; 52 DF
	jsl $02FE21.l		; 22 21 FE 02
	jsr $A074.w		; 20 74 A0
	rol $E0E1.w,X		; 3E E1 E0
	asl $E1CA.w		; 0E CA E1
	ora $A09970.l,X		; 1F 70 99 A0
	jsl $404622.l		; 22 22 46 40
	lda #$74E4.w		; A9 E4 74
	wai		; CB
	dec $3D.b,X		; D6 3D
	lda $43.b,S		; A3 43
	adc $7424D2.l		; 6F D2 24 74
	sbc $0DE4.w,Y		; F9 E4 0D
	ldy #$3E.b		; A0 3E
	ldx $0EF5.w		; AE F5 0E
	stz $11.b,X		; 74 11
	tsb $56.b		; 04 56
	sbc $FF04.w,X		; FD 04 FF
.ACCU 8
	sep #$2F		; E2 2F
	stz $D0.b,X		; 74 D0
	jsr $CC0F.w		; 20 0F CC
	cmp ($0A.b,X)		; C1 0A
	sbc ($FE.b,S),Y		; F3 FE
	bra -83.b		; 80 AD
	sbc $E0BC.w,X		; FD BC E0
	jsr ($53E3.w,X)		; FC E3 53
	inc $1380.w,X		; FE 80 13
	ora $0FBD.w,X		; 1D BD 0F
	sbc $0000F0.l		; EF F0 00 00
	bvs   4.b		; 70 04
	stz $0C.b		; 64 0C
	sep #$0C		; E2 0C
	dec $99EA.w		; CE EA 99
	stz $FE.b,X		; 74 FE
	ora ($1C.b)		; 12 1C
	sbc $70.b		; E5 70
	bne  66.b		; D0 42
.ACCU 8
.INDEX 8
	sep #$74		; E2 74
	eor ($D2.b,X)		; 41 D2
	and $0E90.w		; 2D 90 0E
	cpy $CBFD.w		; CC FD CB
	bcc -69.b		; 90 BB
	wai		; CB
	cmp $00DF.w		; CD DF 00
	ora ($34.b,X)		; 01 34
	eor $74.b,S		; 43 74
	adc [$0B.b]		; 67 0B
	ora [$3C.b],Y		; 17 3C
	sbc $1F.b,X		; F5 1F
	ora $10.b,X		; 15 10
	bcc  68.b		; 90 44
	eor $33.b,S		; 43 33
	and ($00.b),Y		; 31 00
	ora $74DCFF.l		; 0F FF DC 74
	sbc $FAC0C9.l		; EF C9 C0 FA
	asl $EDF0.w		; 0E F0 ED
	cpy $2074.w		; CC 74 20
	sbc ($0B.b,X)		; E1 0B
	cpx #$52.b		; E0 52
	lda ($71.b),Y		; B1 71
	inc $F194.w,X		; FE 94 F1
	ora ($EE.b),Y		; 11 EE
	ora ($0F.b)		; 12 0F
	sbc ($57.b),Y		; F1 57
	bmi -92.b		; 30 A4
	ora ($43.b,S),Y		; 13 43
	brk $22.b		; 00 22
	ora $EDEEFF.l		; 0F FF EE ED
	sty $9B.b,X		; 94 9B
	cmp $E0BB.w		; CD BB E0
	sbc $343222.l,X		; FF 22 32 34
	ldy #$12.b		; A0 12
	eor $55.b		; 45 55
	mvp $0E,$31		; 44 31 0E
	stp		; DB
	lda #$84.b		; A9 84
	cmp $F1EE.w		; CD EE F1
	ora ($55.b,S),Y		; 13 55
	and ($32.b,S),Y		; 33 32
	and $0E1294.l,X		; 3F 94 12 0E
	sbc $34F11E.l,X		; FF 1E F1 34
	rti		; 40

	rol $94.b,X		; 36 94
	stz $33.b,X		; 74 33
	and ($20.b)		; 32 20
	inc $BBCC.w		; EE CC BB
	txy		; 9B
	sty $CB.b,X		; 94 CB
	ldy $E0EF.w		; AC EF E0
	ora ($33.b,S),Y		; 13 33
	bit $44.b,X		; 34 44
	sty $33.b,X		; 94 33
	ora ($00.b)		; 12 00
	sbc $DCDD.w		; ED DD DC
	cpy $84ED.w		; CC ED 84
	cmp $3512F1.l,X		; DF F1 12 35
	mvp $34,$20		; 44 20 34
	eor $00B0.w		; 4D B0 00
	bpl   0.b		; 10 00
	beq  -1.b		; F0 FF
	ora ($22.b)		; 12 22
	and $C0.b,X		; 35 C0
	and ($34.b,S),Y		; 33 34
	mvp $33,$44		; 44 44 33
	and ($10.b,X)		; 21 10
	inc $BB94.w,X		; FE 94 BB
	ldy $F0EE.w,X		; BC EE F0
	jsl $454333.l		; 22 33 43 45
	sty $32.b,X		; 94 32
	bmi   0.b		; 30 00
	inc $DECC.w		; EE CC DE
	wai		; CB
	dec $FE84.w,X		; DE 84 FE
	beq  17.b		; F0 11
	eor $45.b		; 45 45
	and $22.b,S		; 23 22
	jsl $11EF94.l		; 22 94 EF 11
	sbc $00FF.w,X		; FD FF 00
	ora ($42.b,S),Y		; 13 42
	rol $94.b,X		; 36 94
	stz $43.b		; 64 43
	mvp $0E,$20		; 44 20 0E
	cmp $AACB.w,X		; DD CB AA
	sty $BC.b,X		; 94 BC
	ldy $EFCE.w,X		; BC CE EF
	ora ($22.b)		; 12 22
	eor $43.b,S		; 43 43
	sty $57.b		; 84 57
	.db $42, $2F		; 42 2F
	inc $99BA.w		; EE BA 99
	tax		; AA
	lda #$84.b		; A9 84
	bne  -2.b		; D0 FE
	pea $2352.w		; F4 52 23
	adc ($12.b,X)		; 61 12
	eor ($94.b,X)		; 41 94
	ora $FEFF00.l		; 0F 00 FF FE
	sbc ($22.b),Y		; F1 22
	jsl $459435.l		; 22 35 94 45
	bit $42.b,X		; 34 42
	and ($10.b,X)		; 21 10
	cmp $ABEC.w,X		; DD EC AB
	sty $CC.b,X		; 94 CC
	ldy $EECE.w,X		; BC CE EE
	cop $11.b		; 02 11
	bit $32.b		; 24 32
	sty $33.b,X		; 94 33
	and ($01.b,X)		; 21 01
	ora $CCEDDE.l		; 0F DE ED CC
	inc $DE84.w		; EE 84 DE
	sbc $243303.l,X		; FF 03 33 24
	eor $12.b,S		; 43 12
	ora ($84.b)		; 12 84
	ora ($0E.b,X)		; 01 0E
	sbc ($1F.b,X)		; E1 1F
	cpy #$45.b		; C0 45
	bit $77.b		; 24 77
	sty $33.b,X		; 94 33
	mvp $23,$21		; 44 21 23
	ora $CBFCDE.l		; 0F DE FC CB
	sty $CD.b,X		; 94 CD
	wai		; CB
	sbc $F0E0.w		; ED E0 F0
	ora ($23.b,X)		; 01 23
	and ($84.b,X)		; 21 84
	eor $52.b,X		; 55 52
	ora ($FF.b,X)		; 01 FF
	cpx $CCBB.w		; EC BB CC
	cmp $FE84.w,X		; DD 84 FE
	beq   1.b		; F0 01
	and ($34.b,X)		; 21 34
	ora $8444F2.l,X		; 1F F2 44 84
	ora $43D1.w		; 0D D1 43
	xba		; EB
	sbc $62.b,S		; E3 62
	ora ($66.b)		; 12 66
	sty $32.b,X		; 94 32
	and ($33.b,S),Y		; 33 33
	bpl  16.b		; 10 10
	brk $CC.b		; 00 CC
	dec $DB94.w,X		; DE 94 DB
	cmp $EEED.w		; CD ED EE
	sbc $121F11.l		; EF 11 1F 12
	sty $64.b		; 84 64
	and ($23.b)		; 32 23
	bmi -36.b		; 30 DC
	inc $CDDC.w		; EE DC CD
	sty $FE.b		; 84 FE
	sbc $4F22E0.l,X		; FF E0 22 4F
	cpx #$44.b		; E0 44
	and $350184.l,X		; 3F 84 01 35
	ora $0213FF.l		; 0F FF 13 02
	and $44.b,X		; 35 44
	sty $22.b,X		; 94 22
	and ($22.b,S),Y		; 33 22
	bpl  17.b		; 10 11
	sbc $DCD0.w,X		; FD D0 DC
	sty $CD.b,X		; 94 CD
	sbc $EDDD.w		; ED DD ED
	beq  15.b		; F0 0F
	ora ($21.b,X)		; 01 21
	stz $33.b,X		; 74 33
	eor $31.b		; 45 31
	bpl -19.b		; 10 ED
	cmp $EDCD.w		; CD CD ED
	sty $EE.b		; 84 EE
	sbc ($10.b),Y		; F1 10
	and ($1F.b),Y		; 31 1F
	mvp $24,$30		; 44 30 24
	sty $20.b		; 84 20
	ora ($11.b)		; 12 11
	asl $45D0.w		; 0E D0 45
	bmi -15.b		; 30 F1
	sty $34.b,X		; 94 34
	jsr $4201.w		; 20 01 42
	inc $1FD0.w,X		; FE D0 1F
	stp		; DB
	sty $CE.b,X		; 94 CE
	inc $D0DB.w,X		; FE DB D0
	brk $FE.b		; 00 FE
	ora ($21.b),Y		; 11 21
	sty $00.b		; 84 00
	bit $41.b,X		; 34 41
	inc $FD11.w		; EE 11 FD
	ldx $84F1.w,Y		; BE F1 84
	trb $34DF.w		; 1C DF 34
	bpl -14.b		; 10 F2
	mvp $12,$11		; 44 11 12
	stz $63.b,X		; 74 63
	trb $3E.b		; 14 3E
	ldx $1F14.w		; AE 14 1F
	eor ($37.b,S),Y		; 53 37
	sty $55.b		; 84 55
	and ($43.b)		; 32 43
	bit $0F.b,X		; 34 0F
	inc $BBDE.w,X		; FE DE BB
	sty $AA.b		; 84 AA
	plb		; AB
	ldy $DDBB.w		; AC BB DD
	brk $F0.b		; 00 F0
	and $84.b,S		; 23 84
	and $12.b,S		; 23 12
	and ($30.b),Y		; 31 30
	dec $0EF0.w,X		; DE F0 0E
	cpy $0184.w		; CC 84 01
	asl $43F1.w		; 0E F1 43
	sbc $215334.l,X		; FF 34 53 21
	sty $31.b		; 84 31
	ora ($1E.b),Y		; 11 1E
	bne  16.b		; D0 10
	sbc $32.b,S		; E3 32
	ora $84.b		; 05 84
	eor $24.b,S		; 43 24
	stz $10.b		; 64 10
	ora ($0F.b),Y		; 11 0F
	cpx $849C.w		; EC 9C 84
	wai		; CB
	tax		; AA
	txy		; 9B
	dec $D1CB.w		; CE CB D1
	jsl $21840F.l		; 22 0F 84 21
	mvn $00,$0F		; 54 0F 00
	jsr $FEDF.w		; 20 DF FE
	sbc $CE74.w,X		; FD 74 CE
.ACCU 8
.INDEX 8
	sep #$3F		; E2 3F
	ora $57.b,S		; 03 57
	lsr $53.b,X		; 56 53
	rol $84.b,X		; 36 84
	jsl $1FF01E.l		; 22 1E F0 1F
	sbc $232134.l,X		; FF 34 21 23
	sty $43.b		; 84 43
	eor $10.b,X		; 55 10
	ora $3F.b,S		; 03 3F
	dec $DDDD.w		; CE DD DD
	ldy #$FD.b		; A0 FD
	tyx		; BB
	tsx		; BA
	sta $9A99.w,Y		; 99 99 9A
	tyx		; BB
	ldy $3484.w,X		; BC 84 34
	ora ($02.b,X)		; 01 02
	brk $DD.b		; 00 DD
	ora $84ADFD.l		; 0F FD AD 84
	ora ($10.b,X)		; 01 10
	ora $205113.l		; 0F 13 51 20
	jsl $2F8413.l		; 22 13 84 2F
	ora ($11.b,X)		; 01 11
	ora ($FE.b,X)		; 01 FE
	and $31.b		; 25 31
	tsb $84.b		; 04 84
	eor $62.b		; 45 62
	ora ($24.b)		; 12 24
	asl $EDDD.w,X		; 1E DD ED
	phx		; DA
	sty $CC.b,X		; 94 CC
	cmp $00DDFD.l,X		; DF FD DD 00
	brk $0F.b		; 00 0F
	ora ($74.b)		; 12 74
	lsr $11.b,X		; 56 11
	sbc ($31.b,S),Y		; F3 31
	dex		; CA
	cmp ($FB.b),Y		; D1 FB
	lda $2FE374.l,X		; BF 74 E3 2F
	ora ($55.b),Y		; 11 55
	eor $0D7225.l		; 4F 25 72 0D
	sty $13.b		; 84 13
	and $21E2EE.l,X		; 3F EE E2 21
	and ($25.b,X)		; 21 25
	and $84.b,X		; 35 84
	bit $43.b,X		; 34 43
	eor $10.b,S		; 43 10
	ora $9ADAEC.l		; 0F EC DA 9A
	sty $CA.b		; 84 CA
	txy		; 9B
	stp		; DB
	cmp $330000.l		; CF 00 00 33
	and ($90.b),Y		; 31 90
	cmp $0F1101.l,X		; DF 01 11 0F
	beq  14.b		; F0 0E
	wai		; CB
	tyx		; BB
	stz $2D.b,X		; 74 2D
	lda $52D2.w,X		; BD D2 52
	bit $14.b,X		; 34 14
	ror $20.b		; 66 20
	sty $F1.b		; 84 F1
	brk $1F.b		; 00 1F
	brk $23.b		; 00 23
	and ($21.b)		; 32 21
	rol $84.b		; 26 84
	adc $20.b,S		; 63 20
	tsb $10.b		; 04 10
	xba		; EB
	cmp $B9DC.w		; CD DC B9
	sty $AC.b		; 84 AC
	cmp $D0DD.w		; CD DD D0
	ora ($12.b),Y		; 11 12
	and $23.b,S		; 23 23
	stz $52.b,X		; 74 52
	brk $20.b		; 00 20
	dec $EDEC.w		; CE EC ED
	jmp.w [$74BC]		; DC BC 74
	bmi -15.b		; 30 F1
	ora ($47.b),Y		; 11 47
	rts		; 60

	pea $1163.w		; F4 63 11
	ldy #$22.b		; A0 22
	jsl $221111.l		; 22 11 11 22
	and $34.b,S		; 23 34
	eor $84.b,X		; 55 84
	adc ($21.b,S),Y		; 73 21
	and ($1E.b,X)		; 21 1E
	jsr ($CCAC.w,X)		; FC AC CC
	tsx		; BA
	sty $AA.b		; 84 AA
	dec $EEFD.w,X		; DE FD EE
	ora ($42.b,S),Y		; 13 42
	ora ($33.b,X)		; 01 33
	sty $42.b		; 84 42
	inc $01D0.w,X		; FE D0 01
	sbc $F1CC.w,X		; FD CC F1
	ora $9990.w		; 0D 90 99
	ldy $00EF.w		; AC EF 00
	ora ($34.b,X)		; 01 34
	mvn $84,$32		; 54 32 84
	and $FD.b,S		; 23 FD
	cmp $023235.l		; CF 35 32 02
	lsr $55.b		; 46 55
	sty $22.b		; 84 22
	ora ($32.b,X)		; 01 32
	sbc $BECC.w		; ED CC BE
	tyx		; BB
	tax		; AA
	sty $CC.b		; 84 CC
	sbc $F1EE.w		; ED EE F1
	and ($10.b,X)		; 21 10
	and $43.b,S		; 23 43
	stz $10.b,X		; 74 10
	sep #$00		; E2 00
	nop		; EA
	lda $FDED.w		; AD ED FD
	sbc $F184.w		; ED 84 F1
	eor ($10.b),Y		; 51 10
	ora ($32.b,X)		; 01 32
	and ($EF.b,X)		; 21 EF
	ora ($84.b,S),Y		; 13 84
	and $13E1DD.l		; 2F DD E1 13
	and $535623.l,X		; 3F 23 56 53
	sty $43.b		; 84 43
	and $31.b,S		; 23 31
	ora $DCCE.w		; 0D CE DC
	tyx		; BB
	plb		; AB
	sty $AC.b		; 84 AC
	jmp.w [$E0EE]		; DC EE E0
	ora ($31.b),Y		; 11 31
	and ($32.b,X)		; 21 32
	stz $54.b,X		; 74 54
	jsr $CCED.w		; 20 ED CC
	ldy $BCBD.w,X		; BC BD BC
	sbc $230074.l		; EF 74 00 23
	eor $43.b,S		; 43 43
	lsr $41.b		; 46 41
	ora ($F0.b),Y		; 11 F0
	sty $00.b		; 84 00
	ora $1210E0.l		; 0F E0 10 12
	bit $44.b		; 24 44
	bit $84.b,X		; 34 84
	eor ($43.b,S),Y		; 53 43
	jsr $EE0F.w		; 20 0F EE
	stp		; DB
	tyx		; BB
	tyx		; BB
	sty $BC.b		; 84 BC
	cmp $EFCF.w		; CD CF EF
	ora ($20.b),Y		; 11 20
	jsl $F09023.l		; 22 23 90 F0
	ora ($10.b),Y		; 11 10
	brk $0F.b		; 00 0F
	stp		; DB
	tax		; AA
	tyx		; BB
	bcc -87.b		; 90 A9
	sta $EEBD.w,Y		; 99 BD EE
	cmp $33F1.w,X		; DD F1 33
	and ($74.b)		; 32 74
	ora ($52.b)		; 12 52
	ora #$BE.b		; 09 BE
	jsl $475142.l		; 22 42 51 47
	sty $66.b		; 84 66
	and ($34.b,S),Y		; 33 34
	and $20.b,S		; 23 20
	sbc $DDCD.w		; ED CD DD
	sty $BB.b		; 84 BB
	tax		; AA
	jmp.w [$DDFD]		; DC FD DD
	sbc ($12.b),Y		; F1 12
	ora ($74.b),Y		; 11 74
	and $65.b,S		; 23 65
	bmi -32.b		; 30 E0
	sbc $BDC90C.l		; EF 0C C9 BD
	stz $03.b,X		; 74 03
	xce		; FB
	cmp $D23246.l		; CF 46 32 D2
	trb $22.b		; 14 22
	stz $C0.b		; 64 C0
	trb $44.b		; 14 44
	asl $1001.w,X		; 1E 01 10
	ora ($14.b),Y		; 11 14
	sty $23.b		; 84 23
	mvp $34,$31		; 44 31 34
	mvp $1E,$31		; 44 31 1E
	ora $CC0D84.l		; 0F 84 0D CC
	tyx		; BB
	dec $CDDC.w		; CE DC CD
	cmp $F07401.l,X		; DF 01 74 F0
	brk $36.b		; 00 36
	eor ($10.b),Y		; 51 10
	ora ($12.b)		; 12 12
	inc $EE74.w		; EE 74 EE
	cmp $F1CE.w		; CD CE F1
	cmp $43DF.w,X		; DD DF 43
	bpl -128.b		; 10 80
	plb		; AB
	bne  15.b		; D0 0F
	sbc $103212.l,X		; FF 12 32 10
	ora ($84.b)		; 12 84
	and $43010F.l		; 2F 0F 01 43
	and ($23.b),Y		; 31 23
	stz $33.b		; 64 33
	sty $20.b		; 84 20
	ora ($1F.b)		; 12 1F
	cpx $CDDC.w		; EC DC CD
	cmp $A0CC.w,X		; DD CC A0
	wai		; CB
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
	dec $FFFF.w,X		; DE FF FF
	stz $01.b,X		; 74 01
	bpl  12.b		; 10 0C
	wai		; CB
	cmp $01FFDD.l,X		; DF DD FF 01
	bcc -52.b		; 90 CC
	cmp $FFEF.w,X		; DD EF FF
	beq  18.b		; F0 12
	and ($11.b,X)		; 21 11
	stz $20.b,X		; 74 20
	bpl -17.b		; 10 EF
	cpx #$22.b		; E0 22
	lsr $4610.w		; 4E 10 46
	stz $75.b,X		; 74 75
	bit $54.b,X		; 34 54
	ror $32.b		; 66 32
	ora ($0F.b,S),Y		; 13 0F
	dec $EE84.w		; CE 84 EE
	cmp $CDDE.w,X		; DD DE CD
	dec $F0EE.w,X		; DE EE F0
	beq -112.b		; F0 90
	txs		; 9A
	tyx		; BB
	cmp $FFDE.w		; CD DE FF
	sbc $74EDFE.l,X		; FF FE ED 74
	sbc $10BDE9.l,X		; FF E9 BD 10
	asl $12DD.w,X		; 1E DD 12
	eor ($74.b,S),Y		; 53 74
	sbc ($12.b)		; F2 12
	rol $41.b,X		; 36 41
	sbc $FE1104.l,X		; FF 04 11 FE
	stz $FE.b,X		; 74 FE
	ora ($20.b)		; 12 20
	ora $644702.l,X		; 1F 02 47 64
	bit $A0.b,X		; 34 A0
	mvp $55,$45		; 44 45 55
	mvp $32,$43		; 44 43 32
	bpl  -2.b		; 10 FE
	stz $9B.b,X		; 74 9B
	wai		; CB
	wai		; CB
	cmp $F00202.l		; CF 02 02 F0
	ora ($74.b)		; 12 74
	eor ($2F.b,S),Y		; 53 2F
	cpx #$10.b		; E0 10
	rol $DEEC.w		; 2E EC DE
	sbc $FFDD74.l,X		; FF 74 DD FF
	ora ($11.b),Y		; 11 11
	ora $4015F0.l		; 0F F0 15 40
	stz $EE.b,X		; 74 EE
	cpx $46.b		; E4 46
	and $23F0.w		; 2D F0 23
	and $0F.b,S		; 23 0F
	stz $DF.b,X		; 74 DF
	cop $32.b		; 02 32
	ora ($23.b),Y		; 11 23
	eor $51.b,X		; 55 51
	.db $42, $74		; 42 74
	ora ($20.b)		; 12 20
	ora $DDCB.w		; 0D CB DD
	dex		; CA
	dex		; CA
	sta $9D64.w,X		; 9D 64 9D
	cmp $1110.w		; CD 10 11
	and ($26.b,X)		; 21 26
	and $3F643F.l,X		; 3F 3F 64 3F
	cpy $BEBF.w		; CC BF BE
	xce		; FB
	lda $64E1AE.l		; AF AE E1 64
	rol $3F.b		; 26 3F
	sbc ($33.b,S),Y		; F3 33
	eor $10.b,S		; 43 10
	brk $0D.b		; 00 0D
	stz $00.b,X		; 74 00
	jsl $24F200.l		; 22 00 F2 24
	and ($1F.b,X)		; 21 1F
	bne 116.b		; D0 74
	jsl $150151.l		; 22 51 01 15
	adc $42.b		; 65 42
	and $107422.l		; 2F 22 74 10
	sbc $BCCD.w		; ED CD BC
	inc $BDCA.w		; EE CA BD
	dec $ED64.w,X		; DE 64 ED
	phx		; DA
	asl $2605.w		; 0E 05 26
	sbc $64FEEF.l		; EF EF FE 64
	and $EEBEBB.l		; 2F BB BE EE
	rol $EFFE.w		; 2E FE EF
	jsl $306464.l		; 22 64 64 30
	wai		; CB
	bmi  48.b		; 30 30
	tsb $F0F0.w		; 0C F0 F0
	bra -17.b		; 80 EF
	cop $34.b		; 02 34
	eor $66.b		; 45 66
	ror $77.b		; 66 77
	adc [$64.b],Y		; 77 64
	rol $22.b		; 26 22
	ror $36.b		; 66 36
	rol $03.b,X		; 36 03
	and $44903F.l		; 2F 3F 90 44
	and ($10.b)		; 32 10
	ora $CCDDEE.l		; 0F EE DD CC
	wai		; CB
	mvn $33,$0B		; 54 0B 33
	cmp ($5D.b,S),Y		; D3 5D
	lsr $E65E.w		; 4E 5E E6
	inc $CB64.w,X		; FE 64 CB
	xce		; FB
	xba		; EB
	inc $EEEF.w,X		; FE EF EE
	inc $54E3.w,X		; FE E3 54
	cmp $E655.w		; CD 55 E6
	sbc $FFF6FE.l		; EF FE F6 FF
	adc $340064.l,X		; 7F 64 00 34
	mvp $51,$50		; 44 50 51
	ora ($11.b)		; 12 11
	asl $2174.w,X		; 1E 74 21
	ora ($12.b,X)		; 01 12
	ora ($35.b)		; 12 35
	ora ($31.b),Y		; 11 31
	ora ($64.b,X)		; 01 64
	and $EB.b,S		; 23 EB
	tax		; AA
	cmp $CBCC.w,Y		; D9 CC CB
	wai		; CB
	tsx		; BA
	mvn $4C,$DC		; 54 DC 4C
	lsr $5E4E.w		; 4E 4E 5E
	ror $FF.b		; 66 FF
	sbc $FCCF64.l,X		; FF 64 CF FC
	sbc $EFBFBF.l,X		; FF BF BF EF
	and $DE54FF.l		; 2F FF 54 DE
	dec $E6E5.w,X		; DE E5 E6
	sbc $F6E7EF.l		; EF EF E7 F6
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $74.b		; 00 74
	brk $22.b		; 00 22
	bit $43.b		; 24 43
	eor ($35.b,S),Y		; 53 35
	eor $44.b,S		; 43 44
	stz $00.b,X		; 74 00
	asl $BDCE.w		; 0E CE BD
	tsx		; BA
	tax		; AA
	tyx		; BB
	ldx $C074.w,Y		; BE 74 C0
	brk $12.b		; 00 12
	ora ($26.b,S),Y		; 13 26
	and ($22.b)		; 32 22
	ora ($80.b,X)		; 01 80
	and ($22.b,S),Y		; 33 22
	ora $AABAEC.l,X		; 1F EC BA AA
	lda #$9A.b		; A9 9A
	stz $F2.b		; 64 F2
	and ($F3.b,S),Y		; 33 F3
	beq  48.b		; F0 30
	brk $FC.b		; 00 FC
	tsb $AA70.w		; 0C 70 AA
	tax		; AA
	tax		; AA
	ldy $00EE.w		; AC EE 00
	jsl $007420.l		; 22 20 74 00
	jsl $22F002.l		; 22 02 F0 22
	eor $53.b		; 45 53
	eor ($74.b),Y		; 51 74
	and $22.b,S		; 23 22
	bmi  13.b		; 30 0D
	xba		; EB
	lda $CCBD.w,X		; BD BD CC
	stz $BC.b,X		; 74 BC
	cmp $01FE.w		; CD FE 01
	and $233111.l		; 2F 11 31 23
	stz $40.b		; 64 40
	and ($0C.b),Y		; 31 0C
	brk $C0.b		; 00 C0
	cpy $BFCF.w		; CC CF BF
	mvn $DE,$DE		; 54 DE DE
	lsr $EEEF.w,X		; 5E EF EE
	eor $54FEFE.l,X		; 5F FE FE 54
	inc $EFFF.w,X		; FE FF EF
	sbc $07F6E7.l		; EF E7 F6 07
	brk $74.b		; 00 74
	cop $02.b		; 02 02
	brk $12.b		; 00 12
	bit $33.b		; 24 33
	and $33.b,S		; 23 33
	stz $43.b,X		; 74 43
	eor ($20.b,X)		; 41 20
	asl $EEFD.w		; 0E FD EE
	cmp $74AC.w,X		; DD AC 74
	ldy $EDBD.w		; AC BD ED
	sbc $E0E1.w		; ED E1 E0
	and ($33.b)		; 32 33
	bvs -50.b		; 70 CE
	cop $46.b		; 02 46
	adc [$77.b]		; 67 77
	stz $2E.b		; 64 2E
	cpx $CF64.w		; EC 64 CF
	wai		; CB
	xce		; FB
	inc $F3F2.w,X		; FE F2 F3
	sbc ($0F.b)		; F2 0F
	stz $30.b		; 64 30
	sbc ($00.b,S),Y		; F3 00
	tsb $F0FC.w		; 0C FC F0
	sbc ($30.b,S),Y		; F3 30
	stz $E0.b,X		; 74 E0
	ora $201202.l		; 0F 02 12 20
	bpl  34.b		; 10 22
	bit $74.b,X		; 34 74
	eor ($31.b,S),Y		; 53 31
	ora ($31.b)		; 12 31
	and $0F.b,S		; 23 0F
	sbc $74DD.w		; ED DD 74
	cmp $BEECEE.l		; CF EE EC BE
	cmp $F111F1.l,X		; DF F1 11 F1
	bra -69.b		; 80 BB
	cmp $01EF.w		; CD EF 01
	bpl  15.b		; 10 0F
	sbc $0C64FF.l,X		; FF FF 64 0C
	ldy $B2BF.w,X		; BC BF B2
	sbc $FFBEFF.l,X		; FF FF BE FF
	mvn $E5,$C5		; 54 C5 E5
	inc $E6EE.w		; EE EE E6
	sbc $64F067.l		; EF 67 F0 64
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ora [$44.b]		; 07 44
	stz $43.b,X		; 74 43
	eor $53.b,S		; 43 53
	mvn $40,$32		; 54 32 40
	rol $74EE.w		; 2E EE 74
	lda $ACBD.w,X		; BD BD AC
	plb		; AB
	lda $EECF.w,X		; BD CF EE
	bpl 116.b		; 10 74
	ora ($33.b)		; 12 33
	and $44.b,X		; 35 44
	and $21.b,S		; 23 21
	ora $FD741E.l,X		; 1F 1E 74 FD
	dec $EDDB.w		; CE DB ED
	sbc $1FFFDF.l		; EF DF FF 1F
	stz $12.b		; 64 12
	and ($F3.b)		; 32 F3
	sbc ($0F.b,S),Y		; F3 0F
	eor $64CFC0.l		; 4F C0 CF 64
	beq  63.b		; F0 3F
	bmi  67.b		; 30 43
	bpl  64.b		; 10 40
	bvc  81.b		; 50 51
	stz $42.b		; 64 42
	ora ($51.b),Y		; 11 51
	and ($21.b,X)		; 21 21
	asl $16.b,X		; 16 16
	and ($64.b,X)		; 21 64
	rol $ED2E.w		; 2E 2E ED
	cmp $CBD9.w,X		; DD D9 CB
	phd		; 0B
	dec $FB64.w		; CE 64 FB
	inc $33F2.w,X		; FE F2 33
	and $0F004F.l,X		; 3F 4F 00 0F
	stz $00.b		; 64 00
	cmp $FBCBCF.l		; CF CF CB FB
	inc $FFFE.w,X		; FE FE FF
	mvn $DD,$CE		; 54 CE DD
	eor $EEE5.w,X		; 5D E5 EE
	inc $5FFE.w		; EE FE 5F
	stz $F3.b		; 64 F3
	eor $04.b,S		; 43 04
	brk $01.b		; 00 01
	rti		; 40

	eor ($1D.b,X)		; 41 1D
	stz $E0.b,X		; 74 E0
	ora ($02.b,X)		; 01 02
	jsl $332323.l		; 22 23 23 33
	and $74.b,X		; 35 74
	and ($4F.b)		; 32 4F
	asl $DDFE.w		; 0E FE DD
	jmp.w [$ACEC]		; DC EC AC
	stz $AA.b		; 64 AA
	ldx $E1D1.w		; AE D1 E1
	jsl $473622.l		; 22 22 36 47
	stz $04.b		; 64 04
	trb $0C1C.w		; 1C 1C 0C
	tsb $CBCB.w		; 0C CB CB
	tsx		; BA
	bra -103.b		; 80 99
	sta $9A99.w,Y		; 99 99 9A
	plb		; AB
	cmp $FEEE.w		; CD EE FE
	rts		; 60

	sta $CC99.w,Y		; 99 99 CC
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	mvp $20,$74		; 44 74 20
	ora $00.b,S		; 03 00
	and $23.b,S		; 23 23
	bit $13.b,X		; 34 13
	and ($64.b,X)		; 21 64
	and ($32.b)		; 32 32
	and $9DEAEB.l,X		; 3F EB EA 9D
	cmp $74CC.w		; CD CC 74
	sbc $DFCD.w		; ED CD DF
	sbc $F1111F.l,X		; FF 1F 11 F1
	and $447364.l		; 2F 64 73 44
	brk $0D.b		; 00 0D
	cpy #$CC.b		; C0 CC
	xce		; FB
	jsr ($BB64.w,X)		; FC 64 BB
	xba		; EB
	inc $2F2E.w		; EE 2E 2F
	sbc $F2.b,S		; E3 F2
	sbc ($60.b,S),Y		; F3 60
	stz $0000.w		; 9C 00 00
	tsb $47.b		; 04 47
	adc [$77.b],Y		; 77 77
	mvp $04,$64		; 44 64 04
	ora $01.b		; 05 01
	eor $1401.w,X		; 5D 01 14
	ora $51.b,X		; 15 51
	stz $21.b		; 64 21
	sbc ($51.b,X)		; E1 51
	and ($21.b,X)		; 21 21
	sbc $D0DD.w		; ED DD D0
	stz $D0.b		; 64 D0
	cpy $FFCB.w		; CC CB FF
	sbc ($30.b,S),Y		; F3 30
	beq -16.b		; F0 F0
	stz $F0.b		; 64 F0
	beq -16.b		; F0 F0
	beq -49.b		; F0 CF
	cmp $64FFFF.l		; CF FF FF 64
	lda $2FFEFB.l,X		; BF FB FE 2F
	and $FFBFFF.l,X		; 3F FF BF FF
	bvs -103.b		; 70 99
	tax		; AA
	tax		; AA
	tax		; AA
	cpy $22E0.w		; CC E0 22
	jsl $504064.l		; 22 64 40 50
	eor ($11.b),Y		; 51 11
	cmp $00D0.w,X		; DD D0 00
	bpl 100.b		; 10 64
	rti		; 40

	bpl  16.b		; 10 10
	eor $55.b		; 45 55
	eor ($22.b),Y		; 51 22
	asl $2164.w,X		; 1E 64 21
	sbc $D0DD.w		; ED DD D0
	jmp.w [$BCC0]		; DC C0 BC
	lda $2FFF64.l,X		; BF 64 FF 2F
	and $03FF0F.l,X		; 3F 0F FF 03
	beq  -4.b		; F0 FC
	stz $FC.b		; 64 FC
	xce		; FB
	sbc $FFEFFF.l,X		; FF FF EF FF
	sbc $E654E3.l,X		; FF E3 54 E6
	sbc $60E7EF.l		; EF EF E7 60
	adc [$10.b],Y		; 77 10
	bpl 100.b		; 10 64
	eor ($04.b,X)		; 41 04
	ora ($0D.b),Y		; 11 0D
	trb $0CDC.w		; 1C DC 0C
	ora $100074.l		; 0F 74 00 10
	jsl $112544.l		; 22 44 25 11
	ora $2164FE.l,X		; 1F FE 64 21
	asl $9CDD.w,X		; 1E DD 9C
	cpy $0FC2.w		; CC C2 0F
	beq 112.b		; F0 70
	tax		; AA
	tax		; AA
	dec $2202.w		; CE 02 22
	jsr $EC0E.w		; 20 0E EC
	stz $F0.b		; 64 F0
	bcs -69.b		; B0 BB
	xce		; FB
	rol $F333.w,X		; 3E 33 F3
	ora $999960.l		; 0F 60 99 99
	cpy $CCC0.w		; CC C0 CC
	sta $9C99.w,Y		; 99 99 9C
	rts		; 60

	cpy $99CC.w		; CC CC 99
	cpy $4400.w		; CC 00 44
	rti		; 40

	tsb $FC64.w		; 0C 64 FC
	ora $00404F.l		; 0F 4F 40 00
	mvp $45,$41		; 44 41 45
	stz $11.b		; 64 11
	eor ($11.b)		; 52 11
	sbc ($ED.b,X)		; E1 ED
	cmp $C0CC.w,X		; DD CC C0
	stz $CF.b		; 64 CF
	sbc $3FF00F.l,X		; FF 0F F0 3F
	bit $40.b,X		; 34 40
	rti		; 40

	stz $10.b		; 64 10
	bpl -48.b		; 10 D0
	ora $C00C.w		; 0D 0C C0
	wai		; CB
	lda $DEEE54.l,X		; BF 54 EE DE
	sbc $EE.b		; E5 EE
	inc $EF.b		; E6 EF
	adc $9960FF.l		; 6F FF 60 99
	sta $9999.w,Y		; 99 99 99
	stz $04C0.w		; 9C C0 04
	mvp $47,$60		; 44 60 47
	stz $44.b,X		; 74 44
	eor [$44.b]		; 47 44
	rti		; 40

	brk $0C.b		; 00 0C
	stz $30.b		; 64 30
	rti		; 40

	eor ($01.b,X)		; 41 01
	tsb $11.b		; 04 11
	eor ($D1.b,X)		; 41 D1
	rts		; 60

	stz $0C.b,X		; 74 0C
	cmp #$9C.b		; C9 9C
	cpy $C0CC.w		; CC CC C0
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	stz $CF.b		; 64 CF
	tsb $F0F3.w		; 0C F3 F0
	ora $F3FCCF.l		; 0F CF FC F3
	stz $FF.b		; 64 FF
	bmi -16.b		; 30 F0
	cmp $F0FFF0.l		; CF F0 FF F0
	and $999960.l,X		; 3F 60 99 99
	stz $00CC.w		; 9C CC 00
	tsb $00.b		; 04 00
	tsb $64.b		; 04 64
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	eor ($44.b,X)		; 41 44
	ora $D1.b,X		; 15 D1
	stz $D1.b		; 64 D1
	cmp ($C1.b),Y		; D1 C1
	tsb $C00C.w		; 0C 0C C0
	cmp $AA70C2.l		; CF C2 70 AA
	ldy $00CE.w		; AC CE 00
	jsl $224424.l		; 22 24 44 22
	rts		; 60

	mvp $0C,$00		; 44 00 0C
	cpy $99C9.w		; CC C9 99
	stz $64CC.w		; 9C CC 64
	brk $FC.b		; 00 FC
	tsb $F0FF.w		; 0C FF F0
	sbc $60F303.l,X		; FF 03 F3 60
	cpy $00CC.w		; CC CC 00
	brk $0C.b		; 00 0C
	cmp #$99.b		; C9 99
	sta $9950.w,Y		; 99 50 99
	sta $0099.w,Y		; 99 99 00
	brk $00.b		; 00 00
	adc [$77.b],Y		; 77 77
	bvc 119.b		; 50 77
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$60.b],Y		; 77 60
	mvp $44,$44		; 44 44 44
	stz $44.b,X		; 74 44
	eor [$77.b]		; 47 77
	mvp $0D,$64		; 44 64 0D
	tsb $0C00.w		; 0C 00 0C
	beq -80.b		; F0 B0
	jsr ($54FF.w,X)		; FC FF 54
	inc $E6EE.w		; EE EE E6
	sbc $077F6F.l		; EF 6F 7F 07
	brk $50.b		; 00 50
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $99C9.w		; CC C9 99
	cpy $9050.w		; CC 50 90
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$77.b],Y		; 77 77
	adc [$60.b],Y		; 77 60
	eor [$44.b]		; 47 44
	rti		; 40

	tsb $CCCC.w		; 0C CC CC
	cpy $60CC.w		; CC CC 60
	cmp #$99.b		; C9 99
	stz $CCCC.w		; 9C CC CC
	cpy $CCCC.w		; CC CC CC
	mvn $F7,$F0		; 54 F0 F7
	sta $F0000F.l,X		; 9F 0F 00 F0
	beq -16.b		; F0 F0
	mvn $F0,$F0		; 54 F0 F0
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	adc ($01.b),Y		; 71 01
	bvc 119.b		; 50 77
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	bcc   0.b		; 90 00
	brk $09.b		; 00 09
	sta $0090.w,Y		; 99 90 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	brk $09.b		; 00 09
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sbc [$00.b],Y		; F7 00
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
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	bne -23.b		; D0 E9
	ora $1A.b,S		; 03 1A
	jsr $4946.w		; 20 46 49
	jmp $454C.w		; 4C 4C 45
	eor ($55.b)		; 52 55
	bvc  46.b		; 50 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($0D00.w)		; 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D4.b		; E9 D4
	cmp $EDDF.w,Y		; D9 DF ED
	ora $2927.w		; 0D 27 29
	tas		; 1B
	bpl   3.b		; 10 03
	sbc ($F2.b),Y		; F1 F2
	cop $09.b		; 02 09
	cop $FC.b		; 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	bvs   0.b		; 70 00
	brk $CC.b		; 00 CC
	cpy $CEAA.w		; CC AA CE
	inc $6402.w		; EE 02 64
	tsb $45.b		; 04 45
	trb $52.b		; 14 52
	ora $62.b,X		; 15 62
	ora ($E2.b)		; 12 E2
	sty $F1.b		; 84 F1
	sbc ($FE.b),Y		; F1 FE
	cpx #$EE.b		; E0 EE
	cmp $DBEC.w,X		; DD EC DB
	ldy #$A9.b		; A0 A9
	txy		; 9B
	cmp $120001.l		; CF 01 00 12
	bit $44.b,X		; 34 44
	sty $FE.b		; 84 FE
	wai		; CB
	cmp ($10.b),Y		; D1 10
	ora $3522EF.l		; 0F EF 22 35
	sty $41.b		; 84 41
	ora ($F0.b,X)		; 01 F0
	jsr $ED21.w		; 20 21 ED
	dec $A4FE.w,X		; DE FE A4
	sbc $DEEEEE.l,X		; FF EE EE DE
	beq  70.b		; F0 46
	rti		; 40

	cop $A4.b		; 02 A4
	ora ($22.b),Y		; 11 22
	ora ($1C.b,X)		; 01 1C
	cmp $F1EF.w		; CD EF F1
	brk $94.b		; 00 94
	sbc $5456E2.l		; EF E2 56 54
	and ($00.b)		; 32 00
	beq  33.b		; F0 21
	ldy $FE.b		; A4 FE
	inc $0FF0.w,X		; FE F0 0F
	brk $0F.b		; 00 0F
	sbc $B4DB.w		; ED DB B4
	cpx #$03.b		; E0 03
	eor $00.b,S		; 43 00
	bpl  17.b		; 10 11
	jsr $B010.w		; 20 10 B0
	and $CCBBDC.l,X		; 3F DC BB CC
	cmp $D0DD.w,X		; DD DD D0
	bit $94.b		; 24 94
	ror $2F.b		; 66 2F
	dec $0DF0.w		; CE F0 0D
	plb		; AB
	cmp $B4D0.w		; CD D0 B4
	ora ($1F.b,X)		; 01 1F
	inc $E0ED.w,X		; FE ED E0
	and $61.b		; 25 61
	sbc ($B4.b),Y		; F1 B4
	ora $2E1111.l		; 0F 11 11 2E
	ldy $F1EE.w,X		; BC EE F1
	and ($A4.b,X)		; 21 A4
	jsr $46FE.w		; 20 FE 46
	mvp $EB,$53		; 44 53 EB
	cmp $A4F1.w		; CD F1 A4
	asl $EEEF.w		; 0E EF EE
	ora ($31.b,X)		; 01 31
	tsb $CEA9.w		; 0C A9 CE
	ldy $15.b,X		; B4 15
	adc ($01.b)		; 72 01
	asl $1101.w		; 0E 01 11
	and $BBA4BC.l		; 2F BC A4 BB
	lda ($65.b)		; B2 65
	and ($FF.b)		; 32 FF
	trb $44.b		; 14 44
	stz $A4.b		; 64 A4
	plx		; FA
	ldy $0FDF.w,X		; BC DF 0F
	ora ($EF.b,X)		; 01 EF
	sbc ($10.b)		; F2 10
	ldy $ED.b,X		; B4 ED
	cmp $205501.l,X		; DF 01 55 20
	jsr $00E0.w		; 20 E0 00
	cpy #$22.b		; C0 22
	bpl -19.b		; 10 ED
	wai		; CB
	dec $11F0.w		; CE F0 11
	ora ($A4.b),Y		; 11 A4
	jsl $DC3D34.l		; 22 34 3D DC
	lda $01E0.w,X		; BD E0 01
	bpl -76.b		; 10 B4
	brk $FE.b		; 00 FE
	cmp $25F0.w,X		; DD F0 25
	eor ($02.b)		; 52 02
	asl $01A4.w		; 0E A4 01
	brk $1C.b		; 00 1C
	txs		; 9A
	ldy $54E3.w,X		; BC E3 54
	mvp $33,$B0		; 44 B0 33
	mvp $76,$56		; 44 56 76
	eor ($1F.b,S),Y		; 53 1F
	cmp $B4DE.w,X		; DD DE B4
	bpl   0.b		; 10 00
	asl $EFEC.w		; 0E EC EF
	tsb $64.b		; 04 64
	cop $A4.b		; 02 A4
	rol $01D0.w		; 2E D0 01
	asl $BAB9.w,X		; 1E B9 BA
	bne  69.b		; D0 45
	ldy $65.b		; A4 65
	.db $42, $00		; 42 00
	cop $22.b		; 02 22
	inc $CECC.w,X		; FE CC CE
	ldy $00.b,X		; B4 00
	ora ($00.b),Y		; 11 00
	sbc $D0DD.w,X		; FD DD D0
	and [$62.b],Y		; 37 62
	ldy $33.b		; A4 33
	nop		; EA
	cmp $AB1B02.l,X		; DF 02 1B AB
	txs		; 9A
	sbc ($B0.b,S),Y		; F3 B0
	lda $657736.l,X		; BF 36 77 65
	mvp $43,$44		; 44 44 43
	asl $EEC0.w		; 0E C0 EE
	sbc $EC00F0.l		; EF F0 00 EC
	tsx		; BA
	lda $B414.w		; AD 14 B4
	and $1D.b,S		; 23 1D
	dec $21E0.w		; CE E0 21
	sbc $B4DFDC.l		; EF DC DF B4
	ora $55.b,S		; 03 55
	.db $42, $1F		; 42 1F
	dec $11F0.w,X		; DE F0 11
	asl $FEB4.w		; 0E B4 FE
	cpx #$02.b		; E0 02
	ora $F3DEEC.l,X		; 1F EC DE F3
	adc $B4.b,X		; 75 B4
	and $3D.b,X		; 35 3D
	cmp $10CE.w,X		; DD CE 10
	brk $FD.b		; 00 FD
	inc $F1B4.w		; EE B4 F1
	and $44.b,X		; 35 44
	and ($DE.b,X)		; 21 DE
	dec $1100.w,X		; DE 00 11
	ldy $0F.b,X		; B4 0F
	sbc $DD0FF1.l,X		; FF F1 0F DD
	sbc $B45304.l		; EF 04 53 B4
	mvp $EE,$1E		; 44 1E EE
	cmp $FEF1FF.l,X		; DF FF F1 FE
	sbc $5602A4.l,X		; FF A4 02 56
	ror $41.b		; 66 41
	sbc $DFCC.w		; ED CC DF
	cop $B4.b		; 02 B4
	ora $EE0000.l		; 0F 00 00 EE
	cmp $54F1.w,X		; DD F1 54
	bit $B4.b,X		; 34 B4
	rti		; 40

	inc $E0DE.w		; EE DE E0
	sbc $F0EF10.l,X		; FF 10 EF F0
	ldy $24.b		; A4 24
	ror $74.b		; 66 74
	asl $BCDC.w		; 0E DC BC
	cpx #$30.b		; E0 30
	ldy $00.b,X		; B4 00
	brk $0D.b		; 00 0D
	cmp $35E0.w,X		; DD E0 35
	and ($53.b,S),Y		; 33 53
	ldy $DC.b		; A4 DC
	lda #$CE.b		; A9 CE
	cmp $E0EE22.l,X		; DF 22 EE E0
	sbc ($A4.b)		; F2 A4
	rol $67.b,X		; 36 67
	and ($FD.b),Y		; 31 FD
	plb		; AB
	dec $1001.w		; CE 01 10
	ldy $00.b,X		; B4 00
	asl $DFED.w		; 0E ED DF
	rol $33.b		; 26 33
	stz $FE.b		; 64 FE
	bcs  97.b		; B0 61
	cpx $BDA9.w		; EC A9 BD
	cmp $DDDD.w,X		; DD DD DD
	cpx #$A4.b		; E0 A4
	adc [$62.b]		; 67 62
	bpl -87.b		; 10 A9
	ldy $11D1.w		; AC D1 11
	ora ($B4.b)		; 12 B4
	ora $35DEDD.l		; 0F DD DE 35
	bit $74.b		; 24 74
	ora $BDB4EB.l		; 0F EB B4 BD
	dec $1022.w,X		; DE 22 10
	bpl  -1.b		; 10 FF
	ora ($23.b),Y		; 11 23
	ldy $64.b		; A4 64
	eor ($CA.b)		; 52 CA
	tax		; AA
	ldx $22E0.w,Y		; BE E0 22
	ora $FDB4.w		; 0D B4 FD
	bne  67.b		; D0 43
	ora [$72.b],Y		; 17 72
	brk $DB.b		; 00 DB
	cpy $BFB4.w		; CC B4 BF
	ora ($12.b),Y		; 11 12
	jsr $0000.w		; 20 00 00
	jsl $61A423.l		; 22 23 A4 61
	sbc $BBA9.w		; ED A9 BB
	cmp $ECEE10.l,X		; DF 10 EE EC
	ldy $03.b,X		; B4 03
	ora ($65.b)		; 12 65
	and ($1E.b)		; 32 1E
	cmp $DFBC.w,X		; DD BC DF
	ldy $FF.b		; A4 FF
	mvp $21,$31		; 44 31 21
	cop $31.b		; 02 31
	lsr $30.b		; 46 30
	ldy $0E.b		; A4 0E
	wai		; CB
	tyx		; BB
	cmp $DFEFFD.l,X		; DF FD EF DF
	mvp $04,$B4		; 44 B4 04
	eor ($13.b,S),Y		; 53 13
	ora $EFCDEE.l		; 0F EE CD EF
	cpx #$A4.b		; E0 A4
	ora ($12.b)		; 12 12
	ora ($13.b),Y		; 11 13
	ora ($54.b)		; 12 54
	jsl $ECA41F.l		; 22 1F A4 EC
	ldy $DDDD.w,X		; BC DD DD
	dec $53DF.w,X		; DE DF 53
	asl $B4.b,X		; 16 B4
	eor ($22.b)		; 52 22
	bpl  -2.b		; 10 FE
	dec $EFEE.w,X		; DE EE EF
	bpl -92.b		; 10 A4
	sbc ($10.b),Y		; F1 10
	and $12.b,S		; 23 12
	mvn $20,$24		; 54 24 20
	sbc $EEB4.w,X		; FD B4 EE
	inc $FEEE.w		; EE EE FE
	cpx #$21.b		; E0 21
	ora ($52.b,S),Y		; 13 52
	ldy $54.b		; A4 54
	jsr $BDFC.w		; 20 FC BD
	jmp.w [$F0CE]		; DC CE F0
	beq -92.b		; F0 A4
	ora ($22.b,X)		; 01 22
	ora ($54.b,S),Y		; 13 54
	bit $21.b		; 24 21
	ora $B4CC.w		; 0D CC B4
	inc $EEEE.w		; EE EE EE
	sbc $520322.l,X		; FF 22 03 52
	jsl $0D30A4.l		; 22 A4 30 0D
	lda $DDDC.w,X		; BD DC DD
	sbc $A400F0.l,X		; FF F0 00 A4
	jsl $334413.l		; 22 13 44 33
	and ($0E.b),Y		; 31 0E
	jmp.w [$B4CC]		; DC CC B4
	inc $E0EE.w		; EE EE E0
	and ($03.b,X)		; 21 03
	eor ($22.b)		; 52 22
	bpl -80.b		; 10 B0
	ror $42.b,X		; 76 42
	ora $BBCBDC.l,X		; 1F DC CB BB
	cpy $A4DE.w		; CC DE A4
	ora ($53.b)		; 12 53
	bit $31.b		; 24 31
	ora $BCCBDD.l,X		; 1F DD CB BC
	ldy $EE.b,X		; B4 EE
	cpx #$21.b		; E0 21
	ora $42.b,S		; 03 42
	jsl $940F11.l		; 22 11 0F 94
	txs		; 9A
	tax		; AA
	lda #$EE.b		; A9 EE
	cmp $24341F.l		; CF 1F 34 24
	ldy $44.b		; A4 44
	bit $31.b		; 24 31
	ora $BCDBEC.l,X		; 1F EC DB BC
	cmp $EFB4.w		; CD B4 EF
	ora ($02.b)		; 12 02
	eor $22.b,S		; 43 22
	jsr $FE0F.w		; 20 0F FE
	sty $B9.b,X		; 94 B9
	tax		; AA
	dec $00CF.w,X		; DE CF 00
	and $25.b,S		; 23 25
	adc [$A4.b],Y		; 77 A4
	bit $31.b,X		; 34 31
	bpl -19.b		; 10 ED
	cpy $BDCC.w		; CC CC BD
	cmp $BDC0.w		; CD C0 BD
	dec $2302.w,X		; DE 02 23
	mvp $32,$44		; 44 44 32
	bpl -80.b		; 10 B0
	sbc $BBCC.w		; ED CC BB
	ldy $EFCD.w,X		; BC CD EF
	cop $45.b		; 02 45
	ldy $42.b		; A4 42
	ora ($ED.b),Y		; 11 ED
	jmp.w [$BCCD]		; DC CD BC
	cmp $B4D2.w,X		; DD D2 B4
	jsr $3224.w		; 20 24 32
	and ($10.b,X)		; 21 10
	sbc $B0EEEF.l,X		; FF EF EE B0
	cpy $BBCB.w		; CC CB BB
	cpy $F1DE.w		; CC DE F1
	bit $67.b,X		; 34 67
	ldy $11.b		; A4 11
	asl $CCDD.w		; 0E DD CC
	jmp.w [$CECE]		; DC CE CE
	and ($C0.b,S),Y		; 33 C0
	cmp $443412.l,X		; DF 12 34 44
	eor $21.b,S		; 43 21
	ora $CCB0FE.l		; 0F FE B0 CC
	tyx		; BB
	cpy $E0CE.w		; CC CE E0
	and $46.b,S		; 23 46
	adc [$A4.b],Y		; 77 A4
	brk $DD.b		; 00 DD
	cmp $DCDD.w,X		; DD DD DC
	sbc $41C2.w		; ED C2 41
	cpy #$E0.b		; C0 E0
	and $44.b,S		; 23 44
	mvp $10,$32		; 44 32 10
	sbc $0F94EE.l,X		; FF EE 94 0F
	beq   1.b		; F0 01
	.db $42, $47		; 42 47
	ror $67.b,X		; 76 67
	and $CDFEA4.l		; 2F A4 FE CD
	cmp $DDEE.w,X		; DD EE DD
	cmp $31E5.w,X		; DD E5 31
	ldy $34.b,X		; B4 34
	and ($20.b)		; 32 20
	ora $FFEEED.l		; 0F ED EE FF
	beq -92.b		; F0 A4
	bpl   1.b		; 10 01
	cop $21.b		; 02 21
	mvp $31,$33		; 44 33 31
	inc $EBA4.w		; EE A4 EB
	jmp.w [$FEEF]		; DC EF FE
	inc $15DC.w		; EE DC 15
	and ($B4.b)		; 32 B4
	eor $22.b,X		; 55 22
	ora $EECDFD.l,X		; 1F FD CD EE
	ora $20A410.l		; 0F 10 A4 20
	bpl  19.b		; 10 13
	bit $45.b		; 24 45
	and ($0E.b)		; 32 0E
	cpy $BCA4.w		; CC A4 BC
	dec $1FF1.w,X		; DE F1 1F
	sbc $35CD.w		; ED CD 35
	asl $B4.b,X		; 16 B4
	stz $12.b,X		; 74 12
	inc $CDDC.w,X		; FE DC CD
	sbc $A41111.l,X		; FF 11 11 A4
	bpl -16.b		; 10 F0
	ora ($44.b,S),Y		; 13 44
	stz $20.b		; 64 20
	stp		; DB
	ldy $DFB4.w		; AC B4 DF
	brk $11.b		; 00 11
	ora $23DFEE.l,X		; 1F EE DF 23
	ora $B4.b,X		; 15 B4
	adc $10.b,S		; 63 10
	cpx $DEDC.w		; EC DC DE
	cop $11.b		; 02 11
	bpl -64.b		; 10 C0
	sbc $23F0EF.l,X		; FF EF F0 23
	eor $43.b		; 45 43
	jsr $B4FE.w		; 20 FE B4
	beq  17.b		; F0 11
	ora ($0F.b),Y		; 11 0F
	cmp $34DF.w,X		; DD DF 34
	bit $B4.b		; 24 B4
	adc $FF.b,S		; 63 FF
	jmp.w [$F0DD]		; DC DD F0
	ora ($10.b)		; 12 10
	ora $E1DEA4.l		; 0F A4 DE E1
	lsr $67.b,X		; 56 67
	and $CFAAEC.l,X		; 3F EC AA CF
	ldy $02.b,X		; B4 02
	ora ($01.b),Y		; 11 01
	sbc $24DFDD.l,X		; FF DD DF 24
	and ($B4.b)		; 32 B4
	mvp $ED,$FF		; 44 FF ED
	sbc $0001F1.l		; EF F1 01 00
	inc $CFA4.w,X		; FE A4 CF
	cop $56.b		; 02 56
	eor $3F.b,X		; 55 3F
	jmp.w [$E0CD]		; DC CD E0
	ldy $21.b		; A4 21
	and ($FF.b,X)		; 21 FF
	inc $ACED.w,X		; FE ED AC
	sbc ($66.b)		; F2 66
	ldy $25.b		; A4 25
	.db $62, $FF, $DD		; 62 FF DD
	beq  -1.b		; F0 FF
	sbc $DEA4EE.l,X		; FF EE A4 DE
	sbc ($24.b),Y		; F1 24
	eor ($43.b,S),Y		; 53 43
	asl $E0EE.w		; 0E EE E0
	ldy $00.b		; A4 00
	brk $F0.b		; 00 F0
	cpx #$F0.b		; E0 F0
	cpx $F1BC.w		; EC BC F1
	ldy $75.b		; A4 75
	and $72.b,X		; 35 72
	brk $CC.b		; 00 CC
	sbc $A4FFFF.l		; EF FF FF A4
	inc $F0DE.w		; EE DE F0
	and $53.b,X		; 35 53
	eor $0F.b,S		; 43 0F
	sbc $EFA4.w		; ED A4 EF
	brk $00.b		; 00 00
	ora $EDF0FF.l		; 0F FF F0 ED
	ldy $E1A4.w,X		; BC A4 E1
	ror $35.b		; 66 35
	adc $00.b,S		; 63 00
	jmp.w [$0ED0]		; DC D0 0E
	ldy $FE.b		; A4 FE
	inc $F0DE.w		; EE DE F0
	rol $54.b		; 26 54
	.db $42, $0F		; 42 0F
	sty $CB.b,X		; 94 CB
	lda $ED0E12.l,X		; BF 12 0E ED
	cmp $A40FF0.l,X		; DF F0 0F A4
	stp		; DB
	dec $6415.w		; CE 15 64
	lsr $22.b,X		; 56 22
	sbc $A4BD.w,X		; FD BD A4
	beq  14.b		; F0 0E
	inc $EFED.w		; EE ED EF
	ora $56.b,S		; 03 56
	eor ($94.b,S),Y		; 53 94
	lsr $BCED.w		; 4E ED BC
	sbc ($1F.b),Y		; F1 1F
	sbc $01CD.w		; ED CD 01
	ldy $11.b		; A4 11
	ora $CECB.w		; 0D CB CE
	lsr $65.b		; 46 65
	stz $10.b		; 64 10
	ldy $DC.b		; A4 DC
	ldx $0F01.w,Y		; BE 01 0F
	cmp $F0CE.w,X		; DD CE F0
	ora $A4.b,X		; 15 A4
	adc $53.b		; 65 53
	ora $EFEE.w		; 0D EE EF
	bpl  15.b		; 10 0F
	inc $EFA4.w,X		; FE A4 EF
	ora ($12.b),Y		; 11 12
	ora $BEBB.w		; 0D BB BE
	and [$75.b],Y		; 37 75
	ldy $64.b		; A4 64
	sbc $21BEEC.l,X		; FF EC BE 21
	ora $A4BDEB.l,X		; 1F EB BD A4
	beq  37.b		; F0 25
	adc $53.b,X		; 75 53
	jsr ($E0DF.w,X)		; FC DF E0
	and ($A4.b,X)		; 21 A4
	sbc $02D0FD.l,X		; FF FD D0 02
	jsl $9BDB1F.l		; 22 1F DB 9B
	ldy $F2.b,X		; B4 F2
	mvp $0F,$33		; 44 33 0F
	sbc $1001EF.l,X		; FF EF 01 10
	ldy $0B.b		; A4 0B
	plb		; AB
	cpy #$24.b		; C0 24
	ror $53.b		; 66 53
	asl $94DD.w,X		; 1E DD 94
	cmp $AA2D45.l,X		; DF 45 2D AA
	stz $4514.w		; 9C 14 45
	.db $62, $B4, $FF		; 62 B4 FF
	sbc $03DE.w		; ED DE 03
	mvn $FE,$21		; 54 21 FE
	beq -92.b		; F0 A4
	cpx #$12.b		; E0 12
	and $E2AAEA.l		; 2F EA AA E2
	lsr $64.b		; 46 64
	ldy $21.b		; A4 21
	inc $01EF.w,X		; FE EF 01
	and ($0E.b,X)		; 21 0E
	cpy $A4D0.w		; CC D0 A4
	bit $32.b		; 24 32
	ora $BBDBFF.l,X		; 1F FF DB BB
.ACCU 8
.INDEX 8
	sep #$77		; E2 77
	ldy $53.b		; A4 53
	ora $21E1.w		; 0D E1 21
	ora ($0F.b,X)		; 01 0F
	sbc $A4BA.w		; ED BA A4
	bne  37.b		; D0 25
	eor ($20.b,S),Y		; 53 20
	ora $011101.l		; 0F 01 11 01
	ldy #$53.b		; A0 53
	tsb $AE99.w		; 0C 99 AE
	bit $54.b		; 24 54
	and ($0F.b),Y		; 31 0F
	ldy $EC.b		; A4 EC
	ldy $57E1.w,X		; BC E1 57
	eor $2F.b,S		; 43 2F
	cop $11.b		; 02 11
	ldy $0F.b		; A4 0F
	inc $BCEE.w,X		; FE EE BC
	cmp $214413.l		; CF 13 44 21
	sty $41.b,X		; 94 41
	ora ($20.b,S),Y		; 13 20
	sbc $BDCBEC.l,X		; FF EC CB BD
	trb $A4.b		; 14 A4
	and ($20.b)		; 32 20
	beq  15.b		; F0 0F
	ora $BDBA.w		; 0D BA BD
	and $B0.b		; 25 B0
	sbc ($45.b)		; F2 45
	mvp $44,$45		; 44 45 44
	eor $20.b,S		; 43 20
	sbc $CCA4.w,X		; FD A4 CC
	sbc ($35.b,X)		; E1 35
	mvn $10,$11		; 54 11 10
	ora ($1F.b),Y		; 11 1F
	sty $EC.b,X		; 94 EC
	tyx		; BB
	ldy $45E1.w,X		; BC E1 45
	adc $2F.b		; 65 2F
	sbc $0F10C0.l,X		; FF C0 10 0F
	sbc $CECB.w		; ED CB CE
	ora ($23.b,X)		; 01 23
	and ($A4.b)		; 32 A4
	bpl  31.b		; 10 1F
	sbc $CCDCDE.l,X		; FF DE DC CC
	beq  54.b		; F0 36
	ldy $54.b		; A4 54
	and ($F0.b,X)		; 21 F0
	cop $00.b		; 02 00
	asl $DEDD.w		; 0E DD DE
	ldy $F0.b		; A4 F0
	jsl $0F2033.l		; 22 33 20 0F
	beq  15.b		; F0 0F
	phx		; DA
	ldy $AB.b		; A4 AB
	sbc ($57.b,X)		; E1 57
	adc $40.b		; 65 40
	beq   0.b		; F0 00
	brk $A4.b		; 00 A4
	inc $CBEC.w,X		; FE EC CB
	cmp $435503.l		; CF 03 55 43
	bpl -80.b		; 10 B0
	and ($44.b,S),Y		; 33 44
	mvp $FD,$21		; 44 21 FD
	wai		; CB
	cmp $A4F0.w		; CD F0 A4
	and ($01.b,S),Y		; 33 01
	sbc $DAFE00.l,X		; FF 00 FE DA
	tyx		; BB
	cmp $7637A4.l,X		; DF A4 37 76
	.db $62, $0F, $F0		; 62 0F F0
	brk $0F.b		; 00 0F
	cpy $BBA4.w		; CC A4 BB
	cmp $524503.l		; CF 03 45 52
	and ($F0.b,X)		; 21 F0
	ora ($A4.b,X)		; 01 A4
	ora ($FD.b),Y		; 11 FD
	cpy $02CD.w		; CC CD 02
	mvp $10,$42		; 44 42 10
	ldy $00.b		; A4 00
	beq  14.b		; F0 0E
	cpx $CDBB.w		; EC BB CD
.INDEX 8
	sep #$57		; E2 57
	bcs  54.b		; B0 36
	adc [$65.b],Y		; 77 65
	eor $44.b,S		; 43 44
	.db $42, $0D		; 42 0D
	lda #$A4.b		; A9 A4
	sbc ($23.b,X)		; E1 23
	eor $33.b,X		; 55 33
	jsr $01F0.w		; 20 F0 01
	ora ($A4.b),Y		; 11 A4
	jsr ($CEBB.w,X)		; FC BB CE
	ora ($44.b,S),Y		; 13 44
	and ($10.b)		; 32 10
	brk $C0.b		; 00 C0
	ora ($11.b),Y		; 11 11
	ora $BCCCED.l		; 0F ED CC BC
	dec $A402.w		; CE 02 A4
	stz $FE.b,X		; 74 FE
	sbc $CB1E02.l,X		; FF 02 1E CB
	tax		; AA
	cmp $773494.l,X		; DF 94 34 77
	ror $65.b,X		; 76 65
	ora ($11.b),Y		; 11 11
	ora ($0B.b)		; 12 0B
	ldy $CB.b		; A4 CB
	ldy $34F1.w		; AC F1 34
	eor $21.b,S		; 43 21
	ora ($11.b)		; 12 11
	ldy $0F.b,X		; B4 0F
	sbc $FEEEEE.l,X		; FF EE EE FE
	beq   2.b		; F0 02
	mvp $43,$B4		; 44 B4 43
	ora $0FF0FF.l,X		; 1F FF F0 0F
	sbc $E0DE.w		; ED DE E0
	ldy $12.b		; A4 12
	bit $54.b,X		; 34 54
	eor ($20.b,S),Y		; 53 20
	sbc $A40EFF.l,X		; FF FF 0E A4
	wai		; CB
	ldy $34E1.w		; AC E1 34
	mvn $21,$33		; 54 33 21
	bpl -92.b		; 10 A4
	inc $DCDE.w,X		; FE DE DC
	cmp $FEDE.w,X		; DD DE FE
	cpx #$36.b		; E0 36
	ldy $54.b,X		; B4 54
	.db $42, $FE		; 42 FE
	inc $0FF0.w		; EE F0 0F
	inc $A4DE.w		; EE DE A4
	sbc ($23.b,X)		; E1 23
	mvp $43,$54		; 44 54 43
	sbc $A4F0EE.l,X		; FF EE F0 A4
	asl $ACCC.w		; 0E CC AC
	ora ($45.b,X)		; 01 45
	mvn $20,$22		; 54 22 20
	sty $20.b,X		; 94 20
	jmp.w [$99BA]		; DC BA 99
	ldy $FDDF.w,X		; BC DF FD
	wai		; CB
	ldy $01.b,X		; B4 01
	mvp $2E,$54		; 44 54 2E
	sbc $00EF.w		; ED EF 00
	inc $CBA4.w,X		; FE A4 CB
	cmp $563403.l		; CF 03 34 56
	mvn $ED,$1F		; 54 1F ED
	ldy $DF.b		; A4 DF
	brk $EC.b		; 00 EC
	tsx		; BA
	cmp $426535.l,X		; DF 35 65 42
	sty $53.b,X		; 94 53
	and ($EC.b,X)		; 21 EC
	lda #$A9.b		; A9 A9
	plb		; AB
	dec $B411.w		; CE 11 B4
	ora $4601FF.l		; 0F FF 01 46
	eor ($0E.b,S),Y		; 53 0E
	cmp $A4EF.w		; CD EF A4
	ora ($FD.b),Y		; 11 FD
	wai		; CB
	cmp $554523.l,X		; DF 23 45 55
	eor $A4.b,S		; 43 A4
	ora $E0CC.w		; 0D CC E0
	bpl -20.b		; 10 EC
	tyx		; BB
	sbc ($46.b,X)		; E1 46
	ldy $55.b		; A4 55
	and ($11.b,X)		; 21 11
	ora ($FE.b,X)		; 01 FE
	cpx $DEDD.w		; EC DD DE
	ldy $00.b,X		; B4 00
	ora ($0F.b),Y		; 11 0F
	inc $25F0.w		; EE F0 25
	mvn $A4,$20		; 54 20 A4
	sta $03AE.w,Y		; 99 AE 03
	bpl -52.b		; 10 CC
	lda $25E2.w,X		; BD E2 25
	ldy $56.b		; A4 56
	eor ($1F.b,S),Y		; 53 1F
	cpy $11EF.w		; CC EF 11
	ora $A4CA.w		; 0D CA A4
	cmp $336524.l		; CF 24 65 33
	bpl  17.b		; 10 11
	ora $CDA4EE.l		; 0F EE A4 CD
	cmp $22FF.w,X		; DD FF 22
	and ($EC.b,X)		; 21 EC
	cpy $B4F3.w		; CC F3 B4
	eor $43.b		; 45 43
	asl $E0DD.w		; 0E DD E0
	ora ($0F.b),Y		; 11 0F
	sbc $CDA4.w,X		; FD A4 CD
	cop $45.b		; 02 45
	adc $41.b,X		; 75 41
	cpx $F1CE.w		; EC CE F1
	ldy $21.b		; A4 21
	xba		; EB
	ldy $45D2.w,X		; BC D2 45
	mvn $00,$21		; 54 21 00
	sty $01.b,X		; 94 01
	ora $BC99DB.l		; 0F DB 99 BC
	ora $65.b,S		; 03 65
	bmi -92.b		; 30 A4
	cpx $E0CD.w		; EC CD E0
	rol $77.b		; 26 77
	eor ($CB.b),Y		; 51 CB
	ldx $13A4.w,Y		; BE A4 13
	and ($DA.b),Y		; 31 DA
	plb		; AB
.ACCU 8
.INDEX 8
	sep #$35		; E2 35
	mvn $A4,$32		; 54 32 A4
	ora $12F0ED.l		; 0F ED F0 12
	sbc $DFBB.w,X		; FD BB DF
	and $A4.b		; 25 A4
	eor $21.b,X		; 55 21
	sbc $0F1201.l,X		; FF 01 12 0F
	cmp $B0CD.w		; CD CD B0
	ldy $12E0.w,X		; BC E0 12
	bpl  -2.b		; 10 FE
	stp		; DB
	lda #$AC.b		; A9 AC
	bcs   3.b		; B0 03
	adc [$63.b]		; 67 63
	ora ($23.b),Y		; 11 23
	and ($0D.b,S),Y		; 33 0D
	tsx		; BA
	ldy $E2.b		; A4 E2
	ora ($34.b,S),Y		; 13 34
	eor $20.b,S		; 43 20
	inc $10F0.w		; EE F0 10
	ldy $FC.b		; A4 FC
	ldy $24E0.w,X		; BC E0 24
	eor $21.b,S		; 43 21
	bpl   0.b		; 10 00
	ldy $00.b		; A4 00
	bpl  -3.b		; 10 FD
	ldy $34F1.w,X		; BC F1 34
	and ($FE.b),Y		; 31 FE
	ldy $F0.b,X		; B4 F0
	sbc $13EFEE.l,X		; FF EE EF 13
	mvp $0E,$21		; 44 21 0E
	ldy $00.b		; A4 00
	sbc $EDCCED.l,X		; FF ED CC ED
	cpx #$14.b		; E0 14
	ror $A4.b		; 66 A4
	.db $62, $0F, $EE		; 62 0F EE
	beq -19.b		; F0 ED
	cmp $00CF.w,X		; DD CF 00
	ldy $24.b		; A4 24
	mvp $1E,$52		; 44 52 1E
	sbc $0FF0.w		; ED F0 0F
	sbc $EEA4.w		; ED A4 EE
	ora $33.b,S		; 03 33
	and ($0F.b)		; 32 0F
	inc $DBED.w,X		; FE ED DB
	ldy $EE.b,X		; B4 EE
	sbc $435513.l,X		; FF 13 55 43
	asl $EFEE.w		; 0E EE EF
	ldy $FE.b,X		; B4 FE
	inc $F1FF.w		; EE FF F1
	ora ($44.b,S),Y		; 13 44
	and ($0E.b)		; 32 0E
	ldy $CA.b		; A4 CA
	dec $EDDD.w,X		; DE DD ED
	cpx #$12.b		; E0 12
	eor $65.b		; 45 65
	ldy $52.b		; A4 52
	cpx $CDBB.w		; EC BB CD
	ora $332201.l		; 0F 01 22 33
	ldy $22.b		; A4 22
	jsl $CECCFE.l		; 22 FE CC CE
	cpx #$FE.b		; E0 FE
	jmp.w [$F1B4]		; DC B4 F1
	cop $57.b		; 02 57
	eor ($1D.b,S),Y		; 53 1D
	ldy $00DD.w		; AC DD 00
	ldy $FF.b,X		; B4 FF
	brk $01.b		; 00 01
	jsl $FE4135.l		; 22 35 41 FE
	wai		; CB
	ldy $AE.b		; A4 AE
	sbc $320211.l		; EF 11 02 32
	bit $55.b		; 24 55
	eor ($A4.b,X)		; 41 A4
	cmp #$9A.b		; C9 9A
	lda $442411.l,X		; BF 11 24 44
	eor $1F.b,S		; 43 1F
	ldy $00.b		; A4 00
	cpx $C0BB.w		; EC BB C0
	jsl $FD0E32.l		; 22 32 0E FD
	ldy $EF.b,X		; B4 EF
	sbc ($14.b),Y		; F1 14
	eor ($10.b,S),Y		; 53 10
	jmp.w [$FFE0]		; DC E0 FF
	ldy $1F.b		; A4 1F
	sbc ($0F.b,X)		; E1 0F
	sbc $46.b,S		; E3 46
	adc $0C.b,X		; 75 0C
	tyx		; BB
	ldy $BD.b		; A4 BD
	sbc $1121E3.l,X		; FF E3 21 11
	ora ($45.b),Y		; 11 45
	and ($A4.b),Y		; 31 A4
	jsr ($DDAB.w,X)		; FC AB DD
	sbc ($23.b),Y		; F1 23
	and ($11.b,S),Y		; 33 11
	and $A4.b,S		; 23 A4
	and ($FC.b)		; 32 FC
	tyx		; BB
	dec $1302.w		; CE 02 13
	and ($0F.b)		; 32 0F
	ldy $ED.b		; A4 ED
	dec $21E0.w		; CE E0 21
	brk $27.b		; 00 27
	mvn $A4,$3E		; 54 3E A4
	ldx $BDEC.w,Y		; BE EC BD
	cmp $221135.l,X		; DF 35 11 22
	bit $94.b,X		; 34 94
	ror $A9AB.w		; 6E AB A9
	plb		; AB
	stz $6757.w,X		; 9E 57 67
	eor ($A4.b)		; 52 A4
	ora ($0F.b,S),Y		; 13 0F
	inc $EEDD.w		; EE DD EE
	sbc $943412.l		; EF 12 34 94
	adc ($32.b,S),Y		; 73 32
	ora $CCBAFD.l,X		; 1F FD BA CC
	sbc ($23.b,X)		; E1 23
	sty $54.b,X		; 94 54
	and ($0D.b),Y		; 31 0D
	tyx		; BB
	plb		; AB
	cmp $34E0.w		; CD E0 34
	ldy $10.b,X		; B4 10
	bit $32.b,X		; 34 32
	asl $EDCD.w		; 0E CD ED
	sbc $55A411.l		; EF 11 A4 55
	ora ($32.b)		; 12 32
	and ($1D.b,S),Y		; 33 1D
	cmp $BECA.w		; CD CA BE
	ldy $F2.b		; A4 F2
	adc $44.b		; 65 44
	and ($00.b,X)		; 21 00
	dec $EDEE.w,X		; DE EE ED
	bcs -53.b		; B0 CB
	ldy $24E0.w,X		; BC E0 24
	eor $54.b,X		; 55 54
	jsr $84FE.w		; 20 FE 84
	pei ($42.b)		; D4 42
	eor $21.b		; 45 21
	jsr $EEEE.w		; 20 EE EE
	cpx #$B4.b		; E0 B4
	brk $00.b		; 00 00
	sbc $01F0FF.l,X		; FF FF F0 01
	brk $24.b		; 00 24
	ldy $73.b		; A4 73
	ora $DBAD.w		; 0D AD DB
	lda $F04402.l,X		; BF 02 44 F0
	ldy $33.b		; A4 33
	and ($0E.b)		; 32 0E
	sbc $02CDDB.l		; EF DB CD 02
	eor ($94.b,S),Y		; 53 94
	eor $42.b		; 45 42
	ora $DB0FBC.l,X		; 1F BC 0F DB
	cpy $94F3.w		; CC F3 94
	mvp $43,$46		; 44 46 43
	phd		; 0B
	ldy $F0EF.w		; AC EF F0
	cop $94.b		; 02 94
	adc $30.b		; 65 30
	inc $DCDF.w,X		; FE DF DC
	bne  36.b		; D0 24
	and ($A4.b)		; 32 A4
	bpl  15.b		; 10 0F
	cmp $F0DD.w,X		; DD DD F0
	ora ($12.b),Y		; 11 12
	ora $A4.b,X		; 15 A4
	adc $11.b,X		; 75 11
	stp		; DB
	tyx		; BB
	plb		; AB
	sbc ($35.b)		; F2 35
	eor ($A4.b),Y		; 51 A4
	bit $11.b		; 24 11
	asl $ECEE.w		; 0E EE EC
	cmp $34F0.w		; CD F0 34
	ldy $44.b		; A4 44
	.db $42, $0E		; 42 0E
	cpx $FEEE.w		; EC EE FE
	beq   2.b		; F0 02
	sty $23.b,X		; 94 23
	rol $53.b,X		; 36 53
	ora $CCBA.w,X		; 1D BA CC
	cmp $559413.l		; CF 13 94 55
	and ($12.b),Y		; 31 12
	and ($FB.b)		; 32 FB
	tax		; AA
	dec $94F1.w,X		; DE F1 94
	and $75.b,X		; 35 75
	rol $BBDC.w		; 2E DC BB
	ldy $22E0.w,X		; BC E0 22
	ldy $11.b		; A4 11
	bpl   0.b		; 10 00
	ror $20.b		; 66 20
	plx		; FA
	lda $A4CA.w,X		; BD CA A4
	tsb $35.b		; 04 35
	adc ($F1.b,X)		; 61 F1
	ora $0EFFFF.l		; 0F FF FF 0E
	bcs -36.b		; B0 DC
	cpy $23E0.w		; CC E0 23
	eor $43.b		; 45 43
	ora $1F94ED.l,X		; 1F ED 94 1F
	ora ($22.b)		; 12 22
	and ($03.b,X)		; 21 03
	.db $42, $0E		; 42 0E
	wai		; CB
	sty $CE.b,X		; 94 CE
	cmp $205524.l,X		; DF 24 55 20
	sbc $80EEEF.l,X		; FF EF EE 80
	lda $3402.w,X		; BD 02 34
	and ($46.b,S),Y		; 33 46
	eor ($0B.b,S),Y		; 53 0B
	txs		; 9A
	sty $01.b		; 84 01
	ora ($22.b,S),Y		; 13 22
	xce		; FB
	txs		; 9A
	plb		; AB
	sbc ($35.b),Y		; F1 35
	ldy $10.b		; A4 10
	bpl  52.b		; 10 34
	jsr $CE0E.w		; 20 0E CE
	jmp.w [$94E1]		; DC E1 94
	lsr $74.b		; 46 74
	and $2F.b,S		; 23 2F
	inc $FFDE.w		; EE DE FF
	cpy $E094.w		; CC 94 E0
	and $44.b,S		; 23 44
	eor $1F.b,X		; 55 1F
	wai		; CB
	dec $84EF.w		; CE EF 84
	sbc $33.b,S		; E3 33
	eor ($13.b,X)		; 41 13
	mvp $CB,$1F		; 44 1F CB
	jmp.w [$BC84]		; DC 84 BC
	ora ($57.b,S),Y		; 13 57
	eor $00.b,S		; 43 00
	sbc $E1CC.w		; ED CC E1
	sty $F0.b		; 84 F0
	ora $323211.l		; 0F 11 32 32
	jsl $84CC21.l		; 22 21 CC 84
	lda $01FF.w,X		; BD FF 01
	and $21.b		; 25 21
	asl $EBCE.w		; 0E CE EB
	sty $DF.b,X		; 94 DF
	sbc ($12.b),Y		; F1 12
	ora ($21.b),Y		; 11 21
	asl $24DE.w		; 0E DE 24
	sty $41.b,X		; 94 41
	ora $E1DCEF.l		; 0F EF DC E1
	bit $21.b,X		; 34 21
	beq -128.b		; F0 80
	eor ($EA.b)		; 52 EA
	ldx $3F35.w,Y		; BE 35 3F
	wai		; CB
	plb		; AB
	cmp $3F4584.l,X		; DF 84 45 3F
	ldy $F1CF.w		; AC CF F1
	ora $42.b,S		; 03 42
	asl $DE74.w,X		; 1E 74 DE
	jsl $EEE001.l		; 22 01 E0 EE
	tsx		; BA
	sbc ($75.b,S),Y		; F3 75
	stz $62.b,X		; 74 62
	and ($DB.b),Y		; 31 DB
	stz $30D2.w		; 9C D2 30
	sbc ($02.b)		; F2 02
	stz $00.b,X		; 74 00
	jsl $BCFE24.l		; 22 24 FE BC
	dec $15F0.w		; CE F0 15
	stz $64.b,X		; 74 64
	ora ($EF.b,X)		; 01 EF
	cpx $0200.w		; EC 00 02
	asl $84EE.w		; 0E EE 84
	ora ($34.b,X)		; 01 34
	mvp $CB,$1F		; 44 1F CB
	tyx		; BB
	sbc $557411.l		; EF 11 74 55
	bpl -22.b		; 10 EA
	plb		; AB
	cmp ($65.b,S),Y		; D3 65
	rts		; 60

	cpx $EC90.w		; EC 90 EC
	ldy $6704.w,X		; BC 04 67
	adc $2F.b,X		; 75 2F
	cmp #$9A.b		; C9 9A
	bra -97.b		; 80 9F
	and $55.b,X		; 35 55
	.db $42, $00		; 42 00
	ora ($55.b,S),Y		; 13 55
	ora $DD84.w,X		; 1D 84 DD
	brk $13.b		; 00 13
	eor $30.b,X		; 55 30
	inc $EECE.w		; EE CE EE
	stz $F2.b,X		; 74 F2
	and ($2E.b,S),Y		; 33 2E
	cpx #$03.b		; E0 03
	.db $42, $43		; 42 43
	and $ACBB74.l		; 2F 74 BB AC
	sbc ($F3.b,X)		; E1 F3
	eor $22.b,S		; 43 22
	inc $7400.w,X		; FE 00 74
	bpl   0.b		; 10 00
	brk $ED.b		; 00 ED
	lda $3301.w		; AD 01 33
	bit $64.b		; 24 64
	eor ($0A.b,X)		; 41 0A
	cpy $0F00.w		; CC 00 0F
	brk $CF.b		; 00 CF
	cmp $370364.l		; CF 64 03 37
	eor ($01.b,X)		; 41 01
	ora $B09C.w		; 0D 9C B0
	sbc $CEAC70.l,X		; FF 70 AC CE
	cpx #$00.b		; E0 00
	jsl $0E0022.l		; 22 22 00 0E
	stz $0C.b		; 64 0C
	bcs -13.b		; B0 F3
	bmi  67.b		; 30 43
	trb $0D.b		; 14 0D
	tsb $0C60.w		; 0C 60 0C
	cpy $99CC.w		; CC CC 99
	sta $CC99.w,Y		; 99 99 CC
	brk $64.b		; 00 64
	brk $00.b		; 00 00
	tsb $3000.w		; 0C 00 30
	rti		; 40

	eor ($41.b,X)		; 41 41
	bvs 102.b		; 70 66
	ror $44.b		; 66 44
	.db $42, $22		; 42 22
	jsr $EE0E.w		; 20 0E EE
	stz $0C.b		; 64 0C
	ora $0F0B0F.l		; 0F 0F 0B 0F
	beq  -1.b		; F0 FF
	sbc ($60.b,S),Y		; F3 60
	sta $CCCC.w,Y		; 99 CC CC
	cpy $00CC.w		; CC CC 00
	tsb $00.b		; 04 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	ora [$77.b]		; 07 77
	bvs   0.b		; 70 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	tsb $C9CC.w		; 0C CC C9
	sta $9999.w,Y		; 99 99 99
	adc ($99.b,X)		; 61 99
	sta $CC9C.w,Y		; 99 9C CC
	cpy $C0CC.w		; CC CC C0
	cpy #$59.b		; C0 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	bpl   0.b		; 10 00
	brk $0D.b		; 00 0D
	ldy #$1F.b		; A0 1F
	ora [$FF.b],Y		; 17 FF
	sbc $435F4C.l,X		; FF 4C 5F 43
	eor ($55.b)		; 52 55
	eor #$53.b		; 49 53
	eor $2E.b		; 45 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($1600.w)		; 6C 00 16
	ldy #$16.b		; A0 16
	sbc $172AFF.l,X		; FF FF 2A 17
	pld		; 2B
	ora [$2C.b],Y		; 17 2C
	ora [$FF.b],Y		; 17 FF
	sbc $2FFFFF.l,X		; FF FF FF 2F
	ora [$FF.b],Y		; 17 FF
	sbc $321731.l,X		; FF 31 17 32
	ora [$33.b],Y		; 17 33
	ora [$FF.b],Y		; 17 FF
	sbc $361735.l,X		; FF 35 17 36
	ora [$37.b],Y		; 17 37
	ora [$38.b],Y		; 17 38
	ora [$92.b],Y		; 17 92
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	lda ($F0.b)		; B2 F0
	bit $55.b		; 24 55
	eor $44.b,X		; 55 44
	eor $66.b,X		; 55 66
	adc [$C2.b]		; 67 C2
	mvp $44,$44		; 44 44 44
	mvp $32,$43		; 44 43 32
	and ($0F.b,X)		; 21 0F
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	brk $00.b		; 00 00
	ora $CCEDFE.l		; 0F FE ED CC
	cpy $CCC2.w		; CC C2 CC
	cmp $EEDE.w		; CD DE EE
	sbc $0100F0.l,X		; FF F0 00 01
	lda ($23.b)		; B2 23
	lsr $77.b,X		; 56 77
	adc [$77.b],Y		; 77 77
	ror $65.b,X		; 76 65
	eor $B2.b,X		; 55 B2
	mvn $46,$33		; 54 33 46
	adc [$76.b],Y		; 77 76
	eor $42.b,X		; 55 42
	asl $EEC2.w		; 0E C2 EE
	inc $CCDD.w		; EE DD CC
	cmp $AACB.w		; CD CB AA
	sta $AAC2.w,Y		; 99 C2 AA
	plb		; AB
	ldy $EFCD.w,X		; BC CD EF
	beq   0.b		; F0 00
	ora ($B2.b),Y		; 11 B2
	eor $66.b		; 45 66
	adc [$77.b],Y		; 77 77
	ror $77.b,X		; 76 77
	ror $67.b,X		; 76 67
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	mvp $45,$44		; 44 44 45
	eor $21.b,S		; 43 21
	bpl  15.b		; 10 0F
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	inc $DDED.w,X		; FE ED DD
	cpy $AABB.w		; CC BB AA
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	plb		; AB
	cmp $EEDD.w		; CD DD EE
	sbc $B2F0FF.l,X		; FF FF F0 B2
	jsl $342322.l		; 22 22 23 34
	mvp $44,$44		; 44 44 44
	lsr $B2.b,X		; 56 B2
	ror $66.b		; 66 66
	eor $54.b,X		; 55 54
	mvn $22,$32		; 54 32 22
	jsl $0F10C2.l		; 22 C2 10 0F
	inc $CCDD.w		; EE DD CC
	cpy $BBCB.w		; CC CB BB
	rep #$CC		; C2 CC
	dec $FFFF.w,X		; DE FF FF
	brk $00.b		; 00 00
	ora ($23.b),Y		; 11 23
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	mvp $33,$44		; 44 44 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	lda ($77.b)		; B2 77
	adc [$77.b],Y		; 77 77
	adc [$75.b],Y		; 77 75
	jsr $DCED.w		; 20 ED DC
.ACCU 16
	rep #$ED		; C2 ED
	jmp.w [$CCCC]		; DC CC CC
	tyx		; BB
	tax		; AA
	tax		; AA
	plb		; AB
	rep #$CD		; C2 CD
	cmp $01EF.w,X		; DD EF 01
	ora ($34.b)		; 12 34
	eor $44.b		; 45 44
	rep #$45		; C2 45
	eor $55.b,X		; 55 55
	mvp $43,$44		; 44 44 43
	and ($34.b,S),Y		; 33 34
	lda ($77.b)		; B2 77
	adc $42.b		; 65 42
	asl $CCDC.w		; 0E DC CC
	wai		; CB
	lda #$CBC2.w		; A9 C2 CB
	tsx		; BA
	tax		; AA
	lda #$9999.w		; A9 99 99
	sta $C2AB.w,Y		; 99 AB C2
	cpy $EFDE.w		; CC DE EF
	beq   0.b		; F0 00
	ora ($23.b,X)		; 01 23
	mvp $33,$C2		; 44 C2 33
	and ($23.b)		; 32 23
	bit $44.b,X		; 34 44
	mvp $43,$44		; 44 44 43
	lda ($44.b)		; B2 44
	eor $32.b,S		; 43 32
	brk $00.b		; 00 00
	ora $C2DDED.l		; 0F ED DD C2
	inc $DDED.w		; EE ED DD
	cpy $CDBC.w		; CC BC CD
	dec $B2EF.w,X		; DE EF B2
	sbc $4502FF.l		; EF FF 02 45
	eor $54.b,X		; 55 54
	eor $56.b		; 45 56
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	bit $44.b,X		; 34 44
	mvp $44,$44		; 44 44 44
	and ($22.b,S),Y		; 33 22
	lda ($1F.b)		; B2 1F
	inc $00FF.w		; EE FF 00
	ora $A9CBFD.l		; 0F FD CB A9
	rep #$CC		; C2 CC
	cpy $DDCC.w		; CC CC DD
	inc $FFEF.w		; EE EF FF
	brk $B2.b		; 00 B2
	brk $12.b		; 00 12
	and $67.b,X		; 35 67
	adc [$77.b],Y		; 77 77
	adc [$66.b],Y		; 77 66
	lda ($55.b)		; B2 55
	eor $43.b,X		; 55 43
	bit $67.b,X		; 34 67
	adc [$65.b],Y		; 77 65
	mvn $10,$C2		; 54 C2 10
	inc $EDEE.w,X		; FE EE ED
	jmp.w [$DCCC]		; DC CC DC
	tsx		; BA
.ACCU 16
	rep #$A9		; C2 A9
	txs		; 9A
	tax		; AA
	tyx		; BB
	cpy $FFDE.w		; CC DE FF
	brk $B2.b		; 00 B2
	ora ($34.b),Y		; 11 34
	lsr $67.b,X		; 56 67
	adc [$77.b],Y		; 77 77
	adc [$77.b]		; 67 77
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($44.b,S),Y		; 33 44
	mvp $54,$44		; 44 44 54
	and ($11.b)		; 32 11
	rep #$00		; C2 00
	sbc $DDEEFF.l,X		; FF FF EE DD
	jmp.w [$BACB]		; DC CB BA
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	sbc $DEB2FF.l		; EF FF B2 DE
	cop $22.b		; 02 22
	jsl $444433.l		; 22 33 44 44
	mvp $45,$B2		; 44 B2 45
	ror $66.b		; 66 66
	adc $55.b		; 65 55
	eor $43.b		; 45 43
	jsl $1111C2.l		; 22 C2 11 11
	brk $FE.b		; 00 FE
	sbc $CCDC.w		; ED DC CC
	cpy $BBC2.w		; CC C2 BB
	ldy $EFCD.w,X		; BC CD EF
	sbc $0100F0.l,X		; FF F0 00 01
.INDEX 16
	rep #$12		; C2 12
	and ($44.b,S),Y		; 33 44
	mvp $33,$43		; 44 43 33
	and ($33.b,S),Y		; 33 33
	lda ($76.b)		; B2 76
	adc [$77.b]		; 67 77
	adc [$77.b],Y		; 77 77
	adc [$52.b],Y		; 77 52
	asl $FEC2.w		; 0E C2 FE
	inc $CCDD.w		; EE DD CC
	cpy $BACB.w		; CC CB BA
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	ldy $DEDD.w,X		; BC DD DE
	beq  17.b		; F0 11
	and $44.b,S		; 23 44
.INDEX 16
	rep #$54		; C2 54
	mvp $55,$55		; 44 55 55
	mvn $44,$44		; 54 44 44
	and ($B2.b,S),Y		; 33 B2
	adc [$77.b]		; 67 77
	ror $54.b,X		; 76 54
	jsr $CCED.w		; 20 ED CC
	cpy $EDC2.w		; CC C2 ED
	jmp.w [$AABB]		; DC BB AA
	tax		; AA
	sta $9999.w,Y		; 99 99 99
.INDEX 16
	rep #$9A		; C2 9A
	ldy $EECD.w,X		; BC CD EE
	sbc $120000.l,X		; FF 00 00 12
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	eor $33.b,S		; 43 33
	jsl $444433.l		; 22 33 44 44
	mvp $44,$C2		; 44 C2 44
	and ($22.b)		; 32 22
	and ($10.b,X)		; 21 10
	brk $00.b		; 00 00
	ora $EEFEC2.l		; 0F C2 FE EE
	inc $DCDD.w		; EE DD DC
	wai		; CB
	cpy $B2DD.w		; CC DD B2
	cmp $FFDE.w		; CD DE FF
	cop $45.b		; 02 45
	eor $54.b,X		; 55 54
	eor $C2.b		; 45 C2
	and ($33.b,S),Y		; 33 33
	bit $44.b,X		; 34 44
	mvp $44,$44		; 44 44 44
	and ($B2.b,S),Y		; 33 B2
	eor ($1F.b,S),Y		; 53 1F
	inc $00FF.w		; EE FF 00
	ora $C2CBFD.l		; 0F FD CB C2
	jmp.w [$CCCC]		; DC CC CC
	cpy $EEDD.w		; CC DD EE
	sbc $F0B2FF.l		; EF FF B2 F0
	brk $12.b		; 00 12
	and $67.b,X		; 35 67
	adc [$77.b],Y		; 77 77
	adc [$B2.b],Y		; 77 B2
	ror $55.b		; 66 55
	eor $43.b,X		; 55 43
	bit $67.b,X		; 34 67
	adc [$65.b],Y		; 77 65
	lda ($54.b)		; B2 54
	jsr $DDED.w		; 20 ED DD
	wai		; CB
	sta $9999.w,Y		; 99 99 99
.ACCU 16
.INDEX 16
	rep #$BA		; C2 BA
	lda #$AA9A.w		; A9 9A AA
	tyx		; BB
	cpy $FFDE.w		; CC DE FF
	lda ($F0.b)		; B2 F0
	ora ($34.b),Y		; 11 34
	lsr $67.b,X		; 56 67
	adc [$77.b],Y		; 77 77
	adc [$C2.b]		; 67 C2
	and ($33.b,S),Y		; 33 33
	and ($44.b,S),Y		; 33 44
	mvp $54,$44		; 44 44 54
	and ($C2.b)		; 32 C2
	ora ($00.b),Y		; 11 00
	sbc $DDEEFF.l,X		; FF FF EE DD
	jmp.w [$C2CB]		; DC CB C2
	tsx		; BA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	sbc $DEDDB2.l		; EF B2 DD DE
	cop $22.b		; 02 22
	jsl $444433.l		; 22 33 44 44
	lda ($44.b)		; B2 44
	eor $66.b		; 45 66
	ror $65.b		; 66 65
	eor $45.b,X		; 55 45
	eor $B2.b,S		; 43 B2
	jsl $1F2222.l		; 22 22 22 1F
	cpx $99BA.w		; EC BA 99
	sta $CCC2.w,Y		; 99 C2 CC
	tyx		; BB
	ldy $EFCD.w,X		; BC CD EF
	sbc $C200F0.l,X		; FF F0 00 C2
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	mvp $33,$43		; 44 43 33
	and ($B2.b,S),Y		; 33 B2
	adc [$76.b]		; 67 76
	adc [$77.b]		; 67 77
	adc [$77.b],Y		; 77 77
	adc [$52.b],Y		; 77 52
	rep #$0F		; C2 0F
	inc $DDEE.w,X		; FE EE DD
	cpy $CBCC.w		; CC CC CB
	tsx		; BA
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	beq  17.b		; F0 11
	and $C2.b,S		; 23 C2
	mvp $44,$54		; 44 54 44
	eor $55.b,X		; 55 55
	mvn $44,$44		; 54 44 44
	lda ($77.b)		; B2 77
	adc [$77.b]		; 67 77
	ror $54.b,X		; 76 54
	jsr $CCED.w		; 20 ED CC
.ACCU 16
	rep #$EE		; C2 EE
	sbc $BBDC.w		; ED DC BB
	tax		; AA
	tax		; AA
	sta $C299.w,Y		; 99 99 C2
	sta $BC9A.w,Y		; 99 9A BC
	cmp $FFEE.w		; CD EE FF
	brk $00.b		; 00 00
.INDEX 16
	rep #$12		; C2 12
	bit $43.b,X		; 34 43
	and ($22.b,S),Y		; 33 22
	and ($44.b,S),Y		; 33 44
	mvp $44,$C2		; 44 C2 44
	mvp $22,$32		; 44 32 22
	and ($10.b,X)		; 21 10
	brk $00.b		; 00 00
	rep #$0F		; C2 0F
	inc $EEEE.w,X		; FE EE EE
	cmp $CBDC.w,X		; DD DC CB
	cpy $ABB2.w		; CC B2 AB
	cmp $FFDE.w		; CD DE FF
	cop $45.b		; 02 45
	eor $54.b,X		; 55 54
.ACCU 16
	rep #$22		; C2 22
	and ($33.b,S),Y		; 33 33
	bit $44.b,X		; 34 44
	mvp $44,$44		; 44 44 44
	lda ($66.b)		; B2 66
	eor ($1F.b,S),Y		; 53 1F
	inc $00FF.w		; EE FF 00
	ora $EEC2FD.l		; 0F FD C2 EE
	jmp.w [$CCCC]		; DC CC CC
	cpy $EEDD.w		; CC DD EE
	sbc $F0EFB2.l		; EF B2 EF F0
	brk $12.b		; 00 12
	and $67.b,X		; 35 67
	adc [$77.b],Y		; 77 77
	lda ($77.b)		; B2 77
	ror $55.b		; 66 55
	eor $43.b,X		; 55 43
	bit $67.b,X		; 34 67
	adc [$B2.b],Y		; 77 B2
	adc $54.b		; 65 54
	jsr $DDED.w		; 20 ED DD
	wai		; CB
	sta $C299.w,Y		; 99 99 C2
	jmp.w [$A9BA]		; DC BA A9
	txs		; 9A
	tax		; AA
	tyx		; BB
	cpy $B2DE.w		; CC DE B2
	dec $11F0.w,X		; DE F0 11
	bit $56.b,X		; 34 56
	adc [$77.b]		; 67 77
	adc [$C2.b],Y		; 77 C2
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	mvp $44,$44		; 44 44 44
	mvn $75,$B2		; 54 B2 75
	and ($0F.b),Y		; 31 0F
	inc $DCDD.w		; EE DD DC
	tsx		; BA
	lda #$CBC2.w		; A9 C2 CB
	tsx		; BA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	lda ($CD.b)		; B2 CD
	cmp $02DE.w,X		; DD DE 02
	jsl $443322.l		; 22 22 33 44
	lda ($44.b)		; B2 44
	mvp $66,$45		; 44 45 66
	ror $65.b		; 66 65
	eor $45.b,X		; 55 45
	lda ($43.b)		; B2 43
	jsl $1F2222.l		; 22 22 22 1F
	cpx $99BA.w		; EC BA 99
	rep #$CC		; C2 CC
	cpy $BCBB.w		; CC BB BC
	cmp $FFEF.w		; CD EF FF
	beq -62.b		; F0 C2
	brk $01.b		; 00 01
	ora ($33.b)		; 12 33
	mvp $43,$44		; 44 44 43
	and ($B2.b,S),Y		; 33 B2
	eor $67.b,X		; 55 67
	ror $67.b,X		; 76 67
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
.ACCU 16
	rep #$21		; C2 21
	ora $DDEEFE.l		; 0F FE EE DD
	cpy $CBCC.w		; CC CC CB
.ACCU 16
.INDEX 16
	rep #$BA		; C2 BA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	beq  17.b		; F0 11
.ACCU 16
	rep #$23		; C2 23
	mvp $44,$54		; 44 54 44
	eor $55.b,X		; 55 55
	mvn $B2,$44		; 54 44 B2
	adc [$77.b],Y		; 77 77
	adc [$77.b]		; 67 77
	ror $54.b,X		; 76 54
	jsr $C2ED.w		; 20 ED C2
	inc $EDEE.w		; EE EE ED
	jmp.w [$AABB]		; DC BB AA
	tax		; AA
	sta $99C2.w,Y		; 99 C2 99
	sta $BC9A.w,Y		; 99 9A BC
	cmp $FFEE.w		; CD EE FF
	brk $B2.b		; 00 B2
	ora ($35.b,X)		; 01 35
	adc [$77.b]		; 67 77
	adc $55.b		; 65 55
	lsr $77.b,X		; 56 77
	rep #$44		; C2 44
	mvp $32,$44		; 44 44 32
	jsl $001021.l		; 22 21 10 00
	rep #$00		; C2 00
	ora $EEEEFE.l		; 0F FE EE EE
	cmp $CBDC.w,X		; DD DC CB
	rep #$CC		; C2 CC
	cmp $FFEE.w,X		; DD EE FF
	beq   1.b		; F0 01
	jsl $22C233.l		; 22 33 C2 22
	jsl $343333.l		; 22 33 33 34
	mvp $44,$44		; 44 44 44
	lda ($77.b)		; B2 77
	ror $53.b		; 66 53
	ora $00FFEE.l,X		; 1F EE FF 00
	ora $EEFFC2.l		; 0F C2 FF EE
	jmp.w [$CCCC]		; DC CC CC
	cpy $EEDD.w		; CC DD EE
	lda ($DE.b)		; B2 DE
	sbc $1200F0.l		; EF F0 00 12
	and $67.b,X		; 35 67
	adc [$B2.b],Y		; 77 B2
	adc [$77.b],Y		; 77 77
	ror $55.b		; 66 55
	eor $43.b,X		; 55 43
	bit $67.b,X		; 34 67
	lda ($77.b)		; B2 77
	adc $54.b		; 65 54
	jsr $DDED.w		; 20 ED DD
	wai		; CB
	sta $CCC2.w,Y		; 99 C2 CC
	jmp.w [$A9BA]		; DC BA A9
	txs		; 9A
	tax		; AA
	tyx		; BB
	cpy $ACB2.w		; CC B2 AC
	dec $11F0.w,X		; DE F0 11
	bit $56.b,X		; 34 56
	adc [$77.b]		; 67 77
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	mvp $44,$44		; 44 44 44
.INDEX 16
	rep #$54		; C2 54
	and ($11.b)		; 32 11
	brk $FF.b		; 00 FF
	sbc $C2DDEE.l,X		; FF EE DD C2
	jmp.w [$BACB]		; DC CB BA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $B2DD.w,X		; BC DD B2
	ldy $DDCD.w,X		; BC CD DD
	dec $2202.w,X		; DE 02 22
	jsl $44B233.l		; 22 33 B2 44
	mvp $45,$44		; 44 44 45
	ror $66.b		; 66 66
	adc $55.b		; 65 55
	lda ($45.b)		; B2 45
	eor $22.b,S		; 43 22
	jsl $EC1F22.l		; 22 22 1F EC
	tsx		; BA
.INDEX 16
	rep #$DC		; C2 DC
	cpy $BBCC.w		; CC CC BB
	ldy $EFCD.w,X		; BC CD EF
	sbc $00F0C2.l,X		; FF C2 F0 00
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	mvp $B2,$43		; 44 43 B2
	adc $55.b		; 65 55
	adc [$76.b]		; 67 76
	adc [$77.b]		; 67 77
	adc [$77.b],Y		; 77 77
	lda ($77.b)		; B2 77
	eor ($0E.b)		; 52 0E
	cmp $A9CB.w,X		; DD CB A9
	sta $C299.w,Y		; 99 99 C2
	wai		; CB
	tsx		; BA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
	beq -62.b		; F0 C2
	ora ($23.b),Y		; 11 23
	mvp $44,$54		; 44 54 44
	eor $55.b,X		; 55 55
	mvn $44,$C2		; 54 C2 44
	mvp $33,$33		; 44 33 33
	mvp $32,$33		; 44 33 32
	bpl -62.b		; 10 C2
	inc $EEEE.w,X		; FE EE EE
	sbc $BBDC.w		; ED DC BB
	tax		; AA
	tax		; AA
.INDEX 16
	rep #$99		; C2 99
	sta $9A99.w,Y		; 99 99 9A
	ldy $EECD.w,X		; BC CD EE
	sbc $01F0B2.l,X		; FF B2 F0 01
	and $67.b,X		; 35 67
	adc [$65.b],Y		; 77 65
	eor $56.b,X		; 55 56
	rep #$44		; C2 44
	mvp $44,$44		; 44 44 44
	and ($22.b)		; 32 22
	and ($10.b,X)		; 21 10
	lda ($00.b)		; B2 00
	brk $FE.b		; 00 FE
	cmp $CCDC.w,X		; DD DC CC
	tsx		; BA
	lda #$CBC2.w		; A9 C2 CB
	cpy $EEDD.w		; CC DD EE
	sbc $2201F0.l,X		; FF F0 01 22
	lda ($55.b)		; B2 55
	mvn $56,$45		; 54 45 56
	ror $77.b		; 66 77
	adc [$77.b],Y		; 77 77
	rep #$44		; C2 44
	mvp $22,$33		; 44 33 22
	bpl  -1.b		; 10 FF
	beq   0.b		; F0 00
	rep #$00		; C2 00
	sbc $CCDCEE.l,X		; FF EE DC CC
	cpy $DDCC.w		; CC CC DD
	lda ($BC.b)		; B2 BC
	dec $F0EF.w,X		; DE EF F0
	brk $12.b		; 00 12
	and $67.b,X		; 35 67
	lda ($77.b)		; B2 77
	adc [$77.b],Y		; 77 77
	ror $55.b		; 66 55
	eor $43.b,X		; 55 43
	bit $B2.b,X		; 34 B2
	adc [$77.b]		; 67 77
	adc $54.b		; 65 54
	jsr $DDED.w		; 20 ED DD
	wai		; CB
.INDEX 16
	rep #$DC		; C2 DC
	cpy $BADC.w		; CC DC BA
	lda #$AA9A.w		; A9 9A AA
	tyx		; BB
	rep #$CC		; C2 CC
	dec $00FF.w,X		; DE FF 00
	ora ($12.b,X)		; 01 12
	and ($33.b,S),Y		; 33 33
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($44.b,S),Y		; 33 44
	mvp $44,$C2		; 44 C2 44
	mvn $11,$32		; 54 32 11
	brk $FF.b		; 00 FF
	sbc $DDC2EE.l,X		; FF EE C2 DD
	jmp.w [$BACB]		; DC CB BA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $AAB2.w,X		; BC B2 AA
	ldy $DDCD.w,X		; BC CD DD
	dec $2202.w,X		; DE 02 22
	jsl $4433B2.l		; 22 B2 33 44
	mvp $45,$44		; 44 44 45
	ror $66.b		; 66 66
	adc $B2.b		; 65 B2
	eor $45.b,X		; 55 45
	eor $22.b,S		; 43 22
	jsl $EC1F22.l		; 22 22 1F EC
.ACCU 16
	rep #$ED		; C2 ED
	jmp.w [$CCCC]		; DC CC CC
	tyx		; BB
	ldy $EFCD.w,X		; BC CD EF
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	beq   0.b		; F0 00
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	mvp $77,$B2		; 44 B2 77
	adc $55.b		; 65 55
	adc [$76.b]		; 67 76
	adc [$77.b]		; 67 77
	adc [$B2.b],Y		; 77 B2
	adc [$77.b],Y		; 77 77
	eor ($0E.b)		; 52 0E
	cmp $A9CB.w,X		; DD CB A9
	sta $CCC2.w,Y		; 99 C2 CC
	wai		; CB
	tsx		; BA
	tax		; AA
	tax		; AA
	ldy $DEDD.w,X		; BC DD DE
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ora ($23.b),Y		; 11 23
	mvp $44,$54		; 44 54 44
	eor $55.b,X		; 55 55
.INDEX 16
	rep #$54		; C2 54
	mvp $33,$44		; 44 44 33
	and ($44.b,S),Y		; 33 44
	and ($32.b,S),Y		; 33 32
.INDEX 16
	rep #$10		; C2 10
	inc $EEEE.w,X		; FE EE EE
	sbc $BBDC.w		; ED DC BB
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	sta $9999.w,Y		; 99 99 99
	txs		; 9A
	ldy $EECD.w,X		; BC CD EE
	lda ($DE.b)		; B2 DE
	beq   1.b		; F0 01
	and $67.b,X		; 35 67
	adc [$65.b],Y		; 77 65
	eor $C2.b,X		; 55 C2
	and ($44.b,S),Y		; 33 44
	mvp $44,$44		; 44 44 44
	and ($22.b)		; 32 22
	and ($B2.b,X)		; 21 B2
	jsr $0000.w		; 20 00 00
	inc $DCDD.w,X		; FE DD DC
	cpy $C2BA.w		; CC BA C2
	jmp.w [$CCCB]		; DC CB CC
	cmp $FFEE.w,X		; DD EE FF
	beq   1.b		; F0 01
	lda ($45.b)		; B2 45
	eor $54.b,X		; 55 54
	eor $56.b		; 45 56
	ror $77.b		; 66 77
	adc [$C2.b],Y		; 77 C2
	mvp $44,$44		; 44 44 44
	and ($22.b,S),Y		; 33 22
	bpl  -1.b		; 10 FF
	beq -62.b		; F0 C2
	brk $00.b		; 00 00
	sbc $CCDCEE.l,X		; FF EE DC CC
	cpy $B2CC.w		; CC CC B2
	plb		; AB
	ldy $EFDE.w,X		; BC DE EF
	beq   0.b		; F0 00
	ora ($35.b)		; 12 35
	lda ($67.b)		; B2 67
	adc [$77.b],Y		; 77 77
	adc [$66.b],Y		; 77 66
	eor $55.b,X		; 55 55
	eor $B2.b,S		; 43 B2
	bit $67.b,X		; 34 67
	adc [$65.b],Y		; 77 65
	mvn $ED,$20		; 54 20 ED
	cmp $EDC2.w,X		; DD C2 ED
	jmp.w [$DCCC]		; DC CC DC
	tsx		; BA
	lda #$AA9A.w		; A9 9A AA
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cpy $FFDE.w		; CC DE FF
	brk $01.b		; 00 01
	ora ($33.b)		; 12 33
	lda ($67.b)		; B2 67
	adc [$77.b],Y		; 77 77
	adc [$77.b]		; 67 77
	ror $77.b		; 66 77
	adc [$C2.b],Y		; 77 C2
	mvp $54,$44		; 44 44 54
	and ($11.b)		; 32 11
	brk $FF.b		; 00 FF
	sbc $DDEEC2.l,X		; FF C2 EE DD
	jmp.w [$BACB]		; DC CB BA
	tax		; AA
	tax		; AA
	tax		; AA
.ACCU 16
.INDEX 16
	rep #$BC		; C2 BC
	cmp $EFDE.w,X		; DD DE EF
	sbc $1101FF.l,X		; FF FF 01 11
	lda ($22.b)		; B2 22
	and ($44.b,S),Y		; 33 44
	mvp $45,$44		; 44 44 45
	ror $66.b		; 66 66
	lda ($65.b)		; B2 65
	eor $45.b,X		; 55 45
	eor $22.b,S		; 43 22
	jsl $C21F22.l		; 22 22 1F C2
	inc $DCED.w,X		; FE ED DC
	cpy $BBCC.w		; CC CC BB
	ldy $C2CD.w,X		; BC CD C2
	sbc $00F0FF.l		; EF FF F0 00
	ora ($12.b,X)		; 01 12
	and ($44.b,S),Y		; 33 44
	rep #$44		; C2 44
	eor $33.b,S		; 43 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	mvp $77,$B2		; 44 B2 77
	adc [$77.b],Y		; 77 77
	eor ($0E.b)		; 52 0E
	cmp $A9CB.w,X		; DD CB A9
	rep #$CC		; C2 CC
	cpy $BACB.w		; CC CB BA
	tax		; AA
	tax		; AA
	ldy $C2DD.w,X		; BC DD C2
	dec $11F0.w,X		; DE F0 11
	and $44.b,S		; 23 44
	mvn $55,$44		; 54 44 55
.INDEX 16
	rep #$55		; C2 55
	mvn $44,$44		; 54 44 44
	and ($33.b,S),Y		; 33 33
	mvp $C2,$33		; 44 33 C2
	and ($10.b)		; 32 10
	inc $EEEE.w,X		; FE EE EE
	sbc $BBDC.w		; ED DC BB
.ACCU 16
	rep #$AA		; C2 AA
	tax		; AA
	sta $9999.w,Y		; 99 99 99
	txs		; 9A
	ldy $B2CD.w,X		; BC CD B2
	ldy $F0DE.w,X		; BC DE F0
	ora ($35.b,X)		; 01 35
	adc [$77.b]		; 67 77
	adc $C2.b		; 65 C2
	jsl $444433.l		; 22 33 44 44
	mvp $32,$44		; 44 44 32
	jsl $2033B2.l		; 22 B2 33 20
	brk $00.b		; 00 00
	inc $DCDD.w,X		; FE DD DC
	cpy $DDC2.w		; CC C2 DD
	jmp.w [$CCCB]		; DC CB CC
	cmp $FFEE.w,X		; DD EE FF
	beq -78.b		; F0 B2
	cop $45.b		; 02 45
	eor $54.b,X		; 55 54
	eor $56.b		; 45 56
	ror $77.b		; 66 77
	rep #$44		; C2 44
	mvp $44,$44		; 44 44 44
	and ($22.b,S),Y		; 33 22
	bpl  -1.b		; 10 FF
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	brk $00.b		; 00 00
	sbc $CCDCEE.l,X		; FF EE DC CC
	cpy $99B2.w		; CC B2 99
	plb		; AB
	ldy $EFDE.w,X		; BC DE EF
	beq   0.b		; F0 00
	ora ($B2.b)		; 12 B2
	and $67.b,X		; 35 67
	adc [$77.b],Y		; 77 77
	adc [$66.b],Y		; 77 66
	eor $55.b,X		; 55 55
	lda ($43.b)		; B2 43
	bit $67.b,X		; 34 67
	adc [$65.b],Y		; 77 65
	mvn $ED,$20		; 54 20 ED
.ACCU 16
	rep #$EE		; C2 EE
	sbc $CCDC.w		; ED DC CC
	jmp.w [$A9BA]		; DC BA A9
	txs		; 9A
.ACCU 16
	rep #$AA		; C2 AA
	tyx		; BB
	cpy $FFDE.w		; CC DE FF
	brk $01.b		; 00 01
	ora ($B2.b)		; 12 B2
	lsr $67.b,X		; 56 67
	adc [$77.b],Y		; 77 77
	adc [$77.b]		; 67 77
	ror $77.b		; 66 77
	rep #$44		; C2 44
	mvp $54,$44		; 44 44 54
	and ($11.b)		; 32 11
	brk $FF.b		; 00 FF
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	inc $DCDD.w		; EE DD DC
	wai		; CB
	tsx		; BA
	tax		; AA
	tax		; AA
.ACCU 16
	rep #$AA		; C2 AA
	ldy $DEDD.w,X		; BC DD DE
	sbc $01FFFF.l		; EF FF FF 01
	lda ($22.b)		; B2 22
	jsl $444433.l		; 22 33 44 44
	mvp $66,$45		; 44 45 66
	lda ($66.b)		; B2 66
	adc $55.b		; 65 55
	eor $43.b		; 45 43
	jsl $C22222.l		; 22 22 22 C2
	brk $FE.b		; 00 FE
	sbc $CCDC.w		; ED DC CC
	cpy $BCBB.w		; CC BB BC
	lda ($9A.b)		; B2 9A
	cmp $FFEF.w		; CD EF FF
	beq   1.b		; F0 01
	bit $67.b,X		; 34 67
	rep #$44		; C2 44
	mvp $33,$43		; 44 43 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	lda ($77.b)		; B2 77
	adc [$77.b],Y		; 77 77
	adc [$52.b],Y		; 77 52
	asl $CBDD.w		; 0E DD CB
.INDEX 16
	rep #$DD		; C2 DD
	cpy $CBCC.w		; CC CC CB
	tsx		; BA
	tax		; AA
	tax		; AA
	ldy $DDC2.w,X		; BC C2 DD
	dec $11F0.w,X		; DE F0 11
	and $44.b,S		; 23 44
	mvn $C2,$44		; 54 44 C2
	eor $55.b,X		; 55 55
	mvn $44,$44		; 54 44 44
	and ($33.b,S),Y		; 33 33
	mvp $76,$B2		; 44 B2 76
	mvn $ED,$20		; 54 20 ED
	cpy $BACC.w		; CC CC BA
	sta $BBC2.w,Y		; 99 C2 BB
	tax		; AA
	tax		; AA
	sta $9999.w,Y		; 99 99 99
	txs		; 9A
	ldy $9AB2.w,X		; BC B2 9A
	ldy $F0DE.w,X		; BC DE F0
	ora ($35.b,X)		; 01 35
	adc [$77.b]		; 67 77
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	jsl $444433.l		; 22 33 44 44
	mvp $32,$44		; 44 44 32
	ldx #$6577.w		; A2 77 65
	and ($00.b),Y		; 31 00
	brk $EC.b		; 00 EC
	tsx		; BA
	sta $EEC3.w,Y		; 99 C3 EE
	cmp $CBDC.w,X		; DD DC CB
	cpy $EEDD.w		; CC DD EE
	sbc $4B5559.l,X		; FF 59 55 4B
	eor $000000.l		; 4F 00 00 00
	bpl   0.b		; 10 00
	brk $07.b		; 00 07
	rts		; 60

	rol $59.b,X		; 36 59
	rol $03.b		; 26 03
	jmp $485F.w		; 4C 5F 48
	eor $2E4E52.l		; 4F 52 4E 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($0000.w)		; 6C 00 00
	brk $00.b		; 00 00
	bit #$FC05.w		; 89 05 FC
	cpy $5E.b		; C4 5E
	plx		; FA
	phb		; 8B
	lsr $0E.b		; 46 0E
	rol $39.b		; 26 39
	ora [$75.b]		; 07 75
	asl $8B.b		; 06 8B
	lsr $00.b		; 46 00
	brk $9B.b		; 00 9B
	bcc   3.b		; 90 03
	brk $05.b		; 00 05
	brk $2B.b		; 00 2B
	brk $8B.b		; 00 8B
	brk $C8.b		; 00 C8
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	php		; 08
	sta ($00.b)		; 92 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	lda ($01.b)		; B2 01
	bit $1D.b		; 24 1D
	cmp $15DD.w		; CD DD 15
	bvc -17.b		; 50 EF
	ldx $24.b		; A6 24
	rts		; 60

	plb		; AB
	inc $31D1.w,X		; FE D1 31
	xba		; EB
	cmp ($B6.b)		; D2 B6
	jsl $CE2D35.l		; 22 35 2D CE
	sbc ($41.b),Y		; F1 41
	jmp.w [$B6DE]		; DC DE B6
	sbc ($32.b),Y		; F1 32
	ora $1122F1.l,X		; 1F F1 22 11
	and ($DB.b),Y		; 31 DB
	lda ($CC.b)		; B2 CC
	cmp $9CDA0F.l,X		; DF 0F DA 9C
	ora $44.b,S		; 03 44
	and $21F2B2.l		; 2F B2 F2 21
	rol $4E.b,X		; 36 4E
	tsx		; BA
	cmp $B22034.l		; CF 34 20 B2
	sbc $2E23F0.l,X		; FF F0 23 2E
	cpy $F4DD.w		; CC DD F4
	adc $A6.b,S		; 63 A6
	ldx $7302.w,Y		; BE 02 73
	wai		; CB
	dec $31B0.w,X		; DE B0 31
	sbc $13E0B6.l,X		; FF B6 E0 13
	and ($31.b,S),Y		; 33 31
	jmp.w [$22D1]		; DC D1 22
	tsb $ECC2.w		; 0C C2 EC
	cpy $01EF.w		; CC EF 01
	brk $02.b		; 00 02
	jsl $0AB634.l		; 22 34 B6 0A
	ldx $32F2.w,Y		; BE F2 32
	dec $22F1.w,X		; DE F1 22
	and ($B2.b,X)		; 21 B2
	and $0320F1.l		; 2F F1 20 03
	eor ($DB.b,X)		; 41 DB
	lda $A615.w,X		; BD 15 A6
	nop		; EA
	dec $42F2.w,X		; DE F2 42
	xce		; FB
	lda $1613.w,X		; BD 13 16
	lda ($56.b)		; B2 56
	eor ($F0.b,X)		; 41 F0
	bit $53.b		; 24 53
	ora $CDBA.w		; 0D BA CD
	ldx $11.b,Y		; B6 11
	inc $3104.w		; EE 04 31
	and ($FC.b,S),Y		; 33 FC
	cmp $4FA601.l,X		; DF 01 A6 4F
	sta $25CF.w,Y		; 99 CF 25
	stz $0D.b		; 64 0D
	cpx $3F.b		; E4 3F
	ldx $23.b,Y		; B6 23
	bit $E0BC.w		; 2C BC E0
	mvp $E1,$FD		; 44 FD E1
	ora ($A6.b)		; 12 A6
	.db $42, $FE		; 42 FE
	cmp $51F120.l,X		; DF 20 F1 51
	lda $B6C1.w,Y		; B9 C1 B6
	bit $2E.b,X		; 34 2E
	inc $21F0.w		; EE F0 21
	ora $B602DD.l		; 0F DD 02 B6
	ora ($44.b),Y		; 11 44
	ora $02DF.w,X		; 1D DF 02
	and ($DC.b),Y		; 31 DC
	dec $01A6.w,X		; DE A6 01
	bit $0B.b,X		; 34 0B
	inc $72.b,X		; F6 72
	rol $3A.b,X		; 36 3A
	sta $DDA6.w,X		; 9D A6 DD
	bit $CA.b,X		; 34 CA
	dec $7604.w		; CE 04 76
	and $B6C0.w		; 2D C0 B6
	and ($12.b,X)		; 21 12
	and $24D0CB.l		; 2F CB D0 24
	rol $A6E0.w		; 2E E0 A6
	sep #$42		; E2 42
	ora ($E9.b)		; 12 E9
	sbc $0F.b,S		; E3 0F
	eor [$09.b]		; 47 09
	ldx $90.b		; A6 90
	eor [$60.b]		; 47 60
	tax		; AA
	beq   0.b		; F0 00
	ora ($E9.b),Y		; 11 E9
	ldx $E2.b,Y		; B6 E2
	ora ($35.b),Y		; 11 35
	rol $F1CE.w,X		; 3E CE F1
	and ($DC.b,S),Y		; 33 DC
	ldx $AD.b		; A6 AD
	bne  84.b		; D0 54
	rol $64D1.w		; 2E D1 64
	and $51.b		; 25 51
	ldx $DC.b,Y		; B6 DC
	cmp $DE0E12.l,X		; DF 12 0E DE
	sbc ($44.b),Y		; F1 44
	bpl -78.b		; 10 B2
	jsr $3302.w		; 20 02 33
	lsr $4E.b		; 46 4E
	sta $22BF.w,Y		; 99 BF 22
	ldx $FF.b,Y		; B6 FF
	beq  17.b		; F0 11
	and ($EB.b,X)		; 21 EB
	sbc ($00.b),Y		; F1 00
	mvp $F9,$A6		; 44 A6 F9
	lda ($34.b),Y		; B1 34
	eor ($AB.b),Y		; 51 AB
	inc $32D0.w,X		; FE D0 32
	ldx $FD.b,Y		; B6 FD
	sbc ($22.b),Y		; F1 22
	and $2D.b,X		; 35 2D
	dec $41F1.w		; CE F1 41
	ldx $99.b		; A6 99
	ldy $54D3.w,X		; BC D3 54
	and $2244E1.l		; 2F E1 44 22
	ldx $31.b,Y		; B6 31
	stp		; DB
	cmp $DE1F12.l,X		; DF 12 1F DE
	sbc ($42.b)		; F2 42
	ldx $11.b,Y		; B6 11
	sbc $0F12.w		; ED 12 0F
	and $FA.b,S		; 23 FA
	cmp $67A213.l,X		; DF 13 A2 67
	rti		; 40

	inc $46E0.w		; EE E0 46
	bit $9999.w,X		; 3C 99 99
	lda ($F4.b)		; B2 F4
	adc $0F.b,S		; 63 0F
	beq  69.b		; F0 45
	bmi  -3.b		; 30 FD
	ldy $11B6.w,X		; BC B6 11
	sbc $2423FF.l,X		; FF FF 23 24
	and ($CC.b),Y		; 31 CC
	cpx #$64A6.w		; E0 A6 64
	sbc $D19A.w,Y		; F9 9A D1
	mvn $FE,$33		; 54 33 FE
	asl $B6.b,X		; 16 B6
	ora $BDFB34.l,X		; 1F 34 FB BD
	sbc ($32.b)		; F2 32
	sbc $A6F1.w		; ED F1 A6
	mvn $DB,$32		; 54 32 DB
	pea $061D.w		; F4 1D 06
	dec A		; 3A
	stz $BDB2.w		; 9C B2 BD
	ora $41.b,X		; 15 41
	inc $12EF.w,X		; FE EF 12
	ora $CDB2CB.l,X		; 1F CB B2 CD
	sbc ($56.b,X)		; E1 56
	eor ($F0.b,X)		; 41 F0
	bit $53.b		; 24 53
	ora $D0B6.w		; 0D B6 D0
	ora ($10.b),Y		; 11 10
	inc $2204.w,X		; FE 04 22
	and ($FC.b,S),Y		; 33 FC
	lda ($0F.b)		; B2 0F
	beq  33.b		; F0 21
	nop		; EA
	sta $02AD.w,Y		; 99 AD 02
	jsr $01B6.w		; 20 B6 01
	jsr $1D14.w		; 20 14 1D
	ldy $43D1.w,X		; BC D1 43
	sbc $9AA2.w,X		; FD A2 9A
	cpy #$6356.w		; C0 56 63
	sbc $57F111.l,X		; FF 11 F1 57
	lda ($0D.b)		; B2 0D
	ldy $5304.w,X		; BC 04 53
	asl $01DE.w		; 0E DE 01
	bpl -78.b		; 10 B2
	phx		; DA
	lda $37E0.w		; AD E0 37
	stz $10.b,X		; 74 10
	cop $45.b		; 02 45
	ldx $DC.b,Y		; B6 DC
	dec $1201.w,X		; DE 01 12
	asl $41F3.w		; 0E F3 41
	ora ($A6.b,S),Y		; 13 A6
	tsa		; 3B
	sta $43CD.w,X		; 9D CD 43
	cmp $F4DE.w,Y		; D9 DE F4
	ror $B6.b,X		; 76 B6
	ora $1212E0.l,X		; 1F E0 12 12
	bpl -53.b		; 10 CB
	cmp $41A234.l,X		; DF 34 A2 41
	jmp.w [$14BD]		; DC BD 14
	lsr $3D.b		; 46 3D
	ldx $B2ED.w,Y		; BE ED B2
	trb $40.b		; 14 40
	cmp $65F3.w,X		; DD F3 65
	and $B6EEEE.l		; 2F EE EE B6
	bpl  -3.b		; 10 FD
.INDEX 8
	sep #$11		; E2 11
	and $3E.b,X		; 35 3E
	dec $B2F1.w		; CE F1 B2
	rol $3E.b,X		; 36 3E
	tsx		; BA
	txs		; 9A
	cmp $13DE0F.l		; CF 0F DE 13
.ACCU 16
	rep #$23		; C2 23
	mvp $FE,$20		; 44 20 FE
	beq  15.b		; F0 0F
	sbc $B6CD.w		; ED CD B6
	mvp $FE,$10		; 44 10 FE
	cop $10.b		; 02 10
	jsl $B6CFEA.l		; 22 EA CF B6
	trb $30.b		; 14 30
	sbc $2111F0.l,X		; FF F0 11 21
	xba		; EB
	sbc ($B6.b),Y		; F1 B6
	brk $44.b		; 00 44
	tsb $12E0.w		; 0C E0 12
	bmi -34.b		; 30 DE
	sbc $20F0B6.l,X		; FF B6 F0 20
	inc $31E1.w,X		; FE E1 31
	and $2E.b,X		; 35 2E
	cmp $E0B2.w		; CD B2 E0
	bit $1D.b,X		; 34 1D
	lda $DF9A.w,Y		; B9 9A DF
	brk $FF.b		; 00 FF
	ldx $22.b,Y		; B6 22
	ora ($41.b),Y		; 11 41
	wai		; CB
	cmp $DD2F21.l,X		; DF 21 2F DD
	lda ($9C.b)		; B2 9C
	ora $44.b,S		; 03 44
	and $3621F2.l		; 2F F2 21 36
	lsr $BAB2.w		; 4E B2 BA
	cmp $FF2034.l		; CF 34 20 FF
	beq  35.b		; F0 23
	rol $E0B6.w		; 2E B6 E0
	brk $24.b		; 00 24
	rol $01DF.w,X		; 3E DF 01
	and ($ED.b)		; 32 ED
	ldx $ED.b		; A6 ED
	cpy #$21.b		; C0 21
	asl $35DF.w		; 0E DF 35
	ror $71.b		; 66 71
	ldx $DC.b,Y		; B6 DC
	cpx #$32.b		; E0 32
	sbc $E1CD.w,X		; FD CD E1
	and $12.b,S		; 23 12
	ldx $FF.b,Y		; B6 FF
	ora ($00.b,S),Y		; 13 00
	bit $0A.b		; 24 0A
	ldx $32F2.w,Y		; BE F2 32
	ldx $BA.b		; A6 BA
.INDEX 8
	sep #$54		; E2 54
	eor ($DB.b,X)		; 41 DB
	sbc $1C.b,X		; F5 1C
	asl $B2.b		; 06 B2
	eor ($DB.b,X)		; 41 DB
	lda $4115.w,X		; BD 15 41
	inc $12EF.w,X		; FE EF 12
	lda ($1F.b)		; B2 1F
	wai		; CB
	cmp $56E1.w		; CD E1 56
	eor ($F0.b,X)		; 41 F0
	bit $A6.b		; 24 A6
	ora $AFBA.w,X		; 1D BA AF
	jsl $16DC21.l		; 22 21 DC 16
	adc $B6.b,S		; 63 B6
	and ($FC.b,S),Y		; 33 FC
	cmp $DC2F01.l,X		; DF 01 2F DC
	cpx #$13.b		; E0 13
	ldx $22.b,Y		; B6 22
	ora $2310F2.l		; 0F F2 10 23
	ora $E0BC.w,X		; 1D BC E0
	ldx #$C3.b		; A2 C3
	tas		; 1B
	txs		; 9A
	cpy #$56.b		; C0 56
	adc $FF.b,S		; 63 FF
	ora ($B6.b),Y		; 11 B6
	sbc ($21.b),Y		; F1 21
	jmp.w [$34E1]		; DC E1 34
	rol $F0EE.w		; 2E EE F0
	ldx $21.b,Y		; B6 21
	ora $1102DD.l		; 0F DD 02 11
	mvp $DF,$1D		; 44 1D DF
	ldx $02.b,Y		; B6 02
	and ($DC.b),Y		; 31 DC
	dec $1201.w,X		; DE 01 12
	asl $A6F3.w		; 0E F3 A6
	adc ($36.b)		; 72 36
	dec A		; 3A
	ldy $34DD.w		; AC DD 34
	cmp $B6CE.w,Y		; D9 CE B6
	cop $43.b		; 02 43
	asl $21E0.w,X		; 1E E0 21
	ora ($2F.b)		; 12 2F
	wai		; CB
	lda ($A9.b)		; B2 A9
	cpy #$20.b		; C0 20
	inc $12EE.w,X		; FE EE 12
	and $2E.b,S		; 23 2E
	ldx $E3.b		; A6 E3
	ora $900947.l		; 0F 47 09 90
	eor [$60.b]		; 47 60
	tax		; AA
	ldx $F0.b,Y		; B6 F0
	brk $10.b		; 00 10
	sbc $11E2.w,X		; FD E2 11
	and $3E.b,X		; 35 3E
	lda ($20.b)		; B2 20
	beq  54.b		; F0 36
	rol $9ABA.w,X		; 3E BA 9A
	cmp $E1A60F.l		; CF 0F A6 E1
	stz $24.b		; 64 24
	rts		; 60

	lda #$34AD.w		; A9 AD 34
	phd		; 0B
	lda ($BA.b)		; B2 BA
	txs		; 9A
	sbc ($44.b,S),Y		; F3 44
	jsr $3302.w		; 20 02 33
	lsr $B6.b		; 46 B6
	plx		; FA
	lda $EF3123.l,X		; BF 23 31 EF
	beq  17.b		; F0 11
	and ($B2.b,X)		; 21 B2
	ora $DDCD.w,X		; 1D CD DD
	ora $50.b,X		; 15 50
	sbc $B65502.l		; EF 02 55 B6
	cmp $E00F.w,X		; DD 0F E0
	and ($FD.b,X)		; 21 FD
	sbc ($22.b),Y		; F1 22
	bit $C2.b,X		; 34 C2
	eor ($10.b,S),Y		; 53 10
	beq  34.b		; F0 22
	asl $CDDC.w		; 0E DC CD
	beq -74.b		; F0 B6
	ora $1122F1.l,X		; 1F F1 22 11
	and ($DB.b),Y		; 31 DB
	cpy #$12.b		; C0 12
	lda ($0F.b)		; B2 0F
	phx		; DA
	stz $4403.w		; 9C 03 44
	and $B221F2.l		; 2F F2 21 B2
	rol $4E.b,X		; 36 4E
	tsx		; BA
	cmp $FF2034.l		; CF 34 20 FF
	beq -74.b		; F0 B6
	ora ($ED.b)		; 12 ED
	cpx #$00.b		; E0 00
	and $2E.b		; 25 2E
	cmp $73A601.l,X		; DF 01 A6 73
	wai		; CB
	cmp $31C0.w,X		; DD C0 31
	inc $36DF.w,X		; FE DF 36
	ldx $33.b,Y		; B6 33
	and ($DB.b),Y		; 31 DB
	sbc ($22.b,X)		; E1 22
	tsb $E1DD.w		; 0C DD E1
	ldx $22.b,Y		; B6 22
	and ($0F.b,X)		; 21 0F
	ora $10.b,S		; 03 10
	bit $FB.b		; 24 FB
	ldx $D3A6.w,Y		; BE A6 D3
	adc ($CA.b,S),Y		; 73 CA
.INDEX 8
	sep #$54		; E2 54
	eor ($DB.b,X)		; 41 DB
	sbc $B2.b,X		; F5 B2
	jsr $4103.w		; 20 03 41
	stp		; DB
	lda $4115.w,X		; BD 15 41
	inc $EFB2.w,X		; FE B2 EF
	ora ($1F.b)		; 12 1F
	wai		; CB
	cmp $56E1.w		; CD E1 56
	eor ($A6.b,X)		; 41 A6
	sbc ($45.b,X)		; E1 45
	and $AFBA.w		; 2D BA AF
	jsl $B6DC21.l		; 22 21 DC B6
	tsb $22.b		; 04 22
	and ($FC.b,S),Y		; 33 FC
	cmp $DC2F01.l,X		; DF 01 2F DC
	ldx $CF.b		; A6 CF
	and $54.b,X		; 35 54
	trb $30F3.w		; 1C F3 30
	and [$39.b],Y		; 37 39
	lda ($FB.b)		; B2 FB
	txs		; 9A
	sep #$0E		; E2 0E
	cmp $23E0.w		; CD E0 23
	and ($B6.b),Y		; 31 B6
	cpx #$10.b		; E0 10
	sbc ($21.b),Y		; F1 21
	cmp $44E0.w,X		; DD E0 44
	ora $DE0EB2.l,X		; 1F B2 0E DE
	ora ($10.b,X)		; 01 10
	phx		; DA
	lda $37E0.w		; AD E0 37
	ldx $0D.b,Y		; B6 0D
	bne   2.b		; D0 02
	and ($DC.b,X)		; 21 DC
	dec $2101.w,X		; DE 01 21
	ldx $0C.b		; A6 0C
	inc $72.b,X		; F6 72
	rol $3A.b,X		; 36 3A
	sta $34CE.w,X		; 9D CE 34
	ldx $CA.b		; A6 CA
	dec $76F5.w		; CE F5 76
	and $32C0.w		; 2D C0 32
	bit $B6.b		; 24 B6
	and $24C0CC.l		; 2F CC C0 24
	rol $F1FF.w		; 2E FF F1
	and ($B2.b,X)		; 21 B2
	and $2E.b,S		; 23 2E
	cmp $4014FE.l,X		; DF FE 14 40
	cmp $A6F3.w,X		; DD F3 A6
	rts		; 60

	tax		; AA
	cpx #$00.b		; E0 00
	ora ($DA.b)		; 12 DA
	cmp $32.b,S		; C3 32
	ldx $35.b,Y		; B6 35
	rol $F1CE.w,X		; 3E CE F1
	and ($DC.b,S),Y		; 33 DC
	dec $A6F0.w,X		; DE F0 A6
	mvn $D1,$2E		; 54 2E D1
	stz $24.b		; 64 24
	rts		; 60

	lda #$B2AD.w		; A9 AD B2
	cpx #$0E.b		; E0 0E
	tsx		; BA
	txs		; 9A
	sbc ($44.b,S),Y		; F3 44
	jsr $B302.w		; 20 02 B3
	and ($46.b,S),Y		; 33 46
	lsr $BF99.w		; 4E 99 BF
	jsl $59FF1F.l		; 22 1F FF 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $1A.b		; 00 1A
	ldy #$A7.b		; A0 A7
	asl $A8.b,X		; 16 A8
	asl $59.b,X		; 16 59
	eor $41.b		; 45 41
	pha		; 48
	rol $6F73.w		; 2E 73 6F
	jmp ($1600.w)		; 6C 00 16
	jsl $162316.l		; 22 16 23 16
	bit $16.b		; 24 16
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $16BAFF.l,X		; FF FF BA 16
	tyx		; BB
	asl $BC.b,X		; 16 BC
	asl $BD.b,X		; 16 BD
	asl $FF.b,X		; 16 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $0099.w,Y		; 99 99 00
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$5499.w		; 09 99 54
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq 112.b		; F0 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	ora #$9999.w		; 09 99 99
	sta $9999.w,Y		; 99 99 99
	stz $CF.b		; 64 CF
	ora $70CC4F.l		; 0F 4F CC 70
	cmp $4C.b,S		; C3 4C
	ora $50.b,S		; 03 50
	bvs   0.b		; 70 00
	adc [$70.b],Y		; 77 70
	adc [$77.b],Y		; 77 77
	bvs   0.b		; 70 00
	bvc   0.b		; 50 00
	ora #$9999.w		; 09 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9099.w,Y		; 99 99 90
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$0990.w		; 09 90 09
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	mvn $F7,$09		; 54 09 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	ora #$9990.w		; 09 90 99
	sta $9999.w,Y		; 99 99 99
	sta $0F54.w,Y		; 99 54 0F
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $6499.w,Y		; 99 99 64
	ora $FCF0C0.l		; 0F C0 F0 FC
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($3C.b,S),Y		; F3 3C
	rts		; 60

	stz $04CC.w		; 9C CC 04
	tsb $47.b		; 04 47
	adc [$47.b],Y		; 77 47
	adc [$60.b],Y		; 77 60
	adc [$44.b],Y		; 77 44
	mvp $00,$00		; 44 00 00
	tsb $CCCC.w		; 0C CC CC
	rts		; 60

	cpy $CC99.w		; CC 99 CC
	cpy $00C0.w		; CC C0 00
	mvp $64,$44		; 44 44 64
	brk $10.b		; 00 10
	brk $1C.b		; 00 1C
	tsb $CC00.w		; 0C 00 CC
	lda $AC2174.l,X		; BF 74 21 AC
	eor ($CE.b,S),Y		; 53 CE
	eor $021FE6.l,X		; 5F E6 1F 02
	bvs  70.b		; 70 46
	stz $47.b		; 64 47
	ror $64.b,X		; 76 64
	mvp $00,$64		; 44 64 00
	stz $3D.b		; 64 3D
	tsb $F0C0.w		; 0C C0 F0
	jsr ($3FF0.w,X)		; FC F0 3F
	cmp $CC9960.l		; CF 60 99 CC
	cpy $0000.w		; CC 00 00
	brk $47.b		; 00 47
	rti		; 40

	rts		; 60

	eor [$77.b]		; 47 77
	stz $77.b,X		; 74 77
	stz $00.b,X		; 74 00
	rti		; 40

	cmp #$0084.w		; C9 84 00
	sbc $CB22EE.l,X		; FF EE 22 CB
	mvp $20,$DF		; 44 DF 20
	stz $D7.b,X		; 74 D7
	lsr $53F2.w		; 4E F2 53
	sbc $1F24.w		; ED 24 1F
	ora $3CE274.l		; 0F 74 E2 3C
	bcs  32.b		; B0 20
	cpx $0FE1.w		; EC E1 0F
	asl $F264.w		; 0E 64 F2
	bmi -49.b		; 30 CF
	adc ($4D.b,S),Y		; 73 4D
	bit $54.b,X		; 34 54
	ora $0184.w,X		; 1D 84 01
	bpl  -1.b		; 10 FF
	brk $FD.b		; 00 FD
	sbc $740CE1.l,X		; FF E1 0C 74
	stx $6A.b,Y		; 96 6A
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	eor ($E0.b)		; 52 E0
	lsr $2D.b,X		; 56 2D
	stz $F4.b,X		; 74 F4
	adc ($DF.b,X)		; 61 DF
	sbc ($10.b)		; F2 10
	lda $0A02.w,X		; BD 02 0A
	stz $C0.b,X		; 74 C0
	bpl -19.b		; 10 ED
	sbc ($50.b,X)		; E1 50
	cmp $842F63.l		; CF 63 2F 84
	ora ($11.b),Y		; 11 11
	beq -16.b		; F0 F0
	asl $01EF.w		; 0E EF 01
	ldx $4374.w,Y		; BE 74 43
	lda $4FF312.l		; AF 12 F3 4F
	cop $44.b		; 02 44
	sbc $554580.l		; EF 80 45 55
	mvp $42,$44		; 44 44 42
	bpl  17.b		; 10 11
	sbc $AC70.w,X		; FD 70 AC
	cpy $AECA.w		; CC CA AE
	jsr $66E0.w		; 20 E0 66
	.db $42, $84		; 42 84
	brk $FE.b		; 00 FE
	inc $9D31.w		; EE 31 9D
	eor ($CF.b)		; 52 CF
	ora ($74.b)		; 12 74
	ora ($20.b,S),Y		; 13 20
	tsb $64.b		; 04 64
	stp		; DB
	ror $FD.b		; 66 FD
	inc $1274.w,X		; FE 74 12
	plx		; FA
	cmp ($00.b),Y		; D1 00
	cpy $FE14.w		; CC 14 FE
	ora $94.b,S		; 03 94
	ora ($00.b,X)		; 01 00
	bpl   0.b		; 10 00
	sbc $EC01F0.l,X		; FF F0 01 EC
	bcc -81.b		; 90 AF
	jsr ($F0BD.w,X)		; FC BD F0
	brk $00.b		; 00 00
	bit $31.b		; 24 31
	sty $15.b		; 84 15
	and $31CF.w,X		; 3D CF 31
	sbc $11D0.w,X		; FD D0 11
	sbc $E384.w,X		; FD 84 E3
	bmi -32.b		; 30 E0
	ora ($2F.b,S),Y		; 13 2F
	cmp ($1F.b),Y		; D1 1F
	wai		; CB
	sty $14.b,X		; 94 14
	dex		; CA
	and $ED.b,X		; 35 ED
	ora $10.b,S		; 03 10
	ora ($00.b,X)		; 01 00
	sty $26.b		; 84 26
	asl A		; 0A
	ora $2D.b		; 05 2D
	cmp $E0FF20.l		; CF 20 FF E0
	bra -33.b		; 80 DF
	ora $45CF.w		; 0D CF 45
	bpl  53.b		; 10 35
	bvc -53.b		; 50 CB
	ldy #$00EE.w		; A0 EE 00
	wai		; CB
	sbc ($EC.b),Y		; F1 EC
	cpx #$0011.w		; E0 11 00
	bcc  19.b		; 90 13
	ror $20.b		; 66 20
	rol $50.b,X		; 36 50
	sbc $90FC11.l		; EF 11 FC 90
	dec $EE00.w		; CE 00 EE
	cop $32.b		; 02 32
	brk $11.b		; 00 11
	xce		; FB
	sty $F4.b,X		; 94 F4
	inc A		; 1A
	cmp $4E.b		; C5 4E
	cmp ($22.b),Y		; D1 22
	ora ($00.b),Y		; 11 00
	sty $F5.b		; 84 F5
	eor $5290.w,X		; 5D 90 52
	cmp #$2FF1.w		; C9 F1 2F
	dec $0484.w		; CE 84 04
	eor $E956C0.l,X		; 5F C0 56 E9
	cmp ($0B.b)		; D2 0B
	sbc [$A0.b],Y		; F7 A0
	xce		; FB
	cmp ($1E.b),Y		; D1 1E
	bne  34.b		; D0 22
	bpl  18.b		; 10 12
	and $90.b,S		; 23 90
	eor ($02.b),Y		; 51 02
	and ($DC.b),Y		; 31 DC
	sbc ($FB.b),Y		; F1 FB
	bcs  33.b		; B0 21
	ldy #$1200.w		; A0 00 12
	bpl  -1.b		; 10 FF
	sbc $EAE0.w,X		; FD E0 EA
	cmp ($94.b,X)		; C1 94
	ora #$62D5.w		; 09 D5 62
	inc $1212.w		; EE 12 12
	xce		; FB
	sbc ($90.b)		; F2 90
	.db $42, $DA		; 42 DA
	bne  -3.b		; D0 FD
	cpx #$3201.w		; E0 01 32
	bpl -96.b		; 10 A0
	brk $FC.b		; 00 FC
	cpy #$9F1B.w		; C0 1B 9F
	jsr $13EE.w		; 20 EE 13
	bcc  84.b		; 90 54
	eor $35.b		; 45 35
	stz $FD.b,X		; 74 FD
	ora $0B.b,S		; 03 0B
	plb		; AB
	sty $33.b,X		; 94 33
	asl $50F3.w		; 0E F3 50
	cpy $DCF3.w		; CC F3 DC
	and ($A4.b)		; 32 A4
	dec $ED44.w		; CE 44 ED
	tsb $30.b		; 04 30
	sbc $940021.l		; EF 21 00 94
	jmp.w [$2DF2]		; DC F2 2D
	cmp $3E25.w		; CD 25 3E
	cmp ($45.b),Y		; D1 45
	ldy $FE.b		; A4 FE
	cpx #$110F.w		; E0 0F 11
	cpy $1C36.w		; CC 36 1C
.ACCU 8
	sep #$A4		; E2 A4
	eor ($EE.b)		; 52 EE
	cop $01.b		; 02 01
	sbc $20F1.w		; ED F1 20
	cmp $2694.w,X		; DD 94 26
	bvc -34.b		; 50 DE
	rol $3A.b,X		; 36 3A
	stz $3200.w,X		; 9E 00 32
	ldy $BB.b		; A4 BB
	lsr $2C.b		; 46 2C
	cmp ($54.b)		; D2 54
	sbc $12F1.w,X		; FD F1 12
	ldy $EC.b		; A4 EC
	cpx #$DD31.w		; E0 31 DD
	ora $41.b,S		; 03 41
	dec $B424.w,X		; DE 24 B4
	asl $00EF.w,X		; 1E EF 00
	and $0E43BF.l,X		; 3F BF 43 0E
.ACCU 8
	sep #$A4		; E2 A4
	adc $ED.b,S		; 63 ED
	sbc ($22.b,X)		; E1 22
	stp		; DB
	sbc ($40.b,X)		; E1 40
	cmp $13B4.w		; CD B4 13
	and $FE12E0.l		; 2F E0 12 FE
	sbc $A4EC14.l		; EF 14 EC A4
	cmp [$71.b],Y		; D7 71
	cmp $3025.w		; CD 25 30
	cmp $3EF2.w,X		; DD F2 3E
	ldy #$BFDA.w		; A0 DA BF
	asl $15CC.w		; 0E CC 15
	.db $42, $12		; 42 12
	and ($A4.b)		; 32 A4
	nop		; EA
	sbc [$39.b]		; E7 39
	sty $74.b,X		; 94 74
	sbc $3014.w		; ED 14 30
	ldy $0E.b		; A4 0E
	cmp $E2DC21.l,X		; DF 21 DC E2
	bmi -17.b		; 30 EF
	bit $B4.b,X		; 34 B4
	brk $00.b		; 00 00
	ora $4FE00E.l		; 0F 0E E0 4F
	bcs  52.b		; B0 34
	ldy $0D.b		; A4 0D
	sbc $51.b,S		; E3 51
	sbc $FC02ED.l,X		; FF ED 02 FC
	cmp $FF33A4.l,X		; DF A4 33 FF
	ora ($31.b,S),Y		; 13 31
	beq  -1.b		; F0 FF
	inc $B4BE.w		; EE BE B4
	rti		; 40

	dec $1F34.w		; CE 34 1F
	sbc ($22.b),Y		; F1 22
	sbc $F2A4FE.l,X		; FF FE A4 F2
	ora $24CF.w		; 0D CF 24
	ora $F03212.l,X		; 1F 12 32 F0
	ldy $FF.b,X		; B4 FF
	sbc $DC23EE.l,X		; FF EE 23 DC
	rol $2F.b		; 26 2F
	beq -92.b		; F0 A4
	mvp $ED,$FD		; 44 FD ED
	cmp ($1E.b,X)		; C1 1E
	dec $4014.w,X		; DE 14 40
	ldy $01.b,X		; B4 01
	ora ($00.b),Y		; 11 00
	inc $EEE0.w,X		; FE E0 EE
	trb $EB.b		; 14 EB
	ldy $26.b,X		; B4 26
	and $FE22F0.l,X		; 3F F0 22 FE
	inc $00E0.w,X		; FE E0 00
	ldy $DF.b		; A4 DF
	ora $52.b		; 05 52
	ora ($02.b),Y		; 11 02
	and $B4CFCB.l		; 2F CB CF B4
	sbc $1B05.w,X		; FD 05 1B
	sbc [$50.b],Y		; F7 50
	sbc $A40D12.l		; EF 12 0D A4
	cmp $11CE.w		; CD CE 11
	asl $7414.w		; 0E 14 74
	brk $01.b		; 00 01
	ldy $00.b,X		; B4 00
	sbc $FCD0.w		; ED D0 FC
	asl $2B.b,X		; 16 2B
	sbc [$70.b]		; E7 70
	ldy $BC.b		; A4 BC
	tsb $FA.b		; 04 FA
	ldy $24CE.w,X		; BC CE 24
	ora $43B405.l,X		; 1F 05 B4 43
	asl $1FF0.w		; 0E F0 1F
	jmp.w [$FDE0]		; DC E0 FD
	and [$C0.b],Y		; 37 C0
	asl $65E3.w,X		; 1E E3 65
	and ($11.b,X)		; 21 11
	ora $B4CCED.l,X		; 1F ED CC B4
	and $2F.b,S		; 23 2F
	ora ($52.b)		; 12 52
	sbc $0EE0.w,X		; FD E0 0E
	cmp $CCC0.w,X		; DD C0 CC
	ldy $0D13.w,X		; BC 13 0D
	asl $74.b,X		; 16 74
	ora $DDB401.l,X		; 1F 01 B4 DD
	dec $4402.w,X		; DE 02 44
	ora $CD4F14.l		; 0F 14 4F CD
	cpy $F0.b		; C4 F0
	ora $0400EF.l		; 0F EF 00 04
	lsr $53D0.w		; 4E D0 53
	ldy $C9.b,X		; B4 C9
	lda $E0EE20.l,X		; BF 20 EE E0
	bit $43.b		; 24 43
	inc $23C0.w,X		; FE C0 23
	.db $42, $0E		; 42 0E
	inc $DCEE.w		; EE EE DC
	ldx $C446.w,Y		; BE 46 C4
	lda $0E35.w,X		; BD 35 0E
	cmp $0001.w,X		; DD 01 00
	ora $37B0F2.l		; 0F F2 B0 37
	stz $23.b,X		; 74 23
	eor $2D.b,X		; 55 2D
	tyx		; BB
	cmp $C4CB.w		; CD CB C4
	ora $C13D24.l		; 0F 24 3D C1
	eor ($EC.b,X)		; 41 EC
	beq  16.b		; F0 10
	ldy $00.b,X		; B4 00
	brk $15.b		; 00 15
	eor ($CD.b,X)		; 41 CD
	cop $0E.b		; 02 0E
	dec $01C4.w		; CE C4 01
	ora ($FE.b,X)		; 01 FE
	ora $4F.b		; 05 4F
	ldx $DC54.w		; AE 54 DC
	bcs -84.b		; B0 AC
	cpy $0EE0.w		; CC E0 0E
	cmp ($67.b),Y		; D1 67
	and $0FC403.l,X		; 3F 03 C4 0F
	sbc $0F0001.l,X		; FF 01 00 0F
	sbc ($44.b,X)		; E1 44
	phx		; DA
	cpy #$52D3.w		; C0 D3 52
	inc $F0EF.w		; EE EF F0
	ora $A413EE.l		; 0F EE 13 A4
	ora $5193.w,Y		; 19 93 51
	stp		; DB
	cpy #$1D22.w		; C0 22 1D
	txy		; 9B
	cpy $35.b		; C4 35
	tas		; 1B
	cmp $6F.b,S		; C3 6F
	dec $0001.w		; CE 01 00
	bpl -76.b		; 10 B4
	cmp $CF2E26.l,X		; DF 26 2E CF
	and ($EF.b),Y		; 31 EF
	sbc $00C010.l		; EF 10 C0 00
	sbc $64D1.w,X		; FD D1 64
	cpx $3E16.w		; EC 16 3E
	cmp $F1EEB0.l,X		; DF B0 EE F1
	ora $66D1.w		; 0D D1 66
	asl $2003.w,X		; 1E 03 20
	cpy #$FFFF.w		; C0 FF FF
	beq  14.b		; F0 0E
	cmp $E41B46.l,X		; DF 46 1B E4
	cpy $1B.b		; C4 1B
	cmp ($10.b),Y		; D1 10
	ora ($0F.b,X)		; 01 0F
	sbc ($31.b),Y		; F1 31
	inc $E2B0.w		; EE B0 E2
	eor ($EE.b,X)		; 41 EE
	sbc $CBFE00.l		; EF 00 FE CB
	inc $C4.b		; E6 C4
	and $62B1.w		; 2D B1 62
	cpy $1F02.w		; CC 02 1F
	ora ($FF.b,X)		; 01 FF
	bcs -29.b		; B0 E3
	adc $EE.b,S		; 63 EE
	bit $2E.b		; 24 2E
	dec $FFF0.w,X		; DE F0 FF
	cpy #$D0FE.w		; C0 FE D0
	eor $FB.b,X		; 55 FB
	sbc $5F.b,X		; F5 5F
	dec $B40F.w		; CE 0F B4
	sbc ($1D.b)		; F2 1D
	sbc $62.b,S		; E3 62
	ldy $2D14.w,X		; BC 14 2D
	cpy #$EFB0.w		; C0 B0 EF
	brk $FE.b		; 00 FE
	cmp $64F3.w,X		; DD F3 64
	xba		; EB
	ora [$B0.b]		; 07 B0
	adc $1FF2AB.l		; 6F AB F2 1F
	inc $44F2.w		; EE F2 44
	asl $23B4.w		; 0E B4 23
	ora $22DF.w,X		; 1D DF 22
	asl $D1F0.w		; 0E F0 D1
	adc [$C0.b],Y		; 77 C0
	and $63B1.w,X		; 3D B1 63
	jmp.w [$FFF1]		; DC F1 FF
	brk $FE.b		; 00 FE
	bcs  23.b		; B0 17
	eor $FC44C0.l,X		; 5F C0 44 FC
	cpx #$FF00.w		; E0 00 FF
	cpy $FE.b		; C4 FE
	trb $4D.b		; 14 4D
	lda $02CB65.l		; AF 65 CB 02
	brk $B4.b		; 00 B4
	cop $ED.b		; 02 ED
	asl $4E.b		; 06 4E
	lda $0C44.w,X		; BD 44 0C
	cmp ($C4.b),Y		; D1 C4
	ora ($00.b,X)		; 01 00
	sbc $FB33F1.l,X		; FF F1 33 FB
	cpx $5F.b		; E4 5F
	bcs -55.b		; B0 C9
	bne  -1.b		; D0 FF
	bpl -35.b		; 10 DD
	asl $5F.b,X		; 16 5F
	cmp $CD51B4.l		; CF B4 51 CD
	cop $11.b		; 02 11
	sbc $71F4FE.l,X		; FF FE F4 71
	cpy #$E40C.w		; C0 0C E4
	bvc -35.b		; 50 DD
	brk $00.b		; 00 00
	ora $62B4EF.l		; 0F EF B4 62
	wai		; CB
	trb $2E.b		; 14 2E
	cmp $FE1021.l		; CF 21 10 FE
	cpy $FF.b		; C4 FF
	bit $1C.b		; 24 1C
	cmp ($62.b,X)		; C1 62
	cpy $0F03.w		; CC 03 0F
	ldy $21.b,X		; B4 21
	sbc $3C25.w		; ED 25 3C
	bcs  66.b		; B0 42
	sbc $B0E1.w,X		; FD E1 B0
	beq  33.b		; F0 21
	sbc $15DE.w,X		; FD DE 15
	bvc -83.b		; 50 AD
	eor [$B4.b],Y		; 57 B4
	lda #$F4.b		; A9 F4
	and $23FFF0.l,X		; 3F F0 FF 23
	and $C0C0.w		; 2D C0 C0
	ora ($1F.b)		; 12 1F
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $1CC024.l		; EF 24 C0 1C
	cmp ($51.b,S),Y		; D3 51
	cmp $F000.w,X		; DD 00 F0
	bpl -17.b		; 10 EF
	bcs  54.b		; B0 36
	and $22D0.w		; 2D D0 22
	inc $02F0.w,X		; FE F0 02
	ora $E0FEC0.l,X		; 1F C0 FE E0
	and $0D.b,S		; 23 0D
	sep #$41		; E2 41
	cmp $B001.w,X		; DD 01 B0
	brk $0F.b		; 00 0F
	sbc $D02E34.l		; EF 34 2E D0
	and ($FD.b)		; 32 FD
	bcs -32.b		; B0 E0
	ora ($0E.b)		; 12 0E
	sbc $65D1.w		; ED D1 65
	sbc #$E7.b		; E9 E7
	bcs 126.b		; B0 7E
	lda $0100.w		; AD 00 01
	asl $44D0.w,X		; 1E D0 44
	ora $E1B0.w		; 0D B0 E1
	and ($FE.b)		; 32 FE
	beq  17.b		; F0 11
	asl $D2DC.w		; 0E DC D2
	cpy #$ED32.w		; C0 32 ED
	trb $3F.b		; 14 3F
	cmp $0F0000.l,X		; DF 00 00 0F
	bcs -31.b		; B0 E1
	mvp $E1,$FD		; 44 FD E1
	and ($FE.b,X)		; 21 FE
	beq  17.b		; F0 11
	cpy $F0.b		; C4 F0
	sbc $D21C23.l,X		; FF 23 1C D2
	.db $42, $CD		; 42 CD
	ora ($B0.b),Y		; 11 B0
	brk $11.b		; 00 11
	sbc $51F3.w,X		; FD F3 51
	sbc $2002.w		; ED 02 20
	bcs -17.b		; B0 EF
	sbc ($21.b),Y		; F1 21
	inc $06CC.w,X		; FE CC 06
	lsr $B09E.w,X		; 5E 9E B0
	adc [$0B.b],Y		; 77 0B
	bne   0.b		; D0 00
	ora ($FD.b),Y		; 11 FD
	pea $A451.w		; F4 51 A4
	lda ($44.b),Y		; B1 44
	jsr ($22E1.w,X)		; FC E1 22
	asl $C0DE.w,X		; 1E DE C0
	bcs  39.b		; B0 27
	jmp $75A0.w		; 4C A0 75
	stp		; DB
	cpx #$1100.w		; E0 00 11
	bcs -19.b		; B0 ED
	trb $40.b		; 14 40
	dec $1F12.w,X		; DE 12 1F
	sbc $0FB401.l		; EF 01 B4 0F
	sbc $DA54F0.l		; EF F0 54 DA
	sbc [$6D.b]		; E7 6D
	stz $E0B0.w,X		; 9E B0 E0
	beq  16.b		; F0 10
	inc $3F15.w		; EE 15 3F
	dec $B412.w,X		; DE 12 B4
	inc $1100.w,X		; FE 00 11
	ora $54F0EF.l		; 0F EF F0 54
	nop		; EA
	bcs -79.b		; B0 B1
	adc $EB.b,X		; 75 EB
	cpx #$1000.w		; E0 00 10
	inc $A414.w		; EE 14 A4
	ora #$B2.b		; 09 B2
	eor $ED.b,S		; 43 ED
	sbc ($22.b),Y		; F1 22
	asl $B4DE.w		; 0E DE B4
	cpx #$E955.w		; E0 55 E9
	dec $7E.b,X		; D6 7E
	stz $F122.w,X		; 9E 22 F1
	bcs  17.b		; B0 11
	sbc $4004.w		; ED 04 40
	dec $1F02.w,X		; DE 02 1F
	sbc $2001B0.l,X		; FF B0 01 20
	inc $F5DC.w,X		; FE DC F5
	eor $B067AE.l,X		; 5F AE 67 B0
	tsb $FFD0.w		; 0C D0 FF
	ora ($FE.b,X)		; 01 FE
	sbc ($41.b,S),Y		; F3 41
	inc $F3A0.w		; EE A0 F3
	bmi -34.b		; 30 DE
	sbc ($42.b),Y		; F1 42
	cpx $B4CA.w		; EC CA B4
	ldy $4E.b,X		; B4 4E
	lda $E3E956.l		; AF 56 E9 E3
	ora $A00E02.l,X		; 1F 02 0E A0
	cmp ($77.b,X)		; C1 77
	xce		; FB
	cmp ($42.b),Y		; D1 42
	sbc $33E0.w		; ED E0 33
	ldy $EF.b,X		; B4 EF
	sbc $AC50F4.l,X		; FF F4 50 AC
	eor [$19.b]		; 47 19
.ACCU 16
.INDEX 16
	rep #$B0		; C2 B0
	sbc $DF1FF1.l,X		; FF F1 1F DF
	bit $1E.b,X		; 34 1E
	sbc $0FB012.l		; EF 12 B0 0F
	sbc $ED1F12.l,X		; FF 12 1F ED
	cmp $3D15.w,X		; DD 15 3D
	bcs -63.b		; B0 C1
	adc $EC.b,X		; 75 EC
	sbc $FE11FF.l		; EF FF 11 FE
	tsb $A4.b		; 04 A4
	ora $34B1.w,Y		; 19 B1 34
	sbc $13E1.w,X		; FD E1 13
	and $B4CE.w		; 2D CE B4
	sbc $B21C35.l,X		; FF 35 1C B2
	adc ($BB.b)		; 72 BB
	cop $00.b		; 02 00
	ldy $31.b		; A4 31
	sbc $5C07.w		; ED 07 5C
	ldx $2D14.w		; AE 14 2D
	cpx #$01B4.w		; E0 B4 01
	and $05FFEF.l		; 2F EF FF 05
	lsr $66AE.w		; 4E AE 66
	bcs  78.b		; B0 4E
	dec $01EE.w		; CE EE 01
	ora $0E44E0.l,X		; 1F E0 44 0E
	ldy $02.b		; A4 02
	rti		; 40

	cmp $DC42F1.l,X		; DF F1 42 DC
	inc $B0E4.w		; EE E4 B0
	eor $1C.b		; 45 1C
	pei ($72.b)		; D4 72
	cmp $F0EE.w,X		; DD EE F0
	bpl -92.b		; 10 A4
	cmp $D1DA75.l,X		; DF 75 DA D1
	and ($EE.b,S),Y		; 33 EE
	ora $20B023.l		; 0F 23 B0 20
	sbc $16CC.w		; ED CC 16
	lsr $65B0.w		; 4E B0 65
	sbc $BCA0.w,X		; FD A0 BC
	cmp $F7FC23.l		; CF 23 FC F7
	adc ($DC.b)		; 72 DC
	cmp ($B0.b),Y		; D1 B0
	bpl  15.b		; 10 0F
	sbc ($21.b),Y		; F1 21
	inc $D2DC.w,X		; FE DC D2
	.db $62, $B4, $AF		; 62 B4 AF
	stz $EA.b		; 64 EA
	sbc ($00.b),Y		; F1 00
	and ($0E.b,X)		; 21 0E
	sbc ($A0.b)		; F2 A0
	ror $0D.b,X		; 76 0D
	ldx $0021.w,Y		; BE 21 00
	sbc $B01E34.l		; EF 34 1E B0
	sbc $45CE.w		; ED CE 45
	tsb $61E4.w		; 0C E4 61
	cmp $A4EE.w,X		; DD EE A4
	ora ($2F.b,S),Y		; 13 2F
	cmp $DEDC65.l		; CF 65 DC DE
	bit $FF.b,X		; 34 FF
	bcs  15.b		; B0 0F
	cop $20.b		; 02 20
	inc $F4DC.w		; EE DC F4
	bvc -50.b		; 50 CE
	bcs  70.b		; B0 46
	ora $EFDE.w,X		; 1D DE EF
	cop $1F.b		; 02 1F
	sbc ($42.b)		; F2 42
	ldy #$BF0C.w		; A0 0C BF
	and ($0F.b,X)		; 21 0F
	cpx #$0D33.w		; E0 33 0D
	cmp #$F3B4.w		; C9 B4 F3
	rts		; 60

	ldy $1B36.w,X		; BC 36 1B
	bne   0.b		; D0 00
	ora ($A4.b)		; 12 A4
	and $DD63B0.l		; 2F B0 63 DD
	cmp $FEF043.l		; CF 43 F0 FE
	bcs   1.b		; B0 01
	bpl  -2.b		; 10 FE
	jmp.w [$61E4]		; DC E4 61
	dec $A035.w		; CE 35 A0
	tsa		; 3B
	plb		; AB
	lda $4F04.w,X		; BD 04 4F
	cmp ($64.b)		; D2 64
	ora $B694.w		; 0D 94 B6
	adc ($FF.b),Y		; 71 FF
.INDEX 16
	rep #$51		; C2 51
	phx		; DA
	wai		; CB
	stx $B0.b,Y		; 96 B0
	rol $2D.b,X		; 36 2D
	cmp ($52.b)		; D2 52
	sbc $E0ED.w		; ED ED E0
	jsl $45DCA4.l		; 22 A4 DC 45
	sbc $24DD.w,X		; FD DD 24
	brk $0E.b		; 00 0E
	cop $B4.b		; 02 B4
	ora $05FFFE.l,X		; 1F FE FF 05
	lsr $44BE.w,X		; 5E BE 44
	jsr ($ABA0.w,X)		; FC A0 AB
	ldy $53E2.w,X		; BC E2 53
	sbc $BB3F45.l		; EF 45 3F BB
	bcs   1.b		; B0 01
	ora ($00.b),Y		; 11 00
	ora ($10.b,X)		; 01 10
	sbc $F5CB.w		; ED CB F5
	ldy $1B.b,X		; B4 1B
	rep #$42		; C2 42
	cmp $F100.w		; CD 00 F1
	jsl $E4A40E.l		; 22 0E A4 E4
	and $30E3EB.l,X		; 3F EB E3 30
	bpl -32.b		; 10 E0
	jsr $0EB4.w		; 20 B4 0E
	sbc $DB64E1.l,X		; FF E1 64 DB
	pea $CE3F.w		; F4 3F CE
	ldy $1F.b		; A4 1F
	ora ($53.b)		; 12 53
	jmp.w [$1F14]		; DC 14 1F
	stp		; DB
	tsb $B0.b		; 04 B0
	ora ($10.b,X)		; 01 10
	brk $11.b		; 00 11
	asl $BEED.w		; 0E ED BE
	lsr $B0.b		; 46 B0
	rol $42E2.w		; 2E E2 42
	sbc $E0DD.w		; ED DD E0
	and $1F.b,S		; 23 1F
	ldy #$4204.w		; A0 04 42
	nop		; EA
	cpy #$3112.w		; C0 12 31
	ora ($11.b,X)		; 01 11
	bcs  14.b		; B0 0E
	jmp.w [$56BF]		; DC BF 56
	asl $41F3.w,X		; 1E F3 41
	sbc $FFA4.w		; ED A4 FF
	trb $61.b		; 14 61
	lda $0E33.w,X		; BD 33 0E
	ldx $B422.w,Y		; BE 22 B4
	ora ($0F.b),Y		; 11 0F
	brk $00.b		; 00 00
	asl $F4FE.w		; 0E FE F4
	adc ($A0.b,X)		; 61 A0
	pld		; 2B
	inc $71.b,X		; F6 71
	wai		; CB
	tsx		; BA
	cpy #$0E66.w		; C0 66 0E
	ldy #$3113.w		; A0 13 31
	wai		; CB
	cmp $004103.l,X		; DF 03 41 00
	ora ($B0.b),Y		; 11 B0
	asl $BFDC.w		; 0E DC BF
	lsr $2E.b,X		; 56 2E
	sbc ($31.b)		; F2 31
	sbc $AAA0.w		; ED A0 AA
	bcs  86.b		; B0 56
	ora $DB3212.l,X		; 1F 12 32 DB
	dec $02B0.w,X		; DE B0 02
	and ($00.b,X)		; 21 00
	ora ($0E.b,X)		; 01 0E
	cmp $37BC.w,X		; DD BC 37
	ldy #$D17F.w		; A0 7F D1
	stz $EB.b		; 64 EB
	tax		; AA
	lda $4047.w		; AD 47 40
	ldy $01.b		; A4 01
	ora ($DB.b),Y		; 11 DB
	ora ($13.b)		; 12 13
	and $B0F1FF.l		; 2F FF F1 B0
	ora $F6CBED.l		; 0F ED CB F6
	adc ($FF.b)		; 72 FF
	and $1E.b,S		; 23 1E
	ldy #$ABAA.w		; A0 AA AB
	inc $73.b,X		; F6 73
	brk $02.b		; 00 02
	and $A4AD.w		; 2D AD A4
	and ($41.b,X)		; 21 41
	sbc $ED00FF.l,X		; FF FF 00 ED
	inc $B0E7.w,X		; FE E7 B0
	adc [$2F.b]		; 67 2F
	sbc ($31.b),Y		; F1 31
	sbc $E0DD.w		; ED DD E0
	bit $A0.b,X		; 34 A0
	bmi   0.b		; 30 00
	ora ($DB.b),Y		; 11 DB
	cmp $205404.l,X		; DF 04 54 20
	ldy $F0.b,X		; B4 F0
	ora $27FEF0.l		; 0F F0 FE 27
	rol $12BF.w,X		; 3E BF 12
	ldy $FB.b		; A4 FB
	bne   0.b		; D0 00
	rol $4E.b,X		; 36 4E
	ldx $2E01.w,Y		; BE 01 2E
	ldy #$F0BC.w		; A0 BC F0
	and $53.b,X		; 35 53
	asl $FCDF.w,X		; 1E DF FC
	ldy $DCB0.w,X		; BC B0 DC
	ora [$73.b]		; 07 73
	inc $0E02.w,X		; FE 02 0E
	cmp $A4EE.w,X		; DD EE A4
	rol $3B.b,X		; 36 3B
	cmp $D22D01.l		; CF 01 2D D2
	jsr $B442.w		; 20 42 B4
	sbc $0E01FF.l,X		; FF FF 01 0E
	brk $FF.b		; 00 FF
	and [$2B.b],Y		; 37 2B
	ldy $CF.b,X		; B4 CF
	jsl $00F1FD.l		; 22 FD F1 00
	trb $1F.b		; 14 1F
	cmp $1FDFA0.l,X		; DF A0 DF 1F
	lda $3501.w,X		; BD 01 35
	.db $42, $0D		; 42 0D
	dec $0FB4.w		; CE B4 0F
	brk $0F.b		; 00 0F
	ora $5E.b		; 05 5E
	lda $1E12.w,X		; BD 12 1E
	ldy $DF.b		; A4 DF
	jsr $6014.w		; 20 14 60
	ldy INIDSP.w		; AC 00 21
	dec $7394.w,X		; DE 94 73
	ora $4D.b		; 05 4D
	cpy $30A1.w		; CC A1 30
	cmp $EDB022.l,X		; DF 22 B0 ED
	and [$60.b]		; 27 60
	dec $0E01.w,X		; DE 01 0E
	sbc $46A4FF.l		; EF FF A4 46
	inc A		; 1A
	cmp $D33D02.l		; CF 02 3D D3
	and $21B032.l		; 2F 32 B0 21
	asl $0FEF.w		; 0E EF 0F
	sbc $57CE0F.l,X		; FF 0F CE 57
	ldy #$9C6C.w		; A0 6C 9C
	and $FC.b,S		; 23 FC
	sbc $5F37DE.l		; EF DE 37 5F
	sty $DF.b,X		; 94 DF
	asl $19.b,X		; 16 19
	asl $1E.b		; 06 1E
	adc $CE.b,S		; 63 CE
	dex		; CA
	ldy $01.b,X		; B4 01
	brk $00.b		; 00 00
	ora $CB64E1.l		; 0F E1 64 CB
	sbc ($A4.b),Y		; F1 A4
	eor ($CC.b)		; 52 CC
	and ($D0.b,X)		; 21 D0
	lsr $FB.b,X		; 56 FB
	cmp $299413.l,X		; DF 13 94 29
	dec $1E.b,X		; D6 1E
	eor $EE.b,X		; 55 EE
	cmp #$1D05.w		; C9 05 1D
	bcs  -1.b		; B0 FF
	sbc $6007EC.l,X		; FF EC 07 60
	dec $1E02.w,X		; DE 02 1E
	bcs -17.b		; B0 EF
	inc $42F3.w,X		; FE F3 42
	ora $EF10FF.l		; 0F FF 10 EF
	ldy #$0410.w		; A0 10 04
	eor ($2F.b,S),Y		; 53 2F
	cmp $EE0F.w		; CD 0F EE
	sbc $E31EB4.l		; EF B4 1E E3
	adc ($BD.b,X)		; 61 BD
	ora ($20.b,X)		; 01 20
	sbc $DEA010.l		; EF 10 A0 DE
	eor [$4F.b]		; 47 4F
	inc $1DE0.w		; EE E0 1D
	sbc ($10.b,X)		; E1 10
	ldy #$3234.w		; A0 34 32
	ora $FEDF.w		; 0D DF FE
	beq  -1.b		; F0 FF
	plx		; FA
	bcs -63.b		; B0 C1
	adc $0E.b		; 65 0E
	sbc $0FFF11.l		; EF 11 FF 0F
	sbc $DD63A4.l		; EF A4 63 DD
	sbc $120D03.l,X		; FF 03 0D 12
	beq  65.b		; F0 41
	ldy $EF.b		; A4 EF
	sbc $0F12.w		; ED 12 0F
	brk $F0.b		; 00 F0
	asl $B0B3.w,X		; 1E B3 B0
	lsr $2F.b		; 46 2F
	sbc $F0FE01.l,X		; FF 01 FE F0
	inc $9403.w		; EE 03 94
	plx		; FA
	dec $3AE3.w,X		; DE E3 3A
	inc $1C.b,X		; F6 1C
	rol $F0.b,X		; 36 F0
	ldy #$DF2F.w		; A0 2F DF
	inc $FFEF.w,X		; FE EF FF
	sbc $A4B6D9.l,X		; FF D9 B6 A4
	ror A		; 6A
	lda $C13E02.l		; AF 02 3E C1
	and $61D4.w		; 2D D4 61
	sty $AE.b,X		; 94 AE
	stp		; DB
	rol $CC.b		; 26 CC
	.db $62, $B3, $7F		; 62 B3 7F
	sbc ($A0.b),Y		; F1 A0
	ora $EEEF.w		; 0D EF EE
	sbc $D9FFFF.l,X		; FF FF FF D9
	lda [$A4.b],Y		; B7 A4
	phy		; 5A
	lda $C22E11.l,X		; BF 11 2E C2
	bit $50E5.w		; 2C E5 50
	sty $BF.b,X		; 94 BF
	stp		; DB
	bit $BE.b,X		; 34 BE
	adc ($A3.b),Y		; 71 A3
	bvs -16.b		; 70 F0
	ldy $ED.b		; A4 ED
	ora ($E0.b),Y		; 11 E0
	jsr $F0F1.w		; 20 F1 F0
	ora $B4B5.w		; 0D B5 B4
	adc ($DE.b,X)		; 61 DE
	ora $11EF11.l		; 0F 11 EF 11
	bne  50.b		; D0 32
	sty $FE.b,X		; 94 FE
	xce		; FB
	cmp ($1B.b,S),Y		; D3 1B
	asl $EC.b		; 06 EC
	eor [$F0.b]		; 47 F0
	ldy $1D.b		; A4 1D
	cpx #$110F.w		; E0 0F 11
	ora $FA0000.l		; 0F 00 00 FA
	bcs -62.b		; B0 C2
	adc $00.b,S		; 63 00
	brk $10.b		; 00 10
	inc $DF0F.w		; EE 0F DF
	ldy #$3345.w		; A0 45 33
	ora $F1FCF0.l,X		; 1F F0 FC F1
	inc $9024.w,X		; FE 24 90
	adc [$6E.b]		; 67 6E
	dec $E1CA.w		; CE CA E1
	inc $EF0F.w,X		; FE 0F EF
	ldy $0D.b,X		; B4 0D
	cpx $50.b		; E4 50
	bne  15.b		; D0 0F
	bpl -17.b		; 10 EF
	jsr $B0A4.w		; 20 A4 B0
	adc $F0.b,S		; 63 F0
	asl $0DE1.w		; 0E E1 0D
	ora ($FD.b,S),Y		; 13 FD
	bcc   7.b		; 90 07
	ror $72.b		; 66 72
	dec $C1EA.w		; CE EA C1
	ora $00B000.l,X		; 1F 00 B0 00
	ora $52E3DC.l		; 0F DC E3 52
	ora ($00.b),Y		; 11 00
	ora $0CCFA0.l,X		; 1F A0 CF 0C
	lda $2E3444.l		; AF 44 34 2E
	sbc $7194DD.l,X		; FF DD 94 71
	sta ($62.b)		; 92 62
	ora $C9.b		; 05 C9
	sbc ($CF.b),Y		; F1 CF
	eor ($B4.b,S),Y		; 53 B4
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	inc $3E15.w,X		; FE 15 3E
	beq -96.b		; F0 A0
	bpl  47.b		; 10 2F
	lda $AF0C.w,X		; BD 0C AF
	and ($34.b,S),Y		; 33 34
	bmi -108.b		; 30 94
	beq -81.b		; F0 AF
	.db $62, $A2, $73		; 62 A2 73
	cop $DA.b		; 02 DA
	sbc ($94.b)		; F2 94
	cmp $F133.w,X		; DD 33 F1
	ora $FBFCF0.l,X		; 1F F0 FC FB
	stx $B0.b,Y		; 96 B0
	and $32.b,X		; 35 32
	jsr $FD01.w		; 20 01 FD
	beq -19.b		; F0 ED
	sbc ($94.b),Y		; F1 94
	ora ($3C.b,S),Y		; 13 3C
	lda $2CF6FA.l		; AF FA F6 2C
	ora $22.b,X		; 15 22
	sty $4E.b,X		; 94 4E
	ldx $E40B.w		; AE 0B E4
	and ($11.b),Y		; 31 11
	inc $B41F.w		; EE 1F B4
	beq  14.b		; F0 0E
	sbc $51.b,S		; E3 51
	sbc $EE010E.l,X		; FF 0E 01 EE
	ldy $41.b		; A4 41
	cpy #$1243.w		; C0 43 12
	ora $FDD0.w,X		; 1D D0 FD
	ora $94.b,S		; 03 94
	ora $0245.w		; 0D 45 02
	jmp $FBB0.w		; 4C B0 FB
	pea $B011.w		; F4 11 B0
	ora ($00.b),Y		; 11 00
	brk $FF.b		; 00 FF
	inc $F4CC.w,X		; FE CC F4
	eor ($A4.b,S),Y		; 53 A4
	inc $0BC1.w,X		; FE C1 0B
	sbc $FC.b,X		; F5 FC
	ora $20.b,X		; 15 20
	rti		; 40

	ldy #$0D20.w		; A0 20 0D
	ldy $E1FE.w		; AC FE E1
	jsl $942045.l		; 22 45 20 94
	tsb $40B2.w		; 0C B2 40
	ora ($0E.b,S),Y		; 13 0E
	jsr $FECE.w		; 20 CE FE
	ldy $F0.b,X		; B4 F0
	cpx #$0E54.w		; E0 54 0E
	asl $FDF1.w		; 0E F1 FD
	ora ($A4.b)		; 12 A4
	cmp $0344.w,X		; DD 44 03
	rol $FCCF.w,X		; 3E CF FC
	sbc $20.b,S		; E3 20
	sty $25.b,X		; 94 25
	ora $FAAF61.l		; 0F 61 AF FA
	cmp $30.b,S		; C3 30
	mvp $10,$B0		; 44 B0 10
	bpl  -1.b		; 10 FF
	inc $ECEE.w,X		; FE EE EC
	cmp ($64.b,S),Y		; D3 64
	ldy $FF.b		; A4 FF
	lda $4CB42D.l		; AF 2D B4 4C
	pea $4220.w		; F4 20 42
	sty $AA.b,X		; 94 AA
	cpx $739F.w		; EC 9F 73
	cpx $4D.b		; E4 4D
	asl $FC.b,X		; 16 FC
	ldy #$CC20.w		; A0 20 CC
	sbc $113102.l		; EF 02 31 11
	ora $F0B4FE.l		; 0F FE B4 F0
	brk $FE.b		; 00 FE
	and $3E.b		; 25 3E
	sbc $A41EE0.l,X		; FF E0 1E A4
	cmp $2C.b		; C5 2C
	tsb $11.b		; 04 11
	eor ($CE.b,X)		; 41 CE
	ora $94C2.w		; 0D C2 94
	adc $350D06.l		; 6F 06 0D 35
	cmp $309F2C.l,X		; DF 2C 9F 30
	sty $35.b,X		; 94 35
	asl $DF00.w		; 0E 00 DF
	ora $0EFEE0.l		; 0F E0 FE 0E
	ldy $E1.b,X		; B4 E1
	.db $62, $FF, $FD		; 62 FF FD
	cop $ED.b		; 02 ED
	and ($D0.b)		; 32 D0
	ldy $41.b		; A4 41
	ora $1C.b		; 05 1C
	cpx #$12DD.w		; E0 DD 12
	ora ($21.b,X)		; 01 21
	bcc  19.b		; 90 13
	stz $15.b,X		; 74 15
	pld		; 2B
	lda $56BE.w		; AD BE 56
	and ($B0.b,S),Y		; 33 B0
	bpl -16.b		; 10 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	jmp.w [$A405]		; DC 05 A4
	ora $D3FC.w		; 0D FC D3
	asl A		; 0A
	ora $FC.b,X		; 15 FC
	and ($E3.b,S),Y		; 33 E3
	ldy #$0074.w		; A0 74 00
	tsb $FEBE.w		; 0C BE FE
	ora $10.b,S		; 03 10
	and ($94.b,S),Y		; 33 94
	cmp ($1A.b,X)		; C1 1A
	sbc $00.b,S		; E3 00
	eor $DF.b		; 45 DF
	and $B0C1.w		; 2D C1 B0
	ora $00FFFF.l		; 0F FF FF 00
	sbc $4204DD.l,X		; FF DD 04 42
	ldy $0D.b		; A4 0D
	cmp ($0A.b,S),Y		; D3 0A
	asl $DC.b,X		; 16 DC
	and ($E4.b)		; 32 E4
	eor $1490.w		; 4D 90 14
	ora $DD9D.w,Y		; 19 9D DD
	and $F0.b,S		; 23 F0
	eor ($13.b,S),Y		; 53 13
	bcc  79.b		; 90 4F
	dec $16CC.w,X		; DE CC 16
	mvp $DE,$40		; 44 40 DE
	sbc $F0A0.w		; ED A0 F0
	inc $FFFF.w,X		; FE FF FF
	jsr ($47AC.w,X)		; FC AC 47
	eor $A4.b,X		; 55 A4
	jsr ($CC02.w,X)		; FC 02 CC
	eor ($C0.b)		; 52 C0
	and $901D05.l,X		; 3F 05 1D 90
	rol $09.b,X		; 36 09
	ldy $32AD.w		; AC AD 32
	sbc ($50.b,S),Y		; F3 50
	tsb $90.b		; 04 90
	asl $ADED.w,X		; 1E ED AD
	and ($47.b,S),Y		; 33 47
	.db $62, $0E, $CB		; 62 0E CB
	ldy #$EFEF.w		; A0 EF EF
	brk $00.b		; 00 00
	inc $9FEB.w,X		; FE EB 9F
	ror $A4.b		; 66 A4
	sbc ($EC.b,X)		; E1 EC
	and $D35DB1.l,X		; 3F B1 5D D3
	ora $749044.l		; 0F 44 90 74
	adc ($99.b)		; 72 99
	tsx		; BA
	bcs  30.b		; B0 1E
	tsb $32.b		; 04 32
	sty $40.b,X		; 94 40
	lda $22D50C.l,X		; BF 0C D5 22
	eor $DD.b,S		; 43 DD
	ora $D194.w		; 0D 94 D1
	asl $F012.w,X		; 1E 12 F0
	jsr $EDE0.w		; 20 E0 ED
	stp		; DB
	ldy $27.b		; A4 27
	and $1BD01F.l,X		; 3F 1F D0 1B
	cpx $0C.b		; E4 0C
	ora ($A4.b,S),Y		; 13 A4
	sbc ($50.b),Y		; F1 50
	sbc ($0C.b,X)		; E1 0C
	cmp ($0F.b),Y		; D1 0F
	and $E0.b,S		; 23 E0
	sty $50.b,X		; 94 50
	sbc $1C.b,S		; E3 1C
	sbc $1313DD.l		; EF DD 13 13
	.db $62, $94, $0F		; 62 94 0F
	wai		; CB
	beq -48.b		; F0 D0
	jsl $F01F12.l		; 22 12 1F F0
	ldy $FE.b		; A4 FE
	sbc $0166D0.l,X		; FF D0 66 01
	ora $CBE2.w		; 0D E2 CB
	ldy $32.b		; A4 32
	bne  63.b		; D0 3F
	ora $2E.b		; 05 2E
	cop $DC.b		; 02 DC
	beq -108.b		; F0 94
	cmp $60.b,S		; C3 60
	ora $2D.b		; 05 2D
	cop $DE.b		; 02 DE
	ora $94C0.w		; 0D C0 94
	and $3F4125.l,X		; 3F 25 41 3F
	plb		; AB
	sbc $A022F1.l		; EF F1 22 A0
	cop $11.b		; 02 11
	brk $FE.b		; 00 FE
	jmp.w [$9ECA]		; DC CA 9E
	eor [$A0.b],Y		; 57 A0
	adc [$40.b],Y		; 77 40
	bpl -86.b		; 10 AA
	sbc $0FCF.w		; ED CF 0F
	and [$A4.b],Y		; 37 A4
	sbc $0ECF1E.l		; EF 1E CF 0E
	ora ($1F.b,S),Y		; 13 1F
	and ($FF.b),Y		; 31 FF
	sty $3D.b,X		; 94 3D
	bne  -5.b		; D0 FB
	ora $01.b,S		; 03 01
	eor ($F3.b)		; 52 F3
	and $2190.w		; 2D 90 21
	cmp $CFAB.w,Y		; D9 AB CF
	and $33.b,S		; 23 33
	asl $A4DD.w,X		; 1E DD A4
	beq   0.b		; F0 00
	ora $72E5.w		; 0D E5 72
	sbc ($CD.b),Y		; F1 CD
	ora $B2A4.w,X		; 1D A4 B2
	eor $33FF03.l		; 4F 03 FF 33
	cpx #$CF2D.w		; E0 2D CF
	ldy #$C1CA.w		; A0 CA C1
	ora ($44.b),Y		; 11 44
	ora ($2F.b),Y		; 11 2F
	beq  -3.b		; F0 FD
	sty $11.b,X		; 94 11
	sbc ($51.b,S),Y		; F3 51
	ora ($EC.b,S),Y		; 13 EC
	beq -17.b		; F0 EF
	brk $84.b		; 00 84
	tsb $1E.b		; 04 1E
	and $0E.b,S		; 23 0E
	sbc $0FCF.w,X		; FD CF 0F
	cop $A4.b		; 02 A4
	ora $0056DF.l		; 0F DF 56 00
	tsb $DCF1.w		; 0C F1 DC
	and ($A0.b,S),Y		; 33 A0
	sbc $41F31F.l,X		; FF 1F F3 41
	and $0D.b,S		; 23 0D
	jmp.w [$90BE]		; DC BE 90
	and ($27.b),Y		; 31 27
	eor ($22.b),Y		; 51 22
	cpx #$BD1D.w		; E0 1D BD
	jmp.w [$0390]		; DC 90 03
	bit $62.b,X		; 34 62
	inc $02DD.w,X		; FE DD 02
	ora ($10.b),Y		; 11 10
	stz $B2.b,X		; 74 B2
	rol $AA40.w		; 2E 40 AA
	and $FE2E03.l		; 2F 03 2E FE
	ldy $FF.b		; A4 FF
	inc $50F6.w,X		; FE F6 50
	ora ($CF.b,X)		; 01 CF
	ora $A0C3.w,X		; 1D C3 A0
	asl $FFE0.w		; 0E E0 FF
	bit $23.b,X		; 34 23
	rti		; 40

	inc $90CB.w		; EE CB 90
	cmp ($F2.b),Y		; D1 F2
	stz $23.b		; 64 23
	ora $CBCA01.l,X		; 1F 01 CA CB
	sty $07.b		; 84 07
	eor ($53.b),Y		; 51 53
	ldy $D2EB.w,X		; BC EB D2
	ora ($44.b)		; 12 44
	stz $EC.b,X		; 74 EC
	asl $ECB0.w,X		; 1E B0 EC
	cmp ($F0.b)		; D2 F0
	mvn $A4,$00		; 54 00 A4
	ora $00FF00.l		; 0F 00 FF 00
	cmp ($54.b),Y		; D1 54
	brk $0D.b		; 00 0D
	ldy $F1.b		; A4 F1
	cmp $F131.w		; CD 31 F1
	rol $0E14.w		; 2E 14 0E
	ora ($94.b),Y		; 11 94
	stz $E60C.w		; 9C 0C E6
	lsr $DF44.w		; 4E 44 DF
	and $94D2.w		; 2D D2 94
	tsb $E1F2.w		; 0C F2 E1
	eor ($13.b,X)		; 41 13
	asl $EFEE.w		; 0E EE EF
	sty $0F.b		; 84 0F
	trb $63.b		; 14 63
	and ($FD.b),Y		; 31 FD
	jmp.w [$01BF]		; DC BF 01
	stz $47.b,X		; 74 47
	.db $42, $2D		; 42 2D
	ldy $C10E.w		; AC 0E C1
	asl $A0F0.w,X		; 1E F0 A0
	xba		; EB
.INDEX 16
	rep #$54		; C2 54
	mvn $0C,$00		; 54 00 0C
	ldx $94FE.w		; AE FE 94
	eor ($D2.b,X)		; 41 D2
	adc $C01BD3.l		; 6F D3 1B C0
	lda $F49063.l,X		; BF 63 90 F4
	stz $34.b,X		; 74 34
	asl $DE00.w		; 0E 00 DE
	jsr ($84E1.w,X)		; FC E1 84
.ACCU 8
.INDEX 8
	sep #$71		; E2 71
	lda $E2F1CA.l,X		; BF CA F1 E2
	eor $24.b,S		; 43 24
	sty $2F.b		; 84 2F
	inc $EDCD.w,X		; FE CD ED
	cop $32.b		; 02 32
	and ($0E.b)		; 32 0E
	sty $ED.b		; 84 ED
	dec $14F1.w,X		; DE F1 14
	ora $A7EAFD.l		; 0F FD EA A7
	ldy $52.b		; A4 52
	sbc ($EE.b),Y		; F1 EE
	ora $F130D0.l,X		; 1F D0 30 F1
	sbc $FF4494.l,X		; FF 94 44 FF
	rti		; 40

	lda $0F25EB.l		; AF EB 25 0F
	bvc -124.b		; 50 84
.ACCU 16
.INDEX 16
	rep #$F9		; C2 F9
	rol $CC.b		; 26 CC
	and $20D3.w		; 2D D3 20
	lsr $80.b		; 46 80
	adc $3E.b,X		; 75 3E
	ldy $D0CC.w,X		; BC CC D0
	brk $12.b		; 00 12
	eor [$80.b]		; 47 80
	ror $3F.b,X		; 76 3F
	lda $E19A.w,Y		; B9 9A E1
	bit $31.b,X		; 34 31
	inc $F094.w,X		; FE 94 F0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc $90C1FE.l,X		; FF FE C1 90
	and [$67.b]		; 27 67
	adc ($22.b)		; 72 22
	lda #$CFCD.w		; A9 CD CF
	asl $1590.w		; 0E 90 15
	and ($45.b),Y		; 31 45
	bpl  -6.b		; 10 FA
	ldx $23ED.w		; AE ED 23
	bra  87.b		; 80 57
	adc $DBEBF1.l,X		; 7F F1 EB DB
	lda $26FE.w		; AD FE 26
	stz $12.b,X		; 74 12
	plx		; FA
	ldy $33AC.w		; AC AC 33
	and $21.b,X		; 35 21
	jsl $1B2374.l		; 22 74 23 1B
	lda $03AD.w		; AD AD 03
	eor ($61.b,S),Y		; 53 61
	cmp $CC74.w		; CD 74 CC
	ora $F0202F.l		; 0F 2F 20 F0
	brk $FE.b		; 00 FE
	cpx $0EA4.w		; EC A4 0E
	sbc ($41.b)		; F2 41
	bpl  -1.b		; 10 FF
	asl $2FD0.w		; 0E D0 2F
	sty $22.b,X		; 94 22
	beq  65.b		; F0 41
	sbc ($3E.b,X)		; E1 3E
	sbc $8431BD.l		; EF BD 31 84
	inc $7F.b,X		; F6 7F
	rti		; 40

	lda $E02E.w		; AD 2E E0
	inc $8010.w,X		; FE 10 80
	dec $7726.w		; CE 26 77
	.db $62, $EB, $99		; 62 EB 99
	lda $7402.w		; AD 02 74
	and ($02.b,X)		; 21 02
	ora ($1D.b)		; 12 1D
	plb		; AB
	lda $4515.w		; AD 15 45
	stz $42.b,X		; 74 42
	cmp $00CC.w,X		; DD CC 00
	bpl  15.b		; 10 0F
	brk $2F.b		; 00 2F
	ldy $00.b		; A4 00
	brk $FF.b		; 00 FF
	ora $0142E2.l		; 0F E2 42 01
	sbc $994090.l,X		; FF 90 40 99
	cpy $EFE0.w		; CC E0 EF
	bit $24.b,X		; 34 24
	eor ($94.b,S),Y		; 53 94
	ora $0320AD.l		; 0F AD 20 03
	jsl $0FEE20.l		; 22 20 EE 0F
	stz $0E.b,X		; 74 0E
	cmp $77F210.l		; CF 10 F2 77
	adc ($FB.b),Y		; 71 FB
	txs		; 9A
	stz $AC.b,X		; 74 AC
	ora $33.b,X		; 15 33
	rti		; 40

	trb $02.b		; 14 02
	ora $CE749A.l,X		; 1F 9A 74 CE
	sbc ($54.b,S),Y		; F3 54
	eor ($DC.b,S),Y		; 53 DC
	dec $2FEF.w,X		; DE EF 2F
	stz $44.b		; 64 44
	tsb $F000.w		; 0C 00 F0
	cpy $CBBF.w		; CC BF CB
	sbc $94.b,S		; E3 94
	dec $1157.w,X		; DE 57 11
	trb $ABF1.w		; 1C F1 AB
	bmi   3.b		; 30 03
	bcc  15.b		; 90 0F
	trb $32.b		; 14 32
	eor $11.b,S		; 43 11
	xce		; FB
	lda $84CE.w,X		; BD CE 84
	.db $42, $43		; 42 43
	cmp $F0EE.w,X		; DD EE F0
	sbc ($01.b),Y		; F1 01
	ora ($74.b,X)		; 01 74
	tsb $60.b		; 04 60
	inc $BCBB.w,X		; FE BB BC
	sbc ($74.b,S),Y		; F3 74
	.db $42, $70		; 42 70
	ror $42.b,X		; 76 42
	jsl $9AA90E.l		; 22 0E A9 9A
	sep #$46		; E2 46
	stz $1D.b		; 64 1D
	cmp #$33CC.w		; C9 CC 33
	ora $00.b,S		; 03 00
	ora $94CB.w		; 0D CB 94
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	cmp ($63.b),Y		; D1 63
	bcc  86.b		; 90 56
	.db $42, $30		; 42 30
	tyx		; BB
	cpy $F0F0.w		; CC F0 F0
	and ($84.b)		; 32 84
	sbc $0E.b,S		; E3 0E
	ora $1FAD.w,X		; 1D AD 1F
	ora ($34.b,S),Y		; 13 34
	bmi 116.b		; 30 74
	wai		; CB
	jmp.w [$F1EE]		; DC EE F1
	cop $10.b		; 02 10
	rol $20.b		; 26 20
	bra  49.b		; 80 31
	sbc $BCCB.w,X		; FD CB BC
	cpx #$3323.w		; E0 23 33
	and ($64.b,X)		; 21 64
	cpy $0F0C.w		; CC 0C 0F
	eor $194044.l		; 4F 44 40 19
	cpy $9960.w		; CC 60 99
	stz $00C0.w		; 9C C0 00
	cpy $9999.w		; CC 99 99
	sta $FF90.w,Y		; 99 90 FF
	sbc $EDFEFF.l,X		; FF FF FE ED
	ldy $5513.w,X		; BC 13 55
	sty $EF.b		; 84 EF
	asl A		; 0A
	bcc -14.b		; 90 F2
	and ($F3.b),Y		; 31 F3
	bmi   1.b		; 30 01
	sty $10.b		; 84 10
	inc $F0BE.w,X		; FE BE F0
	and ($33.b,X)		; 21 33
	and $DC64FE.l		; 2F FE 64 DC
	cpy #$F0F0.w		; C0 F0 F0
	pea $4434.w		; F4 34 44
	ora $0C70.w,Y		; 19 70 0C
	sta $E2AC.w,Y		; 99 AC E2
	.db $42, $42		; 42 42
	brk $0E.b		; 00 0E
	rts		; 60

	brk $CC.b		; 00 CC
	cpy #$4404.w		; C0 04 44
	rti		; 40

	cmp #$649C.w		; C9 9C 64
	tsb $3D.b		; 04 3D
	tsb $FFCC.w		; 0C CC FF
	bmi -12.b		; 30 F4
	beq -108.b		; F0 94
	brk $F0.b		; 00 F0
	ora $35EF0F.l		; 0F 0F EF 35
	and ($0E.b,X)		; 21 0E
	bcc  49.b		; 90 31
	jmp.w [$E0CC]		; DC CC E0
	brk $12.b		; 00 12
	jsl $0B7422.l		; 22 22 74 0B
	txs		; 9A
	cmp ($13.b,X)		; C1 13
	lsr $42.b,X		; 56 42
	xce		; FB
	dec $CF64.w,X		; DE 64 CF
	cmp $37F030.l		; CF 30 F0 37
	eor $0D.b		; 45 0D
	stz $CC64.w		; 9C 64 CC
	cmp $64.b,S		; C3 64
	rti		; 40

	brk $1C.b		; 00 1C
	cpy $00.b		; C4 00
	rts		; 60

	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	rti		; 40

	tsb $CC99.w		; 0C 99 CC
	stz $40.b		; 64 40
	tsb $FC0C.w		; 0C 0C FC
	bmi -13.b		; 30 F3
	brk $0F.b		; 00 0F
	sty $F0.b		; 84 F0
	ora $FFEF0F.l		; 0F 0F EF FF
	lsr $52.b		; 46 52
	inc $5280.w,X		; FE 80 52
	cmp #$DF9A.w		; C9 9A DF
	brk $23.b		; 00 23
	and ($34.b,S),Y		; 33 34
	stz $EF.b,X		; 74 EF
	plb		; AB
	bne  19.b		; D0 13
	eor $41.b,S		; 43 41
	sbc $CC60EF.l		; EF EF 60 CC
	cmp #$CCCC.w		; C9 CC CC
	cpy #$4444.w		; C0 44 44
	tsb $C960.w		; 0C 60 C9
	stz $4400.w		; 9C 00 44
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	rts		; 60

	cpy $C9CC.w		; CC CC C9
	sta $CC9C.w,Y		; 99 9C CC
	cpy $80CC.w		; CC CC 80
	inc $DDEE.w		; EE EE DD
	cpy $C1A9.w		; CC A9 C1
	eor [$75.b],Y		; 57 75
	stz $0C.b,X		; 74 0C
	tsx		; BA
	sbc $220134.l		; EF 34 01 22
	and ($00.b,X)		; 21 00
	stz $2C.b		; 64 2C
	sta $F3CF.w,Y		; 99 CF F3
	eor $44.b,S		; 43 44
	ora $500D.w		; 0D 0D 50
	sta $9999.w,Y		; 99 99 99
	sta $0099.w,Y		; 99 99 00
	bvs   0.b		; 70 00
	bvc -103.b		; 50 99
	sta $0090.w,Y		; 99 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	sta $0090.w,Y		; 99 90 00
	brk $09.b		; 00 09
	sta $2499.w,Y		; 99 99 24
	stz $CCCC.w		; 9C CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $74CC.w		; CC CC 74
	brk $E0.b		; 00 E0
	inc $E00F.w,X		; FE 0F E0
	trb $54.b		; 14 54
	asl $DD64.w,X		; 1E 64 DD
	stz $F4F0.w		; 9C F0 F4
	bmi  64.b		; 30 40
	ora ($00.b,X)		; 01 00
	bvc 112.b		; 50 70
	ora #$9999.w		; 09 99 99
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	eor ($99.b),Y		; 51 99
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	jsr $03E9.w		; 20 E9 03
	inc A		; 1A
	jsr $4144.w		; 20 44 41
	eor ($4E.b)		; 52 4E
	rol $6F73.w		; 2E 73 6F
	jmp ($0000.w)		; 6C 00 00
	adc $0D006C.l		; 6F 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D9D4.w		; E9 D4 D9
	cmp $270DED.l,X		; DF ED 0D 27
	and #$101B.w		; 29 1B 10
	ora $F1.b,S		; 03 F1
	sbc ($02.b)		; F2 02
	ora #$FC02.w		; 09 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $90.b		; 00 90
	ora #$9909.w		; 09 09 99
	brk $90.b		; 00 90
	bcc -128.b		; 90 80
	brk $0F.b		; 00 0F
	ora $60F2F0.l		; 0F F0 F2 60
	cmp ($20.b,S),Y		; D3 20
	bcc   0.b		; 90 00
	and $44.b,S		; 23 44
	and ($33.b,X)		; 21 33
	eor $0E.b		; 45 0E
	brk $84.b		; 00 84
	cpy #$C20C.w		; C0 0C C2
	ora ($0E.b),Y		; 11 0E
	ora ($E0.b,X)		; 01 E0
	tsb $70.b		; 04 70
	tsb $02CE.w		; 0C CE 02
	cop $66.b		; 02 66
	stz $26.b		; 64 26
	ror $E074.w		; 6E 74 E0
	sbc $F22E.w		; ED 2E F2
	bcs  50.b		; B0 32
	sbc ($20.b)		; F2 20
	bvc   9.b		; 50 09
	sta [$77.b],Y		; 97 77
	brk $00.b		; 00 00
	ora #$9990.w		; 09 90 99
	bvs  12.b		; 70 0C
	dec $E0EC.w		; CE EC E0
	cpx #$4722.w		; E0 22 47
	eor [$80.b]		; 47 80
	adc $45.b,X		; 75 45
	mvp $DD,$3E		; 44 3E DD
	cmp $BADC.w,X		; DD DC BA
	stz $41.b,X		; 74 41
	and $4C.b,S		; 23 4C
	cop $02.b		; 02 02
	adc ($D2.b,X)		; 61 D2
	phd		; 0B
	bra   3.b		; 80 03
	and ($20.b)		; 32 20
	beq -16.b		; F0 F0
	lsr $42.b		; 46 42
	jsl $C91090.l		; 22 90 10 C9
	bcs  -5.b		; B0 FB
	dec $EFEE.w		; CE EE EF
	ora ($80.b,S),Y		; 13 80
	and $473136.l		; 2F 36 31 47
	bvc -34.b		; 50 DE
	bpl -51.b		; 10 CD
	sty $3F.b		; 84 3F
	cmp $131E45.l,X		; DF 45 1E 13
	ora $91BC.w,X		; 1D BC 91
	sty $41.b,X		; 94 41
	dec $F111.w		; CE 11 F1
	and ($0E.b,S),Y		; 33 0E
.ACCU 8
	sep #$20		; E2 20
	bra  86.b		; 80 56
	stz $DB.b,X		; 74 DB
	bne -22.b		; D0 EA
	cpy #$BF1D.w		; C0 1D BF
	sty $31.b,X		; 94 31
	brk $D9.b		; 00 D9
	cmp [$7E.b]		; C7 7E
	bcs  45.b		; B0 2D
	pei ($94.b)		; D4 94
	adc $EC.b,S		; 63 EC
	sbc ($1F.b,X)		; E1 1F
	bit $0B.b		; 24 0B
	lda $009432.l,X		; BF 32 94 00
	ora ($ED.b),Y		; 11 ED
	trb $32.b		; 14 32
	beq -38.b		; F0 DA
	sta ($A4.b),Y		; 91 A4
	eor ($DD.b,S),Y		; 53 DD
	ora ($E0.b,X)		; 01 E0
	mvp $E0,$0D		; 44 0D E0
	ora ($94.b),Y		; 11 94
	ora ($2D.b),Y		; 11 2D
	stz $1F34.w		; 9C 34 1F
	ora ($FE.b,X)		; 01 FE
	pea $31A4.w		; F4 A4 31
	sbc $55CFFE.l,X		; FF FE CF 55
	jmp.w [$F0F2]		; DC F2 F0
	ldy #$5315.w		; A0 15 53
	inc $2202.w,X		; FE 02 22
	and ($EB.b,X)		; 21 EB
	cmp $0010A0.l		; CF A0 10 00
	ora $4134F0.l		; 0F F0 34 41
	ora $A0A9.w		; 0D A9 A0
	sbc $1C.b,S		; E3 1C
	dec $25DE.w		; CE DE 25
	eor ($0E.b,S),Y		; 53 0E
	sbc ($94.b),Y		; F1 94
	ora $15AA1D.l,X		; 1F 1D AA 15
	eor ($00.b,X)		; 41 00
	sbc $45A003.l,X		; FF 03 A0 45
	.db $42, $FD		; 42 FD
	sta $0CE2.w,Y		; 99 E2 0C
	dec $A0DE.w		; CE DE A0
	and $64.b		; 25 64
	ora $102101.l,X		; 1F 01 21 10
	phx		; DA
	lda $4294.w,X		; BD 94 42
	ora ($0F.b,X)		; 01 0F
	ora $53.b,S		; 03 53
	xba		; EB
	ldy $A09C.w,X		; BC 9C A0
	cmp ($1D.b,X)		; C1 1D
	dec $26FF.w		; CE FF 26
	adc $20.b,X		; 75 20
	beq -108.b		; F0 94
	rol $CAFF.w		; 2E FF CA
	pea $2253.w		; F4 53 22
	asl $A402.w		; 0E 02 A4
	and ($0E.b,X)		; 21 0E
	jmp.w [$46CE]		; DC CE 46
	ora $0FF2.w		; 0D F2 0F
	ldy $45.b		; A4 45
	ora $00F0DD.l,X		; 1F DD F0 00
	brk $ED.b		; 00 ED
	sbc ($A4.b)		; F2 A4
	and ($23.b)		; 32 23
	inc $12F1.w,X		; FE F1 12
	asl $CECB.w		; 0E CB CE
	ldy $56.b		; A4 56
	asl $E102.w,X		; 1E 02 E1
	mvp $EC,$1F		; 44 1F EC
	cmp $2001A4.l		; CF A4 01 20
	dec $2401.w,X		; DE 01 24
	.db $42, $FD		; 42 FD
	sbc ($A4.b,X)		; E1 A4
	bpl  15.b		; 10 0F
	dex		; CA
	lda $121F77.l		; AF 77 1F 12
	bne -92.b		; D0 A4
	mvn $DC,$0F		; 54 0F DC
	ldx $3001.w,Y		; BE 01 30
	inc $A411.w		; EE 11 A4
	and $52.b		; 25 52
	cpx $00E0.w		; EC E0 00
	sbc $B0AFDA.l,X		; FF DA AF B0
	cmp ($22.b,X)		; C1 22
	and ($21.b,S),Y		; 33 21
	bit $43.b,X		; 34 43
	ora $03A4CB.l,X		; 1F CB A4 03
	and ($00.b),Y		; 31 00
	ora ($25.b),Y		; 11 25
	rti		; 40

	cpx $B0EF.w		; EC EF B0
	sbc $9ADAFE.l,X		; FF FE DA 9A
.ACCU 8
.INDEX 8
	sep #$33		; E2 33
	mvp $A4,$32		; 44 32 A4
	ora ($FE.b),Y		; 11 FE
	stp		; DB
	lda $3214.w,X		; BD 14 32
	ora ($21.b,X)		; 01 21
	ldy $12.b,X		; B4 12
	and $00EFEE.l		; 2F EE EF 00
	ora $B0F5EC.l		; 0F EC F5 B0
	bit $46.b		; 24 46
	stz $23.b		; 64 23
	and ($10.b),Y		; 31 10
	phx		; DA
	sta $35A4.w,Y		; 99 A4 35
	and ($22.b)		; 32 22
	ora ($32.b),Y		; 11 32
	inc $CDEC.w,X		; FE EC CD
	bcs -53.b		; B0 CB
	tyx		; BB
	tax		; AA
	cmp ($55.b,S),Y		; D3 55
	lsr $54.b,X		; 56 54
	and ($A4.b)		; 32 A4
	cpx $BDED.w		; EC ED BD
	bit $34.b		; 24 34
	jsl $B42123.l		; 22 23 21 B4
	asl $FFFE.w		; 0E FE FF
	sbc $F20E0F.l,X		; FF 0F 0E F2
	lsr $A4.b,X		; 56 A4
	and $FEEF.w,X		; 3D EF FE
	inc $ECDD.w,X		; FE DD EC
	cpy #$46.b		; C0 46
	ldy $43.b		; A4 43
	ora ($11.b)		; 12 11
	jsr $BDEC.w		; 20 EC BD
	cpx #$F0.b		; E0 F0
	ldy $00.b,X		; B4 00
	sbc $7207.w		; ED 07 72
	cpx #$0D.b		; E0 0D
	beq  -2.b		; F0 FE
	ldy $1F.b		; A4 1F
	tax		; AA
	pea $5157.w		; F4 57 51
	ora ($0F.b)		; 12 0F
	asl $FFB4.w		; 0E B4 FF
	inc $00EF.w,X		; FE EF 00
	brk $F0.b		; 00 F0
	lsr $3E.b,X		; 56 3E
	ldy $E0.b		; A4 E0
	cpx $DFDE.w		; EC DE DF
	sbc $47C0.w		; ED C0 47
	mvp $45,$B0		; 44 B0 45
	eor $54.b,X		; 55 54
	jsr $CCED.w		; 20 ED CC
	cpy $C0CD.w		; CC CD C0
	sbc $45DF.w		; ED DF 45
	eor $21.b,S		; 43 21
	ora $A4FFFF.l		; 0F FF FF A4
	dex		; CA
	sbc $66.b		; E5 66
	eor ($11.b,S),Y		; 53 11
	asl $EFDE.w		; 0E DE EF
	ldy $FE.b,X		; B4 FE
	sbc $FF0001.l		; EF 01 00 FF
	eor [$4E.b],Y		; 57 4E
	cpx #$A4.b		; E0 A4
	nop		; EA
	dec $0EEF.w		; CE EF 0E
	lda $414466.l		; AF 66 44 41
	bcs 102.b		; B0 66
	.db $42, $00		; 42 00
	inc $AADC.w,X		; FE DC AA
	ldy $B4EE.w,X		; BC EE B4
	sbc ($46.b),Y		; F1 46
	rol $FFDE.w		; 2E DE FF
	sbc $A410FF.l		; EF FF 10 A4
	cpx #$56.b		; E0 56
	eor ($10.b)		; 52 10
	sbc $BEECFF.l,X		; FF FF EC BE
	cpy $00.b		; C4 00
	ora ($00.b,X)		; 01 00
	asl $45E0.w		; 0E E0 45
	asl $B4F0.w,X		; 1E F0 B4
	cmp $02F0.w,X		; DD F0 02
	trb $32B1.w		; 1C B1 32
	and ($22.b,S),Y		; 33 22
	ldy $0E.b,X		; B4 0E
	dec $0E01.w		; CE 01 0E
	inc $0FF1.w		; EE F1 0F
	sbc ($C4.b,X)		; E1 C4
	mvp $F1,$1E		; 44 1E F1
	inc $00FF.w,X		; FE FF 00
	ora $54B4E0.l		; 0F E0 B4 54
	ora ($30.b,S),Y		; 13 30
	brk $EE.b		; 00 EE
	ora $B4DEEC.l,X		; 1F EC DE B4
	sbc ($12.b),Y		; F1 12
	and ($F1.b),Y		; 31 F1
	eor [$2D.b],Y		; 57 2D
	dec $A4EC.w		; CE EC A4
	stz $3003.w		; 9C 03 30
	cop $67.b		; 02 67
	eor ($11.b)		; 52 11
	inc $FFC4.w,X		; FE C4 FF
	sbc $0000FF.l,X		; FF FF 00 00
	bpl -17.b		; 10 EF
	and $B4.b,X		; 35 B4
	adc $BEFBCF.l,X		; 7F CF FB BE
	ora ($2F.b,X)		; 01 2F
	dec $A435.w,X		; DE 35 A4
	bit $74.b,X		; 34 74
	bpl -54.b		; 10 CA
	ldx $CFBA.w,Y		; BE BA CF
	ora ($C0.b,S),Y		; 13 C0
	sbc $37EF0F.l		; EF 0F EF 37
	stz $22.b,X		; 74 22
	ora $B4CD.w		; 0D CD B4
	ora ($1E.b)		; 12 1E
	cmp ($43.b)		; D2 43
	and $30.b,S		; 23 30
	inc $C4CD.w		; EE CD C4
	ora $0100FF.l		; 0F FF 00 01
	ora ($FF.b),Y		; 11 FF
	trb $4F.b		; 14 4F
	ldy $BE.b,X		; B4 BE
	tsb $21AD.w		; 0C AD 21
	and ($EE.b),Y		; 31 EE
	bit $22.b,X		; 34 22
	ldy $53.b		; A4 53
	jsr ($AFA9.w,X)		; FC A9 AF
	xce		; FB
	bne  51.b		; D0 33
	eor $C0.b,S		; 43 C0
	bpl -17.b		; 10 EF
	and [$52.b],Y		; 37 52
	ora ($FC.b),Y		; 11 FC
	cmp $B4EF.w		; CD EF B4
	rol $51D2.w		; 2E D2 51
	ora ($2F.b,S),Y		; 13 2F
	inc $0FCE.w		; EE CE 0F
	cpy $FF.b		; C4 FF
	brk $11.b		; 00 11
	bpl  -1.b		; 10 FF
	ora $3F.b,X		; 15 3F
	cmp $AF0CB4.l,X		; DF B4 0C AF
	ora ($31.b)		; 12 31
	inc $1134.w		; EE 34 11
	and ($B4.b)		; 32 B4
	inc $D0DC.w,X		; FE DC D0
	asl $12F0.w		; 0E F0 12
	ora ($0E.b)		; 12 0E
	cpy $F1.b		; C4 F1
	eor $0D.b,S		; 43 0D
	sbc $12F1FD.l,X		; FF FD F1 12
	ora $12EFC0.l		; 0F C0 EF 12
	bit $54.b		; 24 54
	and ($FE.b),Y		; 31 FE
	inc $B4DC.w		; EE DC B4
	ora ($12.b),Y		; 11 12
	and ($ED.b,X)		; 21 ED
	and [$7F.b]		; 27 7F
	lda $B4FE.w,X		; BD FE B4
	ldx $2223.w		; AE 23 22
	sbc $232014.l		; EF 14 20 23
	ora $1DB0.w		; 0D B0 1D
	tsx		; BA
	tsx		; BA
	txs		; 9A
	dec $1EF0.w,X		; DE F0 1E
	cmp $FE43C4.l		; CF C4 43 FE
	cpx #$EE.b		; E0 EE
	sbc ($12.b),Y		; F1 12
	ora $42B4F1.l		; 0F F1 B4 42
	ora ($2F.b)		; 12 2F
	cpx $00CE.w		; EC CE 00
	sbc $01C412.l		; EF 12 C4 01
	ora ($FE.b),Y		; 11 FE
	cop $41.b		; 02 41
	sbc $EE00.w		; ED 00 EE
	cpy #$DE.b		; C0 DE
	ora ($10.b,X)		; 01 10
	sbc ($22.b),Y		; F1 22
	bit $43.b		; 24 43
	ora $DDDDC0.l,X		; 1F C0 DD DD
	cmp $00F0.w,X		; DD F0 00
	ora $B436DF.l		; 0F DF 36 B4
	phd		; 0B
	cmp $33F2DB.l		; CF DB F2 33
	asl $32E1.w,X		; 1E E1 32
	cpy #$23.b		; C0 23
	mvp $ED,$20		; 44 20 ED
	dec $EFDD.w,X		; DE DD EF
	brk $C0.b		; 00 C0
	ora ($0F.b,X)		; 01 0F
	sbc $F05125.l		; EF 25 51 F0
	sbc $B0DE.w,X		; FD DE B0
	cop $20.b		; 02 20
	sbc $664535.l		; EF 35 45 66
	and $00B4CB.l,X		; 3F CB B4 00
	sbc $0F2013.l,X		; FF 13 20 0F
	cmp $7127.w,X		; DD 27 71
	bcs  98.b		; B0 62
	asl $CFA9.w		; 0E A9 CF
	and $20.b,S		; 23 20
	beq  18.b		; F0 12
	ldy $47.b		; A4 47
	bit $AE9A.w		; 2C 9A AE
	asl $43F2.w		; 0E F2 43
	brk $C0.b		; 00 C0
	ora $65F3ED.l		; 0F ED F3 65
	jsr $DD0F.w		; 20 0F DD
	cpx #$B4.b		; E0 B4
	jsr $12EE.w		; 20 EE 12
	and ($33.b,X)		; 21 33
	sbc $E0BD.w,X		; FD BD E0
	cpy $00.b		; C4 00
	ora ($10.b,X)		; 01 10
	ora $44F00F.l		; 0F 0F F0 44
	ora $0FB0.w,X		; 1D B0 0F
	xba		; EB
	txy		; 9B
	sbc ($31.b)		; F2 31
	sbc $46F2.w		; ED F2 46
	ldy $21.b,X		; B4 21
	cpx $00CD.w		; EC CD 00
	ora $002012.l		; 0F 12 20 00
	cpy $FF.b		; C4 FF
	sbc ($44.b,X)		; E1 44
	ora $0EE0.w		; 0D E0 0E
	sbc ($12.b),Y		; F1 12
	ldy $0E.b,X		; B4 0E
	sbc $311323.l		; EF 23 13 31
	stp		; DB
	cmp $C400.w		; CD 00 C4
	brk $11.b		; 00 11
	ora $010F0F.l,X		; 1F 0F 0F 01
	eor $FD.b,S		; 43 FD
	bcs -34.b		; B0 DE
	stp		; DB
	ldx $2013.w		; AE 13 20
	inc $5614.w		; EE 14 56
	bcs 119.b		; B0 77
	eor $CCBBCB.l		; 4F CB BB CC
	bne  16.b		; D0 10
	inc $FEC4.w,X		; FE C4 FE
	ora $52.b,S		; 03 52
	inc $EEF0.w		; EE F0 EE
	ora ($21.b,X)		; 01 21
	ldy $FE.b,X		; B4 FE
	sbc ($32.b),Y		; F1 32
	bit $1D.b,X		; 34 1D
	tsx		; BA
	cmp $11B401.l,X		; DF 01 B4 11
	jsl $EE0F0F.l		; 22 0F 0F EE
	and [$7F.b]		; 27 7F
	txy		; 9B
	ldy $00.b,X		; B4 00
	inc $2F35.w		; EE 35 2F
	dec $2202.w,X		; DE 02 22
	jsl $CD1DB4.l		; 22 B4 1D CD
	sbc $110100.l,X		; FF 00 01 11
	bpl  -2.b		; 10 FE
	cpy #$CB.b		; C0 CB
	cmp ($65.b)		; D2 65
	and ($10.b,X)		; 21 10
	jmp.w [$11DF]		; DC DF 11
	ldy $FF.b,X		; B4 FF
	ora $12.b,S		; 03 12
	bit $1B.b,X		; 34 1B
	ldy $00EF.w		; AC EF 00
	cpy $11.b		; C4 11
	ora ($0F.b),Y		; 11 0F
	sbc $1E45E0.l,X		; FF E0 45 1E
	cpy #$B4.b		; C0 B4
	sbc $54C1.w,X		; FD C1 54
	ora $2213DF.l		; 0F DF 13 22
	eor ($B4.b)		; 52 B4
	sbc #$BD.b		; E9 BD
	ora $302201.l		; 0F 01 22 30
	beq  -4.b		; F0 FC
	cpy $D0.b		; C4 D0
	eor $1D.b		; 45 1D
	cpx #$1E.b		; E0 1E
	cmp ($22.b),Y		; D1 22
	ora $21EFB4.l		; 0F B4 EF 21
	ora ($54.b)		; 12 54
	nop		; EA
	ldx $F0FF.w,Y		; BE FF F0
	cpy #$E0.b		; C0 E0
	ora ($00.b),Y		; 11 00
	sbc $16BC.w,X		; FD BC 16
	adc $00.b,S		; 63 00
	ldy $1C.b,X		; B4 1C
	lda ($54.b),Y		; B1 54
	asl $11E0.w		; 0E E0 11
	ora ($44.b,S),Y		; 13 44
	ldy $EA.b,X		; B4 EA
	ldx $00FE.w,Y		; BE FE 00
	and ($21.b)		; 32 21
	sbc ($FC.b),Y		; F1 FC
	cpy #$CB.b		; C0 CB
	sbc $53.b,S		; E3 53
	bpl  16.b		; 10 10
	sbc $20F1.w		; ED F1 20
	ldy $EF.b,X		; B4 EF
	ora ($12.b,X)		; 01 12
	bit $1D.b,X		; 34 1D
	lda $EFFF.w,X		; BD FF EF
	cpy $11.b		; C4 11
	bpl  16.b		; 10 10
	ora $42F3EE.l		; 0F EE F3 42
	inc $F1B4.w,X		; FE B4 F1
	jmp.w [$30F5]		; DC F5 30
	cpx #$FF.b		; E0 FF
	ora ($24.b,X)		; 01 24
	ldy $62.b		; A4 62
	lda #$BD.b		; A9 BD
	ldy $4115.w,X		; BC 15 41
	ora ($10.b),Y		; 11 10
	cpy $FE.b		; C4 FE
	bne  53.b		; D0 35
	rol $0FE0.w		; 2E E0 0F
	cpx #$21.b		; E0 21
	cpy #$10.b		; C0 10
	brk $FF.b		; 00 FF
	ora ($35.b,X)		; 01 35
	eor $10.b,S		; 43 10
	sbc $F1C4.w,X		; FD C4 F1
	bpl   0.b		; 10 00
	bpl  15.b		; 10 0F
	inc WRMPYB.w		; EE 03 42
	ldy $ED.b,X		; B4 ED
	beq -36.b		; F0 DC
	pea $FF30.w		; F4 30 FF
	ora $13B401.l		; 0F 01 B4 13
	eor $EC.b,S		; 43 EC
	cmp $11EE.w,X		; DD EE 11
	and ($11.b,X)		; 21 11
	ldy $0F.b,X		; B4 0F
	inc $26DE.w		; EE DE 26
	adc ($CC.b),Y		; 71 CC
	ora ($DD.b),Y		; 11 DD
	ldy $24.b,X		; B4 24
	rol $0FEF.w		; 2E EF 0F
	ora ($34.b,X)		; 01 34
	and ($CD.b),Y		; 31 CD
	ldy $FF.b,X		; B4 FF
	cmp $201101.l,X		; DF 01 11 20
	sbc $C0BEED.l,X		; FF ED BE C0
	cmp ($54.b)		; D2 54
	jsl $F1ED31.l		; 22 31 ED F1
	ora $F0B4FF.l		; 0F FF B4 F0
	ora ($45.b)		; 12 45
	rol $EDCE.w,X		; 3E CE ED
	bne  17.b		; D0 11
	ldy $00.b,X		; B4 00
	brk $00.b		; 00 00
	sbc $67F2.w		; ED F2 67
	and $C0D0.w		; 2D D0 C0
	ora $FF00DE.l,X		; 1F DE 00 FF
	brk $F0.b		; 00 F0
	ora ($34.b,X)		; 01 34
	ldy $2B.b		; A4 2B
	lda $C2C9.w,X		; BD C9 C2
	and ($02.b)		; 32 02
	ora $FEB4FF.l,X		; 1F FF B4 FE
	sbc $CE5036.l		; EF 36 50 CE
	bpl -52.b		; 10 CC
	bit $A4.b,X		; 34 A4
	tsb $0D03.w		; 0C 03 0D
	ora $56.b,S		; 03 56
	eor $C0FCBB.l,X		; 5F BB FC C0
	sbc $FFEF.w		; ED EF FF
	beq  -1.b		; F0 FF
	inc $D2CB.w,X		; FE CB D2
	ldy $70.b,X		; B4 70
	lda $43AD1D.l,X		; BF 1D AD 43
	ora $B40F01.l		; 0F 01 0F B4
	ora ($25.b),Y		; 11 25
	rol $FDCE.w,X		; 3E CE FD
	bne  49.b		; D0 31
	brk $C4.b		; 00 C4
	ora $F00E00.l		; 0F 00 0E F0
	bit $2F.b,X		; 34 2F
	sbc $B0B40F.l		; EF 0F B4 B0
	and ($EF.b,S),Y		; 33 EF
	ora ($00.b),Y		; 11 00
	ora ($33.b),Y		; 11 33
	asl $9DA4.w,X		; 1E A4 9D
	stp		; DB
	cmp ($53.b,X)		; C1 53
	inc $11F1.w,X		; FE F1 11
	ora $EDB4.w		; 0D B4 ED
	trb $62.b		; 14 62
	cmp $DD11.w,X		; DD 11 DD
	ora $1F.b,S		; 03 1F
	ldy $13.b		; A4 13
	ora $5203F0.l		; 0F F0 03 52
	dec $CE1F.w		; CE 1F CE
	cpy #$F0.b		; C0 F0
	ora $0FFFFF.l		; 0F FF FF 0F
	sbc $F4BB.w,X		; FD BB F4
	ldy $4C.b,X		; B4 4C
	cmp ($0B.b)		; D2 0B
	bcs  49.b		; B0 31
	ora ($1F.b),Y		; 11 1F
	sbc ($B0.b),Y		; F1 B0
	brk $26.b		; 00 26
	stz $12.b,X		; 74 12
	ora $FFFFEF.l,X		; 1F EF FF FF
	cpy #$FE.b		; C0 FE
	sbc $E1DCEE.l		; EF EE DC E1
	eor $21.b,X		; 55 21
	jsl $23ACB4.l		; 22 B4 AC 23
	ora $100021.l		; 0F 21 00 10
	sbc ($30.b)		; F2 30
	ldy #$41.b		; A0 41
	and ($FD.b,S),Y		; 33 FD
	inc $CBCC.w		; EE CC CB
	ldx $C40F.w,Y		; BE 0F C4
	sbc $3F25EF.l,X		; FF EF 25 3F
	cmp ($1E.b),Y		; D1 1E
	cmp $F3A412.l,X		; DF 12 A4 F3
	rol $1ED1.w,X		; 3E D1 1E
	ora [$5D.b],Y		; 17 5D
	cmp ($2D.b,X)		; C1 2D
	ldy $DF.b,X		; B4 DF
	brk $01.b		; 00 01
	ora $ED0E10.l		; 0F 10 0E ED
	cmp ($C0.b,X)		; C1 C0
	ora $63.b		; 05 63
	ora ($2E.b,S),Y		; 13 2E
	dec $01F0.w		; CE F0 01
	ora $00F1B0.l,X		; 1F B0 F1 00
	and [$73.b],Y		; 37 73
	ora ($1F.b)		; 12 1F
	inc $C4EF.w		; EE EF C4
	bpl  -1.b		; 10 FF
	bpl  14.b		; 10 0E
	inc $54F2.w,X		; FE F2 54
	inc $11B4.w,X		; FE B4 11
	dex		; CA
	sbc ($20.b)		; F2 20
	ora ($EF.b),Y		; 11 EF
	ora ($01.b)		; 12 01
	ldy $74.b		; A4 74
	phx		; DA
	sbc ($DD.b,X)		; E1 DD
	sbc ($12.b),Y		; F1 12
	rol $C4BD.w		; 2E BD C4
	bpl   0.b		; 10 00
	inc $44E0.w,X		; FE E0 44
	rol $0EF1.w		; 2E F1 0E
	bcs -70.b		; B0 BA
	cmp $F11001.l,X		; DF 01 10 F1
	ora ($25.b),Y		; 11 25
	adc $A4.b,S		; 63 A4
	lda $20F1FD.l,X		; BF FD F1 20
	jsr $11FE.w		; 20 FE 11
	inc $EDC0.w		; EE C0 ED
	lda #$C2.b		; A9 C2
	eor $33.b,X		; 55 33
	eor ($ED.b,X)		; 41 ED
	sbc $FD22B4.l		; EF B4 22 FD
	sbc ($20.b)		; F2 20
	ora $2F.b,X		; 15 2F
	dec $A4FF.w,X		; DE FF A4
	ora ($FF.b,X)		; 01 FF
	jsl $00F1DC.l		; 22 DC F1 00
	inc $C099.w,X		; FE 99 C0
	cmp $325335.l		; CF 35 53 32
	ora $F0DE.w		; 0D DE F0
	brk $A4.b		; 00 A4
	dec DMALEN3H.w		; CE 36 43
	eor ($B9.b),Y		; 51 B9
	cmp $C012E0.l		; CF E0 12 C0
	brk $00.b		; 00 00
	sbc $FD00F0.l,X		; FF F0 00 FD
	tsx		; BA
	cmp ($B4.b)		; D2 B4
	adc ($EF.b,X)		; 61 EF
	jsr ($23BE.w,X)		; FC BE 23
	ora ($FD.b),Y		; 11 FD
.ACCU 8
	sep #$A4		; E2 A4
	adc $66.b		; 65 66
	asl A		; 0A
	ldy $03DF.w		; AC DF 03
	and ($00.b,X)		; 21 00
	cpy #$FE.b		; C0 FE
	sbc $DB0F00.l		; EF 00 0F DB
	ldy $6415.w		; AC 15 64
	ldy $EF.b,X		; B4 EF
	stp		; DB
	cmp ($32.b)		; D2 32
	bpl -35.b		; 10 DD
	trb $22.b		; 14 22
	ldy $52.b		; A4 52
	lda $F0CE.w,Y		; B9 CE F0
	.db $42, $0F		; 42 0F
	ora $C0DE.w,X		; 1D DE C0
	beq   0.b		; F0 00
	sbc $B0A9.w,X		; FD A9 B0
	lsr $54.b,X		; 56 54
	and ($B4.b),Y		; 31 B4
	lda $2213.w,X		; BD 13 22
	tsb $33D1.w		; 0C D1 33
	and $1E.b,S		; 23 1E
	ldy $9C.b		; A4 9C
	inc $2F13.w,X		; FE 13 2F
	brk $FC.b		; 00 FC
	sbc ($21.b),Y		; F1 21
	cpy #$00.b		; C0 00
	sbc $BFBA.w,X		; FD BA BF
	eor [$63.b]		; 47 63
	bpl  -2.b		; 10 FE
	bcs -33.b		; B0 DF
	ora ($1F.b)		; 12 1F
	tsx		; BA
	sep #$46		; E2 46
	adc [$30.b],Y		; 77 30
	ldy #$DB.b		; A0 DB
	cpy #$43.b		; C0 43
	brk $FD.b		; 00 FD
	ldy $34F1.w,X		; BC F1 34
	cpy #$0E.b		; C0 0E
	tsx		; BA
	stz $6426.w		; 9C 26 64
	and ($0E.b,X)		; 21 0E
	beq -76.b		; F0 B4
	ora ($0E.b,X)		; 01 0E
	lda $3434.w,X		; BD 34 34
	jsr $00BD.w		; 20 BD 00
	ldy $05.b		; A4 05
	lsr $FEBE.w,X		; 5E BE FE
	sbc ($31.b,S),Y		; F3 31
	inc $C0CA.w		; EE CA C0
	cpy $E3BB.w		; CC BB E3
	ror $31.b,X		; 76 31
	bpl -16.b		; 10 F0
	ora $EC01B4.l		; 0F B4 01 EC
	sbc ($53.b,S),Y		; F3 53
	and ($EC.b),Y		; 31 EC
	sbc ($0F.b),Y		; F1 0F
	ldy $21.b		; A4 21
	cpx $11F1.w		; EC F1 11
	and ($EE.b),Y		; 31 EE
	sbc $C0CE.w		; ED CE C0
	jmp.w [$04BC]		; DC BC 04
	mvn $11,$22		; 54 22 11
	brk $FF.b		; 00 FF
	bcs -18.b		; B0 EE
	lda $46B0.w,Y		; B9 B0 46
	adc [$42.b],Y		; 77 42
	ora ($01.b),Y		; 11 01
	ldy $1F.b		; A4 1F
	cmp $1112.w		; CD 12 11
	bpl -17.b		; 10 EF
	sbc $C0DF.w,X		; FD DF C0
	jmp.w [$F4AB]		; DC AB F4
	adc $31.b		; 65 31
	bpl   0.b		; 10 00
	sbc $DAEFB0.l,X		; FF B0 EF DA
	lda $527735.l,X		; BF 35 77 52
	ora ($00.b),Y		; 11 00
	sty $50.b,X		; 94 50
	lda $2422.w,X		; BD 22 24
	and $EABE.w		; 2D BE EA
	ldy $FFC4.w,X		; BC C4 FF
	cpx #$35.b		; E0 35
	eor $0000EE.l		; 4F EE 00 00
	sbc $EC01B4.l,X		; FF B4 01 EC
	tsb $44.b		; 04 44
	and ($DD.b,X)		; 21 DD
	beq -15.b		; F0 F1
	ldy $41.b		; A4 41
	cmp $12F1.w		; CD F1 12
	rol $FCE0.w,X		; 3E E0 FC
	cmp $DBEEC0.l		; CF C0 EE DB
	ldy $6316.w		; AC 16 63
	jsl $A40F10.l		; 22 10 0F A4
	bcs  62.b		; B0 3E
	sta $5667.w,X		; 9D 67 56
	and $FFCD.w,X		; 3D CD FF
	ldy $04.b		; A4 04
	and $01CF.w		; 2D CF 01
	and $0E.b,S		; 23 0E
	sbc $00C4DC.l,X		; FF DC C4 00
	brk $EE.b		; 00 EE
	sbc ($64.b)		; F2 64
	sbc $B0F0FF.l,X		; FF FF F0 B0
	ora $AA0EDE.l,X		; 1F DE 0E AA
	bne  55.b		; D0 37
	adc $22.b,X		; 75 22
	ldy $FD.b		; A4 FD
	ora ($0E.b,S),Y		; 13 0E
	sbc $FE43F1.l		; EF F1 43 FE
	inc $FFC4.w,X		; FE C4 FF
	bpl -16.b		; 10 F0
	asl $45D0.w		; 0E D0 45
	bmi -18.b		; 30 EE
	ldy $EF.b,X		; B4 EF
	jsr $10EE.w		; 20 EE 10
	cmp $3612.w,X		; DD 12 36
	eor $EF9BA4.l		; 4F A4 9B EF
	ora $2F.b,S		; 03 2F
	sbc $2F24EF.l		; EF EF 24 2F
	cpy $00.b		; C4 00
	sbc $000F00.l,X		; FF 00 0F 00
	sbc $B444F1.l		; EF F1 44 B4
	lsr $E0DD.w		; 4E DD E0
	and $DF1EEE.l		; 2F EE 1E DF
	and $B4.b,S		; 23 B4
	and $2E.b,X		; 35 2E
	cmp $FE1000.l,X		; DF 00 10 FE
	beq   1.b		; F0 01
	ldy $44.b		; A4 44
	rol $DEFD.w		; 2E FD DE
	bpl -18.b		; 10 EE
	jsr ($C0DD.w,X)		; FC DD C0
	tyx		; BB
	cmp ($66.b)		; D2 66
	.db $42, $00		; 42 00
	ora ($1F.b)		; 12 1F
	inc $EFB4.w		; EE B4 EF
	ora ($34.b)		; 12 34
	rti		; 40

	dec $21F0.w		; CE F0 21
	ora $AFA4.w		; 0D A4 AF
	bit $56.b		; 24 56
	ora $DEFE.w,X		; 1D FE DE
	cop $ED.b		; 02 ED
	cpy #$ED.b		; C0 ED
	cmp $CBEE.w,X		; DD EE CB
	cmp ($66.b)		; D2 66
	.db $42, $00		; 42 00
	ldy $31.b,X		; B4 31
	cmp $FFEF.w,X		; DD EF FF
	ora ($34.b)		; 12 34
	and $02A4DE.l		; 2F DE A4 02
	and ($FA.b)		; 32 FA
	cmp $0D5524.l		; CF 24 55 0D
	sbc $0DF0A4.l		; EF A4 F0 0D
	cmp $01FF.w		; CD FF 01
	asl $B5CA.w,X		; 1E CA B5
	cpy #$15.b		; C0 15
	stz $20.b		; 64 20
	ora ($22.b,X)		; 01 22
	ora $B0DDED.l		; 0F ED DD B0
	cmp $006236.l,X		; DF 36 62 00
	ora ($43.b,S),Y		; 13 43
	ora $A4DE.w		; 0D DE A4
	rol $41.b,X		; 36 41
	sbc $EDF0FE.l		; EF FE F0 ED
	dec $C0FF.w,X		; DE FF C0
	sbc $BDDCFE.l		; EF FE DC BD
	ora $64.b,X		; 15 64
	jsr $B001.w		; 20 01 B0
	stz $0D.b		; 64 0D
	tsx		; BA
	lda $24EF.w,X		; BD EF 24
	.db $42, $11		; 42 11
	bcs  36.b		; B0 24
	eor ($FD.b,S),Y		; 53 FD
	cmp $5303.w		; CD 03 53
	bpl   1.b		; 10 01
	ldy $32.b		; A4 32
	xba		; EB
	lda $32E2.w,X		; BD E2 32
	inc $BCDC.w,X		; FE DC BC
	cpy #$CF.b		; C0 CF
	and $42.b,X		; 35 42
	ora $ED3113.l		; 0F 13 31 ED
	cmp $63A4.w		; CD A4 63
	jsl $12E031.l		; 22 31 E0 12
	jsl $A4B0DA.l		; 22 DA B0 A4
	ora ($32.b)		; 12 32
	bpl   1.b		; 10 01
	ora ($1F.b),Y		; 11 1F
	ldy $B0CF.w,X		; BC CF B0
	dec $EDFF.w		; CE FF ED
	wai		; CB
	wai		; CB
	tax		; AA
	pea $A465.w		; F4 65 A4
	jmp.w [$5FF5]		; DC F5 5F
	plb		; AB
	cmp $23F022.l		; CF 22 F0 23
	ldy $10.b		; A4 10
	ora ($02.b,X)		; 01 02
	rol $E0CC.w,X		; 3E CC E0
	jsl $159410.l		; 22 10 94 15
	eor $3F.b,S		; 43 3F
	tyx		; BB
	wai		; CB
	cmp $B4FE00.l,X		; DF 00 FE B4
	ora $DE0F00.l		; 0F 00 0F DE
	asl $53.b,X		; 16 53
	sbc $A4E0.w,X		; FD E0 A4
	adc $EB.b		; 65 EB
	tyx		; BB
	sbc ($10.b),Y		; F1 10
	ora ($21.b,S),Y		; 13 21
	brk $94.b		; 00 94
	cop $41.b		; 02 41
	cmp #$CE.b		; C9 CE
	and $50.b		; 25 50
	cpx #$35.b		; E0 35
	sty $54.b,X		; 94 54
	nop		; EA
	ldy $F0DE.w		; AC DE F0
	inc $F2EE.w		; EE EE F2
	ldy $10.b,X		; B4 10
	inc $36DE.w,X		; FE DE 36
	adc ($EC.b,X)		; 61 EC
	sbc ($43.b,X)		; E1 43
	bcs  98.b		; B0 62
	xba		; EB
	lda $00F0.w,X		; BD F0 00
	sbc $A423F0.l,X		; FF F0 23 A4
	and $3201CC.l		; 2F CC 01 32
	jsr ($35D0.w,X)		; FC D0 35
	eor ($A0.b),Y		; 51 A0
	.db $62, $0F, $00		; 62 0F 00
	asl $AACB.w		; 0E CB AA
	dec $B40F.w		; CE 0F B4
	inc $F0EF.w,X		; FE EF F0
	bit $30.b		; 24 30
	inc $4103.w,X		; FE 03 41
	ldy $B9.b		; A4 B9
	lda $D0FD23.l,X		; BF 23 FD D0
	and $21.b,S		; 23 21
	ora ($A0.b),Y		; 11 A0
	mvn $12,$21		; 54 21 12
	and ($0D.b)		; 32 0D
	cmp $7615.w		; CD 15 76
	sty $CD.b,X		; 94 CD
	cop $30.b		; 02 30
	tsx		; BA
	dec $1001.w		; CE 01 10
	sbc $EFFFA4.l,X		; FF A4 FF EF
	ora $6427DD.l		; 0F DD 27 64
	inc $A403.w,X		; FE 03 A4
	eor ($DA.b)		; 52 DA
	cmp $E1ED11.l		; CF 11 ED E1
	and $21.b,S		; 23 21
	sty $E0.b		; 84 E0
	adc $0F.b,S		; 63 0F
	sbc $EDEF.w		; ED EF ED
	cmp ($57.b),Y		; D1 57
	sty $52.b,X		; 94 52
	sbc $31F2.w		; ED F2 31
	nop		; EA
	lda $20F0.w		; AD F0 20
	bcs -18.b		; B0 EE
	inc $EEEE.w		; EE EE EE
	sbc $AECA.w		; ED CA AE
	bit $A4.b		; 24 A4
	sbc $65E3.w		; ED E3 65
	nop		; EA
	ldx $0D22.w		; AE 22 0D
	cmp $532594.l		; CF 94 25 53
	jsl $000F31.l		; 22 31 0F 00
	brk $ED.b		; 00 ED
	sty $BF.b		; 84 BF
	bit $54.b,X		; 34 54
	asl $30E2.w		; 0E E2 30
	phx		; DA
	sta $0194.w,X		; 9D 94 01
	brk $00.b		; 00 00
	ora ($1F.b),Y		; 11 1F
	cmp $CADD.w,X		; DD DD CA
	bcs -87.b		; B0 A9
	lda $242123.l,X		; BF 23 21 24
	adc [$51.b],Y		; 77 51
	inc $F1A0.w		; EE A0 F1
	tsb $BE99.w		; 0C 99 BE
	ora ($43.b,S),Y		; 13 43
	and ($45.b,S),Y		; 33 45
	ldy #$54.b		; A0 54
	jsr $FFFE.w		; 20 FE FF
	brk $00.b		; 00 00
	ora ($34.b)		; 12 34
	sty $2E.b		; 84 2E
	cmp #$9C.b		; C9 9C
	ora ($0D.b,X)		; 01 0D
	sbc $A45225.l		; EF 25 52 A4
	asl $EFEF.w		; 0E EF EF
	inc $37DF.w		; EE DF 37
	bvc -16.b		; 50 F0
	ldy $25.b		; A4 25
	rti		; 40

	ldy $2FE0.w,X		; BC E0 2F
	cpx $22E1.w		; EC E1 22
	sty $63.b		; 84 63
	sbc ($36.b),Y		; F1 36
	mvn $AC,$1D		; 54 1D AC
	sbc ($1E.b)		; F2 1E
	sty $CB.b		; 84 CB
	sbc $75.b		; E5 75
	tas		; 1B
	dec $1C34.w		; CE 34 1C
	stz $0294.w		; 9C 94 02
	and ($1E.b)		; 32 1E
	sbc $CB0E00.l		; EF 00 0E CB
	ldx $F0A4.w,Y		; BE A4 F0
	beq  53.b		; F0 35
	bmi -15.b		; 30 F1
	bit $2F.b,X		; 34 2F
	lda $E394.w,X		; BD 94 E3
	ora $F3AB.w,X		; 1D AB F3
	.db $42, $10		; 42 10
	ora ($33.b)		; 12 33
	sty $0E.b		; 84 0E
	cmp $11DF.w,X		; DD DF 11
	inc $24CD.w		; EE CD 24
	stz $84.b,X		; 74 84
	sbc $35EF.w,X		; FD EF 35
	trb $F3AC.w		; 1C AC F3
	eor ($EC.b),Y		; 51 EC
	sty $01.b,X		; 94 01
	bpl  -3.b		; 10 FD
	jmp.w [$EEFF]		; DC FF EE
	ldy $A4E7.w,X		; BC E7 A4
	mvn $02,$1E		; 54 1E 02
	eor $0D.b,S		; 43 0D
	cmp $94FE11.l		; CF 11 FE 94
	ldy $3113.w,X		; BC 13 31
	ora ($02.b,X)		; 01 02
	jsl $74FE11.l		; 22 11 FE 74
	ldx $1E00.w		; AE 00 1E
	ldy $66F5.w,X		; BC F5 66
	eor $849E.w		; 4D 9E 84
	and $0D.b,S		; 23 0D
	lda $5225.w		; AD 25 52
	dec $4004.w		; CE 04 40
	ldy $FE.b		; A4 FE
	sbc $DF0F0F.l		; EF 0F 0F DF
	beq  20.b		; F0 14
	.db $42, $A4		; 42 A4
	sbc $EB3213.l,X		; FF 13 32 EB
	cpx #$21.b		; E0 21
	sbc $90D0.w,X		; FD D0 90
	lda $030010.l		; AF 10 00 03
	adc [$64.b]		; 67 64
	jsr $8402.w		; 20 02 84
	and $35D1DC.l		; 2F DC D1 35
	asl $3302.w		; 0E 02 33
	ora $EFDD74.l		; 0F 74 DD EF
	ldx $2034.w		; AE 34 20
	beq  36.b		; F0 24
	ora #$B0.b		; 09 B0
	sbc $DCEEFE.l,X		; FF FE EE DC
	cpy $E0CC.w		; CC CC E0
	ora ($B0.b),Y		; 11 B0
	ora ($24.b,X)		; 01 24
	eor $10.b,S		; 43 10
	ora ($10.b,X)		; 01 10
	sbc $94DE.w,X		; FD DE 94
	.db $42, $EF		; 42 EF
	ora ($44.b,X)		; 01 44
	rol $F1E0.w		; 2E E0 F1
	jsr $6180.w		; 20 80 61
	cmp $75F3.w,X		; DD F3 75
	plx		; FA
	stz $6126.w		; 9C 26 61
	sty $C0.b		; 84 C0
	rol $4F.b,X		; 36 4F
	cmp $6224.w		; CD 24 62
	stp		; DB
	ldx $10A4.w,Y		; BE A4 10
	asl $F0EE.w		; 0E EE F0
	ora $54E1FE.l		; 0F FE E1 54
	bcs  33.b		; B0 21
	ora ($23.b,X)		; 01 23
	eor $10.b,S		; 43 10
	ora ($10.b,X)		; 01 10
	inc $D684.w,X		; FE 84 D6
	.db $62, $E0, $02		; 62 E0 02
	lsr $20.b,X		; 56 20
	ora $2284FF.l		; 0F FF 84 22
	sbc $D0ED.w,X		; FD ED D0
	ora ($EE.b),Y		; 11 EE
	sbc $408424.l,X		; FF 24 84 40
	cpx #$23.b		; E0 23
	eor $FE.b,S		; 43 FE
	sbc ($21.b)		; F2 21
	sbc $CD84.w,X		; FD 84 CD
	sbc ($FD.b),Y		; F1 FD
	tyx		; BB
	cmp $BCBB0E.l		; CF 0E BB BC
	ldy #$9B.b		; A0 9B
	sbc ($20.b)		; F2 20
	cop $57.b		; 02 57
	stz $10.b,X		; 74 10
	and $94.b,S		; 23 94
	xce		; FB
	cmp $3F04.w		; CD 04 3F
	sbc $0F3213.l		; EF 13 32 0F
	sty $E1.b		; 84 E1
	ora ($0E.b)		; 12 0E
	ldy $10F1.w,X		; BC F1 10
	cpx $84E0.w		; EC E0 84
	mvp $FF,$21		; 44 21 FF
	bit $42.b		; 24 42
	sbc $23F0.w,X		; FD F0 23
	stz $EC.b,X		; 74 EC
	stz $00E2.w		; 9C E2 00
	nop		; EA
	ldy $DDFD.w,X		; BC FD DD
	sty $ED.b,X		; 94 ED
	sbc $46E1FF.l		; EF FF E1 46
	and $944402.l,X		; 3F 02 44 94
	rol $12BE.w		; 2E BE 12
	ora $03DE.w		; 0D DE 03
	and $2584EF.l,X		; 3F EF 84 25
	eor ($1D.b)		; 52 1D
	cmp $CB1011.l,X		; DF 11 10 CB
.INDEX 8
	sep #$90		; E2 90
	brk $0F.b		; 00 0F
	cmp $12E0.w,X		; DD E0 12
	bpl   1.b		; 10 01
	bit $74.b,X		; 34 74
	inc $24CF.w,X		; FE CF 24
	and $42E0BD.l,X		; 3F BD E0 42
	wai		; CB
	stz $AC.b,X		; 74 AC
	sbc $AC9BDA.l,X		; FF DA 9B AC
	cpy $BBBA.w		; CC BA BB
	sty $25.b,X		; 94 25
	.db $62, $EF, $24		; 62 EF 24
	eor ($FB.b,X)		; 41 FB
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	bra  95.b		; 80 5F
	tyx		; BB
	sbc ($1D.b)		; F2 1D
	lda $23F1.w,X		; BD F1 23
	and ($74.b,X)		; 21 74
	jsl $BD3F54.l		; 22 54 3F BD
	bit $1E.b		; 24 1E
	tyx		; BB
	lda $0D3274.l		; AF 74 32 0D
.ACCU 8
.INDEX 8
	sep #$76		; E2 76
	eor ($01.b,X)		; 41 01
	and ($11.b)		; 32 11
	stz $1D.b,X		; 74 1D
	cmp $E0C0.w,X		; DD C0 E0
	cpy $FFCF.w		; CC CF FF
	cmp #$94.b		; C9 94
	sbc $FFEEF0.l,X		; FF F0 EE FF
	beq  22.b		; F0 16
	rts		; 60

	cpx #$A0.b		; E0 A0
	bit $55.b		; 24 55
	eor ($12.b,X)		; 41 12
	and ($0F.b)		; 32 0F
	sbc $EC8400.l,X		; FF 00 84 EC
	tsb $52.b		; 04 52
	brk $D0.b		; 00 D0
	bit $1F.b		; 24 1F
	dec $C074.w		; CE 74 C0
	eor ($EB.b)		; 52 EB
	lda $DA3225.l		; AF 25 32 DA
	ora $90.b,S		; 03 90
	ora ($32.b,S),Y		; 13 32
	ora ($34.b)		; 12 34
	eor $21.b,S		; 43 21
	ora ($21.b)		; 12 21
	stz $DC.b,X		; 74 DC
	asl $EBEE.w		; 0E EE EB
	cmp $EDFD.w		; CD FD ED
	cmp $FF94.w,Y		; D9 94 FF
	ora $5313FE.l		; 0F FE 13 53
	sbc $843213.l		; EF 13 32 84
	xba		; EB
	cmp ($41.b)		; D2 41
	ldy $11F0.w,X		; BC F0 11
	sbc $5274F1.l,X		; FF F1 74 52
	beq  47.b		; F0 2F
.ACCU 8
	sep #$22		; E2 22
	inc $02FE.w,X		; FE FE 02
	bvs  66.b		; 70 42
	cpx $E0CC.w		; EC CC E0
	asl $AEA9.w		; 0E A9 AE
	and [$74.b]		; 27 74
	and $1D43E5.l		; 2F E5 43 1D
	ldx $0D12.w,Y		; BE 12 0D
	cpy $0174.w		; CC 74 01
	rol $D1CC.w		; 2E CC D1
	ora $EDBDBC.l		; 0F BC BD ED
	sty $FF.b,X		; 94 FF
	sbc $0F53F1.l,X		; FF F1 53 0F
	ora $32.b,S		; 03 32
	ora $22D184.l		; 0F 84 D1 22
	jmp.w [$10E0]		; DC E0 10
	inc $33E0.w		; EE E0 33
	bra  16.b		; 80 10
	beq  36.b		; F0 24
	lsr $54.b,X		; 56 54
	bit $44.b,X		; 34 44
	.db $42, $74		; 42 74
	cpx $2EE0.w		; EC E0 2E
	sbc $12F0E0.l		; EF E0 F0 12
	rol $74.b,X		; 36 74
	and ($E2.b,X)		; 21 E2
	eor ($FF.b)		; 52 FF
	inc $0D12.w,X		; FE 12 0D
	bne 116.b		; D0 74
	brk $CC.b		; 00 CC
	sbc $DCF0.w		; ED F0 DC
	lda $DC0F.w,X		; BD 0F DC
	sty $EF.b		; 84 EF
	sbc $4D4601.l,X		; FF 01 46 4D
	sbc ($53.b,S),Y		; F3 53
	ora $07BD74.l,X		; 1F 74 BD 07
	tsb $329E.w		; 0C 9E 32
	trb $220E.w		; 1C 0E 22
	stz $71.b		; 64 71
	sta $1434.w,X		; 9D 34 14
	eor ($99.b),Y		; 51 99
	mvp $80,$41		; 44 41 80
	jsr $F0ED.w		; 20 ED F0
	asl $BCCB.w		; 0E CB BC
	cmp $2474F0.l,X		; DF F0 74 24
	and $04.b,S		; 23 04
	ora $F00FF1.l,X		; 1F F1 0F F0
	dec $0080.w,X		; DE 80 00
	sbc $CCCC.w,X		; FD CC CC
	wai		; CB
	lda #$99.b		; A9 99
	lda #$84.b		; A9 84
	inc $FEFF.w,X		; FE FF FE
	beq  36.b		; F0 24
	and $7421F1.l,X		; 3F F1 21 74
	cop $50.b		; 02 50
	bpl  16.b		; 10 10
	ora ($0F.b,S),Y		; 13 0F
	jmp.w [$7023]		; DC 23 70
	adc [$64.b],Y		; 77 64
	jsl $224424.l		; 22 24 44 22
	jsr $6002.w		; 20 02 60
	rti		; 40

	cpy $99CC.w		; CC CC 99
	cpy $9999.w		; CC 99 99
	stz $7464.w		; 9C 64 74
	bpl  20.b		; 10 14
	bpl -47.b		; 10 D1
	ora ($01.b,X)		; 01 01
	ora ($64.b,X)		; 01 64
	ora ($0D.b,X)		; 01 0D
	cmp $0CF0.w		; CD F0 0C
	wai		; CB
	ldy $74EB.w,X		; BC EB 74
	sbc $FEED.w,X		; FD ED FE
	cmp $5036DE.l,X		; DF DE 36 50
	ora ($74.b)		; 12 74
	and ($24.b,X)		; 21 24
	eor ($FF.b)		; 52 FF
	and ($31.b,X)		; 21 31
	ora $64DF.w		; 0D DF 64
	tsb $1D.b		; 04 1D
	ora ($DC.b,X)		; 01 DC
	tsb $4C.b		; 04 4C
	bpl  13.b		; 10 0D
	rts		; 60

	mvp $00,$44		; 44 44 00
	cmp #$9C.b		; C9 9C
	tsb $9C99.w		; 0C 99 9C
	stz $04.b		; 64 04
	and ($00.b),Y		; 31 00
	eor $1440.w		; 4D 40 14
	cmp $6404.w,X		; DD 04 64
	ora ($01.b,X)		; 01 01
	jmp.w [$000C]		; DC 0C 00
	cpy $CBFB.w		; CC FB CB
	stz $DF.b,X		; 74 DF
	sbc $FEDDDF.l		; EF DF DD FE
	sbc $743045.l,X		; FF 45 30 74
	trb $22.b		; 14 22
	bit $23.b		; 24 23
	ora $0F1101.l,X		; 1F 01 11 0F
	stz $A9.b		; 64 A9
	tsb $10.b		; 04 10
	trb $43DC.w		; 1C DC 43
	bpl   0.b		; 10 00
	stz $D0.b		; 64 D0
	tsb $00.b		; 04 00
	jmp.w [$F40C]		; DC 0C F4
	beq -52.b		; F0 CC
	bvs -84.b		; 70 AC
	dec $0000.w		; CE 00 00
	brk $24.b		; 00 24
	mvp $64,$44		; 44 44 64
	bpl  77.b		; 10 4D
	trb $C01C.w		; 1C 1C C0
	brk $CB.b		; 00 CB
	cmp $F0EF74.l		; CF 74 EF F0
	dec $FFDF.w,X		; DE DF FF
	sbc $15FD.w,X		; FD FD 15
	stz $51.b,X		; 74 51
	jsr $2332.w		; 20 32 23
	.db $42, $11		; 42 11
	ora $216410.l,X		; 1F 10 64 21
	lda $41D1.w		; AD D1 41
	ora ($DD.b,X)		; 01 DD
	cpy #$44.b		; C0 44
	rts		; 60

	mvp $00,$00		; 44 00 00
	brk $0C.b		; 00 0C
	cmp #$99.b		; C9 99
	cpy $C064.w		; CC 64 C0
	lda ($03.b,S),Y		; B3 03
	tsb $00.b		; 04 00
	ora $10.b,S		; 03 10
	rti		; 40

	stz $1D.b		; 64 1D
	brk $01.b		; 00 01
	tsb $0C0C.w		; 0C 0C 0C
	ora $FB640C.l		; 0F 0C 64 FB
	jsr ($BFFE.w,X)		; FC FE BF
	ldx $EEFA.w,Y		; BE FA EE
	sbc $13DF74.l		; EF 74 DF 13
	eor ($20.b),Y		; 51 20
	ora ($42.b)		; 12 42
	bmi  63.b		; 30 3F
	mvn $23,$12		; 54 12 23
	jsl $12B1B2.l		; 22 B2 B1 12
	inc A		; 1A
	ldy #$50.b		; A0 50
	brk $07.b		; 00 07
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	bvc   7.b		; 50 07
	adc [$70.b],Y		; 77 70
	ora [$77.b]		; 07 77
	adc [$00.b],Y		; 77 00
	brk $64.b		; 00 64
	tsb $0B0C.w		; 0C 0C 0B
	ora $FBBFCF.l		; 0F CF BF FB
	sbc $DFF074.l		; EF 74 F0 DF
	sbc $211501.l,X		; FF 01 15 21
	cop $22.b		; 02 22
	stz $55.b		; 64 55
	eor ($12.b),Y		; 51 12
	asl $1E11.w,X		; 1E 11 1E
	cmp ($D0.b),Y		; D1 D0
	mvn $1A,$11		; 54 11 1A
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $CC.b		; 00 CC
	cmp #$99.b		; C9 99
	stz $9999.w		; 9C 99 99
	stz $0F54.w		; 9C 54 0F
	ora $00070F.l		; 0F 0F 07 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $0C.b		; 00 0C
	tsb $0B0F.w		; 0C 0F 0B
	phd		; 0B
	jsr ($64EF.w,X)		; FC EF 64
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc ($FC.b)		; F2 FC
	sbc $436436.l		; EF 36 64 43
	brk $44.b		; 00 44
	eor ($41.b,X)		; 41 41
	ora ($51.b),Y		; 11 51
	ora ($54.b),Y		; 11 54
	and ($BA.b)		; 32 BA
	and ($21.b,X)		; 21 21
	and #$1A.b		; 29 1A
	ora ($01.b,X)		; 01 01
	bvc 119.b		; 50 77
	bvs   7.b		; 70 07
	adc [$00.b],Y		; 77 00
	ora #$90.b		; 09 90
	brk $50.b		; 00 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	rts		; 60

	cpy $00CC.w		; CC CC 00
	cpy $99CC.w		; CC CC 99
	sta $6499.w,Y		; 99 99 64
	cmp $FFFFFC.l		; CF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	stz $FC.b		; 64 FC
	inc $3333.w,X		; FE 33 33
	brk $34.b		; 00 34
	rti		; 40

	mvn $11,$64		; 54 64 11
	eor ($11.b),Y		; 51 11
	ora ($D1.b)		; 12 D1
	cmp ($10.b),Y		; D1 10
	ora $7460.w,X		; 1D 60 74
	mvp $00,$44		; 44 44 00
	brk $C0.b		; 00 C0
	brk $0C.b		; 00 0C
	bit $BE.b,X		; 34 BE
	inc $EEEE.w		; EE EE EE
	inc $EEEE.w		; EE EE EE
	inc $9950.w		; EE 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $0C64.w,Y		; 99 64 0C
	beq -16.b		; F0 F0
	bcs -65.b		; B0 BF
	sbc $54F0FF.l,X		; FF FF F0 54
	dec $FEEE.w,X		; DE EE FE
	inc $66EE.w		; EE EE 66
	rts		; 60

	sbc [$64.b],Y		; F7 64
	rti		; 40

	eor ($41.b,X)		; 41 41
	eor ($11.b,X)		; 41 11
	ora $1D.b,X		; 15 1D
	ora $2254.w,X		; 1D 54 22
	ora ($2A.b),Y		; 11 2A
	ora ($91.b),Y		; 11 91
	ora ($01.b,X)		; 01 01
	ora ($54.b,X)		; 01 54
	brk $10.b		; 00 10
	bpl -112.b		; 10 90
	brk $00.b		; 00 00
	ora #$F0.b		; 09 F0
	rts		; 60

	cpy $99C9.w		; CC C9 99
	sta $9999.w,Y		; 99 99 99
	sta $649C.w,Y		; 99 9C 64
	brk $F0.b		; 00 F0
	brk $CF.b		; 00 CF
	ora $0FCF0F.l		; 0F 0F CF 0F
	stz $F0.b		; 64 F0
	lda $FFFFFF.l,X		; BF FF FF FF
	sbc $640FFF.l,X		; FF FF 0F 64
	and $0F.b,S		; 23 0F
	rti		; 40

	bit $04.b,X		; 34 04
	ora $01.b		; 05 01
	trb $54.b		; 14 54
	jsl $12A222.l		; 22 22 A2 12
	ora ($11.b)		; 12 11
	lda ($11.b,X)		; A1 11
	mvn $11,$11		; 54 11 11
	sta ($01.b),Y		; 91 01
	ora ($01.b,X)		; 01 01
	bcc   0.b		; 90 00
	rts		; 60

	brk $CC.b		; 00 CC
	cpy $99C9.w		; CC C9 99
	sta $9999.w,Y		; 99 99 99
	rts		; 60

	sta $9999.w,Y		; 99 99 99
	cpy $99C9.w		; CC C9 99
	sta $6499.w,Y		; 99 99 64
	ora $0FCF0F.l		; 0F 0F CF 0F
	sbc $FFF00F.l,X		; FF 0F F0 FF
	mvn $FF,$FE		; 54 FE FF
	sbc $F6F6EF.l		; EF EF F6 F6
	ora $406470.l		; 0F 70 64 40
	tsb $10.b		; 04 10
	trb $10.b		; 14 10
	ora ($10.b),Y		; 11 10
	ora ($70.b),Y		; 11 70
	ror $44.b		; 66 44
	mvp $44,$44		; 44 44 44
	mvp $22,$24		; 44 24 22
	rts		; 60

	mvp $00,$44		; 44 44 00
	brk $00.b		; 00 00
	cpy $99CC.w		; CC CC 99
	rts		; 60

	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $6099.w,Y		; 99 99 60
	stz $CCCC.w		; 9C CC CC
	cmp #$99.b		; C9 99
	sta $9999.w,Y		; 99 99 99
	lda ($0F.b,X)		; A1 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $590C00.l,X		; FF 00 0C 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	bcc -23.b		; 90 E9
	ora $1A.b,S		; 03 1A
	jsr $4143.w		; 20 43 41
	eor ($53.b)		; 52 53
	mvn $52,$41		; 54 41 52
	mvn $73,$2E		; 54 2E 73
	adc $0D006C.l		; 6F 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D4.b		; E9 D4
	cmp $EDDF.w,Y		; D9 DF ED
	ora $2927.w		; 0D 27 29
	tas		; 1B
	bpl   3.b		; 10 03
	sbc ($F2.b),Y		; F1 F2
	cop $09.b		; 02 09
	cop $FC.b		; 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora #$00.b		; 09 00
	bra -15.b		; 80 F1
	and ($F1.b),Y		; 31 F1
	jsl $453423.l		; 22 23 34 45
	eor $64.b,X		; 55 64
	ora ($51.b),Y		; 11 51
	and ($21.b,X)		; 21 21
	ora ($12.b)		; 12 12
	eor ($22.b),Y		; 51 22
	stz $12.b		; 64 12
	eor ($26.b)		; 52 26
	jsl $F66222.l		; 22 22 62 F6
	rol $64.b		; 26 64
	sbc ($32.b)		; F2 32
	inc $62.b,X		; F6 62
	sbc ($22.b,S),Y		; F3 22
	and ($23.b)		; 32 23
	stz $E6.b		; 64 E6
	adc $F6.b,S		; 63 F6
	and $32.b,S		; 23 32
	rol $3F.b,X		; 36 3F
	and ($64.b)		; 32 64
	and ($36.b)		; 32 36
	sbc ($23.b,S),Y		; F3 23
	rol $66F2.w,X		; 3E F2 66
	inc $64.b,X		; F6 64
	rol $6336.w,X		; 3E 36 63
	lda ($6F.b,S),Y		; B3 6F
	rol $F2.b		; 26 F2
	adc [$64.b]		; 67 64
	xce		; FB
	rol $26.b		; 26 26
	tsa		; 3B
	ror $32.b		; 66 32
	and ($FF.b)		; 32 FF
	stz $15.b,X		; 74 15
	jsr ($D5F0.w,X)		; FC F0 D5
	and $FF14.w		; 2D 14 FF
	ora ($74.b)		; 12 74
	eor $F0.b		; 45 F0
	and [$12.b]		; 27 12
	mvn $05,$FE		; 54 FE 05
	bpl -124.b		; 10 84
	brk $F1.b		; 00 F1
	ora $5F11F1.l		; 0F F1 11 5F
	cmp ($50.b,S),Y		; D3 50
	stz $D0.b,X		; 74 D0
	stz $EF.b		; 64 EF
	mvn $1E,$F2		; 54 F2 1E
	bit $CB.b,X		; 34 CB
	sty $10.b,X		; 94 10
	cop $FE.b		; 02 FE
	bit $0E.b		; 24 0E
	ora ($00.b),Y		; 11 00
	brk $84.b		; 00 84
	and ($DF.b)		; 32 DF
	eor $0E.b,X		; 55 0E
	brk $E3.b		; 00 E3
	rol $84E3.w		; 2E E3 84
	rol $31D1.w,X		; 3E D1 31
	beq  50.b		; F0 32
	and $840C25.l		; 2F 25 0C 84
	sbc ($41.b)		; F2 41
	sbc $C15FD2.l,X		; FF D2 5F C1
	ora $008423.l,X		; 1F 23 84 00
	ora ($F1.b),Y		; 11 F1
	.db $42, $D0		; 42 D0
	bpl  32.b		; 10 20
	cmp ($94.b,S),Y		; D3 94
	.db $42, $ED		; 42 ED
	ora $00.b,S		; 03 00
	sbc $20EE23.l,X		; FF 23 EE 20
	bcc  53.b		; 90 35
	mvn $2F,$57		; 54 57 2F
	eor [$2F.b]		; 47 2F
	rol $76.b		; 26 76
	sty $F1.b,X		; 94 F1
	rol $4FD2.w		; 2E D2 4F
	sbc $5B.b		; E5 5B
	sta ($50.b),Y		; 91 50
	sty $21.b,X		; 94 21
	ldy $F144.w,X		; BC 44 F1
	and ($02.b),Y		; 31 02
	bpl -55.b		; 10 C9
	ldy $E0.b		; A4 E0
	and ($EE.b,S),Y		; 33 EE
	bit $1F.b,X		; 34 1F
	cpx #$FE.b		; E0 FE
	eor $94.b		; 45 94
	plx		; FA
	sbc ($E9.b,S),Y		; F3 E9
	and $00.b		; 25 00
	and $3A.b		; 25 3A
	sty $94.b,X		; 94 94
	rol $1FF2.w,X		; 3E F2 1F
	sbc ($4B.b,S),Y		; F3 4B
	lda $4E.b,X		; B5 4E
	eor ($A0.b,S),Y		; 53 A0
	ora $3E06.w,X		; 1D 06 3E
	tsb $44.b		; 04 44
	eor [$50.b],Y		; 57 50
	ora $94.b,S		; 03 94
	eor $1FE1.w		; 4D E1 1F
	jsl $2136DE.l		; 22 DE 36 21
	asl $C294.w,X		; 1E 94 C2
	pld		; 2B
	cmp [$5D.b],Y		; D7 5D
.ACCU 8
	sep #$2D		; E2 2D
	cpy #$66.b		; C0 66
	ldy #$54.b		; A0 54
	eor $44.b,X		; 55 44
	and ($12.b),Y		; 31 12
	and ($46.b)		; 32 46
	rti		; 40

	ldy #$E0.b		; A0 E0
	jsr $12EE.w		; 20 EE 12
	cop $52.b		; 02 52
	sbc $F29433.l		; EF 33 94 F2
	jsr $34AA.w		; 20 AA 34
	bne  81.b		; D0 51
	cmp ($6F.b)		; D2 6F
	ldy $B0.b		; A4 B0
	.db $42, $31		; 42 31
	sbc $F2FC.w		; ED FC F2
	mvp $A4,$10		; 44 10 A4
	ora $0033BC.l,X		; 1F BC 33 00
	bpl  36.b		; 10 24
	sbc $A4DC.w,X		; FD DC A4
	ora [$2F.b],Y		; 17 2F
	mvp $EC,$FE		; 44 FE EC
	cmp ($1E.b),Y		; D1 1E
	sbc $A4.b,S		; E3 A4
	and $63F3DC.l		; 2F DC F3 63
	beq -35.b		; F0 DD
	lsr $EF.b		; 46 EF
	ldy $2F.b,X		; B4 2F
	pea $A23C.w		; F4 3C A2
	lsr $40B2.w		; 4E B2 40
	cmp ($A4.b)		; D2 A4
	inc A		; 1A
	lda ($40.b)		; B2 40
	sbc ($54.b,X)		; E1 54
	brk $42.b		; 00 42
	sbc $46B0.w		; ED B0 46
	ror $33.b,X		; 76 33
	rol $12CE.w		; 2E CE 12
	brk $00.b		; 00 00
	ldy $32.b		; A4 32
	dec $2D57.w,X		; DE 57 2D
	dec $FEDD.w,X		; DE DD FE
	cmp ($A0.b,X)		; C1 A0
	bne  36.b		; D0 24
	.db $42, $36		; 42 36
	adc $44.b,X		; 75 44
	and ($32.b,S),Y		; 33 32
	sty $EC.b,X		; 94 EC
	ora ($36.b,X)		; 01 36
	and $E9F210.l,X		; 3F 10 F2 E9
	sbc [$A4.b]		; E7 A4
	rti		; 40

	cmp $21010E.l,X		; DF 0E 01 21
	beq  17.b		; F0 11
	sbc $23A4.w		; ED A4 23
	and ($10.b),Y		; 31 10
	sbc $DD00.w		; ED 00 DD
	cpx #$34.b		; E0 34
	bcs  34.b		; B0 22
	eor $66.b		; 45 66
	adc $43.b		; 65 43
	and ($21.b,S),Y		; 33 21
	brk $A4.b		; 00 A4
	ora ($12.b),Y		; 11 12
	and $C32B14.l		; 2F 14 2B C3
	rol $A0D1.w,X		; 3E D1 A0
	eor ($CB.b,X)		; 41 CB
	jmp.w [$CF99]		; DC 99 CF
	inc $3103.w,X		; FE 03 31
	sty $DE.b,X		; 94 DE
	sbc ($31.b),Y		; F1 31
	sbc ($1B.b)		; F2 1B
	stz $171F.w,X		; 9E 1F 17
	ldy $62.b		; A4 62
	brk $FF.b		; 00 FF
	beq  16.b		; F0 10
	brk $10.b		; 00 10
	ora ($94.b)		; 12 94
	ora $601344.l,X		; 1F 44 13 60
	dec $AD2E.w		; CE 2E AD
	bit $94.b		; 24 94
	ora $0E03.w		; 0D 03 0E
	and $41.b		; 25 41
	ora ($1D.b,X)		; 01 1D
	ldx $FF94.w,Y		; BE 94 FF
	sbc ($11.b),Y		; F1 11
	mvp $2F,$01		; 44 01 2F
	dec $9403.w		; CE 03 94
	ora ($1E.b)		; 12 1E
	lda $1121.w,X		; BD 21 11
	cpx $F0FF.w		; EC FF F0
	sty $01.b,X		; 94 01
	and $31.b,X		; 35 31
	ora $00D01D.l		; 0F 1D D0 00
	ora ($94.b)		; 12 94
	ora ($52.b,S),Y		; 13 52
	beq  52.b		; F0 34
	ora $FEE1.w,X		; 1D E1 FE
	ora ($94.b),Y		; 11 94
	sbc $031112.l		; EF 12 11 03
	eor $FD.b,S		; 43 FD
	bpl -16.b		; 10 F0
	sty $1E.b,X		; 94 1E
	ldx $3E37.w,Y		; BE 37 3E
	sbc ($1E.b)		; F2 1E
	sbc ($01.b,X)		; E1 01
	sty $14.b		; 84 14
	inc A		; 1A
	lda $B0F0FA.l,X		; BF FA F0 B0
	ror $E1.b,X		; 76 E1
	sty $72.b		; 84 72
	sbc ($55.b),Y		; F1 55
	lsr $40B1.w,X		; 5E B1 40
	ldx $9421.w		; AE 21 94
	ora ($21.b,S),Y		; 13 21
	asl $EA02.w,X		; 1E 02 EA
	cpx $30.b		; E4 30
	sbc ($84.b)		; F2 84
	adc $15.b,S		; 63 15
	adc ($BF.b,X)		; 61 BF
	bpl -103.b		; 10 99
	and [$0B.b]		; 27 0B
	sty $12.b,X		; 94 12
	ora $E05014.l,X		; 1F 14 50 E0
	and $EB.b,S		; 23 EB
	bpl -96.b		; 10 A0
	ora ($34.b),Y		; 11 34
	eor $66.b		; 45 66
	mvn $31,$33		; 54 33 31
	bit $90.b		; 24 90
	stz $21.b,X		; 74 21
	ora ($32.b,X)		; 01 32
	cop $66.b		; 02 66
	jsl $D4841F.l		; 22 1F 84 D4
	.db $62, $46, $CC		; 62 46 CC
	jsr $60D3.w		; 20 D3 60
	sbc ($94.b)		; F2 94
	ora $31F1F0.l,X		; 1F F0 F1 31
	ora ($FB.b,S),Y		; 13 FB
	ora $EB.b,S		; 03 EB
	ldy #$04.b		; A0 04
	mvn $54,$56		; 54 56 54
	and ($43.b,S),Y		; 33 43
	ora ($22.b),Y		; 11 22
	sty $AE.b		; 84 AE
	ora ($25.b,X)		; 01 25
	and $60.b,X		; 35 60
	dec $BEED.w		; CE ED BE
	sty $54.b		; 84 54
	sbc $5E.b,S		; E3 5E
	sbc ($20.b,X)		; E1 20
	adc [$F0.b]		; 67 F0
	bit $CD94.w,X		; 3C 94 CD
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	ora ($0E.b)		; 12 0E
.INDEX 8
	sep #$1F		; E2 1F
	ora [$94.b],Y		; 17 94
	eor ($0E.b,X)		; 41 0E
	sbc $011200.l		; EF 00 12 01
	asl $94DF.w		; 0E DF 94
	sbc $4325.w,X		; FD 25 43
	asl $FFEE.w,X		; 1E EE FF
	sbc $029434.l,X		; FF 34 94 02
	rol $F1D0.w,X		; 3E D0 F1
	eor $F0.b,S		; 43 F0
	jsr $94CC.w		; 20 CC 94
	sbc ($35.b,X)		; E1 35
	rol $0F02.w		; 2E 02 0F
	beq -12.b		; F0 F4
	eor ($94.b,X)		; 41 94
	bne  -3.b		; D0 FD
	ora $31.b,S		; 03 31
	ora ($22.b,X)		; 01 22
	tsb $94BF.w		; 0C BF 94
	jsl $110023.l		; 22 23 00 11
	inc $15EF.w,X		; FE EF 15
	rol $EE94.w		; 2E 94 EE
	cpx #$41.b		; E0 41
	sbc ($50.b,S),Y		; F3 50
	ora $94DCDF.l		; 0F DF DC 94
	and $0E.b		; 25 0E
	bit $10.b,X		; 34 10
	inc $43F1.w,X		; FE F1 43
	inc $0F94.w,X		; FE 94 0F
	beq  30.b		; F0 1E
	brk $24.b		; 00 24
	eor $53B1.w		; 4D B1 53
	sty $CA.b,X		; 94 CA
	ora ($02.b,S),Y		; 13 02
	rol $12E3.w		; 2E E3 12
	and $2294E1.l		; 2F E1 94 22
	and $FC64C2.l		; 2F C2 64 FC
	cpy #$42.b		; C0 42
	sbc $E294.w,X		; FD 94 E2
	jsr $D110.w		; 20 10 D1
	eor ($00.b),Y		; 51 00
	beq  17.b		; F0 11
	sty $00.b		; 84 00
	ldy $EB55.w,X		; BC 55 EB
	sbc ($1C.b,S),Y		; F3 1C
	pea $841A.w		; F4 1A 84
	cmp $63.b		; C5 63
	inc $F024.w,X		; FE 24 F0
	brk $E2.b		; 00 E2
	and ($84.b),Y		; 31 84
	bmi   4.b		; 30 04
	and ($53.b)		; 32 53
	lda #$77.b		; A9 77
	phx		; DA
	sbc ($94.b)		; F2 94
	and ($F0.b)		; 32 F0
	ora $0F35.w		; 0D 35 0F
	jsr $FD13.w		; 20 13 FD
	sty $ED.b,X		; 94 ED
	and $1C.b		; 25 1C
	cop $01.b		; 02 01
	jsr ($0103.w,X)		; FC 03 01
	sty $0E.b,X		; 94 0E
	cop $C0.b		; 02 C0
	eor $2120E3.l		; 4F E3 20 21
	inc $F184.w,X		; FE 84 F1
	and $1D.b,S		; 23 1D
	jmp.w [$40F5]		; DC F5 40
	ora $52.b,S		; 03 52
	sty $EE.b,X		; 94 EE
	ora ($34.b,X)		; 01 34
	jsr $6EC2.w		; 20 C2 6E
	lda ($2D.b)		; B2 2D
	sty $15.b,X		; 94 15
	jsr ($E023.w,X)		; FC 23 E0
	and $DF20E1.l,X		; 3F E1 20 DF
	ldy #$33.b		; A0 33
	jsl $341221.l		; 22 21 12 34
	mvp $11,$43		; 44 43 11
	sty $30.b,X		; 94 30
	cmp $030E11.l		; CF 11 0E 03
	asl $CA46.w,X		; 1E 46 CA
	sty $33.b,X		; 94 33
	cpx #$2F.b		; E0 2F
	sbc $122E15.l		; EF 15 2E 12
	cpx #$94.b		; E0 94
	asl $1FF4.w,X		; 1E F4 1F
	jsr $33CD.w		; 20 CD 33
	and ($02.b),Y		; 31 02
	sty $EE.b		; 84 EE
	adc $F4.b		; 65 F4
	adc $DFE0.w		; 6D E0 DF
	bvs -94.b		; 70 A2
	sty $4D.b,X		; 94 4D
.INDEX 8
	sep #$1F		; E2 1F
	bit $FC.b,X		; 34 FC
	sbc ($EE.b)		; F2 EE
	and ($84.b)		; 32 84
	sbc $23F1.w		; ED F1 23
	ora $6EE6.w		; 0D E6 6E
	dec $9403.w		; CE 03 94
	rti		; 40

	lda $FD35.w,X		; BD 35 FD
	bit $EF.b		; 24 EF
	eor ($E3.b,X)		; 41 E3
	ldy $1D.b		; A4 1D
	tsb $FC.b		; 04 FC
	and $EF.b,S		; 23 EF
	and ($02.b,X)		; 21 02
	sbc $BF6684.l		; EF 84 66 BF
	eor $1B.b,X		; 55 1B
	lda [$6D.b],Y		; B7 6D
	cmp ($12.b,S),Y		; D3 12
	sty $1E.b,X		; 94 1E
	cmp ($4E.b,S),Y		; D3 4E
	rep #$40		; C2 40
	cmp ($20.b),Y		; D1 20
	cmp $CF3094.l,X		; DF 94 30 CF
	eor ($D1.b)		; 52 D1
	bmi -14.b		; 30 F2
	ora $EE9403.l,X		; 1F 03 94 EE
	jsr $0EE1.w		; 20 E1 0E
	bit $BF.b,X		; 34 BF
	adc ($B2.b,X)		; 61 B2
	sty $4E.b,X		; 94 4E
	cop $FF.b		; 02 FF
	jsr $1EE2.w		; 20 E2 1E
	asl $FE.b,X		; 16 FE
	sty $35.b		; 84 35
	ora ($FD.b)		; 12 FD
	eor $FE.b		; 45 FE
	bmi   4.b		; 30 04
	tas		; 1B
	sty $F4.b		; 84 F4
	rol $D210.w		; 2E 10 D2
	adc ($B2.b,X)		; 61 B2
	ora $0C8404.l,X		; 1F 04 84 0C
	beq  18.b		; F0 12
	beq -15.b		; F0 F1
	bit $CF.b		; 24 CF
	adc ($94.b,S),Y		; 73 94
	sbc $F01110.l		; EF 10 11 F0
	bmi -30.b		; 30 E2
	eor ($E2.b,X)		; 41 E2
	ldy #$44.b		; A0 44
	eor $34.b,S		; 43 34
	mvn $32,$44		; 54 44 32
	eor $01.b,S		; 43 01
	bcc 103.b		; 90 67
	adc $54.b,X		; 75 54
	bpl  15.b		; 10 0F
	sbc ($55.b),Y		; F1 55
	and ($94.b)		; 32 94
	and $1D.b,S		; 23 1D
	and $DD.b		; 25 DD
	and ($E0.b),Y		; 31 E0
	and $2D94E3.l		; 2F E3 94 2D
	ora $2F.b		; 05 2F
	sbc $04F2.w		; ED F2 04
	eor $2F94B1.l		; 4F B1 94 2F
	ora $0F.b,S		; 03 0F
	ora ($20.b),Y		; 11 20
	dec $1221.w		; CE 21 12
	sty $ED.b,X		; 94 ED
	eor $E1.b,S		; 43 E1
	rol $02D0.w,X		; 3E D0 02
	adc $2F94A1.l,X		; 7F A1 94 2F
	ora ($E1.b,X)		; 01 E1
	eor $FF30E2.l		; 4F E2 30 FF
	bit $94.b,X		; 34 94
	dec $E173.w		; CE 73 E1
	sbc $BE33.w,X		; FD 33 BE
	and ($33.b,X)		; 21 33
	sty $CB.b,X		; 94 CB
	stz $A2.b		; 64 A2
	phy		; 5A
	ora [$D9.b]		; 07 D9
	mvn $A0,$AF		; 54 AF A0
	bit $43.b,X		; 34 43
	brk $44.b		; 00 44
	ora ($20.b)		; 12 20
	and $20.b,X		; 35 20
	sty $40.b,X		; 94 40
	sbc ($11.b),Y		; F1 11
	lsr $4BE6.w		; 4E E6 4B
	sbc ($E3.b)		; F2 E3
	sty $5B.b,X		; 94 5B
	ldy $4E.b		; A4 4E
	sbc ($21.b),Y		; F1 21
	inc $0C24.w		; EE 24 0C
	sty $F1.b,X		; 94 F1
	ora ($FC.b),Y		; 11 FC
	ora $1C.b		; 05 1C
	inc $2B.b,X		; F6 2B
	sbc $94.b		; E5 94
	bpl  64.b		; 10 40
	cmp ($3D.b,X)		; C1 3D
	sta ($62.b),Y		; 91 62
	cmp $0C9445.l		; CF 45 94 0C
	sbc $40.b,X		; F5 40
	bpl -79.b		; 10 B1
	tsa		; 3B
	ldx $3C.b,Y		; B6 3C
	ldy #$02.b		; A0 02
	mvp $36,$20		; 44 20 36
	eor ($54.b,S),Y		; 53 54
	ora $5F.b,X		; 15 5F
	sty $C4.b,X		; 94 C4
	asl $7FE4.w,X		; 1E E4 7F
	cmp ($62.b,X)		; C1 62
	cmp ($3C.b,X)		; C1 3C
	sty $23.b,X		; 94 23
	cpy $3C23.w		; CC 23 3C
	pea $F330.w		; F4 30 F3
	eor $12E294.l,X		; 5F 94 E2 12
	asl A		; 0A
	sbc $2D.b,X		; F5 2D
	cpx #$22.b		; E0 22
	inc $4594.w,X		; FE 94 45
	cmp $CC52.w,X		; DD 52 CC
	inc $2B13.w,X		; FE 13 2B
	cpx $94.b		; E4 94
	rol $1311.w,X		; 3E 11 13
	and $30CC01.l		; 2F 01 CC 30
	cpy $A0.b		; C4 A0
	rol $55C0.w		; 2E C0 55
	ora $465337.l,X		; 1F 37 53 46
	eor ($A0.b,X)		; 41 A0
	brk $11.b		; 00 11
	ora ($01.b),Y		; 11 01
	eor $22.b,X		; 55 22
	bit $64.b,X		; 34 64
	ldy #$25.b		; A0 25
	rts		; 60

	sbc ($10.b,X)		; E1 10
	ora $454203.l		; 0F 03 42 45
	sty $A2.b,X		; 94 A2
	jmp $DB15.w		; 4C 15 DB
	brk $2F.b		; 00 2F
	cmp $C39472.l		; CF 72 94 C3
	adc $2F11D1.l,X		; 7F D1 11 2F
	ora ($CF.b),Y		; 11 CF
	jsl $42FF84.l		; 22 84 FF 42
	bit $43.b		; 24 43
	bit $0AE3.w		; 2C E3 0A
	txy		; 9B
	sty $24.b,X		; 94 24
	nop		; EA
	sbc [$3D.b],Y		; F7 3D
	trb $03.b		; 14 03
	rti		; 40

	ldx $3494.w,Y		; BE 94 34
	jmp.w [$03FD]		; DC FD 03
	lsr $12E2.w		; 4E E2 12
	eor ($94.b,X)		; 41 94
	jsl $B15FE1.l		; 22 E1 5F B1
	ora $1112CE.l,X		; 1F CE 12 11
	sty $1D.b,X		; 94 1D
	sbc $60.b		; E5 60
	sbc ($0F.b),Y		; F1 0F
	ora $9412DE.l,X		; 1F DE 12 94
	sbc $12C0.w,X		; FD C0 12
	and ($01.b,S),Y		; 33 01
	eor $2D.b		; 45 2D
	sbc ($94.b),Y		; F1 94
	bpl  -1.b		; 10 FF
	sbc $0112CE.l,X		; FF CE 12 01
	trb $40.b		; 14 40
	ldy #$34.b		; A0 34
	adc [$32.b],Y		; 77 32
	bit $20.b,X		; 34 20
	bit $2F.b		; 24 2F
	sbc ($94.b),Y		; F1 94
	sbc ($33.b),Y		; F1 33
	and $E32FDF.l		; 2F DF 2F E3
	eor $94B3.w		; 4D B3 94
	lsr $0CF4.w,X		; 5E F4 0C
	trb $F0.b		; 14 F0
	and $942CD3.l,X		; 3F D3 2C 94
	sbc ($FD.b,S),Y		; F3 FD
	ror $DD.b		; 66 DD
	and ($03.b,X)		; 21 03
	bpl  -1.b		; 10 FF
	sty $0E.b,X		; 94 0E
	cmp $E21D13.l,X		; DF 13 1D E2
	bpl  37.b		; 10 25
	and $4FF584.l		; 2F 84 F5 4F
	wai		; CB
	sbc ($FD.b,X)		; E1 FD
	bcs  83.b		; B0 53
	cmp ($94.b,X)		; C1 94
	mvp $1E,$33		; 44 33 1E
	inc $0012.w		; EE 12 00
	rol $B49F.w,X		; 3E 9F B4
	and ($F0.b,X)		; 21 F0
	bpl   1.b		; 10 01
	jsr ($5E06.w,X)		; FC 06 5E
	lda $F31EB4.l,X		; BF B4 1E F3
	ora OAMDATA.w		; 0D 04 21
	ora ($E9.b)		; 12 E9
	cpy $B4.b		; C4 B4
	.db $42, $4F		; 42 4F
	lda $70B55D.l		; AF 5D B5 70
	sbc ($CA.b)		; F2 CA
	bcs -51.b		; B0 CD
	sbc ($32.b,X)		; E1 32
	and $3E.b,X		; 35 3E
	cmp $6016.w		; CD 16 60
	ldy $C3.b,X		; B4 C3
	lsr $61A2.w,X		; 5E A2 61
	pei ($5E.b)		; D4 5E
	cmp $DEB4FD.l		; CF FD B4 DE
	rol $1F.b		; 26 1F
	and $ED75C0.l		; 2F C0 75 ED
	brk $C0.b		; 00 C0
	jsr $34EE.w		; 20 EE 34
	xba		; EB
	tsb $10.b		; 04 10
	bpl -18.b		; 10 EE
	cpy $13.b		; C4 13
	rti		; 40

	plb		; AB
	jsl $DE3102.l		; 22 02 31 DE
	ora $12EFB0.l,X		; 1F B0 EF 12
	ror $22.b		; 66 22
	and $7FB4.w,X		; 3D B4 7F
	lda ($B4.b,S),Y		; B3 B4
	jmp $161DD4.l		; 5C D4 1D 16
	tas		; 1B
.ACCU 8
.INDEX 8
	sep #$FC		; E2 FC
	cpx #$B4.b		; E0 B4
	ora ($FE.b),Y		; 11 FE
	brk $13.b		; 00 13
	stz $E9.b		; 64 E9
	lda ($65.b,X)		; A1 65
	bcs  82.b		; B0 52
	brk $EC.b		; 00 EC
	sbc $76.b,S		; E3 76
	eor $63.b		; 45 63
	cop $B4.b		; 02 B4
	and $04BE.w		; 2D BE 04
	eor ($13.b),Y		; 51 13
	stp		; DB
	and [$FC.b],Y		; 37 FC
	bcs  70.b		; B0 46
	eor $2500EF.l		; 4F EF 00 25
	and $A4F1DF.l,X		; 3F DF F1 A4
	eor $F01FC0.l,X		; 5F C0 1F F0
	cpx #$25.b		; E0 25
	adc $CA.b,S		; 63 CA
	bcs  54.b		; B0 36
	.db $42, $33		; 42 33
	brk $0E.b		; 00 0E
	tsb $2D.b		; 04 2D
	sbc ($B4.b,S),Y		; F3 B4
	inc $041F.w,X		; FE 1F 04
	phd		; 0B
	ora $2E.b		; 05 2E
	jsl $55B0EF.l		; 22 EF B0 55
	jsr ($DFFE.w,X)		; FC FE DF
	inc $CDFF.w,X		; FE FF CD
	ora ($A4.b),Y		; 11 A4
	bit $2F.b		; 24 2F
	ora $0C35E1.l		; 0F E1 35 0C
	cpx #$25.b		; E0 25
	ldy $0C.b,X		; B4 0C
	sbc ($1C.b,S),Y		; F3 1C
	sbc ($0F.b)		; F2 0F
	ora ($FE.b)		; 12 FE
	jsl $63EFA4.l		; 22 A4 EF 63
	sbc $0CF0.w		; ED F0 0C
	sbc $2E.b,X		; F5 2E
	bpl -96.b		; 10 A0
	lsr $2A.b		; 46 2A
	pea $36D9.w		; F4 D9 36
	phx		; DA
	sbc ($17.b),Y		; F1 17
	ldy $51.b,X		; B4 51
	sbc $20E2FD.l		; EF FD E2 20
	inc $3FF2.w,X		; FE F2 3F
	ldy $F1.b		; A4 F1
	bit $FB.b,X		; 34 FB
.ACCU 8
	sep #$2D		; E2 2D
	bcs  79.b		; B0 4F
	sbc ($B4.b)		; F2 B4
	brk $21.b		; 00 21
	cop $0B.b		; 02 0B
	sbc ($0F.b,S),Y		; F3 0F
	eor $05A09F.l		; 4F 9F A0 05
	and ($1F.b)		; 32 1F
	sbc ($5F.b,S),Y		; F3 5F
	cmp $74.b,S		; C3 74
	and [$A4.b],Y		; 37 A4
	bit $6FE4.w		; 2C E4 6F
	bne -20.b		; D0 EC
	ora ($E2.b)		; 12 E2
	eor $01B0.w		; 4D B0 01
	bpl  16.b		; 10 10
	bit $2E.b		; 24 2E
	cpx #$01.b		; E0 01
	bpl -96.b		; 10 A0
	and [$66.b],Y		; 37 66
	adc $36.b,S		; 63 36
	eor ($31.b,S),Y		; 53 31
	ora ($EC.b,X)		; 01 EC
	sty $14.b,X		; 94 14
	mvn $52,$D0		; 54 D0 52
	cmp ($2C.b,S),Y		; D3 2C
	ora ($A0.b),Y		; 11 A0
	ldy #$46.b		; A0 46
	eor $E57FD5.l,X		; 5F D5 7F E5
	eor ($44.b)		; 52 44
	bpl -76.b		; 10 B4
	ora ($1F.b,X)		; 01 1F
	cop $2D.b		; 02 2D
	sbc ($FD.b)		; F2 FD
	bit $ED.b,X		; 34 ED
	ldy $01.b		; A4 01
.ACCU 8
.INDEX 8
	sep #$72		; E2 72
	plb		; AB
	and ($DD.b,S),Y		; 33 DD
	ora ($0D.b)		; 12 0D
	ldy $14.b		; A4 14
	eor $EF53D0.l		; 4F D0 53 EF
	ora $B4D110.l		; 0F 10 D1 B4
	and $EE31D0.l,X		; 3F D0 31 EE
	ora $3E.b		; 05 3E
	cmp ($0F.b,X)		; C1 0F
	ldy #$22.b		; A0 22
	brk $44.b		; 00 44
	cmp $1356.w,X		; DD 56 13
	adc ($E2.b,X)		; 61 E2
	ldy #$50.b		; A0 50
	sbc ($3F.b)		; F2 3F
	lda $CB33.w,X		; BD 33 CB
	and [$30.b],Y		; 37 30
	ldy $12.b		; A4 12
	ora $E30B24.l,X		; 1F 24 0B E3
	rol $33CE.w,X		; 3E CE 33
	ldy $FC.b		; A4 FC
	sbc $61.b,S		; E3 61
	dec $FE55.w		; CE 55 FE
	sbc $0BA445.l		; EF 45 A4 0B
	cmp ($3F.b)		; D2 3F
	sbc ($01.b)		; F2 01
	and $A04DC2.l		; 2F C2 4D A0
	and $4E.b		; 25 4E
	cmp $1FE0.w		; CD E0 1F
	ora $A072D2.l		; 0F D2 72 A0
	lda $0233.w,X		; BD 33 02
	mvn $00,$43		; 54 43 00
	lsr $2E.b,X		; 56 2E
	sty $44.b,X		; 94 44
	jsr $37F1.w		; 20 F1 37
	adc $2E90.w		; 6D 90 2E
	mvp $20,$A0		; 44 A0 20
	eor [$52.b]		; 47 52
	jsl $014234.l		; 22 34 42 01
	rol $A4.b,X		; 36 A4
	jsr ($FDF4.w,X)		; FC F4 FD
	sbc $0E4302.l,X		; FF 02 43 0E
	sbc ($A0.b),Y		; F1 A0
	eor $46.b,S		; 43 46
	eor ($01.b),Y		; 51 01
	ora ($32.b)		; 12 32
	xba		; EB
	dec $44A4.w		; CE A4 44
	sbc $0E26.w,X		; FD 26 0E
	sbc ($43.b,X)		; E1 43
	cmp $33A01F.l,X		; DF 1F A0 33
	and ($34.b,X)		; 21 34
	bit $51.b		; 24 51
	tsb $4F.b		; 04 4F
	sbc ($A0.b)		; F2 A0
	xba		; EB
	cop $FF.b		; 02 FF
	ora $31B0.w		; 0D B0 31
	sbc $21A014.l,X		; FF 14 A0 21
	mvp $3E,$34		; 44 34 3E
	asl $41.b,X		; 16 41
	ora $A4D4.w		; 0D D4 A4
	jmp $61C6.w		; 4C C6 61
	cpy $5403.w		; CC 03 54
	nop		; EA
	sbc ($C4.b,X)		; E1 C4
	ora $211101.l		; 0F 01 11 21
	cpx $23DF.w		; EC DF 23
	jsr $DFB4.w		; 20 B4 DF
	sbc $4F26.w,X		; FD 26 4F
	cpx #$FD.b		; E0 FD
	sbc $2BB415.l,X		; FF 15 B4 2B
	bcs  34.b		; B0 22
	mvn $EC,$EF		; 54 EF EC
	sbc ($30.b,S),Y		; F3 30
	ldy $F0.b,X		; B4 F0
	asl $40D1.w,X		; 1E D1 40
	trb $0A.b		; 14 0A
	lda ($33.b),Y		; B1 33
	bcs  86.b		; B0 56
	rti		; 40

	cmp $773511.l,X		; DF 11 35 77
	bvc -36.b		; 50 DC
	bcs -10.b		; B0 F6
	adc ($00.b)		; 72 00
	cmp $0F24.w,X		; DD 24 0F
	bit $2D.b		; 24 2D
	ldy $E4.b,X		; B4 E4
	eor ($01.b),Y		; 51 01
	xce		; FB
	cmp ($2E.b,S),Y		; D3 2E
	ora $21.b,S		; 03 21
	ldy $2E.b,X		; B4 2E
	lda $ED2133.l		; AF 33 21 ED
	ora $B413EF.l		; 0F EF 13 B4
	eor ($FE.b)		; 52 FE
	inc $3FF1.w		; EE F1 3F
	sbc ($2D.b,X)		; E1 2D
	sbc $B4.b		; E5 B4
	bvc  19.b		; 50 13
	plx		; FA
	pei ($0D.b)		; D4 0D
	sbc $63.b,S		; E3 63
	dex		; CA
	ldy $03.b,X		; B4 03
	sbc $14BB22.l,X		; FF 22 BB 14
	and ($D0.b),Y		; 31 D0
	rti		; 40

	cpy $D1.b		; C4 D1
	and ($F1.b,X)		; 21 F1
	trb $0FD2.w		; 1C D2 0F
	trb $0D.b		; 14 0D
	cpy #$03.b		; C0 03
	bmi -17.b		; 30 EF
	ora ($20.b,S),Y		; 13 20
	bit $2F.b		; 24 2F
	sbc ($B4.b)		; F2 B4
	and $46EC02.l		; 2F 02 EC 46
	sbc #$05.b		; E9 05
	plx		; FA
	asl $B4.b,X		; 16 B4
	tas		; 1B
	inc $1C.b		; E6 1C
	ora $0E.b		; 05 0E
	sbc ($12.b),Y		; F1 12
	asl $BAA4.w,X		; 1E A4 BA
	bne  48.b		; D0 30
	dec $4123.w,X		; DE 23 41
	cmp $00B445.l,X		; DF 45 B4 00
	rol $5BB4.w		; 2E B4 5B
	ldx #$2D.b		; A2 2D
	ora $1F.b		; 05 1F
	ldy $35.b,X		; B4 35
	ora $63BF.w		; 0D BF 63
	cmp $BD32.w,X		; DD 32 BD
	eor ($C4.b)		; 52 C4
	sbc $0F1111.l		; EF 11 11 0F
	and ($FF.b,X)		; 21 FF
	cpx $C015.w		; EC 15 C0
	and $0111DE.l		; 2F DE 11 01
	.db $42, $DC		; 42 DC
	ora $0D.b,S		; 03 0D
	ldy $45.b,X		; B4 45
	cpx $0022.w		; EC 22 00
	.db $42, $ED		; 42 ED
	and $1B.b,X		; 35 1B
	bcs  37.b		; B0 25
	bvc -34.b		; 50 DE
	and ($DD.b)		; 32 DD
	and $EC.b,S		; 23 EC
	ora $B4.b		; 05 B4
	ora $5EC042.l		; 0F 42 C0 5E
	ldx #$3E.b		; A2 3E
	cmp $B403.w,X		; DD 03 B4
	cpx $CB47.w		; EC 47 CB
	eor ($CF.b)		; 52 CF
	and $B01E01.l,X		; 3F 01 1E B0
	lda $21F3.w,Y		; B9 F3 21
	asl $1047.w		; 0E 47 10
	ror $E0.b,X		; 76 E0
	ldy $4C.b,X		; B4 4C
.ACCU 8
	sep #$E2		; E2 E2
	ror $0BC4.w		; 6E C4 0B
	lsr $EA.b,X		; 56 EA
	bcs  39.b		; B0 27
	adc ($14.b)		; 72 14
	and $0936F0.l		; 2F F0 36 09
	sbc [$B0.b]		; E7 B0
	rts		; 60

	ora $2C.b,X		; 15 2C
	lda ($30.b),Y		; B1 30
	and $1C.b		; 25 1C
	inc $E1C0.w		; EE C0 E1
	and ($02.b),Y		; 31 02
	ora $1D26.w		; 0D 26 1D
	asl $3F.b,X		; 16 3F
	ldy $44.b,X		; B4 44
	cmp $B9351F.l,X		; DF 1F 35 B9
	rol $F0.b,X		; 36 F0
	eor ($C0.b),Y		; 51 C0
	jsl $520221.l		; 22 21 02 52
	sbc ($2F.b),Y		; F1 2F
.ACCU 8
	sep #$2C		; E2 2C
	cpy $05.b		; C4 05
	tsb $FF12.w		; 0C 12 FF
	bmi -14.b		; 30 F2
	ora $B402.w,X		; 1D 02 B4
	nop		; EA
	jsl $F22CF3.l		; 22 F3 2C F2
	beq  32.b		; F0 20
	ora ($B4.b,S),Y		; 13 B4
	sbc $2CE4.w,Y		; F9 E4 2C
	ora $0D.b		; 05 0D
	ora ($1F.b,S),Y		; 13 1F
	ora ($C4.b,S),Y		; 13 C4
	bpl   0.b		; 10 00
	inc $AE32.w,X		; FE 32 AE
	eor ($C1.b,X)		; 41 C1
	rol $02C4.w,X		; 3E C4 02
	dec $EC45.w,X		; DE 45 EC
	trb $FC.b		; 14 FC
	ora ($FE.b,S),Y		; 13 FE
	bcs -20.b		; B0 EC
	cmp $EE02DA.l		; CF DA 02 EE
	and ($FE.b,X)		; 21 FE
	ora $B4.b,S		; 03 B4
	sbc $FE03.w,X		; FD 03 FE
	sbc ($54.b,X)		; E1 54
	cpx #$4E.b		; E0 4E
	rep #$C0		; C2 C0
	and ($46.b,X)		; 21 46
	and $0E02EF.l,X		; 3F EF 02 0E
	bit $1F.b		; 24 1F
	cpy $20.b		; C4 20
	bne  67.b		; D0 43
	sbc ($1C.b,X)		; E1 1C
	cmp $0B.b,X		; D5 0B
	asl $B4.b,X		; 16 B4
	tyx		; BB
	rts		; 60

	sta ($7F.b)		; 92 7F
	cpy #$1F.b		; C0 1F
	sbc ($1C.b),Y		; F1 1C
	ldy $E5.b,X		; B4 E5
	and $31CE22.l,X		; 3F 22 CE 31
	cop $EE.b		; 02 EE
	mvp $40,$B0		; 44 B0 40
	eor [$31.b]		; 47 31
	eor [$1B.b],Y		; 57 1B
	ora $20.b		; 05 20
	ora ($B0.b),Y		; 11 B0
	dec $F331.w,X		; DE 31 F3
	adc $00.b,S		; 63 00
	and [$6D.b]		; 27 6D
	cpx $B0.b		; E4 B0
	sbc $AD43.w,X		; FD 43 AD
	and $CF009C.l,X		; 3F 9C 00 CF
	eor $B4.b,S		; 43 B4
	cmp ($2F.b,X)		; C1 2F
	jsl $55ED01.l		; 22 01 ED 55
	stz $C462.w		; 9C 62 C4
	cmp ($4F.b,X)		; C1 4F
	sbc $C02001.l		; EF 01 20 C0
	eor ($DE.b)		; 52 DE
	ldy $61.b,X		; B4 61
	ldy #$4D.b		; A0 4D
	sbc ($CC.b,S),Y		; F3 CC
	adc ($92.b)		; 72 92
	tsa		; 3B
	bcs -27.b		; B0 E5
	tsb $E034.w		; 0C 34 E0
	and ($F0.b),Y		; 31 F0
	bit $43.b		; 24 43
	ldy $DE.b		; A4 DE
	sbc [$39.b],Y		; F7 39
	inc $0E.b,X		; F6 0E
	jsl $B0DA13.l		; 22 13 DA B0
	ora ($35.b)		; 12 35
	stz $33.b		; 64 33
	ora $2F76E2.l,X		; 1F E2 76 2F
	cpy $F2.b		; C4 F2
	and $4ED3.w,X		; 3D D3 4E
	sbc $1B.b,S		; E3 1B
	sbc $20.b,S		; E3 20
	bcs  13.b		; B0 0D
.ACCU 8
	sep #$21		; E2 21
	eor $33.b		; 45 33
	eor $20.b,X		; 55 20
	and $B0.b,S		; 23 B0
	and [$7F.b]		; 27 7F
	asl $1F.b,X		; 16 1F
	eor ($E0.b,S),Y		; 53 E0
	ora $C016.w,X		; 1D 16 C0
	brk $30.b		; 00 30
	cpy #$2E.b		; C0 2E
	bne  13.b		; D0 0D
	sbc ($FD.b,X)		; E1 FD
	cpy #$15.b		; C0 15
	and $251012.l,X		; 3F 12 10 25
	rti		; 40

	sbc ($32.b),Y		; F1 32
	ldy $1F.b,X		; B4 1F
	cpy #$51.b		; C0 51
	sbc $0A.b,X		; F5 0A
	sbc ($12.b,X)		; E1 12
	tas		; 1B
	ldy $D5.b,X		; B4 D5
	rol A		; 2A
	inc $2D.b		; E6 2D
	mvn $F2,$EA		; 54 EA F2
	asl $22B4.w		; 0E B4 22
	dec $F40E.w,X		; DE 0E F4
	and $2DEE45.l		; 2F 45 EE 2D
	bcs   4.b		; B0 04
	.db $62, $01, $10		; 62 01 10
	sbc $10F2.w,X		; FD F2 10
	and $B4.b		; 25 B4
	asl $63C0.w		; 0E C0 63
	sbc $F3EFFD.l		; EF FD EF F3
	eor ($B4.b,X)		; 41 B4
	sbc $042E14.l		; EF 14 2E 04
	trb $2FD2.w		; 1C D2 2F
	sbc ($B4.b)		; F2 B4
	inc $0110.w		; EE 10 01
	bpl -16.b		; 10 F0
	trb $1B.b		; 14 1B
	pei ($B4.b)		; D4 B4
	ora $EE15.w,Y		; 19 15 EE
	stz $EE.b		; 64 EE
	and ($E1.b,X)		; 21 E1
	and ($B0.b)		; 32 B0
	bvc -47.b		; 50 D1
	.db $62, $9B, $0D		; 62 9B 0D
	ldx #$6E.b		; A2 6E
	ldy #$C0.b		; A0 C0
	and ($11.b,X)		; 21 11
	bit $2E.b		; 24 2E
	sbc ($1E.b)		; F2 1E
	cpx #$FE.b		; E0 FE
	cpy #$F1.b		; C0 F1
	jsr $42CF.w		; 20 CF 42
.ACCU 8
	sep #$63		; E2 63
	sbc ($53.b,X)		; E1 53
	cpy $D2.b		; C4 D2
	lsr $40C1.w		; 4E C1 40
	sbc ($1F.b,X)		; E1 1F
	beq -16.b		; F0 F0
	cpy #$FF.b		; C0 FF
	sbc $EBDF.w		; ED DF EB
	cpy #$0E.b		; C0 0E
	sbc ($21.b),Y		; F1 21
	cpy $DE.b		; C4 DE
	eor $CB.b		; 45 CB
	mvp $22,$EE		; 44 EE 22
	cpx #$10.b		; E0 10
	bcs  69.b		; B0 45
	and $C64A27.l,X		; 3F 27 4A C6
	jmp $C45FE7.l		; 5C E7 5F C4
	ora ($01.b,X)		; 01 01
	asl $0D04.w,X		; 1E 04 0D
	trb $1C.b		; 14 1C
	sbc ($B0.b,S),Y		; F3 B0
	adc $75C3.w		; 6D C3 75
	ora ($23.b,X)		; 01 23
	and ($0F.b)		; 32 0F
	rol $B4.b		; 26 B4
	tsb $1CF4.w		; 0C F4 1C
	ora ($FF.b,X)		; 01 FF
	jmp.w [$EE36]		; DC 36 EE
	ldy $1E.b		; A4 1E
	sbc $3F.b,X		; F5 3F
	jsl $F065ED.l		; 22 ED 65 F0
	tas		; 1B
	cpy $00.b		; C4 00
	ora ($3E.b,X)		; 01 3E
	rep #$4F		; C2 4F
	cpx #$20.b		; E0 20
	cmp $0E21C4.l,X		; DF C4 21 0E
	cpx #$20.b		; E0 20
	ora $0C.b,S		; 03 0C
	ora $2E.b		; 05 2E
	ldy $D5.b,X		; B4 D5
	bit $1EC1.w,X		; 3C C1 1E
	cpx #$44.b		; E0 44
	cpx $B015.w		; EC 15 B0
	bvs -43.b		; 70 D5
	jmp ($119F.w,X)		; 7C 9F 11
	eor $EC.b,X		; 55 EC
	ora ($B4.b),Y		; 11 B4
	ldx $0B47.w,Y		; BE 47 0B
	ora $DD.b,S		; 03 DD
	.db $42, $DE		; 42 DE
	asl $E4B0.w,X		; 1E B0 E4
	eor $7424E2.l,X		; 5F E2 24 74
	cpx #$77.b		; E0 77
	and ($B4.b,X)		; 21 B4
	jsr $D00E.w		; 20 0E D0
	and $C55BD5.l		; 2F D5 5B C5
	ror $E0C4.w		; 6E C4 E0
	eor $EC.b,S		; 43 EC
	pea $D03E.w		; F4 3E D0
	and ($E3.b),Y		; 31 E3
	cpy $3D.b		; C4 3D
	sbc ($00.b,X)		; E1 00
	ora $3EC2.w,X		; 1D C2 3E
	lda ($5D.b,S),Y		; B3 5D
	cpy #$C1.b		; C0 C1
	ror $10.b,X		; 76 10
	bit $31.b,X		; 34 31
	cop $42.b		; 02 42
	sbc $1121B4.l,X		; FF B4 21 11
	asl $DC21.w		; 0E 21 DC
	ora [$3B.b]		; 07 3B
	cmp ($C0.b)		; D2 C0
	jsr ($CBCD.w,X)		; FC CD CB
	cmp $00F0.w		; CD F0 00
	inc $C425.w,X		; FE 25 C4
	cmp $3DE22F.l,X		; DF 2F E2 3D
	cpy $4D.b		; C4 4D
	cpx $2C.b		; E4 2C
	cpy $13.b		; C4 13
	tsb $FD15.w		; 0C 15 FD
	brk $FF.b		; 00 FF
	sbc ($4F.b),Y		; F1 4F
	cpy #$DD.b		; C0 DD
	ora ($11.b)		; 12 11
	and ($0F.b,S),Y		; 33 0F
	ora $41.b,S		; 03 41
	cmp $4FC4.w,X		; DD C4 4F
	lda ($60.b),Y		; B1 60
	ldy #$61.b		; A0 61
	dec $F12F.w		; CE 2F F1
	cpy #$00.b		; C0 00
	brk $0F.b		; 00 0F
	jmp.w [$2114]		; DC 14 21
	eor [$53.b],Y		; 57 53
	cpy $02.b		; C4 02
	rol $10E1.w		; 2E E1 10
	sbc $4DF6.w,X		; FD F6 4D
	cmp ($C0.b),Y		; D1 C0
	and ($11.b)		; 32 11
	and ($EE.b,X)		; 21 EE
	inc $FBF1.w		; EE F1 FB
	sta $0CC0.w,X		; 9D C0 0C
	sta $30D140.l,X		; 9F 40 D1 30
	brk $13.b		; 00 13
	tsb $14C0.w		; 0C C0 14
	brk $42.b		; 00 42
	cop $22.b		; 02 22
	and ($F0.b)		; 32 F0
	ora ($C4.b),Y		; 11 C4
	ora $2EF102.l		; 0F 02 F1 2E
	pei ($5F.b)		; D4 5F
	sbc $51C4D2.l		; EF D2 C4 51
	sbc $23EE00.l		; EF 00 EE 23
	dec $E131.w		; CE 31 E1
	bcs  65.b		; B0 41
	trb $34.b		; 14 34
	ora $EA9F.w,Y		; 19 9F EA
	cpy #$21.b		; C0 21
	cpy #$F0.b		; C0 F0
	and ($33.b,S),Y		; 33 33
	bit $62.b		; 24 62
	cmp $2E01.w,X		; DD 01 2E
	cpy #$CF.b		; C0 CF
	asl $F0E0.w,X		; 1E E0 F0
	and ($13.b)		; 32 13
	and $3FC004.l,X		; 3F 04 C0 3F
	cpx #$1F.b		; E0 1F
	sbc ($51.b,S),Y		; F3 51
	sbc ($34.b,X)		; E1 34
	and ($B0.b),Y		; 31 B0
	tsb $09.b		; 04 09
	sbc [$2D.b],Y		; F7 2D
	and $1D.b		; 25 1D
	asl $75.b		; 06 75
	cpy #$23.b		; C0 23
	and $F44F04.l		; 2F 04 4F F4
	and $40F5.w		; 2D F5 40
	cpy $22.b		; C4 22
	brk $1F.b		; 00 1F
	sbc ($3C.b,S),Y		; F3 3C
.ACCU 16
	rep #$2B		; C2 2B
	ora $B4.b,S		; 03 B4
	asl $061E.w		; 0E 1E 06
	ora $E11F.w		; 0D 1F E1
	jsr ($C4F2.w,X)		; FC F2 C4
	bmi -50.b		; 30 CE
	jsl $220011.l		; 22 11 00 22
	dec $C012.w,X		; DE 12 C0
	and ($01.b,X)		; 21 01
	bmi -48.b		; 30 D0
	rti		; 40

	cpy #$41.b		; C0 41
	sbc ($B4.b),Y		; F1 B4
	cpx #$52.b		; E0 52
	ldy $9040.w		; AC 40 90
	ror $FBE6.w		; 6E E6 FB
	ldy $24.b,X		; B4 24
	bit $FE.b		; 24 FE
	ora $59D6.w		; 0D D6 59
	pei ($E9.b)		; D4 E9
	cpy #$E4.b		; C0 E4
	adc ($F3.b,X)		; 61 F3
	eor $2561E5.l,X		; 5F E5 61 25
	and ($B4.b),Y		; 31 B4
	sbc $EA0134.l,X		; FF 34 01 EA
	sbc $441BF5.l		; EF F5 1B 44
	ldy $9E.b,X		; B4 9E
	bvs -31.b		; 70 E1
	tsx		; BA
	eor $FF.b		; 45 FF
	ora ($0A.b,S),Y		; 13 0A
	cpy $02.b		; C4 02
	inc $DF53.w,X		; FE 53 DF
	bpl   1.b		; 10 01
	ora $35C0FF.l,X		; 1F FF C0 35
	and $522412.l		; 2F 12 24 52
	and [$63.b],Y		; 37 63
	eor $B0.b		; 45 B0
	ror $FD.b,X		; 76 FD
	eor [$EE.b],Y		; 57 EE
	and ($57.b,S),Y		; 33 57
	and $72B037.l,X		; 3F 37 B0 72
	inc $9A1F.w		; EE 1F 9A
	trb $FC.b		; 14 FC
	ora $EE.b,S		; 03 EE
	bcs 103.b		; B0 67
	jsr $5256.w		; 20 56 52
	sbc $329C3F.l,X		; FF 3F 9C 32
	ldy $E2.b,X		; B4 E2
	rol $6DD4.w,X		; 3E D4 6D
	lda ($4D.b)		; B2 4D
	sbc $FD.b,S		; E3 FD
	ldy $33.b		; A4 33
	stz $CF73.w,X		; 9E 73 CF
	trb $4D.b		; 14 4D
	sta $B025.w,X		; 9D 25 B0
	and $CD1FBD.l,X		; 3F BD 1F CD
	and $42.b		; 25 42
	ora ($35.b,X)		; 01 35
	ldy $0C.b,X		; B4 0C
	cpx #$0D.b		; E0 0D
	cmp $52EF23.l		; CF 23 EF 52
	ldy #$B0.b		; A0 B0
	lsr $0F.b,X		; 56 0F
	and ($25.b)		; 32 25
	stz $45.b		; 64 45
	mvp $B4,$32		; 44 32 B4
	and $1E.b,X		; 35 1E
	dec $FD32.w,X		; DE 32 FD
	sbc ($DE.b),Y		; F1 DE
	bit $B0.b		; 24 B0
	bmi  37.b		; 30 25
	.db $42, $47		; 42 47
	adc [$64.b],Y		; 77 64
	xba		; EB
	sbc ($B4.b,X)		; E1 B4
	sbc $13F0.w,X		; FD F0 13
	and ($0E.b)		; 32 0E
	sbc ($0C.b)		; F2 0C
	sbc $B4.b,S		; E3 B4
	ora $1EE2.w,X		; 1D E2 1E
	ora $43.b,S		; 03 43
	cpx #$22.b		; E0 22
	jsr ($11B0.w,X)		; FC B0 11
	bpl  15.b		; 10 0F
	sbc $EF9B0C.l		; EF 0C 9B EF
	sbc ($A4.b)		; F2 A4
	adc ($10.b,S),Y		; 73 10
	trb $2D.b		; 14 2D
	brk $E2.b		; 00 E2
	adc $1FB4B1.l		; 6F B1 B4 1F
	sbc ($31.b,X)		; E1 31
	sbc $14DB31.l		; EF 31 DB 14
	rol $C5A4.w		; 2E A4 C5
	eor $1EE2.w		; 4D E2 1E
	bit $1F.b		; 24 1F
	brk $BB.b		; 00 BB
	ldy $C0.b		; A4 C0
	ora $B00CB0.l,X		; 1F B0 0C B0
	eor $13.b,S		; 43 13
	and ($94.b),Y		; 31 94
	and $1D.b,S		; 23 1D
	lda $649FD9.l,X		; BF D9 9F 64
	ora $10.b,S		; 03 10
	ldy $21.b,X		; B4 21
	ora ($1E.b,S),Y		; 13 1E
	ora ($FD.b,S),Y		; 13 FD
	inc $6FF4.w,X		; FE F4 6F
	ldy $AF.b,X		; B4 AF
	jsl $CD22E0.l		; 22 E0 22 CD
	ora ($12.b),Y		; 11 12
	and $21BDA4.l		; 2F A4 BD 21
	cmp $E022.w		; CD 22 E0
	and ($53.b),Y		; 31 53
	cmp ($B0.b)		; D2 B0
	eor ($DC.b,S),Y		; 53 DC
	cop $10.b		; 02 10
	and ($10.b,S),Y		; 33 10
	sbc $D0B424.l,X		; FF 24 B4 D0
	rti		; 40

	bne  17.b		; D0 11
	ora $51B2.w,X		; 1D B2 51
	beq -92.b		; F0 A4
	bpl   0.b		; 10 00
	beq  69.b		; F0 45
	cpx $CF22.w		; EC 22 CF
	trb $E3A4.w		; 1C A4 E3
	ora $F126.w		; 0D 26 F1
	adc ($AF.b),Y		; 71 AF
	eor $40A4F1.l		; 4F F1 A4 40
	sbc $241E11.l		; EF 11 1E 24
	xce		; FB
	eor [$10.b]		; 47 10
	bcs  99.b		; B0 63
	rol $53.b,X		; 36 53
	and ($FF.b)		; 32 FF
	ora ($24.b)		; 12 24
	rol $E5A4.w		; 2E A4 E5
	eor ($EC.b)		; 52 EC
	ora $1D.b,X		; 15 1D
	ora ($EC.b,S),Y		; 13 EC
	sbc $1DD394.l,X		; FF 94 D3 1D
	ora [$2A.b],Y		; 17 2A
	ldy $5C.b,X		; B4 5C
	sty $5C.b,X		; 94 5C
	sty $C6.b,X		; 94 C6
	eor $11AC.w		; 4D AC 11
	sbc $32DF.w		; ED DF 32
	dec $CDA0.w		; CE A0 CD
	dec $4047.w		; CE 47 40
	cop $56.b		; 02 56
	.db $42, $22		; 42 22
	ldy $24.b		; A4 24
	eor ($EF.b),Y		; 51 EF
	jsl $22F1EC.l		; 22 EC F1 22
	jmp.w [$2494]		; DC 94 24
	cmp $E442.w		; CD 42 E4
	adc ($03.b)		; 72 03
	asl $94FF.w		; 0E FF 94
	dex		; CA
	sbc $252E03.l		; EF 03 2E 25
	pld		; 2B
	ldx $9422.w		; AE 22 94
	cmp $42DF64.l		; CF 64 DF 42
	and ($FF.b,X)		; 21 FF
	rol $3D.b,X		; 36 3D
	ldy $15.b		; A4 15
	and $FDE2.w		; 2D E2 FD
	ora $0D.b,S		; 03 0D
	tsb $0C.b		; 04 0C
	sty $16.b,X		; 94 16
	asl $2123.w,X		; 1E 23 21
	sbc $F10F11.l,X		; FF 11 0F F1
	sty $0F.b,X		; 94 0F
	beq  15.b		; F0 0F
	inc $4104.w		; EE 04 41
	ora ($0F.b,S),Y		; 13 0F
	sty $02.b,X		; 94 02
	nop		; EA
	cmp ($41.b,S),Y		; D3 41
	rol $4E.b,X		; 36 4E
	cmp ($41.b)		; D2 41
	sty $33.b,X		; 94 33
	stp		; DB
	cmp ($24.b,S),Y		; D3 24
	and ($11.b),Y		; 31 11
	ora ($21.b),Y		; 11 21
	sty $EE.b,X		; 94 EE
	ora ($DB.b)		; 12 DB
	cpx #$02.b		; E0 02
	asl $12CF.w,X		; 1E CF 12
	ldy #$01.b		; A0 01
	and ($10.b,S),Y		; 33 10
	ora ($DA.b),Y		; 11 DA
	cmp $99DB.w		; CD DB 99
	sty $20.b,X		; 94 20
	inc $0C35.w,X		; FE 35 0C
	sbc ($0F.b)		; F2 0F
	ora ($22.b,X)		; 01 22
	sty $FE.b,X		; 94 FE
	ora $51.b,X		; 15 51
	cpx #$44.b		; E0 44
	and ($1F.b,S),Y		; 33 1F
	ora ($94.b,S),Y		; 13 94
	sbc $DC22.w		; ED 22 DC
	cop $00.b		; 02 00
	and ($21.b,X)		; 21 21
	jsl $4344B0.l		; 22 B0 44 43
	and $55.b,S		; 23 55
	and ($23.b)		; 32 23
	and ($11.b),Y		; 31 11
	sty $2E.b		; 84 2E
	mvp $13,$FB		; 44 FB 13
	tax		; AA
	eor $EC.b		; 45 EC
	ldy $FE94.w		; AC 94 FE
	cmp ($52.b),Y		; D1 52
	cmp $FA55.w		; CD 55 FA
	bcs  47.b		; B0 2F
	ldy $FF.b		; A4 FF
	trb $2F.b		; 14 2F
	sbc $41.b,S		; E3 41
	cpx #$22.b		; E0 22
	and ($94.b,S),Y		; 33 94
	asl A		; 0A
	cpx $32.b		; E4 32
	ora ($F2.b)		; 12 F2
	eor ($23.b,X)		; 41 23
	ora ($94.b,X)		; 01 94
	lsr $22.b,X		; 56 22
	bmi -67.b		; 30 BD
	ora ($0E.b,X)		; 01 0E
	cmp $008411.l,X		; DF 11 84 00
	sbc $1EE0.w		; ED E0 1E
	txs		; 9A
	ora $A9A9.w		; 0D A9 A9
	sty $02.b,X		; 94 02
	ora ($0F.b,X)		; 01 0F
	inc $1FE1.w		; EE E1 1F
	tsb $73.b		; 04 73
	sty $EF.b,X		; 94 EF
	eor ($04.b)		; 52 04
	.db $42, $0F		; 42 0F
	sep #$40		; E2 40
	cmp ($94.b,X)		; C1 94
	.db $42, $00		; 42 00
	ora ($ED.b)		; 12 ED
	dec $FF11.w		; CE 11 FF
	bit $84.b		; 24 84
	phk		; 4B
	sta $BD2D.w,X		; 9D 2D BD
	and ($01.b,X)		; 21 01
	bit $30.b,X		; 34 30
	sty $F0.b,X		; 94 F0
	brk $23.b		; 00 23
	ora ($10.b,X)		; 01 10
	rol $40.b,X		; 36 40
	sbc $DD0084.l,X		; FF 84 00 DD
	inc $EAF2.w		; EE F2 EA
	sbc $65.b,X		; F5 65
	eor $02EF94.l,X		; 5F 94 EF 02
	bpl  70.b		; 10 46
	asl $1F14.w,X		; 1E 14 1F
	cop $94.b		; 02 94
	ora $001003.l		; 0F 03 10 00
	jsl $00DFEB.l		; 22 EB DF 00
	sty $CD.b		; 84 CD
	dec $CCF0.w,X		; DE F0 CC
	trb $56.b		; 14 56
	asl $94FF.w,X		; 1E FF 94
	sbc ($2E.b)		; F2 2E
	cmp ($22.b)		; D2 22
	trb $41.b		; 14 41
	bne  34.b		; D0 22
	sty $0F.b,X		; 94 0F
	and $10.b,S		; 23 10
	jsl $DE2132.l		; 22 32 21 DE
	bit $94.b		; 24 94
	ora $111E32.l		; 0F 32 1E 11
	asl $2EF1.w		; 0E F1 2E
	cpy #$94.b		; C0 94
	eor ($EF.b,S),Y		; 53 EF
	asl $23D0.w		; 0E D0 23
	brk $10.b		; 00 10
	sbc ($84.b),Y		; F1 84
	asl $0166.w		; 0E 66 01
	eor ($F0.b),Y		; 51 F0
	asl $57F0.w		; 0E F0 57
	sty $30.b		; 84 30
	adc $CA.b,X		; 75 CA
	ora ($A9.b),Y		; 11 A9
	sbc $842FCD.l		; EF CD 2F 84
	ldx $1011.w,Y		; BE 11 10
	ora $0AD22F.l		; 0F 2F D2 0A
	sta $FD5484.l,X		; 9F 84 54 FD
	sbc ($02.b),Y		; F1 02
	bit $3D.b		; 24 3D
	lda $50.b,X		; B5 50
	bcs  18.b		; B0 12
	and ($11.b,X)		; 21 11
	ora ($22.b),Y		; 11 22
	jsl $844434.l		; 22 34 44 84
	cop $11.b		; 02 11
	jsl $37CB75.l		; 22 75 CB 37
	bit $84D1.w,X		; 3C D1 84
	rol $65F5.w		; 2E F5 65
	and $1F9E.w,X		; 3D 9E 1F
	trb $20.b		; 14 20
	sty $23.b,X		; 94 23
	cpx $2EE2.w		; EC E2 2E
	sbc $F162D2.l		; EF D2 62 F1
	sty $3F.b,X		; 94 3F
	cmp $11D020.l,X		; DF 20 D0 11
	bpl   3.b		; 10 03
	.db $42, $94		; 42 94
	inc $03EE.w,X		; FE EE 03
	and ($EC.b)		; 32 EC
	lda $94EC31.l,X		; BF 31 EC 94
	sbc ($42.b,S),Y		; F3 42
	brk $34.b		; 00 34
	ora $32F133.l		; 0F 33 F1 32
	sty $EE.b,X		; 94 EE
	ora ($F3.b,X)		; 01 F3
	rti		; 40

	sbc $52.b,S		; E3 52
	cpx #$31.b		; E0 31
	sty $02.b		; 84 02
	ora ($53.b)		; 12 53
	bpl -21.b		; 10 EB
	sbc ($3F.b)		; F2 3F
	ldx $4584.w,Y		; BE 84 45
	asl $DFAA.w,X		; 1E AA DF
	ora $0D23BA.l		; 0F BA 23 0D
	sty $22.b,X		; 94 22
	ora ($1D.b),Y		; 11 1D
	cmp $10EF0F.l		; CF 0F EF 10
	sbc $0094.w,X		; FD 94 00
	inc $EE34.w		; EE 34 EE
	and ($EE.b,X)		; 21 EE
	ora $6194F5.l,X		; 1F F5 94 61
	tsb $1E.b		; 04 1E
	trb $22.b		; 14 22
	and ($21.b,S),Y		; 33 21
	brk $94.b		; 00 94
	ora ($33.b)		; 12 33
	beq  54.b		; F0 36
	and $F1FF01.l,X		; 3F 01 FF F1
	sty $10.b		; 84 10
	bpl -38.b		; 10 DA
	cpy $AEFC.w		; CC FC AE
	asl $9421.w		; 0E 21 94
	inc $050F.w		; EE 0F 05
	tas		; 1B
	cmp ($FD.b)		; D2 FD
	ora $0F.b,S		; 03 0F
	sty $E0.b,X		; 94 E0
	jsl $105405.l		; 22 05 54 10
	ora ($00.b),Y		; 11 00
	ora ($84.b,X)		; 01 84
	jsl $415611.l		; 22 11 56 41
	rol $2B.b		; 26 2B
	pei ($54.b)		; D4 54
	sty $60.b		; 84 60
	bcs  79.b		; B0 4F
	sbc $31.b,S		; E3 31
	pld		; 2B
	lda ($1B.b,X)		; A1 1B
	sty $F1.b		; 84 F1
	dec $E042.w		; CE 42 E0
	ora ($62.b,S),Y		; 13 62
	cmp ($4B.b)		; D2 4B
	sty $B4.b		; 84 B4
	eor $11F0.w		; 4D F0 11
	jsl $40D1FD.l		; 22 FD D1 40
	sty $E1.b		; 84 E1
	eor $00.b,X		; 55 00
	mvn $23,$CA		; 54 CA 23
	lda #$8405.w		; A9 05 84
	asl A		; 0A
	sbc $0F.b,X		; F5 0F
	ora $00EFAA.l		; 0F AA EF 00
	ora ($94.b,S),Y		; 13 94
	ora ($35.b),Y		; 11 35
	bmi  16.b		; 30 10
	sbc ($43.b,X)		; E1 43
	ora ($20.b),Y		; 11 20
	sty $E2.b,X		; 94 E2
	rol $33E0.w		; 2E E0 33
	jsr $4013.w		; 20 13 40
	cmp $DC2294.l,X		; DF 94 22 DC
	sbc ($FE.b,S),Y		; F3 FE
	bne  32.b		; D0 20
	sbc $EDA00F.l,X		; FF 0F A0 ED
	jmp.w [$EDCE]		; DC CE ED
	dec $0101.w,X		; DE 01 01
	and ($94.b,S),Y		; 33 94
	sbc ($31.b)		; F2 31
	and $21.b		; 25 21
	and $1F.b,S		; 23 1F
	cmp $AA8400.l,X		; DF 00 84 AA
	and [$50.b]		; 27 50
	beq -18.b		; F0 EE
	and ($EC.b)		; 32 EC
	ora ($84.b),Y		; 11 84
	lda $03F0.w,X		; BD F0 03
	eor ($04.b,S),Y		; 53 04
	ror $22.b,X		; 76 22
	ror $84.b,X		; 76 84
	asl $1103.w,X		; 1E 03 11
	ora $F24301.l		; 0F 01 43 F2
	and $E1CD84.l		; 2F 84 CD E1
	and $B03DC2.l,X		; 3F C2 3D B0
	bpl   1.b		; 10 01
	sty $ED.b		; 84 ED
	cmp $60D4EA.l,X		; DF EA D4 60
	ora $62.b,S		; 03 62
	and ($84.b,X)		; 21 84
	jsl $340001.l		; 22 01 00 34
	asl $3003.w,X		; 1E 03 30
.INDEX 8
	sep #$94		; E2 94
	eor $11.b,S		; 43 11
	ora ($21.b),Y		; 11 21
	sbc ($00.b),Y		; F1 00
	sbc ($10.b),Y		; F1 10
	sty $E0.b		; 84 E0
	jsr ($FDE1.w,X)		; FC E1 FD
	bne  52.b		; D0 34
	and ($E9.b)		; 32 E9
	sty $E1.b,X		; 94 E1
	xce		; FB
	cmp ($20.b)		; D2 20
	sbc $24FE12.l,X		; FF 12 FE 24
	sty $10.b,X		; 94 10
	ora ($00.b),Y		; 11 00
	cpx #$22.b		; E0 22
	sbc $943413.l,X		; FF 13 34 94
	eor ($FF.b,X)		; 41 FF
	ora ($21.b)		; 12 21
	inc $0012.w		; EE 12 00
	and ($84.b)		; 32 84
	cpy $FC13.w		; CC 13 FC
	jsl $FD44CE.l		; 22 CE 44 FD
	and $74.b,S		; 23 74
	mvn $E2,$32		; 54 32 E2
	mvn $20,$E2		; 54 E2 20
	ora [$76.b]		; 07 76
	sty $02.b		; 84 02
	and ($EF.b,X)		; 21 EF
	inc $3F36.w		; EE 36 3F
	jsl $CF8430.l		; 22 30 84 CF
	ora $0E01FE.l		; 0F FE 01 0E
	rol $31.b		; 26 31
	and $36CF84.l		; 2F 84 CF 36
	bmi -32.b		; 30 E0
	ora ($00.b)		; 12 00
	ora ($21.b,X)		; 01 21
	sty $13.b		; 84 13
	ora ($2D.b),Y		; 11 2D
	bcs  83.b		; B0 53
	and $11.b,S		; 23 11
	and $F1CE84.l		; 2F 84 CE F1
	inc $3403.w,X		; FE 03 34
	tas		; 1B
	rep #$40		; C2 40
	sty $FF.b		; 84 FF
	and ($00.b)		; 32 00
	and ($15.b,X)		; 21 15
	lsr $CD9C.w,X		; 5E 9C CD
	bra -68.b		; 80 BC
	lda $369D.w,Y		; B9 9D 36
	bmi -16.b		; 30 F0
	eor $22.b		; 45 22
	sty $77.b		; 84 77
	and $3037.w		; 2D 37 30
	lsr $1C.b		; 46 1C
	ora $32.b,X		; 15 32
	sty $56.b		; 84 56
	jsl $21F011.l		; 22 11 F0 21
	sbc $844157.l		; EF 57 41 84
	and ($EA.b,X)		; 21 EA
	cmp $1D01.w,X		; DD 01 1D
	dec $FF00.w		; CE 00 FF
	sty $F0.b,X		; 94 F0
	ora $C02EF1.l		; 0F F1 2E C0
	eor ($FF.b)		; 52 FF
	jsl $D01E90.l		; 22 90 1E D0
	jsr $47E0.w		; 20 E0 47
	adc [$53.b],Y		; 77 53
	eor [$84.b],Y		; 57 84
	eor $66.b,S		; 43 66
	trb $2F.b		; 14 2F
	cpx #$44.b		; E0 44
	eor ($D9.b)		; 52 D9
	ldy #$44.b		; A0 44
	mvn $44,$43		; 54 43 44
	eor $34.b,S		; 43 34
	and ($23.b)		; 32 23
	sty $0F.b		; 84 0F
	bit $FD.b,X		; 34 FD
	sbc ($00.b,X)		; E1 00
	ora ($FD.b,X)		; 01 FD
	rol $84.b		; 26 84
	bit $139E.w,X		; 3C 9E 13
	eor $3F.b,S		; 43 3F
	ora $80FE32.l		; 0F 32 FE 80
	and ($14.b),Y		; 31 14
	eor $41.b,X		; 55 41
	brk $EE.b		; 00 EE
	bit $00.b		; 24 00
	sty $55.b		; 84 55
	cop $27.b		; 02 27
	.db $42, $35		; 42 35
	bvc -34.b		; 50 DE
	eor $74.b		; 45 74
	eor ($54.b,S),Y		; 53 54
	ora ($50.b,X)		; 01 50
	cmp $2ED2.w,X		; DD D2 2E
	sta $3484.w,X		; 9D 84 34
	ora $20E2.w		; 0D E2 20
	cmp ($0E.b),Y		; D1 0E
	ldy $841F.w,X		; BC 1F 84
	cpy $CCF0.w		; CC F0 CC
	cop $F0.b		; 02 F0
	and $32.b,S		; 23 32
	ora $3F3784.l,X		; 1F 84 37 3F
	cpx #$01.b		; E0 01
	ora ($53.b,S),Y		; 13 53
	bit $32.b		; 24 32
	sty $34.b		; 84 34
	and ($53.b,S),Y		; 33 53
	brk $24.b		; 00 24
	and ($0E.b)		; 32 0E
	brk $84.b		; 00 84
	stp		; DB
	bne  30.b		; D0 1E
	cpx #$0E.b		; E0 0E
	sbc ($FB.b)		; F2 FB
	cmp $3F1484.l		; CF 84 14 3F
	cmp ($62.b,S),Y		; D3 62
	asl $21.b		; 06 21
	mvp $A0,$EC		; 44 EC A0
	bit $45.b,X		; 34 45
	eor $45.b,X		; 55 45
	mvn $42,$44		; 54 44 42
	jsl $002184.l		; 22 84 21 00
	and ($ED.b,X)		; 21 ED
	and $34.b,X		; 35 34
	rti		; 40

	cpx #$84.b		; E0 84
	and $2E.b,S		; 23 2E
	cmp $61D33D.l		; CF 3D D3 61
	and ($DC.b,X)		; 21 DC
	stz $34.b,X		; 74 34
	ora ($1C.b),Y		; 11 1C
	lda ($61.b)		; B2 61
	cmp ($1F.b)		; D2 1F
	ora ($84.b)		; 12 84
	nop		; EA
	beq -52.b		; F0 CC
.ACCU 8
.INDEX 8
	sep #$FE		; E2 FE
	beq  16.b		; F0 10
	ora $F094.w,X		; 1D 94 F0
	cop $30.b		; 02 30
	cop $30.b		; 02 30
	ora ($0F.b,X)		; 01 0F
	bit $84.b,X		; 34 84
	rti		; 40

	sbc ($40.b),Y		; F1 40
	brk $10.b		; 00 10
	tsb $40.b		; 04 40
	ora $84.b,S		; 03 84
	phd		; 0B
	pea $3520.w		; F4 20 35
	ora ($30.b),Y		; 11 30
	ldx $8432.w,Y		; BE 32 84
	cmp $3FE043.l,X		; DF 43 E0 3F
	lda $01240D.l,X		; BF 0D 24 01
	stz $2F.b,X		; 74 2F
	lda ($0F.b),Y		; B1 0F
	cop $3D.b		; 02 3D
	cpx $21.b		; E4 21
	and $84.b		; 25 84
	cmp $E021.w,X		; DD 21 E0
	mvp $12,$F0		; 44 F0 12
	mvp $84,$30		; 44 30 84
	cop $10.b		; 02 10
	jsl $113412.l		; 22 12 34 11
	eor $20.b		; 45 20
	sty $02.b		; 84 02
	jsr $FE1F.w		; 20 1F FE
	inc $0D11.w,X		; FE 11 0D
	bit $84.b		; 24 84
	tsa		; 3B
	lda $F0FE.w,X		; BD FE F0
	ora $E00EF1.l		; 0F F1 0E E0
	stz $FD.b,X		; 74 FD
	cmp ($71.b,S),Y		; D3 71
	cop $32.b		; 02 32
	eor $25.b		; 45 25
	.db $62, $74, $CF		; 62 74 CF
	mvp $37,$DD		; 44 DD 37
	eor ($23.b),Y		; 51 23
	jsr $8412.w		; 20 12 84
	jsr $F110.w		; 20 10 F1
	asl $51E2.w		; 0E E2 51
	ora $3F.b,S		; 03 3F
	stz $B3.b		; 64 B3
	adc [$34.b]		; 67 34
	and [$4C.b],Y		; 37 4C
	and [$F3.b],Y		; 37 F3
	adc $0FEF74.l,X		; 7F 74 EF 0F
	eor ($BF.b),Y		; 51 BF
	eor ($11.b,S),Y		; 53 11
	and ($DF.b),Y		; 31 DF
	bra 115.b		; 80 73
	sbc $24EF.w		; ED EF 24
	.db $42, $22		; 42 22
	bpl  14.b		; 10 0E
	sty $E1.b		; 84 E1
	ora $2033EF.l,X		; 1F EF 33 20
	ora ($3F.b)		; 12 3F
	cpy #$84.b		; C0 84
	mvn $35,$02		; 54 02 35
	and ($45.b)		; 32 45
	jsr $4511.w		; 20 11 45
	stz $73.b,X		; 74 73
	cop $32.b		; 02 32
	sbc $65.b,X		; F5 65
	ora $74B1ED.l		; 0F ED B1 74
	jsr $F0C0.w		; 20 C0 F0
	ora ($1B.b,S),Y		; 13 1B
	cmp ($BE.b),Y		; D1 BE
	jsl $770270.l		; 22 70 02 77
	nop		; EA
	cmp #$9E.b		; C9 9E
	jsr $7606.w		; 20 06 76
	bra  69.b		; 80 45
	mvn $44,$33		; 54 33 44
	eor $31.b,S		; 43 31
	inc $7415.w,X		; FE 15 74
	adc $6F92.w,X		; 7D 92 6F
	stz $1442.w,X		; 9E 42 14
	adc $DF.b,S		; 63 DF
	sty $34.b,X		; 94 34
	and ($03.b,X)		; 21 03
	ora ($F0.b),Y		; 11 F0
	brk $12.b		; 00 12
	brk $74.b		; 00 74
	trb $FC.b		; 14 FC
	brk $23.b		; 00 23
	cpx $2C17.w		; EC 17 2C
	lda $1E5474.l,X		; BF 74 54 1E
	sbc ($D9.b),Y		; F1 D9
	stz $3EDF.w		; 9C DF 3E
	sbc $D1FE74.l		; EF 74 FE D1
	lda $1F13.w,X		; BD 13 1F
	and ($46.b,S),Y		; 33 46
	.db $42, $84		; 42 84
	and $22.b,S		; 23 22
	and ($2E.b,S),Y		; 33 2E
	sbc $020E53.l,X		; FF 53 0E 02
	ldy #$43.b		; A0 43
	and ($44.b,S),Y		; 33 44
	eor $44.b,X		; 55 44
	eor $54.b,X		; 55 54
	and ($74.b,S),Y		; 33 74
	bit $43.b,X		; 34 43
	inc $EC36.w,X		; FE 36 EC
	eor ($CF.b,X)		; 41 CF
	ora ($74.b),Y		; 11 74
	xba		; EB
	asl $33.b		; 06 33
	sbc ($33.b),Y		; F1 33
	lda $1154.w,X		; BD 54 11
	stz $10.b,X		; 74 10
	and $ED.b,S		; 23 ED
	bmi  17.b		; 30 11
	and ($2C.b,S),Y		; 33 2C
	lda $0F1084.l,X		; BF 84 10 0F
	sbc $0040F3.l,X		; FF F3 40 00
	bit $41.b		; 24 41
	sty $13.b		; 84 13
	stz $10.b		; 64 10
	ora ($00.b,S),Y		; 13 00
	and $11.b,S		; 23 11
	and ($74.b,X)		; 21 74
	mvp $D2,$3E		; 44 3E D2
	sbc #$C5.b		; E9 C5
	eor ($0E.b,S),Y		; 53 0E
	ldy $E174.w,X		; BC 74 E1
	ora #$9B.b		; 09 9B
	and ($F2.b,X)		; 21 F2
	sbc ($2D.b,X)		; E1 2D
	ldy $FD74.w		; AC 74 FD
	cmp ($1F.b),Y		; D1 1F
	sbc $C2FA33.l,X		; FF 33 FA C2
	eor ($80.b,S),Y		; 53 80
	cmp $EDF0.w		; CD F0 ED
	cpx #$11.b		; E0 11
	ora ($34.b,X)		; 01 34
	eor $84.b,X		; 55 84
	and $42.b,S		; 23 42
	and ($54.b,S),Y		; 33 54
	and $44.b,S		; 23 44
	ora ($23.b),Y		; 11 23
	sty $46.b		; 84 46
	jsr $1F12.w		; 20 12 1F
	inc $00FF.w,X		; FE FF 00
	ora $2FDF74.l		; 0F 74 DF 2F
	lda $FEFC.w,X		; BD FC FE
	inc $0CF2.w		; EE F2 0C
	stz $AD.b,X		; 74 AD
	cmp $BEFF.w,X		; DD FF BE
	and ($FE.b)		; 32 FE
	and $30.b		; 25 30
	sty $12.b		; 84 12
	and ($14.b),Y		; 31 14
	eor ($11.b,X)		; 41 11
	ora ($32.b,X)		; 01 32
	brk $A0.b		; 00 A0
	mvp $44,$44		; 44 44 44
	eor $34.b,S		; 43 34
	mvp $54,$44		; 44 44 54
	bcc 119.b		; 90 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$65.b],Y		; 77 65
	eor $74.b,S		; 43 74
	xce		; FB
	beq  45.b		; F0 2D
	brk $C9.b		; 00 C9
	cmp ($21.b),Y		; D1 21
	ora ($74.b,X)		; 01 74
	tsb $52E3.w		; 0C E3 52
.ACCU 8
	sep #$20		; E2 20
	rol $73.b		; 26 73
	ora ($74.b),Y		; 11 74
	eor [$54.b],Y		; 57 54
	mvp $FE,$32		; 44 32 FE
	cop $34.b		; 02 34
	ora $1374.w		; 0D 74 13
	brk $30.b		; 00 30
	sbc ($61.b,S),Y		; F3 61
.ACCU 8
.INDEX 8
	sep #$FE		; E2 FE
	sbc ($74.b,S),Y		; F3 74
	cmp $0FD2.w,Y		; D9 D2 0F
	inc $D0CC.w		; EE CC D0
	ora ($03.b),Y		; 11 03
	stz $0E.b,X		; 74 0E
	jmp.w [$11CF]		; DC CF 11
	ora $036245.l,X		; 1F 45 62 03
	stz $0F.b,X		; 74 0F
	sbc $21.b		; E5 21
	ora $13.b,S		; 03 13
	eor $5E.b		; 45 5E
	sbc $84.b		; E5 84
	eor ($02.b,X)		; 41 02
	and ($F1.b),Y		; 31 F1
	mvn $2F,$11		; 54 11 2F
	ora ($74.b),Y		; 11 74
	jsr $0E10.w		; 20 10 0E
	brk $F0.b		; 00 F0
	ora ($DC.b,S),Y		; 13 DC
	inc $F074.w,X		; FE 74 F0
	eor $00B0.w		; 4D B0 00
	jsl $0B122E.l		; 22 2E 12 0B
	bra -52.b		; 80 CC
	cmp $32F2ED.l,X		; DF ED F2 32
	lsr $54.b		; 46 54
	eor [$74.b],Y		; 57 74
	eor $342F11.l,X		; 5F 11 2F 34
	and $14FEED.l		; 2F ED FE 14
	stz $63.b,X		; 74 63
	ora ($1F.b)		; 12 1F
	sbc $25FC55.l,X		; FF 55 FC 25
	and ($74.b),Y		; 31 74
	and ($FE.b,X)		; 21 FE
	cmp ($41.b,S),Y		; D3 41
	inc $3123.w,X		; FE 23 31
	ora ($74.b),Y		; 11 74
	ora ($1D.b,S),Y		; 13 1D
	cop $FB.b		; 02 FB
	pea $5210.w		; F4 10 52
	and ($74.b),Y		; 31 74
	and ($EB.b),Y		; 31 EB
	asl $3F.b,X		; 16 3F
	cmp ($41.b,S),Y		; D3 41
	ora ($0F.b),Y		; 11 0F
	stz $21.b,X		; 74 21
	sbc $3D0131.l,X		; FF 31 01 3D
	lda ($40.b),Y		; B1 40
	lda $E2EC74.l,X		; BF 74 EC E2
	asl $3002.w,X		; 1E 02 30
	bit $41.b		; 24 41
	lda $BC2074.l,X		; BF 74 20 BC
	jsl $622211.l		; 22 11 22 62
	adc $53.b,X		; 75 53
	stz $0C.b,X		; 74 0C
	and $53.b,S		; 23 53
	brk $01.b		; 00 01
	and $742E35.l		; 2F 35 2E 74
	sbc $65.b,X		; F5 65
	jsr $CC20.w		; 20 20 CC
	ora ($FE.b,S),Y		; 13 FE
	inc $6470.w,X		; FE 70 64
	lsr $64.b		; 46 64
	mvp $CC,$2E		; 44 2E CC
	dec $74EA.w		; CE EA 74
	ora ($00.b,X)		; 01 00
	bit $00.b,X		; 34 00
	beq -28.b		; F0 E4
	jsl $3F7434.l		; 22 34 74 3F
	pea $5551.w		; F4 51 55
	rti		; 40

	inc $56.b,X		; F6 56
	jsr $EC64.w		; 20 64 EC
	bmi  51.b		; 30 33
	lda $336F67.l,X		; BF 67 6F 33
	lda $BDFD74.l,X		; BF 74 FD BD
	inc $41.b		; E6 41
	cmp ($20.b,X)		; C1 20
	sbc ($32.b)		; F2 32
	stz $12.b,X		; 74 12
	ora $1D51F2.l,X		; 1F F2 51 1D
	beq  31.b		; F0 1F
	and $474060.l		; 2F 60 40 47
	adc [$77.b],Y		; 77 77
	ora #$94.b		; 09 94
	bvs   0.b		; 70 00
	stz $04.b,X		; 74 04
	mvp $05,$1F		; 44 1F 05
	ora ($35.b,X)		; 01 35
	sbc ($1F.b),Y		; F1 1F
	stz $13.b,X		; 74 13
	eor ($35.b,S),Y		; 53 35
	rti		; 40

.ACCU 8
.INDEX 8
	sep #$32		; E2 32
	bpl  86.b		; 10 56
	stz $0C.b		; 64 0C
	ora $BB.b,S		; 03 BB
	ldx $1E1E.w,Y		; BE 1E 1E
	cmp $64D4.w,X		; DD D4 64
	ora ($0D.b,X)		; 01 0D
	cpy $44.b		; C4 44
	sta ($40.b),Y		; 91 40
	trb $10.b		; 14 10
	stz $14.b		; 64 14
	inc A		; 1A
	sty $44.b,X		; 94 44
	bpl  20.b		; 10 14
	eor ($1E.b),Y		; 51 1E
	stz $01.b,X		; 74 01
	ora ($24.b,X)		; 01 24
	ora ($11.b),Y		; 11 11
	ora ($FF.b)		; 12 FF
	and ($74.b,S),Y		; 33 74
	ora $12D0.w,X		; 1D D0 12
	eor $31.b,S		; 43 31
	eor ($E1.b),Y		; 51 E1
	lsr $64.b		; 46 64
	and $3036F7.l		; 2F F7 36 30
	and $33.b,S		; 23 33
	lda $FC7466.l,X		; BF 66 74 FC
	cmp ($01.b),Y		; D1 01
	ora $BC22DE.l		; 0F DE 22 BC
	and $74.b,S		; 23 74
	and $40E4.w		; 2D E4 40
	ora ($02.b,X)		; 01 02
	and ($1F.b)		; 32 1F
	and $74.b		; 25 74
	and $54.b		; 25 54
	xba		; EB
	ora ($31.b),Y		; 11 31
	ora $641FF3.l		; 0F F3 1F 64
	dec $DE.b,X		; D6 DE
	cpx $5E.b		; E4 5E
	cmp ($11.b),Y		; D1 11
	cmp $74D0.w,X		; DD D0 74
	jsr $22D0.w		; 20 D0 22
	asl $2102.w		; 0E 02 21
	ora ($46.b,X)		; 01 46
	stz $11.b,X		; 74 11
	and ($F1.b,S),Y		; 33 F1
	ora ($33.b),Y		; 11 33
	rol $33BF.w,X		; 3E BF 33
	stz $12.b,X		; 74 12
	ora ($21.b),Y		; 11 21
	ora ($FF.b),Y		; 11 FF
	ora ($FF.b),Y		; 11 FF
	bit $64.b		; 24 64
	and $2F.b,X		; 35 2F
	lda $2E.b		; A5 2E
	sbc ($DA.b,X)		; E1 DA
	cpy $10.b		; C4 10
	stz $54.b		; 64 54
	eor ($55.b),Y		; 51 55
	lsr $DDB1.w,X		; 5E B1 DD
	cmp ($0D.b),Y		; D1 0D
	stz $00.b,X		; 74 00
	bit $3E.b		; 24 3E
	trb $30.b		; 14 30
	ora $641D12.l,X		; 1F 12 1D 64
	and ($DE.b,X)		; 21 DE
	ora $DD.b		; 05 DD
	pei ($01.b)		; D4 01
	eor ($D4.b,X)		; 41 D4
	bra  68.b		; 80 44
	and ($21.b)		; 32 21
	bpl  19.b		; 10 13
	mvp $67,$45		; 44 45 67
	stz $31.b,X		; 74 31
	eor $21.b		; 45 21
	trb $32.b		; 14 32
	ora ($2F.b)		; 12 2F
	jsl $E2EC64.l		; 22 64 EC E2
	and $152BE5.l		; 2F E5 2B 15
	inc $649D.w		; EE 9D 64
	bpl  80.b		; 10 50
	eor ($11.b),Y		; 51 11
	cmp $CD01.w,X		; DD 01 CD
	brk $64.b		; 00 64
	brk $40.b		; 00 40
	mvp $15,$14		; 44 14 15
	ora ($E4.b),Y		; 11 E4
	and ($64.b,X)		; 21 64
	eor $56.b,X		; 55 56
	rol $E1FD.w		; 2E FD E1
	cpx $55.b		; E4 55
	jsl $6E5264.l		; 22 64 52 6E
	jsl $12225F.l		; 22 5F 22 12
	.db $62, $EB, $64		; 62 EB 64
	ora $2E.b,X		; 15 2E
	sbc #$DD.b		; E9 DD
	brk $45.b		; 00 45
	jmp.w [$6410]		; DC 10 64
	rti		; 40

	trb $4D14.w		; 1C 14 4D
	eor $D9.b		; 45 D9
	bne   0.b		; D0 00
	stz $C3.b		; 64 C3
	rti		; 40

	bne  71.b		; D0 47
	eor ($11.b),Y		; 51 11
	eor $52.b		; 45 52
	stz $21.b		; 64 21
	and $22.b		; 25 22
	rol $2E.b		; 26 2E
	rol $122E.w		; 2E 2E 12
	stz $23.b,X		; 74 23
	sbc $11F4.w,X		; FD F4 11
	ora $34F010.l		; 0F 10 F0 34
	bra 117.b		; 80 75
	and ($43.b,S),Y		; 33 43
	jsr $2201.w		; 20 01 22
	ora ($45.b)		; 12 45
	stz $DD.b		; 64 DD
	sta $0FCC.w,X		; 9D CC 0F
	bit $04.b,X		; 34 04
	brk $44.b		; 00 44
	stz $21.b,X		; 74 21
	sbc ($02.b,X)		; E1 02
	bit $1F.b,X		; 34 1F
	sbc ($31.b)		; F2 31
	beq 116.b		; F0 74
	and ($1F.b,S),Y		; 33 1F
	ora $33.b,S		; 03 33
	sbc $1115F1.l,X		; FF F1 15 11
	stz $A2.b		; 64 A2
	lsr $22.b,X		; 56 22
.ACCU 8
	sep #$62		; E2 62
	inc $2E66.w		; EE 66 2E
	stz $A2.b		; 64 A2
	eor ($ED.b)		; 52 ED
	ldy $5D.b		; A4 5D
	cpx #$55.b		; E0 55
	sta ($64.b),Y		; 91 64
	trb $5D.b		; 14 5D
	cmp $D010.w,X		; DD 10 D0
	ora ($0C.b,X)		; 01 0C
	tsb $70.b		; 04 70
	asl $4404.w		; 0E 04 44
	jsr $4424.w		; 20 24 44
	ror $66.b		; 66 66
	stz $41.b,X		; 74 41
	ora $122110.l		; 0F 10 21 12
	ora $6401EF.l,X		; 1F EF 01 64
	adc $21.b,X		; 75 21
	and $ED15.w		; 2D 15 ED
	ora $51.b,X		; 15 51
	sbc ($64.b,X)		; E1 64
	cpx $1A.b		; E4 1A
	cmp $1400.w,X		; DD 00 14
	ora $0100.w		; 0D 00 01
	stz $00.b		; 64 00
	eor ($01.b,X)		; 41 01
	ora $1004.w		; 0D 04 10
	trb $41.b		; 14 41
	stz $1D.b		; 64 1D
	ora ($D4.b),Y		; 11 D4
	ora $4401.w,X		; 1D 01 44
	cmp ($14.b),Y		; D1 14
	stz $12.b,X		; 74 12
	bpl  16.b		; 10 10
	and ($21.b),Y		; 31 21
	and $645F10.l,X		; 3F 10 5F 64
.INDEX 8
	sep #$52		; E2 52
.ACCU 8
	sep #$25		; E2 25
	.db $62, $EE, $22		; 62 EE 22
	sbc #$64.b		; E9 64
	ora ($5D.b),Y		; 11 5D
	cpx #$1D.b		; E0 1D
	bne -64.b		; D0 C0
	tsb $D0.b		; 04 D0
	bvc   7.b		; 50 07
	bvs -103.b		; 70 99
	sta $0099.w,Y		; 99 99 00
	ora #$07.b		; 09 07
	stz $02.b,X		; 74 02
	bit $31.b		; 24 31
	ora $111010.l		; 0F 10 10 11
	and ($74.b,X)		; 21 74
	beq  20.b		; F0 14
	ora ($10.b),Y		; 11 10
	ora $1F2111.l,X		; 1F 11 21 1F
	stz $F0.b,X		; 74 F0
	bmi  17.b		; 30 11
	asl $42F1.w,X		; 1E F1 42
	sbc $E1641E.l,X		; FF 1E 64 E1
	eor ($11.b,X)		; 41 11
	ora ($D1.b),Y		; 11 D1
	bne  16.b		; D0 10
	jmp.w [$0064]		; DC 64 00
	eor $CC00.w		; 4D 00 CC
	wai		; CB
	and ($30.b,S),Y		; 33 30
	brk $64.b		; 00 64
	bmi  64.b		; 30 40
	tsb $50.b		; 04 50
	cmp ($04.b),Y		; D1 04
	ora $1D.b,X		; 15 1D
	stz $45.b		; 64 45
	ora $E1.b,X		; 15 E1
	ora ($12.b),Y		; 11 12
	ora $12.b,X		; 15 12
	ora $64.b,X		; 15 64
	adc ($22.b,X)		; 61 22
	jsl $EDEDE2.l		; 22 E2 ED ED
	bpl  29.b		; 10 1D
	stz $01.b		; 64 01
	ora $0001.w		; 0D 01 00
	tsb $10.b		; 04 10
	eor ($11.b,X)		; 41 11
	stz $01.b		; 64 01
	bne  80.b		; D0 50
	ora ($01.b),Y		; 11 01
	pei ($11.b)		; D4 11
	pei ($64.b)		; D4 64
	bpl  17.b		; 10 11
	bpl  20.b		; 10 14
	asl $1D41.w,X		; 1E 41 1D
	cmp ($64.b),Y		; D1 64
	tsb $11.b		; 04 11
	ora $11.b		; 05 11
	ora ($11.b),Y		; 11 11
	ora ($D0.b),Y		; 11 D0
	stz $1D.b		; 64 1D
	sty $40.b,X		; 94 40
	bne  68.b		; D0 44
	ora ($14.b),Y		; 11 14
	eor ($64.b),Y		; 51 64
	asl $1110.w,X		; 1E 10 11
	ora $1D5D.w,X		; 1D 5D 1D
	mvp $64,$1E		; 44 1E 64
	ora $1D.b		; 05 1D
	pei ($14.b)		; D4 14
	ora ($11.b),Y		; 11 11
	ora $6414.w,X		; 1D 14 64
	ora $1E.b,X		; 15 1E
	bpl  30.b		; 10 1E
	ora $1D.b		; 05 1D
	bne  16.b		; D0 10
	stz $5C.b		; 64 5C
	bne  20.b		; D0 14
	tsb $5D.b		; 04 5D
	ora $0101.w,X		; 1D 01 01
	stz $41.b		; 64 41
	ora $D1.b		; 05 D1
	pei ($10.b)		; D4 10
	ora $D145.w,X		; 1D 45 D1
	stz $01.b		; 64 01
	bpl -47.b		; 10 D1
	eor ($1C.b,X)		; 41 1C
	bne  65.b		; D0 41
	ora ($64.b,X)		; 01 64
	eor ($DC.b,X)		; 41 DC
	eor ($D0.b,X)		; 41 D0
	eor $04C0.w		; 4D C0 04
	ora $0064.w		; 0D 64 00
	cpy #$F0.b		; C0 F0
	eor $14.b,S		; 43 14
	cmp ($04.b,X)		; C1 04
	eor $1064.w		; 4D 64 10
	eor $11.b		; 45 11
	.db $42, $51		; 42 51
	sbc ($55.b,X)		; E1 55
	and ($64.b,X)		; 21 64
	rol $1E12.w		; 2E 12 1E
	ora $5E.b,X		; 15 5E
	sbc ($1D.b,X)		; E1 1D
	ora ($54.b),Y		; 11 54
	lda ($21.b),Y		; B1 21
	lda ($91.b,X)		; A1 91
	ora ($90.b,X)		; 01 90
	brk $00.b		; 00 00
	bvc 119.b		; 50 77
	brk $99.b		; 00 99
	brk $09.b		; 00 09
	sta $9099.w,Y		; 99 99 90
	stz $00.b		; 64 00
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	rti		; 40

	trb $10.b		; 14 10
	stz $15.b		; 64 15
	ora ($11.b,X)		; 01 11
	eor ($11.b),Y		; 51 11
	and $11.b		; 25 11
	and ($54.b,X)		; 21 54
	and ($33.b,S),Y		; 33 33
	and ($CB.b)		; 32 CB
	and ($22.b,X)		; 21 22
	jsl $7760AA.l		; 22 AA 60 77
	stz $40.b,X		; 74 40
	tsb $CC99.w		; 0C 99 CC
	cmp #$99.b		; C9 99
	rts		; 60

	sta $99CC.w,Y		; 99 CC 99
	stz $CCCC.w		; 9C CC CC
	cpy #$00.b		; C0 00
	stz $40.b		; 64 40
	mvp $01,$11		; 44 11 01
	bvc  17.b		; 50 11
	ora ($1D.b),Y		; 11 1D
	stz $51.b		; 64 51
	eor $E1.b		; 45 E1
	ora ($21.b),Y		; 11 21
	ora ($E1.b),Y		; 11 E1
	ora ($64.b),Y		; 11 64
	bne  21.b		; D0 15
	cmp ($D0.b),Y		; D1 D0
	trb $D0.b		; 14 D0
	trb $1D.b		; 14 1D
	rts		; 60

	adc [$77.b],Y		; 77 77
	stz $44.b,X		; 74 44
	rti		; 40

	brk $CC.b		; 00 CC
	cpy $9950.w		; CC 50 99
	sta $0990.w,Y		; 99 90 09
	sta $9990.w,Y		; 99 90 99
	sta $4064.w,Y		; 99 64 40
	ora $14.b,S		; 03 14
	cmp ($44.b,X)		; C1 44
	ora $10C4.w,X		; 1D C4 10
	stz $10.b		; 64 10
	trb $10.b		; 14 10
	eor ($11.b),Y		; 51 11
	ora ($11.b),Y		; 11 11
	bpl  84.b		; 10 54
	lda ($12.b)		; B2 12
	ora ($21.b),Y		; 11 21
	rol A		; 2A
	ora ($10.b),Y		; 11 10
	ora ($50.b),Y		; 11 50
	adc [$07.b],Y		; 77 07
	adc [$77.b],Y		; 77 77
	brk $77.b		; 00 77
	brk $77.b		; 00 77
	bvc 112.b		; 50 70
	brk $77.b		; 00 77
	adc [$77.b],Y		; 77 77
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cpy $40C0.w		; CC C0 40
	tsb $44.b		; 04 44
	eor [$77.b]		; 47 77
	adc [$64.b],Y		; 77 64
	ora ($01.b,X)		; 01 01
	eor ($0D.b,X)		; 41 0D
	bpl  16.b		; 10 10
	trb $D0.b		; 14 D0
	bit $74.b,X		; 34 74
	mvp $44,$34		; 44 34 44
	mvp $44,$34		; 44 34 44
	mvp $77,$60		; 44 60 77
	adc [$77.b],Y		; 77 77
	stz $44.b,X		; 74 44
	mvp $77,$47		; 44 47 77
	bvc 119.b		; 50 77
	adc [$77.b],Y		; 77 77
	ora [$77.b]		; 07 77
	adc [$77.b],Y		; 77 77
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   7.b		; 50 07
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$00.b],Y		; 77 00
	ora [$50.b]		; 07 50
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	rts		; 60

	mvp $44,$44		; 44 44 44
	adc [$77.b],Y		; 77 77
	adc [$44.b],Y		; 77 44
	mvp $77,$60		; 44 60 77
	stz $47.b,X		; 74 47
	adc [$74.b],Y		; 77 74
	mvp $44,$44		; 44 44 44
	bvc 112.b		; 50 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	adc [$50.b],Y		; 77 50
	adc [$77.b],Y		; 77 77
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	ora [$77.b]		; 07 77
	rts		; 60

	mvp $44,$44		; 44 44 44
	mvp $77,$44		; 44 44 77
	adc [$77.b],Y		; 77 77
	rts		; 60

	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$74.b],Y		; 77 74
	eor [$77.b]		; 47 77
	mvn $01,$1A		; 54 1A 01
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   9.b		; 50 09
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $F054.w,Y		; 99 54 F0
	beq -16.b		; F0 F0
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	mvp $44,$44		; 44 44 44
	mvp $44,$44		; 44 44 44
	eor [$74.b]		; 47 74
	rts		; 60

	mvp $77,$77		; 44 77 77
	adc [$77.b],Y		; 77 77
	mvp $44,$47		; 44 47 44
	mvn $10,$10		; 54 10 10
	bpl  25.b		; 10 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $07.b		; 00 07
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	sta $0F54.w,Y		; 99 54 0F
	ora $000070.l		; 0F 70 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 05FFFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 05FFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 05FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 05FFFF. Skipping.
.ENDS
